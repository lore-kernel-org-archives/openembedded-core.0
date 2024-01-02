Return-Path: <wangmy@fujitsu.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 0D5F7C46CD2
	for <webhook@archiver.kernel.org>; Tue,  2 Jan 2024 07:26:26 +0000 (UTC)
Received: from esa7.hc1455-7.c3s2.iphmx.com (esa7.hc1455-7.c3s2.iphmx.com [139.138.61.252])
 by mx.groups.io with SMTP id smtpd.web10.24548.1704180376028906686
 for <openembedded-core@lists.openembedded.org>;
 Mon, 01 Jan 2024 23:26:16 -0800
Authentication-Results: mx.groups.io;
 dkim=none (message not signed); spf=pass (domain: fujitsu.com, ip: 139.138.61.252, mailfrom: wangmy@fujitsu.com)
X-IronPort-AV: E=McAfee;i="6600,9927,10940"; a="123831057"
X-IronPort-AV: E=Sophos;i="6.04,324,1695654000"; 
   d="scan'208";a="123831057"
Received: from unknown (HELO yto-r2.gw.nic.fujitsu.com) ([218.44.52.218])
  by esa7.hc1455-7.c3s2.iphmx.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 02 Jan 2024 16:26:14 +0900
Received: from yto-m3.gw.nic.fujitsu.com (yto-nat-yto-m3.gw.nic.fujitsu.com [192.168.83.66])
	by yto-r2.gw.nic.fujitsu.com (Postfix) with ESMTP id E5C41D6187
	for <openembedded-core@lists.openembedded.org>; Tue,  2 Jan 2024 16:26:11 +0900 (JST)
Received: from kws-ab3.gw.nic.fujitsu.com (kws-ab3.gw.nic.fujitsu.com [192.51.206.21])
	by yto-m3.gw.nic.fujitsu.com (Postfix) with ESMTP id 37304F92F
	for <openembedded-core@lists.openembedded.org>; Tue,  2 Jan 2024 16:26:11 +0900 (JST)
Received: from edo.cn.fujitsu.com (edo.cn.fujitsu.com [10.167.33.5])
	by kws-ab3.gw.nic.fujitsu.com (Postfix) with ESMTP id 70AC020093269
	for <openembedded-core@lists.openembedded.org>; Tue,  2 Jan 2024 16:26:10 +0900 (JST)
Received: from vm4860.g01.fujitsu.local (unknown [10.193.128.187])
	by edo.cn.fujitsu.com (Postfix) with ESMTP id E9AA41A0070;
	Tue,  2 Jan 2024 15:26:09 +0800 (CST)
From: wangmy@fujitsu.com
To: openembedded-core@lists.openembedded.org
Cc: Wang Mingyu <wangmy@fujitsu.com>
Subject: [OE-core] [PATCH] python3-hatch-fancy-pypi-readme: upgrade 23.1.0 -> 24.1.0
Date: Tue,  2 Jan 2024 15:23:43 +0800
Message-Id: <1704180223-8624-1-git-send-email-wangmy@fujitsu.com>
X-Mailer: git-send-email 1.8.3.1
X-TM-AS-GCONF: 00
X-TM-AS-Product-Ver: IMSS-9.1.0.1417-9.0.0.1002-28094.005
X-TM-AS-User-Approved-Sender: Yes
X-TMASE-Version: IMSS-9.1.0.1417-9.0.1002-28094.005
X-TMASE-Result: 10--5.567300-10.000000
X-TMASE-MatchedRID: S9L8qTrmXfGjz0nOeth/yUIIxwDaU5mrmZiw53dqSN+AI7Mvq/sL59nF
	J7vtSl+fHrHtcGNbn6ZR4Xyks9lwTe1a16oqp8B1/HTKStsDGMJHNQ8CqEKO2MC5DTEMxpeQBOf
	aZOJHHOWxfbhqGxLk+4Ay6p60ZV62yA7duzCw6dLdB/CxWTRRu25FeHtsUoHu2FRuU2dx5FAO3y
	Ki25F9uDo8k1fR1SsREzktI42EfocchXTZ3Wukbw==
X-TMASE-SNAP-Result: 1.821001.0001-0-1-22:0,33:0,34:0-0
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Tue, 02 Jan 2024 07:26:26 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/193213

From: Wang Mingyu <wangmy@fujitsu.com>

Changelog:
===========
-Added a default to an internal API that is used by scikit-build-core.
-$HFPR_VERSION is now replaced by the package version in the PyPI readme.
 The version is not available in CLI mode, therefore it's replaced by the dummy
 value of 42.0. 

Signed-off-by: Wang Mingyu <wangmy@fujitsu.com>
---
 ...adme_23.1.0.bb => python3-hatch-fancy-pypi-readme_24.1.0.bb} | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)
 rename meta/recipes-devtools/python/{python3-hatch-fancy-pypi-readme_23.1.0.bb => python3-hatch-fancy-pypi-readme_24.1.0.bb} (81%)

diff --git a/meta/recipes-devtools/python/python3-hatch-fancy-pypi-readme_23.1.0.bb b/meta/recipes-devtools/python/python3-hatch-fancy-pypi-readme_24.1.0.bb
similarity index 81%
rename from meta/recipes-devtools/python/python3-hatch-fancy-pypi-readme_23.1.0.bb
rename to meta/recipes-devtools/python/python3-hatch-fancy-pypi-readme_24.1.0.bb
index 8f6e996a44..1e5c67f832 100644
--- a/meta/recipes-devtools/python/python3-hatch-fancy-pypi-readme_23.1.0.bb
+++ b/meta/recipes-devtools/python/python3-hatch-fancy-pypi-readme_24.1.0.bb
@@ -7,7 +7,7 @@ inherit pypi python_hatchling
 
 PYPI_PACKAGE = "hatch_fancy_pypi_readme"
 
-SRC_URI[sha256sum] = "b1df44063094af1e8248ceacd47a92c9cf313d6b9823bf66af8a927c3960287d"
+SRC_URI[sha256sum] = "44dd239f1a779b9dcf8ebc9401a611fd7f7e3e14578dcf22c265dfaf7c1514b8"
 
 BBCLASSEXTEND = "native nativesdk"
 
-- 
2.34.1


