Return-Path: <tracy.graydon@intel.com>
Received: from mga01.intel.com (mga01.intel.com [192.55.52.88])
	by mail.openembedded.org (Postfix) with ESMTP id A4C31770A0
	for <openembedded-core@lists.openembedded.org>;
	Thu,  7 Apr 2016 16:42:57 +0000 (UTC)
Received: from fmsmga003.fm.intel.com ([10.253.24.29])
	by fmsmga101.fm.intel.com with ESMTP; 07 Apr 2016 09:42:58 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.24,449,1455004800"; d="scan'208";a="682503835"
Received: from tgraydonws.ostc.intel.com ([10.54.69.46])
	by FMSMGA003.fm.intel.com with ESMTP; 07 Apr 2016 09:42:57 -0700
From: "Graydon, Tracy" <tracy.graydon@intel.com>
To: openembedded-core@lists.openembedded.org
Date: Thu,  7 Apr 2016 09:42:55 -0700
Message-Id: <1460047375-20395-1-git-send-email-tracy.graydon@intel.com>
X-Mailer: git-send-email 2.7.0
Subject: [PATCH] meta/conf/distro/include/distro_alias.inc
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
X-List-Received-Date: Thu, 07 Apr 2016 16:42:58 -0000

Update the distro_alias.inc file to include updated/new packages.

This is required for the Yocto-2.1 release.

Signed-off-by: Graydon, Tracy <tracy.graydon@intel.com>
---
 meta/conf/distro/include/distro_alias.inc | 31 +++++++++++++++++++++++++++++++
 1 file changed, 31 insertions(+)

diff --git a/meta/conf/distro/include/distro_alias.inc b/meta/conf/distro/include/distro_alias.inc
index c8f9395..51869d5 100644
--- a/meta/conf/distro/include/distro_alias.inc
+++ b/meta/conf/distro/include/distro_alias.inc
@@ -9,13 +9,17 @@
 #
 # Please keep this list in alphabetical order.
 #
+DISTRO_PN_ALIAS_pn-alsa-lib = "Debian=alsa-lib Ubuntu=alsa-lib Fedora=alsa-lib"
 DISTRO_PN_ALIAS_pn-alsa-state = "OE-Core"
 DISTRO_PN_ALIAS_pn-alsa-utils-alsaconf = "OE-Core"
 DISTRO_PN_ALIAS_pn-alsa-utils-scripts = "OE-Core"
+DISTRO_PN_ALIAS_pn-apt = "Debian=apt Ubuntu=apt Fedora=apt"
 DISTRO_PN_ALIAS_pn-atk = "Fedora=atk OpenSuSE=atk"
 DISTRO_PN_ALIAS_pn-augeas = "Ubuntu=libaugeas0 Debian=libaugeas0"
 DISTRO_PN_ALIAS_pn-avahi-ui = "Ubuntu=avahi-discover Debian=avahi-discover"
 DISTRO_PN_ALIAS_pn-babeltrace = "OSPDT"
+DISTRO_PN_ALIAS_pn-base-files = "Debian=base-files Ubuntu=base-files"
+DISTRO_PN_ALIAS_pn-base-passwd = "Debian=base-passwd Ubuntu=base-passwd"
 DISTRO_PN_ALIAS_pn-bdwgc = "OSPDT"
 DISTRO_PN_ALIAS_pn-bigreqsproto = "Meego=xorg-x11-proto-bigreqsproto"
 DISTRO_PN_ALIAS_pn-bjam = "OpenSuSE=boost-jam Debina=bjam"
@@ -31,6 +35,7 @@ DISTRO_PN_ALIAS_pn-calibrateproto = "OSPDT upstream=http://cgit.freedesktop.org/
 DISTRO_PN_ALIAS_pn-cdrtools = "OpenSUSE=cdrtools OSPDT"
 DISTRO_PN_ALIAS_pn-chkconfig-alternatives = "Mandriva=chkconfig Debian=chkconfig"
 DISTRO_PN_ALIAS_pn-clutter = "Fedora=clutter OpenSuse=clutter Ubuntu=clutter-1.0 Mandriva=clutter Debian=clutter"
+DISTRO_PN_ALIAS_pn-clutter-1.0 = "Debian=clutter-1.0 Ubuntu=clutter-1.0"
 DISTRO_PN_ALIAS_pn-clutter-1.8 = "Fedora=clutter OpenSuse=clutter Ubuntu=clutter-1.0 Mandriva=clutter Debian=clutter"
 DISTRO_PN_ALIAS_pn-clutter-gst-1.0 = "Debian=clutter-gst Ubuntu=clutter-gst Fedora=clutter-gst"
 DISTRO_PN_ALIAS_pn-clutter-gst-1.8 = "Fedora=clutter-gst Debian=libclutter-gst"
@@ -74,6 +79,7 @@ DISTRO_PN_ALIAS_pn-damageproto = "Meego=xorg-x11-proto-damageproto"
 DISTRO_PN_ALIAS_pn-db = "Debian=db5.1 Ubuntu=db5.1"
 DISTRO_PN_ALIAS_pn-dbus-test = "Fedora=dbus Ubuntu=dbus"
 DISTRO_PN_ALIAS_pn-dbus-wait = "OpenedHand"
+DISTRO_PN_ALIAS_pn-debianutils = "Debian=debianutils Ubuntu=debianutils"
 DISTRO_PN_ALIAS_pn-depmodwrapper-cross = "OE-Core"
 DISTRO_PN_ALIAS_pn-directfb-examples = "Debian=directfb Fedora=directfb"
 DISTRO_PN_ALIAS_pn-distcc = "Debian=distcc Fedora=distcc"
@@ -94,6 +100,7 @@ DISTRO_PN_ALIAS_pn-eee-acpi-scripts = "Debian=eeepc-acpi-scripts Ubuntu=eeepc-ac
 DISTRO_PN_ALIAS_pn-eglinfo-fb = "OE-Core"
 DISTRO_PN_ALIAS_pn-eglinfo-x11 = "OE-Core"
 DISTRO_PN_ALIAS_pn-encodings = "Ubuntu=xfonts-encodings Mandriva=x11-font-encodings Debian=xfonts-encodings"
+DISTRO_PN_ALIAS_pn-eudev = "OE-Core"
 DISTRO_PN_ALIAS_pn-fixesproto = "Meego=xorg-x11-proto-fixesproto"
 DISTRO_PN_ALIAS_pn-font-alias = "Fedora=xorg-x11-fonts-base Mandriva=x11-font-alias Meego=xorg-x11-fonts"
 DISTRO_PN_ALIAS_pn-fontcacheproto = "Meego=xorg-x11-proto-fontcacheproto"
@@ -109,6 +116,7 @@ DISTRO_PN_ALIAS_pn-gccmakedep = "Mandriva=gccmakedep Ubuntu=xutils-dev"
 DISTRO_PN_ALIAS_pn-gcc-runtime = "Ubuntu=gcc Fedora=gcc"
 DISTRO_PN_ALIAS_pn-gcc-sanitizers = "Ubuntu=gcc Fedora=gcc"
 DISTRO_PN_ALIAS_pn-gcc-source = "Ubuntu=gcc Fedora=gcc"
+DISTRO_PN_ALIAS_pn-gconf = "Debian=gconf Ubuntu=gconf Fedora=GConf2"
 DISTRO_PN_ALIAS_pn-gconf-dbus = "Meego=GConf-dbus"
 DISTRO_PN_ALIAS_pn-gdk-pixbuf = "Debian=libgdk-pixbuf2.0 Fedora=gdk-pixbuf"
 DISTRO_PN_ALIAS_pn-gdk-pixbuf-csource = "Debian=libgdk-pixbuf2.0-0 Fedora=gdk-pixbuf2"
@@ -118,7 +126,9 @@ DISTRO_PN_ALIAS_pn-glibc-locale = "OpenSuSE=glibc-locale Fedora=glibc-devel"
 DISTRO_PN_ALIAS_pn-glibc-mtrace = "Fedora=glibc-utils Ubuntu=libc-dev-bin"
 DISTRO_PN_ALIAS_pn-glibc-scripts = "Fedora=glibc Ubuntu=libc-bin"
 DISTRO_PN_ALIAS_pn-glproto = "Meego=xorg-x11-proto-glproto"
+DISTRO_PN_ALIAS_pn-gma500-gfx-check = "OE-Core"
 DISTRO_PN_ALIAS_pn-gnome-desktop-testing = "Debian=gnome-desktop-testing Fedora=gnome-desktop-testing"
+DISTRO_PN_ALIAS_pn-gnome-desktop3 = "Debian=gnome-desktop3 Ubuntu=gnome-desktop3 Fedora=gnome-desktop3"
 DISTRO_PN_ALIAS_pn-gnu-config = "OpenedHand"
 DISTRO_PN_ALIAS_pn-gptfdisk = "Fedora=gdisk Ubuntu=gdisk"
 DISTRO_PN_ALIAS_pn-grub-efi = "Debian=grub-efi Fedora=grub2-efi"
@@ -143,6 +153,7 @@ DISTRO_PN_ALIAS_pn-hello-mod = "OE-Core"
 DISTRO_PN_ALIAS_pn-hostap-conf = "OE-Core"
 DISTRO_PN_ALIAS_pn-hwlatdetect = "OSPDT"
 DISTRO_PN_ALIAS_pn-icecc-create-env = "OE-Core"
+DISTRO_PN_ALIAS_pn-ifupdown = "Debian=ifupdown Ubuntu=ifupdown"
 DISTRO_PN_ALIAS_pn-init-ifupdown = "Debian=ifupdown Ubuntu=ifupdown"
 DISTRO_PN_ALIAS_pn-initramfs-boot = "OE-Core"
 DISTRO_PN_ALIAS_pn-initramfs-framework = "OE-Core"
@@ -167,13 +178,17 @@ DISTRO_PN_ALIAS_pn-latencytop = "Meego=latencytop Fedora=latencytop Debian=laten
 DISTRO_PN_ALIAS_pn-ldconfig-native = "Ubuntu=libc-bin Fedora=glibc"
 DISTRO_PN_ALIAS_pn-liba52 = "Mandriva=a52dec Debian=a52dec"
 DISTRO_PN_ALIAS_pn-libacpi = "Ubuntu=libacpi Mandriva=libacpi"
+DISTRO_PN_ALIAS_pn-libart-lgpl = "Debian=libart-lgpl Ubuntu=libart-lgpl"
 DISTRO_PN_ALIAS_pn-libatomics-ops = "Meego=libatomic-ops Debian=libatomic-ops Ubuntu=libatomic-ops OpenSuSE=libatomic-ops Mandriva=libatomic-ops"
+DISTRO_PN_ALIAS_pn-libbsd = "Debian=libbsd Ubuntu=libbsd Fedora=libbsd"
 DISTRO_PN_ALIAS_pn-libcgroup = "Ubuntu=libcgroup1 Debian=libcgroup1"
 DISTRO_PN_ALIAS_pn-libcheck = "Ubuntu=check Fedora=check OpenSuSE=check"
 DISTRO_PN_ALIAS_pn-libclass-isa-perl = "OSPDT"
+DISTRO_PN_ALIAS_pn-libconvert-asn1-perl = "Debian=libconvert-asn1-perl Ubuntu=libconvert-asn1-perl"
 DISTRO_PN_ALIAS_pn-libdumpvalue-perl = "OSPDT"
 DISTRO_PN_ALIAS_pn-libenv-perl = "OSPDT"
 DISTRO_PN_ALIAS_pn-liberation-fonts = "Ubuntu=fonts-liberation Fedora=liberation-fonts-ttf"
+DISTRO_PN_ALIAS_pn-liberror-perl = "Debian=liberror-perl Ubuntu=liberror-perl"
 DISTRO_PN_ALIAS_pn-libfakekey = "Meego1.0=libfakekey Debian=libfakekey"
 DISTRO_PN_ALIAS_pn-libfile-checktree-perl = "OSPDT"
 DISTRO_PN_ALIAS_pn-libfm-extra = "Opensuse=libfm-extra4 Ubuntu=libfm-extra4"
@@ -182,6 +197,7 @@ DISTRO_PN_ALIAS_pn-libgdbus = "Intel"
 DISTRO_PN_ALIAS_pn-libglade = "Meego=libglade2 Fedora=libglade2 OpenSuSE=libglade2 Ubuntu=libglade2 Mandriva=libglade2.0 Debian=libglade2"
 DISTRO_PN_ALIAS_pn-libglu = "Debian=libglu Ubuntu=libglu Opensuse=mesa-libglu"
 DISTRO_PN_ALIAS_pn-libgu = "OpenSuSE=glu OSPDT"
+DISTRO_PN_ALIAS_pn-libgudev = "Ubuntu=libgudev Fedora=libgudev"
 DISTRO_PN_ALIAS_pn-libi18n-collate-perl = "OSPDT"
 DISTRO_PN_ALIAS_pn-libical = "Ubuntu=libical Fedora=libical"
 DISTRO_PN_ALIAS_pn-libiconv = "Fedora=mingw-libiconv Opensuse=cross-mingw-libiconv"
@@ -208,13 +224,21 @@ DISTRO_PN_ALIAS_pn-libsoup-2.4 = "Meego=libsoup Fedora=libsoup OpenSuSE=libsoup
 DISTRO_PN_ALIAS_pn-libtelepathy = "Debian=libtelepathy2 Ubuntu=libtelepathy2"
 DISTRO_PN_ALIAS_pn-libtimedate-perl = "Debian=libtimedate-perl Ubuntu=libtimedate-perl"
 DISTRO_PN_ALIAS_pn-liburcu = "Fedora=userspace-rcu Ubuntu=liburcu0"
+DISTRO_PN_ALIAS_pn-liburi-perl = "Debian=liburi-perl Ubuntu=liburi-perl"
 DISTRO_PN_ALIAS_pn-libusb1 = "Debian=libusb-1.0-0 Fedora=libusb1"
 DISTRO_PN_ALIAS_pn-libusb-compat = "OSPDT"
+DISTRO_PN_ALIAS_pn-libwnck3 = "Debian=libwnck3 Ubuntu=libwnck3 Fedora=libwnck3"
 DISTRO_PN_ALIAS_pn-libx11 = "Debian=libx11-6 Fedora=libX11 Ubuntu=libx11-6 OpenSuSE=xorg-x11-libX11"
 DISTRO_PN_ALIAS_pn-libxcalibrate = "OSPDT upstream=http://cgit.freedesktop.org/xorg/lib/libXCalibrate/"
 DISTRO_PN_ALIAS_pn-libxft = "Mandriva=libxft Debian=libxft2 Ubuntu=libxft2"
 DISTRO_PN_ALIAS_pn-libxi = "Ubuntu=libxi Fedora=libXi"
 DISTRO_PN_ALIAS_pn-libxkbcommon = "Fedora=libxkbcommon Debian=libxkbcommon"
+DISTRO_PN_ALIAS_pn-libxml-namespacesupport-perl = "Debian=libxml-namespacesupport-perl Ubuntu=libxml-namespacesupport-perl"
+DISTRO_PN_ALIAS_pn-libxml-parser-perl = "Debian=libxml-parser-perl Ubuntu=libxml-parser-perl"
+DISTRO_PN_ALIAS_pn-libxml-perl = "Debian=libxml-perl Ubuntu=libxml-perl"
+DISTRO_PN_ALIAS_pn-libxml-sax-base-perl = "Debian=libxml-sax-base-perl Ubuntu=libxml-sax-base-perl"
+DISTRO_PN_ALIAS_pn-libxml-sax-perl = "Debian=libxml-sax-perl Ubuntu=libxml-sax-perl"
+DISTRO_PN_ALIAS_pn-libxml-simple-perl = "Debian=libxml-simple-perl Ubuntu=libxml-simple-perl"
 DISTRO_PN_ALIAS_pn-libxscrnsaver = "Fedora=libXScrnSaver Ubuntu=libxss1 Mandriva=libxscrnsaver"
 DISTRO_PN_ALIAS_pn-libxsettings-client = "Debian=libxsettings-client0 Ubuntu=libxsettings-client0 Mandriva=libXsettings-client0"
 DISTRO_PN_ALIAS_pn-libxxf86misc = "Mandriva=libxxf86misc Fedora=libXxf86misc"
@@ -257,6 +281,7 @@ DISTRO_PN_ALIAS_pn-meta-environment-qemux86 = "OE-Core"
 DISTRO_PN_ALIAS_pn-meta-environment-qemux86-64 = "OE-Core"
 DISTRO_PN_ALIAS_pn-meta-ide-support = "OE-Core"
 DISTRO_PN_ALIAS_pn-meta-toolchain = "OE-Core"
+DISTRO_PN_ALIAS_pn-meta-world-pkgdata = "OE-Core"
 DISTRO_PN_ALIAS_pn-mini-x-session = "OSPDT"
 DISTRO_PN_ALIAS_pn-mkelfimage = "Ubuntu=mkelfimage Fedora=mkelfimage"
 DISTRO_PN_ALIAS_pn-mkfontdir = "Mandriva=mkfontdir Ubuntu=xfonts-utils Fedora=xorg-x11-font-utils"
@@ -266,8 +291,11 @@ DISTRO_PN_ALIAS_pn-mmc-utils = "OE-Core"
 DISTRO_PN_ALIAS_pn-modutils-initscripts = "OE-Core"
 DISTRO_PN_ALIAS_pn-mtd-utils = "Debian=mtd-utils Ubuntu=mtd-utils"
 DISTRO_PN_ALIAS_pn-mx-1.0 = "Ubuntu=mx Debian=mx Fedora=mx"
+DISTRO_PN_ALIAS_pn-nativesdk-buildtools-perl-dummy = "OE-Core"
 DISTRO_PN_ALIAS_pn-neard = "Intel"
 DISTRO_PN_ALIAS_pn-neon = "Fedora=neon Opensuse=neon"
+DISTRO_PN_ALIAS_pn-netbase = "Debian=netbase Ubuntu=netbase"
+DISTRO_PN_ALIAS_pn-nettle = "Debian=nettle Ubuntu=nettle Fedora=nettle"
 DISTRO_PN_ALIAS_pn-network-suspend-scripts = "OE-Core"
 DISTRO_PN_ALIAS_pn-nfs-export-root = "OpenedHand"
 DISTRO_PN_ALIAS_pn-npth = "OSPDT"
@@ -384,6 +412,7 @@ DISTRO_PN_ALIAS_pn-systemtap-uprobes = "Ubuntu=systemtap Debian=systemtap"
 DISTRO_PN_ALIAS_pn-sysvinit-inittab = "OE-Core"
 DISTRO_PN_ALIAS_pn-tar-replacement = "Fedora=tar Ubuntu=tar"
 DISTRO_PN_ALIAS_pn-tcf-agent = "Windriver upstream=http://www.eclipse.org/dsdp/tm/"
+DISTRO_PN_ALIAS_pn-tcp-wrappers = "Debian=tcp-wrappers Ubuntu=tcp-wrappers"
 DISTRO_PN_ALIAS_pn-texinfo-dummy-native = "OE-Core"
 DISTRO_PN_ALIAS_pn-tiny-init = "OSPDT"
 DISTRO_PN_ALIAS_pn-trace-cmd = "Mandriva=trace-cmd Ubuntu=trace-cmd"
@@ -391,6 +420,7 @@ DISTRO_PN_ALIAS_pn-tremor = "OSPDT upstream=http://www.xiph.org/vorbis/"
 DISTRO_PN_ALIAS_pn-tslib = "Debian=tslib Ubuntu=tslib"
 DISTRO_PN_ALIAS_pn-ttf-bitstream-vera = "Debian=ttf-bitstream-vera Ubuntu=ttf-bitstream-vera"
 DISTRO_PN_ALIAS_pn-tzcode = "OSPDT"
+DISTRO_PN_ALIAS_pn-tzdata = "Debian=tzdata Ubuntu=tzdata Fedora=tzdata"
 DISTRO_PN_ALIAS_pn-u-boot-fw-utils = "Ubuntu=u-boot-tools Debian=u-boot-tools"
 DISTRO_PN_ALIAS_pn-u-boot-mkimage = "Ubuntu=uboot-mkimage Debian=uboot-mkimage"
 DISTRO_PN_ALIAS_pn-udev = "Mandriva=udev Fedora=udev"
@@ -427,6 +457,7 @@ DISTRO_PN_ALIAS_pn-xf86dgaproto = "Meego=xorg-x11-proto-xf86dgaproto"
 DISTRO_PN_ALIAS_pn-xf86driproto = "Meego=xorg-x11-proto-xf86driproto"
 DISTRO_PN_ALIAS_pn-xf86-input-evdev = "Ubuntu=xserver-xorg-input-evdev Mandriva=x11-driver-input-evdev Debian=xserver-xorg-input-evdev Fedora=xorg-x11-drv-evdev Meego=xorg-x11-drv-evdev"
 DISTRO_PN_ALIAS_pn-xf86-input-keyboard = "Meego=xorg-x11-drv-keyboard Fedora=xorg-x11-drv-keyboard Mandriva=x11-driver-input-keyboard Debian=xserver-xorg-input-keyboard"
+DISTRO_PN_ALIAS_pn-xf86-input-libinput = "OpenSuSE=xf86-input-libinput Fedora=xorg-x11-drv-libinput"
 DISTRO_PN_ALIAS_pn-xf86-input-mouse = "Ubuntu=xserver-xorg-input-mouse Mandriva=x11-driver-input-mouse Debian=xserver-xorg-input-mouse"
 DISTRO_PN_ALIAS_pn-xf86-input-synaptics = "Meego=xorg-x11-drv-synaptics Fedora=xorg-x11-drv-synaptics Ubuntu=xserver-xorg-input-synaptics Mandriva=x11-driver-input-synaptics Debian=xfree86-driver-synaptics"
 DISTRO_PN_ALIAS_pn-xf86-input-vmmouse = "Fedora=xorg-x11-drv-vmmouse Ubuntu=xserver-xorg-input-vmmouse Mandriva=x11-driver-input-vmmouse Debian=xserver-xorg-input-vmmouse"
-- 
2.7.0


