Return-Path: <wangmy@fujitsu.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 03BACCA5535
	for <webhook@archiver.kernel.org>; Wed, 13 Sep 2023 09:45:14 +0000 (UTC)
Received: from esa7.hc1455-7.c3s2.iphmx.com (esa7.hc1455-7.c3s2.iphmx.com [139.138.61.252])
 by mx.groups.io with SMTP id smtpd.web10.7806.1694598311597673241
 for <openembedded-core@lists.openembedded.org>;
 Wed, 13 Sep 2023 02:45:12 -0700
Authentication-Results: mx.groups.io;
 dkim=none (message not signed); spf=pass (domain: fujitsu.com, ip: 139.138.61.252, mailfrom: wangmy@fujitsu.com)
X-IronPort-AV: E=McAfee;i="6600,9927,10831"; a="110820665"
X-IronPort-AV: E=Sophos;i="6.02,142,1688396400"; 
   d="scan'208";a="110820665"
Received: from unknown (HELO oym-r2.gw.nic.fujitsu.com) ([210.162.30.90])
  by esa7.hc1455-7.c3s2.iphmx.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 13 Sep 2023 18:45:09 +0900
Received: from oym-m2.gw.nic.fujitsu.com (oym-nat-oym-m2.gw.nic.fujitsu.com [192.168.87.59])
	by oym-r2.gw.nic.fujitsu.com (Postfix) with ESMTP id 1A673CD7E8
	for <openembedded-core@lists.openembedded.org>; Wed, 13 Sep 2023 18:45:07 +0900 (JST)
Received: from kws-ab4.gw.nic.fujitsu.com (kws-ab4.gw.nic.fujitsu.com [192.51.206.22])
	by oym-m2.gw.nic.fujitsu.com (Postfix) with ESMTP id 1B897BF4AA
	for <openembedded-core@lists.openembedded.org>; Wed, 13 Sep 2023 18:45:06 +0900 (JST)
Received: from localhost.localdomain (unknown [10.167.225.33])
	by kws-ab4.gw.nic.fujitsu.com (Postfix) with ESMTP id 4FD8540A49;
	Wed, 13 Sep 2023 18:45:05 +0900 (JST)
From: wangmy@fujitsu.com
To: openembedded-core@lists.openembedded.org
Cc: Wang Mingyu <wangmy@fujitsu.com>
Subject: [OE-core] [PATCH] wireless-regdb: upgrade 2023.05.03 -> 2023.09.01
Date: Wed, 13 Sep 2023 17:44:56 +0800
Message-Id: <1694598296-22081-1-git-send-email-wangmy@fujitsu.com>
X-Mailer: git-send-email 1.8.3.1
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-TM-AS-GCONF: 00
X-TM-AS-Product-Ver: IMSS-9.1.0.1417-9.0.0.1002-27872.006
X-TM-AS-User-Approved-Sender: Yes
X-TMASE-Version: IMSS-9.1.0.1417-9.0.1002-27872.006
X-TMASE-Result: 10-1.822300-10.000000
X-TMASE-MatchedRID: R9NZgeCyXhKjz0nOeth/yUIIxwDaU5mrbPzTaVUOuuro8w4N7te92r6p
	xbTOjavy+7QcRaVoa8nGKIf6hBf7VRvtxLq45qm9TuctSpiuWyU2ZWOmuJUS2WAN6i+va16u0p9
	DaZRzoN1lFSORUVE4XjWDT4eBJ3QCSId5c1ojSOPdCok3ibXlQX0tCKdnhB581kTfEkyaZdz6C0
	ePs7A07aqzOOiUJy/IeqjO6QB/eKUEl83I2GFuT2U9f85rAVhL6f+4u5rtbu7RQqJTQ5Ce0Tg+d
	9c6UbALk3NHKmL79T7j/a4d/VvHAPIgcUhA2DcasiVHQI/7266+6QVxiAZsda5sicnpScShiWAb
	Bu8T+Gs=
X-TMASE-SNAP-Result: 1.821001.0001-0-1-22:0,33:0,34:0-0
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Wed, 13 Sep 2023 09:45:14 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/187580

From: Wang Mingyu <wangmy@fujitsu.com>

Changelog:
==========
wireless-regdb: update regulatory database based on preceding changes
wireless-regdb: Update regulatory rules for Australia (AU) for June 2023
wireless-regdb: Update regulatory info for Türkiye (TR)
wireless-regdb: Update regulatory rules for Egypt (EG) from March 2022 guidel...
wireless-regdb: Update regulatory rules for Philippines (PH)

Signed-off-by: Wang Mingyu <wangmy@fujitsu.com>
---
 ...ireless-regdb_2023.05.03.bb => wireless-regdb_2023.09.01.bb} | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)
 rename meta/recipes-kernel/wireless-regdb/{wireless-regdb_2023.05.03.bb => wireless-regdb_2023.09.01.bb} (94%)

diff --git a/meta/recipes-kernel/wireless-regdb/wireless-regdb_2023.05.03.bb b/meta/recipes-kernel/wireless-regdb/wireless-regdb_2023.09.01.bb
similarity index 94%
rename from meta/recipes-kernel/wireless-regdb/wireless-regdb_2023.05.03.bb
rename to meta/recipes-kernel/wireless-regdb/wireless-regdb_2023.09.01.bb
index cd3f52fc76..c09600ecbe 100644
--- a/meta/recipes-kernel/wireless-regdb/wireless-regdb_2023.05.03.bb
+++ b/meta/recipes-kernel/wireless-regdb/wireless-regdb_2023.09.01.bb
@@ -5,7 +5,7 @@ LICENSE = "ISC"
 LIC_FILES_CHKSUM = "file://LICENSE;md5=07c4f6dea3845b02a18dc00c8c87699c"
 
 SRC_URI = "https://www.kernel.org/pub/software/network/${BPN}/${BP}.tar.xz"
-SRC_URI[sha256sum] = "f254d08ab3765aeae2b856222e11a95d44aef519a6663877c71ef68fae4c8c12"
+SRC_URI[sha256sum] = "26d4c2a727cc59239b84735aad856b7c7d0b04e30aa5c235c4f7f47f5f053491"
 
 inherit bin_package allarch
 
-- 
2.34.1


