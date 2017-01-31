Return-Path: <markus.lehtonen@linux.intel.com>
Received: from mga06.intel.com (mga06.intel.com [134.134.136.31])
	by mail.openembedded.org (Postfix) with ESMTP id 3C09871DCF
	for <openembedded-core@lists.openembedded.org>;
	Tue, 31 Jan 2017 13:23:36 +0000 (UTC)
Received: from orsmga002.jf.intel.com ([10.7.209.21])
	by orsmga104.jf.intel.com with ESMTP; 31 Jan 2017 05:23:37 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.33,315,1477983600"; d="scan'208";a="37757814"
Received: from marquiz.fi.intel.com ([10.237.72.155])
	by orsmga002.jf.intel.com with ESMTP; 31 Jan 2017 05:23:35 -0800
From: Markus Lehtonen <markus.lehtonen@linux.intel.com>
To: openembedded-core@lists.openembedded.org
Date: Tue, 31 Jan 2017 15:23:30 +0200
Message-Id: <20170131132330.4422-4-markus.lehtonen@linux.intel.com>
X-Mailer: git-send-email 2.10.2
In-Reply-To: <20170131132330.4422-1-markus.lehtonen@linux.intel.com>
References: <20170131132330.4422-1-markus.lehtonen@linux.intel.com>
Subject: [PATCH 3/3] at-spi2-atk: depend on glib-2.0-native
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
X-List-Received-Date: Tue, 31 Jan 2017 13:23:36 -0000

Missing dependency revealed by recipe specific sysroots. If the host
system does not have glib-compile-schemas installed have (via
libglib2.0-dev, glib2, glib2-tools or similar) do_configure would fail
with:
  configure: error: glib-compile-schemas not found.

Signed-off-by: Markus Lehtonen <markus.lehtonen@linux.intel.com>
---
 meta/recipes-support/atk/at-spi2-atk_2.22.0.bb | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/meta/recipes-support/atk/at-spi2-atk_2.22.0.bb b/meta/recipes-support/atk/at-spi2-atk_2.22.0.bb
index 80ba642..58edb6e 100644
--- a/meta/recipes-support/atk/at-spi2-atk_2.22.0.bb
+++ b/meta/recipes-support/atk/at-spi2-atk_2.22.0.bb
@@ -8,7 +8,7 @@ SRC_URI = "${GNOME_MIRROR}/${BPN}/${MAJ_VER}/${BPN}-${PV}.tar.xz"
 SRC_URI[md5sum] = "aa62aed21b8e03dc44ab81ae49d893ca"
 SRC_URI[sha256sum] = "e8bdedbeb873eb229eb08c88e11d07713ec25ae175251648ad1a9da6c21113c1"
 
-DEPENDS = "dbus glib-2.0 atk at-spi2-core"
+DEPENDS = "dbus glib-2.0 glib-2.0-native atk at-spi2-core"
 
 inherit autotools pkgconfig distro_features_check upstream-version-is-even
 
-- 
2.10.2


