Return-Path: <paul.eggleton@linux.intel.com>
Received: from mga01.intel.com (mga01.intel.com [192.55.52.88])
	by mail.openembedded.org (Postfix) with ESMTP id 5F17A6B5D1
	for <openembedded-core@lists.openembedded.org>;
	Sat, 28 Dec 2013 22:29:55 +0000 (UTC)
Received: from fmsmga002.fm.intel.com ([10.253.24.26])
	by fmsmga101.fm.intel.com with ESMTP; 28 Dec 2013 14:29:56 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="4.95,567,1384329600"; d="scan'208";a="457009940"
Received: from unknown (HELO helios.ger.corp.intel.com) ([10.252.122.113])
	by fmsmga002.fm.intel.com with ESMTP; 28 Dec 2013 14:29:55 -0800
From: Paul Eggleton <paul.eggleton@linux.intel.com>
To: openembedded-core@lists.openembedded.org
Date: Sat, 28 Dec 2013 22:29:02 +0000
Message-Id: <55c6d0cdf25923470ee958fbf32d30081f43f28f.1388269205.git.paul.eggleton@linux.intel.com>
X-Mailer: git-send-email 1.8.1.2
In-Reply-To: <cover.1388269205.git.paul.eggleton@linux.intel.com>
References: <cover.1388269205.git.paul.eggleton@linux.intel.com>
In-Reply-To: <cover.1388269205.git.paul.eggleton@linux.intel.com>
References: <cover.1388269205.git.paul.eggleton@linux.intel.com>
Subject: [PATCH 06/38] Add missing SUMMARY values
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
X-List-Received-Date: Sat, 28 Dec 2013 22:29:55 -0000

These recipes all had a long DESCRIPTION but no SUMMARY; since the
SUMMARY is often displayed alone by package managers and the default
value ("${PN} version ${PV}-${PR}") isn't particularly useful, we should
always try to set SUMMARY.

Signed-off-by: Paul Eggleton <paul.eggleton@linux.intel.com>
---
 meta/recipes-connectivity/socat/socat_1.7.2.2.bb                      | 1 +
 meta/recipes-core/glib-networking/glib-networking_2.38.0.bb           | 1 +
 meta/recipes-core/meta/meta-ide-support.bb                            | 1 +
 meta/recipes-devtools/kconfig-frontends/kconfig-frontends_3.12.0.0.bb | 1 +
 meta/recipes-devtools/mklibs/mklibs-native_0.1.38.bb                  | 1 +
 meta/recipes-devtools/perl/liburi-perl_1.60.bb                        | 1 +
 meta/recipes-devtools/python/python-pyrex_0.9.9.bb                    | 1 +
 meta/recipes-devtools/vala/vala.inc                                   | 1 +
 meta/recipes-extended/hdparm/hdparm_9.43.bb                           | 1 +
 meta/recipes-gnome/libunique/libunique_1.1.6.bb                       | 1 +
 meta/recipes-graphics/directfb/directfb-examples_1.6.0.bb             | 1 +
 meta/recipes-graphics/glew/glew_1.10.0.bb                             | 1 +
 meta/recipes-kernel/kmod/kmod.inc                                     | 1 +
 meta/recipes-qt/qt-apps/fotowall_0.9.bb                               | 1 +
 meta/recipes-sato/rxvt-unicode/rxvt-unicode_9.19.bb                   | 1 +
 meta/recipes-support/libbsd/libbsd_0.6.0.bb                           | 1 +
 meta/recipes-support/libiconv/libiconv_1.11.1.bb                      | 1 +
 meta/recipes-support/libiconv/libiconv_1.14.bb                        | 1 +
 meta/recipes-support/libusb/libusb-compat_0.1.5.bb                    | 1 +
 meta/recipes-support/nss-myhostname/nss-myhostname_0.3.bb             | 1 +
 20 files changed, 20 insertions(+)

diff --git a/meta/recipes-connectivity/socat/socat_1.7.2.2.bb b/meta/recipes-connectivity/socat/socat_1.7.2.2.bb
index f015def..398caa3 100644
--- a/meta/recipes-connectivity/socat/socat_1.7.2.2.bb
+++ b/meta/recipes-connectivity/socat/socat_1.7.2.2.bb
@@ -1,3 +1,4 @@
+SUMMARY = "Multipurpose relay for bidirectional data transfer"
 DESCRIPTION = "Socat is a relay for bidirectional data \
 transfer between two independent data channels."
 HOMEPAGE = "http://www.dest-unreach.org/socat/"
diff --git a/meta/recipes-core/glib-networking/glib-networking_2.38.0.bb b/meta/recipes-core/glib-networking/glib-networking_2.38.0.bb
index ad9ad64..a9c1a41 100644
--- a/meta/recipes-core/glib-networking/glib-networking_2.38.0.bb
+++ b/meta/recipes-core/glib-networking/glib-networking_2.38.0.bb
@@ -1,3 +1,4 @@
+SUMMARY = "GLib networking extensions"
 DESCRIPTION = "glib-networking contains the implementations of certain GLib networking features that cannot be implemented directly in GLib itself because of their dependencies."
 HOMEPAGE = "http://git.gnome.org/browse/glib-networking/"
 BUGTRACKER = "http://bugzilla.gnome.org"
diff --git a/meta/recipes-core/meta/meta-ide-support.bb b/meta/recipes-core/meta/meta-ide-support.bb
index 130b1c9..516d52f 100644
--- a/meta/recipes-core/meta/meta-ide-support.bb
+++ b/meta/recipes-core/meta/meta-ide-support.bb
@@ -1,3 +1,4 @@
+SUMMARY = "Integrated Development Environment support"
 DESCRIPTION = "Meta package for ensuring the build directory contains all appropriate toolchain packages for using an IDE"
 LICENSE = "MIT"
 LIC_FILES_CHKSUM = "file://${COREBASE}/LICENSE;md5=3f40d7994397109285ec7b81fdeb3b58 \
diff --git a/meta/recipes-devtools/kconfig-frontends/kconfig-frontends_3.12.0.0.bb b/meta/recipes-devtools/kconfig-frontends/kconfig-frontends_3.12.0.0.bb
index f225af0..fa1da4e 100644
--- a/meta/recipes-devtools/kconfig-frontends/kconfig-frontends_3.12.0.0.bb
+++ b/meta/recipes-devtools/kconfig-frontends/kconfig-frontends_3.12.0.0.bb
@@ -1,6 +1,7 @@
 # Copyright (C) 2012 Khem Raj <raj.khem@gmail.com>
 # Released under the MIT license (see COPYING.MIT for the terms)
 
+SUMMARY = "Linux kernel style configuration framework for other projects"
 DESCRIPTION = "The kconfig-frontends project aims at centralising \
 the effort of keeping an up-to-date, out-of-tree, packaging of the \
 kconfig infrastructure, ready for use by third-party projects. \
diff --git a/meta/recipes-devtools/mklibs/mklibs-native_0.1.38.bb b/meta/recipes-devtools/mklibs/mklibs-native_0.1.38.bb
index 6367e8f..fd04c97 100644
--- a/meta/recipes-devtools/mklibs/mklibs-native_0.1.38.bb
+++ b/meta/recipes-devtools/mklibs/mklibs-native_0.1.38.bb
@@ -1,3 +1,4 @@
+SUMMARY = "Shared library optimisation tool"
 DESCRIPTION = "mklibs produces cut-down shared libraries that contain only the routines required by a particular set of executables."
 HOMEPAGE = "https://code.launchpad.net/mklibs"
 SECTION = "devel"
diff --git a/meta/recipes-devtools/perl/liburi-perl_1.60.bb b/meta/recipes-devtools/perl/liburi-perl_1.60.bb
index 21e838e..8809a44 100644
--- a/meta/recipes-devtools/perl/liburi-perl_1.60.bb
+++ b/meta/recipes-devtools/perl/liburi-perl_1.60.bb
@@ -1,3 +1,4 @@
+SUMMARY = "Perl module to manipulate and access URI strings"
 DESCRIPTION = "This package contains the URI.pm module with friends. \
 The module implements the URI class. URI objects can be used to access \
 and manipulate the various components that make up these strings."
diff --git a/meta/recipes-devtools/python/python-pyrex_0.9.9.bb b/meta/recipes-devtools/python/python-pyrex_0.9.9.bb
index 0ae35b0..c4dd2e6 100644
--- a/meta/recipes-devtools/python/python-pyrex_0.9.9.bb
+++ b/meta/recipes-devtools/python/python-pyrex_0.9.9.bb
@@ -1,3 +1,4 @@
+SUMMARY = "Language for writing Python extension modules"
 DESCRIPTION = "Pyrex is a language specially designed for writing Python extension modules. \
 It's designed to bridge the gap between the nice, high-level, easy-to-use world of Python \
 and the messy, low-level world of C."
diff --git a/meta/recipes-devtools/vala/vala.inc b/meta/recipes-devtools/vala/vala.inc
index a51ceb4..aa169f8 100644
--- a/meta/recipes-devtools/vala/vala.inc
+++ b/meta/recipes-devtools/vala/vala.inc
@@ -1,3 +1,4 @@
+SUMMARY = "C#-like programming language for easing GObject programming"
 DESCRIPTION = "Vala is a C#-like language dedicated to ease GObject programming. \
 Vala compiles to plain C and has no runtime environment nor penalities whatsoever."
 SECTION = "devel"
diff --git a/meta/recipes-extended/hdparm/hdparm_9.43.bb b/meta/recipes-extended/hdparm/hdparm_9.43.bb
index 2ba0c42..805f76a 100644
--- a/meta/recipes-extended/hdparm/hdparm_9.43.bb
+++ b/meta/recipes-extended/hdparm/hdparm_9.43.bb
@@ -1,3 +1,4 @@
+SUMMARY = "Utility for viewing/manipulating IDE disk drive/driver parameters"
 DESCRIPTION = "hdparm is a Linux shell utility for viewing \
 and manipulating various IDE drive and driver parameters."
 SECTION = "console/utils"
diff --git a/meta/recipes-gnome/libunique/libunique_1.1.6.bb b/meta/recipes-gnome/libunique/libunique_1.1.6.bb
index 31af658..c183689 100644
--- a/meta/recipes-gnome/libunique/libunique_1.1.6.bb
+++ b/meta/recipes-gnome/libunique/libunique_1.1.6.bb
@@ -1,3 +1,4 @@
+SUMMARY = "Library for supporting single instance GTK+ applications"
 DESCRIPTION = "Unique is a library for writing single instance application. If you launch a single instance application twice, the second instance will either just quit or will send a message to the running instance."
 HOMEPAGE = "http://live.gnome.org/LibUnique"
 BUGTRACKER = "https://bugzilla.gnome.org/enter_bug.cgi?product=libunique"
diff --git a/meta/recipes-graphics/directfb/directfb-examples_1.6.0.bb b/meta/recipes-graphics/directfb/directfb-examples_1.6.0.bb
index e303022..499060b 100644
--- a/meta/recipes-graphics/directfb/directfb-examples_1.6.0.bb
+++ b/meta/recipes-graphics/directfb/directfb-examples_1.6.0.bb
@@ -1,3 +1,4 @@
+SUMMARY = "Example DirectFB applications"
 DESCRIPTION = "The DirectFB-examples package contains a set of simple DirectFB \
       applications that can be used to test and demonstrate various DirectFB \
       features"
diff --git a/meta/recipes-graphics/glew/glew_1.10.0.bb b/meta/recipes-graphics/glew/glew_1.10.0.bb
index e5a63b4..de25069 100644
--- a/meta/recipes-graphics/glew/glew_1.10.0.bb
+++ b/meta/recipes-graphics/glew/glew_1.10.0.bb
@@ -1,3 +1,4 @@
+SUMMARY = "OpenGL extension loading library"
 DESCRIPTION = "The OpenGL Extension Wrangler Library (GLEW) is a cross-platform open-source C/C++ extension loading library."
 HOMEPAGE = "http://glew.sourceforge.net/"
 BUGTRACKER = "http://sourceforge.net/tracker/?group_id=67586"
diff --git a/meta/recipes-kernel/kmod/kmod.inc b/meta/recipes-kernel/kmod/kmod.inc
index f8d5bac..3eef69a 100644
--- a/meta/recipes-kernel/kmod/kmod.inc
+++ b/meta/recipes-kernel/kmod/kmod.inc
@@ -1,6 +1,7 @@
 # Copyright (C) 2012 Khem Raj <raj.khem@gmail.com>
 # Released under the MIT license (see COPYING.MIT for the terms)
 
+SUMMARY = "Tools for managing Linux kernel modules"
 DESCRIPTION = "kmod is a set of tools to handle common tasks with Linux kernel modules like \
                insert, remove, list, check properties, resolve dependencies and aliases."
 HOMEPAGE = "http://packages.profusion.mobi/kmod/"
diff --git a/meta/recipes-qt/qt-apps/fotowall_0.9.bb b/meta/recipes-qt/qt-apps/fotowall_0.9.bb
index 2e1fbaa..48dcc02 100644
--- a/meta/recipes-qt/qt-apps/fotowall_0.9.bb
+++ b/meta/recipes-qt/qt-apps/fotowall_0.9.bb
@@ -1,3 +1,4 @@
+SUMMARY = "Creative photo display application"
 DESCRIPTION = "Fotowall is a creative tool that allows you to layout your photos or pictures \
 in a personal way. You can add pictures, then resize, move, change colors, text, shadows, etc.."
 
diff --git a/meta/recipes-sato/rxvt-unicode/rxvt-unicode_9.19.bb b/meta/recipes-sato/rxvt-unicode/rxvt-unicode_9.19.bb
index c67adbb..72eca6d 100644
--- a/meta/recipes-sato/rxvt-unicode/rxvt-unicode_9.19.bb
+++ b/meta/recipes-sato/rxvt-unicode/rxvt-unicode_9.19.bb
@@ -1,4 +1,5 @@
 SECTION = "x11/utils"
+SUMMARY = "rxvt terminal clone supporting unicode"
 DESCRIPTION = "rxvt-unicode is a clone of the well known \
 terminal emulator rxvt, modified to store text in Unicode \
 (either UCS-2 or UCS-4) and to use locale-correct input and \
diff --git a/meta/recipes-support/libbsd/libbsd_0.6.0.bb b/meta/recipes-support/libbsd/libbsd_0.6.0.bb
index 771f322..70926bf 100644
--- a/meta/recipes-support/libbsd/libbsd_0.6.0.bb
+++ b/meta/recipes-support/libbsd/libbsd_0.6.0.bb
@@ -1,6 +1,7 @@
 # Copyright (C) 2013 Khem Raj <raj.khem@gmail.com>
 # Released under the MIT license (see COPYING.MIT for the terms)
 
+SUMMARY = "Library of utility functions from BSD systems"
 DESCRIPTION = "This library provides useful functions commonly found on BSD systems, \
                and lacking on others like GNU systems, thus making it easier to port \
                projects with strong BSD origins, without needing to embed the same \
diff --git a/meta/recipes-support/libiconv/libiconv_1.11.1.bb b/meta/recipes-support/libiconv/libiconv_1.11.1.bb
index dfcff0b..c52564a 100644
--- a/meta/recipes-support/libiconv/libiconv_1.11.1.bb
+++ b/meta/recipes-support/libiconv/libiconv_1.11.1.bb
@@ -1,3 +1,4 @@
+SUMMARY = "Character encoding support library"
 DESCRIPTION = "GNU libiconv - libiconv is for you if your application needs to support \
 multiple character encodings, but that support lacks from your system."
 HOMEPAGE = "http://www.gnu.org/software/libiconv"
diff --git a/meta/recipes-support/libiconv/libiconv_1.14.bb b/meta/recipes-support/libiconv/libiconv_1.14.bb
index 470900b..a670e2c 100644
--- a/meta/recipes-support/libiconv/libiconv_1.14.bb
+++ b/meta/recipes-support/libiconv/libiconv_1.14.bb
@@ -1,3 +1,4 @@
+SUMMARY = "Character encoding support library"
 DESCRIPTION = "GNU libiconv - libiconv is for you if your application needs to support \
 multiple character encodings, but that support lacks from your system."
 HOMEPAGE = "http://www.gnu.org/software/libiconv"
diff --git a/meta/recipes-support/libusb/libusb-compat_0.1.5.bb b/meta/recipes-support/libusb/libusb-compat_0.1.5.bb
index de93a36..c316511 100644
--- a/meta/recipes-support/libusb/libusb-compat_0.1.5.bb
+++ b/meta/recipes-support/libusb/libusb-compat_0.1.5.bb
@@ -1,3 +1,4 @@
+SUMMARY = "libusb-0.1 compatibility layer for libusb1"
 DESCRIPTION = "libusb-0.1 compatible layer for libusb1, a drop-in replacement \
 that aims to look, feel and behave exactly like libusb-0.1"
 HOMEPAGE = "http://www.libusb.org/"
diff --git a/meta/recipes-support/nss-myhostname/nss-myhostname_0.3.bb b/meta/recipes-support/nss-myhostname/nss-myhostname_0.3.bb
index d5ed084..540f223 100644
--- a/meta/recipes-support/nss-myhostname/nss-myhostname_0.3.bb
+++ b/meta/recipes-support/nss-myhostname/nss-myhostname_0.3.bb
@@ -1,3 +1,4 @@
+SUMMARY = "Name Service Switch module for resolving the local hostname"
 DESCRIPTION = "plugin for the GNU Name Service Switch (NSS) functionality of \
 the GNU C Library (glibc) providing host name resolution for the locally \
 configured system hostname as returned by gethostname(2)."
-- 
1.8.1.2


