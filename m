Return-Path: <cliff.brake@gmail.com>
Received: from mail-ig0-f174.google.com (mail-ig0-f174.google.com
	[209.85.213.174])
	by mail.openembedded.org (Postfix) with ESMTP id 61A5A7669F;
	Wed,  9 Sep 2015 14:46:02 +0000 (UTC)
Received: by igcpb10 with SMTP id pb10so106228342igc.1;
	Wed, 09 Sep 2015 07:46:03 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=date:mime-version:message-id:from:to:subject:content-type
	:content-transfer-encoding;
	bh=aMMkEKCbnPOjUNpHz0LGGHEpmznV2mUe23sn2oHXJCc=;
	b=0a5StlprRIwifZQPh7ArRhQZP9DsKBJINEj0vPrO18DPYHsALdZtV4Lw8zxw8V42Jg
	cF/LHMVfQSRhV1weTZEC18cbCvTCAa+eIN2PAEL3x1hbEWmOmZjzYJNg2c7tuaqTFVy+
	66vq51v0Cd8xpWjxQRZ7gqn7UVuCwHG70HL7s3al1JlMKOtkopbqdCh/DpkcJ6lUGndG
	z7LuI4oZ8R7D93MzcIJWrl/gu1mWeWDplDzeM1IN/MXMyc0DKR8fXY/I50rVgNeWg/xa
	YtXT4xnD5VDl57M5niekckxDGiyblkPOZkMcDyyh0GkPvg8+SuEf6G6LMHwBq5CGfsX6
	vC4w==
X-Received: by 10.50.22.70 with SMTP id b6mr14227565igf.97.1441809962554;
	Wed, 09 Sep 2015 07:46:02 -0700 (PDT)
Received: from [127.0.0.1] (cable2-pool191-cs-134.doycomm.com.
	[66.219.191.134])
	by smtp.gmail.com with ESMTPSA id 75sm4695564ion.16.2015.09.09.07.46.00
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
	Wed, 09 Sep 2015 07:46:01 -0700 (PDT)
Date: Wed, 09 Sep 2015 07:46:01 -0700 (PDT)
X-Google-Original-Date: Wed, 09 Sep 2015 14:45:59 GMT
MIME-Version: 1.0
X-Mailer: Nodemailer (0.3.22; +http://andris9.github.com/Nodemailer/)
Message-Id: <1441809959946.e2e8647c@Nodemailer>
From: cliff.brake@gmail.com
To: openembedded-core@lists.openembedded.org,
	openembedded-devel@lists.openembedded.org,
	angstrom-distro-devel@linuxtogo.org, meta-ti@yoctoproject.org
Subject: OE Changelog since 2015-08-30 until 2015-09-06
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
X-List-Received-Date: Wed, 09 Sep 2015 14:46:04 -0000
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable

Changelog since 2015-08-30 until 2015-09-06.  Projects included in this =
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

Alex Franco (1):
=20=20cooker/runqueue: Allow bitbake commands starting with do_

Belen Barros Pena (3):
=20=20toaster: disable build button as needed
=20=20toaster: show incomplete configuration warning
=20=20toaster: improve explanation of checkout dir

Benjamin Esquivel (2):
=20=20utils: Specify dest file name in movefile()
=20=20utils: Fix a potential error in movefile

Christopher Larson (6):
=20=20build: delete tasks thoroughly
=20=20bb.data_smart: retain traceback from ExpansionError
=20=20bb.cookerdata: include useful traceback for ExpansionError/ParseError
=20=20bb.fetch.git: remove leading '.' from gitsrcname
=20=20bb.fetch: handle checksums consistently for mirrors
=20=20bb.fetch: don't remove the clone when an update fails

Elliot Smith (6):
=20=20toaster: Make 0021 migration compatible with MySQL
=20=20toaster: Improve how default project is identified and fetched
=20=20toaster: Only redirect to projects page if user has added projects
=20=20toaster: Exclude default project unless it has builds
=20=20toaster: Fix test for projects page JSON
=20=20toaster: Add tests for pages which show the default project

Richard Purdie (1):
=20=20event/server: Add _uiready flag to handle missing error messages

=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D
Changelog for openembedded-core:

Alejandro del Castillo (1):
=20=20opkg: upgrade to v0.3.0

Alex Franco (2):
=20=20Fix mode +st on TMPDIR when creating it
=20=20Fix recursive mode -st on BUILDDIR setup

Alexander Kanavin (17):
=20=20upstream_tracking.inc: deprecate and move contents to recipes
=20=20dropbear: update to 2015.68
=20=20libnotify: don't inherit unnecessary distro_features_check
=20=20e2fsprogs: explain why there is no update for now
=20=20package_regex.inc: updates to improve upstream tracking
=20=20cmake: update to 3.3.1
=20=20dpkg: update to 1.18.2
=20=20ccache: update to 3.2.3
=20=20mailx: update to 12.5-5
=20=20net-tools: update to 1.60-25
=20=20mkelfimage: add RECIPE_NO_UPDATE_REASON
=20=20python-async: update to 0.6.2
=20=20python-smmap: update to 0.9.0
=20=20remake: update to 4.1+dbg-1.1
=20=20vte: add RECIPE_NO_UPDATE_REASON
=20=20package_regex.inc: various updates to improve RRS accuracy
=20=20libunique: remove the recipe

Andreas M=C3=BCller (1):
=20=20libnotify: add (R)PROVIDES/RCONFLICTS/RREPLACES for meta-gnome's =
libnotify

An=C3=ADbal Lim=C3=B3n (1):
=20=20qemu: Fix qemu_cpu_kick_thread on init

Christopher Larson (12):
=20=20iw: add recipe from meta-networking
=20=20iw: inherit pkgconfig
=20=20iw: obey our target path variables
=20=20iw: support and enable separate build dir
=20=20packagegroup-base: pull in iw as well as wireless-tools
=20=20bitbake.conf: add MIRROR vars to SRC_URI vardeps
=20=20packagegroup-core-x11-sato: obey the pulseaudio distro feature
=20=20pulseaudio: pass --with-systemduserunitdir
=20=20pulseaudio: add 'autospawn-for-root' PACKAGECONFIG
=20=20insane.bbclass: handle tests which need fakeroot
=20=20insane.bbclass: add host-user-contaminated test
=20=20image.bbclass: add rootfs_check_host_user_contaminated

Cristian Iorga (1):
=20=20iproute2: upgrade to 4.1.1

Ed Bartosh (41):
=20=20wic: add BitbakeVars class
=20=20wic: create new method _parse_line
=20=20wic: add default_image attribute to BitbakeVars
=20=20wic: set default image
=20=20wic: implement getting variables from .env files
=20=20wic: implement --vars option
=20=20image_types.bbclass: add wic image type
=20=20image.py: write bitbake variables to .env file
=20=20oe-selftest: test generation of <image>.env
=20=20wic-image-minimal: add wic image recipe and .wks
=20=20oe-selftest: test building wic image by bitbake
=20=20wic: use bitbake variable ROOTFS_SIZE
=20=20oe-selftest: wic: fix test19_image_env test case
=20=20devtool: build-image: stop using add_md5
=20=20devtool: make 2 functions public
=20=20Revert "devtool: make add_md5 a public API"
=20=20devtool: build-image: rename LOG -> logger
=20=20devtool: build-image: improve help and description
=20=20devtool: build-image: filter out recipes
=20=20devtool: build-image: generate notification callback
=20=20devtool: build-image: add extra logging
=20=20devtool: build-image: remove <image>.bbappend
=20=20devtool: build-image: add comments
=20=20oe-selftest: test devtool build-image plugin
=20=20wic: use ext4 in canned .wks files
=20=20wic: get rid of scripts/lib/image
=20=20oe-selftest: wic: configure a build
=20=20wic: add test cases for 3 images
=20=20wic: fix typo
=20=20wic: remove micpartition.py
=20=20wic: remove micboot.py
=20=20wic: fix errors in partition.py module
=20=20wic: get rid of wildcard imports
=20=20wic: fix pylint warning multiple-statements
=20=20wic: use optparse instead of cmdln
=20=20wic: fix pylint warning no-member
=20=20wic: fix pylint warning unused-variable
=20=20wic: fix pylint warning redefined-builtin
=20=20wic: get rid of listing properties
=20=20wic: fix short variable names
=20=20image.py: rename _write_env -> _write_wic_env

Jian Liu (1):
=20=20sdk.py: fix conflicts of packages

Joe Slater (4):
=20=20debianutils: create package for run-parts
=20=20ifupdown: import recipe
=20=20ifupdown: create alternative links
=20=20libinput: avoid --enable-event-gui=3Dauto

Josep Puigdemont (1):
=20=20qemu: enable alsa only if in DISTRO_FEATURES

Josh Cartwright (1):
=20=20rt-tests: drop unnecessary added-missing-dependencies.patch

Joshua Lock (8):
=20=20busybox: fixes for when base_bindir !=3D /bin
=20=20systemd: remove hard-coded paths in FILES entries
=20=20alsa-utils: handle udev dir being 2 levels below /
=20=20pulseaudio: handle udev dir being 2 levels below /
=20=20bluez: handle udev dir being 2 levels below /
=20=20pcmciautils: handle udev dir being 2 levels below /
=20=20nfs-utils: don't force use of /sbin as sbindir
=20=20procps: fix for base_sbindir =3D=3D sbindir

Jussi Kukkonen (7):
=20=20nettle: Fix binary license to LGPLv2.1+
=20=20gmp: Bring back version 4.2.1 (LGPL 2.1+)
=20=20nettle: Add (LGPLv3) version 3.1.1
=20=20nettle: Add ptests
=20=20gnutls: Upgrade 3.3.14 -> 3.3.17.1
=20=20mirrors.bbclass: Update gnutls mirrors
=20=20openssh: Upgrade 7.0p1 -> 7.1p1

Kai Kang (1):
=20=20screen: fix parallel build failure

Kevin Hao (1):
=20=20kernel.bbclass: add the runtime dependency on kernel-vmlinux for =
kernel-imag

Khem Raj (1):
=20=20binutils: Fix symbols with --dynamic-list when using gold linker

Leonardo Sandoval (3):
=20=20insane.bbclass: Check for invalid characters (non UTF8) on recipe =
metadata
=20=20lib/oe/package_manager: Include PACKAGE_FEED_PREFIX instead of =
hardcode path
=20=20gcc-target.inc: Remove non-related gcc headers from include_fixed =
folder

Li Zhou (2):
=20=20valgrind: enable rt_sigpending syscall on ppc64 linux
=20=20libunwind: Security Advisory - libunwind - CVE-2015-3239

Li xin (1):
=20=20sysstat: add systemd service files

Lucian Musat (1):
=20=20oeqa/decorators: Fixed a problem with tests having the same names.

Mariano Lopez (3):
=20=20qemurunner: Added host dumps when there are errors
=20=20runexported: Make it compatible with host dump
=20=20qemurunner: Handle lack of data on run serial gracefully

Mario Domenech Goulart (1):
=20=20cross-canadian.bbclass: typo fix in comments =
(s/repsonsible/responsible/)

Markus Lehtonen (7):
=20=20createrepo: disable RPM signature validation
=20=20package_rpm: support signing of rpm packages
=20=20os-release: add the public package-signing key
=20=20package_manager: support for signed RPM package feeds
=20=20devtool: make required tasks be run in kernel build
=20=20devtool: extract: correct initial rev for kernel packages
=20=20devtool: run kernel dependencies

Martin Jansa (2):
=20=20pulseaudio: improve PACKAGECONFIG for dbus/consolekit dependencies
=20=20report-error: send only last 5242000 characters in error logs

Patrick Ohly (9):
=20=20mtd-utils: add xattr PACKAGECONFIG and fix acl dependency
=20=20runqemu: support full-disk images
=20=20initramfs-framework: create /dev/console
=20=20initramfs-live-boot: create /dev/console
=20=20initramfs-framework: handle kernel parameters with . inside
=20=20image-vm.bbclass: avoid duplicating syslinux default values
=20=20image-vm.bbclass: support specifying an initramfs
=20=20boot loader: support root=3DUUID
=20=20boot-directdisk.bbclass: use rootfs UUID by default

Peter Seebach (1):
=20=20pseudo_1.7.3.bb: New version of pseudo

Philip Balister (1):
=20=20libevent_2.0.22.bb: Add native and nativesdk support to the recipe.

Ricardo Ribalda Delgado (2):
=20=20python3: Fix python-distutils variables
=20=20python: Fix python-distutils variables

Richard Purdie (6):
=20=20linux-yocto-3.14: Use a revision thats on the branch for qemuppc
=20=20oeqa/utils/dump: Handle empty commandlist gracefully
=20=20layer.conf: Add missing dependency for allarch package =
initramfs-framework
=20=20oeqa: Add allarch sstate sig test
=20=20tcmode-default: Set gcc 5.2 as the default
=20=20oeqa: Test failure/cleanup improvements

Ross Burton (1):
=20=20sstate: implement basic signing/validation

Roy Li (1):
=20=20glibc: package nscd related files

Saul Wold (1):
=20=20oprofileui: Use inherit gettext

Stefan M=C3=BCller-Klieser (1):
=20=20libvorbis: remove legacy options

zjh (1):
=20=20testimage: filter proper test cases by tags

=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D
Changelog for meta-openembedded:

Adam Chappell (1):
=20=20apache2: wait for server to start/stop/restart

Alexander Kanavin (2):
=20=20gnome: add explicit bz2 compress type to older packages
=20=20iso-codes: remove the recipe due to its move to oe-core

Andreas M=C3=BCller (6):
=20=20geany: update to 1.25
=20=20poppler: update to 0.35.0
=20=20gtk-xfce-engine: create and pack gtk3 themes by default
=20=20xfce-dusk-gtk3: initial add 1.3
=20=20packagegroup-xfce-extended: add xfce-dusk-gtk3
=20=20xfce4-whiskermenu-plugin: update to latest git

Bian Naimeng (1):
=20=20sysdig: 0.1.101 -> 0.1.102

Dominic Sacr=C3=A9 (8):
=20=20python-cython: Upgrade 0.20.2 -> 0.23.1
=20=20python-decorator: Upgrade 3.4.2 -> 4.0.2
=20=20python-pyserial: Upgrade 2.4 -> 2.7
=20=20python3-lxml: Add new recipe
=20=20python3-cython: Add new recipe
=20=20python3-decorator: Add new recipe
=20=20python3-pyserial: Add new recipe
=20=20python3-pyinotify: Add new recipe

Jagadeesh Krishnanjanappa (4):
=20=20dmapi: add new recipe
=20=20xfsdump: add new recipe
=20=20pmtools: add new recipe
=20=20xerces-c : add new recipe

Kai Kang (5):
=20=20efibootmgr: fix build error with gcc 5.2
=20=20libvpx: 1.3.0 -> 1.4.0
=20=20ltrace: 7.2 -> 7.3
=20=20libhugetlbfs: avoid search host library path for cross compilation
=20=20libhugetlbfs: avoid using keyword restrict as var name

Koen Kooi (1):
=20=20mariadb: update to 5.5.45

Li xin (1):
=20=20libjs-sizzle: upgrade 1.9.3 -> 1.10.18

Mario Domenech Goulart (1):
=20=20mariadb: fix tarball fetch URL

Mark Asselstine (2):
=20=20ruby.bbclass: handle new installation directories
=20=20bundler: remove broad FILES definition

Martin Jansa (5):
=20=20tcpdump: add PACKAGECONFIG for smi
=20=20oscam: respect *flags set from OE
=20=20gupnp-igd: fix missing dependencies
=20=20tracker: remove dependency on gamin
=20=20geoclue: add PACKAGECONFIG for geoip

Philip Balister (3):
=20=20vim: Move SRC_URI from Google Code to github.
=20=20python-pyzmq: Update to version 14.7.0.
=20=20cppzmq: Bump rev.

Ricardo Ribalda Delgado (4):
=20=20opencv_2.4: Update LICENSE
=20=20opencv_2.4: Remove unused INSANE_SKIP line
=20=20opencv_2.4: Update HOMEPAGE
=20=20Opencv: Add OpenCV 3.0

Roy Li (6):
=20=20lcms: upgrade 2.6->2.7
=20=20sg3-utils: upgrade to 1.41
=20=20libsodium: create recipe
=20=20zeromq: upgrade to 4.1.3
=20=20dialog: upgrade to 1.2-20150528
=20=20php: create recipe for 5.6.12

Rudolf J Streif (1):
=20=20synergy: project has moved from synergy.googlecode.com

Yi Zhao (8):
=20=20wbxml2: set correct LIB_SUFFIX for multilib
=20=20openwsman: pass correct libdir to cmake
=20=20qt-creator: pass correct IDE_LIBRARY_BASENAME
=20=20libqofono: fix the hardcoded libdir
=20=20libconnman-qt: fix the hardcoded libdir
=20=20libftdi: set correct LIB_SUFFIX for multilib
=20=20libssh: upgrade 0.6.4 -> 0.7.1
=20=20tomoyo-tools: pass correct libdir to make

leimaohui (9):
=20=20cmpi-bindings: add new recipe
=20=20konkretcmpi: add new recipe for openlmi
=20=20sblim-sfcCommon: add new recipe
=20=20sblim-sfcb: add new recipe for openlmi
=20=20cim-schema-exper: add new recipe for openlmi
=20=20openlmi: add openlmi
=20=20openwsman: modified SRC_URI to git
=20=20uim: 1.3.1->1.8.6
=20=20rrdtool: 1.4.8->1.5.4

=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D
Changelog for meta-angstrom:

Koen Kooi (1):
=20=20octoprint-image: add image with everything needed for octoprint

=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D
Changelog for meta-arago:

Denys Dmytriyenko (10):
=20=20Revert "weston: don't make fbdev compositor default when enabled"
=20=20arago.conf: enable egl and disable fbdev only for weston on omap-a15
=20=20external-linaro-toolchain: most of changes got upstreamed, update =
bbappend
=20=20img-pvr-sdk: Makefile doesn't have clean target, suppress
=20=20external-linaro-toolchain: keep compatible with 2015.02, where =
libstdc++ sha
=20=20tisdk-server-rootfs: update to match main tisdk-rootfs and include =
test pack
=20=20arago-prefs: u-boot-ti-staging is now default for keystone
=20=20external-linaro-toolchain: pre-populate /etc/ld.so.conf to help =
ld-linux fin
=20=20external-linaro-toolchain: symlink real libc.so to /usr/lib
=20=20external-linaro-toolchain: package libc.so symlink as well

Jacob Stiffler (1):
=20=20gstreamer1.0-plugins-base: Backport 1.3.1 for improved performance

Karthik Ramanan (1):
=20=20libdce: update to 3.00.08.02

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

Fabio Estevam (1):
=20=20linux-imx-3.14.38: defconfig: Select IMX6UL

Otavio Salvador (1):
=20=20linux-fslc-mx6: Bump revision to 2574f81

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

=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D
Changelog for meta-igep:

=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D
Changelog for meta-intel:

Anuj Mittal (2):
=20=20meta-crystalforest: zlib: Add COMPATIBLE_MACHINE
=20=20meta-crystalforest: move qat and zlib-qat to meta-isg

Doug Goldstein (2):
=20=20intel-microcode: bump version to 20150121
=20=20iucode-tool: bump version to 1.3

=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D
Changelog for meta-ivi:

Yong-iL Joh (1):
=20=20MAINTAINERS: Update maintainers list

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

Alex J Lennon (3):
=20=20mono: add support for 4.2.0.207
=20=20README: update testing of 4.2.0.207 on qemux86
=20=20README: add link to 4.2.0 release notes

=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D
Changelog for meta-netbookpro:

=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D
Changelog for meta-nodejs:

Ilkka Myller (1):
=20=202015-09-02 io.js v3.3.0 Release

=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D
Changelog for meta-nslu2:

=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D
Changelog for meta-opie:

=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D
Changelog for meta-qt3:

=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D
Changelog for meta-qt5:

Denys Dmytriyenko (1):
=20=20qtbase: update patch that increases configured path length for =
nativesdk

Julien Brianceau \(jbriance\) (2):
=20=20qtquickcontrols: Remove LGPL-2.1 from LICENSE list
=20=20qt5: Update LGPL-Exception in LICENSE list

Samuli Piippo (4):
=20=20qttools: use one recipe for all compilations
=20=20qtbase: remove dependency to sqlite
=20=20qtlocation: use correct dependencies
=20=20qtwebengine: fix problem with recursive qmake call

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

Denys Dmytriyenko (6):
=20=20layer.conf: add omapdrm-pvr and omap5-sgx-ddk-um-linux to ABI safe =
list
=20=20linux-ti-staging: update with latest changes, add new DTBs
=20=20linux-ti-staging: update with latest merges, first 4 SGX patches =
upstreamed
=20=20u-boot-ti-staging, keystone: update with latest fixes, switch =
keystone over
=20=20u-boot-ti-staging: port gph deployment hacks for keystone
=20=20linux-ti-staging: SGX patches went into kernel, drop them locally

Karthik Ramanan (1):
=20=20ipumm-fw: update to 3.00.08.02

Sam Nelson (1):
=20=20uio-module-drv: Update to new version 1.0.2.3

=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D
Changelog for meta-webos:

=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D
Changelog for meta-xilinx:

Nathan Rossi (1):
=20=20binutils: Update and drop patches

=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D
Changelog for meta-yocto:

=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D
Changelog for openembedded:



