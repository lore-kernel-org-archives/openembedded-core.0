Received: from mga02.intel.com ([134.134.136.20])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <sgw@linux.intel.com>) id 1R6JMR-0008DS-Ot
	for openembedded-core@lists.openembedded.org;
	Wed, 21 Sep 2011 11:45:00 +0200
Received: from orsmga002.jf.intel.com ([10.7.209.21])
	by orsmga101.jf.intel.com with ESMTP; 21 Sep 2011 02:39:39 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="4.67,351,1309762800"; d="scan'208";a="51195254"
Received: from unknown (HELO swold-mobl.bigsur.com) ([10.255.14.170])
	by orsmga002.jf.intel.com with ESMTP; 21 Sep 2011 02:39:38 -0700
From: Saul Wold <sgw@linux.intel.com>
To: openembedded-core@lists.openembedded.org
Date: Wed, 21 Sep 2011 02:39:23 -0700
Message-Id: <b3d3c3a2df29ce43f732234d5da799e3d517e736.1316597628.git.sgw@linux.intel.com>
X-Mailer: git-send-email 1.7.6
In-Reply-To: <cover.1316597628.git.sgw@linux.intel.com>
References: <cover.1316597628.git.sgw@linux.intel.com>
In-Reply-To: <cover.1316597628.git.sgw@linux.intel.com>
References: <cover.1316597628.git.sgw@linux.intel.com>
Subject: [RC Fixes 07/19] distro tracking: Update Distro Aliases
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
X-List-Received-Date: Wed, 21 Sep 2011 09:45:00 -0000

Signed-off-by: Saul Wold <sgw@linux.intel.com>
---
 .../conf/distro/include/distro_tracking_fields.inc |   83 +++++++++++++++++++-
 1 files changed, 81 insertions(+), 2 deletions(-)

diff --git a/meta/conf/distro/include/distro_tracking_fields.inc b/meta/conf/distro/include/distro_tracking_fields.inc
index b150af8..7ff233c 100644
--- a/meta/conf/distro/include/distro_tracking_fields.inc
+++ b/meta/conf/distro/include/distro_tracking_fields.inc
@@ -613,6 +613,7 @@ RECIPE_MAINTAINER_pn-libzypp = "Mark Hatle <mark.hatle@windriver.com>"
 RECIPE_LATEST_VERSION_pn-libzypp = "git"
 RECIPE_INTEL_SECTION_pn-libzypp = "base libs"
 RECIPE_COMMENTS_pn-libzypp = ""
+DISTRO_PN_ALIAS_pn-libzypp = "OpenSuse=libzypp Meego=libzypp"
 
 RECIPE_STATUS_pn-dbus-wait = "green"
 RECIPE_DEPENDENCY_CHECK_pn-dbus-wait = "not done"
@@ -743,6 +744,8 @@ RECIPE_COMMENTS_pn-opkg = ""
 RECIPE_LAST_UPDATE_pn-opkg = "Jul 21, 2010"
 RECIPE_MANUAL_CHECK_DATE_pn-opkg = "Jun 29, 2011"
 RECIPE_MAINTAINER_pn-opkg = "Dongxiao Xu <dongxiao.xu@intel.com"
+DISTRO_PN_ALIAS_pn-opkg = "OSPDT upstream=http://svn.openmoko.org/trunk/src/tar"
+
 
 RECIPE_STATUS_pn-opkg_nogpg = "green"
 RECIPE_DEPENDENCY_CHECK_pn-opkg_nogpg = "not done"
@@ -753,6 +756,8 @@ RECIPE_LATEST_RELEASE_DATE_pn-opkg_nogpg = "02/2010"
 RECIPE_COMMENTS_pn-opkg_nogpg = ""
 RECIPE_LAST_UPDATE_pn-opkg_nogpg = "Jul 21, 2010"
 RECIPE_MAINTAINER_pn-opkg_nogpg = "Dongxiao Xu <dongxiao.xu@intel.com"
+DISTRO_PN_ALIAS_pn-opkg_nogpg = "OSPDT upstream=http://svn.openmoko.org/trunk/s
+
 
 RECIPE_STATUS_pn-dpkg = "green"
 RECIPE_LATEST_VERSION_pn-dpkg = "1.16.0.3"
@@ -1051,6 +1056,7 @@ RECIPE_TIME_BETWEEN_LAST_TWO_RELEASES_pn-shadow = "7 months"
 RECIPE_LATEST_RELEASE_DATE_pn-shadow = "Feb 15, 2011"
 RECIPE_LAST_UPDATE_pn-shadow = "Jun 4, 2011"
 RECIPE_MAINTAINER_pn-shadow = "Scott Garman <scott.a.garman@intel.com>"
+DISTRO_PN_ALIAS_pn-shadow-sysroot = "Ubuntu=shadow Fedora=shadow"
 
 RECIPE_STATUS_pn-coreutils = "green"
 RECIPE_LAST_UPDATE_pn-coreutils = "Jul 2, 2011"
@@ -1151,6 +1157,7 @@ RECIPE_LATEST_RELEASE_DATE_pn-libgdbus = "09/2008"
 RECIPE_TIME_BETWEEN_LAST_TWO_RELEASES_pn-libgdbus = "unknown"
 RECIPE_LAST_UPDATE_pn-libgdbus = "Jan 4, 2011"
 RECIPE_MAINTAINER_pn-libgdbus = "Scott Garman <scott.a.garman@intel.com>"
+DISTRO_PN_ALIAS_pn-libgdbus = "Intel"
 
 RECIPE_STATUS_pn-apr = "green"
 RECIPE_LATEST_VERSION_pn-apr = "1.4.5"
@@ -1712,6 +1719,8 @@ RECIPE_TIME_BETWEEN_LAST_TWO_RELEASES_pn-tzdata = "1 month"
 RECIPE_LATEST_RELEASE_DATE_pn-tzdata = "05/2010"
 RECIPE_MANUAL_CHECK_DATE_pn-tzdata = "May 24, 2011"
 RECIPE_COMMENTS_pn-tzdata = ""
+DISTRO_PN_ALIAS_pn-tzcode = "OSPDT"
+
 
 RECIPE_STATUS_pn-tinylogin = "yellow"    # replaced, place holder for tracking
 RECIPE_LAST_UPDATE_pn-tinylogin = "Jul 21, 2006"
@@ -1792,6 +1801,7 @@ RECIPE_MAINTAINER_pn-zypper = "Mark Hatle <mark.hatle@windriver.com>"
 RECIPE_LATEST_VERSION_pn-zypper = "git"
 RECIPE_INTEL_SECTION_pn-zypper = "base utils"
 RECIPE_COMMENTS_pn-zypper = ""
+DISTRO_PN_ALIAS_pn-zypper = "OpenSuse=zypper Meego=zypper"
 
 RECIPE_STATUS_pn-sysstat = "green"
 RECIPE_LAST_UPDATE_pn-sysstat = "May 24, 2011"
@@ -2467,10 +2477,12 @@ DISTRO_PN_ALIAS_pn-core-image-sdk = "OE-Core"
 RECIPE_STATUS_pn-task-core-console = "green"
 RECIPE_LATEST_VERSION_pn-task-core-console = "1.0"
 RECIPE_MAINTAINER_pn-task-core-console = "Dongxiao Xu <dongxiao.xu@intel.com>"
+DISTRO_PN_ALIAS_pn-core-console = "OE-Core"
 
 RECIPE_STATUS_pn-task-core-x11 = "green"
 RECIPE_LATEST_VERSION_pn-task-core-x11 = "1.0"
 RECIPE_MAINTAINER_pn-task-core-x11 = "Dongxiao Xu <dongxiao.xu@intel.com>"
+DISTRO_PN_ALIAS_pn-core-x11 = "OE-Core"
 
 RECIPE_STATUS_pn-task-core-basic = "green"
 RECIPE_LATEST_VERSION_pn-task-core-basic = "1.0"
@@ -2795,7 +2807,7 @@ RECIPE_LAST_UPDATE_pn-latencytop = "Jul 22, 2010"
 RECIPE_MAINTAINER_pn-latencytop = "Dexuan Cui <dexuan.cui@intel.com>"
 
 RECIPE_STATUS_pn-tcf-agent = "green"
-DISTRO_PN_ALIAS_pn-tcf-agent = "WindRiver upstream=http://www.eclipse.org/dsdp/tm/"
+DISTRO_PN_ALIAS_pn-tcf-agent = "Windriver upstream=http://www.eclipse.org/dsdp/tm/"
 RECIPE_DEPENDENCY_CHECK_pn-tcf-agent = "not done"
 RECIPE_LATEST_VERSION_pn-tcf-agent = "0.0+svnr1855"
 RECIPE_MANUAL_CHECK_DATE_pn-tcf-agent = "Jul 21, 2011"
@@ -2899,6 +2911,8 @@ RECIPE_LATEST_VERSION_pn-gcc="4.6.1"
 RECIPE_LAST_UPDATE_pn-gcc = "May 1, 2011"
 RECIPE_MANUAL_CHECK_DATE_pn-gcc = "Jul 06, 2011" 
 RECIPE_MAINTAINER_pn-gcc = "Nitin A Kamble <nitin.a.kamble@intel.com>"
+DISTRO_PN_ALIAS_pn-gcc-runtime = "Ubuntu=gcc Fedora=gcc"
+
 
 RECIPE_STATUS_pn-autoconf="red" 
 RECIPE_LATEST_VERSION_pn-autoconf="2.68"
@@ -3438,6 +3452,7 @@ RECIPE_TIME_BETWEEN_LAST_TWO_RELEASES_pn-qt4-tools-nativesdk = "2 months"
 RECIPE_LATEST_RELEASE_DATE_pn-qt4-tools-nativesdk = "2011/05/04"
 RECIPE_LAST_UPDATE_pn-qt4-tools-nativesdk = "May 12, 2011"
 RECIPE_MAINTAINER_pn-qt4-tools-nativesdk = "Paul Eggleton <paul.eggleton@linux.intel.com>"
+DISTRO_PN_ALIAS_pn-qt4-tools-nativesdk = "Mandriva=libqt4-devel Ubuntu=libqt4-dev"
 
 RECIPE_STATUS_pn-qt4-embedded = "green"
 RECIPE_LATEST_VERSION_pn-qt4-embedded = "4.7.3"
@@ -3445,6 +3460,7 @@ RECIPE_TIME_BETWEEN_LAST_TWO_RELEASES_pn-qt4-embedded = "2 months"
 RECIPE_LATEST_RELEASE_DATE_pn-qt4-embedded = "2011/05/04"
 RECIPE_LAST_UPDATE_pn-qt4-embedded = "May 12, 2011"
 RECIPE_MAINTAINER_pn-qt4-embedded = "Paul Eggleton <paul.eggleton@linux.intel.com>"
+DISTRO_PN_ALIAS_pn-qt4-embedded = "OSPDT"
 
 RECIPE_STATUS_pn-qt4-x11-free = "green"
 RECIPE_LATEST_VERSION_pn-qt4-x11-free = "4.7.3"
@@ -5342,6 +5358,15 @@ RECIPE_LATEST_VERSION_pn-clutter-box2d-1.6 = "0.10.0"
 RECIPE_MANUAL_CHECK_DATE_pn-clutter-box2d-1.6 = "Jun 28, 2011"
 RECIPE_LAST_UPDATE_pn-clutter-box2d-1.6 = "Mar 28, 2011"
 RECIPE_MAINTAINER_pn-clutter-box2d-1.6 = "Zhai Edwin <edwin.zhai@intel.com>"
+DISTRO_PN_ALIAS_pn-clutter-box2d-1.6 = "OpenedHand"
+
+RECIPE_STATUS_pn-clutter-box2d = "red"
+RECIPE_LATEST_VERSION_pn-clutter-box2d = "0.10.0"
+RECIPE_MANUAL_CHECK_DATE_pn-clutter-box2d = "Jun 28, 2011"
+RECIPE_LAST_UPDATE_pn-clutter-box2d = "Mar 28, 2011"
+RECIPE_MAINTAINER_pn-clutter-box2d = "Zhai Edwin <edwin.zhai@intel.com>"
+DISTRO_PN_ALIAS_pn-clutter-box2d = "OpenedHand"
+
 
 RECIPE_STATUS_pn-clutter-gtk-1.4 = "red"
 DISTRO_PN_ALIAS_pn-clutter-gtk-1.4 = "Fedora=clutter-gtk OpenSuSE=clutter-gtk Ubuntu=clutter-gtk-0.10 Mandriva=clutter-gtk Debian=clutter-gtk"
@@ -5468,14 +5493,22 @@ DISTRO_PN_ALIAS_pn-core-image-base = "OE-Core"
 DISTRO_PN_ALIAS_pn-core-image-basic = "OE-Core"
 DISTRO_PN_ALIAS_pn-core-image-core = "OE-Core"
 DISTRO_PN_ALIAS_pn-core-image-lsb = "OE-Core"
+DISTRO_PN_ALIAS_pn-core-image-lsb-dev = "OE-Core"
+DISTRO_PN_ALIAS_pn-core-image-lsb-qt3 = "OE-Core"
+DISTRO_PN_ALIAS_pn-core-image-lsb-sdk = "OE-Core"
 DISTRO_PN_ALIAS_pn-core-image-minimal = "OE-Core"
+DISTRO_PN_ALIAS_pn-core-image-minimal-dev = "OE-Core"
 DISTRO_PN_ALIAS_pn-core-image-minimal-directdisk = "OE-Core"
 DISTRO_PN_ALIAS_pn-core-image-minimal-initramfs = "OE-Core"
 DISTRO_PN_ALIAS_pn-core-image-minimal-live = "OE-Core"
 DISTRO_PN_ALIAS_pn-core-image-minimal-mtdutils = "OE-Core"
+DISTRO_PN_ALIAS_pn-core-image-rt = "OE-Core"
+DISTRO_PN_ALIAS_pn-core-image-rt-sdk = "OE-Core"
 DISTRO_PN_ALIAS_pn-core-image-sato = "OE-Core"
+DISTRO_PN_ALIAS_pn-core-image-sato-dev = "OE-Core"
 DISTRO_PN_ALIAS_pn-core-image-sato-directdisk = "OE-Core"
 DISTRO_PN_ALIAS_pn-core-image-sato-live = "OE-Core"
+DISTRO_PN_ALIAS_pn-core-image-sato-sdk = "OE-Core"
 DISTRO_PN_ALIAS_pn-task-core = "OE-Core"
 DISTRO_PN_ALIAS_pn-task-core-apps-x11-pimlico = "OE-Core"
 DISTRO_PN_ALIAS_pn-task-core-basic = "OE-Core"
@@ -5485,10 +5518,14 @@ DISTRO_PN_ALIAS_pn-task-core-nfs = "OE-Core"
 DISTRO_PN_ALIAS_pn-task-core-qt = "OE-Core"
 DISTRO_PN_ALIAS_pn-task-core-sdk = "OE-Core"
 DISTRO_PN_ALIAS_pn-task-core-sdk-gmae = "OE-Core"
+DISTRO_PN_ALIAS_pn-task-core-ssh-dropbear = "Poky"
+DISTRO_PN_ALIAS_pn-task-core-ssh-openssh = "Poky"
 DISTRO_PN_ALIAS_pn-task-core-standalone-gmae-sdk-target = "OE-Core"
 DISTRO_PN_ALIAS_pn-task-core-standalone-sdk-target = "OE-Core"
 DISTRO_PN_ALIAS_pn-task-core-tools = "OE-Core"
 DISTRO_PN_ALIAS_pn-task-core-x11-sato = "OE-Core"
+DISTRO_PN_ALIAS_pn-task-qt4e = "Poky"
+DISTRO_PN_ALIAS_pn-task-qte-toolchain-host-natives = "Poky"
 DISTRO_PN_ALIAS_pn-initramfs-boot = "OE-Core"
 DISTRO_PN_ALIAS_pn-initramfs-live-boot = "OE-Core"
 DISTRO_PN_ALIAS_pn-initramfs-live-install = "OE-Core"
@@ -5533,7 +5570,7 @@ DISTRO_PN_ALIAS_pn-xvideo-tests = "OpenedHand"
 
 RECIPE_STATUS_pn-kern-tools-native = "red"
 RECIPE_LATEST_VERSION_pn-kern-tools-native = "check"
-DISTRO_PN_ALIAS_pn-kern-tools-native = "WindRiver"
+DISTRO_PN_ALIAS_pn-kern-tools-native = "Windriver"
 RECIPE_LAST_UPDATE_pn-kern-tools-native = "Nov 11, 2010"
 RECIPE_MAINTAINER_pn-kern-tools-native = "Bruce Ashfield <bruce.ashfield@windriver.com>"
 
@@ -5632,6 +5669,8 @@ RECIPE_NO_UPDATE_REASON_pn-lsb = "1.4 is fixed version of LSB Test"
 
 RECIPE_LATEST_VERSION_pn-lsbsetup = "0.9"
 RECIPE_MANUAL_CHECK_DATE_pn-lsbsetup = "Jan 17, 2011"
+DISTRO_PN_ALIAS_pn-lsbsetup = "Windriver"
+
 RECIPE_LATEST_VERSION_pn-libxml-simple-perl = "2.18"
 RECIPE_LATEST_VERSION_pn-talloc = "2.0.5"
 RECIPE_STATUS_pn-gthumb = "red"
@@ -5681,6 +5720,9 @@ RECIPE_TIME_BETWEEN_LAST_TWO_RELEASES_pn-docbook-sgml-dtd = "unknown"
 RECIPE_COMMENTS_pn-docbook-sgml-dtd = ""
 RECIPE_LAST_UPDATE_pn-docbook-sgml-dtd = "Jan 28, 2011"
 RECIPE_MAINTAINER_pn-docbook-sgml-dtd = "Scott Garman <scott.a.garman@intel.com>"
+DISTRO_PN_ALIAS_pn-docbook-sgml-dtd-3.1 = "Fedora=docbook-dtds Mandriva=docbook-dtd31-sgml"
+DISTRO_PN_ALIAS_pn-docbook-sgml-dtd-4.1 = "Fedora=docbook-dtds Mandriva=docbook-dtd41-sgml"
+DISTRO_PN_ALIAS_pn-docbook-sgml-dtd-4.5 = "Fedora=docbook-dtds Mandriva=docbook-dtd42-sgml"
 
 RECIPE_STATUS_pn-docbook-dsssl-stylesheet = "green"
 RECIPE_DEPENDENCY_CHECK_pn-docbook-dsssl-stylesheet = "not done"
@@ -5691,6 +5733,8 @@ RECIPE_TIME_BETWEEN_LAST_TWO_RELEASES_pn-docbook-dsssl-stylesheet = "unknown"
 RECIPE_COMMENTS_pn-docbook-dsssl-stylesheet = ""
 RECIPE_LAST_UPDATE_pn-docbook-dsssl-stylesheet = "Jan 26, 2011"
 RECIPE_MAINTAINER_pn-docbook-dsssl-stylesheet = "Scott Garman <scott.a.garman@intel.com>"
+DISTRO_PN_ALIAS_pn-docbook-dsssl-stylesheet = "Fedora=docbook-style-dsssl Ubuntu=docbook-dsssl"
+DISTRO_PN_ALIAS_pn-docbook-dsssl-stylesheet-native = "Fedora=docbook-style-dsssl Ubuntu=docbook-dsssl"
 
 RECIPE_STATUS_pn-sgmlspl = "green"
 RECIPE_DEPENDENCY_CHECK_pn-sgmlspl = "not done"
@@ -5701,6 +5745,7 @@ RECIPE_TIME_BETWEEN_LAST_TWO_RELEASES_pn-sgmlspl = "5 days"
 RECIPE_COMMENTS_pn-sgmlspl = ""
 RECIPE_LAST_UPDATE_pn-sgmlspl = "Jan 26, 2011"
 RECIPE_MAINTAINER_pn-sgmlspl = "Scott Garman <scott.a.garman@intel.com>"
+DISTRO_PN_ALIAS_pn-sgmlspl = "Debian=sgmlspl Ubuntu=sgmlspl"
 
 RECIPE_STATUS_pn-opensp = "green"
 RECIPE_DEPENDENCY_CHECK_pn-opensp = "not done"
@@ -5796,6 +5841,7 @@ RECIPE_TIME_BETWEEN_LAST_TWO_RELEASES_pn-cdrtools = "6 years 2 months"
 RECIPE_COMMENTS_pn-cdrtools = "This is the last GPL licensed version of cdrtools"
 RECIPE_LAST_UPDATE_pn-cdrtools = "Apr 25, 2011"
 RECIPE_MAINTAINER_pn-cdrtools = "Scott Garman <scott.a.garman@intel.com>"
+DISTRO_PN_ALIAS_pn-cdrtools = "OpenSUSE=cdrtools OSPDT"
 
 RECIPE_STATUS_pn-rxvt-unicode = "green"
 RECIPE_DEPENDENCY_CHECK_pn-rxvt-unicode = "not done"
@@ -5830,6 +5876,7 @@ RECIPE_LAST_UPDATE_pn-pseudo = "Jun 06, 2011"
 RECIPE_MAINTAINER_pn-pseudo = "Mark Hatle <mark.hatle@windriver.com>"
 RECIPE_COMMENTS_pn-pseudo = "Yocto Project maintained"
 RECIPE_MANUAL_CHECK_DATE_pn-pseudo = "Jun 06, 2011" 
+DISTRO_PN_ALIAS_pn-pseudo = "Windriver"
 
 DISTRO_PN_ALIAS_pn-btrfs-tools = "Debian=btrfs-tools Fedora=btrfs-progs"
 DISTRO_PN_ALIAS_pn-rt-tests = "Debian=rt-tests Ubuntu=rt-tests"
@@ -5846,3 +5893,35 @@ DISTRO_PN_ALIAS_pn-lame = "Debian=lame Ubuntu=lame"
 DISTRO_PN_ALIAS_pn-libiconv = "Fedora=mingw-libiconv Opensuse=cross-mingw-libiconv"
 DISTRO_PN_ALIAS_pn-qt4-native = "Fedora=qt4 Debian=qt4-dev-tools"
 DISTRO_PN_ALIAS_pn-update-alternatives-dpkg = "Opensuse=update-alternatives Mandriva=update-alternatives"
+DISTRO_PN_ALIAS_pn-emgd-driver-bin = "Intel"
+DISTRO_PN_ALIAS_pn-external-csl-toolchain = "OE-Core"
+DISTRO_PN_ALIAS_pn-external-poky-toolchain = "Poky"
+DISTRO_PN_ALIAS_pn-hello-mod = "Poky"
+DISTRO_PN_ALIAS_pn-linux-dummy = "Intel"
+DISTRO_PN_ALIAS_pn-meta-environment-i586 = "Poky"
+DISTRO_PN_ALIAS_pn-meta-toolchain-gmae = "Poky"
+DISTRO_PN_ALIAS_pn-meta-toolchain-qte = "Poky"
+DISTRO_PN_ALIAS_pn-n450-audio = "Intel"
+DISTRO_PN_ALIAS_pn-qt-demo-init = "Poky"
+DISTRO_PN_ALIAS_pn-qt4e-demo-image = "Poky"
+DISTRO_PN_ALIAS_pn-xorg-cf-files = "Poky"
+
+DISTRO_PN_ALIAS_pn-task-core-yocto = "Poky"
+DISTRO_PN_ALIAS_pn-yocto-image-build = "Poky"
+DISTRO_PN_ALIAS_pn-task-core-x11 = "OE-Core"
+DISTRO_PN_ALIAS_pn-gcc-crosssdk-initial = "OE-Core"
+DISTRO_PN_ALIAS_pn-gcc-cross-initial = "OE-Core"
+DISTRO_PN_ALIAS_pn-python-ZSI = "OE-Core"
+DISTRO_PN_ALIAS_pn-swabber-native = "Poky"
+DISTRO_PN_ALIAS_pn-opkg-nogpg = "OE-Core"
+DISTRO_PN_ALIAS_pn-opkg-nogpg-native = "OE-Core"
+DISTRO_PN_ALIAS_pn-opkg-nogpg-nativesdk = "OE-Core"
+DISTRO_PN_ALIAS_pn-icecc-create-env = "OE-Core"
+DISTRO_PN_ALIAS_pn-sysvinit-inittab = "OE-Core"
+DISTRO_PN_ALIAS_pn-eglibc-locale = "OE-Core"
+DISTRO_PN_ALIAS_pn-eglibc-locale-nativesdk = "OE-Core"
+DISTRO_PN_ALIAS_pn-external-python-tarball = "OE-Core"
+DISTRO_PN_ALIAS_pn-task-core-console = "OE-Core"
+DISTRO_PN_ALIAS_pn-task-qte-toolchain-host-nativesdk = "OE-Core"
+DISTRO_PN_ALIAS_pn-tar-replacement-native = "OE-Core"
+DISTRO_PN_ALIAS_pn-task-cross-canadian-i586 = "OE-Core"
-- 
1.7.6



