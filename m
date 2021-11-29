Return-Path: <wangmy@fujitsu.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 0DC3CC433FE
	for <webhook@archiver.kernel.org>; Mon, 29 Nov 2021 09:58:36 +0000 (UTC)
Received: from mail1.bemta26.messagelabs.com (mail1.bemta26.messagelabs.com
 [85.158.142.114])
 by mx.groups.io with SMTP id smtpd.web11.58612.1638179914388573110
 for <openembedded-core@lists.openembedded.org>;
 Mon, 29 Nov 2021 01:58:34 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@fujitsu.com header.s=170520fj header.b=BYmUkOuB;
 spf=pass (domain: fujitsu.com, ip: 85.158.142.114,
 mailfrom: wangmy@fujitsu.com)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=fujitsu.com;
	s=170520fj; t=1638179912; i=@fujitsu.com;
	bh=sTHXpQGawrMyHVySW2x/TIDc6MpCCZZG4lw24HkutgI=;
	h=From:To:CC:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type;
	b=BYmUkOuBm9P+KUwRLzCieMN+/yv8z/sC+ecn6okXPWT6hU/n8uvz8ciRbxLC9BWOA
	 JYR+usWmNpyBN4E8EnR/9uWQHckVrwAaYBg8wSixUVbe8w4ORZ/ibmYSIlopP6XsUr
	 HCWGTHLtnKsQQyyqCDT7qBMR4qA9ksjKliyqMTvR2/1Rgh4DbheCKSuuMnvgig7yq5
	 AyQqIUiAQEuDdf5BhuyFcech1SAXQSzFS4e/LMSb7kDGjP6zXaBF/SbvbuNrB5073/
	 1xw+9MvNEyqWDb7kD9K1kDIa7xFZMegzydDSHoMaRneLASxiPCmTdC7hrI0h9FdS0V
	 23/Pikg+vBQuA==
Received: from [100.113.7.129] (using TLSv1.2 with cipher
 DHE-RSA-AES256-GCM-SHA384 (256 bits))
	by server-3.bemta.az-b.eu-central-1.aws.symcld.net id 6F/4A-30139-844A4A16;
 Mon, 29 Nov 2021 09:58:32 +0000
X-Brightmail-Tracker: H4sIAAAAAAAAA+NgFrrIIsWRWlGSWpSXmKPExsViZ8ORqOu+ZEm
  iwdZpxhZ3fr5jd2D0OLdxBWMAYxRrZl5SfkUCa8a8LR9ZCp5yVsxoPcjawPiPo4uRi0NI4DGj
  xIFFExm7GDmBnPNMEh960yESJxglbt4+zQySYBNQk5h+6wZrFyMHh4iAnsTVf6IgYWYBFYkXv
  3vYQWxhAWeJVae6weawCKhKrFj1G6ycFyh+8kksSFhCQEFiysP3zCBhTgEXiSW7PCG2Okvs+9
  sANoVXQFDi5MwnLBDTJSQOvnjBDNGqKDH7cjMLhF0hMWtWGxOErSZx9dwm5gmMgrOQtM9C0r6
  AkWkVo0VSUWZ6RkluYmaOrqGBga6hobGuGZCll1ilm6SXWqqbnJpXUpQIlNRLLC/WK67MTc5J
  0ctLLdnECAzdlEI2rh2MT19/0DvEKMnBpCTKu75nSaIQX1J+SmVGYnFGfFFpTmrxIUYZDg4lC
  d6ChUA5waLU9NSKtMwcYBzBpCU4eJREeG+DpHmLCxJzizPTIVKnGHU5Xrf83MEsxJKXn5cqJc
  7rshioSACkKKM0D24ELKYvMcpKCfMyMjAwCPEUpBblZpagyr9iFOdgVBLm1ZsCNIUnM68EbtM
  roCOYgI54u3QxyBEliQgpqQYmu9WvbGvDejQ/nHL/yMj/Pu6Cx0n7fUelfTYt6/22KUN6Y/PN
  yDXcEV+2cGhoMXx1PsEW9eXeLCfWBcIHjJzzvlw8WKfk2aFsF8IqefaY1ka208s0Xoqrd8yN+
  RBx3unawrXnO6O+3Jo/a/HaT77XVpfq662veRh3SWvKDcnkuLRDZ4TiRffMn7xj/Q4e35WHMj
  6Ixb9oeivYbRH1u2WWrEnoiTSGsPudl1NfvY933HNV6Hju1BUlUq2iWkzRkh23/kdH56bqfbp
  h+/fJZRWLnR/nzI8r3HqT6114QIfGzMlMG7Zoy6X53jmewF1eNHPxhTyVa8eUYy7Y+CR2C9bE
  92zV3T0/hfPjU361eXw+SizFGYmGWsxFxYkAoyUx3WQDAAA=
X-Env-Sender: wangmy@fujitsu.com
X-Msg-Ref: server-9.tower-248.messagelabs.com!1638179911!394577!1
X-Originating-IP: [62.60.8.97]
X-SYMC-ESS-Client-Auth: outbound-route-from=pass
X-StarScan-Received: 
X-StarScan-Version: 9.81.5; banners=-,-,-
X-VirusChecked: Checked
Received: (qmail 2129 invoked from network); 29 Nov 2021 09:58:31 -0000
Received: from unknown (HELO n03ukasimr01.n03.fujitsu.local) (62.60.8.97)
  by server-9.tower-248.messagelabs.com with ECDHE-RSA-AES256-GCM-SHA384
 encrypted SMTP; 29 Nov 2021 09:58:31 -0000
Received: from n03ukasimr01.n03.fujitsu.local (localhost [127.0.0.1])
	by n03ukasimr01.n03.fujitsu.local (Postfix) with ESMTP id 619451009EB
	for <openembedded-core@lists.openembedded.org>;
 Mon, 29 Nov 2021 09:58:31 +0000 (GMT)
Received: from R01UKEXCASM126.r01.fujitsu.local (unknown [10.183.43.178])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-SHA384 (256/256 bits))
	(No client certificate requested)
	by n03ukasimr01.n03.fujitsu.local (Postfix) with ESMTPS id 55879100242
	for <openembedded-core@lists.openembedded.org>;
 Mon, 29 Nov 2021 09:58:31 +0000 (GMT)
Received: from localhost.localdomain.localdomain (10.167.225.33) by
 R01UKEXCASM126.r01.fujitsu.local (10.183.43.178) with Microsoft SMTP Server
 (TLS) id 15.0.1497.26; Mon, 29 Nov 2021 09:58:12 +0000
From: Wang Mingyu <wangmy@fujitsu.com>
To: <openembedded-core@lists.openembedded.org>
CC: Wang Mingyu <wangmy@fujitsu.com>
Subject: [OE-core] [PATCH] python3-libarchive-c: upgrade 3.1 -> 3.2
Date: Mon, 29 Nov 2021 17:57:59 +0800
Message-ID: <1638179879-118331-2-git-send-email-wangmy@fujitsu.com>
X-Mailer: git-send-email 1.8.3.1
In-Reply-To: <1638179879-118331-1-git-send-email-wangmy@fujitsu.com>
References: <1638179879-118331-1-git-send-email-wangmy@fujitsu.com>
MIME-Version: 1.0
Content-Type: text/plain
X-Originating-IP: [10.167.225.33]
X-ClientProxiedBy: G08CNEXCHPEKD07.g08.fujitsu.local (10.167.33.80) To
 R01UKEXCASM126.r01.fujitsu.local (10.183.43.178)
X-Virus-Scanned: ClamAV using ClamSMTP
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Mon, 29 Nov 2021 09:58:36 -0000
X-Groupsio-URL: 
 https://lists.openembedded.org/g/openembedded-core/message/158934

This release fixes the seek callbacks passed to libarchive by the custom_reader and stream_reader function.
(https://github.com/Changaco/python-libarchive-c/pull/116)

Signed-off-by: Wang Mingyu <wangmy@fujitsu.com>
---
 ...python3-libarchive-c_3.1.bb => python3-libarchive-c_3.2.bb} | 3 +--
 1 file changed, 1 insertion(+), 2 deletions(-)
 rename meta/recipes-devtools/python/{python3-libarchive-c_3.1.bb => python3-libarchive-c_3.2.bb} (79%)

diff --git a/meta/recipes-devtools/python/python3-libarchive-c_3.1.bb b/meta/recipes-devtools/python/python3-libarchive-c_3.2.bb
similarity index 79%
rename from meta/recipes-devtools/python/python3-libarchive-c_3.1.bb
rename to meta/recipes-devtools/python/python3-libarchive-c_3.2.bb
index ac8466e63b..cc04210e72 100644
--- a/meta/recipes-devtools/python/python3-libarchive-c_3.1.bb
+++ b/meta/recipes-devtools/python/python3-libarchive-c_3.2.bb
@@ -9,8 +9,7 @@ PYPI_PACKAGE = "libarchive-c"
 
 inherit pypi setuptools3
 
-SRC_URI[md5sum] = "8c62da42a8b9bd24642e5430427e6f5a"
-SRC_URI[sha256sum] = "618a7ecfbfb58ca15e11e3138d4a636498da3b6bc212811af158298530fbb87e"
+SRC_URI[sha256sum] = "21ad493f4628972fc82440bff54c834a9fbe13be3893037a4bad332b9ee741e5"
 
 RDEPENDS:${PN} += "\
   libarchive \
-- 
2.25.1


