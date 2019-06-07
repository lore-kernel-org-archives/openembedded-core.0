Return-Path: <alex.kanavin@gmail.com>
Received: from mail-wr1-f67.google.com (mail-wr1-f67.google.com
	[209.85.221.67])
	by mail.openembedded.org (Postfix) with ESMTP id A231E6B073
	for <openembedded-core@lists.openembedded.org>;
	Fri,  7 Jun 2019 12:20:06 +0000 (UTC)
Received: by mail-wr1-f67.google.com with SMTP id f9so1935849wre.12
	for <openembedded-core@lists.openembedded.org>;
	Fri, 07 Jun 2019 05:20:08 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=from:to:cc:subject:date:message-id:in-reply-to:references;
	bh=B/DKs4Dabp8iRFoI57QQYjq2GjuR7RUiMKMbdDJUAEo=;
	b=k+oJ/yKC4PtGD5a4BdlPAuevcjMmNohS697eyIO6L9Ehvom1xjfVMLbP3YNEM3cwlC
	HvRZCIEX6txFSnxosY2XL7Dl6dC8h4+Z6ksf4jTon8zNhtTCNc7v1K9nw9R1W+PSqCSO
	+X+g1gFHZ6WIEjbcjWXaA47FQ3rvhoSfgXBbGvZR0It8xidlBfQ36e0jgjBnkxYPBhhM
	+YatTD4DfR4XksnS9Dg4gjhFpDOyC3uzQLiH5x0jJVUcc/GH4hPcHJlxFwGQLhy3BqJ9
	mzsyZXyP2jCKM0FgCdF23gfY4co53B2eUZVtbAlSO66ByVwpTc75RHblFQQwi8wexBar
	v+XQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
	:references;
	bh=B/DKs4Dabp8iRFoI57QQYjq2GjuR7RUiMKMbdDJUAEo=;
	b=aoUk2F6c/eL+QxZHOJypEuyKbPqdLvkARuaI1h5f+qHf96htPVZ88YEZA+Z280WMph
	RUkbc3V3bl8snBC8M6l/2G6CCrlFoWNFWnFrYc6DM45nQ17LhSyUDBC/Ct+14MY2W35A
	kq06fhcydhQCMno5LryxgjtPXINN8TzfS4GTu47eS8vQT5uTwb08jWHgsb5iaSOskI8l
	hbxqTSC8l7k1xpAoS4B9P5TrXsPFGKHMYWSeSGPEERs+wisE6RR61gSnEYfUBlqBC5QD
	ch1+PIQIR0+qJ17xbek0fY5Jhubga6apkoDK0tmsSqremjoHNDf7Xe1q6FJdToC6SLqK
	PBRQ==
X-Gm-Message-State: APjAAAWAbyFeNq9NZp2jNopYLAsbOG8pazscI1Nnt7NIihy+EZDtokwV
	terFEQy3gmiNHiOO4G9RL2+RNIQX/5U=
X-Google-Smtp-Source: APXvYqzuyGOMGfIq4QtcCrIUSOoOdoLtawy52UPP3CkR9ZlPj8GoQBEt0IB2H03pOcaQO3vs0Kgz1g==
X-Received: by 2002:adf:fe4e:: with SMTP id m14mr10054698wrs.21.1559910007180; 
	Fri, 07 Jun 2019 05:20:07 -0700 (PDT)
Received: from alexander-box.luxoft.com ([62.96.135.139])
	by smtp.gmail.com with ESMTPSA id
	d10sm2694657wrh.91.2019.06.07.05.20.06
	(version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
	Fri, 07 Jun 2019 05:20:06 -0700 (PDT)
From: Alexander Kanavin <alex.kanavin@gmail.com>
To: openembedded-core@lists.openembedded.org
Date: Fri,  7 Jun 2019 14:19:54 +0200
Message-Id: <20190607121954.116898-3-alex.kanavin@gmail.com>
X-Mailer: git-send-email 2.17.1
In-Reply-To: <20190607121954.116898-1-alex.kanavin@gmail.com>
References: <20190607121954.116898-1-alex.kanavin@gmail.com>
Subject: [PATCH 3/3] gtk+3: update 3.24.5 -> 3.24.8
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
X-List-Received-Date: Fri, 07 Jun 2019 12:20:07 -0000

Rebase 0003-Add-disable-opengl-configure-option.patch

Signed-off-by: Alexander Kanavin <alex.kanavin@gmail.com>
---
 ...-Add-disable-opengl-configure-option.patch | 41 ++++++++++---------
 .../gtk+/{gtk+3_3.24.5.bb => gtk+3_3.24.8.bb} |  4 +-
 2 files changed, 23 insertions(+), 22 deletions(-)
 rename meta/recipes-gnome/gtk+/{gtk+3_3.24.5.bb => gtk+3_3.24.8.bb} (84%)

diff --git a/meta/recipes-gnome/gtk+/gtk+3/0003-Add-disable-opengl-configure-option.patch b/meta/recipes-gnome/gtk+/gtk+3/0003-Add-disable-opengl-configure-option.patch
index e5a67d098e7..e09748893ff 100644
--- a/meta/recipes-gnome/gtk+/gtk+3/0003-Add-disable-opengl-configure-option.patch
+++ b/meta/recipes-gnome/gtk+/gtk+3/0003-Add-disable-opengl-configure-option.patch
@@ -1,4 +1,4 @@
-From 9e243474eea4330b593e0f6dd418b61b79699d8b Mon Sep 17 00:00:00 2001
+From 1b317122180a8108f253028379976701c4abd30e Mon Sep 17 00:00:00 2001
 From: Jussi Kukkonen <jussi.kukkonen@intel.com>
 Date: Tue, 21 Jun 2016 15:11:39 +0300
 Subject: [PATCH] Add --disable-opengl configure option
@@ -46,10 +46,10 @@ Signed-off-by: Jussi Kukkonen <jussi.kukkonen@intel.com>
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
@@ -65,21 +65,21 @@ index a91b29c..561d3b5 100644
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
@@ -209,10 +209,10 @@ index 932daf1..54239d6 100644
  
    return info;
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
@@ -346,7 +346,7 @@ index dfbed63..556f0a3 100644
  
  /**
 diff --git a/gdk/gdkwindow.c b/gdk/gdkwindow.c
-index 6b231f0..904b86d 100644
+index 1416409..e3b5630 100644
 --- a/gdk/gdkwindow.c
 +++ b/gdk/gdkwindow.c
 @@ -45,7 +45,9 @@
@@ -478,7 +478,7 @@ index 6289f3a..cbbac79 100644
 +
  -include $(top_srcdir)/git.mk
 diff --git a/gdk/x11/gdkdisplay-x11.c b/gdk/x11/gdkdisplay-x11.c
-index 659b9fa..b15536b 100644
+index 5b95196..9a2f2a2 100644
 --- a/gdk/x11/gdkdisplay-x11.c
 +++ b/gdk/x11/gdkdisplay-x11.c
 @@ -37,7 +37,9 @@
@@ -491,7 +491,7 @@ index 659b9fa..b15536b 100644
  #include "gdk-private.h"
  
  #include <glib.h>
-@@ -3194,7 +3196,9 @@ gdk_x11_display_class_init (GdkX11DisplayClass * class)
+@@ -3184,7 +3186,9 @@ gdk_x11_display_class_init (GdkX11DisplayClass * class)
    display_class->text_property_to_utf8_list = _gdk_x11_display_text_property_to_utf8_list;
    display_class->utf8_to_string_target = _gdk_x11_display_utf8_to_string_target;
  
@@ -516,7 +516,7 @@ index 272cecd..2bb34ac 100644
 +void _gdk_x11_screen_update_visuals_for_gl (GdkScreen *screen) {}
 +#endif
 diff --git a/gdk/x11/gdkwindow-x11.c b/gdk/x11/gdkwindow-x11.c
-index c6205e4..df2334f 100644
+index f92a146..89f900a 100644
 --- a/gdk/x11/gdkwindow-x11.c
 +++ b/gdk/x11/gdkwindow-x11.c
 @@ -36,7 +36,9 @@
@@ -529,7 +529,7 @@ index c6205e4..df2334f 100644
  #include "gdkprivate-x11.h"
  #include "gdk-private.h"
  
-@@ -5804,7 +5806,9 @@ gdk_window_impl_x11_class_init (GdkWindowImplX11Class *klass)
+@@ -5839,7 +5841,9 @@ gdk_window_impl_x11_class_init (GdkWindowImplX11Class *klass)
    impl_class->set_opaque_region = gdk_x11_window_set_opaque_region;
    impl_class->set_shadow_width = gdk_x11_window_set_shadow_width;
    impl_class->show_window_menu = gdk_x11_window_show_window_menu;
@@ -633,17 +633,18 @@ index 0000000..c9e2617
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


