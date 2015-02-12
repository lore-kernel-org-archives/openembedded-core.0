Return-Path: <cliff.brake@gmail.com>
Received: from mail-ig0-f176.google.com (mail-ig0-f176.google.com
	[209.85.213.176])
	by mail.openembedded.org (Postfix) with ESMTP id F302E7066B;
	Thu, 12 Feb 2015 16:50:09 +0000 (UTC)
Received: by mail-ig0-f176.google.com with SMTP id hl2so4909912igb.3;
	Thu, 12 Feb 2015 08:50:11 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=date:mime-version:message-id:from:to:subject:content-type
	:content-transfer-encoding;
	bh=pAVq8Y4iweV2tchIgf45kyLHao0R171l++RTuEBOUN4=;
	b=xARYmxoMohxOt87TuWoyNM5ultCrP/NExMOXHcwDFebPXUhyzXxQVfe6gXBwjbBRXS
	GE8/xw81bpwkrcLImoxkQnIDJB73eRW1zhTczVIZ85ClFH14btf9cRl+ENcNyMTNgwaS
	Kufek+cqlGg7Rk0cbYf/XhxJ3ETPIyv4sm9jvuxnxlV5yoWFLdG+gOo1Tvf3FWwkDr6S
	Mh7lE2hAeRfwjzLrqm3rqGJTN4ezSsFfn3tG9p+LIGwPdDBPHdueBwTiC9Iw0ipfA4/d
	Yt8Lyg2m2MzJqkUTHGKPJ1MnEXuu9vy3gznb8x7TPPeCIVg7wgSutf9jArbWMWaGBoWD
	CViQ==
X-Received: by 10.50.107.7 with SMTP id gy7mr4913835igb.49.1423759810764;
	Thu, 12 Feb 2015 08:50:10 -0800 (PST)
Received: from [127.0.0.1] (cable2-pool191-cs-105.doycomm.com.
	[66.219.191.105])
	by mx.google.com with ESMTPSA id c6sm2707373ioe.37.2015.02.12.08.50.08
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
	Thu, 12 Feb 2015 08:50:09 -0800 (PST)
Date: Thu, 12 Feb 2015 08:50:09 -0800 (PST)
X-Google-Original-Date: Thu, 12 Feb 2015 16:50:07 GMT
MIME-Version: 1.0
X-Mailer: Nodemailer (0.3.22; +http://andris9.github.com/Nodemailer/)
Message-Id: <1423759807861.d88bf186@Nodemailer>
From: cliff.brake@gmail.com
To: openembedded-core@lists.openembedded.org,
	openembedded-devel@lists.openembedded.org,
	angstrom-distro-devel@linuxtogo.org, meta-ti@yoctoproject.org
Subject: OE Changelog since 2015-02-01 until 2015-02-08
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
X-List-Received-Date: Thu, 12 Feb 2015 16:50:13 -0000
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable

Changelog since 2015-02-01 until 2015-02-08.  Projects included in this =
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
=20=20toaster: proper setup for build configuration

Ross Burton (2):
=20=20tests/data: add test for incorrect remove behaviour
=20=20data_smart: split expanded removal values when handling _remove

=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D
Changelog for openembedded-core:

Alejandro Hernandez (3):
=20=20terminal.py: fixes launching multiple windows of gnome-terminal
=20=20xmlto-native: fixes slow creation of yocto docs
=20=20insane.bbclass: Added QA test for expanded ${D}

Alexandre Belloni (3):
=20=20wic: use kB for the partitions size
=20=20wic: print partition alignment when available
=20=20wic: bootimg-partition: Stop removing whole workdir

Alexandru DAMIAN (2):
=20=20scripts/oe-selftest: fix startup backtrace
=20=20scripts/oe-selftest: add command line option to list test classes

An=C3=ADbal Lim=C3=B3n (1):
=20=20files/toolchain-shar-template.sh: fix replace target_sdk_dir twice in =
enviro

Armin Kuster (3):
=20=20tzcode: update to 2015a leap second changes too
=20=20tzdata: update to 2015a including leap second
=20=20busybox: cve-2014-9645

Ash Charles (1):
=20=20busybox: Include 'mesg' utility

Bian Naimeng (1):
=20=20gnutls: update to 3.3.12

Bruce Ashfield (9):
=20=20kernel-dev: install all modules by default
=20=20linux-yocto/3.14: update to 3.14.29
=20=20linux-yocto/3.10: update to v3.10.65
=20=20linux-yocto/3.17: update to v3.17.8
=20=20linux-yocto: basic octeon III support
=20=20lttng: update to 2.6.0-stable
=20=20linux-yocto-dev: update to v3.19+
=20=20kern-tools: import patch performance improvements
=20=20linux-yocto/3.14: fix qemumips build error

Chen Qi (3):
=20=20runqemu-internal: get rid of annoying but harmless error message
=20=20package_manager.py: fix rootfs failure with multilib enabled
=20=20image.bbclass: don't let do_rootfs depend on BUILDNAME

Chunrong Guo (2):
=20=20uboot-config.bbclass: Allow multiple U-Boot config for machine
=20=20u-boot.inc : add compile multiple u-boot feature

Cristian Iorga (3):
=20=20build-appliance-image: update to head =
afe85485fe185b663a1285b5c27de3160bf06c
=20=20neard: upgrade to 0.15
=20=20flac: upgrade to 1.3.1

Dan McGregor (4):
=20=20image.bbclass: make kernel depmod data optional
=20=20openssh: configuration updates
=20=20openssh: Fix non-deterministic build behaviour
=20=20terminal.py: add tmux new window option

Jackie Huang (1):
=20=20lsbinitscripts: fix the path for mountpoint

Khem Raj (3):
=20=20pigz: Upgrade to 2.3.3
=20=20systemd: Backports fixes to 216
=20=20glibc: Re-enable upstream __USE_KERNEL_XATTR_DEFS patch

Maciej Borzecki (2):
=20=20wic: fix extended/logical partition layout
=20=20wic: bail out on kickstart parse errors

Martin Jansa (2):
=20=20xorg-driver: add x11 to required DISTRO_FEATURES
=20=20piglit: add x11 to required DISTRO_FEATURES

Michael Wood (1):
=20=20report-error: Catch un-readable log data

Nicolas Dechesne (1):
=20=20libdrm: upgrade to 2.4.59

Paul Barker (7):
=20=20opkg-arch-config: Renamed from opkg-config-base
=20=20opkg-collateral: Simplify source files
=20=20opkg: Merge opkg.inc into recipe and tidy up
=20=20opkg: Merge in opkg-collateral
=20=20poky-feed-config-opkg: Remove
=20=20opkg: Backport improvements to opkg-key
=20=20opkg-keyrings: New recipe

Paul Eggleton (10):
=20=20sed-native: drop
=20=20recipetool: replace version in S value
=20=20classes/image: drop unused default of MACHINE_POSTPROCESS_COMMAND
=20=20lib/oe/rootfs.py: rename _uninstall_uneeded to fix spelling error
=20=20classes/image: skip recipe on invalid IMAGE_FEATURES item
=20=20classes/image: ensure uninstalled packages do not appear in manifests
=20=20lib/oe/image.py: add error checking for missing IMAGE_CMD
=20=20classes/license: tweak license format messages
=20=20devtool: improve command-line help
=20=20recipetool: improve command-line help

Pengyu Ma (1):
=20=20mesa: Upgrade to 10.4.3

Richard Purdie (3):
=20=20libtool: 2.4.4 -> 2.4.5
=20=20build-appliance-image: Update to master head revision
=20=20libtool: Fix tools path issues

Robert Yang (33):
=20=20dpkg: add perl to RDEPENDS
=20=20screen: add PACKAGECONFIG for libutempter
=20=20perf: add LIBNUMA_DEFINES
=20=20cdrtools-native: fix HOMEPAGE and SRC_URI
=20=20base-passwd: fix SRC_URI
=20=20dosfstools: fix SRC_URI
=20=20cwautomacros: fix SRC_URI and HOMEPAGE
=20=20man: fix SRC_URI
=20=20pax: fix SRC_URI and HOMEPAGE
=20=20latencytop: fix SRC_URI and HOMEPAGE
=20=20pcmciautils: fix SRC_URI and HOMEPAGE
=20=20mingetty: fix SRC_URI
=20=20libtool: avoid running automake/autoconf --version
=20=20valgrind: depends on boost when ptest
=20=20gcc-configure-common.inc: remove ac_cv_path_SED
=20=20binconfig-disabled.bbclass: fix echo command
=20=20which 2.18: fix SRC_URI
=20=20matchbox-wm 1.2: remove it
=20=20matchbox-desktop: remove 0.9.1 and 2.0 version
=20=20xf86-video-intel 2.21.15: remove it
=20=20groff 1.18.1.4: fix HOMEPAGE and SRC_URI
=20=20findutils 4.2.31: fix SRC_URI
=20=20m4 1.4.9: fix unknown-configure-option
=20=20patch 2.5.9: fix unknown-configure-option
=20=20gzip 1.3.12: a few fixes
=20=20grep 2.5.1a: fix unknown-configure-option
=20=20tar 1.17: fix unknown-configure-option
=20=20rxvt-unicode: fix for 9.20 and 9.21
=20=20subversion 1.6.15: fix unknown-configure-option
=20=20elfutils 0.148: use BPN in SRC_URI
=20=20coreutils 6.9: disable native
=20=20bison 2.3: disable native
=20=20m4-native 1.4.9: remove it

Rodrigo Chiossi (1):
=20=20lib/oe/terminal: add support for Terminology terminal emulator

Ross Burton (5):
=20=20native: remove PN from DEPENDS automatically
=20=20wayland: remove explicit class-native DEPENDS
=20=20bitbake.conf: don't remove WARN_QA and ERROR_QA from hashes
=20=20insane: add unknown-configure-option to default WARN_QA
=20=20Revert "bitbake.conf: don't remove WARN_QA and ERROR_QA from hashes"

Saul Wold (8):
=20=20btrfs: create an empty file to build the fs in
=20=20glew: Upgrade to 1.12
=20=20nspr: Upgrade to 4.10.8
=20=20lsbinitscripts: Upgrade to 9.61
=20=20ca-certificates: Upgrade to 20141019 (git based)
=20=20create-pull-request: Fix git request-pull
=20=20core-image: split debug-tweaks into individual features
=20=20linux-yocto-tiny_3.17: Update to actually use 3.17 git repo

Sona Sarmadi (1):
=20=20python: Disables SSLv3

Timo Mueller (2):
=20=20apr: Allow use in SDK
=20=20apr-util: Allow use in SDK

=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D
Changelog for meta-openembedded:

=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D
Changelog for meta-angstrom:

=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D
Changelog for meta-arago:

Denys Dmytriyenko (2):
=20=20arago-feed-config, arago.conf: setup default (internal) binary IPK =
feeds
=20=20packagegroup-arago-base-tisdk: add arago-feed-config

Franklin S. Cooper Jr (6):
=20=20ti-tisdk-makefile: Allow the defconfig name to be customized
=20=20busybox: Add mpstat utility which is useful for multicore devices.
=20=20sourceipk: Make the # of revisions preserved from shallow clone a =
variable
=20=20sourceipk: Fix issue with git fetch when shallow clone is used
=20=20arago-source-ipk: Enable shallow clone for sitara-linux-ti-staging
=20=20sitara-linux-ti-staging: Simply package up the sources don't copy the =
defcon

Karthik Ramanan (1):
=20=20crda: Fix issue with upstream repository

Sam Nelson (7):
=20=20libnl: Adding recipe for 3.2.22 from oe-core
=20=20libnl: Update recipe from 3.2.22 to 3.2.24
=20=20busybox: Update default configuration of busybox
=20=20strongswan: Add append recipe for strongswan v5.1.1 to remove GPLV3 =
dependen
=20=20strongswan: Add pkcs11 plugin
=20=20arago-prefs: Update PREFERRED_VERSION of libnl for keystone
=20=20libnl-xfrm: Add recipe for libnl-xfrm

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

Alexandre Belloni (2):
=20=20imx-base: enable fsl-alsa-plugins conditionally
=20=20image_types_fsl.bbclass: fix typos

Chunrong Guo (6):
=20=20u-boot-ls1: Booting from SD card using u-boot-with-spl-pbl
=20=20ls1021aqds: add sdcard config
=20=20change-file-endianess: add recipe
=20=20rcw: Added change-file-endianess as DEPENDS
=20=20u-boot-ls1: Added change-file-endianess as DEPENDS
=20=20u-boot-ls1-tools-native: remove recipe

Dan McGregor (1):
=20=20xf86-video-imxfb-vivante: correct initscript package

Otavio Salvador (5):
=20=20weston: Performance optmizations for i.MX6 GAL2D renderer
=20=20fsl-eula-unpack.bbclass: Avoid warning about wrong 'S' being set
=20=20image_types_fsl.bbclass: Drop UBOOT_PADDING support
=20=20linux-fslc: Update to revision 483412c9
=20=20u-boot-imx (2009.08): Remove deprecated version

=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D
Changelog for meta-fsl-arm-extra:

Alex de Cabo (1):
=20=20linux-congatec: support for Q7 GPIOs

Fabio Estevam (1):
=20=20imx233-olinuxino: Remove 'alsa' from MACHINE_FEATURES

=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D
Changelog for meta-fsl-ppc:

Sona Sarmadi (8):
=20=20net-sctp: CVE-2014-0101
=20=20Kernel-HID/USB: multiple CVEs
=20=20kvm-iommu: CVE-2014-3601, CVE-2014-8369
=20=20net-sctp: CVE-2014-3673, CVE-2014-3687, CVE-2014-3688
=20=20kernel-auditsc: CVE-2014-3917
=20=20ALSA: CVE-2014-4652 CVE-2014-4653
=20=20sctp: CVE-2014-4667
=20=20sctp: CVE-2014-7841

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
Changelog for meta-kde:

=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D
Changelog for meta-micro:

=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D
Changelog for meta-mono:

Alex J Lennon (1):
=20=20monotools-server: Inherit pkgconfig to fix configure step failure =
with dizzy

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

Andrei Gherzan (14):
=20=20README: Introduce redmine
=20=20Merge "linux-raspberrypi: Change to Linux Yocto style kernel recipes"
=20=20Merge "linux-raspberrypi: Remove old v3.2.27"
=20=20README: Commit log issue tag
=20=20README: Fix redmine tag
=20=20Merge "devicetree: Add support for DT overlays with RPi bootloader"
=20=20raspberrypi.conf: Split in specific and common conf. files
=20=20xserver-xf86-config: Use SOC specific assignements
=20=20rpi-default-versions.inc: Use kernel v3.18 by default
=20=20linux-raspberrypi.inc: Remove machine specific CMDLINE definition
=20=20firmware: Update to HEAD
=20=20linux-raspberrypi.inc: Make KERNEL_DEFCONFIG machine specific
=20=20Use variable for kernel image deployed name on SD card
=20=20Add support for Raspberry PI 2

Francois Muller (2):
=20=20devicetree: Add minimal support with RPi bootloader
=20=20devicetree: Add support for DT overlays with RPi bootloader

Petter Mab=C3=A4cker (3):
=20=20Revert "linux-raspberrypi: Change to Linux Yocto style kernel recipes"
=20=20linux-raspberrypi: Update 3.12 branch to 3.12.36
=20=20README: add info about device tree support

=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D
Changelog for meta-smartphone:

=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D
Changelog for meta-ti:

Denys Dmytriyenko (2):
=20=20linux-ti-staging: update to 3.14.31, plus latest feature merges
=20=20u-boot-ti-staging: update with am57x/x15 and config fixes

Franklin S. Cooper Jr (2):
=20=20sitara-linux-ti-staging_3.14.bb: Update commit to pull in =
suspend/standby fi
=20=20Graphics SDK: Add 05.01.01.02

Karthik Ramanan (1):
=20=20dra7xx-evm: ubifs: Increase "max_leb_cnt"

Sam Nelson (2):
=20=20ti-softhsmv2: Add recipe for ti customised softhsm package
=20=20udma: Add recipe for user space library for udma kernel driver

=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D
Changelog for meta-webos:

=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D
Changelog for meta-xilinx:

=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D
Changelog for meta-yocto:

David Reyna (1):
=20=20toasterconf.json update

Randy Witt (1):
=20=20maintainers.inc: Update some items for Randy Witt.

Ross Burton (2):
=20=20poky.conf: remove poky-feed-config-opkg from images
=20=20poky.conf: use logic to edit WARN_QA and ERROR_QA

Tom Zanussi (2):
=20=20yocto-bsp: Add missing conf dir to arm template
=20=20yocto-bsp: Add branch to SRC_URI for custom kernels

=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D
Changelog for openembedded:



