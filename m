Return-Path: <sgw@linux.intel.com>
Received: from mga03.intel.com (mga03.intel.com [143.182.124.21])
	by mail.openembedded.org (Postfix) with ESMTP id 86E616D319
	for <openembedded-core@lists.openembedded.org>;
	Thu, 24 Oct 2013 14:08:25 +0000 (UTC)
Received: from fmsmga001.fm.intel.com ([10.253.24.23])
	by azsmga101.ch.intel.com with ESMTP; 24 Oct 2013 07:08:26 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="4.93,562,1378882800"; d="scan'208";a="416515256"
Received: from unknown (HELO swold-linux.eicc.co.uk) ([10.255.14.244])
	by fmsmga001.fm.intel.com with ESMTP; 24 Oct 2013 07:08:25 -0700
From: Saul Wold <sgw@linux.intel.com>
To: openembedded-core@lists.openembedded.org
Date: Thu, 24 Oct 2013 07:08:25 -0700
Message-Id: <cover.1382620717.git.sgw@linux.intel.com>
X-Mailer: git-send-email 1.8.3.1
MIME-Version: 1.0
Subject: [CONSOLIDATED PULL 00/43] Patches and Updates
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
X-List-Received-Date: Thu, 24 Oct 2013 14:08:27 -0000
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit

Richard, 

This has been run through the autobuilder and I have done
a review of these.

Sau!



The following changes since commit 843a5dd8f8f0461e286d9fdb3ba55205b4275f88:

  base.bbclass: fix nondeterministic PACKAGECONFIG processing order (2013-10-24 08:38:24 +0100)

are available in the git repository at:

  git://git.openembedded.org/openembedded-core-contrib sgw/stage
  http://cgit.openembedded.org/cgit.cgi/openembedded-core-contrib/log/?h=sgw/stage

Andrea Adami (5):
  image_types.bbclass: do not force --no-cleanmarkers for jffs2
  image_types.bbclass: fix endiannes for sumtool (jffs2 summary)
  image_types.bbclass: fix EXTRA_IMAGECMD_sum.jffs2
  image_types.bbclass: add JFFS2_NOCLEANMARKERS variable
  image_types.bbclass: add JFFS2_PADDING variable

Andreas Oberritter (4):
  mesa: make runtime variables depend on PACKAGECONFIG
  mesa-gl: use base_set_filespath
  cogl-1.0: depend on virtual/mesa
  cogl-1.0: explicitly disable cairo

Chen Qi (1):
  runqemu-extract-sdk: add --numeric-owner option to tar command

David Nyström (1):
  rpm: Add nativesdk to BBCLASSEXTEND

Fathi Boudra (1):
  openssl: use linux-generic64 target for Aarch64 (LE and BE)

Hongxu Jia (1):
  kernel-grub.bbclass: add a method to install/update for bzImage

Koen Kooi (1):
  openssl: switch ARM builds from linux-elf-arm to linux-armv4 config

Konrad Scherer (1):
  relocate_sdk.py: Allow script to work with Python 2.4 and 3.

Laurentiu Palcu (8):
  xmodmap: upgrade to 1.0.8
  python-setuptools: upgrade to 1.1.6
  xinit: upgrade to 1.3.3
  m4: upgrade to 1.4.17
  tar: upgrade to 1.27
  tcl: upgrade to 8.6.1
  mdadm: upgrade to 3.3
  gdb: upgrade to 7.6.1

Lu Chong (1):
  minicom: fix -v/-h return value

Maxin B. John (1):
  dropbear: update to 2013.60 version

Mihaela Sendrea (3):
  dejagnu: Add recipe
  expect: Add recipe
  gcc-runtime: Add ptest

Ming Liu (6):
  base-files: remove invalid entries from /etc/shells
  bash: dynamically add or remove a entry to/from /etc/shells
  screen: dynamically add or remove a entry to/from /etc/shells
  bzip2: replace += with _append for appending to OVERRIDES variables
  libarchive: replace += with _append for appending to OVERRIDES
    variables
  nss: don't need set SRC_URI with both += and _append

Paul Eggleton (1):
  buildhistory-diff: add ability to report version changes

Petter Mabäcker (1):
  clutter: remove usage of FILESPATH

Ross Burton (2):
  packagegroup-base: if zeroconf DISTRO_FEATURE enabled, add libnss-mdns
  gdk-pixbuf: use PACKAGECONFIG to control legacy X11 sub-library

Roy Li (1):
  mesa: fix dependency

Saul Wold (3):
  libcheck: Add native support for kbd-native
  kbd: Use libcheck instead of check
  check: Remove duplicate recipe of libcheck

Sujith H (1):
  nspr: Add LDFLAGS to TARGET_CC_ARCH to fix warning

 meta/classes/clutter.bbclass                       |   1 -
 meta/classes/image_types.bbclass                   |  13 +-
 meta/classes/kernel-grub.bbclass                   |  90 ++++++++++++
 meta/lib/oe/buildhistory_analysis.py               |  41 +++---
 .../openssl/openssl-1.0.1e/configure-targets.patch |  13 +-
 .../openssl-1.0.1e/initial-aarch64-bits.patch      | 111 ++++++++++++++
 meta/recipes-connectivity/openssl/openssl.inc      |   5 +-
 .../recipes-connectivity/openssl/openssl_1.0.1e.bb |   1 +
 meta/recipes-core/base-files/base-files/shells     |   6 -
 .../0001-urandom-xauth-changes-to-options.h.patch  |   0
 .../0002-static_build_fix.patch                    |   0
 .../0003-configure.patch                           |   0
 .../0004-fix-2kb-keys.patch                        |   0
 .../0005-dropbear-enable-pam.patch                 |   0
 .../0006-dropbear-configuration-file.patch         |  22 +--
 .../0007-dropbear-fix-for-x32-abi.patch            |   0
 meta/recipes-core/dropbear/dropbear.inc            |   4 +-
 meta/recipes-core/dropbear/dropbear_2013.58.bb     |   6 -
 meta/recipes-core/dropbear/dropbear_2013.60.bb     |   6 +
 meta/recipes-core/kbd/kbd_2.0.0.bb                 |   2 +-
 .../packagegroups/packagegroup-base.bb             |   1 +
 .../dejagnu-1.5/remove-expect-tcl-dependency.patch |  34 +++++
 meta/recipes-devtools/dejagnu/dejagnu_1.5.bb       |  19 +++
 .../expect/expect/0001-configure.in.patch          | 108 ++++++++++++++
 .../expect/expect/0002-tcl.m4.patch                |  17 +++
 meta/recipes-devtools/expect/expect_5.45.bb        |  53 +++++++
 meta/recipes-devtools/gcc/gcc-4.8.inc              |   2 +
 .../gcc-4.8/add-install-ptest-to-Makefile.patch    | 162 +++++++++++++++++++++
 meta/recipes-devtools/gcc/gcc-4.8/run-ptest        |   3 +
 meta/recipes-devtools/gcc/gcc-common.inc           |   2 +-
 meta/recipes-devtools/gcc/gcc-runtime.inc          |  21 ++-
 .../gdb/{gdb-7.6.inc => gdb-7.6.1.inc}             |   4 +-
 ...canadian_7.6.bb => gdb-cross-canadian_7.6.1.bb} |   2 +-
 .../gdb/{gdb-cross_7.6.bb => gdb-cross_7.6.1.bb}   |   2 +-
 .../gdb/{gdb_7.6.bb => gdb_7.6.1.bb}               |   2 +-
 .../m4/{m4-1.4.16.inc => m4-1.4.17.inc}            |   9 +-
 .../{m4-native_1.4.16.bb => m4-native_1.4.17.bb}   |   0
 meta/recipes-devtools/m4/m4/remove-gets.patch      |  18 ++-
 .../m4/{m4_1.4.16.bb => m4_1.4.17.bb}              |   0
 ...ptools_0.6c11.bb => python-setuptools_1.1.6.bb} |   7 +-
 meta/recipes-devtools/rpm/rpm_5.4.9.bb             |  30 +++-
 .../tcltk/tcl/let-DST-include-year-2099.patch      |  35 -----
 .../tcltk/tcl/tcl-add-soname.patch                 |  38 ++---
 .../tcltk/{tcl_8.6.0.bb => tcl_8.6.1.bb}           |   7 +-
 meta/recipes-extended/bash/bash.inc                |  10 +-
 meta/recipes-extended/bzip2/bzip2_1.0.6.bb         |   2 +-
 .../libarchive/libarchive_2.8.5.bb                 |   4 +-
 .../mdadm/files/mdadm-3.2.2_fix_for_x32.patch      |  11 +-
 .../mdadm/{mdadm_3.2.6.bb => mdadm_3.3.bb}         |   5 +-
 ...001-fix-minicom-h-v-return-value-is-not-0.patch |  35 +++++
 meta/recipes-extended/minicom/minicom_2.6.2.bb     |   1 +
 meta/recipes-extended/screen/screen_4.0.3.bb       |  10 ++
 .../tar/{tar-1.26 => tar-1.27}/remove-gets.patch   |  18 ++-
 ...tive_1.26.bb => tar-replacement-native_1.27.bb} |   0
 .../tar/{tar_1.26.bb => tar_1.27.bb}               |   6 +-
 meta/recipes-gnome/gdk-pixbuf/gdk-pixbuf_2.28.2.bb |  13 +-
 .../enable_tests.patch                             |   0
 .../fix-wayland-deps.patch                         |   0
 .../cogl-1.14.patch                                |   0
 .../enable-tests.patch                             |   0
 meta/recipes-graphics/cogl/cogl-1.0.inc            |   3 +-
 meta/recipes-graphics/mesa/mesa-gl_9.1.6.bb        |   2 +-
 meta/recipes-graphics/mesa/mesa.inc                |  21 ++-
 .../fix-build-dir.patch                            |   0
 .../fix-test-includes.patch                        |   0
 .../xorg-app/{xinit_1.3.2.bb => xinit_1.3.3.bb}    |   7 +-
 .../{xmodmap_1.0.7.bb => xmodmap_1.0.8.bb}         |   7 +-
 meta/recipes-support/check/check_0.9.10.bb         |  20 ---
 meta/recipes-support/check/files/ptest.patch       |  29 ----
 meta/recipes-support/check/files/run-ptest         |   3 -
 meta/recipes-support/libcheck/libcheck_0.9.10.bb   |   3 +
 meta/recipes-support/nspr/nspr_4.10.bb             |   1 +
 meta/recipes-support/nss/nss.inc                   |   2 +-
 scripts/buildhistory-diff                          |   8 +-
 scripts/relocate_sdk.py                            |  42 +++---
 scripts/runqemu-extract-sdk                        |   6 +-
 76 files changed, 890 insertions(+), 276 deletions(-)
 create mode 100644 meta/classes/kernel-grub.bbclass
 create mode 100644 meta/recipes-connectivity/openssl/openssl-1.0.1e/initial-aarch64-bits.patch
 rename meta/recipes-core/dropbear/{dropbear-2013.58 => dropbear-2013.60}/0001-urandom-xauth-changes-to-options.h.patch (100%)
 rename meta/recipes-core/dropbear/{dropbear-2013.58 => dropbear-2013.60}/0002-static_build_fix.patch (100%)
 rename meta/recipes-core/dropbear/{dropbear-2013.58 => dropbear-2013.60}/0003-configure.patch (100%)
 rename meta/recipes-core/dropbear/{dropbear-2013.58 => dropbear-2013.60}/0004-fix-2kb-keys.patch (100%)
 rename meta/recipes-core/dropbear/{dropbear-2013.58 => dropbear-2013.60}/0005-dropbear-enable-pam.patch (100%)
 rename meta/recipes-core/dropbear/{dropbear-2013.58 => dropbear-2013.60}/0006-dropbear-configuration-file.patch (56%)
 rename meta/recipes-core/dropbear/{dropbear-2013.58 => dropbear-2013.60}/0007-dropbear-fix-for-x32-abi.patch (100%)
 delete mode 100644 meta/recipes-core/dropbear/dropbear_2013.58.bb
 create mode 100644 meta/recipes-core/dropbear/dropbear_2013.60.bb
 create mode 100644 meta/recipes-devtools/dejagnu/dejagnu-1.5/remove-expect-tcl-dependency.patch
 create mode 100644 meta/recipes-devtools/dejagnu/dejagnu_1.5.bb
 create mode 100644 meta/recipes-devtools/expect/expect/0001-configure.in.patch
 create mode 100644 meta/recipes-devtools/expect/expect/0002-tcl.m4.patch
 create mode 100644 meta/recipes-devtools/expect/expect_5.45.bb
 create mode 100644 meta/recipes-devtools/gcc/gcc-4.8/add-install-ptest-to-Makefile.patch
 create mode 100644 meta/recipes-devtools/gcc/gcc-4.8/run-ptest
 rename meta/recipes-devtools/gdb/{gdb-7.6.inc => gdb-7.6.1.inc} (70%)
 rename meta/recipes-devtools/gdb/{gdb-cross-canadian_7.6.bb => gdb-cross-canadian_7.6.1.bb} (71%)
 rename meta/recipes-devtools/gdb/{gdb-cross_7.6.bb => gdb-cross_7.6.1.bb} (74%)
 rename meta/recipes-devtools/gdb/{gdb_7.6.bb => gdb_7.6.1.bb} (96%)
 rename meta/recipes-devtools/m4/{m4-1.4.16.inc => m4-1.4.17.inc} (47%)
 rename meta/recipes-devtools/m4/{m4-native_1.4.16.bb => m4-native_1.4.17.bb} (100%)
 rename meta/recipes-devtools/m4/{m4_1.4.16.bb => m4_1.4.17.bb} (100%)
 rename meta/recipes-devtools/python/{python-setuptools_0.6c11.bb => python-setuptools_1.1.6.bb} (76%)
 delete mode 100644 meta/recipes-devtools/tcltk/tcl/let-DST-include-year-2099.patch
 rename meta/recipes-devtools/tcltk/{tcl_8.6.0.bb => tcl_8.6.1.bb} (91%)
 rename meta/recipes-extended/mdadm/{mdadm_3.2.6.bb => mdadm_3.3.bb} (86%)
 create mode 100644 meta/recipes-extended/minicom/minicom-2.6.2/0001-fix-minicom-h-v-return-value-is-not-0.patch
 rename meta/recipes-extended/tar/{tar-1.26 => tar-1.27}/remove-gets.patch (52%)
 rename meta/recipes-extended/tar/{tar-replacement-native_1.26.bb => tar-replacement-native_1.27.bb} (100%)
 rename meta/recipes-extended/tar/{tar_1.26.bb => tar_1.27.bb} (51%)
 rename meta/recipes-graphics/clutter/{clutter-1.14 => clutter-1.0-1.14.4}/enable_tests.patch (100%)
 rename meta/recipes-graphics/clutter/{clutter-1.14 => clutter-1.0-1.14.4}/fix-wayland-deps.patch (100%)
 rename meta/recipes-graphics/clutter/{clutter-gst-1.6 => clutter-gst-1.0-1.6.0}/cogl-1.14.patch (100%)
 rename meta/recipes-graphics/clutter/{clutter-gst => clutter-gst-1.0-1.6.0}/enable-tests.patch (100%)
 rename meta/recipes-graphics/mx/{mx-1.4 => mx-1.0-1.4.7+gitAUTOINC+9b1db6b806}/fix-build-dir.patch (100%)
 rename meta/recipes-graphics/mx/{mx => mx-1.0-1.4.7+gitAUTOINC+9b1db6b806}/fix-test-includes.patch (100%)
 rename meta/recipes-graphics/xorg-app/{xinit_1.3.2.bb => xinit_1.3.3.bb} (67%)
 rename meta/recipes-graphics/xorg-app/{xmodmap_1.0.7.bb => xmodmap_1.0.8.bb} (67%)
 delete mode 100644 meta/recipes-support/check/check_0.9.10.bb
 delete mode 100644 meta/recipes-support/check/files/ptest.patch
 delete mode 100644 meta/recipes-support/check/files/run-ptest

-- 
1.8.3.1


