Return-Path: <wangmy@fujitsu.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 5BF06E78D70
	for <webhook@archiver.kernel.org>; Mon,  9 Feb 2026 09:04:36 +0000 (UTC)
Received: from esa3.hc1455-7.c3s2.iphmx.com (esa3.hc1455-7.c3s2.iphmx.com [207.54.90.49])
 by mx.groups.io with SMTP id smtpd.msgproc01-g2.43867.1770627869044120743
 for <openembedded-core@lists.openembedded.org>;
 Mon, 09 Feb 2026 01:04:29 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@fujitsu.com header.s=fj2 header.b=LKb2QyrD;
 spf=pass (domain: fujitsu.com, ip: 207.54.90.49, mailfrom: wangmy@fujitsu.com)
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
  d=fujitsu.com; i=@fujitsu.com; q=dns/txt; s=fj2;
  t=1770627869; x=1802163869;
  h=from:to:cc:subject:date:message-id:in-reply-to:
   references:mime-version:content-transfer-encoding;
  bh=ILK82vrn8PS57DtuT21MNytC5Onc9UUkwBbzctARxoc=;
  b=LKb2QyrDDbIUdVRy6FFJHOA9ltaLbZeJK8Ty2dAEdQZj4Uh85pIoz7ZQ
   6OZ9wGxuvCEFsl2RA/DlhOi1rckUcvd7jrs1jsfhV8NgZfCqpEZ2qZlBb
   hz/yN0QmVsVzszBQUWrIVcnNv6r+8u1k8jYpj52mYSt7c6VxM3y54ReZT
   A2pdc+81IpZQxU5muDfJ5e/hvQWLMmT9KX+M7W8uNgnrA/MtPnZoASgF3
   X0ebehVxeHEtxSchPP34bwOA35+ucqpTYX/hP1WxLgzDn+0xIayUylTtj
   BvifVVEUIapIWypk/ONnd50erkj23cxt0cEl76XNXK2A4zuclVsIcXeBz
   A==;
X-CSE-ConnectionGUID: Pniq2Nx/Ts2bCI6oCzqByg==
X-CSE-MsgGUID: FWIYlZlwShScux+F9X4RqA==
X-IronPort-AV: E=McAfee;i="6800,10657,11695"; a="229013685"
X-IronPort-AV: E=Sophos;i="6.21,281,1763391600"; 
   d="scan'208";a="229013685"
Received: from unknown (HELO mail.fujitsu.com) ([20.61.8.234])
  by esa3.hc1455-7.c3s2.iphmx.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 09 Feb 2026 18:04:27 +0900
Received: from az2nlsmgm3.fujitsu.com (unknown [10.150.26.205])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by az2nlsmgr4.fujitsu.com (Postfix) with ESMTPS id 735A2407565
	for <openembedded-core@lists.openembedded.org>; Mon,  9 Feb 2026 09:04:27 +0000 (UTC)
Received: from az2nlsmom3.fujitsu.com (az2nlsmom3.o.css.fujitsu.com [10.150.26.199])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by az2nlsmgm3.fujitsu.com (Postfix) with ESMTPS id 2613D1802ADE
	for <openembedded-core@lists.openembedded.org>; Mon,  9 Feb 2026 09:04:27 +0000 (UTC)
Received: from G08FNSTD200057.g08.fujitsu.local (unknown [10.193.128.34])
	by az2nlsmom3.fujitsu.com (Postfix) with ESMTP id 935AA101A406;
	Mon,  9 Feb 2026 09:04:24 +0000 (UTC)
From: Wang Mingyu < wangmy@fujitsu.com>
To: openembedded-core@lists.openembedded.org
Cc: Wang Mingyu <wangmy@fujitsu.com>
Subject: [OE-core] [PATCH 35/39] vulkan-loader: upgrade 1.4.335.0 -> 1.4.341.0
Date: Mon,  9 Feb 2026 17:03:13 +0800
Message-ID: <20260209090317.1468-35-wangmy@fujitsu.com>
X-Mailer: git-send-email 2.49.0.windows.1
In-Reply-To: <20260209090317.1468-1-wangmy@fujitsu.com>
References: <20260209090317.1468-1-wangmy@fujitsu.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Mon, 09 Feb 2026 09:04:36 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/230746

From: Wang Mingyu <wangmy@fujitsu.com>

Signed-off-by: Wang Mingyu <wangmy@fujitsu.com>
---
 ...{vulkan-loader_1.4.335.0.bb => vulkan-loader_1.4.341.0.bb} | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)
 rename meta/recipes-graphics/vulkan/{vulkan-loader_1.4.335.0.bb => vulkan-loader_1.4.341.0.bb} (94%)

diff --git a/meta/recipes-graphics/vulkan/vulkan-loader_1.4.335.0.bb b/meta/recipes-graphics/vulkan/vulkan-loader_1.4.341.0.bb
similarity index 94%
rename from meta/recipes-graphics/vulkan/vulkan-loader_1.4.335.0.bb
rename to meta/recipes-graphics/vulkan/vulkan-loader_1.4.341.0.bb
index 8799221313..e6ad8738fc 100644
--- a/meta/recipes-graphics/vulkan/vulkan-loader_1.4.335.0.bb
+++ b/meta/recipes-graphics/vulkan/vulkan-loader_1.4.341.0.bb
@@ -9,8 +9,8 @@ SECTION = "libs"
 
 LICENSE = "Apache-2.0"
 LIC_FILES_CHKSUM = "file://LICENSE.txt;md5=7dbefed23242760aa3475ee42801c5ac"
-SRC_URI = "git://github.com/KhronosGroup/Vulkan-Loader.git;branch=vulkan-sdk-1.4.335;protocol=https"
-SRCREV = "057ca1e5f2b61bbb3942e3a7464d488d5bde4a3c"
+SRC_URI = "git://github.com/KhronosGroup/Vulkan-Loader.git;branch=main;protocol=https;tag=vulkan-sdk-${PV}"
+SRCREV = "32fcb949e253cbeb40cda7ea76122b492db579ae"
 
 REQUIRED_DISTRO_FEATURES = "vulkan"
 
-- 
2.43.0


