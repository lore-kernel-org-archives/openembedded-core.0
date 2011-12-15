Received: from mga14.intel.com ([143.182.124.37])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <sgw@linux.intel.com>) id 1Rb0im-0003y0-7T
	for openembedded-core@lists.openembedded.org;
	Thu, 15 Dec 2011 03:06:56 +0100
Received: from azsmga001.ch.intel.com ([10.2.17.19])
	by azsmga102.ch.intel.com with ESMTP; 14 Dec 2011 17:59:58 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="4.71,315,1320652800"; d="scan'208";a="85866706"
Received: from unknown (HELO swold-mobl.bigsur.com) ([10.255.12.219])
	by azsmga001.ch.intel.com with ESMTP; 14 Dec 2011 17:59:57 -0800
From: Saul Wold <sgw@linux.intel.com>
To: openembedded-core@lists.openembedded.org
Date: Wed, 14 Dec 2011 17:59:55 -0800
Message-Id: <18ad263f78a4b8ce32ab14ba39041ac0bc34523b.1323914338.git.sgw@linux.intel.com>
X-Mailer: git-send-email 1.7.6.4
In-Reply-To: <cover.1323914338.git.sgw@linux.intel.com>
References: <cover.1323914338.git.sgw@linux.intel.com>
In-Reply-To: <cover.1323914338.git.sgw@linux.intel.com>
References: <cover.1323914338.git.sgw@linux.intel.com>
Subject: [PATCH 1/1] Patch Upstream Status Updates
X-BeenThere: openembedded-core@lists.openembedded.org
X-Mailman-Version: 2.1.11
Precedence: list
Reply-To: Patches and discussions about the oe-core layer
	<openembedded-core@lists.openembedded.org>
List-Id: Patches and discussions about the oe-core layer
	<openembedded-core.lists.openembedded.org>
List-Unsubscribe: <http://lists.linuxtogo.org/cgi-bin/mailman/options/openembedded-core>,
	<mailto:openembedded-core-request@lists.openembedded.org?subject=unsubscribe>
List-Archive: <http://lists.linuxtogo.org/pipermail/openembedded-core>
List-Post: <mailto:openembedded-core@lists.openembedded.org>
List-Help: <mailto:openembedded-core-request@lists.openembedded.org?subject=help>
List-Subscribe: <http://lists.linuxtogo.org/cgi-bin/mailman/listinfo/openembedded-core>,
	<mailto:openembedded-core-request@lists.openembedded.org?subject=subscribe>
X-List-Received-Date: Thu, 15 Dec 2011 02:06:56 -0000

Signed-off-by: Saul Wold <sgw@linux.intel.com>
---
 meta/recipes-bsp/orinoco/files/COPYING.patch       |    2 ++
 .../u-boot/files/fix-arm920t-eabi.patch            |    2 ++
 .../x-load/x-load-git/beagleboard/name.patch       |    2 ++
 .../bind/bind-9.8.1/conf.patch                     |    2 ++
 .../bind/bind-9.8.1/cross-build-fix.patch          |    2 ++
 .../eglibc-2.14/eglibc-rpc-export-again.patch      |    3 +++
 meta/recipes-core/glib-2.0/glib-2.0/no-iconv.patch |    2 ++
 .../bash/bash-4.2/execute_cmd.patch                |    2 ++
 .../0001-don-t-try-to-run-generated-binaries.patch |    2 ++
 .../cups/cups-1.4.6/use_echo_only_in_init.patch    |    2 ++
 .../0001-mdadm-fix-build-failures-ppc64.patch      |    2 ++
 .../texinfo/texinfo-4.13a/texinfo-4.12-zlib.patch  |    2 ++
 .../texinfo-4.13a/texinfo-4.13a-data_types.patch   |    2 ++
 .../texinfo-4.13a-help-index-segfault.patch        |    2 ++
 .../texinfo-4.13a/texinfo-4.13a-mosdo-crash.patch  |    2 ++
 .../texinfo-4.13a/texinfo-4.13a-powerpc.patch      |    2 ++
 .../recipes-extended/unzip/unzip/avoid-strip.patch |    2 ++
 .../clutter/clutter-gst/enable_tests-1.8.patch     |    2 ++
 .../clutter/cogl/macro-versions.patch              |    2 ++
 .../libsdl/libsdl-1.2.14/configure_tweak.patch     |    2 ++
 .../xorg-font/encodings/nocompiler.patch           |    2 ++
 .../xorg-font/font-alias-1.0.3/nocompiler.patch    |    2 ++
 .../libx11-1.4.4/x11_disable_makekeys.patch        |    2 ++
 .../libx11-trim-1.4.4/x11_disable_makekeys.patch   |    2 ++
 ...stvideoconnector-fixed-buffers-allocation.patch |    2 ++
 .../liboil-0.3.17/0001-Fix-enable-vfp-flag.patch   |    2 ++
 26 files changed, 53 insertions(+), 0 deletions(-)

diff --git a/meta/recipes-bsp/orinoco/files/COPYING.patch b/meta/recipes-bsp/orinoco/files/COPYING.patch
index c58043d..c423228 100644
--- a/meta/recipes-bsp/orinoco/files/COPYING.patch
+++ b/meta/recipes-bsp/orinoco/files/COPYING.patch
@@ -1,3 +1,5 @@
+Upstream-Status: Inappropriate [licensing]
+
 diff -ruN orinoco-conf-1.0-orig/COPYING orinoco-conf-1.0/COPYING
 --- orinoco-conf-1.0-orig/COPYING	1970-01-01 08:00:00.000000000 +0800
 +++ orinoco-conf-1.0/COPYING	2010-12-09 16:46:42.034965101 +0800
diff --git a/meta/recipes-bsp/u-boot/files/fix-arm920t-eabi.patch b/meta/recipes-bsp/u-boot/files/fix-arm920t-eabi.patch
index 69cb758..d614442 100644
--- a/meta/recipes-bsp/u-boot/files/fix-arm920t-eabi.patch
+++ b/meta/recipes-bsp/u-boot/files/fix-arm920t-eabi.patch
@@ -1,3 +1,5 @@
+Upstream-Status: Inappropriate [configuration]
+
 ---
  cpu/arm920t/config.mk |    4 ++--
  1 file changed, 2 insertions(+), 2 deletions(-)
diff --git a/meta/recipes-bsp/x-load/x-load-git/beagleboard/name.patch b/meta/recipes-bsp/x-load/x-load-git/beagleboard/name.patch
index d0fb996..29c26a9 100644
--- a/meta/recipes-bsp/x-load/x-load-git/beagleboard/name.patch
+++ b/meta/recipes-bsp/x-load/x-load-git/beagleboard/name.patch
@@ -1,3 +1,5 @@
+Upstream-Status: Inappropriate [configuration]
+
 Index: git/Makefile
 ===================================================================
 --- git.orig/Makefile
diff --git a/meta/recipes-connectivity/bind/bind-9.8.1/conf.patch b/meta/recipes-connectivity/bind/bind-9.8.1/conf.patch
index deeb437..fd5606e 100644
--- a/meta/recipes-connectivity/bind/bind-9.8.1/conf.patch
+++ b/meta/recipes-connectivity/bind/bind-9.8.1/conf.patch
@@ -1,3 +1,5 @@
+Upstream-Status: Inappropriate [configuration]
+
 the patch is imported from openembedded project
 
 11/30/2010 - Qing He <qing.he@intel.com>
diff --git a/meta/recipes-connectivity/bind/bind-9.8.1/cross-build-fix.patch b/meta/recipes-connectivity/bind/bind-9.8.1/cross-build-fix.patch
index 4978379..4c37b6b 100644
--- a/meta/recipes-connectivity/bind/bind-9.8.1/cross-build-fix.patch
+++ b/meta/recipes-connectivity/bind/bind-9.8.1/cross-build-fix.patch
@@ -1,3 +1,5 @@
+Upstream-Status: Inappropriate [configuration]
+
 11/30/2010
 gen.c should be build by ${BUILD_CC}
 
diff --git a/meta/recipes-core/eglibc/eglibc-2.14/eglibc-rpc-export-again.patch b/meta/recipes-core/eglibc/eglibc-2.14/eglibc-rpc-export-again.patch
index 24c0a33..15bd2f8 100644
--- a/meta/recipes-core/eglibc/eglibc-2.14/eglibc-rpc-export-again.patch
+++ b/meta/recipes-core/eglibc/eglibc-2.14/eglibc-rpc-export-again.patch
@@ -1,3 +1,6 @@
+
+Upstream-Status: Inappropriate [configuration]
+
 export the rpc symbols and headers again until we can get libtirpc sorted
 out as a proper and full replacement
 
diff --git a/meta/recipes-core/glib-2.0/glib-2.0/no-iconv.patch b/meta/recipes-core/glib-2.0/glib-2.0/no-iconv.patch
index cca57d4..9c06fe6 100644
--- a/meta/recipes-core/glib-2.0/glib-2.0/no-iconv.patch
+++ b/meta/recipes-core/glib-2.0/glib-2.0/no-iconv.patch
@@ -1,3 +1,5 @@
+Upstream-Status: Inappropriate [embedded specific]
+
 We provide dummy implementation of iconv functionality if it does not find
 iconv which will be case with uclibc. We remove the check for iconv in configure
 
diff --git a/meta/recipes-extended/bash/bash-4.2/execute_cmd.patch b/meta/recipes-extended/bash/bash-4.2/execute_cmd.patch
index bd55787..81f8f0a 100644
--- a/meta/recipes-extended/bash/bash-4.2/execute_cmd.patch
+++ b/meta/recipes-extended/bash/bash-4.2/execute_cmd.patch
@@ -1,3 +1,5 @@
+Upstream-Status: Inappropriate [embedded specific]
+
 --- execute_cmd.c.orig	Fri Jun  3 13:34:42 2011
 +++ execute_cmd.c	Fri Jun  3 13:36:41 2011
 @@ -2202,7 +2202,11 @@
diff --git a/meta/recipes-extended/cups/cups-1.4.6/0001-don-t-try-to-run-generated-binaries.patch b/meta/recipes-extended/cups/cups-1.4.6/0001-don-t-try-to-run-generated-binaries.patch
index 7b544ca..e6544b5 100644
--- a/meta/recipes-extended/cups/cups-1.4.6/0001-don-t-try-to-run-generated-binaries.patch
+++ b/meta/recipes-extended/cups/cups-1.4.6/0001-don-t-try-to-run-generated-binaries.patch
@@ -1,3 +1,5 @@
+Upstream-Status: Inappropriate [embedded specific]
+
 From 90069586167b930befce7303aea57078f04b4ed8 Mon Sep 17 00:00:00 2001
 From: Koen Kooi <koen@dominion.thruhere.net>
 Date: Sun, 30 Jan 2011 16:37:27 +0100
diff --git a/meta/recipes-extended/cups/cups-1.4.6/use_echo_only_in_init.patch b/meta/recipes-extended/cups/cups-1.4.6/use_echo_only_in_init.patch
index 21ff0e5..26b57dd 100644
--- a/meta/recipes-extended/cups/cups-1.4.6/use_echo_only_in_init.patch
+++ b/meta/recipes-extended/cups/cups-1.4.6/use_echo_only_in_init.patch
@@ -1,3 +1,5 @@
+Upstream-Status: Inappropriate [embedded specific]
+
 --- a/init/cups.sh.in.orig	2008-10-04 16:50:46.000000000 -0300
 +++ b/init/cups.sh.in	2008-10-04 16:51:39.000000000 -0300
 @@ -68,7 +68,7 @@
diff --git a/meta/recipes-extended/mdadm/files/0001-mdadm-fix-build-failures-ppc64.patch b/meta/recipes-extended/mdadm/files/0001-mdadm-fix-build-failures-ppc64.patch
index 931ecbc..f573bbc 100644
--- a/meta/recipes-extended/mdadm/files/0001-mdadm-fix-build-failures-ppc64.patch
+++ b/meta/recipes-extended/mdadm/files/0001-mdadm-fix-build-failures-ppc64.patch
@@ -1,3 +1,5 @@
+Upstream-Status: Pending
+
 From 19986c721c9ac4b353c8592998d70d0dc8860bfd Mon Sep 17 00:00:00 2001
 From: Milan Broz <mbroz@redhat.com>
 Date: Thu, 14 Jul 2011 13:58:36 +1000
diff --git a/meta/recipes-extended/texinfo/texinfo-4.13a/texinfo-4.12-zlib.patch b/meta/recipes-extended/texinfo/texinfo-4.13a/texinfo-4.12-zlib.patch
index 3635b55..0520831 100644
--- a/meta/recipes-extended/texinfo/texinfo-4.13a/texinfo-4.12-zlib.patch
+++ b/meta/recipes-extended/texinfo/texinfo-4.13a/texinfo-4.12-zlib.patch
@@ -1,3 +1,5 @@
+Upstream-Status: Pending
+
 diff -up texinfo-4.12/install-info/Makefile.in_old texinfo-4.12/install-info/Makefile.in
 --- texinfo-4.12/install-info/Makefile.in_old	2008-05-13 13:33:55.000000000 +0200
 +++ texinfo-4.12/install-info/Makefile.in	2008-05-13 13:52:35.000000000 +0200
diff --git a/meta/recipes-extended/texinfo/texinfo-4.13a/texinfo-4.13a-data_types.patch b/meta/recipes-extended/texinfo/texinfo-4.13a/texinfo-4.13a-data_types.patch
index 2a87c21..50fa4b6 100644
--- a/meta/recipes-extended/texinfo/texinfo-4.13a/texinfo-4.13a-data_types.patch
+++ b/meta/recipes-extended/texinfo/texinfo-4.13a/texinfo-4.13a-data_types.patch
@@ -1,3 +1,5 @@
+Upstream-Status: Pending
+
 diff -up texinfo-4.13/info/window.c_old texinfo-4.13/info/window.c
 --- texinfo-4.13/info/window.c_old	2009-08-04 13:46:15.000000000 +0200
 +++ texinfo-4.13/info/window.c	2009-08-04 13:47:29.000000000 +0200
diff --git a/meta/recipes-extended/texinfo/texinfo-4.13a/texinfo-4.13a-help-index-segfault.patch b/meta/recipes-extended/texinfo/texinfo-4.13a/texinfo-4.13a-help-index-segfault.patch
index 6194176..aee21ff 100644
--- a/meta/recipes-extended/texinfo/texinfo-4.13a/texinfo-4.13a-help-index-segfault.patch
+++ b/meta/recipes-extended/texinfo/texinfo-4.13a/texinfo-4.13a-help-index-segfault.patch
@@ -1,3 +1,5 @@
+Upstream-Status: Pending
+
 diff -up texinfo-4.13/info/indices.c.orig texinfo-4.13/info/indices.c
 --- texinfo-4.13/info/indices.c.orig	2010-08-31 12:04:38.317462471 +0200
 +++ texinfo-4.13/info/indices.c	2010-08-31 12:11:49.322624552 +0200
diff --git a/meta/recipes-extended/texinfo/texinfo-4.13a/texinfo-4.13a-mosdo-crash.patch b/meta/recipes-extended/texinfo/texinfo-4.13a/texinfo-4.13a-mosdo-crash.patch
index 77e3a76..49b568f 100644
--- a/meta/recipes-extended/texinfo/texinfo-4.13a/texinfo-4.13a-mosdo-crash.patch
+++ b/meta/recipes-extended/texinfo/texinfo-4.13a/texinfo-4.13a-mosdo-crash.patch
@@ -1,3 +1,5 @@
+Upstream-Status: Pending
+
 --- texinfo-4.13/install-info/install-info.c.mosdo-crash	2009-09-02 20:18:44.000000000 -0400
 +++ texinfo-4.13/install-info/install-info.c	2009-09-02 20:19:53.000000000 -0400
 @@ -1765,7 +1765,7 @@
diff --git a/meta/recipes-extended/texinfo/texinfo-4.13a/texinfo-4.13a-powerpc.patch b/meta/recipes-extended/texinfo/texinfo-4.13a/texinfo-4.13a-powerpc.patch
index b6c046e..312430f 100644
--- a/meta/recipes-extended/texinfo/texinfo-4.13a/texinfo-4.13a-powerpc.patch
+++ b/meta/recipes-extended/texinfo/texinfo-4.13a/texinfo-4.13a-powerpc.patch
@@ -1,3 +1,5 @@
+Upstream-Status: Pending
+
 diff -up texinfo-4.13/install-info/install-info.c.patch texinfo-4.13/install-info/install-info.c
 --- texinfo-4.13/install-info/install-info.c.patch	2010-01-11 14:46:32.000000000 +0100
 +++ texinfo-4.13/install-info/install-info.c	2010-01-11 14:48:47.162152695 +0100
diff --git a/meta/recipes-extended/unzip/unzip/avoid-strip.patch b/meta/recipes-extended/unzip/unzip/avoid-strip.patch
index 0ef6363..8f30e42 100644
--- a/meta/recipes-extended/unzip/unzip/avoid-strip.patch
+++ b/meta/recipes-extended/unzip/unzip/avoid-strip.patch
@@ -1,3 +1,5 @@
+Upstream-Status: Pending
+
 unix/Makefile: remove hard coded strip commands
 
 Remove the hard coded strip commands, both LF2 (used in linking) and
diff --git a/meta/recipes-graphics/clutter/clutter-gst/enable_tests-1.8.patch b/meta/recipes-graphics/clutter/clutter-gst/enable_tests-1.8.patch
index 35e60ca..de1dcc2 100644
--- a/meta/recipes-graphics/clutter/clutter-gst/enable_tests-1.8.patch
+++ b/meta/recipes-graphics/clutter/clutter-gst/enable_tests-1.8.patch
@@ -1,3 +1,5 @@
+Upstream-Status: Inappropriate [embedded specific]
+
 Install example binary needed for poky-image-clutter
 
 Signed-off-by: Zhai Edwin <edwin.zhai@intel.com>
diff --git a/meta/recipes-graphics/clutter/cogl/macro-versions.patch b/meta/recipes-graphics/clutter/cogl/macro-versions.patch
index 87ea1f7..2dcdd8e 100644
--- a/meta/recipes-graphics/clutter/cogl/macro-versions.patch
+++ b/meta/recipes-graphics/clutter/cogl/macro-versions.patch
@@ -1,3 +1,5 @@
+Upstream-Status: Inappropriate [configuration]
+
 Index: cogl-1.8.0/configure.ac
 ===================================================================
 --- cogl-1.8.0.orig/configure.ac
diff --git a/meta/recipes-graphics/libsdl/libsdl-1.2.14/configure_tweak.patch b/meta/recipes-graphics/libsdl/libsdl-1.2.14/configure_tweak.patch
index 55d203a..07bda6d 100644
--- a/meta/recipes-graphics/libsdl/libsdl-1.2.14/configure_tweak.patch
+++ b/meta/recipes-graphics/libsdl/libsdl-1.2.14/configure_tweak.patch
@@ -1,3 +1,5 @@
+Upstream-Status: Inappropriate [configuration]
+
 --- SDL-1.2.14/configure.in.orig	2011-10-18 14:51:32.044167004 +0800
 +++ SDL-1.2.14/configure.in	2011-10-18 14:51:42.374167009 +0800
 @@ -48,9 +48,9 @@
diff --git a/meta/recipes-graphics/xorg-font/encodings/nocompiler.patch b/meta/recipes-graphics/xorg-font/encodings/nocompiler.patch
index 1cddd10..f330c18 100644
--- a/meta/recipes-graphics/xorg-font/encodings/nocompiler.patch
+++ b/meta/recipes-graphics/xorg-font/encodings/nocompiler.patch
@@ -1,3 +1,5 @@
+Upstream-Status: Inappropriate [configuration]
+
 XORG_DEFAULT_OPTIONS pulls in the following dependency chains:
 
 XORG_CWARNFLAGS -> AC_PROG_CC_C99
diff --git a/meta/recipes-graphics/xorg-font/font-alias-1.0.3/nocompiler.patch b/meta/recipes-graphics/xorg-font/font-alias-1.0.3/nocompiler.patch
index 48e183c..0b9fb8c 100644
--- a/meta/recipes-graphics/xorg-font/font-alias-1.0.3/nocompiler.patch
+++ b/meta/recipes-graphics/xorg-font/font-alias-1.0.3/nocompiler.patch
@@ -1,3 +1,5 @@
+Upstream-Status: Inappropriate [configuration]
+
 XORG_DEFAULT_OPTIONS pulls in the following dependency chains:
 
 XORG_CWARNFLAGS -> AC_PROG_CC_C99
diff --git a/meta/recipes-graphics/xorg-lib/libx11-1.4.4/x11_disable_makekeys.patch b/meta/recipes-graphics/xorg-lib/libx11-1.4.4/x11_disable_makekeys.patch
index 9763313..e3782a5 100644
--- a/meta/recipes-graphics/xorg-lib/libx11-1.4.4/x11_disable_makekeys.patch
+++ b/meta/recipes-graphics/xorg-lib/libx11-1.4.4/x11_disable_makekeys.patch
@@ -1,3 +1,5 @@
+Upstream-Status: Pending
+
 Index: libX11-1.3.4/src/util/Makefile.am
 ===================================================================
 --- libX11-1.3.4.orig/src/util/Makefile.am
diff --git a/meta/recipes-graphics/xorg-lib/libx11-trim-1.4.4/x11_disable_makekeys.patch b/meta/recipes-graphics/xorg-lib/libx11-trim-1.4.4/x11_disable_makekeys.patch
index 9763313..e3782a5 100644
--- a/meta/recipes-graphics/xorg-lib/libx11-trim-1.4.4/x11_disable_makekeys.patch
+++ b/meta/recipes-graphics/xorg-lib/libx11-trim-1.4.4/x11_disable_makekeys.patch
@@ -1,3 +1,5 @@
+Upstream-Status: Pending
+
 Index: libX11-1.3.4/src/util/Makefile.am
 ===================================================================
 --- libX11-1.3.4.orig/src/util/Makefile.am
diff --git a/meta/recipes-qt/qt4/files/0001-gstvideoconnector-fixed-buffers-allocation.patch b/meta/recipes-qt/qt4/files/0001-gstvideoconnector-fixed-buffers-allocation.patch
index cea07c9..2df76fc 100644
--- a/meta/recipes-qt/qt4/files/0001-gstvideoconnector-fixed-buffers-allocation.patch
+++ b/meta/recipes-qt/qt4/files/0001-gstvideoconnector-fixed-buffers-allocation.patch
@@ -1,3 +1,5 @@
+Upstream-Status: Submitted [QTMOBILITY-1611]
+
 From b308508b49afa9a129b4e4589c57cd107d1320b8 Mon Sep 17 00:00:00 2001
 From: Dmytro Poplavskiy <dmytro.poplavskiy@nokia.com>
 Date: Fri, 6 May 2011 10:35:11 +1000
diff --git a/meta/recipes-support/liboil/liboil-0.3.17/0001-Fix-enable-vfp-flag.patch b/meta/recipes-support/liboil/liboil-0.3.17/0001-Fix-enable-vfp-flag.patch
index 5b7dd4e..aff1cb1 100644
--- a/meta/recipes-support/liboil/liboil-0.3.17/0001-Fix-enable-vfp-flag.patch
+++ b/meta/recipes-support/liboil/liboil-0.3.17/0001-Fix-enable-vfp-flag.patch
@@ -1,3 +1,5 @@
+Upstream-Status: Inappropriate [configuration]
+
 From 1921498bcc06408e8b051a3a9e9ce4182998f748 Mon Sep 17 00:00:00 2001
 From: David Schleef <ds@schleef.org>
 Date: Fri, 8 Apr 2011 10:05:49 -0700
-- 
1.7.6.4



