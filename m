Received: from mga03.intel.com ([143.182.124.21])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <sgw@linux.intel.com>) id 1QTqLh-0003is-R2
	for openembedded-core@lists.openembedded.org;
	Tue, 07 Jun 2011 09:05:15 +0200
Received: from azsmga001.ch.intel.com ([10.2.17.19])
	by azsmga101.ch.intel.com with ESMTP; 07 Jun 2011 00:01:54 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="4.65,331,1304319600"; 
   d="scan'208";a="8299018"
Received: from unknown (HELO swold-MOBL.bigsur.com) ([10.255.13.99])
	by azsmga001.ch.intel.com with ESMTP; 07 Jun 2011 00:01:54 -0700
From: Saul Wold <sgw@linux.intel.com>
To: openembedded-core@lists.openembedded.org
Date: Tue,  7 Jun 2011 00:01:43 -0700
Message-Id: <9c3373fa2bd99e9c24702789d397421ce8deec32.1307429530.git.sgw@linux.intel.com>
X-Mailer: git-send-email 1.7.3.4
In-Reply-To: <cover.1307429530.git.sgw@linux.intel.com>
References: <cover.1307429530.git.sgw@linux.intel.com>
In-Reply-To: <cover.1307429530.git.sgw@linux.intel.com>
References: <cover.1307429530.git.sgw@linux.intel.com>
Subject: [CONSOLIDATED PULL 07/13] distro tracking: update Qing -> Saul
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
X-List-Received-Date: Tue, 07 Jun 2011 07:05:15 -0000

Signed-off-by: Saul Wold <sgw@linux.intel.com>
---
 .../conf/distro/include/distro_tracking_fields.inc |  127 +++++++++++---------
 1 files changed, 68 insertions(+), 59 deletions(-)

diff --git a/meta/conf/distro/include/distro_tracking_fields.inc b/meta/conf/distro/include/distro_tracking_fields.inc
index 0d47f52..f1fded2 100644
--- a/meta/conf/distro/include/distro_tracking_fields.inc
+++ b/meta/conf/distro/include/distro_tracking_fields.inc
@@ -337,7 +337,7 @@ RECIPE_LATEST_RELEASE_DATE_pn-gdbm = "10/2002"
 
 RECIPE_STATUS_pn-pth = "yellow"    # custom do_configure
 RECIPE_LAST_UPDATE_pn-pth = "Mar 14, 2008"
-RECIPE_MAINTAINER_pn-pth = "Qing He <qing.he@intel.com>"
+RECIPE_MAINTAINER_pn-pth = "Saul Wold <sgw@linux.intel.com>"
 RECIPE_LATEST_VERSION_pn-pth = "2.0.7"
 RECIPE_INTEL_SECTION_pn-pth = "base libs"
 RECIPE_LATEST_RELEASE_DATE_pn-pth = "06/2006"
@@ -355,7 +355,7 @@ RECIPE_COMMENTS_pn-python-pycurl = "the so called MIT/X here is actually ISC lic
 
 RECIPE_STATUS_pn-libusb1 = "green"
 RECIPE_LAST_UPDATE_pn-libusb1 = "Jul 15, 2010"
-RECIPE_MAINTAINER_pn-libusb1 = "Qing He <qing.he@intel.com>"
+RECIPE_MAINTAINER_pn-libusb1 = "Saul Wold <sgw@linux.intel.com>"
 RECIPE_DEPENDENCY_CHECK_pn-libusb1 = "not done"
 RECIPE_LATEST_VERSION_pn-libusb1 = "1.0.8"
 RECIPE_INTEL_SECTION_pn-libusb1 = "base libs"
@@ -365,7 +365,7 @@ RECIPE_COMMENTS_pn-libusb1 = ""
 
 RECIPE_STATUS_pn-libusb-compat = "green"
 RECIPE_LAST_UPDATE_pn-libusb-compat = "Jul 16, 2010"
-RECIPE_MAINTAINER_pn-libusb-compat = "Qing He <qing.he@intel.com>"
+RECIPE_MAINTAINER_pn-libusb-compat = "Saul Wold <sgw@linux.intel.com>"
 RECIPE_DEPENDENCY_CHECK_pn-libusb-compat = "done"
 RECIPE_LATEST_VERSION_pn-libusb-compat = "0.1.3"
 RECIPE_INTEL_SECTION_pn-libusb-compat = "base utils"
@@ -376,14 +376,14 @@ DISTRO_PN_ALIAS_pn-libusb-compat = "OSPDT"
 
 RECIPE_STATUS_pn-libnl = "green"
 RECIPE_LAST_UPDATE_pn-libnl = "Nov 15, 2010"
-RECIPE_MAINTAINER_pn-libnl = "Qing He <qing.he@intel.com>"
+RECIPE_MAINTAINER_pn-libnl = "Saul Wold <sgw@linux.intel.com>"
 RECIPE_LATEST_VERSION_pn-libnl = "2.0"
 RECIPE_INTEL_SECTION_pn-libnl = "base libs"
 RECIPE_LATEST_RELEASE_DATE_pn-libnl = "10/2010"
 
 RECIPE_STATUS_pn-zlib = "yellow"  # local config scripts
 RECIPE_LAST_UPDATE_pn-zlib = "Jun 11, 2010"
-RECIPE_MAINTAINER_pn-zlib = "Qing He <qing.he@intel.com>"
+RECIPE_MAINTAINER_pn-zlib = "Saul Wold <sgw@linux.intel.com>"
 RECIPE_DEPENDENCY_CHECK_pn-zlib = "not done"
 RECIPE_LATEST_VERSION_pn-zlib = "1.2.5"
 RECIPE_PATCH_pn-zlib+configure.ac = "override default build method"
@@ -395,7 +395,7 @@ RECIPE_COMMENTS_pn-zlib = "rconflicts: libxml2 (< 2.7.7) (rbreaks)"
 
 RECIPE_STATUS_pn-libxml2 = "yellow"
 RECIPE_LAST_UPDATE_pn-libxml2 = "Jun 18, 2010"
-RECIPE_MAINTAINER_pn-libxml2 = "Qing He <qing.he@intel.com>"
+RECIPE_MAINTAINER_pn-libxml2 = "Saul Wold <sgw@linux.intel.com>"
 RECIPE_DEPENDENCY_CHECK_pn-libxml2 = "done"
 RECIPE_LATEST_VERSION_pn-libxml2 = "2.7.7"
 RECIPE_PATCH_pn-libxml2+install = "use poky environment variables"
@@ -406,7 +406,7 @@ RECIPE_COMMENTS_pn-libxml2 = ""
 
 RECIPE_STATUS_pn-readline = "green"
 RECIPE_LAST_UPDATE_pn-readline = "Jun 17, 2010"
-RECIPE_MAINTAINER_pn-readline = "Qing He <qing.he@intel.com>"
+RECIPE_MAINTAINER_pn-readline = "Saul Wold <sgw@linux.intel.com>"
 RECIPE_DEPENDENCY_CHECK_pn-readline = "not done"
 RECIPE_LATEST_VERSION_pn-readline = "6.1"
 RECIPE_PATCH_pn-readline+configure-fix = "fix configure for build"
@@ -418,7 +418,7 @@ RECIPE_COMMENTS_pn-readline = ""
 
 RECIPE_STATUS_pn-libgcrypt = "green"
 RECIPE_LAST_UPDATE_pn-libgcrypt = "Jul 29, 2010"
-RECIPE_MAINTAINER_pn-libgcrypt = "Qing He <qing.he@intel.com>"
+RECIPE_MAINTAINER_pn-libgcrypt = "Saul Wold <sgw@linux.intel.com>"
 RECIPE_DEPENDENCY_CHECK_pn-libgcrypt = "not done"
 RECIPE_LATEST_VERSION_pn-libgcrypt = "1.4.5"
 RECIPE_PATCH_pn-libgcrypt+add-pkgconfig-support = "add .pc file"
@@ -449,7 +449,7 @@ RECIPE_LATEST_RELEASE_DATE_pn-lzo = "10/2010"
 
 RECIPE_STATUS_pn-libtasn1 = "green"
 RECIPE_LAST_UPDATE_pn-libtasn1 = "Nov 16, 2010"
-RECIPE_MAINTAINER_pn-libtasn1 = "Qing He <qing.he@intel.com>"
+RECIPE_MAINTAINER_pn-libtasn1 = "Saul Wold <sgw@linux.intel.com>"
 RECIPE_DEPENDENCY_CHECK_pn-libtasn1 = "not done"
 RECIPE_LATEST_VERSION_pn-libtasn1 = "2.7"
 RECIPE_INTEL_SECTION_pn-libtasn1 = "base libs"
@@ -459,7 +459,7 @@ RECIPE_COMMENTS_pn-libtasn1 = ""
 
 RECIPE_STATUS_pn-openssl = "green"
 RECIPE_LAST_UPDATE_pn-openssl = "Nov 17, 2010"
-RECIPE_MAINTAINER_pn-openssl = "Qing He <qing.he@intel.com>"
+RECIPE_MAINTAINER_pn-openssl = "Saul Wold <sgw@linux.intel.com>"
 RECIPE_LATEST_VERSION_pn-openssl = "1.0.0c"
 RECIPE_NO_UPDATE_REASON_pn-openssl = "compatibility and stability concerns on new major release"
 RECIPE_INTEL_SECTION_pn-openssl = "base libs"
@@ -468,7 +468,7 @@ RECIPE_LATEST_RELEASE_DATE_pn-openssl = "12/2010"
 RECIPE_STATUS_pn-libnss-mdns = "green"
 DISTRO_PN_ALIAS_pn-libnss-mdns = "Meego=nss-mdns OpenSuSE=nss-mdns Ubuntu=nss-mdns Mandriva=nss_mdns Debian=nss-mdns"
 RECIPE_LAST_UPDATE_pn-libnss-mdns = "Jul 8, 2010"
-RECIPE_MAINTAINER_pn-libnss-mdns = "Qing He <qing.he@intel.com>"
+RECIPE_MAINTAINER_pn-libnss-mdns = "Saul Wold <sgw@linux.intel.com>"
 RECIPE_LATEST_VERSION_pn-libnss-mdns = "0.10"
 RECIPE_INTEL_SECTION_pn-libnss-mdns = "base libs"
 RECIPE_LATEST_RELEASE_DATE_pn-libnss-mdns = "05/2007"
@@ -482,7 +482,7 @@ RECIPE_LATEST_RELEASE_DATE_pn-ncurses = "11/2008"
 
 RECIPE_STATUS_pn-popt = "green"
 RECIPE_LAST_UPDATE_pn-popt = "Jul 5, 2010"
-RECIPE_MAINTAINER_pn-popt = "Qing He <qing.he@intel.com>"
+RECIPE_MAINTAINER_pn-popt = "Saul Wold <sgw@linux.intel.com>"
 RECIPE_LATEST_VERSION_pn-popt = "1.16"
 RECIPE_INTEL_SECTION_pn-popt = "base libs"
 RECIPE_LATEST_RELEASE_DATE_pn-popt = "05/2010"
@@ -499,7 +499,7 @@ RECIPE_COMMENTS_pn-sqlite3 = ""
 
 RECIPE_STATUS_pn-libpthread-stubs = "green"
 RECIPE_LAST_UPDATE_pn-libpthread-stubs = "Jul 6, 2010"
-RECIPE_MAINTAINER_pn-libpthread-stubs = "Qing He <qing.he@intel.com>"
+RECIPE_MAINTAINER_pn-libpthread-stubs = "Saul Wold <sgw@linux.intel.com>"
 RECIPE_DEPENDENCY_CHECK_pn-libpthread-stubs = "done"
 RECIPE_LATEST_VERSION_pn-libpthread-stubs = "0.3"
 RECIPE_INTEL_SECTION_pn-libpthread-stubs = "base libs"
@@ -509,14 +509,14 @@ RECIPE_COMMENTS_pn-libpthread-stubs = "0.1: 11/2006, 0.2: 09/2009, 0.3: 10/2009"
 
 RECIPE_STATUS_pn-attr = "yellow"   # the recipe is quite hacky
 RECIPE_LAST_UPDATE_pn-attr = "Jul 7, 2010"
-RECIPE_MAINTAINER_pn-attr = "Qing He <qing.he@intel.com>"
+RECIPE_MAINTAINER_pn-attr = "Saul Wold <sgw@linux.intel.com>"
 RECIPE_LATEST_VERSION_pn-attr = "2.4.44"
 RECIPE_INTEL_SECTION_pn-attr = "base libs"
 RECIPE_LATEST_RELEASE_DATE_pn-attr = "08/2009"
 
 RECIPE_STATUS_pn-libcap = "yellow"   # hand crafted Makefiles
 RECIPE_LAST_UPDATE_pn-libcap = "Jul 7, 2010"
-RECIPE_MAINTAINER_pn-libcap = "Qing He <qing.he@intel.com>"
+RECIPE_MAINTAINER_pn-libcap = "Saul Wold <sgw@linux.intel.com>"
 RECIPE_DEPENDENCY_CHECK_pn-libcap = "done"
 RECIPE_LATEST_VERSION_pn-libcap = "2.19"
 RECIPE_INTEL_SECTION_pn-libcap = "base libs"
@@ -542,7 +542,7 @@ RECIPE_LATEST_RELEASE_DATE_pn-libnfsidmap = "12/2010"
 
 RECIPE_STATUS_pn-acl = "yellow"   # hacky as attr
 RECIPE_LAST_UPDATE_pn-acl = "Jul 29, 2010"
-RECIPE_MAINTAINER_pn-acl = "Qing He <qing.he@intel.com>"
+RECIPE_MAINTAINER_pn-acl = "Saul Wold <sgw@linux.intel.com>"
 RECIPE_DEPENDENCY_CHECK_pn-acl = "done"
 RECIPE_LATEST_VERSION_pn-acl = "2.2.49"
 RECIPE_INTEL_SECTION_pn-acl = "base libs"
@@ -553,7 +553,7 @@ RECIPE_COMMENTS_pn-acl = ""
 RECIPE_STATUS_pn-tcp-wrappers = "yellow"    # custom build system
 RECIPE_DEPENDENCY_CHECK_pn-tcp-wrappers = "done"
 RECIPE_LAST_UPDATE_pn-tcp-wrappers = "Aug 11, 2010"
-RECIPE_MAINTAINER_pn-tcp-wrappers = "Qing He <qing.he@intel.com>"
+RECIPE_MAINTAINER_pn-tcp-wrappers = "Saul Wold <sgw@linux.intel.com>"
 RECIPE_LATEST_VERSION_pn-tcp-wrappers = "7.6"
 RECIPE_INTEL_SECTION_pn-tcp-wrappers = "base libs"
 RECIPE_TIME_BETWEEN_LAST_TWO_RELEASES_pn-tcp-wrappers = "n/a"
@@ -562,13 +562,13 @@ RECIPE_COMMENTS_pn-tcp-wrappers = ""
 
 RECIPE_STATUS_pn-libaio = "green"
 RECIPE_LAST_UPDATE_pn-libaio = "Aug 27, 2010"
-RECIPE_MAINTAINER_pn-libaio = "Qing He <qing.he@intel.com>"
+RECIPE_MAINTAINER_pn-libaio = "Saul Wold <sgw@linux.intel.com>"
 RECIPE_LATEST_VERSION_pn-libaio = "0.3.107"
 
 RECIPE_STATUS_pn-libcheck = "green"
 RECIPE_DEPENDENCY_CHECK_pn-libcheck = "done"
 RECIPE_LAST_UPDATE_pn-libcheck = "Aug 20, 2010"
-RECIPE_MAINTAINER_pn-libcheck = "Qing He <qing.he@intel.com>"
+RECIPE_MAINTAINER_pn-libcheck = "Saul Wold <sgw@linux.intel.com>"
 RECIPE_LATEST_VERSION_pn-libcheck = "0.9.8"
 RECIPE_INTEL_SECTION_pn-libcheck = "base libs"
 RECIPE_TIME_BETWEEN_LAST_TWO_RELEASES_pn-libcheck = "9 months"
@@ -1212,7 +1212,7 @@ RECIPE_MAINTAINER_pn-mtd-utils = "Dongxiao Xu <dongxiao.xu@intel.com>"
 RECIPE_STATUS_pn-procps = "red"
 RECIPE_LATEST_VERSION_pn-procps = "3.2.8"
 RECIPE_LAST_UPDATE_pn-procps = "Nov 10, 2010"
-RECIPE_MAINTAINER_pn-procps = "Qing He <qing.he@intel.com>"
+RECIPE_MAINTAINER_pn-procps = "Saul Wold <sgw@linux.intel.com>"
 
 RECIPE_STATUS_pn-iso-codes = "red"
 RECIPE_LATEST_VERSION_pn-iso-codes = "3.16"
@@ -1341,11 +1341,11 @@ RECIPE_INTEL_SECTION_pn-bzip2 = "base utils"
 RECIPE_TIME_BETWEEN_LAST_TWO_RELEASES_pn-bzip2 = "12 months"
 RECIPE_LATEST_RELEASE_DATE_pn-bzip2 = "03/2008"
 RECIPE_COMMENTS_pn-bzip2 = "bzip2 license is 3-clause BSD plus an renaming clause"
-RECIPE_MANUAL_CHECK_DATE_pn-zip = "May 24, 2011"
+RECIPE_MANUAL_CHECK_DATE_pn-bzip = "May 24, 2011"
 
 RECIPE_STATUS_pn-portmap = "yellow"
 RECIPE_LAST_UPDATE_pn-portmap = "Aug 27, 2007"
-RECIPE_MAINTAINER_pn-portmap = "Qing He <qing.he@intel.com>"
+RECIPE_MAINTAINER_pn-portmap = "Saul Wold <sgw@linux.intel.com>"
 RECIPE_DEPENDENCY_CHECK_pn-portmap = "not done"
 RECIPE_LATEST_VERSION_pn-portmap = "6.0"
 RECIPE_PATCH_pn-portmap+dest-dir-no-strip = "override default build method"
@@ -1367,7 +1367,7 @@ RECIPE_LATEST_RELEASE_DATE_pn-grub = "12/2005"
 
 RECIPE_STATUS_pn-update-rc.d = "green"
 RECIPE_LAST_UPDATE_pn-update-rc.d = "Jul 21, 2006"
-RECIPE_MAINTAINER_pn-update-rc.d = "Qing He <qing.he@intel.com>"
+RECIPE_MAINTAINER_pn-update-rc.d = "Saul Wold <sgw@linux.intel.com>"
 RECIPE_DEPENDENCY_CHECK_pn-update-rc.d = "not done"
 RECIPE_LATEST_VERSION_pn-update-rc.d = "0.7"
 RECIPE_PATCH_pn-update-rc.d+add-verbose = "add verbosity"
@@ -1378,7 +1378,7 @@ RECIPE_COMMENTS_pn-update-rc.d = ""
 
 RECIPE_STATUS_pn-update-modules = "green"
 RECIPE_LAST_UPDATE_pn-update-modules = "Jul 21, 2006"
-RECIPE_MAINTAINER_pn-update-modules = "Qing He <qing.he@intel.com>"
+RECIPE_MAINTAINER_pn-update-modules = "Saul Wold <sgw@linux.intel.com>"
 RECIPE_DEPENDENCY_CHECK_pn-update-modules = "not done"
 RECIPE_LATEST_VERSION_pn-update-modules = "1.0"
 RECIPE_PATCH_pn-update-modules+update-modules = "local file"
@@ -1402,7 +1402,7 @@ RECIPE_COMMENTS_pn-udev-extraconf = ""
 
 RECIPE_STATUS_pn-bash = "green"
 RECIPE_LAST_UPDATE_pn-bash = "Jun 17, 2010"
-RECIPE_MAINTAINER_pn-bash = "Qing He <qing.he@intel.com>"
+RECIPE_MAINTAINER_pn-bash = "Saul Wold <sgw@linux.intel.com>"
 RECIPE_DEPENDENCY_CHECK_pn-bash = "not done"
 RECIPE_LATEST_VERSION_pn-bash = "4.1"
 RECIPE_PATCH_pn-bash+upstream-patches = "upstream patches on source mirrors"
@@ -1413,7 +1413,7 @@ RECIPE_COMMENTS_pn-bash = ""
 
 RECIPE_STATUS_pn-syslinux = "yellow"    # need mangling on LDFLAGS
 RECIPE_LAST_UPDATE_pn-syslinux = "Nov 16, 2010"
-RECIPE_MAINTAINER_pn-syslinux = "Qing He <qing.he@intel.com>"
+RECIPE_MAINTAINER_pn-syslinux = "Saul Wold <sgw@linux.intel.com>"
 RECIPE_DEPENDENCY_CHECK_pn-syslinux = "not done"
 RECIPE_LATEST_VERSION_pn-syslinux = "3.86"
 RECIPE_PATCH_pn-syslinux+cross-build = "use poky toolchain instead of host"
@@ -1424,7 +1424,7 @@ RECIPE_COMMENTS_pn-syslinux = ""
 
 RECIPE_STATUS_pn-sysvinit = "green"
 RECIPE_LAST_UPDATE_pn-sysvinit = "Jun 18, 2010"
-RECIPE_MAINTAINER_pn-sysvinit = "Qing He <qing.he@intel.com>"
+RECIPE_MAINTAINER_pn-sysvinit = "Saul Wold <sgw@linux.intel.com>"
 RECIPE_DEPENDENCY_CHECK_pn-sysvinit = "not done"
 RECIPE_LATEST_VERSION_pn-sysvinit = "2.88dsf"
 RECIPE_PATCH_pn-sysvinit+install = "use poky environment variables"
@@ -1435,7 +1435,7 @@ RECIPE_COMMENTS_pn-sysvinit = ""
 
 RECIPE_STATUS_pn-sysfsutils = "green"
 RECIPE_LAST_UPDATE_pn-sysfsutils = "Jun 18, 2010"
-RECIPE_MAINTAINER_pn-sysfsutils = "Qing He <qing.he@intel.com>"
+RECIPE_MAINTAINER_pn-sysfsutils = "Saul Wold <sgw@linux.intel.com>"
 RECIPE_DEPENDENCY_CHECK_pn-sysfsutils = "not done"
 RECIPE_LATEST_VERSION_pn-sysfsutils = "2.1.0"
 RECIPE_INTEL_SECTION_pn-sysfsutils = "base utils"
@@ -1479,7 +1479,7 @@ RECIPE_LATEST_RELEASE_DATE_pn-elfutils="06/2010"
 
 RECIPE_STATUS_pn-pkgconfig = "green"
 RECIPE_LAST_UPDATE_pn-pkgconfig = "Jul 13, 2010"
-RECIPE_MAINTAINER_pn-pkgconfig = "Qing He <qing.he@intel.com>"
+RECIPE_MAINTAINER_pn-pkgconfig = "Saul Wold <sgw@linux.intel.com>"
 RECIPE_DEPENDENCY_CHECK_pn-pkgconfig = "not done"
 RECIPE_LATEST_VERSION_pn-pkgconfig = "0.25"
 RECIPE_INTEL_SECTION_pn-pkgconfig = "base utils"
@@ -1523,7 +1523,7 @@ RECIPE_COMMENTS_pn-findutils = ""
 
 RECIPE_STATUS_pn-file = "green"
 RECIPE_LAST_UPDATE_pn-file = "Jul 6, 2010"
-RECIPE_MAINTAINER_pn-file = "Qing He <qing.he@intel.com>"
+RECIPE_MAINTAINER_pn-file = "Saul Wold <sgw@linux.intel.com>"
 RECIPE_DEPENDENCY_CHECK_pn-file = "done"
 RECIPE_LATEST_VERSION_pn-file = "5.04"
 RECIPE_PATCH_pn-file+dump = "some new magic data"
@@ -1535,7 +1535,7 @@ RECIPE_COMMENTS_pn-file = "2-clause BSD"
 
 RECIPE_STATUS_pn-rsync = "green"
 RECIPE_LAST_UPDATE_pn-rsync = "Jul 6, 2010"
-RECIPE_MAINTAINER_pn-rsync = "Qing He <qing.he@intel.com>"
+RECIPE_MAINTAINER_pn-rsync = "Saul Wold <sgw@linux.intel.com>"
 RECIPE_DEPENDENCY_CHECK_pn-rsync = "done"
 RECIPE_LATEST_VERSION_pn-rsync = "3.0.7"
 RECIPE_PATCH_pn-rsync+rsyncd.conf = "init script"
@@ -1605,7 +1605,7 @@ RECIPE_COMMENTS_pn-avahi = ""
 
 RECIPE_STATUS_pn-js = "yellow"    # may not work for platforms other than 32bit x86
 RECIPE_LAST_UPDATE_pn-js = "Jul 5, 2010"
-RECIPE_MAINTAINER_pn-js = "Qing He <qing.he@intel.com>"
+RECIPE_MAINTAINER_pn-js = "Saul Wold <sgw@linux.intel.com>"
 RECIPE_DEPENDENCY_CHECK_pn-js = "not done"
 RECIPE_LATEST_VERSION_pn-js = "1.7.0+1.8.0rc1"
 RECIPE_PATCH_pn-js+usepic = "get around broken PIC test for cross compiling"
@@ -1630,7 +1630,7 @@ RECIPE_COMMENTS_pn-pcmciautils = ""
 
 RECIPE_STATUS_pn-unzip = "green"
 RECIPE_LAST_UPDATE_pn-unzip = "Jul 5, 2010"
-RECIPE_MAINTAINER_pn-unzip = "Qing He <qing.he@intel.com>"
+RECIPE_MAINTAINER_pn-unzip = "Saul Wold <sgw@linux.intel.com>"
 RECIPE_DEPENDENCY_CHECK_pn-unzip = "not done"
 RECIPE_LATEST_VERSION_pn-unzip = "6.0"
 RECIPE_INTEL_SECTION_pn-unzip = "base utils"
@@ -1641,7 +1641,7 @@ RECIPE_COMMENTS_pn-unzip = "5.52 has a race condition vulnerability for Unix ver
 
 RECIPE_STATUS_pn-zip = "green"
 RECIPE_LAST_UPDATE_pn-zip = "Jul 6, 2010"
-RECIPE_MAINTAINER_pn-zip = "Qing He <qing.he@intel.com>"
+RECIPE_MAINTAINER_pn-zip = "Saul Wold <sgw@linux.intel.com>"
 RECIPE_DEPENDENCY_CHECK_pn-zip = "not done"
 RECIPE_LATEST_VERSION_pn-zip = "3.0"
 RECIPE_INTEL_SECTION_pn-zip = "base utils"
@@ -1662,7 +1662,7 @@ RECIPE_COMMENTS_pn-strace = "3-clause BSD"
 
 RECIPE_STATUS_pn-dhcp = "green"
 RECIPE_LAST_UPDATE_pn-dhcp = "Nov 17, 2010"
-RECIPE_MAINTAINER_pn-dhcp = "Qing He <qing.he@intel.com>"
+RECIPE_MAINTAINER_pn-dhcp = "Saul Wold <sgw@linux.intel.com>"
 RECIPE_LATEST_VERSION_pn-dhcp = "4.2.0-P2"
 RECIPE_INTEL_SECTION_pn-dhcp = "base utils"
 RECIPE_LATEST_RELEASE_DATE_pn-dhcp = "12/2010"
@@ -1670,7 +1670,7 @@ RECIPE_COMMENTS_pn-dhcp = "several major release, others are 3.1.3, 4.0.2-P1, ne
 
 RECIPE_STATUS_pn-v86d = "yellow"   # self written configure
 RECIPE_LAST_UPDATE_pn-udev = "Jul 6, 2010"
-RECIPE_MAINTAINER_pn-v86d = "Qing He <qing.he@intel.com>"
+RECIPE_MAINTAINER_pn-v86d = "Saul Wold <sgw@linux.intel.com>"
 RECIPE_DEPENDENCY_CHECK_pn-v86d = "not done"
 RECIPE_LATEST_VERSION_pn-v86d = "0.1.9"
 RECIPE_PATCH_pn-v86d+fbsetup = "init script"
@@ -1731,7 +1731,7 @@ RECIPE_LATEST_RELEASE_DATE_pn-shared-mime-info = "02/2010"
 
 RECIPE_STATUS_pn-util-linux = "green"
 RECIPE_LAST_UPDATE_pn-util-linux = "May 24, 2011"
-RECIPE_MAINTAINER_pn-util-linux = "Qing He <qing.he@intel.com>"
+RECIPE_MAINTAINER_pn-util-linux = "Saul Wold <sgw@linux.intel.com>"
 RECIPE_LATEST_VERSION_pn-util-linux = "2.19.1"
 RECIPE_INTEL_SECTION_pn-util-linux = "base utils"
 RECIPE_LATEST_RELEASE_DATE_pn-util-linux = "May 2, 2011"
@@ -1739,7 +1739,7 @@ RECIPE_MANUAL_CHECK_DATE_pn-util-linux = "May 24, 2011"
 
 RECIPE_STATUS_pn-usbutils = "green"
 RECIPE_LAST_UPDATE_pn-usbutils = "May 20, 2011"
-RECIPE_MAINTAINER_pn-usbutils = "Qing He <qing.he@intel.com>"
+RECIPE_MAINTAINER_pn-usbutils = "Saul Wold <sgw@linux.intel.com>"
 RECIPE_DEPENDENCY_CHECK_pn-usbutils = "done"
 RECIPE_LATEST_VERSION_pn-usbutils = "0.91"
 RECIPE_INTEL_SECTION_pn-usbutils = "base utils"
@@ -1783,13 +1783,13 @@ RECIPE_COMMENTS_pn-zypper = ""
 
 RECIPE_STATUS_pn-sysstat = "green"
 RECIPE_LAST_UPDATE_pn-sysstat = "May 24, 2011"
-RECIPE_MAINTAINER_pn-sysstat = "Qing He <qing.he@intel.com>"
+RECIPE_MAINTAINER_pn-sysstat = "Saul Wold <sgw@linux.intel.com>"
 RECIPE_LATEST_VERSION_pn-sysstat = "10.0.0"
 RECIPE_MANUAL_CHECK_DATE_pn-sysstat = "May 24, 2011"
 
 RECIPE_STATUS_pn-sysklogd = "red"    # need upgrade
 RECIPE_LAST_UPDATE_pn-sysklogd = "Aug 27, 2010"
-RECIPE_MAINTAINER_pn-sysklogd = "Qing He <qing.he@intel.com>"
+RECIPE_MAINTAINER_pn-sysklogd = "Saul Wold <sgw@linux.intel.com>"
 RECIPE_LATEST_VERSION_pn-sysklogd = "1.5"
 
 RECIPE_STATUS_pn-gawk = "red"    # need upgrade
@@ -1845,7 +1845,7 @@ RECIPE_MAINTAINER_pn-parted = "Qing He <qing.he@intel.com>"
 RECIPE_STATUS_pn-resolvconf = "green"
 RECIPE_LATEST_VERSION_pn-resolvconf = "1.48"
 RECIPE_LAST_UPDATE_pn-resolvconf = "Jan 20, 2011"
-RECIPE_MAINTAINER_pn-resolvconf = "Qing He <qing.he@intel.com>"
+RECIPE_MAINTAINER_pn-resolvconf = "Saul Wold <sgw@linux.intel.com>"
 
 RECIPE_STATUS_pn-openswan = "red"
 RECIPE_LATEST_VERSION_pn-openswan = "2.6.26"
@@ -1867,15 +1867,15 @@ RECIPE_MAINTAINER_pn-zaurusd = "Qing He <qing.he@intel.com>"
 RECIPE_MANUAL_CHECK_DATE_pn-zip = "May 24, 2011"
 
 RECIPE_STATUS_pn-yaffs2-utils = "red"
-RECIPE_LATEST_VERSION_pn-yaffs2-utils = ""
+RECIPE_LATEST_VERSION_pn-yaffs2-utils = "HEAD"
 RECIPE_LAST_UPDATE_pn-yaffs2-utils = "Nov 7, 2007"
-RECIPE_MAINTAINER_pn-yaffs2-utils = "Qing He <qing.he@intel.com>"
+RECIPE_MAINTAINER_pn-yaffs2-utils = "Saul Wold <sgw@linux.intel.com>"
 DISTRO_PN_ALIAS_pn-yaffs2-utils = "OSPDT upstream=http://www.yaffs.net"
 
 RECIPE_STATUS_pn-usbinit = "red"
 RECIPE_LATEST_VERSION_pn-usbinit = "n/a"
 DISTRO_PN_ALIAS_pn-usbinit = "OE-Core"
-RECIPE_MAINTAINER_pn-usbinit = "Qing He <qing.he@intel.com>"
+RECIPE_MAINTAINER_pn-usbinit = "Saul Wold <sgw@linux.intel.com>"
 
 RECIPE_STATUS_pn-ubootchart = "red"
 RECIPE_LATEST_VERSION_pn-ubootchart = "0.0+r12"
@@ -1886,12 +1886,12 @@ DISTRO_PN_ALIAS_pn-ubootchart = "OSPDT upstream=http://code.google.com/p/ubootch
 RECIPE_STATUS_pn-tiff = "red"
 RECIPE_LATEST_VERSION_pn-tiff = "3.9.4"
 RECIPE_LAST_UPDATE_pn-tiff = "Aug 25, 2008"
-RECIPE_MAINTAINER_pn-tiff = "Qing He <qing.he@intel.com>"
+RECIPE_MAINTAINER_pn-tiff = "Saul Wold <sgw@linux.intel.com>"
 
 RECIPE_STATUS_pn-libexif = "red"
 RECIPE_LATEST_VERSION_pn-libexif = "0.6.19"
 RECIPE_LAST_UPDATE_pn-libexif = "Nov 22, 2010"
-RECIPE_MAINTAINER_pn-libexif = "Qing He <qing.he@intel.com>"
+RECIPE_MAINTAINER_pn-libexif = "Saul Wold <sgw@linux.intel.com>"
 
 RECIPE_STATUS_pn-setserial = "red"
 RECIPE_LATEST_VERSION_pn-setserial = "2.17"
@@ -1906,7 +1906,7 @@ RECIPE_MAINTAINER_pn-hdparm = "Qing He <qing.he@intel.com>"
 RECIPE_STATUS_pn-wbxml2 = "red"
 RECIPE_LATEST_VERSION_pn-wbxml2 = "0.10.8"
 RECIPE_LAST_UPDATE_pn-wbxml2 = "Jan 3, 2007"
-RECIPE_MAINTAINER_pn-wbxml2 = "Qing He <qing.he@intel.com>"
+RECIPE_MAINTAINER_pn-wbxml2 = "Saul Wold <sgw@linux.intel.com>"
 
 RECIPE_STATUS_pn-qemu-config = "red"
 RECIPE_LATEST_VERSION_pn-qemu-config = "1.0"
@@ -5521,11 +5521,9 @@ RECIPE_STATUS_pn-libsync = "red"
 DISTRO_PN_ALIAS_pn-libsync = "OSPDT"
 RECIPE_STATUS_pn-cross-localedef = "red"
 DISTRO_PN_ALIAS_pn-cross-localedef = "OSPDT"
-RECIPE_STATUS_pn-alsa-tools = "red"
 RECIPE_STATUS_pn-desktop-file-utils-native = "red"
 RECIPE_STATUS_pn-dtc = "red"
 RECIPE_STATUS_pn-gcalctool = "red"
-RECIPE_STATUS_pn-gettext = "red"
 RECIPE_STATUS_pn-swabber = "red"
 RECIPE_STATUS_pn-mc = "red"
 RECIPE_STATUS_pn-man = "red"
@@ -5571,7 +5569,6 @@ RECIPE_LATEST_VERSION_pn-lsbsetup = "0.9"
 RECIPE_MANUAL_CHECK_DATE_pn-lsbsetup = "Jan 17, 2011"
 RECIPE_LATEST_VERSION_pn-libxml-simple-perl = "2.18"
 RECIPE_LATEST_VERSION_pn-talloc = "2.0.5"
-RECIPE_LATEST_VERSION_pn-mesa-demos = "8.0.1"
 RECIPE_LATEST_VERSION_pn-libtool-cross = "2.4"
 RECIPE_STATUS_pn-gthumb = "red"
 RECIPE_LATEST_VERSION_pn-gthumb = "2.12.2"
@@ -5592,7 +5589,6 @@ RECIPE_LATEST_VERSION_pn-texinfo = "4.13a"
 RECIPE_NO_UPDATE_REASON_pn-texinfo = "Checking script parse directory wrong"
 RECIPE_MANUAL_CHECK_DATE_pn-texinfo = "Feb 28, 2011"
 
-RECIPE_LATEST_VERSION_pn-yaffs2-utils = "HEAD"
 RECIPE_LATEST_VERSION_pn-blktrace = "a788dfde86dfaff8f1c277a233f92c1822e06b76"
 RECIPE_LATEST_VERSION_pn-dtc = "37c0b6a0916c31a5eae0a9ddfcc5d0b8fb4569c6"
 RECIPE_LATEST_VERSION_pn-bind = "9.7.2-P3"
@@ -5701,19 +5697,19 @@ RECIPE_LAST_UPDATE_pn-linuxdoc-tools = "Feb 25, 2011"
 RECIPE_MAINTAINER_pn-linuxdoc-tools = "Scott Garman <scott.a.garman@intel.com>"
 
 RECIPE_STATUS_pn-slang = "green"
-RECIPE_LATEST_VERSION_pn-slang = "2.2.3"
-RECIPE_LAST_UPDATE_pn-slang = "Feb 25, 2011"
-RECIPE_MANUAL_CHECK_DATE_pn-slang = "Apr 6, 2011"
+RECIPE_LATEST_VERSION_pn-slang = "2.2.4"
+RECIPE_LAST_UPDATE_pn-slang = "Apr 10, 2011"
+RECIPE_MANUAL_CHECK_DATE_pn-slang = "June 6, 2011"
 
 RECIPE_STATUS_pn-libnewt = "green"
-RECIPE_LATEST_VERSION_pn-libnewt = "2.2.3"
-RECIPE_LAST_UPDATE_pn-libnewt = "Feb 25, 2011"
-RECIPE_MANUAL_CHECK_DATE_pn-libnewt = "May 24, 2011"
-RECIPE_NO_UPDATE_REASON_pn-libnewt = "fedora hosted version is at 0.52.12"
+RECIPE_LATEST_VERSION_pn-libnewt = "0.52.12"
+RECIPE_LAST_UPDATE_pn-libnewt = "Aug 06, 2010"
+RECIPE_MANUAL_CHECK_DATE_pn-libnewt = "June 4, 2011"
+RECIPE_NO_UPDATE_REASON_pn-libnewt = ""
 
 RECIPE_STATUS_pn-createrepo = "green"
 RECIPE_LATEST_VERSION_pn-createrepo = "0.9.9"
-RECIPE_MAINTAINER_pn-createrepo = "Qing He <qing.he@intel.com>"
+RECIPE_MAINTAINER_pn-createrepo = "Saul Wold <sgw@linux.intel.com>"
 RECIPE_LAST_UPDATE_pn-createrepo = "Apr 6, 2011"
 RECIPE_NO_UPDATE_REASON_pn-createrepo = "Versions after 0.9.* use YUM, so we hold at 0.4.11"
 
@@ -5740,4 +5736,17 @@ RECIPE_COMMENTS_pn-rxvt-unicode = ""
 RECIPE_LAST_UPDATE_pn-rxvt-unicode = "May 25, 2011"
 RECIPE_MAINTAINER_pn-rxvt-unicode = "Saul Wold <sgw@linux.intel.com>"
 
+RECIPE_STATUS_pn-alsa-tools = "red"
+RECIPE_LATEST_VERIONS_pn-alsa-tools = "1.0.24.1
+RECIPE_LAST_UPDATE_pn-alsa-tools = "Jan 31, 2011"
+RECIPE_MANUAL_CHECK_DATE_pn-alsa-tools = "June 7, 2011" 
 
+RECIPE_STATUS_pn-mesa-demos = "red"
+RECIPE_LATEST_VERSION_pn-mesa-demos = "8.0.1"
+RECIPE_LAST_UPDATE_pn-mesa-demos = "July 13, 2010"
+RECIPE_MANUAL_CHECK_DATE_pn-mesa-demos = "June 7, 2011" 
+
+RECIPE_STATUS_pn-gettext = "red"
+RECIPE_LATEST_VERSION_pn-gettext = "0.18.1.1"
+RECIPE_LAST_UPDATE_pn-gettext = "June 6, 2010"
+RECIPE_MANUAL_CHECK_DATE_pn-gettext = "June 7, 2011" 
-- 
1.7.3.4



