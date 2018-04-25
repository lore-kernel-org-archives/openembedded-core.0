Return-Path: <fabio.berton@ossystems.com.br>
Received: from mail-qk0-f194.google.com (mail-qk0-f194.google.com
	[209.85.220.194])
	by mail.openembedded.org (Postfix) with ESMTP id CC6B574500
	for <openembedded-core@lists.openembedded.org>;
	Wed, 25 Apr 2018 16:59:20 +0000 (UTC)
Received: by mail-qk0-f194.google.com with SMTP id b131so18896562qkg.2
	for <openembedded-core@lists.openembedded.org>;
	Wed, 25 Apr 2018 09:59:21 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=ossystems-com-br.20150623.gappssmtp.com; s=20150623;
	h=from:to:subject:date:message-id:mime-version:organization
	:content-transfer-encoding;
	bh=Sto8lSjDfwZ2wdA+MGyiFh4J9vQAr0Vngad2KUY5hLw=;
	b=gA9FX9fZzbfuSmYwxMxBZER6eeGcqduQbAKEgmBHqenm2WE3VXkqTMvKbM164lRYI6
	JUwBZqoXUG+amFpB+35IdusMj1xb9gLEtAWDpGgJw6oSXah4VosVIOc0Ip0U5Afj8BwH
	0IheFhsIVi/mfm0FpYty0dmX0bkEfgu/nGMdWqz2OVd9qemr0gg502ODlWeSCNna63mq
	oNz2CvBJ74LRTt/xmmR1HQzkPBrgeQG5471Xbex1NMvPVgrmsN1eG/xV4287fPx7KdNn
	vwOAFUOFS9CJoX9D8YAyFPo63ABv7mOgkPgLaxaUJmRYzo0+KmX/7w87tHoY0iL//Agz
	9cqQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:from:to:subject:date:message-id:mime-version
	:organization:content-transfer-encoding;
	bh=Sto8lSjDfwZ2wdA+MGyiFh4J9vQAr0Vngad2KUY5hLw=;
	b=hGrQ4ejfXQpMtY+AIzwM3q82anFzVDYvCvjKD5BJ1Fc9QFszbzh7DDA2hj5QxWnnCO
	tp/FoXMWlhW0q8qrSM7E96zCdpT1Xn/i+vw2WFpUVsWa3ftMeGVUCc02tBUExOYoJ3G2
	pMHBrCIjSb23hqUcLNM4b0M3MwQr8PV0LJXXrRLv+4uQ05MuMrxOlzmXxkseU8EF7M3H
	q87T6yg9vvWkEmQs+xp9gZqVMgmXN//E+zFscw1uBKFndKS8PSs70/eJgwyYKvmAlLbx
	1ijsHh0nvY5tz0KSFdbZTGupPLP47jwG0LseGRaus1iK0Ei7Yqd4PVhhVZgVqs4JyWO3
	TsqA==
X-Gm-Message-State: ALQs6tDj4E9dJMbb3Tw6qScsoZwo7VviKSMAsGdCOLguUUoo1NkUTv0o
	MWMHkX2yErP2ZUV/VJv7ojyS88Tc
X-Google-Smtp-Source: AB8JxZr3++QCTkP7leFA4tOqGrSmm4rner4hj0tMH3FSkKthjPbzZAP8PbeSTpHXCAaMfhoBUJbcNw==
X-Received: by 10.55.100.201 with SMTP id y192mr30034300qkb.293.1524675561107; 
	Wed, 25 Apr 2018 09:59:21 -0700 (PDT)
Received: from centrium.lab.ossystems ([177.194.217.140])
	by smtp.gmail.com with ESMTPSA id
	b12-v6sm16014041qtb.62.2018.04.25.09.59.19
	for <openembedded-core@lists.openembedded.org>
	(version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
	Wed, 25 Apr 2018 09:59:20 -0700 (PDT)
From: Fabio Berton <fabio.berton@ossystems.com.br>
To: openembedded-core@lists.openembedded.org
Date: Wed, 25 Apr 2018 13:59:03 -0300
Message-Id: <20180425165903.29648-1-fabio.berton@ossystems.com.br>
X-Mailer: git-send-email 2.14.2
MIME-Version: 1.0
Organization: O.S. Systems Software LTDA.
Subject: [PATCH] mesa: Upgrade 17.3.8 -> 18.0.1
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
X-List-Received-Date: Wed, 25 Apr 2018 16:59:21 -0000
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit

This includes changes from Mesa 18.0.0 and 18.0.1 releases.

Mesa 18.0.0 is a new development release and 18.0.1 is a bug-fix release.

You can find release notes here:

  - https://mesa3d.org/relnotes/18.0.0.html
  - https://mesa3d.org/relnotes/18.0.1.html

Remove patch 0001-st-dri-Initialise-modifier-to-INVALID-for-DRI2.patch
that was applied on upstream.

Signed-off-by: Fabio Berton <fabio.berton@ossystems.com.br>
---
 ...i-Initialise-modifier-to-INVALID-for-DRI2.patch | 43 ----------------------
 .../mesa/{mesa-gl_17.3.8.bb => mesa-gl_18.0.1.bb}  |  0
 .../mesa/{mesa_17.3.8.bb => mesa_18.0.1.bb}        |  5 +--
 3 files changed, 2 insertions(+), 46 deletions(-)
 delete mode 100644 meta/recipes-graphics/mesa/files/0001-st-dri-Initialise-modifier-to-INVALID-for-DRI2.patch
 rename meta/recipes-graphics/mesa/{mesa-gl_17.3.8.bb => mesa-gl_18.0.1.bb} (100%)
 rename meta/recipes-graphics/mesa/{mesa_17.3.8.bb => mesa_18.0.1.bb} (81%)

diff --git a/meta/recipes-graphics/mesa/files/0001-st-dri-Initialise-modifier-to-INVALID-for-DRI2.patch b/meta/recipes-graphics/mesa/files/0001-st-dri-Initialise-modifier-to-INVALID-for-DRI2.patch
deleted file mode 100644
index 6aba7859ee..0000000000
--- a/meta/recipes-graphics/mesa/files/0001-st-dri-Initialise-modifier-to-INVALID-for-DRI2.patch
+++ /dev/null
@@ -1,43 +0,0 @@
-From 4cbecb61682a0ee426faaa03d824fc8fd7aef826 Mon Sep 17 00:00:00 2001
-From: Daniel Stone <daniels@collabora.com>
-Date: Mon, 2 Apr 2018 13:20:34 +0100
-Subject: [PATCH] st/dri: Initialise modifier to INVALID for DRI2
-MIME-Version: 1.0
-Content-Type: text/plain; charset=UTF-8
-Content-Transfer-Encoding: 8bit
-
-When allocating a buffer for DRI2, set the modifier to INVALID to inform
-the backend that we have no supplied modifiers and it should do its own
-thing. The missed initialisation forced linear, even if the
-implementation had made other decisions.
-
-This resulted in VC4 DRI2 clients failing with:
-  Modifier 0x0 vs. tiling (0x700000000000001) mismatch
-
-Signed-off-by: Daniel Stone <daniels@collabora.com>
-Reported-by: Andreas Müller <schnitzeltony@gmail.com>
-Reviewed-by: Eric Anholt <eric@anholt.net>
-Fixes: 3f8513172ff6 ("gallium/winsys/drm: introduce modifier field to winsys_handle")
-
-Upstream-Status: Backport [1]
-
-[1] https://cgit.freedesktop.org/mesa/mesa/commit/?id=4cbecb61682a0ee426faaa03d824fc8fd7aef826
----
- src/gallium/state_trackers/dri/dri2.c | 1 +
- 1 file changed, 1 insertion(+)
-
-diff --git a/src/gallium/state_trackers/dri/dri2.c b/src/gallium/state_trackers/dri/dri2.c
-index 31d17d46c2..58a6757f03 100644
---- a/src/gallium/state_trackers/dri/dri2.c
-+++ b/src/gallium/state_trackers/dri/dri2.c
-@@ -806,6 +806,7 @@ dri2_allocate_textures(struct dri_context *ctx,
-          whandle.handle = buf->name;
-          whandle.stride = buf->pitch;
-          whandle.offset = 0;
-+         whandle.modifier = DRM_FORMAT_MOD_INVALID;
-          if (screen->can_share_buffer)
-             whandle.type = DRM_API_HANDLE_TYPE_SHARED;
-          else
--- 
-2.14.3
-
diff --git a/meta/recipes-graphics/mesa/mesa-gl_17.3.8.bb b/meta/recipes-graphics/mesa/mesa-gl_18.0.1.bb
similarity index 100%
rename from meta/recipes-graphics/mesa/mesa-gl_17.3.8.bb
rename to meta/recipes-graphics/mesa/mesa-gl_18.0.1.bb
diff --git a/meta/recipes-graphics/mesa/mesa_17.3.8.bb b/meta/recipes-graphics/mesa/mesa_18.0.1.bb
similarity index 81%
rename from meta/recipes-graphics/mesa/mesa_17.3.8.bb
rename to meta/recipes-graphics/mesa/mesa_18.0.1.bb
index 2d3fd3ca38..6588dfcae0 100644
--- a/meta/recipes-graphics/mesa/mesa_17.3.8.bb
+++ b/meta/recipes-graphics/mesa/mesa_18.0.1.bb
@@ -8,11 +8,10 @@ SRC_URI = "https://mesa.freedesktop.org/archive/mesa-${PV}.tar.xz \
            file://llvm-config-version.patch \
            file://0001-winsys-svga-drm-Include-sys-types.h.patch \
            file://0001-Makefile.vulkan.am-explictly-add-lib-expat-to-intel-.patch \
-           file://0001-st-dri-Initialise-modifier-to-INVALID-for-DRI2.patch \
            "
 
-SRC_URI[md5sum] = "203d1a79156ab6926f2d253b377e9d9d"
-SRC_URI[sha256sum] = "8f9d9bf281c48e4a8f5228816577263b4c655248dc7666e75034ab422951a6b1"
+SRC_URI[md5sum] = "a240b17769ad5ff918507848590f9397"
+SRC_URI[sha256sum] = "b2d2f5b5dbaab13e15cb0dcb5ec81887467f55ebc9625945b303a3647cd87954"
 
 #because we cannot rely on the fact that all apps will use pkgconfig,
 #make eglplatform.h independent of MESA_EGL_NO_X11_HEADER
-- 
2.14.2


