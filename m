Return-Path: <wangmy@fujitsu.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id CA486C7115E
	for <webhook@archiver.kernel.org>; Mon, 16 Jun 2025 09:17:02 +0000 (UTC)
Received: from esa4.hc1455-7.c3s2.iphmx.com (esa4.hc1455-7.c3s2.iphmx.com [68.232.139.117])
 by mx.groups.io with SMTP id smtpd.web10.26274.1750065419887538680
 for <openembedded-core@lists.openembedded.org>;
 Mon, 16 Jun 2025 02:17:00 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@fujitsu.com header.s=fj2 header.b=hEWmJAsZ;
 spf=pass (domain: fujitsu.com, ip: 68.232.139.117, mailfrom: wangmy@fujitsu.com)
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
  d=fujitsu.com; i=@fujitsu.com; q=dns/txt; s=fj2;
  t=1750065420; x=1781601420;
  h=from:to:cc:subject:date:message-id:in-reply-to:
   references:mime-version:content-transfer-encoding;
  bh=Vqbo0oom4w4A+xtCI/kq/GaEQEx8Lp7Im6Xpb5dpBKM=;
  b=hEWmJAsZKVwXq/EOTpEttFgy/zVfaOpiS9vCJ2O4X8ZVmxDNbJe7bny0
   Unl9K2dEYggDL9ET3SjAJO1fT3Cw1z9oMDdJiBAit/AVr131pZhv8TS3R
   wqYxsRqgiOV34p+5O1oBCtoLNud0lNWNfEgB8N6F4aBDRbgQOf2BdC8zG
   07U0tcdBuAI6FBw60ji/dIuk+XPTOenVOD7zXI3TgZ6/Ain2BrOtSuFpA
   ic9+0Ro8JpIeAFPKKHnoVYTQGrw29Updp/P8PVwMu5XHBcF2dQsKr6FSz
   bSU2Ta8U5j8ZcGtkx8y1eRGLTNfWeW1Rcd8tDrE8nhmZDyVHb7tsiIfo1
   g==;
X-CSE-ConnectionGUID: 1c72Rr0ORzSiWsJOKPpNNw==
X-CSE-MsgGUID: eOkUQfDsQzCTaSESlmWxVw==
X-IronPort-AV: E=McAfee;i="6800,10657,11465"; a="203350730"
X-IronPort-AV: E=Sophos;i="6.16,240,1744038000"; 
   d="scan'208";a="203350730"
Received: from unknown (HELO oym-r4.gw.nic.fujitsu.com) ([210.162.30.92])
  by esa4.hc1455-7.c3s2.iphmx.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 16 Jun 2025 18:16:57 +0900
Received: from oym-m4.gw.nic.fujitsu.com (oym-nat-oym-m4.gw.nic.fujitsu.com [192.168.87.61])
	by oym-r4.gw.nic.fujitsu.com (Postfix) with ESMTP id 99B02D8E64
	for <openembedded-core@lists.openembedded.org>; Mon, 16 Jun 2025 18:16:54 +0900 (JST)
Received: from edo.cn.fujitsu.com (edo.cn.fujitsu.com [10.167.33.5])
	by oym-m4.gw.nic.fujitsu.com (Postfix) with ESMTP id 41807D4C03
	for <openembedded-core@lists.openembedded.org>; Mon, 16 Jun 2025 18:16:54 +0900 (JST)
Received: from G08FNSTD200057.g08.fujitsu.local (unknown [10.193.128.200])
	by edo.cn.fujitsu.com (Postfix) with ESMTP id CE3381A000B;
	Mon, 16 Jun 2025 17:16:53 +0800 (CST)
From: Wang Mingyu < wangmy@fujitsu.com>
To: openembedded-core@lists.openembedded.org
Cc: Wang Mingyu <wangmy@fujitsu.com>
Subject: [OE-core] [PATCH 17/24] python3-numpy: upgrade 2.2.6 -> 2.3.0
Date: Mon, 16 Jun 2025 17:16:35 +0800
Message-ID: <20250616091643.918-17-wangmy@fujitsu.com>
X-Mailer: git-send-email 2.49.0.windows.1
In-Reply-To: <20250616091643.918-1-wangmy@fujitsu.com>
References: <20250616091643.918-1-wangmy@fujitsu.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Mon, 16 Jun 2025 09:17:02 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/218793

From: Wang Mingyu <wangmy@fujitsu.com>

License-Update: Copyright year updated to 2025

Signed-off-by: Wang Mingyu <wangmy@fujitsu.com>
---
 .../python/{python3-numpy_2.2.6.bb => python3-numpy_2.3.0.bb} | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)
 rename meta/recipes-devtools/python/{python3-numpy_2.2.6.bb => python3-numpy_2.3.0.bb} (94%)

diff --git a/meta/recipes-devtools/python/python3-numpy_2.2.6.bb b/meta/recipes-devtools/python/python3-numpy_2.3.0.bb
similarity index 94%
rename from meta/recipes-devtools/python/python3-numpy_2.2.6.bb
rename to meta/recipes-devtools/python/python3-numpy_2.3.0.bb
index 10468d6850..e77a4ba5c3 100644
--- a/meta/recipes-devtools/python/python3-numpy_2.2.6.bb
+++ b/meta/recipes-devtools/python/python3-numpy_2.3.0.bb
@@ -3,7 +3,7 @@ HOMEPAGE = "https://numpy.org/"
 DESCRIPTION = "NumPy is the fundamental package needed for scientific computing with Python."
 SECTION = "devel/python"
 LICENSE = "BSD-3-Clause & BSD-2-Clause & PSF-2.0 & Apache-2.0 & MIT"
-LIC_FILES_CHKSUM = "file://LICENSE.txt;md5=1de863c37a83e71b1e97b64d036ea78b"
+LIC_FILES_CHKSUM = "file://LICENSE.txt;md5=26080bf81b2662c7119d3ef28ae197fd"
 
 SRCNAME = "numpy"
 
@@ -12,7 +12,7 @@ SRC_URI = "${GITHUB_BASE_URI}/download/v${PV}/${SRCNAME}-${PV}.tar.gz \
            file://fix_reproducibility.patch \
            file://run-ptest \
            "
-SRC_URI[sha256sum] = "e29554e2bef54a90aa5cc07da6ce955accb83f21ab5de01a62c8478897b264fd"
+SRC_URI[sha256sum] = "581f87f9e9e9db2cba2141400e160e9dd644ee248788d6f90636eeb8fd9260a6"
 
 GITHUB_BASE_URI = "https://github.com/numpy/numpy/releases"
 UPSTREAM_CHECK_REGEX = "releases/tag/v?(?P<pver>\d+(\.\d+)+)$"
-- 
2.43.0


