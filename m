Return-Path: <wangmy@fujitsu.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 57791E7D25B
	for <webhook@archiver.kernel.org>; Tue, 26 Sep 2023 08:25:20 +0000 (UTC)
Received: from esa6.hc1455-7.c3s2.iphmx.com (esa6.hc1455-7.c3s2.iphmx.com [68.232.139.139])
 by mx.groups.io with SMTP id smtpd.web10.14337.1695716717644757033
 for <openembedded-core@lists.openembedded.org>;
 Tue, 26 Sep 2023 01:25:18 -0700
Authentication-Results: mx.groups.io;
 dkim=none (message not signed); spf=pass (domain: fujitsu.com, ip: 68.232.139.139, mailfrom: wangmy@fujitsu.com)
X-IronPort-AV: E=McAfee;i="6600,9927,10843"; a="135103443"
X-IronPort-AV: E=Sophos;i="6.03,177,1694703600"; 
   d="scan'208";a="135103443"
Received: from unknown (HELO oym-r3.gw.nic.fujitsu.com) ([210.162.30.91])
  by esa6.hc1455-7.c3s2.iphmx.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 26 Sep 2023 17:25:15 +0900
Received: from oym-m1.gw.nic.fujitsu.com (oym-nat-oym-m1.gw.nic.fujitsu.com [192.168.87.58])
	by oym-r3.gw.nic.fujitsu.com (Postfix) with ESMTP id 56A12CA1F1
	for <openembedded-core@lists.openembedded.org>; Tue, 26 Sep 2023 17:25:13 +0900 (JST)
Received: from aks-ab2.gw.nic.fujitsu.com (aks-ab2.gw.nic.fujitsu.com [192.51.207.12])
	by oym-m1.gw.nic.fujitsu.com (Postfix) with ESMTP id 4E2D1D5014
	for <openembedded-core@lists.openembedded.org>; Tue, 26 Sep 2023 17:25:12 +0900 (JST)
Received: from localhost.localdomain (unknown [10.167.225.33])
	by aks-ab2.gw.nic.fujitsu.com (Postfix) with ESMTP id 57095885FA;
	Tue, 26 Sep 2023 17:25:11 +0900 (JST)
From: wangmy@fujitsu.com
To: openembedded-core@lists.openembedded.org
Cc: Wang Mingyu <wangmy@fujitsu.com>
Subject: [OE-core] [PATCH] python3-numpy: upgrade 1.25.2 -> 1.26.0
Date: Tue, 26 Sep 2023 16:24:48 +0800
Message-Id: <1695716688-8983-1-git-send-email-wangmy@fujitsu.com>
X-Mailer: git-send-email 1.8.3.1
X-TM-AS-GCONF: 00
X-TM-AS-Product-Ver: IMSS-9.1.0.1408-9.0.0.1002-27898.006
X-TM-AS-User-Approved-Sender: Yes
X-TMASE-Version: IMSS-9.1.0.1408-9.0.1002-27898.006
X-TMASE-Result: 10--1.256400-10.000000
X-TMASE-MatchedRID: u4ys6248rQyjz0nOeth/yQw85kvZfX2KpxAd6mi1Ga3VbZFdXapsKRti
	hBeM13D+4CtjYmQpb2kF1Ec/oUIRlVpCIuRr0RxKTuctSpiuWyUUi4Ehat054+CbuVI7hVbLqbs
	+nJ/tFJG/pnsgbeLxWS6hSEuMtKDj3PhwfmFb3pg7Cl8sx4HBGwK0ZgbTOeKUf+iAo6QzqWDgcJ
	c1hBF7duOh9uw0T/dxkC3GlfRWRcNrFdvBEmTnvHV7tdtvoibarixttRG+E/OBbptjxI6rdaPFj
	JEFr+olwXCBO/GKkVqOhzOa6g8KrdkwOdiEXr3+LQlwJ8HUHn/HWcKIBk9z2K95RClMNteXxiYs
	CVP/n+2aYAx1ywVGPUqYayHOgAGEAK856lHOZdEbDAEVfj2+rx0m4Rm5hspVxSSu8i52URmXTt0
	OuyJi/IIuEVM/dBEMBtjAKW7+qHc=
X-TMASE-SNAP-Result: 1.821001.0001-0-1-22:0,33:0,34:0-0
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Tue, 26 Sep 2023 08:25:20 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/188229

From: Wang Mingyu <wangmy@fujitsu.com>

License-Update: split license file in standard BSD 3-clause and bundled.

Changelog:
==========
    Python 3.12.0 support.
    Cython 3.0.0 compatibility.
    Use of the Meson build system
    Updated SIMD support
    f2py fixes, meson and bind(x) support
    Support for the updated Accelerate BLAS/LAPACK library

Signed-off-by: Wang Mingyu <wangmy@fujitsu.com>
---
 .../{python3-numpy_1.25.2.bb => python3-numpy_1.26.0.bb}      | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)
 rename meta/recipes-devtools/python/{python3-numpy_1.25.2.bb => python3-numpy_1.26.0.bb} (94%)

diff --git a/meta/recipes-devtools/python/python3-numpy_1.25.2.bb b/meta/recipes-devtools/python/python3-numpy_1.26.0.bb
similarity index 94%
rename from meta/recipes-devtools/python/python3-numpy_1.25.2.bb
rename to meta/recipes-devtools/python/python3-numpy_1.26.0.bb
index 4793b23a38..e94e431209 100644
--- a/meta/recipes-devtools/python/python3-numpy_1.25.2.bb
+++ b/meta/recipes-devtools/python/python3-numpy_1.26.0.bb
@@ -3,7 +3,7 @@ HOMEPAGE = "https://numpy.org/"
 DESCRIPTION = "NumPy is the fundamental package needed for scientific computing with Python."
 SECTION = "devel/python"
 LICENSE = "BSD-3-Clause & BSD-2-Clause & PSF-2.0 & Apache-2.0 & MIT"
-LIC_FILES_CHKSUM = "file://LICENSE.txt;md5=7614a5b0073688df53773ec6ec7fe81d"
+LIC_FILES_CHKSUM = "file://LICENSE.txt;md5=a752eb20459cf74a9d84ee4825e8317c"
 
 SRCNAME = "numpy"
 
@@ -13,7 +13,7 @@ SRC_URI = "${GITHUB_BASE_URI}/download/v${PV}/${SRCNAME}-${PV}.tar.gz \
            file://disable_blas.patch \
            file://run-ptest \
            "
-SRC_URI[sha256sum] = "fd608e19c8d7c55021dffd43bfe5492fab8cc105cc8986f813f8c3c048b38760"
+SRC_URI[sha256sum] = "f93fc78fe8bf15afe2b8d6b6499f1c73953169fad1e9a8dd086cdff3190e7fdf"
 
 GITHUB_BASE_URI = "https://github.com/numpy/numpy/releases"
 UPSTREAM_CHECK_REGEX = "releases/tag/v?(?P<pver>\d+(\.\d+)+)$"
-- 
2.34.1


