Return-Path: <wangmy@fujitsu.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 72901D6CFD0
	for <webhook@archiver.kernel.org>; Fri, 23 Jan 2026 05:30:55 +0000 (UTC)
Received: from esa2.hc1455-7.c3s2.iphmx.com (esa2.hc1455-7.c3s2.iphmx.com [207.54.90.48])
 by mx.groups.io with SMTP id smtpd.msgproc02-g2.61589.1769146245769811192
 for <openembedded-core@lists.openembedded.org>;
 Thu, 22 Jan 2026 21:30:46 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@fujitsu.com header.s=fj2 header.b=k3GdmtFe;
 spf=pass (domain: fujitsu.com, ip: 207.54.90.48, mailfrom: wangmy@fujitsu.com)
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
  d=fujitsu.com; i=@fujitsu.com; q=dns/txt; s=fj2;
  t=1769146244; x=1800682244;
  h=from:to:cc:subject:date:message-id:mime-version:
   content-transfer-encoding;
  bh=HIU7GqeGrd7khNiLS1iku413aaCLyhDs/8UE+oaWOEs=;
  b=k3GdmtFeEC2g9er3iEoZWmGgug+iYncPbxILaP7C8JTYgKGp228t+xb9
   IhrBKNAIerzMiV9/Ik/Ga5lXFNRoY1t89E2fuRN1yvWIKQpm91e4r94he
   U0Lp1A2D2/q+RtHe5UgFDhc/uEUf2D8WPKaKpOlMsHEP6ndFUvt8JRkzW
   ++J3P1QXsgZq5Lrp3ZxNpPy5DOufks2RK3WXK6rxpGisU/Y9raQAWpTsB
   s44xj5K3jdbB4r36pUNJKaRTRVNtC+yEsa+jw+8U6L2GlUyBl536ERAth
   rNA4vYLsxPeoNesJvgElAvF6ODmystAJAFx7bk8IyCNeP7Q4E3HyDhBl6
   Q==;
X-CSE-ConnectionGUID: ITAK2n0aTuCimOGQfEfacA==
X-CSE-MsgGUID: cB0ynSubQG2ywMM9AJXk8A==
X-IronPort-AV: E=McAfee;i="6800,10657,11679"; a="226757376"
X-IronPort-AV: E=Sophos;i="6.21,247,1763391600"; 
   d="scan'208";a="226757376"
Received: from unknown (HELO az2nlsmgr3.o.css.fujitsu.com) ([51.138.80.169])
  by esa2.hc1455-7.c3s2.iphmx.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 23 Jan 2026 14:30:42 +0900
Received: from az2nlsmgm1.o.css.fujitsu.com (unknown [10.150.26.203])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by az2nlsmgr3.o.css.fujitsu.com (Postfix) with ESMTPS id 3FD90100036C
	for <openembedded-core@lists.openembedded.org>; Fri, 23 Jan 2026 05:30:44 +0000 (UTC)
Received: from az2uksmom1.o.css.fujitsu.com (az2uksmom1.o.css.fujitsu.com [10.151.22.202])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by az2nlsmgm1.o.css.fujitsu.com (Postfix) with ESMTPS id E927EC03708
	for <openembedded-core@lists.openembedded.org>; Fri, 23 Jan 2026 05:30:43 +0000 (UTC)
Received: from G08FNSTD200057.g08.fujitsu.local (unknown [10.193.128.34])
	by az2uksmom1.o.css.fujitsu.com (Postfix) with ESMTP id 494D5180714D;
	Fri, 23 Jan 2026 05:30:40 +0000 (UTC)
From: Wang Mingyu < wangmy@fujitsu.com>
To: openembedded-core@lists.openembedded.org
Cc: Wang Mingyu <wangmy@fujitsu.com>
Subject: [OE-core] [PATCH v2] barebox/barebox-tools: upgrade 2025.12.0 -> 2026.01.0
Date: Fri, 23 Jan 2026 13:30:38 +0800
Message-ID: <20260123053038.991-1-wangmy@fujitsu.com>
X-Mailer: git-send-email 2.49.0.windows.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Fri, 23 Jan 2026 05:30:55 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/229866

From: Wang Mingyu <wangmy@fujitsu.com>

Signed-off-by: Wang Mingyu <wangmy@fujitsu.com>
---
 meta/recipes-bsp/barebox/barebox-common.inc | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/meta/recipes-bsp/barebox/barebox-common.inc b/meta/recipes-bsp/barebox/barebox-common.inc
index 3b6f827afa..14a5ca9709 100644
--- a/meta/recipes-bsp/barebox/barebox-common.inc
+++ b/meta/recipes-bsp/barebox/barebox-common.inc
@@ -3,6 +3,6 @@ SECTION = "bootloaders"
 
 LIC_FILES_CHKSUM = "file://COPYING;md5=f5125d13e000b9ca1f0d3364286c4192"
 
-PV = "2025.12.0"
+PV = "2026.01.0"
 SRC_URI = "https://barebox.org/download/barebox-${PV}.tar.bz2"
-SRC_URI[sha256sum] = "71d2cdc42bf52b2e96e62f24babc0f5a93acb5b21b048d4d17dd589a893529cf"
+SRC_URI[sha256sum] = "219283d67c5d2f79bd22915b8a71906531223cb01e6e5b8d1658f299441e4169"
-- 
2.43.0


