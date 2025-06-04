Return-Path: <wangmy@fujitsu.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id D7526C61CE7
	for <webhook@archiver.kernel.org>; Wed,  4 Jun 2025 08:45:38 +0000 (UTC)
Received: from esa6.hc1455-7.c3s2.iphmx.com (esa6.hc1455-7.c3s2.iphmx.com [68.232.139.139])
 by mx.groups.io with SMTP id smtpd.web10.11651.1749026737185652181
 for <openembedded-core@lists.openembedded.org>;
 Wed, 04 Jun 2025 01:45:38 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@fujitsu.com header.s=fj2 header.b=WqTb3RZx;
 spf=pass (domain: fujitsu.com, ip: 68.232.139.139, mailfrom: wangmy@fujitsu.com)
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
  d=fujitsu.com; i=@fujitsu.com; q=dns/txt; s=fj2;
  t=1749026738; x=1780562738;
  h=from:to:cc:subject:date:message-id:in-reply-to:
   references:mime-version:content-transfer-encoding;
  bh=0VvNA+5FtwH/xvyjAXQCeiu91dt13Cvh5WTqR5zHev8=;
  b=WqTb3RZxFVhKm+8jJLoRFYe7qtr4UQq1i4Hw63TJ99I0VR3uPhF0to+5
   yC/nSGvyK5mj+f2k70G5DBzrL+ZlFlcURC5YkNmNCKyFtjI5pSt9yMHG7
   z/WAnJmbgT1RJJuUgtUeFKA6OW5H8AIrSobMHyH2lAaWKkqACaBOfZc0x
   viZ3oMx4FijUU1IF7RfNWmFvMX9A5cWyN1TSkHV51YaSQYJ/koeJjff6u
   AFQnoJ0GrgoFQ4owpea7UCUInwQYvyEGfngdlpKEC78Jzs7USDdxfPF8y
   Y+7PDbmKnVPRixAKn6SGKzcrU1vYmkBA6iIFUJI0vN23+5hg8EJ4BWytg
   g==;
X-CSE-ConnectionGUID: SkksunhKRgWAeFkpnH6QpQ==
X-CSE-MsgGUID: OttE2LXmT7KtslDO+cAFgg==
X-IronPort-AV: E=McAfee;i="6700,10204,11453"; a="204701652"
X-IronPort-AV: E=Sophos;i="6.16,208,1744038000"; 
   d="scan'208";a="204701652"
Received: from unknown (HELO oym-r2.gw.nic.fujitsu.com) ([210.162.30.90])
  by esa6.hc1455-7.c3s2.iphmx.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 04 Jun 2025 17:45:36 +0900
Received: from oym-m3.gw.nic.fujitsu.com (oym-nat-oym-m3.gw.nic.fujitsu.com [192.168.87.60])
	by oym-r2.gw.nic.fujitsu.com (Postfix) with ESMTP id 977E2D4C2C
	for <openembedded-core@lists.openembedded.org>; Wed,  4 Jun 2025 17:45:33 +0900 (JST)
Received: from edo.cn.fujitsu.com (edo.cn.fujitsu.com [10.167.33.5])
	by oym-m3.gw.nic.fujitsu.com (Postfix) with ESMTP id 454F4D7527
	for <openembedded-core@lists.openembedded.org>; Wed,  4 Jun 2025 17:45:33 +0900 (JST)
Received: from G08FNSTD200057.g08.fujitsu.local (unknown [10.193.128.200])
	by edo.cn.fujitsu.com (Postfix) with ESMTP id B8AC51A0078;
	Wed,  4 Jun 2025 16:45:32 +0800 (CST)
From: Wang Mingyu < wangmy@fujitsu.com>
To: openembedded-core@lists.openembedded.org
Cc: Wang Mingyu <wangmy@fujitsu.com>
Subject: [OE-core] [PATCH 14/45] gstreamer1.0-rtsp-server: upgrade 1.26.1 -> 1.26.2
Date: Wed,  4 Jun 2025 16:44:52 +0800
Message-ID: <20250604084524.864-14-wangmy@fujitsu.com>
X-Mailer: git-send-email 2.49.0.windows.1
In-Reply-To: <20250604084524.864-1-wangmy@fujitsu.com>
References: <20250604084524.864-1-wangmy@fujitsu.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Wed, 04 Jun 2025 08:45:38 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/217863

From: Wang Mingyu <wangmy@fujitsu.com>

Signed-off-by: Wang Mingyu <wangmy@fujitsu.com>
---
 ...rtsp-server_1.26.1.bb => gstreamer1.0-rtsp-server_1.26.2.bb} | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)
 rename meta/recipes-multimedia/gstreamer/{gstreamer1.0-rtsp-server_1.26.1.bb => gstreamer1.0-rtsp-server_1.26.2.bb} (90%)

diff --git a/meta/recipes-multimedia/gstreamer/gstreamer1.0-rtsp-server_1.26.1.bb b/meta/recipes-multimedia/gstreamer/gstreamer1.0-rtsp-server_1.26.2.bb
similarity index 90%
rename from meta/recipes-multimedia/gstreamer/gstreamer1.0-rtsp-server_1.26.1.bb
rename to meta/recipes-multimedia/gstreamer/gstreamer1.0-rtsp-server_1.26.2.bb
index 76f6dac25d..85b5615550 100644
--- a/meta/recipes-multimedia/gstreamer/gstreamer1.0-rtsp-server_1.26.1.bb
+++ b/meta/recipes-multimedia/gstreamer/gstreamer1.0-rtsp-server_1.26.2.bb
@@ -10,7 +10,7 @@ PNREAL = "gst-rtsp-server"
 
 SRC_URI = "https://gstreamer.freedesktop.org/src/${PNREAL}/${PNREAL}-${PV}.tar.xz"
 
-SRC_URI[sha256sum] = "253fdfec78320c2f67486cd3797a0253c06982c3a8d5160f795b4257fadab301"
+SRC_URI[sha256sum] = "f942b2a499ed6d161222868db0e80de45297b4777ff189c6fb890bde698c2dc3"
 
 S = "${WORKDIR}/${PNREAL}-${PV}"
 
-- 
2.43.0


