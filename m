Return-Path: <wangmy@fujitsu.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 3200DC3ABD2
	for <webhook@archiver.kernel.org>; Fri,  9 May 2025 03:58:01 +0000 (UTC)
Received: from esa10.hc1455-7.c3s2.iphmx.com (esa10.hc1455-7.c3s2.iphmx.com [139.138.36.225])
 by mx.groups.io with SMTP id smtpd.web10.6528.1746763073576651698
 for <openembedded-core@lists.openembedded.org>;
 Thu, 08 May 2025 20:57:54 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@fujitsu.com header.s=fj2 header.b=odUo41HR;
 spf=pass (domain: fujitsu.com, ip: 139.138.36.225, mailfrom: wangmy@fujitsu.com)
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
  d=fujitsu.com; i=@fujitsu.com; q=dns/txt; s=fj2;
  t=1746763073; x=1778299073;
  h=from:to:cc:subject:date:message-id:in-reply-to:
   references;
  bh=eiShtQkNMnha3NRkYHOOaI7pBQHNFHSEKW0HSg8hfWA=;
  b=odUo41HRLz9zixuxPhKJ2hCU8On/zj7Xx1a2uzqwD8ePxD6s1vhVpKMl
   oYEXlHci+ijQWJ/kkRIwm39uZzTpH/wS+A/Po2qputOnYEinIPl7NdX1N
   SG+vZxSygB6lzLVBNz/hGk05+0Nk2nSASbuNBtEMQsOKnZrM42GwLq1Wd
   G2A2QyMR7m2Fy4pdfyZJiu/KZOl1VXLv7HUZtKgXraGAHoLAMo2laFOIq
   dhHK/aiVLOp1yPBpZXqHf2kOGqE/+HVKw1S0+TiNQgRzNDMv8PXzubFbo
   AK40DeVWTmJiUEgZXYDOKX/IL1BZhZxoLH92uT2WHKzEOCX7GPSIPxsOW
   Q==;
X-CSE-ConnectionGUID: QYARpCRxR1WNEzERFKpihQ==
X-CSE-MsgGUID: GNoseu0RQXiOM29jBk8GHw==
X-IronPort-AV: E=McAfee;i="6700,10204,11427"; a="186213073"
X-IronPort-AV: E=Sophos;i="6.15,274,1739804400"; 
   d="scan'208";a="186213073"
Received: from unknown (HELO oym-r4.gw.nic.fujitsu.com) ([210.162.30.92])
  by esa10.hc1455-7.c3s2.iphmx.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 09 May 2025 12:57:51 +0900
Received: from oym-m1.gw.nic.fujitsu.com (oym-nat-oym-m1.gw.nic.fujitsu.com [192.168.87.58])
	by oym-r4.gw.nic.fujitsu.com (Postfix) with ESMTP id 9AE41DC8CA
	for <openembedded-core@lists.openembedded.org>; Fri,  9 May 2025 12:57:49 +0900 (JST)
Received: from edo.cn.fujitsu.com (edo.cn.fujitsu.com [10.167.33.5])
	by oym-m1.gw.nic.fujitsu.com (Postfix) with ESMTP id 57B4BD8B00
	for <openembedded-core@lists.openembedded.org>; Fri,  9 May 2025 12:57:49 +0900 (JST)
Received: from localhost.localdomain (unknown [10.193.128.200])
	by edo.cn.fujitsu.com (Postfix) with ESMTP id D5C051A00A0;
	Fri,  9 May 2025 11:57:48 +0800 (CST)
From: wangmy@fujitsu.com
To: openembedded-core@lists.openembedded.org
Cc: Wang Mingyu <wangmy@fujitsu.com>
Subject: [OE-core] [PATCH 14/19] vulkan-headers: upgrade 1.4.309.0 -> 1.4.313.0
Date: Fri,  9 May 2025 11:56:15 +0800
Message-Id: <1746762980-12783-14-git-send-email-wangmy@fujitsu.com>
X-Mailer: git-send-email 1.8.3.1
In-Reply-To: <1746762980-12783-1-git-send-email-wangmy@fujitsu.com>
References: <1746762980-12783-1-git-send-email-wangmy@fujitsu.com>
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Fri, 09 May 2025 03:58:01 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/216177

From: Wang Mingyu <wangmy@fujitsu.com>

Signed-off-by: Wang Mingyu <wangmy@fujitsu.com>
---
 ...{vulkan-headers_1.4.309.0.bb => vulkan-headers_1.4.313.0.bb} | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)
 rename meta/recipes-graphics/vulkan/{vulkan-headers_1.4.309.0.bb => vulkan-headers_1.4.313.0.bb} (95%)

diff --git a/meta/recipes-graphics/vulkan/vulkan-headers_1.4.309.0.bb b/meta/recipes-graphics/vulkan/vulkan-headers_1.4.313.0.bb
similarity index 95%
rename from meta/recipes-graphics/vulkan/vulkan-headers_1.4.309.0.bb
rename to meta/recipes-graphics/vulkan/vulkan-headers_1.4.313.0.bb
index 8eab948172..12a6923ac6 100644
--- a/meta/recipes-graphics/vulkan/vulkan-headers_1.4.309.0.bb
+++ b/meta/recipes-graphics/vulkan/vulkan-headers_1.4.313.0.bb
@@ -11,7 +11,7 @@ LICENSE = "Apache-2.0 & MIT"
 LIC_FILES_CHKSUM = "file://LICENSE.md;md5=1bc355d8c4196f774c8b87ed1a8dd625"
 SRC_URI = "git://github.com/KhronosGroup/Vulkan-Headers.git;branch=main;protocol=https"
 
-SRCREV = "952f776f6573aafbb62ea717d871cd1d6816c387"
+SRCREV = "409c16be502e39fe70dd6fe2d9ad4842ef2c9a53"
 
 S = "${WORKDIR}/git"
 
-- 
2.43.0


