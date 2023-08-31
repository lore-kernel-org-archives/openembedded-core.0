Return-Path: <wangmy@fujitsu.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 10DFDC83F26
	for <webhook@archiver.kernel.org>; Thu, 31 Aug 2023 02:53:03 +0000 (UTC)
Received: from esa11.hc1455-7.c3s2.iphmx.com (esa11.hc1455-7.c3s2.iphmx.com [207.54.90.137])
 by mx.groups.io with SMTP id smtpd.web10.8753.1693450376945482756
 for <openembedded-core@lists.openembedded.org>;
 Wed, 30 Aug 2023 19:52:57 -0700
Authentication-Results: mx.groups.io;
 dkim=none (message not signed); spf=pass (domain: fujitsu.com, ip: 207.54.90.137, mailfrom: wangmy@fujitsu.com)
X-IronPort-AV: E=McAfee;i="6600,9927,10818"; a="109452180"
X-IronPort-AV: E=Sophos;i="6.02,215,1688396400"; 
   d="scan'208";a="109452180"
Received: from unknown (HELO oym-r4.gw.nic.fujitsu.com) ([210.162.30.92])
  by esa11.hc1455-7.c3s2.iphmx.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 31 Aug 2023 11:52:55 +0900
Received: from oym-m1.gw.nic.fujitsu.com (oym-nat-oym-m1.gw.nic.fujitsu.com [192.168.87.58])
	by oym-r4.gw.nic.fujitsu.com (Postfix) with ESMTP id BCA16DE574
	for <openembedded-core@lists.openembedded.org>; Thu, 31 Aug 2023 11:52:52 +0900 (JST)
Received: from aks-ab1.gw.nic.fujitsu.com (aks-ab1.gw.nic.fujitsu.com [192.51.207.11])
	by oym-m1.gw.nic.fujitsu.com (Postfix) with ESMTP id 034D0D88CD
	for <openembedded-core@lists.openembedded.org>; Thu, 31 Aug 2023 11:52:52 +0900 (JST)
Received: from localhost.localdomain (unknown [10.167.225.33])
	by aks-ab1.gw.nic.fujitsu.com (Postfix) with ESMTP id 13DDD2FC2743;
	Thu, 31 Aug 2023 11:52:51 +0900 (JST)
From: wangmy@fujitsu.com
To: openembedded-core@lists.openembedded.org
Cc: Wang Mingyu <wangmy@fujitsu.com>
Subject: [OE-core] [PATCH] repo: upgrade 2.35 -> 2.36.1
Date: Thu, 31 Aug 2023 10:52:33 +0800
Message-Id: <1693450353-28532-1-git-send-email-wangmy@fujitsu.com>
X-Mailer: git-send-email 1.8.3.1
X-TM-AS-GCONF: 00
X-TM-AS-Product-Ver: IMSS-9.1.0.1408-9.0.0.1002-27846.004
X-TM-AS-User-Approved-Sender: Yes
X-TMASE-Version: IMSS-9.1.0.1408-9.0.1002-27846.004
X-TMASE-Result: 10-2.776400-10.000000
X-TMASE-MatchedRID: hsQjHHSArR6jz0nOeth/yfx0ykrbAxjCRzUPAqhCjtiO7PyvQAVVyiFL
	Sh+QCTPZIvrftAIhWmLy9zcRSkKatYgrKnsJ1GRgOwpfLMeBwRuC7C2rJeUToWFHVj+6F+rIKsm
	10TThDCJbJcQH3furV3k48PxckV+kHxPMjOKY7A/+HHE8LDNSg8RB0bsfrpPIcSqbxBgG0w6gSX
	SqalbLpF2nSGhmE2++10Z6HC/quOgM4qyBsAhCh/bB2eVurUQwTXYoEfse8lJzb0YzETdWdn2/s
	GuB4cVj4IXCST5cSoSCvqWrFsheUcLe0zBjeZrbFQOP52BRBXJMTsKj18q/fA==
X-TMASE-SNAP-Result: 1.821001.0001-0-1-22:0,33:0,34:0-0
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Thu, 31 Aug 2023 02:53:03 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/186955

From: Wang Mingyu <wangmy@fujitsu.com>

Signed-off-by: Wang Mingyu <wangmy@fujitsu.com>
---
 meta/recipes-devtools/repo/{repo_2.35.bb => repo_2.36.1.bb} | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)
 rename meta/recipes-devtools/repo/{repo_2.35.bb => repo_2.36.1.bb} (95%)

diff --git a/meta/recipes-devtools/repo/repo_2.35.bb b/meta/recipes-devtools/repo/repo_2.36.1.bb
similarity index 95%
rename from meta/recipes-devtools/repo/repo_2.35.bb
rename to meta/recipes-devtools/repo/repo_2.36.1.bb
index d34c3db746..a3b43439f2 100644
--- a/meta/recipes-devtools/repo/repo_2.35.bb
+++ b/meta/recipes-devtools/repo/repo_2.36.1.bb
@@ -12,7 +12,7 @@ LIC_FILES_CHKSUM = "file://LICENSE;md5=3b83ef96387f14655fc854ddc3c6bd57"
 SRC_URI = "git://gerrit.googlesource.com/git-repo.git;protocol=https;branch=main \
            file://0001-python3-shebang.patch \
            "
-SRCREV = "c657844efe40b97700c3654989bdbe3a33e409d7"
+SRCREV = "1e9f7b9e9ef473305d10a26a48138bc6ad38ccf6"
 
 MIRRORS += "git://gerrit.googlesource.com/git-repo.git git://github.com/GerritCodeReview/git-repo.git"
 
-- 
2.34.1


