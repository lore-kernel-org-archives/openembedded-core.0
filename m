Return-Path: <wangmy@fujitsu.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 5ED9BC433EF
	for <webhook@archiver.kernel.org>; Tue, 16 Nov 2021 01:29:24 +0000 (UTC)
Received: from mail3.bemta25.messagelabs.com (mail3.bemta25.messagelabs.com
 [195.245.230.83])
 by mx.groups.io with SMTP id smtpd.web11.3831.1637026160251165897
 for <openembedded-core@lists.openembedded.org>;
 Mon, 15 Nov 2021 17:29:21 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@fujitsu.com header.s=170520fj header.b=VWbeMiom;
 spf=pass (domain: fujitsu.com, ip: 195.245.230.83,
 mailfrom: wangmy@fujitsu.com)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=fujitsu.com;
	s=170520fj; t=1637026158; i=@fujitsu.com;
	bh=fjvpp3SQOv3H87fGFvO0xHuWV1Qn2GooMkFAG9x+fxw=;
	h=From:To:CC:Subject:Date:Message-ID:MIME-Version:Content-Type;
	b=VWbeMiom7ihI8jeZVyLpUf2nt0VdgV9sTVcsUbl/Bep9yX3wDLIMOaTPzkr3Rxt7h
	 Jxm9Z9YFsw+5JexvvgH5Zcu6KXPwosENrdS4msEVfH5SuT04M4AlgaT3XDScFqdqe4
	 NlZmvZfYJ/SW5VlFnHHh9Q/bNqLKryW+UuXfrkhHm9c5uX6/iqCNld7uWrSy38nFYm
	 YRNHgAujd0ACKpIMgJZTApBiEAL4wO7jAB7vEn3Um6EGUY1V6QKXWwZxDw09u8Fdzf
	 xahX4rvo+3ba0dOXQfzide1tck+OKw7Yd79Pv4gvOrQU7aLrGqbOVRwI/xoMjPxNQM
	 scWO4aThxb5zA==
Received: from [100.112.196.154] (using TLSv1.2 with cipher
 DHE-RSA-AES256-GCM-SHA384 (256 bits))
	by server-3.bemta.az-b.eu-west-1.aws.symcld.net id 85/AC-09147-D6903916;
 Tue, 16 Nov 2021 01:29:17 +0000
X-Brightmail-Tracker: H4sIAAAAAAAAA+NgFlrPIsWRWlGSWpSXmKPExsViZ8ORqJvLOTn
  R4MBEKYs7P9+xOzB6nNu4gjGAMYo1My8pvyKBNePW6+WMBYv4KrpP32RpYHzP08XIxSEk8JhR
  4tf5p0wQznkmiZUPr0E5Jxgleg7NYuli5ORgE1CTmH7rBmsXIweHiICexNV/oiBhZgEViRe/e
  9hBbGEBa4k3Ez+zg5SwCKhK7JmnBxLmFXCSeDxpNiOILSGgIDHl4XtmiLigxMmZT1ggxkhIHH
  zxghmiRlFi9uVmFgi7QmLWrDYmCFtN4uq5TcwTGPlnIWmfhaR9ASPTKkaLpKLM9IyS3MTMHF1
  DAwNdQ0MjXUNLc11DY3O9xCrdJL3UUt3y1OISXUO9xPJiveLK3OScFL281JJNjMBwTCk42rmD
  8derD3qHGCU5mJREeeMWTUoU4kvKT6nMSCzOiC8qzUktPsQow8GhJMGrzjo5UUiwKDU9tSItM
  wcYGzBpCQ4eJRHePjagNG9xQWJucWY6ROoUo6KUOK8SB1BCACSRUZoH1waLx0uMslLCvIwMDA
  xCPAWpRbmZJajyrxjFORiVhHmtQKbwZOaVwE1/BbSYCWix/b1+kMUliQgpqQYmC49Cof1S/1R
  PnaybN5erot3t4vYk6yvvK98/SmbwlfviYhez+8WXmZ2xrjEGMmWGD5RtDdXqV7wUi9K+oXSe
  73tb96VL7N6tAm18jjrfhdS/f7ljtUxE84Vjau/HPoMPJ85+fvp6kl24y7f2uWvOv5JeaNw7Z
  3HrYVPt+NbbfCuyc50kLONvPvq3PlPoXJpgweHLT/dWf59i2+i6sXIbu+L7q0H7nWu2u8jrvv
  q2e/qc1CWZEeyfpXms5z6oXfW1y7N0ot/rx5Jd1fcMFNuvhTzPmrt9smMFSxOX6Mmtdtdcvjy
  Y7ua7deeTV4JHosSKet3aaub8nb26daeleWbs3m182ndSLWarx4b+uO6uxFKckWioxVxUnAgA
  G5DIeUIDAAA=
X-Env-Sender: wangmy@fujitsu.com
X-Msg-Ref: server-19.tower-285.messagelabs.com!1637026157!535826!1
X-Originating-IP: [62.60.8.97]
X-SYMC-ESS-Client-Auth: outbound-route-from=pass
X-StarScan-Received: 
X-StarScan-Version: 9.81.5; banners=-,-,-
X-VirusChecked: Checked
Received: (qmail 19316 invoked from network); 16 Nov 2021 01:29:17 -0000
Received: from unknown (HELO n03ukasimr01.n03.fujitsu.local) (62.60.8.97)
  by server-19.tower-285.messagelabs.com with ECDHE-RSA-AES256-GCM-SHA384
 encrypted SMTP; 16 Nov 2021 01:29:17 -0000
Received: from n03ukasimr01.n03.fujitsu.local (localhost [127.0.0.1])
	by n03ukasimr01.n03.fujitsu.local (Postfix) with ESMTP id E8E6910022F
	for <openembedded-core@lists.openembedded.org>;
 Tue, 16 Nov 2021 01:29:16 +0000 (GMT)
Received: from R01UKEXCASM126.r01.fujitsu.local (unknown [10.183.43.178])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-SHA384 (256/256 bits))
	(No client certificate requested)
	by n03ukasimr01.n03.fujitsu.local (Postfix) with ESMTPS id DD36D100226
	for <openembedded-core@lists.openembedded.org>;
 Tue, 16 Nov 2021 01:29:16 +0000 (GMT)
Received: from localhost.localdomain.localdomain (10.167.225.33) by
 R01UKEXCASM126.r01.fujitsu.local (10.183.43.178) with Microsoft SMTP Server
 (TLS) id 15.0.1497.24; Tue, 16 Nov 2021 01:28:54 +0000
From: Wang Mingyu <wangmy@fujitsu.com>
To: <openembedded-core@lists.openembedded.org>
CC: Wang Mingyu <wangmy@fujitsu.com>
Subject: [OE-core] [PATCH v2] ethtool: upgrade 5.14 -> 5.15
Date: Tue, 16 Nov 2021 09:28:41 +0800
Message-ID: <1637026122-80256-1-git-send-email-wangmy@fujitsu.com>
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
 <openembedded-core@lists.openembedded.org>; Tue, 16 Nov 2021 01:29:24 -0000
X-Groupsio-URL: 
 https://lists.openembedded.org/g/openembedded-core/message/158318

Signed-off-by: Wang Mingyu <wangmy@fujitsu.com>
---
 .../recipes-extended/ethtool/ethtool/avoid_parallel_tests.patch | 2 +-
 .../ethtool/{ethtool_5.14.bb => ethtool_5.15.bb}                | 2 +-
 2 files changed, 2 insertions(+), 2 deletions(-)
 rename meta/recipes-extended/ethtool/{ethtool_5.14.bb => ethtool_5.15.bb} (93%)

diff --git a/meta/recipes-extended/ethtool/ethtool/avoid_parallel_tests.patch b/meta/recipes-extended/ethtool/ethtool/avoid_parallel_tests.patch
index e4abadb05d..0ec3537198 100644
--- a/meta/recipes-extended/ethtool/ethtool/avoid_parallel_tests.patch
+++ b/meta/recipes-extended/ethtool/ethtool/avoid_parallel_tests.patch
@@ -19,7 +19,7 @@ index 6c9453c..7c0f829 100644
 --- a/configure.ac
 +++ b/configure.ac
 @@ -2,7 +2,7 @@ dnl Process this file with autoconf to produce a configure script.
- AC_INIT(ethtool, 5.14, netdev@vger.kernel.org)
+ AC_INIT(ethtool, 5.15, netdev@vger.kernel.org)
  AC_PREREQ(2.52)
  AC_CONFIG_SRCDIR([ethtool.c])
 -AM_INIT_AUTOMAKE([gnu subdir-objects])
diff --git a/meta/recipes-extended/ethtool/ethtool_5.14.bb b/meta/recipes-extended/ethtool/ethtool_5.15.bb
similarity index 93%
rename from meta/recipes-extended/ethtool/ethtool_5.14.bb
rename to meta/recipes-extended/ethtool/ethtool_5.15.bb
index 28a49f4f8a..4192dec300 100644
--- a/meta/recipes-extended/ethtool/ethtool_5.14.bb
+++ b/meta/recipes-extended/ethtool/ethtool_5.15.bb
@@ -11,7 +11,7 @@ SRC_URI = "${KERNELORG_MIRROR}/software/network/ethtool/ethtool-${PV}.tar.gz \
            file://avoid_parallel_tests.patch \
            "
 
-SRC_URI[sha256sum] = "9868604c913e5483000c00d5dcb2bb3169a05252de47f62174702ff19cf6de7a"
+SRC_URI[sha256sum] = "a6a1638192209269ca74a29d73903f28531ebdf0794f3e0bdfdbdee2dc75d98b"
 
 UPSTREAM_CHECK_URI = "https://www.kernel.org/pub/software/network/ethtool/"
 
-- 
2.25.1


