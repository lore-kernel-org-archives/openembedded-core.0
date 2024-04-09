Return-Path: <wangmy@fujitsu.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id E42E9CD12A1
	for <webhook@archiver.kernel.org>; Tue,  9 Apr 2024 07:10:57 +0000 (UTC)
Received: from esa8.hc1455-7.c3s2.iphmx.com (esa8.hc1455-7.c3s2.iphmx.com [139.138.61.253])
 by mx.groups.io with SMTP id smtpd.web10.130221.1712646653922232115
 for <openembedded-core@lists.openembedded.org>;
 Tue, 09 Apr 2024 00:10:55 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@fujitsu.com header.s=fj2 header.b=ru5iwK38;
 spf=pass (domain: fujitsu.com, ip: 139.138.61.253, mailfrom: wangmy@fujitsu.com)
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
  d=fujitsu.com; i=@fujitsu.com; q=dns/txt; s=fj2;
  t=1712646654; x=1744182654;
  h=from:to:cc:subject:date:message-id:in-reply-to:
   references;
  bh=Oxh05J4QHr52AeP9TNi670TZPC8oVOfvdUQAY3wksUo=;
  b=ru5iwK388U9Ut0313o2JcETqSbhxfpTU5N5TDEl63dv5hwwQybSI9eTR
   aJouotVMC2ftyxbE2gL70eYsX4TiitURyV72gypfvr+g0gsTrZoMsU5ql
   CBIP0NHT/LyeuYP/ozCXOJ8E+0SL5bUCAuT3LM+RrTf+hovm4p+bfUkcB
   Ei0i/dSUBxiEQgpJ+FihzGkcLMwN4r+YuOtUI4kiyGm53hhVMKplai2OH
   fkD0gdLdR4rMAUH8Wcije5m5okKdeRaNqhhquvdZ0yX5/OtG7ikjDibdS
   noR8lCNlqTfgZFFklGaXolkANSeftKEgwHCOqlp0J+MpEfzGUC6S54xsL
   w==;
X-IronPort-AV: E=McAfee;i="6600,9927,11038"; a="143011367"
X-IronPort-AV: E=Sophos;i="6.07,189,1708354800"; 
   d="scan'208";a="143011367"
Received: from unknown (HELO oym-r1.gw.nic.fujitsu.com) ([210.162.30.89])
  by esa8.hc1455-7.c3s2.iphmx.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 09 Apr 2024 16:10:45 +0900
Received: from oym-m2.gw.nic.fujitsu.com (oym-nat-oym-m2.gw.nic.fujitsu.com [192.168.87.59])
	by oym-r1.gw.nic.fujitsu.com (Postfix) with ESMTP id 14277D4807
	for <openembedded-core@lists.openembedded.org>; Tue,  9 Apr 2024 16:10:43 +0900 (JST)
Received: from kws-ab3.gw.nic.fujitsu.com (kws-ab3.gw.nic.fujitsu.com [192.51.206.21])
	by oym-m2.gw.nic.fujitsu.com (Postfix) with ESMTP id 42EE5BDB62
	for <openembedded-core@lists.openembedded.org>; Tue,  9 Apr 2024 16:10:42 +0900 (JST)
Received: from edo.cn.fujitsu.com (edo.cn.fujitsu.com [10.167.33.5])
	by kws-ab3.gw.nic.fujitsu.com (Postfix) with ESMTP id D3AFD20093260
	for <openembedded-core@lists.openembedded.org>; Tue,  9 Apr 2024 16:10:41 +0900 (JST)
Received: from vm4860.g01.fujitsu.local (unknown [10.193.128.200])
	by edo.cn.fujitsu.com (Postfix) with ESMTP id 7F0D11A0002;
	Tue,  9 Apr 2024 15:10:41 +0800 (CST)
From: wangmy@fujitsu.com
To: openembedded-core@lists.openembedded.org
Cc: Wang Mingyu <wangmy@fujitsu.com>
Subject: [OE-core] [PATCH 16/33] libxmlb: upgrade 0.3.15 -> 0.3.17
Date: Tue,  9 Apr 2024 15:10:03 +0800
Message-Id: <1712646620-16608-16-git-send-email-wangmy@fujitsu.com>
X-Mailer: git-send-email 1.8.3.1
In-Reply-To: <1712646620-16608-1-git-send-email-wangmy@fujitsu.com>
References: <1712646620-16608-1-git-send-email-wangmy@fujitsu.com>
X-TM-AS-GCONF: 00
X-TM-AS-Product-Ver: IMSS-9.1.0.1417-9.0.0.1002-28306.006
X-TM-AS-User-Approved-Sender: Yes
X-TMASE-Version: IMSS-9.1.0.1417-9.0.1002-28306.006
X-TMASE-Result: 10--7.577500-10.000000
X-TMASE-MatchedRID: rofoCPeR2CGjz0nOeth/yaqHmm/V4M/PnJdsOLB4zv4H4DTIEE89jMU4
	n9V0lkG1OuzeNmOGKnN7fOPFW0It8v12TsqRMnfHA9lly13c/gHVy4hHC3/gyLKw8Hx0EGitcqf
	oMGP+CwQi+t+0AiFaYiXd6AfHhre0trZWHaNDZ4S628cXbnOhT/Wr7HvOSElauzdiHYg4JjPfXC
	XerOCSUlslxAfd+6tXeTjw/FyRX6QfE8yM4pjsDwtuKBGekqUpI/NGWt0UYPApGAdH9IRVF2Tta
	zOGqpCJhlG0Xa9WmzVdEmLZ/nqnXIrqfob6yLw3
X-TMASE-SNAP-Result: 1.821001.0001-0-1-22:0,33:0,34:0-0
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Tue, 09 Apr 2024 07:10:57 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/198046

From: Wang Mingyu <wangmy@fujitsu.com>

0001-xb-selftest.c-hardcode-G_TEST_SRCDIR.patch
refreshed for 0.3.17

Changelog:
=========
- Create SECURITY.md for the OpenSSF scorecard
- Fix decompressing large zstd files
- Use zst as the file extension for zstd
- Make the LZMA support optional
- Add the lzma and zstd support to the pkgconfig file

Signed-off-by: Wang Mingyu <wangmy@fujitsu.com>
---
 .../0001-xb-selftest.c-hardcode-G_TEST_SRCDIR.patch      | 9 +++------
 .../libxmlb/{libxmlb_0.3.15.bb => libxmlb_0.3.17.bb}     | 2 +-
 2 files changed, 4 insertions(+), 7 deletions(-)
 rename meta/recipes-gnome/libxmlb/{libxmlb_0.3.15.bb => libxmlb_0.3.17.bb} (93%)

diff --git a/meta/recipes-gnome/libxmlb/libxmlb/0001-xb-selftest.c-hardcode-G_TEST_SRCDIR.patch b/meta/recipes-gnome/libxmlb/libxmlb/0001-xb-selftest.c-hardcode-G_TEST_SRCDIR.patch
index da8ce68df9..27081d8749 100644
--- a/meta/recipes-gnome/libxmlb/libxmlb/0001-xb-selftest.c-hardcode-G_TEST_SRCDIR.patch
+++ b/meta/recipes-gnome/libxmlb/libxmlb/0001-xb-selftest.c-hardcode-G_TEST_SRCDIR.patch
@@ -1,4 +1,4 @@
-From dc208bafc57c1ccaa0ca260f99c8b4c976271ebc Mon Sep 17 00:00:00 2001
+From 8a1aa4c318b8dbe4c0c2b1c4968f867ea6641b32 Mon Sep 17 00:00:00 2001
 From: Markus Volk <f_l_k@t-online.de>
 Date: Sat, 16 Sep 2023 14:02:57 +0200
 Subject: [PATCH] xb-self-test.c: hardcode G_TEST_SRCDIR
@@ -18,10 +18,10 @@ Signed-off-by: Markus Volk <f_l_k@t-online.de>
  1 file changed, 1 insertion(+), 1 deletion(-)
 
 diff --git a/src/xb-self-test.c b/src/xb-self-test.c
-index 47d9728..8b3dd0e 100644
+index 1daca18..2e5b251 100644
 --- a/src/xb-self-test.c
 +++ b/src/xb-self-test.c
-@@ -2870,7 +2870,7 @@ xb_speed_func(void)
+@@ -2876,7 +2876,7 @@ xb_speed_func(void)
  int
  main(int argc, char **argv)
  {
@@ -30,6 +30,3 @@ index 47d9728..8b3dd0e 100644
  
  	g_test_init(&argc, &argv, NULL);
  
--- 
-2.41.0
-
diff --git a/meta/recipes-gnome/libxmlb/libxmlb_0.3.15.bb b/meta/recipes-gnome/libxmlb/libxmlb_0.3.17.bb
similarity index 93%
rename from meta/recipes-gnome/libxmlb/libxmlb_0.3.15.bb
rename to meta/recipes-gnome/libxmlb/libxmlb_0.3.17.bb
index 528e3e0bab..f403857fea 100644
--- a/meta/recipes-gnome/libxmlb/libxmlb_0.3.15.bb
+++ b/meta/recipes-gnome/libxmlb/libxmlb_0.3.17.bb
@@ -8,7 +8,7 @@ SRC_URI = " \
 	file://0001-xb-selftest.c-hardcode-G_TEST_SRCDIR.patch \
 	file://run-ptest \
 "
-SRCREV = "25a6384ad60f7e8550292e6cb4f262cc5da74be4"
+SRCREV = "db54f1b3254334e59b29b01b6cb666f444746594"
 S = "${WORKDIR}/git"
 
 DEPENDS = "glib-2.0 xz zstd"
-- 
2.34.1


