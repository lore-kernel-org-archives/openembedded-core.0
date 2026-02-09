Return-Path: <wangmy@fujitsu.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 29CC7E78D64
	for <webhook@archiver.kernel.org>; Mon,  9 Feb 2026 09:04:36 +0000 (UTC)
Received: from esa7.hc1455-7.c3s2.iphmx.com (esa7.hc1455-7.c3s2.iphmx.com [139.138.61.252])
 by mx.groups.io with SMTP id smtpd.msgproc02-g2.43642.1770627865962572903
 for <openembedded-core@lists.openembedded.org>;
 Mon, 09 Feb 2026 01:04:27 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@fujitsu.com header.s=fj2 header.b=oUOx6bwu;
 spf=pass (domain: fujitsu.com, ip: 139.138.61.252, mailfrom: wangmy@fujitsu.com)
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
  d=fujitsu.com; i=@fujitsu.com; q=dns/txt; s=fj2;
  t=1770627867; x=1802163867;
  h=from:to:cc:subject:date:message-id:in-reply-to:
   references:mime-version:content-transfer-encoding;
  bh=qy+scrAp2TMs4oAKTuNsU7LlbNXqEs7xMxc0z4tAAAw=;
  b=oUOx6bwuq5Jn57Nj68Rb52Ewsu7ERi/2E2Kb6E8oRFQP8xGhi8BTvpxV
   lXiPvspMBKQCutmdoqWLlZHP+X1DGcRDQ6oKHlBDKgdFLXT8rm0qfY/E5
   l2Y2eUwgx7FP8M2MyIkqhHAILjDRBdTP8KBDKAqLOxnyRMJjnw2CzcPdK
   5p8b1weJCohyLrIPjWqngvojtt+7GlgjU2rB5eZH+8Anm3bmRk4HmMhUY
   mJpyXLABh1AZVv5Ir1/TPy/O6rmins7kS++NFNW0h8s7GFdYUqJZNU9+R
   Z9mqY2QN9Qb0LTSuV91BvlepiuMcdufA/RKcnrF0AVM5s1B+IUsRzWbE4
   g==;
X-CSE-ConnectionGUID: evHJ9c11SMWRs3ucJqQKjA==
X-CSE-MsgGUID: XEuPPGRcR0KSDtWMGoeuNw==
X-IronPort-AV: E=McAfee;i="6800,10657,11695"; a="207844143"
X-IronPort-AV: E=Sophos;i="6.21,281,1763391600"; 
   d="scan'208";a="207844143"
Received: from unknown (HELO mail.fujitsu.com) ([20.61.8.234])
  by esa7.hc1455-7.c3s2.iphmx.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 09 Feb 2026 18:04:24 +0900
Received: from az2nlsmgm4.fujitsu.com (unknown [10.150.26.204])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by az2nlsmgr3.fujitsu.com (Postfix) with ESMTPS id DBB5E100034F
	for <openembedded-core@lists.openembedded.org>; Mon,  9 Feb 2026 09:04:23 +0000 (UTC)
Received: from az2nlsmom3.fujitsu.com (az2nlsmom3.o.css.fujitsu.com [10.150.26.199])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by az2nlsmgm4.fujitsu.com (Postfix) with ESMTPS id 928F710001DA
	for <openembedded-core@lists.openembedded.org>; Mon,  9 Feb 2026 09:04:23 +0000 (UTC)
Received: from G08FNSTD200057.g08.fujitsu.local (unknown [10.193.128.34])
	by az2nlsmom3.fujitsu.com (Postfix) with ESMTP id 07900101A41B;
	Mon,  9 Feb 2026 09:04:20 +0000 (UTC)
From: Wang Mingyu < wangmy@fujitsu.com>
To: openembedded-core@lists.openembedded.org
Cc: Wang Mingyu <wangmy@fujitsu.com>
Subject: [OE-core] [PATCH 33/39] spirv-tools: upgrade 1.4.335.0 -> 1.4.341.0
Date: Mon,  9 Feb 2026 17:03:11 +0800
Message-ID: <20260209090317.1468-33-wangmy@fujitsu.com>
X-Mailer: git-send-email 2.49.0.windows.1
In-Reply-To: <20260209090317.1468-1-wangmy@fujitsu.com>
References: <20260209090317.1468-1-wangmy@fujitsu.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Mon, 09 Feb 2026 09:04:36 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/230744

From: Wang Mingyu <wangmy@fujitsu.com>

Signed-off-by: Wang Mingyu <wangmy@fujitsu.com>
---
 .../{spirv-tools_1.4.335.0.bb => spirv-tools_1.4.341.0.bb}    | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)
 rename meta/recipes-graphics/spir/{spirv-tools_1.4.335.0.bb => spirv-tools_1.4.341.0.bb} (94%)

diff --git a/meta/recipes-graphics/spir/spirv-tools_1.4.335.0.bb b/meta/recipes-graphics/spir/spirv-tools_1.4.341.0.bb
similarity index 94%
rename from meta/recipes-graphics/spir/spirv-tools_1.4.335.0.bb
rename to meta/recipes-graphics/spir/spirv-tools_1.4.341.0.bb
index 5849ec1bac..51c54b9d4f 100644
--- a/meta/recipes-graphics/spir/spirv-tools_1.4.335.0.bb
+++ b/meta/recipes-graphics/spir/spirv-tools_1.4.341.0.bb
@@ -7,8 +7,8 @@ SECTION = "graphics"
 LICENSE  = "Apache-2.0"
 LIC_FILES_CHKSUM = "file://LICENSE;md5=3b83ef96387f14655fc854ddc3c6bd57"
 
-SRCREV = "262bdab48146c937467f826699a40da0fdfc0f1a"
-SRC_URI = "git://github.com/KhronosGroup/SPIRV-Tools.git;branch=main;protocol=https"
+SRCREV = "fbe4f3ad913c44fe8700545f8ffe35d1382b7093"
+SRC_URI = "git://github.com/KhronosGroup/SPIRV-Tools.git;branch=main;protocol=https;tag=vulkan-sdk-${PV}"
 PE = "1"
 # These recipes need to be updated in lockstep with each other:
 # glslang, vulkan-headers, vulkan-loader, vulkan-tools, spirv-headers, spirv-tools
-- 
2.43.0


