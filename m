Return-Path: <wangmy@fujitsu.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 0E666C83F35
	for <webhook@archiver.kernel.org>; Tue, 15 Jul 2025 08:08:36 +0000 (UTC)
Received: from esa7.hc1455-7.c3s2.iphmx.com (esa7.hc1455-7.c3s2.iphmx.com [139.138.61.252])
 by mx.groups.io with SMTP id smtpd.web10.2990.1752566910760890102
 for <openembedded-core@lists.openembedded.org>;
 Tue, 15 Jul 2025 01:08:33 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@fujitsu.com header.s=fj2 header.b=jE6v4Ek1;
 spf=pass (domain: fujitsu.com, ip: 139.138.61.252, mailfrom: wangmy@fujitsu.com)
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
  d=fujitsu.com; i=@fujitsu.com; q=dns/txt; s=fj2;
  t=1752566913; x=1784102913;
  h=from:to:cc:subject:date:message-id:in-reply-to:
   references:mime-version:content-transfer-encoding;
  bh=ki7cZ3pzwbBCsU6c5gt7rRJCqjJtEqp+Fui6ifN/NLc=;
  b=jE6v4Ek160AaOoUxjdbp4OLi0EGWg2n8M26iDbeIe4GO5wI9hNg+B3Q1
   ezSQjibbGe4nSrvKKqVlsjhZLmk36k8cW5dZLIBEjm16ZNyxs0FmyFI0B
   bMw5QOSP5oqRAkrzdKH/RdFctcqnPh1W3WG5g54vVPztXoY4JJDy0g9jP
   QYIf4VhbHtZPaxgGPO2yuZKIgQrUgku4OlwvITw3Qxnwmnbuh+TZ//D7X
   9Kiie08+D+MEETgAaQwg4NXFjrKdkbJN3/DVlePaDrml4kENQ8pxL26EW
   o7myLh1/4CL6D/Cpuu+bVEGUdfGLz6acdxAsiUKGy46kkPIk+SFAIZvHa
   Q==;
X-CSE-ConnectionGUID: JZMu4xn6QVGH2x6yT0ZGlQ==
X-CSE-MsgGUID: 9rwIZKldTEq5jvr9okdHpA==
X-IronPort-AV: E=McAfee;i="6800,10657,11491"; a="185255744"
X-IronPort-AV: E=Sophos;i="6.16,313,1744038000"; 
   d="scan'208";a="185255744"
Received: from unknown (HELO az2nlsmgr1.o.css.fujitsu.com) ([51.138.80.169])
  by esa7.hc1455-7.c3s2.iphmx.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 15 Jul 2025 17:08:32 +0900
Received: from az2nlsmgm4.fujitsu.com (unknown [10.150.26.204])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by az2nlsmgr1.o.css.fujitsu.com (Postfix) with ESMTPS id 7C0681C00084
	for <openembedded-core@lists.openembedded.org>; Tue, 15 Jul 2025 08:08:32 +0000 (UTC)
Received: from edo.cn.fujitsu.com (edo.cn.fujitsu.com [10.167.33.5])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by az2nlsmgm4.fujitsu.com (Postfix) with ESMTPS id C9F6710000EF
	for <openembedded-core@lists.openembedded.org>; Tue, 15 Jul 2025 08:08:31 +0000 (UTC)
Received: from G08FNSTD200057.g08.fujitsu.local (unknown [10.193.161.187])
	by edo.cn.fujitsu.com (Postfix) with ESMTP id 466F11A0096;
	Tue, 15 Jul 2025 16:08:28 +0800 (CST)
From: Wang Mingyu < wangmy@fujitsu.com>
To: openembedded-core@lists.openembedded.org
Cc: Wang Mingyu <wangmy@fujitsu.com>
Subject: [OE-core] [PATCH 11/19] mesa: upgrade 25.1.4 -> 25.1.5
Date: Tue, 15 Jul 2025 16:08:11 +0800
Message-ID: <20250715080819.622-11-wangmy@fujitsu.com>
X-Mailer: git-send-email 2.49.0.windows.1
In-Reply-To: <20250715080819.622-1-wangmy@fujitsu.com>
References: <20250715080819.622-1-wangmy@fujitsu.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Tue, 15 Jul 2025 08:08:36 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/220279

From: Wang Mingyu <wangmy@fujitsu.com>

Signed-off-by: Wang Mingyu <wangmy@fujitsu.com>
---
 meta/recipes-graphics/mesa/mesa.inc | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/meta/recipes-graphics/mesa/mesa.inc b/meta/recipes-graphics/mesa/mesa.inc
index 3d9e9ec91f..47b95728e0 100644
--- a/meta/recipes-graphics/mesa/mesa.inc
+++ b/meta/recipes-graphics/mesa/mesa.inc
@@ -20,8 +20,8 @@ SRC_URI = "https://archive.mesa3d.org/mesa-${PV}.tar.xz \
            file://0001-dont-build-clover-frontend.patch \
 "
 
-SRC_URI[sha256sum] = "164872a5e792408aa72fecd52b7be6409724c4ad81700798675a7d801d976704"
-PV = "25.1.4"
+SRC_URI[sha256sum] = "3c4f6b10ff6ee950d0ec6ea733cc6e6d34c569454e3d39a9b276de9115a3b363"
+PV = "25.1.5"
 
 UPSTREAM_CHECK_GITTAGREGEX = "mesa-(?P<pver>\d+(\.\d+)+)"
 
-- 
2.43.0


