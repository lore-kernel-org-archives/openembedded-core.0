Received: from mga09.intel.com (mga09.intel.com [134.134.136.24])
 by mx.groups.io with SMTP id smtpd.web11.4406.1609318905711505661
 for <openembedded-core@lists.openembedded.org>;
 Wed, 30 Dec 2020 01:01:46 -0800
Authentication-Results: mx.groups.io;
 dkim=missing; spf=pass (domain: intel.com, ip: 134.134.136.24, mailfrom: chee.yang.lee@intel.com)
IronPort-SDR: fVgtHjWf0mFnM/o6Y51KJzNmVT261l4MGdRcfxktVTqQLr06BmvXyFGDNRhRA5a0784NCGE0BD
 K97FuMKAO0fQ==
X-IronPort-AV: E=McAfee;i="6000,8403,9849"; a="176739312"
X-IronPort-AV: E=Sophos;i="5.78,460,1599548400"; 
   d="scan'208";a="176739312"
Received: from orsmga008.jf.intel.com ([10.7.209.65])
  by orsmga102.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 30 Dec 2020 01:01:44 -0800
IronPort-SDR: K0Iz+D2n/axNYsKDJA2oWIs424IuBH9lpuQ8dv5cOwSM7td7iqOG1xAno8UjA6nYz63OkzGxph
 nXQUOZhw2hHw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.78,460,1599548400"; 
   d="scan'208";a="376356693"
Received: from unknown (HELO guest1-ubuntu1804.png.intel.com) ([10.221.183.51])
  by orsmga008.jf.intel.com with ESMTP; 30 Dec 2020 01:01:41 -0800
From: "Lee Chee Yang" <chee.yang.lee@intel.com>
To: openembedded-core@lists.openembedded.org
Subject: [PATCH 1/2] p11-kit: upgrade 0.23.21 -> 0.23.22
Date: Wed, 30 Dec 2020 17:01:39 +0800
Message-Id: <20201230090140.85279-1-chee.yang.lee@intel.com>
X-Mailer: git-send-email 2.17.1

From: Upgrade Helper <auh@auh.yoctoproject.org>

https://github.com/p11-glue/p11-kit/releases/tag/0.23.22

Release notes:
Fix memory-safety issues that affect the RPC protocol (CVE-2020-29361, CVE-2020-29362, and CVE-2020-29363), discovered and fixed by David Cook
anchor: Prefer persistent format when storing anchor [#329]
common: Fix infloop in p11_path_build [#326, #327]
proxy: C_CloseAllSessions: Make sure that calloc args are non-zero [#325]
common: Check for a NULL locale before freeing it [#321]
Build and test fixes [#313, #315, #317, #318, #319, #323, #330, #333, #334, #335, #338, #339]

Signed-off-by: Lee Chee Yang <chee.yang.lee@intel.com>
---
 .../p11-kit/{p11-kit_0.23.21.bb => p11-kit_0.23.22.bb}        | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)
 rename meta/recipes-support/p11-kit/{p11-kit_0.23.21.bb => p11-kit_0.23.22.bb} (87%)

diff --git a/meta/recipes-support/p11-kit/p11-kit_0.23.21.bb b/meta/recipes-support/p11-kit/p11-kit_0.23.22.bb
similarity index 87%
rename from meta/recipes-support/p11-kit/p11-kit_0.23.21.bb
rename to meta/recipes-support/p11-kit/p11-kit_0.23.22.bb
index b1fd2334b2..050ef2f3ed 100644
--- a/meta/recipes-support/p11-kit/p11-kit_0.23.21.bb
+++ b/meta/recipes-support/p11-kit/p11-kit_0.23.22.bb
@@ -8,8 +8,8 @@ DEPENDS = "libtasn1 libtasn1-native libffi"
 
 DEPENDS_append = "${@' glib-2.0' if d.getVar('GTKDOC_ENABLED') == 'True' else ''}"
 
-SRC_URI = "git://github.com/p11-glue/p11-kit"
-SRCREV = "fd8b56f3ee971f94dc6fc95411fc01e1c12153ab"
+SRC_URI = "git://github.com/p11-glue/p11-kit;branch=0.23"
+SRCREV = "bd97afbfe28d5fbbde95ce36ff7a8834fc0291ee"
 S = "${WORKDIR}/git"
 
 PACKAGECONFIG ??= ""
-- 
2.17.1

