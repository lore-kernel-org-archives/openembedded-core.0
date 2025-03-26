Return-Path: <leimaohui@fujitsu.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 5676AC36012
	for <webhook@archiver.kernel.org>; Wed, 26 Mar 2025 03:57:45 +0000 (UTC)
Received: from esa8.hc1455-7.c3s2.iphmx.com (esa8.hc1455-7.c3s2.iphmx.com [139.138.61.253])
 by mx.groups.io with SMTP id smtpd.web10.14494.1742961462718719389
 for <openembedded-core@lists.openembedded.org>;
 Tue, 25 Mar 2025 20:57:43 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@fujitsu.com header.s=fj2 header.b=jIh94qxa;
 spf=pass (domain: fujitsu.com, ip: 139.138.61.253, mailfrom: leimaohui@fujitsu.com)
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
  d=fujitsu.com; i=@fujitsu.com; q=dns/txt; s=fj2;
  t=1742961462; x=1774497462;
  h=from:to:cc:subject:date:message-id:in-reply-to:
   references:mime-version:content-transfer-encoding;
  bh=4XMyhrNhjsKFxbAXo8tdVTx2eG1Nw9+isOGrmSjPaWg=;
  b=jIh94qxaVVXCR1nGksO8ZjCxuwnduhgZTxIbytHFe/odj50S5egdXF/R
   9+fG2Hr0dLTxQpGpT050m/3N/mbIkGmfmbgSpUKi0EmQzrdtWHCAlbWNi
   wxv+a168KYUdNt74OsDwwIhyQl/EuKSE6/RButzsa9acxsSEJN0brVYrf
   OT2J468r4+OCDOMDH02B9dwqNE6e3vCG6/fupZJYIXdx0z3hUP1Nph0Vn
   rIf7SYDdMGCmlJyYg8GyxL7mrBy0jSkpqOvrZlc1BQLpZWVDzsNi6mVNY
   ZhWP9HT6n4VxZ/Ya2GO9AuLr/xEENLMfiWesVUmPe0WD5FIV0r6cYfs6e
   A==;
X-CSE-ConnectionGUID: 1q+d/zRVQJueJhQjo1G/TQ==
X-CSE-MsgGUID: MblAm3ipSXueor+/knWnAg==
X-IronPort-AV: E=McAfee;i="6700,10204,11384"; a="182295098"
X-IronPort-AV: E=Sophos;i="6.14,276,1736780400"; 
   d="scan'208";a="182295098"
Received: from unknown (HELO oym-r3.gw.nic.fujitsu.com) ([210.162.30.91])
  by esa8.hc1455-7.c3s2.iphmx.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 26 Mar 2025 12:57:40 +0900
Received: from oym-m3.gw.nic.fujitsu.com (oym-nat-oym-m3.gw.nic.fujitsu.com [192.168.87.60])
	by oym-r3.gw.nic.fujitsu.com (Postfix) with ESMTP id 963C5C2264
	for <openembedded-core@lists.openembedded.org>; Wed, 26 Mar 2025 12:57:38 +0900 (JST)
Received: from edo.cn.fujitsu.com (edo.cn.fujitsu.com [10.167.33.5])
	by oym-m3.gw.nic.fujitsu.com (Postfix) with ESMTP id 554EDD6FE3
	for <openembedded-core@lists.openembedded.org>; Wed, 26 Mar 2025 12:57:38 +0900 (JST)
Received: from G08FNSTD190088.g08.fujitsu.local (unknown [10.167.135.33])
	by edo.cn.fujitsu.com (Postfix) with ESMTP id BA82A1A0078;
	Wed, 26 Mar 2025 11:57:37 +0800 (CST)
From: Lei Maohui <leimaohui@fujitsu.com>
To: Anuj Mittal <anuj.mittal@intel.com>
Cc: openembedded-core@lists.openembedded.org,
	Lei Maohui <leimaohui@fujitsu.com>
Subject: [OE-core] [PATCH 5/7] gtreamer1.0-rtsp-server: upgrade 1.24.12 -> 1.26.0
Date: Wed, 26 Mar 2025 11:56:37 +0800
Message-Id: <20250326035639.1919-5-leimaohui@fujitsu.com>
X-Mailer: git-send-email 2.38.1.windows.1
In-Reply-To: <20250326035639.1919-1-leimaohui@fujitsu.com>
References: <20250326035639.1919-1-leimaohui@fujitsu.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Wed, 26 Mar 2025 03:57:45 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/213628

Signed-off-by: Lei Maohui <leimaohui@fujitsu.com>
---
 ...tsp-server_1.24.12.bb => gstreamer1.0-rtsp-server_1.26.0.bb} | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)
 rename meta/recipes-multimedia/gstreamer/{gstreamer1.0-rtsp-server_1.24.12.bb => gstreamer1.0-rtsp-server_1.26.0.bb} (90%)

diff --git a/meta/recipes-multimedia/gstreamer/gstreamer1.0-rtsp-server_1.24.12.bb b/meta/recipes-multimedia/gstreamer/gstreamer1.0-rtsp-server_1.26.0.bb
similarity index 90%
rename from meta/recipes-multimedia/gstreamer/gstreamer1.0-rtsp-server_1.24.12.bb
rename to meta/recipes-multimedia/gstreamer/gstreamer1.0-rtsp-server_1.26.0.bb
index b23634dcf0..fd801c2c62 100644
--- a/meta/recipes-multimedia/gstreamer/gstreamer1.0-rtsp-server_1.24.12.bb
+++ b/meta/recipes-multimedia/gstreamer/gstreamer1.0-rtsp-server_1.26.0.bb
@@ -10,7 +10,7 @@ PNREAL = "gst-rtsp-server"
 
 SRC_URI = "https://gstreamer.freedesktop.org/src/${PNREAL}/${PNREAL}-${PV}.tar.xz"
 
-SRC_URI[sha256sum] = "a335f73687d2efe22db94348c6893c73b53a2c6bc55ee7a590028ba196ddc623"
+SRC_URI[sha256sum] = "e983c039496e3f75e39696554ce74db4120e2465de17aa1cc37160568e9b40bc"
 
 S = "${WORKDIR}/${PNREAL}-${PV}"
 
-- 
2.43.0


