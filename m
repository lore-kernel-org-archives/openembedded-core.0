Return-Path: <raj.khem@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 8BBAFC677F1
	for <webhook@archiver.kernel.org>; Mon, 16 Jan 2023 15:32:38 +0000 (UTC)
Received: from mail-oa1-f53.google.com (mail-oa1-f53.google.com [209.85.160.53])
 by mx.groups.io with SMTP id smtpd.web11.169619.1673883150229781441
 for <openembedded-core@lists.openembedded.org>;
 Mon, 16 Jan 2023 07:32:30 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20210112 header.b=j2drErwt;
 spf=pass (domain: gmail.com, ip: 209.85.160.53, mailfrom: raj.khem@gmail.com)
Received: by mail-oa1-f53.google.com with SMTP id 586e51a60fabf-15eeec85280so8033651fac.11
        for <openembedded-core@lists.openembedded.org>; Mon, 16 Jan 2023 07:32:30 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:from:to:cc:subject:date:message-id:reply-to;
        bh=yiyP99s0MIvus3apVF65RQmWR0myg6LN7r5mYqT9WSE=;
        b=j2drErwtkq8Ffj5Nvn1qvC6YudN6llezkWa2B9564qiBDc9jKiy1oYNhD37ZZFNmD5
         aw0Y+madm1YSE6rC8DWsX1obXztRLVmlk72nU4ZHNw3xP9myuQhvNBpXwEjH2bCJ71l2
         U6mzSJHqzt2/gyWY6zjkYx2y0rGHYrnQinZWSWNDP3/N1J0eAwee+N7JSyKITdHLTKwM
         L+UoAXdqtFiwKGLC/IgY8U3S1uCQFSiYErEm7JqFeeHGEFY0mtByE5hMXcAZdOa8sw++
         NSYuxZj3Tdb6X+RjMw2/NdKWUfFUL2PNsufc0B8arZ2PHfQyBq0EEyYlzJXycEWNJNjQ
         dRiA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=yiyP99s0MIvus3apVF65RQmWR0myg6LN7r5mYqT9WSE=;
        b=tNOBB49bb7yq5KFiNYswAur9iXIYSk0z0oXtO3u7q9SLbqGmid3Wwnz0KwbrlgsjUq
         hFLYGI9xS4BY5g4glf4xHDKUgQcOmeFiTBU7ddcIWICuPp1Nt0ojgQwGhHBcINv4ouKh
         u9ptx5v1JuRsI2SuurpRO6cVO2cwdOsOQGckcVw6iSHLI7r13U+UCFDsTwPXpNcVarXR
         Plgi0mXtcUH6Wf7evaSdtuCOB3ErTitzLDh2COvie0RUiQkd9Z0h7aBCF7T4cUsYz6YL
         EiDtXRvlMlWpCvR0WTchtYCXnyhl21wLMpmpvOvZbzFrJRKpEhS4NjWJJWOGsKScAYF2
         w3ew==
X-Gm-Message-State: AFqh2kqoN88jx6aQut6fqstlGp2qXkOrOf/BNZfkU/k1EF0Giv+pAKiq
	vFI2iZRgFn9K9iH5g96CQ4m64++xky8IBkj4iAE=
X-Google-Smtp-Source: AMrXdXtbfYHDVjSsMsIoNGXUfEvpEJNlOGZ8XMNbSWnreTSq24uA23g1hKl6YbhoqGbQ2nWjqUniaPywSF1lOWRauTg=
X-Received: by 2002:a05:6870:514a:b0:15e:d5b1:33df with SMTP id
 z10-20020a056870514a00b0015ed5b133dfmr8987oak.55.1673883149130; Mon, 16 Jan
 2023 07:32:29 -0800 (PST)
MIME-Version: 1.0
References: <20230116075602.28926-1-pavel@zhukoff.net> <20230116075602.28926-2-pavel@zhukoff.net>
In-Reply-To: <20230116075602.28926-2-pavel@zhukoff.net>
From: Khem Raj <raj.khem@gmail.com>
Date: Mon, 16 Jan 2023 07:32:18 -0800
Message-ID: <CAMKF1soF13cjQyaVCSMmBQFTP08=JPZBY2FHRp5QoVQ0WKZgcQ@mail.gmail.com>
Subject: Re: [OE-core] [kirkstone][PATCH 1/1] gcc: Refactor linker patches and
 fix linker on arm with usrmerge
To: Pavel Zhukov <pavel@zhukoff.net>
Cc: openembedded-core@lists.openembedded.org, steve@sakoman.com
Content-Type: multipart/alternative; boundary="0000000000007fe26a05f2634ab1"
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Mon, 16 Jan 2023 15:32:38 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/175998

--0000000000007fe26a05f2634ab1
Content-Type: text/plain; charset="UTF-8"

On Sun, Jan 15, 2023 at 11:56 PM Pavel Zhukov <pavel@zhukoff.net> wrote:

> Backport fix from master to allow gcc to use proper linker path for
> musl [Yocto #14977].


Lgtm


>
> Fixes:
> | qemu-arm: Could not open '/lib/ld-musl-armhf.so.1': No such file or
> directory
>
> Signed-off-by: Pavel Zhukov <pavel@zhukoff.net>
> ---
>  meta/recipes-devtools/gcc/gcc-11.3.inc        |   1 -
>  ...rm-add-armv9-a-architecture-to-march.patch |  89 +++---
>  ...AMIC_LINKER-and-UCLIBC_DYNAMIC_LINKE.patch | 269 +++++++++++++-----
>  ...s-fix-v4bx-to-linker-to-support-EABI.patch |  10 +-
>  ...019-nios2-Define-MUSL_DYNAMIC_LINKER.patch |  25 --
>  5 files changed, 245 insertions(+), 149 deletions(-)
>  delete mode 100644
> meta/recipes-devtools/gcc/gcc/0019-nios2-Define-MUSL_DYNAMIC_LINKER.patch
>
> diff --git a/meta/recipes-devtools/gcc/gcc-11.3.inc
> b/meta/recipes-devtools/gcc/gcc-11.3.inc
> index 27074a06ae..ab2ece3cce 100644
> --- a/meta/recipes-devtools/gcc/gcc-11.3.inc
> +++ b/meta/recipes-devtools/gcc/gcc-11.3.inc
> @@ -48,7 +48,6 @@ SRC_URI = "\
>
> file://0016-If-CXXFLAGS-contains-something-unsupported-by-the-bu.patch \
>             file://0017-handle-sysroot-support-for-nativesdk-gcc.patch \
>
> file://0018-Search-target-sysroot-gcc-version-specific-dirs-with.patch \
> -           file://0019-nios2-Define-MUSL_DYNAMIC_LINKER.patch \
>
> file://0020-Add-ssp_nonshared-to-link-commandline-for-musl-targe.patch \
>
> file://0021-Link-libgcc-using-LDFLAGS-not-just-SHLIB_LDFLAGS.patch \
>             file://0022-sync-gcc-stddef.h-with-musl.patch \
> diff --git
> a/meta/recipes-devtools/gcc/gcc/0004-arm-add-armv9-a-architecture-to-march.patch
> b/meta/recipes-devtools/gcc/gcc/0004-arm-add-armv9-a-architecture-to-march.patch
> index c38d1b9119..864c8b3017 100644
> ---
> a/meta/recipes-devtools/gcc/gcc/0004-arm-add-armv9-a-architecture-to-march.patch
> +++
> b/meta/recipes-devtools/gcc/gcc/0004-arm-add-armv9-a-architecture-to-march.patch
> @@ -43,10 +43,10 @@ Signed-off-by: Ruiqiang Hao <
> Ruiqiang.Hao@windriver.com>
>   gcc/testsuite/lib/target-supports.exp     |  3 ++-
>   9 files changed, 79 insertions(+), 8 deletions(-)
>
> -diff --git a/gcc/config/arm/arm-cpus.in b/gcc/config/arm/arm-cpus.in
> -index bcc9ebe9f..58d83829c 100644
> ---- a/gcc/config/arm/arm-cpus.in
> -+++ b/gcc/config/arm/arm-cpus.in
> +Index: gcc-11.3.0/gcc/config/arm/arm-cpus.in
> +===================================================================
> +--- gcc-11.3.0.orig/gcc/config/arm/arm-cpus.in
> ++++ gcc-11.3.0/gcc/config/arm/arm-cpus.in
>  @@ -132,6 +132,9 @@ define feature cmse
>   # Architecture rel 8.1-M.
>   define feature armv8_1m_main
> @@ -57,7 +57,7 @@ index bcc9ebe9f..58d83829c 100644
>   # Floating point and Neon extensions.
>   # VFPv1 is not supported in GCC.
>
> -@@ -293,6 +296,7 @@ define fgroup ARMv8m_base ARMv6m armv8 cmse tdiv
> +@@ -293,6 +296,7 @@ define fgroup ARMv8m_base ARMv6m armv8 c
>   define fgroup ARMv8m_main ARMv7m armv8 cmse
>   define fgroup ARMv8r      ARMv8a
>   define fgroup ARMv8_1m_main ARMv8m_main armv8_1m_main
> @@ -87,10 +87,10 @@ index bcc9ebe9f..58d83829c 100644
>   begin arch iwmmxt
>    tune for iwmmxt
>    tune flags LDSCHED STRONG XSCALE
> -diff --git a/gcc/config/arm/arm-tables.opt b/gcc/config/arm/arm-tables.opt
> -index 5692d4fb7..ae3dd9414 100644
> ---- a/gcc/config/arm/arm-tables.opt
> -+++ b/gcc/config/arm/arm-tables.opt
> +Index: gcc-11.3.0/gcc/config/arm/arm-tables.opt
> +===================================================================
> +--- gcc-11.3.0.orig/gcc/config/arm/arm-tables.opt
> ++++ gcc-11.3.0/gcc/config/arm/arm-tables.opt
>  @@ -380,10 +380,13 @@ EnumValue
>   Enum(arm_arch) String(armv8.1-m.main) Value(30)
>
> @@ -107,10 +107,10 @@ index 5692d4fb7..ae3dd9414 100644
>
>   Enum
>   Name(arm_fpu) Type(enum fpu_type)
> -diff --git a/gcc/config/arm/arm.h b/gcc/config/arm/arm.h
> -index 47c13a9e5..088c7725c 100644
> ---- a/gcc/config/arm/arm.h
> -+++ b/gcc/config/arm/arm.h
> +Index: gcc-11.3.0/gcc/config/arm/arm.h
> +===================================================================
> +--- gcc-11.3.0.orig/gcc/config/arm/arm.h
> ++++ gcc-11.3.0/gcc/config/arm/arm.h
>  @@ -456,7 +456,8 @@ enum base_architecture
>     BASE_ARCH_8A = 8,
>     BASE_ARCH_8M_BASE = 8,
> @@ -121,10 +121,10 @@ index 47c13a9e5..088c7725c 100644
>   };
>
>   /* The major revision number of the ARM Architecture implemented by the
> target.  */
> -diff --git a/gcc/config/arm/t-aprofile b/gcc/config/arm/t-aprofile
> -index 8574ac3e2..68e2251c7 100644
> ---- a/gcc/config/arm/t-aprofile
> -+++ b/gcc/config/arm/t-aprofile
> +Index: gcc-11.3.0/gcc/config/arm/t-aprofile
> +===================================================================
> +--- gcc-11.3.0.orig/gcc/config/arm/t-aprofile
> ++++ gcc-11.3.0/gcc/config/arm/t-aprofile
>  @@ -26,8 +26,8 @@
>
>   # Arch and FPU variants to build libraries with
> @@ -136,7 +136,7 @@ index 8574ac3e2..68e2251c7 100644
>
>   # ARMv7-A - build nofp, fp-d16 and SIMD variants
>
> -@@ -46,6 +46,11 @@ MULTILIB_REQUIRED   +=
> mthumb/march=armv8-a/mfloat-abi=soft
> +@@ -46,6 +46,11 @@ MULTILIB_REQUIRED   += mthumb/march=armv8-
>   MULTILIB_REQUIRED     += mthumb/march=armv8-a+simd/mfloat-abi=hard
>   MULTILIB_REQUIRED     += mthumb/march=armv8-a+simd/mfloat-abi=softfp
>
> @@ -148,7 +148,7 @@ index 8574ac3e2..68e2251c7 100644
>   # Matches
>
>   # Arch Matches
> -@@ -129,17 +134,29 @@ MULTILIB_MATCHES += march?armv8-a=march?armv8.6-a
> +@@ -129,17 +134,29 @@ MULTILIB_MATCHES += march?armv8-a=march?
>   MULTILIB_MATCHES      += $(foreach ARCH, $(v8_6_a_simd_variants), \
>                              march?armv8-a+simd=march?armv8.6-a$(ARCH))
>
> @@ -180,11 +180,11 @@ index 8574ac3e2..68e2251c7 100644
>  -                           $(foreach ARCH, armv7-a armv8-a, \
>  +                           $(foreach ARCH, armv7-a armv8-a armv9-a, \
>
>  mthumb/march.$(ARCH)/mfloat-abi.soft=m$(MODE)/march.$(ARCH)/mfloat-abi.softfp))
> -diff --git a/gcc/config/arm/t-arm-elf b/gcc/config/arm/t-arm-elf
> -index d68def308..b3a900e8c 100644
> ---- a/gcc/config/arm/t-arm-elf
> -+++ b/gcc/config/arm/t-arm-elf
> -@@ -38,6 +38,8 @@ v7ve_fps     := vfpv3-d16 vfpv3 vfpv3-d16-fp16
> vfpv3-fp16 vfpv4 neon \
> +Index: gcc-11.3.0/gcc/config/arm/t-arm-elf
> +===================================================================
> +--- gcc-11.3.0.orig/gcc/config/arm/t-arm-elf
> ++++ gcc-11.3.0/gcc/config/arm/t-arm-elf
> +@@ -38,6 +38,8 @@ v7ve_fps     := vfpv3-d16 vfpv3 vfpv3-d16-fp
>   # it seems to work ok.
>   v8_fps                := simd fp16 crypto fp16+crypto dotprod fp16fml
>
> @@ -202,7 +202,7 @@ index d68def308..b3a900e8c 100644
>   # No floating point variants, require thumb1 softfp
>   all_nofp_t    := armv6-m armv6s-m armv8-m.base
>
> -@@ -110,6 +114,11 @@ MULTILIB_MATCHES     += $(foreach ARCH,
> $(all_v8_archs), \
> +@@ -110,6 +114,11 @@ MULTILIB_MATCHES     += $(foreach ARCH,
>                           $(foreach FPARCH, $(v8_fps), \
>                             march?armv7+fp=march?$(ARCH)+$(FPARCH)))
>
> @@ -214,11 +214,11 @@ index d68def308..b3a900e8c 100644
>   MULTILIB_MATCHES     += $(foreach ARCH, armv7e-m armv8-m.mainline, \
>                           march?armv7+fp=march?$(ARCH)+fp.dp)
>
> -diff --git a/gcc/config/arm/t-multilib b/gcc/config/arm/t-multilib
> -index ddc5033bf..d789b86ee 100644
> ---- a/gcc/config/arm/t-multilib
> -+++ b/gcc/config/arm/t-multilib
> -@@ -78,6 +78,8 @@ v8_4_a_simd_variants := $(call all_feat_combs, simd
> fp16 crypto i8mm bf16)
> +Index: gcc-11.3.0/gcc/config/arm/t-multilib
> +===================================================================
> +--- gcc-11.3.0.orig/gcc/config/arm/t-multilib
> ++++ gcc-11.3.0/gcc/config/arm/t-multilib
> +@@ -78,6 +78,8 @@ v8_4_a_simd_variants := $(call all_feat_
>   v8_5_a_simd_variants  := $(call all_feat_combs, simd fp16 crypto i8mm
> bf16)
>   v8_6_a_simd_variants  := $(call all_feat_combs, simd fp16 crypto i8mm
> bf16)
>   v8_r_nosimd_variants  := +crc
> @@ -227,7 +227,7 @@ index ddc5033bf..d789b86ee 100644
>
>   ifneq (,$(HAS_APROFILE))
>   include $(srcdir)/config/arm/t-aprofile
> -@@ -202,6 +204,16 @@ MULTILIB_MATCHES  += march?armv7=march?armv8.6-a
> +@@ -202,6 +204,16 @@ MULTILIB_MATCHES  += march?armv7=march?ar
>   MULTILIB_MATCHES      += $(foreach ARCH, $(v8_6_a_simd_variants), \
>                              march?armv7+fp=march?armv8.6-a$(ARCH))
>
> @@ -244,10 +244,10 @@ index ddc5033bf..d789b86ee 100644
>   endif         # Not APROFILE.
>
>   # Use Thumb libraries for everything.
> -diff --git a/gcc/doc/invoke.texi b/gcc/doc/invoke.texi
> -index 7184a62d0..9a712c0d6 100644
> ---- a/gcc/doc/invoke.texi
> -+++ b/gcc/doc/invoke.texi
> +Index: gcc-11.3.0/gcc/doc/invoke.texi
> +===================================================================
> +--- gcc-11.3.0.orig/gcc/doc/invoke.texi
> ++++ gcc-11.3.0/gcc/doc/invoke.texi
>  @@ -19701,6 +19701,7 @@ Permissible names are:
>   @samp{armv7-m}, @samp{armv7e-m},
>   @samp{armv8-m.base}, @samp{armv8-m.main},
> @@ -256,10 +256,10 @@ index 7184a62d0..9a712c0d6 100644
>   @samp{iwmmxt} and @samp{iwmmxt2}.
>
>   Additionally, the following architectures, which lack support for the
> -diff --git a/gcc/testsuite/gcc.target/arm/multilib.exp
> b/gcc/testsuite/gcc.target/arm/multilib.exp
> -index 4b30025db..e3f06c316 100644
> ---- a/gcc/testsuite/gcc.target/arm/multilib.exp
> -+++ b/gcc/testsuite/gcc.target/arm/multilib.exp
> +Index: gcc-11.3.0/gcc/testsuite/gcc.target/arm/multilib.exp
> +===================================================================
> +--- gcc-11.3.0.orig/gcc/testsuite/gcc.target/arm/multilib.exp
> ++++ gcc-11.3.0/gcc/testsuite/gcc.target/arm/multilib.exp
>  @@ -135,6 +135,14 @@ if {[multilib_config "aprofile"] } {
>         {-march=armv8.6-a+simd+fp16 -mfloat-abi=softfp}
> "thumb/v8-a+simd/softfp"
>         {-march=armv8.6-a+simd+fp16+nofp -mfloat-abi=softfp}
> "thumb/v8-a/nofp"
> @@ -275,10 +275,10 @@ index 4b30025db..e3f06c316 100644
>         {-mcpu=cortex-a53+crypto -mfloat-abi=hard} "thumb/v8-a+simd/hard"
>         {-mcpu=cortex-a53+nofp -mfloat-abi=softfp} "thumb/v8-a/nofp"
>         {-march=armv8-a+crc -mfloat-abi=hard -mfpu=vfp}
> "thumb/v8-a+simd/hard"
> -diff --git a/gcc/testsuite/lib/target-supports.exp
> b/gcc/testsuite/lib/target-supports.exp
> -index 857e57218..52e043917 100644
> ---- a/gcc/testsuite/lib/target-supports.exp
> -+++ b/gcc/testsuite/lib/target-supports.exp
> +Index: gcc-11.3.0/gcc/testsuite/lib/target-supports.exp
> +===================================================================
> +--- gcc-11.3.0.orig/gcc/testsuite/lib/target-supports.exp
> ++++ gcc-11.3.0/gcc/testsuite/lib/target-supports.exp
>  @@ -4820,7 +4820,8 @@ foreach { armfunc armflag armdefs } {
>         v8m_base "-march=armv8-m.base -mthumb -mfloat-abi=soft"
>                 __ARM_ARCH_8M_BASE__
> @@ -289,6 +289,3 @@ index 857e57218..52e043917 100644
>       eval [string map [list FUNC $armfunc FLAG $armflag DEFS $armdefs ] {
>         proc check_effective_target_arm_arch_FUNC_ok { } {
>             return [check_no_compiler_messages arm_arch_FUNC_ok assembly {
> ---
> -2.34.1
> -
> diff --git
> a/meta/recipes-devtools/gcc/gcc/0006-Define-GLIBC_DYNAMIC_LINKER-and-UCLIBC_DYNAMIC_LINKE.patch
> b/meta/recipes-devtools/gcc/gcc/0006-Define-GLIBC_DYNAMIC_LINKER-and-UCLIBC_DYNAMIC_LINKE.patch
> index ef19eef822..b3515c9734 100644
> ---
> a/meta/recipes-devtools/gcc/gcc/0006-Define-GLIBC_DYNAMIC_LINKER-and-UCLIBC_DYNAMIC_LINKE.patch
> +++
> b/meta/recipes-devtools/gcc/gcc/0006-Define-GLIBC_DYNAMIC_LINKER-and-UCLIBC_DYNAMIC_LINKE.patch
> @@ -1,4 +1,4 @@
> -From 84dd8ea4c982fc2c82af642293d29e9c1880de5b Mon Sep 17 00:00:00 2001
> +From 4de00af67b57b5440bdf61ab364ad959ad0aeee7 Mon Sep 17 00:00:00 2001
>  From: Khem Raj <raj.khem@gmail.com>
>  Date: Fri, 29 Mar 2013 09:24:50 +0400
>  Subject: [PATCH] Define GLIBC_DYNAMIC_LINKER and UCLIBC_DYNAMIC_LINKER
> @@ -12,28 +12,37 @@ SH, sparc, alpha for possible future support (if any)
>
>  Removes the do_headerfix task in metadata
>
> +Signed-off-by: Khem Raj <raj.khem@gmail.com>
> +
>  Upstream-Status: Inappropriate [OE configuration]
>  Signed-off-by: Khem Raj <raj.khem@gmail.com>
> +
> +Refresh patch from master to deduplicate patches and fix arm linker
> +Signed-off-by: Pavel Zhukov <pavel@zhukoff.net>
>  ---
>   gcc/config/aarch64/aarch64-linux.h |  4 ++--
>   gcc/config/alpha/linux-elf.h       |  4 ++--
> - gcc/config/arm/linux-eabi.h        |  4 ++--
> + gcc/config/arm/linux-eabi.h        |  6 +++---
>   gcc/config/arm/linux-elf.h         |  2 +-
> - gcc/config/i386/linux.h            |  2 +-
> - gcc/config/i386/linux64.h          |  6 +++---
> + gcc/config/i386/linux.h            |  4 ++--
> + gcc/config/i386/linux64.h          | 12 ++++++------
>   gcc/config/linux.h                 |  8 ++++----
> - gcc/config/mips/linux.h            | 12 ++++++------
> - gcc/config/riscv/linux.h           |  2 +-
> + gcc/config/microblaze/linux.h      |  4 ++--
> + gcc/config/mips/linux.h            | 18 +++++++++---------
> + gcc/config/nios2/linux.h           |  4 ++--
> + gcc/config/riscv/linux.h           |  4 ++--
>   gcc/config/rs6000/linux64.h        | 15 +++++----------
> - gcc/config/sh/linux.h              |  2 +-
> + gcc/config/rs6000/sysv4.h          |  4 ++--
> + gcc/config/s390/linux.h            |  8 ++++----
> + gcc/config/sh/linux.h              |  4 ++--
>   gcc/config/sparc/linux.h           |  2 +-
>   gcc/config/sparc/linux64.h         |  4 ++--
> - 13 files changed, 31 insertions(+), 36 deletions(-)
> + 17 files changed, 53 insertions(+), 58 deletions(-)
>
> -diff --git a/gcc/config/aarch64/aarch64-linux.h
> b/gcc/config/aarch64/aarch64-linux.h
> -index 7f2529a2a1d..4bcae7f3110 100644
> ---- a/gcc/config/aarch64/aarch64-linux.h
> -+++ b/gcc/config/aarch64/aarch64-linux.h
> +Index: gcc-11.3.0/gcc/config/aarch64/aarch64-linux.h
> +===================================================================
> +--- gcc-11.3.0.orig/gcc/config/aarch64/aarch64-linux.h
> ++++ gcc-11.3.0/gcc/config/aarch64/aarch64-linux.h
>  @@ -21,10 +21,10 @@
>   #ifndef GCC_AARCH64_LINUX_H
>   #define GCC_AARCH64_LINUX_H
> @@ -47,11 +56,11 @@ index 7f2529a2a1d..4bcae7f3110 100644
>
>   #undef  ASAN_CC1_SPEC
>   #define ASAN_CC1_SPEC "%{%:sanitize(address):-funwind-tables}"
> -diff --git a/gcc/config/alpha/linux-elf.h b/gcc/config/alpha/linux-elf.h
> -index c1dae8ca2cf..3ce2b76c1a4 100644
> ---- a/gcc/config/alpha/linux-elf.h
> -+++ b/gcc/config/alpha/linux-elf.h
> -@@ -23,8 +23,8 @@ along with GCC; see the file COPYING3.  If not see
> +Index: gcc-11.3.0/gcc/config/alpha/linux-elf.h
> +===================================================================
> +--- gcc-11.3.0.orig/gcc/config/alpha/linux-elf.h
> ++++ gcc-11.3.0/gcc/config/alpha/linux-elf.h
> +@@ -23,8 +23,8 @@ along with GCC; see the file COPYING3.
>   #define EXTRA_SPECS \
>   { "elf_dynamic_linker", ELF_DYNAMIC_LINKER },
>
> @@ -62,10 +71,10 @@ index c1dae8ca2cf..3ce2b76c1a4 100644
>   #if DEFAULT_LIBC == LIBC_UCLIBC
>   #define CHOOSE_DYNAMIC_LINKER(G, U) "%{mglibc:" G ";:" U "}"
>   #elif DEFAULT_LIBC == LIBC_GLIBC
> -diff --git a/gcc/config/arm/linux-eabi.h b/gcc/config/arm/linux-eabi.h
> -index 85d0136e76e..6bd95855827 100644
> ---- a/gcc/config/arm/linux-eabi.h
> -+++ b/gcc/config/arm/linux-eabi.h
> +Index: gcc-11.3.0/gcc/config/arm/linux-eabi.h
> +===================================================================
> +--- gcc-11.3.0.orig/gcc/config/arm/linux-eabi.h
> ++++ gcc-11.3.0/gcc/config/arm/linux-eabi.h
>  @@ -65,8 +65,8 @@
>      GLIBC_DYNAMIC_LINKER_DEFAULT and TARGET_DEFAULT_FLOAT_ABI.  */
>
> @@ -77,10 +86,19 @@ index 85d0136e76e..6bd95855827 100644
>   #define GLIBC_DYNAMIC_LINKER_DEFAULT GLIBC_DYNAMIC_LINKER_SOFT_FLOAT
>
>   #define GLIBC_DYNAMIC_LINKER \
> -diff --git a/gcc/config/arm/linux-elf.h b/gcc/config/arm/linux-elf.h
> -index 0c1c4e70b6b..6bd643ade11 100644
> ---- a/gcc/config/arm/linux-elf.h
> -+++ b/gcc/config/arm/linux-elf.h
> +@@ -89,7 +89,7 @@
> + #define MUSL_DYNAMIC_LINKER_E "%{mbig-endian:eb}"
> + #endif
> + #define MUSL_DYNAMIC_LINKER \
> +-  "/lib/ld-musl-arm" MUSL_DYNAMIC_LINKER_E
> "%{mfloat-abi=hard:hf}%{mfdpic:-fdpic}.so.1"
> ++  SYSTEMLIBS_DIR "ld-musl-arm" MUSL_DYNAMIC_LINKER_E
> "%{mfloat-abi=hard:hf}%{mfdpic:-fdpic}.so.1"
> +
> + /* At this point, bpabi.h will have clobbered LINK_SPEC.  We want to
> +    use the GNU/Linux version, not the generic BPABI version.  */
> +Index: gcc-11.3.0/gcc/config/arm/linux-elf.h
> +===================================================================
> +--- gcc-11.3.0.orig/gcc/config/arm/linux-elf.h
> ++++ gcc-11.3.0/gcc/config/arm/linux-elf.h
>  @@ -60,7 +60,7 @@
>
>   #define LIBGCC_SPEC "%{mfloat-abi=soft*:-lfloat} -lgcc"
> @@ -90,11 +108,11 @@ index 0c1c4e70b6b..6bd643ade11 100644
>
>   #define LINUX_TARGET_LINK_SPEC  "%{h*} \
>      %{static:-Bstatic} \
> -diff --git a/gcc/config/i386/linux.h b/gcc/config/i386/linux.h
> -index 04b274f1654..7aafcf3ac2d 100644
> ---- a/gcc/config/i386/linux.h
> -+++ b/gcc/config/i386/linux.h
> -@@ -20,7 +20,7 @@ along with GCC; see the file COPYING3.  If not see
> +Index: gcc-11.3.0/gcc/config/i386/linux.h
> +===================================================================
> +--- gcc-11.3.0.orig/gcc/config/i386/linux.h
> ++++ gcc-11.3.0/gcc/config/i386/linux.h
> +@@ -20,7 +20,7 @@ along with GCC; see the file COPYING3.
>   <http://www.gnu.org/licenses/>.  */
>
>   #define GNU_USER_LINK_EMULATION "elf_i386"
> @@ -102,12 +120,13 @@ index 04b274f1654..7aafcf3ac2d 100644
>  +#define GLIBC_DYNAMIC_LINKER SYSTEMLIBS_DIR "ld-linux.so.2"
>
>   #undef MUSL_DYNAMIC_LINKER
> - #define MUSL_DYNAMIC_LINKER "/lib/ld-musl-i386.so.1"
> -diff --git a/gcc/config/i386/linux64.h b/gcc/config/i386/linux64.h
> -index b3822ced528..92d303e80d6 100644
> ---- a/gcc/config/i386/linux64.h
> -+++ b/gcc/config/i386/linux64.h
> -@@ -27,9 +27,9 @@ see the files COPYING3 and COPYING.RUNTIME
> respectively.  If not, see
> +-#define MUSL_DYNAMIC_LINKER "/lib/ld-musl-i386.so.1"
> ++#define MUSL_DYNAMIC_LINKER SYSTEMLIBS_DIR "ld-musl-i386.so.1"
> +Index: gcc-11.3.0/gcc/config/i386/linux64.h
> +===================================================================
> +--- gcc-11.3.0.orig/gcc/config/i386/linux64.h
> ++++ gcc-11.3.0/gcc/config/i386/linux64.h
> +@@ -27,13 +27,13 @@ see the files COPYING3 and COPYING.RUNTI
>   #define GNU_USER_LINK_EMULATION64 "elf_x86_64"
>   #define GNU_USER_LINK_EMULATIONX32 "elf32_x86_64"
>
> @@ -119,12 +138,19 @@ index b3822ced528..92d303e80d6 100644
>  +#define GLIBC_DYNAMIC_LINKERX32 SYSTEMLIBS_DIR "ld-linux-x32.so.2"
>
>   #undef MUSL_DYNAMIC_LINKER32
> - #define MUSL_DYNAMIC_LINKER32 "/lib/ld-musl-i386.so.1"
> -diff --git a/gcc/config/linux.h b/gcc/config/linux.h
> -index 4e1db60fced..87efc5f69fe 100644
> ---- a/gcc/config/linux.h
> -+++ b/gcc/config/linux.h
> -@@ -94,10 +94,10 @@ see the files COPYING3 and COPYING.RUNTIME
> respectively.  If not, see
> +-#define MUSL_DYNAMIC_LINKER32 "/lib/ld-musl-i386.so.1"
> ++#define MUSL_DYNAMIC_LINKER32 SYSTEMLIBS_DIR "ld-musl-i386.so.1"
> + #undef MUSL_DYNAMIC_LINKER64
> +-#define MUSL_DYNAMIC_LINKER64 "/lib/ld-musl-x86_64.so.1"
> ++#define MUSL_DYNAMIC_LINKER64 SYSTEMLIBS_DIR "ld-musl-x86_64.so.1"
> + #undef MUSL_DYNAMIC_LINKERX32
> +-#define MUSL_DYNAMIC_LINKERX32 "/lib/ld-musl-x32.so.1"
> ++#define MUSL_DYNAMIC_LINKERX32 SYSTEMLIBS_DIR "ld-musl-x32.so.1"
> +Index: gcc-11.3.0/gcc/config/linux.h
> +===================================================================
> +--- gcc-11.3.0.orig/gcc/config/linux.h
> ++++ gcc-11.3.0/gcc/config/linux.h
> +@@ -94,10 +94,10 @@ see the files COPYING3 and COPYING.RUNTI
>      GLIBC_DYNAMIC_LINKER must be defined for each target using them, or
>      GLIBC_DYNAMIC_LINKER32 and GLIBC_DYNAMIC_LINKER64 for targets
>      supporting both 32-bit and 64-bit compilation.  */
> @@ -139,11 +165,33 @@ index 4e1db60fced..87efc5f69fe 100644
>   #define BIONIC_DYNAMIC_LINKER "/system/bin/linker"
>   #define BIONIC_DYNAMIC_LINKER32 "/system/bin/linker"
>   #define BIONIC_DYNAMIC_LINKER64 "/system/bin/linker64"
> -diff --git a/gcc/config/mips/linux.h b/gcc/config/mips/linux.h
> -index 44a85e410d9..8d41b5574f6 100644
> ---- a/gcc/config/mips/linux.h
> -+++ b/gcc/config/mips/linux.h
> -@@ -22,20 +22,20 @@ along with GCC; see the file COPYING3.  If not see
> +Index: gcc-11.3.0/gcc/config/microblaze/linux.h
> +===================================================================
> +--- gcc-11.3.0.orig/gcc/config/microblaze/linux.h
> ++++ gcc-11.3.0/gcc/config/microblaze/linux.h
> +@@ -28,7 +28,7 @@
> + #undef TLS_NEEDS_GOT
> + #define TLS_NEEDS_GOT 1
> +
> +-#define GLIBC_DYNAMIC_LINKER "/lib/ld.so.1"
> ++#define GLIBC_DYNAMIC_LINKER SYSTEMLIBS_DIR "/ld.so.1"
> + #define UCLIBC_DYNAMIC_LINKER "/lib/ld-uClibc.so.0"
> +
> + #if TARGET_BIG_ENDIAN_DEFAULT == 0 /* LE */
> +@@ -38,7 +38,7 @@
> + #endif
> +
> + #undef MUSL_DYNAMIC_LINKER
> +-#define MUSL_DYNAMIC_LINKER "/lib/ld-musl-microblaze"
> MUSL_DYNAMIC_LINKER_E ".so.1"
> ++#define MUSL_DYNAMIC_LINKER SYSTEMLIBS_DIR "ld-musl-microblaze"
> MUSL_DYNAMIC_LINKER_E ".so.1"
> +
> + #undef  SUBTARGET_EXTRA_SPECS
> + #define SUBTARGET_EXTRA_SPECS \
> +Index: gcc-11.3.0/gcc/config/mips/linux.h
> +===================================================================
> +--- gcc-11.3.0.orig/gcc/config/mips/linux.h
> ++++ gcc-11.3.0/gcc/config/mips/linux.h
> +@@ -22,29 +22,29 @@ along with GCC; see the file COPYING3.
>   #define GNU_USER_LINK_EMULATIONN32 "elf32%{EB:b}%{EL:l}tsmipn32"
>
>   #define GLIBC_DYNAMIC_LINKER32 \
> @@ -170,11 +218,36 @@ index 44a85e410d9..8d41b5574f6 100644
>
>   #undef MUSL_DYNAMIC_LINKER32
>   #define MUSL_DYNAMIC_LINKER32 \
> -diff --git a/gcc/config/riscv/linux.h b/gcc/config/riscv/linux.h
> -index fce5b896e6e..03aa55cb5ab 100644
> ---- a/gcc/config/riscv/linux.h
> -+++ b/gcc/config/riscv/linux.h
> -@@ -22,7 +22,7 @@ along with GCC; see the file COPYING3.  If not see
> +-
> "/lib/ld-musl-mips%{mips32r6|mips64r6:r6}%{EL:el}%{msoft-float:-sf}.so.1"
> ++  SYSTEMLIBS_DIR
> "ld-musl-mips%{mips32r6|mips64r6:r6}%{EL:el}%{msoft-float:-sf}.so.1"
> + #undef MUSL_DYNAMIC_LINKER64
> + #define MUSL_DYNAMIC_LINKER64 \
> +-  "/lib/ld-musl-mips64%{mips64r6:r6}%{EL:el}%{msoft-float:-sf}.so.1"
> ++  SYSTEMLIBS_DIR
> "ld-musl-mips64%{mips64r6:r6}%{EL:el}%{msoft-float:-sf}.so.1"
> + #define MUSL_DYNAMIC_LINKERN32 \
> +-  "/lib/ld-musl-mipsn32%{mips64r6:r6}%{EL:el}%{msoft-float:-sf}.so.1"
> ++  SYSTEMLIBS_DIR
> "ld-musl-mipsn32%{mips64r6:r6}%{EL:el}%{msoft-float:-sf}.so.1"
> +
> + #define BIONIC_DYNAMIC_LINKERN32 "/system/bin/linker32"
> + #define GNU_USER_DYNAMIC_LINKERN32 \
> +Index: gcc-11.3.0/gcc/config/nios2/linux.h
> +===================================================================
> +--- gcc-11.3.0.orig/gcc/config/nios2/linux.h
> ++++ gcc-11.3.0/gcc/config/nios2/linux.h
> +@@ -29,7 +29,7 @@
> + #undef CPP_SPEC
> + #define CPP_SPEC "%{posix:-D_POSIX_SOURCE} %{pthread:-D_REENTRANT}"
> +
> +-#define GLIBC_DYNAMIC_LINKER "/lib/ld-linux-nios2.so.1"
> ++#define GLIBC_DYNAMIC_LINKER SYSTEMLIBS_DIR "ld-linux-nios2.so.1"
> +
> + #undef LINK_SPEC
> + #define LINK_SPEC LINK_SPEC_ENDIAN \
> +Index: gcc-11.3.0/gcc/config/riscv/linux.h
> +===================================================================
> +--- gcc-11.3.0.orig/gcc/config/riscv/linux.h
> ++++ gcc-11.3.0/gcc/config/riscv/linux.h
> +@@ -22,7 +22,7 @@ along with GCC; see the file COPYING3.
>       GNU_USER_TARGET_OS_CPP_BUILTINS();                                \
>     } while (0)
>
> @@ -183,10 +256,19 @@ index fce5b896e6e..03aa55cb5ab 100644
>
>   #define MUSL_ABI_SUFFIX \
>     "%{mabi=ilp32:-sf}" \
> -diff --git a/gcc/config/rs6000/linux64.h b/gcc/config/rs6000/linux64.h
> -index e3f2cd254f6..a11e01faa3d 100644
> ---- a/gcc/config/rs6000/linux64.h
> -+++ b/gcc/config/rs6000/linux64.h
> +@@ -33,7 +33,7 @@ along with GCC; see the file COPYING3.
> +   "%{mabi=lp64d:}"
> +
> + #undef MUSL_DYNAMIC_LINKER
> +-#define MUSL_DYNAMIC_LINKER "/lib/ld-musl-riscv" XLEN_SPEC
> MUSL_ABI_SUFFIX ".so.1"
> ++#define MUSL_DYNAMIC_LINKER SYSTEMLIBS_DIR "ld-musl-riscv" XLEN_SPEC
> MUSL_ABI_SUFFIX ".so.1"
> +
> + /* Because RISC-V only has word-sized atomics, it requries libatomic
> where
> +    others do not.  So link libatomic by default, as needed.  */
> +Index: gcc-11.3.0/gcc/config/rs6000/linux64.h
> +===================================================================
> +--- gcc-11.3.0.orig/gcc/config/rs6000/linux64.h
> ++++ gcc-11.3.0/gcc/config/rs6000/linux64.h
>  @@ -336,24 +336,19 @@ extern int dot_symbols;
>   #undef        LINK_OS_DEFAULT_SPEC
>   #define LINK_OS_DEFAULT_SPEC "%(link_os_linux)"
> @@ -217,12 +299,55 @@ index e3f2cd254f6..a11e01faa3d 100644
>
>   #undef  DEFAULT_ASM_ENDIAN
>   #if (TARGET_DEFAULT & MASK_LITTLE_ENDIAN)
> -diff --git a/gcc/config/sh/linux.h b/gcc/config/sh/linux.h
> -index 7558d2f7195..3aaa6c3a078 100644
> ---- a/gcc/config/sh/linux.h
> -+++ b/gcc/config/sh/linux.h
> -@@ -64,7 +64,7 @@ along with GCC; see the file COPYING3.  If not see
> -   "/lib/ld-musl-sh" MUSL_DYNAMIC_LINKER_E MUSL_DYNAMIC_LINKER_FP \
> +Index: gcc-11.3.0/gcc/config/rs6000/sysv4.h
> +===================================================================
> +--- gcc-11.3.0.orig/gcc/config/rs6000/sysv4.h
> ++++ gcc-11.3.0/gcc/config/rs6000/sysv4.h
> +@@ -780,10 +780,10 @@ GNU_USER_TARGET_CC1_SPEC
> +
> + #define MUSL_DYNAMIC_LINKER_E ENDIAN_SELECT("","le","")
> +
> +-#define GLIBC_DYNAMIC_LINKER "/lib/ld.so.1"
> ++#define GLIBC_DYNAMIC_LINKER SYSTEMLIBS_DIR "ld.so.1"
> + #undef MUSL_DYNAMIC_LINKER
> + #define MUSL_DYNAMIC_LINKER \
> +-  "/lib/ld-musl-powerpc" MUSL_DYNAMIC_LINKER_E "%{msoft-float:-sf}.so.1"
> ++  SYSTEMLIBS_DIR "ld-musl-powerpc" MUSL_DYNAMIC_LINKER_E
> "%{msoft-float:-sf}.so.1"
> +
> + #ifndef GNU_USER_DYNAMIC_LINKER
> + #define GNU_USER_DYNAMIC_LINKER GLIBC_DYNAMIC_LINKER
> +Index: gcc-11.3.0/gcc/config/s390/linux.h
> +===================================================================
> +--- gcc-11.3.0.orig/gcc/config/s390/linux.h
> ++++ gcc-11.3.0/gcc/config/s390/linux.h
> +@@ -72,13 +72,13 @@ along with GCC; see the file COPYING3.
> + #define MULTILIB_DEFAULTS { "m31" }
> + #endif
> +
> +-#define GLIBC_DYNAMIC_LINKER32 "/lib/ld.so.1"
> +-#define GLIBC_DYNAMIC_LINKER64 "/lib/ld64.so.1"
> ++#define GLIBC_DYNAMIC_LINKER32 SYSTEMLIBS_DIR "ld.so.1"
> ++#define GLIBC_DYNAMIC_LINKER64 SYSTEMLIBS_DIR "ld64.so.1"
> +
> + #undef MUSL_DYNAMIC_LINKER32
> +-#define MUSL_DYNAMIC_LINKER32 "/lib/ld-musl-s390.so.1"
> ++#define MUSL_DYNAMIC_LINKER32 SYSTEMLIBS_DIR "ld-musl-s390.so.1"
> + #undef MUSL_DYNAMIC_LINKER64
> +-#define MUSL_DYNAMIC_LINKER64 "/lib/ld-musl-s390x.so.1"
> ++#define MUSL_DYNAMIC_LINKER64 SYSTEMLIBS_DIR "ld-musl-s390x.so.1"
> +
> + #undef  LINK_SPEC
> + #define LINK_SPEC \
> +Index: gcc-11.3.0/gcc/config/sh/linux.h
> +===================================================================
> +--- gcc-11.3.0.orig/gcc/config/sh/linux.h
> ++++ gcc-11.3.0/gcc/config/sh/linux.h
> +@@ -61,10 +61,10 @@ along with GCC; see the file COPYING3.
> +
> + #undef MUSL_DYNAMIC_LINKER
> + #define MUSL_DYNAMIC_LINKER \
> +-  "/lib/ld-musl-sh" MUSL_DYNAMIC_LINKER_E MUSL_DYNAMIC_LINKER_FP \
> ++  SYSTEMLIBS_DIR "ld-musl-sh" MUSL_DYNAMIC_LINKER_E
> MUSL_DYNAMIC_LINKER_FP \
>     "%{mfdpic:-fdpic}.so.1"
>
>  -#define GLIBC_DYNAMIC_LINKER "/lib/ld-linux.so.2"
> @@ -230,11 +355,11 @@ index 7558d2f7195..3aaa6c3a078 100644
>
>   #undef SUBTARGET_LINK_EMUL_SUFFIX
>   #define SUBTARGET_LINK_EMUL_SUFFIX "%{mfdpic:_fd;:_linux}"
> -diff --git a/gcc/config/sparc/linux.h b/gcc/config/sparc/linux.h
> -index 2550d7ee8f0..a94f4cd8ba2 100644
> ---- a/gcc/config/sparc/linux.h
> -+++ b/gcc/config/sparc/linux.h
> -@@ -78,7 +78,7 @@ extern const char *host_detect_local_cpu (int argc,
> const char **argv);
> +Index: gcc-11.3.0/gcc/config/sparc/linux.h
> +===================================================================
> +--- gcc-11.3.0.orig/gcc/config/sparc/linux.h
> ++++ gcc-11.3.0/gcc/config/sparc/linux.h
> +@@ -78,7 +78,7 @@ extern const char *host_detect_local_cpu
>      When the -shared link option is used a final link is not being
>      done.  */
>
> @@ -243,11 +368,11 @@ index 2550d7ee8f0..a94f4cd8ba2 100644
>
>   #undef  LINK_SPEC
>   #define LINK_SPEC "-m elf32_sparc %{shared:-shared} \
> -diff --git a/gcc/config/sparc/linux64.h b/gcc/config/sparc/linux64.h
> -index 95af8afa9b5..63127afb074 100644
> ---- a/gcc/config/sparc/linux64.h
> -+++ b/gcc/config/sparc/linux64.h
> -@@ -78,8 +78,8 @@ along with GCC; see the file COPYING3.  If not see
> +Index: gcc-11.3.0/gcc/config/sparc/linux64.h
> +===================================================================
> +--- gcc-11.3.0.orig/gcc/config/sparc/linux64.h
> ++++ gcc-11.3.0/gcc/config/sparc/linux64.h
> +@@ -78,8 +78,8 @@ along with GCC; see the file COPYING3.
>      When the -shared link option is used a final link is not being
>      done.  */
>
> diff --git
> a/meta/recipes-devtools/gcc/gcc/0009-gcc-armv4-pass-fix-v4bx-to-linker-to-support-EABI.patch
> b/meta/recipes-devtools/gcc/gcc/0009-gcc-armv4-pass-fix-v4bx-to-linker-to-support-EABI.patch
> index ac139542f1..0f94936140 100644
> ---
> a/meta/recipes-devtools/gcc/gcc/0009-gcc-armv4-pass-fix-v4bx-to-linker-to-support-EABI.patch
> +++
> b/meta/recipes-devtools/gcc/gcc/0009-gcc-armv4-pass-fix-v4bx-to-linker-to-support-EABI.patch
> @@ -18,13 +18,13 @@ Upstream-Status: Pending
>   gcc/config/arm/linux-eabi.h | 6 +++++-
>   1 file changed, 5 insertions(+), 1 deletion(-)
>
> -diff --git a/gcc/config/arm/linux-eabi.h b/gcc/config/arm/linux-eabi.h
> -index 6bd95855827..77befab5da8 100644
> ---- a/gcc/config/arm/linux-eabi.h
> -+++ b/gcc/config/arm/linux-eabi.h
> +Index: gcc-11.3.0/gcc/config/arm/linux-eabi.h
> +===================================================================
> +--- gcc-11.3.0.orig/gcc/config/arm/linux-eabi.h
> ++++ gcc-11.3.0/gcc/config/arm/linux-eabi.h
>  @@ -91,10 +91,14 @@
>   #define MUSL_DYNAMIC_LINKER \
> -   "/lib/ld-musl-arm" MUSL_DYNAMIC_LINKER_E
> "%{mfloat-abi=hard:hf}%{mfdpic:-fdpic}.so.1"
> +   SYSTEMLIBS_DIR "ld-musl-arm" MUSL_DYNAMIC_LINKER_E
> "%{mfloat-abi=hard:hf}%{mfdpic:-fdpic}.so.1"
>
>  +/* For armv4 we pass --fix-v4bx to linker to support EABI */
>  +#undef TARGET_FIX_V4BX_SPEC
> diff --git
> a/meta/recipes-devtools/gcc/gcc/0019-nios2-Define-MUSL_DYNAMIC_LINKER.patch
> b/meta/recipes-devtools/gcc/gcc/0019-nios2-Define-MUSL_DYNAMIC_LINKER.patch
> deleted file mode 100644
> index 76ebfd7f77..0000000000
> ---
> a/meta/recipes-devtools/gcc/gcc/0019-nios2-Define-MUSL_DYNAMIC_LINKER.patch
> +++ /dev/null
> @@ -1,25 +0,0 @@
> -From 9ec4db8e910d9a51ae43f6b20d4bf1dac2d8cca8 Mon Sep 17 00:00:00 2001
> -From: Khem Raj <raj.khem@gmail.com>
> -Date: Tue, 2 Feb 2016 10:26:10 -0800
> -Subject: [PATCH] nios2: Define MUSL_DYNAMIC_LINKER
> -
> -Upstream-Status: Backport [
> https://gcc.gnu.org/git/?p=gcc.git;a=commitdiff;h=e5ddbbf992b909d8e38851bd3179d29389e6ac97
> ]
> -
> -Signed-off-by: Marek Vasut <marex@denx.de>
> -Signed-off-by: Khem Raj <raj.khem@gmail.com>
> ----
> - gcc/config/nios2/linux.h | 1 +
> - 1 file changed, 1 insertion(+)
> -
> -diff --git a/gcc/config/nios2/linux.h b/gcc/config/nios2/linux.h
> -index 08edf1521f6..15696d86241 100644
> ---- a/gcc/config/nios2/linux.h
> -+++ b/gcc/config/nios2/linux.h
> -@@ -30,6 +30,7 @@
> - #define CPP_SPEC "%{posix:-D_POSIX_SOURCE} %{pthread:-D_REENTRANT}"
> -
> - #define GLIBC_DYNAMIC_LINKER "/lib/ld-linux-nios2.so.1"
> -+#define MUSL_DYNAMIC_LINKER  "/lib/ld-musl-nios2.so.1"
> -
> - #undef LINK_SPEC
> - #define LINK_SPEC LINK_SPEC_ENDIAN \
> --
> 2.39.0
>
>
> -=-=-=-=-=-=-=-=-=-=-=-
> Links: You receive all messages sent to this group.
> View/Reply Online (#175962):
> https://lists.openembedded.org/g/openembedded-core/message/175962
> Mute This Topic: https://lists.openembedded.org/mt/96302818/1997914
> Group Owner: openembedded-core+owner@lists.openembedded.org
> Unsubscribe: https://lists.openembedded.org/g/openembedded-core/unsub [
> raj.khem@gmail.com]
> -=-=-=-=-=-=-=-=-=-=-=-
>
>

--0000000000007fe26a05f2634ab1
Content-Type: text/html; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

<div><br></div><div><br><div class=3D"gmail_quote"><div dir=3D"ltr" class=
=3D"gmail_attr">On Sun, Jan 15, 2023 at 11:56 PM Pavel Zhukov &lt;<a href=
=3D"mailto:pavel@zhukoff.net">pavel@zhukoff.net</a>&gt; wrote:<br></div><bl=
ockquote class=3D"gmail_quote" style=3D"margin:0 0 0 .8ex;border-left:1px #=
ccc solid;padding-left:1ex">Backport fix from master to allow gcc to use pr=
oper linker path for<br>
musl [Yocto #14977].</blockquote><div dir=3D"auto"><br></div><div dir=3D"au=
to">Lgtm</div><div dir=3D"auto"><br></div><blockquote class=3D"gmail_quote"=
 style=3D"margin:0 0 0 .8ex;border-left:1px #ccc solid;padding-left:1ex" di=
r=3D"auto"><br>
<br>
Fixes:<br>
| qemu-arm: Could not open &#39;/lib/ld-musl-armhf.so.1&#39;: No such file =
or directory<br>
<br>
Signed-off-by: Pavel Zhukov &lt;<a href=3D"mailto:pavel@zhukoff.net" target=
=3D"_blank">pavel@zhukoff.net</a>&gt;<br>
---<br>
=C2=A0meta/recipes-devtools/gcc/gcc-11.3.inc=C2=A0 =C2=A0 =C2=A0 =C2=A0 |=
=C2=A0 =C2=A01 -<br>
=C2=A0...rm-add-armv9-a-architecture-to-march.patch |=C2=A0 89 +++---<br>
=C2=A0...AMIC_LINKER-and-UCLIBC_DYNAMIC_LINKE.patch | 269 +++++++++++++----=
-<br>
=C2=A0...s-fix-v4bx-to-linker-to-support-EABI.patch |=C2=A0 10 +-<br>
=C2=A0...019-nios2-Define-MUSL_DYNAMIC_LINKER.patch |=C2=A0 25 --<br>
=C2=A05 files changed, 245 insertions(+), 149 deletions(-)<br>
=C2=A0delete mode 100644 meta/recipes-devtools/gcc/gcc/0019-nios2-Define-MU=
SL_DYNAMIC_LINKER.patch<br>
<br>
diff --git a/meta/recipes-devtools/gcc/gcc-11.3.inc b/meta/recipes-devtools=
/gcc/gcc-11.3.inc<br>
index 27074a06ae..ab2ece3cce 100644<br>
--- a/meta/recipes-devtools/gcc/gcc-11.3.inc<br>
+++ b/meta/recipes-devtools/gcc/gcc-11.3.inc<br>
@@ -48,7 +48,6 @@ SRC_URI =3D &quot;\<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 file://0016-If-CXXFLAGS-contains-=
something-unsupported-by-the-bu.patch \<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 file://0017-handle-sysroot-suppor=
t-for-nativesdk-gcc.patch \<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 file://0018-Search-target-sysroot=
-gcc-version-specific-dirs-with.patch \<br>
-=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0file://0019-nios2-Define-MUSL_DYN=
AMIC_LINKER.patch \<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 file://0020-Add-ssp_nonshared-to-=
link-commandline-for-musl-targe.patch \<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 file://0021-Link-libgcc-using-LDF=
LAGS-not-just-SHLIB_LDFLAGS.patch \<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 file://0022-sync-gcc-stddef.h-wit=
h-musl.patch \<br>
diff --git a/meta/recipes-devtools/gcc/gcc/0004-arm-add-armv9-a-architectur=
e-to-march.patch b/meta/recipes-devtools/gcc/gcc/0004-arm-add-armv9-a-archi=
tecture-to-march.patch<br>
index c38d1b9119..864c8b3017 100644<br>
--- a/meta/recipes-devtools/gcc/gcc/0004-arm-add-armv9-a-architecture-to-ma=
rch.patch<br>
+++ b/meta/recipes-devtools/gcc/gcc/0004-arm-add-armv9-a-architecture-to-ma=
rch.patch<br>
@@ -43,10 +43,10 @@ Signed-off-by: Ruiqiang Hao &lt;<a href=3D"mailto:Ruiqi=
ang.Hao@windriver.com" target=3D"_blank">Ruiqiang.Hao@windriver.com</a>&gt;=
<br>
=C2=A0 gcc/testsuite/lib/target-supports.exp=C2=A0 =C2=A0 =C2=A0|=C2=A0 3 +=
+-<br>
=C2=A0 9 files changed, 79 insertions(+), 8 deletions(-)<br>
<br>
-diff --git a/gcc/config/arm/<a href=3D"http://arm-cpus.in" rel=3D"noreferr=
er" target=3D"_blank">arm-cpus.in</a> b/gcc/config/arm/<a href=3D"http://ar=
m-cpus.in" rel=3D"noreferrer" target=3D"_blank">arm-cpus.in</a><br>
-index bcc9ebe9f..58d83829c 100644<br>
---- a/gcc/config/arm/<a href=3D"http://arm-cpus.in" rel=3D"noreferrer" tar=
get=3D"_blank">arm-cpus.in</a><br>
-+++ b/gcc/config/arm/<a href=3D"http://arm-cpus.in" rel=3D"noreferrer" tar=
get=3D"_blank">arm-cpus.in</a><br>
+Index: gcc-11.3.0/gcc/config/arm/<a href=3D"http://arm-cpus.in" rel=3D"nor=
eferrer" target=3D"_blank">arm-cpus.in</a><br>
+=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D<br>
+--- gcc-11.3.0.orig/gcc/config/arm/<a href=3D"http://arm-cpus.in" rel=3D"n=
oreferrer" target=3D"_blank">arm-cpus.in</a><br>
++++ gcc-11.3.0/gcc/config/arm/<a href=3D"http://arm-cpus.in" rel=3D"norefe=
rrer" target=3D"_blank">arm-cpus.in</a><br>
=C2=A0@@ -132,6 +132,9 @@ define feature cmse<br>
=C2=A0 # Architecture rel 8.1-M.<br>
=C2=A0 define feature armv8_1m_main<br>
@@ -57,7 +57,7 @@ index bcc9ebe9f..58d83829c 100644<br>
=C2=A0 # Floating point and Neon extensions.<br>
=C2=A0 # VFPv1 is not supported in GCC.<br>
<br>
-@@ -293,6 +296,7 @@ define fgroup ARMv8m_base ARMv6m armv8 cmse tdiv<br>
+@@ -293,6 +296,7 @@ define fgroup ARMv8m_base ARMv6m armv8 c<br>
=C2=A0 define fgroup ARMv8m_main ARMv7m armv8 cmse<br>
=C2=A0 define fgroup ARMv8r=C2=A0 =C2=A0 =C2=A0 ARMv8a<br>
=C2=A0 define fgroup ARMv8_1m_main ARMv8m_main armv8_1m_main<br>
@@ -87,10 +87,10 @@ index bcc9ebe9f..58d83829c 100644<br>
=C2=A0 begin arch iwmmxt<br>
=C2=A0 =C2=A0tune for iwmmxt<br>
=C2=A0 =C2=A0tune flags LDSCHED STRONG XSCALE<br>
-diff --git a/gcc/config/arm/arm-tables.opt b/gcc/config/arm/arm-tables.opt=
<br>
-index 5692d4fb7..ae3dd9414 100644<br>
---- a/gcc/config/arm/arm-tables.opt<br>
-+++ b/gcc/config/arm/arm-tables.opt<br>
+Index: gcc-11.3.0/gcc/config/arm/arm-tables.opt<br>
+=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D<br>
+--- gcc-11.3.0.orig/gcc/config/arm/arm-tables.opt<br>
++++ gcc-11.3.0/gcc/config/arm/arm-tables.opt<br>
=C2=A0@@ -380,10 +380,13 @@ EnumValue<br>
=C2=A0 Enum(arm_arch) String(armv8.1-m.main) Value(30)<br>
<br>
@@ -107,10 +107,10 @@ index 5692d4fb7..ae3dd9414 100644<br>
<br>
=C2=A0 Enum<br>
=C2=A0 Name(arm_fpu) Type(enum fpu_type)<br>
-diff --git a/gcc/config/arm/arm.h b/gcc/config/arm/arm.h<br>
-index 47c13a9e5..088c7725c 100644<br>
---- a/gcc/config/arm/arm.h<br>
-+++ b/gcc/config/arm/arm.h<br>
+Index: gcc-11.3.0/gcc/config/arm/arm.h<br>
+=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D<br>
+--- gcc-11.3.0.orig/gcc/config/arm/arm.h<br>
++++ gcc-11.3.0/gcc/config/arm/arm.h<br>
=C2=A0@@ -456,7 +456,8 @@ enum base_architecture<br>
=C2=A0 =C2=A0 BASE_ARCH_8A =3D 8,<br>
=C2=A0 =C2=A0 BASE_ARCH_8M_BASE =3D 8,<br>
@@ -121,10 +121,10 @@ index 47c13a9e5..088c7725c 100644<br>
=C2=A0 };<br>
<br>
=C2=A0 /* The major revision number of the ARM Architecture implemented by =
the target.=C2=A0 */<br>
-diff --git a/gcc/config/arm/t-aprofile b/gcc/config/arm/t-aprofile<br>
-index 8574ac3e2..68e2251c7 100644<br>
---- a/gcc/config/arm/t-aprofile<br>
-+++ b/gcc/config/arm/t-aprofile<br>
+Index: gcc-11.3.0/gcc/config/arm/t-aprofile<br>
+=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D<br>
+--- gcc-11.3.0.orig/gcc/config/arm/t-aprofile<br>
++++ gcc-11.3.0/gcc/config/arm/t-aprofile<br>
=C2=A0@@ -26,8 +26,8 @@<br>
<br>
=C2=A0 # Arch and FPU variants to build libraries with<br>
@@ -136,7 +136,7 @@ index 8574ac3e2..68e2251c7 100644<br>
<br>
=C2=A0 # ARMv7-A - build nofp, fp-d16 and SIMD variants<br>
<br>
-@@ -46,6 +46,11 @@ MULTILIB_REQUIRED=C2=A0 =C2=A0+=3D mthumb/march=3Darmv8=
-a/mfloat-abi=3Dsoft<br>
+@@ -46,6 +46,11 @@ MULTILIB_REQUIRED=C2=A0 =C2=A0+=3D mthumb/march=3Darmv8=
-<br>
=C2=A0 MULTILIB_REQUIRED=C2=A0 =C2=A0 =C2=A0+=3D mthumb/march=3Darmv8-a+sim=
d/mfloat-abi=3Dhard<br>
=C2=A0 MULTILIB_REQUIRED=C2=A0 =C2=A0 =C2=A0+=3D mthumb/march=3Darmv8-a+sim=
d/mfloat-abi=3Dsoftfp<br>
<br>
@@ -148,7 +148,7 @@ index 8574ac3e2..68e2251c7 100644<br>
=C2=A0 # Matches<br>
<br>
=C2=A0 # Arch Matches<br>
-@@ -129,17 +134,29 @@ MULTILIB_MATCHES +=3D march?armv8-a=3Dmarch?armv8.6-=
a<br>
+@@ -129,17 +134,29 @@ MULTILIB_MATCHES +=3D march?armv8-a=3Dmarch?<br>
=C2=A0 MULTILIB_MATCHES=C2=A0 =C2=A0 =C2=A0 +=3D $(foreach ARCH, $(v8_6_a_s=
imd_variants), \<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0march?armv8-a+simd=3Dmarch?armv8.6-a$(ARCH))=
<br>
<br>
@@ -180,11 +180,11 @@ index 8574ac3e2..68e2251c7 100644<br>
=C2=A0-=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0$(foreach ARCH, armv7-a armv8-a, \<br>
=C2=A0+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0$(foreach ARCH, armv7-a armv8-a armv9-a, \<b=
r>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0mthumb/march.$(ARCH)/mfloat-abi.soft=
=3Dm$(MODE)/march.$(ARCH)/mfloat-abi.softfp))<br>
-diff --git a/gcc/config/arm/t-arm-elf b/gcc/config/arm/t-arm-elf<br>
-index d68def308..b3a900e8c 100644<br>
---- a/gcc/config/arm/t-arm-elf<br>
-+++ b/gcc/config/arm/t-arm-elf<br>
-@@ -38,6 +38,8 @@ v7ve_fps=C2=A0 =C2=A0 =C2=A0:=3D vfpv3-d16 vfpv3 vfpv3-d=
16-fp16 vfpv3-fp16 vfpv4 neon \<br>
+Index: gcc-11.3.0/gcc/config/arm/t-arm-elf<br>
+=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D<br>
+--- gcc-11.3.0.orig/gcc/config/arm/t-arm-elf<br>
++++ gcc-11.3.0/gcc/config/arm/t-arm-elf<br>
+@@ -38,6 +38,8 @@ v7ve_fps=C2=A0 =C2=A0 =C2=A0:=3D vfpv3-d16 vfpv3 vfpv3-d=
16-fp<br>
=C2=A0 # it seems to work ok.<br>
=C2=A0 v8_fps=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 :=3D s=
imd fp16 crypto fp16+crypto dotprod fp16fml<br>
<br>
@@ -202,7 +202,7 @@ index d68def308..b3a900e8c 100644<br>
=C2=A0 # No floating point variants, require thumb1 softfp<br>
=C2=A0 all_nofp_t=C2=A0 =C2=A0 :=3D armv6-m armv6s-m armv8-m.base<br>
<br>
-@@ -110,6 +114,11 @@ MULTILIB_MATCHES=C2=A0 =C2=A0 =C2=A0+=3D $(foreach AR=
CH, $(all_v8_archs), \<br>
+@@ -110,6 +114,11 @@ MULTILIB_MATCHES=C2=A0 =C2=A0 =C2=A0+=3D $(foreach AR=
CH,<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 =C2=A0 $(foreach FPARCH, $(v8_fps), \<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 =C2=A0 =C2=A0 march?armv7+fp=3Dmarch?$(ARCH)+$(FPARCH)))<br>
<br>
@@ -214,11 +214,11 @@ index d68def308..b3a900e8c 100644<br>
=C2=A0 MULTILIB_MATCHES=C2=A0 =C2=A0 =C2=A0+=3D $(foreach ARCH, armv7e-m ar=
mv8-m.mainline, \<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 =C2=A0 march?armv7+fp=3Dmarch?$(ARCH)+fp.dp)<br>
<br>
-diff --git a/gcc/config/arm/t-multilib b/gcc/config/arm/t-multilib<br>
-index ddc5033bf..d789b86ee 100644<br>
---- a/gcc/config/arm/t-multilib<br>
-+++ b/gcc/config/arm/t-multilib<br>
-@@ -78,6 +78,8 @@ v8_4_a_simd_variants :=3D $(call all_feat_combs, simd fp=
16 crypto i8mm bf16)<br>
+Index: gcc-11.3.0/gcc/config/arm/t-multilib<br>
+=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D<br>
+--- gcc-11.3.0.orig/gcc/config/arm/t-multilib<br>
++++ gcc-11.3.0/gcc/config/arm/t-multilib<br>
+@@ -78,6 +78,8 @@ v8_4_a_simd_variants :=3D $(call all_feat_<br>
=C2=A0 v8_5_a_simd_variants=C2=A0 :=3D $(call all_feat_combs, simd fp16 cry=
pto i8mm bf16)<br>
=C2=A0 v8_6_a_simd_variants=C2=A0 :=3D $(call all_feat_combs, simd fp16 cry=
pto i8mm bf16)<br>
=C2=A0 v8_r_nosimd_variants=C2=A0 :=3D +crc<br>
@@ -227,7 +227,7 @@ index ddc5033bf..d789b86ee 100644<br>
<br>
=C2=A0 ifneq (,$(HAS_APROFILE))<br>
=C2=A0 include $(srcdir)/config/arm/t-aprofile<br>
-@@ -202,6 +204,16 @@ MULTILIB_MATCHES=C2=A0 +=3D march?armv7=3Dmarch?armv8=
.6-a<br>
+@@ -202,6 +204,16 @@ MULTILIB_MATCHES=C2=A0 +=3D march?armv7=3Dmarch?ar<br=
>
=C2=A0 MULTILIB_MATCHES=C2=A0 =C2=A0 =C2=A0 +=3D $(foreach ARCH, $(v8_6_a_s=
imd_variants), \<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0march?armv7+fp=3Dmarch?armv8.6-a$(ARCH))<br>
<br>
@@ -244,10 +244,10 @@ index ddc5033bf..d789b86ee 100644<br>
=C2=A0 endif=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0# Not APROFILE.<br>
<br>
=C2=A0 # Use Thumb libraries for everything.<br>
-diff --git a/gcc/doc/invoke.texi b/gcc/doc/invoke.texi<br>
-index 7184a62d0..9a712c0d6 100644<br>
---- a/gcc/doc/invoke.texi<br>
-+++ b/gcc/doc/invoke.texi<br>
+Index: gcc-11.3.0/gcc/doc/invoke.texi<br>
+=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D<br>
+--- gcc-11.3.0.orig/gcc/doc/invoke.texi<br>
++++ gcc-11.3.0/gcc/doc/invoke.texi<br>
=C2=A0@@ -19701,6 +19701,7 @@ Permissible names are:<br>
=C2=A0 @samp{armv7-m}, @samp{armv7e-m},<br>
=C2=A0 @samp{armv8-m.base}, @samp{armv8-m.main},<br>
@@ -256,10 +256,10 @@ index 7184a62d0..9a712c0d6 100644<br>
=C2=A0 @samp{iwmmxt} and @samp{iwmmxt2}.<br>
<br>
=C2=A0 Additionally, the following architectures, which lack support for th=
e<br>
-diff --git a/gcc/testsuite/gcc.target/arm/multilib.exp b/gcc/testsuite/gcc=
.target/arm/multilib.exp<br>
-index 4b30025db..e3f06c316 100644<br>
---- a/gcc/testsuite/gcc.target/arm/multilib.exp<br>
-+++ b/gcc/testsuite/gcc.target/arm/multilib.exp<br>
+Index: gcc-11.3.0/gcc/testsuite/gcc.target/arm/multilib.exp<br>
+=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D<br>
+--- gcc-11.3.0.orig/gcc/testsuite/gcc.target/arm/multilib.exp<br>
++++ gcc-11.3.0/gcc/testsuite/gcc.target/arm/multilib.exp<br>
=C2=A0@@ -135,6 +135,14 @@ if {[multilib_config &quot;aprofile&quot;] } {<b=
r>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 {-march=3Darmv8.6-a+simd+fp16 -mfloat-abi=3Dsof=
tfp} &quot;thumb/v8-a+simd/softfp&quot;<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 {-march=3Darmv8.6-a+simd+fp16+nofp -mfloat-abi=
=3Dsoftfp} &quot;thumb/v8-a/nofp&quot;<br>
@@ -275,10 +275,10 @@ index 4b30025db..e3f06c316 100644<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 {-mcpu=3Dcortex-a53+crypto -mfloat-abi=3Dhard} =
&quot;thumb/v8-a+simd/hard&quot;<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 {-mcpu=3Dcortex-a53+nofp -mfloat-abi=3Dsoftfp} =
&quot;thumb/v8-a/nofp&quot;<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 {-march=3Darmv8-a+crc -mfloat-abi=3Dhard -mfpu=
=3Dvfp} &quot;thumb/v8-a+simd/hard&quot;<br>
-diff --git a/gcc/testsuite/lib/target-supports.exp b/gcc/testsuite/lib/tar=
get-supports.exp<br>
-index 857e57218..52e043917 100644<br>
---- a/gcc/testsuite/lib/target-supports.exp<br>
-+++ b/gcc/testsuite/lib/target-supports.exp<br>
+Index: gcc-11.3.0/gcc/testsuite/lib/target-supports.exp<br>
+=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D<br>
+--- gcc-11.3.0.orig/gcc/testsuite/lib/target-supports.exp<br>
++++ gcc-11.3.0/gcc/testsuite/lib/target-supports.exp<br>
=C2=A0@@ -4820,7 +4820,8 @@ foreach { armfunc armflag armdefs } {<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 v8m_base &quot;-march=3Darmv8-m.base -mthumb -m=
float-abi=3Dsoft&quot;<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 __ARM_ARCH_8M_BASE_=
_<br>
@@ -289,6 +289,3 @@ index 857e57218..52e043917 100644<br>
=C2=A0 =C2=A0 =C2=A0 eval [string map [list FUNC $armfunc FLAG $armflag DEF=
S $armdefs ] {<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 proc check_effective_target_arm_arch_FUNC_ok { =
} {<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 return [check_no_compiler_message=
s arm_arch_FUNC_ok assembly {<br>
--- <br>
-2.34.1<br>
-<br>
diff --git a/meta/recipes-devtools/gcc/gcc/0006-Define-GLIBC_DYNAMIC_LINKER=
-and-UCLIBC_DYNAMIC_LINKE.patch b/meta/recipes-devtools/gcc/gcc/0006-Define=
-GLIBC_DYNAMIC_LINKER-and-UCLIBC_DYNAMIC_LINKE.patch<br>
index ef19eef822..b3515c9734 100644<br>
--- a/meta/recipes-devtools/gcc/gcc/0006-Define-GLIBC_DYNAMIC_LINKER-and-UC=
LIBC_DYNAMIC_LINKE.patch<br>
+++ b/meta/recipes-devtools/gcc/gcc/0006-Define-GLIBC_DYNAMIC_LINKER-and-UC=
LIBC_DYNAMIC_LINKE.patch<br>
@@ -1,4 +1,4 @@<br>
-From 84dd8ea4c982fc2c82af642293d29e9c1880de5b Mon Sep 17 00:00:00 2001<br>
+From 4de00af67b57b5440bdf61ab364ad959ad0aeee7 Mon Sep 17 00:00:00 2001<br>
=C2=A0From: Khem Raj &lt;<a href=3D"mailto:raj.khem@gmail.com" target=3D"_b=
lank">raj.khem@gmail.com</a>&gt;<br>
=C2=A0Date: Fri, 29 Mar 2013 09:24:50 +0400<br>
=C2=A0Subject: [PATCH] Define GLIBC_DYNAMIC_LINKER and UCLIBC_DYNAMIC_LINKE=
R<br>
@@ -12,28 +12,37 @@ SH, sparc, alpha for possible future support (if any)<b=
r>
<br>
=C2=A0Removes the do_headerfix task in metadata<br>
<br>
+Signed-off-by: Khem Raj &lt;<a href=3D"mailto:raj.khem@gmail.com" target=
=3D"_blank">raj.khem@gmail.com</a>&gt;<br>
+<br>
=C2=A0Upstream-Status: Inappropriate [OE configuration]<br>
=C2=A0Signed-off-by: Khem Raj &lt;<a href=3D"mailto:raj.khem@gmail.com" tar=
get=3D"_blank">raj.khem@gmail.com</a>&gt;<br>
+<br>
+Refresh patch from master to deduplicate patches and fix arm linker<br>
+Signed-off-by: Pavel Zhukov &lt;<a href=3D"mailto:pavel@zhukoff.net" targe=
t=3D"_blank">pavel@zhukoff.net</a>&gt;<br>
=C2=A0---<br>
=C2=A0 gcc/config/aarch64/aarch64-linux.h |=C2=A0 4 ++--<br>
=C2=A0 gcc/config/alpha/linux-elf.h=C2=A0 =C2=A0 =C2=A0 =C2=A0|=C2=A0 4 ++-=
-<br>
- gcc/config/arm/linux-eabi.h=C2=A0 =C2=A0 =C2=A0 =C2=A0 |=C2=A0 4 ++--<br>
+ gcc/config/arm/linux-eabi.h=C2=A0 =C2=A0 =C2=A0 =C2=A0 |=C2=A0 6 +++---<b=
r>
=C2=A0 gcc/config/arm/linux-elf.h=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0|=C2=A0 =
2 +-<br>
- gcc/config/i386/linux.h=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 |=C2=A0 =
2 +-<br>
- gcc/config/i386/linux64.h=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 |=C2=A0 6 +++=
---<br>
+ gcc/config/i386/linux.h=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 |=C2=A0 =
4 ++--<br>
+ gcc/config/i386/linux64.h=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 | 12 ++++++--=
----<br>
=C2=A0 gcc/config/linux.h=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =
=C2=A0 =C2=A0|=C2=A0 8 ++++----<br>
- gcc/config/mips/linux.h=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 | 12 +++=
+++------<br>
- gcc/config/riscv/linux.h=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0|=C2=A0 =
2 +-<br>
+ gcc/config/microblaze/linux.h=C2=A0 =C2=A0 =C2=A0 |=C2=A0 4 ++--<br>
+ gcc/config/mips/linux.h=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 | 18 +++=
++++++---------<br>
+ gcc/config/nios2/linux.h=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0|=C2=A0 =
4 ++--<br>
+ gcc/config/riscv/linux.h=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0|=C2=A0 =
4 ++--<br>
=C2=A0 gcc/config/rs6000/linux64.h=C2=A0 =C2=A0 =C2=A0 =C2=A0 | 15 +++++---=
-------<br>
- gcc/config/sh/linux.h=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 |=
=C2=A0 2 +-<br>
+ gcc/config/rs6000/sysv4.h=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 |=C2=A0 4 ++-=
-<br>
+ gcc/config/s390/linux.h=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 |=C2=A0 =
8 ++++----<br>
+ gcc/config/sh/linux.h=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 |=
=C2=A0 4 ++--<br>
=C2=A0 gcc/config/sparc/linux.h=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0|=
=C2=A0 2 +-<br>
=C2=A0 gcc/config/sparc/linux64.h=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0|=C2=A0 =
4 ++--<br>
- 13 files changed, 31 insertions(+), 36 deletions(-)<br>
+ 17 files changed, 53 insertions(+), 58 deletions(-)<br>
<br>
-diff --git a/gcc/config/aarch64/aarch64-linux.h b/gcc/config/aarch64/aarch=
64-linux.h<br>
-index 7f2529a2a1d..4bcae7f3110 100644<br>
---- a/gcc/config/aarch64/aarch64-linux.h<br>
-+++ b/gcc/config/aarch64/aarch64-linux.h<br>
+Index: gcc-11.3.0/gcc/config/aarch64/aarch64-linux.h<br>
+=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D<br>
+--- gcc-11.3.0.orig/gcc/config/aarch64/aarch64-linux.h<br>
++++ gcc-11.3.0/gcc/config/aarch64/aarch64-linux.h<br>
=C2=A0@@ -21,10 +21,10 @@<br>
=C2=A0 #ifndef GCC_AARCH64_LINUX_H<br>
=C2=A0 #define GCC_AARCH64_LINUX_H<br>
@@ -47,11 +56,11 @@ index 7f2529a2a1d..4bcae7f3110 100644<br>
<br>
=C2=A0 #undef=C2=A0 ASAN_CC1_SPEC<br>
=C2=A0 #define ASAN_CC1_SPEC &quot;%{%:sanitize(address):-funwind-tables}&q=
uot;<br>
-diff --git a/gcc/config/alpha/linux-elf.h b/gcc/config/alpha/linux-elf.h<b=
r>
-index c1dae8ca2cf..3ce2b76c1a4 100644<br>
---- a/gcc/config/alpha/linux-elf.h<br>
-+++ b/gcc/config/alpha/linux-elf.h<br>
-@@ -23,8 +23,8 @@ along with GCC; see the file COPYING3.=C2=A0 If not see<=
br>
+Index: gcc-11.3.0/gcc/config/alpha/linux-elf.h<br>
+=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D<br>
+--- gcc-11.3.0.orig/gcc/config/alpha/linux-elf.h<br>
++++ gcc-11.3.0/gcc/config/alpha/linux-elf.h<br>
+@@ -23,8 +23,8 @@ along with GCC; see the file COPYING3.<br>
=C2=A0 #define EXTRA_SPECS \<br>
=C2=A0 { &quot;elf_dynamic_linker&quot;, ELF_DYNAMIC_LINKER },<br>
<br>
@@ -62,10 +71,10 @@ index c1dae8ca2cf..3ce2b76c1a4 100644<br>
=C2=A0 #if DEFAULT_LIBC =3D=3D LIBC_UCLIBC<br>
=C2=A0 #define CHOOSE_DYNAMIC_LINKER(G, U) &quot;%{mglibc:&quot; G &quot;;:=
&quot; U &quot;}&quot;<br>
=C2=A0 #elif DEFAULT_LIBC =3D=3D LIBC_GLIBC<br>
-diff --git a/gcc/config/arm/linux-eabi.h b/gcc/config/arm/linux-eabi.h<br>
-index 85d0136e76e..6bd95855827 100644<br>
---- a/gcc/config/arm/linux-eabi.h<br>
-+++ b/gcc/config/arm/linux-eabi.h<br>
+Index: gcc-11.3.0/gcc/config/arm/linux-eabi.h<br>
+=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D<br>
+--- gcc-11.3.0.orig/gcc/config/arm/linux-eabi.h<br>
++++ gcc-11.3.0/gcc/config/arm/linux-eabi.h<br>
=C2=A0@@ -65,8 +65,8 @@<br>
=C2=A0 =C2=A0 =C2=A0GLIBC_DYNAMIC_LINKER_DEFAULT and TARGET_DEFAULT_FLOAT_A=
BI.=C2=A0 */<br>
<br>
@@ -77,10 +86,19 @@ index 85d0136e76e..6bd95855827 100644<br>
=C2=A0 #define GLIBC_DYNAMIC_LINKER_DEFAULT GLIBC_DYNAMIC_LINKER_SOFT_FLOAT=
<br>
<br>
=C2=A0 #define GLIBC_DYNAMIC_LINKER \<br>
-diff --git a/gcc/config/arm/linux-elf.h b/gcc/config/arm/linux-elf.h<br>
-index 0c1c4e70b6b..6bd643ade11 100644<br>
---- a/gcc/config/arm/linux-elf.h<br>
-+++ b/gcc/config/arm/linux-elf.h<br>
+@@ -89,7 +89,7 @@<br>
+ #define MUSL_DYNAMIC_LINKER_E &quot;%{mbig-endian:eb}&quot;<br>
+ #endif<br>
+ #define MUSL_DYNAMIC_LINKER \<br>
+-=C2=A0 &quot;/lib/ld-musl-arm&quot; MUSL_DYNAMIC_LINKER_E &quot;%{mfloat-=
abi=3Dhard:hf}%{mfdpic:-fdpic}.so.1&quot;<br>
++=C2=A0 SYSTEMLIBS_DIR &quot;ld-musl-arm&quot; MUSL_DYNAMIC_LINKER_E &quot=
;%{mfloat-abi=3Dhard:hf}%{mfdpic:-fdpic}.so.1&quot;<br>
+ <br>
+ /* At this point, bpabi.h will have clobbered LINK_SPEC.=C2=A0 We want to=
<br>
+=C2=A0 =C2=A0 use the GNU/Linux version, not the generic BPABI version.=C2=
=A0 */<br>
+Index: gcc-11.3.0/gcc/config/arm/linux-elf.h<br>
+=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D<br>
+--- gcc-11.3.0.orig/gcc/config/arm/linux-elf.h<br>
++++ gcc-11.3.0/gcc/config/arm/linux-elf.h<br>
=C2=A0@@ -60,7 +60,7 @@<br>
<br>
=C2=A0 #define LIBGCC_SPEC &quot;%{mfloat-abi=3Dsoft*:-lfloat} -lgcc&quot;<=
br>
@@ -90,11 +108,11 @@ index 0c1c4e70b6b..6bd643ade11 100644<br>
<br>
=C2=A0 #define LINUX_TARGET_LINK_SPEC=C2=A0 &quot;%{h*} \<br>
=C2=A0 =C2=A0 =C2=A0%{static:-Bstatic} \<br>
-diff --git a/gcc/config/i386/linux.h b/gcc/config/i386/linux.h<br>
-index 04b274f1654..7aafcf3ac2d 100644<br>
---- a/gcc/config/i386/linux.h<br>
-+++ b/gcc/config/i386/linux.h<br>
-@@ -20,7 +20,7 @@ along with GCC; see the file COPYING3.=C2=A0 If not see<=
br>
+Index: gcc-11.3.0/gcc/config/i386/linux.h<br>
+=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D<br>
+--- gcc-11.3.0.orig/gcc/config/i386/linux.h<br>
++++ gcc-11.3.0/gcc/config/i386/linux.h<br>
+@@ -20,7 +20,7 @@ along with GCC; see the file COPYING3.<br>
=C2=A0 &lt;<a href=3D"http://www.gnu.org/licenses/" rel=3D"noreferrer" targ=
et=3D"_blank">http://www.gnu.org/licenses/</a>&gt;.=C2=A0 */<br>
<br>
=C2=A0 #define GNU_USER_LINK_EMULATION &quot;elf_i386&quot;<br>
@@ -102,12 +120,13 @@ index 04b274f1654..7aafcf3ac2d 100644<br>
=C2=A0+#define GLIBC_DYNAMIC_LINKER SYSTEMLIBS_DIR &quot;ld-linux.so.2&quot=
;<br>
<br>
=C2=A0 #undef MUSL_DYNAMIC_LINKER<br>
- #define MUSL_DYNAMIC_LINKER &quot;/lib/ld-musl-i386.so.1&quot;<br>
-diff --git a/gcc/config/i386/linux64.h b/gcc/config/i386/linux64.h<br>
-index b3822ced528..92d303e80d6 100644<br>
---- a/gcc/config/i386/linux64.h<br>
-+++ b/gcc/config/i386/linux64.h<br>
-@@ -27,9 +27,9 @@ see the files COPYING3 and COPYING.RUNTIME respectively.=
=C2=A0 If not, see<br>
+-#define MUSL_DYNAMIC_LINKER &quot;/lib/ld-musl-i386.so.1&quot;<br>
++#define MUSL_DYNAMIC_LINKER SYSTEMLIBS_DIR &quot;ld-musl-i386.so.1&quot;<=
br>
+Index: gcc-11.3.0/gcc/config/i386/linux64.h<br>
+=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D<br>
+--- gcc-11.3.0.orig/gcc/config/i386/linux64.h<br>
++++ gcc-11.3.0/gcc/config/i386/linux64.h<br>
+@@ -27,13 +27,13 @@ see the files COPYING3 and COPYING.RUNTI<br>
=C2=A0 #define GNU_USER_LINK_EMULATION64 &quot;elf_x86_64&quot;<br>
=C2=A0 #define GNU_USER_LINK_EMULATIONX32 &quot;elf32_x86_64&quot;<br>
<br>
@@ -119,12 +138,19 @@ index b3822ced528..92d303e80d6 100644<br>
=C2=A0+#define GLIBC_DYNAMIC_LINKERX32 SYSTEMLIBS_DIR &quot;ld-linux-x32.so=
.2&quot;<br>
<br>
=C2=A0 #undef MUSL_DYNAMIC_LINKER32<br>
- #define MUSL_DYNAMIC_LINKER32 &quot;/lib/ld-musl-i386.so.1&quot;<br>
-diff --git a/gcc/config/linux.h b/gcc/config/linux.h<br>
-index 4e1db60fced..87efc5f69fe 100644<br>
---- a/gcc/config/linux.h<br>
-+++ b/gcc/config/linux.h<br>
-@@ -94,10 +94,10 @@ see the files COPYING3 and COPYING.RUNTIME respectivel=
y.=C2=A0 If not, see<br>
+-#define MUSL_DYNAMIC_LINKER32 &quot;/lib/ld-musl-i386.so.1&quot;<br>
++#define MUSL_DYNAMIC_LINKER32 SYSTEMLIBS_DIR &quot;ld-musl-i386.so.1&quot=
;<br>
+ #undef MUSL_DYNAMIC_LINKER64<br>
+-#define MUSL_DYNAMIC_LINKER64 &quot;/lib/ld-musl-x86_64.so.1&quot;<br>
++#define MUSL_DYNAMIC_LINKER64 SYSTEMLIBS_DIR &quot;ld-musl-x86_64.so.1&qu=
ot;<br>
+ #undef MUSL_DYNAMIC_LINKERX32<br>
+-#define MUSL_DYNAMIC_LINKERX32 &quot;/lib/ld-musl-x32.so.1&quot;<br>
++#define MUSL_DYNAMIC_LINKERX32 SYSTEMLIBS_DIR &quot;ld-musl-x32.so.1&quot=
;<br>
+Index: gcc-11.3.0/gcc/config/linux.h<br>
+=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D<br>
+--- gcc-11.3.0.orig/gcc/config/linux.h<br>
++++ gcc-11.3.0/gcc/config/linux.h<br>
+@@ -94,10 +94,10 @@ see the files COPYING3 and COPYING.RUNTI<br>
=C2=A0 =C2=A0 =C2=A0GLIBC_DYNAMIC_LINKER must be defined for each target us=
ing them, or<br>
=C2=A0 =C2=A0 =C2=A0GLIBC_DYNAMIC_LINKER32 and GLIBC_DYNAMIC_LINKER64 for t=
argets<br>
=C2=A0 =C2=A0 =C2=A0supporting both 32-bit and 64-bit compilation.=C2=A0 */=
<br>
@@ -139,11 +165,33 @@ index 4e1db60fced..87efc5f69fe 100644<br>
=C2=A0 #define BIONIC_DYNAMIC_LINKER &quot;/system/bin/linker&quot;<br>
=C2=A0 #define BIONIC_DYNAMIC_LINKER32 &quot;/system/bin/linker&quot;<br>
=C2=A0 #define BIONIC_DYNAMIC_LINKER64 &quot;/system/bin/linker64&quot;<br>
-diff --git a/gcc/config/mips/linux.h b/gcc/config/mips/linux.h<br>
-index 44a85e410d9..8d41b5574f6 100644<br>
---- a/gcc/config/mips/linux.h<br>
-+++ b/gcc/config/mips/linux.h<br>
-@@ -22,20 +22,20 @@ along with GCC; see the file COPYING3.=C2=A0 If not se=
e<br>
+Index: gcc-11.3.0/gcc/config/microblaze/linux.h<br>
+=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D<br>
+--- gcc-11.3.0.orig/gcc/config/microblaze/linux.h<br>
++++ gcc-11.3.0/gcc/config/microblaze/linux.h<br>
+@@ -28,7 +28,7 @@<br>
+ #undef TLS_NEEDS_GOT<br>
+ #define TLS_NEEDS_GOT 1<br>
+ <br>
+-#define GLIBC_DYNAMIC_LINKER &quot;/lib/ld.so.1&quot;<br>
++#define GLIBC_DYNAMIC_LINKER SYSTEMLIBS_DIR &quot;/ld.so.1&quot;<br>
+ #define UCLIBC_DYNAMIC_LINKER &quot;/lib/ld-uClibc.so.0&quot;<br>
+ <br>
+ #if TARGET_BIG_ENDIAN_DEFAULT =3D=3D 0 /* LE */<br>
+@@ -38,7 +38,7 @@<br>
+ #endif<br>
+ <br>
+ #undef MUSL_DYNAMIC_LINKER<br>
+-#define MUSL_DYNAMIC_LINKER &quot;/lib/ld-musl-microblaze&quot; MUSL_DYNA=
MIC_LINKER_E &quot;.so.1&quot;<br>
++#define MUSL_DYNAMIC_LINKER SYSTEMLIBS_DIR &quot;ld-musl-microblaze&quot;=
 MUSL_DYNAMIC_LINKER_E &quot;.so.1&quot;<br>
+ <br>
+ #undef=C2=A0 SUBTARGET_EXTRA_SPECS<br>
+ #define SUBTARGET_EXTRA_SPECS \<br>
+Index: gcc-11.3.0/gcc/config/mips/linux.h<br>
+=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D<br>
+--- gcc-11.3.0.orig/gcc/config/mips/linux.h<br>
++++ gcc-11.3.0/gcc/config/mips/linux.h<br>
+@@ -22,29 +22,29 @@ along with GCC; see the file COPYING3.<br>
=C2=A0 #define GNU_USER_LINK_EMULATIONN32 &quot;elf32%{EB:b}%{EL:l}tsmipn32=
&quot;<br>
<br>
=C2=A0 #define GLIBC_DYNAMIC_LINKER32 \<br>
@@ -170,11 +218,36 @@ index 44a85e410d9..8d41b5574f6 100644<br>
<br>
=C2=A0 #undef MUSL_DYNAMIC_LINKER32<br>
=C2=A0 #define MUSL_DYNAMIC_LINKER32 \<br>
-diff --git a/gcc/config/riscv/linux.h b/gcc/config/riscv/linux.h<br>
-index fce5b896e6e..03aa55cb5ab 100644<br>
---- a/gcc/config/riscv/linux.h<br>
-+++ b/gcc/config/riscv/linux.h<br>
-@@ -22,7 +22,7 @@ along with GCC; see the file COPYING3.=C2=A0 If not see<=
br>
+-=C2=A0 &quot;/lib/ld-musl-mips%{mips32r6|mips64r6:r6}%{EL:el}%{msoft-floa=
t:-sf}.so.1&quot;<br>
++=C2=A0 SYSTEMLIBS_DIR &quot;ld-musl-mips%{mips32r6|mips64r6:r6}%{EL:el}%{=
msoft-float:-sf}.so.1&quot;<br>
+ #undef MUSL_DYNAMIC_LINKER64<br>
+ #define MUSL_DYNAMIC_LINKER64 \<br>
+-=C2=A0 &quot;/lib/ld-musl-mips64%{mips64r6:r6}%{EL:el}%{msoft-float:-sf}.=
so.1&quot;<br>
++=C2=A0 SYSTEMLIBS_DIR &quot;ld-musl-mips64%{mips64r6:r6}%{EL:el}%{msoft-f=
loat:-sf}.so.1&quot;<br>
+ #define MUSL_DYNAMIC_LINKERN32 \<br>
+-=C2=A0 &quot;/lib/ld-musl-mipsn32%{mips64r6:r6}%{EL:el}%{msoft-float:-sf}=
.so.1&quot;<br>
++=C2=A0 SYSTEMLIBS_DIR &quot;ld-musl-mipsn32%{mips64r6:r6}%{EL:el}%{msoft-=
float:-sf}.so.1&quot;<br>
+ <br>
+ #define BIONIC_DYNAMIC_LINKERN32 &quot;/system/bin/linker32&quot;<br>
+ #define GNU_USER_DYNAMIC_LINKERN32 \<br>
+Index: gcc-11.3.0/gcc/config/nios2/linux.h<br>
+=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D<br>
+--- gcc-11.3.0.orig/gcc/config/nios2/linux.h<br>
++++ gcc-11.3.0/gcc/config/nios2/linux.h<br>
+@@ -29,7 +29,7 @@<br>
+ #undef CPP_SPEC<br>
+ #define CPP_SPEC &quot;%{posix:-D_POSIX_SOURCE} %{pthread:-D_REENTRANT}&q=
uot;<br>
+ <br>
+-#define GLIBC_DYNAMIC_LINKER &quot;/lib/ld-linux-nios2.so.1&quot;<br>
++#define GLIBC_DYNAMIC_LINKER SYSTEMLIBS_DIR &quot;ld-linux-nios2.so.1&quo=
t;<br>
+ <br>
+ #undef LINK_SPEC<br>
+ #define LINK_SPEC LINK_SPEC_ENDIAN \<br>
+Index: gcc-11.3.0/gcc/config/riscv/linux.h<br>
+=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D<br>
+--- gcc-11.3.0.orig/gcc/config/riscv/linux.h<br>
++++ gcc-11.3.0/gcc/config/riscv/linux.h<br>
+@@ -22,7 +22,7 @@ along with GCC; see the file COPYING3.<br>
=C2=A0 =C2=A0 =C2=A0 GNU_USER_TARGET_OS_CPP_BUILTINS();=C2=A0 =C2=A0 =C2=A0=
 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 =C2=A0 \<br>
=C2=A0 =C2=A0 } while (0)<br>
<br>
@@ -183,10 +256,19 @@ index fce5b896e6e..03aa55cb5ab 100644<br>
<br>
=C2=A0 #define MUSL_ABI_SUFFIX \<br>
=C2=A0 =C2=A0 &quot;%{mabi=3Dilp32:-sf}&quot; \<br>
-diff --git a/gcc/config/rs6000/linux64.h b/gcc/config/rs6000/linux64.h<br>
-index e3f2cd254f6..a11e01faa3d 100644<br>
---- a/gcc/config/rs6000/linux64.h<br>
-+++ b/gcc/config/rs6000/linux64.h<br>
+@@ -33,7 +33,7 @@ along with GCC; see the file COPYING3.<br>
+=C2=A0 =C2=A0&quot;%{mabi=3Dlp64d:}&quot;<br>
+ <br>
+ #undef MUSL_DYNAMIC_LINKER<br>
+-#define MUSL_DYNAMIC_LINKER &quot;/lib/ld-musl-riscv&quot; XLEN_SPEC MUSL=
_ABI_SUFFIX &quot;.so.1&quot;<br>
++#define MUSL_DYNAMIC_LINKER SYSTEMLIBS_DIR &quot;ld-musl-riscv&quot; XLEN=
_SPEC MUSL_ABI_SUFFIX &quot;.so.1&quot;<br>
+ <br>
+ /* Because RISC-V only has word-sized atomics, it requries libatomic wher=
e<br>
+=C2=A0 =C2=A0 others do not.=C2=A0 So link libatomic by default, as needed=
.=C2=A0 */<br>
+Index: gcc-11.3.0/gcc/config/rs6000/linux64.h<br>
+=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D<br>
+--- gcc-11.3.0.orig/gcc/config/rs6000/linux64.h<br>
++++ gcc-11.3.0/gcc/config/rs6000/linux64.h<br>
=C2=A0@@ -336,24 +336,19 @@ extern int dot_symbols;<br>
=C2=A0 #undef=C2=A0 =C2=A0 =C2=A0 =C2=A0 LINK_OS_DEFAULT_SPEC<br>
=C2=A0 #define LINK_OS_DEFAULT_SPEC &quot;%(link_os_linux)&quot;<br>
@@ -217,12 +299,55 @@ index e3f2cd254f6..a11e01faa3d 100644<br>
<br>
=C2=A0 #undef=C2=A0 DEFAULT_ASM_ENDIAN<br>
=C2=A0 #if (TARGET_DEFAULT &amp; MASK_LITTLE_ENDIAN)<br>
-diff --git a/gcc/config/sh/linux.h b/gcc/config/sh/linux.h<br>
-index 7558d2f7195..3aaa6c3a078 100644<br>
---- a/gcc/config/sh/linux.h<br>
-+++ b/gcc/config/sh/linux.h<br>
-@@ -64,7 +64,7 @@ along with GCC; see the file COPYING3.=C2=A0 If not see<=
br>
-=C2=A0 =C2=A0&quot;/lib/ld-musl-sh&quot; MUSL_DYNAMIC_LINKER_E MUSL_DYNAMI=
C_LINKER_FP \<br>
+Index: gcc-11.3.0/gcc/config/rs6000/sysv4.h<br>
+=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D<br>
+--- gcc-11.3.0.orig/gcc/config/rs6000/sysv4.h<br>
++++ gcc-11.3.0/gcc/config/rs6000/sysv4.h<br>
+@@ -780,10 +780,10 @@ GNU_USER_TARGET_CC1_SPEC<br>
+ <br>
+ #define MUSL_DYNAMIC_LINKER_E ENDIAN_SELECT(&quot;&quot;,&quot;le&quot;,&=
quot;&quot;)<br>
+ <br>
+-#define GLIBC_DYNAMIC_LINKER &quot;/lib/ld.so.1&quot;<br>
++#define GLIBC_DYNAMIC_LINKER SYSTEMLIBS_DIR &quot;ld.so.1&quot;<br>
+ #undef MUSL_DYNAMIC_LINKER<br>
+ #define MUSL_DYNAMIC_LINKER \<br>
+-=C2=A0 &quot;/lib/ld-musl-powerpc&quot; MUSL_DYNAMIC_LINKER_E &quot;%{mso=
ft-float:-sf}.so.1&quot;<br>
++=C2=A0 SYSTEMLIBS_DIR &quot;ld-musl-powerpc&quot; MUSL_DYNAMIC_LINKER_E &=
quot;%{msoft-float:-sf}.so.1&quot;<br>
+ <br>
+ #ifndef GNU_USER_DYNAMIC_LINKER<br>
+ #define GNU_USER_DYNAMIC_LINKER GLIBC_DYNAMIC_LINKER<br>
+Index: gcc-11.3.0/gcc/config/s390/linux.h<br>
+=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D<br>
+--- gcc-11.3.0.orig/gcc/config/s390/linux.h<br>
++++ gcc-11.3.0/gcc/config/s390/linux.h<br>
+@@ -72,13 +72,13 @@ along with GCC; see the file COPYING3.<br>
+ #define MULTILIB_DEFAULTS { &quot;m31&quot; }<br>
+ #endif<br>
+ <br>
+-#define GLIBC_DYNAMIC_LINKER32 &quot;/lib/ld.so.1&quot;<br>
+-#define GLIBC_DYNAMIC_LINKER64 &quot;/lib/ld64.so.1&quot;<br>
++#define GLIBC_DYNAMIC_LINKER32 SYSTEMLIBS_DIR &quot;ld.so.1&quot;<br>
++#define GLIBC_DYNAMIC_LINKER64 SYSTEMLIBS_DIR &quot;ld64.so.1&quot;<br>
+ <br>
+ #undef MUSL_DYNAMIC_LINKER32<br>
+-#define MUSL_DYNAMIC_LINKER32 &quot;/lib/ld-musl-s390.so.1&quot;<br>
++#define MUSL_DYNAMIC_LINKER32 SYSTEMLIBS_DIR &quot;ld-musl-s390.so.1&quot=
;<br>
+ #undef MUSL_DYNAMIC_LINKER64<br>
+-#define MUSL_DYNAMIC_LINKER64 &quot;/lib/ld-musl-s390x.so.1&quot;<br>
++#define MUSL_DYNAMIC_LINKER64 SYSTEMLIBS_DIR &quot;ld-musl-s390x.so.1&quo=
t;<br>
+ <br>
+ #undef=C2=A0 LINK_SPEC<br>
+ #define LINK_SPEC \<br>
+Index: gcc-11.3.0/gcc/config/sh/linux.h<br>
+=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D<br>
+--- gcc-11.3.0.orig/gcc/config/sh/linux.h<br>
++++ gcc-11.3.0/gcc/config/sh/linux.h<br>
+@@ -61,10 +61,10 @@ along with GCC; see the file COPYING3.<br>
+ <br>
+ #undef MUSL_DYNAMIC_LINKER<br>
+ #define MUSL_DYNAMIC_LINKER \<br>
+-=C2=A0 &quot;/lib/ld-musl-sh&quot; MUSL_DYNAMIC_LINKER_E MUSL_DYNAMIC_LIN=
KER_FP \<br>
++=C2=A0 SYSTEMLIBS_DIR &quot;ld-musl-sh&quot; MUSL_DYNAMIC_LINKER_E MUSL_D=
YNAMIC_LINKER_FP \<br>
=C2=A0 =C2=A0 &quot;%{mfdpic:-fdpic}.so.1&quot;<br>
<br>
=C2=A0-#define GLIBC_DYNAMIC_LINKER &quot;/lib/ld-linux.so.2&quot;<br>
@@ -230,11 +355,11 @@ index 7558d2f7195..3aaa6c3a078 100644<br>
<br>
=C2=A0 #undef SUBTARGET_LINK_EMUL_SUFFIX<br>
=C2=A0 #define SUBTARGET_LINK_EMUL_SUFFIX &quot;%{mfdpic:_fd;:_linux}&quot;=
<br>
-diff --git a/gcc/config/sparc/linux.h b/gcc/config/sparc/linux.h<br>
-index 2550d7ee8f0..a94f4cd8ba2 100644<br>
---- a/gcc/config/sparc/linux.h<br>
-+++ b/gcc/config/sparc/linux.h<br>
-@@ -78,7 +78,7 @@ extern const char *host_detect_local_cpu (int argc, cons=
t char **argv);<br>
+Index: gcc-11.3.0/gcc/config/sparc/linux.h<br>
+=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D<br>
+--- gcc-11.3.0.orig/gcc/config/sparc/linux.h<br>
++++ gcc-11.3.0/gcc/config/sparc/linux.h<br>
+@@ -78,7 +78,7 @@ extern const char *host_detect_local_cpu<br>
=C2=A0 =C2=A0 =C2=A0When the -shared link option is used a final link is no=
t being<br>
=C2=A0 =C2=A0 =C2=A0done.=C2=A0 */<br>
<br>
@@ -243,11 +368,11 @@ index 2550d7ee8f0..a94f4cd8ba2 100644<br>
<br>
=C2=A0 #undef=C2=A0 LINK_SPEC<br>
=C2=A0 #define LINK_SPEC &quot;-m elf32_sparc %{shared:-shared} \<br>
-diff --git a/gcc/config/sparc/linux64.h b/gcc/config/sparc/linux64.h<br>
-index 95af8afa9b5..63127afb074 100644<br>
---- a/gcc/config/sparc/linux64.h<br>
-+++ b/gcc/config/sparc/linux64.h<br>
-@@ -78,8 +78,8 @@ along with GCC; see the file COPYING3.=C2=A0 If not see<=
br>
+Index: gcc-11.3.0/gcc/config/sparc/linux64.h<br>
+=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D<br>
+--- gcc-11.3.0.orig/gcc/config/sparc/linux64.h<br>
++++ gcc-11.3.0/gcc/config/sparc/linux64.h<br>
+@@ -78,8 +78,8 @@ along with GCC; see the file COPYING3.<br>
=C2=A0 =C2=A0 =C2=A0When the -shared link option is used a final link is no=
t being<br>
=C2=A0 =C2=A0 =C2=A0done.=C2=A0 */<br>
<br>
diff --git a/meta/recipes-devtools/gcc/gcc/0009-gcc-armv4-pass-fix-v4bx-to-=
linker-to-support-EABI.patch b/meta/recipes-devtools/gcc/gcc/0009-gcc-armv4=
-pass-fix-v4bx-to-linker-to-support-EABI.patch<br>
index ac139542f1..0f94936140 100644<br>
--- a/meta/recipes-devtools/gcc/gcc/0009-gcc-armv4-pass-fix-v4bx-to-linker-=
to-support-EABI.patch<br>
+++ b/meta/recipes-devtools/gcc/gcc/0009-gcc-armv4-pass-fix-v4bx-to-linker-=
to-support-EABI.patch<br>
@@ -18,13 +18,13 @@ Upstream-Status: Pending<br>
=C2=A0 gcc/config/arm/linux-eabi.h | 6 +++++-<br>
=C2=A0 1 file changed, 5 insertions(+), 1 deletion(-)<br>
<br>
-diff --git a/gcc/config/arm/linux-eabi.h b/gcc/config/arm/linux-eabi.h<br>
-index 6bd95855827..77befab5da8 100644<br>
---- a/gcc/config/arm/linux-eabi.h<br>
-+++ b/gcc/config/arm/linux-eabi.h<br>
+Index: gcc-11.3.0/gcc/config/arm/linux-eabi.h<br>
+=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D<br>
+--- gcc-11.3.0.orig/gcc/config/arm/linux-eabi.h<br>
++++ gcc-11.3.0/gcc/config/arm/linux-eabi.h<br>
=C2=A0@@ -91,10 +91,14 @@<br>
=C2=A0 #define MUSL_DYNAMIC_LINKER \<br>
-=C2=A0 =C2=A0&quot;/lib/ld-musl-arm&quot; MUSL_DYNAMIC_LINKER_E &quot;%{mf=
loat-abi=3Dhard:hf}%{mfdpic:-fdpic}.so.1&quot;<br>
+=C2=A0 =C2=A0SYSTEMLIBS_DIR &quot;ld-musl-arm&quot; MUSL_DYNAMIC_LINKER_E =
&quot;%{mfloat-abi=3Dhard:hf}%{mfdpic:-fdpic}.so.1&quot;<br>
<br>
=C2=A0+/* For armv4 we pass --fix-v4bx to linker to support EABI */<br>
=C2=A0+#undef TARGET_FIX_V4BX_SPEC<br>
diff --git a/meta/recipes-devtools/gcc/gcc/0019-nios2-Define-MUSL_DYNAMIC_L=
INKER.patch b/meta/recipes-devtools/gcc/gcc/0019-nios2-Define-MUSL_DYNAMIC_=
LINKER.patch<br>
deleted file mode 100644<br>
index 76ebfd7f77..0000000000<br>
--- a/meta/recipes-devtools/gcc/gcc/0019-nios2-Define-MUSL_DYNAMIC_LINKER.p=
atch<br>
+++ /dev/null<br>
@@ -1,25 +0,0 @@<br>
-From 9ec4db8e910d9a51ae43f6b20d4bf1dac2d8cca8 Mon Sep 17 00:00:00 2001<br>
-From: Khem Raj &lt;<a href=3D"mailto:raj.khem@gmail.com" target=3D"_blank"=
>raj.khem@gmail.com</a>&gt;<br>
-Date: Tue, 2 Feb 2016 10:26:10 -0800<br>
-Subject: [PATCH] nios2: Define MUSL_DYNAMIC_LINKER<br>
-<br>
-Upstream-Status: Backport [<a href=3D"https://gcc.gnu.org/git/?p=3Dgcc.git=
;a=3Dcommitdiff;h=3De5ddbbf992b909d8e38851bd3179d29389e6ac97" rel=3D"norefe=
rrer" target=3D"_blank">https://gcc.gnu.org/git/?p=3Dgcc.git;a=3Dcommitdiff=
;h=3De5ddbbf992b909d8e38851bd3179d29389e6ac97</a>]<br>
-<br>
-Signed-off-by: Marek Vasut &lt;<a href=3D"mailto:marex@denx.de" target=3D"=
_blank">marex@denx.de</a>&gt;<br>
-Signed-off-by: Khem Raj &lt;<a href=3D"mailto:raj.khem@gmail.com" target=
=3D"_blank">raj.khem@gmail.com</a>&gt;<br>
----<br>
- gcc/config/nios2/linux.h | 1 +<br>
- 1 file changed, 1 insertion(+)<br>
-<br>
-diff --git a/gcc/config/nios2/linux.h b/gcc/config/nios2/linux.h<br>
-index 08edf1521f6..15696d86241 100644<br>
---- a/gcc/config/nios2/linux.h<br>
-+++ b/gcc/config/nios2/linux.h<br>
-@@ -30,6 +30,7 @@<br>
- #define CPP_SPEC &quot;%{posix:-D_POSIX_SOURCE} %{pthread:-D_REENTRANT}&q=
uot;<br>
- <br>
- #define GLIBC_DYNAMIC_LINKER &quot;/lib/ld-linux-nios2.so.1&quot;<br>
-+#define MUSL_DYNAMIC_LINKER=C2=A0 &quot;/lib/ld-musl-nios2.so.1&quot;<br>
- <br>
- #undef LINK_SPEC<br>
- #define LINK_SPEC LINK_SPEC_ENDIAN \<br>
-- <br>
2.39.0<br>
<br>
<br>
-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-<br>
Links: You receive all messages sent to this group.<br>
View/Reply Online (#175962): <a href=3D"https://lists.openembedded.org/g/op=
enembedded-core/message/175962" rel=3D"noreferrer" target=3D"_blank">https:=
//lists.openembedded.org/g/openembedded-core/message/175962</a><br>
Mute This Topic: <a href=3D"https://lists.openembedded.org/mt/96302818/1997=
914" rel=3D"noreferrer" target=3D"_blank">https://lists.openembedded.org/mt=
/96302818/1997914</a><br>
Group Owner: <a href=3D"mailto:openembedded-core%2Bowner@lists.openembedded=
.org" target=3D"_blank">openembedded-core+owner@lists.openembedded.org</a><=
br>
Unsubscribe: <a href=3D"https://lists.openembedded.org/g/openembedded-core/=
unsub" rel=3D"noreferrer" target=3D"_blank">https://lists.openembedded.org/=
g/openembedded-core/unsub</a> [<a href=3D"mailto:raj.khem@gmail.com" target=
=3D"_blank">raj.khem@gmail.com</a>]<br>
-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-<br>
<br>
</blockquote></div></div>

--0000000000007fe26a05f2634ab1--

