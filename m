Return-Path: <wangmy@fujitsu.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id EA325C6FA8F
	for <webhook@archiver.kernel.org>; Thu, 31 Aug 2023 02:30:42 +0000 (UTC)
Received: from esa7.hc1455-7.c3s2.iphmx.com (esa7.hc1455-7.c3s2.iphmx.com [139.138.61.252])
 by mx.groups.io with SMTP id smtpd.web11.8428.1693449037897954563
 for <openembedded-core@lists.openembedded.org>;
 Wed, 30 Aug 2023 19:30:38 -0700
Authentication-Results: mx.groups.io;
 dkim=none (message not signed); spf=pass (domain: fujitsu.com, ip: 139.138.61.252, mailfrom: wangmy@fujitsu.com)
X-IronPort-AV: E=McAfee;i="6600,9927,10818"; a="108883281"
X-IronPort-AV: E=Sophos;i="6.02,215,1688396400"; 
   d="scan'208";a="108883281"
Received: from unknown (HELO oym-r1.gw.nic.fujitsu.com) ([210.162.30.89])
  by esa7.hc1455-7.c3s2.iphmx.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 31 Aug 2023 11:30:35 +0900
Received: from oym-m1.gw.nic.fujitsu.com (oym-nat-oym-m1.gw.nic.fujitsu.com [192.168.87.58])
	by oym-r1.gw.nic.fujitsu.com (Postfix) with ESMTP id 3146BD29E5
	for <openembedded-core@lists.openembedded.org>; Thu, 31 Aug 2023 11:30:33 +0900 (JST)
Received: from aks-ab1.gw.nic.fujitsu.com (aks-ab1.gw.nic.fujitsu.com [192.51.207.11])
	by oym-m1.gw.nic.fujitsu.com (Postfix) with ESMTP id 5E4A4D8B71
	for <openembedded-core@lists.openembedded.org>; Thu, 31 Aug 2023 11:30:32 +0900 (JST)
Received: from localhost.localdomain (unknown [10.167.225.33])
	by aks-ab1.gw.nic.fujitsu.com (Postfix) with ESMTP id 631692FC2743;
	Thu, 31 Aug 2023 11:30:31 +0900 (JST)
From: wangmy@fujitsu.com
To: openembedded-core@lists.openembedded.org
Cc: Wang Mingyu <wangmy@fujitsu.com>
Subject: [OE-core] [PATCH] ell: upgrade 0.57 -> 0.58
Date: Thu, 31 Aug 2023 10:30:05 +0800
Message-Id: <1693449005-27512-1-git-send-email-wangmy@fujitsu.com>
X-Mailer: git-send-email 1.8.3.1
X-TM-AS-GCONF: 00
X-TM-AS-Product-Ver: IMSS-9.1.0.1408-9.0.0.1002-27846.004
X-TM-AS-User-Approved-Sender: Yes
X-TMASE-Version: IMSS-9.1.0.1408-9.0.1002-27846.004
X-TMASE-Result: 10--3.906000-10.000000
X-TMASE-MatchedRID: hsQjHHSArR6jz0nOeth/yUIIxwDaU5mregIHHX2L4YziFxcREnURUrWp
	mZhgHqOoCC8aAmGeO6nqXvXKPBg5BmVjCRquYdk+EXjPIvKd74BUENBIMyKD0eCbuVI7hVbLvIO
	fPEvWQc6EZazhtGkI+nk48PxckV+kHxPMjOKY7A/+HHE8LDNSg8RB0bsfrpPIcSqbxBgG0w5+Nk
	KONxCQ32+l6rf0cPiA6Fiv690NP0VD+7lUXdnZPNPT7mUztrHUQOLCRV6iw0F9DEAO1hxjgGP1o
	v483XEn/C+xP4rehPqCvqWrFsheUcLe0zBjeZrbFQOP52BRBXJMTsKj18q/fA==
X-TMASE-SNAP-Result: 1.821001.0001-0-1-22:0,33:0,34:0-0
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Thu, 31 Aug 2023 02:30:42 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/186930

From: Wang Mingyu <wangmy@fujitsu.com>

Changelog:
 Add support for handling sysctl settings.

Signed-off-by: Wang Mingyu <wangmy@fujitsu.com>
---
 meta/recipes-core/ell/{ell_0.57.bb => ell_0.58.bb} | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)
 rename meta/recipes-core/ell/{ell_0.57.bb => ell_0.58.bb} (89%)

diff --git a/meta/recipes-core/ell/ell_0.57.bb b/meta/recipes-core/ell/ell_0.58.bb
similarity index 89%
rename from meta/recipes-core/ell/ell_0.57.bb
rename to meta/recipes-core/ell/ell_0.58.bb
index 09a0831fbe..04e8566305 100644
--- a/meta/recipes-core/ell/ell_0.57.bb
+++ b/meta/recipes-core/ell/ell_0.58.bb
@@ -15,7 +15,7 @@ DEPENDS = "dbus"
 inherit autotools pkgconfig
 
 SRC_URI = "https://mirrors.edge.kernel.org/pub/linux/libs/${BPN}/${BPN}-${PV}.tar.xz"
-SRC_URI[sha256sum] = "7603928ee584b758ca27c67e4dc513049a09b038d7d28459a9440f8443c91018"
+SRC_URI[sha256sum] = "531a980589c8954ff12a3110b4d958fa75a74c88ddcc3e2ace4317e76a7c1e9b"
 
 do_configure:prepend () {
     mkdir -p ${S}/build-aux
-- 
2.34.1


