Return-Path: <wangmy@fujitsu.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 9DFBDC001DE
	for <webhook@archiver.kernel.org>; Mon, 17 Jul 2023 09:10:55 +0000 (UTC)
Received: from esa7.hc1455-7.c3s2.iphmx.com (esa7.hc1455-7.c3s2.iphmx.com [139.138.61.252])
 by mx.groups.io with SMTP id smtpd.web10.4253.1689585054270689621
 for <openembedded-core@lists.openembedded.org>;
 Mon, 17 Jul 2023 02:10:54 -0700
Authentication-Results: mx.groups.io;
 dkim=missing; spf=pass (domain: fujitsu.com, ip: 139.138.61.252, mailfrom: wangmy@fujitsu.com)
X-IronPort-AV: E=McAfee;i="6600,9927,10773"; a="103553762"
X-IronPort-AV: E=Sophos;i="6.01,211,1684767600"; 
   d="scan'208";a="103553762"
Received: from unknown (HELO oym-r2.gw.nic.fujitsu.com) ([210.162.30.90])
  by esa7.hc1455-7.c3s2.iphmx.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 17 Jul 2023 18:10:52 +0900
Received: from oym-m1.gw.nic.fujitsu.com (oym-nat-oym-m1.gw.nic.fujitsu.com [192.168.87.58])
	by oym-r2.gw.nic.fujitsu.com (Postfix) with ESMTP id BCE42D4240
	for <openembedded-core@lists.openembedded.org>; Mon, 17 Jul 2023 18:10:49 +0900 (JST)
Received: from aks-ab1.gw.nic.fujitsu.com (aks-ab1.gw.nic.fujitsu.com [192.51.207.11])
	by oym-m1.gw.nic.fujitsu.com (Postfix) with ESMTP id 00EAAD5017
	for <openembedded-core@lists.openembedded.org>; Mon, 17 Jul 2023 18:10:49 +0900 (JST)
Received: from localhost.localdomain (unknown [10.167.225.33])
	by aks-ab1.gw.nic.fujitsu.com (Postfix) with ESMTP id 1DBC52FC86AA;
	Mon, 17 Jul 2023 18:10:48 +0900 (JST)
From: wangmy@fujitsu.com
To: openembedded-core@lists.openembedded.org
Cc: Wang Mingyu <wangmy@fujitsu.com>
Subject: [OE-core] [PATCH] python3-numpy: upgrade 1.25.0 -> 1.25.1
Date: Mon, 17 Jul 2023 17:10:23 +0800
Message-Id: <1689585025-23731-17-git-send-email-wangmy@fujitsu.com>
X-Mailer: git-send-email 1.8.3.1
In-Reply-To: <1689585025-23731-1-git-send-email-wangmy@fujitsu.com>
References: <1689585025-23731-1-git-send-email-wangmy@fujitsu.com>
X-TM-AS-GCONF: 00
X-TM-AS-Product-Ver: IMSS-9.1.0.1408-9.0.0.1002-27756.006
X-TM-AS-User-Approved-Sender: Yes
X-TMASE-Version: IMSS-9.1.0.1408-9.0.1002-27756.006
X-TMASE-Result: 10--9.571200-10.000000
X-TMASE-MatchedRID: rofoCPeR2CGjz0nOeth/yaUl1aQUvopWScHI0MnRcnR4YeSlHZYFooRQ
	J083LK5lMl8jKyCy9kGb8kNdCUX2nsRBLZ5x+SkXP0HVIeixJdA3l2plwgrtWCD1HdXyqDnEvwU
	evDt+uW5tMXimGWsZZHzoX6MtOvdEDytg73Zv02YTMSg6oABUs/ioIsi7Sa0guRI/000hJfEDol
	RaRe50iX8AYrjAicEyeTjw/FyRX6QfE8yM4pjsDwtuKBGekqUpI/NGWt0UYPDpsHm90BQtHwPQc
	klMVLuMQWO4bV4Y+92JiP4f7peNg4BwVcueFE9Y
X-TMASE-SNAP-Result: 1.821001.0001-0-1-22:0,33:0,34:0-0
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Mon, 17 Jul 2023 09:10:55 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/184454

From: Wang Mingyu <wangmy@fujitsu.com>

A total of 14 pull requests were merged for this release.
========================================================
 #23968: MAINT: prepare 1.25.x for further development
 #24036: BLD: Port long double identification to C for meson
 #24037: BUG: Fix reduction return NULL to be goto fail
 #24038: BUG: Avoid undefined behavior in array.astype()
 #24039: BUG: Ensure __array_ufunc__ works without any kwargs passed
 #24117: MAINT: Pin urllib3 to avoid anaconda-client bug.
 #24118: TST: Pin pydantic<2 in Pyodide workflow
 #24119: MAINT: Bump pypa/cibuildwheel from 2.13.0 to 2.13.1
 #24120: MAINT: Bump actions/checkout from 3.5.2 to 3.5.3
 #24122: BUG: Multiply or Divides using SIMD without a full vector can...
 #24127: MAINT: testing for IS_MUSL closes #24074
 #24128: BUG: Only replace dtype temporarily if dimensions changed
 #24129: MAINT: Bump actions/setup-node from 3.6.0 to 3.7.0
 #24134: BUG: Fix private procedures in f2py modules

Signed-off-by: Wang Mingyu <wangmy@fujitsu.com>
---
 .../python/{python3-numpy_1.25.0.bb => python3-numpy_1.25.1.bb} | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)
 rename meta/recipes-devtools/python/{python3-numpy_1.25.0.bb => python3-numpy_1.25.1.bb} (96%)

diff --git a/meta/recipes-devtools/python/python3-numpy_1.25.0.bb b/meta/recipes-devtools/python/python3-numpy_1.25.1.bb
similarity index 96%
rename from meta/recipes-devtools/python/python3-numpy_1.25.0.bb
rename to meta/recipes-devtools/python/python3-numpy_1.25.1.bb
index d9d37dbf36..3632ab71ee 100644
--- a/meta/recipes-devtools/python/python3-numpy_1.25.0.bb
+++ b/meta/recipes-devtools/python/python3-numpy_1.25.1.bb
@@ -12,7 +12,7 @@ SRC_URI = "${GITHUB_BASE_URI}/download/v${PV}/${SRCNAME}-${PV}.tar.gz \
            file://0001-numpy-core-Define-RISCV-32-support.patch \
            file://run-ptest \
            "
-SRC_URI[sha256sum] = "f1accae9a28dc3cda46a91de86acf69de0d1b5f4edd44a9b0c3ceb8036dfff19"
+SRC_URI[sha256sum] = "9a3a9f3a61480cc086117b426a8bd86869c213fc4072e606f01c4e4b66eb92bf"
 
 GITHUB_BASE_URI = "https://github.com/numpy/numpy/releases"
 UPSTREAM_CHECK_REGEX = "releases/tag/v?(?P<pver>\d+(\.\d+)+)$"
-- 
2.34.1


