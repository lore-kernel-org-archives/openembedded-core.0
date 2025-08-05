Return-Path: <liuyd.fnst@fujitsu.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id A6911C87FD1
	for <webhook@archiver.kernel.org>; Wed,  6 Aug 2025 10:24:41 +0000 (UTC)
Received: from esa3.hc1455-7.c3s2.iphmx.com (esa3.hc1455-7.c3s2.iphmx.com [207.54.90.49])
 by mx.groups.io with SMTP id smtpd.web11.22087.1754475871623814231
 for <openembedded-core@lists.openembedded.org>;
 Wed, 06 Aug 2025 03:24:32 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@fujitsu.com header.s=fj2 header.b=ZNszgaVO;
 spf=pass (domain: fujitsu.com, ip: 207.54.90.49, mailfrom: liuyd.fnst@fujitsu.com)
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
  d=fujitsu.com; i=@fujitsu.com; q=dns/txt; s=fj2;
  t=1754475873; x=1786011873;
  h=from:to:cc:subject:date:message-id:in-reply-to:
   references:mime-version:content-transfer-encoding;
  bh=9BdERI9fN+SbEMw8tLGRtFUx34Uk79v/ARuevORwdb8=;
  b=ZNszgaVOvIafAbXGa9F0LeaO2xKuxag3aZ9a87ODX7kUhcGoxNgCCfEN
   JMC6ay0mxbhJjoqIOu7sCky6sTiQ4K+RmmRcxcD3NZramD3Z3OUm6ICTO
   8KSv2X82vW+vN6LMqztcrlYrqj7w1vaSkTZrI6ifj3H/TQPlKeR49kr+s
   o8Lq/r2WF3zbCDggCiqUrhlFKsv9o2Ou/kKdyDtB7aUgWWbWdgaAIARt2
   A/MR/iQLZ3XDm6LNtZRdTw8NT+FaQoiRhi3OJMIEpeZzI6mdtMiIv3hGd
   sVJQ7s3jnZoxPxYPO4GfmO9iELTlj8dykRnPFKjEaOMPdWnIKvZAAKGtR
   Q==;
X-CSE-ConnectionGUID: 0HitfgbeTuKWtI58g3wuEw==
X-CSE-MsgGUID: 4+0sMxT6Tz+fJi/B29qM3A==
X-IronPort-AV: E=McAfee;i="6800,10657,11513"; a="208595719"
X-IronPort-AV: E=Sophos;i="6.17,268,1747666800"; 
   d="scan'208";a="208595719"
Received: from unknown (HELO az2uksmgr2.o.css.fujitsu.com) ([52.151.125.19])
  by esa3.hc1455-7.c3s2.iphmx.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 06 Aug 2025 19:24:22 +0900
Received: from az2uksmgm3.o.css.fujitsu.com (unknown [10.151.22.200])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by az2uksmgr2.o.css.fujitsu.com (Postfix) with ESMTPS id A103E8204D6
	for <openembedded-core@lists.openembedded.org>; Wed,  6 Aug 2025 10:24:20 +0000 (UTC)
Received: from az2uksmom1.o.css.fujitsu.com (az2uksmom1.o.css.fujitsu.com [10.151.22.202])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by az2uksmgm3.o.css.fujitsu.com (Postfix) with ESMTPS id 5D4F1C07165
	for <openembedded-core@lists.openembedded.org>; Wed,  6 Aug 2025 10:24:20 +0000 (UTC)
Received: from edo.cn.fujitsu.com (edo.cn.fujitsu.com [10.167.33.5])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits))
	(No client certificate requested)
	by az2uksmom1.o.css.fujitsu.com (Postfix) with ESMTPS id 5685E1800178
	for <openembedded-core@lists.openembedded.org>; Wed,  6 Aug 2025 10:24:18 +0000 (UTC)
Received: from G08FNSTD190088.g08.fujitsu.local (unknown [10.193.129.116])
	by edo.cn.fujitsu.com (Postfix) with ESMTP id F21F31A00E9;
	Tue,  5 Aug 2025 17:06:41 +0800 (CST)
From: Liu Yiding <liuyd.fnst@fujitsu.com>
To: openembedded-core@lists.openembedded.org
Cc: Liu Yiding <liuyd.fnst@fujitsu.com>
Subject: [OE-core] [PATCH 3/9] vulkan-tools: upgrade 1.4.313 -> 1.4.321
Date: Tue,  5 Aug 2025 17:06:17 +0800
Message-ID: <20250805090624.711-3-liuyd.fnst@fujitsu.com>
X-Mailer: git-send-email 2.49.0.windows.1
In-Reply-To: <20250805090624.711-1-liuyd.fnst@fujitsu.com>
References: <20250805090624.711-1-liuyd.fnst@fujitsu.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Wed, 06 Aug 2025 10:24:41 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/221530

Changelog:
https://github.com/KhronosGroup/Vulkan-Tools/compare/vulkan-sdk-1.4.313.0...vulkan-sdk-1.4.321.0

Signed-off-by: Liu Yiding <liuyd.fnst@fujitsu.com>
---
 .../{vulkan-tools_1.4.313.0.bb => vulkan-tools_1.4.321.0.bb}  | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)
 rename meta/recipes-graphics/vulkan/{vulkan-tools_1.4.313.0.bb => vulkan-tools_1.4.321.0.bb} (94%)

diff --git a/meta/recipes-graphics/vulkan/vulkan-tools_1.4.313.0.bb b/meta/recipes-graphics/vulkan/vulkan-tools_1.4.321.0.bb
similarity index 94%
rename from meta/recipes-graphics/vulkan/vulkan-tools_1.4.313.0.bb
rename to meta/recipes-graphics/vulkan/vulkan-tools_1.4.321.0.bb
index c73e5caa13..26c196336e 100644
--- a/meta/recipes-graphics/vulkan/vulkan-tools_1.4.313.0.bb
+++ b/meta/recipes-graphics/vulkan/vulkan-tools_1.4.321.0.bb
@@ -6,8 +6,8 @@ SECTION = "libs"
 
 LICENSE = "Apache-2.0"
 LIC_FILES_CHKSUM = "file://LICENSE.txt;md5=3b83ef96387f14655fc854ddc3c6bd57"
-SRC_URI = "git://github.com/KhronosGroup/Vulkan-Tools.git;branch=vulkan-sdk-1.4.313;protocol=https"
-SRCREV = "ad2f0170f9466fadd96e3fdd65fad02cd3a3739b"
+SRC_URI = "git://github.com/KhronosGroup/Vulkan-Tools.git;branch=vulkan-sdk-1.4.321;protocol=https"
+SRCREV = "06ae73a3dc3a03466817d8370355203dac7b79b1"
 
 inherit cmake features_check pkgconfig
 ANY_OF_DISTRO_FEATURES = "x11 wayland"
-- 
2.43.0


