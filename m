Return-Path: <wangmy@fujitsu.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 3A9FDD0C836
	for <webhook@archiver.kernel.org>; Tue, 13 Jan 2026 10:25:31 +0000 (UTC)
Received: from esa5.hc1455-7.c3s2.iphmx.com (esa5.hc1455-7.c3s2.iphmx.com [68.232.139.130])
 by mx.groups.io with SMTP id smtpd.msgproc01-g2.56085.1768299924582663747
 for <openembedded-core@lists.openembedded.org>;
 Tue, 13 Jan 2026 02:25:25 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@fujitsu.com header.s=fj2 header.b=L2xLAdK8;
 spf=pass (domain: fujitsu.com, ip: 68.232.139.130, mailfrom: wangmy@fujitsu.com)
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
  d=fujitsu.com; i=@fujitsu.com; q=dns/txt; s=fj2;
  t=1768299925; x=1799835925;
  h=from:to:cc:subject:date:message-id:in-reply-to:
   references:mime-version:content-transfer-encoding;
  bh=NarwtPBP5YY589KT4i6HlTi+IsJVW8+NAGlk+ZVEkXw=;
  b=L2xLAdK8bKCN65HsXhw3YCk9rfvwIwAVrIBbsn1Td0TSaByG6OekfveW
   x7eFxToIM2h4bjprPrH0BL2sVUz0V0GQ1O4aXM9bI8My3sF7L3RO1NONJ
   6877VTkjgEjN/z0Hn4FMkaj3Q2PInfKRL+eEW00kPHphvYwn/AWSil+Rm
   iR2b/W7DjMgHfRYgHk2dRac8smm8YTzrlq4aQrKH3Uf/tlt7kCeI2JHbm
   s2yoQezjmxrFByPfv91aUYynv7opkUryAhkmgzYeAuOQkthAH5pLCve/y
   pJlV2jXUEU0Zyo9CNz6kzQsF/t9OVvjxUl5y4ATZpVuIFLtQsLddLShHR
   g==;
X-CSE-ConnectionGUID: xnqCwCMsSjG/psgBvYBfYQ==
X-CSE-MsgGUID: uQ2LHCewTkKKKQnRdorgxg==
X-IronPort-AV: E=McAfee;i="6800,10657,11669"; a="225033184"
X-IronPort-AV: E=Sophos;i="6.21,222,1763391600"; 
   d="scan'208";a="225033184"
Received: from unknown (HELO az2uksmgr3.o.css.fujitsu.com) ([52.151.125.128])
  by esa5.hc1455-7.c3s2.iphmx.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 13 Jan 2026 19:25:23 +0900
Received: from az2uksmgm2.o.css.fujitsu.com (unknown [10.151.22.199])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by az2uksmgr3.o.css.fujitsu.com (Postfix) with ESMTPS id 1FC4A1002BAA
	for <openembedded-core@lists.openembedded.org>; Tue, 13 Jan 2026 10:25:23 +0000 (UTC)
Received: from az2nlsmom1.o.css.fujitsu.com (az2nlsmom1.o.css.fujitsu.com [10.150.26.198])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by az2uksmgm2.o.css.fujitsu.com (Postfix) with ESMTPS id CC20C1801FF7
	for <openembedded-core@lists.openembedded.org>; Tue, 13 Jan 2026 10:25:22 +0000 (UTC)
Received: from G08FNSTD200057.g08.fujitsu.local (unknown [10.193.160.191])
	by az2nlsmom1.o.css.fujitsu.com (Postfix) with ESMTP id F06E5826FFC;
	Tue, 13 Jan 2026 10:25:19 +0000 (UTC)
From: Wang Mingyu < wangmy@fujitsu.com>
To: openembedded-core@lists.openembedded.org
Cc: Wang Mingyu <wangmy@fujitsu.com>
Subject: [OE-core] [PATCH 03/18] alsa-utils: upgrade 1.2.15.1 -> 1.2.15.2
Date: Tue, 13 Jan 2026 18:24:53 +0800
Message-ID: <20260113102509.728-3-wangmy@fujitsu.com>
X-Mailer: git-send-email 2.49.0.windows.1
In-Reply-To: <20260113102509.728-1-wangmy@fujitsu.com>
References: <20260113102509.728-1-wangmy@fujitsu.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Tue, 13 Jan 2026 10:25:31 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/229242

From: Wang Mingyu <wangmy@fujitsu.com>

Signed-off-by: Wang Mingyu <wangmy@fujitsu.com>
---
 .../alsa/{alsa-utils_1.2.15.1.bb => alsa-utils_1.2.15.2.bb}     | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)
 rename meta/recipes-multimedia/alsa/{alsa-utils_1.2.15.1.bb => alsa-utils_1.2.15.2.bb} (98%)

diff --git a/meta/recipes-multimedia/alsa/alsa-utils_1.2.15.1.bb b/meta/recipes-multimedia/alsa/alsa-utils_1.2.15.2.bb
similarity index 98%
rename from meta/recipes-multimedia/alsa/alsa-utils_1.2.15.1.bb
rename to meta/recipes-multimedia/alsa/alsa-utils_1.2.15.2.bb
index f9ee10d240..f4d7bc55cc 100644
--- a/meta/recipes-multimedia/alsa/alsa-utils_1.2.15.1.bb
+++ b/meta/recipes-multimedia/alsa/alsa-utils_1.2.15.2.bb
@@ -25,7 +25,7 @@ PACKAGECONFIG[manpages] = "--enable-xmlto, --disable-xmlto, xmlto-native docbook
 
 # alsa-utils specified in SRC_URI due to alsa-utils-scripts recipe
 SRC_URI = "https://www.alsa-project.org/files/pub/utils/alsa-utils-${PV}.tar.bz2"
-SRC_URI[sha256sum] = "5ad79f349e59c30c9a4929ad4995ebee33267473e0e632d7c1a30e2b093d3327"
+SRC_URI[sha256sum] = "7aaaafbfb01942113ec0c31e51f705910e81079205088ca2f8f137a3869e1a3a"
 
 inherit autotools gettext pkgconfig manpages
 
-- 
2.43.0


