Return-Path: <wangmy@fujitsu.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 70170D0C83D
	for <webhook@archiver.kernel.org>; Tue, 13 Jan 2026 10:26:01 +0000 (UTC)
Received: from esa6.hc1455-7.c3s2.iphmx.com (esa6.hc1455-7.c3s2.iphmx.com [68.232.139.139])
 by mx.groups.io with SMTP id smtpd.msgproc02-g2.55859.1768299949750758744
 for <openembedded-core@lists.openembedded.org>;
 Tue, 13 Jan 2026 02:25:55 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@fujitsu.com header.s=fj2 header.b=NkxsvG5O;
 spf=pass (domain: fujitsu.com, ip: 68.232.139.139, mailfrom: wangmy@fujitsu.com)
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
  d=fujitsu.com; i=@fujitsu.com; q=dns/txt; s=fj2;
  t=1768299955; x=1799835955;
  h=from:to:cc:subject:date:message-id:in-reply-to:
   references:mime-version:content-transfer-encoding;
  bh=G5e7A6DP4jUh4qliIPdY7cNmY8SH8zkRZRjs1Ntx6Zc=;
  b=NkxsvG5OAKCZx5RXvV2Xd4j01fwx4bWo0WgyI0iyeAkhmWhopJU6plqJ
   OT5HXL7yMADjIvPWze0aY2u1RyUS466GJGauaTXmXyal/ewgeaeBNPhG2
   Hl7eOcjguTN2T+4C76DLmnl6RECvEEDwxRyFMccT3I/m/HK1Zzx/lu7RO
   qkLrq+vHhOsysJFkZmZgx5qy4oGxO3CoXt0wq6PWXrP9dvo/W1lAssXjl
   aETe0CBnt4DV2hWov+zrikbe7NfQz3Q5BD879iWqdUuNSGp6alSWSpHJs
   1Hdthc8L+x9TSI3dGkuSQztZ0+JgvIUxbRZ5PXupttYt5yWpop4v+7KMt
   g==;
X-CSE-ConnectionGUID: R4tunBdrSr6f01gQzx5Vzg==
X-CSE-MsgGUID: 2KsrgFhoRV26GbNzwXswWg==
X-IronPort-AV: E=McAfee;i="6800,10657,11669"; a="229630053"
X-IronPort-AV: E=Sophos;i="6.21,222,1763391600"; 
   d="scan'208";a="229630053"
Received: from unknown (HELO az2uksmgr2.o.css.fujitsu.com) ([52.151.125.128])
  by esa6.hc1455-7.c3s2.iphmx.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 13 Jan 2026 19:25:55 +0900
Received: from az2uksmgm1.o.css.fujitsu.com (unknown [10.151.22.198])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by az2uksmgr2.o.css.fujitsu.com (Postfix) with ESMTPS id 86EFA82073B
	for <openembedded-core@lists.openembedded.org>; Tue, 13 Jan 2026 10:25:54 +0000 (UTC)
Received: from az2nlsmom1.o.css.fujitsu.com (az2nlsmom1.o.css.fujitsu.com [10.150.26.198])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by az2uksmgm1.o.css.fujitsu.com (Postfix) with ESMTPS id 4014D8D29CD
	for <openembedded-core@lists.openembedded.org>; Tue, 13 Jan 2026 10:25:54 +0000 (UTC)
Received: from G08FNSTD200057.g08.fujitsu.local (unknown [10.193.160.191])
	by az2nlsmom1.o.css.fujitsu.com (Postfix) with ESMTP id 6A6CA826FFC;
	Tue, 13 Jan 2026 10:25:51 +0000 (UTC)
From: Wang Mingyu < wangmy@fujitsu.com>
To: openembedded-core@lists.openembedded.org
Cc: Wang Mingyu <wangmy@fujitsu.com>
Subject: [OE-core] [PATCH 18/18] u-boot: upgrade 2025.10 -> 2026.01
Date: Tue, 13 Jan 2026 18:25:08 +0800
Message-ID: <20260113102509.728-18-wangmy@fujitsu.com>
X-Mailer: git-send-email 2.49.0.windows.1
In-Reply-To: <20260113102509.728-1-wangmy@fujitsu.com>
References: <20260113102509.728-1-wangmy@fujitsu.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Tue, 13 Jan 2026 10:26:01 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/229257

From: Wang Mingyu <wangmy@fujitsu.com>

Signed-off-by: Wang Mingyu <wangmy@fujitsu.com>
---
 meta/recipes-bsp/u-boot/u-boot-common.inc                       | 2 +-
 .../u-boot/{u-boot-tools_2025.10.bb => u-boot-tools_2026.01.bb} | 0
 .../recipes-bsp/u-boot/{u-boot_2025.10.bb => u-boot_2026.01.bb} | 0
 3 files changed, 1 insertion(+), 1 deletion(-)
 rename meta/recipes-bsp/u-boot/{u-boot-tools_2025.10.bb => u-boot-tools_2026.01.bb} (100%)
 rename meta/recipes-bsp/u-boot/{u-boot_2025.10.bb => u-boot_2026.01.bb} (100%)

diff --git a/meta/recipes-bsp/u-boot/u-boot-common.inc b/meta/recipes-bsp/u-boot/u-boot-common.inc
index 93ff0ca6ca..79ddde3f5c 100644
--- a/meta/recipes-bsp/u-boot/u-boot-common.inc
+++ b/meta/recipes-bsp/u-boot/u-boot-common.inc
@@ -12,7 +12,7 @@ PE = "1"
 
 # We use the revision in order to avoid having to fetch it from the
 # repo during parse
-SRCREV = "e50b1e8715011def8aff1588081a2649a2c6cd47"
+SRCREV = "127a42c7257a6ffbbd1575ed1cbaa8f5408a44b3"
 
 SRC_URI = "git://source.denx.de/u-boot/u-boot.git;protocol=https;branch=master;tag=v${PV}"
 
diff --git a/meta/recipes-bsp/u-boot/u-boot-tools_2025.10.bb b/meta/recipes-bsp/u-boot/u-boot-tools_2026.01.bb
similarity index 100%
rename from meta/recipes-bsp/u-boot/u-boot-tools_2025.10.bb
rename to meta/recipes-bsp/u-boot/u-boot-tools_2026.01.bb
diff --git a/meta/recipes-bsp/u-boot/u-boot_2025.10.bb b/meta/recipes-bsp/u-boot/u-boot_2026.01.bb
similarity index 100%
rename from meta/recipes-bsp/u-boot/u-boot_2025.10.bb
rename to meta/recipes-bsp/u-boot/u-boot_2026.01.bb
-- 
2.43.0


