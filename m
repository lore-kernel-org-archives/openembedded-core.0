Return-Path: <otavio.salvador@gmail.com>
Received: from mail-qt0-f195.google.com (mail-qt0-f195.google.com
	[209.85.216.195])
	by mail.openembedded.org (Postfix) with ESMTP id EA4CC6025F
	for <openembedded-core@lists.openembedded.org>;
	Wed,  2 May 2018 12:34:00 +0000 (UTC)
Received: by mail-qt0-f195.google.com with SMTP id f1-v6so18114654qtj.6
	for <openembedded-core@lists.openembedded.org>;
	Wed, 02 May 2018 05:34:02 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
	:organization:content-transfer-encoding;
	bh=LeA76EmhDeSym7wYz3osUbXjyYcvse4SAaLkIdTPBPU=;
	b=HdJfYKKou0BpRSG8rTSz/rkf5lwfHOeaSinsDxakSp8aRk+Tzkj52SJB9Wrt4gdzok
	B8XJS25MiP+mZbGgcDthlgH/979XahudrX7SKjsrA1rV1WpSbV1kBC1ltffVc6pZvT6K
	nQFi2XoH+42HcmV9ajMmdjgitvvGqTmeB557PgzDYNwyACwsIKGHkciPpoLMuw/EebAt
	GSXMkL9+y2eEjpphgZKZf1hern6eAOIoqfTl09ATZTPsdHoD6wi/rigan3s2U8X85YTQ
	CMOmot31q4sKu068rkurtlBLWuSKvUtb/ehCRfQ848FCJGcnJskaC1c/w+jkb77Mznlf
	l68w==
X-Gm-Message-State: ALQs6tAZLOfTk93LK2u743TB6bCxBYAgI46jsiG7vEs0XsM5xk85dy1N
	Km74PLqwV3qYEcgVChmdDCFdhg==
X-Google-Smtp-Source: AB8JxZpErgMeLvqrZ+WbydZFBVrF8JCKMlnX27OXG2EA5/ghDJBJn6Mfd0RLjBZMxJsa8pq/N+e6jA==
X-Received: by 2002:ac8:33a3:: with SMTP id
	c32-v6mr16485029qtb.90.1525264441172; 
	Wed, 02 May 2018 05:34:01 -0700 (PDT)
Received: from localhost.localdomain ([177.194.217.140])
	by smtp.gmail.com with ESMTPSA id
	u22-v6sm11810806qte.36.2018.05.02.05.33.58
	(version=TLS1_2 cipher=ECDHE-RSA-CHACHA20-POLY1305 bits=256/256);
	Wed, 02 May 2018 05:34:00 -0700 (PDT)
Received: by localhost.localdomain (sSMTP sendmail emulation);
	Wed, 02 May 2018 09:33:53 -0300
From: Otavio Salvador <otavio@ossystems.com.br>
To: OpenEmbedded Core Mailing List <openembedded-core@lists.openembedded.org>
Date: Wed,  2 May 2018 09:33:52 -0300
Message-Id: <20180502123352.13042-1-otavio@ossystems.com.br>
X-Mailer: git-send-email 2.17.0
MIME-Version: 1.0
Organization: O.S. Systems Software LTDA.
Cc: Otavio Salvador <otavio@ossystems.com.br>
Subject: [PATCH] mesa: Upgrade 17.3.8 -> 18.0.2
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
X-List-Received-Date: Wed, 02 May 2018 12:34:01 -0000
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit

This includes changes from Mesa 18.0.0 and 18.0.2 releases.

Mesa 18.0.0 is a new development release and 18.0.1 and 18.0.2 are
bug-fix releases.

You can find release notes here:

  - https://mesa3d.org/relnotes/18.0.0.html
  - https://mesa3d.org/relnotes/18.0.1.html
  - https://mesa3d.org/relnotes/18.0.2.html

Remove patch 0001-st-dri-Initialise-modifier-to-INVALID-for-DRI2.patch
that was applied on upstream.

Signed-off-by: Otavio Salvador <otavio@ossystems.com.br>
---

 ...tialise-modifier-to-INVALID-for-DRI2.patch | 43 -------------------
 .../{mesa-gl_17.3.8.bb => mesa-gl_18.0.2.bb}  |  0
 .../mesa/{mesa_17.3.8.bb => mesa_18.0.2.bb}   |  5 +--
 3 files changed, 2 insertions(+), 46 deletions(-)
 delete mode 100644 meta/recipes-graphics/mesa/files/0001-st-dri-Initialise-modifier-to-INVALID-for-DRI2.patch
 rename meta/recipes-graphics/mesa/{mesa-gl_17.3.8.bb => mesa-gl_18.0.2.bb} (100%)
 rename meta/recipes-graphics/mesa/{mesa_17.3.8.bb => mesa_18.0.2.bb} (81%)

diff --git a/meta/recipes-graphics/mesa/files/0001-st-dri-Initialise-modifier-to-INVALID-for-DRI2.patch b/meta/recipes-graphics/mesa/files/0001-st-dri-Initialise-modifier-to-INVALID-for-DRI2.patch
deleted file mode 100644
index 6aba7859ee8..00000000000
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
diff --git a/meta/recipes-graphics/mesa/mesa-gl_17.3.8.bb b/meta/recipes-graphics/mesa/mesa-gl_18.0.2.bb
similarity index 100%
rename from meta/recipes-graphics/mesa/mesa-gl_17.3.8.bb
rename to meta/recipes-graphics/mesa/mesa-gl_18.0.2.bb
diff --git a/meta/recipes-graphics/mesa/mesa_17.3.8.bb b/meta/recipes-graphics/mesa/mesa_18.0.2.bb
similarity index 81%
rename from meta/recipes-graphics/mesa/mesa_17.3.8.bb
rename to meta/recipes-graphics/mesa/mesa_18.0.2.bb
index 2d3fd3ca388..aaac1e58e12 100644
--- a/meta/recipes-graphics/mesa/mesa_17.3.8.bb
+++ b/meta/recipes-graphics/mesa/mesa_18.0.2.bb
@@ -8,11 +8,10 @@ SRC_URI = "https://mesa.freedesktop.org/archive/mesa-${PV}.tar.xz \
            file://llvm-config-version.patch \
            file://0001-winsys-svga-drm-Include-sys-types.h.patch \
            file://0001-Makefile.vulkan.am-explictly-add-lib-expat-to-intel-.patch \
-           file://0001-st-dri-Initialise-modifier-to-INVALID-for-DRI2.patch \
            "
 
-SRC_URI[md5sum] = "203d1a79156ab6926f2d253b377e9d9d"
-SRC_URI[sha256sum] = "8f9d9bf281c48e4a8f5228816577263b4c655248dc7666e75034ab422951a6b1"
+SRC_URI[md5sum] = "3c303da98ec2ce37c795baeba5aee31e"
+SRC_URI[sha256sum] = "98fa159768482dc568b9f8bf0f36c7acb823fa47428ffd650b40784f16b9e7b3"
 
 #because we cannot rely on the fact that all apps will use pkgconfig,
 #make eglplatform.h independent of MESA_EGL_NO_X11_HEADER
-- 
2.17.0


