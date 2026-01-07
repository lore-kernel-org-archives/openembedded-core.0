Return-Path: <wangmy@fujitsu.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 73758CD5841
	for <webhook@archiver.kernel.org>; Wed,  7 Jan 2026 10:31:24 +0000 (UTC)
Received: from esa12.hc1455-7.c3s2.iphmx.com (esa12.hc1455-7.c3s2.iphmx.com [139.138.37.100])
 by mx.groups.io with SMTP id smtpd.msgproc02-g2.3115.1767781879908022623
 for <openembedded-core@lists.openembedded.org>;
 Wed, 07 Jan 2026 02:31:20 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@fujitsu.com header.s=fj2 header.b=kl+37cGH;
 spf=pass (domain: fujitsu.com, ip: 139.138.37.100, mailfrom: wangmy@fujitsu.com)
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
  d=fujitsu.com; i=@fujitsu.com; q=dns/txt; s=fj2;
  t=1767781880; x=1799317880;
  h=from:to:cc:subject:date:message-id:in-reply-to:
   references:mime-version:content-transfer-encoding;
  bh=8JVhVLi+3axktJopYe4r8znO8WUBuwtexlwL8WxBzD8=;
  b=kl+37cGH9AjajR79yw8tfLfoH18eG1RmJ95Fq19DmjHZLnXY0B+PaEcE
   C9okde7BMExKZHR7/pqUIdresKjrZk8Fcv1K9cqccY6JM5b0iMlN51k+F
   HdvezYRlR4pUqG7qjtaOoMprLsTKiWCoC60WM4gke8DkCU6rdYNFfWMUY
   ci8KdFoSV39D9ZAZPIeY1Q3uXn1pSwvC0xzRdFMSO3JMvCuYjZlahPuGk
   PdOwf9VvaiAaVX4CGl+E26bmlbYe6Tdm7Wh3se2CDIXBIcS0O3pbWUPI8
   NbFYmuvmUynopZcPK4JWd9ClHHZAYQGDOfibiYBswYMDFenCpzmM3QXmh
   w==;
X-CSE-ConnectionGUID: SrgonQKOQUmKFezhugjjyQ==
X-CSE-MsgGUID: tdfUBKByQrus7OQbdHiU2A==
X-IronPort-AV: E=McAfee;i="6800,10657,11663"; a="204045659"
X-IronPort-AV: E=Sophos;i="6.21,207,1763391600"; 
   d="scan'208";a="204045659"
Received: from unknown (HELO az2uksmgr2.o.css.fujitsu.com) ([52.151.125.128])
  by esa12.hc1455-7.c3s2.iphmx.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 07 Jan 2026 19:31:18 +0900
Received: from az2uksmgm2.o.css.fujitsu.com (unknown [10.151.22.199])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by az2uksmgr2.o.css.fujitsu.com (Postfix) with ESMTPS id 53E5F820704
	for <openembedded-core@lists.openembedded.org>; Wed,  7 Jan 2026 10:31:18 +0000 (UTC)
Received: from az2nlsmom3.fujitsu.com (az2nlsmom3.o.css.fujitsu.com [10.150.26.199])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by az2uksmgm2.o.css.fujitsu.com (Postfix) with ESMTPS id 0A1CE180ABC8
	for <openembedded-core@lists.openembedded.org>; Wed,  7 Jan 2026 10:31:18 +0000 (UTC)
Received: from G08FNSTD200057.g08.fujitsu.local (unknown [10.193.160.191])
	by az2nlsmom3.fujitsu.com (Postfix) with ESMTP id 35399101BB60;
	Wed,  7 Jan 2026 10:31:14 +0000 (UTC)
From: Wang Mingyu < wangmy@fujitsu.com>
To: openembedded-core@lists.openembedded.org
Cc: Wang Mingyu <wangmy@fujitsu.com>
Subject: [OE-core] [PATCH 02/15] barebox-tools: upgrade 2025.11.0 -> 2025.12.0
Date: Wed,  7 Jan 2026 18:30:49 +0800
Message-ID: <20260107103102.458-2-wangmy@fujitsu.com>
X-Mailer: git-send-email 2.49.0.windows.1
In-Reply-To: <20260107103102.458-1-wangmy@fujitsu.com>
References: <20260107103102.458-1-wangmy@fujitsu.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Wed, 07 Jan 2026 10:31:24 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/228972

From: Wang Mingyu <wangmy@fujitsu.com>

Signed-off-by: Wang Mingyu <wangmy@fujitsu.com>
---
 meta/recipes-bsp/barebox/barebox-common.inc | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/meta/recipes-bsp/barebox/barebox-common.inc b/meta/recipes-bsp/barebox/barebox-common.inc
index 0ad9166aa2..3b6f827afa 100644
--- a/meta/recipes-bsp/barebox/barebox-common.inc
+++ b/meta/recipes-bsp/barebox/barebox-common.inc
@@ -3,6 +3,6 @@ SECTION = "bootloaders"
 
 LIC_FILES_CHKSUM = "file://COPYING;md5=f5125d13e000b9ca1f0d3364286c4192"
 
-PV = "2025.11.0"
+PV = "2025.12.0"
 SRC_URI = "https://barebox.org/download/barebox-${PV}.tar.bz2"
-SRC_URI[sha256sum] = "6a487eb975169ef4ecc912d3e1044fb9ee4aa164c21d4db960a384a60d0914f6"
+SRC_URI[sha256sum] = "71d2cdc42bf52b2e96e62f24babc0f5a93acb5b21b048d4d17dd589a893529cf"
-- 
2.43.0


