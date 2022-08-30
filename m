Return-Path: <wangmy@fujitsu.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 01FB3C0502C
	for <webhook@archiver.kernel.org>; Tue, 30 Aug 2022 04:09:52 +0000 (UTC)
Received: from mail1.bemta34.messagelabs.com (mail1.bemta34.messagelabs.com
 [195.245.231.1])
 by mx.groups.io with SMTP id smtpd.web12.7858.1661832589896681635
 for <openembedded-core@lists.openembedded.org>;
 Mon, 29 Aug 2022 21:09:50 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@fujitsu.com header.s=170520fj header.b=SNLRc8Hk;
 spf=pass (domain: fujitsu.com, ip: 195.245.231.1,
 mailfrom: wangmy@fujitsu.com)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=fujitsu.com;
	s=170520fj; t=1661832588; i=@fujitsu.com;
	bh=JcPYiTP/24bMMspGhj/rN8SB60R7iy0z48TgSoO8soM=;
	h=From:To:CC:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type;
	b=SNLRc8HkBVS3p1jgtmPUL8QUUnQuGhDD0qqj17Yymb6O7mfyNjhQDMijVzXVgnODs
	 DF9jigivRitWWjFxlhkYCf1XIWxgXrVbAB+OYJ9mgvCYGBp/6IQlcscLVoacusaql9
	 tr8dnuBhfUADhN8ydMi9PwT+06UpEr2eqtG3/HgeIz7qoKxZ31bNYtthRl4V9FouIg
	 c9OvyAAHxz7B0tZGP4+zx4dKlFyKP2e8i9sIbwRGwWFv+EoTPnjFTOxFZ1P6TriX3J
	 P7sNAtFi8Oj4RrJqSJPL7whvp9f0RbZHAX0ia8tyNEmKfK77mPHiIwtlWE+h5h6T0X
	 /9Wlc4j7mvvqQ==
X-Brightmail-Tracker: H4sIAAAAAAAAA+NgFrrCIsWRWlGSWpSXmKPExsViZ8ORqNvdy5t
  s0Hla3eLOz3fsDowe5zauYAxgjGLNzEvKr0hgzfi4dRZLQQ9nxczPs1kaGCdzdDFycggJPGaU
  WDPVAcK+ziQxea5AFyMXkL2XUeLLri4WkASbgJrE9Fs3WLsYOThEBPQkrv4TBQkzC6hIvPjdw
  w5iCwvYShyY/pMJxGYRUJXo/LYZrJVXwEmi72EHK4gtIaAgMeXhe2YQm1PAWWL11VdMEHudJD
  a9WAFVLyhxcuYTFoj5EhIHX7xghuhVlJh9uZkFwq6U2DOrnwnCVpO4em4T8wRGwVlI2mchaV/
  AyLSK0SqpKDM9oyQ3MTNH19DAQNfQ0FTX2FLX1EgvsUo3US+1VLc8tbhEF8gtL9ZLLS7WK67M
  Tc5J0ctLLdnECAzglGJ1kx2M3St/6h1ilORgUhLlXdjKmyzEl5SfUpmRWJwRX1Sak1p8iFGGg
  0NJgvdyN1BOsCg1PbUiLTMHGE0waQkOHiURXu8uoDRvcUFibnFmOkTqFKMux8yvbQeYhVjy8v
  NSpcR5J/QAFQmAFGWU5sGNgEX2JUZZKWFeRgYGBiGegtSi3MwSVPlXjOIcjErCvBtApvBk5pX
  AbXoFdAQT0BEPl3CDHFGSiJCSamCyXWBZU+pz7IGMb/l7my2VPC6lqfoLjygqHN7jyzxB9HTt
  4Udzo7/X6XoWyS751uLafdHzB+fSnrcnvSdN3dMWvUB2VX+DVsGCiObUrPN/OFb/nnClckJPa
  dxN0WN9k4o33J5yW2tJ9FOurAdLHnUpF/DvWP77lsKJnwlh/s+l1YxetGw6Lspa1nC/eGlYUY
  wlSyB/rWYq31tZXQl9Hgfm+6xP7jhbcbPckrtht83hvLPItjt5FkXX0p4vux3HEPq7XGgVf2j
  +fJYrmtq7eO+XJJ27dlN1nse3zC8G1gtOfrb//avg0z2f8nlldqlMMw8dnBGyUeXc33sLRet7
  uyNFeH5xmzlVThaoKN73o1KJpTgj0VCLuag4EQCRngNCZwMAAA==
X-Env-Sender: wangmy@fujitsu.com
X-Msg-Ref: server-2.tower-571.messagelabs.com!1661832587!400771!1
X-Originating-IP: [62.60.8.97]
X-SYMC-ESS-Client-Auth: outbound-route-from=pass
X-StarScan-Received: 
X-StarScan-Version: 9.87.3; banners=-,-,-
X-VirusChecked: Checked
Received: (qmail 18769 invoked from network); 30 Aug 2022 04:09:47 -0000
Received: from unknown (HELO n03ukasimr01.n03.fujitsu.local) (62.60.8.97)
  by server-2.tower-571.messagelabs.com with ECDHE-RSA-AES256-GCM-SHA384
 encrypted SMTP; 30 Aug 2022 04:09:47 -0000
Received: from n03ukasimr01.n03.fujitsu.local (localhost [127.0.0.1])
	by n03ukasimr01.n03.fujitsu.local (Postfix) with ESMTP id 575BF100192
	for <openembedded-core@lists.openembedded.org>;
 Tue, 30 Aug 2022 05:09:47 +0100 (BST)
Received: from R01UKEXCASM223.r01.fujitsu.local (R01UKEXCASM223
 [10.182.185.121])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-SHA384 (256/256 bits))
	(No client certificate requested)
	by n03ukasimr01.n03.fujitsu.local (Postfix) with ESMTPS id 4B211100191
	for <openembedded-core@lists.openembedded.org>;
 Tue, 30 Aug 2022 05:09:47 +0100 (BST)
Received: from localhost.localdomain (10.167.225.33) by
 R01UKEXCASM223.r01.fujitsu.local (10.182.185.121) with Microsoft SMTP Server
 (TLS) id 15.0.1497.32; Tue, 30 Aug 2022 05:09:45 +0100
From: Wang Mingyu <wangmy@fujitsu.com>
To: <openembedded-core@lists.openembedded.org>
CC: Wang Mingyu <wangmy@fujitsu.com>
Subject: [OE-core] [PATCH] libtasn1: upgrade 4.18.0 -> 4.19.0
Date: Tue, 30 Aug 2022 12:09:19 +0800
Message-ID: <1661832561-12506-3-git-send-email-wangmy@fujitsu.com>
X-Mailer: git-send-email 1.8.3.1
In-Reply-To: <1661832561-12506-1-git-send-email-wangmy@fujitsu.com>
References: <1661832561-12506-1-git-send-email-wangmy@fujitsu.com>
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
 https://lists.openembedded.org/g/openembedded-core/message/170049

Changelog:
===========
- Clarify libtasn1.map license.  Closes: #38.
- Fix ETYPE_OK out of bounds read.  Closes: #32.
- Update gnulib files and various maintenance fixes.

Signed-off-by: Wang Mingyu <wangmy@fujitsu.com>
---
 .../gnutls/{libtasn1_4.18.0.bb => libtasn1_4.19.0.bb}           | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)
 rename meta/recipes-support/gnutls/{libtasn1_4.18.0.bb => libtasn1_4.19.0.bb} (90%)

diff --git a/meta/recipes-support/gnutls/libtasn1_4.18.0.bb b/meta/recipes-support/gnutls/libtasn1_4.19.0.bb
similarity index 90%
rename from meta/recipes-support/gnutls/libtasn1_4.18.0.bb
rename to meta/recipes-support/gnutls/libtasn1_4.19.0.bb
index db49adc1c2..5fb8b54c06 100644
--- a/meta/recipes-support/gnutls/libtasn1_4.18.0.bb
+++ b/meta/recipes-support/gnutls/libtasn1_4.19.0.bb
@@ -16,7 +16,7 @@ SRC_URI = "${GNU_MIRROR}/libtasn1/libtasn1-${PV}.tar.gz \
 
 DEPENDS = "bison-native"
 
-SRC_URI[sha256sum] = "4365c154953563d64c67a024b607d1ee75c6db76e0d0f65709ea80a334cd1898"
+SRC_URI[sha256sum] = "1613f0ac1cf484d6ec0ce3b8c06d56263cc7242f1c23b30d82d23de345a63f7a"
 
 inherit autotools texinfo lib_package gtk-doc
 
-- 
2.25.1


