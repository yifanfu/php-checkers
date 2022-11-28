FROM composer:2.4.4

ENV COMPOSER_HOME=/opt/composer

# Install grumphp
RUN composer global config --no-plugins allow-plugins.phpro/grumphp true
RUN composer global require -n phpro/grumphp

# Install phpcs
RUN composer global require -n squizlabs/php_codesniffer=*

# Install phpstan
RUN composer global require -n phpstan/phpstan-phpunit

# Install Symfony CLI
RUN apk add --no-cache bash && \
    curl -1sLf 'https://dl.cloudsmith.io/public/symfony/stable/setup.alpine.sh' | bash && \
    apk add symfony-cli

# Add composer bin to the PATH
ENV PATH="${COMPOSER_HOME}/vendor/bin:$PATH"

# This will be the directory for application code to map to
WORKDIR /code
