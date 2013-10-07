Return-Path: <ross.burton@intel.com>
Received: from mail-wi0-f175.google.com (mail-wi0-f175.google.com
	[209.85.212.175])
	by mail.openembedded.org (Postfix) with ESMTP id 274AA6CE60
	for <openembedded-core@lists.openembedded.org>;
	Mon,  7 Oct 2013 11:49:19 +0000 (UTC)
Received: by mail-wi0-f175.google.com with SMTP id ez12so4640951wid.2
	for <openembedded-core@lists.openembedded.org>;
	Mon, 07 Oct 2013 04:49:21 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20130820;
	h=x-gm-message-state:from:to:subject:date:message-id:in-reply-to
	:references;
	bh=a2raWdyX4EiabuCSSTe21OPrV9MuzhmSwGpDq0vxIMQ=;
	b=Ir2e4EszsOJIii4kNQzThH4rHNx+3yvRfdBBt8ShkNHNWZdwgMAEFCqo/ry00fvGhp
	RNmBv8OnCr0GsIzU+JcokKaL0c1yll0Mb8DALF3jLC3kVyxHMA9VVnme1r/YNivp9OUt
	siDr2OvDMp6ZH3hcPikBs+bmmoX6nYaBmB6sh4LxGHayDOtVt90Vj9qgHkgSGhqX50FV
	xWtt4EzSjyRIQdll9m18BiDDnpAliaq8jO3J/gijIKzICk7I3gfx3hP6RnM1c/jqctE8
	QexJCmxteuSpG4PA7fD0f8kq0VvMXPu/9MnHDXx4x8M7Dat5ZjAclP/n0yxZuRdhzQUQ
	urJQ==
X-Gm-Message-State: ALoCoQmkfeZH/n8h3J7aI/3nEn1FjRnetzHffAiw1c0hevRKHXdyCA4RK3U/DEPl7wYu5kZcboWs
X-Received: by 10.180.83.228 with SMTP id t4mr18830137wiy.12.1381146561593;
	Mon, 07 Oct 2013 04:49:21 -0700 (PDT)
Received: from melchett.burtonini.com (35.106.2.81.in-addr.arpa. [81.2.106.35])
	by mx.google.com with ESMTPSA id
	mb7sm38608731wic.10.1969.12.31.16.00.00
	(version=TLSv1.2 cipher=ECDHE-RSA-RC4-SHA bits=128/128);
	Mon, 07 Oct 2013 04:49:21 -0700 (PDT)
From: Ross Burton <ross.burton@intel.com>
To: openembedded-core@lists.openembedded.org
Date: Mon,  7 Oct 2013 12:49:09 +0100
Message-Id: <1381146549-16693-4-git-send-email-ross.burton@intel.com>
X-Mailer: git-send-email 1.7.10.4
In-Reply-To: <1381146549-16693-1-git-send-email-ross.burton@intel.com>
References: <1381146549-16693-1-git-send-email-ross.burton@intel.com>
Subject: [PATCH 4/4] xf86-video-vesa: upgrade to 2.3.3
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
X-List-Received-Date: Mon, 07 Oct 2013 11:49:20 -0000

Drop Remove-mibstore.h.patch as that was a backport from git and is integrated
into 2.3.3.

Signed-off-by: Ross Burton <ross.burton@intel.com>
---
 .../xf86-video-vesa/Remove-mibstore.h.patch        |   37 --------------------
 .../xorg-driver/xf86-video-vesa_2.3.2.bb           |   23 ------------
 .../xorg-driver/xf86-video-vesa_2.3.3.bb           |   21 +++++++++++
 3 files changed, 21 insertions(+), 60 deletions(-)
 delete mode 100644 meta/recipes-graphics/xorg-driver/xf86-video-vesa/Remove-mibstore.h.patch
 delete mode 100644 meta/recipes-graphics/xorg-driver/xf86-video-vesa_2.3.2.bb
 create mode 100644 meta/recipes-graphics/xorg-driver/xf86-video-vesa_2.3.3.bb

diff --git a/meta/recipes-graphics/xorg-driver/xf86-video-vesa/Remove-mibstore.h.patch b/meta/recipes-graphics/xorg-driver/xf86-video-vesa/Remove-mibstore.h.patch
deleted file mode 100644
index 0805d81..0000000
--- a/meta/recipes-graphics/xorg-driver/xf86-video-vesa/Remove-mibstore.h.patch
+++ /dev/null
@@ -1,37 +0,0 @@
-Upstream-Status: Backported
-
-From 60d2dc115c4b6210d3b1e05f5b0c39d1f7917cbc Mon Sep 17 00:00:00 2001
-From: Adam Jackson <ajax@redhat.com>
-Date: Tue, 25 Sep 2012 08:55:03 -0400
-Subject: [PATCH] Remove mibstore.h
-
-Signed-off-by: Adam Jackson <ajax@redhat.com>
----
- src/vesa.c |    4 ----
- 1 file changed, 4 deletions(-)
-
-diff --git a/src/vesa.c b/src/vesa.c
-index 11cd26c..b73d104 100644
---- a/src/vesa.c
-+++ b/src/vesa.c
-@@ -49,9 +49,6 @@
- /* All drivers initialising the SW cursor need this */
- #include "mipointer.h"
- 
--/* All drivers implementing backing store need this */
--#include "mibstore.h"
--
- /* Colormap handling */
- #include "micmap.h"
- #include "xf86cmap.h"
-@@ -1081,7 +1078,6 @@ VESAScreenInit(SCREEN_INIT_ARGS_DECL)
-     VESADGAInit(pScrn, pScreen);
- 
-     xf86SetBlackWhitePixels(pScreen);
--    miInitializeBackingStore(pScreen);
-     xf86SetBackingStore(pScreen);
- 
-     /* software cursor */
--- 
-1.7.9.5
-
diff --git a/meta/recipes-graphics/xorg-driver/xf86-video-vesa_2.3.2.bb b/meta/recipes-graphics/xorg-driver/xf86-video-vesa_2.3.2.bb
deleted file mode 100644
index 4ec07a0..0000000
--- a/meta/recipes-graphics/xorg-driver/xf86-video-vesa_2.3.2.bb
+++ /dev/null
@@ -1,23 +0,0 @@
-require xorg-driver-video.inc
-
-LIC_FILES_CHKSUM = "file://COPYING;md5=a1f0610ebdc6f314a9fa5102a8c5c1b0"
-
-SUMMARY = "X.Org X server -- Generic Vesa video driver"
-
-DESCRIPTION = "vesa is an Xorg driver for generic VESA video cards. It \
-can drive most VESA-compatible video cards, but only makes use of the \
-basic standard VESA core that is common to these cards. The driver \
-supports depths 8, 15 16 and 24."
-
-PR = "${INC_PR}.0"
-
-DEPENDS += "virtual/libx11 randrproto libpciaccess"
-
-COMPATIBLE_HOST = '(i.86|x86_64).*-linux'
-
-RRECOMMENDS_${PN} += "xserver-xorg-module-libint10"
-
-SRC_URI += "file://Remove-mibstore.h.patch"
-
-SRC_URI[md5sum] = "3eddd393fba79550e012d717499d58ad"
-SRC_URI[sha256sum] = "144a17ffae3c86603ddc4ae33521a52813498ee1f8213faa662dc4a8d6490ee3"
diff --git a/meta/recipes-graphics/xorg-driver/xf86-video-vesa_2.3.3.bb b/meta/recipes-graphics/xorg-driver/xf86-video-vesa_2.3.3.bb
new file mode 100644
index 0000000..4052f70
--- /dev/null
+++ b/meta/recipes-graphics/xorg-driver/xf86-video-vesa_2.3.3.bb
@@ -0,0 +1,21 @@
+require xorg-driver-video.inc
+
+LIC_FILES_CHKSUM = "file://COPYING;md5=a1f0610ebdc6f314a9fa5102a8c5c1b0"
+
+SUMMARY = "X.Org X server -- Generic Vesa video driver"
+
+DESCRIPTION = "vesa is an Xorg driver for generic VESA video cards. It \
+can drive most VESA-compatible video cards, but only makes use of the \
+basic standard VESA core that is common to these cards. The driver \
+supports depths 8, 15 16 and 24."
+
+PR = "${INC_PR}.0"
+
+DEPENDS += "virtual/libx11 randrproto libpciaccess"
+
+COMPATIBLE_HOST = '(i.86|x86_64).*-linux'
+
+RRECOMMENDS_${PN} += "xserver-xorg-module-libint10"
+
+SRC_URI[md5sum] = "3690a5356ed121b1a7dfb59a6dcf4bf9"
+SRC_URI[sha256sum] = "ce8b75e5a40e9dae76f2ac9e2880f7f73a848653ca2eed5880f52dc2c0d3aef8"
-- 
1.7.10.4


