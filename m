Received: from new.bec-systems.com ([74.208.70.121] helo=bec-systems.com)
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <cliff.brake@gmail.com>)
	id 1UMhIy-0005VP-Hu; Mon, 01 Apr 2013 18:09:57 +0200
Received: from oh-69-34-21-229.sta.embarqhsd.net ([69.34.21.229]
	helo=happy.bec-systems.com)
	by bec-systems.com with esmtpsa (TLS1.0:DHE_RSA_AES_256_CBC_SHA1:32)
	(Exim 4.71) (envelope-from <cliff.brake@gmail.com>)
	id 1UMh1H-0001WX-1C; Mon, 01 Apr 2013 11:51:42 -0400
MIME-Version: 1.0
X-Mailer: Nodemailer (0.3.22; +http://andris9.github.com/Nodemailer/)
Date: Mon, 01 Apr 2013 15:52:37 GMT
Message-Id: <1364831557196.6e7bda93@Nodemailer>
From: cliff.brake@gmail.com
To: openembedded-core@lists.openembedded.org,
	openembedded-devel@lists.openembedded.org,
	angstrom-distro-devel@linuxtogo.org, meta-ti@yoctoproject.org
X-Spam_score: -1.0
X-Spam_score_int: -9
X-Spam_bar: -
Subject: OE Changelog since 2013-03-24 until 2013-03-31
X-BeenThere: openembedded-core@lists.openembedded.org
X-Mailman-Version: 2.1.11
Precedence: list
List-Id: Patches and discussions about the oe-core layer
	<openembedded-core.lists.openembedded.org>
List-Unsubscribe: <http://lists.linuxtogo.org/cgi-bin/mailman/options/openembedded-core>,
	<mailto:openembedded-core-request@lists.openembedded.org?subject=unsubscribe>
List-Archive: <http://lists.linuxtogo.org/pipermail/openembedded-core>
List-Post: <mailto:openembedded-core@lists.openembedded.org>
List-Help: <mailto:openembedded-core-request@lists.openembedded.org?subject=help>
List-Subscribe: <http://lists.linuxtogo.org/cgi-bin/mailman/listinfo/openembedded-core>,
	<mailto:openembedded-core-request@lists.openembedded.org?subject=subscribe>
X-List-Received-Date: Mon, 01 Apr 2013 16:09:57 -0000
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable

Changelog since 2013-03-24 until 2013-03-31.  Projects included in this =
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

Andrei Dinu (5):
=20=20cache_extra.py : added package information
=20=20cooker.py : added variables related to cache_extra
=20=20propertydialog.py : added 'Package files' functionality
=20=20hoblistmodel.py : passing the package information to hob
=20=20packageselectionpage.py : added information to hob

Cristiana Voicu (1):
=20=20hob: Search strings and results should be persistent

Olof Johansson (1):
=20=20bb.tests.fetch: Opt-out for unittests that require network

Richard Purdie (2):
=20=20doc/bitbake.1: Update with missing parameters
=20=20bitbake/fetch: Add git submodules fetcher

=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D
Changelog for openembedded-core:

Anders Roxell (1):
=20=20oe-setup-builddir: Possibility to customize text.

Andreas Oberritter (1):
=20=20Revert "base-files: add fstab for systemd based systems"

Andrei Dinu (1):
=20=20packageinfo.bbclass : extended functionality

Bj=C3=B6rn Stenberg (1):
=20=20dbus: Depend on dbus-ptest-ptest

Bruce Ashfield (7):
=20=20linux-yocto/3.8: allow kernel feature _appends to be overriden
=20=20linux/yocto-3.4: update to v3.8.4
=20=20linux-yocto/3.8: introduce v3.8.4-rt1
=20=20kern-tools: initialization and meta branch fixes
=20=20linux-yocto/3.4: import v3.4.36 -stable fixes
=20=20linux-yocto/3.8: fix perf host contamination
=20=20linux-yocto/3.8: qemuarm boot fix

Chen Qi (2):
=20=20sysvinit: rc: exit psplash correctly
=20=20init-install.sh: remove unnecessary udev rules file to avoid error =
messages

Colin Walters (1):
=20=20nspr: Also update nspr.pc to 4.9.5

Cristian Iorga (2):
=20=20meta/lib/oe/lsb.py: fix data extraction from /etc/lsb-release
=20=20meta/lib/oe/lsb.py: extract only the needed info from lsb-release

Joe Slater (1):
=20=20dosfstools: really compile supporting large files

Kang Kai (2):
=20=20packagegroup-core-lsb: add nspr
=20=20libpng: add version 1.2 back

Khem Raj (6):
=20=20docbook-utils-native: Unbreak the build after source and build dir =
split
=20=20binutils: Don't generate .PPC.EMB.apuinfo sections for 64-bit output
=20=20uclibc-git: Fix build on x86 and move to latest master
=20=20systemd: Upgrade to 198
=20=20systemd: Upgrade to 199
=20=20systemd: Add new package systemd-kernel-install

Laurentiu Palcu (4):
=20=20xf86-input-evdev: add mtdev dependency
=20=20nspr: remove unnecessary files from the main package
=20=20qemux86*.conf: replace XSERVER weak assignment with a hard one
=20=20elfutils: remove i386_dis.h/x86_64_dis.h compilation targets

Marc Ferland (1):
=20=20image_types.bbclass: Replace squashfs-lzma with squashfs-xz

Mark Hatle (2):
=20=20rpm: Add workaround for debugedit-segv
=20=20rpm: Fix debugedit buildid processing

Marko Lindqvist (1):
=20=20coreutils: update to upstream version 8.21

Maxin B. John (1):
=20=20lttng: babeltrace: Update to upstream version 1.1.0

Nitin A Kamble (2):
=20=20grub-efi-native_2.00.bb: fix a build issue
=20=20psplash_git.bb: fix do_compile by correcting the script path

Paul Barker (1):
=20=20gnupg: Add symlink for gpgv

Paul Eggleton (5):
=20=20qemuimagetest: fix erroneous ps errors when qemu couldn't be started
=20=20qemuimagetest: collect and print runqemu output
=20=20classes/rm_work: rename RM_WORK_WHITELIST to RM_WORK_EXCLUDE
=20=20classes/buildhistory: ensure SDK package lists include complementary =
pkgs
=20=20classes/buildhistory: improve SRCREV recording

Radu Moisan (1):
=20=20busybox: enable systemd integration for syslogd

Richard Purdie (18):
=20=20package.bbclass: Handle subprocess errors correctly
=20=20conf/machine: Clean up MACHINEOVERRIDES handling
=20=20package.bbclass: Ensure debug source file is generated correctly
=20=20at: Fix --with/without pam options
=20=20package.bbclass: Correctly handle /usr/src/debug file ownership
=20=20opkg-utils: Update to newer git rev for bashism fix
=20=20font-alias: Add depends on font-util-native
=20=20eglibc-locale: Ensure files have correct ownership
=20=20qemu: Add missing DEPENDS on dtc
=20=20xserver-nodm: Correct initscript header
=20=20glib-networking: Disable libproxy and gnome-proxy since they're not =
in DEPEN
=20=20qemuimage-testlib: Capture stderror in the logs as well as stdout
=20=20base.bbclass: When we use fakeroot, also use it for devshell
=20=20coreutils: Fix out of tree builds
=20=20scripts/contrib/build-perf-test.sh: add option to allow =
cherry-picking of fi
=20=20qemuimage-testlib: Increase qemu startup timeouts
=20=20qemuimage-testlib: Use ww option to ps to ensure command output isn't =
trunca
=20=20qemuimage-testlib: Fix quoting issue

Ross Burton (26):
=20=20libxcb: fix repeated configures
=20=20busybox: add strictatime support to mount
=20=20systemd: make xz support (compressed journal) optional, defaulting to =
on.
=20=20systemd: merge udev-systemd into udev
=20=20core-image-minimal-initramfs: don't install busybox-syslog
=20=20systemd: don't depend on the PCI/USB databases
=20=20systemd: split out the hwdb data
=20=20default-providers: change udev selection logic
=20=20update-rcd.bbclass: handle both sysvinit and systemd features being =
present
=20=20util-linux: split uuidd into it's own package, and enable for systemd
=20=20update-rcd: drop depends to recommends, check for update-rcd in =
scripts
=20=20systemd: check for systemctl first, and don't force systemd to be =
installed.
=20=20systemd: add udev init script for hybrid sysvinit/systemd usage
=20=20update-rc.d/systemd: change communication variable name
=20=20default-distrovars: don't add INITMAN to DISTRO_FEATURES and =
DISTRO_FEATURES
=20=20bitbake.conf: explicitly backfill sysvinit, not =
DISTRO_FEATURES_INITMAN
=20=20default-distrovars: remove obsolete DISTRO_FEATURES_INITMAN reference
=20=20packagegroup-core-boot: revert to specifying sysvinit as default init =
manage
=20=20systemd-compat-units: disable dbus-1
=20=20systemd: recommend systemd-compat-units
=20=20dbus: explicitly disable systemd when no systemd
=20=20busybox: order and group initscript variables logically
=20=20udev: move /run volatile entry to udev instead of initscripts
=20=20local.conf.sample.extended: remove obsolete DISTRO_FEATURES_INITMAN =
referenc
=20=20weston: upgrade to 1.0.6
=20=20wayland: upgrade to 1.0.6

Stefan Herbrechtsmeier (1):
=20=20boost: Add real native support

Stefan Stanacar (3):
=20=20scripts/contrib/build-perf-test.sh: add a script for build =
performance track
=20=20scripts/contrib/build-perf-test.sh: add a global results file
=20=20scripts/contrib/build-perf-test.sh: add timings for bitbake -p

Zhenhua Luo (1):
=20=20rpm: split out run-postinsts

=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D
Changelog for meta-openembedded:

Aws Ismail (2):
=20=20Quagga has no snmp support, unrecognized options --enable-tcp-md5
=20=20Quagga: clean up whitespaces/hardtabs in recipe

Joe MacDonald (1):
=20=20cyrus-sasl2: clean up rpath QA errors

Koen Kooi (1):
=20=20multipath-tools: add recipe for git version

Marcin Juszkiewicz (5):
=20=20glog: add 0.3.3 version
=20=20tbb: add 4.1 20130116 version (4.1 update 2)
=20=20libunwind: add 1.1 version
=20=20libmcrypt: add 2.5.8
=20=20gperftools: add 2.0

Ting Liu (1):
=20=20lio-utils: initial add 4.1

=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D
Changelog for meta-angstrom:

Khem Raj (1):
=20=20angstrom-next: Switch beaglebone and beagleboard to use hardfp ABI

=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D
Changelog for meta-arago:

Chase Maupin (14):
=20=20ti-tisdk-setup: Add support for unknown devices
=20=20ti-tisdk-makefile: Add omap5 support
=20=20images: Add omap5 support to target images
=20=20arago-source-ipk: Add TI u-boot and linux staging sources
=20=20sdk packagegroups: Add support for omap5 devices
=20=20arago-core-tisdk-image: add core SDK image
=20=20arago-amsdk-image: Update to use the core SDK image
=20=20omapconf: add omapconf utility to assist testing and debug
=20=20arago-source-ipk: Add sourceipk for omapconf
=20=20tisdk-packagegroups: Add omapconf
=20=20ti-tisdk-makefile: Add omapconf targets
=20=20ti-tisdk-makefile: Add build target for linux DTB files
=20=20linux: remove setup-defconfig includes
=20=20linux-ti-staging: add copy-defconfig functionality

Denys Dmytriyenko (3):
=20=20arago.conf, u-boot: follow changes in meta-ti and set preferred =
versions
=20=20kernel.bbclass: re-merge MACHINE_KERNEL_PR support from meta-oe
=20=20arago-sourc-ipk: match u-boot source packages to the new names in =
meta-ti

Hao Zhang (1):
=20=20bluez-hcidump: update SRC_URI since the old URI is not valid.

=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D
Changelog for meta-beagleboard:

Koen Kooi (9):
=20=20linux-mainline 3.8: add mXT224 patchset, HDMI and tester fixes
=20=20contrib: beaglebone eMMC flashing scripts
=20=20contrib: bone-flash-tool: also flash EEPROM
=20=20contrib: bone-flash-tools: parametrize mount points, add check for =
LEDs
=20=20contrib: bone-flash-tool: also disconnect drive when using kpartx
=20=20contrib: bone-flash-tool: change kpartx check
=20=20contrib: bone-flash-tool: add more explicit sync points, make it =
safer to ru
=20=20contrib: bone-flash-tool: partially revert last commit, (a)sync =
wasn't the p
=20=20linux-mainline 3.8: drag in LDO3 fix and 6lowpan updates

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

Adrian Alonso (2):
=20=20gpu-viv-bin-mx6q: remove xlib undef macros
=20=20gpu-viv-bin-mx6q: group libs based on backend

Otavio Salvador (11):
=20=20linux-fslc: Update to 20130324 snapshot of patches-3.8 branch
=20=20gpu-viv-bin-mx6q: Upgrade to 1.1.0
=20=20gpu-viv-bin-mx6q: Remove GL headers as we should use 'mesa' ones
=20=20gpu-viv-bin-mx6q: Add a rdepends of 'libglslc-mx6' in libgles2-mx6
=20=20gpu-viv-bin-mx6q: Fix conflicting type definition in HAL header
=20=20gpu-viv-bin-mx6q: Remove DRI libraries
=20=20gpu-viv-bin-mx6q: Respect X11, DirectFB, FrameBuffer distro features
=20=20libfslcodec: Don't try to split debug symbols
=20=20libfslcodec: Add 'textrel' in INSANE_SKIP to avoid known warnings
=20=20linux-fslc: Update to 20130329 snapshot of patches-3.8 branch
=20=20imx6dlsabresd: Fix machine description

Vladan Jovanovic (1):
=20=20image_types_fsl.bbclass: fix partition type for SD card boot partition

=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D
Changelog for meta-fsl-arm-extra:

John Weber (1):
=20=20linux-imx (3.0.35): Fix cpu_regulator problem with Wandboard

Otavio Salvador (2):
=20=20broadcom-nvram-config: Add compatible machine setting
=20=20Merge "broadcom-nvram-config: Add compatible machine setting"

=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D
Changelog for meta-fsl-ppc:

Christopher Larson (1):
=20=20layer.conf: avoid unnecessary early expansion with :=3D

chunrong guo (8):
=20=20fmc: update to the commit for sdk 1.3.2
=20=20fmlib: update to the commit for sdk 1.3.2
=20=20fm-ucode: update to the commit for sdk 1.3.2
=20=20rcw: update to the commit for sdk 1.3.2
=20=20eth-config: update to the commit for sdk 1.3.2
=20=20usdpaa: update to the commit for sdk 1.3.2
=20=20u-boot: update to the commit for sdk 1.3.2
=20=20linux: update to the commit for sdk 1.3.2

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

Kishore Bodke (5):
=20=20romley: linux-yocto_3.8 recipe extension
=20=20romley romley-ivb: Move BSPs to the v3.8 kernel
=20=20meta-intel/common: Fix build issues for openssl-qat-module
=20=20crystalforest: linux-yocto_3.8 recipe extension
=20=20crystalforest gladden/server: Move BSPs to the v3.8 kernel

Nitin A Kamble (9):
=20=20chiefriver: update v3.8 kernel recipe commits to v3.8.4
=20=20crownbay: update v3.8 kernel recipe commits to v3.8.4
=20=20emenlow: update v3.8 kernel recipe commits to v3.8.4
=20=20fri2: update v3.8 kernel recipe commits to v3.8.4
=20=20jasperforest: update v3.8 kernel recipe commits to v3.8.4
=20=20nuc: update v3.8 kernel recipe commits to v3.8.4
=20=20sugarbay: update v3.8 kernel recipe commits to v3.8.4
=20=20sys940x: update v3.8 kernel recipe commits to v3.8.4
=20=20MAINTAINERS: add missing entries

=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D
Changelog for meta-ivi:

=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D
Changelog for meta-java:

woglinde (1):
=20=20Merge pull request #37 from kraj/master

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

Paul Eggleton (2):
=20=20camera-assistant: move files to files subdirectory
=20=20layer.conf: use ??=3D to set variables

=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D
Changelog for meta-qt3:

=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D
Changelog for meta-slugos:

=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D
Changelog for meta-systemd:

=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D
Changelog for meta-raspberrypi:

=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D
Changelog for meta-smartphone:

Martin Jansa (7):
=20=20README: add missing meta-oe dependency in BSP layers
=20=20README: use github mirror URLs
=20=20shr: Remove DISTRO_FEATURES_INITMAN variable
=20=20shr: add update-rc.d to BAD_RECOMMENDATIONS
=20=20README: fix URL for meta-smartphone repo

=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D
Changelog for meta-ti:

Andreas M=C3=BCller (1):
=20=20mesa-dri: follow oe-core's renaming to mesa

Chase Maupin (7):
=20=20linux-ti-staging: Add OMAP5 support
=20=20omap5-evm: Add OMAP5 EVM configuration
=20=20linux-ti-staging: Update to latest staging kernel
=20=20omap5-evm: Update serial console to proper value
=20=20linux-ti-staging: Add panda dts file as supported DTS
=20=20dra7xx-evm: Add DRA7xx machine type
=20=20linux: Use setup-defconfig in kernel recipes

Denys Dmytriyenko (2):
=20=20linux-ti-staging: rename to have version in name, update to latest
=20=20linux-ti-staging: one more update to latest 3.8.5

=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D
Changelog for meta-webos:

Ed Chejlava (1):
=20=20ca-certificates: create ca-certificates.crt file

Herb Kuta (3):
=20=20webos-image: cpushareholder=3D2,v2.0.1
=20=20Revert "webos: Add WEBOS_DISTRO_API_VERSION variable"
=20=20luna-prefs: Use WEBOS_DISTRO_API_VERSION

Iyad Qumei (1):
=20=20packagegroup-core-tools-debug: add ltrace component

Janne Hurskainen (5):
=20=20webos: Add WEBOS_DISTRO_BUILD_INFO variable
=20=20webos: Add WEBOS_DISTRO_RELEASE_CODENAME variable
=20=20webos-image: Generate ${webos_sysconfdir}/build/image-name
=20=20webos-image: Fix rootfs_set_image_name comments
=20=20lsb: Use new WEBOS_DISTRO_* build info variables

Keith Derrick (1):
=20=20webos-image: nyx-modules=3D83

Kwangrim Ahn (1):
=20=20openjade-native: Handle arbitrary directory names

Martin Jansa (6):
=20=20lvm2: Rename bbappend to match new version from meta-oe
=20=20ca-certificates: Rename to match new version from meta-oe
=20=20mm-common: Remove changes not needed after oe-core upgrade
=20=20webos: Change default IMAGE_FSTYPES setting
=20=20lttng2-ust: Backport patch from oe-core to fix parallel build issue
=20=20tcf-agend: Add bbappend to resolve modified epl-v10.html

Pekka Ropo (3):
=20=20webos-image: nyx-modules=3D82
=20=20nyx-modules: Support new build info variables
=20=20nyx-modules: Support new build info variables

Susan Montooth (1):
=20=20Revert "nyx-modules: Support new build info variables"

=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D
Changelog for meta-xilinx:

=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D
Changelog for meta-yocto:

Bruce Ashfield (1):
=20=20linux-yocto/meta-yocto-bsps: update h/w references to v3.4.36

Emilia Ciobanu (2):
=20=20Added regex for gtk-update-icon-cache-native
=20=20package_regex.inc: Added regex for elfutils

Ross Burton (2):
=20=20local.conf.sample.extended: remove obsolete DISTRO_FEATURES_INITMAN =
referenc
=20=20poky.conf: enable Wayland DISTRO_FEATURE

=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D
Changelog for openembedded:




