Return-Path: <wangmy@fujitsu.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 250BED0C82C
	for <webhook@archiver.kernel.org>; Tue, 13 Jan 2026 10:25:21 +0000 (UTC)
Received: from esa9.hc1455-7.c3s2.iphmx.com (esa9.hc1455-7.c3s2.iphmx.com [139.138.36.223])
 by mx.groups.io with SMTP id smtpd.msgproc01-g2.56082.1768299916630165937
 for <openembedded-core@lists.openembedded.org>;
 Tue, 13 Jan 2026 02:25:17 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@fujitsu.com header.s=fj2 header.b=UFVbzlbu;
 spf=pass (domain: fujitsu.com, ip: 139.138.36.223, mailfrom: wangmy@fujitsu.com)
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
  d=fujitsu.com; i=@fujitsu.com; q=dns/txt; s=fj2;
  t=1768299915; x=1799835915;
  h=from:to:cc:subject:date:message-id:mime-version:
   content-transfer-encoding;
  bh=KZy71U99E615/hTo22BMm8pio2M5NCzb4N3W/S5K78I=;
  b=UFVbzlbu0Nk0wWfegdKdTxvM7A8FGtxqcUkjtiZGW8WOEDAbyVCMOEQE
   uQs21im+oo57C5EwkhCReEb9RLkNWCG74Vf1+maWdl1wYgGOkNuCRCUWM
   wQ769WgyZ7yVSZYDefCIitp2diGqcua4RCt23EsueWkPFaDRJnOGJX2LI
   oie3Fo+BaHFmZTrl6mbBbfwQ6AJcfTn8i/e+ZSiSf+Ff0XUaiyHRAoPkB
   q6ED0PtwErcDKS12gvGQvXWZz+ImTsfMzCkqkJfGoSatPscPUcvnapJMl
   6L8kHi9egDgQifZ5t2lnv468INmcyBGKAw3MFPCvVEBYQbp4/+6G6K9yX
   Q==;
X-CSE-ConnectionGUID: NH/Y/auAThm2g8IH1S43MQ==
X-CSE-MsgGUID: 4vDdd2LIQ+iWXAGuylsw/w==
X-IronPort-AV: E=McAfee;i="6800,10657,11669"; a="214223708"
X-IronPort-AV: E=Sophos;i="6.21,222,1763391600"; 
   d="scan'208";a="214223708"
Received: from unknown (HELO az2nlsmgr2.o.css.fujitsu.com) ([20.61.8.234])
  by esa9.hc1455-7.c3s2.iphmx.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 13 Jan 2026 19:25:13 +0900
Received: from az2nlsmgm4.fujitsu.com (unknown [10.150.26.204])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by az2nlsmgr2.o.css.fujitsu.com (Postfix) with ESMTPS id 30490A39A
	for <openembedded-core@lists.openembedded.org>; Tue, 13 Jan 2026 10:25:15 +0000 (UTC)
Received: from az2nlsmom1.o.css.fujitsu.com (az2nlsmom1.o.css.fujitsu.com [10.150.26.198])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by az2nlsmgm4.fujitsu.com (Postfix) with ESMTPS id E8D20100137A
	for <openembedded-core@lists.openembedded.org>; Tue, 13 Jan 2026 10:25:14 +0000 (UTC)
Received: from G08FNSTD200057.g08.fujitsu.local (unknown [10.193.160.191])
	by az2nlsmom1.o.css.fujitsu.com (Postfix) with ESMTP id 225F4826FF9;
	Tue, 13 Jan 2026 10:25:11 +0000 (UTC)
From: Wang Mingyu < wangmy@fujitsu.com>
To: openembedded-core@lists.openembedded.org
Cc: Wang Mingyu <wangmy@fujitsu.com>
Subject: [OE-core] [PATCH 01/18] alsa-lib: upgrade 1.2.15.1 -> 1.2.15.2
Date: Tue, 13 Jan 2026 18:24:51 +0800
Message-ID: <20260113102509.728-1-wangmy@fujitsu.com>
X-Mailer: git-send-email 2.49.0.windows.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Tue, 13 Jan 2026 10:25:21 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/229240

From: Wang Mingyu <wangmy@fujitsu.com>

Signed-off-by: Wang Mingyu <wangmy@fujitsu.com>
---
 .../alsa/{alsa-lib_1.2.15.1.bb => alsa-lib_1.2.15.2.bb}         | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)
 rename meta/recipes-multimedia/alsa/{alsa-lib_1.2.15.1.bb => alsa-lib_1.2.15.2.bb} (94%)

diff --git a/meta/recipes-multimedia/alsa/alsa-lib_1.2.15.1.bb b/meta/recipes-multimedia/alsa/alsa-lib_1.2.15.2.bb
similarity index 94%
rename from meta/recipes-multimedia/alsa/alsa-lib_1.2.15.1.bb
rename to meta/recipes-multimedia/alsa/alsa-lib_1.2.15.2.bb
index f3dfd3f35d..d09f2ac370 100644
--- a/meta/recipes-multimedia/alsa/alsa-lib_1.2.15.1.bb
+++ b/meta/recipes-multimedia/alsa/alsa-lib_1.2.15.2.bb
@@ -10,7 +10,7 @@ LIC_FILES_CHKSUM = "file://COPYING;md5=a916467b91076e631dd8edb7424769c7 \
                     "
 
 SRC_URI = "https://www.alsa-project.org/files/pub/lib/${BP}.tar.bz2"
-SRC_URI[sha256sum] = "7f983ca89ca420872ca16e8a9f8f97fb63db6c1c6e2585b91737a08bb03f566c"
+SRC_URI[sha256sum] = "637eefd4966ce738da44464494df2b2894e19778fac2f9e7c47277e2af9297f4"
 
 inherit autotools pkgconfig
 
-- 
2.43.0


