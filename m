Return-Path: <ross.burton@intel.com>
Received: from mail-it1-f194.google.com (mail-it1-f194.google.com
	[209.85.166.194])
	by mail.openembedded.org (Postfix) with ESMTP id B5D747D34E
	for <openembedded-core@lists.openembedded.org>;
	Thu,  6 Jun 2019 16:10:25 +0000 (UTC)
Received: by mail-it1-f194.google.com with SMTP id m187so825200ite.3
	for <openembedded-core@lists.openembedded.org>;
	Thu, 06 Jun 2019 09:10:27 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=intel-com.20150623.gappssmtp.com; s=20150623;
	h=mime-version:references:in-reply-to:from:date:message-id:subject:to
	:cc; bh=I/0Y7rrbM6ndCoR3HQc4xo3Qzgnh51WtIMTnrwBH5Q8=;
	b=Oh5UDpUjIb4VbbXYfCLYsyqQ+/eqy1A4FIhO9fd7km4lORMLzmA50qjYRYfQw+B8Zi
	S0/agR4hdI5LBabQPTMyXwI78uXmRGLXTKwp92hoiLBe0uQpOB6WUjTYEAPyEnmkaPKM
	qCTxJKc4KjDPtEUQ41wScSa55NtTBoEUGX6joXEx3DlKoCwwO4ZqZQemY4g7RV4uwr7w
	cOx5kYTR8Qecl7/+q9nTZI88xnPe9sibFRP6mzVvoHB3/KXdbM8pKLzNFxL1kOg2/IoB
	FWlF0BtVJ8vZ6CqrrfypOFyDYHxEqSHb315LkVnbse3JEgOTZMLy6g8wGtTtlpxYVdxA
	ZjGg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:mime-version:references:in-reply-to:from:date
	:message-id:subject:to:cc;
	bh=I/0Y7rrbM6ndCoR3HQc4xo3Qzgnh51WtIMTnrwBH5Q8=;
	b=dJ/TvJ4cVd4pvreWyyusZbMoj4zl/0O0aMvAHXvKemwA3mPZV0yPoV1l+PW20tGDWO
	TUq+9uA+zXE7n0RRtOznZELMX7Df+zYobWbLEyykAjrPiTL5wSlFxs/hXfasbNDso8aF
	PWF+aIln84KVqF/cZpvHPJAjKYaJcPNZPEF4jG+pV3zq1GfdEAlhTHvH0zhUiTmxzqFZ
	+GELaaUMnKb9/C93ylGWNpGjbM/RsiFqocH0N1qDUK1w4PnkfW/sCx7VPbUdRkaExVWT
	0gOnBr8SrgFfeapGk3MSSY1mgw6/JcK9iuIHBjj0oaA44P100nBEUiZ6AMbdT9WUevLs
	+VIw==
X-Gm-Message-State: APjAAAWAjgnv8Zqox/zTswMMXXuVibMc79fAS9kegt36z3Bhqbq4SmVE
	W2aj8ZRKrPrNHVRdovIdqMHSbxZwE5BEESeJTbZfPBJ3
X-Google-Smtp-Source: APXvYqyNoVtkaJ9equPm+BR4Wx1hUoj0ThdRhBMyknD4b3ZS3ttHFnoxxWDSaxHQ2ZoQYJgzKkA6e0n14E6FOKomng0=
X-Received: by 2002:a24:64c5:: with SMTP id t188mr661050itc.83.1559837426505; 
	Thu, 06 Jun 2019 09:10:26 -0700 (PDT)
MIME-Version: 1.0
References: <20190606160718.3433-1-matthias.schoepfer@ithinx.io>
In-Reply-To: <20190606160718.3433-1-matthias.schoepfer@ithinx.io>
From: "Burton, Ross" <ross.burton@intel.com>
Date: Thu, 6 Jun 2019 17:10:15 +0100
Message-ID: <CAJTo0LYU2jce_Wh0VGYAPrDa6+vMLe7GEc1MG8jOBHHLMQ3y=A@mail.gmail.com>
To: Matthias Schoepfer <matthias.schoepfer@googlemail.com>
Cc: OE-core <openembedded-core@lists.openembedded.org>
Subject: Re: [PATCH v3] python3: fix build on softfloat mips
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
X-List-Received-Date: Thu, 06 Jun 2019 16:10:25 -0000
Content-Type: text/plain; charset="UTF-8"

You also need a S-o-b by the Upstream-Status in the patch itself, but
I've added that when applying locally so don't bother with a v4.

Thanks!

Ross

On Thu, 6 Jun 2019 at 17:07, Matthias Schoepfer via Openembedded-core
<openembedded-core@lists.openembedded.org> wrote:
>
> This patch originally only meant to correct the python3 build for mips
> with softfloat, as the original test only checked for mips hardfloat.
>
> Replaced custom C Program for triplet detection with autotools triplet
> detection.
>
> Signed-off-by: Matthias Schoepfer <matthias.schoepfer@ithinx.io>
> ---
>  ...-detection-of-mips-architecture-for-.patch | 201 ++++++++++++++++++
>  meta/recipes-devtools/python/python3_3.7.3.bb |   1 +
>  2 files changed, 202 insertions(+)
>  create mode 100644 meta/recipes-devtools/python/python3/0001-bpo-36852-proper-detection-of-mips-architecture-for-.patch
>
> diff --git a/meta/recipes-devtools/python/python3/0001-bpo-36852-proper-detection-of-mips-architecture-for-.patch b/meta/recipes-devtools/python/python3/0001-bpo-36852-proper-detection-of-mips-architecture-for-.patch
> new file mode 100644
> index 0000000000..b4586a7373
> --- /dev/null
> +++ b/meta/recipes-devtools/python/python3/0001-bpo-36852-proper-detection-of-mips-architecture-for-.patch
> @@ -0,0 +1,201 @@
> +From 7535c39951b9d15dd64c4669092a8582ba555466 Mon Sep 17 00:00:00 2001
> +From: Matthias Schoepfer <matthias.schoepfer@ithinx.io>
> +Date: Fri, 31 May 2019 15:34:34 +0200
> +Subject: [PATCH] bpo-36852: proper detection of mips architecture for soft
> + float
> +
> +When (cross) compiling for softfloat mips, __mips_hard_float will not be
> +defined and detection of OS triplet in configure.ac / configure will fail.
> +
> +This also has to do with the custom detection of the build triplet. Trying
> +to do this in a more autoconf/autotools manner.
> +
> +Upstream-Status: Submitted [https://github.com/python/cpython/pull/13196]
> +
> +---
> + configure.ac | 169 ++++++---------------------------------------------
> + 1 file changed, 17 insertions(+), 152 deletions(-)
> +
> +diff --git a/configure.ac b/configure.ac
> +index a7de901e08..a73e2de51b 100644
> +--- a/configure.ac
> ++++ b/configure.ac
> +@@ -727,158 +727,23 @@ fi
> + MULTIARCH=$($CC --print-multiarch 2>/dev/null)
> + AC_SUBST(MULTIARCH)
> +
> +-AC_MSG_CHECKING([for the platform triplet based on compiler characteristics])
> +-cat >> conftest.c <<EOF
> +-#undef bfin
> +-#undef cris
> +-#undef fr30
> +-#undef linux
> +-#undef hppa
> +-#undef hpux
> +-#undef i386
> +-#undef mips
> +-#undef powerpc
> +-#undef sparc
> +-#undef unix
> +-#if defined(__ANDROID__)
> +-    # Android is not a multiarch system.
> +-#elif defined(__linux__)
> +-# if defined(__x86_64__) && defined(__LP64__)
> +-        x86_64-linux-gnu
> +-# elif defined(__x86_64__) && defined(__ILP32__)
> +-        x86_64-linux-gnux32
> +-# elif defined(__i386__)
> +-        i386-linux-gnu
> +-# elif defined(__aarch64__) && defined(__AARCH64EL__)
> +-#  if defined(__ILP32__)
> +-        aarch64_ilp32-linux-gnu
> +-#  else
> +-        aarch64-linux-gnu
> +-#  endif
> +-# elif defined(__aarch64__) && defined(__AARCH64EB__)
> +-#  if defined(__ILP32__)
> +-        aarch64_be_ilp32-linux-gnu
> +-#  else
> +-        aarch64_be-linux-gnu
> +-#  endif
> +-# elif defined(__alpha__)
> +-        alpha-linux-gnu
> +-# elif defined(__ARM_EABI__) && defined(__ARM_PCS_VFP)
> +-#  if defined(__ARMEL__)
> +-        arm-linux-gnueabihf
> +-#  else
> +-        armeb-linux-gnueabihf
> +-#  endif
> +-# elif defined(__ARM_EABI__) && !defined(__ARM_PCS_VFP)
> +-#  if defined(__ARMEL__)
> +-        arm-linux-gnueabi
> +-#  else
> +-        armeb-linux-gnueabi
> +-#  endif
> +-# elif defined(__hppa__)
> +-        hppa-linux-gnu
> +-# elif defined(__ia64__)
> +-        ia64-linux-gnu
> +-# elif defined(__m68k__) && !defined(__mcoldfire__)
> +-        m68k-linux-gnu
> +-# elif defined(__mips_hard_float) && defined(__mips_isa_rev) && (__mips_isa_rev >=6) && defined(_MIPSEL)
> +-#  if _MIPS_SIM == _ABIO32
> +-        mipsisa32r6el-linux-gnu
> +-#  elif _MIPS_SIM == _ABIN32
> +-        mipsisa64r6el-linux-gnuabin32
> +-#  elif _MIPS_SIM == _ABI64
> +-        mipsisa64r6el-linux-gnuabi64
> +-#  else
> +-#   error unknown platform triplet
> +-#  endif
> +-# elif defined(__mips_hard_float) && defined(__mips_isa_rev) && (__mips_isa_rev >=6)
> +-#  if _MIPS_SIM == _ABIO32
> +-        mipsisa32r6-linux-gnu
> +-#  elif _MIPS_SIM == _ABIN32
> +-        mipsisa64r6-linux-gnuabin32
> +-#  elif _MIPS_SIM == _ABI64
> +-        mipsisa64r6-linux-gnuabi64
> +-#  else
> +-#   error unknown platform triplet
> +-#  endif
> +-# elif defined(__mips_hard_float) && defined(_MIPSEL)
> +-#  if _MIPS_SIM == _ABIO32
> +-        mipsel-linux-gnu
> +-#  elif _MIPS_SIM == _ABIN32
> +-        mips64el-linux-gnuabin32
> +-#  elif _MIPS_SIM == _ABI64
> +-        mips64el-linux-gnuabi64
> +-#  else
> +-#   error unknown platform triplet
> +-#  endif
> +-# elif defined(__mips_hard_float)
> +-#  if _MIPS_SIM == _ABIO32
> +-        mips-linux-gnu
> +-#  elif _MIPS_SIM == _ABIN32
> +-        mips64-linux-gnuabin32
> +-#  elif _MIPS_SIM == _ABI64
> +-        mips64-linux-gnuabi64
> +-#  else
> +-#   error unknown platform triplet
> +-#  endif
> +-# elif defined(__or1k__)
> +-        or1k-linux-gnu
> +-# elif defined(__powerpc__) && defined(__SPE__)
> +-        powerpc-linux-gnuspe
> +-# elif defined(__powerpc64__)
> +-#  if defined(__LITTLE_ENDIAN__)
> +-        powerpc64le-linux-gnu
> +-#  else
> +-        powerpc64-linux-gnu
> +-#  endif
> +-# elif defined(__powerpc__)
> +-        powerpc-linux-gnu
> +-# elif defined(__s390x__)
> +-        s390x-linux-gnu
> +-# elif defined(__s390__)
> +-        s390-linux-gnu
> +-# elif defined(__sh__) && defined(__LITTLE_ENDIAN__)
> +-        sh4-linux-gnu
> +-# elif defined(__sparc__) && defined(__arch64__)
> +-        sparc64-linux-gnu
> +-# elif defined(__sparc__)
> +-        sparc-linux-gnu
> +-# elif defined(__riscv)
> +-#  if __riscv_xlen == 32
> +-        riscv32-linux-gnu
> +-#  elif __riscv_xlen == 64
> +-        riscv64-linux-gnu
> +-#  else
> +-#   error unknown platform triplet
> +-#  endif
> +-# else
> +-#   error unknown platform triplet
> +-# endif
> +-#elif defined(__FreeBSD_kernel__)
> +-# if defined(__LP64__)
> +-        x86_64-kfreebsd-gnu
> +-# elif defined(__i386__)
> +-        i386-kfreebsd-gnu
> +-# else
> +-#   error unknown platform triplet
> +-# endif
> +-#elif defined(__gnu_hurd__)
> +-        i386-gnu
> +-#elif defined(__APPLE__)
> +-        darwin
> +-#else
> +-# error unknown platform triplet
> +-#endif
> +-
> +-EOF
> +-
> +-if $CPP $CPPFLAGS conftest.c >conftest.out 2>/dev/null; then
> +-  PLATFORM_TRIPLET=`grep -v '^#' conftest.out | grep -v '^ *$' | tr -d '      '`
> +-  AC_MSG_RESULT([$PLATFORM_TRIPLET])
> +-else
> +-  AC_MSG_RESULT([none])
> +-fi
> +-rm -f conftest.c conftest.out
> ++AC_CANONICAL_TARGET
> ++## Not using $target to filter out vendor
> ++## Need to handle macos, vxworks and hurd special (?) :-/
> ++case ${target_os} in
> ++     darwin*)
> ++      PLATFORM_TRIPLET=darwin
> ++      ;;
> ++     hurd*)
> ++      PLATFORM_TRIPLET=i386-gnu
> ++      ;;
> ++     vxworks*)
> ++      PLATFORM_TRIPLET=vxworks
> ++      ;;
> ++     *)
> ++      PLATFORM_TRIPLET=${target_cpu}-${target_os}
> ++      ;;
> ++esac
> +
> + if test x$PLATFORM_TRIPLET != x && test x$MULTIARCH != x; then
> +   if test x$PLATFORM_TRIPLET != x$MULTIARCH; then
> +--
> +2.21.0
> +
> diff --git a/meta/recipes-devtools/python/python3_3.7.3.bb b/meta/recipes-devtools/python/python3_3.7.3.bb
> index 413d35ae10..832ef1b3c3 100644
> --- a/meta/recipes-devtools/python/python3_3.7.3.bb
> +++ b/meta/recipes-devtools/python/python3_3.7.3.bb
> @@ -23,6 +23,7 @@ SRC_URI = "http://www.python.org/ftp/python/${PV}/Python-${PV}.tar.xz \
>             file://0003-setup.py-pass-missing-libraries-to-Extension-for-mul.patch \
>             file://0001-Lib-sysconfig.py-fix-another-place-where-lib-is-hard.patch \
>             file://0001-Makefile-fix-Issue36464-parallel-build-race-problem.patch \
> +          file://0001-bpo-36852-proper-detection-of-mips-architecture-for-.patch \
>             "
>
>  SRC_URI_append_class-native = " \
> --
> 2.21.0
>
> --
> _______________________________________________
> Openembedded-core mailing list
> Openembedded-core@lists.openembedded.org
> http://lists.openembedded.org/mailman/listinfo/openembedded-core

