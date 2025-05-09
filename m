Return-Path: <wangmy@fujitsu.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 38267C3ABBC
	for <webhook@archiver.kernel.org>; Fri,  9 May 2025 03:58:11 +0000 (UTC)
Received: from esa3.hc1455-7.c3s2.iphmx.com (esa3.hc1455-7.c3s2.iphmx.com [207.54.90.49])
 by mx.groups.io with SMTP id smtpd.web11.6656.1746763086499837053
 for <openembedded-core@lists.openembedded.org>;
 Thu, 08 May 2025 20:58:06 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@fujitsu.com header.s=fj2 header.b=r3XxbtFe;
 spf=pass (domain: fujitsu.com, ip: 207.54.90.49, mailfrom: wangmy@fujitsu.com)
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
  d=fujitsu.com; i=@fujitsu.com; q=dns/txt; s=fj2;
  t=1746763087; x=1778299087;
  h=from:to:cc:subject:date:message-id:in-reply-to:
   references;
  bh=V7dUbz3oJ2ShuCM0aMx+AmNgfZx5k6zv7tc5jB9YPJE=;
  b=r3XxbtFepRrQyouxmKV2MQ86EgkVsmNTCGH5CYZYDX6OONy6yWgw/DBg
   KvlhawsinLtJiGxTPpF3uxCRQiibOLMM5g3PEF/9OCUaDWzYcZF6J6mZn
   BaM2sqilL9FHrR+Nh21vsxqZXVdx5SiiH593GVyngVmFk/eIiD3JlYXEM
   W0jy8m4eo8ovtdTqyVLieTjNV6dTUY3fxQMGic10QMGd6srBX+TvZf8xG
   ONvfXLl0HPyFi3G31WjxfNZU09lEoVedj208POmdz7jLa3G/E7KE8qbBF
   M0EPqix2qpEgggBQZI24/5aPScYOO2LiX1qpvlV0v9fM/vfBiN7HmW134
   w==;
X-CSE-ConnectionGUID: X1++yRm5R1Sheyu44JQoaw==
X-CSE-MsgGUID: Fuvwdr4mRCGs7LQDtMSmeQ==
X-IronPort-AV: E=McAfee;i="6700,10204,11427"; a="198845901"
X-IronPort-AV: E=Sophos;i="6.15,274,1739804400"; 
   d="scan'208";a="198845901"
Received: from unknown (HELO yto-r3.gw.nic.fujitsu.com) ([218.44.52.219])
  by esa3.hc1455-7.c3s2.iphmx.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 09 May 2025 12:57:54 +0900
Received: from yto-m2.gw.nic.fujitsu.com (yto-nat-yto-m2.gw.nic.fujitsu.com [192.168.83.65])
	by yto-r3.gw.nic.fujitsu.com (Postfix) with ESMTP id 7032FE8523
	for <openembedded-core@lists.openembedded.org>; Fri,  9 May 2025 12:57:51 +0900 (JST)
Received: from edo.cn.fujitsu.com (edo.cn.fujitsu.com [10.167.33.5])
	by yto-m2.gw.nic.fujitsu.com (Postfix) with ESMTP id 24F34D50BC
	for <openembedded-core@lists.openembedded.org>; Fri,  9 May 2025 12:57:51 +0900 (JST)
Received: from localhost.localdomain (unknown [10.193.128.200])
	by edo.cn.fujitsu.com (Postfix) with ESMTP id 9DD041A00A0;
	Fri,  9 May 2025 11:57:50 +0800 (CST)
From: wangmy@fujitsu.com
To: openembedded-core@lists.openembedded.org
Cc: Wang Mingyu <wangmy@fujitsu.com>
Subject: [OE-core] [PATCH 19/19] vulkan-volk: upgrade 1.4.309.0 -> 1.4.313.0
Date: Fri,  9 May 2025 11:56:20 +0800
Message-Id: <1746762980-12783-19-git-send-email-wangmy@fujitsu.com>
X-Mailer: git-send-email 1.8.3.1
In-Reply-To: <1746762980-12783-1-git-send-email-wangmy@fujitsu.com>
References: <1746762980-12783-1-git-send-email-wangmy@fujitsu.com>
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Fri, 09 May 2025 03:58:11 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/216182

From: Wang Mingyu <wangmy@fujitsu.com>

Signed-off-by: Wang Mingyu <wangmy@fujitsu.com>
---
 .../{vulkan-volk_1.4.309.0.bb => vulkan-volk_1.4.313.0.bb}      | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)
 rename meta/recipes-graphics/vulkan/{vulkan-volk_1.4.309.0.bb => vulkan-volk_1.4.313.0.bb} (95%)

diff --git a/meta/recipes-graphics/vulkan/vulkan-volk_1.4.309.0.bb b/meta/recipes-graphics/vulkan/vulkan-volk_1.4.313.0.bb
similarity index 95%
rename from meta/recipes-graphics/vulkan/vulkan-volk_1.4.309.0.bb
rename to meta/recipes-graphics/vulkan/vulkan-volk_1.4.313.0.bb
index 251ce229ae..5e661080a0 100644
--- a/meta/recipes-graphics/vulkan/vulkan-volk_1.4.309.0.bb
+++ b/meta/recipes-graphics/vulkan/vulkan-volk_1.4.313.0.bb
@@ -10,7 +10,7 @@ LICENSE = "MIT"
 LIC_FILES_CHKSUM = "file://LICENSE.md;md5=fb3d6e8051a71edca1e54bc38d35e5af"
 
 SRC_URI = "git://github.com/zeux/volk.git;branch=master;protocol=https"
-SRCREV = "58689c063427f5bad4f133625049b1a3c5dd8287"
+SRCREV = "43c29e655cb8117fd9cfb65ad9cefe2d40965102"
 
 S = "${WORKDIR}/git"
 
-- 
2.43.0


