Return-Path: <wangmy@fujitsu.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id A6073EC049C
	for <webhook@archiver.kernel.org>; Tue,  3 Mar 2026 10:10:27 +0000 (UTC)
Received: from esa10.hc1455-7.c3s2.iphmx.com (esa10.hc1455-7.c3s2.iphmx.com [139.138.36.225])
 by mx.groups.io with SMTP id smtpd.msgproc02-g2.14981.1772532619313022294
 for <openembedded-core@lists.openembedded.org>;
 Tue, 03 Mar 2026 02:10:19 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@fujitsu.com header.s=fj2 header.b=XCJELUY7;
 spf=pass (domain: fujitsu.com, ip: 139.138.36.225, mailfrom: wangmy@fujitsu.com)
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
  d=fujitsu.com; i=@fujitsu.com; q=dns/txt; s=fj2;
  t=1772532619; x=1804068619;
  h=from:to:cc:subject:date:message-id:in-reply-to:
   references:mime-version:content-transfer-encoding;
  bh=w/V/BgZXhsX/3egBgm7oNOHSXNN3IuOcipfFHeh77s8=;
  b=XCJELUY71Cjde5QXbpqErktBfM15uastWb0bgYqMJrq1YZIFTeX1aTLu
   yL194O1pHVkIqzxOlw7jahtQ/CoUljXJtBKBcMhWU1FR5PLijSyUjGMP2
   NfPl4TbP5IaDPvYPEwWDeGPfvRxjLlfQG7HxbLdTcgfx70x/tBweTuq+9
   TcEX2zp8oeFffCyEzDGIvsNH+YMPXi30nD5L+jmNuSSNtIdaEWnknrSKA
   WGE0zZPbJM3ghJvbsR59qevj6ypOlb7f22K18grTJcFhV38QkFtj6xJco
   cZa/QHnt0ZZ9n4R6+VQ4ASrbHY/2OAnHBZJ9d1acWw5JDElJVCu/KfxTl
   Q==;
X-CSE-ConnectionGUID: XlPJgLxPQsGt5tZoDV9qoA==
X-CSE-MsgGUID: ejKxqPetTVifbQqyzdZG9Q==
X-IronPort-AV: E=McAfee;i="6800,10657,11717"; a="219169609"
X-IronPort-AV: E=Sophos;i="6.21,321,1763391600"; 
   d="scan'208";a="219169609"
Received: from az2nlsmgm2.o.css.fujitsu.com (unknown [10.150.26.202])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by gmgwnl01.global.fujitsu.com (Postfix) with ESMTPS id E63F21C000BB
	for <openembedded-core@lists.openembedded.org>; Tue,  3 Mar 2026 10:10:17 +0000 (UTC)
Received: from az2uksmom3.o.css.fujitsu.com (az2uksmom3.o.css.fujitsu.com [10.151.22.205])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by az2nlsmgm2.o.css.fujitsu.com (Postfix) with ESMTPS id 8EA281C002AF
	for <openembedded-core@lists.openembedded.org>; Tue,  3 Mar 2026 10:10:17 +0000 (UTC)
Received: from G08FNSTD200057.g08.fujitsu.local (unknown [10.193.160.5])
	by az2uksmom3.o.css.fujitsu.com (Postfix) with ESMTP id D9E031001CE5;
	Tue,  3 Mar 2026 10:10:14 +0000 (UTC)
From: Wang Mingyu < wangmy@fujitsu.com>
To: openembedded-core@lists.openembedded.org
Cc: Wang Mingyu <wangmy@fujitsu.com>
Subject: [OE-core] [PATCH 19/23] spirv-llvm-translator: upgrade 21.1.3 -> 21.1.5
Date: Tue,  3 Mar 2026 18:09:24 +0800
Message-ID: <20260303100929.1624-19-wangmy@fujitsu.com>
X-Mailer: git-send-email 2.49.0.windows.1
In-Reply-To: <20260303100929.1624-1-wangmy@fujitsu.com>
References: <20260303100929.1624-1-wangmy@fujitsu.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Tue, 03 Mar 2026 10:10:27 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/232295

From: Wang Mingyu <wangmy@fujitsu.com>

Signed-off-by: Wang Mingyu <wangmy@fujitsu.com>
---
 ...lvm-translator_21.1.3.bb => spirv-llvm-translator_21.1.5.bb} | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)
 rename meta/recipes-graphics/spir/{spirv-llvm-translator_21.1.3.bb => spirv-llvm-translator_21.1.5.bb} (94%)

diff --git a/meta/recipes-graphics/spir/spirv-llvm-translator_21.1.3.bb b/meta/recipes-graphics/spir/spirv-llvm-translator_21.1.5.bb
similarity index 94%
rename from meta/recipes-graphics/spir/spirv-llvm-translator_21.1.3.bb
rename to meta/recipes-graphics/spir/spirv-llvm-translator_21.1.5.bb
index f8a7b8f32e..a727079a43 100644
--- a/meta/recipes-graphics/spir/spirv-llvm-translator_21.1.3.bb
+++ b/meta/recipes-graphics/spir/spirv-llvm-translator_21.1.5.bb
@@ -6,7 +6,7 @@ LIC_FILES_CHKSUM = "file://LICENSE.TXT;md5=47e311aa9caedd1b3abf098bd7814d1d"
 
 # pattern: llvm_branch_200, currently there are no minor releases, so, no llvm_branch_201
 SPIRV_BRANCH = "llvm_release_${@oe.utils.trim_version('${PV}', 1).replace('.', '')}0"
-SRCREV = "a79c852b36785588032a2dd7c39aa15ec4d24b20"
+SRCREV = "a76fd0702de564476fb31e8a15f1415f05ad8951"
 SRC_URI = " \
     git://github.com/KhronosGroup/SPIRV-LLVM-Translator;protocol=https;tag=v${PV};branch=${SPIRV_BRANCH} \
 "
-- 
2.43.0


