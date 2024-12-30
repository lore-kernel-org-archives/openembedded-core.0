Return-Path: <wangmy@fujitsu.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id B6F81E77188
	for <webhook@archiver.kernel.org>; Mon, 30 Dec 2024 07:29:39 +0000 (UTC)
Received: from esa8.hc1455-7.c3s2.iphmx.com (esa8.hc1455-7.c3s2.iphmx.com [139.138.61.253])
 by mx.groups.io with SMTP id smtpd.web11.58970.1735543769111371244
 for <openembedded-core@lists.openembedded.org>;
 Sun, 29 Dec 2024 23:29:29 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@fujitsu.com header.s=fj2 header.b=WB/7ll31;
 spf=pass (domain: fujitsu.com, ip: 139.138.61.253, mailfrom: wangmy@fujitsu.com)
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
  d=fujitsu.com; i=@fujitsu.com; q=dns/txt; s=fj2;
  t=1735543769; x=1767079769;
  h=from:to:cc:subject:date:message-id;
  bh=gvEcqw3Q3pmpZllB96mUZ8AXS8z5TB4CFsiy2gfmyAU=;
  b=WB/7ll31q8725dC91t6tpjFwW9Ez/QrL7JP9X8VO4JKuBZfjTboL2bJP
   wmfv64IXgy5ouCkUywJl93Y5f4fLN4N5aiYpuSOev0OeVwgmi91zQ593N
   3rm8jrKDmk9Q/YOTUD26FckbZqHVVvT0vU9Gm80TuMkCWtEGjLmE/Bnfr
   zdnIKH6OjA8H7kz4qlzRUAya36BoMqod3C8yGf/ano5h+YlwsTbgYEwX+
   JKcvJ9rhyf1V0Q1FWWuZkeOsNNodTcLCwgZ0QflngkNkwkhFdNwepRXmz
   aS+M6XQmZrq48Bl2oKa0GY/UPjZrK8ZtoLzZqcZJfcPgnh97iQuSMTMOH
   w==;
X-CSE-ConnectionGUID: 1YsUH5K1S2uLbaNYf2LvuQ==
X-CSE-MsgGUID: HLFh3GP5S5++T6MXwPMZFQ==
X-IronPort-AV: E=McAfee;i="6700,10204,11299"; a="173278723"
X-IronPort-AV: E=Sophos;i="6.12,275,1728918000"; 
   d="scan'208";a="173278723"
Received: from unknown (HELO yto-r1.gw.nic.fujitsu.com) ([218.44.52.217])
  by esa8.hc1455-7.c3s2.iphmx.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 30 Dec 2024 16:29:26 +0900
Received: from yto-m2.gw.nic.fujitsu.com (yto-nat-yto-m2.gw.nic.fujitsu.com [192.168.83.65])
	by yto-r1.gw.nic.fujitsu.com (Postfix) with ESMTP id 3911BD6AC1
	for <openembedded-core@lists.openembedded.org>; Mon, 30 Dec 2024 16:29:24 +0900 (JST)
Received: from kws-ab3.gw.nic.fujitsu.com (kws-ab3.gw.nic.fujitsu.com [192.51.206.21])
	by yto-m2.gw.nic.fujitsu.com (Postfix) with ESMTP id 02604D5041
	for <openembedded-core@lists.openembedded.org>; Mon, 30 Dec 2024 16:29:24 +0900 (JST)
Received: from edo.cn.fujitsu.com (edo.cn.fujitsu.com [10.167.33.5])
	by kws-ab3.gw.nic.fujitsu.com (Postfix) with ESMTP id 7FB2A20074EB1
	for <openembedded-core@lists.openembedded.org>; Mon, 30 Dec 2024 16:29:23 +0900 (JST)
Received: from localhost.localdomain.localdomain (unknown [10.193.128.200])
	by edo.cn.fujitsu.com (Postfix) with ESMTP id F0D6E1A0003;
	Mon, 30 Dec 2024 15:29:22 +0800 (CST)
From: wangmy@fujitsu.com
To: openembedded-core@lists.openembedded.org
Cc: Wang Mingyu <wangmy@fujitsu.com>
Subject: [OE-core] [PATCH 1/6] bash-completion: upgrade 2.15.0 -> 2.16.0
Date: Mon, 30 Dec 2024 15:29:15 +0800
Message-Id: <1735543760-2456-1-git-send-email-wangmy@fujitsu.com>
X-Mailer: git-send-email 1.8.3.1
X-TM-AS-GCONF: 00
X-TM-AS-Product-Ver: IMSS-9.1.0.1417-9.0.0.1002-28890.005
X-TM-AS-User-Approved-Sender: Yes
X-TMASE-Version: IMSS-9.1.0.1417-9.0.1002-28890.005
X-TMASE-Result: 10--3.905100-10.000000
X-TMASE-MatchedRID: 6e3s/u+cBDSjz0nOeth/yQPZZctd3P4B1cuIRwt/4MiysPB8dBBorXKn
	6DBj/gsEIvrftAIhWmIOYgThO+DmX+DLvvVL3eB4A34KY0g5BTf4qCLIu0mtIKUureAvXLqmo8W
	MkQWv6iV3LAytsQR4e42j49Ftap9ExlblqLlYqXK3b9LO3BYLAIM9pxG2nDrqcNMd4K4kMkWilK
	H4/vloMO1t/MHc3Ft0itgQy+vhPtiTjLaZtiumJhAJ5gj8OcHXSUwbSFezWtn+v9v52ZIoWjoAf
	389xF3XFSk9HhUZnw7OGIWnws4LoyHWPYzouJUy
X-TMASE-SNAP-Result: 1.821001.0001-0-1-22:0,33:0,34:0-0
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Mon, 30 Dec 2024 07:29:39 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/209140

From: Wang Mingyu <wangmy@fujitsu.com>

Signed-off-by: Wang Mingyu <wangmy@fujitsu.com>
---
 .../{bash-completion_2.15.0.bb => bash-completion_2.16.0.bb}    | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)
 rename meta/recipes-support/bash-completion/{bash-completion_2.15.0.bb => bash-completion_2.16.0.bb} (92%)

diff --git a/meta/recipes-support/bash-completion/bash-completion_2.15.0.bb b/meta/recipes-support/bash-completion/bash-completion_2.16.0.bb
similarity index 92%
rename from meta/recipes-support/bash-completion/bash-completion_2.15.0.bb
rename to meta/recipes-support/bash-completion/bash-completion_2.16.0.bb
index 709443c067..d1a8f5e0cc 100644
--- a/meta/recipes-support/bash-completion/bash-completion_2.15.0.bb
+++ b/meta/recipes-support/bash-completion/bash-completion_2.16.0.bb
@@ -14,7 +14,7 @@ SECTION = "console/utils"
 
 SRC_URI = "${GITHUB_BASE_URI}/download/${PV}/${BPN}-${PV}.tar.xz"
 
-SRC_URI[sha256sum] = "976a62ee6226970283cda85ecb9c7a4a88f62574c0a6f9e856126976decf1a06"
+SRC_URI[sha256sum] = "3369bd5e418a75fb990863925aed5b420398acebb320ec4c0306b3eae23f107a"
 GITHUB_BASE_URI = "https://github.com/scop/bash-completion/releases"
 
 PARALLEL_MAKE = ""
-- 
2.43.0


