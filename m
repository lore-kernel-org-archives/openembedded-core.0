Return-Path: <wangmy@fujitsu.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id E6193C61DB2
	for <webhook@archiver.kernel.org>; Wed,  4 Jun 2025 08:45:38 +0000 (UTC)
Received: from esa6.hc1455-7.c3s2.iphmx.com (esa6.hc1455-7.c3s2.iphmx.com [68.232.139.139])
 by mx.groups.io with SMTP id smtpd.web10.11651.1749026737185652181
 for <openembedded-core@lists.openembedded.org>;
 Wed, 04 Jun 2025 01:45:37 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@fujitsu.com header.s=fj2 header.b=VJFwHHJ0;
 spf=pass (domain: fujitsu.com, ip: 68.232.139.139, mailfrom: wangmy@fujitsu.com)
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
  d=fujitsu.com; i=@fujitsu.com; q=dns/txt; s=fj2;
  t=1749026738; x=1780562738;
  h=from:to:cc:subject:date:message-id:in-reply-to:
   references:mime-version:content-transfer-encoding;
  bh=2ugE72TTQcAeHqb1Zxb3PNwOKaQ9wZHQBFgxrBxZae0=;
  b=VJFwHHJ0cN3n9maPKB9GGc2NviQbIY6qnhKz2Y8oeMOCfjOX2P/PLCH1
   yoLeYa7RlyH2e7RP2JV38oiTzH+Iw6TMHuR36N9nDNd70aaiKyY4puZ/c
   ppZJfVKoxcVrKJejr1u8kfJHHqpkpJj2PAOYBrj0CZALpuvl3nVesProL
   mY29RBdQ093GKMyMpLrJEVkwLuYw2KqpQ7YNEAIw49TBU8kUiroNFBd/c
   yfNT0/qNOemEbUiaNQ3wHe/xsrKXfbQT/89dZ/Km7w4PXIA19Y0oJvNo5
   LqI6Gg90qAzlNtWAEYCezeM5/3aezuKJBj0eoS0zBaj36gWCJMThr4kQ0
   g==;
X-CSE-ConnectionGUID: v8RrguVTRHuYmtXcc71lAQ==
X-CSE-MsgGUID: NDZs7FePRVa2wuP0e+kIFQ==
X-IronPort-AV: E=McAfee;i="6700,10204,11453"; a="204701651"
X-IronPort-AV: E=Sophos;i="6.16,208,1744038000"; 
   d="scan'208";a="204701651"
Received: from unknown (HELO oym-r2.gw.nic.fujitsu.com) ([210.162.30.90])
  by esa6.hc1455-7.c3s2.iphmx.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 04 Jun 2025 17:45:35 +0900
Received: from oym-m3.gw.nic.fujitsu.com (oym-nat-oym-m3.gw.nic.fujitsu.com [192.168.87.60])
	by oym-r2.gw.nic.fujitsu.com (Postfix) with ESMTP id 02D30D4C2C
	for <openembedded-core@lists.openembedded.org>; Wed,  4 Jun 2025 17:45:33 +0900 (JST)
Received: from edo.cn.fujitsu.com (edo.cn.fujitsu.com [10.167.33.5])
	by oym-m3.gw.nic.fujitsu.com (Postfix) with ESMTP id B0A50D7527
	for <openembedded-core@lists.openembedded.org>; Wed,  4 Jun 2025 17:45:32 +0900 (JST)
Received: from G08FNSTD200057.g08.fujitsu.local (unknown [10.193.128.200])
	by edo.cn.fujitsu.com (Postfix) with ESMTP id 5FD981A009A;
	Wed,  4 Jun 2025 16:45:32 +0800 (CST)
From: Wang Mingyu < wangmy@fujitsu.com>
To: openembedded-core@lists.openembedded.org
Cc: Wang Mingyu <wangmy@fujitsu.com>
Subject: [OE-core] [PATCH 13/45] gstreamer1.0-python: upgrade 1.26.1 -> 1.26.2
Date: Wed,  4 Jun 2025 16:44:51 +0800
Message-ID: <20250604084524.864-13-wangmy@fujitsu.com>
X-Mailer: git-send-email 2.49.0.windows.1
In-Reply-To: <20250604084524.864-1-wangmy@fujitsu.com>
References: <20250604084524.864-1-wangmy@fujitsu.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Wed, 04 Jun 2025 08:45:38 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/217861

From: Wang Mingyu <wangmy@fujitsu.com>

Signed-off-by: Wang Mingyu <wangmy@fujitsu.com>
---
 ...reamer1.0-python_1.26.1.bb => gstreamer1.0-python_1.26.2.bb} | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)
 rename meta/recipes-multimedia/gstreamer/{gstreamer1.0-python_1.26.1.bb => gstreamer1.0-python_1.26.2.bb} (91%)

diff --git a/meta/recipes-multimedia/gstreamer/gstreamer1.0-python_1.26.1.bb b/meta/recipes-multimedia/gstreamer/gstreamer1.0-python_1.26.2.bb
similarity index 91%
rename from meta/recipes-multimedia/gstreamer/gstreamer1.0-python_1.26.1.bb
rename to meta/recipes-multimedia/gstreamer/gstreamer1.0-python_1.26.2.bb
index 6afd286d38..50ff21c1ef 100644
--- a/meta/recipes-multimedia/gstreamer/gstreamer1.0-python_1.26.1.bb
+++ b/meta/recipes-multimedia/gstreamer/gstreamer1.0-python_1.26.2.bb
@@ -8,7 +8,7 @@ LICENSE = "LGPL-2.1-or-later"
 LIC_FILES_CHKSUM = "file://COPYING;md5=c34deae4e395ca07e725ab0076a5f740"
 
 SRC_URI = "https://gstreamer.freedesktop.org/src/${PNREAL}/${PNREAL}-${PV}.tar.xz"
-SRC_URI[sha256sum] = "2dce1ecc8a80ce8e0b6f0e0cb3fad3bcd5d65ebe0622ed28eaae97b4559a6a85"
+SRC_URI[sha256sum] = "757ae964c16a542d60708bcb8a67c56c5be83785c0d1c534b9b9366bf676746e"
 
 DEPENDS = "gstreamer1.0 gstreamer1.0-plugins-base python3-pygobject gstreamer1.0-plugins-bad"
 RDEPENDS:${PN} += "gstreamer1.0 gstreamer1.0-plugins-base python3-pygobject"
-- 
2.43.0


