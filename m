Return-Path: <Liezhi.Yang@windriver.com>
Received: from mail1.windriver.com (mail1.windriver.com [147.11.146.13])
	by mail.openembedded.org (Postfix) with ESMTP id 6481260116
	for <openembedded-core@lists.openembedded.org>;
	Mon, 28 Dec 2015 07:14:49 +0000 (UTC)
Received: from ALA-HCA.corp.ad.wrs.com (ala-hca.corp.ad.wrs.com
	[147.11.189.40])
	by mail1.windriver.com (8.15.2/8.15.1) with ESMTPS id tBS7EnAA025207
	(version=TLSv1 cipher=AES128-SHA bits=128 verify=FAIL)
	for <openembedded-core@lists.openembedded.org>;
	Sun, 27 Dec 2015 23:14:49 -0800 (PST)
Received: from ala-blade47.wrs.com (147.11.105.67) by ALA-HCA.corp.ad.wrs.com
	(147.11.189.50) with Microsoft SMTP Server id 14.3.248.2;
	Sun, 27 Dec 2015 23:14:48 -0800
From: Robert Yang <liezhi.yang@windriver.com>
To: <openembedded-core@lists.openembedded.org>
Date: Sun, 27 Dec 2015 23:14:08 -0800
Message-ID: <cover.1451286789.git.liezhi.yang@windriver.com>
X-Mailer: git-send-email 1.7.9.5
MIME-Version: 1.0
Subject: [PATCH 00/40] [jethro] Consolidated pull
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
X-List-Received-Date: Mon, 28 Dec 2015 07:14:51 -0000
Content-Type: text/plain

The following changes since commit 224bcc2ead676600bcd9e290ed23d9b2ed2f481e:

  rpcbind: Security Advisory - rpcbind - CVE-2015-7236 (2015-12-08 00:18:12 -0800)

are available in the git repository at:

  git://git.openembedded.org/openembedded-core-contrib rbt/jethro-next
  http://cgit.openembedded.org/cgit.cgi/openembedded-core-contrib/log/?h=rbt/jethro-next

Andre McCurdy (2):
  directfb.inc: force bfd linker for armv7a
  cairo: fix license for cairo-script-interpreter

Fang Jia (1):
  toolchain-scripts.bbclass: unset command_not_found_handle

Jean-Francois Dagenais (1):
  toolchain-shar-relocate: don't assume last state of env_setup_script
    is good

Jens Rehsack (1):
  autotools: Allow recipe-individual configure scripts

Khem Raj (1):
  libxcb: Add a workaround for gcc5 bug on mips

Li Xin (1):
  glibc: Backported a patch to fix glibc's bug(18589)

Mark Hatle (4):
  populate_sdk_ext.bbclass: Be more permissive on the name of the
    buildtools
  prelink: Fix various prelink issues on IA32, ARM, and MIPS.
  gcc: Update default Power GCC settings to use secure-plt
  glibc: Fix ld.so / prelink interface for
    ELF_RTYPE_CLASS_EXTERN_PROTECTED_DATA

Martin Jansa (9):
  icu: force arm mode
  guile, mailx, gcc, opensp, gstreamer1.0-libav, libunwind: disable
    thumb where it fails for qemuarm
  libunwind: fix build for qemuarm
  gstreamer1.0-plugins-{base,good}: update PACKAGECONFIGs
  gstreamer1.0-plugins-bad: fix dependencies for uvch264 PACKAGECONFIG
  gstreamer1.0-plugins-good: fix PACKAGECONFIG for gudev and add one
    for v4l2 and libv4l2
  gst-plugins-bad: add PACKAGECONFIGs for voamrwbenc, voaacenc,
    resindvd
  package_manager.py: define info_dir and status_file when OPKGLIBDIR
    isn't the default
  texinfo: don't create dependency on INHERIT variable

Paul Eggleton (16):
  classes/distrodata: split SRC_URI properly before determining type
  oeqa/selftest/devtool: fix test if build directory is not inside
    COREBASE
  oeqa/selftest/layerappend: fix test if build directory is not inside
    COREBASE
  classes/metadata_scm: fix git errors showing up on non-git
    repositories
  classes/license: fix intermittent license collection warning
  classes/populate_sdk_ext: tidy up preparation log file writing
  classes/populate_sdk_ext: make it clear when SDK installation has
    failed
  classes/populate_sdk_ext: tweak reporting of workspace exclusion
  classes/populate_sdk_ext: fail if SDK_ARCH != BUILD_ARCH
  toolchain-shar-extract.sh: proper fix for additional env setup
    scripts
  scripts/gen-lockedsig-cache: improve output
  toolchain-shar-extract.sh: do not allow $ in paths for ext SDK
  devtool: upgrade: fix removing other recipes from workspace on reset
  devtool: upgrade: fix updating PV and SRCREV
  devtool: upgrade: remove erroneous error when not renaming recipe
  devtool: upgrade: fetch remote repository before checking out new
    revision

Randy Witt (1):
  uninative.bbclass: Choose the correct loader based on BUILD_ARCH

Ross Burton (2):
  libsdl2: require GLES when building Wayland support
  openssl: sanity check that the bignum module is present

Tzu-Jung Lee (1):
  devtool: include do_patch in SRCTREECOVEREDTASKS

 meta/classes/autotools.bbclass                     |   43 +--
 meta/classes/distrodata.bbclass                    |    4 +-
 meta/classes/license.bbclass                       |    1 +
 meta/classes/metadata_scm.bbclass                  |   20 +-
 meta/classes/populate_sdk_ext.bbclass              |   15 +-
 meta/classes/toolchain-scripts.bbclass             |    1 +
 meta/classes/uninative.bbclass                     |    2 +-
 meta/files/toolchain-shar-extract.sh               |   15 +-
 meta/lib/oe/copy_buildsystem.py                    |    5 +-
 meta/lib/oe/package_manager.py                     |   19 ++
 meta/lib/oeqa/selftest/devtool.py                  |    2 +-
 meta/lib/oeqa/selftest/layerappend.py              |    9 +-
 .../recipes-connectivity/openssl/openssl_1.0.2d.bb |   10 +
 ...TYPE_CLASS_EXTERN_PROTECTED_DATA-for-prel.patch |   84 +++++
 ...ove-incorrect-STRDIFF-based-optimization-.patch |  323 ++++++++++++++++++++
 meta/recipes-core/glibc/glibc_2.22.bb              |    2 +
 meta/recipes-devtools/gcc/gcc-common.inc           |    5 +
 meta/recipes-devtools/gcc/gcc-configure-common.inc |    1 +
 meta/recipes-devtools/gcc/gcc-cross-initial.inc    |    1 +
 meta/recipes-devtools/gcc/gcc_4.9.bb               |    5 +-
 meta/recipes-devtools/guile/guile_2.0.11.bb        |    4 +
 meta/recipes-devtools/opensp/opensp_1.5.2.bb       |    4 +
 meta/recipes-devtools/prelink/prelink_git.bb       |    4 +-
 meta/recipes-extended/mailx/mailx_12.5-5.bb        |    5 +
 meta/recipes-extended/texinfo/texinfo_6.0.bb       |    2 +-
 meta/recipes-graphics/cairo/cairo.inc              |    3 +
 meta/recipes-graphics/directfb/directfb.inc        |    3 +
 meta/recipes-graphics/libsdl2/libsdl2_2.0.3.bb     |    2 +-
 meta/recipes-graphics/xorg-lib/libxcb.inc          |    4 +-
 .../libxcb/gcc-mips-pr68302-mips-workaround.patch  |   22 ++
 .../gstreamer/gstreamer1.0-libav_1.4.5.bb          |    3 +
 .../gstreamer/gstreamer1.0-plugins-bad.inc         |   15 +-
 .../gstreamer/gstreamer1.0-plugins-base.inc        |    7 +-
 .../gstreamer/gstreamer1.0-plugins-good.inc        |   14 +-
 meta/recipes-support/icu/icu_55.1.bb               |    4 +
 ...Add-AO_REQUIRE_CAS-to-fix-build-on-ARM-v6.patch |   61 ++++
 meta/recipes-support/libunwind/libunwind_1.1.bb    |    5 +
 scripts/gen-lockedsig-cache                        |   13 +-
 scripts/lib/devtool/standard.py                    |    4 +-
 scripts/lib/devtool/upgrade.py                     |   36 ++-
 40 files changed, 686 insertions(+), 96 deletions(-)
 create mode 100644 meta/recipes-core/glibc/glibc/0028-Clear-ELF_RTYPE_CLASS_EXTERN_PROTECTED_DATA-for-prel.patch
 create mode 100644 meta/recipes-core/glibc/glibc/strcoll-Remove-incorrect-STRDIFF-based-optimization-.patch
 create mode 100644 meta/recipes-graphics/xorg-lib/libxcb/gcc-mips-pr68302-mips-workaround.patch
 create mode 100644 meta/recipes-support/libunwind/libunwind-1.1/Add-AO_REQUIRE_CAS-to-fix-build-on-ARM-v6.patch

-- 
1.7.9.5


