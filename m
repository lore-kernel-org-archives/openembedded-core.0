Return-Path: <wangmy@fujitsu.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 88C1BD6ACD7
	for <webhook@archiver.kernel.org>; Thu, 18 Dec 2025 09:06:13 +0000 (UTC)
Received: from esa2.hc1455-7.c3s2.iphmx.com (esa2.hc1455-7.c3s2.iphmx.com [207.54.90.48])
 by mx.groups.io with SMTP id smtpd.msgproc02-g2.37732.1766048768319054953
 for <openembedded-core@lists.openembedded.org>;
 Thu, 18 Dec 2025 01:06:08 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@fujitsu.com header.s=fj2 header.b=UM76oeFr;
 spf=pass (domain: fujitsu.com, ip: 207.54.90.48, mailfrom: wangmy@fujitsu.com)
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
  d=fujitsu.com; i=@fujitsu.com; q=dns/txt; s=fj2;
  t=1766048768; x=1797584768;
  h=from:to:cc:subject:date:message-id:in-reply-to:
   references:mime-version:content-transfer-encoding;
  bh=Xx1BBMBtN4LR33GNnBf3e2hXYlUIy9ssgb6zjTejnkI=;
  b=UM76oeFrYTNNEXDugJh1JTjZ/LH0EbCuZ3lhpjOe08xvrooVVpoX5SVk
   EKCSB9RacYpBm6A/aA1oh9C5eiEfBVl9LdNiQ+/5NP2sLBO7MpXrDmxM0
   Up1nKH1XzJaSerxmsb1R/JKP7LBb5R4tIDoOzkjVglL/pid8zf7Os0Ghk
   NJCba8DJLmFHMaAB6tCWN7VCwrnx5MaP5ZboRoFOU1PSPYRGWmv7TW0PL
   VWH5X2U23HQ+Gxxfz9NtuFSqPN/NuHBENqy7xuJ8yvs6J4zrbTINRLFg7
   HUMeJJ3rit1CPEsv4Sd692rknWUvW3Y0WBugGLpzS5r6twRDgxZyF/xcu
   w==;
X-CSE-ConnectionGUID: Mj6Iq3uYSySYTK2oO2D+lw==
X-CSE-MsgGUID: bwmTpixJTnKawYLeUZvG0Q==
X-IronPort-AV: E=McAfee;i="6800,10657,11645"; a="223059977"
X-IronPort-AV: E=Sophos;i="6.21,158,1763391600"; 
   d="scan'208";a="223059977"
Received: from unknown (HELO az2nlsmgr2.o.css.fujitsu.com) ([51.138.80.169])
  by esa2.hc1455-7.c3s2.iphmx.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 18 Dec 2025 18:06:06 +0900
Received: from az2nlsmgm4.fujitsu.com (unknown [10.150.26.204])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by az2nlsmgr2.o.css.fujitsu.com (Postfix) with ESMTPS id BC36A307D
	for <openembedded-core@lists.openembedded.org>; Thu, 18 Dec 2025 09:06:06 +0000 (UTC)
Received: from az2uksmom4.o.css.fujitsu.com (az2uksmom4.o.css.fujitsu.com [10.151.22.204])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by az2nlsmgm4.fujitsu.com (Postfix) with ESMTPS id 7222F1005947
	for <openembedded-core@lists.openembedded.org>; Thu, 18 Dec 2025 09:06:06 +0000 (UTC)
Received: from G08FNSTD200057.g08.fujitsu.local (unknown [10.193.128.34])
	by az2uksmom4.o.css.fujitsu.com (Postfix) with ESMTP id 061E040433F;
	Thu, 18 Dec 2025 09:06:03 +0000 (UTC)
From: Wang Mingyu < wangmy@fujitsu.com>
To: openembedded-core@lists.openembedded.org
Cc: Wang Mingyu <wangmy@fujitsu.com>
Subject: [OE-core] [PATCH 08/11] gstreamer1.0-python: upgrade 1.26.7 -> 1.26.9
Date: Thu, 18 Dec 2025 17:05:44 +0800
Message-ID: <20251218090547.828-8-wangmy@fujitsu.com>
X-Mailer: git-send-email 2.49.0.windows.1
In-Reply-To: <20251218090547.828-1-wangmy@fujitsu.com>
References: <20251218090547.828-1-wangmy@fujitsu.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Thu, 18 Dec 2025 09:06:13 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/228101

From: Wang Mingyu <wangmy@fujitsu.com>

Signed-off-by: Wang Mingyu <wangmy@fujitsu.com>
---
 ...reamer1.0-python_1.26.7.bb => gstreamer1.0-python_1.26.9.bb} | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)
 rename meta/recipes-multimedia/gstreamer/{gstreamer1.0-python_1.26.7.bb => gstreamer1.0-python_1.26.9.bb} (91%)

diff --git a/meta/recipes-multimedia/gstreamer/gstreamer1.0-python_1.26.7.bb b/meta/recipes-multimedia/gstreamer/gstreamer1.0-python_1.26.9.bb
similarity index 91%
rename from meta/recipes-multimedia/gstreamer/gstreamer1.0-python_1.26.7.bb
rename to meta/recipes-multimedia/gstreamer/gstreamer1.0-python_1.26.9.bb
index 9a3a86fcbb..57ddf0bbba 100644
--- a/meta/recipes-multimedia/gstreamer/gstreamer1.0-python_1.26.7.bb
+++ b/meta/recipes-multimedia/gstreamer/gstreamer1.0-python_1.26.9.bb
@@ -8,7 +8,7 @@ LICENSE = "LGPL-2.1-or-later"
 LIC_FILES_CHKSUM = "file://COPYING;md5=c34deae4e395ca07e725ab0076a5f740"
 
 SRC_URI = "https://gstreamer.freedesktop.org/src/${PNREAL}/${PNREAL}-${PV}.tar.xz"
-SRC_URI[sha256sum] = "7a544b7968b181c2965e979f2ce889db36397790de9a7c312cf468b51d26428c"
+SRC_URI[sha256sum] = "21a51d35fd973af1186795d3d9d696f321584aeb09ab4d176b59f26e842b8849"
 
 DEPENDS = "gstreamer1.0 gstreamer1.0-plugins-base python3-pygobject gstreamer1.0-plugins-bad"
 RDEPENDS:${PN} += "gstreamer1.0 gstreamer1.0-plugins-base python3-pygobject"
-- 
2.43.0


