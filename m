Received: from mail-pf1-f174.google.com (mail-pf1-f174.google.com [209.85.210.174])
 by mx.groups.io with SMTP id smtpd.web08.5253.1619377182358759353
 for <openembedded-core@lists.openembedded.org>;
 Sun, 25 Apr 2021 11:59:42 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20161025 header.b=TCy9V1en;
 spf=pass (domain: gmail.com, ip: 209.85.210.174, mailfrom: akuster808@gmail.com)
Received: by mail-pf1-f174.google.com with SMTP id c19so1609815pfv.2
        for <openembedded-core@lists.openembedded.org>; Sun, 25 Apr 2021 11:59:42 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=subject:to:references:from:autocrypt:message-id:date:user-agent
         :mime-version:in-reply-to:content-transfer-encoding:content-language;
        bh=BrpGfSHQ8jUto3/pPw3e/1hCyHDdf3KnICBqBeIPvh8=;
        b=TCy9V1enH5ButLOSBePHn7Tt8DiGpJKkTIy4e+wRuIdTWRO7a6LI1V6L3xbL5LZ7ef
         MeKr3pXw7gHWhMkFu0EHMR6XaPzJAm4I98o2sLkdh8yPZI/RcKwU59in+hKiH0UxHsqA
         Yyg3Wj/kc2OtDH4SG6x8pQ7d1/ty6XV2lqQngCuWGx5dJNgGd/q25oN1uILioN4FAguE
         h5MfsoGNe/cwlQ4GTFjRQfSct6qkYlTKcsJA7zDZNZ9x0gH23fqzfNDF4E5dhl/VUXuN
         ik8zYWSD/CN9givhUFeTQvZW/ASH88Jb4vuWzfrAAbDKUw8Fqtnnr1hq/gi8E2TSRur1
         5YTQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:subject:to:references:from:autocrypt:message-id
         :date:user-agent:mime-version:in-reply-to:content-transfer-encoding
         :content-language;
        bh=BrpGfSHQ8jUto3/pPw3e/1hCyHDdf3KnICBqBeIPvh8=;
        b=Yb0mgOxdx/AlPr1k2mmOqBJdmmYEZ6wM6aStJYX/lSlQ563shsawXMiRiYE9aEsXp9
         nsvIxacMM04igUeAWBmhQ7o5qwwmjAM74zo5Av6pBAQDut87z328Z4X3X22WX282GPlS
         8jswpM49CrkqD+pOqlYjxvmv6R7PMDdq0zs0bVG4I4ZZK4GwAQNpi9GxB6WWwFSRPrOe
         7KyCOwGf+4Ug0JHMw7FyWFtAaclGX8cRMzl2TVnqMevDvT/VH5CNcVxnPSzAx8IM0ScQ
         KT+71B10hTL3si+MwTayNb08tOnB69Uyv42OK+H3W78ezyLkTVVn85wNGgeV3TqAr/U9
         G9BA==
X-Gm-Message-State: AOAM533yLIBW0thtw2uF9tskRaIFOxSycHU8QQ12dndsLwmkOMtSpY7W
	nF4G7HcnKWEO7L2X3Nqb1ZGMc2VDuhiVLw==
X-Google-Smtp-Source: ABdhPJxSiN5rfrWmLKP/jHUrh/S3Ogzarf7uRFntArSfXKV2f6kRddakBqHRKMLqRgKiCqdNbqge1A==
X-Received: by 2002:a62:920d:0:b029:25d:102a:f0a4 with SMTP id o13-20020a62920d0000b029025d102af0a4mr13836000pfd.37.1619377181703;
        Sun, 25 Apr 2021 11:59:41 -0700 (PDT)
Return-Path: <akuster808@gmail.com>
Received: from ?IPv6:2601:202:4180:a5c0:880e:6a48:f6c3:8404? ([2601:202:4180:a5c0:880e:6a48:f6c3:8404])
        by smtp.gmail.com with ESMTPSA id o30sm9501262pgc.55.2021.04.25.11.59.40
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Sun, 25 Apr 2021 11:59:41 -0700 (PDT)
Subject: Re: [PATCH] apt: Fix build on musl when seccomp is enabled
To: Khem Raj <raj.khem@gmail.com>, openembedded-core@lists.openembedded.org
References: <20210425160100.2731765-1-raj.khem@gmail.com>
From: "Armin Kuster" <akuster808@gmail.com>
Autocrypt: addr=akuster808@gmail.com; prefer-encrypt=mutual; keydata=
 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
 8CS2NxU=
Message-ID: <d637fdcc-76bb-dfb3-0a13-a1c31ce05f92@gmail.com>
Date: Sun, 25 Apr 2021 11:59:40 -0700
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.10.0
MIME-Version: 1.0
In-Reply-To: <20210425160100.2731765-1-raj.khem@gmail.com>
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: 7bit
Content-Language: en-US



On 4/25/21 9:01 AM, Khem Raj wrote:
> Signed-off-by: Khem Raj <raj.khem@gmail.com>
> Cc: Armin Kuster <akuster808@gmail.com>
> ---
>  ...atat64-and-prlimit64-defines-on-musl.patch | 48 +++++++++++++++++++
>  meta/recipes-devtools/apt/apt_2.2.2.bb        |  1 +
>  2 files changed, 49 insertions(+)
>  create mode 100644 meta/recipes-devtools/apt/apt/0001-Hide-fstatat64-and-prlimit64-defines-on-musl.patch
>
> diff --git a/meta/recipes-devtools/apt/apt/0001-Hide-fstatat64-and-prlimit64-defines-on-musl.patch b/meta/recipes-devtools/apt/apt/0001-Hide-fstatat64-and-prlimit64-defines-on-musl.patch
> new file mode 100644
> index 0000000000..f1816836b5
> --- /dev/null
> +++ b/meta/recipes-devtools/apt/apt/0001-Hide-fstatat64-and-prlimit64-defines-on-musl.patch
> @@ -0,0 +1,48 @@
> +From e849b161ce1d87ab369b921438abcf5b3a03e186 Mon Sep 17 00:00:00 2001
> +From: Khem Raj <raj.khem@gmail.com>
> +Date: Sun, 25 Apr 2021 08:57:03 -0700
> +Subject: [PATCH] Hide fstatat64 and prlimit64 defines on musl
> +
> +musl defines fstatat64 and prlimit64 as macros which confuses the
> +seccomp sysall rewiring since there are syscalls with same names

Thanks. This builds now.

-armin
> +
> +Upstream-Status: Pending
> +Signed-off-by: Khem Raj <raj.khem@gmail.com>
> +---
> + methods/aptmethod.h | 12 ++++++++++--
> + 1 file changed, 10 insertions(+), 2 deletions(-)
> +
> +diff --git a/methods/aptmethod.h b/methods/aptmethod.h
> +index bd50e80..3085aed 100644
> +--- a/methods/aptmethod.h
> ++++ b/methods/aptmethod.h
> +@@ -121,6 +121,12 @@ protected:
> +       if (ctx == NULL)
> + 	 return _error->FatalE("HttpMethod::Configuration", "Cannot init seccomp");
> + 
> ++#ifndef __GLIBC__
> ++#pragma push_macro("fstatat64")
> ++#pragma push_macro("prlimit64")
> ++#undef fstatat64
> ++#undef prlimit64
> ++#endif
> + #define ALLOW(what)                                                     \
> +    if ((rc = seccomp_rule_add(ctx, SCMP_ACT_ALLOW, SCMP_SYS(what), 0))) \
> +       return _error->FatalE("HttpMethod::Configuration", "Cannot allow %s: %s", #what, strerror(-rc));
> +@@ -320,9 +326,11 @@ protected:
> + 	 if ((rc = seccomp_rule_add(ctx, SCMP_ACT_ALLOW, seccomp_syscall_resolve_name(custom.c_str()), 0)))
> + 	    return _error->FatalE("aptMethod::Configuration", "Cannot allow %s: %s", custom.c_str(), strerror(-rc));
> +       }
> +-
> + #undef ALLOW
> +-
> ++#ifndef __GLIBC__
> ++#pragma pop_macro("fstatat64")
> ++#pragma pop_macro("prlimit64")
> ++#endif
> +       rc = seccomp_load(ctx);
> +       if (rc == -EINVAL)
> +       {
> +-- 
> +2.31.1
> +
> diff --git a/meta/recipes-devtools/apt/apt_2.2.2.bb b/meta/recipes-devtools/apt/apt_2.2.2.bb
> index 7d1bce558d..27bc1c75fd 100644
> --- a/meta/recipes-devtools/apt/apt_2.2.2.bb
> +++ b/meta/recipes-devtools/apt/apt_2.2.2.bb
> @@ -12,6 +12,7 @@ SRC_URI = "${DEBIAN_MIRROR}/main/a/apt/${BPN}_${PV}.tar.xz \
>             file://0001-CMakeLists.txt-avoid-changing-install-paths-based-on.patch \
>             file://0001-srvrec-Keep-support-for-older-resolver.patch \
>             file://0001-cmake-Do-not-build-po-files.patch \
> +           file://0001-Hide-fstatat64-and-prlimit64-defines-on-musl.patch \
>             "
>  
>  SRC_URI_append_class-native = " \

