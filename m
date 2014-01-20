Return-Path: <cliff.brake@gmail.com>
Received: from mail-ie0-f182.google.com (mail-ie0-f182.google.com
	[209.85.223.182])
	by mail.openembedded.org (Postfix) with ESMTP id 50B7A6C7FE;
	Mon, 20 Jan 2014 21:03:44 +0000 (UTC)
Received: by mail-ie0-f182.google.com with SMTP id lx4so1840839iec.13
	for <multiple recipients>; Mon, 20 Jan 2014 13:03:45 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=mime-version:date:message-id:from:to:subject:content-type
	:content-transfer-encoding;
	bh=F+Z8Dwl5aCm2st7hCLAsQfNixF3CC2T9NXEU0RJsTHQ=;
	b=hp5w5U8fykJNSNNgRVUXYdPflmVdanSPRy7QE5sO5Xw7cMYmReyvDhku6JV8t/8Hiy
	+lVvcXBVnGwGAdHN0XgDhaXxyig/QgZo8Hhhhj70ooDaCNoPh9CInUICcRdb5n6SlRlr
	IdUz+BpvsRikWJlpfzEdBhDZY2fajmTrhhKDbQg389jVk9dQx6UZALb+DJMrpW1uLnjK
	RK+5H1gMW9K6Z8KLA20eMUR1y7qVCTP3VjvYol3U8/VztDO4Z2BV68IQV8CBoDJgxpqo
	bfXNzqANUcddChAkTZoZN7wlKRaQMg/y+Lm0fnLtYaOz6C1XYL7++Z/jBmOpJYySSPp+
	7edw==
X-Received: by 10.50.66.208 with SMTP id h16mr18949302igt.0.1390251825184;
	Mon, 20 Jan 2014 13:03:45 -0800 (PST)
Received: from happy.bec-systems.com (cable-pool6-cs-200.doycomm.com.
	[66.219.185.200])
	by mx.google.com with ESMTPSA id f2sm5421339igt.6.2014.01.20.13.03.43
	for <multiple recipients>
	(version=TLSv1 cipher=ECDHE-RSA-RC4-SHA bits=128/128);
	Mon, 20 Jan 2014 13:03:44 -0800 (PST)
MIME-Version: 1.0
X-Mailer: Nodemailer (0.3.22; +http://andris9.github.com/Nodemailer/)
Date: Mon, 20 Jan 2014 13:03:44 -0800 (PST)
Message-Id: <1390251823376.23a87447@Nodemailer>
From: cliff.brake@gmail.com
To: openembedded-core@lists.openembedded.org,
	openembedded-devel@lists.openembedded.org,
	angstrom-distro-devel@linuxtogo.org, meta-ti@yoctoproject.org
Subject: OE Changelog since 2014-01-12 until 2014-01-19
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
X-List-Received-Date: Mon, 20 Jan 2014 21:03:44 -0000
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable

Changelog since 2014-01-12 until 2014-01-19.  Projects included in this =
report:

bitbake: git://git.openembedded.org/bitbake
openembedded-core: git://git.openembedded.org/openembedded-core
meta-openembedded: git://git.openembedded.org/meta-openembedded
meta-angstrom: git://github.com/Angstrom-distribution/meta-angstrom.git
meta-arago: git://arago-project.org/git/meta-arago.git
meta-beagleboard: git://github.com/beagleboard/meta-beagleboard.git
meta-browser: git://github.com/OSSystems/meta-browser.git
meta-bug: git://github.com/buglabs/meta-bug.git
meta-chicken: git://github.com/OSSystems/meta-chicken
meta-efikamx: git://github.com/kraj/meta-efikamx.git
meta-ettus: http://github.com/koenkooi/meta-ettus.git
meta-fsl-arm: git://git.yoctoproject.org/meta-fsl-arm
meta-fsl-arm-extra: git://github.com/Freescale/meta-fsl-arm-extra.git
meta-fsl-ppc: git://git.yoctoproject.org/meta-fsl-ppc
meta-guacamayo: git://github.com/Guacamayo/meta-guacamayo.git
meta-gumstix: git://github.com/gumstix/meta-gumstix.git
meta-gumstix-community: =
git://gitorious.org/schnitzeltony-oe-meta/meta-gumstix-community.git
meta-handheld: git://git.openembedded.org/meta-handheld
meta-igep: http://github.com/ebutera/meta-igep.git
meta-intel: git://git.yoctoproject.org/meta-intel
meta-ivi: git://git.yoctoproject.org/meta-ivi
meta-java: git://github.com/woglinde/meta-java
meta-kde: git://gitorious.org/openembedded-core-layers/meta-kde.git
meta-micro: git://git.openembedded.org/meta-micro
meta-mono: git://git.yoctoproject.org/meta-mono.git
meta-netbookpro: git://github.com/tworaz/meta-netbookpro
meta-nslu2: git://github.com/kraj/meta-nslu2
meta-opie: git://git.openembedded.org/meta-opie
meta-qt3: git://git.yoctoproject.org/meta-qt3
meta-qt5: git://github.com/meta-qt5/meta-qt5.git
meta-slugos: git://github.com/kraj/meta-slugos
meta-systemd: git://git.yoctoproject.org/meta-systemd
meta-raspberrypi: git://github.com/djwillis/meta-raspberrypi.git
meta-smartphone: http://git.shr-project.org/repo/meta-smartphone.git
meta-ti: git://git.yoctoproject.org/meta-ti
meta-webos: git://github.com/openwebos/meta-webos.git
meta-xilinx: git://git.yoctoproject.org/meta-xilinx
meta-yocto: git://git.yoctoproject.org/meta-yocto
openembedded: git://git.openembedded.org/openembedded

=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D
Changelog for bitbake:

Martin Jansa (2):
=20=20fetch2: Don't allow '/' in user:pass, fix branch containing '@'
=20=20SignatureGenerator: Add empty implementation for dump_sigs

Richard Purdie (2):
=20=20siggen: Remove fsync that is causing performance issues
=20=20fetch2/gitsm: Use ud.basecmd instead of hardcoding git

Robert Yang (1):
=20=20fetch2/__init__.py: let try_mirror_url return correct value

=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D
Changelog for openembedded-core:

Alexandre Belloni (1):
=20=20wpa-supplicant-2.0: don't exit in pkg_postinst

Anders Darander (2):
=20=20systemd-compat-units: do not mask available services
=20=20systemd-compat-units: remove dnsmasq from sysv disabled list

Andreas M=C3=BCller (2):
=20=20weston: cleanup mesa depends
=20=20weston: depend on drm for 'launch' packageconfig enabled

Andrew McDermott (1):
=20=20alsa-lib: remove hard-coded /usr/include in dev package

Bruce Ashfield (4):
=20=20linux-yocto/3.10: update meta data for media fragments
=20=20linux-yocto/3.10: update to 3.10.25
=20=20linux-yocto/3.10: mohonpeak bsp config and scc files
=20=20linux-yocto-dev: bump version to 3.13+

Chen Qi (2):
=20=20sudo: upgrade to 1.8.9p1
=20=20shutdown-desktop: use poweroff for the Exec field in the =
shutdown.desktop

Corneliu Stoicescu (4):
=20=20oe-selftest: New object SStateBase cut off from SStateTests.
=20=20oe-selftest: renamed sstate.py module to sstatetests.py
=20=20oe-selftest: separated the SStateBase and SStateTests in different =
modules
=20=20oe-selftest: Patch sstate tests to work with new sstate-cache naming =
and con

Koen Kooi (6):
=20=20grub git: update to latest git
=20=20lz4: add r112
=20=20base bbclass: add support for lz4 compressed archives
=20=20distrodata bbclass: add support for lz4 archives
=20=20kernel.bbclass: add support for LZ4 initramfs files
=20=20image_types bbclass: add support for tar.lz4 and cpio.lz4

Krzysztof Sywula (1):
=20=20initrdscripts: add $CMDLINE to init-live switch_root

Laurentiu Palcu (3):
=20=20allarch.bbclass: set SDK_ARCH and SDK_CC_ARCH to "none"
=20=20nativesdk-packagegroup-sdk-host: reverse inherit order
=20=20x11vnc: fix CAPS_LOCK issues

Matthieu Crapet (1):
=20=20util-linux: add reset.1 manpage in update-alternatives

MiLo (1):
=20=20util-linux: Add fstrim utility

Nathan Rossi (1):
=20=20ptest.bblass: Fix package QA issues when disabled

Paul Barker (3):
=20=20opkg-utils: Upgrade to latest git HEAD
=20=20default-providers: Change update-alternatives provider to opkg-utils
=20=20opkg: No longer PROVIDES update-alternatives

Paul Eggleton (4):
=20=20dropbear: upgrade to 2013.62
=20=20chrpath: upgrade to 0.15
=20=20cdrtools-native: upgrade to 3.01a20
=20=20libsdl2: upgrade to 2.0.1

Phil Blundell (3):
=20=20dbus: Remove stray semicolon from SRC_URI
=20=20libproxy: Update to 0.4.11
=20=20harfbuzz: Move ancillary binaries to ${PN}-bin

Richard Purdie (14):
=20=20make: Disable floating guile dependency
=20=20eglibc-locale: Fix depends on binutils
=20=20ptest: d.keys() is slow, use a list instead
=20=20nativesdk-packagegroup-sdk-host: Cleanup strange darwin override
=20=20separatebuilddir: Drop cmake lines since cmake class has this as =
default now
=20=20python-nose: Add BBCLASSEXTEND for native/nativesdk
=20=20eglibc-locale: Fix previous dependency change to properly work in =
nativesdk=20
=20=20eglibc-locale: Fix multilib builds to depend on the correct binutils
=20=20dropbear: Refresh pam patch so it applies against recent version
=20=20package_rpm: Fix a race with package_deb/package_ipk
=20=20update-alternatives: We now use u-a in nativesdk so make sure the =
dependency
=20=20opkg/opkg-utils/chkconfig: Clean up u-a-cworth references
=20=20opkg-utils: Add basic PACKAGECONFIG for python dependencies
=20=20opkg-utils: Remove strange PACKAGES native override

Robert Yang (2):
=20=20alsa-tools: fix the AUTOMAKE_DIR
=20=20tcl: fix the TCL_INCLUDE_SPEC

Ross Burton (20):
=20=20oeqa/runtime/systemd: wait for services to start/fail
=20=20cmake: respect ${S} and ${B}
=20=20separatebuilddir: build libproxy and taglib out of the source tree
=20=20cmake: default to out-of-tree builds
=20=20grub-efi: remove configure patch, simply seed the cache
=20=20cmake: specify all install paths
=20=20python-mako: add (from meta-oe)
=20=20python-nose: add (from meta-oe)
=20=20python-numpy: add (from meta-oe)
=20=20waffle: add (from meta-oe)
=20=20piglit: add (from meta-oe)
=20=20packagegroup-core-tools-testapps: add Piglit
=20=20python-nose: don't install as an Egg
=20=20dbus-ptest: disable systemd
=20=20dbus-ptest: fix incorrect option name
=20=20ltp: fix makefile race
=20=20glib: add missing dependencies for ptest
=20=20glib-2.0: fix the dbus-appinfo test when running outside of X
=20=20glib-2.0: fix mapped file ptest
=20=20glib-2.0: add explicit build dependency on DBus when ptest is enabled

Saul Wold (4):
=20=20cups: upgrade to 1.7.1
=20=20man-pages: upgrade to 3.56
=20=20security_flags: db can't use pie flags from gcc for security build
=20=20linux-firmware: add firmware for additional iwlwifi devices

Stefan Stanacar (1):
=20=20lib/oeqa: allow a layer to provide it's own TEST_TARGET class

Yasir-Khan (1):
=20=20libacpi: Fix GNU_HASH problem

Zhang Xiao (1):
=20=20libidn: disable C# directly

=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D
Changelog for meta-openembedded:

Anders Darander (1):
=20=20ktap: add configs for elfutils and ffi

Koen Kooi (4):
=20=20oscam: bump SRCREV
=20=20apcupsd: fix configure failure
=20=20fetchmail: add 6.3.26
=20=20dovecot: add 2.2.10

Krzysztof Sywula (1):
=20=20irssi: add 0.8.16-rc1

Patrick Patat (2):
=20=20add libcrypt-openssl-random-perl
=20=20add libcrypt-openssl-rsa-perl

=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D
Changelog for meta-angstrom:

=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D
Changelog for meta-arago:

Chase Maupin (3):
=20=20packagegroup-arago-test: Add vpe-vpdma package
=20=20packagegroup-arago-test: install libdrm-tests for all machines
=20=20meta-toolchain-arago-qte: fix QMAKESPEC path

Denys Dmytriyenko (1):
=20=20branding-bleeding: create special brand for experimenting

Eyal Reizer (1):
=20=20ti-compat-wireless-wl18xx: build from ol_r8.a8.08

Franklin S. Cooper Jr (5):
=20=20Remove Wilink 6 references from packagegroups and other recipes
=20=20Remove all Wilink 6 related recipes
=20=20Remove all Wilink bluetooth references from packagegroups and other =
recipes
=20=20Remove all Wilink bluetooth related recipes
=20=20Add Wilink 8 support for AM43x boards

Yaniv Machani (8):
=20=20wpa-supplicant-wl18xx: Update recipe to ol_r8.a8.08 version.
=20=20hostap-daemon-wl18xx: Update recipe to ol_r8.a8.08 version
=20=20wlconf : Update recipe to ol_r8.a8.08 version.
=20=20ti-wifi-utils-wl18xx: Update recipe to ol_r8.a8.08 version.
=20=20wl18xx-firmware: update recipe to ol_r8.a8.08 version.
=20=20arago-prefs: update default value for am335x and am43x for WILINK-8
=20=20arago-tisdk-connectivity: Restored connectivity modules compilation
=20=20crda: Removed redundant recipe.

=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D
Changelog for meta-beagleboard:

=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D
Changelog for meta-browser:

=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D
Changelog for meta-bug:

=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D
Changelog for meta-chicken:

=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D
Changelog for meta-efikamx:

=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D
Changelog for meta-ettus:

=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D
Changelog for meta-fsl-arm:

Andy Voltz (1):
=20=20linux-timesys: Add branch information for new BitBake fetch

John Weber (2):
=20=20u-boot-fslc: Update SRCREV to ceb6b623
=20=20u-boot-fslc: Change SRCREV to 31d023b

Otavio Salvador (1):
=20=20fsl-default-providers.inc: Allow easy override of default U-Boot

=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D
Changelog for meta-fsl-arm-extra:

Alexandre Belloni (2):
=20=20cfa10057, cfa10058: remove unnecessary xinput calibration
=20=20cfa10036.inc: remove apm

John Weber (3):
=20=20wandboard: set PREFERRED_VERSION to 3.0.35
=20=20linux-wandboard: Add recipes for 3.10.17 kernel
=20=20wandboard: Set KERNEL_IMAGETYPE to zImage

=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D
Changelog for meta-fsl-ppc:

=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D
Changelog for meta-guacamayo:

=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D
Changelog for meta-gumstix:

=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D
Changelog for meta-gumstix-community:

=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D
Changelog for meta-handheld:

Paul Eggleton (1):
=20=20Update LIC_FILES_CHKSUM after toplevel LICENSE file checksum change

=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D
Changelog for meta-igep:

=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D
Changelog for meta-intel:

Nitin A Kamble (2):
=20=20sugarbay: linux-yocto-3.10: enable the webcam feature
=20=20sugarbay: linux-yocto-dev: update the webcam feature name

Tom Zanussi (1):
=20=20meta-intel: Clarify and relocate patch submission guidelines

=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D
Changelog for meta-ivi:

Andrei Gherzan (2):
=20=20dbus: Sync version with poky
=20=20netbase: Remove bbappend as no init scripts are installed

Florin Sarbu (1):
=20=20netbase: Sync version with poky.

=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D
Changelog for meta-java:

=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D
Changelog for meta-kde:

=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D
Changelog for meta-micro:

=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D
Changelog for meta-mono:

=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D
Changelog for meta-netbookpro:

=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D
Changelog for meta-nslu2:

=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D
Changelog for meta-opie:

=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D
Changelog for meta-qt3:

=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D
Changelog for meta-qt5:

=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D
Changelog for meta-slugos:

=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D
Changelog for meta-systemd:

=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D
Changelog for meta-raspberrypi:

Andrei Gherzan (15):
=20=20omxplayer: Update to HEAD and tweak SUMMARY and DESCRIPTION
=20=20packagegroup-rpi-test: Add test packagegroup
=20=20linux-raspberrypi: Update v3.12.4 to v3.12.7
=20=20linux-raspberrypi: Update v3.10.24 to v3.10.26
=20=20firmware: Update to remote HEAD
=20=20userland: Update to remote HEAD
=20=20linux-raspberrypi: Update v3.11.10 to remote HEAD
=20=20Merge "omxplayer: Update to HEAD and tweak SUMMARY and DESCRIPTION"
=20=20Merge "packagegroup-rpi-test: Add test packagegroup"
=20=20rpi-test-image: Add test image
=20=20README: Cleanup and add info about images
=20=20bcm2835: Update to v1.36
=20=20rpi-gpio: Update to v0.5.4
=20=20packagegroup-rpi-test: Add some packages
=20=20omxplayer: Update to remote HEAD

=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D
Changelog for meta-smartphone:

Jake (1):
=20=20Enable libmad in mplayer2 for (mostly) non stuttering mp3-playback on =
om_gta

Martin Jansa (4):
=20=20meta-openmoko: u-boot: Fix branch parameter
=20=20shr.conf: Enable icu PACKAGECONFIG for harfbuzz
=20=20linux-gta04: bump SRCREV to fix suspend

Simon Busch (1):
=20=20meta-samsung: linux-samsung-tuna: bump SRCREV to get the kernel =
working agai

=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D
Changelog for meta-ti:

Chase Maupin (6):
=20=20vpe-vpdma: Package for VPE DMA FW and test app
=20=20linux-ti-staging: Add dependency for VPE firmware
=20=20Graphics SDK: Add 5.01.00.01 version
=20=20omap-a15: set the UBI_VOLNAME to match u-boot default
=20=20am33x-cm3: clarify when initscripts are needed
=20=20linux-ti-staging: remove initscript dependency

Denys Dmytriyenko (1):
=20=20vpe-vpdma: update SRCREV and pass CROSS_COMPILE

Samuli Piippo (1):
=20=20libgles-omap3: add missing INSANE_SKIP for es9

=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D
Changelog for meta-webos:

Anatolii Sakhnik (2):
=20=20Allow world-read permissions for LS2 services
=20=20webos-image: luna-sysservice=3D33

Herb Kuta (4):
=20=20webos.inc: Change definition of WEBOS_DISTRO_RELEASE_CODENAME
=20=20webos.inc: Add the build codename to image names
=20=20packagegroup-core-tools-profile: Conditionalize LTTng packages via =
bbappend
=20=20packagegroup-core-tools-profile: Fix parsing error

Jaeyoon Jung (1):
=20=20webos_qmake5: Add the qt binaries to WEBOS_EXTRA_PATH

Martin Jansa (4):
=20=20yajl: Add nobranch param to SRC_URI
=20=20tcf-agent: Remove unnecessary .bbappend
=20=20sstatesig: Allow to cross target-native/cross/nativesdk boundary
=20=20webos-preferred-providers.inc: Add kernel-vmlinux to =
BAD_RECOMMENDATIONS

=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D
Changelog for meta-xilinx:

Nathan Rossi (1):
=20=20qemu: Update qemu to version 1.7.0

=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D
Changelog for meta-yocto:

Bruce Ashfield (1):
=20=20linux-yocto-bsps: update reference BSPs to v3.10.25

Richard Purdie (1):
=20=20poky-tiny.conf: Add PACKAGECONFIG to disable opkg-utils python =
dependencies

=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D
Changelog for openembedded:



