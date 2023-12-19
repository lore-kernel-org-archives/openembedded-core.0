Return-Path: <wangmy@fujitsu.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 75091C41535
	for <webhook@archiver.kernel.org>; Tue, 19 Dec 2023 09:40:48 +0000 (UTC)
Received: from esa6.hc1455-7.c3s2.iphmx.com (esa6.hc1455-7.c3s2.iphmx.com [68.232.139.139])
 by mx.groups.io with SMTP id smtpd.web11.8770.1702978838283353891
 for <openembedded-core@lists.openembedded.org>;
 Tue, 19 Dec 2023 01:40:38 -0800
Authentication-Results: mx.groups.io;
 dkim=none (message not signed); spf=pass (domain: fujitsu.com, ip: 68.232.139.139, mailfrom: wangmy@fujitsu.com)
X-IronPort-AV: E=McAfee;i="6600,9927,10928"; a="145521171"
X-IronPort-AV: E=Sophos;i="6.04,287,1695654000"; 
   d="scan'208";a="145521171"
Received: from unknown (HELO oym-r3.gw.nic.fujitsu.com) ([210.162.30.91])
  by esa6.hc1455-7.c3s2.iphmx.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 19 Dec 2023 18:40:36 +0900
Received: from oym-m3.gw.nic.fujitsu.com (oym-nat-oym-m3.gw.nic.fujitsu.com [192.168.87.60])
	by oym-r3.gw.nic.fujitsu.com (Postfix) with ESMTP id BB4E9D64A0
	for <openembedded-core@lists.openembedded.org>; Tue, 19 Dec 2023 18:40:33 +0900 (JST)
Received: from kws-ab3.gw.nic.fujitsu.com (kws-ab3.gw.nic.fujitsu.com [192.51.206.21])
	by oym-m3.gw.nic.fujitsu.com (Postfix) with ESMTP id ECBD5D9490
	for <openembedded-core@lists.openembedded.org>; Tue, 19 Dec 2023 18:40:32 +0900 (JST)
Received: from edo.cn.fujitsu.com (edo.cn.fujitsu.com [10.167.33.5])
	by kws-ab3.gw.nic.fujitsu.com (Postfix) with ESMTP id 63A82202CB5A8
	for <openembedded-core@lists.openembedded.org>; Tue, 19 Dec 2023 18:40:32 +0900 (JST)
Received: from vm4860.g01.fujitsu.local (unknown [10.167.225.33])
	by edo.cn.fujitsu.com (Postfix) with ESMTP id 1C2D61A006F;
	Tue, 19 Dec 2023 17:40:32 +0800 (CST)
From: wangmy@fujitsu.com
To: openembedded-core@lists.openembedded.org
Cc: Wang Mingyu <wangmy@fujitsu.com>
Subject: [OE-core] [PATCH] python3-dbusmock: upgrade 0.29.1 -> 0.30.0
Date: Tue, 19 Dec 2023 17:40:22 +0800
Message-Id: <1702978822-7995-1-git-send-email-wangmy@fujitsu.com>
X-Mailer: git-send-email 1.8.3.1
X-TM-AS-GCONF: 00
X-TM-AS-Product-Ver: IMSS-9.1.0.1417-9.0.0.1002-28066.006
X-TM-AS-User-Approved-Sender: Yes
X-TMASE-Version: IMSS-9.1.0.1417-9.0.1002-28066.006
X-TMASE-Result: 10-2.272500-10.000000
X-TMASE-MatchedRID: R9NZgeCyXhKjz0nOeth/yUIIxwDaU5mrF4r8H5YrEqxRZOwW8H/X5tnO
	deq786q7J6Ys2UJwT9QNyr61Mu6ROm0Xr+fj3ww/8t4fUUGeErTBOVz0Jwcxl0fyM5VfgjG2T3E
	r/Wp7qkQdA8XPYQyAUAYUFsN5WfiF8plQwfMmRJSeAiCmPx4NwGmRqNBHmBveVDC1CbuJXmMqtq
	5d3cxkNTmU93iMSDFG3/j2IeRfjKwbq70u3WB9PicoGtQVU+vXIE12wVsKFMfsJjRhDo5q17ru/
	H1UCy56fFd+sYKabiqjJ3gzaZPtedctSarHnY/EU8mdcvbI1h2S6jzjuXTm0MTMzICazP4UehYt
	aVdyxm8=
X-TMASE-SNAP-Result: 1.821001.0001-0-1-22:0,33:0,34:0-0
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Tue, 19 Dec 2023 09:40:48 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/192709

From: Wang Mingyu <wangmy@fujitsu.com>

Changelog:
============
-api: Add pytest support and helpers
-api: Factor the server spawning into a new SpawnedMock object
-doc: generate sphinx docs on https://martinpitt.github.io/python-dbusmock/
-cli: Add support for running custom commands on the mock environment

Signed-off-by: Wang Mingyu <wangmy@fujitsu.com>
---
 .../{python3-dbusmock_0.29.1.bb => python3-dbusmock_0.30.0.bb}  | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)
 rename meta/recipes-devtools/python/{python3-dbusmock_0.29.1.bb => python3-dbusmock_0.30.0.bb} (87%)

diff --git a/meta/recipes-devtools/python/python3-dbusmock_0.29.1.bb b/meta/recipes-devtools/python/python3-dbusmock_0.30.0.bb
similarity index 87%
rename from meta/recipes-devtools/python/python3-dbusmock_0.29.1.bb
rename to meta/recipes-devtools/python/python3-dbusmock_0.30.0.bb
index 09bae0e19f..8dec23134a 100644
--- a/meta/recipes-devtools/python/python3-dbusmock_0.29.1.bb
+++ b/meta/recipes-devtools/python/python3-dbusmock_0.30.0.bb
@@ -4,7 +4,7 @@ HOMEPAGE = "https://pypi.org/project/python-dbusmock/"
 LICENSE = "GPL-3.0-only"
 LIC_FILES_CHKSUM = "file://COPYING;md5=e6a600fd5e1d9cbde2d983680233ad02"
 
-SRC_URI[sha256sum] = "b03590057c236d352c38973f4b71ae2c97b3a1cb1dc6f03278ce4072a3716a74"
+SRC_URI[sha256sum] = "dbb59e715b4d88089caed950edf93c46cb5f022ceae5d8ae37064b73baf956c1"
 
 PYPI_PACKAGE = "python-dbusmock"
 
-- 
2.34.1


