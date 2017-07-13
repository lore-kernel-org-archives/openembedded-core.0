Return-Path: <shen.joon.tan@intel.com>
Received: from mga06.intel.com (mga06.intel.com [134.134.136.31])
	by mail.openembedded.org (Postfix) with ESMTP id CEC74601A5
	for <openembedded-core@lists.openembedded.org>;
	Thu, 13 Jul 2017 02:22:26 +0000 (UTC)
Received: from fmsmga003.fm.intel.com ([10.253.24.29])
	by orsmga104.jf.intel.com with ESMTP; 12 Jul 2017 19:22:26 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.40,352,1496127600"; d="scan'208";a="878245549"
Received: from rebeccas.png.intel.com ([172.30.199.118])
	by FMSMGA003.fm.intel.com with ESMTP; 12 Jul 2017 19:22:25 -0700
From: Tan Shen Joon <shen.joon.tan@intel.com>
To: openembedded-core@lists.openembedded.org
Date: Thu, 13 Jul 2017 10:23:06 +0800
Message-Id: <1499912586-130190-1-git-send-email-shen.joon.tan@intel.com>
X-Mailer: git-send-email 2.7.4
Subject: [PATCH v2] distro_alias.inc: update unmap packages to other distro
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
X-List-Received-Date: Thu, 13 Jul 2017 02:22:30 -0000

From: Shen Joon Tan <shen.joon.tan@intel.com>

Added packages with different names or based on sources that
generates multiple binaries eg: python-pycurl source generates
python3-pycurl as well. Currently, some of these packages are not
displayed as part of other distro due to naming differences on
the source rather than the binaries as a single source could
produce multiple binaries with different names.

Signed-off-by: Shen Joon Tan <shen.joon.tan@intel.com>
---
 meta/conf/distro/include/distro_alias.inc | 7 +++++++
 1 file changed, 7 insertions(+)

diff --git a/meta/conf/distro/include/distro_alias.inc b/meta/conf/distro/include/distro_alias.inc
index ba47f90..f7c8b4a 100644
--- a/meta/conf/distro/include/distro_alias.inc
+++ b/meta/conf/distro/include/distro_alias.inc
@@ -62,6 +62,7 @@ DISTRO_PN_ALIAS_pn-core-image-testmaster = "OE-Core"
 DISTRO_PN_ALIAS_pn-core-image-testmaster-initramfs = "OE-Core"
 DISTRO_PN_ALIAS_pn-core-image-weston = "OE-Core"
 DISTRO_PN_ALIAS_pn-core-image-x11 = "OE-Core"
+DISTRO_PN_ALIAS_pn-createrepo-c = "Fedora=createrepo_c Clear=createrepo_c"
 DISTRO_PN_ALIAS_pn-cross-localedef = "OSPDT"
 DISTRO_PN_ALIAS_pn-cryptodev-linux = "OE-Core"
 DISTRO_PN_ALIAS_pn-cryptodev-module = "OE-Core"
@@ -128,6 +129,7 @@ DISTRO_PN_ALIAS_pn-gstreamer1.0-plugins-bad = "Debian=gstreamer1.0-plugins-bad U
 DISTRO_PN_ALIAS_pn-gstreamer1.0-plugins-base = "Debian=gstreamer1.0-plugins-base Ubuntu=gstreamer1.0-plugins-base"
 DISTRO_PN_ALIAS_pn-gstreamer1.0-plugins-good = "Debian=gstreamer1.0-plugins-good Ubuntu=gstreamer1.0-plugins-bad"
 DISTRO_PN_ALIAS_pn-gstreamer1.0-rtsp-server = "Ubuntu=gstreamer0.10-rtsp Fedora=gstreamer-rtsp"
+DISTRO_PN_ALIAS_pn-gstreamer1.0-vaapi = "Fedora=gstreamer1-vaapi Debian=gstreamer-vaapi Clear=gstreamer-vaapi"
 DISTRO_PN_ALIAS_pn-gtk+ = "Meego=gtk2 Fedora=gtk2 OpenSuSE=gtk2 Ubuntu=gtk+2.0 Mandriva=gtk+2.0 Debian=gtk+2.0"
 DISTRO_PN_ALIAS_pn-gtk+3 = "Ubuntu=gtk+3.0 Debian=gtk+3.0 Fedora=gtk3"
 DISTRO_PN_ALIAS_pn-gtk-doc = "Fedora=gtk-doc Ubuntu=gtk-doc"
@@ -193,6 +195,7 @@ DISTRO_PN_ALIAS_pn-libomxil = "OSPDT upstream=http://omxil.sourceforge.net/"
 DISTRO_PN_ALIAS_pn-libowl = "Debian=owl OpenedHand"
 DISTRO_PN_ALIAS_pn-libpam = "Meego=pam Fedora=pam OpenSuSE=pam Ubuntu=pam Mandriva=pam Debian=pam"
 DISTRO_PN_ALIAS_pn-libpcre = "Mandriva=libpcre0 Fedora=pcre"
+DISTRO_PN_ALIAS_pn-libpcre2 = "Fedora=pcre2 Debian=pcre2 Clear=pcre2"
 DISTRO_PN_ALIAS_pn-libpng12 = "Debian=libpng12-0 Fedora=libpng"
 DISTRO_PN_ALIAS_pn-libpod-plainer-perl = "OSPDT"
 DISTRO_PN_ALIAS_pn-libsamplerate0 = "Meego=libsamplerate Fedora=libsamplerate OpenSuSE=libsamplerate Ubuntu=libsamplerate Mandriva=libsamplerate Debian=libsamplerate"
@@ -207,6 +210,7 @@ DISTRO_PN_ALIAS_pn-libusb1 = "Debian=libusb-1.0-0 Fedora=libusb1"
 DISTRO_PN_ALIAS_pn-libusb-compat = "OSPDT"
 DISTRO_PN_ALIAS_pn-libx11 = "Debian=libx11-6 Fedora=libX11 Ubuntu=libx11-6 OpenSuSE=xorg-x11-libX11"
 DISTRO_PN_ALIAS_pn-libxcalibrate = "OSPDT upstream=http://cgit.freedesktop.org/xorg/lib/libXCalibrate/"
+DISTRO_PN_ALIAS_pn-libxfont2 = "Fedora=libXfont2 Clear=libXfont2"
 DISTRO_PN_ALIAS_pn-libxft = "Mandriva=libxft Debian=libxft2 Ubuntu=libxft2"
 DISTRO_PN_ALIAS_pn-libxi = "Ubuntu=libxi Fedora=libXi"
 DISTRO_PN_ALIAS_pn-libxkbcommon = "Fedora=libxkbcommon Debian=libxkbcommon"
@@ -323,7 +327,10 @@ DISTRO_PN_ALIAS_pn-pulseaudio-client-conf-sato = "OE-Core"
 DISTRO_PN_ALIAS_pn-puzzles = "Debian=sgt-puzzles Fedora=puzzles"
 DISTRO_PN_ALIAS_pn-python3 = "Fedora=python3 Debian=python3.2"
 DISTRO_PN_ALIAS_pn-python3-distribute = "Debian=python3-setuptools Fedora=python3-setuptools"
+DISTRO_PN_ALIAS_pn-python3-iniparse = "Fedora=python-iniparse Debian=python-iniparse"
 DISTRO_PN_ALIAS_pn-python3-pip = "OpenSuSE=python3-pip Debian=python3-pip"
+DISTRO_PN_ALIAS_pn-python3-pycurl = "Fedora=python-pycurl Debian=pycurl"
+DISTRO_PN_ALIAS_pn-python3-pygpgme = "Fedora=python-pygpgme Debian=pygpgme"
 DISTRO_PN_ALIAS_pn-python3-setuptools = "OpenSuSE=python3-setuptools Debian=python3-setuptools"
 DISTRO_PN_ALIAS_pn-python-dbus = "Ubuntu=python-dbus Debian=python-dbus Mandriva=python-dbus"
 DISTRO_PN_ALIAS_pn-python-distribute = "Opensuse=python-setuptools Fedora=python-setuptools"
-- 
2.7.4


