Return-Path: <chee.yang.lee@intel.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 6F408C2FC0E
	for <webhook@archiver.kernel.org>; Thu, 17 Aug 2023 09:54:48 +0000 (UTC)
Received: from mgamail.intel.com (mgamail.intel.com [192.55.52.136])
 by mx.groups.io with SMTP id smtpd.web10.183668.1692266075942328846
 for <openembedded-core@lists.openembedded.org>;
 Thu, 17 Aug 2023 02:54:39 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@intel.com header.s=Intel header.b=Gi8Qafz2;
 spf=pass (domain: intel.com, ip: 192.55.52.136, mailfrom: chee.yang.lee@intel.com)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1692266075; x=1723802075;
  h=from:to:subject:date:message-id:mime-version:
   content-transfer-encoding;
  bh=cav7skW+eudijO2+uqdZglF0KwjDW2gXQgeImrZa91s=;
  b=Gi8Qafz2uUypAMnsipjAaow3CpC5iJRF1RCJb1RhPoBErBSOCuzng1Us
   b2OvZBawUXIQCjrcS4Z7hw1d1q+8un7Y37sA0onQa2Baa7evNRKBd94OI
   QtdwmTPKvpg9Be5dZOyPobvoixwb4XSxnAzQXG08b25WBfFLaeDYCXqKV
   8GvnrrjOfJBsPa2fsDpjAi1NyHwQkGE5L3CtfP8C+lYkrq9yqtKQvSQ/X
   KlxbRCUGWVzWmaZRuWW4YR0n5BF7Hw0O+RfgrMD0JjLsFhiA/bR3C21pq
   goGz9xrDHeG7ZCHGPbjEjL8bX8jGbKKWvM/RG7bepz8jfSDUmSYUV1ugu
   w==;
X-IronPort-AV: E=McAfee;i="6600,9927,10803"; a="352354502"
X-IronPort-AV: E=Sophos;i="6.01,179,1684825200"; 
   d="scan'208";a="352354502"
Received: from orsmga002.jf.intel.com ([10.7.209.21])
  by fmsmga106.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 17 Aug 2023 02:54:35 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10803"; a="734602757"
X-IronPort-AV: E=Sophos;i="6.01,179,1684825200"; 
   d="scan'208";a="734602757"
Received: from andromeda02.png.intel.com ([10.221.253.198])
  by orsmga002.jf.intel.com with ESMTP; 17 Aug 2023 02:54:34 -0700
From: chee.yang.lee@intel.com
To: openembedded-core@lists.openembedded.org
Subject: [mickledore][patch 1/2] librsvg: upgrade to 2.54.6
Date: Thu, 17 Aug 2023 17:34:56 +0800
Message-Id: <20230817093457.1973287-1-chee.yang.lee@intel.com>
X-Mailer: git-send-email 2.37.3
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Thu, 17 Aug 2023 09:54:48 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/186301

From: Chee Yang Lee <chee.yang.lee@intel.com>

update include fix for CVE-2023-38633.

Signed-off-by: Chee Yang Lee <chee.yang.lee@intel.com>
---
 .../librsvg/{librsvg_2.54.5.bb => librsvg_2.54.6.bb}            | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)
 rename meta/recipes-gnome/librsvg/{librsvg_2.54.5.bb => librsvg_2.54.6.bb} (97%)

diff --git a/meta/recipes-gnome/librsvg/librsvg_2.54.5.bb b/meta/recipes-gnome/librsvg/librsvg_2.54.6.bb
similarity index 97%
rename from meta/recipes-gnome/librsvg/librsvg_2.54.5.bb
rename to meta/recipes-gnome/librsvg/librsvg_2.54.6.bb
index 59278d1b16..b917b76041 100644
--- a/meta/recipes-gnome/librsvg/librsvg_2.54.5.bb
+++ b/meta/recipes-gnome/librsvg/librsvg_2.54.6.bb
@@ -20,7 +20,7 @@ SRC_URI += "file://0001-Makefile.am-pass-rust-target-to-cargo-also-when-not-.pat
            file://0001-system-deps-src-lib.rs-do-not-probe-into-harcoded-li.patch \
            "
 
-SRC_URI[archive.sha256sum] = "4f03190f45324d1fa1f52a79dfcded1f64eaf49b3ae2f88eedab0c07617cae6e"
+SRC_URI[archive.sha256sum] = "0ee6174140b5fc017e19a75c26e8c3324a560bf2c37f7abd3da06bd58542bb03"
 
 # librsvg is still autotools-based, but is calling cargo from its automake-driven makefiles
 # so we cannot use cargo class directly, but still need bits and pieces from it 
-- 
2.37.3


