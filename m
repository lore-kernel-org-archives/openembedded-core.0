Return-Path: <wangmy@fujitsu.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 1AE6FC4167B
	for <webhook@archiver.kernel.org>; Tue, 28 Nov 2023 23:39:18 +0000 (UTC)
Received: from esa10.hc1455-7.c3s2.iphmx.com (esa10.hc1455-7.c3s2.iphmx.com [139.138.36.225])
 by mx.groups.io with SMTP id smtpd.web10.14186.1701214755033403658
 for <openembedded-core@lists.openembedded.org>;
 Tue, 28 Nov 2023 15:39:15 -0800
Authentication-Results: mx.groups.io;
 dkim=none (message not signed); spf=pass (domain: fujitsu.com, ip: 139.138.36.225, mailfrom: wangmy@fujitsu.com)
X-IronPort-AV: E=McAfee;i="6600,9927,10908"; a="128962064"
X-IronPort-AV: E=Sophos;i="6.04,234,1695654000"; 
   d="scan'208";a="128962064"
Received: from unknown (HELO oym-r3.gw.nic.fujitsu.com) ([210.162.30.91])
  by esa10.hc1455-7.c3s2.iphmx.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 29 Nov 2023 08:39:12 +0900
Received: from oym-m3.gw.nic.fujitsu.com (oym-nat-oym-m3.gw.nic.fujitsu.com [192.168.87.60])
	by oym-r3.gw.nic.fujitsu.com (Postfix) with ESMTP id 34413D64AD
	for <openembedded-core@lists.openembedded.org>; Wed, 29 Nov 2023 08:39:10 +0900 (JST)
Received: from aks-ab2.gw.nic.fujitsu.com (aks-ab2.gw.nic.fujitsu.com [192.51.207.12])
	by oym-m3.gw.nic.fujitsu.com (Postfix) with ESMTP id 6A854D9476
	for <openembedded-core@lists.openembedded.org>; Wed, 29 Nov 2023 08:39:09 +0900 (JST)
Received: from vm4860.g01.fujitsu.local (unknown [10.193.128.149])
	by aks-ab2.gw.nic.fujitsu.com (Postfix) with ESMTP id 4585386D02;
	Wed, 29 Nov 2023 08:39:08 +0900 (JST)
From: wangmy@fujitsu.com
To: openembedded-core@lists.openembedded.org
Cc: Wang Mingyu <wangmy@fujitsu.com>
Subject: [OE-core] [PATCH] libsolv: upgrade 0.7.26 -> 0.7.27
Date: Wed, 29 Nov 2023 07:38:17 +0800
Message-Id: <1701214697-1643-1-git-send-email-wangmy@fujitsu.com>
X-Mailer: git-send-email 1.8.3.1
X-TM-AS-GCONF: 00
X-TM-AS-Product-Ver: IMSS-9.1.0.1408-9.0.0.1002-28026.003
X-TM-AS-User-Approved-Sender: Yes
X-TMASE-Version: IMSS-9.1.0.1408-9.0.1002-28026.003
X-TMASE-Result: 10-3.961700-10.000000
X-TMASE-MatchedRID: n7p0zKhDeQSjz0nOeth/yUIIxwDaU5mrF4r8H5YrEqxRXsXSRyV+gn72
	uNnedUzGi9mp9kw23rOpXR7NA6GzIu1a16oqp8B1/HTKStsDGMJHNQ8CqEKO2MC5DTEMxpeQ32S
	61JcPB8ffjT8jjWZr5TFHUk/VAfV/yGOiXr1rOL51e7Xbb6Im2k50qcJ5WOMhmyiLZetSf8nyb6
	HMFK1qe11j5mhaIsibJ0RPnyOnrZKbAjMK1MMuD9Iz5nvJ+I1AYAYXyZlmyd1EHfMlUcVQoOlhu
	8JPnLu6nfwfxX34l6v6PXqayxeH1p4HAk1tlji6OVBaN3pN+BZLv5Eyr/YIrqsDhztRXZ9Cm+LY
	9A78UVCLPa6Os9XH3IQhTU20ySbR
X-TMASE-SNAP-Result: 1.821001.0001-0-1-22:0,33:0,34:0-0
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Tue, 28 Nov 2023 23:39:18 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/191413

From: Wang Mingyu <wangmy@fujitsu.com>

Changelog:
============
* add zstd support for the installcheck tool
* add putinowndirpool cache to make file list handling in
  repo_write much faster

Signed-off-by: Wang Mingyu <wangmy@fujitsu.com>
---
 .../libsolv/{libsolv_0.7.26.bb => libsolv_0.7.27.bb}            | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)
 rename meta/recipes-extended/libsolv/{libsolv_0.7.26.bb => libsolv_0.7.27.bb} (95%)

diff --git a/meta/recipes-extended/libsolv/libsolv_0.7.26.bb b/meta/recipes-extended/libsolv/libsolv_0.7.27.bb
similarity index 95%
rename from meta/recipes-extended/libsolv/libsolv_0.7.26.bb
rename to meta/recipes-extended/libsolv/libsolv_0.7.27.bb
index bae7960138..2ea80c6ce9 100644
--- a/meta/recipes-extended/libsolv/libsolv_0.7.26.bb
+++ b/meta/recipes-extended/libsolv/libsolv_0.7.27.bb
@@ -12,7 +12,7 @@ SRC_URI = "git://github.com/openSUSE/libsolv.git;branch=master;protocol=https \
            file://0001-utils-Conside-musl-when-wrapping-qsort_r.patch \
 "
 
-SRCREV = "48c985375134d2443eee551613161cadc278af2f"
+SRCREV = "0caa2edb94ba228003bf18960e4574256e92f8fb"
 
 UPSTREAM_CHECK_GITTAGREGEX = "(?P<pver>\d+(\.\d+)+)"
 
-- 
2.34.1


