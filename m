Return-Path: <wangmy@fujitsu.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 108CECCA47C
	for <webhook@archiver.kernel.org>; Tue, 12 Jul 2022 07:42:18 +0000 (UTC)
Received: from mail1.bemta34.messagelabs.com (mail1.bemta34.messagelabs.com
 [195.245.231.2])
 by mx.groups.io with SMTP id smtpd.web12.6373.1657611735998683618
 for <openembedded-core@lists.openembedded.org>;
 Tue, 12 Jul 2022 00:42:17 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@fujitsu.com header.s=170520fj header.b=k8ltZlG5;
 spf=pass (domain: fujitsu.com, ip: 195.245.231.2,
 mailfrom: wangmy@fujitsu.com)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=fujitsu.com;
	s=170520fj; t=1657611736; i=@fujitsu.com;
	bh=QtFralBDoYBEzcgvwwYyB/QR2bP2WPtl0dVbUA+mRAo=;
	h=From:To:CC:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type;
	b=k8ltZlG58gNiFts7lSnaNXoYnPlzXu62ygIfUvc03Rt7mWWSWQcSU2yTaESLWH+ox
	 vmhRH0k7PMx+im1lfMt3xOwZEwa/RHhQfJKEOAXm9s70Qw49oVYRMbO4OE6P6F73rg
	 Qi389j8IF9MglCictlJENo48v3sxenZwrRO2OSxTtWERcngiHdLWCIUwRZ/h04S4Cc
	 q+gxMWIHlrkttqMfHTsJqCpQCDRmWLFz2CUSDkY1pQPMRjo3xeS6z53PpPe6XmobKY
	 s8H+vYsNqejFWU5/4kJIgkfIr8KBXUU/9D3LotTEwA4JPZUkNuMsTwcQlKKFTgOO2M
	 Df2n7/0vZpfIA==
X-Brightmail-Tracker: H4sIAAAAAAAAA+NgFnrIIsWRWlGSWpSXmKPExsViZ8ORqHtD9Wy
  SweMDghZ3fr5jd2D0OLdxBWMAYxRrZl5SfkUCa8aPg78YC+5zVmxo9G1gvM/RxcjFISTwmFFi
  +Ytr7BDONSaJiSdvsEA4exgl/h26CpTh5GATUJOYfusGaxcjB4eIgJ7E1X+iIGFmARWJF797w
  EqEBTwlJjw7yQxiswioSpy6/ZwVxOYVcJJoW7CBCcSWEFCQmPLwPVgNp4CzxK8p38BGCgHV7L
  zhBlEuKHFy5hMWiPESEgdfvGCGaFWUmH25mQXCrpCYMWMbG4StJnH13CbmCYyCs5C0z0LSvoC
  RaRWjdVJRZnpGSW5iZo6uoYGBrqGhqa6xpa6RobFeYpVuol5qqW55anGJrpFeYnmxXmpxsV5x
  ZW5yTopeXmrJJkZgCKcUq1/dwbh51U+9Q4ySHExKorx50meThPiS8lMqMxKLM+KLSnNSiw8xy
  nBwKEnw2qgA5QSLUtNTK9Iyc4DxBJOW4OBREuE1UQZK8xYXJOYWZ6ZDpE4xWnJMnf1vPzPHcj
  A582vbAWYhlrz8vFQpcV4BYNQKCYA0ZJTmwY2DxfwlRlkpYV5GBgYGIZ6C1KLczBJU+VeM4hy
  MSsK800Cm8GTmlcBtfQV0EBPQQXKRZ0AOKklESEk1MDXe3TZ3c5QRx7KOK91T4/den337a3lc
  1KmJJzYsveHuMbNh77mNWqb398uxCia8Pf4uVthTTtcz4HLRd8bfyzJEV4ddOyE38+BSv4IVW
  i4HVT5I9WX9XGO39T/303LFFSKsHzum3bApUA1X3lIfPX8Hi/plZ/auHS6Kuu6S+/YddEtnSP
  SNvFPqPp1/Te+jHK0LEyNy7mjt7dtg8s+n8FvUyhIJl18aCtx5k3e2hgpXlbRMWOBy1Ikj8Ov
  mHWufFoZzq1XKBinm3OoV0O3Y+EdUS/r7jE+mDp0LlJt4xZ7nMJXtnib3Wvj74a/cbEkHln2a
  +X6XkSTj8u2M6fJnU41z6/7c3Lp808bOFmHtYiWW4oxEQy3mouJEABW+FSd0AwAA
X-Env-Sender: wangmy@fujitsu.com
X-Msg-Ref: server-4.tower-565.messagelabs.com!1657611736!85968!1
X-Originating-IP: [62.60.8.97]
X-SYMC-ESS-Client-Auth: outbound-route-from=pass
X-StarScan-Received: 
X-StarScan-Version: 9.87.3; banners=-,-,-
X-VirusChecked: Checked
Received: (qmail 14216 invoked from network); 12 Jul 2022 07:42:16 -0000
Received: from unknown (HELO n03ukasimr01.n03.fujitsu.local) (62.60.8.97)
  by server-4.tower-565.messagelabs.com with ECDHE-RSA-AES256-GCM-SHA384
 encrypted SMTP; 12 Jul 2022 07:42:16 -0000
Received: from n03ukasimr01.n03.fujitsu.local (localhost [127.0.0.1])
	by n03ukasimr01.n03.fujitsu.local (Postfix) with ESMTP id F258410018D
	for <openembedded-core@lists.openembedded.org>;
 Tue, 12 Jul 2022 08:42:15 +0100 (BST)
Received: from R01UKEXCASM126.r01.fujitsu.local (R01UKEXCASM126
 [10.183.43.178])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-SHA384 (256/256 bits))
	(No client certificate requested)
	by n03ukasimr01.n03.fujitsu.local (Postfix) with ESMTPS id E5EB4100043
	for <openembedded-core@lists.openembedded.org>;
 Tue, 12 Jul 2022 08:42:15 +0100 (BST)
Received: from localhost.localdomain (10.167.225.33) by
 R01UKEXCASM126.r01.fujitsu.local (10.183.43.178) with Microsoft SMTP Server
 (TLS) id 15.0.1497.32; Tue, 12 Jul 2022 08:42:14 +0100
From: Wang Mingyu <wangmy@fujitsu.com>
To: <openembedded-core@lists.openembedded.org>
CC: Wang Mingyu <wangmy@fujitsu.com>
Subject: [OE-core] [PATCH] python3-cryptography: upgrade 37.0.3 -> 37.0.4
Date: Tue, 12 Jul 2022 15:41:44 +0800
Message-ID: <1657611705-30786-3-git-send-email-wangmy@fujitsu.com>
X-Mailer: git-send-email 1.8.3.1
In-Reply-To: <1657611705-30786-1-git-send-email-wangmy@fujitsu.com>
References: <1657611705-30786-1-git-send-email-wangmy@fujitsu.com>
MIME-Version: 1.0
Content-Type: text/plain
X-Originating-IP: [10.167.225.33]
X-ClientProxiedBy: G08CNEXCHPEKD09.g08.fujitsu.local (10.167.33.85) To
 R01UKEXCASM126.r01.fujitsu.local (10.183.43.178)
X-Virus-Scanned: ClamAV using ClamSMTP
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Tue, 12 Jul 2022 07:42:18 -0000
X-Groupsio-URL: 
 https://lists.openembedded.org/g/openembedded-core/message/167898

Changelog:
==========
Updated Windows, macOS, and Linux wheels to be compiled with OpenSSL 3.0.5.

Signed-off-by: Wang Mingyu <wangmy@fujitsu.com>
---
 ...n3-cryptography_37.0.3.bb => python3-cryptography_37.0.4.bb} | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)
 rename meta/recipes-devtools/python/{python3-cryptography_37.0.3.bb => python3-cryptography_37.0.4.bb} (97%)

diff --git a/meta/recipes-devtools/python/python3-cryptography_37.0.3.bb b/meta/recipes-devtools/python/python3-cryptography_37.0.4.bb
similarity index 97%
rename from meta/recipes-devtools/python/python3-cryptography_37.0.3.bb
rename to meta/recipes-devtools/python/python3-cryptography_37.0.4.bb
index 53c8ea7477..c91a8c7771 100644
--- a/meta/recipes-devtools/python/python3-cryptography_37.0.3.bb
+++ b/meta/recipes-devtools/python/python3-cryptography_37.0.4.bb
@@ -9,7 +9,7 @@ LIC_FILES_CHKSUM = "file://LICENSE;md5=bf405a8056a6647e7d077b0e7bc36aba \
                    "
 LDSHARED += "-pthread"
 
-SRC_URI[sha256sum] = "ae430d51c67ac638dfbb42edf56c669ca9c74744f4d225ad11c6f3d355858187"
+SRC_URI[sha256sum] = "63f9c17c0e2474ccbebc9302ce2f07b55b3b3fcb211ded18a42d5764f5c10a82"
 
 SRC_URI += "file://run-ptest \
            file://check-memfree.py \
-- 
2.25.1


