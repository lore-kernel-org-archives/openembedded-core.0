Return-Path: <wangmy@fujitsu.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id A62EEE78D55
	for <webhook@archiver.kernel.org>; Mon,  9 Feb 2026 09:03:45 +0000 (UTC)
Received: from esa4.hc1455-7.c3s2.iphmx.com (esa4.hc1455-7.c3s2.iphmx.com [68.232.139.117])
 by mx.groups.io with SMTP id smtpd.msgproc01-g2.43821.1770627816915276015
 for <openembedded-core@lists.openembedded.org>;
 Mon, 09 Feb 2026 01:03:37 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@fujitsu.com header.s=fj2 header.b=PoI+aKl8;
 spf=pass (domain: fujitsu.com, ip: 68.232.139.117, mailfrom: wangmy@fujitsu.com)
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
  d=fujitsu.com; i=@fujitsu.com; q=dns/txt; s=fj2;
  t=1770627817; x=1802163817;
  h=from:to:cc:subject:date:message-id:in-reply-to:
   references:mime-version:content-transfer-encoding;
  bh=0H7b2jWL+De1YOckqo4tEj4PdjuFRpIdbXtHQ24phvY=;
  b=PoI+aKl8LPHPJ8FFZQ0eHRToW6PenLJmop/XcMAeTvgDkLUwqihfLpsI
   oTZRwGcrHnqRHFxdast26HQeot/YkB48vrAhwW/oWAM2r3YW1f64g/MEf
   EfDODEMRTnDrgWBHyOTzro5PYbGn3xT1HL0H3nIyXrb+Cm3sKhTo4dj3Y
   x8ZEHzWD2xNp21/xFvfqspnhTNKu3bTyGwFO4bwiWujsWQex1D83H0oS8
   qaQQvZ/d0EJix4bjOshrJQUQhpeY5/hn4p2XQxSygTvtZpCOV719qo/e2
   nw4gdFxjzil9MWUVFo1bjRiluw5xPKd4A7vsUls4DCFhH0Q+Fvm1M5ahM
   Q==;
X-CSE-ConnectionGUID: aYrjy7yKQGazC9oQayx33A==
X-CSE-MsgGUID: 6XZ0JLL8QeSy7Or4eYuJpg==
X-IronPort-AV: E=McAfee;i="6800,10657,11695"; a="229682013"
X-IronPort-AV: E=Sophos;i="6.21,281,1763391600"; 
   d="scan'208";a="229682013"
Received: from unknown (HELO mail.fujitsu.com) ([51.138.80.169])
  by esa4.hc1455-7.c3s2.iphmx.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 09 Feb 2026 18:03:35 +0900
Received: from az2uksmgm3.o.css.fujitsu.com (unknown [10.151.22.200])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by az2nlsmgr1.fujitsu.com (Postfix) with ESMTPS id 59E631C000F7
	for <openembedded-core@lists.openembedded.org>; Mon,  9 Feb 2026 09:03:35 +0000 (UTC)
Received: from az2nlsmom3.fujitsu.com (az2nlsmom3.o.css.fujitsu.com [10.150.26.199])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by az2uksmgm3.o.css.fujitsu.com (Postfix) with ESMTPS id EFFCDC011A8
	for <openembedded-core@lists.openembedded.org>; Mon,  9 Feb 2026 09:03:34 +0000 (UTC)
Received: from G08FNSTD200057.g08.fujitsu.local (unknown [10.193.128.34])
	by az2nlsmom3.fujitsu.com (Postfix) with ESMTP id 4DB6F101A41A;
	Mon,  9 Feb 2026 09:03:32 +0000 (UTC)
From: Wang Mingyu < wangmy@fujitsu.com>
To: openembedded-core@lists.openembedded.org
Cc: Wang Mingyu <wangmy@fujitsu.com>
Subject: [OE-core] [PATCH 06/39] glslang: upgrade 1.4.335.0 -> 1.4.341.0
Date: Mon,  9 Feb 2026 17:02:44 +0800
Message-ID: <20260209090317.1468-6-wangmy@fujitsu.com>
X-Mailer: git-send-email 2.49.0.windows.1
In-Reply-To: <20260209090317.1468-1-wangmy@fujitsu.com>
References: <20260209090317.1468-1-wangmy@fujitsu.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Mon, 09 Feb 2026 09:03:45 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/230717

From: Wang Mingyu <wangmy@fujitsu.com>

Changelog:
===========
- Allow gl_FragDepth identifier to be redeclared
- Replace 'GL_TASK(MESH)_SHADER_NV' with 'GL_TASK(MESH)_SHADER_EXT'
- Scalarize swizzled MeshEXT stores
- Support GL_EXT_long_vector
- Add missing preamble #define for GL_EXT_nontemporal_keyword
- Support GL_NV_push_constant_bank
- Support GL_EXT_descriptor_heap

Signed-off-by: Wang Mingyu <wangmy@fujitsu.com>
---
 .../glslang/{glslang_1.4.335.0.bb => glslang_1.4.341.0.bb}      | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)
 rename meta/recipes-graphics/glslang/{glslang_1.4.335.0.bb => glslang_1.4.341.0.bb} (96%)

diff --git a/meta/recipes-graphics/glslang/glslang_1.4.335.0.bb b/meta/recipes-graphics/glslang/glslang_1.4.341.0.bb
similarity index 96%
rename from meta/recipes-graphics/glslang/glslang_1.4.335.0.bb
rename to meta/recipes-graphics/glslang/glslang_1.4.341.0.bb
index 7d3b5d0bc8..aa4f48bb9c 100644
--- a/meta/recipes-graphics/glslang/glslang_1.4.335.0.bb
+++ b/meta/recipes-graphics/glslang/glslang_1.4.341.0.bb
@@ -8,7 +8,7 @@ HOMEPAGE = "https://www.khronos.org/opengles/sdk/tools/Reference-Compiler"
 LICENSE = "BSD-3-Clause & BSD-2-Clause & MIT & Apache-2.0 & GPL-3-with-bison-exception"
 LIC_FILES_CHKSUM = "file://LICENSE.txt;md5=50ff9d0fcde2d5b953ebe431c48e34e3"
 
-SRCREV = "b5782e52ee2f7b3e40bb9c80d15b47016e008bc9"
+SRCREV = "f0bd0257c308b9a26562c1a30c4748a0219cc951"
 SRC_URI = "git://github.com/KhronosGroup/glslang.git;protocol=https;branch=main;tag=vulkan-sdk-${PV} \
            file://0001-generate-glslang-pkg-config.patch \
            "
-- 
2.43.0


