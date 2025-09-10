Return-Path: <wangmy@fujitsu.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id B934ACAC58F
	for <webhook@archiver.kernel.org>; Wed, 10 Sep 2025 09:17:39 +0000 (UTC)
Received: from esa5.hc1455-7.c3s2.iphmx.com (esa5.hc1455-7.c3s2.iphmx.com [68.232.139.130])
 by mx.groups.io with SMTP id smtpd.web10.13230.1757495856193396271
 for <openembedded-core@lists.openembedded.org>;
 Wed, 10 Sep 2025 02:17:37 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@fujitsu.com header.s=fj2 header.b=H/Ftr3Fe;
 spf=pass (domain: fujitsu.com, ip: 68.232.139.130, mailfrom: wangmy@fujitsu.com)
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
  d=fujitsu.com; i=@fujitsu.com; q=dns/txt; s=fj2;
  t=1757495858; x=1789031858;
  h=from:to:cc:subject:date:message-id:in-reply-to:
   references:mime-version:content-transfer-encoding;
  bh=afxbxvsZYK5MxAT7IzEZiDA7OVUZIdqJF2UGxG9+hTw=;
  b=H/Ftr3FeREL4p3rte+H12h2wZL2w+jS+GqIwhb/PAdFTELyFfeYMiamg
   VfVwSgh/ksPCH21a+NObUmGmXHXpoPdQRN6/0QAFpVPEBX5+2j9xBDh66
   smMx3XN8mMupF3u8SphoLmVHi4jelceJQWdEesDlSFnt0lUhsUWn5EkPY
   UjAALDNVXbUZPLOoMjUS73M0x1J4qi04UatdE9PIaR1S2YFgwaLoDWXVd
   +8I86VoGuN29pf5H8fNHAmr5Cj8EKimKefQtiVS/sW22EyRfV8b1O9QAF
   yaS8quYk6i8YibOJtSd0a57EMrVS1v7W0PW8Hr7eO+EJ9AAmWWe75zgUz
   A==;
X-CSE-ConnectionGUID: O7CHYV8kTY+EUa9eDmUg1w==
X-CSE-MsgGUID: ul9FuLejRM6ccxWt2DYGGA==
X-IronPort-AV: E=McAfee;i="6800,10657,11548"; a="211787001"
X-IronPort-AV: E=Sophos;i="6.18,253,1751209200"; 
   d="scan'208";a="211787001"
Received: from unknown (HELO az2uksmgr3.o.css.fujitsu.com) ([52.151.125.128])
  by esa5.hc1455-7.c3s2.iphmx.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 10 Sep 2025 18:17:36 +0900
Received: from az2uksmgm2.o.css.fujitsu.com (unknown [10.151.22.199])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by az2uksmgr3.o.css.fujitsu.com (Postfix) with ESMTPS id E65DB1002BBA
	for <openembedded-core@lists.openembedded.org>; Wed, 10 Sep 2025 09:17:35 +0000 (UTC)
Received: from az2uksmom3.o.css.fujitsu.com (az2uksmom3.o.css.fujitsu.com [10.151.22.205])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by az2uksmgm2.o.css.fujitsu.com (Postfix) with ESMTPS id A4E291800243
	for <openembedded-core@lists.openembedded.org>; Wed, 10 Sep 2025 09:17:35 +0000 (UTC)
Received: from edo.cn.fujitsu.com (edo.cn.fujitsu.com [10.167.33.5])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits))
	(No client certificate requested)
	by az2uksmom3.o.css.fujitsu.com (Postfix) with ESMTPS id 2A7D61005126
	for <openembedded-core@lists.openembedded.org>; Wed, 10 Sep 2025 09:17:34 +0000 (UTC)
Received: from G08FNSTD200057.g08.fujitsu.local (unknown [10.193.128.28])
	by edo.cn.fujitsu.com (Postfix) with ESMTP id 41E1E1A0090;
	Wed, 10 Sep 2025 17:17:31 +0800 (CST)
From: Wang Mingyu < wangmy@fujitsu.com>
To: openembedded-core@lists.openembedded.org
Cc: Wang Mingyu <wangmy@fujitsu.com>
Subject: [OE-core] [PATCH 20/40] libxscrnsaver: upgrade 1.2.4 -> 1.2.5
Date: Wed, 10 Sep 2025 17:16:26 +0800
Message-ID: <20250910091646.998-20-wangmy@fujitsu.com>
X-Mailer: git-send-email 2.49.0.windows.1
In-Reply-To: <20250910091646.998-1-wangmy@fujitsu.com>
References: <20250910091646.998-1-wangmy@fujitsu.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Wed, 10 Sep 2025 09:17:39 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/223170

From: Wang Mingyu <wangmy@fujitsu.com>

Signed-off-by: Wang Mingyu <wangmy@fujitsu.com>
---
 .../xorg-lib/{libxscrnsaver_1.2.4.bb => libxscrnsaver_1.2.5.bb} | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)
 rename meta/recipes-graphics/xorg-lib/{libxscrnsaver_1.2.4.bb => libxscrnsaver_1.2.5.bb} (89%)

diff --git a/meta/recipes-graphics/xorg-lib/libxscrnsaver_1.2.4.bb b/meta/recipes-graphics/xorg-lib/libxscrnsaver_1.2.5.bb
similarity index 89%
rename from meta/recipes-graphics/xorg-lib/libxscrnsaver_1.2.4.bb
rename to meta/recipes-graphics/xorg-lib/libxscrnsaver_1.2.5.bb
index 1b407f52f0..f6cdb2e417 100644
--- a/meta/recipes-graphics/xorg-lib/libxscrnsaver_1.2.4.bb
+++ b/meta/recipes-graphics/xorg-lib/libxscrnsaver_1.2.5.bb
@@ -19,4 +19,4 @@ PE = "1"
 
 XORG_PN = "libXScrnSaver"
 
-SRC_URI[sha256sum] = "75cd2859f38e207a090cac980d76bc71e9da99d48d09703584e00585abc920fe"
+SRC_URI[sha256sum] = "5057365f847253e0e275871441e10ff7846c8322a5d88e1e187d326de1cd8d00"
-- 
2.43.0


