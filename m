Return-Path: <sgw@linux.intel.com>
Received: from mga09.intel.com (mga09.intel.com [134.134.136.24])
	by mail.openembedded.org (Postfix) with ESMTP id 162776B88D
	for <openembedded-core@lists.openembedded.org>;
	Thu, 22 Aug 2013 05:58:56 +0000 (UTC)
Received: from orsmga002.jf.intel.com ([10.7.209.21])
	by orsmga102.jf.intel.com with ESMTP; 21 Aug 2013 22:56:07 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="4.89,932,1367996400"; d="scan'208";a="391388006"
Received: from unknown (HELO swold-linux.bigsur.com) ([10.255.14.105])
	by orsmga002.jf.intel.com with ESMTP; 21 Aug 2013 22:58:55 -0700
From: Saul Wold <sgw@linux.intel.com>
To: richard.purdie@linuxfoundation.org, ross.burton@intel.com,
	paul.eggleton@linux.intel.com, openembedded-core@lists.openembedded.org
Date: Wed, 21 Aug 2013 22:58:55 -0700
Message-Id: <cover.1377150822.git.sgw@linux.intel.com>
X-Mailer: git-send-email 1.8.3.1
Subject: [CONSOLIDATED PULL 00/62] Python3, Packge Exlude and more (Initial ACK Please)!
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
X-List-Received-Date: Thu, 22 Aug 2013 05:58:57 -0000

Paul, Ross:

Please review this set.

It has a number of large changes that I want more EYES on!

Particularly, the python3 patch set, which I may remove before
this is final due to the world build issue.

There is also a few patches on poky from Beth and myself which
need a look at and ACK
The following changes since commit d98f08a7ad95d0b17846276b028a6614f16b6846:

  genext2fs: fix memory corruption on powerpc (2013-08-20 07:11:44 -0700)

are available in the git repository at:

  git://git.openembedded.org/openembedded-core-contrib sgw/stage
  http://cgit.openembedded.org/cgit.cgi/openembedded-core-contrib/log/?h=sgw/stage

Cristian Iorga (4):
  packagegroup-self-hosted: pcmanfm integration
  builder: register directories with pcmanfm
  build-appliance-image: changing the icon theme to sato
  default-providers: Set the preferred provider for bluez

Jonathan Liu (3):
  xf86-video-intel: remove duplicate xf86driproto from DEPENDS
  xf86-video-vesa: remove duplicate xf86driproto from DEPENDS
  mesa: enable additional drivers for gallium-llvm x86/x86-64

Kai Kang (3):
  bc: fix segmentation fault
  libx11: upgrade to 1.6.1
  libx11-diet: upgrade to 1.6.1

Khem Raj (27):
  generate-manifest-3.3.py: Add script to generate python 3.3 manifests
  python-3.3-manifest: Add python3 manifest file
  python3native.bbclass: Add python3 abstraction class
  package_rpm.bbclass:Make the regexp less greedy
  classes/distutils: Introduce PYTHON_PN
  classes: Add distutils for python3
  setuptools.bbclass: Use python-distribute instead of python-setuptools
  distutils3.bbclass: Port the distutils class fix to handle filenames
    with spaces
  setuptools3.bbclass: Remove useless multiline comment
  distutils: Introduce PYTHON_ABI variable
  distutils3: Do build_ext as separate step during compile
  python3: Add recipes
  python3: Add native recipe
  python_2.7.3.bb: Inherit python-dir
  python3-nose: Testing tools for python
  zeromq: Add recipe
  pyzmq: Add recipes using python3
  ipython: Add recipes for ipython2 and ipython3
  python-distribute: Add recipes for python2 and python3
  python3: Upgrade to 3.3.2
  distutils3.bbclass: Fix typo and use proper values for target sysroot
  python3, python3-native: Consider OE staging installation
  python3: Fix host include contamination issue
  distutils3.bbclass: Use MACHINE for sysroot when not building for
    build host
  python3: Fix the compiler invocation and linker flags when cross
    compiling
  python: Add Patch description and status information
  eglibc: Update SRC_URI and fix unpackaged empty dir

Lauren Post (2):
  directfb: Upgrade to 1.6.3
  directfb: add fusion patch for hangs on exit with

Mark Hatle (11):
  image.bbclass: Add basic support for PACKAGE_EXCLUDE
  python-smartpm: Add support for excluding package from the install
  package_rpm.bbclass:  Add support for PACKAGE_EXCLUDE to RPM installs
  python-smartpm: Add support to disable installing recommends
  package_rpm.bbclass: NO_RECOMMENDATIONS support
  package_deb.bbclass: Use the WORKDIR not SYSROOT for temp files
  package_deb: Add support for NO_RECOMMENDATIONS and PACKAGE_EXCLUDE
  opkg: Add --no-install-recommends option.
  package_ipk: Add support for NO_RECOMMENDATIONS
  opkg: Add support for excluding packages from the install
  package_ipk: Add support for PACKAGE_EXCLUDE

Marko Lindqvist (3):
  texinfo: correct dont-depend-on-help2man.patch
  SDL2: add recipe
  boost: fix build when PARALLEL_MAKE is not set

Otavio Salvador (1):
  distro_features_check.bbclass: Allow checking of required/conflicting
    features

Paul Eggleton (1):
  gst-plugins-good: fix orc enabling via PACKAGECONFIG

Roy.Li (1):
  shadow: backport a patch to make newgrp work

Saul Wold (4):
  Add Upstream-Status tags to patches
  libsdl: Backport xData32 patch for x11 update
  valgrind: Backport patch for eglibc 2.18
  gnupg: Update to 2.0.21

Tyler Hall (1):
  cpan-base: Don't use immediate expansion

Yevhen Kyriukha (1):
  connman: fix systemd support for connman-* packages.

 meta/classes/cpan-base.bbclass                     |   2 +-
 meta/classes/distro_features_check.bbclass         |  28 +
 meta/classes/distutils-base.bbclass                |   5 +-
 meta/classes/distutils-native-base.bbclass         |   4 +-
 meta/classes/distutils-tools.bbclass               |  77 +++
 meta/classes/distutils.bbclass                     |  23 +-
 meta/classes/distutils3-base.bbclass               |   8 +
 meta/classes/distutils3-native-base.bbclass        |   4 +
 meta/classes/distutils3.bbclass                    |  98 ++++
 meta/classes/image.bbclass                         |  39 +-
 meta/classes/package_deb.bbclass                   |  34 +-
 meta/classes/package_ipk.bbclass                   |   2 +
 meta/classes/package_rpm.bbclass                   |  10 +-
 meta/classes/python-dir.bbclass                    |   2 +
 meta/classes/python3native.bbclass                 |   7 +
 meta/classes/pythonnative.bbclass                  |   9 +-
 meta/classes/rootfs_deb.bbclass                    |   8 +-
 meta/classes/setuptools.bbclass                    |   3 +-
 meta/classes/setuptools3.bbclass                   |   8 +
 meta/conf/bitbake.conf                             |   1 +
 meta/conf/distro/include/default-providers.inc     |   1 +
 meta/conf/documentation.conf                       |   9 +
 meta/recipes-connectivity/connman/connman.inc      |   8 +
 .../eglibc/cross-localedef-native_2.18.bb          |   6 +-
 meta/recipes-core/eglibc/eglibc-package.inc        |   4 +
 meta/recipes-core/eglibc/eglibc_2.18.bb            |   6 +-
 .../packagegroups/packagegroup-self-hosted.bb      |   6 +-
 .../elfutils-0.155/elfutils-robustify.patch        |   5 +
 meta/recipes-devtools/opkg/opkg/add-exclude.patch  |  99 ++++
 .../opkg/opkg/no-install-recommends.patch          |  78 +++
 meta/recipes-devtools/opkg/opkg_svn.bb             |   5 +-
 .../ipython/001-completer-across-raw-types.patch   | 568 +++++++++++++++++++++
 .../ipython3/001-completer-across-raw-types.patch  | 568 +++++++++++++++++++++
 meta/recipes-devtools/python/ipython3_0.13.1.bb    |  71 +++
 meta/recipes-devtools/python/ipython_0.13.1.bb     |  48 ++
 .../python/python-3.3-manifest.inc                 | 260 ++++++++++
 .../python/python-distribute_0.6.32.bb             |  47 ++
 .../smart-config-ignore-all-recommends.patch       |  24 +
 .../smart-flag-exclude-packages.patch              |  70 +++
 .../python/python-smartpm_1.4.1.bb                 |   2 +
 .../python/python3-distribute_0.6.32.bb            |  47 ++
 .../python/python3-native_3.3.2.bb                 |  70 +++
 meta/recipes-devtools/python/python3-nose_1.2.1.bb |  34 ++
 .../0001-Fixed-just-zmq-detection.patch            |  58 +++
 .../python/python3-pyzmq_13.0.0.bb                 |  46 ++
 .../python/python3/000-cross-compile.patch         |  83 +++
 ...sue-13032-where-it-fails-with-UnicodeDeco.patch |  37 ++
 .../python3/020-dont-compile-python-files.patch    |  37 ++
 .../python/python3/03-fix-tkinter-detection.patch  |  42 ++
 .../python/python3/030-fixup-include-dirs.patch    |  33 ++
 .../python/python3/04-default-is-optimized.patch   |  58 +++
 .../python3/06-ctypes-libffi-fix-configure.patch   |  44 ++
 .../python3/070-dont-clean-ipkg-install.patch      |  36 ++
 .../python3/080-distutils-dont_adjust_files.patch  |  92 ++++
 .../python/python3/110-enable-zlib.patch           |  21 +
 ...2-distutils-prefix-is-inside-staging-area.patch |  78 +++
 .../python/python3/130-readline-setup.patch        |  55 ++
 .../python/python3/150-fix-setupterm.patch         |  17 +
 .../python3/avoid_warning_about_tkinter.patch      |  25 +
 meta/recipes-devtools/python/python3/cgi_py.patch  |  23 +
 .../python3/fix_for_using_different_libdir.patch   |  54 ++
 .../python3/host_include_contamination.patch       |  28 +
 .../python/python3/python-3.3-multilib.patch       | 336 ++++++++++++
 .../python/python3/remove_sqlite_rpath.patch       |  19 +
 .../python/python3/setuptweaks.patch               |  57 +++
 .../python/python3/shutil-follow-symlink-fix.patch |  17 +
 .../python/python3/sitecustomize.py                |  37 ++
 .../sys_platform_is_now_always_linux2.patch        |  29 ++
 .../python/python3/sysroot-include-headers.patch   |  35 ++
 .../python/python3/unixccompiler.patch             |  33 ++
 meta/recipes-devtools/python/python3_3.3.2.bb      | 205 ++++++++
 meta/recipes-devtools/python/python_2.7.3.bb       |   2 +-
 meta/recipes-devtools/python/zeromq_3.2.2.bb       |  24 +
 .../rpm/rpm/rpm-remove-sykcparse-decl.patch        |   5 +
 .../valgrind/valgrind-3.8.1/eglibc-2.18.patch      |  27 +
 meta/recipes-devtools/valgrind/valgrind_3.8.1.bb   |   1 +
 meta/recipes-extended/bc/bc_1.06.bb                |   3 +-
 .../bc/files/fix-segment-fault.patch               |  28 +
 .../grep/grep-2.5.1a/fix-for-texinfo-5.1.patch     |   5 +
 .../shadow/files/fix-etc-gshadow-reading.patch     |  36 ++
 meta/recipes-extended/shadow/shadow_4.1.4.3.bb     |   1 +
 .../texinfo-5.1/dont-depend-on-help2man.patch      |  43 +-
 .../builder/files/builder_hob_start.sh             |   9 +
 meta/recipes-graphics/directfb/directfb.inc        |   2 +-
 .../directfb/directfb/fusion.patch                 |  36 ++
 .../recipes-graphics/directfb/directfb/mesa9.patch |  29 --
 .../{directfb_1.6.1.bb => directfb_1.6.3.bb}       |   5 +-
 .../libsdl-1.2.15/libsdl-1.2.15-xdata32.patch      |  19 +
 meta/recipes-graphics/libsdl/libsdl_1.2.15.bb      |   3 +-
 meta/recipes-graphics/libsdl2/libsdl2_2.0.0.bb     |  56 ++
 meta/recipes-graphics/mesa/mesa.inc                |   4 +
 .../xorg-driver/xf86-video-intel_2.21.13.bb        |   2 +-
 .../xorg-driver/xf86-video-vesa_2.3.2.bb           |   2 +-
 .../{libx11-diet_1.5.0.bb => libx11-diet_1.6.1.bb} |   7 +-
 meta/recipes-graphics/xorg-lib/libx11.inc          |   3 +-
 .../xorg-lib/libx11/disable_tests.patch            |   9 +-
 .../xorg-lib/libx11/keysymdef_include.patch        |  42 --
 meta/recipes-graphics/xorg-lib/libx11_1.5.0.bb     |  13 -
 meta/recipes-graphics/xorg-lib/libx11_1.6.1.bb     |  10 +
 .../gstreamer/gst-plugins-good_0.10.31.bb          |   2 +-
 meta/recipes-support/boost/boost.inc               |   2 +
 .../gnupg/{gnupg_2.0.20.bb => gnupg_2.0.21.bb}     |   4 +-
 scripts/contrib/python/generate-manifest-3.3.py    | 376 ++++++++++++++
 103 files changed, 4688 insertions(+), 165 deletions(-)
 create mode 100644 meta/classes/distro_features_check.bbclass
 create mode 100644 meta/classes/distutils-tools.bbclass
 create mode 100644 meta/classes/distutils3-base.bbclass
 create mode 100644 meta/classes/distutils3-native-base.bbclass
 create mode 100644 meta/classes/distutils3.bbclass
 create mode 100644 meta/classes/python3native.bbclass
 create mode 100644 meta/classes/setuptools3.bbclass
 create mode 100644 meta/recipes-devtools/opkg/opkg/add-exclude.patch
 create mode 100644 meta/recipes-devtools/opkg/opkg/no-install-recommends.patch
 create mode 100644 meta/recipes-devtools/python/ipython/001-completer-across-raw-types.patch
 create mode 100644 meta/recipes-devtools/python/ipython3/001-completer-across-raw-types.patch
 create mode 100644 meta/recipes-devtools/python/ipython3_0.13.1.bb
 create mode 100644 meta/recipes-devtools/python/ipython_0.13.1.bb
 create mode 100644 meta/recipes-devtools/python/python-3.3-manifest.inc
 create mode 100644 meta/recipes-devtools/python/python-distribute_0.6.32.bb
 create mode 100644 meta/recipes-devtools/python/python-smartpm/smart-config-ignore-all-recommends.patch
 create mode 100644 meta/recipes-devtools/python/python-smartpm/smart-flag-exclude-packages.patch
 create mode 100644 meta/recipes-devtools/python/python3-distribute_0.6.32.bb
 create mode 100644 meta/recipes-devtools/python/python3-native_3.3.2.bb
 create mode 100644 meta/recipes-devtools/python/python3-nose_1.2.1.bb
 create mode 100644 meta/recipes-devtools/python/python3-pyzmq/0001-Fixed-just-zmq-detection.patch
 create mode 100644 meta/recipes-devtools/python/python3-pyzmq_13.0.0.bb
 create mode 100644 meta/recipes-devtools/python/python3/000-cross-compile.patch
 create mode 100644 meta/recipes-devtools/python/python3/0001-h2py-Fix-issue-13032-where-it-fails-with-UnicodeDeco.patch
 create mode 100644 meta/recipes-devtools/python/python3/020-dont-compile-python-files.patch
 create mode 100644 meta/recipes-devtools/python/python3/03-fix-tkinter-detection.patch
 create mode 100644 meta/recipes-devtools/python/python3/030-fixup-include-dirs.patch
 create mode 100644 meta/recipes-devtools/python/python3/04-default-is-optimized.patch
 create mode 100644 meta/recipes-devtools/python/python3/06-ctypes-libffi-fix-configure.patch
 create mode 100644 meta/recipes-devtools/python/python3/070-dont-clean-ipkg-install.patch
 create mode 100644 meta/recipes-devtools/python/python3/080-distutils-dont_adjust_files.patch
 create mode 100644 meta/recipes-devtools/python/python3/110-enable-zlib.patch
 create mode 100644 meta/recipes-devtools/python/python3/12-distutils-prefix-is-inside-staging-area.patch
 create mode 100644 meta/recipes-devtools/python/python3/130-readline-setup.patch
 create mode 100644 meta/recipes-devtools/python/python3/150-fix-setupterm.patch
 create mode 100644 meta/recipes-devtools/python/python3/avoid_warning_about_tkinter.patch
 create mode 100644 meta/recipes-devtools/python/python3/cgi_py.patch
 create mode 100644 meta/recipes-devtools/python/python3/fix_for_using_different_libdir.patch
 create mode 100644 meta/recipes-devtools/python/python3/host_include_contamination.patch
 create mode 100644 meta/recipes-devtools/python/python3/python-3.3-multilib.patch
 create mode 100644 meta/recipes-devtools/python/python3/remove_sqlite_rpath.patch
 create mode 100644 meta/recipes-devtools/python/python3/setuptweaks.patch
 create mode 100644 meta/recipes-devtools/python/python3/shutil-follow-symlink-fix.patch
 create mode 100644 meta/recipes-devtools/python/python3/sitecustomize.py
 create mode 100644 meta/recipes-devtools/python/python3/sys_platform_is_now_always_linux2.patch
 create mode 100644 meta/recipes-devtools/python/python3/sysroot-include-headers.patch
 create mode 100644 meta/recipes-devtools/python/python3/unixccompiler.patch
 create mode 100644 meta/recipes-devtools/python/python3_3.3.2.bb
 create mode 100644 meta/recipes-devtools/python/zeromq_3.2.2.bb
 create mode 100644 meta/recipes-devtools/valgrind/valgrind-3.8.1/eglibc-2.18.patch
 create mode 100644 meta/recipes-extended/bc/files/fix-segment-fault.patch
 create mode 100644 meta/recipes-extended/shadow/files/fix-etc-gshadow-reading.patch
 create mode 100755 meta/recipes-graphics/directfb/directfb/fusion.patch
 delete mode 100644 meta/recipes-graphics/directfb/directfb/mesa9.patch
 rename meta/recipes-graphics/directfb/{directfb_1.6.1.bb => directfb_1.6.3.bb} (76%)
 mode change 100644 => 100755
 create mode 100644 meta/recipes-graphics/libsdl/libsdl-1.2.15/libsdl-1.2.15-xdata32.patch
 create mode 100644 meta/recipes-graphics/libsdl2/libsdl2_2.0.0.bb
 rename meta/recipes-graphics/xorg-lib/{libx11-diet_1.5.0.bb => libx11-diet_1.6.1.bb} (65%)
 delete mode 100644 meta/recipes-graphics/xorg-lib/libx11/keysymdef_include.patch
 delete mode 100644 meta/recipes-graphics/xorg-lib/libx11_1.5.0.bb
 create mode 100644 meta/recipes-graphics/xorg-lib/libx11_1.6.1.bb
 rename meta/recipes-support/gnupg/{gnupg_2.0.20.bb => gnupg_2.0.21.bb} (85%)
 create mode 100755 scripts/contrib/python/generate-manifest-3.3.py

-- 
1.8.3.1


