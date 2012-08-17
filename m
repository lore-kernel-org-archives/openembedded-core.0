Received: from mga05.intel.com ([192.55.52.89] helo=fmsmga101.fm.intel.com)
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <ross.burton@intel.com>) id 1T2L21-0002dH-CP
	for openembedded-core@lists.openembedded.org;
	Fri, 17 Aug 2012 13:48:01 +0200
Received: from mail-we0-f180.google.com ([74.125.82.180])
	by mga01.intel.com with ESMTP/TLS/RC4-SHA; 17 Aug 2012 04:36:02 -0700
Received: by mail-we0-f180.google.com with SMTP id t11so2181899wey.25
	for <openembedded-core@lists.openembedded.org>;
	Fri, 17 Aug 2012 04:36:02 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=google.com; s=20120113;
	h=from:to:subject:date:message-id:x-mailer:in-reply-to:references
	:in-reply-to:references:x-gm-message-state;
	bh=lUmHCYWyv9rItQ9eRp4PuzDoXunGGGjTRYdnU2kIApM=;
	b=Blb8xorU8xirlb2+HyzVh/A6AjDaUeKoGrL5dyMHAqLXDIGxj8z7v0t2mcxwUHjpby
	rW0TMii1GxcGHyoHhPSwy++vkfoKqRn3Upba8YcaPQ4+JYEzm1dbHBsT78KC+X2pk4Lb
	YUgu/YdIS/aJygjU0gvacomtKRlDIB2lE3lEfO3Z+F40bQEzhz7jus5c9Izedw89e1Xp
	L+GkkLZdBdnzi5vwQYCU7gxMvhSjWVaCoQVGGnBcZAkGI6oKcrx1Wtk21cueETgb1AL4
	G/s9/b8hPVh21x9hIkmWsio4yWxvkF4CBIltHmD3393NRagj1KlTk8FBD4eIZaRqI/NZ
	XZgA==
Received: by 10.180.81.165 with SMTP id b5mr4225931wiy.17.1345203362217;
	Fri, 17 Aug 2012 04:36:02 -0700 (PDT)
Received: from melchett.burtonini.com (35.106.2.81.in-addr.arpa. [81.2.106.35])
	by mx.google.com with ESMTPS id ck9sm13900366wib.2.2012.08.17.04.36.00
	(version=TLSv1/SSLv3 cipher=OTHER);
	Fri, 17 Aug 2012 04:36:01 -0700 (PDT)
From: Ross Burton <ross.burton@intel.com>
To: openembedded-core@lists.openembedded.org
Date: Fri, 17 Aug 2012 12:35:17 +0100
Message-Id: <f6cf7bda28c1ae5f9033863f70657e1970b6bdc9.1345203203.git.ross.burton@intel.com>
X-Mailer: git-send-email 1.7.10
In-Reply-To: <4baa41ff91746d04a3be3b3718bb5317744ad185.1345203203.git.ross.burton@intel.com>
References: <4baa41ff91746d04a3be3b3718bb5317744ad185.1345203203.git.ross.burton@intel.com>
In-Reply-To: <cover.1345203203.git.ross.burton@intel.com>
References: <cover.1345203203.git.ross.burton@intel.com>
X-Gm-Message-State: ALoCoQnVJRbhhUqMMztDOeh0RLKCTO9ioSq5icqHOLeohZ2pnmU86nQl2sLlxuNbxC+ezz6fe8Hi
Subject: [PATCH 2/2] gtk+ remove 2.16.6
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
X-List-Received-Date: Fri, 17 Aug 2012 11:48:01 -0000


Signed-off-by: Ross Burton <ross.burton@intel.com>
---
 ...Duplicate-the-exec-string-returned-by-gtk.patch |   33 ------
 .../gtk+/gtk+-2.16.6/cellrenderer-cairo.patch      |   34 -------
 .../gtk+-2.16.6/disable-gio-png-sniff-test.diff    |   99 ------------------
 .../gtk+/gtk+-2.16.6/entry-cairo.patch             |  105 --------------------
 .../gtk+/gtk+-2.16.6/hardcoded_libtool.patch       |   33 ------
 meta/recipes-gnome/gtk+/gtk+-2.16.6/no-demos.patch |   12 ---
 .../gtk+/gtk+-2.16.6/run-iconcache.patch           |   21 ----
 .../gtk+/gtk+-2.16.6/toggle-font.diff              |  102 -------------------
 .../recipes-gnome/gtk+/gtk+-2.16.6/xsettings.patch |   18 ----
 meta/recipes-gnome/gtk+/gtk+_2.16.6.bb             |   49 ---------
 10 files changed, 506 deletions(-)
 delete mode 100644 meta/recipes-gnome/gtk+/gtk+-2.16.6/0001-bgo-584832-Duplicate-the-exec-string-returned-by-gtk.patch
 delete mode 100644 meta/recipes-gnome/gtk+/gtk+-2.16.6/cellrenderer-cairo.patch
 delete mode 100644 meta/recipes-gnome/gtk+/gtk+-2.16.6/disable-gio-png-sniff-test.diff
 delete mode 100644 meta/recipes-gnome/gtk+/gtk+-2.16.6/entry-cairo.patch
 delete mode 100644 meta/recipes-gnome/gtk+/gtk+-2.16.6/hardcoded_libtool.patch
 delete mode 100644 meta/recipes-gnome/gtk+/gtk+-2.16.6/no-demos.patch
 delete mode 100644 meta/recipes-gnome/gtk+/gtk+-2.16.6/run-iconcache.patch
 delete mode 100644 meta/recipes-gnome/gtk+/gtk+-2.16.6/toggle-font.diff
 delete mode 100644 meta/recipes-gnome/gtk+/gtk+-2.16.6/xsettings.patch
 delete mode 100644 meta/recipes-gnome/gtk+/gtk+_2.16.6.bb

diff --git a/meta/recipes-gnome/gtk+/gtk+-2.16.6/0001-bgo-584832-Duplicate-the-exec-string-returned-by-gtk.patch b/meta/recipes-gnome/gtk+/gtk+-2.16.6/0001-bgo-584832-Duplicate-the-exec-string-returned-by-gtk.patch
deleted file mode 100644
index 7d39a77..0000000
--- a/meta/recipes-gnome/gtk+/gtk+-2.16.6/0001-bgo-584832-Duplicate-the-exec-string-returned-by-gtk.patch
+++ /dev/null
@@ -1,33 +0,0 @@
-From 69b9441eab2a7215509687dc22b48b6f212d22aa Mon Sep 17 00:00:00 2001
-From: Rob Bradford <rob@linux.intel.com>
-Date: Thu, 4 Jun 2009 15:43:20 +0100
-Subject: [PATCH] =?utf-8?q?bgo#584832=20=E2=80=93=20Duplicate=20the=20exec=20string=20returned=20by=20gtk=5Frecent=5Finfo=5Fget=5Fapplication=5Finfo?=
-MIME-Version: 1.0
-Content-Type: text/plain; charset=utf-8
-Content-Transfer-Encoding: 8bit
-
-This function states that the caller is responsible for freeing the string
-passed returned by reference. Unfortunately if you do this you get a crash
-since the internal value is returned without being duplicated.
----
- gtk/gtkrecentmanager.c |    2 +-
- 1 files changed, 1 insertions(+), 1 deletions(-)
-
-Upstream-Status: Pending
-
-diff --git a/gtk/gtkrecentmanager.c b/gtk/gtkrecentmanager.c
-index 317b3d5..d062572 100644
---- a/gtk/gtkrecentmanager.c
-+++ b/gtk/gtkrecentmanager.c
-@@ -1764,7 +1764,7 @@ gtk_recent_info_get_application_info (GtkRecentInfo  *info,
-     }
-   
-   if (app_exec)
--    *app_exec = ai->exec;
-+    *app_exec = g_strdup (ai->exec);
-   
-   if (count)
-     *count = ai->count;
--- 
-1.6.3.1
-
diff --git a/meta/recipes-gnome/gtk+/gtk+-2.16.6/cellrenderer-cairo.patch b/meta/recipes-gnome/gtk+/gtk+-2.16.6/cellrenderer-cairo.patch
deleted file mode 100644
index 2524b99..0000000
--- a/meta/recipes-gnome/gtk+/gtk+-2.16.6/cellrenderer-cairo.patch
+++ /dev/null
@@ -1,34 +0,0 @@
-Upstream-Status: Pending
-
-Index: gtk/gtkcellrenderer.c
-===================================================================
-RCS file: /cvs/gnome/gtk+/gtk/gtkcellrenderer.c,v
-retrieving revision 1.55
-diff -u -r1.55 gtkcellrenderer.c
---- gtk/gtkcellrenderer.c	14 May 2006 04:25:28 -0000	1.55
-+++ gtk/gtkcellrenderer.c	30 Jun 2006 10:57:43 -0000
-@@ -551,6 +551,7 @@
- 
-   if (cell->cell_background_set && !selected)
-     {
-+#ifdef USE_CAIRO_INTERNALLY
-       cairo_t *cr = gdk_cairo_create (window);
- 
-       gdk_cairo_rectangle (cr, background_area);
-@@ -558,6 +559,16 @@
-       cairo_fill (cr);
-       
-       cairo_destroy (cr);
-+#else
-+      GdkGC *gc;
-+
-+      gc = gdk_gc_new (window);
-+      gdk_gc_set_rgb_fg_color (gc, &priv->cell_background);
-+      gdk_draw_rectangle (window, gc, TRUE,
-+                          background_area->x, background_area->y,
-+                          background_area->width, background_area->height);
-+      g_object_unref (gc);
-+#endif
-     }
- 
-   GTK_CELL_RENDERER_GET_CLASS (cell)->render (cell,
diff --git a/meta/recipes-gnome/gtk+/gtk+-2.16.6/disable-gio-png-sniff-test.diff b/meta/recipes-gnome/gtk+/gtk+-2.16.6/disable-gio-png-sniff-test.diff
deleted file mode 100644
index c777b8e..0000000
--- a/meta/recipes-gnome/gtk+/gtk+-2.16.6/disable-gio-png-sniff-test.diff
+++ /dev/null
@@ -1,99 +0,0 @@
-Upstream-Status: Inappropriate [embedded specific]
-
-Index: gtk+-2.14.2/configure.in
-===================================================================
---- gtk+-2.14.2.orig/configure.in	2008-09-23 16:32:42.000000000 +0100
-+++ gtk+-2.14.2/configure.in	2008-09-23 16:37:13.000000000 +0100
-@@ -1025,48 +1025,50 @@
- # check one of the variables here
- AM_CONDITIONAL(INCLUDE_GDIPLUS, [test x"$INCLUDE_gdip_ico" = xyes])
- 
--if test x$gio_can_sniff = x; then
--  AC_MSG_CHECKING([if gio can sniff png])
--  gtk_save_LIBS="$LIBS"
--  gtk_save_CFLAGS="$CFLAGS"
--  LIBS="`$PKG_CONFIG --libs gio-2.0`"
--  CFLAGS="`$PKG_CONFIG --cflags gio-2.0`"
--  AC_RUN_IFELSE([AC_LANG_SOURCE([[
--  #include <gio/gio.h>
--  static const gsize data_size = 159;
--  static const guint8 data[] = 
--  {
--    0x89, 0x50, 0x4e, 0x47, 0x0d, 0x0a, 0x1a, 0x0a, 0x00, 0x00, 0x00, 0x0d, 
--    0x49, 0x48, 0x44, 0x52, 0x00, 0x00, 0x00, 0x01, 0x00, 0x00, 0x00, 0x01, 
--    0x08, 0x02, 0x00, 0x00, 0x00, 0x90, 0x77, 0x53, 0xde, 0x00, 0x00, 0x00, 
--    0x01, 0x73, 0x52, 0x47, 0x42, 0x00, 0xae, 0xce, 0x1c, 0xe9, 0x00, 0x00, 
--    0x00, 0x09, 0x70, 0x48, 0x59, 0x73, 0x00, 0x00, 0x0b, 0x13, 0x00, 0x00, 
--    0x0b, 0x13, 0x01, 0x00, 0x9a, 0x9c, 0x18, 0x00, 0x00, 0x00, 0x07, 0x74, 
--    0x49, 0x4d, 0x45, 0x07, 0xd8, 0x07, 0x0f, 0x10, 0x08, 0x15, 0x61, 0xd8, 
--    0x35, 0x37, 0x00, 0x00, 0x00, 0x19, 0x74, 0x45, 0x58, 0x74, 0x43, 0x6f, 
--    0x6d, 0x6d, 0x65, 0x6e, 0x74, 0x00, 0x43, 0x72, 0x65, 0x61, 0x74, 0x65, 
--    0x64, 0x20, 0x77, 0x69, 0x74, 0x68, 0x20, 0x47, 0x49, 0x4d, 0x50, 0x57, 
--    0x81, 0x0e, 0x17, 0x00, 0x00, 0x00, 0x0c, 0x49, 0x44, 0x41, 0x54, 0x08, 
--    0xd7, 0x63, 0xf8, 0xff, 0xff, 0x3f, 0x00, 0x05, 0xfe, 0x02, 0xfe, 0xdc, 
--    0xcc, 0x59, 0xe7, 0x00, 0x00, 0x00, 0x00, 0x49, 0x45, 0x4e, 0x44, 0xae, 
--    0x42, 0x60, 0x82
--  };
--  int
--  main (int argc, char **argv)
--  {
--    char *content_type;
--    char *image_png;
--    content_type = g_content_type_guess (NULL, data, data_size, NULL);  
--    image_png = g_content_type_from_mime_type ("image/png");
--    return !!strcmp (content_type, image_png);
--  }]])],
--    [gio_can_sniff=yes
--     AC_DEFINE(GDK_PIXBUF_USE_GIO_MIME, 1, [Define if gio can sniff image data])],
--    [gio_can_sniff=no])
--  AC_MSG_RESULT($gio_can_sniff)
--  LIBS="$gtk_save_LIBS"
--  CFLAGS="$gtk_save_CFLAGS"
--fi
-+# Disabled due to cross-compile
-+#if test x$gio_can_sniff = x; then
-+#  AC_MSG_CHECKING([if gio can sniff png])
-+#  gtk_save_LIBS="$LIBS"
-+#  gtk_save_CFLAGS="$CFLAGS"
-+#  LIBS="`$PKG_CONFIG --libs gio-2.0`"
-+#  CFLAGS="`$PKG_CONFIG --cflags gio-2.0`"
-+#  AC_RUN_IFELSE([AC_LANG_SOURCE([[
-+#  #include <gio/gio.h>
-+#  static const gsize data_size = 159;
-+#  static const guint8 data[] = 
-+#  {
-+#    0x89, 0x50, 0x4e, 0x47, 0x0d, 0x0a, 0x1a, 0x0a, 0x00, 0x00, 0x00, 0x0d, 
-+#    0x49, 0x48, 0x44, 0x52, 0x00, 0x00, 0x00, 0x01, 0x00, 0x00, 0x00, 0x01, 
-+#    0x08, 0x02, 0x00, 0x00, 0x00, 0x90, 0x77, 0x53, 0xde, 0x00, 0x00, 0x00, 
-+#    0x01, 0x73, 0x52, 0x47, 0x42, 0x00, 0xae, 0xce, 0x1c, 0xe9, 0x00, 0x00, 
-+#    0x00, 0x09, 0x70, 0x48, 0x59, 0x73, 0x00, 0x00, 0x0b, 0x13, 0x00, 0x00, 
-+#    0x0b, 0x13, 0x01, 0x00, 0x9a, 0x9c, 0x18, 0x00, 0x00, 0x00, 0x07, 0x74, 
-+#    0x49, 0x4d, 0x45, 0x07, 0xd8, 0x07, 0x0f, 0x10, 0x08, 0x15, 0x61, 0xd8, 
-+#    0x35, 0x37, 0x00, 0x00, 0x00, 0x19, 0x74, 0x45, 0x58, 0x74, 0x43, 0x6f, 
-+#    0x6d, 0x6d, 0x65, 0x6e, 0x74, 0x00, 0x43, 0x72, 0x65, 0x61, 0x74, 0x65, 
-+#    0x64, 0x20, 0x77, 0x69, 0x74, 0x68, 0x20, 0x47, 0x49, 0x4d, 0x50, 0x57, 
-+#    0x81, 0x0e, 0x17, 0x00, 0x00, 0x00, 0x0c, 0x49, 0x44, 0x41, 0x54, 0x08, 
-+#    0xd7, 0x63, 0xf8, 0xff, 0xff, 0x3f, 0x00, 0x05, 0xfe, 0x02, 0xfe, 0xdc, 
-+#    0xcc, 0x59, 0xe7, 0x00, 0x00, 0x00, 0x00, 0x49, 0x45, 0x4e, 0x44, 0xae, 
-+#    0x42, 0x60, 0x82
-+#  };
-+#  int
-+#  main (int argc, char **argv)
-+#  {
-+#    char *content_type;
-+#    char *image_png;
-+#    content_type = g_content_type_guess (NULL, data, data_size, NULL);  
-+#    image_png = g_content_type_from_mime_type ("image/png");
-+#    return !!strcmp (content_type, image_png);
-+#  }]])],
-+#    [gio_can_sniff=yes
-+#    [gio_can_sniff=no])
-+#  AC_MSG_RESULT($gio_can_sniff)
-+#  LIBS="$gtk_save_LIBS"
-+#  CFLAGS="$gtk_save_CFLAGS"
-+#fi
-+
-+AC_DEFINE(GDK_PIXBUF_USE_GIO_MIME, 1, [Define if gio can sniff image data])],
- 
- #
- # Allow building some or all immodules included
diff --git a/meta/recipes-gnome/gtk+/gtk+-2.16.6/entry-cairo.patch b/meta/recipes-gnome/gtk+/gtk+-2.16.6/entry-cairo.patch
deleted file mode 100644
index 3083b77..0000000
--- a/meta/recipes-gnome/gtk+/gtk+-2.16.6/entry-cairo.patch
+++ /dev/null
@@ -1,105 +0,0 @@
-Upstream-Status: Pending
-
-Index: gtk/gtkentry.c
-===================================================================
-RCS file: /cvs/gnome/gtk+/gtk/gtkentry.c,v
-retrieving revision 1.317
-diff -u -r1.317 gtkentry.c
---- gtk/gtkentry.c	29 Jun 2006 09:18:05 -0000	1.317
-+++ gtk/gtkentry.c	2 Jul 2006 14:14:24 -0000
-@@ -3337,7 +3337,9 @@
-   if (GTK_WIDGET_DRAWABLE (entry))
-     {
-       PangoLayout *layout = gtk_entry_ensure_layout (entry, TRUE);
-+#ifdef USE_CAIRO_INTERNALLY
-       cairo_t *cr;
-+#endif
-       gint x, y;
-       gint start_pos, end_pos;
-       
-@@ -3345,23 +3347,35 @@
-       
-       get_layout_position (entry, &x, &y);
- 
-+#ifdef USE_CAIRO_INTERNALLY
-       cr = gdk_cairo_create (entry->text_area);
- 
-       cairo_move_to (cr, x, y);
-       gdk_cairo_set_source_color (cr, &widget->style->text [widget->state]);
-       pango_cairo_show_layout (cr, layout);
-+#else
-+      gdk_draw_layout (entry->text_area, widget->style->text_gc [widget->state],
-+                       x, y,
-+                       layout);
-+#endif
- 
-       if (gtk_editable_get_selection_bounds (GTK_EDITABLE (entry), &start_pos, &end_pos))
- 	{
- 	  gint *ranges;
- 	  gint n_ranges, i;
-           PangoRectangle logical_rect;
--	  GdkColor *selection_color, *text_color;
-           GtkBorder inner_border;
-+#ifdef USE_CAIRO_INTERNALLY
-+	  GdkColor *selection_color, *text_color;
-+#else
-+	  GdkGC *selection_gc, *text_gc;
-+          GdkRegion *clip_region;
-+#endif
- 
- 	  pango_layout_get_pixel_extents (layout, NULL, &logical_rect);
- 	  gtk_entry_get_pixel_ranges (entry, &ranges, &n_ranges);
- 
-+#ifdef USE_CAIRO_INTERNALLY
- 	  if (GTK_WIDGET_HAS_FOCUS (entry))
- 	    {
- 	      selection_color = &widget->style->base [GTK_STATE_SELECTED];
-@@ -3390,11 +3404,46 @@
- 	  cairo_move_to (cr, x, y);
- 	  gdk_cairo_set_source_color (cr, text_color);
- 	  pango_cairo_show_layout (cr, layout);
--	  
-+#else
-+          if (GTK_WIDGET_HAS_FOCUS (entry))
-+            {
-+              selection_gc = widget->style->base_gc [GTK_STATE_SELECTED];
-+              text_gc = widget->style->text_gc [GTK_STATE_SELECTED];
-+            }
-+          else
-+            {
-+              selection_gc = widget->style->base_gc [GTK_STATE_ACTIVE];
-+              text_gc = widget->style->text_gc [GTK_STATE_ACTIVE];
-+            }
-+
-+          clip_region = gdk_region_new ();
-+          for (i = 0; i < n_ranges; ++i)
-+            {
-+              GdkRectangle rect;
-+
-+              rect.x = inner_border.left - entry->scroll_offset + ranges[2 * i];
-+              rect.y = y;
-+              rect.width = ranges[2 * i + 1];
-+              rect.height = logical_rect.height;
-+
-+              gdk_draw_rectangle (entry->text_area, selection_gc, TRUE,
-+                                  rect.x, rect.y, rect.width, rect.height);
-+
-+              gdk_region_union_with_rect (clip_region, &rect);
-+            }
-+
-+          gdk_gc_set_clip_region (text_gc, clip_region);
-+          gdk_draw_layout (entry->text_area, text_gc,
-+                           x, y,
-+                           layout);
-+          gdk_gc_set_clip_region (text_gc, NULL);
-+          gdk_region_destroy (clip_region);
-+#endif	  
- 	  g_free (ranges);
- 	}
--
-+#ifdef USE_CAIRO_INTERNALLY
-       cairo_destroy (cr);
-+#endif
-     }
- }
- 
diff --git a/meta/recipes-gnome/gtk+/gtk+-2.16.6/hardcoded_libtool.patch b/meta/recipes-gnome/gtk+/gtk+-2.16.6/hardcoded_libtool.patch
deleted file mode 100644
index e5bbe73..0000000
--- a/meta/recipes-gnome/gtk+/gtk+-2.16.6/hardcoded_libtool.patch
+++ /dev/null
@@ -1,33 +0,0 @@
-Upstream-Status: Inappropriate [embedded specific]
-
-Index: gtk+-2.14.2/configure.in
-===================================================================
---- gtk+-2.14.2.orig/configure.in	2008-09-23 15:52:44.000000000 +0100
-+++ gtk+-2.14.2/configure.in	2008-09-23 15:53:51.000000000 +0100
-@@ -401,7 +401,7 @@
- case $enable_explicit_deps in
-   auto)
-     export SED
--    deplibs_check_method=`(./libtool --config; echo 'eval echo \"$deplibs_check_method\"') | sh`
-+    deplibs_check_method=`(./$host_alias-libtool --config; echo 'eval echo \"$deplibs_check_method\"') | sh`
-     if test "x$deplibs_check_method" '!=' xpass_all || test "x$enable_static" = xyes ; then
-       enable_explicit_deps=yes  
-     else
-@@ -759,7 +759,7 @@
-     dnl Now we check to see if our libtool supports shared lib deps
-     dnl (in a rather ugly way even)
-     if $dynworks; then
--        pixbuf_libtool_config="${CONFIG_SHELL-/bin/sh} ./libtool --config"
-+        pixbuf_libtool_config="${CONFIG_SHELL-/bin/sh} $host_alias-libtool --config"
-         pixbuf_deplibs_check=`$pixbuf_libtool_config | \
-             grep '^[[a-z_]]*check[[a-z_]]*_method=[['\''"]]' | \
-             sed 's/.*[['\''"]]\(.*\)[['\''"]]$/\1/'`
-@@ -1893,7 +1893,7 @@
- # We are using gmodule-no-export now, but I'm leaving the stripping
- # code in place for now, since pango and atk still require gmodule.
- export SED
--export_dynamic=`(./libtool --config; echo eval echo \\$export_dynamic_flag_spec) | sh`
-+export_dynamic=`($host_alias-libtool --config; echo eval echo \\$export_dynamic_flag_spec) | sh`
- if test -n "$export_dynamic"; then
-   GDK_PIXBUF_DEP_LIBS=`echo $GDK_PIXBUF_DEP_LIBS | sed -e "s/$export_dynamic//"`
-   GDK_PIXBUF_XLIB_DEP_LIBS=`echo $GDK_PIXBUF_XLIB_DEP_LIBS | sed -e "s/$export_dynamic//"`
diff --git a/meta/recipes-gnome/gtk+/gtk+-2.16.6/no-demos.patch b/meta/recipes-gnome/gtk+/gtk+-2.16.6/no-demos.patch
deleted file mode 100644
index 67d4f74..0000000
--- a/meta/recipes-gnome/gtk+/gtk+-2.16.6/no-demos.patch
+++ /dev/null
@@ -1,12 +0,0 @@
-Upstream-Status: Inappropriate [configuration]
-
---- gtk+-2.10.1/Makefile.am.orig	2006-08-08 12:37:30.000000000 +0100
-+++ gtk+-2.10.1/Makefile.am	2006-08-08 12:37:48.000000000 +0100
-@@ -1,6 +1,6 @@
- ## Makefile.am for GTK+
- 
--SRC_SUBDIRS = gdk-pixbuf gdk gtk modules demos tests perf contrib
-+SRC_SUBDIRS = gdk-pixbuf gdk gtk modules tests perf contrib
- SUBDIRS = po po-properties $(SRC_SUBDIRS) docs m4macros
- 
- # require automake 1.4
diff --git a/meta/recipes-gnome/gtk+/gtk+-2.16.6/run-iconcache.patch b/meta/recipes-gnome/gtk+/gtk+-2.16.6/run-iconcache.patch
deleted file mode 100644
index f35884c..0000000
--- a/meta/recipes-gnome/gtk+/gtk+-2.16.6/run-iconcache.patch
+++ /dev/null
@@ -1,21 +0,0 @@
-Upstream-Status: Inappropriate [configuration]
-
---- /tmp/Makefile.am	2007-01-08 17:44:47.000000000 +0100
-+++ gtk+-2.10.7/gtk/Makefile.am	2007-01-08 17:45:17.025251000 +0100
-@@ -1128,11 +1128,11 @@
- 	   ./gtk-update-icon-cache
- endif
- 
--gtkbuiltincache.h: @REBUILD@ stamp-icons
--	$(MAKE) $(AM_MAKEFLAGS) gtk-update-icon-cache$(EXEEXT)
--	$(gtk_update_icon_cache_program) --force --ignore-theme-index		\
--	   --source builtin_icons stock-icons > gtkbuiltincache.h.tmp &&        \
--	mv gtkbuiltincache.h.tmp gtkbuiltincache.h
-+#gtkbuiltincache.h: @REBUILD@ stamp-icons
-+#	$(MAKE) $(AM_MAKEFLAGS) gtk-update-icon-cache$(EXEEXT)
-+#	$(gtk_update_icon_cache_program) --force --ignore-theme-index		\
-+#	   --source builtin_icons stock-icons > gtkbuiltincache.h.tmp &&        \
-+#	mv gtkbuiltincache.h.tmp gtkbuiltincache.h
- 
- EXTRA_DIST +=                   \
- 	$(STOCK_ICONS)		\
diff --git a/meta/recipes-gnome/gtk+/gtk+-2.16.6/toggle-font.diff b/meta/recipes-gnome/gtk+/gtk+-2.16.6/toggle-font.diff
deleted file mode 100644
index e1050bd..0000000
--- a/meta/recipes-gnome/gtk+/gtk+-2.16.6/toggle-font.diff
+++ /dev/null
@@ -1,102 +0,0 @@
-Upstream-Status: Pending
-
-Index: gtk/gtkcellrenderertoggle.c
-===================================================================
---- gtk/gtkcellrenderertoggle.c	(revision 18523)
-+++ gtk/gtkcellrenderertoggle.c	(working copy)
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
diff --git a/meta/recipes-gnome/gtk+/gtk+-2.16.6/xsettings.patch b/meta/recipes-gnome/gtk+/gtk+-2.16.6/xsettings.patch
deleted file mode 100644
index 98d3353..0000000
--- a/meta/recipes-gnome/gtk+/gtk+-2.16.6/xsettings.patch
+++ /dev/null
@@ -1,18 +0,0 @@
-Upstream-Status: Pending
-
---- gtk+-2.4.4/gdk/x11/gdkevents-x11.c.old	Sun Aug 22 17:14:00 2004
-+++ gtk+-2.4.4/gdk/x11/gdkevents-x11.c	Sun Aug 22 17:14:00 2004
-@@ -2827,10 +2827,9 @@
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
- static void 
diff --git a/meta/recipes-gnome/gtk+/gtk+_2.16.6.bb b/meta/recipes-gnome/gtk+/gtk+_2.16.6.bb
deleted file mode 100644
index 0b989da..0000000
--- a/meta/recipes-gnome/gtk+/gtk+_2.16.6.bb
+++ /dev/null
@@ -1,49 +0,0 @@
-require gtk+.inc
-
-PR = "r11"
-
-SRC_URI = "http://download.gnome.org/sources/gtk+/2.16/gtk+-${PV}.tar.bz2 \
-           file://xsettings.patch \
-           file://run-iconcache.patch \
-           file://hardcoded_libtool.patch \
-           file://no-demos.patch \
-           file://cellrenderer-cairo.patch;striplevel=0 \
-           file://toggle-font.diff;striplevel=0 \
-	   file://0001-bgo-584832-Duplicate-the-exec-string-returned-by-gtk.patch \
-            file://disable-gio-png-sniff-test.diff \
-	  "
-# TO MERGE
-#           file://entry-cairo.patch;striplevel=0
-#           file://filesystem-volumes.patch
-#           file://filechooser-props.patch
-#           file://filechooser-default.patch
-#           file://filechooser-sizefix.patch
-# temporary
-#           file://gtklabel-resize-patch
-#           file://menu-deactivate.patch
-#        file://combo-arrow-size.patch;striplevel=0
-
-
-
-EXTRA_OECONF = "--without-libtiff --without-libjasper --disable-xkb --disable-glibtest --disable-cups"
-
-LIBV = "2.10.0"
-
-PACKAGES_DYNAMIC += "gdk-pixbuf-loader-* gtk-immodule-* gtk-printbackend-*"
-
-python populate_packages_prepend () {
-    prologue = d.getVar("postinst_prologue", True)
-    postinst_pixbufloader = d.getVar("postinst_pixbufloader", True)
-
-    gtk_libdir = d.expand('${libdir}/gtk-2.0/${LIBV}')
-    loaders_root = os.path.join(gtk_libdir, 'loaders')
-    immodules_root = os.path.join(gtk_libdir, 'immodules')
-    printmodules_root = os.path.join(gtk_libdir, 'printbackends');
-
-    do_split_packages(d, loaders_root, '^libpixbufloader-(.*)\.so$', 'gdk-pixbuf-loader-%s', 'GDK pixbuf loader for %s', postinst_pixbufloader)
-    do_split_packages(d, immodules_root, '^im-(.*)\.so$', 'gtk-immodule-%s', 'GTK input module for %s', prologue + 'gtk-query-immodules-2.0 > /etc/gtk-2.0/gtk.immodules')
-    do_split_packages(d, printmodules_root, '^libprintbackend-(.*)\.so$', 'gtk-printbackend-%s', 'GTK printbackend module for %s')
-
-    if (d.getVar('DEBIAN_NAMES', True)):
-        d.setVar('PKG_${PN}', '${MLPREFIX}libgtk-2.0')
-}
-- 
1.7.10



