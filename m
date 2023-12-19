Return-Path: <wangmy@fujitsu.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 75819C41535
	for <webhook@archiver.kernel.org>; Tue, 19 Dec 2023 09:34:08 +0000 (UTC)
Received: from esa12.hc1455-7.c3s2.iphmx.com (esa12.hc1455-7.c3s2.iphmx.com [139.138.37.100])
 by mx.groups.io with SMTP id smtpd.web10.8669.1702978444447082112
 for <openembedded-core@lists.openembedded.org>;
 Tue, 19 Dec 2023 01:34:04 -0800
Authentication-Results: mx.groups.io;
 dkim=none (message not signed); spf=pass (domain: fujitsu.com, ip: 139.138.37.100, mailfrom: wangmy@fujitsu.com)
X-IronPort-AV: E=McAfee;i="6600,9927,10928"; a="123233576"
X-IronPort-AV: E=Sophos;i="6.04,287,1695654000"; 
   d="scan'208";a="123233576"
Received: from unknown (HELO oym-r3.gw.nic.fujitsu.com) ([210.162.30.91])
  by esa12.hc1455-7.c3s2.iphmx.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 19 Dec 2023 18:34:01 +0900
Received: from oym-m4.gw.nic.fujitsu.com (oym-nat-oym-m4.gw.nic.fujitsu.com [192.168.87.61])
	by oym-r3.gw.nic.fujitsu.com (Postfix) with ESMTP id 90BDCD64B6
	for <openembedded-core@lists.openembedded.org>; Tue, 19 Dec 2023 18:33:59 +0900 (JST)
Received: from kws-ab4.gw.nic.fujitsu.com (kws-ab4.gw.nic.fujitsu.com [192.51.206.22])
	by oym-m4.gw.nic.fujitsu.com (Postfix) with ESMTP id B1460B4B57
	for <openembedded-core@lists.openembedded.org>; Tue, 19 Dec 2023 18:33:58 +0900 (JST)
Received: from edo.cn.fujitsu.com (edo.cn.fujitsu.com [10.167.33.5])
	by kws-ab4.gw.nic.fujitsu.com (Postfix) with ESMTP id 47A452646DF
	for <openembedded-core@lists.openembedded.org>; Tue, 19 Dec 2023 18:33:58 +0900 (JST)
Received: from vm4860.g01.fujitsu.local (unknown [10.167.225.33])
	by edo.cn.fujitsu.com (Postfix) with ESMTP id 00F1D1A006F;
	Tue, 19 Dec 2023 17:33:57 +0800 (CST)
From: wangmy@fujitsu.com
To: openembedded-core@lists.openembedded.org
Cc: Wang Mingyu <wangmy@fujitsu.com>
Subject: [OE-core] [PATCH] kea: upgrade 2.4.0 -> 2.4.1
Date: Tue, 19 Dec 2023 17:33:46 +0800
Message-Id: <1702978426-7717-1-git-send-email-wangmy@fujitsu.com>
X-Mailer: git-send-email 1.8.3.1
X-TM-AS-GCONF: 00
X-TM-AS-Product-Ver: IMSS-9.1.0.1417-9.0.0.1002-28066.006
X-TM-AS-User-Approved-Sender: Yes
X-TMASE-Version: IMSS-9.1.0.1417-9.0.1002-28066.006
X-TMASE-Result: 10--0.212100-10.000000
X-TMASE-MatchedRID: sujxEcxUy52jz0nOeth/yUIIxwDaU5mrC//1TMV5chPEWhdVdXNnv8hm
	GVf5QASG99RfPuwPDMhMvq7HvATl8BLmJd2F/yFuuce7gFxhKa03l2plwgrtWDBwx50fHFECIUt
	KH5AJM9ki+t+0AiFaYph3ANfpkSSuzCsOCBxDp3Xece0aRiX9WgXWJb8/Z1O/lvbT0mHtu1QfbE
	hfX2CTX57guFZiRT2GroLsYWEhvXaCmIQhO1j3C2Kti8ccmN8T4SkIdSwphgYz91mDYZLM5SiQL
	+IhWlyylY5hs+VtBo8ua2HxxNDjveVHGbcDbAq6FEUknJ/kEl4BpRCTkRk5SfoLR4+zsDTthUfR
	2rvBju7iRJHOuOMGHx/yLSzHQXJLEcVLGdu+uLDEqdi2vD5uN6SrJqhOwdTOmXlEskIvfJFAVxH
	z1/zq2PLMsf2hpTki39U2kS5cPqeAcjH79gRLW1PJnXL2yNYdkuo847l05tDEzMyAmsz+FHoWLW
	lXcsZv
X-TMASE-SNAP-Result: 1.821001.0001-0-1-22:0,33:0,34:0-0
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Tue, 19 Dec 2023 09:34:08 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/192702

From: Wang Mingyu <wangmy@fujitsu.com>

Changelog:
=========
-The library version numbers have been bumped up for the Kea 2.4.1 stable release.
-Fixed interface redetection which had stopped working since Kea 2.3.6.
-Fixed a race condition in free lease queue allocator

fix-multilib-conflict.patch
fix_pid_keactrl.patch
refreshed for 2.4.

Signed-off-by: Wang Mingyu <wangmy@fujitsu.com>
---
 .../kea/files/fix-multilib-conflict.patch                 | 8 ++++----
 meta/recipes-connectivity/kea/files/fix_pid_keactrl.patch | 6 +++---
 .../kea/{kea_2.4.0.bb => kea_2.4.1.bb}                    | 2 +-
 3 files changed, 8 insertions(+), 8 deletions(-)
 rename meta/recipes-connectivity/kea/{kea_2.4.0.bb => kea_2.4.1.bb} (97%)

diff --git a/meta/recipes-connectivity/kea/files/fix-multilib-conflict.patch b/meta/recipes-connectivity/kea/files/fix-multilib-conflict.patch
index 451b409c88..5b135b3aee 100644
--- a/meta/recipes-connectivity/kea/files/fix-multilib-conflict.patch
+++ b/meta/recipes-connectivity/kea/files/fix-multilib-conflict.patch
@@ -1,4 +1,4 @@
-From d027b1d85a8c1a0193b6e4a00083d3038d699a59 Mon Sep 17 00:00:00 2001
+From 06ebd1b2ced426c420ed162980eca194f9f918ae Mon Sep 17 00:00:00 2001
 From: Kai Kang <kai.kang@windriver.com>
 Date: Tue, 22 Sep 2020 15:02:33 +0800
 Subject: [PATCH] There are conflict of config files between kea and lib32-kea:
@@ -35,10 +35,10 @@ index e6ae8b8..50a3092 100644
  //          "param1": "foo"
  //      }
 diff --git a/src/bin/keactrl/kea-dhcp4.conf.pre b/src/bin/keactrl/kea-dhcp4.conf.pre
-index 26bf163..49ddb0a 100644
+index 6edb8a1..b2a7385 100644
 --- a/src/bin/keactrl/kea-dhcp4.conf.pre
 +++ b/src/bin/keactrl/kea-dhcp4.conf.pre
-@@ -252,7 +252,7 @@
+@@ -255,7 +255,7 @@
      //       // of all devices serviced by Kea, including their identifiers
      //       // (like MAC address), their location in the network, times
      //       // when they were active etc.
@@ -47,7 +47,7 @@ index 26bf163..49ddb0a 100644
      //       "parameters": {
      //           "path": "/var/lib/kea",
      //           "base-name": "kea-forensic4"
-@@ -269,7 +269,7 @@
+@@ -272,7 +272,7 @@
      //       // of specific options or perhaps even a combination of several
      //       // options and fields to uniquely identify a client. Those scenarios
      //       // are addressed by the Flexible Identifiers hook application.
diff --git a/meta/recipes-connectivity/kea/files/fix_pid_keactrl.patch b/meta/recipes-connectivity/kea/files/fix_pid_keactrl.patch
index b7c2fd4f0d..63a6a2805b 100644
--- a/meta/recipes-connectivity/kea/files/fix_pid_keactrl.patch
+++ b/meta/recipes-connectivity/kea/files/fix_pid_keactrl.patch
@@ -1,4 +1,4 @@
-From 18f4f6206c248d6169aa67b3ecf16bf54e9292e8 Mon Sep 17 00:00:00 2001
+From c878a356712606549f7f188b62f7d1cae08a176e Mon Sep 17 00:00:00 2001
 From: Armin kuster <akuster808@gmail.com>
 Date: Wed, 14 Oct 2020 22:48:31 -0700
 Subject: [PATCH] Busybox does not support ps -p so use pgrep
@@ -13,10 +13,10 @@ Signed-off-by: Armin kuster <akuster808@gmail.com>
  1 file changed, 2 insertions(+), 2 deletions(-)
 
 diff --git a/src/bin/keactrl/keactrl.in b/src/bin/keactrl/keactrl.in
-index ae5bd8e..e9f9b73 100644
+index 450e997..c353ca9 100644
 --- a/src/bin/keactrl/keactrl.in
 +++ b/src/bin/keactrl/keactrl.in
-@@ -151,8 +151,8 @@ check_running() {
+@@ -149,8 +149,8 @@ check_running() {
      # Get the PID from the PID file (if it exists)
      get_pid_from_file "${proc_name}"
      if [ ${_pid} -gt 0 ]; then
diff --git a/meta/recipes-connectivity/kea/kea_2.4.0.bb b/meta/recipes-connectivity/kea/kea_2.4.1.bb
similarity index 97%
rename from meta/recipes-connectivity/kea/kea_2.4.0.bb
rename to meta/recipes-connectivity/kea/kea_2.4.1.bb
index 316468754e..c3aa4dc8f0 100644
--- a/meta/recipes-connectivity/kea/kea_2.4.0.bb
+++ b/meta/recipes-connectivity/kea/kea_2.4.1.bb
@@ -19,7 +19,7 @@ SRC_URI = "http://ftp.isc.org/isc/kea/${PV}/${BP}.tar.gz \
            file://0001-src-lib-log-logger_unittest_support.cc-do-not-write-.patch \
            file://0001-kea-fix-reproducible-build-failure.patch \
            "
-SRC_URI[sha256sum] = "3a33cd08dc3319ff544e6bbf2c0429042106f4051ebe115dc1bb2625c95003f7"
+SRC_URI[sha256sum] = "815c61f5c271caa4a1db31dd656eb50a7f6ea973da3690f7c8581408e180131a"
 
 inherit autotools systemd update-rc.d upstream-version-is-even
 
-- 
2.34.1


