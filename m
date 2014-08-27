Return-Path: <cristian.iorga@intel.com>
Received: from mga11.intel.com (mga11.intel.com [192.55.52.93])
	by mail.openembedded.org (Postfix) with ESMTP id 29BD07117F
	for <openembedded-core@lists.openembedded.org>;
	Wed, 27 Aug 2014 18:10:15 +0000 (UTC)
Received: from fmsmga001.fm.intel.com ([10.253.24.23])
	by fmsmga102.fm.intel.com with ESMTP; 27 Aug 2014 11:10:13 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.04,412,1406617200"; d="scan'208";a="582500090"
Received: from sentry.rb.intel.com ([10.237.105.37])
	by fmsmga001.fm.intel.com with ESMTP; 27 Aug 2014 11:10:12 -0700
From: Cristian Iorga <cristian.iorga@intel.com>
To: openembedded-core@lists.openembedded.org
Date: Wed, 27 Aug 2014 21:10:02 +0300
Message-Id: <98b1d9f41611319c12c0f45844a25c6d67e56107.1409162830.git.cristian.iorga@intel.com>
X-Mailer: git-send-email 1.9.1
In-Reply-To: <cover.1409162830.git.cristian.iorga@intel.com>
References: <cover.1409162830.git.cristian.iorga@intel.com>
In-Reply-To: <cover.1409162830.git.cristian.iorga@intel.com>
References: <cover.1409162830.git.cristian.iorga@intel.com>
Subject: [PATCH 2/4] harfbuzz: upgrade to 0.9.35
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
X-List-Received-Date: Wed, 27 Aug 2014 18:10:19 -0000

Bug fixes and minor changes/cleanups.

Signed-off-by: Cristian Iorga <cristian.iorga@intel.com>
---
 .../harfbuzz/{harfbuzz_0.9.29.bb => harfbuzz_0.9.35.bb}               | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)
 rename meta/recipes-graphics/harfbuzz/{harfbuzz_0.9.29.bb => harfbuzz_0.9.35.bb} (88%)

diff --git a/meta/recipes-graphics/harfbuzz/harfbuzz_0.9.29.bb b/meta/recipes-graphics/harfbuzz/harfbuzz_0.9.35.bb
similarity index 88%
rename from meta/recipes-graphics/harfbuzz/harfbuzz_0.9.29.bb
rename to meta/recipes-graphics/harfbuzz/harfbuzz_0.9.35.bb
index 96a4932..2329b2f 100644
--- a/meta/recipes-graphics/harfbuzz/harfbuzz_0.9.29.bb
+++ b/meta/recipes-graphics/harfbuzz/harfbuzz_0.9.35.bb
@@ -11,8 +11,8 @@ LIC_FILES_CHKSUM = "file://COPYING;md5=e021dd6dda6ff1e6b1044002fc662b9b \
 SECTION = "libs"
 
 SRC_URI = "http://www.freedesktop.org/software/harfbuzz/release/${BP}.tar.bz2"
-SRC_URI[md5sum] = "6251eb6d57e8c4e9e855188dbbdf8b6d"
-SRC_URI[sha256sum] = "601cea38c6fa0cf362dd9042c66cf4db711c5f9390de4ca46d6d2fc3f64de390"
+SRC_URI[md5sum] = "531ee8650626ecddcd90b2a4637e31d4"
+SRC_URI[sha256sum] = "0aa1a8aba6f502321cf6fef3c9d2c73dde48389c5ed1d3615a7691944c2a06ed"
 inherit autotools pkgconfig lib_package
 
 DEPENDS = "glib-2.0 cairo freetype"
-- 
1.9.1


