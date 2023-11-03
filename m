Return-Path: <wangmy@fujitsu.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id ADA4BC4332F
	for <webhook@archiver.kernel.org>; Fri,  3 Nov 2023 07:30:03 +0000 (UTC)
Received: from esa3.hc1455-7.c3s2.iphmx.com (esa3.hc1455-7.c3s2.iphmx.com [207.54.90.49])
 by mx.groups.io with SMTP id smtpd.web10.38263.1698996594358340285
 for <openembedded-core@lists.openembedded.org>;
 Fri, 03 Nov 2023 00:29:54 -0700
Authentication-Results: mx.groups.io;
 dkim=none (message not signed); spf=pass (domain: fujitsu.com, ip: 207.54.90.49, mailfrom: wangmy@fujitsu.com)
X-IronPort-AV: E=McAfee;i="6600,9927,10882"; a="138501953"
X-IronPort-AV: E=Sophos;i="6.03,273,1694703600"; 
   d="scan'208";a="138501953"
Received: from unknown (HELO oym-r4.gw.nic.fujitsu.com) ([210.162.30.92])
  by esa3.hc1455-7.c3s2.iphmx.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 03 Nov 2023 16:29:52 +0900
Received: from oym-m1.gw.nic.fujitsu.com (oym-nat-oym-m1.gw.nic.fujitsu.com [192.168.87.58])
	by oym-r4.gw.nic.fujitsu.com (Postfix) with ESMTP id 13ABED9D8F
	for <openembedded-core@lists.openembedded.org>; Fri,  3 Nov 2023 16:29:50 +0900 (JST)
Received: from kws-ab3.gw.nic.fujitsu.com (kws-ab3.gw.nic.fujitsu.com [192.51.206.21])
	by oym-m1.gw.nic.fujitsu.com (Postfix) with ESMTP id 477A7D88CF
	for <openembedded-core@lists.openembedded.org>; Fri,  3 Nov 2023 16:29:49 +0900 (JST)
Received: from vm4860.g01.fujitsu.local (unknown [10.193.128.79])
	by kws-ab3.gw.nic.fujitsu.com (Postfix) with ESMTP id 9553720050190;
	Fri,  3 Nov 2023 16:29:48 +0900 (JST)
From: wangmy@fujitsu.com
To: openembedded-core@lists.openembedded.org
Cc: Wang Mingyu <wangmy@fujitsu.com>
Subject: [OE-core] [PATCH] python3-gitdb: upgrade 4.0.10 -> 4.0.11
Date: Fri,  3 Nov 2023 15:29:16 +0800
Message-Id: <1698996556-30777-1-git-send-email-wangmy@fujitsu.com>
X-Mailer: git-send-email 1.8.3.1
X-TM-AS-GCONF: 00
X-TM-AS-Product-Ver: IMSS-9.1.0.1417-9.0.0.1002-27974.005
X-TM-AS-User-Approved-Sender: Yes
X-TMASE-Version: IMSS-9.1.0.1417-9.0.1002-27974.005
X-TMASE-Result: 10--8.857200-10.000000
X-TMASE-MatchedRID: rofoCPeR2CGjz0nOeth/yUIIxwDaU5mrXLILvyEBT847TItwyO7eHwjJ
	lierVE/nfueRQRHqq3Rvp+b/wK4TT7vGEmcXHXAmWpaVMB1r+AvRt2Ooo6gbd1jH3z6RfJRwkEU
	L8+9T+WBnz/tr+VrHWtOOmzRvxdpwxEEtnnH5KRc/QdUh6LEl0DeXamXCCu1YIPUd1fKoOcS/BR
	68O365bu/QsxUpdsNFeTjw/FyRX6QfE8yM4pjsDwtuKBGekqUpI/NGWt0UYPCatrLjfOhkpEuVB
	8O5yw5NuuE6tKvLBsDMnj7ytJsH9ZPvporKy+uo
X-TMASE-SNAP-Result: 1.821001.0001-0-1-22:0,33:0,34:0-0
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Fri, 03 Nov 2023 07:30:03 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/190125

From: Wang Mingyu <wangmy@fujitsu.com>

Changelog:
==========
Use ZLIB_RUNTIME_VERSION if available 
Add support for Python 3.12 and drop EOL 3.7 
Enable Dependabot version updates for Actions 
Test installing project on CI 
Fix mkdir race condition in LooseObjectDB.store 
Don't cancel other jobs from the 3.12 job failing 
Use actions/checkout feature to fetch all commits 
Revert "Drop support for EOL Python 3.7" 
Fix top-of-file license URLs here in gitdb too 
No longer treat 3.12 as experimental on CI 
Add all to exc for linting 
Have Dependabot update smmap submodule dependency 
Bump gitdb/ext/smmap from 334ef84 to f1ace75 

Signed-off-by: Wang Mingyu <wangmy@fujitsu.com>
---
 .../python/{python3-gitdb_4.0.10.bb => python3-gitdb_4.0.11.bb} | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)
 rename meta/recipes-devtools/python/{python3-gitdb_4.0.10.bb => python3-gitdb_4.0.11.bb} (86%)

diff --git a/meta/recipes-devtools/python/python3-gitdb_4.0.10.bb b/meta/recipes-devtools/python/python3-gitdb_4.0.11.bb
similarity index 86%
rename from meta/recipes-devtools/python/python3-gitdb_4.0.10.bb
rename to meta/recipes-devtools/python/python3-gitdb_4.0.11.bb
index 3a430c30f0..25e1a2df7e 100644
--- a/meta/recipes-devtools/python/python3-gitdb_4.0.10.bb
+++ b/meta/recipes-devtools/python/python3-gitdb_4.0.11.bb
@@ -10,7 +10,7 @@ inherit pypi setuptools3
 
 PYPI_PACKAGE = "gitdb"
 
-SRC_URI[sha256sum] = "6eb990b69df4e15bad899ea868dc46572c3f75339735663b81de79b06f17eb9a"
+SRC_URI[sha256sum] = "bf5421126136d6d0af55bc1e7c1af1c397a34f5b7bd79e776cd3e89785c2b04b"
 
 RDEPENDS:${PN} += "python3-compression \
                    python3-crypt \
-- 
2.34.1


