Return-Path: <wangmy@fujitsu.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 10273C83F25
	for <webhook@archiver.kernel.org>; Thu, 31 Aug 2023 02:52:43 +0000 (UTC)
Received: from esa3.hc1455-7.c3s2.iphmx.com (esa3.hc1455-7.c3s2.iphmx.com [207.54.90.49])
 by mx.groups.io with SMTP id smtpd.web11.8783.1693450352695026690
 for <openembedded-core@lists.openembedded.org>;
 Wed, 30 Aug 2023 19:52:33 -0700
Authentication-Results: mx.groups.io;
 dkim=none (message not signed); spf=pass (domain: fujitsu.com, ip: 207.54.90.49, mailfrom: wangmy@fujitsu.com)
X-IronPort-AV: E=McAfee;i="6600,9927,10818"; a="130130010"
X-IronPort-AV: E=Sophos;i="6.02,215,1688396400"; 
   d="scan'208";a="130130010"
Received: from unknown (HELO oym-r4.gw.nic.fujitsu.com) ([210.162.30.92])
  by esa3.hc1455-7.c3s2.iphmx.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 31 Aug 2023 11:52:31 +0900
Received: from oym-m1.gw.nic.fujitsu.com (oym-nat-oym-m1.gw.nic.fujitsu.com [192.168.87.58])
	by oym-r4.gw.nic.fujitsu.com (Postfix) with ESMTP id BAFADDE574
	for <openembedded-core@lists.openembedded.org>; Thu, 31 Aug 2023 11:52:28 +0900 (JST)
Received: from aks-ab1.gw.nic.fujitsu.com (aks-ab1.gw.nic.fujitsu.com [192.51.207.11])
	by oym-m1.gw.nic.fujitsu.com (Postfix) with ESMTP id B8DEFD88DB
	for <openembedded-core@lists.openembedded.org>; Thu, 31 Aug 2023 11:52:27 +0900 (JST)
Received: from localhost.localdomain (unknown [10.167.225.33])
	by aks-ab1.gw.nic.fujitsu.com (Postfix) with ESMTP id D8E832FC2743;
	Thu, 31 Aug 2023 11:52:26 +0900 (JST)
From: wangmy@fujitsu.com
To: openembedded-core@lists.openembedded.org
Cc: Wang Mingyu <wangmy@fujitsu.com>
Subject: [OE-core] [PATCH] python3-wheel: upgrade 0.41.1 -> 0.41.2
Date: Thu, 31 Aug 2023 10:51:53 +0800
Message-Id: <1693450313-28496-1-git-send-email-wangmy@fujitsu.com>
X-Mailer: git-send-email 1.8.3.1
X-TM-AS-GCONF: 00
X-TM-AS-Product-Ver: IMSS-9.1.0.1408-9.0.0.1002-27846.004
X-TM-AS-User-Approved-Sender: Yes
X-TMASE-Version: IMSS-9.1.0.1408-9.0.1002-27846.004
X-TMASE-Result: 10--0.753600-10.000000
X-TMASE-MatchedRID: wgzGQ0X+yFqjz0nOeth/yUIIxwDaU5mrrOCEGIPhtwgFDK6GZYQJfVaM
	GUnd1OThF40HISqSK6p2TdMGhtDwkO1a16oqp8B1/HTKStsDGMJHNQ8CqEKO2MC5DTEMxpeQD5+
	EY120A3qnJlHH+cwDTiiOf1NDnCI+5UcZtwNsCroURSScn+QSXmVV1G+Ck2l7+gtHj7OwNO2i5u
	/VvsFaHXs8MPU4fJRYg8Tk/1MPrnlRW83m9GtD1nHoUb9idouHfI+mGUFUmBGJ5hm3vXaMgsz2r
	IVTiuylLnRrozcWdXgChgi81WO4XPIMFg0InOPqz5gAnmajvOU4qCidlj1MUy0uABDi47cA
X-TMASE-SNAP-Result: 1.821001.0001-0-1-22:0,33:0,34:0-0
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Thu, 31 Aug 2023 02:52:43 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/186954

From: Wang Mingyu <wangmy@fujitsu.com>

Changelog:
============
-Fixed platform tag detection for GraalPy and 32-bit python running on an
 aarch64 kernel
-Fixed wheel tags to not list directories in RECORD files
-Fixed ABI tag generation for GraalPy

Signed-off-by: Wang Mingyu <wangmy@fujitsu.com>
---
 .../python/{python3-wheel_0.41.1.bb => python3-wheel_0.41.2.bb} | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)
 rename meta/recipes-devtools/python/{python3-wheel_0.41.1.bb => python3-wheel_0.41.2.bb} (85%)

diff --git a/meta/recipes-devtools/python/python3-wheel_0.41.1.bb b/meta/recipes-devtools/python/python3-wheel_0.41.2.bb
similarity index 85%
rename from meta/recipes-devtools/python/python3-wheel_0.41.1.bb
rename to meta/recipes-devtools/python/python3-wheel_0.41.2.bb
index 8eb931b5c9..d11c6a857a 100644
--- a/meta/recipes-devtools/python/python3-wheel_0.41.1.bb
+++ b/meta/recipes-devtools/python/python3-wheel_0.41.2.bb
@@ -4,7 +4,7 @@ SECTION = "devel/python"
 LICENSE = "MIT"
 LIC_FILES_CHKSUM = "file://LICENSE.txt;md5=7ffb0db04527cfe380e4f2726bd05ebf"
 
-SRC_URI[sha256sum] = "12b911f083e876e10c595779709f8a88a59f45aacc646492a67fe9ef796c1b47"
+SRC_URI[sha256sum] = "0c5ac5ff2afb79ac23ab82bab027a0be7b5dbcf2e54dc50efe4bf507de1f7985"
 
 inherit python_flit_core pypi
 
-- 
2.34.1


