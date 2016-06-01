Return-Path: <martin.jansa@gmail.com>
Received: from mail-wm0-f68.google.com (mail-wm0-f68.google.com [74.125.82.68])
	by mail.openembedded.org (Postfix) with ESMTP id 5BD9D77336
	for <openembedded-core@lists.openembedded.org>;
	Wed,  1 Jun 2016 12:49:19 +0000 (UTC)
Received: by mail-wm0-f68.google.com with SMTP id q62so6478218wmg.3
	for <openembedded-core@lists.openembedded.org>;
	Wed, 01 Jun 2016 05:49:20 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=from:to:cc:subject:date:message-id:in-reply-to:references;
	bh=RLaZnEZ1jLoXx40DPeDQYWWazWrtl48cx81hilCRySE=;
	b=dAtXD79sRwcOllvuGJwLRtgadbf8AA9Vlp7dLEOeOSGa55UZqAGml8NWo5c86sJ4f6
	3s+oWlnxGq580HYYxrijAkvwXyDxbac6wMJETF84sJ86r0qZknIvXgaTr/YzhDWj9wex
	RuKFJAG6Ukf0DyRkX3rSWHHntvl9a6Z8EOCyLpodQnzFcc9F7OKTq7iFvxJcmkXQfa7/
	M10qpOPHoCvhcA/EqGoK8lwg154dCI2IR7oy4foQ8Jc9yXx+OvHqYollhJ7F6UoGWZh+
	g08hI9fIAwz/1LRXFvOQRgjWOhd2tIWTIPFUAbR3xuVeFuyG3bJGkn4Siwch2V+M1kR+
	bWag==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20130820;
	h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
	:references;
	bh=RLaZnEZ1jLoXx40DPeDQYWWazWrtl48cx81hilCRySE=;
	b=OOwtZRciH8ObxdramrW/crRLP3CPXgsvizcOirsUG1BKRckofTvPjcjZx1T4pbNYRX
	oHORprJpgvJ1MjEbMG1shifBOE4VrAfIHZ4cZaCHnvyK/GYnNyY7jE+ab/20cdfxGZ5L
	Vb6pihMG3CmS6q45OKKRI6avZeR0TnuFdU1McT4Cs3i/IXzYV0Lxb34YSLa7yH9GQmjr
	pQ6cZpgNPUdjAbsnv9nWy6S4otBdiKTojboa0D+zqhk2mh5TX1PfV2Ngoxb/4XIvz6VG
	Agh5dqxXGl31PBcNZLERDm6FO46E0jXg1CWXd5aMzD6m1IkCszfb0H01wjiH6e3PtMTK
	nDNQ==
X-Gm-Message-State: ALyK8tKBLNQyWf3mxlHsX9ja1/p8FreIFOAzooDBhFoGtc1onlqoSXRw0mjd+Pf2LDQWqQ==
X-Received: by 10.28.154.130 with SMTP id c124mr22261579wme.9.1464785359259;
	Wed, 01 Jun 2016 05:49:19 -0700 (PDT)
Received: from localhost (ip-86-49-34-37.net.upcbroadband.cz. [86.49.34.37])
	by smtp.gmail.com with ESMTPSA id u4sm45388263wjz.4.2016.06.01.05.49.18
	(version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
	Wed, 01 Jun 2016 05:49:18 -0700 (PDT)
From: Martin Jansa <martin.jansa@gmail.com>
X-Google-Original-From: Martin Jansa <Martin.Jansa@gmail.com>
To: openembedded-core@lists.openembedded.org
Date: Wed,  1 Jun 2016 14:49:36 +0200
Message-Id: <20160601124936.19277-1-Martin.Jansa@gmail.com>
X-Mailer: git-send-email 2.8.3
In-Reply-To: <20160526172357.GB2575@jama>
References: <20160526172357.GB2575@jama>
Subject: [PATCH] libsdl2: Fix build with wayland 1.10
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
X-List-Received-Date: Wed, 01 Jun 2016 12:49:20 -0000

Signed-off-by: Martin Jansa <Martin.Jansa@gmail.com>
---
 ...ideo-make-it-compatible-with-wayland-1.10.patch | 57 ++++++++++++++++++++++
 meta/recipes-graphics/libsdl2/libsdl2_2.0.4.bb     |  4 +-
 2 files changed, 60 insertions(+), 1 deletion(-)
 create mode 100644 meta/recipes-graphics/libsdl2/libsdl2/0001-src-video-make-it-compatible-with-wayland-1.10.patch

diff --git a/meta/recipes-graphics/libsdl2/libsdl2/0001-src-video-make-it-compatible-with-wayland-1.10.patch b/meta/recipes-graphics/libsdl2/libsdl2/0001-src-video-make-it-compatible-with-wayland-1.10.patch
new file mode 100644
index 0000000..44e6d4d
--- /dev/null
+++ b/meta/recipes-graphics/libsdl2/libsdl2/0001-src-video-make-it-compatible-with-wayland-1.10.patch
@@ -0,0 +1,57 @@
+From b1ed3533433501ec52c8289a5b3a294e57e7f798 Mon Sep 17 00:00:00 2001
+From: Martin Jansa <martin.jansa@gmail.com>
+Date: Thu, 26 May 2016 11:31:52 +0000
+Subject: [PATCH] src/video: make it compatible with wayland 1.10
+
+| build/.libs/SDL_waylandevents.o: In function `wl_registry_bind':
+| /usr/include/wayland-client-protocol.h:305: undefined reference to `wl_proxy_marshal_constructor_versioned'
+| /usr/include/wayland-client-protocol.h:305: undefined reference to `wl_proxy_marshal_constructor_versioned'
+| build/.libs/SDL_waylandkeyboard.o: In function `wl_registry_bind':
+| /usr/include/wayland-client-protocol.h:305: undefined reference to `wl_proxy_marshal_constructor_versioned'
+| /usr/include/wayland-client-protocol.h:305: undefined reference to `wl_proxy_marshal_constructor_versioned'
+| build/.libs/SDL_waylandvideo.o: In function `wl_registry_bind':
+| /usr/include/wayland-client-protocol.h:305: undefined reference to `wl_proxy_marshal_constructor_versioned'
+| collect2: error: ld returned 1 exit status
+| make: *** [build/libSDL2.la] Error 1
+| ERROR: oe_runmake failed
+
+Upstream-Status: Pending
+Signed-off-by: Martin Jansa <Martin.Jansa@gmail.com>
+
+---
+ src/video/wayland/SDL_waylanddyn.h | 1 +
+ src/video/wayland/SDL_waylandsym.h | 4 ++++
+ src/video/webos/SDL_waylanddyn.h   | 1 +
+ src/video/webos/SDL_waylandsym.h   | 4 ++++
+ 4 files changed, 10 insertions(+)
+
+diff --git a/src/video/wayland/SDL_waylanddyn.h b/src/video/wayland/SDL_waylanddyn.h
+index 8d9313a..c7b0157 100644
+--- a/src/video/wayland/SDL_waylanddyn.h
++++ b/src/video/wayland/SDL_waylanddyn.h
+@@ -79,6 +79,7 @@ void SDL_WAYLAND_UnloadSymbols(void);
+ #define wl_proxy_get_user_data (*WAYLAND_wl_proxy_get_user_data)
+ #define wl_proxy_add_listener (*WAYLAND_wl_proxy_add_listener)
+ #define wl_proxy_marshal_constructor (*WAYLAND_wl_proxy_marshal_constructor)
++#define wl_proxy_marshal_constructor_versioned (*WAYLAND_wl_proxy_marshal_constructor_versioned)
+ 
+ #define wl_seat_interface (*WAYLAND_wl_seat_interface)
+ #define wl_surface_interface (*WAYLAND_wl_surface_interface)
+diff --git a/src/video/wayland/SDL_waylandsym.h b/src/video/wayland/SDL_waylandsym.h
+index c3b4fa5..b9a0d97 100644
+--- a/src/video/wayland/SDL_waylandsym.h
++++ b/src/video/wayland/SDL_waylandsym.h
+@@ -55,6 +55,10 @@ SDL_WAYLAND_SYM(void, wl_list_insert_list, (struct wl_list *, struct wl_list *))
+ SDL_WAYLAND_MODULE(WAYLAND_CLIENT_1_4)
+ SDL_WAYLAND_SYM(struct wl_proxy *, wl_proxy_marshal_constructor, (struct wl_proxy *, uint32_t opcode, const struct wl_interface *interface, ...))
+ 
++/* These functions are available in Wayland >= 1.10 */
++SDL_WAYLAND_MODULE(WAYLAND_CLIENT_1_10)
++SDL_WAYLAND_SYM(struct wl_proxy *, wl_proxy_marshal_constructor_versioned, (struct wl_proxy *proxy, uint32_t opcode, const struct wl_interface *interface, uint32_t version, ...))
++
+ SDL_WAYLAND_INTERFACE(wl_seat_interface)
+ SDL_WAYLAND_INTERFACE(wl_surface_interface)
+ SDL_WAYLAND_INTERFACE(wl_shm_pool_interface)
+-- 
+1.9.1
+
diff --git a/meta/recipes-graphics/libsdl2/libsdl2_2.0.4.bb b/meta/recipes-graphics/libsdl2/libsdl2_2.0.4.bb
index 4282307..8f079c8 100644
--- a/meta/recipes-graphics/libsdl2/libsdl2_2.0.4.bb
+++ b/meta/recipes-graphics/libsdl2/libsdl2_2.0.4.bb
@@ -15,7 +15,9 @@ PROVIDES = "virtual/libsdl2"
 DEPENDS_class-nativesdk = "${@bb.utils.contains('DISTRO_FEATURES', 'x11', 'virtual/nativesdk-libx11 nativesdk-libxrandr nativesdk-libxrender nativesdk-libxext', '', d)}"
 
 SRC_URI = "http://www.libsdl.org/release/SDL2-${PV}.tar.gz \
-           file://linkage.patch"
+           file://linkage.patch \
+           file://0001-src-video-make-it-compatible-with-wayland-1.10.patch \
+"
 
 S = "${WORKDIR}/SDL2-${PV}"
 
-- 
2.8.3


