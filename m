Return-Path: <cliff.brake@gmail.com>
Received: from bec-systems.com (u15414263.onlinehome-server.com
	[74.208.70.121])
	by mail.openembedded.org (Postfix) with ESMTP id 02CD160FAF;
	Mon,  7 Oct 2013 19:37:44 +0000 (UTC)
Received: from oh-67-76-203-50.sta.embarqhsd.net ([67.76.203.50]
	helo=happy.bec-systems.com)
	by bec-systems.com with esmtpsa (TLS1.0:DHE_RSA_AES_256_CBC_SHA1:32)
	(Exim 4.71) (envelope-from <cliff.brake@gmail.com>)
	id 1VTGVM-0005J2-UW; Mon, 07 Oct 2013 15:30:18 -0400
MIME-Version: 1.0
X-Mailer: Nodemailer (0.3.22; +http://andris9.github.com/Nodemailer/)
Date: Mon, 07 Oct 2013 19:37:24 GMT
Message-Id: <1381174644755.2a7f2921@Nodemailer>
From: cliff.brake@gmail.com
To: openembedded-core@lists.openembedded.org,
	openembedded-devel@lists.openembedded.org,
	angstrom-distro-devel@linuxtogo.org, meta-ti@yoctoproject.org
X-Spam_score: -2.9
X-Spam_score_int: -28
X-Spam_bar: --
Subject: OE Changelog since 2013-09-29 until 2013-10-06
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
X-List-Received-Date: Mon, 07 Oct 2013 19:37:45 -0000
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable

Changelog since 2013-09-29 until 2013-10-06.  Projects included in this =
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

Cristiana Voicu (1):
=20=20bitbake/hob: removing extra parameters from conf files using hob

Erik Bot=C3=B6 (1):
=20=20lib/bb/monitordisk.py: fix spelling in error text

Paul Eggleton (4):
=20=20bitbake-diffsigs: handle if task name is specified without do_ prefix
=20=20bitbake-diffsigs: refactor argument parsing slightly
=20=20bitbake-diffsigs: improve error handling
=20=20bitbake-dumpsig: introduce command line and error handling

Richard Purdie (5):
=20=20bin/bitbake: Catch establish connection log messages
=20=20xmlrpc: Show a better error message for connection failures
=20=20bin/bitbake: No need to show tracebacks for BBHandledExceptions
=20=20bin/bitbake: Clear ui-queue when starting a server
=20=20bin/bitbake: Clarify server error message

Ross Burton (1):
=20=20utils: use logger.warn instead of print in copyfile

Valentin Popa (1):
=20=20HOB: MACHINE should be saved in conf files using ?=3D

=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D
Changelog for openembedded-core:

Bruce Ashfield (1):
=20=20linux-yocto: enable CONFIG_INPUT_EVDEV as standard policy

Cristian Iorga (1):
=20=20connman-conf: add a global public DNS to network provisioning

David Nystr=C3=B6m (2):
=20=20nativesdk-packagegroup-sdk-host: Add nativesdk-makedevs
=20=20nss: Fix return codes in postinstall

Eric B=C3=A9nard (1):
=20=20qemu: fix nativesdk build without x11

Jason Wessel (2):
=20=20kernel.bbclass: Allow INITRAMFS_TASK to trigger copy initramfs code
=20=20mkefidisk.sh: Allow using a loopback mounted file

Jonathan Liu (2):
=20=20boot-directdisk: ensure generated MBR disk signature is non-zero
=20=20boot-directdisk: avoid loop in MBR disk signature generation

Marius Avram (1):
=20=20slang: fix sprintf bug concerning 8-bit characters

Mark Hatle (2):
=20=20package_rpm.bbclass: Workaround failure in attemptonly installs
=20=20run-postinst: Ensure that the postinsts are ordered

Martin Jansa (12):
=20=20xdpyinfo: Add dependency on libxcomposite
=20=20xf86-input-synaptics: Add dependency on libxtst
=20=20aspell: Add PACKAGECONFIG for curses
=20=20libunique: Add PACKAGECONFIG for dbus
=20=20gstreamer1.0-libav: Add PACKAGECONFIG for orc
=20=20wget: Add dependency on libpcre
=20=20tcl: Add dependency on zlib
=20=20x11vnc: Add PACKAGECONFIG for xinerama
=20=20glib-networking: Add PACKAGECONFIG for p11-kit
=20=20lame: Add dependency on ncurses
=20=20subversion: Add dependency on file for libmagic
=20=20systemd: Add PACKAGECONFIG for cryptsetup

Muhammad Shakeel (3):
=20=20opkg: Use systemd service for first boot configuration
=20=20opkg: ignore result of opkg configure
=20=20systemd-compat-units: Use correct run-postinsts script link

Nathan Rossi (1):
=20=20linux-dummy.bb: Resolve missing task issues

Paul Eggleton (2):
=20=20psplash: copy image files from workdir instead of next to recipe
=20=20dbus: fix QA error building nativesdk-dbus

Richard Purdie (13):
=20=20native: Use a native site file and ensure the correct sed is used
=20=20libtool: Don't patch generated files
=20=20qemu: Add fix for floating point issues on x86-64
=20=20pseudo: Fix race problems
=20=20cross/crosssdl/native/nativesdk: Fix do_packagedata stamps
=20=20gcc-common: Improve fpu code checksum dependencies
=20=20pixman: Fix nativesdk rebuilds for armv7a
=20=20cross-canadian: Fix TUNE_PKGARCH references
=20=20systemd: Track postinst/prerm in task checksum
=20=20udpated-rc.d: Track postinst/prerm/postrm in task checksum
=20=20oe-init-build-env: unset BBSERVER
=20=20oe-init-build-env-memres: Unset BBSERVER if already set
=20=20python: Ensure build completes before install

Ross Burton (3):
=20=20pcmanfm: hide the desktop preferences
=20=20sato-icon-theme: add more compatibility symlinks
=20=20license.bbclass: use shutil instead of bb.utils.copyfile

Roy Li (1):
=20=20makedevs: rectify the exit codes and handle the invalid parameter

Roy.Li (1):
=20=20systemd-compat-units: do not create runlevel command

Saul Wold (2):
=20=20dpkg: Add xz to RDEPENDS
=20=20makedevs: Do not return error if the fifo exisits

Tom Zanussi (3):
=20=20wic: Initial code for wic (OpenEmbedded Image Creator)
=20=20wic: Add mic w/pykickstart
=20=20wic: Add OpenEmbedded-specific implementation

Tudor Florea (1):
=20=20kmod: ptest fixes

=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D
Changelog for meta-openembedded:

Andrea Adami (4):
=20=20linux-yocto-tiny-kexecboot: replace empty tasks with explicit =
[noexec]=3D1
=20=20klcc-cross: disable more unused tasks
=20=20kexecboot(-klibc): upgrade to last upstream commit
=20=20kexecboot: add BBCLASSEXTEND for the klibc static flavor

Andreas M=C3=BCller (10):
=20=20libxfce4ui: avoid dragging in gtk3
=20=20xfce4-vala: update to 4.10.3
=20=20xfce4-cpufreq-plugin: update to 1.1.0
=20=20sound-theme-freedesktop: initial add 0.8.0
=20=20libcanberra avoid gtk3 dragged in at gtk2 environments
=20=20libcanberra: move libtool librarties for modules to dev package
=20=20xfce4-settings: add PACKAGECONFIG for sound-settings
=20=20xfce4-taskmanager: inital add git-version
=20=20xfce4-notes-plugin: initial add 1.7.7
=20=20packagegroup-xfce-extended: add xfce4-taskmanager and =
xfce4-notes-plugin

Chunrong Guo (1):
=20=20libhugetlbfs: add recipe

Eric BENARD (3):
=20=20libsocketcan: upgrade to 0.0.9
=20=20canutils: update recipe
=20=20gnokii: add 0.6.31

Felipe F. Tonello (3):
=20=20gypsy: Improvements in recipes
=20=20gypsy: Added init script
=20=20geoclue: Add recipe for GeoClue 2.0.0

Frederic PAUT (2):
=20=20python-autobahn: Add recipe for 0.5.14
=20=20python-cloudeebus: Add recipe vor 0.6.0

Jack Mitchell (2):
=20=20lmsensors: reset RDEPENDS_${PN}-dev for lmsensors and lmsensors-config
=20=20lmsensors: split out cgi into seperate package

Khem Raj (1):
=20=20opencv: Update SRC_URI to use git

Lukas Bulwahn (3):
=20=20libeigen: initial contribution required by opencv
=20=20opencv: Add libeigen dependency
=20=20opencv: Add PACKAGECONFIG for eigen gtk jpeg libav png tiff v4l

Mario Domenech Goulart (2):
=20=20wvdial: add recipe for version 1.61
=20=20wvstreams: add recipe for version 4.6.1

Marko Lindqvist (1):
=20=20libungif: update to upstream version 4.1.4

Martin Jansa (5):
=20=20krb5: Upgrade to 1.11.3
=20=20krb5: Add PACKAGECONFIG and new configure param to disable keyutils =
detectio
=20=20opencv: Add PACKAGECONFIG for jasper
=20=20thunar: Add PACKAGECONFIG for pcre
=20=20thunar-volman: Add PACKAGECONFIG for notify

Paul Eggleton (2):
=20=20faac: add recipe
=20=20schroedinger: add recipe

Philipp Wagner (1):
=20=20iw: Update to 3.11

Samuel Stirtzel (3):
=20=20utouch-evemu: Add initial recipe
=20=20utouch-frame: Add initial recipe
=20=20utouch-mtview: Add initial recipe

Ting Liu (1):
=20=20tipcutils: add recipe

Yevhen Kyriukha (1):
=20=20usb-modeswitch: upgrade to upstream version.

mike.looijmans@topic.nl (1):
=20=20fuse-exfat, ntfs-3g-ntfsprogs: Move util-linux-mount to RRECOMMENDS

=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D
Changelog for meta-angstrom:

=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D
Changelog for meta-arago:

Chase Maupin (1):
=20=20arago-prefs: Remove U-Boot preferred version

Denys Dmytriyenko (1):
=20=20external-linaro-toolchain: fix "xen" header conflict with =
linux-libc-headers

Franklin S. Cooper Jr (4):
=20=20packagegroup-arago-console: Add additional packages needed to =
partition eMMC
=20=20arago-source-ipk: Preserve latest kernel and u-boot git repository
=20=20arago-source-ipk.conf: Remove PR from u-boot-ti-staging
=20=20meta-toolchain-arago: Remove TARGET_SYS env variable

Siddharth Heroor (1):
=20=20omapconf: update to v1.68

=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D
Changelog for meta-beagleboard:

=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D
Changelog for meta-browser:

=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D
Changelog for meta-bug:

=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D
Changelog for meta-chicken:

Mario Domenech Goulart (1):
=20=20chicken: update to version 4.8.0.5

=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D
Changelog for meta-efikamx:

=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D
Changelog for meta-ettus:

=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D
Changelog for meta-fsl-arm:

Eric BENARD (1):
=20=20imx-base: provide right package for amd-gpu-bin if x11 is disabled

Otavio Salvador (3):
=20=20u-boot-fslc: Avoid native binary builds
=20=20Revert "u-boot-fslc: Avoid native binary builds"
=20=20u-boot-fslc: Add 'openssl-native' dependency for MX23/MX28

=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D
Changelog for meta-fsl-arm-extra:

John Weber (1):
=20=20linux-wandboard: Move repository to wandboard-org's github

=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D
Changelog for meta-fsl-ppc:

Chunrong Guo (1):
=20=20fmlib: fix compile error with linux-libc-headers

=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D
Changelog for meta-guacamayo:

=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D
Changelog for meta-gumstix:

=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D
Changelog for meta-gumstix-community:

=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D
Changelog for meta-handheld:

Andrea Adami (5):
=20=20kexecboot-klibc: remove stale bbappend
=20=20nandlogical: move to 1.1.0 and add BBCLASSEXTEND for the klibc version
=20=20linux-yocto-dev: add new recipe for upcoming 3.12
=20=20linux-yocto: re-enable CONFIG_JFFS2_LZO
=20=20nandlogical: remove unnecessary EXTRA_OEMAKE

=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D
Changelog for meta-igep:

=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D
Changelog for meta-intel:

Nitin A Kamble (8):
=20=20emenlow: linux-yocto v3.8 & v3.10 update srcrevs
=20=20crownbay: linux-yocto v3.8 & v3.10 update srcrevs
=20=20fri2: linux-yocto v3.8 & v3.10 update srcrevs
=20=20sys940x: linux-yocto v3.8 & v3.10 update srcrevs
=20=20sugarbay: linux-yocto v3.8 & v3.10 update srcrevs
=20=20jasperforest: linux-yocto v3.8 & v3.10 update srcrevs
=20=20chiefriver: linux-yocto v3.8 & v3.10 update srcrevs
=20=20nuc: linux-yocto v3.8 & v3.10 update srcrevs

=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D
Changelog for meta-ivi:

Florin Sarbu (1):
=20=20vexpressa9: Use kernel version 3.10

=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D
Changelog for meta-java:

Henning Heinold (10):
=20=20jamvm: update to git revision ac22c9948434e528ece451642b4ebde40953ee7e
=20=20jamvm-native: separate bootclasspath out into shell script
=20=20jamvm-native: set default heap to 1024M via cflags
=20=20openjdk7: update openjdk7 to version 2.3.12
=20=20java-test-image: remove tinylogin from packages to install
=20=20README: update the openjdk7 version to 2.3.12
=20=20openjdk7: download and verify the updated version of cacao
=20=20jaxp1.3/xml-commons: correct licenses
=20=20openjdk7: update checksums of jamvm too
=20=20openjdk: fix qa error for bad rpath inside cacao's libjvm.so

Khem Raj (10):
=20=20icedtea: Make shared state friendly
=20=20java-library.bbclass: consider multilib
=20=20bcel,avalon-framework: Specify encoding to javac
=20=20gnujaf: Fix building with java7
=20=20java-library.bbclass: Export BOOTCLASSPATH and LD_LIBRARY_PATH
=20=20junit: Fix build when rebuilding from same tree
=20=20xerces-j: Specify cp instead of bootclasspath
=20=20dbus-java: User PN instead of hardcoding names
=20=20recipes-core: Correct fastjar cmdline
=20=20classpath: Adjust classpaths when using jamvm from sstate

Riku Voipio (1):
=20=20jamvm/java: allow spaces in arguments

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

Martin Jansa (2):
=20=20qtwebkit: Export RUBYLIB to fix wrong paths hardcoded in native ruby
=20=20README: Add note about qtbase PACKAGECONFIG options

Stefan Schmidt (1):
=20=20maliit: Import maliit recipes from meta-oe

Trevor Woerner (2):
=20=20qtwebkit: fix QA issue (bad RPATH)
=20=20devshell: include PATH for qt5 native applications

=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D
Changelog for meta-slugos:

=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D
Changelog for meta-systemd:

=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D
Changelog for meta-raspberrypi:

=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D
Changelog for meta-smartphone:

Martin Jansa (3):
=20=20android-tools: prevent using headers from host

Sebastian Krzyszkowiak (16):
=20=20meta-fso: update opimd-utils SRCREV and extract .desktop files to =
opimd-util
=20=20meta-shr: add opimd-utils to packagegroup-shr-minimal
=20=20meta-shr: libphone-ui-shr: bump SRCREV
=20=20meta-shr: phonefsod: bump SRCREV
=20=20meta-shr: e-wm-config-illume2-shr: bump SRCREV
=20=20meta-shr: elementary-theme-gry: bump SRCREV
=20=20meta-fso: cornucopia-from-git: bump SRCREV
=20=20meta-shr-distro: preferred-shr-versions: use frameworkd and =
cornucopia from=20
=20=20meta-fso: upgrade libsamsung-ipc to 0.2.0
=20=20meta-openmoko: autoload lis302dl kernel module on gta02
=20=20meta-shr-distro: init-ifupdown: set metric of usb interfaces to 1 to =
allow G
=20=20meta-fso: bring back libsamsung-ipc 0.1.0, it's needed by stable =
cornucopia=20
=20=20meta-fso: libsamsung-ipc: add patch over 0.2.0 to fix broken vapi
=20=20meta-fso: bump cornucopia-from-git SRCREV for fsogsmd build fix with =
latest=20
=20=20meta-shr: bump shr-e-gadgets SRCREV for shr_elm_softkey bugfix

=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D
Changelog for meta-ti:

Denys Dmytriyenko (10):
=20=20linux-omap-2.6.39: remove old beagleboard-specific and not supported =
kernel
=20=20linux-3.0: remove old beagleboard-specific 3.0 and 3.1rc kernel =
recipes
=20=20linux-omap4-3.1.0: remove old pandaboard-specific kernel
=20=20linux-davinci 2.6.32: remove old hawkboard-specific kernel
=20=20linux-omap-psp-2.6.32: remove old linux-omap3 PSP kernel
=20=20linux-keystone: update from 3.6.6 to 3.8.4
=20=20linux-ti-staging: update to 3.12-rc3 with rpmsg, connectivity, audio =
and dis
=20=20linux: set PR from MACHINE_KERNEL_PR, bypass =
machine_kernel_pr.bbclass from=20
=20=20u-boot-ti-staging: update to the latest 2013.10-rc4, README changed =
slightly
=20=20linux-ti-kernel: update with more merges, get devtree files in to =
rootfs

=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D
Changelog for meta-webos:

Alekseyev Oleksandr (2):
=20=20luna-service2=3D155,Disable LS2 security as DISTRO
=20=20webos-image: cmake-modules-webos-native=3D18,1.0.0~rc6

Herb Kuta (1):
=20=20webos-filesystem-paths: Add developer mode locations

Keith Derrick (2):
=20=20webos-image: cmake-modules-webos-native=3D17
=20=20webos-image: nyx-lib=3D69,v6.0.0 nyx-modules=3D92,v6.0.0 =
nyx-utils=3D12

Martin Jansa (5):
=20=20buildhistory.bbclass: Fix build-id.txt growing with each build
=20=20sdparm: Add sg3-utils dependency
=20=20recipes: Update WEBOS_VERSION to use SHA-1 of annotated tags
=20=20webos_system_bus: Don't stage service and role files
=20=20webos_enhanced_submissions: Add new checks on the submission tag

Roger Stringer (2):
=20=20webos-image: db8=3D88
=20=20webos-image: CCC: activitymanager=3D116, smartkey-hun=3D10

Sangwoo Kang (1):
=20=20webos-image: filecache=3D59 pmklogd=3D14 powerd=3D22

Seongho Kim (1):
=20=20alljoyn: Add patch to fix a lot of context switches on idle system

Susan Montooth (1):
=20=20Revert "luna-service2=3D155,Disable LS2 security as DISTRO"

=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D
Changelog for meta-xilinx:

=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D
Changelog for meta-yocto:

Alexandru Palalau (2):
=20=20meta-yocto: updated SANITY_TESTED_DISTROS in poky.conf
=20=20poky.conf: Removed obsolete distros from SANITY_TESTED_DISTROS

Elizabeth Flanagan (2):
=20=20distro_alias.inc: Sort entries
=20=20distro_alias.inc: update distro_alias

Ross Burton (1):
=20=20README.hardware: update genericx86 hardware support

Saul Wold (4):
=20=20upstream_tracking: Update manual checked list
=20=20package_regex: Add python-docutils
=20=20maintainers: Add some maintainers
=20=20distro_alias: Fix missing =3D

Tom Zanussi (1):
=20=20yocto-kernel: Use variable-substituted BBLAYERS

=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D
Changelog for openembedded:



