Return-Path: <wangmy@fujitsu.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 3F504C369A8
	for <webhook@archiver.kernel.org>; Tue,  8 Apr 2025 00:52:16 +0000 (UTC)
Received: from esa3.hc1455-7.c3s2.iphmx.com (esa3.hc1455-7.c3s2.iphmx.com [207.54.90.49])
 by mx.groups.io with SMTP id smtpd.web10.64298.1744073530564845291
 for <openembedded-core@lists.openembedded.org>;
 Mon, 07 Apr 2025 17:52:11 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@fujitsu.com header.s=fj2 header.b=m0otRnR1;
 spf=pass (domain: fujitsu.com, ip: 207.54.90.49, mailfrom: wangmy@fujitsu.com)
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
  d=fujitsu.com; i=@fujitsu.com; q=dns/txt; s=fj2;
  t=1744073531; x=1775609531;
  h=from:to:cc:subject:date:message-id:in-reply-to:
   references;
  bh=Et3d6N4XKFU5/Vterzh8PF3lo8AIj8Q161qPM2FP1UM=;
  b=m0otRnR1tKWMZYlm7cGrvVYQOowan3U32qg//IMS3y7RpkvQOu8bkQo/
   sy4Ak2p2J4MirwyQDfdhDEoDyUQOd4wfz5Oa9zaYkYoeY93Ib5uy/AoVe
   gBoBBwU5qqgyDDnUZGS1wEgZYOF/G4XHjhtcbDu4BJ1nFt+7XKM3qGbXE
   ylExzDiWrnYu+fqt/zYrHiN8Rs1HV4phAXGeNiHUQf2aCtYAxuEbBVfpZ
   6wcLps+OsPKdIeCRBE/DKTqKWy9awexsH/RBtGV9Lm3dA/l3NNUb5frDO
   jYOvK+yU3nY/mmO3c3beks8lCdUyFKdTXW5zZ/0AwufscAW1C6xAzqes1
   g==;
X-CSE-ConnectionGUID: b3MZf5dXSUmXF3A7OpYs7w==
X-CSE-MsgGUID: 2V1qDuASTZuIzGY+OM95QA==
X-IronPort-AV: E=McAfee;i="6700,10204,11397"; a="195697817"
X-IronPort-AV: E=Sophos;i="6.15,196,1739804400"; 
   d="scan'208";a="195697817"
Received: from unknown (HELO yto-r4.gw.nic.fujitsu.com) ([218.44.52.220])
  by esa3.hc1455-7.c3s2.iphmx.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 08 Apr 2025 09:52:01 +0900
Received: from yto-m4.gw.nic.fujitsu.com (yto-nat-yto-m4.gw.nic.fujitsu.com [192.168.83.67])
	by yto-r4.gw.nic.fujitsu.com (Postfix) with ESMTP id 56EA5D500F
	for <openembedded-core@lists.openembedded.org>; Tue,  8 Apr 2025 09:51:58 +0900 (JST)
Received: from edo.cn.fujitsu.com (edo.cn.fujitsu.com [10.167.33.5])
	by yto-m4.gw.nic.fujitsu.com (Postfix) with ESMTP id 0FC93D3F1A
	for <openembedded-core@lists.openembedded.org>; Tue,  8 Apr 2025 09:51:58 +0900 (JST)
Received: from localhost.localdomain (unknown [10.193.128.200])
	by edo.cn.fujitsu.com (Postfix) with ESMTP id 274051A00AE;
	Tue,  8 Apr 2025 08:51:57 +0800 (CST)
From: wangmy@fujitsu.com
To: openembedded-core@lists.openembedded.org
Cc: Wang Mingyu <wangmy@fujitsu.com>
Subject: [OE-core] [PATCH 05/15] hwdata: upgrade 0.393 -> 0.394
Date: Tue,  8 Apr 2025 08:51:32 +0800
Message-Id: <1744073502-27695-5-git-send-email-wangmy@fujitsu.com>
X-Mailer: git-send-email 1.8.3.1
In-Reply-To: <1744073502-27695-1-git-send-email-wangmy@fujitsu.com>
References: <1744073502-27695-1-git-send-email-wangmy@fujitsu.com>
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Tue, 08 Apr 2025 00:52:16 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/214491

From: Wang Mingyu <wangmy@fujitsu.com>

Signed-off-by: Wang Mingyu <wangmy@fujitsu.com>
---
 .../recipes-support/hwdata/{hwdata_0.393.bb => hwdata_0.394.bb} | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)
 rename meta/recipes-support/hwdata/{hwdata_0.393.bb => hwdata_0.394.bb} (93%)

diff --git a/meta/recipes-support/hwdata/hwdata_0.393.bb b/meta/recipes-support/hwdata/hwdata_0.394.bb
similarity index 93%
rename from meta/recipes-support/hwdata/hwdata_0.393.bb
rename to meta/recipes-support/hwdata/hwdata_0.394.bb
index 1517a1d35f..a4288eb420 100644
--- a/meta/recipes-support/hwdata/hwdata_0.393.bb
+++ b/meta/recipes-support/hwdata/hwdata_0.394.bb
@@ -8,7 +8,7 @@ LICENSE = "GPL-2.0-or-later | X11"
 LIC_FILES_CHKSUM = "file://LICENSE;md5=1556547711e8246992b999edd9445a57"
 
 SRC_URI = "git://github.com/vcrhonek/${BPN}.git;branch=master;protocol=https"
-SRCREV = "2b7f8370a5b3b1552d8264b8665ed99ddfea0b57"
+SRCREV = "fa1ccf4e4944bdb4110025c5c40e4fee8c8de29b"
 
 S = "${WORKDIR}/git"
 
-- 
2.43.0


