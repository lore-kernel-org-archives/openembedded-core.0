Return-Path: <alex.kanavin@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 5DA14C54EBC
	for <webhook@archiver.kernel.org>; Wed,  4 Jan 2023 11:06:01 +0000 (UTC)
Received: from mail-wm1-f45.google.com (mail-wm1-f45.google.com [209.85.128.45])
 by mx.groups.io with SMTP id smtpd.web10.9364.1672830359305673940
 for <openembedded-core@lists.openembedded.org>;
 Wed, 04 Jan 2023 03:05:59 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20210112 header.b=mchzFaNT;
 spf=pass (domain: gmail.com, ip: 209.85.128.45, mailfrom: alex.kanavin@gmail.com)
Received: by mail-wm1-f45.google.com with SMTP id z8-20020a05600c220800b003d33b0bda11so694466wml.0
        for <openembedded-core@lists.openembedded.org>; Wed, 04 Jan 2023 03:05:59 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=x8+U2Rkc2uxwh09aFJjIVNfh3raZL/sE7DDUP3stmWM=;
        b=mchzFaNT1OF6kLD1n1odZQbZZ5trrpDZHnOQeUFl8IE4OgidSlsTpHtCJx1GrQDnLm
         izRHsSgRgj2rVT9UkfZ6/gWDstaYX3nOhnTjmxlzSJ6QXMCnXrmRxCBIFQ3YzkXjuxDa
         L6Yi/rg0X7PoTIS1WxsSQs5xARD8HPsyBlKOdn3ZuAn3hBvK46kVWJL5ouICQarolLJc
         sDfrmsUtSGZDKrhej+yWYOMOwVCuCF3x9csYZeeLHnxH2IibWI4CFXUt2/b5qS+od2mg
         X6lqKh2YhZex3xG7FS543m+Mwsay8OkbyblI1aY9ash1Nyv45VEobV0QfsvahWasANn3
         hORw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=x8+U2Rkc2uxwh09aFJjIVNfh3raZL/sE7DDUP3stmWM=;
        b=tD0qt5Nysnz4GMrcpQ1eyJrafxoTi4hWYhBD/JgeA+FIaP8NwVrGfjTnMYJllj6XWJ
         bsasyYZVXe1Dh7D/ijkRVgNJmp404zYN1z3aloHG3hPJWQ+kpRw5LeSlARSiCi97o0yE
         CFEtmM3HVYl7XxADCBkuPagIrpkDoU+KMFXxztYGFPu6ivwT4DZ1RHVtNy8mdLrneOsC
         PynJbxs80n4JepP2Iq/+C51FjLUBmk4yw/7JOcRzBg1AjVkAzudwK5YENZaNDEFWkkaF
         zBV9Ea/Dqv9obHe/P/evpINjIQqxENtBfES4ERchE7wojnrqyOj5Of2PeUTb4oDYISR6
         XUhA==
X-Gm-Message-State: AFqh2kqVALdxyQgyALZOzlc0ydhSS0pWz6vwg1XW76M03MLW0+DLlie2
	2SYqT3f4odSiIfumLK0uWtfSaDHN3M4=
X-Google-Smtp-Source: AMrXdXvxaV8mdRxcnYRyiX4edeM7RajuFfDk6wmoZOgFTVCRT+914Rtxb0yAlyPaRTvgQFUH1hGqvQ==
X-Received: by 2002:a05:600c:4fcf:b0:3d1:d396:1ade with SMTP id o15-20020a05600c4fcf00b003d1d3961ademr33341735wmq.9.1672830357673;
        Wed, 04 Jan 2023 03:05:57 -0800 (PST)
Received: from Zen2.lab.linutronix.de. (drugstore.linutronix.de. [80.153.143.164])
        by smtp.gmail.com with ESMTPSA id h15-20020adfaa8f000000b002421888a011sm34102161wrc.69.2023.01.04.03.05.56
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 04 Jan 2023 03:05:56 -0800 (PST)
From: Alexander Kanavin <alex.kanavin@gmail.com>
X-Google-Original-From: Alexander Kanavin <alex@linutronix.de>
To: openembedded-core@lists.openembedded.org
Cc: Alexander Kanavin <alex@linutronix.de>
Subject: [PATCH 06/77] gtk+3: update 3.24.35 -> 3.24.36
Date: Wed,  4 Jan 2023 12:04:37 +0100
Message-Id: <20230104110548.2537259-6-alex@linutronix.de>
X-Mailer: git-send-email 2.30.2
In-Reply-To: <20230104110548.2537259-1-alex@linutronix.de>
References: <20230104110548.2537259-1-alex@linutronix.de>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Wed, 04 Jan 2023 11:06:01 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/175391

Drop autotools-specific chunks in opengl.patch.

Drop add-missing-meson.build.patch (.35 tarball issue)
Drop buildpaths.patch (backport)

Signed-off-by: Alexander Kanavin <alex@linutronix.de>
---
 ...d-introspection-according-to-option-.patch | 34 +++++++++++
 .../gtk+/gtk+3/add-missing-meson.build.patch  | 38 -------------
 .../recipes-gnome/gtk+/gtk+3/buildpaths.patch | 57 -------------------
 meta/recipes-gnome/gtk+/gtk+3/opengl.patch    | 48 ++++------------
 .../{gtk+3_3.24.35.bb => gtk+3_3.24.36.bb}    |  5 +-
 5 files changed, 46 insertions(+), 136 deletions(-)
 create mode 100644 meta/recipes-gnome/gtk+/gtk+3/0001-meson.build-build-introspection-according-to-option-.patch
 delete mode 100644 meta/recipes-gnome/gtk+/gtk+3/add-missing-meson.build.patch
 delete mode 100644 meta/recipes-gnome/gtk+/gtk+3/buildpaths.patch
 rename meta/recipes-gnome/gtk+/{gtk+3_3.24.35.bb => gtk+3_3.24.36.bb} (76%)

diff --git a/meta/recipes-gnome/gtk+/gtk+3/0001-meson.build-build-introspection-according-to-option-.patch b/meta/recipes-gnome/gtk+/gtk+3/0001-meson.build-build-introspection-according-to-option-.patch
new file mode 100644
index 0000000000..11effd421f
--- /dev/null
+++ b/meta/recipes-gnome/gtk+/gtk+3/0001-meson.build-build-introspection-according-to-option-.patch
@@ -0,0 +1,34 @@
+From 6e533d5598ef875f30b84d931aae11b768465869 Mon Sep 17 00:00:00 2001
+From: Alexander Kanavin <alex@linutronix.de>
+Date: Mon, 2 Jan 2023 15:00:02 +0100
+Subject: [PATCH] meson.build: build introspection according to option only
+
+The way the check is written, if the build is native, then the
+introspection option has no effect.
+
+Particularly yocto project does want to disable introspection in
+native builds and enable it in cross builds (both via the option),
+and without this patch the former is not possible.
+
+Upstream-Status: Submitted [https://gitlab.gnome.org/GNOME/gtk/-/merge_requests/5382]
+Signed-off-by: Alexander Kanavin <alex@linutronix.de>
+---
+ meson.build | 2 +-
+ 1 file changed, 1 insertion(+), 1 deletion(-)
+
+diff --git a/meson.build b/meson.build
+index bfc33af0f6..94ffaa7769 100644
+--- a/meson.build
++++ b/meson.build
+@@ -854,7 +854,7 @@ endif
+ 
+ # Introspection
+ gir = find_program('g-ir-scanner', required : get_option('introspection'))
+-build_gir = gir.found() and (not meson.is_cross_build() or get_option('introspection'))
++build_gir = gir.found() and get_option('introspection')
+ 
+ subdir('gdk')
+ subdir('gtk')
+-- 
+2.30.2
+
diff --git a/meta/recipes-gnome/gtk+/gtk+3/add-missing-meson.build.patch b/meta/recipes-gnome/gtk+/gtk+3/add-missing-meson.build.patch
deleted file mode 100644
index ef971ccff4..0000000000
--- a/meta/recipes-gnome/gtk+/gtk+3/add-missing-meson.build.patch
+++ /dev/null
@@ -1,38 +0,0 @@
-From 8a00d0269d547799b598adda364ad6c6ee328e6b Mon Sep 17 00:00:00 2001
-From: Ross Burton <ross.burton@arm.com>
-Date: Tue, 20 Dec 2022 12:09:07 +0000
-Subject: [PATCH] Add missing meson.build
-
-This file was missing from the tarball, but will be in the .36 release.
-
-Upstream-Status: Inappropriate
-Signed-off-by: Ross Burton <ross.burton@arm.com>
-
----
- gdk/wayland/cursor/meson.build | 14 ++++++++++++++
- 1 file changed, 14 insertions(+)
- create mode 100644 gdk/wayland/cursor/meson.build
-
-diff --git a/gdk/wayland/cursor/meson.build b/gdk/wayland/cursor/meson.build
-new file mode 100644
-index 0000000..94cf47a
---- /dev/null
-+++ b/gdk/wayland/cursor/meson.build
-@@ -0,0 +1,14 @@
-+# This file is missing from the 3.24.35 tarball
-+
-+wayland_cursor_sources = files([
-+  'wayland-cursor.c',
-+  'xcursor.c',
-+  'os-compatibility.c'
-+])
-+
-+libwayland_cursor = static_library('wayland+cursor',
-+  sources: wayland_cursor_sources,
-+  include_directories: [ confinc, ],
-+  dependencies: [ glib_dep, wlclientdep, ],
-+  c_args: common_cflags,
-+)
--- 
-2.34.1
-
diff --git a/meta/recipes-gnome/gtk+/gtk+3/buildpaths.patch b/meta/recipes-gnome/gtk+/gtk+3/buildpaths.patch
deleted file mode 100644
index 627d1d4b7e..0000000000
--- a/meta/recipes-gnome/gtk+/gtk+3/buildpaths.patch
+++ /dev/null
@@ -1,57 +0,0 @@
-Use basename not full filename to remove buildpaths from the packages.
-
-Upstream-Status: Backport [8eb4e59613a0979757332eb833231b947d61f13d]
-Signed-off-by: Ross Burton <ross.burton@arm.com>
-
-diff --git a/gdk/gdkenumtypes.c.template b/gdk/gdkenumtypes.c.template
-index df9edfefa1..c5104e0e0d 100644
---- a/gdk/gdkenumtypes.c.template
-+++ b/gdk/gdkenumtypes.c.template
-@@ -5,7 +5,7 @@
- /*** END file-header ***/
- 
- /*** BEGIN file-production ***/
--/* enumerations from "@filename@" */
-+/* enumerations from "@basename@" */
- /*** END file-production ***/
- 
- /*** BEGIN value-header ***/
-diff --git a/gtk/gtkprivatetypebuiltins.c.template b/gtk/gtkprivatetypebuiltins.c.template
-index 2565208bfc..d7961be8ef 100644
---- a/gtk/gtkprivatetypebuiltins.c.template
-+++ b/gtk/gtkprivatetypebuiltins.c.template
-@@ -7,7 +7,7 @@
- /*** END file-header ***/
- 
- /*** BEGIN file-production ***/
--/* enumerations from "@filename@" */
-+/* enumerations from "@basename@" */
- /*** END file-production ***/
- 
- /*** BEGIN value-header ***/
-diff --git a/gtk/gtkprivatetypebuiltins.h.template b/gtk/gtkprivatetypebuiltins.h.template
-index a21e9aac05..5ecd4d392f 100644
---- a/gtk/gtkprivatetypebuiltins.h.template
-+++ b/gtk/gtkprivatetypebuiltins.h.template
-@@ -14,7 +14,7 @@ G_BEGIN_DECLS
- 
- /*** BEGIN file-production ***/
- 
--/* enumerations from "@filename@" */
-+/* enumerations from "@basename@" */
- /*** END file-production ***/
- 
- /*** BEGIN value-header ***/
-diff --git a/gtk/gtktypebuiltins.c.template b/gtk/gtktypebuiltins.c.template
-index f4d748b7b9..9a5a360f09 100644
---- a/gtk/gtktypebuiltins.c.template
-+++ b/gtk/gtktypebuiltins.c.template
-@@ -6,7 +6,7 @@
- /*** END file-header ***/
- 
- /*** BEGIN file-production ***/
--/* enumerations from "@filename@" */
-+/* enumerations from "@basename@" */
- /*** END file-production ***/
- 
- /*** BEGIN value-header ***/
diff --git a/meta/recipes-gnome/gtk+/gtk+3/opengl.patch b/meta/recipes-gnome/gtk+/gtk+3/opengl.patch
index ddec2c72d7..7354265e10 100644
--- a/meta/recipes-gnome/gtk+/gtk+3/opengl.patch
+++ b/meta/recipes-gnome/gtk+/gtk+3/opengl.patch
@@ -1,4 +1,4 @@
-From a6fb8ee9cfd5e0f8c4450d48b582614e2de8201c Mon Sep 17 00:00:00 2001
+From 4a0716f04fb25b51b08e994bd5a900b2e7f7fed5 Mon Sep 17 00:00:00 2001
 From: Jussi Kukkonen <jussi.kukkonen@intel.com>
 Date: Fri, 16 Oct 2015 16:35:16 +0300
 Subject: [PATCH] Do not try to initialize GL without libGL
@@ -16,7 +16,6 @@ before calling epoxy APIs.
 Upstream-Status: Denied
 Signed-off-by: Jussi Kukkonen <jussi.kukkonen@intel.com>
 ---
- config.h.meson                   |  2 ++
  demos/gtk-demo/meson.build       |  5 ++++-
  docs/tools/meson.build           |  7 +++++--
  docs/tools/widgets.c             |  6 +++++-
@@ -26,7 +25,6 @@ Signed-off-by: Jussi Kukkonen <jussi.kukkonen@intel.com>
  gdk/gdkglcontext.c               |  6 ++++++
  gdk/gdkwindow.c                  | 13 +++++++++++++
  gdk/meson.build                  |  8 +++++++-
- gdk/x11/Makefile.am              |  2 --
  gdk/x11/gdkdisplay-x11.c         |  6 +++++-
  gdk/x11/gdkvisual-x11.c          |  5 +++++
  gdk/x11/gdkwindow-x11.c          |  4 ++++
@@ -39,21 +37,8 @@ Signed-off-by: Jussi Kukkonen <jussi.kukkonen@intel.com>
  meson_options.txt                |  2 ++
  tests/meson.build                |  9 +++++++--
  testsuite/gtk/objects-finalize.c |  2 ++
- 23 files changed, 130 insertions(+), 15 deletions(-)
+ 21 files changed, 128 insertions(+), 13 deletions(-)
 
-diff --git a/config.h.meson b/config.h.meson
-index b502611cb7..0bf6678d5e 100644
---- a/config.h.meson
-+++ b/config.h.meson
-@@ -20,6 +20,8 @@
- /* define if we have colord */
- #mesondefine HAVE_COLORD
- 
-+#mesondefine HAVE_OPENGL
-+
- /* Define if the GNU dcgettext() function is already present or preinstalled.
-    */
- #mesondefine HAVE_DCGETTEXT
 diff --git a/demos/gtk-demo/meson.build b/demos/gtk-demo/meson.build
 index 252da16d05..4b57cff6ac 100644
 --- a/demos/gtk-demo/meson.build
@@ -367,19 +352,6 @@ index 4bb1bf2b6c..64172b8d3e 100644
  
  gdkconfig = configure_file(
    input  : 'gdkconfig.h.meson',
-diff --git a/gdk/x11/Makefile.am b/gdk/x11/Makefile.am
-index 32b1f24434..d73eee604a 100644
---- a/gdk/x11/Makefile.am
-+++ b/gdk/x11/Makefile.am
-@@ -40,8 +40,6 @@ libgdk_x11_la_SOURCES = 	\
- 	gdkeventtranslator.c	\
- 	gdkeventtranslator.h	\
- 	gdkgeometry-x11.c  	\
--	gdkglcontext-x11.c	\
--	gdkglcontext-x11.h	\
- 	gdkkeys-x11.c		\
- 	gdkmain-x11.c		\
- 	gdkmonitor-x11.c	\
 diff --git a/gdk/x11/gdkdisplay-x11.c b/gdk/x11/gdkdisplay-x11.c
 index 7e08f472cc..30fd7b6089 100644
 --- a/gdk/x11/gdkdisplay-x11.c
@@ -642,10 +614,10 @@ index 4fd0c3039c..a8e59ed077 100644
    if (GDK_IS_WAYLAND_DISPLAY (gdk_display_get_default ()))
      {
 diff --git a/meson.build b/meson.build
-index f2e63a8655..eea5347930 100644
+index aed48fc3f6..bfc33af0f6 100644
 --- a/meson.build
 +++ b/meson.build
-@@ -136,6 +136,7 @@ wayland_enabled        = get_option('wayland_backend')
+@@ -137,6 +137,7 @@ wayland_enabled        = get_option('wayland_backend')
  broadway_enabled       = get_option('broadway_backend')
  quartz_enabled         = get_option('quartz_backend')
  win32_enabled          = get_option('win32_backend')
@@ -653,7 +625,7 @@ index f2e63a8655..eea5347930 100644
  
  os_unix   = false
  os_linux  = false
-@@ -450,7 +451,7 @@ pangocairo_dep = dependency('pangocairo', version: cairo_req,
+@@ -430,7 +431,7 @@ pangocairo_dep = dependency('pangocairo', version: cairo_req,
                              fallback : ['pango', 'libpangocairo_dep'])
  pixbuf_dep     = dependency('gdk-pixbuf-2.0', version: gdk_pixbuf_req,
                              fallback : ['gdk-pixbuf', 'gdkpixbuf_dep'])
@@ -662,7 +634,7 @@ index f2e63a8655..eea5347930 100644
                              fallback: ['libepoxy', 'libepoxy_dep'])
  atk_dep        = dependency('atk', version: atk_req,
                              fallback : ['atk', 'libatk_dep'])
-@@ -496,6 +497,10 @@ if tracker3_enabled
+@@ -476,6 +477,10 @@ if tracker3_enabled
    endif
  endif
  
@@ -671,9 +643,9 @@ index f2e63a8655..eea5347930 100644
 +endif
 +
  if iso_codes_dep.found()
-   cdata.set_quoted('ISO_CODES_PREFIX', iso_codes_dep.get_pkgconfig_variable('prefix'))
+   cdata.set_quoted('ISO_CODES_PREFIX', iso_codes_dep.get_variable(pkgconfig: 'prefix'))
  else
-@@ -926,9 +931,15 @@ else
+@@ -912,9 +917,15 @@ else
    gio_packages = ['gio-2.0', glib_req]
  endif
  
@@ -690,7 +662,7 @@ index f2e63a8655..eea5347930 100644
                       ['fribidi', fribidi_req]))
  
  gtk_packages = ' '.join([
-@@ -942,7 +953,7 @@ pkgconf.set('GTK_PACKAGES', gtk_packages)
+@@ -928,7 +939,7 @@ pkgconf.set('GTK_PACKAGES', gtk_packages)
  # Requires.private
  pc_gdk_extra_libs += cairo_libs
  
@@ -761,5 +733,5 @@ index 24540e313f..e0f863ab6a 100644
  	  /* Not allowed to finalize a GdkPixbufLoader without calling gdk_pixbuf_loader_close() */
  	  all_types[i] != GDK_TYPE_PIXBUF_LOADER &&
 -- 
-2.34.1
+2.30.2
 
diff --git a/meta/recipes-gnome/gtk+/gtk+3_3.24.35.bb b/meta/recipes-gnome/gtk+/gtk+3_3.24.36.bb
similarity index 76%
rename from meta/recipes-gnome/gtk+/gtk+3_3.24.35.bb
rename to meta/recipes-gnome/gtk+/gtk+3_3.24.36.bb
index a467c0e9e9..41c189d7f1 100644
--- a/meta/recipes-gnome/gtk+/gtk+3_3.24.35.bb
+++ b/meta/recipes-gnome/gtk+/gtk+3_3.24.36.bb
@@ -3,11 +3,10 @@ require gtk+3.inc
 MAJ_VER = "${@oe.utils.trim_version("${PV}", 2)}"
 
 SRC_URI = "http://ftp.gnome.org/pub/gnome/sources/gtk+/${MAJ_VER}/gtk+-${PV}.tar.xz \
-           file://add-missing-meson.build.patch \
-           file://buildpaths.patch \
            file://opengl.patch \
+           file://0001-meson.build-build-introspection-according-to-option-.patch \
            "
-SRC_URI[sha256sum] = "ec10fe6d712ef0b3c63b5f932639c9d1ae99fce94f500f6f06965629fef60bd1"
+SRC_URI[sha256sum] = "27a6ef157743350c807ffea59baa1d70226dbede82a5e953ffd58ea6059fe691"
 
 S = "${WORKDIR}/gtk+-${PV}"
 
-- 
2.30.2


