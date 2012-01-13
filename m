Received: from masterfoo.zenlinux.com ([207.192.74.254])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <scott.a.garman@intel.com>) id 1Rlqgi-0003nD-2j
	for openembedded-core@lists.openembedded.org;
	Sat, 14 Jan 2012 00:37:36 +0100
Received: from localhost (c-76-115-40-64.hsd1.or.comcast.net [76.115.40.64])
	(using TLSv1 with cipher DHE-RSA-AES128-SHA (128/128 bits))
	(No client certificate requested)
	by masterfoo.zenlinux.com (Postfix) with ESMTP id 7495A2FF80
	for <openembedded-core@lists.openembedded.org>;
	Fri, 13 Jan 2012 18:29:58 -0500 (EST)
From: Scott Garman <scott.a.garman@intel.com>
To: openembedded-core@lists.openembedded.org
Date: Fri, 13 Jan 2012 15:29:49 -0800
Message-Id: <ff1ecea72991b72cb09741499cc946f047ceb8aa.1326480099.git.scott.a.garman@intel.com>
X-Mailer: git-send-email 1.7.5.4
In-Reply-To: <cover.1326480099.git.scott.a.garman@intel.com>
References: <cover.1326480099.git.scott.a.garman@intel.com>
In-Reply-To: <cover.1326480099.git.scott.a.garman@intel.com>
References: <cover.1326480099.git.scott.a.garman@intel.com>
X-MasterFoo-MailScanner-Information: Please contact the ISP for more
	information
X-MailScanner-ID: 7495A2FF80.B3665
X-MasterFoo-MailScanner: Found to be clean
X-MasterFoo-MailScanner-SpamCheck: not spam
X-MasterFoo-MailScanner-From: scott.a.garman@intel.com
X-Spam-Status: No
Subject: [PATCH 1/3] libpam: upgrade to 1.1.5
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
X-List-Received-Date: Fri, 13 Jan 2012 23:37:36 -0000

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
1.7.5.4



