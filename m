Received: from mga09.intel.com ([134.134.136.24])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <ross.burton@intel.com>) id 1Tkdmm-0007KP-EL
	for openembedded-core@lists.openembedded.org;
	Mon, 17 Dec 2012 17:43:28 +0100
Received: from mail-ea0-f197.google.com ([209.85.215.197])
	by mga09.intel.com with ESMTP/TLS/RC4-SHA; 17 Dec 2012 08:27:50 -0800
Received: by mail-ea0-f197.google.com with SMTP id d14so4295411eaa.0
	for <openembedded-core@lists.openembedded.org>;
	Mon, 17 Dec 2012 08:28:36 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=google.com; s=20120113;
	h=x-received:x-received:from:to:subject:date:message-id:x-mailer
	:x-gm-message-state;
	bh=gjOoSOSNuzb8wssKNRpi95OawahcAClrO0DXjWx827g=;
	b=OKJs3S/Pz7b+a6GqcHPgKPjozyrP2+2LTF7iKmg0eX+0eYsM3ff7PTUQjqg1T0UM29
	fTMn0mCF7MtREOC92D0p/utdyWnVRGB91udO4GQu7t+Z6lPEI+2bqqgYd8BbHhGjupNL
	EIlYzxkl75KNlxAOfsK92tZKnhKAeZzrNFdi6ET5+9mUwUL4MfM6+XNKjV3d5v4LerWF
	2PWTxmDZHLz44VnYaQ9KykyPk/a9U1h0a/a021g5eYYHlfE+T75QEchhAkKtx1cUeQ7E
	Nn9Ct3eMEvEGI73f9J5+5mx4CWmrRpgjPU/Y0Le9HhzTK6AcjY6XGbJJbwb65m4q2iZP
	ra1w==
X-Received: by 10.180.24.4 with SMTP id q4mr16790096wif.19.1355761716578;
	Mon, 17 Dec 2012 08:28:36 -0800 (PST)
X-Received: by 10.180.24.4 with SMTP id q4mr16790069wif.19.1355761716332;
	Mon, 17 Dec 2012 08:28:36 -0800 (PST)
Received: from melchett.burtonini.com (35.106.2.81.in-addr.arpa. [81.2.106.35])
	by mx.google.com with ESMTPS id s16sm6529991wii.0.2012.12.17.08.28.34
	(version=TLSv1/SSLv3 cipher=OTHER);
	Mon, 17 Dec 2012 08:28:35 -0800 (PST)
From: Ross Burton <ross.burton@intel.com>
To: openembedded-core@lists.openembedded.org
Date: Mon, 17 Dec 2012 16:26:52 +0000
Message-Id: <1355761613-32597-1-git-send-email-ross.burton@intel.com>
X-Mailer: git-send-email 1.7.10
X-Gm-Message-State: ALoCoQkGem9aIaS8A/c6pCeT7RTMzCaGasRmn8djFxGLF3+xEmkInlbb1lVZJF2/211p2P8Zuj3zVeL0Z1u8JCavMiPEr/AsaKaTJQd6BOGa1gVsbx3DrTgIMUxvEOXPJQTspdXjvrA51tMuc8vCOslkxto5K4681G6w8RB1ifW2nMLcb08eCFlrPNWjKTlof6UTzxDreBpr
Subject: [PATCH 1/2] mutter: remove
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
X-List-Received-Date: Mon, 17 Dec 2012 16:43:28 -0000

This recipe was never used in oe-core or meta-oe, and is very old.

Signed-off-by: Ross Burton <ross.burton@intel.com>
---
 meta/recipes-graphics/mutter/mutter.inc            |   42 ---------------
 .../mutter/mutter/crosscompile.patch               |   57 --------------------
 .../mutter/fix_CGL_TEXTURE_RECTANGLE_ARB.patch     |   47 ----------------
 ...-7adb574bb3fa3880eb85dbc86e580cf3452d57c4.patch |   12 -----
 .../mutter/mutter/fix_pkgconfig.patch              |   12 -----
 meta/recipes-graphics/mutter/mutter/nodocs.patch   |   31 -----------
 meta/recipes-graphics/mutter/mutter/nozenity.patch |   18 -------
 meta/recipes-graphics/mutter/mutter_2.29.1.bb      |   13 -----
 meta/recipes-graphics/mutter/mutter_git.bb         |   21 --------
 9 files changed, 253 deletions(-)
 delete mode 100644 meta/recipes-graphics/mutter/mutter.inc
 delete mode 100644 meta/recipes-graphics/mutter/mutter/crosscompile.patch
 delete mode 100644 meta/recipes-graphics/mutter/mutter/fix_CGL_TEXTURE_RECTANGLE_ARB.patch
 delete mode 100644 meta/recipes-graphics/mutter/mutter/fix_pkgconfig-7adb574bb3fa3880eb85dbc86e580cf3452d57c4.patch
 delete mode 100644 meta/recipes-graphics/mutter/mutter/fix_pkgconfig.patch
 delete mode 100644 meta/recipes-graphics/mutter/mutter/nodocs.patch
 delete mode 100644 meta/recipes-graphics/mutter/mutter/nozenity.patch
 delete mode 100644 meta/recipes-graphics/mutter/mutter_2.29.1.bb
 delete mode 100644 meta/recipes-graphics/mutter/mutter_git.bb

diff --git a/meta/recipes-graphics/mutter/mutter.inc b/meta/recipes-graphics/mutter/mutter.inc
deleted file mode 100644
index 942349f..0000000
--- a/meta/recipes-graphics/mutter/mutter.inc
+++ /dev/null
@@ -1,42 +0,0 @@
-SECTION = "x11/wm"
-DESCRIPTION = "Metacity is the boring window manager for the adult in you. Mutter is metacity + clutter."
-LICENSE = "GPLv2"
-DEPENDS = "startup-notification gtk+ gconf clutter-1.8 gdk-pixbuf-native intltool glib-2.0-native"
-# gobject-introspection
-inherit gnome update-alternatives
-
-ALTERNATIVE_${PN} = "x-window-manager"
-ALTERNATIVE_TARGET[x-window-manager] = "${bindir}/mutter"
-ALTERNATIVE_PRIORITY = "11"
-
-EXTRA_OECONF += "--disable-verbose	\
-	         --disable-xinerama	\
-	         --without-introspection \
-	         --without-libcanberra \
-		 --with-clutter"
-
-#RDEPENDS_${PN} = "zenity"
-
-FILES_${PN} += "${datadir}/themes ${libdir}/mutter/plugins/*.so ${datadir}/gnome/wm-properties/"
-FILES_${PN}-dbg += "${libdir}/mutter/plugins/.debug/*"
-
-CFLAGS_FOR_BUILD += "-I${STAGING_INCDIR_NATIVE}/glib-2.0 -I${STAGING_INCDIR_NATIVE}/glib-2.0/include"
-LDFLAGS_FOR_BUILD += "-L${STAGING_LIBDIR_NATIVE} -lglib-2.0"
-
-do_configure_prepend () {
-        echo "EXTRA_DIST=" > ${S}/gnome-doc-utils.make
-}		
-
-pkg_postinst_${PN} () {
-#!/bin/sh -e
-if [ "x$D" != "x" ]; then
-    exit 1
-fi
-
-. ${sysconfdir}/init.d/functions
-
-gconftool-2 --config-source=xml::$D${sysconfdir}/gconf/gconf.xml.defaults --direct --type list --list-type string --set /apps/mutter/general/clutter_plugins '[default]'
-
-gconftool-2 --config-source=xml::$D${sysconfdir}/gconf/gconf.xml.defaults --direct --type bool --set /apps/mutter/general/compositing_manager true
-}
-
diff --git a/meta/recipes-graphics/mutter/mutter/crosscompile.patch b/meta/recipes-graphics/mutter/mutter/crosscompile.patch
deleted file mode 100644
index da73e7b..0000000
--- a/meta/recipes-graphics/mutter/mutter/crosscompile.patch
+++ /dev/null
@@ -1,57 +0,0 @@
-Upstream-Status: Inappropriate [embedded specific]
-
-Index: git/configure.in
-===================================================================
---- git.orig/configure.in	2009-01-27 14:49:10.000000000 +0000
-+++ git/configure.in	2009-01-27 15:29:41.000000000 +0000
-@@ -46,6 +46,32 @@
- AC_LIBTOOL_WIN32_DLL
- AM_PROG_LIBTOOL
- 
-+if test x"$CC_FOR_BUILD" = x; then
-+	if test x"$cross_compiling" = xyes; then
-+	       AC_CHECK_PROGS(CC_FOR_BUILD, gcc cc)
-+	else
-+	       CC_FOR_BUILD="$CC"
-+	fi
-+fi
-+AC_SUBST([CC_FOR_BUILD])
-+if test x"$CFLAGS_FOR_BUILD" = x; then
-+	if test x"$cross_compiling" = xyes; then
-+	       AC_CHECK_PROGS(CFLAGS_FOR_BUILD, gcc cc)
-+	else
-+	       CFLAGS_FOR_BUILD="$CFLAGS"
-+	fi
-+fi
-+AC_SUBST([CFLAGS_FOR_BUILD])
-+if test x"$LDFLAGS_FOR_BUILD" = x; then
-+	if test x"$cross_compiling" = xyes; then
-+	       AC_CHECK_PROGS(LDFLAGS_FOR_BUILD, gcc cc)
-+	else
-+	       LDFLAGS_FOR_BUILD="$LDFLAGS"
-+	fi
-+fi
-+AC_SUBST([LDFLAGS_FOR_BUILD])
-+
-+
- #### Integer sizes
- 
- AC_CHECK_SIZEOF(char)
-Index: git/src/Makefile.am
-===================================================================
---- git.orig/src/Makefile.am	2009-01-27 15:25:31.000000000 +0000
-+++ git/src/Makefile.am	2009-01-27 15:39:54.000000000 +0000
-@@ -168,11 +168,9 @@
- metacity_dialog_SOURCES= 	\
- 	ui/metacity-dialog.c
- 
--schema_bindings_SOURCES =       \
--        core/schema-bindings.c			\
--	metacity.schemas.in.in
-+schema_bindings:
-+	@CC_FOR_BUILD@ core/schema-bindings.c -I./include -I ../ @CFLAGS_FOR_BUILD@ @LDFLAGS_FOR_BUILD@ -o schema_bindings
- 
--schema_bindings_LDADD = @METACITY_LIBS@
- metacity.schemas.in: schema_bindings ${srcdir}/metacity.schemas.in.in
- 	@echo Generating keybinding schemas... ${srcdir}/metacity.schemas.in.in
- 	${builddir}/schema_bindings ${srcdir}/metacity.schemas.in.in ${builddir}/metacity.schemas.in
diff --git a/meta/recipes-graphics/mutter/mutter/fix_CGL_TEXTURE_RECTANGLE_ARB.patch b/meta/recipes-graphics/mutter/mutter/fix_CGL_TEXTURE_RECTANGLE_ARB.patch
deleted file mode 100644
index 13197e5..0000000
--- a/meta/recipes-graphics/mutter/mutter/fix_CGL_TEXTURE_RECTANGLE_ARB.patch
+++ /dev/null
@@ -1,47 +0,0 @@
-Update the usage of CGL_TEXTURE_RECTANGLE_ARB to GL_TEXTURE_RECTANGLE_ARB
-
-Upstream-Status: Pending
-
-Signed-off-by: Saul Wold <sgw@linux.intel.com>
-
-Index: mutter-2.28.1_0.0/src/compositor/mutter-shaped-texture.c
-===================================================================
---- mutter-2.28.1_0.0.orig/src/compositor/mutter-shaped-texture.c
-+++ mutter-2.28.1_0.0/src/compositor/mutter-shaped-texture.c
-@@ -151,7 +151,7 @@ mutter_shaped_texture_dirty_mask (Mutter
-       cogl_texture_get_gl_texture (priv->mask_texture,
-                                    &mask_gl_tex, &mask_gl_target);
- 
--      if (mask_gl_target == CGL_TEXTURE_RECTANGLE_ARB)
-+      if (mask_gl_target == GL_TEXTURE_RECTANGLE_ARB)
-         glDeleteTextures (1, &mask_gl_tex);
- 
-       cogl_texture_unref (priv->mask_texture);
-@@ -214,23 +214,23 @@ mutter_shaped_texture_ensure_mask (Mutte
- 
-       cogl_texture_get_gl_texture (paint_tex, NULL, &paint_gl_target);
- 
--      if (paint_gl_target == CGL_TEXTURE_RECTANGLE_ARB)
-+      if (paint_gl_target == GL_TEXTURE_RECTANGLE_ARB)
-         {
-           GLuint tex;
- 
-           glGenTextures (1, &tex);
--          glBindTexture (CGL_TEXTURE_RECTANGLE_ARB, tex);
-+          glBindTexture (GL_TEXTURE_RECTANGLE_ARB, tex);
-           glPixelStorei (GL_UNPACK_ROW_LENGTH, tex_width);
-           glPixelStorei (GL_UNPACK_ALIGNMENT, 1);
-           glPixelStorei (GL_UNPACK_SKIP_ROWS, 0);
-           glPixelStorei (GL_UNPACK_SKIP_PIXELS, 0);
--          glTexImage2D (CGL_TEXTURE_RECTANGLE_ARB, 0,
-+          glTexImage2D (GL_TEXTURE_RECTANGLE_ARB, 0,
-                         GL_ALPHA, tex_width, tex_height,
-                         0, GL_ALPHA, GL_UNSIGNED_BYTE, mask_data);
- 
-           priv->mask_texture
-             = cogl_texture_new_from_foreign (tex,
--                                             CGL_TEXTURE_RECTANGLE_ARB,
-+                                             GL_TEXTURE_RECTANGLE_ARB,
-                                              tex_width, tex_height,
-                                              0, 0,
-                                              COGL_PIXEL_FORMAT_A_8);
diff --git a/meta/recipes-graphics/mutter/mutter/fix_pkgconfig-7adb574bb3fa3880eb85dbc86e580cf3452d57c4.patch b/meta/recipes-graphics/mutter/mutter/fix_pkgconfig-7adb574bb3fa3880eb85dbc86e580cf3452d57c4.patch
deleted file mode 100644
index 695f94c..0000000
--- a/meta/recipes-graphics/mutter/mutter/fix_pkgconfig-7adb574bb3fa3880eb85dbc86e580cf3452d57c4.patch
+++ /dev/null
@@ -1,12 +0,0 @@
-Upstream-Status: Inappropriate [configuration]
-
-Index: git/src/metacity-plugins.pc.in
-===================================================================
---- git.orig/src/metacity-plugins.pc.in	2008-12-17 22:42:19.000000000 +0000
-+++ git/src/metacity-plugins.pc.in	2008-12-17 22:42:25.000000000 +0000
-@@ -14,4 +14,4 @@
- Requires: @CLUTTER_PACKAGE@
- Version: @VERSION@
- Libs: @CLUTTER_LIBS@
--Cflags: @CLUTTER_CFLAGS@ -DWITH_CLUTTER -I${includedir}/metacity-1/metacity-private -DMETACITY_MAJOR_VERSION=${metacity_major_version} -DMETACITY_MINOR_VERSION=${metacity_minor_version} -DMETACITY_MICRO_VERSION=${metacity_micro_version} -DMETACITY_CLUTTER_PLUGIN_API_VERSION=${metacity_clutter_plugin_api_version} -DMUTTER_PLUGIN_DIR=\"${mutterplugindir}\"
-+Cflags: -DWITH_CLUTTER -I${includedir}/metacity-1/metacity-private -DMETACITY_MAJOR_VERSION=${metacity_major_version} -DMETACITY_MINOR_VERSION=${metacity_minor_version} -DMETACITY_MICRO_VERSION=${metacity_micro_version} -DMETACITY_CLUTTER_PLUGIN_API_VERSION=${metacity_clutter_plugin_api_version} -DMUTTER_PLUGIN_DIR=\"${mutterplugindir}\"
diff --git a/meta/recipes-graphics/mutter/mutter/fix_pkgconfig.patch b/meta/recipes-graphics/mutter/mutter/fix_pkgconfig.patch
deleted file mode 100644
index de0dded..0000000
--- a/meta/recipes-graphics/mutter/mutter/fix_pkgconfig.patch
+++ /dev/null
@@ -1,12 +0,0 @@
-Upstream-Status: Inappropriate [configuration]
-
-Index: git/src/mutter-plugins.pc.in
-===================================================================
---- git.orig/src/mutter-plugins.pc.in	2009-07-03 17:30:39.000000000 +0100
-+++ git/src/mutter-plugins.pc.in	2009-07-03 18:03:09.000000000 +0100
-@@ -14,4 +14,4 @@
- Requires: @CLUTTER_PACKAGE@
- Version: @VERSION@
- Libs: @CLUTTER_LIBS@
--Cflags: @CLUTTER_CFLAGS@ -DWITH_CLUTTER -I${includedir}/mutter/mutter-private -DMUTTER_MAJOR_VERSION=${mutter_major_version} -DMUTTER_MINOR_VERSION=${mutter_minor_version} -DMUTTER_MICRO_VERSION=${mutter_micro_version} -DMUTTER_PLUGIN_API_VERSION=${mutter_plugin_api_version} -DMUTTER_PLUGIN_DIR=\"${plugindir}\"
-+Cflags: -DWITH_CLUTTER -I${includedir}/mutter/mutter-private -DMUTTER_MAJOR_VERSION=${mutter_major_version} -DMUTTER_MINOR_VERSION=${mutter_minor_version} -DMUTTER_MICRO_VERSION=${mutter_micro_version} -DMUTTER_PLUGIN_API_VERSION=${mutter_plugin_api_version} -DMUTTER_PLUGIN_DIR=\"${plugindir}\"
diff --git a/meta/recipes-graphics/mutter/mutter/nodocs.patch b/meta/recipes-graphics/mutter/mutter/nodocs.patch
deleted file mode 100644
index ceb0609..0000000
--- a/meta/recipes-graphics/mutter/mutter/nodocs.patch
+++ /dev/null
@@ -1,31 +0,0 @@
-Upstream-Status: Inappropriate [configuration]
-
-Index: git/Makefile.am
-===================================================================
---- git.orig/Makefile.am	2009-01-27 13:26:12.000000000 +0000
-+++ git/Makefile.am	2009-01-27 14:07:13.000000000 +0000
-@@ -1,5 +1,5 @@
- 
--SUBDIRS=src po doc
-+SUBDIRS=src po
- 
- EXTRA_DIST = HACKING MAINTAINERS rationales.txt \
- 	intltool-extract.in intltool-merge.in intltool-update.in
-Index: git/configure.in
-===================================================================
---- git.orig/configure.in	2009-01-27 13:26:12.000000000 +0000
-+++ git/configure.in	2009-01-27 14:11:16.000000000 +0000
-@@ -538,12 +538,9 @@
- 
- # Warnings are there for a reason
- if test "x$GCC" = "xyes"; then
--  CFLAGS="$CFLAGS -Wall -Werror -ansi"
-+  CFLAGS="$CFLAGS -Wall -ansi"
- fi
- 
--# Use gnome-doc-utils:
--GNOME_DOC_INIT([0.8.0])
--
- AC_CONFIG_FILES([
- Makefile
- doc/Makefile
diff --git a/meta/recipes-graphics/mutter/mutter/nozenity.patch b/meta/recipes-graphics/mutter/mutter/nozenity.patch
deleted file mode 100644
index fa32b63..0000000
--- a/meta/recipes-graphics/mutter/mutter/nozenity.patch
+++ /dev/null
@@ -1,18 +0,0 @@
-Upstream-Status: Inappropriate [configuration]
-
-Index: git/configure.in
-===================================================================
---- git.orig/configure.in	2009-06-16 13:12:17.000000000 +0100
-+++ git/configure.in	2009-06-16 13:12:33.000000000 +0100
-@@ -575,11 +575,6 @@
-   GCONF_SCHEMAS_INSTALL_FALSE=
- fi
- 
--AC_PATH_PROG(ZENITY, zenity, no)
--if test x"$ZENITY" = xno; then
--  AC_MSG_ERROR([zenity not found in your path - needed for dialogs])
--fi
--
- AC_ARG_ENABLE(debug,
- 	[  --enable-debug		enable debugging],,
- 	enable_debug=no)
diff --git a/meta/recipes-graphics/mutter/mutter_2.29.1.bb b/meta/recipes-graphics/mutter/mutter_2.29.1.bb
deleted file mode 100644
index aefd2c7..0000000
--- a/meta/recipes-graphics/mutter/mutter_2.29.1.bb
+++ /dev/null
@@ -1,13 +0,0 @@
-require mutter.inc
-
-PR = "r1"
-
-LIC_FILES_CHKSUM = "file://COPYING;md5=94d55d512a9ba36caa9b7df079bae19f"
-
-SRC_URI += "file://nodocs.patch \
-            file://nozenity.patch \
-            file://fix_pkgconfig.patch \
-           "
-SRC_URI[archive.md5sum] = "ebe3c04751741fb2a028a3c6c4f1c2d7"
-SRC_URI[archive.sha256sum] = "175f3adcc5ad5c6f23772ca15c862f275fc3d9a9c3104e9146cf265847a4a10a"
-
diff --git a/meta/recipes-graphics/mutter/mutter_git.bb b/meta/recipes-graphics/mutter/mutter_git.bb
deleted file mode 100644
index 94cb17d..0000000
--- a/meta/recipes-graphics/mutter/mutter_git.bb
+++ /dev/null
@@ -1,21 +0,0 @@
-require mutter.inc
-
-SRCREV = "01d3bebe24d2a56bdf2d82c4a71923e1573f7b7c"
-PV = "2.29.1+git${SRCPV}"
-PR = "r0"
-
-LIC_FILES_CHKSUM = "file://COPYING;md5=94d55d512a9ba36caa9b7df079bae19f"
-
-# Gnome is the upstream but moblin is under more active development atm
-# git://git.gnome.org/mutter.git;protocol=git;branch=master
-#
-SRC_URI = "git://git.moblin.org/mutter.git;protocol=git;branch=master \
-           file://nodocs.patch \
-           file://nozenity.patch \
-           file://crosscompile.patch;rev=7adb574bb3fa3880eb85dbc86e580cf3452d57c4 \
-           file://fix_pkgconfig-7adb574bb3fa3880eb85dbc86e580cf3452d57c4.patch;rev=7adb574bb3fa3880eb85dbc86e580cf3452d57c4 \
-           file://fix_pkgconfig.patch;notrev=7adb574bb3fa3880eb85dbc86e580cf3452d57c4 \
-           "
-S = "${WORKDIR}/git"
-
-DEFAULT_PREFERENCE = "-1"
-- 
1.7.10



