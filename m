Return-Path: <wangmy@fujitsu.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 3776CC4332F
	for <webhook@archiver.kernel.org>; Tue, 11 Oct 2022 08:39:49 +0000 (UTC)
Received: from mail1.bemta37.messagelabs.com (mail1.bemta37.messagelabs.com
 [85.158.142.2])
 by mx.groups.io with SMTP id smtpd.web09.5040.1665477585011683708
 for <openembedded-core@lists.openembedded.org>;
 Tue, 11 Oct 2022 01:39:45 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@fujitsu.com header.s=170520fj header.b=RH8n02pw;
 spf=pass (domain: fujitsu.com, ip: 85.158.142.2,
 mailfrom: wangmy@fujitsu.com)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=fujitsu.com;
	s=170520fj; t=1665477582; i=@fujitsu.com;
	bh=si0XHD718hbX5UFwlVWV5HWOknqkDqHmw/0W5f+VED4=;
	h=From:To:CC:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type;
	b=RH8n02pwzUOslHU2suQUWbyYRz69xvYwTt3sGAF7Fq6RlNIWaTK4Ief9V/khRqPep
	 8uyl1gk3U7uphx2j+5YnP/oBljXxMvSiMFdnuKQapLp2J3VY1Zozcz7Ft63KDwGQs8
	 ety45oHmEVteAMmwDZMbTRfoz8OQqT74fge/U/ZKrcndJaD2nm/tXwuaX2DamTJFuY
	 Ql8bewSYDg4eTrJ2HIEG24nKHdLV8TbacfistoD4U7cse9m5qkS621YfpTBBBOZtjO
	 Aat3tcGF93joYD3w+ktdLyKaSBQhgzbTfiX/TbqFMvm4mxWXM/RpCLjD3k62GVWRV3
	 /EsZHEvl0/xcw==
X-Brightmail-Tracker: H4sIAAAAAAAAA+NgFnrBIsWRWlGSWpSXmKPExsViZ8OxWfectmu
  ywf3rvBZ3fr5jd2D0OLdxBWMAYxRrZl5SfkUCa8a8Nx+ZC3o5Kw41LWJrYNzI0cXIxSEkcJ9R
  YtbbpawQziUmiQ2rF0M5exglNs1aw9jFyMnBJqAmMf3WDaAEB4eIgJ7E1X+iIGFmARWJF7972
  EHCwgKOEt+e2IOEWQRUJb6cvAXWySvgJDH/eTsbiC0hoCAx5eF7ZpByTgFniYP7a0HCQkAlay
  d1sECUC0qcnPmEBWK6hMTBFy+YIVoVJWZfbmaBsCskZs1qY4Kw1SSuntvEPIFRcBaS9llI2hc
  wMq1itEkqykzPKMlNzMzRNTQw0DU0NNW1tARSlnqJVbqJeqmlunn5RSUZuoZ6ieXFeqnFxXrF
  lbnJOSl6eaklmxiBQZxSnFy+g3H7vl96hxglOZiURHm71F2ThfiS8lMqMxKLM+KLSnNSiw8xy
  nBwKEnwemsB5QSLUtNTK9Iyc4ARBZOW4OBREuFdqgKU5i0uSMwtzkyHSJ1itOdY23BgLzPH1N
  n/9jNzLAeTM7+2HWAWYsnLz0uVEue1AMawkABIW0ZpHtxQWAK4xCgrJczLyMDAIMRTkFqUm1m
  CKv+KUZyDUUmYNwJkCk9mXgnc7ldAZzEBnXXyqhPIWSWJCCmpBqYTfFdl7s2onD3LdLdLkPgP
  02/R/dv3r5LaaMAfnHr9P48g4wcnxdSdAksr29ccm/GSVyqJ+4K/lFxlyl+3JRb/ytlPZs+Ze
  teo9HFEr3LPyRcB529/XNxq90dgjvXqT62VzP9nvSx7/PTB7IZfb7n2T5j9+ZnrdmP2T61ldm
  ukVA2ZNafpu87fvaT3zvYzH9/GripZl5c/9ejJHU08mjKBGffk3DQVrt/pfDHr5Coe+86jOVM
  C/7T5dH8KbZLUOyh7hrXkDEMQ1+Je9v2/k2Xn8kcZHztlevBZAIOQwp3NJro+Z9lvLZ/pojdF
  tvWYrtWdLZ2MUUtqN7SHPj1iOf9b7JM3m9Y6daoc4rfZcb1biaU4I9FQi7moOBEAlziIJHsDA
  AA=
X-Env-Sender: wangmy@fujitsu.com
X-Msg-Ref: server-4.tower-728.messagelabs.com!1665477581!104009!1
X-Originating-IP: [62.60.8.179]
X-SYMC-ESS-Client-Auth: outbound-route-from=pass
X-StarScan-Received: 
X-StarScan-Version: 9.87.3; banners=-,-,-
X-VirusChecked: Checked
Received: (qmail 1746 invoked from network); 11 Oct 2022 08:39:42 -0000
Received: from unknown (HELO n03ukasimr04.n03.fujitsu.local) (62.60.8.179)
  by server-4.tower-728.messagelabs.com with ECDHE-RSA-AES256-GCM-SHA384
 encrypted SMTP; 11 Oct 2022 08:39:42 -0000
Received: from n03ukasimr04.n03.fujitsu.local (localhost [127.0.0.1])
	by n03ukasimr04.n03.fujitsu.local (Postfix) with ESMTP id A3F5E7C
	for <openembedded-core@lists.openembedded.org>;
 Tue, 11 Oct 2022 09:39:41 +0100 (BST)
Received: from R01UKEXCASM126.r01.fujitsu.local (R01UKEXCASM126
 [10.183.43.178])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-SHA384 (256/256 bits))
	(No client certificate requested)
	by n03ukasimr04.n03.fujitsu.local (Postfix) with ESMTPS id 9764173
	for <openembedded-core@lists.openembedded.org>;
 Tue, 11 Oct 2022 09:39:41 +0100 (BST)
Received: from localhost.localdomain (10.167.225.33) by
 R01UKEXCASM126.r01.fujitsu.local (10.183.43.178) with Microsoft SMTP Server
 (TLS) id 15.0.1497.32; Tue, 11 Oct 2022 09:39:40 +0100
From: Wang Mingyu <wangmy@fujitsu.com>
To: <openembedded-core@lists.openembedded.org>
CC: Wang Mingyu <wangmy@fujitsu.com>
Subject: [OE-core] [PATCH] xkeyboard-config: upgrade 2.36 -> 2.37
Date: Tue, 11 Oct 2022 16:39:20 +0800
Message-ID: <1665477563-16679-2-git-send-email-wangmy@fujitsu.com>
X-Mailer: git-send-email 1.8.3.1
In-Reply-To: <1665477563-16679-1-git-send-email-wangmy@fujitsu.com>
References: <1665477563-16679-1-git-send-email-wangmy@fujitsu.com>
MIME-Version: 1.0
Content-Type: text/plain
X-Originating-IP: [10.167.225.33]
X-ClientProxiedBy: G08CNEXCHPEKD07.g08.fujitsu.local (10.167.33.80) To
 R01UKEXCASM126.r01.fujitsu.local (10.183.43.178)
X-Virus-Scanned: ClamAV using ClamSMTP
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Tue, 11 Oct 2022 08:39:49 -0000
X-Groupsio-URL: 
 https://lists.openembedded.org/g/openembedded-core/message/171612

Signed-off-by: Wang Mingyu <wangmy@fujitsu.com>
---
 .../{xkeyboard-config_2.36.bb => xkeyboard-config_2.37.bb}      | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)
 rename meta/recipes-graphics/xorg-lib/{xkeyboard-config_2.36.bb => xkeyboard-config_2.37.bb} (92%)

diff --git a/meta/recipes-graphics/xorg-lib/xkeyboard-config_2.36.bb b/meta/recipes-graphics/xorg-lib/xkeyboard-config_2.37.bb
similarity index 92%
rename from meta/recipes-graphics/xorg-lib/xkeyboard-config_2.36.bb
rename to meta/recipes-graphics/xorg-lib/xkeyboard-config_2.37.bb
index 9e6d17c780..f3d9ac9221 100644
--- a/meta/recipes-graphics/xorg-lib/xkeyboard-config_2.36.bb
+++ b/meta/recipes-graphics/xorg-lib/xkeyboard-config_2.37.bb
@@ -13,7 +13,7 @@ LICENSE = "MIT & MIT"
 LIC_FILES_CHKSUM = "file://COPYING;md5=0e7f21ca7db975c63467d2e7624a12f9"
 
 SRC_URI = "${XORG_MIRROR}/individual/data/xkeyboard-config/${BPN}-${PV}.tar.xz"
-SRC_URI[sha256sum] = "1f1bb1292a161d520a3485d378609277d108cd07cde0327c16811ff54c3e1595"
+SRC_URI[sha256sum] = "eb1383a5ac4b6210d7c7302b9d6fab052abdf51c5d2c9b55f1f779997ba68c6c"
 
 SECTION = "x11/libs"
 DEPENDS = "util-macros libxslt-native"
-- 
2.25.1


