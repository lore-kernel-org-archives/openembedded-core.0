Return-Path: <wangmy@fujitsu.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 3B56FC04FDF
	for <webhook@archiver.kernel.org>; Tue,  1 Aug 2023 07:41:48 +0000 (UTC)
Received: from esa4.hc1455-7.c3s2.iphmx.com (esa4.hc1455-7.c3s2.iphmx.com [68.232.139.117])
 by mx.groups.io with SMTP id smtpd.web11.7590.1690875704017811941
 for <openembedded-core@lists.openembedded.org>;
 Tue, 01 Aug 2023 00:41:44 -0700
Authentication-Results: mx.groups.io;
 dkim=none (message not signed); spf=pass (domain: fujitsu.com, ip: 68.232.139.117, mailfrom: wangmy@fujitsu.com)
X-IronPort-AV: E=McAfee;i="6600,9927,10788"; a="126655413"
X-IronPort-AV: E=Sophos;i="6.01,246,1684767600"; 
   d="scan'208";a="126655413"
Received: from unknown (HELO yto-r3.gw.nic.fujitsu.com) ([218.44.52.219])
  by esa4.hc1455-7.c3s2.iphmx.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 01 Aug 2023 16:41:41 +0900
Received: from yto-m1.gw.nic.fujitsu.com (yto-nat-yto-m1.gw.nic.fujitsu.com [192.168.83.64])
	by yto-r3.gw.nic.fujitsu.com (Postfix) with ESMTP id 7D750D500B
	for <openembedded-core@lists.openembedded.org>; Tue,  1 Aug 2023 16:41:39 +0900 (JST)
Received: from aks-ab1.gw.nic.fujitsu.com (aks-ab1.gw.nic.fujitsu.com [192.51.207.11])
	by yto-m1.gw.nic.fujitsu.com (Postfix) with ESMTP id B70D0CF7D1
	for <openembedded-core@lists.openembedded.org>; Tue,  1 Aug 2023 16:41:38 +0900 (JST)
Received: from localhost.localdomain (unknown [10.167.225.33])
	by aks-ab1.gw.nic.fujitsu.com (Postfix) with ESMTP id DD87E2FC8177;
	Tue,  1 Aug 2023 16:41:37 +0900 (JST)
From: wangmy@fujitsu.com
To: openembedded-core@lists.openembedded.org
Cc: Wang Mingyu <wangmy@fujitsu.com>
Subject: [OE-core] [PATCH] file: upgrade 5.44 -> 5.45
Date: Tue,  1 Aug 2023 15:41:13 +0800
Message-Id: <1690875687-21573-3-git-send-email-wangmy@fujitsu.com>
X-Mailer: git-send-email 1.8.3.1
In-Reply-To: <1690875687-21573-1-git-send-email-wangmy@fujitsu.com>
References: <1690875687-21573-1-git-send-email-wangmy@fujitsu.com>
X-TM-AS-GCONF: 00
X-TM-AS-Product-Ver: IMSS-9.1.0.1408-9.0.0.1002-27786.005
X-TM-AS-User-Approved-Sender: Yes
X-TMASE-Version: IMSS-9.1.0.1408-9.0.1002-27786.005
X-TMASE-Result: 10--6.562200-10.000000
X-TMASE-MatchedRID: /gZnudouedqjz0nOeth/yUIIxwDaU5mrg55m5RSwLMLk6Qbi+9i6DxqG
	c7het5hmufSUvRHrwTMJSf4nh0R0p0abKAwppBdS8Jb881FGn9lN8rmPQRlvK7Kw8Hx0EGitgg8
	W5tsFXIChOywUZIftbeaffHI8kAmiHY/bzRmIaZGzRPQ8T4oe5Q1Uei1O+6/rwSC6qIZ5nkmjxY
	yRBa/qJXcsDK2xBHh7jaPj0W1qn0Q7AFczfjr/7Et/i4X6qNt7G/0KTlbvGxdf9XAEUVOVZjfyz
	TBLCywg4ZpOyLABm5g=
X-TMASE-SNAP-Result: 1.821001.0001-0-1-22:0,33:0,34:0-0
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Tue, 01 Aug 2023 07:41:48 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/185196

From: Wang Mingyu <wangmy@fujitsu.com>

Changelog:
==========
-PR/465: psrok1: Avoid muslc asctime_r crash
-add SIMH tape format support
-bump the max size of the elf section notes to be read to 128K
 and make it configurable
-PR/415: Fix decompression with program returning empty
-PR/408: fix -p with seccomp
-PR/412: fix MinGW compilation

Signed-off-by: Wang Mingyu <wangmy@fujitsu.com>
---
 meta/recipes-devtools/file/{file_5.44.bb => file_5.45.bb} | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)
 rename meta/recipes-devtools/file/{file_5.44.bb => file_5.45.bb} (97%)

diff --git a/meta/recipes-devtools/file/file_5.44.bb b/meta/recipes-devtools/file/file_5.45.bb
similarity index 97%
rename from meta/recipes-devtools/file/file_5.44.bb
rename to meta/recipes-devtools/file/file_5.45.bb
index 3ce266475b..a7127023cb 100644
--- a/meta/recipes-devtools/file/file_5.44.bb
+++ b/meta/recipes-devtools/file/file_5.45.bb
@@ -13,7 +13,7 @@ DEPENDS:class-native = "bzip2-replacement-native"
 
 SRC_URI = "git://github.com/file/file.git;branch=master;protocol=https"
 
-SRCREV = "b92eed41b1bc0739c5c5d70c444e0c574429321b"
+SRCREV = "4cbd5c8f0851201d203755b76cb66ba991ffd8be"
 S = "${WORKDIR}/git"
 
 inherit autotools update-alternatives
-- 
2.34.1


