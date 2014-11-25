Return-Path: <cliff.brake@gmail.com>
Received: from mail-ig0-f172.google.com (mail-ig0-f172.google.com
	[209.85.213.172])
	by mail.openembedded.org (Postfix) with ESMTP id EAE71721A1;
	Tue, 25 Nov 2014 15:43:05 +0000 (UTC)
Received: by mail-ig0-f172.google.com with SMTP id hl2so5177561igb.17
	for <multiple recipients>; Tue, 25 Nov 2014 07:43:05 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=date:mime-version:message-id:from:to:subject:content-type
	:content-transfer-encoding;
	bh=IqYu7s5fiAC0fKrBUZ8GnpwHbIzgYYkkJ78Bu5IelpA=;
	b=h62SiI03U97FxwGAnnSM/55WR/FESVV2WuNYCaNRODeUglFnJi87J/U7rxEtbVyTlK
	Mlkvw1LICIHoYwmj3SGAhAU+6FU4OCVMPAEHGbOqL2ONcfVJ9khps6TEoYYfc4I9mlF3
	zjXpZGgw/rr+SSNqtkKF5UWEcDcbM/+SwdvVAjBiq2LdBKYQxG/ZQ7AuucaM9yp+jVog
	DwvcAHTk2D/eaSDvCK5QFTLXwgcjkKY0SsKx7A58SK3rB43UnqHQl58lvUb2XgxPxIud
	6By60fUqSx9r/I0UP3IZmJpc88MrsLBaaLKJ3mp9yiNnasamLR2dyi8yq+8CE2mm6uDM
	7Q6A==
X-Received: by 10.50.134.225 with SMTP id pn1mr17725183igb.33.1416930185105;
	Tue, 25 Nov 2014 07:43:05 -0800 (PST)
Received: from [127.0.0.1] (cable2-pool191-cs-105.doycomm.com.
	[66.219.191.105])
	by mx.google.com with ESMTPSA id c17sm730131ioc.9.2014.11.25.07.43.03
	for <multiple recipients>
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
	Tue, 25 Nov 2014 07:43:04 -0800 (PST)
Date: Tue, 25 Nov 2014 07:43:04 -0800 (PST)
X-Google-Original-Date: Tue, 25 Nov 2014 15:43:03 GMT
MIME-Version: 1.0
X-Mailer: Nodemailer (0.3.22; +http://andris9.github.com/Nodemailer/)
Message-Id: <1416930183142.83d8ab1c@Nodemailer>
From: cliff.brake@gmail.com
To: openembedded-core@lists.openembedded.org,
	openembedded-devel@lists.openembedded.org,
	angstrom-distro-devel@linuxtogo.org, meta-ti@yoctoproject.org
Subject: OE Changelog since 2014-11-16 until 2014-11-23
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
X-List-Received-Date: Tue, 25 Nov 2014 15:43:11 -0000
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable

Changelog since 2014-11-16 until 2014-11-23.  Projects included in this =
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

Alexandru DAMIAN (1):
=20=20toastergui: layer name correlation

Belen Barros Pena (5):
=20=20toaster: fix file name collision
=20=20toaster: Tiny refinements to the new build button dialog
=20=20toaster: add no results state to all layers page
=20=20toaster: fix dependencies dialog layout
=20=20toaster: do not show target if target name is empty

Michael Wood (5):
=20=20toaster: skip virtualenv when searching for django apps
=20=20toaster: Create libtoaster.js with some utility functions
=20=20toaster: libtoaster: Add getProjectInfo utility function
=20=20toaster: Add New Build Button feature
=20=20toaster: project page remove additional tooltip for Change pencil

Otavio Salvador (1):
=20=20bb.codeparser.py: Remove reference for oe.utils.contains

Robert Yang (1):
=20=20bitbake-worker: exit normally when SIGHUP

Ross Burton (1):
=20=20depexp: use stateForceShutdown instead of stateStop

=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D
Changelog for openembedded-core:

Alexandru DAMIAN (1):
=20=20toaster: add toaster layer configuration files

Andrei Gherzan (1):
=20=20xkeyboard-config: Inherit gettext

Changhyeok Bae (1):
=20=20ethtool: Upgrade to 3.16

Chong Lu (2):
=20=20tcl: Upgrade to 8.6.3
=20=20byacc: Upgrade to 20141006

Hongxu Jia (4):
=20=20ghostscript: upgrade to 9.15
=20=20parted: upgrade to 3.2
=20=20gcc-4.9: fix the compile failure of 'defaults.h' not found
=20=20postinst-intercept: rename recipe for nativesdk only

Javier Viguera (1):
=20=20shadow-securetty: add ttyAM[0-3] serial ports

Krzysztof Sywula (1):
=20=20dtc: old SRC_URI died, changing to new working one

Otavio Salvador (3):
=20=20toolchain-scripts.bbclass: Export KCFLAGS to ensure sysroot is =
provided
=20=20sysvinit-inittab: Disable the carrier detect requirement for serial =
consoles
=20=20systemd-serialgetty: Disable the carrier detect requirement for =
serial conso

Paul Eggleton (4):
=20=20openssh: drop already applied patch
=20=20cmake: drop already applied patches
=20=20xmodmap: drop already applied patch
=20=20gtk+: drop part of patch adding useless file

Richard Tollerton (3):
=20=20util-linux: break out util-linux-getopt
=20=20default-providers.inc: define VIRTUAL-RUNTIME_getopt
=20=20lsb: update RDEPENDS for broken-out util-linux-getopt

Robert Yang (1):
=20=20toolchain-shar-template.sh: fix the text files in the top dir

Ross Burton (2):
=20=20bind: use PACKAGE_BEFORE_PN instead of PACKAGES_prepend
=20=20cups: remove unrecognised option

Roy.Li (1):
=20=20rpm: fix the rpm addsign function

Tobias Olausson (1):
=20=20spdx.bbclass: improved error handling and code cleanup

Wenzong Fan (1):
=20=20python: Fix CVE-2014-7185

=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D
Changelog for meta-openembedded:

Andrea Adami (3):
=20=20klibc: define KLIBCLIBGCC
=20=20ubi-utils-klibc_1.5.0: remove recipe and patches
=20=20ubi-utils-klibc_1.5.1: initial commit of v. 1.5.1

Andreas M=C3=BCller (2):
=20=20xfce4-weather-plugin: make work properly after met.no API change
=20=20gvfs: replace deprecated g_memmove by memmove

Armin Kuster (1):
=20=20wireshark: update to 1.12.2

Bian Naimeng (2):
=20=20libesmtp: port from openembedded.
=20=20esmpt: port from openembedded.

Jackie Huang (1):
=20=20postfix.inc: Remove references to buildmachine paths in target =
makedefs.out

Kai Kang (1):
=20=20polarssl: add dependency openssl

Mario Domenech Goulart (2):
=20=20gtest: add recipe
=20=20gmock: add recipe

Martin Jansa (1):
=20=20postfix: Fix indentation

Peter Bigot (2):
=20=20imagemagick: update URI to allow fetching current and previous =
releases
=20=20imagemagick: update 6.8.9 to patchset 9

Xufeng Zhang (1):
=20=20syslog-ng: Fix memory leak when udp connection is used [ LIN7-1379 ]

Yevhen Kyriukha (1):
=20=20rabbitmq-c: update to v0.5.2.

Zhenhua Luo (1):
=20=20ptpd: add FSL QorIQ DPAA and eTSEC support

=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D
Changelog for meta-angstrom:

=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D
Changelog for meta-arago:

=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D
Changelog for meta-atmel:

Josh Wu (5):
=20=20qt-demo-init-v1.1: remove tslib as we can use linux touch event =
directly
=20=20Use touchscreen evdev directly.
=20=20atmel-qt5-demo-image: remove tslib features
=20=20atmel-qt5-demo-image: add post process command to remove tslib plugin =
in qt=20
=20=20qt-demo-init-v1.1: support mouse support

Nicolas Ferre (1):
=20=20at91bootstrap: use 3.7.1 revision for all boards

=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D
Changelog for meta-beagleboard:

=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D
Changelog for meta-browser:

=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D
Changelog for meta-bug:

=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D
Changelog for meta-chicken:

Mario Domenech Goulart (52):
=20=20gen-egg-recipes: add CHICKEN major version to URI paths
=20=20Update all egg recipes' SRC_URI to point to the right path for =
CHICKEN 4
=20=20chicken-egg-awful-sql-de-lite: update to version 0.6.0
=20=20chicken-egg-awful: update to version 0.41.0
=20=20chicken-egg-clojurian: update to version 0.0.5
=20=20chicken-egg-comparse: update to version 0.1.0
=20=20chicken-egg-crypt: update to version 0.4.3
=20=20chicken-egg-html-parser: update to version 0.5.6
=20=20chicken-egg-html-utils: update to version 0.10
=20=20chicken-egg-http-client: update to version 0.7.1
=20=20chicken-egg-ini-file: update to version 0.3.4
=20=20chicken-egg-intarweb: update to version 1.3
=20=20chicken-egg-md5: update to version 3.1.0
=20=20chicken-egg-medea: update to version 0.1.5
=20=20chicken-egg-message-digest: update to version 3.1.0
=20=20chicken-egg-miscmacros: update to version 2.96
=20=20chicken-egg-numbers: update to version 3.1
=20=20chicken-egg-openssl: update to version 1.6.4
=20=20chicken-egg-pastiche: update to version 0.22
=20=20chicken-egg-scss: update to version 0.5.0
=20=20chicken-egg-sendfile: update to version 1.7.29
=20=20chicken-egg-server-test: update to version 0.5
=20=20chicken-egg-setup-helper: update to version 1.5.4
=20=20chicken-egg-siphash: update to version 0.0.3
=20=20chicken-egg-slice: update to version 1.2
=20=20chicken-egg-spiffy: update to version 5.3.1
=20=20chicken-egg-sql-de-lite: update to version 0.6.3
=20=20chicken-egg-srfi-99: update to version 1.4.2
=20=20chicken-egg-stty: update to version 0.2.5
=20=20chicken-egg-test: update to version 0.9.9.8
=20=20chicken-egg-uri-common: update to version 1.4
=20=20chicken-egg-uri-generic: update to version 2.41
=20=20chicken-egg-variable-item: update to version 1.3.1
=20=20chicken: use autotools-brokensep instead of autotools
=20=20chicken: use the class-cross override instead of virtclass-cross
=20=20chicken: fix build options
=20=20chicken_install.bbclass: use the class-cross override instead of =
virtclass-c
=20=20chicken-egg-protobj: add SRC_URI and sum hashes
=20=20chicken-egg-message-digest: add chicken-egg-message-digest-cross to =
DEPENDS
=20=20chicken-egg-easyffi: add chicken-egg-easyffi-cross to DEPENDS
=20=20Update egg recipes to use class-cross instead of virtclass-cross
=20=20gen-egg-recipes: add protobj
=20=20gen-egg-recipes: generate recipes using class-cross override
=20=20gen-egg-recipes: message-digest depends on its cross binaries
=20=20gen-egg-recipes: easyffi depends on its cross binaries
=20=20chicken-egg-utf8: add recipe for version 3.3.9
=20=20chicken-egg-iset: add recipe for version 1.9
=20=20gen-egg-recipes: add utf8 egg
=20=20scripts/gen-egg-list: add script to generate a list of all eggs
=20=20all-chicken-egg-recipes.inc: add file with a list of all available =
eggs
=20=20chicken-test-image: add image recipe which includes all eggs
=20=20chicken-test-image-sdk: add image with all available eggs plus =
development t

=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D
Changelog for meta-efikamx:

=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D
Changelog for meta-ettus:

=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D
Changelog for meta-fsl-arm:

Alexander Shashkevych (1):
=20=20udev-extraconf: allow all users to use gpu

Daiane Angolini (3):
=20=20linux-imx: Remove +yocto sufix from LOCALVERSION
=20=20u-boot-*: Rework LOCALVERSION depending on SRCBRANCH
=20=20linux-*: Rework LOCALVERSION depending on SRCBRANCH

Jacob Kroon (1):
=20=20linux-imx-rt: Upgrade to 3.10.17-1.0.2

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

Linus Walleij (1):
=20=20meta-handheld: h3600: support kernel v3.17

=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D
Changelog for meta-igep:

=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D
Changelog for meta-intel:

Ng, Wei Tee (1):
=20=20meta-valleyisland: Update linux-yocto v3.10.43 SRCREV to v3.10.59

=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D
Changelog for meta-ivi:

Andrei Gherzan (7):
=20=20README.md: Update dependencies to dizzy HEAD
=20=20README.md: Use TEMPLATECONF to ensure proper build configuration
=20=20linux-yocto: Use v3.14 for vexpressa9 and minor recipe cleanups
=20=20local.conf.sample: Sync file with poky
=20=20xkeyboard-config: Add temporary fix
=20=20audiomanager: Add node-state-manager
=20=20dlt-daemon: Update version to 2.11.1

Holger Behrens (9):
=20=20persistence-administrator: uprev to git tag 7.0 + patches
=20=20persistence-client-library: uprev to git tag 7.0 + patches
=20=20README.md: update poky (dizzy) reference sha
=20=20neard: added to baseline image
=20=20poky-ivi-systemd: prefer gstreamer 1.4.x over 1.2.3
=20=20gstreamer: add gstreamer1.0 recipes for version 1.2.3
=20=20poky-ivi-systemd: revert work around for bug #6930
=20=20persistence-common-object: uprev to git tag 7.0
=20=20linux-yocto: enable kernel feature to support NFC

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

Parthiban Nallathambi (1):
=20=20gstreamer1.0-plugins-bad: Making bbappend version independent

=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D
Changelog for meta-smartphone:

Martin Jansa (1):
=20=20Merge remote-tracking branch 'shr/shr'

Simon Busch (5):
=20=20meta-[asus,lg,samsung]: linux-[asus,lg,samsung]-[grouper,mako,tuna]: =
enable=20
=20=20meta-lg: android-system-image-mako: update to new version 20141112-76
=20=20meta-lg: linux-lg-mako: bump SRCREV
=20=20meta-hp: linux-hp-tenderloin: update to newer version
=20=20meta-hp: systemd-machine-units: include job to correctl activate =
existing SW

=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D
Changelog for meta-ti:

Denys Dmytriyenko (3):
=20=20linux-ti-staging: update to 3.14.25
=20=20linux-mainline: update to 3.14.25
=20=20u-boot-ti-staging: update 2014.07 with few fixes

=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D
Changelog for meta-webos:

=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D
Changelog for meta-xilinx:

Nathan Rossi (2):
=20=20device-tree.bb: Set package arch to machine arch
=20=20machine-xilinx-default.inc: Move UBOOT_SUFFIX definition

Philip Balister (5):
=20=20zc702-zynq7 : Update uEnv.txt devicetree filename to match updates.
=20=20zedboard : Add files to build working boot.bin file.
=20=20machine-xilinx-board.inc : Add definition of boot files for wic =
utility.
=20=20zedboard : Add files to support bootable image creation with wic.
=20=20zc702 : Add files to support bootable image creation with wic.

=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D
Changelog for meta-yocto:

Alexandru DAMIAN (1):
=20=20toaster: add toaster layer configuration files for meta-yocto

=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D
Changelog for openembedded:



