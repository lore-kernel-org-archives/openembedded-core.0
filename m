Received: from mail-qt1-f169.google.com (mail-qt1-f169.google.com [209.85.160.169])
 by mx.groups.io with SMTP id smtpd.web12.3603.1608688464534495407
 for <openembedded-core@lists.openembedded.org>;
 Tue, 22 Dec 2020 17:54:24 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20161025 header.b=HyowiQHL;
 spf=pass (domain: gmail.com, ip: 209.85.160.169, mailfrom: raj.khem@gmail.com)
Received: by mail-qt1-f169.google.com with SMTP id z9so10391687qtn.4
        for <openembedded-core@lists.openembedded.org>; Tue, 22 Dec 2020 17:54:24 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=Fs9E4AJQgElQyEnrGgbnZ45tE7Fvl7rx8wIuRU4QFaw=;
        b=HyowiQHLtKcdYJkSZ5+h6Fd0ycfu/HUZ/EfldDWbkMGhsAb58LWnkh3S53vxksybC+
         dbXeebE+tUiMS5lEaE+2A3ujZcPqDQcMUFWIx2PrebyRUUHaQkuhiJ25gYjLaZ20fqcG
         zhoXEyJbE42bWbcODwsKzcveRadU0Y3OAYCMAcDRDP32HIH3x4sbmo/TyUZiLxpncvxb
         219o5hUqYzoDst6Me0D6kbgyXX60GjnqKIIOhKd36z3vmWBLlLoyKe79ciKBWKhFowY/
         iPqnIyH6Qenl38f3HM7P5eAJhE/cuK8xhuMwGE2Ct868d0QKG7tQ8gl64AGAUGaaN1+P
         qfjg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=Fs9E4AJQgElQyEnrGgbnZ45tE7Fvl7rx8wIuRU4QFaw=;
        b=gyZAfPXR2V5LHBPkKptaSSs6zMsN4/l5vKluk+fHKAIQ5gXyHg4mDq380EByCHHidX
         leV1qvK8aSbfosvFiRTyKCW0pIKYaVkssgOwoTeowUtVYI4RnqC7ArrYjw5IBqhO7F8u
         JYPSH3IFgsTyQbQiZjMxzHSVCZFhvORSPsqMEr+/37KQUJ6h5NpRZ4P3MwKlC0T9R1wh
         an8AMJib04JUeYX3uqbsqhkS29vWY8pgYQGbSUab0qqSHetHrioa3H3ZdYhtvEHoYYNY
         DLFz2aIi0XjK0LTtsOJR6GM8QuXKPN5+9z+tP9EIKqpQuNK4I8fAtn31Hz1ix1GUdYcS
         2NyA==
X-Gm-Message-State: AOAM532Ib6gOhVQnUVU69N6KRhVX1UDHNZz+HeEVNVIak47bVT+XOdLW
	M53gFOk6bfdNBBQIJF6CsTzZii9FxHbjPNCaW0c=
X-Google-Smtp-Source: ABdhPJzpxi31CijcDiFVj8No0m95IDBO6QhBsy9oX4AL1EkTaRZfhW2FAWm3nO3Sca6wPSoWXT6CIxDiJKlIcCUPcQ0=
X-Received: by 2002:a05:622a:1c3:: with SMTP id t3mr24049334qtw.378.1608688463644;
 Tue, 22 Dec 2020 17:54:23 -0800 (PST)
MIME-Version: 1.0
References: <AM0PR08MB361713C43176BFA1C7295477C5C20@AM0PR08MB3617.eurprd08.prod.outlook.com>
 <820250ef6b128796337fb4a730097a3aa80528d7.camel@linuxfoundation.org>
In-Reply-To: <820250ef6b128796337fb4a730097a3aa80528d7.camel@linuxfoundation.org>
From: "Khem Raj" <raj.khem@gmail.com>
Date: Tue, 22 Dec 2020 17:53:56 -0800
Message-ID: <CAMKF1so=HXKOc0uqaWLVDu8fvQVBYms2W-N2y0S2vBSuPBYnHg@mail.gmail.com>
Subject: Re: [OE-core] [yocto-security] [PATCH] openssl: drop support for deprecated algorithms
To: Richard Purdie <richard.purdie@linuxfoundation.org>
Cc: Shachar Menashe <shachar@vdoo.com>, 
	openembedded-core <openembedded-core@lists.openembedded.org>
Content-Type: text/plain; charset="UTF-8"

so there are some build failures seen due to this change on meta-oe
here is sample.

https://errors.yoctoproject.org/Errors/Build/113701/

On Sat, Dec 19, 2020 at 9:36 AM Richard Purdie
<richard.purdie@linuxfoundation.org> wrote:
>
> The OE-Core list needs to be included on this so I'm doing so.
>
> Cheers,
>
> Richard
>
>
>
> ---------- Forwarded message ----------
> From: Shachar Menashe <shachar@vdoo.com>
> To: "yocto-security@lists.yoctoproject.org" <yocto-security@lists.yoctoproject.org>
> Cc:
> Bcc:
> Date: Sat, 19 Dec 2020 16:04:30 +0000
> Subject: [yocto-security] [PATCH] openssl: drop support for deprecated algorithms
> 1. Drop support for many deprecated algorithms by default
> 2. Allow dropping support for TLS 1.0/1.1 via PACKAGECONFIG
>
> Signed-off-by: Shachar Menashe <shachar@vdoo.com>
> ---
>  meta/recipes-connectivity/openssl/openssl_1.1.1g.bb | 8 +++++++-
>  1 file changed, 7 insertions(+), 1 deletion(-)
>
> diff --git a/meta/recipes-connectivity/openssl/openssl_1.1.1g.bb b/meta/recipes-connectivity/openssl/openssl_1.1.1g.bb
> index 8159558..f9764bd 100644
> --- a/meta/recipes-connectivity/openssl/openssl_1.1.1g.bb
> +++ b/meta/recipes-connectivity/openssl/openssl_1.1.1g.bb
> @@ -33,6 +33,8 @@ PACKAGECONFIG_class-native = ""
>  PACKAGECONFIG_class-nativesdk = ""
>
>  PACKAGECONFIG[cryptodev-linux] = "enable-devcryptoeng,disable-devcryptoeng,cryptodev-linux,,cryptodev-module"
> +PACKAGECONFIG[no-tls1] = "no-tls1"
> +PACKAGECONFIG[no-tls1_1] = "no-tls1_1"
>
>  B = "${WORKDIR}/build"
>  do_configure[cleandirs] = "${B}"
> @@ -52,6 +54,10 @@ EXTRA_OECONF_class-nativesdk = "--with-rand-seed=os,devrandom"
>  CFLAGS_append_class-native = " -DOPENSSLDIR=/not/builtin -DENGINESDIR=/not/builtin"
>  CFLAGS_append_class-nativesdk = " -DOPENSSLDIR=/not/builtin -DENGINESDIR=/not/builtin"
>
> +# Disable deprecated crypto algorithms
> +# Retained for compatibilty - des (curl), dh (python-ssl), dsa (rpm)
> +DEPRECATED_CRYPTO_FLAGS = " no-ssl no-idea no-psk no-rc2 no-rc4 no-rc5 no-md2 no-md4 no-srp no-camellia no-bf no-mdc2 no-scrypt no-seed no-siphash no-sm2 no-sm3 no-sm4 no-whirlpool"
> +
>  do_configure () {
>         os=${HOST_OS}
>         case $os in
> @@ -122,7 +128,7 @@ do_configure () {
>         # WARNING: do not set compiler/linker flags (-I/-D etc.) in EXTRA_OECONF, as they will fully replace the
>         # environment variables set by bitbake. Adjust the environment variables instead.
>         HASHBANGPERL="/usr/bin/env perl" PERL=perl PERL5LIB="${S}/external/perl/Text-Template-1.46/lib/" \
> -       perl ${S}/Configure ${EXTRA_OECONF} ${PACKAGECONFIG_CONFARGS} --prefix=$useprefix --openssldir=${libdir}/ssl-1.1 --libdir=${libdir} $target
> +       perl ${S}/Configure ${EXTRA_OECONF} ${PACKAGECONFIG_CONFARGS} ${DEPRECATED_CRYPTO_FLAGS} --prefix=$useprefix --openssldir=${libdir}/ssl-1.1 --libdir=${libdir} $target
>         perl ${B}/configdata.pm --dump
>  }
>
> --
> 2.17.1
>
> 
>
