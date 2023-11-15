Return-Path: <wangmy@fujitsu.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 55471C07548
	for <webhook@archiver.kernel.org>; Wed, 15 Nov 2023 08:31:48 +0000 (UTC)
Received: from esa6.hc1455-7.c3s2.iphmx.com (esa6.hc1455-7.c3s2.iphmx.com [68.232.139.139])
 by mx.groups.io with SMTP id smtpd.web11.8819.1700037102571842489
 for <openembedded-core@lists.openembedded.org>;
 Wed, 15 Nov 2023 00:31:43 -0800
Authentication-Results: mx.groups.io;
 dkim=none (message not signed); spf=pass (domain: fujitsu.com, ip: 68.232.139.139, mailfrom: wangmy@fujitsu.com)
X-IronPort-AV: E=McAfee;i="6600,9927,10894"; a="141265677"
X-IronPort-AV: E=Sophos;i="6.03,304,1694703600"; 
   d="scan'208";a="141265677"
Received: from unknown (HELO yto-r4.gw.nic.fujitsu.com) ([218.44.52.220])
  by esa6.hc1455-7.c3s2.iphmx.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 15 Nov 2023 17:31:40 +0900
Received: from yto-m3.gw.nic.fujitsu.com (yto-nat-yto-m3.gw.nic.fujitsu.com [192.168.83.66])
	by yto-r4.gw.nic.fujitsu.com (Postfix) with ESMTP id F0B78D772A
	for <openembedded-core@lists.openembedded.org>; Wed, 15 Nov 2023 17:31:37 +0900 (JST)
Received: from kws-ab3.gw.nic.fujitsu.com (kws-ab3.gw.nic.fujitsu.com [192.51.206.21])
	by yto-m3.gw.nic.fujitsu.com (Postfix) with ESMTP id 464CFF92D
	for <openembedded-core@lists.openembedded.org>; Wed, 15 Nov 2023 17:31:37 +0900 (JST)
Received: from vm4860.g01.fujitsu.local (unknown [10.193.128.79])
	by kws-ab3.gw.nic.fujitsu.com (Postfix) with ESMTP id 7DE2020050199;
	Wed, 15 Nov 2023 17:31:36 +0900 (JST)
From: wangmy@fujitsu.com
To: openembedded-core@lists.openembedded.org
Cc: Wang Mingyu <wangmy@fujitsu.com>
Subject: [OE-core] [PATCH] dnf: upgrade 4.17.0 -> 4.18.1
Date: Wed, 15 Nov 2023 16:30:35 +0800
Message-Id: <1700037035-1424-1-git-send-email-wangmy@fujitsu.com>
X-Mailer: git-send-email 1.8.3.1
X-TM-AS-GCONF: 00
X-TM-AS-Product-Ver: IMSS-9.1.0.1417-9.0.0.1002-27998.006
X-TM-AS-User-Approved-Sender: Yes
X-TMASE-Version: IMSS-9.1.0.1417-9.0.1002-27998.006
X-TMASE-Result: 10--3.639000-10.000000
X-TMASE-MatchedRID: EzAtoNUuirijz0nOeth/yUIIxwDaU5mrTfK5j0EZbysYdZqQlzVQvKQt
	HlwwSfPRIo6JXsGKNOnFOr5lVdtXOFpCIuRr0RxKP0HVIeixJdDBOVz0Jwcxl6vCrG0TnfVUT85
	+SH/4AviUL8qmR/SJ58uO56bqT71TJiFLMSoR+9w6N/cDgNNi4eEpCHUsKYYGULHdr+lZw9qem2
	vw+cenKeLzNWBegCW2vyFZ3iUCwWULbigRnpKlKZx+7GyJjhAURyYNqflY6JuMn7lejJYSaMO+j
	JupKV7OCgJAPkY77VF6kYei7ch3IBz660u+TrYvrP2nuTDq4O47dK5TiU5+2q65WqLbYJBm7H2f
	VekOqwmYL1KImKhq1ZuOe7yPCBvAf2OJxbAVgHQ+kK598Yf3Mg==
X-TMASE-SNAP-Result: 1.821001.0001-0-1-22:0,33:0,34:0-0
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Wed, 15 Nov 2023 08:31:48 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/190568

From: Wang Mingyu <wangmy@fujitsu.com>

Changelog:
==========
automatic: Fix applying the color option
repoquery: Do not translate time format strings (RhBz: 2245773)

Signed-off-by: Wang Mingyu <wangmy@fujitsu.com>
---
 meta/recipes-devtools/dnf/{dnf_4.17.0.bb => dnf_4.18.1.bb} | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)
 rename meta/recipes-devtools/dnf/{dnf_4.17.0.bb => dnf_4.18.1.bb} (98%)

diff --git a/meta/recipes-devtools/dnf/dnf_4.17.0.bb b/meta/recipes-devtools/dnf/dnf_4.18.1.bb
similarity index 98%
rename from meta/recipes-devtools/dnf/dnf_4.17.0.bb
rename to meta/recipes-devtools/dnf/dnf_4.18.1.bb
index ec4e48d68b..f60b4794a6 100644
--- a/meta/recipes-devtools/dnf/dnf_4.17.0.bb
+++ b/meta/recipes-devtools/dnf/dnf_4.18.1.bb
@@ -19,7 +19,7 @@ SRC_URI = "git://github.com/rpm-software-management/dnf.git;branch=master;protoc
 
 SRC_URI:append:class-native = "file://0001-dnf-write-the-log-lock-to-root.patch"
 
-SRCREV = "a31687c169095de1acb5c0a3762bf78993661776"
+SRCREV = "41a287e2bd60b4d1100c329a274776ff32ba8740"
 UPSTREAM_CHECK_GITTAGREGEX = "(?P<pver>\d+(\.\d+)+)"
 
 S = "${WORKDIR}/git"
-- 
2.34.1


