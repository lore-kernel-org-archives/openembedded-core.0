Return-Path: <wangmy@fujitsu.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id EA1F7C76196
	for <webhook@archiver.kernel.org>; Mon, 10 Apr 2023 09:37:48 +0000 (UTC)
Received: from mail1.bemta32.messagelabs.com (mail1.bemta32.messagelabs.com [195.245.230.2])
 by mx.groups.io with SMTP id smtpd.web10.41089.1681119465067330640
 for <openembedded-core@lists.openembedded.org>;
 Mon, 10 Apr 2023 02:37:45 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@fujitsu.com header.s=170520fj header.b=MWU2b2nC;
 spf=pass (domain: fujitsu.com, ip: 195.245.230.2, mailfrom: wangmy@fujitsu.com)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=fujitsu.com;
	s=170520fj; t=1681119463; i=@fujitsu.com;
	bh=cFeyF1Tx4+XaoGwV9p4MrN87/vUQdCC4wYl0Z3+ITI8=;
	h=From:To:CC:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type;
	b=MWU2b2nCsH/wC0LUxkCzus/UfcjbKt8hGNKUZorbcsSclYdecIRXfKcIf3q78QALi
	 uR14SMQ842r5EDvfrOs2mR0/0z5U4jxc5kNiGbK4G8gOGCO+bHougiNoOFTGLQq+MI
	 k8IZKTYLu5V9aguQtuM5bNp+mo9iOxajhORH9haBQBnZmVop2QyfaW6cbEaSe2hcor
	 16PbLCwKWzUfDKuP9gFGPyfkQu6nmQ+Sv0M+NcuUZGhwHB0wqhM6n2jUMZkPDcOoki
	 5x4ake7YA6dIoQsogrAQVKo3mIjg7OhraTcdt0zJ+4jJKA59gHE5drktLfsL6FGuPU
	 6q8SMnmT6i8Kg==
X-Brightmail-Tracker: H4sIAAAAAAAAA+NgFjrKIsWRWlGSWpSXmKPExsViZ8ORqPv0hnG
  KwZkOGYs7P9+xOzB6nNu4gjGAMYo1My8pvyKBNaP95QGmgp8cFbcOfWBpYJzM0cXIxSEk8JhR
  om/5L2YI5xqTxNSZG1khnD2MErtm3GbvYuTkYBOQkrhx/z9bFyMHh4iAnsTVf6IgYWYBFYkXv
  3vASoQF3CUWNb1lAbFZBFQlnu37wgpi8wo4Sdy63cIMYksIKEhMefgezOYUcJboamhkA7GFgG
  o6Dt5kgqgXlDg58wkLxHwJiYMvXkD1KkrMvtzMAmFXSDROP8QEYatJXD23iXkCo+AsJO2zkLQ
  vYGRaxWhanFpUllqka6mXVJSZnlGSm5iZo5dYpZuol1qqW55aXKJrqJdYXqyXWlysV1yZm5yT
  opeXWrKJERi6KcWsTjsYj/f91TvEKMnBpCTK28VlnCLEl5SfUpmRWJwRX1Sak1p8iFGGg0NJg
  pfhMlBOsCg1PbUiLTMHGEcwaQkOHiURXolrQGne4oLE3OLMdIjUKUZFKXFejvNACQGQREZpHl
  wbLHYvMcpKCfMyMjAwCPEUpBblZpagyr9iFOdgVBLmPXMRaApPZl4J3PRXQIuZgBZzuRiALC5
  JREhJNTDt2d/Qq2388cYe87yiHBW+/dOfzWwvbz9mZZM83ylo7wZFu4LFwucW93bav1ua/UV0
  b+pb7oenQqRv1TzfN3PfmTt3eTeE7uQ1euEkKru6p1iUUWHSx7kZ/9wENWYcV597wfmYc53Hu
  pX/MsK0xRa8ubbVe/9N/vjDBud4/7bM3pFyTPDf0wUzZHM57T+JML6LsuDfL+bO9Wy1s/fyX0
  aGAe28iWt/32j+G3YpYW7w+T2nuL+v7ApkeBbIqxO/g/2j1NQb/Tp3i5/FzJ2ruSAo6WAJ70y
  TW3U7n/NpTH/kZcbSe2juck2hpf/XbDr1+viPWbv6SkOeLzv6QP5xu9LjQ6/fxgY+szcWXKDR
  scpIR4mlOCPRUIu5qDgRAPCJxd5YAwAA
X-Env-Sender: wangmy@fujitsu.com
X-Msg-Ref: server-12.tower-591.messagelabs.com!1681119461!120049!1
X-Originating-IP: [62.60.8.97]
X-SYMC-ESS-Client-Auth: outbound-route-from=pass
X-StarScan-Received: 
X-StarScan-Version: 9.104.1; banners=-,-,-
X-VirusChecked: Checked
Received: (qmail 2637 invoked from network); 10 Apr 2023 09:37:41 -0000
Received: from unknown (HELO n03ukasimr01.n03.fujitsu.local) (62.60.8.97)
  by server-12.tower-591.messagelabs.com with ECDHE-RSA-AES256-GCM-SHA384 encrypted SMTP; 10 Apr 2023 09:37:41 -0000
Received: from n03ukasimr01.n03.fujitsu.local (localhost [127.0.0.1])
	by n03ukasimr01.n03.fujitsu.local (Postfix) with ESMTP id 182451001B0
	for <openembedded-core@lists.openembedded.org>; Mon, 10 Apr 2023 10:37:41 +0100 (BST)
Received: from R01UKEXCASM121.r01.fujitsu.local (R01UKEXCASM121 [10.183.43.173])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-SHA384 (256/256 bits))
	(No client certificate requested)
	by n03ukasimr01.n03.fujitsu.local (Postfix) with ESMTPS id 0B68A1001A2
	for <openembedded-core@lists.openembedded.org>; Mon, 10 Apr 2023 10:37:41 +0100 (BST)
Received: from localhost.localdomain (10.167.225.33) by
 R01UKEXCASM121.r01.fujitsu.local (10.183.43.173) with Microsoft SMTP Server
 (TLS) id 15.0.1497.42; Mon, 10 Apr 2023 10:37:39 +0100
From: <wangmy@fujitsu.com>
To: <openembedded-core@lists.openembedded.org>
CC: Wang Mingyu <wangmy@fujitsu.com>
Subject: [OE-core] [PATCH] python3-hypothesis: upgrade 6.68.2 -> 6.71.0
Date: Mon, 10 Apr 2023 17:37:18 +0800
Message-ID: <1681119440-25219-3-git-send-email-wangmy@fujitsu.com>
X-Mailer: git-send-email 1.8.3.1
In-Reply-To: <1681119440-25219-1-git-send-email-wangmy@fujitsu.com>
References: <1681119440-25219-1-git-send-email-wangmy@fujitsu.com>
MIME-Version: 1.0
Content-Type: text/plain
X-Originating-IP: [10.167.225.33]
X-ClientProxiedBy: G08CNEXCHPEKD07.g08.fujitsu.local (10.167.33.80) To
 R01UKEXCASM121.r01.fujitsu.local (10.183.43.173)
X-Virus-Scanned: ClamAV using ClamSMTP
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Mon, 10 Apr 2023 09:37:48 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/179875

From: Wang Mingyu <wangmy@fujitsu.com>

Changelog:
https://hypothesis.readthedocs.io/en/latest/changes.html

Signed-off-by: Wang Mingyu <wangmy@fujitsu.com>
---
 ...ython3-hypothesis_6.68.2.bb => python3-hypothesis_6.71.0.bb} | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)
 rename meta/recipes-devtools/python/{python3-hypothesis_6.68.2.bb => python3-hypothesis_6.71.0.bb} (91%)

diff --git a/meta/recipes-devtools/python/python3-hypothesis_6.68.2.bb b/meta/recipes-devtools/python/python3-hypothesis_6.71.0.bb
similarity index 91%
rename from meta/recipes-devtools/python/python3-hypothesis_6.68.2.bb
rename to meta/recipes-devtools/python/python3-hypothesis_6.71.0.bb
index 4ffe278d78..8ec885fabf 100644
--- a/meta/recipes-devtools/python/python3-hypothesis_6.68.2.bb
+++ b/meta/recipes-devtools/python/python3-hypothesis_6.71.0.bb
@@ -13,7 +13,7 @@ SRC_URI += " \
     file://test_rle.py \
     "
 
-SRC_URI[sha256sum] = "a7eb2b0c9a18560d8197fe35047ceb58e7e8ab7623a3e5a82613f6a2cd71cffa"
+SRC_URI[sha256sum] = "b2c3bbead72189c0bba6e12848b484ceafadb6e872ac31e40013228239366221"
 
 RDEPENDS:${PN} += " \
     python3-attrs \
-- 
2.34.1


