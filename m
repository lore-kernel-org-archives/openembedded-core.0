Return-Path: <zhengrq.fnst@fujitsu.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 1F460C38A2D
	for <webhook@archiver.kernel.org>; Wed,  6 Apr 2022 16:33:20 +0000 (UTC)
Received: from mail3.bemta32.messagelabs.com (mail3.bemta32.messagelabs.com
 [195.245.230.17])
 by mx.groups.io with SMTP id smtpd.web12.7816.1649247633434583857
 for <openembedded-core@lists.openembedded.org>;
 Wed, 06 Apr 2022 05:20:33 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@fujitsu.com header.s=170520fj header.b=K4h+RhOw;
 spf=pass (domain: fujitsu.com, ip: 195.245.230.17,
 mailfrom: zhengrq.fnst@fujitsu.com)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=fujitsu.com;
	s=170520fj; t=1649247631; i=@fujitsu.com;
	bh=h5gIjRmseq4nWLHA+FHwhar6CtzGSIxygHEmhqZ4k9U=;
	h=From:To:Subject:Date:Message-ID:MIME-Version:Content-Type;
	b=K4h+RhOw98yni1ryTXxdoWRUQuA0F4BEuJD7pqEJKZxv9qLIW0eBzI7zNOcwi7GPF
	 bMgAZTWQAc+a8GQl6yw3WUcEndE61D49lN2u426I93oD+pigJrajNFkAreWtwn+Iwf
	 3WCtmV2hH71b1kE/zwyNFlC8Y/hLf+eQ/1mPsquucP7I2wMWx9XOtBDEggWp97AzcS
	 3FSFnAdCvaAFoDvUz5qovi9asJrOBZrtvy8SzRn/pxL/GBsSi8L3KQb++uhWyLknyZ
	 cCf0I+ryw+2iRcMQXJ2ayFLWUSqy8qMI1uzyryQa+MmsBhJFpUpWsf/pf1aYcYrSPR
	 tmaTW9fzwdhCQ==
X-Brightmail-Tracker: H4sIAAAAAAAAA+NgFlrMIsWRWlGSWpSXmKPExsViZ8ORqNvf6pt
  ksOiPkMWdn+/YHRg9zm1cwRjAGMWamZeUX5HAmvFz5Sv2gg1CFbe3HmFqYNwg0MXIySEk8JhR
  YuLP+i5GLiD7PJPEy5ZTzBDOfkaJ3xNeMIJUsQnoSrz4sZili5GDQ0RAT+LqP1GQsLCAhcTuB
  SD1nBwsAioSKz4fZwMp4RVwl5jUmQgSlhBQkJjy8D1YCa+AoMTJmU9YQGxmAQmJgy9eMIOUSw
  goSsyeLg9RXiHx+vAlZghbTeLquU3MExj5ZiHpnoWkewEj0ypGq6SizPSMktzEzBxdQwMDXUN
  DU10gaWSsl1ilm6iXWqpbnlpcomuol1herJdaXKxXXJmbnJOil5dasokRGHYpxQzVOxj/9/7U
  O8QoycGkJMq7v9w3SYgvKT+lMiOxOCO+qDQntfgQowwHh5IEr3wTUE6wKDU9tSItMwcYAzBpC
  Q4eJRFerRqgNG9xQWJucWY6ROoUo6KUOO/bZqCEAEgiozQPrg0Wd5cYZaWEeRkZGBiEeApSi3
  IzS1DlXzGKczAqCfNytgBN4cnMK4Gb/gpoMRPQ4ndnPEEWlyQipKQamJw/iFXnW61PejD75tq
  U2+cj99zXXLbnZInlVpH5EssWfDh1ceuFLeLyDYc5xX/cM3Sq2XYoZ7om/+ro5lyPazUKVyMK
  jLvF3Nl4Vn72YHG5dqpy58rtKc1ctdzz/65fL2WR4GqTcW/ne4Y5J3wDjE7Mvli9P2ub2a97n
  kk8hROn3TRf0bX4dN+/8/7+j2a75hw79fBKQFPr4ZX77aVmcm+xTJrhY2/w+wTbpwUflO/f+R
  omsEsnIMC62SViRUba+q3bNmvetH60b+u+D/Nu/f+09sy6+kmdwROOW8SZTqia1nF85sRld6N
  KdkZzrd80/+CXsgTvyGolFd08y+8XF/yao/Yz8fXczju3PFw55Ur3KLEUZyQaajEXFScCAIMm
  RTo2AwAA
X-Env-Sender: zhengrq.fnst@fujitsu.com
X-Msg-Ref: server-7.tower-585.messagelabs.com!1649247631!33948!1
X-Originating-IP: [62.60.8.97]
X-SYMC-ESS-Client-Auth: outbound-route-from=pass
X-StarScan-Received: 
X-StarScan-Version: 9.85.5; banners=-,-,-
X-VirusChecked: Checked
Received: (qmail 3089 invoked from network); 6 Apr 2022 12:20:31 -0000
Received: from unknown (HELO n03ukasimr01.n03.fujitsu.local) (62.60.8.97)
  by server-7.tower-585.messagelabs.com with ECDHE-RSA-AES256-GCM-SHA384
 encrypted SMTP; 6 Apr 2022 12:20:31 -0000
Received: from n03ukasimr01.n03.fujitsu.local (localhost [127.0.0.1])
	by n03ukasimr01.n03.fujitsu.local (Postfix) with ESMTP id D36FE100191
	for <openembedded-core@lists.openembedded.org>;
 Wed,  6 Apr 2022 13:20:30 +0100 (BST)
Received: from R01UKEXCASM126.r01.fujitsu.local (unknown [10.183.43.178])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-SHA384 (256/256 bits))
	(No client certificate requested)
	by n03ukasimr01.n03.fujitsu.local (Postfix) with ESMTPS id B4956100181
	for <openembedded-core@lists.openembedded.org>;
 Wed,  6 Apr 2022 13:20:30 +0100 (BST)
Received: from CentOS7.g08.fujitsu.local (10.167.225.35) by
 R01UKEXCASM126.r01.fujitsu.local (10.183.43.178) with Microsoft SMTP Server
 (TLS) id 15.0.1497.32; Wed, 6 Apr 2022 13:20:09 +0100
From: zhengrq.fnst <zhengrq.fnst@fujitsu.com>
To: <openembedded-core@lists.openembedded.org>
Subject: [OE-core] [PATCH] ethtool: upgrade 5.16 -> 5.17
Date: Wed, 6 Apr 2022 20:19:20 +0800
Message-ID: <1649247560-1285-1-git-send-email-zhengrq.fnst@fujitsu.com>
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
 <openembedded-core@lists.openembedded.org>; Wed, 06 Apr 2022 16:33:20 -0000
X-Groupsio-URL: 
 https://lists.openembedded.org/g/openembedded-core/message/164079

avoid_parallel_tests.patch
refreshed for new version.

Signed-off-by: Zheng Ruoqin <zhengrq.fnst@fujitsu.com>
---
 .../ethtool/ethtool/avoid_parallel_tests.patch              | 6 +++---
 .../ethtool/{ethtool_5.16.bb => ethtool_5.17.bb}            | 2 +-
 2 files changed, 4 insertions(+), 4 deletions(-)
 rename meta/recipes-extended/ethtool/{ethtool_5.16.bb => ethtool_5.17.bb} (93%)

diff --git a/meta/recipes-extended/ethtool/ethtool/avoid_parallel_tests.patch b/meta/recipes-extended/ethtool/ethtool/avoid_parallel_tests.patch
index 034dc92444..52d2a93449 100644
--- a/meta/recipes-extended/ethtool/ethtool/avoid_parallel_tests.patch
+++ b/meta/recipes-extended/ethtool/ethtool/avoid_parallel_tests.patch
@@ -1,4 +1,4 @@
-From d98b1e29b89962954690e6a8ddfdd80276407ce7 Mon Sep 17 00:00:00 2001
+From ef2ad68becea77dfdbd5a344e30b3700cc440c0f Mon Sep 17 00:00:00 2001
 From: Tudor Florea <tudor.florea@enea.com>
 Date: Wed, 28 May 2014 18:59:54 +0200
 Subject: [PATCH] ethtool: use serial-tests config needed by ptest.
@@ -15,11 +15,11 @@ Upstream-Status: Inappropriate
  1 file changed, 1 insertion(+), 1 deletion(-)
 
 diff --git a/configure.ac b/configure.ac
-index 8fc93c8..94ee28d 100644
+index 7a9b5b9..dc8ae35 100644
 --- a/configure.ac
 +++ b/configure.ac
 @@ -2,7 +2,7 @@ dnl Process this file with autoconf to produce a configure script.
- AC_INIT(ethtool, 5.16, netdev@vger.kernel.org)
+ AC_INIT(ethtool, 5.17, netdev@vger.kernel.org)
  AC_PREREQ(2.52)
  AC_CONFIG_SRCDIR([ethtool.c])
 -AM_INIT_AUTOMAKE([gnu subdir-objects])
diff --git a/meta/recipes-extended/ethtool/ethtool_5.16.bb b/meta/recipes-extended/ethtool/ethtool_5.17.bb
similarity index 93%
rename from meta/recipes-extended/ethtool/ethtool_5.16.bb
rename to meta/recipes-extended/ethtool/ethtool_5.17.bb
index 5dca03d082..61032d4836 100644
--- a/meta/recipes-extended/ethtool/ethtool_5.16.bb
+++ b/meta/recipes-extended/ethtool/ethtool_5.17.bb
@@ -11,7 +11,7 @@ SRC_URI = "${KERNELORG_MIRROR}/software/network/ethtool/ethtool-${PV}.tar.gz \
            file://avoid_parallel_tests.patch \
            "
 
-SRC_URI[sha256sum] = "4160fa127d75d5a6ebd5e871118486ac730dea2f28b2f1ad40fd1ed3d0d369e0"
+SRC_URI[sha256sum] = "3e32735d13aa19e2be32d3528ef8a135fc99782950ab3fa602198e72992e9450"
 
 UPSTREAM_CHECK_URI = "https://www.kernel.org/pub/software/network/ethtool/"
 
-- 
2.25.1


