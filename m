Return-Path: <wangmy@fujitsu.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 0C221C41513
	for <webhook@archiver.kernel.org>; Mon, 16 Oct 2023 08:32:49 +0000 (UTC)
Received: from esa8.hc1455-7.c3s2.iphmx.com (esa8.hc1455-7.c3s2.iphmx.com [139.138.61.253])
 by mx.groups.io with SMTP id smtpd.web11.113044.1697445165715937796
 for <openembedded-core@lists.openembedded.org>;
 Mon, 16 Oct 2023 01:32:46 -0700
Authentication-Results: mx.groups.io;
 dkim=none (message not signed); spf=pass (domain: fujitsu.com, ip: 139.138.61.253, mailfrom: wangmy@fujitsu.com)
X-IronPort-AV: E=McAfee;i="6600,9927,10863"; a="124280663"
X-IronPort-AV: E=Sophos;i="6.03,228,1694703600"; 
   d="scan'208";a="124280663"
Received: from unknown (HELO yto-r3.gw.nic.fujitsu.com) ([218.44.52.219])
  by esa8.hc1455-7.c3s2.iphmx.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 16 Oct 2023 17:32:43 +0900
Received: from yto-m4.gw.nic.fujitsu.com (yto-nat-yto-m4.gw.nic.fujitsu.com [192.168.83.67])
	by yto-r3.gw.nic.fujitsu.com (Postfix) with ESMTP id 2A15AD4F5B
	for <openembedded-core@lists.openembedded.org>; Mon, 16 Oct 2023 17:32:41 +0900 (JST)
Received: from aks-ab1.gw.nic.fujitsu.com (aks-ab1.gw.nic.fujitsu.com [192.51.207.11])
	by yto-m4.gw.nic.fujitsu.com (Postfix) with ESMTP id 70EEFD5040
	for <openembedded-core@lists.openembedded.org>; Mon, 16 Oct 2023 17:32:40 +0900 (JST)
Received: from vm4860.g01.fujitsu.local (unknown [10.193.128.52])
	by aks-ab1.gw.nic.fujitsu.com (Postfix) with ESMTP id 5A7B02FC8401;
	Mon, 16 Oct 2023 17:32:39 +0900 (JST)
From: wangmy@fujitsu.com
To: openembedded-core@lists.openembedded.org
Cc: Wang Mingyu <wangmy@fujitsu.com>
Subject: [OE-core] [PATCH] repo: upgrade 2.36.1 -> 2.37
Date: Mon, 16 Oct 2023 16:32:31 +0800
Message-Id: <1697445151-29771-1-git-send-email-wangmy@fujitsu.com>
X-Mailer: git-send-email 1.8.3.1
X-TM-AS-GCONF: 00
X-TM-AS-Product-Ver: IMSS-9.1.0.1408-9.0.0.1002-27938.006
X-TM-AS-User-Approved-Sender: Yes
X-TMASE-Version: IMSS-9.1.0.1408-9.0.1002-27938.006
X-TMASE-Result: 10-2.776400-10.000000
X-TMASE-MatchedRID: hsQjHHSArR6jz0nOeth/yfx0ykrbAxjCRzUPAqhCjtiO7PyvQAVVyiFL
	Sh+QCTPZIvrftAIhWmLy9zcRSkKatYgrKnsJ1GRgOwpfLMeBwRuC7C2rJeUToWFHVj+6F+rIKsm
	10TThDCJbJcQH3furV3k48PxckV+kHxPMjOKY7A/+HHE8LDNSg8RB0bsfrpPIcSqbxBgG0w4GC8
	0u3So0WswRkoAk1O2+52X9JzD2ZFBlO1TsYpmKcpsjZ0mcj7YTlBVqp0Pd9s6u+/Y/Wq1b6kte8
	qrQu73n3/fdCgayGPyCvqWrFsheUcLe0zBjeZrbFQOP52BRBXJMTsKj18q/fA==
X-TMASE-SNAP-Result: 1.821001.0001-0-1-22:0,33:0,34:0-0
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Mon, 16 Oct 2023 08:32:49 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/189275

From: Wang Mingyu <wangmy@fujitsu.com>

Signed-off-by: Wang Mingyu <wangmy@fujitsu.com>
---
 meta/recipes-devtools/repo/{repo_2.36.1.bb => repo_2.37.bb} | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)
 rename meta/recipes-devtools/repo/{repo_2.36.1.bb => repo_2.37.bb} (95%)

diff --git a/meta/recipes-devtools/repo/repo_2.36.1.bb b/meta/recipes-devtools/repo/repo_2.37.bb
similarity index 95%
rename from meta/recipes-devtools/repo/repo_2.36.1.bb
rename to meta/recipes-devtools/repo/repo_2.37.bb
index a3b43439f2..d6d3d03a62 100644
--- a/meta/recipes-devtools/repo/repo_2.36.1.bb
+++ b/meta/recipes-devtools/repo/repo_2.37.bb
@@ -12,7 +12,7 @@ LIC_FILES_CHKSUM = "file://LICENSE;md5=3b83ef96387f14655fc854ddc3c6bd57"
 SRC_URI = "git://gerrit.googlesource.com/git-repo.git;protocol=https;branch=main \
            file://0001-python3-shebang.patch \
            "
-SRCREV = "1e9f7b9e9ef473305d10a26a48138bc6ad38ccf6"
+SRCREV = "83c66ec661e39e47795086a5d26d0f3782ac1d49"
 
 MIRRORS += "git://gerrit.googlesource.com/git-repo.git git://github.com/GerritCodeReview/git-repo.git"
 
-- 
2.34.1


