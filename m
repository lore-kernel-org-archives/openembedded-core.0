Return-Path: <martin.jansa@gmail.com>
Received: from mail-ea0-f178.google.com (mail-ea0-f178.google.com
	[209.85.215.178])
	by mail.openembedded.org (Postfix) with ESMTP id 53AF56BD57
	for <openembedded-core@lists.openembedded.org>;
	Thu, 29 Aug 2013 16:02:07 +0000 (UTC)
Received: by mail-ea0-f178.google.com with SMTP id a15so346845eae.37
	for <openembedded-core@lists.openembedded.org>;
	Thu, 29 Aug 2013 09:02:07 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=from:to:subject:date:message-id:in-reply-to:references:in-reply-to
	:references; bh=lJIKViytdE3EzQlNCS+EkyHiZkqeze3SdAc+TMyxHTU=;
	b=WXU1Yzu+f7Xwo9+srGyVzYbDmylgQuoX8YLzHvsLB5jz5OO0lrrVnS2y8+kMwvCsGT
	h5blSD6041Q3EZosf6IEOdN0529y/UGPe3gdJ+z2aytco3iKWGI1goD9zH6JjTsO/EoG
	n33wzhkPQrHewoN62ewCR6XfVoAPHsnyUVg7TsC3Sekqz7GHe9HQBCjbcAejg2nwwjLs
	Inos70ZLfxnwhzIT6KijwgWp1L/KCPJ6Q8hAcH6REG46l+QnPpLM+E8Z2mDaDze5A74x
	c+TAEpJZR6XkQEOqWH9LzPiHYZrZy50YyAFGPCang/hyXHrK3Rb8u5KarwXqFhFsCH6E
	1psg==
X-Received: by 10.15.36.9 with SMTP id h9mr5498885eev.30.1377792127761;
	Thu, 29 Aug 2013 09:02:07 -0700 (PDT)
Received: from localhost (ip-62-24-80-145.net.upcbroadband.cz. [62.24.80.145])
	by mx.google.com with ESMTPSA id
	i1sm47236493eeg.0.1969.12.31.16.00.00
	(version=TLSv1.2 cipher=ECDHE-RSA-RC4-SHA bits=128/128);
	Thu, 29 Aug 2013 09:02:07 -0700 (PDT)
From: Martin Jansa <martin.jansa@gmail.com>
To: openembedded-core@lists.openembedded.org
Date: Thu, 29 Aug 2013 18:02:57 +0200
Message-Id: <6777515d534dbc158de77d1f88830dae6a1119e1.1377792006.git.Martin.Jansa@gmail.com>
X-Mailer: git-send-email 1.8.3.2
In-Reply-To: <cover.1377792005.git.Martin.Jansa@gmail.com>
References: <cover.1377792005.git.Martin.Jansa@gmail.com>
In-Reply-To: <cover.1377792005.git.Martin.Jansa@gmail.com>
References: <cover.1377792005.git.Martin.Jansa@gmail.com>
Subject: [WIP][PATCH 10/20] weston: Add PACKAGECONFIG for poppler
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
X-List-Received-Date: Thu, 29 Aug 2013 16:02:07 -0000

Signed-off-by: Martin Jansa <Martin.Jansa@gmail.com>
---
 .../0001-configure-Allow-to-disable-poppler.patch  | 43 ++++++++++++++++++++++
 meta/recipes-graphics/wayland/weston_1.1.0.bb      |  2 +
 2 files changed, 45 insertions(+)
 create mode 100644 meta/recipes-graphics/wayland/weston/0001-configure-Allow-to-disable-poppler.patch

diff --git a/meta/recipes-graphics/wayland/weston/0001-configure-Allow-to-disable-poppler.patch b/meta/recipes-graphics/wayland/weston/0001-configure-Allow-to-disable-poppler.patch
new file mode 100644
index 0000000..a8c1507
--- /dev/null
+++ b/meta/recipes-graphics/wayland/weston/0001-configure-Allow-to-disable-poppler.patch
@@ -0,0 +1,43 @@
+From d409b069a97e0d76016d3bfd34d6fae96dcf5d9d Mon Sep 17 00:00:00 2001
+From: Martin Jansa <Martin.Jansa@gmail.com>
+Date: Mon, 26 Aug 2013 00:51:31 +0200
+Subject: [PATCH] configure: Allow to disable poppler
+
+Upstream-Status: Pending
+
+Signed-off-by: Martin Jansa <Martin.Jansa@gmail.com>
+---
+ configure.ac | 9 ++++++++-
+ 1 file changed, 8 insertions(+), 1 deletion(-)
+
+diff --git a/configure.ac b/configure.ac
+index d5fea9d..53e0c0b 100644
+--- a/configure.ac
++++ b/configure.ac
+@@ -221,6 +221,11 @@ if test x$enable_simple_egl_clients = xyes -a x$enable_egl = xyes; then
+                     [egl >= 7.10 glesv2 wayland-client wayland-egl wayland-cursor])
+ fi
+ 
++AC_ARG_ENABLE(poppler,
++              AS_HELP_STRING([--disable-poppler],
++                             [disable poppler support]),,
++              enable_popper=yes)
++
+ AC_ARG_ENABLE(clients, [  --enable-clients],, enable_clients=yes)
+ AM_CONDITIONAL(BUILD_CLIENTS, test x$enable_clients = xyes)
+ if test x$enable_clients = xyes; then
+@@ -229,8 +234,10 @@ if test x$enable_clients = xyes; then
+   PKG_CHECK_MODULES(CLIENT, [wayland-client cairo >= 1.10.0 xkbcommon wayland-cursor])
+   PKG_CHECK_MODULES(WESTON_INFO, [wayland-client])
+ 
++  AS_IF([test "x$enable_poppler" != "no"], [
+   PKG_CHECK_MODULES(POPPLER, [poppler-glib glib-2.0 gobject-2.0 gio-2.0 ],
+-			     [have_poppler=yes], [have_poppler=no])
++			     [have_poppler=yes], [have_poppler=no])],
++  [have_poppler=no])
+   PKG_CHECK_MODULES(CAIRO_EGL, [wayland-egl egl >= 7.10 cairo-egl >= 1.11.3 $cairo_modules],
+ 		    [have_cairo_egl=yes], [have_cairo_egl=no])
+   AS_IF([test "x$have_cairo_egl" = "xyes"],
+-- 
+1.8.3.2
+
diff --git a/meta/recipes-graphics/wayland/weston_1.1.0.bb b/meta/recipes-graphics/wayland/weston_1.1.0.bb
index c7c64ad..cce876a 100644
--- a/meta/recipes-graphics/wayland/weston_1.1.0.bb
+++ b/meta/recipes-graphics/wayland/weston_1.1.0.bb
@@ -6,6 +6,7 @@ LIC_FILES_CHKSUM = "file://COPYING;md5=275efac2559a224527bd4fd593d38466 \
                     file://src/compositor.c;endline=23;md5=aa98a8db03480fe7d500d0b1f4b8850c"
 
 SRC_URI = "http://wayland.freedesktop.org/releases/${BPN}-${PV}.tar.xz \
+           file://0001-configure-Allow-to-disable-poppler.patch \
            file://install-examples.patch \
            file://weston-launch-shell.patch \
            file://groups.patch \
@@ -49,6 +50,7 @@ PACKAGECONFIG[x11] = "--enable-x11-compositor,--disable-x11-compositor,virtual/l
 PACKAGECONFIG[headless] = "--enable-headless-compositor,--disable-headless-compositor"
 # Weston on framebuffer
 PACKAGECONFIG[fbdev] = "--enable-fbdev-compositor,--disable-fbdev-compositor,udev mtdev"
+PACKAGECONFIG[poppler] = "--enable-poppler,--disable-poppler,poppler"
 
 # Use cairo-gl or cairo-glesv2
 PACKAGECONFIG[gles] = "--with-cairo-glesv2,,virtual/libgles2"
-- 
1.8.3.2


