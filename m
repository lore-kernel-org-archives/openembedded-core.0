Received: from mga01.intel.com ([192.55.52.88])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <sgw@linux.intel.com>) id 1RVWm5-0001PH-OB
	for openembedded-core@openembedded.org; Wed, 30 Nov 2011 00:07:43 +0100
Received: from fmsmga002.fm.intel.com ([10.253.24.26])
	by fmsmga101.fm.intel.com with ESMTP; 29 Nov 2011 15:00:34 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="4.69,594,1315206000"; d="scan'208";a="96720820"
Received: from unknown (HELO swold-mobl.bigsur.com) ([10.255.15.251])
	by fmsmga002.fm.intel.com with ESMTP; 29 Nov 2011 15:00:33 -0800
From: Saul Wold <sgw@linux.intel.com>
To: openembedded-core@openembedded.org
Date: Tue, 29 Nov 2011 15:00:26 -0800
Message-Id: <327dc8994dc51c86b89e80f4ef91f10e1f361763.1322607016.git.sgw@linux.intel.com>
X-Mailer: git-send-email 1.7.6.4
In-Reply-To: <cover.1322607016.git.sgw@linux.intel.com>
References: <cover.1322607016.git.sgw@linux.intel.com>
In-Reply-To: <cover.1322607016.git.sgw@linux.intel.com>
References: <cover.1322607016.git.sgw@linux.intel.com>
Subject: [PATCH 26/26] Distro Tracking: Update Ownership and Update Dates
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
X-List-Received-Date: Tue, 29 Nov 2011 23:07:43 -0000

Signed-off-by: Saul Wold <sgw@linux.intel.com>
---
 .../conf/distro/include/distro_tracking_fields.inc |  282 ++++++++++----------
 1 files changed, 146 insertions(+), 136 deletions(-)

diff --git a/meta/conf/distro/include/distro_tracking_fields.inc b/meta/conf/distro/include/distro_tracking_fields.inc
index c07341e..9facae7 100644
--- a/meta/conf/distro/include/distro_tracking_fields.inc
+++ b/meta/conf/distro/include/distro_tracking_fields.inc
@@ -164,7 +164,7 @@ RECIPE_TIME_BETWEEN_LAST_TWO_RELEASES_pn-libdaemon = "15 months"
 RECIPE_LATEST_RELEASE_DATE_pn-libdaemon = "Nov 01, 2009"
 RECIPE_COMMENTS_pn-libdaemon = ""
 RECIPE_LAST_UPDATE_pn-libdaemon = "Jun 23, 2010"
-RECIPE_MAINTAINER_pn-libdaemon = "Yu Ke <ke.yu@intel.com>"
+RECIPE_MAINTAINER_pn-libdaemon = "Saul Wold <sgw@linux.intel.com>"
 
 RECIPE_STATUS_pn-glib-2.0 = "green"
 DISTRO_PN_ALIAS_pn-glib-2.0 = "Meego=glib2 Fedora=glib2 OpenSuSE=glib2 Ubuntu=glib2.0 Mandriva=glib2.0 Debian=glib2.0"
@@ -276,7 +276,7 @@ RECIPE_TIME_BETWEEN_LAST_TWO_RELEASES_pn-libidn = "3 months"
 RECIPE_LATEST_RELEASE_DATE_pn-libidn = "May 01, 2010"
 RECIPE_COMMENTS_pn-libidn = ""
 RECIPE_LAST_UPDATE_pn-libidn = "Jul 20, 2010"
-RECIPE_MAINTAINER_pn-libidn = "Yu Ke <ke.yu@intel.com>"
+RECIPE_MAINTAINER_pn-libidn = "Saul Wold <sgw@linux.intel.com>"
 
 RECIPE_STATUS_pn-glibc = "green"
 RECIPE_DEPENDENCY_CHECK_pn-glibc = "not done"
@@ -336,11 +336,11 @@ RECIPE_MANUAL_CHECK_DATE_pn-libtirpc = "Nov 22, 2011"
 RECIPE_MAINTAINER_pn-libtirpc = "Dongxiao Xu <dongxiao.xu@intel.com>"
 
 RECIPE_STATUS_pn-gdbm = "green"
-RECIPE_LAST_UPDATE_pn-gdbm = "Jul 21, 2006"
-RECIPE_MAINTAINER_pn-gdbm = "Yu Ke <ke.yu@intel.com>"
-RECIPE_LATEST_VERSION_pn-gdbm = "1.8.3"
+RECIPE_LATEST_VERSION_pn-gdbm = "1.10"
+RECIPE_LATEST_RELEASE_DATE_pn-gdbm = "Nov 13, 2011"
+RECIPE_LAST_UPDATE_pn-gdbm = "Nov 28, 2011"
+RECIPE_MAINTAINER_pn-gdbm = "Saul Wold <sgw@linux.intel.com>"
 RECIPE_INTEL_SECTION_pn-gdbm = "base libs"
-RECIPE_LATEST_RELEASE_DATE_pn-gdbm = "Oct 01, 2002"
 
 RECIPE_STATUS_pn-pth = "yellow"    # custom do_configure
 RECIPE_LAST_UPDATE_pn-pth = "Mar 14, 2008"
@@ -440,10 +440,10 @@ RECIPE_COMMENTS_pn-libgcrypt = ""
 RECIPE_MANUAL_CHECK_DATE_pn-libgcrypt = "Nov 23, 2011"
 
 RECIPE_STATUS_pn-gnutls = "yellow"   # need explict pre configure
-RECIPE_LATEST_VERSION_pn-gnutls = "2.12.11"
-RECIPE_LATEST_RELEASE_DATE_pn-gnutls = "Sep 18, 2011"
-RECIPE_LAST_UPDATE_pn-gnutls = "Oct 6, 2011"
-RECIPE_MAINTAINER_pn-gnutls = "Yu Ke <ke.yu@intel.com>"
+RECIPE_LATEST_VERSION_pn-gnutls = "2.12.14"
+RECIPE_LATEST_RELEASE_DATE_pn-gnutls = "Nov 08, 2011"
+RECIPE_LAST_UPDATE_pn-gnutls = "Nov 28, 2011"
+RECIPE_MAINTAINER_pn-gnutls = "Saul Wold <sgw@linux.intel.com>"
 RECIPE_DEPENDENCY_CHECK_pn-gnutls = "done"
 RECIPE_PATCH_pn-gnutls+gnutls-openssl = "unkown"
 RECIPE_PATCH_pn-gnutls+gnutls-texinfo-euro = "fix if @euro is missing in texinfo"
@@ -460,23 +460,23 @@ RECIPE_INTEL_SECTION_pn-lzo = "base libs"
 RECIPE_LATEST_RELEASE_DATE_pn-lzo = "Oct 01, 2010"
 
 RECIPE_STATUS_pn-libtasn1 = "green"
-RECIPE_LATEST_VERSION_pn-libtasn1 = "2.10"
-RECIPE_LATEST_RELEASE_DATE_pn-libtasn1 = "Oct 25, 2011"
-RECIPE_LAST_UPDATE_pn-libtasn1 = "Nov 08, 2011"
+RECIPE_LATEST_VERSION_pn-libtasn1 = "2.11"
+RECIPE_LATEST_RELEASE_DATE_pn-libtasn1 = "Nov 24, 2011"
+RECIPE_LAST_UPDATE_pn-libtasn1 = "Nov 28, 2011"
 RECIPE_MAINTAINER_pn-libtasn1 = "Saul Wold <sgw@linux.intel.com>"
 RECIPE_DEPENDENCY_CHECK_pn-libtasn1 = "not done"
 RECIPE_INTEL_SECTION_pn-libtasn1 = "base libs"
 RECIPE_TIME_BETWEEN_LAST_TWO_RELEASES_pn-libtasn1 = "1 month"
 RECIPE_COMMENTS_pn-libtasn1 = ""
-RECIPE_MANUAL_CHECK_DATE_pn-libtasn1 = "Nov 08, 2011"
+RECIPE_MANUAL_CHECK_DATE_pn-libtasn1 = "Nov 29, 2011"
 
 RECIPE_STATUS_pn-openssl = "green"
-RECIPE_LAST_UPDATE_pn-openssl = "Nov 17, 2010"
+RECIPE_LATEST_VERSION_pn-openssl = "1.0.0e"
+RECIPE_LATEST_RELEASE_DATE_pn-openssl = "Sep 06, 2010"
+RECIPE_LAST_UPDATE_pn-openssl = "Nov 28, 2011"
 RECIPE_MAINTAINER_pn-openssl = "Saul Wold <sgw@linux.intel.com>"
-RECIPE_LATEST_VERSION_pn-openssl = "1.0.0c"
 RECIPE_NO_UPDATE_REASON_pn-openssl = "compatibility and stability concerns on new major release"
 RECIPE_INTEL_SECTION_pn-openssl = "base libs"
-RECIPE_LATEST_RELEASE_DATE_pn-openssl = "Dec 01, 2010"
 
 RECIPE_STATUS_pn-libnss-mdns = "green"
 DISTRO_PN_ALIAS_pn-libnss-mdns = "Meego=nss-mdns OpenSuSE=nss-mdns Ubuntu=nss-mdns Mandriva=nss_mdns Debian=nss-mdns"
@@ -503,7 +503,7 @@ RECIPE_LATEST_RELEASE_DATE_pn-popt = "May 01, 2010"
 
 RECIPE_STATUS_pn-sqlite3 = "green"   # need upgrade
 RECIPE_LAST_UPDATE_pn-sqlite3 = "Nov 24, 2010"
-RECIPE_MAINTAINER_pn-sqlite3 = "Yu Ke <ke.yu@intel.com>"
+RECIPE_MAINTAINER_pn-sqlite3 = "Saul Wold <sgw@linux.intel.com>"
 RECIPE_DEPENDENCY_CHECK_pn-sqlite3 = "not done"
 RECIPE_LATEST_VERSION_pn-sqlite3 = "3.7.7.1"
 RECIPE_INTEL_SECTION_pn-sqlite3 = "base libs"
@@ -659,7 +659,7 @@ RECIPE_TIME_BETWEEN_LAST_TWO_RELEASES_pn-initramfs-boot = "n/a"
 RECIPE_LATEST_RELEASE_DATE_pn-initramfs-boot = "n/a"
 RECIPE_COMMENTS_pn-initramfs-boot = "local scripts follow OE-Core's MIT license"
 RECIPE_LAST_UPDATE_pn-initramfs-boot = "Nov 5, 2008"
-RECIPE_MAINTAINER_pn-initramfs-boot = "Yu Ke <ke.yu@intel.com>"
+RECIPE_MAINTAINER_pn-initramfs-boot = "Saul Wold <sgw@linux.intel.com>"
 
 RECIPE_STATUS_pn-initramfs-live-boot = "green"
 RECIPE_DEPENDENCY_CHECK_pn-initramfs-live-boot = "not done"
@@ -670,7 +670,7 @@ RECIPE_TIME_BETWEEN_LAST_TWO_RELEASES_pn-initramfs-live-boot = "n/a"
 RECIPE_LATEST_RELEASE_DATE_pn-initramfs-live-boot = "n/a"
 RECIPE_COMMENTS_pn-initramfs-live-boot = "local scripts follow OE-Core's MIT license"
 RECIPE_LAST_UPDATE_pn-initramfs-live-boot = "Sep 10, 2008"
-RECIPE_MAINTAINER_pn-initramfs-live-boot = "Yu Ke <ke.yu@intel.com>"
+RECIPE_MAINTAINER_pn-initramfs-live-boot = "Saul Wold <sgw@linux.intel.com>"
 
 RECIPE_STATUS_pn-initramfs-live-install = "green"
 RECIPE_DEPENDENCY_CHECK_pn-initramfs-live-install = "not done"
@@ -681,7 +681,7 @@ RECIPE_TIME_BETWEEN_LAST_TWO_RELEASES_pn-initramfs-live-install = "n/a"
 RECIPE_LATEST_RELEASE_DATE_pn-initramfs-live-install = "n/a"
 RECIPE_COMMENTS_pn-initramfs-live-install = "local scripts follow OE-Core's MIT license"
 RECIPE_LAST_UPDATE_pn-initramfs-live-install = "Oct 8, 2008"
-RECIPE_MAINTAINER_pn-initramfs-live-install = "Yu Ke <ke.yu@intel.com>"
+RECIPE_MAINTAINER_pn-initramfs-live-install = "Saul Wold <sgw@linux.intel.com>"
 
 RECIPE_STATUS_pn-initscripts = "green"
 RECIPE_DEPENDENCY_CHECK_pn-initscripts = "not done"
@@ -692,7 +692,7 @@ RECIPE_TIME_BETWEEN_LAST_TWO_RELEASES_pn-initscripts = "n/a"
 RECIPE_LATEST_RELEASE_DATE_pn-initscripts = "n/a"
 RECIPE_COMMENTS_pn-initscripts = "local scripts follow OE-Core's MIT license"
 RECIPE_LAST_UPDATE_pn-initscripts = "Jul 21, 2006"
-RECIPE_MAINTAINER_pn-initscripts = "Yu Ke <ke.yu@intel.com>"
+RECIPE_MAINTAINER_pn-initscripts = "Saul Wold <sgw@linux.intel.com>"
 
 RECIPE_STATUS_pn-keymaps = "green" 
 RECIPE_DEPENDENCY_CHECK_pn-keymaps = "not done"
@@ -703,7 +703,7 @@ RECIPE_TIME_BETWEEN_LAST_TWO_RELEASES_pn-keymaps = "n/a"
 RECIPE_LATEST_RELEASE_DATE_pn-keymaps = "n/a"
 RECIPE_COMMENTS_pn-keymaps = "local scripts follow OE-Core's MIT license, however it contains a GPL notation"
 RECIPE_LAST_UPDATE_pn-keymaps = "Jul 21, 2006"
-RECIPE_MAINTAINER_pn-keymaps = "Yu Ke <ke.yu@intel.com>"
+RECIPE_MAINTAINER_pn-keymaps = "Saul Wold <sgw@linux.intel.com>"
 
 RECIPE_STATUS_pn-modutils-initscripts = "green"
 RECIPE_DEPENDENCY_CHECK_pn-modutils-initscripts = "not done"
@@ -713,7 +713,7 @@ RECIPE_INTEL_SECTION_pn-modutils-initscripts = "base utils"
 RECIPE_TIME_BETWEEN_LAST_TWO_RELEASES_pn-modutils-initscripts = "n/a"
 RECIPE_LATEST_RELEASE_DATE_pn-modutils-initscripts = "n/a"
 RECIPE_COMMENTS_pn-modutils-initscripts = "local scripts follow OE-Core's MIT license"
-RECIPE_MAINTAINER_pn-modutils-initscripts = "Yu Ke <ke.yu@intel.com>"
+RECIPE_MAINTAINER_pn-modutils-initscripts = "Saul Wold <sgw@linux.intel.com>"
 
 RECIPE_STATUS_pn-opkg-collateral = "green" 
 RECIPE_DEPENDENCY_CHECK_pn-opkg-collateral = "not done"
@@ -898,7 +898,7 @@ RECIPE_TIME_BETWEEN_LAST_TWO_RELEASES_pn-module-init-tools = "3 months"
 RECIPE_LATEST_RELEASE_DATE_pn-module-init-tools = "Oct 01, 2009"
 RECIPE_COMMENTS_pn-module-init-tools = "most tweaks about alternative handle and rename"
 RECIPE_LAST_UPDATE_pn-module-init-tools = "Jul 21, 2010"
-RECIPE_MAINTAINER_pn-module-init-tools = "Yu Ke <ke.yu@intel.com>"
+RECIPE_MAINTAINER_pn-module-init-tools = "Saul Wold <sgw@linux.intel.com>"
 
 RECIPE_STATUS_pn-base-files = "green"
 RECIPE_DEPENDENCY_CHECK_pn-base-files = "not done"
@@ -908,7 +908,7 @@ RECIPE_TIME_BETWEEN_LAST_TWO_RELEASES_pn-base-files = "n/a"
 RECIPE_LATEST_RELEASE_DATE_pn-base-files = "n/a"
 RECIPE_COMMENTS_pn-base-files = "licenses are pacakges here; all local files. RP said that the version 3.0.14 may come from debian. no need to upgrade it now"
 RECIPE_LAST_UPDATE_pn-base-files = "Jul 21, 2006"
-RECIPE_MAINTAINER_pn-base-files = "Yu Ke <ke.yu@intel.com>"
+RECIPE_MAINTAINER_pn-base-files = "Saul Wold <sgw@linux.intel.com>"
 
 RECIPE_STATUS_pn-base-passwd = "green"
 RECIPE_DEPENDENCY_CHECK_pn-base-passwd = "not done"
@@ -1161,9 +1161,10 @@ RECIPE_LAST_UPDATE_pn-libatomics-ops = "Jun 4, 2011"
 RECIPE_MAINTAINER_pn-libatomics-ops = "Scott Garman <scott.a.garman@intel.com>"
 
 RECIPE_STATUS_pn-libffi  = "red"
-RECIPE_LATEST_VERSION_pn-libffi  = "3.0.9"
-RECIPE_LAST_UPDATE_pn-libffi = "Oct 15, 2010"
-RECIPE_MAINTAINER_pn-libffi  = "Yu Ke <ke.yu@intel.com>"
+RECIPE_LATEST_VERSION_pn-libffi  = "3.0.10"
+RECIPE_LATEST_RELEASE_DATE_pn-libffi = "Aug 23, 2011"
+RECIPE_LAST_UPDATE_pn-libffi = "Nov 29, 2011"
+RECIPE_MAINTAINER_pn-libffi  = "Saul Wold <sgw@linux.intel.com>"
 
 RECIPE_STATUS_pn-libgdbus = "green"
 RECIPE_DEPENDENCY_CHECK_pn-libgdbus = "not done"
@@ -1232,7 +1233,7 @@ RECIPE_MAINTAINER_pn-insserv = "Scott Garman <scott.a.garman@intel.com>"
 
 RECIPE_STATUS_pn-modutils-collateral = "red"
 RECIPE_LATEST_VERSION_pn-modutils-collateral = "1.0"
-RECIPE_MAINTAINER_pn-modutils-collateral = "Yu Ke <ke.yu@intel.com>"
+RECIPE_MAINTAINER_pn-modutils-collateral = "Saul Wold <sgw@linux.intel.com>"
 
 RECIPE_STATUS_pn-mtd-utils = "green"
 RECIPE_DEPENDENCY_CHECK_pn-mtd-utils = "not done"
@@ -1268,7 +1269,7 @@ RECIPE_MAINTAINER_pn-beecrypt = "Zhai Edwin <edwin.zhai@intel.com>"
 RECIPE_STATUS_pn-libacpi = "red"
 RECIPE_LATEST_VERSION_pn-libacpi = "0.2"
 RECIPE_LAST_UPDATE_pn-libacpi = "Sep 30, 2008"
-RECIPE_MAINTAINER_pn-libacpi = "Yu Ke <ke.yu@intel.com>"
+RECIPE_MAINTAINER_pn-libacpi = "Saul Wold <sgw@linux.intel.com>"
 DISTRO_PN_ALIAS_pn-libacpi="Ubuntu=libacpi Mandriva=libacpi"
 
 RECIPE_STATUS_pn-acpid = "green"
@@ -1285,7 +1286,7 @@ RECIPE_MAINTAINER_pn-consolekit = "Zhai Edwin <edwin.zhai@intel.com>"
 RECIPE_STATUS_pn-console-tools = "red"
 RECIPE_LATEST_VERSION_pn-console-tools = "0.3.2"
 RECIPE_LAST_UPDATE_pn-console-tools = "Jul 21, 2006"
-RECIPE_MAINTAINER_pn-console-tools = "Yu Ke <ke.yu@intel.com>"
+RECIPE_MAINTAINER_pn-console-tools = "Saul Wold <sgw@linux.intel.com>"
 DISTRO_PN_ALIAS_pn-console-tools = "Debian=console-tools Ubuntu=console-tools"
 RECIPE_MANUAL_CHECK_DATE_pn-console-tools= "Jul 01, 2011"
 
@@ -1328,7 +1329,7 @@ RECIPE_MAINTAINER_pn-pm-utils = "Dongxiao Xu <dongxiao.xu@intel.com>"
 RECIPE_STATUS_pn-psmisc = "red"
 RECIPE_LATEST_VERSION_pn-psmisc = "22.13"
 RECIPE_LAST_UPDATE_pn-psmisc = "Jan 18, 2008"
-RECIPE_MAINTAINER_pn-psmisc = "Yu Ke <ke.yu@intel.com>"
+RECIPE_MAINTAINER_pn-psmisc = "Saul Wold <sgw@linux.intel.com>"
 
 RECIPE_STATUS_pn-boost = "yellow"
 RECIPE_LATEST_VERSION_pn-boost = "1.47.0"
@@ -1348,7 +1349,7 @@ RECIPE_STATUS_pn-libfribidi = "red"
 DISTRO_PN_ALIAS_pn-libfribidi = "OpenSuSE=fribidi Ubuntu=fribidi Mandriva=fribidi Debian=fribidi"
 RECIPE_LATEST_VERSION_pn-libfribidi = "0.19.2"
 RECIPE_LAST_UPDATE_pn-libfribidi = "Jan 12, 2007"
-RECIPE_MAINTAINER_pn-libfribidi = "Yu Ke <ke.yu@intel.com>"
+RECIPE_MAINTAINER_pn-libfribidi = "Saul Wold <sgw@linux.intel.com>"
 
 RECIPE_STATUS_pn-rpcbind = "green"
 RECIPE_DEPENDENCY_CHECK_pn-rpcbind = "not done"
@@ -1364,7 +1365,7 @@ RECIPE_MAINTAINER_pn-rpcbind = "Dongxiao Xu <dongxiao.xu@intel.com>"
 
 RECIPE_STATUS_pn-time = "green"
 RECIPE_LAST_UPDATE_pn-time = "Dec 14, 2006"
-RECIPE_MAINTAINER_pn-time = "Yu Ke <ke.yu@intel.com>"
+RECIPE_MAINTAINER_pn-time = "Saul Wold <sgw@linux.intel.com>"
 RECIPE_DEPENDENCY_CHECK_pn-time = "not done"
 RECIPE_LATEST_VERSION_pn-time = "1.7"
 RECIPE_INTEL_SECTION_pn-time = "base utils"
@@ -1431,7 +1432,7 @@ RECIPE_COMMENTS_pn-update-modules = ""
 
 RECIPE_STATUS_pn-udev-extraconf = "green"
 RECIPE_LAST_UPDATE_pn-udev-extraconf = "Jul 19, 2008"
-RECIPE_MAINTAINER_pn-udev-extraconf = "Yu Ke <ke.yu@intel.com>"
+RECIPE_MAINTAINER_pn-udev-extraconf = "Saul Wold <sgw@linux.intel.com>"
 RECIPE_DEPENDENCY_CHECK_pn-udev-extraconf = "not done"
 RECIPE_LATEST_VERSION_pn-udev-extraconf = "0.0"
 RECIPE_PATCH_pn-udev-extraconf+mount.blacklist = "add mount blacklist"
@@ -1500,7 +1501,7 @@ RECIPE_COMMENTS_pn-curl = ""
 RECIPE_STATUS_pn-gconf-dbus = "green"
 DISTRO_PN_ALIAS_pn-gconf-dbus = "Meego=GConf-dbus"
 RECIPE_LAST_UPDATE_pn-gconf-dbus = "Jul 16, 2010"
-RECIPE_MAINTAINER_pn-gconf-dbus = "Yu Ke <ke.yu@intel.com>"
+RECIPE_MAINTAINER_pn-gconf-dbus = "Saul Wold <sgw@linux.intel.com>"
 RECIPE_DEPENDENCY_CHECK_pn-gconf-dbus = "not done"
 RECIPE_LATEST_VERSION_pn-gconf-dbus = "2.16.0+svnr705"
 RECIPE_INTEL_SECTION_pn-gconf-dbus = "base utils"
@@ -1532,7 +1533,7 @@ RECIPE_NO_UPDATE_REASON_pn-pkgconfig = "0.26 removes glib-conf, adds circular de
 
 RECIPE_STATUS_pn-less = "green"
 RECIPE_LAST_UPDATE_pn-less = "May 24, 2011"
-RECIPE_MAINTAINER_pn-less = "Yu Ke <ke.yu@intel.com>"
+RECIPE_MAINTAINER_pn-less = "Saul Wold <sgw@linux.intel.com>"
 RECIPE_DEPENDENCY_CHECK_pn-less = "done"
 RECIPE_LATEST_VERSION_pn-less = "443"
 RECIPE_INTEL_SECTION_pn-less = "base utils"
@@ -1621,7 +1622,7 @@ RECIPE_NO_UPDATE_REASON_pn-dropbear="0.53.1 is the latest version,not 0.255"
 
 RECIPE_STATUS_pn-hal = "green"
 RECIPE_LAST_UPDATE_pn-hal = "Jul 20, 2010"
-RECIPE_MAINTAINER_pn-hal = "Yu Ke <ke.yu@intel.com>"
+RECIPE_MAINTAINER_pn-hal = "Saul Wold <sgw@linux.intel.com>"
 RECIPE_DEPENDENCY_CHECK_pn-hal = "not done"
 RECIPE_LATEST_VERSION_pn-hal = "0.5.14"
 RECIPE_INTEL_SECTION_pn-hal = "base utils"
@@ -1631,7 +1632,7 @@ RECIPE_COMMENTS_pn-hal = "The licensing is very complicated, Most files are GPLv
 
 RECIPE_STATUS_pn-hal-info = "green"
 RECIPE_LAST_UPDATE_pn-hal-info = "Jul 20, 2010"
-RECIPE_MAINTAINER_pn-hal-info = "Yu Ke <ke.yu@intel.com>"
+RECIPE_MAINTAINER_pn-hal-info = "Saul Wold <sgw@linux.intel.com>"
 RECIPE_DEPENDENCY_CHECK_pn-hal-info = "not done"
 RECIPE_LATEST_VERSION_pn-hal-info = "20091130"
 RECIPE_INTEL_SECTION_pn-hal-info = "base utils"
@@ -1729,7 +1730,7 @@ DISTRO_PN_ALIAS_pn-v86d = "Debian=v86d Ubuntu=v86d"
 
 RECIPE_STATUS_pn-udev = "yellow"   # needs to delete old versions
 RECIPE_LAST_UPDATE_pn-udev = "Dec 7, 2010"
-RECIPE_MAINTAINER_pn-udev = "Yu Ke <ke.yu@intel.com>"
+RECIPE_MAINTAINER_pn-udev = "Saul Wold <sgw@linux.intel.com>"
 RECIPE_DEPENDENCY_CHECK_pn-udev = "not done"
 RECIPE_LATEST_VERSION_pn-udev = "158"
 RECIPE_INTEL_SECTION_pn-udev = "base utils"
@@ -1852,23 +1853,23 @@ RECIPE_LATEST_VERSION_pn-gawk = "4.0.0"
 
 RECIPE_STATUS_pn-mktemp="red"
 RECIPE_LAST_UPDATE_pn-mktemp = "Jul 29, 2010"
-RECIPE_MAINTAINER_pn-mktemp="Yu Ke <ke.yu@intel.com>"
+RECIPE_MAINTAINER_pn-mktemp="Saul Wold <sgw@linux.intel.com>"
 RECIPE_LATEST_VERSION_pn-mktemp="1.7"
 DISTRO_PN_ALIAS_pn-mktemp = "Mandriva=mktemp Fedora=mktemp"
 
 RECIPE_STATUS_pn-iputils="red"
 RECIPE_LAST_UPDATE_pn-iputils = "Jul 29, 2010"
-RECIPE_MAINTAINER_pn-iputils="Yu Ke <ke.yu@intel.com>"
+RECIPE_MAINTAINER_pn-iputils="Saul Wold <sgw@linux.intel.com>"
 RECIPE_LATEST_VERSION_pn-iputils="s20100418"
 
 RECIPE_STATUS_pn-xinetd="red"
 RECIPE_LAST_UPDATE_pn-xinetd = "Jul 28, 2010"
-RECIPE_MAINTAINER_pn-xinetd="Yu Ke <ke.yu@intel.com>"
+RECIPE_MAINTAINER_pn-xinetd="Saul Wold <sgw@linux.intel.com>"
 RECIPE_LATEST_VERSION_pn-xinetd="2.3.14"
 
 RECIPE_STATUS_pn-cracklib="green"
 RECIPE_LAST_UPDATE_pn-cracklib = "Nov 13, 2010"
-RECIPE_MAINTAINER_pn-cracklib="Yu Ke <ke.yu@intel.com>"
+RECIPE_MAINTAINER_pn-cracklib="Saul Wold <sgw@linux.intel.com>"
 RECIPE_LATEST_VERSION_pn-cracklib="2.8.18"
 
 RECIPE_STATUS_pn-openobex = "red"
@@ -1885,7 +1886,7 @@ RECIPE_INTEL_SECTION_pn-sed = "base utils"
 RECIPE_TIME_BETWEEN_LAST_TWO_RELEASES_pn-sed = "2 months"
 RECIPE_LATEST_RELEASE_DATE_pn-sed = "Jun 01, 2009"
 RECIPE_MANUAL_CHECK_DATE_pn-sed = "Jul 28, 2011"
-RECIPE_COMMENTS_pn-sed = "Qing maintains GPLv2 sed, while Dongxiao maintains GPLv3 sed"
+RECIPE_COMMENTS_pn-sed = "xxx maintains GPLv2 sed, while Dongxiao maintains GPLv3 sed"
 
 RECIPE_STATUS_pn-aspell = "red"
 RECIPE_LATEST_VERSION_pn-aspell = "0.60.6"
@@ -3349,17 +3350,17 @@ RECIPE_TIME_BETWEEN_LAST_TWO_RELEASES_pn-mkfontdir="Oct 11, 2009"
 RECIPE_LATEST_RELEASE_DATE_pn-mkfontdir="16 monthes"
 RECIPE_INTEL_SECTION_pn-mkfontdir="graphic apps"
 RECIPE_LAST_UPDATE_pn-mkfontdir = "Jan 18, 2011"
-RECIPE_MAINTAINER_pn-mkfontdir="Yu Ke <ke.yu@intel.com>"
+RECIPE_MAINTAINER_pn-mkfontdir="Saul Wold <sgw@linux.intel.com>"
 DISTRO_PN_ALIAS_pn-mkfontdir = "Mandriva=mkfontdir Ubuntu=xfonts-utils Fedora=xorg-x11-font-utils"
 
 RECIPE_STATUS_pn-mkfontscale="green" # no update needed
-RECIPE_LATEST_VERSION_pn-mkfontscale="1.0.7"
+RECIPE_LATEST_VERSION_pn-mkfontscale="1.0.9"
+RECIPE_LATEST_RELEASE_DATE_pn-mkfontscale="Jun 29, 2011"
+RECIPE_LAST_UPDATE_pn-mkfontscale = "Nov 28, 2011"
 RECIPE_NO_OF_PATCHES_pn-mkfontscale="0"
 RECIPE_TIME_BETWEEN_LAST_TWO_RELEASES_pn-mkfontscale="10 monthes"
-RECIPE_LATEST_RELEASE_DATE_pn-mkfontscale="Oct 11, 2009"
 RECIPE_INTEL_SECTION_pn-mkfontscale="graphic apps"
-RECIPE_LAST_UPDATE_pn-mkfontscale = "Jan 18, 2011"
-RECIPE_MAINTAINER_pn-mkfontscale="Yu Ke <ke.yu@intel.com>"
+RECIPE_MAINTAINER_pn-mkfontscale="Saul Wold <sgw@linux.intel.com>"
 DISTRO_PN_ALIAS_pn-mkfontscale = "Mandriva=mkfontscale Ubuntu=xfonts-utils Fedora=xorg-x11-font-utils"
 
 RECIPE_STATUS_pn-xauth="green" # no update needed
@@ -3369,16 +3370,16 @@ RECIPE_TIME_BETWEEN_LAST_TWO_RELEASES_pn-xauth="1 year"
 RECIPE_LATEST_RELEASE_DATE_pn-xauth="Sep 24, 2010"
 RECIPE_INTEL_SECTION_pn-xauth="graphic app"
 RECIPE_LAST_UPDATE_pn-xauth = "Nov 12, 2010"
-RECIPE_MAINTAINER_pn-xauth="Yu Ke <ke.yu@intel.com>"
+RECIPE_MAINTAINER_pn-xauth="Saul Wold <sgw@linux.intel.com>"
 
 RECIPE_STATUS_pn-xdpyinfo="green" # no update needed
-RECIPE_LATEST_VERSION_pn-xdpyinfo="1.1.0"
+RECIPE_LATEST_VERSION_pn-xdpyinfo="1.3.0"
+RECIPE_LATEST_RELEASE_DATE_pn-xdpyinfo="Oct 21, 2011"
+RECIPE_LAST_UPDATE_pn-xdpyinfo = "Nov 28, 2011"
 RECIPE_NO_OF_PATCHES_pn-xdpyinfo="1"
 RECIPE_TIME_BETWEEN_LAST_TWO_RELEASES_pn-xdpyinfo="1 year"
-RECIPE_LATEST_RELEASE_DATE_pn-xdpyinfo="Oct 16, 2009"
 RECIPE_INTEL_SECTION_pn-xdpyinfo="graphic app"
-RECIPE_LAST_UPDATE_pn-xdpyinfo = "Jan 18, 2011"
-RECIPE_MAINTAINER_pn-xdpyinfo="Yu Ke <ke.yu@intel.com>"
+RECIPE_MAINTAINER_pn-xdpyinfo="Saul Wold <sgw@linux.intel.com>"
 DISTRO_PN_ALIAS_pn-xdpyinfo = "Fedora=xorg-x11-utils Ubuntu=x11-utils"
 
 RECIPE_STATUS_pn-xhost="green" # no update needed
@@ -3388,26 +3389,26 @@ RECIPE_TIME_BETWEEN_LAST_TWO_RELEASES_pn-xhost="2 years"
 RECIPE_LATEST_RELEASE_DATE_pn-xhost="Oct 14, 2009"
 RECIPE_INTEL_SECTION_pn-xhost="graphic app"
 RECIPE_LAST_UPDATE_pn-xhost = "Jan 18, 2011"
-RECIPE_MAINTAINER_pn-xhost="Yu Ke <ke.yu@intel.com>"
+RECIPE_MAINTAINER_pn-xhost="Saul Wold <sgw@linux.intel.com>"
 DISTRO_PN_ALIAS_pn-xhost = "Ubuntu=x11-xserver-utils Fedora=xorg-x11-server-utils"
 
 RECIPE_STATUS_pn-xinit="green" # no update needed
-RECIPE_LATEST_VERSION_pn-xinit="1.2.1"
+RECIPE_LATEST_VERSION_pn-xinit="1.3.1"
+RECIPE_LATEST_RELEASE_DATE_pn-xinit="Jul 24, 2011"
+RECIPE_LAST_UPDATE_pn-xinit = "Nov 28, 2011"
 RECIPE_NO_OF_PATCHES_pn-xinit="0"
 RECIPE_TIME_BETWEEN_LAST_TWO_RELEASES_pn-xinit="4 monthes"
-RECIPE_LATEST_RELEASE_DATE_pn-xinit="Mar 16, 2010"
 RECIPE_INTEL_SECTION_pn-xinit="graphic app"
-RECIPE_LAST_UPDATE_pn-xinit = "Jan 18, 2011"
-RECIPE_MAINTAINER_pn-xinit="Yu Ke <ke.yu@intel.com>"
+RECIPE_MAINTAINER_pn-xinit="Saul Wold <sgw@linux.intel.com>"
 
 RECIPE_STATUS_pn-xkbcomp="green" # no update needed
-RECIPE_LATEST_VERSION_pn-xkbcomp="1.1.1"
+RECIPE_LATEST_VERSION_pn-xkbcomp="1.2.3"
+RECIPE_LATEST_RELEASE_DATE_pn-xkbcomp="Jun 21, 2011"
+RECIPE_LAST_UPDATE_pn-xkbcomp = "Nov 28, 2011"
 RECIPE_NO_OF_PATCHES_pn-xkbcomp="0"
 RECIPE_TIME_BETWEEN_LAST_TWO_RELEASES_pn-xkbcomp="2 monthes"
-RECIPE_LATEST_RELEASE_DATE_pn-xkbcomp="Oct 03, 2009"
 RECIPE_INTEL_SECTION_pn-xkbcomp="graphic app"
-RECIPE_LAST_UPDATE_pn-xkbcomp = "Jan 18, 2011"
-RECIPE_MAINTAINER_pn-xkbcomp="Yu Ke <ke.yu@intel.com>"
+RECIPE_MAINTAINER_pn-xkbcomp="Saul Wold <sgw@linux.intel.com>"
 DISTRO_PN_ALIAS_pn-xkbcomp = "Ubuntu=x11-xkb-utils Fedora=xorg-x11-xkb-utils"
 
 RECIPE_STATUS_pn-xmodmap="green" # no update needed
@@ -3417,47 +3418,47 @@ RECIPE_TIME_BETWEEN_LAST_TWO_RELEASES_pn-xmodmap="2 years"
 RECIPE_LATEST_RELEASE_DATE_pn-xmodmap="Sep 24, 2010"
 RECIPE_INTEL_SECTION_pn-xmodmap="graphic app"
 RECIPE_LAST_UPDATE_pn-xmodmap = "Nov 12, 2010"
-RECIPE_MAINTAINER_pn-xmodmap="Yu Ke <ke.yu@intel.com>"
+RECIPE_MAINTAINER_pn-xmodmap="Saul Wold <sgw@linux.intel.com>"
 DISTRO_PN_ALIAS_pn-xmodmap = "Meego=xorg-x11-utils-xmodmap Fedora=xorg-x11-server-utils Ubuntu=x11-xserver-utils"
 
 RECIPE_STATUS_pn-xprop="green" # no update needed
-RECIPE_LATEST_VERSION_pn-xprop="1.1.0"
+RECIPE_LATEST_VERSION_pn-xprop="1.2.1"
+RECIPE_LATEST_RELEASE_DATE_pn-xprop="Jun 29, 2011"
+RECIPE_LAST_UPDATE_pn-xprop = "Nov 28, 2011"
 RECIPE_NO_OF_PATCHES_pn-xprop="0"
 RECIPE_TIME_BETWEEN_LAST_TWO_RELEASES_pn-xprop="1 year"
-RECIPE_LATEST_RELEASE_DATE_pn-xprop="Oct 12, 2009"
 RECIPE_INTEL_SECTION_pn-xprop="graphic app"
-RECIPE_LAST_UPDATE_pn-xprop = "Jan 18, 2011"
-RECIPE_MAINTAINER_pn-xprop="Yu Ke <ke.yu@intel.com>"
+RECIPE_MAINTAINER_pn-xprop="Saul Wold <sgw@linux.intel.com>"
 DISTRO_PN_ALIAS_pn-xprop = "Meego=xorg-x11-utils-xprop Fedora=xorg-x11-utils Ubuntu=x11-utils"
 
 RECIPE_STATUS_pn-xset="green" # no update needed
 DISTRO_PN_ALIAS_pn-xset = "Fedora=xorg-x11-server-utils Ubuntu=x11-xserver-utils Debian=x11-xserver-utils Opensuse=xorg-x11"
-RECIPE_LATEST_VERSION_pn-xset="1.2.1"
+RECIPE_LATEST_VERSION_pn-xset="1.2.2"
+RECIPE_LATEST_RELEASE_DATE_pn-xset="Jul 28, 2011"
+RECIPE_LAST_UPDATE_pn-xset = "Nov 28, 2011"
 RECIPE_NO_OF_PATCHES_pn-xset="1"
 RECIPE_TIME_BETWEEN_LAST_TWO_RELEASES_pn-xset="1 year"
-RECIPE_LATEST_RELEASE_DATE_pn-xset="Nov 11, 2010"
 RECIPE_INTEL_SECTION_pn-xset="graphic app"
-RECIPE_LAST_UPDATE_pn-xset = "Nov 12, 2010"
-RECIPE_MAINTAINER_pn-xset="Yu Ke <ke.yu@intel.com>"
+RECIPE_MAINTAINER_pn-xset="Saul Wold <sgw@linux.intel.com>"
 
 RECIPE_STATUS_pn-xwininfo="green" # no update needed
-RECIPE_LATEST_VERSION_pn-xwininfo="1.1.1"
+RECIPE_LATEST_VERSION_pn-xwininfo="1.1.2"
+RECIPE_LATEST_RELEASE_DATE_pn-xwininfo="Jun 29, 2010"
+RECIPE_LAST_UPDATE_pn-xwininfo = "Nov 28, 2011"
 RECIPE_NO_OF_PATCHES_pn-xwininfo="0"
 RECIPE_TIME_BETWEEN_LAST_TWO_RELEASES_pn-xwininfo="1 year"
-RECIPE_LATEST_RELEASE_DATE_pn-xwininfo="Oct 30, 2010"
 RECIPE_INTEL_SECTION_pn-xwininfo="graphic app"
-RECIPE_LAST_UPDATE_pn-xwininfo = "Jan 18, 2011"
-RECIPE_MAINTAINER_pn-xwininfo="Yu Ke <ke.yu@intel.com>"
+RECIPE_MAINTAINER_pn-xwininfo="Saul Wold <sgw@linux.intel.com>"
 DISTRO_PN_ALIAS_pn-xwininfo = "Fedora=xorg-x11-utils Ubuntu=x11-utils"
 
 RECIPE_STATUS_pn-xrandr="green" # no update needed
-RECIPE_LATEST_VERSION_pn-xrandr="1.3.2"
+RECIPE_LATEST_VERSION_pn-xrandr="1.3.5"
+RECIPE_LATEST_RELEASE_DATE_pn-xrandr="Jun 29, 2011"
+RECIPE_LAST_UPDATE_pn-xrandr = "Nov 28, 2011"
 RECIPE_NO_OF_PATCHES_pn-xrandr="0"
 RECIPE_TIME_BETWEEN_LAST_TWO_RELEASES_pn-xrandr="1 month"
-RECIPE_LATEST_RELEASE_DATE_pn-xrandr="Sep 10, 2009"
 RECIPE_INTEL_SECTION_pn-xrandr="graphic app"
-RECIPE_LAST_UPDATE_pn-xrandr = "Nov 16, 2010"
-RECIPE_MAINTAINER_pn-xrandr="Yu Ke <ke.yu@intel.com>"
+RECIPE_MAINTAINER_pn-xrandr="Saul Wold <sgw@linux.intel.com>"
 DISTRO_PN_ALIAS_pn-xrandr = "Ubuntu=x11-xserver-utils Fedora=xorg-x11-server-utils"
 
 RECIPE_STATUS_pn-vte="green" # no update needed
@@ -3467,7 +3468,7 @@ RECIPE_TIME_BETWEEN_LAST_TWO_RELEASES_pn-vte="3 monthes"
 RECIPE_LATEST_RELEASE_DATE_pn-vte="Jul 12, 2010"
 RECIPE_INTEL_SECTION_pn-vte="graphic app"
 RECIPE_LAST_UPDATE_pn-vte = "Jul 19, 2010"
-RECIPE_MAINTAINER_pn-vte="Yu Ke <ke.yu@intel.com>"
+RECIPE_MAINTAINER_pn-vte="Saul Wold <sgw@linux.intel.com>"
 
 RECIPE_STATUS_pn-qemugl="green" # no update needed
 RECIPE_LATEST_VERSION_pn-qemugl="0.0+git0+d888bbc723c00d197d34a39b5b7448660ec1b1c0"
@@ -3477,7 +3478,7 @@ RECIPE_LATEST_RELEASE_DATE_pn-qemugl="May 30, 2009"
 RECIPE_INTEL_SECTION_pn-qemugl="graphic app"
 RECIPE_LAST_UPDATE_pn-qemugl = "Nov 28, 2010"
 RECIPE_NO_UPDATE_REASON_pn-qemugl = "Do not upgrade to version: 33466cd8 because the upstream is broken in x86_64 build"
-RECIPE_MAINTAINER_pn-qemugl="Yu Ke <ke.yu@intel.com>"
+RECIPE_MAINTAINER_pn-qemugl="Saul Wold <sgw@linux.intel.com>"
 RECIPE_MANUAL_CHECK_DATE_pn-qemugl= "Jul 01, 2011"
 
 RECIPE_STATUS_pn-fotowall="green" # no update needed
@@ -3488,7 +3489,7 @@ RECIPE_LATEST_RELEASE_DATE_pn-fotowall="Dec 08, 2009"
 RECIPE_INTEL_SECTION_pn-fotowall="graphic app"
 RECIPE_LATEST_VERSION_pn-fotowall=""
 RECIPE_LAST_UPDATE_pn-fotowall = "Aug 25, 2010"
-RECIPE_MAINTAINER_pn-fotowall="Yu Ke <ke.yu@intel.com>"
+RECIPE_MAINTAINER_pn-fotowall="Saul Wold <sgw@linux.intel.com>"
 DISTRO_PN_ALIAS_pn-fotowall = "Fedora=fotowall Ubuntu=fotowall"
 
 RECIPE_STATUS_pn-imake = "red"
@@ -3498,7 +3499,7 @@ RECIPE_TIME_BETWEEN_LAST_TWO_RELEASES_pn-imake = "1 month"
 RECIPE_LATEST_RELEASE_DATE_pn-imake = "Apr 16, 2010"
 RECIPE_INTEL_SECTION_pn-imake = "graphic app"
 RECIPE_LAST_UPDATE_pn-imake = "Nov 21, 2010"
-RECIPE_MAINTAINER_pn-imake = "Yu Ke <ke.yu@intel.com>"
+RECIPE_MAINTAINER_pn-imake = "Saul Wold <sgw@linux.intel.com>"
 DISTRO_PN_ALIAS_pn-imake = "Mandriva=xutils Ubuntu=xutils"
 
 RECIPE_STATUS_pn-qt4-tools-native = "green" # no update needed
@@ -3540,7 +3541,7 @@ RECIPE_TIME_BETWEEN_LAST_TWO_RELEASES_pn-quicky = "n/a"
 RECIPE_LATEST_RELEASE_DATE_pn-quicky = "Jun 18, 2008"
 RECIPE_INTEL_SECTION_pn-quicky = "graphic app"
 RECIPE_LAST_UPDATE_pn-quicky = "Aug 25, 2010"
-RECIPE_MAINTAINER_pn-quicky = "Yu Ke <ke.yu@intel.com>"
+RECIPE_MAINTAINER_pn-quicky = "Saul Wold <sgw@linux.intel.com>"
 DISTRO_PN_ALIAS_pn-quicky = "OSPDT"
 #
 # distro tracking filed for X core packages
@@ -3554,7 +3555,7 @@ RECIPE_TIME_BETWEEN_LAST_TWO_RELEASES_pn-bigreqsproto="3 years"
 RECIPE_LATEST_RELEASE_DATE_pn-bigreqsproto="Aug 26, 2009"
 RECIPE_INTEL_SECTION_pn-bigreqsproto="graphic core"
 RECIPE_LAST_UPDATE_pn-bigreqsproto = "Jan 18, 2011"
-RECIPE_MAINTAINER_pn-bigreqsproto="Yu Ke <ke.yu@intel.com>"
+RECIPE_MAINTAINER_pn-bigreqsproto="Saul Wold <sgw@linux.intel.com>"
 
 RECIPE_STATUS_pn-evieext="green" # no update needed
 DISTRO_PN_ALIAS_pn-evieext = "Meego=xorg-x11-proto-evieext Debian=x11proto-evie"
@@ -3564,7 +3565,7 @@ RECIPE_TIME_BETWEEN_LAST_TWO_RELEASES_pn-evieext="3 years"
 RECIPE_LATEST_RELEASE_DATE_pn-evieext="Aug 26, 2009"
 RECIPE_INTEL_SECTION_pn-evieext="graphic core"
 RECIPE_LAST_UPDATE_pn-evieext = "Feb 3, 2010"
-RECIPE_MAINTAINER_pn-evieext="Yu Ke <ke.yu@intel.com>"
+RECIPE_MAINTAINER_pn-evieext="Saul Wold <sgw@linux.intel.com>"
 
 RECIPE_STATUS_pn-libxxf86dga="green" # no update needed
 RECIPE_LATEST_VERSION_pn-libxxf86dga="1.1.1"
@@ -3573,7 +3574,7 @@ RECIPE_TIME_BETWEEN_LAST_TWO_RELEASES_pn-libxxf86dga="1 month"
 RECIPE_LATEST_RELEASE_DATE_pn-libxxf86dga="Oct 06, 2009"
 RECIPE_INTEL_SECTION_pn-libxxf86dga="graphic core"
 RECIPE_LAST_UPDATE_pn-libxxf86dga = "Nov 24, 2010"
-RECIPE_MAINTAINER_pn-libxxf86dga="Yu Ke <ke.yu@intel.com>"
+RECIPE_MAINTAINER_pn-libxxf86dga="Saul Wold <sgw@linux.intel.com>"
 
 RECIPE_STATUS_pn-x11-common="green" # no update needed
 RECIPE_LATEST_VERSION_pn-x11-common="0.1"
@@ -3582,7 +3583,7 @@ RECIPE_TIME_BETWEEN_LAST_TWO_RELEASES_pn-x11-common="n/a" # local file without r
 RECIPE_LATEST_RELEASE_DATE_pn-x11-common="Sep 22, 2008" # per poky git log
 RECIPE_INTEL_SECTION_pn-x11-common="graphic core"
 RECIPE_LAST_UPDATE_pn-x11-common = "Sep 22, 2008"
-RECIPE_MAINTAINER_pn-x11-common="Yu Ke <ke.yu@intel.com>"
+RECIPE_MAINTAINER_pn-x11-common="Saul Wold <sgw@linux.intel.com>"
 
 RECIPE_STATUS_pn-xf86-input-keyboard="green" # no update needed
 DISTRO_PN_ALIAS_pn-xf86-input-keyboard = "Meego=xorg-x11-drv-keyboard Fedora=xorg-x11-drv-keyboard Mandriva=x11-driver-input-keyboard Debian=xserver-xorg-input-keyboard"
@@ -3592,17 +3593,17 @@ RECIPE_TIME_BETWEEN_LAST_TWO_RELEASES_pn-xf86-input-keyboard="9 monthes"
 RECIPE_LATEST_RELEASE_DATE_pn-xf86-input-keyboard="Oct 07, 2009"
 RECIPE_INTEL_SECTION_pn-xf86-input-keyboard="graphic core"
 RECIPE_LAST_UPDATE_pn-xf86-input-keyboard = "Jan 18, 2011"
-RECIPE_MAINTAINER_pn-xf86-input-keyboard="Yu Ke <ke.yu@intel.com>"
+RECIPE_MAINTAINER_pn-xf86-input-keyboard="Saul Wold <sgw@linux.intel.com>"
 
 RECIPE_STATUS_pn-xf86-input-mouse="green" # no update needed
 DISTRO_PN_ALIAS_pn-xf86-input-mouse = "Ubuntu=xserver-xorg-input-mouse Mandriva=x11-driver-input-mouse Debian=xserver-xorg-input-mouse"
-RECIPE_LATEST_VERSION_pn-xf86-input-mouse="1.6.0"
+RECIPE_LATEST_VERSION_pn-xf86-input-mouse="1.7.1"
+RECIPE_LATEST_RELEASE_DATE_pn-xf86-input-mouse="Jul 05, 2011"
+RECIPE_LAST_UPDATE_pn-xf86-input-mouse = "Nov 28, 2011"
 RECIPE_NO_OF_PATCHES_pn-xf86-input-mouse="0"
 RECIPE_TIME_BETWEEN_LAST_TWO_RELEASES_pn-xf86-input-mouse="9 monthes"
-RECIPE_LATEST_RELEASE_DATE_pn-xf86-input-mouse="Sep 09, 2010"
 RECIPE_INTEL_SECTION_pn-xf86-input-mouse="graphic core"
-RECIPE_LAST_UPDATE_pn-xf86-input-mouse = "Nov 12, 2010"
-RECIPE_MAINTAINER_pn-xf86-input-mouse="Yu Ke <ke.yu@intel.com>"
+RECIPE_MAINTAINER_pn-xf86-input-mouse="Saul Wold <sgw@linux.intel.com>"
 
 RECIPE_STATUS_pn-xf86-input-vmmouse="green" # update needed
 DISTRO_PN_ALIAS_pn-xf86-input-vmmouse = "Fedora=xorg-x11-drv-vmmouse Ubuntu=xserver-xorg-input-vmmouse Mandriva=x11-driver-input-vmmouse Debian=xserver-xorg-input-vmmouse"
@@ -3612,16 +3613,16 @@ RECIPE_TIME_BETWEEN_LAST_TWO_RELEASES_pn-xf86-input-vmmouse="1 month"
 RECIPE_LATEST_RELEASE_DATE_pn-xf86-input-vmmouse="Aug 10, 2010"
 RECIPE_INTEL_SECTION_pn-xf86-input-vmmouse="graphic core"
 RECIPE_LAST_UPDATE_pn-xf86-input-vmmouse = "Nov 12, 2010"
-RECIPE_MAINTAINER_pn-xf86-input-vmmouse="Yu Ke <ke.yu@intel.com>"
+RECIPE_MAINTAINER_pn-xf86-input-vmmouse="Saul Wold <sgw@linux.intel.com>"
 
 RECIPE_STATUS_pn-libdrm="green" # no update needed
-RECIPE_LATEST_VERSION_pn-libdrm="2.4.21"
+RECIPE_LATEST_VERSION_pn-libdrm="2.4.27"
+RECIPE_LATEST_RELEASE_DATE_pn-libdrm="Oct 29, 2011"
+RECIPE_LAST_UPDATE_pn-libdrm = "Nov 28, 2011"
 RECIPE_NO_OF_PATCHES_pn-libdrm="1"
 RECIPE_TIME_BETWEEN_LAST_TWO_RELEASES_pn-libdrm="1 month"
-RECIPE_LATEST_RELEASE_DATE_pn-libdrm="Jun 10, 2010"
 RECIPE_INTEL_SECTION_pn-libdrm="graphic core"
-RECIPE_LAST_UPDATE_pn-libdrm = "Jan 18, 2011"
-RECIPE_MAINTAINER_pn-libdrm="Yu Ke <ke.yu@intel.com>"
+RECIPE_MAINTAINER_pn-libdrm="Saul Wold <sgw@linux.intel.com>"
 
 RECIPE_STATUS_pn-python-pycairo="green" # no upgrade needed
 DISTRO_PN_ALIAS_pn-python-pycairo = "Meego=pycairo Fedora=pycairo Ubuntu=pycairo Debian=pycairo"
@@ -3631,7 +3632,7 @@ RECIPE_LATEST_RELEASE_DATE_pn-python-pycairo="May 20, 2010"
 RECIPE_TIME_BETWEEN_LAST_TWO_RELEASES_pn-python-pycairo="9 months"
 RECIPE_INTEL_SECTION_pn-python-pycairo="graphic core"
 RECIPE_LAST_UPDATE_pn-python-pycairo = "Aug 16, 2010"
-RECIPE_MAINTAINER_pn-python-pycairo="Yu Ke <ke.yu@intel.com>"
+RECIPE_MAINTAINER_pn-python-pycairo="Saul Wold <sgw@linux.intel.com>"
 
 RECIPE_STATUS_pn-libxfontcache="green" # no update neededd
 RECIPE_LATEST_VERSION_pn-libxfontcache="1.0.5"
@@ -3640,7 +3641,7 @@ RECIPE_TIME_BETWEEN_LAST_TWO_RELEASES_pn-libxfontcache="3 years"
 RECIPE_LATEST_RELEASE_DATE_pn-libxfontcache="Oct 08, 2009"
 RECIPE_INTEL_SECTION_pn-libxfontcache="graphic core"
 RECIPE_LAST_UPDATE_pn-libxfontcache = "Jun 23, 2010"
-RECIPE_MAINTAINER_pn-libxfontcache="Yu Ke <ke.yu@intel.com>"
+RECIPE_MAINTAINER_pn-libxfontcache="Saul Wold <sgw@linux.intel.com>"
 DISTRO_PN_ALIAS_pn-libxfontcache = "Mandriva=libxfontcache Debian=libxfontcache"
 
 RECIPE_STATUS_pn-xf86-input-evdev="green" # no update needed
@@ -3651,7 +3652,7 @@ RECIPE_TIME_BETWEEN_LAST_TWO_RELEASES_pn-xf86-input-evdev="1 monthes"
 RECIPE_LATEST_RELEASE_DATE_pn-xf86-input-evdev="Aug 23, 2010"
 RECIPE_INTEL_SECTION_pn-xf86-input-evdev="graphic core"
 RECIPE_LAST_UPDATE_pn-xf86-input-evdev = "Jan 18, 2011"
-RECIPE_MAINTAINER_pn-xf86-input-evdev="Yu Ke <ke.yu@intel.com>"
+RECIPE_MAINTAINER_pn-xf86-input-evdev="Saul Wold <sgw@linux.intel.com>"
 
 RECIPE_STATUS_pn-xf86-video-vmware="green" # no update needed
 DISTRO_PN_ALIAS_pn-xf86-video-vmware = "Debian=xserver-xorg-video-vmware Fedora=xorg-x11-drv-vmware Mandriva=x11-driver-video-vmware Ubuntu=xserver-xorg-video-vmware"
@@ -3661,7 +3662,7 @@ RECIPE_TIME_BETWEEN_LAST_TWO_RELEASES_pn-xf86-video-vmware="2 monthes"
 RECIPE_LATEST_RELEASE_DATE_pn-xf86-video-vmware="Nov 09, 2010"
 RECIPE_INTEL_SECTION_pn-xf86-video-vmware="graphic core"
 RECIPE_LAST_UPDATE_pn-xf86-video-vmware = "Nov 12, 2010"
-RECIPE_MAINTAINER_pn-xf86-video-vmware="Yu Ke <ke.yu@intel.com>"
+RECIPE_MAINTAINER_pn-xf86-video-vmware="Saul Wold <sgw@linux.intel.com>"
 
 RECIPE_STATUS_pn-xf86-video-vesa = "green" # no update needed
 RECIPE_LATEST_VERSION_pn-xf86-video-vesa = "2.3.0"
@@ -3670,7 +3671,7 @@ RECIPE_TIME_BETWEEN_LAST_TWO_RELEASES_pn-xf86-video-vesa = "6 monthes"
 RECIPE_LATEST_RELEASE_DATE_pn-xf86-video-vesa = "Jan 04, 2010"
 RECIPE_INTEL_SECTION_pn-xf86-video-vesa = "graphic core"
 RECIPE_LAST_UPDATE_pn-xf86-video-vesa = "May 17, 2010"
-RECIPE_MAINTAINER_pn-xf86-video-vesa = "Yu Ke <ke.yu@intel.com>"
+RECIPE_MAINTAINER_pn-xf86-video-vesa = "Saul Wold <sgw@linux.intel.com>"
 DISTRO_PN_ALIAS_pn-xf86-video-vesa = "Debian=xserver-xorg-video-vesa Fedora=xorg-x11-drv-vesa Mandriva=x11-driver-video-vesa Ubuntu=xserver-xorg-video-vesa"
 
 RECIPE_STATUS_pn-cairo="green" # no update needed
@@ -3681,7 +3682,7 @@ RECIPE_TIME_BETWEEN_LAST_TWO_RELEASES_pn-cairo="1 monthes"
 RECIPE_LATEST_RELEASE_DATE_pn-cairo="Feb 20, 2010"
 RECIPE_INTEL_SECTION_pn-cairo="graphic core"
 RECIPE_LAST_UPDATE_pn-cairo = "Jan 18, 2011"
-RECIPE_MAINTAINER_pn-cairo="Yu Ke <ke.yu@intel.com>"
+RECIPE_MAINTAINER_pn-cairo="Saul Wold <sgw@linux.intel.com>"
 
 RECIPE_STATUS_pn-xserver-nodm-init="green" # no update needed
 RECIPE_LATEST_VERSION_pn-xserver-nodm-init="1.0"
@@ -3689,7 +3690,7 @@ RECIPE_NO_OF_PATCHES_pn-xserver-nodm-init="0"
 RECIPE_TIME_BETWEEN_LAST_TWO_RELEASES_pn-xserver-nodm-init=""
 RECIPE_LATEST_RELEASE_DATE_pn-xserver-nodm-init=""
 RECIPE_INTEL_SECTION_pn-xserver-nodm-init="graphic core"
-RECIPE_MAINTAINER_pn-xserver-nodm-init="Yu Ke <ke.yu@intel.com>"
+RECIPE_MAINTAINER_pn-xserver-nodm-init="Saul Wold <sgw@linux.intel.com>"
 
 RECIPE_STATUS_pn-xserver-xf86-config="green" # no update needed
 RECIPE_LATEST_VERSION_pn-xserver-xf86-config="0.1"
@@ -3698,7 +3699,7 @@ RECIPE_TIME_BETWEEN_LAST_TWO_RELEASES_pn-xserver-xf86-config=""
 RECIPE_LATEST_RELEASE_DATE_pn-xserver-xf86-config=""
 RECIPE_INTEL_SECTION_pn-xserver-xf86-config="graphic core"
 RECIPE_LAST_UPDATE_pn-xserver-xf86-config = "May 31, 2009"
-RECIPE_MAINTAINER_pn-xserver-xf86-config="Yu Ke <ke.yu@intel.com>"
+RECIPE_MAINTAINER_pn-xserver-xf86-config="Saul Wold <sgw@linux.intel.com>"
 
 RECIPE_STATUS_pn-pango="green" # no update needed
 RECIPE_LATEST_VERSION_pn-pango="1.28.0"
@@ -3707,7 +3708,7 @@ RECIPE_TIME_BETWEEN_LAST_TWO_RELEASES_pn-pango="1 month"
 RECIPE_LATEST_RELEASE_DATE_pn-pango="Mar 10, 2010"
 RECIPE_INTEL_SECTION_pn-pango="graphic core"
 RECIPE_LAST_UPDATE_pn-pango = "Nov 21, 2010"
-RECIPE_MAINTAINER_pn-pango="Yu Ke <ke.yu@intel.com>"
+RECIPE_MAINTAINER_pn-pango="Saul Wold <sgw@linux.intel.com>"
 
 RECIPE_STATUS_pn-mesa-dri="green" # no update needed
 RECIPE_LATEST_VERSION_pn-mesa-dri="7.8.2"
@@ -3716,7 +3717,7 @@ RECIPE_TIME_BETWEEN_LAST_TWO_RELEASES_pn-mesa-dri="2 monthes"
 RECIPE_LATEST_RELEASE_DATE_pn-mesa-dri="Jun 17, 2010"
 RECIPE_INTEL_SECTION_pn-mesa-dri="graphic core"
 RECIPE_LAST_UPDATE_pn-mesa-dri = "Jan 18, 2011"
-RECIPE_MAINTAINER_pn-mesa-dri="Yu Ke <ke.yu@intel.com>"
+RECIPE_MAINTAINER_pn-mesa-dri="Saul Wold <sgw@linux.intel.com>"
 DISTRO_PN_ALIAS_pn-mesa-dri = "Fedora=mesa Ubuntu=libgl1-mesa-dri"
 
 DISTRO_PN_ALIAS_pn-mesa-xlib = "Fedora=mesa Ubuntu=libgl1-mesa-swx11"
@@ -3728,7 +3729,7 @@ RECIPE_TIME_BETWEEN_LAST_TWO_RELEASES_pn-mesa-dri-glsl-native="2 monthes"
 RECIPE_LATEST_RELEASE_DATE_pn-mesa-dri-glsl-native="Jun 17, 2010"
 RECIPE_INTEL_SECTION_pn-mesa-dri-glsl-native="graphic core"
 RECIPE_LAST_UPDATE_pn-mesa-dri-glsl-native = "Jan 18, 2011"
-RECIPE_MAINTAINER_pn-mesa-dri-glsl-native = "Yu Ke <ke.yu@intel.com>"
+RECIPE_MAINTAINER_pn-mesa-dri-glsl-native = "Saul Wold <sgw@linux.intel.com>"
 DISTRO_PN_ALIAS_pn-mesa-dri-glsl-native = "Fedora=mesa Ubuntu=libgl1-mesa-dri"
 
 RECIPE_STATUS_pn-mesa-xlib="green" # no update needed
@@ -3738,7 +3739,7 @@ RECIPE_TIME_BETWEEN_LAST_TWO_RELEASES_pn-mesa-xlib="2 monthes"
 RECIPE_LATEST_RELEASE_DATE_pn-mesa-xlib="Jun 17, 2010"
 RECIPE_INTEL_SECTION_pn-mesa-xlib="graphic core"
 RECIPE_LAST_UPDATE_pn-mesa-xlib = "Nov 27, 2010"
-RECIPE_MAINTAINER_pn-mesa-xlib="Yu Ke <ke.yu@intel.com>"
+RECIPE_MAINTAINER_pn-mesa-xlib="Saul Wold <sgw@linux.intel.com>"
 
 RECIPE_STATUS_pn-xserver-xorg="green" # no update needed
 RECIPE_LATEST_VERSION_pn-xserver-xorg="1.8.99.904"
@@ -3747,25 +3748,25 @@ RECIPE_TIME_BETWEEN_LAST_TWO_RELEASES_pn-xserver-xorg="2 monthes"
 RECIPE_LATEST_RELEASE_DATE_pn-xserver-xorg="Jul 01, 2010"
 RECIPE_INTEL_SECTION_pn-xserver-xorg="graphic core"
 RECIPE_LAST_UPDATE_pn-xserver-xorg = "Jan 18, 2011"
-RECIPE_MAINTAINER_pn-xserver-xorg="Yu Ke <ke.yu@intel.com>"
+RECIPE_MAINTAINER_pn-xserver-xorg="Saul Wold <sgw@linux.intel.com>"
 
 RECIPE_STATUS_pn-xf86-input-synaptics = "red"
 DISTRO_PN_ALIAS_pn-xf86-input-synaptics = "Meego=xorg-x11-drv-synaptics Fedora=xorg-x11-drv-synaptics Ubuntu=xserver-xorg-input-synaptics Mandriva=x11-driver-input-synaptics Debian=xfree86-driver-synaptics"
-RECIPE_LATEST_VERSION_pn-xf86-input-synaptics = "1.2.2"
-RECIPE_LAST_UPDATE_pn-xf86-input-synaptics = "Jan 18, 2011"
-RECIPE_MAINTAINER_pn-xf86-input-synaptics = "Yu Ke <ke.yu@intel.com>"
+RECIPE_LATEST_VERSION_pn-xf86-input-synaptics = "1.5.0"
+RECIPE_LAST_UPDATE_pn-xf86-input-synaptics = "Nov 28, 2011"
+RECIPE_MAINTAINER_pn-xf86-input-synaptics = "Saul Wold <sgw@linux.intel.com>"
 
 RECIPE_STATUS_pn-xf86-video-intel = "red"
 DISTRO_PN_ALIAS_pn-xf86-video-intel = "Debian=xserver-xorg-video-intel Fedora=xorg-x11-drv-intel Mandriva=x11-driver-video-intel Meego=xorg-x11-drv-intel Ubuntu=xserver-xorg-video-intel"
-RECIPE_LATEST_VERSION_pn-xf86-video-intel = "2.11.0"
-RECIPE_LAST_UPDATE_pn-xf86-video-intel = "Jan 18, 2011"
-RECIPE_MAINTAINER_pn-xf86-video-intel = "Yu Ke <ke.yu@intel.com>"
+RECIPE_LATEST_VERSION_pn-xf86-video-intel = "2.17.0"
+RECIPE_LAST_UPDATE_pn-xf86-video-intel = "Nov 28, 2011"
+RECIPE_MAINTAINER_pn-xf86-video-intel = "Saul Wold <sgw@linux.intel.com>"
 
 RECIPE_STATUS_pn-xf86-video-omapfb = "red"
 DISTRO_PN_ALIAS_pn-xf86-video-omapfb = "OSPDT"
 RECIPE_LATEST_VERSION_pn-xf86-video-omapfb = "0.1.1+git_db636c8436265c3d86"
 RECIPE_LAST_UPDATE_pn-xf86-video-omapfb = "Mar 1, 2010"
-RECIPE_MAINTAINER_pn-xf86-video-omapfb = "Yu Ke <ke.yu@intel.com>"
+RECIPE_MAINTAINER_pn-xf86-video-omapfb = "Saul Wold <sgw@linux.intel.com>"
 
 RECIPE_STATUS_pn-libdrm-poulsbo = "green" # no update needed
 RECIPE_LATEST_VERSION_pn-libdrm-poulsbo = "2.3.0"
@@ -3774,7 +3775,7 @@ RECIPE_TIME_BETWEEN_LAST_TWO_RELEASES_pn-libdrm-poulsbo = "n/a"
 RECIPE_LATEST_RELEASE_DATE_pn-libdrm-poulsbo = "n/a"
 RECIPE_INTEL_SECTION_pn-libdrm-poulsbo = "graphic core"
 RECIPE_LAST_UPDATE_pn-libdrm-poulsbo = "Dec 20, 2010"
-RECIPE_MAINTAINER_pn-libdrm-poulsbo = "Yu Ke <ke.yu@intel.com>"
+RECIPE_MAINTAINER_pn-libdrm-poulsbo = "Saul Wold <sgw@linux.intel.com>"
 DISTRO_PN_ALIAS_pn-libdrm-poulsbo = "Debian=libdrm-intel1 Ubuntu=libdrm-intel1"
 
 RECIPE_STATUS_pn-libxsettings-client = "green"
@@ -4678,9 +4679,9 @@ RECIPE_STATUS_pn-xserver-kdrive  = "red"
 RECIPE_MAINTAINER_pn-xserver-kdrive  = "Xiaofeng Yan <xiaofeng.yan@windriver.com>"
 
 RECIPE_STATUS_pn-xserver-xorg-lite  = "green"
-RECIPE_LATEST_VERSION_pn-xserver-xorg-lite = "1.11.1"
-RECIPE_LATEST_RELEASE_DATE_pn-xserver-xorg-lite = "Sept 24, 2011"
-RECIPE_LAST_UPDATE_pn-xserver-xorg-lite = " Sep 30,2011"
+RECIPE_LATEST_VERSION_pn-xserver-xorg-lite = "1.11.2"
+RECIPE_LATEST_RELEASE_DATE_pn-xserver-xorg-lite = "Nov 04, 2011"
+RECIPE_LAST_UPDATE_pn-xserver-xorg-lite = "Nov 28, 2011"
 RECIPE_MAINTAINER_pn-xserver-xorg-lite  = "Xiaofeng Yan <xiaofeng.yan@windriver.com>"
 
 RECIPE_STATUS_pn-libx11-trim = "green"
@@ -5754,44 +5755,52 @@ RECIPE_MAINTAINER_pn-adt-installer = "Jessica Zhang <jessica.zhang@intel.com>"
 RECIPE_LATEST_VERSION_pn-glew = "1.7.0"
 RECIPE_LATEST_RELEASE_DATE_pn-glew = "Aug 26, 2011"
 RECIPE_LAST_UPDATE_pn-glew = "May 24, 2011"
-RECIPE_MANUAL_CHECK_DATE_pn-glew = "Nov 08, 2011"
+RECIPE_MANUAL_CHECK_DATE_pn-glew = "Nov 28, 2011"
+RECIPE_MAINTAINER_pn-lsbsetup = "Saul Wold <sgw@linux.intel.com>"
 
 RECIPE_LATEST_VERSION_pn-squashfs-tools = "4.2"
 RECIPE_LATEST_RELEASE_DATE_pn-squashfs-tools = "Feb 28, 2011"
 RECIPE_LAST_UPDATE_pn-squashfs-tools = "Oct 21, 2011"
-RECIPE_MANUAL_CHECK_DATE_pn-squashfs-tools = "Nov 08, 2011"
+RECIPE_MANUAL_CHECK_DATE_pn-squashfs-tools = "Nov 28, 2011"
+RECIPE_MAINTAINER_pn-squashfs-tools = "Saul Wold <sgw@linux.intel.com>"
 
 RECIPE_LATEST_VERSION_pn-mpeg2dec = "0.5.1"
 RECIPE_NO_UPDATE_REASON_pn-mpeg2dec = "Why are we currently at 0.4.1?"
 RECIPE_MANUAL_CHECK_DATE_pn-mpeg2dec = "May 24, 2011"
+RECIPE_MAINTAINER_pn-squashfs-tools = "Saul Wold <sgw@linux.intel.com>"
 
-RECIPE_LATEST_VERSION_pn-lame = "3.99"
-RECIPE_LATEST_RELEASE_DATE_pn-lame = "Nov 05, 2004
-RECIPE_LAST_UPDATE_pn-lame = "Jul 04, 2006"
-RECIPE_MANUAL_CHECK_DATE_pn-lame = "Nov 08, 2011"
+RECIPE_LATEST_VERSION_pn-lame = "3.99.3"
+RECIPE_LATEST_RELEASE_DATE_pn-lame = "Nov 26, 2011"
+RECIPE_LAST_UPDATE_pn-lame = "Nov 28, 2011"
+RECIPE_MANUAL_CHECK_DATE_pn-lame = "Nov 28, 2011"
 DISTRO_PN_ALIAS_pn-lame = "Debian=lame Ubuntu=lame"
+RECIPE_MAINTAINER_pn-lame = "Saul Wold <sgw@linux.intel.com>"
 
 RECIPE_LATEST_VERSION_pn-libmad = "0.15.1b"
-RECIPE_LATEST_RELEASE_DATE_pn-libmad = "Feb 18, 2004
+RECIPE_LATEST_RELEASE_DATE_pn-libmad = "Feb 18, 2004"
 RECIPE_LAST_UPDATE_pn-libmad = "Jul 04, 2006"
-RECIPE_MANUAL_CHECK_DATE_pn-libmad = "Nov 08, 2011"
+RECIPE_MANUAL_CHECK_DATE_pn-libmad = "Nov 28, 2011"
+RECIPE_MAINTAINER_pn-libmad = "Saul Wold <sgw@linux.intel.com>"
 
 RECIPE_LATEST_VERSION_pn-libxml-perl = "0.08"
 
 RECIPE_LATEST_VERSION_pn-lsb = "1.4"
 RECIPE_LAST_UPDATE_pn-lsb = "Nov 04, 2010"
 RECIPE_LATEST_RELEASE_DATE_pn-lsb = "Jan 04, 2001"
-RECIPE_MANUAL_CHECK_DATE_pn-lsb = "Nov 08, 2011"
+RECIPE_MANUAL_CHECK_DATE_pn-lsb = "Nov 28, 2011"
 RECIPE_NO_UPDATE_REASON_pn-lsb = "1.4 is fixed version of LSB Test"
+RECIPE_MAINTAINER_pn-libmad = "Saul Wold <sgw@linux.intel.com>"
 
 RECIPE_LATEST_VERSION_pn-lsbsetup = "0.9"
-RECIPE_MANUAL_CHECK_DATE_pn-lsbsetup = "Jan 17, 2011"
+RECIPE_MANUAL_CHECK_DATE_pn-lsbsetup = "Nov 28, 2011"
 DISTRO_PN_ALIAS_pn-lsbsetup = "Windriver"
+RECIPE_MAINTAINER_pn-lsbsetup = "Saul Wold <sgw@linux.intel.com>"
 
 RECIPE_LATEST_VERSION_pn-libxml-simple-perl = "2.18"
 RECIPE_LATEST_VERSION_pn-talloc = "2.0.5"
 RECIPE_STATUS_pn-gthumb = "red"
 RECIPE_LATEST_VERSION_pn-gthumb = "2.12.2"
+RECIPE_MAINTAINER_pn-gthumb = "Saul Wold <sgw@linux.intel.com>"
 
 RECIPE_LATEST_VERSION_pn-libtheora = "1.2.0"
 RECIPE_NO_UPDATE_REASON_pn-libtheora = "1.1.1 is latest stable release not 1.2.0alpha1"
@@ -5816,6 +5825,7 @@ RECIPE_LATEST_RELEASE_DATE_pn-texinfo = "Sep 22, 2008"
 RECIPE_LAST_UPDATE_pn-texinfo = "Sep 16, 2011"
 RECIPE_MANUAL_CHECK_DATE_pn-texinfo = "Nov 22, 2011"
 RECIPE_NO_UPDATE_REASON_pn-texinfo = "Checking script parses directory wrong"
+RECIPE_MAINTAINER_pn-squashfs-tools = "Saul Wold <sgw@linux.intel.com>"
 
 RECIPE_LATEST_VERSION_pn-blktrace = "a788dfde86dfaff8f1c277a233f92c1822e06b76"
 RECIPE_LATEST_VERSION_pn-dtc = "37c0b6a0916c31a5eae0a9ddfcc5d0b8fb4569c6"
@@ -6015,7 +6025,7 @@ RECIPE_MAINTAINER_pn-alsa-tools = "Kai Kang <kai.kang@windriver.com>"
 RECIPE_STATUS_pn-mesa-demos = "red"
 RECIPE_LATEST_VERSION_pn-mesa-demos = "8.0.1"
 RECIPE_LAST_UPDATE_pn-mesa-demos = "Jul 13, 2010"
-RECIPE_MANUAL_CHECK_DATE_pn-mesa-demos = "Jun 7, 2011" 
+RECIPE_MANUAL_CHECK_DATE_pn-mesa-demos = "Nov 28, 2011" 
 
 RECIPE_STATUS_pn-gettext = "green"
 RECIPE_LATEST_VERSION_pn-gettext = "0.18.1.1"
-- 
1.7.6.4



