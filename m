Return-Path: <wangmy@fujitsu.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 1B130C3A5A7
	for <webhook@archiver.kernel.org>; Mon,  5 Dec 2022 02:29:32 +0000 (UTC)
Received: from mail1.bemta37.messagelabs.com (mail1.bemta37.messagelabs.com [85.158.142.112])
 by mx.groups.io with SMTP id smtpd.web11.5399.1670207369994767187
 for <openembedded-core@lists.openembedded.org>;
 Sun, 04 Dec 2022 18:29:30 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@fujitsu.com header.s=170520fj header.b=lCZu1z/l;
 spf=pass (domain: fujitsu.com, ip: 85.158.142.112, mailfrom: wangmy@fujitsu.com)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=fujitsu.com;
	s=170520fj; t=1670207367; i=@fujitsu.com;
	bh=1wL5PFBIH4WNor58u9/MXVaN2VgFKyCn47kM5U33mSk=;
	h=From:To:CC:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type;
	b=lCZu1z/lj1pPjR5Ry0vSIz0WmU4N8Xe2GGBh90l3Xqp3i49DAm9v02s7778L2ZIvk
	 RX8pyeOu++V33iwGHi3p/F+PQJVS8OZ8QIfMPM/GjXMe+ucqbXNnG07+gHJ9WMrNIw
	 yF7A+JzPFk4fj9xDrKfuBkIffjmofEiVf9tzU/IFMK1pEuxEFMGzjyuoDCnNLFyIvS
	 HptGmbN3P2UE1GEl2y9be8CprtxeHr2Wqi0zm3WU8iYkGnDo7MgCkcnc9YG+ULPXFi
	 F1OeyYPdjKPGV6uELEY/B3AeDl+mM+2ZarpyF3RBtRQuUbJm/kdwK0gdZQO95vfcYs
	 SaYIq0BN98r/A==
X-Brightmail-Tracker: H4sIAAAAAAAAA+NgFrrHIsWRWlGSWpSXmKPExsViZ8OxWbctvDf
  Z4EiLksWdn+/YHRg9zm1cwRjAGMWamZeUX5HAmnHiyyLmgiU8FbPbpBsYm7m7GLk4hATuM0r0
  rt3PBuFcYpJoaV/DDOHsZpRo+36QtYuRk4NNQErixv3/QFUcHCICehJX/4mChJkFVCRe/O5hB
  7GFBVwlTjx7wQxiswDFz2ybyAZi8wo4Sux/fo0RxJYQUJCY8vA9WA2ngJPEw8t7wXqFgGrW9v
  1ggqgXlDg58wkLxHwJiYMvIGZKCChKzL7czAJhV0jMmtXGBGGrSVw9t4l5AqPgLCTts5C0L2B
  kWsVoXpxaVJZapGtopJdUlJmeUZKbmJmjl1ilm6iXWqqbl19UkqFrqJdYXqyXWlysV1yZm5yT
  opeXWrKJERi8KcXJd3cwdi7/o3eIUZKDSUmUV+lRd7IQX1J+SmVGYnFGfFFpTmrxIUYZDg4lC
  d7osN5kIcGi1PTUirTMHGAkwaQlOHiURHiFvIHSvMUFibnFmekQqVOMlhxTZ//bz8yxHEzO/N
  p2gFmIJS8/L1VKnFcFZJ4ASENGaR7cOFi0X2KUlRLmZWRgYBDiKUgtys0sQZV/xSjOwagkzOv
  mCzSFJzOvBG7rK6CDmIAO2sjfBXJQSSJCSqqBKcm3sWS2As8rhqcPfRd+5ljGYxDw5kGcfdSn
  hRYvf3+edtx9xa55K46qX8z6d7Sd7eKyjzvur5d7z2zQMXGb6jH5+foBW07PXakQlfn1yz2Vq
  WHXth8u5T+ea7anMuRD/tvHRofDjGcYXn/mWB10LErfzFflSbb/nyhBVvtLF3Y81fxxe9qLzJ
  mn7k5R8p7ZpZd65XPx5jLniK/Mh1++Y0v99i6/Jj96HZ/V8Xs3EsPWh9ab3p0r3TMn+dPiXxF
  JJv1XT4i1/wg2il186+bsdNadhy4s9zg+dUbyismG8d+cks0EDlt2fdpvbs71dMfRmWZHlLOt
  y9567MgPO9sRJLh+u/O2M+vP71OdqlLdxMyixFKckWioxVxUnAgAogrA8XEDAAA=
X-Env-Sender: wangmy@fujitsu.com
X-Msg-Ref: server-9.tower-745.messagelabs.com!1670207366!6036!1
X-Originating-IP: [62.60.8.179]
X-SYMC-ESS-Client-Auth: outbound-route-from=pass
X-StarScan-Received: 
X-StarScan-Version: 9.101.1; banners=-,-,-
X-VirusChecked: Checked
Received: (qmail 23787 invoked from network); 5 Dec 2022 02:29:26 -0000
Received: from unknown (HELO n03ukasimr04.n03.fujitsu.local) (62.60.8.179)
  by server-9.tower-745.messagelabs.com with ECDHE-RSA-AES256-GCM-SHA384 encrypted SMTP; 5 Dec 2022 02:29:26 -0000
Received: from n03ukasimr04.n03.fujitsu.local (localhost [127.0.0.1])
	by n03ukasimr04.n03.fujitsu.local (Postfix) with ESMTP id 0F10E7B
	for <openembedded-core@lists.openembedded.org>; Mon,  5 Dec 2022 02:29:26 +0000 (GMT)
Received: from R01UKEXCASM126.r01.fujitsu.local (R01UKEXCASM126 [10.183.43.178])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-SHA384 (256/256 bits))
	(No client certificate requested)
	by n03ukasimr04.n03.fujitsu.local (Postfix) with ESMTPS id 02D1B73
	for <openembedded-core@lists.openembedded.org>; Mon,  5 Dec 2022 02:29:26 +0000 (GMT)
Received: from localhost.localdomain (10.167.225.33) by
 R01UKEXCASM126.r01.fujitsu.local (10.183.43.178) with Microsoft SMTP Server
 (TLS) id 15.0.1497.42; Mon, 5 Dec 2022 02:29:24 +0000
From: <wangmy@fujitsu.com>
To: <openembedded-core@lists.openembedded.org>
CC: Wang Mingyu <wangmy@fujitsu.com>
Subject: [OE-core] [PATCH] libxcrypt-compat: upgrade 4.4.30 -> 4.4.33
Date: Mon, 5 Dec 2022 10:28:52 +0800
Message-ID: <1670207333-6986-4-git-send-email-wangmy@fujitsu.com>
X-Mailer: git-send-email 1.8.3.1
In-Reply-To: <1670207333-6986-1-git-send-email-wangmy@fujitsu.com>
References: <1670207333-6986-1-git-send-email-wangmy@fujitsu.com>
MIME-Version: 1.0
Content-Type: text/plain
X-Originating-IP: [10.167.225.33]
X-ClientProxiedBy: G08CNEXCHPEKD07.g08.fujitsu.local (10.167.33.80) To
 R01UKEXCASM126.r01.fujitsu.local (10.183.43.178)
X-Virus-Scanned: ClamAV using ClamSMTP
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Mon, 05 Dec 2022 02:29:32 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/174264

From: Wang Mingyu <wangmy@fujitsu.com>

Changelog:
==========
* Fix -Werror=sign-conversion in lib/alg-yescrypt-platform.c.
  With commit 894aee75433b4dc8d9724b126da6e79fa5f6814b we introduced some
  changes to huge page handling, that show this error when building with
  GCC v12.2.1, and thus need a small fix.

Signed-off-by: Wang Mingyu <wangmy@fujitsu.com>
---
 .../{libxcrypt-compat_4.4.30.bb => libxcrypt-compat_4.4.33.bb}  | 0
 meta/recipes-core/libxcrypt/libxcrypt.inc                       | 2 +-
 2 files changed, 1 insertion(+), 1 deletion(-)
 rename meta/recipes-core/libxcrypt/{libxcrypt-compat_4.4.30.bb => libxcrypt-compat_4.4.33.bb} (100%)

diff --git a/meta/recipes-core/libxcrypt/libxcrypt-compat_4.4.30.bb b/meta/recipes-core/libxcrypt/libxcrypt-compat_4.4.33.bb
similarity index 100%
rename from meta/recipes-core/libxcrypt/libxcrypt-compat_4.4.30.bb
rename to meta/recipes-core/libxcrypt/libxcrypt-compat_4.4.33.bb
diff --git a/meta/recipes-core/libxcrypt/libxcrypt.inc b/meta/recipes-core/libxcrypt/libxcrypt.inc
index 2bdedcba6d..61b0381076 100644
--- a/meta/recipes-core/libxcrypt/libxcrypt.inc
+++ b/meta/recipes-core/libxcrypt/libxcrypt.inc
@@ -10,7 +10,7 @@ LIC_FILES_CHKSUM = "file://LICENSING;md5=c0a30e2b1502c55a7f37e412cd6c6a4b \
 inherit autotools pkgconfig
 
 SRC_URI = "git://github.com/besser82/libxcrypt.git;branch=${SRCBRANCH};protocol=https"
-SRCREV = "fee2687bad66e351a3dcc963a34ae80125923ff8"
+SRCREV = "d7fe1ac04c326dba7e0440868889d1dccb41a175"
 SRCBRANCH ?= "develop"
 
 SRC_URI += "file://fix_cflags_handling.patch"
-- 
2.25.1


