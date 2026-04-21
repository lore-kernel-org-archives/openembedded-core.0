Return-Path: <wangmy@fujitsu.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 93007F89225
	for <webhook@archiver.kernel.org>; Tue, 21 Apr 2026 09:56:53 +0000 (UTC)
Received: from esa10.hc1455-7.c3s2.iphmx.com (esa10.hc1455-7.c3s2.iphmx.com [139.138.36.225])
 by mx.groups.io with SMTP id smtpd.msgproc02-g2.20455.1776765405663447757
 for <openembedded-core@lists.openembedded.org>;
 Tue, 21 Apr 2026 02:56:46 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@fujitsu.com header.s=fj2 header.b=J+4K2UJI;
 spf=pass (domain: fujitsu.com, ip: 139.138.36.225, mailfrom: wangmy@fujitsu.com)
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
  d=fujitsu.com; i=@fujitsu.com; q=dns/txt; s=fj2;
  t=1776765405; x=1808301405;
  h=from:to:cc:subject:date:message-id:in-reply-to:
   references:mime-version:content-transfer-encoding;
  bh=El4WcEMRlkvool8cuADJlNELd4p6DpCTn8ToKrO+VLY=;
  b=J+4K2UJIa7ptu6u2jiWRrJ1glsqzkkF2RWnMuhnMMUD1MDr7/RQj/UNM
   wiAd3HhaSuxH4PcQjLNjH3UBdxC//lVZepgEGq1lrPlz+mMRM8qyWRuhF
   rBVtU61E3Ix1LLGq4ychTk5n7yCOdtUutRgrwbOdufPlOn//1NOdHa9g9
   jXxqWb+aW3CN6VnPbobO4NX+R+X8W71e7yI+RGIcRspBKLiq+okVPhwqC
   yGxQKMHyXGKt27oXkE8eS3DYIn5Ea2FZGRP9/94fpC9MaWlr/BLK9A8Nn
   C/nFjXXDm0mdw93fQJQJXkTPvI4ib69Mhb9M0XXN8ATelvziu79F6NNTK
   w==;
X-CSE-ConnectionGUID: qvtipz9hSI2lqr+sDNljwg==
X-CSE-MsgGUID: pbf2P1V9Q4C2JxLZIT+hjQ==
X-IronPort-AV: E=McAfee;i="6800,10657,11762"; a="225157893"
X-IronPort-AV: E=Sophos;i="6.23,191,1770562800"; 
   d="scan'208";a="225157893"
Received: from gmgwuk01.global.fujitsu.com ([172.187.114.235])
  by esa10.hc1455-7.c3s2.iphmx.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 21 Apr 2026 18:56:44 +0900
Received: from az2uksmgm4.o.css.fujitsu.com (unknown [10.151.22.201])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by gmgwuk01.global.fujitsu.com (Postfix) with ESMTPS id 41A2AC000B2
	for <openembedded-core@lists.openembedded.org>; Tue, 21 Apr 2026 09:56:44 +0000 (UTC)
Received: from az2uksmom2.o.css.fujitsu.com (az2uksmom2.o.css.fujitsu.com [10.151.22.203])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by az2uksmgm4.o.css.fujitsu.com (Postfix) with ESMTPS id EA153140036C
	for <openembedded-core@lists.openembedded.org>; Tue, 21 Apr 2026 09:56:43 +0000 (UTC)
Received: from G08FNSTD200057.g08.fujitsu.local (unknown [10.167.135.104])
	by az2uksmom2.o.css.fujitsu.com (Postfix) with ESMTP id 84E68140027F;
	Tue, 21 Apr 2026 09:56:41 +0000 (UTC)
From: Wang Mingyu < wangmy@fujitsu.com>
To: openembedded-core@lists.openembedded.org
Cc: Wang Mingyu <wangmy@fujitsu.com>
Subject: [OE-core] [PATCH 20/49] meson: upgrade 1.10.2 -> 1.11.0
Date: Tue, 21 Apr 2026 17:55:30 +0800
Message-ID: <20260421095559.1856-20-wangmy@fujitsu.com>
X-Mailer: git-send-email 2.49.0.windows.1
In-Reply-To: <20260421095559.1856-1-wangmy@fujitsu.com>
References: <20260421095559.1856-1-wangmy@fujitsu.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Tue, 21 Apr 2026 09:56:53 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/235628

From: Wang Mingyu <wangmy@fujitsu.com>

Signed-off-by: Wang Mingyu <wangmy@fujitsu.com>
---
 .../recipes-devtools/meson/{meson_1.10.2.bb => meson_1.11.0.bb} | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)
 rename meta/recipes-devtools/meson/{meson_1.10.2.bb => meson_1.11.0.bb} (98%)

diff --git a/meta/recipes-devtools/meson/meson_1.10.2.bb b/meta/recipes-devtools/meson/meson_1.11.0.bb
similarity index 98%
rename from meta/recipes-devtools/meson/meson_1.10.2.bb
rename to meta/recipes-devtools/meson/meson_1.11.0.bb
index 9832437531..d06ede78a0 100644
--- a/meta/recipes-devtools/meson/meson_1.10.2.bb
+++ b/meta/recipes-devtools/meson/meson_1.11.0.bb
@@ -14,7 +14,7 @@ SRC_URI = "${GITHUB_BASE_URI}/download/${PV}/meson-${PV}.tar.gz \
            file://0001-Make-CPU-family-warnings-fatal.patch \
            file://0002-Support-building-allarch-recipes-again.patch \
            "
-SRC_URI[sha256sum] = "7890287d911dd4ee1ebd0efb61ed0321bfcd87c725df923a837cf90c6508f96b"
+SRC_URI[sha256sum] = "dffdd0915ceb028541fe3bed77d63ba35e78514591c043736b450d62634eeb31"
 UPSTREAM_CHECK_REGEX = "(?P<pver>\d+(\.\d+)+)$"
 
 inherit python_setuptools_build_meta github-releases
-- 
2.43.0


