Return-Path: <wangmy@fujitsu.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id A2B11E7718F
	for <webhook@archiver.kernel.org>; Mon, 23 Dec 2024 09:11:32 +0000 (UTC)
Received: from esa12.hc1455-7.c3s2.iphmx.com (esa12.hc1455-7.c3s2.iphmx.com [139.138.37.100])
 by mx.groups.io with SMTP id smtpd.web11.10458.1734945091241156449
 for <openembedded-core@lists.openembedded.org>;
 Mon, 23 Dec 2024 01:11:31 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@fujitsu.com header.s=fj2 header.b=NoT6igYR;
 spf=pass (domain: fujitsu.com, ip: 139.138.37.100, mailfrom: wangmy@fujitsu.com)
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
  d=fujitsu.com; i=@fujitsu.com; q=dns/txt; s=fj2;
  t=1734945091; x=1766481091;
  h=from:to:cc:subject:date:message-id:in-reply-to:
   references;
  bh=nb5et2ODKVMKxz7gh/LXX1SDtVyb9ivicLB51UAMpns=;
  b=NoT6igYR/iG+D7RkQGDfOhVlwsDOKQtOoP+FTZFWR2OlE3Vb3/aJfJeh
   ++HjZp19E3/CpB4Qd/E52nPBTkiJqX52NZ0RkNhQyBurRGmEFwjkFLoiq
   CUM3scwgreEPHi9ScH4aN5B+0Ylfz/63csiufXxY3XWQ8OC2t2ELdSaMO
   IfErgOFaLeyvlIljsV9lbe8RVNyovAHdfGeyagUZIFwDbzzK+435dK/FY
   HNi3xUA6SVwhaVycEjlRspsaILqxktqADW9U8ZUEd/ZRp/Is6Q/FeeWTy
   1XUU4T3t5kjj8ddwudx33cqhNs/4lEFOHlQwXiWjfAxL6yyjwnFdTUe6A
   Q==;
X-CSE-ConnectionGUID: P3XYNIMHSvafU9OZ63wH5A==
X-CSE-MsgGUID: BYs01W7dSsKopnMzBLkKyA==
X-IronPort-AV: E=McAfee;i="6700,10204,11294"; a="163591239"
X-IronPort-AV: E=Sophos;i="6.12,256,1728918000"; 
   d="scan'208";a="163591239"
Received: from unknown (HELO oym-r2.gw.nic.fujitsu.com) ([210.162.30.90])
  by esa12.hc1455-7.c3s2.iphmx.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 23 Dec 2024 18:11:29 +0900
Received: from oym-m2.gw.nic.fujitsu.com (oym-nat-oym-m2.gw.nic.fujitsu.com [192.168.87.59])
	by oym-r2.gw.nic.fujitsu.com (Postfix) with ESMTP id C4B4ED4C2B
	for <openembedded-core@lists.openembedded.org>; Mon, 23 Dec 2024 18:11:26 +0900 (JST)
Received: from kws-ab3.gw.nic.fujitsu.com (kws-ab3.gw.nic.fujitsu.com [192.51.206.21])
	by oym-m2.gw.nic.fujitsu.com (Postfix) with ESMTP id 92064BF3D3
	for <openembedded-core@lists.openembedded.org>; Mon, 23 Dec 2024 18:11:26 +0900 (JST)
Received: from edo.cn.fujitsu.com (edo.cn.fujitsu.com [10.167.33.5])
	by kws-ab3.gw.nic.fujitsu.com (Postfix) with ESMTP id 066BA20097CE0
	for <openembedded-core@lists.openembedded.org>; Mon, 23 Dec 2024 18:11:21 +0900 (JST)
Received: from localhost.localdomain.localdomain (unknown [10.193.128.200])
	by edo.cn.fujitsu.com (Postfix) with ESMTP id C1E851A0071;
	Mon, 23 Dec 2024 17:11:20 +0800 (CST)
From: wangmy@fujitsu.com
To: openembedded-core@lists.openembedded.org
Cc: Wang Mingyu <wangmy@fujitsu.com>
Subject: [OE-core] [PATCH 17/22] python3-rpds-py: upgrade 0.21.0 -> 0.22.3
Date: Mon, 23 Dec 2024 17:11:00 +0800
Message-Id: <1734945065-4373-17-git-send-email-wangmy@fujitsu.com>
X-Mailer: git-send-email 1.8.3.1
In-Reply-To: <1734945065-4373-1-git-send-email-wangmy@fujitsu.com>
References: <1734945065-4373-1-git-send-email-wangmy@fujitsu.com>
X-TM-AS-GCONF: 00
X-TM-AS-Product-Ver: IMSS-9.1.0.1417-9.0.0.1002-28876.006
X-TM-AS-User-Approved-Sender: Yes
X-TMASE-Version: IMSS-9.1.0.1417-9.0.1002-28876.006
X-TMASE-Result: 10-2.713100-10.000000
X-TMASE-MatchedRID: 6e3s/u+cBDSjz0nOeth/yQPZZctd3P4BEITY2UGMiNwH8UzOewTxw+79
	DJRUi35pTQ0JkPG287/mn3xyPJAJoibT7XR2+QFQAxFf86Rcir34qCLIu0mtIB5DOMAR5/aPaRF
	wDs8G7THi8zVgXoAltsIJ+4gwXrEtJ0RPnyOnrZIeiiB5WyDk/hitIIFqJiS5ATVHk8L5nWwuFp
	f7bMMoDiPCoZ6PMZpREBp6ZoEWA1PEzksihUD8blGq6NZmD5CRWSaU3NLM1ZBLv5Eyr/YIrqsDh
	ztRXZ9Cm+LY9A78UVCLPa6Os9XH3IQhTU20ySbR
X-TMASE-SNAP-Result: 1.821001.0001-0-1-22:0,33:0,34:0-0
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Mon, 23 Dec 2024 09:11:32 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/209037

From: Wang Mingyu <wangmy@fujitsu.com>

Signed-off-by: Wang Mingyu <wangmy@fujitsu.com>
---
 .../python/python3-rpds-py-crates.inc         | 24 +++++++++----------
 ...py_0.21.0.bb => python3-rpds-py_0.22.3.bb} |  2 +-
 2 files changed, 13 insertions(+), 13 deletions(-)
 rename meta/recipes-devtools/python/{python3-rpds-py_0.21.0.bb => python3-rpds-py_0.22.3.bb} (85%)

diff --git a/meta/recipes-devtools/python/python3-rpds-py-crates.inc b/meta/recipes-devtools/python/python3-rpds-py-crates.inc
index fc954d69b8..7022cbdcc8 100644
--- a/meta/recipes-devtools/python/python3-rpds-py-crates.inc
+++ b/meta/recipes-devtools/python/python3-rpds-py-crates.inc
@@ -13,12 +13,12 @@ SRC_URI += " \
     crate://crates.io/once_cell/1.19.0 \
     crate://crates.io/portable-atomic/1.6.0 \
     crate://crates.io/proc-macro2/1.0.86 \
-    crate://crates.io/pyo3/0.22.6 \
-    crate://crates.io/pyo3-build-config/0.22.6 \
-    crate://crates.io/pyo3-ffi/0.22.6 \
-    crate://crates.io/pyo3-macros/0.22.6 \
-    crate://crates.io/pyo3-macros-backend/0.22.6 \
-    crate://crates.io/python3-dll-a/0.2.10 \
+    crate://crates.io/pyo3/0.23.3 \
+    crate://crates.io/pyo3-build-config/0.23.3 \
+    crate://crates.io/pyo3-ffi/0.23.3 \
+    crate://crates.io/pyo3-macros/0.23.3 \
+    crate://crates.io/pyo3-macros-backend/0.23.3 \
+    crate://crates.io/python3-dll-a/0.2.11 \
     crate://crates.io/quote/1.0.36 \
     crate://crates.io/rpds/1.1.0 \
     crate://crates.io/syn/2.0.69 \
@@ -39,12 +39,12 @@ SRC_URI[memoffset-0.9.1.sha256sum] = "488016bfae457b036d996092f6cb448677611ce444
 SRC_URI[once_cell-1.19.0.sha256sum] = "3fdb12b2476b595f9358c5161aa467c2438859caa136dec86c26fdd2efe17b92"
 SRC_URI[portable-atomic-1.6.0.sha256sum] = "7170ef9988bc169ba16dd36a7fa041e5c4cbeb6a35b76d4c03daded371eae7c0"
 SRC_URI[proc-macro2-1.0.86.sha256sum] = "5e719e8df665df0d1c8fbfd238015744736151d4445ec0836b8e628aae103b77"
-SRC_URI[pyo3-0.22.6.sha256sum] = "f402062616ab18202ae8319da13fa4279883a2b8a9d9f83f20dbade813ce1884"
-SRC_URI[pyo3-build-config-0.22.6.sha256sum] = "b14b5775b5ff446dd1056212d778012cbe8a0fbffd368029fd9e25b514479c38"
-SRC_URI[pyo3-ffi-0.22.6.sha256sum] = "9ab5bcf04a2cdcbb50c7d6105de943f543f9ed92af55818fd17b660390fc8636"
-SRC_URI[pyo3-macros-0.22.6.sha256sum] = "0fd24d897903a9e6d80b968368a34e1525aeb719d568dba8b3d4bfa5dc67d453"
-SRC_URI[pyo3-macros-backend-0.22.6.sha256sum] = "36c011a03ba1e50152b4b394b479826cad97e7a21eb52df179cd91ac411cbfbe"
-SRC_URI[python3-dll-a-0.2.10.sha256sum] = "bd0b78171a90d808b319acfad166c4790d9e9759bbc14ac8273fe133673dd41b"
+SRC_URI[pyo3-0.23.3.sha256sum] = "e484fd2c8b4cb67ab05a318f1fd6fa8f199fcc30819f08f07d200809dba26c15"
+SRC_URI[pyo3-build-config-0.23.3.sha256sum] = "dc0e0469a84f208e20044b98965e1561028180219e35352a2afaf2b942beff3b"
+SRC_URI[pyo3-ffi-0.23.3.sha256sum] = "eb1547a7f9966f6f1a0f0227564a9945fe36b90da5a93b3933fc3dc03fae372d"
+SRC_URI[pyo3-macros-0.23.3.sha256sum] = "fdb6da8ec6fa5cedd1626c886fc8749bdcbb09424a86461eb8cdf096b7c33257"
+SRC_URI[pyo3-macros-backend-0.23.3.sha256sum] = "38a385202ff5a92791168b1136afae5059d3ac118457bb7bc304c197c2d33e7d"
+SRC_URI[python3-dll-a-0.2.11.sha256sum] = "9b9e268ee1be609e93a13eb06839f68f67e5fe0fb4049834d261c2d5091c1b6d"
 SRC_URI[quote-1.0.36.sha256sum] = "0fa76aaf39101c457836aec0ce2316dbdc3ab723cdda1c6bd4e6ad4208acaca7"
 SRC_URI[rpds-1.1.0.sha256sum] = "a0e15515d3ce3313324d842629ea4905c25a13f81953eadb88f85516f59290a4"
 SRC_URI[syn-2.0.69.sha256sum] = "201fcda3845c23e8212cd466bfebf0bd20694490fc0356ae8e428e0824a915a6"
diff --git a/meta/recipes-devtools/python/python3-rpds-py_0.21.0.bb b/meta/recipes-devtools/python/python3-rpds-py_0.22.3.bb
similarity index 85%
rename from meta/recipes-devtools/python/python3-rpds-py_0.21.0.bb
rename to meta/recipes-devtools/python/python3-rpds-py_0.22.3.bb
index d162f71c19..8eeb954c89 100644
--- a/meta/recipes-devtools/python/python3-rpds-py_0.21.0.bb
+++ b/meta/recipes-devtools/python/python3-rpds-py_0.22.3.bb
@@ -4,7 +4,7 @@ HOMEPAGE = "https://pypi.org/project/rpds-py/"
 LICENSE = "MIT"
 LIC_FILES_CHKSUM = "file://LICENSE;md5=7767fa537c4596c54141f32882c4a984"
 
-SRC_URI[sha256sum] = "ed6378c9d66d0de903763e7706383d60c33829581f0adff47b6535f1802fa6db"
+SRC_URI[sha256sum] = "e32fee8ab45d3c2db6da19a5323bc3362237c8b653c70194414b892fd06a080d"
 
 require ${BPN}-crates.inc
 
-- 
2.43.0


