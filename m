Return-Path: <cliff.brake@gmail.com>
Received: from mail-ig0-f176.google.com (mail-ig0-f176.google.com
	[209.85.213.176])
	by mail.openembedded.org (Postfix) with ESMTP id 1F9AA763F2;
	Thu, 29 Oct 2015 16:05:55 +0000 (UTC)
Received: by igpw7 with SMTP id w7so31718679igp.0;
	Thu, 29 Oct 2015 09:05:56 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=date:mime-version:message-id:from:to:subject:content-type
	:content-transfer-encoding;
	bh=vNPJbJelnSdc3PPeiqDl6yZ8pl4V+UAam7ZfZhSe+CU=;
	b=vF/bboxxNHdHBbB3WJuhsdGB5ve0KOV6wEBEuZyw5jWHhaX04zl/wrMfoHr4c8hO87
	m1ccM5ENbIeZiHODJSEcQoq58vkm5pLRXZXSzsE/XODLZdtoArpbcp8hoGiQZhtjzywc
	pnx5n3uQckxz90ZKznhwKftau1AKuSCaKm/VgSdojGyolXu94dYkh+0Ezd4YDDqmcHGK
	GZ+MM9HSdUtWiShEyeD43DvfSXyndKRtDJHBwjAS3GxGf3DIvhl/3HduMMCHQAzOQp8N
	sNTPzxyuW7SqKqiJolEmUmzEMwWQkGW2okUi4N7DEF71+udP/5xRgHqi3QLVBRr4/e76
	LYMA==
X-Received: by 10.50.43.131 with SMTP id w3mr10906522igl.12.1446134755836;
	Thu, 29 Oct 2015 09:05:55 -0700 (PDT)
Received: from [127.0.0.1] (cable2-pool191-cs-134.doycomm.com.
	[66.219.191.134]) by smtp.gmail.com with ESMTPSA id
	jh6sm11816384igb.13.2015.10.29.09.05.52
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
	Thu, 29 Oct 2015 09:05:53 -0700 (PDT)
Date: Thu, 29 Oct 2015 09:05:53 -0700 (PDT)
X-Google-Original-Date: Thu, 29 Oct 2015 16:05:51 GMT
MIME-Version: 1.0
X-Mailer: Nodemailer (0.3.22; +http://andris9.github.com/Nodemailer/)
Message-Id: <1446134751919.7d2cb6fa@Nodemailer>
From: cliff.brake@gmail.com
To: openembedded-core@lists.openembedded.org,
	openembedded-devel@lists.openembedded.org,
	angstrom-distro-devel@linuxtogo.org, meta-ti@yoctoproject.org
Subject: OE Changelog since 2015-10-18 until 2015-10-25
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
X-List-Received-Date: Thu, 29 Oct 2015 16:05:56 -0000
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable

Changelog since 2015-10-18 until 2015-10-25.  Projects included in this =
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

=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D
Changelog for openembedded-core:

Alejandro Hernandez (1):
=20=20archiver.bbclass: Fixes and improves archiver class for kernel and =
gcc packa

Alex Franco (2):
=20=20test-empty-image: rename from core-image-empty
=20=20sanity.bbclass: expand warning when chmod fails

Andre McCurdy (2):
=20=20cairo: backport fix for compatibility with OpenGL ES 2.0
=20=20image-mklibs.bbclass: update i586 TARGET_ARCH test to i*86

An=C3=ADbal Lim=C3=B3n (3):
=20=20runqemu: Enable support for kvm without vhost in x86 and x86_64
=20=20linux-yocto{, -rt}: Enable support for virtio drivers in qemu =
machines.
=20=20runqemu-internal: Enable support for use virtio devices.

Awais Belal (1):
=20=20mesa-demos: fix deadlock in sharedtex_mt

Benjamin Esquivel (2):
=20=20populate SDK: prepare calling of bb.utils for exceptions
=20=20oeqa/selftest/manifest.py: Test support for manifests

Bruce Ashfield (6):
=20=20linux-yocto: axxia configuration updates
=20=20linux-yocto/4.1: drm/i915: Fix the VBT child device parsing for BSW
=20=20kern-tools: avoid duplicate .scc file processing
=20=20linux-yocto: skip kernel meta data branches when finding machine =
branch
=20=20linux-yocto/3.19: fix ARM boot with gcc5.x
=20=20linux-yocto: nf_tables: Add nf_tables feature

Chen Qi (2):
=20=20openssh: fix file permission for /etc/pam.d/sshd
=20=20sudo: fix file permission for /etc/pam.d/sudo

Chris Hallinan (1):
=20=20image-live: make SYSLINUX_ROOT changable in image recipes

Costin Constantin (1):
=20=20scripts/oe-publish-sdk: create directory before making git repo

Daniel Istrate (3):
=20=20oeqa/selftest/bbtests: Updated bitbake TCs
=20=20oeqa/selftest/wic: corrected testcase decorator for test18_iso_image
=20=20oeqa/selftest: Added testcase decorators.

Dmitry Eremin-Solenikov (1):
=20=20apr: remove conflict with ccache

Ed Bartosh (1):
=20=20rootfs.py: add more info to the warning message

Jeremy Puhlman (1):
=20=20Perl: Use CC version not $Config(gccversion)

Jian Liu (1):
=20=20base.bbclass: considering multilib when setting LICENSE_EXCLUSION

Joe MacDonald (1):
=20=20classes/base: provide hints on PACKAGECONFIG error

Jussi Kukkonen (1):
=20=20gtk+3: Do not try to initialize GL without libgl

Kai Kang (1):
=20=20gcc-4.x: fix wrong warning when using the universal zero initializer =
{0}

Khem Raj (10):
=20=20grub-efi, gummiboot: Emit correct path in startup.nsh
=20=20rpcbind: Fix build with uclibc
=20=20libtirpc: Refresh uclibc patches
=20=20uclibc: Fix build with gcc5
=20=20coreutils-6.9: Add missing dependency on virtual/libiconv
=20=20coreutils: Do not use host paths in getloadavg.m4
=20=20libpam: Fix build with uclibc
=20=20libtirpc: Fix a bug exposed by uclibc
=20=20systemd: Fix build with uclibc
=20=20uclibc: Implement syncfs and AT_EMPTY_PATH for all and O_PATH for arm

Leonardo Sandoval (3):
=20=20oeqa/utils/ftools: Ignore the exception if file does not exist
=20=20oeqa/utils/ftools: From functions that expect data, check if None
=20=20oeqa/selftest/buildoptions: Use the correct script for cleaning the =
workdir

Mariano Lopez (4):
=20=20oetest: Add tearDownLocal class
=20=20oeqa/runtime: Fix setUp and tearDown methods
=20=20qemurunner: Show the output of runqemu script
=20=20runqemu-ifup: Check if the tap interface is set up correctly

Mark Hatle (2):
=20=20gcc-5.2: Fix various _FOR_BUILD and related variables
=20=20gcc-target.inc: Add support for executable thats may have a suffix

Markus Lehtonen (7):
=20=20sign_rpm.bbclass: introduce GPG_PATH variable
=20=20package_manager: support GPG_PATH variable
=20=20sign_rpm.bbclass: be more verbose in case of error
=20=20sign_rpm.bbclass: make RPM_GPG_NAME a mandatory setting
=20=20Add new bbclass for package feed signing
=20=20package_manager: fail if signed feeds are enabled for ipk or dpkg
=20=20package signing: automatically export public keys

Matt Madison (1):
=20=20i2c-tools: fix inverted RDEPENDS

Maxin B. John (1):
=20=20toolchain-shar-extract.sh: provide proper path for env_setup_script

Mike Looijmans (1):
=20=20initscripts/sysfs.sh: Mount devtmpfs on /dev/ if needed

Paul Eggleton (12):
=20=20common-licenses: use correct GFDL-1.1 license text
=20=20build-compare: drop PATCHTOOL setting
=20=20tzdata: reinstate changes reverted in 2014c upgrade
=20=20devtool: extract: fix error handling
=20=20scripts/gen-lockedsig-cache: fix race with temp file creation
=20=20classes/populate_sdk_ext: consistent indentation
=20=20classes/populate_sdk_ext: prevent image construction from executing =
on insta
=20=20classes/populate_sdk_ext: add note to env setup script
=20=20classes/populate_sdk_ext: detect and warn if running in OE environment
=20=20toolchain-shar-extract.sh: print full-length title underline
=20=20devtool: handle virtual providers
=20=20classes/insane: rename invalid-pkgconfig QA check to =
invalid-packageconfig

Peter Kjellerstedt (1):
=20=20useradd_base.bbclass: Do not warn without a reason

Pushpal Sidhu (1):
=20=20gnome-desktop: add xkeyboard-config dependency

Randy Witt (3):
=20=20Add 850 codepage to uninative-tarball
=20=20mtools_4.0.18.bb: Use create_wrapper() for mcopy
=20=20wic/utils/oe/misc.py: Preserve PATH when running native tools

Richard Purdie (4):
=20=20libc-package: Fix localedef multilib dependency issues
=20=20build-appliance-image: Update to jethro head revision
=20=20scripts/oe-pkgdata-util: Fix variable name in error handling
=20=20populate_sdk_base: Ensure PKGDATA_DIR exists

Robert Yang (3):
=20=20coreutils: fix for native and nativesdk
=20=20prserv.bbclass: remove it since it is null
=20=20e2fsprogs: backport a patch to fix filetype for hardlink

Ross Burton (19):
=20=20linux-yocto-custom: fix typo in Upstream-Status tag
=20=20metadata_scm: rewrite git hash logic
=20=20rpm: remove spurious build dependencies
=20=20qemu: disable Valgrind
=20=20oeqa/selftest/bbtests: clean up local DL_DIR/SSTATE_DIR safely
=20=20oeqa/selftest: verify that devtool can use plugins in other layers
=20=20oeqa/selftest/wic: fix cleaning
=20=20oeqa/selftest: clean up selftest.inc in teardown
=20=20oeqa/selftest/wic: remove numbers from test names
=20=20oeqa/selftest: improve config writing and cleanup
=20=20Revert "runqemu-export-rootfs: update location of unfsd binary"
=20=20bitbake: add file-native to ASSUME_PROVIDED
=20=20sanity: check that the host has file installed
=20=20file: don't replace host file when built natively
=20=20rpm: add explicit dependency on file-replacement-native for native =
builds
=20=20subversion: add explicit dependency on file-replacement-native for =
native bu
=20=20lib/oe/rootfs: tell intercepts where the native sysroot is
=20=20intercepts/update_icon_cache: use STAGING_DIR_NATIVE from environment
=20=20classes/gtk-icon-cache: don't pass STAGING_LIBDIR_NATIVE to intercepts

Wenzong Fan (1):
=20=20bzip2: fix bunzip2 -qt returns 0 for corrupt archives

=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D
Changelog for meta-openembedded:

Anders Darander (1):
=20=20webmin: fix QA host-user-contaminated

Andreas M=C3=BCller (2):
=20=20libvpx: avoid CVE-2015-1258
=20=20libsdl2-image: Initial add 2.0.0

Armin Kuster (1):
=20=20wireshark: update package to 1.12.8

Carlos Rafael Giani (6):
=20=20gst-plugins-ugly: Fix opencore AMR plugin support
=20=20opencore-amr: add new recipe
=20=20vo-aacenc: add new recipe
=20=20vo-amrwbenc: add new recipe
=20=20libdvdnav: add new recipe
=20=20libsrtp: add new recipe

Chunrong Guo (1):
=20=20iperf3 :upgrade to 3.1

Fabio Berton (1):
=20=20lldpd: Add recipe

Gary Thomas (1):
=20=20poppler: Support building against QT4-embedded

Hongxu Jia (1):
=20=20postfix.inc: do not hardcode userid and groupid

Ioan-Adrian Ratiu (1):
=20=20meta-networking: recipes-connectivity: add relayd recipe

Jackie Huang (1):
=20=20vim: do not autoenable the mouse

Jagadeesh Krishnanjanappa (1):
=20=20libuio: fix build issue with gcc-5

Jason Wessel (1):
=20=20tsocks: Add tsocks to meta-network/recipes-protocols

Jens Rehsack (4):
=20=20libnftnl: update from 1.0.3 to 1.0.5
=20=20nftables: update nftables userland tools from 0.4 to 0.5
=20=20nginx: fix broken proxy_pass feature
=20=20nginx: update to 1.9.5

Joe Slater (2):
=20=20lldpad: depends on readline
=20=20dracut: RDEPEND on util-linux

Joshua Lock (1):
=20=20xerces-c: enable a native variant with BBCLASSEXTEND

Kai Kang (6):
=20=20efivar: 0.7 -> 0.21
=20=20efibootmgr: 0.6.0 -> 0.12
=20=20vorbis-tools: fix CVE-2015-6749
=20=20openldap: 2.4.41 -> 2.4.42
=20=20phpmyadmin: 4.4.9 -> 4.5.0.2
=20=20xfce4-battery-plugin: fix build on arm64

Khem Raj (4):
=20=20net-snmp: Fix build with gcc5
=20=20libnetfilter: Avoid using VLAs
=20=20luajit: Upgrade to 2.1 beta1
=20=20sysdig: Fix build with lua >=3D 5.2

Li Xin (2):
=20=20lmsensors-config: add configuration file sensord
=20=20lmsensors: remove unused service file

Manuel Bachmann (4):
=20=20mkvtoolnix: fix Boost build, update to 8.4.0, allow Qt5 GUI
=20=20gupnp-dlna: Update to 0.9.4, support gstreamer
=20=20media-service-upnp: Update to 0.5.0
=20=20rygel: Add recipe

Martin Jansa (4):
=20=20vpnc, arptables, lirc, debootstrap, log4cpp, python-ldap: drop unused =
variab
=20=20debootstrap: cleanup the recipe
=20=20lirc: use weak assignment in PACKAGECONFIG like other recipes
=20=20network-manager-applet: drop dependency on blacklisted gnome-keyring

Paul Barker (1):
=20=20vim: Upgrade to v7.4.769

Qi.Chen@windriver.com (10):
=20=20inetutils: fix rcp to work with large file
=20=20netmap-modules: fix compilation failure
=20=20drbd-utils: fix multilib problem
=20=20ntp: fix rpath QA issue
=20=20drbd: fix permission bits of drbd.service
=20=20webmin: remove perl-module-sdbm from RDEPENDS
=20=20rrdtool: fix useless-rpath QA issue
=20=20rrdtool: fix file locations
=20=20rrdtool: add systemd support and fix QA issue
=20=20rrdtool: fix multilib problem

Wenzong Fan (3):
=20=20squid: disable atomic operations for powerpc/mips
=20=20libgtop/metacity: add x11 to required DISTRO_FEATURES
=20=20gst-plugins-good: fix depends to libgudev

=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D
Changelog for meta-angstrom:

Max Krummenacher (1):
=20=20angstrom.conf: arm: use compatible glibc and glibc-locale

=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D
Changelog for meta-arago:

Gou, Hongmei (1):
=20=20packagegroup-arago-tisdk-multimedia: add dspdce-fw

Jacob Stiffler (7):
=20=20weston: Update weston.ini to show top panel
=20=20ocl: Bump version to 1.1.6
=20=20opencl-monitor: Use update-alternatives to handle firmware
=20=20matrix-gui: Bump SRCREV to resolve refresh_screen issue
=20=20unshallow-repositories: Fix for 64-bit nativesdk
=20=20gdb: Add python-modules as runtime dep for python support
=20=20ti-tisdk-setup: Extend support to keystone

Sam Nelson (2):
=20=20ipsecmgr: Update to new version 1.1.0.4
=20=20parse-ip: Update init script for keystone

=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D
Changelog for meta-atmel:

Alexandre Belloni (3):
=20=20qt4-embedded: update to 4.8.7
=20=20qtsystems: dev is already selected upstream
=20=20machines: only use the dtb name

Patrick Doyle (1):
=20=20Allow {MKUBIFS,UBINIZE}_ARGS to be overridden in local.conf

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
=20=20efl: fix build with current master meta-oe/oe-core

Daiane Angolini (1):
=20=20imx6ulevk: Configure machine to use u-boot SPL

Fabio Estevam (1):
=20=20linux-fslc (4.1): Update to revision 14b3c25b

Felipe Provenzano (1):
=20=20image_types_fsl.bbclass: Fix image generation for i.MX 6UltraLite

Otavio Salvador (3):
=20=20Remove unused patch files
=20=20u-boot-fslc: Update to revision a4338ecf
=20=20linux-timesys: Remove unused kernel

Stefan Agner (4):
=20=20imx-base.inc: add default tune for Vybrid
=20=20linux-fslc (4.1): Update to latest version 622e3d41
=20=20linux-fslc (4.1): Add defconfig for Vybrid SoCs
=20=20twr-vf65gs10: move to Linux 4.1 based linux-fslc tree

=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D
Changelog for meta-fsl-arm-extra:

Ian Coolidge (1):
=20=20linux-boundary (3.14.28): Bump SRCREV to fee85e4

Matt Madison (1):
=20=20linux-wandboard: update SRCREV for gcc 5.2 build fixes.

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

Anuj Mittal (2):
=20=20meta-isg: dpdk: fix v2.0.0 build with kernel 4.1
=20=20meta-isg: dpdk: fix v1.8.0 build with kernel 4.1

Azril Ahmad (1):
=20=20libva-intel-driver: Fix timestamping issue for VC1/WMV VAAPI decode =
under BS

Ross Burton (1):
=20=20xorg-driver: remove duplicate files from oe-core

Saul Wold (1):
=20=20linux-yocto-4.1: Update SRCREV to include additional patches

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
=20=20core-image-mono-console: add console only image based on =
core-image-minimal
=20=20core-image-mono.inc: add tzdata to images

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

=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D
Changelog for meta-qt5:

Martin Jansa (1):
=20=20qt5: upgrade to latest revision in 5.5 branch (5.5.1+)

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

Denys Dmytriyenko (2):
=20=20linux-ti-staging: update to 4.1.10 and all recent merges
=20=20u-boot-ti-staging: update to the lates, change Keystone build steps

Gou, Hongmei (1):
=20=20dspdce-fw: update recipe to build dspdce-fw from git source

Jacob Stiffler (3):
=20=20omapdrm-pvr: bump SRCREV for am3 and am4
=20=20ti-ccsv6-native: Add CCS 6.1.1.00022
=20=20cmem: Bump SRCREV to support LPAE in DT processing

Sam Nelson (21):
=20=20common-csl-ip: Update new version for Keystone2 02.01.01.00
=20=20rm-lld: Update to new version 2.1.2.0
=20=20qmss-lld: Update to new version 2.1.0.11
=20=20cppi-lld: Update to new version 2.1.0.10
=20=20hplib: Update to new version 1.1.0.6
=20=20dfe-lld: Update to new version 1.0.0.5
=20=20hyplnk-lld: Update to new version 2.1.0.5
=20=20iqn2-lld: Update to new version 1.0.0.8
=20=20pktlib: Update to new version 2.1.0.5
=20=20nwal-lld: Update to new version 2.1.0.8
=20=20srio-lld: Update to new version 2.0.0.13
=20=20traceframework: Update to new version 1.1.1.7
=20=20mpm-transport: Update to new version 1.0.8.3
=20=20multiprocmgr: Update to new version 2.0.1.10
=20=20engine-pkcs11: Update to new version 1.3.0.1
=20=20netapi: Update commit id of final version of 1.1.0.6
=20=20ipc/ipc-transport: Update to new version 2.0.0.0
=20=20ti-softhsmv2: Update to new version 1.3.0.4
=20=20pa-lld: Update to new version 3.0.1.5
=20=20sa-lld: Update to new version 3.0.0.11
=20=20aif2-lld: Add low level driver package for keystone2 antenna interface

=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D
Changelog for meta-webos:

=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D
Changelog for meta-xilinx:

=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D
Changelog for meta-yocto:

=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D
Changelog for openembedded:



