Return-Path: <wangmy@fujitsu.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 16F17EB64DC
	for <webhook@archiver.kernel.org>; Fri,  7 Jul 2023 03:10:27 +0000 (UTC)
Received: from esa12.hc1455-7.c3s2.iphmx.com (esa12.hc1455-7.c3s2.iphmx.com [139.138.37.100])
 by mx.groups.io with SMTP id smtpd.web11.4846.1688699424504530088
 for <openembedded-core@lists.openembedded.org>;
 Thu, 06 Jul 2023 20:10:25 -0700
Authentication-Results: mx.groups.io;
 dkim=missing; spf=pass (domain: fujitsu.com, ip: 139.138.37.100, mailfrom: wangmy@fujitsu.com)
X-IronPort-AV: E=McAfee;i="6600,9927,10763"; a="103103146"
X-IronPort-AV: E=Sophos;i="6.01,187,1684767600"; 
   d="scan'208";a="103103146"
Received: from unknown (HELO oym-r2.gw.nic.fujitsu.com) ([210.162.30.90])
  by esa12.hc1455-7.c3s2.iphmx.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 07 Jul 2023 12:10:21 +0900
Received: from oym-m2.gw.nic.fujitsu.com (oym-nat-oym-m2.gw.nic.fujitsu.com [192.168.87.59])
	by oym-r2.gw.nic.fujitsu.com (Postfix) with ESMTP id ECF5CCD7E3
	for <openembedded-core@lists.openembedded.org>; Fri,  7 Jul 2023 12:10:19 +0900 (JST)
Received: from aks-ab1.gw.nic.fujitsu.com (aks-ab1.gw.nic.fujitsu.com [192.51.207.11])
	by oym-m2.gw.nic.fujitsu.com (Postfix) with ESMTP id 2ABE7BD9AE
	for <openembedded-core@lists.openembedded.org>; Fri,  7 Jul 2023 12:10:19 +0900 (JST)
Received: from localhost.localdomain (unknown [10.167.225.33])
	by aks-ab1.gw.nic.fujitsu.com (Postfix) with ESMTP id 2EE7D2FC76DA;
	Fri,  7 Jul 2023 12:10:18 +0900 (JST)
From: wangmy@fujitsu.com
To: openembedded-core@lists.openembedded.org
Cc: Wang Mingyu <wangmy@fujitsu.com>
Subject: [OE-core] [PATCH] libnss-nis: upgrade 3.1 -> 3.2
Date: Fri,  7 Jul 2023 11:10:04 +0800
Message-Id: <1688699410-2397-2-git-send-email-wangmy@fujitsu.com>
X-Mailer: git-send-email 1.8.3.1
In-Reply-To: <1688699410-2397-1-git-send-email-wangmy@fujitsu.com>
References: <1688699410-2397-1-git-send-email-wangmy@fujitsu.com>
X-TM-AS-GCONF: 00
X-TM-AS-Product-Ver: IMSS-9.1.0.1408-9.0.0.1002-27736.002
X-TM-AS-User-Approved-Sender: Yes
X-TMASE-Version: IMSS-9.1.0.1408-9.0.1002-27736.002
X-TMASE-Result: 10--1.140500-10.000000
X-TMASE-MatchedRID: wgzGQ0X+yFqjz0nOeth/yUIIxwDaU5mrNi8L88UV9IBHpEd1UrzmFe79
	DJRUi35pTQ0JkPG287/mn3xyPJAJoh2P280ZiGmRuce7gFxhKa3zndiJkHFMhEgxSQxzSLAbIY6
	e+Xi1ah9bJcQH3furV3k48PxckV+kHxPMjOKY7A+Wlioo2ZbGwdmzcdRxL+xwKrauXd3MZDX1rD
	5DFqIKtbuI4bUT/B4eT1dWtWwPXriWvFEyBzBt3e8CEXR5NT7+fvJvYUQ7By/Taxtt4tpgYiama
	879zs0WAblS3q2y/h2qBBhtzPlTslPJnXL2yNYdkuo847l05tDEzMyAmsz+FHoWLWlXcsZv
X-TMASE-SNAP-Result: 1.821001.0001-0-1-22:0,33:0,34:0-0
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Fri, 07 Jul 2023 03:10:27 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/183988

From: Wang Mingyu <wangmy@fujitsu.com>

Changelog:
* Do not call malloc_usable_size

Signed-off-by: Wang Mingyu <wangmy@fujitsu.com>
---
 meta/recipes-extended/libnss-nis/libnss-nis.bb | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/meta/recipes-extended/libnss-nis/libnss-nis.bb b/meta/recipes-extended/libnss-nis/libnss-nis.bb
index d0afb3ca0a..f0e687c330 100644
--- a/meta/recipes-extended/libnss-nis/libnss-nis.bb
+++ b/meta/recipes-extended/libnss-nis/libnss-nis.bb
@@ -13,9 +13,9 @@ LIC_FILES_CHKSUM = "file://COPYING;md5=4fbd65380cdd255951079008b364516c"
 SECTION = "libs"
 DEPENDS += "libtirpc libnsl2"
 
-PV = "3.1+git${SRCPV}"
+PV = "3.2"
 
-SRCREV = "062f31999b35393abf7595cb89dfc9590d5a42ad"
+SRCREV = "cd0d391af9535b56e612ed227c1b89be269f3d59"
 
 SRC_URI = "git://github.com/thkukuk/libnss_nis;branch=master;protocol=https \
           "
-- 
2.34.1


