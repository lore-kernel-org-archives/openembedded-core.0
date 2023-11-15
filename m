Return-Path: <wangmy@fujitsu.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 59C1DC07548
	for <webhook@archiver.kernel.org>; Wed, 15 Nov 2023 08:09:48 +0000 (UTC)
Received: from esa2.hc1455-7.c3s2.iphmx.com (esa2.hc1455-7.c3s2.iphmx.com [207.54.90.48])
 by mx.groups.io with SMTP id smtpd.web11.8541.1700035784112775958
 for <openembedded-core@lists.openembedded.org>;
 Wed, 15 Nov 2023 00:09:44 -0800
Authentication-Results: mx.groups.io;
 dkim=none (message not signed); spf=pass (domain: fujitsu.com, ip: 207.54.90.48, mailfrom: wangmy@fujitsu.com)
X-IronPort-AV: E=McAfee;i="6600,9927,10894"; a="139714125"
X-IronPort-AV: E=Sophos;i="6.03,304,1694703600"; 
   d="scan'208";a="139714125"
Received: from unknown (HELO oym-r2.gw.nic.fujitsu.com) ([210.162.30.90])
  by esa2.hc1455-7.c3s2.iphmx.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 15 Nov 2023 17:09:42 +0900
Received: from oym-m1.gw.nic.fujitsu.com (oym-nat-oym-m1.gw.nic.fujitsu.com [192.168.87.58])
	by oym-r2.gw.nic.fujitsu.com (Postfix) with ESMTP id 4559DDC146
	for <openembedded-core@lists.openembedded.org>; Wed, 15 Nov 2023 17:09:39 +0900 (JST)
Received: from kws-ab3.gw.nic.fujitsu.com (kws-ab3.gw.nic.fujitsu.com [192.51.206.21])
	by oym-m1.gw.nic.fujitsu.com (Postfix) with ESMTP id 7E9CCD88C2
	for <openembedded-core@lists.openembedded.org>; Wed, 15 Nov 2023 17:09:38 +0900 (JST)
Received: from vm4860.g01.fujitsu.local (unknown [10.193.128.79])
	by kws-ab3.gw.nic.fujitsu.com (Postfix) with ESMTP id AA08220050199;
	Wed, 15 Nov 2023 17:09:37 +0900 (JST)
From: wangmy@fujitsu.com
To: openembedded-core@lists.openembedded.org
Cc: Wang Mingyu <wangmy@fujitsu.com>
Subject: [OE-core] [PATCH] dhcpcd: upgrade 10.0.4 -> 10.0.5
Date: Wed, 15 Nov 2023 16:09:05 +0800
Message-Id: <1700035745-979-1-git-send-email-wangmy@fujitsu.com>
X-Mailer: git-send-email 1.8.3.1
X-TM-AS-GCONF: 00
X-TM-AS-Product-Ver: IMSS-9.1.0.1417-9.0.0.1002-27998.006
X-TM-AS-User-Approved-Sender: Yes
X-TMASE-Version: IMSS-9.1.0.1417-9.0.1002-27998.006
X-TMASE-Result: 10--2.600200-10.000000
X-TMASE-MatchedRID: u4ys6248rQyjz0nOeth/yUIIxwDaU5mrP3Y6Dcg5mW232CLmbDkNLDTI
	xI7tqkhQEr6A5KANIzxAY3bPkB2eXqajnK4HrKoPGYJhRh6ssetN8rmPQRlvKyWLxjlrSy8vYx7
	uw6rXKm8ERBukjkrusRTyLejpOmIHmZGvWTp76WAD2WXLXdz+AdXLiEcLf+DIsrDwfHQQaK1yp+
	gwY/4LBCL637QCIVpixwb6oUXQPLIbO59FK9BdmDo39wOA02LhVeAZ5VSHdZ2bKItl61J/yfJvo
	cwUrWp7XWPmaFoiyJsnRE+fI6etkjUXkK455nOuQmhX6c/BcrNui6AKX0oskkIOyn5ouRxxK0HV
	luyNPFR2GSGJ+QpXMJuonHsurLo1XW834E2VZUA5iXMF2dTXu0u/kTKv9giuqwOHO1Fdn0Kb4tj
	0DvxRUIs9ro6z1cfchCFNTbTJJtE=
X-TMASE-SNAP-Result: 1.821001.0001-0-1-22:0,33:0,34:0-0
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Wed, 15 Nov 2023 08:09:48 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/190559

From: Wang Mingyu <wangmy@fujitsu.com>

Changelog:
==========
DHCP: re-enter DISCOVER phase if server doesn't reply to our REQUEST
privsep: Allow __NR_dup3 syscall as some libc's use that instead of the dup2 dhcpcd uses
dev: Fix an issue where not opening the dev plugin folder if configured returned the wrong fd
privsep: Harden the launcher process detecting daemonisation.
compat: arc4random uses explicit_bzero if available

Signed-off-by: Wang Mingyu <wangmy@fujitsu.com>
---
 .../dhcpcd/{dhcpcd_10.0.4.bb => dhcpcd_10.0.5.bb}               | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)
 rename meta/recipes-connectivity/dhcpcd/{dhcpcd_10.0.4.bb => dhcpcd_10.0.5.bb} (97%)

diff --git a/meta/recipes-connectivity/dhcpcd/dhcpcd_10.0.4.bb b/meta/recipes-connectivity/dhcpcd/dhcpcd_10.0.5.bb
similarity index 97%
rename from meta/recipes-connectivity/dhcpcd/dhcpcd_10.0.4.bb
rename to meta/recipes-connectivity/dhcpcd/dhcpcd_10.0.5.bb
index fbc3e03d2d..c2dee267ba 100644
--- a/meta/recipes-connectivity/dhcpcd/dhcpcd_10.0.4.bb
+++ b/meta/recipes-connectivity/dhcpcd/dhcpcd_10.0.5.bb
@@ -17,7 +17,7 @@ SRC_URI = "git://github.com/NetworkConfiguration/dhcpcd;protocol=https;branch=ma
            file://0001-dhcpcd.8-Fix-conflict-error-when-enable-multilib.patch \
            "
 
-SRCREV = "3cb242656546acfe88f6201f8b3dbe261ffd1a3e"
+SRCREV = "6baf4df467aaae89b026a089122d155c6eec3f19"
 S = "${WORKDIR}/git"
 
 inherit pkgconfig autotools-brokensep systemd useradd
-- 
2.34.1


