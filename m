Return-Path: <wangmy@fujitsu.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 64974C433EF
	for <webhook@archiver.kernel.org>; Wed, 29 Jun 2022 03:25:31 +0000 (UTC)
Received: from mail3.bemta32.messagelabs.com (mail3.bemta32.messagelabs.com
 [195.245.230.18])
 by mx.groups.io with SMTP id smtpd.web11.7192.1656473128100723944
 for <openembedded-core@lists.openembedded.org>;
 Tue, 28 Jun 2022 20:25:28 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@fujitsu.com header.s=170520fj header.b=Lmb4HRms;
 spf=pass (domain: fujitsu.com, ip: 195.245.230.18,
 mailfrom: wangmy@fujitsu.com)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=fujitsu.com;
	s=170520fj; t=1656473126; i=@fujitsu.com;
	bh=m0qGej3wXsoGnf0DI2/MLG0DVaelNwOCHEQpBUji7mI=;
	h=From:To:CC:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type;
	b=Lmb4HRms2ZEe0pMEKlLRAKNwUc1a/htGsP9SOrHohBQDKKqZwYnTs5eIAxuFw0Dmy
	 gGDRHEA2ibdJ28fSnv6X209TfpUM7kzwkAK6NQ7oZ3SIvkGfkSNqqc6yLyaQDbDthE
	 YrVIncp1ChAQ71CGnzPpO6BfkJ9SHQRTF0DVDara8kKeu7aiOnRWLWt/Cbk7M3PnSh
	 WTkvn4PArdGvsO2c90T5mHINridSIC980eXtb1aSJz0w+gt44HnGr87ewo88fWmD59
	 Aq2I6LSZSyZu9fGTgS9XTZxpCSB55oAMg57gRlk5R1mG3phjEDqf6FMJSKWzlX0PZR
	 e10EbfbocyFKA==
X-Brightmail-Tracker: H4sIAAAAAAAAA+NgFnrAIsWRWlGSWpSXmKPExsViZ8ORqKt2bHe
  SwYTnjBZ3fr5jd2D0OLdxBWMAYxRrZl5SfkUCa8aJzT/YCr5yVjRvymhg7OTsYuTiEBJ4zCjx
  ZPkvRgjnGpPEm6tn2CCcPYwS635/BMpwcrAJqElMv3WDtYuRg0NEQE/i6j9RkDCzgIrEi9897
  CC2sICrxPTHn1hBbBYBVYn+Dz+YQGxeAUeJz3M72UBsCQEFiSkP3zODjOEUcJLoahAHCQsBla
  y+9RyqXFDi5MwnLBDjJSQOvnjBDNGqKDH7cjMLhF0hMWPGNqiRahJXz21insAoOAtJ+ywk7Qs
  YmVYxWiUVZaZnlOQmZuboGhoY6Boamuoa6hoZGOslVukm6qWW6panFpfoGuollhfrpRYX6xVX
  5ibnpOjlpZZsYgQGcEox4+kdjJv6fuodYpTkYFIS5XWctjtJiC8pP6UyI7E4I76oNCe1+BCjD
  AeHkgRv5BGgnGBRanpqRVpmDjCaYNISHDxKIrxFIGne4oLE3OLMdIjUKUZLjqmz/+1n5lgOJm
  d+bTvALMSSl5+XKiXOOwGkQQCkIaM0D24cLOIvMcpKCfMyMjAwCPEUpBblZpagyr9iFOdgVBL
  m5T0MNIUnM68EbusroIOYgA7ym7gD5KCSRISUVAPTqgUuLb+LDv58Ovf2BquH6b66zHnbbrk7
  xfYtcq6NOXxiRcPf8wckfFara6Y87P3UFTKt4MryIydifYOM23TbvS/Krn4Qe1Fyv9H6hVofU
  gIU66YFvVvx/6DEJqG8yyr2JQvXBVvFvlNnnnEp0Dts2tES+ybfklfyP93mc9pqp4U3MB1sqH
  Sx41XtbfitOuv3nzW2ma2R8aUq+W8aWtUudSQKhlWuFPu7IIrnVMsBswLb9Lpltd+5zhl1/eG
  M+fVNdHaXx8QtavuN60qzM1M03pjar5Mqjv/V9ilhxgsd0S/xm9bbX3EXCLDdc3LRkpnnnnRu
  jGsNedb3WKft70yhuqXRZXfk2KZ457XXOSuxFGckGmoxFxUnAgDURD4zcwMAAA==
X-Env-Sender: wangmy@fujitsu.com
X-Msg-Ref: server-16.tower-585.messagelabs.com!1656473125!313092!1
X-Originating-IP: [62.60.8.97]
X-SYMC-ESS-Client-Auth: outbound-route-from=pass
X-StarScan-Received: 
X-StarScan-Version: 9.86.7; banners=-,-,-
X-VirusChecked: Checked
Received: (qmail 5471 invoked from network); 29 Jun 2022 03:25:26 -0000
Received: from unknown (HELO n03ukasimr01.n03.fujitsu.local) (62.60.8.97)
  by server-16.tower-585.messagelabs.com with ECDHE-RSA-AES256-GCM-SHA384
 encrypted SMTP; 29 Jun 2022 03:25:26 -0000
Received: from n03ukasimr01.n03.fujitsu.local (localhost [127.0.0.1])
	by n03ukasimr01.n03.fujitsu.local (Postfix) with ESMTP id 935CD10019E
	for <openembedded-core@lists.openembedded.org>;
 Wed, 29 Jun 2022 04:25:25 +0100 (BST)
Received: from R01UKEXCASM126.r01.fujitsu.local (R01UKEXCASM126
 [10.183.43.178])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-SHA384 (256/256 bits))
	(No client certificate requested)
	by n03ukasimr01.n03.fujitsu.local (Postfix) with ESMTPS id 8756E10019A
	for <openembedded-core@lists.openembedded.org>;
 Wed, 29 Jun 2022 04:25:25 +0100 (BST)
Received: from localhost.localdomain (10.167.225.33) by
 R01UKEXCASM126.r01.fujitsu.local (10.183.43.178) with Microsoft SMTP Server
 (TLS) id 15.0.1497.32; Wed, 29 Jun 2022 04:25:23 +0100
From: Wang Mingyu <wangmy@fujitsu.com>
To: <openembedded-core@lists.openembedded.org>
CC: Wang Mingyu <wangmy@fujitsu.com>
Subject: [OE-core] [PATCH] python3-dbusmock: upgrade 0.28.0 -> 0.28.1
Date: Wed, 29 Jun 2022 11:24:06 +0800
Message-ID: <1656473046-4187-5-git-send-email-wangmy@fujitsu.com>
X-Mailer: git-send-email 1.8.3.1
In-Reply-To: <1656473046-4187-1-git-send-email-wangmy@fujitsu.com>
References: <1656473046-4187-1-git-send-email-wangmy@fujitsu.com>
MIME-Version: 1.0
Content-Type: text/plain
X-Originating-IP: [10.167.225.33]
X-ClientProxiedBy: G08CNEXCHPEKD09.g08.fujitsu.local (10.167.33.85) To
 R01UKEXCASM126.r01.fujitsu.local (10.183.43.178)
X-Virus-Scanned: ClamAV using ClamSMTP
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Wed, 29 Jun 2022 03:25:31 -0000
X-Groupsio-URL: 
 https://lists.openembedded.org/g/openembedded-core/message/167363

Changelog:
==========
Again works on RHEL/CentOS 8 (0.27 broke there), now in CI
Avoid glib GI dependency for main dbusmock, for running in virtualenv

Signed-off-by: Wang Mingyu <wangmy@fujitsu.com>
---
 .../{python3-dbusmock_0.28.0.bb => python3-dbusmock_0.28.1.bb}  | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)
 rename meta/recipes-devtools/python/{python3-dbusmock_0.28.0.bb => python3-dbusmock_0.28.1.bb} (83%)

diff --git a/meta/recipes-devtools/python/python3-dbusmock_0.28.0.bb b/meta/recipes-devtools/python/python3-dbusmock_0.28.1.bb
similarity index 83%
rename from meta/recipes-devtools/python/python3-dbusmock_0.28.0.bb
rename to meta/recipes-devtools/python/python3-dbusmock_0.28.1.bb
index 6155c866a2..d6889f4313 100644
--- a/meta/recipes-devtools/python/python3-dbusmock_0.28.0.bb
+++ b/meta/recipes-devtools/python/python3-dbusmock_0.28.1.bb
@@ -4,7 +4,7 @@ HOMEPAGE = "https://pypi.org/project/python-dbusmock/"
 LICENSE = "GPL-3.0-only"
 LIC_FILES_CHKSUM = "file://COPYING;md5=e6a600fd5e1d9cbde2d983680233ad02"
 
-SRC_URI[sha256sum] = "c63edeacec7796c4f379b2e17566d62afa404c048931ac9eba446470cec80ada"
+SRC_URI[sha256sum] = "6434e544c055e3570b20e341e50a3d2dd50b19d9e55d579b919e14879f9f1e57"
 
 PYPI_PACKAGE = "python-dbusmock"
 
-- 
2.25.1


