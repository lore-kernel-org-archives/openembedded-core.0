Return-Path: <cliff.brake@gmail.com>
Received: from bec-systems.com (u15414263.onlinehome-server.com
	[74.208.70.121])
	by mail.openembedded.org (Postfix) with ESMTP id 047286D881;
	Mon, 25 Nov 2013 16:39:17 +0000 (UTC)
Received: from oh-67-76-203-50.sta.embarqhsd.net ([67.76.203.50]
	helo=happy.bec-systems.com)
	by bec-systems.com with esmtpsa (TLS1.0:DHE_RSA_AES_256_CBC_SHA1:32)
	(Exim 4.71) (envelope-from <cliff.brake@gmail.com>)
	id 1Vkz2z-0000Xo-0K; Mon, 25 Nov 2013 11:30:15 -0500
MIME-Version: 1.0
X-Mailer: Nodemailer (0.3.22; +http://andris9.github.com/Nodemailer/)
Date: Mon, 25 Nov 2013 16:38:56 GMT
Message-Id: <1385397536428.acb8ed4c@Nodemailer>
From: cliff.brake@gmail.com
To: openembedded-core@lists.openembedded.org,
	openembedded-devel@lists.openembedded.org,
	angstrom-distro-devel@linuxtogo.org, meta-ti@yoctoproject.org
X-Spam_score: -2.9
X-Spam_score_int: -28
X-Spam_bar: --
Subject: OE Changelog since 2013-11-17 until 2013-11-24
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
X-List-Received-Date: Mon, 25 Nov 2013 16:39:18 -0000
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable

Changelog since 2013-11-17 until 2013-11-24.  Projects included in this =
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
=20=20bitbake: cooker, toaster: mark interrupted builds as failed
=20=20toasterui: fix typo

Konrad Scherer (1):
=20=20serv.py: Give pr-server up to 5 seconds to commit data

Paul Eggleton (1):
=20=20bitbake-layers: avoid loading configuration when not needed

Peter Seebach (1):
=20=20build.py: add single-quotes around already-expanded directory name

Richard Purdie (9):
=20=20git: Use merge-base instead of log for testing if a commit is present
=20=20git: Use git branch for ancestor checks
=20=20fetch2: Fix handling of SCM mirrors in MIRRORS
=20=20runqueue: Fix hole in setsceneverify skipped task logic
=20=20fetch2: Clean up some url parameters to functions
=20=20fetch2: Stop passing around the pointless url parameter
=20=20runqueue/bitbake-worker: Fix dry run fakeroot issues
=20=20perforce: Fix path subdirectory issues
=20=20data: Fix output inconsistencies for emit_var

Saul Wold (1):
=20=20cooker: add support for using % as a wildcard in bbappend filename

Valentin Popa (1):
=20=20HOB: Show warnings in Issues tab

=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D
Changelog for openembedded-core:

Baogen Shang (2):
=20=20acpid: fix acpid boot error
=20=20acpid: fix acpid break down

Carlos Rafael Giani (1):
=20=20gstreamer1.0: upgrade to 1.2.0

Chen Qi (3):
=20=20sysvinit: fix problem in switching runlevels
=20=20license.bbclass: fix missing of license files on ubuntu build host
=20=20sysvinit: use ALTERNATIVE to manage sulogin

Chong Lu (1):
=20=20lttng-tools: Fixes incorrect path of ptest cases

Chunrong Guo (1):
=20=20mdadm: flag __SANE_USERSPACE_TYPES__ to include int-ll64.h for =
powerpc64

Cristian Iorga (2):
=20=20ofono: upgrade to 1.13
=20=20telepathy-idle: upgrade to 0.2.0

Cristiana Voicu (2):
=20=20at-spi2-core: upgrade to 2.10.2
=20=20liburcu: upgrade to 0.8.1

Dominik Holland (1):
=20=20dbus: Don't depend on dbus-ptest-ptest for the nativesdk-dbus package

Florin Sarbu (1):
=20=20systemd: Fix packaging of pam config files.

Hans Beckerus (1):
=20=20initscripts: add missing dmesg.sh to run-level S

Hongxu Jia (4):
=20=20kernel-grub.bbclass: support /boot area within root partition
=20=20lib32-qt4-examples: fix QA warnings and INSANE_SKIP not work
=20=20xorg-driver: fix qa issue while multilib enabled - contains Xorg =
driver but=20
=20=20kconfig-frontends: add python to kconfig-frontends's RDEPENDS

Irina Patru (1):
=20=20distrodata.bbclass: Add fetch2 handlers to svn case in checkpkg

Jack Mitchell (1):
=20=20libjson: update to 0.11 and rename to json-c

Jackie Huang (1):
=20=20gettext-minimal-native/iconv.m4: remove the test to convert euc-jp

Jeffrey C Honig (1):
=20=20rootfs_*.bbclass: List which post-install scripts can not be run

Khem Raj (3):
=20=20tcl: Install header into 8.6 instead of PN-PV in user/include
=20=20libnl: Fix random segfaults due to memory corruption
=20=20gcc: Upgrade to 4.8.2

Laurentiu Palcu (1):
=20=20flex: fix m4 issue on target

Lei Liu (3):
=20=20base.bbclass: Fix incorrect setting of multilib =
PREFERRED_PROVIDER_virtual_p
=20=20package_rpm.bbclass: Replace -linux-gnun32 with -linux.* in RPM =
platform fil
=20=20syslinux: use cross toolchain to compile

Lu Chong (1):
=20=20util-linux: Fix QA warnings about ALTERNATIVES

Mark Hatle (1):
=20=20util-linux: Package readprofile into it's own package

Martin Jansa (2):
=20=20packagegroup-core-boot: Drop build-time dependency on virtual/kernel
=20=20nfs-utils: Add new option to disable nfsidmap and PACKAGECONFIG for =
that

Mihaela Sendrea (1):
=20=20expect: Add recipe

Mike Crowe (2):
=20=20Revert "kernel.bbclass: move bundle_initramfs after =
kernel_link_vmlinux"
=20=20kernel.bbclass: Stop bundle_initramfs thwarting sstate cache and fix =
race

Ming Liu (4):
=20=20grub: add xz RDEPENDS
=20=20qemu: explicitly disable xen support
=20=20kernel.bbclass: move bundle_initramfs after kernel_link_vmlinux
=20=20gst-ffmpeg: fix CVE-2013-3674

Olof Johansson (1):
=20=20json-c: do rm -f on config.status before do_configure

Otavio Salvador (1):
=20=20lttng-modules: Update to 2.3.3 version

Paul Barker (3):
=20=20opkg: Update to version 0.2.0
=20=20opkg: Add PACKAGECONFIG options
=20=20opkg: Don't use update-alternatives

Paul Eggleton (2):
=20=20buildhistory_analysis: fix error when comparing image contents
=20=20ia32-base.inc: remove eee-acpi-scripts from MACHINE_EXTRA_RRECOMMENDS

Paul Woegerer (2):
=20=20lttng-ust: Update to version 2.3.1
=20=20lttng-tools: Update to version 2.3.1

Peter Kjellerstedt (14):
=20=20pybootchartgui: Import pybootchartgui 0.14.5
=20=20pybootchartgui: Make the horizontal scaling stay within bounds
=20=20pybootchartgui: Set the initial state of "Show more" correctly
=20=20pybootchartgui: Correct the X offset for the chart
=20=20pybootchartgui: Use correct header height
=20=20pybootchartgui: Avoid having overlapping process bars
=20=20pybootchartgui: No need to do a double list comprehension over files
=20=20pybootchartgui: Disable options that do not make sense
=20=20pybootchartgui: Draw a lot less ticks
=20=20pybootchartgui: Make "Show more" show all processes
=20=20pybootchartgui: Make bars without a specified color white
=20=20pybootchartgui: Reorder the legend to match the task execution order
=20=20pybootchartgui: Add a color for the package_write_* tasks
=20=20pybootchartgui: Add option --minutes to show time in minutes

Phil Blundell (3):
=20=20boost: Add patch to avoid undefined references to =
boost::atomic::lockpool::g
=20=20kernel.bbclass: Use lzma not lzmash for decompressing
=20=20bitbake.conf: Remove obsolete/unused MIRROR cruft

Qiang Chen (1):
=20=20util-linux: collect libs for related libxx-dev package

Richard Purdie (5):
=20=20ia32-base: Remove cpio and ext3 defaults
=20=20buildhistory/distrodata: Adapt to updated fetcher API
=20=20ethtool: Fix ptest compile
=20=20metadata_scm: Avoid crashing on new svn version layouts
=20=20adt-installer: Switch from svn to tarball release for opkg

Ross Burton (11):
=20=20gdk-pixbuf: upgrade to 2.30.1
=20=20libxrandr: upgrade to 1.4.1
=20=20mtdev: upgrade to 1.1.4
=20=20json-glib: upgrade to 0.16.2
=20=20weston: remove reference to gles in PACKAGECONFIG
=20=20librsvg: upgrade to 2.40.0
=20=20matcbox-keyboard: bump SRCREV
=20=20oeqa/connman: disable unique test
=20=20packagegroup-core-tools-profile: add systemd-analyze
=20=20librsvg: move gdk-pixbuf-native dependency
=20=20initscripts: remove erroneous call to /etc/default/rcS in mountnfs.sh

Saul Wold (10):
=20=20sysvinit: unmount the psplash lazyily
=20=20sysstat: upgrade to 10.2.0
=20=20libcheck: upgrade to 0.9.11
=20=20libpcre: Cleanup FILESPATH
=20=20squashfs-tools: remove FILESEXTRAPATH and move patches directory
=20=20qemu-helper-native: remove unneeded FILESEXTRAPATH
=20=20image_types: newer btrfs.mkfs needs an empty file to build the disk in
=20=20btrfs-tools: Update to git HEAD
=20=20kconfig-frontends: upgrade to 3.12.0.0
=20=20security_flags: grub-efi-natve does not build with flags enabled

Tobias Henkel (1):
=20=20icecc: Use bb.utils.which instead of calling which

Valentin Popa (3):
=20=20lighttpd: upgrade to 1.4.33
=20=20libsoup-2.4: upgrade to 2.44.2
=20=20pciutils: upgrade to 3.2.1

Wenzong Fan (1):
=20=20udev: remove extra -dev/-dbg packages

Zhangle Yang (1):
=20=20python: Fix ptest not working problems

=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D
Changelog for meta-openembedded:

Alexandre Tuleu (1):
=20=20emacs: Allows non-x11 build on distribution supporting x11

Anders Darander (1):
=20=20ktap: fix SRCREV for v0.3

Andrea Galbusera (1):
=20=20libmodbus: update to upstream stable version 3.0.5

Andreas M=C3=BCller (2):
=20=20libmpd: sources have moved from sourceforge to musicpd.org
=20=20mpd: update to 0.18.4 and get sources from musicpd.org

Bruce Ashfield (1):
=20=20python-greenlet: uprev to 0.4.1

Chunrong Guo (3):
=20=20libdnet: add recipe
=20=20barnyard2: add recipe
=20=20snort: add recipe

Dan McDougall (1):
=20=20python-futures: New package (provides concurrent.futures)

Hongxu Jia (2):
=20=20accel-ppp: fix qa issue 'found library in wrong location' while =
multilib ena
=20=20mariadb: fix QA Issue ELF binary has relocations in .text while =
multilib ena

Jack Mitchell (4):
=20=20gtkextra: initial add v3.0.5
=20=20libgc: initial add 7.2
=20=20zile: initial add 2.4.9
=20=20libsmi: initial add 0.4.8

Khem Raj (1):
=20=20vim: Disable parallel install, it has races

Martin Jansa (12):
=20=20systemd: Rename .bbappend to match new version from oe-core
=20=20openssh: Rename .bbappend to match new version from oe-core
=20=20tbb: Disable thumb
=20=20rfkill: Fix build when WORKDIR is included in some git checkout
=20=20log4cplus: Fix LIC_FILES_CHKSUM
=20=20meta-efl: upgrade efl to 1.7.9, e-wm to 0.17.5
=20=20libdvdread: Use _remove operator to drop silent rules
=20=20ofono: Rename .bbappend to match new version from oe-core
=20=20meta-oe, meta-efl: Restore few MIRROR variables
=20=20fbset-modes: Explicitly set MACHINE_ARCH
=20=20gitignore: Ignore Edit backup files, patches, .rej, .orig, .swp
=20=20lighttpd: Rename .bbappend to match new version from oe-core

Maxin B. John (1):
=20=20ser2net: new package, Serial to network proxy

Olof Johansson (1):
=20=20rsyslog: rename libjson to json-c in DEPENDS

Philip Balister (2):
=20=20uhd: Remove from meta-oe. Now lives in meta-sdr.
=20=20gnuradio: Remove recipes. Now lives in meta-sdr.

Ross Burton (6):
=20=20python-mako: use BBCLASSEXTEND instead of native recipe
=20=20mesa-glut: add Mesa's OpenGL Utility Toolkit implementation
=20=20pinpoint: add missing build dependency on cogl
=20=20pinpoint: add gdk-pixbuf loaders to runtime recommendations
=20=20python-numpy: add native support
=20=20piglit: add OpenGL driver test suite

Samuel Stirtzel (1):
=20=20utouch-mtview: Add missing dependency to libx11

Wenzong Fan (1):
=20=20meta-webserver: Add LAYERVERSION and LAYERDEPENDS

dv@pseudoterminal.org (3):
=20=20orc: version 0.4.18 migrated to oe-core
=20=20htop: upgrade to version 1.0.2
=20=20libopus: upgrade to version 1.0.3

=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D
Changelog for meta-angstrom:

Khem Raj (2):
=20=20systemd: Match bbappend to OE-Core recipe
=20=20Define common mirrors not in OE-Core anymore

=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D
Changelog for meta-arago:

Chase Maupin (5):
=20=20cpuloadgen: Add utility to create variable cpu load
=20=20packagegroup-arago-test: add cpuloadgen package
=20=20input-utils: fix fetch issue
=20=20linaro-pm-qa-utils: include scripts and cpuidle binaries
=20=20gst-plugins-bad: fix gstfbdevsink to avoid segfault

Denys Dmytriyenko (8):
=20=20arago-arm*: update with required KERNEL_IMAGETYPE and UBOOT_LOADADDR =
vars
=20=20qt-provider: split out setting variables into own class
=20=20nativesdk-qtbase: add nativesdk version of qtbase necessary for SDK =
tools
=20=20nativesdk-qttools: add nativesdk version of qttools necessary for SDK =
tools
=20=20nativesdk-packagegroup-arago-qte-toolchain-host: update to support =
Qt4 and Q
=20=20packagegroup-arago-qt5-toolchain-target: add Qt5-specific version
=20=20meta-toolchain-arago-qte: update to support Qt4 and Qt5 SDK
=20=20meta-toolchain-arago-qte: update qt.conf in SDK with host variables

Franklin S. Cooper Jr (7):
=20=20packagegroup-arago-tisdk-amsdk-sdk-host: Remove board port git =
repositories
=20=20board-port-labs: Remove board port labs recipe
=20=20packagegroups-arago-tisdk-graphics: Add AM43x as a supported platform
=20=20ti-tisdk-makefile: Add DTB support for AM43x and AM335x
=20=20ti-tisdk-makefile: Fix linux_install
=20=20ti-tisdk-setup: Pull in fix to sd card creation script
=20=20packagegroup-arago-tisdk-matrix: Add additional example application =
for AM43

=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D
Changelog for meta-beagleboard:

=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D
Changelog for meta-browser:

Prabhu Sundararaj (1):
=20=20ninja-native: update to Version 1.4

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

Andrea Adami (8):
=20=20linux-yocto(-tiny-kexecboot): collie: add locomolcd suspend-resume =
patch
=20=20linux-yocto-dev: h1940: update defconfig
=20=20linux-yocto-tiny-kexecboot: initial defconfig updates for 3.10
=20=20linux-yocto: tosa: add keymap patch to all kernels up to 3.12
=20=20linux-yocto-tiny-kexecboot: add iso8859_1 and codepage 437 for (V)FAT
=20=20linux-yocto-dev: collie: sync patches for 3.12 with linux-yocto
=20=20linux-yocto-handhelds.inc: split and remove, now we have more machines
=20=20linux-yocto-tiny-kexecboot: use mini defconfig and patches in SRC_URI

=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D
Changelog for meta-igep:

=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D
Changelog for meta-intel:

Ross Burton (1):
=20=20gstreamer-vaapi: fix tarball checksums

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

Martin Jansa (1):

=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D
Changelog for meta-ti:

Denys Dmytriyenko (6):
=20=20libgles-omap3: add new Graphics SDK 5.00.00.01 alpha release
=20=20omap3-sgx-modules: add new Graphics SDK 05.00.00.01 alpha release
=20=20libgles-omap3: update cputype to support 3.12 and AM43x device
=20=20recipes-bsp: add recipe for PowerVR SGX544MP2 kernel drivers
=20=20linux-ti-glsdk: omap5-sevm DTB no longer exists
=20=20linux-ti-staging: 3.12.1, SGX DT, fixes in audio/display, =
connectivity, pm,=20

Franklin S. Cooper Jr (2):
=20=20libgles-omap3: Add support for AM43x in common libgles-omap3 include =
files
=20=20ti43x.inc: Add SGX as MACHINE_FEATURES

Mrinmayee Hingolikar (3):
=20=20u-boot-glsdk: update to latest fixes
=20=20abefw: firmware for OMAP4 and OMAP5 ABE
=20=20libgles: added OMAP5 libs for graphics acceleration

=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D
Changelog for meta-webos:

Alekseyev Oleksandr (2):
=20=20webos-image: luna-service2=3D162,v3.5.2
=20=20luna-service2: Force LTTng tracepoints off unless explicitly enabled

Alexandr Smoktal (1):
=20=20webos-image: luna-sysservice=3D19

Anatolii Sakhnik (2):
=20=20webos-image: luna-service2=3D163,v3.5.3
=20=20webos-image: luna-prefs=3D3

Gayathri Srinivasan (1):
=20=20webos-image: nodejs-module-webos-pmlog=3D16

Hongjeon Ha (2):
=20=20webos-image: pmloglib=3D46 pmklogd=3D16
=20=20webos-image: pmlogdaemon=3D114

Iyad Qumei (2):
=20=20webos-preferred-providers: Add webos-shutdownscripts to initscripts
=20=20webos-image: Switch to non-GPLv3 versions of bash, gzip, readline & =
tar

Keith Derrick (3):
=20=20webos-image: sleepd=3D23
=20=20webos-image: sleepd=3D24
=20=20webos-image: luna-service2=3D164

Maksym Sditanov (4):
=20=20webos-image: db8=3D96
=20=20webos-image: db8=3D97 configurator=3D56 activitymanager=3D120
=20=20webos-filesystem-paths: Add location of db8 media directory
=20=20meta-webos: db8=3D98 cmake-modules-webos=3D19

Mark Bessey (1):
=20=20webos-image: mojoservicelauncher=3D80

Martin Jansa (4):
=20=20webos.inc: Change default PACKAGE_ARCH to MACHINE_ARCH
=20=20webos-image: smartkey-hun=3D11
=20=20smartkey-hun: Split data off into a separate package
=20=20smartkey-hun: Create .inc file usable for Qt5 version

Mykola Kryvonos (1):
=20=20webos-image: libpbnjson=3D26,v2.2.0

Nikolay Orliuk (2):
=20=20tzdata: Add bbappend to setup writable conf files
=20=20webos-image: luna-sysservice=3D22

Seongho Kim (1):
=20=20webos-image: alljoyn=3Dv3.4.2

Seonho Park (1):
=20=20base-files: Create /var/preferences

heekwon kang (1):
=20=20webos-image: activitymanager=3D119

=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D
Changelog for meta-xilinx:

Nathan Rossi (2):
=20=20linux-xlnx: Backport kernel change for traceevent
=20=20boards/zedboard: Fix Ethernet PHY dts node

=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D
Changelog for meta-yocto:

Bastien JAUNY (1):
=20=20yocto-bsp: Add missing format specifier in bblayers error message

Paul Eggleton (1):
=20=20genericx86-common.inc: add eee-acpi-scripts to =
MACHINE_EXTRA_RRECOMMENDS

Ross Burton (1):
=20=20poky.conf: enable ptest distro feature

=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D
Changelog for openembedded:



