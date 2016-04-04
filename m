Return-Path: <cliff.brake@gmail.com>
Received: from mail-pa0-f46.google.com (mail-pa0-f46.google.com
	[209.85.220.46])
	by mail.openembedded.org (Postfix) with ESMTP id 6A41A731A5;
	Mon,  4 Apr 2016 22:34:25 +0000 (UTC)
Received: by mail-pa0-f46.google.com with SMTP id zm5so152986169pac.0;
	Mon, 04 Apr 2016 15:34:26 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=date:mime-version:message-id:from:to:subject
	:content-transfer-encoding;
	bh=SME4C9dR/DoFTw5F5qm8JSDheojulTY3U9wxuzH767s=;
	b=y/g0Qtp4kY10F8AnvWAKniaYB5C5RBfygsyACn4SHtcL05vkXJHMS7oPV3OHreMg1d
	q3E4b9BUujFftF5rcXDEqYtof9ODFFXGu5hD6sDmeiiS/qwFPXuMatD3THPGwJo/jpA1
	gfQin+FSAwXxdnvR3nooeP/B/d2FmOvqLQYWRjqwvZRUlXWwGwSxIIeImG23cY5PW9q9
	qtrnNvFkWQR2sp4ZFfS/GgqMUYDmK46eDInLQYGL3+k8cO2KJWq7VhQWBtz50/+xegZe
	SAaX+8xJCr2dUktXfvMxY1kRvdnkS93fQu1QcgQL7I7zKTTrSa+yeCftHHMp7kUKT13j
	U9cQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20130820;
	h=x-gm-message-state:date:mime-version:message-id:from:to:subject
	:content-transfer-encoding;
	bh=SME4C9dR/DoFTw5F5qm8JSDheojulTY3U9wxuzH767s=;
	b=k6go6cmZmNHMC1i8CZ4jC7C9CJso56J9w/lVxnpgaNU2NJDJIoLmBk9c3grZuc0DHS
	8GS0PAOZVpUBu6rEOiH6UcghF8SiQR+rg4hFUJHgHrTiPkh+w1VAUbH+T8YzyOSjsE6N
	C141L84AKoEtqs29MvhdEvmTvO7hU55b4H+oZFBdA+bik+kkzUB5J6l8D2eTbP7RpiF2
	aBxCjsR4o8zbIlY3bj0lF+H9m5W9Me3xcCkwuUWuwtt6LOl2OOjGcH4YSdWa2GsvIJwd
	cY/AFDaqTKpK5QGKbz8vpEPzyTblju5tkeoXKaRYy2TP6jklivarNybt0jHj+xFSrBC5
	/ljw==
X-Gm-Message-State: AD7BkJKqLvGw2I6O4XYg91Jjoj9NaXiTtfJbiy0b/rCd9HS3pBl63P3hCAwLHXRz54VkBA==
X-Received: by 10.67.1.65 with SMTP id be1mr56955826pad.46.1459809266029;
	Mon, 04 Apr 2016 15:34:26 -0700 (PDT)
Received: from [127.0.0.1] ([166.170.21.42]) by smtp.gmail.com with ESMTPSA id
	w20sm41790433pfi.31.2016.04.04.15.34.22
	(version=TLSv1/SSLv3 cipher=OTHER);
	Mon, 04 Apr 2016 15:34:23 -0700 (PDT)
Date: Mon, 04 Apr 2016 15:34:23 -0700 (PDT)
X-Google-Original-Date: Mon, 04 Apr 2016 22:34:21 GMT
MIME-Version: 1.0
X-Mailer: Nodemailer (0.3.22; +http://andris9.github.com/Nodemailer/)
Message-Id: <1459809261627.db2ad47d@Nodemailer>
From: cliff.brake@gmail.com
To: openembedded-core@lists.openembedded.org,
	openembedded-devel@lists.openembedded.org,
	angstrom-distro-devel@linuxtogo.org, meta-ti@yoctoproject.org
Subject: OE Changelog since 2016-03-27 until 2016-04-03
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
X-List-Received-Date: Mon, 04 Apr 2016 22:34:28 -0000
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable

Changelog since 2016-03-27 until 2016-04-03.  Projects included in this =
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

Belen Barros Pena (1):
=20=20toaster: Correct typo on build form help text

Elliot Smith (5):
=20=20toaster: tests Migrate to Selenium for UI tests
=20=20toaster: tests Migrate all builds page and project page tests to =
Selenium
=20=20toaster: tests Migrate project builds page tests to Selenium
=20=20toaster: tests Migrate all projects page tests to Selenium
=20=20toaster: tests Migrate landing page tests to Selenium

Joshua Lock (1):
=20=20toaster: orm better detect requires during CustomImageRecipe =
generation

Markus Lehtonen (2):
=20=20checksum: In FileChecksumCache don't follow directory symlinks
=20=20cooker: fix CookerParser.shutdown()

Michael Wood (1):
=20=20toaster: buildinfohelper Add additional metadata to the built layer

Olof Johansson (2):
=20=20fetch2: BB_ALLOWED_NETWORKS should not care about port numbers
=20=20tests/fetch.py: Improve unit tests for trusted network check

Richard Purdie (11):
=20=20cookerdata: Improve handling of ParseError
=20=20cooker: Ensure bbappend order is deterministic
=20=20fetch2: Ensure that incorrect checksumed files are always renamed
=20=20build/utils: Allow python functions to execute with real exception =
handling
=20=20Bump version to 1.29.1
=20=20bitbake: Don't limit traceback lengths to arbitrary values
=20=20siggen: Drop misleading duplicate method
=20=20siggen: Fix check calculation problem with file_checksums
=20=20siggen: Add checksum recalculation/checking code
=20=20siggen: Fix nostamp taint handling
=20=20siggen: Ensure tainted stamps are accounted for with writing custom =
stamps

Robert Yang (1):
=20=20cookerdata.py: remove slash in the end

=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D
Changelog for openembedded-core:

Alexander Kanavin (2):
=20=20bitbake.conf: rename 'gobject-introspection-data' machine feature to =
'qemu-u
=20=20bluez5: add ptest support

Andre McCurdy (5):
=20=20default-distrovars.inc: remove gnutls + libtasn1 from =
LGPLv2_WHITELIST_GPL-3
=20=20base.bbclass: drop obsolete HOSTTOOLS_WHITELIST_GPL-3.0
=20=20base.bbclass: avoid duplicate call to d.getVar('LICENSE', True)
=20=20libassuan: use package specific licensing
=20=20default-distrovars.inc: remove libassuan from LGPLv2_WHITELIST_GPL-3.0

Andr=C3=A9 Draszik (2):
=20=20oe-git-proxy: also check all_proxy and http_proxy env variables
=20=20oe-git-proxy: support username / password in http proxy

An=C3=ADbal Lim=C3=B3n (4):
=20=20ptest-runner_2.0.bb: Update recipe to point git.yoctoproject.org repo.
=20=20oeqa/runtime/parselogs.py: Add systemd unit circular dependencies =
errors.
=20=20recipes-support/rng-tools: Change runlevel start from S to 2, 3, 4, 5.
=20=20opkg-utils: opkg-build exit when fail to list files.

Awais Belal (1):
=20=20systemd-serialgetty: allow baud rate overriding

Bill Randle (4):
=20=20man: fix src/Makefile to work with parallel make
=20=20man: fix several annoying compile/build warnings
=20=20man: use BUILD_CC and target include files for configure
=20=20insane.bbclass: avoid false positives on library location

Bruce Ashfield (17):
=20=20linux-yocto/4.1: SMBus/iTCO backports
=20=20linux-yocto/qemuarm64: enable 32 bit compatibility
=20=20linux-yocto/4.1: device property backports
=20=20linux-yocto/4.1: i2c: designware: Backport i2c patches
=20=20linux-yocto/4.1: Apollo Lake/Broxton mmc backports
=20=20linux-yocto/4.1: Intel Broxton: pwm backports
=20=20linux-yocto/4.4: drm/i915/skl: Fix DMC load on Skylake J0 and K0
=20=20linux-yocto/4.4: broxton and usb type-c backports
=20=20linux-yocto: add overlayfs feature
=20=20linux-yocto/4.1: telemetry and dmaengine backports
=20=20linux-yocto/4.4: gpio-pca953x: add PCAL9535 interrupt support
=20=20linux-yocto/4.1: ahci: backport AHCI runtime PM
=20=20linux-yocto-dev: bump to v4.6-rcX
=20=20Revert "linux-yocto: Work around PAT issue on qemux86"
=20=20linux-yocto/4.4: fix PAT for 32bit x86
=20=20linux-yocto/4.4: UVC: Add support for R200 depth camera
=20=20kernel-yocto: enforce SRC_URI specified branch

Clemens Lang (1):
=20=20ldconfig-native: Fix ELF flags on 64-bit binaries

Daniel Istrate (2):
=20=20oeqa/selftest/bbtests: Test bbappend order
=20=20selftest: Added testcase decorator to tests

Ed Bartosh (3):
=20=20wic: fix type of no-table option
=20=20image.bbclass: run wicenv task only for wic images
=20=20oe-selftest: generate .env only in test_image_env

Freudiger Raphael (1):
=20=20image: Fix debugfs image type recursion loop

Hongxu Jia (2):
=20=20conf/bitbake.conf package.bbclass: fix dbg package not contain =
sources while
=20=20gcc-5.3/gcc-4.9: -fdebug-prefix-map support to remap relative path

Humberto Ibarra (1):
=20=20scripts:/oe-selftest: Use timestamp instead of test names in coverage =
data f

Ioan-Adrian Ratiu (2):
=20=20wic/isoimage-isohybrid.py: use glob to find initramfs location
=20=20wic/isoimage-isohybrid.py: change cpio generated uid&gid to root

Johannes Pointner (1):
=20=20xcursor-transparent-theme: upgrade to latest git revision

Jonathan Liu (1):
=20=20gdb-cross-canadian: use PACKAGECONFIG for python and readline

Joshua Lock (1):
=20=20rootfs-postcommands: don't write manifest when IMAGE_MANIFEST empty

Juro Bystricky (2):
=20=20build-appliance-image: Fix permissions
=20=20relocate_sdk: additional error checks

Jussi Kukkonen (5):
=20=20matchbox-desktop: Do not close desktop on alt-F4
=20=20glib-2.0: Install gio-querymodules in main package
=20=20gio-module-cache: Add class for Gio modules
=20=20glib-2.0: Fix packaging
=20=20epiphany: Depend on intltool-native for configure

Khem Raj (7):
=20=20libunwind: Fix build on mips/mips64 for musl targets
=20=20gdb: Fix build on mips64/musl
=20=20musl: Update to tip
=20=20siteinfo: Fix musl 64bit targets
=20=20gcc: Backport fixes for musl ssp configuration
=20=20gcc: Fix musl ldso name for mips64
=20=20psmisc: Remove including sys/user.h and __WORDSIZE

Mariano Lopez (1):
=20=20archiver.bbclass: Just archive gcc-source for all gcc recipes

Markus Lehtonen (4):
=20=20externalsrc: do not use do_configure[nostamp] for git srctrees
=20=20externalsrc: remove nostamp from do_configure
=20=20oe/patch: more detailed error reporting
=20=20oe/patch: print cleaner error message when patch fails to apply

Martin Jansa (1):
=20=20no-static-libs.inc: build static libusb1-native

Maxin B. John (1):
=20=20systemd: fix build with gcrypt PACKAGECONFIG disabled

Patrick Ohly (1):
=20=20buildhistory.bbclass: create image directory when needed

Paul Eggleton (5):
=20=20classes/populate_sdk_ext: support setting vars from environment at =
build tim
=20=20oe-publish-sdk: prevent specifying a directory for the SDK argument
=20=20oe-publish-sdk: exclude sstate-cache if publishing minimal SDK
=20=20toolchain-shar-extract.sh: ensure all_proxy is allowed through
=20=20devtool: modify: call shutdown on tinfoil when done

Peter Kjellerstedt (1):
=20=20image.bbclass: Make unneeded packages for a read-only rootfs =
configurable

Ricardo Ribalda Delgado (1):
=20=20pyton-numpy: Add definition of off_t size

Richard Purdie (15):
=20=20selftest/devtool: Update after make PROVIDER changes
=20=20wic: Update after task ordering changes
=20=20build-appliance-image: Update to master head revision
=20=20sstatesig: Ensure we keep native depends for allarch recipes
=20=20uninative: Switch md5sum -> sha256
=20=20sanity: Require bitbake 1.29.1
=20=20sanity.bbclass: Use pythonexception to raise real exceptions without =
backtra
=20=20scripts, lib: Don't limit traceback lengths to arbitrary values
=20=20lib/oe/packagedata: Add import os
=20=20selftest/signing: Use packagedata to obtain PR value for signing test
=20=20base: Fixup PACKAGECONFIG incorrect mappings
=20=20bitbake.conf: Add BB_WORKERCONTEXT to HASHBASE_WHITELIST
=20=20populate_sdk_ext: Exclude BBTASKDEPDATA from task signature
=20=20image-vm: Exclude DISK_SIGNATURE_GENERATED from task signature
=20=20build-appliance-image: Exclude DDATETIME from task signature

Robert Yang (13):
=20=20init-live.sh: fix ROOT_MOUNT
=20=20init-live.sh: fix overlay fs
=20=20runqemu: fix for iso
=20=20archiver.bbclass: addtask do_deploy_archives_setscene
=20=20selftest/buildoptions.py: use INHERIT +=3D
=20=20image-live.bbclass: DEPENDS on syslinux
=20=20boot-directdisk.bbclass: merge it into image-vm.bbclass
=20=20bootimg.bbclass: merge it into image-live.bbclass
=20=20image-live.bbclass/image-vm.bbclass: remove duplicated code
=20=20image-vm.bbclass: remove invalid code
=20=20init-install.sh: fix disk_size
=20=20init-install-efi.sh: remove all root=3Dfoo from grub.cfg
=20=20grub-efi.bbclass: use GRUB_ROOT rather than APPEND for root device

Ross Burton (1):
=20=20oeqa/utils/ftools: improve remove_from_file algorithm

Tudor Florea (2):
=20=20ltp: add periodic output for memcg stress test
=20=20ltp: fix test_proc_kill hanging

Ulf Magnusson (1):
=20=20classes/packagegroup: Refactor code to be simpler

Wenlin Kang (2):
=20=20relocate_sdk: fixed .gccrelocprefix section handling
=20=20toolchain-shar-extract.sh: check the length for target_sdk_dir

=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D
Changelog for meta-openembedded:

Armin Kuster (1):
=20=20wireshark: 2.0.2 update including security

Catalin Enache (2):
=20=20net-snmp: fix invalid paths in target net-snmp-config
=20=20net-snmp: fix some invalid paths

Derek Straka (33):
=20=20python-dateutil: update to 2.5.1
=20=20python-lxml: update to 3.6.0
=20=20python-cython: update to 0.23.4
=20=20python-certifi: update to 2016.2.28
=20=20python-pymongo: update to 3.2.2
=20=20python-werkzeug: update to 0.11.5
=20=20python-whoosh: update to 2.7.3
=20=20python-cffi: update to 1.5.2
=20=20python-cmd2: update to 0.6.8
=20=20python-daemonize: update to 2.4.6
=20=20python-evdev: update to 0.6.0
=20=20python-html5lib: update to 0.9999999
=20=20python-iso8601: update to 0.1.11
=20=20python-jsonpatch: update to 1.13
=20=20python-monotonic: update to 1.0
=20=20python-paste: update to 2.0.3
=20=20python-pep8: update to 1.7.0
=20=20python-pip: update to 8.1.1
=20=20python-psutil: update to 4.1.0
=20=20python-py: update to 1.4.31
=20=20python-pycparser: update to 2.14
=20=20python-pyflakes: update to 1.1.0
=20=20python-pymisp: update to 2.3
=20=20python-pyparsing: update to 2.1.1
=20=20python-pytest: update to 2.9.1
=20=20python-pytz: update to 2016.3
=20=20python-pyudev: update to 0.19.0
=20=20python-pyyaml: update to 3.11
=20=20python-sparts: update to version 0.7.3
=20=20python-urllib3: update to 1.14
=20=20python-simplejson: update to 3.8.2
=20=20python-futures: update to version 3.0.5
=20=20pptp-linux: update to 1.8.0

Jackie Huang (1):
=20=20waf-samba.bbclass: move to meta-networking

Jens Rehsack (1):
=20=20dnsmasq: steal resolvconf support from Ubuntu

Pascal Bach (2):
=20=20dhcpcd: update to version 6.10.1
=20=20dhcpcd: cleanup recipe

Stefan Agner (1):
=20=20gstreamer: fix argument parsing when using Bison 3

lchristina26 (1):
=20=20wolfssl: update to version 3.9.0

mike.looijmans@topic.nl (2):
=20=20waf-cross-answers: Add cross-answers-mipsel.txt
=20=20waf-cross-answers/README: Fix typo "bbaclss"

=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D
Changelog for meta-angstrom:

=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D
Changelog for meta-arago:

Denys Dmytriyenko (32):
=20=20recipes-qt: remove all traces of qt4, no longer in oe-core
=20=20gstreamer: remove outdated 0.10.x version, no longer in oe-core
=20=20linux-libc-headers: remove version 4.1, default to 4.4
=20=20linux: remove bbappends for old kernel versions, removed from meta-ti
=20=20wpa-gui-e: remove, as no longer supported and requiring qt4
=20=20u-boot-fw-utils: remove old version
=20=20cryptodev-tests: remove, the change got upstreamed
=20=20udev: rename bbappends to eudev, add symlink for libudev.so.0
=20=20gstreamer: overlay .inc files from fido and update 1.2.3 recipes
=20=20liboil: overlay locally for gstreamer-1.2.3 dependency
=20=20obexd: fix typo in license URL
=20=20cpuloadgen: fix cross-compilation by passing correct parameters
=20=20eventdump: fix cross-compilation by passing correct parameters
=20=20serialcheck: fix cross-compilation by passing correct parameters
=20=20omapconf: bump SRCREV to pick up gcc-5 fixes
=20=20ltp-ddt: fix make scripts failure due to new kernel task dependencies
=20=20python3: fix configure failure to find cross-version of readelf
=20=20packagegroup-arago-console: alsa-utils-alsaconf got renamed to =
alsa-utils-sc
=20=20HACK: weston-init: overlay locally due to REQUIRED_DISTRO_FEATURES =
=3D "opengl
=20=20HACK: dt: disable for now as breaking with gcc-5
=20=20FIXME: external-linaro-toolchain-cross: target Linaro gcc version =
doesn't ma
=20=20branding-core: disable SGX for now, until drivers updated for 4.4
=20=20external-linaro-toolchain.bbappend: drop unneeded fixes for broken =
2015.05
=20=20arago-prefs: update toolchain preferences, drop gstreamer 0.10
=20=20toolchain*.inc: update toolchain preferences
=20=20arago.conf: disable bluez5, disable -fstack-protector, restore =
git-native AS
=20=20arago-prefs: prefer kernel 4.4
=20=20qtdeclarative: fix compilation of examples/qquickviewcomparison
=20=20qtquickcontrols: fix compilation of examples/texteditor
=20=20qtdeclarative, qtquickcontrols: allow accessing patches locally
=20=20ffmpeg: add bbappend to disable x264, set commercial flags
=20=20opencl-examples, openmpacc-examples: fix do_unpack() and correct args =
to get

Karthik Ramanan (1):
=20=20gstreamer1.0-plugins-vpe: Update SRCREV

=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D
Changelog for meta-atmel:

=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D
Changelog for meta-beagleboard:

=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D
Changelog for meta-browser:

Jason Plum (1):
=20=20Firefox: update installation paths for ESR,l10n,addons

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

Yuqing Zhu (1):
=20=20gstreamer1.0-plugins-base: Fix IMXCameraApp image time cannot display =
issue.

=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D
Changelog for meta-fsl-arm-extra:

Ian Coolidge (2):
=20=20linux-boundary: Bump kernel version to 3.14.52
=20=20linux-boundary: Bump SRCREV to 9af660e

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
=20=20machine: add i915 firmware to initramfs for intel-core* MACHINEs

Jianxun Zhang (3):
=20=20libva: update 1.6.2 -> 1.7.0
=20=20intel-gpu-tools: update 1.13 -> 1.14
=20=20libva-intel-driver: update 1.6.2 -> 1.7.0

Otavio Salvador (1):
=20=20tlk: layer.conf: Add proper dependency and priority

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

Ilkka Myller (11):
=20=20Configure LAYERDEPENDS
=20=20Remove forced runtime dependency to nodejs package
=20=202016-03-31 Version 0.10.44 (Maintenance) Release
=20=202016-03-31 Version 0.12.13 (LTS) Release
=20=202016-03-31, Version v4.4.2 'Argon' (LTS)
=20=202016-03-31 Version 5.10.0 (Stable) Release
=20=20grunt-cli v1.1.0
=20=20Added missing registry argument for native npm
=20=20Added native and nativesdk classes to bower recipe
=20=20Added file-rdeps skip for gulp
=20=20Improve bower and bower-install class compatibility with Bitbake =
build envir

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

Denys Dmytriyenko (8):
=20=20udev: rename bbappend to apply to eudev
=20=20linux: remove old and outdated kernel recipes and configs
=20=20linux-ti-staging: add latest 4.4 version
=20=20linux-ti-staging 4.1: add PRU Ethernet FW dependency for AM4
=20=20linux-ti-staging 4.4: add PRU Ethernet FW dependency for AM4
=20=20linux-ti-staging: update DBT list for AM4
=20=20HACK: ti-xdctools, ti-xdais: disable stripping for now
=20=20recipes-ti: prevent any stripping of binaries due to different =
arch/format

Jacob Stiffler (7):
=20=20common-csl-ip: Bump SRCREV for fix
=20=20cppi-lld: Bump SRCREV for fix
=20=20pa-lld: Bump SRCREV for fix
=20=20qmss-lld: Bump SRCREV for fix
=20=20sa-lld: Bump SRCREV for fix
=20=20nwal-lld: Bump SRCREV for fix
=20=20mmap-lld: Upgrade to 2.0.0.7

Justin Sobota (1):
=20=20ti-ccsv6-native: Upgrade to version 6.1.2.00015

=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D
Changelog for meta-webos:

=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D
Changelog for meta-xilinx:

=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D
Changelog for meta-yocto:

Humberto Ibarra (1):
=20=20yocto-bsp: Set correct default branches and branches base for i386, =
qemu and

Richard Purdie (2):
=20=20scripts, lib: Don't limit traceback lengths to arbitrary values
=20=20poky: Exclude DATE from DISTRO/SDK_VERSION checksums

=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D
Changelog for openembedded:



