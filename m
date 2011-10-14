Received: from mga11.intel.com ([192.55.52.93])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <sgw@linux.intel.com>) id 1REaUI-0002Sz-T2
	for openembedded-core@lists.openembedded.org;
	Fri, 14 Oct 2011 07:39:20 +0200
Received: from fmsmga001.fm.intel.com ([10.253.24.23])
	by fmsmga102.fm.intel.com with ESMTP; 13 Oct 2011 22:33:28 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="4.69,344,1315206000"; d="scan'208";a="73540438"
Received: from unknown (HELO swold-mobl.bigsur.com) ([10.255.15.120])
	by fmsmga001.fm.intel.com with ESMTP; 13 Oct 2011 22:33:28 -0700
From: Saul Wold <sgw@linux.intel.com>
To: openembedded-core@lists.openembedded.org
Date: Thu, 13 Oct 2011 22:33:00 -0700
Message-Id: <148327c445d75a599c6c13b98026ff7dfe7eb670.1318570250.git.sgw@linux.intel.com>
X-Mailer: git-send-email 1.7.6.2
In-Reply-To: <cover.1318570250.git.sgw@linux.intel.com>
References: <cover.1318570250.git.sgw@linux.intel.com>
In-Reply-To: <cover.1318570250.git.sgw@linux.intel.com>
References: <cover.1318570250.git.sgw@linux.intel.com>
Subject: [CONSOLIDATED PULL 02/28] distro_tracking_fields: Updates
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
X-List-Received-Date: Fri, 14 Oct 2011 05:39:20 -0000

Signed-off-by: Saul Wold <sgw@linux.intel.com>
---
 .../conf/distro/include/distro_tracking_fields.inc |   25 +++++++++++++++----
 1 files changed, 19 insertions(+), 6 deletions(-)

diff --git a/meta/conf/distro/include/distro_tracking_fields.inc b/meta/conf/distro/include/distro_tracking_fields.inc
index b07209e..4b46c15 100644
--- a/meta/conf/distro/include/distro_tracking_fields.inc
+++ b/meta/conf/distro/include/distro_tracking_fields.inc
@@ -421,14 +421,14 @@ RECIPE_COMMENTS_pn-readline = ""
 RECIPE_MANUAL_CHECK_DATE_pn-readline = "Sep 27, 2011"
 
 RECIPE_STATUS_pn-libgcrypt = "green"
-RECIPE_LAST_UPDATE_pn-libgcrypt = "Jul 29, 2010"
+RECIPE_LATEST_VERSION_pn-libgcrypt = "1.5.0"
+RECIPE_LATEST_RELEASE_DATE_pn-libgcrypt = "Jun 6, 2011"
+RECIPE_LAST_UPDATE_pn-libgcrypt = "Oct 10, 2011"
 RECIPE_MAINTAINER_pn-libgcrypt = "Saul Wold <sgw@linux.intel.com>"
 RECIPE_DEPENDENCY_CHECK_pn-libgcrypt = "not done"
-RECIPE_LATEST_VERSION_pn-libgcrypt = "1.4.5"
 RECIPE_PATCH_pn-libgcrypt+add-pkgconfig-support = "add .pc file"
 RECIPE_INTEL_SECTION_pn-libgcrypt = "base libs"
 RECIPE_TIME_BETWEEN_LAST_TWO_RELEASES_pn-libgcrypt = "11 months"
-RECIPE_LATEST_RELEASE_DATE_pn-libgcrypt = "12/2009"
 RECIPE_COMMENTS_pn-libgcrypt = ""
 
 RECIPE_STATUS_pn-gnutls = "yellow"   # need explict pre configure
@@ -5635,7 +5635,6 @@ RECIPE_STATUS_pn-desktop-file-utils-native = "red"
 RECIPE_STATUS_pn-dtc = "red"
 RECIPE_STATUS_pn-gcalctool = "red"
 RECIPE_STATUS_pn-swabber = "red"
-RECIPE_STATUS_pn-mc = "red"
 RECIPE_STATUS_pn-man = "red"
 RECIPE_STATUS_pn-man-pages = "red"
 RECIPE_STATUS_pn-guilt-native = "red"
@@ -5718,9 +5717,11 @@ RECIPE_LATEST_VERSION_pn-dtc = "37c0b6a0916c31a5eae0a9ddfcc5d0b8fb4569c6"
 RECIPE_LATEST_VERSION_pn-bind = "9.7.2-P3"
 RECIPE_NO_UPDATE_REASON_pn-bind = "Latest Stable version, newer versions are Alpha/Beta"
 RECIPE_LATEST_VERSION_pn-man = "1.6f"
-RECIPE_LATEST_VERSION_pn-mc = "4.7.5-pre1"
+
+RECIPE_STATUS_pn-mc = "red"
+RECIPE_LATEST_VERSION_pn-mc = "4.8.0-pre2"
 RECIPE_MAINTAINER_pn-mc = "Saul Wold <sgw@linux.intel.com>"
-RECIPE_NO_UPDATE_REASON_pn-bind = "Latest Stable version, 4.7.5-pre1 is Alpha/Beta"
+RECIPE_NO_UPDATE_REASON_pn-mc = "4.7.5.5 is latest stable version, 4.8.0-pre2 is Alpha/Beta"
 
 RECIPE_STATUS_pn-sgml-common = "green"
 RECIPE_DEPENDENCY_CHECK_pn-sgml-common = "not done"
@@ -5907,20 +5908,32 @@ RECIPE_MANUAL_CHECK_DATE_pn-pseudo = "Jun 06, 2011"
 DISTRO_PN_ALIAS_pn-pseudo = "Windriver"
 
 DISTRO_PN_ALIAS_pn-btrfs-tools = "Debian=btrfs-tools Fedora=btrfs-progs"
+RECIPE_MAINTAINER_pn-btrfs-tools = "Nitin A Kamble <nitin.a.kamble@intel.com>"
+
 DISTRO_PN_ALIAS_pn-rt-tests = "Debian=rt-tests Ubuntu=rt-tests"
+RECIPE_MAINTAINER_pn-rt-tests = "Darren Hart <dvhart@linux.intel.com>"
+
 DISTRO_PN_ALIAS_pn-xserver-xorg-lite = "Fedora=xorg-x11-server Ubuntu=xserver-xorg"
 DISTRO_PN_ALIAS_pn-xserver-xorg = "Fedora=xorg-x11-server Ubuntu=xserver-xorg"
+DISTRO_PN_ALIAS_pn-xserver-xf86-lite = "Fedora=xorg-x11-server Ubuntu=xserver-xorg"
+DISTRO_PN_ALIAS_pn-xserver-xf86-dri-lite = "Fedora=xorg-x11-server Ubuntu=xserver-xorg"
 DISTRO_PN_ALIAS_pn-xserver-kdrive = "Fedora=xorg-x11-server Ubuntu=xserver-xorg"
 DISTRO_PN_ALIAS_pn-dtc = "Fedora=dtc Ubuntu=dtc"
 DISTRO_PN_ALIAS_pn-dtc-native = "Fedora=dtc Ubuntu=dtc"
 DISTRO_PN_ALIAS_pn-gail = "Fedora=gail Ubuntu=libgail-3-0"
+
 DISTRO_PN_ALIAS_pn-linux-yocto = "Debian=linux-base Ubuntu=linux"
+RECIPE_MAINTAINER_pn-linux-yocto = "Darren Hart <dvhart@linux.intel.com>"
+
 DISTRO_PN_ALIAS_pn-linux-yocto-rt = "Debian=linux-base Ubuntu=linux"
+RECIPE_MAINTAINER_pn-linux-yocto-rt = "Darren Hart <dvhart@linux.intel.com>"
+
 DISTRO_PN_ALIAS_pn-libsdl = "Fedora=SDL Opensuse=SDL"
 DISTRO_PN_ALIAS_pn-lame = "Debian=lame Ubuntu=lame"
 DISTRO_PN_ALIAS_pn-libiconv = "Fedora=mingw-libiconv Opensuse=cross-mingw-libiconv"
 DISTRO_PN_ALIAS_pn-qt4-native = "Fedora=qt4 Debian=qt4-dev-tools"
 DISTRO_PN_ALIAS_pn-update-alternatives-dpkg = "Opensuse=update-alternatives Mandriva=update-alternatives"
+RECIPE_MAINTAINER_pn-update-alternatives-dpkg = "Dongxiao Xu <dongxiao.xu@intel.com"
 DISTRO_PN_ALIAS_pn-emgd-driver-bin = "Intel"
 DISTRO_PN_ALIAS_pn-external-csl-toolchain = "OE-Core"
 DISTRO_PN_ALIAS_pn-external-poky-toolchain = "OE-Core"
-- 
1.7.6.2



