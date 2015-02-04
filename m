Return-Path: <cliff.brake@gmail.com>
Received: from mail-ie0-f182.google.com (mail-ie0-f182.google.com
	[209.85.223.182])
	by mail.openembedded.org (Postfix) with ESMTP id 874B160017;
	Wed,  4 Feb 2015 15:38:46 +0000 (UTC)
Received: by mail-ie0-f182.google.com with SMTP id ar1so2802482iec.13;
	Wed, 04 Feb 2015 07:38:47 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=date:mime-version:message-id:from:to:subject:content-type
	:content-transfer-encoding;
	bh=o6rF04JPqUtSzPrK635caLt1a4t7f5urNEEUhYeG1ZQ=;
	b=S/2BRZVLtzygh8JBrYyqjvix/uRJgQnM5QmI4Tx9zbd9zEEx8M3VQk+mGE/u1wTDw7
	xTk/i3H6gHAs1hdvA4A2bIHzncBCrC+/+eRQXXbv1y5UwOxEZnn36RPJmghCPcSWX7lG
	LMbS4MxMQjC0PXbVltkv0xxf9cbN9DpXLSxVo79JQSXbSJSR2lmtN8oE5qc/QP255Tkk
	/ChvyHdIsEdRyGFwc62wPjVb15w50e0nLS8JWjr3DpGSmfyq3xkKrpc5ZCSahbWvuFQJ
	mslWV6LqPA3C1Gdar6jfjXeeSzxd8RIT3k8QDjovOudZ9l5Eu87yIlTfVVtETznbsJ0S
	H/Yw==
X-Received: by 10.50.13.97 with SMTP id g1mr24491463igc.42.1423064327730;
	Wed, 04 Feb 2015 07:38:47 -0800 (PST)
Received: from [127.0.0.1] (cable2-pool191-cs-105.doycomm.com.
	[66.219.191.105])
	by mx.google.com with ESMTPSA id q7sm9717651igx.9.2015.02.04.07.38.45
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
	Wed, 04 Feb 2015 07:38:46 -0800 (PST)
Date: Wed, 04 Feb 2015 07:38:46 -0800 (PST)
X-Google-Original-Date: Wed, 04 Feb 2015 15:38:45 GMT
MIME-Version: 1.0
X-Mailer: Nodemailer (0.3.22; +http://andris9.github.com/Nodemailer/)
Message-Id: <1423064325148.aa0f3bc8@Nodemailer>
From: cliff.brake@gmail.com
To: openembedded-core@lists.openembedded.org,
	openembedded-devel@lists.openembedded.org,
	angstrom-distro-devel@linuxtogo.org, meta-ti@yoctoproject.org
Subject: OE Changelog since 2015-01-25 until 2015-02-01
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
X-List-Received-Date: Wed, 04 Feb 2015 15:38:51 -0000
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable

Changelog since 2015-01-25 until 2015-02-01.  Projects included in this =
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

Alexandru DAMIAN (3):
=20=20toastergui: update project build listing
=20=20toaster: update texts for the startup sequence
=20=20toaster: new layer checkout logic

Alexandru Damian (1):
=20=20toasterui: do not filter images by extension

Belen Barros Pena (12):
=20=20toaster: make layouts consistent
=20=20toaster: apply common styles to right hand column of detail pages
=20=20toastergui: Generic message for the layer details empty states
=20=20toastergui: remove redundant style declaration
=20=20toastergui: consistent add / remove layer notifications
=20=20toastergui: give the add dependencies form some breathing space
=20=20toastergui: add 'show all' link to no results page
=20=20toastergui: set column width in layer details page
=20=20toastergui: hide table controls when when less than 10 entries
=20=20toastergui: consistent capitals in button
=20=20toastergui: remove recipe id links to the layer index
=20=20toastergui: alignment fix

Pascal Bach (1):
=20=20parse/ast: Fix issue if path contains '&'

Richard Purdie (1):
=20=20data_smart: Don't use mutable objects as default args

=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D
Changelog for openembedded-core:

Andre McCurdy (3):
=20=20udev: fix missing dependency on glib-2.0-native
=20=20udev: remove obsolete dependency on acl
=20=20logrotate: fix missing acl and libselinux dependencies

Armin Kuster (2):
=20=20nss: update package to 3.17.3 and build fix
=20=20glibc: CVE-2014-9402 endless loop in getaddr_r

Chen Qi (4):
=20=20util-linux: upgrade to 2.25.2
=20=20systemd: remove util-linux from DEPENDS
=20=20libsm: remove dependency on e2fsprogs
=20=20udev-cache: avoid using '-L' for stat

Dan McGregor (2):
=20=20gcc-sanitizers: fix licensing
=20=20dpkg: fix host contamination

Enrico Scholz (2):
=20=20image_types.bbclass: fixed 'init' creation for cpio images
=20=20image_types.bbclass: manage 'cpio_append' directory

Fabien Proriol (1):
=20=20boost: Avoid to use local host configuration

Gustavo Sverzut Barbieri (1):
=20=20kmod: new PACKAGECONFIG debug and logging to help reduce binary size.

Hongxu Jia (2):
=20=20distcc: fix initscript can not stop distcc daemon correctly
=20=20libxml-parser-perl: upgrade to 2.44

Jackie Huang (1):
=20=20dmidecode: add powerpc64 to compatible host

Jun Zhu (1):
=20=20xserver-xorg: Add the patch to fix subwindow in Xi emulated events

Juro Bystricky (1):
=20=20eglibc-use-option-groups.patch: Various fixups

Khem Raj (4):
=20=20usbutils: Fix typo in md5sum
=20=20icu: Upgrade to v54
=20=20gmp: Change the SRC_URI to reflect upstream changed location
=20=20libpng: Upgrade to 1.6.16

Koen Kooi (1):
=20=20linux-dummy: provide empty shared_workdir method

Lei Maohui (1):
=20=20libidn_0.6.14: fix the QA Issue

Li xin (1):
=20=20elfutils_0.148.bb: CVE-2014-9447 fix

Mark Hatle (4):
=20=20gcc/libgcc-common.inc: Add missing 'fakeroot' to two tasks
=20=20python-smartpm: Fix attemptonly builds when file conflicts occur
=20=20feature-arm-thumb.inc: Remove extra space on thumb override
=20=20arch-mips.inc: Change definition of TRANSLATED_TARGET_ARCH

Markus Lehtonen (2):
=20=20combo-layer: minor refactor
=20=20combo-layer: support updating up to arbitrary commit

Martin Jansa (4):
=20=20gst-ffmpeg: add dependency on libpostproc
=20=20libpostproc: import from meta-oe
=20=20libav: drop older 0.8.* and use libav-9 by default
=20=20recipes-qt: add x11 to required DISTRO_FEATURES

Max Krummenacher (2):
=20=20udev: fix ptest rule syntax check
=20=20udev: don't keep ptest testdata laying around

Maxin B. John (1):
=20=20ltp: update to 20150119 release

Otavio Salvador (1):
=20=20u-boot-fw-utils: Fix the cross build

Pascal Bach (1):
=20=20base-passwd: Don't replace $ variables in passwd and group files

Patrick Ohly (2):
=20=20binconfig-disabled: try harder to prevent usage of config scripts
=20=20binconfig-disabled: install config scripts in sysroot

Paul Eggleton (1):
=20=20gcc: ensure target gcc headers can be included

Peter Seebach (1):
=20=20pseudo_1.6.x.bb/pseudo_git.bb: Pseudo 1.6.4

Philip Balister (1):
=20=20orc : Update to 0.4.23.

Qian Lei (1):
=20=20lighttpd: Use PACKAGECONFIG to enable openssl

Richard Purdie (3):
=20=20image: Add missing depends on virtual/kernel for depmod data
=20=20kernel: Fix depmod for multilib
=20=20scripts/send-error-report: Set exit code if error occurs

Ross Burton (1):
=20=20security_flags: disable PIE on expect

Saul Wold (3):
=20=20mkfontscale: Upgrade to 1.1.2
=20=20build-appliance-image: Upgrade for 1.8 Master
=20=20util-linux: move readprofile to match busybox

Soren Brinkmann (1):
=20=20shadow: securetty: Add Xilinx Zynq SoC

Theodor Gherzan (1):
=20=20kernel-yocto.bbclass: Bug Fix inside do_kernel_checkout()

Ting Liu (3):
=20=20bind: fix typo chown->chmod
=20=20bitbake.conf: add PKGDATA_DIR to BB_HASHBASE_WHITELIST
=20=20libunwind: Fix test case link failure on PowerPC with Altivec

=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D
Changelog for meta-openembedded:

Andrea Adami (1):
=20=20kexec-tools-klibc_2.0.2: backport patch to fix build with separate B =
and S

Armin Kuster (2):
=20=20wireshark: update to 1.12.3
=20=20wireshark: fix rdepends issue

Ben Shelton (1):
=20=20msr-tools: add recipe

Bian Naimeng (1):
=20=20opensaf: add recipe

Dmitry Eremin-Solenikov (1):
=20=20vlan: don't try to include files from ${HOME}/linux/include

Jackie Huang (1):
=20=20rsyslog: set the default file permission

Joe MacDonald (1):
=20=20opensaf: update SRC_URI and install actions

Joe Slater (3):
=20=20geoip-perl: add recipe for version 1.45
=20=20python-ldap: move to version 2.4.10
=20=20python-lxml: move to version 3.2.5

Kang Kai (1):
=20=20lksctp-tools: add ptest subpackage and other updates

Li xin (5):
=20=20openl2tp: add new recipe
=20=20radvd: add licenses file to fix warning
=20=20system-config-keyboard: add new recipe
=20=20system-setup-keyboard: add new recipe
=20=20openct: add new recipe

Roy Li (3):
=20=20traceroute: give high priority when update-alternatives
=20=20iscsi-initiator-utils: fix the iscsid path in iscsid.conf
=20=20apache2: fix a typos

=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D
Changelog for meta-angstrom:

Koen Kooi (1):
=20=20systemd: remove util-linux from DEPENDS to avoid dependency loop

=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D
Changelog for meta-arago:

Carlos Hernandez (1):
=20=20Update linaro-pm-qa-utils package version

Denys Dmytriyenko (1):
=20=20branding-core: re-enable AUTOREV after the release

Franklin S. Cooper Jr (6):
=20=20ti-tisdk-setup: Update commit to add support for Ubuntu 14.04
=20=20matrix-gui-apps-git: Use updated commit
=20=20matrix-gui-helper-scripts: Add script that will be useful to other =
matrix ap
=20=20matrix-gui-pm-demos: Use static set PM governor application
=20=20matrix-gui-*: Add dependency on matrix-gui-helper-scripts
=20=20branding-amsdk: Avoid picking up auto rev kernel and u-boot

Nikhil Devshatwar (1):
=20=20packagegroup-arago-test: Update vpdma-fw and vpe-tests packages

Sam Nelson (1):
=20=20multiprocmgr: Remove multiprocmgr recipe: moved to meta-ti

=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D
Changelog for meta-atmel:

=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D
Changelog for meta-beagleboard:

=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D
Changelog for meta-browser:

Carlos Rafael Giani (2):
=20=20chromium: Reorganize into .inc and .bb to allow for cleaner upgrades
=20=20chromium: chromium: Upgrade to version 40.0.2214.91

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

Carlos Rafael Giani (1):
=20=20chromium: Update bbappend to version 40.0.2214.91

Lauren Post (11):
=20=20linux-imx: Upgrade to 3.10.53-1.1.0 GA release
=20=20imx-test: Upgrade to 3.10.53-1.1.0_GA release
=20=20imx-lib: Upgrade to 3.10.53-1.1.0_GA release
=20=20imx-vpu: Upgrade to 3.10.53-1.1.0 GA release
=20=20firmware-imx: Upgrade to 3.10.53-1.1.0 GA release
=20=20u-boot-imx: Upgrade to 3.10.53-1.1.0_GA release
=20=20imx-kobs: Upgrade to 3.10.53-1.1.0 GA release
=20=20imx6sxsabresd: Remove deleted device tree canfd
=20=20imx6sxsabreauto: Create for 3.10.53-1.1.0 Release
=20=20imx6slevk: Add new uart device tree imx6sl-evk-uart.dtb
=20=20imx6qsabresd.conf: Add imx6q-sabresd-uart device tree

Neena Busireddy (4):
=20=20imx-gpu-viv: Upgrade to 3.10.53-1.1.0 GA release
=20=20xf86-video-imxfb-vivante: Upgrade to 3.10.53-1.1.0 GA release
=20=20xf86-video-imxfb-vivante: Add autohdmi utility
=20=20directfb: Upgrade to 1.7.4 version

Zidan Wang (5):
=20=20libfslvpuwrap: Upgrade to 1.0.57 version
=20=20libfslcodec: Upgrade to 4.0.2 version
=20=20libfslparser: Upgrade to 4.0.2 version
=20=20gst1.0-fsl-plugin: Upgrade to 4.0.2 version
=20=20gst-fsl-plugin: Upgrade to 4.0.2 version

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

Pengyu Ma (1):
=20=20intel-gpu-tools: Upgrade to 1.9

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

Alex J Lennon (1):
=20=20linux-raspberrypi: Change to Linux Yocto style kernel recipes

Andrei Gherzan (4):
=20=20omxplayer: Add patch to fix lflags and cflags
=20=20omxplayer: Minor tweaks
=20=20README: Fix typo
=20=20linux-raspberrypi: Remove old v3.2.27

Maciej Borzecki (2):
=20=20raspberrypi.conf: add IMAGE_BOOT_FILES
=20=20sdimage-raspberrypi.wks: kickstart image definition

Petter Mab=C3=A4cker (2):
=20=20linux-raspberrypi: fix do_configure failure
=20=20linux-raspberrypi: faulty branch and srcrev for 3.16

=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D
Changelog for meta-smartphone:

=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D
Changelog for meta-ti:

Denys Dmytriyenko (1):
=20=20linux-ti-staging: update to stable 3.14.29

Nikhil Devshatwar (1):
=20=20vpdma-fw: Separate vpdma-fw and vpe-tests recipe

Sam Nelson (2):
=20=20srss-tc: Add recipe for Smart reflex application
=20=20nwal-lld: Add recipes for Network abstraction layer low level driver =
and tes

=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D
Changelog for meta-webos:

=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D
Changelog for meta-xilinx:

=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D
Changelog for meta-yocto:

Petter Mab=C3=A4cker (1):
=20=20tiny-init: set proper S value

=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D
Changelog for openembedded:



