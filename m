Return-Path: <liuyd.fnst@fujitsu.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 7A190C88E6F
	for <webhook@archiver.kernel.org>; Mon, 26 Jan 2026 08:14:15 +0000 (UTC)
Received: from esa5.hc1455-7.c3s2.iphmx.com (esa5.hc1455-7.c3s2.iphmx.com [68.232.139.130])
 by mx.groups.io with SMTP id smtpd.msgproc02-g2.15057.1769415247488678382
 for <openembedded-core@lists.openembedded.org>;
 Mon, 26 Jan 2026 00:14:08 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@fujitsu.com header.s=fj2 header.b=rbGUFAWU;
 spf=pass (domain: fujitsu.com, ip: 68.232.139.130, mailfrom: liuyd.fnst@fujitsu.com)
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
  d=fujitsu.com; i=@fujitsu.com; q=dns/txt; s=fj2;
  t=1769415248; x=1800951248;
  h=from:to:subject:date:message-id:mime-version:
   content-transfer-encoding;
  bh=PryYwctob656hHPDA185DZtMyZok6rTAoA0No7PvlyM=;
  b=rbGUFAWU74lrGFhPbR2xzCIm2cRvWh1Kk8dtTQk9Wpvav4A+koxa6KD6
   FQ88SEdzrMeKdFtondjmnqMSEZBFoFyVb9gN1Smi08iSj/4twgJks51ch
   uSIO1lMW9QJpvnxerLkRkFFAphrLeG7MpNuR7T6yL2ZG53I9UuHNt6QSZ
   v7OqtCmArpjuEDnFaS/Qzf4c7BzAeXiDaxle8w0vXDPHmXBNGMfubvnBh
   3UofRmbt23i+rbSjKW1ebSe7onN4BevZWNdNlv/6ZrM/xAhp+IqD3VWfV
   Eas9wh8VodyrMEQfgQP2X2O4yHaS4r2QwRYQBIGSz1Y4+Cf2k5+8MKd6r
   g==;
X-CSE-ConnectionGUID: Cnzi0rqeQ1CAEMHseCIyqw==
X-CSE-MsgGUID: XOXg7mYLQzWc3fElJIoi3Q==
X-IronPort-AV: E=McAfee;i="6800,10657,11682"; a="226506041"
X-IronPort-AV: E=Sophos;i="6.21,254,1763391600"; 
   d="scan'208";a="226506041"
Received: from unknown (HELO az2nlsmgr1.o.css.fujitsu.com) ([51.138.80.169])
  by esa5.hc1455-7.c3s2.iphmx.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 26 Jan 2026 17:14:06 +0900
Received: from az2nlsmgm4.fujitsu.com (unknown [10.150.26.204])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by az2nlsmgr1.o.css.fujitsu.com (Postfix) with ESMTPS id CF44B1C00092
	for <openembedded-core@lists.openembedded.org>; Mon, 26 Jan 2026 08:14:05 +0000 (UTC)
Received: from az2uksmom4.o.css.fujitsu.com (az2uksmom4.o.css.fujitsu.com [10.151.22.204])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by az2nlsmgm4.fujitsu.com (Postfix) with ESMTPS id 7DDC010003A9
	for <openembedded-core@lists.openembedded.org>; Mon, 26 Jan 2026 08:14:05 +0000 (UTC)
Received: from G08FNSTD190101.g08.fujitsu.local (unknown [10.193.135.3])
	by az2uksmom4.o.css.fujitsu.com (Postfix) with ESMTP id 2BE17405532
	for <openembedded-core@lists.openembedded.org>; Mon, 26 Jan 2026 08:14:02 +0000 (UTC)
From: Liu Yiding <liuyd.fnst@fujitsu.com>
To: openembedded-core@lists.openembedded.org
Subject: [OE-core][PATCH] cmake: upgrade 4.2.1 -> 4.2.2
Date: Mon, 26 Jan 2026 16:13:57 +0800
Message-ID: <20260126081357.4541-1-liuyd.fnst@fujitsu.com>
X-Mailer: git-send-email 2.43.0
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Mon, 26 Jan 2026 08:14:15 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/229970

Changelog:
https://cmake.org/cmake/help/v4.2/release/4.2.html#id2

Signed-off-by: Liu Yiding <liuyd.fnst@fujitsu.com>
---
 .../cmake/{cmake-native_4.2.1.bb => cmake-native_4.2.2.bb}      | 0
 meta/recipes-devtools/cmake/cmake.inc                           | 2 +-
 meta/recipes-devtools/cmake/{cmake_4.2.1.bb => cmake_4.2.2.bb}  | 0
 3 files changed, 1 insertion(+), 1 deletion(-)
 rename meta/recipes-devtools/cmake/{cmake-native_4.2.1.bb => cmake-native_4.2.2.bb} (100%)
 rename meta/recipes-devtools/cmake/{cmake_4.2.1.bb => cmake_4.2.2.bb} (100%)

diff --git a/meta/recipes-devtools/cmake/cmake-native_4.2.1.bb b/meta/recipes-devtools/cmake/cmake-native_4.2.2.bb
similarity index 100%
rename from meta/recipes-devtools/cmake/cmake-native_4.2.1.bb
rename to meta/recipes-devtools/cmake/cmake-native_4.2.2.bb
diff --git a/meta/recipes-devtools/cmake/cmake.inc b/meta/recipes-devtools/cmake/cmake.inc
index d120638b1b..ee771a1d64 100644
--- a/meta/recipes-devtools/cmake/cmake.inc
+++ b/meta/recipes-devtools/cmake/cmake.inc
@@ -19,7 +19,7 @@ CMAKE_MAJOR_VERSION = "${@'.'.join(d.getVar('PV').split('.')[0:2])}"
 SRC_URI = "https://cmake.org/files/v${CMAKE_MAJOR_VERSION}/cmake-${PV}.tar.gz \
            "
 
-SRC_URI[sha256sum] = "414aacfac54ba0e78e64a018720b64ed6bfca14b587047b8b3489f407a14a070"
+SRC_URI[sha256sum] = "bbda94dd31636e89eb1cc18f8355f6b01d9193d7676549fba282057e8b730f58"
 
 UPSTREAM_CHECK_REGEX = "cmake-(?P<pver>\d+(\.\d+)+)\.tar"
 
diff --git a/meta/recipes-devtools/cmake/cmake_4.2.1.bb b/meta/recipes-devtools/cmake/cmake_4.2.2.bb
similarity index 100%
rename from meta/recipes-devtools/cmake/cmake_4.2.1.bb
rename to meta/recipes-devtools/cmake/cmake_4.2.2.bb
-- 
2.43.0


