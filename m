Return-Path: <cristian.iorga@intel.com>
Received: from mga02.intel.com (mga02.intel.com [134.134.136.20])
	by mail.openembedded.org (Postfix) with ESMTP id 8312C6AC15
	for <openembedded-core@lists.openembedded.org>;
	Mon, 25 May 2015 13:10:52 +0000 (UTC)
Received: from fmsmga001.fm.intel.com ([10.253.24.23])
	by orsmga101.jf.intel.com with ESMTP; 25 May 2015 06:10:55 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.13,491,1427785200"; d="scan'208";a="715268439"
Received: from sentry.rb.intel.com ([10.237.105.157])
	by fmsmga001.fm.intel.com with ESMTP; 25 May 2015 06:10:52 -0700
From: Cristian Iorga <cristian.iorga@intel.com>
To: openembedded-core@lists.openembedded.org
Date: Mon, 25 May 2015 16:10:50 +0300
Message-Id: <1432559450-13825-1-git-send-email-cristian.iorga@intel.com>
X-Mailer: git-send-email 2.1.4
Subject: [PATCH] harfbuzz: upgrade to 0.9.40
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
X-List-Received-Date: Mon, 25 May 2015 13:10:56 -0000

- Optimizations and refactoring;
- Bug fixes.

Signed-off-by: Cristian Iorga <cristian.iorga@intel.com>
---
 .../harfbuzz/{harfbuzz_0.9.38.bb => harfbuzz_0.9.40.bb}               | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)
 rename meta/recipes-graphics/harfbuzz/{harfbuzz_0.9.38.bb => harfbuzz_0.9.40.bb} (88%)

diff --git a/meta/recipes-graphics/harfbuzz/harfbuzz_0.9.38.bb b/meta/recipes-graphics/harfbuzz/harfbuzz_0.9.40.bb
similarity index 88%
rename from meta/recipes-graphics/harfbuzz/harfbuzz_0.9.38.bb
rename to meta/recipes-graphics/harfbuzz/harfbuzz_0.9.40.bb
index 90794c7..2517ede 100644
--- a/meta/recipes-graphics/harfbuzz/harfbuzz_0.9.38.bb
+++ b/meta/recipes-graphics/harfbuzz/harfbuzz_0.9.40.bb
@@ -11,8 +11,8 @@ LIC_FILES_CHKSUM = "file://COPYING;md5=e021dd6dda6ff1e6b1044002fc662b9b \
 SECTION = "libs"
 
 SRC_URI = "http://www.freedesktop.org/software/harfbuzz/release/${BP}.tar.bz2"
-SRC_URI[md5sum] = "8839e574be8089c0de83768798bf7916"
-SRC_URI[sha256sum] = "6736f383b4edfcaaeb6f3292302ca382d617d8c79948bb2dd2e8f86cdccfd514"
+SRC_URI[md5sum] = "0e27e531f4c4acff601ebff0957755c2"
+SRC_URI[sha256sum] = "1771d53583be6d91ca961854b2a24fb239ef0545eed221ae3349abae0ab8321f"
 
 inherit autotools pkgconfig lib_package
 
-- 
2.1.4


