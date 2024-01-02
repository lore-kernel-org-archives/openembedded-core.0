Return-Path: <wangmy@fujitsu.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id E0185C46CD2
	for <webhook@archiver.kernel.org>; Tue,  2 Jan 2024 07:23:25 +0000 (UTC)
Received: from esa6.hc1455-7.c3s2.iphmx.com (esa6.hc1455-7.c3s2.iphmx.com [68.232.139.139])
 by mx.groups.io with SMTP id smtpd.web11.24427.1704180201748328771
 for <openembedded-core@lists.openembedded.org>;
 Mon, 01 Jan 2024 23:23:22 -0800
Authentication-Results: mx.groups.io;
 dkim=none (message not signed); spf=pass (domain: fujitsu.com, ip: 68.232.139.139, mailfrom: wangmy@fujitsu.com)
X-IronPort-AV: E=McAfee;i="6600,9927,10940"; a="146688186"
X-IronPort-AV: E=Sophos;i="6.04,324,1695654000"; 
   d="scan'208";a="146688186"
Received: from unknown (HELO yto-r1.gw.nic.fujitsu.com) ([218.44.52.217])
  by esa6.hc1455-7.c3s2.iphmx.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 02 Jan 2024 16:23:19 +0900
Received: from yto-m3.gw.nic.fujitsu.com (yto-nat-yto-m3.gw.nic.fujitsu.com [192.168.83.66])
	by yto-r1.gw.nic.fujitsu.com (Postfix) with ESMTP id 4F7D4D66C3
	for <openembedded-core@lists.openembedded.org>; Tue,  2 Jan 2024 16:23:17 +0900 (JST)
Received: from kws-ab4.gw.nic.fujitsu.com (kws-ab4.gw.nic.fujitsu.com [192.51.206.22])
	by yto-m3.gw.nic.fujitsu.com (Postfix) with ESMTP id 90822F92F
	for <openembedded-core@lists.openembedded.org>; Tue,  2 Jan 2024 16:23:16 +0900 (JST)
Received: from edo.cn.fujitsu.com (edo.cn.fujitsu.com [10.167.33.5])
	by kws-ab4.gw.nic.fujitsu.com (Postfix) with ESMTP id 268566BEFF
	for <openembedded-core@lists.openembedded.org>; Tue,  2 Jan 2024 16:23:16 +0900 (JST)
Received: from vm4860.g01.fujitsu.local (unknown [10.193.128.187])
	by edo.cn.fujitsu.com (Postfix) with ESMTP id B358F1A0070;
	Tue,  2 Jan 2024 15:23:15 +0800 (CST)
From: wangmy@fujitsu.com
To: openembedded-core@lists.openembedded.org
Cc: Wang Mingyu <wangmy@fujitsu.com>
Subject: [OE-core] [PATCH] python3-dbusmock: upgrade 0.30.1 -> 0.30.2
Date: Tue,  2 Jan 2024 15:22:43 +0800
Message-Id: <1704180163-8588-1-git-send-email-wangmy@fujitsu.com>
X-Mailer: git-send-email 1.8.3.1
X-TM-AS-GCONF: 00
X-TM-AS-Product-Ver: IMSS-9.1.0.1417-9.0.0.1002-28094.005
X-TM-AS-User-Approved-Sender: Yes
X-TMASE-Version: IMSS-9.1.0.1417-9.0.1002-28094.005
X-TMASE-Result: 10-3.664500-10.000000
X-TMASE-MatchedRID: hsQjHHSArR6jz0nOeth/yUIIxwDaU5mrYdBG+bhhiNSU8ftiyKjZrdMj
	jwb9QfV2CC8aAmGeO6lV00+whwxVQy/7QU2czuUNnVTWWiNp+v9ZD5CwN3C0B8SiwizsgluQ1vZ
	7s3YIVDJ6eUBjjG/BIHk48PxckV+kHxPMjOKY7A+u65UDD0aDgsRB0bsfrpPIcSqbxBgG0w4Hsr
	ZCIlQt4y44nA9xI7LplKtnpAOXW9xXpsGaxK/JXTC8yrIKYvwdt43BXfYRP0oUjqomQP3L4IcGP
	q4CrhZUr4xB1rKkhVeCvqWrFsheUcLe0zBjeZrbFQOP52BRBXJMTsKj18q/fA==
X-TMASE-SNAP-Result: 1.821001.0001-0-1-22:0,33:0,34:0-0
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Tue, 02 Jan 2024 07:23:25 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/193212

From: Wang Mingyu <wangmy@fujitsu.com>

Changelog:
 bluez5: Fix invalid arguments to PairDevice

Signed-off-by: Wang Mingyu <wangmy@fujitsu.com>
---
 .../{python3-dbusmock_0.30.1.bb => python3-dbusmock_0.30.2.bb}  | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)
 rename meta/recipes-devtools/python/{python3-dbusmock_0.30.1.bb => python3-dbusmock_0.30.2.bb} (87%)

diff --git a/meta/recipes-devtools/python/python3-dbusmock_0.30.1.bb b/meta/recipes-devtools/python/python3-dbusmock_0.30.2.bb
similarity index 87%
rename from meta/recipes-devtools/python/python3-dbusmock_0.30.1.bb
rename to meta/recipes-devtools/python/python3-dbusmock_0.30.2.bb
index 7fa1154b57..17438cd756 100644
--- a/meta/recipes-devtools/python/python3-dbusmock_0.30.1.bb
+++ b/meta/recipes-devtools/python/python3-dbusmock_0.30.2.bb
@@ -4,7 +4,7 @@ HOMEPAGE = "https://pypi.org/project/python-dbusmock/"
 LICENSE = "GPL-3.0-only"
 LIC_FILES_CHKSUM = "file://COPYING;md5=e6a600fd5e1d9cbde2d983680233ad02"
 
-SRC_URI[sha256sum] = "aa865e5345aa7626583b83f70e7956c576c24dbc19491ce7fd19281cfef49690"
+SRC_URI[sha256sum] = "1d7b3794af7b280942f7f6cda4d8bb5d17d8c7216000825cf8b43b6af8792d7d"
 
 PYPI_PACKAGE = "python-dbusmock"
 
-- 
2.34.1


