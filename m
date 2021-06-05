Received: from mail-wr1-f45.google.com (mail-wr1-f45.google.com [209.85.221.45])
 by mx.groups.io with SMTP id smtpd.web09.12831.1622903731509031008
 for <openembedded-core@lists.openembedded.org>;
 Sat, 05 Jun 2021 07:35:31 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@linuxfoundation.org header.s=google header.b=Yq5b7GS8;
 spf=pass (domain: linuxfoundation.org, ip: 209.85.221.45, mailfrom: richard.purdie@linuxfoundation.org)
Received: by mail-wr1-f45.google.com with SMTP id i94so7124387wri.4
        for <openembedded-core@lists.openembedded.org>; Sat, 05 Jun 2021 07:35:31 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linuxfoundation.org; s=google;
        h=message-id:subject:from:to:date:in-reply-to:references:user-agent
         :mime-version:content-transfer-encoding;
        bh=cnS55M3LAzt9rryz1kCRqEPAMkD/XtX0vagN69PUous=;
        b=Yq5b7GS8OHVBTIxBQQrYUuuXW2zJJ72/fA34hRkin4y3MpwdyKndynxf1+GiQ0gAcU
         a+Pl1MCitdZ/iUtssXkzFLwxsgkpfIBcXffHGC+ncwpqxttHWlfYCwxyVHw0fsU96/Na
         u6Rolggt/Q7p1Vl35tpG7ihor/QLv4iFKlZus=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:message-id:subject:from:to:date:in-reply-to
         :references:user-agent:mime-version:content-transfer-encoding;
        bh=cnS55M3LAzt9rryz1kCRqEPAMkD/XtX0vagN69PUous=;
        b=TQoWcDlwC61808w/YtTZDMC+EFDiLItPYZt/wubVB+yfT8BS6XyBjFUsagNLuSjHCe
         1pl/sn5ez++kPy/dHHRTR24LVCZ7/x9E3BdpwdBNqCsGhiYOUlB7ZF25gSdIhkYM+Xxq
         pWwWRWLT5+1zBu8Fco05PajWVQv4ErpFtZf2mog3zXY3Re1WyEp7BhHXadX0Me85hxCk
         0jsZ3++QqS5qj0p9mSN2STrv2g++OdsgzYxer2IEcy1/zDCPHy/MHlmlFCzLSBOCGoUo
         TyyyYGtPxyHqza4mh8FQlNiarHe47Q+eN4VuYQgepyfk2/lWY6wk+Q+NYTzyckwAMNtm
         Of+Q==
X-Gm-Message-State: AOAM530fRLv9HXIX9XKwN2jqolJWH2xsfqvddDABF+DjAVVzRcE95+SZ
	LMwbvxiorH4DoNKF77BfX7EZdA==
X-Google-Smtp-Source: ABdhPJy1kiF32lUkdzSbPpleY3mERH3oJtL+5sx/c138QulQR7PQGOu0zs57TfSraqBZYryw6EGzpA==
X-Received: by 2002:a5d:540a:: with SMTP id g10mr8964117wrv.254.1622903729957;
        Sat, 05 Jun 2021 07:35:29 -0700 (PDT)
Return-Path: <richard.purdie@linuxfoundation.org>
Received: from ?IPv6:2001:8b0:aba:5f3c:5b89:f6cd:8040:62ea? ([2001:8b0:aba:5f3c:5b89:f6cd:8040:62ea])
        by smtp.gmail.com with ESMTPSA id f13sm9868817wrt.86.2021.06.05.07.35.29
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 05 Jun 2021 07:35:29 -0700 (PDT)
Message-ID: <fc580d2b69824029e148dd73ccf4df651a599db9.camel@linuxfoundation.org>
Subject: Re: [OE-core] [PATCH 04/10] cmake: update 3.20.2 -> 3.20.3
From: "Richard Purdie" <richard.purdie@linuxfoundation.org>
To: Alexander Kanavin <alex.kanavin@gmail.com>, 
	openembedded-core@lists.openembedded.org
Date: Sat, 05 Jun 2021 15:35:26 +0100
In-Reply-To: <20210604091458.1381144-4-alex.kanavin@gmail.com>
References: <20210604091458.1381144-1-alex.kanavin@gmail.com>
	 <20210604091458.1381144-4-alex.kanavin@gmail.com>
User-Agent: Evolution 3.40.0-1 
MIME-Version: 1.0
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 8bit

On Fri, 2021-06-04 at 11:14 +0200, Alexander Kanavin wrote:
> Signed-off-by: Alexander Kanavin <alex.kanavin@gmail.com>
> ---
>  .../cmake/{cmake-native_3.20.2.bb => cmake-native_3.20.3.bb}    | 0
>  meta/recipes-devtools/cmake/cmake.inc                           | 2 +-
>  .../recipes-devtools/cmake/{cmake_3.20.2.bb => cmake_3.20.3.bb} | 0
>  3 files changed, 1 insertion(+), 1 deletion(-)
>  rename meta/recipes-devtools/cmake/{cmake-native_3.20.2.bb => cmake-native_3.20.3.bb} (100%)
>  rename meta/recipes-devtools/cmake/{cmake_3.20.2.bb => cmake_3.20.3.bb} (100%)
> 
> diff --git a/meta/recipes-devtools/cmake/cmake-native_3.20.2.bb b/meta/recipes-devtools/cmake/cmake-native_3.20.3.bb
> similarity index 100%
> rename from meta/recipes-devtools/cmake/cmake-native_3.20.2.bb
> rename to meta/recipes-devtools/cmake/cmake-native_3.20.3.bb
> diff --git a/meta/recipes-devtools/cmake/cmake.inc b/meta/recipes-devtools/cmake/cmake.inc
> index be43760628..0987c01c87 100644
> --- a/meta/recipes-devtools/cmake/cmake.inc
> +++ b/meta/recipes-devtools/cmake/cmake.inc
> @@ -21,7 +21,7 @@ SRC_URI = "https://cmake.org/files/v${CMAKE_MAJOR_VERSION}/cmake-${PV}.tar.gz \
>             file://0004-Fail-silently-if-system-Qt-installation-is-broken.patch \
>  "
>  
> 
> 
> 
> -SRC_URI[sha256sum] = "aecf6ecb975179eb3bb6a4a50cae192d41e92b9372b02300f9e8f1d5f559544e"
> +SRC_URI[sha256sum] = "4d008ac3461e271fcfac26a05936f77fc7ab64402156fb371d41284851a651b8"
>  
> 
> 
> 
>  UPSTREAM_CHECK_REGEX = "cmake-(?P<pver>\d+(\.\d+)+)\.tar"
>  
> 
> 
> 
> diff --git a/meta/recipes-devtools/cmake/cmake_3.20.2.bb b/meta/recipes-devtools/cmake/cmake_3.20.3.bb
> similarity index 100%
> rename from meta/recipes-devtools/cmake/cmake_3.20.2.bb
> rename to meta/recipes-devtools/cmake/cmake_3.20.3.bb

Seems there is some intermittent issue that the cmake upgrade brings in:

https://autobuilder.yoctoproject.org/typhoon/#/builders/60/builds/3509/steps/13/logs/stdio
https://autobuilder.yoctoproject.org/typhoon/#/builders/48/builds/3513/steps/12/logs/stdio

yet the latter passed in:

https://autobuilder.yoctoproject.org/typhoon/#/builders/48/builds/3514

Cheers,

Richard


