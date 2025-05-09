Return-Path: <wangmy@fujitsu.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 1DC29C3ABCD
	for <webhook@archiver.kernel.org>; Fri,  9 May 2025 03:58:01 +0000 (UTC)
Received: from esa9.hc1455-7.c3s2.iphmx.com (esa9.hc1455-7.c3s2.iphmx.com [139.138.36.223])
 by mx.groups.io with SMTP id smtpd.web11.6650.1746763072780630101
 for <openembedded-core@lists.openembedded.org>;
 Thu, 08 May 2025 20:57:53 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@fujitsu.com header.s=fj2 header.b=hwOEpTtH;
 spf=pass (domain: fujitsu.com, ip: 139.138.36.223, mailfrom: wangmy@fujitsu.com)
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
  d=fujitsu.com; i=@fujitsu.com; q=dns/txt; s=fj2;
  t=1746763073; x=1778299073;
  h=from:to:cc:subject:date:message-id:in-reply-to:
   references;
  bh=MiPwyo5VewWSnQ9mmtQ2PuZ7lvyubkAU2wLD/mQKIe8=;
  b=hwOEpTtHyVkIqCVVTQsXeaGlic9mM2H72AITV3NgZ9F9o7TU1oxK3U38
   rpUyRk71t8xkIQ3hHuvrZHl4Ay0cKRnpxeqPDjhy2sX4fQ7gMyNZKRy54
   Qev8dIZPjkRabjSy5+K8w8xNk81PsIawynnR26M8aJxyd0FkBFtI8dluc
   BGo9GgRjJdeLMTX8BdyjFXdfwnkxc2kyJN/WpJ+AWg+4DzLHhxy2MLiq1
   ctqVpFJ95/POzWQJ9GFJVWS4EtL4NMLOa+AqxFKceItmko/KGG8WUISqe
   c7tM7/YgO0en+A04Uud4r3bhBOZKaSqjFNJLdYKbfQcZXcXJZvZH7e0nS
   A==;
X-CSE-ConnectionGUID: BZRdULwCT76x1BWFDkczbg==
X-CSE-MsgGUID: VGnCT3GjQOq1Ht6C+cY/UQ==
X-IronPort-AV: E=McAfee;i="6700,10204,11427"; a="187277057"
X-IronPort-AV: E=Sophos;i="6.15,274,1739804400"; 
   d="scan'208";a="187277057"
Received: from unknown (HELO yto-r1.gw.nic.fujitsu.com) ([218.44.52.217])
  by esa9.hc1455-7.c3s2.iphmx.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 09 May 2025 12:57:50 +0900
Received: from yto-m3.gw.nic.fujitsu.com (yto-nat-yto-m3.gw.nic.fujitsu.com [192.168.83.66])
	by yto-r1.gw.nic.fujitsu.com (Postfix) with ESMTP id 772F9D6EA1
	for <openembedded-core@lists.openembedded.org>; Fri,  9 May 2025 12:57:48 +0900 (JST)
Received: from edo.cn.fujitsu.com (edo.cn.fujitsu.com [10.167.33.5])
	by yto-m3.gw.nic.fujitsu.com (Postfix) with ESMTP id 2F3A2144E3
	for <openembedded-core@lists.openembedded.org>; Fri,  9 May 2025 12:57:48 +0900 (JST)
Received: from localhost.localdomain (unknown [10.193.128.200])
	by edo.cn.fujitsu.com (Postfix) with ESMTP id B68971A009A;
	Fri,  9 May 2025 11:57:47 +0800 (CST)
From: wangmy@fujitsu.com
To: openembedded-core@lists.openembedded.org
Cc: Wang Mingyu <wangmy@fujitsu.com>
Subject: [OE-core] [PATCH 12/19] spirv-headers: upgrade 1.4.309.0 -> 1.4.313.0
Date: Fri,  9 May 2025 11:56:13 +0800
Message-Id: <1746762980-12783-12-git-send-email-wangmy@fujitsu.com>
X-Mailer: git-send-email 1.8.3.1
In-Reply-To: <1746762980-12783-1-git-send-email-wangmy@fujitsu.com>
References: <1746762980-12783-1-git-send-email-wangmy@fujitsu.com>
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Fri, 09 May 2025 03:58:01 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/216175

From: Wang Mingyu <wangmy@fujitsu.com>

Signed-off-by: Wang Mingyu <wangmy@fujitsu.com>
---
 .../{spirv-headers_1.4.309.0.bb => spirv-headers_1.4.313.0.bb}  | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)
 rename meta/recipes-graphics/spir/{spirv-headers_1.4.309.0.bb => spirv-headers_1.4.313.0.bb} (93%)

diff --git a/meta/recipes-graphics/spir/spirv-headers_1.4.309.0.bb b/meta/recipes-graphics/spir/spirv-headers_1.4.313.0.bb
similarity index 93%
rename from meta/recipes-graphics/spir/spirv-headers_1.4.309.0.bb
rename to meta/recipes-graphics/spir/spirv-headers_1.4.313.0.bb
index 71ec2f7b42..981c2599ae 100644
--- a/meta/recipes-graphics/spir/spirv-headers_1.4.309.0.bb
+++ b/meta/recipes-graphics/spir/spirv-headers_1.4.313.0.bb
@@ -4,7 +4,7 @@ HOMEPAGE = "https://www.khronos.org/registry/spir-v"
 LICENSE = "MIT"
 LIC_FILES_CHKSUM = "file://LICENSE;md5=d14ee3b13f42e9c9674acc5925c3d741"
 
-SRCREV = "09913f088a1197aba4aefd300a876b2ebbaa3391"
+SRCREV = "aa6cef192b8e693916eb713e7a9ccadf06062ceb"
 SRC_URI = "git://github.com/KhronosGroup/SPIRV-Headers;protocol=https;branch=main"
 PE = "1"
 # These recipes need to be updated in lockstep with each other:
-- 
2.43.0


