Return-Path: <ross.burton@intel.com>
Received: from mail-wm1-f48.google.com (mail-wm1-f48.google.com
	[209.85.128.48])
	by mail.openembedded.org (Postfix) with ESMTP id C8596605BF
	for <openembedded-core@lists.openembedded.org>;
	Tue,  8 Jan 2019 14:38:55 +0000 (UTC)
Received: by mail-wm1-f48.google.com with SMTP id d15so4362540wmb.3
	for <openembedded-core@lists.openembedded.org>;
	Tue, 08 Jan 2019 06:38:57 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=intel-com.20150623.gappssmtp.com; s=20150623;
	h=from:to:cc:subject:date:message-id:in-reply-to:references;
	bh=OaCTcLhHTVobEAETOpt0tXiasukOGjfwn6nYGzXaIAA=;
	b=sER3vdXW+vW0w5DI4v5SzN6ndusN0LenbjPhsC5j30vC21DdN0aJkF9YRQoKJqY77K
	s3493OlwKwuYH0fHnDA5SLl2ZPahUMKmejD7eSlYsvSrHLIeDAp/Ev3AtoMluhmFYGFQ
	a0+5OOWVmCJJiuQVckHIalNWyX9vGvF8Brac6jJOCrFjQzxkDLnseZqGlXDyFln55CYV
	8y/+G9ym/204pLQo8ubTu3zuMWuFEtTAoMr60ZLeOymJrZjCuOWWXGpVpg1el58uR+x3
	M3d9O+QmpePucXOIosYpGVL/w4rhZfuG/iCQo4SfOxfvayKOY6IE8IzmB7HbTRLPOcRQ
	C6+g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
	:references;
	bh=OaCTcLhHTVobEAETOpt0tXiasukOGjfwn6nYGzXaIAA=;
	b=Aa6Sh8yjLO4jFjc4rhZFeONW9g4UqLwNNzrQFfGCx6M5EfY6xT7hftTmBZKVvlJy+4
	70rDa898lOIATtbOzRB1GP1Kf6l9dPG4wMZUWIsUghI14TH5LCEomJyaJdZJ/qijAWvf
	VjvylIHqv1wsuHwS0H/9EAKaKqkWyu4LMcGZ26t0CpZpdWSEnGG0kV7VODr3YYHRHNw4
	98TLIy5daR8/tckjOo17Nx/6Her+VOmLvmoLgS2qjEQsnCaho5pc/fgq+swZOaozzs8R
	ozTMOctDKfry3r1jufJKl26pszOaapBIo0M6wPdZnYFezmIlgdLK2xR8Czxr+k/ZxDac
	Rz5A==
X-Gm-Message-State: AJcUukcSf/2ms2TPyiBfZLwciGNntl/DbZB9Nm0prIWHqBHC6Ea0s0rY
	NDSYYn3oTzCvVo2+xXSQxRs08/7vYqA=
X-Google-Smtp-Source: ALg8bN5Qquo9OUI8nitXTN0nTPkXxKQAegk98OXx1D2Gq+8keDhHhcEU2xsRg8C4Nn0LcNNemkqjHA==
X-Received: by 2002:a1c:a9d4:: with SMTP id s203mr1928026wme.132.1546958336234;
	Tue, 08 Jan 2019 06:38:56 -0800 (PST)
Received: from flashheart.burtonini.com (35.106.2.81.in-addr.arpa.
	[81.2.106.35])
	by smtp.gmail.com with ESMTPSA id m4sm11803498wmi.3.2019.01.08.06.38.55
	(version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
	Tue, 08 Jan 2019 06:38:55 -0800 (PST)
From: Ross Burton <ross.burton@intel.com>
To: openembedded-core@lists.openembedded.org
Date: Tue,  8 Jan 2019 14:38:50 +0000
Message-Id: <20190108143851.20544-2-ross.burton@intel.com>
X-Mailer: git-send-email 2.11.0
In-Reply-To: <20190108143851.20544-1-ross.burton@intel.com>
References: <20190108143851.20544-1-ross.burton@intel.com>
Subject: [PATCH 2/3] pulseaudio: add PACKAGECONFIGs for GConf and GSettings
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
X-List-Received-Date: Tue, 08 Jan 2019 14:38:56 -0000

Behaviour is kept the same.

(From OE-Core rev: b1ea450037b3beacc7da5cbd27ad9ce895f475ff)

Signed-off-by: Ross Burton <ross.burton@intel.com>
Signed-off-by: Richard Purdie <richard.purdie@linuxfoundation.org>
---
 meta/recipes-multimedia/pulseaudio/pulseaudio.inc | 17 +++++++++--------
 1 file changed, 9 insertions(+), 8 deletions(-)

diff --git a/meta/recipes-multimedia/pulseaudio/pulseaudio.inc b/meta/recipes-multimedia/pulseaudio/pulseaudio.inc
index 91d9b8ef832..7498185c5f2 100644
--- a/meta/recipes-multimedia/pulseaudio/pulseaudio.inc
+++ b/meta/recipes-multimedia/pulseaudio/pulseaudio.inc
@@ -58,10 +58,10 @@ LIC_FILES_CHKSUM = "file://LICENSE;md5=0e5cd938de1a7a53ea5adac38cc10c39 \
 
 DEPENDS = "libatomic-ops libsndfile1 libtool intltool-native"
 # optional
-DEPENDS += "udev alsa-lib glib-2.0 gconf"
+DEPENDS += "udev alsa-lib glib-2.0"
 DEPENDS += "speexdsp libxml-parser-perl-native libcap"
 
-inherit autotools bash-completion pkgconfig useradd gettext perlnative bluetooth systemd manpages
+inherit autotools bash-completion pkgconfig useradd gettext perlnative bluetooth systemd manpages gsettings
 
 # *.desktop rules wont be generated during configure and build will fail
 # if using --disable-nls
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
@@ -251,8 +249,11 @@ RDEPENDS_pulseaudio-server += "alsa-plugins-pulseaudio-conf"
 RDEPENDS_pulseaudio-module-console-kit =+ "${@bb.utils.contains('DISTRO_FEATURES', 'x11', 'consolekit', '', d)}"
 RDEPENDS_pulseaudio-misc += "pulseaudio-module-cli-protocol-unix"
 
-FILES_pulseaudio-module-gconf += "${libexecdir}/pulse/gconf-helper"
 FILES_pulseaudio-module-alsa-card += "${datadir}/pulseaudio/alsa-mixer"
+FILES_pulseaudio-module-gconf += "${libexecdir}/pulse/gconf-helper"
+
+GSETTINGS_PACKAGE = "${@bb.utils.contains('PACKAGECONFIG', 'gsettings', 'pulseaudio-module-gsettings', '', d)}"
+FILES_pulseaudio-module-gsettings += "${libexecdir}/pulse/gsettings-helper ${datadir}/GConf/gsettings ${datadir}/glib-2.0/schemas"
 
 # The console-kit module is good to have on X11 systems (it keeps PulseAudio
 # running for the duration of the user login session). The device-manager and
-- 
2.11.0


