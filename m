Return-Path: <alex.kanavin@gmail.com>
Received: from mail-lj1-f174.google.com (mail-lj1-f174.google.com
	[209.85.208.174])
	by mail.openembedded.org (Postfix) with ESMTP id B22367C1ED
	for <openembedded-core@lists.openembedded.org>;
	Thu, 17 Jan 2019 16:40:26 +0000 (UTC)
Received: by mail-lj1-f174.google.com with SMTP id n18-v6so9125794lji.7
	for <openembedded-core@lists.openembedded.org>;
	Thu, 17 Jan 2019 08:40:28 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=from:to:subject:date:message-id:in-reply-to:references;
	bh=Y34IKhv8qd0b49bh+O0FBN1emnSTmixFan3img3ClcM=;
	b=WkwW60F1tyxf3vdwrH5xAtrk0fnuvsXQ6uy8mSMoTIwRJZIT99lDWf8iPcBVPKOxVP
	e1dp4Gf6swfQCvyjdYe9T53e7g9PrcWVLt7vYQCFRk+mWoaonxt9pa5Ghhx9/PCVdTyA
	zK12QMja/d/io6ek37T5b9SZcbWl2KQZeAOqR/h9adndgacd2TVVigLUu8WhwDfnGJzF
	bDbmt/RIHF5XSKuiPBCbcey5PKVJQKRZkoQEtMVMWDiW3myVOAcTo1PeFtpmPisi4GVo
	xT4jhFT5LXv8GE6PhWw1hr2+CnPVdqCNAf6MUdwcrIWX8LH8iqO12gjA3VVU0F4/F6Qk
	CEwg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:from:to:subject:date:message-id:in-reply-to
	:references;
	bh=Y34IKhv8qd0b49bh+O0FBN1emnSTmixFan3img3ClcM=;
	b=SJvZsDoQwpckeY4Kso7yahZN09YBC036hM7lxfIYI3DamNAT2aDgmHXY/3oZXum1h2
	ofmlycLrCvfXUckA1Nf3bJKQ67r3425a3naFnEmEPmqHlWMU6yiv4XqspOtUMNB1U9+f
	se7t2Ni1xRvSTNTdAPR3R9RxLQNedYImqa60C+3QVpcNaSU0HiWTgy+MZX1bssGwH8V8
	MUIkzw8DIuEWuQpDh0f7/tYrt0xS/84A7fSLI8m1Uh893hLQrQ0pIQmm1Jik4f8vs6QP
	VuXujBVxp2kI/zoIfxCPK+LX2n2JhXPu9xy8tVMMmgEnUFBR/W0GfMyp5cPGdGp/YMSf
	SLJw==
X-Gm-Message-State: AJcUukeRktXeN5scsoUDcYd0vGIgTsT6auHeitX+4/mWkrGr0XX6nP/X
	O86kQdiBo9tpx95oz3e1LR35jprG
X-Google-Smtp-Source: ALg8bN591EaKAbHByEhwnDVZFy6UWtbRKmanPXbikxepoV8jbtC7eRl3jGltJ1CNRMQq8PZlALfxzA==
X-Received: by 2002:a2e:4784:: with SMTP id
	u126-v6mr10204569lja.124.1547743226767; 
	Thu, 17 Jan 2019 08:40:26 -0800 (PST)
Received: from alexander-box.luxoft.com ([62.96.135.139])
	by smtp.gmail.com with ESMTPSA id k14sm373098lfc.70.2019.01.17.08.40.25
	for <openembedded-core@lists.openembedded.org>
	(version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
	Thu, 17 Jan 2019 08:40:26 -0800 (PST)
From: Alexander Kanavin <alex.kanavin@gmail.com>
To: openembedded-core@lists.openembedded.org
Date: Thu, 17 Jan 2019 17:39:47 +0100
Message-Id: <6e64c35c63011ae9db16924a1f8b193ae4d6b212.1547743126.git.alex.kanavin@gmail.com>
X-Mailer: git-send-email 2.17.1
In-Reply-To: <cover.1547743126.git.alex.kanavin@gmail.com>
References: <cover.1547743126.git.alex.kanavin@gmail.com>
Subject: [PATCHv3 02/27] gtk+3: remove the gtk-icon-utils-native recipe
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
X-List-Received-Date: Thu, 17 Jan 2019 16:40:27 -0000

As we are now build native gtk+3, it already provides the necessary utilities.

Signed-off-by: Alexander Kanavin <alex.kanavin@gmail.com>
---
 meta/recipes-gnome/gtk+/gtk+3.inc             |   7 +-
 .../gtk+/gtk-icon-utils-native_3.22.30.bb     |  63 -----------
 ...endency-from-gtk-encode-symbolic-svg.patch | 102 ------------------
 3 files changed, 5 insertions(+), 167 deletions(-)
 delete mode 100644 meta/recipes-gnome/gtk+/gtk-icon-utils-native_3.22.30.bb
 delete mode 100644 meta/recipes-gnome/gtk+/gtk-icon-utils/Remove-Gdk-dependency-from-gtk-encode-symbolic-svg.patch

diff --git a/meta/recipes-gnome/gtk+/gtk+3.inc b/meta/recipes-gnome/gtk+/gtk+3.inc
index 724aa5e399e..1c87fad003d 100644
--- a/meta/recipes-gnome/gtk+/gtk+3.inc
+++ b/meta/recipes-gnome/gtk+/gtk+3.inc
@@ -70,10 +70,13 @@ do_install_append_class-nativesdk() {
 }
 
 do_install_append_class-native() {
-    # provided by gtk-icon-utils-native
-    rm ${D}${bindir}/gtk-encode-symbolic-svg
+        create_wrapper ${D}/${bindir}/gtk-update-icon-cache \
+                GDK_PIXBUF_MODULE_FILE=${STAGING_LIBDIR_NATIVE}/gdk-pixbuf-2.0/2.10.0/loaders.cache
+        create_wrapper ${D}/${bindir}/gtk-encode-symbolic-svg \
+                GDK_PIXBUF_MODULE_FILE=${STAGING_LIBDIR_NATIVE}/gdk-pixbuf-2.0/2.10.0/loaders.cache
 }
 
+PROVIDES += "gtk-icon-utils"
 PACKAGES =+ "${PN}-demo"
 LIBV = "3.0.0"
 
diff --git a/meta/recipes-gnome/gtk+/gtk-icon-utils-native_3.22.30.bb b/meta/recipes-gnome/gtk+/gtk-icon-utils-native_3.22.30.bb
deleted file mode 100644
index 28e7a312d28..00000000000
--- a/meta/recipes-gnome/gtk+/gtk-icon-utils-native_3.22.30.bb
+++ /dev/null
@@ -1,63 +0,0 @@
-SUMMARY = "Native icon utils for GTK+"
-DESCRIPTION = "gtk-update-icon-cache and gtk-encode-symbolic-svg built from GTK+ natively, for build time and on-host postinst script execution."
-SECTION = "libs"
-
-DEPENDS = "glib-2.0-native gdk-pixbuf-native librsvg-native"
-
-LICENSE = "LGPLv2 & LGPLv2+ & LGPLv2.1+"
-
-MAJ_VER = "${@oe.utils.trim_version("${PV}", 2)}"
-
-SRC_URI = "http://ftp.gnome.org/pub/gnome/sources/gtk+/${MAJ_VER}/gtk+-${PV}.tar.xz \
-          file://Remove-Gdk-dependency-from-gtk-encode-symbolic-svg.patch"
-SRC_URI[md5sum] = "61e60dc073e0a6893c72043d20579dc0"
-SRC_URI[sha256sum] = "a1a4a5c12703d4e1ccda28333b87ff462741dc365131fbc94c218ae81d9a6567"
-
-LIC_FILES_CHKSUM = "file://COPYING;md5=5f30f0716dfdd0d91eb439ebec522ec2 \
-                    file://gtk/gtk.h;endline=25;md5=1d8dc0fccdbfa26287a271dce88af737 \
-                    file://gdk/gdk.h;endline=25;md5=c920ce39dc88c6f06d3e7c50e08086f2 \
-                    file://tests/testgtk.c;endline=25;md5=cb732daee1d82af7a2bf953cf3cf26f1"
-
-S = "${WORKDIR}/gtk+-${PV}"
-
-inherit pkgconfig native
-
-# versions >= 3.90 are development versions, otherwise like upstream-version-is-even
-UPSTREAM_CHECK_REGEX = "[^\d\.](?P<pver>3\.([1-8]?[02468])+(\.\d+)+)\.tar"
-
-PKG_CONFIG_FOR_BUILD = "${STAGING_BINDIR_NATIVE}/pkg-config-native"
-
-do_configure() {
-	# Quite ugly but defines enough to compile the tools.
-	if ! test -f gtk/config.h; then
-		echo "#define GETTEXT_PACKAGE \"gtk30\"" >> gtk/config.h
-		echo "#define HAVE_UNISTD_H 1" >> gtk/config.h
-		echo "#define HAVE_FTW_H 1" >> gtk/config.h
-	fi
-	if ! test -f gdk/config.h; then
-		touch gdk/config.h
-	fi
-}
-
-do_compile() {
-	${BUILD_CC} ${BUILD_CFLAGS} ${BUILD_LDFLAGS} \
-		${S}/gtk/updateiconcache.c \
-		$(${PKG_CONFIG_FOR_BUILD} --cflags --libs gdk-pixbuf-2.0) \
-		-o gtk-update-icon-cache
-
-	${BUILD_CC} ${BUILD_CFLAGS} ${BUILD_LDFLAGS} \
-		${S}/gtk/encodesymbolic.c \
-		$(${PKG_CONFIG_FOR_BUILD} --cflags --libs gio-2.0 gdk-pixbuf-2.0) \
-		-o gtk-encode-symbolic-svg
-}
-
-do_install() {
-	install -d ${D}${bindir}
-	install -m 0755 ${B}/gtk-update-icon-cache ${D}${bindir}
-	install -m 0755 ${B}/gtk-encode-symbolic-svg ${D}${bindir}
-
-	create_wrapper ${D}/${bindir}/gtk-update-icon-cache \
-		GDK_PIXBUF_MODULE_FILE=${STAGING_LIBDIR_NATIVE}/gdk-pixbuf-2.0/2.10.0/loaders.cache
-	create_wrapper ${D}/${bindir}/gtk-encode-symbolic-svg \
-		GDK_PIXBUF_MODULE_FILE=${STAGING_LIBDIR_NATIVE}/gdk-pixbuf-2.0/2.10.0/loaders.cache
-}
diff --git a/meta/recipes-gnome/gtk+/gtk-icon-utils/Remove-Gdk-dependency-from-gtk-encode-symbolic-svg.patch b/meta/recipes-gnome/gtk+/gtk-icon-utils/Remove-Gdk-dependency-from-gtk-encode-symbolic-svg.patch
deleted file mode 100644
index 237f803755f..00000000000
--- a/meta/recipes-gnome/gtk+/gtk-icon-utils/Remove-Gdk-dependency-from-gtk-encode-symbolic-svg.patch
+++ /dev/null
@@ -1,102 +0,0 @@
-From 4d09ff324419fe4e671233044e424378da53969b Mon Sep 17 00:00:00 2001
-From: Jussi Kukkonen <jussi.kukkonen@intel.com>
-Date: Tue, 9 Jun 2015 14:20:30 +0300
-Subject: [PATCH] Remove Gdk-dependency from gtk-encode-symbolic-svg
-
-Building gtk-encode-symbolic-svg without building Gdk is useful
-as only the icon tools are needed on the native build: this makes
-native build much faster and requires much less dependencies.
-
-Upstream-Status: Pending
-
-Signed-off-by: Jussi Kukkonen <jussi.kukkonen@intel.com>
----
- gtk/encodesymbolic.c | 36 ++++++++++--------------------------
- 1 file changed, 10 insertions(+), 26 deletions(-)
-
-diff --git a/gtk/encodesymbolic.c b/gtk/encodesymbolic.c
-index 9f7d015..1f07563 100644
---- a/gtk/encodesymbolic.c
-+++ b/gtk/encodesymbolic.c
-@@ -19,7 +19,6 @@
- 
- #include <glib.h>
- #include <gdk-pixbuf/gdk-pixdata.h>
--#include <gdk/gdk.h>
- #include <glib/gi18n.h>
- 
- #ifdef HAVE_UNISTD_H
-@@ -43,30 +42,18 @@ static GdkPixbuf *
- load_symbolic_svg (char *file_data, gsize file_len,
-                    int width,
-                    int height,
--                   const GdkRGBA  *fg,
--                   const GdkRGBA  *success_color,
--                   const GdkRGBA  *warning_color,
--                   const GdkRGBA  *error_color,
-+                   const char *css_fg,
-+                   const char *css_success,
-+                   const char *css_warning,
-+                   const char *css_error,
-                    GError        **error)
- {
-   GInputStream *stream;
-   GdkPixbuf *pixbuf;
--  gchar *css_fg;
--  gchar *css_success;
--  gchar *css_warning;
--  gchar *css_error;
-   gchar *data;
-   gchar *svg_width, *svg_height;
-   gchar *escaped_file_data;
- 
--  css_fg = gdk_rgba_to_string (fg);
--
--  css_success = css_warning = css_error = NULL;
--
--  css_warning = gdk_rgba_to_string (warning_color);
--  css_error = gdk_rgba_to_string (error_color);
--  css_success = gdk_rgba_to_string (success_color);
--
-   /* Fetch size from the original icon */
-   stream = g_memory_input_stream_new_from_data (file_data, file_len, NULL);
-   pixbuf = gdk_pixbuf_new_from_stream (stream, NULL, error);
-@@ -105,10 +92,6 @@ load_symbolic_svg (char *file_data, gsize file_len,
-                       "</svg>",
-                       NULL);
-   g_free (escaped_file_data);
--  g_free (css_fg);
--  g_free (css_warning);
--  g_free (css_error);
--  g_free (css_success);
-   g_free (svg_width);
-   g_free (svg_height);
- 
-@@ -167,7 +150,8 @@ make_symbolic_pixbuf (char *file,
-                       GError        **error)
- 
- {
--  GdkRGBA r = { 1,0,0,1}, g = {0,1,0,1};
-+  const char r[] = "rgba(255,0,0,1)";
-+  const char g[] = "rgba(0,255,0,1)";
-   GdkPixbuf *loaded;
-   GdkPixbuf *pixbuf;
-   int plane;
-@@ -196,10 +180,10 @@ make_symbolic_pixbuf (char *file,
-        * the "rest", as all color fractions should add up to 1.
-        */
-       loaded = load_symbolic_svg (file_data, file_len, width, height,
--                                  &g,
--                                  plane == 0 ? &r : &g,
--                                  plane == 1 ? &r : &g,
--                                  plane == 2 ? &r : &g,
-+                                  g,
-+                                  plane == 0 ? r : g,
-+                                  plane == 1 ? r : g,
-+                                  plane == 2 ? r : g,
-                                   error);
-       if (loaded == NULL)
-         return NULL;
--- 
-2.1.4
-
-- 
2.17.1


