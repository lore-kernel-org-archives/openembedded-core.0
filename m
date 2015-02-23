Return-Path: <cliff.brake@gmail.com>
Received: from mail-ie0-f177.google.com (mail-ie0-f177.google.com
	[209.85.223.177])
	by mail.openembedded.org (Postfix) with ESMTP id 872D2706B3;
	Mon, 23 Feb 2015 15:14:08 +0000 (UTC)
Received: by iebtr6 with SMTP id tr6so23851498ieb.10;
	Mon, 23 Feb 2015 07:14:09 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=date:mime-version:message-id:from:to:subject:content-type
	:content-transfer-encoding;
	bh=VkiArWkXKi/YCTDROa3E153KI477ynolLQMxVxcRrHA=;
	b=jFveyU4EF8ogImninuwQN12qg3XliT/+KilqmpD5dowvZOJ7BziLcW7NbJxuBlbeTW
	bu6EiS9iPi+nPM2bDpA60x9deaVcLRGEdl6/sRs0rxBGbxieQo6F51kJvUVhKXNTGZak
	mG22Zsc5tGHceoXInBTtz5V+sZ8AbjnkTfWJmcFKW4WrQ9s/YKsXuvq7qs0fm4ugaOUt
	rxw/93zRpNJMX4jmE2Mn5aDgIv10sYCTij44sLic7UUwNQMXObS+QGtixkVk8Tbn08eF
	dGfyB8IyjKq2gDH1WujJx0BHbOxsrpn2u6agPw/iEAECvrYB9+dnCj29s4oFR7mPMdWS
	mSEA==
X-Received: by 10.42.223.194 with SMTP id il2mr12019742icb.94.1424704449581;
	Mon, 23 Feb 2015 07:14:09 -0800 (PST)
Received: from [127.0.0.1] (cable2-pool191-cs-105.doycomm.com.
	[66.219.191.105])
	by mx.google.com with ESMTPSA id u13sm21164087ioi.6.2015.02.23.07.14.06
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
	Mon, 23 Feb 2015 07:14:08 -0800 (PST)
Date: Mon, 23 Feb 2015 07:14:08 -0800 (PST)
X-Google-Original-Date: Mon, 23 Feb 2015 15:14:05 GMT
MIME-Version: 1.0
X-Mailer: Nodemailer (0.3.22; +http://andris9.github.com/Nodemailer/)
Message-Id: <1424704445276.237215a4@Nodemailer>
From: cliff.brake@gmail.com
To: openembedded-core@lists.openembedded.org,
	openembedded-devel@lists.openembedded.org,
	angstrom-distro-devel@linuxtogo.org, meta-ti@yoctoproject.org
Subject: OE Changelog since 2015-02-15 until 2015-02-22
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
X-List-Received-Date: Mon, 23 Feb 2015 15:14:11 -0000
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable

Changelog since 2015-02-15 until 2015-02-22.  Projects included in this =
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

Alexandru DAMIAN (7):
=20=20toaster: properly detect failed server start
=20=20toaster: fix git checkout command
=20=20toasterui: empty state for pages
=20=20toaster: bitbake cooker log saving and downloading
=20=20toaster: properly detect starting in rolling log file
=20=20toasterui: UI query performance improvements
=20=20toaster: get proper version string

Alexandru Damian (1):
=20=20toasterui: fix time estimation in project page

An=C3=ADbal Lim=C3=B3n (7):
=20=20fetch2: wget latest_versionstring improve _parse_path
=20=20fetch2: wget latest_versionstring _check_latest_version improvments
=20=20fetch2: wget add _check_latest_version_by_dir
=20=20fetch2: wget latest_versionstring improvments in get version by dir
=20=20fetch2: wget _modelate_version improvments
=20=20fetch2: wget remove scape of - in regexes don't needed
=20=20tests/fetch.py: latest_versionstring add set of PN

Belen Barros Pena (2):
=20=20toasterui: style the Toaster version information
=20=20toasterui: remove layer directory in managed mode

Chong Lu (1):
=20=20bitbake-layers: add ability to fetch layers and their dependencies =
from laye

David Reyna (2):
=20=20toaster: Additional fixes for the project variable page
=20=20toaster: landing page when no build module

Maxin B. John (1):
=20=20depexp.py: Fix segfault if DISPLAY is not set

Michael Wood (8):
=20=20toaster: Use on input event for validation rather than keyup
=20=20toaster: layerdetails use new vcs reference api
=20=20toaster: New build button allow arbitrary build targets
=20=20toaster: Remove Layer source from machines, layers and targets
=20=20toaster: Remove filtering from layers,machines and targets
=20=20toaster: Set the machines page default pagesize to 100
=20=20toaster: layerdetails Don't show None type in description/summary
=20=20toaster: importlayer Remove description input field

Paul Eggleton (5):
=20=20utils: ensure explode_dep_versions2 raises an exception on =
invalid/missing o
=20=20tests: add tests for OE pre-release version formatting
=20=20cooker: rework LAYERDEPENDS versioning so that it is actually useful
=20=20bitbake-layers: refactor to use argparse instead of cmd
=20=20bitbake-layers: fix logging

=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D
Changelog for openembedded-core:

Andre McCurdy (1):
=20=20neon: update 0.30.0 -> 0.30.1

Ben Shelton (3):
=20=20trace-cmd: Update to version 2.5.3
=20=20kernelshark: Update to version 2.5.3
=20=20font-util: stage encoding maps into sysroot

Bian Naimeng (1):
=20=20iputils: install clockdiff same as ubuntu and fedora

Brendan Le Foll (1):
=20=20openssl: disable SSLv3 by default

Bruce Ashfield (5):
=20=20linux-libc-headers: update to 3.19
=20=20linux-yocto: make kernel configuration audit user visible
=20=20linux-yocto: remove 3.10 and 3.17 recipes
=20=20linux-yocto: introduce 3.19 versioned recipes
=20=20linux-yocto: warn when a generated BSP description is used

Chen Qi (4):
=20=20package_manager.py: use 'purge' instead of 'remove' in case of deb
=20=20update-rc.d: use '-f' option in updatercd_postrm
=20=20useradd.bbclass: avoid do_rootfs error for debian package backend
=20=20packaging: allow globs in CONFFILES

Chong Lu (1):
=20=20bitbake.conf: Add two variables for layer index

Cristian Iorga (1):
=20=20conf/distro/include/default-providers: updated bluez-hcidump providers

Dan McGregor (1):
=20=20glibc: Update to glibc 2.21 release tag

Fathi Boudra (2):
=20=20busybox: update to 1.23.1 release
=20=20kexec-tools: fix build failure on aarch64_be architecture

Javier Viguera (1):
=20=20utils.bbclass: fix create_cmdline_wrapper

Khem Raj (3):
=20=20glibc: Upgrade 2.20 -> 2.21
=20=20tclibc-musl: Use musl for providing virtual/libintl instead of gettext
=20=20glibc: Dont offer to be parsed for non-glibc TCLIBC selection

Lucian Musat (1):
=20=20oeqa/ptest: Fixed complementary package install detection and added =
ptest-ru

Martin Jansa (5):
=20=20test-dependencies.sh: strip only .bb suffix
=20=20valgrind: add glibc-2.21 to glibc.patch
=20=20license.bbclass: fix unexpected operator for LICENSE values with space
=20=20feature-arm-thumb.inc: respect ARM_INSTRUCTION_SET when adding thumb =
suffix
=20=20arch-armv7a.inc, tune-arm920t.inc: Fix PACKAGE_EXTRA_ARCHS

Nathan Rossi (1):
=20=20Revert "kernel-arch.bbclass: add arm64 support to U-Boot architecture =
map"

Paul Eggleton (3):
=20=20lib/oe/package_manager: support exclusion from complementary glob =
process by
=20=20lib/oeqa/selftest/bblayers: use dashed subcommands
=20=20layer.conf: set a variable to map to the OE Layer Index name

Paul Gortmaker (3):
=20=20coreutils: don't generate useless dummy stub manpages
=20=20coreutils: import prebuilt manpages from Gentoo
=20=20scripts: delete dummy help2man script

Peter A. Bigot (9):
=20=20bluetooth.bbclass: simplify recipe inference of bluetooth provider
=20=20packagegroup-base: select distro preference for bluez provider
=20=20pulseaudio: select distro preference for bluez provider
=20=20neard: select distro preference for bluez provider
=20=20libpcap: select distro preference for bluez provider
=20=20ofono: select distro preference for bluez provider
=20=20gstreamer1.0-plugins-bad: select distro preference for bluez provider
=20=20connman: depend on distro provider of bluez
=20=20qt-mobility: select distro preference for bluez provider

Richard Purdie (9):
=20=20libtool: 2.4.5 -> 2.4.6
=20=20default-providers: Set the preferred provider for bluez based on =
version
=20=20populate_sdk: Handle OLDEST_KERNEL
=20=20qt-mobility: Add patch to fix disabling bluez compile issues
=20=20oeqa/parselogs: Add exception for new mips error message
=20=20e2fsprogs: Add a patch to speedup mkfs
=20=20lib/oe/package_manager: Performance tweak in regex usage
=20=20machine/qemu: Switch from ext3 to ext4
=20=20runqemu: Specify rootfstype to qemu to avoid QA warnings

Richard Tollerton (2):
=20=20font-util: remove MAPFILES_PATH override
=20=20xorg-font-common: fix sysroot injection for encoding maps

Robert Yang (10):
=20=20btrfs-tools: fix for parallel build
=20=20bind: Fix parallel make issue
=20=20quilt: 0.63 -> 0.64
=20=20cups: 2.0.1 -> 2.0.2
=20=20git: 2.2.1 -> 2.3.0
=20=20python-git: 0.3.3 -> 0.3.6
=20=20python-gitdb: 0.6.1 -> 0.6.4
=20=20logrotate: 3.8.8 -> 3.8.9
=20=20build-compare: update Rename-rpm-check.sh-to-pkg-diff.sh.patch
=20=20lttng-tools: add PACKAGECONFIG for kmod

Ross Burton (1):
=20=20opkg: fix systemd unit installation

Saul Wold (1):
=20=20lzo: Upgrade to 2.09 and add ptest

Tom Zanussi (1):
=20=20wic: Fix kernel dir location

=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D
Changelog for meta-openembedded:

Andreas M=C3=BCller (19):
=20=20libmbim: initial add 1.12.2
=20=20libqmi: initial add 1.12.2
=20=20modemmanager: update to 1.4.2
=20=20network-manager-applet: add PACKAGCONFIG for modemmanager - disabled =
by defa
=20=20xmessage: initial add 1.0.4
=20=20xfce4-kbdleds-plugin: Initial add 0.0.6
=20=20packagegroup-xfce-extended: add xfce4-kbdleds-plugin
=20=20xfce4-screenshooter: update to 1.8.2
=20=20xfce4-weather-plugin: update to 0.8.5
=20=20xfce4-whiskermenu-plugin: update to 1.4.2
=20=20xfce4-cpufreq-plugin: update to 1.1.1
=20=20xfce4-netload-plugin: update to 1.2.4
=20=20xfce4-eyes-plugin: update to 4.4.3
=20=20xfce4-systemload-plugin: update to 1.1.2
=20=20xfce4-equake-plugin: update to 1.3.6
=20=20xfce4-timer-plugin: initial add 1.6.0
=20=20packagegroup-xfce-extended: add xfce4-timer-plugin
=20=20gnome-bluetooth: fix build by using a valid dbus interface + =
unblacklist
=20=20gimp: update to 2.8.14 / fix build by not configuring with =
freetype-config

Joe MacDonald (1):
=20=20snort: blacklist

Paul Eggleton (2):
=20=20python-django: extend to nativesdk
=20=20python-django-south: extend to nativesdk

=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D
Changelog for meta-angstrom:

Andreas M=C3=BCller (1):
=20=20Systemd: drop overlayed recipe

=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D
Changelog for meta-arago:

Carlos Hernandez (1):
=20=20busybox/defconfig: Enable options required by LAVA

Franklin S. Cooper Jr (8):
=20=20sourceipk: Cleanly clear local config settings
=20=20nativesdk-packagegroup-arago-sdk-host: Add nativesdk-git
=20=20unshallow-repositories: Add script to unshallow repositories
=20=20tisdk-install: Add the installed SDK path to unshallow-repositories =
script
=20=20packagegroup-arago-tisdk-amsdk-sdk-host: Conditionally include =
unshallow-rep
=20=20branding-amsdk: Update wording for sourecipk commit message
=20=20ti-tisdk-setup: Grab latest commit that supports saving env to FAT =
for 335x
=20=20matrix-gui-apps-git: Bump commit to update text in scripts

Jacob Stiffler (1):
=20=20packagegroup-arago-tisdk-multimedia: Remove dspdce-fw from dra7xx-evm.

Karthik Ramanan (4):
=20=20base-files: Increase /var/volatile size
=20=20libdce: Update to latest IPC 3.30.03.14
=20=20omapdrmtest: Updated applications for GLSDK 7.00EA
=20=20wayland/weston: Deprecate 1.3.0

Sam Nelson (2):
=20=20ipsecmgr: Add recipes for ipsec manager kernel module and libraries
=20=20branding-mcsdk: Adding MCSDK branding include file

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

Andreas M=C3=BCller (1):
=20=20imx-gpu-viv: ship libgles3-mx6-dev along with libgles2-mx6-dev

Carlos Rafael Giani (1):
=20=20gstreamer1.0-plugins-imx: Update to version 0.10.1

Daiane Angolini (2):
=20=20imx6solosabresd: Use zImage by default
=20=20imx6solosabreauto: Use zImage by default

Javier Viguera (1):
=20=20qt4: sync g++.conf file with upstream

Otavio Salvador (10):
=20=20imx-base: Add virtual/libg2d to i.MX6's MACHINE_SOCARCH_FILTER
=20=20xf86-video-imxfb: Ensure kernel source is available
=20=20amd-gpu-x11-bin-mx51: Add a build-dependency on libxext
=20=20xf86-video-imxfb: Use xorg-driver-video.inc common file
=20=20xf86-video-imxfb: Add --enable-neon on whitelisted configuration =
options
=20=20amd-gpu-mx51.inc: Add the amd-gpu-mx51 provider
=20=20libz160: Add a build-dependency on AMD GPU
=20=20u-boot-fslc: Update to revision 6e66aed
=20=20qtbase: Remove distribution-related settings
=20=20pulseaudio: Use version-agnostic bbappend

=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D
Changelog for meta-fsl-arm-extra:

Alex de Cabo (1):
=20=20u-boot-congatec: Update to commit da45c1

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

=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D
Changelog for meta-ivi:

Holger Behrens (7):
=20=20weston.ini: use complete file instead of patch
=20=20weston: apply ivi-shell click event patch
=20=20qtwayland: add support for IVI surface ID property
=20=20audiomanager-poc: upgrade to version of Nov.25th, assign ivi-shell =
surface I
=20=20weston: disable default virtual keyboard
=20=20wayland-ivi-extension: add support for version 1.3.0
=20=20GDP: remove GENIVI Demo Platform meta data

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

=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D
Changelog for meta-smartphone:

=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D
Changelog for meta-ti:

Jacob Stiffler (1):
=20=20ti-eula-unpack: Add support for general binary installers.

Karthik Ramanan (2):
=20=20ti-ipc: Upgrade to IPC 3.30.03.14
=20=20omap5-sgx-ddk-um-linux: Updated SRCREV to include bugfixes

Sam Nelson (5):
=20=20dfe-lld: Add recipe for Digital Radio Front end low level driver
=20=20iqn2-lld: Add recipes for TI iqn2 peripheral module low level driver
=20=20dfe-lld: Add recipe for dfe test code
=20=20iqn2-lld: Add recipe for iqn2 lld test code
=20=20engine-pkcs11: Add recipe for PKCS11 engine

=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D
Changelog for meta-webos:

=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D
Changelog for meta-xilinx:

Nathan Rossi (1):
=20=20openssl: Patches no longer required

=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D
Changelog for meta-yocto:

Bruce Ashfield (2):
=20=20meta-yocto: update qemu default kernel version to 3.19
=20=20meta-yocto-bsps: remove 3.10 bbappend

=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D
Changelog for openembedded:



