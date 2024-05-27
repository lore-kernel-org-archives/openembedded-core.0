Return-Path: <alex.kanavin@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 678FCC25B7E
	for <webhook@archiver.kernel.org>; Mon, 27 May 2024 18:12:36 +0000 (UTC)
Received: from mail-ed1-f42.google.com (mail-ed1-f42.google.com [209.85.208.42])
 by mx.groups.io with SMTP id smtpd.web11.3779.1716833547253550229
 for <openembedded-core@lists.openembedded.org>;
 Mon, 27 May 2024 11:12:27 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20230601 header.b=OMv8bpzn;
 spf=pass (domain: gmail.com, ip: 209.85.208.42, mailfrom: alex.kanavin@gmail.com)
Received: by mail-ed1-f42.google.com with SMTP id 4fb4d7f45d1cf-579cd80450fso2209443a12.0
        for <openembedded-core@lists.openembedded.org>; Mon, 27 May 2024 11:12:27 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1716833546; x=1717438346; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=KW5l0QSuNvGrv8p04YFxYwtl8XQPG2AC+6h/sOJwe+I=;
        b=OMv8bpznN6BsU+WYtsChoG7KvBqanLJk98ROxdhd7cA4fHDCVOpJbLV7MQjHyKzxA9
         jqYMrrEV3kHlYEDXGzEd0hw5J+qZKq14Msn/JeSMK5195Dvaiyr3SrHnvphn0CGqY8c8
         MMEm/12Envdbz8PuDcffijZQI4Vu5VZxEN9Nnj7PVJ3x/NW/wA1y+JktxUKkLn/hW4Xx
         P39RslAp/bavRfsoPxKobk+NKRGO85ziRvKWMaIckxImUg5tJoQOobc8mzY/8qyK4BEo
         1fNeU5L/AuUS+WAaTUCl27DFcIzDndhlbqCdG0T9edy7So/pzKqJGjAw1kOoWj1DDKZh
         6R/g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1716833546; x=1717438346;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=KW5l0QSuNvGrv8p04YFxYwtl8XQPG2AC+6h/sOJwe+I=;
        b=IdwQF0CD+1WaS7ytjKzEFmSIo3nFo9Wyp1oBP0bYyPnEJ70h9F5hCtJtu1jjBV68uN
         nkuJBxDaq61N4eO87Lt/kgaVDWethqRRK6LBMspI17IJMePOcNFnfQswbsL3c0E3E0bi
         Nxwse/I/YPCr62nfxkV7ifIl5PB2S6E3+RjxOOnMlVAyNyrmxCKB2JlprFzir7qGAs36
         vZ3ocqnIZxTxhDI++4oM8sNKMG6d+KxBD4ka/HQgcpBKeHKi7fuyvS8g6l0Uul/hqljw
         IqZ6k6EBRNItIsXqiNcJ4itbGaiO5LJ0QONXsz2IGPB25N6/+UNCJwmLXAqqyUc3Ncw4
         Oscw==
X-Gm-Message-State: AOJu0Yxrb+GnBwbgDLJH2DPUkk+oEMNPIyiH3Y/8/PiVGBxBd8NY3SUD
	WS5hL7QXybz/vlAol850aJGH29agBdg0w7d3h4CHj+w7SiwrdG1lEoA2Zg==
X-Google-Smtp-Source: AGHT+IEK8ZwzwMZ4IzOAuJCIorqPfwVhxYXwJzg5/ih3FkGZVy0rNN/0Mcv8annfJNKH2TOCX9fXFg==
X-Received: by 2002:a17:907:9445:b0:a63:4bc:704d with SMTP id a640c23a62f3a-a6304bc76c1mr248767666b.1.1716833545534;
        Mon, 27 May 2024 11:12:25 -0700 (PDT)
Received: from Zen2.lab.linutronix.de. (drugstore.linutronix.de. [80.153.143.164])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-a626cc50064sm510272466b.107.2024.05.27.11.12.25
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 27 May 2024 11:12:25 -0700 (PDT)
From: Alexander Kanavin <alex.kanavin@gmail.com>
To: openembedded-core@lists.openembedded.org
Cc: Alexander Kanavin <alex@linutronix.de>
Subject: [PATCH 13/13] libomxil: remove the recipe
Date: Mon, 27 May 2024 20:12:14 +0200
Message-Id: <20240527181214.1778037-13-alex.kanavin@gmail.com>
X-Mailer: git-send-email 2.39.2
In-Reply-To: <20240527181214.1778037-1-alex.kanavin@gmail.com>
References: <20240527181214.1778037-1-alex.kanavin@gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Mon, 27 May 2024 18:12:36 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/199930

From: Alexander Kanavin <alex@linutronix.de>

Now-removed gstreamer omx plugin was the only consumer, and it's all very obsolete and
hasn't seen development in years.

Signed-off-by: Alexander Kanavin <alex@linutronix.de>
---
 meta/conf/distro/include/distro_alias.inc     |  1 -
 meta/conf/distro/include/maintainers.inc      |  1 -
 .../libomxil-0.9.3/configure-fix.patch        | 58 -------------------
 .../disable-so-versioning.patch               | 36 ------------
 .../dynamicloader-linking.patch               | 20 -------
 .../libomxil-0.9.3/makefile-docdir-fix.patch  | 19 ------
 .../libomxil-0.9.3/parallel-make.patch        | 18 ------
 .../libomxil/libomxil_0.9.3.bb                | 45 --------------
 8 files changed, 198 deletions(-)
 delete mode 100644 meta/recipes-multimedia/libomxil/libomxil-0.9.3/configure-fix.patch
 delete mode 100644 meta/recipes-multimedia/libomxil/libomxil-0.9.3/disable-so-versioning.patch
 delete mode 100644 meta/recipes-multimedia/libomxil/libomxil-0.9.3/dynamicloader-linking.patch
 delete mode 100644 meta/recipes-multimedia/libomxil/libomxil-0.9.3/makefile-docdir-fix.patch
 delete mode 100644 meta/recipes-multimedia/libomxil/libomxil-0.9.3/parallel-make.patch
 delete mode 100644 meta/recipes-multimedia/libomxil/libomxil_0.9.3.bb

diff --git a/meta/conf/distro/include/distro_alias.inc b/meta/conf/distro/include/distro_alias.inc
index 2b579339b2c..ccbc1d1969f 100644
--- a/meta/conf/distro/include/distro_alias.inc
+++ b/meta/conf/distro/include/distro_alias.inc
@@ -151,7 +151,6 @@ DISTRO_PN_ALIAS:pn-libnewt = "Debian=libnewt0.52 Fedora=newt"
 DISTRO_PN_ALIAS:pn-libnewt-python = "Ubuntu=python-newt Fedora=newt-python"
 DISTRO_PN_ALIAS:pn-libnl = "Mandriva=libnl Fedora=libnl"
 DISTRO_PN_ALIAS:pn-libnss-mdns = "Meego=nss-mdns OpenSuSE=nss-mdns Ubuntu=nss-mdns Mandriva=nss_mdns Debian=nss-mdns"
-DISTRO_PN_ALIAS:pn-libomxil = "OSPDT upstream=http://omxil.sourceforge.net/"
 DISTRO_PN_ALIAS:pn-libowl = "Debian=owl OpenedHand"
 DISTRO_PN_ALIAS:pn-libpam = "Meego=pam Fedora=pam OpenSuSE=pam Ubuntu=pam Mandriva=pam Debian=pam"
 DISTRO_PN_ALIAS:pn-libpcre = "Mandriva=libpcre0 Fedora=pcre"
diff --git a/meta/conf/distro/include/maintainers.inc b/meta/conf/distro/include/maintainers.inc
index 2951277b7f9..5028a507eba 100644
--- a/meta/conf/distro/include/maintainers.inc
+++ b/meta/conf/distro/include/maintainers.inc
@@ -365,7 +365,6 @@ RECIPE_MAINTAINER:pn-libnsl2 = "Khem Raj <raj.khem@gmail.com>"
 RECIPE_MAINTAINER:pn-libnss-mdns = "Alexander Kanavin <alex.kanavin@gmail.com>"
 RECIPE_MAINTAINER:pn-libnss-nis = "Khem Raj <raj.khem@gmail.com>"
 RECIPE_MAINTAINER:pn-libogg = "Anuj Mittal <anuj.mittal@intel.com>"
-RECIPE_MAINTAINER:pn-libomxil = "Anuj Mittal <anuj.mittal@intel.com>"
 RECIPE_MAINTAINER:pn-libpam = "Anuj Mittal <anuj.mittal@intel.com>"
 RECIPE_MAINTAINER:pn-libpcap = "Anuj Mittal <anuj.mittal@intel.com>"
 RECIPE_MAINTAINER:pn-libpciaccess = "Wang Mingyu <wangmy@fujitsu.com>"
diff --git a/meta/recipes-multimedia/libomxil/libomxil-0.9.3/configure-fix.patch b/meta/recipes-multimedia/libomxil/libomxil-0.9.3/configure-fix.patch
deleted file mode 100644
index 876e80ef76c..00000000000
--- a/meta/recipes-multimedia/libomxil/libomxil-0.9.3/configure-fix.patch
+++ /dev/null
@@ -1,58 +0,0 @@
-To enable --disable-Werror for libomxil to avoid some compilers which check code strictly.
-
-For example, at least the following errors happened to some compilers:
-
-1) OMX_INDEXTYPE in include/OMX_Index.h IS NOT OMX_INDEXVENDORTYPE in src/base/omx_base_component.h
-| i586-poky-linux-libtool: compile:  i586-poky-linux-gcc -m32 -march=i586 --sysroot=/home/yocto-build5/poky/build/tmp/sysroots/qemux86 -DHAVE_Climinate-unused-debug-types -Wall -Werror -DCONFIG_DEBUG_LEVEL=0 -c OMXComponentRMExt.c  -fPIC -DPIC -o .libs/libomxbase_la-OMXComponentRMExt.o
-| omx_base_component.c: In function 'omx_base_component_GetParameter':
-| omx_base_component.c:991:3: error: case value '2130706435' not in enumerated type 'OMX_INDEXTYPE' [-Werror=switch]
-| omx_base_component.c:918:3: error: case value '2130706436' not in enumerated type 'OMX_INDEXTYPE' [-Werror=switch]
-
-2)
-| i586-poky-linux-gcc  -m32   -march=i586 --sysroot=/home/yocto-build5/poky/build/tmp/sysroots/qemux86 -DHAVE_CONFIG_H -I. -I..    -DOMXILCOMPOminate-unused-debug-types -Wall -Werror -DCONFIG_DEBUG_LEVEL=0 -c -o omxregister_bellagio-omxregister.o `test -f 'omxregister.c' || echo './'`o
-| omxregister.c: In function 'buildComponentsList':
-| omxregister.c:175:7: error: variable 'err' set but not used [-Werror=unused-but-set-variable]
-| cc1: all warnings being treated as errors
-
-Upstream-Status: Inappropriate [configuration]
-
-Signed-off-by: Shane Wang <shane.wang@intel.com>
-
-diff -r 82d742d3ea90 configure.ac
---- a/configure.ac	Tue Dec 27 15:30:35 2011 +0800
-+++ b/configure.ac	Tue Dec 27 16:26:03 2011 +0800
-@@ -5,7 +5,7 @@
- AC_PREREQ([2.59])
- 
- AC_CONFIG_HEADERS([config.h])
--CFLAGS="${CFLAGS} -Wall -Werror"
-+CFLAGS="${CFLAGS} -Wall"
- 
- ################################################################################
- # Set the shared versioning info, according to section 6.3 of the libtool info #
-@@ -122,6 +122,14 @@
-     [with_android=$enableval],
-     [with_android=no])
- 
-+AC_ARG_ENABLE(
-+    [Werror],
-+    [AC_HELP_STRING(
-+        [--disable-Werror],
-+        [whether to diable treating gcc warnings as errors])],
-+    [with_Werror=$enableval],
-+    [with_Werror=yes])
-+
- ################################################################################
- # Check for programs                                                           #
- ################################################################################
-@@ -193,6 +201,10 @@
-  CFG_DEBUG_LEVEL=255
- fi
- 
-+if test "x$with_Werror" = "xyes"; then
-+ CFLAGS="${CFLAGS} -Werror"
-+fi
-+
- AC_SUBST(CFG_DEBUG_LEVEL)
- CFLAGS="${CFLAGS} -DCONFIG_DEBUG_LEVEL=$CFG_DEBUG_LEVEL"
- 
diff --git a/meta/recipes-multimedia/libomxil/libomxil-0.9.3/disable-so-versioning.patch b/meta/recipes-multimedia/libomxil/libomxil-0.9.3/disable-so-versioning.patch
deleted file mode 100644
index f408e4a6211..00000000000
--- a/meta/recipes-multimedia/libomxil/libomxil-0.9.3/disable-so-versioning.patch
+++ /dev/null
@@ -1,36 +0,0 @@
-Disable so versioning since they are really not a versioned shared lib.
-
-Upstream-Status: Submitted @ https://sourceforge.net/p/omxil/bugs/59/
-
-Signed-off-by: Drew Moseley <drew_moseley@mentor.com>
-
-diff -rub libomxil-bellagio-0.9.3-orig/src/components/audio_effects/Makefile.am libomxil-bellagio-0.9.3/src/components/audio_effects/Makefile.am
---- libomxil-bellagio-0.9.3-orig/src/components/audio_effects/Makefile.am	2014-07-20 15:22:00.858425234 -0400
-+++ libomxil-bellagio-0.9.3/src/components/audio_effects/Makefile.am	2014-07-20 15:25:42.687525225 -0400
-@@ -10,4 +10,5 @@
- libomxaudio_effects_la_CFLAGS = -I$(top_srcdir)/include \
- 				-I$(top_srcdir)/src \
- 				-I$(top_srcdir)/src/base
-+libomxaudio_effects_la_LDFLAGS = -avoid-version
- 
-diff -rub libomxil-bellagio-0.9.3-orig/src/components/clocksrc/Makefile.am libomxil-bellagio-0.9.3/src/components/clocksrc/Makefile.am
---- libomxil-bellagio-0.9.3-orig/src/components/clocksrc/Makefile.am	2014-07-20 15:22:00.858425234 -0400
-+++ libomxil-bellagio-0.9.3/src/components/clocksrc/Makefile.am	2014-07-20 15:24:49.151259753 -0400
-@@ -10,4 +10,4 @@
-                              -I$(top_srcdir)/include \
-                              -I$(top_srcdir)/src \
-                              -I$(top_srcdir)/src/base
--
-+libomxclocksrc_la_LDFLAGS = -avoid-version
-diff -rub libomxil-bellagio-0.9.3-orig/src/components/videoscheduler/Makefile.am libomxil-bellagio-0.9.3/src/components/videoscheduler/Makefile.am
---- libomxil-bellagio-0.9.3-orig/src/components/videoscheduler/Makefile.am	2014-07-20 15:22:00.862425254 -0400
-+++ libomxil-bellagio-0.9.3/src/components/videoscheduler/Makefile.am	2014-07-20 15:22:36.462601786 -0400
-@@ -6,7 +6,7 @@
- 								library_entry_point.c
- 
- libomxvideosched_la_LIBADD = $(top_builddir)/src/libomxil-bellagio.la
--libomxvideosched_la_LDFLAGS = 
-+libomxvideosched_la_LDFLAGS = -avoid-version
- libomxvideosched_la_CFLAGS = -I$(top_srcdir)/include \
- 			-I$(top_srcdir)/src \
- 			-I$(top_srcdir)/src/base
diff --git a/meta/recipes-multimedia/libomxil/libomxil-0.9.3/dynamicloader-linking.patch b/meta/recipes-multimedia/libomxil/libomxil-0.9.3/dynamicloader-linking.patch
deleted file mode 100644
index 787953a99bc..00000000000
--- a/meta/recipes-multimedia/libomxil/libomxil-0.9.3/dynamicloader-linking.patch
+++ /dev/null
@@ -1,20 +0,0 @@
-This patch fixes link issue when libomxdynamicloader.so is loaded :
-Missing symbol RM_Deinit.
-
-This patch comes from "http://pkgs.fedoraproject.org/cgit/libomxil-bellagio.git/commit/?h=f17&id=4996a95828943d345e51ded6876c3103653eecf8"
-
-Upstream-Status: Pending
-
-Signed-off-by: Sébastien Mennetrier <s.mennetrier@innotis.org>
-
---- a/src/dynamic_loader/Makefile.am	2014-02-25 15:29:10.128549636 +0100
-+++ b/src/dynamic_loader/Makefile.am	2014-02-25 15:30:15.756548808 +0100
-@@ -3,7 +3,7 @@
- omxdynamicloader_LTLIBRARIES = libomxdynamicloader.la
- libomxdynamicloader_la_SOURCES = ste_dynamic_component_loader.c ste_dynamic_component_loader.h
- 
--libomxdynamicloader_la_LDFLAGS =
-+libomxdynamicloader_la_LDFLAGS = -lomxil-bellagio -L$(top_builddir)/src/.libs
- libomxdynamicloader_la_CFLAGS = -I$(top_srcdir)/include \
- 			-I$(top_srcdir)/src \
- 			-I$(top_srcdir)/src/base \
diff --git a/meta/recipes-multimedia/libomxil/libomxil-0.9.3/makefile-docdir-fix.patch b/meta/recipes-multimedia/libomxil/libomxil-0.9.3/makefile-docdir-fix.patch
deleted file mode 100644
index dbe8c41f74a..00000000000
--- a/meta/recipes-multimedia/libomxil/libomxil-0.9.3/makefile-docdir-fix.patch
+++ /dev/null
@@ -1,19 +0,0 @@
-This patch is to remove DESTDIR in docdir.
-Otherwise, when users install by running `make install DESTDIR=/alternate/directory' specified in the file INSTALL, the doc will go into /alternate/directory/alternate/directory, which is not expected.
-
-Upstream-Status: Pending
-
-Signed-off-by: Shane Wang <shane.wang@intel.com>
-
-diff -r 30b597e4e70d Makefile.am
---- a/Makefile.am	Wed Dec 28 15:38:35 2011 +0800
-+++ b/Makefile.am	Wed Dec 28 15:39:25 2011 +0800
-@@ -7,7 +7,7 @@
- pkgconfigdir = $(libdir)/pkgconfig
- pkgconfig_DATA = libomxil-bellagio.pc
- 
--docdir = $(DESTDIR)$(prefix)/share/doc/@PACKAGE@
-+docdir = $(prefix)/share/doc/@PACKAGE@
- doc_DATA = README \
- 	   ChangeLog \
- 	   TODO
diff --git a/meta/recipes-multimedia/libomxil/libomxil-0.9.3/parallel-make.patch b/meta/recipes-multimedia/libomxil/libomxil-0.9.3/parallel-make.patch
deleted file mode 100644
index 483ca1328b7..00000000000
--- a/meta/recipes-multimedia/libomxil/libomxil-0.9.3/parallel-make.patch
+++ /dev/null
@@ -1,18 +0,0 @@
-This patch is to make libomxil Makefile support "make -jN".
-The omxregister_bellagio stuffs depend on libomxil_bellagio library.
-
-Upstream-Status: Pending
-
-Signed-off-by: Shane Wang <shane.wang@intel.com>
-
-diff -r f59d077d3dd5 Makefile.am
---- a/src/Makefile.am	Wed Dec 28 10:54:36 2011 +0800
-+++ b/src/Makefile.am	Wed Dec 28 10:55:46 2011 +0800
-@@ -7,6 +7,7 @@
- omxregister_bellagio_SOURCES = omxregister.c common.c common.h
- omxregister_bellagio_CFLAGS = -DOMXILCOMPONENTSPATH=\"$(plugindir)/\" \
- 			      -I$(top_srcdir)/include
-+omxregister_bellagio_LDADD = $(lib_LTLIBRARIES)
- omxregister_bellagio_LDFLAGS = -lomxil-bellagio -L$(builddir)
- 
- lib_LTLIBRARIES = libomxil-bellagio.la
diff --git a/meta/recipes-multimedia/libomxil/libomxil_0.9.3.bb b/meta/recipes-multimedia/libomxil/libomxil_0.9.3.bb
deleted file mode 100644
index 4564d619ae2..00000000000
--- a/meta/recipes-multimedia/libomxil/libomxil_0.9.3.bb
+++ /dev/null
@@ -1,45 +0,0 @@
-SUMMARY = "Bellagio OpenMAX Integration Layer (IL)"
-DESCRIPTION = "Bellagio is an opensource implementation of the Khronos OpenMAX \
-               Integration Layer API to access multimedia components."
-HOMEPAGE = "http://omxil.sourceforge.net/"
-
-LICENSE = "LGPL-2.1-or-later"
-LICENSE_FLAGS = "${@bb.utils.contains('PACKAGECONFIG', 'amr', 'commercial', '', d)}"
-LIC_FILES_CHKSUM = "file://COPYING;md5=ae6f0f4dbc7ac193b50f323a6ae191cb \
-                    file://src/omxcore.h;beginline=1;endline=27;md5=806b1e5566c06486fe8e42b461e03a90"
-
-SRC_URI = "${SOURCEFORGE_MIRROR}/omxil/libomxil-bellagio-${PV}.tar.gz \
-           file://configure-fix.patch \
-           file://parallel-make.patch \
-           file://makefile-docdir-fix.patch \
-           file://dynamicloader-linking.patch \
-           file://disable-so-versioning.patch"
-
-SRC_URI[md5sum] = "a1de827fdb75c02c84e55f740ca27cb8"
-SRC_URI[sha256sum] = "593c0729c8ef8c1467b3bfefcf355ec19a46dd92e31bfc280e17d96b0934d74c"
-
-S = "${WORKDIR}/${BPN}-bellagio-${PV}"
-
-inherit autotools
-
-EXTRA_OECONF += "--disable-doc --disable-Werror"
-
-PROVIDES += "virtual/libomxil"
-
-CFLAGS += "-fcommon"
-
-PACKAGECONFIG ??= ""
-
-PACKAGECONFIG[amr] = "--enable-amr,,"
-
-#
-# The .so files under ${libdir}/bellagio are not intended to be versioned and symlinked.
-# Make sure they get packaged in the main package.
-#
-FILES:${PN} += "${libdir}/bellagio/*.so \
-                ${libdir}/omxloaders/*${SOLIBS}"
-FILES:${PN}-staticdev += "${libdir}/bellagio/*.a \
-                          ${libdir}/omxloaders/*.a"
-FILES:${PN}-dev += "${libdir}/bellagio/*.la \
-                    ${libdir}/omxloaders/*.la \
-                    ${libdir}/omxloaders/*${SOLIBSDEV}"
-- 
2.39.2


