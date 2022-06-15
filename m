Return-Path: <wangmy@fujitsu.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id EEF84CCA47B
	for <webhook@archiver.kernel.org>; Wed, 15 Jun 2022 08:11:33 +0000 (UTC)
Received: from mail1.bemta32.messagelabs.com (mail1.bemta32.messagelabs.com
 [195.245.230.1])
 by mx.groups.io with SMTP id smtpd.web08.2049.1655280685365541216
 for <openembedded-core@lists.openembedded.org>;
 Wed, 15 Jun 2022 01:11:26 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@fujitsu.com header.s=170520fj header.b=ATGKqsFa;
 spf=pass (domain: fujitsu.com, ip: 195.245.230.1,
 mailfrom: wangmy@fujitsu.com)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=fujitsu.com;
	s=170520fj; t=1655280683; i=@fujitsu.com;
	bh=GwvUPW9qN6jPFwki+/sFJXg5w4+7Zr+EEM/5dAIhGI0=;
	h=From:To:CC:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type;
	b=ATGKqsFaMpRGy3TYAhEzSrExaxRju9Ex2vES3SOzZmAD6TKQ1TraDjxsQEy0ibGYF
	 xP1g2ZguKMiwFVEipBSdGJuthQmT2lVyzOIkZmuWHr7PuUrKwSIOJeOPJGsWvG+7Ka
	 MRyu/fMNTVjjnWmOQXm7tugFcIQjL2At48tlbxuYJBIsUi4ltR3iCCsOhrXWdqywmd
	 qjx6bFxhCrz3X51YENxpmMEkBKqMS2y++n8jbbcRjbEivG4fmbAVVRv6nNjGqvI85s
	 LmGN/d2D8jxjNzzbP6NbwQ5vP+0RTIrteYHn5WLuRdI2NcvELtCxJwfodEYV+TECVt
	 PnF3TADFvxZzQ==
X-Brightmail-Tracker: H4sIAAAAAAAAA+NgFnrOIsWRWlGSWpSXmKPExsViZ8OxWVdryso
  kg0f/VC3u/HzH7sDocW7jCsYAxijWzLyk/IoE1oyJN5uYC1YIVRy68Ye5gXGFQBcjF4eQwH1G
  iTl3PzNBOGeYJO5fP8gK4exhlFg7bzVzFyMnB5uAmsT0WzeAEhwcIgJ6Elf/iYKEmQVUJF787
  mEHsYUFLCRu7LrOCFLCIqAq0fveASTMK+AosatlBguILSGgIDHl4XuwiZwCThK3th5iBLGFgG
  o6dl9nhKgXlDg58wkLxHgJiYMvXjBD9CpKzL7cDDWnQmLGjG1sELaaxNVzm5gnMArOQtI+C0n
  7AkamVYxWSUWZ6RkluYmZObqGBga6hoamuma6hmaWeolVuol6qaW65anFJbqGeonlxXqpxcV6
  xZW5yTkpenmpJZsYgSGcUsy2cgfjyr6feocYJTmYlER5lSevTBLiS8pPqcxILM6ILyrNSS0+x
  CjDwaEkwes6CSgnWJSanlqRlpkDjCeYtAQHj5IIbz1IK29xQWJucWY6ROoUoz3H1StX9jJzTJ
  39bz8zx3IwOfNr2wFmIZa8/LxUKXHemE6gNgGQtozSPLihsPi/xCgrJczLyMDAIMRTkFqUm1m
  CKv+KUZyDUUmYtxNkOU9mXgnc7ldAZzEBndW4bwXIWSWJCCmpBqby87tkVMyuiO+KsrO4k563
  3vFtVP7Ug5sy24Q+TMucrV6plv+b+8Aza3/xM2mxL0Ldvb6WWrq80+RbmrTBb1vPURf1NzFe9
  6Mdc+8cTORrVel9pSUhtLNi2URGc+a5UszTWD4e677ZNfNO7e+Z+56sv6ej4mP8rVSyUmr3e+
  bFU7y95s+cV3qN3/6HOafto5Vb3sox7DxnGv1BTzvgQ/fSyMP5vbtmdhXzL73W/HnHxT8T9j0
  +5q/3XHChwEufL98qV+oFtr6qir8t8GveGskdv5frb9s88bwo18NCuarC9Tan/3plKFYUbG/h
  mvN887ptz4LleRi2nNsz9VVKXd/T5y4G+9wZlHR3FORv7Z6sxFKckWioxVxUnAgAwyZICHoDA
  AA=
X-Env-Sender: wangmy@fujitsu.com
X-Msg-Ref: server-21.tower-587.messagelabs.com!1655280682!132815!1
X-Originating-IP: [62.60.8.179]
X-SYMC-ESS-Client-Auth: outbound-route-from=pass
X-StarScan-Received: 
X-StarScan-Version: 9.86.7; banners=-,-,-
X-VirusChecked: Checked
Received: (qmail 16580 invoked from network); 15 Jun 2022 08:11:22 -0000
Received: from unknown (HELO n03ukasimr04.n03.fujitsu.local) (62.60.8.179)
  by server-21.tower-587.messagelabs.com with ECDHE-RSA-AES256-GCM-SHA384
 encrypted SMTP; 15 Jun 2022 08:11:22 -0000
Received: from n03ukasimr04.n03.fujitsu.local (localhost [127.0.0.1])
	by n03ukasimr04.n03.fujitsu.local (Postfix) with ESMTP id 2A48675
	for <openembedded-core@lists.openembedded.org>;
 Wed, 15 Jun 2022 09:11:22 +0100 (BST)
Received: from R01UKEXCASM126.r01.fujitsu.local (unknown [10.183.43.178])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-SHA384 (256/256 bits))
	(No client certificate requested)
	by n03ukasimr04.n03.fujitsu.local (Postfix) with ESMTPS id F013514C
	for <openembedded-core@lists.openembedded.org>;
 Wed, 15 Jun 2022 09:11:21 +0100 (BST)
Received: from localhost.localdomain (10.167.225.33) by
 R01UKEXCASM126.r01.fujitsu.local (10.183.43.178) with Microsoft SMTP Server
 (TLS) id 15.0.1497.32; Wed, 15 Jun 2022 09:11:03 +0100
From: Wang Mingyu <wangmy@fujitsu.com>
To: <openembedded-core@lists.openembedded.org>
CC: Wang Mingyu <wangmy@fujitsu.com>
Subject: [OE-core] [PATCH] ethtool: upgrade 5.17 -> 5.18
Date: Wed, 15 Jun 2022 16:10:36 +0800
Message-ID: <1655280638-6528-2-git-send-email-wangmy@fujitsu.com>
X-Mailer: git-send-email 1.8.3.1
In-Reply-To: <1655280638-6528-1-git-send-email-wangmy@fujitsu.com>
References: <1655280638-6528-1-git-send-email-wangmy@fujitsu.com>
MIME-Version: 1.0
Content-Type: text/plain
X-Originating-IP: [10.167.225.33]
X-ClientProxiedBy: G08CNEXCHPEKD09.g08.fujitsu.local (10.167.33.85) To
 R01UKEXCASM126.r01.fujitsu.local (10.183.43.178)
X-Virus-Scanned: ClamAV using ClamSMTP
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Wed, 15 Jun 2022 08:11:33 -0000
X-Groupsio-URL: 
 https://lists.openembedded.org/g/openembedded-core/message/166914

avoid_parallel_tests.patch
refresed for new version.

Signed-off-by: Wang Mingyu <wangmy@fujitsu.com>
---
 .../ethtool/ethtool/avoid_parallel_tests.patch              | 6 +++---
 .../ethtool/{ethtool_5.17.bb => ethtool_5.18.bb}            | 2 +-
 2 files changed, 4 insertions(+), 4 deletions(-)
 rename meta/recipes-extended/ethtool/{ethtool_5.17.bb => ethtool_5.18.bb} (93%)

diff --git a/meta/recipes-extended/ethtool/ethtool/avoid_parallel_tests.patch b/meta/recipes-extended/ethtool/ethtool/avoid_parallel_tests.patch
index 52d2a93449..4391a91767 100644
--- a/meta/recipes-extended/ethtool/ethtool/avoid_parallel_tests.patch
+++ b/meta/recipes-extended/ethtool/ethtool/avoid_parallel_tests.patch
@@ -1,4 +1,4 @@
-From ef2ad68becea77dfdbd5a344e30b3700cc440c0f Mon Sep 17 00:00:00 2001
+From b0270486eca02e1b70eff7517936fad77bb1fb8e Mon Sep 17 00:00:00 2001
 From: Tudor Florea <tudor.florea@enea.com>
 Date: Wed, 28 May 2014 18:59:54 +0200
 Subject: [PATCH] ethtool: use serial-tests config needed by ptest.
@@ -15,11 +15,11 @@ Upstream-Status: Inappropriate
  1 file changed, 1 insertion(+), 1 deletion(-)
 
 diff --git a/configure.ac b/configure.ac
-index 7a9b5b9..dc8ae35 100644
+index c11f2b1..2bd2b83 100644
 --- a/configure.ac
 +++ b/configure.ac
 @@ -2,7 +2,7 @@ dnl Process this file with autoconf to produce a configure script.
- AC_INIT(ethtool, 5.17, netdev@vger.kernel.org)
+ AC_INIT(ethtool, 5.18, netdev@vger.kernel.org)
  AC_PREREQ(2.52)
  AC_CONFIG_SRCDIR([ethtool.c])
 -AM_INIT_AUTOMAKE([gnu subdir-objects])
diff --git a/meta/recipes-extended/ethtool/ethtool_5.17.bb b/meta/recipes-extended/ethtool/ethtool_5.18.bb
similarity index 93%
rename from meta/recipes-extended/ethtool/ethtool_5.17.bb
rename to meta/recipes-extended/ethtool/ethtool_5.18.bb
index 61032d4836..b4f74e7f5b 100644
--- a/meta/recipes-extended/ethtool/ethtool_5.17.bb
+++ b/meta/recipes-extended/ethtool/ethtool_5.18.bb
@@ -11,7 +11,7 @@ SRC_URI = "${KERNELORG_MIRROR}/software/network/ethtool/ethtool-${PV}.tar.gz \
            file://avoid_parallel_tests.patch \
            "
 
-SRC_URI[sha256sum] = "3e32735d13aa19e2be32d3528ef8a135fc99782950ab3fa602198e72992e9450"
+SRC_URI[sha256sum] = "70091f95448eba851f9f9804059d0e237f1d909064046f9e3c6dc892aa1e8afe"
 
 UPSTREAM_CHECK_URI = "https://www.kernel.org/pub/software/network/ethtool/"
 
-- 
2.25.1


