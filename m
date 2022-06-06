Return-Path: <wangmy@fujitsu.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id A26ACCCA47F
	for <webhook@archiver.kernel.org>; Mon,  6 Jun 2022 12:26:14 +0000 (UTC)
Received: from mail1.bemta34.messagelabs.com (mail1.bemta34.messagelabs.com
 [195.245.231.4])
 by mx.groups.io with SMTP id smtpd.web11.31196.1654518373025064677
 for <openembedded-core@lists.openembedded.org>;
 Mon, 06 Jun 2022 05:26:13 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@fujitsu.com header.s=170520fj header.b=Gt/Ylixl;
 spf=pass (domain: fujitsu.com, ip: 195.245.231.4,
 mailfrom: wangmy@fujitsu.com)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=fujitsu.com;
	s=170520fj; t=1654518371; i=@fujitsu.com;
	bh=aK5Z8I5Wced2nQfwXaim/jzX3UQGUlpCBV0/PEQVtxY=;
	h=From:To:CC:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type;
	b=Gt/Ylixlh42Oeg9pe1gtui+w4bFygdmZpiQ3Tq4w/m37hvE/esr+fcgWtpcS/tOaq
	 UzP+Bp8Ox0x46n/kkNmwJyM2LgE600hZRfjltoRPcp3068eIkca5sBiyOTFcEFMLS0
	 aXZgLj1S07Y649pNEyNGOsoC/RUsBAPxcKAQZZXNUu7wpPWtYS7/9+yPiImTSu7YFZ
	 wncCpcc1oBeFASrUKBYjNCoIKndCeDD0njemQpI5SPBfe5SzNvzWQ03hg84dIaXmlN
	 txYfZTGUrXNJ3XMijxb8CGcb7Nxnp4tl6tMi0FCuV5Vwq+Efg+HaO++pc63JLfIp9b
	 p26XZva4z4ceA==
X-Brightmail-Tracker: H4sIAAAAAAAAA+NgFnrBIsWRWlGSWpSXmKPExsViZ8ORqJv8aW6
  SwZEZzBZ3fr5jd2D0OLdxBWMAYxRrZl5SfkUCa8bWzWeZCuYIVuzqrG1gXMXfxcjFISTwmFHi
  QPsSdgjnPJPE0t0vWCGc3YwSr270MnUxcnKwCahJTL91AyjBwSEioCdx9Z8oSJhZQEXixe8ed
  hBbWMBaYuG2K8wgNgtQfOLyfSwgNq+Ao8Tt6UdZQWwJAQWJKQ/fg9VwCjhJHF3yHcwWAqrZ1H
  wGql5Q4uTMJywQ8yUkDr54wQzRqygx+3IzC4RdITFjxjY2CFtN4uq5TcwTGAVnIWmfhaR9ASP
  TKkbrpKLM9IyS3MTMHF1DAwNdQ0NTXWMjINNEL7FKN1EvtVS3PLW4RNdIL7G8WC+1uFivuDI3
  OSdFLy+1ZBMjMIhTihUydjB+X/lT7xCjJAeTkiiv/bW5SUJ8SfkplRmJxRnxRaU5qcWHGGU4O
  JQkeOs+AOUEi1LTUyvSMnOAEQWTluDgURLhtX4HlOYtLkjMLc5Mh0idYrTnuHrlyl5mjqmz/+
  1n5lgOJmd+bTvALMSSl5+XKiXOexxkqgBIW0ZpHtxQWAK4xCgrJczLyMDAIMRTkFqUm1mCKv+
  KUZyDUUmY9wHIFJ7MvBK43a+AzmICOsvnwRyQs0oSEVJSDUwcP9doNRyMFC7TuTtTVnvK1rOR
  uzj9lsh43Prhwi3mvPfOMf2VNvIRwmVs+9+xT/8Y4GB79qbVV/EsL0fuJ4Y/KlpFc6tyw+tXF
  v9VbtgoJcnBlxsRYLKnhOHnY6m07s8foyc9fuNglrb+ZqF2xpHcjMrPuY2PUjv8bkzq6LWcaH
  ctm+tSwZend24Wnd+eckjZ+4/7rZ4Qqzu7Kvhehv/YPucN45OWc3tqH3zet3lPeLRoHH+lrM+
  VwO1bTm/i37xR0OtphNauqg3ewj6TdIJu/XlVuqsslqFUftrxXLuLfAsbL1/583+ywTUG5+68
  smzFPQzcLGwqMhObRO+0LWzcYSWdNvXhZqsf19LctymxFGckGmoxFxUnAgDuzcPUewMAAA==
X-Env-Sender: wangmy@fujitsu.com
X-Msg-Ref: server-11.tower-571.messagelabs.com!1654518370!412186!1
X-Originating-IP: [62.60.8.97]
X-SYMC-ESS-Client-Auth: outbound-route-from=pass
X-StarScan-Received: 
X-StarScan-Version: 9.86.7; banners=-,-,-
X-VirusChecked: Checked
Received: (qmail 17732 invoked from network); 6 Jun 2022 12:26:11 -0000
Received: from unknown (HELO n03ukasimr01.n03.fujitsu.local) (62.60.8.97)
  by server-11.tower-571.messagelabs.com with ECDHE-RSA-AES256-GCM-SHA384
 encrypted SMTP; 6 Jun 2022 12:26:11 -0000
Received: from n03ukasimr01.n03.fujitsu.local (localhost [127.0.0.1])
	by n03ukasimr01.n03.fujitsu.local (Postfix) with ESMTP id 9DAD0100184
	for <openembedded-core@lists.openembedded.org>;
 Mon,  6 Jun 2022 13:26:10 +0100 (BST)
Received: from R01UKEXCASM126.r01.fujitsu.local (unknown [10.183.43.178])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-SHA384 (256/256 bits))
	(No client certificate requested)
	by n03ukasimr01.n03.fujitsu.local (Postfix) with ESMTPS id 7F4B4100194
	for <openembedded-core@lists.openembedded.org>;
 Mon,  6 Jun 2022 13:26:10 +0100 (BST)
Received: from localhost.localdomain (10.167.225.33) by
 R01UKEXCASM126.r01.fujitsu.local (10.183.43.178) with Microsoft SMTP Server
 (TLS) id 15.0.1497.32; Mon, 6 Jun 2022 13:26:05 +0100
From: Wang Mingyu <wangmy@fujitsu.com>
To: <openembedded-core@lists.openembedded.org>
CC: Wang Mingyu <wangmy@fujitsu.com>
Subject: [OE-core] [PATCH] mtools: upgrade 4.0.39 -> 4.0.40
Date: Mon, 6 Jun 2022 20:25:37 +0800
Message-ID: <1654518337-9206-5-git-send-email-wangmy@fujitsu.com>
X-Mailer: git-send-email 1.8.3.1
In-Reply-To: <1654518337-9206-1-git-send-email-wangmy@fujitsu.com>
References: <1654518337-9206-1-git-send-email-wangmy@fujitsu.com>
MIME-Version: 1.0
Content-Type: text/plain
X-Originating-IP: [10.167.225.33]
X-ClientProxiedBy: G08CNEXCHPEKD09.g08.fujitsu.local (10.167.33.85) To
 R01UKEXCASM126.r01.fujitsu.local (10.183.43.178)
X-Virus-Scanned: ClamAV using ClamSMTP
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Mon, 06 Jun 2022 12:26:14 -0000
X-Groupsio-URL: 
 https://lists.openembedded.org/g/openembedded-core/message/166616

Refresh disable-hardcoded-configs.patch for new version.

Signed-off-by: Wang Mingyu <wangmy@fujitsu.com>
---
 .../mtools/mtools/disable-hardcoded-configs.patch           | 6 +++---
 .../mtools/{mtools_4.0.39.bb => mtools_4.0.40.bb}           | 2 +-
 2 files changed, 4 insertions(+), 4 deletions(-)
 rename meta/recipes-devtools/mtools/{mtools_4.0.39.bb => mtools_4.0.40.bb} (93%)

diff --git a/meta/recipes-devtools/mtools/mtools/disable-hardcoded-configs.patch b/meta/recipes-devtools/mtools/mtools/disable-hardcoded-configs.patch
index 25ee2b74b5..8f46174a5b 100644
--- a/meta/recipes-devtools/mtools/mtools/disable-hardcoded-configs.patch
+++ b/meta/recipes-devtools/mtools/mtools/disable-hardcoded-configs.patch
@@ -1,4 +1,4 @@
-From 142f40b80ea908831ef7a4d694cec6a5985a0724 Mon Sep 17 00:00:00 2001
+From 3a05dc2c0acff1713dd44cef5e9f328f0706eb3e Mon Sep 17 00:00:00 2001
 From: Ed Bartosh <ed.bartosh@linux.intel.com>
 Date: Tue, 13 Jun 2017 14:55:52 +0300
 Subject: [PATCH] Disabled reading host configs.
@@ -12,10 +12,10 @@ Signed-off-by: Ed Bartosh <ed.bartosh@linux.intel.com>
  1 file changed, 8 deletions(-)
 
 diff --git a/config.c b/config.c
-index 173eae0..0654cc1 100644
+index 630f99d..07dbf53 100644
 --- a/config.c
 +++ b/config.c
-@@ -836,14 +836,6 @@ void read_config(void)
+@@ -834,14 +834,6 @@ void read_config(void)
  	memcpy(devices, const_devices,
  	       nr_const_devices*sizeof(struct device));
  
diff --git a/meta/recipes-devtools/mtools/mtools_4.0.39.bb b/meta/recipes-devtools/mtools/mtools_4.0.40.bb
similarity index 93%
rename from meta/recipes-devtools/mtools/mtools_4.0.39.bb
rename to meta/recipes-devtools/mtools/mtools_4.0.40.bb
index 564ef02aee..200c7c7681 100644
--- a/meta/recipes-devtools/mtools/mtools_4.0.39.bb
+++ b/meta/recipes-devtools/mtools/mtools_4.0.40.bb
@@ -24,7 +24,7 @@ RRECOMMENDS:${PN}:libc-glibc = "\
 	glibc-gconv-ibm866 \
 	glibc-gconv-ibm869 \
 	"
-SRC_URI[sha256sum] = "397f1e2b7b7a2a270eb7970fa363e445f956926ec51e8170c3869da85b0987bd"
+SRC_URI[sha256sum] = "a22fca42354011dd2293a7f51f228b46ebbd802e7740b0975912afecb79d5df4"
 
 SRC_URI = "${GNU_MIRROR}/mtools/mtools-${PV}.tar.bz2 \
            file://mtools-makeinfo.patch \
-- 
2.25.1


