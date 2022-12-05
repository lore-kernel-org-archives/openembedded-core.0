Return-Path: <wangmy@fujitsu.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 0DDCCC4321E
	for <webhook@archiver.kernel.org>; Mon,  5 Dec 2022 02:33:22 +0000 (UTC)
Received: from mail3.bemta32.messagelabs.com (mail3.bemta32.messagelabs.com [195.245.230.82])
 by mx.groups.io with SMTP id smtpd.web11.5503.1670207594139723160
 for <openembedded-core@lists.openembedded.org>;
 Sun, 04 Dec 2022 18:33:14 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@fujitsu.com header.s=170520fj header.b=PYLw57wq;
 spf=pass (domain: fujitsu.com, ip: 195.245.230.82, mailfrom: wangmy@fujitsu.com)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=fujitsu.com;
	s=170520fj; t=1670207592; i=@fujitsu.com;
	bh=pbsqG0yczllHOrsde42i78MyERFH8RrAYQ3epbsTvpk=;
	h=From:To:CC:Subject:Date:Message-ID:MIME-Version:Content-Type;
	b=PYLw57wqZXz5fcQIP6maCj6clvVCmmGnvLJzO2U3ggLvwh4AY3Xa0tawuqG4BDccW
	 MMj4Hdh7vIayj177tq18XhsXl0zq2ATZLGWVfQ7wLPu6m+wtoGEeQhSEzgL8Hs9hAs
	 0dmBcG24I42aoff4uD+889lLBH0la64XqlOrMZsQGECapHSmnmBPkvuet5sAjh+5/O
	 9K2Ln2Zf3SLO4IXYfrUWjcPfLoFVdHeTfFq7FyVhM3/MG7mPZY0XeGIl/L7/I+RlsS
	 tbYic/wiTX4drjyyYkQvh3y8i94P+EcDk3poB6vjV/ut2wdVtwgGlkT4d1Y7f0+Uir
	 okhgydAtQeA4w==
X-Brightmail-Tracker: H4sIAAAAAAAAA+NgFjrFIsWRWlGSWpSXmKPExsViZ8OxWTc9ojf
  Z4MM5Pos7P9+xOzB6nNu4gjGAMYo1My8pvyKBNWPRkRvMBc+EK6b+WsfUwDhXsIuRk0NI4D6j
  xLcTul2MXED2JSaJ1+8XskM4uxkljra1M4NUsQlISdy4/5+ti5GDQ0RAT+LqP1GQMLOAisSL3
  z3sIGFhAQuJbdNSQMIsQOEbu7ayg9i8Ao4SXw9OAZsiIaAgMeXhe2aIuKDEyZlPWCDGSEgcfP
  ECqkZRYvblZhYIu0Ji1qw2JghbTeLquU3MExj5ZyFpn4WkfQEj0ypGs+LUorLUIl1DM72kosz
  0jJLcxMwcvcQq3US91FLd8tTiEl1DvcTyYr3U4mK94src5JwUvbzUkk2MwEBMKWZ6voPx7LI/
  eocYJTmYlER5lR51JwvxJeWnVGYkFmfEF5XmpBYfYpTh4FCS4I0O600WEixKTU+tSMvMAUYFT
  FqCg0dJhFfIGyjNW1yQmFucmQ6ROsVoz/Hxz8W9zBxTZ//bz8yxHEzO/Np2gFmIJS8/L1VKnL
  c3HKhNAKQtozQPbigsii8xykoJ8zIyMDAI8RSkFuVmlqDKv2IU52BUEuZ18wWawpOZVwK3+xX
  QWUxAZ23k7wI5qyQRISXVwJS9T0hCam1lVEb4h8Xyv+PqmfcEP5WKLgl3VrfIvLn+ylwdJXX9
  pfXv5+W1BqU/nCEZ1bjtZAjH9O/6UW/4GlpuqWnXS3qbzyrK+bz1i5lM844FTbH3PzMsnx5wo
  kDmYHr/R6HahOA6XauItWd3vIzT6tLr7v/OsbHQVuF8xCa+Ld+fHPkkZOCru/SAYF1oj/HS6L
  uKukuXtz1m1YmalDJLcsGXrC0xht/Kv66Ya71i8Yb1DlYpgVNSondvt2TV/hJ84mdN2IYP4a+
  KZ4R1PfaSVH0q90y4eJWMsUa68seiWMObdkfqVDvV44t2TQpa2T7llFrPlsCVUex9XJ8PWs1I
  /v9mxdPls86HfFkep8RSnJFoqMVcVJwIAEJ2FM9dAwAA
X-Env-Sender: wangmy@fujitsu.com
X-Msg-Ref: server-20.tower-585.messagelabs.com!1670207591!270595!1
X-Originating-IP: [62.60.8.179]
X-SYMC-ESS-Client-Auth: outbound-route-from=pass
X-StarScan-Received: 
X-StarScan-Version: 9.101.1; banners=-,-,-
X-VirusChecked: Checked
Received: (qmail 6199 invoked from network); 5 Dec 2022 02:33:11 -0000
Received: from unknown (HELO n03ukasimr04.n03.fujitsu.local) (62.60.8.179)
  by server-20.tower-585.messagelabs.com with ECDHE-RSA-AES256-GCM-SHA384 encrypted SMTP; 5 Dec 2022 02:33:11 -0000
Received: from n03ukasimr04.n03.fujitsu.local (localhost [127.0.0.1])
	by n03ukasimr04.n03.fujitsu.local (Postfix) with ESMTP id DB7027B
	for <openembedded-core@lists.openembedded.org>; Mon,  5 Dec 2022 02:33:10 +0000 (GMT)
Received: from R01UKEXCASM126.r01.fujitsu.local (R01UKEXCASM126 [10.183.43.178])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-SHA384 (256/256 bits))
	(No client certificate requested)
	by n03ukasimr04.n03.fujitsu.local (Postfix) with ESMTPS id CF08773
	for <openembedded-core@lists.openembedded.org>; Mon,  5 Dec 2022 02:33:10 +0000 (GMT)
Received: from localhost.localdomain (10.167.225.33) by
 R01UKEXCASM126.r01.fujitsu.local (10.183.43.178) with Microsoft SMTP Server
 (TLS) id 15.0.1497.42; Mon, 5 Dec 2022 02:33:09 +0000
From: <wangmy@fujitsu.com>
To: <openembedded-core@lists.openembedded.org>
CC: Wang Mingyu <wangmy@fujitsu.com>
Subject: [OE-core] [PATCH] texinfo: upgrade 7.0 -> 7.0.1
Date: Mon, 5 Dec 2022 10:32:38 +0800
Message-ID: <1670207562-7127-1-git-send-email-wangmy@fujitsu.com>
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
 <openembedded-core@lists.openembedded.org>; Mon, 05 Dec 2022 02:33:22 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/174271

From: Wang Mingyu <wangmy@fujitsu.com>

dont-depend-on-help2man.patch
refreshed for 7.0.1

Signed-off-by: Wang Mingyu <wangmy@fujitsu.com>
---
 .../texinfo/texinfo/dont-depend-on-help2man.patch           | 6 +++---
 .../texinfo/{texinfo_7.0.bb => texinfo_7.0.1.bb}            | 2 +-
 2 files changed, 4 insertions(+), 4 deletions(-)
 rename meta/recipes-extended/texinfo/{texinfo_7.0.bb => texinfo_7.0.1.bb} (97%)

diff --git a/meta/recipes-extended/texinfo/texinfo/dont-depend-on-help2man.patch b/meta/recipes-extended/texinfo/texinfo/dont-depend-on-help2man.patch
index 969e2844cd..825887cc2e 100644
--- a/meta/recipes-extended/texinfo/texinfo/dont-depend-on-help2man.patch
+++ b/meta/recipes-extended/texinfo/texinfo/dont-depend-on-help2man.patch
@@ -1,4 +1,4 @@
-From a2230125082000a1b28b3867f86baa8d80b63df2 Mon Sep 17 00:00:00 2001
+From 451a9b9c3874872d575693fc7733fae02690a7d3 Mon Sep 17 00:00:00 2001
 From: Edwin Plauchu <edwin.plauchu.camacho@intel.com>
 Date: Tue, 29 Nov 2016 13:43:24 -0600
 Subject: [PATCH] dont-depend-on-help2man
@@ -14,7 +14,7 @@ Signed-off-by: Edwin Plauchu <edwin.plauchu.camacho@intel.com>
  2 files changed, 7 insertions(+), 7 deletions(-)
 
 diff --git a/doc/Makefile.am b/doc/Makefile.am
-index a1f5b54..5cff41f 100644
+index 407a38c..6b5ff3e 100644
 --- a/doc/Makefile.am
 +++ b/doc/Makefile.am
 @@ -55,7 +55,7 @@ refcard_files = refcard/Makefile refcard/txicmdcheck \
@@ -24,8 +24,8 @@ index a1f5b54..5cff41f 100644
 -	     $(man_MANS) $(TXI_XLATE) \
 +	     $(TXI_XLATE) \
               $(refcard_files) \
+              gendocs.chapter/gendocs_template \
  	     texinfo-tex-test.texi texinfo-tex-test.WIDOWs \
-              texinfo-ja.tex short-sample-ja.texi \
 diff --git a/man/Makefile.am b/man/Makefile.am
 index d0cd72c..a19e52a 100644
 --- a/man/Makefile.am
diff --git a/meta/recipes-extended/texinfo/texinfo_7.0.bb b/meta/recipes-extended/texinfo/texinfo_7.0.1.bb
similarity index 97%
rename from meta/recipes-extended/texinfo/texinfo_7.0.bb
rename to meta/recipes-extended/texinfo/texinfo_7.0.1.bb
index a8933f2b7e..f0f9211594 100644
--- a/meta/recipes-extended/texinfo/texinfo_7.0.bb
+++ b/meta/recipes-extended/texinfo/texinfo_7.0.1.bb
@@ -35,7 +35,7 @@ SRC_URI = "${GNU_MIRROR}/texinfo/${BP}.tar.gz \
            ${TARGET_PATCH} \
            "
 
-SRC_URI[sha256sum] = "9261d4ee11cdf6b61895e213ffcd6b746a61a64fe38b9741a3aaa73125b35170"
+SRC_URI[sha256sum] = "53c01dd34c9bf116866d03aabd38c5cd9ee95ac10043d61aa33dec0d27825d8d"
 
 tex_texinfo = "texmf/tex/texinfo"
 
-- 
2.25.1


