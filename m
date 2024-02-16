Return-Path: <anuj.mittal@intel.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id CA2A1C48BEB
	for <webhook@archiver.kernel.org>; Fri, 16 Feb 2024 11:40:49 +0000 (UTC)
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.16])
 by mx.groups.io with SMTP id smtpd.web10.16724.1708083641400806033
 for <openembedded-core@lists.openembedded.org>;
 Fri, 16 Feb 2024 03:40:41 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@intel.com header.s=Intel header.b=HtKarlzT;
 spf=pass (domain: intel.com, ip: 192.198.163.16, mailfrom: anuj.mittal@intel.com)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1708083641; x=1739619641;
  h=from:to:subject:date:message-id:mime-version:
   content-transfer-encoding;
  bh=zVS7hXD69bXjjWUDkaSRlC3TUqlWl7MDR73VnuWTl+M=;
  b=HtKarlzT+dvy9pUp7CR3RKamxw/4zL6FqWjeSQMrmepgeMAnYh4ZOZHu
   uJVHUOaEdLI1vNG+JWvZLJOLZkr8rIwuI/mgALd/cbl343yQpfxT67eSJ
   +V2yQ0Ih/C2erU0+3mdkt7NxZSqS3v0ACrC3nah+Jx2gSrC6QJ32Elkzh
   67saquFL6nWV2S6iC76M3K2rwKDNpnpCm1zqjpr/R5vGWv9PdaKedsUXL
   Qu/J8fKz/Q5Fojn5ruQksAoatP59gSYO2QqoZHXDCKyU4ZVvI/BJ+Jlp5
   z0k/AJK28jdPyzJtSAipp9SpTeDLvs+4TMvjE9CHtg7py9UHRiQdYVgXt
   g==;
X-IronPort-AV: E=McAfee;i="6600,9927,10985"; a="2612855"
X-IronPort-AV: E=Sophos;i="6.06,164,1705392000"; 
   d="scan'208";a="2612855"
Received: from fmsmga002.fm.intel.com ([10.253.24.26])
  by fmvoesa110.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 16 Feb 2024 03:40:41 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10985"; a="912349722"
X-IronPort-AV: E=Sophos;i="6.06,164,1705392000"; 
   d="scan'208";a="912349722"
Received: from anmitta2-mobl3.gar.corp.intel.com (HELO anmitta2-mobl3.intel.com) ([10.247.118.3])
  by fmsmga002-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 16 Feb 2024 03:40:39 -0800
From: Anuj Mittal <anuj.mittal@intel.com>
To: openembedded-core@lists.openembedded.org
Subject: [PATCH 1/9] enchant2: upgrade 2.6.5 -> 2.6.7
Date: Fri, 16 Feb 2024 19:40:26 +0800
Message-ID: <20240216114034.109257-1-anuj.mittal@intel.com>
X-Mailer: git-send-email 2.43.2
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Fri, 16 Feb 2024 11:40:49 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/195748

Signed-off-by: Anuj Mittal <anuj.mittal@intel.com>
---
 .../enchant/{enchant2_2.6.5.bb => enchant2_2.6.7.bb}            | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)
 rename meta/recipes-support/enchant/{enchant2_2.6.5.bb => enchant2_2.6.7.bb} (91%)

diff --git a/meta/recipes-support/enchant/enchant2_2.6.5.bb b/meta/recipes-support/enchant/enchant2_2.6.7.bb
similarity index 91%
rename from meta/recipes-support/enchant/enchant2_2.6.5.bb
rename to meta/recipes-support/enchant/enchant2_2.6.7.bb
index 1d5c716bab9..b31bdc422be 100644
--- a/meta/recipes-support/enchant/enchant2_2.6.5.bb
+++ b/meta/recipes-support/enchant/enchant2_2.6.7.bb
@@ -12,7 +12,7 @@ DEPENDS = "glib-2.0 groff-native"
 inherit autotools pkgconfig github-releases
 
 SRC_URI = "${GITHUB_BASE_URI}/download/v${PV}/enchant-${PV}.tar.gz"
-SRC_URI[sha256sum] = "9e8fd28cb65a7b6da3545878a5c2f52a15f03c04933a5ff48db89fe86845728e"
+SRC_URI[sha256sum] = "a1c2e5b59acca000bbfb24810af4a1165733d407f2154786588e076c8cd57bfc"
 
 GITHUB_BASE_URI = "https://github.com/AbiWord/enchant/releases"
 
-- 
2.43.2


