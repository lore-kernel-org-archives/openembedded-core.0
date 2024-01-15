Return-Path: <wangmy@fujitsu.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 106DCC3DA79
	for <webhook@archiver.kernel.org>; Mon, 15 Jan 2024 09:26:25 +0000 (UTC)
Received: from esa9.hc1455-7.c3s2.iphmx.com (esa9.hc1455-7.c3s2.iphmx.com [139.138.36.223])
 by mx.groups.io with SMTP id smtpd.web11.74017.1705310783616573039
 for <openembedded-core@lists.openembedded.org>;
 Mon, 15 Jan 2024 01:26:24 -0800
Authentication-Results: mx.groups.io;
 dkim=none (message not signed); spf=pass (domain: fujitsu.com, ip: 139.138.36.223, mailfrom: wangmy@fujitsu.com)
X-IronPort-AV: E=McAfee;i="6600,9927,10953"; a="134549084"
X-IronPort-AV: E=Sophos;i="6.04,196,1695654000"; 
   d="scan'208";a="134549084"
Received: from unknown (HELO oym-r4.gw.nic.fujitsu.com) ([210.162.30.92])
  by esa9.hc1455-7.c3s2.iphmx.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 15 Jan 2024 18:26:21 +0900
Received: from oym-m4.gw.nic.fujitsu.com (oym-nat-oym-m4.gw.nic.fujitsu.com [192.168.87.61])
	by oym-r4.gw.nic.fujitsu.com (Postfix) with ESMTP id 34B9FD9D90
	for <openembedded-core@lists.openembedded.org>; Mon, 15 Jan 2024 18:26:17 +0900 (JST)
Received: from kws-ab4.gw.nic.fujitsu.com (kws-ab4.gw.nic.fujitsu.com [192.51.206.22])
	by oym-m4.gw.nic.fujitsu.com (Postfix) with ESMTP id 6F2E9D4BC0
	for <openembedded-core@lists.openembedded.org>; Mon, 15 Jan 2024 18:26:16 +0900 (JST)
Received: from edo.cn.fujitsu.com (edo.cn.fujitsu.com [10.167.33.5])
	by kws-ab4.gw.nic.fujitsu.com (Postfix) with ESMTP id 093BE6895D
	for <openembedded-core@lists.openembedded.org>; Mon, 15 Jan 2024 18:26:16 +0900 (JST)
Received: from vm4860.g01.fujitsu.local (unknown [10.193.128.187])
	by edo.cn.fujitsu.com (Postfix) with ESMTP id 9358A1A0070;
	Mon, 15 Jan 2024 17:26:15 +0800 (CST)
From: wangmy@fujitsu.com
To: openembedded-core@lists.openembedded.org
Cc: Wang Mingyu <wangmy@fujitsu.com>
Subject: [OE-core] [PATCH] python3-trove-classifiers: upgrade 2023.11.29 -> 2024.1.8
Date: Mon, 15 Jan 2024 17:25:57 +0800
Message-Id: <1705310757-24730-1-git-send-email-wangmy@fujitsu.com>
X-Mailer: git-send-email 1.8.3.1
X-TM-AS-GCONF: 00
X-TM-AS-Product-Ver: IMSS-9.1.0.1417-9.0.0.1002-28120.006
X-TM-AS-User-Approved-Sender: Yes
X-TMASE-Version: IMSS-9.1.0.1417-9.0.1002-28120.006
X-TMASE-Result: 10-0.022700-10.000000
X-TMASE-MatchedRID: hsQjHHSArR6jz0nOeth/yUIIxwDaU5mr5sPqcQkI8puU8ftiyKjZrdMj
	jwb9QfV2CC8aAmGeO6lV00+whwxVQy/7QU2czuUNnVTWWiNp+v9uTKBinxl/umAN6i+va16uBqd
	FRjHdIbhbJcQH3furV3k48PxckV+kHxPMjOKY7A+u65UDD0aDgsRB0bsfrpPIcSqbxBgG0w4XiC
	89AgdBH2Yf9iWwm0F3DQuIYiXx4dHlQyXFvBRM4K/dwMyAq3vOBcROEqplBai+6+JQtevrDgeSX
	drAVNux080DcSM+FV+CvqWrFsheUcLe0zBjeZrbFQOP52BRBXJMTsKj18q/fA==
X-TMASE-SNAP-Result: 1.821001.0001-0-1-22:0,33:0,34:0-0
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Mon, 15 Jan 2024 09:26:25 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/193661

From: Wang Mingyu <wangmy@fujitsu.com>

Changelog:
===========
* Added CAN classifiers
* fixed CAN classifier order

Signed-off-by: Wang Mingyu <wangmy@fujitsu.com>
---
 ...iers_2023.11.29.bb => python3-trove-classifiers_2024.1.8.bb} | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)
 rename meta/recipes-devtools/python/{python3-trove-classifiers_2023.11.29.bb => python3-trove-classifiers_2024.1.8.bb} (87%)

diff --git a/meta/recipes-devtools/python/python3-trove-classifiers_2023.11.29.bb b/meta/recipes-devtools/python/python3-trove-classifiers_2024.1.8.bb
similarity index 87%
rename from meta/recipes-devtools/python/python3-trove-classifiers_2023.11.29.bb
rename to meta/recipes-devtools/python/python3-trove-classifiers_2024.1.8.bb
index a06d08455c..9e7e61a37e 100644
--- a/meta/recipes-devtools/python/python3-trove-classifiers_2023.11.29.bb
+++ b/meta/recipes-devtools/python/python3-trove-classifiers_2024.1.8.bb
@@ -3,7 +3,7 @@ HOMEPAGE = "https://github.com/pypa/trove-classifiers"
 LICENSE = "Apache-2.0"
 LIC_FILES_CHKSUM = "file://LICENSE;md5=86d3f3a95c324c9479bd8986968f4327"
 
-SRC_URI[sha256sum] = "ff8f7fd82c7932113b46e7ef6742c70091cc63640c8c65db00d91f2e940b9514"
+SRC_URI[sha256sum] = "6e36caf430ff6485c4b57a4c6b364a13f6a898d16b9417c6c37467e59c14b05a"
 
 inherit pypi python_setuptools_build_meta ptest
 
-- 
2.34.1


