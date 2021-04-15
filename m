Received: from mail-qt1-f177.google.com (mail-qt1-f177.google.com [209.85.160.177])
 by mx.groups.io with SMTP id smtpd.web12.3436.1618468526217092806
 for <openembedded-core@lists.openembedded.org>;
 Wed, 14 Apr 2021 23:35:26 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20161025 header.b=jANwJLm7;
 spf=pass (domain: gmail.com, ip: 209.85.160.177, mailfrom: raj.khem@gmail.com)
Received: by mail-qt1-f177.google.com with SMTP id f12so17430939qtf.2
        for <openembedded-core@lists.openembedded.org>; Wed, 14 Apr 2021 23:35:26 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=nFQTHO1slFSdkBLnjEUuLJtPDEH0hzwZo9Rc8aOdlZM=;
        b=jANwJLm7mtQscwGUp/T9uTJ+uHMXMNhmdyMujYkpKqfMyIbAoajns9GLRlFoDkp4X3
         Dpg94cmK43VLeoAVfQwTVfwWHZFgfMh6FMtHSGqEFrxuMQfJneVGvfzxE2B1xpDP5AjB
         l5RneTpYynvgJYa+v9iII/92TRES878DOQQjEUEynbnhZWbgQ/hov0iKMB3qDkOoBbqT
         cZYuptSlurIQDFI3Mbr+CmgnPV0TbcVZ9nkvx2Mvvb/UZtGv2td1Tgvxs3vJq0rB8NBD
         bmt2sQ1pSthUjdtooUtDlgz2myITtTFlibi2prgv45W/pU7pSV4pgvPsap4t5gAgOOVI
         YmnA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=nFQTHO1slFSdkBLnjEUuLJtPDEH0hzwZo9Rc8aOdlZM=;
        b=Fb4z6619YTyAUrk1JFoF44NU/eKEtTDRHIQAV+CMujZmu/GO+LUvXXlFXcTypC/fxs
         hXp1P5uOVC+9pzE3KgT7h8xnTWrzWsTLuRDiYk/n/AHRlpFGffYm5sDU99tbJ9z7W9Lz
         hanOFOCZAGaINoLc3UgfQIcUwGVKT/IvkXgG1kcW7sZ7bc/vV5jHcrnMo3zMFHhPUBOh
         m7DuxkqpV7MUi8hKEfOGMLT6SIlcewUlZOuVPEfs/TMTInmJh0tF+vb7bH9oGKlSw/JX
         iI/dhdAWCVF7AyB3dCigyiZo4HjEgYCcZv9eYdOHib6kHyHdTFTnkVzCKUEEygmSOT4p
         HV9Q==
X-Gm-Message-State: AOAM531rLxgx3DkBHaYU/P/4BBfBpY/YjtlUFe8ocwFu6yWXM/cC3/Zt
	iGLlgQU3ZUBE3suQpVQOlnPVZvwWs8XVpEvVb/Y=
X-Google-Smtp-Source: ABdhPJwVSqwK19NC7H1flAJ+iRmFofrvCUs9XgQFi5ekN7Szmm0HGMWuOJ3inQhB3/14+q/wvl5OIShy+5SvlebmWZA=
X-Received: by 2002:ac8:7ef9:: with SMTP id r25mr1656923qtc.369.1618468525314;
 Wed, 14 Apr 2021 23:35:25 -0700 (PDT)
MIME-Version: 1.0
References: <1618466841-24292-1-git-send-email-wangmy@fujitsu.com>
In-Reply-To: <1618466841-24292-1-git-send-email-wangmy@fujitsu.com>
From: "Khem Raj" <raj.khem@gmail.com>
Date: Wed, 14 Apr 2021 23:34:59 -0700
Message-ID: <CAMKF1sq8v+JCUCq3omDQF7B30YQu1i6DGBfExvpkGSMpi6ErfA@mail.gmail.com>
Subject: Re: [OE-core] [PATCH] icu: upgrade 68.2 -> 69.1
To: wangmy <wangmy@fujitsu.com>
Cc: Patches and discussions about the oe-core layer <openembedded-core@lists.openembedded.org>
Content-Type: text/plain; charset="UTF-8"

On Wed, Apr 14, 2021 at 11:08 PM wangmy <wangmy@fujitsu.com> wrote:
>
> refresh 0001-icu-Added-armeb-support.patch
>
> Signed-off-by: Wang Mingyu <wangmy@fujitsu.com>
> ---
>  .../icu/icu/0001-icu-Added-armeb-support.patch              | 6 +++---
>  meta/recipes-support/icu/{icu_68.2.bb => icu_69.1.bb}       | 5 ++---
>  2 files changed, 5 insertions(+), 6 deletions(-)
>  rename meta/recipes-support/icu/{icu_68.2.bb => icu_69.1.bb} (95%)
>
> diff --git a/meta/recipes-support/icu/icu/0001-icu-Added-armeb-support.patch b/meta/recipes-support/icu/icu/0001-icu-Added-armeb-support.patch
> index 145efc0e01..c5dc0611c2 100644
> --- a/meta/recipes-support/icu/icu/0001-icu-Added-armeb-support.patch
> +++ b/meta/recipes-support/icu/icu/0001-icu-Added-armeb-support.patch
> @@ -13,7 +13,7 @@ Signed-off-by: Lei Maohui <leimaohui@cn.fujitsu.com>
>   1 file changed, 1 insertion(+), 1 deletion(-)
>
>  diff --git a/i18n/double-conversion-utils.h b/i18n/double-conversion-utils.h
> -index 8c6a0e1..cf89907 100644
> +index c937463..feaad0f 100644
>  --- a/i18n/double-conversion-utils.h
>  +++ b/i18n/double-conversion-utils.h
>  @@ -115,7 +115,7 @@ int main(int argc, char** argv) {
> @@ -24,7 +24,7 @@ index 8c6a0e1..cf89907 100644
>  +    defined(__arm__) || defined(__avr32__) || defined(_M_ARM) || defined(_M_ARM64) || \
>       defined(__hppa__) || defined(__ia64__) || \
>       defined(__mips__) || \
> -     defined(__nios2__) || \
> +     defined(__nios2__) || defined(__ghs) || \
>  --
> -2.7.4
> +2.25.1
>
> diff --git a/meta/recipes-support/icu/icu_68.2.bb b/meta/recipes-support/icu/icu_69.1.bb
> similarity index 95%
> rename from meta/recipes-support/icu/icu_68.2.bb
> rename to meta/recipes-support/icu/icu_69.1.bb
> index 1ca87feee4..b79acba0cc 100644
> --- a/meta/recipes-support/icu/icu_68.2.bb
> +++ b/meta/recipes-support/icu/icu_69.1.bb
> @@ -106,14 +106,13 @@ SRC_URI = "${BASE_SRC_URI};name=code \
>             ${DATA_SRC_URI};name=data \
>             file://filter.json \
>             file://fix-install-manx.patch \
> -           file://0001-icu-Added-armeb-support.patch \

I think we should not be deleting the patch from SRC_URI

>             "
>
>  SRC_URI_append_class-target = "\
>             file://0001-Disable-LDFLAGSICUDT-for-Linux.patch \
>            "
> -SRC_URI[code.sha256sum] = "c79193dee3907a2199b8296a93b52c5cb74332c26f3d167269487680d479d625"
> -SRC_URI[data.sha256sum] = "2989b466fa010edc41297e12fdd5ae47c2610ad68b63af1a0bd2a1acfaf497f3"
> +SRC_URI[code.sha256sum] = "4cba7b7acd1d3c42c44bb0c14be6637098c7faf2b330ce876bc5f3b915d09745"
> +SRC_URI[data.sha256sum] = "4fc2d8cfc3343673123586fca3967404abd4e346fba5515829204533b3bae4bf"
>
>  UPSTREAM_CHECK_REGEX = "icu4c-(?P<pver>\d+(_\d+)+)-src"
>  UPSTREAM_CHECK_URI = "https://github.com/unicode-org/icu/releases"
> --
> 2.25.1
>
>
> 
>
