Received: from mga01.intel.com ([192.55.52.88])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <dexuan.cui@intel.com>) id 1R0vTR-0004hO-4d
	for openembedded-core@lists.openembedded.org;
	Tue, 06 Sep 2011 15:13:57 +0200
Received: from fmsmga001.fm.intel.com ([10.253.24.23])
	by fmsmga101.fm.intel.com with ESMTP; 06 Sep 2011 06:08:54 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="4.68,338,1312182000"; d="scan'208";a="48488287"
Received: from dcui-desktop.sh.intel.com (HELO localhost) ([10.239.36.112])
	by fmsmga001.fm.intel.com with ESMTP; 06 Sep 2011 06:08:38 -0700
From: Dexuan Cui <dexuan.cui@intel.com>
To: openembedded-core@lists.openembedded.org
Date: Tue,  6 Sep 2011 21:08:38 +0800
Message-Id: <8562fb438a7535e26038017bfd25b40418a296b8.1315313790.git.dexuan.cui@intel.com>
X-Mailer: git-send-email 1.7.6
In-Reply-To: <cover.1315313790.git.dexuan.cui@intel.com>
References: <cover.1315313790.git.dexuan.cui@intel.com>
In-Reply-To: <cover.1315313790.git.dexuan.cui@intel.com>
References: <cover.1315313790.git.dexuan.cui@intel.com>
Subject: [PATCH 4/5] opkg: it should Rdepend on update-alternatives-cworth
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
X-List-Received-Date: Tue, 06 Sep 2011 13:13:58 -0000

VIRTUAL-RUNTIME_update-alternatives could be
update-alternatives-cworth or
update-alternatives-dpkg.
But opkg can only Rdepend on the former.

Signed-off-by: Dexuan Cui <dexuan.cui@intel.com>
---
 meta/recipes-devtools/opkg/opkg_0.1.8.bb |    4 ++--
 meta/recipes-devtools/opkg/opkg_svn.bb   |    4 ++--
 2 files changed, 4 insertions(+), 4 deletions(-)

diff --git a/meta/recipes-devtools/opkg/opkg_0.1.8.bb b/meta/recipes-devtools/opkg/opkg_0.1.8.bb
index 18cf042..36e2355 100644
--- a/meta/recipes-devtools/opkg/opkg_0.1.8.bb
+++ b/meta/recipes-devtools/opkg/opkg_0.1.8.bb
@@ -3,7 +3,7 @@ require opkg.inc
 PROVIDES += "virtual/update-alternatives"
 RPROVIDES_update-alternatives-cworth += "update-alternatives"
 RCONFLICTS_update-alternatives-cworth = "update-alternatives-dpkg"
-RDEPENDS_${PN} = "${VIRTUAL-RUNTIME_update-alternatives} opkg-config-base"
+RDEPENDS_${PN} = "update-alternatives-cworth opkg-config-base"
 RDEPENDS_${PN}_virtclass-native = ""
 RDEPENDS_${PN}_virtclass-nativesdk = ""
 PACKAGE_ARCH_update-alternatives-cworth = "all"
@@ -13,7 +13,7 @@ SRC_URI = "http://opkg.googlecode.com/files/opkg-${PV}.tar.gz \
            file://headerfix.patch \
 "
 
-PR = "r4"
+PR = "r5"
 
 PACKAGES =+ "libopkg${PKGSUFFIX}-dev libopkg${PKGSUFFIX} update-alternatives-cworth${PKGSUFFIX}"
 
diff --git a/meta/recipes-devtools/opkg/opkg_svn.bb b/meta/recipes-devtools/opkg/opkg_svn.bb
index 099a373..7fb74d5 100644
--- a/meta/recipes-devtools/opkg/opkg_svn.bb
+++ b/meta/recipes-devtools/opkg/opkg_svn.bb
@@ -3,7 +3,7 @@ require opkg.inc
 PROVIDES += "virtual/update-alternatives"
 RPROVIDES_update-alternatives-cworth += "update-alternatives"
 RCONFLICTS_update-alternatives-cworth = "update-alternatives-dpkg"
-RDEPENDS_${PN} = "${VIRTUAL-RUNTIME_update-alternatives} opkg-config-base"
+RDEPENDS_${PN} = "update-alternatives-cworth opkg-config-base"
 RDEPENDS_${PN}_virtclass-native = ""
 RDEPENDS_${PN}_virtclass-nativesdk = ""
 PACKAGE_ARCH_update-alternatives-cworth = "all"
@@ -17,7 +17,7 @@ S = "${WORKDIR}/trunk"
 
 SRCREV = "625"
 PV = "0.1.8+svnr${SRCPV}"
-PR = "r2"
+PR = "r3"
 
 PACKAGES =+ "libopkg${PKGSUFFIX}-dev libopkg${PKGSUFFIX} update-alternatives-cworth${PKGSUFFIX}"
 
-- 
1.7.6



