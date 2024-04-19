Return-Path: <alex.kanavin@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 88422C04FF6
	for <webhook@archiver.kernel.org>; Fri, 19 Apr 2024 12:20:01 +0000 (UTC)
Received: from mail-ed1-f47.google.com (mail-ed1-f47.google.com [209.85.208.47])
 by mx.groups.io with SMTP id smtpd.web10.19241.1713529191179312333
 for <openembedded-core@lists.openembedded.org>;
 Fri, 19 Apr 2024 05:19:51 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20230601 header.b=fdFyvVXX;
 spf=pass (domain: gmail.com, ip: 209.85.208.47, mailfrom: alex.kanavin@gmail.com)
Received: by mail-ed1-f47.google.com with SMTP id 4fb4d7f45d1cf-56e6a1edecfso2986367a12.1
        for <openembedded-core@lists.openembedded.org>; Fri, 19 Apr 2024 05:19:50 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1713529189; x=1714133989; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=P/5TcMmyyxJ3Ih6yok2ehG0roIInYSodKy5wP4Wa2M4=;
        b=fdFyvVXX2+x8OPWiJ0/TX2X8OmB1amiOwOs3NqXi6OcI/euF29JharC4v6a4JLRc7N
         Wp3h9TyZ7tkZjLZstmExBEydiYF5zQmR9pgLNhed275e3gTjz6sxB/K9vm15YbmNk9VX
         MpugRfEHjSjVk1OsiBhVheiftJ00IqF6RIJ4v+QJa4eJ8mPkCY1TfvT2XV6g0UMAyCMs
         I5TsIYrlXm7ZuY7je3VH0Ru0uG9P9mXnQLtQC6AB3cGFh6kNC1/LLr+vHKHb79JO4Zm4
         M5x5TC5A4kuPnReDknvALSYHV3713QKuxNwgr3ANOxw4mCcQMXEIgW5c0jl8ke1Gmr6B
         bPMw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1713529189; x=1714133989;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=P/5TcMmyyxJ3Ih6yok2ehG0roIInYSodKy5wP4Wa2M4=;
        b=J+XfPxqwR9bAOWZIQN7FtFPdaBhcWaczJ4x9MBmUOFxNqNENWmMfim/IbAkr9BT7Iz
         MWSUXOAwfPq+CeQn8tmyKxlPOJHgrLc6yW9sWQL8BtpDW1oVwEwwnfYGX1VYuA49ljB6
         6dL2ZCQPcWzxcr/XpLD9a+DNdrXXDOQYemIj+eXbeVxRNUoB8MVFT+CnHlFKuvUQsqys
         xfZc99EdduPVcD06/ZYirUHmHK46UvOWIUNAQX1PILoiphrCmlc7C2QWd62ftpfR+xe9
         FNhiavk/P2HAmeTYJVILUU+7l5Bjq/xAUkwTbxcghkzvS8Xu7D4m+TVZISrjDOm3f0Bo
         MhPw==
X-Gm-Message-State: AOJu0Yy31Un+a+sBnHiu/ImxhduXn3kKTOkT4bVzjL2BJIfOdcFJbe4y
	GM+GASDv/IXjcx7zNaJf7VUdkx8s9KVoVhZ5wgKDXc+wm9jQ/Em6q4D+nw==
X-Google-Smtp-Source: AGHT+IHQY0vGXCy45cG5/tf10S/3SqkEw4RtlFeAPvOs0gzCcW03nwR9sz81KceiAVIBbi9YcYrwgg==
X-Received: by 2002:a50:cd12:0:b0:56e:2c1d:1174 with SMTP id z18-20020a50cd12000000b0056e2c1d1174mr1612691edi.4.1713529189146;
        Fri, 19 Apr 2024 05:19:49 -0700 (PDT)
Received: from Zen2.lab.linutronix.de. (drugstore.linutronix.de. [80.153.143.164])
        by smtp.gmail.com with ESMTPSA id w22-20020aa7cb56000000b00571c1070edfsm1608415edt.17.2024.04.19.05.19.48
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 19 Apr 2024 05:19:48 -0700 (PDT)
From: Alexander Kanavin <alex.kanavin@gmail.com>
X-Google-Original-From: Alexander Kanavin <alex@linutronix.de>
To: openembedded-core@lists.openembedded.org
Cc: Alexander Kanavin <alex@linutronix.de>
Subject: [PATCH 01/19] liba52: remove the recipe
Date: Fri, 19 Apr 2024 14:19:27 +0200
Message-Id: <20240419121945.1920944-1-alex@linutronix.de>
X-Mailer: git-send-email 2.39.2
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Fri, 19 Apr 2024 12:20:01 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/198529

The component has been superseded by ffmpeg long ago, tarballs have
disappeared from sourceforge, no work on it has happened in over 10 years.

Signed-off-by: Alexander Kanavin <alex@linutronix.de>
---
 meta/conf/distro/include/distro_alias.inc     |  1 -
 meta/conf/distro/include/maintainers.inc      |  1 -
 .../gstreamer1.0-plugins-ugly_1.22.11.bb      |  2 +-
 .../liba52/liba52/buildcleanup.patch          | 89 -------------------
 .../recipes-multimedia/liba52/liba52_0.7.4.bb | 28 ------
 5 files changed, 1 insertion(+), 120 deletions(-)
 delete mode 100644 meta/recipes-multimedia/liba52/liba52/buildcleanup.patch
 delete mode 100644 meta/recipes-multimedia/liba52/liba52_0.7.4.bb

diff --git a/meta/conf/distro/include/distro_alias.inc b/meta/conf/distro/include/distro_alias.inc
index e6131c815a0..2b579339b2c 100644
--- a/meta/conf/distro/include/distro_alias.inc
+++ b/meta/conf/distro/include/distro_alias.inc
@@ -123,7 +123,6 @@ DISTRO_PN_ALIAS:pn-keymaps = "OE-Core"
 DISTRO_PN_ALIAS:pn-kf = "OSPDT"
 DISTRO_PN_ALIAS:pn-lame = "Debian=lame Ubuntu=lame"
 DISTRO_PN_ALIAS:pn-ldconfig-native = "Ubuntu=libc-bin Fedora=glibc"
-DISTRO_PN_ALIAS:pn-liba52 = "Mandriva=a52dec Debian=a52dec"
 DISTRO_PN_ALIAS:pn-libacpi = "Ubuntu=libacpi Mandriva=libacpi"
 DISTRO_PN_ALIAS:pn-libatomics-ops = "Meego=libatomic-ops Debian=libatomic-ops Ubuntu=libatomic-ops OpenSuSE=libatomic-ops Mandriva=libatomic-ops"
 DISTRO_PN_ALIAS:pn-libcgroup = "Ubuntu=libcgroup1 Debian=libcgroup1"
diff --git a/meta/conf/distro/include/maintainers.inc b/meta/conf/distro/include/maintainers.inc
index 20eb3a04468..52bb542483d 100644
--- a/meta/conf/distro/include/maintainers.inc
+++ b/meta/conf/distro/include/maintainers.inc
@@ -305,7 +305,6 @@ RECIPE_MAINTAINER:pn-l3afpad = "Anuj Mittal <anuj.mittal@intel.com>"
 RECIPE_MAINTAINER:pn-lame = "Michael Opdenacker <michael.opdenacker@bootlin.com>"
 RECIPE_MAINTAINER:pn-ldconfig-native = "Khem Raj <raj.khem@gmail.com>"
 RECIPE_MAINTAINER:pn-less = "Yi Zhao <yi.zhao@windriver.com>"
-RECIPE_MAINTAINER:pn-liba52 = "Unassigned <unassigned@yoctoproject.org>"
 RECIPE_MAINTAINER:pn-libacpi = "Anuj Mittal <anuj.mittal@intel.com>"
 RECIPE_MAINTAINER:pn-libadwaita = "Alexander Kanavin <alex.kanavin@gmail.com>"
 RECIPE_MAINTAINER:pn-libaio = "Alexander Kanavin <alex.kanavin@gmail.com>"
diff --git a/meta/recipes-multimedia/gstreamer/gstreamer1.0-plugins-ugly_1.22.11.bb b/meta/recipes-multimedia/gstreamer/gstreamer1.0-plugins-ugly_1.22.11.bb
index 61f46fbf7e5..d89442d7893 100644
--- a/meta/recipes-multimedia/gstreamer/gstreamer1.0-plugins-ugly_1.22.11.bb
+++ b/meta/recipes-multimedia/gstreamer/gstreamer1.0-plugins-ugly_1.22.11.bb
@@ -25,7 +25,7 @@ GST_PLUGIN_SET_HAS_EXAMPLES = "0"
 
 PACKAGECONFIG ??= " \
     ${GSTREAMER_ORC} \
-    a52dec mpeg2dec \
+    mpeg2dec \
 "
 
 PACKAGECONFIG[amrnb]    = "-Damrnb=enabled,-Damrnb=disabled,opencore-amr"
diff --git a/meta/recipes-multimedia/liba52/liba52/buildcleanup.patch b/meta/recipes-multimedia/liba52/liba52/buildcleanup.patch
deleted file mode 100644
index 5168100f3ad..00000000000
--- a/meta/recipes-multimedia/liba52/liba52/buildcleanup.patch
+++ /dev/null
@@ -1,89 +0,0 @@
-It makes much more sense to control our own CFLAGS and avoiding fPIC breaks
-some arches too. Assume we know what we're doing and remove all the messing 
-around.
-
-RP 23/2/10
-
-Upstream-Status: Inappropriate [configuration]
-
-Index: a52dec-0.7.4/configure.in
-===================================================================
---- a52dec-0.7.4.orig/configure.in	2010-02-23 14:51:50.000000000 +0000
-+++ a52dec-0.7.4/configure.in	2010-02-23 14:52:36.000000000 +0000
-@@ -14,62 +14,6 @@
- AC_PROG_CC
- AC_PROG_GCC_TRADITIONAL
- 
--if test x"$GCC" = x"yes"; then
--
--    dnl GCC-specific flags - try to optimize them sometime
--    dnl -Wall -Werror moved to the end to not disturb the configure script
--
--    dnl -O3
--    changequote(<<,>>)
--    OPT_CFLAGS=`echo "$CFLAGS"|sed "s/-O[0-9]*//g"`
--    changequote([,])
--    OPT_CFLAGS="$OPT_CFLAGS -O3"
--    AC_TRY_CFLAGS([$OPT_CFLAGS],[CFLAGS=$OPT_CFLAGS])
--
--    dnl -fomit-frame-pointer
--    OPT_CFLAGS="$CFLAGS -fomit-frame-pointer"
--    AC_TRY_CFLAGS([$OPT_CFLAGS],[CFLAGS=$OPT_CFLAGS])
--
--    dnl arch-specific flags
--    case "$host" in
--    i?86-* | k?-*)
--	case "$host" in
--	i386-*) OPT_CFLAGS="$CFLAGS -mcpu=i386";;
--	i486-*) OPT_CFLAGS="$CFLAGS -mcpu=i486";;
--	i586-*) OPT_CFLAGS="$CFLAGS -mcpu=pentium";;
--	i686-*) OPT_CFLAGS="$CFLAGS -mcpu=pentiumpro";;
--	k6-*)   OPT_CFLAGS="$CFLAGS -mcpu=k6";;
--	esac
--	AC_TRY_CFLAGS([$OPT_CFLAGS],[CFLAGS=$OPT_CFLAGS]);;
--    sparc-* | sparc64-*)
--	OPT_CFLAGS="$CFLAGS -mtune=ultrasparc"
--	AC_TRY_CFLAGS([$OPT_CFLAGS],[CFLAGS=$OPT_CFLAGS]);;
--    mips-sgi-irix6.*)	dnl do we need to be that specific ?
--	OPT_CFLAGS="$CFLAGS -mabi=64"
--	AC_TRY_CFLAGS([$OPT_CFLAGS],[CFLAGS=$OPT_CFLAGS]);;
--    esac
--elif test x"$CC" = x"tcc" -a x"`$CC -version 2>&1 | grep TenDRA`" != x""; then
--    dnl TenDRA portability checking compiler
--    TENDRA=yes
--    CFLAGS="-Xp -Yansi -f`pwd`/include/tendra.h -DELIDE_CODE"
--    enable_mlib=no
--    enable_oss=no
--    enable_solaris_audio=no
--elif test x"$CC" = x"icc" -a x"`$CC -V 2>&1 | grep Intel`" != x""; then
--    dnl Intel C++ compiler
--    CFLAGS="-g -O3 -unroll -ip"
--else
--    dnl non-gcc flags - we probably need exact configuration triplets here.
--    case "$host" in
--    mips-sgi-irix6.*)
--	OPT_CFLAGS="$CFLAGS -64"
--	AC_TRY_CFLAGS([$OPT_CFLAGS],[CFLAGS=$OPT_CFLAGS]);;
--    sparc-sun-solaris*)
--	OPT_CFLAGS="$CFLAGS -xCC -fast -xO5"
--	AC_TRY_CFLAGS([$OPT_CFLAGS],[CFLAGS=$OPT_CFLAGS]);;
--    esac
--fi
--
- dnl Checks for libtool - this must be done after we set cflags
- AC_DISABLE_SHARED
- AC_LIBTOOL_WIN32_DLL
-Index: a52dec-0.7.4/liba52/configure.incl
-===================================================================
---- a52dec-0.7.4.orig/liba52/configure.incl	2010-02-23 14:51:44.000000000 +0000
-+++ a52dec-0.7.4/liba52/configure.incl	2010-02-23 14:51:59.000000000 +0000
-@@ -1,9 +1,6 @@
- AC_SUBST([LIBA52_CFLAGS])
- AC_SUBST([LIBA52_LIBS])
- 
--dnl avoid -fPIC when possible
--LIBA52_CFLAGS="$LIBA52_CFLAGS -prefer-non-pic"
--
- AC_ARG_ENABLE([double],
-     [  --enable-double         use double-precision samples])
- if test x"$enable_double" = x"yes"; then
diff --git a/meta/recipes-multimedia/liba52/liba52_0.7.4.bb b/meta/recipes-multimedia/liba52/liba52_0.7.4.bb
deleted file mode 100644
index 7a3b4a43c8d..00000000000
--- a/meta/recipes-multimedia/liba52/liba52_0.7.4.bb
+++ /dev/null
@@ -1,28 +0,0 @@
-SUMMARY = "ATSC A/52 surround sound stream decoder"
-DESCRIPTION = "Library for decoding ATSC A/52 streams. The A/52 standard \
-is used in a variety of applications, including digital television \
-and DVD. It is also known as AC-3."
-HOMEPAGE = "http://liba52.sourceforge.net/"
-LICENSE = "GPL-2.0-or-later"
-LIC_FILES_CHKSUM = "file://COPYING;md5=0636e73ff0215e8d672dc4c32c317bb3 \
-			file://include/a52.h;beginline=1;endline=12;md5=81152ceb3562bf20a60d1b6018175dd1"
-SECTION = "libs"
-
-inherit autotools
-
-SRC_URI = "http://liba52.sourceforge.net/files/a52dec-${PV}.tar.gz \
-           file://buildcleanup.patch"
-
-SRC_URI[md5sum] = "caa9f5bc44232dc8aeea773fea56be80"
-SRC_URI[sha256sum] = "a21d724ab3b3933330194353687df82c475b5dfb997513eef4c25de6c865ec33"
-
-UPSTREAM_CHECK_URI = "http://liba52.sourceforge.net/downloads.html"
-
-S = "${WORKDIR}/a52dec-${PV}"
-
-EXTRA_OECONF = " --enable-shared "
-
-PACKAGES =+ "a52dec a52dec-doc"
-
-FILES:a52dec = " ${bindir}/* "
-FILES:a52dec-doc = " ${mandir}/man1/* "
-- 
2.39.2


