Return-Path: <wangmy@fujitsu.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 1EBC0C0015E
	for <webhook@archiver.kernel.org>; Tue,  1 Aug 2023 07:41:58 +0000 (UTC)
Received: from esa8.hc1455-7.c3s2.iphmx.com (esa8.hc1455-7.c3s2.iphmx.com [139.138.61.253])
 by mx.groups.io with SMTP id smtpd.web11.7592.1690875711348803815
 for <openembedded-core@lists.openembedded.org>;
 Tue, 01 Aug 2023 00:41:55 -0700
Authentication-Results: mx.groups.io;
 dkim=none (message not signed); spf=pass (domain: fujitsu.com, ip: 139.138.61.253, mailfrom: wangmy@fujitsu.com)
X-IronPort-AV: E=McAfee;i="6600,9927,10788"; a="114651491"
X-IronPort-AV: E=Sophos;i="6.01,246,1684767600"; 
   d="scan'208";a="114651491"
Received: from unknown (HELO oym-r1.gw.nic.fujitsu.com) ([210.162.30.89])
  by esa8.hc1455-7.c3s2.iphmx.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 01 Aug 2023 16:41:53 +0900
Received: from oym-m3.gw.nic.fujitsu.com (oym-nat-oym-m3.gw.nic.fujitsu.com [192.168.87.60])
	by oym-r1.gw.nic.fujitsu.com (Postfix) with ESMTP id 01F42D29E6
	for <openembedded-core@lists.openembedded.org>; Tue,  1 Aug 2023 16:41:52 +0900 (JST)
Received: from aks-ab1.gw.nic.fujitsu.com (aks-ab1.gw.nic.fujitsu.com [192.51.207.11])
	by oym-m3.gw.nic.fujitsu.com (Postfix) with ESMTP id 3603AD9487
	for <openembedded-core@lists.openembedded.org>; Tue,  1 Aug 2023 16:41:51 +0900 (JST)
Received: from localhost.localdomain (unknown [10.167.225.33])
	by aks-ab1.gw.nic.fujitsu.com (Postfix) with ESMTP id 4CF3D2FC86F7;
	Tue,  1 Aug 2023 16:41:50 +0900 (JST)
From: wangmy@fujitsu.com
To: openembedded-core@lists.openembedded.org
Cc: Wang Mingyu <wangmy@fujitsu.com>
Subject: [OE-core] [PATCH] shaderc: upgrade 2023.4 -> 2023.5
Date: Tue,  1 Aug 2023 15:41:26 +0800
Message-Id: <1690875687-21573-16-git-send-email-wangmy@fujitsu.com>
X-Mailer: git-send-email 1.8.3.1
In-Reply-To: <1690875687-21573-1-git-send-email-wangmy@fujitsu.com>
References: <1690875687-21573-1-git-send-email-wangmy@fujitsu.com>
X-TM-AS-GCONF: 00
X-TM-AS-Product-Ver: IMSS-9.1.0.1408-9.0.0.1002-27786.005
X-TM-AS-User-Approved-Sender: Yes
X-TMASE-Version: IMSS-9.1.0.1408-9.0.1002-27786.005
X-TMASE-Result: 10--1.716700-10.000000
X-TMASE-MatchedRID: +qH7TW9/Rkejz0nOeth/yUIIxwDaU5mrUuVVTCQr62oOpEDEHLRZTW9c
	VO2+AmYa+FyTwBk2ojzuAEy53Y4tLqwJPqLba3ZJdXu122+iJtph0Eb5uGGI1JTx+2LIqNmt0yO
	PBv1B9XYILxoCYZ47qVXTT7CHDFVDL/tBTZzO5Q2dVNZaI2n6/zim0TkqdUte6Yep/pka8JHW9n
	uzdghUMjeWrdgSBjomOuZvZnhv1kuT4QuBHRkf9jo39wOA02Lhcycts50tWT8CGfvnVpx+256ba
	/D5x6cp4vM1YF6AJbbieYV7J8ae4wtuKBGekqUpnH7sbImOEBRmsywTx857T/+D/x8s7nWi9Tqs
	ncdIXhkDPHhWoIZ+aYYPsN/qpsTDr82MnXGFL3AuhlA6oUJQNKo7Oo6CLEw5eav10lDVEffsfZ9
	V6Q6rCZgvUoiYqGrVm457vI8IG8B/Y4nFsBWAdD6Qrn3xh/cy
X-TMASE-SNAP-Result: 1.821001.0001-0-1-22:0,33:0,34:0-0
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Tue, 01 Aug 2023 07:41:58 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/185208

From: Wang Mingyu <wangmy@fujitsu.com>

Changelog:
==========
 - Update dependencies
 - Update to Android NDK r25c
 - Update Android API level for test project (#1333)
 - For testing, add a dependency on Abseil's C++ library
 - Fix MSVC runtime library linking in CMake (#1339)

Signed-off-by: Wang Mingyu <wangmy@fujitsu.com>
---
 .../shaderc/{shaderc_2023.4.bb => shaderc_2023.5.bb}            | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)
 rename meta/recipes-graphics/shaderc/{shaderc_2023.4.bb => shaderc_2023.5.bb} (95%)

diff --git a/meta/recipes-graphics/shaderc/shaderc_2023.4.bb b/meta/recipes-graphics/shaderc/shaderc_2023.5.bb
similarity index 95%
rename from meta/recipes-graphics/shaderc/shaderc_2023.4.bb
rename to meta/recipes-graphics/shaderc/shaderc_2023.5.bb
index 739e7ae81c..8d2f4551ab 100644
--- a/meta/recipes-graphics/shaderc/shaderc_2023.4.bb
+++ b/meta/recipes-graphics/shaderc/shaderc_2023.5.bb
@@ -6,7 +6,7 @@ HOMEPAGE = "https://github.com/google/shaderc"
 LICENSE = "Apache-2.0"
 LIC_FILES_CHKSUM = "file://LICENSE;md5=86d3f3a95c324c9479bd8986968f4327"
 
-SRCREV = "7a8b3da0583425cf511336cf3afbdcf2ebc8b36b"
+SRCREV = "7428c8d5f6b200910fbd32fa0ca0b0244ace6482"
 SRC_URI = "git://github.com/google/shaderc.git;protocol=https;branch=main \
            file://0001-cmake-disable-building-external-dependencies.patch \
            file://0002-libshaderc_util-fix-glslang-header-file-location.patch \
-- 
2.34.1


