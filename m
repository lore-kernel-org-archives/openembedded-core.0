Return-Path: <wangmy@fujitsu.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id C4626C7EE2F
	for <webhook@archiver.kernel.org>; Thu,  1 Jun 2023 09:04:18 +0000 (UTC)
Received: from esa1.hc1455-7.c3s2.iphmx.com (esa1.hc1455-7.c3s2.iphmx.com [207.54.90.47])
 by mx.groups.io with SMTP id smtpd.web10.26247.1685610245060064069
 for <openembedded-core@lists.openembedded.org>;
 Thu, 01 Jun 2023 02:04:08 -0700
Authentication-Results: mx.groups.io;
 dkim=missing; spf=pass (domain: fujitsu.com, ip: 207.54.90.47, mailfrom: wangmy@fujitsu.com)
X-IronPort-AV: E=McAfee;i="6600,9927,10727"; a="118987839"
X-IronPort-AV: E=Sophos;i="6.00,209,1681138800"; 
   d="scan'208";a="118987839"
Received: from unknown (HELO oym-r4.gw.nic.fujitsu.com) ([210.162.30.92])
  by esa1.hc1455-7.c3s2.iphmx.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 01 Jun 2023 18:04:07 +0900
Received: from oym-m3.gw.nic.fujitsu.com (oym-nat-oym-m3.gw.nic.fujitsu.com [192.168.87.60])
	by oym-r4.gw.nic.fujitsu.com (Postfix) with ESMTP id 2DCF0DDC64
	for <openembedded-core@lists.openembedded.org>; Thu,  1 Jun 2023 18:04:05 +0900 (JST)
Received: from aks-ab2.gw.nic.fujitsu.com (aks-ab2.gw.nic.fujitsu.com [192.51.207.12])
	by oym-m3.gw.nic.fujitsu.com (Postfix) with ESMTP id 6513C156CA
	for <openembedded-core@lists.openembedded.org>; Thu,  1 Jun 2023 18:04:04 +0900 (JST)
Received: from localhost.localdomain (unknown [10.167.225.33])
	by aks-ab2.gw.nic.fujitsu.com (Postfix) with ESMTP id 8358588864;
	Thu,  1 Jun 2023 18:04:03 +0900 (JST)
From: wangmy@fujitsu.com
To: openembedded-core@lists.openembedded.org
Cc: Wang Mingyu <wangmy@fujitsu.com>
Subject: [OE-core] [PATCH] python3-hypothesis: upgrade 6.71.0 -> 6.75.7
Date: Thu,  1 Jun 2023 17:03:30 +0800
Message-Id: <1685610221-29015-24-git-send-email-wangmy@fujitsu.com>
X-Mailer: git-send-email 1.8.3.1
In-Reply-To: <1685610221-29015-1-git-send-email-wangmy@fujitsu.com>
References: <1685610221-29015-1-git-send-email-wangmy@fujitsu.com>
X-TM-AS-GCONF: 00
X-TM-AS-Product-Ver: IMSS-9.1.0.1408-9.0.0.1002-27664.006
X-TM-AS-User-Approved-Sender: Yes
X-TMASE-Version: IMSS-9.1.0.1408-9.0.1002-27664.006
X-TMASE-Result: 10--1.591500-10.000000
X-TMASE-MatchedRID: 6e3s/u+cBDSjz0nOeth/yUIIxwDaU5mrBgA+oehWZhE+++3dUGxY376p
	xbTOjavy+7QcRaVoa8nGKIf6hBf7VaGGOyqBK41vEXjPIvKd74DCHpeB2SdtvoFum2PEjqt1o8W
	MkQWv6iV3LAytsQR4e1cppCzPq+1UxlblqLlYqXLKly+G58QYkShoD+KOV19u2AtX0Awo1a7Hxf
	R9xX2q2rM+Xx1OTH6HMJMpdvDXL/i7fvNXZSNMI+QS6f9EzICcO6IcZa5Rz0f+v9v52ZIoWjoAf
	389xF3XFSk9HhUZnw7OGIWnws4LoyHWPYzouJUy
X-TMASE-SNAP-Result: 1.821001.0001-0-1-22:0,33:0,34:0-0
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Thu, 01 Jun 2023 09:04:18 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/182079

From: Wang Mingyu <wangmy@fujitsu.com>

Changelog:
 https://hypothesis.readthedocs.io/en/latest/changes.html

Signed-off-by: Wang Mingyu <wangmy@fujitsu.com>
---
 ...ython3-hypothesis_6.71.0.bb => python3-hypothesis_6.75.7.bb} | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)
 rename meta/recipes-devtools/python/{python3-hypothesis_6.71.0.bb => python3-hypothesis_6.75.7.bb} (91%)

diff --git a/meta/recipes-devtools/python/python3-hypothesis_6.71.0.bb b/meta/recipes-devtools/python/python3-hypothesis_6.75.7.bb
similarity index 91%
rename from meta/recipes-devtools/python/python3-hypothesis_6.71.0.bb
rename to meta/recipes-devtools/python/python3-hypothesis_6.75.7.bb
index 15f4090c6d..dc21bc67c6 100644
--- a/meta/recipes-devtools/python/python3-hypothesis_6.71.0.bb
+++ b/meta/recipes-devtools/python/python3-hypothesis_6.75.7.bb
@@ -13,7 +13,7 @@ SRC_URI += " \
     file://test_rle.py \
     "
 
-SRC_URI[sha256sum] = "b2c3bbead72189c0bba6e12848b484ceafadb6e872ac31e40013228239366221"
+SRC_URI[sha256sum] = "a8ef2e0c7d5ebd90043a4ed8f6987de6a2b497b2caf6863364ff41db25971856"
 
 RDEPENDS:${PN} += " \
     python3-attrs \
-- 
2.34.1


