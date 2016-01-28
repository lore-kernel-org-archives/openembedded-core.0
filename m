Return-Path: <cliff.brake@gmail.com>
Received: from mail-qg0-f42.google.com (mail-qg0-f42.google.com
	[209.85.192.42])
	by mail.openembedded.org (Postfix) with ESMTP id 69674760AA;
	Thu, 28 Jan 2016 16:01:35 +0000 (UTC)
Received: by mail-qg0-f42.google.com with SMTP id b35so42336442qge.0;
	Thu, 28 Jan 2016 08:01:36 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=date:mime-version:message-id:from:to:subject:content-type
	:content-transfer-encoding;
	bh=6BTv1bYIxUqEoJzZcuJ6cqVIlqw7TPMZ3QSTAr5wLzE=;
	b=Td6el2AqyDCzWw1dCGH0PSzaAIDUtuYP4Zj/kSycrO9AGwjJrZfloLIpkpcOJfKz2W
	b3rjdOVJkCDtuuR/UUAof7h1OLWMeC7486ioc6f1oQ4SdeTzlqHb6CWZVDC1HhfDlE9S
	Wg8xQnjBFG7XMCZF6UAtULyfc/R8YIkTgWZNeJOFizHVGjtvhgHirPNTqahb0qf+A4r8
	1AhLQXBV34t58R7abCe/T+S9fFeb5GfDrebcgwrr7Lp7a0Goy0GA7D3OmDi/5pUe2r5F
	QLhgm8gpy+h49gFhid6x0Ilr6moVUegunZ0vU3B9CaFm25xK2nxzLRqQLorDU1QZ4BX0
	gRBw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20130820;
	h=x-gm-message-state:date:mime-version:message-id:from:to:subject
	:content-type:content-transfer-encoding;
	bh=6BTv1bYIxUqEoJzZcuJ6cqVIlqw7TPMZ3QSTAr5wLzE=;
	b=DVIxh6Ab73djeL+fJ+LVLAwNXUYtdf9lD1Wcl9Qjxb7FgJ46bkuyjeTuquf86oN23J
	p5+cMwwZuYzSJcBJvlf8XI8ioNiHFPkLOlYuE0nCjXdXfsMtOVce5ltYywx57+BDCNLL
	M2K+P6V6TJ6QHtneDV94iJFJCzHTqA37GQKv2C2IR1ZajlohM0cf1tiDQUmIDsLpOdBT
	+sfUUWNDFNOpyLzWL5OMrv12J5eFWR2yAErgmaGrduNBpjcLpH+DnczWyMN2jXEvtuRW
	VTUKstIDENkQavnidCDBGoSwJD0e0rMgvQ0y0Cs+f5Rv+iSaS46sUUKoA/bL9rvd9Mtn
	06DA==
X-Gm-Message-State: AG10YOTBFxALZK8zx+oyCBIQswjZYeAVta6oAqv36L8I6aLeM2bCklsGzSFJZpIW3/g/6Q==
X-Received: by 10.140.236.68 with SMTP id h65mr4752621qhc.13.1453996895609;
	Thu, 28 Jan 2016 08:01:35 -0800 (PST)
Received: from [127.0.0.1] (cable2-pool191-cs-134.doycomm.com.
	[66.219.191.134])
	by smtp.gmail.com with ESMTPSA id i5sm4741365qhi.18.2016.01.28.08.01.33
	(version=TLSv1/SSLv3 cipher=OTHER);
	Thu, 28 Jan 2016 08:01:33 -0800 (PST)
Date: Thu, 28 Jan 2016 08:01:33 -0800 (PST)
X-Google-Original-Date: Thu, 28 Jan 2016 16:01:32 GMT
MIME-Version: 1.0
X-Mailer: Nodemailer (0.3.22; +http://andris9.github.com/Nodemailer/)
Message-Id: <1453996892436.67ce1d39@Nodemailer>
From: cliff.brake@gmail.com
To: openembedded-core@lists.openembedded.org,
	openembedded-devel@lists.openembedded.org,
	angstrom-distro-devel@linuxtogo.org, meta-ti@yoctoproject.org
Subject: OE Changelog since 2016-01-17 until 2016-01-24
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
X-List-Received-Date: Thu, 28 Jan 2016 16:01:36 -0000
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable

Changelog since 2016-01-17 until 2016-01-24.  Projects included in this =
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
https://github.com/schnitzeltony/meta-gumstix-community.git
meta-handheld: git://git.openembedded.org/meta-handheld
meta-igep: http://github.com/ebutera/meta-igep.git
meta-intel: git://git.yoctoproject.org/meta-intel
meta-ivi: git://git.yoctoproject.org/meta-ivi
meta-java: git://github.com/woglinde/meta-java
meta-jetson-tk1: https://github.com/cubicool/meta-jetson-tk1.git
meta-kde: git://gitorious.org/openembedded-core-layers/meta-kde.git
meta-micro: git://git.openembedded.org/meta-micro
meta-mono: git://git.yoctoproject.org/meta-mono.git
meta-netbookpro: git://github.com/tworaz/meta-netbookpro
meta-nodejs: https://github.com/imyller/meta-nodejs.git
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

Ed Bartosh (2):
=20=20toaster: write variables to toaster.conf
=20=20toaster: run bitbake server with --read option

Elliot Smith (3):
=20=20toasterui: listen for bb.event.MetadataEvent
=20=20toasterui: log OSErrorException metadata events
=20=20toastergui: make artifact download more robust

Olof Johansson (1):
=20=20tests/codeparser.py: Add filename/lineno flags to test variable

Paul Eggleton (1):
=20=20taskdata: add the ability to access world targets list

Richard Purdie (3):
=20=20Revert "runqueue.py: Ensure one setscene function doesn't mask out =
another w
=20=20data_smart: Don't show exceptions for EOL literals
=20=20fetch2: Don't show checksum warnings if a single checksum was supplied

Robert Yang (2):
=20=20taskdata.py: add RuntimeProviders to close matches
=20=20cache.py: check existence before add to cachedata.rproviders

=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D
Changelog for openembedded-core:

Alejandro Hernandez (14):
=20=20python: Upgrade 2.7.9 > 2.7.11
=20=20python3-setuptools: upgrade to 19.2
=20=20python-setuptools: Upgrade to 19.2
=20=20python-mako: upgrade to 1.0.3
=20=20python-pycurl: upgrade to 7.21.5
=20=20python-scons: upgrade to 2.4.1
=20=20swig: upgrade to 3.0.8
=20=20python-numpy: upgrade to 1.10.4
=20=20python3: Minor upgrade 3.5.0 -> 3.5.1
=20=20perl: Upgrade to 5.22.1
=20=20python-native: Make python-native also RPROVIDE python-unittest-native
=20=20python-nose: upgrade to 1.3.7
=20=20python-setuptools: Unify and upgrade python-setuptools and =
python3-setuptool
=20=20python3-pip: Upgrade to 8.0.0

Alexander Kanavin (13):
=20=20bootchart2: update to 0.14.8
=20=20btrfs-tools: update to 4.4
=20=20build-appliance-image: bump version to 14.0
=20=20e2fsprogs: fix upstream version check
=20=20libsolv: fix upstream version check
=20=20ncurses: fix upstream version check
=20=20pbzip2: update to 1.1.13
=20=20sysstat: fix upstream version check
=20=20gnutls: update to 3.4.8
=20=20libical: fix upstream version check
=20=20libjpeg-turbo: fix upstream version check (sort of)
=20=20nss: update to 3.21
=20=20build-appliance-image: bump version to 14.0.0

Andre McCurdy (53):
=20=20security_flags.inc: remove obsolete workarounds for curl
=20=20valgrind: make it explicit that valgrind supports armv7a and above
=20=20strace: drop unnecessary dependency on acl
=20=20strace: fix --disable-aio configure option
=20=20strace: remove need for git-version-gen script
=20=20strace: fix ARCH definition in tests/Makefile
=20=20strace: update 4.10 -> 4.11
=20=20valgrind: let valgrind determine its own optimisation flags
=20=20valgrind: re-enable ARM intdiv and vcvt_fixed_float_VFP tests
=20=20valgrind: avoid neon for targets which don't support it
=20=20valgrind: remove unused valgrind-remove-rpath.patch
=20=20gst-player: minor formatting improvements
=20=20gst-plugins-package.inc: minor formatting improvements
=20=20gstreamer1.0: minor formatting improvements
=20=20gstreamer1.0-plugins.inc: minor formatting improvements
=20=20gstreamer1.0-plugins-base: minor formatting improvements
=20=20gstreamer1.0-plugins-good: minor formatting improvements
=20=20gstreamer1.0-plugins-bad: minor formatting improvements
=20=20gstreamer1.0-plugins-ugly: minor formatting improvements
=20=20gstreamer1.0-libav: minor formatting improvements + update HOMEPAGE
=20=20gstreamer1.0-omx: minor formatting improvements + update HOMEPAGE
=20=20gstreamer1.0-rtsp-server.inc: minor formatting improvements
=20=20gstreamer1.0.inc: add missing glib-2.0-native dependency
=20=20gstreamer1.0-plugins.inc: add missing glib-2.0-native dependency
=20=20gstreamer1.0-plugins.inc: convert GSTREAMER_1_0_DEBUG to a =
PACKAGECONFIG
=20=20gstreamer1.0-plugins-good.inc: remove duplicate --disable-examples
=20=20gstreamer1.0-plugins-bad.inc: don't set ${S} or apply version =
specific patch
=20=20gstreamer1.0-plugins-bad.inc: update hls dependency gnutls -> nettle
=20=20gstreamer1.0-plugins.inc: drop obsolete lib-link.m4 workaround
=20=20gstreamer1.0-plugins.inc: don't set base SRC_URI via python
=20=20gst-plugins-package.inc: drop perl RDEPEND for XXX-apps packages
=20=20gstreamer1.0: update 1.6.2 -> 1.6.3
=20=20gstreamer1.0-plugins-base: update 1.6.2 -> 1.6.3
=20=20gstreamer1.0-plugins-good: update 1.6.2 -> 1.6.3
=20=20gstreamer1.0-plugins-bad: update 1.6.2 -> 1.6.3
=20=20gstreamer1.0-plugins-ugly: update 1.6.2 -> 1.6.3
=20=20gstreamer1.0-libav: update 1.6.2 -> 1.6.3
=20=20gstreamer1.0: update git recipe to 1.7.1
=20=20gstreamer1.0-plugins-base: update git recipe to 1.7.1
=20=20gstreamer1.0-plugins-good: update git recipe to 1.7.1
=20=20gstreamer1.0-plugins-bad: update git recipe to 1.7.1
=20=20gstreamer1.0-plugins-ugly: update git recipe to 1.7.1
=20=20gstreamer1.0-libav: update git recipe to 1.7.1
=20=20sqlite3: fix the parallel build fix patch
=20=20sqlite3.inc: fix readline PACKAGECONFIG
=20=20sqlite3.inc: drop obsolete config_BUILD_CC, etc exports
=20=20sqlite: formatting improvements, move more stuff into sqlite3.inc
=20=20sqlite3.inc: dynamically link the sqlite3 command-line utility
=20=20sqlite3.inc: add PACKAGECONFIG to support building against libedit
=20=20sqlite3: update 3.10.0 -> 3.10.2
=20=20pulseaudio.inc: drop obsolete dependency on liboil
=20=20gstreamer1.0-plugins.inc: drop obsolete ${S}/po/Makefile.in.in =
workaround
=20=20orc: update HOMEPAGE

Andrew Shadura (1):
=20=20cups: update systemd support

Bob Ham (1):
=20=20libinput: Upgrade 0.21.0 -> 1.1.4

Bruce Ashfield (1):
=20=20linux-libc-headers: update to 4.4

Daniel McGregor (1):
=20=20opkg-utils: store alternatives in nonarch_libdir

Denys Dmytriyenko (2):
=20=20wayland: upgrade 1.8.1 -> 1.9.0
=20=20weston: upgrade 1.8.0 -> 1.9.0

Ed Bartosh (15):
=20=20wic: add custom exception KickStartError
=20=20wic: catch KickStartError
=20=20wic: improve processing of parseing errors
=20=20wic: removed unused imports
=20=20wic: override ArgumentParser.error
=20=20wic: rename kickstarter.py -> ksparser.py
=20=20wic: move wks parsing code to KickStart._parse
=20=20wic: use unique partition number
=20=20wic: do not remove build dir in source plugins
=20=20wic: ksparser: add support for include
=20=20wic: refactor get_boot_config
=20=20wic: implement search of includes
=20=20wic: move parts of canned .wks into common.wks.inc
=20=20wic: add help for 'include' command
=20=20wic: pylinted ksparser module

Ioan-Adrian Ratiu (1):
=20=20gcc-runtime.inc: provide libquadmath

Joshua Lock (3):
=20=20gcc-runtime: switch to removal override syntax to modify CXXFLAGS
=20=20uclibc: remove a use of immediate expansion and oe_filter_out ()
=20=20lib/oe/package_manager: prevent testing an undefined variable

Khem Raj (67):
=20=20libdrm: Upgrade 2.4.65 -> 2.4.66
=20=20powertop: Include right headers for timval struct
=20=20blktrace: Include <sys/types.h for dev_t
=20=20ppp: Fix build with musl
=20=20tcp-wrappers: Fix build with musl
=20=20fts: Add recipe
=20=20connman: include config.h for HAVE_STRUCT_IN6_PKTINFO_IPI6_ADDR
=20=20libcgroup: Add dependency on fts when building on musl
=20=20xserver-xorg: Fix build with musl
=20=20gdk-pixbuf: Fix latent build  issue exposed by musl
=20=20argp-standalone: Add recipe
=20=20gnutls: Link with libargp on musl and depend on argp-standalone
=20=20util-linux: Fix ptest builds on musl
=20=20packagegroup-self-hosted.bb: Move glibc-gconv-ibm850 to glibc only =
case
=20=20guile: Fix build with uclibc
=20=20gnutls: Link with libuargp on uclibc
=20=20mtools: Fix build with uclibc
=20=20parted: Fix build with uclibc
=20=20net-tools: Link with libintl on uclibc
=20=20directfb: Fix build with musl
=20=20gzip: Fix build with musl
=20=20watchdog: Fix build with musl
=20=20xinetd: Fix build with musl
=20=20dpkg: Add musleabi to known architectures
=20=20puzzles: Zero'ise structs before use
=20=20apt: Add support for building for musl targets
=20=20libunwind: backtrace APIs are glibc specific
=20=20babeltrace: Add missing header for MAXNAMLEN define
=20=20sysklogd: untangle header inclusion maze
=20=20console-tools: Include sys/types.h for u_char and u_short defs
=20=20webkitgtk: Fix build with clang/musl
=20=20rt-tests: Fix build with non-gcc compilers
=20=20tar: Fix build for musl based targets
=20=20pax: Fix build with musl
=20=20iputils: Use member based initialization for mrghdr struct
=20=20libuser: Fix build when secure getenv is not there
=20=20iproute2: Fix build with musl
=20=20irda-utils: Fix header inclusions
=20=20nspr: Drop older glibc code
=20=20chkconfig: Avoid using caddr_t
=20=20tcf-agent: Implement canonicalize_file_name() for musl as well
=20=20bsd-headers,musl: Add recipe for bsd missing features
=20=20nfs-utils: Disable tcp-wrappers for musl
=20=20portmap: Point to tirpc headers and libraries on musl
=20=20systemd: Skip parsing on musl based targets
=20=20kexec-tools: Define _GNU_SOURCE for getting loff_t definition
=20=20pcmciautils: Fix parallel build and include sys/types.h
=20=20apmd: Fix build with musl
=20=20nss: Undefine HAVE_SYS_CDEFS_H
=20=20dosfstools: Correct cross-compile CFLAGS and fix build with musl
=20=20fts: Fix linker hash-style option
=20=20musl: Create ld.so as a relative symlink
=20=20bsd-headers: Package cdefs.h
=20=20guile: Fix build with musl
=20=20unfs3: Depend on libtirpc when building on musl
=20=20uclibc: Update to 1.0.11
=20=20console-tools: Fix header inclusion when not using glibc
=20=20gpgme: Define __error_t_defined on musl
=20=20mdadm: Fix build with musl
=20=20eglinfo: Fix build on raspberrypi
=20=20puzzles: Silence warning on arm with clang
=20=20binutils: Fix gold linking errors due to unresolved R_ARM_MOVW_ABS_NC
=20=20syslinux: Set LD to avoid using build host ld
=20=20glib-2.0: Fix locale location on musl
=20=20libsolv: Update to 0.6.17+
=20=20linux-libc-headers: Port patches for linux-headers for musl
=20=20busybox: Add support for busybox-init

Liam R. Howlett (1):
=20=20meta/files/toolchain-shar-relocate.sh: Detect different python =
binaries and=20

Mariano Lopez (4):
=20=20lib/oe/package_manager: Add list_pkgs() to PkgsList class
=20=20lib/oe/utils: Add function format_pkg_list()
=20=20lib/oe/rootfs: Use list_pkgs() instead of list()
=20=20lib/oe/package_manager.py: Remove list() from PkgsList class

Markus Lehtonen (4):
=20=20sign_rpm.bbclass: fix task dependencies
=20=20oeqa/selftest/signing: use temporary rpmdb
=20=20build-perf-test.sh: more generic timing function
=20=20build-perf-test.sh: add eSDK testing

Maxin B. John (5):
=20=20kexec: update supported architecture list
=20=20libtirpc: remove redundant va_list patch
=20=20libpng: upgrade to 1.6.21
=20=20libpng12: upgrade to 1.2.56
=20=20acpid: upgrade to 2.0.26

Olof Johansson (1):
=20=20rpm: remove bashisms: [ x =3D=3D x ] -> [ x =3D x ]

Otavio Salvador (2):
=20=20slang: Add dependency on ncurses
=20=20libnewt: Fix linking error due missing symbols

Paul Eggleton (25):
=20=20recipetool: create: improve extraction of pkg-config / lib deps
=20=20recipetool: create: pick up boost macros in configure.ac
=20=20recipetool: create: detect flex/bison dependency
=20=20recipetool: create: support additional autoconf macros from =
autoconf-archive
=20=20recipetool: create: fix overzealous mapping of git URLs
=20=20recipetool: create: move dependency mapping code to RecipeHandler
=20=20recipetool: create: force GL libraries to virtual/*
=20=20recipetool: create: add basic support for extracting dependencies =
from cmake
=20=20recipetool: create: add a couple more license checksums
=20=20oe-selftest: devtool: fix test_devtool_add_library if python was =
built first
=20=20classes/populate_sdk_ext: fix task dependency regression
=20=20classes/populate_sdk_ext: add option to bring in pkgdata for world
=20=20devtool: build: ensure pkgdata is written out
=20=20devtool: sdk-update: improve temp directory handling
=20=20devtool: sdk-update: improve SDK update process robustness
=20=20devtool: add sdk-install subcommand
=20=20classes/populate_sdk_ext: drop ext-sdk-prepare.py when installing
=20=20classes/populate_sdk*: add dependencies on script files
=20=20toolchain-shar-extract.sh: improve behaviour when xz is not installed
=20=20gen-lockedsig-cache: copy correct native sstate into ext SDK
=20=20recipetool: create: strip quotes from values extracted from =
CMakeLists.txt
=20=20devtool / recipetool: support specifying a subdirectory within the =
fetched s
=20=20recipetool: create: extract SRC_URI from local git repositories
=20=20recipetool: create: fix extraction of name from URLs ending in /
=20=20recipetool: create: better fix for fetch error handling

Richard Purdie (21):
=20=20insane: Clean up horrible return value processing code
=20=20insane: Start to clean up do_configure_qa code
=20=20image: Fix wic environment issues
=20=20image: Fix instability of do_image_* checksums
=20=20image: Ensure we don't expand TMPDIR in image commands
=20=20rootfs-postcommands: Ensure license manifests respect RM_OLD_IMAGE
=20=20bootimg/image: Enhance bootimg to respect RM_OLD_IMAGE
=20=20selftest/buildhistory: Improve test to remove sources of error
=20=20image: Always run do_rootfs_wicenv
=20=20bootimg/image-vm/image-live: Improve image dependencies
=20=20image: Handle image types containing '-' correctly
=20=20sstate: Add packagedata to list of tasks not to recurse
=20=20bitbake.conf: Remove horrible variable expansion hacks
=20=20xz: Allow to work with ASSUME_PROVIDED xz-native
=20=20pixz: Add 1.0.6
=20=20uninative: Add fetch capability
=20=20lib/oe/sdk: Partially revert "sdk.py: fix conflicts of packages"
=20=20populate_sdk: Use pixz instead of xz
=20=20insane: Drop do_stage test
=20=20uninative: Fix conflicts with normal sysroot
=20=20weston: Add missing DEPENDS on wayland-native

Robert Yang (6):
=20=20e2fsprogs: add PACKAGECONFIG for fuse
=20=20e2fsprogs: fix PV
=20=20e2fsprogs: set PV to 1.42.99+1.43+git${SRCPV}
=20=20insane.bbclass:buildpaths: ignore ipkg/dpkg's CONTROL dir
=20=20insane.bbclass: print all the QA messages
=20=20insane.bbclass: fix package_qa_walk()

Ross Burton (11):
=20=20postinst-intercepts: always use set -e
=20=20sstate: replace verbose manifest removal with a single count
=20=20mesa: add missing wayland-native build dependency
=20=20autotools: don't output the full config.log on configure failure
=20=20mesa: update SRC_URI
=20=20gawk: fix libexecdir/libdir/BPN confusion
=20=20bitbake: set default libexecdir to $prefix/libexec
=20=20sstate: display the sysroot name when cleaning for clarity
=20=20emptytest: exclude from world builds
=20=20update-alternatives: when warning about alt_link=3D=3Dalt_target, say =
what PN
=20=20oprofile: fix build with musl

Roy Li (2):
=20=20kexec-tools: inherit update-rc.d
=20=20glib-2.0: fix the ptest

Saul Wold (1):
=20=20udev: Add 2 patches to support 4.4 kernel

Scott Ellis (1):
=20=20coreutils: Add xattr PACKAGECONFIG

Yi Zhao (1):
=20=20oeqa/runtime/parselogs: use -F to search fixed strings for grep

=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D
Changelog for meta-openembedded:

Dai Caiyun (5):
=20=20rp-pppoe: 3.11 -> 3.12
=20=20postfix: 3.0.2 -> 3.0.3
=20=20stunnel: 5.21 -> 5.28
=20=20dovecot: 2.2.18 -> 2.2.21
=20=20openvpn: 2.3.7 -> 2.3.8

Jackie Huang (6):
=20=20libtdb: upgrade to 1.3.7
=20=20libldb: upgrade to 1.1.21
=20=20libtevent: upgrade to 0.9.25
=20=20libtalloc: upgrade to 2.1.3
=20=20samba: fix the incorrect tmpfiles installed directory
=20=20samba: backport patches for cross-compiling

Joe Slater (2):
=20=20xl2tpd: modify recipes to avoid forced internet access
=20=20geoip: add ptest functionality

Ovidiu Vancea (1):
=20=20dnsmasq: Listen only on loopback and disable DHCP

Roy Li (1):
=20=20tcpdump: add PACKAGECONFIG for libcap-ng

mike.looijmans@topic.nl (1):
=20=20recipes-connectivity/samba: Only rmdir directories that exist

=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D
Changelog for meta-angstrom:

Koen Kooi (1):
=20=20Angstrom.inc: don't add FEED_ARCH to MACHINE_OVERRIDES

=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D
Changelog for meta-arago:

Denys Dmytriyenko (8):
=20=20libinput: update to 1.1.4
=20=20wayland: update to 1.9.0
=20=20weston: update to 1.9.0
=20=20weston: update bbappend for new version
=20=20libdrm: add version 2.4.66
=20=20libdrm: update bbappend and the patch for the new version
=20=20arago-prefs: set preference for the new version of libdrm
=20=20weston: disable required opengl feature due to mesa/libgbm conflicts

Gou, Hongmei (3):
=20=20arago-source-ipk: update install dir for hplib-mod and uio-module-drv
=20=20nodejs: add version 4.2.3
=20=20packagegroup-arago-tisdk-addons: add nodejs for am3/am4/am5

Sam Nelson (1):
=20=20tisdk-server-extra: Add parse-ip module

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

Jun Zhu (1):
=20=20imx-base: Set UBOOT_ENTRYPOINT for i.MX6UL

Stefan Agner (3):
=20=20linux-fslc (4.4): Introduce Linux 4.4 kernel
=20=20imx-base.inc: use modesetting driver for Vybrid
=20=20xserver-xf86-config: use modesetting for Vybrid

=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D
Changelog for meta-fsl-arm-extra:

Fabio Estevam (1):
=20=20cubox-i: Use linux-fslc by default

Max Krummenacher (1):
=20=20linux-toradex (3.14.28): unify defconfig

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

Andrea Adami (2):
=20=20linux-yocto_3.14: remove stale recipe
=20=20linux-handheld: initial commit of v. 4.4 for PXA and SA1100 devices

=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D
Changelog for meta-igep:

=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D
Changelog for meta-intel:

Jussi Kukkonen (1):
=20=20gstreamer-vaapi: Remove deprecated configure option

=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D
Changelog for meta-ivi:

=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D
Changelog for meta-java:

=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D
Changelog for meta-jetson-tk1:

=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D
Changelog for meta-kde:

=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D
Changelog for meta-micro:

=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D
Changelog for meta-mono:

Alex J Lennon (2):
=20=20mono: add support for 4.2.2.29
=20=20README: update release notes link/testing of 4.2.2.29 on qemux86

=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D
Changelog for meta-netbookpro:

=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D
Changelog for meta-nodejs:

=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D
Changelog for meta-nslu2:

=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D
Changelog for meta-opie:

=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D
Changelog for meta-qt3:

Ross Burton (1):
=20=20qt-x11-free: update SRC_URI

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

Anand Balagopalakrishnan (2):
=20=20omapdrm-pvr: bump SRCREV for AM57x/DRA7xx
=20=20omap5-sgx-ddk-um-linux: bump SRCREV for AM57x/DRA7xx to the latest =
DDK UM

Denys Dmytriyenko (4):
=20=20linux-ti-staging: update to 4.1.15 and latest merges
=20=20u-boot-ti-staging: update to the latest
=20=20linux-ti-staging: split out systest defconfig into own recipe
=20=20linux-ti-staging: update to the latest, use RT defconfig for Keystone

Paul Barker (1):
=20=20ti-softhsmv2: Use target includes for zlib and openssl

=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D
Changelog for meta-webos:

=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D
Changelog for meta-xilinx:

=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D
Changelog for meta-yocto:

Alejandro Hernandez (1):
=20=20maintainers.inc: Correct maintainership for several packages

Khem Raj (1):
=20=20poky.conf: Delete BB_SIGNATURE_HANDLER settings

Maxin B. John (2):
=20=20alsa-state: remove beagleboard configuration
=20=20formfactor: remove unused beagleboard configuration

Ross Burton (1):
=20=20maintainers: mark Khem as nominal owner for uclibc

=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D
Changelog for openembedded:



