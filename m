Return-Path: <alex.kanavin@gmail.com>
Received: from mail-wr1-f68.google.com (mail-wr1-f68.google.com
	[209.85.221.68])
	by mail.openembedded.org (Postfix) with ESMTP id 1F7F26BF35
	for <openembedded-core@lists.openembedded.org>;
	Wed, 21 Nov 2018 17:03:09 +0000 (UTC)
Received: by mail-wr1-f68.google.com with SMTP id p4so6467063wrt.7
	for <openembedded-core@lists.openembedded.org>;
	Wed, 21 Nov 2018 09:03:10 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=from:to:cc:subject:date:message-id:in-reply-to:references;
	bh=XyPZP6aHtWOuxNyO41TvESQEQAklBn/rDYrmzOIdAjA=;
	b=aUP9nk5VZTxBabciMjxkAry+gGAoGokUeieXzIyl3OkaWt+E+TVs/4lZyUfB15A52E
	E/Dr+DBCvNHdvLwDX3qKOGdwQaHJkuasQ9ivE9pNHezUASfKgAFVqZaZLoUKImsvr6ry
	lRZ9T170qzWRuGcba122DUuIF5C+A8gwTb9ipeg9KX0qEZu9nbNJCkbtui6iBBvIrz+H
	UnjA7Sw2x69biln7iS47wRGPKTr4a+6UTK7VBWycE0l9XYuyVXtw+LfFdwn2JDl4RJe2
	oWE3aULEpYUxPf0kAHvNCzOC+jSEsvEP85ytmDDitihhfbUaYoHPf5AIgdrFGWd7iL4D
	NfEQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
	:references;
	bh=XyPZP6aHtWOuxNyO41TvESQEQAklBn/rDYrmzOIdAjA=;
	b=PLqFiJ5BnIBeM1lK51bWM4dElsXTon0n0g+AqlEe9YM8kOOky1FKWEbff5PSoa39bP
	2flfXz51U0OIdws0xglIilqrMaYmyFc43YaqnvlxWMvFOBu1klOV8eHzvxoka1rNugJn
	3d68fc27e+CiaCBMQavBAXpvnl2ENy2K9ITNSyGv5jk2zKqWTPcRSEg4UEKGFyLH28WX
	roroTCbHKzji0w1zfQy6RmnRxU5YhJh8LxbsitdxwhGBz2lVyBDPshXG8F5vJPmvj/qn
	gYqR1GyJ2+oq64yqPS+sYAYb44f3cjkaG3lJuCTE3X/+/WDPoMqknUcgZshhZ7+J/6/1
	d80w==
X-Gm-Message-State: AA+aEWbcRtl3MzAAzobVibmF2/5vy+lSZuxuyWBDU7JECvr6H0aQG0Yp
	3WNJs37mkFtESxaKLy9zFdnEMU6l
X-Google-Smtp-Source: AFSGD/WLoY3REJvxtLNVkxUun3u6vWPFJjzHzSItGkTD6UIZPeiQgZaCcibjO0OL0FF5aCdzPM/Jog==
X-Received: by 2002:a5d:4d11:: with SMTP id z17mr6376849wrt.209.1542819789447; 
	Wed, 21 Nov 2018 09:03:09 -0800 (PST)
Received: from alexander-box.luxoft.com ([62.96.135.139])
	by smtp.gmail.com with ESMTPSA id
	x12sm24076122wrt.20.2018.11.21.09.03.08
	(version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
	Wed, 21 Nov 2018 09:03:08 -0800 (PST)
From: Alexander Kanavin <alex.kanavin@gmail.com>
To: openembedded-core@lists.openembedded.org
Date: Wed, 21 Nov 2018 18:02:59 +0100
Message-Id: <20181121170259.10557-4-alex.kanavin@gmail.com>
X-Mailer: git-send-email 2.17.1
In-Reply-To: <20181121170259.10557-1-alex.kanavin@gmail.com>
References: <20181121170259.10557-1-alex.kanavin@gmail.com>
Subject: [PATCH 4/4] gtk+3: update to 3.24.1
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
X-List-Received-Date: Wed, 21 Nov 2018 17:03:09 -0000

Signed-off-by: Alexander Kanavin <alex.kanavin@gmail.com>
---
 ...-Add-disable-opengl-configure-option.patch | 103 +++++++++---------
 .../{gtk+3_3.22.30.bb => gtk+3_3.24.1.bb}     |   4 +-
 2 files changed, 52 insertions(+), 55 deletions(-)
 rename meta/recipes-gnome/gtk+/{gtk+3_3.22.30.bb => gtk+3_3.24.1.bb} (83%)

diff --git a/meta/recipes-gnome/gtk+/gtk+3/0003-Add-disable-opengl-configure-option.patch b/meta/recipes-gnome/gtk+/gtk+3/0003-Add-disable-opengl-configure-option.patch
index d2f12dc7ff4..e5a67d098e7 100644
--- a/meta/recipes-gnome/gtk+/gtk+3/0003-Add-disable-opengl-configure-option.patch
+++ b/meta/recipes-gnome/gtk+/gtk+3/0003-Add-disable-opengl-configure-option.patch
@@ -1,7 +1,7 @@
-From de36df70d87ba3453ed4f2b92e990021c67238f5 Mon Sep 17 00:00:00 2001
+From 9e243474eea4330b593e0f6dd418b61b79699d8b Mon Sep 17 00:00:00 2001
 From: Jussi Kukkonen <jussi.kukkonen@intel.com>
 Date: Tue, 21 Jun 2016 15:11:39 +0300
-Subject: [PATCH 3/4] Add --disable-opengl configure option
+Subject: [PATCH] Add --disable-opengl configure option
 
 --disable-opengl will remove the dependency on libepoxy and on the
 OpenGL APIs. This is useful for those who want to keep using gtk+3
@@ -21,32 +21,32 @@ Upstream-Status: Inappropriate [Evil eye expected from upstream]
 Signed-off-by: Jussi Kukkonen <jussi.kukkonen@intel.com>
 
 ---
- configure.ac                               | 13 +++++--
- demos/gtk-demo/glarea.c                    | 14 ++++++++
- docs/tools/Makefile.am                     |  9 +++--
- docs/tools/widgets.c                       |  4 ++-
- gdk/gdkdisplay.c                           |  4 ++-
- gdk/gdkgl.c                                | 10 ++++++
- gdk/gdkglcontext.c                         |  6 ++++
- gdk/gdkwindow.c                            | 13 +++++++
- gdk/x11/Makefile.am                        | 30 +++++++++++++---
- gdk/x11/gdkdisplay-x11.c                   |  6 +++-
- gdk/x11/gdkscreen-x11.c                    |  5 +++
- gdk/x11/gdkwindow-x11.c                    |  4 +++
- gdk/x11/gdkx-autocleanups.h                |  2 ++
+ configure.ac                               | 13 ++++-
+ demos/gtk-demo/glarea.c                    | 14 ++++++
+ docs/tools/Makefile.am                     |  9 +++-
+ docs/tools/widgets.c                       |  4 +-
+ gdk/gdkdisplay.c                           |  4 +-
+ gdk/gdkgl.c                                | 10 ++++
+ gdk/gdkglcontext.c                         |  6 +++
+ gdk/gdkwindow.c                            | 13 +++++
+ gdk/x11/Makefile.am                        | 30 +++++++++--
+ gdk/x11/gdkdisplay-x11.c                   |  6 ++-
+ gdk/x11/gdkscreen-x11.c                    |  5 ++
+ gdk/x11/gdkwindow-x11.c                    |  4 ++
+ gdk/x11/gdkx-autocleanups.h                |  2 +
  gdk/x11/{gdkx.h => gdkx-with-gl-context.h} |  1 -
- gdk/x11/gdkx-without-gl-context.h          | 58 ++++++++++++++++++++++++++++++
+ gdk/x11/gdkx-without-gl-context.h          | 58 ++++++++++++++++++++++
  gtk/Makefile.am                            |  3 +-
- gtk/gtkglarea.c                            | 20 ++++++++++-
- gtk/inspector/general.c                    |  6 ++++
- tests/Makefile.am                          | 10 ++++--
- testsuite/gtk/objects-finalize.c           |  2 ++
+ gtk/gtkglarea.c                            | 20 +++++++-
+ gtk/inspector/general.c                    |  6 +++
+ tests/Makefile.am                          | 10 ++--
+ testsuite/gtk/objects-finalize.c           |  2 +
  20 files changed, 202 insertions(+), 18 deletions(-)
  rename gdk/x11/{gdkx.h => gdkx-with-gl-context.h} (98%)
  create mode 100644 gdk/x11/gdkx-without-gl-context.h
 
 diff --git a/configure.ac b/configure.ac
-index 0a48875..6f0a3a6 100644
+index a91b29c..561d3b5 100644
 --- a/configure.ac
 +++ b/configure.ac
 @@ -351,6 +351,15 @@ AC_ARG_ENABLE(cloudproviders,
@@ -65,7 +65,7 @@ index 0a48875..6f0a3a6 100644
  AC_ARG_ENABLE(glx,
                [AS_HELP_STRING([--enable-glx],
                                [When enabled Gdk will try to initialize GLX])])
-@@ -1372,7 +1381,7 @@ CFLAGS="$saved_cflags"
+@@ -1381,7 +1390,7 @@ CFLAGS="$saved_cflags"
  LDFLAGS="$saved_ldflags"
  
  GDK_PACKAGES="$PANGO_PACKAGES gdk-pixbuf-2.0 >= gdk_pixbuf_required_version cairo >= cairo_required_version cairo-gobject >= cairo_required_version"
@@ -74,7 +74,7 @@ index 0a48875..6f0a3a6 100644
  
  PKG_CHECK_MODULES(GDK_DEP, $GDK_PACKAGES $GDK_PRIVATE_PACKAGES)
  GDK_DEP_LIBS="$GDK_EXTRA_LIBS $GDK_DEP_LIBS $MATH_LIB"
-@@ -1406,7 +1415,7 @@ fi
+@@ -1415,7 +1424,7 @@ fi
  PKG_CHECK_MODULES(ATK, $ATK_PACKAGES)
  
  GTK_PACKAGES="atk >= atk_required_version cairo >= cairo_required_version cairo-gobject >= cairo_required_version gdk-pixbuf-2.0 >= gdk_pixbuf_required_version gio-2.0 >= glib_required_version"
@@ -224,12 +224,12 @@ index 40225e9..c55e1de 100644
  
  GdkRenderingMode
 diff --git a/gdk/gdkgl.c b/gdk/gdkgl.c
-index 8e7b8c2..b579b22 100644
+index 933e204..1767508 100644
 --- a/gdk/gdkgl.c
 +++ b/gdk/gdkgl.c
-@@ -22,7 +22,9 @@
- 
- #include "gdkinternals.h"
+@@ -26,7 +26,9 @@
+ # include "win32/gdkwin32.h"
+ #endif
  
 +#ifdef HAVE_OPENGL
  #include <epoxy/gl.h>
@@ -237,7 +237,7 @@ index 8e7b8c2..b579b22 100644
  #include <math.h>
  #include <string.h>
  
-@@ -36,6 +38,7 @@ gdk_cairo_surface_mark_as_direct (cairo_surface_t *surface,
+@@ -40,6 +42,7 @@ gdk_cairo_surface_mark_as_direct (cairo_surface_t *surface,
                                 g_object_ref (window),  g_object_unref);
  }
  
@@ -245,7 +245,7 @@ index 8e7b8c2..b579b22 100644
  static const char *
  get_vertex_type_name (int type)
  {
-@@ -208,6 +211,7 @@ use_texture_rect_program (GdkGLContextPaintData *paint_data)
+@@ -212,6 +215,7 @@ use_texture_rect_program (GdkGLContextPaintData *paint_data)
        glUseProgram (paint_data->current_program->program);
      }
  }
@@ -253,7 +253,7 @@ index 8e7b8c2..b579b22 100644
  
  void
  gdk_gl_texture_quads (GdkGLContext *paint_context,
-@@ -216,6 +220,7 @@ gdk_gl_texture_quads (GdkGLContext *paint_context,
+@@ -220,6 +224,7 @@ gdk_gl_texture_quads (GdkGLContext *paint_context,
                        GdkTexturedQuad *quads,
                        gboolean flip_colors)
  {
@@ -261,7 +261,7 @@ index 8e7b8c2..b579b22 100644
    GdkGLContextPaintData *paint_data  = gdk_gl_context_get_paint_data (paint_context);
    GdkGLContextProgram *program;
    GdkWindow *window = gdk_gl_context_get_window (paint_context);
-@@ -289,6 +294,7 @@ gdk_gl_texture_quads (GdkGLContext *paint_context,
+@@ -293,6 +298,7 @@ gdk_gl_texture_quads (GdkGLContext *paint_context,
  
    glDisableVertexAttribArray (program->position_location);
    glDisableVertexAttribArray (program->uv_location);
@@ -269,7 +269,7 @@ index 8e7b8c2..b579b22 100644
  }
  
  /* x,y,width,height describes a rectangle in the gl render buffer
-@@ -337,6 +343,7 @@ gdk_cairo_draw_from_gl (cairo_t              *cr,
+@@ -341,6 +347,7 @@ gdk_cairo_draw_from_gl (cairo_t              *cr,
                          int                   width,
                          int                   height)
  {
@@ -277,7 +277,7 @@ index 8e7b8c2..b579b22 100644
    GdkGLContext *paint_context;
    cairo_surface_t *image;
    cairo_matrix_t matrix;
-@@ -707,6 +714,7 @@ out:
+@@ -718,6 +725,7 @@ out:
    if (clip_region)
      cairo_region_destroy (clip_region);
  
@@ -285,7 +285,7 @@ index 8e7b8c2..b579b22 100644
  }
  
  /* This is always called with the paint context current */
-@@ -714,6 +722,7 @@ void
+@@ -725,6 +733,7 @@ void
  gdk_gl_texture_from_surface (cairo_surface_t *surface,
  			     cairo_region_t  *region)
  {
@@ -293,14 +293,14 @@ index 8e7b8c2..b579b22 100644
    GdkGLContext *paint_context;
    cairo_surface_t *image;
    double device_x_offset, device_y_offset;
-@@ -814,4 +823,5 @@ gdk_gl_texture_from_surface (cairo_surface_t *surface,
+@@ -825,4 +834,5 @@ gdk_gl_texture_from_surface (cairo_surface_t *surface,
  
    glDisable (GL_SCISSOR_TEST);
    glDeleteTextures (1, &texture_id);
 +#endif
  }
 diff --git a/gdk/gdkglcontext.c b/gdk/gdkglcontext.c
-index c79dca0..8a7bec2 100644
+index dfbed63..556f0a3 100644
 --- a/gdk/gdkglcontext.c
 +++ b/gdk/gdkglcontext.c
 @@ -85,7 +85,9 @@
@@ -337,7 +337,7 @@ index c79dca0..8a7bec2 100644
    GdkGLContextPrivate *priv = gdk_gl_context_get_instance_private (context);
    gboolean has_npot, has_texture_rectangle;
  
-@@ -847,6 +852,7 @@ gdk_gl_context_check_extensions (GdkGLContext *context)
+@@ -853,6 +858,7 @@ gdk_gl_context_check_extensions (GdkGLContext *context)
                         priv->use_texture_rectangle ? "yes" : "no"));
  
    priv->extensions_checked = TRUE;
@@ -346,7 +346,7 @@ index c79dca0..8a7bec2 100644
  
  /**
 diff --git a/gdk/gdkwindow.c b/gdk/gdkwindow.c
-index c0e0a7d..437ab03 100644
+index 6b231f0..904b86d 100644
 --- a/gdk/gdkwindow.c
 +++ b/gdk/gdkwindow.c
 @@ -45,7 +45,9 @@
@@ -478,7 +478,7 @@ index 6289f3a..cbbac79 100644
 +
  -include $(top_srcdir)/git.mk
 diff --git a/gdk/x11/gdkdisplay-x11.c b/gdk/x11/gdkdisplay-x11.c
-index e9a263f..2829a31 100644
+index 659b9fa..b15536b 100644
 --- a/gdk/x11/gdkdisplay-x11.c
 +++ b/gdk/x11/gdkdisplay-x11.c
 @@ -37,7 +37,9 @@
@@ -491,7 +491,7 @@ index e9a263f..2829a31 100644
  #include "gdk-private.h"
  
  #include <glib.h>
-@@ -3169,7 +3171,9 @@ gdk_x11_display_class_init (GdkX11DisplayClass * class)
+@@ -3194,7 +3196,9 @@ gdk_x11_display_class_init (GdkX11DisplayClass * class)
    display_class->text_property_to_utf8_list = _gdk_x11_display_text_property_to_utf8_list;
    display_class->utf8_to_string_target = _gdk_x11_display_utf8_to_string_target;
  
@@ -503,10 +503,10 @@ index e9a263f..2829a31 100644
    display_class->get_default_seat = gdk_x11_display_get_default_seat;
  
 diff --git a/gdk/x11/gdkscreen-x11.c b/gdk/x11/gdkscreen-x11.c
-index 7bf9979..cd1cc9d 100644
+index 272cecd..2bb34ac 100644
 --- a/gdk/x11/gdkscreen-x11.c
 +++ b/gdk/x11/gdkscreen-x11.c
-@@ -1643,3 +1643,8 @@ gdk_x11_screen_get_current_desktop (GdkScreen *screen)
+@@ -1675,3 +1675,8 @@ gdk_x11_screen_get_current_desktop (GdkScreen *screen)
  {
    return get_netwm_cardinal_property (screen, "_NET_CURRENT_DESKTOP");
  }
@@ -516,7 +516,7 @@ index 7bf9979..cd1cc9d 100644
 +void _gdk_x11_screen_update_visuals_for_gl (GdkScreen *screen) {}
 +#endif
 diff --git a/gdk/x11/gdkwindow-x11.c b/gdk/x11/gdkwindow-x11.c
-index 3d6fd3b..2bd5c87 100644
+index c6205e4..df2334f 100644
 --- a/gdk/x11/gdkwindow-x11.c
 +++ b/gdk/x11/gdkwindow-x11.c
 @@ -36,7 +36,9 @@
@@ -529,7 +529,7 @@ index 3d6fd3b..2bd5c87 100644
  #include "gdkprivate-x11.h"
  #include "gdk-private.h"
  
-@@ -5801,7 +5803,9 @@ gdk_window_impl_x11_class_init (GdkWindowImplX11Class *klass)
+@@ -5804,7 +5806,9 @@ gdk_window_impl_x11_class_init (GdkWindowImplX11Class *klass)
    impl_class->set_opaque_region = gdk_x11_window_set_opaque_region;
    impl_class->set_shadow_width = gdk_x11_window_set_shadow_width;
    impl_class->show_window_menu = gdk_x11_window_show_window_menu;
@@ -633,10 +633,10 @@ index 0000000..c9e2617
 +
 +#endif /* __GDK_X_H__ */
 diff --git a/gtk/Makefile.am b/gtk/Makefile.am
-index 842c2f9..0921bc7 100644
+index 5594429..2259bb3 100644
 --- a/gtk/Makefile.am
 +++ b/gtk/Makefile.am
-@@ -1416,14 +1416,13 @@ gtkprivatetypebuiltins.c: $(gtk_private_type_h_sources)  gtkprivatetypebuiltins.
+@@ -1434,14 +1434,13 @@ gtkprivatetypebuiltins.c: $(gtk_private_type_h_sources)  gtkprivatetypebuiltins.
  	&& cp xgen-gptbc gtkprivatetypebuiltins.c  \
  	&& rm -f xgen-gptbc
  
@@ -650,10 +650,10 @@ index 842c2f9..0921bc7 100644
 -	  $(SED) '{ s/^/*tp++ = /; s/$$/();/; s/^.*\(gdk_x11\|gtk_plug_\|gtk_socket_\).*$$/#ifdef GDK_WINDOWING_X11\n&\n#endif/; }' >> xgen-gtf \
 +	  $(SED) '{ s/^/*tp++ = /; s/$$/();/; s/^.*\(gdk_x11\|gtk_plug_\|gtk_socket_\).*$$/#ifdef GDK_WINDOWING_X11\n&\n#endif/; s/^.*gdk_x11_gl.*$$/#ifdef HAVE_OPENGL\n&\n#endif/; }' >> xgen-gtf \
  	&& cp xgen-gtf $@ && rm -f xgen-gtf
- gtktestutils.c: gtktypefuncs.c
+ $(srcdir)/gtktestutils.c: gtktypefuncs.c
  
 diff --git a/gtk/gtkglarea.c b/gtk/gtkglarea.c
-index 094378e..f7c7f47 100644
+index ea383c0..bb4eb64 100644
 --- a/gtk/gtkglarea.c
 +++ b/gtk/gtkglarea.c
 @@ -28,7 +28,9 @@
@@ -796,7 +796,7 @@ index c241ec8..24576dd 100644
    if (GDK_IS_WAYLAND_DISPLAY (gdk_display_get_default ()))
      {
 diff --git a/tests/Makefile.am b/tests/Makefile.am
-index e2db6e4..e51cf34 100644
+index 7c5ca99..e4a4546 100644
 --- a/tests/Makefile.am
 +++ b/tests/Makefile.am
 @@ -80,8 +80,6 @@ noinst_PROGRAMS =  $(TEST_PROGS)	\
@@ -808,7 +808,7 @@ index e2db6e4..e51cf34 100644
  	testgrid			\
  	testgtk				\
  	testheaderbar			\
-@@ -170,12 +168,18 @@ noinst_PROGRAMS =  $(TEST_PROGS)	\
+@@ -172,12 +170,18 @@ noinst_PROGRAMS =  $(TEST_PROGS)	\
  	testactionbar			\
  	testwindowsize			\
  	testpopover			\
@@ -842,6 +842,3 @@ index 0b3a519..07b096f 100644
  #endif
  	  /* Not allowed to finalize a GdkPixbufLoader without calling gdk_pixbuf_loader_close() */
  	  all_types[i] != GDK_TYPE_PIXBUF_LOADER &&
--- 
-2.14.1
-
diff --git a/meta/recipes-gnome/gtk+/gtk+3_3.22.30.bb b/meta/recipes-gnome/gtk+/gtk+3_3.24.1.bb
similarity index 83%
rename from meta/recipes-gnome/gtk+/gtk+3_3.22.30.bb
rename to meta/recipes-gnome/gtk+/gtk+3_3.24.1.bb
index 697b518544d..6de3e73f2f0 100644
--- a/meta/recipes-gnome/gtk+/gtk+3_3.22.30.bb
+++ b/meta/recipes-gnome/gtk+/gtk+3_3.24.1.bb
@@ -7,8 +7,8 @@ SRC_URI = "http://ftp.gnome.org/pub/gnome/sources/gtk+/${MAJ_VER}/gtk+-${PV}.tar
            file://0002-Do-not-try-to-initialize-GL-without-libGL.patch \
            file://0003-Add-disable-opengl-configure-option.patch \
           "
-SRC_URI[md5sum] = "61e60dc073e0a6893c72043d20579dc0"
-SRC_URI[sha256sum] = "a1a4a5c12703d4e1ccda28333b87ff462741dc365131fbc94c218ae81d9a6567"
+SRC_URI[md5sum] = "9dfe16f486573815f242fa400763feb7"
+SRC_URI[sha256sum] = "68387be307b99aadcdc653561d7a2a7f0113b93561fb18ded7075ec9ced5b02f"
 
 S = "${WORKDIR}/gtk+-${PV}"
 
-- 
2.17.1


