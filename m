Return-Path: <wangmy@fujitsu.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 7E974C04A94
	for <webhook@archiver.kernel.org>; Tue, 27 Jun 2023 07:19:35 +0000 (UTC)
Received: from esa9.hc1455-7.c3s2.iphmx.com (esa9.hc1455-7.c3s2.iphmx.com [139.138.36.223])
 by mx.groups.io with SMTP id smtpd.web10.7578.1687850373677748016
 for <openembedded-core@lists.openembedded.org>;
 Tue, 27 Jun 2023 00:19:34 -0700
Authentication-Results: mx.groups.io;
 dkim=missing; spf=pass (domain: fujitsu.com, ip: 139.138.36.223, mailfrom: wangmy@fujitsu.com)
X-IronPort-AV: E=McAfee;i="6600,9927,10753"; a="110616506"
X-IronPort-AV: E=Sophos;i="6.01,161,1684767600"; 
   d="scan'208";a="110616506"
Received: from unknown (HELO oym-r1.gw.nic.fujitsu.com) ([210.162.30.89])
  by esa9.hc1455-7.c3s2.iphmx.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 27 Jun 2023 16:19:32 +0900
Received: from oym-m4.gw.nic.fujitsu.com (oym-nat-oym-m4.gw.nic.fujitsu.com [192.168.87.61])
	by oym-r1.gw.nic.fujitsu.com (Postfix) with ESMTP id 33EF1D29F4
	for <openembedded-core@lists.openembedded.org>; Tue, 27 Jun 2023 16:19:30 +0900 (JST)
Received: from kws-ab4.gw.nic.fujitsu.com (kws-ab4.gw.nic.fujitsu.com [192.51.206.22])
	by oym-m4.gw.nic.fujitsu.com (Postfix) with ESMTP id 629DFD540F
	for <openembedded-core@lists.openembedded.org>; Tue, 27 Jun 2023 16:19:29 +0900 (JST)
Received: from localhost.localdomain (unknown [10.167.225.33])
	by kws-ab4.gw.nic.fujitsu.com (Postfix) with ESMTP id D37196C833;
	Tue, 27 Jun 2023 16:19:28 +0900 (JST)
From: wangmy@fujitsu.com
To: openembedded-core@lists.openembedded.org
Cc: Wang Mingyu <wangmy@fujitsu.com>
Subject: [OE-core] [PATCH] python3-numpy: upgrade 1.24.3 -> 1.25.0
Date: Tue, 27 Jun 2023 15:17:14 +0800
Message-Id: <1687850250-20040-17-git-send-email-wangmy@fujitsu.com>
X-Mailer: git-send-email 1.8.3.1
In-Reply-To: <1687850250-20040-1-git-send-email-wangmy@fujitsu.com>
References: <1687850250-20040-1-git-send-email-wangmy@fujitsu.com>
X-TM-AS-GCONF: 00
X-TM-AS-Product-Ver: IMSS-9.1.0.1417-9.0.0.1002-27716.005
X-TM-AS-User-Approved-Sender: Yes
X-TMASE-Version: IMSS-9.1.0.1417-9.0.1002-27716.005
X-TMASE-Result: 10--6.204400-10.000000
X-TMASE-MatchedRID: u4ys6248rQyjz0nOeth/yXg2y0j5vXZGlEDhvi2wR84H4DTIEE89jCQs
	lbaUcprMBLYDz2I1D3W+020ZTJzUqu1a16oqp8B1/HTKStsDGMJHNQ8CqEKO2MC5DTEMxpeQ7m0
	K7bkUDKKKbindmE5bmMCrMSR+lfKoo05cjFUN5oSDIpcBQ49iRBCE2NlBjIjcUJ52LFhfM6s0F0
	5EjNwjhuZZshVidcxpyfiuwBFHD/ssYUTfBC9ISkhwlOfYeSqxrixttRG+E/OBbptjxI6rdaPFj
	JEFr+olwXCBO/GKkVqOhzOa6g8KrfjL8HudVysh3Fk1MTgN+kp/TV0bUdPqw8nGQVW6IJKe0zZw
	7I8kzsU=
X-TMASE-SNAP-Result: 1.821001.0001-0-1-22:0,33:0,34:0-0
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Tue, 27 Jun 2023 07:19:35 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/183457

From: Wang Mingyu <wangmy@fujitsu.com>

License-Update: Copyright year updated to 2023.

Changelog:
===========
    Support for MUSL, there are now MUSL wheels.
    Support the Fujitsu C/C++ compiler.
    Object arrays are now supported in einsum
    Support for inplace matrix multiplication (@=).

Signed-off-by: Wang Mingyu <wangmy@fujitsu.com>
---
 .../{python3-numpy_1.24.3.bb => python3-numpy_1.25.0.bb}      | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)
 rename meta/recipes-devtools/python/{python3-numpy_1.24.3.bb => python3-numpy_1.25.0.bb} (94%)

diff --git a/meta/recipes-devtools/python/python3-numpy_1.24.3.bb b/meta/recipes-devtools/python/python3-numpy_1.25.0.bb
similarity index 94%
rename from meta/recipes-devtools/python/python3-numpy_1.24.3.bb
rename to meta/recipes-devtools/python/python3-numpy_1.25.0.bb
index 710af5fe8f..d9d37dbf36 100644
--- a/meta/recipes-devtools/python/python3-numpy_1.24.3.bb
+++ b/meta/recipes-devtools/python/python3-numpy_1.25.0.bb
@@ -3,7 +3,7 @@ HOMEPAGE = "https://numpy.org/"
 DESCRIPTION = "NumPy is the fundamental package needed for scientific computing with Python."
 SECTION = "devel/python"
 LICENSE = "BSD-3-Clause & BSD-2-Clause & PSF-2.0 & Apache-2.0 & MIT"
-LIC_FILES_CHKSUM = "file://LICENSE.txt;md5=8026691468924fb6ec155dadfe2a1a7f"
+LIC_FILES_CHKSUM = "file://LICENSE.txt;md5=7614a5b0073688df53773ec6ec7fe81d"
 
 SRCNAME = "numpy"
 
@@ -12,7 +12,7 @@ SRC_URI = "${GITHUB_BASE_URI}/download/v${PV}/${SRCNAME}-${PV}.tar.gz \
            file://0001-numpy-core-Define-RISCV-32-support.patch \
            file://run-ptest \
            "
-SRC_URI[sha256sum] = "ab344f1bf21f140adab8e47fdbc7c35a477dc01408791f8ba00d018dd0bc5155"
+SRC_URI[sha256sum] = "f1accae9a28dc3cda46a91de86acf69de0d1b5f4edd44a9b0c3ceb8036dfff19"
 
 GITHUB_BASE_URI = "https://github.com/numpy/numpy/releases"
 UPSTREAM_CHECK_REGEX = "releases/tag/v?(?P<pver>\d+(\.\d+)+)$"
-- 
2.34.1


