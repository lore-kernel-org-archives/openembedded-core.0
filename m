Return-Path: <akuster808@gmail.com>
Received: from mail-pl0-f45.google.com (mail-pl0-f45.google.com
	[209.85.160.45])
	by mail.openembedded.org (Postfix) with ESMTP id BB21C7462E
	for <openembedded-core@lists.openembedded.org>;
	Wed,  4 Apr 2018 01:49:40 +0000 (UTC)
Received: by mail-pl0-f45.google.com with SMTP id 91-v6so11766853pld.3
	for <openembedded-core@lists.openembedded.org>;
	Tue, 03 Apr 2018 18:49:41 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=from:to:subject:date:message-id:in-reply-to:references;
	bh=rLwtUXAdAtdoZb5zNoMo8B73RoJSb5hjVKKAF7naB7s=;
	b=Em7KA5POg3aNUA1HsyAMrZeyNNezGLmuvoBjJOksFWnBe5t+8Ul/gbtnE1ROPch7bx
	SZEToMsPWvYlmKiJlIZuaDQ68yg/bhWFPoiMGzjd2iLsqmAZvIG/UGZi+j4V73cRQb/y
	iOaTiqilBCj6pQXmP1h808/J8rHhpSdUlwub8dBvtxsOw0I6w+dw9HX/X5qk9gLKfsjD
	/xpEwmkd090Ub7XBovOwP5/jY2ZuCr7oc9xDy4MpbEqStoeICBl3WWBpAzU/GpZgWLut
	0sFRq7rHuYo1L0kOWTxh2Uf0kjHR/ryG2YDIHCWc0wQaFWYPCZsrR9280S+s3Oar60up
	bhDw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:from:to:subject:date:message-id:in-reply-to
	:references;
	bh=rLwtUXAdAtdoZb5zNoMo8B73RoJSb5hjVKKAF7naB7s=;
	b=YNnWBb3TczSBMg4CFuwPjHmWO4zA/9f5Q5LYbJIlIYKb/QN43RPpwKysec6FOAyZUj
	cYI18lqdeeKvw/PRsNpLv/niGkHMTFfUN3M3seke1f1WlPejb2CFw46u5V7fJ+9PjFfo
	VUK48slWhxYOl86wQFcA8yRdL87AD9M6IzM7ZmGq2EO9uQW1q3gUGfVwhX24nnR0qhfx
	QROnXa+zYB2XJJzlxaHtXB2CBfVRMHx1ZTwFua8sbfJtP8OGh0PdyXH5ykbk3FU/UyqC
	N0ddQgRrspiLcH9ml7+Qrr9PCGLgMty8vX5pKqX3w35z9LAasdIQo17mbkt5mQGPdlVQ
	4qMw==
X-Gm-Message-State: AElRT7EkNjCVxqeaXdzu0z0SbeJZwjPph3PqaFyeHbPH/AR23CP2DaSP
	IeY1t107MALWdHMFupleE6SLyQ==
X-Google-Smtp-Source: AIpwx4+qHJQuLXdiU1/fghy2ZepkIKaJMc980ke4HoiZZkAH9W1a+OzuijY57yWUmUXHrmqzVHHDJw==
X-Received: by 2002:a17:902:a70f:: with SMTP id
	w15-v6mr16630877plq.344.1522806580991; 
	Tue, 03 Apr 2018 18:49:40 -0700 (PDT)
Received: from akuster-ThinkPad-T460s.mvista.com
	([2601:202:4000:1184:a4f3:7c10:9123:63ea])
	by smtp.gmail.com with ESMTPSA id
	d8sm7485877pfh.177.2018.04.03.18.49.40
	(version=TLS1_2 cipher=ECDHE-RSA-AES128-SHA bits=128/128);
	Tue, 03 Apr 2018 18:49:40 -0700 (PDT)
From: Armin Kuster <akuster808@gmail.com>
To: openembedded-core@lists.openembedded.org,
	akuster808@gmail.com
Date: Tue,  3 Apr 2018 18:49:17 -0700
Message-Id: <e929e83164630add80ba28f44d1d34afc2f197c9.1522806183.git.akuster808@gmail.com>
X-Mailer: git-send-email 2.7.4
In-Reply-To: <cover.1522806183.git.akuster808@gmail.com>
References: <cover.1522806183.git.akuster808@gmail.com>
Subject: [PATCH 18/21] *proto: remove depricated xorg proto header recipes and replace by xorgproto
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
X-List-Received-Date: Wed, 04 Apr 2018 01:49:40 -0000

From: Armin Kuster <akuster@mvista.com>

Signed-off-by: Armin Kuster <akuster@mvista.com>
---
 .../xorg-proto/bigreqsproto_1.1.2.bb               | 16 ---------
 .../xorg-proto/calibrateproto/fix.patch            | 42 ----------------------
 .../xorg-proto/calibrateproto_git.bb               | 21 -----------
 .../xorg-proto/compositeproto_0.4.2.bb             | 21 -----------
 .../xorg-proto/damageproto_1.2.1.bb                | 20 -----------
 meta/recipes-graphics/xorg-proto/dmxproto_2.3.1.bb | 18 ----------
 meta/recipes-graphics/xorg-proto/dri2proto_2.8.bb  | 15 --------
 meta/recipes-graphics/xorg-proto/dri3proto_1.0.bb  | 14 --------
 meta/recipes-graphics/xorg-proto/fixesproto_5.0.bb | 22 ------------
 .../xorg-proto/fontsproto_2.1.3.bb                 | 18 ----------
 meta/recipes-graphics/xorg-proto/glproto_1.4.17.bb | 18 ----------
 .../xorg-proto/inputproto_2.3.2.bb                 | 22 ------------
 meta/recipes-graphics/xorg-proto/kbproto_1.0.7.bb  | 18 ----------
 .../xorg-proto/presentproto_git.bb                 | 22 ------------
 .../xorg-proto/randrproto_1.5.0.bb                 | 19 ----------
 .../xorg-proto/recordproto_1.14.2.bb               | 18 ----------
 .../xorg-proto/renderproto_0.11.1.bb               | 21 -----------
 .../xorg-proto/resourceproto_1.2.0.bb              | 19 ----------
 .../xorg-proto/scrnsaverproto_1.2.2.bb             | 19 ----------
 .../xorg-proto/videoproto_2.3.3.bb                 | 14 --------
 .../xorg-proto/xcmiscproto_1.2.2.bb                | 17 ---------
 .../recipes-graphics/xorg-proto/xextproto_7.3.0.bb | 24 -------------
 .../xorg-proto/xf86dgaproto_2.1.bb                 | 18 ----------
 .../xorg-proto/xf86driproto_2.1.1.bb               | 17 ---------
 .../xorg-proto/xf86miscproto_0.9.3.bb              | 17 ---------
 .../xorg-proto/xf86vidmodeproto_2.3.1.bb           | 18 ----------
 .../xorg-proto/xineramaproto_1.2.1.bb              | 19 ----------
 .../xorg-proto/xproto/xproto_fix_for_x32.patch     | 24 -------------
 meta/recipes-graphics/xorg-proto/xproto_7.0.31.bb  | 19 ----------
 29 files changed, 570 deletions(-)
 delete mode 100644 meta/recipes-graphics/xorg-proto/bigreqsproto_1.1.2.bb
 delete mode 100644 meta/recipes-graphics/xorg-proto/calibrateproto/fix.patch
 delete mode 100644 meta/recipes-graphics/xorg-proto/calibrateproto_git.bb
 delete mode 100644 meta/recipes-graphics/xorg-proto/compositeproto_0.4.2.bb
 delete mode 100644 meta/recipes-graphics/xorg-proto/damageproto_1.2.1.bb
 delete mode 100644 meta/recipes-graphics/xorg-proto/dmxproto_2.3.1.bb
 delete mode 100644 meta/recipes-graphics/xorg-proto/dri2proto_2.8.bb
 delete mode 100644 meta/recipes-graphics/xorg-proto/dri3proto_1.0.bb
 delete mode 100644 meta/recipes-graphics/xorg-proto/fixesproto_5.0.bb
 delete mode 100644 meta/recipes-graphics/xorg-proto/fontsproto_2.1.3.bb
 delete mode 100644 meta/recipes-graphics/xorg-proto/glproto_1.4.17.bb
 delete mode 100644 meta/recipes-graphics/xorg-proto/inputproto_2.3.2.bb
 delete mode 100644 meta/recipes-graphics/xorg-proto/kbproto_1.0.7.bb
 delete mode 100644 meta/recipes-graphics/xorg-proto/presentproto_git.bb
 delete mode 100644 meta/recipes-graphics/xorg-proto/randrproto_1.5.0.bb
 delete mode 100644 meta/recipes-graphics/xorg-proto/recordproto_1.14.2.bb
 delete mode 100644 meta/recipes-graphics/xorg-proto/renderproto_0.11.1.bb
 delete mode 100644 meta/recipes-graphics/xorg-proto/resourceproto_1.2.0.bb
 delete mode 100644 meta/recipes-graphics/xorg-proto/scrnsaverproto_1.2.2.bb
 delete mode 100644 meta/recipes-graphics/xorg-proto/videoproto_2.3.3.bb
 delete mode 100644 meta/recipes-graphics/xorg-proto/xcmiscproto_1.2.2.bb
 delete mode 100644 meta/recipes-graphics/xorg-proto/xextproto_7.3.0.bb
 delete mode 100644 meta/recipes-graphics/xorg-proto/xf86dgaproto_2.1.bb
 delete mode 100644 meta/recipes-graphics/xorg-proto/xf86driproto_2.1.1.bb
 delete mode 100644 meta/recipes-graphics/xorg-proto/xf86miscproto_0.9.3.bb
 delete mode 100644 meta/recipes-graphics/xorg-proto/xf86vidmodeproto_2.3.1.bb
 delete mode 100644 meta/recipes-graphics/xorg-proto/xineramaproto_1.2.1.bb
 delete mode 100644 meta/recipes-graphics/xorg-proto/xproto/xproto_fix_for_x32.patch
 delete mode 100644 meta/recipes-graphics/xorg-proto/xproto_7.0.31.bb

diff --git a/meta/recipes-graphics/xorg-proto/bigreqsproto_1.1.2.bb b/meta/recipes-graphics/xorg-proto/bigreqsproto_1.1.2.bb
deleted file mode 100644
index f798a43..0000000
--- a/meta/recipes-graphics/xorg-proto/bigreqsproto_1.1.2.bb
+++ /dev/null
@@ -1,16 +0,0 @@
-require xorg-proto-common.inc
-
-PE = "1"
-
-SUMMARY = "BigReqs: X Big Requests extension headers"
-
-DESCRIPTION = "This package provides the wire protocol for the \
-BIG-REQUESTS extension, used to send larger requests that usual in order \
-to avoid fragmentation."
-
-BBCLASSEXTEND = "native nativesdk"
-
-LIC_FILES_CHKSUM = "file://COPYING;md5=b12715630da6f268d0d3712ee1a504f4"
-
-SRC_URI[md5sum] = "1a05fb01fa1d5198894c931cf925c025"
-SRC_URI[sha256sum] = "462116ab44e41d8121bfde947321950370b285a5316612b8fce8334d50751b1e"
diff --git a/meta/recipes-graphics/xorg-proto/calibrateproto/fix.patch b/meta/recipes-graphics/xorg-proto/calibrateproto/fix.patch
deleted file mode 100644
index ff8cb25..0000000
--- a/meta/recipes-graphics/xorg-proto/calibrateproto/fix.patch
+++ /dev/null
@@ -1,42 +0,0 @@
-Upstream-Status: Pending
-
-Add missing length fields to the replies. Without these, sanity checking in recent X
-breaks things.
-
-RP 11/2/10
-
-
-Index: git/xcalibrateproto.h
-===================================================================
---- git.orig/xcalibrateproto.h	2010-02-11 11:47:45.711985932 +0000
-+++ git/xcalibrateproto.h	2010-02-11 11:40:21.000000000 +0000
-@@ -67,13 +67,13 @@
-     BYTE    type;   /* X_Reply */
-     BYTE    pad1;
-     CARD16  sequenceNumber B16;
-+    CARD32  length;
-     CARD32  status;
-     CARD32  pad2 B32;
-     CARD32  pad3 B32;
-     CARD32  pad4 B32;
-     CARD32  pad5 B32;
-     CARD32  pad6 B32;
--    CARD32  pad7 B32;
- } xXCalibrateRawModeReply;
- 
- #define sz_xXCalibrateRawModeReply	32
-@@ -92,13 +92,13 @@
-     BYTE    type;   /* X_Reply */
-     BYTE    pad1;
-     CARD16  sequenceNumber B16;
-+    CARD32  length;
-     CARD32  x;
-     CARD32  y;
-     CARD32  pad2 B32;
-     CARD32  pad3 B32;
-     CARD32  pad4 B32;
-     CARD32  pad5 B32;
--    CARD32  pad6 B32;
- } xXCalibrateScreenToCoordReply;
- 
- #define sz_xXCalibrateScreenToCoordReply	32
diff --git a/meta/recipes-graphics/xorg-proto/calibrateproto_git.bb b/meta/recipes-graphics/xorg-proto/calibrateproto_git.bb
deleted file mode 100644
index eb4b422..0000000
--- a/meta/recipes-graphics/xorg-proto/calibrateproto_git.bb
+++ /dev/null
@@ -1,21 +0,0 @@
-require xorg-proto-common.inc
-
-SUMMARY = "XCalibrate: Touchscreen calibration headers"
-
-DESCRIPTION = "This package provides the wire protocol for the \
-Touchscreen calibration extension."
-
-LICENSE = "MIT-style"
-LIC_FILES_CHKSUM = "file://xcalibratewire.h;endline=23;md5=7f86ef7b03cce6c4c9ebd59d20ca485f \
-                    file://xcalibrateproto.h;endline=23;md5=e4490491edcc171ca24f98569ee580db"
-
-SRCREV = "1da6fd1e2c7a49648245c98481fabea8b9690a8c"
-
-PV = "0.0+git${SRCPV}"
-PR = "r2"
-
-SRC_URI = "git://anongit.freedesktop.org/git/xorg/proto/calibrateproto \
-           file://fix.patch;apply=yes"
-S = "${WORKDIR}/git"
-UPSTREAM_CHECK_COMMITS = "1"
-
diff --git a/meta/recipes-graphics/xorg-proto/compositeproto_0.4.2.bb b/meta/recipes-graphics/xorg-proto/compositeproto_0.4.2.bb
deleted file mode 100644
index adfee26..0000000
--- a/meta/recipes-graphics/xorg-proto/compositeproto_0.4.2.bb
+++ /dev/null
@@ -1,21 +0,0 @@
-require xorg-proto-common.inc
-
-SUMMARY = "Xcomposite: X composite extension headers"
-
-DESCRIPTION = "This package provides the wire protocol for the X \
-composite extension.  The X composite extension provides three related \
-mechanisms for compositing and off-screen storage."
-
-LICENSE = "MIT & MIT-style"
-LIC_FILES_CHKSUM = "file://COPYING;md5=2c4bfe136f4a4418ea2f2a96b7c8f3c5 \
-                    file://composite.h;endline=43;md5=cbd44d4079053aa75930ed2f02b92926"
-
-RCONFLICTS_${PN} = "compositeext"
-BBCLASSEXTEND = "native"
-
-PR = "r1"
-PE = "1"
-
-SRC_URI[md5sum] = "98482f65ba1e74a08bf5b056a4031ef0"
-SRC_URI[sha256sum] = "049359f0be0b2b984a8149c966dd04e8c58e6eade2a4a309cf1126635ccd0cfc"
-
diff --git a/meta/recipes-graphics/xorg-proto/damageproto_1.2.1.bb b/meta/recipes-graphics/xorg-proto/damageproto_1.2.1.bb
deleted file mode 100644
index 75d0268..0000000
--- a/meta/recipes-graphics/xorg-proto/damageproto_1.2.1.bb
+++ /dev/null
@@ -1,20 +0,0 @@
-require xorg-proto-common.inc
-
-SUMMARY = "Xdamage: X Damage extension headers"
-
-DESCRIPTION = "This package provides the wire protocol for the DAMAGE \
-extension.  The DAMAGE extension allows applications to receive \
-information about changes made to pixel contents of windows and \
-pixmaps."
-
-LICENSE = "MIT-style"
-LIC_FILES_CHKSUM = "file://COPYING;md5=d5f5a2de65c3a84cbde769f07a769608 \
-                    file://damagewire.h;endline=23;md5=4a4501a592dbc7de5ce89255e50d0296"
-
-RCONFLICTS_${PN} = "damageext"
-BBCLASSEXTEND = "native"
-PR = "r1"
-PE = "1"
-
-SRC_URI[md5sum] = "998e5904764b82642cc63d97b4ba9e95"
-SRC_URI[sha256sum] = "5c7c112e9b9ea8a9d5b019e5f17d481ae20f766cb7a4648360e7c1b46fc9fc5b"
diff --git a/meta/recipes-graphics/xorg-proto/dmxproto_2.3.1.bb b/meta/recipes-graphics/xorg-proto/dmxproto_2.3.1.bb
deleted file mode 100644
index d960e5d..0000000
--- a/meta/recipes-graphics/xorg-proto/dmxproto_2.3.1.bb
+++ /dev/null
@@ -1,18 +0,0 @@
-require xorg-proto-common.inc
-
-SUMMARY = "DMX: Distributed Multihead extension headers"
-
-DESCRIPTION = "This package provides the wire protocol for the DMX \
-extension.  The DMX extension provides support for communication with \
-and control of Xdmx server.  Attributes of the Xdmx server and of the \
-back-end screens attached to the server can be queried and modified via \
-this protocol."
-
-LICENSE = "MIT"
-LIC_FILES_CHKSUM = "file://COPYING;md5=a3c3499231a8035efd0e004cfbd3b72a \
-                    file://dmxproto.h;endline=32;md5=ab8509955c3dd4c65fac728e1b367bc4"
-
-PE = "1"
-
-SRC_URI[md5sum] = "4ee175bbd44d05c34d43bb129be5098a"
-SRC_URI[sha256sum] = "e72051e6a3e06b236d19eed56368117b745ca1e1a27bdc50fd51aa375bea6509"
diff --git a/meta/recipes-graphics/xorg-proto/dri2proto_2.8.bb b/meta/recipes-graphics/xorg-proto/dri2proto_2.8.bb
deleted file mode 100644
index f4c40c5..0000000
--- a/meta/recipes-graphics/xorg-proto/dri2proto_2.8.bb
+++ /dev/null
@@ -1,15 +0,0 @@
-require xorg-proto-common.inc
-
-SUMMARY = "DRI2: Direct Rendering Infrastructure 2 headers"
-
-DESCRIPTION = "This package provides the wire protocol for the Direct \
-Rendering Ifnrastructure 2.  DIR is required for may hardware \
-accelerated OpenGL drivers."
-
-LICENSE = "MIT"
-LIC_FILES_CHKSUM = "file://COPYING;md5=2e396fa91834f8786032cad2da5638f3 \
-                    file://dri2proto.h;endline=31;md5=22f28bf68d01b533f26195e94b3ed8ca"
-
-
-SRC_URI[md5sum] = "b2721d5d24c04d9980a0c6540cb5396a"
-SRC_URI[sha256sum] = "f9b55476def44fc7c459b2537d17dbc731e36ed5d416af7ca0b1e2e676f8aa04"
diff --git a/meta/recipes-graphics/xorg-proto/dri3proto_1.0.bb b/meta/recipes-graphics/xorg-proto/dri3proto_1.0.bb
deleted file mode 100644
index bed97b3..0000000
--- a/meta/recipes-graphics/xorg-proto/dri3proto_1.0.bb
+++ /dev/null
@@ -1,14 +0,0 @@
-require xorg-proto-common.inc
-
-SUMMARY = "Direct Rendering Infrastructure 3 Extension"
-
-DESCRIPTION = "The DRI3 extension provides mechanisms to translate between direct \
-rendered buffers and X pixmaps. When combined with the Present extension, \
-a complete direct rendering solution for OpenGL is provided."
-
-LICENSE = "MIT"
-LIC_FILES_CHKSUM = "file://dri3proto.h;endline=21;md5=ac90d1d416be3cb13e1d3c88cd5166bf"
-
-
-SRC_URI[md5sum] = "a3d2cbe60a9ca1bf3aea6c93c817fee3"
-SRC_URI[sha256sum] = "01be49d70200518b9a6b297131f6cc71f4ea2de17436896af153226a774fc074"
diff --git a/meta/recipes-graphics/xorg-proto/fixesproto_5.0.bb b/meta/recipes-graphics/xorg-proto/fixesproto_5.0.bb
deleted file mode 100644
index 39fb88d..0000000
--- a/meta/recipes-graphics/xorg-proto/fixesproto_5.0.bb
+++ /dev/null
@@ -1,22 +0,0 @@
-require xorg-proto-common.inc
-
-SUMMARY = "XFixes: X Fixes extension headers"
-
-DESCRIPTION = "This package provides the wire protocol for the X Fixes \
-extension.  This extension is designed to provide server-side support \
-for application work arounds to shortcomings in the core X window \
-system."
-
-
-LICENSE = "MIT & MIT-style"
-LIC_FILES_CHKSUM = "file://COPYING;md5=262a7a87da56e66dd639bf7334a110c6 \
-                    file://xfixesproto.h;endline=43;md5=c3a9ee6db3532ed0d44dea266cfc97f4"
-
-RCONFLICTS_${PN} = "fixesext"
-PR = "r1"
-PE = "1"
-
-BBCLASSEXTEND = "native nativesdk"
-
-SRC_URI[md5sum] = "e7431ab84d37b2678af71e29355e101d"
-SRC_URI[sha256sum] = "ba2f3f31246bdd3f2a0acf8bd3b09ba99cab965c7fb2c2c92b7dc72870e424ce"
diff --git a/meta/recipes-graphics/xorg-proto/fontsproto_2.1.3.bb b/meta/recipes-graphics/xorg-proto/fontsproto_2.1.3.bb
deleted file mode 100644
index 27fc281..0000000
--- a/meta/recipes-graphics/xorg-proto/fontsproto_2.1.3.bb
+++ /dev/null
@@ -1,18 +0,0 @@
-require xorg-proto-common.inc
-
-SUMMARY = "XFont: X Font rasterisation headers"
-
-DESCRIPTION = "This package provides the wire protocol for the X Font \
-rasterisation extensions.  These extensions are used to control \
-server-side font configurations."
-
-LICENSE = "MIT-style"
-LIC_FILES_CHKSUM = "file://COPYING;md5=c3e48aa9ce868c8e90f0401db41c11a2 \
-                    file://FSproto.h;endline=44;md5=d2e58e27095e5ea7d4ad456ccb91986c"
-
-PE = "1"
-
-BBCLASSEXTEND = "native"
-
-SRC_URI[md5sum] = "36934d00b00555eaacde9f091f392f97"
-SRC_URI[sha256sum] = "259046b0dd9130825c4a4c479ba3591d6d0f17a33f54e294b56478729a6e5ab8"
diff --git a/meta/recipes-graphics/xorg-proto/glproto_1.4.17.bb b/meta/recipes-graphics/xorg-proto/glproto_1.4.17.bb
deleted file mode 100644
index eb03d33..0000000
--- a/meta/recipes-graphics/xorg-proto/glproto_1.4.17.bb
+++ /dev/null
@@ -1,18 +0,0 @@
-require xorg-proto-common.inc
-
-SUMMARY = "OpenGL: X OpenGL extension headers"
-
-DESCRIPTION = "This package provides the wire protocol for the \
-OpenGL-related extensions, used to enable the rendering of applications \
-using OpenGL."
-
-LICENSE = "MIT"
-LIC_FILES_CHKSUM = "file://COPYING;md5=d44ed0146997856304dfbb512a59a8de \
-                    file://glxproto.h;beginline=4;endline=32;md5=6b79c570f644363b356456e7d44471d9"
-
-PE = "1"
-
-BBCLASSEXTEND = "nativesdk"
-
-SRC_URI[md5sum] = "5565f1b0facf4a59c2778229c1f70d10"
-SRC_URI[sha256sum] = "adaa94bded310a2bfcbb9deb4d751d965fcfe6fb3a2f6d242e2df2d6589dbe40"
diff --git a/meta/recipes-graphics/xorg-proto/inputproto_2.3.2.bb b/meta/recipes-graphics/xorg-proto/inputproto_2.3.2.bb
deleted file mode 100644
index eb5e66b..0000000
--- a/meta/recipes-graphics/xorg-proto/inputproto_2.3.2.bb
+++ /dev/null
@@ -1,22 +0,0 @@
-require xorg-proto-common.inc
-
-SUMMARY = "XI: X Input extension headers"
-
-DESCRIPTION = "This package provides the wire protocol for the X Input \
-extension.  The extension supports input devices other then the core X \
-keyboard and pointer."
-
-LICENSE = "MIT & MIT-style"
-LIC_FILES_CHKSUM = "file://COPYING;md5=e562cc0f6587b961f032211d8160f31e \
-                    file://XI2proto.h;endline=48;md5=1ac1581e61188da2885cc14ff49b20be"
-
-PE = "1"
-
-inherit gettext
-
-BBCLASSEXTEND = "native nativesdk"
-
-SRC_URI[md5sum] = "b290a463af7def483e6e190de460f31a"
-SRC_URI[sha256sum] = "893a6af55733262058a27b38eeb1edc733669f01d404e8581b167f03c03ef31d"
-
-EXTRA_OECONF += "--without-asciidoc"
diff --git a/meta/recipes-graphics/xorg-proto/kbproto_1.0.7.bb b/meta/recipes-graphics/xorg-proto/kbproto_1.0.7.bb
deleted file mode 100644
index 46f5c92..0000000
--- a/meta/recipes-graphics/xorg-proto/kbproto_1.0.7.bb
+++ /dev/null
@@ -1,18 +0,0 @@
-require xorg-proto-common.inc
-
-SUMMARY = "XKB: X Keyboard extension headers"
-
-DESCRIPTION = "This package provides the wire protocol for the X \
-Keyboard extension.  This extension is used to control options related \
-to keyboard handling and layout."
-
-LICENSE = "MIT-style"
-LIC_FILES_CHKSUM = "file://COPYING;md5=7dd6ea99e2a83a552c02c80963623c38 \
-                    file://XKBproto.h;beginline=1;endline=25;md5=5744eeff407aeb6e7a1346eebab486a2"
-
-PE = "1"
-
-BBCLASSEXTEND = "native nativesdk"
-
-SRC_URI[md5sum] = "94afc90c1f7bef4a27fdd59ece39c878"
-SRC_URI[sha256sum] = "f882210b76376e3fa006b11dbd890e56ec0942bc56e65d1249ff4af86f90b857"
diff --git a/meta/recipes-graphics/xorg-proto/presentproto_git.bb b/meta/recipes-graphics/xorg-proto/presentproto_git.bb
deleted file mode 100644
index e6d32f9..0000000
--- a/meta/recipes-graphics/xorg-proto/presentproto_git.bb
+++ /dev/null
@@ -1,22 +0,0 @@
-require xorg-proto-common.inc
-
-SUMMARY = "This package provides the basic headers for the X Window System"
-DESCRIPTION = "The Present extension provides a way for applications to update their \
-               window contents from a pixmap in a well defined fashion, synchronizing \
-               with the display refresh and potentially using a more efficient \
-               mechanism than copying the contents of the source pixmap.\
-              "
-
-LICENSE = "GPLv2"
-
-SRCREV = "bfdc7e052302c79c5803ad95a73c9b63b350c40c"
-PV = "1.1+git${SRCPV}"
-
-LIC_FILES_CHKSUM = "file://COPYING;md5=47e508ca280fde97906eacb77892c3ac"
-
-SRC_URI = "git://anongit.freedesktop.org/git/xorg/proto/presentproto"
-S = "${WORKDIR}/git"
-
-inherit autotools
-
-BBCLASSEXTEND = "native"
diff --git a/meta/recipes-graphics/xorg-proto/randrproto_1.5.0.bb b/meta/recipes-graphics/xorg-proto/randrproto_1.5.0.bb
deleted file mode 100644
index b59e525..0000000
--- a/meta/recipes-graphics/xorg-proto/randrproto_1.5.0.bb
+++ /dev/null
@@ -1,19 +0,0 @@
-require xorg-proto-common.inc
-
-SUMMARY = "XRandR: X Resize, Rotate and Reflect extension headers"
-
-DESCRIPTION = "This package provides the wire protocol for the X Resize, \
-Rotate and Reflect extension.  This extension provides the ability to \
-resize, rotate and reflect the root window of a screen."
-
-LICENSE = "MIT-style"
-LIC_FILES_CHKSUM = "file://COPYING;md5=00426d41bd3d9267cf9bbb2df9323a5e \
-                    file://randrproto.h;endline=30;md5=3885957c6048fdf3310ac8ba54ca2c3f"
-
-RCONFLICTS_${PN} = "randrext"
-PE = "1"
-
-BBCLASSEXTEND = "native nativesdk"
-
-SRC_URI[md5sum] = "a46765c8dcacb7114c821baf0df1e797"
-SRC_URI[sha256sum] = "4c675533e79cd730997d232c8894b6692174dce58d3e207021b8f860be498468"
diff --git a/meta/recipes-graphics/xorg-proto/recordproto_1.14.2.bb b/meta/recipes-graphics/xorg-proto/recordproto_1.14.2.bb
deleted file mode 100644
index ad2317c..0000000
--- a/meta/recipes-graphics/xorg-proto/recordproto_1.14.2.bb
+++ /dev/null
@@ -1,18 +0,0 @@
-require xorg-proto-common.inc
-
-SUMMARY = "XRecord: X Record extension headers"
-
-DESCRIPTION = "This package provides the wire protocol for the X Record \
-extension.  This extension is used to record and play back event \
-sequences."
-
-LICENSE = "MIT-style"
-LIC_FILES_CHKSUM = "file://COPYING;md5=575827a0f554bbed332542976d5f3d40 \
-                    file://recordproto.h;endline=19;md5=1cbb0dd45a0b060ff833901620a3e738"
-
-RCONFLICTS_${PN} = "recordext"
-PR = "r1"
-PE = "1"
-
-SRC_URI[md5sum] = "1b4e5dede5ea51906f1530ca1e21d216"
-SRC_URI[sha256sum] = "a777548d2e92aa259f1528de3c4a36d15e07a4650d0976573a8e2ff5437e7370"
diff --git a/meta/recipes-graphics/xorg-proto/renderproto_0.11.1.bb b/meta/recipes-graphics/xorg-proto/renderproto_0.11.1.bb
deleted file mode 100644
index ff800ec..0000000
--- a/meta/recipes-graphics/xorg-proto/renderproto_0.11.1.bb
+++ /dev/null
@@ -1,21 +0,0 @@
-require xorg-proto-common.inc
-
-SUMMARY = "XRender: X rendering Extension headers"
-
-DESCRIPTION = "This package provides the wire protocol for the X \
-Rendering extension.  This is the basis the image composition within the \
-X window system."
-
-LICENSE = "MIT-style"
-LIC_FILES_CHKSUM = "file://COPYING;md5=f826d99765196352e6122a406cf0d024 \
-                    file://renderproto.h;beginline=4;endline=24;md5=3e5e2851dad240b0a3a27c4776b4fd1f"
-
-RCONFLICTS_${PN} = "renderext"
-PR = "r1"
-PE = "1"
-
-BBCLASSEXTEND = "native nativesdk"
-
-SRC_URI[md5sum] = "a914ccc1de66ddeb4b611c6b0686e274"
-SRC_URI[sha256sum] = "06735a5b92b20759204e4751ecd6064a2ad8a6246bb65b3078b862a00def2537"
-
diff --git a/meta/recipes-graphics/xorg-proto/resourceproto_1.2.0.bb b/meta/recipes-graphics/xorg-proto/resourceproto_1.2.0.bb
deleted file mode 100644
index 08b610a..0000000
--- a/meta/recipes-graphics/xorg-proto/resourceproto_1.2.0.bb
+++ /dev/null
@@ -1,19 +0,0 @@
-require xorg-proto-common.inc
-
-SUMMARY = "XRes: X Resource extension headers"
-
-DESCRIPTION = "This package provides the wire protocol for the X \
-Resource extension.  XRes provides an interface that allows X clients to \
-see and monitor X resource usage of various clients."
-
-LICENSE = "MIT"
-LIC_FILES_CHKSUM = "file://COPYING;md5=604859305e662503077240fee8c77d97"
-
-RCONFLICTS_${PN} = "resourceext"
-
-PR = "r1"
-PE = "1"
-
-SRC_URI[md5sum] = "cfdb57dae221b71b2703f8e2980eaaf4"
-SRC_URI[sha256sum] = "3c66003a6bdeb0f70932a9ed3cf57cc554234154378d301e0c5cfa189d8f6818"
-
diff --git a/meta/recipes-graphics/xorg-proto/scrnsaverproto_1.2.2.bb b/meta/recipes-graphics/xorg-proto/scrnsaverproto_1.2.2.bb
deleted file mode 100644
index ab07f51..0000000
--- a/meta/recipes-graphics/xorg-proto/scrnsaverproto_1.2.2.bb
+++ /dev/null
@@ -1,19 +0,0 @@
-require xorg-proto-common.inc
-
-SUMMARY = "Xscrnsaver: X Screen Saver extension headers"
-
-DESCRIPTION = "This package provides the wire protocol for the X Screen \
-Saver extension.  This extension allows an external \"screen saver\" \
-client to detect when the alternative image is to be displayed and to \
-provide the graphics."
-
-LICENSE = "MIT"
-LIC_FILES_CHKSUM = "file://COPYING;md5=eed49b78b15b436c933b6b8b054e3901 \
-                    file://saverproto.h;endline=26;md5=a84c0637305159f3c0ab173aaeede48d"
-
-PE = "1"
-
-EXTRA_OECONF_append = " --enable-specs=no"
-
-SRC_URI[md5sum] = "edd8a73775e8ece1d69515dd17767bfb"
-SRC_URI[sha256sum] = "8bb70a8da164930cceaeb4c74180291660533ad3cc45377b30a795d1b85bcd65"
diff --git a/meta/recipes-graphics/xorg-proto/videoproto_2.3.3.bb b/meta/recipes-graphics/xorg-proto/videoproto_2.3.3.bb
deleted file mode 100644
index 6f97a26..0000000
--- a/meta/recipes-graphics/xorg-proto/videoproto_2.3.3.bb
+++ /dev/null
@@ -1,14 +0,0 @@
-require xorg-proto-common.inc
-
-SUMMARY = "Xv: X Video extension headers"
-
-DESCRIPTION = "This package provides the wire protocol for the X Video \
-extension.  This extension alows for accerlated drawing of videos."
-
-LICENSE = "MIT & MIT-style"
-LIC_FILES_CHKSUM = "file://COPYING;md5=ce3472a119a864085fa4155cb0979a7b"
-
-PE = "1"
-
-SRC_URI[md5sum] = "fe86de8ea3eb53b5a8f52956c5cd3174"
-SRC_URI[sha256sum] = "c7803889fd08e6fcaf7b68cc394fb038b2325d1f315e571a6954577e07cca702"
diff --git a/meta/recipes-graphics/xorg-proto/xcmiscproto_1.2.2.bb b/meta/recipes-graphics/xorg-proto/xcmiscproto_1.2.2.bb
deleted file mode 100644
index 0751b94..0000000
--- a/meta/recipes-graphics/xorg-proto/xcmiscproto_1.2.2.bb
+++ /dev/null
@@ -1,17 +0,0 @@
-require xorg-proto-common.inc
-
-SUMMARY = "XC-MISC: X XC-Miscellaneous extension headers"
-
-DESCRIPTION = "This package provides the wire protocol for the XC-MISC \
-extension, which is used to get details of XID allocations within the \
-server."
-
-LICENSE = "MIT-style"
-LIC_FILES_CHKSUM = "file://COPYING;md5=09d83047c15994e05db29b423ed6662e"
-
-PE = "1"
-
-BBCLASSEXTEND = "native nativesdk"
-
-SRC_URI[md5sum] = "5f4847c78e41b801982c8a5e06365b24"
-SRC_URI[sha256sum] = "b13236869372256c36db79ae39d54214172677fb79e9cdc555dceec80bd9d2df"
diff --git a/meta/recipes-graphics/xorg-proto/xextproto_7.3.0.bb b/meta/recipes-graphics/xorg-proto/xextproto_7.3.0.bb
deleted file mode 100644
index dd0bd95..0000000
--- a/meta/recipes-graphics/xorg-proto/xextproto_7.3.0.bb
+++ /dev/null
@@ -1,24 +0,0 @@
-require xorg-proto-common.inc
-
-SUMMARY = "XExt: X Extension headers"
-
-DESCRIPTION = "This package provides the wire protocol for several X \
-extensions.  These protocol extensions include DOUBLE-BUFFER, DPMS, \
-Extended-Visual-Information, LBX, MIT_SHM, MIT_SUNDRY-NONSTANDARD, \
-Multi-Buffering, SECURITY, SHAPE, SYNC, TOG-CUP, XC-APPGROUP, XC-MISC, \
-XTEST.  In addition a small set of utility functions are also \
-available."
-
-LICENSE = "MIT & MIT-style"
-LIC_FILES_CHKSUM = "file://COPYING;md5=86f273291759d0ba2a22585cd1c06c53"
-
-PE = "1"
-
-inherit gettext
-
-EXTRA_OECONF_append = " --enable-specs=no"
-
-BBCLASSEXTEND = "native nativesdk"
-
-SRC_URI[md5sum] = "70c90f313b4b0851758ef77b95019584"
-SRC_URI[sha256sum] = "f3f4b23ac8db9c3a9e0d8edb591713f3d70ef9c3b175970dd8823dfc92aa5bb0"
diff --git a/meta/recipes-graphics/xorg-proto/xf86dgaproto_2.1.bb b/meta/recipes-graphics/xorg-proto/xf86dgaproto_2.1.bb
deleted file mode 100644
index 86f3ce3..0000000
--- a/meta/recipes-graphics/xorg-proto/xf86dgaproto_2.1.bb
+++ /dev/null
@@ -1,18 +0,0 @@
-require xorg-proto-common.inc
-
-SUMMARY = "XFree86-DGA: XFree86 Direct Graphics Access extension headers"
-
-DESCRIPTION = "This package provides the wire protocol for the XFree86 \
-Direct Graphics Access extension. This extension allows direct graphics \
-access to a framebuffer-like region, as well as relative mouse \
-reporting."
-
-LICENSE = "MIT"
-LIC_FILES_CHKSUM = "file://COPYING;md5=e01e66e4b317088cf869bc98e6af4fb6"
-
-RCONFLICTS_${PN} = "xxf86dgaext"
-PR = "r2"
-PE = "1"
-
-SRC_URI[md5sum] = "a036dc2fcbf052ec10621fd48b68dbb1"
-SRC_URI[sha256sum] = "ac5ef65108e1f2146286e53080975683dae49fc94680042e04bd1e2010e99050"
diff --git a/meta/recipes-graphics/xorg-proto/xf86driproto_2.1.1.bb b/meta/recipes-graphics/xorg-proto/xf86driproto_2.1.1.bb
deleted file mode 100644
index b3f9210..0000000
--- a/meta/recipes-graphics/xorg-proto/xf86driproto_2.1.1.bb
+++ /dev/null
@@ -1,17 +0,0 @@
-require xorg-proto-common.inc
-
-SUMMARY = "XFree86-DRI: XFree86 Direct Rendering Infrastructure extension headers"
-
-DESCRIPTION = "This package provides the wire protocol for the XFree86 \
-Direct Rendering Infrastructure extension.  The XFree86-DRI extension is \
-used to organize direct rendering support or 3D clients and help \
-arbitrate requests."
-
-LICENSE = "MIT"
-LIC_FILES_CHKSUM = "file://COPYING;md5=ef103b9d951e39ff7e23d386e2011fa3 \
-                    file://xf86driproto.h;endline=35;md5=42be3d8e6d429ab79172572bb0cff544"
-
-PE = "1"
-
-SRC_URI[md5sum] = "1d716d0dac3b664e5ee20c69d34bc10e"
-SRC_URI[sha256sum] = "9c4b8d7221cb6dc4309269ccc008a22753698ae9245a398a59df35f1404d661f"
diff --git a/meta/recipes-graphics/xorg-proto/xf86miscproto_0.9.3.bb b/meta/recipes-graphics/xorg-proto/xf86miscproto_0.9.3.bb
deleted file mode 100644
index d4663ea..0000000
--- a/meta/recipes-graphics/xorg-proto/xf86miscproto_0.9.3.bb
+++ /dev/null
@@ -1,17 +0,0 @@
-require xorg-proto-common.inc
-
-SUMMARY = "XFree86-Misc: XFree86 miscellaneous extension headers"
-
-DESCRIPTION = "This package provides the wire protocol for the XFree \
-miscellaneous extension.  The XFree86-Misc extension provides a means to \
-access input device configuration settings specific to the XFree86/Xorg \
-DDX."
-
-LICENSE = "MIT"
-LIC_FILES_CHKSUM = "file://COPYING;md5=e01e66e4b317088cf869bc98e6af4fb6"
-
-PR = "r1"
-PE = "1"
-
-SRC_URI[md5sum] = "ca63bbb31cf5b7f37b2237e923ff257a"
-SRC_URI[sha256sum] = "45b8ec6a4a8ca21066dce117e09dcc88539862e616e60fb391de05b36f63b095"
diff --git a/meta/recipes-graphics/xorg-proto/xf86vidmodeproto_2.3.1.bb b/meta/recipes-graphics/xorg-proto/xf86vidmodeproto_2.3.1.bb
deleted file mode 100644
index 0f31900..0000000
--- a/meta/recipes-graphics/xorg-proto/xf86vidmodeproto_2.3.1.bb
+++ /dev/null
@@ -1,18 +0,0 @@
-require xorg-proto-common.inc
-
-SUMMARY = "XFree86-VM: XFree86 video mode extension headers"
-
-DESCRIPTION = "This package provides the wire protocol for the XFree86 \
-video mode extension.  This extension allows client applications to get \
-and set video mode timings."
-
-LICENSE = "MIT"
-LIC_FILES_CHKSUM = "file://COPYING;md5=499be2ff387a42f84628c35f311f1502"
-
-RCONFLICTS_${PN} = "xxf86vmext"
-
-PR = "r1"
-PE = "1"
-
-SRC_URI[md5sum] = "e793ecefeaecfeabd1aed6a01095174e"
-SRC_URI[sha256sum] = "45d9499aa7b73203fd6b3505b0259624afed5c16b941bd04fcf123e5de698770"
diff --git a/meta/recipes-graphics/xorg-proto/xineramaproto_1.2.1.bb b/meta/recipes-graphics/xorg-proto/xineramaproto_1.2.1.bb
deleted file mode 100644
index dde7e9d..0000000
--- a/meta/recipes-graphics/xorg-proto/xineramaproto_1.2.1.bb
+++ /dev/null
@@ -1,19 +0,0 @@
-require xorg-proto-common.inc
-
-SUMMARY = "Xinerama: Xinerama extension headers"
-
-DESCRIPTION = "This package provides the wire protocol for the Xinerama \
-extension.  This extension is used for retrieving information about \
-physical output devices which may be combined into a single logical X \
-screen."
-
-LICENSE = "MIT & MIT-style"
-LIC_FILES_CHKSUM = "file://COPYING;md5=3e397a5326c83d5d0ebf5b3f87163ac6 \
-                    file://panoramiXproto.h;endline=24;md5=098e0bc089368a988092b3cbda617a57"
-
-PE = "1"
-
-SRC_URI[md5sum] = "9959fe0bfb22a0e7260433b8d199590a"
-SRC_URI[sha256sum] = "977574bb3dc192ecd9c55f59f991ec1dff340be3e31392c95deff423da52485b"
-
-BBCLASSEXTEND = "native nativesdk"
diff --git a/meta/recipes-graphics/xorg-proto/xproto/xproto_fix_for_x32.patch b/meta/recipes-graphics/xorg-proto/xproto/xproto_fix_for_x32.patch
deleted file mode 100644
index 4f9ed99..0000000
--- a/meta/recipes-graphics/xorg-proto/xproto/xproto_fix_for_x32.patch
+++ /dev/null
@@ -1,24 +0,0 @@
-Upstream-Status: Pending
-
-Don't always define LONG64 for AMD64
-    
-X32 defines __amd64__/amd64 with 32bit long.  We should simply check
-__LP64__ before defining LONG64 without checking __amd64__/amd64.
-
-This fixes compilation with x32 toolchain.
-
-Received this patch from H.J. Lu <hjl.tools@gmail.com>
-Signed-off-by: Nitin A Kamble <nitin.a.kamble@intel.com> 2011/12/1
-
-Index: xproto-7.0.31/Xmd.h
-===================================================================
---- xproto-7.0.31.orig/Xmd.h
-+++ xproto-7.0.31/Xmd.h
-@@ -62,7 +62,6 @@ SOFTWARE.
-      defined(__ia64__) || defined(ia64) || \
-      defined(__sparc64__) || \
-      defined(__s390x__) || \
--     defined(__amd64__) || defined(amd64) || \
-      defined(__powerpc64__)
- #  if !defined(__ILP32__) /* amd64-x32 is 32bit */
- #   define LONG64				/* 32/64-bit architecture */
diff --git a/meta/recipes-graphics/xorg-proto/xproto_7.0.31.bb b/meta/recipes-graphics/xorg-proto/xproto_7.0.31.bb
deleted file mode 100644
index febcc67..0000000
--- a/meta/recipes-graphics/xorg-proto/xproto_7.0.31.bb
+++ /dev/null
@@ -1,19 +0,0 @@
-require xorg-proto-common.inc
-
-SUMMARY = "Xlib: C Language X interface headers"
-
-DESCRIPTION = "This package provides the basic headers for the X Window \
-System."
-
-LICENSE = "MIT & MIT-style"
-LIC_FILES_CHKSUM = "file://COPYING;md5=b9e051107d5628966739a0b2e9b32676"
-
-PE = "1"
-
-SRC_URI += "file://xproto_fix_for_x32.patch"
-
-EXTRA_OECONF_append = " --enable-specs=no"
-BBCLASSEXTEND = "native nativesdk"
-
-SRC_URI[md5sum] = "16791f7ca8c51a20608af11702e51083"
-SRC_URI[sha256sum] = "c6f9747da0bd3a95f86b17fb8dd5e717c8f3ab7f0ece3ba1b247899ec1ef7747"
-- 
2.7.4


