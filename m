Return-Path: <wangmy@fujitsu.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 8C53E108E1CB
	for <webhook@archiver.kernel.org>; Thu, 19 Mar 2026 10:15:25 +0000 (UTC)
Received: from esa10.hc1455-7.c3s2.iphmx.com (esa10.hc1455-7.c3s2.iphmx.com [139.138.36.225])
 by mx.groups.io with SMTP id smtpd.msgproc01-g2.7867.1773915316565450898
 for <openembedded-core@lists.openembedded.org>;
 Thu, 19 Mar 2026 03:15:18 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@fujitsu.com header.s=fj2 header.b=qXCwJhjC;
 spf=pass (domain: fujitsu.com, ip: 139.138.36.225, mailfrom: wangmy@fujitsu.com)
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
  d=fujitsu.com; i=@fujitsu.com; q=dns/txt; s=fj2;
  t=1773915318; x=1805451318;
  h=from:to:cc:subject:date:message-id:in-reply-to:
   references:mime-version:content-transfer-encoding;
  bh=QUKD/3Vgl/hqesX150YopjgoV1g00uCb5loRzhCBBSk=;
  b=qXCwJhjC7JYP8qDmxrHDlHtkKF2rgtWlEX8RSZxQapllOPUAaj4D6rPm
   UEe3pXsygJn9O2ugWOoS3jTGMllKcJReguv6EQ/tpvxlT6FVWpLxizmkx
   gi3oICUNFpzb91LBw3yPKg6GvR2aySDEcpYFSdiolWH6C6YrGRquR+h+X
   /5Vn+L8WHeDwZ/yvM3/yewBblbL6AQF/3ugJHZBXxvMysau0yU8RkyeFn
   VzWKOznRLOzvzga2mhO0DtoEtyLRFYjh5DPujm7+ZPYxabTTg9TFefNqc
   UsiySCiAhEee7vOpYJS0ty8qFNwt2JvR6AiAsD89/94S4wSk+2AmJHtKN
   g==;
X-CSE-ConnectionGUID: XCBIgbBBQdKfY0rJqVNZaQ==
X-CSE-MsgGUID: C4ugzx7DSomeTumlb7uNZw==
X-IronPort-AV: E=McAfee;i="6800,10657,11733"; a="221352226"
X-IronPort-AV: E=Sophos;i="6.23,129,1770562800"; 
   d="scan'208";a="221352226"
Received: from gmgwnl01.global.fujitsu.com ([52.143.17.124])
  by esa10.hc1455-7.c3s2.iphmx.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 19 Mar 2026 19:15:17 +0900
Received: from az2nlsmgm1.o.css.fujitsu.com (unknown [10.150.26.203])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by gmgwnl01.global.fujitsu.com (Postfix) with ESMTPS id 354811C0018F
	for <openembedded-core@lists.openembedded.org>; Thu, 19 Mar 2026 10:15:17 +0000 (UTC)
Received: from az2nlsmom3.fujitsu.com (az2nlsmom3.o.css.fujitsu.com [10.150.26.199])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by az2nlsmgm1.o.css.fujitsu.com (Postfix) with ESMTPS id DC734C0009D
	for <openembedded-core@lists.openembedded.org>; Thu, 19 Mar 2026 10:15:16 +0000 (UTC)
Received: from G08FNSTD200057.g08.fujitsu.local (unknown [10.193.160.5])
	by az2nlsmom3.fujitsu.com (Postfix) with ESMTP id 061BE101E523;
	Thu, 19 Mar 2026 10:15:13 +0000 (UTC)
From: Wang Mingyu < wangmy@fujitsu.com>
To: openembedded-core@lists.openembedded.org
Cc: Wang Mingyu <wangmy@fujitsu.com>
Subject: [OE-core] [PATCH 28/40] python3-pytz: upgrade 2025.2 -> 2026.1
Date: Thu, 19 Mar 2026 18:13:20 +0800
Message-ID: <20260319101332.2067-28-wangmy@fujitsu.com>
X-Mailer: git-send-email 2.49.0.windows.1
In-Reply-To: <20260319101332.2067-1-wangmy@fujitsu.com>
References: <20260319101332.2067-1-wangmy@fujitsu.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Thu, 19 Mar 2026 10:15:25 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/233490

From: Wang Mingyu <wangmy@fujitsu.com>

Signed-off-by: Wang Mingyu <wangmy@fujitsu.com>
---
 .../python/{python3-pytz_2025.2.bb => python3-pytz_2026.1.bb}   | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)
 rename meta/recipes-devtools/python/{python3-pytz_2025.2.bb => python3-pytz_2026.1.bb} (87%)

diff --git a/meta/recipes-devtools/python/python3-pytz_2025.2.bb b/meta/recipes-devtools/python/python3-pytz_2026.1.bb
similarity index 87%
rename from meta/recipes-devtools/python/python3-pytz_2025.2.bb
rename to meta/recipes-devtools/python/python3-pytz_2026.1.bb
index 86bfceadc8..0c9e1e7a4c 100644
--- a/meta/recipes-devtools/python/python3-pytz_2025.2.bb
+++ b/meta/recipes-devtools/python/python3-pytz_2026.1.bb
@@ -7,7 +7,7 @@ inherit pypi setuptools3 ptest-python-pytest
 
 PTEST_PYTEST_DIR = "pytz/tests"
 
-SRC_URI[sha256sum] = "360b9e3dbb49a209c21ad61809c7fb453643e048b38924c765813546746e81c3"
+SRC_URI[sha256sum] = "10413c35476919b4c07bda6b9810c6e24d914378c430070bdb1869e18a37eee5"
 
 RDEPENDS:${PN}:class-target += "\
     python3-datetime \
-- 
2.43.0


