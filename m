Return-Path: <cliff.brake@gmail.com>
Received: from mail-ig0-f171.google.com (mail-ig0-f171.google.com
	[209.85.213.171])
	by mail.openembedded.org (Postfix) with ESMTP id D710860017;
	Wed,  6 Aug 2014 19:09:25 +0000 (UTC)
Received: by mail-ig0-f171.google.com with SMTP id l13so9201450iga.16
	for <multiple recipients>; Wed, 06 Aug 2014 12:09:26 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=date:mime-version:message-id:from:to:subject:content-type
	:content-transfer-encoding;
	bh=iL1ZGaKDcsEFZqMeekAV02Sd6auRNPB0KjyXc8X2Spo=;
	b=Y2qQaUGnWSpLYNnM/2/jgX6veuCWm8g79NXJ8aQDWsO1b8s/DfESyVQXhcLjDI2wiG
	vjPwwfbtdgdjSA2bZaYVASFDrOAWx/kSNxZWuZqsIBAC1RKf0b8fF7v6sblr3XkDvFWC
	Oz/tWuce4WK795LgYxWXy0fGbuuhQFZ9g3H1OFPA8/dTwsQiUlPpJQMKRS9TIE1m0RfM
	z1MD1CjRNPaQlZrXUCLFTTUbmmCyNukZnOqy8Hm5xdox4VgtofRaJlfxcC86wJtEYV8g
	iNLV81biVfOkHbor0YGJpFB5SPT95LJcnlWUX74xmfuDOpA8OttvbvT+i9+TKTLk889e
	tKAA==
X-Received: by 10.50.79.195 with SMTP id l3mr60808305igx.23.1407352166007;
	Wed, 06 Aug 2014 12:09:26 -0700 (PDT)
Received: from [127.0.0.1] (cable-pool6-cs-200.doycomm.com. [66.219.185.200])
	by mx.google.com with ESMTPSA id
	bf4sm10808701igb.17.2014.08.06.12.09.24 for <multiple recipients>
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
	Wed, 06 Aug 2014 12:09:25 -0700 (PDT)
Date: Wed, 06 Aug 2014 12:09:25 -0700 (PDT)
X-Google-Original-Date: Wed, 06 Aug 2014 19:09:23 GMT
MIME-Version: 1.0
X-Mailer: Nodemailer (0.3.22; +http://andris9.github.com/Nodemailer/)
Message-Id: <1407352163565.9e8580b7@Nodemailer>
From: cliff.brake@gmail.com
To: openembedded-core@lists.openembedded.org,
	openembedded-devel@lists.openembedded.org,
	angstrom-distro-devel@linuxtogo.org, meta-ti@yoctoproject.org
Subject: OE Changelog since 2014-07-27 until 2014-08-03
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
X-List-Received-Date: Wed, 06 Aug 2014 19:09:27 -0000
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable

Changelog since 2014-07-27 until 2014-08-03.  Projects included in this =
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

Namhyung Kim (2):
=20=20knotty: Move second event check into a proper block
=20=20cooker: Get rid of duplicate 'import re'

Richard Purdie (1):
=20=20runqueue: Add sceneQueueComplete event

Scott Rifenbark (4):
=20=20bitbake-user-manual-fetching.xml: Added new clearcase fetcher module.
=20=20bitbake-user-manual/bitbake-user-manual-intro.xml: Fixed link
=20=20bitbake-user-manual-fetching.xml: Minor edits to clearcase fetcher
=20=20bitbake-user-manual-metadata.xml: Fixed variable flags example.

=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D
Changelog for openembedded-core:

Carlos Rafael Giani (7):
=20=20gstreamer1.0: upgrade to 1.4.0
=20=20gstreamer1.0-plugins-base: upgrade to 1.4.0
=20=20gstreamer1.0-plugins-good: upgrade to 1.4.0
=20=20gstreamer1.0-plugins-bad: upgrade to 1.4.0
=20=20gstreamer1.0-plugins-ugly: upgrade to 1.4.0
=20=20gstreamer1.0-libav: upgrade to 1.4.0
=20=20gstreamer1.0-omx: upgrade to 1.2.0

Chen Qi (3):
=20=20volatile-binds: add recipe
=20=20systemd: add volatile-binds to RDEPENDS
=20=20image.bbclass: tweak read_only_rootfs_hook to also support systemd =
based sys

Corneliu Stoicescu (2):
=20=20selftest/buildoptions.py: fix QA_WARN test and add more output when =
failing
=20=20oeqa/utils/decorators.py: add import os

Drew Moseley (4):
=20=20libx11: Add missing NULL check
=20=20init-install-efi.sh: Verify /sys based files exist before displaying =
them
=20=20init-install: Strip partition number from live_dev_name
=20=20init-install: Skip CDROM devices during probe

Hongxu Jia (1):
=20=20gcc-4.9.inc: fix parallel building failure

Jackie Huang (1):
=20=20alsa-lib: Add upgrade path for alsa-dev

Kai Kang (1):
=20=20python-smartpm: fix option typo of command channel

Khem Raj (1):
=20=20gcc: Upgrade 4.9.0 -> 4.9.1

Li Wang (1):
=20=20nss: CVE-2013-5606

Mark Hatle (3):
=20=20sanity.bbclass: Add ability to verify toolchain flags
=20=20gcc: Fix gcc-multilib-config comparison
=20=20tune-mips*: Ensure tunes are inherited in order

Martin Jansa (1):
=20=20mesa-demos: upgrade to 8.2.0 and allow building without GLEW/GLU

Matthieu Crapet (1):
=20=20libav: fix PACKAGECONFIG for theora and libvorbis

Max Eliaser (1):
=20=20python: python-pycairo: add python-pycairo-native

Maxin B. John (1):
=20=20i2c-tools: Uprev to 3.1.1

Nitin A Kamble (1):
=20=20INITRD var: make it a list of filesystem images

Paul Barker (1):
=20=20opkg-utils: Update SRCREV

Paul Gortmaker (3):
=20=20base-files: actually install 2775 dirs as 2775, not 2755
=20=20base-files: remove strange 2775 perms from dirs like /home
=20=20base-files: fix up misleading dir grouping names for lsb dirs

Richard Purdie (8):
=20=20lib/oe/rootfs: Improve error message whitespace
=20=20populate_sdk_base: Fix grep command usage on old hosts
=20=20qemu.inc: Allow optional use of pkg-config from the HOST
=20=20bdwgc: Upgrade 7.2d -> 7.4.2
=20=20sstate: Allow switching between linux and non-linux SDK builds within =
the sa
=20=20autotools: Fix warning for odctools-crosssdk
=20=20package: Fix pkgdest for darwin shlibs code
=20=20package: Convert dylib handling from .la to otool

Robert Yang (3):
=20=20image-vmdk.bbclass: use sda rather than hda
=20=20package_manager.py: set preferred ABI for rpm
=20=20local.conf.sample.extended: update for preferred ABI

Ross Burton (1):
=20=20autoconf: remove automake patch enforcing --foreign

Saul Wold (4):
=20=20help2man-native: Upgrade to 1.46.1
=20=20lsbinitscripts: Upgrade to 9.55
=20=20libcheck: Upgrade to 0.9.14
=20=20libnl: Upgrade to 3.2.25

Shan Hai (1):
=20=20pulseaudio: fix CVE-2014-3970

Stefan M=C3=BCller-Klieser (1):
=20=20cml1: correct diffconfig output format

Tom Zanussi (4):
=20=20wic: Fix plugin help text
=20=20wic: Add documentation for --fsoptions
=20=20wic: Add squashfs to --fstypes documentation
=20=20wic: Various typo/grammar fixes to wic help text

=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D
Changelog for meta-openembedded:

Andrea Adami (2):
=20=20linux-yocto-tiny-kexecboot: do not exec do_package_qa task
=20=20klibc-utils: add explicit dependency on klibc for the shared utils

Armin Kuster (3):
=20=20wireshark: Add recipe 1.12.0-rc2
=20=20wireshark: fix build for arm
=20=20wireshark: fix build depends

Ben Shelton (5):
=20=20xfontsel: add recipe
=20=20xlsfonts: add recipe
=20=20xmag: add recipe
=20=20font-misc-misc: add recipe
=20=20font-cursor-misc: add recipe

Eduardo Silva (1):
=20=20monkey: new v1.5.1 release.

Jukka Rissanen (1):
=20=20usb-modeswitch: Upgrade to latest version

Martin Jansa (3):
=20=20modemmanager: add dbus-glib dependency
=20=20meta-python: rename recipes-python to recipes-devtools
=20=20portmap: fix FILESEXTRAPATHS

Matthieu CRAPET (1):
=20=20jq: upgrade to 1.4

Otavio Salvador (1):
=20=20xf86-video-geode: Update to 2.11.16

Paul Barker (1):
=20=20vim: Upgrade to v7.4.373

Richard Purdie (1):
=20=20wireshark: Add missing pkgconfig dependency

Richard Tollerton (1):
=20=20syslog-ng: Improved initscript VERBOSE handling.

Roy Li (7):
=20=20openvpn: not use the hardcoded libdir
=20=20ipsec-tools: several fixes
=20=20tnftp: add openssl PACKAGECONFIG and inherit pkgconfig
=20=20libxml-sax-writer-perl: add recipe
=20=20libxml-filter-buffertext-perl: add recipe
=20=20python-decorator: add recipe
=20=20python-slip-dbus: add recipe

Roy.Li (1):
=20=20snort: do not hardcode the libdir

Ting Liu (3):
=20=20xterm: disable-rpath-hack to avoid QA issue
=20=20libhugetlbfs: not build obj32 for all 64b platforms
=20=20ipsec-tools: enable Dead Peer Detection and NAT traversal

dv@pseudoterminal.org (1):
=20=20libvpx: upgrade to version 1.3.0

=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D
Changelog for meta-angstrom:

Koen Kooi (1):
=20=20ranpwd: fix build

=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D
Changelog for meta-arago:

Denys Dmytriyenko (15):
=20=20qt5: update bbappends to match version 5.2.1 in meta-qt5/daisy
=20=20qtwebkit: update patches applied to 5.2.1 version
=20=20arago.conf: re-enable gles2 flag for qt5 builds
=20=20weston: set default fbdev backend automatically when building for it
=20=20packagegroup-*-connectivity: conditionally disable wpa-gui for not =
supportin
=20=20matrix-gui: run on top of Wayland and Qt5
=20=20arago.conf: enable Qt5 by default, disable DRM for Weston
=20=20packagegroup-*-graphics: add Weston to corresponding packagegroup
=20=20refresh-screen: fix up Windows newlines in patches
=20=20matrix-gui-apps: set more specific CC-BY-SA-3.0 license
=20=20arago.conf: use the new _remove override to filter out sgx feature
=20=20arago-prefs.inc: switch u-boot preference to ti-staging variant
=20=20u-boot: update AUTOREV bbappend from mainline to ti-staging
=20=20recipes-connectivity: remove remaining unnecessary exec permissions
=20=20refresh-screen: fix up Windows newlines in patches

=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D
Changelog for meta-beagleboard:

=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D
Changelog for meta-browser:

Carlos Rafael Giani (2):
=20=20chromium: Add PACKAGECONFIG for disabling API keys info bar
=20=20chromium: Add recipe for version 37.0.2062.0

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

Otavio Salvador (3):
=20=20u-boot-fslc: Update to 7a3b1da revision
=20=20u-boot-fslc: Update to dfd9146 revision
=20=20linux-fslc (3.14): Update to 6c6f90b revision

=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D
Changelog for meta-fsl-arm-extra:

=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D
Changelog for meta-fsl-ppc:

Ting Liu (5):
=20=20add cs4315-firmware license file Cortina
=20=20add more generic SOC_FAMILY name t1/t2/t4/b4
=20=20fmlib: use SOC_FAMILY as override
=20=20libvirt: add bbappend for qoriq-ppc customizations
=20=20ipsec-demo (scripts and configuration files) add recipe

=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D
Changelog for meta-guacamayo:

=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D
Changelog for meta-gumstix:

=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D
Changelog for meta-gumstix-community:

=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D
Changelog for meta-handheld:

Andrea Adami (2):
=20=20linux-gcw0_3.12: update defconfig
=20=20linux-gcw0-kexecboot_3.12: update defconfig

=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D
Changelog for meta-igep:

=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D
Changelog for meta-intel:

Darren Hart (1):
=20=20linux-yocto-dev: Remove LINUX_VERSION

Ross Burton (4):
=20=20libva: Upgrade to 1.3.1
=20=20libva-intel-driver: Upgrade to 1.3.2
=20=20gstreamer-vaapi: Switch gstreamer-vaapi-1.0 to GStreamer 1.2 API
=20=20gstreamer-vaapi: Upgrade to 0.5.8

=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D
Changelog for meta-ivi:

Andrei Gherzan (4):
=20=20README.md: Use official meta-oe repo
=20=20packagegroups: Added package groups for qt5 and gps
=20=20libitzam: Fix automake
=20=20persistence-client-library: Inherit pkg-config

Holger Behrens (1):
=20=20autoconf: Fix recipes configure problems

Postolache George (1):
=20=20automotive-message-broker: Add recipe

=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D
Changelog for meta-java:

=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D
Changelog for meta-kde:

=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D
Changelog for meta-micro:

=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D
Changelog for meta-mono:

Alex J Lennon (2):
=20=20monotools-server: Correct use of FILESEXTRAPATHS
=20=20mono-git: Patch path to libMonoPosixHelper.so

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

=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D
Changelog for meta-smartphone:

=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D
Changelog for meta-ti:

Denys Dmytriyenko (4):
=20=20linux-ti-staging: update to 3.14.14 with wlcore defconfig changes
=20=20u-boot-ti-staging: add TI staging version of u-boot 2014.07
=20=20linux-ti-staging: add Darren's SGX patches to make graphics work with =
3.14
=20=20omap3-sgx-modules 5.01.01.01: add Darren's patches to work with 3.14 =
kernel

=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D
Changelog for meta-webos:

=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D
Changelog for meta-xilinx:

Nathan Rossi (2):
=20=20gcc: Updated GCC 4.8 MicroBlaze patch
=20=20openssl: Fixup FILESEXTRAPATH usage

=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D
Changelog for meta-yocto:

Richard Purdie (2):
=20=20poky: Enable build-deps QA test bu default
=20=20upstream-tracking: Add various CHECK_DATE and UPDATE_REASONs for my =
recipes

Robert Yang (1):
=20=20local.conf.sample.extended: update for preferred ABI

=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D
Changelog for openembedded:



