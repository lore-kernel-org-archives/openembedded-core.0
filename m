Return-Path: <wangmy@fujitsu.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id E4474C52CDA
	for <webhook@archiver.kernel.org>; Mon, 29 Jul 2024 01:10:41 +0000 (UTC)
Received: from esa9.hc1455-7.c3s2.iphmx.com (esa9.hc1455-7.c3s2.iphmx.com [139.138.36.223])
 by mx.groups.io with SMTP id smtpd.web10.46596.1722215431402451463
 for <openembedded-core@lists.openembedded.org>;
 Sun, 28 Jul 2024 18:10:34 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@fujitsu.com header.s=fj2 header.b=aF7qBCKY;
 spf=pass (domain: fujitsu.com, ip: 139.138.36.223, mailfrom: wangmy@fujitsu.com)
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
  d=fujitsu.com; i=@fujitsu.com; q=dns/txt; s=fj2;
  t=1722215433; x=1753751433;
  h=from:to:cc:subject:date:message-id:in-reply-to:
   references;
  bh=/e0UqmxmM1qjwXpM6cfs/G8iTTPLpzqkuMCMPAYboyc=;
  b=aF7qBCKY8MvhgMWAXlIrAxEu8TQmgfX3tUfenxcvOrQ3PV6vn0mZZgex
   44myfIauL3eArMHaWh8VhJ5mCGr4IWSEikkUKRocDInqg7s6+MQ+flhos
   ddkLwtNutjMvD1KWR2vNQkSaaktx4rGN1souUrh8LL+nnkMZrA+PnXDCk
   5Ozglm8ijknkDWCOIbhh7rV/6hRzmGxoj2kG7Uk4gp7zYjW4Id0uE1Qr5
   +OBVadQb0CuVn4JRkJRkvuuCoYzzxEfshouAEyh89VHt5615F2t30wXMx
   bVhI2Hchy12D0vR0hqxyFBJ8mlif09gf9ybX8ueppkqW3Vq0YZws/LtSM
   A==;
X-IronPort-AV: E=McAfee;i="6700,10204,11147"; a="157163439"
X-IronPort-AV: E=Sophos;i="6.09,245,1716217200"; 
   d="scan'208";a="157163439"
Received: from unknown (HELO yto-r4.gw.nic.fujitsu.com) ([218.44.52.220])
  by esa9.hc1455-7.c3s2.iphmx.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 29 Jul 2024 10:10:32 +0900
Received: from yto-m3.gw.nic.fujitsu.com (yto-nat-yto-m3.gw.nic.fujitsu.com [192.168.83.66])
	by yto-r4.gw.nic.fujitsu.com (Postfix) with ESMTP id 80DC0C944B
	for <openembedded-core@lists.openembedded.org>; Mon, 29 Jul 2024 10:10:30 +0900 (JST)
Received: from kws-ab3.gw.nic.fujitsu.com (kws-ab3.gw.nic.fujitsu.com [192.51.206.21])
	by yto-m3.gw.nic.fujitsu.com (Postfix) with ESMTP id B65A9F30B
	for <openembedded-core@lists.openembedded.org>; Mon, 29 Jul 2024 10:10:29 +0900 (JST)
Received: from edo.cn.fujitsu.com (edo.cn.fujitsu.com [10.167.33.5])
	by kws-ab3.gw.nic.fujitsu.com (Postfix) with ESMTP id 4E40A20071A1D
	for <openembedded-core@lists.openembedded.org>; Mon, 29 Jul 2024 10:10:29 +0900 (JST)
Received: from vm4860.g01.fujitsu.local (unknown [10.193.161.161])
	by edo.cn.fujitsu.com (Postfix) with ESMTP id 01FEF1A000C;
	Mon, 29 Jul 2024 09:10:28 +0800 (CST)
From: wangmy@fujitsu.com
To: openembedded-core@lists.openembedded.org
Cc: Wang Mingyu <wangmy@fujitsu.com>
Subject: [OE-core] [PATCH 30/33] vulkan-utility-libraries: upgrade 1.3.283.0 -> 1.3.290.0
Date: Mon, 29 Jul 2024 09:10:05 +0800
Message-Id: <1722215408-27541-30-git-send-email-wangmy@fujitsu.com>
X-Mailer: git-send-email 1.8.3.1
In-Reply-To: <1722215408-27541-1-git-send-email-wangmy@fujitsu.com>
References: <1722215408-27541-1-git-send-email-wangmy@fujitsu.com>
X-TM-AS-GCONF: 00
X-TM-AS-Product-Ver: IMSS-9.1.0.1417-9.0.0.1002-28560.004
X-TM-AS-User-Approved-Sender: Yes
X-TMASE-Version: IMSS-9.1.0.1417-9.0.1002-28560.004
X-TMASE-Result: 10-0.787400-10.000000
X-TMASE-MatchedRID: 4E21WKQgrFSjz0nOeth/yQPZZctd3P4BvqnXInMjnrEH8UzOewTxw+79
	DJRUi35pTQ0JkPG287/mn3xyPJAJonBdrspp/GnFuce7gFxhKa3zndiJkHFMhPnGwx36cSE1rBh
	yv2DtHP/i8zVgXoAltuJ5hXsnxp7jC24oEZ6SpSmcfuxsiY4QFHoLW0QJoaSTs3CgODblUVV4kI
	XM/YpovaUPaSEQqSxA0Lanb6zxKTDEZt18k0yuAKFLb7fEcNlNaP5R7GkKfBoo2id16O3ds+x9n
	1XpDqsJmC9SiJioatWbjnu8jwgbwH9jicWwFYB0PpCuffGH9zI=
X-TMASE-SNAP-Result: 1.821001.0001-0-1-22:0,33:0,34:0-0
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Mon, 29 Jul 2024 01:10:41 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/202604

From: Wang Mingyu <wangmy@fujitsu.com>

Signed-off-by: Wang Mingyu <wangmy@fujitsu.com>
---
 ...aries_1.3.283.0.bb => vulkan-utility-libraries_1.3.290.0.bb} | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)
 rename meta/recipes-graphics/vulkan/{vulkan-utility-libraries_1.3.283.0.bb => vulkan-utility-libraries_1.3.290.0.bb} (95%)

diff --git a/meta/recipes-graphics/vulkan/vulkan-utility-libraries_1.3.283.0.bb b/meta/recipes-graphics/vulkan/vulkan-utility-libraries_1.3.290.0.bb
similarity index 95%
rename from meta/recipes-graphics/vulkan/vulkan-utility-libraries_1.3.283.0.bb
rename to meta/recipes-graphics/vulkan/vulkan-utility-libraries_1.3.290.0.bb
index 3274bea8fd..475386069f 100644
--- a/meta/recipes-graphics/vulkan/vulkan-utility-libraries_1.3.283.0.bb
+++ b/meta/recipes-graphics/vulkan/vulkan-utility-libraries_1.3.290.0.bb
@@ -10,7 +10,7 @@ LICENSE = "Apache-2.0"
 LIC_FILES_CHKSUM = "file://LICENSE.md;md5=4ca2d6799091aaa98a8520f1b793939b"
 
 SRC_URI = "git://github.com/KhronosGroup/Vulkan-Utility-Libraries.git;branch=main;protocol=https"
-SRCREV = "ad7f699a7b2b5deb66eb3de19f24aa33597ed65b"
+SRCREV = "5f26cf65a18bc89a8e3d6569c14314b6fdac8d4d"
 
 S = "${WORKDIR}/git"
 
-- 
2.34.1


