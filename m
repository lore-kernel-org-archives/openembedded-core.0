Received: from mga02.intel.com ([134.134.136.20])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <ke.yu@intel.com>) id 1QBhCN-00085V-FO
	for openembedded-core@lists.openembedded.org;
	Mon, 18 Apr 2011 07:40:36 +0200
Received: from orsmga001.jf.intel.com ([10.7.209.18])
	by orsmga101.jf.intel.com with ESMTP; 17 Apr 2011 22:38:14 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="4.64,231,1301900400"; d="scan'208";a="734879960"
Received: from kyu3-dev32.bj.intel.com (HELO localhost) ([10.238.153.102])
	by orsmga001.jf.intel.com with ESMTP; 17 Apr 2011 22:38:13 -0700
Message-Id: <a9d8e087de5aca63f1c0ad9c6c66cee8fce66f84.1303105369.git.ke.yu@intel.com>
In-Reply-To: <cover.1303105369.git.ke.yu@intel.com>
References: <cover.1303105369.git.ke.yu@intel.com>
Old-Date: Mon, 18 Apr 2011 13:25:33 +0800
Date: Mon, 18 Apr 2011 13:45:44 +0800
To: openembedded-core@lists.openembedded.org
From: Yu Ke <ke.yu@intel.com>
Subject: [PATCH 3/3] distro tracking: reassign Kevin's recipe
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
X-List-Received-Date: Mon, 18 Apr 2011 05:40:36 -0000

From: Yu Ke <ke.yu@intel.com>

Signed-off-by: Yu Ke <ke.yu@intel.com>
---
 .../conf/distro/include/distro_tracking_fields.inc |   66 ++++++++++----------
 1 files changed, 33 insertions(+), 33 deletions(-)

diff --git a/meta/conf/distro/include/distro_tracking_fields.inc b/meta/conf/distro/include/distro_tracking_fields.inc
index ac6feec..542b865 100644
--- a/meta/conf/distro/include/distro_tracking_fields.inc
+++ b/meta/conf/distro/include/distro_tracking_fields.inc
@@ -153,7 +153,7 @@ RECIPE_TIME_BETWEEN_LAST_TWO_RELEASES_pn-eggdbus = "4 months"
 RECIPE_LATEST_RELEASE_DATE_pn-eggdbus = "11/2009"
 RECIPE_COMMENTS_pn-eggdbus = "http://mail.gnome.org/archives/gtk-devel-list/2008-December/msg00059.html contains more detail introduction"
 RECIPE_LAST_UPDATE_pn-eggdbus = "Jan 29, 2010"
-RECIPE_MAINTAINER_pn-eggdbus = "Kevin Tian <kevin.tian@intel.com>"
+RECIPE_MAINTAINER_pn-eggdbus = "Zhai Edwin <edwin.zhai@intel.com>"
 
 RECIPE_STATUS_pn-libdaemon = "green"
 RECIPE_DEPENDENCY_CHECK_pn-libdaemon = "not done"
@@ -163,7 +163,7 @@ RECIPE_TIME_BETWEEN_LAST_TWO_RELEASES_pn-libdaemon = "15 months"
 RECIPE_LATEST_RELEASE_DATE_pn-libdaemon = "11/2009"
 RECIPE_COMMENTS_pn-libdaemon = ""
 RECIPE_LAST_UPDATE_pn-libdaemon = "Jun 23, 2010"
-RECIPE_MAINTAINER_pn-libdaemon = "Kevin Tian <kevin.tian@intel.com>"
+RECIPE_MAINTAINER_pn-libdaemon = "Yu Ke <ke.yu@intel.com>"
 
 RECIPE_STATUS_pn-glib-2.0 = "green"
 DISTRO_PN_ALIAS_pn-glib-2.0 = "Meego=glib2 Fedora=glib2 OpenSuSE=glib2 Ubuntu=glib2.0 Mandriva=glib2.0 Debian=glib2.0"
@@ -221,7 +221,7 @@ RECIPE_TIME_BETWEEN_LAST_TWO_RELEASES_pn-expat = "17 months"
 RECIPE_LATEST_RELEASE_DATE_pn-expat = "06/2007"
 RECIPE_COMMENTS_pn-expat = ""
 RECIPE_LAST_UPDATE_pn-expat = "Jul 7, 2010"
-RECIPE_MAINTAINER_pn-expat = "Kevin Tian <kevin.tian@intel.com>"
+RECIPE_MAINTAINER_pn-expat = "Scott Garman <scott.a.garman@intel.com>"
 
 RECIPE_STATUS_pn-dbus = "green"
 RECIPE_LATEST_VERSION_pn-dbus = "1.4.1"
@@ -262,7 +262,7 @@ RECIPE_TIME_BETWEEN_LAST_TWO_RELEASES_pn-libpng = "1 month"
 RECIPE_LATEST_RELEASE_DATE_pn-libpng = "06/2010"
 RECIPE_COMMENTS_pn-libpng = ""
 RECIPE_LAST_UPDATE_pn-libpng = "Jul 20, 2010"
-RECIPE_MAINTAINER_pn-libpng = "Kevin Tian <kevin.tian@intel.com>"
+RECIPE_MAINTAINER_pn-libpng = "Scott Garman <scott.a.garman@intel.com>"
 
 RECIPE_STATUS_pn-libidn = "green"
 RECIPE_DEPENDENCY_CHECK_pn-libidn = "not done"
@@ -272,7 +272,7 @@ RECIPE_TIME_BETWEEN_LAST_TWO_RELEASES_pn-libidn = "3 months"
 RECIPE_LATEST_RELEASE_DATE_pn-libidn = "05/2010"
 RECIPE_COMMENTS_pn-libidn = ""
 RECIPE_LAST_UPDATE_pn-libidn = "Jul 20, 2010"
-RECIPE_MAINTAINER_pn-libidn = "Kevin Tian <kevin.tian@intel.com>"
+RECIPE_MAINTAINER_pn-libidn = "Yu Ke <ke.yu@intel.com>"
 
 RECIPE_STATUS_pn-glibc = "green"
 RECIPE_DEPENDENCY_CHECK_pn-glibc = "not done"
@@ -611,7 +611,7 @@ RECIPE_TIME_BETWEEN_LAST_TWO_RELEASES_pn-dbus-wait = "n/a"
 RECIPE_LATEST_RELEASE_DATE_pn-dbus-wait = "08/2008"
 RECIPE_COMMENTS_pn-dbus-wait = "o-hand project"
 RECIPE_LAST_UPDATE_pn-dbus-wait = "Aug 12, 2010"
-RECIPE_MAINTAINER_pn-dbus-wait= "Kevin Tian <kevin.tian@intel.com>"
+RECIPE_MAINTAINER_pn-dbus-wait= "Zhai Edwin <edwin.zhai@intel.com>"
 
 RECIPE_STATUS_pn-e2fsprogs = "yellow" # patch comment
 RECIPE_DEPENDENCY_CHECK_pn-e2fsprogs = "not done"
@@ -624,7 +624,7 @@ RECIPE_TIME_BETWEEN_LAST_TWO_RELEASES_pn-e2fsprogs = "2 months"
 RECIPE_LATEST_RELEASE_DATE_pn-e2fsprogs = "05/2010"
 RECIPE_COMMENTS_pn-e2fsprogs = ""
 RECIPE_LAST_UPDATE_pn-e2fsprogs = "Jun 1, 2010"
-RECIPE_MAINTAINER_pn-e2fsprogs = "Kevin Tian <kevin.tian@intel.com>"
+RECIPE_MAINTAINER_pn-e2fsprogs = "Scott Garman <scott.a.garman@intel.com>"
 
 RECIPE_STATUS_pn-initramfs-boot = "green"
 RECIPE_DEPENDENCY_CHECK_pn-initramfs-boot = "not done"
@@ -635,7 +635,7 @@ RECIPE_TIME_BETWEEN_LAST_TWO_RELEASES_pn-initramfs-boot = "n/a"
 RECIPE_LATEST_RELEASE_DATE_pn-initramfs-boot = "n/a"
 RECIPE_COMMENTS_pn-initramfs-boot = "local scripts follow Poky's MIT license"
 RECIPE_LAST_UPDATE_pn-initramfs-boot = "Nov 5, 2008"
-RECIPE_MAINTAINER_pn-initramfs-boot = "Kevin Tian <kevin.tian@intel.com>"
+RECIPE_MAINTAINER_pn-initramfs-boot = "Yu Ke <ke.yu@intel.com>"
 
 RECIPE_STATUS_pn-initramfs-live-boot = "green"
 RECIPE_DEPENDENCY_CHECK_pn-initramfs-live-boot = "not done"
@@ -646,7 +646,7 @@ RECIPE_TIME_BETWEEN_LAST_TWO_RELEASES_pn-initramfs-live-boot = "n/a"
 RECIPE_LATEST_RELEASE_DATE_pn-initramfs-live-boot = "n/a"
 RECIPE_COMMENTS_pn-initramfs-live-boot = "local scripts follow Poky's MIT license"
 RECIPE_LAST_UPDATE_pn-initramfs-live-boot = "Sep 10, 2008"
-RECIPE_MAINTAINER_pn-initramfs-live-boot = "Kevin Tian <kevin.tian@intel.com>"
+RECIPE_MAINTAINER_pn-initramfs-live-boot = "Yu Ke <ke.yu@intel.com>"
 
 RECIPE_STATUS_pn-initramfs-live-install = "green"
 RECIPE_DEPENDENCY_CHECK_pn-initramfs-live-install = "not done"
@@ -657,7 +657,7 @@ RECIPE_TIME_BETWEEN_LAST_TWO_RELEASES_pn-initramfs-live-install = "n/a"
 RECIPE_LATEST_RELEASE_DATE_pn-initramfs-live-install = "n/a"
 RECIPE_COMMENTS_pn-initramfs-live-install = "local scripts follow Poky's MIT license"
 RECIPE_LAST_UPDATE_pn-initramfs-live-install = "Oct 8, 2008"
-RECIPE_MAINTAINER_pn-initramfs-live-install = "Kevin Tian <kevin.tian@intel.com>"
+RECIPE_MAINTAINER_pn-initramfs-live-install = "Yu Ke <ke.yu@intel.com>"
 
 RECIPE_STATUS_pn-initscripts = "green"
 RECIPE_DEPENDENCY_CHECK_pn-initscripts = "not done"
@@ -668,7 +668,7 @@ RECIPE_TIME_BETWEEN_LAST_TWO_RELEASES_pn-initscripts = "n/a"
 RECIPE_LATEST_RELEASE_DATE_pn-initscripts = "n/a"
 RECIPE_COMMENTS_pn-initscripts = "local scripts follow Poky's MIT license"
 RECIPE_LAST_UPDATE_pn-initscripts = "Jul 21, 2006"
-RECIPE_MAINTAINER_pn-initscripts = "Kevin Tian <kevin.tian@intel.com>"
+RECIPE_MAINTAINER_pn-initscripts = "Yu Ke <ke.yu@intel.com>"
 
 RECIPE_STATUS_pn-keymaps = "green" 
 RECIPE_DEPENDENCY_CHECK_pn-keymaps = "not done"
@@ -679,13 +679,13 @@ RECIPE_TIME_BETWEEN_LAST_TWO_RELEASES_pn-keymaps = "n/a"
 RECIPE_LATEST_RELEASE_DATE_pn-keymaps = "n/a"
 RECIPE_COMMENTS_pn-keymaps = "local scripts follow Poky's MIT license, however it contains a GPL notation"
 RECIPE_LAST_UPDATE_pn-keymaps = "Jul 21, 2006"
-RECIPE_MAINTAINER_pn-keymaps = "Kevin Tian <kevin.tian@intel.com>"
+RECIPE_MAINTAINER_pn-keymaps = "Yu Ke <ke.yu@intel.com>"
 
 RECIPE_STATUS_pn-modutils = "red"
 RECIPE_DEPENDENCY_CHECK_pn-modutils-initscripts = "not done"
 RECIPE_LATEST_VERSION_pn-modutils = "2.4.27"
 RECIPE_LAST_UPDATE_pn-modutils = "Jul 21, 2006"
-RECIPE_MAINTAINER_pn-modutils = "Kevin Tian <kevin.tian@intel.com>"
+RECIPE_MAINTAINER_pn-modutils = "Yu Ke <ke.yu@intel.com>"
 DISTRO_PN_ALIAS_pn-modutils = "Ubuntu=module-init-tools Fedora=module-init-tools"
 
 RECIPE_STATUS_pn-modutils-initscripts = "green"
@@ -696,7 +696,7 @@ RECIPE_INTEL_SECTION_pn-modutils-initscripts = "base utils"
 RECIPE_TIME_BETWEEN_LAST_TWO_RELEASES_pn-modutils-initscripts = "n/a"
 RECIPE_LATEST_RELEASE_DATE_pn-modutils-initscripts = "n/a"
 RECIPE_COMMENTS_pn-modutils-initscripts = "local scripts follow Poky's MIT license"
-RECIPE_MAINTAINER_pn-modutils-initscripts = "Kevin Tian <kevin.tian@intel.com>"
+RECIPE_MAINTAINER_pn-modutils-initscripts = "Yu Ke <ke.yu@intel.com>"
 
 RECIPE_STATUS_pn-opkg-collateral = "green" 
 RECIPE_DEPENDENCY_CHECK_pn-opkg-collateral = "not done"
@@ -707,7 +707,7 @@ RECIPE_TIME_BETWEEN_LAST_TWO_RELEASES_pn-opkg-collateral = "n/a"
 RECIPE_LATEST_RELEASE_DATE_pn-opkg-collateral = "n/a"
 RECIPE_COMMENTS_pn-opkg-collateral = "local scripts follow Poky's MIT license, no need to have its own"
 RECIPE_LAST_UPDATE_pn-opkg-collateral = "Mar 17, 2008"
-RECIPE_MAINTAINER_pn-opkg-collateral = "Kevin Tian <kevin.tian@intel.com>"
+RECIPE_MAINTAINER_pn-opkg-collateral = "Qing He <qing.he@intel.com>"
 
 RECIPE_STATUS_pn-opkg-config-base = "green"
 RECIPE_DEPENDENCY_CHECK_pn-opkg-config-base = "not done"
@@ -717,7 +717,7 @@ RECIPE_TIME_BETWEEN_LAST_TWO_RELEASES_pn-opkg-config-base = "n/a"
 RECIPE_LATEST_RELEASE_DATE_pn-opkg-config-base = "n/a"
 RECIPE_COMMENTS_pn-opkg-config-base = "local scripts follow Poky's MIT license"
 RECIPE_LAST_UPDATE_pn-opkg-config-base = "Jan 29, 2010"
-RECIPE_MAINTAINER_pn-opkg-config-base = "Kevin Tian <kevin.tian@intel.com>"
+RECIPE_MAINTAINER_pn-opkg-config-base = "Qing He <qing.he@intel.com>"
 
 RECIPE_STATUS_pn-poky-feed-config-opkg = "green"
 RECIPE_DEPENDENCY_CHECK_pn-poky-feed-config-opkg = "not done"
@@ -727,7 +727,7 @@ RECIPE_TIME_BETWEEN_LAST_TWO_RELEASES_pn-poky-feed-config-opkg = "n/a"
 RECIPE_LATEST_RELEASE_DATE_pn-poky-feed-config-opkg = "n/a"
 RECIPE_COMMENTS_pn-poky-feed-config-opkg = "local scripts follow Poky's MIT license"
 RECIPE_LAST_UPDATE_pn-poky-feed-config-opkg = "Sep 20, 2010"
-RECIPE_MAINTAINER_pn-poky-feed-config-opkg = "Kevin Tian <kevin.tian@intel.com>"
+RECIPE_MAINTAINER_pn-poky-feed-config-opkg = "Qing He <qing.he@intel.com>"
 
 RECIPE_STATUS_pn-opkg = "green"
 RECIPE_DEPENDENCY_CHECK_pn-opkg = "not done"
@@ -777,7 +777,7 @@ RECIPE_TIME_BETWEEN_LAST_TWO_RELEASES_pn-psplash = "6 months"
 RECIPE_LATEST_RELEASE_DATE_pn-psplash = "05/2009"
 RECIPE_COMMENTS_pn-psplash = ""
 RECIPE_LAST_UPDATE_pn-psplash = "Jul 13, 2010"
-RECIPE_MAINTAINER_pn-psplash = "Kevin Tian <kevin.tian@intel.com>"
+RECIPE_MAINTAINER_pn-psplash = "Scott Garman <scott.a.garman@intel.com>"
 
 RECIPE_STATUS_pn-pax-utils = "green"
 RECIPE_DEPENDENCY_CHECK_pn-pax-utils = "not done"
@@ -864,7 +864,7 @@ RECIPE_TIME_BETWEEN_LAST_TWO_RELEASES_pn-module-init-tools = "3 months"
 RECIPE_LATEST_RELEASE_DATE_pn-module-init-tools = "10/2009"
 RECIPE_COMMENTS_pn-module-init-tools = "most tweaks about alternative handle and rename"
 RECIPE_LAST_UPDATE_pn-module-init-tools = "Jul 21, 2010"
-RECIPE_MAINTAINER_pn-module-init-tools = "Kevin Tian <kevin.tian@intel.com>"
+RECIPE_MAINTAINER_pn-module-init-tools = "Yu Ke <ke.yu@intel.com>"
 
 RECIPE_STATUS_pn-base-files = "green"
 RECIPE_DEPENDENCY_CHECK_pn-base-files = "not done"
@@ -874,7 +874,7 @@ RECIPE_TIME_BETWEEN_LAST_TWO_RELEASES_pn-base-files = "n/a"
 RECIPE_LATEST_RELEASE_DATE_pn-base-files = "n/a"
 RECIPE_COMMENTS_pn-base-files = "licenses are pacakges here; all local files. RP said that the version 3.0.14 may come from debian. no need to upgrade it now"
 RECIPE_LAST_UPDATE_pn-base-files = "Jul 21, 2006"
-RECIPE_MAINTAINER_pn-base-files = "Kevin Tian <kevin.tian@intel.com>"
+RECIPE_MAINTAINER_pn-base-files = "Yu Ke <ke.yu@intel.com>"
 
 RECIPE_STATUS_pn-base-passwd = "green"
 RECIPE_DEPENDENCY_CHECK_pn-base-passwd = "not done"
@@ -886,7 +886,7 @@ RECIPE_TIME_BETWEEN_LAST_TWO_RELEASES_pn-base-passwd = "1 year"
 RECIPE_LATEST_RELEASE_DATE_pn-base-passwd = "09/2009"
 RECIPE_COMMENTS_pn-base-passwd = ""
 RECIPE_LAST_UPDATE_pn-base-passwd = "Jul 6, 2010"
-RECIPE_MAINTAINER_pn-base-passwd = "Kevin Tian <kevin.tian@intel.com>"
+RECIPE_MAINTAINER_pn-base-passwd = "Scott Garman <scott.a.garman@intel.com>"
 
 RECIPE_STATUS_pn-apmd = "green" 
 RECIPE_DEPENDENCY_CHECK_pn-apmd = "not done"
@@ -911,7 +911,7 @@ RECIPE_TIME_BETWEEN_LAST_TWO_RELEASES_pn-gperf = "2 years"
 RECIPE_LATEST_RELEASE_DATE_pn-gperf = "02/2009"
 RECIPE_COMMENTS_pn-gperf = "3.0.4 is GPLv3, however we only require native version so far"
 RECIPE_LAST_UPDATE_pn-gperf = "Jul 19, 2010"
-RECIPE_MAINTAINER_pn-gperf = "Kevin Tian <kevin.tian@intel.com>"
+RECIPE_MAINTAINER_pn-gperf = "Scott Garman <scott.a.garman@intel.com>"
 
 RECIPE_STATUS_pn-valgrind = "green"
 RECIPE_DEPENDENCY_CHECK_pn-valgrind = "not done"
@@ -1000,7 +1000,7 @@ RECIPE_MAINTAINER_pn-screen = "Dexuan Cui <dexuan.cui@intel.com>"
 
 RECIPE_STATUS_pn-gzip = "green"
 RECIPE_LAST_UPDATE_pn-gzip = "Jul 23, 2010"
-RECIPE_MAINTAINER_pn-gzip = "Kevin Tian <kevin.tian@intel.com>"
+RECIPE_MAINTAINER_pn-gzip = "Scott Garman <scott.a.garman@intel.com>"
 RECIPE_LATEST_VERSION_pn-gzip = "1.4"
 
 RECIPE_STATUS_pn-iptables = "green"
@@ -1022,7 +1022,7 @@ RECIPE_LATEST_VERSION_pn-net-tools = "1.60-23"
 RECIPE_STATUS_pn-shadow = "green"
 RECIPE_DEPENDENCY_CHECK_pn-shadow = "not done"
 RECIPE_LAST_UPDATE_pn-shadow = "Aug 6, 2010"
-RECIPE_MAINTAINER_pn-shadow = "Kevin Tian <kevin.tian@intel.com>"
+RECIPE_MAINTAINER_pn-shadow = "Scott Garman <scott.a.garman@intel.com>"
 RECIPE_LATEST_VERSION_pn-shadow = "4.1.4.2"
 RECIPE_INTEL_SECTION_pn-shadow = "base utils"
 RECIPE_TIME_BETWEEN_LAST_TWO_RELEASES_pn-shadow = "2 months"
@@ -1118,7 +1118,7 @@ RECIPE_MAINTAINER_pn-libatomics-ops = "Scott Garman <scott.a.garman@intel.com>"
 RECIPE_STATUS_pn-libffi  = "red"
 RECIPE_LATEST_VERSION_pn-libffi  = "3.0.9"
 RECIPE_LAST_UPDATE_pn-libffi = "Oct 15, 2010"
-RECIPE_MAINTAINER_pn-libffi  = "Kevin Tian <kevin.tian@intel.com>"
+RECIPE_MAINTAINER_pn-libffi  = "Yu Ke <ke.yu@intel.com>"
 
 RECIPE_STATUS_pn-libgdbus = "green"
 RECIPE_DEPENDENCY_CHECK_pn-libgdbus = "not done"
@@ -1148,12 +1148,12 @@ RECIPE_NO_UPDATE_REASON_pn-apt="similar to zypper, defer the upgrading"
 RECIPE_STATUS_pn-chrpath = "red"
 RECIPE_LATEST_VERSION_pn-chrpath = "0.13-2"
 RECIPE_LAST_UPDATE_pn-chrpath = "Dec 15, 2009"
-RECIPE_MAINTAINER_pn-chrpath = "Kevin Tian <kevin.tian@intel.com>"
+RECIPE_MAINTAINER_pn-chrpath = "Scott Garman <scott.a.garman@intel.com>"
 
 RECIPE_STATUS_pn-dosfstools = "red"
 RECIPE_LATEST_VERSION_pn-dosfstools = "2.11"
 RECIPE_LAST_UPDATE_pn-dosfstools = "Oct 11, 2007"
-RECIPE_MAINTAINER_pn-dosfstools = "Kevin Tian <kevin.tian@intel.com>"
+RECIPE_MAINTAINER_pn-dosfstools = "Scott Garman <scott.a.garman@intel.com>"
 
 RECIPE_STATUS_pn-eee-acpi-scripts = "green"
 RECIPE_LATEST_VERSION_pn-eee-acpi-scripts = "1.1.11+e224937ba51165e2a52252f9a113c8a82c01bb36"
@@ -1180,7 +1180,7 @@ RECIPE_MAINTAINER_pn-insserv = "Scott Garman <scott.a.garman@intel.com>"
 
 RECIPE_STATUS_pn-modutils-collateral = "red"
 RECIPE_LATEST_VERSION_pn-modutils-collateral = "1.0"
-RECIPE_MAINTAINER_pn-modutils-collateral = "Kevin Tian <kevin.tian@intel.com>"
+RECIPE_MAINTAINER_pn-modutils-collateral = "Yu Ke <ke.yu@intel.com>"
 
 RECIPE_STATUS_pn-mtd-utils = "green"
 RECIPE_DEPENDENCY_CHECK_pn-mtd-utils = "not done"
@@ -1215,7 +1215,7 @@ RECIPE_MAINTAINER_pn-beecrypt = "Edwin Zhai <edwin.zhai@intel.com>"
 RECIPE_STATUS_pn-libacpi = "red"
 RECIPE_LATEST_VERSION_pn-libacpi = "0.2"
 RECIPE_LAST_UPDATE_pn-libacpi = "Sep 30, 2008"
-RECIPE_MAINTAINER_pn-libacpi = "Kevin Tian <kevin.tian@intel.com>"
+RECIPE_MAINTAINER_pn-libacpi = "Yu Ke <ke.yu@intel.com>"
 DISTRO_PN_ALIAS_pn-libacpi="Ubuntu=libacpi Mandriva=libacpi"
 
 RECIPE_STATUS_pn-acpid = "green"
@@ -1231,13 +1231,13 @@ RECIPE_MAINTAINER_pn-consolekit = "Edwin Zhai <edwin.zhai@intel.com>"
 RECIPE_STATUS_pn-console-tools = "red"
 RECIPE_LATEST_VERSION_pn-console-tools = "0.3.2"
 RECIPE_LAST_UPDATE_pn-console-tools = "Jul 21, 2006"
-RECIPE_MAINTAINER_pn-console-tools = "Kevin Tian <kevin.tian@intel.com>"
+RECIPE_MAINTAINER_pn-console-tools = "Yu Ke <ke.yu@intel.com>"
 DISTRO_PN_ALIAS_pn-console-tools = "Debian=console-tools Ubuntu=console-tools"
 
 RECIPE_STATUS_pn-fuse = "red"
 RECIPE_LATEST_VERSION_pn-fuse = "2.8.4"
 RECIPE_LAST_UPDATE_pn-fuse = "Nov 6, 2008"
-RECIPE_MAINTAINER_pn-fuse = "Kevin Tian <kevin.tian@intel.com>"
+RECIPE_MAINTAINER_pn-fuse = "Nitin A Kamble <nitin.a.kamble@intel.com>"
 
 RECIPE_STATUS_pn-msynctool = "green"
 RECIPE_DEPENDENCY_CHECK_pn-msynctool = "not done"
@@ -1274,7 +1274,7 @@ RECIPE_MAINTAINER_pn-pm-utils = "Dongxiao Xu <dongxiao.xu@intel.com>"
 RECIPE_STATUS_pn-psmisc = "red"
 RECIPE_LATEST_VERSION_pn-psmisc = "22.13"
 RECIPE_LAST_UPDATE_pn-psmisc = "Jan 18, 2008"
-RECIPE_MAINTAINER_pn-psmisc = "Kevin Tian <kevin.tian@intel.com>"
+RECIPE_MAINTAINER_pn-psmisc = "Yu Ke <ke.yu@intel.com>"
 
 RECIPE_STATUS_pn-boost = "red"
 RECIPE_LATEST_VERSION_pn-boost = "1.44.0"
@@ -1290,7 +1290,7 @@ RECIPE_STATUS_pn-libfribidi = "red"
 DISTRO_PN_ALIAS_pn-libfribidi = "OpenSuSE=fribidi Ubuntu=fribidi Mandriva=fribidi Debian=fribidi"
 RECIPE_LATEST_VERSION_pn-libfribidi = "0.19.2"
 RECIPE_LAST_UPDATE_pn-libfribidi = "Jan 12, 2007"
-RECIPE_MAINTAINER_pn-libfribidi = "Kevin Tian <kevin.tian@intel.com>"
+RECIPE_MAINTAINER_pn-libfribidi = "Yu Ke <ke.yu@intel.com>"
 
 RECIPE_STATUS_pn-rpcbind = "green"
 RECIPE_DEPENDENCY_CHECK_pn-rpcbind = "not done"
-- 
1.7.0.4



