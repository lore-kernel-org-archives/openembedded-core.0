Return-Path: <martin.jansa@gmail.com>
Received: from mail-wi0-f177.google.com (mail-wi0-f177.google.com
	[209.85.212.177])
	by mail.openembedded.org (Postfix) with ESMTP id B9CE772CD5
	for <openembedded-core@lists.openembedded.org>;
	Thu, 22 Jan 2015 16:39:43 +0000 (UTC)
Received: by mail-wi0-f177.google.com with SMTP id r20so4676215wiv.4
	for <openembedded-core@lists.openembedded.org>;
	Thu, 22 Jan 2015 08:39:44 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=from:to:subject:date:message-id:in-reply-to:references:in-reply-to
	:references; bh=F15fGUymT9AOIvd0tTd0MyvsHCExKgzj7IbkNn7DTXU=;
	b=GaGGmWVB4k0l7mLU3yOv/IPFHRCfkHO2gRdvw7ZeEun2WxGmndw0iFJ4UD3be5zQ+f
	M6HLfFTorL0EsOXDQfKCrx3Swo0VRFW28lnUHJ1KtBS9KP2Udg/4m1aLYHa87yMvBjzM
	ppHDZHF13TPJB3l3HqkYcqLUI0gTZM8qOTIURhYtVMwSN3naqw4IZqotchiW+P9GvBh7
	v5UI5mhNu1iTYcZfDgiWw1UwSg8Y7PLVaWEzCnjMvk9ml4O3si/xoVgaVG9bPMnSdABD
	GaAq8tFgq2eyP0C8YxBC5sg7w3bbH+fdKNLCCs6E8/XwyLRoF1hUH47Ksg9P1G+hRSbl
	Vltg==
X-Received: by 10.180.221.232 with SMTP id qh8mr198040wic.6.1421944784392;
	Thu, 22 Jan 2015 08:39:44 -0800 (PST)
Received: from localhost (ip-89-176-104-3.net.upcbroadband.cz. [89.176.104.3])
	by mx.google.com with ESMTPSA id
	w16sm3677614wia.15.2015.01.22.08.39.43
	for <openembedded-core@lists.openembedded.org>
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
	Thu, 22 Jan 2015 08:39:43 -0800 (PST)
From: Martin Jansa <martin.jansa@gmail.com>
X-Google-Original-From: Martin Jansa <Martin.Jansa@gmail.com>
To: openembedded-core@lists.openembedded.org
Date: Thu, 22 Jan 2015 17:39:43 +0100
Message-Id: <917d1356dc23ece3b039f9999e67b74373899ad9.1421944678.git.Martin.Jansa@gmail.com>
X-Mailer: git-send-email 2.2.1
In-Reply-To: <cover.1421944678.git.Martin.Jansa@gmail.com>
References: <cover.1421944678.git.Martin.Jansa@gmail.com>
In-Reply-To: <cover.1421944678.git.Martin.Jansa@gmail.com>
References: <cover.1421944678.git.Martin.Jansa@gmail.com>
Subject: [PATCHv3 1/4] xorg-app: add x11 to required DISTRO_FEATURES and cleanup dependencies
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
X-List-Received-Date: Thu, 22 Jan 2015 16:39:47 -0000

* both got libx11 dependency from xorg-app-common.inc already

Signed-off-by: Martin Jansa <Martin.Jansa@gmail.com>
---
 meta/recipes-graphics/xorg-app/xeyes_1.1.1.bb      | 2 +-
 meta/recipes-graphics/xorg-app/xorg-app-common.inc | 5 ++++-
 meta/recipes-graphics/xorg-app/xprop_1.2.2.bb      | 2 +-
 3 files changed, 6 insertions(+), 3 deletions(-)

diff --git a/meta/recipes-graphics/xorg-app/xeyes_1.1.1.bb b/meta/recipes-graphics/xorg-app/xeyes_1.1.1.bb
index 96ea030..84d0cb8 100644
--- a/meta/recipes-graphics/xorg-app/xeyes_1.1.1.bb
+++ b/meta/recipes-graphics/xorg-app/xeyes_1.1.1.bb
@@ -11,4 +11,4 @@ LIC_FILES_CHKSUM = "file://COPYING;md5=3ea51b365051ac32d1813a7dbaa4bfc6"
 SRC_URI[md5sum] = "a3035dcecdbdb89e864177c080924981"
 SRC_URI[sha256sum] = "975e98680cd59e1f9439016386609546ed08c284d0f05a95276f96aca6e8a521"
 
-DEPENDS += " virtual/libx11 libxau libxt libxext libxmu libxrender"
+DEPENDS += "libxau libxt libxext libxmu libxrender"
diff --git a/meta/recipes-graphics/xorg-app/xorg-app-common.inc b/meta/recipes-graphics/xorg-app/xorg-app-common.inc
index 524a2d3..59a04fa 100644
--- a/meta/recipes-graphics/xorg-app/xorg-app-common.inc
+++ b/meta/recipes-graphics/xorg-app/xorg-app-common.inc
@@ -5,12 +5,15 @@ SECTION = "x11/apps"
 LICENSE = "MIT-X"
 DEPENDS = "util-macros-native virtual/libx11"
 
+# depends on virtual/libx11
+REQUIRED_DISTRO_FEATURES = "x11"
+
 INC_PR = "r8"
 
 SRC_URI = "${XORG_MIRROR}/individual/app/${BPN}-${PV}.tar.bz2"
 
 S = "${WORKDIR}/${BPN}-${PV}"
 
-inherit autotools pkgconfig
+inherit autotools pkgconfig distro_features_check
 
 FILES_${PN} += " ${libdir}/X11/${BPN} ${datadir}/X11/app-defaults/"
diff --git a/meta/recipes-graphics/xorg-app/xprop_1.2.2.bb b/meta/recipes-graphics/xorg-app/xprop_1.2.2.bb
index efbb1b3..d78bf04 100644
--- a/meta/recipes-graphics/xorg-app/xprop_1.2.2.bb
+++ b/meta/recipes-graphics/xorg-app/xprop_1.2.2.bb
@@ -10,7 +10,7 @@ formatting information."
 
 LIC_FILES_CHKSUM = "file://COPYING;md5=e226ab8db88ac0bc0391673be40c9f91"
 
-DEPENDS += " libxmu virtual/libx11"
+DEPENDS += "libxmu"
 
 PE = "1"
 
-- 
2.2.1


