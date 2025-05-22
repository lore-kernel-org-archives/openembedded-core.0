Return-Path: <richard.purdie@linuxfoundation.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 17E3CC54E65
	for <webhook@archiver.kernel.org>; Thu, 22 May 2025 10:50:29 +0000 (UTC)
Received: from mail-wm1-f52.google.com (mail-wm1-f52.google.com [209.85.128.52])
 by mx.groups.io with SMTP id smtpd.web10.20971.1747911003953808786
 for <openembedded-core@lists.openembedded.org>;
 Thu, 22 May 2025 03:50:04 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@linuxfoundation.org header.s=google header.b=bISXCeoc;
 spf=pass (domain: linuxfoundation.org, ip: 209.85.128.52, mailfrom: richard.purdie@linuxfoundation.org)
Received: by mail-wm1-f52.google.com with SMTP id 5b1f17b1804b1-441c99459e9so52209855e9.3
        for <openembedded-core@lists.openembedded.org>; Thu, 22 May 2025 03:50:03 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linuxfoundation.org; s=google; t=1747911002; x=1748515802; darn=lists.openembedded.org;
        h=mime-version:user-agent:content-transfer-encoding:references
         :in-reply-to:date:to:from:subject:message-id:from:to:cc:subject:date
         :message-id:reply-to;
        bh=oqvafHoWw4pVqKJbwBdySX8t/HDN0D3OhPkWU6Iia5A=;
        b=bISXCeocYKT3tGe5twh8/m/XcURYnsR5BhdNKPHFky6jw4ym+ZptBGo661aXSuqYnq
         ZpR2+dnJNoZuLUEewDDG0UWZHv4cY/Iuxa8H3kQqCT7v6RdLfqNzECvpdWJ9i711QFn1
         gIzguyyvpbM8NZkQBFxp9V9Zk4xx9ERdFwISA=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1747911002; x=1748515802;
        h=mime-version:user-agent:content-transfer-encoding:references
         :in-reply-to:date:to:from:subject:message-id:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=oqvafHoWw4pVqKJbwBdySX8t/HDN0D3OhPkWU6Iia5A=;
        b=LHC4FDQuwQMpeIzOw9xOHVDK03q34NQouihTQ+VOIpfqC6gLLyraB/D0I4AR4Z8/SR
         3ncy/a9gpFY8chaaimSwtfMnYD7F7gmrMqkgAHCN0sdnX24ssCacTMlTPY5UgNqX3wHe
         8ZSkVq8bCK/mrlcnVwFfpwsUwRGxjgGrFj4rWv8NdKA2HPnmLoWcDLgOml0E1JOEakj1
         9whEp3YAQ38hwfO2Lj5CkDklOcj3LCTS3/mDFFl84NMRgL/N0dmYprhAB4XYHVZ0wa8p
         DrVH3SvruSxXHw3oempPeLD900UabuTzf3WTKSMbr1uRcYCVFF8wjQMnFg4kv8jpTWnA
         zdLg==
X-Forwarded-Encrypted: i=1; AJvYcCW7hO+N1Szdj1o5y3EjQa13ouMYx+30XEnWgXEBx/LpPQcqXuM0ifRDFoT5rfSxdssqiSag+hQUOsI732HZdKzD4w==@lists.openembedded.org
X-Gm-Message-State: AOJu0YwfFbfMd+T7qG6s2So1UKJ2RO1+EXXhexionwWf+9W510dUwWoP
	BuNNBGl5pS8XAbNCsEUC2FYkXKWjgPT8C782EP9jlT2PWPmyeQr6dK3miPz1ziTcFxs=
X-Gm-Gg: ASbGncsTcF9nY5C0pWNpP1zwvWoyMjVKYQOk/G4eH0JibvebdEZFjTHEaWoabBLtGYI
	UYvXeNfET0nQ7UE3SYUHZ9fSkwtS3ClIDchi/b6ffRLGcuVB5ty339xHLa6JCZbae5J3NFtSdzw
	inqivqPOF0BruNHJ/nvNWso38ilXqU7+SzCv2C1DvGXLV1FgRtaRh+kOhTbsDBUgQPMC0psXMsa
	n2dmq7ctn2M8j977pETN6eebbTmAAstHg5aGxW6T+VQgQUkhoO56151zOkld2HhapYSbfIoypdk
	UTU2QYelLDF7ob+ED/lUZXR9mS99gkhO/orZ9OUsCw/fgEckQHJxSwdoSnAL69byGqLLWo1dm9+
	TsVRRLSxOOkq5PzIBupIM2txMEXkseakQFjuVTuLs
X-Google-Smtp-Source: AGHT+IHSSJPLqX8NhhtOQFNCmzs/TIzumpc0RuefYDOkx3z7SikPEWH8nmj7lF1jlQmOCbR3DkQo3w==
X-Received: by 2002:a05:600c:1d8d:b0:43c:fa0e:4713 with SMTP id 5b1f17b1804b1-442fd60b489mr266593965e9.2.1747911001822;
        Thu, 22 May 2025 03:50:01 -0700 (PDT)
Received: from ?IPv6:2001:8b0:aba:5f3c:f7cf:689b:6e57:f0de? ([2001:8b0:aba:5f3c:f7cf:689b:6e57:f0de])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-3a35ca5abaesm22784194f8f.39.2025.05.22.03.50.00
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 22 May 2025 03:50:01 -0700 (PDT)
Message-ID: <428d48d7ba7c2e7f946f775ed3cbd403f1347229.camel@linuxfoundation.org>
Subject: Re: [OE-core] [PATCH v2 01/28] toolchain: Provide abstraction for
 choosing per-recipe toolchain
From: Richard Purdie <richard.purdie@linuxfoundation.org>
To: raj.khem@gmail.com, openembedded-core@lists.openembedded.org
Date: Thu, 22 May 2025 11:50:00 +0100
In-Reply-To: <20250520-clang-toolchain-v2-1-db97c2eb3756@gmail.com>
References: <20250520-clang-toolchain-v2-0-db97c2eb3756@gmail.com>
	 <20250520-clang-toolchain-v2-1-db97c2eb3756@gmail.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
User-Agent: Evolution 3.56.0-1 
MIME-Version: 1.0
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Thu, 22 May 2025 10:50:29 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/217083

On Tue, 2025-05-20 at 23:19 -0700, Khem Raj via lists.openembedded.org wrot=
e:
> This implements a toolchain selection mechanism with existing defaults
> unchanged.
>=20
> It introduces a variable called TOOLCHAIN, which denotes the familiar
> name for toolchain e.g. "gcc" which selects GNU compiler + binutils
> as default C/C++ toolchain or "clang" which will use LLVM/Clang Compiler
>=20
> Additionally build-gcc is used for selecting native compiler
>=20
> TOOLCHAIN variable has a global fallback to "gcc" in configuration
> metadata. A distro can switch to using say "clang" as default system
> compiler by defining
>=20
> TOOLCHAIN ?=3D "clang"
>=20
> In local.conf or other distro specific global configuration metadata
>=20
> It is also selectable at recipe scope, since not all packages are
> buildable with either clang or gcc, a recipe can explicitly demand
> a given toolchain e.g. glibc can not be built with clang therefore
> glibc recipe sets.
>=20
> TOOLCHAIN =3D "gcc"
>=20
> TCOVERRIDE is defined to toolchain-TOOLCHAIN and its added to OVERRIDES
> that a recipe can see and it can use "toolchain-gcc" or "toolchain-clang"
> to set specific metadata based upon global toolchain policy in distro.
>=20
> toolchain: Use TOOLCHAIN_NATIVE for defining native compiler
>=20
> This helps in selecting gcc or clang for native compiler irrespective
> of cross-compiler selection via TOOLCHAIN variable
>=20
> Signed-off-by: Khem Raj <raj.khem@gmail.com>
> ---
> =C2=A0meta/classes-global/base.bbclass=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=
=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=
 |=C2=A0 5 ++++
> =C2=A0meta/classes-recipe/cross-canadian.bbclass=C2=A0=C2=A0=C2=A0=C2=A0=
=C2=A0=C2=A0=C2=A0=C2=A0 |=C2=A0 2 ++
> =C2=A0meta/classes-recipe/cross.bbclass=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=
=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 |=C2=
=A0 2 ++
> =C2=A0meta/classes-recipe/crosssdk.bbclass=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=
=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 |=C2=A0 2 ++
> =C2=A0meta/classes-recipe/native.bbclass=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=
=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 |=C2=A0 2 +=
+
> =C2=A0meta/classes-recipe/nativesdk.bbclass=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=
=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 |=C2=A0 2 ++
> =C2=A0meta/classes/clang-native.bbclass=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=
=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 | 28 =
++++++++++++++++++++++
> =C2=A0.../toolchain/clang.inc =3D> classes/clang.bbclass}=C2=A0 | 10 ++++=
----
> =C2=A0.../build-gcc.inc =3D> classes/gcc-native.bbclass}=C2=A0=C2=A0 |=C2=
=A0 1 -
> =C2=A0.../toolchain/gcc.inc =3D> classes/gcc.bbclass}=C2=A0=C2=A0=C2=A0=
=C2=A0=C2=A0 |=C2=A0 1 +
> =C2=A0meta/conf/bitbake.conf=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=
=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=
=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 |=C2=A0 7 +++---
> =C2=A011 files changed, 53 insertions(+), 9 deletions(-)

This is definitely getting there, thanks for working through it.

I think we're ready to agree that we should support toolchain=20
selection with the TOOLCHAIN variable and we should support toolchain
overrides. There are therefore some patches in this series which can
merge as we agree on that.

One of the concerns I have left is the class naming as I think
"gcc.bbclass" is confusing in its own right. I'm wondering if we put
these classes into a toolchain directory to make it clearer.=C2=A0

I do also conceptually prefer the idea of an inc file so I'm wondering
if we should see if some kind of require_defer syntax could work?

> diff --git a/meta/classes-global/base.bbclass b/meta/classes-global/base.=
bbclass
> index 8215969c7bb37c1a1b91e260cd31714fee2db87c..ab2f0686b7b09e004ba8d5bb6=
09e81b19da67e38 100644
> --- a/meta/classes-global/base.bbclass
> +++ b/meta/classes-global/base.bbclass
> @@ -6,6 +6,7 @@
> =C2=A0
> =C2=A0BB_DEFAULT_TASK ?=3D "build"
> =C2=A0CLASSOVERRIDE ?=3D "class-target"
> +TCOVERRIDE ?=3D "toolchain-gcc"
> =C2=A0
> =C2=A0inherit patch
> =C2=A0inherit staging
> @@ -19,6 +20,10 @@ PACKAGECONFIG_CONFARGS ??=3D ""
> =C2=A0
> =C2=A0inherit metadata_scm
> =C2=A0
> +inherit gcc-native
> +inherit gcc
> +inherit_defer ${@oe.utils.ifelse(d.getVar('TOOLCHAIN') =3D=3D 'clang', '=
clang', '')}

I'm a bit puzzled on why we can't defer the gcc inherit here too? I
guess that didn't work for some reason?

> +
> =C2=A0def lsb_distro_identifier(d):
> =C2=A0=C2=A0=C2=A0=C2=A0 adjust =3D d.getVar('LSB_DISTRO_ADJUST')
> =C2=A0=C2=A0=C2=A0=C2=A0 adjust_func =3D None
> diff --git a/meta/classes-recipe/cross-canadian.bbclass b/meta/classes-re=
cipe/cross-canadian.bbclass
> index 059d9aa95f57dd77a0ab5172c4c15c13ed3bc43e..a9dc6aa9bac7d5cc27331a505=
ed213aa9d402d4d 100644
> --- a/meta/classes-recipe/cross-canadian.bbclass
> +++ b/meta/classes-recipe/cross-canadian.bbclass
> @@ -14,6 +14,8 @@
> =C2=A0EXCLUDE_FROM_WORLD =3D "1"
> =C2=A0NATIVESDKLIBC ?=3D "libc-glibc"
> =C2=A0LIBCOVERRIDE =3D ":${NATIVESDKLIBC}"
> +TCOVERRIDE =3D ""
> +TOOLCHAIN =3D ""
> =C2=A0CLASSOVERRIDE =3D "class-cross-canadian"
> =C2=A0STAGING_BINDIR_TOOLCHAIN =3D "${STAGING_DIR_NATIVE}${bindir_native}=
/${SDK_ARCH}${SDK_VENDOR}-${SDK_OS}:${STAGING_DIR_NATIVE}${bindir_native}/$=
{TARGET_ARCH}${TARGET_VENDOR}-${TARGET_OS}"
> =C2=A0
> diff --git a/meta/classes-recipe/cross.bbclass b/meta/classes-recipe/cros=
s.bbclass
> index 93de9a527446554b93c1e323c7458cc7aacef799..7ebf37760ca1fcad8cd1a2ee4=
1ef32a29cca9b92 100644
> --- a/meta/classes-recipe/cross.bbclass
> +++ b/meta/classes-recipe/cross.bbclass
> @@ -10,6 +10,8 @@ inherit relocatable
> =C2=A0# no need for them to be a direct target of 'world'
> =C2=A0EXCLUDE_FROM_WORLD =3D "1"
> =C2=A0
> +TCOVERRIDE =3D ""
> +TOOLCHAIN =3D ""
> =C2=A0CLASSOVERRIDE =3D "class-cross"
> =C2=A0PACKAGES =3D ""
> =C2=A0PACKAGES_DYNAMIC =3D ""

Wouldn't the recipes that include this class set TOOLCHAIN correctly
anyway?


> diff --git a/meta/classes-recipe/crosssdk.bbclass b/meta/classes-recipe/c=
rosssdk.bbclass
> index 824b1bcff47bcd36a70aa1d7b8724b6cf07131ff..0c0144b26829d3b76d034a891=
33ee94cf760b86d 100644
> --- a/meta/classes-recipe/crosssdk.bbclass
> +++ b/meta/classes-recipe/crosssdk.bbclass
> @@ -7,6 +7,8 @@
> =C2=A0inherit cross
> =C2=A0
> =C2=A0CLASSOVERRIDE =3D "class-crosssdk"
> +TCOVERRIDE =3D ""
> +TOOLCHAIN =3D ""
> =C2=A0NATIVESDKLIBC ?=3D "libc-glibc"
> =C2=A0LIBCOVERRIDE =3D ":${NATIVESDKLIBC}"
> =C2=A0MACHINEOVERRIDES =3D ""

Same question here.

> diff --git a/meta/classes-recipe/native.bbclass b/meta/classes-recipe/nat=
ive.bbclass
> index 625975a69429389a5b231a19b17e8ed7a12d80ad..cbdace9b7021e90a4df2684d9=
eacda36112b46c6 100644
> --- a/meta/classes-recipe/native.bbclass
> +++ b/meta/classes-recipe/native.bbclass
> @@ -108,6 +108,8 @@ PKG_CONFIG_SYSTEM_INCLUDE_PATH[unexport] =3D "1"
> =C2=A0
> =C2=A0# we dont want libc-*libc to kick in for native recipes
> =C2=A0LIBCOVERRIDE =3D ""
> +TCOVERRIDE =3D ""
> +TOOLCHAIN =3D ""
> =C2=A0CLASSOVERRIDE =3D "class-native"
> =C2=A0MACHINEOVERRIDES =3D ""
> =C2=A0MACHINE_FEATURES =3D ""

This, I can understand although I know there was "clang-native" support
in places. I guess that is deferred for now?

> diff --git a/meta/classes-recipe/nativesdk.bbclass b/meta/classes-recipe/=
nativesdk.bbclass
> index 7ecb4c12c1f0f2b9cc48da215006a153679facf8..440bc3a5c5434152dfe5c9c19=
db1c2be857cd794 100644
> --- a/meta/classes-recipe/nativesdk.bbclass
> +++ b/meta/classes-recipe/nativesdk.bbclass
> @@ -13,6 +13,8 @@ STAGING_BINDIR_TOOLCHAIN =3D "${STAGING_DIR_NATIVE}${bi=
ndir_native}/${SDK_ARCH}${S
> =C2=A0# libc for the SDK can be different to that of the target
> =C2=A0NATIVESDKLIBC ?=3D "libc-glibc"
> =C2=A0LIBCOVERRIDE =3D ":${NATIVESDKLIBC}"
> +TCOVERRIDE =3D ""
> +TOOLCHAIN =3D ""
> =C2=A0CLASSOVERRIDE =3D "class-nativesdk"
> =C2=A0MACHINEOVERRIDES =3D ""

Do you have any plans to support building the SDK with clang? I'm just
wondering on the code direction here in the future.


> diff --git a/meta/classes/clang-native.bbclass b/meta/classes/clang-nativ=
e.bbclass
> new file mode 100644
> index 0000000000000000000000000000000000000000..bf395eade73eaad18bf15f35d=
03bc0aec2223090
> --- /dev/null
> +++ b/meta/classes/clang-native.bbclass
> @@ -0,0 +1,28 @@
> +# inherit this class if you would like to use clang to compile the nativ=
e
> +# version of your recipes instead of system compiler ( which is normally=
 gcc )
> +# on build machines
> +# to use it add
> +#
> +# inherit clang-native
> +#
> +# to the concerned recipe via a bbappend or directly to recipe file
> +#
> +BUILD_CC =3D "${CCACHE}${BUILD_PREFIX}clang ${BUILD_CC_ARCH} -isysroot=
=3D${STAGING_DIR_NATIVE}"
> +BUILD_CXX =3D "${CCACHE}${BUILD_PREFIX}clang++ ${BUILD_CC_ARCH} -isysroo=
t=3D${STAGING_DIR_NATIVE}"
> +BUILD_FC =3D "${BUILD_PREFIX}gfortran ${BUILD_CC_ARCH} -isysroot=3D${STA=
GING_DIR_NATIVE}"
> +BUILD_CPP =3D "${BUILD_PREFIX}clang ${BUILD_CC_ARCH} -isysroot=3D${STAGI=
NG_DIR_NATIVE} -E"
> +BUILD_LD =3D "${BUILD_PREFIX}ld ${BUILD_LD_ARCH}"
> +BUILD_CCLD =3D "${BUILD_PREFIX}clang ${BUILD_CC_ARCH}"
> +BUILD_AR =3D "${BUILD_PREFIX}llvm-ar"
> +BUILD_AS =3D "${BUILD_PREFIX}as ${BUILD_AS_ARCH}"
> +BUILD_RANLIB =3D "${BUILD_PREFIX}llvm-ranlib -D"
> +BUILD_STRIP =3D "${BUILD_PREFIX}llvm-strip"
> +BUILD_OBJCOPY =3D "${BUILD_PREFIX}llvm-objcopy"
> +BUILD_OBJDUMP =3D "${BUILD_PREFIX}llvm-objdump"
> +BUILD_NM =3D "${BUILD_PREFIX}llvn-nm"
> +BUILD_READELF =3D "${BUILD_PREFIX}readelf"
> +DEPENDS:append =3D " clang-native compiler-rt-native libcxx-native"
> +# Use libcxx headers for native parts
> +CXXFLAGS:append =3D " -stdlib=3Dlibc++"
> +LDFLAGS:append =3D " -stdlib=3Dlibc++ -rtlib=3Dlibgcc -unwindlib=3Dlibgc=
c"
> +BUILD_LDFLAGS:append =3D " -stdlib=3Dlibc++ -rtlib=3Dlibgcc -unwindlib=
=3Dlibgcc"

Where/how does this get used?


> diff --git a/meta/conf/toolchain/clang.inc b/meta/classes/clang.bbclass
> similarity index 76%
> rename from meta/conf/toolchain/clang.inc
> rename to meta/classes/clang.bbclass
> index 0e5f0769f85a8373c58d4b54dbe2bb1cf7dbd50b..be8b888918d1b4b4ae1d245df=
2c9da013cdc826e 100644
> --- a/meta/conf/toolchain/clang.inc
> +++ b/meta/classes/clang.bbclass
> @@ -17,9 +17,11 @@ READELF =3D "${HOST_PREFIX}llvm-readelf"
> =C2=A0PREFERRED_PROVIDER_virtual/cross-cc =3D "${MLPREFIX}clang-cross-${T=
ARGET_ARCH}"
> =C2=A0PREFERRED_PROVIDER_virtual/cross-c++ =3D "${MLPREFIX}clang-cross-${=
TARGET_ARCH}"
> =C2=A0PREFERRED_PROVIDER_virtual/compilerlibs =3D "gcc-runtime"
> -PREFERRED_PROVIDER_virtual/cross-cc:class-nativesdk =3D "gcc-crosssdk-${=
SDK_SYS}"
> -PREFERRED_PROVIDER_virtual/cross-c++:class-nativesdk =3D "gcc-crosssdk-$=
{SDK_SYS}"
> +PREFERRED_PROVIDER_virtual/cross-cc:class-nativesdk =3D "clang-crosssdk-=
${SDK_SYS}"
> +PREFERRED_PROVIDER_virtual/cross-c++:class-nativesdk =3D "clang-crosssdk=
-${SDK_SYS}"
> =C2=A0
> -PREFERRED_PROVIDER_virtual/nativesdk-cross-cc =3D "gcc-crosssdk-${SDK_SY=
S}"
> -PREFERRED_PROVIDER_virtual/nativesdk-cross-c++ =3D "gcc-crosssdk-${SDK_S=
YS}"
> +PREFERRED_PROVIDER_virtual/nativesdk-cross-cc =3D "clang-crosssdk-${SDK_=
SYS}"
> +PREFERRED_PROVIDER_virtual/nativesdk-cross-c++ =3D "clang-crosssdk-${SDK=
_SYS}"
> =C2=A0PREFERRED_PROVIDER_virtual/nativesdk-compilerlibs =3D "nativesdk-gc=
c-runtime"
> +
> +TCOVERRIDE =3D "toolchain-clang"


This can probably be split into a separate patch and merged sooner.

> diff --git a/meta/conf/toolchain/build-gcc.inc b/meta/classes/gcc-native.=
bbclass
> similarity index 99%
> rename from meta/conf/toolchain/build-gcc.inc
> rename to meta/classes/gcc-native.bbclass
> index a708bd0389a123504301fd151fb9ebdb677926be..1e1d68b027806b94e8229d4ef=
ef025cc1c038ad3 100644
> --- a/meta/conf/toolchain/build-gcc.inc
> +++ b/meta/classes/gcc-native.bbclass
> @@ -12,4 +12,3 @@ BUILD_OBJCOPY =3D "${BUILD_PREFIX}objcopy"
> =C2=A0BUILD_OBJDUMP =3D "${BUILD_PREFIX}objdump"
> =C2=A0BUILD_NM =3D "${BUILD_PREFIX}nm"
> =C2=A0BUILD_READELF =3D "${BUILD_PREFIX}readelf"
> -
> diff --git a/meta/conf/toolchain/gcc.inc b/meta/classes/gcc.bbclass
> similarity index 97%
> rename from meta/conf/toolchain/gcc.inc
> rename to meta/classes/gcc.bbclass
> index 36d33f5d6d0bfbf0f36158f389c4112ce20d806b..75f9abe999a297c7b17e64e69=
3ffd8f441bb16b1 100644
> --- a/meta/conf/toolchain/gcc.inc
> +++ b/meta/classes/gcc.bbclass
> @@ -24,3 +24,4 @@ PREFERRED_PROVIDER_virtual/nativesdk-cross-cc =3D "gcc-=
crosssdk-${SDK_SYS}"
> =C2=A0PREFERRED_PROVIDER_virtual/nativesdk-cross-c++ =3D "gcc-crosssdk-${=
SDK_SYS}"
> =C2=A0PREFERRED_PROVIDER_virtual/nativesdk-compilerlibs =3D "nativesdk-gc=
c-runtime"
> =C2=A0
> +TCOVERRIDE =3D "toolchain-gcc"


The TCOVERRIDE pieces could also be a separate patch to move things
forward until we resolve the inherit_defer/require/naming discussion?

> diff --git a/meta/conf/bitbake.conf b/meta/conf/bitbake.conf
> index e5037c6277841908df333b16adbe4e6cce55f814..cfd70498b246fa1bf03e4730e=
cd5bf5be759ed44 100644
> --- a/meta/conf/bitbake.conf
> +++ b/meta/conf/bitbake.conf
> @@ -13,6 +13,8 @@ BASELIB =3D "lib"
> =C2=A0BASELIB:libc-glibc:powerpc64 =3D "lib64"
> =C2=A0BASELIB:libc-glibc:powerpc64le =3D "lib64"
> =C2=A0
> +TOOLCHAIN ??=3D "gcc"
> +
> =C2=A0# Path prefixes
> =C2=A0export base_prefix =3D ""
> =C2=A0export prefix =3D "/usr"
> @@ -801,7 +803,7 @@ DISTRO_NAME ??=3D "OpenEmbedded"
> =C2=A0# And finally '<foo>:forcevariable' overrides any standard variable=
, with the highest priority.
> =C2=A0# This works for functions as well, they are really just variables.
> =C2=A0#
> -OVERRIDES =3D "${TARGET_OS}:${TRANSLATED_TARGET_ARCH}:pn-${PN}:layer-${F=
ILE_LAYERNAME}:${MACHINEOVERRIDES}:${DISTROOVERRIDES}:${CLASSOVERRIDE}${LIB=
COVERRIDE}:forcevariable"
> +OVERRIDES =3D "${TARGET_OS}:${TRANSLATED_TARGET_ARCH}:pn-${PN}:layer-${F=
ILE_LAYERNAME}:${MACHINEOVERRIDES}:${DISTROOVERRIDES}:${CLASSOVERRIDE}:${TC=
OVERRIDE}${LIBCOVERRIDE}:forcevariable"

Lets pull the overrides bit into a separate patch.


Cheers,

Richard

