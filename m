Return-Path: <liuyd.fnst@fujitsu.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 8E2BEC87FCB
	for <webhook@archiver.kernel.org>; Wed,  6 Aug 2025 10:24:21 +0000 (UTC)
Received: from esa6.hc1455-7.c3s2.iphmx.com (esa6.hc1455-7.c3s2.iphmx.com [68.232.139.139])
 by mx.groups.io with SMTP id smtpd.web11.22082.1754475858917912399
 for <openembedded-core@lists.openembedded.org>;
 Wed, 06 Aug 2025 03:24:19 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@fujitsu.com header.s=fj2 header.b=SWfZ1x5N;
 spf=pass (domain: fujitsu.com, ip: 68.232.139.139, mailfrom: liuyd.fnst@fujitsu.com)
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
  d=fujitsu.com; i=@fujitsu.com; q=dns/txt; s=fj2;
  t=1754475859; x=1786011859;
  h=from:to:cc:subject:date:message-id:in-reply-to:
   references:mime-version:content-transfer-encoding;
  bh=hzKEAf8V8q+j36ChYzCQhp6Y5m9BhwfcK/oi285ln9E=;
  b=SWfZ1x5NUeQEppb30668CLgAupimvc7gpvaoJSp8vjHYYo/kWYRL+65F
   cSMc1UWLQGi50S7NHSpeRoxoiCbRJ09GuK1xjXRNgekCl3/rJOWv1VMix
   RXUzWLq5QE1W9Y8RbVBvG+jt312gjfRVaFqW1jicXJR8OLzBRkWeTDfV8
   xCFIq6mAxfkm8ePmafrQMyOD0q4lb0zxACVxXSd0thlW4tqlMPgOiH8lg
   zz+OUQo5oBR2wqo/qu5DKupx5NOhFim/2+ggsNLCgvkotHzfn5OWV2z4+
   CxNJMduK4SFsVRPhO+io/VVdk3xns4zeGTQhc8ydNNVQjhkpmZgqOosGu
   A==;
X-CSE-ConnectionGUID: ItWTYh2dR1GnTazLveNNVw==
X-CSE-MsgGUID: lq/m/ZkrT227EJgBU7QTzA==
X-IronPort-AV: E=McAfee;i="6800,10657,11513"; a="211925845"
X-IronPort-AV: E=Sophos;i="6.17,268,1747666800"; 
   d="scan'208";a="211925845"
Received: from unknown (HELO az2nlsmgr4.o.css.fujitsu.com) ([51.138.80.169])
  by esa6.hc1455-7.c3s2.iphmx.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 06 Aug 2025 19:24:17 +0900
Received: from az2nlsmgm4.fujitsu.com (unknown [10.150.26.204])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by az2nlsmgr4.o.css.fujitsu.com (Postfix) with ESMTPS id 8824F42A31A
	for <openembedded-core@lists.openembedded.org>; Wed,  6 Aug 2025 10:24:17 +0000 (UTC)
Received: from az2nlsmom2.o.css.fujitsu.com (az2nlsmom2.o.css.fujitsu.com [10.150.26.200])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by az2nlsmgm4.fujitsu.com (Postfix) with ESMTPS id 4390F1000271
	for <openembedded-core@lists.openembedded.org>; Wed,  6 Aug 2025 10:24:17 +0000 (UTC)
Received: from edo.cn.fujitsu.com (edo.cn.fujitsu.com [10.167.33.5])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by az2nlsmom2.o.css.fujitsu.com (Postfix) with ESMTPS id 1806E1800D53
	for <openembedded-core@lists.openembedded.org>; Wed,  6 Aug 2025 10:24:15 +0000 (UTC)
Received: from G08FNSTD190088.g08.fujitsu.local (unknown [10.193.129.116])
	by edo.cn.fujitsu.com (Postfix) with ESMTP id D0E901A010C;
	Tue,  5 Aug 2025 17:06:42 +0800 (CST)
From: Liu Yiding <liuyd.fnst@fujitsu.com>
To: openembedded-core@lists.openembedded.org
Cc: Liu Yiding <liuyd.fnst@fujitsu.com>
Subject: [OE-core] [PATCH 5/9] vulkan-validation-layers: upgrade 1.4.313 -> 1.4.321
Date: Tue,  5 Aug 2025 17:06:19 +0800
Message-ID: <20250805090624.711-5-liuyd.fnst@fujitsu.com>
X-Mailer: git-send-email 2.49.0.windows.1
In-Reply-To: <20250805090624.711-1-liuyd.fnst@fujitsu.com>
References: <20250805090624.711-1-liuyd.fnst@fujitsu.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Wed, 06 Aug 2025 10:24:21 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/221522

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


