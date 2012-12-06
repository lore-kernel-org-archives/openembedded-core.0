Received: from mga02.intel.com ([134.134.136.20])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <sgw@linux.intel.com>) id 1TgWUQ-0000qv-Oq
	for openembedded-core@lists.openembedded.org;
	Thu, 06 Dec 2012 09:07:27 +0100
Received: from orsmga001.jf.intel.com ([10.7.209.18])
	by orsmga101.jf.intel.com with ESMTP; 05 Dec 2012 23:53:00 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="4.84,228,1355126400"; d="scan'208";a="229690765"
Received: from unknown (HELO swold-linux.bigsur.com.bigsur.com)
	([10.255.13.117])
	by orsmga001.jf.intel.com with ESMTP; 05 Dec 2012 23:52:59 -0800
From: Saul Wold <sgw@linux.intel.com>
To: openembedded-core@lists.openembedded.org
Date: Wed,  5 Dec 2012 23:52:57 -0800
Message-Id: <cover.1354779942.git.sgw@linux.intel.com>
X-Mailer: git-send-email 1.8.0.1
Subject: [CONSOLIDATED PULL 00/71] Updates and Patches (cover letter only)
X-BeenThere: openembedded-core@lists.openembedded.org
X-Mailman-Version: 2.1.11
Precedence: list
List-Id: Patches and discussions about the oe-core layer
	<openembedded-core.lists.openembedded.org>
List-Unsubscribe: <http://lists.linuxtogo.org/cgi-bin/mailman/options/openembedded-core>,
	<mailto:openembedded-core-request@lists.openembedded.org?subject=unsubscribe>
List-Archive: <http://lists.linuxtogo.org/pipermail/openembedded-core>
List-Post: <mailto:openembedded-core@lists.openembedded.org>
List-Help: <mailto:openembedded-core-request@lists.openembedded.org?subject=help>
List-Subscribe: <http://lists.linuxtogo.org/cgi-bin/mailman/listinfo/openembedded-core>,
	<mailto:openembedded-core-request@lists.openembedded.org?subject=subscribe>
X-List-Received-Date: Thu, 06 Dec 2012 08:07:27 -0000

Richard,

This has been brewing for a few days now, I have built this locally and
done some testing as well as a run on the Autobuilder and I have either
address the failures (backed out pseudo change) 

High Level Items:  

SMART: 
I have included some of Marks initial SMART changes, but not the changes
that pull the lever to convert to SMART, there are still some issues there 
that need resolving.

Package Updates:
They are tested and look good.

BinUtils:
Things are building and behaving correctly.

PR Server changes:
I have not reviewed or tested, but they build I need more information 
myself on reviewing and testing these.


Overall I think this is a good set to take in early M2, I have replied to
patches that caused problems with the build.

Please do a final review and take what you see as appropriate.

Thanks
	Sau!


The following changes since commit d84f7d7a12b4271f7b2bfde9fb356d750abff15d:

  sstate.bbclass: fix detection of owners matching sstate files (2012-12-05 15:34:01 +0000)

are available in the git repository at:

  git://git.openembedded.org/openembedded-core-contrib sgw/stage
  http://cgit.openembedded.org/cgit.cgi/openembedded-core-contrib/log/?h=sgw/stage

Andrei Dinu (1):
  Added regex functionality to distrodata.bbclass

Bruce Ashfield (3):
  linux-yocto/3.4: merge v3.4.19, v3.4.20
  linux-yocto/3.4: emenlow: switch from psb to emgd graphics
  linux-yocto/3.4: inform the fetcher if the meta branch changes

Chen Qi (5):
  libksba: add pkgconfig support
  ICU: add pkgconfig support
  pth: add pkgconfig support
  libassuan: add pkgconfig support
  qt4-native & ghostscript: update upstream status for their patches

Constantin Musca (10):
  ethtool: upgrade to 3.6
  libxcb: upgrade to 1.9
  libxslt: upgrade to 1.1.28
  lighttpd: upgrade to 1.4.32
  puzzles: upgrade to r9712
  libconvert-asn1-perl: upgrade to 0.26
  nasm: upgrade to 2.10.05
  prs: use the PRServer to replace the BB_URI_LOCALCOUNT functionality
  liburcu: upgrade to 0.7.4
  babeltrace: upgrade to 1.0.0

Holger Freyther (1):
  classes/binconfig.bbclass: Allow packages to add sed expressions

Kang Kai (1):
  chkconfig: add link files install_initd and remove_initd

Khem Raj (6):
  binutils-2.23.1: Add recipes
  oprofile: Include config.h before bfd.h
  tcmode-default.inc: Use binutils 2.23.1
  binutils_2.23.1.bb: Correct typo in enable-targets configure option
  kernel.bbclass,module-base.bbclass: Use CC to form KERNEL_CC
  util-linux: Package systemd files correctly

Laurentiu Palcu (5):
  image.bbclass: run postinst scripts once, at rootfs time
  rootfs generation: export two new variables to postinst scriptlets
  gtk-icon-cache: run the icon generation at rootfs time
  gdk-pixbuf: generate the pixbuf loader's cache ar rootfs time
  gconf.bbclass: run postinstalls at rootfs time

Mario Domenech Goulart (1):
  pulseaudio: explicitly set --with-database=simple

Mark Hatle (12):
  cpio: Split RMT from cpio
  tar: Split RMT from tar
  package_rpm.bbclass: Add the runtime dependencies to the pre/post
    scriptlets
  rpm: Move rpmdb_loadcvt from base to dev package
  rpm: Fix rpm relocation macro usage
  rpm: Fixup platform matching code
  rpm: Fix Upstream-Status fields
  python-smartpm: Fix incorrect comparison arguments
  package_deb: Dependencies with a ( or ) in them are invalid in debs
  pkgconfig: Add a manual dependency of pkgconfig(pkg-config)
  license.bbclass: Avoid grep error message
  update-alternatives.bbclass: Add missing runtime dependency

Martin Jansa (5):
  at: change initscript dependency from build time to runtime
  scripts/sstate-diff-machines.sh: add simple script to compare sstate
    checksums between MACHINEs
  scripts/sstate-sysroot-cruft.sh: add simple script to find files in
    sysroots not tracked by sstate
  git: fix unpackaged python files
  python-smartpm: don't try to remove /usr/share/share twice

Mihai Prica (3):
  libnl: upgrade to 3.2.14
  wpa-supplicant: configured to work with libnl 3.2.14
  libpcap: PR bump because of PU for libnl

Muhammad Shakeel (3):
  qa.py: Toolchain path should not be hardcoded to execute objdump
  libaio: Remove QA warning: No GNU_HASH in the elf binary
  zip: Remove QA warnings: No GNU_HASH in the elf binary

Otavio Salvador (1):
  initramfs-framework: init: Stop mount warnings during boot

Paul Eggleton (10):
  rpm: enable _openall_before_chroot by default
  createrepo: implement support for recommends
  python-smartpm: add support for recommends
  python-smartpm: style fixes
  python-smartpm: fix package metadata not being read from rpm-md feeds
  python-smartpm: don't create /var/tmp on every rpm database open
  python-smartpm: support nolinktos and noparentdirs rpm options
  python-smartpm: allow setting arbitrary macros in smart config
  shadow: add runtime dependency on base-passwd
  quicky: tidy up inherit

Ross Burton (1):
  mesa: merge internal libraries into mesa-dri package

Saul Wold (3):
  libusb-compat: Update to 0.1.4
  sstate: fetch .siginfo files from SSTATE_MIRROR
  util-linux: rebase remove-lscpu patch

 meta/classes/binconfig.bbclass                     |     3 +
 meta/classes/distrodata.bbclass                    |    91 +-
 meta/classes/gconf.bbclass                         |    11 +-
 meta/classes/gtk-icon-cache.bbclass                |    18 +-
 meta/classes/image.bbclass                         |    20 +-
 meta/classes/kernel-arch.bbclass                   |    13 +
 meta/classes/kernel.bbclass                        |    16 +-
 meta/classes/license.bbclass                       |     3 +-
 meta/classes/module-base.bbclass                   |    16 -
 meta/classes/package.bbclass                       |     4 +
 meta/classes/package_deb.bbclass                   |    10 +
 meta/classes/package_rpm.bbclass                   |    88 +-
 meta/classes/prexport.bbclass                      |    10 +
 meta/classes/prserv.bbclass                        |    22 +-
 meta/classes/rootfs_deb.bbclass                    |     2 +
 meta/classes/rootfs_ipk.bbclass                    |     2 +
 meta/classes/sstate.bbclass                        |     4 +
 meta/classes/update-alternatives.bbclass           |     8 +
 meta/conf/distro/include/tcmode-default.inc        |     2 +-
 meta/lib/oe/qa.py                                  |     4 +-
 meta/recipes-connectivity/libpcap/libpcap.inc      |     2 +-
 .../wpa-supplicant/wpa-supplicant-1.0.inc          |     1 +
 .../wpa-supplicant-1.0/defconfig-gnutls            |     2 +-
 .../wpa-supplicant/wpa-supplicant_1.0.bb           |     2 +-
 .../initrdscripts/initramfs-framework_1.0.bb       |     2 +-
 meta/recipes-core/util-linux/util-linux.inc        |     9 +-
 .../util-linux/util-linux/remove-lscpu.patch       |    29 +-
 meta/recipes-core/util-linux/util-linux_2.22.1.bb  |     2 +-
 meta/recipes-devtools/binutils/binutils-2.23.1.inc |    46 +
 .../binutils-2.23.1/backport/0001-bfd.patch        |    58 +
 ...3-Assemble-all-sources-files-in-each-test.patch |   187 +
 .../binutils-2.23.1/backport/0005-bfd.patch        |   103 +
 .../backport/0010-bfd-ChangeLog.patch              |    95 +
 ...012-Fix-TLS-LD-to-LE-optimization-for-x32.patch |    57 +
 .../backport/0013-gas-ChangeLog.patch              |    43 +
 .../0014-Fix-opcode-for-64-bit-jecxz.patch         |   112 +
 ...-data.exp-Add-XFAIL-for-arm-targets-refer.patch |    40 +
 .../binutils-2.23.1/backport/0018-bfd.patch        |    78 +
 .../binutils-2.23.1/backport/0024-bfd.patch        |    49 +
 .../backport/0026-ld-testsuite.patch               |    65 +
 .../binutils/binutils-2.23.1/binutils-armv5e.patch |    25 +
 .../binutils/binutils-2.23.1/binutils-poison.patch |   259 +
 .../binutils-uclibc-100-uclibc-conf.patch          |    40 +
 ...binutils-uclibc-300-001_ld_makefile_patch.patch |    55 +
 ...binutils-uclibc-300-006_better_file_error.patch |    45 +
 ...ils-uclibc-300-012_check_ldrunpath_length.patch |    49 +
 .../binutils-uclibc-gas-needs-libm.patch           |    38 +
 .../binutils-x86_64_i386_biarch.patch              |    29 +
 .../binutils-2.23.1/libiberty_path_fix.patch       |    22 +
 .../binutils-2.23.1/libtool-2.4-update.patch       | 19407 +++++++++++++++++++
 .../binutils-2.23.1/libtool-rpath-fix.patch        |    39 +
 .../mips64-default-ld-emulation.patch              |    49 +
 .../binutils/binutils-2.23.1/relocatable_sdk.patch |    49 +
 .../binutils/binutils-cross-canadian_2.23.1.bb     |     3 +
 .../binutils/binutils-cross_2.23.1.bb              |     3 +
 .../binutils/binutils-crosssdk_2.23.1.bb           |    14 +
 meta/recipes-devtools/binutils/binutils_2.23.1.bb  |    35 +
 meta/recipes-devtools/git/git.inc                  |     4 +-
 meta/recipes-devtools/git/git_1.7.7.bb             |     2 +-
 .../nasm/{nasm_2.10.01.bb => nasm_2.10.05.bb}      |     4 +-
 meta/recipes-devtools/pkgconfig/pkgconfig.inc      |     5 +
 meta/recipes-devtools/pkgconfig/pkgconfig_0.25.bb  |     2 +-
 meta/recipes-devtools/pkgconfig/pkgconfig_git.bb   |     1 +
 .../python/python-smartpm/smart-dflags.patch       |    40 +
 .../python-smartpm/smart-metadata-match.patch      |    28 +
 .../python/python-smartpm/smart-missingok.patch    |    43 -
 .../python/python-smartpm/smart-recommends.patch   |  1362 ++
 .../python-smartpm/smart-rpm-extra-macros.patch    |    27 +
 .../python/python-smartpm/smart-rpm-md-parse.patch |    26 +
 .../python/python-smartpm/smart-tmpdir.patch       |    30 +
 .../python/python-smartpm_1.4.1.bb                 |    60 +-
 .../rpm/rpm/python-rpm-rpmsense.patch              |     2 +-
 .../rpm/rpm/rpm-db_buffer_small.patch              |     2 +-
 meta/recipes-devtools/rpm/rpm/rpm-platform2.patch  |    56 +
 .../rpm/rpm/rpm-reloc-macros.patch                 |    31 +
 .../rpm/rpm/rpm-stub-out-git_strerror.patch        |     2 +-
 .../rpm/rpm/rpm-uuid-include.patch                 |     2 +
 meta/recipes-devtools/rpm/rpm_5.4.9.bb             |    11 +-
 meta/recipes-extended/at/at_3.1.13.bb              |    13 +-
 .../recipes-extended/chkconfig/chkconfig_1.3.58.bb |    10 +-
 meta/recipes-extended/cpio/cpio_2.11.bb            |     2 +-
 meta/recipes-extended/cpio/cpio_2.8.bb             |     2 +-
 meta/recipes-extended/cpio/cpio_v2.inc             |    11 +-
 .../ethtool/{ethtool_3.5.bb => ethtool_3.6.bb}     |     4 +-
 ...tscript-work-with-long-building-directory.patch |     5 +-
 meta/recipes-extended/libaio/libaio_0.3.109.bb     |     4 +
 .../files/lighttpd_fix_for_automake-1.12.patch     |    37 -
 .../{lighttpd_1.4.31.bb => lighttpd_1.4.32.bb}     |     5 +-
 ...1-perl_0.22.bb => libconvert-asn1-perl_0.26.bb} |     8 +-
 meta/recipes-extended/shadow/shadow_4.1.4.3.bb     |     5 +-
 meta/recipes-extended/tar/tar.inc                  |    11 +-
 meta/recipes-extended/tar/tar_1.17.bb              |     2 +-
 meta/recipes-extended/tar/tar_1.26.bb              |     2 +-
 meta/recipes-extended/zip/zip.inc                  |     2 +
 meta/recipes-gnome/gdk-pixbuf/gdk-pixbuf_2.24.1.bb |    17 +-
 meta/recipes-graphics/mesa/mesa-common.inc         |    19 +-
 .../xcb/{libxcb_1.8.1.bb => libxcb_1.9.bb}         |     4 +-
 meta/recipes-kernel/linux/linux-yocto-rt_3.4.bb    |     8 +-
 meta/recipes-kernel/linux/linux-yocto-tiny_3.4.bb  |     6 +-
 meta/recipes-kernel/linux/linux-yocto_3.4.bb       |    18 +-
 .../{babeltrace_0.12.bb => babeltrace_1.0.0.bb}    |     8 +-
 meta/recipes-kernel/oprofile/oprofile.inc          |     4 +-
 .../oprofile/oprofile/fix-bfd-include.patch        |    66 +
 meta/recipes-multimedia/pulseaudio/pulseaudio.inc  |     1 +
 .../pulseaudio/pulseaudio_2.1.bb                   |     2 +-
 meta/recipes-qt/qt-apps/quicky_0.4.bb              |     6 +-
 ...e-qt4-native-work-with-long-building-path.patch |     3 +-
 .../puzzles/{puzzles_r9660.bb => puzzles_r9712.bb} |     2 +-
 .../createrepo/createrepo/recommends.patch         |    71 +
 .../createrepo/createrepo_0.4.11.bb                |     3 +-
 .../icu/files/icu-add-pkgconfig-support.patch      |    43 +
 meta/recipes-support/icu/icu-3.6.inc               |    11 +
 meta/recipes-support/icu/icu_3.6.bb                |     2 +-
 .../files/libassuan-add-pkgconfig-support.patch    |    59 +
 meta/recipes-support/libassuan/libassuan_2.0.3.bb  |     5 +-
 .../libksba/ksba-add-pkgconfig-support.patch       |    59 +
 meta/recipes-support/libksba/libksba_1.3.0.bb      |     8 +-
 .../libnl/{libnl-2.0 => libnl}/fix-pc-file.patch   |    14 +-
 .../fix-pktloc_syntax_h-race.patch                 |    27 +-
 meta/recipes-support/libnl/libnl_2.0.bb            |    27 -
 meta/recipes-support/libnl/libnl_3.2.14.bb         |    42 +
 .../liburcu/{liburcu_0.6.7.bb => liburcu_0.7.4.bb} |     8 +-
 .../0.1.0-beta1-gcc3.4-fix.patch                   |     0
 ...busb-compat_0.1.3.bb => libusb-compat_0.1.4.bb} |     9 +-
 .../{libxslt_1.1.27.bb => libxslt_1.1.28.bb}       |     4 +-
 .../pth/files/pth-add-pkgconfig-support.patch      |   105 +
 meta/recipes-support/pth/pth_2.0.7.bb              |     7 +-
 scripts/sstate-diff-machines.sh                    |   107 +
 scripts/sstate-sysroot-cruft.sh                    |    78 +
 129 files changed, 23822 insertions(+), 384 deletions(-)
 create mode 100644 meta/recipes-devtools/binutils/binutils-2.23.1.inc
 create mode 100644 meta/recipes-devtools/binutils/binutils-2.23.1/backport/0001-bfd.patch
 create mode 100644 meta/recipes-devtools/binutils/binutils-2.23.1/backport/0003-Assemble-all-sources-files-in-each-test.patch
 create mode 100644 meta/recipes-devtools/binutils/binutils-2.23.1/backport/0005-bfd.patch
 create mode 100644 meta/recipes-devtools/binutils/binutils-2.23.1/backport/0010-bfd-ChangeLog.patch
 create mode 100644 meta/recipes-devtools/binutils/binutils-2.23.1/backport/0012-Fix-TLS-LD-to-LE-optimization-for-x32.patch
 create mode 100644 meta/recipes-devtools/binutils/binutils-2.23.1/backport/0013-gas-ChangeLog.patch
 create mode 100644 meta/recipes-devtools/binutils/binutils-2.23.1/backport/0014-Fix-opcode-for-64-bit-jecxz.patch
 create mode 100644 meta/recipes-devtools/binutils/binutils-2.23.1/backport/0017-ld-elf-comm-data.exp-Add-XFAIL-for-arm-targets-refer.patch
 create mode 100644 meta/recipes-devtools/binutils/binutils-2.23.1/backport/0018-bfd.patch
 create mode 100644 meta/recipes-devtools/binutils/binutils-2.23.1/backport/0024-bfd.patch
 create mode 100644 meta/recipes-devtools/binutils/binutils-2.23.1/backport/0026-ld-testsuite.patch
 create mode 100644 meta/recipes-devtools/binutils/binutils-2.23.1/binutils-armv5e.patch
 create mode 100644 meta/recipes-devtools/binutils/binutils-2.23.1/binutils-poison.patch
 create mode 100644 meta/recipes-devtools/binutils/binutils-2.23.1/binutils-uclibc-100-uclibc-conf.patch
 create mode 100644 meta/recipes-devtools/binutils/binutils-2.23.1/binutils-uclibc-300-001_ld_makefile_patch.patch
 create mode 100644 meta/recipes-devtools/binutils/binutils-2.23.1/binutils-uclibc-300-006_better_file_error.patch
 create mode 100644 meta/recipes-devtools/binutils/binutils-2.23.1/binutils-uclibc-300-012_check_ldrunpath_length.patch
 create mode 100644 meta/recipes-devtools/binutils/binutils-2.23.1/binutils-uclibc-gas-needs-libm.patch
 create mode 100644 meta/recipes-devtools/binutils/binutils-2.23.1/binutils-x86_64_i386_biarch.patch
 create mode 100644 meta/recipes-devtools/binutils/binutils-2.23.1/libiberty_path_fix.patch
 create mode 100644 meta/recipes-devtools/binutils/binutils-2.23.1/libtool-2.4-update.patch
 create mode 100644 meta/recipes-devtools/binutils/binutils-2.23.1/libtool-rpath-fix.patch
 create mode 100644 meta/recipes-devtools/binutils/binutils-2.23.1/mips64-default-ld-emulation.patch
 create mode 100644 meta/recipes-devtools/binutils/binutils-2.23.1/relocatable_sdk.patch
 create mode 100644 meta/recipes-devtools/binutils/binutils-cross-canadian_2.23.1.bb
 create mode 100644 meta/recipes-devtools/binutils/binutils-cross_2.23.1.bb
 create mode 100644 meta/recipes-devtools/binutils/binutils-crosssdk_2.23.1.bb
 create mode 100644 meta/recipes-devtools/binutils/binutils_2.23.1.bb
 rename meta/recipes-devtools/nasm/{nasm_2.10.01.bb => nasm_2.10.05.bb} (81%)
 create mode 100644 meta/recipes-devtools/python/python-smartpm/smart-dflags.patch
 create mode 100644 meta/recipes-devtools/python/python-smartpm/smart-metadata-match.patch
 delete mode 100644 meta/recipes-devtools/python/python-smartpm/smart-missingok.patch
 create mode 100644 meta/recipes-devtools/python/python-smartpm/smart-recommends.patch
 create mode 100644 meta/recipes-devtools/python/python-smartpm/smart-rpm-extra-macros.patch
 create mode 100644 meta/recipes-devtools/python/python-smartpm/smart-rpm-md-parse.patch
 create mode 100644 meta/recipes-devtools/python/python-smartpm/smart-tmpdir.patch
 create mode 100644 meta/recipes-devtools/rpm/rpm/rpm-platform2.patch
 create mode 100644 meta/recipes-devtools/rpm/rpm/rpm-reloc-macros.patch
 rename meta/recipes-extended/ethtool/{ethtool_3.5.bb => ethtool_3.6.bb} (79%)
 delete mode 100644 meta/recipes-extended/lighttpd/files/lighttpd_fix_for_automake-1.12.patch
 rename meta/recipes-extended/lighttpd/{lighttpd_1.4.31.bb => lighttpd_1.4.32.bb} (90%)
 rename meta/recipes-extended/perl/{libconvert-asn1-perl_0.22.bb => libconvert-asn1-perl_0.26.bb} (60%)
 rename meta/recipes-graphics/xcb/{libxcb_1.8.1.bb => libxcb_1.9.bb} (55%)
 rename meta/recipes-kernel/lttng-2.0/{babeltrace_0.12.bb => babeltrace_1.0.0.bb} (81%)
 create mode 100644 meta/recipes-kernel/oprofile/oprofile/fix-bfd-include.patch
 rename meta/recipes-sato/puzzles/{puzzles_r9660.bb => puzzles_r9712.bb} (96%)
 create mode 100644 meta/recipes-support/createrepo/createrepo/recommends.patch
 create mode 100644 meta/recipes-support/icu/files/icu-add-pkgconfig-support.patch
 create mode 100644 meta/recipes-support/libassuan/files/libassuan-add-pkgconfig-support.patch
 create mode 100644 meta/recipes-support/libksba/libksba/ksba-add-pkgconfig-support.patch
 rename meta/recipes-support/libnl/{libnl-2.0 => libnl}/fix-pc-file.patch (52%)
 rename meta/recipes-support/libnl/{libnl-2.0 => libnl}/fix-pktloc_syntax_h-race.patch (57%)
 delete mode 100644 meta/recipes-support/libnl/libnl_2.0.bb
 create mode 100644 meta/recipes-support/libnl/libnl_3.2.14.bb
 rename meta/recipes-support/liburcu/{liburcu_0.6.7.bb => liburcu_0.7.4.bb} (76%)
 rename meta/recipes-support/libusb/{libusb-compat-0.1.3 => libusb-compat-0.1.4}/0.1.0-beta1-gcc3.4-fix.patch (100%)
 rename meta/recipes-support/libusb/{libusb-compat_0.1.3.bb => libusb-compat_0.1.4.bb} (82%)
 rename meta/recipes-support/libxslt/{libxslt_1.1.27.bb => libxslt_1.1.28.bb} (87%)
 create mode 100644 meta/recipes-support/pth/files/pth-add-pkgconfig-support.patch
 create mode 100755 scripts/sstate-diff-machines.sh
 create mode 100755 scripts/sstate-sysroot-cruft.sh

-- 
1.8.0.1



