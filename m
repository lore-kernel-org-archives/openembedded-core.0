Return-Path: <alex.kanavin@gmail.com>
Received: from mail-wr1-f44.google.com (mail-wr1-f44.google.com
	[209.85.221.44])
	by mail.openembedded.org (Postfix) with ESMTP id 434857E995
	for <openembedded-core@lists.openembedded.org>;
	Mon,  2 Dec 2019 17:55:18 +0000 (UTC)
Received: by mail-wr1-f44.google.com with SMTP id c14so221527wrn.7
	for <openembedded-core@lists.openembedded.org>;
	Mon, 02 Dec 2019 09:55:19 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=from:to:cc:subject:date:message-id:in-reply-to:references;
	bh=nXdiAQFEB0kf66IUAkUz1iiwuOM+lSdvlUVKniibi48=;
	b=WTZlGS5/fcTJNfVIlbiguW2lvn2vhiyEqPET91Bfd6WdZqd+PFFZxA75cyT6OKNOkp
	e11Vvre9PLG2B5Lt5eJG7BHcVhAdJ3KaXa01oSHuCO35g5mMUHl+8XQMWB0PdH1iKZNK
	foeTj+1FVUwwcNZQfOUwIXlerla9FTviYl1wJgzdh7r7fX5ibodPx9L9f5prdmpf1Yxc
	Hdf1hU7RnT7Af8AyCLq2M0vu2H8Clo4+chXI3/Y+9zoyLcjXWLIy7rCSbdtBY9WiKp41
	SH8WwsKGVnshf1bvUxnB3BhhojVqdTCCd3EK4s805gUSmbvL7JEVUAk8JzAj12/coSWL
	qiJQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
	:references;
	bh=nXdiAQFEB0kf66IUAkUz1iiwuOM+lSdvlUVKniibi48=;
	b=E8fxAN0cbQ9cUq3lt6vHkI6rzme0lMwFEYYBvQUkUR7bPQy2DqtXevs0Mcc/7+rg7R
	Yf7jO2QiMrvo2zHJ16PgqtChQH3YaSCfD2aFVPcQZ78PRTaDpS54GHwnozh8NDM8SzfI
	WFR9ILuyl9nzO6X6ue3Bo4hb6iFfL/O9nvkZKg6ulhxSAiiG9xMb4QrRnmAsbfr/b45U
	sdq/Al0B1Rb1pHO9u+H6O9/fmeJuBRUzUnxcz869mifYsyEK4Fnwzn3FmZoZsAeUK8Vw
	BEseXQb5agT9aCopVUk+TzescYjBHk7ee12N8R/7UHyFGm/IFwxcepz5af/vZqVfSkax
	vU+Q==
X-Gm-Message-State: APjAAAVjo1i37Utw6wWdufyhJZQdoDuYYYFmvJVVg2hxWTgjvao/vtIP
	MLtPzh47Ftt9fdq0UZo0OZosjil+
X-Google-Smtp-Source: APXvYqy+nVlZs+HYZaZg6xThHsXncgfEXv2x7LxLIu6JoO3/PbtJsHYBcL6aBFWsEGaSWfT0bgHqzw==
X-Received: by 2002:adf:e3d0:: with SMTP id k16mr92967wrm.241.1575309318762;
	Mon, 02 Dec 2019 09:55:18 -0800 (PST)
Received: from alexander-box.rd.corpintra.net ([141.113.66.202])
	by smtp.gmail.com with ESMTPSA id y8sm144069wru.59.2019.12.02.09.55.17
	(version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
	Mon, 02 Dec 2019 09:55:18 -0800 (PST)
From: Alexander Kanavin <alex.kanavin@gmail.com>
To: openembedded-core@lists.openembedded.org
Date: Mon,  2 Dec 2019 18:54:56 +0100
Message-Id: <20191202175459.112655-15-alex.kanavin@gmail.com>
X-Mailer: git-send-email 2.17.1
In-Reply-To: <20191202175459.112655-1-alex.kanavin@gmail.com>
References: <20191202175459.112655-1-alex.kanavin@gmail.com>
Subject: [PATCH 15/18] gtk+3: update to 3.24.13
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
X-List-Received-Date: Mon, 02 Dec 2019 17:55:19 -0000

Signed-off-by: Alexander Kanavin <alex.kanavin@gmail.com>
---
 ...t-try-to-initialize-GL-without-libGL.patch |  15 +--
 ...-Add-disable-opengl-configure-option.patch | 103 ++++++++----------
 .../{gtk+3_3.24.8.bb => gtk+3_3.24.13.bb}     |   4 +-
 3 files changed, 56 insertions(+), 66 deletions(-)
 rename meta/recipes-gnome/gtk+/{gtk+3_3.24.8.bb => gtk+3_3.24.13.bb} (84%)

diff --git a/meta/recipes-gnome/gtk+/gtk+3/0002-Do-not-try-to-initialize-GL-without-libGL.patch b/meta/recipes-gnome/gtk+/gtk+3/0002-Do-not-try-to-initialize-GL-without-libGL.patch
index cc7edf7607c..80dc2d7a05b 100644
--- a/meta/recipes-gnome/gtk+/gtk+3/0002-Do-not-try-to-initialize-GL-without-libGL.patch
+++ b/meta/recipes-gnome/gtk+/gtk+3/0002-Do-not-try-to-initialize-GL-without-libGL.patch
@@ -1,7 +1,7 @@
-From 23a563155406980dfc8cf6f7c2da6cce0ac310f0 Mon Sep 17 00:00:00 2001
+From 6575ab0f0e8c1bba033ad1616511e37a2ec995ff Mon Sep 17 00:00:00 2001
 From: Jussi Kukkonen <jussi.kukkonen@intel.com>
 Date: Fri, 16 Oct 2015 16:35:16 +0300
-Subject: [PATCH 2/4] Do not try to initialize GL without libGL
+Subject: [PATCH] Do not try to initialize GL without libGL
 
 _gdk_x11_screen_update_visuals_for_gl() will end up calling epoxys
 GLX api which will exit() if libGL.so.1 is not present. We do not
@@ -22,10 +22,10 @@ Signed-off-by: Jussi Kukkonen <jussi.kukkonen@intel.com>
  2 files changed, 11 insertions(+)
 
 diff --git a/configure.ac b/configure.ac
-index 757fd7c..0a48875 100644
+index e9f5583..bd651bb 100644
 --- a/configure.ac
 +++ b/configure.ac
-@@ -351,6 +351,12 @@ AC_ARG_ENABLE(cloudproviders,
+@@ -346,6 +346,12 @@ AC_ARG_ENABLE(cloudproviders,
                [AS_HELP_STRING([--enable-cloudproviders],
                                [enable libcloudproviders integration])],
                                [cloudproviders_set=yes])
@@ -36,8 +36,8 @@ index 757fd7c..0a48875 100644
 +  AC_DEFINE([HAVE_GLX], [], [GLX will be available at runtime])
 +])
  
- if test -z "$backend_set"; then
-   if test "$platform_win32" = yes; then
+ AC_ARG_ENABLE(profiler,
+               [AS_HELP_STRING([--enable-profiler],
 diff --git a/gdk/x11/gdkvisual-x11.c b/gdk/x11/gdkvisual-x11.c
 index 81479d8..3c8c5c0 100644
 --- a/gdk/x11/gdkvisual-x11.c
@@ -55,6 +55,3 @@ index 81479d8..3c8c5c0 100644
  }
  
  gint
--- 
-2.14.1
-
diff --git a/meta/recipes-gnome/gtk+/gtk+3/0003-Add-disable-opengl-configure-option.patch b/meta/recipes-gnome/gtk+/gtk+3/0003-Add-disable-opengl-configure-option.patch
index 852dc9dfcd3..398c9bc36a1 100644
--- a/meta/recipes-gnome/gtk+/gtk+3/0003-Add-disable-opengl-configure-option.patch
+++ b/meta/recipes-gnome/gtk+/gtk+3/0003-Add-disable-opengl-configure-option.patch
@@ -1,4 +1,4 @@
-From d11b41a7ff0234f3832d6aabdf498807d1463c18 Mon Sep 17 00:00:00 2001
+From f83fcf1991afad6d9c15546b2ccd775dad4e314c Mon Sep 17 00:00:00 2001
 From: Jussi Kukkonen <jussi.kukkonen@intel.com>
 Date: Tue, 21 Jun 2016 15:11:39 +0300
 Subject: [PATCH] Add --disable-opengl configure option
@@ -37,20 +37,20 @@ Signed-off-by: Jussi Kukkonen <jussi.kukkonen@intel.com>
  gdk/x11/gdkx-autocleanups.h                |  2 +
  gdk/x11/{gdkx.h => gdkx-with-gl-context.h} |  1 -
  gdk/x11/gdkx-without-gl-context.h          | 58 ++++++++++++++++++++++
- gtk/Makefile.am                            |  3 +-
+ gtk/Makefile.am                            |  2 +-
  gtk/gtkglarea.c                            | 20 +++++++-
  gtk/inspector/general.c                    |  6 +++
  tests/Makefile.am                          | 10 ++--
  testsuite/gtk/objects-finalize.c           |  2 +
- 21 files changed, 208 insertions(+), 20 deletions(-)
+ 21 files changed, 208 insertions(+), 19 deletions(-)
  rename gdk/x11/{gdkx.h => gdkx-with-gl-context.h} (98%)
  create mode 100644 gdk/x11/gdkx-without-gl-context.h
 
 diff --git a/configure.ac b/configure.ac
-index 2c4733b..18ae66c 100644
+index bd651bb..b4c061f 100644
 --- a/configure.ac
 +++ b/configure.ac
-@@ -352,6 +352,15 @@ AC_ARG_ENABLE(cloudproviders,
+@@ -346,6 +346,15 @@ AC_ARG_ENABLE(cloudproviders,
                [AS_HELP_STRING([--enable-cloudproviders],
                                [enable libcloudproviders integration])],
                                [cloudproviders_set=yes])
@@ -66,21 +66,21 @@ index 2c4733b..18ae66c 100644
  AC_ARG_ENABLE(glx,
                [AS_HELP_STRING([--enable-glx],
                                [When enabled Gdk will try to initialize GLX])])
-@@ -1370,7 +1379,7 @@ CFLAGS="$saved_cflags"
+@@ -1345,7 +1354,7 @@ CFLAGS="$saved_cflags"
  LDFLAGS="$saved_ldflags"
  
  GDK_PACKAGES="$PANGO_PACKAGES gdk-pixbuf-2.0 >= gdk_pixbuf_required_version cairo >= cairo_required_version cairo-gobject >= cairo_required_version"
--GDK_PRIVATE_PACKAGES="$GDK_GIO_PACKAGE $X_PACKAGES $WAYLAND_PACKAGES $MIR_PACKAGES $cairo_backends epoxy >= epoxy_required_version $CLOUDPROVIDER_PACKAGES fribidi >= fribidi_required_version"
-+GDK_PRIVATE_PACKAGES="$GDK_GIO_PACKAGE $X_PACKAGES $WAYLAND_PACKAGES $MIR_PACKAGES $cairo_backends $EPOXY_PACKAGES $CLOUDPROVIDER_PACKAGES fribidi >= fribidi_required_version"
+-GDK_PRIVATE_PACKAGES="$GDK_GIO_PACKAGE $X_PACKAGES $WAYLAND_PACKAGES $cairo_backends epoxy >= epoxy_required_version $CLOUDPROVIDER_PACKAGES $PROFILER_PACKAGES fribidi >= fribidi_required_version"
++GDK_PRIVATE_PACKAGES="$GDK_GIO_PACKAGE $X_PACKAGES $WAYLAND_PACKAGES $cairo_backends $EPOXY_PACKAGES $CLOUDPROVIDER_PACKAGES $PROFILER_PACKAGES fribidi >= fribidi_required_version"
  
  PKG_CHECK_MODULES(GDK_DEP, $GDK_PACKAGES $GDK_PRIVATE_PACKAGES)
  GDK_DEP_LIBS="$GDK_EXTRA_LIBS $GDK_DEP_LIBS $MATH_LIB"
-@@ -1404,7 +1413,7 @@ fi
+@@ -1379,7 +1388,7 @@ fi
  PKG_CHECK_MODULES(ATK, $ATK_PACKAGES)
  
  GTK_PACKAGES="atk >= atk_required_version cairo >= cairo_required_version cairo-gobject >= cairo_required_version gdk-pixbuf-2.0 >= gdk_pixbuf_required_version gio-2.0 >= glib_required_version"
--GTK_PRIVATE_PACKAGES="$ATK_PACKAGES $WAYLAND_PACKAGES $MIR_PACKAGES epoxy >= epoxy_required_version fribidi >= fribidi_required_version"
-+GTK_PRIVATE_PACKAGES="$ATK_PACKAGES $WAYLAND_PACKAGES $MIR_PACKAGES $EPOXY_PACKAGES fribidi >= fribidi_required_version"
+-GTK_PRIVATE_PACKAGES="$ATK_PACKAGES $WAYLAND_PACKAGES epoxy >= epoxy_required_version fribidi >= fribidi_required_version"
++GTK_PRIVATE_PACKAGES="$ATK_PACKAGES $WAYLAND_PACKAGES $EPOXY_PACKAGES fribidi >= fribidi_required_version"
  if test "x$enable_x11_backend" = xyes -o "x$enable_wayland_backend" = xyes; then
    GTK_PRIVATE_PACKAGES="$GTK_PRIVATE_PACKAGES pangoft2"
  fi
@@ -168,7 +168,7 @@ index b51e4ae..82409c7 100644
    return TRUE;
  }
 diff --git a/docs/tools/Makefile.am b/docs/tools/Makefile.am
-index 6a6d70f..5cdf312 100644
+index bec43e3..189e8fc 100644
 --- a/docs/tools/Makefile.am
 +++ b/docs/tools/Makefile.am
 @@ -9,13 +9,18 @@ AM_CPPFLAGS = \
@@ -210,7 +210,7 @@ index 932daf1..54239d6 100644
  
    return info;
 diff --git a/gdk/Makefile.am b/gdk/Makefile.am
-index 689ee52..d6b4e70 100644
+index 479d6a1..7edbee8 100644
 --- a/gdk/Makefile.am
 +++ b/gdk/Makefile.am
 @@ -274,7 +274,6 @@ x11_introspection_files = 		\
@@ -243,10 +243,10 @@ index 689ee52..d6b4e70 100644
  GdkX11_3_0_gir_SCANNERFLAGS = 		\
  	--identifier-prefix=Gdk		\
 diff --git a/gdk/gdkdisplay.c b/gdk/gdkdisplay.c
-index 06d4187..832711c 100644
+index 240c99f..9eb49bf 100644
 --- a/gdk/gdkdisplay.c
 +++ b/gdk/gdkdisplay.c
-@@ -2416,7 +2416,9 @@ gboolean
+@@ -2419,7 +2419,9 @@ gboolean
  gdk_display_make_gl_context_current (GdkDisplay   *display,
                                       GdkGLContext *context)
  {
@@ -380,7 +380,7 @@ index dfbed63..556f0a3 100644
  
  /**
 diff --git a/gdk/gdkwindow.c b/gdk/gdkwindow.c
-index 1416409..e3b5630 100644
+index 6ae0f86..4e48a2a 100644
 --- a/gdk/gdkwindow.c
 +++ b/gdk/gdkwindow.c
 @@ -45,7 +45,9 @@
@@ -393,7 +393,7 @@ index 1416409..e3b5630 100644
  
  /* for the use of round() */
  #include "fallback-c89.c"
-@@ -2822,6 +2824,13 @@ gdk_window_get_paint_gl_context (GdkWindow  *window,
+@@ -2844,6 +2846,13 @@ gdk_window_get_paint_gl_context (GdkWindow  *window,
  {
    GError *internal_error = NULL;
  
@@ -407,7 +407,7 @@ index 1416409..e3b5630 100644
    if (_gdk_gl_flags & GDK_GL_DISABLE)
      {
        g_set_error_literal (error, GDK_GL_ERROR,
-@@ -2957,6 +2966,7 @@ gdk_window_begin_paint_internal (GdkWindow            *window,
+@@ -2979,6 +2988,7 @@ gdk_window_begin_paint_internal (GdkWindow            *window,
          }
        else
          {
@@ -415,7 +415,7 @@ index 1416409..e3b5630 100644
  	  gdk_gl_context_make_current (context);
            /* With gl we always need a surface to combine the gl
               drawing with the native drawing. */
-@@ -2971,6 +2981,7 @@ gdk_window_begin_paint_internal (GdkWindow            *window,
+@@ -2993,6 +3003,7 @@ gdk_window_begin_paint_internal (GdkWindow            *window,
            glBlendFunc (GL_ONE, GL_ONE_MINUS_SRC_ALPHA);
  
            glViewport (0, 0, ww, wh);
@@ -423,7 +423,7 @@ index 1416409..e3b5630 100644
          }
      }
  
-@@ -3034,6 +3045,7 @@ gdk_window_end_paint_internal (GdkWindow *window)
+@@ -3056,6 +3067,7 @@ gdk_window_end_paint_internal (GdkWindow *window)
  
            gdk_gl_context_make_current (window->gl_paint_context);
  
@@ -431,7 +431,7 @@ index 1416409..e3b5630 100644
            if (!cairo_region_is_empty (opaque_region))
              gdk_gl_texture_from_surface (window->current_paint.surface,
                                           opaque_region);
-@@ -3044,6 +3056,7 @@ gdk_window_end_paint_internal (GdkWindow *window)
+@@ -3066,6 +3078,7 @@ gdk_window_end_paint_internal (GdkWindow *window)
                                             window->current_paint.need_blend_region);
                glDisable(GL_BLEND);
              }
@@ -440,7 +440,7 @@ index 1416409..e3b5630 100644
            cairo_region_destroy (opaque_region);
  
 diff --git a/gdk/x11/Makefile.am b/gdk/x11/Makefile.am
-index 6289f3a..cbbac79 100644
+index 32b1f24..6352313 100644
 --- a/gdk/x11/Makefile.am
 +++ b/gdk/x11/Makefile.am
 @@ -40,8 +40,6 @@ libgdk_x11_la_SOURCES = 	\
@@ -494,7 +494,7 @@ index 6289f3a..cbbac79 100644
  	gdkx11keys.h		\
  	gdkx11monitor.h		\
  	gdkx11property.h	\
-@@ -87,9 +102,16 @@ libgdkx11include_HEADERS = 	\
+@@ -87,10 +102,17 @@ libgdkx11include_HEADERS = 	\
  	gdkx11visual.h		\
  	gdkx11window.h
  
@@ -506,13 +506,14 @@ index 6289f3a..cbbac79 100644
  # don't seem to be correctly expanded for the dist files.
  EXTRA_DIST += 			\
 +	gdkx.h			\
- 	gdksettings.c
+ 	gdksettings.c	\
+ 	meson.build
  
 +MAINTAINERCLEANFILES = gdkx.h
 +
  -include $(top_srcdir)/git.mk
 diff --git a/gdk/x11/gdkdisplay-x11.c b/gdk/x11/gdkdisplay-x11.c
-index 5b95196..9a2f2a2 100644
+index 817944e..e7a2947 100644
 --- a/gdk/x11/gdkdisplay-x11.c
 +++ b/gdk/x11/gdkdisplay-x11.c
 @@ -37,7 +37,9 @@
@@ -523,9 +524,9 @@ index 5b95196..9a2f2a2 100644
  #include "gdkglcontext-x11.h"
 +#endif
  #include "gdk-private.h"
+ #include "gdkprofilerprivate.h"
  
- #include <glib.h>
-@@ -3184,7 +3186,9 @@ gdk_x11_display_class_init (GdkX11DisplayClass * class)
+@@ -3188,7 +3190,9 @@ gdk_x11_display_class_init (GdkX11DisplayClass * class)
    display_class->text_property_to_utf8_list = _gdk_x11_display_text_property_to_utf8_list;
    display_class->utf8_to_string_target = _gdk_x11_display_utf8_to_string_target;
  
@@ -537,10 +538,10 @@ index 5b95196..9a2f2a2 100644
    display_class->get_default_seat = gdk_x11_display_get_default_seat;
  
 diff --git a/gdk/x11/gdkscreen-x11.c b/gdk/x11/gdkscreen-x11.c
-index 272cecd..2bb34ac 100644
+index 8939ae9..931bff9 100644
 --- a/gdk/x11/gdkscreen-x11.c
 +++ b/gdk/x11/gdkscreen-x11.c
-@@ -1675,3 +1675,8 @@ gdk_x11_screen_get_current_desktop (GdkScreen *screen)
+@@ -1723,3 +1723,8 @@ gdk_x11_screen_get_current_desktop (GdkScreen *screen)
  {
    return get_netwm_cardinal_property (screen, "_NET_CURRENT_DESKTOP");
  }
@@ -550,7 +551,7 @@ index 272cecd..2bb34ac 100644
 +void _gdk_x11_screen_update_visuals_for_gl (GdkScreen *screen) {}
 +#endif
 diff --git a/gdk/x11/gdkwindow-x11.c b/gdk/x11/gdkwindow-x11.c
-index f92a146..89f900a 100644
+index 1fe7b90..d23a347 100644
 --- a/gdk/x11/gdkwindow-x11.c
 +++ b/gdk/x11/gdkwindow-x11.c
 @@ -36,7 +36,9 @@
@@ -563,7 +564,7 @@ index f92a146..89f900a 100644
  #include "gdkprivate-x11.h"
  #include "gdk-private.h"
  
-@@ -5839,7 +5841,9 @@ gdk_window_impl_x11_class_init (GdkWindowImplX11Class *klass)
+@@ -5861,7 +5863,9 @@ gdk_window_impl_x11_class_init (GdkWindowImplX11Class *klass)
    impl_class->set_opaque_region = gdk_x11_window_set_opaque_region;
    impl_class->set_shadow_width = gdk_x11_window_set_shadow_width;
    impl_class->show_window_menu = gdk_x11_window_show_window_menu;
@@ -667,31 +668,23 @@ index 0000000..c9e2617
 +
 +#endif /* __GDK_X_H__ */
 diff --git a/gtk/Makefile.am b/gtk/Makefile.am
-index e556e9d..ce912d7 100644
+index eaca473..99352d1 100644
 --- a/gtk/Makefile.am
 +++ b/gtk/Makefile.am
-@@ -1441,7 +1441,6 @@ gtkprivatetypebuiltins.c: $(gtk_private_type_h_sources)  gtkprivatetypebuiltins.
- 	&& cp xgen-gptbc gtkprivatetypebuiltins.c  \
- 	&& rm -f xgen-gptbc
- 
--
- gtktypefuncs.c: stamp-gtktypebuiltins.h stamp-gtkprivatetypebuiltins.h $(top_srcdir)/gtk/*.h $(top_srcdir)/gtk/a11y/*.h $(top_srcdir)/gtk/deprecated/*.h $(top_srcdir)/gdk/*.h Makefile
- 	$(AM_V_GEN) export LC_ALL=C ; \
- 	  (echo '#undef GTK_COMPILATION' && echo '#include <gtk/gtkx.h>') > xgen-gtfsrc.c && \
-@@ -1449,7 +1448,7 @@ gtktypefuncs.c: stamp-gtktypebuiltins.h stamp-gtkprivatetypebuiltins.h $(top_src
+@@ -1449,7 +1449,7 @@ gtktypefuncs.inc: stamp-gtktypebuiltins.h stamp-gtkprivatetypebuiltins.h $(top_s
  	  ${CPP} $(DEFS) $(AM_CPPFLAGS) $(CPPFLAGS) $(AM_CFLAGS) $(CFLAGS) xgen-gtfsrc.c | \
  	  $(GREP) -o '\bg[td]k_[a-zA-Z0-9_]*_get_type\b' | \
  	  sort | uniq | \
 -	  $(SED) '{ s/^/*tp++ = /; s/$$/();/; s/^.*\(gdk_x11\|gtk_plug_\|gtk_socket_\).*$$/#ifdef GDK_WINDOWING_X11\n&\n#endif/; }' >> xgen-gtf \
 +	  $(SED) '{ s/^/*tp++ = /; s/$$/();/; s/^.*\(gdk_x11\|gtk_plug_\|gtk_socket_\).*$$/#ifdef GDK_WINDOWING_X11\n&\n#endif/; s/^.*gdk_x11_gl.*$$/#ifdef HAVE_OPENGL\n&\n#endif/; }' >> xgen-gtf \
  	&& cp xgen-gtf $@ && rm -f xgen-gtf
- $(srcdir)/gtktestutils.c: gtktypefuncs.c
+ $(srcdir)/gtktestutils.c: gtktypefuncs.inc
  
 diff --git a/gtk/gtkglarea.c b/gtk/gtkglarea.c
-index ea383c0..bb4eb64 100644
+index 9a56443..7de0db2 100644
 --- a/gtk/gtkglarea.c
 +++ b/gtk/gtkglarea.c
-@@ -28,7 +28,9 @@
+@@ -29,7 +29,9 @@
  #include "gtkprivate.h"
  #include "gtkrender.h"
  
@@ -701,7 +694,7 @@ index ea383c0..bb4eb64 100644
  
  /**
   * SECTION:gtkglarea
-@@ -368,9 +370,12 @@ gtk_gl_area_real_create_context (GtkGLArea *area)
+@@ -369,9 +371,12 @@ gtk_gl_area_real_create_context (GtkGLArea *area)
  static void
  gtk_gl_area_resize (GtkGLArea *area, int width, int height)
  {
@@ -714,7 +707,7 @@ index ea383c0..bb4eb64 100644
  /*
   * Creates all the buffer objects needed for rendering the scene
   */
-@@ -482,6 +487,7 @@ gtk_gl_area_allocate_buffers (GtkGLArea *area)
+@@ -483,6 +488,7 @@ gtk_gl_area_allocate_buffers (GtkGLArea *area)
  
    priv->needs_render = TRUE;
  }
@@ -722,7 +715,7 @@ index ea383c0..bb4eb64 100644
  
  /**
   * gtk_gl_area_attach_buffers:
-@@ -500,6 +506,7 @@ gtk_gl_area_allocate_buffers (GtkGLArea *area)
+@@ -501,6 +507,7 @@ gtk_gl_area_allocate_buffers (GtkGLArea *area)
  void
  gtk_gl_area_attach_buffers (GtkGLArea *area)
  {
@@ -730,7 +723,7 @@ index ea383c0..bb4eb64 100644
    GtkGLAreaPrivate *priv = gtk_gl_area_get_instance_private (area);
  
    g_return_if_fail (GTK_IS_GL_AREA (area));
-@@ -532,11 +539,13 @@ gtk_gl_area_attach_buffers (GtkGLArea *area)
+@@ -533,11 +540,13 @@ gtk_gl_area_attach_buffers (GtkGLArea *area)
          glFramebufferRenderbufferEXT (GL_FRAMEBUFFER_EXT, GL_STENCIL_ATTACHMENT_EXT,
                                        GL_RENDERBUFFER_EXT, priv->depth_stencil_buffer);
      }
@@ -744,7 +737,7 @@ index ea383c0..bb4eb64 100644
    GtkGLAreaPrivate *priv = gtk_gl_area_get_instance_private (area);
  
    if (priv->context == NULL)
-@@ -568,6 +577,7 @@ gtk_gl_area_delete_buffers (GtkGLArea *area)
+@@ -569,6 +578,7 @@ gtk_gl_area_delete_buffers (GtkGLArea *area)
        glDeleteFramebuffersEXT (1, &priv->frame_buffer);
        priv->frame_buffer = 0;
      }
@@ -752,7 +745,7 @@ index ea383c0..bb4eb64 100644
  }
  
  static void
-@@ -678,6 +688,7 @@ gtk_gl_area_draw (GtkWidget *widget,
+@@ -679,6 +689,7 @@ gtk_gl_area_draw (GtkWidget *widget,
    GtkGLArea *area = GTK_GL_AREA (widget);
    GtkGLAreaPrivate *priv = gtk_gl_area_get_instance_private (area);
    gboolean unused;
@@ -760,7 +753,7 @@ index ea383c0..bb4eb64 100644
    int w, h, scale;
    GLenum status;
  
-@@ -689,7 +700,6 @@ gtk_gl_area_draw (GtkWidget *widget,
+@@ -690,7 +701,6 @@ gtk_gl_area_draw (GtkWidget *widget,
                                       gtk_widget_get_allocated_height (widget));
        return FALSE;
      }
@@ -768,7 +761,7 @@ index ea383c0..bb4eb64 100644
    if (priv->context == NULL)
      return FALSE;
  
-@@ -735,6 +745,14 @@ gtk_gl_area_draw (GtkWidget *widget,
+@@ -736,6 +746,14 @@ gtk_gl_area_draw (GtkWidget *widget,
      }
  
    return TRUE;
@@ -831,7 +824,7 @@ index c241ec8..24576dd 100644
    if (GDK_IS_WAYLAND_DISPLAY (gdk_display_get_default ()))
      {
 diff --git a/tests/Makefile.am b/tests/Makefile.am
-index 7c5ca99..e4a4546 100644
+index ee1e8b5..e6c6502 100644
 --- a/tests/Makefile.am
 +++ b/tests/Makefile.am
 @@ -80,8 +80,6 @@ noinst_PROGRAMS =  $(TEST_PROGS)	\
@@ -864,10 +857,10 @@ index 7c5ca99..e4a4546 100644
  noinst_PROGRAMS += testforeign
  endif
 diff --git a/testsuite/gtk/objects-finalize.c b/testsuite/gtk/objects-finalize.c
-index 0b3a519..07b096f 100644
+index 24540e3..e0f863a 100644
 --- a/testsuite/gtk/objects-finalize.c
 +++ b/testsuite/gtk/objects-finalize.c
-@@ -115,7 +115,9 @@ main (int argc, char **argv)
+@@ -116,7 +116,9 @@ main (int argc, char **argv)
  	  all_types[i] != GDK_TYPE_X11_DEVICE_MANAGER_CORE &&
  	  all_types[i] != GDK_TYPE_X11_DEVICE_MANAGER_XI2 &&
  	  all_types[i] != GDK_TYPE_X11_DISPLAY_MANAGER &&
diff --git a/meta/recipes-gnome/gtk+/gtk+3_3.24.8.bb b/meta/recipes-gnome/gtk+/gtk+3_3.24.13.bb
similarity index 84%
rename from meta/recipes-gnome/gtk+/gtk+3_3.24.8.bb
rename to meta/recipes-gnome/gtk+/gtk+3_3.24.13.bb
index d79b18bee03..18976b54c5c 100644
--- a/meta/recipes-gnome/gtk+/gtk+3_3.24.8.bb
+++ b/meta/recipes-gnome/gtk+/gtk+3_3.24.13.bb
@@ -8,8 +8,8 @@ SRC_URI = "http://ftp.gnome.org/pub/gnome/sources/gtk+/${MAJ_VER}/gtk+-${PV}.tar
            file://0003-Add-disable-opengl-configure-option.patch \
            file://link_fribidi.patch \
           "
-SRC_URI[md5sum] = "eeedde01856238114dcf4df3ebc942a5"
-SRC_URI[sha256sum] = "666962de9b9768fe9ca785b0e2f42c8b9db3868a12fa9b356b167238d70ac799"
+SRC_URI[md5sum] = "f65515e7bfa2199bd2188e871d69c686"
+SRC_URI[sha256sum] = "4c775c38cf1e3c534ef0ca52ca6c7a890fe169981af66141c713e054e68930a9"
 
 S = "${WORKDIR}/gtk+-${PV}"
 
-- 
2.17.1


