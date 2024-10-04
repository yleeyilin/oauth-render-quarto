FROM quay.io/oauth2-proxy/oauth2-proxy

COPY email_list.txt /site_config/
COPY build /app/

ENTRYPOINT ["/bin/oauth2-proxy", \
            "--provider", "github", \
            "--upstream", "file:///app/#/", \
            "--authenticated-emails-file", "/site_config/email_list.txt", \
            "--scope=user:email,read:org", \
            "--cookie-expire=0h0m30s", \
            "--skip-provider-button=true"]
