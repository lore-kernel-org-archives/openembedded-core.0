Received: from mga14.intel.com ([143.182.124.37])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <cristian.iorga@intel.com>) id 1TyPZk-0006Nr-25
	for openembedded-core@lists.openembedded.org;
	Thu, 24 Jan 2013 17:22:57 +0100
Received: from azsmga002.ch.intel.com ([10.2.17.35])
	by azsmga102.ch.intel.com with ESMTP; 24 Jan 2013 08:07:13 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="4.84,530,1355126400"; d="scan'208";a="194742760"
Received: from sentry (HELO localhost.localdomain) ([10.237.105.30])
	by AZSMGA002.ch.intel.com with ESMTP; 24 Jan 2013 08:07:11 -0800
From: Cristian Iorga <cristian.iorga@intel.com>
To: openembedded-core@lists.openembedded.org
Date: Thu, 24 Jan 2013 18:07:24 +0200
Message-Id: <1359043644-11456-1-git-send-email-cristian.iorga@intel.com>
X-Mailer: git-send-email 1.7.10.4
Subject: [PATCH] wpa-supplicant: upgrade to 2.0
X-BeenThere: openembedded-core@lists.openembedded.org
X-Mailman-Version: 2.1.11
Precedence: list
List-Id: Patches and discussions about the oe-core layer
	<openembedded-core.lists.openembedded.org>
List-Unsubscribe: <http://lists.linuxtogo.org/cgi-bin/mailman/options/openembedded-core>,
	<mailto:openembedded-core-request@lists.openembedded.org?subject=unsubscribe>
List-Archive: <http://lists.linuxtogo.org/pipermail/openembedded-core>
List-Post: <mailto:openembedded-core@lists.openembedded.org>
List-Help: <mailto:openembedded-core-request@lists.openembedded.org?subject=help>
List-Subscribe: <http://lists.linuxtogo.org/cgi-bin/mailman/listinfo/openembedded-core>,
	<mailto:openembedded-core-request@lists.openembedded.org?subject=subscribe>
X-List-Received-Date: Thu, 24 Jan 2013 16:22:59 -0000
X-List-Received-Date: Thu, 24 Jan 2013 16:22:59 -0000

From: Constantin Musca <constantinx.musca@intel.com>

- as of February 11, 2012, the project has chosen to use only
the BSD license option for future distribution
- wpa-supplicant-1.0 dir was not version specific,
as such it is generic now

Signed-off-by: Constantin Musca <constantinx.musca@intel.com>
Signed-off-by: Cristian Iorga <cristian.iorga@intel.com>
---
 .../{wpa-supplicant-1.0.inc => wpa-supplicant-2.0.inc}         |    8 ++++----
 .../{wpa-supplicant-1.0 => wpa-supplicant}/99_wpa_supplicant   |    0
 .../{wpa-supplicant-1.0 => wpa-supplicant}/defconfig-gnutls    |    0
 .../{wpa-supplicant-1.0 => wpa-supplicant}/wpa-supplicant.sh   |    0
 .../{wpa-supplicant-1.0 => wpa-supplicant}/wpa_supplicant.conf |    0
 .../wpa_supplicant.conf-sane                                   |    0
 meta/recipes-connectivity/wpa-supplicant/wpa-supplicant_1.0.bb |    6 ------
 meta/recipes-connectivity/wpa-supplicant/wpa-supplicant_2.0.bb |    6 ++++++
 8 files changed, 10 insertions(+), 10 deletions(-)
 rename meta/recipes-connectivity/wpa-supplicant/{wpa-supplicant-1.0.inc => wpa-supplicant-2.0.inc} (92%)
 rename meta/recipes-connectivity/wpa-supplicant/{wpa-supplicant-1.0 => wpa-supplicant}/99_wpa_supplicant (100%)
 rename meta/recipes-connectivity/wpa-supplicant/{wpa-supplicant-1.0 => wpa-supplicant}/defconfig-gnutls (100%)
 rename meta/recipes-connectivity/wpa-supplicant/{wpa-supplicant-1.0 => wpa-supplicant}/wpa-supplicant.sh (100%)
 rename meta/recipes-connectivity/wpa-supplicant/{wpa-supplicant-1.0 => wpa-supplicant}/wpa_supplicant.conf (100%)
 rename meta/recipes-connectivity/wpa-supplicant/{wpa-supplicant-1.0 => wpa-supplicant}/wpa_supplicant.conf-sane (100%)
 delete mode 100644 meta/recipes-connectivity/wpa-supplicant/wpa-supplicant_1.0.bb
 create mode 100644 meta/recipes-connectivity/wpa-supplicant/wpa-supplicant_2.0.bb

diff --git a/meta/recipes-connectivity/wpa-supplicant/wpa-supplicant-1.0.inc b/meta/recipes-connectivity/wpa-supplicant/wpa-supplicant-2.0.inc
similarity index 92%
rename from meta/recipes-connectivity/wpa-supplicant/wpa-supplicant-1.0.inc
rename to meta/recipes-connectivity/wpa-supplicant/wpa-supplicant-2.0.inc
index 0645193..89910a0 100644
--- a/meta/recipes-connectivity/wpa-supplicant/wpa-supplicant-1.0.inc
+++ b/meta/recipes-connectivity/wpa-supplicant/wpa-supplicant-2.0.inc
@@ -2,10 +2,10 @@ DESCRIPTION = "A Client for Wi-Fi Protected Access (WPA)."
 HOMEPAGE = "http://hostap.epitest.fi/wpa_supplicant/"
 BUGTRACKER = "http://hostap.epitest.fi/bugz/"
 SECTION = "network"
-LICENSE = "GPLv2 | BSD"
-LIC_FILES_CHKSUM = "file://../COPYING;md5=c54ce9345727175ff66d17b67ff51f58 \
-                    file://../README;md5=9bee93996fecdb70f807baceb29d84b9 \
-                    file://wpa_supplicant.c;beginline=1;endline=17;md5=372fb65dc23b228aec4e40e64de3e467"
+LICENSE = "BSD"
+LIC_FILES_CHKSUM = "file://../COPYING;md5=ab87f20cd7e8c0d0a6539b34d3791d0e \
+                    file://../README;md5=5cb758942d25f6f61fd4ac388fd446fa \
+                    file://wpa_supplicant.c;beginline=1;endline=12;md5=cba4fa09fa364da845ca546f21008909"
 DEPENDS = "gnutls dbus libnl"
 RRECOMMENDS_${PN} = "wpa-supplicant-passphrase wpa-supplicant-cli"
 
diff --git a/meta/recipes-connectivity/wpa-supplicant/wpa-supplicant-1.0/99_wpa_supplicant b/meta/recipes-connectivity/wpa-supplicant/wpa-supplicant/99_wpa_supplicant
similarity index 100%
rename from meta/recipes-connectivity/wpa-supplicant/wpa-supplicant-1.0/99_wpa_supplicant
rename to meta/recipes-connectivity/wpa-supplicant/wpa-supplicant/99_wpa_supplicant
diff --git a/meta/recipes-connectivity/wpa-supplicant/wpa-supplicant-1.0/defconfig-gnutls b/meta/recipes-connectivity/wpa-supplicant/wpa-supplicant/defconfig-gnutls
similarity index 100%
rename from meta/recipes-connectivity/wpa-supplicant/wpa-supplicant-1.0/defconfig-gnutls
rename to meta/recipes-connectivity/wpa-supplicant/wpa-supplicant/defconfig-gnutls
diff --git a/meta/recipes-connectivity/wpa-supplicant/wpa-supplicant-1.0/wpa-supplicant.sh b/meta/recipes-connectivity/wpa-supplicant/wpa-supplicant/wpa-supplicant.sh
similarity index 100%
rename from meta/recipes-connectivity/wpa-supplicant/wpa-supplicant-1.0/wpa-supplicant.sh
rename to meta/recipes-connectivity/wpa-supplicant/wpa-supplicant/wpa-supplicant.sh
diff --git a/meta/recipes-connectivity/wpa-supplicant/wpa-supplicant-1.0/wpa_supplicant.conf b/meta/recipes-connectivity/wpa-supplicant/wpa-supplicant/wpa_supplicant.conf
similarity index 100%
rename from meta/recipes-connectivity/wpa-supplicant/wpa-supplicant-1.0/wpa_supplicant.conf
rename to meta/recipes-connectivity/wpa-supplicant/wpa-supplicant/wpa_supplicant.conf
diff --git a/meta/recipes-connectivity/wpa-supplicant/wpa-supplicant-1.0/wpa_supplicant.conf-sane b/meta/recipes-connectivity/wpa-supplicant/wpa-supplicant/wpa_supplicant.conf-sane
similarity index 100%
rename from meta/recipes-connectivity/wpa-supplicant/wpa-supplicant-1.0/wpa_supplicant.conf-sane
rename to meta/recipes-connectivity/wpa-supplicant/wpa-supplicant/wpa_supplicant.conf-sane
diff --git a/meta/recipes-connectivity/wpa-supplicant/wpa-supplicant_1.0.bb b/meta/recipes-connectivity/wpa-supplicant/wpa-supplicant_1.0.bb
deleted file mode 100644
index 1150075..0000000
--- a/meta/recipes-connectivity/wpa-supplicant/wpa-supplicant_1.0.bb
+++ /dev/null
@@ -1,6 +0,0 @@
-require wpa-supplicant-1.0.inc
-
-PR = "r3"
-
-SRC_URI[md5sum] = "8650f6aa23646ef634402552d0669640"
-SRC_URI[sha256sum] = "91d41d473a5aafa2e25dd6577ebda975c4d4a3188850a53e31feaf7c04482b9c"
diff --git a/meta/recipes-connectivity/wpa-supplicant/wpa-supplicant_2.0.bb b/meta/recipes-connectivity/wpa-supplicant/wpa-supplicant_2.0.bb
new file mode 100644
index 0000000..22e42dd
--- /dev/null
+++ b/meta/recipes-connectivity/wpa-supplicant/wpa-supplicant_2.0.bb
@@ -0,0 +1,6 @@
+require wpa-supplicant-2.0.inc
+
+PR = "r0"
+
+SRC_URI[md5sum] = "3be2ebfdcced52e00eda0afe2889839d"
+SRC_URI[sha256sum] = "2c115609fbb5223d51381084a5c944455a8afcda81d584173ff55ba233379e09"
-- 
1.7.10.4



