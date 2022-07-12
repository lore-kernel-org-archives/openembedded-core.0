Return-Path: <wangmy@fujitsu.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 29532CCA480
	for <webhook@archiver.kernel.org>; Tue, 12 Jul 2022 07:45:28 +0000 (UTC)
Received: from mail1.bemta34.messagelabs.com (mail1.bemta34.messagelabs.com
 [195.245.231.4])
 by mx.groups.io with SMTP id smtpd.web11.6284.1657611925177500372
 for <openembedded-core@lists.openembedded.org>;
 Tue, 12 Jul 2022 00:45:25 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@fujitsu.com header.s=170520fj header.b=fRTJZBPl;
 spf=pass (domain: fujitsu.com, ip: 195.245.231.4,
 mailfrom: wangmy@fujitsu.com)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=fujitsu.com;
	s=170520fj; t=1657611923; i=@fujitsu.com;
	bh=uBJKcDamege3Apf+ggcBJEHItJ4vwP+bCBSoH3hDUFk=;
	h=From:To:CC:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type;
	b=fRTJZBPlA9nJ/swIzf4+p+VgAhjJK2p2H8NtxDckNsCj7EeKHMFdjMFCO8ye/PCoG
	 PUBbdWxPwmHLfxIjclc6vSfoly3hhj+qo30emqh0AOOanZO3iJx889O9N0NQArhp4b
	 8A5XRZONHV3+g3994ENLXGRUUOl2Cfa8MseiaHrUQntX3ujocJ5kXe4LbyxJr4MNFN
	 C5vbwQkcBVfFPQai0nRGxdYrpbukmSj5x4yR3keRoDKBYVsQelmG7p4VW4TmA7wQUl
	 1Tv0BBjIGWhudaT16A+fUHmnBR274VvChFtKIW2ZQ2DSckiIJs1jiv5nSkh0S4NCrF
	 n5xAjTtV631Ug==
X-Brightmail-Tracker: H4sIAAAAAAAAA+NgFrrOIsWRWlGSWpSXmKPExsViZ8MxSXey2tk
  kg4NzBS3u/HzH7sDocW7jCsYAxijWzLyk/IoE1oyttx4zFTzhrPi56QlbA2MDZxcjF4eQwGNG
  iQff9zNCONeYJE4+bmeBcPYwSjQebGPuYuTkYBNQk5h+6wZrFyMHh4iAnsTVf6IgYWYBFYkXv
  3vYQWxhARcg+zwTiM0ioCrxdN4kNhCbV8BJYsvqqYwgtoSAgsSUh+/BRnIKOEs0/j4EVi8EVN
  P14ys7RL2gxMmZT1gg5ktIHHzxghmiV1Fi9uVmFgi7QmLGjG1sELaaxNVzm5gnMArOQtI+C0n
  7AkamVYzWSUWZ6RkluYmZObqGBga6hoamusZGuoZGZnqJVbqJeqmluuWpxSW6RnqJ5cV6qcXF
  esWVuck5KXp5qSWbGIFhnFKsULeD8drKn3qHGCU5mJREefOkzyYJ8SXlp1RmJBZnxBeV5qQWH
  2KU4eBQkuC1UQHKCRalpqdWpGXmAGMKJi3BwaMkwmuiDJTmLS5IzC3OTIdInWLU5Zj5te0Asx
  BLXn5eqpQ4r4AqUJEASFFGaR7cCFh8X2KUlRLmZWRgYBDiKUgtys0sQZV/xSjOwagkzDsNZAp
  PZl4J3KZXQEcwAR0hF3kG5IiSRISUVANT3aECl33TFvdx/2bJXH+fz2TasnfKJycVVG+avWTJ
  fhkXL2kxu0VcTg2PtUtO//62tImFu7LdXStbq0F2dsLSym+6J+y3L5n/4N0Kg3l6S1zWX3e9x
  hj9vGnSKheXv2EJvub/OX4tLZbUnsJ7do2dxQffacYVBdETpzdVZvKfKnu4SaXq2n2Lhmtffj
  lKVCZ4HH7xQNtTZg5HsqX9L73FrQbui4WaT3JffH9iZdSTKiYVj226Dr4fVhd0ZXn9ajQ/++3
  +w9Xn0iNPhAqYXz38+/mWS+21Oubn3W3PJHHf0/xSzehpcuVdTcRm0cOuhxY6/XdvnmCdkX3m
  Wr1lxzm21vllXe9F49v/83eb7zilxFKckWioxVxUnAgA7F2WtWoDAAA=
X-Env-Sender: wangmy@fujitsu.com
X-Msg-Ref: server-18.tower-571.messagelabs.com!1657611923!86807!1
X-Originating-IP: [62.60.8.146]
X-SYMC-ESS-Client-Auth: outbound-route-from=pass
X-StarScan-Received: 
X-StarScan-Version: 9.87.3; banners=-,-,-
X-VirusChecked: Checked
Received: (qmail 7124 invoked from network); 12 Jul 2022 07:45:23 -0000
Received: from unknown (HELO n03ukasimr02.n03.fujitsu.local) (62.60.8.146)
  by server-18.tower-571.messagelabs.com with ECDHE-RSA-AES256-GCM-SHA384
 encrypted SMTP; 12 Jul 2022 07:45:23 -0000
Received: from n03ukasimr02.n03.fujitsu.local (localhost [127.0.0.1])
	by n03ukasimr02.n03.fujitsu.local (Postfix) with ESMTP id 01CFE100078
	for <openembedded-core@lists.openembedded.org>;
 Tue, 12 Jul 2022 08:45:23 +0100 (BST)
Received: from R01UKEXCASM126.r01.fujitsu.local (R01UKEXCASM126
 [10.183.43.178])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-SHA384 (256/256 bits))
	(No client certificate requested)
	by n03ukasimr02.n03.fujitsu.local (Postfix) with ESMTPS id E9537100077
	for <openembedded-core@lists.openembedded.org>;
 Tue, 12 Jul 2022 08:45:22 +0100 (BST)
Received: from localhost.localdomain (10.167.225.33) by
 R01UKEXCASM126.r01.fujitsu.local (10.183.43.178) with Microsoft SMTP Server
 (TLS) id 15.0.1497.32; Tue, 12 Jul 2022 08:45:21 +0100
From: Wang Mingyu <wangmy@fujitsu.com>
To: <openembedded-core@lists.openembedded.org>
CC: Wang Mingyu <wangmy@fujitsu.com>
Subject: [OE-core] [PATCH] python3-hatchling: upgrade 1.3.1 -> 1.5.0
Date: Tue, 12 Jul 2022 15:44:57 +0800
Message-ID: <1657611899-30825-2-git-send-email-wangmy@fujitsu.com>
X-Mailer: git-send-email 1.8.3.1
In-Reply-To: <1657611899-30825-1-git-send-email-wangmy@fujitsu.com>
References: <1657611899-30825-1-git-send-email-wangmy@fujitsu.com>
MIME-Version: 1.0
Content-Type: text/plain
X-Originating-IP: [10.167.225.33]
X-ClientProxiedBy: G08CNEXCHPEKD09.g08.fujitsu.local (10.167.33.85) To
 R01UKEXCASM126.r01.fujitsu.local (10.183.43.178)
X-Virus-Scanned: ClamAV using ClamSMTP
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Tue, 12 Jul 2022 07:45:28 -0000
X-Groupsio-URL: 
 https://lists.openembedded.org/g/openembedded-core/message/167901

Signed-off-by: Wang Mingyu <wangmy@fujitsu.com>
---
 .../{python3-hatchling_1.3.1.bb => python3-hatchling_1.5.0.bb}  | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)
 rename meta/recipes-devtools/python/{python3-hatchling_1.3.1.bb => python3-hatchling_1.5.0.bb} (88%)

diff --git a/meta/recipes-devtools/python/python3-hatchling_1.3.1.bb b/meta/recipes-devtools/python/python3-hatchling_1.5.0.bb
similarity index 88%
rename from meta/recipes-devtools/python/python3-hatchling_1.3.1.bb
rename to meta/recipes-devtools/python/python3-hatchling_1.5.0.bb
index fd76a28fb1..e453dbdcf7 100644
--- a/meta/recipes-devtools/python/python3-hatchling_1.3.1.bb
+++ b/meta/recipes-devtools/python/python3-hatchling_1.5.0.bb
@@ -8,7 +8,7 @@ inherit pypi python_hatchling
 DEPENDS += "python3-pluggy-native python3-tomli-native python3-pathspec-native python3-packaging-native python3-editables-native"
 DEPENDS:remove:class-native = "python3-hatchling-native"
 
-SRC_URI[sha256sum] = "aaa63019c9d666053d9ff318097335e766123844547c52940155c0401c3c142f"
+SRC_URI[sha256sum] = "9ca409a41140cc662164680b78adcd3ba77b23a945984bd9970d11fe38e86a38"
 
 # Until we have a proper tool to invoke PEP517 builds, hatchling can't
 # bootstrap itself automatically.
-- 
2.25.1


