Return-Path: <wangmy@fujitsu.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id E0E19CCA47B
	for <webhook@archiver.kernel.org>; Thu, 30 Jun 2022 04:25:58 +0000 (UTC)
Received: from mail1.bemta34.messagelabs.com (mail1.bemta34.messagelabs.com
 [195.245.231.4])
 by mx.groups.io with SMTP id smtpd.web12.20989.1656563156349213124
 for <openembedded-core@lists.openembedded.org>;
 Wed, 29 Jun 2022 21:25:56 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@fujitsu.com header.s=170520fj header.b=CnZB//Yo;
 spf=pass (domain: fujitsu.com, ip: 195.245.231.4,
 mailfrom: wangmy@fujitsu.com)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=fujitsu.com;
	s=170520fj; t=1656563154; i=@fujitsu.com;
	bh=NIng9xp7GryWssQa+tVM8HDPz8YpOEU/jQKkzCXm7us=;
	h=From:To:CC:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type;
	b=CnZB//Yo6OfmEAN/JgK9MAF+XrzONc/FdKi1D1c9tjKdQKTA5ZiuWkYWTN5gbWc9E
	 8YO4qo8NyIJYcAzyY0mNxXiceSqhSSExBkXk3WyCj3cFQwcSZT1OdLe5mp9Lq/LxsC
	 izKzv6QjaozdkOsD2eZGS19gXoSh5S260wwSpAUEuuesBb5JXejm9DuhnAEdI/jZ9M
	 5otg5bspIWo4ms684UrHlR6oPkWVTaJn2GIClRBetpxLFPVbBPZHGoAKscR4arZnwg
	 Dl3R1HM9EZvSnehL8njsCreTMXupwfsys5hF3VXxX8aIJsXkH1CaaWz2LIhsGoNW7+
	 wb8UJAeO4P2xw==
X-Brightmail-Tracker: H4sIAAAAAAAAA+NgFvrMIsWRWlGSWpSXmKPExsViZ8ORpHtRdW+
  SwdHnphZ3fr5jd2D0OLdxBWMAYxRrZl5SfkUCa0bPnJPMBX9kK24eWcHawNgk1cXIySEk8IBR
  4vWi9C5GLiD7MpPE18YdrBDOHkaJfdvvsYBUsQmoSUy/dQMowcEhIqAncfWfKEiYWUBF4sXvH
  nYQW1jAQuLw7TZmEJtFQFXi7K+jjCA2r4CTxI/Fx5lAbAkBBYkpD9+D1XAKOEus3dHKCHGEk8
  SteQ9YIeoFJU7OfMICMV9C4uCLF8wQvYoSsy83s0DYFRIzZmxjg7DVJK6e28Q8gVFwFpL2WUj
  aFzAyrWK0SirKTM8oyU3MzNE1NDDQNTQ01TU21jU30Uus0k3USy3VLU8tLtE10kssL9ZLLS7W
  K67MTc5J0ctLLdnECAzhlGJFrx2Mr1b81DvEKMnBpCTKa8i+N0mILyk/pTIjsTgjvqg0J7X4E
  KMMB4eSBO9xJaCcYFFqempFWmYOMJ5g0hIcPEoivKEgad7igsTc4sx0iNQpRm+OtQ0H9jJz/P
  30F0hOnf1vPzPHcjA582vbAWaOTfu6DjALseTl56VKifO+UQEaIQAyIqM0D24BLC1cYpSVEuZ
  lZGBgEOIpSC3KzSxBlX/FKM7BqCTMqw1yCE9mXgncHa+ATmQCOnHntD0gJ5YkIqSkGphsF5bn
  cL49KlOorD9/tuPkrjsrTq504zy5ds0Xjdl8ywNcD7+1d81Q/zSBW8+Y/craVdxesrsPsWxRv
  b5lgiB7W/f7efeMjQW/y4gY+wXevLIov7C3v+KQWOLDD5v2zv9wRr3ylSCLwG5pBXbzYC/Xe3
  41N9Ltzxbc6r1beWo+1/G4eZIFrmtltuQyhxb8dZOMiHl9o2iVk9CEzGt7RRTUt3fJqJyY2j3
  1/VHZ/5fDLi+vublkwrPYQNEz882Pv7vNf+vzldKv+7MtymyZBC+5+L838+XKe9+zaFVPz/F9
  woU88mX7GnSmLPtammFk8tRxf48nr+EO9gb/9XHJrw+2h03e873XKzjdUXLmjB4lluKMREMt5
  qLiRACT7YI1hgMAAA==
X-Env-Sender: wangmy@fujitsu.com
X-Msg-Ref: server-19.tower-548.messagelabs.com!1656563153!21366!1
X-Originating-IP: [62.60.8.98]
X-SYMC-ESS-Client-Auth: outbound-route-from=pass
X-StarScan-Received: 
X-StarScan-Version: 9.86.8; banners=-,-,-
X-VirusChecked: Checked
Received: (qmail 18715 invoked from network); 30 Jun 2022 04:25:53 -0000
Received: from unknown (HELO n03ukasimr03.n03.fujitsu.local) (62.60.8.98)
  by server-19.tower-548.messagelabs.com with ECDHE-RSA-AES256-GCM-SHA384
 encrypted SMTP; 30 Jun 2022 04:25:53 -0000
Received: from n03ukasimr03.n03.fujitsu.local (localhost [127.0.0.1])
	by n03ukasimr03.n03.fujitsu.local (Postfix) with ESMTP id 9366C1AE
	for <openembedded-core@lists.openembedded.org>;
 Thu, 30 Jun 2022 05:25:53 +0100 (BST)
Received: from R01UKEXCASM126.r01.fujitsu.local (R01UKEXCASM126
 [10.183.43.178])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-SHA384 (256/256 bits))
	(No client certificate requested)
	by n03ukasimr03.n03.fujitsu.local (Postfix) with ESMTPS id 880731AB
	for <openembedded-core@lists.openembedded.org>;
 Thu, 30 Jun 2022 05:25:53 +0100 (BST)
Received: from localhost.localdomain (10.167.225.33) by
 R01UKEXCASM126.r01.fujitsu.local (10.183.43.178) with Microsoft SMTP Server
 (TLS) id 15.0.1497.32; Thu, 30 Jun 2022 05:25:51 +0100
From: Wang Mingyu <wangmy@fujitsu.com>
To: <openembedded-core@lists.openembedded.org>
CC: Wang Mingyu <wangmy@fujitsu.com>
Subject: [OE-core] [PATCH] speex: upgrade 1.2.0 -> 1.2.1
Date: Thu, 30 Jun 2022 12:25:34 +0800
Message-ID: <1656563137-11471-2-git-send-email-wangmy@fujitsu.com>
X-Mailer: git-send-email 1.8.3.1
In-Reply-To: <1656563137-11471-1-git-send-email-wangmy@fujitsu.com>
References: <1656563137-11471-1-git-send-email-wangmy@fujitsu.com>
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
 https://lists.openembedded.org/g/openembedded-core/message/167397

CVE-2020-23903.patch
removed since it's included in 1.2.1

License-Update:
  Add "Organisation (CSIRO)" to Copyright 2005-2008

Changelog:
===========
 Check for _WIN32 instead of WIN32 in preprocessor checks
 wav_io: check for EOF when seeking in wav (fixes hang discovered by fuzzing, see #9)
 CI: add gitlab CI integration
 fixed-point: make left shift macros use unsigned to avoid undefined behaviour
 math_approx: use unsigned int for LCG pseudorandom generator (avoids integer overflow)
 oss-fuzz: add integration and fuzzing target
 speexenc: guard against invalid channel numbers (see #13)
 speexdec: make left shift macros use unsigned to avoid undefined behaviour
 autotools: do not use deprecated macros

Signed-off-by: Wang Mingyu <wangmy@fujitsu.com>
---
 .../speex/speex/CVE-2020-23903.patch          | 30 -------------------
 .../speex/{speex_1.2.0.bb => speex_1.2.1.bb}  | 12 ++++----
 2 files changed, 5 insertions(+), 37 deletions(-)
 delete mode 100644 meta/recipes-multimedia/speex/speex/CVE-2020-23903.patch
 rename meta/recipes-multimedia/speex/{speex_1.2.0.bb => speex_1.2.1.bb} (65%)

diff --git a/meta/recipes-multimedia/speex/speex/CVE-2020-23903.patch b/meta/recipes-multimedia/speex/speex/CVE-2020-23903.patch
deleted file mode 100644
index eb16e95ffc..0000000000
--- a/meta/recipes-multimedia/speex/speex/CVE-2020-23903.patch
+++ /dev/null
@@ -1,30 +0,0 @@
-Backport patch to fix CVE-2020-23903.
-
-CVE: CVE-2020-23903
-Upstream-Status: Backport [https://github.com/xiph/speex/commit/870ff84]
-
-Signed-off-by: Kai Kang <kai.kang@windriver.com>
-
-From 870ff845b32f314aec0036641ffe18aba4916887 Mon Sep 17 00:00:00 2001
-From: Tristan Matthews <tmatth@videolan.org>
-Date: Mon, 13 Jul 2020 23:25:03 -0400
-Subject: [PATCH] wav_io: guard against invalid channel numbers
-
-Fixes #13
----
- src/wav_io.c | 2 +-
- 1 file changed, 1 insertion(+), 1 deletion(-)
-
-diff --git a/src/wav_io.c b/src/wav_io.c
-index b5183015..09d62eb0 100644
---- a/src/wav_io.c
-+++ b/src/wav_io.c
-@@ -111,7 +111,7 @@ int read_wav_header(FILE *file, int *rate, int *channels, int *format, spx_int32
-    stmp = le_short(stmp);
-    *channels = stmp;
- 
--   if (stmp>2)
-+   if (stmp>2 || stmp<1)
-    {
-       fprintf (stderr, "Only mono and (intensity) stereo supported\n");
-       return -1;
diff --git a/meta/recipes-multimedia/speex/speex_1.2.0.bb b/meta/recipes-multimedia/speex/speex_1.2.1.bb
similarity index 65%
rename from meta/recipes-multimedia/speex/speex_1.2.0.bb
rename to meta/recipes-multimedia/speex/speex_1.2.1.bb
index ea475f0f1b..c40198fa8f 100644
--- a/meta/recipes-multimedia/speex/speex_1.2.0.bb
+++ b/meta/recipes-multimedia/speex/speex_1.2.1.bb
@@ -3,17 +3,15 @@ DESCRIPTION = "Speex is an Open Source/Free Software patent-free audio compressi
 HOMEPAGE = "http://www.speex.org"
 SECTION = "libs"
 LICENSE = "BSD-3-Clause"
-LIC_FILES_CHKSUM = "file://COPYING;md5=314649d8ba9dd7045dfb6683f298d0a8 \
-                    file://include/speex/speex.h;beginline=1;endline=34;md5=ef8c8ea4f7198d71cf3509c6ed05ea50"
+LIC_FILES_CHKSUM = "file://COPYING;md5=eff3f76350f52a99a3df5eec6b79c02a \
+                    file://include/speex/speex.h;beginline=1;endline=34;md5=ef8c8ea4f7198d71cf3509c6ed05ea50 \
+                    "
 DEPENDS = "libogg speexdsp"
 
-SRC_URI = "http://downloads.xiph.org/releases/speex/speex-${PV}.tar.gz \
-           file://CVE-2020-23903.patch \
-           "
+SRC_URI = "http://downloads.xiph.org/releases/speex/speex-${PV}.tar.gz"
 UPSTREAM_CHECK_REGEX = "speex-(?P<pver>\d+(\.\d+)+)\.tar"
 
-SRC_URI[md5sum] = "8ab7bb2589110dfaf0ed7fa7757dc49c"
-SRC_URI[sha256sum] = "eaae8af0ac742dc7d542c9439ac72f1f385ce838392dc849cae4536af9210094"
+SRC_URI[sha256sum] = "4b44d4f2b38a370a2d98a78329fefc56a0cf93d1c1be70029217baae6628feea"
 
 inherit autotools pkgconfig lib_package
 
-- 
2.25.1


