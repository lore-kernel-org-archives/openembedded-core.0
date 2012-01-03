Received: from mga03.intel.com ([143.182.124.21])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <sgw@linux.intel.com>) id 1Rhxr3-0004L1-2t
	for openembedded-core@lists.openembedded.org;
	Tue, 03 Jan 2012 07:28:14 +0100
Received: from azsmga001.ch.intel.com ([10.2.17.19])
	by azsmga101.ch.intel.com with ESMTP; 02 Jan 2012 22:20:46 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="4.71,315,1320652800"; d="scan'208";a="91752130"
Received: from unknown (HELO swold-mobl.bigsur.com) ([10.255.13.112])
	by azsmga001.ch.intel.com with ESMTP; 02 Jan 2012 22:20:46 -0800
From: Saul Wold <sgw@linux.intel.com>
To: openembedded-core@lists.openembedded.org
Date: Mon,  2 Jan 2012 22:19:00 -0800
Message-Id: <d8c6e881f4feefdf6e173de63d82afbb77830ed4.1325571069.git.sgw@linux.intel.com>
X-Mailer: git-send-email 1.7.6.4
In-Reply-To: <cover.1325571068.git.sgw@linux.intel.com>
References: <cover.1325571068.git.sgw@linux.intel.com>
In-Reply-To: <cover.1325571068.git.sgw@linux.intel.com>
References: <cover.1325571068.git.sgw@linux.intel.com>
Subject: [CONSOLIDATED PULL 014/113] distro_tracking_fields: update the info for the manual check list (2011/12/24)
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

update the information for the manual check list after checking the upstream on Dec 24, 2011.

Signed-off-by: Shane Wang <shane.wang@intel.com>
---
 .../conf/distro/include/distro_tracking_fields.inc |  123 +++++++++++---------
 1 files changed, 68 insertions(+), 55 deletions(-)

diff --git a/meta/conf/distro/include/distro_tracking_fields.inc b/meta/conf/distro/include/distro_tracking_fields.inc
index 7d30e3e..cee5404 100644
--- a/meta/conf/distro/include/distro_tracking_fields.inc
+++ b/meta/conf/distro/include/distro_tracking_fields.inc
@@ -85,10 +85,10 @@ RECIPE_MAINTAINER_pn-mingetty = "Xiaofeng.Yan <xiaofeng@windriver.com>"
 RECIPE_STATUS_pn-minicom = "green"
 RECIPE_LATEST_VERSION_pn-minicom = "2.5"
 RECIPE_NO_OF_PATCHES_pn-minicom = "1"
-RECIPE_LATEST_RELEASE_DATE_pn-minicom = "Dec 20, 2010"
+RECIPE_LATEST_RELEASE_DATE_pn-minicom = "Jan 29, 2011"
 RECIPE_TIME_BETWEEN_LAST_TWO_RELEASES_pn-minicom = "22 months"
 RECIPE_LAST_UPDATE_pn-minicom = "Nov 24, 2010"
-RECIPE_MANUAL_CHECK_DATE_pn-minicom = "Nov 22, 2011"
+RECIPE_MANUAL_CHECK_DATE_pn-minicom = "Dec 24, 2011"
 RECIPE_MAINTAINER_pn-minicom = "Dongxiao Xu <dongxiao.xu@intel.com>"
 
 RECIPE_STATUS_pn-patch = "green"
@@ -146,7 +146,7 @@ RECIPE_MAINTAINER_pn-icu = "Scott Garman <scott.a.garman@intel.com>"
 RECIPE_STATUS_pn-eggdbus = "yellow" # patch comment
 RECIPE_DEPENDENCY_CHECK_pn-eggdbus = "not done"
 RECIPE_LATEST_VERSION_pn-eggdbus = "0.6"
-RECIPE_MANUAL_CHECK_DATE_pn-eggdbus = "Nov 22, 2011"
+RECIPE_MANUAL_CHECK_DATE_pn-eggdbus = "Dec 24, 2011"
 RECIPE_PATCH_pn-eggdbus+gtk-doc = "local; no comment; poky doesn't have full gtk-doc support, and eggdbus itself references AM_CONDITIONAL in Makefile.am earlier before configure script is run"
 RECIPE_PATCH_pn-eggdbus+marshal = "local; no comment; one binary generated in eggdbus build needs to be invoked. So point to native version"
 RECIPE_INTEL_SECTION_pn-eggdbus = "base libs"
@@ -325,13 +325,13 @@ DISTRO_PN_ALIAS_pn-db = "Debian=db5.1 Ubuntu=db5.1"
 
 RECIPE_STATUS_pn-libtirpc = "green"
 RECIPE_DEPENDENCY_CHECK_pn-libtirpc = "not done"
-RECIPE_LATEST_VERSION_pn-libtirpc = "0.2.1"
+RECIPE_LATEST_VERSION_pn-libtirpc = "0.2.2"
 RECIPE_INTEL_SECTION_pn-libtirpc = "base libs"
-RECIPE_TIME_BETWEEN_LAST_TWO_RELEASES_pn-libtirpc = "6 months"
-RECIPE_LATEST_RELEASE_DATE_pn-libtirpc = "Nov 01, 2009"
+RECIPE_TIME_BETWEEN_LAST_TWO_RELEASES_pn-libtirpc = "18 months"
+RECIPE_LATEST_RELEASE_DATE_pn-libtirpc = "May 02, 2011"
 RECIPE_COMMENTS_pn-libtirpc = ""
 RECIPE_LAST_UPDATE_pn-libtirpc = "Sep 1, 2010"
-RECIPE_MANUAL_CHECK_DATE_pn-libtirpc = "Nov 22, 2011"
+RECIPE_MANUAL_CHECK_DATE_pn-libtirpc = "Dec 24, 2011"
 RECIPE_MAINTAINER_pn-libtirpc = "Dongxiao Xu <dongxiao.xu@intel.com>"
 
 RECIPE_STATUS_pn-gdbm = "green"
@@ -1006,13 +1006,13 @@ RECIPE_MAINTAINER_pn-which = "Dongxiao Xu <dongxiao.xu@intel.com>"
 
 RECIPE_STATUS_pn-quota = "green"
 RECIPE_DEPENDENCY_CHECK_pn-quota = "not done"
-RECIPE_LATEST_VERSION_pn-quota = "4.00-pre1"
+RECIPE_LATEST_VERSION_pn-quota = "4.00"
 RECIPE_INTEL_SECTION_pn-quota = "base utils"
 RECIPE_TIME_BETWEEN_LAST_TWO_RELEASES_pn-quota = "13 months"
-RECIPE_LATEST_RELEASE_DATE_pn-quota = "Feb 17, 2010"
+RECIPE_LATEST_RELEASE_DATE_pn-quota = "Aug 17, 2011"
 RECIPE_COMMENTS_pn-quota = ""
 RECIPE_LAST_UPDATE_pn-quota = "Nov 15, 2010"
-RECIPE_MANUAL_CHECK_DATE_pn-quota = "Nov 22, 2011"
+RECIPE_MANUAL_CHECK_DATE_pn-quota = "Dec 24, 2011"
 RECIPE_MAINTAINER_pn-quota = "Dongxiao Xu <dongxiao.xu@intel.com>"
 
 RECIPE_STATUS_pn-mdadm = "green"
@@ -1056,8 +1056,9 @@ RECIPE_LATEST_VERSION_pn-iptables = "1.4.12.1"
 
 RECIPE_STATUS_pn-ethtool = "green"
 RECIPE_LATEST_VERSION_pn-ethtool = "2.6.36"
+RECIPE_LATEST_RELEASE_DATE_pn-ethtool = "Nov 17, 2010"
 RECIPE_LAST_UPDATE_pn-ethtool = "Nov 28, 2010"
-RECIPE_MANUAL_CHECK_DATE_pn-ethtool = "Nov 22, 2011"
+RECIPE_MANUAL_CHECK_DATE_pn-ethtool = "Dec 24, 2011"
 RECIPE_MAINTAINER_pn-ethtool = "Zhai Edwin <edwin.zhai@intel.com>"
 
 RECIPE_STATUS_pn-net-tools = "green"
@@ -1144,12 +1145,12 @@ RECIPE_STATUS_pn-watchdog = "green"
 RECIPE_LAST_UPDATE_pn-watchdog = "Aug 20, 2010"
 RECIPE_MAINTAINER_pn-watchdog = "Dexuan Cui <dexuan.cui@intel.com>"
 RECIPE_DEPENDENCY_CHECK_pn-watchdog = "not done"
-RECIPE_LATEST_VERSION_pn-watchdog = "5.9"
+RECIPE_LATEST_VERSION_pn-watchdog = "5.10"
 RECIPE_NO_OF_PATCHES_pn-watchdog = "0"
 RECIPE_INTEL_SECTION_pn-watchdog = "base utils"
 RECIPE_TIME_BETWEEN_LAST_TWO_RELEASES_pn-watchdog = "3 months"
-RECIPE_LATEST_RELEASE_DATE_pn-watchdog = "Jun 01, 2010"
-RECIPE_MANUAL_CHECK_DATE_pn-watchdog = "Nov 17, 2011"
+RECIPE_LATEST_RELEASE_DATE_pn-watchdog = "Dec 15, 2011"
+RECIPE_MANUAL_CHECK_DATE_pn-watchdog = "Dec 24, 2011"
 RECIPE_COMMENTS_pn-watchdog = ""
 DISTRO_PN_ALIAS_pn-watchdog = "Debian=watchdog Ubuntu=watchdog Mandriva=watchdog"
 
@@ -1267,8 +1268,9 @@ RECIPE_MAINTAINER_pn-libgsf = "Dexuan Cui <dexuan.cui@intel.com>"
 
 RECIPE_STATUS_pn-beecrypt = "green"
 RECIPE_LATEST_VERSION_pn-beecrypt = "4.2.1"
+RECIPE_LATEST_RELEASE_DATE_pn-beecrypt = "Jul 12, 2009"
 RECIPE_LAST_UPDATE_pn-beecrypt = "Nov 26, 2010"
-RECIPE_MANUAL_CHECK_DATE_pn-beecrypt = "Nov 22, 2011"
+RECIPE_MANUAL_CHECK_DATE_pn-beecrypt = "Dec 24, 2011"
 RECIPE_MAINTAINER_pn-beecrypt = "Zhai Edwin <edwin.zhai@intel.com>"
 
 RECIPE_STATUS_pn-libacpi = "red"
@@ -1279,8 +1281,9 @@ DISTRO_PN_ALIAS_pn-libacpi="Ubuntu=libacpi Mandriva=libacpi"
 
 RECIPE_STATUS_pn-acpid = "green"
 RECIPE_LATEST_VERSION_pn-acpid = "1.0.10"
+RECIPE_LATEST_RELEASE_DATE_pn-acpid = "Apr 22, 2009"
 RECIPE_LAST_UPDATE_pn-acpid = "Nov 26, 2010"
-RECIPE_MANUAL_CHECK_DATE_pn-acpid = "Nov 22, 2011"
+RECIPE_MANUAL_CHECK_DATE_pn-acpid = "Dec 24, 2011"
 RECIPE_MAINTAINER_pn-acpid = "Zhai Edwin <edwin.zhai@intel.com>"
 
 RECIPE_STATUS_pn-consolekit = "green"
@@ -1367,7 +1370,7 @@ RECIPE_TIME_BETWEEN_LAST_TWO_RELEASES_pn-rpcbind = "6 months"
 RECIPE_LATEST_RELEASE_DATE_pn-rpcbind = "May 01, 2009"
 RECIPE_COMMENTS_pn-rpcbind = ""
 RECIPE_LAST_UPDATE_pn-rpcbind = "Sep 1, 2010"
-RECIPE_MANUAL_CHECK_DATE_pn-rpcbind = "Nov 22, 2011"
+RECIPE_MANUAL_CHECK_DATE_pn-rpcbind = "Dec 24, 2011"
 RECIPE_MAINTAINER_pn-rpcbind = "Dongxiao Xu <dongxiao.xu@intel.com>"
 
 RECIPE_STATUS_pn-time = "green"
@@ -1709,9 +1712,9 @@ RECIPE_MAINTAINER_pn-strace = "Dongxiao Xu <dongxiao.xu@intel.com>"
 RECIPE_DEPENDENCY_CHECK_pn-strace = "not done"
 RECIPE_LATEST_VERSION_pn-strace = "4.6"
 RECIPE_INTEL_SECTION_pn-strace = "base utils"
-RECIPE_TIME_BETWEEN_LAST_TWO_RELEASES_pn-strace = "6 months"
-RECIPE_LATEST_RELEASE_DATE_pn-strace = "Apr 01, 2010"
-RECIPE_MANUAL_CHECK_DATE_pn-strace = "Nov 22, 2011"
+RECIPE_TIME_BETWEEN_LAST_TWO_RELEASES_pn-strace = "11 months"
+RECIPE_LATEST_RELEASE_DATE_pn-strace = "Mar 15, 2011"
+RECIPE_MANUAL_CHECK_DATE_pn-strace = "Dec 24, 2011"
 RECIPE_COMMENTS_pn-strace = "3-clause BSD"
 
 RECIPE_STATUS_pn-dhcp = "green"
@@ -1745,14 +1748,14 @@ RECIPE_LATEST_RELEASE_DATE_pn-udev = "Jun 01, 2010"
 RECIPE_COMMENTS_pn-udev = "may need different versions for different kernels"
 
 RECIPE_STATUS_pn-tzdata = "green"
-RECIPE_LATEST_VERSION_pn-tzdata = "2011l"
-RECIPE_LATEST_RELEASE_DATE_pn-tzdata = "Oct 10, 2011"
+RECIPE_LATEST_VERSION_pn-tzdata = "2011n"
+RECIPE_LATEST_RELEASE_DATE_pn-tzdata = "Dec 15, 2011"
 RECIPE_LAST_UPDATE_pn-tzdata = "Oct 18, 2011"
 RECIPE_MAINTAINER_pn-tzdata = "Zhai Edwin <edwin.zhai@intel.com>"
 RECIPE_DEPENDENCY_CHECK_pn-tzdata = "not done"
 RECIPE_INTEL_SECTION_pn-tzdata = "base utils"
 RECIPE_TIME_BETWEEN_LAST_TWO_RELEASES_pn-tzdata = "1 month"
-RECIPE_MANUAL_CHECK_DATE_pn-tzdata = "Nov 22, 2011"
+RECIPE_MANUAL_CHECK_DATE_pn-tzdata = "Dec 24, 2011"
 RECIPE_COMMENTS_pn-tzdata = ""
 DISTRO_PN_ALIAS_pn-tzcode = "OSPDT"
 
@@ -1762,11 +1765,12 @@ RECIPE_LAST_UPDATE_pn-tinylogin = "Jul 21, 2006"
 RECIPE_MAINTAINER_pn-tinylogin = "Zhai Edwin <edwin.zhai@intel.com>"
 RECIPE_DEPENDENCY_CHECK_pn-tinylogin = "not done"
 RECIPE_LATEST_VERSION_pn-tinylogin = "1.4"
+RECIPE_LATEST_RELEASE_DATE_pn-tinylogin = "Jan 03, 2003"
 RECIPE_INTEL_SECTION_pn-tinylogin = "base utils"
 RECIPE_TIME_BETWEEN_LAST_TWO_RELEASES_pn-tinylogin = "n/a"
 RECIPE_LATEST_RELEASE_DATE_pn-tinylogin = "n/a"
 RECIPE_COMMENTS_pn-tinylogin = "merged into busybox"
-RECIPE_MANUAL_CHECK_DATE_pn-tinylogin = "Nov 22, 2011"
+RECIPE_MANUAL_CHECK_DATE_pn-tinylogin = "Dec 24, 2011"
 DISTRO_PN_ALIAS_pn-tinylogin = "Debian=busybox Ubuntu=busybox Mandriva=busybox"
 
 RECIPE_STATUS_pn-rpm = "red"   # need upgrade
@@ -1968,14 +1972,15 @@ RECIPE_MAINTAINER_pn-libexif = "Saul Wold <sgw@linux.intel.com>"
 
 RECIPE_STATUS_pn-setserial = "red"
 RECIPE_LATEST_VERSION_pn-setserial = "2.17"
+RECIPE_LATEST_RELEASE_DATE_pn-setserial = "Feb 09, 2000"
 RECIPE_LAST_UPDATE_pn-setserial = "Jul 21, 2006"
-RECIPE_MANUAL_CHECK_DATE_pn-setserial = "Nov 22, 2011"
+RECIPE_MANUAL_CHECK_DATE_pn-setserial = "Dec 24, 2011"
 RECIPE_MAINTAINER_pn-setserial = "Zhai Edwin <edwin.zhai@intel.com>"
 
 RECIPE_STATUS_pn-hdparm = "red"
 RECIPE_LATEST_VERSION_pn-hdparm = "9.37"
 RECIPE_LAST_UPDATE_pn-hdparm = "Jan 24, 2011"
-RECIPE_MANUAL_CHECK_DATE_pn-hdparm = "Nov 17, 2011"
+RECIPE_MANUAL_CHECK_DATE_pn-hdparm = "Dec 24, 2011"
 RECIPE_MAINTAINER_pn-hdparm = "Dexuan Cui <dexuan.cui@intel.com>"
 
 RECIPE_STATUS_pn-wbxml2 = "red"
@@ -2101,7 +2106,7 @@ RECIPE_NO_OF_PATCHES_pn-wireless-tools="3"
 RECIPE_LATEST_RELEASE_DATE_pn-wireless-tools="Sep 18, 2007"
 RECIPE_TIME_BETWEEN_LAST_TWO_RELEASES_pn-wireless-tools="18 months"
 RECIPE_LAST_UPDATE_pn-wireless-tools = "Oct 19, 2007"
-RECIPE_MANUAL_CHECK_DATE_pn-wireless-tools = "Nov 22, 2011"
+RECIPE_MANUAL_CHECK_DATE_pn-wireless-tools = "Dec 24, 2011"
 RECIPE_MAINTAINER_pn-wireless-tools = "Dongxiao Xu <dongxiao.xu@intel.com>"
 
 RECIPE_STATUS_pn-bluez-dtl1-workaround="yellow" # LICENSE double check
@@ -2118,17 +2123,18 @@ RECIPE_NO_OF_PATCHES_pn-irda-utils="0"
 RECIPE_LATEST_RELEASE_DATE_pn-irda-utils="Jul 10, 2006"
 RECIPE_TIME_BETWEEN_LAST_TWO_RELEASES_pn-irda-utils="4 months"
 RECIPE_LAST_UPDATE_pn-irda-utils = "Jun 25, 2010"
-RECIPE_MANUAL_CHECK_DATE_pn-irda-utils = "Nov 22, 2011"
+RECIPE_MANUAL_CHECK_DATE_pn-irda-utils = "Dec 24, 2011"
 RECIPE_MAINTAINER_pn-irda-utils = "Dongxiao Xu <dongxiao.xu@intel.com>"
 
 RECIPE_STATUS_pn-bluez4="green"
 DISTRO_PN_ALIAS_pn-bluez4="Meego=bluz Fedora=bluz Ubuntu=bluz OpenSuSE=bluz Mandriva=bluz"
-RECIPE_LATEST_VERSION_pn-bluez4="4.82"
+RECIPE_LATEST_VERSION_pn-bluez4="4.97"
 RECIPE_NO_OF_PATCHES_pn-bluez4="2"
-RECIPE_LATEST_RELEASE_DATE_pn-bluez4="Dec 18, 2010"
+RECIPE_LATEST_RELEASE_DATE_pn-bluez4="Dec 23, 2011"
 RECIPE_TIME_BETWEEN_LAST_TWO_RELEASES_pn-bluez4="20 days"
 DISTRO_PN_ALIAS_pn-bluez4= "Fedora=bluez Ubuntu=bluez Debian=bluez-utils Opensuse=bluez"
 RECIPE_LAST_UPDATE_pn-bluez4 = "Dec 30, 2010"
+RECIPE_MANUAL_CHECK_DATE_pn-bluez4 = "Dec 24, 2011"
 RECIPE_MAINTAINER_pn-bluez4 = "Dongxiao Xu <dongxiao.xu@intel.com>"
 
 RECIPE_STATUS_pn-libpcap="green"
@@ -2175,11 +2181,13 @@ RECIPE_LAST_UPDATE_pn-connman = "Dec 30, 2010"
 RECIPE_MAINTAINER_pn-connman = "Dongxiao Xu <dongxiao.xu@intel.com>"
 
 RECIPE_STATUS_pn-connman-gnome = "green"
-RECIPE_LATEST_VERSION_pn-connman-gnome = "0.5"
+RECIPE_LATEST_VERSION_pn-connman-gnome = "0.78"
+RECIPE_LATEST_RELEASE_DATE_pn-connman-gnome = "Dec 20, 2011"
 RECIPE_NO_OF_PATCHES_pn-connman-gnome="3"
 RECIPE_LATEST_RELEASE_DATE_pn-connman-gnome="n/a"
 RECIPE_TIME_BETWEEN_LAST_TWO_RELEASES_pn-connman-gnome="n/a"
 RECIPE_LAST_UPDATE_pn-connman-gnome = "Dec 30, 2010"
+RECIPE_MANUAL_CHECK_DATE_pn-connman-gnome = "Dec 24, 2011"
 RECIPE_MAINTAINER_pn-connman-gnome = "Dongxiao Xu <dongxiao.xu@intel.com>"
 DISTRO_PN_ALIAS_pn-connman-gnome = "Intel"
 
@@ -2288,11 +2296,12 @@ RECIPE_LAST_UPDATE_pn-telepathy-python = "Dec 30, 2010"
 RECIPE_MAINTAINER_pn-telepathy-python = "Dongxiao Xu <dongxiao.xu@intel.com>"
 
 RECIPE_STATUS_pn-bluez-hcidump = "green"
-RECIPE_LATEST_VERSION_pn-bluez-hcidump = "2.0"
+RECIPE_LATEST_VERSION_pn-bluez-hcidump = "2.2"
 RECIPE_NO_OF_PATCHES_pn-bluez-hcidump = "0"
-RECIPE_LATEST_RELEASE_DATE_pn-bluez-hcidump = "Jan 27, 2011"
+RECIPE_LATEST_RELEASE_DATE_pn-bluez-hcidump = "Dec 23, 2011"
 RECIPE_TIME_BETWEEN_LAST_TWO_RELEASES_pn-bluez-hcidump = "4 months"
 RECIPE_LAST_UPDATE_pn-bluez-hcidump = "Apr 26, 2011"
+RECIPE_MANUAL_CHECK_DATE_pn-bluez-hcidump = "Dec 24, 2011"
 RECIPE_MAINTAINER_pn-bluez-hcidump = "Dongxiao Xu <dongxiao.xu@intel.com>"
 
 RECIPE_STATUS_pn-ppp-dialin = "red"
@@ -2379,12 +2388,12 @@ RECIPE_LAST_UPDATE_pn-orinoco-conf = "Jul 21, 2006"
 RECIPE_MAINTAINER_pn-orinoco-conf = "Dongxiao Xu <dongxiao.xu@intel.com>"
 
 RECIPE_STATUS_pn-libical="green"
-RECIPE_LATEST_VERSION_pn-libical = "0.47"
+RECIPE_LATEST_VERSION_pn-libical = "0.48"
 RECIPE_NO_OF_PATCHES_pn-libical = "0"
-RECIPE_LATEST_RELEASE_DATE_pn-libical = "Oct 12, 2011"
-RECIPE_TIME_BETWEEN_LAST_TWO_RELEASES_pn-libical = "11 months"
+RECIPE_LATEST_RELEASE_DATE_pn-libical = "Dec 13, 2011"
+RECIPE_TIME_BETWEEN_LAST_TWO_RELEASES_pn-libical = "2 months"
 RECIPE_LAST_UPDATE_pn-libical = "Nov 16, 2010"
-RECIPE_MANUAL_CHECK_DATE_pn-libical = "Nov 22, 2011"
+RECIPE_MANUAL_CHECK_DATE_pn-libical = "Dec 24, 2011"
 RECIPE_MAINTAINER_pn-libical = "Dongxiao Xu <dongxiao.xu@intel.com>"
 
 RECIPE_STATUS_pn-task-base="green"
@@ -2592,7 +2601,7 @@ RECIPE_NO_OF_PATCHES_pn-flac="3"
 RECIPE_LATEST_RELEASE_DATE_pn-flac="Sep 16, 2007"
 RECIPE_TIME_BETWEEN_LAST_TWO_RELEASES_pn-flac="2 months"
 RECIPE_LAST_UPDATE_pn-flac = "Jun 26, 2010"
-RECIPE_MANUAL_CHECK_DATE_pn-flac = "Nov 22, 2011"
+RECIPE_MANUAL_CHECK_DATE_pn-flac = "Dec 24, 2011"
 RECIPE_MAINTAINER_pn-flac = "Dongxiao Xu <dongxiao.xu@intel.com>"
 
 RECIPE_STATUS_pn-libvorbis="green"
@@ -2787,42 +2796,45 @@ DISTRO_PN_ALIAS_pn-gst-fluendo-mpegdemux = "Ubuntu=gstreamer0.10-fluendo-mpegdem
 
 RECIPE_STATUS_pn-libomxil = "red"
 RECIPE_LATEST_VERSION_pn-libomxil = "0.9.3"
+RECIPE_LATEST_RELEASE_DATE_pn-libomxil = "May 20, 2011"
 RECIPE_LAST_UPDATE_pn-libomxil = "Jan 11, 2008"
 RECIPE_MAINTAINER_pn-libomxil = "Dongxiao Xu <dongxiao.xu@intel.com>"
-RECIPE_MANUAL_CHECK_DATE_pn-libomxil = "Nov 22, 2011"
+RECIPE_MANUAL_CHECK_DATE_pn-libomxil = "Dec 24, 2011"
 DISTRO_PN_ALIAS_pn-libomxil = "OSPDT upstream=http://omxil.sourceforge.net/"
 
 RECIPE_STATUS_pn-libsamplerate0 = "green"
 DISTRO_PN_ALIAS_pn-libsamplerate0 = "Meego=libsamplerate Fedora=libsamplerate OpenSuSE=libsamplerate Ubuntu=libsamplerate Mandriva=libsamplerate Debian=libsamplerate"
 RECIPE_LATEST_VERSION_pn-libsamplerate0 = "0.1.8"
+RECIPE_LATEST_RELEASE_DATE_pn-libsamplerate0 = "Aug 15, 2011"
 RECIPE_LAST_UPDATE_pn-libsamplerate0 = "Apr 26, 2011"
-RECIPE_MANUAL_CHECK_DATE_pn-libsamplerate0 = "Nov 22, 2011"
+RECIPE_MANUAL_CHECK_DATE_pn-libsamplerate0 = "Dec 24, 2011"
 RECIPE_MAINTAINER_pn-libsamplerate0 = "Dongxiao Xu <dongxiao.xu@intel.com>"
 
 RECIPE_STATUS_pn-oprofileui = "green"
 DISTRO_PN_ALIAS_pn-oprofileui = "Fedora=oprofileui Ubuntu=oprofile-gui Debian=oprofile-gui"
 RECIPE_DEPENDENCY_CHECK_pn-oprofileui = "not done"
-RECIPE_LATEST_VERSION_pn-oprofileui = "0.0+git0+0c3c32fa754c1d0b70e65767ea7048914f776396"
+RECIPE_LATEST_VERSION_pn-oprofileui = "0.0+git0+82ecf8c6b53b84f80682a8312f9defa83a95f2a3"
 RECIPE_NO_OF_PATCHES_pn-oprofileui = "1"
 RECIPE_PATCH_pn-oprofileui+dso_linking_change_build_fix = "fix the build by explicitely passing -lm to linker"
 RECIPE_INTEL_SECTION_pn-oprofileui = "sdk-tools"
 RECIPE_TIME_BETWEEN_LAST_TWO_RELEASES_pn-oprofileui = "20 days"
-RECIPE_LATEST_RELEASE_DATE_pn-oprofileui = "Apr 4, 2011"
+RECIPE_LATEST_RELEASE_DATE_pn-oprofileui = "Nov 14, 2011"
 RECIPE_COMMENTS_pn-oprofileui = ""
 RECIPE_LAST_UPDATE_pn-oprofileui = "Apr 11, 2011"
+RECIPE_MANUAL_CHECK_DATE_pn-oprofileui = "Dec 24, 2011"
 RECIPE_MAINTAINER_pn-oprofileui = "Dexuan Cui <dexuan.cui@intel.com>"
 
 RECIPE_STATUS_pn-oprofile = "green"
 RECIPE_DEPENDENCY_CHECK_pn-oprofile = "not done"
-RECIPE_LATEST_VERSION_pn-oprofile = "0.9.6"
+RECIPE_LATEST_VERSION_pn-oprofile = "0.9.7"
 RECIPE_NO_OF_PATCHES_pn-oprofile = "1"
 RECIPE_PATCH_pn-oprofile+opstart = "The opstart/opstop programs"
 RECIPE_INTEL_SECTION_pn-oprofile = "sdk-tools"
 RECIPE_TIME_BETWEEN_LAST_TWO_RELEASES_pn-oprofile = "4 months"
-RECIPE_LATEST_RELEASE_DATE_pn-oprofile = "Nov 24, 2009"
+RECIPE_LATEST_RELEASE_DATE_pn-oprofile = "Aug 12, 2011"
 RECIPE_COMMENTS_pn-oprofile = ""
 RECIPE_LAST_UPDATE_pn-oprofile = "Jun 22, 2010"
-RECIPE_MANUAL_CHECK_DATE_pn-oprofile = "Nov 17, 2011"
+RECIPE_MANUAL_CHECK_DATE_pn-oprofile = "Dec 24, 2011"
 RECIPE_MAINTAINER_pn-oprofile = "Dexuan Cui <dexuan.cui@intel.com>"
 
 RECIPE_STATUS_pn-powertop = "green"
@@ -3239,10 +3251,10 @@ RECIPE_LATEST_VERSION_pn-pcmanfm = "0.9.10"
 RECIPE_NO_OF_PATCHES_pn-pcmanfm = "4"
 RECIPE_INTEL_SECTION_pn-pcmanfm = "graphic apps"
 RECIPE_TIME_BETWEEN_LAST_TWO_RELEASES_pn-pcmanfm = "3 months"
-RECIPE_LATEST_RELEASE_DATE_pn-pcmanfm = "Oct 24, 2010"
+RECIPE_LATEST_RELEASE_DATE_pn-pcmanfm = "Oct 24, 2011"
 RECIPE_COMMENTS_pn-pcmanfm = ""
 RECIPE_LAST_UPDATE_pn-pcmanfm = "Nov 19, 2010"
-RECIPE_MANUAL_CHECK_DATE_pn-pcmanfm = "Nov 22, 2011"
+RECIPE_MANUAL_CHECK_DATE_pn-pcmanfm = "Dec 24, 2011"
 RECIPE_MAINTAINER_pn-pcmanfm = "Zhai Edwin <edwin.zhai@intel.com>"
 
 RECIPE_STATUS_pn-oh-puzzles = "green" # no update needed
@@ -3262,8 +3274,8 @@ RECIPE_MAINTAINER_pn-gnome-terminal = "Zhai Edwin <edwin.zhai@intel.com>"
 
 RECIPE_STATUS_pn-puzzles = "red"
 DISTRO_PN_ALIAS_pn-puzzles = "Debian=sgt-puzzles"
-RECIPE_LATEST_VERSION_pn-puzzles = "r9306"
-RECIPE_MANUAL_CHECK_DATE_pn-puzzles = "Nov 22, 2011"
+RECIPE_LATEST_VERSION_pn-puzzles = "r9372"
+RECIPE_MANUAL_CHECK_DATE_pn-puzzles = "Dec 24, 2011"
 RECIPE_LAST_UPDATE_pn-puzzles = "May 31, 2011"
 RECIPE_MAINTAINER_pn-puzzles = "Zhai Edwin <edwin.zhai@intel.com>"
 DISTRO_PN_ALIAS_pn-puzzles = "Debian=sgt-puzzles Fedora=puzzles"
@@ -3340,7 +3352,8 @@ RECIPE_MAINTAINER_pn-claws-mail = "Zhai Edwin <edwin.zhai@intel.com>"
 
 RECIPE_STATUS_pn-x11vnc = "green"
 RECIPE_LATEST_VERSION_pn-x11vnc = "0.9.13"
-RECIPE_MANUAL_CHECK_DATE_pn-x11vnc = "Nov 22, 2011"
+RECIPE_LATEST_RELEASE_DATE_pn-x11vnc = "Sep 13, 2011"
+RECIPE_MANUAL_CHECK_DATE_pn-x11vnc = "Dec 24, 2011"
 RECIPE_LAST_UPDATE_pn-x11vnc = "Nov 30, 2010"
 RECIPE_MAINTAINER_pn-x11vnc = "Zhai Edwin <edwin.zhai@intel.com>"
 DISTRO_PN_ALIAS_pn-x11vnc = "Fedora=x11vnc Ubuntu=x11vnc"
@@ -4630,10 +4643,10 @@ RECIPE_NO_OF_PATCHES_pn-freetype = "1"
 RECIPE_PATCH_pn-freetype+no-hardcode = "fix freetype-config.in"
 RECIPE_INTEL_SECTION_pn-freetype = "libs"
 RECIPE_TIME_BETWEEN_LAST_TWO_RELEASES_pn-freetype = "1+ months"
-RECIPE_LATEST_RELEASE_DATE_pn-freetype = "Jul 29, 2011"
+RECIPE_LATEST_RELEASE_DATE_pn-freetype = "Nov 15, 2011"
 RECIPE_COMMENTS_pn-freetype = ""
 RECIPE_LAST_UPDATE_pn-freetype = "Aug 16, 2011"
-RECIPE_MANUAL_CHECK_DATE_pn-freetype = "Nov 17, 2011"
+RECIPE_MANUAL_CHECK_DATE_pn-freetype = "Dec 24, 2011"
 RECIPE_MAINTAINER_pn-freetype = "Dexuan Cui <dexuan.cui@intel.com>"
 
 RECIPE_STATUS_pn-librsvg = "green"
@@ -5272,7 +5285,7 @@ RECIPE_MAINTAINER_pn-hicolor-icon-theme = "Zhai Edwin <edwin.zhai@intel.com>"
 RECIPE_STATUS_pn-jpeg = "green"
 RECIPE_DEPENDENCY_CHECK_pn-jpeg = "not done"
 RECIPE_LATEST_VERSION_pn-jpeg = "8c"
-RECIPE_MANUAL_CHECK_DATE_pn-jpeg = "Nov 22, 2011"
+RECIPE_MANUAL_CHECK_DATE_pn-jpeg = "Dec 24, 2011"
 RECIPE_NO_OF_PATCHES_pn-jpeg = "0"
 RECIPE_INTEL_SECTION_pn-jpeg = "graphic UX"
 RECIPE_TIME_BETWEEN_LAST_TWO_RELEASES_pn-jpeg = "12 months"
@@ -5423,7 +5436,7 @@ RECIPE_MAINTAINER_pn-web-webkit = "Zhai Edwin <edwin.zhai@intel.com>"
 RECIPE_STATUS_pn-libfm = "green"
 RECIPE_DEPENDENCY_CHECK_pn-libfm = "not done"
 RECIPE_LATEST_VERSION_pn-libfm = "0.1.17"
-RECIPE_MANUAL_CHECK_DATE_pn-libfm = "Nov 22, 2011"
+RECIPE_MANUAL_CHECK_DATE_pn-libfm = "Dec 24, 2011"
 RECIPE_NO_OF_PATCHES_pn-libfm = "0"
 RECIPE_INTEL_SECTION_pn-libfm = "graphic UX"
 RECIPE_TIME_BETWEEN_LAST_TWO_RELEASES_pn-libfm = "3 months"
@@ -5435,7 +5448,7 @@ RECIPE_MAINTAINER_pn-libfm = "Zhai Edwin <edwin.zhai@intel.com>"
 RECIPE_STATUS_pn-menu-cache = "green"
 RECIPE_DEPENDENCY_CHECK_pn-menu-cache = "not done"
 RECIPE_LATEST_VERSION_pn-menu-cache = "0.3.2"
-RECIPE_MANUAL_CHECK_DATE_pn-menu-cache = "Nov 22, 2011"
+RECIPE_MANUAL_CHECK_DATE_pn-menu-cache = "Dec 24, 2011"
 RECIPE_NO_OF_PATCHES_pn-menu-cache = "0"
 RECIPE_INTEL_SECTION_pn-menu-cache = "graphic UX"
 RECIPE_TIME_BETWEEN_LAST_TWO_RELEASES_pn-menu-cache = "1 month"
-- 
1.7.6.4



