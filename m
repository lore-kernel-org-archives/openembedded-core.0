Return-Path: <wangmy@fujitsu.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id DD517C77B71
	for <webhook@archiver.kernel.org>; Mon, 10 Apr 2023 08:59:58 +0000 (UTC)
Received: from mail1.bemta37.messagelabs.com (mail1.bemta37.messagelabs.com [85.158.142.112])
 by mx.groups.io with SMTP id smtpd.web11.39817.1681117190238705085
 for <openembedded-core@lists.openembedded.org>;
 Mon, 10 Apr 2023 01:59:50 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@fujitsu.com header.s=170520fj header.b=Ttmx4WL7;
 spf=pass (domain: fujitsu.com, ip: 85.158.142.112, mailfrom: wangmy@fujitsu.com)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=fujitsu.com;
	s=170520fj; t=1681117188; i=@fujitsu.com;
	bh=RVqnM/PTls6azYg9sfYhV4eX8Bbq+kQyHy4heAd2r0k=;
	h=From:To:CC:Subject:Date:Message-ID:MIME-Version:Content-Type;
	b=Ttmx4WL7auegC7h4j8U1q+uZ+HOF/l9XsSrBPrX0s2jNIn+ue3CV2VwBpKBpKN5dQ
	 4SnrWUI9G9PkoG8J4LLEsnmkgQ3XN+1b62lhu4lOzeVU5I2QG7SWFBNoMN3RkEtjBf
	 1ecZ3FSpfQuH7knCarr3LeJ1ZcC/wFQVXouHcinKsZrZWbVPGfQNI//83fi3UAFHHv
	 OSStckRGxH6EabA0UJBj2ydm/G2hn52Mb/8Odmwu6VLngrE8en+2BYTp6doKLx+djJ
	 H+KfDLWG7YiU8fXx/OrpThQHf9oi5qibHmuUwFvTWWix4M3ft7vCDJ+FVZ7atprIg+
	 CdS7dTNjJ+CZQ==
X-Brightmail-Tracker: H4sIAAAAAAAAA+NgFlrLIsWRWlGSWpSXmKPExsViZ8ORqMt8wTj
  F4N8FY4s7P9+xOzB6nNu4gjGAMYo1My8pvyKBNWPntMNMBfN4KubdW8XYwPiOq4uRi0NI4DGj
  xNPX5xkhnGtMEvdvnGHvYuQEcvYwSixoDwOx2QSkJG7c/8/WxcjBISKgJ3H1nyhImFlAReLF7
  x6wcmEBa4lJu86zgtgsAqoSR98uYAaxeQWcJNon3QGzJQQUJKY8fA8VF5Q4OfMJC8QcCYmDL1
  5A1ShKzL7czAJhV0g0Tj/EBGGrSVw9t4l5AiP/LCTts5C0L2BkWsVoVpxaVJZapGuil1SUmZ5
  RkpuYmaOXWKWbqJdaqpuXX1SSoWuol1herJdaXKxXXJmbnJOil5dasokRGIopxQlpOxhb+/7q
  HWKU5GBSEuXt4jJOEeJLyk+pzEgszogvKs1JLT7EKMPBoSTBa3AWKCdYlJqeWpGWmQOMC5i0B
  AePkghv1nmgNG9xQWJucWY6ROoUo6KUOC8HSEIAJJFRmgfXBovFS4yyUsK8jAwMDEI8BalFuZ
  klqPKvGMU5GJWEebcdBprCk5lXAjf9FdBiJqDFXC4GIItLEhFSUg1MUqceKhs/m7/NgsGo8Xh
  z5I6+lfxL7XsnP1L9qqPiFNCWHSOW4FOdzfzU473HFrG/hcqXX+2Z9fXMz/+777r4M5kLWW9K
  sD8irCuy9d+S0gnH3Nq9/lToO3z1/CYuaHhamaMjJbk4Zu+60wseG/dpTMpPLTw8Y+v1xhV70
  uOfGcZq7+5q+nveU/qH2Z+C4g/bv+2YeoXvhxnHnntOJfN2dC2vuDG5P8v9eWvhd/8z8UHSJo
  GaMacuuXtubVY+cig8ViuGxfSl6sy3u+0rTZPq5Tj/zJ58WefbFcWpRyLFPc8JO5/YYCazden
  hF1o1H84o3wnNr5f/8v6+SG//tN+3ps7jzAmY+a9uw/G0m+96lFiKMxINtZiLihMBOnqSUUAD
  AAA=
X-Env-Sender: wangmy@fujitsu.com
X-Msg-Ref: server-21.tower-745.messagelabs.com!1681117187!190683!1
X-Originating-IP: [62.60.8.97]
X-SYMC-ESS-Client-Auth: outbound-route-from=pass
X-StarScan-Received: 
X-StarScan-Version: 9.104.2; banners=-,-,-
X-VirusChecked: Checked
Received: (qmail 17642 invoked from network); 10 Apr 2023 08:59:47 -0000
Received: from unknown (HELO n03ukasimr01.n03.fujitsu.local) (62.60.8.97)
  by server-21.tower-745.messagelabs.com with ECDHE-RSA-AES256-GCM-SHA384 encrypted SMTP; 10 Apr 2023 08:59:47 -0000
Received: from n03ukasimr01.n03.fujitsu.local (localhost [127.0.0.1])
	by n03ukasimr01.n03.fujitsu.local (Postfix) with ESMTP id 5244D1001B5
	for <openembedded-core@lists.openembedded.org>; Mon, 10 Apr 2023 09:59:47 +0100 (BST)
Received: from R01UKEXCASM121.r01.fujitsu.local (R01UKEXCASM121 [10.183.43.173])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-SHA384 (256/256 bits))
	(No client certificate requested)
	by n03ukasimr01.n03.fujitsu.local (Postfix) with ESMTPS id 466161001B0
	for <openembedded-core@lists.openembedded.org>; Mon, 10 Apr 2023 09:59:47 +0100 (BST)
Received: from localhost.localdomain (10.167.225.33) by
 R01UKEXCASM121.r01.fujitsu.local (10.183.43.173) with Microsoft SMTP Server
 (TLS) id 15.0.1497.42; Mon, 10 Apr 2023 09:59:45 +0100
From: <wangmy@fujitsu.com>
To: <openembedded-core@lists.openembedded.org>
CC: Wang Mingyu <wangmy@fujitsu.com>
Subject: [OE-core] [PATCH] mpg123: upgrade 1.31.2 -> 1.31.3
Date: Mon, 10 Apr 2023 16:59:31 +0800
Message-ID: <1681117175-24783-1-git-send-email-wangmy@fujitsu.com>
X-Mailer: git-send-email 1.8.3.1
MIME-Version: 1.0
Content-Type: text/plain
X-Originating-IP: [10.167.225.33]
X-ClientProxiedBy: G08CNEXCHPEKD07.g08.fujitsu.local (10.167.33.80) To
 R01UKEXCASM121.r01.fujitsu.local (10.183.43.173)
X-Virus-Scanned: ClamAV using ClamSMTP
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Mon, 10 Apr 2023 08:59:58 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/179853

From: Wang Mingyu <wangmy@fujitsu.com>

Changelog:
=========
- build:
-- Fix --disable-8bit.
-- Fall back to generic decoder if no yasm for MSVC (bug 346).
-- Fix some pedantic compiler warnings, avoid breaking libtool wrappers.
- mpg123:
-- Fix verbose position printout for new resampling outside libmpg123 (where
   output rate differs from decoding rate).
- libsyn123:
-- Fix reconfiguration of resampler to avoid double free when reducing
   decimator stages to zero (bug 350).

Signed-off-by: Wang Mingyu <wangmy@fujitsu.com>
---
 .../mpg123/{mpg123_1.31.2.bb => mpg123_1.31.3.bb}               | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)
 rename meta/recipes-multimedia/mpg123/{mpg123_1.31.2.bb => mpg123_1.31.3.bb} (96%)

diff --git a/meta/recipes-multimedia/mpg123/mpg123_1.31.2.bb b/meta/recipes-multimedia/mpg123/mpg123_1.31.3.bb
similarity index 96%
rename from meta/recipes-multimedia/mpg123/mpg123_1.31.2.bb
rename to meta/recipes-multimedia/mpg123/mpg123_1.31.3.bb
index 0a2d870cfa..90f285872f 100644
--- a/meta/recipes-multimedia/mpg123/mpg123_1.31.2.bb
+++ b/meta/recipes-multimedia/mpg123/mpg123_1.31.3.bb
@@ -10,7 +10,7 @@ LICENSE = "LGPL-2.1-only"
 LIC_FILES_CHKSUM = "file://COPYING;md5=e7b9c15fcfb986abb4cc5e8400a24169"
 
 SRC_URI = "https://www.mpg123.de/download/${BP}.tar.bz2"
-SRC_URI[sha256sum] = "b17f22905e31f43b6b401dfdf6a71ed11bb7d056f68db449d70b9f9ae839c7de"
+SRC_URI[sha256sum] = "1ca77d3a69a5ff845b7a0536f783fee554e1041139a6b978f6afe14f5814ad1a"
 
 UPSTREAM_CHECK_REGEX = "mpg123-(?P<pver>\d+(\.\d+)+)\.tar"
 
-- 
2.34.1


