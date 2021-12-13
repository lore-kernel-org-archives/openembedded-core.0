Return-Path: <zhengrq.fnst@fujitsu.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 6AF43C433FE
	for <webhook@archiver.kernel.org>; Mon, 13 Dec 2021 13:31:36 +0000 (UTC)
Received: from mail1.bemta32.messagelabs.com (mail1.bemta32.messagelabs.com
 [195.245.230.66])
 by mx.groups.io with SMTP id smtpd.web12.11149.1639402295836236595
 for <openembedded-core@lists.openembedded.org>;
 Mon, 13 Dec 2021 05:31:36 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@fujitsu.com header.s=170520fj header.b=uiH4W8g8;
 spf=pass (domain: fujitsu.com, ip: 195.245.230.66,
 mailfrom: zhengrq.fnst@fujitsu.com)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=fujitsu.com;
	s=170520fj; t=1639402294; i=@fujitsu.com;
	bh=ETqD+BVZ3TVWif4nkJXmzpeefu6EFymZXpHD0nKJLqc=;
	h=From:To:Subject:Date:Message-ID:MIME-Version:Content-Type;
	b=uiH4W8g88N0EQ/sxrGX6HZOYvvL8blXgXdffeFfZAGZ0BhQ3caCtYzUPolyGzocbP
	 sFYw0ql8t9eA5Q44oObOprEoXpKtm+i8xJsMQZ0SK2ZcAgW4WjBP/PVXKO4EQ2jJym
	 ehxGf4kotTjjZdMiRWzgd8V5X5RNrpvLuoa4A5AV9gjXw74543dtzrfUwZW29cJvxu
	 w/WoX4LRyIen6Asf3E1HklYwkbUh/ljdfCrm4z3PC596WpZ8MGwniCsXkgJgV3k8wK
	 cUsUN9dKvm4mt2LcVQTgi3ciN1Wtr+JSHQzsAnSrbryRq6Ubgw7jVL6ffsqjhVXRlf
	 k7uaxphwjiZwg==
Received: from [100.115.3.245] (using TLSv1.2 with cipher
 DHE-RSA-AES256-GCM-SHA384 (256 bits))
	by server-4.bemta.az-a.eu-west-1.aws.ess.symcld.net id 75/04-30341-63B47B16;
 Mon, 13 Dec 2021 13:31:34 +0000
X-Brightmail-Tracker: H4sIAAAAAAAAA+NgFlrMIsWRWlGSWpSXmKPExsViZ8MxSdfAe3u
  iwcr1QhZ3fr5jd2D0OLdxBWMAYxRrZl5SfkUCa0b/kxWsBQe4Km41LGBrYNzK2cXIxSEk8JhR
  4vL+NiYI5zyTRMvnBhYIZw+jRN/Pr0AZTg42AV2Jc4/XsncxcnCICOhJXP0nCmIKC5hLHOg0A
  6lgEVCVmHlrBhuIzSvgLvHp7l9WEFtCQEFiysP3zBBxQYmTM5+wgNjMAhISB1+8YAYZIyGgKD
  F7ujxEeYXE68OXmCFsNYmr5zYxT2Dkm4WkexaS7gWMTKsYLZOKMtMzSnITM3N0DQ0MdA0NTXW
  NdQ0t9BKrdBP1Ukt1y1OLS3QN9RLLi/VSi4v1iitzk3NS9PJSSzYxAsMupZhZaAfj+r6feocY
  JTmYlER5g1m3JwrxJeWnVGYkFmfEF5XmpBYfYpTh4FCS4P1tDpQTLEpNT61Iy8wBxgBMWoKDR
  0mE190TKM1bXJCYW5yZDpE6xagoJc77AiQhAJLIKM2Da4PF3SVGWSlhXkYGBgYhnoLUotzMEl
  T5V4ziHIxKwrzJjkBTeDLzSuCmvwJazAS0mLFyM8jikkSElFQD09KEB/PjRT4a8WQcPMBwV2v
  21Wv+lg0JOvXT5L5EL4vubnX5KFETZNUZ2bTcL//1j9/HEz5kKOuIvfS6zrPMeOr09rmTzrH/
  P2whY9v2PaD+aEEy20vPZJ4mn9qtM+KFv+UeeKcptc452rYwOEFb+UFR0Jp1Sn2yGz+v9nXjZ
  DnIaPb2Y3ZbbIjO53WHXTX2ukV0dkRoHZo/2f6i+O6ns1q/Od3oOHaA93vUxwMijL7/3j7ZeL
  XQaureGkNDsT2LwoVS3smEnP0x39dNROjEIq5vVofvKJgfOaQXzsPMzj1dVfZe1Zc7KvOazO2
  Nsg0Y9md1LDpmviLyg9iVvqXbHjfmcH/sElsT2N+3gsdLiaU4I9FQi7moOBEAZg9nQzYDAAA=
X-Env-Sender: zhengrq.fnst@fujitsu.com
X-Msg-Ref: server-14.tower-591.messagelabs.com!1639402287!35382!1
X-Originating-IP: [62.60.8.146]
X-SYMC-ESS-Client-Auth: outbound-route-from=pass
X-StarScan-Received: 
X-StarScan-Version: 9.81.7; banners=-,-,-
X-VirusChecked: Checked
Received: (qmail 31216 invoked from network); 13 Dec 2021 13:31:28 -0000
Received: from unknown (HELO n03ukasimr02.n03.fujitsu.local) (62.60.8.146)
  by server-14.tower-591.messagelabs.com with ECDHE-RSA-AES256-GCM-SHA384
 encrypted SMTP; 13 Dec 2021 13:31:28 -0000
Received: from n03ukasimr02.n03.fujitsu.local (localhost [127.0.0.1])
	by n03ukasimr02.n03.fujitsu.local (Postfix) with ESMTP id C3BAE100352
	for <openembedded-core@lists.openembedded.org>;
 Mon, 13 Dec 2021 13:31:27 +0000 (GMT)
Received: from R01UKEXCASM126.r01.fujitsu.local (unknown [10.183.43.178])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-SHA384 (256/256 bits))
	(No client certificate requested)
	by n03ukasimr02.n03.fujitsu.local (Postfix) with ESMTPS id B75171000F6
	for <openembedded-core@lists.openembedded.org>;
 Mon, 13 Dec 2021 13:31:27 +0000 (GMT)
Received: from localhost.localdomain (10.167.225.35) by
 R01UKEXCASM126.r01.fujitsu.local (10.183.43.178) with Microsoft SMTP Server
 (TLS) id 15.0.1497.26; Mon, 13 Dec 2021 13:31:10 +0000
From: Zheng Ruoqin <zhengrq.fnst@fujitsu.com>
To: <openembedded-core@lists.openembedded.org>
Subject: [OE-core] [PATCH] rt-tests: upgrade 2.2 -> 2.3
Date: Tue, 14 Dec 2021 06:31:04 +0800
Message-ID: <1639434664-2753-1-git-send-email-zhengrq.fnst@fujitsu.com>
X-Mailer: git-send-email 1.8.3.1
MIME-Version: 1.0
Content-Type: text/plain
X-Originating-IP: [10.167.225.35]
X-ClientProxiedBy: G08CNEXCHPEKD08.g08.fujitsu.local (10.167.33.83) To
 R01UKEXCASM126.r01.fujitsu.local (10.183.43.178)
X-Virus-Scanned: ClamAV using ClamSMTP
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Mon, 13 Dec 2021 13:31:36 -0000
X-Groupsio-URL: 
 https://lists.openembedded.org/g/openembedded-core/message/159635

Signed-off-by: Zheng Ruoqin <zhengrq.fnst@fujitsu.com>
---
 .../0001-Makefile-Allow-for-CC-and-AR-to-be-overridden.patch  | 2 +-
 meta/recipes-rt/rt-tests/rt-tests.inc                         | 4 ++--
 2 files changed, 3 insertions(+), 3 deletions(-)

diff --git a/meta/recipes-rt/rt-tests/files/0001-Makefile-Allow-for-CC-and-AR-to-be-overridden.patch b/meta/recipes-rt/rt-tests/files/0001-Makefile-Allow-for-CC-and-AR-to-be-overridden.patch
index 1e8ff4619b..43c2a2f33b 100644
--- a/meta/recipes-rt/rt-tests/files/0001-Makefile-Allow-for-CC-and-AR-to-be-overridden.patch
+++ b/meta/recipes-rt/rt-tests/files/0001-Makefile-Allow-for-CC-and-AR-to-be-overridden.patch
@@ -19,7 +19,7 @@ index ec5d693..ab8a8de 100644
 --- a/Makefile
 +++ b/Makefile
 @@ -1,6 +1,6 @@
- VERSION = 2.2
+ VERSION = 2.3
 -CC = $(CROSS_COMPILE)gcc
 -AR = $(CROSS_COMPILE)ar
 +CC ?= $(CROSS_COMPILE)gcc
diff --git a/meta/recipes-rt/rt-tests/rt-tests.inc b/meta/recipes-rt/rt-tests/rt-tests.inc
index 71227307c3..e519dfdc61 100644
--- a/meta/recipes-rt/rt-tests/rt-tests.inc
+++ b/meta/recipes-rt/rt-tests/rt-tests.inc
@@ -1,5 +1,5 @@
-SRCREV = "75c16956e32817dfb0d5cb7379e731061e16593f"
-PV = "2.2"
+SRCREV = "338843c1ee157ae5d990c6f544f66b447b24fa8b"
+PV = "2.3"
 PE = "1"
 
 SRC_URI = "git://git.kernel.org/pub/scm/utils/rt-tests/rt-tests.git;branch=main"
-- 
2.25.1


