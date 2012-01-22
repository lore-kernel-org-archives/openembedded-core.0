Received: from mga03.intel.com ([143.182.124.21])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <shane.wang@intel.com>) id 1Rp1s0-0002br-09
	for openembedded-core@lists.openembedded.org;
	Sun, 22 Jan 2012 19:10:25 +0100
Received: from azsmga001.ch.intel.com ([10.2.17.19])
	by azsmga101.ch.intel.com with ESMTP; 22 Jan 2012 10:02:40 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="4.71,315,1320652800"; d="scan'208";a="98551011"
Received: from yocto-build5.sh.intel.com (HELO localhost) ([10.239.48.2])
	by azsmga001.ch.intel.com with ESMTP; 22 Jan 2012 10:02:39 -0800
From: Shane Wang <shane.wang@intel.com>
To: openembedded-core@lists.openembedded.org
Date: Mon, 23 Jan 2012 02:06:23 +0800
Message-Id: <1ece182cdc5a6028e5792d995f73356c50596201.1327255446.git.shane.wang@intel.com>
X-Mailer: git-send-email 1.7.6
In-Reply-To: <a3776c81de568353900eec28bb7f10372875e727.1327255445.git.shane.wang@intel.com>
References: <a3776c81de568353900eec28bb7f10372875e727.1327255445.git.shane.wang@intel.com>
In-Reply-To: <cover.1327255445.git.shane.wang@intel.com>
References: <cover.1327255445.git.shane.wang@intel.com>
Subject: [PATCH 18/18] distro_tracking.inc: update the info for recipes upgraded recently
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
X-List-Received-Date: Sun, 22 Jan 2012 18:10:25 -0000

This patch is to update the information for the recipes upgraded recently, including strace, pciutils, ed, ofono, iproute2, bluez4, bluez-hcidump, kexec-tools, tremor, iptables, polkit, libxcb, xcb-proto, pixman and util-macros.

And add the new recipe for mobile-broadband-provider-info, which is depended on by ofono v1.3.

Signed-off-by: Shane Wang <shane.wang@intel.com>
---
 .../conf/distro/include/distro_tracking_fields.inc |  103 ++++++++++---------
 1 files changed, 54 insertions(+), 49 deletions(-)

diff --git a/meta/conf/distro/include/distro_tracking_fields.inc b/meta/conf/distro/include/distro_tracking_fields.inc
index beb02b8..ce88b2e 100644
--- a/meta/conf/distro/include/distro_tracking_fields.inc
+++ b/meta/conf/distro/include/distro_tracking_fields.inc
@@ -820,12 +820,12 @@ DISTRO_PN_ALIAS_pn-opkg-utils = "OSPDT upstream=http://svn.openmoko.org/trunk/sr
 
 RECIPE_STATUS_pn-polkit = "green"
 RECIPE_DEPENDENCY_CHECK_pn-polkit = "not done"
-RECIPE_LATEST_VERSION_pn-polkit = "0.103"
+RECIPE_LATEST_VERSION_pn-polkit = "0.104"
 RECIPE_INTEL_SECTION_pn-polkit = "base utils"
-RECIPE_TIME_BETWEEN_LAST_TWO_RELEASES_pn-polkit = "4 months"
-RECIPE_LATEST_RELEASE_DATE_pn-polkit = "Dec 06, 2011"
+RECIPE_TIME_BETWEEN_LAST_TWO_RELEASES_pn-polkit = "1 months"
+RECIPE_LATEST_RELEASE_DATE_pn-polkit = "Jan 03, 2012"
 RECIPE_COMMENTS_pn-polkit = ""
-RECIPE_LAST_UPDATE_pn-polkit = "Dec 23, 2011"
+RECIPE_LAST_UPDATE_pn-polkit = "Jan 22, 2012"
 RECIPE_MAINTAINER_pn-polkit = "Dongxiao Xu <dongxiao.xu@intel.com>"
 
 RECIPE_STATUS_pn-psplash = "not done"
@@ -873,15 +873,14 @@ DISTRO_PN_ALIAS_pn-blktool = "Debian=blktool Mandriva=blktool"
 
 RECIPE_STATUS_pn-iproute2 = "green"
 RECIPE_DEPENDENCY_CHECK_pn-iproute2 = "not done"
-RECIPE_LATEST_VERSION_pn-iproute2 = "3.1.0"
+RECIPE_LATEST_VERSION_pn-iproute2 = "3.2.0"
 RECIPE_PATCH_pn-iproute2+configure-cross = "to be pushed upstream"
 RECIPE_INTEL_SECTION_pn-iproute2 = "base utils"
 RECIPE_TIME_BETWEEN_LAST_TWO_RELEASES_pn-iproute2 = "1 months"
-RECIPE_LATEST_RELEASE_DATE_pn-iproute2 = "Nov 17, 2011"
-RECIPE_NO_UPDATE_REASON_pn-iproute2="3.1.0 is the latest version, not 050607"
+RECIPE_LATEST_RELEASE_DATE_pn-iproute2 = "Jan 05, 2012"
 RECIPE_COMMENTS_pn-iproute2 = ""
 DISTRO_PN_ALIAS_pn-iproute2 = "OSPDT"
-RECIPE_LAST_UPDATE_pn-iproute2 = "Nov 29, 2011"
+RECIPE_LAST_UPDATE_pn-iproute2 = "Jan 22, 2012"
 RECIPE_MAINTAINER_pn-iproute2 = "Dongxiao Xu <dongxiao.xu@intel.com>"
 
 RECIPE_STATUS_pn-netbase = "green"
@@ -1076,9 +1075,9 @@ RECIPE_LAST_UPDATE_pn-gzip = "Jun 4, 2011"
 RECIPE_MAINTAINER_pn-gzip = "Scott Garman <scott.a.garman@intel.com>"
 
 RECIPE_STATUS_pn-iptables = "green"
-RECIPE_LAST_UPDATE_pn-iptables = "Oct 28, 2011"
+RECIPE_LAST_UPDATE_pn-iptables = "Jan 22, 2012"
 RECIPE_MAINTAINER_pn-iptables = "Dongxiao Xu <dongxiao.xu@intel.com>"
-RECIPE_LATEST_VERSION_pn-iptables = "1.4.12.1"
+RECIPE_LATEST_VERSION_pn-iptables = "1.4.12.2"
 
 RECIPE_STATUS_pn-ethtool = "green"
 RECIPE_LATEST_VERSION_pn-ethtool = "2.6.36"
@@ -1146,14 +1145,14 @@ RECIPE_LATEST_RELEASE_DATE_pn-bc = "Nov 01, 2000"
 RECIPE_COMMENTS_pn-bc = ""
 
 RECIPE_STATUS_pn-ed = "green"
-RECIPE_LAST_UPDATE_pn-ed = "Nov 19, 2010"
+RECIPE_LAST_UPDATE_pn-ed = "Jan 22, 2012"
 RECIPE_MAINTAINER_pn-ed = "Zhai Edwin <edwin.zhai@intel.com>"
 RECIPE_DEPENDENCY_CHECK_pn-ed = "not done"
-RECIPE_LATEST_VERSION_pn-ed = "1.5"
+RECIPE_LATEST_VERSION_pn-ed = "1.6"
 RECIPE_NO_OF_PATCHES_pn-ed = "1"
 RECIPE_INTEL_SECTION_pn-ed = "base utils"
 RECIPE_TIME_BETWEEN_LAST_TWO_RELEASES_pn-ed = "14 months"
-RECIPE_LATEST_RELEASE_DATE_pn-ed = "Jul 01, 2010"
+RECIPE_LATEST_RELEASE_DATE_pn-ed = "Jan 01, 2012"
 RECIPE_COMMENTS_pn-ed = "GPLv3 was used since ed 0.6"
 
 RECIPE_STATUS_pn-pax = "green"
@@ -1739,7 +1738,7 @@ RECIPE_MANUAL_CHECK_DATE_pn-zip = "Jan 09, 2012"
 RECIPE_COMMENTS_pn-zip = ""
 
 RECIPE_STATUS_pn-strace = "green"
-RECIPE_LAST_UPDATE_pn-strace = "Oct 14, 2011"
+RECIPE_LAST_UPDATE_pn-strace = "Jan 22, 2012"
 RECIPE_MAINTAINER_pn-strace = "Dongxiao Xu <dongxiao.xu@intel.com>"
 RECIPE_DEPENDENCY_CHECK_pn-strace = "not done"
 RECIPE_LATEST_VERSION_pn-strace = "4.6"
@@ -1842,17 +1841,17 @@ RECIPE_TIME_BETWEEN_LAST_TWO_RELEASES_pn-usbutils = "2 months"
 RECIPE_COMMENTS_pn-usbutils = "No update on kernel.org"
 
 RECIPE_STATUS_pn-pciutils = "yellow"    # custom build system, several hacks
-RECIPE_LAST_UPDATE_pn-pciutils = "Nov 10, 2010"
+RECIPE_LAST_UPDATE_pn-pciutils = "Jan 22, 2012"
 RECIPE_MAINTAINER_pn-pciutils = "Zhai Edwin <edwin.zhai@intel.com>"
 RECIPE_DEPENDENCY_CHECK_pn-pciutils = "done"
-RECIPE_LATEST_VERSION_pn-pciutils = "3.1.7"
+RECIPE_LATEST_VERSION_pn-pciutils = "3.1.9"
 RECIPE_PATCH_pn-pciutils+configure = "fix for a handwritten config"
 RECIPE_PATCH_pn-pciutils+guess-fix = "fix arch guess algorithm"
 RECIPE_PATCH_pn-pciutils+pcimodules-pciutils = "add pcimodules util"
 RECIPE_PATCH_pn-pciutils+lib-build-fix = "fix shared library build"
 RECIPE_INTEL_SECTION_pn-pciutils = "base utils"
 RECIPE_TIME_BETWEEN_LAST_TWO_RELEASES_pn-pciutils = "5 months"
-RECIPE_LATEST_RELEASE_DATE_pn-pciutils = "Jan 01, 2010"
+RECIPE_LATEST_RELEASE_DATE_pn-pciutils = "Jan 14, 2012"
 RECIPE_COMMENTS_pn-pciutils = ""
 
 RECIPE_STATUS_pn-gamin = "green"
@@ -2165,13 +2164,13 @@ RECIPE_MAINTAINER_pn-irda-utils = "Dongxiao Xu <dongxiao.xu@intel.com>"
 
 RECIPE_STATUS_pn-bluez4="green"
 DISTRO_PN_ALIAS_pn-bluez4="Meego=bluz Fedora=bluz Ubuntu=bluz OpenSuSE=bluz Mandriva=bluz"
-RECIPE_LATEST_VERSION_pn-bluez4="4.97"
+RECIPE_LATEST_VERSION_pn-bluez4="4.98"
 RECIPE_NO_OF_PATCHES_pn-bluez4="2"
-RECIPE_LATEST_RELEASE_DATE_pn-bluez4="Dec 23, 2011"
+RECIPE_LATEST_RELEASE_DATE_pn-bluez4="Jan 13, 2012"
 RECIPE_TIME_BETWEEN_LAST_TWO_RELEASES_pn-bluez4="20 days"
 DISTRO_PN_ALIAS_pn-bluez4= "Fedora=bluez Ubuntu=bluez Debian=bluez-utils Opensuse=bluez"
-RECIPE_LAST_UPDATE_pn-bluez4 = "Dec 30, 2010"
-RECIPE_MANUAL_CHECK_DATE_pn-bluez4 = "Dec 24, 2011"
+RECIPE_LAST_UPDATE_pn-bluez4 = "Jan 22, 2012"
+RECIPE_MANUAL_CHECK_DATE_pn-bluez4 = "Jan 22, 2012"
 RECIPE_MAINTAINER_pn-bluez4 = "Dongxiao Xu <dongxiao.xu@intel.com>"
 
 RECIPE_STATUS_pn-libpcap="green"
@@ -2282,12 +2281,18 @@ RECIPE_LATEST_VERSION_pn-libopensync-plugin-syncml = "0.39"
 RECIPE_LAST_UPDATE_pn-libopensync-plugin-syncml = "Jul 31, 2009"
 RECIPE_MAINTAINER_pn-libopensync-plugin-syncml = "Dongxiao Xu <dongxiao.xu@intel.com>"
 
+RECIPE_STATUS_pn-mobile-broadband-provider-info = "red"
+RECIPE_LATEST_VERSION_pn-mobile-broadband-provider-info = "1.0.0+git"
+RECIPE_LAST_UPDATE_pn-mobile-broadband-provider-info = "Jan 22, 2012"
+RECIPE_MANUAL_CHECK_DATE_pn-mobile-broadband-provider-info = "Jan 22, 2012"
+RECIPE_MAINTAINER_pn-mobile-broadband-provider-info = "Shane Wang <shane.wang@intel.com>"
+
 RECIPE_STATUS_pn-ofono = "green"
-RECIPE_LATEST_VERSION_pn-ofono = "1.0"
+RECIPE_LATEST_VERSION_pn-ofono = "1.3"
 RECIPE_NO_OF_PATCHES_pn-ofono="0"
-RECIPE_LATEST_RELEASE_DATE_pn-ofono="Dec 22, 2011"
+RECIPE_LATEST_RELEASE_DATE_pn-ofono="Jan 20, 2012"
 RECIPE_TIME_BETWEEN_LAST_TWO_RELEASES_pn-ofono="15 days"
-RECIPE_LAST_UPDATE_pn-ofono = "Dec 23, 2011"
+RECIPE_LAST_UPDATE_pn-ofono = "Jan 22, 2012"
 RECIPE_MAINTAINER_pn-ofono = "Dongxiao Xu <dongxiao.xu@intel.com>"
 DISTRO_PN_ALIAS_pn-ofono = "Debian=ofono Ubuntu=ofono"
 
@@ -2336,8 +2341,8 @@ RECIPE_LATEST_VERSION_pn-bluez-hcidump = "2.2"
 RECIPE_NO_OF_PATCHES_pn-bluez-hcidump = "0"
 RECIPE_LATEST_RELEASE_DATE_pn-bluez-hcidump = "Dec 23, 2011"
 RECIPE_TIME_BETWEEN_LAST_TWO_RELEASES_pn-bluez-hcidump = "4 months"
-RECIPE_LAST_UPDATE_pn-bluez-hcidump = "Apr 26, 2011"
-RECIPE_MANUAL_CHECK_DATE_pn-bluez-hcidump = "Dec 24, 2011"
+RECIPE_LAST_UPDATE_pn-bluez-hcidump = "Jan 22, 2012"
+RECIPE_MANUAL_CHECK_DATE_pn-bluez-hcidump = "Jan 22, 2012"
 RECIPE_MAINTAINER_pn-bluez-hcidump = "Dongxiao Xu <dongxiao.xu@intel.com>"
 
 RECIPE_STATUS_pn-ppp-dialin = "red"
@@ -2406,12 +2411,12 @@ RECIPE_LAST_UPDATE_pn-hostap-utils = "Jun 28, 2007"
 RECIPE_MAINTAINER_pn-hostap-utils = "Dongxiao Xu <dongxiao.xu@intel.com>"
 
 RECIPE_STATUS_pn-kexec-tools="green"
-RECIPE_LATEST_VERSION_pn-kexec-tools="2.0.2"
+RECIPE_LATEST_VERSION_pn-kexec-tools="2.0.3"
 RECIPE_NO_OF_PATCHES_pn-kexec-tools="1"
-RECIPE_LATEST_RELEASE_DATE_pn-kexec-tools="Jul 29, 2010"
+RECIPE_LATEST_RELEASE_DATE_pn-kexec-tools="Jan 15, 2012"
 RECIPE_TIME_BETWEEN_LAST_TWO_RELEASES_pn-kexec-tools="1 year"
-RECIPE_LAST_UPDATE_pn-kexec-tools = "Nov 16, 2010"
-RECIPE_MANUAL_CHECK_DATE_pn-kexec-tools = "Jan 10, 2012"
+RECIPE_LAST_UPDATE_pn-kexec-tools = "Jan 22, 2012"
+RECIPE_MANUAL_CHECK_DATE_pn-kexec-tools = "Jan 22, 2012"
 RECIPE_MAINTAINER_pn-kexec-tools = "Dongxiao Xu <dongxiao.xu@intel.com>"
 
 RECIPE_STATUS_pn-hostap-conf = "red"
@@ -2721,11 +2726,11 @@ RECIPE_LAST_UPDATE_pn-alsa-lib = "Apr 15, 2011"
 RECIPE_MAINTAINER_pn-alsa-lib = "Dongxiao Xu <dongxiao.xu@intel.com>"
 
 RECIPE_STATUS_pn-tremor="green"
-RECIPE_LATEST_VERSION_pn-tremor="20101121"
+RECIPE_LATEST_VERSION_pn-tremor="20120122"
 RECIPE_NO_OF_PATCHES_pn-tremor="0"
-RECIPE_LATEST_RELEASE_DATE_pn-tremor="Nov 21, 2010"
+RECIPE_LATEST_RELEASE_DATE_pn-tremor="Jan 22, 2012"
 RECIPE_TIME_BETWEEN_LAST_TWO_RELEASES_pn-tremor="n/a"
-RECIPE_LAST_UPDATE_pn-tremor = "Dec 30, 2010"
+RECIPE_LAST_UPDATE_pn-tremor = "Jan 22, 2012"
 RECIPE_MAINTAINER_pn-tremor = "Dongxiao Xu <dongxiao.xu@intel.com>"
 DISTRO_PN_ALIAS_pn-tremor = "OSPDT upstream=http://www.xiph.org/vorbis/"
 
@@ -4291,13 +4296,13 @@ RECIPE_MAINTAINER_pn-dri2proto = "Dexuan Cui <dexuan.cui@intel.com>"
 
 RECIPE_STATUS_pn-xcb-proto = "green"
 RECIPE_DEPENDENCY_CHECK_pn-xcb-proto = "not done"
-RECIPE_LATEST_VERSION_pn-xcb-proto = "1.6"
+RECIPE_LATEST_VERSION_pn-xcb-proto = "1.7"
 RECIPE_NO_OF_PATCHES_pn-xcb-proto = "0"
 RECIPE_INTEL_SECTION_pn-xcb-proto = "x11/libs"
-RECIPE_TIME_BETWEEN_LAST_TWO_RELEASES_pn-xcb-proto = "5 months"
-RECIPE_LATEST_RELEASE_DATE_pn-xcb-proto = "Dec 01, 2009"
+RECIPE_TIME_BETWEEN_LAST_TWO_RELEASES_pn-xcb-proto = "14 months"
+RECIPE_LATEST_RELEASE_DATE_pn-xcb-proto = "Jan 11, 2012"
 RECIPE_COMMENTS_pn-xcb-proto = ""
-RECIPE_LAST_UPDATE_pn-xcb-proto = "Jun 29, 2010"
+RECIPE_LAST_UPDATE_pn-xcb-proto = "Jun 22, 2012"
 RECIPE_MAINTAINER_pn-xcb-proto = "Dexuan Cui <dexuan.cui@intel.com>"
 
 RECIPE_STATUS_pn-xextproto = "green"
@@ -4419,13 +4424,13 @@ RECIPE_MAINTAINER_pn-libxcalibrate = "Dexuan Cui <dexuan.cui@intel.com>"
 
 RECIPE_STATUS_pn-libxcb = "green"
 RECIPE_DEPENDENCY_CHECK_pn-libxcb = "not done"
-RECIPE_LATEST_VERSION_pn-libxcb = "1.6"
+RECIPE_LATEST_VERSION_pn-libxcb = "1.8"
 RECIPE_NO_OF_PATCHES_pn-libxcb = "0"
 RECIPE_INTEL_SECTION_pn-libxcb = "x11/libs"
-RECIPE_TIME_BETWEEN_LAST_TWO_RELEASES_pn-libxcb = "5 months"
-RECIPE_LATEST_RELEASE_DATE_pn-libxcb = "Apr 01, 2010"
+RECIPE_TIME_BETWEEN_LAST_TWO_RELEASES_pn-libxcb = "14 months"
+RECIPE_LATEST_RELEASE_DATE_pn-libxcb = "Jan 11, 2012"
 RECIPE_COMMENTS_pn-libxcb = ""
-RECIPE_LAST_UPDATE_pn-libxcb = "Nov 24, 2010"
+RECIPE_LAST_UPDATE_pn-libxcb = "Jan 22, 2012"
 RECIPE_MAINTAINER_pn-libxcb = "Dexuan Cui <dexuan.cui@intel.com>"
 
 RECIPE_STATUS_pn-libxcomposite = "green"
@@ -4608,13 +4613,13 @@ RECIPE_MAINTAINER_pn-libxkbfile = "Dexuan Cui <dexuan.cui@intel.com>"
 
 RECIPE_STATUS_pn-pixman = "green"
 RECIPE_DEPENDENCY_CHECK_pn-pixman = "not done"
-RECIPE_LATEST_VERSION_pn-pixman = "0.24.0"
+RECIPE_LATEST_VERSION_pn-pixman = "0.24.2"
 RECIPE_NO_OF_PATCHES_pn-pixman = "0"
 RECIPE_INTEL_SECTION_pn-pixman = "x11/libs"
-RECIPE_TIME_BETWEEN_LAST_TWO_RELEASES_pn-pixman = "8 days"
-RECIPE_LATEST_RELEASE_DATE_pn-pixman = "Nov 06, 2011"
+RECIPE_TIME_BETWEEN_LAST_TWO_RELEASES_pn-pixman = "2 months"
+RECIPE_LATEST_RELEASE_DATE_pn-pixman = "Jan 18, 2012"
 RECIPE_COMMENTS_pn-pixman = ""
-RECIPE_LAST_UPDATE_pn-pixman = "Nov 30, 2011"
+RECIPE_LAST_UPDATE_pn-pixman = "Jan 22, 2012"
 RECIPE_MAINTAINER_pn-pixman = "Dexuan Cui <dexuan.cui@intel.com>"
 
 RECIPE_STATUS_pn-xtrans = "green"
@@ -4666,12 +4671,12 @@ RECIPE_MAINTAINER_pn-xkeyboard-config = "Dexuan Cui <dexuan.cui@intel.com>"
 RECIPE_STATUS_pn-util-macros = "green"
 DISTRO_PN_ALIAS_pn-util-macros = "Meego=xorg-x11-util-macros Fedora=xorg-x11-util-macros Mandriva=x11-util-macros"
 RECIPE_DEPENDENCY_CHECK_pn-util-macros = "not done"
-RECIPE_LATEST_VERSION_pn-util-macros = "1.16.0"
+RECIPE_LATEST_VERSION_pn-util-macros = "1.16.1"
 RECIPE_INTEL_SECTION_pn-util-macros = "x11/utils"
-RECIPE_TIME_BETWEEN_LAST_TWO_RELEASES_pn-util-macros = "5+ months"
-RECIPE_LATEST_RELEASE_DATE_pn-util-macros = "Dec 07, 2011"
+RECIPE_TIME_BETWEEN_LAST_TWO_RELEASES_pn-util-macros = "1 months"
+RECIPE_LATEST_RELEASE_DATE_pn-util-macros = "Jan 20, 2012"
 RECIPE_COMMENTS_pn-util-macros = ""
-RECIPE_LAST_UPDATE_pn-util-macros = "Dec 30, 2011"
+RECIPE_LAST_UPDATE_pn-util-macros = "Jan 22, 2012"
 RECIPE_MAINTAINER_pn-util-macros = "Dexuan Cui <dexuan.cui@intel.com>"
 
 RECIPE_STATUS_pn-fontconfig = "green"
-- 
1.7.6



