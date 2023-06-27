Return-Path: <wangmy@fujitsu.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id B72C5C3DA41
	for <webhook@archiver.kernel.org>; Tue, 27 Jun 2023 07:19:45 +0000 (UTC)
Received: from esa5.hc1455-7.c3s2.iphmx.com (esa5.hc1455-7.c3s2.iphmx.com [68.232.139.130])
 by mx.groups.io with SMTP id smtpd.web10.7583.1687850380515009739
 for <openembedded-core@lists.openembedded.org>;
 Tue, 27 Jun 2023 00:19:41 -0700
Authentication-Results: mx.groups.io;
 dkim=missing; spf=pass (domain: fujitsu.com, ip: 68.232.139.130, mailfrom: wangmy@fujitsu.com)
X-IronPort-AV: E=McAfee;i="6600,9927,10753"; a="121819185"
X-IronPort-AV: E=Sophos;i="6.01,161,1684767600"; 
   d="scan'208";a="121819185"
Received: from unknown (HELO oym-r1.gw.nic.fujitsu.com) ([210.162.30.89])
  by esa5.hc1455-7.c3s2.iphmx.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 27 Jun 2023 16:19:39 +0900
Received: from oym-m1.gw.nic.fujitsu.com (oym-nat-oym-m1.gw.nic.fujitsu.com [192.168.87.58])
	by oym-r1.gw.nic.fujitsu.com (Postfix) with ESMTP id 41299D29E1
	for <openembedded-core@lists.openembedded.org>; Tue, 27 Jun 2023 16:19:36 +0900 (JST)
Received: from kws-ab4.gw.nic.fujitsu.com (kws-ab4.gw.nic.fujitsu.com [192.51.206.22])
	by oym-m1.gw.nic.fujitsu.com (Postfix) with ESMTP id 6EFB9D5018
	for <openembedded-core@lists.openembedded.org>; Tue, 27 Jun 2023 16:19:35 +0900 (JST)
Received: from localhost.localdomain (unknown [10.167.225.33])
	by kws-ab4.gw.nic.fujitsu.com (Postfix) with ESMTP id F3C836C833;
	Tue, 27 Jun 2023 16:19:34 +0900 (JST)
From: wangmy@fujitsu.com
To: openembedded-core@lists.openembedded.org
Cc: Wang Mingyu <wangmy@fujitsu.com>
Subject: [OE-core] [PATCH] python3-pyparsing: upgrade 3.0.9 -> 3.1.0
Date: Tue, 27 Jun 2023 15:17:24 +0800
Message-Id: <1687850250-20040-27-git-send-email-wangmy@fujitsu.com>
X-Mailer: git-send-email 1.8.3.1
In-Reply-To: <1687850250-20040-1-git-send-email-wangmy@fujitsu.com>
References: <1687850250-20040-1-git-send-email-wangmy@fujitsu.com>
X-TM-AS-GCONF: 00
X-TM-AS-Product-Ver: IMSS-9.1.0.1417-9.0.0.1002-27716.005
X-TM-AS-User-Approved-Sender: Yes
X-TMASE-Version: IMSS-9.1.0.1417-9.0.1002-27716.005
X-TMASE-Result: 10-3.915800-10.000000
X-TMASE-MatchedRID: R9NZgeCyXhKjz0nOeth/yUIIxwDaU5mrqLpXV8E1T7ze6dEbvIyrxYTy
	X+o6ri+14CtjYmQpb2kF1Ec/oUIRlVpCIuRr0RxKTuctSpiuWyUUi4Ehat054xHfiujuTbedRtc
	2qGBany6BkESMI05d4g1UuEJlsPFUrWL/xQJnm46eAiCmPx4NwGmRqNBHmBveVDC1CbuJXmMqtq
	5d3cxkNapLXTCFmRxvGjw5pLPhTnk3u5JejbQHj1rkHktppRzZ1fk4FqeAnexbysOBBRoFq07U/
	eh7N2shO/yCIwqcFyIzBGEY6Z7GOPK+uO+faAFZU8mdcvbI1h2S6jzjuXTm0MTMzICazP4UehYt
	aVdyxm8=
X-TMASE-SNAP-Result: 1.821001.0001-0-1-22:0,33:0,34:0-0
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Tue, 27 Jun 2023 07:19:45 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/183469

From: Wang Mingyu <wangmy@fujitsu.com>

Changelog:
==========
- Added 'tag_emitter.py' to examples. This example demonstrates how to insert
  tags into your parsed results that are not part of the original parsed text.

Signed-off-by: Wang Mingyu <wangmy@fujitsu.com>
---
 .../{python3-pyparsing_3.0.9.bb => python3-pyparsing_3.1.0.bb}  | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)
 rename meta/recipes-devtools/python/{python3-pyparsing_3.0.9.bb => python3-pyparsing_3.1.0.bb} (91%)

diff --git a/meta/recipes-devtools/python/python3-pyparsing_3.0.9.bb b/meta/recipes-devtools/python/python3-pyparsing_3.1.0.bb
similarity index 91%
rename from meta/recipes-devtools/python/python3-pyparsing_3.0.9.bb
rename to meta/recipes-devtools/python/python3-pyparsing_3.1.0.bb
index b858073c3b..e5c6d5f832 100644
--- a/meta/recipes-devtools/python/python3-pyparsing_3.0.9.bb
+++ b/meta/recipes-devtools/python/python3-pyparsing_3.1.0.bb
@@ -10,7 +10,7 @@ BUGTRACKER = "https://github.com/pyparsing/pyparsing/issues"
 LICENSE = "MIT"
 LIC_FILES_CHKSUM = "file://LICENSE;md5=657a566233888513e1f07ba13e2f47f1"
 
-SRC_URI[sha256sum] = "2b020ecf7d21b687f219b71ecad3631f644a47f01403fa1d1036b0c6416d70fb"
+SRC_URI[sha256sum] = "edb662d6fe322d6e990b1594b5feaeadf806803359e3d4d42f11e295e588f0ea"
 
 UPSTREAM_CHECK_REGEX = "pyparsing-(?P<pver>.*)\.tar"
 
-- 
2.34.1


