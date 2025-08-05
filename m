Return-Path: <liuyd.fnst@fujitsu.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id A662AC87FD3
	for <webhook@archiver.kernel.org>; Wed,  6 Aug 2025 10:24:31 +0000 (UTC)
Received: from esa6.hc1455-7.c3s2.iphmx.com (esa6.hc1455-7.c3s2.iphmx.com [68.232.139.139])
 by mx.groups.io with SMTP id smtpd.web11.22082.1754475858917912399
 for <openembedded-core@lists.openembedded.org>;
 Wed, 06 Aug 2025 03:24:21 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@fujitsu.com header.s=fj2 header.b=f7HzUfGr;
 spf=pass (domain: fujitsu.com, ip: 68.232.139.139, mailfrom: liuyd.fnst@fujitsu.com)
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
  d=fujitsu.com; i=@fujitsu.com; q=dns/txt; s=fj2;
  t=1754475861; x=1786011861;
  h=from:to:cc:subject:date:message-id:in-reply-to:
   references:mime-version:content-transfer-encoding;
  bh=yIswgYFkdhv+iFxoD/TTM7D7lfpGMo+tCV9Nlzh1dAc=;
  b=f7HzUfGrjuv6YRYtRj3uHGkIbeQ1/oL3dg3TxrvzXXgbLIh79Q1zYbEM
   RUHu9MQJtmDbchgiCF6PTSYSvesoVGQLA+yObo0WFTKEVBrPl0FdN7gCo
   q/vho3SKmPmRo+XpAKJ07t9eZu1viLtLeF+olvGmdDp/yAXW6NnHrBgPD
   VnO/DUHkT2dMbB+MFGfEms/u7TOsiuwdLLkNXYFWb4L8XKMfONc/zIEEL
   DAEqwu5d6QqfyEE05yzw9L0KB0eglzEGeomXCgdYg6HZGRuLzbgSsAZgj
   LWJS4qZiB0GC1881aD9h/TIWuKTVPDWJc5Vwo9uH530C0DfG/8rgJvQ0k
   Q==;
X-CSE-ConnectionGUID: XoeVBj4OSqKNaB1/t+avXw==
X-CSE-MsgGUID: R/rTXvp9SaeBapcHZBKb4w==
X-IronPort-AV: E=McAfee;i="6800,10657,11513"; a="211925854"
X-IronPort-AV: E=Sophos;i="6.17,268,1747666800"; 
   d="scan'208";a="211925854"
Received: from unknown (HELO az2uksmgr1.o.css.fujitsu.com) ([52.151.125.19])
  by esa6.hc1455-7.c3s2.iphmx.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 06 Aug 2025 19:24:21 +0900
Received: from az2uksmgm2.o.css.fujitsu.com (unknown [10.151.22.199])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by az2uksmgr1.o.css.fujitsu.com (Postfix) with ESMTPS id CC95A1C1C708
	for <openembedded-core@lists.openembedded.org>; Wed,  6 Aug 2025 10:24:20 +0000 (UTC)
Received: from az2nlsmom3.fujitsu.com (az2nlsmom3.o.css.fujitsu.com [10.150.26.199])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by az2uksmgm2.o.css.fujitsu.com (Postfix) with ESMTPS id 871C118000EF
	for <openembedded-core@lists.openembedded.org>; Wed,  6 Aug 2025 10:24:20 +0000 (UTC)
Received: from edo.cn.fujitsu.com (edo.cn.fujitsu.com [10.167.33.5])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits))
	(No client certificate requested)
	by az2nlsmom3.fujitsu.com (Postfix) with ESMTPS id 692A8101F4B3
	for <openembedded-core@lists.openembedded.org>; Wed,  6 Aug 2025 10:24:18 +0000 (UTC)
Received: from G08FNSTD190088.g08.fujitsu.local (unknown [10.193.129.116])
	by edo.cn.fujitsu.com (Postfix) with ESMTP id 821EC1A0113;
	Tue,  5 Aug 2025 17:06:44 +0800 (CST)
From: Liu Yiding <liuyd.fnst@fujitsu.com>
To: openembedded-core@lists.openembedded.org
Cc: Liu Yiding <liuyd.fnst@fujitsu.com>
Subject: [OE-core] [PATCH 9/9] glslang: upgrade 1.4.313 -> 1.4.321
Date: Tue,  5 Aug 2025 17:06:23 +0800
Message-ID: <20250805090624.711-9-liuyd.fnst@fujitsu.com>
X-Mailer: git-send-email 2.49.0.windows.1
In-Reply-To: <20250805090624.711-1-liuyd.fnst@fujitsu.com>
References: <20250805090624.711-1-liuyd.fnst@fujitsu.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Wed, 06 Aug 2025 10:24:31 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/221527

Changelog:
https://github.com/KhronosGroup/Glslang/compare/vulkan-sdk-1.4.313.0...vulkan-sdk-1.4.321.0

Signed-off-by: Liu Yiding <liuyd.fnst@fujitsu.com>
---
 .../glslang/{glslang_1.4.313.0.bb => glslang_1.4.321.0.bb}    | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)
 rename meta/recipes-graphics/glslang/{glslang_1.4.313.0.bb => glslang_1.4.321.0.bb} (93%)

diff --git a/meta/recipes-graphics/glslang/glslang_1.4.313.0.bb b/meta/recipes-graphics/glslang/glslang_1.4.321.0.bb
similarity index 93%
rename from meta/recipes-graphics/glslang/glslang_1.4.313.0.bb
rename to meta/recipes-graphics/glslang/glslang_1.4.321.0.bb
index cb754c6ac8..2d6f098ad9 100644
--- a/meta/recipes-graphics/glslang/glslang_1.4.313.0.bb
+++ b/meta/recipes-graphics/glslang/glslang_1.4.321.0.bb
@@ -8,8 +8,8 @@ HOMEPAGE = "https://www.khronos.org/opengles/sdk/tools/Reference-Compiler"
 LICENSE = "BSD-3-Clause & BSD-2-Clause & MIT & Apache-2.0 & GPL-3-with-bison-exception"
 LIC_FILES_CHKSUM = "file://LICENSE.txt;md5=2a2b5acd7bc4844964cfda45fe807dc3"
 
-SRCREV = "fc9889c889561c5882e83819dcaffef5ed45529b"
-SRC_URI = "git://github.com/KhronosGroup/glslang.git;protocol=https;branch=vulkan-sdk-1.4.313;tag=vulkan-sdk-${PV} \
+SRCREV = "8a85691a0740d390761a1008b4696f57facd02c4"
+SRC_URI = "git://github.com/KhronosGroup/glslang.git;protocol=https;branch=vulkan-sdk-1.4.321;tag=vulkan-sdk-${PV} \
            file://0001-generate-glslang-pkg-config.patch \
            "
 PE = "1"
-- 
2.43.0


