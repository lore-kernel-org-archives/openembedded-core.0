Return-Path: <sgw@linux.intel.com>
Received: from mga03.intel.com (mga03.intel.com [134.134.136.65])
	by mail.openembedded.org (Postfix) with ESMTP id 9102B7731A
	for <openembedded-core@lists.openembedded.org>;
	Mon, 30 Jan 2017 16:24:36 +0000 (UTC)
Received: from orsmga003.jf.intel.com ([10.7.209.27])
	by orsmga103.jf.intel.com with ESMTP; 30 Jan 2017 08:24:36 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.33,312,1477983600"; d="scan'208";a="928219064"
Received: from swold-mobl2.amr.corp.intel.com ([10.254.185.161])
	by orsmga003.jf.intel.com with ESMTP; 30 Jan 2017 08:24:16 -0800
From: Saul Wold <sgw@linux.intel.com>
To: openembedded-core@lists.openembedded.org,
	richard.purdie@linuxfoundation.org
Date: Mon, 30 Jan 2017 08:24:15 -0800
Message-Id: <1485793455-11055-1-git-send-email-sgw@linux.intel.com>
X-Mailer: git-send-email 2.7.4
Subject: [PATCH] at-spi2-atk: Add glib-2.0-native dependency
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
X-List-Received-Date: Mon, 30 Jan 2017 16:24:36 -0000

This package needs the glib-compile-schemas native binary, which may have been
provided by host tools previously. The Recipe-Specific Sysroots might have also
uncovered this dependency.

Signed-off-by: Saul Wold <sgw@linux.intel.com>
---
 meta/recipes-support/atk/at-spi2-atk_2.22.0.bb | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/meta/recipes-support/atk/at-spi2-atk_2.22.0.bb b/meta/recipes-support/atk/at-spi2-atk_2.22.0.bb
index 80ba642..78798c1 100644
--- a/meta/recipes-support/atk/at-spi2-atk_2.22.0.bb
+++ b/meta/recipes-support/atk/at-spi2-atk_2.22.0.bb
@@ -8,7 +8,7 @@ SRC_URI = "${GNOME_MIRROR}/${BPN}/${MAJ_VER}/${BPN}-${PV}.tar.xz"
 SRC_URI[md5sum] = "aa62aed21b8e03dc44ab81ae49d893ca"
 SRC_URI[sha256sum] = "e8bdedbeb873eb229eb08c88e11d07713ec25ae175251648ad1a9da6c21113c1"
 
-DEPENDS = "dbus glib-2.0 atk at-spi2-core"
+DEPENDS = "dbus glib-2.0 atk at-spi2-core glib-2.0-native"
 
 inherit autotools pkgconfig distro_features_check upstream-version-is-even
 
-- 
2.7.4


