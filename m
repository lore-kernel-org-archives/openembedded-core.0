Return-Path: <wangmy@fujitsu.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 0DB9FCD8CB9
	for <webhook@archiver.kernel.org>; Wed, 10 Jun 2026 09:50:23 +0000 (UTC)
Received: from esa6.hc1455-7.c3s2.iphmx.com (esa6.hc1455-7.c3s2.iphmx.com [68.232.139.139])
 by mx.groups.io with SMTP id smtpd.msgproc01-g2.16359.1781085020925124714
 for <openembedded-core@lists.openembedded.org>;
 Wed, 10 Jun 2026 02:50:21 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@fujitsu.com header.s=fj2 header.b=W/CUEYKo;
 spf=pass (domain: fujitsu.com, ip: 68.232.139.139, mailfrom: wangmy@fujitsu.com)
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
  d=fujitsu.com; i=@fujitsu.com; q=dns/txt; s=fj2;
  t=1781085022; x=1812621022;
  h=from:to:cc:subject:date:message-id:in-reply-to:
   references:mime-version:content-transfer-encoding;
  bh=SjebTF/mCPCk2GSDwiWNlIbpz6ZvFz8fKVrEC+WfL34=;
  b=W/CUEYKoFQBruwBT5Nv3QNNMz/l4w5smnB9RKggGS7dtWSpBmr06HpEQ
   7L0RIh3I1uNNYOthete8peV/TMEyJa3Sgyr6XnvANcvJxINVFoah15Tmg
   Br0oGu52Bj/Bjt0yYBVbHuF2jVUKNkgC94avnaerDJftCDMzX4dLJubJy
   xs0/4rp+eWWTcK1SWO+VirOXW72u4QOV3zGgaLcbR4m8l67xEI3fZkhJZ
   6WvUT8j+xk5Rn5CRPrngZZVzqbNE04Qm0OSMk9MB+w07ZVtNRe8HKRixr
   MoYMrf4B8DO13QvcOeEKC+WVrwjY05JXQxoYuGUnoyRx850FgJYqSG0lL
   w==;
X-CSE-ConnectionGUID: l2grdEXJSSSNRPxr5mbCfg==
X-CSE-MsgGUID: FMJRjL1dSCaD2SnbSBX/Dg==
X-IronPort-AV: E=McAfee;i="6800,10657,11812"; a="246966960"
X-IronPort-AV: E=Sophos;i="6.24,197,1774278000"; 
   d="scan'208";a="246966960"
Received: from gmgwnl01.global.fujitsu.com ([52.143.17.124])
  by esa6.hc1455-7.c3s2.iphmx.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 10 Jun 2026 18:50:20 +0900
Received: from az2nlsmgm1.o.css.fujitsu.com (unknown [10.150.26.203])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by gmgwnl01.global.fujitsu.com (Postfix) with ESMTPS id 863691C00092
	for <openembedded-core@lists.openembedded.org>; Wed, 10 Jun 2026 09:50:19 +0000 (UTC)
Received: from az2uksmom2.o.css.fujitsu.com (unknown [10.151.22.203])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by az2nlsmgm1.o.css.fujitsu.com (Postfix) with ESMTPS id 3AD40C03713
	for <openembedded-core@lists.openembedded.org>; Wed, 10 Jun 2026 09:50:19 +0000 (UTC)
Received: from G08FNSTD200057.g08.fujitsu.local (unknown [10.167.135.104])
	by az2uksmom2.o.css.fujitsu.com (Postfix) with ESMTP id 536F8140027A;
	Wed, 10 Jun 2026 09:50:17 +0000 (UTC)
From: Wang Mingyu < wangmy@fujitsu.com>
To: openembedded-core@lists.openembedded.org
Cc: Wang Mingyu <wangmy@fujitsu.com>
Subject: [OE-core] [PATCH 16/16] sbom-cve-check-update-nvd-native: upgrade 2026.05.07-000006 -> 2026.06.09-000006
Date: Wed, 10 Jun 2026 17:49:31 +0800
Message-ID: <20260610094932.2264-16-wangmy@fujitsu.com>
X-Mailer: git-send-email 2.49.0.windows.1
In-Reply-To: <20260610094932.2264-1-wangmy@fujitsu.com>
References: <20260610094932.2264-1-wangmy@fujitsu.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Wed, 10 Jun 2026 09:50:23 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/238341

From: Wang Mingyu <wangmy@fujitsu.com>

Signed-off-by: Wang Mingyu <wangmy@fujitsu.com>
---
 ...bb => sbom-cve-check-update-nvd-native_2026.06.09-000006.bb} | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)
 rename meta/recipes-devtools/sbom-cve-check/{sbom-cve-check-update-nvd-native_2026.05.07-000006.bb => sbom-cve-check-update-nvd-native_2026.06.09-000006.bb} (89%)

diff --git a/meta/recipes-devtools/sbom-cve-check/sbom-cve-check-update-nvd-native_2026.05.07-000006.bb b/meta/recipes-devtools/sbom-cve-check/sbom-cve-check-update-nvd-native_2026.06.09-000006.bb
similarity index 89%
rename from meta/recipes-devtools/sbom-cve-check/sbom-cve-check-update-nvd-native_2026.05.07-000006.bb
rename to meta/recipes-devtools/sbom-cve-check/sbom-cve-check-update-nvd-native_2026.06.09-000006.bb
index 02446e30ce..2917c89e62 100644
--- a/meta/recipes-devtools/sbom-cve-check/sbom-cve-check-update-nvd-native_2026.05.07-000006.bb
+++ b/meta/recipes-devtools/sbom-cve-check/sbom-cve-check-update-nvd-native_2026.06.09-000006.bb
@@ -6,7 +6,7 @@ HOMEPAGE = "https://github.com/fkie-cad/nvd-json-data-feeds"
 SRC_URI = "git://github.com/fkie-cad/nvd-json-data-feeds.git;branch=main;protocol=https;destsuffix="
 SBOM_CVE_CHECK_DB_NAME = "nvd-fkie"
 
-SRCREV = "72d8841c8ad9083ebf6723063f275444ea0d76f9"
+SRCREV = "7ff4a0622bfdf5313c79635951112d2a45bbe9fd"
 UPSTREAM_CHECK_GITTAGREGEX = "v(?P<pver>.+)"
 
 require sbom-cve-check-update-db.inc
-- 
2.43.0


