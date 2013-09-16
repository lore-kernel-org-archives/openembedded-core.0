Return-Path: <cliff.brake@gmail.com>
Received: from bec-systems.com (u15414263.onlinehome-server.com
	[74.208.70.121])
	by mail.openembedded.org (Postfix) with ESMTP id 714F560648;
	Mon, 16 Sep 2013 20:03:51 +0000 (UTC)
Received: from oh-67-76-203-50.sta.embarqhsd.net ([67.76.203.50]
	helo=happy.bec-systems.com)
	by bec-systems.com with esmtpsa (TLS1.0:DHE_RSA_AES_256_CBC_SHA1:32)
	(Exim 4.71) (envelope-from <cliff.brake@gmail.com>)
	id 1VLeum-0000hf-J8; Mon, 16 Sep 2013 15:57:05 -0400
MIME-Version: 1.0
X-Mailer: Nodemailer (0.3.22; +http://andris9.github.com/Nodemailer/)
Date: Mon, 16 Sep 2013 20:03:30 GMT
Message-Id: <1379361810376.97c9b25a@Nodemailer>
From: cliff.brake@gmail.com
To: openembedded-core@lists.openembedded.org,
	openembedded-devel@lists.openembedded.org,
	angstrom-distro-devel@linuxtogo.org, meta-ti@yoctoproject.org
X-Spam_score: -0.2
X-Spam_score_int: -1
X-Spam_bar: /
Subject: OE Changelog since 2013-09-08 until 2013-09-15
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
X-List-Received-Date: Mon, 16 Sep 2013 20:03:52 -0000
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable

Changelog since 2013-09-08 until 2013-09-15.  Projects included in this =
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

Alexandru DAMIAN (2):
=20=20bitbake: runqueue: add sceneQueueTaskCompleted event
=20=20bitbake: xmlrpc: delete unused code BitBakeUIEventServer

Richard Purdie (9):
=20=20utils: Fix BB_PRESERVE_ENV
=20=20data_smart: Account for changes in append/prepend/remove in the =
config hash
=20=20cooker: Drop obsolete worker test
=20=20cooker: Clean up init/reset configuration code
=20=20cooker: Rename confusing 'stop' state to 'forceshutdown'
=20=20cooker/command: Add finishcommand to reset cooker state
=20=20command: Treat empty messages as failures, not CommandCompleted
=20=20knotty: Cleanup error/interruption handling
=20=20cooker: updateCache should rause exceptions, not sys.exit

Robert Yang (2):
=20=20providers.py: enhance the runtime debug degbug messgae
=20=20runqueue.py: check whether multiple versions of the same PN are due =
to be bu

=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D
Changelog for openembedded-core:

Bruce Ashfield (2):
=20=20linux-yocto/3.10: bump kver to 3.10.11
=20=20linux-yocto/3.10: genericx86 meta data factoring

Chen Qi (6):
=20=20ptest.bbclass: fix error on ubuntu host
=20=20ptest.bbclass: add cleandirs flag to do_install_ptest_base
=20=20mount.sh: automount cdrom device even if no ID_FS_TYPE available
=20=20init-live.sh: distinguish between a read-only image and a read-write =
image
=20=20sysvinit: fix indentation
=20=20sysvinit: remove unused files

Hongxu Jia (1):
=20=20LSB Command Check: fix install_initd and remove_initd not found

Jo=C3=A3o Henrique Ferreira de Freitas (1):
=20=20boot-directdisk: Allow for EFI-only boot direct disk images

Kai Kang (1):
=20=20midori: excluded from mips64 temporarily

Khem Raj (3):
=20=20systemd: Fix build with multilib
=20=20eglibc_2.18.bb: Fix IFUNC support for ARM REL relocations
=20=20elfutils-native: Fix build on distros with gcc 4.8

Laurentiu Palcu (6):
=20=20meta-environment: change package name to include MACHINE
=20=20packagegroup-cross-canadian: change package name to include MACHINE
=20=20populate_sdk_base.bbclass: select the proper cross-canadian package
=20=20meta-toolchain-qt: include the proper cross-canadian package
=20=20adt-installer: allow installation of other machines
=20=20adt-installer: fix opkg repo name

Mark Hatle (1):
=20=20python-smartpm: Add an attempt install mode

Maxin B. John (1):
=20=20dbus-ptest: fix populate_sdk error

Ming Liu (1):
=20=20initscripts: filter out empty lines from volatiles in =
check_requirements()

Muhammad Shakeel (7):
=20=20openssh: Add systemd support
=20=20lighttpd: Add systemd support
=20=20rpcbind: Add systemd support
=20=20nfs-utils: Add systemd support
=20=20systemd: Remove base_libdir if installed only for systemd_unitdir
=20=20oprofileui-server: Add systemd support
=20=20apmd: Add systemd support

Otavio Salvador (1):
=20=20u-boot, u-boot-fw-utils-cross, u-boot-mkimage: Upgrade to 2013.07

Paul Eggleton (1):
=20=20bitbake.conf: include machine name in DEPLOY_DIR_IMAGE

Paul Woegerer (3):
=20=20lttng-ust: Update to version 2.3.0
=20=20lttng-tools: Update to version 2.3.0
=20=20lttng-modules: Update to version 2.3.0

Peter Kjellerstedt (2):
=20=20bb-matrix: Clean before, rather than after, building
=20=20bb-matrix-plot: Use interpolation for sparse data

Richard Purdie (9):
=20=20image/populate_sdk: Ensure symlinks in target sysroot are relative
=20=20uclibc: Add missing DEPENDS on kern-tools-native
=20=20populate_sdk_rpm: Ensure empty strings aren't passed to attemponly =
rpm code
=20=20populate_sdk_rpm: Only remove trailing whitespace, not all whitespace
=20=20libnewt-python: Don't write a whiptail package
=20=20bitbake.conf: Stop providing ${P} and ${PF} by default
=20=20layer.conf: Version bump for DEPLOY_DIR layout change
=20=20bitbake.conf/package: Collapse PKGDATA_DIR into a single machine =
specific di
=20=20linux-libc-headers: Add big warning about antisocial behaviour

Robert Yang (2):
=20=20perf: source should be ready after do_unpack
=20=20icu-native: do_install: Segmentation fault

Ross Burton (14):
=20=20mesa: use distro_features_check to abort build without opengl feature
=20=20xf86-video-intel: allow builds without opengl, add more options
=20=20systemd: update patch header and comments
=20=20avahi: use correct names in SYSTEMD_SERVICE_* variables
=20=20qemu: only depend on mesa-driver-swrast if opengl is enabled
=20=20ia32-base: only depend on GL if opengl DISTRO_FEATURE enabled
=20=20xf86-video-vesa: change depends to refect reality
=20=20xf86-video-intel: disable DRI2 tests if no DRI2 is available
=20=20xf86-video-vmware: respect opengl DISTRO_FEATURE
=20=20x11vnc: add dependencies for xrandr/xfixes/xdamage/xtst
=20=20clutter: fix compilation when building without X11 backend
=20=20weston: as weston-launch depends on PAM, control it with a =
PACKAGECONFIG
=20=20anjuta-remote-run: remove
=20=20xf86-video-vmware: disable VMWGFX

Roy Li (2):
=20=20btrfs-tools: fix a parallel build issue
=20=20ptest-runner: trivial fixes and refine

Roy.Li (3):
=20=20sstate.bbclass: fix parallel building issue
=20=20systemd: link runlevel from systemctl
=20=20systemd: add ptest

Saul Wold (5):
=20=20qemu.inc: remove apm as a MACHINE_FEATURE
=20=20cmake.bbclass: ensure CMAKE_SYSTEM_NAME is correct
=20=20gstreamer-plugins: Change anonymous python structure
=20=20systemd.bbclass: get the correct /lib directory
=20=20bluez4/5: Add EXCLUDE_FROM_WORLD =3D 1

Stefan Seefeld (1):
=20=20lttng: Enable ptest support.

Stefan Stanacar (4):
=20=20classes/package_rpm: remove unsed outdir variable
=20=20lib/oeqa/runtime: smart: limit channel add to useful ones
=20=20lib/oeqa/runtime: timeout increases
=20=20scripts/contrib/build-perf-test.sh: record size in kb and remove =
extra space

Ting Liu (1):
=20=20libcroco: disable Bsymbolic if it is not supported on some hosts

Tudor Florea (1):
=20=20kmod: avoid parallel-tests

=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D
Changelog for meta-openembedded:

Chunrong Guo (1):
=20=20daq: add recipe

Fathi Boudra (1):
=20=20fping: add recipe

Jonathan Liu (4):
=20=20qt-creator: update to 2.8.1
=20=20xf86-video-ati: add missing xserver-xorg-module-exa RDEPENDS
=20=20lmbench: specify configuration for systemd-tmpfiles --update
=20=20nostromo: specify configuration for systemd-tmpfiles --update

Maxin B. John (1):
=20=20log4cplus: add recipe

Peter Bigot (1):
=20=20vim: workaround nawk dependency problem with RPM

Yevhen Kyriukha (1):
=20=20cryptsetup: Updated to upstream version.

=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D
Changelog for meta-angstrom:

Khem Raj (1):
=20=20angstrom-core-tweaks: Turn weaker assignment for EXTRA_IMAGE_FEATURES =
into a

Koen Kooi (1):
=20=20drop recipe_sanity bbclass

=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D
Changelog for meta-arago:

Denys Dmytriyenko (2):
=20=20arago-qt4: undo RRECOMMENDS for eglibc-gconv-utf-16
=20=20packagegroup-*connectivity*: disable ti-compat-{wireless,bluetooth} =
for now=20

Franklin S. Cooper Jr (3):
=20=20tisdk-install: Move SDK installation script
=20=20packagegroup-arago-tisdk-amsdk-sdk-host: Include install script in =
the sdk
=20=20libnl: Pull in version 2.0 from oe-core

=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D
Changelog for meta-beagleboard:

=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D
Changelog for meta-browser:

Martin Jansa (1):
=20=20firefox: add nss libraries to PRIVATE_LIBS and add dependency on =
external ns

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

Alexandre Belloni (1):
=20=20barebox: drop 2012.02.0 support

=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D
Changelog for meta-fsl-arm-extra:

Alexandre Belloni (2):
=20=20pointercal-xinput: add calibration for cfa10057 and cfa10058
=20=20formfactor: add cfa10057 and cfa10058 information

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

Richard Purdie (2):
=20=20meta-tlk/base-files: Drop unneeded PR bump
=20=20emgd-driver-bin: Fix RDEPENDS and exclude from world

Ross Burton (1):
=20=20xf86-video-mga: respect opengl DISTRO_FEATURE

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

=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D
Changelog for meta-smartphone:

=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D
Changelog for meta-ti:

Denys Dmytriyenko (4):
=20=20ti-ocf-crypto-module: let module.bbclass package modules automatically
=20=20ti-pru-sw-edma-driver: let module.bbclass package modules =
automatically
=20=20omap3-sgx-modules: add automatic selection between softfp and hardfp =
binarie
=20=20libgles-omap3: add automatic selection between softfp and hardfp =
binaries

=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D
Changelog for meta-webos:

Alekseyev Oleksandr (1):
=20=20webos-image: luna-service2=3D154,v3.5.1

Herb Kuta (2):
=20=20base-files: Create /media/internal to be writeable by all
=20=20webos_enhanced_submissions, webos_submissions: Switch to use =
WEBOS_VERSION

Hongjeon Ha (1):
=20=20webos-image: pmloglib=3D39, pmlogdaemon=3D109

Jeongseok Kim (1):
=20=20gtkmm-utils: Fix definition of LOG_VERBOSE_D

Juhee Cho (2):
=20=20sdparm: Add recipe for v1.08
=20=20gptfdisk: Add recipe for v0.8.7

Mark Bessey (1):
=20=20webos-image: nodejs-module-webos-sysbus=3D30

Martin Jansa (5):
=20=20recipes: Replace PR_append with EXTENDPRAUTO_append
=20=20Rename WEBOS_GIT_TAG to WEBOS_GIT_PARAM_TAG
=20=20webos_enhanced_submissions: Add sanity check for tags
=20=20Convert PREFERRED_VERSION to WEBOS_VERSION settings in recipes
=20=20packagegroup-*: Add comment about changed policy on PR bumps

Martin Unsal (1):
=20=20webos_lttng.bbclass: Add bbclass for LTTng tracing

Roger Stringer (4):
=20=20webos-image: db8=3D81
=20=20webos-image: luna-prefs=3D2
=20=20webos-image: luna-sysservice=3D8
=20=20webos-image: configurator=3D53

=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D
Changelog for meta-xilinx:

=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D
Changelog for meta-yocto:

Bruce Ashfield (1):
=20=20meta-yocto-bsp: bump reference BSPs to v3.10.11

Maxin B. John (1):
=20=20beagleboard: update the dts location

Ross Burton (1):
=20=20yocto-bsp: conditionalise mesa-swrast on opengl in templates

Saul Wold (2):
=20=20beagelboard.inc: remove apm as a MACHINE_FEATURE
=20=20yocto-bsp: remove apm as a default MACHINE_FEATURE

=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D
Changelog for openembedded:



