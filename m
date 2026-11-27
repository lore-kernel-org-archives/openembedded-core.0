Received: from mail-wr1-f54.google.com (mail-wr1-f54.google.com [209.85.221.54])
 by mx.groups.io with SMTP id smtpd.msgproc02-g2.3704.1795810331174554325
 for <openembedded-core@lists.openembedded.org>;
 Fri, 27 Nov 2026 12:12:11 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20260707 header.b=VPyhnaBf;
 spf=pass (domain: gmail.com, ip: 209.85.221.54, mailfrom: alex.kanavin@gmail.com)
Received: by mail-wr1-f54.google.com with SMTP id ffacd0b85a97d-48e46e449e8so5576290f8f.3
        for <openembedded-core@lists.openembedded.org>; Fri, 27 Nov 2026 12:12:10 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1795810329; x=1796415129; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=f27Bw5w/jgAT6EgVZIHMX4nFn30rWdii9JDeo36fiXY=;
        b=VPyhnaBfKmQvNR4ouj1UaHX36lgSi2MNrctt5CxK5qMNb5FpceNfL9LqG4NQNIFYNA
         QtcocbLDtcwFp/GY6AT14pbyBPBYiyFNoaHaowo6Mb7B8VvmTSMQkkpSHxvksYC33c15
         0TEUotMXlbFHklGSLD52tU9H89lLqrym9yuAAmjoYihDz1p/BkcgG2Rqr9rJeXPFgZo/
         f3C3T/+TYvJvWAgqmbk7NXehnpe5vYfgL1iFWtZkBEsAb7R5alAEZv8qkBtW6NdY6Exb
         y6ijTcU00wtAYJTom5DuE33Tz4tt1X/GCUk7ivGQ5QLOfPHaDDk8n+n8lRpW7sgSq2Xq
         4vYQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1795810329; x=1796415129;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=f27Bw5w/jgAT6EgVZIHMX4nFn30rWdii9JDeo36fiXY=;
        b=mjHOSAL4N1uNvdU2UZk6yqiLy37LwhpVgN4lii46YzfNmMlSEQAEhxfIaSdh5Gre2k
         /JJX/f55+xXMFrGS5cd415ox9Bu8OvSc2FVEk7PZo/HIDcgXumRaYxNozkvRRLBkOFDx
         uamJwafIoWVtwE7ftKa1g6VtIhZPX8rXJTxU5DQRKoPTNUeZLZgTl7mZaGhszp7uqBDi
         5O0LrZ2laARku0j3EE+bCIQH8fljHzPMw/Cq99yNxlUB7WMpdmy9/qwZFwWBQgoLFnLt
         IUaYfihEnEGx30aMHmLhf3qSqmTJ5n4nCxW7ntUsR+a8XqhYt4C1ZENc3l0nHId5EdWF
         AWJQ==
X-Gm-Message-State: APuU4Z+esgwHadHrWxNXgsGgvPARyYtfvCl/h+jH92JpcrG0yTm18pco
	xJY96bbpxFaBFvhMOWAmU8TASl/WeOJWEnH5Fu6BK+ZmTsVobBLNgBB4iqCkFg==
X-Gm-Gg: AZFdTZffQZx6qem+F/YhvyDeyoTZiN7xHYWKCVdmniw3n0j/1JKTcFuf+bstS80GAL8
	TjBw8ceaP1yFogopIhRymYeDZubLfC2QRHulNSIBV2kodmlzYW3OVkWtGWeUOfykkjDlRAc6tPV
	luaJAZ+2HOGLH0F5CoulVjTZYZJRqewb8JVoMcCmhzhMymjm4aEinAP3ZwPqZx8LrfauQ26ZqQq
	yjzRQ1UIi2B/T1Chgm9tevS0hI1AHxkFr0sqiJfsTwKq+iO2vPUdACkBpaGcvpkh+M8dwoEQdJW
	gVMugYH1Qm9dQMoOg708/TFLxrnRPYqpUzIwU8befPUSNV1WH/sjDNKSHMA0rF/VbJ6A45e1i8v
	RGSX0IFzJ/YkkC1REo2FW96lXR74ZbpNynE+GGOLTcbD4KrCVL6GD5fD7LFl+EziRElW6Tev7Tx
	Mosgi5dFLhu6nV7AsBVwGuin2SmyFXY/wcG+FmUlvF57ZjqdSbmUwwdpqIbjJDR1qMNzu87MTeX
	03j+9YYkF+AZAd83e2/nvADxN4FDUkw7T+DyHCZZrnao9fxubEekqgr0lz/iYdsFuKN48HnhQNw
	ffFAxhJaxrQzN66wrtNn1bd1Pj/0a6Ue+N7nL1DBzo7oO0Zj4egnQBmTfMbG82vWYg==
X-Received: by 2002:a05:600d:17:b0:4bb:aa4f:c027 with SMTP id 5b1f17b1804b1-4bbaa4fc171mr142981545e9.0.1795810329158;
        Fri, 27 Nov 2026 12:12:09 -0800 (PST)
Return-Path: <alex.kanavin@gmail.com>
Received: from Zen2.lab.linutronix.de. (drugstore.linutronix.de. [80.153.143.164])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-4bb884ab091sm994530835e9.11.2026.11.27.12.12.08
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 27 Nov 2026 12:12:08 -0800 (PST)
From: Alexander Kanavin <alex.kanavin@gmail.com>
To: openembedded-core@lists.openembedded.org
Cc: Alexander Kanavin <alex@linutronix.de>
Subject: [PATCH 6/6] pulseaudio: remove the recipe
Date: Fri, 27 Nov 2026 21:11:59 +0100
Message-ID: <20261127201159.914833-6-alex.kanavin@gmail.com>
X-Mailer: git-send-email 2.47.3
In-Reply-To: <20261127201159.914833-1-alex.kanavin@gmail.com>
References: <20261127201159.914833-1-alex.kanavin@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by lin-tor-korg-lkml-alma10-1 with HTTPS for <openembedded-core@lists.openembedded.org>; Fri, 27 Nov 2026 20:12:18 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/251453
Content-Type: text/plain; charset="utf-8"

From: Alexander Kanavin <alex@linutronix.de>

Pulseaudio had its last release in January 2024, and is historical software at this point.
It gets no maintenance or releases (you can check the commits at [1], they're all minimal freebsd/solaris fixes or translations).

[1] https://gitlab.freedesktop.org/pulseaudio/pulseaudio

So there's just no reason to keep carrying it, there's no upstream development to speak of,
there are no users in binary linux distros that have all switched to pipewire ages ago.
If someone is still on pulseaudio, then they should copy the recipe into a private layer and assume responsibility for it.

Signed-off-by: Alexander Kanavin <alex@linutronix.de>
---
 meta/conf/distro/include/maintainers.inc      |   2 -
 .../pulseaudio/pulseaudio.inc                 | 303 ------------------
 ...nt-conf-Add-allow-autospawn-for-root.patch |  97 ------
 ...ild-remove-dependency-on-doxygen-bin.patch |  26 --
 ...LFAGS-to-improve-reproducibility-bui.patch |  30 --
 .../pulseaudio/pulseaudio/volatiles.04_pulse  |   2 -
 .../pulseaudio/pulseaudio_17.0.bb             |  10 -
 .../pulseaudio-client-conf-sato/50-sato.conf  |   7 -
 .../pulseaudio-client-conf-sato_1.bb          |  18 --
 9 files changed, 495 deletions(-)
 delete mode 100644 meta/recipes-multimedia/pulseaudio/pulseaudio.inc
 delete mode 100644 meta/recipes-multimedia/pulseaudio/pulseaudio/0001-client-conf-Add-allow-autospawn-for-root.patch
 delete mode 100644 meta/recipes-multimedia/pulseaudio/pulseaudio/0001-doxygen-meson.build-remove-dependency-on-doxygen-bin.patch
 delete mode 100644 meta/recipes-multimedia/pulseaudio/pulseaudio/0002-do-not-display-CLFAGS-to-improve-reproducibility-bui.patch
 delete mode 100644 meta/recipes-multimedia/pulseaudio/pulseaudio/volatiles.04_pulse
 delete mode 100644 meta/recipes-multimedia/pulseaudio/pulseaudio_17.0.bb
 delete mode 100644 meta/recipes-sato/pulseaudio-sato/pulseaudio-client-conf-sato/50-sato.conf
 delete mode 100644 meta/recipes-sato/pulseaudio-sato/pulseaudio-client-conf-sato_1.bb

diff --git a/meta/conf/distro/include/maintainers.inc b/meta/conf/distro/include/maintainers.inc
index 4f1d4da0a89..8309b0cf9e1 100644
--- a/meta/conf/distro/include/maintainers.inc
+++ b/meta/conf/distro/include/maintainers.inc
@@ -620,8 +620,6 @@ RECIPE_MAINTAINER:pn-pseudo = "Thejas Raj <thejas.raj@windriver.com>"
 RECIPE_MAINTAINER:pn-psmisc = "Unassigned <unassigned@yoctoproject.org>"
 RECIPE_MAINTAINER:pn-psplash = "Sai Sireesha T <saisireesha.t@windriver.com>"
 RECIPE_MAINTAINER:pn-ptest-runner = "Ross Burton <ross.burton@arm.com>"
-RECIPE_MAINTAINER:pn-pulseaudio = "Unassigned <unassigned@yoctoproject.org>"
-RECIPE_MAINTAINER:pn-pulseaudio-client-conf-sato = "Unassigned <unassigned@yoctoproject.org>"
 RECIPE_MAINTAINER:pn-puzzles = "Unassigned <unassigned@yoctoproject.org>"
 RECIPE_MAINTAINER:pn-python3 = "Trevor Gamblin <tgamblin@baylibre.com>"
 RECIPE_MAINTAINER:pn-python3-alabaster = "Tim Orling <tim.orling@konsulko.com>"
diff --git a/meta/recipes-multimedia/pulseaudio/pulseaudio.inc b/meta/recipes-multimedia/pulseaudio/pulseaudio.inc
deleted file mode 100644
index 28b88269463..00000000000
--- a/meta/recipes-multimedia/pulseaudio/pulseaudio.inc
+++ /dev/null
@@ -1,303 +0,0 @@
-SUMMARY = "Sound server for Linux and Unix-like operating systems"
-DESCRIPTION = "A general purpose sound server intended to run as a middleware \
-between your applications and your hardware devices, either using ALSA or OSS."
-HOMEPAGE = "http://www.pulseaudio.org"
-SECTION = "libs/multimedia"
-
-# Most of PulseAudio code is under LGPL-2.1-or-later. There are a few
-# exceptions:
-#
-# The "adrian" echo canceller variant has code under a non-standard permissive
-# license. See src/modules/echo-cancel/adrian-license.txt for details. This
-# recipe disables the adrian echo canceller to avoid hassle with the unusual
-# license.
-#
-# The src/modules/reserve* and src/pulsecore/rtkit* files are under the MIT
-# license.
-#
-# The src/pulsecore/filter/ directory contains code under the 3-clause BSD
-# license.
-#
-# People who distribute PulseAudio binaries need to also consider that there
-# are some dependencies to GPL libraries. LGPL code that depends on GPL
-# libraries probably becomes effectively GPL-licensed (at compile-time? or at
-# at link-time?). I'm not a lawyer, though, so I'm not sure of the exact
-# implications. The GPL dependencies only affect the server, not the client
-# library, with the exception of libdbus that affects both. These are the GPL
-# library dependencies:
-#
-# One of the resampler implementations uses libsamplerate. This recipe doesn't
-# enable that resampler, however.
-#
-# One of the database implementations uses gdbm. This recipe doesn't enable
-# that database implementation, however.
-#
-# module-lirc (enabled by PACKAGECONFIG[lirc]) uses LIRC.
-#
-# module-equalizer-sink uses FFTW. This recipe disables that, however.
-#
-# The dependency with the most complicated licensing considerations is libdbus.
-# When PACKAGECONFIG[dbus] is enabled (like it is by default), libdbus will be
-# used by both the server and the client library (libpulse). Does this affect
-# applications that use libpulse? It should also be noted that libdbus is
-# dual-licensed: either GPL-2.0-or-later or AFL-2.0 terms apply. Whose decision
-# is it which of the licenses apply? What a mess. Some people hold the view that
-# libdbus is a system library that is covered by the "special exception" in
-# GPLv2's section 3, and therefore libdbus's GPL license doesn't affect
-# PulseAudio.
-LICENSE = "BSD-3-Clause AND LGPL-2.1-or-later AND MIT"
-
-LIC_FILES_CHKSUM = "file://LICENSE;md5=0e5cd938de1a7a53ea5adac38cc10c39 \
-                    file://GPL;md5=4325afd396febcb659c36b49533135d4 \
-                    file://LGPL;md5=2d5025d4aa3495befef8f17206a5b0a1 \
-                    file://src/modules/echo-cancel/adrian-license.txt;md5=abbab006a561fbffccedf1c3531f34ab \
-                    file://src/pulsecore/filter/LICENSE.WEBKIT;md5=49defbaffddf8c51faf606ff7fc3b1f7 \
-                    file://src/pulsecore/resampler.h;beginline=4;endline=21;md5=09794012ae16912c0270f3280cc8ff84 \
-                    file://src/modules/reserve.h;beginline=6;endline=28;md5=0e23094760367d51b6609750e9b31fbb \
-                    file://src/pulsecore/rtkit.h;beginline=6;endline=29;md5=3f00ff966716ae0817c31576d1473528 \
-                    file://src/modules/echo-cancel/adrian-aec.h;beginline=3;endline=12;md5=d3ed4fad1c073f8b06f37495dc5d1026 \
-                    file://src/pulsecore/filter/biquad.h;beginline=1;endline=4;md5=6d46d1365206528a20137355924233c1 \
-"
-
-# libtool is needed for libltdl, used in module loading.
-DEPENDS = "m4-native libatomic-ops libsndfile1 libtool"
-# optional
-DEPENDS += "udev alsa-lib glib-2.0"
-DEPENDS += "speexdsp libxml-parser-perl-native libcap"
-
-inherit bash-completion meson pkgconfig useradd gettext perlnative systemd manpages gsettings
-
-# *.desktop rules wont be generated during configure and build will fail
-# if using --disable-nls
-USE_NLS = "yes"
-
-# Helps tests for -msse fail on non-SSE architectures which is all non-x86
-TUNE_CCARGS:append:toolchain-clang = " -Werror=unused-command-line-argument"
-
-# Fixes
-# aarch64-yoe-linux-ld.lld: error: version script assignment of 'PULSE_0' to symbol 'pa_glib_mainloop_free' failed: symbol not defined
-# aarch64-yoe-linux-ld.lld: error: version script assignment of 'PULSE_0' to symbol 'pa_glib_mainloop_get_api' failed: symbol not defined
-# aarch64-yoe-linux-ld.lld: error: version script assignment of 'PULSE_0' to symbol 'pa_glib_mainloop_new' failed: symbol not defined
-LDFLAGS += "${@bb.utils.contains('DISTRO_FEATURES', 'ld-is-lld', ' -Wl,--undefined-version', '', d)}"
-
-# mix_neon.c:179:9: error: invalid operand in inline asm: 'vld1.s32 ${0:h}, [$2]
-#      vld1.s32 ${1:h}, [$3] '
-TOOLCHAIN:armv7ve = "gcc"
-TOOLCHAIN:armv7a = "gcc"
-
-EXTRA_OEMESON = "\
-		-Dhal-compat=false \
-		-Dorc=disabled \
-		-Daccess_group=audio \
-		-Dopenssl=disabled \
-		-Ddatabase=simple \
-		-Dzshcompletiondir=no \
-		-Dudevrulesdir=`pkg-config --variable=udevdir udev`/rules.d \
-		-Dvalgrind=disabled \
-		-Dtests=false \
-		-Drunning-from-build-tree=false \
-"
-
-# soxr (the SoX Resampler library) doesn't seem to be currently packaged in
-# oe-core nor meta-oe, so let's not add a PACKAGECONFIG entry for it for now.
-EXTRA_OEMESON += "-Dsoxr=disabled"
-
-# The FFTW dependency (for module-equalizer-sink) was removed in commit
-# ddbd713293 without explaining why it was not made a PACKAGECONFIG item
-# instead. Oh well, let's keep it disabled until someone expresses some
-# interest in having it enabled.
-EXTRA_OEMESON += "-Dfftw=disabled"
-
-# The "adrian" echo canceller implementation has a non-standard license
-# (src/modules/echo-cancel/adrian-license.txt). It's a permissive license, so
-# the licensing terms are probably not problematic, but it would be an extra
-# hassle to add the license to OE-Core's set of licenses. The canceller isn't
-# very good anyway, better alternatives exist (such as the webrtc canceller).
-EXTRA_OEMESON += "-Dadrian-aec=false"
-
-PACKAGECONFIG ??= "${@bb.utils.contains('DISTRO_FEATURES', 'bluetooth', 'bluez5', '', d)} \
-                   ${@bb.utils.contains('DISTRO_FEATURES', 'zeroconf', 'avahi', '', d)} \
-                   ${@bb.utils.contains('DISTRO_FEATURES', '3g', 'ofono', '', d)} \
-                   ${@bb.utils.filter('DISTRO_FEATURES', 'ipv6 systemd x11', d)} \
-                   dbus gsettings \
-                   "
-
-PACKAGECONFIG[dbus] = "-Ddbus=enabled,-Ddbus=disabled,dbus"
-PACKAGECONFIG[bluez5] = "-Dbluez5=enabled,-Dbluez5=disabled,bluez5 sbc"
-PACKAGECONFIG[gsettings] = "-Dgsettings=enabled,-Dgsettings=disabled,glib-2.0-native glib-2.0"
-PACKAGECONFIG[ofono] = "-Dbluez5-ofono-headset=true,-Dbluez5-ofono-headset=false,ofono"
-PACKAGECONFIG[gtk] = "-Dgtk=enabled,-Dgtk=disabled,gtk+3"
-PACKAGECONFIG[systemd] = "-Dsystemd=enabled -Dsystemduserunitdir=${systemd_user_unitdir},-Dsystemd=disabled,systemd"
-PACKAGECONFIG[x11] = "-Dx11=enabled,-Dx11=disabled,virtual/libx11 libxtst libice libsm libxcb"
-PACKAGECONFIG[avahi] = "-Davahi=enabled,-Davahi=disabled,avahi"
-PACKAGECONFIG[jack] = "-Djack=enabled,-Djack=disabled,jack"
-# Since many embedded systems don't have non-root users, it's useful to be
-# able to use pulseaudio autospawn for root as well.
-PACKAGECONFIG[autospawn-for-root] = ",,,"
-PACKAGECONFIG[lirc] = "-Dlirc=enabled,-Dlirc=disabled,lirc"
-PACKAGECONFIG[webrtc] = "-Dwebrtc-aec=enabled,-Dwebrtc-aec=disabled,webrtc-audio-processing-1"
-PACKAGECONFIG[ipv6] = "-Dipv6=true,-Dipv6=false,"
-PACKAGECONFIG[manpages] = "-Dman=true,-Dman=false,"
-PACKAGECONFIG[oss-output] = "-Doss-output=enabled,-Doss-output=disabled,"
-
-export TARGET_PFPU = "${TARGET_FPU}"
-
-set_cfg_value () {
-	sed -i -e "s/\(; *\)\?$2 =.*/$2 = $3/" "$1"
-	if ! grep -q "^$2 = $3\$" "$1"; then
-		die "Use of sed to set '$2' to '$3' in '$1' failed"
-	fi
-}
-
-do_compile:append () {
-	if ${@bb.utils.contains('PACKAGECONFIG', 'autospawn-for-root', 'true', 'false', d)}; then
-		set_cfg_value src/pulse/client.conf allow-autospawn-for-root yes
-	fi
-}
-
-do_install:append() {
-	install -d ${D}${sysconfdir}/default/volatiles
-	install -m 0644 ${UNPACKDIR}/volatiles.04_pulse  ${D}${sysconfdir}/default/volatiles/04_pulse
-}
-
-USERADD_PACKAGES = "pulseaudio-server"
-GROUPADD_PARAM:pulseaudio-server = "--system audio; --system pulse"
-USERADD_PARAM:pulseaudio-server = "--system --home /var/run/pulse \
-                              --no-create-home --shell /bin/false \
-                              --groups audio,pulse --gid pulse pulse"
-
-PACKAGES =+ "\
-             libpulse \
-             libpulse-mainloop-glib \
-             libpulse-simple \
-             libpulsecommon \
-             libpulsecore \
-             ${PN}-pactl \
-             ${PN}-pa-info \
-             ${PN}-server \
-             ${PN}-misc \
-             "
-
-# The console-kit module is included here explicitly so bitbake can map to the
-# RDEPENDS we define for it in this recipe, and thereby ensure that when
-# adding the console-kit module to an image, we also get the necessary
-# consolekit package produced.
-PACKAGES =+ "${@bb.utils.contains('PACKAGECONFIG', 'dbus', 'pulseaudio-module-console-kit', '', d)}"
-
-#upgrade path:
-RREPLACES:pulseaudio-server = "libpulse-bin libpulse-conf"
-
-PACKAGES_DYNAMIC += "^pulseaudio-lib-.* ^pulseaudio-module-.*"
-
-FILES:libpulsecore = "${libdir}/pulseaudio/libpulsecore*.so"
-FILES:libpulsecommon = "${libdir}/pulseaudio/libpulsecommon*.so"
-
-# client.conf configures the behaviour of libpulse, so it belongs in the same
-# package.
-FILES:libpulse = "${libdir}/libpulse.so.* ${sysconfdir}/pulse/client.conf"
-
-FILES:libpulse-simple = "${libdir}/libpulse-simple.so.*"
-FILES:libpulse-mainloop-glib = "${libdir}/libpulse-mainloop-glib.so.*"
-
-FILES:${PN}-dev += "${datadir}/vala"
-FILES:${PN}-bin += "${sysconfdir}/default/volatiles/04_pulse"
-FILES:${PN}-pactl = "${bindir}/pactl"
-FILES:${PN}-pa-info = "${bindir}/pa-info"
-FILES:${PN}-server = "${bindir}/pulseaudio ${bindir}/start-* ${sysconfdir} */udev/rules.d/*.rules */*/udev/rules.d/*.rules ${systemd_user_unitdir}/*"
-FILES:${PN}-server += "${datadir}/dbus-1/system.d/pulseaudio-system.conf"
-
-#SYSTEMD_PACKAGES = "${PN}-server"
-SYSTEMD_SERVICE:${PN}-server = "pulseaudio.service"
-
-FILES:${PN}-misc = "${bindir}/* ${libdir}/pulseaudio/libpulsedsp.so"
-
-# Allow the pulseaudio package to be created empty as a placeholder (-dbg and -dev depend on it)
-FILES:${PN} = ""
-ALLOW_EMPTY:${PN} = "1"
-
-CONFFILES:libpulse = "${sysconfdir}/pulse/client.conf"
-
-CONFFILES:pulseaudio-server = "\
-  ${sysconfdir}/pulse/default.pa \
-  ${sysconfdir}/pulse/daemon.conf \
-  ${sysconfdir}/pulse/system.pa \
-  "
-
-pkg_postinst:${PN}-server() {
-        if [ -z "$D" ] && [ -e ${sysconfdir}/init.d/populate-volatile.sh ] ; then
-            ${sysconfdir}/init.d/populate-volatile.sh update
-        fi
-}
-
-python populate_packages:prepend() {
-    plugindir = d.expand('${libdir}/pulseaudio/modules/')
-    do_split_packages(d, plugindir, r'^module-(.*)\.so$', '${PN}-module-%s', 'PulseAudio module for %s', extra_depends='', prepend=True)
-    do_split_packages(d, plugindir, r'^lib(.*)\.so$', '${PN}-lib-%s', 'PulseAudio library for %s', extra_depends='', prepend=True)
-}
-
-# pa-info is a bash script that collects information about the audio setup.
-# It's primarily useful for attaching an information dump when reporting bugs.
-RDEPENDS:${PN}-pa-info = "\
-                          alsa-utils-amixer \
-                          alsa-utils-aplay \
-                          alsa-utils-alsa-info \
-                          bash \
-                          ${PN}-server \
-                          "
-
-RDEPENDS:pulseaudio-server = " \
-    pulseaudio-module-filter-apply \
-    pulseaudio-module-filter-heuristics \
-    pulseaudio-module-udev-detect \
-    pulseaudio-module-null-sink \
-    pulseaudio-module-device-restore \
-    pulseaudio-module-stream-restore \
-    pulseaudio-module-card-restore \
-    pulseaudio-module-augment-properties \
-    pulseaudio-module-detect \
-    pulseaudio-module-alsa-sink \
-    pulseaudio-module-alsa-source \
-    pulseaudio-module-alsa-card \
-    pulseaudio-module-native-protocol-unix \
-    pulseaudio-module-default-device-restore \
-    pulseaudio-module-intended-roles \
-    pulseaudio-module-rescue-streams \
-    pulseaudio-module-always-sink \
-    pulseaudio-module-suspend-on-idle \
-    pulseaudio-module-position-event-sounds \
-    pulseaudio-module-role-cork \
-    pulseaudio-module-switch-on-port-available"
-
-# If the server is installed, it's usually desirable to make ALSA applications
-# use PulseAudio. alsa-plugins-pulseaudio-conf will install the configuration
-# that makes the PulseAudio plugin the default ALSA device.
-RDEPENDS:pulseaudio-server += "${@bb.utils.contains('DISTRO_FEATURES', 'pulseaudio', 'alsa-plugins-pulseaudio-conf', '', d)}"
-
-# pulseaudio-module-console-kit is built whenever dbus is enabled by PACKAGECONFIG
-RDEPENDS:pulseaudio-module-console-kit =+ "${@bb.utils.contains('DISTRO_FEATURES', 'sysvinit', 'consolekit', '', d)}"
-RDEPENDS:pulseaudio-misc += "pulseaudio-module-cli-protocol-unix"
-
-FILES:${PN}-module-alsa-card += "${datadir}/pulseaudio/alsa-mixer"
-
-GSETTINGS_PACKAGE = "${@bb.utils.contains('PACKAGECONFIG', 'gsettings', '${PN}-module-gsettings', '', d)}"
-FILES:${PN}-module-gsettings += "${libexecdir}/pulse/gsettings-helper ${datadir}/GConf/gsettings ${datadir}/glib-2.0/schemas"
-
-# The console-kit module is good to have on X11 systems (it keeps PulseAudio
-# running for the duration of the user login session). The device-manager and
-# x11-* modules are referenced from the start-pulseaudio-x11 script, so those
-# modules must be installed when X11 is enabled.
-RDEPENDS:pulseaudio-server += "\
-        ${@bb.utils.contains('DISTRO_FEATURES', 'x11', '\
-                pulseaudio-module-device-manager \
-                pulseaudio-module-x11-cork-request \
-                pulseaudio-module-x11-publish \
-                pulseaudio-module-x11-xsmp \
-        ', '', d)}"
-
-RDEPENDS:pulseaudio-server += "${@bb.utils.contains('DISTRO_FEATURES', 'x11', \
-                                  bb.utils.contains('DISTRO_FEATURES', 'systemd', 'pulseaudio-module-systemd-login', 'pulseaudio-module-console-kit', d), \
-                                  '', d)}"
-
-CVE_STATUS[CVE-2020-15710] = "not-applicable-platform: specific to Ubuntu"
-CVE_STATUS[CVE-2020-16123] = "not-applicable-platform: specific to Ubuntu"
-CVE_STATUS[CVE-2024-11586] = "not-applicable-platform: specific to Ubuntu 16.04"
diff --git a/meta/recipes-multimedia/pulseaudio/pulseaudio/0001-client-conf-Add-allow-autospawn-for-root.patch b/meta/recipes-multimedia/pulseaudio/pulseaudio/0001-client-conf-Add-allow-autospawn-for-root.patch
deleted file mode 100644
index 33f7709ae4c..00000000000
--- a/meta/recipes-multimedia/pulseaudio/pulseaudio/0001-client-conf-Add-allow-autospawn-for-root.patch
+++ /dev/null
@@ -1,97 +0,0 @@
-From babec3a50dd710d26b72f6c6d43bd79b04e954a6 Mon Sep 17 00:00:00 2001
-From: Tanu Kaskinen <tanu.kaskinen@linux.intel.com>
-Date: Tue, 28 Apr 2015 14:32:43 +0300
-Subject: [PATCH] client-conf: Add allow-autospawn-for-root
-
-Usually autospawning for root is a bad idea, since it can easily
-interfere with other users' PulseAudio instances, but in embedded
-environments where only root exists, autospawning is fine.
-
-Upstream-Status: Denied [Upstream hasn't so far been convinced that
-this feature is needed. The view is that running the graphical session
-as root doesn't make sense even on embedded systems, or if it does,
-running PulseAudio in the system mode should be a good solution for
-that use case. If someone can prove otherwise, the patch would
-probably be accepted.]
-
-Signed-off-by: Tanu Kaskinen <tanu.kaskinen@linux.intel.com>
----
- man/pulse-client.conf.5.xml.in | 9 +++++++++
- src/pulse/client-conf.c        | 1 +
- src/pulse/client-conf.h        | 1 +
- src/pulse/client.conf.in       | 1 +
- src/pulse/context.c            | 2 +-
- 5 files changed, 13 insertions(+), 1 deletion(-)
-
-diff --git a/man/pulse-client.conf.5.xml.in b/man/pulse-client.conf.5.xml.in
-index b88898c..e737c96 100644
---- a/man/pulse-client.conf.5.xml.in
-+++ b/man/pulse-client.conf.5.xml.in
-@@ -82,6 +82,15 @@ License along with PulseAudio; if not, see <http://www.gnu.org/licenses/>.
-     </option>
- 
-     <option>
-+      <p><opt>allow-autospawn-for-root=</opt> Allow autospawning also for root.
-+      Takes a boolean value, defaults to <opt>no</opt>. If the <opt>autospawn
-+      </opt> option is disabled, this option has no effect. Autospawning for
-+      root is disabled by default, because running PulseAudio as root will
-+      interfere with regular users' PulseAudio instances. This option should be
-+      enabled only in environments where there are no regular users at all.</p>
-+    </option>
-+
-+    <option>
-       <p><opt>daemon-binary=</opt> Path to the PulseAudio daemon to
-       run when autospawning. Defaults to a path configured at compile
-       time.</p>
-diff --git a/src/pulse/client-conf.c b/src/pulse/client-conf.c
-index a3c9486..9f68ee5 100644
---- a/src/pulse/client-conf.c
-+++ b/src/pulse/client-conf.c
-@@ -138,6 +138,7 @@ void pa_client_conf_load(pa_client_conf *c, bool load_from_x11, bool load_from_e
-         { "default-server",         pa_config_parse_string,   &c->default_server, NULL },
-         { "default-dbus-server",    pa_config_parse_string,   &c->default_dbus_server, NULL },
-         { "autospawn",              pa_config_parse_bool,     &c->autospawn, NULL },
-+        { "allow-autospawn-for-root", pa_config_parse_bool,   &c->allow_autospawn_for_root, NULL },
-         { "cookie-file",            pa_config_parse_string,   &c->cookie_file_from_client_conf, NULL },
-         { "disable-shm",            pa_config_parse_bool,     &c->disable_shm, NULL },
-         { "enable-shm",             pa_config_parse_not_bool, &c->disable_shm, NULL },
-diff --git a/src/pulse/client-conf.h b/src/pulse/client-conf.h
-index 7691ec7..19db7ed 100644
---- a/src/pulse/client-conf.h
-+++ b/src/pulse/client-conf.h
-@@ -38,6 +38,7 @@ typedef struct pa_client_conf {
-     char *cookie_file_from_application;
-     char *cookie_file_from_client_conf;
-     bool autospawn, disable_shm, disable_memfd, auto_connect_localhost, auto_connect_display;
-+    bool allow_autospawn_for_root;
-     size_t shm_size;
- } pa_client_conf;
- 
-diff --git a/src/pulse/client.conf.in b/src/pulse/client.conf.in
-index 26b7790..69830ef 100644
---- a/src/pulse/client.conf.in
-+++ b/src/pulse/client.conf.in
-@@ -23,6 +23,7 @@
- ; default-dbus-server =
- 
- ; autospawn = yes
-+; allow-autospawn-for-root = no
- ; daemon-binary = @PA_BINARY@
- ; extra-arguments = --log-target=syslog
- 
-diff --git a/src/pulse/context.c b/src/pulse/context.c
-index 69be5f4..d6e13e8 100644
---- a/src/pulse/context.c
-+++ b/src/pulse/context.c
-@@ -1027,7 +1027,7 @@ int pa_context_connect(
-     if (!(flags & PA_CONTEXT_NOAUTOSPAWN) && c->conf->autospawn) {
- 
- #ifdef HAVE_GETUID
--        if (getuid() == 0)
-+        if (!c->conf->allow_autospawn_for_root && getuid() == 0)
-             pa_log_debug("Not doing autospawn since we are root.");
-         else {
-             c->do_autospawn = true;
--- 
-2.8.1
-
diff --git a/meta/recipes-multimedia/pulseaudio/pulseaudio/0001-doxygen-meson.build-remove-dependency-on-doxygen-bin.patch b/meta/recipes-multimedia/pulseaudio/pulseaudio/0001-doxygen-meson.build-remove-dependency-on-doxygen-bin.patch
deleted file mode 100644
index b1a43bd7f0e..00000000000
--- a/meta/recipes-multimedia/pulseaudio/pulseaudio/0001-doxygen-meson.build-remove-dependency-on-doxygen-bin.patch
+++ /dev/null
@@ -1,26 +0,0 @@
-From 4ee244d0824e772ab35abb0f9df5e8088e16fc5d Mon Sep 17 00:00:00 2001
-From: Alexander Kanavin <alex.kanavin@gmail.com>
-Date: Mon, 26 Apr 2021 19:30:40 +0200
-Subject: [PATCH] doxygen/meson.build: remove dependency on doxygen binary
-
-New meson refuses to complete confuguration if doxygen is absent
-even if this target is never actually run. As we never run it,
-let's remove it, until upstream and/or meson figure out that it's
-optional and should be treated as such.
-
-Upstream-Status: Inappropriate [needs proper upstream fix]
-Signed-off-by: Alexander Kanavin <alex.kanavin@gmail.com>
----
- doxygen/meson.build | 2 --
- 1 file changed, 2 deletions(-)
-
-diff --git a/doxygen/meson.build b/doxygen/meson.build
-index afc0e49..df55c83 100644
---- a/doxygen/meson.build
-+++ b/doxygen/meson.build
-@@ -6,5 +6,3 @@ doxygen_conf = configure_file(
-   configuration : cdata,
- )
- 
--run_target('doxygen',
--  command : ['doxygen', doxygen_conf])
diff --git a/meta/recipes-multimedia/pulseaudio/pulseaudio/0002-do-not-display-CLFAGS-to-improve-reproducibility-bui.patch b/meta/recipes-multimedia/pulseaudio/pulseaudio/0002-do-not-display-CLFAGS-to-improve-reproducibility-bui.patch
deleted file mode 100644
index 48f04921771..00000000000
--- a/meta/recipes-multimedia/pulseaudio/pulseaudio/0002-do-not-display-CLFAGS-to-improve-reproducibility-bui.patch
+++ /dev/null
@@ -1,30 +0,0 @@
-From f0ddd7c36556ad05c1398fdd132947323ad26473 Mon Sep 17 00:00:00 2001
-From: Hongxu Jia <hongxu.jia@windriver.com>
-Date: Thu, 6 Dec 2018 11:43:41 +0800
-Subject: [PATCH 2/2] do not display CLFAGS to improve reproducibility build
-
-Macro PA_CFLAGS contains build path, do not use it to
-display CFLAGS which could improve reproducibility build.
-
-Upstream-Status: Inappropriate [oe specific]
-Signed-off-by: Hongxu Jia <hongxu.jia@windriver.com>
----
- src/daemon/main.c | 2 +-
- 1 file changed, 1 insertion(+), 1 deletion(-)
-
-diff --git a/src/daemon/main.c b/src/daemon/main.c
-index 30ef499..5c3abf0 100644
---- a/src/daemon/main.c
-+++ b/src/daemon/main.c
-@@ -916,7 +916,7 @@ int main(int argc, char *argv[]) {
-     pa_set_env_and_record("PULSE_SYSTEM", conf->system_instance ? "1" : "0");
- 
-     pa_log_info("This is PulseAudio %s", PACKAGE_VERSION);
--    pa_log_debug("Compilation CFLAGS: %s", PA_CFLAGS);
-+    pa_log_debug("Compilation CFLAGS: ***");
- 
- #ifdef HAVE_LIBSAMPLERATE
-     pa_log_warn("Compiled with DEPRECATED libsamplerate support!");
--- 
-2.25.1
-
diff --git a/meta/recipes-multimedia/pulseaudio/pulseaudio/volatiles.04_pulse b/meta/recipes-multimedia/pulseaudio/pulseaudio/volatiles.04_pulse
deleted file mode 100644
index 5b1998032be..00000000000
--- a/meta/recipes-multimedia/pulseaudio/pulseaudio/volatiles.04_pulse
+++ /dev/null
@@ -1,2 +0,0 @@
-# <type> <owner> <group> <mode> <path> <linksource>
-d pulse pulse 0755 /var/run/pulse none
diff --git a/meta/recipes-multimedia/pulseaudio/pulseaudio_17.0.bb b/meta/recipes-multimedia/pulseaudio/pulseaudio_17.0.bb
deleted file mode 100644
index 6c172b4ec7e..00000000000
--- a/meta/recipes-multimedia/pulseaudio/pulseaudio_17.0.bb
+++ /dev/null
@@ -1,10 +0,0 @@
-require pulseaudio.inc
-
-SRC_URI = "http://www.freedesktop.org/software/pulseaudio/releases/${BP}.tar.xz \
-           file://0001-client-conf-Add-allow-autospawn-for-root.patch \
-           file://0002-do-not-display-CLFAGS-to-improve-reproducibility-bui.patch \
-           file://volatiles.04_pulse \
-           file://0001-doxygen-meson.build-remove-dependency-on-doxygen-bin.patch \
-           "
-SRC_URI[sha256sum] = "053794d6671a3e397d849e478a80b82a63cb9d8ca296bd35b73317bb5ceb87b5"
-UPSTREAM_CHECK_REGEX = "pulseaudio-(?P<pver>\d+(\.(?!99)\d+)+)\.tar"
diff --git a/meta/recipes-sato/pulseaudio-sato/pulseaudio-client-conf-sato/50-sato.conf b/meta/recipes-sato/pulseaudio-sato/pulseaudio-client-conf-sato/50-sato.conf
deleted file mode 100644
index 97492e7a508..00000000000
--- a/meta/recipes-sato/pulseaudio-sato/pulseaudio-client-conf-sato/50-sato.conf
+++ /dev/null
@@ -1,7 +0,0 @@
-# We rely on PulseAudio's autospawn feature to automatically start the daemon
-# in Sato. The graphical session in Sato runs under root, however, and
-# PulseAudio disables autospawning for root by default. In a normal setup it's
-# not desirable to autospawn for root, because it can easily interfere with
-# other users' PulseAudio instances, but in Sato there are no other users, so
-# it's OK to enable this in Sato.
-allow-autospawn-for-root = yes
diff --git a/meta/recipes-sato/pulseaudio-sato/pulseaudio-client-conf-sato_1.bb b/meta/recipes-sato/pulseaudio-sato/pulseaudio-client-conf-sato_1.bb
deleted file mode 100644
index 65748ee771f..00000000000
--- a/meta/recipes-sato/pulseaudio-sato/pulseaudio-client-conf-sato_1.bb
+++ /dev/null
@@ -1,18 +0,0 @@
-SUMMARY = "/etc/pulse/client.conf tailored for Sato"
-SECTION = "multimedia"
-LICENSE = "MIT"
-LIC_FILES_CHKSUM = "file://${COREBASE}/meta/COPYING.MIT;md5=3da9cfbcb788c80a0384361b4de20420"
-
-SRC_URI = "file://50-sato.conf"
-
-S = "${UNPACKDIR}"
-
-inherit allarch
-
-do_install() {
-	install -d ${D}${sysconfdir}/pulse/client.conf.d
-	install -m 0644 ${S}/50-sato.conf ${D}${sysconfdir}/pulse/client.conf.d/50-sato.conf
-}
-
-FILES:${PN} = "${sysconfdir}/pulse/client.conf.d/50-sato.conf"
-CONFFILES:${PN} = "${sysconfdir}/pulse/client.conf.d/50-sato.conf"
-- 
2.47.3

