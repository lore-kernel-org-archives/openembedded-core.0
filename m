Return-Path: <alex.kanavin@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id D50F3C4708D
	for <webhook@archiver.kernel.org>; Tue, 13 Dec 2022 11:11:36 +0000 (UTC)
Received: from mail-wr1-f48.google.com (mail-wr1-f48.google.com [209.85.221.48])
 by mx.groups.io with SMTP id smtpd.web11.70916.1670929886323152213
 for <openembedded-core@lists.openembedded.org>;
 Tue, 13 Dec 2022 03:11:29 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20210112 header.b=UtbyuyUu;
 spf=pass (domain: gmail.com, ip: 209.85.221.48, mailfrom: alex.kanavin@gmail.com)
Received: by mail-wr1-f48.google.com with SMTP id u12so15203933wrr.11
        for <openembedded-core@lists.openembedded.org>; Tue, 13 Dec 2022 03:11:29 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=IO4UPMJAKlus8RGV8itOSMQ/K3m3RTk6eLizBHtlBiw=;
        b=UtbyuyUuTk2AGfsJdwshg+2/1uVKVgE+shur1HacZWz3Qt0pOkDowTbhftnBYG731l
         lMysepnyu04oyqQC0JWYMMjCOnO0E6P3BJ8kr/9U48giusPQCebsbdMdNUsJO4R+b9x7
         LBke0z3dlADgScrb/AVkcf3vanOMAjpctgRNO69GFajQy7055vA3c1Y5iKYBZXfKwxhq
         GPTRvG5yXdsJC97Fzp7EGa0m4y/D7bs7Yf5f+dlFpyNRKV2OP4Y6APM55pI6LB04f7sa
         ylHr7KmnoTUKiIp9Riq6x5mtGqx2xitRxoDYmcUmwU3NIk/ay0F20I6DTMmJLjps6S/l
         Lskg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=IO4UPMJAKlus8RGV8itOSMQ/K3m3RTk6eLizBHtlBiw=;
        b=5cUnod7JixGUC3tXN7R6V6xirEdVwc55E+NOJSxyEkSxdoIRE6QQCaXMb+UnrbC2Vt
         AFciR2MKZoHMFz/3dPuC6yxbRazDa4WJ4PecLmXVjn0j/9n7McQMU7mC/vnKhDBbEn4N
         jL+R2iR85w466082onBgfdGxIr3pxgMw6Btu2ULNKWKIRoZaE/nXG5qDRTLJmuNvmbVq
         MEj1Lm7bgdnBe8tkdZw7lWOKZWuWeMh0vopEqmsglobp1a1FC2BKmXP6ghYqCGfodjkY
         vtoC1vZvSDn9RqizXVDzc23gGeepyRHMiPErQHgWMhnHDCaNHMmw9KiJlJOB9OKdGEgv
         IIRQ==
X-Gm-Message-State: ANoB5pler/9IRzrLufVppFuQF+zL7qJJeO3erxG/nnHXofCjr8dlk6j6
	URyKxMTW8q9LczEvFKS1npr9UKWBXTU=
X-Google-Smtp-Source: AA0mqf7guRMnW4fpFhpOZ01qKuOkriMgRqnUdoKotRY3tpLKOdP/1Wd9pdrj98sT9SahEJpoHZhuJg==
X-Received: by 2002:a5d:4312:0:b0:241:997a:4f57 with SMTP id h18-20020a5d4312000000b00241997a4f57mr11677809wrq.39.1670929888879;
        Tue, 13 Dec 2022 03:11:28 -0800 (PST)
Received: from Zen2.lab.linutronix.de. (drugstore.linutronix.de. [80.153.143.164])
        by smtp.gmail.com with ESMTPSA id m8-20020a056000008800b002366c3eefccsm11362665wrx.109.2022.12.13.03.11.28
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 13 Dec 2022 03:11:28 -0800 (PST)
From: Alexander Kanavin <alex.kanavin@gmail.com>
X-Google-Original-From: Alexander Kanavin <alex@linutronix.de>
To: openembedded-core@lists.openembedded.org
Cc: Alexander Kanavin <alex@linutronix.de>
Subject: [PATCH 09/24] gtk+3: update 3.24.34 -> 3.24.35
Date: Tue, 13 Dec 2022 12:11:03 +0100
Message-Id: <20221213111118.149697-9-alex@linutronix.de>
X-Mailer: git-send-email 2.30.2
In-Reply-To: <20221213111118.149697-1-alex@linutronix.de>
References: <20221213111118.149697-1-alex@linutronix.de>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Tue, 13 Dec 2022 11:11:36 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/174519

Signed-off-by: Alexander Kanavin <alex@linutronix.de>
---
 ...-Add-disable-opengl-configure-option.patch | 60 +++++++++----------
 .../{gtk+3_3.24.34.bb => gtk+3_3.24.35.bb}    |  2 +-
 2 files changed, 31 insertions(+), 31 deletions(-)
 rename meta/recipes-gnome/gtk+/{gtk+3_3.24.34.bb => gtk+3_3.24.35.bb} (89%)

diff --git a/meta/recipes-gnome/gtk+/gtk+3/0003-Add-disable-opengl-configure-option.patch b/meta/recipes-gnome/gtk+/gtk+3/0003-Add-disable-opengl-configure-option.patch
index 35cbab8761..ea8bd28e7b 100644
--- a/meta/recipes-gnome/gtk+/gtk+3/0003-Add-disable-opengl-configure-option.patch
+++ b/meta/recipes-gnome/gtk+/gtk+3/0003-Add-disable-opengl-configure-option.patch
@@ -1,4 +1,4 @@
-From eef50c94587fc30cd624adb5eb213eb9fa663dc1 Mon Sep 17 00:00:00 2001
+From 8f3edf5f8379ac482d9eb7a64d7408b5f95535ce Mon Sep 17 00:00:00 2001
 From: Jussi Kukkonen <jussi.kukkonen@intel.com>
 Date: Tue, 21 Jun 2016 15:11:39 +0300
 Subject: [PATCH] Add --disable-opengl configure option
@@ -25,7 +25,7 @@ Signed-off-by: Jussi Kukkonen <jussi.kukkonen@intel.com>
  demos/gtk-demo/glarea.c                    | 14 ++++++
  docs/tools/Makefile.am                     |  9 +++-
  docs/tools/widgets.c                       |  4 +-
- gdk/Makefile.am                            |  8 ++-
+ gdk/gdk-sources.inc                        |  8 ++-
  gdk/gdkdisplay.c                           |  4 +-
  gdk/gdkgl.c                                | 10 ++++
  gdk/gdkglcontext.c                         |  6 +++
@@ -47,7 +47,7 @@ Signed-off-by: Jussi Kukkonen <jussi.kukkonen@intel.com>
  create mode 100644 gdk/x11/gdkx-without-gl-context.h
 
 diff --git a/configure.ac b/configure.ac
-index 851bcbf..6cbf6a2 100644
+index 9ed65e5..70c6836 100644
 --- a/configure.ac
 +++ b/configure.ac
 @@ -346,6 +346,15 @@ AC_ARG_ENABLE(cloudproviders,
@@ -66,7 +66,7 @@ index 851bcbf..6cbf6a2 100644
  AC_ARG_ENABLE(glx,
                [AS_HELP_STRING([--enable-glx],
                                [When enabled Gdk will try to initialize GLX])])
-@@ -1345,7 +1354,7 @@ CFLAGS="$saved_cflags"
+@@ -1367,7 +1376,7 @@ CFLAGS="$saved_cflags"
  LDFLAGS="$saved_ldflags"
  
  GDK_PACKAGES="$PANGO_PACKAGES gdk-pixbuf-2.0 >= gdk_pixbuf_required_version cairo >= cairo_required_version cairo-gobject >= cairo_required_version"
@@ -75,7 +75,7 @@ index 851bcbf..6cbf6a2 100644
  
  PKG_CHECK_MODULES(GDK_DEP, $GDK_PACKAGES $GDK_PRIVATE_PACKAGES)
  GDK_DEP_LIBS="$GDK_EXTRA_LIBS $GDK_DEP_LIBS $MATH_LIB"
-@@ -1379,7 +1388,7 @@ fi
+@@ -1401,7 +1410,7 @@ fi
  PKG_CHECK_MODULES(ATK, $ATK_PACKAGES)
  
  GTK_PACKAGES="atk >= atk_required_version cairo >= cairo_required_version cairo-gobject >= cairo_required_version gdk-pixbuf-2.0 >= gdk_pixbuf_required_version gio-2.0 >= glib_required_version"
@@ -209,11 +209,11 @@ index 932daf1..54239d6 100644
    info = new_widget_info ("glarea", widget, MEDIUM);
  
    return info;
-diff --git a/gdk/Makefile.am b/gdk/Makefile.am
-index 710a548..b45f631 100644
---- a/gdk/Makefile.am
-+++ b/gdk/Makefile.am
-@@ -274,7 +274,6 @@ x11_introspection_files = 		\
+diff --git a/gdk/gdk-sources.inc b/gdk/gdk-sources.inc
+index 9235edb..eb59524 100644
+--- a/gdk/gdk-sources.inc
++++ b/gdk/gdk-sources.inc
+@@ -146,7 +146,6 @@ x11_introspection_files = 		\
  	x11/gdkeventsource.c		\
  	x11/gdkeventtranslator.c	\
  	x11/gdkgeometry-x11.c		\
@@ -221,7 +221,7 @@ index 710a548..b45f631 100644
  	x11/gdkkeys-x11.c		\
  	x11/gdkmain-x11.c		\
  	x11/gdkmonitor-x11.c		\
-@@ -300,7 +299,6 @@ x11_introspection_files = 		\
+@@ -172,7 +171,6 @@ x11_introspection_files = 		\
  	x11/gdkx11display.h		\
  	x11/gdkx11displaymanager.h	\
  	x11/gdkx11dnd.h			\
@@ -229,19 +229,19 @@ index 710a548..b45f631 100644
  	x11/gdkx11keys.h		\
  	x11/gdkx11monitor.h		\
  	x11/gdkx11property.h		\
-@@ -310,6 +308,12 @@ x11_introspection_files = 		\
+@@ -182,6 +180,12 @@ x11_introspection_files = 		\
  	x11/gdkx11visual.h		\
  	x11/gdkx11window.h
  
 +if HAVE_OPENGL
-+x11_introspection_files += 		\
-+	x11/gdkglcontext-x11.c		\
-+	x11/gdkx11glcontext.h
++x11_introspection_files +=              \
++        x11/gdkglcontext-x11.c          \
++        x11/gdkx11glcontext.h
 +endif
 +
- GdkX11-3.0.gir: libgdk-3.la Gdk-3.0.gir Makefile
- GdkX11_3_0_gir_SCANNERFLAGS = 		\
- 	--identifier-prefix=Gdk		\
+ w32_introspection_files =		\
+ 	win32/gdkcursor-win32.c		\
+ 	win32/gdkdevicemanager-win32.c	\
 diff --git a/gdk/gdkdisplay.c b/gdk/gdkdisplay.c
 index 748f548..911ab2a 100644
 --- a/gdk/gdkdisplay.c
@@ -380,7 +380,7 @@ index 3b23639..1f04f8e 100644
  
  /**
 diff --git a/gdk/gdkwindow.c b/gdk/gdkwindow.c
-index 2de8ba4..1883a79 100644
+index 727b0cf..d4d91b0 100644
 --- a/gdk/gdkwindow.c
 +++ b/gdk/gdkwindow.c
 @@ -45,7 +45,9 @@
@@ -538,10 +538,10 @@ index 7e08f47..30fd7b6 100644
    display_class->get_default_seat = gdk_x11_display_get_default_seat;
  
 diff --git a/gdk/x11/gdkscreen-x11.c b/gdk/x11/gdkscreen-x11.c
-index bb4df05..46f5349 100644
+index c2b7480..114fd4c 100644
 --- a/gdk/x11/gdkscreen-x11.c
 +++ b/gdk/x11/gdkscreen-x11.c
-@@ -1827,3 +1827,8 @@ gdk_x11_screen_get_current_desktop (GdkScreen *screen)
+@@ -1842,3 +1842,8 @@ gdk_x11_screen_get_current_desktop (GdkScreen *screen)
  {
    return get_netwm_cardinal_property (screen, "_NET_CURRENT_DESKTOP");
  }
@@ -551,7 +551,7 @@ index bb4df05..46f5349 100644
 +void _gdk_x11_screen_update_visuals_for_gl (GdkScreen *screen) {}
 +#endif
 diff --git a/gdk/x11/gdkwindow-x11.c b/gdk/x11/gdkwindow-x11.c
-index 721d9bb..8e87acc 100644
+index 194bc82..0302bb6 100644
 --- a/gdk/x11/gdkwindow-x11.c
 +++ b/gdk/x11/gdkwindow-x11.c
 @@ -36,7 +36,9 @@
@@ -564,7 +564,7 @@ index 721d9bb..8e87acc 100644
  #include "gdkprivate-x11.h"
  #include "gdk-private.h"
  
-@@ -5881,7 +5883,9 @@ gdk_window_impl_x11_class_init (GdkWindowImplX11Class *klass)
+@@ -5888,7 +5890,9 @@ gdk_window_impl_x11_class_init (GdkWindowImplX11Class *klass)
    impl_class->set_opaque_region = gdk_x11_window_set_opaque_region;
    impl_class->set_shadow_width = gdk_x11_window_set_shadow_width;
    impl_class->show_window_menu = gdk_x11_window_show_window_menu;
@@ -668,10 +668,10 @@ index 0000000..c9e2617
 +
 +#endif /* __GDK_X_H__ */
 diff --git a/gtk/Makefile.am b/gtk/Makefile.am
-index 074fb35..4fa9eb6 100644
+index 946e72f..b01da7f 100644
 --- a/gtk/Makefile.am
 +++ b/gtk/Makefile.am
-@@ -1457,7 +1457,7 @@ gtktypefuncs.inc: stamp-gtktypebuiltins.h stamp-gtkprivatetypebuiltins.h $(top_s
+@@ -467,7 +467,7 @@ gtktypefuncs.inc: stamp-gtktypebuiltins.h stamp-gtkprivatetypebuiltins.h $(top_s
  	  ${CPP} $(DEFS) $(AM_CPPFLAGS) $(CPPFLAGS) $(AM_CFLAGS) $(CFLAGS) xgen-gtfsrc.c | \
  	  $(GREP) -o '\bg[td]k_[a-zA-Z0-9_]*_get_type\b' | \
  	  sort | uniq | \
@@ -777,7 +777,7 @@ index 802303e..33001cf 100644
  
  static gboolean
 diff --git a/gtk/inspector/general.c b/gtk/inspector/general.c
-index 48237d1..1f9b9be 100644
+index 4fd0c30..a8e59ed 100644
 --- a/gtk/inspector/general.c
 +++ b/gtk/inspector/general.c
 @@ -33,8 +33,10 @@
@@ -791,7 +791,7 @@ index 48237d1..1f9b9be 100644
  
  #ifdef GDK_WINDOWING_WIN32
  #include "win32/gdkwin32.h"
-@@ -196,6 +198,7 @@ add_label_row (GtkInspectorGeneral *gen,
+@@ -217,6 +219,7 @@ add_label_row (GtkInspectorGeneral *gen,
    gtk_size_group_add_widget (GTK_SIZE_GROUP (gen->priv->labels), label);
  }
  
@@ -799,7 +799,7 @@ index 48237d1..1f9b9be 100644
  #ifdef GDK_WINDOWING_X11
  static void
  append_glx_extension_row (GtkInspectorGeneral *gen,
-@@ -205,6 +208,7 @@ append_glx_extension_row (GtkInspectorGeneral *gen,
+@@ -226,6 +229,7 @@ append_glx_extension_row (GtkInspectorGeneral *gen,
    add_check_row (gen, GTK_LIST_BOX (gen->priv->gl_box), ext, epoxy_has_glx_extension (dpy, 0, ext), 0);
  }
  #endif
@@ -807,7 +807,7 @@ index 48237d1..1f9b9be 100644
  
  #ifdef GDK_WINDOWING_WAYLAND
  static void
-@@ -254,6 +258,7 @@ wayland_get_display (struct wl_display *wl_display)
+@@ -275,6 +279,7 @@ wayland_get_display (struct wl_display *wl_display)
  static void
  init_gl (GtkInspectorGeneral *gen)
  {
@@ -815,7 +815,7 @@ index 48237d1..1f9b9be 100644
  #ifdef GDK_WINDOWING_X11
    if (GDK_IS_X11_DISPLAY (gdk_display_get_default ()))
      {
-@@ -280,6 +285,7 @@ init_gl (GtkInspectorGeneral *gen)
+@@ -301,6 +306,7 @@ init_gl (GtkInspectorGeneral *gen)
      }
    else
  #endif
diff --git a/meta/recipes-gnome/gtk+/gtk+3_3.24.34.bb b/meta/recipes-gnome/gtk+/gtk+3_3.24.35.bb
similarity index 89%
rename from meta/recipes-gnome/gtk+/gtk+3_3.24.34.bb
rename to meta/recipes-gnome/gtk+/gtk+3_3.24.35.bb
index f862e143d4..3a63ef57fc 100644
--- a/meta/recipes-gnome/gtk+/gtk+3_3.24.34.bb
+++ b/meta/recipes-gnome/gtk+/gtk+3_3.24.35.bb
@@ -7,7 +7,7 @@ SRC_URI = "http://ftp.gnome.org/pub/gnome/sources/gtk+/${MAJ_VER}/gtk+-${PV}.tar
            file://0003-Add-disable-opengl-configure-option.patch \
            file://link_fribidi.patch \
            "
-SRC_URI[sha256sum] = "dbc69f90ddc821b8d1441f00374dc1da4323a2eafa9078e61edbe5eeefa852ec"
+SRC_URI[sha256sum] = "ec10fe6d712ef0b3c63b5f932639c9d1ae99fce94f500f6f06965629fef60bd1"
 
 S = "${WORKDIR}/gtk+-${PV}"
 
-- 
2.30.2


