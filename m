Return-Path: <wangmy@fujitsu.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 774F0D0C83F
	for <webhook@archiver.kernel.org>; Tue, 13 Jan 2026 10:26:01 +0000 (UTC)
Received: from esa12.hc1455-7.c3s2.iphmx.com (esa12.hc1455-7.c3s2.iphmx.com [139.138.37.100])
 by mx.groups.io with SMTP id smtpd.msgproc01-g2.56095.1768299953903858816
 for <openembedded-core@lists.openembedded.org>;
 Tue, 13 Jan 2026 02:25:54 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@fujitsu.com header.s=fj2 header.b=Kclp96mt;
 spf=pass (domain: fujitsu.com, ip: 139.138.37.100, mailfrom: wangmy@fujitsu.com)
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
  d=fujitsu.com; i=@fujitsu.com; q=dns/txt; s=fj2;
  t=1768299954; x=1799835954;
  h=from:to:cc:subject:date:message-id:in-reply-to:
   references:mime-version:content-transfer-encoding;
  bh=zxry+w9R4TwJe7pOKDjXLjbeZCBjuStwsoI9hQdh6ZY=;
  b=Kclp96mtryKOV5eGNan6GtMInNvaUq+pCem28YS3/AHe34DlkikqEzOi
   N9WQYbpLLCDVGOsxq3d/cMMrHrL2NyGfHZHhqGZkT2k50AZph/PwuPCr8
   gDpVzsx5VwaWRmXpPjQYsI2KmDhdhn8nNenqXeLzFyMYrHUzIBa8LMev7
   xK34W9y6KC55hyKomPnY8CV4ZOlkE+8fDWhKViWInYhJx6FbU7W2eFfhZ
   F7m5jt/rBjefLFY61PsZDsyUnG4pJSpxyZ6GCjRhGS4dxfbft6Gsre3o7
   n3rDvbhNac8ap6TnuFjbbUc7i53qqUEd3NgD01AJzjjrTyH1so62vYd4Y
   A==;
X-CSE-ConnectionGUID: AR6k2rp6R6WkbRzSmGataA==
X-CSE-MsgGUID: uOefU67SQIC/hheczQCTWg==
X-IronPort-AV: E=McAfee;i="6800,10657,11669"; a="204607249"
X-IronPort-AV: E=Sophos;i="6.21,222,1763391600"; 
   d="scan'208";a="204607249"
Received: from unknown (HELO az2uksmgr4.o.css.fujitsu.com) ([52.151.125.128])
  by esa12.hc1455-7.c3s2.iphmx.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 13 Jan 2026 19:25:52 +0900
Received: from az2uksmgm3.o.css.fujitsu.com (unknown [10.151.22.200])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by az2uksmgr4.o.css.fujitsu.com (Postfix) with ESMTPS id 6ED2DC0040E
	for <openembedded-core@lists.openembedded.org>; Tue, 13 Jan 2026 10:25:52 +0000 (UTC)
Received: from az2nlsmom1.o.css.fujitsu.com (az2nlsmom1.o.css.fujitsu.com [10.150.26.198])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by az2uksmgm3.o.css.fujitsu.com (Postfix) with ESMTPS id 28A5BC0181C
	for <openembedded-core@lists.openembedded.org>; Tue, 13 Jan 2026 10:25:52 +0000 (UTC)
Received: from G08FNSTD200057.g08.fujitsu.local (unknown [10.193.160.191])
	by az2nlsmom1.o.css.fujitsu.com (Postfix) with ESMTP id 570A7823080;
	Tue, 13 Jan 2026 10:25:49 +0000 (UTC)
From: Wang Mingyu < wangmy@fujitsu.com>
To: openembedded-core@lists.openembedded.org
Cc: Wang Mingyu <wangmy@fujitsu.com>
Subject: [OE-core] [PATCH 17/18] seatd: upgrade 0.9.1 -> 0.9.2
Date: Tue, 13 Jan 2026 18:25:07 +0800
Message-ID: <20260113102509.728-17-wangmy@fujitsu.com>
X-Mailer: git-send-email 2.49.0.windows.1
In-Reply-To: <20260113102509.728-1-wangmy@fujitsu.com>
References: <20260113102509.728-1-wangmy@fujitsu.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Tue, 13 Jan 2026 10:26:01 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/229256

From: Wang Mingyu <wangmy@fujitsu.com>

Signed-off-by: Wang Mingyu <wangmy@fujitsu.com>
---
 meta/recipes-core/seatd/{seatd_0.9.1.bb => seatd_0.9.2.bb} | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)
 rename meta/recipes-core/seatd/{seatd_0.9.1.bb => seatd_0.9.2.bb} (97%)

diff --git a/meta/recipes-core/seatd/seatd_0.9.1.bb b/meta/recipes-core/seatd/seatd_0.9.2.bb
similarity index 97%
rename from meta/recipes-core/seatd/seatd_0.9.1.bb
rename to meta/recipes-core/seatd/seatd_0.9.2.bb
index 3be27dda9d..9e1b50c087 100644
--- a/meta/recipes-core/seatd/seatd_0.9.1.bb
+++ b/meta/recipes-core/seatd/seatd_0.9.2.bb
@@ -8,7 +8,7 @@ LIC_FILES_CHKSUM = "file://LICENSE;md5=715a99d2dd552e6188e74d4ed2914d5a"
 
 SRC_URI = "git://git.sr.ht/~kennylevinsen/seatd;protocol=https;branch=master \
            file://init"
-SRCREV = "566ffeb032af42865dc1210e48cec08368059bb9"
+SRCREV = "a3c56c324c3a84474cc1615d94ccd6a6255d0c10"
 
 inherit meson pkgconfig systemd update-rc.d useradd
 
-- 
2.43.0


