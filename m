Return-Path: <wangmy@fujitsu.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 1DAEFC4167B
	for <webhook@archiver.kernel.org>; Tue, 28 Nov 2023 23:43:18 +0000 (UTC)
Received: from esa5.hc1455-7.c3s2.iphmx.com (esa5.hc1455-7.c3s2.iphmx.com [68.232.139.130])
 by mx.groups.io with SMTP id smtpd.web10.14260.1701214989698653306
 for <openembedded-core@lists.openembedded.org>;
 Tue, 28 Nov 2023 15:43:10 -0800
Authentication-Results: mx.groups.io;
 dkim=none (message not signed); spf=pass (domain: fujitsu.com, ip: 68.232.139.130, mailfrom: wangmy@fujitsu.com)
X-IronPort-AV: E=McAfee;i="6600,9927,10908"; a="140768633"
X-IronPort-AV: E=Sophos;i="6.04,234,1695654000"; 
   d="scan'208";a="140768633"
Received: from unknown (HELO oym-r1.gw.nic.fujitsu.com) ([210.162.30.89])
  by esa5.hc1455-7.c3s2.iphmx.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 29 Nov 2023 08:43:08 +0900
Received: from oym-m1.gw.nic.fujitsu.com (oym-nat-oym-m1.gw.nic.fujitsu.com [192.168.87.58])
	by oym-r1.gw.nic.fujitsu.com (Postfix) with ESMTP id 6A9ADE8BE9
	for <openembedded-core@lists.openembedded.org>; Wed, 29 Nov 2023 08:43:05 +0900 (JST)
Received: from aks-ab2.gw.nic.fujitsu.com (aks-ab2.gw.nic.fujitsu.com [192.51.207.12])
	by oym-m1.gw.nic.fujitsu.com (Postfix) with ESMTP id 9F068AB5EE
	for <openembedded-core@lists.openembedded.org>; Wed, 29 Nov 2023 08:43:04 +0900 (JST)
Received: from vm4860.g01.fujitsu.local (unknown [10.193.128.149])
	by aks-ab2.gw.nic.fujitsu.com (Postfix) with ESMTP id 8A119869FA;
	Wed, 29 Nov 2023 08:43:03 +0900 (JST)
From: wangmy@fujitsu.com
To: openembedded-core@lists.openembedded.org
Cc: Wang Mingyu <wangmy@fujitsu.com>
Subject: [OE-core] [PATCH] python3-trove-classifiers: upgrade 2023.11.14 -> 2023.11.22
Date: Wed, 29 Nov 2023 07:42:21 +0800
Message-Id: <1701214941-1848-1-git-send-email-wangmy@fujitsu.com>
X-Mailer: git-send-email 1.8.3.1
X-TM-AS-GCONF: 00
X-TM-AS-Product-Ver: IMSS-9.1.0.1408-9.0.0.1002-28026.003
X-TM-AS-User-Approved-Sender: Yes
X-TMASE-Version: IMSS-9.1.0.1408-9.0.1002-28026.003
X-TMASE-Result: 10--1.630300-10.000000
X-TMASE-MatchedRID: hsQjHHSArR6jz0nOeth/yUIIxwDaU5mregIHHX2L4YyU8ftiyKjZrdMj
	jwb9QfV2CC8aAmGeO6lV00+whwxVQy/7QU2czuUNnVTWWiNp+v9uTKBinxl/umAN6i+va16uBqd
	FRjHdIbhbJcQH3furV3k48PxckV+kHxPMjOKY7A+u65UDD0aDgsRB0bsfrpPIcSqbxBgG0w5PUV
	0MVuD2VNi1BLeHi0Kto8srg52PRgwr4/nnYt+tYRUW/2pcLjcUoPRZ9HVvHJeViSpoGbBDgki8D
	rQG14EU3xKP2ieeBhWCvqWrFsheUcLe0zBjeZrbFQOP52BRBXJMTsKj18q/fA==
X-TMASE-SNAP-Result: 1.821001.0001-0-1-22:0,33:0,34:0-0
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Tue, 28 Nov 2023 23:43:18 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/191418

From: Wang Mingyu <wangmy@fujitsu.com>

Changelog:
  Add "Framework :: Sphinx :: Domain" classifier

Signed-off-by: Wang Mingyu <wangmy@fujitsu.com>
---
 ...rs_2023.11.14.bb => python3-trove-classifiers_2023.11.22.bb} | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)
 rename meta/recipes-devtools/python/{python3-trove-classifiers_2023.11.14.bb => python3-trove-classifiers_2023.11.22.bb} (87%)

diff --git a/meta/recipes-devtools/python/python3-trove-classifiers_2023.11.14.bb b/meta/recipes-devtools/python/python3-trove-classifiers_2023.11.22.bb
similarity index 87%
rename from meta/recipes-devtools/python/python3-trove-classifiers_2023.11.14.bb
rename to meta/recipes-devtools/python/python3-trove-classifiers_2023.11.22.bb
index a6c7e95c51..44a6f5de03 100644
--- a/meta/recipes-devtools/python/python3-trove-classifiers_2023.11.14.bb
+++ b/meta/recipes-devtools/python/python3-trove-classifiers_2023.11.22.bb
@@ -3,7 +3,7 @@ HOMEPAGE = "https://github.com/pypa/trove-classifiers"
 LICENSE = "Apache-2.0"
 LIC_FILES_CHKSUM = "file://LICENSE;md5=86d3f3a95c324c9479bd8986968f4327"
 
-SRC_URI[sha256sum] = "64b5e78305a5de347f2cd7ec8c12d704a3ef0cb85cc10c0ca5f73488d1c201f8"
+SRC_URI[sha256sum] = "c31a7e92f965f060a244b57d8ed5ee6f53fcb413ee17ce790e00577cb369ad99"
 
 inherit pypi python_setuptools_build_meta ptest
 
-- 
2.34.1


