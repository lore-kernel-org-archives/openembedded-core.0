Received: from mail-qv1-f46.google.com (mail-qv1-f46.google.com [209.85.219.46])
 by mx.groups.io with SMTP id smtpd.web09.9021.1618580503397393469
 for <openembedded-core@lists.openembedded.org>;
 Fri, 16 Apr 2021 06:41:43 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20161025 header.b=XT8OcJRv;
 spf=pass (domain: gmail.com, ip: 209.85.219.46, mailfrom: raj.khem@gmail.com)
Received: by mail-qv1-f46.google.com with SMTP id i3so7873841qvj.7
        for <openembedded-core@lists.openembedded.org>; Fri, 16 Apr 2021 06:41:43 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=xMXxyMvMqtFZtHFmGXJbP7qgI+iKPibQuEoE3Da4yvA=;
        b=XT8OcJRvBAkgQkMjUj79iIaWrZzsp339upSqGxlATrMvHfkxddeWbqHQDG42qulImt
         dKMR63m/FIe556oBvUUPCetmir3fV17wlgKuP6ahhnftHt90Vr9Xqodm51jHpb+1GFVw
         rkmfY/uhyr9YfkzEGriKNHszuQGndFVxm51oO76LlcCorwiFeY5qBUyTAdkI1XQhSx/U
         K6G3HkchjFCIYMCnAzBMAAbhR0pwos1kEnBdyaiPgSxyfVNqifa1yxqfPD32nFQ1zwPU
         +xAvxBxD2+L6uiK+jUt6KyYR3coQeFZV6Exyg5NUfzY31EvXjkhSv/xvOInM5qWXc4s/
         nhEQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=xMXxyMvMqtFZtHFmGXJbP7qgI+iKPibQuEoE3Da4yvA=;
        b=hHti3EcxsDn7L1W1pTlYsN2kDLFDt3jQ+ht7FbbepXjHklTcAPRc1d5tu2YFo6YFy6
         vn+Tq2s27/e35v0u0UZ0/q6ydKpbysscmKNewtT2DThk3ttY0Jt93+nSWXlp1xWbXnr8
         PRFuEwFlpDJ8dHF0eTaqzBwe0525Xj72NLv/PY/15PNKVBDfxQ20y1b44ETDauDavJND
         IQgFkE72chwmbMXVlGQKtHDqr/eWgDwjysGOZGEJWVnrY3pOEArDXcOc3AGIqT3/Q1kI
         s9QX/9uHkyZMG89zbXxG2lJg5WoKWgnt/8jELnAqh4ihvjXjjGjQG51TpqD3D79aEBtv
         KHqA==
X-Gm-Message-State: AOAM533iPSlYCSOl0z+MH05+ypXgS3xHmR7zAO8lbrPg43ZMuLo3qMWg
	lHhr4UPvcUech8RV+Pr0P+i9wVf5BIftwauPnheVK/vWn7Q=
X-Google-Smtp-Source: ABdhPJyLxJuIaFG30IE7h1pM2E83+IInrzgrOyZQB0fgwa5HGdMkuK26ErLPTpDTuSHEGtHGsIkM0Nkqb6ByOh/ApuM=
X-Received: by 2002:a0c:8148:: with SMTP id 66mr8437375qvc.55.1618580502481;
 Fri, 16 Apr 2021 06:41:42 -0700 (PDT)
MIME-Version: 1.0
References: <1618475536-24802-1-git-send-email-wangmy@fujitsu.com>
In-Reply-To: <1618475536-24802-1-git-send-email-wangmy@fujitsu.com>
From: "Khem Raj" <raj.khem@gmail.com>
Date: Fri, 16 Apr 2021 06:41:15 -0700
Message-ID: <CAMKF1sqw+sCh_TbOL+pP2TMpkaT6GhMWNJnczpFgNh8fNnJH6A@mail.gmail.com>
Subject: Re: [OE-core] [PATCH v2] icu: upgrade 68.2 -> 69.1
To: wangmy <wangmy@fujitsu.com>
Cc: Patches and discussions about the oe-core layer <openembedded-core@lists.openembedded.org>
Content-Type: text/plain; charset="UTF-8"

i think thls build failure is related

On Thu, Apr 15, 2021 at 1:32 AM wangmy <wangmy@fujitsu.com> wrote:
>
> refresh 0001-icu-Added-armeb-support.patch
>
> Signed-off-by: Wang Mingyu <wangmy@fujitsu.com>
> ---
>  .../icu/icu/0001-icu-Added-armeb-support.patch              | 6 +++---
>  meta/recipes-support/icu/{icu_68.2.bb => icu_69.1.bb}       | 4 ++--
>  2 files changed, 5 insertions(+), 5 deletions(-)
>  rename meta/recipes-support/icu/{icu_68.2.bb => icu_69.1.bb} (96%)
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
> similarity index 96%
> rename from meta/recipes-support/icu/icu_68.2.bb
> rename to meta/recipes-support/icu/icu_69.1.bb
> index 1ca87feee4..bfeea8d2f0 100644
> --- a/meta/recipes-support/icu/icu_68.2.bb
> +++ b/meta/recipes-support/icu/icu_69.1.bb
> @@ -112,8 +112,8 @@ SRC_URI = "${BASE_SRC_URI};name=code \
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
