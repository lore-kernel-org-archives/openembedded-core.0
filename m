Return-Path: <wangmy@fujitsu.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id C1043C6FA8E
	for <webhook@archiver.kernel.org>; Sun,  5 Mar 2023 08:08:15 +0000 (UTC)
Received: from mail1.bemta37.messagelabs.com (mail1.bemta37.messagelabs.com [85.158.142.113])
 by mx.groups.io with SMTP id smtpd.web11.5259.1678003687519363028
 for <openembedded-core@lists.openembedded.org>;
 Sun, 05 Mar 2023 00:08:07 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@fujitsu.com header.s=170520fj header.b=aGhCd4RS;
 spf=pass (domain: fujitsu.com, ip: 85.158.142.113, mailfrom: wangmy@fujitsu.com)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=fujitsu.com;
	s=170520fj; t=1678003685; i=@fujitsu.com;
	bh=D2ugQK1WdBW8tnJPiHHD1FkJqt+6adw2d60Z6OCmdLM=;
	h=From:To:CC:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type;
	b=aGhCd4RSVb5rbskgtH0ou6bOnVZGcI1Tcdrzme+1bq25ayGQSAJ7JWRNYAc6klaJR
	 OzYrHXtc0cfqxCbWQoXbFoERYVSfoTdjP8RFbNVNEgqiOTAZZCz560llzr9+Djd8mU
	 DxPPwNpvPbYyVK+62pIeQFFDPMqANH8Zs2MBw46c262vV4dIKwIpV39BK1J/a6pdjT
	 hKq6eIi6ucrBJV9OHrcNcHvK2pMMKJMdc0PMMDeAB58lFBF7CL+i05yx4XVm5uYs+O
	 v6wJ6oyxJDxwt3Gen1BcG1w+GEpOlyvcbi3JxWcV3e6Sbr6LbV3C1KmTKJXELwe+Jo
	 S8aco3PtYeZKQ==
X-Brightmail-Tracker: H4sIAAAAAAAAA+NgFnrMIsWRWlGSWpSXmKPExsViZ8ORpPvElyX
  F4M9+XYs7P9+xOzB6nNu4gjGAMYo1My8pvyKBNWPHkW2sBevMK240NLM2MDYadjFycQgJPGCU
  2PNwCiuEc4VJ4t+GbkYIZw+jxMbNe1m6GDk52ASkJG7c/8/WxcjBISKgJ3H1nyhImFlAReLF7
  x52EFtYwEHiwu9trCA2C1D8/tePrCDlvAJOEqdmq4KEJQQUJKY8fM8MYnMKOEs8fTkFrFUIqG
  TLjY1gcV4BQYmTM5+wQIyXkDj44gUzRK+ixOzLzSwQdqVE64dfULaaxNVzm5gnMArOQtI+C0n
  7AkamVYxmxalFZalFukZ6SUWZ6RkluYmZOXqJVbqJeqmlunn5RSUZuoZ6ieXFeqnFxXrFlbnJ
  OSl6eaklmxiBoZtSnPxpB+O63r96hxglOZiURHkDfzGnCPEl5adUZiQWZ8QXleakFh9ilOHgU
  JLgferGkiIkWJSanlqRlpkDjCOYtAQHj5II70NPoDRvcUFibnFmOkTqFKM9x8c/F/cyc1y9cg
  VIbtrXdYCZo3M/kBRiycvPS5US513mA9QmANKWUZoHNxQW95cYZaWEeRkZGBiEeApSi3IzS1D
  lXzGKczAqCfMaAJOIEE9mXgnc7ldAZzEBnaVxmgHkrJJEhJRUA1PJnctnZubH5a7bdHGNtcjG
  2Y+3G83pK1Do7A/zkFun5852h7Go/8P7OM/uCwe3bOYr4Liycmbz2m/zZ/7S3nAo6Jp/qpR94
  DKTv1OSH947uXgvn8TbXCHxjvTC11/Dsy9aPHo8rZnZm0Wo9vnpsq/pZ1btaJ+VJ1OupZL2W0
  U3pf20zEollp93XN3M9+6+e0d28Y+Xjr2MXB6ruFmaeBISG7azXNWZ4cm7N/jMtg8qSzj0pm2
  4dkltvnwic9TTlGcXOg8GpfkzOue3fJvMwJFqEPiz8NKvvZONxDelezBkiq0t+LT4r+7ppJT+
  HUJa33uuPf2iEvbMybZ4wR2pgwmW6rWmCwXlpzoZf3hp8VeJpTgj0VCLuag4EQBeddEddgMAA
  A==
X-Env-Sender: wangmy@fujitsu.com
X-Msg-Ref: server-17.tower-732.messagelabs.com!1678003684!707288!1
X-Originating-IP: [62.60.8.98]
X-SYMC-ESS-Client-Auth: outbound-route-from=pass
X-StarScan-Received: 
X-StarScan-Version: 9.103.1; banners=-,-,-
X-VirusChecked: Checked
Received: (qmail 3322 invoked from network); 5 Mar 2023 08:08:04 -0000
Received: from unknown (HELO n03ukasimr03.n03.fujitsu.local) (62.60.8.98)
  by server-17.tower-732.messagelabs.com with ECDHE-RSA-AES256-GCM-SHA384 encrypted SMTP; 5 Mar 2023 08:08:04 -0000
Received: from n03ukasimr03.n03.fujitsu.local (localhost [127.0.0.1])
	by n03ukasimr03.n03.fujitsu.local (Postfix) with ESMTP id 101071B6
	for <openembedded-core@lists.openembedded.org>; Sun,  5 Mar 2023 08:08:04 +0000 (GMT)
Received: from R01UKEXCASM223.r01.fujitsu.local (R01UKEXCASM223 [10.182.185.121])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-SHA384 (256/256 bits))
	(No client certificate requested)
	by n03ukasimr03.n03.fujitsu.local (Postfix) with ESMTPS id 0416E1AD
	for <openembedded-core@lists.openembedded.org>; Sun,  5 Mar 2023 08:08:04 +0000 (GMT)
Received: from localhost.localdomain (10.167.225.33) by
 R01UKEXCASM223.r01.fujitsu.local (10.182.185.121) with Microsoft SMTP Server
 (TLS) id 15.0.1497.42; Sun, 5 Mar 2023 08:08:02 +0000
From: <wangmy@fujitsu.com>
To: <openembedded-core@lists.openembedded.org>
CC: Wang Mingyu <wangmy@fujitsu.com>
Subject: [OE-core] [PATCH] stress-ng: upgrade 0.15.03 -> 0.15.04
Date: Sun, 5 Mar 2023 16:07:45 +0800
Message-ID: <1678003665-30591-3-git-send-email-wangmy@fujitsu.com>
X-Mailer: git-send-email 1.8.3.1
In-Reply-To: <1678003665-30591-1-git-send-email-wangmy@fujitsu.com>
References: <1678003665-30591-1-git-send-email-wangmy@fujitsu.com>
MIME-Version: 1.0
Content-Type: text/plain
X-Originating-IP: [10.167.225.33]
X-ClientProxiedBy: G08CNEXCHPEKD07.g08.fujitsu.local (10.167.33.80) To
 R01UKEXCASM223.r01.fujitsu.local (10.182.185.121)
X-Virus-Scanned: ClamAV using ClamSMTP
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Sun, 05 Mar 2023 08:08:15 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/178040

From: Wang Mingyu <wangmy@fujitsu.com>

0001-test-float-Make-variables-global.patch
0001-Include-sys-futex.h-for-clock_adjtime.patch
removed since they're included in 0.15.04.

0001-Pass-LD_GOLD-1-via-makefile-to-enable-gold-linker.patch
refreshed for 0.15.04.

Signed-off-by: Wang Mingyu <wangmy@fujitsu.com>
---
 ...nclude-sys-futex.h-for-clock_adjtime.patch | 32 --------------
 ...1-via-makefile-to-enable-gold-linker.patch | 42 +++----------------
 ...001-test-float-Make-variables-global.patch | 34 ---------------
 ...ess-ng_0.15.03.bb => stress-ng_0.15.04.bb} |  7 ++--
 4 files changed, 9 insertions(+), 106 deletions(-)
 delete mode 100644 meta/recipes-extended/stress-ng/stress-ng/0001-Include-sys-futex.h-for-clock_adjtime.patch
 delete mode 100644 meta/recipes-extended/stress-ng/stress-ng/0001-test-float-Make-variables-global.patch
 rename meta/recipes-extended/stress-ng/{stress-ng_0.15.03.bb => stress-ng_0.15.04.bb} (82%)

diff --git a/meta/recipes-extended/stress-ng/stress-ng/0001-Include-sys-futex.h-for-clock_adjtime.patch b/meta/recipes-extended/stress-ng/stress-ng/0001-Include-sys-futex.h-for-clock_adjtime.patch
deleted file mode 100644
index 87d2ead46a..0000000000
--- a/meta/recipes-extended/stress-ng/stress-ng/0001-Include-sys-futex.h-for-clock_adjtime.patch
+++ /dev/null
@@ -1,32 +0,0 @@
-From 57f207ec7fb39c8b502f40dbdabd568f6b866a82 Mon Sep 17 00:00:00 2001
-From: Khem Raj <raj.khem@gmail.com>
-Date: Mon, 13 Feb 2023 12:18:08 -0800
-Subject: [PATCH] Include sys/futex.h for clock_adjtime
-
-Fixes
-core-shim.c:1942:9: error: call to undeclared function 'clock_adjtime'; ISO C99 and later do not support implicit function declarations [-Wimplicit-function-declaration]
-
-Upstream-Status: Submitted [https://github.com/ColinIanKing/stress-ng/pull/261]
-Signed-off-by: Khem Raj <raj.khem@gmail.com>
----
- core-shim.c | 4 ++++
- 1 file changed, 4 insertions(+)
-
-diff --git a/core-shim.c b/core-shim.c
-index dc539c64..de38e908 100644
---- a/core-shim.c
-+++ b/core-shim.c
-@@ -66,6 +66,10 @@ UNEXPECTED
- #include <sys/prctl.h>
- #endif
- 
-+#if defined(HAVE_SYS_TIMEX_H)
-+#include <sys/timex.h>
-+#endif
-+
- #if defined(HAVE_SYS_RANDOM_H)
- #include <sys/random.h>
- #endif
--- 
-2.39.1
-
diff --git a/meta/recipes-extended/stress-ng/stress-ng/0001-Pass-LD_GOLD-1-via-makefile-to-enable-gold-linker.patch b/meta/recipes-extended/stress-ng/stress-ng/0001-Pass-LD_GOLD-1-via-makefile-to-enable-gold-linker.patch
index 821e4d910f..6742e0d256 100644
--- a/meta/recipes-extended/stress-ng/stress-ng/0001-Pass-LD_GOLD-1-via-makefile-to-enable-gold-linker.patch
+++ b/meta/recipes-extended/stress-ng/stress-ng/0001-Pass-LD_GOLD-1-via-makefile-to-enable-gold-linker.patch
@@ -1,4 +1,4 @@
-From 32386c13420f676bd938a8b1ceaeab8a5da46d17 Mon Sep 17 00:00:00 2001
+From 5d6fa06b3104637289178a471dd28d7bf3e14e76 Mon Sep 17 00:00:00 2001
 From: Khem Raj <raj.khem@gmail.com>
 Date: Tue, 3 Jan 2023 11:00:09 -0800
 Subject: [PATCH] Pass LD_GOLD=1 via makefile to enable gold linker
@@ -10,16 +10,16 @@ detecting and deciding.
 
 Upstream-Status: Submitted [https://github.com/ColinIanKing/stress-ng/pull/251]
 Signed-off-by: Khem Raj <raj.khem@gmail.com>
+
 ---
- Makefile        | 7 +++++++
- Makefile.config | 9 +--------
- 2 files changed, 8 insertions(+), 8 deletions(-)
+ Makefile | 7 +++++++
+ 1 file changed, 7 insertions(+)
 
 diff --git a/Makefile b/Makefile
-index f2fd4b6c..bff6b8ac 100644
+index 7a969aba..583ae04f 100644
 --- a/Makefile
 +++ b/Makefile
-@@ -69,6 +69,13 @@ endif
+@@ -93,6 +93,13 @@ endif
  #CFLAGS += -Weverything
  #endif
  
@@ -33,33 +33,3 @@ index f2fd4b6c..bff6b8ac 100644
  GREP = grep
  #
  # SunOS requires special grep for -e support
-diff --git a/Makefile.config b/Makefile.config
-index 394ed20d..48c94fa1 100644
---- a/Makefile.config
-+++ b/Makefile.config
-@@ -241,7 +241,7 @@ define check_ld
- 	$(call check_ld_tmp,$1,$2,$3)
- endef
- 
--all: linkers libraries headers cpufeatures types functions
-+all: libraries headers cpufeatures types functions
- 	@for I in $$(ls $(CONFIGS)); do \
- 		if [ -s $(CONFIGS)/$$I ]; then \
- 			echo "#define $$I"; \
-@@ -262,13 +262,6 @@ configdir:
- clean:
- 	@rm -rf $(CONFIGS) config config.h
- 
--linkers: \
--	configdir \
--	LD_GOLD
--
--LD_GOLD:
--	$(call check_ld,test-ld,HAVE_LD_GOLD,gold)
--
- libraries: \
- 	configdir \
- 	LIB_AIO LIB_APPARMOR LIB_BSD LIB_CRYPT LIB_DL \
--- 
-2.39.0
-
diff --git a/meta/recipes-extended/stress-ng/stress-ng/0001-test-float-Make-variables-global.patch b/meta/recipes-extended/stress-ng/stress-ng/0001-test-float-Make-variables-global.patch
deleted file mode 100644
index 2e598ca4f4..0000000000
--- a/meta/recipes-extended/stress-ng/stress-ng/0001-test-float-Make-variables-global.patch
+++ /dev/null
@@ -1,34 +0,0 @@
-From 958a86069c8d0149969b5c32212a28009c4a9ded Mon Sep 17 00:00:00 2001
-From: Khem Raj <raj.khem@gmail.com>
-Date: Sat, 21 Jan 2023 23:18:18 -0800
-Subject: [PATCH] test-float: Make variables global
-
-Latest clang ( clang 16+ ) is able to optimize everything out when -O2 is used and as
-a result build succeeds and test output comes out to be wrong. Therefore
-make the variables global, so clang does not optimize away the functions
-
-Upstream-Status: Backport [https://github.com/ColinIanKing/stress-ng/commit/e299eb60a3a029e975304cc43045aea6ab1fad70]
-Signed-off-by: Khem Raj <raj.khem@gmail.com>
----
- test/test-float.c | 3 +--
- 1 file changed, 1 insertion(+), 2 deletions(-)
-
-diff --git a/test/test-float.c b/test/test-float.c
-index d2800cd3..ad5503c3 100644
---- a/test/test-float.c
-+++ b/test/test-float.c
-@@ -61,10 +61,9 @@
- /* Avoid implicit int in the definition of test even if FLOAT is not known. */
- typedef FLOAT float_type;
- 
-+FLOAT a = 0.0, b = 0.0, c = 0.0, d = 0.0;
- static float_type HOT OPTIMIZE3 test(void)
- {
--	FLOAT a = 0.0, b = 0.0, c = 0.0, d = 0.0;
--
- 	float_ops(FLOAT, a, b, c, d, sin, cos);
- 	float_ops(FLOAT, a, b, c, d, sinl, cosl);
- 
--- 
-2.39.1
-
diff --git a/meta/recipes-extended/stress-ng/stress-ng_0.15.03.bb b/meta/recipes-extended/stress-ng/stress-ng_0.15.04.bb
similarity index 82%
rename from meta/recipes-extended/stress-ng/stress-ng_0.15.03.bb
rename to meta/recipes-extended/stress-ng/stress-ng_0.15.04.bb
index cd7f41a016..e891bb738b 100644
--- a/meta/recipes-extended/stress-ng/stress-ng_0.15.03.bb
+++ b/meta/recipes-extended/stress-ng/stress-ng_0.15.04.bb
@@ -6,10 +6,9 @@ LICENSE = "GPL-2.0-only"
 LIC_FILES_CHKSUM = "file://COPYING;md5=b234ee4d69f5fce4486a80fdaf4a4263"
 
 SRC_URI = "git://github.com/ColinIanKing/stress-ng.git;protocol=https;branch=master \
-           file://0001-test-float-Make-variables-global.patch \
-           file://0001-Include-sys-futex.h-for-clock_adjtime.patch \
-           file://0001-Pass-LD_GOLD-1-via-makefile-to-enable-gold-linker.patch"
-SRCREV = "f3be0447c10fd5652b4c3753d56bcaac13fd8917"
+           file://0001-Pass-LD_GOLD-1-via-makefile-to-enable-gold-linker.patch \
+           "
+SRCREV = "b9a437ec790ad4bcc71d31b2df39d4a601c55fa8"
 S = "${WORKDIR}/git"
 
 DEPENDS = "coreutils-native libbsd"
-- 
2.34.1


