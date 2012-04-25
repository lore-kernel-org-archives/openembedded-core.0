Received: from mga09.intel.com ([134.134.136.24])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <shane.wang@intel.com>) id 1SMy86-0003Di-Ul
	for openembedded-core@lists.openembedded.org;
	Wed, 25 Apr 2012 11:03:19 +0200
Received: from orsmga002.jf.intel.com ([10.7.209.21])
	by orsmga102.jf.intel.com with ESMTP; 25 Apr 2012 01:53:42 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="4.67,351,1309762800"; d="scan'208";a="136490642"
Received: from yocto-build5.sh.intel.com (HELO localhost) ([10.239.48.3])
	by orsmga002.jf.intel.com with ESMTP; 25 Apr 2012 01:53:41 -0700
From: Shane Wang <shane.wang@intel.com>
To: openembedded-core@lists.openembedded.org
Date: Wed, 25 Apr 2012 17:26:19 +0800
Message-Id: <4ea86a6b6583189e84a18ff1005ac928c7b2bb25.1335345819.git.shane.wang@intel.com>
X-Mailer: git-send-email 1.7.6
In-Reply-To: <cover.1335345819.git.shane.wang@intel.com>
References: <cover.1335345819.git.shane.wang@intel.com>
Subject: [PATCH 1/1] distro_tracking_fields: manual checks for some recipes
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
X-List-Received-Date: Wed, 25 Apr 2012 09:03:19 -0000

Signed-off-by: Shane Wang <shane.wang@intel.com>
---
 .../conf/distro/include/distro_tracking_fields.inc |   83 ++++++++++----------
 1 files changed, 43 insertions(+), 40 deletions(-)

diff --git a/meta/conf/distro/include/distro_tracking_fields.inc b/meta/conf/distro/include/distro_tracking_fields.inc
index de6f3dd..88dd046 100644
--- a/meta/conf/distro/include/distro_tracking_fields.inc
+++ b/meta/conf/distro/include/distro_tracking_fields.inc
@@ -111,7 +111,7 @@ RECIPE_NO_OF_PATCHES_pn-minicom = "1"
 RECIPE_LATEST_RELEASE_DATE_pn-minicom = "Feb 11, 2012"
 RECIPE_TIME_BETWEEN_LAST_TWO_RELEASES_pn-minicom = "22 months"
 RECIPE_LAST_UPDATE_pn-minicom = "Dec 27, 2011"
-RECIPE_MANUAL_CHECK_DATE_pn-minicom = "Mar 13, 2012"
+RECIPE_MANUAL_CHECK_DATE_pn-minicom = "Apr 25, 2012"
 RECIPE_MAINTAINER_pn-minicom = "Dongxiao Xu <dongxiao.xu@intel.com>"
 
 RECIPE_STATUS_pn-patch = "green"
@@ -178,7 +178,7 @@ RECIPE_STATUS_pn-eggdbus = "yellow"
 # patch comment
 RECIPE_DEPENDENCY_CHECK_pn-eggdbus = "not done"
 RECIPE_LATEST_VERSION_pn-eggdbus = "0.6"
-RECIPE_MANUAL_CHECK_DATE_pn-eggdbus = "Mar 13, 2012"
+RECIPE_MANUAL_CHECK_DATE_pn-eggdbus = "Apr 25, 2012"
 RECIPE_PATCH_pn-eggdbus+gtk-doc = "local; no comment; poky doesn't have full gtk-doc support, and eggdbus itself references AM_CONDITIONAL in Makefile.am earlier before configure script is run"
 RECIPE_PATCH_pn-eggdbus+marshal = "local; no comment; one binary generated in eggdbus build needs to be invoked. So point to native version"
 RECIPE_INTEL_SECTION_pn-eggdbus = "base libs"
@@ -375,7 +375,7 @@ RECIPE_TIME_BETWEEN_LAST_TWO_RELEASES_pn-libtirpc = "18 months"
 RECIPE_LATEST_RELEASE_DATE_pn-libtirpc = "May 02, 2011"
 RECIPE_COMMENTS_pn-libtirpc = ""
 RECIPE_LAST_UPDATE_pn-libtirpc = "Sep 1, 2010"
-RECIPE_MANUAL_CHECK_DATE_pn-libtirpc = "Mar 13, 2012"
+RECIPE_MANUAL_CHECK_DATE_pn-libtirpc = "Apr 25, 2012"
 RECIPE_MAINTAINER_pn-libtirpc = "Dongxiao Xu <dongxiao.xu@intel.com>"
 
 RECIPE_STATUS_pn-gdbm = "green"
@@ -810,7 +810,7 @@ RECIPE_TIME_BETWEEN_LAST_TWO_RELEASES_pn-opkg = "2 months"
 RECIPE_LATEST_RELEASE_DATE_pn-opkg = "Feb 01, 2010"
 RECIPE_COMMENTS_pn-opkg = ""
 RECIPE_LAST_UPDATE_pn-opkg = "Jul 21, 2010"
-RECIPE_MANUAL_CHECK_DATE_pn-opkg = "Mar 13, 2012"
+RECIPE_MANUAL_CHECK_DATE_pn-opkg = "Apr 25, 2012"
 RECIPE_MAINTAINER_pn-opkg = "Dongxiao Xu <dongxiao.xu@intel.com>"
 DISTRO_PN_ALIAS_pn-opkg = "OSPDT upstream=http://svn.openmoko.org/trunk/src/tar"
 
@@ -1043,6 +1043,7 @@ RECIPE_TIME_BETWEEN_LAST_TWO_RELEASES_pn-cwautomacros = "3 days"
 RECIPE_LATEST_RELEASE_DATE_pn-cwautomacros = "Feb 01, 2011"
 RECIPE_COMMENTS_pn-cwautomacros = ""
 RECIPE_LAST_UPDATE_pn-cwautomacros = "Apr 26, 2011"
+RECIPE_MANUAL_CHECK_DATE_pn-cwautomacros = "Apr 25, 2012"
 RECIPE_MAINTAINER_pn-cwautomacros = "Dongxiao Xu <dongxiao.xu@intel.com>"
 DISTRO_PN_ALIAS_pn-cwautomacros= "OSPDT upstream=http://cwautomacros.berlios.de/"
 
@@ -1065,7 +1066,7 @@ RECIPE_TIME_BETWEEN_LAST_TWO_RELEASES_pn-quota = "13 months"
 RECIPE_LATEST_RELEASE_DATE_pn-quota = "Aug 17, 2011"
 RECIPE_COMMENTS_pn-quota = ""
 RECIPE_LAST_UPDATE_pn-quota = "Dec 30, 2011"
-RECIPE_MANUAL_CHECK_DATE_pn-quota = "Mar 13, 2012"
+RECIPE_MANUAL_CHECK_DATE_pn-quota = "Apr 25, 2012"
 RECIPE_MAINTAINER_pn-quota = "Dongxiao Xu <dongxiao.xu@intel.com>"
 
 RECIPE_STATUS_pn-mdadm = "green"
@@ -1112,7 +1113,7 @@ RECIPE_STATUS_pn-ethtool = "green"
 RECIPE_LATEST_VERSION_pn-ethtool = "2.6.36"
 RECIPE_LATEST_RELEASE_DATE_pn-ethtool = "Nov 17, 2010"
 RECIPE_LAST_UPDATE_pn-ethtool = "Nov 28, 2010"
-RECIPE_MANUAL_CHECK_DATE_pn-ethtool = "Mar 13, 2012"
+RECIPE_MANUAL_CHECK_DATE_pn-ethtool = "Apr 25, 2012"
 RECIPE_MAINTAINER_pn-ethtool = "Zhai Edwin <edwin.zhai@intel.com>"
 
 RECIPE_STATUS_pn-net-tools = "green"
@@ -1202,12 +1203,12 @@ RECIPE_STATUS_pn-watchdog = "green"
 RECIPE_LAST_UPDATE_pn-watchdog = "Dec 30, 2011"
 RECIPE_MAINTAINER_pn-watchdog = "Dexuan Cui <dexuan.cui@intel.com>"
 RECIPE_DEPENDENCY_CHECK_pn-watchdog = "not done"
-RECIPE_LATEST_VERSION_pn-watchdog = "5.11"
+RECIPE_LATEST_VERSION_pn-watchdog = "5.12"
 RECIPE_NO_OF_PATCHES_pn-watchdog = "0"
 RECIPE_INTEL_SECTION_pn-watchdog = "base utils"
 RECIPE_TIME_BETWEEN_LAST_TWO_RELEASES_pn-watchdog = "3 months"
-RECIPE_LATEST_RELEASE_DATE_pn-watchdog = "Dec 28, 2011"
-RECIPE_MANUAL_CHECK_DATE_pn-watchdog = "Feb 29, 2012"
+RECIPE_LATEST_RELEASE_DATE_pn-watchdog = "Apr 05, 2012"
+RECIPE_MANUAL_CHECK_DATE_pn-watchdog = "Apr 25, 2012"
 RECIPE_COMMENTS_pn-watchdog = ""
 DISTRO_PN_ALIAS_pn-watchdog = "Debian=watchdog Ubuntu=watchdog Mandriva=watchdog"
 
@@ -1333,7 +1334,7 @@ RECIPE_STATUS_pn-beecrypt = "green"
 RECIPE_LATEST_VERSION_pn-beecrypt = "4.2.1"
 RECIPE_LATEST_RELEASE_DATE_pn-beecrypt = "Jul 12, 2009"
 RECIPE_LAST_UPDATE_pn-beecrypt = "Nov 26, 2010"
-RECIPE_MANUAL_CHECK_DATE_pn-beecrypt = "Mar 13, 2012"
+RECIPE_MANUAL_CHECK_DATE_pn-beecrypt = "Apr 25, 2012"
 RECIPE_MAINTAINER_pn-beecrypt = "Zhai Edwin <edwin.zhai@intel.com>"
 
 RECIPE_STATUS_pn-libacpi = "red"
@@ -1346,7 +1347,7 @@ RECIPE_STATUS_pn-acpid = "green"
 RECIPE_LATEST_VERSION_pn-acpid = "1.0.10"
 RECIPE_LATEST_RELEASE_DATE_pn-acpid = "Apr 22, 2009"
 RECIPE_LAST_UPDATE_pn-acpid = "Nov 26, 2010"
-RECIPE_MANUAL_CHECK_DATE_pn-acpid = "Mar 13, 2012"
+RECIPE_MANUAL_CHECK_DATE_pn-acpid = "Apr 25, 2012"
 RECIPE_MAINTAINER_pn-acpid = "Zhai Edwin <edwin.zhai@intel.com>"
 
 RECIPE_STATUS_pn-consolekit = "green"
@@ -1433,7 +1434,7 @@ RECIPE_TIME_BETWEEN_LAST_TWO_RELEASES_pn-rpcbind = "6 months"
 RECIPE_LATEST_RELEASE_DATE_pn-rpcbind = "May 01, 2009"
 RECIPE_COMMENTS_pn-rpcbind = ""
 RECIPE_LAST_UPDATE_pn-rpcbind = "Sep 1, 2010"
-RECIPE_MANUAL_CHECK_DATE_pn-rpcbind = "Mar 13, 2012"
+RECIPE_MANUAL_CHECK_DATE_pn-rpcbind = "Apr 25, 2012"
 RECIPE_MAINTAINER_pn-rpcbind = "Dongxiao Xu <dongxiao.xu@intel.com>"
 
 RECIPE_STATUS_pn-time = "green"
@@ -1796,7 +1797,7 @@ RECIPE_LATEST_VERSION_pn-strace = "4.6"
 RECIPE_INTEL_SECTION_pn-strace = "base utils"
 RECIPE_TIME_BETWEEN_LAST_TWO_RELEASES_pn-strace = "11 months"
 RECIPE_LATEST_RELEASE_DATE_pn-strace = "Mar 15, 2011"
-RECIPE_MANUAL_CHECK_DATE_pn-strace = "Mar 13, 2012"
+RECIPE_MANUAL_CHECK_DATE_pn-strace = "Apr 25, 2012"
 RECIPE_COMMENTS_pn-strace = "3-clause BSD"
 
 RECIPE_STATUS_pn-dhcp = "green"
@@ -1832,14 +1833,14 @@ RECIPE_LATEST_RELEASE_DATE_pn-udev = "Jan 11, 2012"
 RECIPE_COMMENTS_pn-udev = "udev updates will require extra testing in the transition to kmod, etc"
 
 RECIPE_STATUS_pn-tzdata = "green"
-RECIPE_LATEST_VERSION_pn-tzdata = "2012b"
-RECIPE_LATEST_RELEASE_DATE_pn-tzdata = "Mar 02, 2012"
+RECIPE_LATEST_VERSION_pn-tzdata = "2012c"
+RECIPE_LATEST_RELEASE_DATE_pn-tzdata = "Apr 02, 2012"
 RECIPE_LAST_UPDATE_pn-tzdata = "Oct 18, 2011"
 RECIPE_MAINTAINER_pn-tzdata = "Zhai Edwin <edwin.zhai@intel.com>"
 RECIPE_DEPENDENCY_CHECK_pn-tzdata = "not done"
 RECIPE_INTEL_SECTION_pn-tzdata = "base utils"
 RECIPE_TIME_BETWEEN_LAST_TWO_RELEASES_pn-tzdata = "1 month"
-RECIPE_MANUAL_CHECK_DATE_pn-tzdata = "Mar 13, 2012"
+RECIPE_MANUAL_CHECK_DATE_pn-tzdata = "Apr 25, 2012"
 RECIPE_COMMENTS_pn-tzdata = ""
 DISTRO_PN_ALIAS_pn-tzcode = "OSPDT"
 
@@ -2070,7 +2071,7 @@ RECIPE_STATUS_pn-setserial = "red"
 RECIPE_LATEST_VERSION_pn-setserial = "2.17"
 RECIPE_LATEST_RELEASE_DATE_pn-setserial = "Feb 09, 2000"
 RECIPE_LAST_UPDATE_pn-setserial = "Jul 21, 2006"
-RECIPE_MANUAL_CHECK_DATE_pn-setserial = "Mar 13, 2012"
+RECIPE_MANUAL_CHECK_DATE_pn-setserial = "Apr 25, 2012"
 RECIPE_MAINTAINER_pn-setserial = "Zhai Edwin <edwin.zhai@intel.com>"
 
 RECIPE_STATUS_pn-stat = "red"
@@ -2082,9 +2083,9 @@ DISTRO_PN_ALIAS_pn-stat = "Debian=coreutils Fedora=coreutils"
 
 RECIPE_STATUS_pn-hdparm = "red"
 RECIPE_LATEST_VERSION_pn-hdparm = "9.39"
-RECIPE_LATEST_RELEASE_DATE_pn-libexif = "Feb 03, 2012"
+RECIPE_LATEST_RELEASE_DATE_pn-hdparm = "Feb 03, 2012"
 RECIPE_LAST_UPDATE_pn-hdparm = "Feb 29, 2012"
-RECIPE_MANUAL_CHECK_DATE_pn-hdparm = "Feb 29, 2012"
+RECIPE_MANUAL_CHECK_DATE_pn-hdparm = "Apr 25, 2012"
 RECIPE_MAINTAINER_pn-hdparm = "Dexuan Cui <dexuan.cui@intel.com>"
 
 RECIPE_STATUS_pn-wbxml2 = "red"
@@ -2212,7 +2213,7 @@ RECIPE_NO_OF_PATCHES_pn-wireless-tools="3"
 RECIPE_LATEST_RELEASE_DATE_pn-wireless-tools="Sep 18, 2007"
 RECIPE_TIME_BETWEEN_LAST_TWO_RELEASES_pn-wireless-tools="18 months"
 RECIPE_LAST_UPDATE_pn-wireless-tools = "Oct 19, 2007"
-RECIPE_MANUAL_CHECK_DATE_pn-wireless-tools = "Mar 13, 2012"
+RECIPE_MANUAL_CHECK_DATE_pn-wireless-tools = "Apr 25, 2012"
 RECIPE_MAINTAINER_pn-wireless-tools = "Dongxiao Xu <dongxiao.xu@intel.com>"
 
 RECIPE_STATUS_pn-bluez-dtl1-workaround="yellow"
@@ -2230,7 +2231,7 @@ RECIPE_NO_OF_PATCHES_pn-irda-utils="0"
 RECIPE_LATEST_RELEASE_DATE_pn-irda-utils="Jul 10, 2006"
 RECIPE_TIME_BETWEEN_LAST_TWO_RELEASES_pn-irda-utils="4 months"
 RECIPE_LAST_UPDATE_pn-irda-utils = "Jun 25, 2010"
-RECIPE_MANUAL_CHECK_DATE_pn-irda-utils = "Mar 13, 2012"
+RECIPE_MANUAL_CHECK_DATE_pn-irda-utils = "Apr 25, 2012"
 RECIPE_MAINTAINER_pn-irda-utils = "Dongxiao Xu <dongxiao.xu@intel.com>"
 
 RECIPE_STATUS_pn-bluez4="green"
@@ -2507,7 +2508,7 @@ RECIPE_NO_OF_PATCHES_pn-libical = "0"
 RECIPE_LATEST_RELEASE_DATE_pn-libical = "Dec 13, 2011"
 RECIPE_TIME_BETWEEN_LAST_TWO_RELEASES_pn-libical = "2 months"
 RECIPE_LAST_UPDATE_pn-libical = "Dec 26, 2011"
-RECIPE_MANUAL_CHECK_DATE_pn-libical = "Mar 13, 2012"
+RECIPE_MANUAL_CHECK_DATE_pn-libical = "Apr 25, 2012"
 RECIPE_MAINTAINER_pn-libical = "Dongxiao Xu <dongxiao.xu@intel.com>"
 
 RECIPE_STATUS_pn-task-base="green"
@@ -2731,7 +2732,7 @@ RECIPE_NO_OF_PATCHES_pn-flac="3"
 RECIPE_LATEST_RELEASE_DATE_pn-flac="Sep 16, 2007"
 RECIPE_TIME_BETWEEN_LAST_TWO_RELEASES_pn-flac="2 months"
 RECIPE_LAST_UPDATE_pn-flac = "Jun 26, 2010"
-RECIPE_MANUAL_CHECK_DATE_pn-flac = "Mar 13, 2012"
+RECIPE_MANUAL_CHECK_DATE_pn-flac = "Apr 25, 2012"
 RECIPE_MAINTAINER_pn-flac = "Dongxiao Xu <dongxiao.xu@intel.com>"
 
 RECIPE_STATUS_pn-libvorbis="green"
@@ -2934,15 +2935,15 @@ RECIPE_LATEST_VERSION_pn-libomxil = "0.9.3"
 RECIPE_LATEST_RELEASE_DATE_pn-libomxil = "May 20, 2011"
 RECIPE_LAST_UPDATE_pn-libomxil = "Dec 30, 2011"
 RECIPE_MAINTAINER_pn-libomxil = "Dongxiao Xu <dongxiao.xu@intel.com>"
-RECIPE_MANUAL_CHECK_DATE_pn-libomxil = "Dec 24, 2011"
+RECIPE_MANUAL_CHECK_DATE_pn-libomxil = "Apr 25, 2012"
 DISTRO_PN_ALIAS_pn-libomxil = "OSPDT upstream=http://omxil.sourceforge.net/"
 
 RECIPE_STATUS_pn-libsamplerate0 = "green"
 DISTRO_PN_ALIAS_pn-libsamplerate0 = "Meego=libsamplerate Fedora=libsamplerate OpenSuSE=libsamplerate Ubuntu=libsamplerate Mandriva=libsamplerate Debian=libsamplerate"
 RECIPE_LATEST_VERSION_pn-libsamplerate0 = "0.1.8"
 RECIPE_LATEST_RELEASE_DATE_pn-libsamplerate0 = "Aug 15, 2011"
-RECIPE_MANUAL_CHECK_DATE_pn-libsamplerate0 = "Dec 24, 2011"
-RECIPE_LAST_UPDATE_pn-libsamplerate0 = "Mar 13, 2012"
+RECIPE_MANUAL_CHECK_DATE_pn-libsamplerate0 = "Apr 25, 2012"
+RECIPE_LAST_UPDATE_pn-libsamplerate0 = "Dec 24, 2011"
 RECIPE_MAINTAINER_pn-libsamplerate0 = "Dongxiao Xu <dongxiao.xu@intel.com>"
 
 RECIPE_STATUS_pn-oprofileui = "green"
@@ -2969,7 +2970,7 @@ RECIPE_TIME_BETWEEN_LAST_TWO_RELEASES_pn-oprofile = "4 months"
 RECIPE_LATEST_RELEASE_DATE_pn-oprofile = "Aug 12, 2011"
 RECIPE_COMMENTS_pn-oprofile = ""
 RECIPE_LAST_UPDATE_pn-oprofile = "Jun 22, 2010"
-RECIPE_MANUAL_CHECK_DATE_pn-oprofile = "Feb 29, 2012"
+RECIPE_MANUAL_CHECK_DATE_pn-oprofile = "Apr 25, 2012"
 RECIPE_MAINTAINER_pn-oprofile = "Dexuan Cui <dexuan.cui@intel.com>"
 
 RECIPE_STATUS_pn-powertop = "green"
@@ -3412,7 +3413,7 @@ RECIPE_TIME_BETWEEN_LAST_TWO_RELEASES_pn-pcmanfm = "3 months"
 RECIPE_LATEST_RELEASE_DATE_pn-pcmanfm = "Oct 24, 2011"
 RECIPE_COMMENTS_pn-pcmanfm = ""
 RECIPE_LAST_UPDATE_pn-pcmanfm = "Nov 19, 2010"
-RECIPE_MANUAL_CHECK_DATE_pn-pcmanfm = "Mar 13, 2012"
+RECIPE_MANUAL_CHECK_DATE_pn-pcmanfm = "Apr 25, 2012"
 RECIPE_MAINTAINER_pn-pcmanfm = "Zhai Edwin <edwin.zhai@intel.com>"
 
 RECIPE_STATUS_pn-oh-puzzles = "green"
@@ -3433,8 +3434,8 @@ RECIPE_MAINTAINER_pn-gnome-terminal = "Zhai Edwin <edwin.zhai@intel.com>"
 
 RECIPE_STATUS_pn-puzzles = "red"
 DISTRO_PN_ALIAS_pn-puzzles = "Debian=sgt-puzzles"
-RECIPE_LATEST_VERSION_pn-puzzles = "r9375"
-RECIPE_MANUAL_CHECK_DATE_pn-puzzles = "Dec 30, 2011"
+RECIPE_LATEST_VERSION_pn-puzzles = "r9455"
+RECIPE_MANUAL_CHECK_DATE_pn-puzzles = "Apr 25, 2012"
 RECIPE_LAST_UPDATE_pn-puzzles = "Dec 30, 2011"
 RECIPE_MAINTAINER_pn-puzzles = "Zhai Edwin <edwin.zhai@intel.com>"
 DISTRO_PN_ALIAS_pn-puzzles = "Debian=sgt-puzzles Fedora=puzzles"
@@ -3512,7 +3513,7 @@ RECIPE_MAINTAINER_pn-claws-mail = "Zhai Edwin <edwin.zhai@intel.com>"
 RECIPE_STATUS_pn-x11vnc = "green"
 RECIPE_LATEST_VERSION_pn-x11vnc = "0.9.13"
 RECIPE_LATEST_RELEASE_DATE_pn-x11vnc = "Sep 13, 2011"
-RECIPE_MANUAL_CHECK_DATE_pn-x11vnc = "Mar 13, 2012"
+RECIPE_MANUAL_CHECK_DATE_pn-x11vnc = "Apr 25, 2012"
 RECIPE_LAST_UPDATE_pn-x11vnc = "Nov 30, 2010"
 RECIPE_MAINTAINER_pn-x11vnc = "Zhai Edwin <edwin.zhai@intel.com>"
 DISTRO_PN_ALIAS_pn-x11vnc = "Fedora=x11vnc Ubuntu=x11vnc"
@@ -4868,15 +4869,15 @@ RECIPE_MAINTAINER_pn-fontconfig = "Dexuan Cui <dexuan.cui@intel.com>"
 
 RECIPE_STATUS_pn-freetype = "green"
 RECIPE_DEPENDENCY_CHECK_pn-freetype = "not done"
-RECIPE_LATEST_VERSION_pn-freetype = "2.4.8"
+RECIPE_LATEST_VERSION_pn-freetype = "2.4.9"
 RECIPE_NO_OF_PATCHES_pn-freetype = "1"
 RECIPE_PATCH_pn-freetype+no-hardcode = "fix freetype-config.in"
 RECIPE_INTEL_SECTION_pn-freetype = "libs"
 RECIPE_TIME_BETWEEN_LAST_TWO_RELEASES_pn-freetype = "1+ months"
-RECIPE_LATEST_RELEASE_DATE_pn-freetype = "Nov 15, 2011"
+RECIPE_LATEST_RELEASE_DATE_pn-freetype = "Mar 08, 2012"
 RECIPE_COMMENTS_pn-freetype = ""
 RECIPE_LAST_UPDATE_pn-freetype = "Dec 27, 2011"
-RECIPE_MANUAL_CHECK_DATE_pn-freetype = "Feb 29, 2012"
+RECIPE_MANUAL_CHECK_DATE_pn-freetype = "Apr 25, 2012"
 RECIPE_MAINTAINER_pn-freetype = "Dexuan Cui <dexuan.cui@intel.com>"
 
 RECIPE_STATUS_pn-librsvg = "green"
@@ -5320,6 +5321,7 @@ RECIPE_TIME_BETWEEN_LAST_TWO_RELEASES_pn-tslib = "n/a"
 RECIPE_LATEST_RELEASE_DATE_pn-tslib = "Aug 01, 2006"
 RECIPE_COMMENTS_pn-tslib = ""
 RECIPE_LAST_UPDATE_pn-tslib = "Aug 17, 2006"
+RECIPE_MANUAL_CHECK_DATE_pn-tslib = "Apr 25, 2012"
 RECIPE_MAINTAINER_pn-tslib = "Zhai Edwin <edwin.zhai@intel.com>"
 
 RECIPE_STATUS_pn-xcursor-transparent-theme = "green"
@@ -5475,8 +5477,8 @@ RECIPE_MAINTAINER_pn-gnome-common = "Zhai Edwin <edwin.zhai@intel.com>"
 RECIPE_STATUS_pn-webkit-gtk = "green"
 DISTRO_PN_ALIAS_pn-webkit-gtk = "Fedora=webkitgtk"
 RECIPE_DEPENDENCY_CHECK_pn-webkit-gtk = "not done"
-RECIPE_LATEST_VERSION_pn-webkit-gtk = "1.6.1+svnr104660"
-RECIPE_MANUAL_CHECK_DATE_pn-webkit-gtk = "Jan 11, 2012"
+RECIPE_LATEST_VERSION_pn-webkit-gtk = "1.8.0+svnr115175"
+RECIPE_MANUAL_CHECK_DATE_pn-webkit-gtk = "Apr 25, 2012"
 RECIPE_NO_OF_PATCHES_pn-webkit-gtk = "1"
 RECIPE_INTEL_SECTION_pn-webkit-gtk = "graphic UX"
 RECIPE_TIME_BETWEEN_LAST_TWO_RELEASES_pn-webkit-gtk = "1 month"
@@ -5617,13 +5619,14 @@ RECIPE_MAINTAINER_pn-matchbox-config-gtk = "Zhai Edwin <edwin.zhai@intel.com>"
 RECIPE_STATUS_pn-matchbox-keyboard = "green"
 DISTRO_PN_ALIAS_pn-matchbox-keyboard = "Debian=matchbox-keyboard Fedora=matchbox-keyboard"
 RECIPE_DEPENDENCY_CHECK_pn-matchbox-keyboard = "not done"
-RECIPE_LATEST_VERSION_pn-matchbox-keyboard = "0.0+svnr2075"
+RECIPE_LATEST_VERSION_pn-matchbox-keyboard = "0.0+git1+93336109ca4536576805a7583e7e22634a7d8443"
 RECIPE_NO_OF_PATCHES_pn-matchbox-keyboard = "0"
 RECIPE_INTEL_SECTION_pn-matchbox-keyboard = "graphic UX"
 RECIPE_TIME_BETWEEN_LAST_TWO_RELEASES_pn-matchbox-keyboard = "n/a"
-RECIPE_LATEST_RELEASE_DATE_pn-matchbox-keyboard = "Sep 01, 2008"
+RECIPE_LATEST_RELEASE_DATE_pn-matchbox-keyboard = "Mar 13, 2012"
 RECIPE_COMMENTS_pn-matchbox-keyboard = ""
 RECIPE_LAST_UPDATE_pn-matchbox-keyboard = "Jul 6, 2010"
+RECIPE_MANUAL_CHECK_DATE_pn-matchbox-keyboard = "Apr 25, 2012"
 RECIPE_MAINTAINER_pn-matchbox-keyboard = "Zhai Edwin <edwin.zhai@intel.com>"
 
 RECIPE_STATUS_pn-matchbox-panel-2 = "green"
@@ -5698,7 +5701,7 @@ RECIPE_MAINTAINER_pn-web-webkit = "Zhai Edwin <edwin.zhai@intel.com>"
 RECIPE_STATUS_pn-libfm = "green"
 RECIPE_DEPENDENCY_CHECK_pn-libfm = "not done"
 RECIPE_LATEST_VERSION_pn-libfm = "0.1.17"
-RECIPE_MANUAL_CHECK_DATE_pn-libfm = "Mar 13, 2012"
+RECIPE_MANUAL_CHECK_DATE_pn-libfm = "Apr 25, 2012"
 RECIPE_NO_OF_PATCHES_pn-libfm = "0"
 RECIPE_INTEL_SECTION_pn-libfm = "graphic UX"
 RECIPE_TIME_BETWEEN_LAST_TWO_RELEASES_pn-libfm = "3 months"
@@ -5710,7 +5713,7 @@ RECIPE_MAINTAINER_pn-libfm = "Zhai Edwin <edwin.zhai@intel.com>"
 RECIPE_STATUS_pn-menu-cache = "green"
 RECIPE_DEPENDENCY_CHECK_pn-menu-cache = "not done"
 RECIPE_LATEST_VERSION_pn-menu-cache = "0.3.2"
-RECIPE_MANUAL_CHECK_DATE_pn-menu-cache = "Mar 13, 2012"
+RECIPE_MANUAL_CHECK_DATE_pn-menu-cache = "Apr 25, 2012"
 RECIPE_NO_OF_PATCHES_pn-menu-cache = "0"
 RECIPE_INTEL_SECTION_pn-menu-cache = "graphic UX"
 RECIPE_TIME_BETWEEN_LAST_TWO_RELEASES_pn-menu-cache = "1 month"
-- 
1.7.6



