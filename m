Return-Path: <cristian.iorga@intel.com>
Received: from mga03.intel.com (unknown [143.182.124.21])
	by mail.openembedded.org (Postfix) with ESMTP id E818566120
	for <openembedded-core@lists.openembedded.org>;
	Mon, 19 May 2014 14:35:36 +0000 (UTC)
Received: from azsmga001.ch.intel.com ([10.2.17.19])
	by azsmga101.ch.intel.com with ESMTP; 19 May 2014 07:35:33 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="4.98,867,1392192000"; d="scan'208";a="433986594"
Received: from sentry.rb.intel.com ([10.237.105.54])
	by azsmga001.ch.intel.com with ESMTP; 19 May 2014 07:35:32 -0700
From: Cristian Iorga <cristian.iorga@intel.com>
To: openembedded-core@lists.openembedded.org
Date: Mon, 19 May 2014 17:39:04 +0300
Message-Id: <70173bc1db54a92f0f608b8f8aab6b419c6768eb.1400510304.git.cristian.iorga@intel.com>
X-Mailer: git-send-email 1.9.1
In-Reply-To: <cover.1400510304.git.cristian.iorga@intel.com>
References: <cover.1400510304.git.cristian.iorga@intel.com>
In-Reply-To: <cover.1400510304.git.cristian.iorga@intel.com>
References: <cover.1400510304.git.cristian.iorga@intel.com>
Subject: [PATCH 1/1] harfbuzz: upgrade to 0.9.28
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
X-List-Received-Date: Mon, 19 May 2014 14:35:37 -0000

Signed-off-by: Cristian Iorga <cristian.iorga@intel.com>
---
 .../harfbuzz/{harfbuzz_0.9.27.bb => harfbuzz_0.9.28.bb}           | 8 +++-----
 1 file changed, 3 insertions(+), 5 deletions(-)
 rename meta/recipes-graphics/harfbuzz/{harfbuzz_0.9.27.bb => harfbuzz_0.9.28.bb} (87%)

diff --git a/meta/recipes-graphics/harfbuzz/harfbuzz_0.9.27.bb b/meta/recipes-graphics/harfbuzz/harfbuzz_0.9.28.bb
similarity index 87%
rename from meta/recipes-graphics/harfbuzz/harfbuzz_0.9.27.bb
rename to meta/recipes-graphics/harfbuzz/harfbuzz_0.9.28.bb
index d60c3ba..82ed2b1 100644
--- a/meta/recipes-graphics/harfbuzz/harfbuzz_0.9.27.bb
+++ b/meta/recipes-graphics/harfbuzz/harfbuzz_0.9.28.bb
@@ -10,11 +10,9 @@ LIC_FILES_CHKSUM = "file://COPYING;md5=e021dd6dda6ff1e6b1044002fc662b9b \
 
 SECTION = "libs"
 
-SRC_URI = "http://www.freedesktop.org/software/harfbuzz/release/${BP}.tar.bz2 \
-"
-SRC_URI[md5sum] = "60e122288c0ea4d66505d4704e376a1c"
-SRC_URI[sha256sum] = "08584ae91c98d5b14d5f2c45b01410a12b030c9397bd73135bd2155297b447db"
-
+SRC_URI = "http://www.freedesktop.org/software/harfbuzz/release/${BP}.tar.bz2"
+SRC_URI[md5sum] = "accbeb679f39d839038b95a87e40870e"
+SRC_URI[sha256sum] = "a567f7c58018af0a9751e18641fd8434bfcef8307122dabe47dd652ce8bde048"
 inherit autotools pkgconfig lib_package
 
 DEPENDS = "glib-2.0 cairo freetype"
-- 
1.9.1


