Return-Path: <wangmy@fujitsu.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 6919FC3601E
	for <webhook@archiver.kernel.org>; Thu, 10 Apr 2025 05:41:18 +0000 (UTC)
Received: from esa1.hc1455-7.c3s2.iphmx.com (esa1.hc1455-7.c3s2.iphmx.com [207.54.90.47])
 by mx.groups.io with SMTP id smtpd.web10.27469.1744263676948720453
 for <openembedded-core@lists.openembedded.org>;
 Wed, 09 Apr 2025 22:41:17 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@fujitsu.com header.s=fj2 header.b=Ur3YoFd7;
 spf=pass (domain: fujitsu.com, ip: 207.54.90.47, mailfrom: wangmy@fujitsu.com)
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
  d=fujitsu.com; i=@fujitsu.com; q=dns/txt; s=fj2;
  t=1744263677; x=1775799677;
  h=from:to:cc:subject:date:message-id;
  bh=JIrplY4WtHeDc/Ud1Qoi4WXSUypKbDhqYyNbCgZ5e8w=;
  b=Ur3YoFd7Ltci5sDaCQiFrOZia+qGBI9HdUbRCqxlnpolc+C0O26T5S+r
   Tw0CZQbCXakF50oI0CkCtsU+gfiSV+6LGraj7nSUodNOITenBAKaRkPOb
   QU8HB+pTEGFKsjCLSeZnRqpq6mpMC4MucqpCdZv4m5i4NlVRoJpqNrVhw
   z+C8GA4oR4YD0XSSx3861iZu4kxOmELuF26CpblLG/Nvni/WlibL7n967
   2i3tQE5nVviNjcwaiDZEAcbnSdue7WsZZtJub6+LdBwshOpZbKrJsZvF+
   0u9ZbQCScm0KZfgefbcJtaxP+//O8zb05lb8WsiuaZg0/J/Bnj60lX2ti
   g==;
X-CSE-ConnectionGUID: EcXFWr78RRK4Ec5je5MHtg==
X-CSE-MsgGUID: 4syJnbuKSQy8tI72t5cOtA==
X-IronPort-AV: E=McAfee;i="6700,10204,11399"; a="196043182"
X-IronPort-AV: E=Sophos;i="6.15,202,1739804400"; 
   d="scan'208";a="196043182"
Received: from unknown (HELO oym-r1.gw.nic.fujitsu.com) ([210.162.30.89])
  by esa1.hc1455-7.c3s2.iphmx.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 10 Apr 2025 14:41:15 +0900
Received: from oym-m4.gw.nic.fujitsu.com (oym-nat-oym-m4.gw.nic.fujitsu.com [192.168.87.61])
	by oym-r1.gw.nic.fujitsu.com (Postfix) with ESMTP id AD94DD4807
	for <openembedded-core@lists.openembedded.org>; Thu, 10 Apr 2025 14:41:12 +0900 (JST)
Received: from edo.cn.fujitsu.com (edo.cn.fujitsu.com [10.167.33.5])
	by oym-m4.gw.nic.fujitsu.com (Postfix) with ESMTP id 6BEEAD52B9
	for <openembedded-core@lists.openembedded.org>; Thu, 10 Apr 2025 14:41:12 +0900 (JST)
Received: from localhost.localdomain (unknown [10.193.128.200])
	by edo.cn.fujitsu.com (Postfix) with ESMTP id C1E2F1A0078;
	Thu, 10 Apr 2025 13:41:11 +0800 (CST)
From: wangmy@fujitsu.com
To: openembedded-core@lists.openembedded.org
Cc: Wang Mingyu <wangmy@fujitsu.com>
Subject: [OE-core] [PATCH v3] sbc: upgrade 2.0 -> 2.1
Date: Thu, 10 Apr 2025 13:41:05 +0800
Message-Id: <1744263665-14167-1-git-send-email-wangmy@fujitsu.com>
X-Mailer: git-send-email 1.8.3.1
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Thu, 10 Apr 2025 05:41:18 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/214617

From: Wang Mingyu <wangmy@fujitsu.com>

License-Update: Using SPDX-License-Identifier: LGPL-2.1-or-later to replace the description of license

Signed-off-by: Wang Mingyu <wangmy@fujitsu.com>
---
 meta/recipes-multimedia/sbc/{sbc_2.0.bb => sbc_2.1.bb} | 7 ++++---
 1 file changed, 4 insertions(+), 3 deletions(-)
 rename meta/recipes-multimedia/sbc/{sbc_2.0.bb => sbc_2.1.bb} (66%)

diff --git a/meta/recipes-multimedia/sbc/sbc_2.0.bb b/meta/recipes-multimedia/sbc/sbc_2.1.bb
similarity index 66%
rename from meta/recipes-multimedia/sbc/sbc_2.0.bb
rename to meta/recipes-multimedia/sbc/sbc_2.1.bb
index d25be9e80c..5aaa52313f 100644
--- a/meta/recipes-multimedia/sbc/sbc_2.0.bb
+++ b/meta/recipes-multimedia/sbc/sbc_2.1.bb
@@ -7,14 +7,15 @@ LICENSE:${PN} = "LGPL-2.1-or-later"
 LICENSE:${PN}-examples = "GPL-2.0-or-later"
 LIC_FILES_CHKSUM = "file://COPYING;md5=12f884d2ae1ff87c09e5b7ccc2c4ca7e \
                     file://COPYING.LIB;md5=fb504b67c50331fc78734fed90fb0e09 \
-                    file://src/sbcenc.c;beginline=1;endline=24;md5=08e7a70b127f4100ff2cd7d629147d8d \
-                    file://sbc/sbc.h;beginline=1;endline=26;md5=0f57d0df22b0d40746bdd29805a4361b"
+                    file://src/sbcenc.c;beginline=1;endline=8;md5=cfac6012e2dea914de8b3b7693591622 \
+                    file://sbc/sbc.h;beginline=1;endline=10;md5=bbf642bd99160e4f2a5bbd5d174a8320 \
+                    "
 
 DEPENDS = "libsndfile1"
 
 SRC_URI = "${KERNELORG_MIRROR}/linux/bluetooth/${BP}.tar.xz"
 
-SRC_URI[sha256sum] = "8f12368e1dbbf55e14536520473cfb338c84b392939cc9b64298360fd4a07992"
+SRC_URI[sha256sum] = "426633cabd7c798236443516dfa8335b47e004b0ef37ff107e0c7ead3299fcc2"
 
 inherit autotools pkgconfig
 
-- 
2.43.0


