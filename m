Return-Path: <crg7475@mailbox.org>
Received: from mout-p-202.mailbox.org (mout-p-202.mailbox.org [80.241.56.172])
	by mail.openembedded.org (Postfix) with ESMTP id 746D77FD9E
	for <openembedded-core@lists.openembedded.org>;
	Sun, 12 Jan 2020 14:00:20 +0000 (UTC)
Received: from smtp1.mailbox.org (smtp1.mailbox.org
	[IPv6:2001:67c:2050:105:465:1:1:0])
	(using TLSv1.2 with cipher ECDHE-RSA-CHACHA20-POLY1305 (256/256 bits))
	(No client certificate requested)
	by mout-p-202.mailbox.org (Postfix) with ESMTPS id 47wddw6wktzQlDQ
	for <openembedded-core@lists.openembedded.org>;
	Sun, 12 Jan 2020 15:00:20 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=mailbox.org; h=
	references:in-reply-to:message-id:date:date:subject:subject:from
	:from:received; s=mail20150812; t=1578837619; bh=/yUMbNr5csaHiAX
	aUP70RE0Vg/+Fj1rdPBprDBs1Oc8=; b=s2g6DGyjSfHht14mHMimrO+Biwwc5U6
	JLY+TPweLAlKzgBHwIFtYCqQ03IPcqcrfCWT0+V7DvoxWQeTIyF+TJlNd860GQDi
	Hn6HWGJ9bUPEm97gIohpQLETLvSUpJbpkUdMY/K6h/5m8hFGhpkswmhY01E3ZDFQ
	hjW8Xhl86M8dLhRg0naMfLYC5/NiNwzGecAoIbP0tXiccv1GHWxobT7/kq45miJy
	6pys0lyla5sHY4utm49hhrqbOQrmG6Rc9ihTZRTodbjUqpM0NmJSmGf4Artq3t3X
	1BJbZzpl36ojJBlvq9A6VD5g9W36w0q0hJ5qqnN/qMhlJIzK/CZ8+2Q==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=mailbox.org;
	s=mail20150812; t=1578837620;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	to:to:cc:in-reply-to:in-reply-to:references:references;
	bh=2ohAWeelLd31a0zKL9xgJFeo0ORH5bDfBfUirNiaeCM=;
	b=ep2sZ521UR41KQSGw8mFDiqQ4JaJxuZCUK1dEFo82BJFbOX34Y4drRz9Nhn/6DNv7Ge3am
	AEBxcni2CvjUO1p4z9SSzEnIwo3ugw/5VmjRTi1ZeOrEyZRCOHhQItFZMLwOkcrOX7kdmE
	CtYy+Yo6y6MD4Z11IoYDauK+faNsooNIetATdFaKfYjEQS9JLgjpDO0UizfMwbIZHjz5CG
	6PACguwwUWTSZjzFRVyCQppKh4P3et1bT/Fwvxly7UFHasYvUkkVAExALdNlqMLN74NRzr
	vDzu5WxLceY9J6q2i2PE8Qew+mrZexAdZvWtHXF89hvDD8+ZK8zald8IFVxhug==
X-Virus-Scanned: amavisd-new at heinlein-support.de
Received: from smtp1.mailbox.org ([80.241.60.240])
	by spamfilter02.heinlein-hosting.de (spamfilter02.heinlein-hosting.de
	[80.241.56.116]) (amavisd-new, port 10030) with ESMTP id PdB36l96xYvZ
	for <openembedded-core@lists.openembedded.org>;
	Sun, 12 Jan 2020 15:00:19 +0100 (CET)
From: Carlos Rafael Giani <crg7475@mailbox.org>
To: openembedded-core@lists.openembedded.org
Date: Sun, 12 Jan 2020 14:59:54 +0100
Message-Id: <20200112135954.23868-12-crg7475@mailbox.org>
In-Reply-To: <20200112135954.23868-1-crg7475@mailbox.org>
References: <20200112135954.23868-1-crg7475@mailbox.org>
Subject: [PATCH 12/12] gstreamer: Remove unused common files and patches
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
X-List-Received-Date: Sun, 12 Jan 2020 14:00:22 -0000

gst-plugins-package.inc gstreamer1.0-plugins.inc got replaced by
gstreamer1.0-plugins-packaging.inc and gstreamer1.0-plugins-common.inc,
respectively.

Signed-off-by: Carlos Rafael Giani <crg7475@mailbox.org>
---
 ...-prefix-pkgconfig-paths-with-PKG_CON.patch | 40 -----------
 .../files/add-a-target-to-compile-tests.patch | 69 -------------------
 .../gstreamer/files/gtk-doc-tweaks.patch      | 47 -------------
 .../gstreamer/files/run-ptest                 |  3 -
 .../gstreamer/gst-plugins-package.inc         | 56 ---------------
 .../gstreamer/gstreamer1.0-plugins.inc        | 41 -----------
 6 files changed, 256 deletions(-)
 delete mode 100644 meta/recipes-multimedia/gstreamer/files/0001-introspection.m4-prefix-pkgconfig-paths-with-PKG_CON.patch
 delete mode 100644 meta/recipes-multimedia/gstreamer/files/add-a-target-to-compile-tests.patch
 delete mode 100644 meta/recipes-multimedia/gstreamer/files/gtk-doc-tweaks.patch
 delete mode 100644 meta/recipes-multimedia/gstreamer/files/run-ptest
 delete mode 100644 meta/recipes-multimedia/gstreamer/gst-plugins-package.inc
 delete mode 100644 meta/recipes-multimedia/gstreamer/gstreamer1.0-plugins.inc

diff --git a/meta/recipes-multimedia/gstreamer/files/0001-introspection.m4-prefix-pkgconfig-paths-with-PKG_CON.patch b/meta/recipes-multimedia/gstreamer/files/0001-introspection.m4-prefix-pkgconfig-paths-with-PKG_CON.patch
deleted file mode 100644
index 1b7f115083..0000000000
--- a/meta/recipes-multimedia/gstreamer/files/0001-introspection.m4-prefix-pkgconfig-paths-with-PKG_CON.patch
+++ /dev/null
@@ -1,40 +0,0 @@
-From 2b0436f9a07773fae8c74df902d7024e8bfc3512 Mon Sep 17 00:00:00 2001
-From: Alexander Kanavin <alex.kanavin@gmail.com>
-Date: Tue, 24 Nov 2015 16:46:27 +0200
-Subject: [PATCH] introspection.m4: prefix pkgconfig paths with
- PKG_CONFIG_SYSROOT_DIR
-
-We can't use our tweaked introspection.m4 from gobject-introspection tarball
-because gstreamer also defines INTROSPECTION_INIT in its introspection.m4, which
-is later supplied to g-ir-scanner.
-
-Upstream-Status: Pending [review on oe-core list]
-Signed-off-by: Alexander Kanavin <alex.kanavin@gmail.com>
-
----
- common/m4/introspection.m4 | 8 ++++----
- 1 file changed, 4 insertions(+), 4 deletions(-)
-
-diff --git a/common/m4/introspection.m4 b/common/m4/introspection.m4
-index 162be57..933f979 100644
---- a/common/m4/introspection.m4
-+++ b/common/m4/introspection.m4
-@@ -54,14 +54,14 @@ m4_define([_GOBJECT_INTROSPECTION_CHECK_INTERNAL],
-     INTROSPECTION_GIRDIR=
-     INTROSPECTION_TYPELIBDIR=
-     if test "x$found_introspection" = "xyes"; then
--       INTROSPECTION_SCANNER=`$PKG_CONFIG --variable=g_ir_scanner gobject-introspection-1.0`
--       INTROSPECTION_COMPILER=`$PKG_CONFIG --variable=g_ir_compiler gobject-introspection-1.0`
--       INTROSPECTION_GENERATE=`$PKG_CONFIG --variable=g_ir_generate gobject-introspection-1.0`
-+       INTROSPECTION_SCANNER=$PKG_CONFIG_SYSROOT_DIR`$PKG_CONFIG --variable=g_ir_scanner gobject-introspection-1.0`
-+       INTROSPECTION_COMPILER=$PKG_CONFIG_SYSROOT_DIR`$PKG_CONFIG --variable=g_ir_compiler gobject-introspection-1.0`
-+       INTROSPECTION_GENERATE=$PKG_CONFIG_SYSROOT_DIR`$PKG_CONFIG --variable=g_ir_generate gobject-introspection-1.0`
-        INTROSPECTION_GIRDIR=`$PKG_CONFIG --variable=girdir gobject-introspection-1.0`
-        INTROSPECTION_TYPELIBDIR="$($PKG_CONFIG --variable=typelibdir gobject-introspection-1.0)"
-        INTROSPECTION_CFLAGS=`$PKG_CONFIG --cflags gobject-introspection-1.0`
-        INTROSPECTION_LIBS=`$PKG_CONFIG --libs gobject-introspection-1.0`
--       INTROSPECTION_MAKEFILE=`$PKG_CONFIG --variable=datadir gobject-introspection-1.0`/gobject-introspection-1.0/Makefile.introspection
-+       INTROSPECTION_MAKEFILE=$PKG_CONFIG_SYSROOT_DIR`$PKG_CONFIG --variable=datadir gobject-introspection-1.0`/gobject-introspection-1.0/Makefile.introspection
-        INTROSPECTION_INIT="extern void gst_init(gint*,gchar**); gst_init(NULL,NULL);"
-     fi
-     AC_SUBST(INTROSPECTION_SCANNER)
diff --git a/meta/recipes-multimedia/gstreamer/files/add-a-target-to-compile-tests.patch b/meta/recipes-multimedia/gstreamer/files/add-a-target-to-compile-tests.patch
deleted file mode 100644
index d02d869410..0000000000
--- a/meta/recipes-multimedia/gstreamer/files/add-a-target-to-compile-tests.patch
+++ /dev/null
@@ -1,69 +0,0 @@
-From d61414bc17cf2df019510c2908048c4cabf5cf09 Mon Sep 17 00:00:00 2001
-From: Anuj Mittal <anuj.mittal@intel.com>
-Date: Tue, 27 Feb 2018 09:27:01 +0800
-Subject: [PATCH] add targets for test installation
-
-Targets to make sure tests can be installed and then run on
-the target.
-
-Upstream-Status: Inappropriate [specific to oe setup]
-
-Signed-off-by: Anuj Mittal <anuj.mittal@intel.com>
-
----
- tests/check/Makefile.am | 27 ++++++++++++++++++++-------
- 1 file changed, 20 insertions(+), 7 deletions(-)
-
-diff --git a/tests/check/Makefile.am b/tests/check/Makefile.am
-index 13b916d..a66786d 100644
---- a/tests/check/Makefile.am
-+++ b/tests/check/Makefile.am
-@@ -8,11 +8,7 @@ REGISTRY_ENVIRONMENT = \
- 	GST_REGISTRY=$(CHECK_REGISTRY)
- 
- AM_TESTS_ENVIRONMENT += \
--        GST_STATE_IGNORE_ELEMENTS="$(STATE_IGNORE_ELEMENTS)"	\
--        $(REGISTRY_ENVIRONMENT)					\
--        GST_PLUGIN_SCANNER_1_0=$(top_builddir)/libs/gst/helpers/gst-plugin-scanner \
--        GST_PLUGIN_SYSTEM_PATH_1_0=					\
--        GST_PLUGIN_PATH_1_0=$(top_builddir)/plugins
-+        GST_STATE_IGNORE_ELEMENTS="$(STATE_IGNORE_ELEMENTS)"
- 
- plugindir = $(libdir)/gstreamer-@GST_API_VERSION@
- 
-@@ -178,6 +174,23 @@ noinst_PROGRAMS =
- 
- TESTS = $(check_PROGRAMS)
- 
-+install-ptest: $(TESTS)
-+	@$(INSTALL) -d $(DESTDIR)
-+	@for dir in `find -maxdepth 1 -type d`; do \
-+		if [ -x $$dir/.libs ]; then \
-+			$(INSTALL) -d $(DESTDIR)/$$dir; \
-+			$(INSTALL_PROGRAM) $$dir/.libs/* $(DESTDIR)/$$dir/; \
-+		fi \
-+	done
-+
-+runtests:
-+	@for b in $(TESTS); do \
-+		if [ -x $$b ]; then \
-+			$(AM_TESTS_ENVIRONMENT) $(SHELL) test-driver --test-name "$$b" \
-+			--log-file $$b.log --trs-file $$b.trs $$b; \
-+		fi \
-+	done
-+
- noinst_HEADERS = \
- 	gst/capslist.h \
- 	gst/struct_arm.h \
-@@ -221,9 +234,9 @@ gst_gstprintf_LDADD = \
- 	$(LDADD)
- 
- elements_fdsrc_CFLAGS=$(GST_OBJ_CFLAGS) $(AM_CFLAGS) \
--	-DTESTFILE=\"$(top_srcdir)/configure.ac\"
-+	-DTESTFILE=\"Makefile\"
- elements_filesrc_CFLAGS=$(GST_OBJ_CFLAGS) $(AM_CFLAGS) \
--	-DTESTFILE=\"$(top_srcdir)/configure.ac\"
-+	-DTESTFILE=\"Makefile\"
- 
- libs_controller_LDADD = \
- 	$(top_builddir)/libs/gst/controller/libgstcontroller-@GST_API_VERSION@.la \
diff --git a/meta/recipes-multimedia/gstreamer/files/gtk-doc-tweaks.patch b/meta/recipes-multimedia/gstreamer/files/gtk-doc-tweaks.patch
deleted file mode 100644
index d86c78d793..0000000000
--- a/meta/recipes-multimedia/gstreamer/files/gtk-doc-tweaks.patch
+++ /dev/null
@@ -1,47 +0,0 @@
-From 7018ca1c4bf26c8317e7fcd2e7e4e648195f42ca Mon Sep 17 00:00:00 2001
-From: Ross Burton <ross.burton@intel.com>
-Date: Wed, 20 Dec 2017 13:03:03 +0000
-Subject: [PATCH] gstreamer: use a patch instead of sed to fix gtk-doc
-
-Patch the gtk-doc makefiles so that the qemu wrapper is used to run transient
-binaries instead of libtool wrapper or running them directly.
-
-Also substitute a bogus plugin scanner, as trying to run the real one is causing
-issues during build on x86_64.
-
-Upstream-Status: Inappropriate
-Signed-off-by: Ross Burton <ross.burton@intel.com>
-
----
- common/gtk-doc.mak | 5 +++--
- 1 file changed, 3 insertions(+), 2 deletions(-)
-
-diff --git a/common/gtk-doc.mak b/common/gtk-doc.mak
-index 3f83491..e5cb0d1 100644
---- a/common/gtk-doc.mak
-+++ b/common/gtk-doc.mak
-@@ -6,11 +6,11 @@
- if GTK_DOC_USE_LIBTOOL
- GTKDOC_CC = $(LIBTOOL) --tag=CC --mode=compile $(CC) $(INCLUDES) $(GTKDOC_DEPS_CFLAGS) $(AM_CPPFLAGS) $(CPPFLAGS) $(AM_CFLAGS) $(CFLAGS)
- GTKDOC_LD = $(LIBTOOL) --tag=CC --mode=link $(CC) $(GTKDOC_DEPS_LIBS) $(AM_CFLAGS) $(CFLAGS) $(AM_LDFLAGS) $(LDFLAGS)
--GTKDOC_RUN = $(LIBTOOL) --mode=execute
-+GTKDOC_RUN = $(top_builddir)/gtkdoc-qemuwrapper
- else
- GTKDOC_CC = $(CC) $(INCLUDES) $(GTKDOC_DEPS_CFLAGS) $(AM_CPPFLAGS) $(CPPFLAGS) $(AM_CFLAGS) $(CFLAGS)
- GTKDOC_LD = $(CC) $(GTKDOC_DEPS_LIBS) $(AM_CFLAGS) $(CFLAGS) $(AM_LDFLAGS) $(LDFLAGS)
--GTKDOC_RUN =
-+GTKDOC_RUN = $(top_builddir)/gtkdoc-qemuwrapper
- endif
- 
- # We set GPATH here; this gives us semantics for GNU make
-@@ -101,6 +101,7 @@ scan-build.stamp: $(HFILE_GLOB) $(CFILE_GLOB)
- 	    GST_PLUGIN_PATH_1_0=					\
- 	    GST_REGISTRY_1_0=doc-registry.xml				\
- 	    $(GTKDOC_EXTRA_ENVIRONMENT)					\
-+	    GST_PLUGIN_SCANNER_1_0="$(top_builddir)/libs/gst/helpers/gst-plugin-scanner-dummy" \
- 	    CC="$(GTKDOC_CC)" LD="$(GTKDOC_LD)" RUN="$(GTKDOC_RUN)"	\
- 	    CFLAGS="$(GTKDOC_CFLAGS) $(CFLAGS)"				\
- 	    LDFLAGS="$(GTKDOC_LIBS) $(LDFLAGS)"				\
--- 
-2.15.1
-
diff --git a/meta/recipes-multimedia/gstreamer/files/run-ptest b/meta/recipes-multimedia/gstreamer/files/run-ptest
deleted file mode 100644
index 473d0b67a7..0000000000
--- a/meta/recipes-multimedia/gstreamer/files/run-ptest
+++ /dev/null
@@ -1,3 +0,0 @@
-#!/bin/sh
-
-make -k runtests
diff --git a/meta/recipes-multimedia/gstreamer/gst-plugins-package.inc b/meta/recipes-multimedia/gstreamer/gst-plugins-package.inc
deleted file mode 100644
index 6781e98c31..0000000000
--- a/meta/recipes-multimedia/gstreamer/gst-plugins-package.inc
+++ /dev/null
@@ -1,56 +0,0 @@
-PACKAGESPLITFUNCS_prepend = " split_gstreamer10_packages "
-PACKAGESPLITFUNCS_append = " set_metapkg_rdepends "
-
-python split_gstreamer10_packages () {
-    gst_libdir = d.expand('${libdir}/gstreamer-${LIBV}')
-    postinst = d.getVar('plugin_postinst')
-    glibdir = d.getVar('libdir')
-
-    do_split_packages(d, glibdir, r'^lib(.*)\.so\.*', 'lib%s', 'gstreamer %s library', extra_depends='', allow_links=True)
-    do_split_packages(d, gst_libdir, r'libgst(.*)\.so$', d.expand('${PN}-%s'), 'GStreamer plugin for %s', postinst=postinst, extra_depends='')
-    do_split_packages(d, glibdir+'/girepository-1.0', r'Gst(.*)-1.0\.typelib$', d.expand('${PN}-%s-typelib'), 'GStreamer typelib file for %s', postinst=postinst, extra_depends='')
-    do_split_packages(d, gst_libdir, r'libgst(.*)\.la$', d.expand('${PN}-%s-dev'), 'GStreamer plugin for %s (development files)', extra_depends='${PN}-dev')
-    do_split_packages(d, gst_libdir, r'libgst(.*)\.a$', d.expand('${PN}-%s-staticdev'), 'GStreamer plugin for %s (static development files)', extra_depends='${PN}-staticdev')
-}
-
-python set_metapkg_rdepends () {
-    import os
-    import oe.utils
-
-    pn = d.getVar('PN')
-    metapkg =  pn + '-meta'
-    d.setVar('ALLOW_EMPTY_' + metapkg, "1")
-    d.setVar('FILES_' + metapkg, "")
-    blacklist = [ pn, pn + '-meta' ]
-    metapkg_rdepends = []
-    pkgdest = d.getVar('PKGDEST')
-    for pkg in oe.utils.packages_filter_out_system(d):
-        if pkg not in blacklist and pkg not in metapkg_rdepends:
-            # See if the package is empty by looking at the contents of its PKGDEST subdirectory. 
-            # If this subdirectory is empty, then the package is.
-            # Empty packages do not get added to the meta package's RDEPENDS
-            pkgdir = os.path.join(pkgdest, pkg)
-            if os.path.exists(pkgdir):
-                dir_contents = os.listdir(pkgdir) or []
-            else:
-                dir_contents = []
-            is_empty = len(dir_contents) == 0
-            if not is_empty:
-                metapkg_rdepends.append(pkg)
-    d.setVar('RDEPENDS_' + metapkg, ' '.join(metapkg_rdepends))
-    d.setVar('DESCRIPTION_' + metapkg, pn + ' meta package')
-}
-
-# each plugin-dev depends on PN-dev, plugin-staticdev on PN-staticdev
-# so we need them even when empty (like in gst-plugins-good case)
-ALLOW_EMPTY_${PN} = "1"
-ALLOW_EMPTY_${PN}-dev = "1"
-ALLOW_EMPTY_${PN}-staticdev = "1"
-
-PACKAGES += "${PN}-apps ${PN}-meta ${PN}-glib"
-
-FILES_${PN} = ""
-FILES_${PN}-apps = "${bindir}"
-FILES_${PN}-glib = "${datadir}/glib-2.0"
-
-RRECOMMENDS_${PN} += "${PN}-meta"
diff --git a/meta/recipes-multimedia/gstreamer/gstreamer1.0-plugins.inc b/meta/recipes-multimedia/gstreamer/gstreamer1.0-plugins.inc
deleted file mode 100644
index bc24b05fec..0000000000
--- a/meta/recipes-multimedia/gstreamer/gstreamer1.0-plugins.inc
+++ /dev/null
@@ -1,41 +0,0 @@
-SUMMARY = "Plugins for the GStreamer multimedia framework 1.x"
-HOMEPAGE = "http://gstreamer.freedesktop.org/"
-BUGTRACKER = "https://bugzilla.gnome.org/enter_bug.cgi?product=Gstreamer"
-SECTION = "multimedia"
-
-DEPENDS = "gstreamer1.0 glib-2.0-native"
-
-SRC_URI_append = " file://gtk-doc-tweaks.patch"
-
-inherit autotools pkgconfig upstream-version-is-even gtk-doc
-
-acpaths = "-I ${S}/common/m4 -I ${S}/m4"
-
-LIBV = "1.0"
-require gst-plugins-package.inc
-
-# Orc enables runtime JIT compilation of data processing routines from Orc
-# bytecode to SIMD instructions for various architectures (currently SSE, MMX,
-# MIPS, Altivec and NEON are supported).
-
-GSTREAMER_ORC ?= "orc"
-
-PACKAGECONFIG[debug] = "--enable-debug,--disable-debug"
-PACKAGECONFIG[orc] = "--enable-orc,--disable-orc,orc orc-native"
-PACKAGECONFIG[valgrind] = "--enable-valgrind,--disable-valgrind,valgrind"
-
-export ORCC = "${STAGING_DIR_NATIVE}${bindir}/orcc"
-
-EXTRA_OECONF = " \
-    --disable-examples \
-"
-
-delete_pkg_m4_file() {
-	# This m4 file is out of date and is missing PKG_CONFIG_SYSROOT_PATH tweaks which we need for introspection
-	rm "${S}/common/m4/pkg.m4" || true
-	rm -f "${S}/common/m4/gtk-doc.m4"
-}
-
-do_configure[prefuncs] += " delete_pkg_m4_file"
-
-PACKAGES_DYNAMIC = "^${PN}-.*"
-- 
2.17.1


