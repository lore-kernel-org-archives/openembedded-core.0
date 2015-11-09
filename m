Return-Path: <alexander.kanavin@linux.intel.com>
Received: from mga11.intel.com (mga11.intel.com [192.55.52.93])
	by mail.openembedded.org (Postfix) with ESMTP id 97B9D77198
	for <openembedded-core@lists.openembedded.org>;
	Mon,  9 Nov 2015 14:50:15 +0000 (UTC)
Received: from fmsmga003.fm.intel.com ([10.253.24.29])
	by fmsmga102.fm.intel.com with ESMTP; 09 Nov 2015 06:50:15 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.20,266,1444719600"; d="scan'208";a="596917671"
Received: from kanavin-desktop.fi.intel.com ([10.237.68.161])
	by FMSMGA003.fm.intel.com with ESMTP; 09 Nov 2015 06:50:15 -0800
From: Alexander Kanavin <alexander.kanavin@linux.intel.com>
To: openembedded-core@lists.openembedded.org
Date: Mon,  9 Nov 2015 16:50:43 +0200
Message-Id: <2fc1d4ef147a33878e36ac3ca261b0a0dd5858cd.1447080392.git.alexander.kanavin@linux.intel.com>
X-Mailer: git-send-email 2.1.4
In-Reply-To: <cover.1447080392.git.alexander.kanavin@linux.intel.com>
References: <cover.1447080392.git.alexander.kanavin@linux.intel.com>
In-Reply-To: <cover.1447080392.git.alexander.kanavin@linux.intel.com>
References: <cover.1447080392.git.alexander.kanavin@linux.intel.com>
Subject: [PATCH 21/29] at-spi2-core: enable gobject introspection
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
X-List-Received-Date: Mon, 09 Nov 2015 14:50:15 -0000

Signed-off-by: Alexander Kanavin <alexander.kanavin@linux.intel.com>
---
 meta/recipes-support/atk/at-spi2-core_2.16.0.bb | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/meta/recipes-support/atk/at-spi2-core_2.16.0.bb b/meta/recipes-support/atk/at-spi2-core_2.16.0.bb
index 7c12b54..2e9ce79 100644
--- a/meta/recipes-support/atk/at-spi2-core_2.16.0.bb
+++ b/meta/recipes-support/atk/at-spi2-core_2.16.0.bb
@@ -13,11 +13,11 @@ SRC_URI[sha256sum] = "1c0b77fb8ce81abbf1d80c0afee9858b3f9229f673b7881995fe0fc16b
 
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
2.1.4


