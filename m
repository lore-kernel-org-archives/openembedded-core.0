Return-Path: <cristian.iorga@intel.com>
Received: from mga02.intel.com (mga02.intel.com [134.134.136.20])
	by mail.openembedded.org (Postfix) with ESMTP id E65B56C72D
	for <openembedded-core@lists.openembedded.org>;
	Wed, 12 Feb 2014 16:39:38 +0000 (UTC)
Received: from orsmga002.jf.intel.com ([10.7.209.21])
	by orsmga101.jf.intel.com with ESMTP; 12 Feb 2014 08:39:40 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="4.95,833,1384329600"; d="scan'208";a="482281836"
Received: from sentry.rb.intel.com ([10.237.105.54])
	by orsmga002.jf.intel.com with ESMTP; 12 Feb 2014 08:39:39 -0800
From: Cristian Iorga <cristian.iorga@intel.com>
To: openembedded-core@lists.openembedded.org
Date: Wed, 12 Feb 2014 18:42:31 +0200
Message-Id: <9a815b7107d3c8e195816e5f422a8c4c16c68f04.1392223206.git.cristian.iorga@intel.com>
X-Mailer: git-send-email 1.8.3.2
In-Reply-To: <cover.1392223206.git.cristian.iorga@intel.com>
References: <cover.1392223206.git.cristian.iorga@intel.com>
In-Reply-To: <cover.1392223206.git.cristian.iorga@intel.com>
References: <cover.1392223206.git.cristian.iorga@intel.com>
Subject: [PATCH v2 2/3] harfbuzz: upgrade to 0.9.26
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
X-List-Received-Date: Wed, 12 Feb 2014 16:39:39 -0000

switched to ${BP} variable.

Signed-off-by: Cristian Iorga <cristian.iorga@intel.com>
---
 .../harfbuzz/{harfbuzz_0.9.25.bb => harfbuzz_0.9.26.bb}             | 6 +++---
 1 file changed, 3 insertions(+), 3 deletions(-)
 rename meta/recipes-graphics/harfbuzz/{harfbuzz_0.9.25.bb => harfbuzz_0.9.26.bb} (86%)

diff --git a/meta/recipes-graphics/harfbuzz/harfbuzz_0.9.25.bb b/meta/recipes-graphics/harfbuzz/harfbuzz_0.9.26.bb
similarity index 86%
rename from meta/recipes-graphics/harfbuzz/harfbuzz_0.9.25.bb
rename to meta/recipes-graphics/harfbuzz/harfbuzz_0.9.26.bb
index ba637bc..61d54c6 100644
--- a/meta/recipes-graphics/harfbuzz/harfbuzz_0.9.25.bb
+++ b/meta/recipes-graphics/harfbuzz/harfbuzz_0.9.26.bb
@@ -10,11 +10,11 @@ LIC_FILES_CHKSUM = "file://COPYING;md5=e021dd6dda6ff1e6b1044002fc662b9b \
 
 SECTION = "libs"
 
-SRC_URI = "http://www.freedesktop.org/software/harfbuzz/release/harfbuzz-${PV}.tar.bz2 \
+SRC_URI = "http://www.freedesktop.org/software/harfbuzz/release/${BP}.tar.bz2 \
 "
 
-SRC_URI[md5sum] = "491b631239f51dcd4f7934775306c4e7"
-SRC_URI[sha256sum] = "dc6e5997a569526cd28147a80a0f65466e87ae617753b38704a60184bc6d6bee"
+SRC_URI[md5sum] = "a2b6cbd437f22dd5dc93d377696c9204"
+SRC_URI[sha256sum] = "5ded7dc3d15fb5c9230d7a224b9256b67b35fde30193b4c3a4c3f6b13110e257"
 
 inherit autotools pkgconfig lib_package
 
-- 
1.8.3.2


