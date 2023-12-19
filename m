Return-Path: <wangmy@fujitsu.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 8B3E6C41535
	for <webhook@archiver.kernel.org>; Tue, 19 Dec 2023 09:31:28 +0000 (UTC)
Received: from esa10.hc1455-7.c3s2.iphmx.com (esa10.hc1455-7.c3s2.iphmx.com [139.138.36.225])
 by mx.groups.io with SMTP id smtpd.web10.8643.1702978285903856195
 for <openembedded-core@lists.openembedded.org>;
 Tue, 19 Dec 2023 01:31:26 -0800
Authentication-Results: mx.groups.io;
 dkim=none (message not signed); spf=pass (domain: fujitsu.com, ip: 139.138.36.225, mailfrom: wangmy@fujitsu.com)
X-IronPort-AV: E=McAfee;i="6600,9927,10928"; a="131553563"
X-IronPort-AV: E=Sophos;i="6.04,287,1695654000"; 
   d="scan'208";a="131553563"
Received: from unknown (HELO yto-r4.gw.nic.fujitsu.com) ([218.44.52.220])
  by esa10.hc1455-7.c3s2.iphmx.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 19 Dec 2023 18:31:23 +0900
Received: from yto-m1.gw.nic.fujitsu.com (yto-nat-yto-m1.gw.nic.fujitsu.com [192.168.83.64])
	by yto-r4.gw.nic.fujitsu.com (Postfix) with ESMTP id F1648D3EAF
	for <openembedded-core@lists.openembedded.org>; Tue, 19 Dec 2023 18:31:20 +0900 (JST)
Received: from kws-ab3.gw.nic.fujitsu.com (kws-ab3.gw.nic.fujitsu.com [192.51.206.21])
	by yto-m1.gw.nic.fujitsu.com (Postfix) with ESMTP id 43389D2989
	for <openembedded-core@lists.openembedded.org>; Tue, 19 Dec 2023 18:31:20 +0900 (JST)
Received: from edo.cn.fujitsu.com (edo.cn.fujitsu.com [10.167.33.5])
	by kws-ab3.gw.nic.fujitsu.com (Postfix) with ESMTP id BF4C5202CA3E0
	for <openembedded-core@lists.openembedded.org>; Tue, 19 Dec 2023 18:31:19 +0900 (JST)
Received: from vm4860.g01.fujitsu.local (unknown [10.167.225.33])
	by edo.cn.fujitsu.com (Postfix) with ESMTP id 775011A006F;
	Tue, 19 Dec 2023 17:31:19 +0800 (CST)
From: wangmy@fujitsu.com
To: openembedded-core@lists.openembedded.org
Cc: Wang Mingyu <wangmy@fujitsu.com>
Subject: [OE-core] [PATCH] libseccomp: upgrade 2.5.4 -> 2.5.5
Date: Tue, 19 Dec 2023 17:29:59 +0800
Message-Id: <1702978199-7549-1-git-send-email-wangmy@fujitsu.com>
X-Mailer: git-send-email 1.8.3.1
X-TM-AS-GCONF: 00
X-TM-AS-Product-Ver: IMSS-9.1.0.1417-9.0.0.1002-28066.006
X-TM-AS-User-Approved-Sender: Yes
X-TMASE-Version: IMSS-9.1.0.1417-9.0.1002-28066.006
X-TMASE-Result: 10--0.609200-10.000000
X-TMASE-MatchedRID: wgzGQ0X+yFqjz0nOeth/yUIIxwDaU5mrVBDQSDMig9EH8UzOewTxw+79
	DJRUi35pTQ0JkPG287/mn3xyPJAJopGZilTi8ctSOwpfLMeBwRuC7C2rJeUTocwHSQ+yXjTDbC9
	dOQZ1jachBPVrlzoqRS5rYfHE0OO95UcZtwNsCroURSScn+QSXmVV1G+Ck2l7+gtHj7OwNO2W79
	Uq8KMo9XoYlo/LwfCiG4Tq0Ap0ah6/mzBYwpZGq3r+1R2+WAMkI6P0OdlDZKvkf2x48zp/oPnsh
	gltCTaujDclnSBJbUVPcnPQJAm9KPIMFg0InOPqz5gAnmajvOU4qCidlj1MUy0uABDi47cA
X-TMASE-SNAP-Result: 1.821001.0001-0-1-22:0,33:0,34:0-0
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Tue, 19 Dec 2023 09:31:28 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/192698

From: Wang Mingyu <wangmy@fujitsu.com>

Changelog:
==========
Update the syscall table for Linux v6.7-rc3

Signed-off-by: Wang Mingyu <wangmy@fujitsu.com>
---
 .../libseccomp/{libseccomp_2.5.4.bb => libseccomp_2.5.5.bb}   | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)
 rename meta/recipes-support/libseccomp/{libseccomp_2.5.4.bb => libseccomp_2.5.5.bb} (96%)

diff --git a/meta/recipes-support/libseccomp/libseccomp_2.5.4.bb b/meta/recipes-support/libseccomp/libseccomp_2.5.5.bb
similarity index 96%
rename from meta/recipes-support/libseccomp/libseccomp_2.5.4.bb
rename to meta/recipes-support/libseccomp/libseccomp_2.5.5.bb
index 505c21917b..a9c617fe9e 100644
--- a/meta/recipes-support/libseccomp/libseccomp_2.5.4.bb
+++ b/meta/recipes-support/libseccomp/libseccomp_2.5.5.bb
@@ -7,7 +7,7 @@ LIC_FILES_CHKSUM = "file://LICENSE;md5=7c13b3376cea0ce68d2d2da0a1b3a72c"
 
 DEPENDS += "gperf-native"
 
-SRCREV = "f33f95014b36f97b42f0c2290e96d5c31647ed10"
+SRCREV = "f0b04ab0b4fc0bc2cde6da1f407b4a487fe6d78f"
 
 SRC_URI = "git://github.com/seccomp/libseccomp.git;branch=release-2.5;protocol=https \
            file://run-ptest \
@@ -55,4 +55,4 @@ FILES:${PN}-dbg += "${libdir}/${PN}/tests/.debug/* ${libdir}/${PN}/tools/.debug"
 
 RDEPENDS:${PN}-ptest = "coreutils bash"
 
-PV = "2.5.4"
+PV = "2.5.5"
-- 
2.34.1


