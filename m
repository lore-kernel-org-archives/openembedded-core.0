Return-Path: <wangmy@fujitsu.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 0F890C46CA2
	for <webhook@archiver.kernel.org>; Tue, 19 Dec 2023 07:39:38 +0000 (UTC)
Received: from esa5.hc1455-7.c3s2.iphmx.com (esa5.hc1455-7.c3s2.iphmx.com [68.232.139.130])
 by mx.groups.io with SMTP id smtpd.web10.7518.1702971569762566147
 for <openembedded-core@lists.openembedded.org>;
 Mon, 18 Dec 2023 23:39:30 -0800
Authentication-Results: mx.groups.io;
 dkim=none (message not signed); spf=pass (domain: fujitsu.com, ip: 68.232.139.130, mailfrom: wangmy@fujitsu.com)
X-IronPort-AV: E=McAfee;i="6600,9927,10928"; a="143377588"
X-IronPort-AV: E=Sophos;i="6.04,287,1695654000"; 
   d="scan'208";a="143377588"
Received: from unknown (HELO oym-r2.gw.nic.fujitsu.com) ([210.162.30.90])
  by esa5.hc1455-7.c3s2.iphmx.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 19 Dec 2023 16:39:27 +0900
Received: from oym-m1.gw.nic.fujitsu.com (oym-nat-oym-m1.gw.nic.fujitsu.com [192.168.87.58])
	by oym-r2.gw.nic.fujitsu.com (Postfix) with ESMTP id C2276D7AE7
	for <openembedded-core@lists.openembedded.org>; Tue, 19 Dec 2023 16:39:24 +0900 (JST)
Received: from kws-ab3.gw.nic.fujitsu.com (kws-ab3.gw.nic.fujitsu.com [192.51.206.21])
	by oym-m1.gw.nic.fujitsu.com (Postfix) with ESMTP id 00BCBD88C4
	for <openembedded-core@lists.openembedded.org>; Tue, 19 Dec 2023 16:39:24 +0900 (JST)
Received: from vm4860.g01.fujitsu.local (unknown [10.193.128.165])
	by kws-ab3.gw.nic.fujitsu.com (Postfix) with ESMTP id E62E4200932FE;
	Tue, 19 Dec 2023 16:39:22 +0900 (JST)
From: wangmy@fujitsu.com
To: openembedded-core@lists.openembedded.org
Cc: Wang Mingyu <wangmy@fujitsu.com>
Subject: [OE-core] [PATCH] diffoscope: upgrade 252 -> 253
Date: Tue, 19 Dec 2023 15:39:14 +0800
Message-Id: <1702971554-6255-1-git-send-email-wangmy@fujitsu.com>
X-Mailer: git-send-email 1.8.3.1
X-TM-AS-GCONF: 00
X-TM-AS-Product-Ver: IMSS-9.1.0.1417-9.0.0.1002-28066.005
X-TM-AS-User-Approved-Sender: Yes
X-TMASE-Version: IMSS-9.1.0.1417-9.0.1002-28066.005
X-TMASE-Result: 10--1.064800-10.000000
X-TMASE-MatchedRID: 7cZymtcOvx2jz0nOeth/yUIIxwDaU5mraXmdXF2Ym8fuebKrFNJkRb6p
	xbTOjavy+7QcRaVoa8nGKIf6hBf7VaGGOyqBK41vEXjPIvKd74BV4BnlVId1nZsoi2XrUn/J8m+
	hzBStantdY+ZoWiLImydET58jp62ScboOM7/4Zo2HtmhvyyLD1rWbOZuCNH68sDyrftefA6e1JU
	EhxBrYyW4qjWJr5+Vo599qD4nKRzpc0hgyTeIq+0u+l2VHNcsyS7+RMq/2CK6rA4c7UV2fQpvi2
	PQO/FFQiz2ujrPVx9yEIU1NtMkm0Q==
X-TMASE-SNAP-Result: 1.821001.0001-0-1-22:0,33:0,34:0-0
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Tue, 19 Dec 2023 07:39:38 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/192693

From: Wang Mingyu <wangmy@fujitsu.com>

Changelog:
============
* Improve DOS/MBR extraction by adding support for 7z.
* Process objdump symbol comment filter inputs as the Python "bytes" type
  (and not str).
* Add a missing RequiredToolNotFound import.
* Update copyright years.

Signed-off-by: Wang Mingyu <wangmy@fujitsu.com>
---
 .../diffoscope/{diffoscope_252.bb => diffoscope_253.bb}         | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)
 rename meta/recipes-support/diffoscope/{diffoscope_252.bb => diffoscope_253.bb} (93%)

diff --git a/meta/recipes-support/diffoscope/diffoscope_252.bb b/meta/recipes-support/diffoscope/diffoscope_253.bb
similarity index 93%
rename from meta/recipes-support/diffoscope/diffoscope_252.bb
rename to meta/recipes-support/diffoscope/diffoscope_253.bb
index 86dc85df83..a1fc63efc3 100644
--- a/meta/recipes-support/diffoscope/diffoscope_252.bb
+++ b/meta/recipes-support/diffoscope/diffoscope_253.bb
@@ -12,7 +12,7 @@ PYPI_PACKAGE = "diffoscope"
 
 inherit pypi setuptools3
 
-SRC_URI[sha256sum] = "e268384fa484f3dd8a936da626e6ef1b231dcb286d09a360f37548637f8dd46d"
+SRC_URI[sha256sum] = "ca3d826b691f4998d6de28a016b3555d56a7283b97ad92944ce643ea6e7eb614"
 
 RDEPENDS:${PN} += "\
         binutils \
-- 
2.34.1


