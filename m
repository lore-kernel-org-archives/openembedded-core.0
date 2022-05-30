Return-Path: <wangmy@fujitsu.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 7CD8AC433F5
	for <webhook@archiver.kernel.org>; Mon, 30 May 2022 06:41:28 +0000 (UTC)
Received: from mail1.bemta32.messagelabs.com (mail1.bemta32.messagelabs.com
 [195.245.230.65])
 by mx.groups.io with SMTP id smtpd.web11.33673.1653892883868729365
 for <openembedded-core@lists.openembedded.org>;
 Sun, 29 May 2022 23:41:25 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@fujitsu.com header.s=170520fj header.b=Qji9/x0P;
 spf=pass (domain: fujitsu.com, ip: 195.245.230.65,
 mailfrom: wangmy@fujitsu.com)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=fujitsu.com;
	s=170520fj; t=1653892882; i=@fujitsu.com;
	bh=BA3Gzkn/dV24xeG6/XMeDELX+XigoRODvHlvuEDyQd4=;
	h=From:To:CC:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type;
	b=Qji9/x0Pahn1/i3/ExS0PdhGNBrlJqt+0z+JxgEqD3fX5+lls+NwzyQ3vYHKRDurn
	 b67p6sgk606jd4UiPg1/smpGuj/Lyfw0EYadNsYR45e7r+FptyDvFrYQnCGVE6pc/+
	 sf5jG7mMz1Svn9SdygwxDMhze1Nyk9e+yU6N182kS+W+8WhEJGGQeRV7VT2uJInecT
	 m5cJ79q4mNIsCN0MB4qmUgpm0aEgSxaWco19wxZ0U/3MuAWmVVl64VEIxQj2P4XOkY
	 nDYG1m4LgO6SbsuDGR9JlxsoEiVyPcTpz+UjEAUJJNOY1J+J7kfXOeQsqK1zIw0Vze
	 swmU2VFdzuNKw==
X-Brightmail-Tracker: H4sIAAAAAAAAA+NgFrrEIsWRWlGSWpSXmKPExsViZ8OxWVcwfUq
  Swa//OhZ3fr5jd2D0OLdxBWMAYxRrZl5SfkUCa8bcSSUF0zkqjq2/wNLAuI69i5GLQ0jgAaPE
  n0+roZwzTBL3j31n62LkBHL2MEr0LWYEsdkE1CSm37rB2sXIwSEioCdx9Z8oSJhZQEXixe8ed
  hBbWMBU4sz3G8wgJSwCqhKNR+NAwrwCThIzT99jBrElBBQkpjx8D2ZzCjhL7Dt8gRlik5PEwn
  ufmSHqBSVOznzCAjFeQuLgixdQvYoSsy83s0DYFRIzZmxjg7DVJK6e28Q8gVFwFpL2WUjaFzA
  yrWK0TCrKTM8oyU3MzNE1NDDQNTQ01TXUNbXUS6zSTdRLLdUtTy0u0TXUSywv1kstLtYrrsxN
  zknRy0st2cQIDN6UYkbrHYwdfT/1DjFKcjApifKeVZ2cJMSXlJ9SmZFYnBFfVJqTWnyIUYaDQ
  0mCNz55SpKQYFFqempFWmYOMJJg0hIcPEoivEsSgNK8xQWJucWZ6RCpU4y6HFevXNnLLMSSl5
  +XKiXOez4RqEgApCijNA9uBCyqLzHKSgnzMjIwMAjxFKQW5WaWoMq/YhTnYFQS5k1JBZrCk5l
  XArfpFdARTEBHcDNNBDmiJBEhJdXAZJZSvGqK5pYClp6ZZasz61eUvFmVf/t5RNS7vAN1Zad8
  87/mRlb/sNnp3yHSwbzXx1jDUVI6Zm3cy7eLdgSFimj0ebsGrwv0bfm2ctWOj7fF1U/zx13J5
  9iryCegKnOgN+rrTc0tM0/6u2xUi9u0vuX7vfInbkqX8j3P+K+XuPp18qoTX2O2Zkm9CH3vyP
  1/guFVi33/ruiI7UnZs+j88g9LGdc7/XhgLPlvTZrCVHtdB+Mt5YccPEx1mRRNZy3QrHS28DA
  L3rS57oDTId1n+5p93s94s0vNZvvMSFW1z2cOmR9yv8R9jHVN3KNJX3YFCgQc2NFcJC/994z8
  X7vQB5O7BL466PSe8EpYKX2oUomlOCPRUIu5qDgRAFn32EtlAwAA
X-Env-Sender: wangmy@fujitsu.com
X-Msg-Ref: server-15.tower-587.messagelabs.com!1653892881!15076!1
X-Originating-IP: [62.60.8.179]
X-SYMC-ESS-Client-Auth: outbound-route-from=pass
X-StarScan-Received: 
X-StarScan-Version: 9.86.7; banners=-,-,-
X-VirusChecked: Checked
Received: (qmail 23743 invoked from network); 30 May 2022 06:41:21 -0000
Received: from unknown (HELO n03ukasimr04.n03.fujitsu.local) (62.60.8.179)
  by server-15.tower-587.messagelabs.com with ECDHE-RSA-AES256-GCM-SHA384
 encrypted SMTP; 30 May 2022 06:41:21 -0000
Received: from n03ukasimr04.n03.fujitsu.local (localhost [127.0.0.1])
	by n03ukasimr04.n03.fujitsu.local (Postfix) with ESMTP id 330C7817
	for <openembedded-core@lists.openembedded.org>;
 Mon, 30 May 2022 07:41:21 +0100 (BST)
Received: from R01UKEXCASM126.r01.fujitsu.local (unknown [10.183.43.178])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-SHA384 (256/256 bits))
	(No client certificate requested)
	by n03ukasimr04.n03.fujitsu.local (Postfix) with ESMTPS id 10FA2812
	for <openembedded-core@lists.openembedded.org>;
 Mon, 30 May 2022 07:41:21 +0100 (BST)
Received: from localhost.localdomain (10.167.225.33) by
 R01UKEXCASM126.r01.fujitsu.local (10.183.43.178) with Microsoft SMTP Server
 (TLS) id 15.0.1497.32; Mon, 30 May 2022 07:41:15 +0100
From: Wang Mingyu <wangmy@fujitsu.com>
To: <openembedded-core@lists.openembedded.org>
CC: Wang Mingyu <wangmy@fujitsu.com>
Subject: [OE-core] [PATCH] repo: upgrade 2.25 -> 2.26
Date: Mon, 30 May 2022 14:40:50 +0800
Message-ID: <1653892850-23554-4-git-send-email-wangmy@fujitsu.com>
X-Mailer: git-send-email 1.8.3.1
In-Reply-To: <1653892850-23554-1-git-send-email-wangmy@fujitsu.com>
References: <1653892850-23554-1-git-send-email-wangmy@fujitsu.com>
MIME-Version: 1.0
Content-Type: text/plain
X-Originating-IP: [10.167.225.33]
X-ClientProxiedBy: G08CNEXCHPEKD09.g08.fujitsu.local (10.167.33.85) To
 R01UKEXCASM126.r01.fujitsu.local (10.183.43.178)
X-Virus-Scanned: ClamAV using ClamSMTP
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Mon, 30 May 2022 06:41:28 -0000
X-Groupsio-URL: 
 https://lists.openembedded.org/g/openembedded-core/message/166269

Signed-off-by: Wang Mingyu <wangmy@fujitsu.com>
---
 meta/recipes-devtools/repo/{repo_2.25.bb => repo_2.26.bb} | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)
 rename meta/recipes-devtools/repo/{repo_2.25.bb => repo_2.26.bb} (95%)

diff --git a/meta/recipes-devtools/repo/repo_2.25.bb b/meta/recipes-devtools/repo/repo_2.26.bb
similarity index 95%
rename from meta/recipes-devtools/repo/repo_2.25.bb
rename to meta/recipes-devtools/repo/repo_2.26.bb
index b7332515c8..ff5b7eb6aa 100644
--- a/meta/recipes-devtools/repo/repo_2.25.bb
+++ b/meta/recipes-devtools/repo/repo_2.26.bb
@@ -12,7 +12,7 @@ LIC_FILES_CHKSUM = "file://LICENSE;md5=3b83ef96387f14655fc854ddc3c6bd57"
 SRC_URI = "git://gerrit.googlesource.com/git-repo.git;protocol=https;branch=main \
            file://0001-python3-shebang.patch \
            "
-SRCREV = "501733c2abb1180679f25b2f78970d73a2f8d413"
+SRCREV = "bdcba7dc36f1c8e6041681eb5b3b5229c93c7c5c"
 
 MIRRORS += "git://gerrit.googlesource.com/git-repo.git git://github.com/GerritCodeReview/git-repo.git"
 
-- 
2.25.1


