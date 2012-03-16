Received: from mga09.intel.com ([134.134.136.24])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <shane.wang@intel.com>) id 1S8LC4-0000lF-Nc
	for openembedded-core@lists.openembedded.org;
	Fri, 16 Mar 2012 01:38:57 +0100
Received: from orsmga001.jf.intel.com ([10.7.209.18])
	by orsmga102.jf.intel.com with ESMTP; 15 Mar 2012 17:30:08 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="4.67,352,1309762800"; d="scan'208";a="118170664"
Received: from yocto-build5.sh.intel.com (HELO localhost) ([10.239.48.3])
	by orsmga001.jf.intel.com with ESMTP; 15 Mar 2012 17:29:07 -0700
From: Shane Wang <shane.wang@intel.com>
To: openembedded-core@lists.openembedded.org
Date: Fri, 16 Mar 2012 08:51:58 +0800
Message-Id: <fa4a26b05739e4f22b999571ff20a35ec84d29e7.1331859046.git.shane.wang@intel.com>
X-Mailer: git-send-email 1.7.6
In-Reply-To: <cover.1331859046.git.shane.wang@intel.com>
References: <cover.1331859046.git.shane.wang@intel.com>
Subject: [PATCH 01/60] distro_tracking: update the recipe info for manual check
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
X-List-Received-Date: Fri, 16 Mar 2012 00:38:57 -0000

Signed-off-by: Shane Wang <shane.wang@intel.com>
---
 .../conf/distro/include/distro_tracking_fields.inc |   51 ++++++++++----------
 1 files changed, 26 insertions(+), 25 deletions(-)

diff --git a/meta/conf/distro/include/distro_tracking_fields.inc b/meta/conf/distro/include/distro_tracking_fields.inc
index d8cb150..153cb4b 100644
--- a/meta/conf/distro/include/distro_tracking_fields.inc
+++ b/meta/conf/distro/include/distro_tracking_fields.inc
@@ -105,12 +105,12 @@ RECIPE_MANUAL_CHECK_DATE_pn-mingetty = "Jan 12, 2012"
 RECIPE_MAINTAINER_pn-mingetty = "Xiaofeng.Yan <xiaofeng@windriver.com>"
 
 RECIPE_STATUS_pn-minicom = "green"
-RECIPE_LATEST_VERSION_pn-minicom = "2.5"
+RECIPE_LATEST_VERSION_pn-minicom = "2.6.1"
 RECIPE_NO_OF_PATCHES_pn-minicom = "1"
-RECIPE_LATEST_RELEASE_DATE_pn-minicom = "Jan 29, 2011"
+RECIPE_LATEST_RELEASE_DATE_pn-minicom = "Feb 11, 2012"
 RECIPE_TIME_BETWEEN_LAST_TWO_RELEASES_pn-minicom = "22 months"
 RECIPE_LAST_UPDATE_pn-minicom = "Dec 27, 2011"
-RECIPE_MANUAL_CHECK_DATE_pn-minicom = "Dec 24, 2011"
+RECIPE_MANUAL_CHECK_DATE_pn-minicom = "Mar 13, 2012"
 RECIPE_MAINTAINER_pn-minicom = "Dongxiao Xu <dongxiao.xu@intel.com>"
 
 RECIPE_STATUS_pn-patch = "green"
@@ -168,7 +168,7 @@ RECIPE_MAINTAINER_pn-icu = "Scott Garman <scott.a.garman@intel.com>"
 RECIPE_STATUS_pn-eggdbus = "yellow" # patch comment
 RECIPE_DEPENDENCY_CHECK_pn-eggdbus = "not done"
 RECIPE_LATEST_VERSION_pn-eggdbus = "0.6"
-RECIPE_MANUAL_CHECK_DATE_pn-eggdbus = "Dec 24, 2011"
+RECIPE_MANUAL_CHECK_DATE_pn-eggdbus = "Mar 13, 2012"
 RECIPE_PATCH_pn-eggdbus+gtk-doc = "local; no comment; poky doesn't have full gtk-doc support, and eggdbus itself references AM_CONDITIONAL in Makefile.am earlier before configure script is run"
 RECIPE_PATCH_pn-eggdbus+marshal = "local; no comment; one binary generated in eggdbus build needs to be invoked. So point to native version"
 RECIPE_INTEL_SECTION_pn-eggdbus = "base libs"
@@ -356,7 +356,7 @@ RECIPE_TIME_BETWEEN_LAST_TWO_RELEASES_pn-libtirpc = "18 months"
 RECIPE_LATEST_RELEASE_DATE_pn-libtirpc = "May 02, 2011"
 RECIPE_COMMENTS_pn-libtirpc = ""
 RECIPE_LAST_UPDATE_pn-libtirpc = "Sep 1, 2010"
-RECIPE_MANUAL_CHECK_DATE_pn-libtirpc = "Dec 24, 2011"
+RECIPE_MANUAL_CHECK_DATE_pn-libtirpc = "Mar 13, 2012"
 RECIPE_MAINTAINER_pn-libtirpc = "Dongxiao Xu <dongxiao.xu@intel.com>"
 
 RECIPE_STATUS_pn-gdbm = "green"
@@ -781,7 +781,7 @@ RECIPE_TIME_BETWEEN_LAST_TWO_RELEASES_pn-opkg = "2 months"
 RECIPE_LATEST_RELEASE_DATE_pn-opkg = "Feb 01, 2010"
 RECIPE_COMMENTS_pn-opkg = ""
 RECIPE_LAST_UPDATE_pn-opkg = "Jul 21, 2010"
-RECIPE_MANUAL_CHECK_DATE_pn-opkg = "Nov 22, 2011"
+RECIPE_MANUAL_CHECK_DATE_pn-opkg = "Mar 13, 2012"
 RECIPE_MAINTAINER_pn-opkg = "Dongxiao Xu <dongxiao.xu@intel.com>"
 DISTRO_PN_ALIAS_pn-opkg = "OSPDT upstream=http://svn.openmoko.org/trunk/src/tar"
 
@@ -1036,7 +1036,7 @@ RECIPE_TIME_BETWEEN_LAST_TWO_RELEASES_pn-quota = "13 months"
 RECIPE_LATEST_RELEASE_DATE_pn-quota = "Aug 17, 2011"
 RECIPE_COMMENTS_pn-quota = ""
 RECIPE_LAST_UPDATE_pn-quota = "Dec 30, 2011"
-RECIPE_MANUAL_CHECK_DATE_pn-quota = "Dec 24, 2011"
+RECIPE_MANUAL_CHECK_DATE_pn-quota = "Mar 13, 2012"
 RECIPE_MAINTAINER_pn-quota = "Dongxiao Xu <dongxiao.xu@intel.com>"
 
 RECIPE_STATUS_pn-mdadm = "green"
@@ -1083,7 +1083,7 @@ RECIPE_STATUS_pn-ethtool = "green"
 RECIPE_LATEST_VERSION_pn-ethtool = "2.6.36"
 RECIPE_LATEST_RELEASE_DATE_pn-ethtool = "Nov 17, 2010"
 RECIPE_LAST_UPDATE_pn-ethtool = "Nov 28, 2010"
-RECIPE_MANUAL_CHECK_DATE_pn-ethtool = "Dec 24, 2011"
+RECIPE_MANUAL_CHECK_DATE_pn-ethtool = "Mar 13, 2012"
 RECIPE_MAINTAINER_pn-ethtool = "Zhai Edwin <edwin.zhai@intel.com>"
 
 RECIPE_STATUS_pn-net-tools = "green"
@@ -1301,7 +1301,7 @@ RECIPE_STATUS_pn-beecrypt = "green"
 RECIPE_LATEST_VERSION_pn-beecrypt = "4.2.1"
 RECIPE_LATEST_RELEASE_DATE_pn-beecrypt = "Jul 12, 2009"
 RECIPE_LAST_UPDATE_pn-beecrypt = "Nov 26, 2010"
-RECIPE_MANUAL_CHECK_DATE_pn-beecrypt = "Dec 24, 2011"
+RECIPE_MANUAL_CHECK_DATE_pn-beecrypt = "Mar 13, 2012"
 RECIPE_MAINTAINER_pn-beecrypt = "Zhai Edwin <edwin.zhai@intel.com>"
 
 RECIPE_STATUS_pn-libacpi = "red"
@@ -1314,7 +1314,7 @@ RECIPE_STATUS_pn-acpid = "green"
 RECIPE_LATEST_VERSION_pn-acpid = "1.0.10"
 RECIPE_LATEST_RELEASE_DATE_pn-acpid = "Apr 22, 2009"
 RECIPE_LAST_UPDATE_pn-acpid = "Nov 26, 2010"
-RECIPE_MANUAL_CHECK_DATE_pn-acpid = "Dec 24, 2011"
+RECIPE_MANUAL_CHECK_DATE_pn-acpid = "Mar 13, 2012"
 RECIPE_MAINTAINER_pn-acpid = "Zhai Edwin <edwin.zhai@intel.com>"
 
 RECIPE_STATUS_pn-consolekit = "green"
@@ -1401,7 +1401,7 @@ RECIPE_TIME_BETWEEN_LAST_TWO_RELEASES_pn-rpcbind = "6 months"
 RECIPE_LATEST_RELEASE_DATE_pn-rpcbind = "May 01, 2009"
 RECIPE_COMMENTS_pn-rpcbind = ""
 RECIPE_LAST_UPDATE_pn-rpcbind = "Sep 1, 2010"
-RECIPE_MANUAL_CHECK_DATE_pn-rpcbind = "Dec 24, 2011"
+RECIPE_MANUAL_CHECK_DATE_pn-rpcbind = "Mar 13, 2012"
 RECIPE_MAINTAINER_pn-rpcbind = "Dongxiao Xu <dongxiao.xu@intel.com>"
 
 RECIPE_STATUS_pn-time = "green"
@@ -1745,7 +1745,7 @@ RECIPE_LATEST_VERSION_pn-strace = "4.6"
 RECIPE_INTEL_SECTION_pn-strace = "base utils"
 RECIPE_TIME_BETWEEN_LAST_TWO_RELEASES_pn-strace = "11 months"
 RECIPE_LATEST_RELEASE_DATE_pn-strace = "Mar 15, 2011"
-RECIPE_MANUAL_CHECK_DATE_pn-strace = "Dec 24, 2011"
+RECIPE_MANUAL_CHECK_DATE_pn-strace = "Mar 13, 2012"
 RECIPE_COMMENTS_pn-strace = "3-clause BSD"
 
 RECIPE_STATUS_pn-dhcp = "green"
@@ -1778,14 +1778,14 @@ RECIPE_LATEST_RELEASE_DATE_pn-udev = "Jan 11, 2012"
 RECIPE_COMMENTS_pn-udev = "udev updates will require extra testing in the transition to kmod, etc"
 
 RECIPE_STATUS_pn-tzdata = "green"
-RECIPE_LATEST_VERSION_pn-tzdata = "2011n"
-RECIPE_LATEST_RELEASE_DATE_pn-tzdata = "Dec 15, 2011"
+RECIPE_LATEST_VERSION_pn-tzdata = "2012b"
+RECIPE_LATEST_RELEASE_DATE_pn-tzdata = "Mar 02, 2012"
 RECIPE_LAST_UPDATE_pn-tzdata = "Oct 18, 2011"
 RECIPE_MAINTAINER_pn-tzdata = "Zhai Edwin <edwin.zhai@intel.com>"
 RECIPE_DEPENDENCY_CHECK_pn-tzdata = "not done"
 RECIPE_INTEL_SECTION_pn-tzdata = "base utils"
 RECIPE_TIME_BETWEEN_LAST_TWO_RELEASES_pn-tzdata = "1 month"
-RECIPE_MANUAL_CHECK_DATE_pn-tzdata = "Dec 24, 2011"
+RECIPE_MANUAL_CHECK_DATE_pn-tzdata = "Mar 13, 2012"
 RECIPE_COMMENTS_pn-tzdata = ""
 DISTRO_PN_ALIAS_pn-tzcode = "OSPDT"
 
@@ -2003,7 +2003,7 @@ RECIPE_STATUS_pn-setserial = "red"
 RECIPE_LATEST_VERSION_pn-setserial = "2.17"
 RECIPE_LATEST_RELEASE_DATE_pn-setserial = "Feb 09, 2000"
 RECIPE_LAST_UPDATE_pn-setserial = "Jul 21, 2006"
-RECIPE_MANUAL_CHECK_DATE_pn-setserial = "Dec 24, 2011"
+RECIPE_MANUAL_CHECK_DATE_pn-setserial = "Mar 13, 2012"
 RECIPE_MAINTAINER_pn-setserial = "Zhai Edwin <edwin.zhai@intel.com>"
 
 RECIPE_STATUS_pn-stat = "red"
@@ -2142,7 +2142,7 @@ RECIPE_NO_OF_PATCHES_pn-wireless-tools="3"
 RECIPE_LATEST_RELEASE_DATE_pn-wireless-tools="Sep 18, 2007"
 RECIPE_TIME_BETWEEN_LAST_TWO_RELEASES_pn-wireless-tools="18 months"
 RECIPE_LAST_UPDATE_pn-wireless-tools = "Oct 19, 2007"
-RECIPE_MANUAL_CHECK_DATE_pn-wireless-tools = "Dec 24, 2011"
+RECIPE_MANUAL_CHECK_DATE_pn-wireless-tools = "Mar 13, 2012"
 RECIPE_MAINTAINER_pn-wireless-tools = "Dongxiao Xu <dongxiao.xu@intel.com>"
 
 RECIPE_STATUS_pn-bluez-dtl1-workaround="yellow" # LICENSE double check
@@ -2159,7 +2159,7 @@ RECIPE_NO_OF_PATCHES_pn-irda-utils="0"
 RECIPE_LATEST_RELEASE_DATE_pn-irda-utils="Jul 10, 2006"
 RECIPE_TIME_BETWEEN_LAST_TWO_RELEASES_pn-irda-utils="4 months"
 RECIPE_LAST_UPDATE_pn-irda-utils = "Jun 25, 2010"
-RECIPE_MANUAL_CHECK_DATE_pn-irda-utils = "Dec 24, 2011"
+RECIPE_MANUAL_CHECK_DATE_pn-irda-utils = "Mar 13, 2012"
 RECIPE_MAINTAINER_pn-irda-utils = "Dongxiao Xu <dongxiao.xu@intel.com>"
 
 RECIPE_STATUS_pn-bluez4="green"
@@ -2435,7 +2435,7 @@ RECIPE_NO_OF_PATCHES_pn-libical = "0"
 RECIPE_LATEST_RELEASE_DATE_pn-libical = "Dec 13, 2011"
 RECIPE_TIME_BETWEEN_LAST_TWO_RELEASES_pn-libical = "2 months"
 RECIPE_LAST_UPDATE_pn-libical = "Dec 26, 2011"
-RECIPE_MANUAL_CHECK_DATE_pn-libical = "Dec 24, 2011"
+RECIPE_MANUAL_CHECK_DATE_pn-libical = "Mar 13, 2012"
 RECIPE_MAINTAINER_pn-libical = "Dongxiao Xu <dongxiao.xu@intel.com>"
 
 RECIPE_STATUS_pn-task-base="green"
@@ -2657,7 +2657,7 @@ RECIPE_NO_OF_PATCHES_pn-flac="3"
 RECIPE_LATEST_RELEASE_DATE_pn-flac="Sep 16, 2007"
 RECIPE_TIME_BETWEEN_LAST_TWO_RELEASES_pn-flac="2 months"
 RECIPE_LAST_UPDATE_pn-flac = "Jun 26, 2010"
-RECIPE_MANUAL_CHECK_DATE_pn-flac = "Dec 24, 2011"
+RECIPE_MANUAL_CHECK_DATE_pn-flac = "Mar 13, 2012"
 RECIPE_MAINTAINER_pn-flac = "Dongxiao Xu <dongxiao.xu@intel.com>"
 
 RECIPE_STATUS_pn-libvorbis="green"
@@ -2865,7 +2865,7 @@ DISTRO_PN_ALIAS_pn-libsamplerate0 = "Meego=libsamplerate Fedora=libsamplerate Op
 RECIPE_LATEST_VERSION_pn-libsamplerate0 = "0.1.8"
 RECIPE_LATEST_RELEASE_DATE_pn-libsamplerate0 = "Aug 15, 2011"
 RECIPE_MANUAL_CHECK_DATE_pn-libsamplerate0 = "Dec 24, 2011"
-RECIPE_LAST_UPDATE_pn-libsamplerate0 = "Dec 27, 2011"
+RECIPE_LAST_UPDATE_pn-libsamplerate0 = "Mar 13, 2012"
 RECIPE_MAINTAINER_pn-libsamplerate0 = "Dongxiao Xu <dongxiao.xu@intel.com>"
 
 RECIPE_STATUS_pn-oprofileui = "green"
@@ -3319,7 +3319,7 @@ RECIPE_TIME_BETWEEN_LAST_TWO_RELEASES_pn-pcmanfm = "3 months"
 RECIPE_LATEST_RELEASE_DATE_pn-pcmanfm = "Oct 24, 2011"
 RECIPE_COMMENTS_pn-pcmanfm = ""
 RECIPE_LAST_UPDATE_pn-pcmanfm = "Nov 19, 2010"
-RECIPE_MANUAL_CHECK_DATE_pn-pcmanfm = "Dec 24, 2011"
+RECIPE_MANUAL_CHECK_DATE_pn-pcmanfm = "Mar 13, 2012"
 RECIPE_MAINTAINER_pn-pcmanfm = "Zhai Edwin <edwin.zhai@intel.com>"
 
 RECIPE_STATUS_pn-oh-puzzles = "green" # no update needed
@@ -3418,7 +3418,7 @@ RECIPE_MAINTAINER_pn-claws-mail = "Zhai Edwin <edwin.zhai@intel.com>"
 RECIPE_STATUS_pn-x11vnc = "green"
 RECIPE_LATEST_VERSION_pn-x11vnc = "0.9.13"
 RECIPE_LATEST_RELEASE_DATE_pn-x11vnc = "Sep 13, 2011"
-RECIPE_MANUAL_CHECK_DATE_pn-x11vnc = "Dec 24, 2011"
+RECIPE_MANUAL_CHECK_DATE_pn-x11vnc = "Mar 13, 2012"
 RECIPE_LAST_UPDATE_pn-x11vnc = "Nov 30, 2010"
 RECIPE_MAINTAINER_pn-x11vnc = "Zhai Edwin <edwin.zhai@intel.com>"
 DISTRO_PN_ALIAS_pn-x11vnc = "Fedora=x11vnc Ubuntu=x11vnc"
@@ -5508,7 +5508,7 @@ RECIPE_MAINTAINER_pn-web-webkit = "Zhai Edwin <edwin.zhai@intel.com>"
 RECIPE_STATUS_pn-libfm = "green"
 RECIPE_DEPENDENCY_CHECK_pn-libfm = "not done"
 RECIPE_LATEST_VERSION_pn-libfm = "0.1.17"
-RECIPE_MANUAL_CHECK_DATE_pn-libfm = "Dec 24, 2011"
+RECIPE_MANUAL_CHECK_DATE_pn-libfm = "Mar 13, 2012"
 RECIPE_NO_OF_PATCHES_pn-libfm = "0"
 RECIPE_INTEL_SECTION_pn-libfm = "graphic UX"
 RECIPE_TIME_BETWEEN_LAST_TWO_RELEASES_pn-libfm = "3 months"
@@ -5520,7 +5520,7 @@ RECIPE_MAINTAINER_pn-libfm = "Zhai Edwin <edwin.zhai@intel.com>"
 RECIPE_STATUS_pn-menu-cache = "green"
 RECIPE_DEPENDENCY_CHECK_pn-menu-cache = "not done"
 RECIPE_LATEST_VERSION_pn-menu-cache = "0.3.2"
-RECIPE_MANUAL_CHECK_DATE_pn-menu-cache = "Dec 24, 2011"
+RECIPE_MANUAL_CHECK_DATE_pn-menu-cache = "Mar 13, 2012"
 RECIPE_NO_OF_PATCHES_pn-menu-cache = "0"
 RECIPE_INTEL_SECTION_pn-menu-cache = "graphic UX"
 RECIPE_TIME_BETWEEN_LAST_TWO_RELEASES_pn-menu-cache = "1 month"
@@ -6221,6 +6221,7 @@ RECIPE_LATEST_RELEASE_DATE_pn-ltp = "Sep 15, 2011"
 RECIPE_TIME_BETWEEN_LAST_TWO_RELEASES_pn-ltp = "3 months"
 RECIPE_NO_OF_PATCHES_pn-ltp = "0"
 RECIPE_LAST_UPDATE_pn-ltp = "Dec 22, 2011"
+RECIPE_MANUAL_CHECK_DATE_pn-ltp = "Mar 13, 2012"
 RECIPE_MAINTAINER_pn-ltp = "Jiajun Xu <jiajun.xu@intel.com>"
 
 DISTRO_PN_ALIAS_pn-qt4-native = "Fedora=qt4 Debian=qt4-dev-tools"
-- 
1.7.6



