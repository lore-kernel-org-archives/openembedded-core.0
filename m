Return-Path: <anuj.mittal@intel.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 467CEC47258
	for <webhook@archiver.kernel.org>; Tue, 23 Jan 2024 08:47:47 +0000 (UTC)
Received: from mgamail.intel.com (mgamail.intel.com [192.55.52.88])
 by mx.groups.io with SMTP id smtpd.web11.7669.1705999661163650396
 for <openembedded-core@lists.openembedded.org>;
 Tue, 23 Jan 2024 00:47:43 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@intel.com header.s=Intel header.b=OyX22mGG;
 spf=pass (domain: intel.com, ip: 192.55.52.88, mailfrom: anuj.mittal@intel.com)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1705999663; x=1737535663;
  h=from:to:subject:date:message-id:in-reply-to:references:
   mime-version:content-transfer-encoding;
  bh=EKOBy8LvRH69+LjdGX0Fh9R6IW0pju0KMDgfC2Tq52Y=;
  b=OyX22mGGhBOCEkv0LZi1Hml4QqlS2PRi/t5dhc4MljdA/IPgRHC9wPTn
   k/xzDZ6hjD+Ech8bjKo2qfeYx9WtQNSzg1hMrSzCM0UF5UDb2mkkRVmrX
   luzg3iJC1NtTPSNcnQCo0uSEmSjqDid+6HVuAkpYTRKPFlQ/I1xr+MGIH
   HPStB2x57Jq/NJ55VB2R1Y73puDsDGXrq6FHvjA32GjuBdj5KtSCS42XW
   t+tVQpMYBrU0c/l1260SDKoYh+K2vlJtS6tPWaKJhw8m0EFdd5R709q2A
   V8Aux30ZhxHPyFjQmcgSLy7+HEehfSqZP3KzfjiqL0xwKv23W1MnTShKr
   A==;
X-IronPort-AV: E=McAfee;i="6600,9927,10961"; a="432617030"
X-IronPort-AV: E=Sophos;i="6.05,213,1701158400"; 
   d="scan'208";a="432617030"
Received: from orsmga001.jf.intel.com ([10.7.209.18])
  by fmsmga101.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 23 Jan 2024 00:47:43 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10961"; a="820013004"
X-IronPort-AV: E=Sophos;i="6.05,213,1701158400"; 
   d="scan'208";a="820013004"
Received: from anmitta2-mobl3.gar.corp.intel.com (HELO anmitta2-mobl3.intel.com) ([10.214.153.8])
  by orsmga001-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 23 Jan 2024 00:47:42 -0800
From: Anuj Mittal <anuj.mittal@intel.com>
To: openembedded-core@lists.openembedded.org
Subject: [PATCH 3/4] libpsl: upgrade 0.21.2 -> 0.21.5
Date: Tue, 23 Jan 2024 16:47:33 +0800
Message-ID: <20240123084734.223154-3-anuj.mittal@intel.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20240123084734.223154-1-anuj.mittal@intel.com>
References: <20240123084734.223154-1-anuj.mittal@intel.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Tue, 23 Jan 2024 08:47:47 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/194216

License-Update: Copyright dates changed

Signed-off-by: Anuj Mittal <anuj.mittal@intel.com>
---
 .../libpsl/{libpsl_0.21.2.bb => libpsl_0.21.5.bb}           | 6 +++---
 1 file changed, 3 insertions(+), 3 deletions(-)
 rename meta/recipes-support/libpsl/{libpsl_0.21.2.bb => libpsl_0.21.5.bb} (79%)

diff --git a/meta/recipes-support/libpsl/libpsl_0.21.2.bb b/meta/recipes-support/libpsl/libpsl_0.21.5.bb
similarity index 79%
rename from meta/recipes-support/libpsl/libpsl_0.21.2.bb
rename to meta/recipes-support/libpsl/libpsl_0.21.5.bb
index 3bbbc0e5214..b9341a986e5 100644
--- a/meta/recipes-support/libpsl/libpsl_0.21.2.bb
+++ b/meta/recipes-support/libpsl/libpsl_0.21.5.bb
@@ -7,13 +7,13 @@ HOMEPAGE = "https://rockdaboot.github.io/libpsl/"
 BUGTRACKER = "https://github.com/rockdaboot/libpsl/issues"
 
 LICENSE = "MIT"
-LIC_FILES_CHKSUM = "file://LICENSE;md5=6f40ab7fcf5ff18f3ff7f4b0860493fa \
-                    file://COPYING;md5=6f40ab7fcf5ff18f3ff7f4b0860493fa \
+LIC_FILES_CHKSUM = "file://LICENSE;md5=9f9e317096db2a598fc44237c5b8a4f7 \
+                    file://COPYING;md5=9f9e317096db2a598fc44237c5b8a4f7 \
                     "
 
 SRC_URI = "${GITHUB_BASE_URI}/download/${PV}/${BP}.tar.gz \
            "
-SRC_URI[sha256sum] = "e35991b6e17001afa2c0ca3b10c357650602b92596209b7492802f3768a6285f"
+SRC_URI[sha256sum] = "1dcc9ceae8b128f3c0b3f654decd0e1e891afc6ff81098f227ef260449dae208"
 
 GITHUB_BASE_URI = "https://github.com/rockdaboot/libpsl/releases"
 
-- 
2.43.0


