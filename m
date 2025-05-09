Return-Path: <wangmy@fujitsu.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 118A4C3ABCB
	for <webhook@archiver.kernel.org>; Fri,  9 May 2025 03:58:01 +0000 (UTC)
Received: from esa12.hc1455-7.c3s2.iphmx.com (esa12.hc1455-7.c3s2.iphmx.com [139.138.37.100])
 by mx.groups.io with SMTP id smtpd.web11.6653.1746763075121560113
 for <openembedded-core@lists.openembedded.org>;
 Thu, 08 May 2025 20:57:55 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@fujitsu.com header.s=fj2 header.b=j8dfRD6a;
 spf=pass (domain: fujitsu.com, ip: 139.138.37.100, mailfrom: wangmy@fujitsu.com)
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
  d=fujitsu.com; i=@fujitsu.com; q=dns/txt; s=fj2;
  t=1746763075; x=1778299075;
  h=from:to:cc:subject:date:message-id:in-reply-to:
   references;
  bh=sMHRprA6znYwOf3T379OLzjY5yyYvcMNilzYKqlLc24=;
  b=j8dfRD6aoMx+B2LF1sWS85TMH+nl7kCk0+5s1yt+BRqUY0GtTURh/gcF
   C3mrn2duhGASoPz8iN2V6XaGY5xYQ9UYxz3QMTr6gyJ2/ob7ICbOvg4Pw
   FwYWXqPWdACjQM9lwape2MKrBrJJaPNyKXzcJKhRm+1t0Zider3SdbFJT
   ZXs5fPh5dyVTU6pzD0IX0XypqsESmzfVpxu1UCOz6qhkD5xwREXB200c2
   sCAStghRHpwakCzTp2Yb8vKdkl8RnhXfX4qf3JqvD1EV0glO0PQi46pjS
   cIZDkRc1WzZ4o6sUt3hSsIkTqlbVatAqJ4ILhFJ87wwp/d76NEwSgyP44
   g==;
X-CSE-ConnectionGUID: K5rh+eyMTDWV99lVqh53pQ==
X-CSE-MsgGUID: Yvx9YYGkTNKshihmjn4FcA==
X-IronPort-AV: E=McAfee;i="6700,10204,11427"; a="177755625"
X-IronPort-AV: E=Sophos;i="6.15,274,1739804400"; 
   d="scan'208";a="177755625"
Received: from unknown (HELO yto-r2.gw.nic.fujitsu.com) ([218.44.52.218])
  by esa12.hc1455-7.c3s2.iphmx.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 09 May 2025 12:57:53 +0900
Received: from yto-m4.gw.nic.fujitsu.com (yto-nat-yto-m4.gw.nic.fujitsu.com [192.168.83.67])
	by yto-r2.gw.nic.fujitsu.com (Postfix) with ESMTP id D001696747
	for <openembedded-core@lists.openembedded.org>; Fri,  9 May 2025 12:57:50 +0900 (JST)
Received: from edo.cn.fujitsu.com (edo.cn.fujitsu.com [10.167.33.5])
	by yto-m4.gw.nic.fujitsu.com (Postfix) with ESMTP id 89B88D3F3E
	for <openembedded-core@lists.openembedded.org>; Fri,  9 May 2025 12:57:50 +0900 (JST)
Received: from localhost.localdomain (unknown [10.193.128.200])
	by edo.cn.fujitsu.com (Postfix) with ESMTP id 3563B1A009A;
	Fri,  9 May 2025 11:57:50 +0800 (CST)
From: wangmy@fujitsu.com
To: openembedded-core@lists.openembedded.org
Cc: Wang Mingyu <wangmy@fujitsu.com>
Subject: [OE-core] [PATCH 18/19] vulkan-validation-layers: upgrade 1.4.309.0 -> 1.4.313.0
Date: Fri,  9 May 2025 11:56:19 +0800
Message-Id: <1746762980-12783-18-git-send-email-wangmy@fujitsu.com>
X-Mailer: git-send-email 1.8.3.1
In-Reply-To: <1746762980-12783-1-git-send-email-wangmy@fujitsu.com>
References: <1746762980-12783-1-git-send-email-wangmy@fujitsu.com>
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Fri, 09 May 2025 03:58:01 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/216181

From: Wang Mingyu <wangmy@fujitsu.com>

License-Update: add Boost Softwar License v1.0 to LICENSE.txt

Signed-off-by: Wang Mingyu <wangmy@fujitsu.com>
---
 ...1.4.309.0.bb => vulkan-validation-layers_1.4.313.0.bb} | 8 ++++----
 1 file changed, 4 insertions(+), 4 deletions(-)
 rename meta/recipes-graphics/vulkan/{vulkan-validation-layers_1.4.309.0.bb => vulkan-validation-layers_1.4.313.0.bb} (89%)

diff --git a/meta/recipes-graphics/vulkan/vulkan-validation-layers_1.4.309.0.bb b/meta/recipes-graphics/vulkan/vulkan-validation-layers_1.4.313.0.bb
similarity index 89%
rename from meta/recipes-graphics/vulkan/vulkan-validation-layers_1.4.309.0.bb
rename to meta/recipes-graphics/vulkan/vulkan-validation-layers_1.4.313.0.bb
index f4be3895a8..65cafa359e 100644
--- a/meta/recipes-graphics/vulkan/vulkan-validation-layers_1.4.309.0.bb
+++ b/meta/recipes-graphics/vulkan/vulkan-validation-layers_1.4.313.0.bb
@@ -5,11 +5,11 @@ HOMEPAGE = "https://www.khronos.org/vulkan/"
 BUGTRACKER = "https://github.com/KhronosGroup/Vulkan-ValidationLayers"
 SECTION = "libs"
 
-LICENSE = "Apache-2.0 & MIT"
-LIC_FILES_CHKSUM = "file://LICENSE.txt;md5=cd3c0bc366cd9b6a906e22f0bcb5910f"
+LICENSE = "Apache-2.0 & MIT & BSL-1.0 "
+LIC_FILES_CHKSUM = "file://LICENSE.txt;md5=b1a17d548e004bfbbfaa0c40988b6b31"
 
-SRC_URI = "git://github.com/KhronosGroup/Vulkan-ValidationLayers.git;branch=vulkan-sdk-1.4.309;protocol=https"
-SRCREV = "3ba0e590a2e76475b3eef4043355b498fb64e752"
+SRC_URI = "git://github.com/KhronosGroup/Vulkan-ValidationLayers.git;branch=vulkan-sdk-1.4.313;protocol=https"
+SRCREV = "50b87dd4be883b63c10e3c4f7b9c5aac0c82efd3"
 
 S = "${WORKDIR}/git"
 
-- 
2.43.0


