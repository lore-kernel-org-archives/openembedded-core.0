Return-Path: <elizabeth.flanagan@intel.com>
Received: from mga02.intel.com (mga02.intel.com [134.134.136.20])
	by mail.openembedded.org (Postfix) with ESMTP id 31A5677000
	for <openembedded-core@lists.openembedded.org>;
	Thu,  1 Oct 2015 15:27:55 +0000 (UTC)
Received: from orsmga001.jf.intel.com ([10.7.209.18])
	by orsmga101.jf.intel.com with ESMTP; 01 Oct 2015 08:27:55 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.17,618,1437462000"; d="scan'208";a="781927608"
Received: from rasmusse-mobl.ger.corp.intel.com (HELO
	fuath.ger.corp.intel.com) ([10.252.3.52])
	by orsmga001.jf.intel.com with ESMTP; 01 Oct 2015 08:27:54 -0700
From: Beth Flanagan <elizabeth.flanagan@intel.com>
To: openembedded-core@lists.openembedded.org
Date: Thu,  1 Oct 2015 16:27:36 +0100
Message-Id: <1443713256-1721-1-git-send-email-elizabeth.flanagan@intel.com>
X-Mailer: git-send-email 1.9.1
Subject: [PATCH] distro-alias.inc: Updated for jethro 2.0 release
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
X-List-Received-Date: Thu, 01 Oct 2015 15:27:57 -0000

Updates for distro_alias.inc. This should be pulled for jethro and
master branches.

Signed-off-by: Beth Flanagan <elizabeth.flanagan@intel.com>
---
 meta/conf/distro/include/distro_alias.inc | 10 ++++++++++
 1 file changed, 10 insertions(+)

diff --git a/meta/conf/distro/include/distro_alias.inc b/meta/conf/distro/include/distro_alias.inc
index bd3da9c..ca333c8 100644
--- a/meta/conf/distro/include/distro_alias.inc
+++ b/meta/conf/distro/include/distro_alias.inc
@@ -14,6 +14,7 @@ DISTRO_PN_ALIAS_pn-abiword-embedded = "Fedora=abiword Ubuntu=abiword"
 DISTRO_PN_ALIAS_pn-adt-installer = "Intel"
 DISTRO_PN_ALIAS_pn-alsa-state = "OE-Core"
 DISTRO_PN_ALIAS_pn-alsa-utils-alsaconf = "OE-Core"
+DISTRO_PN_ALIAS_pn-alsa-utils-scripts = "OE-Core"
 DISTRO_PN_ALIAS_pn-atk = "Fedora=atk OpenSuSE=atk"
 DISTRO_PN_ALIAS_pn-augeas = "Ubuntu=libaugeas0 Debian=libaugeas0"
 DISTRO_PN_ALIAS_pn-avahi-ui = "Ubuntu=avahi-discover Debian=avahi-discover"
@@ -43,6 +44,7 @@ DISTRO_PN_ALIAS_pn-clutter = "Fedora=clutter OpenSuse=clutter Ubuntu=clutter-1.0
 DISTRO_PN_ALIAS_pn-clutter-1.8 = "Fedora=clutter OpenSuse=clutter Ubuntu=clutter-1.0 Mandriva=clutter Debian=clutter"
 DISTRO_PN_ALIAS_pn-clutter-gst-1.0 = "Debian=clutter-gst Ubuntu=clutter-gst Fedora=clutter-gst"
 DISTRO_PN_ALIAS_pn-clutter-gst-1.8 = "Fedora=clutter-gst Debian=libclutter-gst"
+DISTRO_PN_ALIAS_pn-clutter-gst-3.0 = "Ubuntu=libclutter-gst Debian=libclutter-gst"
 DISTRO_PN_ALIAS_pn-clutter-gtk-1.0 = "Debian=clutter-gtk Ubuntu=clutter-gtk Fedora=clutter-gtk"
 DISTRO_PN_ALIAS_pn-clutter-gtk-1.8 = "Fedora=clutter-gtk OpenSuSE=clutter-gtk Ubuntu=clutter-gtk-0.10 Mandriva=clutter-gtk Debian=clutter-gtk"
 DISTRO_PN_ALIAS_pn-cogl-1.0 = "Debian=cogl Ubuntu=cogl Fedora=cogl"
@@ -220,6 +222,7 @@ DISTRO_PN_ALIAS_pn-libmatchbox = "Ubuntu=libmatchbox Fedora=libmatchbox"
 DISTRO_PN_ALIAS_pn-libmpc = "Fedora=libmpc OpenSuse=libmpc2"
 DISTRO_PN_ALIAS_pn-libnewt = "Debian=libnewt0.52 Fedora=newt"
 DISTRO_PN_ALIAS_pn-libnewt-python = "Ubuntu=python-newt Fedora=newt-python"
+DISTRO_PN_ALIAS_pn-libnl = "Mandriva=libnl Fedora=libnl"
 DISTRO_PN_ALIAS_pn-libnss-mdns = "Meego=nss-mdns OpenSuSE=nss-mdns Ubuntu=nss-mdns Mandriva=nss_mdns Debian=nss-mdns"
 DISTRO_PN_ALIAS_pn-libomxil = "OSPDT upstream=http://omxil.sourceforge.net/"
 DISTRO_PN_ALIAS_pn-libowl = "Debian=owl OpenedHand"
@@ -383,14 +386,18 @@ DISTRO_PN_ALIAS_pn-printproto = "Debian=x11proto-print-dev Ubuntu=x11proto-print
 DISTRO_PN_ALIAS_pn-pseudo = "Windriver"
 DISTRO_PN_ALIAS_pn-psplash = "OpenedHand"
 DISTRO_PN_ALIAS_pn-ptest-runner = "OE-Core"
+DISTRO_PN_ALIAS_pn-pulseaudio-client-conf-sato = "OE-Core"
 DISTRO_PN_ALIAS_pn-puzzles = "Debian=sgt-puzzles Fedora=puzzles"
 DISTRO_PN_ALIAS_pn-python3 = "Fedora=python3 Debian=python3.2"
 DISTRO_PN_ALIAS_pn-python3-distribute = "Debian=python3-setuptools Fedora=python3-setuptools"
+DISTRO_PN_ALIAS_pn-python3-pip = "OpenSuSE=python3-pip Debian=python3-pip"
+DISTRO_PN_ALIAS_pn-python3-setuptools = "OpenSuSE=python3-setuptools Debian=python3-setuptools"
 DISTRO_PN_ALIAS_pn-python-ZSI = "OE-Core"
 DISTRO_PN_ALIAS_pn-python-argparse = "Fedora=python-argparse OpenSuSE=python-argparse"
 DISTRO_PN_ALIAS_pn-python-dbus = "Ubuntu=python-dbus Debian=python-dbus Mandriva=python-dbus"
 DISTRO_PN_ALIAS_pn-python-distribute = "Opensuse=python-setuptools Fedora=python-setuptools"
 DISTRO_PN_ALIAS_pn-python-git = "Debian=python-git Fedora=GitPython"
+DISTRO_PN_ALIAS_pn-python-imaging = "Mandriva=python-imaging Debian=python-imaging"
 DISTRO_PN_ALIAS_pn-python-mako = "Fedora=python-mako Opensuse=python-Mako"
 DISTRO_PN_ALIAS_pn-python-pycairo = "Meego=pycairo Fedora=pycairo Ubuntu=pycairo Debian=pycairo"
 DISTRO_PN_ALIAS_pn-python-pycurl = "Debian=python-pycurl Ubuntu=python-pycurl"
@@ -436,7 +443,9 @@ DISTRO_PN_ALIAS_pn-shadow-sysroot = "Ubuntu=shadow Fedora=shadow"
 DISTRO_PN_ALIAS_pn-shasum = "OE-Core"
 DISTRO_PN_ALIAS_pn-shutdown-desktop = "OpenedHand"
 DISTRO_PN_ALIAS_pn-signgp = "OE-Core"
+DISTRO_PN_ALIAS_pn-speexdsp = "Ubuntu=libspeexdsp1 Fedora=speexdsp"
 DISTRO_PN_ALIAS_pn-stat = "Debian=coreutils Fedora=coreutils"
+DISTRO_PN_ALIAS_pn-stress = "Debian=stress Fedora=stress"
 DISTRO_PN_ALIAS_pn-swabber = "OE-Core"
 DISTRO_PN_ALIAS_pn-sysklogd = "Debian=sysklogd Mandriva=sysklogd"
 DISTRO_PN_ALIAS_pn-sysprof = "Fedora=sysprof Debian=sysprof"
@@ -460,6 +469,7 @@ DISTRO_PN_ALIAS_pn-ttf-bitstream-vera = "Debian=ttf-bitstream-vera Ubuntu=ttf-bi
 DISTRO_PN_ALIAS_pn-tzcode = "OSPDT"
 DISTRO_PN_ALIAS_pn-u-boot-fw-utils = "Ubuntu=u-boot-tools Debian=u-boot-tools"
 DISTRO_PN_ALIAS_pn-u-boot-mkimage = "Ubuntu=uboot-mkimage Debian=uboot-mkimage"
+DISTRO_PN_ALIAS_pn-udev = "Mandriva=udev Fedora=udev"
 DISTRO_PN_ALIAS_pn-udev-extraconf = "OE-Core"
 DISTRO_PN_ALIAS_pn-unfs3 = "Debian=unfs3 Fedora=unfs3"
 DISTRO_PN_ALIAS_pn-unfs-server = "OE-Core"
-- 
1.9.1

-------------------------------------------------------------
Intel Ireland Limited (Branch)
Collinstown Industrial Park, Leixlip, County Kildare, Ireland
Registered Number: E902934

This e-mail and any attachments may contain confidential material for
the sole use of the intended recipient(s). Any review or distribution
by others is strictly prohibited. If you are not the intended
recipient, please contact the sender and delete all copies.


