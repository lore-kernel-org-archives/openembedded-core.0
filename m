Return-Path: <wangmy@fujitsu.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id B8D82C433EF
	for <webhook@archiver.kernel.org>; Mon, 28 Mar 2022 09:50:09 +0000 (UTC)
Received: from mail3.bemta32.messagelabs.com (mail3.bemta32.messagelabs.com
 [195.245.230.82])
 by mx.groups.io with SMTP id smtpd.web11.9061.1648461007817284487
 for <openembedded-core@lists.openembedded.org>;
 Mon, 28 Mar 2022 02:50:08 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@fujitsu.com header.s=170520fj header.b=ATnUgQLr;
 spf=pass (domain: fujitsu.com, ip: 195.245.230.82,
 mailfrom: wangmy@fujitsu.com)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=fujitsu.com;
	s=170520fj; t=1648461005; i=@fujitsu.com;
	bh=1nTInzQSI9JMONmu+0QEYkD2T/moH6v3qnyZxG6/i5E=;
	h=From:To:CC:Subject:Date:Message-ID:MIME-Version:Content-Type;
	b=ATnUgQLrPuP3F87zExvSJ7/Af6UO3Nj1Mzy+rB8Y9YH8BPwY7yzHGDAznKeyE3SrC
	 VC/nbjgdFvidPTEoNygBNFhKbx1Q/msXIHgH/FF+9raeHyaScuiHsmUW4k6f5jj37j
	 7TFdjOfij9S0TxL2yGEmGaFUKNnIwz+ssJo6EPxNdNSus7w7UymAeQM2Y7UJXRnjcS
	 EoNOJ40O2CxAkel2pTZNOOEWrf1HdiasAonCyvdT6yZD/6z80FFht07HW0nBfooEVb
	 in0q6vC1ZctjiT/kOtsZP85MjIB4Su9XcHGiVX8ov5fHp2BivWdteEHbgK97nT671B
	 i61woh7emiaGQ==
X-Brightmail-Tracker: H4sIAAAAAAAAA+NgFtrHIsWRWlGSWpSXmKPExsViZ8MxSfdsi2O
  SweNWKYs7P9+xOzB6nNu4gjGAMYo1My8pvyKBNaNz91K2giMiFYsev2NvYFwh1MXIxSEk8JhR
  Yv6yR8wQznkmiTUbXrBAOHsYJeasWsjaxcjJwSagJjH91g0gm4NDREBP4uo/UZAws4CKxIvfP
  ewgtrCAmcTTy41g5SwCqhLTHq0Bi/MKOEl07jzMDGJLCChITHn4nhkiLihxcuYTFog5EhIHX7
  yAqlGUmH25mQXCrpCYNauNCcJWk7h6bhPzBEb+WUjaZyFpX8DItIrRKqkoMz2jJDcxM0fX0MB
  A19DQVNdU18jIVC+xSjdRL7VUtzy1uETXUC+xvFgvtbhYr7gyNzknRS8vtWQTIzAoU4pZH+5g
  XNz3U+8QoyQHk5Ior1GmY5IQX1J+SmVGYnFGfFFpTmrxIUYZDg4lCd5bzUA5waLU9NSKtMwcY
  ITApCU4eJREeE2bgNK8xQWJucWZ6RCpU4y6HDu3XN7LLMSSl5+XKiXOewNkhgBIUUZpHtwIWL
  ReYpSVEuZlZGBgEOIpSC3KzSxBlX/FKM7BqCTMewpkCk9mXgncpldARzABHbH2nS3IESWJCCm
  pBibnvEU6Tz9xVVywf7vh37nFm9dkd5Y6nBOWfzZn77Og6Ocrz781M9/7ak+T/6cDnLa5Syca
  zgwWMraberXf6/zPje9cJdmOZqyJ5nrbt4VX87r5i/untecvCXL88n+NTInCoZtHfApOG1RNv
  Xa7ropvVeKKuZvFrpy9NP939Kbkex5tSTUu7hs3LHtxRsTo2SbW7AsvmHNZbn2c1RKwNKs87E
  xFIX+X+YGOc5dmbJiWcM78tShv7K/D5m1qS7yv3PT23GC7WbagmS914aVNdgeN5rRsO/vKeuX
  h+PZdeltm396W3dEqwDZbrUHg3pR9OY9mvZhrvqBkq8vW7d0pmxNNP9y5/oTt9/JQlmSH3jb2
  eiWW4oxEQy3mouJEAGqKWAVRAwAA
X-Env-Sender: wangmy@fujitsu.com
X-Msg-Ref: server-17.tower-585.messagelabs.com!1648461005!131098!1
X-Originating-IP: [62.60.8.146]
X-SYMC-ESS-Client-Auth: outbound-route-from=pass
X-StarScan-Received: 
X-StarScan-Version: 9.85.5; banners=-,-,-
X-VirusChecked: Checked
Received: (qmail 9472 invoked from network); 28 Mar 2022 09:50:05 -0000
Received: from unknown (HELO n03ukasimr02.n03.fujitsu.local) (62.60.8.146)
  by server-17.tower-585.messagelabs.com with ECDHE-RSA-AES256-GCM-SHA384
 encrypted SMTP; 28 Mar 2022 09:50:05 -0000
Received: from n03ukasimr02.n03.fujitsu.local (localhost [127.0.0.1])
	by n03ukasimr02.n03.fujitsu.local (Postfix) with ESMTP id E5BAB10044D
	for <openembedded-core@lists.openembedded.org>;
 Mon, 28 Mar 2022 10:50:04 +0100 (BST)
Received: from R01UKEXCASM126.r01.fujitsu.local (unknown [10.183.43.178])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-SHA384 (256/256 bits))
	(No client certificate requested)
	by n03ukasimr02.n03.fujitsu.local (Postfix) with ESMTPS id D823A10033B
	for <openembedded-core@lists.openembedded.org>;
 Mon, 28 Mar 2022 10:50:04 +0100 (BST)
Received: from localhost.localdomain (10.167.225.33) by
 R01UKEXCASM126.r01.fujitsu.local (10.183.43.178) with Microsoft SMTP Server
 (TLS) id 15.0.1497.32; Mon, 28 Mar 2022 10:49:54 +0100
From: Wang Mingyu <wangmy@fujitsu.com>
To: <openembedded-core@lists.openembedded.org>
CC: Wang Mingyu <wangmy@fujitsu.com>
Subject: [OE-core] [PATCH] apt: upgrade 2.4.0 -> 2.4.3
Date: Mon, 28 Mar 2022 17:49:37 +0800
Message-ID: <1648460981-15712-1-git-send-email-wangmy@fujitsu.com>
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
 <openembedded-core@lists.openembedded.org>; Mon, 28 Mar 2022 09:50:09 -0000
X-Groupsio-URL: 
 https://lists.openembedded.org/g/openembedded-core/message/163692

0001-aptwebserver.cc-Include-array.patch
refreshed for new version.

Signed-off-by: Wang Mingyu <wangmy@fujitsu.com>
---
 .../apt/apt/0001-aptwebserver.cc-Include-array.patch | 12 +++++-------
 .../apt/{apt_2.4.0.bb => apt_2.4.3.bb}               |  2 +-
 2 files changed, 6 insertions(+), 8 deletions(-)
 rename meta/recipes-devtools/apt/{apt_2.4.0.bb => apt_2.4.3.bb} (97%)

diff --git a/meta/recipes-devtools/apt/apt/0001-aptwebserver.cc-Include-array.patch b/meta/recipes-devtools/apt/apt/0001-aptwebserver.cc-Include-array.patch
index cfee50c7a0..2c1e617e55 100644
--- a/meta/recipes-devtools/apt/apt/0001-aptwebserver.cc-Include-array.patch
+++ b/meta/recipes-devtools/apt/apt/0001-aptwebserver.cc-Include-array.patch
@@ -1,4 +1,4 @@
-From f999aeb5ceb77b81c36e6a55300a521aaa2da882 Mon Sep 17 00:00:00 2001
+From 5985f366750a73c81c7d86893a2b959b4af062a5 Mon Sep 17 00:00:00 2001
 From: Khem Raj <raj.khem@gmail.com>
 Date: Wed, 26 May 2021 22:12:46 -0700
 Subject: [PATCH] aptwebserver.cc: Include <array>
@@ -11,22 +11,20 @@ test/interactive-helper/aptwebserver.cc:36:55: error: constexpr variable cannot
 
 Upstream-Status: Submitted [https://github.com/Debian/apt/pull/133]
 Signed-off-by: Khem Raj <raj.khem@gmail.com>
+
 ---
  test/interactive-helper/aptwebserver.cc | 1 +
  1 file changed, 1 insertion(+)
 
 diff --git a/test/interactive-helper/aptwebserver.cc b/test/interactive-helper/aptwebserver.cc
-index 58ba54f84..0e030c7e9 100644
+index f4f8d95..361c7a9 100644
 --- a/test/interactive-helper/aptwebserver.cc
 +++ b/test/interactive-helper/aptwebserver.cc
-@@ -22,6 +22,7 @@
- #include <unistd.h>
+@@ -23,6 +23,7 @@
  
+ #include <array>
  #include <algorithm>
 +#include <array>
  #include <fstream>
  #include <iostream>
  #include <list>
--- 
-2.31.1
-
diff --git a/meta/recipes-devtools/apt/apt_2.4.0.bb b/meta/recipes-devtools/apt/apt_2.4.3.bb
similarity index 97%
rename from meta/recipes-devtools/apt/apt_2.4.0.bb
rename to meta/recipes-devtools/apt/apt_2.4.3.bb
index c95e36e3d0..27e455747f 100644
--- a/meta/recipes-devtools/apt/apt_2.4.0.bb
+++ b/meta/recipes-devtools/apt/apt_2.4.3.bb
@@ -25,7 +25,7 @@ SRC_URI:append:class-nativesdk = " \
            file://0001-Revert-always-run-dpkg-configure-a-at-the-end-of-our.patch \
            "
 
-SRC_URI[sha256sum] = "728c69df369cbc4a55f91fc2817fe9832c1a2f39de4142e7ef222c5158f234af"
+SRC_URI[sha256sum] = "5a7215ca924302da0b2205862cd2d651326eea222a589184ec6ce663885729f7"
 LIC_FILES_CHKSUM = "file://COPYING.GPL;md5=b234ee4d69f5fce4486a80fdaf4a4263"
 
 # the package is taken from snapshots.debian.org; that source is static and goes stale
-- 
2.25.1


