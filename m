Received: from mga01.intel.com ([192.55.52.88])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <dexuan.cui@intel.com>) id 1QRlNX-0007IR-IW
	for openembedded-core@lists.openembedded.org;
	Wed, 01 Jun 2011 15:22:31 +0200
Received: from fmsmga001.fm.intel.com ([10.253.24.23])
	by fmsmga101.fm.intel.com with ESMTP; 01 Jun 2011 06:19:09 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="4.65,303,1304319600"; d="scan'208";a="11944608"
Received: from dcui-desktop.sh.intel.com (HELO localhost) ([10.239.13.51])
	by fmsmga001.fm.intel.com with ESMTP; 01 Jun 2011 06:19:08 -0700
From: Dexuan Cui <dexuan.cui@intel.com>
To: openembedded-core@lists.openembedded.org
Date: Wed,  1 Jun 2011 21:18:33 +0800
Message-Id: <318cf4e696f33adb34aea6423237b264da61a731.1306931848.git.dexuan.cui@intel.com>
X-Mailer: git-send-email 1.7.2
In-Reply-To: <cover.1306931844.git.dexuan.cui@intel.com>
References: <cover.1306931844.git.dexuan.cui@intel.com>
In-Reply-To: <cover.1306931844.git.dexuan.cui@intel.com>
References: <cover.1306931844.git.dexuan.cui@intel.com>
Subject: [RFC v1 PATCH 02/16] perl-native: populate into its own dir
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
X-List-Received-Date: Wed, 01 Jun 2011 13:22:31 -0000

Signed-off-by: Dexuan Cui <dexuan.cui@intel.com>
---
 meta/recipes-devtools/perl/perl-native_5.12.3.bb |    5 ++++-
 1 files changed, 4 insertions(+), 1 deletions(-)

diff --git a/meta/recipes-devtools/perl/perl-native_5.12.3.bb b/meta/recipes-devtools/perl/perl-native_5.12.3.bb
index cbb4e78..56274f0 100644
--- a/meta/recipes-devtools/perl/perl-native_5.12.3.bb
+++ b/meta/recipes-devtools/perl/perl-native_5.12.3.bb
@@ -4,7 +4,7 @@ SECTION = "libs"
 LICENSE = "Artistic|GPL"
 LIC_FILES_CHKSUM = "file://Copying;md5=2b4c6ffbcfcbdee469f02565f253d81a \
 		    file://Artistic;md5=f921793d03cc6d63ec4b15e9be8fd3f8"
-PR = "r2"
+PR = "r3"
 
 LIC_FILES_CHKSUM = "file://Copying;md5=2b4c6ffbcfcbdee469f02565f253d81a \
                     file://Artistic;md5=f921793d03cc6d63ec4b15e9be8fd3f8"
@@ -28,6 +28,8 @@ S = "${WORKDIR}/perl-${PV}"
 
 inherit native
 
+PACKAGE_OWN_DIR = "/${PN}"
+
 export LD="${CCLD}"
 
 do_configure () {
@@ -41,6 +43,7 @@ do_configure () {
 		-Dvendorprefix=${prefix} \
 		-Dsiteprefix=${prefix} \
 		\
+		-Dbin=${STAGING_BINDIR}/${PN} \
 		-Dprivlib=${STAGING_LIBDIR}/perl/${PV} \
 		-Darchlib=${STAGING_LIBDIR}/perl/${PV} \
 		-Dvendorlib=${STAGING_LIBDIR}/perl/${PV} \
-- 
1.7.2



