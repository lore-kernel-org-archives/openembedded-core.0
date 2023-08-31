Return-Path: <wangmy@fujitsu.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 0B010C83F14
	for <webhook@archiver.kernel.org>; Thu, 31 Aug 2023 02:28:33 +0000 (UTC)
Received: from esa5.hc1455-7.c3s2.iphmx.com (esa5.hc1455-7.c3s2.iphmx.com [68.232.139.130])
 by mx.groups.io with SMTP id smtpd.web11.8389.1693448911840205583
 for <openembedded-core@lists.openembedded.org>;
 Wed, 30 Aug 2023 19:28:32 -0700
Authentication-Results: mx.groups.io;
 dkim=none (message not signed); spf=pass (domain: fujitsu.com, ip: 68.232.139.130, mailfrom: wangmy@fujitsu.com)
X-IronPort-AV: E=McAfee;i="6600,9927,10818"; a="129616366"
X-IronPort-AV: E=Sophos;i="6.02,215,1688396400"; 
   d="scan'208";a="129616366"
Received: from unknown (HELO oym-r1.gw.nic.fujitsu.com) ([210.162.30.89])
  by esa5.hc1455-7.c3s2.iphmx.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 31 Aug 2023 11:28:29 +0900
Received: from oym-m1.gw.nic.fujitsu.com (oym-nat-oym-m1.gw.nic.fujitsu.com [192.168.87.58])
	by oym-r1.gw.nic.fujitsu.com (Postfix) with ESMTP id B3960D29E6
	for <openembedded-core@lists.openembedded.org>; Thu, 31 Aug 2023 11:28:25 +0900 (JST)
Received: from kws-ab3.gw.nic.fujitsu.com (kws-ab3.gw.nic.fujitsu.com [192.51.206.21])
	by oym-m1.gw.nic.fujitsu.com (Postfix) with ESMTP id E6A54D88DB
	for <openembedded-core@lists.openembedded.org>; Thu, 31 Aug 2023 11:28:24 +0900 (JST)
Received: from localhost.localdomain (unknown [10.167.225.33])
	by kws-ab3.gw.nic.fujitsu.com (Postfix) with ESMTP id 67C8C2007471D;
	Thu, 31 Aug 2023 11:28:24 +0900 (JST)
From: wangmy@fujitsu.com
To: openembedded-core@lists.openembedded.org
Cc: Wang Mingyu <wangmy@fujitsu.com>
Subject: [OE-core] [PATCH] bluez5: upgrade 5.68 -> 5.69
Date: Thu, 31 Aug 2023 10:28:09 +0800
Message-Id: <1693448889-27363-1-git-send-email-wangmy@fujitsu.com>
X-Mailer: git-send-email 1.8.3.1
X-TM-AS-GCONF: 00
X-TM-AS-Product-Ver: IMSS-9.1.0.1417-9.0.0.1002-27846.004
X-TM-AS-User-Approved-Sender: Yes
X-TMASE-Version: IMSS-9.1.0.1417-9.0.1002-27846.004
X-TMASE-Result: 10--8.565000-10.000000
X-TMASE-MatchedRID: kfHlHSjlGDOjz0nOeth/ySrLqyE6Ur/jBGvINcfHqhd/iZ1aNsYG7oFa
	KsEtPT2W88cLohcr5LAWRRjCZKJSZKQrW5teBJOwa87CDXaKRVKSiza26cvwNJr58CksHfm3MVd
	fMsaGcAtGW2C+1daMH8Yoh/qEF/tV0YRMm/X9bI65x7uAXGEprZcE9F6aLBE1PZSk8XZgZOEhS0
	ofkAkz2SL637QCIVpiDgxADz/r3AUtNVV5XI3AlBmCYUYerLHrGB9/bxS68hM0VxbuzzsaAGNok
	eyvFnLMLqXRU6adSEURzSC2cuw1w6uDeNsZ3XE3GXGu0jdPFGTdKRNjzo2IOGA+B6CBXAIW8nBr
	cMq2A/yxfbhqGxLk+4Ay6p60ZV62fJ5/bZ6npdjiRhduhvElsqX8y2tPBLhQRUekW27/gqe+C/J
	tncf7se0G2OiyxFXKMhu3/z2p0rveRFiRBvGwVg==
X-TMASE-SNAP-Result: 1.821001.0001-0-1-22:0,33:0,34:0-0
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Thu, 31 Aug 2023 02:28:33 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/186928

From: Wang Mingyu <wangmy@fujitsu.com>

fix-check-ell-path.patch
removed since it's included in 5.69

Changelog:
=========
 Fix issue with BAP enabling state correctly when resuming.
 Fix issue with detaching source ASEs only after Stop Ready.
 Fix issue with handling VCP audio location and descriptor.
 Fix issue with generating IRK for adapter with privacy enabled.
 Add support for BAP broadcast sink.

Signed-off-by: Wang Mingyu <wangmy@fujitsu.com>
---
 meta/recipes-connectivity/bluez5/bluez5.inc   |  1 -
 .../bluez5/bluez5/fix-check-ell-path.patch    | 39 -------------------
 .../bluez5/{bluez5_5.68.bb => bluez5_5.69.bb} |  2 +-
 3 files changed, 1 insertion(+), 41 deletions(-)
 delete mode 100644 meta/recipes-connectivity/bluez5/bluez5/fix-check-ell-path.patch
 rename meta/recipes-connectivity/bluez5/{bluez5_5.68.bb => bluez5_5.69.bb} (94%)

diff --git a/meta/recipes-connectivity/bluez5/bluez5.inc b/meta/recipes-connectivity/bluez5/bluez5.inc
index d2ee2b4f12..e10158a6e5 100644
--- a/meta/recipes-connectivity/bluez5/bluez5.inc
+++ b/meta/recipes-connectivity/bluez5/bluez5.inc
@@ -55,7 +55,6 @@ SRC_URI = "${KERNELORG_MIRROR}/linux/bluetooth/bluez-${PV}.tar.xz \
            file://0001-tests-add-a-target-for-building-tests-without-runnin.patch \
            file://0001-test-gatt-Fix-hung-issue.patch \
            file://0004-src-shared-util.c-include-linux-limits.h.patch \
-           file://fix-check-ell-path.patch \
            "
 S = "${WORKDIR}/bluez-${PV}"
 
diff --git a/meta/recipes-connectivity/bluez5/bluez5/fix-check-ell-path.patch b/meta/recipes-connectivity/bluez5/bluez5/fix-check-ell-path.patch
deleted file mode 100644
index 7afa63962d..0000000000
--- a/meta/recipes-connectivity/bluez5/bluez5/fix-check-ell-path.patch
+++ /dev/null
@@ -1,39 +0,0 @@
-Upstream-Status: Submitted [https://marc.info/?l=linux-bluetooth&m=168818474411163&w=2]
-Signed-off-by: Anuj Mittal <anuj.mittal@intel.com>
-
-From linux-bluetooth  Sat Jul 01 04:12:52 2023
-From: Rudi Heitbaum <rudi () heitbaum ! com>
-Date: Sat, 01 Jul 2023 04:12:52 +0000
-To: linux-bluetooth
-Subject: [PATCH] configure: Fix check ell path for cross compiling
-Message-Id: <20230701041252.139338-1-rudi () heitbaum ! com>
-X-MARC-Message: https://marc.info/?l=linux-bluetooth&m=168818474411163
-
-Use of AC_CHECK_FILE prevents cross compilation.
-Instead use test to support cross compiling.
-
-Signed-off-by: Rudi Heitbaum <rudi@heitbaum.com>
----
- configure.ac | 7 ++++---
- 1 file changed, 4 insertions(+), 3 deletions(-)
-
-diff --git a/configure.ac b/configure.ac
-index eff297960..bc7edfcd3 100644
---- a/configure.ac
-+++ b/configure.ac
-@@ -298,9 +298,10 @@ if (test "${enable_external_ell}" = "yes"); then
- 	AC_SUBST(ELL_LIBS)
- fi
- if (test "${enable_external_ell}" != "yes"); then
--	AC_CHECK_FILE(${srcdir}/ell/ell.h, dummy=yes,
--			AC_CHECK_FILE(${srcdir}/../ell/ell/ell.h, dummy=yes,
--				AC_MSG_ERROR(ELL source is required or use --enable-external-ell)))
-+	if (test ! -f ${srcdir}/ell/ell.h) &&
-+			(test ! -f ${srcdir}/../ell/ell/ell.h); then
-+				AC_MSG_ERROR(ELL source is required or use --enable-external-ell)
-+	fi
- fi
- AM_CONDITIONAL(EXTERNAL_ELL, test "${enable_external_ell}" = "yes" ||
- 				(test "${enable_btpclient}" != "yes" &&
--- 
-2.34.1
diff --git a/meta/recipes-connectivity/bluez5/bluez5_5.68.bb b/meta/recipes-connectivity/bluez5/bluez5_5.69.bb
similarity index 94%
rename from meta/recipes-connectivity/bluez5/bluez5_5.68.bb
rename to meta/recipes-connectivity/bluez5/bluez5_5.69.bb
index 7c7ad75ed8..4673000f60 100644
--- a/meta/recipes-connectivity/bluez5/bluez5_5.68.bb
+++ b/meta/recipes-connectivity/bluez5/bluez5_5.69.bb
@@ -1,6 +1,6 @@
 require bluez5.inc
 
-SRC_URI[sha256sum] = "fc505e6445cb579a55cacee6821fe70d633921522043d322b696de0a175ff933"
+SRC_URI[sha256sum] = "bc5a35ddc7c72d0d3999a0d7b2175c8b7d57ab670774f8b5b4900ff38a2627fc"
 
 CVE_STATUS[CVE-2020-24490] = "cpe-incorrect: This issue has kernel fixes rather than bluez fixes"
 
-- 
2.34.1


