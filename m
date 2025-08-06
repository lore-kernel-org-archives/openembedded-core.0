Return-Path: <liuyd.fnst@fujitsu.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 1E85AC87FCB
	for <webhook@archiver.kernel.org>; Wed,  6 Aug 2025 08:56:11 +0000 (UTC)
Received: from esa4.hc1455-7.c3s2.iphmx.com (esa4.hc1455-7.c3s2.iphmx.com [68.232.139.117])
 by mx.groups.io with SMTP id smtpd.web11.20651.1754470569892347481
 for <openembedded-core@lists.openembedded.org>;
 Wed, 06 Aug 2025 01:56:10 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@fujitsu.com header.s=fj2 header.b=Y5PzYkva;
 spf=pass (domain: fujitsu.com, ip: 68.232.139.117, mailfrom: liuyd.fnst@fujitsu.com)
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
  d=fujitsu.com; i=@fujitsu.com; q=dns/txt; s=fj2;
  t=1754470569; x=1786006569;
  h=from:to:cc:subject:date:message-id:in-reply-to:
   references:mime-version:content-transfer-encoding;
  bh=VrxDZ6XTlORReDnQFXfHP2ma1sPsDUHWbXAZEBqpEpQ=;
  b=Y5PzYkvaYxf00VpD2p3EQ1BcmpY7S04Q7MPCURsjKlcA3ILv+j/vF576
   PezIpxmudERAc+aae8TiCQfimkpUa43Z2B5tik5mG6gxzGZIPRD93HrAu
   d1w5/g6LC3xY9LvHxYjl2ji2eVKxLEXxGiGxNNSH5A6c6rSKdVsvXuw3i
   QncpkAikYIUzeXt5jRvNBRujACO2KAcEIvWe7cr0fwzJVFoG3/tGmfDtG
   Y5f+kTO+6FsWqQG6PQV9IPKeMzYcPZf7197PuNVtBW0PWqMMw8tbzdGdT
   NvsyOQqSNsFNURIrPs8412VU4dsDX/puvtqwE1rddWKS6BsQ6AqP0bb9Z
   Q==;
X-CSE-ConnectionGUID: 2t5sWpiFSxS+OTgiFIe0UQ==
X-CSE-MsgGUID: LCQbN/GMQK+mdE5i/eTjVQ==
X-IronPort-AV: E=McAfee;i="6800,10657,11513"; a="209137507"
X-IronPort-AV: E=Sophos;i="6.17,268,1747666800"; 
   d="scan'208";a="209137507"
Received: from unknown (HELO az2nlsmgr2.o.css.fujitsu.com) ([20.61.8.234])
  by esa4.hc1455-7.c3s2.iphmx.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 06 Aug 2025 17:56:07 +0900
Received: from az2nlsmgm3.fujitsu.com (unknown [10.150.26.205])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by az2nlsmgr2.o.css.fujitsu.com (Postfix) with ESMTPS id 2BA7F143C
	for <openembedded-core@lists.openembedded.org>; Wed,  6 Aug 2025 08:56:08 +0000 (UTC)
Received: from az2nlsmom4.fujitsu.com (az2nlsmom4.o.css.fujitsu.com [10.150.26.201])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by az2nlsmgm3.fujitsu.com (Postfix) with ESMTPS id D894A1803203
	for <openembedded-core@lists.openembedded.org>; Wed,  6 Aug 2025 08:56:07 +0000 (UTC)
Received: from edo.cn.fujitsu.com (edo.cn.fujitsu.com [10.167.33.5])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits))
	(No client certificate requested)
	by az2nlsmom4.fujitsu.com (Postfix) with ESMTPS id CBD7A200233A
	for <openembedded-core@lists.openembedded.org>; Wed,  6 Aug 2025 08:56:05 +0000 (UTC)
Received: from G08FNSTD190088.g08.fujitsu.local (unknown [10.193.129.116])
	by edo.cn.fujitsu.com (Postfix) with ESMTP id 3012F1A016D;
	Wed,  6 Aug 2025 16:39:47 +0800 (CST)
From: Liu Yiding <liuyd.fnst@fujitsu.com>
To: openembedded-core@lists.openembedded.org
Cc: Liu Yiding <liuyd.fnst@fujitsu.com>
Subject: [OE-core] [PATCH 4/9] vulkan-utility-libraries: upgrade 1.4.313 -> 1.4.321
Date: Wed,  6 Aug 2025 16:39:24 +0800
Message-ID: <20250806083929.747-4-liuyd.fnst@fujitsu.com>
X-Mailer: git-send-email 2.49.0.windows.1
In-Reply-To: <20250806083929.747-1-liuyd.fnst@fujitsu.com>
References: <20250806083929.747-1-liuyd.fnst@fujitsu.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Wed, 06 Aug 2025 08:56:11 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/221506

Changelog:
https://github.com/KhronosGroup/Vulkan-Utility-Libraries/compare/vulkan-sdk-1.4.313.0...vulkan-sdk-1.4.321.0

Signed-off-by: Liu Yiding <liuyd.fnst@fujitsu.com>
---
 ...ies_1.4.313.0.bb => vulkan-utility-libraries_1.4.321.0.bb} | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)
 rename meta/recipes-graphics/vulkan/{vulkan-utility-libraries_1.4.313.0.bb => vulkan-utility-libraries_1.4.321.0.bb} (91%)

diff --git a/meta/recipes-graphics/vulkan/vulkan-utility-libraries_1.4.313.0.bb b/meta/recipes-graphics/vulkan/vulkan-utility-libraries_1.4.321.0.bb
similarity index 91%
rename from meta/recipes-graphics/vulkan/vulkan-utility-libraries_1.4.313.0.bb
rename to meta/recipes-graphics/vulkan/vulkan-utility-libraries_1.4.321.0.bb
index 1b38b6ec3a..54e8af6dcf 100644
--- a/meta/recipes-graphics/vulkan/vulkan-utility-libraries_1.4.313.0.bb
+++ b/meta/recipes-graphics/vulkan/vulkan-utility-libraries_1.4.321.0.bb
@@ -9,8 +9,8 @@ SECTION = "libs"
 LICENSE = "Apache-2.0"
 LIC_FILES_CHKSUM = "file://LICENSE.md;md5=4ca2d6799091aaa98a8520f1b793939b"
 
-SRC_URI = "git://github.com/KhronosGroup/Vulkan-Utility-Libraries.git;branch=vulkan-sdk-1.4.313;protocol=https"
-SRCREV = "4e246c56ec5afb5ad66b9b04374d39ac04675c8e"
+SRC_URI = "git://github.com/KhronosGroup/Vulkan-Utility-Libraries.git;branch=vulkan-sdk-1.4.321;protocol=https"
+SRCREV = "ec329e2721921f79743b90307ee047d08e057788"
 
 REQUIRED_DISTRO_FEATURES = "vulkan"
 
-- 
2.43.0


