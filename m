Received: from mga09.intel.com ([134.134.136.24])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <sgw@linux.intel.com>) id 1QgpAO-0003A8-R9
	for openembedded-core@lists.openembedded.org;
	Wed, 13 Jul 2011 04:27:13 +0200
Received: from orsmga002.jf.intel.com ([10.7.209.21])
	by orsmga102.jf.intel.com with ESMTP; 12 Jul 2011 19:23:13 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="4.65,523,1304319600"; d="scan'208";a="25187216"
Received: from unknown (HELO swold-MOBL.bigsur.com) ([10.255.14.40])
	by orsmga002.jf.intel.com with ESMTP; 12 Jul 2011 19:23:13 -0700
From: Saul Wold <sgw@linux.intel.com>
To: openembedded-core@lists.openembedded.org
Date: Tue, 12 Jul 2011 19:23:10 -0700
Message-Id: <9f71c07b8fac91dae340385c5df3e84dd723fe13.1310521783.git.sgw@linux.intel.com>
X-Mailer: git-send-email 1.7.3.4
In-Reply-To: <cover.1310521783.git.sgw@linux.intel.com>
References: <cover.1310521783.git.sgw@linux.intel.com>
In-Reply-To: <cover.1310521783.git.sgw@linux.intel.com>
References: <cover.1310521783.git.sgw@linux.intel.com>
Subject: [PATCH 1/1] Patches: Fix Upstream-Status info
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
X-List-Received-Date: Wed, 13 Jul 2011 02:27:13 -0000

Signed-off-by: Saul Wold <sgw@linux.intel.com>
---
 ...Drop-config.h-include-in-tools-imximage.h.patch |    2 +-
 ...ove-LDSCRIPT-processing-to-the-top-level-.patch |    2 +-
 ...Drop-config.h-include-in-tools-imximage.h.patch |    2 +-
 ...ove-LDSCRIPT-processing-to-the-top-level-.patch |    2 +-
 .../eglibc/eglibc-2.13/mips-rld-map-check.patch    |    4 +-
 .../eglibc-2.13/shorten-build-commands.patch       |    1 -
 ...003-gatomic-proper-pointer-get-cast.patch.patch |    2 +-
 .../0005-glib-mkenums-interpreter.patch.patch      |    2 +-
 .../glibc/glibc-2.10.1/glibc-check_pf.patch        |    2 -
 .../cdrtools/cdrtools-native/no_usr_src.patch      |    2 +-
 .../elfutils/elfutils/mempcpy.patch                |    1 -
 .../makedevs/makedevs-1.0.0/COPYING.patch          |    2 +-
 .../qemu/qemu-0.14.0/qemugl-fix.patch              |    3 +-
 .../qemu/qemu-git/qemugl-fix.patch                 |    2 +-
 meta/recipes-extended/at/at-3.1.12/configure.patch |    1 -
 .../libtirpc-0.2.2/libtirpc-0.2.1-fortify.patch    |    2 +-
 .../clutter/clutter-gst/autofoo-0.4.patch          |   19 ------------
 ...-9db4a61a25677764bb927369c5c68ada958fb65c.patch |   29 ------------------
 .../clutter/clutter-gst/autofoo.patch              |   31 --------------------
 meta/recipes-qt/qt4/files/qt-dbus-const.patch      |    3 +-
 20 files changed, 15 insertions(+), 99 deletions(-)
 delete mode 100644 meta/recipes-graphics/clutter/clutter-gst/autofoo-0.4.patch
 delete mode 100644 meta/recipes-graphics/clutter/clutter-gst/autofoo-9db4a61a25677764bb927369c5c68ada958fb65c.patch
 delete mode 100644 meta/recipes-graphics/clutter/clutter-gst/autofoo.patch

diff --git a/meta/recipes-bsp/uboot/u-boot-mkimage-2011.03/0001-Drop-config.h-include-in-tools-imximage.h.patch b/meta/recipes-bsp/uboot/u-boot-mkimage-2011.03/0001-Drop-config.h-include-in-tools-imximage.h.patch
index f4b12ac..0405834 100644
--- a/meta/recipes-bsp/uboot/u-boot-mkimage-2011.03/0001-Drop-config.h-include-in-tools-imximage.h.patch
+++ b/meta/recipes-bsp/uboot/u-boot-mkimage-2011.03/0001-Drop-config.h-include-in-tools-imximage.h.patch
@@ -6,7 +6,7 @@ MIME-Version: 1.0
 Content-Type: text/plain; charset=UTF-8
 Content-Transfer-Encoding: 8bit
 
-Upstream-Status: Applied
+Upstream-Status: Accepted
 
 "make tools-all" should allow building tools such as mkimage and the new
 imximage without any config, but imximage.c currently fails to build
diff --git a/meta/recipes-bsp/uboot/u-boot-mkimage-2011.03/0002-config.mk-move-LDSCRIPT-processing-to-the-top-level-.patch b/meta/recipes-bsp/uboot/u-boot-mkimage-2011.03/0002-config.mk-move-LDSCRIPT-processing-to-the-top-level-.patch
index c102691..5729cd9 100644
--- a/meta/recipes-bsp/uboot/u-boot-mkimage-2011.03/0002-config.mk-move-LDSCRIPT-processing-to-the-top-level-.patch
+++ b/meta/recipes-bsp/uboot/u-boot-mkimage-2011.03/0002-config.mk-move-LDSCRIPT-processing-to-the-top-level-.patch
@@ -3,7 +3,7 @@ From: Ilya Yanok <yanok@emcraft.com>
 Date: Mon, 20 Jun 2011 12:45:37 +0000
 Subject: config.mk: move LDSCRIPT processing to the top-level Makefile
 
-Upstream-Status: Applied
+Upstream-Status: Accepted
 
 LDSCRIPT is used only from the top-level Makefile and only when the
 system is configured so we can move LDSCRIPT and CONFIG_SYS_LDSCRIPT
diff --git a/meta/recipes-bsp/uboot/u-boot-mkimage/0001-Drop-config.h-include-in-tools-imximage.h.patch b/meta/recipes-bsp/uboot/u-boot-mkimage/0001-Drop-config.h-include-in-tools-imximage.h.patch
index f4b12ac..0405834 100644
--- a/meta/recipes-bsp/uboot/u-boot-mkimage/0001-Drop-config.h-include-in-tools-imximage.h.patch
+++ b/meta/recipes-bsp/uboot/u-boot-mkimage/0001-Drop-config.h-include-in-tools-imximage.h.patch
@@ -6,7 +6,7 @@ MIME-Version: 1.0
 Content-Type: text/plain; charset=UTF-8
 Content-Transfer-Encoding: 8bit
 
-Upstream-Status: Applied
+Upstream-Status: Accepted
 
 "make tools-all" should allow building tools such as mkimage and the new
 imximage without any config, but imximage.c currently fails to build
diff --git a/meta/recipes-bsp/uboot/u-boot-mkimage/0002-config.mk-move-LDSCRIPT-processing-to-the-top-level-.patch b/meta/recipes-bsp/uboot/u-boot-mkimage/0002-config.mk-move-LDSCRIPT-processing-to-the-top-level-.patch
index c102691..5729cd9 100644
--- a/meta/recipes-bsp/uboot/u-boot-mkimage/0002-config.mk-move-LDSCRIPT-processing-to-the-top-level-.patch
+++ b/meta/recipes-bsp/uboot/u-boot-mkimage/0002-config.mk-move-LDSCRIPT-processing-to-the-top-level-.patch
@@ -3,7 +3,7 @@ From: Ilya Yanok <yanok@emcraft.com>
 Date: Mon, 20 Jun 2011 12:45:37 +0000
 Subject: config.mk: move LDSCRIPT processing to the top-level Makefile
 
-Upstream-Status: Applied
+Upstream-Status: Accepted
 
 LDSCRIPT is used only from the top-level Makefile and only when the
 system is configured so we can move LDSCRIPT and CONFIG_SYS_LDSCRIPT
diff --git a/meta/recipes-core/eglibc/eglibc-2.13/mips-rld-map-check.patch b/meta/recipes-core/eglibc/eglibc-2.13/mips-rld-map-check.patch
index 7772e6f..9b646fe 100644
--- a/meta/recipes-core/eglibc/eglibc-2.13/mips-rld-map-check.patch
+++ b/meta/recipes-core/eglibc/eglibc-2.13/mips-rld-map-check.patch
@@ -1,4 +1,3 @@
-Upstream-Status: Pending
 
 On mips target, binutils currently sets DT_MIPS_RLD_MAP to 0 in dynamic
 section if a --version-script sets _RLD_MAP to local. This is apparently
@@ -6,9 +5,10 @@ a binutils bug, but libc shouldn't segfault in this case.
 
 see also: http://sourceware.org/bugilla/show_bug.cgi?id=11615
 
+Upstream-Status: Pending
+
 9/19/2010 - added by Qing He <qing.he@intel.com>
 
-Upstream-Status: Pending
 
 ---
 diff -ru glibc-2.10.1.orig/ports/sysdeps/mips/dl-machine.h glibc-2.10.1/ports/sysdeps/mips/dl-machine.h
diff --git a/meta/recipes-core/eglibc/eglibc-2.13/shorten-build-commands.patch b/meta/recipes-core/eglibc/eglibc-2.13/shorten-build-commands.patch
index c17d58b..080568d 100644
--- a/meta/recipes-core/eglibc/eglibc-2.13/shorten-build-commands.patch
+++ b/meta/recipes-core/eglibc/eglibc-2.13/shorten-build-commands.patch
@@ -1,4 +1,3 @@
-Upstream-Status: Pending
 
 Source: http://sourceware.org/ml/libc-alpha/2010-03/msg00064.html
 
diff --git a/meta/recipes-core/glib-2.0/glib-2.0/0003-gatomic-proper-pointer-get-cast.patch.patch b/meta/recipes-core/glib-2.0/glib-2.0/0003-gatomic-proper-pointer-get-cast.patch.patch
index ad1ca12..5c0afbc 100644
--- a/meta/recipes-core/glib-2.0/glib-2.0/0003-gatomic-proper-pointer-get-cast.patch.patch
+++ b/meta/recipes-core/glib-2.0/glib-2.0/0003-gatomic-proper-pointer-get-cast.patch.patch
@@ -3,7 +3,7 @@ From: Koen Kooi <koen@dominion.thruhere.net>
 Date: Sat, 18 Jun 2011 23:51:35 +0200
 Subject: [PATCH 3/7] gatomic-proper-pointer-get-cast.patch
 
-Upstream-Status: Unknown
+Upstream-Status: Pending
 
 Signed-off-by: Koen Kooi <koen@dominion.thruhere.net>
 ---
diff --git a/meta/recipes-core/glib-2.0/glib-2.0/0005-glib-mkenums-interpreter.patch.patch b/meta/recipes-core/glib-2.0/glib-2.0/0005-glib-mkenums-interpreter.patch.patch
index 6780330..db9a799 100644
--- a/meta/recipes-core/glib-2.0/glib-2.0/0005-glib-mkenums-interpreter.patch.patch
+++ b/meta/recipes-core/glib-2.0/glib-2.0/0005-glib-mkenums-interpreter.patch.patch
@@ -3,7 +3,7 @@ From: Koen Kooi <koen@dominion.thruhere.net>
 Date: Sat, 18 Jun 2011 23:52:17 +0200
 Subject: [PATCH 5/7] don't leak buildpaths into perl hashbang
 
-Upstream-Status: Unknown
+Upstream-Status: Inappropriate [configuration]
 
 Signed-off-by: Koen Kooi <koen@dominion.thruhere.net>
 ---
diff --git a/meta/recipes-core/glibc/glibc-2.10.1/glibc-check_pf.patch b/meta/recipes-core/glibc/glibc-2.10.1/glibc-check_pf.patch
index dec0892..a0e55bf 100644
--- a/meta/recipes-core/glibc/glibc-2.10.1/glibc-check_pf.patch
+++ b/meta/recipes-core/glibc/glibc-2.10.1/glibc-check_pf.patch
@@ -1,5 +1,3 @@
-Upstream-Status: Pending
-
 From libc-ports-return-550-listarch-libc-ports=sources dot redhat dot com at sourceware dot org Tue Oct 31 17:37:21 2006
 Return-Path: <libc-ports-return-550-listarch-libc-ports=sources dot redhat dot com at sourceware dot org>
 Delivered-To: listarch-libc-ports at sources dot redhat dot com
diff --git a/meta/recipes-devtools/cdrtools/cdrtools-native/no_usr_src.patch b/meta/recipes-devtools/cdrtools/cdrtools-native/no_usr_src.patch
index 82e57d1..61df41f 100644
--- a/meta/recipes-devtools/cdrtools/cdrtools-native/no_usr_src.patch
+++ b/meta/recipes-devtools/cdrtools/cdrtools-native/no_usr_src.patch
@@ -1,7 +1,7 @@
 Remove hard-coded references to /usr/src/linux/include to avoid
 host contamination.
 
-Upstream-Status: [Other (build-system specific)]
+Upstream-Status: Inappropriate [configuration]
 
 Signed-off-by: Scott Garman <scott.a.garman@intel.com>
 
diff --git a/meta/recipes-devtools/elfutils/elfutils/mempcpy.patch b/meta/recipes-devtools/elfutils/elfutils/mempcpy.patch
index 218a57b..24e31fa 100644
--- a/meta/recipes-devtools/elfutils/elfutils/mempcpy.patch
+++ b/meta/recipes-devtools/elfutils/elfutils/mempcpy.patch
@@ -1,4 +1,3 @@
-Upstream-Status: Backport
 
 uclibc does not export __mempcpy like glibc so we alias it here.
 This patch may make sense for upstream but elfutils uses more
diff --git a/meta/recipes-devtools/makedevs/makedevs-1.0.0/COPYING.patch b/meta/recipes-devtools/makedevs/makedevs-1.0.0/COPYING.patch
index c63ab53..3a8902b 100644
--- a/meta/recipes-devtools/makedevs/makedevs-1.0.0/COPYING.patch
+++ b/meta/recipes-devtools/makedevs/makedevs-1.0.0/COPYING.patch
@@ -1,4 +1,4 @@
-Upstream-Status: Inapropriate [others]
+Upstream-Status: Inappropriate [licensing]
 
 diff -ruN makedevs-1.0.0-orig/COPYING makedevs-1.0.0/COPYING
 --- makedevs-1.0.0-orig/COPYING	1970-01-01 08:00:00.000000000 +0800
diff --git a/meta/recipes-devtools/qemu/qemu-0.14.0/qemugl-fix.patch b/meta/recipes-devtools/qemu/qemu-0.14.0/qemugl-fix.patch
index 76aae2f..0858f76 100644
--- a/meta/recipes-devtools/qemu/qemu-0.14.0/qemugl-fix.patch
+++ b/meta/recipes-devtools/qemu/qemu-0.14.0/qemugl-fix.patch
@@ -5,11 +5,10 @@ support 32/64b combination of target/host.
 
 This is not perfect fix, and we need consider other GL alternatives in future.
 
-Upstream-Status: other (logical part of qemu-git-qemugl-host.patch)
+Upstream-Status: Inappropriate [other] - depends on qemu gl patch
 
 Signed-off-by: Zhai Edwin <edwin.zhai@intel.com>
 
-Upstream-Status: Inappropriate [other] - depends on qemu gl patch
 
 Index: qemu-0.14.0/target-i386/opengl_func.h
 ===================================================================
diff --git a/meta/recipes-devtools/qemu/qemu-git/qemugl-fix.patch b/meta/recipes-devtools/qemu/qemu-git/qemugl-fix.patch
index 029aacf..0bfbf10 100644
--- a/meta/recipes-devtools/qemu/qemu-git/qemugl-fix.patch
+++ b/meta/recipes-devtools/qemu/qemu-git/qemugl-fix.patch
@@ -5,7 +5,7 @@ support 32/64b combination of target/host.
 
 This is not perfect fix, and we need consider other GL alternatives in future.
 
-Upstream-Status: other (logical part of qemu-git-qemugl-host.patch)
+Upstream-Status: Inappropriate [other (logical part of qemu-git-qemugl-host.patch)]
 
 Signed-off-by: Zhai Edwin <edwin.zhai@intel.com>
 
diff --git a/meta/recipes-extended/at/at-3.1.12/configure.patch b/meta/recipes-extended/at/at-3.1.12/configure.patch
index 99b4077..14310e3 100644
--- a/meta/recipes-extended/at/at-3.1.12/configure.patch
+++ b/meta/recipes-extended/at/at-3.1.12/configure.patch
@@ -1,4 +1,3 @@
-Upstream-Status: Inappropriate [licensing]
 
 Fix cross-compilation issues in configure.ac
 Derived from an OE patch for at-3.1.8
diff --git a/meta/recipes-extended/libtirpc/libtirpc-0.2.2/libtirpc-0.2.1-fortify.patch b/meta/recipes-extended/libtirpc/libtirpc-0.2.2/libtirpc-0.2.1-fortify.patch
index 32644b5..4a785d3 100644
--- a/meta/recipes-extended/libtirpc/libtirpc-0.2.2/libtirpc-0.2.1-fortify.patch
+++ b/meta/recipes-extended/libtirpc/libtirpc-0.2.2/libtirpc-0.2.1-fortify.patch
@@ -2,7 +2,7 @@ Fix a possible overflow (reported by _FORTIFY_SOURCE=2)
 
 Ported from Gentoo
 
-Upstream-Status: Unknown
+Upstream-Status: Pending
 
 Signed-off-by: Khem Raj <raj.khem@gmail.com>
 
diff --git a/meta/recipes-graphics/clutter/clutter-gst/autofoo-0.4.patch b/meta/recipes-graphics/clutter/clutter-gst/autofoo-0.4.patch
deleted file mode 100644
index e22d2db..0000000
--- a/meta/recipes-graphics/clutter/clutter-gst/autofoo-0.4.patch
+++ /dev/null
@@ -1,19 +0,0 @@
-Upstream-Status: Inappropriate [not used]
-
----
- doc/reference/Makefile.am |    2 +-
- examples/Makefile.am      |    2 +-
- 2 files changed, 2 insertions(+), 2 deletions(-)
-
-Upstream-Status: Inappropriate [configuration]
-
-Index: clutter-gst/examples/Makefile.am
-===================================================================
---- clutter-gst.orig/examples/Makefile.am	2007-11-06 12:31:36.000000000 +0000
-+++ clutter-gst/examples/Makefile.am	2007-11-06 18:53:59.000000000 +0000
-@@ -1,4 +1,4 @@
--noinst_PROGRAMS = video-player video-sink audio
-+bin_PROGRAMS = video-player video-sink audio
- 
- INCLUDES = -I$(top_srcdir)/
- 
diff --git a/meta/recipes-graphics/clutter/clutter-gst/autofoo-9db4a61a25677764bb927369c5c68ada958fb65c.patch b/meta/recipes-graphics/clutter/clutter-gst/autofoo-9db4a61a25677764bb927369c5c68ada958fb65c.patch
deleted file mode 100644
index 8b3d84d..0000000
--- a/meta/recipes-graphics/clutter/clutter-gst/autofoo-9db4a61a25677764bb927369c5c68ada958fb65c.patch
+++ /dev/null
@@ -1,29 +0,0 @@
-Upstream-Status: Inappropriate [not used]
-
----
- doc/reference/Makefile.am |    2 +-
- examples/Makefile.am      |    2 +-
- 2 files changed, 2 insertions(+), 2 deletions(-)
-
-Upstream-Status: Inappropriate [configuration]
-
-Index: clutter-gst/examples/Makefile.am
-===================================================================
---- clutter-gst.orig/examples/Makefile.am	2007-11-06 12:31:36.000000000 +0000
-+++ clutter-gst/examples/Makefile.am	2007-11-06 18:53:59.000000000 +0000
-@@ -1,4 +1,4 @@
--noinst_PROGRAMS = video-player video-sink audio
-+bin_PROGRAMS = video-player video-sink audio
- 
- INCLUDES = -I$(top_srcdir)/
- 
-Index: clutter-gst/doc/reference/Makefile.am
-===================================================================
---- clutter-gst.orig/doc/reference/Makefile.am	2007-11-06 19:36:56.000000000 +0000
-+++ clutter-gst/doc/reference/Makefile.am	2007-11-06 19:37:02.000000000 +0000
-@@ -77,4 +77,4 @@ include $(top_srcdir)/gtk-doc.make
- 
- # Other files to distribute
- # e.g. EXTRA_DIST += version.xml.in
--EXTRA_DIST += version.xml.in
-+EXTRA_DIST = version.xml.in
diff --git a/meta/recipes-graphics/clutter/clutter-gst/autofoo.patch b/meta/recipes-graphics/clutter/clutter-gst/autofoo.patch
deleted file mode 100644
index b557c6e..0000000
--- a/meta/recipes-graphics/clutter/clutter-gst/autofoo.patch
+++ /dev/null
@@ -1,31 +0,0 @@
-Upstream-Status: Inappropriate [not used]
-
----
- doc/reference/Makefile.am |    2 +-
- examples/Makefile.am      |    2 +-
- 2 files changed, 2 insertions(+), 2 deletions(-)
-
-Upstream-Status: Inappropriate [configuration]
-
-Index: git/examples/Makefile.am
-===================================================================
---- git.orig/examples/Makefile.am	2009-06-30 16:41:53.000000000 +0100
-+++ git/examples/Makefile.am	2009-06-30 16:43:00.000000000 +0100
-@@ -1,6 +1,6 @@
- NULL = #
- 
--noinst_PROGRAMS = video-player video-sink audio-player
-+bin_PROGRAMS = video-player video-sink audio-player
- 
- INCLUDES = -I$(top_srcdir) \
- 	   $(MAINTAINER_CFLAGS) \
-Index: git/doc/reference/Makefile.am
-===================================================================
---- git.orig/doc/reference/Makefile.am	2009-06-30 16:41:53.000000000 +0100
-+++ git/doc/reference/Makefile.am	2009-06-30 16:41:53.000000000 +0100
-@@ -77,4 +77,4 @@
- 
- # Other files to distribute
- # e.g. EXTRA_DIST += version.xml.in
--EXTRA_DIST += version.xml.in
-+EXTRA_DIST = version.xml.in
diff --git a/meta/recipes-qt/qt4/files/qt-dbus-const.patch b/meta/recipes-qt/qt4/files/qt-dbus-const.patch
index a856912..f3de77e 100644
--- a/meta/recipes-qt/qt4/files/qt-dbus-const.patch
+++ b/meta/recipes-qt/qt4/files/qt-dbus-const.patch
@@ -1,12 +1,13 @@
 Remove "const" usage that causes compile failure building qt4-tools-nativesdk
 
+Upstream-Status: Denied [possible retry]
+
 Patch has apparently been rejected upstream, not because it is invalid
 but because the submitter did not submit a merge request for it, so the
 validity of the patch upstream is uncertain. For further details see:
 http://bugreports.qt.nokia.com/browse/QTBUG-17962
 
 Original Author: Pavel Heimlich <tropikhajma at gmail.com>
-Upstream-Status: Rejected
 
 --- qt-everywhere-opensource-src-4.7.3/src/dbus/qdbusintegrator.cpp.orig	2011-03-12 02:11:32.313467991 +0100
 +++ qt-everywhere-opensource-src-4.7.3/src/dbus/qdbusintegrator.cpp	2011-03-12 02:11:03.795809176 +0100
-- 
1.7.3.4



