Return-Path: <wangmy@fujitsu.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 61AC3CCFA1A
	for <webhook@archiver.kernel.org>; Wed,  5 Nov 2025 23:47:51 +0000 (UTC)
Received: from esa10.hc1455-7.c3s2.iphmx.com (esa10.hc1455-7.c3s2.iphmx.com [139.138.36.225])
 by mx.groups.io with SMTP id smtpd.msgproc01-g2.2995.1762386470219049696
 for <openembedded-core@lists.openembedded.org>;
 Wed, 05 Nov 2025 15:47:50 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@fujitsu.com header.s=fj2 header.b=pG40liIG;
 spf=pass (domain: fujitsu.com, ip: 139.138.36.225, mailfrom: wangmy@fujitsu.com)
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
  d=fujitsu.com; i=@fujitsu.com; q=dns/txt; s=fj2;
  t=1762386470; x=1793922470;
  h=from:to:cc:subject:date:message-id:in-reply-to:
   references:mime-version:content-transfer-encoding;
  bh=XZwyK4tphsU3t33trAX4innYcFuZ84s5Y/u8dL3ZViQ=;
  b=pG40liIGPS6ruaz4y6bwHyjevNGocpmQ9iDXy2me4pDnRPGoO0neS31y
   44laKL//AmKPCkkUfjYOO26hrn1Ml84ecrh3k45LzjtCaMtBkGL3QnY9h
   J9yW0o9yH6IrD9piN2ofZa4IOKdKiKE/xfloPgQMAouL1Oo4cxhA0Dgqc
   PUlYQqRTyTfV+YsMRaNHcn4e1DDtSLQ+yh1KH91b0e+DP1eT4a9T8f8gZ
   U4tqPjvhAJMTj0Ti5kHSnBvUjHDeV4KazYUyyhdYTlX8QizGvco4f01Fc
   ejtr/RRF8UJ5z5avTKADvnO0U4yCT/qn8WOHyDKaq+ltV1Gscl0fl3d+T
   Q==;
X-CSE-ConnectionGUID: upvbDD1rTfipXumQIcLe2g==
X-CSE-MsgGUID: zFAHfgXjSrieNFGbBSKh6w==
X-IronPort-AV: E=McAfee;i="6800,10657,11604"; a="205651638"
X-IronPort-AV: E=Sophos;i="6.19,283,1754924400"; 
   d="scan'208";a="205651638"
Received: from unknown (HELO az2uksmgr1.o.css.fujitsu.com) ([52.151.125.19])
  by esa10.hc1455-7.c3s2.iphmx.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 06 Nov 2025 08:47:48 +0900
Received: from az2uksmgm1.o.css.fujitsu.com (unknown [10.151.22.198])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by az2uksmgr1.o.css.fujitsu.com (Postfix) with ESMTPS id BB1131C1C73A
	for <openembedded-core@lists.openembedded.org>; Wed,  5 Nov 2025 23:47:48 +0000 (UTC)
Received: from az2uksmom2.o.css.fujitsu.com (az2uksmom2.o.css.fujitsu.com [10.151.22.203])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by az2uksmgm1.o.css.fujitsu.com (Postfix) with ESMTPS id 74AB78D206B
	for <openembedded-core@lists.openembedded.org>; Wed,  5 Nov 2025 23:47:48 +0000 (UTC)
Received: from G08FNSTD200057.g08.fujitsu.local (unknown [10.167.135.104])
	by az2uksmom2.o.css.fujitsu.com (Postfix) with ESMTP id 1557A14005BB;
	Wed,  5 Nov 2025 23:47:45 +0000 (UTC)
From: Wang Mingyu < wangmy@fujitsu.com>
To: openembedded-core@lists.openembedded.org
Cc: Wang Mingyu <wangmy@fujitsu.com>
Subject: [OE-core] [PATCH 17/29] gstreamer1.0-plugins-bad: upgrade 1.26.5 -> 1.26.7
Date: Thu,  6 Nov 2025 07:47:00 +0800
Message-ID: <20251105234712.446-17-wangmy@fujitsu.com>
X-Mailer: git-send-email 2.49.0.windows.1
In-Reply-To: <20251105234712.446-1-wangmy@fujitsu.com>
References: <20251105234712.446-1-wangmy@fujitsu.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Wed, 05 Nov 2025 23:47:51 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/225947

From: Wang Mingyu <wangmy@fujitsu.com>

Signed-off-by: Wang Mingyu <wangmy@fujitsu.com>
---
 ...plugins-bad_1.26.5.bb => gstreamer1.0-plugins-bad_1.26.7.bb} | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)
 rename meta/recipes-multimedia/gstreamer/{gstreamer1.0-plugins-bad_1.26.5.bb => gstreamer1.0-plugins-bad_1.26.7.bb} (98%)

diff --git a/meta/recipes-multimedia/gstreamer/gstreamer1.0-plugins-bad_1.26.5.bb b/meta/recipes-multimedia/gstreamer/gstreamer1.0-plugins-bad_1.26.7.bb
similarity index 98%
rename from meta/recipes-multimedia/gstreamer/gstreamer1.0-plugins-bad_1.26.5.bb
rename to meta/recipes-multimedia/gstreamer/gstreamer1.0-plugins-bad_1.26.7.bb
index c1d416c2bc..f19979c4b4 100644
--- a/meta/recipes-multimedia/gstreamer/gstreamer1.0-plugins-bad_1.26.5.bb
+++ b/meta/recipes-multimedia/gstreamer/gstreamer1.0-plugins-bad_1.26.7.bb
@@ -10,7 +10,7 @@ SRC_URI = "https://gstreamer.freedesktop.org/src/gst-plugins-bad/gst-plugins-bad
            file://0002-avoid-including-sys-poll.h-directly.patch \
            file://0004-opencv-resolve-missing-opencv-data-dir-in-yocto-buil.patch \
            "
-SRC_URI[sha256sum] = "9890f262f3b2a9564dcb629e9eb697d77b93d1f71897eda1a8170b7dcfe73294"
+SRC_URI[sha256sum] = "a0ab17dddd4c029ecd7a423c30badd5a3c7599ea42707016d1d57545f5723ccf"
 
 S = "${UNPACKDIR}/gst-plugins-bad-${PV}"
 
-- 
2.43.0


