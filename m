Return-Path: <wangmy@fujitsu.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id BA1EFE78D56
	for <webhook@archiver.kernel.org>; Mon,  9 Feb 2026 09:03:55 +0000 (UTC)
Received: from esa3.hc1455-7.c3s2.iphmx.com (esa3.hc1455-7.c3s2.iphmx.com [207.54.90.49])
 by mx.groups.io with SMTP id smtpd.msgproc01-g2.43844.1770627829644227871
 for <openembedded-core@lists.openembedded.org>;
 Mon, 09 Feb 2026 01:03:50 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@fujitsu.com header.s=fj2 header.b=OE+Ydl0l;
 spf=pass (domain: fujitsu.com, ip: 207.54.90.49, mailfrom: wangmy@fujitsu.com)
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
  d=fujitsu.com; i=@fujitsu.com; q=dns/txt; s=fj2;
  t=1770627830; x=1802163830;
  h=from:to:cc:subject:date:message-id:in-reply-to:
   references:mime-version:content-transfer-encoding;
  bh=mDsaFY7OV1G8oBKr9VjyyKhBKPF0Ir7SDr3qdymLQf4=;
  b=OE+Ydl0l+ESnUj/cIyx6UTZpRbXIZkBqit4+kleGwLgMDzuGahTV7RKc
   RMW12mSJrOQJqpS5DguoSkFnkWimf5X/bvvZ5vQHvbE2xqCdibmPH3bc0
   WLVsKjQ2jOVwd/ss2LIFHOnOiila8+N2LVKOKvT5SP8oe2d45bRzPeW2N
   Gi9H2jLpJseW1566BB2ICG6PaX0QLtOUvgZiFtimj6aT4V6WykwcBBO/y
   kcqzcLZJ3mS1wEOlx3I/kdnvfk6jSY3AwOF66c7q8P+MJcvt2wcmJA1/r
   h/YN3gKpogUIwhOLglpCMEUonEWhPCFwT5DtMV3HvBZXo0VxWq2xqhnpS
   w==;
X-CSE-ConnectionGUID: IAjYrbzwQsyt2l5Sd9/6DQ==
X-CSE-MsgGUID: QNAQmXEpQ7meuuw4/+G3yA==
X-IronPort-AV: E=McAfee;i="6800,10657,11695"; a="229013501"
X-IronPort-AV: E=Sophos;i="6.21,281,1763391600"; 
   d="scan'208";a="229013501"
Received: from unknown (HELO mail.fujitsu.com) ([51.138.80.169])
  by esa3.hc1455-7.c3s2.iphmx.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 09 Feb 2026 18:03:48 +0900
Received: from az2uksmgm2.o.css.fujitsu.com (unknown [10.151.22.199])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by az2nlsmgr2.fujitsu.com (Postfix) with ESMTPS id E2399343
	for <openembedded-core@lists.openembedded.org>; Mon,  9 Feb 2026 09:03:47 +0000 (UTC)
Received: from az2nlsmom3.fujitsu.com (az2nlsmom3.o.css.fujitsu.com [10.150.26.199])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by az2uksmgm2.o.css.fujitsu.com (Postfix) with ESMTPS id 84A5118000DD
	for <openembedded-core@lists.openembedded.org>; Mon,  9 Feb 2026 09:03:47 +0000 (UTC)
Received: from G08FNSTD200057.g08.fujitsu.local (unknown [10.193.128.34])
	by az2nlsmom3.fujitsu.com (Postfix) with ESMTP id D0BC9101A412;
	Mon,  9 Feb 2026 09:03:44 +0000 (UTC)
From: Wang Mingyu < wangmy@fujitsu.com>
To: openembedded-core@lists.openembedded.org
Cc: Wang Mingyu <wangmy@fujitsu.com>
Subject: [OE-core] [PATCH 13/39] libxmu: upgrade 1.2.1 -> 1.3.1
Date: Mon,  9 Feb 2026 17:02:51 +0800
Message-ID: <20260209090317.1468-13-wangmy@fujitsu.com>
X-Mailer: git-send-email 2.49.0.windows.1
In-Reply-To: <20260209090317.1468-1-wangmy@fujitsu.com>
References: <20260209090317.1468-1-wangmy@fujitsu.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Mon, 09 Feb 2026 09:03:55 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/230724

From: Wang Mingyu <wangmy@fujitsu.com>

Signed-off-by: Wang Mingyu <wangmy@fujitsu.com>
---
 .../xorg-lib/{libxmu_1.2.1.bb => libxmu_1.3.1.bb}               | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)
 rename meta/recipes-graphics/xorg-lib/{libxmu_1.2.1.bb => libxmu_1.3.1.bb} (89%)

diff --git a/meta/recipes-graphics/xorg-lib/libxmu_1.2.1.bb b/meta/recipes-graphics/xorg-lib/libxmu_1.3.1.bb
similarity index 89%
rename from meta/recipes-graphics/xorg-lib/libxmu_1.2.1.bb
rename to meta/recipes-graphics/xorg-lib/libxmu_1.3.1.bb
index 51faf170bf..9f0c65ee94 100644
--- a/meta/recipes-graphics/xorg-lib/libxmu_1.2.1.bb
+++ b/meta/recipes-graphics/xorg-lib/libxmu_1.3.1.bb
@@ -27,4 +27,4 @@ FILES:libxmuu = "${libdir}/libXmuu.so.*"
 
 BBCLASSEXTEND = "native"
 
-SRC_URI[sha256sum] = "fcb27793248a39e5fcc5b9c4aec40cc0734b3ca76aac3d7d1c264e7f7e14e8b2"
+SRC_URI[sha256sum] = "81a99e94c4501e81c427cbaa4a11748b584933e94b7a156830c3621256857bc4"
-- 
2.43.0


