Return-Path: <joshua.lock@collabora.co.uk>
Received: from bhuna.collabora.co.uk (bhuna.collabora.co.uk [93.93.135.160])
	by mail.openembedded.org (Postfix) with ESMTP id A13457712D
	for <openembedded-core@lists.openembedded.org>;
	Thu, 22 Oct 2015 15:22:19 +0000 (UTC)
Received: from [127.0.0.1] (localhost [127.0.0.1])
	(Authenticated sender: joshuagl) with ESMTPSA id 0ABA160029B
From: Joshua Lock <joshua.lock@collabora.co.uk>
To: openembedded-core@lists.openembedded.org
Date: Thu, 22 Oct 2015 16:21:21 +0100
Message-Id: <cover.1445527096.git.joshua.lock@collabora.co.uk>
X-Mailer: git-send-email 2.1.4
Subject: [PATCH v3 00/52] Various metadata tweaks v3
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
X-List-Received-Date: Thu, 22 Oct 2015 15:22:20 -0000


The following series are some tidy ups and changes made whilst
porting a distro with systemd and a Weston + Xwayland userland to
Jethro.

Please consider them for inclusion.

Changes since v2:
* Backport weston patch to make enabling/disabling of systemd-login explicit
* Mention the change in default behaviour regarding systemds dbus-related tests

Regards,

Joshua

The following changes since commit 10e5df3503632a6e1c54612055b19f7258c3ae2f:

  lib/oe/image.py: Fix dependency handling for compressed types (2015-10-14 18:08:22 +0300)

are available in the git repository at:

  git://git.openembedded.org/openembedded-core-contrib joshuagl/cleanup
  http://cgit.openembedded.org/cgit.cgi/openembedded-core-contrib/log/?h=joshuagl/cleanup

Alejandro Hernandez (1):
  archiver.bbclass: Fixes and improves archiver class for kernel and gcc
    packages

Alex Franco (2):
  test-empty-image: rename from core-image-empty
  sanity.bbclass: expand warning when chmod fails

Benjamin Esquivel (2):
  populate SDK: prepare calling of bb.utils for exceptions
  oeqa/selftest/manifest.py: Test support for manifests

Chen Qi (2):
  openssh: fix file permission for /etc/pam.d/sshd
  sudo: fix file permission for /etc/pam.d/sudo

Chris Hallinan (1):
  image-live: make SYSLINUX_ROOT changable in image recipes

Daniel Istrate (2):
  oeqa/selftest/bbtests: Updated bitbake TCs
  oeqa/selftest/wic: corrected testcase decorator for test18_iso_image

Joe MacDonald (1):
  classes/base: provide hints on PACKAGECONFIG error

Joshua Lock (6):
  systemd: add PACKAGECONFIG to build with compatibility libraries
  weston: add PACKAGECONFIG to build with systemd-login support
  systemd: make dbus an optional build time dependency
  weston: add a PACKAGECONFIG option for xwayland support
  xserver-xorg: add Xwayland RRECOMMENDS
  xserver-xorg: drop empty ${PN}-security-policy package

Kai Kang (1):
  gcc-4.x: fix wrong warning when using the universal zero initializer
    {0}

Khem Raj (1):
  grub-efi, gummiboot: Emit correct path in startup.nsh

Leonardo Sandoval (3):
  oeqa/utils/ftools: Ignore the exception if file does not exist
  oeqa/utils/ftools: From functions that expect data, check if None
  oeqa/selftest/buildoptions: Use the correct script for cleaning the
    workdir

Mariano Lopez (2):
  oetest: Add tearDownLocal class
  oeqa/runtime: Fix setUp and tearDown methods

Mark Hatle (1):
  gcc-5.2: Fix various _FOR_BUILD and related variables

Matt Madison (1):
  i2c-tools: fix inverted RDEPENDS

Maxin B. John (1):
  toolchain-shar-extract.sh: provide proper path for env_setup_script

Paul Eggleton (11):
  common-licenses: use correct GFDL-1.1 license text
  build-compare: drop PATCHTOOL setting
  tzdata: reinstate changes reverted in 2014c upgrade
  devtool: extract: fix error handling
  scripts/gen-lockedsig-cache: fix race with temp file creation
  classes/populate_sdk_ext: consistent indentation
  classes/populate_sdk_ext: prevent image construction from executing on
    install
  classes/populate_sdk_ext: add note to env setup script
  classes/populate_sdk_ext: detect and warn if running in OE environment
  toolchain-shar-extract.sh: print full-length title underline
  devtool: handle virtual providers

Peter Kjellerstedt (1):
  useradd_base.bbclass: Do not warn without a reason

Richard Purdie (2):
  libc-package: Fix localedef multilib dependency issues
  build-appliance-image: Update to jethro head revision

Robert Yang (1):
  coreutils: fix for native and nativesdk

Ross Burton (10):
  linux-yocto-custom: fix typo in Upstream-Status tag
  metadata_scm: rewrite git hash logic
  rpm: remove spurious build dependencies
  qemu: disable Valgrind
  oeqa/selftest/bbtests: clean up local DL_DIR/SSTATE_DIR safely
  oeqa/selftest: verify that devtool can use plugins in other layers
  oeqa/selftest/wic: fix cleaning
  oeqa/selftest: clean up selftest.inc in teardown
  oeqa/selftest/wic: remove numbers from test names
  oeqa/selftest: improve config writing and cleanup

 meta-selftest/lib/devtool/__init__.py              |   0
 meta-selftest/lib/devtool/test.py                  |  11 ++
 .../{core-image-empty.bb => test-empty-image.bb}   |   1 -
 .../0001-linux-version-tweak.patch                 |   2 +-
 meta/classes/archiver.bbclass                      |  27 ++-
 meta/classes/base.bbclass                          |   3 +-
 meta/classes/grub-efi.bbclass                      |   3 +-
 meta/classes/gummiboot.bbclass                     |   3 +-
 meta/classes/image-live.bbclass                    |   2 +-
 meta/classes/libc-package.bbclass                  |   4 +-
 meta/classes/metadata_scm.bbclass                  |  23 +--
 meta/classes/populate_sdk_ext.bbclass              |  18 +-
 meta/classes/sanity.bbclass                        |   4 +-
 meta/classes/useradd_base.bbclass                  |   6 +-
 meta/files/common-licenses/GFDL-1.1                | 206 ++++++++-------------
 meta/files/ext-sdk-prepare.sh                      |  20 ++
 meta/files/toolchain-shar-extract.sh               |   7 +-
 meta/lib/oe/recipeutils.py                         |   6 +-
 meta/lib/oe/sdk.py                                 |  76 +++++---
 meta/lib/oeqa/oetest.py                            |   6 +
 meta/lib/oeqa/runtime/_ptest.py                    |   2 +-
 meta/lib/oeqa/runtime/date.py                      |   4 +-
 meta/lib/oeqa/runtime/kernelmodule.py              |   4 +-
 meta/lib/oeqa/runtime/scanelf.py                   |   2 +-
 meta/lib/oeqa/selftest/base.py                     |   2 +-
 meta/lib/oeqa/selftest/bbtests.py                  |  60 ++++--
 meta/lib/oeqa/selftest/buildoptions.py             |   8 +-
 meta/lib/oeqa/selftest/devtool.py                  |  44 +++++
 meta/lib/oeqa/selftest/imagefeatures.py            |  16 +-
 meta/lib/oeqa/selftest/manifest.py                 | 163 ++++++++++++++++
 meta/lib/oeqa/selftest/wic.py                      |  67 ++++---
 meta/lib/oeqa/utils/ftools.py                      |  20 +-
 meta/recipes-connectivity/openssh/openssh_7.1p1.bb |   2 +-
 meta/recipes-core/coreutils/coreutils_8.24.bb      |   2 +-
 .../images/build-appliance-image_12.0.1.bb         |   2 +-
 meta/recipes-core/systemd/systemd_225.bb           |   4 +-
 .../build-compare/build-compare_git.bb             |   1 -
 meta/recipes-devtools/gcc/gcc-4.8.inc              |   1 +
 ...-gcc-483-universal-initializer-no-warning.patch | 107 +++++++++++
 meta/recipes-devtools/gcc/gcc-4.9.inc              |   1 +
 ...-gcc-483-universal-initializer-no-warning.patch | 107 +++++++++++
 meta/recipes-devtools/gcc/gcc-5.2.inc              |   1 +
 .../gcc/gcc-5.2/0042-cxxflags-for-build.patch      | 123 ++++++++++++
 meta/recipes-devtools/i2c-tools/i2c-tools_3.1.2.bb |   3 +-
 meta/recipes-devtools/qemu/qemu/no-valgrind.patch  |  19 ++
 meta/recipes-devtools/qemu/qemu_2.4.0.bb           |   1 +
 meta/recipes-devtools/rpm/rpm_4.11.2.bb            |   2 +-
 meta/recipes-extended/sudo/sudo_1.8.14p3.bb        |   2 +-
 meta/recipes-extended/tzdata/tzdata_2015g.bb       |   5 +-
 .../weston/explicit-enable-disable-systemd.patch   |  70 +++++++
 .../wayland/weston/libsystemd.patch                |  53 ++++++
 meta/recipes-graphics/wayland/weston_1.8.0.bb      |   8 +-
 .../recipes-graphics/xorg-xserver/xserver-xorg.inc |   8 +-
 scripts/gen-lockedsig-cache                        |   4 +
 scripts/lib/devtool/standard.py                    |  32 +++-
 scripts/lib/devtool/upgrade.py                     |  12 +-
 56 files changed, 1101 insertions(+), 289 deletions(-)
 create mode 100644 meta-selftest/lib/devtool/__init__.py
 create mode 100644 meta-selftest/lib/devtool/test.py
 rename meta-selftest/recipes-test/images/{core-image-empty.bb => test-empty-image.bb} (86%)
 create mode 100644 meta/files/ext-sdk-prepare.sh
 create mode 100644 meta/lib/oeqa/selftest/manifest.py
 create mode 100644 meta/recipes-devtools/gcc/gcc-4.8/0051-gcc-483-universal-initializer-no-warning.patch
 create mode 100644 meta/recipes-devtools/gcc/gcc-4.9/0065-gcc-483-universal-initializer-no-warning.patch
 create mode 100644 meta/recipes-devtools/gcc/gcc-5.2/0042-cxxflags-for-build.patch
 create mode 100644 meta/recipes-devtools/qemu/qemu/no-valgrind.patch
 create mode 100644 meta/recipes-graphics/wayland/weston/explicit-enable-disable-systemd.patch
 create mode 100644 meta/recipes-graphics/wayland/weston/libsystemd.patch

-- 
2.1.4


