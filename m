Return-Path: <wangmy@fujitsu.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 84AF9CCFA18
	for <webhook@archiver.kernel.org>; Wed,  5 Nov 2025 23:48:11 +0000 (UTC)
Received: from esa12.hc1455-7.c3s2.iphmx.com (esa12.hc1455-7.c3s2.iphmx.com [139.138.37.100])
 by mx.groups.io with SMTP id smtpd.msgproc01-g2.3005.1762386481292584448
 for <openembedded-core@lists.openembedded.org>;
 Wed, 05 Nov 2025 15:48:02 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@fujitsu.com header.s=fj2 header.b=VKt6aMla;
 spf=pass (domain: fujitsu.com, ip: 139.138.37.100, mailfrom: wangmy@fujitsu.com)
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
  d=fujitsu.com; i=@fujitsu.com; q=dns/txt; s=fj2;
  t=1762386482; x=1793922482;
  h=from:to:cc:subject:date:message-id:in-reply-to:
   references:mime-version:content-transfer-encoding;
  bh=kkUl1yOxCxnR4mDNqcxCzB3lo6dmodBtFpF7hCwHj9s=;
  b=VKt6aMlagP7GOrSoxpz5zeM0a2xpXB57NVvlzes5BTq9IxYH9WtCEGxv
   5VojevPPDKFKHUvsU/GEw/eW4izO92KBZ1PX+Ck82PPPf4/HUTyRCK85Q
   Twy/HZMriLsw9sHDcvjZK48HG3Mx5X7FnvoVwlYvHOQjPa7tiv90lp4Hv
   Vxdl7rH6yjJ0bn4omLp8lc77X9lSydylQDXhohxN24AKtHkapEhuytQbL
   aBQO7i7d99EgYHDOrSkU9pjvb+70sdcj0CDO12hyqdZy/Zi50xFE5V68z
   g3fnfV/7dbNsfLvowSNjSzbW4AIe4t4fEODGTRSYaaSgeFkVVXrWFzfVI
   g==;
X-CSE-ConnectionGUID: DQgUokedSMmSf0FGUi7w+A==
X-CSE-MsgGUID: HLnmk9CrRQWwV0e45X0gCQ==
X-IronPort-AV: E=McAfee;i="6800,10657,11604"; a="197192521"
X-IronPort-AV: E=Sophos;i="6.19,283,1754924400"; 
   d="scan'208";a="197192521"
Received: from unknown (HELO az2uksmgr1.o.css.fujitsu.com) ([52.151.125.19])
  by esa12.hc1455-7.c3s2.iphmx.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 06 Nov 2025 08:48:01 +0900
Received: from az2uksmgm3.o.css.fujitsu.com (unknown [10.151.22.200])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by az2uksmgr1.o.css.fujitsu.com (Postfix) with ESMTPS id 989751C03380
	for <openembedded-core@lists.openembedded.org>; Wed,  5 Nov 2025 23:48:01 +0000 (UTC)
Received: from az2uksmom2.o.css.fujitsu.com (az2uksmom2.o.css.fujitsu.com [10.151.22.203])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by az2uksmgm3.o.css.fujitsu.com (Postfix) with ESMTPS id 55601C00755
	for <openembedded-core@lists.openembedded.org>; Wed,  5 Nov 2025 23:48:01 +0000 (UTC)
Received: from G08FNSTD200057.g08.fujitsu.local (unknown [10.167.135.104])
	by az2uksmom2.o.css.fujitsu.com (Postfix) with ESMTP id EA65114005B7;
	Wed,  5 Nov 2025 23:47:58 +0000 (UTC)
From: Wang Mingyu < wangmy@fujitsu.com>
To: openembedded-core@lists.openembedded.org
Cc: Wang Mingyu <wangmy@fujitsu.com>
Subject: [OE-core] [PATCH 24/29] gstreamer1.0-vaapi: upgrade 1.26.5 -> 1.26.7
Date: Thu,  6 Nov 2025 07:47:07 +0800
Message-ID: <20251105234712.446-24-wangmy@fujitsu.com>
X-Mailer: git-send-email 2.49.0.windows.1
In-Reply-To: <20251105234712.446-1-wangmy@fujitsu.com>
References: <20251105234712.446-1-wangmy@fujitsu.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Wed, 05 Nov 2025 23:48:11 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/225954

From: Wang Mingyu <wangmy@fujitsu.com>

Signed-off-by: Wang Mingyu <wangmy@fujitsu.com>
---
 ...streamer1.0-vaapi_1.26.5.bb => gstreamer1.0-vaapi_1.26.7.bb} | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)
 rename meta/recipes-multimedia/gstreamer/{gstreamer1.0-vaapi_1.26.5.bb => gstreamer1.0-vaapi_1.26.7.bb} (95%)

diff --git a/meta/recipes-multimedia/gstreamer/gstreamer1.0-vaapi_1.26.5.bb b/meta/recipes-multimedia/gstreamer/gstreamer1.0-vaapi_1.26.7.bb
similarity index 95%
rename from meta/recipes-multimedia/gstreamer/gstreamer1.0-vaapi_1.26.5.bb
rename to meta/recipes-multimedia/gstreamer/gstreamer1.0-vaapi_1.26.7.bb
index f61125105d..e9515405ce 100644
--- a/meta/recipes-multimedia/gstreamer/gstreamer1.0-vaapi_1.26.5.bb
+++ b/meta/recipes-multimedia/gstreamer/gstreamer1.0-vaapi_1.26.7.bb
@@ -11,7 +11,7 @@ LIC_FILES_CHKSUM = "file://COPYING.LIB;md5=4fbd65380cdd255951079008b364516c"
 
 SRC_URI = "https://gstreamer.freedesktop.org/src/${REALPN}/${REALPN}-${PV}.tar.xz"
 
-SRC_URI[sha256sum] = "b42d44db63f3195a6f33296e1ead32c14d01ef27452b7068f1a2d86624f55ea9"
+SRC_URI[sha256sum] = "4885d4a02bb2f17c2af618879b5e77f1acdcedcba859aabd3b970550e2940a38"
 
 S = "${UNPACKDIR}/${REALPN}-${PV}"
 DEPENDS = "libva gstreamer1.0 gstreamer1.0-plugins-base gstreamer1.0-plugins-bad"
-- 
2.43.0


