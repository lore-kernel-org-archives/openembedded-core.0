Return-Path: <cliff.brake@gmail.com>
Received: from mail-qk0-f176.google.com (mail-qk0-f176.google.com
	[209.85.220.176])
	by mail.openembedded.org (Postfix) with ESMTP id E30B860116;
	Tue,  5 Jul 2016 15:42:28 +0000 (UTC)
Received: by mail-qk0-f176.google.com with SMTP id u68so15298695qkc.3;
	Tue, 05 Jul 2016 08:42:29 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=date:mime-version:message-id:from:to:subject
	:content-transfer-encoding;
	bh=IYhl0A2DJuY4iUPsDuw8bIG6lNfLkDgbpsN6dnvokm0=;
	b=pi4Ls6oLQ9uQq4AVF2qHc7CI6yABJzUXdDNytpmoncCCiPdAzrTFGEjYDPv5W0TR8L
	NEHluJkqtZco1/QZ5CYA/vMTi9aenudebpFVY9RNxUaQ0N2xFVN9lPKTILrPPiMvo6oR
	jVNaMupy80lKG1CWKne9DDtD8goZTT60QMETm20Qjk4oRIplYSOmhzl66J4EHfj2hkzo
	NiD8DqlS18x2KwjCdVsGXVrfs5HwaDCHZEQHMplFeQC9T30Ql/rR6LQnp1YzfhODnli9
	g54L8cgyHlWPRK+HJRre+pqJDoPosZi7IfwQ6qPJkVpUhqTbdvMIBDCdAngm40De/kwY
	jd7w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20130820;
	h=x-gm-message-state:date:mime-version:message-id:from:to:subject
	:content-transfer-encoding;
	bh=IYhl0A2DJuY4iUPsDuw8bIG6lNfLkDgbpsN6dnvokm0=;
	b=Wdm4seN4QrNXrBHSyl0gXHLMqqzGOYfbBZK/hxuCKClE7Su+cz+hze6b0+HU2j/siS
	5OmHEcpMsZRMTg2t/Zs5oW1DzS0XUTl2Oq77IhlyCCSHX+Qfgw+UP7rlFzpxcjRppdmF
	hpNc9REaVCbb5WOSpF5UhSK7qumeSeAAaxPmJLIa0TwWKpmYCpJBVPc6dhtPiw7fMUrq
	5Ic7H2VOzzwBusytGNKiiFOqYrp4mu3HEEGx4EQlras5OS6NDWBjkf1+JekYQUb9yFz0
	0LaamX2rijDTcoB/WQGVLwgyOrDAxc3VBfMpNIgWMK0PksAgx5mT+yqRuHyCbVF9XgRX
	4y0w==
X-Gm-Message-State: ALyK8tJ5i7rKwB13RU6mzE6lvGD9ad3mVeCHUnid/vi6hUc1hizWl869bra50zVKdmX8CQ==
X-Received: by 10.55.215.141 with SMTP id t13mr24598784qkt.31.1467733348779;
	Tue, 05 Jul 2016 08:42:28 -0700 (PDT)
Received: from [127.0.0.1] (cable-pool5-cs-73.doycomm.com. [66.219.182.73])
	by smtp.gmail.com with ESMTPSA id u87sm277224qkl.30.2016.07.05.08.42.27
	(version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
	Tue, 05 Jul 2016 08:42:28 -0700 (PDT)
Date: Tue, 05 Jul 2016 08:42:28 -0700 (PDT)
X-Google-Original-Date: Tue, 05 Jul 2016 15:42:27 GMT
MIME-Version: 1.0
X-Mailer: Nodemailer (0.3.22; +http://andris9.github.com/Nodemailer/)
Message-Id: <1467733347394.e8915102@Nodemailer>
From: cliff.brake@gmail.com
To: openembedded-core@lists.openembedded.org,
	openembedded-devel@lists.openembedded.org,
	angstrom-distro-devel@linuxtogo.org, meta-ti@yoctoproject.org
Subject: OE Changelog since 2016-06-26 until 2016-07-03
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
X-List-Received-Date: Tue, 05 Jul 2016 15:42:29 -0000
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable

Changelog since 2016-06-26 until 2016-07-03.  Projects included in this =
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
meta-java: git://git.yoctoproject.org/meta-java
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

=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D
Changelog for openembedded-core:

Alexander Kanavin (3):
=20=20gdb-cross: do not hardcode the use of Python 2
=20=20pythonnative.bbclass, python3native.bbclass: export STAGING_INCDIR, =
STAGING_
=20=20pythonnative.bbclass, python3native.bbclass: use DEPENDS_append =
instead of D

Andrew F. Davis (1):
=20=20libsdl2: Add missing comma typo

Andr=C3=A9 Draszik (11):
=20=20classes/kernel: fix symlink creation in DEPLOYDIR for bundled =
initramfs
=20=20libidn: fix QA warning (uClibc)
=20=20json-c: backport patch to fix uClibc link issues
=20=20gmp: don't compile in mips16e mode
=20=20uclibc: don't compile in mips16e mode
=20=20libffi: don't compile in mips16e mode
=20=20glib: disable valgrind support when compiling in mips16e mode
=20=20binutils: backport patch to fix mipsel (malta) kernel compile
=20=20classes/kernel: fix symlink logic when bundling initramfs images
=20=20uclibc: backport patch to fix gdb 7.11 compilation
=20=20uclibc: re-enable verbose compilation

Bill Randle (1):
=20=20lib/oe/package_manager: keep platform_extra and =
default_platform_extra lists

Bruce Ashfield (3):
=20=20linux-yocto/4.1/4.4: tpm, telemetry, acpi and cpuid changes
=20=20linux-yocto/4.x: vfat feature cleanup
=20=20linux-yocto: bxt and input configuration changes

Chen Qi (3):
=20=20util-linux: upgrade to 2.28
=20=20bash-completion: delete files util-linux provides
=20=20systemd: upgrade to 230

Hongxu Jia (1):
=20=20e2fsprogs: tweak mke2fs ext4 features

Joshua Lock (1):
=20=20openssl: prevent warnings from openssl-c_rehash.sh

Jussi Kukkonen (10):
=20=20gtk+3: Upgrade 3.18.8 -> 3.20.6
=20=20atk: Upgrade 2.18.0 -> 2.20.0
=20=20at-spi2-core: Upgrade 2.18.3 -> 2.20.2
=20=20at-spi2-atk: Upgrade 2.18.1 -> 2.20.1
=20=20clutter-gtk-1.0: Upgrade 1.6.6 -> 1.8.0
=20=20puzzles: Keep building even with deprecation warnings
=20=20cairo: inherit upstream-version-is-even
=20=20gsettings-desktop-schemas: inherit upstream-version-is-even
=20=20vte: don't build test app
=20=20connman-gnome: StatusIcon adapts to size changes

Khem Raj (4):
=20=20musl: Upgrade to tip
=20=20gcc5: Upgrade to gcc 5.4
=20=20watchdog: Fix build with musl
=20=20gstreamer1.0: Upgrade to 1.8.2

Markus Lehtonen (27):
=20=20oeqa.utils.commands: Introduce get_bb_vars()
=20=20oeqa.utils.commands: use get_bb_vars() in get_bb_var()
=20=20oeqa.utils.commands: runCmd: return stderr output, too
=20=20scripts: introduce oe-build-perf-test
=20=20oe-build-perf-test: add pre-run sanity check
=20=20oe-build-perf-test: introduce oeqa.buildperf module
=20=20oeqa.buildperf: functionality to drop kernel caches
=20=20oeqa.buildperf: add BuildPerfTest class
=20=20oeqa.buildperf: method for measuring system resource usage
=20=20oeqa.buildperf: add method to log shell commands
=20=20oeqa.buildperf: add method for measuring file disk usage
=20=20oeqa.buildperf: add method for saving buildstats
=20=20oeqa.buildperf: implement BuildPerfTestRunner class
=20=20oeqa.buildperf: add test Test1P1
=20=20oeqa.buildperf: add test Test1P2
=20=20oeqa.buildperf: add test Test1P3
=20=20oeqa.buildperf: add test Test2
=20=20oeqa.buildperf: add test Test3
=20=20oeqa.buildperf: add test Test4
=20=20oeqa.buildperf: archive build/conf into test results
=20=20oe-build-perf-test: enable logging into file
=20=20oeqa.utils: add git module
=20=20oeqa.buildperf: add git revision and branch to result data
=20=20oe-build-perf-test: implement --globalres-file option
=20=20oe-build-perf-test: enable locking
=20=20oe-build-perf-test: add --out-dir command line argument
=20=20scripts/contrib: introduce build-perf-test-wrapper.sh

Martin Jansa (1):
=20=20test-dependencies.sh: Strip also '\.bb; .*' before adding failed =
recipe to l

Maxin B. John (6):
=20=20gstreamer1.0_git: bump to 1.8.2
=20=20gstreamer1.0-plugins-good_git: bump version to 1.8.2
=20=20gstreamer1.0-plugins-bad_git: bump version to 1.8.2
=20=20gstreamer1.0-plugins-base_git: bump version to 1.8.2
=20=20gstreamer1.0-plugins-ugly_git: bump version to 1.8.2
=20=20gstreamer1.0-libav_git: bump version to 1.8.2

Nathan Lynch (1):
=20=20recipetool: recognize less common makefile names

Patrick Williams (1):
=20=20linux-libc-headers: Update doc for recipe depends

Ricardo Neri (1):
=20=20kernel-module-split.bbclass: add a prefix for module package name =
pattern

Richard Purdie (1):
=20=20bitbake.conf: Drop BUILDSDK_LDFLAGS rpath, rpath-link

Ross Burton (6):
=20=20gst-player: upgrade to latest HEAD
=20=20qemu: add PACKAGECONFIG stanza for bzip2
=20=20oeqa/utils/commands: fix single-character variable matching in =
get_bb_vars()
=20=20toolchain-scripts: add sysroot/usr/share/pkgconfig to PKG_CONFIG_PATH
=20=20oeqa/runtime/syslog: remove redundant skipUnlessPassed
=20=20lib/oeqa: add Galculator to SDK and runtime tests

Roy Li (1):
=20=20libcap: fix the libcap-native building failure on CentOS 6.7

Ting Liu (1):
=20=20u-boot: extend UBOOT_CONFIG format to support different binary name

=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D
Changelog for meta-openembedded:

=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D
Changelog for meta-angstrom:

=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D
Changelog for meta-arago:

Jacob Stiffler (2):
=20=20ocl: bump SRCREV to version 1.1.9.0
=20=20openmpacc: bump SRCREV to version 1.3.2.0

Jianzhong Xu (1):
=20=20LINALG: Added missing header files to examples source code.

Karthik Ramanan (3):
=20=20gstreamer1.0-plugins-bad: Upgrade to 1.6.3
=20=20gstreamer1.0-plugins-ducati: Upgrade to GST 1.6.3
=20=20gstreamer1.0: Switch to GST 1.6.3

Sam Nelson (1):
=20=20packagegroup-arago-tisdk-addons: Add uio-module-drv and related test =
code

=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D
Changelog for meta-atmel:

=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D
Changelog for meta-beagleboard:

=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D
Changelog for meta-browser:

Jason Plum (1):
=20=20Firefox ESR to 38.8.0esr (2016-04-26)

Otavio Salvador (1):
=20=20Merge pull request #12 from WarheadsSE/firefox-38.8.0esr

=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D
Changelog for meta-bug:

=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D
Changelog for meta-chicken:

Fabio Berton (3):
=20=20chicken-egg-schelog: Update to version 3.6
=20=20chicken-egg-cooperative: Add recipe for version 0.1.1
=20=20.gitignore: Ignore egg-tarballs directory

=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D
Changelog for meta-efikamx:

=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D
Changelog for meta-ettus:

=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D
Changelog for meta-fsl-arm:

Max Krummenacher (1):
=20=20libimxvpuapi: use libdir from cross environment

Otavio Salvador (1):
=20=20u-boot-fslc: Bump revision to 3106462

=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D
Changelog for meta-fsl-arm-extra:

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

=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D
Changelog for meta-igep:

=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D
Changelog for meta-intel:

California Sullivan (2):
=20=20linux-yocto/4.4: Update SRCREVs for latest features and BXT backports
=20=20linux-yocto/4.1: Update SRCREVs for lots of BXT/APL backports

Jianxun Zhang (1):
=20=20lms7: Add patch to fix gcc6 C++ whitespace

=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D
Changelog for meta-ivi:

=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D
Changelog for meta-java:

Bernhard Dick (1):
=20=20openjdk-8: Add update version and build number to the java binaries

Daniel McGregor (2):
=20=20icedtea7-native: make GCC 6 happy
=20=20openjdk-8: make GCC6 happy

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

Ilkka Myller (4):
=20=202016-06-28, Version 4.4.7 'Argon' (LTS)
=20=20recipe: prevent file-rdeps and host-user-contaminated QA warnings
=20=20npm-install: prevent host-user-contaminated QA warnings for -dbg =
packages
=20=20npm-base: support for building recipes with allarch class

=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D
Changelog for meta-nslu2:

=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D
Changelog for meta-opie:

=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D
Changelog for meta-qt3:

Christopher Larson (1):
=20=20qt-x11-free: obey LDFLAGS

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

Anand Balagopalakrishnan (2):
=20=20ti-sgx-ddk-um: disable active power management
=20=20ti-sgx-ddk-km: disable active power management

Denys Dmytriyenko (2):
=20=20uio-test-pruss: correct COMPATIBLE_MACHINE
=20=20uio-module-drv-test: correct COMPATIBLE_MACHINE

Jacob Stiffler (2):
=20=20ti-ipc-rtos: add dependency on zip-native
=20=20openmp-rtos: bump SRCREV to version 2.3.1.0

Justin Sobota (7):
=20=20ti-pdk: Add makefile support to ti-pdk.bbclass for RTOS components
=20=20common-csl-ip: Move to new make infrastructure & Bump version
=20=20pa-lld: Bump version
=20=20rm-lld: Bump version
=20=20sa-lld: Bump version
=20=20srio-lld: Bump version
=20=20dfe-lld: Bump version

=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D
Changelog for meta-webos:

=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D
Changelog for meta-xilinx:

=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D
Changelog for meta-yocto:

=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D
Changelog for openembedded:



