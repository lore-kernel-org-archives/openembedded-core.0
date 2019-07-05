Return-Path: <ross.burton@intel.com>
Received: from mail-wr1-f68.google.com (mail-wr1-f68.google.com
	[209.85.221.68])
	by mail.openembedded.org (Postfix) with ESMTP id 14D627EBF2
	for <openembedded-core@lists.openembedded.org>;
	Fri,  5 Jul 2019 16:20:25 +0000 (UTC)
Received: by mail-wr1-f68.google.com with SMTP id r1so4163582wrl.7
	for <openembedded-core@lists.openembedded.org>;
	Fri, 05 Jul 2019 09:20:27 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=intel-com.20150623.gappssmtp.com; s=20150623;
	h=from:to:subject:date:message-id:in-reply-to:references;
	bh=BSGt+zp+riF24arIh2S74TnIpfHbTEoJcW+qYF8lri8=;
	b=sttN9ivU1m3r8bv93gU3Ez/9XlZw6xI0EX7KAe1gXCGcW9EjE9PTb8kNh4saqV9hvz
	SDPaDNIgiGUFUwbgflRzGoabdeYZ1OvwicG7YQpsoIrgGCHsn9DaaPAx184BbhBhaExJ
	FoeeKS0wgofIxkAmCJYgMWqFckAaxOTf3ZVAAj8UhBjp52alYPTq0XkIf6NvB8WSxJy8
	4FYuOQZZB7K3cWLNneXhhN+g72O+gZh2uhyhF6MtUsvKizUkItSHt3vZtEBdyfsVR/NJ
	H2yq7wzryeEeN0Ov/oEbYujT3z5XEVnhhXBNAB79g84RHCIfy/4XHhHzfZUb5GmQKpB6
	t3ow==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:from:to:subject:date:message-id:in-reply-to
	:references;
	bh=BSGt+zp+riF24arIh2S74TnIpfHbTEoJcW+qYF8lri8=;
	b=Io7iJ3NAzWQ6rgSGED0f6PrGReDk4uhg+URIQJs+8wi9cJJEqUa/pwZ+9VGsX1dTF6
	AnnARqrie/1yWRj4WFMvYXSe/JYeJDv5nWNaTY6kVbiDB0iy/E2P19cIV0EXhaCqpUpt
	snkVDF61zS0AG5ZnzXUUBWdcK9+BDLVCRyCKl+Vr40Y9OLjBLBntnyQq87otlprX0ME6
	GEWtyIbwT4b43wcirHnvuSw0ZZuC1W4DeWZs3GBjqPoOlmalkHLq8XzsoqvesuUiRglm
	NmCcLO5ec5T6InSpCzwe+mKO9Zs56n5OV8subj0T+a+/mrlVXoyGb/c6RA08G5AFatr9
	A+yA==
X-Gm-Message-State: APjAAAUfmWuJrayNuTXXlgoTbQvfQk/ZLkrfCNCUd7zK2944kj9RxA9g
	HdQhSoOF1Pk1ir4YMX8d0hsmrh0CXFk=
X-Google-Smtp-Source: APXvYqx8Aj107X6D5cPcJyjlHj77JTo77ZzNdIGxAGTF+3mBnilhHrNOD0/xSKXrA1RXXlRi8Wa4vw==
X-Received: by 2002:adf:ec49:: with SMTP id w9mr4399866wrn.303.1562343626263; 
	Fri, 05 Jul 2019 09:20:26 -0700 (PDT)
Received: from flashheart.burtonini.com (35.106.2.81.in-addr.arpa.
	[81.2.106.35])
	by smtp.gmail.com with ESMTPSA id r4sm9358102wrv.34.2019.07.05.09.20.24
	for <openembedded-core@lists.openembedded.org>
	(version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
	Fri, 05 Jul 2019 09:20:25 -0700 (PDT)
From: Ross Burton <ross.burton@intel.com>
To: openembedded-core@lists.openembedded.org
Date: Fri,  5 Jul 2019 17:20:17 +0100
Message-Id: <20190705162018.28251-3-ross.burton@intel.com>
X-Mailer: git-send-email 2.11.0
In-Reply-To: <20190705162018.28251-1-ross.burton@intel.com>
References: <20190705162018.28251-1-ross.burton@intel.com>
Subject: [RFC PATCH 3/4] gtk+: remove GTK+ 2
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
X-List-Received-Date: Fri, 05 Jul 2019 16:20:26 -0000

GTK+ 2 is ancient, and shouldn't be used.  It will be moved to meta-oe for
people who do need it, but it shouldn't in oe-core.

[ YOCTO #12673 ]

Signed-off-by: Ross Burton <ross.burton@intel.com>
---
 meta/recipes-gnome/gtk+/gtk+.inc                   | 107 ---------------------
 ...ok-into-HOME-when-looking-for-gtk-modules.patch |  29 ------
 meta/recipes-gnome/gtk+/gtk+/doc-fixes.patch       |  22 -----
 .../gtk+/gtk+/hardcoded_libtool.patch              |  36 -------
 .../gtk+/gtk+/strict-prototypes.patch              |  24 -----
 meta/recipes-gnome/gtk+/gtk+/toggle-font.diff      | 102 --------------------
 meta/recipes-gnome/gtk+/gtk+/xsettings.patch       |  20 ----
 meta/recipes-gnome/gtk+/gtk+_2.24.32.bb            |  35 -------
 8 files changed, 375 deletions(-)
 delete mode 100644 meta/recipes-gnome/gtk+/gtk+.inc
 delete mode 100644 meta/recipes-gnome/gtk+/gtk+/0001-Do-not-look-into-HOME-when-looking-for-gtk-modules.patch
 delete mode 100644 meta/recipes-gnome/gtk+/gtk+/doc-fixes.patch
 delete mode 100644 meta/recipes-gnome/gtk+/gtk+/hardcoded_libtool.patch
 delete mode 100644 meta/recipes-gnome/gtk+/gtk+/strict-prototypes.patch
 delete mode 100644 meta/recipes-gnome/gtk+/gtk+/toggle-font.diff
 delete mode 100644 meta/recipes-gnome/gtk+/gtk+/xsettings.patch
 delete mode 100644 meta/recipes-gnome/gtk+/gtk+_2.24.32.bb

diff --git a/meta/recipes-gnome/gtk+/gtk+.inc b/meta/recipes-gnome/gtk+/gtk+.inc
deleted file mode 100644
index d6d14a79d5a..00000000000
--- a/meta/recipes-gnome/gtk+/gtk+.inc
+++ /dev/null
@@ -1,107 +0,0 @@
-SUMMARY = "Multi-platform toolkit for creating GUIs"
-DESCRIPTION = "GTK+ is a multi-platform toolkit for creating graphical user interfaces. Offering a complete \
-set of widgets, GTK+ is suitable for projects ranging from small one-off projects to complete application suites."
-HOMEPAGE = "http://www.gtk.org"
-BUGTRACKER = "https://bugzilla.gnome.org/"
-
-LICENSE = "LGPLv2 & LGPLv2+ & LGPLv2.1+"
-
-LIC_FILES_CHKSUM = "file://COPYING;md5=3bf50002aefd002f49e7bb854063f7e7"
-
-SECTION = "libs"
-
-inherit distro_features_check
-ANY_OF_DISTRO_FEATURES = "${GTK2DISTROFEATURES}"
-
-# This picks stable releases in the 2.x series (but not 2.90 onwards,
-# which were GNOME 3 betas).
-UPSTREAM_CHECK_REGEX = "(?P<pver>2\.([0-8]*[02468])+(\.\d+)+)"
-
-X11DEPENDS = "virtual/libx11 libxext libxcursor libxrandr libxdamage libxrender libxcomposite"
-DEPENDS = "glib-2.0 pango atk jpeg libpng gdk-pixbuf-native \
- cairo gdk-pixbuf"
-
-PACKAGECONFIG ??= "${@bb.utils.filter('DISTRO_FEATURES', 'directfb x11', d)}"
-
-PACKAGECONFIG[x11] = "--with-x=yes --with-gdktarget=x11,--with-x=no,${X11DEPENDS}"
-# without --with-gdktarget=directfb it will check for cairo-xlib which isn't available without X11 DISTRO_FEATURE
-PACKAGECONFIG[directfb] = "--with-gdktarget=directfb,,directfb"
-PACKAGECONFIG[manpages] = "--enable-man --with-xml-catalog=${STAGING_ETCDIR_NATIVE}/xml/catalog, --disable-man, libxslt-native xmlto-native"
-
-inherit autotools gtk-doc pkgconfig update-alternatives gtk-immodules-cache gobject-introspection manpages
-
-PACKAGES += "libgail gtk-demo"
-
-FILES_${PN} += "${bindir}/gtk-update-icon-cache-2.0 \
-	${bindir}/gtk-query-immodules-2.0 \
-	${datadir}/themes ${sysconfdir} \
-	${libdir}/gtk-2.0/${LIBV}/engines/libpixmap.so"
-
-FILES_${PN}-dev += " \
-        ${datadir}/gtk-2.0/include \
-	${libdir}/gtk-2.0/include \
-	${libdir}/gtk-2.0/modules/*.la \
-	${libdir}/gtk-2.0/${LIBV}/loaders/*.la \
-	${libdir}/gtk-2.0/${LIBV}/immodules/*.la \
-	${libdir}/gtk-2.0/${LIBV}/printbackends/*.la \
-	${libdir}/gtk-2.0/${LIBV}/engines/*.la \
-	${bindir}/gtk-builder-convert"
-
-FILES_gtk-demo = " \
- ${datadir}/gtk-2.0/demo/* \
- ${bindir}/gtk-demo \
- "
-
-FILES_libgail = " \
-	${libdir}/gtk-2.0/modules/libgail.so \
-	${libdir}/gtk-2.0/modules/libferret.so \
-	"
-
-GTKBASE_RRECOMMENDS ?= "liberation-fonts \
-                        gdk-pixbuf-loader-png \
-                        gdk-pixbuf-loader-jpeg \
-                        gdk-pixbuf-loader-gif \
-                        gdk-pixbuf-loader-xpm \
-                        shared-mime-info \
-                        gnome-theme-adwaita \
-                        "
-GTKGLIBC_RRECOMMENDS ?= "${GTKBASE_RRECOMMENDS} glibc-gconv-iso8859-1"
-
-RRECOMMENDS_${PN} = "${GTKBASE_RRECOMMENDS}"
-RRECOMMENDS_${PN}_libc-glibc = "${GTKGLIBC_RRECOMMENDS}"
-
-ALTERNATIVE_${PN} = "gtk-update-icon-cache"
-ALTERNATIVE_TARGET[gtk-update-icon-cache] = "${bindir}/gtk-update-icon-cache-2.0"
-
-do_compile_prepend() {
-        export GIR_EXTRA_LIBS_PATH="${B}/gdk/.libs"
-}
-
-do_install () {
-	autotools_do_install
-
-	install -d ${D}${sysconfdir}/gtk-2.0
-
-	mkdir -p ${D}${libdir}/gtk-2.0/include
-	install -m 0644 gdk/gdkconfig.h ${D}${libdir}/gtk-2.0/include/gdkconfig.h
-
-	install -m 0644 ${S}/gtk/gtkfilechooserprivate.h ${D}${includedir}/gtk-2.0/gtk/
-	install -m 0644 ${S}/gtk/gtkfilechooserutils.h   ${D}${includedir}/gtk-2.0/gtk/
-	install -m 0644 ${S}/gtk/gtkfilesystemmodel.h    ${D}${includedir}/gtk-2.0/gtk/
-
-	mv ${D}${bindir}/gtk-update-icon-cache ${D}${bindir}/gtk-update-icon-cache-2.0
-
-    # duplicate gtk-query-immodules for post install script update_gtk_immodules_cache
-    mkdir -p ${D}${libexecdir}
-    ln ${D}${bindir}/gtk-query-immodules-2.0 ${D}${libexecdir}/${MLPREFIX}gtk-query-immodules-2.0
-}
-
-SYSROOT_PREPROCESS_FUNCS += "gtk_sysroot_preprocess"
-
-gtk_sysroot_preprocess () {
-	if [ -e ${D}${bindir}/gtk-builder-convert ]; then
-		install -d ${SYSROOT_DESTDIR}${bindir_crossscripts}/
-		install -m 755 ${D}${bindir}/gtk-builder-convert ${SYSROOT_DESTDIR}${bindir_crossscripts}/
-	fi
-}
-
diff --git a/meta/recipes-gnome/gtk+/gtk+/0001-Do-not-look-into-HOME-when-looking-for-gtk-modules.patch b/meta/recipes-gnome/gtk+/gtk+/0001-Do-not-look-into-HOME-when-looking-for-gtk-modules.patch
deleted file mode 100644
index 83be39c3bf2..00000000000
--- a/meta/recipes-gnome/gtk+/gtk+/0001-Do-not-look-into-HOME-when-looking-for-gtk-modules.patch
+++ /dev/null
@@ -1,29 +0,0 @@
-From 34ce93e1c50bfb88f92a687d4f82de55584f3f6a Mon Sep 17 00:00:00 2001
-From: Alexander Kanavin <alex.kanavin@gmail.com>
-Date: Wed, 11 Apr 2018 14:20:39 +0300
-Subject: [PATCH] Do not look into $HOME when looking for gtk modules
-
-On the host it causes host contamination, on the target it's a
-potential security issue. Gtk+3 has already removed this.
-
-Upstream-Status: Inappropriate [gtk2 is in maintenance mode]
-Signed-off-by: Alexander Kanavin <alex.kanavin@gmail.com>
----
- gtk/gtkmodules.c | 4 ----
- 1 file changed, 4 deletions(-)
-
-diff --git a/gtk/gtkmodules.c b/gtk/gtkmodules.c
-index 50729b6..e09b583 100644
---- a/gtk/gtkmodules.c
-+++ b/gtk/gtkmodules.c
-@@ -65,10 +65,6 @@ get_module_path (void)
-   if (result)
-     return result;
- 
--  home_dir = g_get_home_dir();
--  if (home_dir)
--    home_gtk_dir = g_build_filename (home_dir, ".gtk-2.0", NULL);
--
-   module_path_env = g_getenv ("GTK_PATH");
-   exe_prefix = g_getenv ("GTK_EXE_PREFIX");
- 
diff --git a/meta/recipes-gnome/gtk+/gtk+/doc-fixes.patch b/meta/recipes-gnome/gtk+/gtk+/doc-fixes.patch
deleted file mode 100644
index 74e479fd1bf..00000000000
--- a/meta/recipes-gnome/gtk+/gtk+/doc-fixes.patch
+++ /dev/null
@@ -1,22 +0,0 @@
-There are issues building the gtk+ tutorial and faq documentation.
-Since they were removed in gtk+ upstream and are superfluous in
-embedded applications, just don't build them.
-
-Thanks to Joshua Lock for suggesting this approach.
-
-Signed-off-by: Scott Garman <scott.a.garman@intel.com>
-
-Upstream-Status: Inappropriate [embedded specific]
-
-diff -urN gtk+-2.22.1.orig/docs/Makefile.am gtk+-2.22.1/docs/Makefile.am
---- gtk+-2.22.1.orig/docs/Makefile.am	2010-11-15 04:13:09.000000000 -0800
-+++ gtk+-2.22.1/docs/Makefile.am	2011-02-23 19:25:16.914815097 -0800
-@@ -1,7 +1,7 @@
- ## Process this file with automake to produce Makefile.in
- include $(top_srcdir)/Makefile.decl
- 
--SUBDIRS = tutorial faq reference tools
-+SUBDIRS = reference tools
- 
- EXTRA_DIST += \
- 	defsformat.txt			\
diff --git a/meta/recipes-gnome/gtk+/gtk+/hardcoded_libtool.patch b/meta/recipes-gnome/gtk+/gtk+/hardcoded_libtool.patch
deleted file mode 100644
index 9eb7f6bf5c7..00000000000
--- a/meta/recipes-gnome/gtk+/gtk+/hardcoded_libtool.patch
+++ /dev/null
@@ -1,36 +0,0 @@
-Upstream-Status: Inappropriate [embedded specific]
-
-Updated to apply to gtk+-2.24.15
-
-Signed-off-by: Marko Lindqvist <cazfi74@gmail.com>
-Index: gtk+-2.24.31/configure.ac
-===================================================================
---- gtk+-2.24.31.orig/configure.ac
-+++ gtk+-2.24.31/configure.ac
-@@ -415,7 +415,7 @@ AC_MSG_CHECKING([Whether to write depend
- case $enable_explicit_deps in
-   auto)
-     export SED
--    deplibs_check_method=`(./libtool --config; echo 'eval echo \"$deplibs_check_method\"') | sh`
-+    deplibs_check_method=`(./$host_alias-libtool --config; echo 'eval echo \"$deplibs_check_method\"') | sh`
-     if test "x$deplibs_check_method" '!=' xpass_all || test "x$enable_static" = xyes ; then
-       enable_explicit_deps=yes  
-     else
-@@ -772,7 +772,7 @@ else
-     dnl Now we check to see if our libtool supports shared lib deps
-     dnl (in a rather ugly way even)
-     if $dynworks; then
--        module_libtool_config="${CONFIG_SHELL-/bin/sh} ./libtool --config"
-+        module_libtool_config="${CONFIG_SHELL-/bin/sh} $host_alias-libtool --config"
-         module_deplibs_check=`$module_libtool_config | \
-             grep '^[[a-z_]]*check[[a-z_]]*_method=[['\''"]]' | \
-             sed 's/.*[['\''"]]\(.*\)[['\''"]]$/\1/'`
-@@ -1579,7 +1579,7 @@ fi
- # We are using gmodule-no-export now, but I'm leaving the stripping
- # code in place for now, since pango and atk still require gmodule.
- export SED
--export_dynamic=`(./libtool --config; echo eval echo \\$export_dynamic_flag_spec) | sh`
-+export_dynamic=`($host_alias-libtool --config; echo eval echo \\$export_dynamic_flag_spec) | sh`
- if test -n "$export_dynamic"; then
-   GDK_DEP_LIBS=`echo $GDK_DEP_LIBS | sed -e "s/$export_dynamic//"`
-   GTK_DEP_LIBS=`echo $GTK_DEP_LIBS | sed -e "s/$export_dynamic//"`
diff --git a/meta/recipes-gnome/gtk+/gtk+/strict-prototypes.patch b/meta/recipes-gnome/gtk+/gtk+/strict-prototypes.patch
deleted file mode 100644
index 96e1f5feacb..00000000000
--- a/meta/recipes-gnome/gtk+/gtk+/strict-prototypes.patch
+++ /dev/null
@@ -1,24 +0,0 @@
-Fixes
-
-include/gtk-2.0/gtk/gtkitemfactory.h:47:1: warning: function declaration isn't a prototype [-Wstrict-prototypes]
- typedef void (*GtkItemFactoryCallback)  ();
-
-gcc5 has -Wstrict-prototypes on by default for -Werror so this becomes a build failure for consumers
-of this header e.g. matchbox-panel-2
-
-Upstream-Status: Pending
-
-Signed-off-by: Khem Raj <raj.khem@gmail.com>
-Index: gtk+-2.24.27/gtk/gtkitemfactory.h
-===================================================================
---- gtk+-2.24.27.orig/gtk/gtkitemfactory.h
-+++ gtk+-2.24.27/gtk/gtkitemfactory.h
-@@ -44,7 +44,7 @@ typedef void	(*GtkPrintFunc)		   (gpoint
-  * (Note that if we are included from a C++ program () will mean
-  * (void) so an explicit cast will be needed.)
-  */
--typedef	void	(*GtkItemFactoryCallback)  ();
-+typedef	void	(*GtkItemFactoryCallback)  (void);
- typedef	void	(*GtkItemFactoryCallback1) (gpointer		 callback_data,
- 					    guint		 callback_action,
- 					    GtkWidget		*widget);
diff --git a/meta/recipes-gnome/gtk+/gtk+/toggle-font.diff b/meta/recipes-gnome/gtk+/gtk+/toggle-font.diff
deleted file mode 100644
index 340d12008be..00000000000
--- a/meta/recipes-gnome/gtk+/gtk+/toggle-font.diff
+++ /dev/null
@@ -1,102 +0,0 @@
-Upstream-Status: Pending
-
-Index: gtk/gtkcellrenderertoggle.c
-===================================================================
---- gtk/gtkcellrenderertoggle.c.orig	2010-06-22 18:11:33.000000000 +0800
-+++ gtk/gtkcellrenderertoggle.c	2010-06-22 18:11:43.000000000 +0800
-@@ -71,6 +71,8 @@
-   PROP_INDICATOR_SIZE
- };
- 
-+/* This is a hard-coded default which promptly gets overridden by a size
-+   calculated from the font size. */
- #define TOGGLE_WIDTH 13
- 
- static guint toggle_cell_signals[LAST_SIGNAL] = { 0 };
-@@ -80,8 +82,9 @@
- typedef struct _GtkCellRendererTogglePrivate GtkCellRendererTogglePrivate;
- struct _GtkCellRendererTogglePrivate
- {
--  gint indicator_size;
--
-+  gint indicator_size; /* This is the real size */
-+  gint override_size; /* This is the size set from the indicator-size property */
-+  GtkWidget *cached_widget;
-   guint inconsistent : 1;
- };
- 
-@@ -104,6 +107,7 @@
-   GTK_CELL_RENDERER (celltoggle)->ypad = 2;
- 
-   priv->indicator_size = TOGGLE_WIDTH;
-+  priv->override_size = 0;
-   priv->inconsistent = FALSE;
- }
- 
-@@ -210,7 +214,7 @@
-       g_value_set_boolean (value, celltoggle->radio);
-       break;
-     case PROP_INDICATOR_SIZE:
--      g_value_set_int (value, priv->indicator_size);
-+      g_value_set_int (value, priv->override_size ? priv->override_size : priv->indicator_size);
-       break;
-     default:
-       G_OBJECT_WARN_INVALID_PROPERTY_ID (object, param_id, pspec);
-@@ -245,7 +249,7 @@
-       celltoggle->radio = g_value_get_boolean (value);
-       break;
-     case PROP_INDICATOR_SIZE:
--      priv->indicator_size = g_value_get_int (value);
-+      priv->override_size = g_value_get_int (value);
-       break;
-     default:
-       G_OBJECT_WARN_INVALID_PROPERTY_ID (object, param_id, pspec);
-@@ -273,6 +277,27 @@
- }
- 
- static void
-+on_widget_style_set (GtkWidget *widget, GtkStyle *previous, gpointer user_data)
-+{
-+  GtkCellRendererTogglePrivate *priv = user_data;
-+  PangoContext *context;
-+  PangoFontMetrics *metrics;
-+  int height;
-+  
-+  context = gtk_widget_get_pango_context (widget);
-+  metrics = pango_context_get_metrics (context,
-+                                       widget->style->font_desc,
-+                                       pango_context_get_language (context));
-+
-+  height = pango_font_metrics_get_ascent (metrics) +
-+    pango_font_metrics_get_descent (metrics);
-+  
-+  pango_font_metrics_unref (metrics);
-+  
-+  priv->indicator_size = PANGO_PIXELS (height * 0.85);
-+}
-+
-+static void
- gtk_cell_renderer_toggle_get_size (GtkCellRenderer *cell,
- 				   GtkWidget       *widget,
- 				   GdkRectangle    *cell_area,
-@@ -287,6 +312,20 @@
- 
-   priv = GTK_CELL_RENDERER_TOGGLE_GET_PRIVATE (cell);
- 
-+  if (priv->override_size) {
-+    priv->indicator_size = priv->override_size;
-+  } else if (priv->cached_widget != widget) {
-+    if (priv->cached_widget) {
-+      g_object_remove_weak_pointer (widget, &priv->cached_widget);
-+      g_signal_handlers_disconnect_by_func (priv->cached_widget, on_widget_style_set, priv);
-+    }
-+    priv->cached_widget = widget;
-+    g_object_add_weak_pointer (widget, &priv->cached_widget);
-+    g_signal_connect (widget, "style-set", on_widget_style_set, priv);
-+    
-+    on_widget_style_set (widget, NULL, priv);
-+  }
-+
-   calc_width = (gint) cell->xpad * 2 + priv->indicator_size;
-   calc_height = (gint) cell->ypad * 2 + priv->indicator_size;
- 
diff --git a/meta/recipes-gnome/gtk+/gtk+/xsettings.patch b/meta/recipes-gnome/gtk+/gtk+/xsettings.patch
deleted file mode 100644
index d0a970ad4d4..00000000000
--- a/meta/recipes-gnome/gtk+/gtk+/xsettings.patch
+++ /dev/null
@@ -1,20 +0,0 @@
-Upstream-Status: Pending
-
-Index: gtk+-2.21.2/gdk/x11/gdkevents-x11.c
-===================================================================
---- gtk+-2.21.2.orig/gdk/x11/gdkevents-x11.c	2010-06-22 17:28:04.000000000 +0800
-+++ gtk+-2.21.2/gdk/x11/gdkevents-x11.c	2010-06-22 17:28:06.000000000 +0800
-@@ -3062,10 +3062,9 @@
- {
-   GdkScreenX11 *screen = data;
-   
--  if (xsettings_client_process_event (screen->xsettings_client, (XEvent *)xevent))
--    return GDK_FILTER_REMOVE;
--  else
--    return GDK_FILTER_CONTINUE;
-+  xsettings_client_process_event (screen->xsettings_client, (XEvent *)xevent);
-+
-+  return GDK_FILTER_CONTINUE;
- }
- 
- static Bool
diff --git a/meta/recipes-gnome/gtk+/gtk+_2.24.32.bb b/meta/recipes-gnome/gtk+/gtk+_2.24.32.bb
deleted file mode 100644
index 682d31e49e2..00000000000
--- a/meta/recipes-gnome/gtk+/gtk+_2.24.32.bb
+++ /dev/null
@@ -1,35 +0,0 @@
-require gtk+.inc
-
-LIC_FILES_CHKSUM = "file://COPYING;md5=3bf50002aefd002f49e7bb854063f7e7 \
-                    file://gtk/gtk.h;endline=27;md5=c59e0b4490dd135a5726ebf851f9b17f \
-                    file://gdk/gdk.h;endline=27;md5=07db285ec208fb3e0bf7d861b0614202 \
-                    file://tests/testgtk.c;endline=27;md5=262db5db5f776f9863e56df31423e24c"
-SRC_URI = "http://ftp.gnome.org/pub/gnome/sources/gtk+/2.24/gtk+-${PV}.tar.xz \
-           file://xsettings.patch \
-           file://hardcoded_libtool.patch \
-           file://toggle-font.diff;striplevel=0 \
-           file://doc-fixes.patch \
-           file://strict-prototypes.patch \
-           file://0001-Do-not-look-into-HOME-when-looking-for-gtk-modules.patch \
-           "
-
-SRC_URI[md5sum] = "d5742aa42275203a499b59b4c382a784"
-SRC_URI[sha256sum] = "b6c8a93ddda5eabe3bfee1eb39636c9a03d2a56c7b62828b359bf197943c582e"
-
-EXTRA_OECONF = "--enable-xkb --disable-glibtest --disable-cups --disable-xinerama"
-
-LIBV = "2.10.0"
-
-PACKAGES_DYNAMIC += "^gtk-immodule-.* ^gtk-printbackend-.*"
-
-python populate_packages_prepend () {
-    gtk_libdir = d.expand('${libdir}/gtk-2.0/${LIBV}')
-    immodules_root = os.path.join(gtk_libdir, 'immodules')
-    printmodules_root = os.path.join(gtk_libdir, 'printbackends');
-
-    d.setVar('GTKIMMODULES_PACKAGES', ' '.join(do_split_packages(d, immodules_root, r'^im-(.*)\.so$', 'gtk-immodule-%s', 'GTK input module for %s')))
-    do_split_packages(d, printmodules_root, r'^libprintbackend-(.*)\.so$', 'gtk-printbackend-%s', 'GTK printbackend module for %s')
-
-    if (d.getVar('DEBIAN_NAMES')):
-        d.setVar(d.expand('PKG_${PN}'), '${MLPREFIX}libgtk-2.0')
-}
-- 
2.11.0


