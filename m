Return-Path: <wangmy@fujitsu.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 76BFEC7EE29
	for <webhook@archiver.kernel.org>; Thu,  1 Jun 2023 09:04:08 +0000 (UTC)
Received: from esa2.hc1455-7.c3s2.iphmx.com (esa2.hc1455-7.c3s2.iphmx.com [207.54.90.48])
 by mx.groups.io with SMTP id smtpd.web10.26241.1685610238393525359
 for <openembedded-core@lists.openembedded.org>;
 Thu, 01 Jun 2023 02:03:58 -0700
Authentication-Results: mx.groups.io;
 dkim=missing; spf=pass (domain: fujitsu.com, ip: 207.54.90.48, mailfrom: wangmy@fujitsu.com)
X-IronPort-AV: E=McAfee;i="6600,9927,10727"; a="119084613"
X-IronPort-AV: E=Sophos;i="6.00,209,1681138800"; 
   d="scan'208";a="119084613"
Received: from unknown (HELO oym-r2.gw.nic.fujitsu.com) ([210.162.30.90])
  by esa2.hc1455-7.c3s2.iphmx.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 01 Jun 2023 18:03:56 +0900
Received: from oym-m4.gw.nic.fujitsu.com (oym-nat-oym-m4.gw.nic.fujitsu.com [192.168.87.61])
	by oym-r2.gw.nic.fujitsu.com (Postfix) with ESMTP id 0C0FBCD7E1
	for <openembedded-core@lists.openembedded.org>; Thu,  1 Jun 2023 18:03:54 +0900 (JST)
Received: from aks-ab2.gw.nic.fujitsu.com (aks-ab2.gw.nic.fujitsu.com [192.51.207.12])
	by oym-m4.gw.nic.fujitsu.com (Postfix) with ESMTP id 06C13D5400
	for <openembedded-core@lists.openembedded.org>; Thu,  1 Jun 2023 18:03:53 +0900 (JST)
Received: from localhost.localdomain (unknown [10.167.225.33])
	by aks-ab2.gw.nic.fujitsu.com (Postfix) with ESMTP id 2C40B88864;
	Thu,  1 Jun 2023 18:03:52 +0900 (JST)
From: wangmy@fujitsu.com
To: openembedded-core@lists.openembedded.org
Cc: Wang Mingyu <wangmy@fujitsu.com>
Subject: [OE-core] [PATCH] libdnf: upgrade 0.70.0 -> 0.70.1
Date: Thu,  1 Jun 2023 17:03:12 +0800
Message-Id: <1685610221-29015-6-git-send-email-wangmy@fujitsu.com>
X-Mailer: git-send-email 1.8.3.1
In-Reply-To: <1685610221-29015-1-git-send-email-wangmy@fujitsu.com>
References: <1685610221-29015-1-git-send-email-wangmy@fujitsu.com>
X-TM-AS-GCONF: 00
X-TM-AS-Product-Ver: IMSS-9.1.0.1408-9.0.0.1002-27664.006
X-TM-AS-User-Approved-Sender: Yes
X-TMASE-Version: IMSS-9.1.0.1408-9.0.1002-27664.006
X-TMASE-Result: 10-2.037700-10.000000
X-TMASE-MatchedRID: R9NZgeCyXhKjz0nOeth/yUIIxwDaU5mrF4r8H5YrEqySDKqq2RS1JW8q
	nFk+BWUX7urb2kmMcHQNyr61Mu6ROm0Xr+fj3ww/8t4fUUGeErTBOVz0Jwcxl76S7Hfu9IUxYNt
	QBww5RnSkxJuVk5oxMrc/ZCLk5AauuJXEeLLJ6+yeAiCmPx4NwGmRqNBHmBveVDC1CbuJXmMqtq
	5d3cxkNe5+4KX96PVE76mw4lz2bnzBIB+03PMaCz5ZDW1BPxdGeOYVOTf6JiJbzk97m7a/BzCkX
	J0qdd6q6PcGL0lUOoUDQLXqtORcA/zs1/e9oUcoU8mdcvbI1h2S6jzjuXTm0MTMzICazP4UehYt
	aVdyxm8=
X-TMASE-SNAP-Result: 1.821001.0001-0-1-22:0,33:0,34:0-0
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Thu, 01 Jun 2023 09:04:08 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/182062

From: Wang Mingyu <wangmy@fujitsu.com>

Changelog:
==========
 Add repoid to solver errors for RPMs (RhBug:2179413)
 Avoid using obsolete RPM API and drop redundant calls
 Remove DNF from list of protected packages

Signed-off-by: Wang Mingyu <wangmy@fujitsu.com>
---
 .../libdnf/{libdnf_0.70.0.bb => libdnf_0.70.1.bb}               | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)
 rename meta/recipes-devtools/libdnf/{libdnf_0.70.0.bb => libdnf_0.70.1.bb} (97%)

diff --git a/meta/recipes-devtools/libdnf/libdnf_0.70.0.bb b/meta/recipes-devtools/libdnf/libdnf_0.70.1.bb
similarity index 97%
rename from meta/recipes-devtools/libdnf/libdnf_0.70.0.bb
rename to meta/recipes-devtools/libdnf/libdnf_0.70.1.bb
index 14d6a37de1..c44ae2729b 100644
--- a/meta/recipes-devtools/libdnf/libdnf_0.70.0.bb
+++ b/meta/recipes-devtools/libdnf/libdnf_0.70.1.bb
@@ -12,7 +12,7 @@ SRC_URI = "git://github.com/rpm-software-management/libdnf;branch=dnf-4-master;p
            file://0001-drop-FindPythonInstDir.cmake.patch \
            "
 
-SRCREV = "93759bc5cac262906e52b6a173d7b157914ec29e"
+SRCREV = "3b8e59ad8ed3a3eb736d8a2e16b4fc04313d1f12"
 UPSTREAM_CHECK_GITTAGREGEX = "(?P<pver>(?!4\.90)\d+(\.\d+)+)"
 
 S = "${WORKDIR}/git"
-- 
2.34.1


