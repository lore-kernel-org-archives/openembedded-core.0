Return-Path: <RAA013@freescale.com>
Received: from am1outboundpool.messaging.microsoft.com
	(am1ehsobe006.messaging.microsoft.com [213.199.154.209])
	by mail.openembedded.org (Postfix) with ESMTP id 400186AFB5
	for <openembedded-core@lists.openembedded.org>;
	Mon, 19 Aug 2013 19:24:41 +0000 (UTC)
Received: from mail41-am1-R.bigfish.com (10.3.201.239) by
	AM1EHSOBE017.bigfish.com (10.3.207.139) with Microsoft SMTP Server id
	14.1.225.22; Mon, 19 Aug 2013 19:24:40 +0000
Received: from mail41-am1 (localhost [127.0.0.1])	by mail41-am1-R.bigfish.com
	(Postfix) with ESMTP id AB8FC2E0068	for
	<openembedded-core@lists.openembedded.org>;
	Mon, 19 Aug 2013 19:24:40 +0000 (UTC)
X-Forefront-Antispam-Report: CIP:70.37.183.190; KIP:(null); UIP:(null); IPV:NLI;
	H:mail.freescale.net; RD:none; EFVD:NLI
X-SpamScore: 0
X-BigFish: VS0(zzzz1f42h208ch1ee6h1de0h1fdah2073h1202h1e76h1d1ah1d2ah1fc6hzz1de098h177df4h17326ah1de096h8275bh8275dh1de097hz2dh2a8h839hd24he5bhf0ah1288h12a5h12a9h12bdh12e5h137ah139eh13b6h1441h1504h1537h162dh1631h1758h1898h18e1h1946h19b5h1ad9h1b0ah1b2fh1fb3h1d0ch1d2eh1d3fh1dfeh1dffh1e23h1fe8h1ff5h1155h)
Received: from mail41-am1 (localhost.localdomain [127.0.0.1]) by mail41-am1
	(MessageSwitch) id 1376940278690737_17562;
	Mon, 19 Aug 2013 19:24:38 +0000 (UTC)
Received: from AM1EHSMHS015.bigfish.com (unknown [10.3.201.228])	by
	mail41-am1.bigfish.com (Postfix) with ESMTP id A4887480047	for
	<openembedded-core@lists.openembedded.org>;
	Mon, 19 Aug 2013 19:24:38 +0000 (UTC)
Received: from mail.freescale.net (70.37.183.190) by AM1EHSMHS015.bigfish.com
	(10.3.207.153) with Microsoft SMTP Server (TLS) id 14.16.227.3;
	Mon, 19 Aug 2013 19:24:38 +0000
Received: from tx30smr01.am.freescale.net (10.81.153.31) by
	039-SN1MMR1-004.039d.mgd.msft.net (10.84.1.14) with Microsoft SMTP
	Server (TLS) id 14.3.146.2; Mon, 19 Aug 2013 19:24:36 +0000
Received: from neo.am.freescale.net (neo.am.freescale.net [10.81.16.89])	by
	tx30smr01.am.freescale.net (8.14.3/8.14.0) with ESMTP id r7JJOaQ3006424;
	Mon, 19 Aug 2013 12:24:36 -0700
From: Lauren Post <lauren.post@freescale.com>
To: <openembedded-core@lists.openembedded.org>
Date: Mon, 19 Aug 2013 14:17:43 -0500
Message-ID: <1376939864-4790-1-git-send-email-lauren.post@freescale.com>
X-Mailer: git-send-email 1.7.9.5
In-Reply-To: <lauren.post@freescale.com>
References: <lauren.post@freescale.com>
MIME-Version: 1.0
X-OriginatorOrg: freescale.com
X-FOPE-CONNECTOR: Id%0$Dn%*$RO%0$TLS%0$FQDN%$TlsDn%
Subject: [v2][PATCH 1/2] directfb: Upgrade to 1.6.3
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
X-List-Received-Date: Mon, 19 Aug 2013 19:24:41 -0000
Content-Type: text/plain

directfb: Upgrade to 1.6.3

Remove mesa patch as 1.6.3 provides compatibility with mesa

Signed-off-by: Lauren Post <lauren.post@freescale.com>
---
 meta/recipes-graphics/directfb/directfb.inc        |    3 +-
 .../recipes-graphics/directfb/directfb/mesa9.patch |   29 --------------------
 meta/recipes-graphics/directfb/directfb_1.6.1.bb   |   27 ------------------
 meta/recipes-graphics/directfb/directfb_1.6.3.bb   |   26 ++++++++++++++++++
 4 files changed, 27 insertions(+), 58 deletions(-)
 delete mode 100644 meta/recipes-graphics/directfb/directfb/mesa9.patch
 delete mode 100644 meta/recipes-graphics/directfb/directfb_1.6.1.bb
 create mode 100755 meta/recipes-graphics/directfb/directfb_1.6.3.bb

diff --git a/meta/recipes-graphics/directfb/directfb.inc b/meta/recipes-graphics/directfb/directfb.inc
index 7295c35..60b12f7 100644
--- a/meta/recipes-graphics/directfb/directfb.inc
+++ b/meta/recipes-graphics/directfb/directfb.inc
@@ -14,8 +14,7 @@ DEPENDS = "jpeg libpng freetype zlib tslib"
 INC_PR = "r0"
 
 SRC_URI = "http://directfb.org/downloads/Core/DirectFB-1.6/DirectFB-${PV}.tar.gz \
-           file://configurefix.patch \
-           file://mesa9.patch"
+           file://configurefix.patch"
 
 S = "${WORKDIR}/DirectFB-${PV}"
 
diff --git a/meta/recipes-graphics/directfb/directfb/mesa9.patch b/meta/recipes-graphics/directfb/directfb/mesa9.patch
deleted file mode 100644
index 43fd5c2..0000000
--- a/meta/recipes-graphics/directfb/directfb/mesa9.patch
+++ /dev/null
@@ -1,29 +0,0 @@
-Patch from upstream to fix build against Mesa 9.
-
-Upstream-Status: Backport
-Signed-off-by: Ross Burton <ross.burton@intel.com>
-
-From 54beba0715a4fead2a0aa5477977347f81fc2bc0 Mon Sep 17 00:00:00 2001
-From: Andreas Shimokawa <andi@directfb.org>
-Date: Wed, 24 Oct 2012 18:01:15 +0200
-Subject: [PATCH] mesa: fix compatibility with mesa 9.0
-
----
- systems/mesa/mesa_surface_pool.c |    2 +-
- 1 file changed, 1 insertion(+), 1 deletion(-)
-
-diff --git a/systems/mesa/mesa_surface_pool.c b/systems/mesa/mesa_surface_pool.c
-index 0a588bb..bfb5ff3 100644
---- a/systems/mesa/mesa_surface_pool.c
-+++ b/systems/mesa/mesa_surface_pool.c
-@@ -297,7 +297,7 @@ mesaAllocateBuffer( CoreSurfacePool       *pool,
-      alloc->bo = gbm_bo_create( mesa->gbm, surface->config.size.w, surface->config.size.h, GBM_BO_FORMAT_ARGB8888,
-                                                                             GBM_BO_USE_SCANOUT | GBM_BO_USE_RENDERING );
-      alloc->handle = gbm_bo_get_handle( alloc->bo ).u32;
--     alloc->pitch  = gbm_bo_get_pitch( alloc->bo );
-+     alloc->pitch  = gbm_bo_get_stride( alloc->bo );
- 
-      alloc->image  = eglCreateImageKHR( mesa->dpy, NULL, EGL_NATIVE_PIXMAP_KHR, alloc->bo, NULL );
- 
--- 
-1.7.9.5
diff --git a/meta/recipes-graphics/directfb/directfb_1.6.1.bb b/meta/recipes-graphics/directfb/directfb_1.6.1.bb
deleted file mode 100644
index 1230d12..0000000
--- a/meta/recipes-graphics/directfb/directfb_1.6.1.bb
+++ /dev/null
@@ -1,27 +0,0 @@
-require directfb.inc
-
-RV = "1.6-0"
-PR = "${INC_PR}.2"
-
-DEPENDS += "sysfsutils"
-
-SRC_URI += "file://fix-compilation-with-zlib.patch \
-            file://rename-no-instrument-function-macro.patch \
-            file://fixsepbuild.patch"
-
-EXTRA_OECONF = "\
-  --enable-freetype=yes \
-  --enable-zlib \
-  --with-gfxdrivers=none \
-  --disable-sdl \
-  --disable-vnc \
-  --disable-x11 \
-  --disable-imlib2 \
-  --disable-mesa \
-"
-
-LEAD_SONAME = "libdirectfb-1.6.so.0"
-
-SRC_URI[md5sum] = "76d3066e75664aa79204af545f2f3c65"
-SRC_URI[sha256sum] = "f47575ea35dd8a30e548c04bf52d8565756d0bed45d1cf9f8afac1cf9b521c45"
-
diff --git a/meta/recipes-graphics/directfb/directfb_1.6.3.bb b/meta/recipes-graphics/directfb/directfb_1.6.3.bb
new file mode 100755
index 0000000..277e9a9
--- /dev/null
+++ b/meta/recipes-graphics/directfb/directfb_1.6.3.bb
@@ -0,0 +1,26 @@
+require directfb.inc
+
+RV = "1.6-0"
+PR = "${INC_PR}.2"
+
+DEPENDS += "sysfsutils"
+
+SRC_URI += "file://fix-compilation-with-zlib.patch \
+            file://rename-no-instrument-function-macro.patch \
+            file://fixsepbuild.patch"
+
+EXTRA_OECONF = "\
+  --enable-freetype=yes \
+  --enable-zlib \
+  --with-gfxdrivers=none \
+  --disable-sdl \
+  --disable-vnc \
+  --disable-x11 \
+  --disable-imlib2 \
+  --disable-mesa \
+"
+
+LEAD_SONAME = "libdirectfb-1.6.so.0"
+
+SRC_URI[md5sum] = "641e8e999c017770da647f9b5b890906"
+SRC_URI[sha256sum] = "7a96aced0f69b2ec0810e9923068e61c21e6b19dd593e09394c872414df75e70"
-- 
1.7.9.5



