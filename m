Return-Path: <wangmy@fujitsu.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 12BCDE78D5E
	for <webhook@archiver.kernel.org>; Mon,  9 Feb 2026 09:04:26 +0000 (UTC)
Received: from esa10.hc1455-7.c3s2.iphmx.com (esa10.hc1455-7.c3s2.iphmx.com [139.138.36.225])
 by mx.groups.io with SMTP id smtpd.msgproc02-g2.43634.1770627863658034798
 for <openembedded-core@lists.openembedded.org>;
 Mon, 09 Feb 2026 01:04:24 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@fujitsu.com header.s=fj2 header.b=QVYzSsmE;
 spf=pass (domain: fujitsu.com, ip: 139.138.36.225, mailfrom: wangmy@fujitsu.com)
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
  d=fujitsu.com; i=@fujitsu.com; q=dns/txt; s=fj2;
  t=1770627864; x=1802163864;
  h=from:to:cc:subject:date:message-id:in-reply-to:
   references:mime-version:content-transfer-encoding;
  bh=kFVnUEwsY3aaAj0We5jHxdhJ8jcWHJyPaaNnj1cme5g=;
  b=QVYzSsmEqTOcAZiIh0JdHderuSmszVNQ2gSuV/1Cqp4XhmiUA1GfsrcB
   ebDBRoVpDybCmcgzUCt0gS2H2z//9WJA+dAX2DNeOJFxzAqrFV4m2U9a3
   qQ368fQqwf0O/btZ921g0k/Q44oFLGppqaJs6JeFo9K/JhDDLomaDYFfY
   sfxXg97VYHQ72mPYo0LiOnSvc0zMGqNjZFH4ssDp+kL4GrXWSlqJSeUvo
   TCoyVJwNrcU+WS3k7feopSCIEdPQGf8+IXjCIKMWOZD6duoBhUQWPXAOB
   lObb11+6GLpAIy79b1GQPIBWMbZACSYJNKUpeGoF/CXjG85TJATllfFKc
   Q==;
X-CSE-ConnectionGUID: GUB+iNzbSiqkfHOkiVihXA==
X-CSE-MsgGUID: 9SXYjY82RVOv6tK9+WvWBA==
X-IronPort-AV: E=McAfee;i="6800,10657,11695"; a="216449881"
X-IronPort-AV: E=Sophos;i="6.21,281,1763391600"; 
   d="scan'208";a="216449881"
Received: from unknown (HELO mail.fujitsu.com) ([51.138.80.169])
  by esa10.hc1455-7.c3s2.iphmx.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 09 Feb 2026 18:04:22 +0900
Received: from az2uksmgm4.o.css.fujitsu.com (unknown [10.151.22.201])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by az2nlsmgr1.fujitsu.com (Postfix) with ESMTPS id 406331C000FA
	for <openembedded-core@lists.openembedded.org>; Mon,  9 Feb 2026 09:04:22 +0000 (UTC)
Received: from az2nlsmom3.fujitsu.com (az2nlsmom3.o.css.fujitsu.com [10.150.26.199])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by az2uksmgm4.o.css.fujitsu.com (Postfix) with ESMTPS id D986F14003B8
	for <openembedded-core@lists.openembedded.org>; Mon,  9 Feb 2026 09:04:21 +0000 (UTC)
Received: from G08FNSTD200057.g08.fujitsu.local (unknown [10.193.128.34])
	by az2nlsmom3.fujitsu.com (Postfix) with ESMTP id 3A69A101A41D;
	Mon,  9 Feb 2026 09:04:18 +0000 (UTC)
From: Wang Mingyu < wangmy@fujitsu.com>
To: openembedded-core@lists.openembedded.org
Cc: Wang Mingyu <wangmy@fujitsu.com>
Subject: [OE-core] [PATCH 32/39] spirv-headers: upgrade 1.4.335.0 -> 1.4.341.0
Date: Mon,  9 Feb 2026 17:03:10 +0800
Message-ID: <20260209090317.1468-32-wangmy@fujitsu.com>
X-Mailer: git-send-email 2.49.0.windows.1
In-Reply-To: <20260209090317.1468-1-wangmy@fujitsu.com>
References: <20260209090317.1468-1-wangmy@fujitsu.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Mon, 09 Feb 2026 09:04:26 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/230742

From: Wang Mingyu <wangmy@fujitsu.com>

Signed-off-by: Wang Mingyu <wangmy@fujitsu.com>
---
 ...{spirv-headers_1.4.335.0.bb => spirv-headers_1.4.341.0.bb} | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)
 rename meta/recipes-graphics/spir/{spirv-headers_1.4.335.0.bb => spirv-headers_1.4.341.0.bb} (88%)

diff --git a/meta/recipes-graphics/spir/spirv-headers_1.4.335.0.bb b/meta/recipes-graphics/spir/spirv-headers_1.4.341.0.bb
similarity index 88%
rename from meta/recipes-graphics/spir/spirv-headers_1.4.335.0.bb
rename to meta/recipes-graphics/spir/spirv-headers_1.4.341.0.bb
index db49f2ae13..258ba11504 100644
--- a/meta/recipes-graphics/spir/spirv-headers_1.4.335.0.bb
+++ b/meta/recipes-graphics/spir/spirv-headers_1.4.341.0.bb
@@ -4,8 +4,8 @@ HOMEPAGE = "https://www.khronos.org/registry/spir-v"
 LICENSE = "MIT & CC-BY-4.0"
 LIC_FILES_CHKSUM = "file://LICENSE;md5=a0dcaa512cc2dee95fe0fd791ee83a18"
 
-SRCREV = "b824a462d4256d720bebb40e78b9eb8f78bbb305"
-SRC_URI = "git://github.com/KhronosGroup/SPIRV-Headers;protocol=https;branch=main"
+SRCREV = "04f10f650d514df88b76d25e83db360142c7b174"
+SRC_URI = "git://github.com/KhronosGroup/SPIRV-Headers;protocol=https;branch=main;tag=vulkan-sdk-${PV}"
 PE = "1"
 # These recipes need to be updated in lockstep with each other:
 # glslang, vulkan-headers, vulkan-loader, vulkan-tools, spirv-headers, spirv-tools
-- 
2.43.0


