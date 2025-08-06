Return-Path: <liuyd.fnst@fujitsu.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 1432DC87FCB
	for <webhook@archiver.kernel.org>; Wed,  6 Aug 2025 08:56:21 +0000 (UTC)
Received: from esa2.hc1455-7.c3s2.iphmx.com (esa2.hc1455-7.c3s2.iphmx.com [207.54.90.48])
 by mx.groups.io with SMTP id smtpd.web11.20653.1754470573163271147
 for <openembedded-core@lists.openembedded.org>;
 Wed, 06 Aug 2025 01:56:13 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@fujitsu.com header.s=fj2 header.b=NVEDcJg+;
 spf=pass (domain: fujitsu.com, ip: 207.54.90.48, mailfrom: liuyd.fnst@fujitsu.com)
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
  d=fujitsu.com; i=@fujitsu.com; q=dns/txt; s=fj2;
  t=1754470573; x=1786006573;
  h=from:to:cc:subject:date:message-id:in-reply-to:
   references:mime-version:content-transfer-encoding;
  bh=hzKEAf8V8q+j36ChYzCQhp6Y5m9BhwfcK/oi285ln9E=;
  b=NVEDcJg+X2EbyLyvMYouQeYslr5kXz6NCSpzXl3/4DC7dt01oWMi8HOc
   5iIGYNw+k1DwlJyxqdwJyb0V3HnHGzKXZ+8E9LsrzzgMjZK6P09KPdXCG
   g8x9za5qTl8jLBEe9NomKm7Yv5PfmdeFfufVIDk6jEXKgeksrgsW18wyH
   Y6cDM8O1Z9KwULPB7amvyJRBzGdno7nnMZdAfI2Zr2cZPlBJYOuAw4Cwf
   IpkcOhIda1nfILnqHb3cjGKU+VPHQ/y6/ZXjPBFew4Mg/wpb3+zPzON/Z
   yieF4j0Wqb96xb3Zjcd0kvHKETgTOGigxd7UJwAyMmQews2sE3h83lsRy
   g==;
X-CSE-ConnectionGUID: hCQKX6kxSgCt+ndFO0me3w==
X-CSE-MsgGUID: pAfkDVWYQJycrGOUGcz8cw==
X-IronPort-AV: E=McAfee;i="6800,10657,11513"; a="208548157"
X-IronPort-AV: E=Sophos;i="6.17,268,1747666800"; 
   d="scan'208";a="208548157"
Received: from unknown (HELO az2nlsmgr4.o.css.fujitsu.com) ([51.138.80.169])
  by esa2.hc1455-7.c3s2.iphmx.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 06 Aug 2025 17:56:11 +0900
Received: from az2nlsmgm3.fujitsu.com (unknown [10.150.26.205])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by az2nlsmgr4.o.css.fujitsu.com (Postfix) with ESMTPS id 4ABBA42A31E
	for <openembedded-core@lists.openembedded.org>; Wed,  6 Aug 2025 08:56:11 +0000 (UTC)
Received: from az2uksmom4.o.css.fujitsu.com (az2uksmom4.o.css.fujitsu.com [10.151.22.204])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by az2nlsmgm3.fujitsu.com (Postfix) with ESMTPS id 00EBE1803201
	for <openembedded-core@lists.openembedded.org>; Wed,  6 Aug 2025 08:56:11 +0000 (UTC)
Received: from edo.cn.fujitsu.com (edo.cn.fujitsu.com [10.167.33.5])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits))
	(No client certificate requested)
	by az2uksmom4.o.css.fujitsu.com (Postfix) with ESMTPS id E7370402603
	for <openembedded-core@lists.openembedded.org>; Wed,  6 Aug 2025 08:56:08 +0000 (UTC)
Received: from G08FNSTD190088.g08.fujitsu.local (unknown [10.193.129.116])
	by edo.cn.fujitsu.com (Postfix) with ESMTP id 5FA501A016E;
	Wed,  6 Aug 2025 16:39:48 +0800 (CST)
From: Liu Yiding <liuyd.fnst@fujitsu.com>
To: openembedded-core@lists.openembedded.org
Cc: Liu Yiding <liuyd.fnst@fujitsu.com>
Subject: [OE-core] [PATCH 5/9] vulkan-validation-layers: upgrade 1.4.313 -> 1.4.321
Date: Wed,  6 Aug 2025 16:39:25 +0800
Message-ID: <20250806083929.747-5-liuyd.fnst@fujitsu.com>
X-Mailer: git-send-email 2.49.0.windows.1
In-Reply-To: <20250806083929.747-1-liuyd.fnst@fujitsu.com>
References: <20250806083929.747-1-liuyd.fnst@fujitsu.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Wed, 06 Aug 2025 08:56:21 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/221508

Changelog:
https://github.com/KhronosGroup/Vulkan-ValidationLayers/compare/vulkan-sdk-1.4.313.0...vulkan-sdk-1.4.321.0

Signed-off-by: Liu Yiding <liuyd.fnst@fujitsu.com>
---
 ...ers_1.4.313.0.bb => vulkan-validation-layers_1.4.321.0.bb} | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)
 rename meta/recipes-graphics/vulkan/{vulkan-validation-layers_1.4.313.0.bb => vulkan-validation-layers_1.4.321.0.bb} (95%)

diff --git a/meta/recipes-graphics/vulkan/vulkan-validation-layers_1.4.313.0.bb b/meta/recipes-graphics/vulkan/vulkan-validation-layers_1.4.321.0.bb
similarity index 95%
rename from meta/recipes-graphics/vulkan/vulkan-validation-layers_1.4.313.0.bb
rename to meta/recipes-graphics/vulkan/vulkan-validation-layers_1.4.321.0.bb
index 63a3aa4ae6..fa7873b62d 100644
--- a/meta/recipes-graphics/vulkan/vulkan-validation-layers_1.4.313.0.bb
+++ b/meta/recipes-graphics/vulkan/vulkan-validation-layers_1.4.321.0.bb
@@ -8,8 +8,8 @@ SECTION = "libs"
 LICENSE = "Apache-2.0 & MIT & BSL-1.0 "
 LIC_FILES_CHKSUM = "file://LICENSE.txt;md5=b1a17d548e004bfbbfaa0c40988b6b31"
 
-SRC_URI = "git://github.com/KhronosGroup/Vulkan-ValidationLayers.git;branch=vulkan-sdk-1.4.313;protocol=https"
-SRCREV = "50b87dd4be883b63c10e3c4f7b9c5aac0c82efd3"
+SRC_URI = "git://github.com/KhronosGroup/Vulkan-ValidationLayers.git;branch=vulkan-sdk-1.4.321;protocol=https"
+SRCREV = "fee7b2b4a926355e48668e29570be129eb82cb36"
 
 REQUIRED_DISTRO_FEATURES = "vulkan"
 
-- 
2.43.0


