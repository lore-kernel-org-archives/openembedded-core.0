Return-Path: <wangmy@fujitsu.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 01511C433FE
	for <webhook@archiver.kernel.org>; Thu,  3 Nov 2022 05:33:20 +0000 (UTC)
Received: from mail1.bemta37.messagelabs.com (mail1.bemta37.messagelabs.com [85.158.142.113])
 by mx.groups.io with SMTP id smtpd.web10.15932.1667453587154503013
 for <openembedded-core@lists.openembedded.org>;
 Wed, 02 Nov 2022 22:33:10 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@fujitsu.com header.s=170520fj header.b=NJdAF298;
 spf=pass (domain: fujitsu.com, ip: 85.158.142.113, mailfrom: wangmy@fujitsu.com)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=fujitsu.com;
	s=170520fj; t=1667453589; i=@fujitsu.com;
	bh=e6gN5gjbJhs6K6Y4eZXwdZ2fGHadPX+tHBhRbrVFqtc=;
	h=From:To:CC:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type;
	b=NJdAF298FpwpvSeyPWTzav/ypmj6EWYJsEEAyLkMF6q92VPKeKNGlMZji0H8Uf2F8
	 NQTKbrPfmdqGgdBNc14yNXJX1blbRVk8OgxXNgLmwiZae3w0wsJFqEi0gR3YpgIv3h
	 HgCUwo0tFut86FrRF27XjJVD0VUO40pUqUBSZnVCkwegwwWvxeBNkNWOvTW2+AhdjX
	 MRc1P+vMTDU3BIX8qO/uqELtD9j2f7DEJyiQJQvdR/V1Dd6MUVZim+hsaief0EB01A
	 K8Y0DbiReOVyLiCiXFJuK2/b2VHhrJ95VZPPxP6nuGtp92kk8cnCF8RUL0Yo7kKZ1Q
	 FkuoP0vX6EyQQ==
X-Brightmail-Tracker: H4sIAAAAAAAAA+NgFrrDIsWRWlGSWpSXmKPExsViZ8OxWXdqUHK
  ywft1QhZ3fr5jd2D0OLdxBWMAYxRrZl5SfkUCa8aPmT4FvTIVCw/XNDAek+xi5OIQErjPKNF5
  YjILhHOJSWL1gc2sEM5uRomXm74DOZwcbAJSEjfu/2frYuTgEBHQk7j6TxQkzCygIvHidw87i
  C0sYCPR+W02I4jNAhR/eu8MmM0r4CTxveMHmC0hoCAx5eF7ZhCbU8BZ4tPFBSwgthBQzdc1m5
  kg6gUlTs58wgIxX0Li4IsXzBC9ihKzLzezQNgVErNmtTFB2GoSV89tYp7AKDgLSfssJO0LGJl
  WMZoVpxaVpRbpGuslFWWmZ5TkJmbm6CVW6SbqpZbq5uUXlWToGuollhfrpRYX6xVX5ibnpOjl
  pZZsYgQGbkpx+vodjO+W/tE7xCjJwaQkyntlZ1KyEF9SfkplRmJxRnxRaU5q8SFGGQ4OJQler
  cDkZCHBotT01Iq0zBxgFMGkJTh4lER4r/sBpXmLCxJzizPTIVKnGC05ps7+t5+ZYzmYnPm17Q
  CzEEtefl6qlDhvJMg8AZCGjNI8uHGwSL/EKCslzMvIwMAgxFOQWpSbWYIq/4pRnINRSZh3K8h
  ansy8Eritr4AOYgI6aFt1EshBJYkIKakGJuNuznmV4b9eLFNXclzm//uOWsCzi/fPXk/zlEtW
  f3u6e+daRiGVDYtl0p+uWDTpalPFsRPMr28ukoj06Nianbmao1bYK87zj8B0rlgBK7agl4EHF
  3InTwv8UP3p8az3pyf6f9UvigjPuDGJuaecWeUCj9fji9sNxD7WcltPCnIsYTgf+uNDwu2CqW
  +qHsptO1tpL2CgFxJ7PeyA5ba3VVNmHHLgvMHOE/I0JU74t+PW3lOdwqdflEjozNfU/G9mWCR
  hciHweNvK6iV34lZM1L79NXllukRb4wWBtYwmC35zMlVv7eqwPdSpxbs5TmmevL7+z/8z4l/e
  /Xys+MbWLvsWvn1Rqd+ni7eGp76bpMRSnJFoqMVcVJwIAOBasuVvAwAA
X-Env-Sender: wangmy@fujitsu.com
X-Msg-Ref: server-3.tower-745.messagelabs.com!1667453588!664705!1
X-Originating-IP: [62.60.8.179]
X-SYMC-ESS-Client-Auth: outbound-route-from=pass
X-StarScan-Received: 
X-StarScan-Version: 9.100.1; banners=-,-,-
X-VirusChecked: Checked
Received: (qmail 4692 invoked from network); 3 Nov 2022 05:33:09 -0000
Received: from unknown (HELO n03ukasimr04.n03.fujitsu.local) (62.60.8.179)
  by server-3.tower-745.messagelabs.com with ECDHE-RSA-AES256-GCM-SHA384 encrypted SMTP; 3 Nov 2022 05:33:09 -0000
Received: from n03ukasimr04.n03.fujitsu.local (localhost [127.0.0.1])
	by n03ukasimr04.n03.fujitsu.local (Postfix) with ESMTP id BCC037C
	for <openembedded-core@lists.openembedded.org>; Thu,  3 Nov 2022 05:33:08 +0000 (GMT)
Received: from R01UKEXCASM126.r01.fujitsu.local (R01UKEXCASM126 [10.183.43.178])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-SHA384 (256/256 bits))
	(No client certificate requested)
	by n03ukasimr04.n03.fujitsu.local (Postfix) with ESMTPS id B023F7B
	for <openembedded-core@lists.openembedded.org>; Thu,  3 Nov 2022 05:33:08 +0000 (GMT)
Received: from localhost.localdomain (10.167.225.33) by
 R01UKEXCASM126.r01.fujitsu.local (10.183.43.178) with Microsoft SMTP Server
 (TLS) id 15.0.1497.32; Thu, 3 Nov 2022 05:33:07 +0000
From: <wangmy@fujitsu.com>
To: <openembedded-core@lists.openembedded.org>
CC: Wang Mingyu <wangmy@fujitsu.com>
Subject: [OE-core] [PATCH] socat: upgrade 1.7.4.3 -> 1.7.4.4
Date: Thu, 3 Nov 2022 13:32:51 +0800
Message-ID: <1667453571-28233-3-git-send-email-wangmy@fujitsu.com>
X-Mailer: git-send-email 1.8.3.1
In-Reply-To: <1667453571-28233-1-git-send-email-wangmy@fujitsu.com>
References: <1667453571-28233-1-git-send-email-wangmy@fujitsu.com>
MIME-Version: 1.0
Content-Type: text/plain
X-Originating-IP: [10.167.225.33]
X-ClientProxiedBy: G08CNEXCHPEKD07.g08.fujitsu.local (10.167.33.80) To
 R01UKEXCASM126.r01.fujitsu.local (10.183.43.178)
X-Virus-Scanned: ClamAV using ClamSMTP
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Thu, 03 Nov 2022 05:33:20 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/172609

From: Wang Mingyu <wangmy@fujitsu.com>

0001-configure.ac-check-getprotobynumber_r-with-AC_TRY_LI.patch
removed since it's included in 1.7.4.4

Signed-off-by: Wang Mingyu <wangmy@fujitsu.com>
---
 ...ck-getprotobynumber_r-with-AC_TRY_LI.patch | 35 -------------------
 .../{socat_1.7.4.3.bb => socat_1.7.4.4.bb}    |  6 ++--
 2 files changed, 2 insertions(+), 39 deletions(-)
 delete mode 100644 meta/recipes-connectivity/socat/socat/0001-configure.ac-check-getprotobynumber_r-with-AC_TRY_LI.patch
 rename meta/recipes-connectivity/socat/{socat_1.7.4.3.bb => socat_1.7.4.4.bb} (89%)

diff --git a/meta/recipes-connectivity/socat/socat/0001-configure.ac-check-getprotobynumber_r-with-AC_TRY_LI.patch b/meta/recipes-connectivity/socat/socat/0001-configure.ac-check-getprotobynumber_r-with-AC_TRY_LI.patch
deleted file mode 100644
index fbfb0816dd..0000000000
--- a/meta/recipes-connectivity/socat/socat/0001-configure.ac-check-getprotobynumber_r-with-AC_TRY_LI.patch
+++ /dev/null
@@ -1,35 +0,0 @@
-From d67d6b4f981db9612d808bd723176a1d2996d53a Mon Sep 17 00:00:00 2001
-From: Alexander Kanavin <alex@linutronix.de>
-Date: Mon, 17 Jan 2022 13:21:32 +0100
-Subject: [PATCH] configure.ac: check getprotobynumber_r with AC_TRY_LINK
-
-AC_TRY_COMPILE won't error out if the function is altogether absent
-(e.g. on linux musl C library), the test needs to link all the way.
-
-Upstream-Status: Submitted [via email to socat@dest-unreach.org]
-Signed-off-by: Alexander Kanavin <alex@linutronix.de>
----
- configure.ac | 6 +++---
- 1 file changed, 3 insertions(+), 3 deletions(-)
-
-diff --git a/configure.ac b/configure.ac
-index d4acc9e..973a7f2 100644
---- a/configure.ac
-+++ b/configure.ac
-@@ -137,13 +137,13 @@ AC_MSG_RESULT($sc_cv_have_prototype_hstrerror)
- # getprotobynumber_r() is not standardized
- AC_MSG_CHECKING(for getprotobynumber_r() variant)
- AC_CACHE_VAL(sc_cv_getprotobynumber_r,
--[AC_TRY_COMPILE([#include <stddef.h>
-+[AC_TRY_LINK([#include <stddef.h>
- #include <netdb.h>],[getprotobynumber_r(1,NULL,NULL,1024,NULL);],
- [sc_cv_getprotobynumber_r=1; tmp_bynum_variant=Linux],
-- [AC_TRY_COMPILE([#include <stddef.h>
-+ [AC_TRY_LINK([#include <stddef.h>
-  #include <netdb.h>],[getprotobynumber_r(1,NULL,NULL,1024);],
-  [sc_cv_getprotobynumber_r=2; tmp_bynum_variant=Solaris],
--  [AC_TRY_COMPILE([#include <stddef.h>
-+  [AC_TRY_LINK([#include <stddef.h>
-   #include <netdb.h>],[getprotobynumber_r(1,NULL,NULL);],
-   [sc_cv_getprotobynumber_r=3; tmp_bynum_variant=AIX],
- 
diff --git a/meta/recipes-connectivity/socat/socat_1.7.4.3.bb b/meta/recipes-connectivity/socat/socat_1.7.4.4.bb
similarity index 89%
rename from meta/recipes-connectivity/socat/socat_1.7.4.3.bb
rename to meta/recipes-connectivity/socat/socat_1.7.4.4.bb
index a4a0a8933e..5a379380d1 100644
--- a/meta/recipes-connectivity/socat/socat_1.7.4.3.bb
+++ b/meta/recipes-connectivity/socat/socat_1.7.4.4.bb
@@ -9,11 +9,9 @@ LICENSE = "GPL-2.0-with-OpenSSL-exception"
 LIC_FILES_CHKSUM = "file://COPYING;md5=b234ee4d69f5fce4486a80fdaf4a4263 \
                     file://README;beginline=257;endline=287;md5=82520b052f322ac2b5b3dfdc7c7eea86"
 
-SRC_URI = "http://www.dest-unreach.org/socat/download/socat-${PV}.tar.bz2 \
-           file://0001-configure.ac-check-getprotobynumber_r-with-AC_TRY_LI.patch \
-           "
+SRC_URI = "http://www.dest-unreach.org/socat/download/socat-${PV}.tar.bz2"
 
-SRC_URI[sha256sum] = "d47318104415077635119dfee44bcfb41de3497374a9a001b1aff6e2f0858007"
+SRC_URI[sha256sum] = "fbd42bd2f0e54a3af6d01bdf15385384ab82dbc0e4f1a5e153b3e0be1b6380ac"
 
 inherit autotools
 
-- 
2.25.1


