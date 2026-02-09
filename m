Return-Path: <wangmy@fujitsu.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 4D75AE78D6E
	for <webhook@archiver.kernel.org>; Mon,  9 Feb 2026 09:04:36 +0000 (UTC)
Received: from esa10.hc1455-7.c3s2.iphmx.com (esa10.hc1455-7.c3s2.iphmx.com [139.138.36.225])
 by mx.groups.io with SMTP id smtpd.msgproc02-g2.43647.1770627871043544978
 for <openembedded-core@lists.openembedded.org>;
 Mon, 09 Feb 2026 01:04:31 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@fujitsu.com header.s=fj2 header.b=cjvvOIY8;
 spf=pass (domain: fujitsu.com, ip: 139.138.36.225, mailfrom: wangmy@fujitsu.com)
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
  d=fujitsu.com; i=@fujitsu.com; q=dns/txt; s=fj2;
  t=1770627871; x=1802163871;
  h=from:to:cc:subject:date:message-id:in-reply-to:
   references:mime-version:content-transfer-encoding;
  bh=8/DDFHWnlZqTwmMiz0LRn27/VMGkRWA58oIgSH06DpY=;
  b=cjvvOIY8cejEXroKoSkZd7HmosXk9MH0YFEKTFe71GEv6EERbY/d9hiY
   g3oQILrhRFpf8uSu7KlxSxVwUav03kUltEQeWR4OjD3wMfSOxLFdtaYzg
   8Vm/X/k3EAeL4S8X86/ZPXKVilR+N0dGSyn/ikRKPAYZrrZTE6TH2A+cK
   0RIVjSUm16/cMq5w9jp97TcdMvD0R9BUlygehX8j8VoTj0VIn9Nin8R8/
   Q9Sxf7Awmrf1iODKCBjG+0tKPe24a9S/I8Axy8mrmoGajmwzJEbqktx+g
   Hq3fk3RYNS/fXRfeGh9hqxN73Z6UqtsdDgZ27feYLNE8H97rmywMfjx+P
   A==;
X-CSE-ConnectionGUID: ehiepOMoSG6BMUjYup/8YA==
X-CSE-MsgGUID: HS0yjksESn+1VOijIg/mdQ==
X-IronPort-AV: E=McAfee;i="6800,10657,11695"; a="216449915"
X-IronPort-AV: E=Sophos;i="6.21,281,1763391600"; 
   d="scan'208";a="216449915"
Received: from unknown (HELO mail.fujitsu.com) ([51.138.80.169])
  by esa10.hc1455-7.c3s2.iphmx.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 09 Feb 2026 18:04:29 +0900
Received: from az2uksmgm1.o.css.fujitsu.com (unknown [10.151.22.198])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by az2nlsmgr2.fujitsu.com (Postfix) with ESMTPS id 88DB76761
	for <openembedded-core@lists.openembedded.org>; Mon,  9 Feb 2026 09:04:29 +0000 (UTC)
Received: from az2nlsmom3.fujitsu.com (az2nlsmom3.o.css.fujitsu.com [10.150.26.199])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by az2uksmgm1.o.css.fujitsu.com (Postfix) with ESMTPS id 080798D29D4
	for <openembedded-core@lists.openembedded.org>; Mon,  9 Feb 2026 09:04:29 +0000 (UTC)
Received: from G08FNSTD200057.g08.fujitsu.local (unknown [10.193.128.34])
	by az2nlsmom3.fujitsu.com (Postfix) with ESMTP id 64512101A403;
	Mon,  9 Feb 2026 09:04:26 +0000 (UTC)
From: Wang Mingyu < wangmy@fujitsu.com>
To: openembedded-core@lists.openembedded.org
Cc: Wang Mingyu <wangmy@fujitsu.com>
Subject: [OE-core] [PATCH 36/39] vulkan-tools: upgrade 1.4.335.0 -> 1.4.341.0
Date: Mon,  9 Feb 2026 17:03:14 +0800
Message-ID: <20260209090317.1468-36-wangmy@fujitsu.com>
X-Mailer: git-send-email 2.49.0.windows.1
In-Reply-To: <20260209090317.1468-1-wangmy@fujitsu.com>
References: <20260209090317.1468-1-wangmy@fujitsu.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Mon, 09 Feb 2026 09:04:36 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/230747

From: Wang Mingyu <wangmy@fujitsu.com>

Signed-off-by: Wang Mingyu <wangmy@fujitsu.com>
---
 .../{vulkan-tools_1.4.335.0.bb => vulkan-tools_1.4.341.0.bb}  | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)
 rename meta/recipes-graphics/vulkan/{vulkan-tools_1.4.335.0.bb => vulkan-tools_1.4.341.0.bb} (94%)

diff --git a/meta/recipes-graphics/vulkan/vulkan-tools_1.4.335.0.bb b/meta/recipes-graphics/vulkan/vulkan-tools_1.4.341.0.bb
similarity index 94%
rename from meta/recipes-graphics/vulkan/vulkan-tools_1.4.335.0.bb
rename to meta/recipes-graphics/vulkan/vulkan-tools_1.4.341.0.bb
index b5bf3d0923..69c77f66e8 100644
--- a/meta/recipes-graphics/vulkan/vulkan-tools_1.4.335.0.bb
+++ b/meta/recipes-graphics/vulkan/vulkan-tools_1.4.341.0.bb
@@ -6,8 +6,8 @@ SECTION = "libs"
 
 LICENSE = "Apache-2.0"
 LIC_FILES_CHKSUM = "file://LICENSE.txt;md5=3b83ef96387f14655fc854ddc3c6bd57"
-SRC_URI = "git://github.com/KhronosGroup/Vulkan-Tools.git;branch=main;protocol=https"
-SRCREV = "8542e6dcfc6daef20d561220f1d91a02c25d95b2"
+SRC_URI = "git://github.com/KhronosGroup/Vulkan-Tools.git;branch=main;protocol=https;tag=vulkan-sdk-${PV}"
+SRCREV = "48a4bcbdf619e57204783f8c1a04c76c160ddd5b"
 
 inherit cmake features_check pkgconfig
 ANY_OF_DISTRO_FEATURES = "x11 wayland"
-- 
2.43.0


