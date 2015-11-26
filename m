Return-Path: <alexander.kanavin@linux.intel.com>
Received: from mga02.intel.com (mga02.intel.com [134.134.136.20])
	by mail.openembedded.org (Postfix) with ESMTP id 14B9C605BA
	for <openembedded-core@lists.openembedded.org>;
	Thu, 26 Nov 2015 14:29:19 +0000 (UTC)
Received: from orsmga001.jf.intel.com ([10.7.209.18])
	by orsmga101.jf.intel.com with ESMTP; 26 Nov 2015 06:29:21 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.20,347,1444719600"; d="scan'208";a="829574782"
Received: from kanavin-desktop.fi.intel.com ([10.237.68.161])
	by orsmga001.jf.intel.com with ESMTP; 26 Nov 2015 06:29:18 -0800
From: Alexander Kanavin <alexander.kanavin@linux.intel.com>
To: openembedded-core@lists.openembedded.org
Date: Thu, 26 Nov 2015 16:26:23 +0200
Message-Id: <e2473d128b0acaf9e71a0ced3c10df3474c10942.1448547850.git.alexander.kanavin@linux.intel.com>
X-Mailer: git-send-email 2.6.2
In-Reply-To: <cover.1448547850.git.alexander.kanavin@linux.intel.com>
References: <cover.1448547850.git.alexander.kanavin@linux.intel.com>
In-Reply-To: <cover.1448547850.git.alexander.kanavin@linux.intel.com>
References: <cover.1448547850.git.alexander.kanavin@linux.intel.com>
Subject: [PATCH 20/29] at-spi2-core: enable gobject introspection
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
X-List-Received-Date: Thu, 26 Nov 2015 14:29:19 -0000

Signed-off-by: Alexander Kanavin <alexander.kanavin@linux.intel.com>
---
 meta/recipes-support/atk/at-spi2-core_2.18.1.bb | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/meta/recipes-support/atk/at-spi2-core_2.18.1.bb b/meta/recipes-support/atk/at-spi2-core_2.18.1.bb
index 53fa1f5..77410be 100644
--- a/meta/recipes-support/atk/at-spi2-core_2.18.1.bb
+++ b/meta/recipes-support/atk/at-spi2-core_2.18.1.bb
@@ -13,11 +13,11 @@ SRC_URI[sha256sum] = "57d555be4cc64905454687bf9bb7dc1e68531bee93befa77222d94ea08
 
 DEPENDS = "dbus glib-2.0 virtual/libx11 libxi libxtst intltool-native gettext-native"
 
-inherit autotools gtk-doc pkgconfig distro_features_check
+inherit autotools gtk-doc pkgconfig distro_features_check gobject-introspection
 # depends on virtual/libx11
 REQUIRED_DISTRO_FEATURES = "x11"
 
-EXTRA_OECONF = "--disable-introspection --disable-xevie --with-dbus-daemondir=${bindir}"
+EXTRA_OECONF = "--disable-xevie --with-dbus-daemondir=${bindir}"
 
 FILES_${PN} += "${datadir}/dbus-1/services/*.service \
                 ${datadir}/dbus-1/accessibility-services/*.service"
-- 
2.6.2


