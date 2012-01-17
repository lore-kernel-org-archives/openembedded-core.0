Received: from mga14.intel.com ([143.182.124.37])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <sgw@linux.intel.com>) id 1Rn4b0-0006gw-Q3
	for openembedded-core@lists.openembedded.org;
	Tue, 17 Jan 2012 09:40:47 +0100
Received: from azsmga001.ch.intel.com ([10.2.17.19])
	by azsmga102.ch.intel.com with ESMTP; 17 Jan 2012 00:33:06 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="4.71,315,1320652800"; d="scan'208";a="96633021"
Received: from unknown (HELO swold-mobl.bigsur.com) ([10.255.14.6])
	by azsmga001.ch.intel.com with ESMTP; 17 Jan 2012 00:33:06 -0800
From: Saul Wold <sgw@linux.intel.com>
To: openembedded-core@lists.openembedded.org
Date: Tue, 17 Jan 2012 00:32:24 -0800
Message-Id: <7ec1b8f87f860749cbe9631aa32a43e0bdc8b1eb.1326786990.git.sgw@linux.intel.com>
X-Mailer: git-send-email 1.7.6.5
In-Reply-To: <cover.1326786989.git.sgw@linux.intel.com>
References: <cover.1326786989.git.sgw@linux.intel.com>
In-Reply-To: <cover.1326786989.git.sgw@linux.intel.com>
References: <cover.1326786989.git.sgw@linux.intel.com>
Subject: [CONSOLIDATED PULL 39/62] libpam: upgrade to 1.1.5
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
X-List-Received-Date: Tue, 17 Jan 2012 08:47:47 -0000

From: Scott Garman <scott.a.garman@intel.com>

Updated HOMEPAGE, BUGTRACKER, and SRC_URI fields to reflect new
project hosting.

Cleaned up some of the metadata ordering.

Signed-off-by: Scott Garman <scott.a.garman@intel.com>
---
 .../pam/{libpam_1.1.4.bb => libpam_1.1.5.bb}       |   27 ++++++++++---------
 1 files changed, 14 insertions(+), 13 deletions(-)
 rename meta/recipes-extended/pam/{libpam_1.1.4.bb => libpam_1.1.5.bb} (85%)

diff --git a/meta/recipes-extended/pam/libpam_1.1.4.bb b/meta/recipes-extended/pam/libpam_1.1.5.bb
similarity index 85%
rename from meta/recipes-extended/pam/libpam_1.1.4.bb
rename to meta/recipes-extended/pam/libpam_1.1.5.bb
index afe17cc..1ab3a99 100644
--- a/meta/recipes-extended/pam/libpam_1.1.4.bb
+++ b/meta/recipes-extended/pam/libpam_1.1.5.bb
@@ -1,7 +1,7 @@
 SUMMARY = "Linux-PAM (Pluggable Authentication Modules)"
-DESCRIPTION = "Linux-PAM (Pluggable Authentication Modules for Linux), Basically, it is a flexible mechanism for authenticating users"
-HOMEPAGE = "http://www.kernel.org/pub/linux/libs/pam/"
-BUGTRACKER = "http://sourceforge.net/projects/pam/support"
+DESCRIPTION = "Linux-PAM (Pluggable Authentication Modules for Linux), a flexible mechanism for authenticating users"
+HOMEPAGE = "https://fedorahosted.org/linux-pam/"
+BUGTRACKER = "https://fedorahosted.org/linux-pam/newticket"
 SECTION = "base"
 # PAM is dual licensed under GPL and BSD.
 # /etc/pam.d comes from Debian libpam-runtime in 2009-11 (at that time 
@@ -9,28 +9,25 @@ SECTION = "base"
 LICENSE = "GPLv2+ | BSD"
 LIC_FILES_CHKSUM = "file://COPYING;md5=ca0395de9a86191a078b8b79302e3083"
 
-PR = "r2"
+PR = "r0"
 
-DEPENDS = "bison flex flex-native cracklib"
-RDEPENDS_${PN}-runtime = "libpam pam-plugin-deny pam-plugin-permit pam-plugin-warn pam-plugin-unix"
-RDEPENDS_${PN}-xtests = "libpam pam-plugin-access pam-plugin-debug pam-plugin-cracklib pam-plugin-pwhistory \
-                        pam-plugin-succeed-if pam-plugin-time coreutils"
-RRECOMMENDS_${PN} = "libpam-runtime"
-
-SRC_URI = "${KERNELORG_MIRROR}/linux/libs/pam/library/Linux-PAM-${PV}.tar.bz2 \
+SRC_URI = "https://fedorahosted.org/releases/l/i/linux-pam/Linux-PAM-${PV}.tar.bz2 \
            file://99_pam \
            file://pam.d/* \
            file://libpam-xtests.patch"
 
 SRC_URI_append_libc-uclibc = " file://pam-no-innetgr.patch"
 
-SRC_URI[md5sum] = "e9af5fb27bb22edb55d077e2888b3ebc"
-SRC_URI[sha256sum] = "ccd89331914390b1e9e99c954471d65f19b660d81e15a46eeb96cee125d44056"
+SRC_URI[md5sum] = "927ee5585bdec5256c75117e9348aa47"
+SRC_URI[sha256sum] = "65def4df04254dc4c5156859d36c34ad6d7afbcf3adbf2780530ebc4dbf2a116"
+
+DEPENDS = "bison flex flex-native cracklib"
 
 EXTRA_OECONF = "--with-db-uniquename=_pam \
                 --includedir=${includedir}/security \
                 --libdir=${base_libdir} \
                 --disable-regenerate-docu"
+
 CFLAGS_append = " -fPIC "
 
 S = "${WORKDIR}/Linux-PAM-${PV}"
@@ -49,6 +46,10 @@ FILES_${PN}-xtests = "${datadir}/Linux-PAM/xtests"
 
 PACKAGES_DYNAMIC += " pam-plugin-*"
 
+RDEPENDS_${PN}-runtime = "libpam pam-plugin-deny pam-plugin-permit pam-plugin-warn pam-plugin-unix"
+RDEPENDS_${PN}-xtests = "libpam pam-plugin-access pam-plugin-debug pam-plugin-cracklib pam-plugin-pwhistory pam-plugin-succeed-if pam-plugin-time coreutils"
+RRECOMMENDS_${PN} = "libpam-runtime"
+
 python populate_packages_prepend () {
 	import os.path
 
-- 
1.7.6.5



