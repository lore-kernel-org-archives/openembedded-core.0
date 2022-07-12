Return-Path: <wangmy@fujitsu.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 005A8C43334
	for <webhook@archiver.kernel.org>; Tue, 12 Jul 2022 07:48:38 +0000 (UTC)
Received: from mail1.bemta37.messagelabs.com (mail1.bemta37.messagelabs.com
 [85.158.142.1])
 by mx.groups.io with SMTP id smtpd.web10.6387.1657612113757717585
 for <openembedded-core@lists.openembedded.org>;
 Tue, 12 Jul 2022 00:48:34 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@fujitsu.com header.s=170520fj header.b=CQzFQdpm;
 spf=pass (domain: fujitsu.com, ip: 85.158.142.1,
 mailfrom: wangmy@fujitsu.com)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=fujitsu.com;
	s=170520fj; t=1657612111; i=@fujitsu.com;
	bh=kXkArBrxrc/EcAYLoVzux8r3OH9n8/g82kp8OtwphMI=;
	h=From:To:CC:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type;
	b=CQzFQdpmsAKuKG/bg6T7UObUGuXpZ52SpIOjsJsFInspPwKb1yIZ0dyhFInxjlIwv
	 W6FsKkVyFTIMpXNljwopuucXj2kNjtrnu+62K8OOFjGGeLDIzYH+1gfb4PPDUe2t40
	 F+vwcjMxF67101aZyH+xe07ffImYSa/D6znmBxJ9agkfJ6OfvZ5dTyAyoHtG+NL4Hm
	 T7WuZglWeWjMZ1gkolPO6b5vWtdX8CNbEqcO2M3Tut0nicWQbAYzY57lczszxESim7
	 KyzgMGbEDYojkgqWLxnUlXYWN5hqieoHkcLP4EAK4SMs6jsdVucwTgRSYC/QYHmmPi
	 LCciVtYXlC2mQ==
X-Brightmail-Tracker: H4sIAAAAAAAAA+NgFrrGIsWRWlGSWpSXmKPExsViZ8MxSddf/Wy
  SwYr//BZ3fr5jd2D0OLdxBWMAYxRrZl5SfkUCa8aLF1MZC65zVcy7dZ21gfEFZxcjF4eQwGNG
  iV8rTrF0MXICOdeYJJY/d4JI7GGU+LTxGBNIgk1ATWL6rRusXYwcHCICehJX/4mChJkFVCRe/
  O5hB7GFBXwkLs75xQxiswioSuya28kCUs4r4CTReSgZJCwhoCAx5eF7sBJOAWeJ5XO6GUFKhI
  BKNu+UAQnzCghKnJz5hAViuoTEwRcvmCFaFSVmX25mgbArJGbM2MYGYatJXD23iXkCo+AsJO2
  zkLQvYGRaxWibVJSZnlGSm5iZo2toYKBraGgKpI10DU2N9RKrdBP1Ukt18/KLSjJ0DfUSy4v1
  UouL9Yorc5NzUvTyUks2MQKDOKU4beYOxi37fukdYpTkYFIS5c2TPpskxJeUn1KZkVicEV9Um
  pNafIhRhoNDSYLXRgUoJ1iUmp5akZaZA4womLQEB4+SCK+JMlCat7ggMbc4Mx0idYpRl2Pm17
  YDzEIsefl5qVLivAKqQEUCIEUZpXlwI2DRfYlRVkqYl5GBgUGIpyC1KDezBFX+FaM4B6OSMO8
  0kCk8mXklcJteAR3BBHSEXOQZkCNKEhFSUg1Myrqdckc6Z9ZN6f74UPtXYd76ricVQWeP/WA7
  7Xu7n6Ph2qlwl5khBWpqB6ZONsh2n8QUvUJs9foD+vcrvbfHn3rMf4htP6vEuuKbhfrZyjMrM
  9PMBKe/1/j+sFzb9aeN/pn/5Wz8PTeyXz/fYOmwVK2zZmaJt9q721qVHYziBWe31C6s086R4t
  ubrC7Dk953Wa8gJ0rW3vzrTm7B7sPNx+PuPEtbni+fW/+XZY9Xhc7x9BP/8vPqY74d8Loy6fK
  1vMWTH9sxKM6p2aZ0+k/qnR+VWvozygKvr54z8/XPuH67nsyL6d49OQyt2ud4NrXXRmrKf113
  tnhxdYmdzCWfN0u2+BZL7l++bS5HuaQSS3FGoqEWc1FxIgBwB2yEaQMAAA==
X-Env-Sender: wangmy@fujitsu.com
X-Msg-Ref: server-15.tower-728.messagelabs.com!1657612110!67261!1
X-Originating-IP: [62.60.8.146]
X-SYMC-ESS-Client-Auth: outbound-route-from=pass
X-StarScan-Received: 
X-StarScan-Version: 9.87.3; banners=-,-,-
X-VirusChecked: Checked
Received: (qmail 4030 invoked from network); 12 Jul 2022 07:48:31 -0000
Received: from unknown (HELO n03ukasimr02.n03.fujitsu.local) (62.60.8.146)
  by server-15.tower-728.messagelabs.com with ECDHE-RSA-AES256-GCM-SHA384
 encrypted SMTP; 12 Jul 2022 07:48:31 -0000
Received: from n03ukasimr02.n03.fujitsu.local (localhost [127.0.0.1])
	by n03ukasimr02.n03.fujitsu.local (Postfix) with ESMTP id AECE4100078
	for <openembedded-core@lists.openembedded.org>;
 Tue, 12 Jul 2022 08:48:30 +0100 (BST)
Received: from R01UKEXCASM126.r01.fujitsu.local (R01UKEXCASM126
 [10.183.43.178])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-SHA384 (256/256 bits))
	(No client certificate requested)
	by n03ukasimr02.n03.fujitsu.local (Postfix) with ESMTPS id A1EA8100077
	for <openembedded-core@lists.openembedded.org>;
 Tue, 12 Jul 2022 08:48:30 +0100 (BST)
Received: from localhost.localdomain (10.167.225.33) by
 R01UKEXCASM126.r01.fujitsu.local (10.183.43.178) with Microsoft SMTP Server
 (TLS) id 15.0.1497.32; Tue, 12 Jul 2022 08:48:29 +0100
From: Wang Mingyu <wangmy@fujitsu.com>
To: <openembedded-core@lists.openembedded.org>
CC: Wang Mingyu <wangmy@fujitsu.com>
Subject: [OE-core] [PATCH] python3-typing-extensions: upgrade 4.2.0 -> 4.3.0
Date: Tue, 12 Jul 2022 15:48:06 +0800
Message-ID: <1657612088-30882-2-git-send-email-wangmy@fujitsu.com>
X-Mailer: git-send-email 1.8.3.1
In-Reply-To: <1657612088-30882-1-git-send-email-wangmy@fujitsu.com>
References: <1657612088-30882-1-git-send-email-wangmy@fujitsu.com>
MIME-Version: 1.0
Content-Type: text/plain
X-Originating-IP: [10.167.225.33]
X-ClientProxiedBy: G08CNEXCHPEKD09.g08.fujitsu.local (10.167.33.85) To
 R01UKEXCASM126.r01.fujitsu.local (10.183.43.178)
X-Virus-Scanned: ClamAV using ClamSMTP
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Tue, 12 Jul 2022 07:48:37 -0000
X-Groupsio-URL: 
 https://lists.openembedded.org/g/openembedded-core/message/167906

Changelog:
=========
- Add typing_extensions.NamedTuple, allowing for generic NamedTuples on Python <3.11
- Adjust typing_extensions.TypedDict to allow for generic TypedDicts on Python <3.11

Signed-off-by: Wang Mingyu <wangmy@fujitsu.com>
---
 ...g-extensions_4.2.0.bb => python3-typing-extensions_4.3.0.bb} | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)
 rename meta/recipes-devtools/python/{python3-typing-extensions_4.2.0.bb => python3-typing-extensions_4.3.0.bb} (80%)

diff --git a/meta/recipes-devtools/python/python3-typing-extensions_4.2.0.bb b/meta/recipes-devtools/python/python3-typing-extensions_4.3.0.bb
similarity index 80%
rename from meta/recipes-devtools/python/python3-typing-extensions_4.2.0.bb
rename to meta/recipes-devtools/python/python3-typing-extensions_4.3.0.bb
index 3aac39b8ef..9638491eb4 100644
--- a/meta/recipes-devtools/python/python3-typing-extensions_4.2.0.bb
+++ b/meta/recipes-devtools/python/python3-typing-extensions_4.3.0.bb
@@ -5,7 +5,7 @@ LIC_FILES_CHKSUM = "file://LICENSE;md5=64fc2b30b67d0a8423c250e0386ed72f"
 # The name on PyPi is slightly different.
 PYPI_PACKAGE = "typing_extensions"
 
-SRC_URI[sha256sum] = "f1c24655a0da0d1b67f07e17a5e6b2a105894e6824b92096378bb3668ef02376"
+SRC_URI[sha256sum] = "e6d2677a32f47fc7eb2795db1dd15c1f34eff616bcaf2cfb5e997f854fa1c4a6"
 
 inherit pypi python_flit_core
 
-- 
2.25.1


