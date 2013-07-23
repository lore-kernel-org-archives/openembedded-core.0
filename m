Return-Path: <ddalex@intel.com>
Received: from mga14.intel.com (mga14.intel.com [143.182.124.37])
	by mail.openembedded.org (Postfix) with ESMTP id 2C6266A9C4
	for <openembedded-core@lists.openembedded.org>;
	Tue, 23 Jul 2013 11:01:22 +0000 (UTC)
Received: from fmsmga001.fm.intel.com ([10.253.24.23])
	by azsmga102.ch.intel.com with ESMTP; 23 Jul 2013 04:01:22 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="4.89,726,1367996400"; d="scan'208";a="369610291"
Received: from adamian-desktop.isw.intel.com (HELO
	adamian-desktop.rb.intel.com) ([10.237.224.34])
	by fmsmga001.fm.intel.com with ESMTP; 23 Jul 2013 04:01:21 -0700
Received: by adamian-desktop.rb.intel.com (Postfix, from userid 1000)
	id BF757560A52; Tue, 23 Jul 2013 12:01:20 +0100 (BST)
From: Alex DAMIAN <alexandru.damian@intel.com>
To: ross.burton@intel.com, sgw@linux.intel.com,
	openembedded-core@lists.openembedded.org
Date: Tue, 23 Jul 2013 12:01:19 +0100
Message-Id: <1374577279-21342-1-git-send-email-alexandru.damian@intel.com>
X-Mailer: git-send-email 1.8.1.2
Cc: Alexandru DAMIAN <alexandru.damian@intel.com>
Subject: [PATCH] weston: add harfbuzz dependency
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
X-List-Received-Date: Tue, 23 Jul 2013 11:01:22 -0000

From: Alexandru DAMIAN <alexandru.damian@intel.com>

Weston 1.1.0 has a build time dependency on libharfbuzz,
so we add it.

Signed-off-by: Alexandru DAMIAN <alexandru.damian@intel.com>
---
 meta/recipes-graphics/wayland/weston_1.1.0.bb | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/meta/recipes-graphics/wayland/weston_1.1.0.bb b/meta/recipes-graphics/wayland/weston_1.1.0.bb
index 7327b98..e324134 100644
--- a/meta/recipes-graphics/wayland/weston_1.1.0.bb
+++ b/meta/recipes-graphics/wayland/weston_1.1.0.bb
@@ -18,7 +18,7 @@ SRC_URI[sha256sum] = "e7715d2c731f77a729c994a599ffdaebac1307b2dd9336136706869fa5
 inherit autotools pkgconfig useradd
 
 DEPENDS = "libxkbcommon gdk-pixbuf pixman cairo glib-2.0 jpeg"
-DEPENDS += "wayland mesa virtual/egl"
+DEPENDS += "wayland mesa virtual/egl harfbuzz"
 
 EXTRA_OECONF = "--disable-android-compositor \
                 --enable-setuid-install \
-- 
1.8.1.2


