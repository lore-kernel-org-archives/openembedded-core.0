Return-Path: <wangmy@fujitsu.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id A6FB7E7718A
	for <webhook@archiver.kernel.org>; Tue, 17 Dec 2024 08:58:35 +0000 (UTC)
Received: from esa12.hc1455-7.c3s2.iphmx.com (esa12.hc1455-7.c3s2.iphmx.com [139.138.37.100])
 by mx.groups.io with SMTP id smtpd.web11.77564.1734425912124024557
 for <openembedded-core@lists.openembedded.org>;
 Tue, 17 Dec 2024 00:58:32 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@fujitsu.com header.s=fj2 header.b=n0fayMGb;
 spf=pass (domain: fujitsu.com, ip: 139.138.37.100, mailfrom: wangmy@fujitsu.com)
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
  d=fujitsu.com; i=@fujitsu.com; q=dns/txt; s=fj2;
  t=1734425912; x=1765961912;
  h=from:to:cc:subject:date:message-id:in-reply-to:
   references;
  bh=GevpTvNmL5k3lS73T063DHkDlK/eIJggXRSoQNZiNOQ=;
  b=n0fayMGbjETlwEk9qECxvq3i/j4StMB2N8WvbRYTPPtyFd1eCP7NsbMg
   fwklx5hn3oWrk/sIGxEyB9W2aFaYPiTpoKSKV7o6rwZIfVMv7rfWqRGIr
   Tng3IeapNcL/T7DhWfnD9TBdw5cgyIZPcBZF6dcZbues36PeDpv1b2WKV
   Ap3aHeTJot49Cz8lDzIgBF8eFxXLes2xq2NxmirJoATcnFwatyOOlM5ri
   xpctX4l5tZeNTR2ovFseGKiJo+UBX+Rk59jpyEr7DMnQEnaZ09ulsfLSr
   h0dXx+Bi4QJ9FFCCLuFQ5Bnjpha7iYeLomLIDFuaItUGd+IyEIJ1eqFkr
   g==;
X-CSE-ConnectionGUID: BSIdaWkcTRyfLFXVV9lByQ==
X-CSE-MsgGUID: MeX2qR/TRRqBWqpJ4NR3Lg==
X-IronPort-AV: E=McAfee;i="6700,10204,11288"; a="162953381"
X-IronPort-AV: E=Sophos;i="6.12,241,1728918000"; 
   d="scan'208";a="162953381"
Received: from unknown (HELO oym-r1.gw.nic.fujitsu.com) ([210.162.30.89])
  by esa12.hc1455-7.c3s2.iphmx.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 17 Dec 2024 17:58:30 +0900
Received: from oym-m2.gw.nic.fujitsu.com (oym-nat-oym-m2.gw.nic.fujitsu.com [192.168.87.59])
	by oym-r1.gw.nic.fujitsu.com (Postfix) with ESMTP id 0C1A1D4809
	for <openembedded-core@lists.openembedded.org>; Tue, 17 Dec 2024 17:58:28 +0900 (JST)
Received: from kws-ab4.gw.nic.fujitsu.com (kws-ab4.gw.nic.fujitsu.com [192.51.206.22])
	by oym-m2.gw.nic.fujitsu.com (Postfix) with ESMTP id D247CBF4B6
	for <openembedded-core@lists.openembedded.org>; Tue, 17 Dec 2024 17:58:27 +0900 (JST)
Received: from edo.cn.fujitsu.com (edo.cn.fujitsu.com [10.167.33.5])
	by kws-ab4.gw.nic.fujitsu.com (Postfix) with ESMTP id 6D64F6B9B4
	for <openembedded-core@lists.openembedded.org>; Tue, 17 Dec 2024 17:58:27 +0900 (JST)
Received: from localhost.localdomain.localdomain (unknown [10.193.128.200])
	by edo.cn.fujitsu.com (Postfix) with ESMTP id 07B741A000B;
	Tue, 17 Dec 2024 16:58:26 +0800 (CST)
From: wangmy@fujitsu.com
To: openembedded-core@lists.openembedded.org
Cc: Wang Mingyu <wangmy@fujitsu.com>,
	Wang Mingyu <wangmy@cn.fujitsu.com>
Subject: [OE-core] [PATCH 07/21] libice: upgrade 1.1.1 -> 1.1.2
Date: Tue, 17 Dec 2024 16:57:53 +0800
Message-Id: <1734425887-18069-7-git-send-email-wangmy@fujitsu.com>
X-Mailer: git-send-email 1.8.3.1
In-Reply-To: <1734425887-18069-1-git-send-email-wangmy@fujitsu.com>
References: <1734425887-18069-1-git-send-email-wangmy@fujitsu.com>
X-TM-AS-GCONF: 00
X-TM-AS-Product-Ver: IMSS-9.1.0.1417-9.0.0.1002-28864.006
X-TM-AS-User-Approved-Sender: Yes
X-TMASE-Version: IMSS-9.1.0.1417-9.0.1002-28864.006
X-TMASE-Result: 10-1.606100-10.000000
X-TMASE-MatchedRID: V7gFd1X8+4Wjz0nOeth/yQPZZctd3P4B1cuIRwt/4MiysPB8dBBorXKn
	6DBj/gsEIvrftAIhWmKXPNnFX6R4FlxxDx5qbkR9FEUknJ/kEl6YwzE9E8g5OfoLR4+zsDTtfUe
	ErNKFJidm17dwpW1BKHXupiFTCetR5N/Jze+Pq4a0hxTJ8PaL7lzKus6hLBdGQWKWRmhR00RJHf
	IVjGsDR9oJmicvY9t3h55xOVXmkd/yDBYNCJzj6s+YAJ5mo7zlOKgonZY9TFMtLgAQ4uO3AA==
X-TMASE-SNAP-Result: 1.821001.0001-0-1-22:0,33:0,34:0-0
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Tue, 17 Dec 2024 08:58:35 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/208811

From: Wang Mingyu <wangmy@fujitsu.com>

Signed-off-by: Wang Mingyu <wangmy@cn.fujitsu.com>
---
 .../xorg-lib/{libice_1.1.1.bb => libice_1.1.2.bb}               | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)
 rename meta/recipes-graphics/xorg-lib/{libice_1.1.1.bb => libice_1.1.2.bb} (90%)

diff --git a/meta/recipes-graphics/xorg-lib/libice_1.1.1.bb b/meta/recipes-graphics/xorg-lib/libice_1.1.2.bb
similarity index 90%
rename from meta/recipes-graphics/xorg-lib/libice_1.1.1.bb
rename to meta/recipes-graphics/xorg-lib/libice_1.1.2.bb
index d5e3d28e06..f38bbfc615 100644
--- a/meta/recipes-graphics/xorg-lib/libice_1.1.1.bb
+++ b/meta/recipes-graphics/xorg-lib/libice_1.1.2.bb
@@ -20,7 +20,7 @@ XORG_PN = "libICE"
 
 BBCLASSEXTEND = "native nativesdk"
 
-SRC_URI[sha256sum] = "03e77afaf72942c7ac02ccebb19034e6e20f456dcf8dddadfeb572aa5ad3e451"
+SRC_URI[sha256sum] = "974e4ed414225eb3c716985df9709f4da8d22a67a2890066bc6dfc89ad298625"
 
 PACKAGECONFIG ??= "${@bb.utils.filter('DISTRO_FEATURES', 'ipv6', d)}"
 PACKAGECONFIG[arc4] = "ac_cv_lib_bsd_arc4random_buf=yes,ac_cv_lib_bsd_arc4random_buf=no,libbsd"
-- 
2.43.0


