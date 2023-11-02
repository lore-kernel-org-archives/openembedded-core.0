Return-Path: <wangmy@fujitsu.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 4DCE4C4332F
	for <webhook@archiver.kernel.org>; Thu,  2 Nov 2023 08:20:46 +0000 (UTC)
Received: from esa1.hc1455-7.c3s2.iphmx.com (esa1.hc1455-7.c3s2.iphmx.com [207.54.90.47])
 by mx.groups.io with SMTP id smtpd.web11.25996.1698913238196851564
 for <openembedded-core@lists.openembedded.org>;
 Thu, 02 Nov 2023 01:20:38 -0700
Authentication-Results: mx.groups.io;
 dkim=none (message not signed); spf=pass (domain: fujitsu.com, ip: 207.54.90.47, mailfrom: wangmy@fujitsu.com)
X-IronPort-AV: E=McAfee;i="6600,9927,10881"; a="138206766"
X-IronPort-AV: E=Sophos;i="6.03,270,1694703600"; 
   d="scan'208";a="138206766"
Received: from unknown (HELO oym-r2.gw.nic.fujitsu.com) ([210.162.30.90])
  by esa1.hc1455-7.c3s2.iphmx.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 02 Nov 2023 17:20:36 +0900
Received: from oym-m3.gw.nic.fujitsu.com (oym-nat-oym-m3.gw.nic.fujitsu.com [192.168.87.60])
	by oym-r2.gw.nic.fujitsu.com (Postfix) with ESMTP id 78DF6D7AC6
	for <openembedded-core@lists.openembedded.org>; Thu,  2 Nov 2023 17:20:33 +0900 (JST)
Received: from aks-ab2.gw.nic.fujitsu.com (aks-ab2.gw.nic.fujitsu.com [192.51.207.12])
	by oym-m3.gw.nic.fujitsu.com (Postfix) with ESMTP id A68A5D94A2
	for <openembedded-core@lists.openembedded.org>; Thu,  2 Nov 2023 17:20:32 +0900 (JST)
Received: from vm4860.g01.fujitsu.local (unknown [10.193.128.79])
	by aks-ab2.gw.nic.fujitsu.com (Postfix) with ESMTP id 440AC886FC;
	Thu,  2 Nov 2023 17:20:23 +0900 (JST)
From: wangmy@fujitsu.com
To: openembedded-core@lists.openembedded.org
Cc: Wang Mingyu <wangmy@fujitsu.com>
Subject: [OE-core] [PATCH] dhcpcd: upgrade 10.0.3 -> 10.0.4
Date: Thu,  2 Nov 2023 16:17:53 +0800
Message-Id: <1698913076-22037-4-git-send-email-wangmy@fujitsu.com>
X-Mailer: git-send-email 1.8.3.1
In-Reply-To: <1698913076-22037-1-git-send-email-wangmy@fujitsu.com>
References: <1698913076-22037-1-git-send-email-wangmy@fujitsu.com>
X-TM-AS-GCONF: 00
X-TM-AS-Product-Ver: IMSS-9.1.0.1408-9.0.0.1002-27972.006
X-TM-AS-User-Approved-Sender: Yes
X-TMASE-Version: IMSS-9.1.0.1408-9.0.1002-27972.006
X-TMASE-Result: 10-1.212000-10.000000
X-TMASE-MatchedRID: dhm/lGuWeZijz0nOeth/yUIIxwDaU5mrXs5nqGvDCfOu9yzHHu0ZiZgU
	Ly4zAbFB3iwF9ByeEpOay7rv659o0O1a16oqp8B1/HTKStsDGMJHNQ8CqEKO2MC5DTEMxpeQ32S
	61JcPB8fhphqipnEX3Ey+rse8BOXwOwTo9ZXISSzdCok3ibXlQX0tCKdnhB58I/9UW5M5dRNp7q
	EhmmPgy46HM5rqDwqtlhBBcIQXbNDrPrQZhK9GbysPINySSm9Qct1bb8t/9Y52gy6D/lR9Z6vBo
	SmKicBeD29Wx8P52Now1pRkL52pKdrrTl55EFeVHSbhGbmGylXFJK7yLnZRGZdO3Q67ImL8gi4R
	Uz90EQwG2MApbv6odw==
X-TMASE-SNAP-Result: 1.821001.0001-0-1-22:0,33:0,34:0-0
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Thu, 02 Nov 2023 08:20:46 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/190063

From: Wang Mingyu <wangmy@fujitsu.com>

Changelog:
===========
privsep: allow __NR_mmap2 call
privsep: allow __NR_clock_gettime32 syscall
compat/arc4random.c: use memset instead of explicit_bzero
privsep: avoid SIGPIPE errors when scripts write to stderr/stdout after dhcpcd is daemonised

Signed-off-by: Wang Mingyu <wangmy@fujitsu.com>
---
 .../dhcpcd/{dhcpcd_10.0.3.bb => dhcpcd_10.0.4.bb}               | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)
 rename meta/recipes-connectivity/dhcpcd/{dhcpcd_10.0.3.bb => dhcpcd_10.0.4.bb} (97%)

diff --git a/meta/recipes-connectivity/dhcpcd/dhcpcd_10.0.3.bb b/meta/recipes-connectivity/dhcpcd/dhcpcd_10.0.4.bb
similarity index 97%
rename from meta/recipes-connectivity/dhcpcd/dhcpcd_10.0.3.bb
rename to meta/recipes-connectivity/dhcpcd/dhcpcd_10.0.4.bb
index cc0fb382df..fbc3e03d2d 100644
--- a/meta/recipes-connectivity/dhcpcd/dhcpcd_10.0.3.bb
+++ b/meta/recipes-connectivity/dhcpcd/dhcpcd_10.0.4.bb
@@ -17,7 +17,7 @@ SRC_URI = "git://github.com/NetworkConfiguration/dhcpcd;protocol=https;branch=ma
            file://0001-dhcpcd.8-Fix-conflict-error-when-enable-multilib.patch \
            "
 
-SRCREV = "45fb8fd8dd281d2228c7abaddff7877d27e67146"
+SRCREV = "3cb242656546acfe88f6201f8b3dbe261ffd1a3e"
 S = "${WORKDIR}/git"
 
 inherit pkgconfig autotools-brokensep systemd useradd
-- 
2.34.1


