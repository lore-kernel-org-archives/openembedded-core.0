Return-Path: <wangmy@fujitsu.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 8ABE0C433F5
	for <webhook@archiver.kernel.org>; Mon, 30 May 2022 06:39:18 +0000 (UTC)
Received: from mail1.bemta34.messagelabs.com (mail1.bemta34.messagelabs.com
 [195.245.231.4])
 by mx.groups.io with SMTP id smtpd.web11.33650.1653892755373715464
 for <openembedded-core@lists.openembedded.org>;
 Sun, 29 May 2022 23:39:15 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@fujitsu.com header.s=170520fj header.b=RWj2A8fa;
 spf=pass (domain: fujitsu.com, ip: 195.245.231.4,
 mailfrom: wangmy@fujitsu.com)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=fujitsu.com;
	s=170520fj; t=1653892753; i=@fujitsu.com;
	bh=e6jpInaahfxrXdpPBVMorL7UGrdz9fUGKwxU59snVvM=;
	h=From:To:CC:Subject:Date:Message-ID:MIME-Version:Content-Type;
	b=RWj2A8fa6YuVWsafHniiRC+Sa2kA0vIT/NkF9t06m3HZbCHrigA3+xuYTyoIDLkqg
	 32ojyP7uLU+esjTFHp28bf2xnm7qjygBLT95U/cclps5WWz2ATwPZV16N7DhBEXbDy
	 5OmUEJXSmMZ5pI3owmKCOye5qtUlq3kCKTyl6jced9xuLteRdqyS6cLXB/T/AxQqzQ
	 RC1Ab4DKLdGFOLovfxyu2mKLNaegNnCq+eBIOykIMp9x4Dew//+fNdGBBkNgJ8HZnN
	 yqkMNgY7f3x3YTubxi51YlNWE5jow7TVPXKPqWq4yLTjrvoISEN++UPjSVxH75I4MS
	 X4KgxAeMJ/dgQ==
X-Brightmail-Tracker: H4sIAAAAAAAAA+NgFjrCIsWRWlGSWpSXmKPExsViZ8ORqDsxbUq
  Swe4//BZ3fr5jd2D0OLdxBWMAYxRrZl5SfkUCa8btU7cYC/o4K9pfX2dvYJzA0cXIxSEk8JhR
  on/qHyYI5zyTxPqb7xkhnD2MEhd/HQZyODnYBNQkpt+6wdrFyMEhIqAncfWfKEiYWUBF4sXvH
  nYQW1jAVqLlcBdYCYuAqsS6F0EgYV4BJ4lF86cwg9gSAgoSUx6+Z4aIC0qcnPmEBWKMhMTBFy
  +gahQlZl9uZoGwKyRmzNjGBmGrSVw9t4l5AiP/LCTts5C0L2BkWsVonVSUmZ5RkpuYmaNraGC
  ga2hoqmtsqWtkYKCXWKWbqJdaqlueWlyia6SXWF6sl1pcrFdcmZuck6KXl1qyiREYlCnF6id2
  MD5d+VPvEKMkB5OSKO9Z1clJQnxJ+SmVGYnFGfFFpTmpxYcYZTg4lCR445OnJAkJFqWmp1akZ
  eYAIwQmLcHBoyTCuyQBKM1bXJCYW5yZDpE6xWjMcfXKlb3MHDdApBBLXn5eqpQ47/lEoFIBkN
  KM0jy4QbDIvcQoKyXMy8jAwCDEU5BalJtZgir/ilGcg1FJmDclFWgKT2ZeCdy+V0CnMAGdws0
  0EeSUkkSElFQDU1LWLv3lesveBZ5WWnNLeubbasUTb/4HTk6fXvouL5jnx9T4I877WeZOf3vs
  qg/PliRuk95m7fbntsdTVpzgiPN41+qufyK8Jyvls8ddDRumCIm36+fs3rTFcfa+s0cUZVU+b
  2G4KH/x8K/exvZ8S6bdmtvWRG+9P7PzpKj7pcTOy9eSZi61b1e1+cIuGZY17XT8p21f5GzD59
  Q8UIvqa2IMEwgu5A38+nVTW7iF6Rn1jkXr7vQ3HRbwkS/yTZuxR2rt83dvdc/+/Vvue+GqyWz
  x2T+Tonhzl/9dftnokL//2p7Q4Iz92Te/v785v6LX3XSGQkpgit+eiASxv5kKK53Papy+Isk2
  meP1xKXVgkosxRmJhlrMRcWJAHJNzf9XAwAA
X-Env-Sender: wangmy@fujitsu.com
X-Msg-Ref: server-3.tower-571.messagelabs.com!1653892753!15142!1
X-Originating-IP: [62.60.8.97]
X-SYMC-ESS-Client-Auth: outbound-route-from=pass
X-StarScan-Received: 
X-StarScan-Version: 9.86.7; banners=-,-,-
X-VirusChecked: Checked
Received: (qmail 23663 invoked from network); 30 May 2022 06:39:13 -0000
Received: from unknown (HELO n03ukasimr01.n03.fujitsu.local) (62.60.8.97)
  by server-3.tower-571.messagelabs.com with ECDHE-RSA-AES256-GCM-SHA384
 encrypted SMTP; 30 May 2022 06:39:13 -0000
Received: from n03ukasimr01.n03.fujitsu.local (localhost [127.0.0.1])
	by n03ukasimr01.n03.fujitsu.local (Postfix) with ESMTP id C715C100191
	for <openembedded-core@lists.openembedded.org>;
 Mon, 30 May 2022 07:39:12 +0100 (BST)
Received: from R01UKEXCASM126.r01.fujitsu.local (unknown [10.183.43.178])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-SHA384 (256/256 bits))
	(No client certificate requested)
	by n03ukasimr01.n03.fujitsu.local (Postfix) with ESMTPS id B9EA9100180
	for <openembedded-core@lists.openembedded.org>;
 Mon, 30 May 2022 07:39:12 +0100 (BST)
Received: from localhost.localdomain (10.167.225.33) by
 R01UKEXCASM126.r01.fujitsu.local (10.183.43.178) with Microsoft SMTP Server
 (TLS) id 15.0.1497.32; Mon, 30 May 2022 07:38:52 +0100
From: Wang Mingyu <wangmy@fujitsu.com>
To: <openembedded-core@lists.openembedded.org>
CC: Wang Mingyu <wangmy@fujitsu.com>
Subject: [OE-core] [PATCH] asciidoc: upgrade 10.1.4 -> 10.2.0
Date: Mon, 30 May 2022 14:38:39 +0800
Message-ID: <1653892722-23407-1-git-send-email-wangmy@fujitsu.com>
X-Mailer: git-send-email 1.8.3.1
MIME-Version: 1.0
Content-Type: text/plain
X-Originating-IP: [10.167.225.33]
X-ClientProxiedBy: G08CNEXCHPEKD09.g08.fujitsu.local (10.167.33.85) To
 R01UKEXCASM126.r01.fujitsu.local (10.183.43.178)
X-Virus-Scanned: ClamAV using ClamSMTP
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Mon, 30 May 2022 06:39:18 -0000
X-Groupsio-URL: 
 https://lists.openembedded.org/g/openembedded-core/message/166262

Changelog:
Fix verbose output not working when using a2x or asciidoc entry points

Signed-off-by: Wang Mingyu <wangmy@fujitsu.com>
---
 .../asciidoc/{asciidoc_10.1.4.bb => asciidoc_10.2.0.bb}         | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)
 rename meta/recipes-extended/asciidoc/{asciidoc_10.1.4.bb => asciidoc_10.2.0.bb} (94%)

diff --git a/meta/recipes-extended/asciidoc/asciidoc_10.1.4.bb b/meta/recipes-extended/asciidoc/asciidoc_10.2.0.bb
similarity index 94%
rename from meta/recipes-extended/asciidoc/asciidoc_10.1.4.bb
rename to meta/recipes-extended/asciidoc/asciidoc_10.2.0.bb
index 4ab9edbce4..e112eb513d 100644
--- a/meta/recipes-extended/asciidoc/asciidoc_10.1.4.bb
+++ b/meta/recipes-extended/asciidoc/asciidoc_10.2.0.bb
@@ -10,7 +10,7 @@ LIC_FILES_CHKSUM = "file://COPYRIGHT;md5=aaee33adce0fc7cc40fee23f82f7f101 \
                     "
 
 SRC_URI = "git://github.com/asciidoc/asciidoc-py;protocol=https;branch=main"
-SRCREV = "c724bbf95b1840b04bb298a61a72b6a5ea94c2ef"
+SRCREV = "545b79b8d7dae70d12bf0657359bdd36de0c5c26"
 
 DEPENDS = "libxml2-native libxslt-native docbook-xml-dtd4-native docbook-xsl-stylesheets-native"
 
-- 
2.25.1


