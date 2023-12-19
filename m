Return-Path: <wangmy@fujitsu.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 8CFB8C41535
	for <webhook@archiver.kernel.org>; Tue, 19 Dec 2023 10:02:08 +0000 (UTC)
Received: from esa9.hc1455-7.c3s2.iphmx.com (esa9.hc1455-7.c3s2.iphmx.com [139.138.36.223])
 by mx.groups.io with SMTP id smtpd.web11.9031.1702980127555069461
 for <openembedded-core@lists.openembedded.org>;
 Tue, 19 Dec 2023 02:02:07 -0800
Authentication-Results: mx.groups.io;
 dkim=none (message not signed); spf=pass (domain: fujitsu.com, ip: 139.138.36.223, mailfrom: wangmy@fujitsu.com)
X-IronPort-AV: E=McAfee;i="6600,9927,10928"; a="132305271"
X-IronPort-AV: E=Sophos;i="6.04,287,1695654000"; 
   d="scan'208";a="132305271"
Received: from unknown (HELO oym-r2.gw.nic.fujitsu.com) ([210.162.30.90])
  by esa9.hc1455-7.c3s2.iphmx.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 19 Dec 2023 19:02:05 +0900
Received: from oym-m1.gw.nic.fujitsu.com (oym-nat-oym-m1.gw.nic.fujitsu.com [192.168.87.58])
	by oym-r2.gw.nic.fujitsu.com (Postfix) with ESMTP id 465B7D7AE4
	for <openembedded-core@lists.openembedded.org>; Tue, 19 Dec 2023 19:02:03 +0900 (JST)
Received: from kws-ab3.gw.nic.fujitsu.com (kws-ab3.gw.nic.fujitsu.com [192.51.206.21])
	by oym-m1.gw.nic.fujitsu.com (Postfix) with ESMTP id 7F0B3D4F61
	for <openembedded-core@lists.openembedded.org>; Tue, 19 Dec 2023 19:02:02 +0900 (JST)
Received: from edo.cn.fujitsu.com (edo.cn.fujitsu.com [10.167.33.5])
	by kws-ab3.gw.nic.fujitsu.com (Postfix) with ESMTP id 0950A202D20EC
	for <openembedded-core@lists.openembedded.org>; Tue, 19 Dec 2023 19:02:02 +0900 (JST)
Received: from vm4860.g01.fujitsu.local (unknown [10.167.225.33])
	by edo.cn.fujitsu.com (Postfix) with ESMTP id B84781A006F;
	Tue, 19 Dec 2023 18:02:01 +0800 (CST)
From: wangmy@fujitsu.com
To: openembedded-core@lists.openembedded.org
Cc: Wang Mingyu <wangmy@fujitsu.com>
Subject: [OE-core] [PATCH] python3-pytest-runner: upgrade 6.0.0 -> 6.0.1
Date: Tue, 19 Dec 2023 18:01:29 +0800
Message-Id: <1702980089-8511-1-git-send-email-wangmy@fujitsu.com>
X-Mailer: git-send-email 1.8.3.1
X-TM-AS-GCONF: 00
X-TM-AS-Product-Ver: IMSS-9.1.0.1417-9.0.0.1002-28066.006
X-TM-AS-User-Approved-Sender: Yes
X-TMASE-Version: IMSS-9.1.0.1417-9.0.1002-28066.006
X-TMASE-Result: 10-3.526700-10.000000
X-TMASE-MatchedRID: wgzGQ0X+yFqjz0nOeth/yUIIxwDaU5mrK2GKtdiFmTnGsuYyb68ajFQ8
	6S16Ky1T4CtjYmQpb2kF1Ec/oUIRlVpCIuRr0RxKTuctSpiuWyUUi4Ehat054xHfiujuTbed1vZ
	7s3YIVDJ6eUBjjG/BIC5rYfHE0OO95UcZtwNsCroURSScn+QSXmVV1G+Ck2l7+gtHj7OwNO2W79
	Uq8KMo9fd26HxKlNrgNTX8+hR73cLyazBRyqEBPoX8rQajUaMODMHZFCnY0Wahve9GGlRzy0YQA
	vYi+TRG4rRzbj/qpiz1JC0ZxywSNPIMFg0InOPqz5gAnmajvOU4qCidlj1MUy0uABDi47cA
X-TMASE-SNAP-Result: 1.821001.0001-0-1-22:0,33:0,34:0-0
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Tue, 19 Dec 2023 10:02:08 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/192717

From: Wang Mingyu <wangmy@fujitsu.com>

Changelog:
 Updated Trove classifier to indicate this project is inactive.

Signed-off-by: Wang Mingyu <wangmy@fujitsu.com>
---
 ...n3-pytest-runner_6.0.0.bb => python3-pytest-runner_6.0.1.bb} | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)
 rename meta/recipes-devtools/python/{python3-pytest-runner_6.0.0.bb => python3-pytest-runner_6.0.1.bb} (85%)

diff --git a/meta/recipes-devtools/python/python3-pytest-runner_6.0.0.bb b/meta/recipes-devtools/python/python3-pytest-runner_6.0.1.bb
similarity index 85%
rename from meta/recipes-devtools/python/python3-pytest-runner_6.0.0.bb
rename to meta/recipes-devtools/python/python3-pytest-runner_6.0.1.bb
index f7a2c1bb95..6f54bac1ff 100644
--- a/meta/recipes-devtools/python/python3-pytest-runner_6.0.0.bb
+++ b/meta/recipes-devtools/python/python3-pytest-runner_6.0.1.bb
@@ -3,7 +3,7 @@ HOMEPAGE = "https://pypi.org/project/pytest-runner/"
 LICENSE = "MIT"
 LIC_FILES_CHKSUM = "file://LICENSE;md5=7a7126e068206290f3fe9f8d6c713ea6"
 
-SRC_URI[sha256sum] = "b4d85362ed29b4c348678de797df438f0f0509497ddb8c647096c02a6d87b685"
+SRC_URI[sha256sum] = "70d4739585a7008f37bf4933c013fdb327b8878a5a69fcbb3316c88882f0f49b"
 
 inherit pypi python_setuptools_build_meta
 
-- 
2.34.1


