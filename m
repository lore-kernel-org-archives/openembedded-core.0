Return-Path: <mikko.rapeli@linaro.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 90D4CC07E9D
	for <webhook@archiver.kernel.org>; Tue, 27 Sep 2022 10:44:23 +0000 (UTC)
Received: from mail-pj1-f50.google.com (mail-pj1-f50.google.com
 [209.85.216.50])
 by mx.groups.io with SMTP id smtpd.web09.9381.1664275458997248260
 for <openembedded-core@lists.openembedded.org>;
 Tue, 27 Sep 2022 03:44:19 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@linaro.org header.s=google header.b=f+PmdwdU;
 spf=pass (domain: linaro.org, ip: 209.85.216.50,
 mailfrom: mikko.rapeli@linaro.org)
Received: by mail-pj1-f50.google.com with SMTP id p14so6278258pjd.3
        for <openembedded-core@lists.openembedded.org>;
 Tue, 27 Sep 2022 03:44:18 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:from:to:cc:subject:date;
        bh=4SPMU1g0o8opATia+ero1LDP7RBGyNC6Q79jaiCtz/w=;
        b=f+PmdwdUT7ok/ZsuFfyFpqbVaN3nfjiayOgJXTqWDPkb+gsNqkw6T89XpHVmrXHXjF
         GhBwpcXAA4wGBizbw2H44blrsHwEDLdX/AecMRi6s2mZmqgwj7CqeiaJHec1chvgta0E
         itlxomZd93Y0N6v6LaOXiYVw+DrJMymsUJxyXlYcAKDstwIiXX7/j7IjhaX287Jy9ZSf
         1A/GQQwuCOn6m1g/S8vUSsOqgKwgvZER8rBKV/+JHzWwdu69s/XHYMVkrjT3a4o9ax4b
         +oyyo5picc2Cg8V453Bhv87MQmBdwN3p/kVeOwNDoU2TTO8jGudVtfXRdmGH/fOiei7T
         7aUQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-message-state:from:to:cc:subject:date;
        bh=4SPMU1g0o8opATia+ero1LDP7RBGyNC6Q79jaiCtz/w=;
        b=fGs529EpaqSfqMdVaUVBViCd2jUAQUWHfY4Iq5fazieLoQbo4n8gTH1obDpbC/uXxI
         8xShJ+ULTacn8x31VJocecGPgwrD1eXiU5X26ix0nbPYT//N7OTsPId7ep6MtbfaNhzg
         zqYcfpgpyEk5Dd11F09sEZeMF7GiCoZ4DgtapVfFWW0MZc8RZc7Vph2AsROZ5CK+GjIA
         8B/QihEAf+kSuUY6AnQUBVbmeKaI91eFo8tULFezntqW3asVPcVetGGAAXc0Nk0TnBvD
         2SX6eBtAf3mmeEEFNhgnoPUbpgDFdzGBW7OjZhu6KqByHqFOZL9h0YsKKnPDgXcgJ7xf
         Bj3Q==
X-Gm-Message-State: ACrzQf2+8mEdRpRihy2FrHOozLXUD8Kbd/1MZNn1k2tbNtUHCGldjapV
	MwIBQS70N1XNq6jc5K8S0yfwcKXXDqqDTie/ZbHpKg==
X-Google-Smtp-Source: 
 AMsMyM63uGv2ozhBI75laD+5IxDrRpQ5A9KZ94bRN7TdUkSiCfa7SctuzsYl+dv97oqQG8VpxSv+Bwb+rMHMjagVePw=
X-Received: by 2002:a17:902:ced0:b0:178:9bd4:b730 with SMTP id
 d16-20020a170902ced000b001789bd4b730mr27139193plg.36.1664275458282; Tue, 27
 Sep 2022 03:44:18 -0700 (PDT)
MIME-Version: 1.0
References: <20220927101449.26828-1-Qi.Chen@windriver.com>
In-Reply-To: <20220927101449.26828-1-Qi.Chen@windriver.com>
From: Mikko Rapeli <mikko.rapeli@linaro.org>
Date: Tue, 27 Sep 2022 13:44:37 +0300
Message-ID: 
 <CAJFpGrM0aGrrTdO3cm5zQVkj-W6889ct9_+c4TcKF1VxUgde_Q@mail.gmail.com>
Subject: Re: [OE-core][master][kirkstone][PATCH] openssl: export
 OPENSSL_MODULES in SDK
To: Chen Qi <Qi.Chen@windriver.com>
Cc: openembedded-core@lists.openembedded.org
Content-Type: text/plain; charset="UTF-8"
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Tue, 27 Sep 2022 10:44:23 -0000
X-Groupsio-URL: 
 https://lists.openembedded.org/g/openembedded-core/message/171093

Hi,

On Tue, 27 Sept 2022 at 13:15, Chen Qi <Qi.Chen@windriver.com> wrote:
>
> In current SDK, when running the following command in python
> shell, we get an error.
>
> $ python3
> >>> from cryptography.hazmat.backends import openssl
>
> The error message is as below:
>
>   cryptography.exceptions.InternalError: Unknown OpenSSL error.
>
> We could set OPENSSL_MODULES explicitly in nativesdk-openssl package
> so that when SDK is set up, it's in environment and we can
> get rid of the above error.
>
> Signed-off-by: Chen Qi <Qi.Chen@windriver.com>
> ---
>  meta/recipes-connectivity/openssl/files/environment.d-openssl.sh | 1 +
>  1 file changed, 1 insertion(+)
>
> diff --git a/meta/recipes-connectivity/openssl/files/environment.d-openssl.sh b/meta/recipes-connectivity/openssl/files/environment.d-openssl.sh
> index b9cc24a7ac..1a03556f3b 100644
> --- a/meta/recipes-connectivity/openssl/files/environment.d-openssl.sh
> +++ b/meta/recipes-connectivity/openssl/files/environment.d-openssl.sh
> @@ -1 +1,2 @@
>  export OPENSSL_CONF="$OECORE_NATIVE_SYSROOT/usr/lib/ssl/openssl.cnf"
> +export OPENSSL_MODULES="$OECORE_NATIVE_SYSROOT/usr/lib/ossl-modules/"

Also needs SSL_CERT_DIR, SSL_CERT_FILE and OPENSSL_ENGINES variables to be set.

Sadly all these are needed for openssl to work correctly.

Cheers,

-Mikko

