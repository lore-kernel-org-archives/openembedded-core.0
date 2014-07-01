Return-Path: <cliff.brake@gmail.com>
Received: from mail-ie0-f178.google.com (mail-ie0-f178.google.com
	[209.85.223.178])
	by mail.openembedded.org (Postfix) with ESMTP id 02382609B1;
	Tue,  1 Jul 2014 19:20:20 +0000 (UTC)
Received: by mail-ie0-f178.google.com with SMTP id rd18so8574510iec.37
	for <multiple recipients>; Tue, 01 Jul 2014 12:20:21 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=date:mime-version:message-id:from:to:subject:content-type
	:content-transfer-encoding;
	bh=u9hVQh9hX+kENVNusOSvZleUUzC1ankFlK/LAC4dvwA=;
	b=fY0q4NBqtARzDI7ml0D2l1NCzYZDBlWgdbjaMYIbY7BnYUR3S4VZiD5rsmf3KhKCFr
	1m811n0xBGtpTSF4SCXU6Vss8+8elr8wZzaMdjr6KooSCDAd5OiKTPFZLJflUktZZPQ7
	81SMdhzsxoHgX8yRoQUmrWA57O6OzCE33KxzcI4sCGCrmWFKYHWt1p0+R2i84Tw8Pxa8
	qSRWCUFTC+rTz9m7YebTnOuI/gpV6OFRwWuah3ZtzhXQ5ZSIlWoQFkBBR5e1yeaE6IvQ
	nK0T9FJPu+0TOEfWRz3Wp2Qwettu9GBpjAe36I76zExBQKrRp7AM5rbAsk4moDTM9diw
	NLhQ==
X-Received: by 10.51.16.132 with SMTP id fw4mr42971679igd.26.1404242421588;
	Tue, 01 Jul 2014 12:20:21 -0700 (PDT)
Received: from [127.0.0.1] (cable-pool6-cs-200.doycomm.com. [66.219.185.200])
	by mx.google.com with ESMTPSA id
	j10sm25385341igv.17.2014.07.01.12.20.19 for <multiple recipients>
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
	Tue, 01 Jul 2014 12:20:20 -0700 (PDT)
Date: Tue, 01 Jul 2014 12:20:20 -0700 (PDT)
X-Google-Original-Date: Tue, 01 Jul 2014 19:20:19 GMT
MIME-Version: 1.0
X-Mailer: Nodemailer (0.3.22; +http://andris9.github.com/Nodemailer/)
Message-Id: <1404242419307.8b7c02c7@Nodemailer>
From: cliff.brake@gmail.com
To: openembedded-core@lists.openembedded.org,
	openembedded-devel@lists.openembedded.org,
	angstrom-distro-devel@linuxtogo.org, meta-ti@yoctoproject.org
Subject: OE Changelog since 2014-06-22 until 2014-06-29
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
X-List-Received-Date: Tue, 01 Jul 2014 19:20:29 -0000
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable

Changelog since 2014-06-22 until 2014-06-29.  Projects included in this =
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

=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D
Changelog for openembedded-core:

Ash Charles (1):
=20=20u-boot: Optionally deploy an environment or script file

Chen Qi (4):
=20=20udev: remove udev-utils, add 'udevadm' to udev package
=20=20systemd: remove udev-utils, move 'udevadm' to udev package
=20=20initramfs-framework: get rid of udev-utils
=20=20sudo: upgrade from 1.8.10p2 to 1.8.10p3

Chong Lu (1):
=20=20dbus-test: fix incorrect checksum

Corneliu Stoicescu (2):
=20=20oeqa/targetcontrol.py: Separate the matching of supported image =
fstypes from
=20=20scripts/test-remote-image: add value check for rootfs fstype, change =
method=20

Cristian Iorga (8):
=20=20init-install-testfs: add grub serial line support
=20=20oe-core/init-install-testfs.sh: do not overwrite /etc/mtab if the =
link alrea
=20=20init-install-testfs: fix typo
=20=20init-install-testfs: create signature file for master image
=20=20meta-yocto-bsp: oeqa/controllers: add GrubTarget
=20=20bluez5: upgrade to 5.20
=20=20harfbuzz: upgrade to 0.9.29
=20=20iproute2: upgrade to 3.15.0

Darren Hart (1):
=20=20mkefidisk.sh: Allow symlink for device

Dennis Meier (1):
=20=20populate_sdk_base: add auto-completion in setup

Denys Dmytriyenko (2):
=20=20udev: update init script for conditional probing of platform bus
=20=20udev-cache.default: set PROBE_PLATFORM_BUS to "yes" by default

Drew Moseley (2):
=20=20initrdscripts: Try to boot if boot label is unknown
=20=20classes/kernel: Use full path for symlink in update-alternatives.

Fabien Chereau (1):
=20=20libusb: add missing build dependency on udev

H.J. Lu (1):
=20=20binutils: Apply the proper fix for PR 16428

Kai Kang (2):
=20=20initscripts: update populate-volatile.sh
=20=20syslinux: fix isohybird overflows on 32 bit system

Mark Hatle (4):
=20=20classes/package_rpm.bbclass: Fix SDK Suffix reference
=20=20populate_sdk: Fix TOOLCHAIN_TARGET_TASK_ATTEMPTONLY implementation
=20=20gcc-cross-canadian: Add configure-target-libgcc
=20=20lib/oe/package_manager.py: Add processing for alternative SDK_OS

Martin Jansa (2):
=20=20sstate-diff-machines.sh: Return non-zero return code when there was =
some fai
=20=20test-dependencies.sh: Return non-zero return code when there was some =
failur

Matthieu Crapet (1):
=20=20eglibc (2.19): fix hardcoded /sbin path

Maxin B. John (1):
=20=20u-boot-fw-utils: install config file

Ming Liu (4):
=20=20mesa.inc: remove '-' suffix in substitution of package names
=20=20syslinux.bbclass: Ensure MLPREFIX is applied to depends flag
=20=20grub-efi.bbclass: Ensure MLPREFIX is applied to depends flag
=20=20gummiboot.bbclass: Ensure MLPREFIX is applied to depends flag

Paul Eggleton (5):
=20=20scripts: consolidate code to find bitbake path
=20=20list-packageconfig-flags: filter out doc and defaultval varflags
=20=20list-packageconfig-flags: improve option parsing
=20=20oe-pkgdata-util: fix help text
=20=20classes/report-error: tweak summary message

Paul Gortmaker (1):
=20=20recipes-devtools: fix segfault in lib32-gcc with "." multilib_dir

Richard Purdie (8):
=20=20binutils: Add fix for recent patch on older gcc
=20=20gst-openmax: Add missing pkgconfig inherit
=20=20libsdl: Convert to use pkg-config in internal m4 macros
=20=20gtk-doc: Add pkgconfig inherit
=20=20own-mirrors: Add gitsm:// mirror support
=20=20distutils/distutils3: Fix bashism
=20=20populate_sdk_base: Remove confusing echo
=20=20Revert "libusb: add missing build dependency on udev"

Robert Yang (1):
=20=20createrepo: RDEPENDS on libxml2-python

Ross Burton (2):
=20=20cmake.bbclass: restore OECMAKE_SOURCEPATH
=20=20patch.bbclass: unset TMPDIR after use

Saul Wold (10):
=20=20sqlite3: Update to 3.8.5.0
=20=20libusb1: Update to 1.0.19
=20=20liburcu: Update to 0.8.4
=20=20gnupg: Update to 2.0.23
=20=20curl: Update to 7.37
=20=20xcb-util-renderutil: Update to version 0.3.9
=20=20man-pages: Update to 3.69
=20=20mobile-broadband-provider-info: Update SRCREV
=20=20ca-certificates: Update to 20140325
=20=20curl: Convert CURLGNUTL to PACKAGECONFIG

Yao Xinpan (1):
=20=20nfs-utils: fix the --with-statdpath=3D flag

yzhu1 (1):
=20=20nss-3.15.1: fix CVE-2013-1739

=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D
Changelog for meta-openembedded:

Franklin S. Cooper Jr (1):
=20=20ptpd: update to 2.3.0

Martin Jansa (3):
=20=20sethdlc: Set MACHINE_ARCH, because of virtual/kernel dependency
=20=20ktap: Set MACHINE_ARCH because of ktap-module runtime dependency
=20=20glmark2: Add virtual/libx11 dependency

=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D
Changelog for meta-angstrom:

=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D
Changelog for meta-arago:

Denys Dmytriyenko (26):
=20=20README: update with Daisy info
=20=20linux-libc-headers: remove old 2.6.37 version
=20=20gcc: remove the old overlay of 4.5 version
=20=20binutils: remove the old overlay of 2.20.1 version
=20=20eglibc: remove the old overlay of 2.12 version
=20=20linux-ti-staging: remove 3.8 bbappend, as recipe is gone from meta-ti
=20=20libjpeg-turbo: remove bbappend for SVN URI, as main recipe uses =
tarball now
=20=20icu: remove bbappend and patch to disable LDFLAGSICUDT, applied =
upstream
=20=20recipes: update bbappends to match newer versions in lower layers
=20=20gadget-init: LICENSE from oe-core has changed, update hash
=20=20wl18xx-firmware: specify the branch being used for this version
=20=20hostap-daemon: specify the branch being used for this version
=20=20wpa-supplicant: specify the branch being used for this version
=20=20toolchain-external: bb.which() is now part of bb.utils module
=20=20toolchain-linaro/gcc: remove DEFAULTTUNE settings that went to meta-ti
=20=20arago-prefs, toolchain-linaro: update system versions
=20=20arago.conf: with unification on mainline, remove PACKAGE_ARCH logic
=20=20tisdk-image: upstream got new rootfs/image framework, unbreak parsing
=20=20arago.conf: update version, remove FETCHCMD_wget workaround
=20=20linux: remove bbappends for old kernel recipes removed from meta-ti
=20=20u-boot: remove bbappends for old u-boot recipes removed from meta-ti
=20=20cryptodev: remove local cryptodev, now available in oe-core, adjust =
name
=20=20recipes: fix hash for updated LICENSE file in oe-core
=20=20u-boot-am37x: remove old machine-specific bbappend
=20=20arago-prefs: remove old preferred providers and versions for legacy =
platform
=20=20arago: temporarily filter out "sgx" machine feature, when building =
for 3.14+

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

Carlos Rafael Giani (3):
=20=20gstreamer1.0-plugins-imx: select X11/Wayland/FB EGL platform if =
appropriate
=20=20gstreamer1.0-plugins-bad: set correct EGL defines for Vivante GPUs
=20=20efl: Add bbappend to make it work with the Vivante EGL headers

Eric Nelson (2):
=20=20imx-vpu: fix checks of IOGetVirtMem() return value
=20=20libfslvpuwrap_1.0.46: fix IOGetVirtMem calls

=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D
Changelog for meta-fsl-arm-extra:

Rabeeh Khoury (2):
=20=20u-boot-cubox-i: update to e313a3a86e SRCREV
=20=20linux-cubox-i: updates the kernel to 6fc170bb7b SRCREV

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

Darren Hart (1):
=20=20linux-yocto: Make KERNEL_MODULE_AUTOLOAD machine specific

Nitin A Kamble (2):
=20=20linux-yocto recipes: fix use of module_autoload_* vars
=20=20meta-tlk: using wildcard bbappend for linux-yocto

=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D
Changelog for meta-ivi:

=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D
Changelog for meta-java:

Henning Heinold (1):
=20=20openjdk: fix do_install for out of source builds

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

Andreas M=C3=BCller (1):
=20=20qttools: make qtwebkit a PACKAGECONFIG and disable by default

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

Ash Charles (3):
=20=20gstreamer-ti: Revert to build in place ${B} =3D ${S}
=20=20Use INSANE_SKIP_${PN} =3D "installed-vs-shipped"
=20=20ti-dmai: Allow do_prepsources to run release.sh

Denys Dmytriyenko (12):
=20=20linux-mainline: update to 3.14.8 and enable legacy omap3 devices
=20=20machine configs: set optimized hardfp DEFAULTTUNE if not set
=20=20linux-ti-staging: update to latest 3.14 stable, as being LTS
=20=20linux-ti-staging: add device trees for legacy omap3 devices
=20=20linux: remove old platform-specific 2.6.37 kernels
=20=20u-boot: remove old platform-specific versions
=20=20libgles-omap3, omap3-sgx-modules: remove old 4.8.x and 5.x versions
=20=20recipes: consolidate firmware recipes under recipes-bsp in own =
directories
=20=20conf/machine: update legacy machines to use latest mainline kernel =
and u-boo
=20=20u-boot-am37x: remove old machine-specific version in favor of mainline
=20=20linux-mainline: update to use linux-3.14.y stable branch
=20=20linux-ti-staging: temporarily lower default priority due to sgx =
breakage

Franklin S. Cooper Jr (1):
=20=20u-boot-ti-staging:_2013.10: Update to pull in critical fixes

Scott Ellis (2):
=20=20Remove deprecated update-modules from recipes
=20=20gstreamer-ti: Break packages into dev and staticdev

=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D
Changelog for meta-webos:

Changhee Han (1):
=20=20Revert "webos-image: nyx-utils=3D16,v1.1.1"

Keith Derrick (1):
=20=20webos-image: nyx-utils=3D17,v1.1.2

=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D
Changelog for meta-xilinx:

=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D
Changelog for meta-yocto:

=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D
Changelog for openembedded:



