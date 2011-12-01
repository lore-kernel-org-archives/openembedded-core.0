Received: from mga03.intel.com ([143.182.124.21])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <sgw@linux.intel.com>) id 1RWGV0-0007bT-SO
	for openembedded-core@openembedded.org; Fri, 02 Dec 2011 00:57:07 +0100
Received: from azsmga001.ch.intel.com ([10.2.17.19])
	by azsmga101.ch.intel.com with ESMTP; 01 Dec 2011 15:50:21 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="4.71,281,1320652800"; d="scan'208";a="81299165"
Received: from unknown (HELO swold-mobl.bigsur.com) ([10.255.15.251])
	by azsmga001.ch.intel.com with ESMTP; 01 Dec 2011 15:50:21 -0800
From: Saul Wold <sgw@linux.intel.com>
To: openembedded-core@openembedded.org
Date: Thu,  1 Dec 2011 15:50:18 -0800
Message-Id: <c54ce311b77e1fd233ec1ffb980b431df92825be.1322783370.git.sgw@linux.intel.com>
X-Mailer: git-send-email 1.7.6.4
In-Reply-To: <cover.1322783370.git.sgw@linux.intel.com>
References: <cover.1322783370.git.sgw@linux.intel.com>
In-Reply-To: <cover.1322783370.git.sgw@linux.intel.com>
References: <cover.1322783370.git.sgw@linux.intel.com>
Subject: [PATCH 6/6] distro tracking updates
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
X-List-Received-Date: Thu, 01 Dec 2011 23:57:07 -0000

Signed-off-by: Saul Wold <sgw@linux.intel.com>
---
 .../conf/distro/include/distro_tracking_fields.inc |  100 ++++++++++---------
 1 files changed, 53 insertions(+), 47 deletions(-)

diff --git a/meta/conf/distro/include/distro_tracking_fields.inc b/meta/conf/distro/include/distro_tracking_fields.inc
index 073521f..d6f5217 100644
--- a/meta/conf/distro/include/distro_tracking_fields.inc
+++ b/meta/conf/distro/include/distro_tracking_fields.inc
@@ -109,7 +109,7 @@ RECIPE_MAINTAINER_pn-run-postinsts = "Dongxiao Xu <dongxiao.xu@intel.com"
 
 RECIPE_STATUS_pn-subversion = "green"
 RECIPE_LATEST_VERSION_pn-subversion = "1.6.15"
-RECIPE_MANUAL_CHECK_DATE_pn-subversion = "Jan 25, 2011" 
+RECIPE_MANUAL_CHECK_DATE_pn-subversion = "Jan 25, 2011"
 RECIPE_MAINTAINER_pn-subversion = "Nitin A Kamble <nitin.a.kamble@intel.com>"
 
 RECIPE_STATUS_pn-trace-cmd = "green"
@@ -475,7 +475,6 @@ RECIPE_LATEST_VERSION_pn-openssl = "1.0.0e"
 RECIPE_LATEST_RELEASE_DATE_pn-openssl = "Sep 06, 2010"
 RECIPE_LAST_UPDATE_pn-openssl = "Nov 28, 2011"
 RECIPE_MAINTAINER_pn-openssl = "Saul Wold <sgw@linux.intel.com>"
-RECIPE_NO_UPDATE_REASON_pn-openssl = "compatibility and stability concerns on new major release"
 RECIPE_INTEL_SECTION_pn-openssl = "base libs"
 
 RECIPE_STATUS_pn-libnss-mdns = "green"
@@ -502,15 +501,15 @@ RECIPE_INTEL_SECTION_pn-popt = "base libs"
 RECIPE_LATEST_RELEASE_DATE_pn-popt = "May 01, 2010"
 
 RECIPE_STATUS_pn-sqlite3 = "green"   # need upgrade
-RECIPE_LAST_UPDATE_pn-sqlite3 = "Nov 24, 2010"
+RECIPE_LATEST_VERSION_pn-sqlite3 = "3.7.9"
+RECIPE_LATEST_RELEASE_DATE_pn-sqlite3 = "Nov 01, 2011"
+RECIPE_LAST_UPDATE_pn-sqlite3 = "Dec 01, 2011"
+RECIPE_MANUAL_CHECK_DATE_pn-sqlite3= "Dec 01, 2011"
 RECIPE_MAINTAINER_pn-sqlite3 = "Saul Wold <sgw@linux.intel.com>"
 RECIPE_DEPENDENCY_CHECK_pn-sqlite3 = "not done"
-RECIPE_LATEST_VERSION_pn-sqlite3 = "3.7.7.1"
 RECIPE_INTEL_SECTION_pn-sqlite3 = "base libs"
 RECIPE_TIME_BETWEEN_LAST_TWO_RELEASES_pn-sqlite3 = "1 month"
-RECIPE_LATEST_RELEASE_DATE_pn-sqlite3 = "Oct 01, 2010"
 RECIPE_COMMENTS_pn-sqlite3 = ""
-RECIPE_MANUAL_CHECK_DATE_pn-sqlite3= "Jul 01, 2011"
 
 RECIPE_STATUS_pn-libpthread-stubs = "green"
 RECIPE_LAST_UPDATE_pn-libpthread-stubs = "Jul 6, 2010"
@@ -590,7 +589,7 @@ RECIPE_DEPENDENCY_CHECK_pn-libcheck = "done"
 RECIPE_LATEST_VERSION_pn-libcheck = "0.9.8"
 RECIPE_LATEST_RELEASE_DATE_pn-libcheck = "Sep 23, 2009"
 RECIPE_LAST_UPDATE_pn-libcheck = "Aug 20, 2010"
-RECIPE_MANUAL_CHECK_DATE_pn-libcheck = "Nov 8, 2011"
+RECIPE_MANUAL_CHECK_DATE_pn-libcheck = "Dec 01, 2011"
 RECIPE_MAINTAINER_pn-libcheck = "Saul Wold <sgw@linux.intel.com>"
 RECIPE_INTEL_SECTION_pn-libcheck = "base libs"
 RECIPE_TIME_BETWEEN_LAST_TWO_RELEASES_pn-libcheck = "9 months"
@@ -611,6 +610,7 @@ DISTRO_PN_ALIAS_pn-augeas = "Ubuntu=libaugeas0 Debian=libaugeas0"
 RECIPE_STATUS_pn-sat-solver = "green"
 RECIPE_DEPENDENCY_CHECK_pn-sat-solver = "done"
 RECIPE_LATEST_VERSION_pn-sat-solver = "git"
+RECIPE_MANUAL_CHECK_DATE_pn-sat-solver = "Dec 01, 2011"
 RECIPE_INTEL_SECTION_pn-sat-solver = "base libs"
 DISTRO_PN_ALIAS_pn-sat-solver = "OSPDT OpenSuSE=satsolver-tools"
 RECIPE_COMMENTS_pn-sat-solver = ""
@@ -1288,7 +1288,7 @@ RECIPE_LATEST_VERSION_pn-console-tools = "0.3.2"
 RECIPE_LAST_UPDATE_pn-console-tools = "Jul 21, 2006"
 RECIPE_MAINTAINER_pn-console-tools = "Saul Wold <sgw@linux.intel.com>"
 DISTRO_PN_ALIAS_pn-console-tools = "Debian=console-tools Ubuntu=console-tools"
-RECIPE_MANUAL_CHECK_DATE_pn-console-tools= "Jul 01, 2011"
+RECIPE_MANUAL_CHECK_DATE_pn-console-tools= "Dec 01, 2011"
 
 RECIPE_STATUS_pn-fuse = "red"
 RECIPE_LATEST_VERSION_pn-fuse = "2.8.4"
@@ -1327,15 +1327,17 @@ RECIPE_LAST_UPDATE_pn-pm-utils = "Nov 18, 2010"
 RECIPE_MAINTAINER_pn-pm-utils = "Dongxiao Xu <dongxiao.xu@intel.com>"
 
 RECIPE_STATUS_pn-psmisc = "red"
-RECIPE_LATEST_VERSION_pn-psmisc = "22.13"
-RECIPE_LAST_UPDATE_pn-psmisc = "Jan 18, 2008"
+RECIPE_LATEST_VERSION_pn-psmisc = "22.14"
+RECIPE_LATEST_RELEASE_DATE_pn-psmisc = "Jun 20, 2011"
+RECIPE_LAST_UPDATE_pn-psmisc = "Dec 01, 2011"
+RECIPE_MANUAL_CHECK_DATE_pn-psmisc = "Dec 01, 2011"
 RECIPE_MAINTAINER_pn-psmisc = "Saul Wold <sgw@linux.intel.com>"
 
 RECIPE_STATUS_pn-boost = "yellow"
 RECIPE_LATEST_VERSION_pn-boost = "1.47.0"
 RECIPE_LATEST_RELEASE_DATE_pn-boost = "Jul 12, 2011"
 RECIPE_LAST_UPDATE_pn-boost = "Aug 19, 2010"
-RECIPE_MANUAL_CHECK_DATE_pn-boost = "Nov 08, 2011"
+RECIPE_MANUAL_CHECK_DATE_pn-boost = "Dec 01, 2011"
 RECIPE_MAINTAINER_pn-boost = "Saul Wold <sgw@linux.intel.com>"
 
 RECIPE_STATUS_pn-boost-jam-native = "green"
@@ -1455,7 +1457,7 @@ RECIPE_COMMENTS_pn-bash = ""
 
 RECIPE_STATUS_pn-syslinux = "yellow"    # need mangling on LDFLAGS
 RECIPE_LAST_UPDATE_pn-syslinux = "Nov 16, 2010"
-RECIPE_MAINTAINER_pn-syslinux = "Saul Wold <sgw@linux.intel.com>"
+RECIPE_MAINTAINER_pn-syslinux = "Darren Hart <dvhart@linux.intel.com>"
 RECIPE_DEPENDENCY_CHECK_pn-syslinux = "not done"
 RECIPE_LATEST_VERSION_pn-syslinux = "3.86"
 RECIPE_PATCH_pn-syslinux+cross-build = "use poky toolchain instead of host"
@@ -1482,7 +1484,7 @@ RECIPE_LAST_UPDATE_pn-sysfsutils = "Jun 18, 2010"
 RECIPE_DEPENDENCY_CHECK_pn-sysfsutils = "not done"
 RECIPE_INTEL_SECTION_pn-sysfsutils = "base utils"
 RECIPE_TIME_BETWEEN_LAST_TWO_RELEASES_pn-sysfsutils = "n/a"
-RECIPE_MANUAL_CHECK_DATE_pn-sysfsutils = "Nov 08, 2011"
+RECIPE_MANUAL_CHECK_DATE_pn-sysfsutils = "Dec 01, 2011"
 RECIPE_COMMENTS_pn-sysfsutils = ""
 RECIPE_MAINTAINER_pn-sysfsutils = "Saul Wold <sgw@linux.intel.com>"
 
@@ -1532,15 +1534,15 @@ RECIPE_COMMENTS_pn-pkgconfig = ""
 RECIPE_NO_UPDATE_REASON_pn-pkgconfig = "0.26 removes glib-conf, adds circular depends"
 
 RECIPE_STATUS_pn-less = "green"
-RECIPE_LAST_UPDATE_pn-less = "May 24, 2011"
+RECIPE_LATEST_VERSION_pn-less = "444"
+RECIPE_LATEST_RELEASE_DATE_pn-less = "Jun 9, 2011"
+RECIPE_LAST_UPDATE_pn-less = "Dec 01, 2011"
+RECIPE_MANUAL_CHECK_DATE_pn-less = "Dec 01, 2011"
 RECIPE_MAINTAINER_pn-less = "Saul Wold <sgw@linux.intel.com>"
 RECIPE_DEPENDENCY_CHECK_pn-less = "done"
-RECIPE_LATEST_VERSION_pn-less = "443"
 RECIPE_INTEL_SECTION_pn-less = "base utils"
 RECIPE_TIME_BETWEEN_LAST_TWO_RELEASES_pn-less = "1 month"
-RECIPE_LATEST_RELEASE_DATE_pn-less = "Apr 10, 2011"
 RECIPE_COMMENTS_pn-less = "also licensed under less, which is a 2-clause BSD-like permissive license"
-RECIPE_MANUAL_CHECK_DATE_pn-less = "May 24, 2011"
 
 RECIPE_STATUS_pn-genext2fs = "green"
 RECIPE_LAST_UPDATE_pn-genext2fs = "Jul 12, 2010"
@@ -1683,7 +1685,7 @@ RECIPE_MAINTAINER_pn-unzip = "Saul Wold <sgw@linux.intel.com>"
 RECIPE_DEPENDENCY_CHECK_pn-unzip = "not done"
 RECIPE_INTEL_SECTION_pn-unzip = "base utils"
 RECIPE_TIME_BETWEEN_LAST_TWO_RELEASES_pn-unzip = "49 months"
-RECIPE_MANUAL_CHECK_DATE_pn-unzip = "Nov 08, 2011"
+RECIPE_MANUAL_CHECK_DATE_pn-unzip = "Dec 01, 2011"
 RECIPE_COMMENTS_pn-unzip = "5.52 has a race condition vulnerability for Unix version"
 
 RECIPE_STATUS_pn-zip = "green"
@@ -1694,7 +1696,7 @@ RECIPE_MAINTAINER_pn-zip = "Saul Wold <sgw@linux.intel.com>"
 RECIPE_DEPENDENCY_CHECK_pn-zip = "not done"
 RECIPE_INTEL_SECTION_pn-zip = "base utils"
 RECIPE_TIME_BETWEEN_LAST_TWO_RELEASES_pn-zip = "21 months"
-RECIPE_MANUAL_CHECK_DATE_pn-zip = "Nov 08, 2011"
+RECIPE_MANUAL_CHECK_DATE_pn-zip = "Dec 01, 2011"
 RECIPE_COMMENTS_pn-zip = ""
 
 RECIPE_STATUS_pn-strace = "green"
@@ -1781,12 +1783,12 @@ RECIPE_INTEL_SECTION_pn-shared-mime-info = "base utils"
 RECIPE_LATEST_RELEASE_DATE_pn-shared-mime-info = "Feb 01, 2010"
 
 RECIPE_STATUS_pn-util-linux = "green"
-RECIPE_LATEST_VERSION_pn-util-linux = "2.19.1"
-RECIPE_LAST_UPDATE_pn-util-linux = "May 24, 2011"
-RECIPE_LATEST_RELEASE_DATE_pn-util-linux = "May 2, 2011"
+RECIPE_LATEST_VERSION_pn-util-linux = "2.20.1"
+RECIPE_LATEST_RELEASE_DATE_pn-util-linux = "Nov 07, 2011"
+RECIPE_LAST_UPDATE_pn-util-linux = "Dec 01, 2011"
 RECIPE_MAINTAINER_pn-util-linux = "Saul Wold <sgw@linux.intel.com>"
 RECIPE_INTEL_SECTION_pn-util-linux = "base utils"
-RECIPE_MANUAL_CHECK_DATE_pn-util-linux = "Nov 08, 2011"
+RECIPE_MANUAL_CHECK_DATE_pn-util-linux = "Dec 01, 2011"
 RECIPE_COMMENTS_pn-util-linux = "kernel.org still has this off-line"
 
 RECIPE_STATUS_pn-usbutils = "green"
@@ -1835,10 +1837,10 @@ RECIPE_COMMENTS_pn-zypper = ""
 DISTRO_PN_ALIAS_pn-zypper = "OpenSuse=zypper Meego=zypper"
 
 RECIPE_STATUS_pn-sysstat = "green"
-RECIPE_LATEST_VERSION_pn-sysstat = "10.0.2"
-RECIPE_LATEST_RELEASE_DATE_pn-sysstat = "Aug 28, 2011"
-RECIPE_LAST_UPDATE_pn-sysstat = "Sep 27, 2011"
-RECIPE_MANUAL_CHECK_DATE_pn-sysstat = "Nov 8, 2011"
+RECIPE_LATEST_VERSION_pn-sysstat = "10.0.3"
+RECIPE_LATEST_RELEASE_DATE_pn-sysstat = "Nov 27, 2011"
+RECIPE_LAST_UPDATE_pn-sysstat = "Dec 01, 2011"
+RECIPE_MANUAL_CHECK_DATE_pn-sysstat = "Dec 01, 2011"
 RECIPE_MAINTAINER_pn-sysstat = "Saul Wold <sgw@linux.intel.com>"
 
 RECIPE_STATUS_pn-sysklogd = "red"    # need upgrade
@@ -1868,9 +1870,11 @@ RECIPE_MAINTAINER_pn-xinetd="Saul Wold <sgw@linux.intel.com>"
 RECIPE_LATEST_VERSION_pn-xinetd="2.3.14"
 
 RECIPE_STATUS_pn-cracklib="green"
+RECIPE_LATEST_VERSION_pn-cracklib="2.8.18"
+RECIPE_LATEST_RELEASE_DATE_pn-cracklib = "Aug 29, 2010"
 RECIPE_LAST_UPDATE_pn-cracklib = "Nov 13, 2010"
+RECIPE_MANUAL_CHECK_DATE_pn-cracklib = "Dec 01, 2011"
 RECIPE_MAINTAINER_pn-cracklib="Saul Wold <sgw@linux.intel.com>"
-RECIPE_LATEST_VERSION_pn-cracklib="2.8.18"
 
 RECIPE_STATUS_pn-openobex = "red"
 RECIPE_LATEST_VERSION_pn-openobex = "1.5"
@@ -1900,12 +1904,11 @@ RECIPE_MANUAL_CHECK_DATE_pn-parted = "Nov 22, 2011"
 RECIPE_MAINTAINER_pn-parted = "Zhai Edwin <edwin.zhai@intel.com>"
 
 RECIPE_STATUS_pn-resolvconf = "green"
-RECIPE_LATEST_VERSION_pn-resolvconf = "1.59"
-RECIPE_LATEST_RELEASE_DATE_pn-resolvconf = "Sep 26, 2011"
-RECIPE_LAST_UPDATE_pn-resolvconf = "Jan 20, 2011"
+RECIPE_LATEST_VERSION_pn-resolvconf = "1.62"
+RECIPE_LATEST_RELEASE_DATE_pn-resolvconf = "Nov 30, 2011"
+RECIPE_LAST_UPDATE_pn-resolvconf = "Dec 01, 2011"
 RECIPE_MAINTAINER_pn-resolvconf = "Saul Wold <sgw@linux.intel.com>"
-RECIPE_MANUAL_CHECK_DATE_pn-resolvconf = "Sep 27, 2011"
-RECIPE_NO_UPDATE_REASON_pn-resolvconf = "1.61 is latest UNSTABLE"
+RECIPE_MANUAL_CHECK_DATE_pn-resolvconf = "Dec 01, 2011"
 RECIPE_COMMENTS_pn-resolvconf = ""
 
 RECIPE_STATUS_pn-openswan = "red"
@@ -1956,7 +1959,7 @@ RECIPE_STATUS_pn-libexif = "green"
 RECIPE_LATEST_VERSION_pn-libexif = "0.6.20"
 RECIPE_LATEST_RELEASE_DATE_pn-libexif = "Dec 12, 2010"
 RECIPE_LAST_UPDATE_pn-libexif = "Apr 15, 2011"
-RECIPE_MANUAL_CHECK_DATE_pn-libexif = "Nov 08, 2011"
+RECIPE_MANUAL_CHECK_DATE_pn-libexif = "Dec 01, 2011"
 RECIPE_MAINTAINER_pn-libexif = "Saul Wold <sgw@linux.intel.com>"
 
 RECIPE_STATUS_pn-setserial = "red"
@@ -3064,6 +3067,7 @@ RECIPE_MAINTAINER_pn-perl = "Nitin A Kamble <nitin.a.kamble@intel.com>"
 RECIPE_STATUS_pn-prelink="red" 
 RECIPE_LATEST_VERSION_pn-prelink="1.0+git0+0x909470ee441237563d6236c505cb2d02ddc48704"
 RECIPE_LAST_UPDATE_pn-prelink = "Jul 23, 2010"
+RECIPE_MANUAL_CHECK_DATE_pn-prelink = "Dec 01, 2011"
 RECIPE_MAINTAINER_pn-prelink = "Mark Hatle <mark.hatle@windriver.com>"
 
 RECIPE_STATUS_pn-python-dbus="green" 
@@ -3473,7 +3477,7 @@ RECIPE_INTEL_SECTION_pn-qemugl="graphic app"
 RECIPE_LAST_UPDATE_pn-qemugl = "Nov 28, 2010"
 RECIPE_NO_UPDATE_REASON_pn-qemugl = "Do not upgrade to version: 33466cd8 because the upstream is broken in x86_64 build"
 RECIPE_MAINTAINER_pn-qemugl="Saul Wold <sgw@linux.intel.com>"
-RECIPE_MANUAL_CHECK_DATE_pn-qemugl= "Jul 01, 2011"
+RECIPE_MANUAL_CHECK_DATE_pn-qemugl= "Dec 01, 2011"
 
 RECIPE_STATUS_pn-fotowall="green" # no update needed
 RECIPE_LATEST_VERSION_pn-fotowall="0.9"
@@ -3657,6 +3661,7 @@ RECIPE_LATEST_RELEASE_DATE_pn-xf86-video-vmware="Nov 09, 2010"
 RECIPE_INTEL_SECTION_pn-xf86-video-vmware="graphic core"
 RECIPE_LAST_UPDATE_pn-xf86-video-vmware = "Nov 12, 2010"
 RECIPE_MAINTAINER_pn-xf86-video-vmware="Saul Wold <sgw@linux.intel.com>"
+RECIPE_NO_UPDATE_REASON_pn-xf86-video-vmware = "Do not update to *99* unstable versions"
 
 RECIPE_STATUS_pn-xf86-video-vesa = "green" # no update needed
 RECIPE_LATEST_VERSION_pn-xf86-video-vesa = "2.3.0"
@@ -3736,13 +3741,15 @@ RECIPE_LAST_UPDATE_pn-mesa-xlib = "Nov 27, 2010"
 RECIPE_MAINTAINER_pn-mesa-xlib="Saul Wold <sgw@linux.intel.com>"
 
 RECIPE_STATUS_pn-xserver-xorg="green" # no update needed
-RECIPE_LATEST_VERSION_pn-xserver-xorg="1.8.99.904"
+RECIPE_LATEST_VERSION_pn-xserver-xorg="1.11.2"
 RECIPE_NO_OF_PATCHES_pn-xserver-xorg="2"
 RECIPE_TIME_BETWEEN_LAST_TWO_RELEASES_pn-xserver-xorg="2 monthes"
-RECIPE_LATEST_RELEASE_DATE_pn-xserver-xorg="Jul 01, 2010"
+RECIPE_LATEST_RELEASE_DATE_pn-xserver-xorg="Nov 04, 2011"
 RECIPE_INTEL_SECTION_pn-xserver-xorg="graphic core"
-RECIPE_LAST_UPDATE_pn-xserver-xorg = "Jan 18, 2011"
+RECIPE_LAST_UPDATE_pn-xserver-xorg = "Nov 30, 2011"
 RECIPE_MAINTAINER_pn-xserver-xorg="Saul Wold <sgw@linux.intel.com>"
+DISTRO_PN_ALIAS_pn-xserver-xorg = "Fedora=xorg-x11-server Ubuntu=xserver-xorg"
+RECIPE_NO_UPDATE_REASON_pn-xserver-xorg = "Do not update to *99* unstable versions"
 
 RECIPE_STATUS_pn-xf86-input-synaptics = "red"
 DISTRO_PN_ALIAS_pn-xf86-input-synaptics = "Meego=xorg-x11-drv-synaptics Fedora=xorg-x11-drv-synaptics Ubuntu=xserver-xorg-input-synaptics Mandriva=x11-driver-input-synaptics Debian=xfree86-driver-synaptics"
@@ -4654,7 +4661,7 @@ RECIPE_STATUS_pn-libx11-diet = "green"
 DISTRO_PN_ALIAS_pn-libx11-diet = "Debian=libx11-6 Fedora=libX11 Ubuntu=libx11-6 OpenSuSE=xorg-x11-libX11"
 RECIPE_LATEST_VERSION_pn-libx11-diet = "1.4.4"
 RECIPE_LATEST_RELEASE_DATE_pn-libx11-diet = "Jul 28,2011"
-RECIPE_LAST_UPDATE_pn-libx11-diet = " Nov 22, 2011"
+RECIPE_LAST_UPDATE_pn-libx11-diet = "Nov 22, 2011"
 RECIPE_MAINTAINER_pn-libx11-diet = "Xiaofeng Yan <xiaofeng.yan@windriver.com>"
 
 RECIPE_STATUS_pn-directfb = "green"
@@ -5745,13 +5752,13 @@ RECIPE_MAINTAINER_pn-adt-installer = "Jessica Zhang <jessica.zhang@intel.com>"
 RECIPE_LATEST_VERSION_pn-glew = "1.7.0"
 RECIPE_LATEST_RELEASE_DATE_pn-glew = "Aug 26, 2011"
 RECIPE_LAST_UPDATE_pn-glew = "May 24, 2011"
-RECIPE_MANUAL_CHECK_DATE_pn-glew = "Nov 28, 2011"
-RECIPE_MAINTAINER_pn-lsbsetup = "Saul Wold <sgw@linux.intel.com>"
+RECIPE_MANUAL_CHECK_DATE_pn-glew = "Dec 01, 2011"
+RECIPE_MAINTAINER_pn-glew = "Saul Wold <sgw@linux.intel.com>"
 
 RECIPE_LATEST_VERSION_pn-squashfs-tools = "4.2"
 RECIPE_LATEST_RELEASE_DATE_pn-squashfs-tools = "Feb 28, 2011"
 RECIPE_LAST_UPDATE_pn-squashfs-tools = "Oct 21, 2011"
-RECIPE_MANUAL_CHECK_DATE_pn-squashfs-tools = "Nov 28, 2011"
+RECIPE_MANUAL_CHECK_DATE_pn-squashfs-tools = "Dec 01, 2011"
 RECIPE_MAINTAINER_pn-squashfs-tools = "Saul Wold <sgw@linux.intel.com>"
 
 RECIPE_LATEST_VERSION_pn-mpeg2dec = "0.5.1"
@@ -5762,14 +5769,14 @@ RECIPE_MAINTAINER_pn-squashfs-tools = "Saul Wold <sgw@linux.intel.com>"
 RECIPE_LATEST_VERSION_pn-lame = "3.99.3"
 RECIPE_LATEST_RELEASE_DATE_pn-lame = "Nov 26, 2011"
 RECIPE_LAST_UPDATE_pn-lame = "Nov 28, 2011"
-RECIPE_MANUAL_CHECK_DATE_pn-lame = "Nov 28, 2011"
+RECIPE_MANUAL_CHECK_DATE_pn-lame = "Dec 01, 2011"
 DISTRO_PN_ALIAS_pn-lame = "Debian=lame Ubuntu=lame"
 RECIPE_MAINTAINER_pn-lame = "Saul Wold <sgw@linux.intel.com>"
 
 RECIPE_LATEST_VERSION_pn-libmad = "0.15.1b"
 RECIPE_LATEST_RELEASE_DATE_pn-libmad = "Feb 18, 2004"
 RECIPE_LAST_UPDATE_pn-libmad = "Jul 04, 2006"
-RECIPE_MANUAL_CHECK_DATE_pn-libmad = "Nov 28, 2011"
+RECIPE_MANUAL_CHECK_DATE_pn-libmad = "Dec 01, 2011"
 RECIPE_MAINTAINER_pn-libmad = "Saul Wold <sgw@linux.intel.com>"
 
 RECIPE_LATEST_VERSION_pn-libxml-perl = "0.08"
@@ -5777,9 +5784,9 @@ RECIPE_LATEST_VERSION_pn-libxml-perl = "0.08"
 RECIPE_LATEST_VERSION_pn-lsb = "1.4"
 RECIPE_LAST_UPDATE_pn-lsb = "Nov 04, 2010"
 RECIPE_LATEST_RELEASE_DATE_pn-lsb = "Jan 04, 2001"
-RECIPE_MANUAL_CHECK_DATE_pn-lsb = "Nov 28, 2011"
+RECIPE_MANUAL_CHECK_DATE_pn-lsb = "Dec 01, 2011"
 RECIPE_NO_UPDATE_REASON_pn-lsb = "1.4 is fixed version of LSB Test"
-RECIPE_MAINTAINER_pn-libmad = "Saul Wold <sgw@linux.intel.com>"
+RECIPE_MAINTAINER_pn-lsb = "Saul Wold <sgw@linux.intel.com>"
 
 RECIPE_LATEST_VERSION_pn-lsbsetup = "0.9"
 RECIPE_MANUAL_CHECK_DATE_pn-lsbsetup = "Nov 28, 2011"
@@ -6051,7 +6058,6 @@ DISTRO_PN_ALIAS_pn-rt-tests = "Debian=rt-tests Ubuntu=rt-tests"
 RECIPE_MAINTAINER_pn-rt-tests = "Darren Hart <dvhart@linux.intel.com>"
 
 DISTRO_PN_ALIAS_pn-xserver-xorg-lite = "Fedora=xorg-x11-server Ubuntu=xserver-xorg"
-DISTRO_PN_ALIAS_pn-xserver-xorg = "Fedora=xorg-x11-server Ubuntu=xserver-xorg"
 DISTRO_PN_ALIAS_pn-xserver-xf86-lite = "Fedora=xorg-x11-server Ubuntu=xserver-xorg"
 DISTRO_PN_ALIAS_pn-xserver-xf86-dri-lite = "Fedora=xorg-x11-server Ubuntu=xserver-xorg"
 DISTRO_PN_ALIAS_pn-xserver-kdrive = "Fedora=xorg-x11-server Ubuntu=xserver-xorg"
-- 
1.7.6.4



