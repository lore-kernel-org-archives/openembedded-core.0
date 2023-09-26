Return-Path: <wangmy@fujitsu.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 79915E7D25F
	for <webhook@archiver.kernel.org>; Tue, 26 Sep 2023 08:28:20 +0000 (UTC)
Received: from esa11.hc1455-7.c3s2.iphmx.com (esa11.hc1455-7.c3s2.iphmx.com [207.54.90.137])
 by mx.groups.io with SMTP id smtpd.web10.14372.1695716897114681959
 for <openembedded-core@lists.openembedded.org>;
 Tue, 26 Sep 2023 01:28:17 -0700
Authentication-Results: mx.groups.io;
 dkim=none (message not signed); spf=pass (domain: fujitsu.com, ip: 207.54.90.137, mailfrom: wangmy@fujitsu.com)
X-IronPort-AV: E=McAfee;i="6600,9927,10843"; a="113051792"
X-IronPort-AV: E=Sophos;i="6.03,177,1694703600"; 
   d="scan'208";a="113051792"
Received: from unknown (HELO oym-r1.gw.nic.fujitsu.com) ([210.162.30.89])
  by esa11.hc1455-7.c3s2.iphmx.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 26 Sep 2023 17:28:16 +0900
Received: from oym-m1.gw.nic.fujitsu.com (oym-nat-oym-m1.gw.nic.fujitsu.com [192.168.87.58])
	by oym-r1.gw.nic.fujitsu.com (Postfix) with ESMTP id 4BE70D29F1
	for <openembedded-core@lists.openembedded.org>; Tue, 26 Sep 2023 17:28:12 +0900 (JST)
Received: from aks-ab1.gw.nic.fujitsu.com (aks-ab1.gw.nic.fujitsu.com [192.51.207.11])
	by oym-m1.gw.nic.fujitsu.com (Postfix) with ESMTP id 7E7E1D5010
	for <openembedded-core@lists.openembedded.org>; Tue, 26 Sep 2023 17:28:11 +0900 (JST)
Received: from localhost.localdomain (unknown [10.167.225.33])
	by aks-ab1.gw.nic.fujitsu.com (Postfix) with ESMTP id 9AB0C2FC92DF;
	Tue, 26 Sep 2023 17:28:10 +0900 (JST)
From: wangmy@fujitsu.com
To: openembedded-core@lists.openembedded.org
Cc: Wang Mingyu <wangmy@fujitsu.com>
Subject: [OE-core] [PATCH] python3-hypothesis: upgrade 6.84.3 -> 6.86.2
Date: Tue, 26 Sep 2023 16:28:00 +0800
Message-Id: <1695716880-10301-1-git-send-email-wangmy@fujitsu.com>
X-Mailer: git-send-email 1.8.3.1
X-TM-AS-GCONF: 00
X-TM-AS-Product-Ver: IMSS-9.1.0.1408-9.0.0.1002-27898.006
X-TM-AS-User-Approved-Sender: Yes
X-TMASE-Version: IMSS-9.1.0.1408-9.0.1002-27898.006
X-TMASE-Result: 10--2.634200-10.000000
X-TMASE-MatchedRID: xNkyGzs1zQGjz0nOeth/yUIIxwDaU5mryqyllX6UJIsrfoFYrvlA5A0h
	MgLyaDPscST9rCbMyXoa7rkdR+2D4+MoKk3Zz6g+HWRJEfGP5nlr2qJoNIuCjZm3OIVSf4P53rZ
	s+R/rCsk3W9JyBPmCaw7YGloFeMEOKq9drOoruLwRyVsAxhhjrKYuYtu360hTe3NcvuU/AP8XS1
	u6S03wDrxDo/AuvK9ZDipiVCdrzyJtF6/n498MP/LeH1FBnhK0wTlc9CcHMZf6s0mJyOVUvZ6ba
	/D5x6cp4vM1YF6AJbbCCfuIMF6xLSdET58jp62SltTxjX8MAFbIIHX3rb17XHrqtAiCcQU2eo7e
	qzo1DyidFq/MazlRwMjJlB7pmXNSb3XplupnNzWdEmXcNeYBDPM46chgZGpAS7+RMq/2CK6rA4c
	7UV2fQpvi2PQO/FFQiz2ujrPVx9yEIU1NtMkm0Q==
X-TMASE-SNAP-Result: 1.821001.0001-0-1-22:0,33:0,34:0-0
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Tue, 26 Sep 2023 08:28:20 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/188232

From: Wang Mingyu <wangmy@fujitsu.com>

Changelog:
===========
-Hotfix for issue #3747, a bug in explain mode which is so rare that we missed
 it in six months of dogfooding.
-This patch improves the documentation of @example(...).xfail() by adding a
 note about PEP 614, similar to @example(...).via(), and adds a warning when a
 strategy generates a test case which seems identical to one provided by an
 xfailed example.
-This release enables the explain phase by default.
-This patch switches some of our type annotations to use typing.Literal when
 only a few specific values are allowed, such as UUID or IP address versions.
-This release deprecates the old whitelist/blacklist arguments to characters(),
 in favor of include/exclude arguments which more clearly describe their
 effects on the set of characters which can be generated.
-You can use Hypothesis; codemods to automatically upgrade to the new argument names.

Signed-off-by: Wang Mingyu <wangmy@fujitsu.com>
---
 ...ython3-hypothesis_6.84.3.bb => python3-hypothesis_6.86.2.bb} | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)
 rename meta/recipes-devtools/python/{python3-hypothesis_6.84.3.bb => python3-hypothesis_6.86.2.bb} (91%)

diff --git a/meta/recipes-devtools/python/python3-hypothesis_6.84.3.bb b/meta/recipes-devtools/python/python3-hypothesis_6.86.2.bb
similarity index 91%
rename from meta/recipes-devtools/python/python3-hypothesis_6.84.3.bb
rename to meta/recipes-devtools/python/python3-hypothesis_6.86.2.bb
index 21b0f65a8e..6ec1457e46 100644
--- a/meta/recipes-devtools/python/python3-hypothesis_6.84.3.bb
+++ b/meta/recipes-devtools/python/python3-hypothesis_6.86.2.bb
@@ -13,7 +13,7 @@ SRC_URI += " \
     file://test_rle.py \
     "
 
-SRC_URI[sha256sum] = "b4117f4138e81986cf62ad4e1410a021adeaa52e4b0326419da626cd7d3b6250"
+SRC_URI[sha256sum] = "e5d75d70f5a4fc372cddf03ec6141237a0a270ed106aeb2156a4984f06d37b0f"
 
 RDEPENDS:${PN} += " \
     python3-attrs \
-- 
2.34.1


