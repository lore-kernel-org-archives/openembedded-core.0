Return-Path: <wangmy@fujitsu.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 4E8D1C4332F
	for <webhook@archiver.kernel.org>; Thu,  2 Nov 2023 08:20:16 +0000 (UTC)
Received: from esa9.hc1455-7.c3s2.iphmx.com (esa9.hc1455-7.c3s2.iphmx.com [139.138.36.223])
 by mx.groups.io with SMTP id smtpd.web10.26244.1698913208103939406
 for <openembedded-core@lists.openembedded.org>;
 Thu, 02 Nov 2023 01:20:08 -0700
Authentication-Results: mx.groups.io;
 dkim=none (message not signed); spf=pass (domain: fujitsu.com, ip: 139.138.36.223, mailfrom: wangmy@fujitsu.com)
X-IronPort-AV: E=McAfee;i="6600,9927,10881"; a="126722635"
X-IronPort-AV: E=Sophos;i="6.03,270,1694703600"; 
   d="scan'208";a="126722635"
Received: from unknown (HELO oym-r4.gw.nic.fujitsu.com) ([210.162.30.92])
  by esa9.hc1455-7.c3s2.iphmx.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 02 Nov 2023 17:20:05 +0900
Received: from oym-m1.gw.nic.fujitsu.com (oym-nat-oym-m1.gw.nic.fujitsu.com [192.168.87.58])
	by oym-r4.gw.nic.fujitsu.com (Postfix) with ESMTP id 71534D9D8F
	for <openembedded-core@lists.openembedded.org>; Thu,  2 Nov 2023 17:20:03 +0900 (JST)
Received: from aks-ab2.gw.nic.fujitsu.com (aks-ab2.gw.nic.fujitsu.com [192.51.207.12])
	by oym-m1.gw.nic.fujitsu.com (Postfix) with ESMTP id 802C4D88CE
	for <openembedded-core@lists.openembedded.org>; Thu,  2 Nov 2023 17:20:02 +0900 (JST)
Received: from vm4860.g01.fujitsu.local (unknown [10.193.128.79])
	by aks-ab2.gw.nic.fujitsu.com (Postfix) with ESMTP id 2236F886FC;
	Thu,  2 Nov 2023 17:19:57 +0900 (JST)
From: wangmy@fujitsu.com
To: openembedded-core@lists.openembedded.org
Cc: Wang Mingyu <wangmy@fujitsu.com>
Subject: [OE-core] [PATCH] cronie: upgrade 1.6.1 -> 1.7.0
Date: Thu,  2 Nov 2023 16:17:52 +0800
Message-Id: <1698913076-22037-3-git-send-email-wangmy@fujitsu.com>
X-Mailer: git-send-email 1.8.3.1
In-Reply-To: <1698913076-22037-1-git-send-email-wangmy@fujitsu.com>
References: <1698913076-22037-1-git-send-email-wangmy@fujitsu.com>
X-TM-AS-GCONF: 00
X-TM-AS-Product-Ver: IMSS-9.1.0.1408-9.0.0.1002-27972.006
X-TM-AS-User-Approved-Sender: Yes
X-TMASE-Version: IMSS-9.1.0.1408-9.0.1002-27972.006
X-TMASE-Result: 10--4.810900-10.000000
X-TMASE-MatchedRID: EzAtoNUuirijz0nOeth/yUIIxwDaU5mrF4r8H5YrEqymjKAHV+5JDWUP
	TgoYZwKhtQTfQKYWqkHU0dvNBvLe++1a16oqp8B1/HTKStsDGMJHNQ8CqEKO2MC5DTEMxpeQRBg
	61kSK4Dg/jpOn/YFJRV4BmkmVfdy3oapVQ0HiWx/qcdt4G7kueeEpCHUsKYYGULHdr+lZw9qem2
	vw+cenKeLzNWBegCW24nmFeyfGnuMLbigRnpKlKZx+7GyJjhAUWfVmyUl4HELYJcydoPdNZvVuX
	2KsDhYbx143evxDNQdDMDMG9zYrPYHU3QTkHl58cpoLHffA8vXh8nEUv+zwELT7L24bJZR97H2f
	VekOqwmYL1KImKhq1ZuOe7yPCBvAf2OJxbAVgHQ+kK598Yf3Mg==
X-TMASE-SNAP-Result: 1.821001.0001-0-1-22:0,33:0,34:0-0
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Thu, 02 Nov 2023 08:20:16 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/190062

From: Wang Mingyu <wangmy@fujitsu.com>

Changelog:
=============
* anacron: Add support for NO_MAIL_OUTPUT environment variable
* anacron: Support enabling anacron jobs on battery power
* crond: Support -n crontab entry option to disable mailing the output
* crontab: Make a backup of the crontab file on edition and deletion

Signed-off-by: Wang Mingyu <wangmy@fujitsu.com>
---
 .../cronie/{cronie_1.6.1.bb => cronie_1.7.0.bb}                 | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)
 rename meta/recipes-extended/cronie/{cronie_1.6.1.bb => cronie_1.7.0.bb} (97%)

diff --git a/meta/recipes-extended/cronie/cronie_1.6.1.bb b/meta/recipes-extended/cronie/cronie_1.7.0.bb
similarity index 97%
rename from meta/recipes-extended/cronie/cronie_1.6.1.bb
rename to meta/recipes-extended/cronie/cronie_1.7.0.bb
index 1b31bf0db2..24c419b1c5 100644
--- a/meta/recipes-extended/cronie/cronie_1.6.1.bb
+++ b/meta/recipes-extended/cronie/cronie_1.7.0.bb
@@ -25,7 +25,7 @@ SRC_URI = "${GITHUB_BASE_URI}/download/cronie-${PV}/cronie-${PV}.tar.gz \
 PAM_SRC_URI = "file://crond_pam_config.patch"
 PAM_DEPS = "libpam libpam-runtime pam-plugin-access pam-plugin-loginuid"
 
-SRC_URI[sha256sum] = "2cd0f0dd1680e6b9c39bf1e3a5e7ad6df76aa940de1ee90a453633aa59984e62"
+SRC_URI[sha256sum] = "6827f5a47760cc64afeef0a60d3cb5376f52569109fc9a73957dd5e9fdae7619"
 
 inherit autotools update-rc.d useradd systemd github-releases
 UPSTREAM_CHECK_REGEX = "releases/tag/cronie-(?P<pver>\d+(\.\d+)+)"
-- 
2.34.1


