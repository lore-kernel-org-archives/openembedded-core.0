Return-Path: <wangmy@fujitsu.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id C1856C6FA9E
	for <webhook@archiver.kernel.org>; Sun,  5 Mar 2023 08:08:05 +0000 (UTC)
Received: from mail1.bemta37.messagelabs.com (mail1.bemta37.messagelabs.com [85.158.142.113])
 by mx.groups.io with SMTP id smtpd.web10.5213.1678003679949328237
 for <openembedded-core@lists.openembedded.org>;
 Sun, 05 Mar 2023 00:08:00 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@fujitsu.com header.s=170520fj header.b=yMWpQ09o;
 spf=pass (domain: fujitsu.com, ip: 85.158.142.113, mailfrom: wangmy@fujitsu.com)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=fujitsu.com;
	s=170520fj; t=1678003678; i=@fujitsu.com;
	bh=pClqHmQG+f/mAFwgG/p2Z39xEIetPi87/sl8rFYxSL4=;
	h=From:To:CC:Subject:Date:Message-ID:MIME-Version:Content-Type;
	b=yMWpQ09oOfEmM6LwlVycaWbP4xI1NBQa6KF7uEN+/V8hmTHJqgpTpyE15TxrKCjKB
	 qheGfuXiC7x95XiJvrmWrkaPD1LBCHslPKRztp9LdJXfL7BhmjHmxJDUmJDEsP5su1
	 xAzluKh0La1LfKj3U9PtG7SE+GHuBgBl7uKWK4s8NHjNPXUbHKfsjNT4uf91qvjk9i
	 WacG5mrX4RRhraqkX+uZScf6KrNBR7+W4yAhb+JDeGMvRLH2hMWH2itYCoaMxAsc4D
	 wAMOP9XYQhcQao5gZEBZzkT8NB8VOJ+Q4JoJJ50x+SlEJC0IuJu7R2+cAScjovqLmp
	 6QrOGOBNufiXw==
X-Brightmail-Tracker: H4sIAAAAAAAAA+NgFlrLIsWRWlGSWpSXmKPExsViZ8ORqHvXlyX
  FYNNXEYs7P9+xOzB6nNu4gjGAMYo1My8pvyKBNeP0jodMBfs5Kr7ePcjawHiRvYuRi0NI4DGj
  xKWrn5ggnOtMEhPf/mKDcPYwSrzvOQfkcHKwCUhJ3Lj/H8jm4BAR0JO4+k8UJMwsoCLx4ncPO
  0hYWMBUYuMsLpAwC1D4+6o1YJ28Ak4SJ89OZQGxJQQUJKY8fM8MEReUODnzCQvEGAmJgy9eME
  PUKErMvtwMVV8p0frhF5StJnH13CbmCYz8s5C0z0LSvoCRaRWjWXFqUVlqka6xXlJRZnpGSW5
  iZo5eYpVuol5qqW5eflFJhq6hXmJ5sV5qcbFecWVuck6KXl5qySZGYCimFCcK7WD81vtX7xCj
  JAeTkihv4C/mFCG+pPyUyozE4oz4otKc1OJDjDIcHEoSvE/dWFKEBItS01Mr0jJzgHEBk5bg4
  FES4X3oCZTmLS5IzC3OTIdInWJUlBLnXeYDlBAASWSU5sG1wWLxEqOslDAvIwMDgxBPQWpRbm
  YJqvwrRnEORiVhXicPoCk8mXklcNNfAS1mAlqscZoBZHFJIkJKqoGp1mV9R5C5tVHExva+K1+
  CHzYneiXOLlbzqHc1DeBY2Oh0/uO+v3tcvE9cui273VhTOGt/CndMN8PUiokNv8U/i+ft9HDl
  Y1x9xLZvf3loOFdDHk//VM4Ds2VnikyLcWEVYT/c3nF9ZuCFayKVRel/muO/iRrf9V38g2XHn
  IpZ5+/MrGAwuLdLa13FOq4YedP8Izb27fqu3/V/Lr+tlnv0+4RbrLoyFe8X/e8qE7my69QBgf
  jm9/a/nHTntt/03fLh5Mx136U/7lskqF527lTXlZM+NqVPe3bqrHDIYXgc3XfU6VF6p1XO6Qs
  Pq9J8o38IT2aY8DDndpud7LM7q78xb56x/8D/VVURaz/x3nZWYinOSDTUYi4qTgQA9X89QkAD
  AAA=
X-Env-Sender: wangmy@fujitsu.com
X-Msg-Ref: server-22.tower-732.messagelabs.com!1678003676!705213!1
X-Originating-IP: [62.60.8.97]
X-SYMC-ESS-Client-Auth: outbound-route-from=pass
X-StarScan-Received: 
X-StarScan-Version: 9.103.1; banners=-,-,-
X-VirusChecked: Checked
Received: (qmail 5699 invoked from network); 5 Mar 2023 08:07:57 -0000
Received: from unknown (HELO n03ukasimr01.n03.fujitsu.local) (62.60.8.97)
  by server-22.tower-732.messagelabs.com with ECDHE-RSA-AES256-GCM-SHA384 encrypted SMTP; 5 Mar 2023 08:07:57 -0000
Received: from n03ukasimr01.n03.fujitsu.local (localhost [127.0.0.1])
	by n03ukasimr01.n03.fujitsu.local (Postfix) with ESMTP id B1B5B10019D
	for <openembedded-core@lists.openembedded.org>; Sun,  5 Mar 2023 08:07:56 +0000 (GMT)
Received: from R01UKEXCASM223.r01.fujitsu.local (R01UKEXCASM223 [10.182.185.121])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-SHA384 (256/256 bits))
	(No client certificate requested)
	by n03ukasimr01.n03.fujitsu.local (Postfix) with ESMTPS id A560510018D
	for <openembedded-core@lists.openembedded.org>; Sun,  5 Mar 2023 08:07:56 +0000 (GMT)
Received: from localhost.localdomain (10.167.225.33) by
 R01UKEXCASM223.r01.fujitsu.local (10.182.185.121) with Microsoft SMTP Server
 (TLS) id 15.0.1497.42; Sun, 5 Mar 2023 08:07:55 +0000
From: <wangmy@fujitsu.com>
To: <openembedded-core@lists.openembedded.org>
CC: Wang Mingyu <wangmy@fujitsu.com>
Subject: [OE-core] [PATCH] repo: upgrade 2.31 -> 2.32
Date: Sun, 5 Mar 2023 16:07:43 +0800
Message-ID: <1678003665-30591-1-git-send-email-wangmy@fujitsu.com>
X-Mailer: git-send-email 1.8.3.1
MIME-Version: 1.0
Content-Type: text/plain
X-Originating-IP: [10.167.225.33]
X-ClientProxiedBy: G08CNEXCHPEKD07.g08.fujitsu.local (10.167.33.80) To
 R01UKEXCASM223.r01.fujitsu.local (10.182.185.121)
X-Virus-Scanned: ClamAV using ClamSMTP
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Sun, 05 Mar 2023 08:08:05 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/178038

From: Wang Mingyu <wangmy@fujitsu.com>

Signed-off-by: Wang Mingyu <wangmy@fujitsu.com>
---
 meta/recipes-devtools/repo/{repo_2.31.bb => repo_2.32.bb} | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)
 rename meta/recipes-devtools/repo/{repo_2.31.bb => repo_2.32.bb} (95%)

diff --git a/meta/recipes-devtools/repo/repo_2.31.bb b/meta/recipes-devtools/repo/repo_2.32.bb
similarity index 95%
rename from meta/recipes-devtools/repo/repo_2.31.bb
rename to meta/recipes-devtools/repo/repo_2.32.bb
index 27bb5d163e..dc7557ee1e 100644
--- a/meta/recipes-devtools/repo/repo_2.31.bb
+++ b/meta/recipes-devtools/repo/repo_2.32.bb
@@ -12,7 +12,7 @@ LIC_FILES_CHKSUM = "file://LICENSE;md5=3b83ef96387f14655fc854ddc3c6bd57"
 SRC_URI = "git://gerrit.googlesource.com/git-repo.git;protocol=https;branch=main \
            file://0001-python3-shebang.patch \
            "
-SRCREV = "a621254b263664efa308a645214d3d140e068676"
+SRCREV = "7fa149b47a980779f02ccaf1d1dbd5af5ce9abc7"
 
 MIRRORS += "git://gerrit.googlesource.com/git-repo.git git://github.com/GerritCodeReview/git-repo.git"
 
-- 
2.34.1


