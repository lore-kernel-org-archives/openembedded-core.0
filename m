Return-Path: <leimaohui@fujitsu.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id A5BD5C3601C
	for <webhook@archiver.kernel.org>; Wed,  2 Apr 2025 10:34:09 +0000 (UTC)
Received: from esa9.hc1455-7.c3s2.iphmx.com (esa9.hc1455-7.c3s2.iphmx.com [139.138.36.223])
 by mx.groups.io with SMTP id smtpd.web11.4957.1743590041686243437
 for <openembedded-core@lists.openembedded.org>;
 Wed, 02 Apr 2025 03:34:02 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@fujitsu.com header.s=fj2 header.b=HQrX6SqW;
 spf=pass (domain: fujitsu.com, ip: 139.138.36.223, mailfrom: leimaohui@fujitsu.com)
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
  d=fujitsu.com; i=@fujitsu.com; q=dns/txt; s=fj2;
  t=1743590041; x=1775126041;
  h=from:to:cc:subject:date:message-id:in-reply-to:
   references:mime-version:content-transfer-encoding;
  bh=4XMyhrNhjsKFxbAXo8tdVTx2eG1Nw9+isOGrmSjPaWg=;
  b=HQrX6SqWeIqUI6F89wbcWeeImntUummre6enLrEqMGvbsK/CoZoAST8O
   0i07Z1bvgc1+0d+fJ5dZHg2l7bwLCJZ5bbzqpLkJ8xvf7yC6gLb3y+82P
   7UAghD2VC+lAEvN0zdv+4pB2NHS6VxSa3tWSz5B8tC+kJrhZkBasexcVV
   jo+WFkpYxXskg/4X4m3G+wOzxi7w/Gx1eX8Ao7RdOHe7gqko1pDPybWmH
   soPFARQPeHmtJAyquT5NOIuZ0Yxp/9eGLp7EfClWpZov1Ox2e0K/127jQ
   qqQEOKvlDueM9nYWmUDk4AUtenP2GbcG2PzVLnkMNYjK21NgCxZWRVPj7
   A==;
X-CSE-ConnectionGUID: lgL1Dj6ORSWeZShREdW4Gg==
X-CSE-MsgGUID: +LKGf3BQSWmlfF78PT89pA==
X-IronPort-AV: E=McAfee;i="6700,10204,11391"; a="183609729"
X-IronPort-AV: E=Sophos;i="6.14,182,1736780400"; 
   d="scan'208";a="183609729"
Received: from unknown (HELO oym-r3.gw.nic.fujitsu.com) ([210.162.30.91])
  by esa9.hc1455-7.c3s2.iphmx.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 02 Apr 2025 19:33:59 +0900
Received: from oym-m4.gw.nic.fujitsu.com (oym-nat-oym-m4.gw.nic.fujitsu.com [192.168.87.61])
	by oym-r3.gw.nic.fujitsu.com (Postfix) with ESMTP id 7AEB0E9EF8
	for <openembedded-core@lists.openembedded.org>; Wed,  2 Apr 2025 19:33:57 +0900 (JST)
Received: from edo.cn.fujitsu.com (edo.cn.fujitsu.com [10.167.33.5])
	by oym-m4.gw.nic.fujitsu.com (Postfix) with ESMTP id 3A7D34F039
	for <openembedded-core@lists.openembedded.org>; Wed,  2 Apr 2025 19:33:57 +0900 (JST)
Received: from G08FNSTD190088.g08.fujitsu.local (unknown [10.167.135.33])
	by edo.cn.fujitsu.com (Postfix) with ESMTP id 8EB351A009B;
	Wed,  2 Apr 2025 18:33:56 +0800 (CST)
From: Lei Maohui <leimaohui@fujitsu.com>
To: Alexander Kanavin <alex@linutronix.de>,
	Jose Quaresma <quaresma.jose@gmail.com>
Cc: Anuj Mittal <anuj.mittal@intel.com>,
	openembedded-core@lists.openembedded.org,
	Lei Maohui <leimaohui@fujitsu.com>
Subject: [OE-core] [PATCH v5 05/10] gtreamer1.0-rtsp-server: upgrade 1.24.12 -> 1.26.0
Date: Wed,  2 Apr 2025 18:33:42 +0800
Message-Id: <20250402103347.2133-5-leimaohui@fujitsu.com>
X-Mailer: git-send-email 2.38.1.windows.1
In-Reply-To: <20250402103347.2133-1-leimaohui@fujitsu.com>
References: <20250402103347.2133-1-leimaohui@fujitsu.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Wed, 02 Apr 2025 10:34:09 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/214253

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


