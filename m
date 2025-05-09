Return-Path: <wangmy@fujitsu.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 156D5C3ABBC
	for <webhook@archiver.kernel.org>; Fri,  9 May 2025 03:56:41 +0000 (UTC)
Received: from esa2.hc1455-7.c3s2.iphmx.com (esa2.hc1455-7.c3s2.iphmx.com [207.54.90.48])
 by mx.groups.io with SMTP id smtpd.web11.6636.1746762998304323870
 for <openembedded-core@lists.openembedded.org>;
 Thu, 08 May 2025 20:56:38 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@fujitsu.com header.s=fj2 header.b=Pgo51hVq;
 spf=pass (domain: fujitsu.com, ip: 207.54.90.48, mailfrom: wangmy@fujitsu.com)
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
  d=fujitsu.com; i=@fujitsu.com; q=dns/txt; s=fj2;
  t=1746762999; x=1778298999;
  h=from:to:cc:subject:date:message-id;
  bh=zueacxApwU9tGM0sqwSAZRDO7r749KXFcrwI7oCFNlw=;
  b=Pgo51hVq6BSmUBSgqt/z//ZjApLDyPx4FqBCYT0klXRvfoUkQsj55BxV
   5mYKMSzNhKaGL5VCe6HelNcRYfhjWExo4U+qo0bVWjLV7n0KjpWf738wJ
   8DjSmtbPtWtVP7tZB60z5GuXb6+X88gmTbOhvBypV8UDWwsbPiOS10nUo
   8+JtB++UGmK0kBAabroixI2PrCrbBWwDNtDGM+otRVynWmYKHMwozUp6Q
   b78swZdC87KVoWlipD2/tILFtUVNUToFpGlIkNEpXk7EDHBnzwH+y48tX
   aNZu071W+6ITDzW7pRlMGKdshAYZNQoO7qmofP6gl1cIu1NbejFCdAdnc
   g==;
X-CSE-ConnectionGUID: 8Ny9ZiDLQtmiQ/Uv9oTjkw==
X-CSE-MsgGUID: hSsGO95aSyqAZj30Kyvqlw==
X-IronPort-AV: E=McAfee;i="6700,10204,11427"; a="198854316"
X-IronPort-AV: E=Sophos;i="6.15,274,1739804400"; 
   d="scan'208";a="198854316"
Received: from unknown (HELO oym-r1.gw.nic.fujitsu.com) ([210.162.30.89])
  by esa2.hc1455-7.c3s2.iphmx.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 09 May 2025 12:56:36 +0900
Received: from oym-m3.gw.nic.fujitsu.com (oym-nat-oym-m3.gw.nic.fujitsu.com [192.168.87.60])
	by oym-r1.gw.nic.fujitsu.com (Postfix) with ESMTP id DAA93D4809
	for <openembedded-core@lists.openembedded.org>; Fri,  9 May 2025 12:56:33 +0900 (JST)
Received: from edo.cn.fujitsu.com (edo.cn.fujitsu.com [10.167.33.5])
	by oym-m3.gw.nic.fujitsu.com (Postfix) with ESMTP id 928EFD72A9
	for <openembedded-core@lists.openembedded.org>; Fri,  9 May 2025 12:56:33 +0900 (JST)
Received: from localhost.localdomain (unknown [10.193.128.200])
	by edo.cn.fujitsu.com (Postfix) with ESMTP id F044D1A009A;
	Fri,  9 May 2025 11:56:32 +0800 (CST)
From: wangmy@fujitsu.com
To: openembedded-core@lists.openembedded.org
Cc: Wang Mingyu <wangmy@fujitsu.com>
Subject: [OE-core] [PATCH 01/19] glslang: upgrade 1.4.309.0 -> 1.4.313.0
Date: Fri,  9 May 2025 11:56:02 +0800
Message-Id: <1746762980-12783-1-git-send-email-wangmy@fujitsu.com>
X-Mailer: git-send-email 1.8.3.1
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Fri, 09 May 2025 03:56:41 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/216164

From: Wang Mingyu <wangmy@fujitsu.com>

Signed-off-by: Wang Mingyu <wangmy@fujitsu.com>
---
 .../glslang/{glslang_1.4.309.0.bb => glslang_1.4.313.0.bb}    | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)
 rename meta/recipes-graphics/glslang/{glslang_1.4.309.0.bb => glslang_1.4.313.0.bb} (93%)

diff --git a/meta/recipes-graphics/glslang/glslang_1.4.309.0.bb b/meta/recipes-graphics/glslang/glslang_1.4.313.0.bb
similarity index 93%
rename from meta/recipes-graphics/glslang/glslang_1.4.309.0.bb
rename to meta/recipes-graphics/glslang/glslang_1.4.313.0.bb
index 99fbe8e9d5..988b2ef2a3 100644
--- a/meta/recipes-graphics/glslang/glslang_1.4.309.0.bb
+++ b/meta/recipes-graphics/glslang/glslang_1.4.313.0.bb
@@ -8,8 +8,8 @@ HOMEPAGE = "https://www.khronos.org/opengles/sdk/tools/Reference-Compiler"
 LICENSE = "BSD-3-Clause & BSD-2-Clause & MIT & Apache-2.0 & GPL-3-with-bison-exception"
 LIC_FILES_CHKSUM = "file://LICENSE.txt;md5=2a2b5acd7bc4844964cfda45fe807dc3"
 
-SRCREV = "7200bc12a8979d13b22cd52de80ffb7d41939615"
-SRC_URI = "git://github.com/KhronosGroup/glslang.git;protocol=https;branch=vulkan-sdk-1.4.309 \
+SRCREV = "fc9889c889561c5882e83819dcaffef5ed45529b"
+SRC_URI = "git://github.com/KhronosGroup/glslang.git;protocol=https;branch=vulkan-sdk-1.4.313;tag=vulkan-sdk-${PV} \
            file://0001-generate-glslang-pkg-config.patch \
            "
 PE = "1"
-- 
2.43.0


