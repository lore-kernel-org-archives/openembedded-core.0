Return-Path: <paul.eggleton@linux.intel.com>
Received: from mga01.intel.com (mga01.intel.com [192.55.52.88])
	by mail.openembedded.org (Postfix) with ESMTP id 70AE375D22
	for <openembedded-core@lists.openembedded.org>;
	Fri,  6 Nov 2015 13:01:35 +0000 (UTC)
Received: from orsmga002.jf.intel.com ([10.7.209.21])
	by fmsmga101.fm.intel.com with ESMTP; 06 Nov 2015 05:01:34 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.20,252,1444719600"; d="scan'208";a="844153958"
Received: from bdiacone-mobl1.ger.corp.intel.com (HELO
	peggleto-mobl.ger.corp.intel.com) ([10.252.8.207])
	by orsmga002.jf.intel.com with ESMTP; 06 Nov 2015 05:01:34 -0800
From: Paul Eggleton <paul.eggleton@linux.intel.com>
To: openembedded-core@lists.openembedded.org
Date: Fri,  6 Nov 2015 13:01:18 +0000
Message-Id: <0e969b566d635de20c0b91a19940606e5d2117ff.1446814828.git.paul.eggleton@linux.intel.com>
X-Mailer: git-send-email 2.1.0
In-Reply-To: <cover.1446814828.git.paul.eggleton@linux.intel.com>
References: <cover.1446814828.git.paul.eggleton@linux.intel.com>
In-Reply-To: <cover.1446814828.git.paul.eggleton@linux.intel.com>
References: <cover.1446814828.git.paul.eggleton@linux.intel.com>
Subject: [PATCH 4/6] conf/distro/include: drop old recipes from include files
X-BeenThere: openembedded-core@lists.openembedded.org
X-Mailman-Version: 2.1.12
Precedence: list
List-Id: Patches and discussions about the oe-core layer
	<openembedded-core.lists.openembedded.org>
List-Unsubscribe: <http://lists.openembedded.org/mailman/options/openembedded-core>,
	<mailto:openembedded-core-request@lists.openembedded.org?subject=unsubscribe>
List-Archive: <http://lists.openembedded.org/pipermail/openembedded-core/>
List-Post: <mailto:openembedded-core@lists.openembedded.org>
List-Help: <mailto:openembedded-core-request@lists.openembedded.org?subject=help>
List-Subscribe: <http://lists.openembedded.org/mailman/listinfo/openembedded-core>,
	<mailto:openembedded-core-request@lists.openembedded.org?subject=subscribe>
X-List-Received-Date: Fri, 06 Nov 2015 13:01:35 -0000

These recipes have been removed (some a very long time ago, pre-dating
OE-Core).

Signed-off-by: Paul Eggleton <paul.eggleton@linux.intel.com>
---
 meta/conf/distro/include/as-needed.inc    |  3 --
 meta/conf/distro/include/distro_alias.inc | 58 -------------------------------
 2 files changed, 61 deletions(-)

diff --git a/meta/conf/distro/include/as-needed.inc b/meta/conf/distro/include/as-needed.inc
index 4f249fd..114d377 100644
--- a/meta/conf/distro/include/as-needed.inc
+++ b/meta/conf/distro/include/as-needed.inc
@@ -6,11 +6,8 @@ ASNEEDED_pn-console-tools = ""
 ASNEEDED_pn-distcc = ""
 ASNEEDED_pn-openobex = ""
 ASNEEDED_pn-icu = ""
-ASNEEDED_pn-xserver-kdrive-xomap = ""
-ASNEEDED_pn-minimo = ""
 ASNEEDED_pn-pciutils = ""
 ASNEEDED_pn-puzzles = ""
-ASNEEDED_pn-dialer = ""
 ASNEEDED_pn-pulseaudio = ""
 ASNEEDED_pn-rpm = ""
 
diff --git a/meta/conf/distro/include/distro_alias.inc b/meta/conf/distro/include/distro_alias.inc
index ca333c8..dfce760 100644
--- a/meta/conf/distro/include/distro_alias.inc
+++ b/meta/conf/distro/include/distro_alias.inc
@@ -9,8 +9,6 @@
 #
 # Please keep this list in alphabetical order.
 #
-DISTRO_PN_ALIAS_pn-aaina = "Intel"
-DISTRO_PN_ALIAS_pn-abiword-embedded = "Fedora=abiword Ubuntu=abiword"
 DISTRO_PN_ALIAS_pn-adt-installer = "Intel"
 DISTRO_PN_ALIAS_pn-alsa-state = "OE-Core"
 DISTRO_PN_ALIAS_pn-alsa-utils-alsaconf = "OE-Core"
@@ -23,9 +21,7 @@ DISTRO_PN_ALIAS_pn-bdwgc = "OSPDT"
 DISTRO_PN_ALIAS_pn-bigreqsproto = "Meego=xorg-x11-proto-bigreqsproto"
 DISTRO_PN_ALIAS_pn-bjam = "OpenSuSE=boost-jam Debina=bjam"
 DISTRO_PN_ALIAS_pn-blktool = "Debian=blktool Mandriva=blktool"
-DISTRO_PN_ALIAS_pn-bluez4 = "Ubuntu=bluez Debian=bluez-utils"
 DISTRO_PN_ALIAS_pn-bluez5 = "Fedora=bluez  Opensuse=bluez"
-DISTRO_PN_ALIAS_pn-bluez-dtl1-workaround = "OE-Core"
 DISTRO_PN_ALIAS_pn-bootchart2 = "Fedora=bootchart2 Opensuse=bootchart"
 DISTRO_PN_ALIAS_pn-btrfs-tools = "Debian=btrfs-tools Fedora=btrfs-progs"
 DISTRO_PN_ALIAS_pn-build-appliance-image = "OSPDT"
@@ -35,11 +31,6 @@ DISTRO_PN_ALIAS_pn-buildtools-tarball = "OE-Core"
 DISTRO_PN_ALIAS_pn-calibrateproto = "OSPDT upstream=http://cgit.freedesktop.org/xorg/proto/calibrateproto"
 DISTRO_PN_ALIAS_pn-cdrtools = "OpenSUSE=cdrtools OSPDT"
 DISTRO_PN_ALIAS_pn-chkconfig-alternatives = "Mandriva=chkconfig Debian=chkconfig"
-DISTRO_PN_ALIAS_pn-claws-plugin-gtkhtml2-viewer = "Fedora=claws-mail-plugins OpenSuSE=claws-mail-extra-plugins Debian=claws-mail-extra-plugins"
-DISTRO_PN_ALIAS_pn-claws-plugin-maildir = "Fedora=claws-mail-plugins OpenSuSE=claws-mail-extra-plugins Debian=claws-mail-extra-plugins"
-DISTRO_PN_ALIAS_pn-claws-plugin-mailmbox = "Fedora=claws-mail-plugins OpenSuSE=claws-mail-extra-plugins Debian=claws-mail-extra-plugins"
-DISTRO_PN_ALIAS_pn-claws-plugin-rssyl = "Fedora=claws-mail-plugins OpenSuSE=claws-mail-extra-plugins Debian=claws-mail-extra-plugins"
-DISTRO_PN_ALIAS_pn-clipboard-manager = "OpenedHand"
 DISTRO_PN_ALIAS_pn-clutter = "Fedora=clutter OpenSuse=clutter Ubuntu=clutter-1.0 Mandriva=clutter Debian=clutter"
 DISTRO_PN_ALIAS_pn-clutter-1.8 = "Fedora=clutter OpenSuse=clutter Ubuntu=clutter-1.0 Mandriva=clutter Debian=clutter"
 DISTRO_PN_ALIAS_pn-clutter-gst-1.0 = "Debian=clutter-gst Ubuntu=clutter-gst Fedora=clutter-gst"
@@ -83,7 +74,6 @@ DISTRO_PN_ALIAS_pn-cryptodev-tests = "OE-Core"
 DISTRO_PN_ALIAS_pn-cwautomacros = "OSPDT upstream=http://cwautomacros.berlios.de/"
 DISTRO_PN_ALIAS_pn-damageproto = "Meego=xorg-x11-proto-damageproto"
 DISTRO_PN_ALIAS_pn-db = "Debian=db5.1 Ubuntu=db5.1"
-DISTRO_PN_ALIAS_pn-dbus-ptest = "Fedora=dbus Ubuntu=dbus"
 DISTRO_PN_ALIAS_pn-dbus-test = "Fedora=dbus Ubuntu=dbus"
 DISTRO_PN_ALIAS_pn-dbus-wait = "OpenedHand"
 DISTRO_PN_ALIAS_pn-depmodwrapper-cross = "OE-Core"
@@ -102,18 +92,10 @@ DISTRO_PN_ALIAS_pn-dri2proto = "Meego=xorg-x11-proto-dri2proto"
 DISTRO_PN_ALIAS_pn-dri3proto = "Fedora=dri3proto Opensuse=dri3proto-devel"
 DISTRO_PN_ALIAS_pn-dropbear = "Debian=dropbear Ubuntu=dropbear"
 DISTRO_PN_ALIAS_pn-dtc = "Fedora=dtc Ubuntu=dtc"
-DISTRO_PN_ALIAS_pn-eds-tools = "OpenedHand"
 DISTRO_PN_ALIAS_pn-eee-acpi-scripts = "Debian=eeepc-acpi-scripts Ubuntu=eeepc-acpi-scripts"
-DISTRO_PN_ALIAS_pn-eglibc = "OE-Core"
-DISTRO_PN_ALIAS_pn-eglibc-initial = "OE-Core"
-DISTRO_PN_ALIAS_pn-eglibc-locale = "OE-Core"
-DISTRO_PN_ALIAS_pn-eglibc-mtrace = "OE-Core"
-DISTRO_PN_ALIAS_pn-eglibc-scripts = "OE-Core"
 DISTRO_PN_ALIAS_pn-eglinfo-fb = "OE-Core"
 DISTRO_PN_ALIAS_pn-eglinfo-x11 = "OE-Core"
-DISTRO_PN_ALIAS_pn-emgd-driver-bin = "Intel"
 DISTRO_PN_ALIAS_pn-encodings = "Ubuntu=xfonts-encodings Mandriva=x11-font-encodings Debian=xfonts-encodings"
-DISTRO_PN_ALIAS_pn-evieext = "Meego=xorg-x11-proto-evieext Debian=x11proto-evie"
 DISTRO_PN_ALIAS_pn-fixesproto = "Meego=xorg-x11-proto-fixesproto"
 DISTRO_PN_ALIAS_pn-font-alias = "Fedora=xorg-x11-fonts-base Mandriva=x11-font-alias Meego=xorg-x11-fonts"
 DISTRO_PN_ALIAS_pn-fontcacheproto = "Meego=xorg-x11-proto-fontcacheproto"
@@ -122,9 +104,6 @@ DISTRO_PN_ALIAS_pn-font-util = "Meego=xorg-x11-font-utils Fedora=xorg-x11-font-u
 DISTRO_PN_ALIAS_pn-formfactor = "OE-Core"
 DISTRO_PN_ALIAS_pn-fotowall = "Fedora=fotowall Ubuntu=fotowall"
 DISTRO_PN_ALIAS_pn-fstests = "OpenedHand"
-DISTRO_PN_ALIAS_pn-gail = "Fedora=gail Ubuntu=libgail-3-0"
-DISTRO_PN_ALIAS_pn-gaku = "OpenedHand"
-DISTRO_PN_ALIAS_pn-galago-daemon = "Debian=galago-daemon Ubuntu=galago-daemon"
 DISTRO_PN_ALIAS_pn-gcc-cross-initial = "OE-Core"
 DISTRO_PN_ALIAS_pn-gcc-cross-initial-i586 = "OE-Core"
 DISTRO_PN_ALIAS_pn-gcc-crosssdk-initial = "OE-Core"
@@ -196,20 +175,16 @@ DISTRO_PN_ALIAS_pn-libatomics-ops = "Meego=libatomic-ops Debian=libatomic-ops Ub
 DISTRO_PN_ALIAS_pn-libcgroup = "Ubuntu=libcgroup1 Debian=libcgroup1"
 DISTRO_PN_ALIAS_pn-libcheck = "Ubuntu=check Fedora=check OpenSuSE=check"
 DISTRO_PN_ALIAS_pn-libclass-isa-perl = "OSPDT"
-DISTRO_PN_ALIAS_pn-libdrm-poulsbo = "Debian=libdrm-intel1 Ubuntu=libdrm-intel1"
 DISTRO_PN_ALIAS_pn-libdumpvalue-perl = "OSPDT"
 DISTRO_PN_ALIAS_pn-libenv-perl = "OSPDT"
 DISTRO_PN_ALIAS_pn-liberation-fonts = "Ubuntu=fonts-liberation Fedora=liberation-fonts-ttf"
 DISTRO_PN_ALIAS_pn-libfakekey = "Meego1.0=libfakekey Debian=libfakekey"
 DISTRO_PN_ALIAS_pn-libfile-checktree-perl = "OSPDT"
 DISTRO_PN_ALIAS_pn-libfm-extra = "Opensuse=libfm-extra4 Ubuntu=libfm-extra4"
-DISTRO_PN_ALIAS_pn-libfribidi = "OpenSuSE=fribidi Ubuntu=fribidi Mandriva=fribidi Debian=fribidi"
 DISTRO_PN_ALIAS_pn-libgcc = "Debian=libgcc4 Ubuntu=libgcc1 OpenSuSE=libgcc46"
 DISTRO_PN_ALIAS_pn-libgdbus = "Intel"
 DISTRO_PN_ALIAS_pn-libglade = "Meego=libglade2 Fedora=libglade2 OpenSuSE=libglade2 Ubuntu=libglade2 Mandriva=libglade2.0 Debian=libglade2"
 DISTRO_PN_ALIAS_pn-libglu = "Debian=libglu Ubuntu=libglu Opensuse=mesa-libglu"
-DISTRO_PN_ALIAS_pn-libgsmd = "Fedora=gsm Ubuntu=libgsm Debian=libgsm Opensuse=libgsm"
-DISTRO_PN_ALIAS_pn-libgtkstylus = "Debian=libgtkstylus Ubuntu=libgtkstylus"
 DISTRO_PN_ALIAS_pn-libgu = "OpenSuSE=glu OSPDT"
 DISTRO_PN_ALIAS_pn-libi18n-collate-perl = "OSPDT"
 DISTRO_PN_ALIAS_pn-libical = "Ubuntu=libical Fedora=libical"
@@ -217,7 +192,6 @@ DISTRO_PN_ALIAS_pn-libiconv = "Fedora=mingw-libiconv Opensuse=cross-mingw-libico
 DISTRO_PN_ALIAS_pn-libinput = "Ubuntu=libinput0 Fedora=libinput0"
 DISTRO_PN_ALIAS_pn-libjson = "Ubuntu=libjson0-dev Debian=libjson0-dev"
 DISTRO_PN_ALIAS_pn-libksba = "Fedora=libksba Debian=libksba8 Ubuntu=libksba"
-DISTRO_PN_ALIAS_pn-liblbxutil = "Mandriva=liblbxutil OpenSuse=xorg-x11-devel"
 DISTRO_PN_ALIAS_pn-libmatchbox = "Ubuntu=libmatchbox Fedora=libmatchbox"
 DISTRO_PN_ALIAS_pn-libmpc = "Fedora=libmpc OpenSuse=libmpc2"
 DISTRO_PN_ALIAS_pn-libnewt = "Debian=libnewt0.52 Fedora=newt"
@@ -226,7 +200,6 @@ DISTRO_PN_ALIAS_pn-libnl = "Mandriva=libnl Fedora=libnl"
 DISTRO_PN_ALIAS_pn-libnss-mdns = "Meego=nss-mdns OpenSuSE=nss-mdns Ubuntu=nss-mdns Mandriva=nss_mdns Debian=nss-mdns"
 DISTRO_PN_ALIAS_pn-libomxil = "OSPDT upstream=http://omxil.sourceforge.net/"
 DISTRO_PN_ALIAS_pn-libowl = "Debian=owl OpenedHand"
-DISTRO_PN_ALIAS_pn-libowl-av = "OpenedHand"
 DISTRO_PN_ALIAS_pn-libpam = "Meego=pam Fedora=pam OpenSuSE=pam Ubuntu=pam Mandriva=pam Debian=pam"
 DISTRO_PN_ALIAS_pn-libpcre = "Mandriva=libpcre0 Fedora=pcre"
 DISTRO_PN_ALIAS_pn-libpng12 = "Debian=libpng12-0 Fedora=libpng"
@@ -236,23 +209,18 @@ DISTRO_PN_ALIAS_pn-libsdl = "Fedora=SDL Opensuse=SDL"
 DISTRO_PN_ALIAS_pn-libsdl2 = "Fedora=sdl2 Opensuse=libsdl2 Ubuntu=libsdl2 Debian=libsdl2"
 DISTRO_PN_ALIAS_pn-libsndfile1 = "Meego=libsndfile Fedora=libsndfile OpenSuSE=libsndfile Ubuntu=libsndfile Mandriva=libsndfile Debian=libsndfile"
 DISTRO_PN_ALIAS_pn-libsoup-2.4 = "Meego=libsoup Fedora=libsoup OpenSuSE=libsoup Ubuntu=libsoup2.4 Mandriva=libsoup Debian=libsoup2.4"
-DISTRO_PN_ALIAS_pn-libsync = "OSPDT"
 DISTRO_PN_ALIAS_pn-libtelepathy = "Debian=libtelepathy2 Ubuntu=libtelepathy2"
 DISTRO_PN_ALIAS_pn-libtimedate-perl = "Debian=libtimedate-perl Ubuntu=libtimedate-perl"
 DISTRO_PN_ALIAS_pn-liburcu = "Fedora=userspace-rcu Ubuntu=liburcu0"
 DISTRO_PN_ALIAS_pn-libusb1 = "Debian=libusb-1.0-0 Fedora=libusb1"
 DISTRO_PN_ALIAS_pn-libusb-compat = "OSPDT"
 DISTRO_PN_ALIAS_pn-libx11 = "Debian=libx11-6 Fedora=libX11 Ubuntu=libx11-6 OpenSuSE=xorg-x11-libX11"
-DISTRO_PN_ALIAS_pn-libx11-diet = "Debian=libx11-6 Fedora=libX11 Ubuntu=libx11-6 OpenSuSE=xorg-x11-libX11"
 DISTRO_PN_ALIAS_pn-libxcalibrate = "OSPDT upstream=http://cgit.freedesktop.org/xorg/lib/libXCalibrate/"
-DISTRO_PN_ALIAS_pn-libxfontcache = "Mandriva=libxfontcache Debian=libxfontcache"
 DISTRO_PN_ALIAS_pn-libxft = "Mandriva=libxft Debian=libxft2 Ubuntu=libxft2"
 DISTRO_PN_ALIAS_pn-libxi = "Ubuntu=libxi Fedora=libXi"
 DISTRO_PN_ALIAS_pn-libxkbcommon = "Fedora=libxkbcommon Debian=libxkbcommon"
-DISTRO_PN_ALIAS_pn-libxprintapputil = "Debian=libxprintapputil Ubuntu=libxprintapputil1 Mandriva=libxprintapputil"
 DISTRO_PN_ALIAS_pn-libxscrnsaver = "Fedora=libXScrnSaver Ubuntu=libxss1 Mandriva=libxscrnsaver"
 DISTRO_PN_ALIAS_pn-libxsettings-client = "Debian=libxsettings-client0 Ubuntu=libxsettings-client0 Mandriva=libXsettings-client0"
-DISTRO_PN_ALIAS_pn-libxtrap = "Debian=libxtrap6 Fedora=libXTrap"
 DISTRO_PN_ALIAS_pn-libxxf86misc = "Mandriva=libxxf86misc Fedora=libXxf86misc"
 DISTRO_PN_ALIAS_pn-linux-dummy = "Intel"
 DISTRO_PN_ALIAS_pn-linux-firmware = "Fedora=linux-firmware Ubuntu=linux-firmware"
@@ -262,7 +230,6 @@ DISTRO_PN_ALIAS_pn-linux-yocto = "Debian=linux-base Ubuntu=linux"
 DISTRO_PN_ALIAS_pn-linux-yocto-rt = "Debian=linux-base Ubuntu=linux"
 DISTRO_PN_ALIAS_pn-linux-yocto-tiny = "OSPDT"
 DISTRO_PN_ALIAS_pn-lsbinitscripts = "Windriver"
-DISTRO_PN_ALIAS_pn-lsbsetup = "Windriver"
 DISTRO_PN_ALIAS_pn-lsbtest = "Windriver"
 DISTRO_PN_ALIAS_pn-ltp = "Mandriva=ltp Ubuntu=ltp"
 DISTRO_PN_ALIAS_pn-lttng-modules = "OSPDT upstream=http://lttng.org/"
@@ -282,15 +249,12 @@ DISTRO_PN_ALIAS_pn-matchbox-session = "OpenedHand"
 DISTRO_PN_ALIAS_pn-matchbox-session-sato = "OpenedHand"
 DISTRO_PN_ALIAS_pn-matchbox-terminal = "OpenedHand"
 DISTRO_PN_ALIAS_pn-matchbox-theme-sato = "OpenedHand"
-DISTRO_PN_ALIAS_pn-matchbox-theme-sato-2 = "OpenedHand"
 DISTRO_PN_ALIAS_pn-matchbox-themes-extra = "Ubuntu=matchbox-themes-extra Mandriva=matchbox-themes-extra"
 DISTRO_PN_ALIAS_pn-matchbox-themes-gtk = "OpenedHand"
 DISTRO_PN_ALIAS_pn-matchbox-wm = "OpenedHand"
-DISTRO_PN_ALIAS_pn-matchbox-wm-2 = "Mandriva=matchbox-window-manager Debian=matchbox-window-manager"
 DISTRO_PN_ALIAS_pn-menu-cache = "OSPDT"
 DISTRO_PN_ALIAS_pn-mesa = "Fedora=mesa Ubuntu=libgl1-mesa-dri"
 DISTRO_PN_ALIAS_pn-mesa-gl = "Fedora=mesa Ubuntu=libgl1-mesa-dri"
-DISTRO_PN_ALIAS_pn-mesa-glsl = "Fedora=mesa Ubuntu=libgl1-mesa-dri"
 DISTRO_PN_ALIAS_pn-meta-environment-extsdk-qemux86 = "OE-Core"
 DISTRO_PN_ALIAS_pn-meta-environment-i586 = "OE-Core"
 DISTRO_PN_ALIAS_pn-meta-environment-qemux86 = "OE-Core"
@@ -305,20 +269,15 @@ DISTRO_PN_ALIAS_pn-mkfontdir = "Mandriva=mkfontdir Ubuntu=xfonts-utils Fedora=xo
 DISTRO_PN_ALIAS_pn-mkfontscale = "Mandriva=mkfontscale Ubuntu=xfonts-utils Fedora=xorg-x11-font-utils"
 DISTRO_PN_ALIAS_pn-mktemp = "Mandriva=mktemp Fedora=mktemp"
 DISTRO_PN_ALIAS_pn-mmc-utils = "OE-Core"
-DISTRO_PN_ALIAS_pn-moblin-proto = "OE-Core"
-DISTRO_PN_ALIAS_pn-modutils-collateral = "OE-Core"
 DISTRO_PN_ALIAS_pn-modutils-initscripts = "OE-Core"
-DISTRO_PN_ALIAS_pn-msynctool = "OpenSuse=msynctool Mandriva=msynctool"
 DISTRO_PN_ALIAS_pn-mtd-utils = "Debian=mtd-utils Ubuntu=mtd-utils"
 DISTRO_PN_ALIAS_pn-mx-1.0 = "Ubuntu=mx Debian=mx Fedora=mx"
-DISTRO_PN_ALIAS_pn-n450-audio = "Intel"
 DISTRO_PN_ALIAS_pn-neard = "Intel"
 DISTRO_PN_ALIAS_pn-neon = "Fedora=neon Opensuse=neon"
 DISTRO_PN_ALIAS_pn-network-suspend-scripts = "OE-Core"
 DISTRO_PN_ALIAS_pn-nfs-export-root = "OpenedHand"
 DISTRO_PN_ALIAS_pn-npth = "OSPDT"
 DISTRO_PN_ALIAS_pn-nss-myhostname = "Meego=nss-mdns OpenSuSE=nss-mdns Ubuntu=nss-mdns Mandriva=nss_mdns Debian=nss-mdns"
-DISTRO_PN_ALIAS_pn-ocf-linux = "OSPDT"
 DISTRO_PN_ALIAS_pn-ofono = "Debian=ofono Ubuntu=ofono"
 DISTRO_PN_ALIAS_pn-oh-puzzles = "OpenedHand"
 DISTRO_PN_ALIAS_pn-opkg = "OSPDT upstream=http://svn.openmoko.org/trunk/src/tar"
@@ -331,7 +290,6 @@ DISTRO_PN_ALIAS_pn-oprofile = "Debian=oprofile Fedora=oprofile"
 DISTRO_PN_ALIAS_pn-oprofileui = "Fedora=oprofileui Ubuntu=oprofile-gui Debian=oprofile-gui"
 DISTRO_PN_ALIAS_pn-oprofileui-server = "Fedora=oprofileui Ubuntu=oprofile-gui Debian=oprofile-gui"
 DISTRO_PN_ALIAS_pn-os-release = "OE-Core"
-DISTRO_PN_ALIAS_pn-owl-video = "OpenedHand"
 DISTRO_PN_ALIAS_pn-packagegroup-base = "OE-Core"
 DISTRO_PN_ALIAS_pn-packagegroup-core = "OE-Core"
 DISTRO_PN_ALIAS_pn-packagegroup-core-boot = "OE-Core"
@@ -375,14 +333,12 @@ DISTRO_PN_ALIAS_pn-piglit = "OE-Core"
 DISTRO_PN_ALIAS_pn-pkgconfig = "Ubuntu=pkg-config Fedora=pkgconfig"
 DISTRO_PN_ALIAS_pn-pointercal = "OE-Core"
 DISTRO_PN_ALIAS_pn-pointercal-xinput = "OE-Core"
-DISTRO_PN_ALIAS_pn-poky-feed-config-opkg = "OE-Core"
 DISTRO_PN_ALIAS_pn-pong-clock = "OpenedHand"
 DISTRO_PN_ALIAS_pn-portmap = "Debian=rpcbind Fedora=rpcbind"
 DISTRO_PN_ALIAS_pn-postinst-intercept = "OE-Core"
 DISTRO_PN_ALIAS_pn-powertop = "Meego=powertop Fedora=powertop Debian=powertop OpenSuSE=powertop Mandriva=powertop"
 DISTRO_PN_ALIAS_pn-ppp-dialin = "OE-Core"
 DISTRO_PN_ALIAS_pn-presentproto = "Debian=x11proto-present-dev Fedora=xorg-x11-proto-devel"
-DISTRO_PN_ALIAS_pn-printproto = "Debian=x11proto-print-dev Ubuntu=x11proto-print-dev Mandriva=x11-proto-devel"
 DISTRO_PN_ALIAS_pn-pseudo = "Windriver"
 DISTRO_PN_ALIAS_pn-psplash = "OpenedHand"
 DISTRO_PN_ALIAS_pn-ptest-runner = "OE-Core"
@@ -392,8 +348,6 @@ DISTRO_PN_ALIAS_pn-python3 = "Fedora=python3 Debian=python3.2"
 DISTRO_PN_ALIAS_pn-python3-distribute = "Debian=python3-setuptools Fedora=python3-setuptools"
 DISTRO_PN_ALIAS_pn-python3-pip = "OpenSuSE=python3-pip Debian=python3-pip"
 DISTRO_PN_ALIAS_pn-python3-setuptools = "OpenSuSE=python3-setuptools Debian=python3-setuptools"
-DISTRO_PN_ALIAS_pn-python-ZSI = "OE-Core"
-DISTRO_PN_ALIAS_pn-python-argparse = "Fedora=python-argparse OpenSuSE=python-argparse"
 DISTRO_PN_ALIAS_pn-python-dbus = "Ubuntu=python-dbus Debian=python-dbus Mandriva=python-dbus"
 DISTRO_PN_ALIAS_pn-python-distribute = "Opensuse=python-setuptools Fedora=python-setuptools"
 DISTRO_PN_ALIAS_pn-python-git = "Debian=python-git Fedora=GitPython"
@@ -440,13 +394,10 @@ DISTRO_PN_ALIAS_pn-sgml-common = "OpenSuSE=sgml-common Fedora=sgml-common"
 DISTRO_PN_ALIAS_pn-sgmlspl = "Debian=sgmlspl Ubuntu=sgmlspl"
 DISTRO_PN_ALIAS_pn-shadow-securetty = "Ubuntu=shadow Fedora=shadow"
 DISTRO_PN_ALIAS_pn-shadow-sysroot = "Ubuntu=shadow Fedora=shadow"
-DISTRO_PN_ALIAS_pn-shasum = "OE-Core"
 DISTRO_PN_ALIAS_pn-shutdown-desktop = "OpenedHand"
-DISTRO_PN_ALIAS_pn-signgp = "OE-Core"
 DISTRO_PN_ALIAS_pn-speexdsp = "Ubuntu=libspeexdsp1 Fedora=speexdsp"
 DISTRO_PN_ALIAS_pn-stat = "Debian=coreutils Fedora=coreutils"
 DISTRO_PN_ALIAS_pn-stress = "Debian=stress Fedora=stress"
-DISTRO_PN_ALIAS_pn-swabber = "OE-Core"
 DISTRO_PN_ALIAS_pn-sysklogd = "Debian=sysklogd Mandriva=sysklogd"
 DISTRO_PN_ALIAS_pn-sysprof = "Fedora=sysprof Debian=sysprof"
 DISTRO_PN_ALIAS_pn-systemd-compat-units = "Fedora=systemd Ubuntu=systemd"
@@ -454,15 +405,11 @@ DISTRO_PN_ALIAS_pn-systemd-systemctl = "OE-Core"
 DISTRO_PN_ALIAS_pn-systemd-systemdctl = "Fedora=systemd Ubuntu=systemd"
 DISTRO_PN_ALIAS_pn-systemtap-uprobes = "Ubuntu=systemtap Debian=systemtap"
 DISTRO_PN_ALIAS_pn-sysvinit-inittab = "OE-Core"
-DISTRO_PN_ALIAS_pn-table = "Intel"
 DISTRO_PN_ALIAS_pn-tar-replacement = "Fedora=tar Ubuntu=tar"
 DISTRO_PN_ALIAS_pn-tcf-agent = "Windriver upstream=http://www.eclipse.org/dsdp/tm/"
-DISTRO_PN_ALIAS_pn-telepathy-python = "Debian=telepathy-python Ubuntu=telepathy-python"
 DISTRO_PN_ALIAS_pn-texinfo-dummy-native = "OE-Core"
 DISTRO_PN_ALIAS_pn-tiny-init = "OSPDT"
-DISTRO_PN_ALIAS_pn-tinylogin = "Debian=busybox Ubuntu=busybox Mandriva=busybox"
 DISTRO_PN_ALIAS_pn-trace-cmd = "Mandriva=trace-cmd Ubuntu=trace-cmd"
-DISTRO_PN_ALIAS_pn-trapproto = "Meego=xorg-x11-proto-trapproto"
 DISTRO_PN_ALIAS_pn-tremor = "OSPDT upstream=http://www.xiph.org/vorbis/"
 DISTRO_PN_ALIAS_pn-tslib = "Debian=tslib Ubuntu=tslib"
 DISTRO_PN_ALIAS_pn-ttf-bitstream-vera = "Debian=ttf-bitstream-vera Ubuntu=ttf-bitstream-vera"
@@ -483,7 +430,6 @@ DISTRO_PN_ALIAS_pn-videoproto = "Meego=xorg-x11-proto-videoproto"
 DISTRO_PN_ALIAS_pn-waffle = "OE-Core"
 DISTRO_PN_ALIAS_pn-watchdog = "Debian=watchdog Ubuntu=watchdog Mandriva=watchdog"
 DISTRO_PN_ALIAS_pn-webkitgtk = "Fedora=webkitgtk Ubuntu=libwebkit"
-DISTRO_PN_ALIAS_pn-web-webkit = "OpenedHand"
 DISTRO_PN_ALIAS_pn-weston = "Fedora=weston OpenSuSE=weston"
 DISTRO_PN_ALIAS_pn-weston-init = "OE-Core"
 DISTRO_PN_ALIAS_pn-which = "Mandriva=which Fedora=which"
@@ -509,7 +455,6 @@ DISTRO_PN_ALIAS_pn-xf86-input-mouse = "Ubuntu=xserver-xorg-input-mouse Mandriva=
 DISTRO_PN_ALIAS_pn-xf86-input-synaptics = "Meego=xorg-x11-drv-synaptics Fedora=xorg-x11-drv-synaptics Ubuntu=xserver-xorg-input-synaptics Mandriva=x11-driver-input-synaptics Debian=xfree86-driver-synaptics"
 DISTRO_PN_ALIAS_pn-xf86-input-vmmouse = "Fedora=xorg-x11-drv-vmmouse Ubuntu=xserver-xorg-input-vmmouse Mandriva=x11-driver-input-vmmouse Debian=xserver-xorg-input-vmmouse"
 DISTRO_PN_ALIAS_pn-xf86miscproto = "Meego=xorg-x11-proto-xf86miscproto"
-DISTRO_PN_ALIAS_pn-xf86rushproto = "Meego=xorg-x11-proto-xf86rushproto"
 DISTRO_PN_ALIAS_pn-xf86-video-cirrus = "Opensuse=xf86-video-cirrus Debian=xserver-xorg-video-cirrus"
 DISTRO_PN_ALIAS_pn-xf86-video-fbdev = "Ubuntu=xserver-xorg-video-fbdev Debian=xserver-xorg-video-fbdev"
 DISTRO_PN_ALIAS_pn-xf86-video-intel = "Debian=xserver-xorg-video-intel Fedora=xorg-x11-drv-intel Mandriva=x11-driver-video-intel Meego=xorg-x11-drv-intel Ubuntu=xserver-xorg-video-intel"
@@ -541,6 +486,3 @@ DISTRO_PN_ALIAS_pn-xuser-account = "OE-Core"
 DISTRO_PN_ALIAS_pn-xvideo-tests = "OpenedHand"
 DISTRO_PN_ALIAS_pn-xvinfo = "Fedora=xorg-x11-utils Ubuntu=x11-utils"
 DISTRO_PN_ALIAS_pn-xwininfo = "Fedora=xorg-x11-utils Ubuntu=x11-utils"
-DISTRO_PN_ALIAS_pn-yaffs2-utils = "OSPDT upstream=http://www.yaffs.net"
-DISTRO_PN_ALIAS_pn-zaurusd = "OpenedHand"
-DISTRO_PN_ALIAS_pn-zeroconf = "OSPDT upstream=http://www.progsoc.org/~wildfire/zeroconf/"
-- 
2.1.0


