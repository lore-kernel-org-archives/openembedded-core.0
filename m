Return-Path: <akuster808@gmail.com>
Received: from mail-pl0-f66.google.com (mail-pl0-f66.google.com
	[209.85.160.66])
	by mail.openembedded.org (Postfix) with ESMTP id EBDBF7462E
	for <openembedded-core@lists.openembedded.org>;
	Wed,  4 Apr 2018 01:49:40 +0000 (UTC)
Received: by mail-pl0-f66.google.com with SMTP id v18-v6so9787218ply.12
	for <openembedded-core@lists.openembedded.org>;
	Tue, 03 Apr 2018 18:49:42 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=from:to:subject:date:message-id:mime-version:in-reply-to:references
	:content-transfer-encoding;
	bh=YrdvgxngMvTlOEcvwfi7MgEPIBHv39I1dTsRmJ+Pqpg=;
	b=jgj6YO0Ktyh/eFn0Neui4sW1vAF5b8+x7iWW3iNB/2TH1+So0/Hlwpy/0GLXEsdipT
	09gqeKNZBFzkzf8cq57s0C015Zib898nHWv7LNwXGtn8IjR83qQV001bTo1fyn1JIlWX
	3Es7X2u+9pWeeuRssBr3GAuRvMLql+rFgOOJTqzXXPmEkq5bk9h3INaB3vd7JxMfOHn/
	LgIy6M04jnlN55xbfD3bGrh+QSF2eaTe0bomnsp1Tr/W97viajLVEUkK+hMAelSR/8aO
	4OtXg79qUUi350bbhcFN44OJ1OsHdrkcGrdCJcnbxLKsqowKB2904UeA1UcRcqM+oE+i
	KWUg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:from:to:subject:date:message-id:mime-version
	:in-reply-to:references:content-transfer-encoding;
	bh=YrdvgxngMvTlOEcvwfi7MgEPIBHv39I1dTsRmJ+Pqpg=;
	b=OVvfz20BUJAzuKwxxwiB9WgI2iYHp1KlsqLpC/NrM0pjm91cMpvZ7QG8wfd7QSeeDj
	b4BNLIKN9bGFJirJ6ilaok1KuFsadt4u0z60FnqzG+WcsVSL5khCGFBXYvevr24gTPLr
	ufy5/xs4D9+KbmapdBZbS3jNUNliqMBBBiocuoni619kP1d39qHpZUxpSe+aATild4Mt
	XEU1jAPDVnouB+SkDk/T4KELaQG3WL5k7R6BPQvpHNNoAtp9YdY+T0MOS8/EYwGa+rzH
	ETBWSgJqJWnKQwI/2LvAs96oUQtOahbSW2KKHUqdcyxEFfyER71IMwYtKvYrk/5vrtkp
	gIxA==
X-Gm-Message-State: AElRT7FQzuEYfrheYi/PtEmz+sLrkc5O699UO+81Iu8hr4u43ZbiL0mj
	Y6JVuW5+Uusvq8ilCm4TyWaUwQ==
X-Google-Smtp-Source: AIpwx4/KL3d/w2i25kg71fACECob+H+zGlpBJVXVrHoDg9EItTX9tDgKg2ERxkCJ/OUlqz3ny1ZnRQ==
X-Received: by 2002:a17:902:a508:: with SMTP id
	s8-v6mr16896192plq.216.1522806581796; 
	Tue, 03 Apr 2018 18:49:41 -0700 (PDT)
Received: from akuster-ThinkPad-T460s.mvista.com
	([2601:202:4000:1184:a4f3:7c10:9123:63ea])
	by smtp.gmail.com with ESMTPSA id
	d8sm7485877pfh.177.2018.04.03.18.49.41
	(version=TLS1_2 cipher=ECDHE-RSA-AES128-SHA bits=128/128);
	Tue, 03 Apr 2018 18:49:41 -0700 (PDT)
From: Armin Kuster <akuster808@gmail.com>
To: openembedded-core@lists.openembedded.org,
	akuster808@gmail.com
Date: Tue,  3 Apr 2018 18:49:18 -0700
Message-Id: <442184af412c1509717896788ad8906f1c4cd6c1.1522806183.git.akuster808@gmail.com>
X-Mailer: git-send-email 2.7.4
MIME-Version: 1.0
In-Reply-To: <cover.1522806183.git.akuster808@gmail.com>
References: <cover.1522806183.git.akuster808@gmail.com>
Subject: [PATCH 19/21] maintainers and distro: replace deprecated *protro header files with xorgproto
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
X-List-Received-Date: Wed, 04 Apr 2018 01:49:41 -0000
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit

From: Armin Kuster <akuster@mvista.com>

Signed-off-by: Armin Kuster <akuster@mvista.com>
---
 meta/conf/distro/include/distro_alias.inc | 30 +-----------------------------
 meta/conf/distro/include/maintainers.inc  | 28 +---------------------------
 2 files changed, 2 insertions(+), 56 deletions(-)

diff --git a/meta/conf/distro/include/distro_alias.inc b/meta/conf/distro/include/distro_alias.inc
index 8ec623b..1f4ff11 100644
--- a/meta/conf/distro/include/distro_alias.inc
+++ b/meta/conf/distro/include/distro_alias.inc
@@ -15,7 +15,6 @@ DISTRO_PN_ALIAS_pn-alsa-utils-scripts = "OE-Core"
 DISTRO_PN_ALIAS_pn-atk = "Fedora=atk OpenSuSE=atk"
 DISTRO_PN_ALIAS_pn-avahi-ui = "Ubuntu=avahi-discover Debian=avahi-discover"
 DISTRO_PN_ALIAS_pn-babeltrace = "OSPDT"
-DISTRO_PN_ALIAS_pn-bigreqsproto = "Meego=xorg-x11-proto-bigreqsproto"
 DISTRO_PN_ALIAS_pn-bjam = "OpenSuSE=boost-jam Debina=bjam"
 DISTRO_PN_ALIAS_pn-blktool = "Debian=blktool Mandriva=blktool"
 DISTRO_PN_ALIAS_pn-bluez5 = "Fedora=bluez  Opensuse=bluez"
@@ -25,7 +24,6 @@ DISTRO_PN_ALIAS_pn-build-appliance-image = "OSPDT"
 DISTRO_PN_ALIAS_pn-build-compare = "Opensuse=build-compare Fedora=build-compare"
 DISTRO_PN_ALIAS_pn-builder = "OE-Core"
 DISTRO_PN_ALIAS_pn-buildtools-tarball = "OE-Core"
-DISTRO_PN_ALIAS_pn-calibrateproto = "OSPDT upstream=http://cgit.freedesktop.org/xorg/proto/calibrateproto"
 DISTRO_PN_ALIAS_pn-cdrtools = "OpenSUSE=cdrtools OSPDT"
 DISTRO_PN_ALIAS_pn-chkconfig-alternatives = "Mandriva=chkconfig Debian=chkconfig"
 DISTRO_PN_ALIAS_pn-clutter = "Fedora=clutter OpenSuse=clutter Ubuntu=clutter-1.0 Mandriva=clutter Debian=clutter"
@@ -37,7 +35,6 @@ DISTRO_PN_ALIAS_pn-clutter-gtk-1.0 = "Debian=clutter-gtk Ubuntu=clutter-gtk Fedo
 DISTRO_PN_ALIAS_pn-clutter-gtk-1.8 = "Fedora=clutter-gtk OpenSuSE=clutter-gtk Ubuntu=clutter-gtk-0.10 Mandriva=clutter-gtk Debian=clutter-gtk"
 DISTRO_PN_ALIAS_pn-cogl-1.0 = "Debian=cogl Ubuntu=cogl Fedora=cogl"
 DISTRO_PN_ALIAS_pn-cogl = "Fedora=cogl OpenSuse=cogl Ubuntu=cogl Mandriva=cogl Debian=cogl"
-DISTRO_PN_ALIAS_pn-compositeproto = "Meego=xorg-x11-proto-compositeproto"
 DISTRO_PN_ALIAS_pn-connman = "Meego=connman"
 DISTRO_PN_ALIAS_pn-connman-conf = "OE-Core"
 DISTRO_PN_ALIAS_pn-connman-gnome = "Intel"
@@ -68,14 +65,12 @@ DISTRO_PN_ALIAS_pn-cryptodev-linux = "OE-Core"
 DISTRO_PN_ALIAS_pn-cryptodev-module = "OE-Core"
 DISTRO_PN_ALIAS_pn-cryptodev-tests = "OE-Core"
 DISTRO_PN_ALIAS_pn-cwautomacros = "OSPDT upstream=http://cwautomacros.berlios.de/"
-DISTRO_PN_ALIAS_pn-damageproto = "Meego=xorg-x11-proto-damageproto"
 DISTRO_PN_ALIAS_pn-db = "Debian=db5.1 Ubuntu=db5.1"
 DISTRO_PN_ALIAS_pn-dbus-test = "Fedora=dbus Ubuntu=dbus"
 DISTRO_PN_ALIAS_pn-dbus-wait = "OpenedHand"
 DISTRO_PN_ALIAS_pn-depmodwrapper-cross = "OE-Core"
 DISTRO_PN_ALIAS_pn-distcc = "Debian=distcc Fedora=distcc"
 DISTRO_PN_ALIAS_pn-distcc-config = "OpenedHand"
-DISTRO_PN_ALIAS_pn-dmxproto = "Meego=xorg-x11-proto-dmxproto Ubuntu=x11proto-dmx Debian=x11proto-dmx"
 DISTRO_PN_ALIAS_pn-docbook-dsssl-stylesheets = "Fedora=docbook-style-dsssl Ubuntu=docbook-dsssl"
 DISTRO_PN_ALIAS_pn-docbook-sgml-dtd-3.1 = "Fedora=docbook-dtds Mandriva=docbook-dtd31-sgml"
 DISTRO_PN_ALIAS_pn-docbook-sgml-dtd-4.1 = "Fedora=docbook-dtds Mandriva=docbook-dtd41-sgml"
@@ -83,18 +78,13 @@ DISTRO_PN_ALIAS_pn-docbook-sgml-dtd-4.5 = "Fedora=docbook-dtds Mandriva=docbook-
 DISTRO_PN_ALIAS_pn-docbook-xml-dtd4 = "Ubuntu=docbook-xml Fedora=docbook-dtds"
 DISTRO_PN_ALIAS_pn-docbook-xml-dtd4-native = "Ubuntu=docbook-xml Fedora=docbook-dtds"
 DISTRO_PN_ALIAS_pn-docbook-xsl-stylesheets = "Fedora=docbook-xsl-stylesheets Opensuse=docbook-xsl-stylesheets"
-DISTRO_PN_ALIAS_pn-dri2proto = "Meego=xorg-x11-proto-dri2proto"
-DISTRO_PN_ALIAS_pn-dri3proto = "Fedora=dri3proto Opensuse=dri3proto-devel"
 DISTRO_PN_ALIAS_pn-dropbear = "Debian=dropbear Ubuntu=dropbear"
 DISTRO_PN_ALIAS_pn-dtc = "Fedora=dtc Ubuntu=dtc"
 DISTRO_PN_ALIAS_pn-eee-acpi-scripts = "Debian=eeepc-acpi-scripts Ubuntu=eeepc-acpi-scripts"
 DISTRO_PN_ALIAS_pn-eglinfo-fb = "OE-Core"
 DISTRO_PN_ALIAS_pn-eglinfo-x11 = "OE-Core"
 DISTRO_PN_ALIAS_pn-encodings = "Ubuntu=xfonts-encodings Mandriva=x11-font-encodings Debian=xfonts-encodings"
-DISTRO_PN_ALIAS_pn-fixesproto = "Meego=xorg-x11-proto-fixesproto"
 DISTRO_PN_ALIAS_pn-font-alias = "Fedora=xorg-x11-fonts-base Mandriva=x11-font-alias Meego=xorg-x11-fonts"
-DISTRO_PN_ALIAS_pn-fontcacheproto = "Meego=xorg-x11-proto-fontcacheproto"
-DISTRO_PN_ALIAS_pn-fontsproto = "Meego=xorg-x11-proto-fontsproto"
 DISTRO_PN_ALIAS_pn-font-util = "Meego=xorg-x11-font-utils Fedora=xorg-x11-font-utils Ubuntu=xfonts-utils Mandriva=x11-font-util Debian=xfonts-utils"
 DISTRO_PN_ALIAS_pn-formfactor = "OE-Core"
 DISTRO_PN_ALIAS_pn-fstests = "OpenedHand"
@@ -114,7 +104,6 @@ DISTRO_PN_ALIAS_pn-glib-2.0 = "Meego=glib2 Fedora=glib2 OpenSuSE=glib2 Ubuntu=gl
 DISTRO_PN_ALIAS_pn-glibc-locale = "OpenSuSE=glibc-locale Fedora=glibc-devel"
 DISTRO_PN_ALIAS_pn-glibc-mtrace = "Fedora=glibc-utils Ubuntu=libc-dev-bin"
 DISTRO_PN_ALIAS_pn-glibc-scripts = "Fedora=glibc Ubuntu=libc-bin"
-DISTRO_PN_ALIAS_pn-glproto = "Meego=xorg-x11-proto-glproto"
 DISTRO_PN_ALIAS_pn-gnome-desktop-testing = "Debian=gnome-desktop-testing Fedora=gnome-desktop-testing"
 DISTRO_PN_ALIAS_pn-gnu-config = "OpenedHand"
 DISTRO_PN_ALIAS_pn-gptfdisk = "Fedora=gdisk Ubuntu=gdisk"
@@ -149,10 +138,8 @@ DISTRO_PN_ALIAS_pn-initramfs-live-install-efi = "OE-Core"
 DISTRO_PN_ALIAS_pn-initramfs-live-install-efi-testfs = "OE-Core"
 DISTRO_PN_ALIAS_pn-initramfs-live-install-testfs = "OE-Core"
 DISTRO_PN_ALIAS_pn-initscripts = "Fedora=initscripts Mandravia=initscripts"
-DISTRO_PN_ALIAS_pn-inputproto = "Meego=xorg-x11-proto-inputproto"
 DISTRO_PN_ALIAS_pn-iproute2 = "OSPDT"
 DISTRO_PN_ALIAS_pn-jpeg = "OpenSuSE=libjpeg Ubuntu=libjpeg62"
-DISTRO_PN_ALIAS_pn-kbproto = "Meego=xorg-x11-proto-kbproto Ubuntu=x11proto-kb-dev Debian=x11proto-kb-dev"
 DISTRO_PN_ALIAS_pn-kernel-devsrc = "Debian=linux-base Ubuntu=linux"
 DISTRO_PN_ALIAS_pn-kernelshark = "Mandriva=kernelshark Ubuntu=kernelshark"
 DISTRO_PN_ALIAS_pn-kern-tools-native = "Windriver"
@@ -316,7 +303,6 @@ DISTRO_PN_ALIAS_pn-portmap = "Debian=rpcbind Fedora=rpcbind"
 DISTRO_PN_ALIAS_pn-postinst-intercept = "OE-Core"
 DISTRO_PN_ALIAS_pn-powertop = "Meego=powertop Fedora=powertop Debian=powertop OpenSuSE=powertop Mandriva=powertop"
 DISTRO_PN_ALIAS_pn-ppp-dialin = "OE-Core"
-DISTRO_PN_ALIAS_pn-presentproto = "Debian=x11proto-present-dev Fedora=xorg-x11-proto-devel"
 DISTRO_PN_ALIAS_pn-pseudo = "Windriver"
 DISTRO_PN_ALIAS_pn-psplash = "OpenedHand"
 DISTRO_PN_ALIAS_pn-ptest-runner = "OE-Core"
@@ -342,12 +328,8 @@ DISTRO_PN_ALIAS_pn-qemu-config = "OpenedHand"
 DISTRO_PN_ALIAS_pn-qemugl = "OpenedHand"
 DISTRO_PN_ALIAS_pn-qemu-helper = "OpenedHand"
 DISTRO_PN_ALIAS_pn-qemuwrapper-cross = "OE-Core"
-DISTRO_PN_ALIAS_pn-randrproto = "Meego=xorg-x11-proto-randrproto"
 DISTRO_PN_ALIAS_pn-readline = "Fedora=readline Debian=readline-common"
-DISTRO_PN_ALIAS_pn-recordproto = "Meego=xorg-x11-proto-recordproto"
 DISTRO_PN_ALIAS_pn-remake = "Mandriva=remake Debian=remake"
-DISTRO_PN_ALIAS_pn-renderproto = "Meego=xorg-x11-proto-renderproto"
-DISTRO_PN_ALIAS_pn-resourceproto = "Meego=xorg-x11-proto-resourceproto"
 DISTRO_PN_ALIAS_pn-rgb = "Fedora=xorg-X11-server-utils Debian=x11-xserver-utils"
 DISTRO_PN_ALIAS_pn-rpmresolve = "OSPDT"
 DISTRO_PN_ALIAS_pn-rt-tests = "Debian=rt-tests Ubuntu=rt-tests"
@@ -356,7 +338,6 @@ DISTRO_PN_ALIAS_pn-sato-icon-theme = "OpenedHand"
 DISTRO_PN_ALIAS_pn-sato-screenshot = "OpenedHand"
 DISTRO_PN_ALIAS_pn-sbc = "Fedora=sbc Debian=libsbc1"
 DISTRO_PN_ALIAS_pn-screenshot = "OpenedHand"
-DISTRO_PN_ALIAS_pn-scrnsaverproto = "Meego=xorg-x11-proto-scrnsaverproto Ubuntu=x11proto-scrnsaver-dev Debian=x11proto-scrnsaver-dev"
 DISTRO_PN_ALIAS_pn-settings-daemon = "OpenedHand"
 DISTRO_PN_ALIAS_pn-sgml-common = "OpenSuSE=sgml-common Fedora=sgml-common"
 DISTRO_PN_ALIAS_pn-sgmlspl = "Debian=sgmlspl Ubuntu=sgmlspl"
@@ -393,7 +374,6 @@ DISTRO_PN_ALIAS_pn-update-rc.d = "OE-Core"
 DISTRO_PN_ALIAS_pn-usbinit = "OE-Core"
 DISTRO_PN_ALIAS_pn-util-macros = "Meego=xorg-x11-util-macros Fedora=xorg-x11-util-macros Mandriva=x11-util-macros"
 DISTRO_PN_ALIAS_pn-v86d = "Debian=v86d Ubuntu=v86d"
-DISTRO_PN_ALIAS_pn-videoproto = "Meego=xorg-x11-proto-videoproto"
 DISTRO_PN_ALIAS_pn-waffle = "OE-Core"
 DISTRO_PN_ALIAS_pn-watchdog = "Debian=watchdog Ubuntu=watchdog Mandriva=watchdog"
 DISTRO_PN_ALIAS_pn-webkitgtk = "Fedora=webkitgtk Ubuntu=libwebkit"
@@ -405,21 +385,15 @@ DISTRO_PN_ALIAS_pn-x11perf = "Fedora=xorg-x11-apps Ubuntu=x11-apps"
 DISTRO_PN_ALIAS_pn-xcb-util-image = "Debian=xcb-util Fedora=xcb-util"
 DISTRO_PN_ALIAS_pn-xcb-util-keysyms = "Debian=xcb-util Fedora=xcb-util"
 DISTRO_PN_ALIAS_pn-xcb-util-wm = "Debian=xcb-util Fedora=xcb-util"
-DISTRO_PN_ALIAS_pn-xcmiscproto = "Meego=xorg-x11-proto-xcmiscproto"
 DISTRO_PN_ALIAS_pn-xcursor-transparent-theme = "OpenedHand"
 DISTRO_PN_ALIAS_pn-xdpyinfo = "Fedora=xorg-x11-utils Ubuntu=x11-utils"
 DISTRO_PN_ALIAS_pn-xev = "Fedora=xorg-x11-utils Ubuntu=x11-utils"
-DISTRO_PN_ALIAS_pn-xextproto = "Meego=xorg-x11-proto-xextproto"
 DISTRO_PN_ALIAS_pn-xeyes = "Ubuntu=x11-apps Fedora=xorg-x11-apps"
-DISTRO_PN_ALIAS_pn-xf86bigfontproto = "Meego=xorg-x11-proto-xf86bigfontproto"
-DISTRO_PN_ALIAS_pn-xf86dgaproto = "Meego=xorg-x11-proto-xf86dgaproto"
-DISTRO_PN_ALIAS_pn-xf86driproto = "Meego=xorg-x11-proto-xf86driproto"
 DISTRO_PN_ALIAS_pn-xf86-input-evdev = "Ubuntu=xserver-xorg-input-evdev Mandriva=x11-driver-input-evdev Debian=xserver-xorg-input-evdev Fedora=xorg-x11-drv-evdev Meego=xorg-x11-drv-evdev"
 DISTRO_PN_ALIAS_pn-xf86-input-keyboard = "Meego=xorg-x11-drv-keyboard Fedora=xorg-x11-drv-keyboard Mandriva=x11-driver-input-keyboard Debian=xserver-xorg-input-keyboard"
 DISTRO_PN_ALIAS_pn-xf86-input-mouse = "Ubuntu=xserver-xorg-input-mouse Mandriva=x11-driver-input-mouse Debian=xserver-xorg-input-mouse"
 DISTRO_PN_ALIAS_pn-xf86-input-synaptics = "Meego=xorg-x11-drv-synaptics Fedora=xorg-x11-drv-synaptics Ubuntu=xserver-xorg-input-synaptics Mandriva=x11-driver-input-synaptics Debian=xfree86-driver-synaptics"
 DISTRO_PN_ALIAS_pn-xf86-input-vmmouse = "Fedora=xorg-x11-drv-vmmouse Ubuntu=xserver-xorg-input-vmmouse Mandriva=x11-driver-input-vmmouse Debian=xserver-xorg-input-vmmouse"
-DISTRO_PN_ALIAS_pn-xf86miscproto = "Meego=xorg-x11-proto-xf86miscproto"
 DISTRO_PN_ALIAS_pn-xf86-video-cirrus = "Opensuse=xf86-video-cirrus Debian=xserver-xorg-video-cirrus"
 DISTRO_PN_ALIAS_pn-xf86-video-fbdev = "Ubuntu=xserver-xorg-video-fbdev Debian=xserver-xorg-video-fbdev"
 DISTRO_PN_ALIAS_pn-xf86-video-intel = "Debian=xserver-xorg-video-intel Fedora=xorg-x11-drv-intel Mandriva=x11-driver-video-intel Meego=xorg-x11-drv-intel Ubuntu=xserver-xorg-video-intel"
@@ -428,15 +402,13 @@ DISTRO_PN_ALIAS_pn-xf86-video-omap = "Ubuntu=xf86-video-omap Debian=xf86-video-o
 DISTRO_PN_ALIAS_pn-xf86-video-omapfb = "OSPDT"
 DISTRO_PN_ALIAS_pn-xf86-video-vesa = "Debian=xserver-xorg-video-vesa Fedora=xorg-x11-drv-vesa Mandriva=x11-driver-video-vesa Ubuntu=xserver-xorg-video-vesa"
 DISTRO_PN_ALIAS_pn-xf86-video-vmware = "Debian=xserver-xorg-video-vmware Fedora=xorg-x11-drv-vmware Mandriva=x11-driver-video-vmware Ubuntu=xserver-xorg-video-vmware"
-DISTRO_PN_ALIAS_pn-xf86vidmodeproto = "Meego=xorg-x11-proto-xf86vidmodeproto Ubuntu=x11proto-xf86vidmode Debian=x11proto-xf86vidmode"
 DISTRO_PN_ALIAS_pn-xhost = "Ubuntu=x11-xserver-utils Fedora=xorg-x11-server-utils"
-DISTRO_PN_ALIAS_pn-xineramaproto = "Meego=xorg-x11-proto-xineramaproto Ubuntu=x11proto-xinerama Debian=x11proto-xinerama"
 DISTRO_PN_ALIAS_pn-xinput-calibrator = "Fedora=xinput-calibrator Mandravia=xinput-calibrator Ubuntu=xinput-calibrator"
 DISTRO_PN_ALIAS_pn-xkbcomp = "Ubuntu=x11-xkb-utils Fedora=xorg-x11-xkb-utils"
 DISTRO_PN_ALIAS_pn-xmodmap = "Meego=xorg-x11-utils-xmodmap Fedora=xorg-x11-server-utils Ubuntu=x11-xserver-utils"
 DISTRO_PN_ALIAS_pn-xorg-minimal-fonts = "Ubuntu=xfonts-base Fedora=xorg-x11-fonts-base"
+DISTRO_PN_ALIAS_pn-xorgproto = "OSPDT upstream=http://cgit.freedesktop.org/xorg/proto/xorgproto"
 DISTRO_PN_ALIAS_pn-xprop = "Meego=xorg-x11-utils-xprop Fedora=xorg-x11-utils Ubuntu=x11-utils"
-DISTRO_PN_ALIAS_pn-xproto = "Meego=xorg-x11-proto-xproto Fedora=xorg-x11-proto-devel Ubuntu=x11proto-core-dev Debian=x11proto-core-dev Opensuse=xorg-x11-proto-devel Mandriva=x11-proto-devel"
 DISTRO_PN_ALIAS_pn-xproxymanagementprotocol = "Meego=xorg-x11-proto-xproxymanagementprotocol"
 DISTRO_PN_ALIAS_pn-xrandr = "Ubuntu=x11-xserver-utils Fedora=xorg-x11-server-utils"
 DISTRO_PN_ALIAS_pn-xrdb = "Ubuntu=x11-xserver-utils Fedora=xorg-x11-server-utils"
diff --git a/meta/conf/distro/include/maintainers.inc b/meta/conf/distro/include/maintainers.inc
index e471891..5b142c0 100644
--- a/meta/conf/distro/include/maintainers.inc
+++ b/meta/conf/distro/include/maintainers.inc
@@ -66,7 +66,6 @@ RECIPE_MAINTAINER_pn-bash-completion = "Alexander Kanavin <alexander.kanavin@int
 RECIPE_MAINTAINER_pn-bc = "Jose Lamego <jose.a.lamego@linux.intel.com>"
 RECIPE_MAINTAINER_pn-bdwgc = "Alexander Kanavin <alexander.kanavin@intel.com>"
 RECIPE_MAINTAINER_pn-beecrypt = "Armin Kuster <akuster@mvista.com>"
-RECIPE_MAINTAINER_pn-bigreqsproto = "Armin Kuster <akuster@mvista.com>"
 RECIPE_MAINTAINER_pn-bind = "Armin Kuster <akuster@mvista.com>"
 RECIPE_MAINTAINER_pn-binutils = "Khem Raj <raj.khem@gmail.com>"
 RECIPE_MAINTAINER_pn-binutils-cross = "Khem Raj <raj.khem@gmail.com>"
@@ -92,7 +91,6 @@ RECIPE_MAINTAINER_pn-busybox-inittab = "Denys Dmytriyenko <denys@ti.com>"
 RECIPE_MAINTAINER_pn-bzip2 = "Denys Dmytriyenko <denys@ti.com>"
 RECIPE_MAINTAINER_pn-ca-certificates = "Alexander Kanavin <alexander.kanavin@intel.com>"
 RECIPE_MAINTAINER_pn-cairo = "Maxin B. John <maxin.john@intel.com>"
-RECIPE_MAINTAINER_pn-calibrateproto = "Armin Kuster <akuster@mvista.com>"
 RECIPE_MAINTAINER_pn-cantarell-fonts = "Alexander Kanavin <alexander.kanavin@intel.com>"
 RECIPE_MAINTAINER_pn-ccache = "Robert Yang <liezhi.yang@windriver.com>"
 RECIPE_MAINTAINER_pn-cdrtools-native = "Yi Zhao <yi.zhao@windriver.com>"
@@ -105,7 +103,6 @@ RECIPE_MAINTAINER_pn-clutter-gtk-1.0 = "Maxin B. John <maxin.john@intel.com>"
 RECIPE_MAINTAINER_pn-cmake = "Otavio Salvador <otavio.salvador@ossystems.com.br>"
 RECIPE_MAINTAINER_pn-cmake-native = "Otavio Salvador <otavio.salvador@ossystems.com.br>"
 RECIPE_MAINTAINER_pn-cogl-1.0 = "Maxin B. John <maxin.john@intel.com>"
-RECIPE_MAINTAINER_pn-compositeproto = "Armin Kuster <akuster@mvista.com>"
 RECIPE_MAINTAINER_pn-connman = "Changhyeok Bae <changhyeok.bae@lge.com>"
 RECIPE_MAINTAINER_pn-connman-conf = "Maxin B. John <maxin.john@intel.com>"
 RECIPE_MAINTAINER_pn-connman-gnome = "Maxin B. John <maxin.john@intel.com>"
@@ -124,7 +121,6 @@ RECIPE_MAINTAINER_pn-cups = "Chen Qi <Qi.Chen@windriver.com>"
 RECIPE_MAINTAINER_pn-curl = "Armin Kuster <akuster@mvista.com>"
 RECIPE_MAINTAINER_pn-cve-check-tool = "Ross Burton <ross.burton@intel.com>"
 RECIPE_MAINTAINER_pn-cwautomacros = "Maxin B. John <maxin.john@intel.com>"
-RECIPE_MAINTAINER_pn-damageproto = "Armin Kuster <akuster@mvista.com>"
 RECIPE_MAINTAINER_pn-db = "Mark Hatle <mark.hatle@windriver.com>"
 RECIPE_MAINTAINER_pn-dbus = "Chen Qi <Qi.Chen@windriver.com>"
 RECIPE_MAINTAINER_pn-dbus-glib = "Chen Qi <Qi.Chen@windriver.com>"
@@ -141,14 +137,11 @@ RECIPE_MAINTAINER_pn-directfb-examples = "Hongxu Jia <hongxu.jia@windriver.com>"
 RECIPE_MAINTAINER_pn-distcc = "Hongxu Jia <hongxu.jia@windriver.com>"
 RECIPE_MAINTAINER_pn-distcc-config = "Yi Zhao <yi.zhao@windriver.com>"
 RECIPE_MAINTAINER_pn-dmidecode = "Alexander Kanavin <alexander.kanavin@intel.com>"
-RECIPE_MAINTAINER_pn-dmxproto = "Armin Kuster <akuster@mvista.com>"
 RECIPE_MAINTAINER_pn-dnf = "Alexander Kanavin <alexander.kanavin@intel.com>"
 RECIPE_MAINTAINER_pn-docbook-xml-dtd4 = "Yi Zhao <yi.zhao@windriver.com>"
 RECIPE_MAINTAINER_pn-docbook-xsl-stylesheets = "Yi Zhao <yi.zhao@windriver.com>"
 RECIPE_MAINTAINER_pn-dosfstools = "Yi Zhao <yi.zhao@windriver.com>"
 RECIPE_MAINTAINER_pn-dpkg = "Aníbal Limón <limon.anibal@gmail.com>"
-RECIPE_MAINTAINER_pn-dri2proto = "Armin Kuster <akuster@mvista.com>"
-RECIPE_MAINTAINER_pn-dri3proto = "Armin Kuster <akuster@mvista.com>"
 RECIPE_MAINTAINER_pn-dropbear = "Yi Zhao <yi.zhao@windriver.com>"
 RECIPE_MAINTAINER_pn-dtc = "Alexander Kanavin <alexander.kanavin@intel.com>"
 RECIPE_MAINTAINER_pn-dwarfsrcfiles = "Alexander Kanavin <alexander.kanavin@intel.com>"
@@ -170,13 +163,11 @@ RECIPE_MAINTAINER_pn-expect = "Alexander Kanavin <alexander.kanavin@intel.com>"
 RECIPE_MAINTAINER_pn-ffmpeg = "Alexander Kanavin <alexander.kanavin@intel.com>"
 RECIPE_MAINTAINER_pn-file = "Yi Zhao <yi.zhao@windriver.com>"
 RECIPE_MAINTAINER_pn-findutils = "Chen Qi <Qi.Chen@windriver.com>"
-RECIPE_MAINTAINER_pn-fixesproto = "Armin Kuster <akuster@mvista.com>"
 RECIPE_MAINTAINER_pn-flac = "Tanu Kaskinen <tanuk@iki.fi>"
 RECIPE_MAINTAINER_pn-flex = "Chen Qi <Qi.Chen@windriver.com>"
 RECIPE_MAINTAINER_pn-font-alias = "Armin Kuster <akuster@mvista.com>"
 RECIPE_MAINTAINER_pn-font-util = "Armin Kuster <akuster@mvista.com>"
 RECIPE_MAINTAINER_pn-fontconfig = "Maxin B. John <maxin.john@intel.com>"
-RECIPE_MAINTAINER_pn-fontsproto = "Armin Kuster <akuster@mvista.com>"
 RECIPE_MAINTAINER_pn-foomatic-filters = "Chen Qi <Qi.Chen@windriver.com>"
 RECIPE_MAINTAINER_pn-formfactor = "Maxin B. John <maxin.john@intel.com>"
 RECIPE_MAINTAINER_pn-freetype = "Maxin B. John <maxin.john@intel.com>"
@@ -213,7 +204,6 @@ RECIPE_MAINTAINER_pn-glibc-locale = "Khem Raj <raj.khem@gmail.com>"
 RECIPE_MAINTAINER_pn-glibc-mtrace = "Khem Raj <raj.khem@gmail.com>"
 RECIPE_MAINTAINER_pn-glibc-scripts = "Khem Raj <raj.khem@gmail.com>"
 RECIPE_MAINTAINER_pn-glide = "Otavio Salvador <otavio.salvador@ossystems.com.br>"
-RECIPE_MAINTAINER_pn-glproto = "Armin Kuster <akuster@mvista.com>"
 RECIPE_MAINTAINER_pn-gmp = "Khem Raj <raj.khem@gmail.com>"
 RECIPE_MAINTAINER_pn-gnome-common = "Maxin B. John <maxin.john@intel.com>"
 RECIPE_MAINTAINER_pn-gnome-desktop-testing = "Maxin B. John <maxin.john@intel.com>"
@@ -281,7 +271,6 @@ RECIPE_MAINTAINER_pn-initramfs-live-install-efi = "Chang Rebecca Swee Fun <rebec
 RECIPE_MAINTAINER_pn-initramfs-live-install-efi-testfs = "Chang Rebecca Swee Fun <rebecca.swee.fun.chang@intel.com>"
 RECIPE_MAINTAINER_pn-initramfs-live-install-testfs = "Chang Rebecca Swee Fun <rebecca.swee.fun.chang@intel.com>"
 RECIPE_MAINTAINER_pn-initscripts = "Chang Rebecca Swee Fun <rebecca.swee.fun.chang@intel.com>"
-RECIPE_MAINTAINER_pn-inputproto = "Armin Kuster <akuster@mvista.com>"
 RECIPE_MAINTAINER_pn-intltool = "Alexander Kanavin <alexander.kanavin@intel.com>"
 RECIPE_MAINTAINER_pn-iproute2 = "Changhyeok Bae <changhyeok.bae@lge.com>"
 RECIPE_MAINTAINER_pn-iptables = "Changhyeok Bae <changhyeok.bae@lge.com>"
@@ -293,7 +282,6 @@ RECIPE_MAINTAINER_pn-libjpeg-turbo = "Maxin B. John <maxin.john@intel.com>"
 RECIPE_MAINTAINER_pn-json-c = "Yi Zhao <yi.zhao@windriver.com>"
 RECIPE_MAINTAINER_pn-json-glib = "Yi Zhao <yi.zhao@windriver.com>"
 RECIPE_MAINTAINER_pn-kbd = "Alexander Kanavin <alexander.kanavin@intel.com>"
-RECIPE_MAINTAINER_pn-kbproto = "Armin Kuster <akuster@mvista.com>"
 RECIPE_MAINTAINER_pn-kconfig-frontends = "Alexander Kanavin <alexander.kanavin@intel.com>"
 RECIPE_MAINTAINER_pn-kern-tools-native = "Bruce Ashfield <bruce.ashfield@windriver.com>"
 RECIPE_MAINTAINER_pn-kernelshark = "Alexander Kanavin <alexander.kanavin@intel.com>"
@@ -584,7 +572,6 @@ RECIPE_MAINTAINER_pn-powertop = "Alexander Kanavin <alexander.kanavin@intel.com>
 RECIPE_MAINTAINER_pn-ppp = "Hongxu Jia <hongxu.jia@windriver.com>"
 RECIPE_MAINTAINER_pn-ppp-dialin = "Hongxu Jia <hongxu.jia@windriver.com>"
 RECIPE_MAINTAINER_pn-prelink = "Mark Hatle <mark.hatle@windriver.com>"
-RECIPE_MAINTAINER_pn-presentproto = "Armin Kuster <akuster@mvista.com>"
 RECIPE_MAINTAINER_pn-procps = "Alexander Kanavin <alexander.kanavin@intel.com>"
 RECIPE_MAINTAINER_pn-pseudo = "Mark Hatle <mark.hatle@windriver.com>"
 RECIPE_MAINTAINER_pn-psmisc = "Alexander Kanavin <alexander.kanavin@intel.com>"
@@ -623,14 +610,10 @@ RECIPE_MAINTAINER_pn-qemuwrapper-cross = "Juro Bystricky <juro.bystricky@intel.c
 RECIPE_MAINTAINER_pn-quilt = "Robert Yang <liezhi.yang@windriver.com>"
 RECIPE_MAINTAINER_pn-quilt-native = "Robert Yang <liezhi.yang@windriver.com>"
 RECIPE_MAINTAINER_pn-quota = "Maxin B. John <maxin.john@intel.com>"
-RECIPE_MAINTAINER_pn-randrproto = "Armin Kuster <akuster@mvista.com>"
 RECIPE_MAINTAINER_pn-re2c = "Khem Raj <raj.khem@gmail.com>"
 RECIPE_MAINTAINER_pn-readline = "Hongxu Jia <hongxu.jia@windriver.com>"
-RECIPE_MAINTAINER_pn-recordproto = "Armin Kuster <akuster@mvista.com>"
 RECIPE_MAINTAINER_pn-remake = "Robert Yang <liezhi.yang@windriver.com>"
-RECIPE_MAINTAINER_pn-renderproto = "Armin Kuster <akuster@mvista.com>"
 RECIPE_MAINTAINER_pn-resolvconf = "Chen Qi <Qi.Chen@windriver.com>"
-RECIPE_MAINTAINER_pn-resourceproto = "Armin Kuster <akuster@mvista.com>"
 RECIPE_MAINTAINER_pn-rgb = "Armin Kuster <akuster@mvista.com>"
 RECIPE_MAINTAINER_pn-rpcbind = "Hongxu Jia <hongxu.jia@windriver.com>"
 RECIPE_MAINTAINER_pn-rng-tools = "Maxin B. John <maxin.john@intel.com>"
@@ -644,7 +627,6 @@ RECIPE_MAINTAINER_pn-rxvt-unicode = "Armin Kuster <akuster@mvista.com>"
 RECIPE_MAINTAINER_pn-sato-screenshot = "Maxin B. John <maxin.john@intel.com>"
 RECIPE_MAINTAINER_pn-sbc = "Tanu Kaskinen <tanuk@iki.fi>"
 RECIPE_MAINTAINER_pn-screen = "Maxin B. John <maxin.john@intel.com>"
-RECIPE_MAINTAINER_pn-scrnsaverproto = "Armin Kuster <akuster@mvista.com>"
 RECIPE_MAINTAINER_pn-sed = "Chen Qi <Qi.Chen@windriver.com>"
 RECIPE_MAINTAINER_pn-serf = "Maxin B. John <maxin.john@intel.com>"
 RECIPE_MAINTAINER_pn-setserial = "Yi Zhao <yi.zhao@windriver.com>"
@@ -718,7 +700,6 @@ RECIPE_MAINTAINER_pn-util-macros = "Armin Kuster <akuster@mvista.com>"
 RECIPE_MAINTAINER_pn-v86d = "Alexander Kanavin <alexander.kanavin@intel.com>"
 RECIPE_MAINTAINER_pn-vala = "Alexander Kanavin <alexander.kanavin@intel.com>"
 RECIPE_MAINTAINER_pn-valgrind = "Alexander Kanavin <alexander.kanavin@intel.com>"
-RECIPE_MAINTAINER_pn-videoproto = "Armin Kuster <akuster@mvista.com>"
 RECIPE_MAINTAINER_pn-volatile-binds = "Chen Qi <Qi.Chen@windriver.com>"
 RECIPE_MAINTAINER_pn-vte = "Maxin B. John <maxin.john@intel.com>"
 RECIPE_MAINTAINER_pn-vulkan = "Maxin B. John <maxin.john@intel.com>"
@@ -746,12 +727,10 @@ RECIPE_MAINTAINER_pn-xcb-util-image = "Armin Kuster <akuster@mvista.com>"
 RECIPE_MAINTAINER_pn-xcb-util-keysyms = "Armin Kuster <akuster@mvista.com>"
 RECIPE_MAINTAINER_pn-xcb-util-renderutil = "Armin Kuster <akuster@mvista.com>"
 RECIPE_MAINTAINER_pn-xcb-util-wm = "Armin Kuster <akuster@mvista.com>"
-RECIPE_MAINTAINER_pn-xcmiscproto = "Armin Kuster <akuster@mvista.com>"
 RECIPE_MAINTAINER_pn-xcursor-transparent-theme = "Armin Kuster <akuster@mvista.com>"
 RECIPE_MAINTAINER_pn-xdg-utils = "Maxin B. John <maxin.john@intel.com>"
 RECIPE_MAINTAINER_pn-xdpyinfo = "Armin Kuster <akuster@mvista.com>"
 RECIPE_MAINTAINER_pn-xev = "Armin Kuster <akuster@mvista.com>"
-RECIPE_MAINTAINER_pn-xextproto = "Armin Kuster <akuster@mvista.com>"
 RECIPE_MAINTAINER_pn-xeyes = "Armin Kuster <akuster@mvista.com>"
 RECIPE_MAINTAINER_pn-xf86-input-evdev = "Armin Kuster <akuster@mvista.com>"
 RECIPE_MAINTAINER_pn-xf86-input-keyboard = "Armin Kuster <akuster@mvista.com>"
@@ -766,12 +745,7 @@ RECIPE_MAINTAINER_pn-xf86-video-omap = "Armin Kuster <akuster@mvista.com>"
 RECIPE_MAINTAINER_pn-xf86-video-omapfb = "Armin Kuster <akuster@mvista.com>"
 RECIPE_MAINTAINER_pn-xf86-video-vesa = "Armin Kuster <akuster@mvista.com>"
 RECIPE_MAINTAINER_pn-xf86-video-vmware = "Armin Kuster <akuster@mvista.com>"
-RECIPE_MAINTAINER_pn-xf86dgaproto = "Armin Kuster <akuster@mvista.com>"
-RECIPE_MAINTAINER_pn-xf86driproto = "Armin Kuster <akuster@mvista.com>"
-RECIPE_MAINTAINER_pn-xf86miscproto = "Armin Kuster <akuster@mvista.com>"
-RECIPE_MAINTAINER_pn-xf86vidmodeproto = "Armin Kuster <akuster@mvista.com>"
 RECIPE_MAINTAINER_pn-xhost = "Armin Kuster <akuster@mvista.com>"
-RECIPE_MAINTAINER_pn-xineramaproto = "Armin Kuster <akuster@mvista.com>"
 RECIPE_MAINTAINER_pn-xinetd = "Maxin B. John <maxin.john@intel.com>"
 RECIPE_MAINTAINER_pn-xinit = "Armin Kuster <akuster@mvista.com>"
 RECIPE_MAINTAINER_pn-xinput = "Armin Kuster <akuster@mvista.com>"
@@ -781,8 +755,8 @@ RECIPE_MAINTAINER_pn-xkeyboard-config = "Armin Kuster <akuster@mvista.com>"
 RECIPE_MAINTAINER_pn-xmlto = "Hongxu Jia <hongxu.jia@windriver.com>"
 RECIPE_MAINTAINER_pn-xmodmap = "Armin Kuster <akuster@mvista.com>"
 RECIPE_MAINTAINER_pn-xorg-minimal-fonts = "Armin Kuster <akuster@mvista.com>"
+RECIPE_MAINTAINER_pn-xorgproto = "Armin Kuster <akuster@mvista.com>"
 RECIPE_MAINTAINER_pn-xprop = "Armin Kuster <akuster@mvista.com>"
-RECIPE_MAINTAINER_pn-xproto = "Armin Kuster <akuster@mvista.com>"
 RECIPE_MAINTAINER_pn-xrandr = "Armin Kuster <akuster@mvista.com>"
 RECIPE_MAINTAINER_pn-xrestop = "Armin Kuster <akuster@mvista.com>"
 RECIPE_MAINTAINER_pn-xserver-nodm-init = "Armin Kuster <akuster@mvista.com>"
-- 
2.7.4


