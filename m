Return-Path: <liuyd.fnst@fujitsu.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 72312F33827
	for <webhook@archiver.kernel.org>; Tue, 17 Mar 2026 09:31:36 +0000 (UTC)
Received: from esa4.hc1455-7.c3s2.iphmx.com (esa4.hc1455-7.c3s2.iphmx.com [68.232.139.117])
 by mx.groups.io with SMTP id smtpd.msgproc01-g2.71775.1773739895516003132
 for <openembedded-core@lists.openembedded.org>;
 Tue, 17 Mar 2026 02:31:35 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@fujitsu.com header.s=fj2 header.b=nE4NLBBs;
 spf=pass (domain: fujitsu.com, ip: 68.232.139.117, mailfrom: liuyd.fnst@fujitsu.com)
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
  d=fujitsu.com; i=@fujitsu.com; q=dns/txt; s=fj2;
  t=1773739895; x=1805275895;
  h=from:to:subject:date:message-id:mime-version:
   content-transfer-encoding;
  bh=4zVYJ3SNflqQijwZpyjSCP077OJIzWBSr+Kl6H5nzss=;
  b=nE4NLBBsaH77YyT3d2jsP6CfVzABb3gRQlA430Zdxa3fuLQqE8ouYZrh
   +eqHncD5eXTZ39OAWHyPRyw5biOmd5CuD6b+t5BANcaDsqyXgewzgp8D9
   8GzL+2kj2zIXBk79T/QIQQRGR6XRyt+R45c3Jlb4nOzTdsKlnRwtMyOGc
   LNo22bIFDyOniGXldRooku7LKpDAUOwQIA6uyXKpK03mhDdAGaFmyOuQU
   Sj4P8U//wAGMLVTVmKm1k5LH7E3LhtUUGXkDSL0xl0B4Vn2Oauc0qefdM
   bZTfBBUH7lbIFCJE33ia8Fl2cI4PWajm2GJPVIOr7xphTcfYkK5299ypd
   A==;
X-CSE-ConnectionGUID: eJ/0KVnsTaKWYqdIGXwVkA==
X-CSE-MsgGUID: bvieLCavRl6c56A3VBAwlg==
X-IronPort-AV: E=McAfee;i="6800,10657,11731"; a="234276611"
X-IronPort-AV: E=Sophos;i="6.23,124,1770562800"; 
   d="scan'208";a="234276611"
Received: from gmgwuk01.global.fujitsu.com ([172.187.114.235])
  by esa4.hc1455-7.c3s2.iphmx.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 17 Mar 2026 18:31:33 +0900
Received: from az2uksmgm2.o.css.fujitsu.com (unknown [10.151.22.199])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by gmgwuk01.global.fujitsu.com (Postfix) with ESMTPS id D47AC1002BB8
	for <openembedded-core@lists.openembedded.org>; Tue, 17 Mar 2026 09:31:33 +0000 (UTC)
Received: from az2uksmom2.o.css.fujitsu.com (az2uksmom2.o.css.fujitsu.com [10.151.22.203])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by az2uksmgm2.o.css.fujitsu.com (Postfix) with ESMTPS id 897B518002CC
	for <openembedded-core@lists.openembedded.org>; Tue, 17 Mar 2026 09:31:33 +0000 (UTC)
Received: from G08FNSTD190101.g08.fujitsu.local (unknown [10.193.128.218])
	by az2uksmom2.o.css.fujitsu.com (Postfix) with ESMTP id 5BDF814000C2
	for <openembedded-core@lists.openembedded.org>; Tue, 17 Mar 2026 09:31:31 +0000 (UTC)
From: Liu Yiding <liuyd.fnst@fujitsu.com>
To: openembedded-core@lists.openembedded.org
Subject: [OE-core][PATCH] gtk-doc: upgrade 1.35.1 -> 1.36.0
Date: Tue, 17 Mar 2026 17:31:25 +0800
Message-ID: <20260317093125.10898-1-liuyd.fnst@fujitsu.com>
X-Mailer: git-send-email 2.43.0
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Tue, 17 Mar 2026 09:31:36 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/233308

1.Drop following patch as build systemd changes to meson
  0001-Do-not-error-out-if-xsltproc-is-not-found.patch
  conditionaltests.patch

2.Modify PACKAGECONFIG adapted for meson

3.Add sed for xsltproc to fix do_package_qa issue:
do_package_qa: QA Issue: File /usr/share/gtk-doc/python/gtkdoc/config_data.py in package gtk-doc contains reference to TMPDIR [buildpaths]

4.Remove sgml in package as it was not include in ${SYSROOT_DESTDIR}
FILES:${PN} += "${datadir}/sgml"

Signed-off-by: Liu Yiding <liuyd.fnst@fujitsu.com>
---
 ...t-error-out-if-xsltproc-is-not-found.patch | 28 -------------
 .../gtk-doc/files/conditionaltests.patch      | 42 -------------------
 .../{gtk-doc_1.35.1.bb => gtk-doc_1.36.0.bb}  | 26 ++++--------
 3 files changed, 8 insertions(+), 88 deletions(-)
 delete mode 100644 meta/recipes-gnome/gtk-doc/files/0001-Do-not-error-out-if-xsltproc-is-not-found.patch
 delete mode 100644 meta/recipes-gnome/gtk-doc/files/conditionaltests.patch
 rename meta/recipes-gnome/gtk-doc/{gtk-doc_1.35.1.bb => gtk-doc_1.36.0.bb} (70%)

diff --git a/meta/recipes-gnome/gtk-doc/files/0001-Do-not-error-out-if-xsltproc-is-not-found.patch b/meta/recipes-gnome/gtk-doc/files/0001-Do-not-error-out-if-xsltproc-is-not-found.patch
deleted file mode 100644
index 575ca5d32f..0000000000
--- a/meta/recipes-gnome/gtk-doc/files/0001-Do-not-error-out-if-xsltproc-is-not-found.patch
+++ /dev/null
@@ -1,28 +0,0 @@
-From 5d64ab3a7c18904231d611b1262d1289b7282930 Mon Sep 17 00:00:00 2001
-From: Alexander Kanavin <alex.kanavin@gmail.com>
-Date: Wed, 7 Sep 2016 14:52:04 +0300
-Subject: [PATCH] Do not error out if xsltproc is not found.
-
-This allows us to drop the hard xsltproc dependency, if we're not
-going to actually run the gtkdoc scripts (when api documentation is
-disabled).
-
-Upstream-Status: Inappropriate [oe-core specific]
-Signed-off-by: Alexander Kanavin <alex.kanavin@gmail.com>
----
- configure.ac | 2 +-
- 1 file changed, 1 insertion(+), 1 deletion(-)
-
-diff --git a/configure.ac b/configure.ac
-index f238de9..909771d 100644
---- a/configure.ac
-+++ b/configure.ac
-@@ -37,7 +37,7 @@ dnl Check for xsltproc
- dnl
- AC_PATH_PROG([XSLTPROC], [xsltproc])
- if test -z "$XSLTPROC"; then
--	AC_MSG_ERROR([xsltproc not found])
-+	AC_MSG_WARN([xsltproc not found])
- fi
- 
- dnl
diff --git a/meta/recipes-gnome/gtk-doc/files/conditionaltests.patch b/meta/recipes-gnome/gtk-doc/files/conditionaltests.patch
deleted file mode 100644
index 81017f61ce..0000000000
--- a/meta/recipes-gnome/gtk-doc/files/conditionaltests.patch
+++ /dev/null
@@ -1,42 +0,0 @@
-From e4d003318a87ff895b1fcdad1ba4ca3f4f730cf9 Mon Sep 17 00:00:00 2001
-From: Richard Purdie <richard.purdie@linuxfoundation.org>
-Date: Tue, 27 Jun 2017 21:00:58 +0100
-Subject: [PATCH] gtk-doc: Handle floating gtk-doc dependency
-
-Allow the tests to be explicitly disabled to avoid floating dependnecy
-issues. This is not really an issue with RSS but is on previous releases.
-
-RP 2017/6/27
-Upstream-Status: Pending
----
- configure.ac | 10 ++++++++++
- 1 file changed, 10 insertions(+)
-
-diff --git a/configure.ac b/configure.ac
-index 909771d..9db9fbc 100644
---- a/configure.ac
-+++ b/configure.ac
-@@ -82,6 +82,11 @@ if test "x$GCC" = "xyes"; then
- 	fi
- fi
- 
-+AC_ARG_ENABLE([tests],
-+	AS_HELP_STRING([--enable-tests],
-+	[enable tests (default=yes)]),,
-+	[enable_tests="yes"])
-+
- dnl if glib is available we can enable the tests
- PKG_CHECK_MODULES(TEST_DEPS, [glib-2.0 >= 2.6.0 gobject-2.0 >= 2.6.0],
- 	[	glib_prefix="`$PKG_CONFIG --variable=prefix glib-2.0`"
-@@ -92,6 +97,11 @@ PKG_CHECK_MODULES(TEST_DEPS, [glib-2.0 >= 2.6.0 gobject-2.0 >= 2.6.0],
- 		build_tests="no"
- 	]
- )
-+if test "x$enable_tests" != "xyes"; then
-+	gtk_doc_use_libtool="no"
-+	build_tests="no"
-+fi
-+
- AM_CONDITIONAL(GTK_DOC_USE_LIBTOOL, test -n "$LIBTOOL" -a x$gtk_doc_use_libtool = xyes )
- dnl this enables the rule in test/Makefile.am
- AM_CONDITIONAL(BUILD_TESTS, test x$build_tests = xyes)
diff --git a/meta/recipes-gnome/gtk-doc/gtk-doc_1.35.1.bb b/meta/recipes-gnome/gtk-doc/gtk-doc_1.36.0.bb
similarity index 70%
rename from meta/recipes-gnome/gtk-doc/gtk-doc_1.35.1.bb
rename to meta/recipes-gnome/gtk-doc/gtk-doc_1.36.0.bb
index c9ab7ff1e9..2d39ba6963 100644
--- a/meta/recipes-gnome/gtk-doc/gtk-doc_1.35.1.bb
+++ b/meta/recipes-gnome/gtk-doc/gtk-doc_1.36.0.bb
@@ -5,54 +5,44 @@ HOMEPAGE = "https://www.gtk.org/docs/"
 LICENSE = "GPL-2.0-only"
 LIC_FILES_CHKSUM = "file://COPYING;md5=94d55d512a9ba36caa9b7df079bae19f"
 
-GNOMEBASEBUILDCLASS = "autotools"
+GNOMEBASEBUILDCLASS = "meson"
 inherit gnomebase
 
 # Configure the scripts correctly (and build their dependencies) only if they are actually
 # going to be used; otheriwse we need only the m4/makefile includes from the gtk-doc tarball.
 PACKAGECONFIG ??= "${@bb.utils.contains("DISTRO_FEATURES", "api-documentation", "working-scripts", "", d)}"
+DEPENDS += "itstool-native libxslt-native python3-pygments-native gettext-native"
 
 # This will cause target gtk-doc to hardcode paths of native dependencies
 # into its scripts. This means that target gtk-doc package is broken;
 # hopefully no one minds because its scripts are not used for anything during build
 # and shouldn't be used on targets.
-PACKAGECONFIG[working-scripts] = ",,libxslt-native docbook-xml-dtd4-native docbook-xsl-stylesheets python3-pygments"
-PACKAGECONFIG[tests] = "--enable-tests,--disable-tests,glib-2.0"
+PACKAGECONFIG[working-scripts] = ",,docbook-xml-dtd4-native docbook-xsl-stylesheets"
+PACKAGECONFIG[tests] = "-Dtests=true,-Dtests=false,glib-2.0"
 
-CACHED_CONFIGUREVARS += "ac_cv_path_XSLTPROC=xsltproc"
-
-SRC_URI[archive.sha256sum] = "611c9f24edd6d88a8ae9a79d73ab0dc63c89b81e90ecc31d6b9005c5f05b25e2"
+SRC_URI[archive.sha256sum] = "3b84bac36efbe59017469040dfee58f17cf0853b5f54dfae26347daf55b6d337"
 SRC_URI += "file://0001-Do-not-hardocode-paths-to-perl-python-in-scripts.patch \
-           file://0001-Do-not-error-out-if-xsltproc-is-not-found.patch \
-           file://conditionaltests.patch \
            file://no-clobber.patch \
            "
 SRC_URI:append:class-native = " file://pkg-config-native.patch"
 
 BBCLASSEXTEND = "native nativesdk"
 
-# Do not check for XML catalogs when building because that
-# information is not used for anything during build. Recipe
-# dependencies make sure we have all the right bits.
-do_configure:prepend() {
-        sed -i -e 's,^JH_CHECK_XML_CATALOG.*,,' ${S}/configure.ac
-}
-
 do_install:append () {
-    # configure values for python3 and pkg-config encoded in scripts
+    # configure values for python3 xsltproc and pkg-config encoded in scripts
     for fn in ${bindir}/gtkdoc-depscan \
         ${bindir}/gtkdoc-mkhtml2 \
         ${datadir}/gtk-doc/python/gtkdoc/config_data.py \
         ${datadir}/gtk-doc/python/gtkdoc/config.py; do
         sed -e 's,${RECIPE_SYSROOT_NATIVE}/usr/bin/pkg-config,${bindir}/pkg-config,' \
+            -e 's,${RECIPE_SYSROOT_NATIVE}/usr/bin/xsltproc,${bindir}/xsltproc,' \
             -e 's,${HOSTTOOLS_DIR}/python3,${bindir}/python3,' \
             -e '1s|^#!.*|#!/usr/bin/env python3|' \
             -i ${D}$fn
     done
 }
 
-FILES:${PN} += "${datadir}/sgml"
-FILES:${PN}-doc = ""
+FILES:${PN}-doc = "${datadir}/help"
 
 SYSROOT_PREPROCESS_FUNCS:append:class-native = " gtkdoc_makefiles_sysroot_preprocess"
 gtkdoc_makefiles_sysroot_preprocess() {
-- 
2.43.0


