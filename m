Return-Path: <wangmy@fujitsu.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id E3C381075298
	for <webhook@archiver.kernel.org>; Thu, 19 Mar 2026 10:14:14 +0000 (UTC)
Received: from esa12.hc1455-7.c3s2.iphmx.com (esa12.hc1455-7.c3s2.iphmx.com [139.138.37.100])
 by mx.groups.io with SMTP id smtpd.msgproc01-g2.7843.1773915245751920200
 for <openembedded-core@lists.openembedded.org>;
 Thu, 19 Mar 2026 03:14:06 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@fujitsu.com header.s=fj2 header.b=DmdM2O1v;
 spf=pass (domain: fujitsu.com, ip: 139.138.37.100, mailfrom: wangmy@fujitsu.com)
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
  d=fujitsu.com; i=@fujitsu.com; q=dns/txt; s=fj2;
  t=1773915246; x=1805451246;
  h=from:to:cc:subject:date:message-id:in-reply-to:
   references:mime-version:content-transfer-encoding;
  bh=CLWaRrX6tdQDyZIVmZ6MhULbExjtv/I+LwktM5FcZZU=;
  b=DmdM2O1vMRW8hFU5v/Cbg09M6dthgs7RUJrZz2jBVXWJsEHvOguYPFeM
   L7g9LKEviA4LLmW9mgS9IudzmtRRwPvW/v/wqUghcGGPIUXSm33jS5aiM
   Ke46C1VSHuKQCJm73eEKblsWfbIJHxga/eebItx71uFPKZTIb9ltPgwcY
   k4x1274bjTviTFNeCSK2qbJRS9ICopF2gH9CVq4BXnnxW+5pqMkvqI+lb
   pjJ8zuEBG8Mv3jnOlPuKbG2Ns3/+fcATNGWOdbbARSRVvG3LG8Z65JG9p
   QhT2GTvy76DCbhGCOQPVTGLoh60jDYQrZAFwqlwu6FPrzELErBu7hoyFC
   g==;
X-CSE-ConnectionGUID: TqUU1vWqRVCF4eccYQeRoQ==
X-CSE-MsgGUID: OjeJafGTQNe9+4RvLz+TPQ==
X-IronPort-AV: E=McAfee;i="6800,10657,11733"; a="212891166"
X-IronPort-AV: E=Sophos;i="6.23,129,1770562800"; 
   d="scan'208";a="212891166"
Received: from gmgwnl01.global.fujitsu.com ([52.143.17.124])
  by esa12.hc1455-7.c3s2.iphmx.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 19 Mar 2026 19:14:04 +0900
Received: from az2nlsmgm1.o.css.fujitsu.com (unknown [10.150.26.203])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by gmgwnl01.global.fujitsu.com (Postfix) with ESMTPS id 32289100037E
	for <openembedded-core@lists.openembedded.org>; Thu, 19 Mar 2026 10:14:04 +0000 (UTC)
Received: from az2nlsmom3.fujitsu.com (az2nlsmom3.o.css.fujitsu.com [10.150.26.199])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by az2nlsmgm1.o.css.fujitsu.com (Postfix) with ESMTPS id D941BC0009D
	for <openembedded-core@lists.openembedded.org>; Thu, 19 Mar 2026 10:14:03 +0000 (UTC)
Received: from G08FNSTD200057.g08.fujitsu.local (unknown [10.193.160.5])
	by az2nlsmom3.fujitsu.com (Postfix) with ESMTP id F02AD101E529;
	Thu, 19 Mar 2026 10:14:00 +0000 (UTC)
From: Wang Mingyu < wangmy@fujitsu.com>
To: openembedded-core@lists.openembedded.org
Cc: Wang Mingyu <wangmy@fujitsu.com>
Subject: [OE-core] [PATCH 04/40] diffoscope: upgrade 313 -> 314
Date: Thu, 19 Mar 2026 18:12:56 +0800
Message-ID: <20260319101332.2067-4-wangmy@fujitsu.com>
X-Mailer: git-send-email 2.49.0.windows.1
In-Reply-To: <20260319101332.2067-1-wangmy@fujitsu.com>
References: <20260319101332.2067-1-wangmy@fujitsu.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Thu, 19 Mar 2026 10:14:14 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/233477

From: Wang Mingyu <wangmy@fujitsu.com>

Signed-off-by: Wang Mingyu <wangmy@fujitsu.com>
---
 .../diffoscope/{diffoscope_313.bb => diffoscope_314.bb}         | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)
 rename meta/recipes-support/diffoscope/{diffoscope_313.bb => diffoscope_314.bb} (93%)

diff --git a/meta/recipes-support/diffoscope/diffoscope_313.bb b/meta/recipes-support/diffoscope/diffoscope_314.bb
similarity index 93%
rename from meta/recipes-support/diffoscope/diffoscope_313.bb
rename to meta/recipes-support/diffoscope/diffoscope_314.bb
index b5d07e9a47..11868dc8db 100644
--- a/meta/recipes-support/diffoscope/diffoscope_313.bb
+++ b/meta/recipes-support/diffoscope/diffoscope_314.bb
@@ -12,7 +12,7 @@ PYPI_PACKAGE = "diffoscope"
 
 inherit pypi setuptools3
 
-SRC_URI[sha256sum] = "f2f3ca5f1a933e21155c3c96ef1b5c50233dd24f080c05d3fc1d4283e652f7fd"
+SRC_URI[sha256sum] = "b347d6ebcadd913a5839555b89ea1026422a1cdf7b8b3be21bb2f112133c3ff8"
 
 RDEPENDS:${PN} += "\
         binutils \
-- 
2.43.0


