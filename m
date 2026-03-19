Return-Path: <wangmy@fujitsu.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 35623108E1F2
	for <webhook@archiver.kernel.org>; Thu, 19 Mar 2026 11:26:17 +0000 (UTC)
Received: from esa7.hc1455-7.c3s2.iphmx.com (esa7.hc1455-7.c3s2.iphmx.com [139.138.61.252])
 by mx.groups.io with SMTP id smtpd.msgproc01-g2.8842.1773919571965920380
 for <openembedded-core@lists.openembedded.org>;
 Thu, 19 Mar 2026 04:26:14 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@fujitsu.com header.s=fj2 header.b=gGnV6mAl;
 spf=pass (domain: fujitsu.com, ip: 139.138.61.252, mailfrom: wangmy@fujitsu.com)
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
  d=fujitsu.com; i=@fujitsu.com; q=dns/txt; s=fj2;
  t=1773919574; x=1805455574;
  h=from:to:cc:subject:date:message-id:in-reply-to:
   references:mime-version:content-transfer-encoding;
  bh=xccc7qnZZuJT7KAwrulrSoSd36L/fct+624Bax7h+PM=;
  b=gGnV6mAlKvAXeGmstjOBgAKt3iU3q4WU1ETdmr8iEbY04fxZR2fNMPQe
   o093aZhi8NZN/3TolyFEpEd/lLNCQWmZZPlb4iz4edyQNvlYrHyC04S4P
   Fw8CY732NORjXMUlYC6uHf5Yg/qFGowAnminAwKMKez5Isxo0mMSSwAyG
   THx/657ZvpxQsVpVgcLLyNH1/SSSxD+K3sEziynWqA+O0z5HRgV0Ee9gx
   7hCovLJZsjWHSWVOVGZd7DUhYDCzuQnduRlDtcJ8HBQ/dgDfp3iknYXBx
   OsL4LS3cm+SYIZRY3Y63z3dL283avMD3o8ZQB+z7G8uo1IWOVmeze2RyD
   g==;
X-CSE-ConnectionGUID: hqDMXYDCT+q8CdcNY+YZjg==
X-CSE-MsgGUID: 4qwdD/sJQ12dqNs82aRSAw==
X-IronPort-AV: E=McAfee;i="6800,10657,11733"; a="212702344"
X-IronPort-AV: E=Sophos;i="6.23,129,1770562800"; 
   d="scan'208";a="212702344"
Received: from gmgwnl01.global.fujitsu.com ([52.143.17.124])
  by esa7.hc1455-7.c3s2.iphmx.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 19 Mar 2026 19:15:02 +0900
Received: from az2nlsmgm4.fujitsu.com (unknown [10.150.26.204])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by gmgwnl01.global.fujitsu.com (Postfix) with ESMTPS id D31E442A31E
	for <openembedded-core@lists.openembedded.org>; Thu, 19 Mar 2026 10:15:03 +0000 (UTC)
Received: from az2nlsmom3.fujitsu.com (az2nlsmom3.o.css.fujitsu.com [10.150.26.199])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by az2nlsmgm4.fujitsu.com (Postfix) with ESMTPS id 81626100595C
	for <openembedded-core@lists.openembedded.org>; Thu, 19 Mar 2026 10:15:03 +0000 (UTC)
Received: from G08FNSTD200057.g08.fujitsu.local (unknown [10.193.160.5])
	by az2nlsmom3.fujitsu.com (Postfix) with ESMTP id 95708101E529;
	Thu, 19 Mar 2026 10:15:00 +0000 (UTC)
From: Wang Mingyu < wangmy@fujitsu.com>
To: openembedded-core@lists.openembedded.org
Cc: Wang Mingyu <wangmy@fujitsu.com>
Subject: [OE-core] [PATCH 22/40] meson: upgrade 1.10.1 -> 1.10.2
Date: Thu, 19 Mar 2026 18:13:14 +0800
Message-ID: <20260319101332.2067-22-wangmy@fujitsu.com>
X-Mailer: git-send-email 2.49.0.windows.1
In-Reply-To: <20260319101332.2067-1-wangmy@fujitsu.com>
References: <20260319101332.2067-1-wangmy@fujitsu.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Thu, 19 Mar 2026 11:26:17 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/233518

From: Wang Mingyu <wangmy@fujitsu.com>

Signed-off-by: Wang Mingyu <wangmy@fujitsu.com>
---
 .../recipes-devtools/meson/{meson_1.10.1.bb => meson_1.10.2.bb} | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)
 rename meta/recipes-devtools/meson/{meson_1.10.1.bb => meson_1.10.2.bb} (98%)

diff --git a/meta/recipes-devtools/meson/meson_1.10.1.bb b/meta/recipes-devtools/meson/meson_1.10.2.bb
similarity index 98%
rename from meta/recipes-devtools/meson/meson_1.10.1.bb
rename to meta/recipes-devtools/meson/meson_1.10.2.bb
index 53c3769e73..9832437531 100644
--- a/meta/recipes-devtools/meson/meson_1.10.1.bb
+++ b/meta/recipes-devtools/meson/meson_1.10.2.bb
@@ -14,7 +14,7 @@ SRC_URI = "${GITHUB_BASE_URI}/download/${PV}/meson-${PV}.tar.gz \
            file://0001-Make-CPU-family-warnings-fatal.patch \
            file://0002-Support-building-allarch-recipes-again.patch \
            "
-SRC_URI[sha256sum] = "c42296f12db316a4515b9375a5df330f2e751ccdd4f608430d41d7d6210e4317"
+SRC_URI[sha256sum] = "7890287d911dd4ee1ebd0efb61ed0321bfcd87c725df923a837cf90c6508f96b"
 UPSTREAM_CHECK_REGEX = "(?P<pver>\d+(\.\d+)+)$"
 
 inherit python_setuptools_build_meta github-releases
-- 
2.43.0


