Received: from mga03.intel.com ([143.182.124.21])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <sgw@linux.intel.com>) id 1R42Uv-0001UW-8W
	for openembedded-core@lists.openembedded.org;
	Thu, 15 Sep 2011 05:20:21 +0200
Received: from azsmga002.ch.intel.com ([10.2.17.35])
	by azsmga101.ch.intel.com with ESMTP; 14 Sep 2011 20:15:07 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="4.68,384,1312182000"; d="scan'208";a="17264349"
Received: from unknown (HELO swold-mobl.bigsur.com) ([10.255.14.252])
	by AZSMGA002.ch.intel.com with ESMTP; 14 Sep 2011 20:15:07 -0700
From: Saul Wold <sgw@linux.intel.com>
To: openembedded-core@lists.openembedded.org
Date: Wed, 14 Sep 2011 20:14:53 -0700
Message-Id: <fccfd53e7bbc8add7cad10e61998771a7566dcdd.1316056194.git.sgw@linux.intel.com>
X-Mailer: git-send-email 1.7.6
In-Reply-To: <cover.1316056194.git.sgw@linux.intel.com>
References: <cover.1316056194.git.sgw@linux.intel.com>
In-Reply-To: <cover.1316056194.git.sgw@linux.intel.com>
References: <cover.1316056194.git.sgw@linux.intel.com>
Subject: [RC2 PULL 04/13] distro_tracking_field: add distro checking field
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
X-List-Received-Date: Thu, 15 Sep 2011 03:20:21 -0000

From: Yu Ke <ke.yu@intel.com>

add the missing distro checking field for some recipes

Signed-off-by: Yu Ke <ke.yu@intel.com>
---
 .../conf/distro/include/distro_tracking_fields.inc |   13 +++++++++++++
 1 files changed, 13 insertions(+), 0 deletions(-)

diff --git a/meta/conf/distro/include/distro_tracking_fields.inc b/meta/conf/distro/include/distro_tracking_fields.inc
index 6f1a462..a7fc011 100644
--- a/meta/conf/distro/include/distro_tracking_fields.inc
+++ b/meta/conf/distro/include/distro_tracking_fields.inc
@@ -1811,6 +1811,7 @@ RECIPE_STATUS_pn-mktemp="red"
 RECIPE_LAST_UPDATE_pn-mktemp = "Jul 29, 2010"
 RECIPE_MAINTAINER_pn-mktemp="Yu Ke <ke.yu@intel.com>"
 RECIPE_LATEST_VERSION_pn-mktemp="1.7"
+DISTRO_PN_ALIAS_pn-mktemp = "Mandriva=mktemp Fedora=mktemp"
 
 RECIPE_STATUS_pn-iputils="red"
 RECIPE_LAST_UPDATE_pn-iputils = "Jul 29, 2010"
@@ -2917,6 +2918,7 @@ RECIPE_STATUS_pn-distcc="green"
 RECIPE_LATEST_VERSION_pn-distcc="2.18.3"
 RECIPE_LAST_UPDATE_pn-distcc = "Oct 28, 2006"
 RECIPE_MAINTAINER_pn-distcc = "Nitin A Kamble <nitin.a.kamble@intel.com>"
+DISTRO_PN_ALIAS_pn-distcc = "Debian=distcc Fedora=distcc"
 
 RECIPE_STATUS_pn-flex="green" 
 RECIPE_LATEST_VERSION_pn-flex="2.5.35"
@@ -3404,6 +3406,7 @@ RECIPE_LATEST_RELEASE_DATE_pn-imake = "2010/04/16"
 RECIPE_INTEL_SECTION_pn-imake = "graphic app"
 RECIPE_LAST_UPDATE_pn-imake = "Nov 21, 2010"
 RECIPE_MAINTAINER_pn-imake = "Yu Ke <ke.yu@intel.com>"
+DISTRO_PN_ALIAS_pn-imake = "Mandriva=xutils Ubuntu=xutils"
 
 RECIPE_STATUS_pn-qt4-tools-native = "green" # no update needed
 RECIPE_LATEST_VERSION_pn-qt4-tools-native = "4.7.3"
@@ -3543,6 +3546,7 @@ RECIPE_LATEST_RELEASE_DATE_pn-libxfontcache="2009/10/08"
 RECIPE_INTEL_SECTION_pn-libxfontcache="graphic core"
 RECIPE_LAST_UPDATE_pn-libxfontcache = "Jun 23, 2010"
 RECIPE_MAINTAINER_pn-libxfontcache="Yu Ke <ke.yu@intel.com>"
+DISTRO_PN_ALIAS_pn-libxfontcache = "Mandriva=libxfontcache Debian=libxfontcache"
 
 RECIPE_STATUS_pn-xf86-input-evdev="green" # no update needed
 DISTRO_PN_ALIAS_pn-xf86-input-evdev = "Ubuntu=xserver-xorg-input-evdev Mandriva=x11-driver-input-evdev Debian=xserver-xorg-input-evdev Fedora=xorg-x11-drv-evdev Meego=xorg-x11-drv-evdev"
@@ -3618,6 +3622,9 @@ RECIPE_LATEST_RELEASE_DATE_pn-mesa-dri="2010/06/17"
 RECIPE_INTEL_SECTION_pn-mesa-dri="graphic core"
 RECIPE_LAST_UPDATE_pn-mesa-dri = "Jan 18, 2011"
 RECIPE_MAINTAINER_pn-mesa-dri="Yu Ke <ke.yu@intel.com>"
+DISTRO_PN_ALIAS_pn-mesa-dri = "Fedora=mesa Ubuntu=libgl1-mesa-dri"
+
+DISTRO_PN_ALIAS_pn-mesa-xlib = "Fedora=mesa Ubuntu=libgl1-mesa-swx11"
 
 RECIPE_STATUS_pn-mesa-dri-glsl-native="green" # no update needed
 RECIPE_LATEST_VERSION_pn-mesa-dri-glsl-native="7.8.2"
@@ -5792,3 +5799,9 @@ RECIPE_LAST_UPDATE_pn-pseudo = "Jun 06, 2011"
 RECIPE_MAINTAINER_pn-pseudo = "Mark Hatle <mark.hatle@windriver.com>"
 RECIPE_COMMENTS_pn-pseudo = "Yocto Project maintained"
 RECIPE_MANUAL_CHECK_DATE_pn-pseudo = "Jun 06, 2011" 
+
+DISTRO_PN_ALIAS_pn-btrfs-tools = "Debian=btrfs-tools Fedora=btrfs-progs"
+DISTRO_PN_ALIAS_pn-rt-tests = "Debian=rt-tests Ubuntu =rt-tests"
+DISTRO_PN_ALIAS_pn-xserver-xf86-lite = "Fedora=xorg-x11-server Ubuntu=xserver-xorg"
+DISTRO_PN_ALIAS_pn-xserver-xf86-dri-lite = "Fedora=xorg-x11-server Ubuntu=xserver-xorg"
+DISTRO_PN_ALIAS_pn-xserver-kdrive = "Fedora=xorg-x11-server Ubuntu=xserver-xorg"
-- 
1.7.6



