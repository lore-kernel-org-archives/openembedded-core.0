Return-Path: <preeti.sachan@intel.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 8A164C88E75
	for <webhook@archiver.kernel.org>; Tue, 15 Sep 2026 04:43:45 +0000 (UTC)
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.10])
 by mx.groups.io with SMTP id smtpd.msgproc02-g2.16282.1789447423875133954
 for <openembedded-core@lists.openembedded.org>;
 Mon, 14 Sep 2026 21:43:44 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@intel.com header.s=Intel header.b=C7ldwOHo;
 spf=pass (domain: intel.com, ip: 198.175.65.10, mailfrom: preeti.sachan@intel.com)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1789447424; x=1820983424;
  h=from:to:subject:date:message-id:mime-version:
   content-transfer-encoding;
  bh=UqRVMbws2xRTLAoSxPzOpoUe+HnJ2JAB4EuO94XMolw=;
  b=C7ldwOHos41gbi9dlFmT2SoPsV67j3TOpEaQAHO9AVphUTd/unfB8WZW
   VcJ7UfWT63hV1ErEPyuf+42Qzg5l6rn2o8Fj+EA95mY68mv5OfEcgBRpu
   2QlbIqNL7jz8xs2+mEfiPRu74/kq7bHXaazd/AKRRmyirOHKFD32dUaVg
   0BwYxYZYhvjMmlWjRpO9wsC3/gCJSdU4K0RP91yS999joLhoBf81nNpEI
   g9vKTguDcVFiHrM9Fjs9P1jEsaJKpW3nU+fHMWwXWvv0gZyJthgM2UgON
   wDeBLdN4lJwJkA0BvfGQj7ujDrFWE6I7jt5QBlX/BfS+0o4lagkkYiQLF
   g==;
X-CSE-ConnectionGUID: BetRPz/hQG+t7Z4qN2O20Q==
X-CSE-MsgGUID: AMAzPH53TBuGa4VFjmScEA==
X-IronPort-AV: E=McAfee;i="6800,10657,11905"; a="107173241"
X-IronPort-AV: E=Sophos;i="6.27,103,1787036400"; 
   d="scan'208";a="107173241"
Received: from orviesa006.jf.intel.com ([10.64.159.146])
  by orvoesa102.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 14 Sep 2026 21:43:43 -0700
X-CSE-ConnectionGUID: huFgJuECRdm7aHPpbUYY6g==
X-CSE-MsgGUID: FnKYG0LuSE+yf4VRUyNAAw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.27,103,1787036400"; 
   d="scan'208";a="271023167"
Received: from ba38rdl00538.iind.intel.com ([10.49.1.8])
  by orviesa006.jf.intel.com with ESMTP; 14 Sep 2026 21:43:43 -0700
From: preeti.sachan@intel.com
To: openembedded-core@lists.openembedded.org
Subject: [wrynose][PATCH v2] libaio: update SRC_URI
Date: Tue, 15 Sep 2026 10:14:58 +0530
Message-Id: <20260915044458.2583011-1-preeti.sachan@intel.com>
X-Mailer: git-send-email 2.34.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Tue, 15 Sep 2026 04:43:45 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/245808

From: Ross Burton <ross.burton@arm.com>

libaio has moved to Codeberg as pagure.io will be closed down shortly.

Cherry picked commit 237c32e181cd47194c3877d220360d6e6fbb2af8 from master branch.

Signed-off-by: Ross Burton <ross.burton@arm.com>
Signed-off-by: Mathieu Dubois-Briand <mathieu.dubois-briand@bootlin.com>
Signed-off-by: Preeti Sachan <preeti.sachan@intel.com>
---
 meta/recipes-extended/libaio/libaio_0.3.113.bb | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/meta/recipes-extended/libaio/libaio_0.3.113.bb b/meta/recipes-extended/libaio/libaio_0.3.113.bb
index 2392fd5db2..1668f4069f 100644
--- a/meta/recipes-extended/libaio/libaio_0.3.113.bb
+++ b/meta/recipes-extended/libaio/libaio_0.3.113.bb
@@ -5,7 +5,7 @@ HOMEPAGE = "http://lse.sourceforge.net/io/aio.html"
 LICENSE = "LGPL-2.1-or-later"
 LIC_FILES_CHKSUM = "file://COPYING;md5=d8045f3b8f929c1cb29a1e3fd737b499"
 
-SRC_URI = "git://pagure.io/libaio.git;protocol=https;branch=master \
+SRC_URI = "git://codeberg.org/jmoyer/libaio.git;protocol=https;branch=master \
            file://00_arches.patch \
            file://libaio_fix_for_mips_syscalls.patch \
            file://system-linkage.patch \
-- 
2.34.1


