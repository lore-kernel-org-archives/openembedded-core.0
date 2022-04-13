Return-Path: <richard.purdie@linuxfoundation.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 0B576C47080
	for <webhook@archiver.kernel.org>; Thu, 14 Apr 2022 16:03:53 +0000 (UTC)
Received: from mail-wm1-f54.google.com (mail-wm1-f54.google.com
 [209.85.128.54])
 by mx.groups.io with SMTP id smtpd.web12.1548.1649871899675776489
 for <openembedded-core@lists.openembedded.org>;
 Wed, 13 Apr 2022 10:45:00 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@linuxfoundation.org header.s=google header.b=ZriIJ0HF;
 spf=pass (domain: linuxfoundation.org, ip: 209.85.128.54,
 mailfrom: richard.purdie@linuxfoundation.org)
Received: by mail-wm1-f54.google.com with SMTP id r64so1555530wmr.4
        for <openembedded-core@lists.openembedded.org>;
 Wed, 13 Apr 2022 10:44:59 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linuxfoundation.org; s=google;
        h=message-id:subject:from:to:cc:date:in-reply-to:references
         :user-agent:mime-version:content-transfer-encoding;
        bh=decOzDH4zYsrj7ZgZYLWCS8lhbZml7xUN2vEyBCt0I0=;
        b=ZriIJ0HFwSfA3C/xCOeQEGFoLgTb87bL3idTGquAZC8E2PTOmeTt92cMOqPLbzswqx
         RvOCJpQEl09jpmk0b+EQVKj1aQHjnoaYkHcmpm20HwZ7/kNtpAPlIdPZ6Ad/ZlVe406Y
         HT10yvHU1UTThCggQnNPQe0KPI2kGzrcnhlWA=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:message-id:subject:from:to:cc:date:in-reply-to
         :references:user-agent:mime-version:content-transfer-encoding;
        bh=decOzDH4zYsrj7ZgZYLWCS8lhbZml7xUN2vEyBCt0I0=;
        b=SjdobkpdPx/Fadh3DXofzdgEI1eY6yXUP3btLGVqOl9bHJf+qYuYGCbQilVf3LrPL2
         yFyqCcvxtB5RA+vY9KoIeQTovbK5jFgQyMqZFI19RU90t02QtzXD+BY2GBVcAbcggKOF
         +vnNsCe09XyTISX0cCo+UM2/SiefIvYrvbqdYt69vSAZ0utQpsrWsyi+Yvm2SF26WBoS
         hAHq29YG0BQM5A9fZ5igoBYbhVqM17ZU6MruXDfOaGdwUzMKKw5IIPXk2q8IeVP4ktH1
         7ZW5EJbzyW1nyROAL/DDEDMFwoZoQ/e47d20TeAzS87fpLnWDQec/tNS3jY8sGqhtFwy
         HJhA==
X-Gm-Message-State: AOAM531Mo2LQDPBVvoQCj4GKb5V2ZA03RKJlCNIlac+Lwuk4GiuLViHC
	+X55qNC07N/vzD9cN+VzLPpLnA==
X-Google-Smtp-Source: 
 ABdhPJwdjO+Xk7dPEdQyDEMyiWAxtK9MQVpSAh87XhGyzOwCe4CJ7W6SeH6ocKKDL2U+yTAjnifDvw==
X-Received: by 2002:a05:600c:3511:b0:38c:d035:cddb with SMTP id
 h17-20020a05600c351100b0038cd035cddbmr51443wmq.74.1649871898067;
        Wed, 13 Apr 2022 10:44:58 -0700 (PDT)
Received: from ?IPv6:2001:8b0:aba:5f3c:5cc2:b4ab:4d4b:907d?
 ([2001:8b0:aba:5f3c:5cc2:b4ab:4d4b:907d])
        by smtp.gmail.com with ESMTPSA id
 s7-20020a5d6a87000000b00207aad420c4sm6769586wru.101.2022.04.13.10.44.56
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 13 Apr 2022 10:44:57 -0700 (PDT)
Message-ID: 
 <8c3060148a98b280c93b7eb5da65699f1c6745aa.camel@linuxfoundation.org>
Subject: Re: [OE-core] [PATCH v2] license: add 'any_incompatible' function
From: Richard Purdie <richard.purdie@linuxfoundation.org>
To: Christopher Larson <kergoth@gmail.com>,
	openembedded-core@lists.openembedded.org
Cc: Christopher Larson <chris_larson@mentor.com>
Date: Wed, 13 Apr 2022 18:44:53 +0100
In-Reply-To: <20220413160033.8456-1-kergoth@gmail.com>
References: <20220413160033.8456-1-kergoth@gmail.com>
Content-Type: text/plain; charset="UTF-8"
User-Agent: Evolution 3.40.4-1ubuntu2 
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Thu, 14 Apr 2022 16:03:53 -0000
X-Groupsio-URL: 
 https://lists.openembedded.org/g/openembedded-core/message/164351

On Wed, 2022-04-13 at 16:00 +0000, Christopher Larson wrote:
> This function returns True if any of the specified packages are skipped due to
> incompatible license.
> 
> License exceptions are obeyed. The user may specify the package's license for
> cross-recipe checks.
> 
> This allows for additions to packagegroups only for non-incompatible builds. For
> example:
> 
>     RDEPENDS_${PN} += "${@'dbench' if not any_incompatible(d, 'dbench', 'GPL-3.0-only') else ''}"
> 
> Signed-off-by: Christopher Larson <chris_larson@mentor.com>
> ---
>  meta/classes/license.bbclass                  | 38 +++++++++++++++++++
>  .../packagegroups/packagegroup-base.bb        |  2 +
>  2 files changed, 40 insertions(+)
> 
> v2 changes: fixed string packages logic, corrected reference to
> apply_pkg_license_exception, and avoided use of ${@} in the function docstring
> to avoid bitbake expanding it and recursing.
> 
> diff --git a/meta/classes/license.bbclass b/meta/classes/license.bbclass
> index 0c637e966e..41993b7227 100644
> --- a/meta/classes/license.bbclass
> +++ b/meta/classes/license.bbclass
> @@ -320,6 +320,44 @@ def incompatible_license(d, dont_want_licenses, package=None):
>  
>      return incompatible_pkg_license(d, dont_want_licenses, license)
>  
> +def any_incompatible(d, packages, licensestring=None):
> +    """Return True if any of the packages are skipped due to incompatible license.
> +
> +    License exceptions are obeyed. The user may specify the package's license
> +    for cross-recipe checks.
> +
> +    This allows for additions to packagegroups only for non-incompatible builds.
> +
> +    For example: 'dbench' if not any_incompatible(d, 'dbench', 'GPL-3.0-only') else ''
> +    """
> +    import oe.license
> +
> +    if isinstance(packages, str):
> +        packages = packages.split()
> +
> +    bad_licenses = (d.getVar("INCOMPATIBLE_LICENSE") or "").split()
> +    if not bad_licenses:
> +        return False
> +    bad_licenses = expand_wildcard_licenses(d, bad_licenses)
> +
> +    if licensestring is None:
> +        licensestring = d.getVar("LICENSE:%s" % package) if package else None
> +        if not licensestring:
> +            licensestring = d.getVar("LICENSE")
> +
> +    exceptions = (d.getVar("INCOMPATIBLE_LICENSE_EXCEPTIONS") or "").split()
> +    for pkg in packages:
> +        remaining_bad_licenses = oe.license.apply_pkg_license_exception(
> +            pkg, bad_licenses, exceptions
> +        )
> +
> +        incompatible_lic = incompatible_pkg_license(
> +            d, remaining_bad_licenses, licensestring
> +        )
> +        if incompatible_lic:
> +            return True
> +    return False
> +
>  def check_license_flags(d):
>      """
>      This function checks if a recipe has any LICENSE_FLAGS that
> diff --git a/meta/recipes-core/packagegroups/packagegroup-base.bb b/meta/recipes-core/packagegroups/packagegroup-base.bb
> index 7489ef61b0..1c97d03c21 100644
> --- a/meta/recipes-core/packagegroups/packagegroup-base.bb
> +++ b/meta/recipes-core/packagegroups/packagegroup-base.bb
> @@ -14,6 +14,8 @@ PACKAGES = ' \
>              packagegroup-distro-base \
>              packagegroup-machine-base \
>              \
> +            ${@"dbench" if not any_incompatible(d, "dbench", "GPL-3.0-only") else ""} \
> +            \
>              ${@bb.utils.contains("MACHINE_FEATURES", "acpi", "packagegroup-base-acpi", "",d)} \
>              ${@bb.utils.contains("MACHINE_FEATURES", "alsa", "packagegroup-base-alsa", "", d)} \
>              ${@bb.utils.contains("MACHINE_FEATURES", "apm", "packagegroup-base-apm", "", d)} \

I suspect you didn't mean to include this piece since dbench isn't in core?

Cheers,

Richard


