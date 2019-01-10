Return-Path: <ross.burton@intel.com>
Received: from mail-wr1-f43.google.com (mail-wr1-f43.google.com
	[209.85.221.43])
	by mail.openembedded.org (Postfix) with ESMTP id D94776D523
	for <openembedded-core@lists.openembedded.org>;
	Thu, 10 Jan 2019 13:53:06 +0000 (UTC)
Received: by mail-wr1-f43.google.com with SMTP id u4so11480763wrp.3
	for <openembedded-core@lists.openembedded.org>;
	Thu, 10 Jan 2019 05:53:08 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=intel-com.20150623.gappssmtp.com; s=20150623;
	h=from:to:cc:subject:date:message-id:in-reply-to:references;
	bh=Cbduw2TWwDyVNqyrtqY1l4nmNMMjsD1ptcxxLUkCb2E=;
	b=0/D9YUhtIGrv2jByRDuaXXvqpEkJsYLkXJGWjxJuxwhWbPMF7PNMnVIId2MU9jeZO5
	q5IRJBlqtGvM5W7ffcs4IfeWOlu44neC+U0GstvkyoWhsUJGwUgNuaoKiQyNJ0iPGiox
	Wft57QCk0vghqexXLgXCWWaYV+IeW1TceIY78l7RuLZDWh6TSv2fP/nalLKJaDWX48zm
	MlUComtwQLWJCKvQGdkq+nFGQfOc+Mb956LgedNBO7f2duAQacE0gIjQOCzj6EaCQ5pI
	n31ZsYlXfxnaXICpPDXtMICgAzACFfjUj0KcrHEAwyFFFD9i4kxgfpWwi559Z2SNJB6L
	mGOA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
	:references;
	bh=Cbduw2TWwDyVNqyrtqY1l4nmNMMjsD1ptcxxLUkCb2E=;
	b=sFKzgZliKLpNo2PljvlI4JhpvBpgUJlO6VQk24rKNI8S5Fwaw4brn2yZ8aWd6MLMit
	az4vB1fXd2ilD5V7gXJ6xWtCebjZYw9PQ+P98tNSb6+b03xOhiQUCGLKx/XuIltiSGuc
	G0x66ApUjqHfzPSkxRIc6o9uOsEcFVOmc3eiFrWF4d42Bcw6ZSfLJ0dfBRzH/s7v1obr
	EEEMz1g908Lfmb2XnSnmXk0Rd9hBfSpZD8Rvz2X0DqQS0mJfLHPYvQRRbUX2lWUBYR1u
	bs5rJ475N3/t2dj5GjbIG/9onyiSWYYSvppJFkuP4P0CrOgFTJuCcvZzS2v61qLHaMab
	eQxw==
X-Gm-Message-State: AJcUukf+tRHGlGD3gmEJ/bTn/IerGXv/2Ua1h5Tsvj7/8ZIwyVeK3JXB
	PQzU1/sAC5CdVD/nw+B9AwaYqTxHmcM=
X-Google-Smtp-Source: ALg8bN4fYyfxn1+SP5g8p52FjvnplJu/OrleknVZjbNhcFmgqPoHM0+VxT/2t09KhxyUiEyZ4m5kew==
X-Received: by 2002:adf:fa90:: with SMTP id h16mr9982559wrr.326.1547128387221; 
	Thu, 10 Jan 2019 05:53:07 -0800 (PST)
Received: from flashheart.burtonini.com (35.106.2.81.in-addr.arpa.
	[81.2.106.35])
	by smtp.gmail.com with ESMTPSA id q9sm78248587wrp.0.2019.01.10.05.53.06
	(version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
	Thu, 10 Jan 2019 05:53:06 -0800 (PST)
From: Ross Burton <ross.burton@intel.com>
To: openembedded-core@lists.openembedded.org
Date: Thu, 10 Jan 2019 13:53:00 +0000
Message-Id: <20190110135301.1888-4-ross.burton@intel.com>
X-Mailer: git-send-email 2.11.0
In-Reply-To: <20190110135301.1888-1-ross.burton@intel.com>
References: <20190110135301.1888-1-ross.burton@intel.com>
Subject: [PATCH 4/5] pulseaudio: add PACKAGECONFIGs for GConf and GSettings
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
X-List-Received-Date: Thu, 10 Jan 2019 13:53:07 -0000

Behaviour is kept the same.

(From OE-Core rev: 577ce3462b9f37f6c73f07aaf53f68b8dee1887a)

Signed-off-by: Ross Burton <ross.burton@intel.com>
Signed-off-by: Richard Purdie <richard.purdie@linuxfoundation.org>
---
 meta/recipes-multimedia/pulseaudio/pulseaudio.inc | 17 +++++++++--------
 1 file changed, 9 insertions(+), 8 deletions(-)

diff --git a/meta/recipes-multimedia/pulseaudio/pulseaudio.inc b/meta/recipes-multimedia/pulseaudio/pulseaudio.inc
index f81027e655d..9093010c8d9 100644
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
@@ -97,20 +97,18 @@ EXTRA_OECONF += "--without-fftw"
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
@@ -249,8 +247,11 @@ RDEPENDS_pulseaudio-server += "alsa-plugins-pulseaudio-conf"
 RDEPENDS_pulseaudio-module-console-kit =+ "${@bb.utils.contains('DISTRO_FEATURES', 'x11', 'consolekit', '', d)}"
 RDEPENDS_pulseaudio-misc += "pulseaudio-module-cli-protocol-unix"
 
-FILES_${PN}-module-gconf += "${libexecdir}/pulse/gconf-helper"
 FILES_${PN}-module-alsa-card += "${datadir}/pulseaudio/alsa-mixer"
+FILES_${PN}-module-gconf += "${libexecdir}/pulse/gconf-helper"
+
+GSETTINGS_PACKAGE = "${@bb.utils.contains('PACKAGECONFIG', 'gsettings', '${PN}-module-gsettings', '', d)}"
+FILES_${PN}-module-gsettings += "${libexecdir}/pulse/gsettings-helper ${datadir}/GConf/gsettings ${datadir}/glib-2.0/schemas"
 
 # The console-kit module is good to have on X11 systems (it keeps PulseAudio
 # running for the duration of the user login session). The device-manager and
-- 
2.11.0


