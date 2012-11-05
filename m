Received: from mga06.intel.com ([134.134.136.21] helo=orsmga101.jf.intel.com)
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <ross.burton@intel.com>) id 1TVPgT-0000Ro-94
	for openembedded-core@lists.openembedded.org;
	Mon, 05 Nov 2012 17:37:57 +0100
Received: from mail-fa0-f69.google.com ([209.85.161.69])
	by mga02.intel.com with ESMTP/TLS/RC4-SHA; 05 Nov 2012 08:24:10 -0800
Received: by mail-fa0-f69.google.com with SMTP id t1so5425511fae.0
	for <openembedded-core@lists.openembedded.org>;
	Mon, 05 Nov 2012 08:24:09 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=google.com; s=20120113;
	h=from:to:subject:date:message-id:x-mailer:in-reply-to:references
	:x-gm-message-state;
	bh=z67bLGcaepzwLSNC8FKNgNg84XTCDlPHUOqi5Cn3ehQ=;
	b=np6YS73PrXGy/bLso173hible351Chi6acyMKL/4wToMZEgyqGeWUFBOJPF8Uxcpm/
	hUw1fXczONDzB/SJ9XwPeBz9qsksz3x7t5LdCrNMcNj9KJrm1apspWooKk+cwDhRXkJ0
	O9g+ov5W7TFXIF8WVE9lHWv7BzBDJZKYNMZFwYkgkY+rjO7Zeh9+yZP32lzZq1SJkeVL
	rdEthc7Oaiknqi3UMmv2+qBZMvrEnNeSvh211gETu/UmveegQNQyXV7BNcDhPWm2JfLu
	fW4zBpLAnCGEZjA3m9Gm9mRje+k1K6lqOwZffUykL+P/j01JyZq2njOo0IQK+EHxNUoo
	rthQ==
Received: by 10.180.90.201 with SMTP id by9mr14211805wib.5.1352132648987;
	Mon, 05 Nov 2012 08:24:08 -0800 (PST)
Received: by 10.180.90.201 with SMTP id by9mr14211789wib.5.1352132648744;
	Mon, 05 Nov 2012 08:24:08 -0800 (PST)
Received: from melchett.burtonini.com (35.106.2.81.in-addr.arpa. [81.2.106.35])
	by mx.google.com with ESMTPS id ey2sm12345074wib.9.2012.11.05.08.24.07
	(version=TLSv1/SSLv3 cipher=OTHER);
	Mon, 05 Nov 2012 08:24:08 -0800 (PST)
From: Ross Burton <ross.burton@intel.com>
To: openembedded-core@lists.openembedded.org
Date: Mon,  5 Nov 2012 16:22:48 +0000
Message-Id: <1352132568-6476-2-git-send-email-ross.burton@intel.com>
X-Mailer: git-send-email 1.7.10
In-Reply-To: <1352132568-6476-1-git-send-email-ross.burton@intel.com>
References: <1352132568-6476-1-git-send-email-ross.burton@intel.com>
X-Gm-Message-State: ALoCoQktvOJmp5VpcRFIZ3V5/dfNj+7WgrXCANzObygR0PVYKx93z4tNrvdR5cLx8ohkV1ZvKpj52ypR8DIqjHPYlTqezuKk0lL9tjdTsIxJnsd3IKdmrWvDMNt0Hd31kgNwEiQXNR+hk0yZ4XjZdjO/zohvbQXFoauQP1g7Ia1HKo3xuAS9eHb1RYsMWScaN2/pfZwibNI+
Subject: [PATCH 2/2] glib-2.0: upgrade to latest stable, 2.34.1.
X-BeenThere: openembedded-core@lists.openembedded.org
X-Mailman-Version: 2.1.11
Precedence: list
List-Id: Patches and discussions about the oe-core layer
	<openembedded-core.lists.openembedded.org>
List-Unsubscribe: <http://lists.linuxtogo.org/cgi-bin/mailman/options/openembedded-core>,
	<mailto:openembedded-core-request@lists.openembedded.org?subject=unsubscribe>
List-Archive: <http://lists.linuxtogo.org/pipermail/openembedded-core>
List-Post: <mailto:openembedded-core@lists.openembedded.org>
List-Help: <mailto:openembedded-core-request@lists.openembedded.org?subject=help>
List-Subscribe: <http://lists.linuxtogo.org/cgi-bin/mailman/listinfo/openembedded-core>,
	<mailto:openembedded-core-request@lists.openembedded.org?subject=subscribe>
X-List-Received-Date: Mon, 05 Nov 2012 16:37:58 -0000

Also explicitly disable the test suite (as we can't run it), subsequently
dropping 60_wait-longer-for-threads-to-die.patch and nodbus.patch.

nolibelf.patch has been merged upstream, drop.

Upstream has dropped the pre-generated man pages, to generate them again we'd
need libxslt and the DocBook infrastructure.  We can live without the man pages
as those build-dependencies are non-trivial.

Signed-off-by: Ross Burton <ross.burton@intel.com>
---
 .../60_wait-longer-for-threads-to-die.patch        |   33 ---------------
 meta/recipes-core/glib-2.0/glib-2.0/nodbus.patch   |   25 ------------
 meta/recipes-core/glib-2.0/glib-2.0/nolibelf.patch |   40 ------------------
 meta/recipes-core/glib-2.0/glib-2.0_2.32.4.bb      |   43 --------------------
 meta/recipes-core/glib-2.0/glib-2.0_2.34.1.bb      |   39 ++++++++++++++++++
 meta/recipes-core/glib-2.0/glib.inc                |    2 +-
 6 files changed, 40 insertions(+), 142 deletions(-)
 delete mode 100644 meta/recipes-core/glib-2.0/glib-2.0/60_wait-longer-for-threads-to-die.patch
 delete mode 100644 meta/recipes-core/glib-2.0/glib-2.0/nodbus.patch
 delete mode 100644 meta/recipes-core/glib-2.0/glib-2.0/nolibelf.patch
 delete mode 100644 meta/recipes-core/glib-2.0/glib-2.0_2.32.4.bb
 create mode 100644 meta/recipes-core/glib-2.0/glib-2.0_2.34.1.bb

diff --git a/meta/recipes-core/glib-2.0/glib-2.0/60_wait-longer-for-threads-to-die.patch b/meta/recipes-core/glib-2.0/glib-2.0/60_wait-longer-for-threads-to-die.patch
deleted file mode 100644
index 4ff7b80..0000000
--- a/meta/recipes-core/glib-2.0/glib-2.0/60_wait-longer-for-threads-to-die.patch
+++ /dev/null
@@ -1,33 +0,0 @@
-copy from OE, said to borrow from Ubuntu. Not in glib-2.0 upstream yet. Add for sanity.
-Added to poky by Kevin Tian <kevin.tian@intel.com>, 06/25/2010
-Rebased for glib-2.27.3 by Dongxiao Xu <dongxiao.xu@intel.com>, 11/16/2010
-
-Upstream-Status: Inappropriate [patches for test code]
-
-diff -ruN glib-2.30.0-orig/tests/threadpool-test.c glib-2.30.0/tests/threadpool-test.c
---- glib-2.30.0-orig/tests/threadpool-test.c	2009-04-01 07:04:21.000000000 +0800
-+++ glib-2.30.0/tests/threadpool-test.c	2010-11-16 12:28:09.002172678 +0800
-@@ -5,8 +5,8 @@
- 
- #include <glib.h>
- 
--#define DEBUG_MSG(x)
--/* #define DEBUG_MSG(args) g_printerr args ; g_printerr ("\n");  */
-+/* #define DEBUG_MSG(x) */
-+#define DEBUG_MSG(args) g_printerr args ; g_printerr ("\n");
- 
- #define WAIT                5    /* seconds */
- #define MAX_THREADS         10
-@@ -130,10 +130,10 @@
-            test_count_threads () == 0)
-          break;
- 
--       DEBUG_MSG (("[unused] waiting ONE second for threads to die"));
-+       DEBUG_MSG (("[unused] waiting FIVE second for threads to die"));
- 
-        /* Some time for threads to die. */
--       g_usleep (G_USEC_PER_SEC);
-+       g_usleep (5 * G_USEC_PER_SEC);
-      }
- 
-    DEBUG_MSG (("[unused] stopped idle threads, %d remain, %d threads still exist",
diff --git a/meta/recipes-core/glib-2.0/glib-2.0/nodbus.patch b/meta/recipes-core/glib-2.0/glib-2.0/nodbus.patch
deleted file mode 100644
index 1e65643..0000000
--- a/meta/recipes-core/glib-2.0/glib-2.0/nodbus.patch
+++ /dev/null
@@ -1,25 +0,0 @@
-Disable dbus dependency. Autodetecting isn't deterministic, we don't have the DEPENDS
-and we don't want to built this piece so hardcode it off.
-
-Upstream-Status: Inappropriate [configuration]
-
-RP 2012/2/25
-
-Index: glib-2.30.2/configure.ac
-===================================================================
---- glib-2.30.2.orig/configure.ac	2012-02-25 14:50:07.444242397 +0000
-+++ glib-2.30.2/configure.ac	2012-02-25 14:51:28.096240485 +0000
-@@ -3769,10 +3769,9 @@
- # Check for libdbus1 - Optional - is only used in the GDBus test cases
- #
- # 1.2.14 required for dbus_message_set_serial
--PKG_CHECK_MODULES(DBUS1,
--                  dbus-1 >= 1.2.14,
--                  [AC_DEFINE(HAVE_DBUS1, 1, [Define if dbus-1 is available]) have_dbus1=yes],
--                  have_dbus1=no)
-+DBUS1_CFLAGS=
-+DBUS1_LIBS=
-+$have_dbus1=no      
- AC_SUBST(DBUS1_CFLAGS)
- AC_SUBST(DBUS1_LIBS)
- AM_CONDITIONAL(HAVE_DBUS1, [test "x$have_dbus1" = "xyes"])
diff --git a/meta/recipes-core/glib-2.0/glib-2.0/nolibelf.patch b/meta/recipes-core/glib-2.0/glib-2.0/nolibelf.patch
deleted file mode 100644
index d310041..0000000
--- a/meta/recipes-core/glib-2.0/glib-2.0/nolibelf.patch
+++ /dev/null
@@ -1,40 +0,0 @@
-From e1252cbf65001487ff3b94bbc141acacf6e528b6 Mon Sep 17 00:00:00 2001
-From: Martin Jansa <Martin.Jansa@gmail.com>
-Date: Wed, 16 May 2012 20:03:34 +0200
-Subject: [PATCH] configure: add option to disable libelf support
-
-Upstream-Status: Backport 
-Applied in master
-http://git.gnome.org/browse/glib/commit/?id=9e1d4da14d8e69fb60da1a9733ac1d58d0dcd8b2
-can be dropped when upgrading to 2.34.* or newer
-
-Signed-off-by: Martin Jansa <Martin.Jansa@gmail.com>
----
- configure.ac |    4 ++++
- 1 files changed, 4 insertions(+), 0 deletions(-)
-
-diff --git a/configure.ac b/configure.ac
-index ed4c10e..210df90 100644
---- a/configure.ac
-+++ b/configure.ac
-@@ -1815,6 +1815,9 @@ AC_SUBST(XATTR_LIBS)
- dnl ************************
- dnl *** check for libelf ***
- dnl ************************
-+AC_ARG_ENABLE(libelf,
-+              AC_HELP_STRING([--disable-libelf], [build without libelf support]))
-+if test "x$enable_libelf" != "xno"; then
- 
- PKG_CHECK_MODULES([LIBELF], [libelf >= 0.8.12], [have_libelf=yes], [have_libelf=maybe])
- 
-@@ -1835,6 +1838,7 @@ fi
- if test $have_libelf = yes; then
-   AC_DEFINE(HAVE_LIBELF, 1, [Define if libelf is available])
- fi
-+fi
- 
- dnl ****************************************
- dnl *** platform dependent source checks ***
--- 
-1.7.8.6
-
diff --git a/meta/recipes-core/glib-2.0/glib-2.0_2.32.4.bb b/meta/recipes-core/glib-2.0/glib-2.0_2.32.4.bb
deleted file mode 100644
index 22c6c7b..0000000
--- a/meta/recipes-core/glib-2.0/glib-2.0_2.32.4.bb
+++ /dev/null
@@ -1,43 +0,0 @@
-require glib.inc
-
-PR = "r6"
-PE = "1"
-
-DEPENDS += "libffi python-argparse-native zlib"
-DEPENDS_class-native += "libffi-native python-argparse-native"
-DEPENDS_class-nativesdk += "nativesdk-libffi python-argparse-native nativesdk-zlib ${BPN}-native"
-
-SHRT_VER = "${@d.getVar('PV',1).split('.')[0]}.${@d.getVar('PV',1).split('.')[1]}"
-
-SRC_URI = "${GNOME_MIRROR}/glib/${SHRT_VER}/glib-${PV}.tar.xz \
-           file://configure-libtool.patch \
-           file://60_wait-longer-for-threads-to-die.patch \
-           file://glib-2.0_fix_for_x32.patch \
-           file://nodbus.patch \
-           file://nolibelf.patch \
-          "
-SRC_URI[md5sum] = "bf84fefd9c1a5b5a7a38736f4ddd674a"
-SRC_URI[sha256sum] = "a5d742a4fda22fb6975a8c0cfcd2499dd1c809b8afd4ef709bda4d11b167fae2"
-
-SRC_URI_append_class-native = " file://glib-gettextize-dir.patch"
-BBCLASSEXTEND = "native nativesdk"
-
-do_configure_prepend() {
-	sed -i -e "s:TEST_PROGS += gdbus-serialization::g"  ${S}/gio/tests/Makefile.am
-	sed -i -e '1s,#!.*,#!${USRBINPATH}/env python,' ${S}/gio/gdbus-2.0/codegen/gdbus-codegen.in
-}
-
-do_install_append() {
-  # remove some unpackaged files
-  rm -f ${D}${libdir}/gdbus-2.0/codegen/*.pyc
-  rm -f ${D}${libdir}/gdbus-2.0/codegen/*.pyo
-  # and empty dirs
-  rmdir ${D}${libdir}/gio/modules/
-  rmdir ${D}${libdir}/gio/
-
-  # Some distros have both /bin/perl and /usr/bin/perl, but we set perl location
-  # for target as /usr/bin/perl, so fix it to /usr/bin/perl.
-  if [ -f ${D}${bindir}/glib-mkenums ]; then
-    sed -i -e '1s,#!.*perl,#! ${USRBINPATH}/env perl,' ${D}${bindir}/glib-mkenums
-  fi
-}
diff --git a/meta/recipes-core/glib-2.0/glib-2.0_2.34.1.bb b/meta/recipes-core/glib-2.0/glib-2.0_2.34.1.bb
new file mode 100644
index 0000000..18a155d
--- /dev/null
+++ b/meta/recipes-core/glib-2.0/glib-2.0_2.34.1.bb
@@ -0,0 +1,39 @@
+require glib.inc
+
+PR = "r0"
+PE = "1"
+
+DEPENDS += "libffi python-argparse-native zlib"
+DEPENDS_class-native += "libffi-native python-argparse-native"
+DEPENDS_class-nativesdk += "nativesdk-libffi python-argparse-native nativesdk-zlib ${BPN}-native"
+
+SHRT_VER = "${@d.getVar('PV',1).split('.')[0]}.${@d.getVar('PV',1).split('.')[1]}"
+
+SRC_URI = "${GNOME_MIRROR}/glib/${SHRT_VER}/glib-${PV}.tar.xz \
+           file://configure-libtool.patch \
+           file://glib-2.0_fix_for_x32.patch \
+          "
+SRC_URI[md5sum] = "ee779493b083be9348a841e0a51f1b27"
+SRC_URI[sha256sum] = "6e84dc9d84b104725b34d255421ed7ac3629e49f437d37addde5ce3891c2e2f1"
+
+SRC_URI_append_class-native = " file://glib-gettextize-dir.patch"
+BBCLASSEXTEND = "native nativesdk"
+
+do_configure_prepend() {
+	sed -i -e '1s,#!.*,#!${USRBINPATH}/env python,' ${S}/gio/gdbus-2.0/codegen/gdbus-codegen.in
+}
+
+do_install_append() {
+  # remove some unpackaged files
+  rm -f ${D}${libdir}/gdbus-2.0/codegen/*.pyc
+  rm -f ${D}${libdir}/gdbus-2.0/codegen/*.pyo
+  # and empty dirs
+  rmdir ${D}${libdir}/gio/modules/
+  rmdir ${D}${libdir}/gio/
+
+  # Some distros have both /bin/perl and /usr/bin/perl, but we set perl location
+  # for target as /usr/bin/perl, so fix it to /usr/bin/perl.
+  if [ -f ${D}${bindir}/glib-mkenums ]; then
+    sed -i -e '1s,#!.*perl,#! ${USRBINPATH}/env perl,' ${D}${bindir}/glib-mkenums
+  fi
+}
diff --git a/meta/recipes-core/glib-2.0/glib.inc b/meta/recipes-core/glib-2.0/glib.inc
index 586e45a..ed9bed9 100644
--- a/meta/recipes-core/glib-2.0/glib.inc
+++ b/meta/recipes-core/glib-2.0/glib.inc
@@ -25,7 +25,7 @@ inherit autotools gettext gtk-doc pkgconfig
 
 S = "${WORKDIR}/glib-${PV}"
 
-CORECONF = "--disable-dtrace --disable-fam --disable-libelf --disable-systemtap"
+CORECONF = "--disable-dtrace --disable-fam --disable-libelf --disable-systemtap --disable-modular-tests"
 
 EXTRA_OECONF = "--enable-included-printf=no ${CORECONF}"
 EXTRA_OECONF_class-native = "${CORECONF}"
-- 
1.7.10



