Return-Path: <wangmy@fujitsu.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id D97D5C30658
	for <webhook@archiver.kernel.org>; Fri, 21 Jun 2024 02:17:25 +0000 (UTC)
Received: from esa2.hc1455-7.c3s2.iphmx.com (esa2.hc1455-7.c3s2.iphmx.com [207.54.90.48])
 by mx.groups.io with SMTP id smtpd.web10.64103.1718936236565616258
 for <openembedded-core@lists.openembedded.org>;
 Thu, 20 Jun 2024 19:17:17 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@fujitsu.com header.s=fj2 header.b=As/pBQPo;
 spf=pass (domain: fujitsu.com, ip: 207.54.90.48, mailfrom: wangmy@fujitsu.com)
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
  d=fujitsu.com; i=@fujitsu.com; q=dns/txt; s=fj2;
  t=1718936237; x=1750472237;
  h=from:to:cc:subject:date:message-id:in-reply-to:
   references;
  bh=+efy09vEFXrtwUKAkWG4eoF50WKpmlbNK+Q2W6ZL0mM=;
  b=As/pBQPo7XsOtYwIe0H5JbJnGQRqCLIt6Sg/5cpkxfLgw2rpMbNUID7P
   8Zrnn5dVhm5AaYJgVmHa3YvSsg6s5uz7iwvtZXUBk3nXjHUUg2iUS9ek/
   E8TT8+3mZ+YrUNHRLinvFnrk9940c9S4jfnisgXcrArSAVjrXWpnlPlwr
   O3IqkCEv556lMRPumTAB6AA/Lj3jApKC6KAHH6nyGTyHDtKFMiJeS1512
   hz4pU5mg84bmCXs9zTJ8LQ2Rfn4xC787IPVBnRxJTkwF6N3kYRRPetIw+
   9pdFRmU1k2LztZjiF4aXRWZRZW1kzUK1NxAryywhOJF5NflFSbrehf6zF
   g==;
X-IronPort-AV: E=McAfee;i="6700,10204,11109"; a="164517915"
X-IronPort-AV: E=Sophos;i="6.08,253,1712588400"; 
   d="scan'208";a="164517915"
Received: from unknown (HELO oym-r2.gw.nic.fujitsu.com) ([210.162.30.90])
  by esa2.hc1455-7.c3s2.iphmx.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 21 Jun 2024 11:17:14 +0900
Received: from oym-m1.gw.nic.fujitsu.com (oym-nat-oym-m1.gw.nic.fujitsu.com [192.168.87.58])
	by oym-r2.gw.nic.fujitsu.com (Postfix) with ESMTP id 40B64D9223
	for <openembedded-core@lists.openembedded.org>; Fri, 21 Jun 2024 11:17:12 +0900 (JST)
Received: from kws-ab3.gw.nic.fujitsu.com (kws-ab3.gw.nic.fujitsu.com [192.51.206.21])
	by oym-m1.gw.nic.fujitsu.com (Postfix) with ESMTP id 822F0D8B78
	for <openembedded-core@lists.openembedded.org>; Fri, 21 Jun 2024 11:17:11 +0900 (JST)
Received: from edo.cn.fujitsu.com (edo.cn.fujitsu.com [10.167.33.5])
	by kws-ab3.gw.nic.fujitsu.com (Postfix) with ESMTP id 1E9A720086E80
	for <openembedded-core@lists.openembedded.org>; Fri, 21 Jun 2024 11:17:11 +0900 (JST)
Received: from vm4860.g01.fujitsu.local (unknown [10.193.128.200])
	by edo.cn.fujitsu.com (Postfix) with ESMTP id BC0001A0002;
	Fri, 21 Jun 2024 10:17:10 +0800 (CST)
From: wangmy@fujitsu.com
To: openembedded-core@lists.openembedded.org
Cc: Wang Mingyu <wangmy@fujitsu.com>
Subject: [OE-core] [PATCH 07/22] e2fsprogs: upgrade 1.47.0 -> 1.47.1
Date: Fri, 21 Jun 2024 10:16:31 +0800
Message-Id: <1718936206-8080-7-git-send-email-wangmy@fujitsu.com>
X-Mailer: git-send-email 1.8.3.1
In-Reply-To: <1718936206-8080-1-git-send-email-wangmy@fujitsu.com>
References: <1718936206-8080-1-git-send-email-wangmy@fujitsu.com>
X-TM-AS-GCONF: 00
X-TM-AS-Product-Ver: IMSS-9.1.0.1417-9.0.0.1002-28468.003
X-TM-AS-User-Approved-Sender: Yes
X-TMASE-Version: IMSS-9.1.0.1417-9.0.1002-28468.003
X-TMASE-Result: 10--4.600900-10.000000
X-TMASE-MatchedRID: KEcVumlYY7qjz0nOeth/yTo39wOA02LhcDzcoONn/M7gm7lSO4VWyxgf
	YJBt7QVICC8aAmGeO6lLTmvmHr3PYogrKnsJ1GRgP0HVIeixJdDBOVz0Jwcxl76S7Hfu9IUxMGP
	3Ppm27oXk/YOYzpDLI5QjnXYPTWn0vUxpsK1XD0vQpQjOLprYzjFVRYZezcLzTPm/MsQarwNZmD
	r9dDYC/86fCquIgcEY0e/U++yziOQqAObPkRRi5WvOwg12ikVSmzsJ8CsZYU7fc2Xd6VJ+yq+Xj
	xY1c4On8e+q8Pw+WKaAMuqetGVetksDkkP3zIjq3QfwsVk0UbvqwGfCk7KUs5unMEiC2p/GXRwU
	gWfJLFkfalXfFIAIOWAy89TwlR68EqVN2MlgdEx1MlGXRWM4jUNBc77XIS0nR30k7w6vMDQpmCz
	HQDFsrIgeppQyntVe0v8srR3gjfRl7+AkHjVJOxuqkzsKv5+9ftwZ3X11IV0=
X-TMASE-SNAP-Result: 1.821001.0001-0-1-22:0,33:0,34:0-0
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Fri, 21 Jun 2024 02:17:25 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/200973

From: Wang Mingyu <wangmy@fujitsu.com>

mkdir_p.patch
ptest.patch
quiet-debugfs.patch
refreshed for 1.47.1

Changelog:
 https://e2fsprogs.sourceforge.net/e2fsprogs-release.html#1.47.1

Signed-off-by: Wang Mingyu <wangmy@fujitsu.com>
---
 meta/recipes-devtools/e2fsprogs/e2fsprogs/mkdir_p.patch   | 7 +++----
 meta/recipes-devtools/e2fsprogs/e2fsprogs/ptest.patch     | 8 ++++----
 .../e2fsprogs/e2fsprogs/quiet-debugfs.patch               | 7 +++----
 .../{e2fsprogs_1.47.0.bb => e2fsprogs_1.47.1.bb}          | 2 +-
 4 files changed, 11 insertions(+), 13 deletions(-)
 rename meta/recipes-devtools/e2fsprogs/{e2fsprogs_1.47.0.bb => e2fsprogs_1.47.1.bb} (99%)

diff --git a/meta/recipes-devtools/e2fsprogs/e2fsprogs/mkdir_p.patch b/meta/recipes-devtools/e2fsprogs/e2fsprogs/mkdir_p.patch
index f6916a1112..27aca1e112 100644
--- a/meta/recipes-devtools/e2fsprogs/e2fsprogs/mkdir_p.patch
+++ b/meta/recipes-devtools/e2fsprogs/e2fsprogs/mkdir_p.patch
@@ -1,4 +1,4 @@
-From e3a30baa5c1e2f0ac7e246539db1c7db5a2fe302 Mon Sep 17 00:00:00 2001
+From cd693e0d943053ff41677be44ec9f6b002eb3600 Mon Sep 17 00:00:00 2001
 From: Joe Slater <jslater@windriver.com>
 Date: Tue, 7 Mar 2017 14:53:19 -0800
 Subject: [PATCH] e2fsprogs: expand @mkdir_p@
@@ -9,16 +9,15 @@ not expanded so no locale data is written into usr/share/locale.
 Upstream-Status: Pending
 
 Signed-off-by: Joe Slater <jslater@windriver.com>
-
 ---
  configure.ac | 2 ++
  1 file changed, 2 insertions(+)
 
 diff --git a/configure.ac b/configure.ac
-index 4c4b5523..3475c707 100644
+index 131caef3..ca448d97 100644
 --- a/configure.ac
 +++ b/configure.ac
-@@ -919,6 +919,8 @@ AC_SUBST(PACKAGE)
+@@ -938,6 +938,8 @@ AC_SUBST(PACKAGE)
  AC_SUBST(VERSION)
  
  AM_GNU_GETTEXT([external])
diff --git a/meta/recipes-devtools/e2fsprogs/e2fsprogs/ptest.patch b/meta/recipes-devtools/e2fsprogs/e2fsprogs/ptest.patch
index 20839b7286..3fb88bbc89 100644
--- a/meta/recipes-devtools/e2fsprogs/e2fsprogs/ptest.patch
+++ b/meta/recipes-devtools/e2fsprogs/e2fsprogs/ptest.patch
@@ -1,4 +1,4 @@
-From b8842065ad621a03a971dfd50db862c5bffdeb49 Mon Sep 17 00:00:00 2001
+From 45bf94b3986ec87130eb51579909b9b6cbe21ebe Mon Sep 17 00:00:00 2001
 From: Dmitry Eremin-Solenikov <dmitry_eremin@mentor.com>
 Date: Sat, 18 Apr 2015 17:58:17 +0300
 Subject: [PATCH] e2fsprogs: add ptest
@@ -14,10 +14,10 @@ Signed-off-by: Kai Kang <kai.kang@windriver.com>
  2 files changed, 18 insertions(+), 18 deletions(-)
 
 diff --git a/tests/Makefile.in b/tests/Makefile.in
-index 8c4d2048..e021af32 100644
+index ba06b3b6..5a3e48f4 100644
 --- a/tests/Makefile.in
 +++ b/tests/Makefile.in
-@@ -19,7 +19,7 @@ test_one: $(srcdir)/test_one.in Makefile mke2fs.conf
+@@ -20,7 +20,7 @@ test_one: $(srcdir)/test_one.in Makefile mke2fs.conf test_data.tmp
  	@echo "#!/bin/sh" > test_one
  	@echo "HTREE=y" >> test_one
  	@echo "QUOTA=y" >> test_one
@@ -26,7 +26,7 @@ index 8c4d2048..e021af32 100644
  	@echo "DIFF_OPTS=@UNI_DIFF_OPTS@" >> test_one
  	@echo "SIZEOF_TIME_T=@SIZEOF_TIME_T@" >> test_one
  	@echo "DD=@DD@" >>test_one
-@@ -30,7 +30,7 @@ test_script: test_one test_script.in Makefile mke2fs.conf
+@@ -31,7 +31,7 @@ test_script: test_one test_script.in Makefile mke2fs.conf test_data.tmp
  	@echo "Creating test_script..."
  	@[ -f test_script ] && chmod u+w test_script || true
  	@echo "#!/bin/sh" > test_script
diff --git a/meta/recipes-devtools/e2fsprogs/e2fsprogs/quiet-debugfs.patch b/meta/recipes-devtools/e2fsprogs/e2fsprogs/quiet-debugfs.patch
index 0a6904208d..3648c26f71 100644
--- a/meta/recipes-devtools/e2fsprogs/e2fsprogs/quiet-debugfs.patch
+++ b/meta/recipes-devtools/e2fsprogs/e2fsprogs/quiet-debugfs.patch
@@ -1,4 +1,4 @@
-From 580ef6cae2d353f3aa5d5c52d6614bdc1df50f08 Mon Sep 17 00:00:00 2001
+From c9bc5795a4a9821e727131923f07876fe3aa82d3 Mon Sep 17 00:00:00 2001
 From: Ross Burton <ross.burton@intel.com>
 Date: Mon, 23 Dec 2013 13:38:34 +0000
 Subject: [PATCH] e2fsprogs: silence debugfs
@@ -8,16 +8,15 @@ filesystems at rootfs time.
 
 Upstream-Status: Inappropriate
 Signed-off-by: Ross Burton <ross.burton@intel.com>
-
 ---
  debugfs/debugfs.c | 2 +-
  1 file changed, 1 insertion(+), 1 deletion(-)
 
 diff --git a/debugfs/debugfs.c b/debugfs/debugfs.c
-index 9b6321dc..8ebf3ddb 100644
+index 909c1df3..0842369e 100644
 --- a/debugfs/debugfs.c
 +++ b/debugfs/debugfs.c
-@@ -2516,7 +2516,7 @@ static int source_file(const char *cmd_file, int ss_idx)
+@@ -2529,7 +2529,7 @@ static int source_file(const char *cmd_file, int ss_idx)
  		cp = strchr(buf, '\r');
  		if (cp)
  			*cp = 0;
diff --git a/meta/recipes-devtools/e2fsprogs/e2fsprogs_1.47.0.bb b/meta/recipes-devtools/e2fsprogs/e2fsprogs_1.47.1.bb
similarity index 99%
rename from meta/recipes-devtools/e2fsprogs/e2fsprogs_1.47.0.bb
rename to meta/recipes-devtools/e2fsprogs/e2fsprogs_1.47.1.bb
index 940b47c155..bd6ac92cb1 100644
--- a/meta/recipes-devtools/e2fsprogs/e2fsprogs_1.47.0.bb
+++ b/meta/recipes-devtools/e2fsprogs/e2fsprogs_1.47.1.bb
@@ -10,7 +10,7 @@ SRC_URI:append:class-native = " \
            file://quiet-debugfs.patch \
            "
 
-SRCREV = "f4c9cc4bedacde8408edda3520a32d3842290112"
+SRCREV = "b571b9b4240739a982e8bca62cfc914a3b50190a"
 UPSTREAM_CHECK_GITTAGREGEX = "v(?P<pver>\d+\.\d+(\.\d+)*)$"
 
 EXTRA_OECONF += "--libdir=${base_libdir} --sbindir=${base_sbindir} \
-- 
2.34.1


