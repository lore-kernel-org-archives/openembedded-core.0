Return-Path: <akuster808@gmail.com>
Received: from mail-pl0-f67.google.com (mail-pl0-f67.google.com
	[209.85.160.67])
	by mail.openembedded.org (Postfix) with ESMTP id E038A7867C
	for <openembedded-core@lists.openembedded.org>;
	Wed, 22 Nov 2017 18:00:45 +0000 (UTC)
Received: by mail-pl0-f67.google.com with SMTP id v15so1162592plk.11
	for <openembedded-core@lists.openembedded.org>;
	Wed, 22 Nov 2017 10:00:47 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=subject:to:references:from:message-id:date:user-agent:mime-version
	:in-reply-to:content-transfer-encoding:content-language;
	bh=O5Niizl1pVaESP5Ip5JHj+EgebD2bo/jPrDOeQIPzrY=;
	b=DLFTbK452JRbj5sF3aThGExkKQcSNeIzBqoigxsaTPVkDFPTPyFvqqfcnhWn7sCUwJ
	aZz966ij6R3zF2fKC+An4/0BYAEuLoP/GLhEq0u1nnMlupqTWsgRPFODg5Bvm8fwqPJL
	bwVUrAkGRQkPLQ5UVvM6GiAnFC10vHLVmF3UQmE+bXhdJOxL9/EJxkNalQmQA8XKcpMg
	ljzmIWBTdFdNuE3cdzgTsp5T6g6d954LPhOJUmAHOUtMWJ3L2GRxAjVmAeSU4Jzu29Qk
	CVxDfZYdKHBOIG/e2mgqgm0RPBNxt83YjI78jXgWBHgBfZWO57JB0lByLivn5uc0/gZR
	gVgw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:subject:to:references:from:message-id:date
	:user-agent:mime-version:in-reply-to:content-transfer-encoding
	:content-language;
	bh=O5Niizl1pVaESP5Ip5JHj+EgebD2bo/jPrDOeQIPzrY=;
	b=sN2KCHfxsVEFOPLTgomQJ2yyIWqI+FHMP+SLPtuC8Y62MCDVfD+We/vgo4Kk3ZmwEX
	n4QZMvTR7R3R6b/vVDMznMr78bYH7ROfTdAAeJ1LbwgNza0rcjfAy/ZVdzJxA28QvvPa
	kLrMwq+WkGkZ6pFpI6NYZRriP3lsUa/iLqYdMfdXXp3eovBxxkk/EsFPdsLHAS8IsUen
	cL3chbZxAxjsWIpEosewsY5/yShXDz5qbgdth7EFeCFTPqBnbWGhENw5n61OKu0wm761
	eIbhOOSVh2XxNGMpVi5ahigAMusQDgxSENhR9C8OucTFCsvhmKkqo/C/mIGsba6R0+E2
	0T9g==
X-Gm-Message-State: AJaThX6//6TYhOED3Ms0ByYyPzTfP0lqn/qlN79t/8l21UjZli9xD4vq
	QdPu3TlviEtUilSULPTuXS/tBg==
X-Google-Smtp-Source: AGs4zMYu54jtKpw+/Z14hAc8o3ExqWN5JGNxixyCXE4LhLb3O+CkGA2tvCDwPInzK0Pht8lUV78/VA==
X-Received: by 10.84.172.1 with SMTP id m1mr22511121plb.345.1511373646625;
	Wed, 22 Nov 2017 10:00:46 -0800 (PST)
Received: from ?IPv6:2601:202:4001:9ea0:c65:4f7d:b066:1a80?
	([2601:202:4001:9ea0:c65:4f7d:b066:1a80])
	by smtp.gmail.com with ESMTPSA id
	y79sm4245045pfb.113.2017.11.22.10.00.45
	(version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
	Wed, 22 Nov 2017 10:00:46 -0800 (PST)
To: Ross Burton <ross.burton@intel.com>,
	openembedded-core@lists.openembedded.org
References: <20171122175147.31931-1-ross.burton@intel.com>
From: akuster808 <akuster808@gmail.com>
Message-ID: <f0a57698-56b3-d430-221b-ea8dec8cd827@gmail.com>
Date: Wed, 22 Nov 2017 10:00:45 -0800
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:52.0) Gecko/20100101
	Thunderbird/52.4.0
MIME-Version: 1.0
In-Reply-To: <20171122175147.31931-1-ross.burton@intel.com>
Subject: Re: [PATCH][morty] fontconfig: Fix namespace conflicts with glibc
X-BeenThere: openembedded-core@lists.openembedded.org
X-Mailman-Version: 2.1.12
Precedence: list
List-Id: Patches and discussions about the oe-core layer
	<openembedded-core.lists.openembedded.org>
List-Unsubscribe: <http://lists.openembedded.org/mailman/options/openembedded-core>,
	<mailto:openembedded-core-request@lists.openembedded.org?subject=unsubscribe>
List-Archive: <http://lists.openembedded.org/pipermail/openembedded-core/>
List-Post: <mailto:openembedded-core@lists.openembedded.org>
List-Help: <mailto:openembedded-core-request@lists.openembedded.org?subject=help>
List-Subscribe: <http://lists.openembedded.org/mailman/listinfo/openembedded-core>,
	<mailto:openembedded-core-request@lists.openembedded.org?subject=subscribe>
X-List-Received-Date: Wed, 22 Nov 2017 18:00:46 -0000
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: 7bit
Content-Language: en-US



On 11/22/2017 09:51 AM, Ross Burton wrote:
> From: Khem Raj <raj.khem@gmail.com>
>
> glibc 2.25 will come with TS 18661-1 macro definitions in limits.h which ends with following errors
>
> | ../../fontconfig-2.12.1/src/fcmatch.c:324:63: error: 'PRI_CHAR_WIDTH_STRONG' undeclared here (not in a function)
> |  #define FC_OBJECT(NAME, Type, Cmp) { FC_##NAME##_OBJECT, Cmp, PRI_##NAME##_STRONG, PRI_##NAME##_WEAK },
> |                                                                ^
> | ../../fontconfig-2.12.1/src/fcobjs.h:54:1: note: in expansion of macro 'FC_OBJECT'
> |  FC_OBJECT (CHAR_WIDTH,  FcTypeInteger, NULL)
> |  ^~~~~~~~~
> | ../../fontconfig-2.12.1/src/fcmatch.c:324:84: error: 'PRI_CHAR_WIDTH_WEAK' undeclared here (not in a function)
> |  #define FC_OBJECT(NAME, Type, Cmp) { FC_##NAME##_OBJECT, Cmp, PRI_##NAME##_STRONG, PRI_##NAME##_WEAK },
> |                                                                                     ^
> | ../../fontconfig-2.12.1/src/fcobjs.h:54:1: note: in expansion of macro 'FC_OBJECT'
> |  FC_OBJECT (CHAR_WIDTH,  FcTypeInteger, NULL)
> |  ^~~~~~~~~
> | make[3]: *** [Makefile:632: fcmatch.lo] Error 1
>
> (From OE-Core rev: 3575826752e7140da493c7f560fb5fcf483fc9b4)
>
> Signed-off-by: Khem Raj <raj.khem@gmail.com>
> Signed-off-by: Ross Burton <ross.burton@intel.com>
> Signed-off-by: Richard Purdie <richard.purdie@linuxfoundation.org>
merged.

thanks
- armin
> ---
>  ...icts-with-integer-width-macros-from-TS-18.patch | 72 ++++++++++++++++++++++
>  .../fontconfig/fontconfig_2.12.1.bb                |  1 +
>  2 files changed, 73 insertions(+)
>  create mode 100644 meta/recipes-graphics/fontconfig/fontconfig/0001-Avoid-conflicts-with-integer-width-macros-from-TS-18.patch
>
> diff --git a/meta/recipes-graphics/fontconfig/fontconfig/0001-Avoid-conflicts-with-integer-width-macros-from-TS-18.patch b/meta/recipes-graphics/fontconfig/fontconfig/0001-Avoid-conflicts-with-integer-width-macros-from-TS-18.patch
> new file mode 100644
> index 00000000000..cad71707adc
> --- /dev/null
> +++ b/meta/recipes-graphics/fontconfig/fontconfig/0001-Avoid-conflicts-with-integer-width-macros-from-TS-18.patch
> @@ -0,0 +1,72 @@
> +From 20cddc824c6501c2082cac41b162c34cd5fcc530 Mon Sep 17 00:00:00 2001
> +From: Khem Raj <raj.khem@gmail.com>
> +Date: Sun, 11 Dec 2016 14:32:00 -0800
> +Subject: [PATCH] Avoid conflicts with integer width macros from TS
> + 18661-1:2014
> +
> +glibc 2.25+ has now defined these macros in <limits.h>
> +https://sourceware.org/git/?p=glibc.git;a=commit;h=5b17fd0da62bf923cb61d1bb7b08cf2e1f1f9c1a
> +
> +Signed-off-by: Khem Raj <raj.khem@gmail.com>
> +---
> +Upstream-Status: Submitted
> +
> + fontconfig/fontconfig.h | 2 +-
> + src/fcobjs.h            | 2 +-
> + src/fcobjshash.gperf    | 2 +-
> + src/fcobjshash.h        | 2 +-
> + 4 files changed, 4 insertions(+), 4 deletions(-)
> +
> +Index: fontconfig-2.12.1/fontconfig/fontconfig.h
> +===================================================================
> +--- fontconfig-2.12.1.orig/fontconfig/fontconfig.h
> ++++ fontconfig-2.12.1/fontconfig/fontconfig.h
> +@@ -128,7 +128,8 @@ typedef int		FcBool;
> + #define FC_USER_CACHE_FILE	    ".fonts.cache-" FC_CACHE_VERSION
> + 
> + /* Adjust outline rasterizer */
> +-#define FC_CHAR_WIDTH	    "charwidth"	/* Int */
> ++#define FC_CHARWIDTH	    "charwidth"	/* Int */
> ++#define FC_CHAR_WIDTH	    FC_CHARWIDTH
> + #define FC_CHAR_HEIGHT	    "charheight"/* Int */
> + #define FC_MATRIX	    "matrix"    /* FcMatrix */
> + 
> +Index: fontconfig-2.12.1/src/fcobjs.h
> +===================================================================
> +--- fontconfig-2.12.1.orig/src/fcobjs.h
> ++++ fontconfig-2.12.1/src/fcobjs.h
> +@@ -51,7 +51,7 @@ FC_OBJECT (DPI,			FcTypeDouble,	NULL)
> + FC_OBJECT (RGBA,		FcTypeInteger,	NULL)
> + FC_OBJECT (SCALE,		FcTypeDouble,	NULL)
> + FC_OBJECT (MINSPACE,		FcTypeBool,	NULL)
> +-FC_OBJECT (CHAR_WIDTH,		FcTypeInteger,	NULL)
> ++FC_OBJECT (CHARWIDTH,		FcTypeInteger,	NULL)
> + FC_OBJECT (CHAR_HEIGHT,		FcTypeInteger,	NULL)
> + FC_OBJECT (MATRIX,		FcTypeMatrix,	NULL)
> + FC_OBJECT (CHARSET,		FcTypeCharSet,	FcCompareCharSet)
> +Index: fontconfig-2.12.1/src/fcobjshash.gperf
> +===================================================================
> +--- fontconfig-2.12.1.orig/src/fcobjshash.gperf
> ++++ fontconfig-2.12.1/src/fcobjshash.gperf
> +@@ -44,7 +44,7 @@ int id;
> + "rgba",FC_RGBA_OBJECT
> + "scale",FC_SCALE_OBJECT
> + "minspace",FC_MINSPACE_OBJECT
> +-"charwidth",FC_CHAR_WIDTH_OBJECT
> ++"charwidth",FC_CHARWIDTH_OBJECT
> + "charheight",FC_CHAR_HEIGHT_OBJECT
> + "matrix",FC_MATRIX_OBJECT
> + "charset",FC_CHARSET_OBJECT
> +Index: fontconfig-2.12.1/src/fcobjshash.h
> +===================================================================
> +--- fontconfig-2.12.1.orig/src/fcobjshash.h
> ++++ fontconfig-2.12.1/src/fcobjshash.h
> +@@ -284,7 +284,7 @@ FcObjectTypeLookup (register const char
> +       {(int)(long)&((struct FcObjectTypeNamePool_t *)0)->FcObjectTypeNamePool_str43,FC_CHARSET_OBJECT},
> +       {-1},
> + #line 47 "fcobjshash.gperf"
> +-      {(int)(long)&((struct FcObjectTypeNamePool_t *)0)->FcObjectTypeNamePool_str45,FC_CHAR_WIDTH_OBJECT},
> ++      {(int)(long)&((struct FcObjectTypeNamePool_t *)0)->FcObjectTypeNamePool_str45,FC_CHARWIDTH_OBJECT},
> + #line 48 "fcobjshash.gperf"
> +       {(int)(long)&((struct FcObjectTypeNamePool_t *)0)->FcObjectTypeNamePool_str46,FC_CHAR_HEIGHT_OBJECT},
> + #line 55 "fcobjshash.gperf"
> diff --git a/meta/recipes-graphics/fontconfig/fontconfig_2.12.1.bb b/meta/recipes-graphics/fontconfig/fontconfig_2.12.1.bb
> index 115f558eefa..8616154c616 100644
> --- a/meta/recipes-graphics/fontconfig/fontconfig_2.12.1.bb
> +++ b/meta/recipes-graphics/fontconfig/fontconfig_2.12.1.bb
> @@ -22,6 +22,7 @@ DEPENDS = "expat freetype zlib"
>  
>  SRC_URI = "http://fontconfig.org/release/fontconfig-${PV}.tar.gz \
>             file://revert-static-pkgconfig.patch \
> +           file://0001-Avoid-conflicts-with-integer-width-macros-from-TS-18.patch \
>             "
>  SRC_URI[md5sum] = "ce55e525c37147eee14cc2de6cc09f6c"
>  SRC_URI[sha256sum] = "a9f42d03949f948a3a4f762287dbc16e53a927c91a07ee64207ebd90a9e5e292"


