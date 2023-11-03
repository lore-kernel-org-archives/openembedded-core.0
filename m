Return-Path: <wangmy@fujitsu.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id DB7ABC4332F
	for <webhook@archiver.kernel.org>; Fri,  3 Nov 2023 07:43:13 +0000 (UTC)
Received: from esa7.hc1455-7.c3s2.iphmx.com (esa7.hc1455-7.c3s2.iphmx.com [139.138.61.252])
 by mx.groups.io with SMTP id smtpd.web10.39129.1698997392904213435
 for <openembedded-core@lists.openembedded.org>;
 Fri, 03 Nov 2023 00:43:13 -0700
Authentication-Results: mx.groups.io;
 dkim=none (message not signed); spf=pass (domain: fujitsu.com, ip: 139.138.61.252, mailfrom: wangmy@fujitsu.com)
X-IronPort-AV: E=McAfee;i="6600,9927,10882"; a="117290150"
X-IronPort-AV: E=Sophos;i="6.03,273,1694703600"; 
   d="scan'208";a="117290150"
Received: from unknown (HELO oym-r3.gw.nic.fujitsu.com) ([210.162.30.91])
  by esa7.hc1455-7.c3s2.iphmx.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 03 Nov 2023 16:43:10 +0900
Received: from oym-m1.gw.nic.fujitsu.com (oym-nat-oym-m1.gw.nic.fujitsu.com [192.168.87.58])
	by oym-r3.gw.nic.fujitsu.com (Postfix) with ESMTP id 7A068D6475
	for <openembedded-core@lists.openembedded.org>; Fri,  3 Nov 2023 16:43:08 +0900 (JST)
Received: from aks-ab1.gw.nic.fujitsu.com (aks-ab1.gw.nic.fujitsu.com [192.51.207.11])
	by oym-m1.gw.nic.fujitsu.com (Postfix) with ESMTP id B5BFCD88D5
	for <openembedded-core@lists.openembedded.org>; Fri,  3 Nov 2023 16:43:07 +0900 (JST)
Received: from vm4860.g01.fujitsu.local (unknown [10.193.128.79])
	by aks-ab1.gw.nic.fujitsu.com (Postfix) with ESMTP id 9F9192FC71A0;
	Fri,  3 Nov 2023 16:43:06 +0900 (JST)
From: wangmy@fujitsu.com
To: openembedded-core@lists.openembedded.org
Cc: Wang Mingyu <wangmy@fujitsu.com>
Subject: [OE-core] [PATCH] python3-pytest: upgrade 7.4.2 -> 7.4.3
Date: Fri,  3 Nov 2023 15:42:38 +0800
Message-Id: <1698997358-31081-1-git-send-email-wangmy@fujitsu.com>
X-Mailer: git-send-email 1.8.3.1
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-TM-AS-GCONF: 00
X-TM-AS-Product-Ver: IMSS-9.1.0.1408-9.0.0.1002-27974.005
X-TM-AS-User-Approved-Sender: Yes
X-TMASE-Version: IMSS-9.1.0.1408-9.0.1002-27974.005
X-TMASE-Result: 10--4.655400-10.000000
X-TMASE-MatchedRID: KEcVumlYY7qjz0nOeth/yUIIxwDaU5mrlsVu5QodRJhvdIm9AxfnXj4t
	lu4+KTBzm6WfEFBBxPrJvh8FpN6h+K/JmRB+Be3Fqoeab9Xgz88Tzg4hNEhhM5m3OIVSf4P5F24
	P4yabpDZu5P3zv63t7ycuZDm5Fa/oMZThWvoZkUwD2WXLXdz+AdXLiEcLf+DIsrDwfHQQaK1yp+
	gwY/4LBCL637QCIVpiMTjVsUEpx0vzTNnbxjBnnDyjd/AizytBEITY2UGMiNwpeqaZhManGJSDl
	QPoCUXSsX24ahsS5PtftuJwrFEhTbeQq6mF2S4/3QfwsVk0UbvqwGfCk7KUszIrLyBoHH7jbtuw
	snXJoUD7ZSWkyJlNWEFpdxq0/4SFXm/3yyii6gtzGJHgMcPnSW1IYVgp9NoVxn6d5cvWxhzGjtZ
	oDxFb2xMBexWs+SIH3D94QFatAxc21XLFpkB2YKzp5y15pXcIftwZ3X11IV0=
X-TMASE-SNAP-Result: 1.821001.0001-0-1-22:0,33:0,34:0-0
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Fri, 03 Nov 2023 07:43:13 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/190132

From: Wang Mingyu <wangmy@fujitsu.com>

Changelog:
============
-Markers are now considered in the reverse mro order to ensure base class
 markers are considered first – this resolves a regression.
-Fixed := in asserts impacting unrelated test cases.
-Handled an edge case where sys.stderr might already be closed when Fault
 Handler is tearing down.

Signed-off-by: Wang Mingyu <wangmy@fujitsu.com>
---
 .../python/{python3-pytest_7.4.2.bb => python3-pytest_7.4.3.bb} | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)
 rename meta/recipes-devtools/python/{python3-pytest_7.4.2.bb => python3-pytest_7.4.3.bb} (93%)

diff --git a/meta/recipes-devtools/python/python3-pytest_7.4.2.bb b/meta/recipes-devtools/python/python3-pytest_7.4.3.bb
similarity index 93%
rename from meta/recipes-devtools/python/python3-pytest_7.4.2.bb
rename to meta/recipes-devtools/python/python3-pytest_7.4.3.bb
index 710aa51716..6fa0febd88 100644
--- a/meta/recipes-devtools/python/python3-pytest_7.4.2.bb
+++ b/meta/recipes-devtools/python/python3-pytest_7.4.3.bb
@@ -5,7 +5,7 @@ DESCRIPTION = "The pytest framework makes it easy to write small tests, yet scal
 LICENSE = "MIT"
 LIC_FILES_CHKSUM = "file://LICENSE;md5=bd27e41b6550fe0fc45356d1d81ee37c"
 
-SRC_URI[sha256sum] = "a766259cfab564a2ad52cb1aae1b881a75c3eb7e34ca3779697c23ed47c47069"
+SRC_URI[sha256sum] = "d989d136982de4e3b29dabcc838ad581c64e8ed52c11fbe86ddebd9da0818cd5"
 
 DEPENDS += "python3-setuptools-scm-native"
 
-- 
2.34.1


