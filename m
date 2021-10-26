Return-Path: <raj.khem@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id BE0CAC433F5
	for <webhook@archiver.kernel.org>; Tue, 26 Oct 2021 15:52:46 +0000 (UTC)
Received: from mail-qt1-f182.google.com (mail-qt1-f182.google.com
 [209.85.160.182])
 by mx.groups.io with SMTP id smtpd.web08.14256.1635263566050559930
 for <openembedded-core@lists.openembedded.org>;
 Tue, 26 Oct 2021 08:52:46 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20210112 header.b=Be8PC9Sd;
 spf=pass (domain: gmail.com, ip: 209.85.160.182,
 mailfrom: raj.khem@gmail.com)
Received: by mail-qt1-f182.google.com with SMTP id w8so13943836qts.4
        for <openembedded-core@lists.openembedded.org>;
 Tue, 26 Oct 2021 08:52:45 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=ZlklNGQb58E+gGddkhdi0cMMUFYLKQnrKhaqkEQSCo8=;
        b=Be8PC9Sd19rzRdquomSJD+dnM1zHYn2LGxBC9j1j1zSr7RnVk4rcLuu+Ja9sEJ/zFr
         Zgqt970m0TZz8t84teggIJ2qeiV6Tm8PErJedCVWSg2+KFYpDwMiEfPjPGDBGw/t2YpB
         qhA26z663Bo8jjRnfEzPW7b5X/dSgvKBA3Hapc2ud75BBzaoE/gbC1dFRCzhzFULmw3q
         eYqjKXdCm7m+TiSTUHhRxBKXQEMaJdxSXwNcxUYAShPWiTLdGWRY+4Q/qH/Kzh5b9qoH
         +zp9MEf3b7K6luWLLEC72kzipw5g9Gb9uRb9mMdeREErpbzakgeuZGaruq9+nqPag3u8
         nNtQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=ZlklNGQb58E+gGddkhdi0cMMUFYLKQnrKhaqkEQSCo8=;
        b=t38WRAdArvnHArSo5WWq1kSjqXJXGDl4840OOvC6YuvQT/vqaYRNPhMlAvvaRoPlN5
         8DgdCTEnfep09xWrk0kcLbdkhSaET82/qnEAZfBBhdGMU7RbBUgf/cfKhQYPHKnPgwXx
         6oxGnrQHfafymXWk+4JdGPDkJiIjAvLx06nZlnlh3luOT2Rp/0DzzwipCE0rGJzAzlAN
         TRv6HkjMt7cu+PbEMmYHzoCk0NEr/oqAPUiAxlF3IXztzvFLuDqbcnrAlUHZdILWQ6iQ
         JXDMUmubdjijl8VlV45SAH1odVdN6k7bZviyQwZCTqwmw1Ea7iaa4Mgu/9bqenv5PJDx
         1JQw==
X-Gm-Message-State: AOAM530RcuaDJHhrdyd/tyzCsTWWgMrhWH829HuxLOhrE+bw7imLNHcg
	X4AnHA8HYE0masvhRBVjOROgRY/rolLxiJxyyWtX2NUX
X-Google-Smtp-Source: 
 ABdhPJwrOVTmRUBN22E+44wuekt6iOv7wdNliq7KLhMpofRMuMSlf19y4ztLtDKFRDE0ZpvJz7w1qS9bUfoQbObm+Og=
X-Received: by 2002:a05:622a:13cc:: with SMTP id
 p12mr25975802qtk.227.1635263565154;
 Tue, 26 Oct 2021 08:52:45 -0700 (PDT)
MIME-Version: 1.0
References: <20211026111140.3298966-1-richard.purdie@linuxfoundation.org>
 <20211026111140.3298966-2-richard.purdie@linuxfoundation.org>
In-Reply-To: <20211026111140.3298966-2-richard.purdie@linuxfoundation.org>
From: Khem Raj <raj.khem@gmail.com>
Date: Tue, 26 Oct 2021 08:52:19 -0700
Message-ID: 
 <CAMKF1srcgKdVWFF=AC=wAoVDHd955SF6sB_n1tSwCJpiymfy=Q@mail.gmail.com>
Subject: Re: [OE-core] [PATCH 2/4] gcc: Drop sdt (dtrace) header patch
To: Richard Purdie <richard.purdie@linuxfoundation.org>
Cc: Patches and discussions about the oe-core layer
 <openembedded-core@lists.openembedded.org>
Content-Type: text/plain; charset="UTF-8"
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Tue, 26 Oct 2021 15:52:46 -0000
X-Groupsio-URL: 
 https://lists.openembedded.org/g/openembedded-core/message/157401

ok

On Tue, Oct 26, 2021 at 4:11 AM Richard Purdie
<richard.purdie@linuxfoundation.org> wrote:
>
> Since we now have recipe specific sysroots we no longer need this patch
> to avoid the dtrace headers affecting the build of gcc-runtime. Drop
> the patch.
>
> Signed-off-by: Richard Purdie <richard.purdie@linuxfoundation.org>
> ---
>  meta/recipes-devtools/gcc/gcc-11.2.inc        |   1 -
>  .../gcc/gcc/0013-Disable-sdt.patch            | 110 ------------------
>  2 files changed, 111 deletions(-)
>  delete mode 100644 meta/recipes-devtools/gcc/gcc/0013-Disable-sdt.patch
>
> diff --git a/meta/recipes-devtools/gcc/gcc-11.2.inc b/meta/recipes-devtools/gcc/gcc-11.2.inc
> index 6fa344e9612..1ab779533ca 100644
> --- a/meta/recipes-devtools/gcc/gcc-11.2.inc
> +++ b/meta/recipes-devtools/gcc/gcc-11.2.inc
> @@ -42,7 +42,6 @@ SRC_URI = "\
>             file://0010-MIPS64-Default-to-N64-ABI.patch \
>             file://0011-Define-GLIBC_DYNAMIC_LINKER-and-UCLIBC_DYNAMIC_LINKE.patch \
>             file://0012-gcc-Fix-argument-list-too-long-error.patch \
> -           file://0013-Disable-sdt.patch \
>             file://0014-libtool.patch \
>             file://0015-gcc-armv4-pass-fix-v4bx-to-linker-to-support-EABI.patch \
>             file://0016-Use-the-multilib-config-files-from-B-instead-of-usin.patch \
> diff --git a/meta/recipes-devtools/gcc/gcc/0013-Disable-sdt.patch b/meta/recipes-devtools/gcc/gcc/0013-Disable-sdt.patch
> deleted file mode 100644
> index 1e657666df9..00000000000
> --- a/meta/recipes-devtools/gcc/gcc/0013-Disable-sdt.patch
> +++ /dev/null
> @@ -1,110 +0,0 @@
> -From 7928a4eddc4a6d821a6aa6eaaea1fd60d54e3da9 Mon Sep 17 00:00:00 2001
> -From: Khem Raj <raj.khem@gmail.com>
> -Date: Fri, 29 Mar 2013 09:28:10 +0400
> -Subject: [PATCH] Disable sdt.
> -
> -We don't list dtrace in DEPENDS so we shouldn't be depending on this header.
> -It may or may not exist from preivous builds though. To be determinstic, disable
> -sdt.h usage always. This avoids build failures if the header is removed after configure
> -but before libgcc is compiled for example.
> -
> -RP 2012/8/7
> -
> -Signed-off-by: Khem Raj <raj.khem@gmail.com>
> -
> -Disable sdt for libstdc++-v3.
> -
> -Signed-off-by: Robert Yang <liezhi.yang@windriver.com>
> -
> -Upstream-Status: Inappropriate [hack]
> ----
> - gcc/configure             | 12 ++++++------
> - gcc/configure.ac          | 18 +++++++++---------
> - libstdc++-v3/configure    |  6 +++---
> - libstdc++-v3/configure.ac |  2 +-
> - 4 files changed, 19 insertions(+), 19 deletions(-)
> -
> -diff --git a/gcc/configure b/gcc/configure
> -index c5d3bc4ee2d..5160917d73e 100755
> ---- a/gcc/configure
> -+++ b/gcc/configure
> -@@ -30812,12 +30812,12 @@ fi
> - { $as_echo "$as_me:${as_lineno-$LINENO}: checking sys/sdt.h in the target C library" >&5
> - $as_echo_n "checking sys/sdt.h in the target C library... " >&6; }
> - have_sys_sdt_h=no
> --if test -f $target_header_dir/sys/sdt.h; then
> --  have_sys_sdt_h=yes
> --
> --$as_echo "#define HAVE_SYS_SDT_H 1" >>confdefs.h
> --
> --fi
> -+#if test -f $target_header_dir/sys/sdt.h; then
> -+#  have_sys_sdt_h=yes
> -+#
> -+#$as_echo "#define HAVE_SYS_SDT_H 1" >>confdefs.h
> -+#
> -+#fi
> - { $as_echo "$as_me:${as_lineno-$LINENO}: result: $have_sys_sdt_h" >&5
> - $as_echo "$have_sys_sdt_h" >&6; }
> -
> -diff --git a/gcc/configure.ac b/gcc/configure.ac
> -index f83420326d6..50f78308e8a 100644
> ---- a/gcc/configure.ac
> -+++ b/gcc/configure.ac
> -@@ -6653,15 +6653,15 @@ fi
> - AC_SUBST([enable_default_ssp])
> -
> - # Test for <sys/sdt.h> on the target.
> --GCC_TARGET_TEMPLATE([HAVE_SYS_SDT_H])
> --AC_MSG_CHECKING(sys/sdt.h in the target C library)
> --have_sys_sdt_h=no
> --if test -f $target_header_dir/sys/sdt.h; then
> --  have_sys_sdt_h=yes
> --  AC_DEFINE(HAVE_SYS_SDT_H, 1,
> --            [Define if your target C library provides sys/sdt.h])
> --fi
> --AC_MSG_RESULT($have_sys_sdt_h)
> -+#GCC_TARGET_TEMPLATE([HAVE_SYS_SDT_H])
> -+#AC_MSG_CHECKING(sys/sdt.h in the target C library)
> -+#have_sys_sdt_h=no
> -+#if test -f $target_header_dir/sys/sdt.h; then
> -+#  have_sys_sdt_h=yes
> -+#  AC_DEFINE(HAVE_SYS_SDT_H, 1,
> -+#            [Define if your target C library provides sys/sdt.h])
> -+#fi
> -+#AC_MSG_RESULT($have_sys_sdt_h)
> -
> - # Check if TFmode long double should be used by default or not.
> - # Some glibc targets used DFmode long double, but with glibc 2.4
> -diff --git a/libstdc++-v3/configure b/libstdc++-v3/configure
> -index a310e9feb6c..c879445b8a6 100755
> ---- a/libstdc++-v3/configure
> -+++ b/libstdc++-v3/configure
> -@@ -22014,11 +22014,11 @@ ac_compile='$CC -c $CFLAGS $CPPFLAGS conftest.$ac_ext >&5'
> - ac_link='$CC -o conftest$ac_exeext $CFLAGS $CPPFLAGS $LDFLAGS conftest.$ac_ext $LIBS >&5'
> - ac_compiler_gnu=$ac_cv_c_compiler_gnu
> -
> --  if test $glibcxx_cv_sys_sdt_h = yes; then
> -+#  if test $glibcxx_cv_sys_sdt_h = yes; then
> -
> --$as_echo "#define HAVE_SYS_SDT_H 1" >>confdefs.h
> -+#$as_echo "#define HAVE_SYS_SDT_H 1" >>confdefs.h
> -
> --  fi
> -+#  fi
> -   { $as_echo "$as_me:${as_lineno-$LINENO}: result: $glibcxx_cv_sys_sdt_h" >&5
> - $as_echo "$glibcxx_cv_sys_sdt_h" >&6; }
> -
> -diff --git a/libstdc++-v3/configure.ac b/libstdc++-v3/configure.ac
> -index 3c799be82b1..3f63a8ec9ce 100644
> ---- a/libstdc++-v3/configure.ac
> -+++ b/libstdc++-v3/configure.ac
> -@@ -240,7 +240,7 @@ GLIBCXX_CHECK_SC_NPROCESSORS_ONLN
> - GLIBCXX_CHECK_SC_NPROC_ONLN
> - GLIBCXX_CHECK_PTHREADS_NUM_PROCESSORS_NP
> - GLIBCXX_CHECK_SYSCTL_HW_NCPU
> --GLIBCXX_CHECK_SDT_H
> -+#GLIBCXX_CHECK_SDT_H
> -
> - # Check for available headers.
> - AC_CHECK_HEADERS([endian.h execinfo.h float.h fp.h ieeefp.h inttypes.h \
> --
> 2.32.0
>
>
> -=-=-=-=-=-=-=-=-=-=-=-
> Links: You receive all messages sent to this group.
> View/Reply Online (#157384): https://lists.openembedded.org/g/openembedded-core/message/157384
> Mute This Topic: https://lists.openembedded.org/mt/86599748/1997914
> Group Owner: openembedded-core+owner@lists.openembedded.org
> Unsubscribe: https://lists.openembedded.org/g/openembedded-core/unsub [raj.khem@gmail.com]
> -=-=-=-=-=-=-=-=-=-=-=-
>

