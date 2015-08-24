Return-Path: <cristian.iorga@intel.com>
Received: from mga11.intel.com (mga11.intel.com [192.55.52.93])
	by mail.openembedded.org (Postfix) with ESMTP id 26CC26AC1E
	for <openembedded-core@lists.openembedded.org>;
	Mon, 24 Aug 2015 14:30:00 +0000 (UTC)
Received: from orsmga001.jf.intel.com ([10.7.209.18])
	by fmsmga102.fm.intel.com with ESMTP; 24 Aug 2015 07:30:00 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.15,738,1432623600"; d="scan'208";a="754380858"
Received: from sentry.rb.intel.com ([10.237.105.63])
	by orsmga001.jf.intel.com with ESMTP; 24 Aug 2015 07:30:00 -0700
From: Cristian Iorga <cristian.iorga@intel.com>
To: openembedded-core@lists.openembedded.org
Date: Mon, 24 Aug 2015 17:30:13 +0300
Message-Id: <1440426613-1775-1-git-send-email-cristian.iorga@intel.com>
X-Mailer: git-send-email 2.1.4
Subject: [PATCH] harfbuzz: upgrade to 1.0.2
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
X-List-Received-Date: Mon, 24 Aug 2015 14:30:01 -0000

Bugfix release.

Signed-off-by: Cristian Iorga <cristian.iorga@intel.com>
---
 .../harfbuzz/{harfbuzz_1.0.1.bb => harfbuzz_1.0.2.bb}                 | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)
 rename meta/recipes-graphics/harfbuzz/{harfbuzz_1.0.1.bb => harfbuzz_1.0.2.bb} (88%)

diff --git a/meta/recipes-graphics/harfbuzz/harfbuzz_1.0.1.bb b/meta/recipes-graphics/harfbuzz/harfbuzz_1.0.2.bb
similarity index 88%
rename from meta/recipes-graphics/harfbuzz/harfbuzz_1.0.1.bb
rename to meta/recipes-graphics/harfbuzz/harfbuzz_1.0.2.bb
index a199126..a0ba466 100644
--- a/meta/recipes-graphics/harfbuzz/harfbuzz_1.0.1.bb
+++ b/meta/recipes-graphics/harfbuzz/harfbuzz_1.0.2.bb
@@ -11,8 +11,8 @@ LIC_FILES_CHKSUM = "file://COPYING;md5=e021dd6dda6ff1e6b1044002fc662b9b \
 SECTION = "libs"
 
 SRC_URI = "http://www.freedesktop.org/software/harfbuzz/release/${BP}.tar.bz2"
-SRC_URI[md5sum] = "b9c144965dfde96672a7c6bdd4f9bf64"
-SRC_URI[sha256sum] = "32a1a7ad584a2f2cfba5c1d234d046c0521e86e7a21d403e15e89aa509ef0ea8"
+SRC_URI[md5sum] = "e74f644045fe42c38a2641fc1e82a800"
+SRC_URI[sha256sum] = "beb3caf8654010fcdca61c810a3a7532237fc567ee4271deb674b5efbbe3b466"
 
 inherit autotools pkgconfig lib_package
 
-- 
2.1.4


