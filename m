Return-Path: <wangmy@fujitsu.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id E0DDCC43334
	for <webhook@archiver.kernel.org>; Thu, 30 Jun 2022 04:25:58 +0000 (UTC)
Received: from mail1.bemta34.messagelabs.com (mail1.bemta34.messagelabs.com
 [195.245.231.3])
 by mx.groups.io with SMTP id smtpd.web10.20793.1656563154113196210
 for <openembedded-core@lists.openembedded.org>;
 Wed, 29 Jun 2022 21:25:54 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@fujitsu.com header.s=170520fj header.b=eqEkmvgb;
 spf=pass (domain: fujitsu.com, ip: 195.245.231.3,
 mailfrom: wangmy@fujitsu.com)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=fujitsu.com;
	s=170520fj; t=1656563152; i=@fujitsu.com;
	bh=FqNGM75MhacXaaazVwEps4uTY07U7C1AE94TSYIXVFg=;
	h=From:To:CC:Subject:Date:Message-ID:MIME-Version:Content-Type;
	b=eqEkmvgb8GvJFDX4idmgjU2RdiaMFrw1SAqIklbmKo1PY5EeN+W6qCICFh+VJdRZP
	 Nc/v8fl0vWmwDTLB5Pr1nRefq9FlVh1E2l69N7bEruCHS2m+O89VFFGl/Ky8D2hHdJ
	 wRS9/60EWwLehM6ojXf32FJbJn/rsZB6MvcVr51qVp2tABaDGApdqz0kyOLS4rLdi7
	 kMLuXkSY9u8hYyVM9GCfikvumGMWVERkaHWb0vaAYoC44FHVi1yNviwXEmvEZ7tBGP
	 E1KtsRaRlLaOz2M0GsS5vzmwC4mr8boXItIMo5GXyh4U2CT0p58MivWNI3Z2KTy93T
	 L9t6gNqm4tEiw==
X-Brightmail-Tracker: H4sIAAAAAAAAA+NgFjrMIsWRWlGSWpSXmKPExsViZ8OxWfe86t4
  kg32nZS3u/HzH7sDocW7jCsYAxijWzLyk/IoE1owLh1+yFrTyV8xoWM/UwLiCt4uRi0NI4D6j
  xOEPk5i6GDmBnEtMEuf/x0Ak9jBKtB54DpZgE1CTmH7rBmsXIweHiICexNV/oiBhZgEViRe/e
  9hBwsIC1hKtu1NBwiwCqhKdt84yg9i8Ak4SM/smsoDYEgIKElMevoeKC0qcnPmEBWKMhMTBFy
  +YIWoUJWZfboaqr5CYMWMbG4StJnH13CbmCYz8s5C0z0LSvoCRaRWjdVJRZnpGSW5iZo6uoYG
  BrqGhqa6xha6RoZFeYpVuol5qqW55anGJLpBbXqyXWlysV1yZm5yTopeXWrKJERiSKcVqV3Yw
  7ln1U+8QoyQHk5IoryH73iQhvqT8lMqMxOKM+KLSnNTiQ4wyHBxKErzHlYBygkWp6akVaZk5w
  PiASUtw8CiJ8IaCpHmLCxJzizPTIVKnGI051jYc2MvMMfNr2wFmIZa8/LxUKXHeNypApQIgpR
  mleXCDYHF7iVFWSpiXkYGBQYinILUoN7MEVf4VozgHo5IwrzbIQp7MvBK4fa+ATmECOmXntD0
  gp5QkIqSkGpjqMtJY9es5WE58nX+7Y8Y5Kc+ZtjvuqK16sM3mYa91F1P4HZm6S7++HjPVucJ5
  fIH0lveJrfNms9Xtf3s449Wjomv/fFfZRS07YeB9O/Pew5pzeeLryooLT80us3nxyvT2oas34
  1fylDlavFJ/9M829bhVYUBB83t3YWfbFZ+nNapO4b9uYG3iGs66eZGuxCJFvcmHP21Qf5XOnu
  98uGqij6/bxoYPO6ffud/2p+bNtFm+BkLi7RvSAv+t+b9RfbVlb0erX+K/xnMZtu9fy0w1PNE
  6w6lD/FPnrJXXs3Y8Of1uxarzz4z440/uTBYp03yj8S/oNx9Xj/vDhqNeD+cElb1lMlnW89Q/
  6HPdxcC5SizFGYmGWsxFxYkAOQpgzVYDAAA=
X-Env-Sender: wangmy@fujitsu.com
X-Msg-Ref: server-9.tower-565.messagelabs.com!1656563151!16908!1
X-Originating-IP: [62.60.8.179]
X-SYMC-ESS-Client-Auth: outbound-route-from=pass
X-StarScan-Received: 
X-StarScan-Version: 9.86.8; banners=-,-,-
X-VirusChecked: Checked
Received: (qmail 6526 invoked from network); 30 Jun 2022 04:25:51 -0000
Received: from unknown (HELO n03ukasimr04.n03.fujitsu.local) (62.60.8.179)
  by server-9.tower-565.messagelabs.com with ECDHE-RSA-AES256-GCM-SHA384
 encrypted SMTP; 30 Jun 2022 04:25:51 -0000
Received: from n03ukasimr04.n03.fujitsu.local (localhost [127.0.0.1])
	by n03ukasimr04.n03.fujitsu.local (Postfix) with ESMTP id 3283175
	for <openembedded-core@lists.openembedded.org>;
 Thu, 30 Jun 2022 05:25:51 +0100 (BST)
Received: from R01UKEXCASM126.r01.fujitsu.local (R01UKEXCASM126
 [10.183.43.178])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-SHA384 (256/256 bits))
	(No client certificate requested)
	by n03ukasimr04.n03.fujitsu.local (Postfix) with ESMTPS id 25B5273
	for <openembedded-core@lists.openembedded.org>;
 Thu, 30 Jun 2022 05:25:51 +0100 (BST)
Received: from localhost.localdomain (10.167.225.33) by
 R01UKEXCASM126.r01.fujitsu.local (10.183.43.178) with Microsoft SMTP Server
 (TLS) id 15.0.1497.32; Thu, 30 Jun 2022 05:25:49 +0100
From: Wang Mingyu <wangmy@fujitsu.com>
To: <openembedded-core@lists.openembedded.org>
CC: Wang Mingyu <wangmy@fujitsu.com>
Subject: [OE-core] [PATCH] speexdsp: upgrade 1.2.0 -> 1.2.1
Date: Thu, 30 Jun 2022 12:25:33 +0800
Message-ID: <1656563137-11471-1-git-send-email-wangmy@fujitsu.com>
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
 <openembedded-core@lists.openembedded.org>; Thu, 30 Jun 2022 04:25:58 -0000
X-Groupsio-URL: 
 https://lists.openembedded.org/g/openembedded-core/message/167396

License-Update:
  Add "Organisation (CSIRO)" to Copyright 2005-2008

Changelog:
=========
    CI: add gitlab CI integration
    fixed-point: Remove unused MULT16_32_Q1[1-4] macros and inlines
    fixed-point: don't truncate 32-bit arg to MULT16_32_Q15
    fixed-point resample: remove 1-bit shift right before interpolation
    fixed-point: introduce MULT16_32_32 to handle unexpected types in MULT16_32_Q15
    Fix incorrect macro names in arch.h
    Remove unused stack_alloc.h
    autotools: do not use deprecated macros

Signed-off-by: Wang Mingyu <wangmy@fujitsu.com>
---
 .../speex/{speexdsp_1.2.0.bb => speexdsp_1.2.1.bb}           | 5 ++---
 1 file changed, 2 insertions(+), 3 deletions(-)
 rename meta/recipes-multimedia/speex/{speexdsp_1.2.0.bb => speexdsp_1.2.1.bb} (80%)

diff --git a/meta/recipes-multimedia/speex/speexdsp_1.2.0.bb b/meta/recipes-multimedia/speex/speexdsp_1.2.1.bb
similarity index 80%
rename from meta/recipes-multimedia/speex/speexdsp_1.2.0.bb
rename to meta/recipes-multimedia/speex/speexdsp_1.2.1.bb
index bb7bc9aade..1e6d09ab92 100644
--- a/meta/recipes-multimedia/speex/speexdsp_1.2.0.bb
+++ b/meta/recipes-multimedia/speex/speexdsp_1.2.1.bb
@@ -3,14 +3,13 @@ DESCRIPTION = "SpeexDSP is a patent-free, Open Source/Free Software DSP library.
 HOMEPAGE = "http://www.speex.org"
 SECTION = "libs"
 LICENSE = "BSD-3-Clause"
-LIC_FILES_CHKSUM = "file://COPYING;md5=314649d8ba9dd7045dfb6683f298d0a8"
+LIC_FILES_CHKSUM = "file://COPYING;md5=eff3f76350f52a99a3df5eec6b79c02a"
 
 SRC_URI = "http://downloads.xiph.org/releases/speex/speexdsp-${PV}.tar.gz"
 
 UPSTREAM_CHECK_REGEX = "speexdsp-(?P<pver>\d+(\.\d+)+)\.tar"
 
-SRC_URI[md5sum] = "b722df341576dc185d897131321008fc"
-SRC_URI[sha256sum] = "682042fc6f9bee6294ec453f470dadc26c6ff29b9c9e9ad2ffc1f4312fd64771"
+SRC_URI[sha256sum] = "8c777343e4a6399569c72abc38a95b24db56882c83dbdb6c6424a5f4aeb54d3d"
 
 inherit autotools pkgconfig
 
-- 
2.25.1


