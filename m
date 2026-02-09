Return-Path: <wangmy@fujitsu.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id CDF62E78D53
	for <webhook@archiver.kernel.org>; Mon,  9 Feb 2026 09:04:05 +0000 (UTC)
Received: from esa7.hc1455-7.c3s2.iphmx.com (esa7.hc1455-7.c3s2.iphmx.com [139.138.61.252])
 by mx.groups.io with SMTP id smtpd.msgproc01-g2.43848.1770627836576923447
 for <openembedded-core@lists.openembedded.org>;
 Mon, 09 Feb 2026 01:03:57 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@fujitsu.com header.s=fj2 header.b=La3L9Q2r;
 spf=pass (domain: fujitsu.com, ip: 139.138.61.252, mailfrom: wangmy@fujitsu.com)
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
  d=fujitsu.com; i=@fujitsu.com; q=dns/txt; s=fj2;
  t=1770627836; x=1802163836;
  h=from:to:cc:subject:date:message-id:in-reply-to:
   references:mime-version:content-transfer-encoding;
  bh=h2cTxa2EK0hdxCq2KsGQ5Ofyssd9YZV3ax1aECIL9z0=;
  b=La3L9Q2r65s8ocBWrdAupeVPz4Kv3ciekFuLme44aN/daTwX8MTXsdil
   RO7XjMR3db02xFFrZf58neWJe/eqL+yLX957t6wN0L62r3wPawkGBFpL2
   bqHDxRWwxyJiuPPsjWkYWzLRBs8ECh+MVhkpTfQUFF7f5PetWzGMA0A/A
   rg3yWoCf35CIwkc7DAN7dzA1QSnHC7VJRaK6FvnXavQP+nxWdINosaQZq
   mf6KHND8sZDXgnNfQ20ZyCg7o3XC062LTzG34G939gtDjMwtEadSbgBQQ
   Z2sraZACApVLsD5LqVL4aTPllWH0ViPIxTzhRwrNto7qQJsABwvpe90SW
   w==;
X-CSE-ConnectionGUID: tz9rPvhQTWufxur7O9mjtg==
X-CSE-MsgGUID: +cxIFskqTv2xzpD96Yy9oA==
X-IronPort-AV: E=McAfee;i="6800,10657,11695"; a="207843967"
X-IronPort-AV: E=Sophos;i="6.21,281,1763391600"; 
   d="scan'208";a="207843967"
Received: from unknown (HELO mail.fujitsu.com) ([51.138.80.169])
  by esa7.hc1455-7.c3s2.iphmx.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 09 Feb 2026 18:03:55 +0900
Received: from az2nlsmgm2.o.css.fujitsu.com (unknown [10.150.26.202])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by az2nlsmgr2.fujitsu.com (Postfix) with ESMTPS id 0963A674C
	for <openembedded-core@lists.openembedded.org>; Mon,  9 Feb 2026 09:03:55 +0000 (UTC)
Received: from az2nlsmom3.fujitsu.com (az2nlsmom3.o.css.fujitsu.com [10.150.26.199])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by az2nlsmgm2.o.css.fujitsu.com (Postfix) with ESMTPS id B2E171C002C0
	for <openembedded-core@lists.openembedded.org>; Mon,  9 Feb 2026 09:03:54 +0000 (UTC)
Received: from G08FNSTD200057.g08.fujitsu.local (unknown [10.193.128.34])
	by az2nlsmom3.fujitsu.com (Postfix) with ESMTP id 20EB6101A41B;
	Mon,  9 Feb 2026 09:03:51 +0000 (UTC)
From: Wang Mingyu < wangmy@fujitsu.com>
To: openembedded-core@lists.openembedded.org
Cc: Wang Mingyu <wangmy@fujitsu.com>
Subject: [OE-core] [PATCH 17/39] libxxf86vm: upgrade 1.1.6 -> 1.1.7
Date: Mon,  9 Feb 2026 17:02:55 +0800
Message-ID: <20260209090317.1468-17-wangmy@fujitsu.com>
X-Mailer: git-send-email 2.49.0.windows.1
In-Reply-To: <20260209090317.1468-1-wangmy@fujitsu.com>
References: <20260209090317.1468-1-wangmy@fujitsu.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Mon, 09 Feb 2026 09:04:05 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/230728

From: Wang Mingyu <wangmy@fujitsu.com>

Signed-off-by: Wang Mingyu <wangmy@fujitsu.com>
---
 .../xorg-lib/{libxxf86vm_1.1.6.bb => libxxf86vm_1.1.7.bb}       | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)
 rename meta/recipes-graphics/xorg-lib/{libxxf86vm_1.1.6.bb => libxxf86vm_1.1.7.bb} (85%)

diff --git a/meta/recipes-graphics/xorg-lib/libxxf86vm_1.1.6.bb b/meta/recipes-graphics/xorg-lib/libxxf86vm_1.1.7.bb
similarity index 85%
rename from meta/recipes-graphics/xorg-lib/libxxf86vm_1.1.6.bb
rename to meta/recipes-graphics/xorg-lib/libxxf86vm_1.1.7.bb
index bde3ad3ad3..9afc3ef809 100644
--- a/meta/recipes-graphics/xorg-lib/libxxf86vm_1.1.6.bb
+++ b/meta/recipes-graphics/xorg-lib/libxxf86vm_1.1.7.bb
@@ -15,6 +15,6 @@ DEPENDS += "libxext xorgproto"
 PE = "1"
 
 XORG_PN = "libXxf86vm"
-SRC_URI[sha256sum] = "96af414c73ce1d5449ad04be7f9f27fa8330f844b6dda843ef22e3e1befb3ee3"
+SRC_URI[sha256sum] = "ae50c0f669e0af5a67cc4cd0f54f21d64a64d2660af883e80e95d3fe51b945d8"
 
 BBCLASSEXTEND = "native nativesdk"
-- 
2.43.0


