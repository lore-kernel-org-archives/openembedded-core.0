Return-Path: <costin.c.constantin@intel.com>
Received: from mga11.intel.com (mga11.intel.com [192.55.52.93])
	by mail.openembedded.org (Postfix) with ESMTP id 5B9BD73198
	for <openembedded-core@lists.openembedded.org>;
	Fri, 18 Dec 2015 12:10:00 +0000 (UTC)
Received: from orsmga002.jf.intel.com ([10.7.209.21])
	by fmsmga102.fm.intel.com with ESMTP; 18 Dec 2015 04:10:00 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.20,446,1444719600"; d="scan'208";a="874223279"
Received: from linux.intel.com ([10.23.219.25])
	by orsmga002.jf.intel.com with ESMTP; 18 Dec 2015 04:10:01 -0800
Received: from localhost.localdomain (unknown [10.237.112.252])
	by linux.intel.com (Postfix) with ESMTP id 5DA506A4007;
	Fri, 18 Dec 2015 04:58:00 -0800 (PST)
From: Costin Constantin <costin.c.constantin@intel.com>
To: openembedded-core@lists.openembedded.org
Date: Fri, 18 Dec 2015 14:22:30 +0200
Message-Id: <cover.1450434192.git.costin.c.constantin@intel.com>
X-Mailer: git-send-email 2.5.0
MIME-Version: 1.0
Subject: [PATCH 000/502] Include binaries in test cases and update runexported.py
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
X-List-Received-Date: Fri, 18 Dec 2015 12:10:02 -0000
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit

The set of patches addresses Yocto binararies inclusion related features and
updates to the runexported.py test launcher script for machines where poky
environment is not available.
As a result runtime test cases can be written to include native and target
specific binaries, both packed as .rpm files or pre-unpacked for the situation
where the remote target has no package manager. runexported.py includes new
functionality.

For all the above, enhancements are described in:
[YOCTO #7850], [YOCTO #8478], [YOCTO #8479], [YOCTO #8481], [YOCTO #8530]
[YOCTO #8534], [YOCTO #8535], [YOCTO #8536]


The following changes since commit 1b25a70991589ed1f123015c16ee4806c46e3199:

  yocto-project-qs, ref-manual, poky.ent: CentOS Package updates (2015-11-18 16:42:22 +0000)

are available in the git repository at:

  git://git.yoctoproject.org/poky-contrib ciorga/CI2-YOCTO7850
  http://git.yoctoproject.org/cgit.cgi/poky-contrib/log/?h=ciorga/CI2-YOCTO7850

Alejandro Hernandez (4):
  archiver.bbclass: fix previous issue regarding work-shared for
    linux-yocto
  gma500_gfx: Avoid inserting gma500_gfx module for certain devices
  python3: Upgrade from 3.4.3 to 3.5
  python3: fix building nativesdk-python3

Alejandro del Castillo (2):
  opkg: add cache filename length fixes
  libsolv: add new recipe

Alexander Kanavin (38):
  bitbake: wget.py: parse only <a> tags
  bitbake: bitbake: rename REGEX, REGEX_URI, and GITTAGREGEX.
  package_regex.inc: deprecate the file
  package_regex.inc: split entries with odd-even versioning into their
    own recipes
  package_regex.inc: split GITTAGREGEX entries into recipe files
  package_regex.inc: split Debian-related entries into their own recipes
  package_regex.inc: split PyPi related entries to their own recipes
  package_regex.inc: split sourceforge related entries to their own
    recipes
  package_regex.inc: split entries which blacklist specific versions to
    their recipes
  package_regex.inc: split the rest of the entries to their recipes
  weston-init: add a native systemd unit file
  openssl: update to 1.0.2e
  python-setuptools: update to 18.7.1
  nspr: update to 4.11
  mobile-broadband-provider-info: update to current commit
  mirrors: replace references to archive.apache.org
  json-c: add manual upstream version check
  subversion: update to 1.9.2
  slang: update upstream URI to (official) jedsoft.org
  libidn: add native and nativesdk support
  gnutls: update to 3.4.7
  puzzles: update to current commit
  cpio: update to 2.12
  dmidecode: update to 3.0
  libxml-simple-perl: update to 2.22
  python-numpy: update to 1.10.1
  unfs3: update to r497
  mtd-utils: update to 1.5.2
  docbook-xsl-stylesheets: fix UPSTREAM_CHECK_REGEX
  gmp: update to 6.1.0
  kbd: update to 2.0.3
  systemtap: update to 2.9
  nfs-utils: update to 1.3.3
  powertop: update to 2.8
  babeltrace: update to 1.3.1
  procps: update to 3.3.11
  grep: update to 2.22
  cdrtools-native: update to 3.01 final

Andre McCurdy (26):
  boost.inc: remove unused parameter from get_boost_parallel_make()
  directfb.inc: force bfd linker for armv7a
  libxml2: remove legacy LDFLAGS += "-ldl" workaround
  sqlite3: update 3.9.0 -> 3.9.2
  harfbuzz: update 1.0.6 -> 1.1.0
  busybox_git: Enable getopt applet
  busybox.inc: don't export EXTRA_OEMAKE
  busybox: move EXTRA_OEMAKE etc into busybox.inc
  busybox.inc: don't set .config CROSS_COMPILER_PREFIX
  busybox.inc: fix CONFIG_EXTRA_CFLAGS configmangle
  busybox.inc: set CC=${CC} via make command line
  busybox.inc: remove '-e MAKEFLAGS=' from EXTRA_OEMAKE
  busybox: re-order defconfig to align with busybox 1.24.1
  busybox: update 1.23.2 -> 1.24.1
  busybox: disable support for mounting NFS file systems on Linux <
    2.6.23
  busybox: enable resize applet
  waf.bbclass: remove unused parameter from get_waf_parallel_make()
  harfbuzz: update 1.1.0 -> 1.1.2
  busybox: backport upstream fixes for unzip
  libpng: update 1.6.19 -> 1.6.20 (CVE-2015-8126)
  kernel.bbclass: drop unnecessary 'eval' from kernel_do_configure()
  linux-libc-headers.inc: remove '-e MAKEFLAGS=' from EXTRA_OEMAKE
  linux-libc-headers: update default KORG_ARCHIVE_COMPRESSION bz2 -> xz
  dropbear: update 2015.70 -> 2015.71
  dropbear.inc: drop legacy CFLAGS and LD tweaks
  valgrind: import Debian link_tool patch for MIPS

Andrew Shadura (1):
  dbus: merge .bb and .inc

Armin Kuster (2):
  libxml2: fix CVE-2015-7942 and CVE-2015-8035
  linux-firmware: update to latest revision bbe4917

Belen Barros Pena (1):
  bitbake: toaster: tables Set a default order for the software recipes
    table

Benjamin Esquivel (2):
  oeqa/systemd: journalctl helper function
  oeqa/systemd: get runtest target boot time and log

Beth Flanagan (1):
  poky.conf: Bump for 2.1 development

Bhuvanchandra DV (1):
  linux-firmware: rtl8192cx: Add latest available firmware

Bob Ham (1):
  systemd.bbclass: Allow enabling of parameterised services

Bogdan-Alexandru Voiculescu (1):
  uClibc: enable utmp for shadow compatibility

Bruce Ashfield (5):
  linux-yocto/4.1: update to v4.1.13
  linux-yocto/4.1: fsl-mpc8315e-rdb: Enable EEPROM
  linux-yocto-rt/4.1: update to -rt15
  linux-yocto/4.1: Bluetooth:Fix the connection fail of 6lowpan over BT
    LE
  linux-yocto/4.1: Fix kernel oops on qemuarm boot

Chen Qi (2):
  mktemp: raise the priority to avoid conflicting with coreutils
  cpio: fix test case of symlink-bad-length

Christopher Larson (15):
  image_types: improve wks path specification
  qemu.bbclass: correct the fsl ppc QEMU_EXTRAOPTIONS
  qemu.bbclass: fix vardeps of QEMU_OPTIONS
  recipetool.append: don't choke on a trailing ; in a url
  systemd: for valgrind, define VALGRIND=1
  systemd: chown hwdb.bin to root:root for do_rootfs
  systemd: drop unneeded $D check in prerm
  sysprof: use packageconfig for the gui
  bluez5: enable sysvinit support
  blkspace: fix ldflags for iowatcher
  tcf-agent: obey LDFLAGS
  latencytop: obey LDFLAGS
  connman: depend on readline
  sysklogd: inhibit updatercd for non-sysvinit
  openjade-native: statically link local libs

Costin Constantin (4):
  oeqa/utils/testexport.py: add functionality for exporting binaries
  classes/testimage.bbclass: add support for binaries export
  utils/decorators.py: add TestNeedsBin() decorator
  buildtools-with-tc.bb: extend buildtools-tarball to include test cases

Cristian Iorga (1):
  bluez5: upgrade to 5.36

Dan McGregor (2):
  systemd: ignore .so filenames in systemd-doc
  systemd: add machine-id to conffiles

Daniel Istrate (4):
  oeqa/selftest/signing: New test for Signing packages in the package
    feeds.
  oeqa/selftest/signing: Added new test for signing sstate.
  scripts: oe-selftest Added new features.
  oeqa/selftest: Added testcase decorators for 2 testcases

Daniel McGregor (1):
  systemd: make coredump a PACKAGECONFIG

Dariusz Pelowski (1):
  lib/oe/terminal: use C locale when determining version

Dmitry Eremin-Solenikov (2):
  gcc-5.2: import patch fixing compilation in thumb mode
  gcc-4.9: import patch fixing compilation in thumb mode

Ed Bartosh (40):
  wic: exec_native_cmd: implement support for pseudo
  bitbake: toaster: don't allow to run toaster as a script
  bitbake: toaster: implement get-dburl command
  bitbake: toaster: set DATABASE_URL in toaster script
  bitbake: toaster: run bitbake the same way
  bitbake: toaster: remove unused variable
  bitbake: toaster: check for toaster configuration later
  bitbake: toaster: use parent of the build dir
  bitbake: toaster: make runbuilds to loop
  bitbake: toaster: start 'manage.py runbuilds' in the script
  bitbake: toaster: update brbe and project attributes
  bitbake: toaster: implement stop_bitbake function
  bitbake: toaster: implement start_bitbake function
  bitbake: toaster: implement 'toaster restart-bitbake'
  bitbake: toaster: remove _setupBE function
  bitbake: toaster: reimplemented startBBServer method
  bitbake: toaster: remove stopBBServer API
  bitbake: toaster: do not terminate bb server
  bitbake: toaster: remove usage of BUILD_MODE variable
  bitbake: toaster: do not create duplicate HelpText objects
  bitbake: toaster: implement BitbakeController.getVariable
  bitbake: toaster: set varibales on bitbake server
  bitbake: toaster: remove writeConfFile API
  bitbake: toaster: stop using toaster-pre.conf
  bitbake: toaster: remove SDKMACHINE from project variables
  bitbake: toaster: get rid of complicated heuristics
  bitbake: toaster: unset environment variables
  bitbake: toaster: return back 'New project' button
  bitbake: toaster: implement BitbakeController.triggerEvent
  bitbake: toaster: trigger SetBRBE event
  bitbake: toasterui: process SetBRBE event
  bitbake: toaster: Remove South migrations
  bitbake: toaster: Fix references to app paths
  bitbake: toaster: rename get_query_set -> get_queryset
  bitbake: toaster: use OneToOneField instead of ForeignKey
  bitbake: toaster: fixed format strings
  bitbake: toaster: work around 'database is locked' error
  bitbake: toaster: removed extra calls of migrate
  bitbake: toaster: monkey patch Queryset
  bitbake: toaster: rework checking of Django version

Elliot Smith (9):
  bitbake: toaster: Upgrade to Django 1.8.6 and remove South
  bitbake: toaster: Create default project with get_or_create* method
  bitbake: toaster: Start Django machinery for database access
  bitbake: toaster: Update API used to make runbuilds methods run in
    transactions
  bitbake: toaster: Prevent deprecation warnings for RedirectView
  bitbake: toaster: Update deprecated manage.py command
  bitbake: toaster: Check Django version against
    toaster-requirements.txt
  bitbake: toaster: Remove compatible_layerversions() method
  bitbake: toaster: Amend regex for MySQL database URLs

Enrico Scholz (1):
  waf.bbclass: filter out non -j from PARALLEL_MAKE

Fabrice Coulon (1):
  gstreamer1.0: Convert tests and valgrind config opts to PACKAGECONFIGs

Fan Xin (6):
  wpa-supplicant: upgrade to 2.5
  libpcre: upgrade to 8.38
  sudo: upgrade to 1.8.15
  wget: Upgrade 1.16.3 -> 1.17
  curl: upgrade to 7.45
  ltp: Upgrade 20150420 -> 20150903

Fang Jia (1):
  toolchain-scripts.bbclass: unset command_not_found_handle

George Nita (1):
  toolchain-shar-extract.sh: Ensure it's ran in clean environment

Haris Okanovic (2):
  populate_sdk_base: Add sysroot symlink check
  sdk.py / OpkgSdk: remove_packaging_data() after install

Hongxu Jia (4):
  perl: fix spaces in brackets while using CC version
  flex: fix test-bison-yylval and test-bison-yylloc failed
  logrotate: do not move binary logrotate to /usr/bin
  bash: fix testcase run-coproc/run-execscript/run-test/run-heredoc
    failed

Ioan-Adrian Ratiu (1):
  base-files: stage /etc/skel

Jackie Huang (1):
  python: Fix cross compiling issue

Jean-Francois Dagenais (1):
  toolchain-shar-relocate: don't assume last state of env_setup_script
    is good

Jens Rehsack (3):
  kernel: fix race condition between compile_kernelmodules and
    shared_workdir
  autotools: Allow recipe-individual configure scripts
  libusb1: upgrade from 1.0.19 to 1.0.20

Jian Liu (2):
  archiver.bbclass: add bbappend when do_ar_recipe kernel and gcc
    packages
  insane.bbclass: Avoid libdir QA check if
    PACKAGE_DEBUG_SPLIT_STYLE='debug-file-directory'

Joe Slater (2):
  libsecret: add dependency on intltool-native
  ghostscript: add dependency for pnglibconf.h

Joshua Lock (1):
  cracklib: fix for base_libdir == libdir

Juro Bystricky (5):
  gcc-4.9: Fix various _FOR_BUILD and related variables
  psplash: update to latest git version
  oe-buildenv-internal: preserve existing BB_ENV_EXTRAWHITE
  insane: in libdir test allow libraries in libexecdir
  buildtools-tarball.bb: 32bit tools need pseudo 32bit library

Jussi Kukkonen (42):
  qemu: Backport malloc-trace disabling
  glib-2.0: Upgrade 2.44.1 -> 2.46.1
  glib-2.0: Enable more tests while cross-compiling
  glib-networking: Upgrade 2.44.0 -> 2.46.1
  atk: Upgrade 2.16.0 -> 2.18.0
  atk-spi2-core: Upgrade 2.16.0 -> 2.18.1
  at-spi2-atk: Upgrade 2.16.0 -> 2.18.1
  libsoup-2.4: Upgrade 2.50.0 -> 2.52.1
  gdk-pixbuf: Upgrade 2.30.8 -> 2.32.1
  pango: Upgrade 1.36.8 -> 1.38.1
  librsvg: Upgrade 2.40.10 -> 2.40.11
  adwaita-icon-theme: Upgrade 3.16.2.1 -> 3.18.0
  gtk+3: Upgrade 3.16.6 -> 3.18.2
  package_regex.inc: Add gtk-icon-utils-native
  gtk-icon-utils-native: Upgrade 3.16.6 -> 3.18.2
  libxi: Upgrade 1.7.4 -> 1.7.5
  pixman: Upgrade 0.32.6 -> 0.32.8
  libxcb: Upgrade 1.11 -> 1.11.1
  libxcb: Remove unused git-version of the recipe
  xserver-xorg: Upgrade 1.17.2 -> 1.18.0
  xorg-driver-input: add xorg configuration to FILES
  xf86-input-evdev: Upgrade 2.9.2 -> 2.10.0
  xf86-input-synaptics: Upgrade 1.8.2 -> 1.8.3
  xf86-video-omap: Upgrade 0.4.3 -> 0.4.4
  xinput: Upgrade 1.6.1 -> 1.6.2
  xkbcomp: Upgrade 1.3.0 -> 1.3.1
  xkeyboard-config: Upgrade 2.15 -> 2.16
  packagegroup-core-directfb: Don't depend on pango-modules
  mesa: Make gl libraries RRECOMMEND mesa-megadriver
  pulseaudio: Fix HDMI profile selection
  gcr: Require x11 DISTRO_FEATURE
  gudev: Add from meta-oe
  cogl-1.0: Upgrade 1.20.0 -> 1.22.0
  clutter-1.0: Upgrade 1.24.2
  clutter-gst-3.0: Upgrade 3.0.8 -> 3.0.14
  clutter-gtk-1.0: Upgrade 1.6.2 -> 1.6.6
  gnome-common: Upgrade 3.14.0 -> 3.18.0
  gsettings-desktop-schemas: Upgrade 2.16.1 -> 3.18.1
  xdg-utils: Upgrade to 1.1.1
  shared-mime-info: Upgrade 1.4 -> 1.5
  libcroco: Upgrade 0.6.8 -> 0.6.9
  dropbear: Upgrade 2015.68 -> 2015.70

Khem Raj (20):
  runqemu-internal: Replace wacom-tablet with tablet for usbdevice
  ruby-native: Depend on openssl-native
  gcc: Add support for building musl configuration
  autoconf: Add musl support
  gdb: Fix build with musl
  mtd-utils: Backport and create patches to support musl
  squashfs-tools: Define FNM_EXTMATCH if not defined
  mtools: Use proper glibc override to add glibc packages to
    recommendations
  musl: Add recipe
  sysvinit: Fix build with musl
  gettext: Delete libintl.h and charset.alias
  busybox: Add config for musl
  openssl: Add musl configuration support
  libpam: Fix build with musl
  attr: Add patch to account for use of internal glibc header
  packagegroup-core-sdk: Disable sanitizers for uclibc
  util-linux: Upgrade to 2.27.1
  musl: Update to latest 1.1.12 release
  uclibc: Switch to using uclibc-ng
  systemd: Upgrade to 228

Leonardo Sandoval (7):
  yocto-bsp: Avoid duplication of user patches
    ({{=machine}}-user-patches.scc)
  yocto-bsp: Typo on the file extension
  yocto-bsp: Set KTYPE to user selected base branch
  yocto-bsp: Set SRCREV meta/machine revisions to AUTOREV
  terminal: Open a new window instead of split on older tmux versions
    (<1.9)
  oe-selftest: Enable code coverage on unit tests
  lib/oe/package_manager: Introducing
    PACKAGE_FEED_BASE_PATHS/PACKAGE_FEED_ARCHS

Li Wang (1):
  rpcbind: don't use '-w' for starting rpcbind

Li Xin (1):
  glibc: Backported a patch to fix glibc's bug(18589)

Li Zhou (1):
  rpcbind: Security Advisory - rpcbind - CVE-2015-7236

Lucian Musat (8):
  oeqa/runexported: Add option to run arbitrary tests.
  oeqa/runexported: Fix a problem with ssh_target_log symlink.
  oeqa/testimage: Added support for folder names in TEST_SUITES.
  oeqa/runexported: Added support for folder names in TEST_SUITES.
  oeqa/runexported: The runner supports tests from other layers.
  oeqa/runexported: Add parameter support for machine arch.
  oeqa/testimage: Added export features.
  oeqa/runtime: Copy all __init__.py files from all layers.

Lukas Bulwahn (1):
  boost: adjust hard-coded path after python3 upgrade

Marek Vasut (3):
  ghostscript: Add NIOS2 support
  libbsd: Upgrade to 0.8.0
  cmake: Add nios2 support

Mariano Lopez (15):
  rootfs.py: Stop using installed_pkgs.txt
  package_manager.py: Delete installed_pkgs.txt file
  license.bbclass: Write recipeinfo file in license folder
  license.bbclass: Split license create manifest
  license.bbclass: Added get_boot_dependencies function
  license.bbclass: Added function get_deployed_dependencies
  license.bbclass: Add function get_deployed_files
  license.bbclass: Create image license manifest
  wic: Prepare wicboot to allow custom bootloader config
  wic/utils/misc.py: Added function to search for files in canned-wks
  wic: Allow to use a custom config for bootloaders
  wic/help.py: Document the new option "configfile"
  directdisk-bootloader-config.wks: Add example for custom bootloader
    config
  selftest/wic.py: Add test for custom bootloader config
  rootfs.py: Change logic to unistall packages

Mark Hatle (2):
  populate_sdk_ext.bbclass: Be more permissive on the name of the
    buildtools
  rpm: Enable MIPS64 N32 transactions

Markus Lehtonen (2):
  devtool: extract: copy kernel config to srctree
  devtool: extract: update SRCTREECOVEREDTASKS for kernel

Martin Jansa (13):
  rootfs_*.bbclass: don't add BUILDNAME to do_rootfs vardepsexclude
  libunwind: fix build for qemuarm
  package_manager.py: define info_dir and status_file when OPKGLIBDIR
    isn't the default
  meta/conf/machine: use ' inside quoted values
  icu: force arm mode
  guile, mailx, gcc, opensp, gstreamer1.0-libav, libunwind: disable
    thumb where it fails for qemuarm
  gstreamer1.0-plugins-base: add PACKAGECONFIG for libvisual
  gst-plugins-bad: improve FILES variables
  gstreamer1.0-plugins-bad: fix dependencies for uvch264 PACKAGECONFIG
  gstreamer1.0-plugins-good: fix PACKAGECONFIG for gudev and add one for
    v4l2 and libv4l2
  texinfo: don't create dependency on INHERIT variable
  sstate-sysroot-cruft: Add php, python, lua, fontcache generated files
    to whitelist
  clutter-gst-3.0: add dependency on libgudev

Matt Madison (1):
  wic: insert local Python paths at front

Maxin B. John (26):
  bbclass: fix spelling mistakes
  distro/maintainers.inc: include stress package details
  rt-tests: upgrade to version 0.96
  python-pycurl: update version to 7.19.5.2
  libsndfile: fix CVE-2014-9756
  ethtool: bump version to 4.2
  harfbuzz: update to 1.0.6
  wireless-tools: remove unused files
  mc: upgrade to 4.8.15
  iproute2: update to 4.3.0
  apr-util: add missing RDEPENDS for ptest
  libpcap: update to 1.7.4
  orc: update to 0.4.24
  libpng: update to 1.6.19
  libpng12: update to 1.2.54
  libtasn1: upgrade to 4.7
  libunistring: upgrade to version 0.9.6
  ofono: upgrade to version 1.17
  pkgconfig: upgrade to version 0.29
  ncurses: update SRC_URI
  iw: upgrade to version 4.3
  xvideo-tests: move to the latest release
  libxslt: use proper SRC_URI
  libical: Upgrade 1.0.0 -> 1.0.1
  libpng12: Upgrade 1.2.54 -> 1.2.55
  libpng: Update SRC_URI to use GENTOO_MIRROR

Michael Wood (8):
  bitbake: toaster: projectpage Make sure build targets are space
    separated
  bitbake: toaster: tablejs Make sure click handlers consume click event
  bitbake: toaster: machines table Fix missing layers information needed
    for filter
  bitbake: toaster: CustomImageRecipe add search_allowed_fields to this
    model
  bitbake: toaster: tables Add default_orderby field where it was
    missing or unset
  bitbake: toaster: tables Fix invalid field name on
    NewCustomImagesTable
  bitbake: toaster: toastergui tests Add generic test for ToasterTables
    widget
  bitbake: toaster: buildinfohelper Broaden the toaster created recipe
    data case

Mihail Stanciu (2):
  bitbake: toaster: tests Automated build-mode backend tests
  bitbake: toaster: tests Update UI tests to work with 2.0 changes

Mike Crowe (8):
  allarch: Force TARGET_*FLAGS variable values
  image.py: Avoid creating empty .env file in _write_wic_env
  image.py: avoid mkdir race when building multiple images
  libav: Remove deprecated --disable-avserver
  libav: Add PACKAGECONFIG options: avdevice, avfilter, avplay, gpl
  libav: Correctly handle prefix=""
  icu: Upgrade 55.1 -> 56.1
  gstreamer1.0: Split bash completion information into separate package

Ming Liu (1):
  initscripts: hide the error in case system is not writeable

Nathan Lynch (1):
  lttng-tools: add libgcc to RDEPENDS

Ng, Mei Yeen (2):
  init-install-efi: fix script for gummiboot loader
  init-install-efi: fix script for eMMC installation

Otavio Salvador (8):
  u-boot: Update to 2015.10 release
  weston: Add PACKAGECONFIG option for colord CMS
  lttng-modules: Upgrade to 2.7 release
  lttng-ust: Upgrade to 2.7 release
  lttng-tools: Drop unused patch
  lttng-tools: Upgrade to 2.7 release
  xf86-video-vmware: Add vmwgfx PACKAGECONFIG option
  lttng-tools: Revert wrong enforcement of Python 3.0 use

Patrick Ohly (1):
  buildhistory.bbclass: support extending the content of the build
    history

Paul Eggleton (33):
  classes/metadata_scm: fix git errors showing up on non-git
    repositories
  classes/license: fix intermittent license collection warning
  classes/populate_sdk_ext: tidy up preparation log file writing
  classes/populate_sdk_ext: make it clear when SDK installation has
    failed
  classes/populate_sdk_ext: tweak reporting of workspace exclusion
  classes/populate_sdk_ext: fail if SDK_ARCH != BUILD_ARCH
  scripts/gen-lockedsig-cache: improve output
  toolchain-shar-extract.sh: do not allow $ in paths for ext SDK
  devtool: upgrade: fix removing other recipes from workspace on reset
  devtool: upgrade: fix updating PV and SRCREV
  devtool: upgrade: remove erroneous error when not renaming recipe
  devtool: upgrade: fetch remote repository before checking out new
    revision
  devtool: upgrade: provide a means to update the source branch
  lib/oe/patch: improve extraction of patch header
  devtool: disable creating workspace for extract and search subcommands
  devtool: package: use DEPLOY_DIR_<pkgtype> to get deploy directory
  devtool: drop unused plugin_init() functions
  devtool: search: print SUMMARY value
  devtool: ensure we change back to the original dir on error
  lib/oe/recipeutils: check in validate_pn() for names instead of
    filenames
  devtool: build: use bbappend to set PARALLEL_MAKE
  devtool: build: enable showing default task in help
  devtool: clarify help text
  lib/oe/recipeutils: refactor patch_recipe_file() to use
    edit_metadata()
  recipetool: add setvar subcommand
  recipetool: make plugin registration function name consistent with
    devtool
  nativesdk-buildtools-perl-dummy: fix rebuilding when SDKMACHINE
    changes
  bitbake: lib/bb/utils: fix error in edit_metadata() when deleting
    first line
  bitbake: lib/bb/utils: improve edit_bblayers_conf() handling of
    bblayers.conf formatting
  toolchain-shar-extract.sh: proper fix for additional env setup scripts
  toolchain-shar-extract.sh: ensure cleaned environment will work for
    ext SDK
  nativesdk-buildtools-perl-dummy: properly set PACKAGE_ARCH
  toolchain-shar-extract.sh: fix ~ not working in path

Peter Seebach (1):
  glibc/0029-fix-getmnt-empty-lines.patch: fix getmntent()

Petter Mabäcker (3):
  create-pull-request: handle empty ODIR
  readline: prepare for readline6.3 upstream patches
  readline: apply missing upstream patches

Randy Witt (1):
  uninative.bbclass: Choose the correct loader based on BUILD_ARCH

Ricardo Ribalda Delgado (1):
  python-git: Add missing dependency

Richard Purdie (18):
  classes: Ensure pass setVar/setVarFlag strings, not integers
  insane: Don't depend on BB_TASKDEPDATA
  lib/oe/copy_buildsystem: Don't expand BB_TASKDEPDATA
  sstate: Ensure siginfo and sig files are also touched
  base: Improve handling of switching virtual/x providers
  bitbake: knotty: Enforce terminal line limit to stop crazy scrolling
  build-appliance-image: Update to master head revision
  site/common-linux: Add some macros to avoid sleeps during configure
  automake: Remove delays in configure scripts using automake
  autoconf: Disable macro which causes excessive delays when using dash
    as sh
  populate_sdk_ext/sign_rpm/sign_package_feed: Add missing getVar
    parameter
  sstate: Ensure populate_lic dependencies are not followed
  nopackages: Add class for recipes which don't generate packages
  bitbake: event: Fix subprocess event error traceback failures
  package: Add auto package splitting of .debug files
  meta: Drop now pointless manual -dbg packaging
  coreutils/procps: Revert priority change since coreutils > busybox
  license: Fix BB_TASKDEPDATA references

Robert Yang (10):
  bitbake-prserv-tool: check file name
  gdbm 1.8.3: install libgdbm_compat
  gcc-multilib-config: make aarch64 support multilib
  boot-directdisk.bbclass: remove HDDIMG before create
  db: fix race issue for libdb-6.0.la
  apr: fix LTFLAGS to make it work with ccache
  rpm: fix for N32 MIPS64
  lsb: fix installed-vs-shipped for mips
  qt4-4.8.7: fix build for mips n32
  rpm: fix file conflicts for MIPS64 N32

Ross Burton (40):
  ptest-gnome: extend EXTRA_OECONF in all builds, not just target
  sstate: respect GPG_BIN and GPG_HOME
  oeqa/selftest/sstatetests: prettier output for allarch test
  lib/oe/distro_check: don't set empty proxy keys
  libusb1: fix make install race
  glibc: fix Upstream-Status tag
  weston: delete unused patch
  meta: add some missing Upstream-Status tags to patches
  libsdl2: require GLES when building Wayland support
  openssl: sanity check that the bignum module is present
  openssl: use subdir= instead of moving files in do_configure_prepend()
  gstreamer1.0: fix install race
  systemd: fix Upstream-Status tag
  glib-2.0: build dependency cleanup
  pango: add RPROVIDES for removed packages
  base: decode SRC_URI before adding implicit fetch dependencies
  base: add automatic dependency on lzip-native for .lz SRC_URI
  oeqa/qemurunner: pass nographic to runqemu if DISPLAY isn't set
  sanity: don't enforce DISPLAY for testimage
  oeqa/runtime/multilib: refactor ELF class extraction
  oeqa/sshcontrol: don't source profile
  pango: use ptest-gnome
  pkgconfig: merge .bb and .inc
  openssl: enable parallel make
  libxml2: merge pointless bb/inc split
  libxml2: upgrade to 2.9.3
  libsdl: remove redundant configure_tweak patch
  scripts/oe-pkgdata-util: sort the packages in list-pkg-files
  sudo: handle libexecdir != libdir/PN.
  glibc: fix libdir/libexecdir path confusion
  neard: fix libdir/libexecdir confusion
  gstreamer: really fix the helper install race
  libpcre: drop UPSTREAM_CHECK_ variables
  base: check for existing prefix when expanding names in PACKAGECONFIG
  libsdl: expand PACKAGECONFIG and enable native builds
  sudo: remove libdir INSANE_SKIP
  attr: add attr dependency to attr-ptest
  meta: more removals of redunant FILES_${PN}-dbg
  unifdef: upgrade to 2.11
  meta: more removals of redunant FILES_${PN}-dbg

Roy Li (2):
  iproute2: install bridge tool by default
  openssh: redesign ssh-agent.sh regression test case

Saul Wold (2):
  sysvinit-inittab: Add wrapper script to verify console exists
  linux-yocto: Update genericx86* BSPs to v4.1.13

Tanu Kaskinen (1):
  libsndfile1: 1.0.25 -> 1.0.26

Tudor Florea (1):
  util-linux: Add ptest

Tyler Hall (1):
  classes/cpan-base: fix libdir for nativesdk

Tzu-Jung Lee (3):
  linux-firmware: package Broadcom BCM4339 firmware
  devtool: add sync command
  devtool: include do_patch in SRCTREECOVEREDTASKS

Vladimir Zapolskiy (1):
  package_ipk: allow to specify OPKG_ARGS in local.conf

Wenlin Kang (1):
  kexec-tools: added the script kdump

Wenzong Fan (4):
  openssl: fix ptest issues
  mdadm: fix CFLAGS and ptest issues
  subversion: fix CVE-2015-3184
  subversion: fix CVE-2015-3187

Wills Wang (1):
  initramfs-framework: create directory /var/run

Yi Zhao (1):
  libsdl2: add missing dependency on libxkbcommon for
    PACKAGECONFIG[wayland]

Yuanjie Huang (1):
  gcc-cross-initial: make dependency on gnu-config-native and
    autoconf-native explicit

brian avery (4):
  bitbake: toaster: change toasterconf.json logic to use TEMPLATECONF,
    like oe-setup-builddir
  bitbake: toaster: toasterui Add ParseStarted/ParseProgress events to
    mask
  meta-yocto/conf/toasterconf.json: remove SDKMACHINE variable as it no
    longer used
  meta/conf/toasterconf.json: remove SDKMACHINE variable as it no longer
    used

 bitbake/bin/toaster                                |  241 ++--
 bitbake/lib/bb/event.py                            |    2 +
 bitbake/lib/bb/fetch2/git.py                       |    2 +-
 bitbake/lib/bb/fetch2/wget.py                      |    9 +-
 bitbake/lib/bb/tests/fetch.py                      |   10 +-
 bitbake/lib/bb/tests/utils.py                      |  203 ++++
 bitbake/lib/bb/ui/buildinfohelper.py               |   90 +-
 bitbake/lib/bb/ui/knotty.py                        |    7 +-
 bitbake/lib/bb/ui/toasterui.py                     |   30 +-
 bitbake/lib/bb/utils.py                            |   80 +-
 bitbake/lib/toaster/bldcollector/urls.py           |    1 -
 bitbake/lib/toaster/bldcontrol/bbcontroller.py     |   22 +-
 .../toaster/bldcontrol/localhostbecontroller.py    |  156 +--
 .../bldcontrol/management/commands/runbuilds.py    |   19 +-
 .../toaster/bldcontrol/migrations/0001_initial.py  |  265 ++---
 ...onment_sourcedir__add_field_buildenvironment.py |  106 --
 .../0003_auto__add_field_brlayer_dirpath.py        |   99 --
 .../bldcontrol/migrations/0004_loadinitialdata.py  |  104 --
 .../migrations/0005_auto__add_brerror.py           |  112 --
 .../migrations/0006_auto__add_brbitbake.py         |  128 ---
 ...st_environment__chg_field_buildrequest_build.py |  145 ---
 .../bldcontrol/migrations/0008_brarchive.py        |  138 ---
 .../0009_auto__add_field_brlayer_layer_version.py  |  180 ---
 bitbake/lib/toaster/bldcontrol/models.py           |    2 +-
 bitbake/lib/toaster/bldcontrol/sshbecontroller.py  |   10 -
 bitbake/lib/toaster/bldcontrol/tests.py            |   10 +-
 .../contrib/tts/toasteruitest/toaster.sqlite       |    1 +
 .../tts/toasteruitest/toaster_automation_test.py   |  702 ++++++++++--
 .../contrib/tts/toasteruitest/toasterconf.json     |    1 +
 bitbake/lib/toaster/orm/migrations/0001_initial.py |  928 ++++++++-------
 .../0002_auto__add_field_build_timespent.py        |  180 ---
 .../lib/toaster/orm/migrations/0003_timespent.py   |  182 ---
 .../0004_auto__add_field_package_installed_name.py |  181 ---
 ...e__add_target_file__add_field_variablehistor.py |  281 -----
 ...ge_size__add_field_target_license_manifest_p.py |  235 ----
 .../orm/migrations/0007_auto__add_helptext.py      |  214 ----
 ...story_operation__chg_field_recipe_descriptio.py |  225 ----
 ..._add_projectlayer__add_projecttarget__add_pr.py |  286 -----
 ...anch__add_field_project_short_description__a.py |  257 -----
 .../0011_auto__add_field_projectlayer_dirpath.py   |  242 ----
 ...layer_optional__add_field_projecttarget_task.py |  252 -----
 ...erversiondependency__add_unique_layerversion.py |  710 ------------
 ...mmary__chg_field_layer_summary__chg_field_re.py |  336 ------
 ...web_url__add_field_layer_vcs_web_tree_base_u.py |  336 ------
 ...lptext__chg_field_release_branch__add_index_.py |  359 ------
 ...faultlayer__add_releaselayersourcepriority__.py |  396 -------
 .../0018_auto__add_field_layer_version_project.py  |  331 ------
 .../orm/migrations/0019_auto__add_buildartifact.py |  342 ------
 ...ion_local_path__add_field_recipe_pathflags__.py |  361 ------
 ...ect__chg_field_project_bitbake_version__chg_.py |  371 ------
 ...k__add_field_layer_version_local_path__del_f.py |  343 ------
 ...ings_no__del_field_build_errors_no__del_fiel.py |  353 ------
 .../0024_auto__add_field_recipe_is_image.py        |  338 ------
 .../0025_auto__add_field_project_is_default.py     |  346 ------
 .../orm/migrations/0026_set_default_project.py     |  374 -------
 ...e__add_unique_customimagerecipe_name_project.py |  375 -------
 .../0028_auto__chg_field_logmessage_message.py     |  345 ------
 bitbake/lib/toaster/orm/models.py                  |  109 +-
 .../toaster/toastergui/static/js/projectpage.js    |   22 +-
 bitbake/lib/toaster/toastergui/static/js/table.js  |   10 +-
 bitbake/lib/toaster/toastergui/tables.py           |   19 +-
 bitbake/lib/toaster/toastergui/templates/base.html |    6 +-
 .../lib/toaster/toastergui/templates/landing.html  |   10 -
 .../toaster/toastergui/templates/machine_btn.html  |   12 +-
 .../toaster/toastergui/templates/projectconf.html  |   70 +-
 bitbake/lib/toaster/toastergui/tests.py            |  227 +++-
 bitbake/lib/toaster/toastergui/urls.py             |    2 +-
 bitbake/lib/toaster/toastergui/views.py            |   53 +-
 .../toastermain/management/commands/get-dburl.py   |    9 +
 bitbake/lib/toaster/toastermain/settings.py        |    7 +-
 bitbake/lib/toaster/toastermain/urls.py            |   11 +-
 bitbake/toaster-requirements.txt                   |    3 +-
 meta-selftest/files/signing/key.pub                |   30 +
 meta-selftest/files/signing/key.secret             |   59 +
 meta-selftest/files/signing/secret.txt             |    1 +
 meta-yocto-bsp/conf/machine/genericx86.conf        |    2 +
 .../gma500-gfx-check/gma500-gfx-check.conf         |    2 +
 .../gma500-gfx-check/gma500-gfx-check.sh           |   11 +
 .../gma500-gfx-check/gma500-gfx-check_1.0.bb       |   18 +
 .../recipes-kernel/linux/linux-yocto_4.1.bbappend  |    4 +-
 meta-yocto/conf/distro/include/maintainers.inc     |    1 +
 meta-yocto/conf/distro/poky.conf                   |    4 +-
 meta-yocto/conf/toasterconf.json                   |    3 +-
 meta/classes/allarch.bbclass                       |    6 +-
 meta/classes/archiver.bbclass                      |   32 +-
 meta/classes/autotools.bbclass                     |   43 +-
 meta/classes/base.bbclass                          |  104 +-
 meta/classes/boot-directdisk.bbclass               |    2 +
 meta/classes/buildhistory.bbclass                  |   15 +-
 meta/classes/chrpath.bbclass                       |    4 +-
 meta/classes/cpan-base.bbclass                     |   23 +-
 meta/classes/cross-canadian.bbclass                |    3 -
 meta/classes/cross.bbclass                         |    8 +-
 meta/classes/crosssdk.bbclass                      |    2 +-
 meta/classes/distutils-common-base.bbclass         |    5 -
 meta/classes/distutils3-base.bbclass               |    2 +-
 meta/classes/distutils3-native-base.bbclass        |    2 +-
 meta/classes/image_types.bbclass                   |   36 +-
 meta/classes/insane.bbclass                        |    7 +-
 meta/classes/kernel.bbclass                        |   11 +-
 meta/classes/license.bbclass                       |  211 +++-
 meta/classes/metadata_scm.bbclass                  |   20 +-
 meta/classes/mirrors.bbclass                       |    2 +-
 meta/classes/module-base.bbclass                   |    4 +-
 meta/classes/native.bbclass                        |    8 +-
 meta/classes/nopackages.bbclass                    |    6 +
 meta/classes/package.bbclass                       |   21 +-
 meta/classes/package_deb.bbclass                   |    2 +-
 meta/classes/package_ipk.bbclass                   |    2 +-
 meta/classes/package_rpm.bbclass                   |    2 +-
 meta/classes/populate_sdk_base.bbclass             |   53 +-
 meta/classes/populate_sdk_ext.bbclass              |   17 +-
 meta/classes/ptest-gnome.bbclass                   |    2 +-
 meta/classes/ptest.bbclass                         |    2 +-
 meta/classes/python3native.bbclass                 |    2 +-
 meta/classes/qemu.bbclass                          |   13 +-
 meta/classes/rootfs_deb.bbclass                    |    1 -
 meta/classes/rootfs_ipk.bbclass                    |    1 -
 meta/classes/rootfs_rpm.bbclass                    |    1 -
 meta/classes/sanity.bbclass                        |    8 -
 meta/classes/sign_package_feed.bbclass             |    2 +-
 meta/classes/sign_rpm.bbclass                      |    2 +-
 meta/classes/siteinfo.bbclass                      |    2 +-
 meta/classes/spdx.bbclass                          |    2 +-
 meta/classes/sstate.bbclass                        |   25 +-
 meta/classes/systemd.bbclass                       |   14 +
 meta/classes/terminal.bbclass                      |    8 +-
 meta/classes/testimage.bbclass                     |  257 ++++-
 meta/classes/tinderclient.bbclass                  |    2 +-
 meta/classes/toolchain-scripts.bbclass             |    1 +
 meta/classes/uninative.bbclass                     |    2 +-
 meta/classes/update-alternatives.bbclass           |    2 +-
 meta/classes/upstream-version-is-even.bbclass      |    5 +
 meta/classes/waf.bbclass                           |   24 +-
 meta/conf/bitbake.conf                             |   10 +-
 meta/conf/distro/include/package_regex.inc         |  268 +----
 meta/conf/distro/include/tcmode-default.inc        |    2 +-
 meta/conf/machine/include/arm/arch-arm.inc         |    4 +-
 meta/conf/machine/include/arm/arch-arm64.inc       |   14 +-
 meta/conf/machine/include/arm/arch-armv4.inc       |   10 +-
 meta/conf/machine/include/arm/arch-armv5-dsp.inc   |    2 +-
 meta/conf/machine/include/arm/arch-armv5.inc       |    6 +-
 meta/conf/machine/include/arm/arch-armv6.inc       |    4 +-
 meta/conf/machine/include/arm/arch-armv7a.inc      |    4 +-
 meta/conf/machine/include/arm/feature-arm-neon.inc |    4 +-
 meta/conf/machine/include/arm/feature-arm-vfp.inc  |   16 +-
 meta/conf/machine/include/mips/arch-mips.inc       |   24 +-
 meta/conf/machine/include/powerpc/arch-powerpc.inc |   10 +-
 .../machine/include/powerpc/arch-powerpc64.inc     |    4 +-
 meta/conf/machine/include/sh/arch-sh.inc           |    2 +-
 meta/conf/machine/include/tune-arm1136jf-s.inc     |    2 +-
 meta/conf/machine/include/tune-arm920t.inc         |    2 +-
 meta/conf/machine/include/tune-arm926ejs.inc       |    2 +-
 meta/conf/machine/include/tune-arm9tdmi.inc        |    2 +-
 meta/conf/machine/include/tune-c3.inc              |    2 +-
 meta/conf/machine/include/tune-core2.inc           |    2 +-
 meta/conf/machine/include/tune-corei7.inc          |    2 +-
 meta/conf/machine/include/tune-cortexa15.inc       |    2 +-
 meta/conf/machine/include/tune-cortexa17.inc       |    2 +-
 meta/conf/machine/include/tune-cortexa5.inc        |    2 +-
 meta/conf/machine/include/tune-cortexa7.inc        |    2 +-
 meta/conf/machine/include/tune-cortexa8.inc        |    2 +-
 meta/conf/machine/include/tune-cortexa9.inc        |    2 +-
 meta/conf/machine/include/tune-cortexm1.inc        |    2 +-
 meta/conf/machine/include/tune-cortexm3.inc        |    4 +-
 meta/conf/machine/include/tune-cortexr4.inc        |    4 +-
 meta/conf/machine/include/tune-ep9312.inc          |    2 +-
 meta/conf/machine/include/tune-i586-nlp.inc        |    2 +-
 meta/conf/machine/include/tune-i586.inc            |    2 +-
 meta/conf/machine/include/tune-iwmmxt.inc          |    2 +-
 meta/conf/machine/include/tune-mips32.inc          |    2 +-
 meta/conf/machine/include/tune-mips32r2.inc        |    2 +-
 meta/conf/machine/include/tune-octeon.inc          |    4 +-
 meta/conf/machine/include/tune-power5.inc          |    6 +-
 meta/conf/machine/include/tune-power6.inc          |    6 +-
 meta/conf/machine/include/tune-power7.inc          |    6 +-
 meta/conf/machine/include/tune-ppc476.inc          |    4 +-
 meta/conf/machine/include/tune-ppc603e.inc         |    4 +-
 meta/conf/machine/include/tune-ppc7400.inc         |    4 +-
 meta/conf/machine/include/tune-ppce300c2.inc       |    2 +-
 meta/conf/machine/include/tune-ppce300c3.inc       |    6 +-
 meta/conf/machine/include/tune-ppce500.inc         |    8 +-
 meta/conf/machine/include/tune-ppce500mc.inc       |    4 +-
 meta/conf/machine/include/tune-ppce500v2.inc       |    8 +-
 meta/conf/machine/include/tune-ppce5500.inc        |    4 +-
 meta/conf/machine/include/tune-ppce6500.inc        |    6 +-
 meta/conf/machine/include/tune-sh3.inc             |    2 +-
 meta/conf/machine/include/tune-sh4.inc             |    4 +-
 meta/conf/machine/include/tune-strongarm1100.inc   |    2 +-
 meta/conf/machine/include/tune-thunderx.inc        |    2 +-
 meta/conf/machine/include/tune-xscale.inc          |    2 +-
 meta/conf/machine/include/x86/arch-x86.inc         |   20 +-
 meta/conf/toasterconf.json                         |    3 +-
 meta/files/toolchain-shar-extract.sh               |   19 +-
 meta/lib/oe/copy_buildsystem.py                    |    7 +-
 meta/lib/oe/distro_check.py                        |   10 +-
 meta/lib/oe/image.py                               |   13 +-
 meta/lib/oe/package_manager.py                     |  174 ++-
 meta/lib/oe/patch.py                               |   58 +-
 meta/lib/oe/recipeutils.py                         |  162 +--
 meta/lib/oe/rootfs.py                              |   47 +-
 meta/lib/oe/sdk.py                                 |    4 +
 meta/lib/oe/terminal.py                            |   22 +-
 meta/lib/oeqa/runexported.py                       |   57 +-
 meta/lib/oeqa/runtime/multilib.py                  |   32 +-
 meta/lib/oeqa/runtime/systemd.py                   |   75 ++
 meta/lib/oeqa/selftest/bblayers.py                 |    1 +
 meta/lib/oeqa/selftest/devtool.py                  |    8 +-
 meta/lib/oeqa/selftest/signing.py                  |  124 ++
 meta/lib/oeqa/selftest/sstatetests.py              |   12 +-
 meta/lib/oeqa/selftest/wic.py                      |    8 +
 meta/lib/oeqa/utils/decorators.py                  |   48 +
 meta/lib/oeqa/utils/qemurunner.py                  |   12 +-
 meta/lib/oeqa/utils/sshcontrol.py                  |    3 +-
 meta/lib/oeqa/utils/testexport.py                  |  263 +++++
 meta/recipes-bsp/apmd/apmd_3.2.2-15.bb             |    4 +
 meta/recipes-bsp/grub/grub-efi_2.00.bb             |    3 -
 meta/recipes-bsp/grub/grub_2.00.bb                 |    3 -
 meta/recipes-bsp/grub/grub_git.bb                  |    1 -
 meta/recipes-bsp/libacpi/libacpi_0.2.bb            |    2 +
 meta/recipes-bsp/lrzsz/lrzsz_0.12.20.bb            |    2 +
 meta/recipes-bsp/pcmciautils/pcmciautils_018.bb    |    1 -
 meta/recipes-bsp/pm-utils/pm-utils_1.4.1.bb        |    3 +-
 ...utils_2015.07.bb => u-boot-fw-utils_2015.10.bb} |    6 +-
 ...kimage_2015.07.bb => u-boot-mkimage_2015.10.bb} |    6 +-
 meta/recipes-bsp/u-boot/u-boot.inc                 |    2 -
 ...u-boot-.lds-remove-_GLOBAL_OFFSET_TABLE_.patch} |   11 +-
 ...-non-Android-booting-with-ramdisk-and-or-.patch |   36 +
 ...board_f-enable-setup_board_part1-for-MIPS.patch |   59 +
 ...PS-bootm-rework-and-fix-broken-bootm-code.patch |  254 +++++
 ...PS-bootm-use-CONFIG_IS_ENABLED-everywhere.patch |   93 ++
 ...-Replace-extern-inline-with-static-inline.patch | 1184 ++++++++++++++++++++
 meta/recipes-bsp/u-boot/u-boot_2015.07.bb          |   14 -
 meta/recipes-bsp/u-boot/u-boot_2015.10.bb          |   19 +
 meta/recipes-connectivity/avahi/avahi-ui_0.6.31.bb |    1 -
 meta/recipes-connectivity/bluez5/bluez5.inc        |   17 +-
 ...e-Fix-possible-crash-when-registering-pro.patch |   54 +
 meta/recipes-connectivity/bluez5/bluez5/init       |   68 ++
 .../bluez5/{bluez5_5.33.bb => bluez5_5.36.bb}      |    4 +-
 meta/recipes-connectivity/connman/connman.inc      |    4 +-
 meta/recipes-connectivity/dhcp/dhcp.inc            |    3 +
 meta/recipes-connectivity/iproute2/iproute2.inc    |    4 +-
 .../{iproute2_4.1.1.bb => iproute2_4.3.0.bb}       |    4 +-
 ....sh-don-t-use-git-describe-for-versioning.patch |   20 +-
 .../iw/iw/separate-objdir.patch                    |   36 +-
 .../iw/{iw_4.1.bb => iw_4.3.bb}                    |    4 +-
 meta/recipes-connectivity/libpcap/libpcap.inc      |    2 +-
 .../libpcap/{libpcap_1.6.2.bb => libpcap_1.7.4.bb} |    4 +-
 .../mobile-broadband-provider-info_git.bb          |    4 +-
 meta/recipes-connectivity/neard/neard_0.15.bb      |    1 -
 .../nfs-utils/libnfsidmap_0.25.bb                  |    2 +
 .../{nfs-utils_1.3.1.bb => nfs-utils_1.3.3.bb}     |    7 +-
 ...cktrace-Disable-for-non-glibc-C-libraries.patch |   40 -
 .../ofono/{ofono_1.16.bb => ofono_1.17.bb}         |    5 +-
 .../recipes-connectivity/openssh/openssh/run-ptest |   37 +
 meta/recipes-connectivity/openssl/openssl.inc      |   18 +-
 .../openssl/openssl/configure-musl-target.patch    |   27 +
 .../{openssl_1.0.2d.bb => openssl_1.0.2e.bb}       |   29 +-
 meta/recipes-connectivity/ppp/ppp_2.4.7.bb         |    1 -
 .../resolvconf/resolvconf_1.77.bb                  |    4 +
 .../wireless-tools/wireless-tools.if-pre-up        |  122 --
 .../wireless-tools/zzz-wireless.if-pre-up          |   34 -
 .../wireless-tools/wireless-tools_30.pre9.bb       |   14 +-
 ...integer-underflow-in-WMM-Action-frame-par.patch |   45 -
 ...r-Fix-payload-length-validation-for-Commi.patch |   77 --
 ...e-SSID-element-length-before-copying-it-C.patch |   47 -
 ...Fix-HTTP-chunked-transfer-encoding-parser.patch |   53 -
 ...ver-Fix-payload-length-validation-for-Com.patch |   70 --
 ...r-Fix-Total-Length-parsing-for-fragment-r.patch |   56 -
 ...ver-Fix-Total-Length-parsing-for-fragment.patch |   54 -
 ...eer-Fix-asymmetric-fragmentation-behavior.patch |   36 -
 ...wpa-supplicant_2.4.bb => wpa-supplicant_2.5.bb} |   20 +-
 meta/recipes-core/base-files/base-files_3.0.14.bb  |    4 +
 .../recipes-core/base-passwd/base-passwd_3.5.29.bb |    4 +
 meta/recipes-core/busybox/busybox.inc              |   16 +-
 .../busybox/0001-Switch-to-POSIX-utmpx-API.patch   |  388 -------
 .../busybox/busybox/0001-chown-fix-help-text.patch |   34 -
 ...ix-double-free-fatal-error-in-INET_sprint.patch |   67 --
 .../busybox/busybox-1.24.1-unzip-regression.patch  |  143 +++
 .../busybox/busybox/busybox-1.24.1-unzip.patch     |  118 ++
 meta/recipes-core/busybox/busybox/defconfig        |   63 +-
 meta/recipes-core/busybox/busybox/musl.cfg         |   12 +
 meta/recipes-core/busybox/busybox/resize.cfg       |    2 +
 .../{busybox_1.23.2.bb => busybox_1.24.1.bb}       |   19 +-
 meta/recipes-core/busybox/busybox_git.bb           |   18 +-
 .../console-tools/console-tools_0.3.2.bb           |    3 +
 meta/recipes-core/coreutils/coreutils_8.24.bb      |    2 +-
 meta/recipes-core/dbus/dbus-glib.inc               |    5 +-
 meta/recipes-core/dbus/dbus-test_1.8.20.bb         |    2 +-
 meta/recipes-core/dbus/dbus.inc                    |  170 ---
 meta/recipes-core/dbus/dbus_1.8.20.bb              |  171 ++-
 meta/recipes-core/dropbear/dropbear.inc            |    3 -
 .../dropbear/0005-dropbear-enable-pam.patch        |   26 +-
 meta/recipes-core/dropbear/dropbear_2015.68.bb     |    4 -
 meta/recipes-core/dropbear/dropbear_2015.71.bb     |    5 +
 meta/recipes-core/gettext/gettext_0.16.1.bb        |    5 +
 meta/recipes-core/gettext/gettext_0.19.4.bb        |    4 +
 ...on-t-depend-on-a-data-file-that-s-not-bui.patch |   38 +
 .../Enable-more-tests-while-cross-compiling.patch  |   81 ++
 .../{glib-2.0_2.44.1.bb => glib-2.0_2.46.1.bb}     |    6 +-
 meta/recipes-core/glib-2.0/glib.inc                |   12 +-
 ...working_2.44.0.bb => glib-networking_2.46.1.bb} |    7 +-
 .../glibc/cross-localedef-native_2.22.bb           |    1 +
 meta/recipes-core/glibc/glibc-initial.inc          |    2 +
 meta/recipes-core/glibc/glibc-locale.inc           |    1 -
 meta/recipes-core/glibc/glibc-package.inc          |    6 +-
 .../glibc/0029-fix-getmntent-empty-lines.patch     |   40 +
 ...ove-incorrect-STRDIFF-based-optimization-.patch |  323 ++++++
 .../glibc/glibc/use_64bit_atomics.patch            |    2 +-
 meta/recipes-core/glibc/glibc_2.22.bb              |    3 +
 .../images/build-appliance-image_12.0.1.bb         |    2 +-
 .../initrdscripts/files/init-install-efi.sh        |    9 +-
 .../initrdscripts/initramfs-framework/udev         |    1 +
 .../initscripts/initscripts-1.0/save-rtc.sh        |    2 +-
 ...-Only-inluclude-kernel-headers-with-glibc.patch |   29 -
 .../kbd/{kbd_2.0.2.bb => kbd_2.0.3.bb}             |    5 +-
 meta/recipes-core/libcgroup/libcgroup_0.41.bb      |    3 +-
 ...19-Enforce-the-reader-to-run-in-constant-.patch |  181 ---
 ...ine-pthread-definitions-for-glibc-complia.patch |   32 -
 .../72a46a519ce7326d9a00f0b6a7f2a8e958cd1675.patch |   30 -
 meta/recipes-core/libxml/libxml2/ansidecl.patch    |   22 +-
 .../libxml/libxml2/libxml2-CVE-2014-0191-fix.patch |   37 -
 meta/recipes-core/libxml/libxml2_2.9.2.bb          |   11 -
 .../libxml/{libxml2.inc => libxml2_2.9.3.bb}       |   26 +-
 meta/recipes-core/meta/buildtools-tarball.bb       |    6 +
 meta/recipes-core/meta/buildtools-with-tc.bb       |   37 +
 .../meta/nativesdk-buildtools-perl-dummy.bb        |   11 +-
 meta/recipes-core/musl/musl.inc                    |   26 +
 meta/recipes-core/musl/musl_git.bb                 |   58 +
 meta/recipes-core/ncurses/ncurses.inc              |    2 +-
 meta/recipes-core/ncurses/ncurses_5.9.bb           |    6 +-
 .../packagegroups/packagegroup-core-sdk.bb         |    1 +
 ...Convert-psplash_fb_plot_pixel-to-a-static.patch |   53 -
 meta/recipes-core/psplash/psplash_git.bb           |    3 +-
 .../readline/{files => readline-6.3}/norpath.patch |    0
 .../readline-6.3/readline-cve-2014-2524.patch      |   43 -
 .../readline-6.3/readline-dispatch-multikey.patch  |   32 -
 meta/recipes-core/readline/readline.inc            |    5 +-
 meta/recipes-core/readline/readline_6.3.bb         |   30 +-
 meta/recipes-core/sysfsutils/sysfsutils_2.1.0.bb   |    4 +
 .../systemd/0001-define-exp10-if-missing.patch     |   33 +
 .../systemd/0001-fix-build-on-uClibc-exp10.patch   |   22 -
 ...-getty-to-agetty-in-console-setup-system.patch} |    6 +-
 ...v-when-secure-versions-are-not-available.patch} |   13 +-
 ...c-Change-the-default-device-timeout-to-2.patch} |   22 +-
 ...-install-dependency-links-at-install-tim.patch} |   35 +-
 ...eck-for-additional-features-that-uclibc-.patch} |   17 +-
 ...nal-Use-posix-fallocate-only-if-available.patch |   96 --
 ...n-Use-execvpe-only-when-libc-supports-it.patch} |   31 +-
 ...til-Use-mkostemp-only-if-libc-supports-it.patch |   42 -
 ...-unimplemented-_SC_PHYS_PAGES-system-conf.patch |   16 +-
 ...009-implment-systemd-sysv-install-for-OE.patch} |   15 +-
 ...nes-Build-conditionally-when-HAVE_MYHOSTN.patch |   38 +
 ...patch => 0011-rules-whitelist-hd-devices.patch} |    6 +-
 ...or-add-support-for-executing-scripts-und.patch} |   68 +-
 ...-Make-root-s-home-directory-configurable.patch} |  147 +--
 ...014-systemd-user-avoid-using-system-auth.patch} |   25 +-
 ...vert-rules-remove-firmware-loading-rules.patch} |    6 +-
 ...remove-userspace-firmware-loading-suppor.patch} |  132 +--
 .../systemd/{systemd_225.bb => systemd_228.bb}     |   68 +-
 .../sysvinit/sysvinit-inittab/start_getty          |    5 +
 .../sysvinit/sysvinit-inittab_2.88dsf.bb           |   11 +-
 meta/recipes-core/sysvinit/sysvinit/realpath.patch |   78 ++
 meta/recipes-core/sysvinit/sysvinit_2.88dsf.bb     |    1 +
 meta/recipes-core/uclibc/uclibc-config.inc         |    1 +
 meta/recipes-core/uclibc/uclibc-git.inc            |   24 +-
 ...ert-glibc-compat-bump-glibc-minor-version.patch |   28 +
 ...-AT_EMPTY_PATH-for-all-and-O_PATH-for-arm.patch |   42 -
 ...zes-away-the-write-only-static-functions-.patch |   51 -
 .../uclibc/uclibc-git/0001-wire-in-syncfs.patch    |   49 -
 ...t-localised-optimizations-this-helps-to-h.patch |   30 -
 .../0005-Always-use-O2-for-compiling-fork.c.patch  |   33 -
 ...-ldso-limited-support-for-ORIGIN-in-rpath.patch |  233 ----
 ...rk-Hide-pthread_atfork-in-shared-versions.patch |   35 -
 ...stdlib-canonicalize_file_name-memory-leak.patch |   95 ++
 meta/recipes-core/uclibc/uclibc-git/uClibc.distro  |    6 +-
 meta/recipes-core/uclibc/uclibc-package.inc        |    3 +-
 meta/recipes-core/uclibc/uclibc.inc                |    8 +-
 meta/recipes-core/udev/udev.inc                    |    4 -
 meta/recipes-core/util-linux/util-linux.inc        |   32 +-
 .../util-linux/avoid_parallel_tests.patch          |   19 +
 .../util-linux/avoid_unsupported_grep_opts.patch   |   57 +
 .../util-linux/avoid_unsupported_sleep_param.patch |   20 +
 .../util-linux/display_testname_for_subtest.patch  |   18 +
 .../util-linux/util-linux/fix-parallel-build.patch |   35 -
 .../recipes-core/util-linux/util-linux/ptest.patch |   17 +
 meta/recipes-core/util-linux/util-linux/run-ptest  |   25 +
 .../util-linux/uclibc-__progname-conflict.patch    |   32 -
 .../util-linux-ng-replace-siginterrupt.patch       |   33 -
 .../{util-linux_2.26.2.bb => util-linux_2.27.1.bb} |   17 +-
 meta/recipes-devtools/apt/apt.inc                  |    6 +-
 .../autoconf/autoconf/add_musl_config.patch        |   26 +
 .../autoconf/autoconf/performance.patch            |   60 +
 meta/recipes-devtools/autoconf/autoconf_2.69.bb    |    2 +
 .../autogen/autogen-native_5.18.5.bb               |    3 +
 meta/recipes-devtools/automake/automake.inc        |    3 +
 .../automake/automake/performance.patch            |   73 ++
 meta/recipes-devtools/automake/automake_1.15.bb    |    3 +-
 meta/recipes-devtools/binutils/binutils-2.25.1.inc |    2 +
 meta/recipes-devtools/binutils/binutils.inc        |    2 -
 .../bootchart2/bootchart2_0.14.7.bb                |    3 +-
 ...s-native_3.01a31.bb => cdrtools-native_3.01.bb} |   13 +-
 meta/recipes-devtools/chrpath/chrpath_0.16.bb      |    2 +
 meta/recipes-devtools/cmake/cmake.inc              |    3 +
 .../cmake/cmake/0001-Add-NIOS2-CPU-support.patch   |   50 +
 .../{dmidecode_2.12.bb => dmidecode_3.0.bb}        |    9 +-
 .../docbook-dsssl-stylesheets-native_1.79.bb       |    3 +
 .../docbook-sgml-dtd-3.1-native_3.1.bb             |    3 +
 .../docbook-sgml-dtd-4.1-native_4.1.bb             |    3 +
 .../docbook-xml/docbook-xsl-stylesheets_1.78.1.bb  |    4 +
 .../dosfstools/dosfstools_3.0.28.bb                |    2 +
 meta/recipes-devtools/expect/expect_5.45.bb        |    6 +-
 meta/recipes-devtools/fdisk/gptfdisk_1.0.0.bb      |    3 +
 meta/recipes-devtools/file/file_5.24.bb            |    3 +
 ...fixes-Do-not-use-obsolete-bison-construct.patch |   80 ++
 meta/recipes-devtools/flex/flex.inc                |    1 +
 meta/recipes-devtools/gcc/gcc-4.9.inc              |    8 +
 .../gcc/gcc-4.9/0066-cxxflags-for-build.patch      |  123 ++
 .../gcc/gcc-4.9/0067-fix-arm-thumb.patch           |   39 +
 .../gcc/gcc-4.9/0067-gcc-musl-support.patch        |  267 +++++
 .../gcc/gcc-4.9/0068-musl-dynamic-linker.patch     |  205 ++++
 .../gcc/gcc-4.9/0069-musl-no-fixincludes.patch     |   21 +
 .../gcc/gcc-4.9/0070-libstdc-musl.patch            |   32 +
 meta/recipes-devtools/gcc/gcc-5.2.inc              |    5 +
 .../gcc/gcc-5.2/0043-fix-arm-thumb.patch           |   39 +
 .../gcc/gcc-5.2/0043-libstdc-musl.patch            |   32 +
 .../gcc/gcc-5.2/0044-gcc-musl-support.patch        |  267 +++++
 .../gcc/gcc-5.2/0045-musl-dynamic-linker.patch     |  198 ++++
 .../gcc/gcc-5.2/0046-musl-no-fixincludes.patch     |   22 +
 meta/recipes-devtools/gcc/gcc-cross-canadian.inc   |    5 -
 meta/recipes-devtools/gcc/gcc-cross-initial.inc    |    4 +
 meta/recipes-devtools/gcc/gcc-multilib-config.inc  |    7 +
 meta/recipes-devtools/gcc/gcc-sanitizers.inc       |    7 +-
 meta/recipes-devtools/gcc/gcc-source.inc           |    8 +-
 meta/recipes-devtools/gcc/gcc-target.inc           |    4 -
 meta/recipes-devtools/gcc/gcc_4.9.bb               |    5 +-
 meta/recipes-devtools/gcc/libgcc-initial.inc       |    1 +
 meta/recipes-devtools/gcc/libgcc.inc               |    2 -
 meta/recipes-devtools/gdb/gdb.inc                  |    1 +
 ...0001-Use-exported-definitions-of-SIGRTMIN.patch |   54 +
 meta/recipes-devtools/git/git.inc                  |    1 -
 meta/recipes-devtools/guile/guile_2.0.11.bb        |    4 +
 meta/recipes-devtools/intltool/intltool.inc        |    3 +
 meta/recipes-devtools/json-c/json-c_0.12.bb        |    8 +
 .../mtd/mtd-utils/0001-Fix-build-with-musl.patch   |   29 +
 ...emove-duplicate-hashtable_iterator_value-.patch |   64 --
 .../mtd/mtd-utils/010-fix-rpmatch.patch            |   24 +
 meta/recipes-devtools/mtd/mtd-utils_git.bb         |    8 +-
 meta/recipes-devtools/mtools/mtools_4.0.18.bb      |    4 +-
 .../openjade/openjade-native_1.3.2.bb              |   24 +-
 meta/recipes-devtools/opensp/opensp_1.5.2.bb       |    4 +
 ...ng_util-New-file-with-bin_to_hex-function.patch |  122 ++
 .../opkg/0002-md5-Add-md5_to_string-function.patch |  110 ++
 ...0003-sha256-Add-sha256_to_string-function.patch |  110 ++
 ...4-opkg_download-Use-short-cache-file-name.patch |   85 ++
 meta/recipes-devtools/opkg/opkg_0.3.0.bb           |    4 +
 .../orc/{orc_0.4.23.bb => orc_0.4.24.bb}           |    4 +-
 .../perl/libxml-parser-perl_2.44.bb                |    2 -
 ...ple-perl_2.20.bb => libxml-simple-perl_2.22.bb} |    6 +-
 meta/recipes-devtools/perl/perl.inc                |    2 +
 .../perl/perl/perl-errno-generation-gcc5.patch     |   20 +-
 meta/recipes-devtools/perl/perl_5.22.0.bb          |    7 -
 meta/recipes-devtools/pkgconfig/pkgconfig.inc      |   49 -
 meta/recipes-devtools/pkgconfig/pkgconfig_git.bb   |   55 +-
 meta/recipes-devtools/pseudo/pseudo.inc            |    1 -
 ...on-3.4-manifest.inc => python-3.5-manifest.inc} |  126 +--
 meta/recipes-devtools/python/python-async_0.6.2.bb |    2 +
 meta/recipes-devtools/python/python-git_1.0.1.bb   |    5 +-
 meta/recipes-devtools/python/python-gitdb_0.6.4.bb |    2 +
 meta/recipes-devtools/python/python-mako_1.0.1.bb  |    3 +
 meta/recipes-devtools/python/python-nose_1.3.6.bb  |    3 +
 ...-usr-and-so-on-for-libraries-by-default-.patch} |   33 +-
 ...ython-numpy_1.7.0.bb => python-numpy_1.10.1.bb} |    9 +-
 meta/recipes-devtools/python/python-pexpect_3.3.bb |    2 +
 .../python/python-pycurl/no-static-link.patch      |   12 +-
 ...ycurl_7.19.5.1.bb => python-pycurl_7.19.5.2.bb} |    8 +-
 meta/recipes-devtools/python/python-scons_2.3.6.bb |    3 +
 ...uptools_18.2.bb => python-setuptools_18.7.1.bb} |    5 +-
 meta/recipes-devtools/python/python-smartpm_git.bb |    2 -
 meta/recipes-devtools/python/python-smmap_0.9.0.bb |    3 +
 meta/recipes-devtools/python/python.inc            |    4 +
 .../add-CROSSPYTHONPATH-for-PYTHON_FOR_BUILD.patch |   31 +
 ...on3-native_3.4.3.bb => python3-native_3.5.0.bb} |   10 +-
 meta/recipes-devtools/python/python3-pip_6.1.1.bb  |   10 +-
 ...ptools_18.2.bb => python3-setuptools_18.7.1.bb} |    5 +-
 .../python/python3/000-cross-compile.patch         |   36 +-
 .../python3/020-dont-compile-python-files.patch    |   19 +-
 .../python/python3/04-default-is-optimized.patch   |   38 +-
 .../recipes-devtools/python/python3/makerace.patch |   28 -
 .../python/python3/python-3.3-multilib.patch       |  140 +--
 .../python/python3/use_packed_importlib.patch      |   31 +
 .../python/{python3_3.4.3.bb => python3_3.5.0.bb}  |   15 +-
 meta/recipes-devtools/python/python_2.7.9.bb       |    4 +-
 .../qemu/qemu/trace-remove-malloc-tracing.patch    |   97 ++
 meta/recipes-devtools/qemu/qemu_2.4.0.1.bb         |    1 +
 meta/recipes-devtools/remake/remake_4.1+dbg-1.1.bb |    1 +
 ...ction.c-fix-file-conflicts-for-mips64-N32.patch |   52 +
 .../rpm/rpm/rpm-rpmfc.c-fix-for-N32-MIPS64.patch   |   34 +
 meta/recipes-devtools/rpm/rpm_4.11.2.bb            |    5 -
 meta/recipes-devtools/rpm/rpm_5.4+cvs.bb           |    8 +-
 meta/recipes-devtools/rpm/rpm_5.4.14.bb            |   12 +-
 meta/recipes-devtools/ruby/ruby.inc                |    2 +-
 meta/recipes-devtools/ruby/ruby_2.2.2.bb           |    5 -
 .../recipes-devtools/sgmlspl/sgmlspl-native_git.bb |    1 +
 .../squashfs-tools/squashfs-tools/fix-compat.patch |   63 ++
 .../squashfs-tools/squashfs-tools_git.bb           |    1 +
 .../subversion/subversion-1.8.13/libtool2.patch    |   15 -
 .../0001-Fix-libtool-name-in-configure.ac.patch    |   29 +
 .../disable_macos.patch                            |    0
 ...erf.m4-Regex-modified-to-allow-D-in-paths.patch |   14 +-
 .../{subversion_1.8.13.bb => subversion_1.9.2.bb}  |   10 +-
 .../tcf-agent/tcf-agent/ldflags.patch              |   28 +
 meta/recipes-devtools/tcf-agent/tcf-agent_git.bb   |    2 +
 .../unfs3/unfs3/fix_warnings.patch                 |   53 -
 .../{unfs3_0.9.22.r490.bb => unfs3_0.9.22.r497.bb} |   11 +-
 .../unifdef/{unifdef_2.10.bb => unifdef_2.11.bb}   |    8 +-
 meta/recipes-devtools/vala/vala.inc                |    3 +-
 .../valgrind/valgrind/11_mips-link-tool.patch      |   37 +
 meta/recipes-devtools/valgrind/valgrind_3.10.1.bb  |    3 +-
 meta/recipes-extended/bash/bash.inc                |    3 +
 ...roc-run-heredoc-run-execscript-run-test-f.patch |  169 +++
 meta/recipes-extended/bash/bash/run-ptest          |    2 +-
 meta/recipes-extended/bash/bash_4.3.30.bb          |    1 +
 meta/recipes-extended/blktool/blktool_4-7.bb       |    4 +
 meta/recipes-extended/bzip2/bzip2_1.0.6.bb         |    2 +
 .../chkconfig-alternatives-native_1.3.59.bb        |    1 +
 ...-bad-length-test-for-64-bit-architectures.patch |   36 -
 .../cpio/cpio-2.11/fix-memory-overrun.patch        |  220 ----
 .../fix-testcase-symlink-bad-lengths.patch         |   33 -
 .../cpio/cpio-2.11/remove-gets.patch               |   20 -
 meta/recipes-extended/cpio/cpio-2.11/statdef.patch |   17 -
 .../0001-Fix-CVE-2015-1197.patch}                  |  103 +-
 ...need_charset_alias-when-building-for-musl.patch |    0
 meta/recipes-extended/cpio/cpio_2.11.bb            |   17 -
 meta/recipes-extended/cpio/cpio_2.12.bb            |   12 +
 meta/recipes-extended/cpio/cpio_2.8.bb             |    4 +-
 meta/recipes-extended/cpio/cpio_v2.inc             |    1 -
 meta/recipes-extended/cracklib/cracklib_2.9.5.bb   |   15 +-
 meta/recipes-extended/cups/cups.inc                |   11 +-
 .../ethtool/{ethtool_4.0.bb => ethtool_4.2.bb}     |    4 +-
 .../foomatic/foomatic-filters_4.0.17.bb            |    2 +
 meta/recipes-extended/gawk/gawk_3.1.5.bb           |    1 -
 meta/recipes-extended/gawk/gawk_4.1.3.bb           |    1 -
 .../ghostscript/ghostscript/nios2/objarch.h        |   40 +
 .../ghostscript/ghostscript/png_mak.patch          |   21 +
 .../ghostscript/ghostscript_9.16.bb                |    1 +
 .../grep/grep/grep-fix-CVE-2015-1345.patch         |  154 ---
 .../grep/{grep_2.21.bb => grep_2.22.bb}            |    5 +-
 meta/recipes-extended/iptables/iptables_1.4.21.bb  |    1 -
 meta/recipes-extended/iputils/iputils_s20121221.bb |    2 +
 meta/recipes-extended/less/less_479.bb             |    2 +
 meta/recipes-extended/libidn/libidn_0.6.14.bb      |    3 +
 meta/recipes-extended/libidn/libidn_1.32.bb        |    3 +
 meta/recipes-extended/libsolv/libsolv_git.bb       |   27 +
 meta/recipes-extended/libuser/libuser_0.62.bb      |    1 -
 meta/recipes-extended/logrotate/logrotate_3.9.1.bb |    2 +-
 meta/recipes-extended/lsb/lsb_4.1.bb               |    5 +
 meta/recipes-extended/lsof/lsof_4.89.bb            |    2 +
 ...atch => 0001-Fix-compilation-for-gcc-5.x.patch} |   40 +-
 .../ltp/{ltp_20150420.bb => ltp_20150903.bb}       |   14 +-
 meta/recipes-extended/mailx/mailx_12.5-5.bb        |    9 +
 meta/recipes-extended/mc/mc_4.7.5.2.bb             |    2 -
 .../mc/{mc_4.8.14.bb => mc_4.8.15.bb}              |    7 +-
 .../mdadm/files/mdadm-fix-ptest-build-errors.patch |   50 +
 meta/recipes-extended/mdadm/mdadm_3.3.4.bb         |    3 +-
 meta/recipes-extended/minicom/minicom_2.7.bb       |    2 +
 meta/recipes-extended/mktemp/mktemp_1.7.bb         |    2 +-
 .../net-tools/net-tools_1.60-26.bb                 |    8 +
 .../newt/libnewt-python_0.52.18.bb                 |    1 -
 ...upport-for-defining-missing-funcitonality.patch |   68 ++
 .../pam/libpam/include_paths_header.patch          |   59 +
 meta/recipes-extended/pam/libpam_1.2.1.bb          |    9 +-
 meta/recipes-extended/pbzip2/pbzip2_1.1.12.bb      |    2 +
 .../procps/procps/fix-configure.patch              |   19 -
 .../procps/{procps_3.3.10.bb => procps_3.3.11.bb}  |    7 +-
 meta/recipes-extended/quota/quota_4.02.bb          |    3 +
 .../rpcbind/rpcbind/cve-2015-7236.patch            |   83 ++
 .../rpcbind/rpcbind/musl-sunrpc.patch              |    1 +
 .../rpcbind/rpcbind/rpcbind.service                |    2 +-
 meta/recipes-extended/rpcbind/rpcbind_0.2.3.bb     |    1 +
 meta/recipes-extended/slang/slang_2.2.4.bb         |    4 +-
 ...rrect-path-to-init.d-and-tmpfiles.d-files.patch |   31 -
 .../sudo/{sudo_1.8.14p3.bb => sudo_1.8.15.bb}      |    8 +-
 meta/recipes-extended/sysklogd/sysklogd.inc        |    5 +
 meta/recipes-extended/sysstat/sysstat.inc          |    3 +-
 meta/recipes-extended/texinfo/texinfo_6.0.bb       |    2 +-
 meta/recipes-extended/unzip/unzip_6.0.bb           |    4 +
 .../watchdog/watchdog/watchdog-conf.patch          |    3 +
 .../watchdog/watchdog/watchdog-init.patch          |    3 +
 meta/recipes-extended/watchdog/watchdog_5.14.bb    |    3 +
 .../wget/{wget_1.16.3.bb => wget_1.17.bb}          |    4 +-
 .../xdg-utils/0001-Reinstate-xdg-terminal.patch    |  665 +----------
 .../{xdg-utils_1.1.0-rc1.bb => xdg-utils_1.1.1.bb} |    7 +-
 meta/recipes-extended/xinetd/xinetd_2.3.15.bb      |    3 +
 meta/recipes-extended/zip/zip_3.0.bb               |    3 +
 meta/recipes-gnome/epiphany/epiphany_3.16.3.bb     |    3 +-
 meta/recipes-gnome/gcr/gcr_3.16.0.bb               |    4 +-
 ...ps-Be-more-careful-about-integer-overflow.patch |   89 --
 .../{gdk-pixbuf_2.30.8.bb => gdk-pixbuf_2.32.1.bb} |   13 +-
 .../gnome-desktop/gnome-desktop3_3.16.2.bb         |    2 +-
 .../Create-symlinks-when-installing-cursors.patch  |  178 ---
 ...me_3.16.2.1.bb => adwaita-icon-theme_3.18.0.bb} |    7 +-
 meta/recipes-gnome/gnome/gconf_3.2.6.bb            |    1 -
 ...ome-common_3.14.0.bb => gnome-common_3.18.0.bb} |    4 +-
 ...16.1.bb => gsettings-desktop-schemas_3.18.1.bb} |    5 +-
 meta/recipes-gnome/gtk+/gtk+.inc                   |   11 +-
 meta/recipes-gnome/gtk+/gtk+3.inc                  |   14 +-
 .../gtk+/{gtk+3_3.16.6.bb => gtk+3_3.18.2.bb}      |    4 +-
 ...e_3.16.6.bb => gtk-icon-utils-native_3.18.2.bb} |    6 +-
 .../gtk-engines/gtk-engines_2.20.2.bb              |    5 +-
 meta/recipes-gnome/libgudev/libgudev_230.bb        |   15 +
 .../{librsvg_2.40.10.bb => librsvg_2.40.11.bb}     |    7 +-
 meta/recipes-gnome/libsecret/libsecret_0.18.2.bb   |    2 +-
 meta/recipes-graphics/cairo/cairo_1.14.4.bb        |    2 +
 meta/recipes-graphics/clutter/clutter-1.0.inc      |    5 +-
 ...clutter-1.0_1.22.4.bb => clutter-1.0_1.24.2.bb} |    5 +-
 meta/recipes-graphics/clutter/clutter-gst-3.0.inc  |    5 +-
 ...-gst-3.0_3.0.8.bb => clutter-gst-3.0_3.0.14.bb} |    4 +-
 meta/recipes-graphics/clutter/clutter-gtk-1.0.inc  |    2 +-
 .../clutter/clutter-gtk-1.0_1.6.2.bb               |    6 -
 .../clutter/clutter-gtk-1.0_1.6.6.bb               |    6 +
 meta/recipes-graphics/cogl/cogl-1.0.inc            |    2 +-
 .../cogl-framebuffer-gl-Work-again-on-GLESv2.patch |   41 -
 meta/recipes-graphics/cogl/cogl-1.0_1.20.0.bb      |    8 -
 meta/recipes-graphics/cogl/cogl-1.0_1.22.0.bb      |    5 +
 meta/recipes-graphics/directfb/directfb.inc        |   10 +-
 meta/recipes-graphics/glew/glew_1.12.0.bb          |    3 +
 .../{harfbuzz_1.0.2.bb => harfbuzz_1.1.2.bb}       |    7 +-
 .../libsdl/libsdl-1.2.15/configure_tweak.patch     | 1111 ------------------
 meta/recipes-graphics/libsdl/libsdl_1.2.15.bb      |   38 +-
 meta/recipes-graphics/libsdl2/libsdl2_2.0.3.bb     |    4 +-
 .../menu-cache/menu-cache_1.0.0.bb                 |    2 +
 ...mplement-with-AC_WITH-glut-so-that-withou.patch |    3 +
 meta/recipes-graphics/mesa/mesa.inc                |    7 +-
 meta/recipes-graphics/mx/mx-1.0_1.4.7.bb           |    3 +
 .../packagegroups/packagegroup-core-directfb.bb    |    1 -
 meta/recipes-graphics/pango/pango.inc              |   65 +-
 .../pango/pango/multilib-fix-clean.patch           |   75 --
 meta/recipes-graphics/pango/pango_1.36.8.bb        |   10 -
 meta/recipes-graphics/pango/pango_1.38.1.bb        |    9 +
 meta/recipes-graphics/piglit/piglit_git.bb         |    2 -
 meta/recipes-graphics/tslib/tslib_1.1.bb           |    2 +-
 meta/recipes-graphics/waffle/waffle_1.5.1.bb       |    2 +
 meta/recipes-graphics/wayland/libinput_0.21.0.bb   |    1 -
 meta/recipes-graphics/wayland/weston-init.bb       |   13 +-
 .../wayland/weston-init/weston.service             |   15 +
 .../weston/disable-wayland-scanner-pkg-check.patch |   17 -
 meta/recipes-graphics/wayland/weston_1.8.0.bb      |    2 +
 meta/recipes-graphics/x11vnc/x11vnc_0.9.13.bb      |    3 +
 .../xorg-app/{xinput_1.6.1.bb => xinput_1.6.2.bb}  |    6 +-
 .../{xkbcomp_1.3.0.bb => xkbcomp_1.3.1.bb}         |    4 +-
 ...t-evdev_2.9.2.bb => xf86-input-evdev_2.10.0.bb} |    4 +-
 ...tics_1.8.2.bb => xf86-input-synaptics_1.8.3.bb} |    6 +-
 ...put_dpms-Replace-logical-with-bitwise-ope.patch |   31 -
 ...ideo-omap_0.4.3.bb => xf86-video-omap_0.4.4.bb} |    6 +-
 .../xorg-driver/xf86-video-omapfb_git.bb           |    3 +
 .../xorg-driver/xf86-video-vmware_13.1.0.bb        |    3 +-
 .../xorg-driver/xorg-driver-common.inc             |    1 -
 .../xorg-driver/xorg-driver-input.inc              |    5 +-
 .../xorg-lib/{libxcb.inc => libxcb_1.11.1.bb}      |   13 +-
 meta/recipes-graphics/xorg-lib/libxcb_1.11.bb      |   10 -
 meta/recipes-graphics/xorg-lib/libxcb_git.bb       |   10 -
 .../xorg-lib/{libxi_1.7.4.bb => libxi_1.7.5.bb}    |    4 +-
 .../xorg-lib/libxkbcommon_0.5.0.bb                 |    2 +
 ...0001-v3-test-add-a-check-for-FE_DIVBYZERO.patch |    2 +-
 .../{pixman_0.32.6.bb => pixman_0.32.8.bb}         |    4 +-
 ...ard-config_2.15.bb => xkeyboard-config_2.16.bb} |    4 +-
 .../recipes-graphics/xorg-xserver/xserver-xorg.inc |    8 +-
 ...e-__GLIBC__-guard-for-glibc-specific-code.patch |   31 -
 ....ac-Use-libsystemd-in-REQUIRED_LIBS-check.patch |   50 +
 ...erver-xorg_1.17.2.bb => xserver-xorg_1.18.0.bb} |    7 +-
 .../xvideo-tests/xvideo-tests_git.bb               |    2 +-
 .../recipes-kernel/blktrace/blktrace/ldflags.patch |   23 +-
 .../cryptodev/cryptodev-tests_1.7.bb               |    1 -
 meta/recipes-kernel/kexec/kexec-tools.inc          |    5 +-
 meta/recipes-kernel/kexec/kexec-tools/kdump        |  163 +++
 meta/recipes-kernel/kexec/kexec-tools/kdump.conf   |   18 +
 meta/recipes-kernel/kexec/kexec-tools_2.0.10.bb    |    8 +
 .../latencytop-0.5/latencytop-makefile.patch       |    2 +-
 meta/recipes-kernel/libpfm/libpfm4_4.6.0.bb        |    2 +
 .../linux-firmware/linux-firmware_git.bb           |   46 +-
 .../linux-libc-headers/linux-libc-headers.inc      |    5 +-
 .../linux-libc-headers/linux-libc-headers_4.1.bb   |    3 -
 meta/recipes-kernel/linux/linux-yocto-rt_4.1.bb    |    6 +-
 meta/recipes-kernel/linux/linux-yocto-tiny_4.1.bb  |    6 +-
 meta/recipes-kernel/linux/linux-yocto.inc          |    2 +
 meta/recipes-kernel/linux/linux-yocto_4.1.bb       |   20 +-
 .../{babeltrace_1.2.4.bb => babeltrace_1.3.1.bb}   |    5 +-
 meta/recipes-kernel/lttng/lttng-modules_git.bb     |    8 +-
 ...-sessiond-disable-match-app-event-by-name.patch |   58 -
 ...d-look-for-python-3.0-when-building-pytho.patch |   30 +
 .../lttng/lttng-tools/extern-decls.patch           |  442 --------
 ...ng-tools-Fix-live-timer-calculation-error.patch |   42 -
 .../recipes-kernel/lttng/lttng-tools/runtest.patch |   52 -
 .../lttng/lttng-tools/stop-using-SIGUNUSED.patch   |   51 +
 .../{lttng-tools_2.6.0.bb => lttng-tools_git.bb}   |   19 +-
 ...ttng-ust-Fix-live-timer-calculation-error.patch |   42 -
 meta/recipes-kernel/lttng/lttng-ust_git.bb         |   10 +-
 meta/recipes-kernel/perf/perf.bb                   |    1 -
 .../powertop/{powertop_2.7.bb => powertop_2.8.bb}  |    6 +-
 .../sysprof/files/gui-argument.patch               |   35 +
 meta/recipes-kernel/sysprof/sysprof_git.bb         |    9 +-
 .../systemtap/systemtap-uprobes_git.bb             |    2 -
 meta/recipes-kernel/systemtap/systemtap_git.bb     |    2 -
 meta/recipes-kernel/systemtap/systemtap_git.inc    |    4 +-
 meta/recipes-kernel/trace-cmd/trace-cmd_git.bb     |    2 -
 .../{libpng12_1.2.53.bb => libpng12_1.2.55.bb}     |   13 +-
 meta/recipes-multimedia/alsa/alsa-lib_1.0.29.bb    |    1 -
 .../recipes-multimedia/alsa/alsa-plugins_1.0.29.bb |    2 -
 .../gstreamer/gst-plugins-package.inc              |    1 -
 .../gstreamer/gstreamer1.0-libav.inc               |    3 +-
 .../gstreamer/gstreamer1.0-libav_1.6.1.bb          |    3 +
 .../gstreamer/gstreamer1.0-omx.inc                 |    1 -
 .../gstreamer/gstreamer1.0-plugins-bad.inc         |   10 +-
 .../gstreamer/gstreamer1.0-plugins-base.inc        |    4 +-
 .../gstreamer/gstreamer1.0-plugins-good.inc        |    8 +-
 .../gstreamer/gstreamer1.0-plugins.inc             |    2 +-
 .../gstreamer/gstreamer1.0-rtsp-server.inc         |    2 +-
 meta/recipes-multimedia/gstreamer/gstreamer1.0.inc |   12 +-
 .../gstreamer/gstreamer1.0/fix-install-hook.patch  |   48 +
 .../gstreamer/gstreamer1.0_1.6.1.bb                |    1 +
 meta/recipes-multimedia/liba52/liba52_0.7.4.bb     |    3 +
 meta/recipes-multimedia/libav/libav.inc            |   23 +-
 meta/recipes-multimedia/libomxil/libomxil_0.9.3.bb |    2 -
 .../libpng/{libpng_1.6.17.bb => libpng_1.6.20.bb}  |   12 +-
 .../libsamplerate/libsamplerate0_0.1.8.bb          |    3 +
 ...src-sd2.c-Fix-segfault-in-SD2-RSRC-parser.patch |  211 ----
 ...c-Fix-two-potential-buffer-read-overflows.patch |   49 -
 ...libsndfile1_1.0.25.bb => libsndfile1_1.0.26.bb} |   10 +-
 .../libtheora/libtheora_1.1.1.bb                   |    2 +
 meta/recipes-multimedia/libtiff/tiff_4.0.4.bb      |    3 +
 meta/recipes-multimedia/mpeg2dec/mpeg2dec_0.4.1.bb |    2 +
 meta/recipes-multimedia/pulseaudio/pulseaudio.inc  |    2 -
 .../0001-card-add-pa_card_profile.ports.patch      |  245 ++++
 ...oth-fail-if-user-requested-profile-doesn-.patch |   60 +
 ...-move-profile-selection-after-pa_card_new.patch |  363 ++++++
 ...vailability-for-some-unavailable-profiles.patch |   75 ++
 .../pulseaudio/pulseaudio_6.0.bb                   |    4 +
 meta/recipes-multimedia/webp/libwebp_0.4.3.bb      |    2 +
 meta/recipes-qt/qt-apps/qmmp_0.8.6.bb              |    4 -
 meta/recipes-qt/qt-apps/quicky_0.4.bb              |    2 +
 meta/recipes-qt/qt4/nativesdk-qt4-tools.inc        |    3 +
 meta/recipes-qt/qt4/qt4-4.8.7.inc                  |    4 +
 .../qt4/qt4-4.8.7/fix-for-mips-n32.patch           |   38 +
 meta/recipes-qt/qt4/qt4-native.inc                 |    4 +
 meta/recipes-qt/qt4/qt4.inc                        |    1 +
 .../{hwlatdetect_0.94.bb => hwlatdetect_0.96.bb}   |    2 +-
 meta/recipes-rt/rt-tests/rt-tests.inc              |    6 +-
 .../{rt-tests_0.94.bb => rt-tests_0.96.bb}         |    0
 meta/recipes-sato/gtk-engines/gtk-sato-engine.inc  |    1 -
 .../matchbox-keyboard/matchbox-keyboard_git.bb     |    2 -
 .../matchbox-panel-2/matchbox-panel-2_git.bb       |    1 -
 meta/recipes-sato/pcmanfm/pcmanfm_1.2.3.bb         |    2 +
 .../fix-compiling-failure-with-option-g-O.patch    |    9 -
 meta/recipes-sato/puzzles/oh-puzzles_git.bb        |    1 -
 meta/recipes-sato/puzzles/puzzles_git.bb           |    9 +-
 .../sato-screenshot/sato-screenshot_git.bb         |    1 -
 meta/recipes-sato/webkit/webkitgtk_2.8.5.bb        |    4 +-
 meta/recipes-support/apr/apr-util_1.5.4.bb         |    3 +-
 ...n-fix-LTFLAGS-to-make-it-work-with-ccache.patch |   36 +
 meta/recipes-support/apr/apr_1.5.2.bb              |    1 +
 meta/recipes-support/aspell/aspell_0.60.6.1.bb     |    1 -
 ...at-spi2-atk_2.16.0.bb => at-spi2-atk_2.18.1.bb} |    7 +-
 ...-spi2-core_2.16.0.bb => at-spi2-core_2.18.1.bb} |    6 +-
 .../atk/{atk_2.16.0.bb => atk_2.18.0.bb}           |    6 +-
 meta/recipes-support/attr/attr.inc                 |    4 +-
 meta/recipes-support/attr/attr_2.4.47.bb           |    4 +-
 .../attr/files/dont-use-decl-macros.patch          |   56 +
 meta/recipes-support/boost/boost.inc               |    6 +-
 .../recipes-support/consolekit/consolekit_0.4.6.bb |    1 -
 .../curl/{curl_7.44.0.bb => curl_7.45.0.bb}        |    4 +-
 ...Makefile-let-libdb-6.0.la-depend-os_map.l.patch |   32 +
 meta/recipes-support/db/db_6.0.30.bb               |    5 +
 meta/recipes-support/gdbm/gdbm_1.8.3.bb            |    1 +
 meta/recipes-support/gmp/gmp-6.0.0/configure.patch |  222 ----
 .../gmp/gmp-6.0.0/gmp-6.0.0-ppc64.patch            |   26 -
 ...ser-provided-flags-to-the-auto-detected-.patch} |   39 +-
 .../gmp/{gmp-6.0.0 => gmp-6.1.0}/amd64.patch       |    0
 .../{gmp-6.0.0 => gmp-6.1.0}/use-includedir.patch  |    0
 .../gmp/{gmp_6.0.0.bb => gmp_6.1.0.bb}             |   17 +-
 meta/recipes-support/gnupg/gnupg_1.4.7.bb          |    1 -
 meta/recipes-support/gnutls/gnutls.inc             |    3 +-
 ...tch => 0001-configure.ac-fix-sed-command.patch} |   29 +-
 .../gnutls/{gnutls_3.3.17.1.bb => gnutls_3.4.7.bb} |    6 +-
 .../gnutls/{libtasn1_4.5.bb => libtasn1_4.7.bb}    |    4 +-
 .../icu/icu/icu-release-56-1-flagparser-fix.patch  |   24 +
 .../icu/{icu_55.1.bb => icu_56.1.bb}               |    9 +-
 .../libbsd/0001-Use-local-SHA512-header.patch      |   75 ++
 .../libbsd/{libbsd_0.7.0.bb => libbsd_0.8.0.bb}    |   11 +-
 meta/recipes-support/libcap-ng/libcap-ng_0.7.7.bb  |    1 -
 meta/recipes-support/libcap/libcap_2.24.bb         |    1 -
 .../{libcroco_0.6.8.bb => libcroco_0.6.9.bb}       |    4 +-
 meta/recipes-support/libevent/libevent_2.0.22.bb   |    2 +
 meta/recipes-support/libfm/libfm_1.2.3.bb          |    1 -
 .../Depend-on-headers-to-fix-parallel-build.patch  |   46 +
 .../libical/libical/Fix-x32-ABI-build.patch        |   38 +
 .../libical/Remove-cmake-check-for-Perl.patch      |   33 +
 .../libical/{libical_1.0.0.bb => libical_1.0.1.bb} |   14 +-
 meta/recipes-support/libmpc/libmpc_1.0.3.bb        |    2 +
 meta/recipes-support/libnl/libnl_3.2.25.bb         |    1 -
 .../libpcre/{libpcre_8.37.bb => libpcre_8.38.bb}   |    6 +-
 meta/recipes-support/libproxy/libproxy_0.4.11.bb   |    1 -
 ...libsoup-2.4_2.50.0.bb => libsoup-2.4_2.52.1.bb} |    8 +-
 ...libunistring_0.9.5.bb => libunistring_0.9.6.bb} |    4 +-
 ...Add-AO_REQUIRE_CAS-to-fix-build-on-ARM-v6.patch |   62 +
 meta/recipes-support/libunwind/libunwind_1.1.bb    |    5 +
 meta/recipes-support/libusb/libusb-compat_0.1.5.bb |    3 +
 meta/recipes-support/libusb/libusb1/no-dll.patch   |   19 +
 .../{libusb1_1.0.19.bb => libusb1_1.0.20.bb}       |    5 +-
 meta/recipes-support/libxslt/libxslt_1.1.28.bb     |    5 +-
 meta/recipes-support/mpfr/mpfr_3.1.3.bb            |    2 +
 meta/recipes-support/nettle/nettle.inc             |    2 +
 .../nspr/{nspr_4.10.8.bb => nspr_4.11.bb}          |   10 +-
 meta/recipes-support/nss/nss_3.19.2.bb             |    4 +-
 meta/recipes-support/p11-kit/p11-kit_0.22.1.bb     |    4 +-
 ...ed-mime-info_1.4.bb => shared-mime-info_1.5.bb} |    4 +-
 .../sqlite/{sqlite3_3.9.0.bb => sqlite3_3.9.2.bb}  |    8 +-
 meta/recipes-support/taglib/taglib_1.9.1.bb        |    2 +
 meta/recipes-support/vte/vte.inc                   |    4 +-
 meta/site/common-linux                             |    4 +
 scripts/bitbake-prserv-tool                        |    9 +
 ...te-manifest-3.4.py => generate-manifest-3.5.py} |    2 +-
 scripts/create-pull-request                        |    8 +
 scripts/devtool                                    |    7 +-
 scripts/gen-lockedsig-cache                        |   13 +-
 .../linux/files/machine-preempt-rt.scc             |    3 +-
 .../linux/files/machine-standard.scc               |    3 +-
 .../recipes-kernel/linux/files/machine-tiny.scc    |    3 +-
 .../recipes-kernel/linux/linux-yocto-dev.bbappend  |    1 -
 .../linux/linux-yocto-rt_3.14.bbappend             |    6 +-
 .../linux/linux-yocto-tiny_3.14.bbappend           |    6 +-
 .../linux/linux-yocto-tiny_3.19.bbappend           |    6 +-
 .../linux/linux-yocto-tiny_4.1.bbappend            |    6 +-
 .../recipes-kernel/linux/linux-yocto_3.14.bbappend |    7 +-
 .../recipes-kernel/linux/linux-yocto_3.19.bbappend |    7 +-
 ...-yocto_4.1.bbapend => linux-yocto_4.1.bbappend} |    7 +-
 .../linux/files/machine-preempt-rt.scc             |    3 +-
 .../linux/files/machine-standard.scc               |    3 +-
 .../recipes-kernel/linux/files/machine-tiny.scc    |    3 +-
 .../recipes-kernel/linux/linux-yocto-dev.bbappend  |    1 -
 .../linux/linux-yocto-rt_3.14.bbappend             |    6 +-
 .../linux/linux-yocto-tiny_3.14.bbappend           |    6 +-
 .../linux/linux-yocto-tiny_3.19.bbappend           |    6 +-
 .../linux/linux-yocto-tiny_4.1.bbappend            |    6 +-
 .../recipes-kernel/linux/linux-yocto_3.14.bbappend |    7 +-
 .../recipes-kernel/linux/linux-yocto_3.19.bbappend |    7 +-
 .../recipes-kernel/linux/linux-yocto_4.1.bbappend  |    7 +-
 .../linux/files/machine-preempt-rt.scc             |    3 +-
 .../linux/files/machine-standard.scc               |    3 +-
 .../recipes-kernel/linux/files/machine-tiny.scc    |    3 +-
 .../recipes-kernel/linux/linux-yocto-dev.bbappend  |    1 -
 .../linux/linux-yocto-rt_3.14.bbappend             |    6 +-
 .../linux/linux-yocto-tiny_3.14.bbappend           |    6 +-
 .../linux/linux-yocto-tiny_3.19.bbappend           |    6 +-
 .../linux/linux-yocto-tiny_4.1.bbappend            |    6 +-
 .../recipes-kernel/linux/linux-yocto_3.14.bbappend |    7 +-
 .../recipes-kernel/linux/linux-yocto_3.19.bbappend |    7 +-
 .../recipes-kernel/linux/linux-yocto_4.1.bbappend  |    7 +-
 .../linux/files/machine-preempt-rt.scc             |    3 +-
 .../linux/files/machine-standard.scc               |    3 +-
 .../recipes-kernel/linux/files/machine-tiny.scc    |    3 +-
 .../recipes-kernel/linux/linux-yocto-dev.bbappend  |    1 -
 .../linux/linux-yocto-rt_3.14.bbappend             |    6 +-
 .../linux/linux-yocto-tiny_3.14.bbappend           |    6 +-
 .../linux/linux-yocto-tiny_3.19.bbappend           |    6 +-
 .../linux/linux-yocto-tiny_4.1.bbappend            |    6 +-
 .../recipes-kernel/linux/linux-yocto_3.14.bbappend |    5 +-
 .../recipes-kernel/linux/linux-yocto_3.19.bbappend |    7 +-
 .../recipes-kernel/linux/linux-yocto_4.1.bbappend  |    7 +-
 .../linux/files/machine-preempt-rt.scc             |    3 +-
 .../linux/files/machine-standard.scc               |    3 +-
 .../recipes-kernel/linux/files/machine-tiny.scc    |    3 +-
 .../recipes-kernel/linux/linux-yocto-dev.bbappend  |    1 -
 .../linux/linux-yocto-rt_3.14.bbappend             |    6 +-
 .../linux/linux-yocto-tiny_3.14.bbappend           |    6 +-
 .../linux/linux-yocto-tiny_3.19.bbappend           |    6 +-
 .../linux/linux-yocto-tiny_4.1.bbappend            |    6 +-
 .../recipes-kernel/linux/linux-yocto_3.14.bbappend |    7 +-
 .../recipes-kernel/linux/linux-yocto_3.19.bbappend |    7 +-
 .../recipes-kernel/linux/linux-yocto_4.1.bbappend  |    7 +-
 .../linux/files/machine-preempt-rt.scc             |    3 +-
 .../linux/files/machine-standard.scc               |    3 +-
 .../recipes-kernel/linux/files/machine-tiny.scc    |    3 +-
 .../recipes-kernel/linux/linux-yocto-dev.bbappend  |    1 -
 .../linux/linux-yocto-rt_3.14.bbappend             |    6 +-
 .../linux/linux-yocto-tiny_3.14.bbappend           |    6 +-
 .../linux/linux-yocto-tiny_3.19.bbappend           |    6 +-
 .../linux/linux-yocto-tiny_4.1.bbappend            |    6 +-
 .../recipes-kernel/linux/linux-yocto_3.14.bbappend |    7 +-
 .../recipes-kernel/linux/linux-yocto_3.19.bbappend |    7 +-
 .../recipes-kernel/linux/linux-yocto_4.1.bbappend  |    7 +-
 .../linux/files/machine-preempt-rt.scc             |    3 +-
 .../linux/files/machine-standard.scc               |    3 +-
 .../recipes-kernel/linux/files/machine-tiny.scc    |    3 +-
 .../recipes-kernel/linux/linux-yocto-dev.bbappend  |    1 -
 .../linux/linux-yocto-rt_3.14.bbappend             |    6 +-
 .../linux/linux-yocto-tiny_3.14.bbappend           |    6 +-
 .../linux/linux-yocto-tiny_3.19.bbappend           |    6 +-
 .../linux/linux-yocto-tiny_4.1.bbappend            |    6 +-
 .../recipes-kernel/linux/linux-yocto_3.14.bbappend |    7 +-
 .../recipes-kernel/linux/linux-yocto_3.19.bbappend |    7 +-
 .../recipes-kernel/linux/linux-yocto_4.1.bbappend  |    7 +-
 scripts/lib/devtool/__init__.py                    |   26 +-
 scripts/lib/devtool/build.py                       |   54 +-
 scripts/lib/devtool/package.py                     |   24 +-
 scripts/lib/devtool/sdk.py                         |    4 -
 scripts/lib/devtool/search.py                      |   79 +-
 scripts/lib/devtool/standard.py                    |  143 ++-
 scripts/lib/devtool/upgrade.py                     |  100 +-
 scripts/lib/recipetool/append.py                   |    4 +-
 scripts/lib/recipetool/create.py                   |    2 +-
 scripts/lib/recipetool/newappend.py                |    7 +-
 scripts/lib/recipetool/setvar.py                   |   75 ++
 .../canned-wks/directdisk-bootloader-config.cfg    |   11 +
 .../canned-wks/directdisk-bootloader-config.wks    |   10 +
 scripts/lib/wic/help.py                            |    6 +
 scripts/lib/wic/kickstart/__init__.py              |    7 +
 .../lib/wic/kickstart/custom_commands/partition.py |    6 +-
 .../lib/wic/kickstart/custom_commands/wicboot.py   |    5 +
 scripts/lib/wic/plugins/source/bootimg-efi.py      |   67 +-
 scripts/lib/wic/plugins/source/bootimg-pcbios.py   |   72 +-
 scripts/lib/wic/utils/misc.py                      |   39 +
 scripts/lib/wic/utils/oe/misc.py                   |   18 +-
 scripts/oe-buildenv-internal                       |    6 +-
 scripts/oe-pkgdata-util                            |    2 +-
 scripts/oe-selftest                                |  279 ++++-
 scripts/recipetool                                 |   10 +-
 scripts/runqemu-internal                           |    4 +-
 scripts/sstate-sysroot-cruft.sh                    |   21 +
 scripts/wic                                        |    4 +-
 930 files changed, 15146 insertions(+), 20355 deletions(-)
 delete mode 100644 bitbake/lib/toaster/bldcontrol/migrations/0002_auto__add_field_buildenvironment_sourcedir__add_field_buildenvironment.py
 delete mode 100644 bitbake/lib/toaster/bldcontrol/migrations/0003_auto__add_field_brlayer_dirpath.py
 delete mode 100644 bitbake/lib/toaster/bldcontrol/migrations/0004_loadinitialdata.py
 delete mode 100644 bitbake/lib/toaster/bldcontrol/migrations/0005_auto__add_brerror.py
 delete mode 100644 bitbake/lib/toaster/bldcontrol/migrations/0006_auto__add_brbitbake.py
 delete mode 100644 bitbake/lib/toaster/bldcontrol/migrations/0007_auto__add_field_buildrequest_environment__chg_field_buildrequest_build.py
 delete mode 100644 bitbake/lib/toaster/bldcontrol/migrations/0008_brarchive.py
 delete mode 100644 bitbake/lib/toaster/bldcontrol/migrations/0009_auto__add_field_brlayer_layer_version.py
 create mode 120000 bitbake/lib/toaster/contrib/tts/toasteruitest/toaster.sqlite
 create mode 120000 bitbake/lib/toaster/contrib/tts/toasteruitest/toasterconf.json
 delete mode 100644 bitbake/lib/toaster/orm/migrations/0002_auto__add_field_build_timespent.py
 delete mode 100644 bitbake/lib/toaster/orm/migrations/0003_timespent.py
 delete mode 100644 bitbake/lib/toaster/orm/migrations/0004_auto__add_field_package_installed_name.py
 delete mode 100644 bitbake/lib/toaster/orm/migrations/0005_auto__add_target_image_file__add_target_file__add_field_variablehistor.py
 delete mode 100644 bitbake/lib/toaster/orm/migrations/0006_auto__add_field_target_image_size__add_field_target_license_manifest_p.py
 delete mode 100644 bitbake/lib/toaster/orm/migrations/0007_auto__add_helptext.py
 delete mode 100644 bitbake/lib/toaster/orm/migrations/0008_auto__chg_field_variablehistory_operation__chg_field_recipe_descriptio.py
 delete mode 100644 bitbake/lib/toaster/orm/migrations/0009_auto__add_projectvariable__add_projectlayer__add_projecttarget__add_pr.py
 delete mode 100644 bitbake/lib/toaster/orm/migrations/0010_auto__add_field_project_branch__add_field_project_short_description__a.py
 delete mode 100644 bitbake/lib/toaster/orm/migrations/0011_auto__add_field_projectlayer_dirpath.py
 delete mode 100644 bitbake/lib/toaster/orm/migrations/0012_auto__add_field_projectlayer_optional__add_field_projecttarget_task.py
 delete mode 100644 bitbake/lib/toaster/orm/migrations/0013_auto__add_release__add_layerversiondependency__add_unique_layerversion.py
 delete mode 100644 bitbake/lib/toaster/orm/migrations/0014_auto__chg_field_package_summary__chg_field_layer_summary__chg_field_re.py
 delete mode 100644 bitbake/lib/toaster/orm/migrations/0015_auto__add_field_layer_vcs_web_url__add_field_layer_vcs_web_tree_base_u.py
 delete mode 100644 bitbake/lib/toaster/orm/migrations/0016_auto__add_field_release_helptext__chg_field_release_branch__add_index_.py
 delete mode 100644 bitbake/lib/toaster/orm/migrations/0017_auto__del_toastersettingdefaultlayer__add_releaselayersourcepriority__.py
 delete mode 100644 bitbake/lib/toaster/orm/migrations/0018_auto__add_field_layer_version_project.py
 delete mode 100644 bitbake/lib/toaster/orm/migrations/0019_auto__add_buildartifact.py
 delete mode 100644 bitbake/lib/toaster/orm/migrations/0020_auto__add_field_layer_version_local_path__add_field_recipe_pathflags__.py
 delete mode 100644 bitbake/lib/toaster/orm/migrations/0021_auto__chg_field_build_project__chg_field_project_bitbake_version__chg_.py
 delete mode 100644 bitbake/lib/toaster/orm/migrations/0022_auto__add_field_target_task__add_field_layer_version_local_path__del_f.py
 delete mode 100644 bitbake/lib/toaster/orm/migrations/0023_auto__del_field_build_warnings_no__del_field_build_errors_no__del_fiel.py
 delete mode 100644 bitbake/lib/toaster/orm/migrations/0024_auto__add_field_recipe_is_image.py
 delete mode 100644 bitbake/lib/toaster/orm/migrations/0025_auto__add_field_project_is_default.py
 delete mode 100644 bitbake/lib/toaster/orm/migrations/0026_set_default_project.py
 delete mode 100644 bitbake/lib/toaster/orm/migrations/0027_auto__add_customimagerecipe__add_unique_customimagerecipe_name_project.py
 delete mode 100644 bitbake/lib/toaster/orm/migrations/0028_auto__chg_field_logmessage_message.py
 create mode 100644 bitbake/lib/toaster/toastermain/management/commands/get-dburl.py
 create mode 100644 meta-selftest/files/signing/key.pub
 create mode 100644 meta-selftest/files/signing/key.secret
 create mode 100644 meta-selftest/files/signing/secret.txt
 create mode 100644 meta-yocto-bsp/recipes-bsp/gma500-gfx-check/gma500-gfx-check/gma500-gfx-check.conf
 create mode 100644 meta-yocto-bsp/recipes-bsp/gma500-gfx-check/gma500-gfx-check/gma500-gfx-check.sh
 create mode 100644 meta-yocto-bsp/recipes-bsp/gma500-gfx-check/gma500-gfx-check_1.0.bb
 create mode 100644 meta/classes/nopackages.bbclass
 create mode 100644 meta/classes/upstream-version-is-even.bbclass
 create mode 100644 meta/lib/oeqa/selftest/signing.py
 create mode 100644 meta/lib/oeqa/utils/testexport.py
 rename meta/recipes-bsp/u-boot/{u-boot-fw-utils_2015.07.bb => u-boot-fw-utils_2015.10.bb} (91%)
 rename meta/recipes-bsp/u-boot/{u-boot-mkimage_2015.07.bb => u-boot-mkimage_2015.10.bb} (84%)
 rename meta/recipes-bsp/u-boot/u-boot/{0001-u-boot-mpc85xx-u-boot-.lds-remove-_GLOBAL_OFFSET_TAB.patch => 0001-powerpc-cpu-u-boot-.lds-remove-_GLOBAL_OFFSET_TABLE_.patch} (96%)
 create mode 100644 meta/recipes-bsp/u-boot/u-boot/0002-image.c-Fix-non-Android-booting-with-ramdisk-and-or-.patch
 create mode 100644 meta/recipes-bsp/u-boot/u-boot/0003-common-board_f-enable-setup_board_part1-for-MIPS.patch
 create mode 100644 meta/recipes-bsp/u-boot/u-boot/0004-MIPS-bootm-rework-and-fix-broken-bootm-code.patch
 create mode 100644 meta/recipes-bsp/u-boot/u-boot/0005-MIPS-bootm-use-CONFIG_IS_ENABLED-everywhere.patch
 create mode 100644 meta/recipes-bsp/u-boot/u-boot/0006-Replace-extern-inline-with-static-inline.patch
 delete mode 100644 meta/recipes-bsp/u-boot/u-boot_2015.07.bb
 create mode 100644 meta/recipes-bsp/u-boot/u-boot_2015.10.bb
 create mode 100644 meta/recipes-connectivity/bluez5/bluez5/core-profile-Fix-possible-crash-when-registering-pro.patch
 create mode 100644 meta/recipes-connectivity/bluez5/bluez5/init
 rename meta/recipes-connectivity/bluez5/{bluez5_5.33.bb => bluez5_5.36.bb} (88%)
 rename meta/recipes-connectivity/iproute2/{iproute2_4.1.1.bb => iproute2_4.3.0.bb} (68%)
 rename meta/recipes-connectivity/iw/{iw_4.1.bb => iw_4.3.bb} (86%)
 rename meta/recipes-connectivity/libpcap/{libpcap_1.6.2.bb => libpcap_1.7.4.bb} (82%)
 rename meta/recipes-connectivity/nfs-utils/{nfs-utils_1.3.1.bb => nfs-utils_1.3.3.bb} (95%)
 delete mode 100644 meta/recipes-connectivity/ofono/ofono/0001-backtrace-Disable-for-non-glibc-C-libraries.patch
 rename meta/recipes-connectivity/ofono/{ofono_1.16.bb => ofono_1.17.bb} (49%)
 create mode 100644 meta/recipes-connectivity/openssl/openssl/configure-musl-target.patch
 rename meta/recipes-connectivity/openssl/{openssl_1.0.2d.bb => openssl_1.0.2e.bb} (68%)
 delete mode 100755 meta/recipes-connectivity/wireless-tools/wireless-tools/wireless-tools.if-pre-up
 delete mode 100644 meta/recipes-connectivity/wireless-tools/wireless-tools/zzz-wireless.if-pre-up
 delete mode 100644 meta/recipes-connectivity/wpa-supplicant/wpa-supplicant/0001-AP-WMM-Fix-integer-underflow-in-WMM-Action-frame-par.patch
 delete mode 100644 meta/recipes-connectivity/wpa-supplicant/wpa-supplicant/0001-EAP-pwd-peer-Fix-payload-length-validation-for-Commi.patch
 delete mode 100644 meta/recipes-connectivity/wpa-supplicant/wpa-supplicant/0001-P2P-Validate-SSID-element-length-before-copying-it-C.patch
 delete mode 100644 meta/recipes-connectivity/wpa-supplicant/wpa-supplicant/0001-WPS-Fix-HTTP-chunked-transfer-encoding-parser.patch
 delete mode 100644 meta/recipes-connectivity/wpa-supplicant/wpa-supplicant/0002-EAP-pwd-server-Fix-payload-length-validation-for-Com.patch
 delete mode 100644 meta/recipes-connectivity/wpa-supplicant/wpa-supplicant/0003-EAP-pwd-peer-Fix-Total-Length-parsing-for-fragment-r.patch
 delete mode 100644 meta/recipes-connectivity/wpa-supplicant/wpa-supplicant/0004-EAP-pwd-server-Fix-Total-Length-parsing-for-fragment.patch
 delete mode 100644 meta/recipes-connectivity/wpa-supplicant/wpa-supplicant/0005-EAP-pwd-peer-Fix-asymmetric-fragmentation-behavior.patch
 rename meta/recipes-connectivity/wpa-supplicant/{wpa-supplicant_2.4.bb => wpa-supplicant_2.5.bb} (77%)
 delete mode 100644 meta/recipes-core/busybox/busybox/0001-Switch-to-POSIX-utmpx-API.patch
 delete mode 100644 meta/recipes-core/busybox/busybox/0001-chown-fix-help-text.patch
 delete mode 100644 meta/recipes-core/busybox/busybox/0001-ifconfig-fix-double-free-fatal-error-in-INET_sprint.patch
 create mode 100644 meta/recipes-core/busybox/busybox/busybox-1.24.1-unzip-regression.patch
 create mode 100644 meta/recipes-core/busybox/busybox/busybox-1.24.1-unzip.patch
 create mode 100644 meta/recipes-core/busybox/busybox/musl.cfg
 create mode 100644 meta/recipes-core/busybox/busybox/resize.cfg
 rename meta/recipes-core/busybox/{busybox_1.23.2.bb => busybox_1.24.1.bb} (70%)
 delete mode 100644 meta/recipes-core/dbus/dbus.inc
 delete mode 100644 meta/recipes-core/dropbear/dropbear_2015.68.bb
 create mode 100644 meta/recipes-core/dropbear/dropbear_2015.71.bb
 create mode 100644 meta/recipes-core/glib-2.0/glib-2.0/0001-gio-tests-Don-t-depend-on-a-data-file-that-s-not-bui.patch
 create mode 100644 meta/recipes-core/glib-2.0/glib-2.0/Enable-more-tests-while-cross-compiling.patch
 rename meta/recipes-core/glib-2.0/{glib-2.0_2.44.1.bb => glib-2.0_2.46.1.bb} (73%)
 rename meta/recipes-core/glib-networking/{glib-networking_2.44.0.bb => glib-networking_2.46.1.bb} (83%)
 create mode 100644 meta/recipes-core/glibc/glibc/0029-fix-getmntent-empty-lines.patch
 create mode 100644 meta/recipes-core/glibc/glibc/strcoll-Remove-incorrect-STRDIFF-based-optimization-.patch
 delete mode 100644 meta/recipes-core/kbd/kbd/0003-Only-inluclude-kernel-headers-with-glibc.patch
 rename meta/recipes-core/kbd/{kbd_2.0.2.bb => kbd_2.0.3.bb} (83%)
 delete mode 100644 meta/recipes-core/libxml/libxml2/0001-CVE-2015-1819-Enforce-the-reader-to-run-in-constant-.patch
 delete mode 100644 meta/recipes-core/libxml/libxml2/0001-threads-Define-pthread-definitions-for-glibc-complia.patch
 delete mode 100644 meta/recipes-core/libxml/libxml2/72a46a519ce7326d9a00f0b6a7f2a8e958cd1675.patch
 delete mode 100644 meta/recipes-core/libxml/libxml2/libxml2-CVE-2014-0191-fix.patch
 delete mode 100644 meta/recipes-core/libxml/libxml2_2.9.2.bb
 rename meta/recipes-core/libxml/{libxml2.inc => libxml2_2.9.3.bb} (83%)
 create mode 100644 meta/recipes-core/meta/buildtools-with-tc.bb
 create mode 100644 meta/recipes-core/musl/musl.inc
 create mode 100644 meta/recipes-core/musl/musl_git.bb
 delete mode 100644 meta/recipes-core/psplash/files/0001-psplash-fb-Convert-psplash_fb_plot_pixel-to-a-static.patch
 rename meta/recipes-core/readline/{files => readline-6.3}/norpath.patch (100%)
 delete mode 100644 meta/recipes-core/readline/readline-6.3/readline-cve-2014-2524.patch
 delete mode 100644 meta/recipes-core/readline/readline-6.3/readline-dispatch-multikey.patch
 create mode 100644 meta/recipes-core/systemd/systemd/0001-define-exp10-if-missing.patch
 delete mode 100644 meta/recipes-core/systemd/systemd/0001-fix-build-on-uClibc-exp10.patch
 rename meta/recipes-core/systemd/systemd/{0001-units-Prefer-getty-to-agetty-in-console-setup-system.patch => 0002-units-Prefer-getty-to-agetty-in-console-setup-system.patch} (89%)
 rename meta/recipes-core/systemd/systemd/{0022-Use-getenv-when-secure-versions-are-not-available.patch => 0003-Use-getenv-when-secure-versions-are-not-available.patch} (77%)
 rename meta/recipes-core/systemd/systemd/{qemuall_io_latency-core-device.c-Change-the-default-device-timeout-to-2.patch => 0004-core-device.c-Change-the-default-device-timeout-to-2.patch} (65%)
 rename meta/recipes-core/systemd/systemd/{0003-binfmt-Don-t-install-dependency-links-at-install-tim.patch => 0005-binfmt-Don-t-install-dependency-links-at-install-tim.patch} (65%)
 rename meta/recipes-core/systemd/systemd/{0004-configure-Check-for-additional-features-that-uclibc-.patch => 0006-configure-Check-for-additional-features-that-uclibc-.patch} (76%)
 delete mode 100644 meta/recipes-core/systemd/systemd/0006-journal-Use-posix-fallocate-only-if-available.patch
 rename meta/recipes-core/systemd/systemd/{0005-nspawn-Use-execvpe-only-when-libc-supports-it.patch => 0007-nspawn-Use-execvpe-only-when-libc-supports-it.patch} (50%)
 delete mode 100644 meta/recipes-core/systemd/systemd/0007-util-Use-mkostemp-only-if-libc-supports-it.patch
 rename meta/recipes-core/systemd/systemd/{0012-implment-systemd-sysv-install-for-OE.patch => 0009-implment-systemd-sysv-install-for-OE.patch} (75%)
 create mode 100644 meta/recipes-core/systemd/systemd/0010-nss-mymachines-Build-conditionally-when-HAVE_MYHOSTN.patch
 rename meta/recipes-core/systemd/systemd/{rules-whitelist-hd-devices.patch => 0011-rules-whitelist-hd-devices.patch} (90%)
 rename meta/recipes-core/systemd/systemd/{0009-sysv-generator-add-support-for-executing-scripts-und.patch => 0012-sysv-generator-add-support-for-executing-scripts-und.patch} (77%)
 rename meta/recipes-core/systemd/systemd/{0010-Make-root-s-home-directory-configurable.patch => 0013-Make-root-s-home-directory-configurable.patch} (64%)
 rename meta/recipes-core/systemd/systemd/{0011-systemd-user-avoid-using-system-auth.patch => 0014-systemd-user-avoid-using-system-auth.patch} (54%)
 rename meta/recipes-core/systemd/systemd/{0014-Revert-rules-remove-firmware-loading-rules.patch => 0015-Revert-rules-remove-firmware-loading-rules.patch} (83%)
 rename meta/recipes-core/systemd/systemd/{0015-Revert-udev-remove-userspace-firmware-loading-suppor.patch => 0016-Revert-udev-remove-userspace-firmware-loading-suppor.patch} (79%)
 rename meta/recipes-core/systemd/{systemd_225.bb => systemd_228.bb} (90%)
 create mode 100644 meta/recipes-core/sysvinit/sysvinit-inittab/start_getty
 create mode 100644 meta/recipes-core/sysvinit/sysvinit/realpath.patch
 create mode 100644 meta/recipes-core/uclibc/uclibc-git/0001-Revert-glibc-compat-bump-glibc-minor-version.patch
 delete mode 100644 meta/recipes-core/uclibc/uclibc-git/0001-fcntl-Add-AT_EMPTY_PATH-for-all-and-O_PATH-for-arm.patch
 delete mode 100644 meta/recipes-core/uclibc/uclibc-git/0001-gcc5-optimizes-away-the-write-only-static-functions-.patch
 delete mode 100644 meta/recipes-core/uclibc/uclibc-git/0001-wire-in-syncfs.patch
 delete mode 100644 meta/recipes-core/uclibc/uclibc-git/0004-Dont-support-localised-optimizations-this-helps-to-h.patch
 delete mode 100644 meta/recipes-core/uclibc/uclibc-git/0005-Always-use-O2-for-compiling-fork.c.patch
 delete mode 100644 meta/recipes-core/uclibc/uclibc-git/0006-ldso-limited-support-for-ORIGIN-in-rpath.patch
 delete mode 100644 meta/recipes-core/uclibc/uclibc-git/0007-nptl-atfork-Hide-pthread_atfork-in-shared-versions.patch
 create mode 100644 meta/recipes-core/uclibc/uclibc-git/libc-stdlib-canonicalize_file_name-memory-leak.patch
 create mode 100644 meta/recipes-core/util-linux/util-linux/avoid_parallel_tests.patch
 create mode 100644 meta/recipes-core/util-linux/util-linux/avoid_unsupported_grep_opts.patch
 create mode 100644 meta/recipes-core/util-linux/util-linux/avoid_unsupported_sleep_param.patch
 create mode 100644 meta/recipes-core/util-linux/util-linux/display_testname_for_subtest.patch
 delete mode 100644 meta/recipes-core/util-linux/util-linux/fix-parallel-build.patch
 create mode 100644 meta/recipes-core/util-linux/util-linux/ptest.patch
 create mode 100644 meta/recipes-core/util-linux/util-linux/run-ptest
 delete mode 100644 meta/recipes-core/util-linux/util-linux/uclibc-__progname-conflict.patch
 delete mode 100644 meta/recipes-core/util-linux/util-linux/util-linux-ng-replace-siginterrupt.patch
 rename meta/recipes-core/util-linux/{util-linux_2.26.2.bb => util-linux_2.27.1.bb} (60%)
 create mode 100644 meta/recipes-devtools/autoconf/autoconf/add_musl_config.patch
 create mode 100644 meta/recipes-devtools/autoconf/autoconf/performance.patch
 create mode 100644 meta/recipes-devtools/automake/automake/performance.patch
 rename meta/recipes-devtools/cdrtools/{cdrtools-native_3.01a31.bb => cdrtools-native_3.01.bb} (63%)
 create mode 100644 meta/recipes-devtools/cmake/cmake/0001-Add-NIOS2-CPU-support.patch
 rename meta/recipes-devtools/dmidecode/{dmidecode_2.12.bb => dmidecode_3.0.bb} (59%)
 create mode 100644 meta/recipes-devtools/flex/files/0001-bison-test-fixes-Do-not-use-obsolete-bison-construct.patch
 create mode 100644 meta/recipes-devtools/gcc/gcc-4.9/0066-cxxflags-for-build.patch
 create mode 100644 meta/recipes-devtools/gcc/gcc-4.9/0067-fix-arm-thumb.patch
 create mode 100644 meta/recipes-devtools/gcc/gcc-4.9/0067-gcc-musl-support.patch
 create mode 100644 meta/recipes-devtools/gcc/gcc-4.9/0068-musl-dynamic-linker.patch
 create mode 100644 meta/recipes-devtools/gcc/gcc-4.9/0069-musl-no-fixincludes.patch
 create mode 100644 meta/recipes-devtools/gcc/gcc-4.9/0070-libstdc-musl.patch
 create mode 100644 meta/recipes-devtools/gcc/gcc-5.2/0043-fix-arm-thumb.patch
 create mode 100644 meta/recipes-devtools/gcc/gcc-5.2/0043-libstdc-musl.patch
 create mode 100644 meta/recipes-devtools/gcc/gcc-5.2/0044-gcc-musl-support.patch
 create mode 100644 meta/recipes-devtools/gcc/gcc-5.2/0045-musl-dynamic-linker.patch
 create mode 100644 meta/recipes-devtools/gcc/gcc-5.2/0046-musl-no-fixincludes.patch
 create mode 100644 meta/recipes-devtools/gdb/gdb/0001-Use-exported-definitions-of-SIGRTMIN.patch
 create mode 100644 meta/recipes-devtools/mtd/mtd-utils/0001-Fix-build-with-musl.patch
 delete mode 100644 meta/recipes-devtools/mtd/mtd-utils/0001-hashtable-Remove-duplicate-hashtable_iterator_value-.patch
 create mode 100644 meta/recipes-devtools/mtd/mtd-utils/010-fix-rpmatch.patch
 create mode 100644 meta/recipes-devtools/opkg/opkg/0001-string_util-New-file-with-bin_to_hex-function.patch
 create mode 100644 meta/recipes-devtools/opkg/opkg/0002-md5-Add-md5_to_string-function.patch
 create mode 100644 meta/recipes-devtools/opkg/opkg/0003-sha256-Add-sha256_to_string-function.patch
 create mode 100644 meta/recipes-devtools/opkg/opkg/0004-opkg_download-Use-short-cache-file-name.patch
 rename meta/recipes-devtools/orc/{orc_0.4.23.bb => orc_0.4.24.bb} (83%)
 rename meta/recipes-devtools/perl/{libxml-simple-perl_2.20.bb => libxml-simple-perl_2.22.bb} (78%)
 delete mode 100644 meta/recipes-devtools/pkgconfig/pkgconfig.inc
 rename meta/recipes-devtools/python/{python-3.4-manifest.inc => python-3.5-manifest.inc} (51%)
 rename meta/recipes-devtools/python/python-numpy/{no-host-paths.patch => 0001-Don-t-search-usr-and-so-on-for-libraries-by-default-.patch} (69%)
 rename meta/recipes-devtools/python/{python-numpy_1.7.0.bb => python-numpy_1.10.1.bb} (88%)
 rename meta/recipes-devtools/python/{python-pycurl_7.19.5.1.bb => python-pycurl_7.19.5.2.bb} (72%)
 rename meta/recipes-devtools/python/{python-setuptools_18.2.bb => python-setuptools_18.7.1.bb} (84%)
 create mode 100644 meta/recipes-devtools/python/python/add-CROSSPYTHONPATH-for-PYTHON_FOR_BUILD.patch
 rename meta/recipes-devtools/python/{python3-native_3.4.3.bb => python3-native_3.5.0.bb} (89%)
 rename meta/recipes-devtools/python/{python3-setuptools_18.2.bb => python3-setuptools_18.7.1.bb} (87%)
 delete mode 100644 meta/recipes-devtools/python/python3/makerace.patch
 create mode 100644 meta/recipes-devtools/python/python3/use_packed_importlib.patch
 rename meta/recipes-devtools/python/{python3_3.4.3.bb => python3_3.5.0.bb} (95%)
 create mode 100644 meta/recipes-devtools/qemu/qemu/trace-remove-malloc-tracing.patch
 create mode 100644 meta/recipes-devtools/rpm/rpm/rpm-lib-transaction.c-fix-file-conflicts-for-mips64-N32.patch
 create mode 100644 meta/recipes-devtools/rpm/rpm/rpm-rpmfc.c-fix-for-N32-MIPS64.patch
 create mode 100644 meta/recipes-devtools/squashfs-tools/squashfs-tools/fix-compat.patch
 delete mode 100644 meta/recipes-devtools/subversion/subversion-1.8.13/libtool2.patch
 create mode 100644 meta/recipes-devtools/subversion/subversion/0001-Fix-libtool-name-in-configure.ac.patch
 rename meta/recipes-devtools/subversion/{subversion-1.8.13 => subversion}/disable_macos.patch (100%)
 rename meta/recipes-devtools/subversion/{subversion-1.8.13 => subversion}/serf.m4-Regex-modified-to-allow-D-in-paths.patch (59%)
 rename meta/recipes-devtools/subversion/{subversion_1.8.13.bb => subversion_1.9.2.bb} (92%)
 create mode 100644 meta/recipes-devtools/tcf-agent/tcf-agent/ldflags.patch
 delete mode 100644 meta/recipes-devtools/unfs3/unfs3/fix_warnings.patch
 rename meta/recipes-devtools/unfs3/{unfs3_0.9.22.r490.bb => unfs3_0.9.22.r497.bb} (88%)
 rename meta/recipes-devtools/unifdef/{unifdef_2.10.bb => unifdef_2.11.bb} (42%)
 create mode 100644 meta/recipes-devtools/valgrind/valgrind/11_mips-link-tool.patch
 create mode 100644 meta/recipes-extended/bash/bash/fix-run-coproc-run-heredoc-run-execscript-run-test-f.patch
 delete mode 100644 meta/recipes-extended/cpio/cpio-2.11/Fix-symlink-bad-length-test-for-64-bit-architectures.patch
 delete mode 100644 meta/recipes-extended/cpio/cpio-2.11/fix-memory-overrun.patch
 delete mode 100644 meta/recipes-extended/cpio/cpio-2.11/fix-testcase-symlink-bad-lengths.patch
 delete mode 100644 meta/recipes-extended/cpio/cpio-2.11/remove-gets.patch
 delete mode 100644 meta/recipes-extended/cpio/cpio-2.11/statdef.patch
 rename meta/recipes-extended/cpio/{cpio-2.11/cpio-CVE-2015-1197.patch => cpio-2.12/0001-Fix-CVE-2015-1197.patch} (57%)
 rename meta/recipes-extended/cpio/{cpio-2.11 => cpio-2.12}/0001-Unset-need_charset_alias-when-building-for-musl.patch (100%)
 delete mode 100644 meta/recipes-extended/cpio/cpio_2.11.bb
 create mode 100644 meta/recipes-extended/cpio/cpio_2.12.bb
 rename meta/recipes-extended/ethtool/{ethtool_4.0.bb => ethtool_4.2.bb} (88%)
 create mode 100644 meta/recipes-extended/ghostscript/ghostscript/nios2/objarch.h
 create mode 100644 meta/recipes-extended/ghostscript/ghostscript/png_mak.patch
 delete mode 100644 meta/recipes-extended/grep/grep/grep-fix-CVE-2015-1345.patch
 rename meta/recipes-extended/grep/{grep_2.21.bb => grep_2.22.bb} (85%)
 create mode 100644 meta/recipes-extended/libsolv/libsolv_git.bb
 rename meta/recipes-extended/ltp/ltp/{0001-replace-inline-with-static-inline-for-gcc-5.x.patch => 0001-Fix-compilation-for-gcc-5.x.patch} (68%)
 rename meta/recipes-extended/ltp/{ltp_20150420.bb => ltp_20150903.bb} (90%)
 rename meta/recipes-extended/mc/{mc_4.8.14.bb => mc_4.8.15.bb} (91%)
 create mode 100644 meta/recipes-extended/mdadm/files/mdadm-fix-ptest-build-errors.patch
 create mode 100644 meta/recipes-extended/pam/libpam/0001-Add-support-for-defining-missing-funcitonality.patch
 create mode 100644 meta/recipes-extended/pam/libpam/include_paths_header.patch
 delete mode 100644 meta/recipes-extended/procps/procps/fix-configure.patch
 rename meta/recipes-extended/procps/{procps_3.3.10.bb => procps_3.3.11.bb} (92%)
 create mode 100644 meta/recipes-extended/rpcbind/rpcbind/cve-2015-7236.patch
 delete mode 100644 meta/recipes-extended/sudo/sudo/0001-Use-correct-path-to-init.d-and-tmpfiles.d-files.patch
 rename meta/recipes-extended/sudo/{sudo_1.8.14p3.bb => sudo_1.8.15.bb} (80%)
 rename meta/recipes-extended/wget/{wget_1.16.3.bb => wget_1.17.bb} (58%)
 rename meta/recipes-extended/xdg-utils/{xdg-utils_1.1.0-rc1.bb => xdg-utils_1.1.1.bb} (75%)
 delete mode 100644 meta/recipes-gnome/gdk-pixbuf/gdk-pixbuf/0001-pixops-Be-more-careful-about-integer-overflow.patch
 rename meta/recipes-gnome/gdk-pixbuf/{gdk-pixbuf_2.30.8.bb => gdk-pixbuf_2.32.1.bb} (89%)
 delete mode 100644 meta/recipes-gnome/gnome/adwaita-icon-theme/Create-symlinks-when-installing-cursors.patch
 rename meta/recipes-gnome/gnome/{adwaita-icon-theme_3.16.2.1.bb => adwaita-icon-theme_3.18.0.bb} (81%)
 rename meta/recipes-gnome/gnome/{gnome-common_3.14.0.bb => gnome-common_3.18.0.bb} (71%)
 rename meta/recipes-gnome/gsettings-desktop-schemas/{gsettings-desktop-schemas_3.16.1.bb => gsettings-desktop-schemas_3.18.1.bb} (69%)
 rename meta/recipes-gnome/gtk+/{gtk+3_3.16.6.bb => gtk+3_3.18.2.bb} (83%)
 rename meta/recipes-gnome/gtk+/{gtk-icon-utils-native_3.16.6.bb => gtk-icon-utils-native_3.18.2.bb} (92%)
 create mode 100644 meta/recipes-gnome/libgudev/libgudev_230.bb
 rename meta/recipes-gnome/librsvg/{librsvg_2.40.10.bb => librsvg_2.40.11.bb} (85%)
 rename meta/recipes-graphics/clutter/{clutter-1.0_1.22.4.bb => clutter-1.0_1.24.2.bb} (59%)
 rename meta/recipes-graphics/clutter/{clutter-gst-3.0_3.0.8.bb => clutter-gst-3.0_3.0.14.bb} (58%)
 delete mode 100644 meta/recipes-graphics/clutter/clutter-gtk-1.0_1.6.2.bb
 create mode 100644 meta/recipes-graphics/clutter/clutter-gtk-1.0_1.6.6.bb
 delete mode 100644 meta/recipes-graphics/cogl/cogl-1.0/cogl-framebuffer-gl-Work-again-on-GLESv2.patch
 delete mode 100644 meta/recipes-graphics/cogl/cogl-1.0_1.20.0.bb
 create mode 100644 meta/recipes-graphics/cogl/cogl-1.0_1.22.0.bb
 rename meta/recipes-graphics/harfbuzz/{harfbuzz_1.0.2.bb => harfbuzz_1.1.2.bb} (79%)
 delete mode 100644 meta/recipes-graphics/libsdl/libsdl-1.2.15/configure_tweak.patch
 delete mode 100644 meta/recipes-graphics/pango/pango/multilib-fix-clean.patch
 delete mode 100644 meta/recipes-graphics/pango/pango_1.36.8.bb
 create mode 100644 meta/recipes-graphics/pango/pango_1.38.1.bb
 create mode 100644 meta/recipes-graphics/wayland/weston-init/weston.service
 delete mode 100644 meta/recipes-graphics/wayland/weston/disable-wayland-scanner-pkg-check.patch
 rename meta/recipes-graphics/xorg-app/{xinput_1.6.1.bb => xinput_1.6.2.bb} (66%)
 rename meta/recipes-graphics/xorg-app/{xkbcomp_1.3.0.bb => xkbcomp_1.3.1.bb} (78%)
 rename meta/recipes-graphics/xorg-driver/{xf86-input-evdev_2.9.2.bb => xf86-input-evdev_2.10.0.bb} (83%)
 rename meta/recipes-graphics/xorg-driver/{xf86-input-synaptics_1.8.2.bb => xf86-input-synaptics_1.8.3.bb} (74%)
 delete mode 100644 meta/recipes-graphics/xorg-driver/xf86-video-omap/0001-drmmode_output_dpms-Replace-logical-with-bitwise-ope.patch
 rename meta/recipes-graphics/xorg-driver/{xf86-video-omap_0.4.3.bb => xf86-video-omap_0.4.4.bb} (84%)
 rename meta/recipes-graphics/xorg-lib/{libxcb.inc => libxcb_1.11.1.bb} (80%)
 delete mode 100644 meta/recipes-graphics/xorg-lib/libxcb_1.11.bb
 delete mode 100644 meta/recipes-graphics/xorg-lib/libxcb_git.bb
 rename meta/recipes-graphics/xorg-lib/{libxi_1.7.4.bb => libxi_1.7.5.bb} (81%)
 rename meta/recipes-graphics/xorg-lib/{pixman_0.32.6.bb => pixman_0.32.8.bb} (90%)
 rename meta/recipes-graphics/xorg-lib/{xkeyboard-config_2.15.bb => xkeyboard-config_2.16.bb} (88%)
 delete mode 100644 meta/recipes-graphics/xorg-xserver/xserver-xorg/0001-use-__GLIBC__-guard-for-glibc-specific-code.patch
 create mode 100644 meta/recipes-graphics/xorg-xserver/xserver-xorg/configure.ac-Use-libsystemd-in-REQUIRED_LIBS-check.patch
 rename meta/recipes-graphics/xorg-xserver/{xserver-xorg_1.17.2.bb => xserver-xorg_1.18.0.bb} (78%)
 create mode 100755 meta/recipes-kernel/kexec/kexec-tools/kdump
 create mode 100644 meta/recipes-kernel/kexec/kexec-tools/kdump.conf
 rename meta/recipes-kernel/lttng/{babeltrace_1.2.4.bb => babeltrace_1.3.1.bb} (90%)
 delete mode 100644 meta/recipes-kernel/lttng/lttng-tools/0001-Fix-sessiond-disable-match-app-event-by-name.patch
 create mode 100644 meta/recipes-kernel/lttng/lttng-tools/Revert-Build-look-for-python-3.0-when-building-pytho.patch
 delete mode 100644 meta/recipes-kernel/lttng/lttng-tools/extern-decls.patch
 delete mode 100644 meta/recipes-kernel/lttng/lttng-tools/lttng-tools-Fix-live-timer-calculation-error.patch
 delete mode 100644 meta/recipes-kernel/lttng/lttng-tools/runtest.patch
 create mode 100644 meta/recipes-kernel/lttng/lttng-tools/stop-using-SIGUNUSED.patch
 rename meta/recipes-kernel/lttng/{lttng-tools_2.6.0.bb => lttng-tools_git.bb} (82%)
 delete mode 100644 meta/recipes-kernel/lttng/lttng-ust/lttng-ust-Fix-live-timer-calculation-error.patch
 rename meta/recipes-kernel/powertop/{powertop_2.7.bb => powertop_2.8.bb} (83%)
 create mode 100644 meta/recipes-kernel/sysprof/files/gui-argument.patch
 rename meta/recipes-lsb4/libpng/{libpng12_1.2.53.bb => libpng12_1.2.55.bb} (56%)
 create mode 100644 meta/recipes-multimedia/gstreamer/gstreamer1.0/fix-install-hook.patch
 rename meta/recipes-multimedia/libpng/{libpng_1.6.17.bb => libpng_1.6.20.bb} (52%)
 delete mode 100644 meta/recipes-multimedia/libsndfile/files/0001-src-sd2.c-Fix-segfault-in-SD2-RSRC-parser.patch
 delete mode 100644 meta/recipes-multimedia/libsndfile/files/0001-src-sd2.c-Fix-two-potential-buffer-read-overflows.patch
 rename meta/recipes-multimedia/libsndfile/{libsndfile1_1.0.25.bb => libsndfile1_1.0.26.bb} (69%)
 create mode 100644 meta/recipes-multimedia/pulseaudio/pulseaudio/0001-card-add-pa_card_profile.ports.patch
 create mode 100644 meta/recipes-multimedia/pulseaudio/pulseaudio/0002-alsa-bluetooth-fail-if-user-requested-profile-doesn-.patch
 create mode 100644 meta/recipes-multimedia/pulseaudio/pulseaudio/0003-card-move-profile-selection-after-pa_card_new.patch
 create mode 100644 meta/recipes-multimedia/pulseaudio/pulseaudio/0004-alsa-set-availability-for-some-unavailable-profiles.patch
 create mode 100644 meta/recipes-qt/qt4/qt4-4.8.7/fix-for-mips-n32.patch
 rename meta/recipes-rt/rt-tests/{hwlatdetect_0.94.bb => hwlatdetect_0.96.bb} (90%)
 rename meta/recipes-rt/rt-tests/{rt-tests_0.94.bb => rt-tests_0.96.bb} (100%)
 create mode 100644 meta/recipes-support/apr/apr/configure.in-fix-LTFLAGS-to-make-it-work-with-ccache.patch
 rename meta/recipes-support/atk/{at-spi2-atk_2.16.0.bb => at-spi2-atk_2.18.1.bb} (69%)
 rename meta/recipes-support/atk/{at-spi2-core_2.16.0.bb => at-spi2-core_2.18.1.bb} (76%)
 rename meta/recipes-support/atk/{atk_2.16.0.bb => atk_2.18.0.bb} (72%)
 create mode 100644 meta/recipes-support/attr/files/dont-use-decl-macros.patch
 rename meta/recipes-support/curl/{curl_7.44.0.bb => curl_7.45.0.bb} (93%)
 create mode 100644 meta/recipes-support/db/db/Makefile-let-libdb-6.0.la-depend-os_map.l.patch
 delete mode 100644 meta/recipes-support/gmp/gmp-6.0.0/configure.patch
 delete mode 100644 meta/recipes-support/gmp/gmp-6.0.0/gmp-6.0.0-ppc64.patch
 rename meta/recipes-support/gmp/{gmp-6.0.0/append_user_provided_flags.patch => gmp-6.1.0/0001-Append-the-user-provided-flags-to-the-auto-detected-.patch} (50%)
 rename meta/recipes-support/gmp/{gmp-6.0.0 => gmp-6.1.0}/amd64.patch (100%)
 rename meta/recipes-support/gmp/{gmp-6.0.0 => gmp-6.1.0}/use-includedir.patch (100%)
 rename meta/recipes-support/gmp/{gmp_6.0.0.bb => gmp_6.1.0.bb} (58%)
 rename meta/recipes-support/gnutls/gnutls/{configure.ac-fix-sed-command.patch => 0001-configure.ac-fix-sed-command.patch} (40%)
 rename meta/recipes-support/gnutls/{gnutls_3.3.17.1.bb => gnutls_3.4.7.bb} (42%)
 rename meta/recipes-support/gnutls/{libtasn1_4.5.bb => libtasn1_4.7.bb} (81%)
 create mode 100644 meta/recipes-support/icu/icu/icu-release-56-1-flagparser-fix.patch
 rename meta/recipes-support/icu/{icu_55.1.bb => icu_56.1.bb} (64%)
 create mode 100644 meta/recipes-support/libbsd/libbsd/0001-Use-local-SHA512-header.patch
 rename meta/recipes-support/libbsd/{libbsd_0.7.0.bb => libbsd_0.8.0.bb} (65%)
 rename meta/recipes-support/libcroco/{libcroco_0.6.8.bb => libcroco_0.6.9.bb} (81%)
 create mode 100644 meta/recipes-support/libical/libical/Depend-on-headers-to-fix-parallel-build.patch
 create mode 100644 meta/recipes-support/libical/libical/Fix-x32-ABI-build.patch
 create mode 100644 meta/recipes-support/libical/libical/Remove-cmake-check-for-Perl.patch
 rename meta/recipes-support/libical/{libical_1.0.0.bb => libical_1.0.1.bb} (53%)
 rename meta/recipes-support/libpcre/{libpcre_8.37.bb => libpcre_8.38.bb} (91%)
 rename meta/recipes-support/libsoup/{libsoup-2.4_2.50.0.bb => libsoup-2.4_2.52.1.bb} (77%)
 rename meta/recipes-support/libunistring/{libunistring_0.9.5.bb => libunistring_0.9.6.bb} (90%)
 create mode 100644 meta/recipes-support/libunwind/libunwind-1.1/Add-AO_REQUIRE_CAS-to-fix-build-on-ARM-v6.patch
 create mode 100644 meta/recipes-support/libusb/libusb1/no-dll.patch
 rename meta/recipes-support/libusb/{libusb1_1.0.19.bb => libusb1_1.0.20.bb} (83%)
 rename meta/recipes-support/nspr/{nspr_4.10.8.bb => nspr_4.11.bb} (93%)
 rename meta/recipes-support/shared-mime-info/{shared-mime-info_1.4.bb => shared-mime-info_1.5.bb} (43%)
 rename meta/recipes-support/sqlite/{sqlite3_3.9.0.bb => sqlite3_3.9.2.bb} (71%)
 rename scripts/contrib/python/{generate-manifest-3.4.py => generate-manifest-3.5.py} (99%)
 rename scripts/lib/bsp/substrate/target/arch/arm/recipes-kernel/linux/{linux-yocto_4.1.bbapend => linux-yocto_4.1.bbappend} (80%)
 create mode 100644 scripts/lib/recipetool/setvar.py
 create mode 100644 scripts/lib/wic/canned-wks/directdisk-bootloader-config.cfg
 create mode 100644 scripts/lib/wic/canned-wks/directdisk-bootloader-config.wks

-- 
2.5.0


