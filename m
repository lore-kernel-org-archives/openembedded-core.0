Return-Path: <ross.burton@intel.com>
Received: from mail-wr1-f53.google.com (mail-wr1-f53.google.com
	[209.85.221.53])
	by mail.openembedded.org (Postfix) with ESMTP id 2422D7BF28
	for <openembedded-core@lists.openembedded.org>;
	Mon,  7 Jan 2019 17:42:43 +0000 (UTC)
Received: by mail-wr1-f53.google.com with SMTP id v13so1325123wrw.5
	for <openembedded-core@lists.openembedded.org>;
	Mon, 07 Jan 2019 09:42:44 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=intel-com.20150623.gappssmtp.com; s=20150623;
	h=from:to:subject:date:message-id;
	bh=dDnMvABoEr57XkbWr8+bZTvBoYvQNqfMfZ6URZufXC8=;
	b=z/uGa27yo1AFwAGV63nl3lTMbvNC+5f4z41hcXvCyFSGkooEZv+x3YIjB/HGP0INHw
	KdX2Y4zvrMT+0Fr2V/gSV3aBAxobrO4VRG5QAaAa+wsV1Et/fmSA1g0HnXS+TAIEgw/j
	N3xc+yfM3nhjghYXfTw7jDhe659d5VRdvoWohCvbHmuSrKNOR2mSbgqE9umDyRByiqku
	vQWhZIIpvCuEj9xr2SUnpiF0N86sSYyt48f96wn7OLtOewus14/yoF9QGXG+BIKFp+mU
	x8cLyWZAAiuqgm4EWOxOB9it3P2nU91PX1l/7qVTvaS70DSXaaZiaE4O9AdBkCUrz8+U
	d/rg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:from:to:subject:date:message-id;
	bh=dDnMvABoEr57XkbWr8+bZTvBoYvQNqfMfZ6URZufXC8=;
	b=EpFuzItlgcb4kU33VYitmQ3R8joZUAEiAOM0rKgmnolWfKMMnKe8SDVEFK109vUnKE
	2Ph1Y59P5xeVCPlDyr40zJ4m3EZWQjBHDqwxA1ZckROWvS/F4fh/UncZNKdnEgBAcyNv
	haLYfSrxhy6CG9AArXeh209cCCS08DCwMWnXbb/Vm8CzBkcyw8hL7SfsojyDThXftbng
	/ZPsv02GlwXbz41Ft/yRjww79d6N0Xg4hp4XJ6G4IxFQ7YmCVz88ziK4WmJm3djsQdNf
	3TxzbIqbsw6YmA4d4D0JRPXU9wf4iJ6T0LeIDOzgHXyWkp163jBRE5xxQ3kUc2cu4XUp
	HdLw==
X-Gm-Message-State: AJcUukdWv4PYrZSC02TxzIUSJC9e6zRkfCQngFTIu7sw6/GcaHPOFiSX
	6IL311/3cbbDxUUnOQCT/sMC7FDVJNY=
X-Google-Smtp-Source: ALg8bN6hdfWINpR895EaLH/cX9+/2AHJsd5cFVTtiEjbL6hvITFmhU2JjXDWk399U70EujXjK0kJqg==
X-Received: by 2002:adf:80a9:: with SMTP id 38mr49258115wrl.137.1546882963506; 
	Mon, 07 Jan 2019 09:42:43 -0800 (PST)
Received: from flashheart.burtonini.com (35.106.2.81.in-addr.arpa.
	[81.2.106.35]) by smtp.gmail.com with ESMTPSA id
	e18sm68614360wrv.88.2019.01.07.09.42.42
	for <openembedded-core@lists.openembedded.org>
	(version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
	Mon, 07 Jan 2019 09:42:42 -0800 (PST)
From: Ross Burton <ross.burton@intel.com>
To: openembedded-core@lists.openembedded.org
Date: Mon,  7 Jan 2019 17:42:40 +0000
Message-Id: <20190107174240.851-1-ross.burton@intel.com>
X-Mailer: git-send-email 2.11.0
Subject: [PATCH] pulseaudio: add PACKAGECONFIGs for GConf and GSettings
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
X-List-Received-Date: Mon, 07 Jan 2019 17:42:43 -0000

Behaviour is kept the same.

Signed-off-by: Ross Burton <ross.burton@intel.com>
---
 meta/recipes-multimedia/pulseaudio/pulseaudio.inc | 13 ++++++-------
 1 file changed, 6 insertions(+), 7 deletions(-)

diff --git a/meta/recipes-multimedia/pulseaudio/pulseaudio.inc b/meta/recipes-multimedia/pulseaudio/pulseaudio.inc
index 91d9b8ef832..d6123329502 100644
--- a/meta/recipes-multimedia/pulseaudio/pulseaudio.inc
+++ b/meta/recipes-multimedia/pulseaudio/pulseaudio.inc
@@ -58,7 +58,7 @@ LIC_FILES_CHKSUM = "file://LICENSE;md5=0e5cd938de1a7a53ea5adac38cc10c39 \
 
 DEPENDS = "libatomic-ops libsndfile1 libtool intltool-native"
 # optional
-DEPENDS += "udev alsa-lib glib-2.0 gconf"
+DEPENDS += "udev alsa-lib glib-2.0"
 DEPENDS += "speexdsp libxml-parser-perl-native libcap"
 
 inherit autotools bash-completion pkgconfig useradd gettext perlnative bluetooth systemd manpages
@@ -98,20 +98,18 @@ EXTRA_OECONF += "--without-fftw"
 # very good anyway, better alternatives exist (such as the webrtc canceller).
 EXTRA_OECONF += "--disable-adrian-aec"
 
-# FIXME: The gsettings module is temporarily disabled, because adding support
-# for it is a bit complicated.
-EXTRA_OECONF += "--disable-gsettings"
-
 PACKAGECONFIG ??= "${@bb.utils.contains('DISTRO_FEATURES', 'bluetooth', '${BLUEZ}', '', d)} \
                    ${@bb.utils.contains('DISTRO_FEATURES', 'zeroconf', 'avahi', '', d)} \
                    ${@bb.utils.contains('DISTRO_FEATURES', '3g', 'ofono', '', d)} \
                    ${@bb.utils.filter('DISTRO_FEATURES', 'ipv6 systemd x11', d)} \
-                   dbus \
+                   dbus gconf \
                    "
 
 PACKAGECONFIG[dbus] = "--enable-dbus,--disable-dbus,dbus"
 PACKAGECONFIG[bluez4] = "--enable-bluez4,--disable-bluez4,bluez4 sbc"
 PACKAGECONFIG[bluez5] = "--enable-bluez5,--disable-bluez5,bluez5 sbc"
+PACKAGECONFIG[gconf] = "--enable-gconf,--disable-gconf,gconf"
+PACKAGECONFIG[gsettings] = "--enable-gsettings,--disable-gsettings,glib-2.0-native glib-2.0"
 PACKAGECONFIG[ofono] = "--enable-bluez5-ofono-headset,--disable-bluez5-ofono-headset,ofono"
 PACKAGECONFIG[gtk] = "--enable-gtk3,--disable-gtk3,gtk+3"
 PACKAGECONFIG[systemd] = "--enable-systemd-daemon --enable-systemd-login --enable-systemd-journal --with-systemduserunitdir=${systemd_user_unitdir},--disable-systemd-daemon --disable-systemd-login --disable-systemd-journal,systemd"
@@ -251,8 +249,9 @@ RDEPENDS_pulseaudio-server += "alsa-plugins-pulseaudio-conf"
 RDEPENDS_pulseaudio-module-console-kit =+ "${@bb.utils.contains('DISTRO_FEATURES', 'x11', 'consolekit', '', d)}"
 RDEPENDS_pulseaudio-misc += "pulseaudio-module-cli-protocol-unix"
 
-FILES_pulseaudio-module-gconf += "${libexecdir}/pulse/gconf-helper"
 FILES_pulseaudio-module-alsa-card += "${datadir}/pulseaudio/alsa-mixer"
+FILES_pulseaudio-module-gconf += "${libexecdir}/pulse/gconf-helper"
+FILES_pulseaudio-module-gsettings += "${libexecdir}/pulse/gsettings-helper ${datadir}/GConf/gsettings ${datadir}/glib-2.0/schemas"
 
 # The console-kit module is good to have on X11 systems (it keeps PulseAudio
 # running for the duration of the user login session). The device-manager and
-- 
2.11.0


