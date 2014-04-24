Return-Path: <cristian.iorga@intel.com>
Received: from mga02.intel.com (mga02.intel.com [134.134.136.20])
	by mail.openembedded.org (Postfix) with ESMTP id C92F465D71
	for <openembedded-core@lists.openembedded.org>;
	Thu, 24 Apr 2014 09:16:03 +0000 (UTC)
Received: from fmsmga001.fm.intel.com ([10.253.24.23])
	by orsmga101.jf.intel.com with ESMTP; 24 Apr 2014 02:16:04 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="4.97,917,1389772800"; d="scan'208";a="518695472"
Received: from sentry.rb.intel.com ([10.237.105.54])
	by fmsmga001.fm.intel.com with ESMTP; 24 Apr 2014 02:15:47 -0700
From: Cristian Iorga <cristian.iorga@intel.com>
To: openembedded-core@lists.openembedded.org
Date: Thu, 24 Apr 2014 12:19:05 +0300
Message-Id: <97685cbb8020bd8e5b52ff42a2cde7e0beb80f69.1398331032.git.cristian.iorga@intel.com>
X-Mailer: git-send-email 1.9.1
In-Reply-To: <cover.1398331032.git.cristian.iorga@intel.com>
References: <cover.1398331032.git.cristian.iorga@intel.com>
In-Reply-To: <cover.1398331032.git.cristian.iorga@intel.com>
References: <cover.1398331032.git.cristian.iorga@intel.com>
Subject: [PATCH 3/4] harfbuzz: upgrade to 0.9.27
X-BeenThere: openembedded-core@lists.openembedded.org
X-Mailman-Version: 2.1.12
Precedence: list
List-Id: Patches and discussions about the oe-core layer
	<openembedded-core.lists.openembedded.org>
List-Unsubscribe: <http://lists.openembedded.org/mailman/options/openembedded-core>,
	<mailto:openembedded-core-request@lists.openembedded.org?subject=unsubscribe>
List-Archive: <http://lists.openembedded.org/pipermail/openembedded-core/>
List-Post: <mailto:openembedded-core@lists.openembedded.org>
List-Help: <mailto:openembedded-core-request@lists.openembedded.org?subject=help>
List-Subscribe: <http://lists.openembedded.org/mailman/listinfo/openembedded-core>,
	<mailto:openembedded-core-request@lists.openembedded.org?subject=subscribe>
X-List-Received-Date: Thu, 24 Apr 2014 09:16:03 -0000

Signed-off-by: Cristian Iorga <cristian.iorga@intel.com>
---
 .../harfbuzz/{harfbuzz_0.9.26.bb => harfbuzz_0.9.27.bb}              | 5 ++---
 1 file changed, 2 insertions(+), 3 deletions(-)
 rename meta/recipes-graphics/harfbuzz/{harfbuzz_0.9.26.bb => harfbuzz_0.9.27.bb} (88%)

diff --git a/meta/recipes-graphics/harfbuzz/harfbuzz_0.9.26.bb b/meta/recipes-graphics/harfbuzz/harfbuzz_0.9.27.bb
similarity index 88%
rename from meta/recipes-graphics/harfbuzz/harfbuzz_0.9.26.bb
rename to meta/recipes-graphics/harfbuzz/harfbuzz_0.9.27.bb
index 61d54c6..d60c3ba 100644
--- a/meta/recipes-graphics/harfbuzz/harfbuzz_0.9.26.bb
+++ b/meta/recipes-graphics/harfbuzz/harfbuzz_0.9.27.bb
@@ -12,9 +12,8 @@ SECTION = "libs"
 
 SRC_URI = "http://www.freedesktop.org/software/harfbuzz/release/${BP}.tar.bz2 \
 "
-
-SRC_URI[md5sum] = "a2b6cbd437f22dd5dc93d377696c9204"
-SRC_URI[sha256sum] = "5ded7dc3d15fb5c9230d7a224b9256b67b35fde30193b4c3a4c3f6b13110e257"
+SRC_URI[md5sum] = "60e122288c0ea4d66505d4704e376a1c"
+SRC_URI[sha256sum] = "08584ae91c98d5b14d5f2c45b01410a12b030c9397bd73135bd2155297b447db"
 
 inherit autotools pkgconfig lib_package
 
-- 
1.9.1


