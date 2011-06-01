Received: from mga03.intel.com ([143.182.124.21])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <dexuan.cui@intel.com>) id 1QRlNT-0007Cp-Tg
	for openembedded-core@lists.openembedded.org;
	Wed, 01 Jun 2011 15:22:28 +0200
Received: from azsmga001.ch.intel.com ([10.2.17.19])
	by azsmga101.ch.intel.com with ESMTP; 01 Jun 2011 06:19:19 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="4.65,303,1304319600"; 
   d="scan'208";a="5196295"
Received: from dcui-desktop.sh.intel.com (HELO localhost) ([10.239.13.51])
	by azsmga001.ch.intel.com with ESMTP; 01 Jun 2011 06:19:18 -0700
From: Dexuan Cui <dexuan.cui@intel.com>
To: openembedded-core@lists.openembedded.org
Date: Wed,  1 Jun 2011 21:18:40 +0800
Message-Id: <bb55c3bb232b4749923fbbde285bbefa65d4c79b.1306931849.git.dexuan.cui@intel.com>
X-Mailer: git-send-email 1.7.2
In-Reply-To: <cover.1306931844.git.dexuan.cui@intel.com>
References: <cover.1306931844.git.dexuan.cui@intel.com>
In-Reply-To: <cover.1306931844.git.dexuan.cui@intel.com>
References: <cover.1306931844.git.dexuan.cui@intel.com>
Subject: [RFC v1 PATCH 09/16] dpkg: should depend on perl-native-runtime rather than perl-native
X-BeenThere: openembedded-core@lists.openembedded.org
X-Mailman-Version: 2.1.11
Precedence: list
Reply-To: Patches and discussions about the oe-core layer
	<openembedded-core@lists.openembedded.org>
List-Id: Patches and discussions about the oe-core layer
	<openembedded-core.lists.openembedded.org>
List-Unsubscribe: <http://lists.linuxtogo.org/cgi-bin/mailman/options/openembedded-core>,
	<mailto:openembedded-core-request@lists.openembedded.org?subject=unsubscribe>
List-Archive: <http://lists.linuxtogo.org/pipermail/openembedded-core>
List-Post: <mailto:openembedded-core@lists.openembedded.org>
List-Help: <mailto:openembedded-core-request@lists.openembedded.org?subject=help>
List-Subscribe: <http://lists.linuxtogo.org/cgi-bin/mailman/listinfo/openembedded-core>,
	<mailto:openembedded-core-request@lists.openembedded.org?subject=subscribe>
X-List-Received-Date: Wed, 01 Jun 2011 13:22:28 -0000

Signed-off-by: Dexuan Cui <dexuan.cui@intel.com>
---
 meta/recipes-devtools/dpkg/dpkg.inc         |    2 +-
 meta/recipes-devtools/dpkg/dpkg_1.15.8.7.bb |    2 +-
 2 files changed, 2 insertions(+), 2 deletions(-)

diff --git a/meta/recipes-devtools/dpkg/dpkg.inc b/meta/recipes-devtools/dpkg/dpkg.inc
index 0284442..c8ff182 100644
--- a/meta/recipes-devtools/dpkg/dpkg.inc
+++ b/meta/recipes-devtools/dpkg/dpkg.inc
@@ -6,7 +6,7 @@ SRC_URI = "${DEBIAN_MIRROR}/main/d/dpkg/dpkg_${PV}.tar.bz2 \
            file://ignore_extra_fields.patch;patch=1"
 
 DEPENDS = "zlib bzip2 perl"
-DEPENDS_virtclass-native = "bzip2-native zlib-native virtual/update-alternatives-native gettext-native perl-native"
+DEPENDS_virtclass-native = "bzip2-native zlib-native virtual/update-alternatives-native gettext-native perl-native-runtime"
 RDEPENDS_${PN} = "${VIRTUAL-RUNTIME_update-alternatives}"
 RDEPENDS_${PN}_virtclass-native = ""
 
diff --git a/meta/recipes-devtools/dpkg/dpkg_1.15.8.7.bb b/meta/recipes-devtools/dpkg/dpkg_1.15.8.7.bb
index 8bb441f..22edab8 100644
--- a/meta/recipes-devtools/dpkg/dpkg_1.15.8.7.bb
+++ b/meta/recipes-devtools/dpkg/dpkg_1.15.8.7.bb
@@ -8,7 +8,7 @@ SRC_URI += "file://noman.patch;patch=1 \
 SRC_URI[md5sum] = "d1731d4147c1ea3b537a4d094519a6dc"
 SRC_URI[sha256sum] = "1ec1376471b04717a4497e5d7a27cd545248c92116898ce0c53ced8ea94267b5"
 
-PR = "r2"
+PR = "r3"
 
 EXTRA_OECONF = "--without-static-progs \
 		--without-dselect \
-- 
1.7.2



