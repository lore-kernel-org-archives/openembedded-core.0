Return-Path: <wangmy@fujitsu.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id BB60FC61DCD
	for <webhook@archiver.kernel.org>; Wed, 26 Aug 2026 08:18:59 +0000 (UTC)
Received: from esa1.hc1455-7.c3s2.iphmx.com (esa1.hc1455-7.c3s2.iphmx.com [207.54.90.47])
 by mx.groups.io with SMTP id smtpd.msgproc02-g2.7749.1787732330262709294
 for <openembedded-core@lists.openembedded.org>;
 Wed, 26 Aug 2026 01:18:51 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@fujitsu.com header.s=fj2 header.b=gTvSnfdV;
 spf=pass (domain: fujitsu.com, ip: 207.54.90.47, mailfrom: wangmy@fujitsu.com)
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
  d=fujitsu.com; i=@fujitsu.com; q=dns/txt; s=fj2;
  t=1787732331; x=1819268331;
  h=from:to:cc:subject:date:message-id:in-reply-to:
   references:mime-version:content-transfer-encoding;
  bh=rKyZPCGXaLU2jfXElGZYjIKJl/qrIYXidUt9/gpYl9U=;
  b=gTvSnfdVTSKeTiySl1ZPKNrvMe/JCTvfzZQwag5HZewiFIFR3XpS46lh
   qxsjG12Azg5RPuQXxPIFPLDtm+Cty+kVTJ219fCEPm22mJa+8XOl7HMVE
   kV6c1heSdPIENaHZvv+RWZ6xVuWhVpFepVyP344aIzRGEdYniO7tkdZMQ
   dpNSXrUJJFKhdPBv4VVtaCkrJyXC+TJjDHAsTErz3wnnWPYnxGuTAwP3n
   6cUb1xhL2DDYLYvt9HA0cabkxo+fOk6K6toPAAnXKzyjNUoWOuutHUCDS
   TdJwat5v2SatrzALb0RPzaRWtMg5CnS2SGwOpGmSSGAc83fZtFpwHPOsR
   Q==;
X-CSE-ConnectionGUID: v2sK4mQ/Rs65BLmpspUHZw==
X-CSE-MsgGUID: porOz3ZaT82fUc2ZEYYhXg==
X-IronPort-AV: E=McAfee;i="6800,10657,11886"; a="252690533"
X-IronPort-AV: E=Sophos;i="6.25,244,1779116400"; 
   d="scan'208";a="252690533"
Received: from gmgwuk01.global.fujitsu.com ([172.187.114.235])
  by esa1.hc1455-7.c3s2.iphmx.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 26 Aug 2026 17:18:50 +0900
Received: from az2uksmgm2.o.css.fujitsu.com (unknown [10.151.22.199])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by gmgwuk01.global.fujitsu.com (Postfix) with ESMTPS id 3F51C1002BA5
	for <openembedded-core@lists.openembedded.org>; Wed, 26 Aug 2026 08:18:50 +0000 (UTC)
Received: from az2nlsmom1.o.css.fujitsu.com (unknown [10.150.26.198])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by az2uksmgm2.o.css.fujitsu.com (Postfix) with ESMTPS id E95CA182631E
	for <openembedded-core@lists.openembedded.org>; Wed, 26 Aug 2026 08:18:49 +0000 (UTC)
Received: from G08FNSTD200057.g08.fujitsu.local (unknown [10.167.135.104])
	by az2nlsmom1.o.css.fujitsu.com (Postfix) with ESMTP id E56768212C2;
	Wed, 26 Aug 2026 08:18:47 +0000 (UTC)
From: Wang Mingyu < wangmy@fujitsu.com>
To: openembedded-core@lists.openembedded.org
Cc: Wang Mingyu <wangmy@fujitsu.com>
Subject: [OE-core] [PATCH 15/17] python3-shacl2code: upgrade 1.1.0 -> 1.2.0
Date: Wed, 26 Aug 2026 16:18:30 +0800
Message-ID: <20260826081832.1059-8-wangmy@fujitsu.com>
X-Mailer: git-send-email 2.55.0.windows.3
In-Reply-To: <20260826081832.1059-1-wangmy@fujitsu.com>
References: <20260826081832.1059-1-wangmy@fujitsu.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Wed, 26 Aug 2026 08:18:59 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/244355

From: Wang Mingyu <wangmy@fujitsu.com>

Signed-off-by: Wang Mingyu <wangmy@fujitsu.com>
---
 ...{python3-shacl2code_1.1.0.bb => python3-shacl2code_1.2.0.bb} | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)
 rename meta/recipes-devtools/python/{python3-shacl2code_1.1.0.bb => python3-shacl2code_1.2.0.bb} (81%)

diff --git a/meta/recipes-devtools/python/python3-shacl2code_1.1.0.bb b/meta/recipes-devtools/python/python3-shacl2code_1.2.0.bb
similarity index 81%
rename from meta/recipes-devtools/python/python3-shacl2code_1.1.0.bb
rename to meta/recipes-devtools/python/python3-shacl2code_1.2.0.bb
index a9c8bec84f..6956aad618 100644
--- a/meta/recipes-devtools/python/python3-shacl2code_1.1.0.bb
+++ b/meta/recipes-devtools/python/python3-shacl2code_1.2.0.bb
@@ -5,7 +5,7 @@ LICENSE = "MIT"
 LIC_FILES_CHKSUM = "file://LICENSE;md5=0582f358628f299f29c23bf5fb2f73c9"
 
 PYPI_PACKAGE = "shacl2code"
-SRC_URI[sha256sum] = "0f3a243c6482a0f95c5a793288d304908506b51b82dc6133de22be477cd75c24"
+SRC_URI[sha256sum] = "92c5bb633b232bb914699157b3e79796aaf1672f22c0cac0cc633f353aa8a398"
 
 inherit pypi python_hatchling
 
-- 
2.43.0


