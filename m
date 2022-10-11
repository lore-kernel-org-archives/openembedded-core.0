Return-Path: <wangmy@fujitsu.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id E5757C433F5
	for <webhook@archiver.kernel.org>; Tue, 11 Oct 2022 08:06:38 +0000 (UTC)
Received: from mail1.bemta37.messagelabs.com (mail1.bemta37.messagelabs.com
 [85.158.142.113])
 by mx.groups.io with SMTP id smtpd.web10.4766.1665475593048526601
 for <openembedded-core@lists.openembedded.org>;
 Tue, 11 Oct 2022 01:06:34 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@fujitsu.com header.s=170520fj header.b=D4TdXnL5;
 spf=pass (domain: fujitsu.com, ip: 85.158.142.113,
 mailfrom: wangmy@fujitsu.com)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=fujitsu.com;
	s=170520fj; t=1665475591; i=@fujitsu.com;
	bh=m6weITdtxq8qPzhU1qlWYjtmS8bz/1KS3BMODTlNh9g=;
	h=From:To:CC:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type;
	b=D4TdXnL5yL2GaErOtfmocvz6jy3Mtrkgtlo8tf4aesQA8Pb6EYYbjlvHbdVeQGWiX
	 ndKgII5h0PVAGRMseM/+AeFPs7wPVP3Ie3+4Gr2+TMczFZVYAuLkBPtZjCffLYCnc7
	 kuoBdMqcuWhW//3EGQgIyZ9c+Z2ghp9uW65u3ZwfEMNVyjMiwSsOPlEt+Ig2sBuIG5
	 Ix4XPFEdlm/HNiZFO5l38fm6Jx0YJcoRyfyCQaWtvcg+KjGN8NawPesgTdKzzfxA22
	 ryq3552m/QmFUxA3sZkdiFoqvrtlS7rTnOx510Smuu5Vi6JvsrQcfvBz5grz7hHy3j
	 hrkVV3qJ22ZuA==
X-Brightmail-Tracker: H4sIAAAAAAAAA+NgFrrBIsWRWlGSWpSXmKPExsViZ8OxWZdNxTX
  Z4NI9M4s7P9+xOzB6nNu4gjGAMYo1My8pvyKBNWNeXyNLwTyOipv965kaGNewdzFycQgJPGCU
  uHHnAxuEc4lJYtuk30wQzh5GiTfX1zJ2MXJysAmoSUy/dYO1i5GDQ0RAT+LqP1GQMLOAisSL3
  z3sILawgI3En66PrCA2i4CqxLN3b5lAbF4BJ4kVVw6xgNgSAgoSUx6+ZwaxOQWcJZ70XAKLCw
  HVbG5ZzwxRLyhxcuYTFoj5EhIHX7xghuhVlJh9uRlqToXErFltTBC2msTVc5uYJzAKzkLSPgt
  J+wJGplWMNklFmekZJbmJmTm6hgYGuoaGprqWZrqGxkZ6iVW6iXqppbp5+UUlGbqGeonlxXqp
  xcV6xZW5yTkpenmpJZsYgYGcUpzQsoPx9r5feocYJTmYlER5rz53SRbiS8pPqcxILM6ILyrNS
  S0+xCjDwaEkwftLyTVZSLAoNT21Ii0zBxhVMGkJDh4lEd4eKaA0b3FBYm5xZjpE6hSjLsfMr2
  0HmIVY8vLzUqXEeXOVgYoEQIoySvPgRsAi/BKjrJQwLyMDA4MQT0FqUW5mCar8K0ZxDkYlYV5
  lkCk8mXklcJteAR3BBHTEyatOIEeUJCKkpBqYdhUsy1XJ2HYv0uain+XULjfp5qmOZQdKfh1/
  1P/oy6ml1/N+/1hT2+iW/5n94MKAsP82Auorn77wKj1nttSVq2Vbwb/sspWHpTPmuX8KfTTv0
  IaZcpfn9LBPawufM2X5taSSpzfLb4TLTOh9EsxSF5R+pjOn3NDyvE3jvZ/L9yovDZ45752YYu
  3jXvceB//PMzdsynl+8p72AUUnW2aT62zMrpMWMyb1zjSPvepQ/GtW/Kt3zesvlomuv78hd2u
  Z0zerGJ0Plvo+3RW8ViKVnmwxvSfb1wXnzRL+OPnM8qURUgb7FpU7ftR20tqwtDD89sFD0ywZ
  9sxb57ecXXCLUcJOqc0pcfZff9rO+VaRpcRSnJFoqMVcVJwIAPS+gLZrAwAA
X-Env-Sender: wangmy@fujitsu.com
X-Msg-Ref: server-13.tower-732.messagelabs.com!1665475590!58729!1
X-Originating-IP: [62.60.8.179]
X-SYMC-ESS-Client-Auth: outbound-route-from=pass
X-StarScan-Received: 
X-StarScan-Version: 9.87.3; banners=-,-,-
X-VirusChecked: Checked
Received: (qmail 31010 invoked from network); 11 Oct 2022 08:06:30 -0000
Received: from unknown (HELO n03ukasimr04.n03.fujitsu.local) (62.60.8.179)
  by server-13.tower-732.messagelabs.com with ECDHE-RSA-AES256-GCM-SHA384
 encrypted SMTP; 11 Oct 2022 08:06:30 -0000
Received: from n03ukasimr04.n03.fujitsu.local (localhost [127.0.0.1])
	by n03ukasimr04.n03.fujitsu.local (Postfix) with ESMTP id 54D91142
	for <openembedded-core@lists.openembedded.org>;
 Tue, 11 Oct 2022 09:06:30 +0100 (BST)
Received: from R01UKEXCASM126.r01.fujitsu.local (R01UKEXCASM126
 [10.183.43.178])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-SHA384 (256/256 bits))
	(No client certificate requested)
	by n03ukasimr04.n03.fujitsu.local (Postfix) with ESMTPS id 4832973
	for <openembedded-core@lists.openembedded.org>;
 Tue, 11 Oct 2022 09:06:30 +0100 (BST)
Received: from localhost.localdomain (10.167.225.33) by
 R01UKEXCASM126.r01.fujitsu.local (10.183.43.178) with Microsoft SMTP Server
 (TLS) id 15.0.1497.32; Tue, 11 Oct 2022 09:06:28 +0100
From: Wang Mingyu <wangmy@fujitsu.com>
To: <openembedded-core@lists.openembedded.org>
CC: Wang Mingyu <wangmy@fujitsu.com>
Subject: [OE-core] [PATCH] pango: upgrade 1.50.10 -> 1.50.11
Date: Tue, 11 Oct 2022 16:05:57 +0800
Message-ID: <1665475558-16409-4-git-send-email-wangmy@fujitsu.com>
X-Mailer: git-send-email 1.8.3.1
In-Reply-To: <1665475558-16409-1-git-send-email-wangmy@fujitsu.com>
References: <1665475558-16409-1-git-send-email-wangmy@fujitsu.com>
MIME-Version: 1.0
Content-Type: text/plain
X-Originating-IP: [10.167.225.33]
X-ClientProxiedBy: G08CNEXCHPEKD07.g08.fujitsu.local (10.167.33.80) To
 R01UKEXCASM126.r01.fujitsu.local (10.183.43.178)
X-Virus-Scanned: ClamAV using ClamSMTP
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Tue, 11 Oct 2022 08:06:38 -0000
X-Groupsio-URL: 
 https://lists.openembedded.org/g/openembedded-core/message/171603

Signed-off-by: Wang Mingyu <wangmy@fujitsu.com>
---
 .../pango/{pango_1.50.10.bb => pango_1.50.11.bb}                | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)
 rename meta/recipes-graphics/pango/{pango_1.50.10.bb => pango_1.50.11.bb} (94%)

diff --git a/meta/recipes-graphics/pango/pango_1.50.10.bb b/meta/recipes-graphics/pango/pango_1.50.11.bb
similarity index 94%
rename from meta/recipes-graphics/pango/pango_1.50.10.bb
rename to meta/recipes-graphics/pango/pango_1.50.11.bb
index 95209889a8..1120e053b8 100644
--- a/meta/recipes-graphics/pango/pango_1.50.10.bb
+++ b/meta/recipes-graphics/pango/pango_1.50.11.bb
@@ -24,7 +24,7 @@ SRC_URI += "file://run-ptest \
             file://0001-Skip-running-test-layout-test.patch \
 "
 
-SRC_URI[archive.sha256sum] = "7e5d2f1e40854d24a9a2c4d093bafe75dcdbeccdf1de43e4437332eabed64966"
+SRC_URI[archive.sha256sum] = "8800f812d89ee61388188703203f3a7878963c22f8695aaf1fa0a1a1428d17ae"
 
 DEPENDS = "glib-2.0 glib-2.0-native fontconfig freetype virtual/libiconv cairo harfbuzz fribidi"
 
-- 
2.25.1


