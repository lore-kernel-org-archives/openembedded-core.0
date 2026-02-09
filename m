Return-Path: <wangmy@fujitsu.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 38BA5E78D6A
	for <webhook@archiver.kernel.org>; Mon,  9 Feb 2026 09:04:36 +0000 (UTC)
Received: from esa2.hc1455-7.c3s2.iphmx.com (esa2.hc1455-7.c3s2.iphmx.com [207.54.90.48])
 by mx.groups.io with SMTP id smtpd.msgproc02-g2.43662.1770627874323274743
 for <openembedded-core@lists.openembedded.org>;
 Mon, 09 Feb 2026 01:04:34 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@fujitsu.com header.s=fj2 header.b=EfTdWhF/;
 spf=pass (domain: fujitsu.com, ip: 207.54.90.48, mailfrom: wangmy@fujitsu.com)
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
  d=fujitsu.com; i=@fujitsu.com; q=dns/txt; s=fj2;
  t=1770627873; x=1802163873;
  h=from:to:cc:subject:date:message-id:in-reply-to:
   references:mime-version:content-transfer-encoding;
  bh=spazxl6jxbtKte1og5vDVq8m0oA0lUa1s57z5vM4OOs=;
  b=EfTdWhF/i2u5rSBPzDdVNx7CUA1iwXWhpuORvdkAC2Vlx0qrCW80ZWD3
   Pj5VGlTnHiLlMTUC3BEbyBlYhZKPiI5oIxtLYLht/qSS6yAhU6DtfG99B
   3IvgGdMQeodinMdBiePRFgRw5QtTLzbqYpZzYaWM8U+NrQainH/2oabdU
   kAH2NlY4/EkxkcL/jq3IUVmCv0y4848l2H6clRwdhWGY9/sbyMSQcAVum
   UsQwGDlA++3xCwQteSd4Lvj9sEew74xYPEcRpq6lnCgQrD966QnLq58eU
   9JH+smEyV1SIUYQYqeXDTIHA1eBDVozMdQaZRF2L0IO+bZMAUngEwV53q
   A==;
X-CSE-ConnectionGUID: fMVByyPWTGCMonBGKmesQQ==
X-CSE-MsgGUID: VSAEg6ApSJyqJFFtk5mUKw==
X-IronPort-AV: E=McAfee;i="6800,10657,11695"; a="228980620"
X-IronPort-AV: E=Sophos;i="6.21,281,1763391600"; 
   d="scan'208";a="228980620"
Received: from unknown (HELO mail.fujitsu.com) ([51.138.80.169])
  by esa2.hc1455-7.c3s2.iphmx.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 09 Feb 2026 18:04:31 +0900
Received: from az2nlsmgm3.fujitsu.com (unknown [10.150.26.205])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by az2nlsmgr4.fujitsu.com (Postfix) with ESMTPS id C8EB742A31A
	for <openembedded-core@lists.openembedded.org>; Mon,  9 Feb 2026 09:04:32 +0000 (UTC)
Received: from az2nlsmom3.fujitsu.com (az2nlsmom3.o.css.fujitsu.com [10.150.26.199])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by az2nlsmgm3.fujitsu.com (Postfix) with ESMTPS id 7E1161802ADA
	for <openembedded-core@lists.openembedded.org>; Mon,  9 Feb 2026 09:04:32 +0000 (UTC)
Received: from G08FNSTD200057.g08.fujitsu.local (unknown [10.193.128.34])
	by az2nlsmom3.fujitsu.com (Postfix) with ESMTP id F3F72101A426;
	Mon,  9 Feb 2026 09:04:29 +0000 (UTC)
From: Wang Mingyu < wangmy@fujitsu.com>
To: openembedded-core@lists.openembedded.org
Cc: Wang Mingyu <wangmy@fujitsu.com>
Subject: [OE-core] [PATCH 38/39] vulkan-validation-layers: upgrade 1.4.335.0 -> 1.4.341.0
Date: Mon,  9 Feb 2026 17:03:16 +0800
Message-ID: <20260209090317.1468-38-wangmy@fujitsu.com>
X-Mailer: git-send-email 2.49.0.windows.1
In-Reply-To: <20260209090317.1468-1-wangmy@fujitsu.com>
References: <20260209090317.1468-1-wangmy@fujitsu.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Mon, 09 Feb 2026 09:04:36 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/230749

From: Wang Mingyu <wangmy@fujitsu.com>

Signed-off-by: Wang Mingyu <wangmy@fujitsu.com>
---
 ...ers_1.4.335.0.bb => vulkan-validation-layers_1.4.341.0.bb} | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)
 rename meta/recipes-graphics/vulkan/{vulkan-validation-layers_1.4.335.0.bb => vulkan-validation-layers_1.4.341.0.bb} (95%)

diff --git a/meta/recipes-graphics/vulkan/vulkan-validation-layers_1.4.335.0.bb b/meta/recipes-graphics/vulkan/vulkan-validation-layers_1.4.341.0.bb
similarity index 95%
rename from meta/recipes-graphics/vulkan/vulkan-validation-layers_1.4.335.0.bb
rename to meta/recipes-graphics/vulkan/vulkan-validation-layers_1.4.341.0.bb
index 2a9501309c..0b9bead366 100644
--- a/meta/recipes-graphics/vulkan/vulkan-validation-layers_1.4.335.0.bb
+++ b/meta/recipes-graphics/vulkan/vulkan-validation-layers_1.4.341.0.bb
@@ -8,8 +8,8 @@ SECTION = "libs"
 LICENSE = "Apache-2.0 & MIT & BSL-1.0 "
 LIC_FILES_CHKSUM = "file://LICENSE.txt;md5=b1a17d548e004bfbbfaa0c40988b6b31"
 
-SRC_URI = "git://github.com/KhronosGroup/Vulkan-ValidationLayers.git;branch=main;protocol=https"
-SRCREV = "2e94023f2581aaa7f5a4d6fe0ee670d9b5e10187"
+SRC_URI = "git://github.com/KhronosGroup/Vulkan-ValidationLayers.git;branch=main;protocol=https;tag=vulkan-sdk-${PV}"
+SRCREV = "14de3c0d7b396853d81e6975aad3713984a697a6"
 
 REQUIRED_DISTRO_FEATURES = "vulkan"
 
-- 
2.43.0


