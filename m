Return-Path: <kartikey.rameshbhai.parmar@intel.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 2453CC433EF
	for <webhook@archiver.kernel.org>; Wed, 23 Feb 2022 06:26:19 +0000 (UTC)
Received: from mga02.intel.com (mga02.intel.com [134.134.136.20])
 by mx.groups.io with SMTP id smtpd.web10.4510.1645597578286371738
 for <openembedded-core@lists.openembedded.org>;
 Tue, 22 Feb 2022 22:26:18 -0800
Authentication-Results: mx.groups.io;
 dkim=fail reason="unable to parse pub key" header.i=@intel.com header.s=intel
 header.b=jHM6GPKM;
 spf=pass (domain: intel.com, ip: 134.134.136.20,
 mailfrom: kartikey.rameshbhai.parmar@intel.com)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1645597578; x=1677133578;
  h=from:to:subject:date:message-id:mime-version:
   content-transfer-encoding;
  bh=qgBJyENgnNH8SQvquosfACk6z8MOAjbZ3KeJgyFp9Sg=;
  b=jHM6GPKM6YDoDwEE7frkHNRoq5jzlKe+q1eQcCfO5/s1HWLA5QRjvQ7p
   H2X7hAHtSsgnqDQi5D8GMsoV0wkD0KmO0DM0PAGCxYuO8foTGWsjpTbpc
   25+I9NjCHCEjIQBt8W2/co/nTWrAKZVX1rCfyZEH6ZH3a8+GLKpeyF99i
   uGGCUCqFc9bu57AVp0CeqYFcepZf0i7+HxYM+7jUC0PjKH9PCcD94Bzcf
   s0iiM6pgRRykfWH4t0LHMJyt9uJyhqxHVCN4DG3AEh26q22AKoHaQrLlM
   V0ZAZT8haxfaIWao36ImdHC90guGce07GtJghSzakoxMR6U7A7Vr/Llyj
   A==;
X-IronPort-AV: E=McAfee;i="6200,9189,10266"; a="239283696"
X-IronPort-AV: E=Sophos;i="5.88,390,1635231600";
   d="scan'208";a="239283696"
Received: from fmsmga004.fm.intel.com ([10.253.24.48])
  by orsmga101.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 22 Feb 2022 22:26:17 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.88,390,1635231600";
   d="scan'208";a="606950409"
Received: from ubuntu161tb.png.intel.com ([10.88.227.41])
  by fmsmga004.fm.intel.com with ESMTP; 22 Feb 2022 22:26:16 -0800
From: kartikey.rameshbhai.parmar@intel.com
To: openembedded-core@lists.openembedded.org
Subject: [dunfell][PATCH] puzzles: Upstream changed to main branch for
 development
Date: Wed, 23 Feb 2022 06:25:59 +0000
Message-Id: <20220223062559.14100-1-kartikey.rameshbhai.parmar@intel.com>
X-Mailer: git-send-email 2.35.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Wed, 23 Feb 2022 06:26:19 -0000
X-Groupsio-URL: 
 https://lists.openembedded.org/g/openembedded-core/message/162242

From: Kartikey Rameshbhai Parmar <kartikey.rameshbhai.parmar@intel.com>

Signed-off-by: Kartikey Rameshbhai Parmar <kartikey.rameshbhai.parmar@intel.com>
---
 meta/recipes-sato/puzzles/puzzles_git.bb | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/meta/recipes-sato/puzzles/puzzles_git.bb b/meta/recipes-sato/puzzles/puzzles_git.bb
index 2edc9ada2e..3ee441998d 100644
--- a/meta/recipes-sato/puzzles/puzzles_git.bb
+++ b/meta/recipes-sato/puzzles/puzzles_git.bb
@@ -9,7 +9,7 @@ DEPENDS = "libxt"
 # The libxt requires x11 in DISTRO_FEATURES
 REQUIRED_DISTRO_FEATURES = "x11"
 
-SRC_URI = "git://git.tartarus.org/simon/puzzles.git;branch=master \
+SRC_URI = "git://git.tartarus.org/simon/puzzles.git;branch=main \
            file://fix-compiling-failure-with-option-g-O.patch \
            file://0001-palisade-Fix-warnings-with-clang-on-arm.patch \
            file://0001-Use-Wno-error-format-overflow-if-the-compiler-suppor.patch \
-- 
2.35.1


