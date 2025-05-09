Return-Path: <wangmy@fujitsu.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 3EB3EC3ABD3
	for <webhook@archiver.kernel.org>; Fri,  9 May 2025 03:58:01 +0000 (UTC)
Received: from esa1.hc1455-7.c3s2.iphmx.com (esa1.hc1455-7.c3s2.iphmx.com [207.54.90.47])
 by mx.groups.io with SMTP id smtpd.web11.6651.1746763074339247884
 for <openembedded-core@lists.openembedded.org>;
 Thu, 08 May 2025 20:57:54 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@fujitsu.com header.s=fj2 header.b=SLf6G1Wj;
 spf=pass (domain: fujitsu.com, ip: 207.54.90.47, mailfrom: wangmy@fujitsu.com)
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
  d=fujitsu.com; i=@fujitsu.com; q=dns/txt; s=fj2;
  t=1746763075; x=1778299075;
  h=from:to:cc:subject:date:message-id:in-reply-to:
   references;
  bh=jQObNc72KagS1I0iIOYwI1kmYthOXC56f8MGjOb00dw=;
  b=SLf6G1WjTFKCo6aohgkyQqjV5L1g4mt238y4a2BTBSkg+sIaDy6q4Nlb
   45x82NaIBYe1I7+E++CAyTXvoOEKpGo82ZjybNDoHgkB7yma8xcimy9+7
   D4RisFmpIF7Y+m5sM/zDS9XNcFExzg3laP3oxOJKUPDaBbTpmziBk20Ib
   UqFoftfvCk2TCFvnGptA3e6LTdKqx518HsMbbwjRvbEUz7xNFN30svkoN
   B2r5xPbyrculsXLlc68Wl133GEgvrZ58z64KU1L7q/sJlrsrIwNoSK+iq
   Qnt+2MqN9c0rk2Eg/ybvYznIWsVIiFvlFQd3zacddiZnAwFSYYOo/8TM7
   w==;
X-CSE-ConnectionGUID: Q2apo2mpS4O2DfXdM3UxDg==
X-CSE-MsgGUID: ShD3yHTpQOCVYfGG5mDkxg==
X-IronPort-AV: E=McAfee;i="6700,10204,11427"; a="198919263"
X-IronPort-AV: E=Sophos;i="6.15,274,1739804400"; 
   d="scan'208";a="198919263"
Received: from unknown (HELO yto-r2.gw.nic.fujitsu.com) ([218.44.52.218])
  by esa1.hc1455-7.c3s2.iphmx.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 09 May 2025 12:57:52 +0900
Received: from yto-m2.gw.nic.fujitsu.com (yto-nat-yto-m2.gw.nic.fujitsu.com [192.168.83.65])
	by yto-r2.gw.nic.fujitsu.com (Postfix) with ESMTP id 0303896741
	for <openembedded-core@lists.openembedded.org>; Fri,  9 May 2025 12:57:50 +0900 (JST)
Received: from edo.cn.fujitsu.com (edo.cn.fujitsu.com [10.167.33.5])
	by yto-m2.gw.nic.fujitsu.com (Postfix) with ESMTP id AD600D50BC
	for <openembedded-core@lists.openembedded.org>; Fri,  9 May 2025 12:57:49 +0900 (JST)
Received: from localhost.localdomain (unknown [10.193.128.200])
	by edo.cn.fujitsu.com (Postfix) with ESMTP id 2DD9F1A009A;
	Fri,  9 May 2025 11:57:49 +0800 (CST)
From: wangmy@fujitsu.com
To: openembedded-core@lists.openembedded.org
Cc: Wang Mingyu <wangmy@fujitsu.com>
Subject: [OE-core] [PATCH 15/19] vulkan-loader: upgrade 1.4.309.0 -> 1.4.313.0
Date: Fri,  9 May 2025 11:56:16 +0800
Message-Id: <1746762980-12783-15-git-send-email-wangmy@fujitsu.com>
X-Mailer: git-send-email 1.8.3.1
In-Reply-To: <1746762980-12783-1-git-send-email-wangmy@fujitsu.com>
References: <1746762980-12783-1-git-send-email-wangmy@fujitsu.com>
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Fri, 09 May 2025 03:58:01 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/216179

From: Wang Mingyu <wangmy@fujitsu.com>

Signed-off-by: Wang Mingyu <wangmy@fujitsu.com>
---
 ...{vulkan-loader_1.4.309.0.bb => vulkan-loader_1.4.313.0.bb} | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)
 rename meta/recipes-graphics/vulkan/{vulkan-loader_1.4.309.0.bb => vulkan-loader_1.4.313.0.bb} (95%)

diff --git a/meta/recipes-graphics/vulkan/vulkan-loader_1.4.309.0.bb b/meta/recipes-graphics/vulkan/vulkan-loader_1.4.313.0.bb
similarity index 95%
rename from meta/recipes-graphics/vulkan/vulkan-loader_1.4.309.0.bb
rename to meta/recipes-graphics/vulkan/vulkan-loader_1.4.313.0.bb
index 0db6412215..73f80d64ff 100644
--- a/meta/recipes-graphics/vulkan/vulkan-loader_1.4.309.0.bb
+++ b/meta/recipes-graphics/vulkan/vulkan-loader_1.4.313.0.bb
@@ -9,8 +9,8 @@ SECTION = "libs"
 
 LICENSE = "Apache-2.0"
 LIC_FILES_CHKSUM = "file://LICENSE.txt;md5=7dbefed23242760aa3475ee42801c5ac"
-SRC_URI = "git://github.com/KhronosGroup/Vulkan-Loader.git;branch=vulkan-sdk-1.4.309;protocol=https"
-SRCREV = "fa5f2bf40baa15c22be61e393e1dded6c06ee503"
+SRC_URI = "git://github.com/KhronosGroup/Vulkan-Loader.git;branch=vulkan-sdk-1.4.313;protocol=https"
+SRCREV = "fb78607414e154c7a5c01b23177ba719c8a44909"
 
 S = "${WORKDIR}/git"
 
-- 
2.43.0


