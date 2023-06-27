Return-Path: <wangmy@fujitsu.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 917F4C00528
	for <webhook@archiver.kernel.org>; Tue, 27 Jun 2023 07:19:45 +0000 (UTC)
Received: from esa7.hc1455-7.c3s2.iphmx.com (esa7.hc1455-7.c3s2.iphmx.com [139.138.61.252])
 by mx.groups.io with SMTP id smtpd.web10.7580.1687850377078420346
 for <openembedded-core@lists.openembedded.org>;
 Tue, 27 Jun 2023 00:19:37 -0700
Authentication-Results: mx.groups.io;
 dkim=missing; spf=pass (domain: fujitsu.com, ip: 139.138.61.252, mailfrom: wangmy@fujitsu.com)
X-IronPort-AV: E=McAfee;i="6600,9927,10753"; a="101083433"
X-IronPort-AV: E=Sophos;i="6.01,161,1684767600"; 
   d="scan'208";a="101083433"
Received: from unknown (HELO oym-r4.gw.nic.fujitsu.com) ([210.162.30.92])
  by esa7.hc1455-7.c3s2.iphmx.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 27 Jun 2023 16:19:34 +0900
Received: from oym-m1.gw.nic.fujitsu.com (oym-nat-oym-m1.gw.nic.fujitsu.com [192.168.87.58])
	by oym-r4.gw.nic.fujitsu.com (Postfix) with ESMTP id A55EBDDC66
	for <openembedded-core@lists.openembedded.org>; Tue, 27 Jun 2023 16:19:32 +0900 (JST)
Received: from kws-ab4.gw.nic.fujitsu.com (kws-ab4.gw.nic.fujitsu.com [192.51.206.22])
	by oym-m1.gw.nic.fujitsu.com (Postfix) with ESMTP id CC2A4D501D
	for <openembedded-core@lists.openembedded.org>; Tue, 27 Jun 2023 16:19:31 +0900 (JST)
Received: from localhost.localdomain (unknown [10.167.225.33])
	by kws-ab4.gw.nic.fujitsu.com (Postfix) with ESMTP id 4812240B4D;
	Tue, 27 Jun 2023 16:19:31 +0900 (JST)
From: wangmy@fujitsu.com
To: openembedded-core@lists.openembedded.org
Cc: Wang Mingyu <wangmy@fujitsu.com>
Subject: [OE-core] [PATCH] python3-hypothesis: upgrade 6.75.7 -> 6.79.2
Date: Tue, 27 Jun 2023 15:17:18 +0800
Message-Id: <1687850250-20040-21-git-send-email-wangmy@fujitsu.com>
X-Mailer: git-send-email 1.8.3.1
In-Reply-To: <1687850250-20040-1-git-send-email-wangmy@fujitsu.com>
References: <1687850250-20040-1-git-send-email-wangmy@fujitsu.com>
X-TM-AS-GCONF: 00
X-TM-AS-Product-Ver: IMSS-9.1.0.1417-9.0.0.1002-27716.005
X-TM-AS-User-Approved-Sender: Yes
X-TMASE-Version: IMSS-9.1.0.1417-9.0.1002-27716.005
X-TMASE-Result: 10--0.456400-10.000000
X-TMASE-MatchedRID: 6e3s/u+cBDSjz0nOeth/yUIIxwDaU5mrZG3SCLP7QtI+++3dUGxY376p
	xbTOjavy+7QcRaVoa8nGKIf6hBf7VaGGOyqBK41vEXjPIvKd74DCHpeB2SdtvoFum2PEjqt1o8W
	MkQWv6iV3LAytsQR4e1cppCzPq+1UxlblqLlYqXJ8IfMI6h8nAoMd7WKxG6ftYWGbQWNEgJ/QGP
	i1BgXYsT3aiq2nXNH/MJMpdvDXL/i7fvNXZSNMI+QS6f9EzICcO6IcZa5Rz0f+v9v52ZIoWjoAf
	389xF3XFSk9HhUZnw7OGIWnws4LoyHWPYzouJUy
X-TMASE-SNAP-Result: 1.821001.0001-0-1-22:0,33:0,34:0-0
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Tue, 27 Jun 2023 07:19:45 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/183463

From: Wang Mingyu <wangmy@fujitsu.com>

Changelog:
https://hypothesis.readthedocs.io/en/latest/changes.html

Signed-off-by: Wang Mingyu <wangmy@fujitsu.com>
---
 ...ython3-hypothesis_6.75.7.bb => python3-hypothesis_6.79.2.bb} | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)
 rename meta/recipes-devtools/python/{python3-hypothesis_6.75.7.bb => python3-hypothesis_6.79.2.bb} (91%)

diff --git a/meta/recipes-devtools/python/python3-hypothesis_6.75.7.bb b/meta/recipes-devtools/python/python3-hypothesis_6.79.2.bb
similarity index 91%
rename from meta/recipes-devtools/python/python3-hypothesis_6.75.7.bb
rename to meta/recipes-devtools/python/python3-hypothesis_6.79.2.bb
index dc21bc67c6..c98f10e1ee 100644
--- a/meta/recipes-devtools/python/python3-hypothesis_6.75.7.bb
+++ b/meta/recipes-devtools/python/python3-hypothesis_6.79.2.bb
@@ -13,7 +13,7 @@ SRC_URI += " \
     file://test_rle.py \
     "
 
-SRC_URI[sha256sum] = "a8ef2e0c7d5ebd90043a4ed8f6987de6a2b497b2caf6863364ff41db25971856"
+SRC_URI[sha256sum] = "51fb2259489dc446d3edc04cbc8ebd5848d7d3f238121183bee5449b91f7a8d8"
 
 RDEPENDS:${PN} += " \
     python3-attrs \
-- 
2.34.1


