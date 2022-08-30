Return-Path: <wangmy@fujitsu.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id E3203ECAAD5
	for <webhook@archiver.kernel.org>; Tue, 30 Aug 2022 04:09:51 +0000 (UTC)
Received: from mail1.bemta34.messagelabs.com (mail1.bemta34.messagelabs.com
 [195.245.231.2])
 by mx.groups.io with SMTP id smtpd.web10.7646.1661832581085837196
 for <openembedded-core@lists.openembedded.org>;
 Mon, 29 Aug 2022 21:09:42 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@fujitsu.com header.s=170520fj header.b=mEptGHbW;
 spf=pass (domain: fujitsu.com, ip: 195.245.231.2,
 mailfrom: wangmy@fujitsu.com)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=fujitsu.com;
	s=170520fj; t=1661832579; i=@fujitsu.com;
	bh=J8UqhS23GXmqFJPNZVIu7LQ+raKio60NEP9eS/Q/5IU=;
	h=From:To:CC:Subject:Date:Message-ID:MIME-Version:Content-Type;
	b=mEptGHbWEDqkKy0Xla3FxnbBCqfMPS8fWGDgbDGKDafcYS4JJdu2k7r35cPIl/hon
	 mVUQ7deawKKrEpd8FOf+ff8YQciTHUjQScir5IzRb4d7Ilzb6qKs/habh0kYbyLlJM
	 5A2Es2oVhSH2R75OVTjfu+hIHx7Kow7v3RmzJkNjKiXO+TEPZSGDMeMcwfF+4AXD8T
	 rN1EJVF8hoScep/0Lf6lfkm9IFB7tE4ofif6JeGOM5Ou3lG72uXzcpf3/k5d33tQJZ
	 5xeyKwApjtFRQ9s8qTZ17s5SBSQ1GBh19ZgRU0CZlx7G1IwLv3XKW9jprkZ8CsKC1Y
	 pWlSrsc9VwvMQ==
X-Brightmail-Tracker: H4sIAAAAAAAAA+NgFjrPIsWRWlGSWpSXmKPExsViZ8ORpNvUy5t
  ssP6TksWdn+/YHRg9zm1cwRjAGMWamZeUX5HAmjFl8m6WgpVCFQvmNLA1MK4U6GLk4hASeMAo
  cfneT1YI5wqTxM31C6CcvYwS6x89Y+ti5ORgE1CTmH7rBlCCg0NEQE/i6j9RkDCzgIrEi9897
  CC2sICFxKGWJkaQEhYBVYm5TT4gJq+Ak8TndS4gFRICChJTHr5nBrF5BQQlTs58wgIxRULi4I
  sXzBA1ihKzLzezQNiVEntm9TNB2GoSV89tYp7AyD8LSfssJO0LGJlWMVonFWWmZ5TkJmbm6Bo
  aGOgaGprqGlvqGhkY6CVW6SbqpZbqlqcWl+ga6SWWF+ulFhfrFVfmJuek6OWllmxiBIZkSrH6
  iR2MT1f+1DvEKMnBpCTKu7CVN1mILyk/pTIjsTgjvqg0J7X4EKMMB4eSBO/lbqCcYFFqempFW
  mYOMD5g0hIcPEoivN5dQGne4oLE3OLMdIjUKUZ7jqtXruxl5pg6+99+Zo7lYHLm17YDzEIsef
  l5qVLivBN6gNoEQNoySvPghsLi+RKjrJQwLyMDA4MQT0FqUW5mCar8K0ZxDkYlYd4NIFN4MvN
  K4Ha/AjqLCeish0u4Qc4qSURISTUwOVhUC/nXumzVDQ1/s7Fb70/N7Q9f/Wc9XvyrNJ1F/13F
  /hfGrqmfry+49fRG6SrhJ4uj3wk7C38XD5HsrzEurr6YkLbh/f3aAy8ut0f11fG7CBfqLvTvu
  CWaWrdzeWLOrXfSB1iYdVeu8qm1SA1c0tk2/9X5JVrqSwuWKmZNnR9qa7Mk21bl6ML7DhLt9u
  ynai6kPVV7H8kvUq6YYy7WyWnxepFmIJfTtzuFTut/ya2P8ZNO1GZ5mrzqrX7Y8Zyg+iXLE5/
  Hz1Do3JFztqHW5/Imie0B4p/0Vr/MWDTtveyrv6/mxZku51ZxWpvS/qY4aHpmiMVWH4G2Rw4P
  GBbU/H/aXfOK+8zXTMkzkT1KLMUZiYZazEXFiQDUfKR5YgMAAA==
X-Env-Sender: wangmy@fujitsu.com
X-Msg-Ref: server-2.tower-571.messagelabs.com!1661832578!400765!1
X-Originating-IP: [62.60.8.98]
X-SYMC-ESS-Client-Auth: outbound-route-from=pass
X-StarScan-Received: 
X-StarScan-Version: 9.87.3; banners=-,-,-
X-VirusChecked: Checked
Received: (qmail 18468 invoked from network); 30 Aug 2022 04:09:38 -0000
Received: from unknown (HELO n03ukasimr03.n03.fujitsu.local) (62.60.8.98)
  by server-2.tower-571.messagelabs.com with ECDHE-RSA-AES256-GCM-SHA384
 encrypted SMTP; 30 Aug 2022 04:09:38 -0000
Received: from n03ukasimr03.n03.fujitsu.local (localhost [127.0.0.1])
	by n03ukasimr03.n03.fujitsu.local (Postfix) with ESMTP id 476041AC
	for <openembedded-core@lists.openembedded.org>;
 Tue, 30 Aug 2022 05:09:38 +0100 (BST)
Received: from R01UKEXCASM223.r01.fujitsu.local (R01UKEXCASM223
 [10.182.185.121])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-SHA384 (256/256 bits))
	(No client certificate requested)
	by n03ukasimr03.n03.fujitsu.local (Postfix) with ESMTPS id 3BC201AE
	for <openembedded-core@lists.openembedded.org>;
 Tue, 30 Aug 2022 05:09:38 +0100 (BST)
Received: from localhost.localdomain (10.167.225.33) by
 R01UKEXCASM223.r01.fujitsu.local (10.182.185.121) with Microsoft SMTP Server
 (TLS) id 15.0.1497.32; Tue, 30 Aug 2022 05:09:36 +0100
From: Wang Mingyu <wangmy@fujitsu.com>
To: <openembedded-core@lists.openembedded.org>
CC: Wang Mingyu <wangmy@fujitsu.com>
Subject: [OE-core] [PATCH] ethtool: upgrade 5.18 -> 5.19
Date: Tue, 30 Aug 2022 12:09:17 +0800
Message-ID: <1661832561-12506-1-git-send-email-wangmy@fujitsu.com>
X-Mailer: git-send-email 1.8.3.1
MIME-Version: 1.0
Content-Type: text/plain
X-Originating-IP: [10.167.225.33]
X-ClientProxiedBy: G08CNEXCHPEKD09.g08.fujitsu.local (10.167.33.85) To
 R01UKEXCASM223.r01.fujitsu.local (10.182.185.121)
X-Virus-Scanned: ClamAV using ClamSMTP
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Tue, 30 Aug 2022 04:09:51 -0000
X-Groupsio-URL: 
 https://lists.openembedded.org/g/openembedded-core/message/170047

avoid_parallel_tests.patch
refreshed for new version.

Signed-off-by: Wang Mingyu <wangmy@fujitsu.com>
---
 .../ethtool/ethtool/avoid_parallel_tests.patch              | 6 +++---
 .../ethtool/{ethtool_5.18.bb => ethtool_5.19.bb}            | 2 +-
 2 files changed, 4 insertions(+), 4 deletions(-)
 rename meta/recipes-extended/ethtool/{ethtool_5.18.bb => ethtool_5.19.bb} (93%)

diff --git a/meta/recipes-extended/ethtool/ethtool/avoid_parallel_tests.patch b/meta/recipes-extended/ethtool/ethtool/avoid_parallel_tests.patch
index 4391a91767..f8703d8145 100644
--- a/meta/recipes-extended/ethtool/ethtool/avoid_parallel_tests.patch
+++ b/meta/recipes-extended/ethtool/ethtool/avoid_parallel_tests.patch
@@ -1,4 +1,4 @@
-From b0270486eca02e1b70eff7517936fad77bb1fb8e Mon Sep 17 00:00:00 2001
+From 2ceea729810475ca8988e2955dc33b5843520e6b Mon Sep 17 00:00:00 2001
 From: Tudor Florea <tudor.florea@enea.com>
 Date: Wed, 28 May 2014 18:59:54 +0200
 Subject: [PATCH] ethtool: use serial-tests config needed by ptest.
@@ -15,11 +15,11 @@ Upstream-Status: Inappropriate
  1 file changed, 1 insertion(+), 1 deletion(-)
 
 diff --git a/configure.ac b/configure.ac
-index c11f2b1..2bd2b83 100644
+index cc3525c..873af9b 100644
 --- a/configure.ac
 +++ b/configure.ac
 @@ -2,7 +2,7 @@ dnl Process this file with autoconf to produce a configure script.
- AC_INIT(ethtool, 5.18, netdev@vger.kernel.org)
+ AC_INIT(ethtool, 5.19, netdev@vger.kernel.org)
  AC_PREREQ(2.52)
  AC_CONFIG_SRCDIR([ethtool.c])
 -AM_INIT_AUTOMAKE([gnu subdir-objects])
diff --git a/meta/recipes-extended/ethtool/ethtool_5.18.bb b/meta/recipes-extended/ethtool/ethtool_5.19.bb
similarity index 93%
rename from meta/recipes-extended/ethtool/ethtool_5.18.bb
rename to meta/recipes-extended/ethtool/ethtool_5.19.bb
index b4f74e7f5b..8c995b21e1 100644
--- a/meta/recipes-extended/ethtool/ethtool_5.18.bb
+++ b/meta/recipes-extended/ethtool/ethtool_5.19.bb
@@ -11,7 +11,7 @@ SRC_URI = "${KERNELORG_MIRROR}/software/network/ethtool/ethtool-${PV}.tar.gz \
            file://avoid_parallel_tests.patch \
            "
 
-SRC_URI[sha256sum] = "70091f95448eba851f9f9804059d0e237f1d909064046f9e3c6dc892aa1e8afe"
+SRC_URI[sha256sum] = "24412dcd4ac886177abd68282efa98914a4dd2497218e298e7049e9cb72b2336"
 
 UPSTREAM_CHECK_URI = "https://www.kernel.org/pub/software/network/ethtool/"
 
-- 
2.25.1


