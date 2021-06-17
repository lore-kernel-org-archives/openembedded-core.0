Received: from mail1.bemta26.messagelabs.com (mail1.bemta26.messagelabs.com [85.158.142.1])
 by mx.groups.io with SMTP id smtpd.web08.1098.1623888693299539650
 for <openembedded-core@lists.openembedded.org>;
 Wed, 16 Jun 2021 17:11:33 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@fujitsu.com header.s=170520fj header.b=bwsjpid1;
 spf=pass (domain: fujitsu.com, ip: 85.158.142.1, mailfrom: wangmy@fujitsu.com)
Return-Path: <wangmy@fujitsu.com>
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=fujitsu.com;
	s=170520fj; t=1623888691; i=@fujitsu.com;
	bh=PONvUkeC9fJc8GhktIGWErO4J6Omu6up7tslQ1ALOP0=;
	h=From:To:CC:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type;
	b=bwsjpid1WwrS3UVwZopAfPt8yKPDmYiCEOrOoBm03d00r5uQtjZlTyHECNWC/Kxuz
	 zTk3TwL/e3uCWxPkESaE7CxEHAyy3LCjGaYwlwKdvoWX8zDaNDIa+MmNBxNaZzAgdD
	 JZwqBR8IGr54j+YbfKq0By5lB4EW/1FXS+sGCLcPl9mQ7J8xvdtCywgyNn6OMYCbuR
	 9pkv0yN8LSbFbKekmo2wCiLEamTxLVq5DE9XH2Dc88pNAPhpOoBAFuS4oUKRwRJWHA
	 u6ke4SSfIBYfvuByU5Rkhrem5QhA9n7L9KDyhGOmIa0sTDtvEpzeCKlUOg2xabX9bW
	 fn9eGxKbRumVg==
Received: from [100.113.3.92] (using TLSv1.2 with cipher DHE-RSA-AES256-GCM-SHA384 (256 bits))
	by server-1.bemta.az-a.eu-central-1.aws.symcld.net id F6/E8-37841-2339AC06; Thu, 17 Jun 2021 00:11:30 +0000
X-Brightmail-Tracker: H4sIAAAAAAAAA+NgFlrPIsWRWlGSWpSXmKPExsViZ8MxVddo8qk
  Egx1X+Szu/HzH7sDocW7jCsYAxijWzLyk/IoE1oyWly+ZCjZxVKyYZtbAeI29i5GLQ0hgFpPE
  s+Xn2CCcE4wSm9Y/ZO5i5ORgE1CTmH7rBmsXIweHiICexNV/oiBhZgEViRe/e9hBbGEBG4ntD
  76wgtgsAqoSOze1gdm8Ak4SS7atZgOxJQQUJKY8fA82klPAWeJ72xmwuBBQzfbGS1D1ghInZz
  5hgZgvIXHwxQtmiF5FidmXm1kg7AqJ14cvMU9g5J+FpGUWkpYFjEyrGC2TijLTM0pyEzNzdA0
  NDHQNDY11DXSNTI30Eqt0E/VSS3WTU/NKihKBsnqJ5cV6xZW5yTkpenmpJZsYgeGYUsjwZwfj
  6jcf9A4xSnIwKYnyNneeShDiS8pPqcxILM6ILyrNSS0+xCjDwaEkwcs/ESgnWJSanlqRlpkDj
  A2YtAQHj5II7+d+oDRvcUFibnFmOkTqFKOilDjvS5A+AZBERmkeXBssHi8xykoJ8zIyMDAI8R
  SkFuVmlqDKv2IU52BUEua9DzKFJzOvBG76K6DFTECL24TAFpckIqSkGpg4WrKLcrhiq8puzTn
  j1eeX+DnrSJxXrunhqklf2Ke77mKwfTPrjtGEW1Y6t+5u1Ut5cvniy3fsGcdqm+r7Jn0wrbvq
  E3hj1d4pEyMLD3Qt7Wt4/jwz4G9a07/ZUT/+yWbXakVct83mFzc7s3nrjLuhaX/X2Rdo3T3TG
  T9FOHPnQUWei/PL1qce/Jov43zq2xOtgw/W6t62d6l6cGLl9U1HeNRXbum5qG5lzndFMHvtYp
  lbxekibvvX85++zx26bUFKkcki7b+bmoprWAo43lZt9DlQ9+ywa/j2B3+5+1f/25r5+N3kk4w
  TV9vMtvwvzbnoQnPJ5DNTLONu9Gm47loYPPOQxTcNo92d87R2zaqIV2Ipzkg01GIuKk4EAE/o
  FSRCAwAA
X-Env-Sender: wangmy@fujitsu.com
X-Msg-Ref: server-4.tower-228.messagelabs.com!1623888689!90921!1
X-Originating-IP: [62.60.8.149]
X-SYMC-ESS-Client-Auth: outbound-route-from=pass
X-StarScan-Received: 
X-StarScan-Version: 9.75.3; banners=-,-,-
X-VirusChecked: Checked
Received: (qmail 16964 invoked from network); 17 Jun 2021 00:11:30 -0000
Received: from unknown (HELO mailhost2.uk.fujitsu.com) (62.60.8.149)
  by server-4.tower-228.messagelabs.com with ECDHE-RSA-AES256-GCM-SHA384 encrypted SMTP; 17 Jun 2021 00:11:30 -0000
Received: from R01UKEXCASM126.r01.fujitsu.local ([10.183.43.178])
	by mailhost2.uk.fujitsu.com (8.14.5/8.14.5) with ESMTP id 15H0BPi7027694
	(version=TLSv1/SSLv3 cipher=AES256-SHA bits=256 verify=FAIL)
	for <openembedded-core@lists.openembedded.org>; Thu, 17 Jun 2021 01:11:29 +0100
Received: from localhost.localdomain.localdomain (10.167.225.33) by
 R01UKEXCASM126.r01.fujitsu.local (10.183.43.178) with Microsoft SMTP Server
 (TLS) id 15.0.1497.18; Thu, 17 Jun 2021 01:11:26 +0100
From: "wangmy" <wangmy@fujitsu.com>
To: <openembedded-core@lists.openembedded.org>
CC: Wang Mingyu <wangmy@fujitsu.com>
Subject: [OE-core] [PATCH] enchant2: upgrade 2.2.15 -> 2.3.0
Date: Thu, 17 Jun 2021 08:11:00 +0800
Message-ID: <1623888661-63658-3-git-send-email-wangmy@fujitsu.com>
X-Mailer: git-send-email 1.8.3.1
In-Reply-To: <1623888661-63658-1-git-send-email-wangmy@fujitsu.com>
References: <1623888661-63658-1-git-send-email-wangmy@fujitsu.com>
MIME-Version: 1.0
X-Originating-IP: [10.167.225.33]
X-ClientProxiedBy: G08CNEXCHPEKD08.g08.fujitsu.local (10.167.33.83) To
 R01UKEXCASM126.r01.fujitsu.local (10.183.43.178)
Content-Type: text/plain

Signed-off-by: Wang Mingyu <wangmy@fujitsu.com>
---
 .../enchant/{enchant2_2.2.15.bb => enchant2_2.3.0.bb}           | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)
 rename meta/recipes-support/enchant/{enchant2_2.2.15.bb => enchant2_2.3.0.bb} (92%)

diff --git a/meta/recipes-support/enchant/enchant2_2.2.15.bb b/meta/recipes-support/enchant/enchant2_2.3.0.bb
similarity index 92%
rename from meta/recipes-support/enchant/enchant2_2.2.15.bb
rename to meta/recipes-support/enchant/enchant2_2.3.0.bb
index ed87f11a8a..5d0f10d0bc 100644
--- a/meta/recipes-support/enchant/enchant2_2.2.15.bb
+++ b/meta/recipes-support/enchant/enchant2_2.3.0.bb
@@ -12,7 +12,7 @@ DEPENDS = "glib-2.0"
 inherit autotools pkgconfig
 
 SRC_URI = "https://github.com/AbiWord/enchant/releases/download/v${PV}/enchant-${PV}.tar.gz"
-SRC_URI[sha256sum] = "3b0f2215578115f28e2a6aa549b35128600394304bd79d6f28b0d3b3d6f46c03"
+SRC_URI[sha256sum] = "df68063b6c13b245fa7246b0e098a03e74f7a91c6d8947bc5c4f42ce55e2e41d"
 
 UPSTREAM_CHECK_URI = "https://github.com/AbiWord/enchant/releases"
 
-- 
2.25.1

