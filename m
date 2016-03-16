Return-Path: <cliff.brake@gmail.com>
Received: from mail-qk0-f180.google.com (mail-qk0-f180.google.com
	[209.85.220.180])
	by mail.openembedded.org (Postfix) with ESMTP id 33E8A60746;
	Wed, 16 Mar 2016 21:56:44 +0000 (UTC)
Received: by mail-qk0-f180.google.com with SMTP id s5so27400893qkd.0;
	Wed, 16 Mar 2016 14:56:45 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=date:mime-version:message-id:from:to:subject
	:content-transfer-encoding;
	bh=jeUUBf6YeJBhrmOPug04duUS/YL/gX1mIz9NZLDZzu0=;
	b=CdExYYKASO3JK9XpGNRWNtMgY3YM6xwo/o0ePkDpSxwJx22tLSwYNvE0bu4vSpGA0a
	hCib4hHPbmQUi9YJvGmIPqTMjVRt10+QTjzjrQQz8bHB9KvQGySXpgrkp1UWNiTwy5Eq
	AidIgak4ohv+l1eVXAwlTiOWppNSzM8fQnJT3Ok7lrIIQVidQpguW5TRMsN7zqkZ9B4M
	z5C5YkJZgIzPdNW6JR0ndQXrqGDP35RaMXRiOUEPjJqbdJOpxNkCvHBVWachFR3+rWHO
	c13ou2tbVEKcM5wcWauwwk/NMu5YwMthgUCTrD79/YhFUQ4yOCD/Wjou+mlwqv19ERbs
	baWA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20130820;
	h=x-gm-message-state:date:mime-version:message-id:from:to:subject
	:content-transfer-encoding;
	bh=jeUUBf6YeJBhrmOPug04duUS/YL/gX1mIz9NZLDZzu0=;
	b=Iju7uJHxOEhLHL9oyHEcl4ea/0kdKRMh8srQr7Mn5cAcBjexv2O01g7JEuapEwp3VK
	2Bo2xhC2L/3r+QvC1XujZJ0xyoKxod2L+QIWB5DGIoFJ5EghnPkIox0qE8yzgAhHUMO0
	+50aQtvo027y/gUVBENp/uKmeYDZ+VJxqU0CU6vQxHzqWQvZK4aUYJvWXV/pnvVLFB2l
	jrjPrsin2sW/0wyzGmNmeMw2q2ayNEM81KbXbx4g8cLJEMOgbykQOJioq7xtPzmA8EBd
	apamlaccjqnzT6W5f/5eWRaPfs1C8mOUoIadWbvhwIiQ4ShJ6jkuDhifi/coSu445NYB
	fLEw==
X-Gm-Message-State: AD7BkJKxLj3LIF7QtBnrZeDT5V4Yh11zfYZEOPNg+7pDugCb+/r5lST7DkbZRHOjIfZqNA==
X-Received: by 10.55.77.216 with SMTP id a207mr9090043qkb.80.1458165405135;
	Wed, 16 Mar 2016 14:56:45 -0700 (PDT)
Received: from [127.0.0.1] (cable2-pool191-cs-134.doycomm.com.
	[66.219.191.134])
	by smtp.gmail.com with ESMTPSA id 63sm2404650qgz.24.2016.03.16.14.56.42
	(version=TLSv1/SSLv3 cipher=OTHER);
	Wed, 16 Mar 2016 14:56:43 -0700 (PDT)
Date: Wed, 16 Mar 2016 14:56:43 -0700 (PDT)
X-Google-Original-Date: Wed, 16 Mar 2016 21:56:41 GMT
MIME-Version: 1.0
X-Mailer: Nodemailer (0.3.22; +http://andris9.github.com/Nodemailer/)
Message-Id: <1458165401822.c81d1573@Nodemailer>
From: cliff.brake@gmail.com
To: openembedded-core@lists.openembedded.org,
	openembedded-devel@lists.openembedded.org,
	angstrom-distro-devel@linuxtogo.org, meta-ti@yoctoproject.org
Subject: OE Changelog since 2016-03-06 until 2016-03-13
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
X-List-Received-Date: Wed, 16 Mar 2016 21:56:48 -0000
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable

Changelog since 2016-03-06 until 2016-03-13.  Projects included in this =
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

Belen Barros Pena (2):
=20=20toaster: change 'revision' to 'Git revision'
=20=20toaster: bring back the strict directive

Brendan Le Foll (1):
=20=20fetch2/npm: fix ud.registry so that alternative registries can be =
handled

Dave Lerner (1):
=20=20toaster: fixup dependency excludes for customimage

Ed Bartosh (11):
=20=20toaster: raise NotImplementedError
=20=20toaster: don't use sshbecontroller
=20=20toaster: remove sshbecontroller module
=20=20toasterui: reformat list of events
=20=20toasterui: update list of events
=20=20command: make setEventMask readonly
=20=20toasterui: check if setEventMask succeeded
=20=20toasterui: make toasterui to work in build mode
=20=20toasterui: exit on final events
=20=20toasterui: fix warning 'Unknown event'
=20=20xmlrpc: fix bug in setting XMLRPCServer.single_use

Elliot Smith (1):
=20=20toaster: rework task buildstats storage and display

Lucas Dutra Nunes (1):
=20=20server/process: Try connecting 4 times before giving up

Michael Wood (2):
=20=20toaster: views api Package info return both kinds of RDEPENDS
=20=20toaster: models List only have the specified project's imported layers

Paul Eggleton (6):
=20=20fetch2/npm: fix indentation
=20=20fetch2/npm: handle alternative dependency syntax
=20=20fetch2/npm: ignore unknown headers in tarballs
=20=20fetch2/npm: fix errors with some version specifications
=20=20fetch2/npm: properly handle npm dependencies
=20=20fetch2/npm: add missing URL argument to ParameterError

Peter Kjellerstedt (1):
=20=20fetch2: Make SRC_URI[md5sum] and SRC_URI[sha256sum] expand their =
values

Sujith H (1):
=20=20toaster: use force_bytes to display non-ascii project names

=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D
Changelog for openembedded-core:

Alejandro del Castillo (1):
=20=20busybox.inc: add tail symlink so busybox can commit suicide cleanly

Alexander Kanavin (23):
=20=20qemu.bbclass: add qemu_wrapper_cmdline()
=20=20python3-native: use the previous version of python-config script
=20=20python3: fix patching get_python_lib() in distutils/sysconfig.py
=20=20gobject-introspection: add the recipe
=20=20gtk-doc-stub: remove introspection stubs
=20=20gobject-introspection.bbclass: add a class that enables gobject =
introspectio
=20=20vala: enable the use of vapigen by packages with vala support
=20=20vala.bbclass: remove pre-packaged vapigen.m4 from tarballs
=20=20avahi-ui: remove the dependency on python-pygtk by disabling =
avahi-discover
=20=20python-pygtk: remove the recipe
=20=20avahi: enable gobject-introspection
=20=20gtk+: enable gobject introspection
=20=20gtk+3: enable gobject-introspection
=20=20clutter: enable gobject introspection
=20=20libsoup-2.4: enable gobject introspection
=20=20gstreamer: enable gobject introspection
=20=20gnomebase.bbclass: do not disable gobject introspection
=20=20python-pygobject: update to 3.18.2
=20=20recipes-gnome: fix introspection support
=20=20webkitgtk: enable gobject introspection
=20=20packagegroup-core-x11-sato: add python-pygobject and gtk+3
=20=20bitbake.conf: add 'gobject-introspection-data' to =
DISTRO/MACHINE_FEATURES_BA
=20=20musl: disable building of gobject introspection data

Andre McCurdy (2):
=20=20gcc-runtime.inc: disable libitm for little endian MIPS too
=20=20oe-setup-builddir: tidy up local.conf and bblayers.conf commentary

Armin Kuster (2):
=20=20nettle: Security fix CVE-2015-8803 and CVE-2015-8805
=20=20nettle: Security fix CVE-2015-8804

Bruce Ashfield (5):
=20=20linux-yocto/kernel-meta: ktype refactoring: move DEBUG_KERNEL, EXPERT =
and EM
=20=20linux-yocto/4.4: iwlwifi: mvm: don't allow sched scans without =
matches to be
=20=20linux-yocto/4.4: explicitly enable ftrace in tracing fragment
=20=20linux-yocto/4.4: Galileo updates
=20=20linux-yocto/4.4: gpio-pca953x: add "drive" property

Catalin Enache (1):
=20=20perl: fix missing dependency for perl-misc

Chang Rebecca Swee Fun (2):
=20=20tune-corei7.inc: Fix PACKAGE_EXTRA_ARCHS for corei7-32
=20=20make 4.1: fix segfault when ttyname fails

Chris Austen (1):
=20=20siteinfo: Add ppc64le support.

Daniel Istrate (1):
=20=20oeqa/selftest/buildoptions: Test build does not fail without git rev

Elliot Smith (1):
=20=20toaster.bbclass: improve how we gather buildstats for Toaster

He Zhe (1):
=20=20acl: Fix re pattern in test cases

Helio Chissini de Castro (2):
=20=20gcc: Fix the license on GNU OpenMP
=20=20gcc: Fix the license on GNU OpenMP

Herve Jourdain (1):
=20=20systemd: binfmt should be added to SYSTEMD_PACKAGES only if binfmt is =
enable

Hongxu Jia (3):
=20=20ghostscript: 9.16 -> 9.18
=20=20python3: fix do_configure check platform triplet error
=20=20python-numpy: fix buildpaths QA issue

Humberto Ibarra (2):
=20=20scripts/oe-selftest: Add search expression matching to run/list =
options
=20=20scripts/oe-selftest: Add short names to most common options

Ioan-Adrian Ratiu (6):
=20=20gpg_sign: add local ipk package signing functionality
=20=20gpg_sign: detach_sign: fix gpg > 2.1 STDIN file descriptor
=20=20gpg_sign: export_pubkey: add signature type support
=20=20signing-keys: create ipk package
=20=20package_manager: sign IPK package feeds
=20=20sign_package_feed: add feed signature type

Jagadeesh Krishnanjanappa (1):
=20=20license.bbclass: fix host contamination warnings for license files

Jens Rehsack (1):
=20=20avahi: make dbus optional but default

Johannes Pointner (1):
=20=20xserver: require sufficiently new libdrm

Joshua Lock (3):
=20=20lib/sstatesig: skip shared_workdir when checking locked sigs
=20=20builder: remove hob from autostart
=20=20build-appliance: make the inclusion of downloaded sources optional

Juro Bystricky (1):
=20=20ncurses_6: Fix an install race condition

Khem Raj (4):
=20=20nspr: Fix build regression on musl from last upgrade
=20=20net-tools: Override CFLAGS/LDFLAGS in do_install too
=20=20strace: Backport fixes for compiling with clang
=20=20valgrind: Make dep on glibc-utils conditional on TCLIBC =3D glibc

Li Zhou (2):
=20=20net-tools: Add SCTP option support
=20=20fontconfig: Revert changes made to FcConfigAppFontAddDir() recently

Marek Vasut (1):
=20=20gcc: Disable libitm for nios2

Mariano Lopez (3):
=20=20selftest/prservice.py: Sanitize package version when looking for stamp
=20=20selftest/bblayers.py: Remove harcoded recipe files
=20=20package_manager.py: Fix race condition in OpkgIndexer.write_index()

Mark Hatle (8):
=20=20rpm: Uprev to rpm-5.4.16 (pre) and rpm-5.4+cvs to current CVS head
=20=20security_flags.inc: Special flags are needed for RPM
=20=20rpm: Enable specific crypto and digest settings via variables
=20=20rpm: A number of the patches have been submitted upstream
=20=20rpmresolve: It is not necessary to manually specify -lpopt
=20=20db: remove the NO_UPDATE_REASON and replace it a comment about RPM
=20=20rpm: Fix musl integration with RPM5
=20=20rpm: Sync CVS to regular version

Maxin B. John (2):
=20=20eudev: provide UPSTREAM_CHECK_URI
=20=20lsof: update UPSTREAM_CHECK_URI

Nathan Rossi (2):
=20=20feature-arm-thumb.inc: Fix thumb tune override warning
=20=20gcc: Disable libitm for MicroBlaze

Patrick Ohly (4):
=20=20image creation: allow overriding .rootfs suffix
=20=20image.bbclass: fix incomplete .rootfs customization
=20=20image.bbclass: support chaining compression (aka conversion) commands
=20=20image-buildinfo.bbclass: fix performance problems

Paul Eggleton (14):
=20=20recipetool: create: fix support for AX_CHECK_LIBRARY
=20=20bblayers.conf.sample: remove BBLAYERS_NON_REMOVABLE
=20=20conf/documentation.conf: remove BBLAYERS_NON_REMOVABLE
=20=20classes/packageinfo: remove
=20=20scripts/hob: drop
=20=20recipetool: create: be more tolerant of spacing in configure.ac
=20=20recipetool: create: improve mapping for autotools program macros
=20=20recipetool: create: match *LICENSE* as a license file
=20=20recipetool: create: add license file crunching
=20=20recipetool: create: split npm module dependencies into packages
=20=20recipetool: create: check if npm available if npm:// URL specified
=20=20recipetool: create: support creation of additional files by plugins
=20=20recipetool: create: shrinkwrap and lockdown npm modules
=20=20classes/buildhistory: record a few more variables for extensible SDK

Peter Kjellerstedt (1):
=20=20Revert "gstreamer1.0-plugins-XXX: move inherit gettext into common =
.inc file

Randy Witt (1):
=20=20populate_sdk_ext: Make populate_sdk_ext nostamp

Ricardo Ribalda Delgado (3):
=20=20perl-rdepends: Remove circular dependencies
=20=20package_deb: Fix python runtime error
=20=20package-deb: Ignore circular dependencies

Richard Purdie (26):
=20=20bitbake.conf: Add libgcc-native to ASSUME_PROVIDED
=20=20createrepo: Fix stat floating timestamps
=20=20ext-sdk-prepare: Catch setscene tasks which should have run but didn't
=20=20insane/prelink: Handle nonstandard library paths
=20=20linuxloader/image-prelink/image-mklibs: Fix non-standard path =
prelinking
=20=20sstate: Allow late expansion of NATIVELSBSTRING
=20=20gtk3+: Add missing DEPENDS on wayland-native
=20=20dkpg: Use tar everywhere (not gtar)
=20=20uninative-tarball: Add glibc-gconv-iso8859-1 for guile
=20=20glibc: Add relocation of GCONV_PATH
=20=20uninative: Use CXX11 ABI for interoperation between gcc4 and gcc5
=20=20uninative: Refactor common code
=20=20uninative: Add checksum support
=20=20uninative: Handle relocate of GCONV_PATH in libc
=20=20mtools: Drop GCONV_PATH manipulation
=20=20yocto-uninative: Add common include for uninative
=20=20populate_sdk_ext: Update after uninative changes
=20=20populate_sdk_ext: Correct commit =
8b81bb56c69aabdea984352f8e267a9783c0bdbc
=20=20qemu: Limit paths searched during user mode emulation
=20=20gobject-introspection: Override GIO_MODULE_DIR when scanning
=20=20machine/include/arch-x86: Make x32 ABI not supporting =
gobject-introspection-
=20=20uninative: Add a fix for icu-native to use the correct ABI
=20=20oeqa/recipetool: Improve debugging output by adding dirlist
=20=20oeqa/recipetool: Fix syntax error
=20=20Revert "packagegroup-core-x11-sato: add python-pygobject and gtk+3"
=20=20oeqa/selftest/recipetool: Fix test_recipetool_create_simple

Robert Joslyn (1):
=20=20btrfs-tools: Add libgcc to RDEPENDS

Ross Burton (18):
=20=20formfactor: assume a keyboard is plugged in
=20=20gdb: fix builds with internal readline and no static libraries
=20=20xdg-utils: remove trailing whitespace in multiline string
=20=20openssl: add a patch to fix parallel builds
=20=20xmlto: ensure /bin/bash is used as bash
=20=20uninative: correctly enable uninative
=20=20xcursor-transparent-theme: use a version glob in the selftest bbappend
=20=20eudev: remove redundant udev_run assignment
=20=20avahi: add missing intltool-native build dependency
=20=20avahi-ui: add dbus to PACKAGECONFIG
=20=20image-prelink: use STAGING_*_NATIVE variables
=20=20xmlto: tell xmlto where cp is
=20=20glib-2.0: silence warnings when parsing headers for introspection
=20=20nettle: disable static for 2.7.1
=20=20systemd: add comment stating that resolved needs gcrypt
=20=20glib-2.0: relocate the GIO module directory for native builds
=20=20python: move ast module into python-core
=20=20Revert "gcc: Fix the license on GNU OpenMP"

Trevor Woerner (1):
=20=20tune-cortexa17.inc: apply changes similar to a15

Tyler Hall (1):
=20=20image-mklibs: handle position independent binaries

Zawadzki, Krzysztof (Nokia - PL/Wroclaw) (1):
=20=20meta: toolchain-shar-relocate.sh: Fix for extracting SDK in the same =
directo

Zhixiong Chi (1):
=20=20libpam: define limits.conf as CONFFILES of package libpam-runtime

brian avery (1):
=20=20toaster.bbclass: show packages that were setscened into existence too

ngutzmann (1):
=20=20nettle: The variable named p in the patch file was incorrectly named.

=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D
Changelog for meta-openembedded:

Anders Roxell (1):
=20=20cunit: delete *.la files

Chang Rebecca Swee Fun (1):
=20=20libvpx: upgrade to version 1.5.0

Martin Jansa (2):
=20=20freerdp: properly fix QA issue
=20=20Revert "toybox: upgrade to 0.7.0"

Qi.Chen@windriver.com (1):
=20=20python-vcversioner: add native extension

Rafa=C3=ABl Carr=C3=A9 (4):
=20=20vlc: Fix typo introduced in 0f2b3139521570ad494a72399f8a9dae76e69b16
=20=20vlc: update to 2.2.2
=20=20vlc: fix build with ffmpeg 3.0
=20=20vlc: add libpng PACKAGECONFIG (on by default)

=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D
Changelog for meta-angstrom:

=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D
Changelog for meta-arago:

Denys Dmytriyenko (7):
=20=20arago.conf: bump distro version
=20=20ipc-test-fw: remove, sample FW images are now provided by ipc
=20=20branding-core: adjust FW image priorities for CoreSDK testing
=20=20branding-core: fix priority for ti-ipc-rtos package
=20=20arago.conf: don't use --prefer-arch-to-version flag
=20=20image_types_md5, arago.conf: add xz.md5 support
=20=20ltp-ddt: update to the latest, drop upstreamed patch

Gou, Hongmei (1):
=20=20libnl-xfrm: create symlink between netlink and libnl3/netlink dirs

Karthik Ramanan (2):
=20=20gstreamer1.0-plugins-bad: Update SRCREV
=20=20gstreamer1.0-plugins-vpe: Update SRCREV

=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D
Changelog for meta-atmel:

=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D
Changelog for meta-beagleboard:

=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D
Changelog for meta-browser:

Martin Jansa (3):
=20=20recipes: Replace "mv" with "cp -R --no-dereference =
--preserve=3Dmode,links"
=20=20chromium: fix parsing with wayland enabled
=20=20chromium: fix build with newer gcc

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

Hector Palacios (1):
=20=20imx-usb-loader: add recipe

Yuqing Zhu (1):
=20=20alsa-state: Using one unified version to set configuration values for =
mx6/mx

=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D
Changelog for meta-fsl-arm-extra:

Stefan Agner (2):
=20=20linux-toradex: update to latest Toradex V2.5 release
=20=20u-boot-toradex: update to latest Toradex V2.5 release

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

California Sullivan (1):
=20=20linux-yocto/4.1: Update to Linux 4.1.18

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

=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D
Changelog for meta-netbookpro:

=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D
Changelog for meta-nodejs:

Ilkka Myller (3):
=20=202016-03-08 Version 0.12.12 (LTS) Release
=20=202016-03-08, Version 4.4.0 'Argon' (LTS)
=20=202016-03-08, Version 5.8.0 (Stable)

=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D
Changelog for meta-nslu2:

=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D
Changelog for meta-opie:

=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D
Changelog for meta-qt3:

=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D
Changelog for meta-qt5:

Jonathan Liu (1):
=20=20qtwebengine: enable ARMv7VE support

Paul Eggleton (1):
=20=20Add .gitignore to ignore .pyc/.pyo files

=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D
Changelog for meta-slugos:

=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D
Changelog for meta-systemd:

=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D
Changelog for meta-raspberrypi:

=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D
Changelog for meta-smartphone:

Martin Jansa (9):
=20=20packagegroup-shr*: drop elbow
=20=20kernel_android: fix initramfs-android-image dependency
=20=20abootimg: add explicit EXTRA_OEMAKE
=20=20initramfs-android-image: increase INITRAMFS_MAXSIZE
=20=20initramfs-android-image: set IMAGE_ROOTFS_EXTRA_SPACE to 0
=20=20linux-hp-tenderloin: Fix dependency on INITRAMFS_IMAGE

=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D
Changelog for meta-ti:

Denys Dmytriyenko (15):
=20=20multiprocmgr-test: don't repackage between machines, as only K2 uses =
it
=20=20am335x-evm: add ttyO3 support for ICE variant
=20=20k2g-evm: add alsa to machine features list
=20=20prueth-fw: add FW images for AM437x
=20=20linux-ti-staging: update with connectivity fixes
=20=20u-boot-ti-staging: update with DLL_CALIB_CTRL fix for AM57xx
=20=20ipumm-fw: remove old versions
=20=20ipumm-fw: update to 3.00.10.00 version
=20=20dspdce-fw: replace mkdir/cp with install
=20=20ipumm-fw: use update-alternatives to manage FW symlink
=20=20ti-ipc-rtos: preserve FW dir structure, use update-alternatives for =
test_omx
=20=20am335x: use ttyS to check for actual device, while 8250 is disabled
=20=20conf/machine: enable tar.xz images for current machines
=20=20linux-ti-staging: update with latest connectivity fixes
=20=20u-boot-ti-staging: update with latest fixes

Jacob Stiffler (5):
=20=20edma3-lld-rtos: Point TMS470_CGTOOLS to correct toolchain
=20=20HACK: edma3-lld-rtos: Add dependency on all toolchains
=20=20openmp-rtos: Upgrade to version 2.2.1.1
=20=20debugss-module-drv: Add support for k2e-evm
=20=20openmp-rtos: Upgrade to 2.2.1.2

Justin Sobota (2):
=20=20ti-sysbios: Update to 6.45.01.29
=20=20ti-xdctools: Update to verion 3.32.00.06

=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D
Changelog for meta-webos:

=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D
Changelog for meta-xilinx:

=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D
Changelog for meta-yocto:

Alejandro Hernandez (2):
=20=20linux-yocto: Update SRCREV for genericx86* for 4.1
=20=20linux-yocto: Update SRCREV for genericx86* for 4.4

Mariano Lopez (1):
=20=20yocto-bsp: Update templates to 4.4 kernel

Paul Eggleton (2):
=20=20bblayers.conf.sample: remove BBLAYERS_NON_REMOVABLE
=20=20conf/distro/include: drop old recipes

Richard Purdie (1):
=20=20poky: Enable uninative

=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D
Changelog for openembedded:



