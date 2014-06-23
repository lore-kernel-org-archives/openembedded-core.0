Return-Path: <cristian.iorga@intel.com>
Received: from mga02.intel.com (mga02.intel.com [134.134.136.20])
	by mail.openembedded.org (Postfix) with ESMTP id 95D7F6B4F7
	for <openembedded-core@lists.openembedded.org>;
	Mon, 23 Jun 2014 13:15:08 +0000 (UTC)
Received: from orsmga001.jf.intel.com ([10.7.209.18])
	by orsmga101.jf.intel.com with ESMTP; 23 Jun 2014 06:15:08 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.01,530,1400050800"; d="scan'208";a="532678506"
Received: from sentry.rb.intel.com ([10.237.105.54])
	by orsmga001.jf.intel.com with ESMTP; 23 Jun 2014 06:15:07 -0700
From: Cristian Iorga <cristian.iorga@intel.com>
To: openembedded-core@lists.openembedded.org
Date: Mon, 23 Jun 2014 16:18:43 +0300
Message-Id: <23dead2ac78c3a7454b28ae18be6b9f23d730cc9.1403529482.git.cristian.iorga@intel.com>
X-Mailer: git-send-email 1.9.1
In-Reply-To: <cover.1403529482.git.cristian.iorga@intel.com>
References: <cover.1403529482.git.cristian.iorga@intel.com>
In-Reply-To: <cover.1403529482.git.cristian.iorga@intel.com>
References: <cover.1403529482.git.cristian.iorga@intel.com>
Subject: [PATCH 2/3] harfbuzz: upgrade to 0.9.29
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
X-List-Received-Date: Mon, 23 Jun 2014 13:15:10 -0000

Mostly a bugfix release.

Signed-off-by: Cristian Iorga <cristian.iorga@intel.com>
---
 .../harfbuzz/{harfbuzz_0.9.28.bb => harfbuzz_0.9.29.bb}               | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)
 rename meta/recipes-graphics/harfbuzz/{harfbuzz_0.9.28.bb => harfbuzz_0.9.29.bb} (88%)

diff --git a/meta/recipes-graphics/harfbuzz/harfbuzz_0.9.28.bb b/meta/recipes-graphics/harfbuzz/harfbuzz_0.9.29.bb
similarity index 88%
rename from meta/recipes-graphics/harfbuzz/harfbuzz_0.9.28.bb
rename to meta/recipes-graphics/harfbuzz/harfbuzz_0.9.29.bb
index 82ed2b1..96a4932 100644
--- a/meta/recipes-graphics/harfbuzz/harfbuzz_0.9.28.bb
+++ b/meta/recipes-graphics/harfbuzz/harfbuzz_0.9.29.bb
@@ -11,8 +11,8 @@ LIC_FILES_CHKSUM = "file://COPYING;md5=e021dd6dda6ff1e6b1044002fc662b9b \
 SECTION = "libs"
 
 SRC_URI = "http://www.freedesktop.org/software/harfbuzz/release/${BP}.tar.bz2"
-SRC_URI[md5sum] = "accbeb679f39d839038b95a87e40870e"
-SRC_URI[sha256sum] = "a567f7c58018af0a9751e18641fd8434bfcef8307122dabe47dd652ce8bde048"
+SRC_URI[md5sum] = "6251eb6d57e8c4e9e855188dbbdf8b6d"
+SRC_URI[sha256sum] = "601cea38c6fa0cf362dd9042c66cf4db711c5f9390de4ca46d6d2fc3f64de390"
 inherit autotools pkgconfig lib_package
 
 DEPENDS = "glib-2.0 cairo freetype"
-- 
1.9.1


