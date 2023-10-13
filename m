Return-Path: <wangmy@fujitsu.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id EB3FFCDB47E
	for <webhook@archiver.kernel.org>; Fri, 13 Oct 2023 08:55:28 +0000 (UTC)
Received: from esa4.hc1455-7.c3s2.iphmx.com (esa4.hc1455-7.c3s2.iphmx.com [68.232.139.117])
 by mx.groups.io with SMTP id smtpd.web11.34270.1697187320622719698
 for <openembedded-core@lists.openembedded.org>;
 Fri, 13 Oct 2023 01:55:21 -0700
Authentication-Results: mx.groups.io;
 dkim=none (message not signed); spf=pass (domain: fujitsu.com, ip: 68.232.139.117, mailfrom: wangmy@fujitsu.com)
X-IronPort-AV: E=McAfee;i="6600,9927,10861"; a="136128439"
X-IronPort-AV: E=Sophos;i="6.03,221,1694703600"; 
   d="scan'208";a="136128439"
Received: from unknown (HELO yto-r4.gw.nic.fujitsu.com) ([218.44.52.220])
  by esa4.hc1455-7.c3s2.iphmx.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 13 Oct 2023 17:55:17 +0900
Received: from yto-m4.gw.nic.fujitsu.com (yto-nat-yto-m4.gw.nic.fujitsu.com [192.168.83.67])
	by yto-r4.gw.nic.fujitsu.com (Postfix) with ESMTP id 6F19FCD6DC
	for <openembedded-core@lists.openembedded.org>; Fri, 13 Oct 2023 17:55:15 +0900 (JST)
Received: from kws-ab3.gw.nic.fujitsu.com (kws-ab3.gw.nic.fujitsu.com [192.51.206.21])
	by yto-m4.gw.nic.fujitsu.com (Postfix) with ESMTP id A7E5FE647D
	for <openembedded-core@lists.openembedded.org>; Fri, 13 Oct 2023 17:55:14 +0900 (JST)
Received: from vm4860.g01.fujitsu.local (unknown [10.193.128.52])
	by kws-ab3.gw.nic.fujitsu.com (Postfix) with ESMTP id DC10D20050184;
	Fri, 13 Oct 2023 17:55:13 +0900 (JST)
From: wangmy@fujitsu.com
To: openembedded-core@lists.openembedded.org
Cc: Wang Mingyu <wangmy@fujitsu.com>
Subject: [OE-core] [PATCH] bluez5: upgrade 5.69 -> 5.70
Date: Fri, 13 Oct 2023 16:55:06 +0800
Message-Id: <1697187306-3895-1-git-send-email-wangmy@fujitsu.com>
X-Mailer: git-send-email 1.8.3.1
X-TM-AS-GCONF: 00
X-TM-AS-Product-Ver: IMSS-9.1.0.1417-9.0.0.1002-27932.006
X-TM-AS-User-Approved-Sender: Yes
X-TMASE-Version: IMSS-9.1.0.1417-9.0.1002-27932.006
X-TMASE-Result: 10--1.404400-10.000000
X-TMASE-MatchedRID: 7cZymtcOvx2jz0nOeth/yQPZZctd3P4B1cuIRwt/4MiysPB8dBBorXKn
	6DBj/gsEIvrftAIhWmJwl5T4gkExGworSvYb1VTugvmNrsT46HJV4BnlVId1nZsoi2XrUn/J8m+
	hzBStanvIM9mETCO70ydET58jp62SzBEJOkM4RMvvStceHeTNnjRMsid6tJMl9wXX1QvO1TOrj4
	tVHX6SRz71t/HSSZOscR/QusyLCEYxnss/RI4kHaKSlJLKnPa8S7+RMq/2CK6rA4c7UV2fQpvi2
	PQO/FFQiz2ujrPVx9yEIU1NtMkm0Q==
X-TMASE-SNAP-Result: 1.821001.0001-0-1-22:0,33:0,34:0-0
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Fri, 13 Oct 2023 08:55:28 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/189030

From: Wang Mingyu <wangmy@fujitsu.com>

Signed-off-by: Wang Mingyu <wangmy@fujitsu.com>
---
 .../bluez5/{bluez5_5.69.bb => bluez5_5.70.bb}                   | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)
 rename meta/recipes-connectivity/bluez5/{bluez5_5.69.bb => bluez5_5.70.bb} (94%)

diff --git a/meta/recipes-connectivity/bluez5/bluez5_5.69.bb b/meta/recipes-connectivity/bluez5/bluez5_5.70.bb
similarity index 94%
rename from meta/recipes-connectivity/bluez5/bluez5_5.69.bb
rename to meta/recipes-connectivity/bluez5/bluez5_5.70.bb
index 4673000f60..2e3b782e6e 100644
--- a/meta/recipes-connectivity/bluez5/bluez5_5.69.bb
+++ b/meta/recipes-connectivity/bluez5/bluez5_5.70.bb
@@ -1,6 +1,6 @@
 require bluez5.inc
 
-SRC_URI[sha256sum] = "bc5a35ddc7c72d0d3999a0d7b2175c8b7d57ab670774f8b5b4900ff38a2627fc"
+SRC_URI[sha256sum] = "37e372e916955e144cb882f888e4be40898f10ae3b7c213ddcdd55ee9c009278"
 
 CVE_STATUS[CVE-2020-24490] = "cpe-incorrect: This issue has kernel fixes rather than bluez fixes"
 
-- 
2.34.1


