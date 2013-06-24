Return-Path: <cliff.brake@gmail.com>
Received: from bec-systems.com (new.bec-systems.com [74.208.70.121])
	by mail.openembedded.org (Postfix) with ESMTP id 83263600FA;
	Mon, 24 Jun 2013 20:18:22 +0000 (UTC)
Received: from oh-67-76-203-50.sta.embarqhsd.net ([67.76.203.50]
	helo=happy.bec-systems.com)
	by bec-systems.com with esmtpsa (TLS1.0:DHE_RSA_AES_256_CBC_SHA1:32)
	(Exim 4.71) (envelope-from <cliff.brake@gmail.com>)
	id 1UrD9S-0002mW-8Y; Mon, 24 Jun 2013 16:14:23 -0400
MIME-Version: 1.0
X-Mailer: Nodemailer (0.3.22; +http://andris9.github.com/Nodemailer/)
Date: Mon, 24 Jun 2013 20:18:00 GMT
Message-Id: <1372105080854.438abbe6@Nodemailer>
From: cliff.brake@gmail.com
To: openembedded-core@lists.openembedded.org,
	openembedded-devel@lists.openembedded.org,
	angstrom-distro-devel@linuxtogo.org, meta-ti@yoctoproject.org
X-Spam_score: -0.2
X-Spam_score_int: -1
X-Spam_bar: /
Subject: OE Changelog since 2013-06-16 until 2013-06-23
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
X-List-Received-Date: Mon, 24 Jun 2013 20:18:23 -0000
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable

Changelog since 2013-06-16 until 2013-06-23.  Projects included in this =
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

Alexandru DAMIAN (3):
=20=20knotty, xmlrpc: add observer-only mode
=20=20knotty, bitbake: add option to terminate a remote server
=20=20bitbake: read BBSERVER environement for remote server

Cristiana Voicu (7):
=20=20hob: remove the rest of the old template functionality
=20=20bitbake & hob: modify some commands and call them from hob
=20=20hob: check if imageconfiguration page has the attribute 'warnings_bar'
=20=20bitbake: remove the function for reparse because it does nothing
=20=20bitbake: call the initConfiguration when reparsing
=20=20hob: replace the init cooker with reset in order to keep the history
=20=20hob: save variables in conf/ directory

Peter Kjellerstedt (2):
=20=20Allow checksums to be used for files retrieved using SFTP
=20=20Correct a typo

Richard Purdie (6):
=20=20runqueue/build: Add recideptask flag
=20=20fetch2: Enhance error message for BB_NO_NETWORK
=20=20build.py: Cleanup data store references
=20=20cooker: Ensure configuration matches variable tracking state
=20=20data_smart: Ensure variable flags are accounted for in config data =
hash
=20=20data_smart: Fix bug with overrides and weak default values

=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D
Changelog for openembedded-core:

Bruce Ashfield (1):
=20=20linux-yocto/3.8: fix gcc 4.8 ARM boot issues

Diego Rondini (1):
=20=20licences: Add SGI license

Hongxu Jia (2):
=20=20systemd-udevd: fix invoking init script failed
=20=20wget: Add missing DEPENDS on zlib

Jackie Huang (1):
=20=20libcap: do not pass CFLAGS to gcc

Jesse Zhang (3):
=20=20local.conf.sample: use ?=3D to assign BB_ENV_EXTRAWHITE variables
=20=20alsa-lib: Change function type to "static __inline__"
=20=20alsa-lib: check if wordexp is supported in libc

Jonathan Liu (1):
=20=20qt4: add eglibc-gconv-utf-16 to QtCore RRECOMMENDS when using glibc

Kai Kang (5):
=20=20autogen-native: fix build failure on overloaded hosts
=20=20tcl: remove hardcoded library install path
=20=20tcl: fix unit test boundary year issue
=20=20strace: update to 4.8
=20=20strace: add configure options libaio and acl

Kevin Strasser (3):
=20=20dhcp: drop fixincludes.patch
=20=20dhcp: drop noattrmode.patch
=20=20archiver.bbclass: check if package contains a copyleft license

Khem Raj (1):
=20=20webkit-gtk: Support build on mips64

Laurentiu Palcu (2):
=20=20distrodata.bbclass: fix syntax errors
=20=20qemu: fix segfault in Xorg when not using kvm

Martin Jansa (1):
=20=20gcc-4.8: Backport fix for ICE triggered in pixman

Muhammad Shakeel (1):
=20=20openssl: Add fix for cipher des-ede3-cfb1

Paul Barker (2):
=20=20opkg: fix header installation for libopkg
=20=20opkg: put libopkg header files into libopkg-dev

Paul Eggleton (4):
=20=20classes/externalsrc: enable global inherit and simplify usage
=20=20pseudo: drop version 1.4.5 recipe
=20=20classes/package_tar: fix file ownership within tarballs
=20=20classes/buildhistory: fix error when no packages are installed

Richard Purdie (10):
=20=20oe-buildenv-internal: Fix exit verses return
=20=20dbus-wait: Upgrade to fix typo
=20=20site.conf.sample: Update git proxy instructions
=20=20utils.bbclass: Tweak create_wrapper
=20=20python: Add nativesdk wrapper to handle terminfo
=20=20oe-buildenv-internal: Ensure error messages got to stderr
=20=20bdwgc-native: Add missing pkgconfig DEPENDS
=20=20utility-tasks/distrodata: Add recideptask flag for =
fetchall/checkuriall
=20=20base.bbclass: Ensure finalised data is displayed in build banner
=20=20psplash: Bump PR to allow removal of PRINC from meta-yocto

Ross Burton (14):
=20=20at-spi2: add -core and -atk, for GTK+ 3.8
=20=20gtk+3: update to 3.8.2
=20=20gtk+3: explicitly disable introspection
=20=20gtk+3: respect x11 and wayland DISTRO_FEATURES
=20=20gtk+3: add dependencies for gtk+3-demo
=20=20gtk+: remove spurious libgcrypt dependency
=20=20gtk+3: register GSetting schemas
=20=20gtk+3: split into .bb/.inc
=20=20gtk+3: clean up libtool link creation to avoid errors in configure log
=20=20gtk+3: fix repainting under Weston 1.1
=20=20atk: inherit gnomebase
=20=20matchbox-panel: bump SRCREV for linkage fixes
=20=20sato-screenshot: bump SRCREV for linkage fixes
=20=20core-image-weston: add weston-examples to the image

Roy.Li (4):
=20=20bind: backport six CVE patches
=20=20openssh: fix a unaligned memory access issue
=20=20openssh: obey 'tcp-wrappers' PACKAGECONFIG
=20=20directfb:filter out -fno-omit-frame-pointer option on x86 arch

Wenzong Fan (2):
=20=20procps: fix that top will quit after cpu offline
=20=20libpam: Fix for CVE-2010-4708

=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D
Changelog for meta-openembedded:

Andrea Adami (9):
=20=20initramfs-kexecboot(-klibc)-image: provide SUMMARY and DESCRIPTION
=20=20kexecboot_cfg: add SUMMARY and extend DESCRIPTION
=20=20kexecboot(-klibc): add SUMMARY, DESCRIPTION, HOMEPAGE
=20=20ubi-utils-klibc: add SUMMARY and DESCRIPTION
=20=20kexec-tools-klibc: add custom SUMMARY
=20=20linux-yocto-tiny-kexecboot: add custom SUMMARY
=20=20klibc(-static)-utils: add SUMMARY
=20=20klcc-cross: add SUMMARY
=20=20klibc: add SUMMARY

Andreas M=C3=BCller (20):
=20=20midori: update to 0.5.2
=20=20tumbler: add curl to dependencies to make build deterministic
=20=20tumbler: update to 0.1.29
=20=20poppler: update to 0.22.4
=20=20xfce4-xkb-plugin: update to 0.7.0 tarball
=20=20atkmm: add glibmm to DEPENDS
=20=20p11-kit: initial add 0.19.1
=20=20gcr: initial add 3.8.2
=20=20mozjs: initial add 17.0.0
=20=20polkit: update to 0.111
=20=20networkmanager: rework dependencies/configure-option and use =
PACKAGECONFIG
=20=20networkmanager: replace absolute paths
=20=20polkit-group-rule.inc: add a common template for =
polkit-rules/user-groups
=20=20polkit-group-rule-network: initial add
=20=20polkit-group-rule-datetime: initial add
=20=20lxdm: remove consolekit dependencies in systemd environment and fix =
build
=20=20xfce4-power-manager: rework polkit/consolekit selection and implement =
polkit
=20=20xarchiver: update to 0.5.3 for various bugfixes
=20=20xfwm4: don't turn into unusablity after setting system time backwards
=20=20xfce4-genmon-plugin: Allow timer period to be set at 250ms resolution

Christopher Larson (1):
=20=20gnome-disk-utility: use PACKAGECONFIG for nautilus extension

Fahad Usman (1):
=20=20libmtp: add new recipe

Felipe F. Tonello (1):
=20=20connman: updated libconnman-qt to 1.0.7

Jonathan Liu (6):
=20=20cyrus-sasl: move plugin *.so symbolic links to cyrus-sasl package
=20=20xserver-nodm-init: do not execute Xsession twice
=20=20llvm3.2: replace LLVM_RELEASE with PV
=20=20llvm-common: move cross script install to sysroot preprocess function
=20=20llvm: move cross script install to separate sysroot preprocess =
function
=20=20llvm3.3: new recipe

Khem Raj (7):
=20=20gnome-keyring: Fix build error due to missing asn1 prototypes
=20=20gnome-session: Fix build on 64bit targets
=20=20gypsy: Fix build with newer glib
=20=20libunwind: Fix build on arm < v6
=20=20packagekit: Fix build with new glib-2.0
=20=20omgps: Fix build with glib-2.0 > 2.35
=20=20tk: Upgrade to 8.6.0

Lukas M=C3=A4rdian (1):
=20=20pidgin: fix build on CentOS 6

Marko Lindqvist (1):
=20=20libungif: add native build

Martin Jansa (3):
=20=20nodejs: upgrade to 0.10.4
=20=20Revert "nodejs: upgrade to 0.10.4"
=20=20packagekit: Fix build with new glib-2.0, v2

Paul Barker (1):
=20=20ipsec-tools: update Upstream-Status for patch

Randy MacLeod (1):
=20=20nostromo: make SRC_URI work for multilib builds.

Roy.Li (2):
=20=20arptables: fix the redefinition of 'arpt_get_target' error
=20=20autofs: two fixes

=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D
Changelog for meta-angstrom:

=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D
Changelog for meta-arago:

Franklin S. Cooper Jr (4):
=20=20matrix-gui: Add commit that pulls in HTML Matrix application support
=20=20matrix-gui-apps-git: Use new HTML based Clock Frequency demo
=20=20matrix-gui-clocks: Tweak to support new HTML demo
=20=20packagegroup-arago-tisdk-matrix: Remove unneeded =
matrix-gui-clocks-<frequenc

=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D
Changelog for meta-beagleboard:

Khem Raj (1):
=20=20linux-mainline-3.8: Fix random segfaults and boot issues seen with =
gcc-4.8

Koen Kooi (8):
=20=20Merge pull request #5 from kraj/master
=20=20contrib: bone-flash-tool: verify some files after flashing
=20=20contrib: bone-flash-tool: mount VFAT partition in sync mode
=20=20bone101: update to latest git
=20=20bonescript: update to latest git
=20=20bonescript: fix do_install
=20=20contrib: bone-flash-tool: check bootloader integrity
=20=20u-boot-denx: work around EEPROMs filled with zeroes

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

Daiane Angolini (2):
=20=20gst-fsl-plugin: Add virtual/kernel to DEPENDS
=20=20imx-test: Fix the compile command

Eric BENARD (3):
=20=20amd-gpu-x11-bin-mx51: only enable when x11 is in DISTRO_FEATURES
=20=20amd-gpu-x11-bin-mx51: factorize the recipes
=20=20amd-gpu-bin-mx51: new recipe

=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D
Changelog for meta-fsl-arm-extra:

Jeremy Stashluk (1):
=20=20linux-boundary: freescale 4.0.0 BSP release

SARTRE Leo (2):
=20=20u-boot-imx: update Congatec qmx6 support to bsp 4.0
=20=20linux-imx-3.0.35: update Congatec qmx6 support to bsp 4.0

=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D
Changelog for meta-fsl-ppc:

Vakul Garg (1):
=20=20usdpaa: Added fmc in usdpaa dependency list.

Zongchun Yu (2):
=20=20usdpaa: export ARCH for all tasks
=20=20cryptodev: compile testprogs and package them to ${PN}-tests

=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D
Changelog for meta-guacamayo:

=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D
Changelog for meta-gumstix:

=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D
Changelog for meta-gumstix-community:

=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D
Changelog for meta-handheld:

Andrea Adami (1):
=20=20palmtt2.conf: remove, device support is present in palmtt.conf

=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D
Changelog for meta-igep:

=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D
Changelog for meta-intel:

Laurentiu Palcu (1):
=20=20libva-intel-driver: upgrade to 1.0.20

Nitin A Kamble (6):
=20=20chiefriver: update 3.4 kernel SRCREVs
=20=20crownbay: update 3.4 kernel SRCREVs
=20=20emenlow: update 3.4 kernel SRCREVs
=20=20jasperforest: update 3.4 kernel SRCREVs
=20=20nuc: update 3.4 kernel SRCREVs
=20=20sugarbay: update 3.4 kernel SRCREVs

=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D
Changelog for meta-ivi:

Florin Sarbu (2):
=20=20ecryptfs-utils: Add --sbindir=3D/sbin to configure options
=20=20dlt-daemon: Fix recompiling failure when a dependency     of =
dlt-daemon chan

Noor (3):
=20=20dlt-daemon: Fix multiple issues with service files.
=20=20dlt-daemon: Add zlib in DEPENDS.
=20=20ecryptfs-utils: Modify systemd service file to 'simple'.

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

Khem Raj (5):
=20=20apex: Add recipe for latest from git
=20=20ixp4xx-npe: Fix SRC_URI checksums
=20=20apex-nslu2-16mb_1.5.14.bb: Fix LICENSE field
=20=20linux-ixp4xx: Fix SRC_URI to match mirrors
=20=20apex,npe: Keep the sysroot_stage_all functions

=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D
Changelog for meta-opie:

=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D
Changelog for meta-qt3:

=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D
Changelog for meta-qt5:

Nicolas Dechesne (1):
=20=20qtbase: typo about virtual/egl depends

=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D
Changelog for meta-slugos:

Khem Raj (6):
=20=20initscripts: Sync wth OE-core
=20=20slugos: Fix mirrors to point to OE mirrors
=20=20slugos: Remove pinning for eglibc/uclibc and stop carrying =
arm-thumb.inc
=20=20busybox: Move bbappend to match OE-Core
=20=20udev: Make postinstall use PN override
=20=20tasks/packagegroups: Rename tasks dir to packagegroup

=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D
Changelog for meta-systemd:

=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D
Changelog for meta-raspberrypi:

Andrei Gherzan (1):
=20=20rpi-default-providers.inc: Remove preferred provider to linux headers

Paul Barker (1):
=20=20rpi-gpio: renamed from RPi-GPIO

Richard Purdie (2):
=20=20linux-libc-headers-raspberrypi: Drop, its unneeded and bad practise
=20=20linux-raspberrypi: Fix i2c issues

=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D
Changelog for meta-smartphone:

=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D
Changelog for meta-ti:

Denys Dmytriyenko (4):
=20=20libgles-omap3: don't RCONFLICT/RREPLACE no-x version with x11 as it =
breaks n
=20=20libgles-omap3-x11: add missing X11 version of the recipe, after it =
got split
=20=20omap3-sgx-modules: remove unnecessary patches for x11, cleanup old =
patch
=20=20init-ifupdown: move interfaces file from netbase to new init-ifupdown

Prabindh Sundareson (9):
=20=20libgles-omap3: Remove X11 related build and packaging
=20=20omap3-sgx-modules: Remove X11 related build and packaging
=20=20libgles-omap3: Remove unsupported core build option ES2.0
=20=20libgles-omap3: Remove OpenVG references
=20=20libgles-omap3: Remove copying of unused header files
=20=20libgles-omap3: Add missing RPROVIDES
=20=20libgles-omap3: Package files with right permission
=20=20libgles-omap3-x11: Separate X11 SGX driver package into new recipe
=20=20omap3-sgx-modules-x11: Separate X11 SGX driver package into new recipe

=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D
Changelog for meta-webos:

Hongjeon Ha (1):
=20=20webos-image: pmloglib=3D30, pmlogdaemon=3D105

Janne Hurskainen (1):
=20=20webos-image: nyx-modules=3D89

Keith Derrick (1):
=20=20webos-image: libpbnjson=3D13

Mark Bessey (1):
=20=20webos-image: nodejs-module-webos-pmloglib=3D13,v3.0.0

Martin Jansa (1):
=20=20packagegroups: Move bootchart, return babeltrace and latencytop

Roger Stringer (1):
=20=20meta-webos:  DB8=3D72

=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D
Changelog for meta-xilinx:

Nathan Rossi (6):
=20=20util-linux: Update to match oe-core version
=20=20linux-xlnx: Create base Zynq-7 DTSI definition
=20=20linux-xlnx: Add the zynq-7-base.dtsi to SRC_URI
=20=20linux-xlnx: Updated qemuzynq.dts to use dtsi fragment
=20=20meta-zc702: linux-xlnx: Added DTS file
=20=20meta-zedboard: linux-xlnx: Refactored device tree

=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D
Changelog for meta-yocto:

Richard Purdie (2):
=20=20yocto-bsp: Drop PRINC usage
=20=20psplash: Drop PRINC from bbappend

=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D
Changelog for openembedded:



