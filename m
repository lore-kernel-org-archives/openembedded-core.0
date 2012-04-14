Received: from mga01.intel.com ([192.55.52.88])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <sgw@linux.intel.com>) id 1SJ74K-0007To-8x
	for openembedded-core@lists.openembedded.org;
	Sat, 14 Apr 2012 19:47:28 +0200
Received: from fmsmga001.fm.intel.com ([10.253.24.23])
	by fmsmga101.fm.intel.com with ESMTP; 14 Apr 2012 10:38:04 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="4.71,315,1320652800"; d="scan'208";a="141743798"
Received: from unknown (HELO swold-mobl.bigsur.com) ([10.255.12.25])
	by fmsmga001.fm.intel.com with ESMTP; 14 Apr 2012 10:38:04 -0700
From: Saul Wold <sgw@linux.intel.com>
To: openembedded-core@lists.openembedded.org
Date: Sat, 14 Apr 2012 10:38:00 -0700
Message-Id: <ce76c003c9a69966a3c02cc753506a53db346a50.1334424952.git.sgw@linux.intel.com>
X-Mailer: git-send-email 1.7.7.6
In-Reply-To: <cover.1334424952.git.sgw@linux.intel.com>
References: <cover.1334424952.git.sgw@linux.intel.com>
In-Reply-To: <cover.1334424952.git.sgw@linux.intel.com>
References: <cover.1334424952.git.sgw@linux.intel.com>
Subject: [PATCH 1/2] distro_tracking: add some additional DISTRO_ALIASES
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
X-List-Received-Date: Sat, 14 Apr 2012 17:47:28 -0000

ltp
rgb
libksba
stat
directfb-example
libfakekey
builder
core-gtk-directfb
task-core-tools-*
task-self-hosted
sato-screenshot
libxxf86misc
qmmp
portmap

Signed-off-by: Saul Wold <sgw@linux.intel.com>
---
 .../conf/distro/include/distro_tracking_fields.inc |   18 ++++++++++++++++++
 1 files changed, 18 insertions(+), 0 deletions(-)

diff --git a/meta/conf/distro/include/distro_tracking_fields.inc b/meta/conf/distro/include/distro_tracking_fields.inc
index 5676b1a..7c9fc02 100644
--- a/meta/conf/distro/include/distro_tracking_fields.inc
+++ b/meta/conf/distro/include/distro_tracking_fields.inc
@@ -1460,6 +1460,7 @@ RECIPE_PATCH_pn-portmap+no-tcpd-support = "override default build method"
 RECIPE_INTEL_SECTION_pn-portmap = "base utils"
 RECIPE_TIME_BETWEEN_LAST_TWO_RELEASES_pn-portmap = "n/a"
 RECIPE_LATEST_RELEASE_DATE_pn-portmap = "May 01, 2007"
+DISTRO_PN_ALIAS_pn-portmap = "OpenSuSE=portmap"
 RECIPE_COMMENTS_pn-portmap = "most part is under 4-clause BSD, Sun RPC code is under another license, however debian portmap package licenses RPC code under 3-clause BSD. This needs further investigation"
 
 RECIPE_STATUS_pn-grub = "green"
@@ -2057,6 +2058,7 @@ RECIPE_LATEST_VERSION_pn-stat = "3.3"
 RECIPE_LAST_UPDATE_pn-stat = "Dec 30, 2011"
 RECIPE_MANUAL_CHECK_DATE_pn-stat = "Dec 30, 2011"
 RECIPE_MAINTAINER_pn-stat = "Shane Wang <shane.wang@intel.com>"
+DISTRO_PN_ALIAS_pn-stat = "Debian=coreutils Fedora=coreutils"
 
 RECIPE_STATUS_pn-hdparm = "red"
 RECIPE_LATEST_VERSION_pn-hdparm = "9.39"
@@ -4632,6 +4634,7 @@ RECIPE_LATEST_RELEASE_DATE_pn-libxxf86misc = "Nov 21, 2010"
 RECIPE_COMMENTS_pn-libxxf86misc = ""
 RECIPE_LAST_UPDATE_pn-libxxf86misc = "Jan 5, 2011"
 RECIPE_MAINTAINER_pn-libxxf86misc = "Dexuan Cui <dexuan.cui@intel.com>"
+DISTRO_PN_ALIAS_pn-libxxf86misc = "Mandriva=libxxf86misc Fedora=libXxf86misc"
 
 RECIPE_STATUS_pn-libxxf86vm = "green"
 RECIPE_DEPENDENCY_CHECK_pn-libxxf86vm = "not done"
@@ -4855,6 +4858,7 @@ RECIPE_LATEST_VERSION_pn-directfb = "1.5.3"
 RECIPE_LATEST_RELEASE_DATE_pn-direcfb = "Aug 9, 2011"
 RECIPE_LAST_UPDATE_pn-directfb = "Nov 7, 2011"
 RECIPE_MAINTAINER_pn-directfb = "Xiaofeng Yan <xiaofeng.yan@windriver.com>"
+DISTRO_PN_ALIAS_pn-directfb-examples = "Debian=directfb Fedora=directfb"
 
 RECIPE_STATUS_pn-libarchive  = "green"
 RECIPE_LATEST_VERSION_pn-libarchive = "2.8.5"
@@ -5492,6 +5496,7 @@ RECIPE_LATEST_RELEASE_DATE_pn-libfakekey = "Jul 01, 2006"
 RECIPE_COMMENTS_pn-libfakekey = ""
 RECIPE_LAST_UPDATE_pn-libfakekey = "Apr 15, 2008"
 RECIPE_MAINTAINER_pn-libfakekey = "Zhai Edwin <edwin.zhai@intel.com>"
+DISTRO_PN_ALIAS_pn-libfakekey="Meego1.0=libfakekey Debian=libfakekey"
 
 RECIPE_STATUS_pn-libglade = "green"
 DISTRO_PN_ALIAS_pn-libglade = "Meego=libglade2 Fedora=libglade2 OpenSuSE=libglade2 Ubuntu=libglade2 Mandriva=libglade2.0 Debian=libglade2"
@@ -5793,6 +5798,7 @@ RECIPE_LAST_UPDATE_pn-mutter = "Jan 13, 2010"
 RECIPE_MAINTAINER_pn-mutter = "Zhai Edwin <edwin.zhai@intel.com>"
 
 DISTRO_PN_ALIAS_pn-poky-feed-config-opkg = "OE-Core"
+DISTRO_PN_ALIAS_pn-builder = "OE-Core"
 DISTRO_PN_ALIAS_pn-core-image-base = "OE-Core"
 DISTRO_PN_ALIAS_pn-core-image-basic = "OE-Core"
 DISTRO_PN_ALIAS_pn-core-image-core = "OE-Core"
@@ -5817,6 +5823,7 @@ DISTRO_PN_ALIAS_pn-task-core = "OE-Core"
 DISTRO_PN_ALIAS_pn-task-core-apps-x11-pimlico = "OE-Core"
 DISTRO_PN_ALIAS_pn-task-core-basic = "OE-Core"
 DISTRO_PN_ALIAS_pn-task-core-boot = "OE-Core"
+DISTRO_PN_ALIAS_pn-task-core-gtk-directfb = "OE-Core"
 DISTRO_PN_ALIAS_pn-task-core-lsb = "OE-Core"
 DISTRO_PN_ALIAS_pn-task-core-nfs = "OE-Core"
 DISTRO_PN_ALIAS_pn-task-core-qt = "OE-Core"
@@ -5827,9 +5834,14 @@ DISTRO_PN_ALIAS_pn-task-core-ssh-openssh = "OE-Core"
 DISTRO_PN_ALIAS_pn-task-core-standalone-gmae-sdk-target = "OE-Core"
 DISTRO_PN_ALIAS_pn-task-core-standalone-sdk-target = "OE-Core"
 DISTRO_PN_ALIAS_pn-task-core-tools = "OE-Core"
+DISTRO_PN_ALIAS_pn-task-core-tools-debug = "OE-Core"
+DISTRO_PN_ALIAS_pn-task-core-tools-profile = "OE-Core"
+DISTRO_PN_ALIAS_pn-task-core-tools-testapps = "OE-Core"
 DISTRO_PN_ALIAS_pn-task-core-x11-sato = "OE-Core"
+DISTRO_PN_ALIAS_pn-task-core-x11-mini = "OE-Core"
 DISTRO_PN_ALIAS_pn-task-qt4e = "OE-Core"
 DISTRO_PN_ALIAS_pn-task-qte-toolchain-host-natives = "OE-Core"
+DISTRO_PN_ALIAS_pn-task-self-hosted = "OE-Core"
 DISTRO_PN_ALIAS_pn-initramfs-boot = "OE-Core"
 DISTRO_PN_ALIAS_pn-initramfs-live-boot = "OE-Core"
 DISTRO_PN_ALIAS_pn-initramfs-live-install = "OE-Core"
@@ -5865,6 +5877,7 @@ DISTRO_PN_ALIAS_pn-matchbox-wm = "OpenedHand"
 DISTRO_PN_ALIAS_pn-oh-puzzles = "OpenedHand"
 DISTRO_PN_ALIAS_pn-owl-video = "OpenedHand"
 DISTRO_PN_ALIAS_pn-sato-icon-theme = "OpenedHand"
+DISTRO_PN_ALIAS_pn-sato-screenshot = "OpenedHand"
 DISTRO_PN_ALIAS_pn-screenshot = "OpenedHand"
 DISTRO_PN_ALIAS_pn-web-webkit = "OpenedHand"
 DISTRO_PN_ALIAS_pn-xcursor-transparent-theme = "OpenedHand"
@@ -6060,6 +6073,7 @@ RECIPE_LATEST_VERSION_pn-qmmp = "0.5.2"
 RECIPE_LATEST_RELEASE_DATE_pn-qmmp = "Sep 02, 2011"
 RECIPE_LAST_UPDATE_pn-qmmp = "Nov 7, 2011"
 RECIPE_MAINTAINER_pn-qmmp = "Xiaofeng Yan <xiaofeng.yan@windriver.com>"
+DISTRO_PN_ALIAS_pn-qmmp = "Fedora=qmmp"
 
 RECIPE_LATEST_VERSION_pn-texinfo = "4.13a"
 RECIPE_LATEST_RELEASE_DATE_pn-texinfo = "Sep 22, 2008"
@@ -6359,6 +6373,10 @@ RECIPE_NO_OF_PATCHES_pn-ltp = "0"
 RECIPE_LAST_UPDATE_pn-ltp = "Dec 22, 2011"
 RECIPE_MANUAL_CHECK_DATE_pn-ltp = "Mar 13, 2012"
 RECIPE_MAINTAINER_pn-ltp = "Jiajun Xu <jiajun.xu@intel.com>"
+DISTRO_PN_ALIAS_pn-ltp = "Ubuntu=ltp"
+
+DISTRO_PN_ALIAS_pn-rgb = "Fedora=xorg-X11-server-utils Debian=x11-xserver-utils"
+DISTRO_PN_ALIAS_pn-libksba = "Fedora=libksba Debian=libksba8"
 
 DISTRO_PN_ALIAS_pn-qt4-native = "Fedora=qt4 Debian=qt4-dev-tools"
 DISTRO_PN_ALIAS_pn-update-alternatives-dpkg = "Opensuse=update-alternatives Mandriva=update-alternatives"
-- 
1.7.7.6



