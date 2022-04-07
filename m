Return-Path: <xuhuan.fnst@fujitsu.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 6E653C3527C
	for <webhook@archiver.kernel.org>; Thu,  7 Apr 2022 15:41:14 +0000 (UTC)
Received: from mail1.bemta34.messagelabs.com (mail1.bemta34.messagelabs.com
 [195.245.231.3])
 by mx.groups.io with SMTP id smtpd.web10.3390.1649312349605459283
 for <openembedded-core@lists.openembedded.org>;
 Wed, 06 Apr 2022 23:19:10 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@fujitsu.com header.s=170520fj header.b=p+i1DXRy;
 spf=pass (domain: fujitsu.com, ip: 195.245.231.3,
 mailfrom: xuhuan.fnst@fujitsu.com)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=fujitsu.com;
	s=170520fj; t=1649312347; i=@fujitsu.com;
	bh=0oa6RdqNHzSNMHZ+ZnVpjyx47IR/2k0Ht0fel069Fs0=;
	h=From:To:CC:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type;
	b=p+i1DXRyHRIrG4gsZA7HYUM84FHPv6X1l4Qy4l2k/+/hkhKo4xCrT5bRnAWAds+yg
	 n81wcLedu1iL2rA3FJwBICNtIQbVaWQjWs6JNcSZzUyda2af84T5ZUZntnWyfNx8hY
	 f15EbmNByO1wGoKvrFLlKB9SAoiRnzqL/yYnMmYr9UPP9/JFTjEnezE34H0oSOBGmH
	 3vzynij1x68y4+f1D6LsEh7sZZWmwsOebMkhy2CqpipX+BmgOguOVkMFDVtnGEmxc5
	 oGbq7CVBCCdhzq5GL/Ama6ecQKJ264/cyGHjsVRhCcOg4Tytu0C7JgZ13s2aB7VI8w
	 c/ybewGQefvKQ==
X-Brightmail-Tracker: H4sIAAAAAAAAA+NgFjrNIsWRWlGSWpSXmKPExsViZ8MxSTe6yS/
  JoPsMn8Wdn+/YHRg9zm1cwRjAGMWamZeUX5HAmrHg9zWWgg1cFb/WTGVuYFzD2cXIxSEk8JhR
  omHyfyYI5zyTxIx7GxghnBOMEn8WrAXKcHKwCahLPL75GijBwSEioCdx9Z8oSJhZQFWi++Iad
  hBbWMBBorNtGwuIzSKgIrF50UmwVl4Bd4nmk+8ZQWwJAQWJKQ/fM4PYnAIeEjN+N4H1CgHVrL
  nfwwZRLyhxcuYTFoj5EhIHX7xghuhVkjix4iMThF0h8frwJai4msTVc5uYJzAKzkLSPgtJ+wJ
  GplWM1klFmekZJbmJmTm6hgYGuoaGprrGFrqGJgZ6iVW6iXqppbrlqcUlukZ6ieXFeqnFxXrF
  lbnJOSl6eaklmxiBYZxSrNazg/HEqp96hxglOZiURHlZ6/yShPiS8lMqMxKLM+KLSnNSiw8xy
  nBwKEnwHmoAygkWpaanVqRl5gBjCiYtwcGjJMKrDJLmLS5IzC3OTIdInWJUlBLn/QaSEABJZJ
  TmwbXB4vgSo6yUMC8jAwODEE9BalFuZgmq/CtGcQ5GJWHePSBTeDLzSuCmvwJazAS0uO6gL8j
  ikkSElFQD04ykrzk+05qct4bVr7eX+rs6TGXd8oo9XwIkLaY66n5dZfj+jOLJVzyN2d+fCK/c
  clrmgMED1iUs7PEfbnTJL7nq9/N2jcu7D8/rDb/fC3lexf30LtP7a/9tSrdNSrnK9uwn6/8li
  9jesW88omQ/eeF8VZfWDW/5Jsz3ubNFeabf0zBu1ucRBcp+wv/8i384iJZ9F/Jzi5ar/nt9Ud
  bBoCDL2XdaezJrs89WBFeXbKwxu375ykSPkscMC/ZyyldpFR3q3pQ/S26XW/pV0cPLLrSUb12
  3S/R3tcnJJtGQ8xt//2ROPvru0KOnH+c1ffpqd+z8jjiXqyqdS96/tz72wzwvK9dgz4w1C86J
  C/SukApXYinOSDTUYi4qTgQAnE1Fel4DAAA=
X-Env-Sender: xuhuan.fnst@fujitsu.com
X-Msg-Ref: server-7.tower-548.messagelabs.com!1649312347!1580!1
X-Originating-IP: [62.60.8.146]
X-SYMC-ESS-Client-Auth: outbound-route-from=pass
X-StarScan-Received: 
X-StarScan-Version: 9.85.5; banners=-,-,-
X-VirusChecked: Checked
Received: (qmail 15520 invoked from network); 7 Apr 2022 06:19:07 -0000
Received: from unknown (HELO n03ukasimr02.n03.fujitsu.local) (62.60.8.146)
  by server-7.tower-548.messagelabs.com with ECDHE-RSA-AES256-GCM-SHA384
 encrypted SMTP; 7 Apr 2022 06:19:07 -0000
Received: from n03ukasimr02.n03.fujitsu.local (localhost [127.0.0.1])
	by n03ukasimr02.n03.fujitsu.local (Postfix) with ESMTP id CBA7810046B
	for <openembedded-core@lists.openembedded.org>;
 Thu,  7 Apr 2022 07:19:06 +0100 (BST)
Received: from R01UKEXCASM126.r01.fujitsu.local (unknown [10.183.43.178])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-SHA384 (256/256 bits))
	(No client certificate requested)
	by n03ukasimr02.n03.fujitsu.local (Postfix) with ESMTPS id BCAFD100465
	for <openembedded-core@lists.openembedded.org>;
 Thu,  7 Apr 2022 07:19:06 +0100 (BST)
Received: from localhost.localdomain.localdomain (10.167.225.131) by
 R01UKEXCASM126.r01.fujitsu.local (10.183.43.178) with Microsoft SMTP Server
 (TLS) id 15.0.1497.32; Thu, 7 Apr 2022 07:18:49 +0100
From: XU Huan <xuhuan.fnst@fujitsu.com>
To: <openembedded-core@lists.openembedded.org>
CC: Xu Huan <xuhuan.fnst@fujitsu.com>
Subject: [OE-core] [PATCH] python3-pip: upgrade 22.0.3 -> 22.0.4
Date: Thu, 7 Apr 2022 14:19:14 +0800
Message-ID: <1649312356-25963-3-git-send-email-xuhuan.fnst@fujitsu.com>
X-Mailer: git-send-email 1.8.3.1
In-Reply-To: <1649312356-25963-1-git-send-email-xuhuan.fnst@fujitsu.com>
References: <1649312356-25963-1-git-send-email-xuhuan.fnst@fujitsu.com>
MIME-Version: 1.0
Content-Type: text/plain
X-Originating-IP: [10.167.225.131]
X-ClientProxiedBy: G08CNEXCHPEKD08.g08.fujitsu.local (10.167.33.83) To
 R01UKEXCASM126.r01.fujitsu.local (10.183.43.178)
X-Virus-Scanned: ClamAV using ClamSMTP
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Thu, 07 Apr 2022 15:41:14 -0000
X-Groupsio-URL: 
 https://lists.openembedded.org/g/openembedded-core/message/164098

From: Xu Huan <xuhuan.fnst@fujitsu.com>

Changelog:
=========
- Deprecations and Removals
  Drop the doctype check, that presented a warning for index pages that use
  non-compliant HTML 5.
- Vendored Libraries
  Downgrade distlib to 0.3.3.

Signed-off-by: Xu Huan <xuhuan.fnst@fujitsu.com>
---
 .../python/{python3-pip_22.0.3.bb => python3-pip_22.0.4.bb}     | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)
 rename meta/recipes-devtools/python/{python3-pip_22.0.3.bb => python3-pip_22.0.4.bb} (91%)

diff --git a/meta/recipes-devtools/python/python3-pip_22.0.3.bb b/meta/recipes-devtools/python/python3-pip_22.0.4.bb
similarity index 91%
rename from meta/recipes-devtools/python/python3-pip_22.0.3.bb
rename to meta/recipes-devtools/python/python3-pip_22.0.4.bb
index ee3e578b2c..462d2ce71f 100644
--- a/meta/recipes-devtools/python/python3-pip_22.0.3.bb
+++ b/meta/recipes-devtools/python/python3-pip_22.0.4.bb
@@ -10,7 +10,7 @@ SRC_URI += "file://0001-change-shebang-to-python3.patch"
 SRC_URI += "file://no_shebang_mangling.patch"
 SRC_URI += "file://reproducible.patch"
 
-SRC_URI[sha256sum] = "f29d589df8c8ab99c060e68ad294c4a9ed896624f6368c5349d70aa581b333d0"
+SRC_URI[sha256sum] = "b3a9de2c6ef801e9247d1527a4b16f92f2cc141cd1489f3fffaf6a9e96729764"
 
 do_install:append() {
     rm -f ${D}/${bindir}/pip
-- 
2.25.1


