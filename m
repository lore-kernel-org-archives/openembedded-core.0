Return-Path: <cristian.iorga@intel.com>
Received: from mga01.intel.com (mga01.intel.com [192.55.52.88])
	by mail.openembedded.org (Postfix) with ESMTP id 14E5D73D26
	for <openembedded-core@lists.openembedded.org>;
	Mon, 27 Jul 2015 14:43:41 +0000 (UTC)
Received: from fmsmga001.fm.intel.com ([10.253.24.23])
	by fmsmga101.fm.intel.com with ESMTP; 27 Jul 2015 07:43:40 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.15,554,1432623600"; d="scan'208";a="755805200"
Received: from sentry.rb.intel.com ([10.237.105.63])
	by fmsmga001.fm.intel.com with ESMTP; 27 Jul 2015 07:43:39 -0700
From: Cristian Iorga <cristian.iorga@intel.com>
To: openembedded-core@lists.openembedded.org
Date: Mon, 27 Jul 2015 17:43:50 +0300
Message-Id: <1438008230-20303-1-git-send-email-cristian.iorga@intel.com>
X-Mailer: git-send-email 2.1.4
Subject: [PATCH] harfbuzz: upgrade to 1.0.1
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
X-List-Received-Date: Mon, 27 Jul 2015 14:43:42 -0000

- Update to Unicode 8.0;
- Implement Universal Shaping Engine;
- Bug fixes.

Signed-off-by: Cristian Iorga <cristian.iorga@intel.com>
---
 .../harfbuzz/{harfbuzz_0.9.41.bb => harfbuzz_1.0.1.bb}                | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)
 rename meta/recipes-graphics/harfbuzz/{harfbuzz_0.9.41.bb => harfbuzz_1.0.1.bb} (88%)

diff --git a/meta/recipes-graphics/harfbuzz/harfbuzz_0.9.41.bb b/meta/recipes-graphics/harfbuzz/harfbuzz_1.0.1.bb
similarity index 88%
rename from meta/recipes-graphics/harfbuzz/harfbuzz_0.9.41.bb
rename to meta/recipes-graphics/harfbuzz/harfbuzz_1.0.1.bb
index 1ea4563..a199126 100644
--- a/meta/recipes-graphics/harfbuzz/harfbuzz_0.9.41.bb
+++ b/meta/recipes-graphics/harfbuzz/harfbuzz_1.0.1.bb
@@ -11,8 +11,8 @@ LIC_FILES_CHKSUM = "file://COPYING;md5=e021dd6dda6ff1e6b1044002fc662b9b \
 SECTION = "libs"
 
 SRC_URI = "http://www.freedesktop.org/software/harfbuzz/release/${BP}.tar.bz2"
-SRC_URI[md5sum] = "a2966f1b6a470c2cd84eb511f924cf68"
-SRC_URI[sha256sum] = "d81aa53d0c02b437beeaac159d7fc16394d676bbce0860fb6f6a10b587dc057c"
+SRC_URI[md5sum] = "b9c144965dfde96672a7c6bdd4f9bf64"
+SRC_URI[sha256sum] = "32a1a7ad584a2f2cfba5c1d234d046c0521e86e7a21d403e15e89aa509ef0ea8"
 
 inherit autotools pkgconfig lib_package
 
-- 
2.1.4


