Return-Path: <liuyd.fnst@fujitsu.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 2A1CBCA0EC1
	for <webhook@archiver.kernel.org>; Wed,  6 Aug 2025 08:56:21 +0000 (UTC)
Received: from esa4.hc1455-7.c3s2.iphmx.com (esa4.hc1455-7.c3s2.iphmx.com [68.232.139.117])
 by mx.groups.io with SMTP id smtpd.web11.20651.1754470569892347481
 for <openembedded-core@lists.openembedded.org>;
 Wed, 06 Aug 2025 01:56:14 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@fujitsu.com header.s=fj2 header.b=ZhwkqZqC;
 spf=pass (domain: fujitsu.com, ip: 68.232.139.117, mailfrom: liuyd.fnst@fujitsu.com)
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
  d=fujitsu.com; i=@fujitsu.com; q=dns/txt; s=fj2;
  t=1754470574; x=1786006574;
  h=from:to:cc:subject:date:message-id:in-reply-to:
   references:mime-version:content-transfer-encoding;
  bh=9BdERI9fN+SbEMw8tLGRtFUx34Uk79v/ARuevORwdb8=;
  b=ZhwkqZqCvPmikgbnAYoLJiVZuHFCpVjuX9ttlkExv3YsFASVP6/V0tsO
   dIOHN0tdqyvwDH0l0X7XclFuwDfX+O0BiK4LdrSiR7bugLN9T8yOzQzQh
   J5b6lDWbebRAwO4LHrpIEnJecangKicIIaMu0uquBdfB9fDptEteOETxM
   4TevNcvpnKvtAHm3rUO0TSOCEUZYJ+UgUPXzRWA4p/kuKWL4J/h3GsguJ
   7AReWgksCR48Ylj5TuCg/LSarRiXPCFnM6D4yaJMMoFsxq9suC4tOWkHP
   Ic0hD21zUpGV9QpBouYFFsVmZnhlwCZYE7q9phwpcSmZJf2yCpmq2S+ld
   A==;
X-CSE-ConnectionGUID: 7mn1Nw9CSTOVqKBhCGuNzQ==
X-CSE-MsgGUID: //rXSwYaRFKQYylWHaxmnQ==
X-IronPort-AV: E=McAfee;i="6800,10657,11513"; a="209137512"
X-IronPort-AV: E=Sophos;i="6.17,268,1747666800"; 
   d="scan'208";a="209137512"
Received: from unknown (HELO az2nlsmgr3.o.css.fujitsu.com) ([51.138.80.169])
  by esa4.hc1455-7.c3s2.iphmx.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 06 Aug 2025 17:56:13 +0900
Received: from az2nlsmgm4.fujitsu.com (unknown [10.150.26.204])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by az2nlsmgr3.o.css.fujitsu.com (Postfix) with ESMTPS id 17EF31000341
	for <openembedded-core@lists.openembedded.org>; Wed,  6 Aug 2025 08:56:14 +0000 (UTC)
Received: from az2nlsmom4.fujitsu.com (az2nlsmom4.o.css.fujitsu.com [10.150.26.201])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by az2nlsmgm4.fujitsu.com (Postfix) with ESMTPS id C21C11000477
	for <openembedded-core@lists.openembedded.org>; Wed,  6 Aug 2025 08:56:13 +0000 (UTC)
Received: from edo.cn.fujitsu.com (edo.cn.fujitsu.com [10.167.33.5])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits))
	(No client certificate requested)
	by az2nlsmom4.fujitsu.com (Postfix) with ESMTPS id C37C7200233A
	for <openembedded-core@lists.openembedded.org>; Wed,  6 Aug 2025 08:56:11 +0000 (UTC)
Received: from G08FNSTD190088.g08.fujitsu.local (unknown [10.193.129.116])
	by edo.cn.fujitsu.com (Postfix) with ESMTP id CFE121A016C;
	Wed,  6 Aug 2025 16:39:45 +0800 (CST)
From: Liu Yiding <liuyd.fnst@fujitsu.com>
To: openembedded-core@lists.openembedded.org
Cc: Liu Yiding <liuyd.fnst@fujitsu.com>
Subject: [OE-core] [PATCH 3/9] vulkan-tools: upgrade 1.4.313 -> 1.4.321
Date: Wed,  6 Aug 2025 16:39:23 +0800
Message-ID: <20250806083929.747-3-liuyd.fnst@fujitsu.com>
X-Mailer: git-send-email 2.49.0.windows.1
In-Reply-To: <20250806083929.747-1-liuyd.fnst@fujitsu.com>
References: <20250806083929.747-1-liuyd.fnst@fujitsu.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Wed, 06 Aug 2025 08:56:21 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/221510

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


