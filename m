Return-Path: <liuyd.fnst@fujitsu.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id D1B14C83F34
	for <webhook@archiver.kernel.org>; Wed, 23 Jul 2025 01:06:42 +0000 (UTC)
Received: from esa9.hc1455-7.c3s2.iphmx.com (esa9.hc1455-7.c3s2.iphmx.com [139.138.36.223])
 by mx.groups.io with SMTP id smtpd.web10.3834.1753232794892269185
 for <openembedded-core@lists.openembedded.org>;
 Tue, 22 Jul 2025 18:06:35 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@fujitsu.com header.s=fj2 header.b=nzgnz6KP;
 spf=pass (domain: fujitsu.com, ip: 139.138.36.223, mailfrom: liuyd.fnst@fujitsu.com)
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
  d=fujitsu.com; i=@fujitsu.com; q=dns/txt; s=fj2;
  t=1753232795; x=1784768795;
  h=from:to:cc:subject:date:message-id:mime-version:
   content-transfer-encoding;
  bh=Yhy9AFYgxip7atDLzj4IIz+QDOtzvFFvRjO8xiVFFX0=;
  b=nzgnz6KPF/FYlwwIy/5CLCf4t46uFTJg6rWxPM36bWJMbwWucHahC0hN
   kbhigK7XG7MuOIfS7aNHQuj434BBcN2pxNuDc4W4Hg7EKOGUDCjMEGydO
   0rLms8dz7WV0DsJaIy5mGu9P3ogF1/Uz3b5MekTtAFzi46MQltGgY4UfV
   ZCmoWVAMRAIs0u9GMqFlB5mDQ7MQCrZx9DGzxCmClYhwIAxXsrSS/0QUS
   P+NkAHD3+ccKVlPjlep7lw8f1Nz9jkrOYOPWLcTZdw9ZgQiWBSXSEhz4I
   60cy5r+1u2/V2k3tPpgxSgPV05HEef8rKzvuPXZ0U4M+JKhWvBOAuRavz
   w==;
X-CSE-ConnectionGUID: g6WQnEDVQDGKVX6zOdTMQg==
X-CSE-MsgGUID: Wfx5FyKUSlOxwVx1YEiFCw==
X-IronPort-AV: E=McAfee;i="6800,10657,11500"; a="195557714"
X-IronPort-AV: E=Sophos;i="6.16,333,1744038000"; 
   d="scan'208";a="195557714"
Received: from unknown (HELO az2uksmgr1.o.css.fujitsu.com) ([52.151.125.19])
  by esa9.hc1455-7.c3s2.iphmx.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 23 Jul 2025 10:06:33 +0900
Received: from az2uksmgm4.o.css.fujitsu.com (unknown [10.151.22.201])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by az2uksmgr1.o.css.fujitsu.com (Postfix) with ESMTPS id 34B731C01683
	for <openembedded-core@lists.openembedded.org>; Wed, 23 Jul 2025 01:06:33 +0000 (UTC)
Received: from edo.cn.fujitsu.com (edo.cn.fujitsu.com [10.167.33.5])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by az2uksmgm4.o.css.fujitsu.com (Postfix) with ESMTPS id A59D71400390
	for <openembedded-core@lists.openembedded.org>; Wed, 23 Jul 2025 01:06:32 +0000 (UTC)
Received: from G08FNSTD190088.g08.fujitsu.local (unknown [10.193.129.116])
	by edo.cn.fujitsu.com (Postfix) with ESMTP id A9D9B1A006C;
	Wed, 23 Jul 2025 09:06:29 +0800 (CST)
From: Liu Yiding <liuyd.fnst@fujitsu.com>
To: openembedded-core@lists.openembedded.org
Cc: Liu Yiding <liuyd.fnst@fujitsu.com>
Subject: [OE-core] [PATCH 01/12] barebox-tools: upgrade 2025.06.0 -> 2025.07.0
Date: Wed, 23 Jul 2025 09:06:03 +0800
Message-ID: <20250723010614.926-1-liuyd.fnst@fujitsu.com>
X-Mailer: git-send-email 2.49.0.windows.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Wed, 23 Jul 2025 01:06:42 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/220760

Changelog:  https://lore.barebox.org/barebox/aGUtKn1BbPXi4Y9m@pengutronix.de/T/#u
Migration Guide: https://barebox.org/doc/latest/migration-guides/migration-2025.07.0.html

Signed-off-by: Liu Yiding <liuyd.fnst@fujitsu.com>
---
 meta/recipes-bsp/barebox/barebox-common.inc | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/meta/recipes-bsp/barebox/barebox-common.inc b/meta/recipes-bsp/barebox/barebox-common.inc
index 67bc964188..a9a6a91db9 100644
--- a/meta/recipes-bsp/barebox/barebox-common.inc
+++ b/meta/recipes-bsp/barebox/barebox-common.inc
@@ -3,6 +3,6 @@ SECTION = "bootloaders"
 
 LIC_FILES_CHKSUM = "file://COPYING;md5=f5125d13e000b9ca1f0d3364286c4192"
 
-PV = "2025.06.0"
+PV = "2025.07.0"
 SRC_URI = "https://barebox.org/download/barebox-${PV}.tar.bz2"
-SRC_URI[sha256sum] = "d05bc1f85dc1d95b0b6b6a52cac0a469148fbb8f1edb0d352c3ca3b632426941"
+SRC_URI[sha256sum] = "92add334bd0f5847deb2c23da54c78b40e8bae4f93c545e62be28e2f0afe137b"
-- 
2.43.0


