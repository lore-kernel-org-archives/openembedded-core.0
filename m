Received: from mga03.intel.com ([143.182.124.21])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <sgw@linux.intel.com>) id 1Rhxr3-0004Kv-HL
	for openembedded-core@lists.openembedded.org;
	Tue, 03 Jan 2012 07:28:14 +0100
Received: from azsmga001.ch.intel.com ([10.2.17.19])
	by azsmga101.ch.intel.com with ESMTP; 02 Jan 2012 22:20:46 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="4.71,315,1320652800"; d="scan'208";a="91752131"
Received: from unknown (HELO swold-mobl.bigsur.com) ([10.255.13.112])
	by azsmga001.ch.intel.com with ESMTP; 02 Jan 2012 22:20:46 -0800
From: Saul Wold <sgw@linux.intel.com>
To: openembedded-core@lists.openembedded.org
Date: Mon,  2 Jan 2012 22:19:01 -0800
Message-Id: <3570d0b47e7a7ea05964c21da05faf1f09b66e81.1325571069.git.sgw@linux.intel.com>
X-Mailer: git-send-email 1.7.6.4
In-Reply-To: <cover.1325571068.git.sgw@linux.intel.com>
References: <cover.1325571068.git.sgw@linux.intel.com>
In-Reply-To: <cover.1325571068.git.sgw@linux.intel.com>
References: <cover.1325571068.git.sgw@linux.intel.com>
Subject: [CONSOLIDATED PULL 015/113] distro_tracking_fields: take the ownership of Mei Lei's
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
X-List-Received-Date: Tue, 03 Jan 2012 06:28:14 -0000

From: Shane Wang <shane.wang@intel.com>

Signed-off-by: Shane Wang <shane.wang@intel.com>
---
 .../conf/distro/include/distro_tracking_fields.inc |   22 ++++++++++----------
 1 files changed, 11 insertions(+), 11 deletions(-)

diff --git a/meta/conf/distro/include/distro_tracking_fields.inc b/meta/conf/distro/include/distro_tracking_fields.inc
index cee5404..000b7ba 100644
--- a/meta/conf/distro/include/distro_tracking_fields.inc
+++ b/meta/conf/distro/include/distro_tracking_fields.inc
@@ -2,7 +2,7 @@ RECIPE_STATUS_pn-diffutils = "green"
 RECIPE_LATEST_VERSION_pn-diffutils = "3.2"
 RECIPE_LAST_UPDATE_pn-diffutils = "Sep 30, 2011"
 RECIPE_NO_UPDATE_REASON_pn-diffutils = "3.2 is the latest version"
-RECIPE_MAINTAINER_pn-diffutils = "Mei Lei <lei.mei@intel.com>"
+RECIPE_MAINTAINER_pn-diffutils = "Shane Wang <shane.wang@intel.com>"
 
 RECIPE_STATUS_pn-epdfview = "red"
 RECIPE_LATEST_VERSION_pn-epdfview = "check"
@@ -1080,7 +1080,7 @@ DISTRO_PN_ALIAS_pn-shadow-sysroot = "Ubuntu=shadow Fedora=shadow"
 
 RECIPE_STATUS_pn-coreutils = "green"
 RECIPE_LAST_UPDATE_pn-coreutils = "Jul 2, 2011"
-RECIPE_MAINTAINER_pn-coreutils = "Mei Lei <lei.mei@intel.com>"
+RECIPE_MAINTAINER_pn-coreutils = "Shane Wang <shane.wang@intel.com>"
 RECIPE_INTEL_SECTION_pn-coreutils = "base utils"
 RECIPE_LATEST_VERSION_pn-coreutils = "8.12"
 RECIPE_LATEST_RELEASE_DATE_pn-coreutils = "Apr 01, 2011"
@@ -1385,7 +1385,7 @@ RECIPE_COMMENTS_pn-time = ""
 
 RECIPE_STATUS_pn-bzip2 = "yellow"  # local config scripts
 RECIPE_LAST_UPDATE_pn-bzip2 = "Nov 3, 2010"
-RECIPE_MAINTAINER_pn-bzip2 = "Mei Lei <lei.mei@intel.com>"
+RECIPE_MAINTAINER_pn-bzip2 = "Shane Wang <shane.wang@intel.com>"
 RECIPE_DEPENDENCY_CHECK_pn-bzip2 = "not done"
 RECIPE_LATEST_VERSION_pn-bzip2 = "1.0.6"
 RECIPE_PATCH_pn-bzip2+configure.ac = "override default build method"
@@ -1498,7 +1498,7 @@ RECIPE_MAINTAINER_pn-sysfsutils = "Saul Wold <sgw@linux.intel.com>"
 
 RECIPE_STATUS_pn-curl = "green"
 RECIPE_LAST_UPDATE_pn-curl = "Dec 22, 2011"
-RECIPE_MAINTAINER_pn-curl = "Mei Lei <lei.mei@intel.com>"
+RECIPE_MAINTAINER_pn-curl = "Shane Wang <shane.wang@intel.com>"
 RECIPE_DEPENDENCY_CHECK_pn-curl = "not done"
 RECIPE_LATEST_VERSION_pn-curl = "7.23.1"
 RECIPE_PATCH_pn-curl+noldlibpath = "no bother set LD_LIBRARY_PATH since we are cross compiling"
@@ -1522,7 +1522,7 @@ RECIPE_MANUAL_CHECK_DATE_pn-gconf-dbus = "Jul 01, 2011"
 
 RECIPE_STATUS_pn-elfutils ="green" # no update needed
 RECIPE_LAST_UPDATE_pn-elfutils = "Jul 16, 2010"
-RECIPE_MAINTAINER_pn-elfutils = "Mei Lei <lei.mei@intel.com>"
+RECIPE_MAINTAINER_pn-elfutils = "Shane Wang <shane.wang@intel.com>"
 RECIPE_DEPENDENCY_CHECK_pn-gconf-dbus = "not done"
 RECIPE_LATEST_VERSION_pn-elfutils="0.148"
 RECIPE_INTEL_SECTION_pn-gconf-dbus = "base utils"
@@ -1564,7 +1564,7 @@ RECIPE_COMMENTS_pn-genext2fs = ""
 
 RECIPE_STATUS_pn-findutils = "green"
 RECIPE_LAST_UPDATE_pn-findutils = "Jul 8, 2010"
-RECIPE_MAINTAINER_pn-findutils = "Mei Lei <lei.mei@intel.com>"
+RECIPE_MAINTAINER_pn-findutils = "Shane Wang <shane.wang@intel.com>"
 RECIPE_DEPENDENCY_CHECK_pn-findutils = "not done"
 RECIPE_PATCH_pn-findutils_01-27017 = "upstream patch"
 RECIPE_PATCH_pn-findutils_01-28824 = "upstream patch"
@@ -1615,7 +1615,7 @@ RECIPE_COMMENTS_pn-nfs-utils = ""
 RECIPE_STATUS_pn-dropbear = "green"
 DISTRO_PN_ALIAS_pn-dropbear = "Debian=dropbear Ubuntu=dropbear"
 RECIPE_LAST_UPDATE_pn-dropbear = "Nov 29, 2011"
-RECIPE_MAINTAINER_pn-dropbear = "Mei Lei <lei.mei@intel.com>"
+RECIPE_MAINTAINER_pn-dropbear = "Shane Wang <shane.wang@intel.com>"
 RECIPE_DEPENDENCY_CHECK_pn-dropbear = "not done"
 RECIPE_LATEST_VERSION_pn-dropbear = "2011.54"
 RECIPE_PATCH_pn-dropbear+urandom-xauth-changes-to-options.h = "xauth path change"
@@ -1826,7 +1826,7 @@ RECIPE_COMMENTS_pn-pciutils = ""
 
 RECIPE_STATUS_pn-gamin = "green"
 RECIPE_LAST_UPDATE_pn-gamin = "Aug 12, 2010"
-RECIPE_MAINTAINER_pn-gamin = "Mei Lei <lei.mei@intel.com>"
+RECIPE_MAINTAINER_pn-gamin = "Shane Wang <shane.wang@intel.com>"
 RECIPE_DEPENDENCY_CHECK_pn-gamin = "done"
 RECIPE_LATEST_VERSION_pn-gamin = "0.1.10"
 RECIPE_PATCH_pn-gamin+no-abstract-socket = "disable abstract socket support"
@@ -1858,7 +1858,7 @@ RECIPE_LATEST_VERSION_pn-sysklogd = "1.5"
 
 RECIPE_STATUS_pn-gawk = "red"    # need upgrade
 RECIPE_LAST_UPDATE_pn-gawk = "Jul 5, 2011"
-RECIPE_MAINTAINER_pn-gawk = "Mei Lei <lei.mei@intel.com>"
+RECIPE_MAINTAINER_pn-gawk = "Shane Wang <shane.wang@intel.com>"
 RECIPE_LATEST_VERSION_pn-gawk = "4.0.0"
 
 RECIPE_STATUS_pn-mktemp="red"
@@ -1903,7 +1903,7 @@ RECIPE_COMMENTS_pn-sed = "xxx maintains GPLv2 sed, while Dongxiao maintains GPLv
 RECIPE_STATUS_pn-aspell = "red"
 RECIPE_LATEST_VERSION_pn-aspell = "0.60.6"
 RECIPE_LAST_UPDATE_pn-aspell = "Aug 16, 2010"
-RECIPE_MAINTAINER_pn-aspell = "Mei Lei <lei.mei@intel.com>"
+RECIPE_MAINTAINER_pn-aspell = "Shane Wang <shane.wang@intel.com>"
 
 RECIPE_STATUS_pn-parted = "green"
 RECIPE_LATEST_VERSION_pn-parted = "3.0"
@@ -2202,7 +2202,7 @@ RECIPE_NO_OF_PATCHES_pn-gupnp= "1"
 RECIPE_LATEST_RELEASE_DATE_pn-gupnp= "Apr 30, 2011"
 RECIPE_TIME_BETWEEN_LAST_TWO_RELEASES_pn-gupnp= "1 month"
 RECIPE_LAST_UPDATE_pn-gupnp = "Jul 4, 2011"
-RECIPE_MAINTAINER_pn-gupnp= "Mei Lei <lei.mei@intel.com>"
+RECIPE_MAINTAINER_pn-gupnp= "Shane Wang <shane.wang@intel.com>"
 
 RECIPE_STATUS_pn-gupnp-av = "green"
 RECIPE_LATEST_VERSION_pn-gupnp-av = "0.8.0"
-- 
1.7.6.4



