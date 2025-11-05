Return-Path: <wangmy@fujitsu.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 98BA1CCF9F8
	for <webhook@archiver.kernel.org>; Wed,  5 Nov 2025 23:48:21 +0000 (UTC)
Received: from esa8.hc1455-7.c3s2.iphmx.com (esa8.hc1455-7.c3s2.iphmx.com [139.138.61.253])
 by mx.groups.io with SMTP id smtpd.msgproc02-g2.3013.1762386492576348548
 for <openembedded-core@lists.openembedded.org>;
 Wed, 05 Nov 2025 15:48:13 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@fujitsu.com header.s=fj2 header.b=bZq71j4F;
 spf=pass (domain: fujitsu.com, ip: 139.138.61.253, mailfrom: wangmy@fujitsu.com)
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
  d=fujitsu.com; i=@fujitsu.com; q=dns/txt; s=fj2;
  t=1762386492; x=1793922492;
  h=from:to:cc:subject:date:message-id:in-reply-to:
   references:mime-version:content-transfer-encoding;
  bh=XCFcoRGeO3qRd0+dPlOow5/Rf9n3xDBiYIHIjd32mZY=;
  b=bZq71j4F3kiWyN3Md8R2eOQNpWQDLo2vVHhPz1Rb5aGvxueGhqeBKQ0i
   jdlbTcemv7Nh81uad7yX57i8Ou5uhYSIIrQYAMrH8BnxPtx7YmLBb67Vt
   O5/pymU2F8dAWjEB6/zN3yLc1ASxg1N4RXRoTYLuXF+dx5AuL5Wp+xQjV
   rW5al9pZsmghFZHqjADU//cZv+3Gt7qypXRqSalPl9un7IoNw6VSwO5c4
   W3YENkajoO1RdXvgulHx4/JnN3V1o9xWSWW9Dz7BcPdx/WIubidrHy3lz
   awhu+j6x1e0HiJk9eUbJ+QJLxOqHtUZg8XERWLPYeZKHhSY8EezXgDqSB
   Q==;
X-CSE-ConnectionGUID: Bae9WBXCSYGkCiP05HB4Qg==
X-CSE-MsgGUID: 56L9X4cyQES76mH1v7PlTw==
X-IronPort-AV: E=McAfee;i="6800,10657,11604"; a="206185394"
X-IronPort-AV: E=Sophos;i="6.19,283,1754924400"; 
   d="scan'208";a="206185394"
Received: from unknown (HELO az2nlsmgr3.o.css.fujitsu.com) ([20.61.8.234])
  by esa8.hc1455-7.c3s2.iphmx.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 06 Nov 2025 08:48:11 +0900
Received: from az2nlsmgm3.fujitsu.com (unknown [10.150.26.205])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by az2nlsmgr3.o.css.fujitsu.com (Postfix) with ESMTPS id 05C8B10001E5
	for <openembedded-core@lists.openembedded.org>; Wed,  5 Nov 2025 23:48:11 +0000 (UTC)
Received: from az2uksmom2.o.css.fujitsu.com (az2uksmom2.o.css.fujitsu.com [10.151.22.203])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by az2nlsmgm3.fujitsu.com (Postfix) with ESMTPS id B97AD18019AE
	for <openembedded-core@lists.openembedded.org>; Wed,  5 Nov 2025 23:48:10 +0000 (UTC)
Received: from G08FNSTD200057.g08.fujitsu.local (unknown [10.167.135.104])
	by az2uksmom2.o.css.fujitsu.com (Postfix) with ESMTP id 3290714005BB;
	Wed,  5 Nov 2025 23:48:07 +0000 (UTC)
From: Wang Mingyu < wangmy@fujitsu.com>
To: openembedded-core@lists.openembedded.org
Cc: Wang Mingyu <wangmy@fujitsu.com>
Subject: [OE-core] [PATCH 29/29] libevdev: upgrade 1.13.4 -> 1.13.5
Date: Thu,  6 Nov 2025 07:47:12 +0800
Message-ID: <20251105234712.446-29-wangmy@fujitsu.com>
X-Mailer: git-send-email 2.49.0.windows.1
In-Reply-To: <20251105234712.446-1-wangmy@fujitsu.com>
References: <20251105234712.446-1-wangmy@fujitsu.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Wed, 05 Nov 2025 23:48:21 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/225959

From: Wang Mingyu <wangmy@fujitsu.com>

Signed-off-by: Wang Mingyu <wangmy@fujitsu.com>
---
 .../libevdev/{libevdev_1.13.4.bb => libevdev_1.13.5.bb}         | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)
 rename meta/recipes-support/libevdev/{libevdev_1.13.4.bb => libevdev_1.13.5.bb} (87%)

diff --git a/meta/recipes-support/libevdev/libevdev_1.13.4.bb b/meta/recipes-support/libevdev/libevdev_1.13.5.bb
similarity index 87%
rename from meta/recipes-support/libevdev/libevdev_1.13.4.bb
rename to meta/recipes-support/libevdev/libevdev_1.13.5.bb
index 3ff64bd04b..a42bd38489 100644
--- a/meta/recipes-support/libevdev/libevdev_1.13.4.bb
+++ b/meta/recipes-support/libevdev/libevdev_1.13.5.bb
@@ -10,7 +10,7 @@ LIC_FILES_CHKSUM = "file://COPYING;md5=80c550b3197bcb8da7d7557ebcc3fc46 \
                     "
 
 SRC_URI = "http://www.freedesktop.org/software/libevdev/${BP}.tar.xz"
-SRC_URI[sha256sum] = "f00ab8d42ad8b905296fab67e13b871f1a424839331516642100f82ad88127cd"
+SRC_URI[sha256sum] = "89918ae7b7c13936e6482604a77a2bfbbb74544c5d039fde01c3fa1bdf639987"
 
 inherit autotools pkgconfig
 
-- 
2.43.0


