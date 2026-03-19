Return-Path: <wangmy@fujitsu.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 03A2E107761F
	for <webhook@archiver.kernel.org>; Thu, 19 Mar 2026 10:15:15 +0000 (UTC)
Received: from esa4.hc1455-7.c3s2.iphmx.com (esa4.hc1455-7.c3s2.iphmx.com [68.232.139.117])
 by mx.groups.io with SMTP id smtpd.msgproc02-g2.7744.1773915307352481576
 for <openembedded-core@lists.openembedded.org>;
 Thu, 19 Mar 2026 03:15:07 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@fujitsu.com header.s=fj2 header.b=pr3ydFFM;
 spf=pass (domain: fujitsu.com, ip: 68.232.139.117, mailfrom: wangmy@fujitsu.com)
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
  d=fujitsu.com; i=@fujitsu.com; q=dns/txt; s=fj2;
  t=1773915307; x=1805451307;
  h=from:to:cc:subject:date:message-id:in-reply-to:
   references:mime-version:content-transfer-encoding;
  bh=SAXZAWamDBDfDFP51413Z0t+06d3IQWmtjxzInIkOeY=;
  b=pr3ydFFMbaSiqgwMk17GGlGj7hd1IIlqjpUORA4sgwfGAlLPTYkcu3wc
   Z7OrkW+BZJeNd3y1XrO8GLbZngGWgD5KzcDlPrjhvURo5JTriVaxK1dv+
   w5jL7KqGgEaBhjeVGKwBvrPiCGcs2EPSPnbgMXs2nHUGEmrl9iXOYNxfB
   P3Ghrftlc4x0/+TVrLjZEk9a9aCfIwT9qqCZ4DE8Cx/bHKDmETnLP8mum
   kHx6Z458Np1wI9xlnOKRAttgN114NNAbUKLyLMgJewzNodcgVQQRiQreo
   +Hbz20Dl5/YvyEMMbZbWXYnQCapcJCNkGbW9/JjxLsChYhVB0I0HX2wKI
   w==;
X-CSE-ConnectionGUID: 7mX2hC7sQE2FLCyC9Qd53g==
X-CSE-MsgGUID: T719G43ATpW25HQm9bQdZg==
X-IronPort-AV: E=McAfee;i="6800,10657,11733"; a="234591273"
X-IronPort-AV: E=Sophos;i="6.23,129,1770562800"; 
   d="scan'208";a="234591273"
Received: from gmgwnl01.global.fujitsu.com ([52.143.17.124])
  by esa4.hc1455-7.c3s2.iphmx.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 19 Mar 2026 19:15:05 +0900
Received: from az2nlsmgm2.o.css.fujitsu.com (unknown [10.150.26.202])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by gmgwnl01.global.fujitsu.com (Postfix) with ESMTPS id ED94C42A326
	for <openembedded-core@lists.openembedded.org>; Thu, 19 Mar 2026 10:15:05 +0000 (UTC)
Received: from az2nlsmom3.fujitsu.com (az2nlsmom3.o.css.fujitsu.com [10.150.26.199])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by az2nlsmgm2.o.css.fujitsu.com (Postfix) with ESMTPS id 981A21C135EC
	for <openembedded-core@lists.openembedded.org>; Thu, 19 Mar 2026 10:15:05 +0000 (UTC)
Received: from G08FNSTD200057.g08.fujitsu.local (unknown [10.193.160.5])
	by az2nlsmom3.fujitsu.com (Postfix) with ESMTP id BB711101E523;
	Thu, 19 Mar 2026 10:15:02 +0000 (UTC)
From: Wang Mingyu < wangmy@fujitsu.com>
To: openembedded-core@lists.openembedded.org
Cc: Wang Mingyu <wangmy@fujitsu.com>
Subject: [OE-core] [PATCH 23/40] nfs-utils: upgrade 2.8.5 -> 2.8.7
Date: Thu, 19 Mar 2026 18:13:15 +0800
Message-ID: <20260319101332.2067-23-wangmy@fujitsu.com>
X-Mailer: git-send-email 2.49.0.windows.1
In-Reply-To: <20260319101332.2067-1-wangmy@fujitsu.com>
References: <20260319101332.2067-1-wangmy@fujitsu.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Thu, 19 Mar 2026 10:15:15 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/233486

From: Wang Mingyu <wangmy@fujitsu.com>

Signed-off-by: Wang Mingyu <wangmy@fujitsu.com>
---
 .../nfs-utils/{nfs-utils_2.8.5.bb => nfs-utils_2.8.7.bb}        | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)
 rename meta/recipes-connectivity/nfs-utils/{nfs-utils_2.8.5.bb => nfs-utils_2.8.7.bb} (98%)

diff --git a/meta/recipes-connectivity/nfs-utils/nfs-utils_2.8.5.bb b/meta/recipes-connectivity/nfs-utils/nfs-utils_2.8.7.bb
similarity index 98%
rename from meta/recipes-connectivity/nfs-utils/nfs-utils_2.8.5.bb
rename to meta/recipes-connectivity/nfs-utils/nfs-utils_2.8.7.bb
index 119e49e2a2..95e7d6582e 100644
--- a/meta/recipes-connectivity/nfs-utils/nfs-utils_2.8.5.bb
+++ b/meta/recipes-connectivity/nfs-utils/nfs-utils_2.8.7.bb
@@ -25,7 +25,7 @@ SRC_URI = "${KERNELORG_MIRROR}/linux/utils/nfs-utils/${PV}/nfs-utils-${PV}.tar.x
            file://0005-find-OE-provided-Kerberos.patch \
            "
 
-SRC_URI[sha256sum] = "b13ca4a9df44186bdbe107514b22732d4243f785f95daf2fb86afc1edba15bbb"
+SRC_URI[sha256sum] = "59d0f1e17b18efaa60ea3ccf89a9cad3217f8d3b23c18d2fe34b25c8969d60ae"
 
 # Only kernel-module-nfsd is required here (but can be built-in)  - the nfsd module will
 # pull in the remainder of the dependencies.
-- 
2.43.0


