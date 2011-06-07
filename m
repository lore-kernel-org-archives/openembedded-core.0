Received: from mga03.intel.com ([143.182.124.21])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <sgw@linux.intel.com>) id 1QTqLj-0003is-VU
	for openembedded-core@lists.openembedded.org;
	Tue, 07 Jun 2011 09:05:16 +0200
Received: from azsmga001.ch.intel.com ([10.2.17.19])
	by azsmga101.ch.intel.com with ESMTP; 07 Jun 2011 00:01:56 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="4.65,331,1304319600"; 
   d="scan'208";a="8299032"
Received: from unknown (HELO swold-MOBL.bigsur.com) ([10.255.13.99])
	by azsmga001.ch.intel.com with ESMTP; 07 Jun 2011 00:01:56 -0700
From: Saul Wold <sgw@linux.intel.com>
To: openembedded-core@lists.openembedded.org
Date: Tue,  7 Jun 2011 00:01:48 -0700
Message-Id: <9b9c6277309766ef53273d4682b70302cd199ceb.1307429530.git.sgw@linux.intel.com>
X-Mailer: git-send-email 1.7.3.4
In-Reply-To: <cover.1307429530.git.sgw@linux.intel.com>
References: <cover.1307429530.git.sgw@linux.intel.com>
In-Reply-To: <cover.1307429530.git.sgw@linux.intel.com>
References: <cover.1307429530.git.sgw@linux.intel.com>
Subject: [CONSOLIDATED PULL 12/13] distro tracking: fixup some bad entries
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
X-List-Received-Date: Tue, 07 Jun 2011 07:05:16 -0000

Signed-off-by: Saul Wold <sgw@linux.intel.com>
---
 .../conf/distro/include/distro_tracking_fields.inc |   35 +++++++++-----------
 1 files changed, 16 insertions(+), 19 deletions(-)

diff --git a/meta/conf/distro/include/distro_tracking_fields.inc b/meta/conf/distro/include/distro_tracking_fields.inc
index f1fded2..19bb1d5 100644
--- a/meta/conf/distro/include/distro_tracking_fields.inc
+++ b/meta/conf/distro/include/distro_tracking_fields.inc
@@ -1354,8 +1354,7 @@ RECIPE_PATCH_pn-portmap+no-tcpd-support = "override default build method"
 RECIPE_INTEL_SECTION_pn-portmap = "base utils"
 RECIPE_TIME_BETWEEN_LAST_TWO_RELEASES_pn-portmap = "n/a"
 RECIPE_LATEST_RELEASE_DATE_pn-portmap = "05/2007"
-RECIPE_COMMENTS_pn-portmap = "most part is under 4-clause BSD, Sun RPC code is under another license, \
-however debian portmap package licenses RPC code under 3-clause BSD. This needs further investigation"
+RECIPE_COMMENTS_pn-portmap = "most part is under 4-clause BSD, Sun RPC code is under another license, however debian portmap package licenses RPC code under 3-clause BSD. This needs further investigation"
 
 RECIPE_STATUS_pn-grub = "green"
 RECIPE_LAST_UPDATE_pn-grub = "Oct 8, 2008"
@@ -1580,8 +1579,7 @@ RECIPE_LATEST_VERSION_pn-hal = "0.5.14"
 RECIPE_INTEL_SECTION_pn-hal = "base utils"
 RECIPE_TIME_BETWEEN_LAST_TWO_RELEASES_pn-hal = "4 months"
 RECIPE_LATEST_RELEASE_DATE_pn-hal = "11/2009"
-RECIPE_COMMENTS_pn-hal = "The licensing is very complicated, Most files are GPLv2+ | AFL \
-with some borrowed code under LGPLv2.1, AFL itself is incompatible with GPL/LGPL"
+RECIPE_COMMENTS_pn-hal = "The licensing is very complicated, Most files are GPLv2+ | AFL with some borrowed code under LGPLv2.1, AFL itself is incompatible with GPL/LGPL"
 
 RECIPE_STATUS_pn-hal-info = "green"
 RECIPE_LAST_UPDATE_pn-hal-info = "Jul 20, 2010"
@@ -2876,7 +2874,7 @@ RECIPE_MAINTAINER_pn-gcc = "Nitin A Kamble <nitin.a.kamble@intel.com>"
 RECIPE_STATUS_pn-autoconf="red" 
 RECIPE_LATEST_VERSION_pn-autoconf="2.68"
 RECIPE_LAST_UPDATE_pn-autoconf = "Jan 29, 2010"
-RECIPE_NO_UPDATE_REASON_autoconf="seeing rpm issue with the 2.68 version, a bug is open"
+RECIPE_NO_UPDATE_REASON_pn-autoconf="seeing rpm issue with the 2.68 version, a bug is open"
 RECIPE_MAINTAINER_pn-autoconf = "Nitin A Kamble <nitin.a.kamble@intel.com>"
 
 RECIPE_STATUS_pn-automake="green" 
@@ -3056,7 +3054,6 @@ RECIPE_LATEST_VERSION_pn-byacc="20101229"
 RECIPE_MAINTAINER_pn-byacc = "Nitin A Kamble <nitin.a.kamble@intel.com>"
 
 RECIPE_STATUS_pn-libconvert-asn1-perl="green" 
-# 0.22 version does not build, so created a recipe for version 0.21
 RECIPE_LATEST_VERSION_pn-libconvert-asn1-perl="0.22"
 RECIPE_NO_UPDATE_REASON_pn-libconvert-asn1-perl = "0.22 version does not build, so created a recipe for version 0.21"
 RECIPE_LAST_UPDATE_pn-libconvert-asn1-perl = "Aug 13, 2010"
@@ -3552,7 +3549,7 @@ DISTRO_PN_ALIAS_pn-xf86-video-vesa = "Debian=xserver-xorg-video-vesa Fedora=xorg
 
 RECIPE_STATUS_pn-cairo="green" # no update needed
 RECIPE_LATEST_VERSION_pn-cairo="1.9.10"
-ECIPE_NO_UPDATE_REASON_cairo="latest version is not stable release"
+RECIPE_NO_UPDATE_REASON_pn-cairo="latest version is not stable release"
 RECIPE_NO_OF_PATCHES_pn-cairo="1"
 RECIPE_TIME_BETWEEN_LAST_TWO_RELEASES_pn-cairo="1 monthes"
 RECIPE_LATEST_RELEASE_DATE_pn-cairo="2010/02/20"
@@ -3563,16 +3560,16 @@ RECIPE_MAINTAINER_pn-cairo="Yu Ke <ke.yu@intel.com>"
 RECIPE_STATUS_pn-xserver-nodm-init="green" # no update needed
 RECIPE_LATEST_VERSION_pn-xserver-nodm-init="1.0"
 RECIPE_NO_OF_PATCHES_pn-xserver-nodm-init="0"
-#RECIPE_TIME_BETWEEN_LAST_TWO_RELEASES_pn-xserver-nodm-init=""
-#RECIPE_LATEST_RELEASE_DATE_pn-xserver-nodm-init=""
+RECIPE_TIME_BETWEEN_LAST_TWO_RELEASES_pn-xserver-nodm-init=""
+RECIPE_LATEST_RELEASE_DATE_pn-xserver-nodm-init=""
 RECIPE_INTEL_SECTION_pn-xserver-nodm-init="graphic core"
 RECIPE_MAINTAINER_pn-xserver-nodm-init="Yu Ke <ke.yu@intel.com>"
 
 RECIPE_STATUS_pn-xserver-xf86-config="green" # no update needed
 RECIPE_LATEST_VERSION_pn-xserver-xf86-config="0.1"
 RECIPE_NO_OF_PATCHES_pn-xserver-xf86-config="0"
-#RECIPE_TIME_BETWEEN_LAST_TWO_RELEASES_pn-xserver-xf86-config=""
-#RECIPE_LATEST_RELEASE_DATE_pn-xserver-xf86-config=""
+RECIPE_TIME_BETWEEN_LAST_TWO_RELEASES_pn-xserver-xf86-config=""
+RECIPE_LATEST_RELEASE_DATE_pn-xserver-xf86-config=""
 RECIPE_INTEL_SECTION_pn-xserver-xf86-config="graphic core"
 RECIPE_LAST_UPDATE_pn-xserver-xf86-config = "May 31, 2009"
 RECIPE_MAINTAINER_pn-xserver-xf86-config="Yu Ke <ke.yu@intel.com>"
@@ -4708,7 +4705,7 @@ RECIPE_MAINTAINER_pn-libxprintutil = "Dexuan Cui <dexuan.cui@intel.com>"
 
 RECIPE_STATUS_pn-libxscrnsaver = "green"
 DISTRO_PN_ALIAS_pn-libxscrnsaver = "Fedora=libXScrnSaver Ubuntu=libxss1 Mandriva=libxscrnsaver"
-DEPENDENCY_CHECK_pn-libxscrnsaver = "not done"
+RECIPE_DEPENDENCY_CHECK_pn-libxscrnsaver = "not done"
 RECIPE_LATEST_VERSION_pn-libxscrnsaver = "1.2.1"
 RECIPE_NO_OF_PATCHES_pn-libxscrnsaver = "0"
 RECIPE_INTEL_SECTION_pn-libxscrnsaver = "x11/libs"
@@ -4731,7 +4728,7 @@ RECIPE_MAINTAINER_pn-libxtrap = "Dexuan Cui <dexuan.cui@intel.com>"
 
 RECIPE_STATUS_pn-xproxymanagementprotocol = "green"
 DISTRO_PN_ALIAS_pn-xproxymanagementprotocol = "Meego=xorg-x11-proto-xproxymanagementprotocol"
-DEPENDENCY_CHECK_pn-xproxymanagementprotocol = "not done"
+RECIPE_DEPENDENCY_CHECK_pn-xproxymanagementprotocol = "not done"
 RECIPE_LATEST_VERSION_pn-xproxymanagementprotocol = "1.0.3"
 RECIPE_NO_OF_PATCHES_pn-xproxymanagementprotocol = "0"
 RECIPE_INTEL_SECTION_pn-xproxymanagementprotocol = "x11/libs"
@@ -5699,12 +5696,12 @@ RECIPE_MAINTAINER_pn-linuxdoc-tools = "Scott Garman <scott.a.garman@intel.com>"
 RECIPE_STATUS_pn-slang = "green"
 RECIPE_LATEST_VERSION_pn-slang = "2.2.4"
 RECIPE_LAST_UPDATE_pn-slang = "Apr 10, 2011"
-RECIPE_MANUAL_CHECK_DATE_pn-slang = "June 6, 2011"
+RECIPE_MANUAL_CHECK_DATE_pn-slang = "Jun 6, 2011"
 
 RECIPE_STATUS_pn-libnewt = "green"
 RECIPE_LATEST_VERSION_pn-libnewt = "0.52.12"
 RECIPE_LAST_UPDATE_pn-libnewt = "Aug 06, 2010"
-RECIPE_MANUAL_CHECK_DATE_pn-libnewt = "June 4, 2011"
+RECIPE_MANUAL_CHECK_DATE_pn-libnewt = "Jun 4, 2011"
 RECIPE_NO_UPDATE_REASON_pn-libnewt = ""
 
 RECIPE_STATUS_pn-createrepo = "green"
@@ -5739,14 +5736,14 @@ RECIPE_MAINTAINER_pn-rxvt-unicode = "Saul Wold <sgw@linux.intel.com>"
 RECIPE_STATUS_pn-alsa-tools = "red"
 RECIPE_LATEST_VERIONS_pn-alsa-tools = "1.0.24.1
 RECIPE_LAST_UPDATE_pn-alsa-tools = "Jan 31, 2011"
-RECIPE_MANUAL_CHECK_DATE_pn-alsa-tools = "June 7, 2011" 
+RECIPE_MANUAL_CHECK_DATE_pn-alsa-tools = "Jun 7, 2011" 
 
 RECIPE_STATUS_pn-mesa-demos = "red"
 RECIPE_LATEST_VERSION_pn-mesa-demos = "8.0.1"
 RECIPE_LAST_UPDATE_pn-mesa-demos = "July 13, 2010"
-RECIPE_MANUAL_CHECK_DATE_pn-mesa-demos = "June 7, 2011" 
+RECIPE_MANUAL_CHECK_DATE_pn-mesa-demos = "Jun 7, 2011" 
 
 RECIPE_STATUS_pn-gettext = "red"
 RECIPE_LATEST_VERSION_pn-gettext = "0.18.1.1"
-RECIPE_LAST_UPDATE_pn-gettext = "June 6, 2010"
-RECIPE_MANUAL_CHECK_DATE_pn-gettext = "June 7, 2011" 
+RECIPE_LAST_UPDATE_pn-gettext = "Jun 6, 2010"
+RECIPE_MANUAL_CHECK_DATE_pn-gettext = "Jun 7, 2011" 
-- 
1.7.3.4



