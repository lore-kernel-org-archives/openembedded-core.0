Return-Path: <liuyd.fnst@fujitsu.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id A0B1CC87FCB
	for <webhook@archiver.kernel.org>; Wed,  6 Aug 2025 10:24:31 +0000 (UTC)
Received: from esa7.hc1455-7.c3s2.iphmx.com (esa7.hc1455-7.c3s2.iphmx.com [139.138.61.252])
 by mx.groups.io with SMTP id smtpd.web11.22085.1754475859351654267
 for <openembedded-core@lists.openembedded.org>;
 Wed, 06 Aug 2025 03:24:21 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@fujitsu.com header.s=fj2 header.b=JZZQfG1/;
 spf=pass (domain: fujitsu.com, ip: 139.138.61.252, mailfrom: liuyd.fnst@fujitsu.com)
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
  d=fujitsu.com; i=@fujitsu.com; q=dns/txt; s=fj2;
  t=1754475861; x=1786011861;
  h=from:to:cc:subject:date:message-id:in-reply-to:
   references:mime-version:content-transfer-encoding;
  bh=BOCPoqml1CiiOCtR7dTRmMtmTu4QwYyLIpG4XAHlSfo=;
  b=JZZQfG1/sT1kChjOaFHiKoCRi1huI3uL9wQt0rE2KJSJFQRSl0UTaEsQ
   +MB3qpeCNlmUYFAtQxsRgQrGe3WjOqgAkER+duKNOYZFAsph6WYn7lJaT
   ASX+nbwVPW1F8jFe5tLTlQEwE4L3tHJ3ss8ed8JnKjmAtnQ0Viz/QBp7n
   b5U+/JMquqlrTxsUdht4B6BG/TS5U7htGhTSwdlJn5XSmGIe8Uh3obd8l
   GEWczat7GhrEQJ90P9UIfuDEv2Bjca6+JpQ9RjG0IEgPq8olY+evrvoWa
   EMnnua+mamw07btqnypb4Fv5NDP5wtt4YNmBV6h1VueP52DpoT89Xf6R4
   w==;
X-CSE-ConnectionGUID: VAb9y8OJQ3i24vjhYGcVJA==
X-CSE-MsgGUID: RKFQx9CUR0SvX60pxAXBJA==
X-IronPort-AV: E=McAfee;i="6800,10657,11513"; a="187483469"
X-IronPort-AV: E=Sophos;i="6.17,268,1747666800"; 
   d="scan'208";a="187483469"
Received: from unknown (HELO az2uksmgr3.o.css.fujitsu.com) ([52.151.125.19])
  by esa7.hc1455-7.c3s2.iphmx.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 06 Aug 2025 19:24:20 +0900
Received: from az2uksmgm2.o.css.fujitsu.com (unknown [10.151.22.199])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by az2uksmgr3.o.css.fujitsu.com (Postfix) with ESMTPS id CF53B1002B84
	for <openembedded-core@lists.openembedded.org>; Wed,  6 Aug 2025 10:24:20 +0000 (UTC)
Received: from az2nlsmom3.fujitsu.com (az2nlsmom3.o.css.fujitsu.com [10.150.26.199])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by az2uksmgm2.o.css.fujitsu.com (Postfix) with ESMTPS id 8721018000F8
	for <openembedded-core@lists.openembedded.org>; Wed,  6 Aug 2025 10:24:20 +0000 (UTC)
Received: from edo.cn.fujitsu.com (edo.cn.fujitsu.com [10.167.33.5])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits))
	(No client certificate requested)
	by az2nlsmom3.fujitsu.com (Postfix) with ESMTPS id 69035101F4A9
	for <openembedded-core@lists.openembedded.org>; Wed,  6 Aug 2025 10:24:18 +0000 (UTC)
Received: from G08FNSTD190088.g08.fujitsu.local (unknown [10.193.129.116])
	by edo.cn.fujitsu.com (Postfix) with ESMTP id 88BFB1A010B;
	Tue,  5 Aug 2025 17:06:41 +0800 (CST)
From: Liu Yiding <liuyd.fnst@fujitsu.com>
To: openembedded-core@lists.openembedded.org
Cc: Liu Yiding <liuyd.fnst@fujitsu.com>
Subject: [OE-core] [PATCH 2/9] vulkan-loader: upgrade 1.4.313 -> 1.4.321
Date: Tue,  5 Aug 2025 17:06:16 +0800
Message-ID: <20250805090624.711-2-liuyd.fnst@fujitsu.com>
X-Mailer: git-send-email 2.49.0.windows.1
In-Reply-To: <20250805090624.711-1-liuyd.fnst@fujitsu.com>
References: <20250805090624.711-1-liuyd.fnst@fujitsu.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Wed, 06 Aug 2025 10:24:31 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/221528

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


