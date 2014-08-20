Return-Path: <cliff.brake@gmail.com>
Received: from mail-ie0-f170.google.com (mail-ie0-f170.google.com
	[209.85.223.170])
	by mail.openembedded.org (Postfix) with ESMTP id ADE3A60169;
	Wed, 20 Aug 2014 18:45:26 +0000 (UTC)
Received: by mail-ie0-f170.google.com with SMTP id rl12so3414488iec.15
	for <multiple recipients>; Wed, 20 Aug 2014 11:45:27 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=date:mime-version:message-id:from:to:subject:content-type
	:content-transfer-encoding;
	bh=gou9hslrO6aj1Mdhdq/ZC14GGtoJfvnpbJ6t9SJXr7s=;
	b=odUF47NniXiVugUQNa9iS5YwgELZqsbbHKAX+tYcdRB5fc+qJC0dq9sStc7XrJ7ubO
	zPJhBzHtNWaeQAxdLdAflDX+AutGSd5n4XMSG3kZ9PD3y31lFD+2ymXFajp6pLQkjFLu
	V/I8UFmuWjGjcM6cHTUMEYyxv1yteujy/HfN2WwMlhOZaJekduJ0GQOjvDqN7gYqICVO
	wKfSJHdPG2VajoXqFNImDXbDZD1DVs8wAhKo1euqykC1LcYTMYc4P68hkA0faefMVz2j
	Rtjq0HzK2W2oL1u1elA7nzYyNvP1fYOPx9M2deHvmmAXVTIqxXAgdrEaX0+c3NLAcpLL
	xyHQ==
X-Received: by 10.42.70.11 with SMTP id d11mr2345801icj.92.1408560327787;
	Wed, 20 Aug 2014 11:45:27 -0700 (PDT)
Received: from [127.0.0.1] (cable2-pool191-cs-105.doycomm.com.
	[66.219.191.105]) by mx.google.com with ESMTPSA id
	z11sm13963867igm.13.2014.08.20.11.45.26 for <multiple recipients>
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
	Wed, 20 Aug 2014 11:45:26 -0700 (PDT)
Date: Wed, 20 Aug 2014 11:45:26 -0700 (PDT)
X-Google-Original-Date: Wed, 20 Aug 2014 18:45:25 GMT
MIME-Version: 1.0
X-Mailer: Nodemailer (0.3.22; +http://andris9.github.com/Nodemailer/)
Message-Id: <1408560325436.1a852e84@Nodemailer>
From: cliff.brake@gmail.com
To: openembedded-core@lists.openembedded.org,
	openembedded-devel@lists.openembedded.org,
	angstrom-distro-devel@linuxtogo.org, meta-ti@yoctoproject.org
Subject: OE Changelog since 2014-08-10 until 2014-08-17
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
X-List-Received-Date: Wed, 20 Aug 2014 18:45:30 -0000
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable

Changelog since 2014-08-10 until 2014-08-17.  Projects included in this =
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

Andre McCurdy (3):
=20=20curl: add zlib PACKAGECONFIG and remove hardcoded DEPENDS
=20=20curl: let configure find gnutls via pkg-config
=20=20curl: --with-random is only applicable with openssl

Armin Kuster (3):
=20=20tzcode: update to 2014f
=20=20tzdata: update to 2014f
=20=20lz4: update to 120

Chen Qi (2):
=20=20alsa-state: install init script only when 'sysvinit' is in =
DISTRO_FEATURES
=20=20v86d: fix for systemd to load uvesafb module correctly

Christopher Larson (2):
=20=20python-dbus: use PACKAGECONFIG for doc generation
=20=20oe.package_manager: fix use of PACKAGE_EXCLUDE for dpkg

Corneliu Stoicescu (1):
=20=20oeqa/runtime: add new cpp test and file

Cristian Iorga (1):
=20=20qemu: upgrade to 2.1

Gary Thomas (1):
=20=20toolchain-shar-template.sh: Limit xargs command line

Jo=C3=A3o Henrique Ferreira de Freitas (1):
=20=20curl: add ssl to PACKAGECONFIG

Kai Kang (2):
=20=20qemu: enable aarch64 support
=20=20qemu: add PACKAGECONF lzo

Khem Raj (5):
=20=20python: Fix build on musl
=20=20gcc-cross-initial: Use good old bfd linker by default
=20=20gcc: Abstract long double configuration into python function
=20=20gcc-cross-initial: Put limits.h in gccdir/include
=20=20openssl: Repace if-else with case and add musl triplet

Koen Kooi (1):
=20=20kexec-tools: reinstate 'kexec-tools' package

Maciej Borzecki (2):
=20=20cml1.bbclass: fix diffconfig diff command
=20=20wic: include partition label in fs image file name

Marek Vasut (1):
=20=20qt4: Avoid duplicate flags in the g++-unix.conf

Mark Hatle (2):
=20=20prelink_git: Update to current head of cross-prelink development
=20=20tcmode-default.inc: Add eglibc-scripts and eglibc-mtrace

Martin Jansa (14):
=20=20directfb: add PACKAGECONFIG for drmkms and tiff
=20=20test-dependencies, insane.bbclass: improve the message
=20=20gst-fluendo*: add --disable-debug only to gst-fluendo-mp3
=20=20mpeg2dec: add PACKAGECONFIG for x11 and fix dependencies
=20=20libarchive: add PACKAGECONFIG for nettle
=20=20midori: add dependency on libxscrnsaver
=20=20guile: add dependency on ncurses and readline
=20=20kernelshark: add dependency on libxml2
=20=20directfb: add PACKAGECONFIG for webp
=20=20sstate-sysroot-cruft.sh: Improve to use it from CI
=20=20SIGGEN_EXCLUDERECIPES_ABISAFE: add initscripts
=20=20cmake: drop -fpermissive
=20=20piglit: add dependency on libxrender
=20=20gst-ffmpeg: add PACKAGECONFIG for libav9 and patch from Gentoo

Max Eliaser (2):
=20=20bootchart2: create recipe for bootchart2
=20=20ubootchart: delete ubootchart recipe

Maxin B. John (1):
=20=20remake: fix build error

Mike Looijmans (2):
=20=20squashfs-tools: Add support for LZO and LZ4 compression
=20=20Support image type "squashfs-lzo"

Otavio Salvador (3):
=20=20cracklib: Allow use in SDK
=20=20attr: Allow use during build and SDK
=20=20libpam: Allow use during build and in SDK

Paul Barker (1):
=20=20opkg: Protect add-exclude.patch from malloc failure

Paul Eggleton (3):
=20=20openssl: upgrade to 1.0.1i
=20=20libav: update 0.8 version to 0.8.15
=20=20libav: update 9.x version to 9.16

Peter A. Bigot (8):
=20=20gcc: recipe whitespace changes
=20=20gcc: remove inappropriate patch
=20=20gcc-4.9: Ensure c++ includes are in /usr/include/c++/${BINV}
=20=20gcc: remove outdated configuration option
=20=20gcc-target: make --enable-clocale consistent with gcc-runtime
=20=20sdk: change EXTRA_OECONF_FPU to EXTRA_OECONF_GCC_FLOAT
=20=20gcc: backport patch affecting Linux kernel builds
=20=20gcc: update compiler architecture to match gcc-runtime (armv6, armv7a)

Peter Kjellerstedt (8):
=20=20gdb: Add a dependency on zlib
=20=20gstreamer1.0-plugins-good: Add a PACKAGECONFIG for udev
=20=20systemd: Inherit gettext
=20=20libsoup-2.4: Inherit gettext
=20=20glib-networking: Inherit gettext
=20=20python-scons-native: Make it useable if old host install exists
=20=20libgcrypt: Do not remove m4 files so aggressively
=20=20gstreamer1.0-rtsp-server: Upgrade to 1.4.0

Peter Seebach (1):
=20=20multilib_global.bbclass: PREFERRED_PROVIDERS for multilibs

Richard Purdie (22):
=20=20classes: Combine rootfs_<pkgtype> and populate_sdk_<pkgtype>
=20=20rootfs_*: Refactor common depends/lockfile task flags
=20=20populate_sdk_base: Move toolchain installation script to a separate =
file
=20=20glib-2.0: Make the gtester-report installation conditional
=20=20glib-2.0: Allow correct printf configuration on darwin/mingw
=20=20site: Add common-darwin
=20=20qemu: Move dtc(fdt) configuration to PACKAGECONFIG
=20=20qemu: Fixup target sdl configuration to use PACKAGECONFIG
=20=20qemu: Add alsa PACKAGECONFIG and cleanup native/nativesdk DEPENDS
=20=20qemu: Add PACKAGECONFIG for glx
=20=20qemu: Simplify DEPENDS
=20=20qemu: Overwrite KVM explicitly for darwin/mingw
=20=20lttng-tools/lttng-ust: Drop old 2.3.1 versions
=20=20lttng-ust/lttng-modules: Update LICENSE to reflect MIT
=20=20coreutils/libpam: Add BBCLASSEXTEND nativesdk
=20=20crosssdk: Clear MACHINEOVERRIDES
=20=20avahi: Since ${PN} is empty, set -dev RDEPENDS
=20=20local.conf.sample: Append sdl to qemu-native* PACKAGECONFIG
=20=20qemu-targets.inc: Update to handle mingw/darwin
=20=20qemu.inc: Drop unneeded nativesdk-libsdl RDEPENDS
=20=20glib-2.0: Add missing nativesdk-gettext DEPENDS
=20=20chrpath: Drop warning from darwn builds

Robert P. J. Day (4):
=20=20core-image.bbclass: Correct comment about packagegroups.
=20=20Remove remnants of deleted "do_package_write" task.
=20=20base.bbclass: Remove old-style definition of do_build() task.
=20=20tslib: Delete unnecessary "SRC_URI_OVERRIDES_PACKAGE_ARCH =3D 0"

Robert Yang (13):
=20=20boot-directdisk.bbclass: use local HDDDIR
=20=20libnewt: fix recompile error
=20=20logrotate: fix recompile error
=20=20kexec-tools: fix recompile error
=20=20kernelshark: fix recompile error
=20=20u-boot-mkimage: fix recompile error
=20=20syslinux: fix reinstall error
=20=20trace-cmd: fix recompile error
=20=20python-pygtk: fix native python path
=20=20image.bbclass: image_types.bbclass is a must
=20=20bootchart2: fix installed-vs-shipped
=20=20avahi-ui: drop rmdir localstatedir in bb recipe
=20=20syslinux: fix race issue

Ross Burton (3):
=20=20libxml2: port AM_PATH_XML2 to use pkg-config
=20=20lttng-tools: update to version 2.5.0
=20=20avahi: unset FILES_avahi to avoid packaging files there

Roy Li (1):
=20=20gmp: uprev it to 6.0.0

Saul Wold (1):
=20=20busybox: Add Upstream-Status to patch

Scot Salmon (1):
=20=20sysvinit: allow stack size configuration from rcS

Shrikant Bobade (2):
=20=20gnupg: Added PACKAGECONFIG[curl]
=20=20autoconf: add rdep on perl-module-data-dumper

Tim Orling (1):
=20=20perl-rdepends: add CPAN, CPAN::Meta requirements

Tom Zanussi (42):
=20=20wic: Make exec_cmd() error out instead of warn
=20=20wic: Remove unused custom commands
=20=20wic: Remove packaging, config commands
=20=20wic: Remove mic bootstrap
=20=20wic: Remove mic chroot
=20=20wic: Remove rt_util
=20=20wic: Remove mic package managers
=20=20wic: Remove bmap support
=20=20wic: Remove fiemap support
=20=20wic: Remove grabber implementation
=20=20wic: Remove proxy support
=20=20wic: Remove rpmmisc
=20=20wic: Remove unused fs_related code
=20=20wic: Remove unused misc code
=20=20wic: Remove 3rdparty/urlgrabber
=20=20wic: Remove unused 3rdparty/commands
=20=20wic: Remove gpt_parser
=20=20wic: Remove unused plugin and error code
=20=20wic: Clean up BaseImageCreator
=20=20wic: Clean up DirectImageCreator
=20=20wic: Clean up PartitionedMount
=20=20wic: Clean up Creator
=20=20wic: Remove unused command versioning support
=20=20wic: Update 'Background and Motivation' help section
=20=20wic: Remove unused conf support
=20=20wic: Remove Mount object
=20=20wic: Update/rename/delete mount-related code
=20=20wic: Update cleanup/unmount-related code
=20=20wic: Update/rename install-related code
=20=20wic: Update/rename configure-related code
=20=20wic: Rename PartitionedMount
=20=20wic: Rename MountError
=20=20wic: Update Disk description
=20=20wic: Rename /mic to /wic
=20=20wic: Bump the version to 2.0
=20=20wic: Add '--sourceparams' partition option
=20=20wic: Add utility function for parsing sourceparams
=20=20wic: Add sourceparam param to partition plugin methods
=20=20wic: Parse and pass sourceparams to partition plugin methods
=20=20wic: Add gummiboot support to bootimg-efi
=20=20wic: Add sourceparams to mkefidisk.wks
=20=20wic: Add mkgummidisk kickstart file

Tyler Hall (1):
=20=20lib/oeqa/selftest: Don't match log level in output

Wang Zidan (1):
=20=20gstreamer1.0-plugins-good: fix the bug for gstrtpmp4gpay

Yasir-Khan (7):
=20=20wpa-supplicant: use PACKAGECONFIG for ssl selection
=20=20trace-cmd: Update to version 2.3.2
=20=20udev-extraconf: Unmount SD card after ejection
=20=20consolekit: allow explicit enable/disable of polkit
=20=20consolekit: depend on glib-2.0-native
=20=20strace: apply ptrace.h conflict workaround
=20=20lttng-ust: update to version 2.5.0

=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D
Changelog for meta-openembedded:

Andrea Adami (1):
=20=20kexecboot: remove trailing slash in do_install

Christopher Larson (5):
=20=20dnsmasq: add missing inherit pkgconfig
=20=20dnsmasq: obey CFLAGS & LDFLAGS
=20=20dnsmasq: move parallel make patch to .bb, add upstream-status
=20=20dnsmasq: look for lua.pc, not lua5.1.pc
=20=20dnsmasq: add packageconfigs for idn, conntrack, lua

Gary S. Robertson (1):
=20=20libhugetlbfs: Extend arm32 support to include BE variants

Hongxu Jia (2):
=20=20syslog-ng: fix do_compi1e of qemuarm while DEBUG_BUILD
=20=20curlpp: fix do_compile failed since gcc upgrade to 4.9

Jackie Huang (3):
=20=20rsyslog: use syslog as the script name of syslog-init
=20=20syslog-ng: fix a multilib build failure and a QA issue
=20=20ruby: fix race conditions at install-ext

Maciej Borzecki (2):
=20=20collectd: make amqp plugin a selectable feature
=20=20rabbitmq-c: add recipe

Martin Jansa (46):
=20=20libungif: remove and use giflib everywhere
=20=20tracker: add all floating dependencies
=20=20mpd: add all floating dependencies
=20=20mpg123: add all floating dependencies
=20=20gnome-disk-utility: add dependency on libgnome-keyring
=20=20gmtk: add dependency on gtk+3 and pulseaudio
=20=20sox: add dependency on libvorbis
=20=20libmikmod: add dependency on pulseaudio
=20=20libwebp: fix wrong DEPENDS
=20=20libmicrohttpd: add dependency on file and disable spdy
=20=20engrave: add dependency on flex
=20=20cairomm: don't include cairo.inc
=20=20claws-mail: remove unrecognized options
=20=20evolution-data-server: remove unrecognized configure options
=20=20fuse: remove unrecognized configure option
=20=20libgnomecanvas: inherit only gnomebase
=20=20gnome-power-manager: remove unrecognized configure options
=20=20gnome-settings-daemon: remove unrecognized configure options
=20=20gnome-themes: remove unrecognized configure options
=20=20libgsf: remove unrecognized configure options
=20=20libxaw: remove unrecognized configure option
=20=20links, links-x11: remove unrecognized configure options
=20=20metacity: remove unrecognized configure option
=20=20openbox: remove unrecognized configure option
=20=20openobex: remove unrecognized configure options
=20=20owfs: remove unrecognized configure options
=20=20polkit-gnome: remove unrecognized configure options
=20=20start-stop-daemon: remove unrecognized configure option
=20=20expedite: remove unrecognized configure options
=20=20protobuf: add dependency on zlib
=20=20synergy: add dependency on libxinerama
=20=20stunnel: add dependency on zlib and tcp-wrappers
=20=20epiphany: add dependency on libnotify
=20=20gd: add dependency on tiff
=20=20snort: add dependency on util-linux
=20=20oscam: add dependency on pscs-lite
=20=20ttf-mplus: use PACKAGESPLITFUNCS and add drop ttf-common dependency
=20=20gd: add dependency on libvpx
=20=20dconf: add dependency on libxml2
=20=20gtksourceview2: add dependency on libxml2
=20=20libxklavier: add dependency on libxml2
=20=20webmin: explicitly list some packages, drop perl-module-timelocal rdep
=20=20efl, expedite: explicitly add some packages, add libsdl dependency
=20=20tracker: add PACKAGECONFIG for nautilus extension
=20=20llvm: drop 2.8 and 2.9 versions
=20=20talloc: remove empty bindir

Morgan Little (1):
=20=20eject: three fixes

Paul Eggleton (5):
=20=20dropbear: systemd support now in OE-Core
=20=20busybox: systemd support now in OE-Core
=20=20avahi: systemd support now in OE-Core
=20=20cronie: systemd support now in OE-Core
=20=20libpam: systemd support now in OE-Core

Peter Bigot (2):
=20=20python-smbus: upgrade to 3.1.1
=20=20rrdtool: update to 1.4.8

Robert P. J. Day (1):
=20=20packagegroups: Remove deprecated "task" backward compatibility

Robert Yang (1):
=20=20syslog-ng: update configure.patch for older patch tool

Roy Li (4):
=20=20ifenslave: add recipes
=20=20ipsec-tools: uprev it to 0.8.2
=20=20quagga: uprev it to 0.99.23
=20=20net-snmp: uprev it to 5.7.2.1

Tim Orling (2):
=20=20libextutils-helpers-perl: fix RDEPENDS
=20=20libmodule-build-tiny-perl: fix RDEPENDS

Ting Liu (1):
=20=20inetutils: not use auto-detected login for telnetd

lchristina26 (1):
=20=20cyassl: add recipe

=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D
Changelog for meta-angstrom:

Koen Kooi (2):
=20=20systemd: add missing curl dependency
=20=20linux-yocto 3.10 bbappend: make FRI2 actually useful

=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D
Changelog for meta-arago:

Denys Dmytriyenko (6):
=20=20u-boot: switch to git for github access
=20=20ltp-ddt: update with latest changes in Makefile to pass kernel dir
=20=20ltp-ddt-legacy: remove special version meant for 3.2 kernels
=20=20packagegroup-*-matrix-sdk-host: skip matrix-browser and =
refresh-screen for k
=20=20omapconf: update to 1.70 version, add am335x support
=20=20packagegroups*: install omapconf for ti33x platforms as well

Franklin S. Cooper Jr (20):
=20=20arago.conf: Make sure qtbase builds example applications
=20=20packagegroup-arago-qte: Pull in Qt3D when using Qt 5
=20=20packagegroup-arago-tisdk-qte: Pull in more Qt 5 example applications
=20=20qtwayland - Fix fetch breakage
=20=20u-boot-fw-utils: Use dra7 evm for U-boot config for am57x
=20=20arago-prefs: Point omap-15 SOCs to use the latest TI U-boot =
integration tree
=20=20u-boot-ti-staging: Use AM57x branch/git tree
=20=20qtbase: Set wayland as the default display plugin
=20=20arago.conf: Enable touchscreen support to qtbase
=20=20tslib: Use custom tslib.sh
=20=20qtbase: Add global environment variable script
=20=20weston: Add global environment variable script
=20=20matrix-gui: Remove environment variables from init script
=20=20arago-qt4: Add global environment variable script
=20=20ts-calibrate-init: Simplify calibrate logic
=20=20arago-qt4: Add rotation to global environment variable script
=20=20matrix-gui: Remove rotation option for am37x
=20=20weston-init: Pull in init from oe-core
=20=20weston-init: Unset env variable that are set by scripts in =
/etc/profile.d/
=20=20packagegroup-arago-tisdk-graphics: Add weston-examples

Jacob Stiffler (1):
=20=20qtwayland - update to 5.4 branch

Yaniv Machani (3):
=20=20wl18xx-compat: version update
=20=20wl18xx-wlconf: version update
=20=20wpa-supplicant-wl18xx: configuration files update

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

Javier Viguera (1):
=20=20meta-fsl-arm: fix some typos

Lauren Post (3):
=20=20gpu-viv-bin-mx6q: Upgrade to 3.10.17-1.0.1
=20=20xf86-video-imxfb-vivante: Upgrade to 3.10.17-1.0.1
=20=20linux-imx: Upgrade to 3.10.17-1.0.1

Max Krummenacher (2):
=20=20libmcc: remove bashism in Makefile
=20=20kernel-module-mcc: remove bashism in Makefile

Otavio Salvador (1):
=20=20gpu-viv-bin-mx6q: Add a missing runtime dependency on libdrm

Wang Zidan (1):
=20=20alsa-lib: add conf for multichannel support in mx6

=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D
Changelog for meta-fsl-arm-extra:

Otavio Salvador (1):
=20=20linux-denx: Restrict recipe compatibility for m53evk

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

Andrea Adami (1):
=20=20linux-yocto-tiny-kexecboot: change KERNEL_IMAGE_MAXSIZE from bytes to =
KB

=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D
Changelog for meta-igep:

=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D
Changelog for meta-intel:

=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D
Changelog for meta-ivi:

Andrei Gherzan (4):
=20=20Use FILESEXTRAPATHS correctly
=20=20weston-ivi-shell: Add patches on top of weston v1.5
=20=20layer.conf: Use 1.5 as weston preferred version
=20=20poky-ivi-systemd.conf: Add PATCHTOOL variable

Florin Sarbu (1):
=20=20Use weston version 1.4% from meta-ivi

Holger Behrens (3):
=20=20packagegroups: add weston-examples to install binaries referenced in =
weston.
=20=20common-api: upgrade to 2.1.6
=20=20audiomanager: upgrade to version 6.1

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

Martin Jansa (2):
=20=20qtwebkit.inc: add PACKAGECONFIG for libwebp
=20=20qttools: fix noqtwebkit option

=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D
Changelog for meta-slugos:

=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D
Changelog for meta-systemd:

=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D
Changelog for meta-raspberrypi:

Alex J Lennon (1):
=20=20rpi-config,README: Add option to enable offline image compositing

Andrei Gherzan (3):
=20=20gstreamer1.0-plugins-bad: Sync version with yocto master
=20=20omxplayer: Add dependency on openssl
=20=20README: Some minor clarifications

=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D
Changelog for meta-smartphone:

Martin Jansa (2):
=20=20evopedia: add dependency on bzip2

Simon Busch (2):
=20=20meta-lg: systemd-machine-units: put files into correct directory to =
include=20
=20=20meta-hp: initramfs-boot-android: create missing directories

=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D
Changelog for meta-ti:

Alexandre Belloni (1):
=20=20beaglebone: use the am335x_boneblack u-boot configuration

Denys Dmytriyenko (4):
=20=20linux-ti-staging: update to 3.14.16 with am57xx and other updates
=20=20beaglebone.conf: use correct UBOOT_MACHINE
=20=20am33x-cm3: update with version 1.8.7
=20=20linux-ti-staging: update to 3.14.17 stable

Franklin S. Cooper Jr (1):
=20=20am57xx-evm: Update the config name used in U-boot for this board

=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D
Changelog for meta-webos:

Alexandr Smoktal (1):
=20=20webos-image: luna-service2=3D195,v3.9.4

Andrii Motsok (1):
=20=20webos-image: ptmalloc3=3Dr3

Iurii Artemenko (1):
=20=20webos-image: busybox=3Dv1.20.2-0webos3

Keith Derrick (3):
=20=20webos-image: pmlogdaemon=3D121
=20=20Update webosvbox for new repository layout
=20=20webos-image: Introduce webos_nyx_modules_provider bbclass

Kyrylo Kropivyanskiy (2):
=20=20webos-image: dbus=3Dwebos2
=20=20webos-image: hdparm=3Dwebos1

Martin Jansa (3):
=20=20meta-webos: webos.inc: use MACHINE subdirectory in DEPLOY_DIR_IMAGE
=20=20nyx-modules: Fix syntax
=20=20e2fsprogs: Backport 1.42.8 version from oe-core/dora

Sapna Todwal (1):
=20=20webos-image: nyx-modules=3D96

=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D
Changelog for meta-xilinx:

Nathan Rossi (1):
=20=20qemu: Updated version

=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D
Changelog for meta-yocto:

Richard Purdie (1):
=20=20local.conf.sample: Append sdl to qemu-native* PACKAGECONFIG

=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D
Changelog for openembedded:



