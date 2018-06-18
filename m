Return-Path: <ross.burton@intel.com>
Received: from mail-wr0-f195.google.com (mail-wr0-f195.google.com
	[209.85.128.195])
	by mail.openembedded.org (Postfix) with ESMTP id 16F7375032
	for <openembedded-core@lists.openembedded.org>;
	Mon, 18 Jun 2018 10:05:43 +0000 (UTC)
Received: by mail-wr0-f195.google.com with SMTP id o12-v6so16144307wrm.12
	for <openembedded-core@lists.openembedded.org>;
	Mon, 18 Jun 2018 03:05:45 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=intel-com.20150623.gappssmtp.com; s=20150623;
	h=from:to:subject:date:message-id;
	bh=vHOJrRiuz/rpz2gaZ4Vmkl/IlaZps8KQ3h/kxQTIgSI=;
	b=HlZXO/B6ZjkiLJ78IHUUqsyRqjzMZ8r/PE3hM7+CJLFdfpz2zgMla4Ug9+tNQuboQX
	gmerR/bRuGlSxHXqMS0Gw899gZO0mEUKtYoezNLG7H3Z937E94MukZ0Ao2GS4uXwB6FD
	garmBEw0FnxdZMZeDroWwRQ3NUfPv68h5xjUsiiKs5WAKVFowHoVAp/04VXCtKya0nz4
	xIk40Ad/9ZNR6ZZehHor3gIAkZNLfq2BRGRvL1NKQFELl50il2Js1la5/5md0fhHpwI+
	b92GyGB85U7sWvTPANXbujtCjthPclP+5K3dGjrsSHC0Jmnz9QTupsIcru8jylyfBSJ0
	RiZg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:from:to:subject:date:message-id;
	bh=vHOJrRiuz/rpz2gaZ4Vmkl/IlaZps8KQ3h/kxQTIgSI=;
	b=a1Wy08lWWnQZPSTiYCtL9doHHVHq0OFYfN/f5DOv3X///g9S0u/IDPwcfYIYQzRKze
	TvYWE6uNpTUy7VtZFNvEt1zkZHO93oCpz7yjkAldcyd1i02fLRxGR7NpEhdyoNQ2qdsI
	1Gxq0q2zR2sHLuFyx1JwZ2Py3T38/A5CYWpzM8GukjS0JmT9gCYf3Yz0R7727ITzNl42
	q1GBJPdDf/WBrv3jjObYT7/BaF07OmFw8LvsenClkOMf7etNJSyytvj7mZrjECpZieaj
	EI+RW8+mIW577+6CIUUG5ypzEcyOs247/HYxfTbo/BhBNcRs1boVkKOzoahq8lS4GP6+
	x9Rg==
X-Gm-Message-State: APt69E10RxsNqLTCUCfAb0nAL1UQVd1rSBEjPOGyQ856j8PyTuMKRQnP
	KGsfxzDjuEZfF6BDXuNwFo3cGapO
X-Google-Smtp-Source: ADUXVKJBnaONKaMzv3STmVbcXAKSx6Pm3bArItfBbnKM9bn01K4obN8Y9rvBEdrPt36LPOmwcqEKLQ==
X-Received: by 2002:adf:c907:: with SMTP id m7-v6mr10412554wrh.6.1529316344055;
	Mon, 18 Jun 2018 03:05:44 -0700 (PDT)
Received: from flashheart.burtonini.com (35.106.2.81.in-addr.arpa.
	[81.2.106.35]) by smtp.gmail.com with ESMTPSA id
	v14-v6sm15421892wro.33.2018.06.18.03.05.42
	for <openembedded-core@lists.openembedded.org>
	(version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
	Mon, 18 Jun 2018 03:05:42 -0700 (PDT)
From: Ross Burton <ross.burton@intel.com>
To: openembedded-core@lists.openembedded.org
Date: Mon, 18 Jun 2018 11:05:38 +0100
Message-Id: <20180618100538.7431-1-ross.burton@intel.com>
X-Mailer: git-send-email 2.11.0
Subject: [PATCH] xf86-video-omap: remove
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
X-List-Received-Date: Mon, 18 Jun 2018 10:05:44 -0000

This driver is dead upstream and doesn't appear to provide any advantage over
upstream kernel drivers and xserver's modesetting support.

Signed-off-by: Ross Burton <ross.burton@intel.com>
---
 .../xorg-driver/xf86-video-omap_0.4.5.bb           | 41 ----------------------
 1 file changed, 41 deletions(-)
 delete mode 100644 meta/recipes-graphics/xorg-driver/xf86-video-omap_0.4.5.bb

diff --git a/meta/recipes-graphics/xorg-driver/xf86-video-omap_0.4.5.bb b/meta/recipes-graphics/xorg-driver/xf86-video-omap_0.4.5.bb
deleted file mode 100644
index 0430f67b40e..00000000000
--- a/meta/recipes-graphics/xorg-driver/xf86-video-omap_0.4.5.bb
+++ /dev/null
@@ -1,41 +0,0 @@
-require xorg-driver-video.inc
-
-SUMMARY = "X.Org X server -- Texas Instruments OMAP framebuffer driver"
-
-SUMMARY = "X.Org X server -- TI OMAP integrated graphics chipsets driver"
-
-DESCRIPTION = "Open-source X.org graphics driver for TI OMAP graphics \
-Currently relies on a closed-source submodule for EXA acceleration on \
-the following chipsets: \
-  + OMAP3430 \
-  + OMAP3630 \
-  + OMAP4430 \
-  + OMAP4460 \
-  + OMAP5430 \
-  + OMAP5432 \
-\
-NOTE: this driver is work in progress..  you probably don't want to try \
-and use it yet.  The API/ABI between driver and kernel, and driver and \
-acceleration submodules is not stable yet.  This driver requires the \
-omapdrm kernel driver w/ GEM support. \
-"
-
-LICENSE = "GPLv2+"
-LIC_FILES_CHKSUM = "file://COPYING;md5=10ce5de3b111315ea652a5f74ec0c602"
-DEPENDS += "virtual/libx11 libdrm xorgproto"
-
-SRC_URI[md5sum] = "3b8ea5e8fba63355c0dc6681c49d5fe5"
-SRC_URI[sha256sum] = "93e7d42107521e61f61980eaea64fb452e87b7b94272e48938ac8d904ccfab5a"
-
-CFLAGS += " -I${STAGING_INCDIR}/xorg "
-
-# Use overlay 2 on omap3 to enable other apps to use overlay 1 (e.g. dmai or omapfbplay)
-do_compile_prepend_armv7a () {
-        sed -i -e s:fb1:fb2:g ${S}/src/omap_xv.c
-}
-
-python () {
-    if not bb.utils.contains ('DISTRO_FEATURES', 'opengl', True, False, d):
-        raise bb.parse.SkipRecipe("'opengl' not in DISTRO_FEATURES")
-}
-
-- 
2.11.0


