Return-Path: <jussi.kukkonen@intel.com>
Received: from mga09.intel.com (mga09.intel.com [134.134.136.24])
	by mail.openembedded.org (Postfix) with ESMTP id BCBF673D24
	for <openembedded-core@lists.openembedded.org>;
	Thu,  9 Apr 2015 12:16:49 +0000 (UTC)
Received: from fmsmga002.fm.intel.com ([10.253.24.26])
	by orsmga102.jf.intel.com with ESMTP; 09 Apr 2015 05:16:51 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.11,549,1422950400"; d="scan'208";a="706187235"
Received: from heimdall.fi.intel.com ([10.237.72.168])
	by fmsmga002.fm.intel.com with ESMTP; 09 Apr 2015 05:16:49 -0700
From: Jussi Kukkonen <jussi.kukkonen@intel.com>
To: openembedded-core@lists.openembedded.org
Date: Thu,  9 Apr 2015 15:16:24 +0300
Message-Id: <9de9456536fd7bec44bae4d96d8d4d1aeb505d42.1428577515.git.jussi.kukkonen@intel.com>
X-Mailer: git-send-email 2.1.4
In-Reply-To: <d3d9f4037e97ba885958f3d527ab8bea2f2261dd.1428577515.git.jussi.kukkonen@intel.com>
References: <d3d9f4037e97ba885958f3d527ab8bea2f2261dd.1428577515.git.jussi.kukkonen@intel.com>
In-Reply-To: <cover.1428577515.git.jussi.kukkonen@intel.com>
References: <cover.1428577515.git.jussi.kukkonen@intel.com>
Subject: [PATCH 4/7] at-spi2-core: Upgrade to 2.16.0
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
X-List-Received-Date: Thu, 09 Apr 2015 12:16:49 -0000

* Add new org.a11y.atspi.Registry D-Bus service file

Signed-off-by: Jussi Kukkonen <jussi.kukkonen@intel.com>
---
 .../atk/{at-spi2-core_2.14.1.bb => at-spi2-core_2.16.0.bb}         | 7 ++++---
 1 file changed, 4 insertions(+), 3 deletions(-)
 rename meta/recipes-support/atk/{at-spi2-core_2.14.1.bb => at-spi2-core_2.16.0.bb} (68%)

diff --git a/meta/recipes-support/atk/at-spi2-core_2.14.1.bb b/meta/recipes-support/atk/at-spi2-core_2.16.0.bb
similarity index 68%
rename from meta/recipes-support/atk/at-spi2-core_2.14.1.bb
rename to meta/recipes-support/atk/at-spi2-core_2.16.0.bb
index 1a1ce6c..49ec46f 100644
--- a/meta/recipes-support/atk/at-spi2-core_2.14.1.bb
+++ b/meta/recipes-support/atk/at-spi2-core_2.16.0.bb
@@ -6,8 +6,8 @@ MAJ_VER = "${@oe.utils.trim_version("${PV}", 2)}"
 
 SRC_URI = "${GNOME_MIRROR}/${BPN}/${MAJ_VER}/${BPN}-${PV}.tar.xz"
 
-SRC_URI[md5sum] = "a37993cc50d90465c9aeed95e2ac439a"
-SRC_URI[sha256sum] = "eef9660b14fdf0fb1f30d1be7c72d591fa7cbb87b00ca3a444425712f46ce657"
+SRC_URI[md5sum] = "be6eeea370f913b7639b609913b2cf02"
+SRC_URI[sha256sum] = "1c0b77fb8ce81abbf1d80c0afee9858b3f9229f673b7881995fe0fc16b1a74d0"
 
 DEPENDS = "dbus glib-2.0 virtual/libx11 libxi libxtst intltool-native"
 
@@ -17,4 +17,5 @@ REQUIRED_DISTRO_FEATURES = "x11"
 
 EXTRA_OECONF = "--disable-introspection --disable-xevie --with-dbus-daemondir=${bindir}"
 
-FILES_${PN} += "${datadir}/dbus-1/services/*.service"
+FILES_${PN} += "${datadir}/dbus-1/services/*.service \
+                ${datadir}/dbus-1/accessibility-services/*.service"
-- 
2.1.4


