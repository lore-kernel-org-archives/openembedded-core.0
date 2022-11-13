Return-Path: <wangmy@fujitsu.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id F0F3AC4332F
	for <webhook@archiver.kernel.org>; Sun, 13 Nov 2022 02:57:55 +0000 (UTC)
Received: from mail1.bemta37.messagelabs.com (mail1.bemta37.messagelabs.com [85.158.142.113])
 by mx.groups.io with SMTP id smtpd.web11.156.1668308270794996734
 for <openembedded-core@lists.openembedded.org>;
 Sat, 12 Nov 2022 18:57:51 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@fujitsu.com header.s=170520fj header.b=XCIQlnio;
 spf=pass (domain: fujitsu.com, ip: 85.158.142.113, mailfrom: wangmy@fujitsu.com)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=fujitsu.com;
	s=170520fj; t=1668308268; i=@fujitsu.com;
	bh=bepm57l9cFMMfpRZusKhZbtoa2zSlujYhWv5P3klVtw=;
	h=From:To:CC:Subject:Date:Message-ID:MIME-Version:Content-Type;
	b=XCIQlnio8AiFgDE5PPl+O0VXoZq2uahv14spPsk99P28tzA29QSiiXZwE6qGtoDyq
	 I+gCjyUVX/Tpyf4UdNZ7EXSFTdEsyvaU3APESTOwQFW4umrFueGGPwTJ0DZMCQqnrz
	 WJbVW2MWEmw4dFm+XIWtB/QvH5QljNUoq6ZZfe9vAfzlM+hSFIvIAjTdCeIU//3eYa
	 oKHYLicEiJWMjyVWSHr1Zqkq06pKh9CcBNWFPUwRuGGsbTO21H0Pe8Lw2OiL+ilPex
	 azBNXr3RSIS+29M/EVhXcjgweyKFRPPI74VP6aqEwjAlabplPkAJWhO9ZYZmSb5ouu
	 JkCwQHys4gh+w==
X-Brightmail-Tracker: H4sIAAAAAAAAA+NgFtrJIsWRWlGSWpSXmKPExsViZ8ORpKsdW5B
  ssLJD0OLOz3fsDowe5zauYAxgjGLNzEvKr0hgzZg84SBrwV3WitUvJzA3ME5n7WLk4hASeMAo
  cfbsDyjnEpPEjIlz2SGcPYwSfz7tAnI4OdgEpCRu3P/P1sXIwSEioCdx9Z8oSJhZQEXixe8es
  BJhAQeJBUsXsICUsAioSpw9yAQS5hVwknj+tg2sREJAQWLKw/fMEHFBiZMzn7BAjJGQOPjiBT
  NEjaLE7MvNLBB2hcSsWW1MELaaxNVzm5gnMPLPQtI+C0n7AkamVYxmxalFZalFumZ6SUWZ6Rk
  luYmZOXqJVbqJeqmlunn5RSUZuoZ6ieXFeqnFxXrFlbnJOSl6eaklmxiBoZhSnMS5g3HOsj96
  hxglOZiURHnTrucnC/El5adUZiQWZ8QXleakFh9ilOHgUJLg/R1ZkCwkWJSanlqRlpkDjAuYt
  AQHj5IIb4UdUJq3uCAxtzgzHSJ1ilGX4+qVK3uZhVjy8vNSpcR5vUFmCIAUZZTmwY2AxeglRl
  kpYV5GBgYGIZ6C1KLczBJU+VeM4hyMSsK8+8KApvBk5pXAbXoFdAQT0BHfI/NAjihJREhJNTD
  1S2rLfnsa6/YsgtuUxz/PJHbhup+zoy8fPRQVqt3wtrfAfrLs5LuTNlVskGl0nMmXEzSH8Y/n
  lGkN3ayVNxp+B2rU7bxtHa2+e473HdmVgdu5dqy9cu/h0rdsrAv/B1xnCA3IZVB8LOvumWWxQ
  /Rz5aRbPKvv9J99/tm0ND2Ys9Dd8YvZXWfB5AUr4wX8vaZN7eEWVT0fOv2ipYBT5m7hfS9mzr
  1s8OrN7+Sa5C8XH08takz9nCy+uOa4ZFnXTi+X045951PS+3j8gudNbGM+eCOkTmt7Z/Fz8+j
  4xkBHVYHCFTmxtun3Xjnonwjffzr+HkePGG/goawZZ3+yr7U1PnOy7vPCuoX50ucU9ZRYijMS
  DbWYi4oTAbU0kfhMAwAA
X-Env-Sender: wangmy@fujitsu.com
X-Msg-Ref: server-16.tower-745.messagelabs.com!1668308266!684812!1
X-Originating-IP: [62.60.8.98]
X-SYMC-ESS-Client-Auth: outbound-route-from=pass
X-StarScan-Received: 
X-StarScan-Version: 9.100.1; banners=-,-,-
X-VirusChecked: Checked
Received: (qmail 6713 invoked from network); 13 Nov 2022 02:57:47 -0000
Received: from unknown (HELO n03ukasimr03.n03.fujitsu.local) (62.60.8.98)
  by server-16.tower-745.messagelabs.com with ECDHE-RSA-AES256-GCM-SHA384 encrypted SMTP; 13 Nov 2022 02:57:47 -0000
Received: from n03ukasimr03.n03.fujitsu.local (localhost [127.0.0.1])
	by n03ukasimr03.n03.fujitsu.local (Postfix) with ESMTP id C06E01B1
	for <openembedded-core@lists.openembedded.org>; Sun, 13 Nov 2022 02:57:46 +0000 (GMT)
Received: from R01UKEXCASM126.r01.fujitsu.local (R01UKEXCASM126 [10.183.43.178])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-SHA384 (256/256 bits))
	(No client certificate requested)
	by n03ukasimr03.n03.fujitsu.local (Postfix) with ESMTPS id B2ADA7B
	for <openembedded-core@lists.openembedded.org>; Sun, 13 Nov 2022 02:57:46 +0000 (GMT)
Received: from localhost.localdomain (10.167.225.33) by
 R01UKEXCASM126.r01.fujitsu.local (10.183.43.178) with Microsoft SMTP Server
 (TLS) id 15.0.1497.32; Sun, 13 Nov 2022 02:57:45 +0000
From: <wangmy@fujitsu.com>
To: <openembedded-core@lists.openembedded.org>
CC: Wang Mingyu <wangmy@fujitsu.com>
Subject: [OE-core] [PATCH] mmc-utils: upgrade to latest revision
Date: Sun, 13 Nov 2022 10:57:24 +0800
Message-ID: <1668308244-14525-1-git-send-email-wangmy@fujitsu.com>
X-Mailer: git-send-email 1.8.3.1
MIME-Version: 1.0
Content-Type: text/plain
X-Originating-IP: [10.167.225.33]
X-ClientProxiedBy: G08CNEXCHPEKD07.g08.fujitsu.local (10.167.33.80) To
 R01UKEXCASM126.r01.fujitsu.local (10.183.43.178)
X-Virus-Scanned: ClamAV using ClamSMTP
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Sun, 13 Nov 2022 02:57:55 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/173168

From: Wang Mingyu <wangmy@fujitsu.com>

Signed-off-by: Wang Mingyu <wangmy@fujitsu.com>
---
 meta/recipes-devtools/mmc/mmc-utils_git.bb | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/meta/recipes-devtools/mmc/mmc-utils_git.bb b/meta/recipes-devtools/mmc/mmc-utils_git.bb
index d2590d400a..d9625473f5 100644
--- a/meta/recipes-devtools/mmc/mmc-utils_git.bb
+++ b/meta/recipes-devtools/mmc/mmc-utils_git.bb
@@ -5,7 +5,7 @@ LICENSE = "GPL-2.0-only"
 LIC_FILES_CHKSUM = "file://mmc.c;beginline=1;endline=20;md5=fae32792e20f4d27ade1c5a762d16b7d"
 
 SRCBRANCH ?= "master"
-SRCREV = "4a32d090dcf6fec6ef0948e59094c4de406906cd"
+SRCREV = "c62dd8e415b12cc7f9a362db23cd384caf77ff03"
 
 PV = "0.1+git${SRCPV}"
 
-- 
2.25.1


