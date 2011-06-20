Received: from mga02.intel.com ([134.134.136.20])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <ke.yu@intel.com>) id 1QYY7k-00032n-QR
	for openembedded-core@lists.openembedded.org;
	Mon, 20 Jun 2011 08:38:18 +0200
Received: from orsmga002.jf.intel.com ([10.7.209.21])
	by orsmga101.jf.intel.com with ESMTP; 19 Jun 2011 23:34:44 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="4.65,391,1304319600"; d="scan'208";a="15779151"
Received: from kyu3-dev32.bj.intel.com (HELO localhost) ([10.238.153.187])
	by orsmga002.jf.intel.com with ESMTP; 19 Jun 2011 23:34:31 -0700
From: Yu Ke <ke.yu@intel.com>
To: openembedded-core@lists.openembedded.org
Date: Mon, 20 Jun 2011 14:36:01 +0800
Message-Id: <23a31437d02d156a5f0b8e09cd7cbca38a0bc2d8.1308551543.git.ke.yu@intel.com>
X-Mailer: git-send-email 1.7.0.4
In-Reply-To: <cover.1308551543.git.ke.yu@intel.com>
References: <cover.1308551543.git.ke.yu@intel.com>
In-Reply-To: <cover.1308551543.git.ke.yu@intel.com>
References: <cover.1308551543.git.ke.yu@intel.com>
Subject: [PATCH 1/1] distro_tracking_field: update recipe maintainer
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
X-List-Received-Date: Mon, 20 Jun 2011 06:38:18 -0000

reassign Qing's recipe to other team member

Signed-off-by: Yu Ke <ke.yu@intel.com>
---
 .../conf/distro/include/distro_tracking_fields.inc |  111 ++++++++++----------
 1 files changed, 55 insertions(+), 56 deletions(-)

diff --git a/meta/conf/distro/include/distro_tracking_fields.inc b/meta/conf/distro/include/distro_tracking_fields.inc
index f4aa1ea..8318e5f 100644
--- a/meta/conf/distro/include/distro_tracking_fields.inc
+++ b/meta/conf/distro/include/distro_tracking_fields.inc
@@ -1,7 +1,7 @@
 RECIPE_STATUS_pn-diffutils = "green"
 RECIPE_LATEST_VERSION_pn-diffutils = "3.0"
 RECIPE_LAST_UPDATE_pn-diffutils = "Dec 10, 2010"
-RECIPE_MAINTAINER_pn-diffutils = "Qing He <qing.he@intel.com>"
+RECIPE_MAINTAINER_pn-diffutils = "Mei Lei <lei.mei@intel.com>"
 
 RECIPE_STATUS_pn-epdfview = "red"
 RECIPE_LATEST_VERSION_pn-epdfview = "check"
@@ -223,7 +223,7 @@ RECIPE_LATEST_VERSION_pn-dbus = "1.4.1"
 RECIPE_INTEL_SECTION_pn-dbus = "base libs"
 RECIPE_LATEST_RELEASE_DATE_pn-dbus = "12/2010"
 RECIPE_LAST_UPDATE_pn-dbus = "Jan 20, 2011"
-RECIPE_MAINTAINER_pn-dbus = "Qing He <qing.he@intel.com>"
+RECIPE_MAINTAINER_pn-dbus = "Dongxiao Xu <dongxiao.xu@intel.com>"
 
 RECIPE_STATUS_pn-dbus-glib = "green"
 RECIPE_DEPENDENCY_CHECK_pn-dbus-glib = "not done"
@@ -325,7 +325,7 @@ RECIPE_MAINTAINER_pn-libtirpc = "Dongxiao Xu <dongxiao.xu@intel.com>"
 
 RECIPE_STATUS_pn-gdbm = "green"
 RECIPE_LAST_UPDATE_pn-gdbm = "Jul 21, 2006"
-RECIPE_MAINTAINER_pn-gdbm = "Qing He <qing.he@intel.com>"
+RECIPE_MAINTAINER_pn-gdbm = "Yu Ke <ke.yu@intel.com>"
 RECIPE_LATEST_VERSION_pn-gdbm = "1.8.3"
 RECIPE_INTEL_SECTION_pn-gdbm = "base libs"
 RECIPE_LATEST_RELEASE_DATE_pn-gdbm = "10/2002"
@@ -339,7 +339,6 @@ RECIPE_LATEST_RELEASE_DATE_pn-pth = "06/2006"
 
 RECIPE_STATUS_pn-python-pycurl = "yellow"  # several exports to work with python
 RECIPE_LAST_UPDATE_pn-python-pycurl = "Mar 25, 2010"
-RECIPE_MAINTAINER_pn-python-pycurl = "Qing He <qing.he@intel.com>"
 RECIPE_DEPENDENCY_CHECK_pn-python-pycurl = "not done"
 RECIPE_LATEST_VERSION_pn-python-pycurl = "7.19.0"
 RECIPE_PATCH_pn-python-pycurl+no-static-link = "no static libraries"
@@ -426,7 +425,7 @@ RECIPE_COMMENTS_pn-libgcrypt = ""
 
 RECIPE_STATUS_pn-gnutls = "yellow"   # need explict pre configure
 RECIPE_LAST_UPDATE_pn-gnutls = "May 25, 2011"
-RECIPE_MAINTAINER_pn-gnutls = "Qing He <qing.he@intel.com>"
+RECIPE_MAINTAINER_pn-gnutls = "Yu Ke <ke.yu@intel.com>"
 RECIPE_DEPENDENCY_CHECK_pn-gnutls = "done"
 RECIPE_LATEST_VERSION_pn-gnutls = "2.12.5"
 RECIPE_PATCH_pn-gnutls+gnutls-openssl = "unkown"
@@ -439,7 +438,7 @@ RECIPE_COMMENTS_pn-gnutls = "requires libtasn1, but has an internal copy"
 
 RECIPE_STATUS_pn-lzo = "green"
 RECIPE_LAST_UPDATE_pn-lzo = "Dec 31, 2010"
-RECIPE_MAINTAINER_pn-lzo = "Qing He <qing.he@intel.com>"
+RECIPE_MAINTAINER_pn-lzo = "Dexuan Cui <dexuan.cui@intel.com>"
 RECIPE_LATEST_VERSION_pn-lzo = "2.04"
 RECIPE_INTEL_SECTION_pn-lzo = "base libs"
 RECIPE_LATEST_RELEASE_DATE_pn-lzo = "10/2010"
@@ -473,7 +472,7 @@ RECIPE_LATEST_RELEASE_DATE_pn-libnss-mdns = "05/2007"
 
 RECIPE_STATUS_pn-ncurses = "green"
 RECIPE_LAST_UPDATE_pn-ncurses = "Dec 30, 2010"
-RECIPE_MAINTAINER_pn-ncurses = "Qing He <qing.he@intel.com>"
+RECIPE_MAINTAINER_pn-ncurses = "Saul Wold <sgw@linux.intel.com>"
 RECIPE_LATEST_VERSION_pn-ncurses = "5.7"
 RECIPE_INTEL_SECTION_pn-ncurses = "base libs"
 RECIPE_LATEST_RELEASE_DATE_pn-ncurses = "11/2008"
@@ -524,7 +523,7 @@ RECIPE_COMMENTS_pn-libcap = ""
 
 RECIPE_STATUS_pn-libevent = "green"
 RECIPE_LAST_UPDATE_pn-libevent = "Jul 7, 2010"
-RECIPE_MAINTAINER_pn-libevent = "Qing He <qing.he@intel.com>"
+RECIPE_MAINTAINER_pn-libevent = "Scott Garman <scott.a.garman@intel.com>"
 RECIPE_NO_UPDATE_REASON_pn-libevent="libevent 2 is incompatible"
 RECIPE_LATEST_VERSION_pn-libevent = "2.0.11"
 RECIPE_INTEL_SECTION_pn-libevent = "base libs"
@@ -533,7 +532,7 @@ RECIPE_MANUAL_CHECK_DATE_pn-libevent = "May 24, 2011"
 
 RECIPE_STATUS_pn-libnfsidmap = "green"
 RECIPE_LAST_UPDATE_pn-libnfsidmap = "Jan 20, 2011"
-RECIPE_MAINTAINER_pn-libnfsidmap = "Qing He <qing.he@intel.com>"
+RECIPE_MAINTAINER_pn-libnfsidmap = "Scott Garman <scott.a.garman@intel.com>"
 RECIPE_LATEST_VERSION_pn-libnfsidmap = "0.24"
 RECIPE_INTEL_SECTION_pn-libnfsidmap = "base libs"
 RECIPE_LATEST_RELEASE_DATE_pn-libnfsidmap = "12/2010"
@@ -579,7 +578,7 @@ DISTRO_PN_ALIAS_pn-libcheck = "Ubuntu=check Fedora=check OpenSuSE=check"
 RECIPE_STATUS_pn-augeas = "green"
 RECIPE_DEPENDENCY_CHECK_pn-augeas = "done"
 RECIPE_LAST_UPDATE_pn-augeas = "Aug 20, 2010"
-RECIPE_MAINTAINER_pn-augeas = "Qing He <qing.he@intel.com>"
+RECIPE_MAINTAINER_pn-augeas = "Saul Wold <sgw@linux.intel.com>"
 RECIPE_LATEST_VERSION_pn-augeas = "0.7.3"
 RECIPE_INTEL_SECTION_pn-augeas = "base libs"
 RECIPE_TIME_BETWEEN_LAST_TWO_RELEASES_pn-augeas = "1 month"
@@ -594,12 +593,12 @@ RECIPE_INTEL_SECTION_pn-sat-solver = "base libs"
 DISTRO_PN_ALIAS_pn-sat-solver = "OSPDT OpenSuSE=satsolver-tools"
 RECIPE_COMMENTS_pn-sat-solver = ""
 RECIPE_LAST_UPDATE_pn-sat-solver = "Aug 20, 2010"
-RECIPE_MAINTAINER_pn-sat-solver = "Qing He <qing.he@intel.com>"
+RECIPE_MAINTAINER_pn-sat-solver = "Mark Hatle <mark.hatle@windriver.com>"
 
 RECIPE_STATUS_pn-libzypp = "green"
 RECIPE_DEPENDENCY_CHECK_pn-libzypp = "not done"
 RECIPE_LAST_UPDATE_pn-libzypp = "Aug 20, 2010"
-RECIPE_MAINTAINER_pn-libzypp = "Qing He <qing.he@intel.com>"
+RECIPE_MAINTAINER_pn-libzypp = "Mark Hatle <mark.hatle@windriver.com>"
 RECIPE_LATEST_VERSION_pn-libzypp = "git"
 RECIPE_INTEL_SECTION_pn-libzypp = "base libs"
 RECIPE_COMMENTS_pn-libzypp = ""
@@ -708,7 +707,7 @@ RECIPE_TIME_BETWEEN_LAST_TWO_RELEASES_pn-opkg-collateral = "n/a"
 RECIPE_LATEST_RELEASE_DATE_pn-opkg-collateral = "n/a"
 RECIPE_COMMENTS_pn-opkg-collateral = "local scripts follow Poky's MIT license, no need to have its own"
 RECIPE_LAST_UPDATE_pn-opkg-collateral = "Mar 17, 2008"
-RECIPE_MAINTAINER_pn-opkg-collateral = "Qing He <qing.he@intel.com>"
+RECIPE_MAINTAINER_pn-opkg-collateral = "Dongxiao Xu <dongxiao.xu@intel.com>"
 
 RECIPE_STATUS_pn-opkg-config-base = "green"
 RECIPE_DEPENDENCY_CHECK_pn-opkg-config-base = "not done"
@@ -718,7 +717,7 @@ RECIPE_TIME_BETWEEN_LAST_TWO_RELEASES_pn-opkg-config-base = "n/a"
 RECIPE_LATEST_RELEASE_DATE_pn-opkg-config-base = "n/a"
 RECIPE_COMMENTS_pn-opkg-config-base = "local scripts follow Poky's MIT license"
 RECIPE_LAST_UPDATE_pn-opkg-config-base = "Jan 29, 2010"
-RECIPE_MAINTAINER_pn-opkg-config-base = "Qing He <qing.he@intel.com>"
+RECIPE_MAINTAINER_pn-opkg-config-base = "Dongxiao Xu <dongxiao.xu@intel.com>"
 
 RECIPE_STATUS_pn-poky-feed-config-opkg = "green"
 RECIPE_DEPENDENCY_CHECK_pn-poky-feed-config-opkg = "not done"
@@ -728,7 +727,7 @@ RECIPE_TIME_BETWEEN_LAST_TWO_RELEASES_pn-poky-feed-config-opkg = "n/a"
 RECIPE_LATEST_RELEASE_DATE_pn-poky-feed-config-opkg = "n/a"
 RECIPE_COMMENTS_pn-poky-feed-config-opkg = "local scripts follow Poky's MIT license"
 RECIPE_LAST_UPDATE_pn-poky-feed-config-opkg = "Sep 20, 2010"
-RECIPE_MAINTAINER_pn-poky-feed-config-opkg = "Qing He <qing.he@intel.com>"
+RECIPE_MAINTAINER_pn-poky-feed-config-opkg = "Dongxiao Xu <dongxiao.xu@intel.com>"
 
 RECIPE_STATUS_pn-opkg = "green"
 RECIPE_DEPENDENCY_CHECK_pn-opkg = "not done"
@@ -831,7 +830,7 @@ RECIPE_LATEST_RELEASE_DATE_pn-iproute2 = "05/2010"
 RECIPE_COMMENTS_pn-iproute2 = ""
 DISTRO_PN_ALIAS_pn-iproute2 = "OSPDT"
 RECIPE_LAST_UPDATE_pn-iproute2 = "Nov 10, 2010"
-RECIPE_MAINTAINER_pn-iproute2 = "Qing He <qing.he@intel.com>"
+RECIPE_MAINTAINER_pn-iproute2 = "Dongxiao Xu <dongxiao.xu@intel.com>"
 
 RECIPE_STATUS_pn-netbase = "green"
 RECIPE_DEPENDENCY_CHECK_pn-netbase = "not done"
@@ -859,7 +858,7 @@ RECIPE_TIME_BETWEEN_LAST_TWO_RELEASES_pn-busybox = "3 months"
 RECIPE_LATEST_RELEASE_DATE_pn-busybox = "0i6/2010"
 RECIPE_COMMENTS_pn-busybox = "some special overrides/unsets for CFLAGS, etc. need to understand the tricks behind"
 RECIPE_LAST_UPDATE_pn-busybox = "Nov 17, 2010"
-RECIPE_MAINTAINER_pn-busybox = "Qing He <qing.he@intel.com>"
+RECIPE_MAINTAINER_pn-busybox = "Edwin Zhai <edwin.zhai@intel.com>"
 
 RECIPE_STATUS_pn-module-init-tools = "green"
 RECIPE_DEPENDENCY_CHECK_pn-module-init-tools = "not done"
@@ -1020,7 +1019,7 @@ RECIPE_MAINTAINER_pn-gzip = "Scott Garman <scott.a.garman@intel.com>"
 
 RECIPE_STATUS_pn-iptables = "green"
 RECIPE_LAST_UPDATE_pn-iptables = "Nov 10, 2010"
-RECIPE_MAINTAINER_pn-iptables = "Qing He <qing.he@intel.com>"
+RECIPE_MAINTAINER_pn-iptables = "Dongxiao Xu <dongxiao.xu@intel.com>"
 RECIPE_LATEST_VERSION_pn-iptables = "1.4.8"
 
 RECIPE_STATUS_pn-ethtool = "green"
@@ -1045,7 +1044,7 @@ RECIPE_MAINTAINER_pn-shadow = "Scott Garman <scott.a.garman@intel.com>"
 
 RECIPE_STATUS_pn-coreutils = "green"
 RECIPE_LAST_UPDATE_pn-coreutils = "Jan 20, 2011"
-RECIPE_MAINTAINER_pn-coreutils = "Qing He <qing.he@intel.com>"
+RECIPE_MAINTAINER_pn-coreutils = "Mei Lei <lei.mei@intel.com>"
 RECIPE_INTEL_SECTION_pn-coreutils = "base utils"
 RECIPE_LATEST_VERSION_pn-coreutils = "8.9"
 RECIPE_LATEST_RELEASE_DATE_pn-coreutils = "01/2011"
@@ -1156,7 +1155,7 @@ RECIPE_MAINTAINER_pn-apr-util = "Edwin Zhai <edwin.zhai@intel.com>"
 RECIPE_STATUS_pn-apt = "red"
 RECIPE_LATEST_VERSION_pn-apt = "0.7.25.3"
 RECIPE_LAST_UPDATE_pn-apt = "Jun 19, 2008"
-RECIPE_MAINTAINER_pn-apt = "Qing He <qing.he@intel.com>"
+RECIPE_MAINTAINER_pn-apt = "Mei Lei <lei.mei@intel.com>"
 RECIPE_NO_UPDATE_REASON_pn-apt="similar to zypper, defer the upgrading"
 
 RECIPE_STATUS_pn-chrpath = "red"
@@ -1296,12 +1295,12 @@ RECIPE_MAINTAINER_pn-psmisc = "Yu Ke <ke.yu@intel.com>"
 RECIPE_STATUS_pn-boost = "red"
 RECIPE_LATEST_VERSION_pn-boost = "1.44.0"
 RECIPE_LAST_UPDATE_pn-boost = "Aug 19, 2010"
-RECIPE_MAINTAINER_pn-boost = "Qing He <qing.he@intel.com>"
+RECIPE_MAINTAINER_pn-boost = "Saul Wold <sgw@linux.intel.com>"
 
 RECIPE_STATUS_pn-boost-jam-native = "red"
 RECIPE_LATEST_VERSION_pn-boost-jam-native = "3.1.18"
 RECIPE_LAST_UPDATE_pn-boost-jam-native = "Aug 19, 2010"
-RECIPE_MAINTAINER_pn-boost-jam-native = "Qing He <qing.he@intel.com>"
+RECIPE_MAINTAINER_pn-boost-jam-native = "Saul Wold <sgw@linux.intel.com>"
 
 RECIPE_STATUS_pn-libfribidi = "red"
 DISTRO_PN_ALIAS_pn-libfribidi = "OpenSuSE=fribidi Ubuntu=fribidi Mandriva=fribidi Debian=fribidi"
@@ -1322,7 +1321,7 @@ RECIPE_MAINTAINER_pn-rpcbind = "Dongxiao Xu <dongxiao.xu@intel.com>"
 
 RECIPE_STATUS_pn-time = "green"
 RECIPE_LAST_UPDATE_pn-time = "Dec 14, 2006"
-RECIPE_MAINTAINER_pn-time = "Qing He <qing.he@intel.com>"
+RECIPE_MAINTAINER_pn-time = "Yu Ke <ke.yu@intel.com>"
 RECIPE_DEPENDENCY_CHECK_pn-time = "not done"
 RECIPE_LATEST_VERSION_pn-time = "1.7"
 RECIPE_INTEL_SECTION_pn-time = "base utils"
@@ -1332,7 +1331,7 @@ RECIPE_COMMENTS_pn-time = ""
 
 RECIPE_STATUS_pn-bzip2 = "yellow"  # local config scripts
 RECIPE_LAST_UPDATE_pn-bzip2 = "Nov 3, 2010"
-RECIPE_MAINTAINER_pn-bzip2 = "Qing He <qing.he@intel.com>"
+RECIPE_MAINTAINER_pn-bzip2 = "Mei Lei <lei.mei@intel.com>"
 RECIPE_DEPENDENCY_CHECK_pn-bzip2 = "not done"
 RECIPE_LATEST_VERSION_pn-bzip2 = "1.0.6"
 RECIPE_PATCH_pn-bzip2+configure.ac = "override default build method"
@@ -1358,7 +1357,7 @@ RECIPE_COMMENTS_pn-portmap = "most part is under 4-clause BSD, Sun RPC code is u
 
 RECIPE_STATUS_pn-grub = "green"
 RECIPE_LAST_UPDATE_pn-grub = "Oct 8, 2008"
-RECIPE_MAINTAINER_pn-grub = "Qing He <qing.he@intel.com>"
+RECIPE_MAINTAINER_pn-grub = "Dexuan Cui <dexuan.cui@intel.com>"
 RECIPE_NO_UPDATE_REASON_pn-grub="grub2 is a different thing"
 RECIPE_LATEST_VERSION_pn-grub = "0.97"
 RECIPE_INTEL_SECTION_pn-grub = "base utils"
@@ -1389,7 +1388,7 @@ RECIPE_COMMENTS_pn-update-modules = ""
 
 RECIPE_STATUS_pn-udev-extraconf = "green"
 RECIPE_LAST_UPDATE_pn-udev-extraconf = "Jul 19, 2008"
-RECIPE_MAINTAINER_pn-udev-extraconf = "Qing He <qing.he@intel.com>"
+RECIPE_MAINTAINER_pn-udev-extraconf = "Yu Ke <ke.yu@intel.com>"
 RECIPE_DEPENDENCY_CHECK_pn-udev-extraconf = "not done"
 RECIPE_LATEST_VERSION_pn-udev-extraconf = "0.0"
 RECIPE_PATCH_pn-udev-extraconf+mount.blacklist = "add mount blacklist"
@@ -1445,7 +1444,7 @@ RECIPE_COMMENTS_pn-sysfsutils = ""
 
 RECIPE_STATUS_pn-curl = "green"
 RECIPE_LAST_UPDATE_pn-curl = "Nov 9, 2010"
-RECIPE_MAINTAINER_pn-curl = "Qing He <qing.he@intel.com>"
+RECIPE_MAINTAINER_pn-curl = "Mei Lei <lei.mei@intel.com>"
 RECIPE_DEPENDENCY_CHECK_pn-curl = "not done"
 RECIPE_LATEST_VERSION_pn-curl = "7.21.0"
 RECIPE_PATCH_pn-curl+noldlibpath = "no bother set LD_LIBRARY_PATH since we are cross compiling"
@@ -1468,7 +1467,7 @@ RECIPE_COMMENTS_pn-gconf-dbus = "difficult to identify official site and current
 
 RECIPE_STATUS_pn-elfutils ="green" # no update needed
 RECIPE_LAST_UPDATE_pn-elfutils = "Jul 16, 2010"
-RECIPE_MAINTAINER_pn-elfutils = "Qing He <qing.he@intel.com>"
+RECIPE_MAINTAINER_pn-elfutils = "Mei Lei <lei.mei@intel.com>"
 RECIPE_DEPENDENCY_CHECK_pn-gconf-dbus = "not done"
 RECIPE_LATEST_VERSION_pn-elfutils="0.148"
 RECIPE_INTEL_SECTION_pn-gconf-dbus = "base utils"
@@ -1488,7 +1487,7 @@ RECIPE_COMMENTS_pn-pkgconfig = "git as candidate, 0.23: 01/2008, 0.24: 05/2010,
 
 RECIPE_STATUS_pn-less = "green"
 RECIPE_LAST_UPDATE_pn-less = "May 24, 2011"
-RECIPE_MAINTAINER_pn-less = "Qing He <qing.he@intel.com>"
+RECIPE_MAINTAINER_pn-less = "Yu Ke <ke.yu@intel.com>"
 RECIPE_DEPENDENCY_CHECK_pn-less = "done"
 RECIPE_LATEST_VERSION_pn-less = "443"
 RECIPE_INTEL_SECTION_pn-less = "base utils"
@@ -1499,7 +1498,7 @@ RECIPE_MANUAL_CHECK_DATE_pn-less = "May 24, 2011"
 
 RECIPE_STATUS_pn-genext2fs = "green"
 RECIPE_LAST_UPDATE_pn-genext2fs = "Jul 12, 2010"
-RECIPE_MAINTAINER_pn-genext2fs = "Qing He <qing.he@intel.com>"
+RECIPE_MAINTAINER_pn-genext2fs = "Nitin A Kamble <nitin.a.kamble@intel.com>"
 RECIPE_DEPENDENCY_CHECK_pn-genext2fs = "not done"
 RECIPE_LATEST_VERSION_pn-genext2fs = "1.4.1"
 RECIPE_INTEL_SECTION_pn-genext2fs = "base utils"
@@ -1509,7 +1508,7 @@ RECIPE_COMMENTS_pn-genext2fs = ""
 
 RECIPE_STATUS_pn-findutils = "green"
 RECIPE_LAST_UPDATE_pn-findutils = "Jul 8, 2010"
-RECIPE_MAINTAINER_pn-findutils = "Qing He <qing.he@intel.com>"
+RECIPE_MAINTAINER_pn-findutils = "Mei Lei <lei.mei@intel.com>"
 RECIPE_DEPENDENCY_CHECK_pn-findutils = "not done"
 RECIPE_PATCH_pn-findutils_01-27017 = "upstream patch"
 RECIPE_PATCH_pn-findutils_01-28824 = "upstream patch"
@@ -1546,7 +1545,7 @@ RECIPE_COMMENTS_pn-rsync = ""
 
 RECIPE_STATUS_pn-nfs-utils = "yellow"   # no auto stage
 RECIPE_LAST_UPDATE_pn-nfs-utils = "Nov 9, 2010"
-RECIPE_MAINTAINER_pn-nfs-utils = "Qing He <qing.he@intel.com>"
+RECIPE_MAINTAINER_pn-nfs-utils = "Scott Garman <scott.a.garman@intel.com>"
 RECIPE_DEPENDENCY_CHECK_pn-nfs-utils = "done"  # still missing libwrap, libgss, libtirpc
 RECIPE_LATEST_VERSION_pn-nfs-utils = "1.2.3"
 RECIPE_PATCH_pn-nfs-utils+nfs-utils-1.0.6-uclibc.patch = "uclibc missing some functions"
@@ -1558,7 +1557,7 @@ RECIPE_COMMENTS_pn-nfs-utils = ""
 
 RECIPE_STATUS_pn-dropbear = "green"
 RECIPE_LAST_UPDATE_pn-dropbear = "Jul 5, 2010"
-RECIPE_MAINTAINER_pn-dropbear = "Qing He <qing.he@intel.com>"
+RECIPE_MAINTAINER_pn-dropbear = "Mei Lei <lei.mei@intel.com>"
 RECIPE_DEPENDENCY_CHECK_pn-dropbear = "not done"
 RECIPE_LATEST_VERSION_pn-dropbear = "0.52"
 RECIPE_PATCH_pn-dropbear+urandom-xauth-changes-to-options.h = "xauth path change"
@@ -1573,7 +1572,7 @@ RECIPE_COMMENTS_pn-dropbear = ""
 
 RECIPE_STATUS_pn-hal = "green"
 RECIPE_LAST_UPDATE_pn-hal = "Jul 20, 2010"
-RECIPE_MAINTAINER_pn-hal = "Qing He <qing.he@intel.com>"
+RECIPE_MAINTAINER_pn-hal = "Yu Ke <ke.yu@intel.com>"
 RECIPE_DEPENDENCY_CHECK_pn-hal = "not done"
 RECIPE_LATEST_VERSION_pn-hal = "0.5.14"
 RECIPE_INTEL_SECTION_pn-hal = "base utils"
@@ -1583,7 +1582,7 @@ RECIPE_COMMENTS_pn-hal = "The licensing is very complicated, Most files are GPLv
 
 RECIPE_STATUS_pn-hal-info = "green"
 RECIPE_LAST_UPDATE_pn-hal-info = "Jul 20, 2010"
-RECIPE_MAINTAINER_pn-hal-info = "Qing He <qing.he@intel.com>"
+RECIPE_MAINTAINER_pn-hal-info = "Yu Ke <ke.yu@intel.com>"
 RECIPE_DEPENDENCY_CHECK_pn-hal-info = "not done"
 RECIPE_LATEST_VERSION_pn-hal-info = "20091130"
 RECIPE_INTEL_SECTION_pn-hal-info = "base utils"
@@ -1616,7 +1615,7 @@ RECIPE_COMMENTS_pn-js = "1.7.0 is 10/2007, alternative java based packaged calle
 
 RECIPE_STATUS_pn-pcmciautils = "green"
 RECIPE_LAST_UPDATE_pn-pcmciautils = "Jul 14, 2010"
-RECIPE_MAINTAINER_pn-pcmciautils = "Qing He <qing.he@intel.com>"
+RECIPE_MAINTAINER_pn-pcmciautils = "Zhai Edwin <edwin.zhai@intel.com>"
 RECIPE_DEPENDENCY_CHECK_pn-pcmciautils = "not done"
 RECIPE_LATEST_VERSION_pn-pcmciautils = "017"
 RECIPE_PATCH_pn-pcmciautils+makefile-fix = "fix absolute path"
@@ -1650,7 +1649,7 @@ RECIPE_COMMENTS_pn-zip = ""
 
 RECIPE_STATUS_pn-strace = "green"
 RECIPE_LAST_UPDATE_pn-strace = "May 25, 2010"
-RECIPE_MAINTAINER_pn-strace = "Qing He <qing.he@intel.com>"
+RECIPE_MAINTAINER_pn-strace = "Dongxiao Xu <dongxiao.xu@intel.com>"
 RECIPE_DEPENDENCY_CHECK_pn-strace = "not done"
 RECIPE_LATEST_VERSION_pn-strace = "4.5.20"
 RECIPE_INTEL_SECTION_pn-strace = "base utils"
@@ -1680,7 +1679,7 @@ DISTRO_PN_ALIAS_pn-v86d = "Debian=v86d Ubuntu=v86d"
 
 RECIPE_STATUS_pn-udev = "yellow"   # needs to delete old versions
 RECIPE_LAST_UPDATE_pn-udev = "Dec 7, 2010"
-RECIPE_MAINTAINER_pn-udev = "Qing He <qing.he@intel.com>"
+RECIPE_MAINTAINER_pn-udev = "Yu Ke <ke.yu@intel.com>"
 RECIPE_DEPENDENCY_CHECK_pn-udev = "not done"
 RECIPE_LATEST_VERSION_pn-udev = "158"
 RECIPE_INTEL_SECTION_pn-udev = "base utils"
@@ -1690,7 +1689,7 @@ RECIPE_COMMENTS_pn-udev = "may need different versions for different kernels"
 
 RECIPE_STATUS_pn-tzdata = "green"
 RECIPE_LAST_UPDATE_pn-tzdata = "May 24, 2010"
-RECIPE_MAINTAINER_pn-tzdata = "Qing He <qing.he@intel.com>"
+RECIPE_MAINTAINER_pn-tzdata = "Zhai Edwin <edwin.zhai@intel.com>"
 RECIPE_DEPENDENCY_CHECK_pn-tzdata = "not done"
 RECIPE_LATEST_VERSION_pn-tzdata = "2011g"
 RECIPE_INTEL_SECTION_pn-tzdata = "base utils"
@@ -1701,7 +1700,7 @@ RECIPE_COMMENTS_pn-tzdata = ""
 
 RECIPE_STATUS_pn-tinylogin = "yellow"    # replaced, place holder for tracking
 RECIPE_LAST_UPDATE_pn-tinylogin = "Jul 21, 2006"
-RECIPE_MAINTAINER_pn-tinylogin = "Qing He <qing.he@intel.com>"
+RECIPE_MAINTAINER_pn-tinylogin = "Zhai Edwin <edwin.zhai@intel.com>"
 RECIPE_DEPENDENCY_CHECK_pn-tinylogin = "not done"
 RECIPE_LATEST_VERSION_pn-tinylogin = "1.4"
 RECIPE_INTEL_SECTION_pn-tinylogin = "base utils"
@@ -1722,7 +1721,7 @@ RECIPE_COMMENTS_pn-rpm = "the library alone is under dual license"
 
 RECIPE_STATUS_pn-shared-mime-info = "green"
 RECIPE_LAST_UPDATE_pn-shared-mime-info = "Nov 9, 2010"
-RECIPE_MAINTAINER_pn-shared-mime-info = "Qing He <qing.he@intel.com>"
+RECIPE_MAINTAINER_pn-shared-mime-info = "Zhai Edwin <edwin.zhai@intel.com>"
 RECIPE_LATEST_VERSION_pn-shared-mime-info = "0.90"
 RECIPE_INTEL_SECTION_pn-shared-mime-info = "base utils"
 RECIPE_LATEST_RELEASE_DATE_pn-shared-mime-info = "02/2010"
@@ -1748,7 +1747,7 @@ RECIPE_MANUAL_CHECK_DATE_pn-usbutils = "May 24, 2011"
 
 RECIPE_STATUS_pn-pciutils = "yellow"    # custom build system, several hacks
 RECIPE_LAST_UPDATE_pn-pciutils = "Nov 10, 2010"
-RECIPE_MAINTAINER_pn-pciutils = "Qing He <qing.he@intel.com>"
+RECIPE_MAINTAINER_pn-pciutils = "Zhai Edwin <edwin.zhai@intel.com>"
 RECIPE_DEPENDENCY_CHECK_pn-pciutils = "done"
 RECIPE_LATEST_VERSION_pn-pciutils = "3.1.7"
 RECIPE_PATCH_pn-pciutils+configure = "fix for a handwritten config"
@@ -1762,7 +1761,7 @@ RECIPE_COMMENTS_pn-pciutils = ""
 
 RECIPE_STATUS_pn-gamin = "green"
 RECIPE_LAST_UPDATE_pn-gamin = "Aug 12, 2010"
-RECIPE_MAINTAINER_pn-gamin = "Qing He <qing.he@intel.com>"
+RECIPE_MAINTAINER_pn-gamin = "Mei Lei <lei.mei@intel.com>"
 RECIPE_DEPENDENCY_CHECK_pn-gamin = "done"
 RECIPE_LATEST_VERSION_pn-gamin = "0.1.10"
 RECIPE_PATCH_pn-gamin+no-abstract-socket = "disable abstract socket support"
@@ -1774,7 +1773,7 @@ RECIPE_COMMENTS_pn-gamin = ""
 RECIPE_STATUS_pn-zypper = "green"
 RECIPE_DEPENDENCY_CHECK_pn-zypper = "not done"
 RECIPE_LAST_UPDATE_pn-zypper = "Aug 20, 2010"
-RECIPE_MAINTAINER_pn-zypper = "Qing He <qing.he@intel.com>"
+RECIPE_MAINTAINER_pn-zypper = "Mark Hatle <mark.hatle@windriver.com>"
 RECIPE_LATEST_VERSION_pn-zypper = "git"
 RECIPE_INTEL_SECTION_pn-zypper = "base utils"
 RECIPE_COMMENTS_pn-zypper = ""
@@ -1792,7 +1791,7 @@ RECIPE_LATEST_VERSION_pn-sysklogd = "1.5"
 
 RECIPE_STATUS_pn-gawk = "red"    # need upgrade
 RECIPE_LAST_UPDATE_pn-gawk = "Aug 27, 2010"
-RECIPE_MAINTAINER_pn-gawk = "Qing He <qing.he@intel.com>"
+RECIPE_MAINTAINER_pn-gawk = "Mei Lei <lei.mei@intel.com>"
 RECIPE_LATEST_VERSION_pn-gawk = "3.1.7"
 
 RECIPE_STATUS_pn-mktemp="red"
@@ -1818,11 +1817,11 @@ RECIPE_LATEST_VERSION_pn-cracklib="2.8.18"
 RECIPE_STATUS_pn-openobex = "red"
 RECIPE_LATEST_VERSION_pn-openobex = "1.5"
 RECIPE_LAST_UPDATE_pn-openobex = "Jul 31, 2009"
-RECIPE_MAINTAINER_pn-openobex = "Qing He <qing.he@intel.com>"
+RECIPE_MAINTAINER_pn-openobex = "Dexuan Cui <dexuan.cui@intel.com>"
 
 RECIPE_STATUS_pn-sed = "green"
 RECIPE_LAST_UPDATE_pn-sed = "Sep 1, 2010"
-RECIPE_MAINTAINER_pn-sed = "Qing He <qing.he@intel.com>"
+RECIPE_MAINTAINER_pn-sed = "Zhai Edwin <edwin.zhai@intel.com>"
 RECIPE_DEPENDENCY_CHECK_pn-sed = "not done"
 RECIPE_LATEST_VERSION_pn-sed = "4.2.1"
 RECIPE_INTEL_SECTION_pn-sed = "base utils"
@@ -1833,12 +1832,12 @@ RECIPE_COMMENTS_pn-sed = "Qing maintains GPLv2 sed, while Dongxiao maintains GPL
 RECIPE_STATUS_pn-aspell = "red"
 RECIPE_LATEST_VERSION_pn-aspell = "0.60.6"
 RECIPE_LAST_UPDATE_pn-aspell = "Aug 16, 2010"
-RECIPE_MAINTAINER_pn-aspell = "Qing He <qing.he@intel.com>"
+RECIPE_MAINTAINER_pn-aspell = "Mei Lei <lei.mei@intel.com>"
 
 RECIPE_STATUS_pn-parted = "green"
 RECIPE_LATEST_VERSION_pn-parted = "2.3"
 RECIPE_LAST_UPDATE_pn-parted = "Dec 30, 2010"
-RECIPE_MAINTAINER_pn-parted = "Qing He <qing.he@intel.com>"
+RECIPE_MAINTAINER_pn-parted = "Zhai Edwin <edwin.zhai@intel.com>"
 
 RECIPE_STATUS_pn-resolvconf = "green"
 RECIPE_LATEST_VERSION_pn-resolvconf = "1.48"
@@ -1850,20 +1849,20 @@ RECIPE_COMMENTS_pn-resolvconf = "Lastest Unstable version is 1.56"
 RECIPE_STATUS_pn-openswan = "red"
 RECIPE_LATEST_VERSION_pn-openswan = "2.6.26"
 RECIPE_LAST_UPDATE_pn-openswan = "Apr 13, 2007"
-RECIPE_MAINTAINER_pn-openswan = "Qing He <qing.he@intel.com>"
+RECIPE_MAINTAINER_pn-openswan = "Dexuan Cui <dexuan.cui@intel.com>"
 
 RECIPE_STATUS_pn-u-boot-mkimage = "red"
 DISTRO_PN_ALIAS_pn-u-boot-mkimage = "Ubuntu=uboot-mkimage Debian=uboot-mkimage"
 RECIPE_NO_UPDATE_REASON_pn-u-boot-mkimage ="target version is not used"
 RECIPE_LATEST_VERSION_pn-u-boot-mkimage = "2010.03"
 RECIPE_LAST_UPDATE_pn-u-boot-mkimage = "Dec 15, 2009"
-RECIPE_MAINTAINER_pn-u-boot-mkimage = "Qing He <qing.he@intel.com>"
+RECIPE_MAINTAINER_pn-u-boot-mkimage = "Saul Wold <sgw@linux.intel.com>"
 
 RECIPE_STATUS_pn-zaurusd = "green"
 RECIPE_LATEST_VERSION_pn-zaurusd = "0.0+svnr426"
 DISTRO_PN_ALIAS_pn-zaurusd = "OpenedHand"
 RECIPE_LAST_UPDATE_pn-zaurusd = "Jan 20, 2011"
-RECIPE_MAINTAINER_pn-zaurusd = "Qing He <qing.he@intel.com>"
+RECIPE_MAINTAINER_pn-zaurusd = "Saul Wold <sgw@linux.intel.com>"
 RECIPE_MANUAL_CHECK_DATE_pn-zip = "May 24, 2011"
 
 RECIPE_STATUS_pn-yaffs2-utils = "red"
@@ -1880,7 +1879,7 @@ RECIPE_MAINTAINER_pn-usbinit = "Saul Wold <sgw@linux.intel.com>"
 RECIPE_STATUS_pn-ubootchart = "red"
 RECIPE_LATEST_VERSION_pn-ubootchart = "0.0+r12"
 RECIPE_LAST_UPDATE_pn-ubootchart = "Nov 6, 2007"
-RECIPE_MAINTAINER_pn-ubootchart = "Qing He <qing.he@intel.com>"
+RECIPE_MAINTAINER_pn-ubootchart = "Saul Wold <sgw@linux.intel.com>"
 DISTRO_PN_ALIAS_pn-ubootchart = "OSPDT upstream=http://code.google.com/p/ubootchart"
 
 RECIPE_STATUS_pn-tiff = "red"
@@ -1896,12 +1895,12 @@ RECIPE_MAINTAINER_pn-libexif = "Saul Wold <sgw@linux.intel.com>"
 RECIPE_STATUS_pn-setserial = "red"
 RECIPE_LATEST_VERSION_pn-setserial = "2.17"
 RECIPE_LAST_UPDATE_pn-setserial = "Jul 21, 2006"
-RECIPE_MAINTAINER_pn-setserial = "Qing He <qing.he@intel.com>"
+RECIPE_MAINTAINER_pn-setserial = "Zhai Edwin <edwin.zhai@intel.com>"
 
 RECIPE_STATUS_pn-hdparm = "red"
 RECIPE_LATEST_VERSION_pn-hdparm = "6.3"
 RECIPE_LAST_UPDATE_pn-hdparm = "Jul 21, 2006"
-RECIPE_MAINTAINER_pn-hdparm = "Qing He <qing.he@intel.com>"
+RECIPE_MAINTAINER_pn-hdparm = "Dexuan Cui <dexuan.cui@intel.com>"
 
 RECIPE_STATUS_pn-wbxml2 = "red"
 RECIPE_LATEST_VERSION_pn-wbxml2 = "0.10.8"
@@ -1911,7 +1910,7 @@ RECIPE_MAINTAINER_pn-wbxml2 = "Saul Wold <sgw@linux.intel.com>"
 RECIPE_STATUS_pn-qemu-config = "red"
 RECIPE_LATEST_VERSION_pn-qemu-config = "1.0"
 DISTRO_PN_ALIAS_pn-qemu-config = "OpenedHand"
-RECIPE_MAINTAINER_pn-qemu-config = "Qing He <qing.he@intel.com>"
+RECIPE_MAINTAINER_pn-qemu-config = "Zhai Edwin <edwin.zhai@intel.com>"
 
 RECIPE_STATUS_pn-qemu-helper-native = "green"
 RECIPE_DEPENDENCY_CHECK_pn-qemu-helper-native = "not done"
-- 
1.7.0.4



