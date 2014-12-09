Return-Path: <cliff.brake@gmail.com>
Received: from mail-ig0-f180.google.com (mail-ig0-f180.google.com
	[209.85.213.180])
	by mail.openembedded.org (Postfix) with ESMTP id 9CFF572519;
	Tue,  9 Dec 2014 14:19:39 +0000 (UTC)
Received: by mail-ig0-f180.google.com with SMTP id h15so979067igd.7
	for <multiple recipients>; Tue, 09 Dec 2014 06:19:40 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=date:mime-version:message-id:from:to:subject:content-type
	:content-transfer-encoding;
	bh=1wp+D2x83wbO/OnlMNgWw78v97fuOY2L88ynOahdqlk=;
	b=AkT9W6q1+KJ/VbrMs04HcJQLKFOx8oWAtNpGLOMh66YwGwsKOkHZ8KFeVpbuqlsxGj
	GjqCv4Ev4rmAaWo7TVQ41TXvF5Z/p9jeoylrFuatQlgGpXbGrkvTOEJBrDc3eEDLDnjx
	NiOQS6HmrvuPRGl3F/bQv48+CnwG4xct1lHIGmc64CiZL8QZDbtST5ucg+Vbr0ZAWsn+
	ctKEl4CSxKU2vqVpPNFaCbNLEnFesRyKst4eGhYq0BYwitE4wS2pNREh4WYLZToFTcxx
	mQj3S73oa6KqyMwEaccQa0BGtlomtf7WbAKe3rJ500usjdR6Fpw0F4fNSvWbnrhWJx7b
	2Frw==
X-Received: by 10.107.9.213 with SMTP id 82mr11749503ioj.45.1418134780141;
	Tue, 09 Dec 2014 06:19:40 -0800 (PST)
Received: from [127.0.0.1] (cable2-pool191-cs-105.doycomm.com.
	[66.219.191.105])
	by mx.google.com with ESMTPSA id jg3sm5515121igb.12.2014.12.09.06.19.38
	for <multiple recipients>
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
	Tue, 09 Dec 2014 06:19:39 -0800 (PST)
Date: Tue, 09 Dec 2014 06:19:39 -0800 (PST)
X-Google-Original-Date: Tue, 09 Dec 2014 14:19:38 GMT
MIME-Version: 1.0
X-Mailer: Nodemailer (0.3.22; +http://andris9.github.com/Nodemailer/)
Message-Id: <1418134778037.652312d4@Nodemailer>
From: cliff.brake@gmail.com
To: openembedded-core@lists.openembedded.org,
	openembedded-devel@lists.openembedded.org,
	angstrom-distro-devel@linuxtogo.org, meta-ti@yoctoproject.org
Subject: OE Changelog since 2014-11-30 until 2014-12-07
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
X-List-Received-Date: Tue, 09 Dec 2014 14:19:45 -0000
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable

Changelog since 2014-11-30 until 2014-12-07.  Projects included in this =
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

Richard Purdie (1):
=20=20bitbake: Update to 1.25.0 as development version after release

Ross Burton (1):
=20=20data: rename defaultval to _defaultval

=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D
Changelog for openembedded-core:

An=C3=ADbal Lim=C3=B3n (1):
=20=20libdrm: Upgrade to 2.4.58.

Chen Qi (3):
=20=20libxslt: create wrapper to avoid host system referencing
=20=20systemd: add PACKAGECONFIG for 'manpages'
=20=20bootchart2: fix to find collector correctly in case of multilib

Chong Lu (5):
=20=20dbus: Upgrade to 1.8.10
=20=20dbus-test: Upgrade to 1.8.10
=20=20dbus-glib: Upgrade to 0.102
=20=20connman-gnome: fix dbus interface name
=20=20gnutls: disable tpm

Cody P Schafer (1):
=20=20cmake: supply CMAKE_AR in toolchain file

Drew Moseley (2):
=20=20glew: Additional fix for generation of glew.pc.
=20=20mesa-demos: Move util to the front of the SUBDIRS variable.

Enrico Scholz (1):
=20=20serf: fix 'ccache' builds

Ezra Savard (1):
=20=20powertop: update version number from 2.6.1 to 2.7

Hongxu Jia (6):
=20=20cracklib: upgrade to 2.9.2
=20=20libnewt/libnewt-python: upgrade to 0.52.18
=20=20compress_doc.bbclass: improve manual file detection
=20=20compress_doc.bbclass: support update-alternatives
=20=20package_manager.py: check the result of create_index
=20=20Revert "busybox : fix do_compile failed on qemumips when DEBUG_BUILD =
(ICE)"

Jackie Huang (4):
=20=20Revert "qt4*.bbclass: disable build qt on mips64 with 64 bits =
userspace"
=20=20qt4: disable webkit for mips64 n32 temporarily
=20=20util-linux: add switch_root to alternatives list
=20=20gzip: fix MakeMaker issues with using wrong SHELL/GREP

Jean-Michel Hautbois (1):
=20=20gstreamer1.0-plugins-bad.inc: Disable cocoa on configure

Jian Liu (3):
=20=20base-files: avoid overwritting editable files during package updating
=20=20initscripts: avoid overwritting editable files during package updating
=20=20libpam: avoid overwritting editable files during package updating

Juro Bystricky (1):
=20=20eglibc: modified option-groups.h generation

Khem Raj (1):
=20=20package.bbclass: Create empty key/value if not there for =
shlib_provider

Koen Kooi (1):
=20=20tcmode-default.inc: use GCCVERSION for gcc-source

Laszlo Papp (1):
=20=20toolchain-script: Add support for ccache builds with the SDK

Merten Sach (1):
=20=20metadata_scm: Fix crash due to uncaught python exception

Michael Jones (2):
=20=20image.bbclass: remove comment that readonly only works for sysvinit
=20=20image.bbclass: whitespace

Paul Eggleton (1):
=20=20kernel-yocto.bbclass: fix shell syntax error

Richard Purdie (3):
=20=20sanity.conf: Update to require bitbake 1.25.0 as minimum version
=20=20gcc: Rework shared work
=20=20qemu/libc-package: Fix qemu option handling

Ross Burton (20):
=20=20base.bbclass: don't skip defaultval
=20=20uboot-config.bbclass: don't skip defaultval
=20=20scripts: don't skip defaultval
=20=20bitbake.conf: remove internal flags from BB_SIGNATURE_EXCLUDE_FLAGS
=20=20bash: use EXTRA_AUTORECONF to disable autoheader
=20=20attr: use EXTRA_AUTORECONF to disable autoheader
=20=20gdb: disable Guile
=20=20python: ensure all of Python is installed in nativesdk
=20=20python: remove spurious nativesdk dependency
=20=20dbus: don't use PTEST_ENABLED as recipe doesn't inherit ptest
=20=20weston: fix plugin location in FILES
=20=20package_manager.py: fix arguments to string format
=20=20base.bbclass: fix CLEANBROKEN logic
=20=20autotools.bbclass: respect CLEANBROKEN
=20=20gnome-doc-utils: set CLEANBROKEN
=20=20cwautomacros: stub do_configure to avoid cleaning
=20=20gcc: stub do_fetch instead of removing it
=20=20default-distrovars: add gcc-source recipe to the GPLv3 whitelist
=20=20bzip2: use subdir SRC_URI param instead of adding tasks
=20=20libnewt: set CLEANBROKEN

Saul Wold (8):
=20=20curl: Ugrade to 7.38
=20=20babeltrace: Upgrade to 1.2.3
=20=20npth: Upgrade to 1.1
=20=20boost: Upgrade to 1.57
=20=20pseudo: remove older version and patches
=20=20resolvconf: add fixes for busybox and make it work
=20=20valgrind: Upgrade to 3.10.0
=20=20lzo: add debian patch for alignment issue

Wenzong Fan (1):
=20=20coreutils-native: don't install groups

Zheng Junling (1):
=20=20openssh: fix using the original config files in srcdir

=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D
Changelog for meta-openembedded:

Armin Kuster (4):
=20=20netkit-ftp: new recipe
=20=20netkit-rusers: new package
=20=20netkit-rpc: New package
=20=20MAINTAINERS: add self for recipes-netkit

Joe MacDonald (2):
=20=20Revert "open-iscsi: add recipe"
=20=20ufw: Uncomplicated Firewall recipe

Li xin (1):
=20=20open-iscsi: add recipe

MiLo (1):
=20=20netkit-rwho: New package

Wenzong Fan (1):
=20=20sethdlc: fix host contamination

=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D
Changelog for meta-angstrom:

=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D
Changelog for meta-arago:

Denys Dmytriyenko (1):
=20=20packagegroup-arago-test: re-enable am57xx test packages

Karthik Ramanan (3):
=20=20gst-plugins-base: Updated SRCREV to include bug fixes
=20=20gst-plugins-good: dmabuf support for v4l2src
=20=20gst-plugins-bad: Ability to move Waylandsink window

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

Alexander Shashkevich (1):
=20=20udev-extraconf: deleting bbappend recipe

Alexander Shashkevych (2):
=20=20udev-extraconf: restrict access to graphic buffers
=20=20udev-extraconf: replace bbappend with own recipe

Daiane Angolini (1):
=20=20imx-base: Add comment on how to enable SFP

Gary Bisson (1):
=20=20linux-imx: add clock patch for revision T0 1.0 of i.MX6Q

Javier Viguera (1):
=20=20amd-gpu-mx51: fix file ownership in packages

Neena Busireddy (2):
=20=20directfb: Backport to 1.7.1
=20=20directfb: Use include file from poky

Otavio Salvador (2):
=20=20gpu-viv-g2d: Remove old 3.10.17-1.0.2 recipe
=20=20image_types_fsl.bbclass: Use 69K as offset to load image

Samuli Piippo (1):
=20=20gpu-viv-bin-mx6q: move HAL headers to libgal-mx6-dev

=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D
Changelog for meta-fsl-arm-extra:

Alex de Cabo (2):
=20=20linux-congatec: Upgrade to cgt_imx_3.10.31_1.1.0_beta2
=20=20u-boot-congatec: Change environment mmcroot variable

Ian Coolidge (1):
=20=20linux-boundary (3.10.31): Bump SRCREV to b76cf1c

Otavio Salvador (1):
=20=20u-boot-cubox-i: Fix SD offset to align with mainline value

=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D
Changelog for meta-fsl-ppc:

Bob Cochran (3):
=20=20linux-qoriq: Remove Altivec from T1040 64-bit defconfig
=20=20linux-qoriq: Configure T1040 for FMAN V3
=20=20linux-qoriq: change defconfig for T1040 to match number of cpus

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

Andrei Gherzan (2):
=20=20ivi-image: Replace base-passwd bbappend by extrausers usage
=20=20MAINTAINERS: Remove '>' chars so users can copy paste commands

Florin Sarbu (18):
=20=20dbus-c++: Add this recipe as it is needed by positioning
=20=20qtbase: Enable accessibility
=20=20positioning: Add initial recipe for this package
=20=20navit: Add recipe along with wayland ilm support patch
=20=20gypsy: change dependency to bluez5 instead of bluez4
=20=20navigation-service: Add initial recipe
=20=20navigation-application: Add initial recipe
=20=20automotive-message-broker: Add newer version
=20=20Added the packagegroup for FSA PoC
=20=20navigation-application: Add pregenerated files
=20=20positioning: Remove obsolete recipe
=20=20navit: Add xml for the switzerland map file
=20=20alsa-state: Add the alsa-state file on a per machine basis
=20=20README.md: Update with branches for QEMU build and navit map info.
=20=20navit: Add the map .xml to main package.
=20=20README.md: Update with info on qemu audio and new poky revision
=20=20navigation-application: Pass qt moc from build system
=20=20Add recipe for the positioning package

Holger Behrens (3):
=20=20navit: fix compilation error
=20=20qtsystems: do not depend on bluez4
=20=20populate_sdk_qt5.bbclass: change create_sdk_files from _prepend to =
_append

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

Anders Darander (1):
=20=20qmake5: set OE_QMAKE_INCDIR_QT

=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D
Changelog for meta-slugos:

=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D
Changelog for meta-systemd:

=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D
Changelog for meta-raspberrypi:

=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D
Changelog for meta-smartphone:

Martin Jansa (1):

Simon Busch (7):
=20=20meta-android: udev-extraconf: add rules for memory and rfkill devices
=20=20meta-lg: udev-extraconf: add rules for additional devices node on mako
=20=20meta-lg: mako: switch to android-headers instead of phablet-headers
=20=20meta-android: android-system: share network namespace with host
=20=20meta-lg: conf: mako: explicitly require android-headers 4.4.3
=20=20meta-android: base-passwd: switch IDs of groups shared with android
=20=20meta-android: android-system: drop unused android-chroot script

=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D
Changelog for meta-ti:

=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D
Changelog for meta-webos:

=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D
Changelog for meta-xilinx:

Nathan Rossi (7):
=20=20machine-xilinx-default.inc: Remove ext2* from default IMAGE_FSTYPES
=20=20Documentation Updates
=20=20microblaze: Add USE_VT=3D"" to microblaze machine configs
=20=20linux/configs: Update config fragments
=20=20linux/config/xilinx-base: Refactor standard.cfg
=20=20microblaze/feature-microblaze-endian.inc: Fix MBPKGENDIAN
=20=20boards/*microblaze*: Override udev max-children

=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D
Changelog for meta-yocto:

Chong Lu (1):
=20=20upstream_tracking.inc: update entries for dbus

Lucian Musat (1):
=20=20meta-yocto/distro: Updated SANITY_TESTED_DISTROS.

Tom Zanussi (2):
=20=20yocto-bsp: Update templates to 3.17 kernel
=20=20yocto-bsp: Add mips64 support

=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D
Changelog for openembedded:



