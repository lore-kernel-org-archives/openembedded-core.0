Return-Path: <alex.kanavin@gmail.com>
Received: from mail-wr1-f68.google.com (mail-wr1-f68.google.com
	[209.85.221.68])
	by mail.openembedded.org (Postfix) with ESMTP id 3D6C67E65C
	for <openembedded-core@lists.openembedded.org>;
	Tue, 11 Jun 2019 14:52:05 +0000 (UTC)
Received: by mail-wr1-f68.google.com with SMTP id d18so13383937wrs.5
	for <openembedded-core@lists.openembedded.org>;
	Tue, 11 Jun 2019 07:52:06 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=from:to:cc:subject:date:message-id:in-reply-to:references;
	bh=2EfzHW/+4NcAJ3hgFMulf1Gd0rqqxc57VO1HgBL2OJA=;
	b=iB6fdLzeVgne8kwy5XvOQ25wWJKr/z7JxPYaYqg2A63wvQiLpa+sIca1X5TIT4zJjh
	1h/YcSPflgGCHSNfqjo42T7bklQPB2W9LK2D0HByX+YGcUuHC995lqHMXoCGazeJXE6V
	qhnMuFxV2yEx6lq0DWaXf7/HhdlfmBUfPIh1V0OtLrHHfe2VacINrMmqsH5myyUFxkYD
	+S3HEpCw8WPaEtQE2dO+Lb9mh/9yJcP9ZIBX6pLUrJPp9F1NQyALq3xJiCu1/9+Yex5C
	x9fER66muiNgULpVAzbKIfndnLTi6xmUklMalN7evXq21sDwSNz6naLdEjv32h/QI4lK
	BIaQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
	:references;
	bh=2EfzHW/+4NcAJ3hgFMulf1Gd0rqqxc57VO1HgBL2OJA=;
	b=tdc5455BLj0WD7ZApWpXSwZXLwHdUL4dTP8cx829kQTdw7QQerSsXAZ42C2ABLrHPh
	Jg/jTSEwASvR56m5+NyZJnrXRZ7VOXssJrrN+MrUQSYLFM8MkijbB1OzoIgGs4TJ1yW2
	n8W6WAUG3XIKNLyUBQCpJqNqiqqDh5Igl6arQtGkwC3/j+RZ1BjwKG4K6MnacgtZmsVu
	ENBXxfPJRY/vRAMfB/yk8jRx6bQtiuQLhwnLbjrcpDOTplK+nbsaoT2Pb6nDUz/34EAR
	FOtvmjbdJe4KdX4C5xxhSQATjqPeXqIyQ6wBJqvpx2rCRdB4L4nPHU6u5/C2W6zqmaJD
	LHew==
X-Gm-Message-State: APjAAAXbnO1JuHUtaohrLgmU97qBVxdvbOuuCZ0F0UuxGR0/h+sAhQm7
	3ZjKeAcIPYXFpI19ROGJ77DCztL0Az8=
X-Google-Smtp-Source: APXvYqxsJ3DtywV+uKG9Jvl3XbVZDLPDkYnpwLdM8m0EwYr3D/p5Flm/qGcqBZkWReIxB1pCq6QD7A==
X-Received: by 2002:a5d:6acd:: with SMTP id u13mr4180381wrw.154.1560264725591; 
	Tue, 11 Jun 2019 07:52:05 -0700 (PDT)
Received: from alexander-box.luxoft.com ([62.96.135.139])
	by smtp.gmail.com with ESMTPSA id
	y2sm15007133wra.58.2019.06.11.07.52.04
	(version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
	Tue, 11 Jun 2019 07:52:04 -0700 (PDT)
From: Alexander Kanavin <alex.kanavin@gmail.com>
To: openembedded-core@lists.openembedded.org
Date: Tue, 11 Jun 2019 16:51:59 +0200
Message-Id: <20190611145159.61078-2-alex.kanavin@gmail.com>
X-Mailer: git-send-email 2.17.1
In-Reply-To: <20190611145159.61078-1-alex.kanavin@gmail.com>
References: <20190611145159.61078-1-alex.kanavin@gmail.com>
Subject: [PATCH 2/2] gtk+3: update 3.24.5 -> 3.24.8
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
X-List-Received-Date: Tue, 11 Jun 2019 14:52:05 -0000

Rebase 0003-Add-disable-opengl-configure-option.patch
and add another fix to it (g-introspection input file list assumes
opengl is always available).

Signed-off-by: Alexander Kanavin <alex.kanavin@gmail.com>
---
 ...-Add-disable-opengl-configure-option.patch | 77 ++++++++++++++-----
 .../gtk+/{gtk+3_3.24.5.bb => gtk+3_3.24.8.bb} |  4 +-
 2 files changed, 58 insertions(+), 23 deletions(-)
 rename meta/recipes-gnome/gtk+/{gtk+3_3.24.5.bb => gtk+3_3.24.8.bb} (84%)

diff --git a/meta/recipes-gnome/gtk+/gtk+3/0003-Add-disable-opengl-configure-option.patch b/meta/recipes-gnome/gtk+/gtk+3/0003-Add-disable-opengl-configure-option.patch
index e5a67d098e7..852dc9dfcd3 100644
--- a/meta/recipes-gnome/gtk+/gtk+3/0003-Add-disable-opengl-configure-option.patch
+++ b/meta/recipes-gnome/gtk+/gtk+3/0003-Add-disable-opengl-configure-option.patch
@@ -1,4 +1,4 @@
-From 9e243474eea4330b593e0f6dd418b61b79699d8b Mon Sep 17 00:00:00 2001
+From d11b41a7ff0234f3832d6aabdf498807d1463c18 Mon Sep 17 00:00:00 2001
 From: Jussi Kukkonen <jussi.kukkonen@intel.com>
 Date: Tue, 21 Jun 2016 15:11:39 +0300
 Subject: [PATCH] Add --disable-opengl configure option
@@ -25,6 +25,7 @@ Signed-off-by: Jussi Kukkonen <jussi.kukkonen@intel.com>
  demos/gtk-demo/glarea.c                    | 14 ++++++
  docs/tools/Makefile.am                     |  9 +++-
  docs/tools/widgets.c                       |  4 +-
+ gdk/Makefile.am                            |  8 ++-
  gdk/gdkdisplay.c                           |  4 +-
  gdk/gdkgl.c                                | 10 ++++
  gdk/gdkglcontext.c                         |  6 +++
@@ -41,15 +42,15 @@ Signed-off-by: Jussi Kukkonen <jussi.kukkonen@intel.com>
  gtk/inspector/general.c                    |  6 +++
  tests/Makefile.am                          | 10 ++--
  testsuite/gtk/objects-finalize.c           |  2 +
- 20 files changed, 202 insertions(+), 18 deletions(-)
+ 21 files changed, 208 insertions(+), 20 deletions(-)
  rename gdk/x11/{gdkx.h => gdkx-with-gl-context.h} (98%)
  create mode 100644 gdk/x11/gdkx-without-gl-context.h
 
 diff --git a/configure.ac b/configure.ac
-index a91b29c..561d3b5 100644
+index 2c4733b..18ae66c 100644
 --- a/configure.ac
 +++ b/configure.ac
-@@ -351,6 +351,15 @@ AC_ARG_ENABLE(cloudproviders,
+@@ -352,6 +352,15 @@ AC_ARG_ENABLE(cloudproviders,
                [AS_HELP_STRING([--enable-cloudproviders],
                                [enable libcloudproviders integration])],
                                [cloudproviders_set=yes])
@@ -65,21 +66,21 @@ index a91b29c..561d3b5 100644
  AC_ARG_ENABLE(glx,
                [AS_HELP_STRING([--enable-glx],
                                [When enabled Gdk will try to initialize GLX])])
-@@ -1381,7 +1390,7 @@ CFLAGS="$saved_cflags"
+@@ -1370,7 +1379,7 @@ CFLAGS="$saved_cflags"
  LDFLAGS="$saved_ldflags"
  
  GDK_PACKAGES="$PANGO_PACKAGES gdk-pixbuf-2.0 >= gdk_pixbuf_required_version cairo >= cairo_required_version cairo-gobject >= cairo_required_version"
--GDK_PRIVATE_PACKAGES="$GDK_GIO_PACKAGE $X_PACKAGES $WAYLAND_PACKAGES $MIR_PACKAGES $cairo_backends epoxy >= epoxy_required_version $CLOUDPROVIDER_PACKAGES"
-+GDK_PRIVATE_PACKAGES="$GDK_GIO_PACKAGE $X_PACKAGES $WAYLAND_PACKAGES $MIR_PACKAGES $cairo_backends $EPOXY_PACKAGES $CLOUDPROVIDER_PACKAGES"
+-GDK_PRIVATE_PACKAGES="$GDK_GIO_PACKAGE $X_PACKAGES $WAYLAND_PACKAGES $MIR_PACKAGES $cairo_backends epoxy >= epoxy_required_version $CLOUDPROVIDER_PACKAGES fribidi >= fribidi_required_version"
++GDK_PRIVATE_PACKAGES="$GDK_GIO_PACKAGE $X_PACKAGES $WAYLAND_PACKAGES $MIR_PACKAGES $cairo_backends $EPOXY_PACKAGES $CLOUDPROVIDER_PACKAGES fribidi >= fribidi_required_version"
  
  PKG_CHECK_MODULES(GDK_DEP, $GDK_PACKAGES $GDK_PRIVATE_PACKAGES)
  GDK_DEP_LIBS="$GDK_EXTRA_LIBS $GDK_DEP_LIBS $MATH_LIB"
-@@ -1415,7 +1424,7 @@ fi
+@@ -1404,7 +1413,7 @@ fi
  PKG_CHECK_MODULES(ATK, $ATK_PACKAGES)
  
  GTK_PACKAGES="atk >= atk_required_version cairo >= cairo_required_version cairo-gobject >= cairo_required_version gdk-pixbuf-2.0 >= gdk_pixbuf_required_version gio-2.0 >= glib_required_version"
--GTK_PRIVATE_PACKAGES="$ATK_PACKAGES $WAYLAND_PACKAGES $MIR_PACKAGES epoxy >= epoxy_required_version"
-+GTK_PRIVATE_PACKAGES="$ATK_PACKAGES $WAYLAND_PACKAGES $MIR_PACKAGES $EPOXY_PACKAGES"
+-GTK_PRIVATE_PACKAGES="$ATK_PACKAGES $WAYLAND_PACKAGES $MIR_PACKAGES epoxy >= epoxy_required_version fribidi >= fribidi_required_version"
++GTK_PRIVATE_PACKAGES="$ATK_PACKAGES $WAYLAND_PACKAGES $MIR_PACKAGES $EPOXY_PACKAGES fribidi >= fribidi_required_version"
  if test "x$enable_x11_backend" = xyes -o "x$enable_wayland_backend" = xyes; then
    GTK_PRIVATE_PACKAGES="$GTK_PRIVATE_PACKAGES pangoft2"
  fi
@@ -208,11 +209,44 @@ index 932daf1..54239d6 100644
    info = new_widget_info ("glarea", widget, MEDIUM);
  
    return info;
+diff --git a/gdk/Makefile.am b/gdk/Makefile.am
+index 689ee52..d6b4e70 100644
+--- a/gdk/Makefile.am
++++ b/gdk/Makefile.am
+@@ -274,7 +274,6 @@ x11_introspection_files = 		\
+ 	x11/gdkeventsource.c		\
+ 	x11/gdkeventtranslator.c	\
+ 	x11/gdkgeometry-x11.c		\
+-	x11/gdkglcontext-x11.c		\
+ 	x11/gdkkeys-x11.c		\
+ 	x11/gdkmain-x11.c		\
+ 	x11/gdkmonitor-x11.c		\
+@@ -300,7 +299,6 @@ x11_introspection_files = 		\
+ 	x11/gdkx11display.h		\
+ 	x11/gdkx11displaymanager.h	\
+ 	x11/gdkx11dnd.h			\
+-	x11/gdkx11glcontext.h		\
+ 	x11/gdkx11keys.h		\
+ 	x11/gdkx11monitor.h		\
+ 	x11/gdkx11property.h		\
+@@ -310,6 +308,12 @@ x11_introspection_files = 		\
+ 	x11/gdkx11visual.h		\
+ 	x11/gdkx11window.h
+ 
++if HAVE_OPENGL
++x11_introspection_files += 		\
++	x11/gdkglcontext-x11.c		\
++	x11/gdkx11glcontext.h
++endif
++
+ GdkX11-3.0.gir: libgdk-3.la Gdk-3.0.gir Makefile
+ GdkX11_3_0_gir_SCANNERFLAGS = 		\
+ 	--identifier-prefix=Gdk		\
 diff --git a/gdk/gdkdisplay.c b/gdk/gdkdisplay.c
-index 40225e9..c55e1de 100644
+index 06d4187..832711c 100644
 --- a/gdk/gdkdisplay.c
 +++ b/gdk/gdkdisplay.c
-@@ -2406,7 +2406,9 @@ gboolean
+@@ -2416,7 +2416,9 @@ gboolean
  gdk_display_make_gl_context_current (GdkDisplay   *display,
                                       GdkGLContext *context)
  {
@@ -346,7 +380,7 @@ index dfbed63..556f0a3 100644
  
  /**
 diff --git a/gdk/gdkwindow.c b/gdk/gdkwindow.c
-index 6b231f0..904b86d 100644
+index 1416409..e3b5630 100644
 --- a/gdk/gdkwindow.c
 +++ b/gdk/gdkwindow.c
 @@ -45,7 +45,9 @@
@@ -478,7 +512,7 @@ index 6289f3a..cbbac79 100644
 +
  -include $(top_srcdir)/git.mk
 diff --git a/gdk/x11/gdkdisplay-x11.c b/gdk/x11/gdkdisplay-x11.c
-index 659b9fa..b15536b 100644
+index 5b95196..9a2f2a2 100644
 --- a/gdk/x11/gdkdisplay-x11.c
 +++ b/gdk/x11/gdkdisplay-x11.c
 @@ -37,7 +37,9 @@
@@ -491,7 +525,7 @@ index 659b9fa..b15536b 100644
  #include "gdk-private.h"
  
  #include <glib.h>
-@@ -3194,7 +3196,9 @@ gdk_x11_display_class_init (GdkX11DisplayClass * class)
+@@ -3184,7 +3186,9 @@ gdk_x11_display_class_init (GdkX11DisplayClass * class)
    display_class->text_property_to_utf8_list = _gdk_x11_display_text_property_to_utf8_list;
    display_class->utf8_to_string_target = _gdk_x11_display_utf8_to_string_target;
  
@@ -516,7 +550,7 @@ index 272cecd..2bb34ac 100644
 +void _gdk_x11_screen_update_visuals_for_gl (GdkScreen *screen) {}
 +#endif
 diff --git a/gdk/x11/gdkwindow-x11.c b/gdk/x11/gdkwindow-x11.c
-index c6205e4..df2334f 100644
+index f92a146..89f900a 100644
 --- a/gdk/x11/gdkwindow-x11.c
 +++ b/gdk/x11/gdkwindow-x11.c
 @@ -36,7 +36,9 @@
@@ -529,7 +563,7 @@ index c6205e4..df2334f 100644
  #include "gdkprivate-x11.h"
  #include "gdk-private.h"
  
-@@ -5804,7 +5806,9 @@ gdk_window_impl_x11_class_init (GdkWindowImplX11Class *klass)
+@@ -5839,7 +5841,9 @@ gdk_window_impl_x11_class_init (GdkWindowImplX11Class *klass)
    impl_class->set_opaque_region = gdk_x11_window_set_opaque_region;
    impl_class->set_shadow_width = gdk_x11_window_set_shadow_width;
    impl_class->show_window_menu = gdk_x11_window_show_window_menu;
@@ -633,17 +667,18 @@ index 0000000..c9e2617
 +
 +#endif /* __GDK_X_H__ */
 diff --git a/gtk/Makefile.am b/gtk/Makefile.am
-index 5594429..2259bb3 100644
+index e556e9d..ce912d7 100644
 --- a/gtk/Makefile.am
 +++ b/gtk/Makefile.am
-@@ -1434,14 +1434,13 @@ gtkprivatetypebuiltins.c: $(gtk_private_type_h_sources)  gtkprivatetypebuiltins.
+@@ -1441,7 +1441,6 @@ gtkprivatetypebuiltins.c: $(gtk_private_type_h_sources)  gtkprivatetypebuiltins.
  	&& cp xgen-gptbc gtkprivatetypebuiltins.c  \
  	&& rm -f xgen-gptbc
  
 -
  gtktypefuncs.c: stamp-gtktypebuiltins.h stamp-gtkprivatetypebuiltins.h $(top_srcdir)/gtk/*.h $(top_srcdir)/gtk/a11y/*.h $(top_srcdir)/gtk/deprecated/*.h $(top_srcdir)/gdk/*.h Makefile
- 	$(AM_V_GEN) (echo '#undef GTK_COMPILATION' && echo '#include <gtk/gtkx.h>') > xgen-gtfsrc.c && \
- 	  echo 'G_GNUC_BEGIN_IGNORE_DEPRECATIONS' > xgen-gtf && \
+ 	$(AM_V_GEN) export LC_ALL=C ; \
+ 	  (echo '#undef GTK_COMPILATION' && echo '#include <gtk/gtkx.h>') > xgen-gtfsrc.c && \
+@@ -1449,7 +1448,7 @@ gtktypefuncs.c: stamp-gtktypebuiltins.h stamp-gtkprivatetypebuiltins.h $(top_src
  	  ${CPP} $(DEFS) $(AM_CPPFLAGS) $(CPPFLAGS) $(AM_CFLAGS) $(CFLAGS) xgen-gtfsrc.c | \
  	  $(GREP) -o '\bg[td]k_[a-zA-Z0-9_]*_get_type\b' | \
  	  sort | uniq | \
diff --git a/meta/recipes-gnome/gtk+/gtk+3_3.24.5.bb b/meta/recipes-gnome/gtk+/gtk+3_3.24.8.bb
similarity index 84%
rename from meta/recipes-gnome/gtk+/gtk+3_3.24.5.bb
rename to meta/recipes-gnome/gtk+/gtk+3_3.24.8.bb
index 92c9a3ebfb5..d79b18bee03 100644
--- a/meta/recipes-gnome/gtk+/gtk+3_3.24.5.bb
+++ b/meta/recipes-gnome/gtk+/gtk+3_3.24.8.bb
@@ -8,8 +8,8 @@ SRC_URI = "http://ftp.gnome.org/pub/gnome/sources/gtk+/${MAJ_VER}/gtk+-${PV}.tar
            file://0003-Add-disable-opengl-configure-option.patch \
            file://link_fribidi.patch \
           "
-SRC_URI[md5sum] = "32862355c08f6af3e7848c695cd4081b"
-SRC_URI[sha256sum] = "0be5fb0d302bc3de26ab58c32990d895831e2b7c7418d0ffea1206d6a3ddb02f"
+SRC_URI[md5sum] = "eeedde01856238114dcf4df3ebc942a5"
+SRC_URI[sha256sum] = "666962de9b9768fe9ca785b0e2f42c8b9db3868a12fa9b356b167238d70ac799"
 
 S = "${WORKDIR}/gtk+-${PV}"
 
-- 
2.17.1


