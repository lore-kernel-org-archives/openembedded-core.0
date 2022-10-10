Return-Path: <wangmy@fujitsu.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 47313C433F5
	for <webhook@archiver.kernel.org>; Mon, 10 Oct 2022 08:39:13 +0000 (UTC)
Received: from mail3.bemta32.messagelabs.com (mail3.bemta32.messagelabs.com
 [195.245.230.82])
 by mx.groups.io with SMTP id smtpd.web10.4172.1665391143350291607
 for <openembedded-core@lists.openembedded.org>;
 Mon, 10 Oct 2022 01:39:03 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@fujitsu.com header.s=170520fj header.b=RULEZIDr;
 spf=pass (domain: fujitsu.com, ip: 195.245.230.82,
 mailfrom: wangmy@fujitsu.com)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=fujitsu.com;
	s=170520fj; t=1665391141; i=@fujitsu.com;
	bh=EN39Ikz5JfW5hsqz8aGN+jXac/2Bu9xM3D1d2/YqG3c=;
	h=From:To:CC:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type;
	b=RULEZIDrmfhHEAr+2T2vn/E6M4RxtzUdZIX+hMLj3r7SsKNFchpDZO76eR4cXB2H+
	 YkEj8qIj/Wq23vzuGMJ6Nr2ejHbLfSOgi9tfYSY1a4AiWbcjZCLUm58fw7XhKZIU5C
	 5+NGa5g4PcMdP87lnBqeyMcKC3HAiYHuiS6Yd6jp1pb9AGTEo0YlQbTETeZ+ayEm10
	 hsZpYeojjlxdXJKVZu0va0HclzmLFsBZCB/NH2w0rSXnfS+8TDzUkAuhiSL+Y1VwwI
	 3GOvV8YUnFgnm6vKeIbbMdulC4M0pVgx/p778hXrE8L+EuRpTnUAophproToqZf+jO
	 1H3aqZR+vejDg==
X-Brightmail-Tracker: H4sIAAAAAAAAA+NgFrrNIsWRWlGSWpSXmKPExsViZ8ORpKt6yzn
  Z4NNrPos7P9+xOzB6nNu4gjGAMYo1My8pvyKBNWPb727WgndCFd9u9DE1MF4V6GLk4hASeMAo
  cenwL2YI5zKTxKXPH5kgnD2MEvcv7QFyODnYBNQkpt+6wdrFyMEhIqAncfWfKEiYWUBF4sXvH
  nYQW1jAWuLeuZssIDaLgKrEmvmLwOK8Ao4S6w8uYQWxJQQUJKY8fM8MYnMKOEn8fLoKzBYCqt
  m58wojRL2gxMmZT1gg5ktIHHzxghmiV1Fi9uVmFgi7QmLWrDYmCFtN4uq5TcwTGAVnIWmfhaR
  9ASPTKkbLpKLM9IyS3MTMHF1DAwNdQ0NTXRNdS2O9xCrdRL3UUt3y1OISXUO9xPJivdTiYr3i
  ytzknBS9vNSSTYzAEE4pZondwbi176feIUZJDiYlUV6DQ87JQnxJ+SmVGYnFGfFFpTmpxYcYZ
  Tg4lCR4n9wAygkWpaanVqRl5gDjCSYtwcGjJML74CJQmre4IDG3ODMdInWK0Zjj6pUre5k5Zn
  5tO8AsxJKXn5cqJc7bfhOoVACkNKM0D24QLM4vMcpKCfMyMjAwCPEUpBblZpagyr9iFOdgVBL
  mvXQFaApPZl4J3L5XQKcwAZ1y8qoTyCkliQgpqQamTbc23+uoM/50vuSXY8LL56YMOW4hnr1b
  Pib+OC35b/+qC1mPdRe/uabxuulDvd2jln4Fgf2rKjYk9bk/DSm0WNgh/XQa29yvc94rr+t9w
  pKnJltQzu8YejvAZnLZhC1Vh8RP/N/1fPvhaAbbmt1bfOJDjiaKLbif9COwrs6eOXq5aPenYp
  PLyxr7ZNX+bVXxur7AVDyEY1pnnia7IcevA1+To5be+bU1SE/tdtCc0NRXG3++SbgyQSG+nn2
  yvnwey5zp5xNtJyU41ret4DppE/OxWqLiVcT5lqKLQjnXlWN2HHU06tyZ8yLnTvBCPZEzkY5/
  ar5Gl/re5S5uvGAiU18c/OysvK3v8QTpjk1KLMUZiYZazEXFiQBbiXb4bgMAAA==
X-Env-Sender: wangmy@fujitsu.com
X-Msg-Ref: server-3.tower-585.messagelabs.com!1665391141!188387!1
X-Originating-IP: [62.60.8.98]
X-SYMC-ESS-Client-Auth: outbound-route-from=pass
X-StarScan-Received: 
X-StarScan-Version: 9.87.3; banners=-,-,-
X-VirusChecked: Checked
Received: (qmail 31239 invoked from network); 10 Oct 2022 08:39:01 -0000
Received: from unknown (HELO n03ukasimr03.n03.fujitsu.local) (62.60.8.98)
  by server-3.tower-585.messagelabs.com with ECDHE-RSA-AES256-GCM-SHA384
 encrypted SMTP; 10 Oct 2022 08:39:01 -0000
Received: from n03ukasimr03.n03.fujitsu.local (localhost [127.0.0.1])
	by n03ukasimr03.n03.fujitsu.local (Postfix) with ESMTP id DAD751AC
	for <openembedded-core@lists.openembedded.org>;
 Mon, 10 Oct 2022 09:39:00 +0100 (BST)
Received: from R01UKEXCASM126.r01.fujitsu.local (R01UKEXCASM126
 [10.183.43.178])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-SHA384 (256/256 bits))
	(No client certificate requested)
	by n03ukasimr03.n03.fujitsu.local (Postfix) with ESMTPS id D00B61AB
	for <openembedded-core@lists.openembedded.org>;
 Mon, 10 Oct 2022 09:39:00 +0100 (BST)
Received: from localhost.localdomain (10.167.225.33) by
 R01UKEXCASM126.r01.fujitsu.local (10.183.43.178) with Microsoft SMTP Server
 (TLS) id 15.0.1497.32; Mon, 10 Oct 2022 09:38:59 +0100
From: Wang Mingyu <wangmy@fujitsu.com>
To: <openembedded-core@lists.openembedded.org>
CC: Wang Mingyu <wangmy@fujitsu.com>
Subject: [OE-core] [PATCH] mtools: upgrade 4.0.40 -> 4.0.41
Date: Mon, 10 Oct 2022 16:38:33 +0800
Message-ID: <1665391113-8040-5-git-send-email-wangmy@fujitsu.com>
X-Mailer: git-send-email 1.8.3.1
In-Reply-To: <1665391113-8040-1-git-send-email-wangmy@fujitsu.com>
References: <1665391113-8040-1-git-send-email-wangmy@fujitsu.com>
MIME-Version: 1.0
Content-Type: text/plain
X-Originating-IP: [10.167.225.33]
X-ClientProxiedBy: G08CNEXCHPEKD07.g08.fujitsu.local (10.167.33.80) To
 R01UKEXCASM126.r01.fujitsu.local (10.183.43.178)
X-Virus-Scanned: ClamAV using ClamSMTP
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Mon, 10 Oct 2022 08:39:13 -0000
X-Groupsio-URL: 
 https://lists.openembedded.org/g/openembedded-core/message/171562

disable-hardcoded-configs.patch
refreshed for new version

Changelo:
=========
- Made it possible again to have FAT32 filesystems with less
  than 0xfff5 clusters
- Make FAT32 entries 0 and 1 match what windows 10 does
- Misc source code and configure script cleanup

Signed-off-by: Wang Mingyu <wangmy@fujitsu.com>
---
 .../mtools/mtools/disable-hardcoded-configs.patch           | 6 +++---
 .../mtools/{mtools_4.0.40.bb => mtools_4.0.41.bb}           | 2 +-
 2 files changed, 4 insertions(+), 4 deletions(-)
 rename meta/recipes-devtools/mtools/{mtools_4.0.40.bb => mtools_4.0.41.bb} (93%)

diff --git a/meta/recipes-devtools/mtools/mtools/disable-hardcoded-configs.patch b/meta/recipes-devtools/mtools/mtools/disable-hardcoded-configs.patch
index 8f46174a5b..2d42fa531a 100644
--- a/meta/recipes-devtools/mtools/mtools/disable-hardcoded-configs.patch
+++ b/meta/recipes-devtools/mtools/mtools/disable-hardcoded-configs.patch
@@ -1,4 +1,4 @@
-From 3a05dc2c0acff1713dd44cef5e9f328f0706eb3e Mon Sep 17 00:00:00 2001
+From c496cad7b7a84e599f521f289648373df9fad80f Mon Sep 17 00:00:00 2001
 From: Ed Bartosh <ed.bartosh@linux.intel.com>
 Date: Tue, 13 Jun 2017 14:55:52 +0300
 Subject: [PATCH] Disabled reading host configs.
@@ -12,10 +12,10 @@ Signed-off-by: Ed Bartosh <ed.bartosh@linux.intel.com>
  1 file changed, 8 deletions(-)
 
 diff --git a/config.c b/config.c
-index 630f99d..07dbf53 100644
+index 8c5fa83..346048b 100644
 --- a/config.c
 +++ b/config.c
-@@ -834,14 +834,6 @@ void read_config(void)
+@@ -843,14 +843,6 @@ void read_config(void)
  	memcpy(devices, const_devices,
  	       nr_const_devices*sizeof(struct device));
  
diff --git a/meta/recipes-devtools/mtools/mtools_4.0.40.bb b/meta/recipes-devtools/mtools/mtools_4.0.41.bb
similarity index 93%
rename from meta/recipes-devtools/mtools/mtools_4.0.40.bb
rename to meta/recipes-devtools/mtools/mtools_4.0.41.bb
index 200c7c7681..29e7427a10 100644
--- a/meta/recipes-devtools/mtools/mtools_4.0.40.bb
+++ b/meta/recipes-devtools/mtools/mtools_4.0.41.bb
@@ -24,7 +24,7 @@ RRECOMMENDS:${PN}:libc-glibc = "\
 	glibc-gconv-ibm866 \
 	glibc-gconv-ibm869 \
 	"
-SRC_URI[sha256sum] = "a22fca42354011dd2293a7f51f228b46ebbd802e7740b0975912afecb79d5df4"
+SRC_URI[sha256sum] = "2542152264fb3eff7ed70662abf4f4eef8133bc37d0b7a686c240df2b5f80a13"
 
 SRC_URI = "${GNU_MIRROR}/mtools/mtools-${PV}.tar.bz2 \
            file://mtools-makeinfo.patch \
-- 
2.25.1


