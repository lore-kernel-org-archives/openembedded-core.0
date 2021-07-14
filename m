Received: from mail-wr1-f50.google.com (mail-wr1-f50.google.com [209.85.221.50])
 by mx.groups.io with SMTP id smtpd.web11.5923.1626265581457681760
 for <openembedded-core@lists.openembedded.org>;
 Wed, 14 Jul 2021 05:26:21 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20161025 header.b=bEB5dYnE;
 spf=pass (domain: gmail.com, ip: 209.85.221.50, mailfrom: alex.kanavin@gmail.com)
Received: by mail-wr1-f50.google.com with SMTP id d12so2940235wre.13
        for <openembedded-core@lists.openembedded.org>; Wed, 14 Jul 2021 05:26:21 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:content-transfer-encoding;
        bh=KyMYuqBW/og2XOwvcz73n2/hG4OBVG4MXB53S5UJjco=;
        b=bEB5dYnEYdyu7kENz48eHKTJS0I48x0RreUkJJPlcWkjDF0HjQenhkU8gxGPotED7X
         xn7Wvaekc0JAc2DPG4YWE4THl9vHSPhd8NYkJICgQpOY15aJnzyu8yoDW4nrmtwMW95B
         4EMoSGkCSlHufRwy6Tvo87U130xs1i3jjkAtUWOJuozBCt7YsRTqV/gzm8rboVSPPkdG
         vaQqUyBL4/Ay3AZfOv6tv4KuObYTcnPbErF5jmwfKUiFHjuTeL2xiTu5XTGXnsnfdzmR
         +agvjj45kWqvOaFILVhhbg4FiqcliyUS1GmVh8zunIdYPfPReFRrnGnj2C+kcpv6Cm77
         vaJA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=KyMYuqBW/og2XOwvcz73n2/hG4OBVG4MXB53S5UJjco=;
        b=dZ3z4FxUqmvlclsLZEuLDoSEJt5qlfLw7D6MAR/upCDOmDkn8vcg9v4SM9TRqNoNIT
         jXETTyQyQnOih+726DdIjXETtwzGjZLOs8dxuHnN6p5oh3h+KKA1zPgrNfMUSb1PihpK
         LigGPzfq+U+3UyEcmk6fQL9YB5b8hWyQT8Ajg5E5SctMwe6ne2CFrQSy/Qf9UeFjcD66
         LJEoyNRCpK6j80J0CZqwFOVXb1zVhFJJaz6vAVkBXWDF6KCJtIVgpxwTmhdsUdrjaXgs
         7qwQmrSNSzQZK/ThrxG8yPZrUyb/xdonlJu+kNJWtMNYeKhM16v+etjFCG79IpPdEgbn
         au0A==
X-Gm-Message-State: AOAM532kUkQSXouH6CTjBSyG9LGOwvS/o/fEARrWQbY+wBoIfwp73Fw8
	o+dDvpoXitzP3NsSzRhgcd7zWHQiWYw=
X-Google-Smtp-Source: ABdhPJzODmk/nhLUSzfzAm7mkw3ym5EvhveRKLtSNkoI1GWb3VUX70gowAY3a4l4n9ShSSCvT4pXtA==
X-Received: by 2002:a5d:544f:: with SMTP id w15mr12582415wrv.151.1626265580068;
        Wed, 14 Jul 2021 05:26:20 -0700 (PDT)
Return-Path: <alex.kanavin@gmail.com>
Received: from localhost.localdomain ([2a02:2454:2a0:cb00:eb83:2e01:3dda:5d46])
        by smtp.gmail.com with ESMTPSA id g18sm1969395wmk.37.2021.07.14.05.26.19
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 14 Jul 2021 05:26:19 -0700 (PDT)
From: "Alexander Kanavin" <alex.kanavin@gmail.com>
To: openembedded-core@lists.openembedded.org
Cc: Alexander Kanavin <alex.kanavin@gmail.com>
Subject: [PATCH 11/21] gtk+3: upgrade 3.24.29 -> 3.24.30
Date: Wed, 14 Jul 2021 14:25:56 +0200
Message-Id: <20210714122606.605142-11-alex.kanavin@gmail.com>
X-Mailer: git-send-email 2.31.1
In-Reply-To: <20210714122606.605142-1-alex.kanavin@gmail.com>
References: <20210714122606.605142-1-alex.kanavin@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

cloudprint support removed upstream:
https://gitlab.gnome.org/GNOME/gtk/-/commit/c77ea5101e55b8690127beed14b26dd3520889b5

Signed-off-by: Alexander Kanavin <alex.kanavin@gmail.com>
---
 meta/recipes-gnome/gtk+/gtk+3.inc             |  1 -
 ...-Add-disable-opengl-configure-option.patch | 44 +++++++++----------
 .../{gtk+3_3.24.29.bb => gtk+3_3.24.30.bb}    |  2 +-
 3 files changed, 23 insertions(+), 24 deletions(-)
 rename meta/recipes-gnome/gtk+/{gtk+3_3.24.29.bb => gtk+3_3.24.30.bb} (89%)

diff --git a/meta/recipes-gnome/gtk+/gtk+3.inc b/meta/recipes-gnome/gtk+/gtk+3.inc
index 8d5edb7ee8..1445c406d8 100644
--- a/meta/recipes-gnome/gtk+/gtk+3.inc
+++ b/meta/recipes-gnome/gtk+/gtk+3.inc
@@ -63,7 +63,6 @@ PACKAGECONFIG[opengl] = "--enable-opengl,--disable-opengl,libepoxy"
 PACKAGECONFIG[glx] = "--enable-glx,--disable-glx,,libgl"
 PACKAGECONFIG[wayland] = "--enable-wayland-backend,--disable-wayland-backend,wayland wayland-protocols libxkbcommon virtual/egl virtual/libgles2 wayland-native"
 PACKAGECONFIG[cups] = "--enable-cups,--disable-cups,cups"
-PACKAGECONFIG[cloudprint] = "--enable-cloudprint,--disable-cloudprint,rest json-glib"
 PACKAGECONFIG[colord] = "--enable-colord,--disable-colord,colord"
 
 prepare_gtk_scripts() {
diff --git a/meta/recipes-gnome/gtk+/gtk+3/0003-Add-disable-opengl-configure-option.patch b/meta/recipes-gnome/gtk+/gtk+3/0003-Add-disable-opengl-configure-option.patch
index 398c9bc36a..35cbab8761 100644
--- a/meta/recipes-gnome/gtk+/gtk+3/0003-Add-disable-opengl-configure-option.patch
+++ b/meta/recipes-gnome/gtk+/gtk+3/0003-Add-disable-opengl-configure-option.patch
@@ -1,4 +1,4 @@
-From f83fcf1991afad6d9c15546b2ccd775dad4e314c Mon Sep 17 00:00:00 2001
+From eef50c94587fc30cd624adb5eb213eb9fa663dc1 Mon Sep 17 00:00:00 2001
 From: Jussi Kukkonen <jussi.kukkonen@intel.com>
 Date: Tue, 21 Jun 2016 15:11:39 +0300
 Subject: [PATCH] Add --disable-opengl configure option
@@ -47,7 +47,7 @@ Signed-off-by: Jussi Kukkonen <jussi.kukkonen@intel.com>
  create mode 100644 gdk/x11/gdkx-without-gl-context.h
 
 diff --git a/configure.ac b/configure.ac
-index bd651bb..b4c061f 100644
+index 851bcbf..6cbf6a2 100644
 --- a/configure.ac
 +++ b/configure.ac
 @@ -346,6 +346,15 @@ AC_ARG_ENABLE(cloudproviders,
@@ -210,7 +210,7 @@ index 932daf1..54239d6 100644
  
    return info;
 diff --git a/gdk/Makefile.am b/gdk/Makefile.am
-index 479d6a1..7edbee8 100644
+index 710a548..b45f631 100644
 --- a/gdk/Makefile.am
 +++ b/gdk/Makefile.am
 @@ -274,7 +274,6 @@ x11_introspection_files = 		\
@@ -243,10 +243,10 @@ index 479d6a1..7edbee8 100644
  GdkX11_3_0_gir_SCANNERFLAGS = 		\
  	--identifier-prefix=Gdk		\
 diff --git a/gdk/gdkdisplay.c b/gdk/gdkdisplay.c
-index 240c99f..9eb49bf 100644
+index 748f548..911ab2a 100644
 --- a/gdk/gdkdisplay.c
 +++ b/gdk/gdkdisplay.c
-@@ -2419,7 +2419,9 @@ gboolean
+@@ -2420,7 +2420,9 @@ gboolean
  gdk_display_make_gl_context_current (GdkDisplay   *display,
                                       GdkGLContext *context)
  {
@@ -258,7 +258,7 @@ index 240c99f..9eb49bf 100644
  
  GdkRenderingMode
 diff --git a/gdk/gdkgl.c b/gdk/gdkgl.c
-index 933e204..1767508 100644
+index 9690077..55f85ef 100644
 --- a/gdk/gdkgl.c
 +++ b/gdk/gdkgl.c
 @@ -26,7 +26,9 @@
@@ -334,7 +334,7 @@ index 933e204..1767508 100644
 +#endif
  }
 diff --git a/gdk/gdkglcontext.c b/gdk/gdkglcontext.c
-index dfbed63..556f0a3 100644
+index 3b23639..1f04f8e 100644
 --- a/gdk/gdkglcontext.c
 +++ b/gdk/gdkglcontext.c
 @@ -85,7 +85,9 @@
@@ -380,7 +380,7 @@ index dfbed63..556f0a3 100644
  
  /**
 diff --git a/gdk/gdkwindow.c b/gdk/gdkwindow.c
-index 6ae0f86..4e48a2a 100644
+index 2de8ba4..1883a79 100644
 --- a/gdk/gdkwindow.c
 +++ b/gdk/gdkwindow.c
 @@ -45,7 +45,9 @@
@@ -513,7 +513,7 @@ index 32b1f24..6352313 100644
 +
  -include $(top_srcdir)/git.mk
 diff --git a/gdk/x11/gdkdisplay-x11.c b/gdk/x11/gdkdisplay-x11.c
-index 817944e..e7a2947 100644
+index 7e08f47..30fd7b6 100644
 --- a/gdk/x11/gdkdisplay-x11.c
 +++ b/gdk/x11/gdkdisplay-x11.c
 @@ -37,7 +37,9 @@
@@ -526,7 +526,7 @@ index 817944e..e7a2947 100644
  #include "gdk-private.h"
  #include "gdkprofilerprivate.h"
  
-@@ -3188,7 +3190,9 @@ gdk_x11_display_class_init (GdkX11DisplayClass * class)
+@@ -3191,7 +3193,9 @@ gdk_x11_display_class_init (GdkX11DisplayClass * class)
    display_class->text_property_to_utf8_list = _gdk_x11_display_text_property_to_utf8_list;
    display_class->utf8_to_string_target = _gdk_x11_display_utf8_to_string_target;
  
@@ -538,10 +538,10 @@ index 817944e..e7a2947 100644
    display_class->get_default_seat = gdk_x11_display_get_default_seat;
  
 diff --git a/gdk/x11/gdkscreen-x11.c b/gdk/x11/gdkscreen-x11.c
-index 8939ae9..931bff9 100644
+index bb4df05..46f5349 100644
 --- a/gdk/x11/gdkscreen-x11.c
 +++ b/gdk/x11/gdkscreen-x11.c
-@@ -1723,3 +1723,8 @@ gdk_x11_screen_get_current_desktop (GdkScreen *screen)
+@@ -1827,3 +1827,8 @@ gdk_x11_screen_get_current_desktop (GdkScreen *screen)
  {
    return get_netwm_cardinal_property (screen, "_NET_CURRENT_DESKTOP");
  }
@@ -551,7 +551,7 @@ index 8939ae9..931bff9 100644
 +void _gdk_x11_screen_update_visuals_for_gl (GdkScreen *screen) {}
 +#endif
 diff --git a/gdk/x11/gdkwindow-x11.c b/gdk/x11/gdkwindow-x11.c
-index 1fe7b90..d23a347 100644
+index 721d9bb..8e87acc 100644
 --- a/gdk/x11/gdkwindow-x11.c
 +++ b/gdk/x11/gdkwindow-x11.c
 @@ -36,7 +36,9 @@
@@ -564,7 +564,7 @@ index 1fe7b90..d23a347 100644
  #include "gdkprivate-x11.h"
  #include "gdk-private.h"
  
-@@ -5861,7 +5863,9 @@ gdk_window_impl_x11_class_init (GdkWindowImplX11Class *klass)
+@@ -5881,7 +5883,9 @@ gdk_window_impl_x11_class_init (GdkWindowImplX11Class *klass)
    impl_class->set_opaque_region = gdk_x11_window_set_opaque_region;
    impl_class->set_shadow_width = gdk_x11_window_set_shadow_width;
    impl_class->show_window_menu = gdk_x11_window_show_window_menu;
@@ -668,10 +668,10 @@ index 0000000..c9e2617
 +
 +#endif /* __GDK_X_H__ */
 diff --git a/gtk/Makefile.am b/gtk/Makefile.am
-index eaca473..99352d1 100644
+index 074fb35..4fa9eb6 100644
 --- a/gtk/Makefile.am
 +++ b/gtk/Makefile.am
-@@ -1449,7 +1449,7 @@ gtktypefuncs.inc: stamp-gtktypebuiltins.h stamp-gtkprivatetypebuiltins.h $(top_s
+@@ -1457,7 +1457,7 @@ gtktypefuncs.inc: stamp-gtktypebuiltins.h stamp-gtkprivatetypebuiltins.h $(top_s
  	  ${CPP} $(DEFS) $(AM_CPPFLAGS) $(CPPFLAGS) $(AM_CFLAGS) $(CFLAGS) xgen-gtfsrc.c | \
  	  $(GREP) -o '\bg[td]k_[a-zA-Z0-9_]*_get_type\b' | \
  	  sort | uniq | \
@@ -681,7 +681,7 @@ index eaca473..99352d1 100644
  $(srcdir)/gtktestutils.c: gtktypefuncs.inc
  
 diff --git a/gtk/gtkglarea.c b/gtk/gtkglarea.c
-index 9a56443..7de0db2 100644
+index 802303e..33001cf 100644
 --- a/gtk/gtkglarea.c
 +++ b/gtk/gtkglarea.c
 @@ -29,7 +29,9 @@
@@ -724,8 +724,8 @@ index 9a56443..7de0db2 100644
  
    g_return_if_fail (GTK_IS_GL_AREA (area));
 @@ -533,11 +540,13 @@ gtk_gl_area_attach_buffers (GtkGLArea *area)
-         glFramebufferRenderbufferEXT (GL_FRAMEBUFFER_EXT, GL_STENCIL_ATTACHMENT_EXT,
-                                       GL_RENDERBUFFER_EXT, priv->depth_stencil_buffer);
+         glFramebufferRenderbuffer (GL_FRAMEBUFFER, GL_STENCIL_ATTACHMENT,
+                                    GL_RENDERBUFFER, priv->depth_stencil_buffer);
      }
 +#endif
  }
@@ -738,7 +738,7 @@ index 9a56443..7de0db2 100644
  
    if (priv->context == NULL)
 @@ -569,6 +578,7 @@ gtk_gl_area_delete_buffers (GtkGLArea *area)
-       glDeleteFramebuffersEXT (1, &priv->frame_buffer);
+       glDeleteFramebuffers (1, &priv->frame_buffer);
        priv->frame_buffer = 0;
      }
 +#endif
@@ -777,7 +777,7 @@ index 9a56443..7de0db2 100644
  
  static gboolean
 diff --git a/gtk/inspector/general.c b/gtk/inspector/general.c
-index c241ec8..24576dd 100644
+index 48237d1..1f9b9be 100644
 --- a/gtk/inspector/general.c
 +++ b/gtk/inspector/general.c
 @@ -33,8 +33,10 @@
@@ -824,7 +824,7 @@ index c241ec8..24576dd 100644
    if (GDK_IS_WAYLAND_DISPLAY (gdk_display_get_default ()))
      {
 diff --git a/tests/Makefile.am b/tests/Makefile.am
-index ee1e8b5..e6c6502 100644
+index f283e89..5e7180e 100644
 --- a/tests/Makefile.am
 +++ b/tests/Makefile.am
 @@ -80,8 +80,6 @@ noinst_PROGRAMS =  $(TEST_PROGS)	\
diff --git a/meta/recipes-gnome/gtk+/gtk+3_3.24.29.bb b/meta/recipes-gnome/gtk+/gtk+3_3.24.30.bb
similarity index 89%
rename from meta/recipes-gnome/gtk+/gtk+3_3.24.29.bb
rename to meta/recipes-gnome/gtk+/gtk+3_3.24.30.bb
index 031fbb6d66..7e7566f9af 100644
--- a/meta/recipes-gnome/gtk+/gtk+3_3.24.29.bb
+++ b/meta/recipes-gnome/gtk+/gtk+3_3.24.30.bb
@@ -8,7 +8,7 @@ SRC_URI = "http://ftp.gnome.org/pub/gnome/sources/gtk+/${MAJ_VER}/gtk+-${PV}.tar
            file://0003-Add-disable-opengl-configure-option.patch \
            file://link_fribidi.patch \
            "
-SRC_URI[sha256sum] = "f57ec4ade8f15cab0c23a80dcaee85b876e70a8823d9105f067ce335a8268caa"
+SRC_URI[sha256sum] = "ba75bfff320ad1f4cfbee92ba813ec336322cc3c660d406aad014b07087a3ba9"
 
 S = "${WORKDIR}/gtk+-${PV}"
 
-- 
2.31.1

