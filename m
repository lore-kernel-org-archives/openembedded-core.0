Return-Path: <liuyd.fnst@fujitsu.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 67017C87FD3
	for <webhook@archiver.kernel.org>; Wed,  6 Aug 2025 09:28:31 +0000 (UTC)
Received: from esa4.hc1455-7.c3s2.iphmx.com (esa4.hc1455-7.c3s2.iphmx.com [68.232.139.117])
 by mx.groups.io with SMTP id smtpd.web11.21368.1754472509094671043
 for <openembedded-core@lists.openembedded.org>;
 Wed, 06 Aug 2025 02:28:29 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@fujitsu.com header.s=fj2 header.b=O26RQBQg;
 spf=pass (domain: fujitsu.com, ip: 68.232.139.117, mailfrom: liuyd.fnst@fujitsu.com)
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
  d=fujitsu.com; i=@fujitsu.com; q=dns/txt; s=fj2;
  t=1754472509; x=1786008509;
  h=from:to:cc:subject:date:message-id:in-reply-to:
   references:mime-version:content-transfer-encoding;
  bh=k4ZANY4mv00x1UUGF+F28/+NVQ4cM/w40v9FU1aaVww=;
  b=O26RQBQgnqx9fygiK4AvK2M4laNastqEI9S5cBGy4sLKDrJbemvkh/AQ
   4GMLaekfXNEa+aJCUe3rBKHeUg9xHtHPR83T+XAp9aJ/m8BOVFapm5bhr
   E4KFbubp2T71RigVEkXWm/Zv2YA2MuWMPgNJx5ovW32bSnfJQvLmHQ6kP
   TCQW0qfxBAzTw4HwGF1rIs3G4FkrOaejCeSzauTd04M27j/tB4/aQ0HTc
   AWv4pFsRzOe0BbNZh3Djp72S4BK9p/gtnioqbE1HWMyG2QsfLyXBaOTMB
   EotsriiTxTYJg6HqhDUtGp8wfWCd7IPAs8MX5e0Yqd/r2oqM1dXARgIPr
   A==;
X-CSE-ConnectionGUID: 26VXPCyTQEyMylnpj5WtnA==
X-CSE-MsgGUID: fhc8B4njRvGDsJdIRNyEiA==
X-IronPort-AV: E=McAfee;i="6800,10657,11513"; a="209140200"
X-IronPort-AV: E=Sophos;i="6.17,268,1747666800"; 
   d="scan'208";a="209140200"
Received: from unknown (HELO az2nlsmgr4.o.css.fujitsu.com) ([20.61.8.234])
  by esa4.hc1455-7.c3s2.iphmx.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 06 Aug 2025 18:28:27 +0900
Received: from az2nlsmgm1.o.css.fujitsu.com (unknown [10.150.26.203])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by az2nlsmgr4.o.css.fujitsu.com (Postfix) with ESMTPS id 79A8742A31A
	for <openembedded-core@lists.openembedded.org>; Wed,  6 Aug 2025 09:28:27 +0000 (UTC)
Received: from az2uksmom2.o.css.fujitsu.com (az2uksmom2.o.css.fujitsu.com [10.151.22.203])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by az2nlsmgm1.o.css.fujitsu.com (Postfix) with ESMTPS id 30319C00D6E
	for <openembedded-core@lists.openembedded.org>; Wed,  6 Aug 2025 09:28:27 +0000 (UTC)
Received: from edo.cn.fujitsu.com (unknown [10.167.33.5])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits))
	(No client certificate requested)
	by az2uksmom2.o.css.fujitsu.com (Postfix) with ESMTPS id 4242B14005AB
	for <openembedded-core@lists.openembedded.org>; Wed,  6 Aug 2025 08:56:05 +0000 (UTC)
Received: from G08FNSTD190088.g08.fujitsu.local (unknown [10.193.129.116])
	by edo.cn.fujitsu.com (Postfix) with ESMTP id E08B61A0171;
	Wed,  6 Aug 2025 16:39:50 +0800 (CST)
From: Liu Yiding <liuyd.fnst@fujitsu.com>
To: openembedded-core@lists.openembedded.org
Cc: Liu Yiding <liuyd.fnst@fujitsu.com>
Subject: [OE-core] [PATCH 7/9] spirv-tools: upgrade 1.4.313 -> 1.4.321
Date: Wed,  6 Aug 2025 16:39:27 +0800
Message-ID: <20250806083929.747-7-liuyd.fnst@fujitsu.com>
X-Mailer: git-send-email 2.49.0.windows.1
In-Reply-To: <20250806083929.747-1-liuyd.fnst@fujitsu.com>
References: <20250806083929.747-1-liuyd.fnst@fujitsu.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Wed, 06 Aug 2025 09:28:31 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/221515

Changelog:
https://github.com/KhronosGroup/SPIRV-Tools/compare/vulkan-sdk-1.4.313.0...vulkan-sdk-1.4.321.0

Signed-off-by: Liu Yiding <liuyd.fnst@fujitsu.com>
---
 .../spir/{spirv-tools_1.4.313.0.bb => spirv-tools_1.4.321.0.bb} | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)
 rename meta/recipes-graphics/spir/{spirv-tools_1.4.313.0.bb => spirv-tools_1.4.321.0.bb} (97%)

diff --git a/meta/recipes-graphics/spir/spirv-tools_1.4.313.0.bb b/meta/recipes-graphics/spir/spirv-tools_1.4.321.0.bb
similarity index 97%
rename from meta/recipes-graphics/spir/spirv-tools_1.4.313.0.bb
rename to meta/recipes-graphics/spir/spirv-tools_1.4.321.0.bb
index 4594a1a942..319b25b7f4 100644
--- a/meta/recipes-graphics/spir/spirv-tools_1.4.313.0.bb
+++ b/meta/recipes-graphics/spir/spirv-tools_1.4.321.0.bb
@@ -7,7 +7,7 @@ SECTION = "graphics"
 LICENSE  = "Apache-2.0"
 LIC_FILES_CHKSUM = "file://LICENSE;md5=3b83ef96387f14655fc854ddc3c6bd57"
 
-SRCREV = "a62abcb402009b9ca5975e6167c09f237f630e0e"
+SRCREV = "33e02568181e3312f49a3cf33df470bf96ef293a"
 SRC_URI = "git://github.com/KhronosGroup/SPIRV-Tools.git;branch=main;protocol=https \
            "
 PE = "1"
-- 
2.43.0


