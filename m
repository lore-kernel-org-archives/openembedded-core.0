Return-Path: <cliff.brake@gmail.com>
Received: from mail-io0-f180.google.com (mail-io0-f180.google.com
	[209.85.223.180])
	by mail.openembedded.org (Postfix) with ESMTP id 1485D60125;
	Mon, 17 Aug 2015 16:18:30 +0000 (UTC)
Received: by iodv127 with SMTP id v127so141299171iod.3;
	Mon, 17 Aug 2015 09:18:30 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=date:mime-version:message-id:from:to:subject:content-type
	:content-transfer-encoding;
	bh=EpxYwlfWUPjBfjDyhAduNXGOUrTseR+aMfy26u+id2A=;
	b=NC/l9zL4ZhzvL9ta+7Qb4G1eXGF67U2bJBKPECoK2DYiMh5/6WOfVnM6l0RIvaxxYY
	yb2fO+VhKhwq4XIpRAORJp+jhdWMz2BVk0rN2u7AG2wcOyFO12sgrc96OrC/+DAeD9ws
	PQ8/t6cyqYLYfJAInXoaO6dLjvhoy+CEkKKjbsoNOZQZK4mydxgB6L3rg5W2kzrDxavX
	XX6pnPMUWh0f7lAhFkxzoNjSmHFXRao4N+30qCpHzBvnKD5vjEO3hhgXOcHuQ4yQxq/a
	FJtxf0LN+ef3qbcV0iPOelhJR6cB1GsrQ5s/Pa0roJM6JfmxuH709xS7Rre36HhHA2Dm
	0kCQ==
X-Received: by 10.107.135.198 with SMTP id r67mr2643590ioi.43.1439828310426;
	Mon, 17 Aug 2015 09:18:30 -0700 (PDT)
Received: from [127.0.0.1] (cable-pool5-cs-161.doycomm.com. [66.219.182.161])
	by smtp.gmail.com with ESMTPSA id
	au6sm6271316igc.0.2015.08.17.09.18.29
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
	Mon, 17 Aug 2015 09:18:29 -0700 (PDT)
Date: Mon, 17 Aug 2015 09:18:29 -0700 (PDT)
X-Google-Original-Date: Mon, 17 Aug 2015 16:18:28 GMT
MIME-Version: 1.0
X-Mailer: Nodemailer (0.3.22; +http://andris9.github.com/Nodemailer/)
Message-Id: <1439828308644.c1b1d5c9@Nodemailer>
From: cliff.brake@gmail.com
To: openembedded-core@lists.openembedded.org,
	openembedded-devel@lists.openembedded.org,
	angstrom-distro-devel@linuxtogo.org, meta-ti@yoctoproject.org
Subject: OE Changelog since 2015-08-09 until 2015-08-16
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
X-List-Received-Date: Mon, 17 Aug 2015 16:18:31 -0000
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable

Changelog since 2015-08-09 until 2015-08-16.  Projects included in this =
report:

bitbake: git://git.openembedded.org/bitbake
openembedded-core: git://git.openembedded.org/openembedded-core
meta-openembedded: git://git.openembedded.org/meta-openembedded
meta-angstrom: git://github.com/Angstrom-distribution/meta-angstrom.git
meta-arago: git://arago-project.org/git/meta-arago.git
meta-atmel: https://github.com/linux4sam/meta-atmel.git
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
https://github.com/schnitzeltony/meta-gumstix-community.git
meta-handheld: git://git.openembedded.org/meta-handheld
meta-igep: http://github.com/ebutera/meta-igep.git
meta-intel: git://git.yoctoproject.org/meta-intel
meta-ivi: git://git.yoctoproject.org/meta-ivi
meta-java: git://github.com/woglinde/meta-java
meta-jetson-tk1: https://github.com/cubicool/meta-jetson-tk1.git
meta-kde: git://gitorious.org/openembedded-core-layers/meta-kde.git
meta-micro: git://git.openembedded.org/meta-micro
meta-mono: git://git.yoctoproject.org/meta-mono.git
meta-netbookpro: git://github.com/tworaz/meta-netbookpro
meta-nodejs: https://github.com/imyller/meta-nodejs.git
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

Ed Bartosh (11):
=20=20toaster: fix test_get_json_call_returns_json test
=20=20toaster: wrap long lines
=20=20toaster: get rid of AllProjectsViewTestCase
=20=20toaster: put all test cases into one class
=20=20toaster: get rid of class attributes
=20=20toaster: remove unused import
=20=20toaster: add header and docstings
=20=20toaster: don't catch json.load exceptions
=20=20toaster: fix test_get_json_call_returns_json again
=20=20toaster: fix pylint warning 'no space allowed'
=20=20toaster: reduced amount of instance attributes

=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D
Changelog for openembedded-core:

Ajay M (1):
=20=20bash: append srcdir to run-ptest script

Alexander Kanavin (16):
=20=20gptfdisk: update to 1.0.0
=20=20oprofile: reorder SRC_URI lines to fix upstream version check
=20=20recipeutils.py: allow all characters in regexes used to parse version =
string
=20=20bootchart2: update to 0.14.7
=20=20cdrtools: update to 3.01a31
=20=20bluez5: update to 5.33
=20=20apt: update to 1.0.10.1
=20=20autogen: update to 5.18.5
=20=20stress: use BPN and BP in SRC_URI
=20=20xf86-video-omapfb: switch SRC_URI to debian git repo
=20=20distcc: update SRC_URI to not use Google Code
=20=20fotowall: update SRC_URI to use github instead of qt-apps.org
=20=20clutter-gst: update to 3.0.8
=20=20upstream_tracking.inc: add no update reasons for base-passwd and =
chkconfig
=20=20blktool: update to 4-7
=20=20apmd: update to 3.2.2-15

Andre McCurdy (8):
=20=20gettext_0.16.1: remove obsolete uclibc specific patch
=20=20gettext_0.16.1: add -lrt and -lpthread to LDFLAGS for uclibc builds
=20=20libiconv_1.11.1: fix LICENSE declaration, LGPL -> LGPLv2.0
=20=20libiconv_1.11.1: merge build and packaging fixes from libiconv_1.14
=20=20uclibc: backport upstream fix for SH4
=20=20bash_3.2.48: dont include target CFLAGS in host LDFLAGS
=20=20kernel.bbclass: dont assume ${B}/include/generated exists
=20=20uclibc.inc: remove unused UCLIBC_EXTRA_LDFLAGS

Andreas M=C3=BCller (1):
=20=20boost: add python3 support

An=C3=ADbal Lim=C3=B3n (3):
=20=20distrodata: Make self-contained.
=20=20mc: Fix QA warning depends on util-linux
=20=20qemu-native: Add debugging when qemu fails with qemu_cpu_kick_thread

Armin Kuster (3):
=20=20nettle: clean up license information
=20=20tzcode-native: update to 2015f
=20=20tzdata: update to 2015f

Carlos Rafael Giani (1):
=20=20gstreamer1.0-plugins-base: Enable pango packageconfig by default

Chen Qi (2):
=20=20resolvconf: upgrade to 1.77
=20=20cups: upgrade to 2.0.4

Cristian Iorga (1):
=20=20qemu: upgrade to 2.4.0-rc4

Ed Bartosh (1):
=20=20create-pull-request: cleanup bashisms

He Zhe (1):
=20=20kernel: Correct mishandling of linux.bin for building uImage

Jackie Huang (1):
=20=20libinput: add configure arg and PACKAGECONFIG for libunwind

Jason Wessel (1):
=20=20initscripts: Fix regression for requiring /bin/bash

Joshua Lock (1):
=20=20lib/oe/package_manager: fix opkg feed generation

Juro Bystricky (2):
=20=20IMAGES_FSTYPES: default to EXT4
=20=20build-appliance-image: use ext4 for rootfs

Jussi Kukkonen (11):
=20=20gtk+3: Upgrade 3.16.4 -> 3.16.6
=20=20gtk-icon-utils-native: Upgrade 3.16.4 -> 3.16.6
=20=20fontconfig: Upgrade 2.11.93 -> 2.11.94
=20=20vte: Fix LICENSE to LGPL2.0
=20=20which: Upgrade 2.20 -> 2.21
=20=20xf86-input-vmmouse: Upgrade 13.0.0 -> 13.1.0
=20=20libepoxy: Upgrade 1.2 -> 1.3.1
=20=20qmmp: Upgrade 0.8.5 -> 0.8.6
=20=20texinfo: Upgrade 5.2 -> 6.0
=20=20nss: Upgrade 3.19.1 -> 3.19.2
=20=20librsvg: Upgrade 2.40.9 -> 2.40.10

Kai Kang (2):
=20=20rt-tests: fix redo install error
=20=20qemu: add ptest sub-package

Khem Raj (4):
=20=20ca-certificates: Update 20141019 -> 20150426
=20=20gnu-config: Update git version to latest and use it
=20=20packagegroup-core-sdk: Disable sanitizers on musl
=20=20valgrind: Fix build with glibc 2.22

Koen Kooi (1):
=20=20gnu-efi: BBCLASSEXTEND to native

Mariano Lopez (6):
=20=20qemurunner.py: Add method run_serial
=20=20qemurunner.py: Added login to start method
=20=20qemurunner.py: Added raw mode in run_serial
=20=20qemurunner.py: Performance improvements in run_serial
=20=20oetest.py: Added method tearDown for oeRuntimeTest
=20=20oetest.py: Don't wait to write dump files

Mihail Stanciu (1):
=20=20oeqa/selftest: remove tests for TCs that are no longer valid

Mikko Rapeli (1):
=20=20sanity.bbclass: check SSTATE_DIR, DL_DIR and *MIRROR for broken =
symlinks

Nicolas Dechesne (1):
=20=20mesa: upgrade 10.5.8 -> 10.6.3

Otavio Salvador (2):
=20=20mesa-demos: Fix dependency for 'vg' support
=20=20wpa-supplicant: Fix CVE-2015-4142

Pau Espin Pedrol (3):
=20=20bitbake.conf: Add nonarch_libdir and base systemd vars on it
=20=20systemd.bbclass: Use systemd_system_unitdir
=20=20pulseaudio: Add systemd to PACKAGECONFIG if enabled in DISTRO_FEATURES

Reinette Chatre (1):
=20=20perf: fix build breakage on kernels after 4.1

Ricardo Neri (1):
=20=20bootimg.bbclass:iso: determine the -iso-level only if there is a =
rootfs

Richard Purdie (1):
=20=20libpam: Fix patch broken during upgrade

Robert Yang (5):
=20=20git: 2.4.6 -> 2.5.0
=20=20file: 5.23 -> 5.24
=20=20libcheck: 0.9.14 -> 0.10.0
=20=20bash: 4.3 -> 4.3.30
=20=20binutils: 2.25 -> 2.25.1

Ross Burton (3):
=20=20weston: improve parallel make race fixes
=20=20Revert "base.bbclass/blacklist.bbclass: remove doc item when =
d.getVarFlags()
=20=20systemd: update SRC_URI

Roy Li (2):
=20=20bind: upgrade to 9.10.2-p3
=20=20attr: narrow fix_symlink to populate_sysroot

Stefan M=C3=BCller-Klieser (1):
=20=20cml1.bbclass: make menuconfig task configurable

Yuqing Zhu (11):
=20=20gstreamer1.0-plugins-base: Bug fix for id3demux issue
=20=20gstreamer1.0-plugins-base: Handle audio/video decoder error
=20=20gstreamer1.0-plugins-base: Update video alignment after video =
alignment
=20=20gstreamer1.0-plugins-base: Fix output buffer can't writable after =
frame_map(
=20=20gstreamer1.0-plugins-base: Keep sticky events around when doing a =
soft reset
=20=20gstreamer1.0-plugins-base: Do not change EOS event to GAP event
=20=20gstreamer1.0-plugins-base: Make memory copy when video buffer's =
memory is re
=20=20gstreamer1.0-plugins-base: Don't set async of custom text-sink to =
false
=20=20gstreamer1.0-plugins-base: Enhance SSA text lines parsing
=20=20gstreamer1.0-plugins-base: Set need_segment after sink pad receive =
GST_EVENT
=20=20gstreamer1.0-plugins-base: Need more buffers in output queue for =
better perf

=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D
Changelog for meta-openembedded:

=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D
Changelog for meta-angstrom:

Khem Raj (4):
=20=20psplash: Delete recipe
=20=20psplash: Delete all incarnations
=20=20distro: Enable wayland feature
=20=20systemd-qt5-image: Add qtwayland plugin to image

Koen Kooi (6):
=20=20images: ship connmanctl
=20=20Angstrom: prefer ext4 over ext3
=20=20angstrom-skel: /etc/skel files for angstrom
=20=20(angstrom-)packagegroup-gnome: add angstrom-skel-gnome2
=20=20systemd-image: make it a strict superset of angstrom-image
=20=20angstrom-image: allow empty passwords

=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D
Changelog for meta-arago:

Denys Dmytriyenko (13):
=20=20oprofile: drop bbappend
=20=20oprofile-example: Makefile is not being used, don't do clean too
=20=20ti-llvm3: llvm3.inc got unified into llvm.inc upstream
=20=20bt-firmware: Makefile doesn't have clean target
=20=20wpa-supplicant-wl18xx: fix license checksums, bump version
=20=20hostap-daemon-wl18xx: update license checksum
=20=20ltp-ddt: disable IPC tests until 4.1 is ready
=20=20packagegroup-arago-test: re-enable ltp-ddt w/o IPC tests
=20=20wpa-supplicant.inc: fix path for sed command
=20=20Revert "packagegroup-arago-test: re-enable ltp-ddt w/o IPC tests"
=20=20packagegroup-arago-test: re-enable ltp-ddt w/o IPC tests
=20=20Revert "oprofile: drop bbappend"
=20=20ti-tisdk-makefile: fix breakage when UBOOT_LOADADDRESS is not defined

Jacob Stiffler (7):
=20=20llvm-common: Extend to nativesdk class.
=20=20ti-llvm3.3: Add LLVM 3.3 with c6x intrinsic support.
=20=20packagegroup-arago-tisdk-matrix: Add accelerated MM demos
=20=20ti-tisdk-setup: Bump SRCREV for latest enhancements and fixes
=20=20packagegroup-arago-gst*: Add gstreamer1.0-plugins-hevc.
=20=20packagegroup-arago-tisdk-matrix: Add HEVC demo.
=20=20udev-cache: Disable by default.

=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D
Changelog for meta-atmel:

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

=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D
Changelog for meta-fsl-arm-extra:

=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D
Changelog for meta-fsl-ppc:

Ting Liu (2):
=20=20udev-rules-qoriq: avoid conflict with udev-extraconf
=20=20adjust MACHINEOVERRIDES ordering

=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D
Changelog for meta-guacamayo:

=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D
Changelog for meta-gumstix:

=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D
Changelog for meta-gumstix-community:

=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D
Changelog for meta-handheld:

=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D
Changelog for meta-igep:

=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D
Changelog for meta-intel:

=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D
Changelog for meta-ivi:

=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D
Changelog for meta-java:

=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D
Changelog for meta-jetson-tk1:

=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D
Changelog for meta-kde:

=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D
Changelog for meta-micro:

=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D
Changelog for meta-mono:

=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D
Changelog for meta-netbookpro:

=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D
Changelog for meta-nodejs:

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

Denys Dmytriyenko (7):
=20=20omap5-sgx-ddk-um-linux: Makefile doesn't have clean target
=20=20u-boot-ti-staging: update with more KS2 and other changes
=20=20linux-ti-staging: update with latest merges
=20=20cuia: don't call clean from do_compile, do_configure takes care of =
that
=20=20kselftests: add 4.1 version of Kernel Selftest suite
=20=20cuia: revert to clean in do_compile, disable automatic in do_configure
=20=20linux-ti-staging: update to 4.1.5

Jacob Stiffler (1):
=20=20ti-xdctools: Add version 3.31.02.38.

=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D
Changelog for meta-webos:

=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D
Changelog for meta-xilinx:

=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D
Changelog for meta-yocto:

An=C3=ADbal Lim=C3=B3n (1):
=20=20distro/include: Move files to OE-Core for support distrodata

He Zhe (1):
=20=20meta-yocto-bsp: mpc8315e-rdb: Set KERNEL_DEVICETREE to mpc8315erdb.dtb

=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D
Changelog for openembedded:



