Received: from mga03.intel.com ([143.182.124.21])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <laurentiu.palcu@intel.com>) id 1TYZU7-0001WK-Ac
	for openembedded-core@lists.openembedded.org;
	Wed, 14 Nov 2012 10:42:15 +0100
Received: from azsmga001.ch.intel.com ([10.2.17.19])
	by azsmga101.ch.intel.com with ESMTP; 14 Nov 2012 01:28:20 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="4.83,249,1352102400"; d="scan'208";a="217517455"
Received: from lpalcu-linux (HELO localhost.localdomain) ([10.237.105.42])
	by azsmga001.ch.intel.com with ESMTP; 14 Nov 2012 01:28:19 -0800
From: Laurentiu Palcu <laurentiu.palcu@intel.com>
To: openembedded-core@lists.openembedded.org
Date: Wed, 14 Nov 2012 11:28:03 +0200
Message-Id: <447b6eacc134c27e0ea7614f8a6ebabbb0049b36.1352884713.git.laurentiu.palcu@intel.com>
X-Mailer: git-send-email 1.7.9.5
In-Reply-To: <cover.1352884713.git.laurentiu.palcu@intel.com>
References: <cover.1352884713.git.laurentiu.palcu@intel.com>
In-Reply-To: <cover.1352884713.git.laurentiu.palcu@intel.com>
References: <cover.1352884713.git.laurentiu.palcu@intel.com>
Subject: [PATCH v2 06/12] fontconfig: upgrade to 2.10.1
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
X-List-Received-Date: Wed, 14 Nov 2012 09:42:15 -0000

A couple of changes:
 * licence snippet in fccache.c moved down the file;
 * new files appeared in this version, added them to fontconfig package

Signed-off-by: Laurentiu Palcu <laurentiu.palcu@intel.com>
---
 .../97_fontconfig                                  |    0
 .../fix-pkgconfig.patch                            |    0
 ...native_2.9.0.bb => fontconfig-native_2.10.1.bb} |    0
 .../{fontconfig_2.9.0.bb => fontconfig_2.10.1.bb}  |    7 ++++---
 4 files changed, 4 insertions(+), 3 deletions(-)
 rename meta/recipes-graphics/fontconfig/{fontconfig-2.9.0 => fontconfig-2.10.1}/97_fontconfig (100%)
 rename meta/recipes-graphics/fontconfig/{fontconfig-2.9.0 => fontconfig-2.10.1}/fix-pkgconfig.patch (100%)
 rename meta/recipes-graphics/fontconfig/{fontconfig-native_2.9.0.bb => fontconfig-native_2.10.1.bb} (100%)
 rename meta/recipes-graphics/fontconfig/{fontconfig_2.9.0.bb => fontconfig_2.10.1.bb} (91%)

diff --git a/meta/recipes-graphics/fontconfig/fontconfig-2.9.0/97_fontconfig b/meta/recipes-graphics/fontconfig/fontconfig-2.10.1/97_fontconfig
similarity index 100%
rename from meta/recipes-graphics/fontconfig/fontconfig-2.9.0/97_fontconfig
rename to meta/recipes-graphics/fontconfig/fontconfig-2.10.1/97_fontconfig
diff --git a/meta/recipes-graphics/fontconfig/fontconfig-2.9.0/fix-pkgconfig.patch b/meta/recipes-graphics/fontconfig/fontconfig-2.10.1/fix-pkgconfig.patch
similarity index 100%
rename from meta/recipes-graphics/fontconfig/fontconfig-2.9.0/fix-pkgconfig.patch
rename to meta/recipes-graphics/fontconfig/fontconfig-2.10.1/fix-pkgconfig.patch
diff --git a/meta/recipes-graphics/fontconfig/fontconfig-native_2.9.0.bb b/meta/recipes-graphics/fontconfig/fontconfig-native_2.10.1.bb
similarity index 100%
rename from meta/recipes-graphics/fontconfig/fontconfig-native_2.9.0.bb
rename to meta/recipes-graphics/fontconfig/fontconfig-native_2.10.1.bb
diff --git a/meta/recipes-graphics/fontconfig/fontconfig_2.9.0.bb b/meta/recipes-graphics/fontconfig/fontconfig_2.10.1.bb
similarity index 91%
rename from meta/recipes-graphics/fontconfig/fontconfig_2.9.0.bb
rename to meta/recipes-graphics/fontconfig/fontconfig_2.10.1.bb
index 7f3f111..268a3cb 100644
--- a/meta/recipes-graphics/fontconfig/fontconfig_2.9.0.bb
+++ b/meta/recipes-graphics/fontconfig/fontconfig_2.10.1.bb
@@ -14,7 +14,7 @@ BUGTRACKER = "https://bugs.freedesktop.org/enter_bug.cgi?product=fontconfig"
 LICENSE = "MIT-style & MIT & PD"
 LIC_FILES_CHKSUM = "file://COPYING;md5=dc5b39c592e47a22dbec44855988d2a0 \
                     file://src/fcfreetype.c;endline=45;md5=5d9513e3196a1fbfdfa94051c09dfc84 \
-                    file://src/fccache.c;beginline=1077;endline=1092;md5=0326cfeb4a7333dd4dd25fbbc4b9f27f"
+                    file://src/fccache.c;beginline=1109;endline=1124;md5=0326cfeb4a7333dd4dd25fbbc4b9f27f"
 
 SECTION = "libs"
 
@@ -26,12 +26,13 @@ SRC_URI = "http://fontconfig.org/release/fontconfig-${PV}.tar.gz \
            file://fix-pkgconfig.patch \
            file://97_fontconfig"
 
-SRC_URI[md5sum] = "26c83855ed256b5c032baae032fadc4f"
-SRC_URI[sha256sum] = "ca7e25071cf044bdcdaf7c48845243c115b9269b4e369c6bd78a29e71f01b41a"
+SRC_URI[md5sum] = "c94e380eea42f2f23ca9537035ef1899"
+SRC_URI[sha256sum] = "c3912bf909c0057e50a67f58fc1b0ae644f1ebf532a0d97864588d9599280222"
 
 PACKAGES =+ "fontconfig-utils-dbg fontconfig-utils "
 FILES_fontconfig-utils-dbg = "${bindir}/*.dbg"
 FILES_fontconfig-utils = "${bindir}/*"
+FILES_${PN} =+ "${datadir}/xml/*"
 
 # Work around past breakage in debian.bbclass
 RPROVIDES_fontconfig-utils = "libfontconfig-utils"
-- 
1.7.9.5



