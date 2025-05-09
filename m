Return-Path: <wangmy@fujitsu.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 102FCC3ABBC
	for <webhook@archiver.kernel.org>; Fri,  9 May 2025 03:58:01 +0000 (UTC)
Received: from esa11.hc1455-7.c3s2.iphmx.com (esa11.hc1455-7.c3s2.iphmx.com [207.54.90.137])
 by mx.groups.io with SMTP id smtpd.web11.6652.1746763074514481346
 for <openembedded-core@lists.openembedded.org>;
 Thu, 08 May 2025 20:57:54 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@fujitsu.com header.s=fj2 header.b=MKQjbDfW;
 spf=pass (domain: fujitsu.com, ip: 207.54.90.137, mailfrom: wangmy@fujitsu.com)
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
  d=fujitsu.com; i=@fujitsu.com; q=dns/txt; s=fj2;
  t=1746763074; x=1778299074;
  h=from:to:cc:subject:date:message-id:in-reply-to:
   references;
  bh=uUoczygg1rOHfBH6lCY6wmcXf1y5PnXrp+qQLG6D1cA=;
  b=MKQjbDfW/FW3okSaYIpn377W3NFwrxIUHNo4oIAmBtOJ+DssI39c1XfV
   E+9IHGuFLW1lEcD6XSuD3eFLi7VnT3IUnRpXx4i0I7c8iJQNrMHUZvb5e
   VwIaXaQGW33waHRvoOrEmu53AL/UXnWJYihCpzGvk2zd46Vrs53c3kF/X
   o8kI0ta03ShZOEOJGrB28tRSfnJcZuGyUujFTf/kMQvMbYCmnjOD7qOx+
   YUwLfKCtSB2RL+6tSpPYtf2eN5bZJs8kP2PB2X/kT9/unphlkG/TYtQee
   89XZ4mSjdnfOCVDKU3Wov2lLbhZEaMt/awCxBsaVZnkepToU7mSwryt87
   Q==;
X-CSE-ConnectionGUID: KcWMFNDoSBi05Za/4TtwAw==
X-CSE-MsgGUID: Osf1S0/rS+adzGQsTWgwFg==
X-IronPort-AV: E=McAfee;i="6700,10204,11427"; a="178352988"
X-IronPort-AV: E=Sophos;i="6.15,274,1739804400"; 
   d="scan'208";a="178352988"
Received: from unknown (HELO yto-r4.gw.nic.fujitsu.com) ([218.44.52.220])
  by esa11.hc1455-7.c3s2.iphmx.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 09 May 2025 12:57:52 +0900
Received: from yto-m4.gw.nic.fujitsu.com (yto-nat-yto-m4.gw.nic.fujitsu.com [192.168.83.67])
	by yto-r4.gw.nic.fujitsu.com (Postfix) with ESMTP id 4F357D4F5F
	for <openembedded-core@lists.openembedded.org>; Fri,  9 May 2025 12:57:50 +0900 (JST)
Received: from edo.cn.fujitsu.com (edo.cn.fujitsu.com [10.167.33.5])
	by yto-m4.gw.nic.fujitsu.com (Postfix) with ESMTP id 0C8A7D3F3B
	for <openembedded-core@lists.openembedded.org>; Fri,  9 May 2025 12:57:50 +0900 (JST)
Received: from localhost.localdomain (unknown [10.193.128.200])
	by edo.cn.fujitsu.com (Postfix) with ESMTP id 8B6B61A00A0;
	Fri,  9 May 2025 11:57:49 +0800 (CST)
From: wangmy@fujitsu.com
To: openembedded-core@lists.openembedded.org
Cc: Wang Mingyu <wangmy@fujitsu.com>
Subject: [OE-core] [PATCH 16/19] vulkan-tools: upgrade 1.4.309.0 -> 1.4.313.0
Date: Fri,  9 May 2025 11:56:17 +0800
Message-Id: <1746762980-12783-16-git-send-email-wangmy@fujitsu.com>
X-Mailer: git-send-email 1.8.3.1
In-Reply-To: <1746762980-12783-1-git-send-email-wangmy@fujitsu.com>
References: <1746762980-12783-1-git-send-email-wangmy@fujitsu.com>
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Fri, 09 May 2025 03:58:01 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/216180

From: Wang Mingyu <wangmy@fujitsu.com>

Signed-off-by: Wang Mingyu <wangmy@fujitsu.com>
---
 .../{vulkan-tools_1.4.309.0.bb => vulkan-tools_1.4.313.0.bb}  | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)
 rename meta/recipes-graphics/vulkan/{vulkan-tools_1.4.309.0.bb => vulkan-tools_1.4.313.0.bb} (94%)

diff --git a/meta/recipes-graphics/vulkan/vulkan-tools_1.4.309.0.bb b/meta/recipes-graphics/vulkan/vulkan-tools_1.4.313.0.bb
similarity index 94%
rename from meta/recipes-graphics/vulkan/vulkan-tools_1.4.309.0.bb
rename to meta/recipes-graphics/vulkan/vulkan-tools_1.4.313.0.bb
index 4215fa25d9..85578df467 100644
--- a/meta/recipes-graphics/vulkan/vulkan-tools_1.4.309.0.bb
+++ b/meta/recipes-graphics/vulkan/vulkan-tools_1.4.313.0.bb
@@ -6,8 +6,8 @@ SECTION = "libs"
 
 LICENSE = "Apache-2.0"
 LIC_FILES_CHKSUM = "file://LICENSE.txt;md5=3b83ef96387f14655fc854ddc3c6bd57"
-SRC_URI = "git://github.com/KhronosGroup/Vulkan-Tools.git;branch=vulkan-sdk-1.4.309;protocol=https"
-SRCREV = "bf9fcd2d62ea9eac52e5351c02e35cb61ec5e873"
+SRC_URI = "git://github.com/KhronosGroup/Vulkan-Tools.git;branch=vulkan-sdk-1.4.313;protocol=https"
+SRCREV = "ad2f0170f9466fadd96e3fdd65fad02cd3a3739b"
 
 S = "${WORKDIR}/git"
 
-- 
2.43.0


