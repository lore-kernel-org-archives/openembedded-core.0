Return-Path: <wangmy@fujitsu.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id B6EF7C43334
	for <webhook@archiver.kernel.org>; Thu, 30 Jun 2022 04:20:08 +0000 (UTC)
Received: from mail1.bemta37.messagelabs.com (mail1.bemta37.messagelabs.com
 [85.158.142.113])
 by mx.groups.io with SMTP id smtpd.web10.20763.1656562802413591274
 for <openembedded-core@lists.openembedded.org>;
 Wed, 29 Jun 2022 21:20:02 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@fujitsu.com header.s=170520fj header.b=AA8nH0gs;
 spf=pass (domain: fujitsu.com, ip: 85.158.142.113,
 mailfrom: wangmy@fujitsu.com)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=fujitsu.com;
	s=170520fj; t=1656562800; i=@fujitsu.com;
	bh=nSwYye8xYWVvWqtlWtaM6EBdQ1IQM+QqerJ88KENnQs=;
	h=From:To:CC:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type;
	b=AA8nH0gs1TSxKIghCXz3TX0ibAcWQ92lYJhHGm7y1Q2WYBVGOGR6VnY0dvG0zkNeA
	 8L0bZA1mJG4QJUEGG28LGODPrPmI8393262ZbmD1XQtRTwD/ePvuLVtlGvr6RlK7X/
	 aCXdq72bYfXp8kl3/3DEZrMM61Sf4FvwjcA7VyaD/SWK96v6nSiYW6IPkdi3SCoOZk
	 yF3sfzvBxgM3tj5sRS80aKIoxJ56AVjTtCa//y5TZBrP2nhopFcT8f1JdeR2abKlQ8
	 S5rtNSWbRZN6Vt1jfWywbAjQ52VJJ1b3aNJq2B7Y3Zc718vwkNbT8YnGIu9HwIsFz0
	 jLOfRpFuFVr7Q==
X-Brightmail-Tracker: H4sIAAAAAAAAA+NgFrrBIsWRWlGSWpSXmKPExsViZ8ORqJuvsjf
  J4MMSPYs7P9+xOzB6nNu4gjGAMYo1My8pvyKBNePs8u2MBVPZK5b/nsnSwLibrYuRi0NI4DGj
  xI0P11khnGtMEq//HWSHcPYwSjxev5+li5GTg01ATWL6rRtAVRwcIgJ6Elf/iYKEmQVUJF787
  mEHsYUFLCTuLHvOCmKzCKhK3Np+jRnE5hVwkmh6/RUsLiGgIDHl4XuwOKeAs8TTW7PBeoWAai
  5PfM0IUS8ocXLmExaI+RISB1+8YIboVZSYfbmZBcKukJgxYxsbhK0mcfXcJuYJjIKzkLTPQtK
  +gJFpFaNNUlFmekZJbmJmjq6hgYGuoaGprqWZrqGlsV5ilW6iXmqpbl5+UUmGrqFeYnmxXmpx
  sV5xZW5yTopeXmrJJkZgIKcUJxzcwbhi3y+9Q4ySHExKoryG7HuThPiS8lMqMxKLM+KLSnNSi
  w8xynBwKEnwHlcCygkWpaanVqRl5gCjCiYtwcGjJMIbCpLmLS5IzC3OTIdInWLU5Zj5te0Asx
  BLXn5eqpQ4b4UyUJEASFFGaR7cCFiEX2KUlRLmZWRgYBDiKUgtys0sQZV/xSjOwagkzKsNsoo
  nM68EbtMroCOYgI7YOW0PyBEliQgpqQYm7lVVGkf5OfRO7H9ZHFziXOa9jXeh34LdRzqfzvWv
  57cxdjuacrl37eP577MU51cmajXwvXNaJGSUx/Ts25/GB4lPs1PdrHb+Fs/f+PiJnFWD9dZ23
  9uvnfxCXkXmGk+bnFjRLv7OP9DxvlZVRYlkosC0D+e4dO3vOMo/Ojf9slFDxJ/VXwt+1k9Wux
  1ywuWs2dJfsn0Xj+/sfrQgm2+fILPIz/1LZh6d9CL/hbWJGjtHHre9VHG7h4juzJ9vmD9ciV2
  6TENZs39ltUF10KM9F8U55n9Ivpi2cd/T5c3P9s4K7nGssmPwOdvKwtb3eNPHVydqnrioyLBq
  xJ3wOGfon1tt5cL/7ltJ6hXOw2uUWIozEg21mIuKEwHwPWv1awMAAA==
X-Env-Sender: wangmy@fujitsu.com
X-Msg-Ref: server-3.tower-745.messagelabs.com!1656562799!170553!1
X-Originating-IP: [62.60.8.97]
X-SYMC-ESS-Client-Auth: outbound-route-from=pass
X-StarScan-Received: 
X-StarScan-Version: 9.86.7; banners=-,-,-
X-VirusChecked: Checked
Received: (qmail 8221 invoked from network); 30 Jun 2022 04:19:59 -0000
Received: from unknown (HELO n03ukasimr01.n03.fujitsu.local) (62.60.8.97)
  by server-3.tower-745.messagelabs.com with ECDHE-RSA-AES256-GCM-SHA384
 encrypted SMTP; 30 Jun 2022 04:19:59 -0000
Received: from n03ukasimr01.n03.fujitsu.local (localhost [127.0.0.1])
	by n03ukasimr01.n03.fujitsu.local (Postfix) with ESMTP id 2D218100190
	for <openembedded-core@lists.openembedded.org>;
 Thu, 30 Jun 2022 05:19:59 +0100 (BST)
Received: from R01UKEXCASM126.r01.fujitsu.local (R01UKEXCASM126
 [10.183.43.178])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-SHA384 (256/256 bits))
	(No client certificate requested)
	by n03ukasimr01.n03.fujitsu.local (Postfix) with ESMTPS id 20DED100043
	for <openembedded-core@lists.openembedded.org>;
 Thu, 30 Jun 2022 05:19:59 +0100 (BST)
Received: from localhost.localdomain (10.167.225.33) by
 R01UKEXCASM126.r01.fujitsu.local (10.183.43.178) with Microsoft SMTP Server
 (TLS) id 15.0.1497.32; Thu, 30 Jun 2022 05:19:57 +0100
From: Wang Mingyu <wangmy@fujitsu.com>
To: <openembedded-core@lists.openembedded.org>
CC: Wang Mingyu <wangmy@fujitsu.com>
Subject: [OE-core] [PATCH] git: upgrade 2.36.1 -> 2.37.0
Date: Thu, 30 Jun 2022 12:19:31 +0800
Message-ID: <1656562773-11393-3-git-send-email-wangmy@fujitsu.com>
X-Mailer: git-send-email 1.8.3.1
In-Reply-To: <1656562773-11393-1-git-send-email-wangmy@fujitsu.com>
References: <1656562773-11393-1-git-send-email-wangmy@fujitsu.com>
MIME-Version: 1.0
Content-Type: text/plain
X-Originating-IP: [10.167.225.33]
X-ClientProxiedBy: G08CNEXCHPEKD09.g08.fujitsu.local (10.167.33.85) To
 R01UKEXCASM126.r01.fujitsu.local (10.183.43.178)
X-Virus-Scanned: ClamAV using ClamSMTP
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Thu, 30 Jun 2022 04:20:08 -0000
X-Groupsio-URL: 
 https://lists.openembedded.org/g/openembedded-core/message/167393

Signed-off-by: Wang Mingyu <wangmy@fujitsu.com>
---
 meta/recipes-devtools/git/{git_2.36.1.bb => git_2.37.0.bb} | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)
 rename meta/recipes-devtools/git/{git_2.36.1.bb => git_2.37.0.bb} (98%)

diff --git a/meta/recipes-devtools/git/git_2.36.1.bb b/meta/recipes-devtools/git/git_2.37.0.bb
similarity index 98%
rename from meta/recipes-devtools/git/git_2.36.1.bb
rename to meta/recipes-devtools/git/git_2.37.0.bb
index 07e416282b..d3bd0619af 100644
--- a/meta/recipes-devtools/git/git_2.36.1.bb
+++ b/meta/recipes-devtools/git/git_2.37.0.bb
@@ -165,4 +165,4 @@ EXTRA_OECONF += "ac_cv_snprintf_returns_bogus=no \
                  "
 EXTRA_OEMAKE += "NO_GETTEXT=1"
 
-SRC_URI[tarball.sha256sum] = "37d936fd17c81aa9ddd3dba4e56e88a45fa534ad0ba946454e8ce818760c6a2c"
+SRC_URI[tarball.sha256sum] = "fc3ffe6c65c1f7c681a1ce6bb91703866e432c762731d4b57c566d696f6d62c3"
-- 
2.25.1


