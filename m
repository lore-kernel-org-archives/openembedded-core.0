Return-Path: <cristian.iorga@intel.com>
Received: from mga01.intel.com (mga01.intel.com [192.55.52.88])
	by mail.openembedded.org (Postfix) with ESMTP id 84CFF732A1
	for <openembedded-core@lists.openembedded.org>;
	Wed, 11 Feb 2015 10:10:29 +0000 (UTC)
Received: from orsmga003.jf.intel.com ([10.7.209.27])
	by fmsmga101.fm.intel.com with ESMTP; 11 Feb 2015 02:10:29 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.09,557,1418112000"; d="scan'208";a="525866922"
Received: from sentry.rb.intel.com ([10.237.105.37])
	by orsmga003.jf.intel.com with ESMTP; 11 Feb 2015 02:02:21 -0800
From: Cristian Iorga <cristian.iorga@intel.com>
To: openembedded-core@lists.openembedded.org
Date: Wed, 11 Feb 2015 12:10:21 +0200
Message-Id: <7286ab2c8b1d2e7806bd1441c63efd55ea3556d9.1423649391.git.cristian.iorga@intel.com>
X-Mailer: git-send-email 2.1.0
In-Reply-To: <cover.1423649391.git.cristian.iorga@intel.com>
References: <cover.1423649391.git.cristian.iorga@intel.com>
In-Reply-To: <cover.1423649391.git.cristian.iorga@intel.com>
References: <cover.1423649391.git.cristian.iorga@intel.com>
Subject: [PATCH 1/2] harfbuzz: upgrade to 0.9.38
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
X-List-Received-Date: Wed, 11 Feb 2015 10:10:36 -0000

Signed-off-by: Cristian Iorga <cristian.iorga@intel.com>
---
 .../harfbuzz/{harfbuzz_0.9.37.bb => harfbuzz_0.9.38.bb}               | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)
 rename meta/recipes-graphics/harfbuzz/{harfbuzz_0.9.37.bb => harfbuzz_0.9.38.bb} (88%)

diff --git a/meta/recipes-graphics/harfbuzz/harfbuzz_0.9.37.bb b/meta/recipes-graphics/harfbuzz/harfbuzz_0.9.38.bb
similarity index 88%
rename from meta/recipes-graphics/harfbuzz/harfbuzz_0.9.37.bb
rename to meta/recipes-graphics/harfbuzz/harfbuzz_0.9.38.bb
index 333cf2e..90794c7 100644
--- a/meta/recipes-graphics/harfbuzz/harfbuzz_0.9.37.bb
+++ b/meta/recipes-graphics/harfbuzz/harfbuzz_0.9.38.bb
@@ -11,8 +11,8 @@ LIC_FILES_CHKSUM = "file://COPYING;md5=e021dd6dda6ff1e6b1044002fc662b9b \
 SECTION = "libs"
 
 SRC_URI = "http://www.freedesktop.org/software/harfbuzz/release/${BP}.tar.bz2"
-SRC_URI[md5sum] = "bfe733250e34629a188d82e3b971bc1e"
-SRC_URI[sha256sum] = "255f3b3842dead16863d1d0c216643d97b80bfa087aaa8fc5926da24ac120207"
+SRC_URI[md5sum] = "8839e574be8089c0de83768798bf7916"
+SRC_URI[sha256sum] = "6736f383b4edfcaaeb6f3292302ca382d617d8c79948bb2dd2e8f86cdccfd514"
 
 inherit autotools pkgconfig lib_package
 
-- 
2.1.0


