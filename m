Return-Path: <wangmy@fujitsu.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 88DF3108E1DE
	for <webhook@archiver.kernel.org>; Thu, 19 Mar 2026 10:25:56 +0000 (UTC)
Received: from esa8.hc1455-7.c3s2.iphmx.com (esa8.hc1455-7.c3s2.iphmx.com [139.138.61.253])
 by mx.groups.io with SMTP id smtpd.msgproc02-g2.7873.1773915947167019113
 for <openembedded-core@lists.openembedded.org>;
 Thu, 19 Mar 2026 03:25:49 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@fujitsu.com header.s=fj2 header.b=bt6S+hq3;
 spf=pass (domain: fujitsu.com, ip: 139.138.61.253, mailfrom: wangmy@fujitsu.com)
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
  d=fujitsu.com; i=@fujitsu.com; q=dns/txt; s=fj2;
  t=1773915948; x=1805451948;
  h=from:to:cc:subject:date:message-id:in-reply-to:
   references:mime-version:content-transfer-encoding;
  bh=PAKd7N/+1Xx4W6hIDUCv6+iXFTJl2Lc/eL5hPEIYP6Q=;
  b=bt6S+hq3da/+Fbjr/+KU1S/26LfyFIn5AD0sHSxV0wFCyIo97mtrCPxv
   a4lZVXkDjid3wD772PP/Qkpvo3grbDgNy+Xr7RurGhDSXy9vODIiXYguW
   ut2ZvTtbnspHX0A/MOE8wrvs/RL4qNE/iVmQ1n4ATbhaRF/mcpHyWt/a5
   XfPbKILiupZB0k1z8MLRWQpM2FLux3ZAeduaBm948B5nhzVPp2Bp7mO7y
   2hJiGHCobLKnJFpnjGCny9qQ8iaBmYuTGZ9ZpEMs1ds5db+Q9Nt4o6vBc
   OYBNuTps9TBzO0MWLNktL9cQj3R4Gcvw4zXrfJ8qYB7lfGnRPBqgyi2hO
   Q==;
X-CSE-ConnectionGUID: 2lI4eR/+RlSfAim4Bm1f5w==
X-CSE-MsgGUID: +61ygTfJSGS5RV0TCked0A==
X-IronPort-AV: E=McAfee;i="6800,10657,11733"; a="221829656"
X-IronPort-AV: E=Sophos;i="6.23,129,1770562800"; 
   d="scan'208";a="221829656"
Received: from gmgwnl01.global.fujitsu.com (HELO mgmgwnl01.global.fujitsu.com) ([52.143.17.124])
  by esa8.hc1455-7.c3s2.iphmx.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 19 Mar 2026 19:15:19 +0900
Received: from az2nlsmgm1.o.css.fujitsu.com (unknown [10.150.26.203])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by mgmgwnl01.global.fujitsu.com (Postfix) with ESMTPS id 50E02676C
	for <openembedded-core@lists.openembedded.org>; Thu, 19 Mar 2026 10:15:19 +0000 (UTC)
Received: from az2nlsmom3.fujitsu.com (az2nlsmom3.o.css.fujitsu.com [10.150.26.199])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by az2nlsmgm1.o.css.fujitsu.com (Postfix) with ESMTPS id F34D6C000A7
	for <openembedded-core@lists.openembedded.org>; Thu, 19 Mar 2026 10:15:18 +0000 (UTC)
Received: from G08FNSTD200057.g08.fujitsu.local (unknown [10.193.160.5])
	by az2nlsmom3.fujitsu.com (Postfix) with ESMTP id 263FD101E529;
	Thu, 19 Mar 2026 10:15:15 +0000 (UTC)
From: Wang Mingyu < wangmy@fujitsu.com>
To: openembedded-core@lists.openembedded.org
Cc: Wang Mingyu <wangmy@fujitsu.com>
Subject: [OE-core] [PATCH 29/40] python3-setuptools: upgrade 82.0.0 -> 82.0.1
Date: Thu, 19 Mar 2026 18:13:21 +0800
Message-ID: <20260319101332.2067-29-wangmy@fujitsu.com>
X-Mailer: git-send-email 2.49.0.windows.1
In-Reply-To: <20260319101332.2067-1-wangmy@fujitsu.com>
References: <20260319101332.2067-1-wangmy@fujitsu.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Thu, 19 Mar 2026 10:25:56 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/233510

From: Wang Mingyu <wangmy@fujitsu.com>

Changelog:
=============
- Fix the loading of launcher manifest.xml file.
- Replaced deprecated json.__version__ with fixture in tests.
- Add advice about how to improve predictability when installing sdists

Signed-off-by: Wang Mingyu <wangmy@fujitsu.com>
---
 ...ython3-setuptools_82.0.0.bb => python3-setuptools_82.0.1.bb} | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)
 rename meta/recipes-devtools/python/{python3-setuptools_82.0.0.bb => python3-setuptools_82.0.1.bb} (94%)

diff --git a/meta/recipes-devtools/python/python3-setuptools_82.0.0.bb b/meta/recipes-devtools/python/python3-setuptools_82.0.1.bb
similarity index 94%
rename from meta/recipes-devtools/python/python3-setuptools_82.0.0.bb
rename to meta/recipes-devtools/python/python3-setuptools_82.0.1.bb
index a6b48bf145..a3943a29c3 100644
--- a/meta/recipes-devtools/python/python3-setuptools_82.0.0.bb
+++ b/meta/recipes-devtools/python/python3-setuptools_82.0.1.bb
@@ -11,7 +11,7 @@ CVE_PRODUCT = "python3-setuptools python:setuptools"
 SRC_URI += " \
             file://0001-_distutils-sysconfig.py-make-it-possible-to-substite.patch"
 
-SRC_URI[sha256sum] = "22e0a2d69474c6ae4feb01951cb69d515ed23728cf96d05513d36e42b62b37cb"
+SRC_URI[sha256sum] = "7d872682c5d01cfde07da7bccc7b65469d3dca203318515ada1de5eda35efbf9"
 
 do_install:append() {
 	# setuptools ships Windows launcher executables (cli*.exe, gui*.exe).
-- 
2.43.0


