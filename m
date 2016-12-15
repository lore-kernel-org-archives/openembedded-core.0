Return-Path: <raj.khem@gmail.com>
Received: from mail-vk0-f68.google.com (mail-vk0-f68.google.com
	[209.85.213.68])
	by mail.openembedded.org (Postfix) with ESMTP id 5932177200
	for <openembedded-core@lists.openembedded.org>;
	Thu, 15 Dec 2016 00:10:50 +0000 (UTC)
Received: by mail-vk0-f68.google.com with SMTP id l126so6014412vkh.0
	for <openembedded-core@lists.openembedded.org>;
	Wed, 14 Dec 2016 16:10:52 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=mime-version:in-reply-to:references:from:date:message-id:subject:to
	:cc:content-transfer-encoding;
	bh=y+8IYRTV3SV6F2DHvFl5V419gI3ltfrseOYMwJVumpo=;
	b=eXsdiCc/cszawedGJegYyxAjJw9gwPOi80J0ZCcR2HwCM0hjNquKIkfs2lk8IOCBhO
	BdspFuQqxJYwsPe/LuNSb4ZaXtB8RHD1TrfePWUk8i80CwJHFAhY+xtt2v4vzEBWnPRN
	Z9EBU9X2YarzsvDYe1f+FJ8lNPyAbCBl+7FPBZ4z1PSssYiHBJK/9WTZNjSG6cTRfik4
	qhZpvvU2MFH02ghJrGeA2J/lwjnx/KDvD+GK3szHrDanDifAJpPcunRyjaJFpg9yCmry
	Xm5+HuOojPEoDhrGVcuXg47aXxKJzW9Hp0oJQ500Gl+xLL2WS3TBEoAW7+eFoOBjpe0K
	fcZQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:mime-version:in-reply-to:references:from:date
	:message-id:subject:to:cc:content-transfer-encoding;
	bh=y+8IYRTV3SV6F2DHvFl5V419gI3ltfrseOYMwJVumpo=;
	b=sxc6eewFJc4V4pf4rUaBYZQ/Qq1zi16pFbys9VFneGPeggNGm/d1VCXUeopBFJLxAb
	IFW3nhkOopQ++VJbOAQShoTNPhYDZz/cbc7KmqXGnDR02iZd4jmbND6mVpmixkApZLoA
	4ptLPYdNuSYR7QflKX3v/caxgbqjOnegFO9V++7ZD+P/XfLGLc5RVO5t9DHFbhz1mG3w
	L8G2LCMrO+gDtHSVvqyBSbffi4XS82SFY8NSJTxBq2yPwLg1FwD2vQgAjNEoMDi421N/
	wb2SrztxJhpY7cu3+IV4wiI6yXOXb7vUdZydCZZfNEEGe9/RHvm08pJenaQaJdsJ4jqD
	hyww==
X-Gm-Message-State: AKaTC011vXzbfbXu7SmDSMEm6RuZrwmXH1u7OZ+Ts3b+/Nf9VvT4YgvZDsSFjeYvpBRuhQhKyxq0rbhVWfVZ1Q==
X-Received: by 10.176.1.17 with SMTP id 17mr77141109uak.143.1481760652147;
	Wed, 14 Dec 2016 16:10:52 -0800 (PST)
MIME-Version: 1.0
Received: by 10.159.48.87 with HTTP; Wed, 14 Dec 2016 16:10:21 -0800 (PST)
In-Reply-To: <D05F496B-1241-409B-B2C7-D0BCBAA53EE9@gmail.com>
References: <20161211230719.28765-1-raj.khem@gmail.com>
	<CAJTo0La2dNp3SQ3AurR+QOq9mt-YgsMz6PVra56eJQVwXfvjpA@mail.gmail.com>
	<D05F496B-1241-409B-B2C7-D0BCBAA53EE9@gmail.com>
From: Khem Raj <raj.khem@gmail.com>
Date: Wed, 14 Dec 2016 16:10:21 -0800
Message-ID: <CAMKF1srL3e5d3Vuz6gcV-iHhPmxpGKFOXkGofFEvrzvUzuk7hw@mail.gmail.com>
To: "Burton, Ross" <ross.burton@intel.com>
Cc: OE-core <openembedded-core@lists.openembedded.org>
Subject: Re: [PATCH] fontconfig: Fix namespace conflicts with glibc
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
X-List-Received-Date: Thu, 15 Dec 2016 00:10:51 -0000
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: quoted-printable

On Mon, Dec 12, 2016 at 9:47 AM, Khem Raj <raj.khem@gmail.com> wrote:
>
> On Dec 12, 2016, at 4:45 AM, Burton, Ross <ross.burton@intel.com> wrote:
>
> Has fallout, for example libxft:
>
> | ../../libXft-2.3.2/src/xftfreetype.c:675:43: error: =E2=80=98FC_CHAR_WI=
DTH=E2=80=99
> undeclared (first use in this function)
>
>
> OK, I wasn=E2=80=99t aware this is exported API, I will tweak the patch a=
ccordingly.
>

sent a v2

> Ross
>
> On 11 December 2016 at 23:07, Khem Raj <raj.khem@gmail.com> wrote:
>>
>> glibc 2.25 will come with TS 18661-1 macro definitions in limits.h which
>> ends with following errors
>>
>> | ../../fontconfig-2.12.1/src/fcmatch.c:324:63: error:
>> 'PRI_CHAR_WIDTH_STRONG' undeclared here (not in a function)
>> |  #define FC_OBJECT(NAME, Type, Cmp) { FC_##NAME##_OBJECT, Cmp,
>> PRI_##NAME##_STRONG, PRI_##NAME##_WEAK },
>> |                                                                ^
>> | ../../fontconfig-2.12.1/src/fcobjs.h:54:1: note: in expansion of macro
>> 'FC_OBJECT'
>> |  FC_OBJECT (CHAR_WIDTH,  FcTypeInteger, NULL)
>> |  ^~~~~~~~~
>> | ../../fontconfig-2.12.1/src/fcmatch.c:324:84: error:
>> 'PRI_CHAR_WIDTH_WEAK' undeclared here (not in a function)
>> |  #define FC_OBJECT(NAME, Type, Cmp) { FC_##NAME##_OBJECT, Cmp,
>> PRI_##NAME##_STRONG, PRI_##NAME##_WEAK },
>> |
>> ^
>> | ../../fontconfig-2.12.1/src/fcobjs.h:54:1: note: in expansion of macro
>> 'FC_OBJECT'
>> |  FC_OBJECT (CHAR_WIDTH,  FcTypeInteger, NULL)
>> |  ^~~~~~~~~
>> | make[3]: *** [Makefile:632: fcmatch.lo] Error 1
>>
>> Signed-off-by: Khem Raj <raj.khem@gmail.com>
>> ---
>>  ...icts-with-integer-width-macros-from-TS-18.patch | 74
>> ++++++++++++++++++++++
>>  .../fontconfig/fontconfig_2.12.1.bb                |  1 +
>>  2 files changed, 75 insertions(+)
>>  create mode 100644
>> meta/recipes-graphics/fontconfig/fontconfig/0001-Avoid-conflicts-with-in=
teger-width-macros-from-TS-18.patch
>>
>> diff --git
>> a/meta/recipes-graphics/fontconfig/fontconfig/0001-Avoid-conflicts-with-=
integer-width-macros-from-TS-18.patch
>> b/meta/recipes-graphics/fontconfig/fontconfig/0001-Avoid-conflicts-with-=
integer-width-macros-from-TS-18.patch
>> new file mode 100644
>> index 0000000..326ff3c
>> --- /dev/null
>> +++
>> b/meta/recipes-graphics/fontconfig/fontconfig/0001-Avoid-conflicts-with-=
integer-width-macros-from-TS-18.patch
>> @@ -0,0 +1,74 @@
>> +From 20cddc824c6501c2082cac41b162c34cd5fcc530 Mon Sep 17 00:00:00 2001
>> +From: Khem Raj <raj.khem@gmail.com>
>> +Date: Sun, 11 Dec 2016 14:32:00 -0800
>> +Subject: [PATCH] Avoid conflicts with integer width macros from TS
>> + 18661-1:2014
>> +
>> +glibc 2.25+ has now defined these macros in <limits.h>
>>
>> +https://sourceware.org/git/?p=3Dglibc.git;a=3Dcommit;h=3D5b17fd0da62bf9=
23cb61d1bb7b08cf2e1f1f9c1a
>> +
>> +Signed-off-by: Khem Raj <raj.khem@gmail.com>
>> +---
>> +Upstream-Status: Submitted
>> +
>> + fontconfig/fontconfig.h | 2 +-
>> + src/fcobjs.h            | 2 +-
>> + src/fcobjshash.gperf    | 2 +-
>> + src/fcobjshash.h        | 2 +-
>> + 4 files changed, 4 insertions(+), 4 deletions(-)
>> +
>> +diff --git a/fontconfig/fontconfig.h b/fontconfig/fontconfig.h
>> +index 5c72b22..843c532 100644
>> +--- a/fontconfig/fontconfig.h
>> ++++ b/fontconfig/fontconfig.h
>> +@@ -128,7 +128,7 @@ typedef int                FcBool;
>> + #define FC_USER_CACHE_FILE        ".fonts.cache-" FC_CACHE_VERSION
>> +
>> + /* Adjust outline rasterizer */
>> +-#define FC_CHAR_WIDTH     "charwidth" /* Int */
>> ++#define FC_CHARWIDTH      "charwidth" /* Int */
>> + #define FC_CHAR_HEIGHT            "charheight"/* Int */
>> + #define FC_MATRIX         "matrix"    /* FcMatrix */
>> +
>> +diff --git a/src/fcobjs.h b/src/fcobjs.h
>> +index 1fc4f65..d27864b 100644
>> +--- a/src/fcobjs.h
>> ++++ b/src/fcobjs.h
>> +@@ -51,7 +51,7 @@ FC_OBJECT (DPI,                      FcTypeDouble,
>> NULL)
>> + FC_OBJECT (RGBA,              FcTypeInteger,  NULL)
>> + FC_OBJECT (SCALE,             FcTypeDouble,   NULL)
>> + FC_OBJECT (MINSPACE,          FcTypeBool,     NULL)
>> +-FC_OBJECT (CHAR_WIDTH,                FcTypeInteger,  NULL)
>> ++FC_OBJECT (CHARWIDTH,         FcTypeInteger,  NULL)
>> + FC_OBJECT (CHAR_HEIGHT,               FcTypeInteger,  NULL)
>> + FC_OBJECT (MATRIX,            FcTypeMatrix,   NULL)
>> + FC_OBJECT (CHARSET,           FcTypeCharSet,  FcCompareCharSet)
>> +diff --git a/src/fcobjshash.gperf b/src/fcobjshash.gperf
>> +index 80a0237..eb4ad84 100644
>> +--- a/src/fcobjshash.gperf
>> ++++ b/src/fcobjshash.gperf
>> +@@ -44,7 +44,7 @@ int id;
>> + "rgba",FC_RGBA_OBJECT
>> + "scale",FC_SCALE_OBJECT
>> + "minspace",FC_MINSPACE_OBJECT
>> +-"charwidth",FC_CHAR_WIDTH_OBJECT
>> ++"charwidth",FC_CHARWIDTH_OBJECT
>> + "charheight",FC_CHAR_HEIGHT_OBJECT
>> + "matrix",FC_MATRIX_OBJECT
>> + "charset",FC_CHARSET_OBJECT
>> +diff --git a/src/fcobjshash.h b/src/fcobjshash.h
>> +index 5a4d1ea..4e66bb0 100644
>> +--- a/src/fcobjshash.h
>> ++++ b/src/fcobjshash.h
>> +@@ -284,7 +284,7 @@ FcObjectTypeLookup (register const char *str,
>> register unsigned int len)
>> +       {(int)(long)&((struct FcObjectTypeNamePool_t
>> *)0)->FcObjectTypeNamePool_str43,FC_CHARSET_OBJECT},
>> +       {-1},
>> + #line 47 "fcobjshash.gperf"
>> +-      {(int)(long)&((struct FcObjectTypeNamePool_t
>> *)0)->FcObjectTypeNamePool_str45,FC_CHAR_WIDTH_OBJECT},
>> ++      {(int)(long)&((struct FcObjectTypeNamePool_t
>> *)0)->FcObjectTypeNamePool_str45,FC_CHARWIDTH_OBJECT},
>> + #line 48 "fcobjshash.gperf"
>> +       {(int)(long)&((struct FcObjectTypeNamePool_t
>> *)0)->FcObjectTypeNamePool_str46,FC_CHAR_HEIGHT_OBJECT},
>> + #line 55 "fcobjshash.gperf"
>> +--
>> +2.10.2
>> +
>> diff --git a/meta/recipes-graphics/fontconfig/fontconfig_2.12.1.bb
>> b/meta/recipes-graphics/fontconfig/fontconfig_2.12.1.bb
>> index 115f558..8616154 100644
>> --- a/meta/recipes-graphics/fontconfig/fontconfig_2.12.1.bb
>> +++ b/meta/recipes-graphics/fontconfig/fontconfig_2.12.1.bb
>> @@ -22,6 +22,7 @@ DEPENDS =3D "expat freetype zlib"
>>
>>  SRC_URI =3D "http://fontconfig.org/release/fontconfig-${PV}.tar.gz \
>>             file://revert-static-pkgconfig.patch \
>> +
>> file://0001-Avoid-conflicts-with-integer-width-macros-from-TS-18.patch \
>>             "
>>  SRC_URI[md5sum] =3D "ce55e525c37147eee14cc2de6cc09f6c"
>>  SRC_URI[sha256sum] =3D
>> "a9f42d03949f948a3a4f762287dbc16e53a927c91a07ee64207ebd90a9e5e292"
>> --
>> 2.10.2
>>
>> --
>> _______________________________________________
>> Openembedded-core mailing list
>> Openembedded-core@lists.openembedded.org
>> http://lists.openembedded.org/mailman/listinfo/openembedded-core
>
>
>

