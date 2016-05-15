Return-Path: <akuster808@gmail.com>
Received: from mail-pf0-f195.google.com (mail-pf0-f195.google.com
	[209.85.192.195])
	by mail.openembedded.org (Postfix) with ESMTP id E35C265CC3
	for <openembedded-core@lists.openembedded.org>;
	Sun, 15 May 2016 16:49:22 +0000 (UTC)
Received: by mail-pf0-f195.google.com with SMTP id g132so13597075pfb.3
	for <openembedded-core@lists.openembedded.org>;
	Sun, 15 May 2016 09:49:23 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=from:to:subject:date:message-id:mime-version
	:content-transfer-encoding;
	bh=9VwyVW78fahV6XtRfPTtPV/Dwt9y4BUQxDGYdMm3Qdc=;
	b=ehbqUJh3TwkG+RXJdbWvtg5mkBwsGD5FG8sG+hqEAJW+lHUAWcJS/jqy7qzBB2asFR
	bIxedF80k4c2Uxagkyp1a0mwuUqGqSe12Z6UpQG/Zh+wN1ttOrUKWFQbSi90Va0ILII4
	N8JySCLJny8cVXqCAdZ1tXBWT2Cm8usCEACgw4mcoIlNpjjZ/FN7nPYUKieII3ACrFFq
	8nKyu93KwikD4W0blXb/r1qiEllcBn8ixv7bppnTf504U/ZUVeU74/rkDfB0HpUef1Pm
	bDDpnDVhnpEyuAfSLkjshtWtmenbR1O6osoPcL+H0s1LlIOcvOlTd+QpeJ+QtVBaAxn7
	z5Dw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20130820;
	h=x-gm-message-state:from:to:subject:date:message-id:mime-version
	:content-transfer-encoding;
	bh=9VwyVW78fahV6XtRfPTtPV/Dwt9y4BUQxDGYdMm3Qdc=;
	b=K+vyfyJc/Gh7RQbHqiiE03XDOTNdCBVwO3KpwyoWGlKmMX2heStMCXLZFHIVt+rRSy
	0YE9iaP4L9y4aTaeLqkW1lZ215F8y5gTLv7P2XWaVDU4dyq0KihZfe4rqSo6a5h/LDdi
	8Wh0obsomN6ZJ1B1iVZ9w+W04b9XXH+YsJc6KiaIXKukzRm5cBFvfA99QC3WG+j3wyu9
	Tjy4QPg2UDxwmEnyodntGXyMADDBsEltwk+I7Kax2uEEccBc8rb6ViTufEQ50LhAUEbL
	UciN8H8BS+gur9N9qmDYczZ408c1sV4NCXV37A2F6QUpFcHEV91vVHxyuGc+wN2STmvQ
	HFrw==
X-Gm-Message-State: AOPr4FXzVZ59wsjozAYu6SeALq4rzjf6g6flxEfJLBA8Fj8iDmdEH2XAKXt4bEK9A46Q8g==
X-Received: by 10.98.80.196 with SMTP id g65mr38809916pfj.91.1463330963242;
	Sun, 15 May 2016 09:49:23 -0700 (PDT)
Received: from Pahoa2.hsd1.ca.comcast.net (c-76-20-92-207.hsd1.ca.comcast.net.
	[76.20.92.207]) by smtp.gmail.com with ESMTPSA id
	o6sm41464047pfo.64.2016.05.15.09.49.21
	(version=TLS1_2 cipher=ECDHE-RSA-AES128-SHA bits=128/128);
	Sun, 15 May 2016 09:49:22 -0700 (PDT)
From: Armin Kuster <akuster808@gmail.com>
To: akuster808@gmail.com,
	openembedded-core@lists.openembedded.org
Date: Sun, 15 May 2016 09:47:39 -0700
Message-Id: <cover.1463330208.git.akuster@mvista.com>
X-Mailer: git-send-email 2.3.5
MIME-Version: 1.0
Subject: [PATCH 00/98] Pull request: Krogoth-next
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
X-List-Received-Date: Sun, 15 May 2016 16:49:23 -0000
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit

From: Armin Kuster <akuster@mvista.com>

Please consider these changes for the next krogoth release.

Built & testimage on all qemu targets

Note[1]: qemu update pending AB build and review
Note[2]: need to reconcile [master][krogoth] patches
Note[3]: built world on meta-openembedded krogoth-next series, no unexpected issues

The following changes since commit 75ca53211488a3e268037a44ee2a7ac5c7181bd2:

  bitbake: toaster: fix progress bar in MySQL environment (2016-05-13 17:45:58 +0100)

are available in the git repository at:

  git://git.yoctoproject.org/poky-contrib akuster/krogoth-next
  http://git.yoctoproject.org/cgit.cgi/poky-contrib/log/?h=akuster/krogoth-next

Alexander D. Kanevskiy (1):
  image.bbclass: don't execute compression commands multiple times

Alexander Kanavin (1):
  arch-powerpc64.inc: disable the use of qemu usermode on ppc64

Anders Darander (1):
  lib/oe/rootfs: Fix DEBUGFS generation for opkg & openssl-cnf

Andre McCurdy (1):
  image.bbclass: don't emit redundant IMAGE_CMD_xxx functions

André Draszik (2):
  gdb: fix QA warning (uClibc)
  feature-arm-neon.inc: restore vfpv3-d16 support

Armin Kuster (6):
  librsvg: Security fixes via update to 2.40.15
  openssl: Security fix via update to 1.0.2h
  gcc: Security fix CVE-2016-4488
  gcc: Security fix CVE-2016-4489
  gcc: Security fix CVE-2016-2226
  gcc: Security fix CVE-2016-4490

Awais Belal (1):
  mesa-demos: remove demos using obsolete screen surface

Bruce Ashfield (15):
  linux-yocto/uvesafb: print error message when task timeout occurs
  linux-yocto/4.4: sched/cgroup: Fix/cleanup cgroup teardown/init
  kern-tools: handle directories with, or without, trailing /
  kernel-yocto: allow branch auditing to be suspended
  linux-yocto/4.1: update to v4.1.22
  linux-yocto/4.1: make ltsi content available
  linux-yocto/4.4: BXT mmc fixes + PUNIT, tubropower, and telemetry
    backport
  linux-yocto/4.4: skylake configuration
  linux-yocto/4.4: broxton enablement and refactoring
  linux-yocto/4.4: bump to v4.4.8
  linux-yocto-rt/4.1: update to rt23
  linux-yocto/4.4: bump to v4.4.8
  linux-yocto/4.4: update to v4.4.9
  linux-yocto/4.4: beaglebone: Enable drm for omap
  linux-yocto/4.4: bump to v4.4.10

Christopher Clark (1):
  linux-firmware: break out bnx2 mips firmware and WHENCE license

Christopher Larson (2):
  image_types.bbclass: add WIC_CREATE_EXTRA_ARGS
  gcc: obey ldflags in the link of libgcc

Dengke Du (2):
  bash: fixed ptest run-builtins failed
  lttng-tools: filter random filename of ptest output

Denys Dmytriyenko (1):
  arch-armv7ve: inherit armv7a tunes file

Diego Rondini (1):
  base-files: add some safety checks in profile

Felipe F. Tonello (1):
  packagegroup-core-tools-profile: Enable valgrind on ARMv7a and above

Ian Reinhart Geiser (1):
  classes/image_vm: allow different filesystems to be used for VM
    images.

Ioan-Adrian Ratiu (2):
  wic: isoimage-isohybrid: add grubefi configfile support
  wic: isoimage-isohybrid: fix splash file paths

Ismo Puustinen (1):
  libpcre: Fix CVE-2016-3191

Joshua Lock (2):
  security_flags: turn potential string format security issues into an
    error
  packagegroup-core-lsb: fix whitespace in meta-qt* warnings

Jussi Kukkonen (1):
  gcc-sanitizers: Depend on target gcc

Leonardo Sandoval (2):
  scripts/lib/bsp/kernel.py: force patching when branch is machine
    branch is re-use
  populate_sdk_ext.bbclass : Show logfile in case the SDK EXT
    installation failed

Maxin B. John (3):
  popt: fix dependencies and QA Issue
  bash: fix dependencies and QA Issue
  libxml2: fix dependencies and QA Issues

Paul Eggleton (4):
  recipetool: create: fix picking up false npm package directories
  recipetool: create: fix falling back to declared license for npm
    packages
  classes/insane: do not force LIC_FILES_CHKSUM unless SRC_URI is set
  Drop unneeded LIC_FILES_CHKSUM values

Peter Kjellerstedt (1):
  metadata_scm.bbclass: Do not assume ${COREBASE} is a Git repo

Randy Witt (2):
  populate_sdk_ext: Change lockedsigs task mismatch to a warning
  devtool: Fix build-sdk when pn doesn't match filename

Richard Purdie (6):
  meta-selftest/images: Add LIC_FILES_CHKSUM to images using
    image.bbclass
  test-empty-image: Fix LIC_FILES_CHKSUM typo
  image: Fix IMAGE_FEATURES determinism issue
  update-alternatives: Fix determinism issue
  lib/classextend: Fix determinism issue
  oeqa/lic-checksum: Update after recent LIC_FILES_CHKSUM changes

Robert P. J. Day (1):
  attr: Remove redundant "+=" after "_append"

Robert Yang (7):
  directfb/pango/webkit: base_contains -> bb.utils.contains
  grub_git: set COMPATIBLE_HOST_armv7a to null
  insane.bbclass: remove workdir from package_qa_check_license()
  packagegroup.bbclass: set LICENSE and LIC_FILES_CHKSUM
  packagegroup-foo.bb: remove LICENSE = "MIT"
  meta-world-pkgdata: add LIC_FILES_CHKSUM
  libxsettings-client: fix COPYING file

Ross Burton (23):
  package: ensure do_split_packages doesn't return duplicates
  autotools: warn when running intltoolize if intltool isn't a
    dependemcy
  busybox: don't build ar
  meta: add comments to explain autotools-brokensep use
  mx-1.0: inherit gtk-doc
  mx: move to autotools instead of autotools-brokensep
  bluez5: enable out-of-tree builds
  oeqa/sstatetests: add http_proxy to no-op hash test
  oeqa/sstatetests: remove temporary DL_DIRs in noop_samesigs
  autotools: add default for CACHED_CONFIGUREVARS
  python-pygobject: remove redundant gnome-common dependency
  gnome-desktop3: remove redundant gnome-common dependency
  webkitgtk: remove gnome-common dependency
  qemu: remove explicit but redundant native build dependencies
  mesa-gl: add missing MESA_CRYPTO to PACKAGECONFIG
  oeqa/selftest/buildoptions: remove buildhistory signature test
  eudev: add PACKAGECONFIG for hwdb
  dbus-test: install executables not libtool wrapper scripts
  mesa: add PACKAGECONFIG for gbm
  bitbake.conf: change APACHE_MIRROR to point at archive.apache.org
  image_types: fix image/compression dependency collection
  bitbake.conf: add default for IMAGE_FSTYPES_DEBUGFS
  bitbake: fetch2: export DBUS_SESSION_BUS_ADDRESS to support
    authentication agents

Ruslan Bilovol (2):
  kernel-uimage: change target image to vmlinux
  libunwind: backport aarch64_be support

Stephano Cetola (2):
  toolchain-scripts: replace source built-in call
  sysvinit-inittab: restrict labels to 4 chars

Tristan Van Berkom (1):
  cross-localedef-native_2.22.bb: Use autotools configure

Yuqing Zhu (1):
  alsa-lib: Fix incorrect appl pointer when mmap_commit() returns error.

 bitbake/lib/bb/fetch2/__init__.py                  |    5 +-
 .../recipes-test/images/wic-image-minimal.bb       |    2 +
 meta/classes/autotools.bbclass                     |    5 +
 meta/classes/core-image.bbclass                    |    3 -
 meta/classes/image-vm.bbclass                      |   13 +-
 meta/classes/image.bbclass                         |   14 +-
 meta/classes/image_types.bbclass                   |   40 +-
 meta/classes/insane.bbclass                        |   10 +-
 meta/classes/kernel-uimage.bbclass                 |    2 +-
 meta/classes/kernel-yocto.bbclass                  |   23 +-
 meta/classes/metadata_scm.bbclass                  |    5 +-
 meta/classes/package.bbclass                       |    6 +-
 meta/classes/packagegroup.bbclass                  |    2 +
 meta/classes/populate_sdk_ext.bbclass              |    4 +-
 meta/classes/toolchain-scripts.bbclass             |    4 +-
 meta/classes/update-alternatives.bbclass           |    4 +-
 meta/conf/bitbake.conf                             |    5 +-
 meta/conf/distro/include/security_flags.inc        |   24 +-
 meta/conf/machine/include/arm/arch-armv7ve.inc     |   19 +-
 meta/conf/machine/include/arm/feature-arm-neon.inc |    2 +-
 meta/conf/machine/include/arm/feature-arm-vfp.inc  |    2 +-
 .../machine/include/powerpc/arch-powerpc64.inc     |    3 +
 meta/lib/oe/classextend.py                         |    4 +-
 meta/lib/oe/package.py                             |    2 +-
 meta/lib/oe/rootfs.py                              |    2 +-
 meta/lib/oeqa/selftest/buildoptions.py             |   59 -
 meta/lib/oeqa/selftest/lic-checksum.py             |    9 +-
 meta/lib/oeqa/selftest/sstatetests.py              |    8 +-
 meta/recipes-bsp/grub/grub_git.bb                  |    1 +
 meta/recipes-connectivity/bluez5/bluez5.inc        |    5 +-
 .../bluez5/bluez5/out-of-tree.patch                |   26 +
 ...-pointer-dereference-in-EVP_DigestInit_ex.patch |   14 +-
 .../{openssl_1.0.2g.bb => openssl_1.0.2h.bb}       |    6 +-
 meta/recipes-core/base-files/base-files/profile    |    6 +-
 meta/recipes-core/busybox/busybox/defconfig        |    2 +-
 meta/recipes-core/dbus/dbus-test_1.10.6.bb         |   13 +-
 .../glibc/cross-localedef-native_2.23.bb           |    9 +-
 meta/recipes-core/libxml/libxml2_2.9.3.bb          |    2 +-
 meta/recipes-core/meta/meta-world-pkgdata.bb       |    1 +
 .../packagegroups/packagegroup-base.bb             |    1 -
 .../packagegroups/packagegroup-core-boot.bb        |    1 -
 .../packagegroup-core-buildessential.bb            |    1 -
 .../packagegroup-core-eclipse-debug.bb             |    1 -
 .../packagegroups/packagegroup-core-nfs.bb         |    1 -
 .../packagegroups/packagegroup-core-sdk.bb         |    1 -
 .../packagegroup-core-ssh-dropbear.bb              |    1 -
 .../packagegroups/packagegroup-core-ssh-openssh.bb |    1 -
 .../packagegroup-core-standalone-sdk-target.bb     |    1 -
 .../packagegroups/packagegroup-core-tools-debug.bb |    1 -
 .../packagegroup-core-tools-profile.bb             |    7 +-
 .../packagegroup-core-tools-testapps.bb            |    1 -
 .../packagegroups/packagegroup-cross-canadian.bb   |    1 -
 .../packagegroups/packagegroup-self-hosted.bb      |    1 -
 .../sysvinit/sysvinit-inittab_2.88dsf.bb           |    3 +-
 meta/recipes-core/udev/eudev_3.1.5.bb              |    4 +-
 meta/recipes-devtools/gcc/gcc-4.9.inc              |    1 +
 .../gcc/gcc-4.9/0075-libgcc-use-ldflags.patch      |   16 +
 meta/recipes-devtools/gcc/gcc-5.3.inc              |    5 +
 .../gcc/gcc-5.3/0059-libgcc-use-ldflags.patch      |   16 +
 .../gcc/gcc-5.3/CVE-2016-2226.patch                |  103 ++
 .../gcc/gcc-5.3/CVE-2016-4488.patch                |   73 +
 .../gcc/gcc-5.3/CVE-2016-4489.patch                |   56 +
 .../gcc/gcc-5.3/CVE-2016-4490.patch                |  270 ++++
 meta/recipes-devtools/gcc/gcc-sanitizers.inc       |    2 +-
 meta/recipes-devtools/gdb/gdb-common.inc           |    2 +-
 meta/recipes-devtools/git/git.inc                  |    1 +
 .../packagegroup-core-device-devel.bb              |    1 -
 .../python/python-pygobject_3.18.2.bb              |    2 +-
 meta/recipes-devtools/qemu/qemu.inc                |    5 +-
 meta/recipes-extended/bash/bash.inc                |    2 +-
 .../bash/bash/fix-run-builtins.patch               |   33 +
 meta/recipes-extended/bash/bash_4.3.30.bb          |    1 +
 .../packagegroup-core-full-cmdline.bb              |    1 -
 .../packagegroups/packagegroup-core-lsb.bb         |    9 +-
 meta/recipes-extended/sysstat/sysstat.inc          |    1 +
 meta/recipes-extended/xdg-utils/xdg-utils_1.1.1.bb |    1 +
 .../gnome-desktop/gnome-desktop3_3.18.2.bb         |    2 +-
 .../{librsvg_2.40.13.bb => librsvg_2.40.15.bb}     |    4 +-
 meta/recipes-graphics/directfb/directfb.inc        |    2 +-
 .../recipes-graphics/images/core-image-directfb.bb |    4 -
 .../libxsettings-client_0.10.bb                    |   13 +-
 ...dependant-on-obsolete-MESA_screen_surface.patch | 1592 ++++++++++++++++++++
 meta/recipes-graphics/mesa/mesa-demos_8.2.0.bb     |    1 +
 meta/recipes-graphics/mesa/mesa-gl_11.1.1.bb       |    2 +-
 meta/recipes-graphics/mesa/mesa.inc                |    6 +-
 .../recipes-graphics/mx/mx-1.0/fix-build-dir.patch |   46 -
 meta/recipes-graphics/mx/mx-1.0_1.4.7.bb           |    1 -
 meta/recipes-graphics/mx/mx.inc                    |    5 +-
 .../packagegroups/packagegroup-core-clutter.bb     |    1 -
 .../packagegroups/packagegroup-core-directfb.bb    |    1 -
 .../packagegroups/packagegroup-core-x11-base.bb    |    1 -
 .../packagegroups/packagegroup-core-x11-xserver.bb |    1 -
 .../packagegroups/packagegroup-core-x11.bb         |    1 -
 meta/recipes-graphics/pango/pango_1.38.1.bb        |    2 +-
 .../kern-tools/kern-tools-native_git.bb            |    2 +-
 .../linux-firmware/linux-firmware_git.bb           |   20 +
 meta/recipes-kernel/linux/linux-yocto-rt_4.1.bb    |    6 +-
 meta/recipes-kernel/linux/linux-yocto-rt_4.4.bb    |    6 +-
 meta/recipes-kernel/linux/linux-yocto-tiny_4.1.bb  |    6 +-
 meta/recipes-kernel/linux/linux-yocto-tiny_4.4.bb  |    6 +-
 meta/recipes-kernel/linux/linux-yocto.inc          |    1 +
 meta/recipes-kernel/linux/linux-yocto_4.1.bb       |   20 +-
 meta/recipes-kernel/linux/linux-yocto_4.4.bb       |   20 +-
 ...ls-filter-random-filename-of-tests-output.patch |   55 +
 meta/recipes-kernel/lttng/lttng-tools_git.bb       |    1 +
 ...fix-appl-pointer-not-correct-when-mmap_co.patch |  137 ++
 meta/recipes-multimedia/alsa/alsa-lib_1.1.0.bb     |    1 +
 .../packagegroups/packagegroup-core-x11-sato.bb    |    1 -
 meta/recipes-sato/webkit/webkitgtk_2.10.7.bb       |    7 +-
 meta/recipes-support/attr/attr_2.4.47.bb           |    6 +-
 .../libpcre/libpcre/CVE-2016-3191.patch            |  174 +++
 meta/recipes-support/libpcre/libpcre_8.38.bb       |    1 +
 ...roduce-build-support-for-aarch64_be-targe.patch |   33 +
 ...-wrong-big_endian-flag-in-aarch64_be-case.patch |   34 +
 meta/recipes-support/libunwind/libunwind_1.1.bb    |    2 +
 meta/recipes-support/popt/popt_1.16.bb             |    2 +
 scripts/devtool                                    |    5 +
 scripts/lib/bsp/kernel.py                          |    1 +
 scripts/lib/devtool/build_image.py                 |   24 +-
 scripts/lib/recipetool/create.py                   |    2 +-
 scripts/lib/recipetool/create_npm.py               |    2 +-
 .../lib/wic/plugins/source/isoimage-isohybrid.py   |   55 +-
 122 files changed, 2961 insertions(+), 348 deletions(-)
 create mode 100644 meta/recipes-connectivity/bluez5/bluez5/out-of-tree.patch
 rename meta/recipes-connectivity/openssl/{openssl_1.0.2g.bb => openssl_1.0.2h.bb} (91%)
 create mode 100644 meta/recipes-devtools/gcc/gcc-4.9/0075-libgcc-use-ldflags.patch
 create mode 100644 meta/recipes-devtools/gcc/gcc-5.3/0059-libgcc-use-ldflags.patch
 create mode 100644 meta/recipes-devtools/gcc/gcc-5.3/CVE-2016-2226.patch
 create mode 100644 meta/recipes-devtools/gcc/gcc-5.3/CVE-2016-4488.patch
 create mode 100644 meta/recipes-devtools/gcc/gcc-5.3/CVE-2016-4489.patch
 create mode 100644 meta/recipes-devtools/gcc/gcc-5.3/CVE-2016-4490.patch
 create mode 100644 meta/recipes-extended/bash/bash/fix-run-builtins.patch
 rename meta/recipes-gnome/librsvg/{librsvg_2.40.13.bb => librsvg_2.40.15.bb} (91%)
 create mode 100644 meta/recipes-graphics/mesa/mesa-demos/0011-drop-demos-dependant-on-obsolete-MESA_screen_surface.patch
 delete mode 100644 meta/recipes-graphics/mx/mx-1.0/fix-build-dir.patch
 create mode 100644 meta/recipes-kernel/lttng/lttng-tools/0001-lttng-tools-filter-random-filename-of-tests-output.patch
 create mode 100755 meta/recipes-multimedia/alsa/alsa-lib/0001-pcm_plugin-fix-appl-pointer-not-correct-when-mmap_co.patch
 create mode 100644 meta/recipes-support/libpcre/libpcre/CVE-2016-3191.patch
 create mode 100644 meta/recipes-support/libunwind/libunwind-1.1/0001-aarch64-introduce-build-support-for-aarch64_be-targe.patch
 create mode 100644 meta/recipes-support/libunwind/libunwind-1.1/0002-aarch64-fix-wrong-big_endian-flag-in-aarch64_be-case.patch

-- 
2.3.5


