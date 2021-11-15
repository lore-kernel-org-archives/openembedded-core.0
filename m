Return-Path: <wangmy@fujitsu.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 23C02C433F5
	for <webhook@archiver.kernel.org>; Mon, 15 Nov 2021 15:39:49 +0000 (UTC)
Received: from mail1.bemta25.messagelabs.com (mail1.bemta25.messagelabs.com
 [195.245.230.68])
 by mx.groups.io with SMTP id smtpd.web11.23902.1636990787512279001
 for <openembedded-core@lists.openembedded.org>;
 Mon, 15 Nov 2021 07:39:48 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@fujitsu.com header.s=170520fj header.b=h0VEtmA0;
 spf=pass (domain: fujitsu.com, ip: 195.245.230.68,
 mailfrom: wangmy@fujitsu.com)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=fujitsu.com;
	s=170520fj; t=1636990785; i=@fujitsu.com;
	bh=lqQDeWbawi9jogFkQc5vFysOdqkvm6SYFnVuqNZOR4w=;
	h=From:To:CC:Subject:Date:Message-ID:MIME-Version:Content-Type;
	b=h0VEtmA0Meeod9YWzGG1+d4svKWiE1Y31M9Xd6CGwDfMFLfAFuLMHdmBxNlkOrmdQ
	 QOTqrlKtEIrhtUhu1CdNySTCZL8ZacXUHvijJTQ6EywTfIDr6PPXxFfcHsW2oJ4Sig
	 v1mZRzP8OdB2jN2lPn7rjnwZah4HZToU5qPSM0ovLNEuGoL2F95FVu1Gf1h40mW9/J
	 BTgPapU4TBDvd91A4jGovBAYjg9L/zPR3FymA4/4LGMDZz35ntNt26VrlQ8w5cMWuT
	 f3TNcAWWQ2gAxDQ5Fenc+y5k5QRrUECR/sXaOul1rB5EEiwxHaOQVvqbcfC23pxMyv
	 VheO4zEZZGrEQ==
Received: from [100.112.198.7] (using TLSv1.2 with cipher
 DHE-RSA-AES256-GCM-SHA384 (256 bits))
	by server-4.bemta.az-b.eu-west-1.aws.symcld.net id A0/FA-08711-04F72916;
 Mon, 15 Nov 2021 15:39:44 +0000
X-Brightmail-Tracker: H4sIAAAAAAAAA+NgFlrPIsWRWlGSWpSXmKPExsViZ8MxSdehflK
  iwaq3ChZ3fr5jd2D0OLdxBWMAYxRrZl5SfkUCa0b3vWtMBVvFKu7e6WdsYJwn0sXIxSEk8JhR
  4s7/VhYI5zyTxJtbM5ghnBOMEq/f7WXvYuTkYBNQk5h+6wZrFyMHh4iAnsTVf6IgYWYBFYkXv
  3vASoQFbCXetv4BK2ERUJVovpkPEuYVcJLY9OQsI4gtIaAgMeXhe2aIuKDEyZlPWCDGSEgcfP
  GCGaJGUWL25WYWCLtCYtasNiYIW03i6rlNzBMY+WchaZ+FpH0BI9MqRoukosz0jJLcxMwcXUM
  DA11DQyNdQ0szXSNDY73EKt0kvdRS3fLU4hJdQ73E8mK94src5JwUvbzUkk2MwHBMKThydQdj
  95sPeocYJTmYlER5/+hPShTiS8pPqcxILM6ILyrNSS0+xCjDwaEkwbu7FCgnWJSanlqRlpkDj
  A2YtAQHj5II74YqoDRvcUFibnFmOkTqFKOilDjvsVqghABIIqM0D64NFo+XGGWlhHkZGRgYhH
  gKUotyM0tQ5V8xinMwKgnzbq4BmsKTmVcCN/0V0GImoMX29/pBFpckIqSkGpj2fOx6IyuqGyx
  tfOKrzFGR5q2LmOtPv+JpnL5i/k0t670+jHsvRJpLKvIt4v1y6+266cXxWsbMTXkFU7LnTIx2
  Wer0O3vn0eum/g+5Sxc2VE3kfFB6fUIOy1QWpdU5cw14PTfKnb0f3vmjde6yWXWu11iTUk4Uh
  fPeZr88pbnkNecim5WxKTxx6/ovCa0N1nilrxiy99A9O8WryfG3Or2PneBh5bHf5GteIeu48o
  DBh/o51bNdZN0EJtTYmAjHRO2Njv1mtartWNCx5SsVOO+qXzq88VfkscLVE49Nemyb81j4UMM
  Sl5C94VJ1nKZ6/2w2acnJXZ2rueGRfoV2eVGNsZghz1fxgtlz5fOmKCmxFGckGmoxFxUnAgBx
  DSfmQgMAAA==
X-Env-Sender: wangmy@fujitsu.com
X-Msg-Ref: server-9.tower-291.messagelabs.com!1636990784!501351!1
X-Originating-IP: [62.60.8.146]
X-SYMC-ESS-Client-Auth: outbound-route-from=pass
X-StarScan-Received: 
X-StarScan-Version: 9.81.5; banners=-,-,-
X-VirusChecked: Checked
Received: (qmail 31925 invoked from network); 15 Nov 2021 15:39:44 -0000
Received: from unknown (HELO n03ukasimr02.n03.fujitsu.local) (62.60.8.146)
  by server-9.tower-291.messagelabs.com with ECDHE-RSA-AES256-GCM-SHA384
 encrypted SMTP; 15 Nov 2021 15:39:44 -0000
Received: from n03ukasimr02.n03.fujitsu.local (localhost [127.0.0.1])
	by n03ukasimr02.n03.fujitsu.local (Postfix) with ESMTP id 17728100465
	for <openembedded-core@lists.openembedded.org>;
 Mon, 15 Nov 2021 15:39:44 +0000 (GMT)
Received: from R01UKEXCASM126.r01.fujitsu.local (unknown [10.183.43.178])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-SHA384 (256/256 bits))
	(No client certificate requested)
	by n03ukasimr02.n03.fujitsu.local (Postfix) with ESMTPS id 0B0F5100440
	for <openembedded-core@lists.openembedded.org>;
 Mon, 15 Nov 2021 15:39:44 +0000 (GMT)
Received: from localhost.localdomain.localdomain (10.167.225.33) by
 R01UKEXCASM126.r01.fujitsu.local (10.183.43.178) with Microsoft SMTP Server
 (TLS) id 15.0.1497.24; Mon, 15 Nov 2021 15:39:22 +0000
From: Wang Mingyu <wangmy@fujitsu.com>
To: <openembedded-core@lists.openembedded.org>
CC: Wang Mingyu <wangmy@fujitsu.com>
Subject: [OE-core] [PATCH] libtasn1: upgrade 4.17.0 -> 4.18.0
Date: Mon, 15 Nov 2021 23:39:10 +0800
Message-ID: <1636990751-78972-1-git-send-email-wangmy@fujitsu.com>
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
 <openembedded-core@lists.openembedded.org>; Mon, 15 Nov 2021 15:39:49 -0000
X-Groupsio-URL: 
 https://lists.openembedded.org/g/openembedded-core/message/158303

* Noteworthy changes in release 4.18.0 (2021-11-09) [stable]
- Improve GTK-DOC manual.  Closes: #35.
- Improve --help and --version for tools with gnulib.  Closes: #37.
- Update gnulib files and various maintenance fixes.

refresh dont-depend-on-help2man.patch

Signed-off-by: Wang Mingyu <wangmy@fujitsu.com>
---
 .../libtasn1/dont-depend-on-help2man.patch    | 26 ++++++++++++++-----
 ...{libtasn1_4.17.0.bb => libtasn1_4.18.0.bb} |  3 +--
 2 files changed, 20 insertions(+), 9 deletions(-)
 rename meta/recipes-support/gnutls/{libtasn1_4.17.0.bb => libtasn1_4.18.0.bb} (84%)

diff --git a/meta/recipes-support/gnutls/libtasn1/dont-depend-on-help2man.patch b/meta/recipes-support/gnutls/libtasn1/dont-depend-on-help2man.patch
index 2ac89f3b32..216d636793 100644
--- a/meta/recipes-support/gnutls/libtasn1/dont-depend-on-help2man.patch
+++ b/meta/recipes-support/gnutls/libtasn1/dont-depend-on-help2man.patch
@@ -1,14 +1,26 @@
+From 629fc6427710e48b78f8b1f300dd698fe898cfd4 Mon Sep 17 00:00:00 2001
+From: Marko Lindqvist <cazfi74@gmail.com>
+Date: Mon, 7 Jan 2013 01:49:40 +0200
+Subject: [PATCH] libtasn1: remove help2man dependency
+
 Upstream-Status: Inappropriate
 
 Signed-off-by: Marko Lindqvist <cazfi74@gmail.com>
-diff -Nurd libtasn1-2.14/doc/Makefile.am libtasn1-2.14/doc/Makefile.am
---- libtasn1-2.14/doc/Makefile.am	2012-09-24 15:08:42.000000000 +0300
-+++ libtasn1-2.14/doc/Makefile.am	2013-01-03 07:35:26.702763403 +0200
-@@ -31,7 +31,7 @@
- AM_MAKEINFOHTMLFLAGS = $(AM_MAKEINFOFLAGS) \
-	--no-split --number-sections --css-include=texinfo.css
 
+---
+ doc/Makefile.am | 2 +-
+ 1 file changed, 1 insertion(+), 1 deletion(-)
+
+diff --git a/doc/Makefile.am b/doc/Makefile.am
+index a0171a5..8aa4d3d 100644
+--- a/doc/Makefile.am
++++ b/doc/Makefile.am
+@@ -28,7 +28,7 @@ libtasn1_TEXINFOS += asn1Coding-help.texi asn1Decoding-help.texi asn1Parser-help
+ 
+ AM_MAKEINFOHTMLFLAGS = --no-split $(AM_MAKEINFOFLAGS)
+ 
 -dist_man_MANS = $(gdoc_MANS) asn1Parser.1 asn1Coding.1 asn1Decoding.1
 +dist_man_MANS = $(gdoc_MANS)
-
+ 
  HELP2MAN_OPTS = --info-page libtasn1
+ 
diff --git a/meta/recipes-support/gnutls/libtasn1_4.17.0.bb b/meta/recipes-support/gnutls/libtasn1_4.18.0.bb
similarity index 84%
rename from meta/recipes-support/gnutls/libtasn1_4.17.0.bb
rename to meta/recipes-support/gnutls/libtasn1_4.18.0.bb
index 111f5ac13d..a0b91ee576 100644
--- a/meta/recipes-support/gnutls/libtasn1_4.17.0.bb
+++ b/meta/recipes-support/gnutls/libtasn1_4.18.0.bb
@@ -16,8 +16,7 @@ SRC_URI = "${GNU_MIRROR}/libtasn1/libtasn1-${PV}.tar.gz \
 
 DEPENDS = "bison-native"
 
-SRC_URI[md5sum] = "c46f6eb3bd1287031ae5d36465094402"
-SRC_URI[sha256sum] = "ece7551cea7922b8e10d7ebc70bc2248d1fdd73351646a2d6a8d68a9421c45a5"
+SRC_URI[sha256sum] = "4365c154953563d64c67a024b607d1ee75c6db76e0d0f65709ea80a334cd1898"
 
 inherit autotools texinfo lib_package gtk-doc
 
-- 
2.25.1


