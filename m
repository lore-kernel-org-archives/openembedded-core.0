Return-Path: <anuj.mittal@intel.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id B2D83C41513
	for <webhook@archiver.kernel.org>; Tue,  7 May 2024 02:23:21 +0000 (UTC)
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.11])
 by mx.groups.io with SMTP id smtpd.web11.2336.1715048594666835286
 for <openembedded-core@lists.openembedded.org>;
 Mon, 06 May 2024 19:23:14 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@intel.com header.s=Intel header.b=MHh/7m33;
 spf=pass (domain: intel.com, ip: 192.198.163.11, mailfrom: anuj.mittal@intel.com)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1715048595; x=1746584595;
  h=from:to:subject:date:message-id:mime-version:
   content-transfer-encoding;
  bh=kx90FgLDFGqYdMmqzkpf+NMjd3GXWZEl4wSHl5XIYfo=;
  b=MHh/7m336pzXgHuyQY4Y5R6VTtjZgBwwd31+fFATb9MKLnGaXGrvSqJl
   3gJuLTNjAyAevOCPUz3ZvH/NYVOpnIMFWkaIHOpM1PGvUDshiXcjf3QQw
   1uQJ8nl0GXZFxGgmZaHKNt4s7IXMatb8je9qkti5UhdHjbu3ShvDT4QMA
   YY73K6N7RVH9tDIJ421x+3U1DXhzA60/94ssdC0fptvmG3Hnu2daKq7Ep
   jPenhsYL8aezyTKnHp/JzF7B8PoZP8TwdD91n+I7gkQO35eK2PKP1iRcN
   /f2cZCew7qoV/P9AYhoivxgVa6LvGpZURvhLv3iBEx3b1r+6l4eGFUCh9
   A==;
X-CSE-ConnectionGUID: kzHfH6lMRO6qEx/xY9y9pQ==
X-CSE-MsgGUID: WjEnpTfZToilAiSax3GNfw==
X-IronPort-AV: E=McAfee;i="6600,9927,11065"; a="21432112"
X-IronPort-AV: E=Sophos;i="6.07,260,1708416000"; 
   d="scan'208";a="21432112"
Received: from orviesa009.jf.intel.com ([10.64.159.149])
  by fmvoesa105.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 06 May 2024 19:23:14 -0700
X-CSE-ConnectionGUID: LOkrnc3gQpaH13C4nvepvQ==
X-CSE-MsgGUID: 7mPLfiP8ToCrlnCDB+vdMA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.07,260,1708416000"; 
   d="scan'208";a="28445771"
Received: from anmitta2-mobl3.gar.corp.intel.com (HELO anmitta2-mobl3.intel.com) ([10.247.119.181])
  by orviesa009-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 06 May 2024 19:23:13 -0700
From: Anuj Mittal <anuj.mittal@intel.com>
To: openembedded-core@lists.openembedded.org
Subject: [PATCH 1/6] enchant2: upgrade 2.6.9 -> 2.7.2
Date: Tue,  7 May 2024 10:23:03 +0800
Message-ID: <20240507022308.13637-1-anuj.mittal@intel.com>
X-Mailer: git-send-email 2.45.0
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Tue, 07 May 2024 02:23:21 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/199058

Signed-off-by: Anuj Mittal <anuj.mittal@intel.com>
---
 .../enchant/{enchant2_2.6.9.bb => enchant2_2.7.2.bb}            | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)
 rename meta/recipes-support/enchant/{enchant2_2.6.9.bb => enchant2_2.7.2.bb} (91%)

diff --git a/meta/recipes-support/enchant/enchant2_2.6.9.bb b/meta/recipes-support/enchant/enchant2_2.7.2.bb
similarity index 91%
rename from meta/recipes-support/enchant/enchant2_2.6.9.bb
rename to meta/recipes-support/enchant/enchant2_2.7.2.bb
index aaf3525ad8c..08998dd48fe 100644
--- a/meta/recipes-support/enchant/enchant2_2.6.9.bb
+++ b/meta/recipes-support/enchant/enchant2_2.7.2.bb
@@ -12,7 +12,7 @@ DEPENDS = "glib-2.0 groff-native"
 inherit autotools pkgconfig github-releases
 
 SRC_URI = "${GITHUB_BASE_URI}/download/v${PV}/enchant-${PV}.tar.gz"
-SRC_URI[sha256sum] = "d9a5a10dc9b38a43b3a0fa22c76ed6ebb7e09eb535aff62954afcdbd40efff6b"
+SRC_URI[sha256sum] = "7cc3400a6657974a740b6e3c2568e2935c70e5302f07fadb2095366b75ecad6f"
 
 GITHUB_BASE_URI = "https://github.com/AbiWord/enchant/releases"
 
-- 
2.45.0


