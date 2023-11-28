Return-Path: <wangmy@fujitsu.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 19C5CC4167B
	for <webhook@archiver.kernel.org>; Tue, 28 Nov 2023 23:38:28 +0000 (UTC)
Received: from esa12.hc1455-7.c3s2.iphmx.com (esa12.hc1455-7.c3s2.iphmx.com [139.138.37.100])
 by mx.groups.io with SMTP id smtpd.web11.14453.1701214703127640641
 for <openembedded-core@lists.openembedded.org>;
 Tue, 28 Nov 2023 15:38:23 -0800
Authentication-Results: mx.groups.io;
 dkim=none (message not signed); spf=pass (domain: fujitsu.com, ip: 139.138.37.100, mailfrom: wangmy@fujitsu.com)
X-IronPort-AV: E=McAfee;i="6600,9927,10908"; a="120655106"
X-IronPort-AV: E=Sophos;i="6.04,234,1695654000"; 
   d="scan'208";a="120655106"
Received: from unknown (HELO oym-r1.gw.nic.fujitsu.com) ([210.162.30.89])
  by esa12.hc1455-7.c3s2.iphmx.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 29 Nov 2023 08:38:20 +0900
Received: from oym-m2.gw.nic.fujitsu.com (oym-nat-oym-m2.gw.nic.fujitsu.com [192.168.87.59])
	by oym-r1.gw.nic.fujitsu.com (Postfix) with ESMTP id 29596C1601
	for <openembedded-core@lists.openembedded.org>; Wed, 29 Nov 2023 08:38:18 +0900 (JST)
Received: from aks-ab2.gw.nic.fujitsu.com (aks-ab2.gw.nic.fujitsu.com [192.51.207.12])
	by oym-m2.gw.nic.fujitsu.com (Postfix) with ESMTP id 53FC3BF4A2
	for <openembedded-core@lists.openembedded.org>; Wed, 29 Nov 2023 08:38:17 +0900 (JST)
Received: from vm4860.g01.fujitsu.local (unknown [10.193.128.149])
	by aks-ab2.gw.nic.fujitsu.com (Postfix) with ESMTP id 5322686D02;
	Wed, 29 Nov 2023 08:38:16 +0900 (JST)
From: wangmy@fujitsu.com
To: openembedded-core@lists.openembedded.org
Cc: Wang Mingyu <wangmy@fujitsu.com>
Subject: [OE-core] [PATCH] init-system-helpers: upgrade 1.65.2 -> 1.66
Date: Wed, 29 Nov 2023 07:37:41 +0800
Message-Id: <1701214661-1605-1-git-send-email-wangmy@fujitsu.com>
X-Mailer: git-send-email 1.8.3.1
X-TM-AS-GCONF: 00
X-TM-AS-Product-Ver: IMSS-9.1.0.1408-9.0.0.1002-28026.003
X-TM-AS-User-Approved-Sender: Yes
X-TMASE-Version: IMSS-9.1.0.1408-9.0.1002-28026.003
X-TMASE-Result: 10--5.635600-10.000000
X-TMASE-MatchedRID: QR1SVCCbVGSjz0nOeth/yUIIxwDaU5mrYjDXdM/x2VMqmYXEWNBfAIY+
	d4I4WCpEmC+wH+KoDcp7FWSB9R8U0zWs2YGWPbxrPhFt09Ma7vz5UnqVnIHSz6vzNrQ252zbvqn
	FtM6Nq/L7tBxFpWhrycYoh/qEF/tVoYY7KoErjW8ReM8i8p3vgK7YaZ2V2aJQRWVLkWTVcnR5Wz
	SyTIRpLYGQRIwjTl3ioe/KDVmzFN+XC3sMAGu+n3V7tdtvoibaVeAZ5VSHdZ2bKItl61J/yZ+in
	TK0bC9eKrauXd3MZDWZTpnovrNZlHn9M2z4SppwE+N/gYw8cKTjT3Dpu8piKuyOrxU+Wlm5
X-TMASE-SNAP-Result: 1.821001.0001-0-1-22:0,33:0,34:0-0
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Tue, 28 Nov 2023 23:38:28 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/191412

From: Wang Mingyu <wangmy@fujitsu.com>

Changelog:
==========
* d/init.lintian-overrides: Silence warning about "Important" field
  'Important: yes' instructs APT to warn the user before removing this
  package.
* script/update-rc.d: DPKG_ROOT support for sysvinit
* Add "Protected: yes" to package "init" The "Protected" field does the
  same as "Important" already did in apt, but is also understood by dpkg
  (since dpkg 1.20.1).
* Bump Standards-Version to 4.6.2, no changes
* Override Lintian warning for Protected: yes
* deb-systemd-invoke: support reload/reexec. This is useful for the
  --user case, to provide a shortcut that loops over all active user
  sessions over D-Bus.
* deb-systemd-invoke: support --no-dbus for reload/reexec. Provide
  common implementation for SIGHUP/SIGRTMIN+25 to reload/reexec the
  system or user instances.

Signed-off-by: Wang Mingyu <wangmy@fujitsu.com>
---
 ...nit-system-helpers_1.65.2.bb => init-system-helpers_1.66.bb} | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)
 rename meta/recipes-core/initscripts/{init-system-helpers_1.65.2.bb => init-system-helpers_1.66.bb} (96%)

diff --git a/meta/recipes-core/initscripts/init-system-helpers_1.65.2.bb b/meta/recipes-core/initscripts/init-system-helpers_1.66.bb
similarity index 96%
rename from meta/recipes-core/initscripts/init-system-helpers_1.65.2.bb
rename to meta/recipes-core/initscripts/init-system-helpers_1.66.bb
index 1fc23acb74..64e08aae68 100644
--- a/meta/recipes-core/initscripts/init-system-helpers_1.65.2.bb
+++ b/meta/recipes-core/initscripts/init-system-helpers_1.66.bb
@@ -16,7 +16,7 @@ SECTION = "base"
 LICENSE = "BSD-3-Clause & GPL-2.0-only"
 LIC_FILES_CHKSUM = "file://debian/copyright;md5=c4ec20aa158fa9de26ee1accf78dcaae"
 
-SRCREV = "2f446b69db728b2bda68270a9b81de88102e1fdd"
+SRCREV = "a5439f465dc1d1d4e12329208dc321fb806009f4"
 SRC_URI = "git://salsa.debian.org/debian/init-system-helpers.git;protocol=https;branch=master"
 UPSTREAM_CHECK_GITTAGREGEX = "(?P<pver>(\d+(\.\d+)+))(?!_exp)"
 
-- 
2.34.1


