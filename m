Return-Path: <cliff.brake@gmail.com>
Received: from bec-systems.com (u15414263.onlinehome-server.com
	[74.208.70.121])
	by mail.openembedded.org (Postfix) with ESMTP id B85186B368;
	Wed, 21 Aug 2013 17:25:18 +0000 (UTC)
Received: from oh-67-76-203-50.sta.embarqhsd.net ([67.76.203.50]
	helo=happy.bec-systems.com)
	by bec-systems.com with esmtpsa (TLS1.0:DHE_RSA_AES_256_CBC_SHA1:32)
	(Exim 4.71) (envelope-from <cliff.brake@gmail.com>)
	id 1VCC3y-0000MI-FB; Wed, 21 Aug 2013 13:19:27 -0400
MIME-Version: 1.0
X-Mailer: Nodemailer (0.3.22; +http://andris9.github.com/Nodemailer/)
Date: Wed, 21 Aug 2013 17:25:01 GMT
Message-Id: <1377105901160.77d2444e@Nodemailer>
From: cliff.brake@gmail.com
To: openembedded-core@lists.openembedded.org,
	openembedded-devel@lists.openembedded.org,
	angstrom-distro-devel@linuxtogo.org, meta-ti@yoctoproject.org
X-Spam_score: -2.9
X-Spam_score_int: -28
X-Spam_bar: --
Subject: OE Changelog since 2013-08-11 until 2013-08-18
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
X-List-Received-Date: Wed, 21 Aug 2013 17:25:19 -0000
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable

Changelog since 2013-08-11 until 2013-08-18.  Projects included in this =
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
=20=20hob/retrieveimagedialog: change labels

Paul Eggleton (2):
=20=20runqueue: report close matches for an invalid task name
=20=20taskdata: report close matches with NoProvider errors

Richard Purdie (1):
=20=20hob: Add missing file from previous commit

=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D
Changelog for openembedded-core:

Alexandru Palalau (1):
=20=20lib/oeqa/runtime: add new systemd tests

Chen Qi (13):
=20=20grub_0.97: Fix to correctly ship files under /usr/lib
=20=20opkg.inc: remove the obsolete POSTLOG variable
=20=20makedevs: support using user/group names in device table files
=20=20image.bbclass: create device table after package installation
=20=20device_table-minimal.txt: use user/group names instead of uid/gid
=20=20init-live.sh: make $ROOT_MOUNT/media writable when necessary
=20=20udev: remove implicit dependency on initscripts
=20=20populate-volatile.sh: use $ROOT_DIR/var/volatile/tmp as TMPDIR
=20=20populate-volatile.sh: don't spawn background process at rootfs time
=20=20runqemu-internal: fix to start X correctly in live images
=20=20populate-volatile.sh: use 'cp -a' to avoid potential problem
=20=20irda-utils: fix for read-only rootfs
=20=20openssh: fix for read-only rootfs

Cristiana Voicu (3):
=20=20systemtap: upgrade to 2.3
=20=20sudo: upgrade to 1.8.7
=20=20cronie: upgrade to 1.4.11

Darren Hart (1):
=20=20kernel.bbclass: Correct post(inst|rm) package association

Jukka Rissanen (1):
=20=20procps: Add cgroup support

Kai Kang (1):
=20=20dpkg: fix include header caused compile error

Khem Raj (2):
=20=20qemu: Skip it for mips64 target
=20=20qemu: Fix bit extraction for MTFSFI and MTFSF

Mark Hatle (3):
=20=20rpm: Change references from RPM_VENDOR_POKY to RPM_VENDOR_OE
=20=20rpm: Enable compatibility with older RPM packages that have invalid =
platform
=20=20image.bbclass: Move runtime_mapping_rename to avoid conflict w/ =
multilib

Martin Jansa (6):
=20=20at-spi2-core: add intltool-native dependency
=20=20gst-plugins-gl: add dependency on glew
=20=20xeyes: add dependency on libxrender
=20=20xrestop: add dependency on ncurses
=20=20qemu, default-providers: Add mesa as default virtual/egl
=20=20classes/buildhistory: record size of installed package not compressed =
archiv

Mike Looijmans (1):
=20=20linux-dtb.inc: Replace /boot/ with /${KERNEL_IMAGEDEST}/

Muhammad Shakeel (3):
=20=20lighttpd: Replace spaces with tabs in shell function
=20=20rpcbind: Replace spaces with tabs in shell function
=20=20nfs-utils: Replace spaces with tabs in shell function

Otavio Salvador (2):
=20=20blacklist.bbclass: Avoid blacklist specific handle in base.bbclass
=20=20linux-dtb: Use kernel build system to generate the dtb files

Paul Barker (1):
=20=20opkg: Fix possible installation of GPLv3 header

Paul Eggleton (12):
=20=20yasm: add from meta-oe and tweak
=20=20x264: add from meta-oe, update and tweak
=20=20libav: add from meta-oe, update and tweak
=20=20gst-ffmpeg: merge in bbappend from meta-oe
=20=20gst-ffmpeg: enable using yasm during build
=20=20gst-ffmpeg: set SUMMARY instead of DESCRIPTION
=20=20classes/buildhistory: remove default of BUILDHISTORY_CHECKVERBACKWARDS
=20=20classes/buildhistory: show command line in commit message
=20=20classes/buildhistory: tag last 3 build revisions
=20=20classes/buildhistory: avoid mangling names in dot graphs for images
=20=20buildhistory-diff: improve command-line handling
=20=20buildhistory-collect-srcrevs: match new buildhistory-diff command =
line parsi

Ross Burton (6):
=20=20mesa: fix and enable out-of-tree builds
=20=20oe-setup-builddir: substitute ##OEROOT## when using templates
=20=20cogl: GL/GLX feature cleanup
=20=20libmatchbox: upgrade to 1.11
=20=20matchbox-wm: fix icon handling on 64-bit hosts
=20=20wipe-sysroots: don't assume TMPDIR is under BUILDDIR

Saul Wold (5):
=20=20groff: Fix License to be GPLv3
=20=20groff: Add GPLv2 version
=20=20meta-skeleton: Add busybox config fragment example
=20=20meta-skeleton: layer.conf Should also have .bbappend in example
=20=20texinfo: add perl RDEPENDS and fix up packaging

Stefan Herbrechtsmeier (1):
=20=20cmake.bbclass: Don't use packages from the native build machine

Stefan Stanacar (3):
=20=20classes/testimage: create a link for qemu boot log
=20=20oeqa/utils/qemurunner: get ip old fashioned way and use tcp serial =
console
=20=20lib/oeqa/runtime: rework syslog test

=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D
Changelog for meta-openembedded:

Bob Ham (1):
=20=20python-edje: Fix building by preventing attempted use of examples

Fathi Boudra (1):
=20=20sdk: add acpica recipe

Hongxu Jia (16):
=20=20meta-perl creation
=20=20libdbi-perl: add version 1.628
=20=20libdbd-sqlite-perl: add version 1.40
=20=20meta-filesystems creation
=20=20fuse: move to meta-filesystems and upgrade
=20=20owfs: move to meta-filesystems and upgrade
=20=20xfsprogs: move to meta-filesystems and upgrade
=20=20ntfs-3g-ntfsprogs: move to meta-filesystems and upgrade
=20=20fuse-exfat: add version 1.0.1
=20=20exfat-utils: add version 1.0.1
=20=20physfs: move to meta-filesystems
=20=20ifuse: move to meta-filesystems
=20=20smbnetfs: move to meta-filesystems
=20=20sshfs-fuse: move to meta-filesystems
=20=20cramfs: move to meta-filesystems
=20=20f2fs-tools: move to meta-filesystems

Joe MacDonald (2):
=20=20quagga: backport documentation patch
=20=20meta-networking: update BBFILE_COLLECTIONS to networking-layer

Joe Slater (1):
=20=20nostromo: make sure usr/group www-data exist

Khem Raj (1):
=20=20proxy-libintl: rprovide the gettext packages

Martin Jansa (36):
=20=20util-linux: rename .bbappend to match new oe-core version
=20=20gst-ffmpeg: drop .bbappend, moved to oe-core
=20=20imlib2, lightmediascanner: Add PRIVATE_LIBS
=20=20meta-efl: upgrade efl to 1.7.8, e-wm to 0.17.4
=20=20efl: drop .inc and _svn.bb files for libs included in efl.git
=20=20elementary, evas-generic-loaders, e-wm: Drop svn recipes
=20=20ecore: add PACKAGECONFIG for wayland
=20=20elementary: add PACKAGECONFIG for eweather
=20=20evas: add PACKAGECONFIG for harfbuzz
=20=20azy: add glib-2.0 dependency
=20=20claws-mail: add curl dependency
=20=20epiphany: add libgnome-keyring dependency
=20=20fbreader: add sqlite3 dependency
=20=20gcr: add glib-2.0 dependency
=20=20glmark2: add dependency on jpeg
=20=20gmtk: inherit gconf
=20=20gnome-control-center: add libgtop dependency
=20=20gcalctool: move to nonworking
=20=20evolution-data-server: upgrade to 3.2.3
=20=20dates: make it compatible with newer evolution-data-server
=20=20gnome-power-management: add gnome-doc-utils dependency
=20=20goffice: add librsvg dependency
=20=20libgtop: add dependency on intltool-native
=20=20mysql-python: add dependency on mysql
=20=20libwnck(3): add PACKAGECONFIG for startup-notification
=20=20llvm2: add dependency on perl-native
=20=20start-stop-daemon: add dependency on ncurses
=20=20subsurface: add dependency on gconf
=20=20tumbler: add dependency on xfce4-dev-tools-native
=20=20uhd: add dependency on ncurses
=20=20webkit-efl: add dependency on gstreamer
=20=20xfce4-icon-theme: add dependency on intltool-native
=20=20gpsd: add PACKAGECONFIG for bluez
=20=20foxtrotgps: add bluez4 dependency
=20=20gnome-vfs: add PACKAGECONFIG for avahi
=20=20cronie: rename bbappend to match new version from oe-core

Matt Ranostay (1):
=20=20flashrom: Add flashrom recipe

Mihai Prica (1):
=20=20lvm2: Add runtime dependency on bash

Paul Eggleton (3):
=20=20libav: remove
=20=20x264: remove
=20=20yasm: remove

Roy.Li (1):
=20=20quagga: two fixes

=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D
Changelog for meta-angstrom:

=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D
Changelog for meta-arago:

Denys Dmytriyenko (5):
=20=20packagegroup-arago-cross-canadian: fix TRANSLATED_TARGET_ARCH =
mangling for d
=20=20external-arago-toolchain: fix header file conflicts with =
linux-libc-headers
=20=20arago.conf: bump the distro version
=20=20arago-image.inc: preserve opkg database in rootfs
=20=20tisdk-image.bbclass: adjust for SDK sysroots being tune-specific now

=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D
Changelog for meta-beagleboard:

Koen Kooi (2):
=20=20linux-mainline 3.8: bebopr cape fixes
=20=20linux-mainline 3.8: beaglebone HDMI rework

=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D
Changelog for meta-browser:

=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D
Changelog for meta-bug:

=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D
Changelog for meta-chicken:

Mario Domenech Goulart (39):
=20=20gen-egg-recipes: add sqlite3 as external dependency for sql-de-lite
=20=20gen-egg-recipes: add support for setting =
EXTRA_CHICKEN_INSTALL_OPTIONS in re
=20=20gen-egg-recipes: add extra-chicken-install-options for sql-de-lite to =
force=20
=20=20chicken-egg-sql-de-lite: use external sqlite3 library
=20=20gen-egg-recipes: handle EPL licenses and convert them to the string =
expected
=20=20gen-egg-recipes: add persistent-hash-map
=20=20gen-egg-recipes: add fast-generic to self-dependent-eggs
=20=20chicken-egg-clojurian: add recipe for version 0.0.4
=20=20chicken-egg-fast-generic: add recipe for version 0.4
=20=20chicken-egg-persistent-hash-map: add recipe for version 0.0.5
=20=20chicken-egg-type-stubs: add recipe for version 0.0.1
=20=20chicken-egg-typed-records: add recipe for version 0.6
=20=20gen-egg-recipes: add protobuf
=20=20chicken-egg-numbers: add recipe for version 2.8.2
=20=20chicken-egg-protobuf: add recipe for version 1.1.2
=20=20chicken-egg-srfi-4-comprehensions: add recipe for version 1.4
=20=20chicken-egg-srfi-42: add recipe for version 1.72
=20=20chicken-egg-srfi-99: add recipe for version 1.4.0
=20=20gen-egg-recipes: add random-bsd
=20=20chicken-egg-random-bsd: add recipe for version 0.2
=20=20gen-egg-recipes: move http-client to keep eggs sorted alphabetically
=20=20gen-egg-recipes: add vector-lib
=20=20chicken-egg-vector-lib: add recipe for version 1.2.2
=20=20gen-egg-recipes: add sequences
=20=20chicken-egg-sequences: add recipe for version 0.6
=20=20gen-egg-recipes: add slice
=20=20chicken-egg-slice: add recipe for version 1.0
=20=20gen-egg-recipes: add server-test
=20=20chicken-egg-server-test: add recipe for version 0.4
=20=20gen-egg-recipes: add test
=20=20chicken-egg-test: add recipe for version 0.9.9.5
=20=20gen-egg-recipes: add siphash
=20=20chicken-egg-siphash: add recipe for version 0.0.2
=20=20gen-egg-recipes: add describe
=20=20chicken-egg-describe: add recipe for version 0.1
=20=20gen-egg-recipes: add jsmin
=20=20chicken-egg-jsmin: add recipe for version 2.1
=20=20chicken_install.bbclass: add EXTRA_CHICKEN_INSTALL_OPTIONS
=20=20chicken-egg-medea: update to version 0.1.4

=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D
Changelog for meta-efikamx:

=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D
Changelog for meta-ettus:

=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D
Changelog for meta-fsl-arm:

Otavio Salvador (1):
=20=20imx-base.inc: Allow PREFERRED_VERSION of xserver-xorg to be customized

=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D
Changelog for meta-fsl-arm-extra:

Matthias Benesch (3):
=20=20u-boot-imx6dongle: Add u-boot fork of i.MX6 HDMI dongle
=20=20linux-imx6dongle: Add Linux Kernel fork of i.MX6 HDMI dongle
=20=20gk802: Add Zealz GK802 machine configuration

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

Nitin A Kamble (8):
=20=20chiefriver:linux-yocto-3.8: update meta branch srcrev
=20=20crownbay:linux-yocto-3.8: update meta branch srcrev
=20=20emenlow:linux-yocto-3.8: update meta branch srcrev
=20=20fri2:linux-yocto-3.8: update meta branch srcrev
=20=20jasperforest:linux-yocto-3.8: update meta branch srcrev
=20=20nuc:linux-yocto-3.8: update meta branch srcrev
=20=20sugarbay:linux-yocto-3.8: update meta branch srcrev
=20=20sys940x:linux-yocto-3.8: update meta branch srcrev

Paul Eggleton (1):
=20=20yasm: remove

=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D
Changelog for meta-ivi:

Holger Behrens (2):
=20=20dbus: merge two dbus .bbappend's into one
=20=20README.md: add info on what to do with meta-ivi-bsp

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

Erik Bot=C3=B6 (1):
=20=20qt5-5.0.2.inc: update path to sources

Jonathan Liu (1):
=20=20qtbase: add upstream QTBUG-32534 patch for QHttpMultiPart corruption

Laszlo Papp (1):
=20=20qtserialport: Add module

Marek Belisko (1):
=20=20Fix download url for qt5-5.0.2.

Martin Jansa (3):
=20=20qt5-versions: Change default version to 5.1.0
=20=20Revert "qtserialport: Add module"
=20=20qtbase: be more specific in opengl switch with gl in PACKAGECONFIG

Simon Busch (1):
=20=20qtwayland: build and package examples applications too

=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D
Changelog for meta-slugos:

=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D
Changelog for meta-systemd:

=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D
Changelog for meta-raspberrypi:

=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D
Changelog for meta-smartphone:

Martin Jansa (8):
=20=20android-audiosystem: add dependency on alsa-lib
=20=20guitartune: add dependency on alsa-lib
=20=20libshr-glib: add dependency on fso-specs
=20=20mdbus2: add dependency on readline
=20=20numptyphysics: add dependency on glib-2.0
=20=20omext: add dependency on gconf
=20=20openmoocow: add dependency on gtk+

Simon Busch (3):
=20=20meta-android: libhybris: bump SRCREV
=20=20meta-android: android-system-image: correct typo
=20=20meta-android: android-system-image: fixup permissions at install time =
and no

=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D
Changelog for meta-ti:

=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D
Changelog for meta-webos:

Hongjeon Ha (1):
=20=20webos-image: pmloglib=3D37, pmlogctl=3D16

Keith Derrick (1):
=20=20webos-image: sleepd=3D16

Martin Jansa (1):
=20=20db8: Add missing dependency on boost

Viacheslav Belenko (1):
=20=20webos-image: pmcertificatemgr=3D28

Youngeun Kim (1):
=20=20webos-image: luna-sysservice=3D6 sntp=3Dv4.2.6p5 ntp=3D0 =
ntp-tickadj=3D0

=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D
Changelog for meta-xilinx:

Sipke Vriend (4):
=20=20conf:machine: Add zc706 evaluation board support.
=20=20conf:machine Add and modify Zynq dts files.
=20=20recipes-kernel:linux-xlnx Move revision to bb file.
=20=20recipes-kernel:linux-yocto: Set compatible machine to soc family

=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D
Changelog for meta-yocto:

Cristiana Voicu (1):
=20=20package_regex.inc: Add regex for atk

Laurentiu Palcu (1):
=20=20maintainers.inc: reassign maintainers, remove obsolete recipes

Paul Eggleton (1):
=20=20maintainers.inc: add entries for libav, x264 and yasm

=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D
Changelog for openembedded:



