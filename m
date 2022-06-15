Return-Path: <wangmy@fujitsu.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id F23BAC433EF
	for <webhook@archiver.kernel.org>; Wed, 15 Jun 2022 08:16:43 +0000 (UTC)
Received: from mail1.bemta34.messagelabs.com (mail1.bemta34.messagelabs.com
 [195.245.231.2])
 by mx.groups.io with SMTP id smtpd.web10.2053.1655280999921616098
 for <openembedded-core@lists.openembedded.org>;
 Wed, 15 Jun 2022 01:16:40 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@fujitsu.com header.s=170520fj header.b=JMC2wF0o;
 spf=pass (domain: fujitsu.com, ip: 195.245.231.2,
 mailfrom: wangmy@fujitsu.com)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=fujitsu.com;
	s=170520fj; t=1655280998; i=@fujitsu.com;
	bh=RXSYthkc1Qui0pFY9j12r2JxzWD+oRa/K5LKhc5kFB4=;
	h=From:To:CC:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type;
	b=JMC2wF0oiay9pH6CH+VxuwqTLHUarHK+/hv2HEscPfmFAAMrer54D67WuuNlO5AdB
	 /kA06FrzURBmtbrkz5jm+9Uj89ULHmT3xA75dkcwbEtoOOJ+QuSIY5Y+6YHibQFzCM
	 0qE6IuEEH3cfOcQ2DrMc9XkAyPQFBe0fyuOdjfDI+VyHQ44C7vD4Zeuh6Q+1e8YmNc
	 c06A3b93cqCjvCvzJ+g48Tce/8C+xIFPkgTsHwoc9GRDRRWOzYq4f/DOAoo07OItPH
	 Iclez6uzZYSZNyXbqXtNkDTKVwQCLzt88xqD28UlLRiTzDUgfq7+iLsHL9C71witQ9
	 u6CA5o142hISQ==
X-Brightmail-Tracker: H4sIAAAAAAAAA+NgFjrFIsWRWlGSWpSXmKPExsViZ8ORqJs6dWW
  SwfSdyhZ3fr5jd2D0OLdxBWMAYxRrZl5SfkUCa8afrnVsBbPZK3Y/MGpg3M/WxcjFISTwmFFi
  3dObLBDOeSaJPzMaWSGcPYwSv868BcpwcrAJqElMv3UDKMHBISKgJ3H1nyhImFlAReLF7x52E
  FtYwFri+IZbbCA2i4CqxO0pb1hBbF4BR4kF0+Yxg9gSAgoSUx6+B7M5BZwk3syYBdYrBFRzdO
  EiZoh6QYmTM5+wQMyXkDj44gVUr6LE7MvNLBB2hcSMGdvYIGw1iavnNjFPYBSchaR9FpL2BYx
  Mqxitk4oy0zNKchMzc3QNDQx0DQ1NdY2NdQ3NLfUSq3QT9VJLdctTi0t0jfQSy4v1UouL9Yor
  c5NzUvTyUks2MQKDOKVYcfMOxokrf+odYpTkYFIS5VWevDJJiC8pP6UyI7E4I76oNCe1+BCjD
  AeHkgSv6ySgnGBRanpqRVpmDjCiYNISHDxKIrz1IK28xQWJucWZ6RCpU4yKUuK8MZ1ACQGQRE
  ZpHlwbLIovMcpKCfMyMjAwCPEUpBblZpagyr9iFOdgVBLmrZgCNIUnM68EbvoroMVMQIsb960
  AWVySiJCSamBySZkZ8k5/jfae6PZl99wv1HA4KW3S+P+Zr22xjzB70r5FBY3lc/9cf5Et5fYk
  9CajwUc7v9c5k8rLb3lwLH2S0yFaPytG7YPAKq3Zxgs3X83f8ifzxt/Pjowrb2Vc7Tv2mVv5X
  UWjNFfGnym8TdNbrvq8EHL9czWkzq9ScoepsuTeC4seX/sT5CcV9FT40oYbhzNTajpeSa8q53
  njeG3ny5aKPvHEh3dSE/q15KfNEDJh2mq7edPzJWJfCtcye63ZmMon29zAJZr5XECvXi9S6PO
  BwksX3ts0MHFVuDJs+9XzZuN1uUJFVk4BP/Pt8zacW2e8M+qKXkvTVYMdZu8Srr46LG2ycwVf
  hfFj2SAlluKMREMt5qLiRABjZ/IZXQMAAA==
X-Env-Sender: wangmy@fujitsu.com
X-Msg-Ref: server-12.tower-548.messagelabs.com!1655280997!40579!1
X-Originating-IP: [62.60.8.97]
X-SYMC-ESS-Client-Auth: outbound-route-from=pass
X-StarScan-Received: 
X-StarScan-Version: 9.86.7; banners=-,-,-
X-VirusChecked: Checked
Received: (qmail 22205 invoked from network); 15 Jun 2022 08:16:37 -0000
Received: from unknown (HELO n03ukasimr01.n03.fujitsu.local) (62.60.8.97)
  by server-12.tower-548.messagelabs.com with ECDHE-RSA-AES256-GCM-SHA384
 encrypted SMTP; 15 Jun 2022 08:16:37 -0000
Received: from n03ukasimr01.n03.fujitsu.local (localhost [127.0.0.1])
	by n03ukasimr01.n03.fujitsu.local (Postfix) with ESMTP id 2A352100194
	for <openembedded-core@lists.openembedded.org>;
 Wed, 15 Jun 2022 09:16:37 +0100 (BST)
Received: from R01UKEXCASM126.r01.fujitsu.local (unknown [10.183.43.178])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-SHA384 (256/256 bits))
	(No client certificate requested)
	by n03ukasimr01.n03.fujitsu.local (Postfix) with ESMTPS id 11D46100191
	for <openembedded-core@lists.openembedded.org>;
 Wed, 15 Jun 2022 09:16:37 +0100 (BST)
Received: from localhost.localdomain (10.167.225.33) by
 R01UKEXCASM126.r01.fujitsu.local (10.183.43.178) with Microsoft SMTP Server
 (TLS) id 15.0.1497.32; Wed, 15 Jun 2022 09:16:23 +0100
From: Wang Mingyu <wangmy@fujitsu.com>
To: <openembedded-core@lists.openembedded.org>
CC: Wang Mingyu <wangmy@fujitsu.com>
Subject: [OE-core] [PATCH] musl-obstack: upgrade 1.1 -> 1.2
Date: Wed, 15 Jun 2022 16:16:03 +0800
Message-ID: <1655280963-6605-4-git-send-email-wangmy@fujitsu.com>
X-Mailer: git-send-email 1.8.3.1
In-Reply-To: <1655280963-6605-1-git-send-email-wangmy@fujitsu.com>
References: <1655280963-6605-1-git-send-email-wangmy@fujitsu.com>
MIME-Version: 1.0
Content-Type: text/plain
X-Originating-IP: [10.167.225.33]
X-ClientProxiedBy: G08CNEXCHPEKD09.g08.fujitsu.local (10.167.33.85) To
 R01UKEXCASM126.r01.fujitsu.local (10.183.43.178)
X-Virus-Scanned: ClamAV using ClamSMTP
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Wed, 15 Jun 2022 08:16:43 -0000
X-Groupsio-URL: 
 https://lists.openembedded.org/g/openembedded-core/message/166915

Changelog:
=========
Use obstack.c and obstack.h from gcc-10.2.0 libiberty.
Add AC_CONFIG_HEADERS to configure.ac and make ./bootstrap.sh create config.h.in.

Signed-off-by: Wang Mingyu <wangmy@fujitsu.com>
---
 meta/recipes-core/musl/musl-obstack.bb | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/meta/recipes-core/musl/musl-obstack.bb b/meta/recipes-core/musl/musl-obstack.bb
index 4df24c013b..5c95ddbc94 100644
--- a/meta/recipes-core/musl/musl-obstack.bb
+++ b/meta/recipes-core/musl/musl-obstack.bb
@@ -8,8 +8,8 @@ LICENSE = "GPL-2.0-or-later"
 LIC_FILES_CHKSUM = "file://COPYING;md5=3d23e4eef8243efcaab6f0a438078932"
 SECTION = "libs"
 
-PV = "1.1"
-SRCREV = "d2ad66b0df44a4b784956f7f7f2717131ddc05f4"
+PV = "1.2"
+SRCREV = "466f773fe171da427e28be79b9cf48ccfddfb7e2"
 SRC_URI = "git://github.com/pullmoll/musl-obstack;branch=master;protocol=https"
 
 UPSTREAM_CHECK_COMMITS = "1"
-- 
2.25.1


