Received: from mga01.intel.com ([192.55.52.88])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <edwin.zhai@intel.com>) id 1QbT1u-0005ta-FE
	for openembedded-core@lists.openembedded.org;
	Tue, 28 Jun 2011 09:48:19 +0200
Received: from fmsmga002.fm.intel.com ([10.253.24.26])
	by fmsmga101.fm.intel.com with ESMTP; 28 Jun 2011 00:44:36 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="4.65,436,1304319600"; d="scan'208";a="21367626"
Received: from yocto-build3.sh.intel.com ([10.239.48.58])
	by fmsmga002.fm.intel.com with ESMTP; 28 Jun 2011 00:44:35 -0700
From: edwin.zhai@intel.com
To: openembedded-core@lists.openembedded.org
Date: Tue, 28 Jun 2011 15:42:59 +0800
Message-Id: <36d5116c23233e8d38d423bca8eb6c0be2d79227.1309246787.git.edwin.zhai@intel.com>
X-Mailer: git-send-email 1.7.1
In-Reply-To: <cover.1309246787.git.edwin.zhai@intel.com>
References: <cover.1309246787.git.edwin.zhai@intel.com>
In-Reply-To: <cover.1309246787.git.edwin.zhai@intel.com>
References: <cover.1309246787.git.edwin.zhai@intel.com>
Subject: [PATCH 3/3] distro-tracking: Update manual check date for puzzles, gpgme, x11vnc..
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
X-List-Received-Date: Tue, 28 Jun 2011 07:48:19 -0000

From: Zhai Edwin <edwin.zhai@intel.com>

Also make maintainer name consistent.

Signed-off-by: Zhai Edwin <edwin.zhai@intel.com>
---
 .../conf/distro/include/distro_tracking_fields.inc |  172 ++++++++++----------
 1 files changed, 90 insertions(+), 82 deletions(-)

diff --git a/meta/conf/distro/include/distro_tracking_fields.inc b/meta/conf/distro/include/distro_tracking_fields.inc
index f4aa1ea..0951c0e 100644
--- a/meta/conf/distro/include/distro_tracking_fields.inc
+++ b/meta/conf/distro/include/distro_tracking_fields.inc
@@ -6,7 +6,7 @@ RECIPE_MAINTAINER_pn-diffutils = "Qing He <qing.he@intel.com>"
 RECIPE_STATUS_pn-epdfview = "red"
 RECIPE_LATEST_VERSION_pn-epdfview = "check"
 RECIPE_LAST_UPDATE_pn-epdfview = "Jul 13, 2010"
-RECIPE_MAINTAINER_pn-epdfview = "Edwin Zhai <edwin.zhai@intel.com>"
+RECIPE_MAINTAINER_pn-epdfview = "Zhai Edwin <edwin.zhai@intel.com>"
 
 RECIPE_STATUS_pn-gccmakedep = "green"
 DISTRO_PN_ALIAS_pn-gccmakedep = "Mandriva=gccmakedep Ubuntu=xutils-dev"
@@ -26,7 +26,7 @@ RECIPE_MAINTAINER_pn-git = "Nitin A Kamble <nitin.a.kamble@intel.com>"
 
 RECIPE_STATUS_pn-gtk-theme-torturer = "red"
 RECIPE_LATEST_VERSION_pn-gtk-theme-torturer = "check"
-RECIPE_MAINTAINER_pn-gtk-theme-torturer = "Edwin Zhai <edwin.zhai@intel.com>"
+RECIPE_MAINTAINER_pn-gtk-theme-torturer = "Zhai Edwin <edwin.zhai@intel.com>"
 DISTRO_PN_ALIAS_pn-gtk-theme-torturer = "OSPDT upstream=http://wiki.laptop.org/go/GTK_for_OLPC"
 
 RECIPE_STATUS_pn-libpcre = "green"
@@ -38,7 +38,7 @@ DISTRO_PN_ALIAS_pn-libpcre = "Mandriva=libpcre0 Fedora=pcre"
 RECIPE_STATUS_pn-libsoup = "red"
 RECIPE_LATEST_VERSION_pn-libsoup = "check"
 RECIPE_LAST_UPDATE_pn-libsoup = "Sep 22, 2008"
-RECIPE_MAINTAINER_pn-libsoup = "Edwin Zhai <edwin.zhai@intel.com>"
+RECIPE_MAINTAINER_pn-libsoup = "Zhai Edwin <edwin.zhai@intel.com>"
 
 RECIPE_STATUS_pn-libtimedate-perl = "green"
 RECIPE_LATEST_VERSION_pn-libtimedate-perl = "1.20"
@@ -125,7 +125,7 @@ RECIPE_STATUS_pn-web = "green"
 RECIPE_LATEST_VERSION_pn-web = "0.0+svnr129"
 DISTRO_PN_ALIAS_pn-web = "OpenedHand"
 RECIPE_LAST_UPDATE_pn-web = "Nov 30, 2010"
-RECIPE_MAINTAINER_pn-web = "Edwin Zhai <edwin.zhai@intel.com>"
+RECIPE_MAINTAINER_pn-web = "Zhai Edwin <edwin.zhai@intel.com>"
 
 RECIPE_STATUS_pn-icu = "yellow" #do_configure for autotool;icu-3.6.inc
 RECIPE_DEPENDENCY_CHECK_pn-icu = "not done"
@@ -142,6 +142,7 @@ RECIPE_MAINTAINER_pn-icu = "Scott Garman <scott.a.garman@intel.com>"
 RECIPE_STATUS_pn-eggdbus = "yellow" # patch comment
 RECIPE_DEPENDENCY_CHECK_pn-eggdbus = "not done"
 RECIPE_LATEST_VERSION_pn-eggdbus = "0.6"
+RECIPE_MANUAL_CHECK_DATE_pn-eggdbus = "Jun 28, 2011"
 RECIPE_PATCH_pn-eggdbus+gtk-doc = "local; no comment; poky doesn't have full gtk-doc support, and eggdbus itself references AM_CONDITIONAL in Makefile.am earlier before configure script is run"
 RECIPE_PATCH_pn-eggdbus+marshal = "local; no comment; one binary generated in eggdbus build needs to be invoked. So point to native version"
 RECIPE_INTEL_SECTION_pn-eggdbus = "base libs"
@@ -195,7 +196,7 @@ RECIPE_TIME_BETWEEN_LAST_TWO_RELEASES_pn-libgpg-error = "2 months"
 RECIPE_LATEST_RELEASE_DATE_pn-libgpg-error = "07/2010"
 RECIPE_COMMENTS_pn-libgpg-error = ""
 RECIPE_LAST_UPDATE_pn-libgpg-error = "Nov 18, 2010"
-RECIPE_MAINTAINER_pn-libgpg-error = "Edwin Zhai <edwin.zhai@intel.com>"
+RECIPE_MAINTAINER_pn-libgpg-error = "Zhai Edwin <edwin.zhai@intel.com>"
 
 RECIPE_STATUS_pn-gpgme = "green"
 RECIPE_DEPENDENCY_CHECK_pn-gpgme = "not done"
@@ -204,8 +205,9 @@ RECIPE_INTEL_SECTION_pn-gpgme = "base libs"
 RECIPE_TIME_BETWEEN_LAST_TWO_RELEASES_pn-gpgme = "6 months"
 RECIPE_LATEST_RELEASE_DATE_pn-gpgme = "01/2010"
 RECIPE_COMMENTS_pn-gpgme = ""
+RECIPE_MANUAL_CHECK_DATE_pn-gpgme = "Jun 28, 2011"
 RECIPE_LAST_UPDATE_pn-gpgme = "Jul 21, 2010"
-RECIPE_MAINTAINER_pn-gpgme = "Edwin Zhai <edwin.zhai@intel.com>"
+RECIPE_MAINTAINER_pn-gpgme = "Zhai Edwin <edwin.zhai@intel.com>"
 
 RECIPE_STATUS_pn-expat = "green"
 RECIPE_DEPENDENCY_CHECK_pn-expat = "not done"
@@ -289,7 +291,7 @@ RECIPE_TIME_BETWEEN_LAST_TWO_RELEASES_pn-liboil = "11 months"
 RECIPE_LATEST_RELEASE_DATE_pn-liboil = "02/2010"
 RECIPE_COMMENTS_pn-liboil = ""
 RECIPE_LAST_UPDATE_pn-liboil = "Mar 3, 2010"
-RECIPE_MAINTAINER_pn-liboil = "Edwin Zhai <edwin.zhai@intel.com>"
+RECIPE_MAINTAINER_pn-liboil = "Zhai Edwin <edwin.zhai@intel.com>"
 
 RECIPE_STATUS_pn-libassuan = "green"
 RECIPE_DEPENDENCY_CHECK_pn-libassuan = "not done"
@@ -300,7 +302,7 @@ RECIPE_TIME_BETWEEN_LAST_TWO_RELEASES_pn-libassuan = "7 months"
 RECIPE_LATEST_RELEASE_DATE_pn-libassuan = "08/2010"
 RECIPE_COMMENTS_pn-libassuan = ""
 RECIPE_LAST_UPDATE_pn-libassuan = "Nov 19, 2010"
-RECIPE_MAINTAINER_pn-libassuan = "Edwin Zhai <edwin.zhai@intel.com>"
+RECIPE_MAINTAINER_pn-libassuan = "Zhai Edwin <edwin.zhai@intel.com>"
 
 RECIPE_STATUS_pn-db = "green"
 RECIPE_DEPENDENCY_CHECK_pn-db = "not done"
@@ -1026,7 +1028,7 @@ RECIPE_LATEST_VERSION_pn-iptables = "1.4.8"
 RECIPE_STATUS_pn-ethtool = "green"
 RECIPE_LATEST_VERSION_pn-ethtool = "2.6.36"
 RECIPE_LAST_UPDATE_pn-ethtool = "Nov 28, 2010"
-RECIPE_MAINTAINER_pn-ethtool = "Edwin Zhai <edwin.zhai@intel.com>"
+RECIPE_MAINTAINER_pn-ethtool = "Zhai Edwin <edwin.zhai@intel.com>"
 
 RECIPE_STATUS_pn-net-tools = "green"
 RECIPE_LAST_UPDATE_pn-net-tools = "Aug 16, 2010"
@@ -1052,7 +1054,7 @@ RECIPE_LATEST_RELEASE_DATE_pn-coreutils = "01/2011"
 
 RECIPE_STATUS_pn-libuser = "green"
 RECIPE_LAST_UPDATE_pn-libuser = "Jan 26, 2011"
-RECIPE_MAINTAINER_pn-libuser = "Edwin Zhai <edwin.zhai@intel.com>"
+RECIPE_MAINTAINER_pn-libuser = "Zhai Edwin <edwin.zhai@intel.com>"
 RECIPE_DEPENDENCY_CHECK_pn-libuser = "not done"
 RECIPE_LATEST_VERSION_pn-libuser = "0.57.1"
 RECIPE_MANUAL_CHECK_DATE_pn-libuser = "Jan 26, 2011"
@@ -1064,7 +1066,7 @@ RECIPE_COMMENTS_pn-libuser = ""
 
 RECIPE_STATUS_pn-xz = "green"
 RECIPE_LAST_UPDATE_pn-xz = "Nov 19, 2010"
-RECIPE_MAINTAINER_pn-xz = "Edwin Zhai <edwin.zhai@intel.com>"
+RECIPE_MAINTAINER_pn-xz = "Zhai Edwin <edwin.zhai@intel.com>"
 RECIPE_DEPENDENCY_CHECK_pn-xz = "not done"
 RECIPE_LATEST_VERSION_pn-xz = "5.0.0"
 RECIPE_NO_OF_PATCHES_pn-xz = "0"
@@ -1075,7 +1077,7 @@ RECIPE_COMMENTS_pn-xz = ""
 
 RECIPE_STATUS_pn-bc = "green"
 RECIPE_LAST_UPDATE_pn-bc = "Aug 6, 2010"
-RECIPE_MAINTAINER_pn-bc = "Edwin Zhai <edwin.zhai@intel.com>"
+RECIPE_MAINTAINER_pn-bc = "Zhai Edwin <edwin.zhai@intel.com>"
 RECIPE_DEPENDENCY_CHECK_pn-bc = "not done"
 RECIPE_LATEST_VERSION_pn-bc = "1.06"
 RECIPE_NO_OF_PATCHES_pn-bc = "0"
@@ -1086,7 +1088,7 @@ RECIPE_COMMENTS_pn-bc = ""
 
 RECIPE_STATUS_pn-ed = "green"
 RECIPE_LAST_UPDATE_pn-ed = "Nov 19, 2010"
-RECIPE_MAINTAINER_pn-ed = "Edwin Zhai <edwin.zhai@intel.com>"
+RECIPE_MAINTAINER_pn-ed = "Zhai Edwin <edwin.zhai@intel.com>"
 RECIPE_DEPENDENCY_CHECK_pn-ed = "not done"
 RECIPE_LATEST_VERSION_pn-ed = "1.5"
 RECIPE_NO_OF_PATCHES_pn-ed = "1"
@@ -1097,7 +1099,7 @@ RECIPE_COMMENTS_pn-ed = "GPLv3 was used since ed 0.6"
 
 RECIPE_STATUS_pn-pax = "green"
 RECIPE_LAST_UPDATE_pn-pax = "Aug 16, 2010"
-RECIPE_MAINTAINER_pn-pax = "Edwin Zhai <edwin.zhai@intel.com>"
+RECIPE_MAINTAINER_pn-pax = "Zhai Edwin <edwin.zhai@intel.com>"
 RECIPE_DEPENDENCY_CHECK_pn-pax = "not done"
 RECIPE_LATEST_VERSION_pn-pax = "3.4"
 RECIPE_NO_OF_PATCHES_pn-pax = "0"
@@ -1146,12 +1148,12 @@ RECIPE_MAINTAINER_pn-libgdbus = "Scott Garman <scott.a.garman@intel.com>"
 RECIPE_STATUS_pn-apr = "green"
 RECIPE_LATEST_VERSION_pn-apr = "1.4.2"
 RECIPE_LAST_UPDATE_pn-apr = "Dec 17, 2010"
-RECIPE_MAINTAINER_pn-apr = "Edwin Zhai <edwin.zhai@intel.com>"
+RECIPE_MAINTAINER_pn-apr = "Zhai Edwin <edwin.zhai@intel.com>"
 
 RECIPE_STATUS_pn-apr-util = "green"
 RECIPE_LATEST_VERSION_pn-apr-util = "1.3.10"
 RECIPE_LAST_UPDATE_pn-apr-util = "Dec 29, 2010"
-RECIPE_MAINTAINER_pn-apr-util = "Edwin Zhai <edwin.zhai@intel.com>"
+RECIPE_MAINTAINER_pn-apr-util = "Zhai Edwin <edwin.zhai@intel.com>"
 
 RECIPE_STATUS_pn-apt = "red"
 RECIPE_LATEST_VERSION_pn-apt = "0.7.25.3"
@@ -1175,7 +1177,7 @@ RECIPE_MAINTAINER_pn-dosfstools = "Scott Garman <scott.a.garman@intel.com>"
 RECIPE_STATUS_pn-eee-acpi-scripts = "green"
 RECIPE_LATEST_VERSION_pn-eee-acpi-scripts = "1.1.11+e224937ba51165e2a52252f9a113c8a82c01bb36"
 RECIPE_LAST_UPDATE_pn-eee-acpi-scripts = "Nov 28, 2010"
-RECIPE_MAINTAINER_pn-eee-acpi-scripts = "Edwin Zhai <edwin.zhai@intel.com>"
+RECIPE_MAINTAINER_pn-eee-acpi-scripts = "Zhai Edwin <edwin.zhai@intel.com>"
 DISTRO_PN_ALIAS_pn-eee-acpi-scripts = "Debian=eeepc-acpi-scripts Ubuntu=eeepc-acpi-scripts"
 
 RECIPE_STATUS_pn-gssdp = "green"
@@ -1227,7 +1229,7 @@ RECIPE_MAINTAINER_pn-libgsf = "Dexuan Cui <dexuan.cui@intel.com>"
 RECIPE_STATUS_pn-beecrypt = "green"
 RECIPE_LATEST_VERSION_pn-beecrypt = "4.2.1"
 RECIPE_LAST_UPDATE_pn-beecrypt = "Nov 26, 2010"
-RECIPE_MAINTAINER_pn-beecrypt = "Edwin Zhai <edwin.zhai@intel.com>"
+RECIPE_MAINTAINER_pn-beecrypt = "Zhai Edwin <edwin.zhai@intel.com>"
 
 RECIPE_STATUS_pn-libacpi = "red"
 RECIPE_LATEST_VERSION_pn-libacpi = "0.2"
@@ -1238,12 +1240,12 @@ DISTRO_PN_ALIAS_pn-libacpi="Ubuntu=libacpi Mandriva=libacpi"
 RECIPE_STATUS_pn-acpid = "green"
 RECIPE_LATEST_VERSION_pn-acpid = "1.0.10"
 RECIPE_LAST_UPDATE_pn-acpid = "Nov 26, 2010"
-RECIPE_MAINTAINER_pn-acpid = "Edwin Zhai <edwin.zhai@intel.com>"
+RECIPE_MAINTAINER_pn-acpid = "Zhai Edwin <edwin.zhai@intel.com>"
 
 RECIPE_STATUS_pn-consolekit = "green"
 RECIPE_LATEST_VERSION_pn-consolekit = "0.4.3"
 RECIPE_LAST_UPDATE_pn-consolekit = "Nov 28, 2010"
-RECIPE_MAINTAINER_pn-consolekit = "Edwin Zhai <edwin.zhai@intel.com>"
+RECIPE_MAINTAINER_pn-consolekit = "Zhai Edwin <edwin.zhai@intel.com>"
 
 RECIPE_STATUS_pn-console-tools = "red"
 RECIPE_LATEST_VERSION_pn-console-tools = "0.3.2"
@@ -1593,7 +1595,7 @@ RECIPE_COMMENTS_pn-hal-info = ""
 
 RECIPE_STATUS_pn-avahi = "green"
 RECIPE_LAST_UPDATE_pn-avahi = "Nov 19, 2010"
-RECIPE_MAINTAINER_pn-avahi = "Edwin Zhai <edwin.zhai@intel.com>"
+RECIPE_MAINTAINER_pn-avahi = "Zhai Edwin <edwin.zhai@intel.com>"
 RECIPE_DEPENDENCY_CHECK_pn-avahi = "not done"
 RECIPE_LATEST_VERSION_pn-avahi = "0.6.28"
 RECIPE_INTEL_SECTION_pn-avahi = "base utils"
@@ -3137,90 +3139,91 @@ RECIPE_MAINTAINER_pn-oh-puzzles = "Zhai Edwin <edwin.zhai@intel.com>"
 
 RECIPE_STATUS_pn-gnome-terminal = "red"
 RECIPE_LATEST_VERSION_pn-gnome-terminal = "2.31.3"
-RECIPE_MAINTAINER_pn-gnome-terminal = "Edwin Zhai <edwin.zhai@intel.com>"
+RECIPE_MAINTAINER_pn-gnome-terminal = "Zhai Edwin <edwin.zhai@intel.com>"
 
 RECIPE_STATUS_pn-puzzles = "red"
 DISTRO_PN_ALIAS_pn-puzzles = "Debian=sgt-puzzles"
-RECIPE_LATEST_VERSION_pn-puzzles = "r9076"
-RECIPE_MANUAL_CHECK_DATE_pn-puzzles = "Jan 06, 2011"
-RECIPE_LAST_UPDATE_pn-puzzles = "Jan 06, 2011"
-RECIPE_MAINTAINER_pn-puzzles = "Edwin Zhai <edwin.zhai@intel.com>"
+RECIPE_LATEST_VERSION_pn-puzzles = "r9175"
+RECIPE_MANUAL_CHECK_DATE_pn-puzzles = "Jun 28, 2011"
+RECIPE_LAST_UPDATE_pn-puzzles = "May 31, 2011"
+RECIPE_MAINTAINER_pn-puzzles = "Zhai Edwin <edwin.zhai@intel.com>"
 DISTRO_PN_ALIAS_pn-puzzles = "Debian=sgt-puzzles Fedora=puzzles"
 
 RECIPE_STATUS_pn-x11perf = "green"
 RECIPE_LATEST_VERSION_pn-x11perf = "1.5.2"
 RECIPE_LAST_UPDATE_pn-x11perf = "Nov 30, 2010"
-RECIPE_MAINTAINER_pn-x11perf = "Edwin Zhai <edwin.zhai@intel.com>"
+RECIPE_MAINTAINER_pn-x11perf = "Zhai Edwin <edwin.zhai@intel.com>"
 DISTRO_PN_ALIAS_pn-x11perf = "Fedora=xorg-x11-apps Ubuntu=x11-apps"
 
 RECIPE_STATUS_pn-xbacklight = "red"
 RECIPE_LATEST_VERSION_pn-xbacklight = "1.1.1"
 RECIPE_LAST_UPDATE_pn-xbacklight = "Aug 24, 2009"
-RECIPE_MAINTAINER_pn-xbacklight = "Edwin Zhai <edwin.zhai@intel.com>"
+RECIPE_MAINTAINER_pn-xbacklight = "Zhai Edwin <edwin.zhai@intel.com>"
 
 RECIPE_STATUS_pn-xev = "red"
 RECIPE_LATEST_VERSION_pn-xev = "1.0.4"
 RECIPE_LAST_UPDATE_pn-xev = "Mar 28, 2008"
-RECIPE_MAINTAINER_pn-xev = "Edwin Zhai <edwin.zhai@intel.com>"
+RECIPE_MAINTAINER_pn-xev = "Zhai Edwin <edwin.zhai@intel.com>"
 DISTRO_PN_ALIAS_pn-xev = "Fedora=xorg-x11-utils Ubuntu=x11-utils"
 
 RECIPE_STATUS_pn-xeyes = "red"
 RECIPE_LATEST_VERSION_pn-xeyes = "1.1.0"
 RECIPE_LAST_UPDATE_pn-xeyes = "Nov 5, 2008"
-RECIPE_MAINTAINER_pn-xeyes = "Edwin Zhai <edwin.zhai@intel.com>"
+RECIPE_MAINTAINER_pn-xeyes = "Zhai Edwin <edwin.zhai@intel.com>"
 DISTRO_PN_ALIAS_pn-xeyes = "Ubuntu=x11-apps Fedora=xorg-x11-apps"
 
 RECIPE_STATUS_pn-xrdb = "red"
 RECIPE_LATEST_VERSION_pn-xrdb = "1.0.6"
 RECIPE_LAST_UPDATE_pn-xrdb = "Mar 28, 2008"
-RECIPE_MAINTAINER_pn-xrdb = "Edwin Zhai <edwin.zhai@intel.com>"
+RECIPE_MAINTAINER_pn-xrdb = "Zhai Edwin <edwin.zhai@intel.com>"
 DISTRO_PN_ALIAS_pn-xrdb = "Ubuntu=x11-xserver-utils Fedora=xorg-x11-server-utils"
 
 RECIPE_STATUS_pn-xvinfo = "green"
 RECIPE_LATEST_VERSION_pn-xvinfo = "1.1.1"
 RECIPE_LAST_UPDATE_pn-xvinfo = "Dec 31, 2010"
-RECIPE_MAINTAINER_pn-xvinfo = "Edwin Zhai <edwin.zhai@intel.com>"
+RECIPE_MAINTAINER_pn-xvinfo = "Zhai Edwin <edwin.zhai@intel.com>"
 DISTRO_PN_ALIAS_pn-xvinfo = "Fedora=xorg-x11-utils Ubuntu=x11-utils"
 
 RECIPE_STATUS_pn-claws-plugin-gtkhtml2-viewer = "red"
 DISTRO_PN_ALIAS_pn-claws-plugin-gtkhtml2-viewer = "Fedora=claws-mail-plugins OpenSuSE=claws-mail-extra-plugins Debian=claws-mail-extra-plugins"
 RECIPE_LATEST_VERSION_pn-claws-plugin-gtkhtml2-viewer = "0.27"
 RECIPE_LAST_UPDATE_pn-claws-plugin-gtkhtml2-viewer = "May 9, 2007"
-RECIPE_MAINTAINER_pn-claws-plugin-gtkhtml2-viewer = "Edwin Zhai <edwin.zhai@intel.com>"
+RECIPE_MAINTAINER_pn-claws-plugin-gtkhtml2-viewer = "Zhai Edwin <edwin.zhai@intel.com>"
 
 RECIPE_STATUS_pn-claws-plugin-maildir = "red"
 DISTRO_PN_ALIAS_pn-claws-plugin-maildir = "Fedora=claws-mail-plugins OpenSuSE=claws-mail-extra-plugins Debian=claws-mail-extra-plugins"
 RECIPE_LATEST_VERSION_pn-claws-plugin-maildir = "0.24.4"
 RECIPE_LAST_UPDATE_pn-claws-plugin-maildir = "Apr 25, 2007"
-RECIPE_MAINTAINER_pn-claws-plugin-maildir = "Edwin Zhai <edwin.zhai@intel.com>"
+RECIPE_MAINTAINER_pn-claws-plugin-maildir = "Zhai Edwin <edwin.zhai@intel.com>"
 
 RECIPE_STATUS_pn-claws-plugin-mailmbox = "red"
 DISTRO_PN_ALIAS_pn-claws-plugin-mailmbox = "Fedora=claws-mail-plugins OpenSuSE=claws-mail-extra-plugins Debian=claws-mail-extra-plugins"
 RECIPE_LATEST_VERSION_pn-claws-plugin-mailmbox = "1.14.4"
 RECIPE_LAST_UPDATE_pn-claws-plugin-mailmbox = "May 10, 2007"
-RECIPE_MAINTAINER_pn-claws-plugin-mailmbox = "Edwin Zhai <edwin.zhai@intel.com>"
+RECIPE_MAINTAINER_pn-claws-plugin-mailmbox = "Zhai Edwin <edwin.zhai@intel.com>"
 
 RECIPE_STATUS_pn-claws-plugin-rssyl = "red"
 DISTRO_PN_ALIAS_pn-claws-plugin-rssyl = "Fedora=claws-mail-plugins OpenSuSE=claws-mail-extra-plugins Debian=claws-mail-extra-plugins"
 RECIPE_LATEST_VERSION_pn-claws-plugin-rssyl = "0.27"
 RECIPE_LAST_UPDATE_pn-claws-plugin-rssyl = "May 10, 2007"
-RECIPE_MAINTAINER_pn-claws-plugin-rssyl = "Edwin Zhai <edwin.zhai@intel.com>"
+RECIPE_MAINTAINER_pn-claws-plugin-rssyl = "Zhai Edwin <edwin.zhai@intel.com>"
 
 RECIPE_STATUS_pn-kf = "red"
 RECIPE_LATEST_VERSION_pn-kf = "n/a"
 RECIPE_LAST_UPDATE_pn-kf = "Sep 29, 2005"
-RECIPE_MAINTAINER_pn-kf = "Edwin Zhai <edwin.zhai@intel.com>"
+RECIPE_MAINTAINER_pn-kf = "Zhai Edwin <edwin.zhai@intel.com>"
 DISTRO_PN_ALIAS_pn-kf = "OSPDT"
 
 RECIPE_STATUS_pn-claws-mail = "red"
 RECIPE_LATEST_VERSION_pn-claws-mail = "3.7.6"
 RECIPE_LAST_UPDATE_pn-kf = "Apr 25, 2007"
-RECIPE_MAINTAINER_pn-claws-mail = "Edwin Zhai <edwin.zhai@intel.com>"
+RECIPE_MAINTAINER_pn-claws-mail = "Zhai Edwin <edwin.zhai@intel.com>"
 
 RECIPE_STATUS_pn-x11vnc = "green"
 RECIPE_LATEST_VERSION_pn-x11vnc = "0.9.12"
+RECIPE_MANUAL_CHECK_DATE_pn-x11vnc = "Jun 28, 2011"
 RECIPE_LAST_UPDATE_pn-x11vnc = "Nov 30, 2010"
-RECIPE_MAINTAINER_pn-x11vnc = "Edwin Zhai <edwin.zhai@intel.com>"
+RECIPE_MAINTAINER_pn-x11vnc = "Zhai Edwin <edwin.zhai@intel.com>"
 DISTRO_PN_ALIAS_pn-x11vnc = "Fedora=x11vnc Ubuntu=x11vnc"
 
 RECIPE_STATUS_pn-mkfontdir="green" # no update needed
@@ -4998,7 +5001,7 @@ RECIPE_MAINTAINER_pn-gtk+ = "Zhai Edwin <edwin.zhai@intel.com>"
 RECIPE_STATUS_pn-gdk-pixbuf = "green"
 RECIPE_LATEST_VERSION_pn-gdk-pixbuf = "2.22.1"
 RECIPE_LAST_UPDATE_pn-gdk-pixbuf = "Nov 25, 2010"
-RECIPE_MAINTAINER_pn-gdk-pixbuf = "Edwin Zhai <edwin.zhai@intel.com>"
+RECIPE_MAINTAINER_pn-gdk-pixbuf = "Zhai Edwin <edwin.zhai@intel.com>"
 
 RECIPE_STATUS_pn-gdk-pixbuf-csource-native = "red" # update needed
 RECIPE_DEPENDENCY_CHECK_pn-gdk-pixbuf-csource-native = "not done"
@@ -5037,14 +5040,14 @@ RECIPE_MAINTAINER_pn-gnome-common = "Zhai Edwin <edwin.zhai@intel.com>"
 RECIPE_STATUS_pn-webkit-gtk = "green"
 DISTRO_PN_ALIAS_pn-webkit-gtk = "Fedora=webkitgtk"
 RECIPE_DEPENDENCY_CHECK_pn-webkit-gtk = "not done"
-RECIPE_LATEST_VERSION_pn-webkit-gtk = "1.3.7+svnr72836"
-RECIPE_MANUAL_CHECK_DATE_pn-webkit-gtk = "Nov 19, 2010"
+RECIPE_LATEST_VERSION_pn-webkit-gtk = "1.3.7+svnr89887"
+RECIPE_MANUAL_CHECK_DATE_pn-webkit-gtk = "Jun 28, 2011"
 RECIPE_NO_OF_PATCHES_pn-webkit-gtk = "1"
 RECIPE_INTEL_SECTION_pn-webkit-gtk = "graphic UX"
 RECIPE_TIME_BETWEEN_LAST_TWO_RELEASES_pn-webkit-gtk = "1 month"
-RECIPE_LATEST_RELEASE_DATE_pn-webkit-gtk = "11/2011"
+RECIPE_LATEST_RELEASE_DATE_pn-webkit-gtk = "06/2011"
 RECIPE_COMMENTS_pn-webkit-gtk = ""
-RECIPE_LAST_UPDATE_pn-webkit-gtk = "Nov 30, 2011"
+RECIPE_LAST_UPDATE_pn-webkit-gtk = "Jan 14, 2011"
 RECIPE_MAINTAINER_pn-webkit-gtk = "Zhai Edwin <edwin.zhai@intel.com>"
 DISTRO_PN_ALIAS_pn-webkit-gtk = "Fedora=webkitgtk Ubuntu=libwebkit"
 
@@ -5097,14 +5100,14 @@ RECIPE_MAINTAINER_pn-hicolor-icon-theme = "Zhai Edwin <edwin.zhai@intel.com>"
 
 RECIPE_STATUS_pn-jpeg = "green"
 RECIPE_DEPENDENCY_CHECK_pn-jpeg = "not done"
-RECIPE_LATEST_VERSION_pn-jpeg = "8b"
-RECIPE_MANUAL_CHECK_DATE_pn-jpeg = "Dec 30, 2010"
+RECIPE_LATEST_VERSION_pn-jpeg = "8c"
+RECIPE_MANUAL_CHECK_DATE_pn-jpeg = "Jun 28, 2011"
 RECIPE_NO_OF_PATCHES_pn-jpeg = "0"
 RECIPE_INTEL_SECTION_pn-jpeg = "graphic UX"
 RECIPE_TIME_BETWEEN_LAST_TWO_RELEASES_pn-jpeg = "12 months"
-RECIPE_LATEST_RELEASE_DATE_pn-jpeg = "05/2010"
+RECIPE_LATEST_RELEASE_DATE_pn-jpeg = "01/2011"
 RECIPE_COMMENTS_pn-jpeg = ""
-RECIPE_LAST_UPDATE_pn-jpeg = "Jul 15, 2010"
+RECIPE_LAST_UPDATE_pn-jpeg = "Apr 14, 2011"
 RECIPE_MAINTAINER_pn-jpeg = "Zhai Edwin <edwin.zhai@intel.com>"
 DISTRO_PN_ALIAS_pn-jpeg="OpenSuSE=libjpeg Ubuntu=libjpeg62"
 
@@ -5146,6 +5149,7 @@ RECIPE_MAINTAINER_pn-libsoup-2.4 = "Zhai Edwin <edwin.zhai@intel.com>"
 RECIPE_STATUS_pn-libxslt = "green"
 RECIPE_DEPENDENCY_CHECK_pn-libxslt = "not done"
 RECIPE_LATEST_VERSION_pn-libxslt = "1.1.26"
+RECIPE_MANUAL_CHECK_DATE_pn-libxslt = "Jun 28, 2011"
 RECIPE_NO_OF_PATCHES_pn-libxslt = "0"
 RECIPE_INTEL_SECTION_pn-libxslt = "graphic UX"
 RECIPE_TIME_BETWEEN_LAST_TWO_RELEASES_pn-libxslt = "1 month"
@@ -5247,7 +5251,7 @@ RECIPE_MAINTAINER_pn-web-webkit = "Zhai Edwin <edwin.zhai@intel.com>"
 RECIPE_STATUS_pn-libfm = "green"
 RECIPE_DEPENDENCY_CHECK_pn-libfm = "not done"
 RECIPE_LATEST_VERSION_pn-libfm = "0.1.14"
-RECIPE_MANUAL_CHECK_DATE_pn-libfm = "Nov 19, 2010"
+RECIPE_MANUAL_CHECK_DATE_pn-libfm = "Jun 28, 2011"
 RECIPE_NO_OF_PATCHES_pn-libfm = "0"
 RECIPE_INTEL_SECTION_pn-libfm = "graphic UX"
 RECIPE_TIME_BETWEEN_LAST_TWO_RELEASES_pn-libfm = "5 months"
@@ -5259,7 +5263,7 @@ RECIPE_MAINTAINER_pn-libfm = "Zhai Edwin <edwin.zhai@intel.com>"
 RECIPE_STATUS_pn-menu-cache = "green"
 RECIPE_DEPENDENCY_CHECK_pn-menu-cache = "not done"
 RECIPE_LATEST_VERSION_pn-menu-cache = "0.3.2"
-RECIPE_MANUAL_CHECK_DATE_pn-menu-cache = "Nov 22, 2010"
+RECIPE_MANUAL_CHECK_DATE_pn-menu-cache = "Jun 28, 2011"
 RECIPE_NO_OF_PATCHES_pn-menu-cache = "0"
 RECIPE_INTEL_SECTION_pn-menu-cache = "graphic UX"
 RECIPE_TIME_BETWEEN_LAST_TWO_RELEASES_pn-menu-cache = "1 month"
@@ -5274,107 +5278,111 @@ DISTRO_PN_ALIAS_pn-gtk-engines = "Fedora=gtk2-engines OpenSuSE=gtk2-engines Ubun
 RECIPE_LATEST_VERSION_pn-gtk-engines = "2.20.2"
 RECIPE_LAST_UPDATE_pn-gtk-engines = "Dec 1, 2010"
 RECIPE_NO_UPDATE_REASON_pn-gtk-engines = "Do not upgrade to version: 2.91.1 because prefer stable tree"
-RECIPE_MAINTAINER_pn-gtk-engines = "Edwin Zhai <edwin.zhai@intel.com>"
+RECIPE_MAINTAINER_pn-gtk-engines = "Zhai Edwin <edwin.zhai@intel.com>"
 
-RECIPE_STATUS_pn-clutter-box2d = "red"
-RECIPE_LATEST_VERSION_pn-clutter-box2d = "0.10.0"
-RECIPE_MAINTAINER_pn-clutter-box2d = "Edwin Zhai <edwin.zhai@intel.com>"
+RECIPE_STATUS_pn-clutter-box2d-1.6 = "red"
+RECIPE_LATEST_VERSION_pn-clutter-box2d-1.6 = "0.10.0"
+RECIPE_MANUAL_CHECK_DATE_pn-clutter-box2d-1.6 = "Jun 28, 2011"
+RECIPE_LAST_UPDATE_pn-clutter-box2d-1.6 = "Mar 28, 2011"
+RECIPE_MAINTAINER_pn-clutter-box2d-1.6 = "Zhai Edwin <edwin.zhai@intel.com>"
 
 RECIPE_STATUS_pn-clutter-gtk-1.4 = "red"
 DISTRO_PN_ALIAS_pn-clutter-gtk-1.4 = "Fedora=clutter-gtk OpenSuSE=clutter-gtk Ubuntu=clutter-gtk-0.10 Mandriva=clutter-gtk Debian=clutter-gtk"
 RECIPE_LATEST_VERSION_pn-clutter-gtk-1.4 = "0.90.0+git0+e8d828ba1d87937baa571e68fdff22f3e2d79ca8"
-RECIPE_MAINTAINER_pn-clutter-gtk-1.4 = "Edwin Zhai <edwin.zhai@intel.com>"
+RECIPE_MAINTAINER_pn-clutter-gtk-1.4 = "Zhai Edwin <edwin.zhai@intel.com>"
 
 RECIPE_STATUS_pn-tidy = "red"
 RECIPE_LATEST_VERSION_pn-tidy = "0.1.0+git0+e25416e1293e1074bfa6727c80527dcff5b1f3cb"
 RECIPE_LAST_UPDATE_pn-tidy = "Dec 18, 2008"
-RECIPE_MAINTAINER_pn-tidy = "Edwin Zhai <edwin.zhai@intel.com>"
+RECIPE_MAINTAINER_pn-tidy = "Zhai Edwin <edwin.zhai@intel.com>"
 
 RECIPE_STATUS_pn-libcanberra = "green"
 RECIPE_LATEST_VERSION_pn-libcanberra = "0.26"
 RECIPE_LAST_UPDATE_pn-libcanberra = "Dec 31, 2010"
-RECIPE_MAINTAINER_pn-libcanberra = "Edwin Zhai <edwin.zhai@intel.com>"
+RECIPE_MAINTAINER_pn-libcanberra = "Zhai Edwin <edwin.zhai@intel.com>"
 
 RECIPE_STATUS_pn-libgalago = "red"
 RECIPE_LATEST_VERSION_pn-libgalago = "0.5.2"
 RECIPE_LAST_UPDATE_pn-libgalago = "Apr 11, 2007"
-RECIPE_MAINTAINER_pn-libgalago = "Edwin Zhai <edwin.zhai@intel.com>"
+RECIPE_MAINTAINER_pn-libgalago = "Zhai Edwin <edwin.zhai@intel.com>"
 
-RECIPE_STATUS_pn-clutter-1.4 = "red"
-DISTRO_PN_ALIAS_pn-clutter-1.4 = "Fedora=clutter OpenSuse=clutter Ubuntu=clutter-1.0 Mandriva=clutter Debian=clutter"
-RECIPE_LATEST_VERSION_pn-clutter-1.4 = "1.0+git0+ce5025d0a2b701541ca9343686f9dac858905da4"
-RECIPE_LAST_UPDATE_pn-clutter-1.4 = "Jan 29, 2010"
-RECIPE_MAINTAINER_pn-clutter-1.4 = "Edwin Zhai <edwin.zhai@intel.com>"
+RECIPE_STATUS_pn-clutter-1.6 = "red"
+DISTRO_PN_ALIAS_pn-clutter-1.6 = "Fedora=clutter OpenSuse=clutter Ubuntu=clutter-1.0 Mandriva=clutter Debian=clutter"
+RECIPE_LATEST_VERSION_pn-clutter-1.6 = "1.6.14"
+RECIPE_MANUAL_CHECK_DATE_pn-clutter-1.6 = "Jun 28, 2011"
+RECIPE_LAST_UPDATE_pn-clutter-1.6 = "Apr 19, 2011"
+RECIPE_MAINTAINER_pn-clutter-1.6 = "Zhai Edwin <edwin.zhai@intel.com>"
 
 RECIPE_STATUS_pn-clutter = "red"
 DISTRO_PN_ALIAS_pn-clutter = "Fedora=clutter-gtk OpenSuSE=clutter-gtk Ubuntu=clutter-gtk-0.10 Mandriva=clutter-gtk Debian=clutter-gtk"
-RECIPE_LATEST_VERSION_pn-clutter = "1.2.8"
-RECIPE_MAINTAINER_pn-clutter = "Edwin Zhai <edwin.zhai@intel.com>"
+RECIPE_LATEST_VERSION_pn-clutter = "1.6.14"
+RECIPE_MANUAL_CHECK_DATE_pn-clutter = "Jun 28, 2011"
+RECIPE_MAINTAINER_pn-clutter = "Zhai Edwin <edwin.zhai@intel.com>"
 
 RECIPE_STATUS_pn-libgnomekbd = "red"
 RECIPE_LATEST_VERSION_pn-libgnomekbd = "2.31.1"
 RECIPE_LAST_UPDATE_pn-libgnomekbd = "Jun 10, 2009"
-RECIPE_MAINTAINER_pn-libgnomekbd = "Edwin Zhai <edwin.zhai@intel.com>"
+RECIPE_MAINTAINER_pn-libgnomekbd = "Zhai Edwin <edwin.zhai@intel.com>"
 
 RECIPE_STATUS_pn-clipboard-manager = "red"
 DISTRO_PN_ALIAS_pn-clipboard-manager = "OpenedHand"
 RECIPE_LATEST_VERSION_pn-clipboard-manager = "0.6.8"
 RECIPE_LAST_UPDATE_pn-clipboard-manager = "Dec 24, 2007"
-RECIPE_MAINTAINER_pn-clipboard-manager = "Edwin Zhai <edwin.zhai@intel.com>"
+RECIPE_MAINTAINER_pn-clipboard-manager = "Zhai Edwin <edwin.zhai@intel.com>"
 
 RECIPE_STATUS_pn-gnome-desktop = "green"
 RECIPE_LATEST_VERSION_pn-gnome-desktop = "2.32.1"
 RECIPE_LAST_UPDATE_pn-gnome-desktop = "Dec 1, 2010"
 RECIPE_NO_UPDATE_REASON_pn-gnome-desktop = "Do not upgrade to version: 2.91.6 because prefer stable tree"
-RECIPE_MAINTAINER_pn-gnome-desktop = "Edwin Zhai <edwin.zhai@intel.com>"
+RECIPE_MAINTAINER_pn-gnome-desktop = "Zhai Edwin <edwin.zhai@intel.com>"
 
 RECIPE_STATUS_pn-gnome-icon-theme = "green"
 RECIPE_LATEST_VERSION_pn-gnome-icon-theme = "2.31.0"
 RECIPE_LAST_UPDATE_pn-gnome-icon-theme = "Dec 1, 2010"
 RECIPE_NO_UPDATE_REASON_pn-gnome-icon-theme = "Do not upgrade to version: 2.91.0 because prefer stable tree"
-RECIPE_MAINTAINER_pn-gnome-icon-theme = "Edwin Zhai <edwin.zhai@intel.com>"
+RECIPE_MAINTAINER_pn-gnome-icon-theme = "Zhai Edwin <edwin.zhai@intel.com>"
 
 RECIPE_STATUS_pn-gtk-doc = "red"
 RECIPE_LATEST_VERSION_pn-gtk-doc = "1.15"
 RECIPE_LAST_UPDATE_pn-gtk-doc = "Jun 10, 2009"
-RECIPE_MAINTAINER_pn-gtk-doc = "Edwin Zhai <edwin.zhai@intel.com>"
+RECIPE_MAINTAINER_pn-gtk-doc = "Zhai Edwin <edwin.zhai@intel.com>"
 
 RECIPE_STATUS_pn-gtkhtml2 = "red"
 RECIPE_LATEST_VERSION_pn-gtkhtml2 = "2.11.1"
 RECIPE_LAST_UPDATE_pn-gtkhtml2 = "Aug 9, 2007"
-RECIPE_MAINTAINER_pn-gtkhtml2 = "Edwin Zhai <edwin.zhai@intel.com>"
+RECIPE_MAINTAINER_pn-gtkhtml2 = "Zhai Edwin <edwin.zhai@intel.com>"
 
 RECIPE_STATUS_pn-libgnomecanvas = "red"
 RECIPE_LATEST_VERSION_pn-libgnomecanvas = "2.30.1"
 RECIPE_LAST_UPDATE_pn-libgnomecanvas = "Jun 10, 2009"
-RECIPE_MAINTAINER_pn-libgnomecanvas = "Edwin Zhai <edwin.zhai@intel.com>"
+RECIPE_MAINTAINER_pn-libgnomecanvas = "Zhai Edwin <edwin.zhai@intel.com>"
 
 RECIPE_STATUS_pn-libgtkstylus = "red"
 RECIPE_LATEST_VERSION_pn-libgtkstylus = "0.5"
 RECIPE_LAST_UPDATE_pn-libgtkstylus = "Jul 21, 2006"
-RECIPE_MAINTAINER_pn-libgtkstylus = "Edwin Zhai <edwin.zhai@intel.com>"
+RECIPE_MAINTAINER_pn-libgtkstylus = "Zhai Edwin <edwin.zhai@intel.com>"
 DISTRO_PN_ALIAS_pn-libgtkstylus = "Debian=libgtkstylus Ubuntu=libgtkstylus"
 
 RECIPE_STATUS_pn-matchbox-themes-extra = "red"
 RECIPE_LATEST_VERSION_pn-matchbox-themes-extra = "0.3+svnr1247"
 RECIPE_LAST_UPDATE_pn-matchbox-themes-extra = "Aug 9, 2007"
-RECIPE_MAINTAINER_pn-matchbox-themes-extra = "Edwin Zhai <edwin.zhai@intel.com>"
+RECIPE_MAINTAINER_pn-matchbox-themes-extra = "Zhai Edwin <edwin.zhai@intel.com>"
 DISTRO_PN_ALIAS_pn-matchbox-themes-extra = "Ubuntu=matchbox-themes-extra Mandriva=matchbox-themes-extra"
 
 RECIPE_STATUS_pn-matchbox-themes-gtk = "red"
 RECIPE_LATEST_VERSION_pn-matchbox-themes-gtk = "1.0"
-RECIPE_MAINTAINER_pn-matchbox-themes-gtk = "Edwin Zhai <edwin.zhai@intel.com>"
+RECIPE_MAINTAINER_pn-matchbox-themes-gtk = "Zhai Edwin <edwin.zhai@intel.com>"
 
 RECIPE_STATUS_pn-matchbox-wm-2 = "green"
 DISTRO_PN_ALIAS_pn-matchbox-wm-2 = "Mandriva=matchbox-window-manager Debian=matchbox-window-manager"
 RECIPE_LATEST_VERSION_pn-matchbox-wm-2 = "0.0+svnr2106"
 RECIPE_LAST_UPDATE_pn-matchbox-wm-2= "Dec 31, 2010"
-RECIPE_MAINTAINER_pn-matchbox-wm-2 = "Edwin Zhai <edwin.zhai@intel.com>"
+RECIPE_MAINTAINER_pn-matchbox-wm-2 = "Zhai Edwin <edwin.zhai@intel.com>"
 
 RECIPE_STATUS_pn-metacity = "green"
 RECIPE_LATEST_VERSION_pn-metacity = "2.30.3"
 RECIPE_LAST_UPDATE_pn-metacity = "Dec 30, 2010"
-RECIPE_MAINTAINER_pn-metacity = "Edwin Zhai <edwin.zhai@intel.com>"
+RECIPE_MAINTAINER_pn-metacity = "Zhai Edwin <edwin.zhai@intel.com>"
 
 RECIPE_STATUS_pn-polkit-gnome = "green"
 RECIPE_DEPENDENCY_CHECK_pn-polkit-gnome = "not done"
@@ -5384,18 +5392,18 @@ RECIPE_TIME_BETWEEN_LAST_TWO_RELEASES_pn-polkit-gnome = "1 months"
 RECIPE_LATEST_RELEASE_DATE_pn-polkit-gnome = "2010/09/15"
 RECIPE_COMMENTS_pn-polkit-gnome = ""
 RECIPE_LAST_UPDATE_pn-polkit-gnome = "Nov 18, 2010"
-RECIPE_MAINTAINER_pn-polkit-gnome = "Edwin Zhai <edwin.zhai@intel.com>"
+RECIPE_MAINTAINER_pn-polkit-gnome = "Zhai Edwin <edwin.zhai@intel.com>"
 
 RECIPE_STATUS_pn-pong-clock = "red"
 DISTRO_PN_ALIAS_pn-pong-clock = "OpenedHand"
 RECIPE_LATEST_VERSION_pn-pong-clock = "1.0"
 RECIPE_LAST_UPDATE_pn-pong-clock = "Jul 5, 2007"
-RECIPE_MAINTAINER_pn-pong-clock = "Edwin Zhai <edwin.zhai@intel.com>"
+RECIPE_MAINTAINER_pn-pong-clock = "Zhai Edwin <edwin.zhai@intel.com>"
 
 RECIPE_STATUS_pn-mutter = "red"
 RECIPE_LATEST_VERSION_pn-mutter = "2.29.1_0.4"
 RECIPE_LAST_UPDATE_pn-mutter = "Jan 13, 2010"
-RECIPE_MAINTAINER_pn-mutter = "Edwin Zhai <edwin.zhai@intel.com>"
+RECIPE_MAINTAINER_pn-mutter = "Zhai Edwin <edwin.zhai@intel.com>"
 
 DISTRO_PN_ALIAS_pn-poky-feed-config-opkg = "OE-Core"
 DISTRO_PN_ALIAS_pn-core-image-base = "OE-Core"
@@ -5537,7 +5545,7 @@ RECIPE_STATUS_pn-eglibc = "red"
 
 RECIPE_STATUS_pn-lighttpd = "red"
 RECIPE_LAST_UPDATE_pn-lighttpd = "Sep 28, 2010"
-RECIPE_MAINTAINER_pn-lighttpd = "Edwin Zhai <edwin.zhai@intel.com>"
+RECIPE_MAINTAINER_pn-lighttpd = "Zhai Edwin <edwin.zhai@intel.com>"
 RECIPE_DEPENDENCY_CHECK_pn-lighttpd = "not done"
 RECIPE_LATEST_VERSION_pn-lighttpd = "1.4.28"
 RECIPE_NO_OF_PATCHES_pn-lighttpd = "0"
@@ -5578,7 +5586,7 @@ RECIPE_NO_UPDATE_REASON_pn-libtheora = "1.1.1 is latest stable release not 1.2.0
 RECIPE_STATUS_pn-libgdata = "red"
 RECIPE_LATEST_VERSION_pn-libgdata = "0.8.0"
 RECIPE_LAST_UPDATE_pn-libgdata = "Dec 29, 2010"
-RECIPE_MAINTAINER_pn-libgdata = "Edwin Zhai <edwin.zhai@intel.com>"
+RECIPE_MAINTAINER_pn-libgdata = "Zhai Edwin <edwin.zhai@intel.com>"
 
 RECIPE_LATEST_VERSION_pn-man-pages = "3.32"
 RECIPE_LATEST_VERSION_pn-qmmp = "0.4.3"
-- 
1.7.1



