Received: from mga03.intel.com ([143.182.124.21])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <sgw@linux.intel.com>) id 1UZyWa-00021m-SG
	for openembedded-core@lists.openembedded.org;
	Wed, 08 May 2013 09:10:59 +0200
Received: from azsmga002.ch.intel.com ([10.2.17.35])
	by azsmga101.ch.intel.com with ESMTP; 07 May 2013 23:52:48 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="4.87,632,1363158000"; d="scan'208";a="238395487"
Received: from unknown (HELO swold-linux.bigsur.com) ([10.255.12.247])
	by AZSMGA002.ch.intel.com with ESMTP; 07 May 2013 23:52:48 -0700
From: Saul Wold <sgw@linux.intel.com>
To: openembedded-core@lists.openembedded.org
Date: Tue,  7 May 2013 23:52:48 -0700
Message-Id: <cover.1367995796.git.sgw@linux.intel.com>
X-Mailer: git-send-email 1.8.0.2
MIME-Version: 1.0
Subject: [CONSOLIDATED PULL 00/23] Updated Pull
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
X-List-Received-Date: Wed, 08 May 2013 07:11:02 -0000
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit

Richard, 

This is an updated version of the C-Pull, it address the udev, binutils
and final gcc-4.8 patches.

I will propose a 4.8 patch to update to that version later this week.

I have another batch of change, but I screwed up the push to MUT before
building it. Expect that set tommorrow evening after the weekly build.

Sau!


The following changes since commit 2400a74923e51e17ecfa94c2d63908b0b2aac76a:

  archive-*-source.bbclass: handle dependency in anonymous function (2013-05-07 13:57:26 +0100)

are available in the git repository at:

  git://git.openembedded.org/openembedded-core-contrib sgw/stage
  http://cgit.openembedded.org/cgit.cgi/openembedded-core-contrib/log/?h=sgw/stage

Andreas Müller (2):
  systemd: do not recommend udev-extraconf for udev
  udev: do not recommend udev-extraconf

Andrei Dinu (1):
  SLiRP support in runqemu

Bruce Ashfield (4):
  linux-yocto/3.4: iwlwifi, ext4, brtfs warning and -rt fixes
  kern-tools: anchor and delimit regexs
  linux-yocto/3.4: update to v3.4.43, ltsi-65311d8 and v3.4.42-rt56
  linux-yocto/3.8: udpate to v3.8.11

Carlos Rafael Giani (1):
  gstreamer: Fixed dependency problem with -meta packages

Hongxu Jia (2):
  cracklib: fix default dictionary should be generated for target
    endianness
  craklib:fix testnum and teststr failed

Jonathan Liu (1):
  guile: Update to 2.0.9

Khem Raj (3):
  binutils: Upgrade 2.23.1 -> 2.23.2
  tcmode-default.inc: Pin binutils to 2.23.2
  gcc-configure-target: Add --enable-dependency-tracking to EXTRA_OECONF
Mike Crowe (1):
  gdb-cross: gdb-cross requires readline-native

Ross Burton (3):
  libsoup: upgrade to 2.42.1
  gnome-keyring: remove, nothing uses it in oe-core
  libgnome-keyring: remove, nothing in oe-core uses this anymore

Saul Wold (5):
  packagegroup-core-lsb: Add udev-extraconf for LSB compatibility
  packagegroup-core-x11-sato: Add udev-extraconf to maintain
    compatibility
  qemu: Ensure kernel nfsd module is enabled
  binutils: backport whitespace fix
  dmidecode: fix fetch path to use BP

 meta/conf/distro/include/seperatebuilddir.inc      |   2 -
 meta/conf/distro/include/tcmode-default.inc        |   2 +-
 meta/conf/machine/include/qemu.inc                 |   3 +
 meta/recipes-core/systemd/systemd_199.bb           |   4 +-
 meta/recipes-core/udev/udev.inc                    |   2 +-
 .../binutils-2.23.1/backport/0001-bfd.patch        |  58 ----
 ...3-Assemble-all-sources-files-in-each-test.patch | 187 ------------
 .../binutils-2.23.1/backport/0005-bfd.patch        | 103 -------
 .../backport/0010-bfd-ChangeLog.patch              |  95 ------
 ...012-Fix-TLS-LD-to-LE-optimization-for-x32.patch |  57 ----
 .../backport/0013-gas-ChangeLog.patch              |  43 ---
 .../0014-Fix-opcode-for-64-bit-jecxz.patch         | 112 -------
 ...-data.exp-Add-XFAIL-for-arm-targets-refer.patch |  40 ---
 .../binutils-2.23.1/backport/0018-bfd.patch        |  78 -----
 .../binutils-2.23.1/backport/0024-bfd.patch        |  49 ----
 .../backport/0026-ld-testsuite.patch               |  65 -----
 .../{binutils-2.23.1.inc => binutils-2.23.2.inc}   |  16 +-
 ...pc.c-md_assemble-Do-not-generate-APUinfo-.patch |   0
 ...ls.texi-elfedit-Fix-use-of-itemx-in-table.patch |   0
 ...-Replace-with-when-it-is-part-of-the-text.patch |   0
 .../binutils-fix-ineffectual-zero-of-cache.patch   |   0
 .../binutils-fix-skip-whitespace-pr14887.patch     |  50 ++++
 .../binutils-replace-strncat-with-strcat.patch     |   0
 .../binutils-armv5e.patch                          |   0
 .../binutils-fix-over-array-bounds-issue.patch     |   0
 .../binutils-poison.patch                          |   0
 .../binutils-uclibc-100-uclibc-conf.patch          |   0
 ...binutils-uclibc-300-001_ld_makefile_patch.patch |   0
 ...binutils-uclibc-300-006_better_file_error.patch |   0
 ...ils-uclibc-300-012_check_ldrunpath_length.patch |   0
 .../binutils-uclibc-gas-needs-libm.patch           |   0
 .../binutils-x86_64_i386_biarch.patch              |   0
 .../libiberty_path_fix.patch                       |   0
 .../libtool-2.4-update.patch                       |   0
 .../libtool-rpath-fix.patch                        |   0
 .../mips64-default-ld-emulation.patch              |   0
 .../relocatable_sdk.patch                          |   0
 ...2.23.1.bb => binutils-cross-canadian_2.23.2.bb} |   0
 ...ls-cross_2.23.1.bb => binutils-cross_2.23.2.bb} |   0
 ...sssdk_2.23.1.bb => binutils-crosssdk_2.23.2.bb} |   0
 .../{binutils_2.23.1.bb => binutils_2.23.2.bb}     |   0
 meta/recipes-devtools/dmidecode/dmidecode_2.12.bb  |   2 +-
 meta/recipes-devtools/gcc/gcc-configure-target.inc |   2 +-
 meta/recipes-devtools/gdb/gdb-cross.inc            |   2 +-
 .../guile/files/fix_parallel_build_issue.patch     |  20 --
 .../guile/{guile_2.0.7.bb => guile_2.0.9.bb}       |   7 +-
 ...c-support-dictionary-byte-order-dependent.patch | 322 +++++++++++++++++++++
 ...02-craklib-fix-testnum-and-teststr-failed.patch |  53 ++++
 meta/recipes-extended/cracklib/cracklib_2.8.22.bb  |   4 +-
 .../packagegroups/packagegroup-core-lsb.bb         |   1 +
 .../gnome/gnome-keyring/org.gnome.keyring.service  |   3 -
 meta/recipes-gnome/gnome/gnome-keyring_2.32.1.bb   |  44 ---
 .../recipes-gnome/gnome/libgnome-keyring_2.32.0.bb |  19 --
 .../kern-tools/kern-tools-native_git.bb            |   2 +-
 meta/recipes-kernel/linux/linux-yocto-rt_3.4.bb    |   8 +-
 meta/recipes-kernel/linux/linux-yocto-rt_3.8.bb    |   8 +-
 meta/recipes-kernel/linux/linux-yocto-tiny_3.4.bb  |   6 +-
 meta/recipes-kernel/linux/linux-yocto-tiny_3.8.bb  |   6 +-
 meta/recipes-kernel/linux/linux-yocto_3.4.bb       |  16 +-
 meta/recipes-kernel/linux/linux-yocto_3.8.bb       |  16 +-
 .../gstreamer/gst-plugins-package.inc              |   5 +-
 .../packagegroups/packagegroup-core-x11-sato.bb    |   1 +
 ...libsoup-2.4_2.40.2.bb => libsoup-2.4_2.42.1.bb} |  14 +-
 scripts/runqemu                                    |   3 +
 scripts/runqemu-internal                           | 220 ++++++++------
 65 files changed, 618 insertions(+), 1132 deletions(-)
 delete mode 100644 meta/recipes-devtools/binutils/binutils-2.23.1/backport/0001-bfd.patch
 delete mode 100644 meta/recipes-devtools/binutils/binutils-2.23.1/backport/0003-Assemble-all-sources-files-in-each-test.patch
 delete mode 100644 meta/recipes-devtools/binutils/binutils-2.23.1/backport/0005-bfd.patch
 delete mode 100644 meta/recipes-devtools/binutils/binutils-2.23.1/backport/0010-bfd-ChangeLog.patch
 delete mode 100644 meta/recipes-devtools/binutils/binutils-2.23.1/backport/0012-Fix-TLS-LD-to-LE-optimization-for-x32.patch
 delete mode 100644 meta/recipes-devtools/binutils/binutils-2.23.1/backport/0013-gas-ChangeLog.patch
 delete mode 100644 meta/recipes-devtools/binutils/binutils-2.23.1/backport/0014-Fix-opcode-for-64-bit-jecxz.patch
 delete mode 100644 meta/recipes-devtools/binutils/binutils-2.23.1/backport/0017-ld-elf-comm-data.exp-Add-XFAIL-for-arm-targets-refer.patch
 delete mode 100644 meta/recipes-devtools/binutils/binutils-2.23.1/backport/0018-bfd.patch
 delete mode 100644 meta/recipes-devtools/binutils/binutils-2.23.1/backport/0024-bfd.patch
 delete mode 100644 meta/recipes-devtools/binutils/binutils-2.23.1/backport/0026-ld-testsuite.patch
 rename meta/recipes-devtools/binutils/{binutils-2.23.1.inc => binutils-2.23.2.inc} (71%)
 rename meta/recipes-devtools/binutils/{binutils-2.23.1 => binutils-2.23.2}/backport/0001-config-tc-ppc.c-md_assemble-Do-not-generate-APUinfo-.patch (100%)
 rename meta/recipes-devtools/binutils/{binutils-2.23.1 => binutils-2.23.2}/backport/0001-doc-binutils.texi-elfedit-Fix-use-of-itemx-in-table.patch (100%)
 rename meta/recipes-devtools/binutils/{binutils-2.23.1 => binutils-2.23.2}/backport/0001-ld.texinfo-Replace-with-when-it-is-part-of-the-text.patch (100%)
 rename meta/recipes-devtools/binutils/{binutils-2.23.1 => binutils-2.23.2}/backport/binutils-fix-ineffectual-zero-of-cache.patch (100%)
 create mode 100644 meta/recipes-devtools/binutils/binutils-2.23.2/backport/binutils-fix-skip-whitespace-pr14887.patch
 rename meta/recipes-devtools/binutils/{binutils-2.23.1 => binutils-2.23.2}/backport/binutils-replace-strncat-with-strcat.patch (100%)
 rename meta/recipes-devtools/binutils/{binutils-2.23.1 => binutils-2.23.2}/binutils-armv5e.patch (100%)
 rename meta/recipes-devtools/binutils/{binutils-2.23.1 => binutils-2.23.2}/binutils-fix-over-array-bounds-issue.patch (100%)
 rename meta/recipes-devtools/binutils/{binutils-2.23.1 => binutils-2.23.2}/binutils-poison.patch (100%)
 rename meta/recipes-devtools/binutils/{binutils-2.23.1 => binutils-2.23.2}/binutils-uclibc-100-uclibc-conf.patch (100%)
 rename meta/recipes-devtools/binutils/{binutils-2.23.1 => binutils-2.23.2}/binutils-uclibc-300-001_ld_makefile_patch.patch (100%)
 rename meta/recipes-devtools/binutils/{binutils-2.23.1 => binutils-2.23.2}/binutils-uclibc-300-006_better_file_error.patch (100%)
 rename meta/recipes-devtools/binutils/{binutils-2.23.1 => binutils-2.23.2}/binutils-uclibc-300-012_check_ldrunpath_length.patch (100%)
 rename meta/recipes-devtools/binutils/{binutils-2.23.1 => binutils-2.23.2}/binutils-uclibc-gas-needs-libm.patch (100%)
 rename meta/recipes-devtools/binutils/{binutils-2.23.1 => binutils-2.23.2}/binutils-x86_64_i386_biarch.patch (100%)
 rename meta/recipes-devtools/binutils/{binutils-2.23.1 => binutils-2.23.2}/libiberty_path_fix.patch (100%)
 rename meta/recipes-devtools/binutils/{binutils-2.23.1 => binutils-2.23.2}/libtool-2.4-update.patch (100%)
 rename meta/recipes-devtools/binutils/{binutils-2.23.1 => binutils-2.23.2}/libtool-rpath-fix.patch (100%)
 rename meta/recipes-devtools/binutils/{binutils-2.23.1 => binutils-2.23.2}/mips64-default-ld-emulation.patch (100%)
 rename meta/recipes-devtools/binutils/{binutils-2.23.1 => binutils-2.23.2}/relocatable_sdk.patch (100%)
 rename meta/recipes-devtools/binutils/{binutils-cross-canadian_2.23.1.bb => binutils-cross-canadian_2.23.2.bb} (100%)
 rename meta/recipes-devtools/binutils/{binutils-cross_2.23.1.bb => binutils-cross_2.23.2.bb} (100%)
 rename meta/recipes-devtools/binutils/{binutils-crosssdk_2.23.1.bb => binutils-crosssdk_2.23.2.bb} (100%)
 rename meta/recipes-devtools/binutils/{binutils_2.23.1.bb => binutils_2.23.2.bb} (100%)
 delete mode 100644 meta/recipes-devtools/guile/files/fix_parallel_build_issue.patch
 rename meta/recipes-devtools/guile/{guile_2.0.7.bb => guile_2.0.9.bb} (94%)
 create mode 100644 meta/recipes-extended/cracklib/cracklib/0001-packlib.c-support-dictionary-byte-order-dependent.patch
 create mode 100644 meta/recipes-extended/cracklib/cracklib/0002-craklib-fix-testnum-and-teststr-failed.patch
 delete mode 100644 meta/recipes-gnome/gnome/gnome-keyring/org.gnome.keyring.service
 delete mode 100644 meta/recipes-gnome/gnome/gnome-keyring_2.32.1.bb
 delete mode 100644 meta/recipes-gnome/gnome/libgnome-keyring_2.32.0.bb
 rename meta/recipes-support/libsoup/{libsoup-2.4_2.40.2.bb => libsoup-2.4_2.42.1.bb} (59%)

-- 
1.8.0.2



