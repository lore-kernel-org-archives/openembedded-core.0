Return-Path: <ddalex@intel.com>
Received: from mga09.intel.com (mga09.intel.com [134.134.136.24])
	by mail.openembedded.org (Postfix) with ESMTP id B1E1960629
	for <openembedded-core@lists.openembedded.org>;
	Wed, 24 Jul 2013 08:59:30 +0000 (UTC)
Received: from orsmga001.jf.intel.com ([10.7.209.18])
	by orsmga102.jf.intel.com with ESMTP; 24 Jul 2013 01:56:56 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="4.89,734,1367996400"; d="scan'208";a="350651585"
Received: from adamian-desktop.isw.intel.com (HELO
	adamian-desktop.rb.intel.com) ([10.237.224.34])
	by orsmga001.jf.intel.com with ESMTP; 24 Jul 2013 01:59:30 -0700
Received: by adamian-desktop.rb.intel.com (Postfix, from userid 1000)
	id D69475604BB; Wed, 24 Jul 2013 09:59:29 +0100 (BST)
From: Alex DAMIAN <alexandru.damian@intel.com>
To: ross.burton@intel.com, sgw@linux.intel.com,
	openembedded-core@lists.openembedded.org
Date: Wed, 24 Jul 2013 09:59:28 +0100
Message-Id: <1374656368-12517-1-git-send-email-alexandru.damian@intel.com>
X-Mailer: git-send-email 1.8.1.2
In-Reply-To: <1374577279-21342-1-git-send-email-alexandru.damian@intel.com>
References: <1374577279-21342-1-git-send-email-alexandru.damian@intel.com>
Cc: Alexandru DAMIAN <alexandru.damian@intel.com>
Subject: [PATCH v2] weston: add harfbuzz dependency
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
X-List-Received-Date: Wed, 24 Jul 2013 08:59:31 -0000

From: Alexandru DAMIAN <alexandru.damian@intel.com>

Weston 1.1.0 has a build time dependency on pango,
so we add it.

Signed-off-by: Alexandru DAMIAN <alexandru.damian@intel.com>
---
 meta/recipes-graphics/wayland/weston_1.1.0.bb | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/meta/recipes-graphics/wayland/weston_1.1.0.bb b/meta/recipes-graphics/wayland/weston_1.1.0.bb
index 7327b98..c7c64ad 100644
--- a/meta/recipes-graphics/wayland/weston_1.1.0.bb
+++ b/meta/recipes-graphics/wayland/weston_1.1.0.bb
@@ -18,7 +18,7 @@ SRC_URI[sha256sum] = "e7715d2c731f77a729c994a599ffdaebac1307b2dd9336136706869fa5
 inherit autotools pkgconfig useradd
 
 DEPENDS = "libxkbcommon gdk-pixbuf pixman cairo glib-2.0 jpeg"
-DEPENDS += "wayland mesa virtual/egl"
+DEPENDS += "wayland mesa virtual/egl pango"
 
 EXTRA_OECONF = "--disable-android-compositor \
                 --enable-setuid-install \
-- 
1.8.1.2


