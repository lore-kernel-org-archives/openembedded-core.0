Return-Path: <schnitzeltony@googlemail.com>
Received: from mail-wm0-f66.google.com (mail-wm0-f66.google.com [74.125.82.66])
	by mail.openembedded.org (Postfix) with ESMTP id 1030B719D3
	for <openembedded-core@lists.openembedded.org>;
	Sat, 22 Oct 2016 22:39:39 +0000 (UTC)
Received: by mail-wm0-f66.google.com with SMTP id o81so4072969wma.2
	for <openembedded-core@lists.openembedded.org>;
	Sat, 22 Oct 2016 15:39:40 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=googlemail.com; s=20120113;
	h=from:to:subject:date:message-id:mime-version
	:content-transfer-encoding;
	bh=N5GD8FZo5X3w8XvpwC/F9U8CXufR7ucSCpEqzwPhFPk=;
	b=IhHX+eNDCz1TdPfWaecV04WfISDSfKqmTxQhHYRjSzJXFW3eoILyz6NbFl9zFIP5uC
	l8kSRJ/uz/d+PUOaDN6nGojzz4CCCTU8r5dZddr0AwgEXMXO2Lr1dShDvPcVjY93U0A5
	WMveYcOAuhEGyQR2H3fAEUoxrwt/rfeJS0s9bx59Q8TktJiB3wQln6QwhndHKfW/dPUb
	aPBbEIHevb4UOE6sogQYUmjaKSULty4NXmEdUc/EwlBVuXAtlc61Jz7V2xVREXKGGFpu
	feraUhoVgtmeM6ZeUSLhkmTMxVpsXNY2jYLwvDGHvcqZ9/aVUTZepollALgZMkgxF6KN
	8iVA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20130820;
	h=x-gm-message-state:from:to:subject:date:message-id:mime-version
	:content-transfer-encoding;
	bh=N5GD8FZo5X3w8XvpwC/F9U8CXufR7ucSCpEqzwPhFPk=;
	b=WYgJMinD+fucm9P2N3uQf5R/6+1UQiOb6qjLo77l8lOehH/xYCwvXnrsYUhbt2CDu4
	UINayhBKPQ1eWQtYDOzUB/2qPk+ZS+PmzXw00fg4eH36gKKhaENqxFqdwk1SSwbKCo/6
	Mznf9yNubtTCC31btODL4OA3RK8EqwGW1agljKRnoGXIYQG6A+Izr2Xp6k1wQ6FJ1woc
	6Ra42/Z/totJt6E4cAIzf7GqP+RSiD585CqFEyHRBNUj6/8oz9tms7lw7o9x4FxP0BL+
	4OYKXd7NXAnbiHaKvLBzLmkOADSySYGuNycudzlgXOJNKtdy/7h8FtajGYxEwCuAgblh
	Q1Fg==
X-Gm-Message-State: ABUngvdWCWGV6HtBM5sgDj54JmRDomgDccx/Ax7Jdky1efwA+WYWQWSvu5G0osRPYjyNwg==
X-Received: by 10.194.51.37 with SMTP id h5mr5641588wjo.171.1477175979938;
	Sat, 22 Oct 2016 15:39:39 -0700 (PDT)
Received: from localhost.localdomain (p5B0A3D96.dip0.t-ipconnect.de.
	[91.10.61.150]) by smtp.googlemail.com with ESMTPSA id
	e2sm10507509wjw.14.2016.10.22.15.39.39
	for <openembedded-core@lists.openembedded.org>
	(version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
	Sat, 22 Oct 2016 15:39:39 -0700 (PDT)
From: =?UTF-8?q?Andreas=20M=C3=BCller?= <schnitzeltony@googlemail.com>
To: openembedded-core@lists.openembedded.org
Date: Sun, 23 Oct 2016 00:39:08 +0200
Message-Id: <1477175949-6903-1-git-send-email-schnitzeltony@googlemail.com>
X-Mailer: git-send-email 2.5.5
MIME-Version: 1.0
Subject: [PATCH 1/2] libsdl2: update to 2.0.5
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
X-List-Received-Date: Sat, 22 Oct 2016 22:39:42 -0000
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit

* video/wayland patch: similar was applied mainline
* waylamd-protocols alignment was stolen from gtk+3

Signed-off-by: Andreas Müller <schnitzeltony@googlemail.com>
---
 ...-sysroot-path-so-that-make-finds-our-wayl.patch | 32 ++++++++++++
 ...ideo-make-it-compatible-with-wayland-1.10.patch | 57 ----------------------
 .../libsdl2/{libsdl2_2.0.4.bb => libsdl2_2.0.5.bb} | 14 +++---
 3 files changed, 40 insertions(+), 63 deletions(-)
 create mode 100644 meta/recipes-graphics/libsdl2/libsdl2/0001-prepend-our-sysroot-path-so-that-make-finds-our-wayl.patch
 delete mode 100644 meta/recipes-graphics/libsdl2/libsdl2/0001-src-video-make-it-compatible-with-wayland-1.10.patch
 rename meta/recipes-graphics/libsdl2/{libsdl2_2.0.4.bb => libsdl2_2.0.5.bb} (86%)

diff --git a/meta/recipes-graphics/libsdl2/libsdl2/0001-prepend-our-sysroot-path-so-that-make-finds-our-wayl.patch b/meta/recipes-graphics/libsdl2/libsdl2/0001-prepend-our-sysroot-path-so-that-make-finds-our-wayl.patch
new file mode 100644
index 0000000..d042430
--- /dev/null
+++ b/meta/recipes-graphics/libsdl2/libsdl2/0001-prepend-our-sysroot-path-so-that-make-finds-our-wayl.patch
@@ -0,0 +1,32 @@
+From b44808e43130dcd13b43e5b978b9b24aeb4c134c Mon Sep 17 00:00:00 2001
+From: =?UTF-8?q?Andreas=20M=C3=BCller?= <schnitzeltony@googlemail.com>
+Date: Thu, 20 Oct 2016 14:57:51 +0200
+Subject: [PATCH] prepend our sysroot path so that make finds our
+ wayland-protocol files
+MIME-Version: 1.0
+Content-Type: text/plain; charset=UTF-8
+Content-Transfer-Encoding: 8bit
+
+Upstream-Status: Inappropriate [embedded specific]
+
+Signed-off-by: Andreas Müller <schnitzeltony@googlemail.com>
+---
+ configure.in | 2 +-
+ 1 file changed, 1 insertion(+), 1 deletion(-)
+
+diff --git a/configure.in b/configure.in
+index 726ded3..3376600 100644
+--- a/configure.in
++++ b/configure.in
+@@ -1206,7 +1206,7 @@ AC_HELP_STRING([--enable-video-wayland-qt-touch], [QtWayland server support for
+                 WAYLAND_LIBS=`$PKG_CONFIG --libs wayland-client wayland-egl wayland-cursor xkbcommon`
+                 WAYLAND_SCANNER=`$PKG_CONFIG --variable=wayland_scanner wayland-scanner`
+                 WAYLAND_CORE_PROTOCOL_DIR=`$PKG_CONFIG --variable=pkgdatadir wayland-client`
+-                WAYLAND_PROTOCOLS_DIR=`$PKG_CONFIG --variable=pkgdatadir wayland-protocols`
++                WAYLAND_PROTOCOLS_DIR=${WAYLAND_PROTOCOLS_SYSROOT_DIR}`$PKG_CONFIG --variable=pkgdatadir wayland-protocols`
+                 video_wayland=yes
+             fi
+         fi
+-- 
+2.5.5
+
diff --git a/meta/recipes-graphics/libsdl2/libsdl2/0001-src-video-make-it-compatible-with-wayland-1.10.patch b/meta/recipes-graphics/libsdl2/libsdl2/0001-src-video-make-it-compatible-with-wayland-1.10.patch
deleted file mode 100644
index 44e6d4d..0000000
--- a/meta/recipes-graphics/libsdl2/libsdl2/0001-src-video-make-it-compatible-with-wayland-1.10.patch
+++ /dev/null
@@ -1,57 +0,0 @@
-From b1ed3533433501ec52c8289a5b3a294e57e7f798 Mon Sep 17 00:00:00 2001
-From: Martin Jansa <martin.jansa@gmail.com>
-Date: Thu, 26 May 2016 11:31:52 +0000
-Subject: [PATCH] src/video: make it compatible with wayland 1.10
-
-| build/.libs/SDL_waylandevents.o: In function `wl_registry_bind':
-| /usr/include/wayland-client-protocol.h:305: undefined reference to `wl_proxy_marshal_constructor_versioned'
-| /usr/include/wayland-client-protocol.h:305: undefined reference to `wl_proxy_marshal_constructor_versioned'
-| build/.libs/SDL_waylandkeyboard.o: In function `wl_registry_bind':
-| /usr/include/wayland-client-protocol.h:305: undefined reference to `wl_proxy_marshal_constructor_versioned'
-| /usr/include/wayland-client-protocol.h:305: undefined reference to `wl_proxy_marshal_constructor_versioned'
-| build/.libs/SDL_waylandvideo.o: In function `wl_registry_bind':
-| /usr/include/wayland-client-protocol.h:305: undefined reference to `wl_proxy_marshal_constructor_versioned'
-| collect2: error: ld returned 1 exit status
-| make: *** [build/libSDL2.la] Error 1
-| ERROR: oe_runmake failed
-
-Upstream-Status: Pending
-Signed-off-by: Martin Jansa <Martin.Jansa@gmail.com>
-
----
- src/video/wayland/SDL_waylanddyn.h | 1 +
- src/video/wayland/SDL_waylandsym.h | 4 ++++
- src/video/webos/SDL_waylanddyn.h   | 1 +
- src/video/webos/SDL_waylandsym.h   | 4 ++++
- 4 files changed, 10 insertions(+)
-
-diff --git a/src/video/wayland/SDL_waylanddyn.h b/src/video/wayland/SDL_waylanddyn.h
-index 8d9313a..c7b0157 100644
---- a/src/video/wayland/SDL_waylanddyn.h
-+++ b/src/video/wayland/SDL_waylanddyn.h
-@@ -79,6 +79,7 @@ void SDL_WAYLAND_UnloadSymbols(void);
- #define wl_proxy_get_user_data (*WAYLAND_wl_proxy_get_user_data)
- #define wl_proxy_add_listener (*WAYLAND_wl_proxy_add_listener)
- #define wl_proxy_marshal_constructor (*WAYLAND_wl_proxy_marshal_constructor)
-+#define wl_proxy_marshal_constructor_versioned (*WAYLAND_wl_proxy_marshal_constructor_versioned)
- 
- #define wl_seat_interface (*WAYLAND_wl_seat_interface)
- #define wl_surface_interface (*WAYLAND_wl_surface_interface)
-diff --git a/src/video/wayland/SDL_waylandsym.h b/src/video/wayland/SDL_waylandsym.h
-index c3b4fa5..b9a0d97 100644
---- a/src/video/wayland/SDL_waylandsym.h
-+++ b/src/video/wayland/SDL_waylandsym.h
-@@ -55,6 +55,10 @@ SDL_WAYLAND_SYM(void, wl_list_insert_list, (struct wl_list *, struct wl_list *))
- SDL_WAYLAND_MODULE(WAYLAND_CLIENT_1_4)
- SDL_WAYLAND_SYM(struct wl_proxy *, wl_proxy_marshal_constructor, (struct wl_proxy *, uint32_t opcode, const struct wl_interface *interface, ...))
- 
-+/* These functions are available in Wayland >= 1.10 */
-+SDL_WAYLAND_MODULE(WAYLAND_CLIENT_1_10)
-+SDL_WAYLAND_SYM(struct wl_proxy *, wl_proxy_marshal_constructor_versioned, (struct wl_proxy *proxy, uint32_t opcode, const struct wl_interface *interface, uint32_t version, ...))
-+
- SDL_WAYLAND_INTERFACE(wl_seat_interface)
- SDL_WAYLAND_INTERFACE(wl_surface_interface)
- SDL_WAYLAND_INTERFACE(wl_shm_pool_interface)
--- 
-1.9.1
-
diff --git a/meta/recipes-graphics/libsdl2/libsdl2_2.0.4.bb b/meta/recipes-graphics/libsdl2/libsdl2_2.0.5.bb
similarity index 86%
rename from meta/recipes-graphics/libsdl2/libsdl2_2.0.4.bb
rename to meta/recipes-graphics/libsdl2/libsdl2_2.0.5.bb
index 844ff33..ac7312b 100644
--- a/meta/recipes-graphics/libsdl2/libsdl2_2.0.4.bb
+++ b/meta/recipes-graphics/libsdl2/libsdl2_2.0.5.bb
@@ -14,15 +14,16 @@ PROVIDES = "virtual/libsdl2"
 
 DEPENDS_class-nativesdk = "${@bb.utils.contains('DISTRO_FEATURES', 'x11', 'virtual/nativesdk-libx11 nativesdk-libxrandr nativesdk-libxrender nativesdk-libxext', '', d)}"
 
-SRC_URI = "http://www.libsdl.org/release/SDL2-${PV}.tar.gz \
-           file://linkage.patch \
-           file://0001-src-video-make-it-compatible-with-wayland-1.10.patch \
+SRC_URI = " \
+    http://www.libsdl.org/release/SDL2-${PV}.tar.gz \
+    file://linkage.patch \
+    file://0001-prepend-our-sysroot-path-so-that-make-finds-our-wayl.patch \
 "
 
 S = "${WORKDIR}/SDL2-${PV}"
 
-SRC_URI[md5sum] = "44fc4a023349933e7f5d7a582f7b886e"
-SRC_URI[sha256sum] = "da55e540bf6331824153805d58b590a29c39d2d506c6d02fa409aedeab21174b"
+SRC_URI[md5sum] = "d4055424d556b4a908aa76fad63abd3c"
+SRC_URI[sha256sum] = "442038cf55965969f2ff06d976031813de643af9c9edc9e331bd761c242e8785"
 
 inherit autotools lib_package binconfig pkgconfig
 
@@ -31,7 +32,8 @@ EXTRA_OECONF = "--disable-oss --disable-esd --disable-arts \
                 --disable-video-dummy \
                 --enable-pthreads \
                 --enable-sdl-dlopen \
-                --disable-rpath"
+                --disable-rpath \
+                WAYLAND_PROTOCOLS_SYSROOT_DIR=${STAGING_DIR}/${MACHINE}"
 
 # opengl packageconfig factored out to make it easy for distros
 # and BSP layers to pick either (desktop) opengl, gles2, or no GL
-- 
2.5.5


