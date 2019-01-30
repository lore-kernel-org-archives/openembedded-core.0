Return-Path: <alex.kanavin@gmail.com>
Received: from mail-wr1-f65.google.com (mail-wr1-f65.google.com
	[209.85.221.65])
	by mail.openembedded.org (Postfix) with ESMTP id C407F7C2E9
	for <openembedded-core@lists.openembedded.org>;
	Wed, 30 Jan 2019 10:59:51 +0000 (UTC)
Received: by mail-wr1-f65.google.com with SMTP id l9so25459576wrt.13
	for <openembedded-core@lists.openembedded.org>;
	Wed, 30 Jan 2019 02:59:53 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=from:to:subject:date:message-id:in-reply-to:references;
	bh=TNk6Vtr/Lhd8BgDhOsfk/v6yDr1IuF8ZzZnRdj2lhfA=;
	b=S07u1ApqB5rDzbR0n9Ftu/LaEiWUS90GlpFm8CEmoWLtViKY9swC9ywhN/9kBe0dje
	GNfJCv8NkbMFN5IEK3H/y00xkg5LIHmJYmphul3G7hzQYlZ5m3IZxkMby6ErQ1wWvbWG
	hxZ9Ss293M8bU4M3mD9JqBtuqotrsIe1HleaRuMCIW4JNYXoY4EvuSNSIUkpTp0165op
	9vxkVWLSdWLMbDRLdpoJxp7ODdoearUYGwGPniVrgcdSONnoq2P1azINNHk1QDg5goei
	U4L7/Y4lCFErhqsYNd9ak/4ix2apI7Hc4pwFr9U0btKnp+X6nLI2lM1x+lekjPGY5jOH
	P6oQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:from:to:subject:date:message-id:in-reply-to
	:references;
	bh=TNk6Vtr/Lhd8BgDhOsfk/v6yDr1IuF8ZzZnRdj2lhfA=;
	b=rFP0AKpHX+qrXNBSBDPwk3UqdRhFlJBXCOP/2cUk7mEDf2/yI/ArUUJGyZ581xVc/f
	FxMAg/GIEoELXPhsCPskePfvNsXKejgMP7V4lcso6TAxV088cL1+eoMLDPqRXlpK9Ah5
	q1XGOA3+cbpEs5AWbHUfBcqz8BlNiSob1R+ecTWe+czjOy6pIu7p12t9zOe6NO26X7et
	Y5B9KPO3dsXhdkZA+WmQEEew4f5rC9AEmHVk9svXcUAx4dMK0if4hMUbsLdsofrgKHks
	/Kb3NnNiUAtvWajZg6eAubxlcob4RfP+pPFcItKCTnwnTa3J9ZMSCefbyv9wQKrkqO7z
	hTJw==
X-Gm-Message-State: AJcUukevX8mLB5Wiek+h2yqvdSUrNUAf0X4T0cd4dylQbWThCaol4P6G
	2bB0IWexmGCUKa86Fr7BQj86lLqj
X-Google-Smtp-Source: ALg8bN7DmWchMlZUdgrvvgGfvGjs/WETsyB9PVDll53b1PDQDjdAFRhY3azUgh+k3NyxBIzh4IMH+w==
X-Received: by 2002:a5d:4652:: with SMTP id j18mr30457817wrs.279.1548845992116;
	Wed, 30 Jan 2019 02:59:52 -0800 (PST)
Received: from alexander-box.luxoft.com ([62.96.135.139])
	by smtp.gmail.com with ESMTPSA id
	a18sm1127705wrp.13.2019.01.30.02.59.50
	for <openembedded-core@lists.openembedded.org>
	(version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
	Wed, 30 Jan 2019 02:59:51 -0800 (PST)
From: Alexander Kanavin <alex.kanavin@gmail.com>
To: openembedded-core@lists.openembedded.org
Date: Wed, 30 Jan 2019 11:59:25 +0100
Message-Id: <992c9ab2ee617989f5b3918769e66761f1bbc8fd.1548845917.git.alex.kanavin@gmail.com>
X-Mailer: git-send-email 2.17.1
In-Reply-To: <cover.1548845917.git.alex.kanavin@gmail.com>
References: <cover.1548845917.git.alex.kanavin@gmail.com>
Subject: [PATCH 02/20] gtk+3: remove the gtk-icon-utils-native recipe
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
X-List-Received-Date: Wed, 30 Jan 2019 10:59:52 -0000

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
index 0b5fffb752f..77b6c31536b 100644
--- a/meta/recipes-gnome/gtk+/gtk+3.inc
+++ b/meta/recipes-gnome/gtk+/gtk+3.inc
@@ -72,10 +72,13 @@ do_install_append_class-nativesdk() {
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


