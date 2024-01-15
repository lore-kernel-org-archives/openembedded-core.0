Return-Path: <wangmy@fujitsu.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 1C602C3DA79
	for <webhook@archiver.kernel.org>; Mon, 15 Jan 2024 09:29:15 +0000 (UTC)
Received: from esa4.hc1455-7.c3s2.iphmx.com (esa4.hc1455-7.c3s2.iphmx.com [68.232.139.117])
 by mx.groups.io with SMTP id smtpd.web11.74073.1705310945376740542
 for <openembedded-core@lists.openembedded.org>;
 Mon, 15 Jan 2024 01:29:05 -0800
Authentication-Results: mx.groups.io;
 dkim=none (message not signed); spf=pass (domain: fujitsu.com, ip: 68.232.139.117, mailfrom: wangmy@fujitsu.com)
X-IronPort-AV: E=McAfee;i="6600,9927,10953"; a="146427743"
X-IronPort-AV: E=Sophos;i="6.04,196,1695654000"; 
   d="scan'208";a="146427743"
Received: from unknown (HELO oym-r2.gw.nic.fujitsu.com) ([210.162.30.90])
  by esa4.hc1455-7.c3s2.iphmx.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 15 Jan 2024 18:29:02 +0900
Received: from oym-m1.gw.nic.fujitsu.com (oym-nat-oym-m1.gw.nic.fujitsu.com [192.168.87.58])
	by oym-r2.gw.nic.fujitsu.com (Postfix) with ESMTP id 52065D7AE4
	for <openembedded-core@lists.openembedded.org>; Mon, 15 Jan 2024 18:29:00 +0900 (JST)
Received: from kws-ab3.gw.nic.fujitsu.com (kws-ab3.gw.nic.fujitsu.com [192.51.206.21])
	by oym-m1.gw.nic.fujitsu.com (Postfix) with ESMTP id 78DA8D88A6
	for <openembedded-core@lists.openembedded.org>; Mon, 15 Jan 2024 18:28:59 +0900 (JST)
Received: from edo.cn.fujitsu.com (edo.cn.fujitsu.com [10.167.33.5])
	by kws-ab3.gw.nic.fujitsu.com (Postfix) with ESMTP id 0E725202D4B7F
	for <openembedded-core@lists.openembedded.org>; Mon, 15 Jan 2024 18:28:59 +0900 (JST)
Received: from vm4860.g01.fujitsu.local (unknown [10.193.128.187])
	by edo.cn.fujitsu.com (Postfix) with ESMTP id 9C3571A0070;
	Mon, 15 Jan 2024 17:28:58 +0800 (CST)
From: wangmy@fujitsu.com
To: openembedded-core@lists.openembedded.org
Cc: Wang Mingyu <wangmy@fujitsu.com>
Subject: [OE-core] [PATCH] virglrenderer: upgrade 1.0.0 -> 1.0.1
Date: Mon, 15 Jan 2024 17:28:45 +0800
Message-Id: <1705310925-24895-1-git-send-email-wangmy@fujitsu.com>
X-Mailer: git-send-email 1.8.3.1
X-TM-AS-GCONF: 00
X-TM-AS-Product-Ver: IMSS-9.1.0.1417-9.0.0.1002-28120.006
X-TM-AS-User-Approved-Sender: Yes
X-TMASE-Version: IMSS-9.1.0.1417-9.0.1002-28120.006
X-TMASE-Result: 10-1.663300-10.000000
X-TMASE-MatchedRID: PWXwJQp0B9ujz0nOeth/yTo39wOA02LhYdBG+bhhiNRkDFfw8NSG/Nnf
	JrUSEbFD/9FzCWH6Yv2mKaU7uZLa5se3wV6A2hch8t4fUUGeErTVy4hHC3/gyMC5DTEMxpeQFH0
	IKehhaobrME+4JvD76fLsqSqP9dnTTTFYHxDbNaoZgmFGHqyx6xgff28UuvITRkICFa5gS+RdHL
	0OBPA3VJlpVRngOexPM1t5qJg+auhsrHetY4BToMdIMosX9xY4+KgiyLtJrSCohlnMbn2V9LYHq
	iG3BlJoOYIeI2j5ld0JwgMHF6GFiWctmt2uR2BplXePXNM4FjMNVHotTvuv6wIZ++dWnH7bnptr
	8PnHpyni8zVgXoAltsIJ+4gwXrEtJ0RPnyOnrZK5c7G4iEESHA0gwjZkzrkjSX0013Ns47EBVPi
	Ro8QLYfiuFfa68fbSQJT3AIbKVXkd9635KxYj/pGsdZ+zrqS5bEkrXOOgxQxLv5Eyr/YIrqsDhz
	tRXZ9Cm+LY9A78UVCLPa6Os9XH3IQhTU20ySbR
X-TMASE-SNAP-Result: 1.821001.0001-0-1-22:0,33:0,34:0-0
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Mon, 15 Jan 2024 09:29:15 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/193665

From: Wang Mingyu <wangmy@fujitsu.com>

0001-meson.build-use-python3-directly-for-python.patch
refreshed for 1.0.1

0001-vtest-Fix-undefined-behavior-with-clang.patch
removed since it's included in 1.0.1

Signed-off-by: Wang Mingyu <wangmy@fujitsu.com>
---
 ...uild-use-python3-directly-for-python.patch |  6 +-
 ...st-Fix-undefined-behavior-with-clang.patch | 56 -------------------
 ...nderer_1.0.0.bb => virglrenderer_1.0.1.bb} |  3 +-
 3 files changed, 4 insertions(+), 61 deletions(-)
 delete mode 100644 meta/recipes-graphics/virglrenderer/virglrenderer/0001-vtest-Fix-undefined-behavior-with-clang.patch
 rename meta/recipes-graphics/virglrenderer/{virglrenderer_1.0.0.bb => virglrenderer_1.0.1.bb} (92%)

diff --git a/meta/recipes-graphics/virglrenderer/virglrenderer/0001-meson.build-use-python3-directly-for-python.patch b/meta/recipes-graphics/virglrenderer/virglrenderer/0001-meson.build-use-python3-directly-for-python.patch
index 06379ee716..3e12495970 100644
--- a/meta/recipes-graphics/virglrenderer/virglrenderer/0001-meson.build-use-python3-directly-for-python.patch
+++ b/meta/recipes-graphics/virglrenderer/virglrenderer/0001-meson.build-use-python3-directly-for-python.patch
@@ -1,4 +1,4 @@
-From 2afe24fc95dbb89e99df29ccbe73afa835f58202 Mon Sep 17 00:00:00 2001
+From dec8cca59124d7f8796b54902482ceb295a71b51 Mon Sep 17 00:00:00 2001
 From: Alexander Kanavin <alex.kanavin@gmail.com>
 Date: Mon, 6 Jan 2020 12:44:42 +0100
 Subject: [PATCH] meson.build: use 'python3' directly for python
@@ -14,10 +14,10 @@ Signed-off-by: Alexander Kanavin <alex.kanavin@gmail.com>
  1 file changed, 1 insertion(+), 1 deletion(-)
 
 diff --git a/meson.build b/meson.build
-index de6d16b5..79cedbf6 100644
+index 9f91ff2f..2391f89d 100644
 --- a/meson.build
 +++ b/meson.build
-@@ -68,7 +68,7 @@ flags = [
+@@ -74,7 +74,7 @@ flags = [
  
  add_project_arguments(cc.get_supported_arguments(flags), language : 'c')
  
diff --git a/meta/recipes-graphics/virglrenderer/virglrenderer/0001-vtest-Fix-undefined-behavior-with-clang.patch b/meta/recipes-graphics/virglrenderer/virglrenderer/0001-vtest-Fix-undefined-behavior-with-clang.patch
deleted file mode 100644
index 48488d7be1..0000000000
--- a/meta/recipes-graphics/virglrenderer/virglrenderer/0001-vtest-Fix-undefined-behavior-with-clang.patch
+++ /dev/null
@@ -1,56 +0,0 @@
-From ea328b246d093477cf26a68b42e975aaaef6abad Mon Sep 17 00:00:00 2001
-From: Khem Raj <raj.khem@gmail.com>
-Date: Tue, 28 Nov 2023 21:55:36 -0800
-Subject: [PATCH] vtest: Fix undefined behavior with clang
-
-This is seen when compiling with CC="clang -D_FORTIFY_SOURCE=2"
-Move #ifdef outside of printf() call.
-
-Fixes
-
-| ../git/vtest/vtest_server.c:244:2: error: embedding a directive within macro arguments has undefined behavior [-Werror,-Wembedded-directive]
-|   244 | #ifdef ENABLE_VENUS
-|       |  ^
-| ../git/vtest/vtest_server.c:246:2: error: embedding a directive within macro arguments has undefined behavior [-Werror,-Wembedded-directive]
-|   246 | #endif
-|       |  ^
-
-Upstream-Status: Submitted [https://gitlab.freedesktop.org/virgl/virglrenderer/-/merge_requests/1309]
-Signed-off-by: Khem Raj <raj.khem@gmail.com>
----
- vtest/vtest_server.c | 12 ++++++++----
- 1 file changed, 8 insertions(+), 4 deletions(-)
-
-diff --git a/vtest/vtest_server.c b/vtest/vtest_server.c
-index 1ca7f74f..93d949d7 100644
---- a/vtest/vtest_server.c
-+++ b/vtest/vtest_server.c
-@@ -197,6 +197,12 @@ static void vtest_server_parse_args(int argc, char **argv)
-    /* getopt_long stores the option index here. */
-    int option_index = 0;
- 
-+#ifdef ENABLE_VENUS
-+   char* ven = " [--venus]";
-+#else
-+   char* ven = "";
-+#endif
-+
-    do {
-       ret = getopt_long(argc, argv, "", long_options, &option_index);
- 
-@@ -244,10 +250,8 @@ static void vtest_server_parse_args(int argc, char **argv)
-          printf("Usage: %s [--no-fork] [--no-loop-or-fork] [--multi-clients] "
-                 "[--use-glx] [--use-egl-surfaceless] [--use-gles] [--no-virgl]"
-                 "[--rendernode <dev>] [--socket-path <path>] "
--#ifdef ENABLE_VENUS
--                " [--venus]"
--#endif
--                " [file]\n", argv[0]);
-+                "%s"
-+                " [file]\n", argv[0], ven);
-          exit(EXIT_FAILURE);
-          break;
-       }
--- 
-2.43.0
-
diff --git a/meta/recipes-graphics/virglrenderer/virglrenderer_1.0.0.bb b/meta/recipes-graphics/virglrenderer/virglrenderer_1.0.1.bb
similarity index 92%
rename from meta/recipes-graphics/virglrenderer/virglrenderer_1.0.0.bb
rename to meta/recipes-graphics/virglrenderer/virglrenderer_1.0.1.bb
index eb7ba1089f..0501b0c59c 100644
--- a/meta/recipes-graphics/virglrenderer/virglrenderer_1.0.0.bb
+++ b/meta/recipes-graphics/virglrenderer/virglrenderer_1.0.1.bb
@@ -9,10 +9,9 @@ LICENSE = "MIT"
 LIC_FILES_CHKSUM = "file://COPYING;md5=c81c08eeefd9418fca8f88309a76db10"
 
 DEPENDS = "libdrm libepoxy virtual/egl virtual/libgbm"
-SRCREV = "9c9d55ecbe502e0d71ee99529709efcca69aac42"
+SRCREV = "690680e5f0f952e22424fca1538c1b24457a0868"
 SRC_URI = "git://gitlab.freedesktop.org/virgl/virglrenderer.git;branch=main;protocol=https \
            file://0001-meson.build-use-python3-directly-for-python.patch \
-           file://0001-vtest-Fix-undefined-behavior-with-clang.patch \
            "
 
 S = "${WORKDIR}/git"
-- 
2.34.1


