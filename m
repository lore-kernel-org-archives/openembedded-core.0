Return-Path: <wangmy@fujitsu.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 7B260C3ABC3
	for <webhook@archiver.kernel.org>; Mon, 12 May 2025 09:04:12 +0000 (UTC)
Received: from esa9.hc1455-7.c3s2.iphmx.com (esa9.hc1455-7.c3s2.iphmx.com [139.138.36.223])
 by mx.groups.io with SMTP id smtpd.web10.45924.1747040648907028522
 for <openembedded-core@lists.openembedded.org>;
 Mon, 12 May 2025 02:04:10 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@fujitsu.com header.s=fj2 header.b=DSGzoOFY;
 spf=pass (domain: fujitsu.com, ip: 139.138.36.223, mailfrom: wangmy@fujitsu.com)
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
  d=fujitsu.com; i=@fujitsu.com; q=dns/txt; s=fj2;
  t=1747040650; x=1778576650;
  h=from:to:cc:subject:date:message-id:in-reply-to:
   references;
  bh=7pJUymFCKRFoUj0PM2y4cPXfUaW+pBcR9SH5g9Z01rk=;
  b=DSGzoOFYSvy7ZmRwxa908RtgV6XWM9kqdCq9jLWXmtMeYxgQgGW4n8NB
   wmt4huKSTEEn8yHQ793UESi04bErP/R7TEKPpLZRxJLYHC5wWOm9+ORYc
   sVpF3vD0x8tmpLn1inqNyM1D/kS6fcpdSwKeqVv22BL0bhmUQt+UNjxl4
   qvsv1HVCfbljKCo/gJ/XjMbOCCuaBZn/uoHBbcsonOCjYSpfRL7YqJiI7
   AENZkQqn0jz2wWFbP8/PFFwK4JdCoCa593FyYXUCcyVHEgsPNM+1N5rMd
   XP3iJn3/kqGxQiVdsrAu8w4/qE0qVP+O7gscJGfO2ZydymOCde3yMfOSe
   w==;
X-CSE-ConnectionGUID: Tpn+WfsrRSuknR+hnSG+ww==
X-CSE-MsgGUID: uAX+cbshTAqeZfiujD/tIA==
X-IronPort-AV: E=McAfee;i="6700,10204,11430"; a="187549326"
X-IronPort-AV: E=Sophos;i="6.15,281,1739804400"; 
   d="scan'208";a="187549326"
Received: from unknown (HELO yto-r1.gw.nic.fujitsu.com) ([218.44.52.217])
  by esa9.hc1455-7.c3s2.iphmx.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 12 May 2025 18:04:07 +0900
Received: from yto-m4.gw.nic.fujitsu.com (yto-nat-yto-m4.gw.nic.fujitsu.com [192.168.83.67])
	by yto-r1.gw.nic.fujitsu.com (Postfix) with ESMTP id 71F8CD6F0B
	for <openembedded-core@lists.openembedded.org>; Mon, 12 May 2025 18:04:05 +0900 (JST)
Received: from edo.cn.fujitsu.com (edo.cn.fujitsu.com [10.167.33.5])
	by yto-m4.gw.nic.fujitsu.com (Postfix) with ESMTP id 3DDD9D5040
	for <openembedded-core@lists.openembedded.org>; Mon, 12 May 2025 18:04:05 +0900 (JST)
Received: from localhost.localdomain (unknown [10.193.128.200])
	by edo.cn.fujitsu.com (Postfix) with ESMTP id F2F121A009A;
	Mon, 12 May 2025 17:04:04 +0800 (CST)
From: wangmy@fujitsu.com
To: openembedded-core@lists.openembedded.org
Cc: Wang Mingyu <wangmy@fujitsu.com>
Subject: [OE-core] [PATCH 55/56] shaderc: upgrade 2025.1 -> 2025.2
Date: Mon, 12 May 2025 17:03:38 +0800
Message-Id: <1747040619-7566-55-git-send-email-wangmy@fujitsu.com>
X-Mailer: git-send-email 1.8.3.1
In-Reply-To: <1747040619-7566-1-git-send-email-wangmy@fujitsu.com>
References: <1747040619-7566-1-git-send-email-wangmy@fujitsu.com>
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Mon, 12 May 2025 09:04:12 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/216349

From: Wang Mingyu <wangmy@fujitsu.com>

Changelog:
===========
 - Update dependencies: Glslang, SPIRV-Tools, SPIRV-Headers
 - Supports BFloat16 floating point types

Signed-off-by: Wang Mingyu <wangmy@fujitsu.com>
---
 .../shaderc/{shaderc_2025.1.bb => shaderc_2025.2.bb}            | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)
 rename meta/recipes-graphics/shaderc/{shaderc_2025.1.bb => shaderc_2025.2.bb} (95%)

diff --git a/meta/recipes-graphics/shaderc/shaderc_2025.1.bb b/meta/recipes-graphics/shaderc/shaderc_2025.2.bb
similarity index 95%
rename from meta/recipes-graphics/shaderc/shaderc_2025.1.bb
rename to meta/recipes-graphics/shaderc/shaderc_2025.2.bb
index e9c0ecdd37..8c451e6e46 100644
--- a/meta/recipes-graphics/shaderc/shaderc_2025.1.bb
+++ b/meta/recipes-graphics/shaderc/shaderc_2025.2.bb
@@ -6,7 +6,7 @@ HOMEPAGE = "https://github.com/google/shaderc"
 LICENSE = "Apache-2.0"
 LIC_FILES_CHKSUM = "file://LICENSE;md5=86d3f3a95c324c9479bd8986968f4327"
 
-SRCREV = "7f68b1cf6f35f518febf36d425365bb8e6ad224a"
+SRCREV = "8c269ee0fe607f2d7cac00c0cb4fa243d6a6ec26"
 SRC_URI = "git://github.com/google/shaderc.git;protocol=https;branch=main;tag=v${PV} \
            file://0001-cmake-disable-building-external-dependencies.patch \
            file://0002-libshaderc_util-fix-glslang-header-file-location.patch \
-- 
2.43.0


