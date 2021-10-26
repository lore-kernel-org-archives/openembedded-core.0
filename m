Return-Path: <richard.purdie@linuxfoundation.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id D9E12C433F5
	for <webhook@archiver.kernel.org>; Tue, 26 Oct 2021 11:11:44 +0000 (UTC)
Received: from mail-wr1-f45.google.com (mail-wr1-f45.google.com
 [209.85.221.45])
 by mx.groups.io with SMTP id smtpd.web09.10541.1635246703669212317
 for <openembedded-core@lists.openembedded.org>;
 Tue, 26 Oct 2021 04:11:44 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@linuxfoundation.org header.s=google header.b=WyOl3Gyu;
 spf=pass (domain: linuxfoundation.org, ip: 209.85.221.45,
 mailfrom: richard.purdie@linuxfoundation.org)
Received: by mail-wr1-f45.google.com with SMTP id e12so18511078wra.4
        for <openembedded-core@lists.openembedded.org>;
 Tue, 26 Oct 2021 04:11:43 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linuxfoundation.org; s=google;
        h=from:to:subject:date:message-id:in-reply-to:references:mime-version
         :content-transfer-encoding;
        bh=x+MuNOhSfez8Gpb01HZA/Q2OcE8ZiFIkpXTqJ3ofxoo=;
        b=WyOl3GyuMZxvSj1YC9oET8CyXk4KMcxu0IMyMjWklxQVYjeAK4xMwpWqRFgQOBaS8g
         Sv+AzUXQhH8gqtyf5imQsr27tkHKLIj1NlOIXosapXf4GYSIpts/EAzM/cJC08JVEPez
         /ji0uMVyKrt6C4OQDjXZRBBFEZ58+IWEqDX2U=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:from:to:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=x+MuNOhSfez8Gpb01HZA/Q2OcE8ZiFIkpXTqJ3ofxoo=;
        b=aRPoc8sOJN8rhXorg2Uo7CglcwLFORKMraSKvAMYv9gqUZWp7xzq3fY8xppYnbrEq2
         NOEmnvFmmM/q/RGdJDeEzDSpx7Z3MB7XfEMTZEpKZsKOga7l5f0dhlNexy2iPwYYTRIj
         6mWxN5PpVnJgYjCE4x10tUn/5+Y3s+v0ed0Jzm8n+gDc0r37e1UmkwlbzFFU/mLWl/pN
         Ai7fk72tTMJwf7KI77jTkfm2o8jnEY29RNsY8+kvjzcjUw48XTcNWCFhOCvYiPVo/DHv
         lW54p3ThS5Y23jZwC5J5orTM+1uV/gcAu1fRzvjwgj4TZct6u2XovDSm7DP6XipPTsrF
         UEUA==
X-Gm-Message-State: AOAM530l50lWvBSuRKKIG3knwYTohfd/DChWGHiRaAcDE7ixYvFEQdQQ
	wgPJuyV9e+XHabdROlannJA29WIghdsndw==
X-Google-Smtp-Source: 
 ABdhPJzsEMiTQigk4XyWKLTn3aeh3INiqSkd8CBHSXJL80YXA9RPytilOepSpZJmJarthden2JSO7Q==
X-Received: by 2002:adf:dc0e:: with SMTP id
 t14mr31965245wri.277.1635246701885;
        Tue, 26 Oct 2021 04:11:41 -0700 (PDT)
Received: from hex.int.rpsys.net ([2001:8b0:aba:5f3c:6b9e:385e:1583:4f40])
        by smtp.gmail.com with ESMTPSA id
 f17sm11403510wrv.89.2021.10.26.04.11.41
        for <openembedded-core@lists.openembedded.org>
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 26 Oct 2021 04:11:41 -0700 (PDT)
From: Richard Purdie <richard.purdie@linuxfoundation.org>
To: openembedded-core@lists.openembedded.org
Subject: [PATCH 2/4] gcc: Drop sdt (dtrace) header patch
Date: Tue, 26 Oct 2021 12:11:38 +0100
Message-Id: <20211026111140.3298966-2-richard.purdie@linuxfoundation.org>
X-Mailer: git-send-email 2.32.0
In-Reply-To: <20211026111140.3298966-1-richard.purdie@linuxfoundation.org>
References: <20211026111140.3298966-1-richard.purdie@linuxfoundation.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Tue, 26 Oct 2021 11:11:44 -0000
X-Groupsio-URL: 
 https://lists.openembedded.org/g/openembedded-core/message/157384

Since we now have recipe specific sysroots we no longer need this patch
to avoid the dtrace headers affecting the build of gcc-runtime. Drop
the patch.

Signed-off-by: Richard Purdie <richard.purdie@linuxfoundation.org>
---
 meta/recipes-devtools/gcc/gcc-11.2.inc        |   1 -
 .../gcc/gcc/0013-Disable-sdt.patch            | 110 ------------------
 2 files changed, 111 deletions(-)
 delete mode 100644 meta/recipes-devtools/gcc/gcc/0013-Disable-sdt.patch

diff --git a/meta/recipes-devtools/gcc/gcc-11.2.inc b/meta/recipes-devtools/gcc/gcc-11.2.inc
index 6fa344e9612..1ab779533ca 100644
--- a/meta/recipes-devtools/gcc/gcc-11.2.inc
+++ b/meta/recipes-devtools/gcc/gcc-11.2.inc
@@ -42,7 +42,6 @@ SRC_URI = "\
            file://0010-MIPS64-Default-to-N64-ABI.patch \
            file://0011-Define-GLIBC_DYNAMIC_LINKER-and-UCLIBC_DYNAMIC_LINKE.patch \
            file://0012-gcc-Fix-argument-list-too-long-error.patch \
-           file://0013-Disable-sdt.patch \
            file://0014-libtool.patch \
            file://0015-gcc-armv4-pass-fix-v4bx-to-linker-to-support-EABI.patch \
            file://0016-Use-the-multilib-config-files-from-B-instead-of-usin.patch \
diff --git a/meta/recipes-devtools/gcc/gcc/0013-Disable-sdt.patch b/meta/recipes-devtools/gcc/gcc/0013-Disable-sdt.patch
deleted file mode 100644
index 1e657666df9..00000000000
--- a/meta/recipes-devtools/gcc/gcc/0013-Disable-sdt.patch
+++ /dev/null
@@ -1,110 +0,0 @@
-From 7928a4eddc4a6d821a6aa6eaaea1fd60d54e3da9 Mon Sep 17 00:00:00 2001
-From: Khem Raj <raj.khem@gmail.com>
-Date: Fri, 29 Mar 2013 09:28:10 +0400
-Subject: [PATCH] Disable sdt.
-
-We don't list dtrace in DEPENDS so we shouldn't be depending on this header.
-It may or may not exist from preivous builds though. To be determinstic, disable
-sdt.h usage always. This avoids build failures if the header is removed after configure
-but before libgcc is compiled for example.
-
-RP 2012/8/7
-
-Signed-off-by: Khem Raj <raj.khem@gmail.com>
-
-Disable sdt for libstdc++-v3.
-
-Signed-off-by: Robert Yang <liezhi.yang@windriver.com>
-
-Upstream-Status: Inappropriate [hack]
----
- gcc/configure             | 12 ++++++------
- gcc/configure.ac          | 18 +++++++++---------
- libstdc++-v3/configure    |  6 +++---
- libstdc++-v3/configure.ac |  2 +-
- 4 files changed, 19 insertions(+), 19 deletions(-)
-
-diff --git a/gcc/configure b/gcc/configure
-index c5d3bc4ee2d..5160917d73e 100755
---- a/gcc/configure
-+++ b/gcc/configure
-@@ -30812,12 +30812,12 @@ fi
- { $as_echo "$as_me:${as_lineno-$LINENO}: checking sys/sdt.h in the target C library" >&5
- $as_echo_n "checking sys/sdt.h in the target C library... " >&6; }
- have_sys_sdt_h=no
--if test -f $target_header_dir/sys/sdt.h; then
--  have_sys_sdt_h=yes
--
--$as_echo "#define HAVE_SYS_SDT_H 1" >>confdefs.h
--
--fi
-+#if test -f $target_header_dir/sys/sdt.h; then
-+#  have_sys_sdt_h=yes
-+#
-+#$as_echo "#define HAVE_SYS_SDT_H 1" >>confdefs.h
-+#
-+#fi
- { $as_echo "$as_me:${as_lineno-$LINENO}: result: $have_sys_sdt_h" >&5
- $as_echo "$have_sys_sdt_h" >&6; }
- 
-diff --git a/gcc/configure.ac b/gcc/configure.ac
-index f83420326d6..50f78308e8a 100644
---- a/gcc/configure.ac
-+++ b/gcc/configure.ac
-@@ -6653,15 +6653,15 @@ fi
- AC_SUBST([enable_default_ssp])
- 
- # Test for <sys/sdt.h> on the target.
--GCC_TARGET_TEMPLATE([HAVE_SYS_SDT_H])
--AC_MSG_CHECKING(sys/sdt.h in the target C library)
--have_sys_sdt_h=no
--if test -f $target_header_dir/sys/sdt.h; then
--  have_sys_sdt_h=yes
--  AC_DEFINE(HAVE_SYS_SDT_H, 1,
--            [Define if your target C library provides sys/sdt.h])
--fi
--AC_MSG_RESULT($have_sys_sdt_h)
-+#GCC_TARGET_TEMPLATE([HAVE_SYS_SDT_H])
-+#AC_MSG_CHECKING(sys/sdt.h in the target C library)
-+#have_sys_sdt_h=no
-+#if test -f $target_header_dir/sys/sdt.h; then
-+#  have_sys_sdt_h=yes
-+#  AC_DEFINE(HAVE_SYS_SDT_H, 1,
-+#            [Define if your target C library provides sys/sdt.h])
-+#fi
-+#AC_MSG_RESULT($have_sys_sdt_h)
- 
- # Check if TFmode long double should be used by default or not.
- # Some glibc targets used DFmode long double, but with glibc 2.4
-diff --git a/libstdc++-v3/configure b/libstdc++-v3/configure
-index a310e9feb6c..c879445b8a6 100755
---- a/libstdc++-v3/configure
-+++ b/libstdc++-v3/configure
-@@ -22014,11 +22014,11 @@ ac_compile='$CC -c $CFLAGS $CPPFLAGS conftest.$ac_ext >&5'
- ac_link='$CC -o conftest$ac_exeext $CFLAGS $CPPFLAGS $LDFLAGS conftest.$ac_ext $LIBS >&5'
- ac_compiler_gnu=$ac_cv_c_compiler_gnu
- 
--  if test $glibcxx_cv_sys_sdt_h = yes; then
-+#  if test $glibcxx_cv_sys_sdt_h = yes; then
- 
--$as_echo "#define HAVE_SYS_SDT_H 1" >>confdefs.h
-+#$as_echo "#define HAVE_SYS_SDT_H 1" >>confdefs.h
- 
--  fi
-+#  fi
-   { $as_echo "$as_me:${as_lineno-$LINENO}: result: $glibcxx_cv_sys_sdt_h" >&5
- $as_echo "$glibcxx_cv_sys_sdt_h" >&6; }
- 
-diff --git a/libstdc++-v3/configure.ac b/libstdc++-v3/configure.ac
-index 3c799be82b1..3f63a8ec9ce 100644
---- a/libstdc++-v3/configure.ac
-+++ b/libstdc++-v3/configure.ac
-@@ -240,7 +240,7 @@ GLIBCXX_CHECK_SC_NPROCESSORS_ONLN
- GLIBCXX_CHECK_SC_NPROC_ONLN
- GLIBCXX_CHECK_PTHREADS_NUM_PROCESSORS_NP
- GLIBCXX_CHECK_SYSCTL_HW_NCPU
--GLIBCXX_CHECK_SDT_H
-+#GLIBCXX_CHECK_SDT_H
- 
- # Check for available headers.
- AC_CHECK_HEADERS([endian.h execinfo.h float.h fp.h ieeefp.h inttypes.h \
-- 
2.32.0


