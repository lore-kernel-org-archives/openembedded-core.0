Received: from mga02.intel.com ([134.134.136.20])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <sgw@linux.intel.com>) id 1QpMO2-0000dV-9o
	for openembedded-core@lists.openembedded.org;
	Fri, 05 Aug 2011 17:32:34 +0200
Received: from orsmga002.jf.intel.com ([10.7.209.21])
	by orsmga101.jf.intel.com with ESMTP; 05 Aug 2011 08:28:08 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="4.67,323,1309762800"; d="scan'208";a="34926360"
Received: from unknown (HELO swold-MOBL.bigsur.com) ([10.255.14.76])
	by orsmga002.jf.intel.com with ESMTP; 05 Aug 2011 08:28:07 -0700
From: Saul Wold <sgw@linux.intel.com>
To: openembedded-core@lists.openembedded.org
Date: Fri,  5 Aug 2011 08:27:52 -0700
Message-Id: <c4812f7cae20e250095b6ffa15e284a44b003556.1312557813.git.sgw@linux.intel.com>
X-Mailer: git-send-email 1.7.3.4
In-Reply-To: <cover.1312557813.git.sgw@linux.intel.com>
References: <cover.1312557813.git.sgw@linux.intel.com>
In-Reply-To: <cover.1312557813.git.sgw@linux.intel.com>
References: <cover.1312557813.git.sgw@linux.intel.com>
Subject: [CONSOLIDATED PULL 02/14] autoconf: Remove patch=1 from SRC_URI
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
X-List-Received-Date: Fri, 05 Aug 2011 15:32:34 -0000

From: Khem Raj <raj.khem@gmail.com>

Edit summary field s/produced/produce/

Fix the license related warning

WARNING: autoconf-native: No generic license file exists for:
GPLv2|GPLv3 at /b/openembedded-core/meta/files/common-licenses
WARNING: autoconf-native: There is also no SPDXLICENSEMAP for this
license type: GPLv2|GPLv3 at
/b/openembedded-core/meta/files/common-licenses

Signed-off-by: Khem Raj <raj.khem@gmail.com>
---
 meta/recipes-devtools/autoconf/autoconf.inc     |    4 ++--
 meta/recipes-devtools/autoconf/autoconf_2.68.bb |   19 ++++++++++---------
 2 files changed, 12 insertions(+), 11 deletions(-)

diff --git a/meta/recipes-devtools/autoconf/autoconf.inc b/meta/recipes-devtools/autoconf/autoconf.inc
index 47b2b84..08a1b02 100644
--- a/meta/recipes-devtools/autoconf/autoconf.inc
+++ b/meta/recipes-devtools/autoconf/autoconf.inc
@@ -1,4 +1,4 @@
-SUMMARY = "A GNU tool that procuded shell scripts to automatically configure software."
+SUMMARY = "A GNU tool that procude shell scripts to automatically configure software."
 DESCRIPTION = "Autoconf is an extensible package of M4 macros that produce shell scripts to automatically \ 
 configure software source code packages. Autoconf creates a configuration script for a package from a template \
 file that lists the operating system features that the package can use, in the form of M4 macro calls."
@@ -9,6 +9,6 @@ DEPENDS += "m4-native"
 RDEPENDS_${PN} = "m4 gnu-config"
 
 SRC_URI = "${GNU_MIRROR}/autoconf/autoconf-${PV}.tar.bz2 \
-	   file://program_prefix.patch;patch=1"
+	   file://program_prefix.patch"
 
 inherit autotools
diff --git a/meta/recipes-devtools/autoconf/autoconf_2.68.bb b/meta/recipes-devtools/autoconf/autoconf_2.68.bb
index 638e677..3b196a6 100644
--- a/meta/recipes-devtools/autoconf/autoconf_2.68.bb
+++ b/meta/recipes-devtools/autoconf/autoconf_2.68.bb
@@ -6,16 +6,17 @@ PARALLEL_MAKE = ""
 
 DEPENDS += "m4-native"
 RDEPENDS_${PN} = "m4 gnu-config"
-LICENSE = "GPLv2|GPLv3"
+LICENSE = "GPLv2 & GPLv3"
 LIC_FILES_CHKSUM = "file://COPYING;md5=751419260aa954499f7abaabaa882bbe \
 		    file://COPYINGv3;md5=d32239bcb673463ab874e80d47fae504"
-SRC_URI += "file://autoreconf-include.patch;patch=1 \
-	   file://autoreconf-exclude.patch;patch=1 \
-	   file://autoreconf-foreign.patch;patch=1 \
-	   file://autoreconf-gnuconfigize.patch;patch=1 \
-	   file://autoheader-nonfatal-warnings.patch;patch=1 \
-	   ${@['file://path_prog_fixes.patch;patch=1', ''][bb.data.inherits_class('native', d)]} \
-           file://config_site.patch;patch=1"
+SRC_URI += "file://autoreconf-include.patch \
+	    file://autoreconf-exclude.patch \
+	    file://autoreconf-foreign.patch \
+	    file://autoreconf-gnuconfigize.patch \
+	    file://autoheader-nonfatal-warnings.patch \
+	    ${@['file://path_prog_fixes.patch', ''][bb.data.inherits_class('native', d)]} \
+            file://config_site.patch \
+           "
 
 SRC_URI[md5sum] = "864d785215aa60d627c91fcb21b05b07"
 SRC_URI[sha256sum] = "c491fb273fd6d4ca925e26ceed3d177920233c76d542b150ff35e571454332c8"
@@ -23,6 +24,6 @@ SRC_URI[sha256sum] = "c491fb273fd6d4ca925e26ceed3d177920233c76d542b150ff35e57145
 DEPENDS_virtclass-native = "m4-native gnu-config-native"
 RDEPENDS_${PN}_virtclass-native = "m4-native gnu-config-native"
 
-SRC_URI_append_virtclass-native = " file://fix_path_xtra.patch;patch=1"
+SRC_URI_append_virtclass-native = " file://fix_path_xtra.patch"
 
 BBCLASSEXTEND = "native"
-- 
1.7.3.4



