Return-Path: <xuhuan.fnst@fujitsu.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 6F098C46467
	for <webhook@archiver.kernel.org>; Thu,  7 Apr 2022 15:41:14 +0000 (UTC)
Received: from mail1.bemta32.messagelabs.com (mail1.bemta32.messagelabs.com
 [195.245.230.66])
 by mx.groups.io with SMTP id smtpd.web09.3525.1649312349660091875
 for <openembedded-core@lists.openembedded.org>;
 Wed, 06 Apr 2022 23:19:10 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@fujitsu.com header.s=170520fj header.b=LwBjVhvS;
 spf=pass (domain: fujitsu.com, ip: 195.245.230.66,
 mailfrom: xuhuan.fnst@fujitsu.com)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=fujitsu.com;
	s=170520fj; t=1649312347; i=@fujitsu.com;
	bh=ioV5Sq2204MzXI58dcu+Epr1UbbiaLQ6VvS6LRFUwQU=;
	h=From:To:CC:Subject:Date:Message-ID:MIME-Version:Content-Type;
	b=LwBjVhvSvfNKdd645MrVG6xdrIFZOJkdoY9BKknm9hKQ4WtzeLRhZYSLNb7zrrcg9
	 Cp3XK6/3RpaG6J036Uk8DqXChsuJStmsqcr5UKugvA35Ec1MXEgHMR7gyDyZ+n/8Fm
	 z0+pGQWxOEF71cH9lTFLNb00wGEgB+UbF/bPva8GxEYnMq7mjgUPEjRqee18CdYy1s
	 UBhjda83zIQ2MVxih1XlC1Tt9/Pb9Uwpqfj+UROPnlblgCkw640NC2OTY2POsrGYQl
	 E+ORAZqaKibBucvNyzXQf6GzA9mhPXCO2fcQuNp9ZAx7zpDrrsHMbmLz0C+UPXl3zU
	 +54LNvYeqU/SQ==
X-Brightmail-Tracker: H4sIAAAAAAAAA+NgFtrIIsWRWlGSWpSXmKPExsViZ8MxSTe6yS/
  JYOMdfos7P9+xOzB6nNu4gjGAMYo1My8pvyKBNeP18pNMBW84K/bfuc/YwNjO2cXIxSEk8JhR
  4tq2uSwQznkmiUvNl5ghnBOMErOvbQdyODnYBNQlHt98zdjFyMEhIqAncfWfKEiYWUBVovviG
  nYQW1jAVeLN7CNg5SwCKhLtN78ygdi8Au4Sn39eAKuREFCQmPLwPTNEXFDi5MwnLBBzJCQOvn
  jBDFGjJHFixUcmCLtC4vXhS1BxNYmr5zYxT2Dkn4WkfRaS9gWMTKsYLZOKMtMzSnITM3N0DQ0
  MdA0NTXWNdS3M9BKrdBP1Ukt1y1OLS3QN9RLLi/VSi4v1iitzk3NS9PJSSzYxAkMypZg5bAfj
  n96feocYJTmYlER5Wev8koT4kvJTKjMSizPii0pzUosPMcpwcChJ8B5qAMoJFqWmp1akZeYA4
  wMmLcHBoyTCqwyS5i0uSMwtzkyHSJ1iVJQS5/0GkhAASWSU5sG1wWLyEqOslDAvIwMDgxBPQW
  pRbmYJqvwrRnEORiVh3j0gU3gy80rgpr8CWswEtLjuoC/I4pJEhJRUA5P7MdPeOO+HQqutXt5
  w8WhLFOb0nx65J3CpS8e3FtutMz5Pva10Z4rUS7/PH6Z5K7223fD8w+cLsX8nNPad2nv11NS4
  jXzMvuuL2MtK10qb1pys/+/UnOFWkpBSP0tq/f++w10nPZ66nRYzzRDeUrzPbe/rlPpHlnLWB
  37LfHOPfGEetMZgxoOf0akvvm96Nb+q8FpIktfdRzaJbC+Xxiq2/3E5dvvp4gcTsmf26t2Yty
  6xx+Qtq29yXT1/AyeTIp/yhkPe+SJbDp7Jylq3T22xPKNd17mjAR76Zo8kvcwn+t4T5HI5HBR
  WxyvK9nJt5gd+1Tt9N/8+s3svez3FjNNxY+vm7L9TPyyaMYMr1FGJpTgj0VCLuag4EQCA5yvd
  RAMAAA==
X-Env-Sender: xuhuan.fnst@fujitsu.com
X-Msg-Ref: server-11.tower-587.messagelabs.com!1649312346!91620!1
X-Originating-IP: [62.60.8.146]
X-SYMC-ESS-Client-Auth: outbound-route-from=pass
X-StarScan-Received: 
X-StarScan-Version: 9.85.5; banners=-,-,-
X-VirusChecked: Checked
Received: (qmail 5147 invoked from network); 7 Apr 2022 06:19:07 -0000
Received: from unknown (HELO n03ukasimr02.n03.fujitsu.local) (62.60.8.146)
  by server-11.tower-587.messagelabs.com with ECDHE-RSA-AES256-GCM-SHA384
 encrypted SMTP; 7 Apr 2022 06:19:07 -0000
Received: from n03ukasimr02.n03.fujitsu.local (localhost [127.0.0.1])
	by n03ukasimr02.n03.fujitsu.local (Postfix) with ESMTP id C344D100441
	for <openembedded-core@lists.openembedded.org>;
 Thu,  7 Apr 2022 07:19:06 +0100 (BST)
Received: from R01UKEXCASM126.r01.fujitsu.local (unknown [10.183.43.178])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-SHA384 (256/256 bits))
	(No client certificate requested)
	by n03ukasimr02.n03.fujitsu.local (Postfix) with ESMTPS id B6413100461
	for <openembedded-core@lists.openembedded.org>;
 Thu,  7 Apr 2022 07:19:06 +0100 (BST)
Received: from localhost.localdomain.localdomain (10.167.225.131) by
 R01UKEXCASM126.r01.fujitsu.local (10.183.43.178) with Microsoft SMTP Server
 (TLS) id 15.0.1497.32; Thu, 7 Apr 2022 07:18:44 +0100
From: XU Huan <xuhuan.fnst@fujitsu.com>
To: <openembedded-core@lists.openembedded.org>
CC: Xu Huan <xuhuan.fnst@fujitsu.com>
Subject: [OE-core] [PATCH] python3-dbusmock: upgrade 0.27.3 -> 0.27.5
Date: Thu, 7 Apr 2022 14:19:12 +0800
Message-ID: <1649312356-25963-1-git-send-email-xuhuan.fnst@fujitsu.com>
X-Mailer: git-send-email 1.8.3.1
MIME-Version: 1.0
Content-Type: text/plain
X-Originating-IP: [10.167.225.131]
X-ClientProxiedBy: G08CNEXCHPEKD08.g08.fujitsu.local (10.167.33.83) To
 R01UKEXCASM126.r01.fujitsu.local (10.183.43.178)
X-Virus-Scanned: ClamAV using ClamSMTP
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Thu, 07 Apr 2022 15:41:14 -0000
X-Groupsio-URL: 
 https://lists.openembedded.org/g/openembedded-core/message/164099

From: Xu Huan <xuhuan.fnst@fujitsu.com>

Changelog:
=========
bluez and accountsservice templates: Drop default arguments from D-Bus methods

Signed-off-by: Xu Huan <xuhuan.fnst@fujitsu.com>
---
 .../{python3-dbusmock_0.27.3.bb => python3-dbusmock_0.27.5.bb}  | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)
 rename meta/recipes-devtools/python/{python3-dbusmock_0.27.3.bb => python3-dbusmock_0.27.5.bb} (83%)

diff --git a/meta/recipes-devtools/python/python3-dbusmock_0.27.3.bb b/meta/recipes-devtools/python/python3-dbusmock_0.27.5.bb
similarity index 83%
rename from meta/recipes-devtools/python/python3-dbusmock_0.27.3.bb
rename to meta/recipes-devtools/python/python3-dbusmock_0.27.5.bb
index 5febdae1bd..852d1555be 100644
--- a/meta/recipes-devtools/python/python3-dbusmock_0.27.3.bb
+++ b/meta/recipes-devtools/python/python3-dbusmock_0.27.5.bb
@@ -4,7 +4,7 @@ HOMEPAGE = "https://pypi.org/project/python-dbusmock/"
 LICENSE = "GPL-3.0-only"
 LIC_FILES_CHKSUM = "file://COPYING;md5=e6a600fd5e1d9cbde2d983680233ad02"
 
-SRC_URI[sha256sum] = "24feaa524e0631854a7f0529ef757c1e4c542adef89cf04e1d4248bc512a006f"
+SRC_URI[sha256sum] = "0bff30d8d01e7eef491f75d359c87765abba7001307fa8fed19cb59f06ed3c2a"
 
 PYPI_PACKAGE = "python-dbusmock"
 
-- 
2.25.1


