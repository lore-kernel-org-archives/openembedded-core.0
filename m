Return-Path: <liuyd.fnst@fujitsu.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 657F8C87FD1
	for <webhook@archiver.kernel.org>; Wed,  6 Aug 2025 09:28:31 +0000 (UTC)
Received: from esa3.hc1455-7.c3s2.iphmx.com (esa3.hc1455-7.c3s2.iphmx.com [207.54.90.49])
 by mx.groups.io with SMTP id smtpd.web11.21369.1754472509600760252
 for <openembedded-core@lists.openembedded.org>;
 Wed, 06 Aug 2025 02:28:30 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@fujitsu.com header.s=fj2 header.b=KWtqIqMC;
 spf=pass (domain: fujitsu.com, ip: 207.54.90.49, mailfrom: liuyd.fnst@fujitsu.com)
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
  d=fujitsu.com; i=@fujitsu.com; q=dns/txt; s=fj2;
  t=1754472510; x=1786008510;
  h=from:to:cc:subject:date:message-id:in-reply-to:
   references:mime-version:content-transfer-encoding;
  bh=BOCPoqml1CiiOCtR7dTRmMtmTu4QwYyLIpG4XAHlSfo=;
  b=KWtqIqMCn9AsucZ6i12x650KLyXUEBW18RJt1MxpvcZsPHhVhe+Eh16M
   SkZ1WCK9DpjXAqP4mB5PTRGfbrVxe6/mNzR39NolzbRbT48iVD6favYFp
   KOQhXFUUi0QAqx5v3eDTVy+2+gA1YxOtLsmX0nxjJtDAZIMZGc/TAZdhO
   PAdlnPkaypiiw65BVIhk1oXktY8bTn8zwBN3N3zrkJxhvBYtIrDDM66Cp
   sZJH+OPkbNDglMrr25vjSX5ZZkJOzWCvuWRvmHKsS/bPlnvVfBfbRrPcO
   kLTZe01XhtMpUIisjd7sX7Ddy7WW60wlPQqF5KB3lrq4G27SaJc8A7J9p
   Q==;
X-CSE-ConnectionGUID: 0OBQ5AOzQpSCsRhbSKszrA==
X-CSE-MsgGUID: ZqOcsh2VRQmnNXwW0sBqhw==
X-IronPort-AV: E=McAfee;i="6800,10657,11513"; a="208591996"
X-IronPort-AV: E=Sophos;i="6.17,268,1747666800"; 
   d="scan'208";a="208591996"
Received: from unknown (HELO az2uksmgr1.o.css.fujitsu.com) ([52.151.125.19])
  by esa3.hc1455-7.c3s2.iphmx.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 06 Aug 2025 18:28:28 +0900
Received: from az2uksmgm1.o.css.fujitsu.com (unknown [10.151.22.198])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by az2uksmgr1.o.css.fujitsu.com (Postfix) with ESMTPS id E3B2E1C1C705
	for <openembedded-core@lists.openembedded.org>; Wed,  6 Aug 2025 09:28:27 +0000 (UTC)
Received: from az2uksmom2.o.css.fujitsu.com (az2uksmom2.o.css.fujitsu.com [10.151.22.203])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by az2uksmgm1.o.css.fujitsu.com (Postfix) with ESMTPS id 9A8C6832873
	for <openembedded-core@lists.openembedded.org>; Wed,  6 Aug 2025 09:28:27 +0000 (UTC)
Received: from edo.cn.fujitsu.com (unknown [10.167.33.5])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits))
	(No client certificate requested)
	by az2uksmom2.o.css.fujitsu.com (Postfix) with ESMTPS id 74F3814005AA
	for <openembedded-core@lists.openembedded.org>; Wed,  6 Aug 2025 08:56:08 +0000 (UTC)
Received: from G08FNSTD190088.g08.fujitsu.local (unknown [10.193.129.116])
	by edo.cn.fujitsu.com (Postfix) with ESMTP id 5021F1A016B;
	Wed,  6 Aug 2025 16:39:44 +0800 (CST)
From: Liu Yiding <liuyd.fnst@fujitsu.com>
To: openembedded-core@lists.openembedded.org
Cc: Liu Yiding <liuyd.fnst@fujitsu.com>
Subject: [OE-core] [PATCH 2/9] vulkan-loader: upgrade 1.4.313 -> 1.4.321
Date: Wed,  6 Aug 2025 16:39:22 +0800
Message-ID: <20250806083929.747-2-liuyd.fnst@fujitsu.com>
X-Mailer: git-send-email 2.49.0.windows.1
In-Reply-To: <20250806083929.747-1-liuyd.fnst@fujitsu.com>
References: <20250806083929.747-1-liuyd.fnst@fujitsu.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Wed, 06 Aug 2025 09:28:31 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/221516

Changelog:
https://github.com/KhronosGroup/Vulkan-Loader/compare/vulkan-sdk-1.4.313.0...vulkan-sdk-1.4.321.0

Signed-off-by: Liu Yiding <liuyd.fnst@fujitsu.com>
---
 ...{vulkan-loader_1.4.313.0.bb => vulkan-loader_1.4.321.0.bb} | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)
 rename meta/recipes-graphics/vulkan/{vulkan-loader_1.4.313.0.bb => vulkan-loader_1.4.321.0.bb} (95%)

diff --git a/meta/recipes-graphics/vulkan/vulkan-loader_1.4.313.0.bb b/meta/recipes-graphics/vulkan/vulkan-loader_1.4.321.0.bb
similarity index 95%
rename from meta/recipes-graphics/vulkan/vulkan-loader_1.4.313.0.bb
rename to meta/recipes-graphics/vulkan/vulkan-loader_1.4.321.0.bb
index c739ba15dc..772705dff7 100644
--- a/meta/recipes-graphics/vulkan/vulkan-loader_1.4.313.0.bb
+++ b/meta/recipes-graphics/vulkan/vulkan-loader_1.4.321.0.bb
@@ -9,8 +9,8 @@ SECTION = "libs"
 
 LICENSE = "Apache-2.0"
 LIC_FILES_CHKSUM = "file://LICENSE.txt;md5=7dbefed23242760aa3475ee42801c5ac"
-SRC_URI = "git://github.com/KhronosGroup/Vulkan-Loader.git;branch=vulkan-sdk-1.4.313;protocol=https"
-SRCREV = "fb78607414e154c7a5c01b23177ba719c8a44909"
+SRC_URI = "git://github.com/KhronosGroup/Vulkan-Loader.git;branch=vulkan-sdk-1.4.321;protocol=https"
+SRCREV = "da8d2caad9341ca8c5a7c3deba217d7da50a7c24"
 
 REQUIRED_DISTRO_FEATURES = "vulkan"
 
-- 
2.43.0


