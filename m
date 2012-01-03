Received: from mga03.intel.com ([143.182.124.21])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <sgw@linux.intel.com>) id 1Rhxqs-0004Kv-Vb
	for openembedded-core@lists.openembedded.org;
	Tue, 03 Jan 2012 07:28:04 +0100
Received: from azsmga001.ch.intel.com ([10.2.17.19])
	by azsmga101.ch.intel.com with ESMTP; 02 Jan 2012 22:20:41 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="4.71,315,1320652800"; d="scan'208";a="91752110"
Received: from unknown (HELO swold-mobl.bigsur.com) ([10.255.13.112])
	by azsmga001.ch.intel.com with ESMTP; 02 Jan 2012 22:20:41 -0800
From: Saul Wold <sgw@linux.intel.com>
To: openembedded-core@lists.openembedded.org
Date: Mon,  2 Jan 2012 22:18:46 -0800
Message-Id: <cover.1325571068.git.sgw@linux.intel.com>
X-Mailer: git-send-email 1.7.6.4
Subject: [CONSOLIDATED PULL 000/113] New Year's Updates and Patches
X-BeenThere: openembedded-core@lists.openembedded.org
X-Mailman-Version: 2.1.11
Precedence: list
Reply-To: Patches and discussions about the oe-core layer
	<openembedded-core@lists.openembedded.org>
List-Id: Patches and discussions about the oe-core layer
	<openembedded-core.lists.openembedded.org>
List-Unsubscribe: <http://lists.linuxtogo.org/cgi-bin/mailman/options/openembedded-core>,
	<mailto:openembedded-core-request@lists.openembedded.org?subject=unsubscribe>
List-Archive: <http://lists.linuxtogo.org/pipermail/openembedded-core>
List-Post: <mailto:openembedded-core@lists.openembedded.org>
List-Help: <mailto:openembedded-core-request@lists.openembedded.org?subject=help>
List-Subscribe: <http://lists.linuxtogo.org/cgi-bin/mailman/listinfo/openembedded-core>,
	<mailto:openembedded-core-request@lists.openembedded.org?subject=subscribe>
X-List-Received-Date: Tue, 03 Jan 2012 06:28:04 -0000

Richard,

This has a load of patches and updates from the last week.

There are a coupl of patches that need cooridation with poky,
the meta-tiny and kernel changes.

Based on the AutoBuilder, these are good changes, there are 2
issues seen in the Autobuilder, one with automake and nativesdk.
This either needs a RDEPENDS_virtual-nativesdk or there is some
issue with nativesdk.bbclass since we are seeing non-nativesdk
dependencies for automake.

The other failure is with xserver-kdrive, which I am working on 
a fix, seems to be there before this set of changes.

Further, there are some patches below that need more review, such
as Andrei and Mark changes to base.bbclass and Otavio's udev changes.

Talk with you later today.

Thanks
	Sau!
 

The following changes since commit 8f348ccad083d6c02c200652ff6295e701e88f0d:

  coreutils: ensure --color works so DEPEND on libcap (2011-12-24 10:05:35 +0000)

are available in the git repository at:
  git://git.openembedded.org/openembedded-core-contrib sgw/stage
  http://cgit.openembedded.org/cgit.cgi/openembedded-core-contrib/log/?h=sgw/stage

Andrei Gherzan (2):
  wpa-supplicant - pulls GPLv3 license rpm in a non-GPLv3 build
    (libgnutls-extra)
  meta/classes/base.bbclass: base.bbclass should check for multiple
    (or) licenses in bb files

Bruce Ashfield (4):
  linux-yocto: add cedartrail BSP support
  linux-yocto: update hardware reference boards to 3.0.12
  kern-tools: update SRCREV to pickup git operation fixes
  linux-yocto: use PATH to locate kconf_check

Christopher Larson (4):
  buildhistory: avoid quoting issues with the layer list for build-id
  patch.bbclass: abstract out logic that determines patches to apply
  glib-2.0: we need zlib
  elfutils: fix for dso link change in recent ld

Darren Hart (4):
  eglibc: Only add eglibc-utils to PACKAGES if wchar is supported
  linux-yocto-tiny: New kernel recipe for tiny distros
  task-core-boot: Allow DISTRO to disable keymaps via
    VIRTUAL-RUNTIME_keymaps
  image_types: Ensure /init exists for cpio rootfs archives

Dexuan Cui (6):
  mdadm: upgrade to the latest version 3.2.3
  liburcu: upgrade from 0.6.4 to the latest 0.6.7
  lttng-ust: upgrade from 0.15 to the latest 0.16
  libpciaccess: upgrade from 0.12.1 to 0.12.902
  util-macros: upgrade from 1.15.0 to the latest 1.16.0
  distro_tracking_fields.inc: update the info

Frans Meulenbroeks (1):
  u-boot: improved DESCRIPTION, fixed HOMEPAGE

Koen Kooi (2):
  webkit-gtk svn: update to r101488
  procps: raise update-alternatives priority

Mark Hatle (1):
  base.bbclass: Allow buildstats to be optionally supplied

Mei Lei (1):
  rpm: Fix rpm database files capacity issue.

Nitin A Kamble (15):
  byacc: upgrade from 20110908 to 20111219
  rpm: fix build with automake-1.11.2
  autotools.bbclass: fix cp error for empty dir
  jpeg: fix configure with automake 1.11.2
  avahi: fix configure with automake 1.11.2
  misc patches: fix patch headers
  perl: mark upstream status for all patches
  gcc: mark upstream status for all patches
  avahi-ui: fix build with automake-1.11.2
  vte: upgrade from 0.24.3 to 0.28.2
  systemtap: fix configure with automake 1.11.2
  btrfs-tools: add attr as dependency to fix compilation
  quilt upgreade from 0.48 to 0.50
  automake: upgrade from 1.11.1 to 1.11.2
  btrfs-tools:Fix multithreaded building

Otavio Salvador (11):
  udev: drop 145 version
  udev-extraconf: move mount.blacklist to udev-extraconf dir
  udev: reorganize files of 164 version
  udev: use tabs for init script (no code changes)
  udev: skip mounting /dev on tmpfs if it is on devtmpfs
  udev: ensure /dev/pts and /dev/shm does exists
  udev: improve udev-cache robustness
  udev: use 'echo' instead of 'echo -n' in init script
  udev: run depmod if modules.dep doesn't exist
  udev: split utilities onto udev-utils
  udev: remove commented code from init script (no code changes)

Paul Eggleton (3):
  classes/rootfs_rpm: handle recommends in query functions
  classes/image: implement generic locale package installation
  buildhistory: improve git commit robustness

Richard Purdie (1):
  native.bbclass: Fix variable remapping coverage

Saul Wold (14):
  resolvconf: Update to 1.63
  libiconv: Update to 1.14
  dropbear: fix CRYPTLIB patch
  python: add md5module support
  util-linux: Update to 2.20.1
  rxvt-unicode: Update to 9.14
  Add Upstream-Status to patches
  boost: Update to 1.48 and Clean ups
  distro_tracking: Updated for Upgrades and Manual Check Dates
  puzzles: fixed SRC_URI Checksums
  texinfo: fix gettext patch
  gnutls: more gettext version fixes
  glib-2.0: disable glib due to host contamination
  pseudo: ensure libs are included in package

Scott Garman (3):
  prelink: update to latest git version
  chrpath: upgrade to 0.14
  libevent: upgrade to 2.0.16

Shane Wang (30):
  distro_tracking_fields: update the info for the manual check list
    (2011/12/24)
  distro_tracking_fields: take the ownership of Mei Lei's
  polkit: upgrade to 0.103
  gst-plugins-ugly: upgrade to 0.10.18
  gst-plugins-bad: upgrade to 0.10.22
  gst-fluendo-mp3: upgrade to 0.10.16
  gst-fluendo-mpegdemux: upgrade to 0.10.69
  gst-ffmpeg: upgrade to 0.10.13
  mtd-utils: upgrade to 1.4.9
  valgrind: upgrade to 3.7.0
  telepathy-glib: upgrade to 0.17.4
  ofono: upgrade to 1.0
  libpcap: upgrade to 1.2.0
  distro_tracking_fields: update the info for recipe upgrading
  freetype: upgrade to 2.4.8
  minicom: upgrade to 2.5
  glib-2.0: upgrade to 2.30.2
  libical: upgrade to 0.48
  libsamplerate0: upgrade to 0.1.8
  distro_tracking_fields: update the info for recipe upgrade.
  distro_tracking_fields: update the info for recipe upgrade.
  distro_tracking_fields: update the info for recipe upgrade.
  oprofileui: upgrade to 82ecf8c6b53b84f80682a8312f9defa83a95f2a3
  libomxil: upgrade to 0.9.3
  linux-firmware: upgrade to 15888a2eab052ac3d3f49334e4f6f05f347a516e
  matchbox-wm-2: ugrade to 01fa5465743c9ee43d040350f4405d35293e4869
  quota: upgrade to 4.00
  watchdog: upgrade to 5.11
  puzzles: upgrade to r9375.
  distro_tracking_fields: update the info for this round of package
    upgrade

Tom Zanussi (1):
  rpm2cpio.sh: make compression tests case-insensitive

Zhai Edwin (9):
  mini-x-session: Add this recipe as the session file for mini X
  Add mini X core tasks
  Add "builder" user for specific purpose.
  self-hosted-image: Add builder user and mini X
  gnome-keyring: fix gsettings_data_convert seg fault
  matchbox-wm: Remove x-session-manager handling
  lighttpd: Upgrade to 1.4.30
  apr-util: Upgrade to 1.4.1
  libassuan: Upgrade to 2.0.3

Zhenhua Luo (1):
  valgrind: add powerpc to the compatible host and add ${TCLIBC}-dbg in
    RRECOMMENDS

 .../openswan/openswan-2.4.7/installflags.patch     |    2 +
 .../openswan-2.4.7/ld-library-path-breakage.patch  |    2 +
 .../openswan-2.4.7/openswan-2.4.7-gentoo.patch     |    2 +
 .../wbxml/files/no-doc-install.patch               |    2 +
 .../gcalctool/gcalctool/fix-includedir.patch       |    2 +
 .../libfribidi/files/libtool-update.patch          |    2 +
 .../openobex/files/disable-cable-test.patch        |    3 +-
 .../openobex/files/libusb_crosscompile_check.patch |    2 +
 meta/classes/autotools.bbclass                     |    4 +-
 meta/classes/base.bbclass                          |   18 +-
 meta/classes/buildhistory.bbclass                  |   26 +-
 meta/classes/core-image.bbclass                    |    2 +
 meta/classes/image.bbclass                         |   37 +
 meta/classes/image_types.bbclass                   |   10 +-
 meta/classes/kernel-yocto.bbclass                  |    4 +-
 meta/classes/native.bbclass                        |    2 +-
 meta/classes/patch.bbclass                         |  203 +++---
 meta/classes/rootfs_deb.bbclass                    |   37 +-
 meta/classes/rootfs_ipk.bbclass                    |   30 +-
 meta/classes/rootfs_rpm.bbclass                    |   44 +-
 .../conf/distro/include/distro_tracking_fields.inc |  436 ++++++-----
 meta/conf/local.conf.sample                        |    3 +-
 .../libacpi/files/libacpi_fix_for_x32.patch        |    2 +-
 .../use_correct_strip_in_cross_environment.patch   |    2 +-
 meta/recipes-bsp/u-boot/u-boot.inc                 |    4 +-
 meta/recipes-connectivity/avahi/avahi-ui_0.6.30.bb |    3 +-
 meta/recipes-connectivity/avahi/avahi.inc          |    5 +-
 .../avahi/files/fix_for_automake_1.11.2.patch      |   44 ++
 .../connman/connman/disable_alg-test.patch         |    2 +-
 .../connman/connman/ethernet_default.patch         |    2 +-
 .../{libpcap-1.1.1 => libpcap-1.2.0}/aclocal.patch |    0
 .../ieee80215-arphrd.patch                         |    4 +-
 meta/recipes-connectivity/libpcap/libpcap.inc      |    2 +-
 .../libpcap/{libpcap_1.1.1.bb => libpcap_1.2.0.bb} |    4 +-
 meta/recipes-connectivity/ofono/ofono.inc          |    2 +-
 .../ofono/{ofono_0.50.bb => ofono_1.0.bb}          |    6 +-
 .../openssl-1.0.0e/openssl_fix_for_x32.patch       |    2 +-
 .../{resolvconf_1.62.bb => resolvconf_1.63.bb}     |    4 +-
 ...thy-glib_0.17.0.bb => telepathy-glib_0.17.4.bb} |    4 +-
 .../wpa-supplicant/defconfig.inc                   |    4 +
 .../wpa-supplicant-0.7.3/defconfig-gnutls-nogplv3  |  409 ++++++++++
 .../wpa-supplicant/wpa-supplicant-0.7.inc          |    7 +-
 .../dropbear-0.53.1-static_build_fix.patch         |   67 ++-
 meta/recipes-core/dropbear/dropbear_2011.54.bb     |    2 +-
 meta/recipes-core/eglibc/eglibc-package.inc        |    6 +-
 .../glib-2.0/glib-2.0/glib-2.0_fix_for_x32.patch   |    2 +-
 .../{glib-2.0_2.30.1.bb => glib-2.0_2.30.2.bb}     |    6 +-
 meta/recipes-core/glib-2.0/glib.inc                |    2 +-
 meta/recipes-core/images/self-hosted-image.bb      |    4 +-
 .../jpeg/jpeg-8c/fix_for_automake_1.11.2.patch     |   28 +
 meta/recipes-core/jpeg/jpeg_8c.bb                  |    5 +-
 meta/recipes-core/tasks/task-core-boot.bb          |    8 +-
 meta/recipes-core/tasks/task-self-hosted.bb        |    3 +-
 meta/recipes-core/udev/files/fix-alignment.patch   |   26 -
 meta/recipes-core/udev/files/init                  |  212 ------
 meta/recipes-core/udev/files/local.rules           |   22 -
 meta/recipes-core/udev/files/noasmlinkage.patch    |   39 -
 meta/recipes-core/udev/files/permissions.rules     |   81 --
 meta/recipes-core/udev/files/tmpfs.patch           |   17 -
 meta/recipes-core/udev/files/udev.rules            |   98 ---
 meta/recipes-core/udev/files/udev_network_queue.sh |   35 -
 meta/recipes-core/udev/files/udevsynthesize.patch  |  778 --------------------
 meta/recipes-core/udev/files/udevsynthesize.sh     |   51 --
 meta/recipes-core/udev/udev-145/enable-gudev.patch |   50 --
 meta/recipes-core/udev/udev-145/init               |   59 --
 meta/recipes-core/udev/udev-145/local.rules        |   33 -
 meta/recipes-core/udev/udev-145/noasmlinkage.patch |   50 --
 meta/recipes-core/udev/udev-145/unbreak.patch      |   26 -
 meta/recipes-core/udev/udev-164/init               |   59 --
 meta/recipes-core/udev/udev-164/permissions.rules  |  131 ----
 meta/recipes-core/udev/udev-164/run.rules          |   14 -
 meta/recipes-core/udev/udev-164/udev.rules         |  116 ---
 .../udev/{files => udev-extraconf}/mount.blacklist |    0
 meta/recipes-core/udev/udev-new.inc                |   91 ---
 meta/recipes-core/udev/udev.inc                    |  108 ++--
 .../udev/{files => udev}/devfs-udev.rules          |    0
 meta/recipes-core/udev/udev/init                   |   76 ++
 meta/recipes-core/udev/{files => udev}/links.conf  |    0
 .../udev/{udev-164 => udev}/local.rules            |    0
 meta/recipes-core/udev/{files => udev}/mount.sh    |    0
 meta/recipes-core/udev/{files => udev}/network.sh  |    0
 .../udev/{udev-145 => udev}/permissions.rules      |    0
 .../recipes-core/udev/{udev-145 => udev}/run.rules |    0
 .../udev/{files => udev}/udev-166-v4l1-1.patch     |    0
 meta/recipes-core/udev/{files => udev}/udev-cache  |   20 +-
 meta/recipes-core/udev/udev/udev-cache.default     |    4 +
 .../udev/{udev-145 => udev}/udev.rules             |    0
 meta/recipes-core/udev/udev_145.bb                 |   55 --
 meta/recipes-core/udev/udev_164.bb                 |    4 +-
 .../MCONFIG                                        |    0
 .../defines.h                                      |    0
 .../make_include                                   |    0
 .../remove-lscpu.patch                             |    0
 .../remove_sigsetmark.patch                        |    0
 .../swapargs.h                                     |    0
 .../uclibc-__progname-conflict.patch               |    0
 .../uclibc-compile.patch                           |    0
 .../util-linux-ng-2.16-mount_lock_path.patch       |    0
 .../util-linux-ng-replace-siginterrupt.patch       |    0
 meta/recipes-core/util-linux/util-linux.inc        |    6 +-
 .../{util-linux_2.19.1.bb => util-linux_2.20.1.bb} |   11 +-
 meta/recipes-devtools/autoconf/autoconf.inc        |    2 +
 meta/recipes-devtools/autoconf/autoconf_2.68.bb    |    8 -
 meta/recipes-devtools/automake/automake.inc        |    1 -
 .../prefer-cpio-over-pax-for-ustar-archives.patch  |    2 +
 .../{automake_1.11.1.bb => automake_1.11.2.bb}     |    9 +-
 ...ix_race_condition_with_multithreaded_make.patch |   36 +
 .../btrfs-tools/btrfs-tools_git.bb                 |    8 +-
 meta/recipes-devtools/chrpath/chrpath_0.13.bb      |   23 -
 meta/recipes-devtools/chrpath/chrpath_0.14.bb      |   23 +
 .../dosfstools/fix_populated_dosfs_creation.patch  |    2 +-
 .../dosfstools/dosfstools/nofat32_autoselect.patch |    2 +-
 .../e2fsprogs/e2fsprogs_1.41.14.bb                 |    2 +-
 .../elfutils/elfutils/dso-link-change.patch        |   32 +
 meta/recipes-devtools/elfutils/elfutils_0.148.bb   |    5 +-
 .../gcc/gcc-4.6/gcc-arm-set-cost.patch             |    1 +
 meta/recipes-devtools/gcc/gcc-4.6/pr32219.patch    |    1 +
 meta/recipes-devtools/gcc/gcc-4.6/pr46934.patch    |    1 +
 meta/recipes-devtools/gcc/gcc-4.6/pr47551.patch    |    1 +
 .../installer/files/wget_cache.patch               |    2 +
 .../intltool-0.40.6/remove-xml-check.patch         |    3 +
 .../add-exclusion-to-mkfs-jffs2-git-2.patch        |    0
 .../add-exclusion-to-mkfs-jffs2-git-2.patch        |    0
 .../mtd/{mtd-utils_1.4.6.bb => mtd-utils_1.4.9.bb} |    2 +-
 .../opkg-utils/arfile_header_split.patch           |    2 +-
 .../debian/arm_thread_stress_timeout.diff          |    1 +
 .../perl-5.14.2/debian/cpan_definstalldirs.diff    |    1 +
 .../perl-5.14.2/debian/cpanplus_config_path.diff   |    1 +
 .../debian/cpanplus_definstalldirs.diff            |    1 +
 .../perl/perl-5.14.2/debian/db_file_ver.diff       |    1 +
 .../perl-5.14.2/debian/deprecate-with-apt.diff     |    1 +
 .../perl-5.14.2/debian/disable-zlib-bundling.diff  |    1 +
 .../perl/perl-5.14.2/debian/doc_info.diff          |    1 +
 .../perl/perl-5.14.2/debian/enc2xs_inc.diff        |    1 +
 .../perl/perl-5.14.2/debian/errno_ver.diff         |    1 +
 .../debian/extutils_set_libperl_path.diff          |    1 +
 .../perl/perl-5.14.2/debian/fakeroot.diff          |    1 +
 .../perl/perl-5.14.2/debian/find_html2text.diff    |    1 +
 .../debian/fixes/document_makemaker_ccflags.diff   |    1 +
 .../debian/fixes/extutils-cbuilder-cflags.diff     |    1 +
 .../perl-5.14.2/debian/fixes/h2ph-multiarch.diff   |    1 +
 .../perl-5.14.2/debian/fixes/hurd-ccflags.diff     |    1 +
 .../perl/perl-5.14.2/debian/fixes/hurd-hints.diff  |    1 +
 .../perl-5.14.2/debian/fixes/index-tainting.diff   |    1 +
 .../debian/fixes/module-build-home-directory.diff  |    1 +
 .../perl-5.14.2/debian/fixes/net_smtp_docs.diff    |    1 +
 .../perl/perl-5.14.2/debian/fixes/pod_fixes.diff   |    1 +
 .../perl-5.14.2/debian/fixes/respect_umask.diff    |    1 +
 .../fixes/sys-syslog-socket-timeout-kfreebsd.patch |    1 +
 .../perl/perl-5.14.2/debian/instmodsh_doc.diff     |    1 +
 .../perl/perl-5.14.2/debian/ld_run_path.diff       |    1 +
 .../perl-5.14.2/debian/libnet_config_path.diff     |    1 +
 .../perl/perl-5.14.2/debian/libperl_embed_doc.diff |    1 +
 .../perl-5.14.2/debian/m68k_thread_stress.diff     |    1 +
 .../perl/perl-5.14.2/debian/mod_paths.diff         |    1 +
 .../debian/module_build_man_extensions.diff        |    1 +
 .../perl-5.14.2/debian/no_packlist_perllocal.diff  |    1 +
 .../perl/perl-5.14.2/debian/patchlevel.diff        |    1 +
 .../perl/perl-5.14.2/debian/perlivp.diff           |    1 +
 .../perl/perl-5.14.2/debian/prefix_changes.diff    |    1 +
 .../perl/perl-5.14.2/debian/prune_libs.diff        |    1 +
 .../perl-5.14.2/debian/skip-kfreebsd-crash.diff    |    1 +
 .../debian/skip-upstream-git-tests.diff            |    1 +
 .../debian/squelch-locale-warnings.diff            |    1 +
 .../perl-5.14.2/debian/writable_site_dirs.diff     |    1 +
 meta/recipes-devtools/prelink/prelink_git.bb       |    2 +-
 meta/recipes-devtools/pseudo/pseudo.inc            |    2 +-
 .../pseudo/pseudo/static_sqlite.patch              |    2 +
 meta/recipes-devtools/pseudo/pseudo_1.2.bb         |    2 +-
 .../python/python-native/multilib.patch            |    3 +
 .../recipes-devtools/python/python-native_2.7.2.bb |    8 +-
 .../python/python/add-md5module-support.patch      |   18 +
 meta/recipes-devtools/python/python/multilib.patch |    3 +
 meta/recipes-devtools/python/python_2.7.2.bb       |    3 +-
 .../quilt/{quilt.inc => quilt-0.50.inc}            |   10 +-
 meta/recipes-devtools/quilt/quilt-native_0.48.bb   |    7 -
 meta/recipes-devtools/quilt/quilt-native_0.50.bb   |    4 +
 .../quilt/quilt/gnu_patch_test_fix.patch           |   21 -
 meta/recipes-devtools/quilt/quilt_0.48.bb          |   13 -
 meta/recipes-devtools/quilt/quilt_0.50.bb          |    7 +
 .../rpm/rpm/fix_for_automake_1.11.2.patch          |   54 ++
 .../rpm/rpm/header-include-fix.patch               |    2 +
 .../rpm/rpm/remove-compiled-tests.patch            |    3 +
 meta/recipes-devtools/rpm/rpm/rpm-autoconf.patch   |    2 +
 meta/recipes-devtools/rpm/rpm/rpm-autogen.patch    |    2 +
 meta/recipes-devtools/rpm/rpm/rpm-canonarch.patch  |    2 +
 meta/recipes-devtools/rpm/rpm/rpm-db-reduce.patch  |   19 +
 meta/recipes-devtools/rpm/rpm/rpm-fileclass.patch  |    2 +
 meta/recipes-devtools/rpm/rpm/rpm-libsql-fix.patch |    2 +
 .../recipes-devtools/rpm/rpm/rpm-log-auto-rm.patch |    3 +
 meta/recipes-devtools/rpm/rpm/rpm-no-loopmsg.patch |    2 +
 meta/recipes-devtools/rpm/rpm/rpm-nofsync.patch    |    2 +
 meta/recipes-devtools/rpm/rpm/rpm-platform.patch   |    2 +
 meta/recipes-devtools/rpm/rpm/rpm-showrc.patch     |    2 +
 meta/recipes-devtools/rpm/rpm/rpm-solvedb.patch    |    2 +
 .../rpm/rpm/rpm-tools-mtree-LDFLAGS.patch          |    2 +-
 meta/recipes-devtools/rpm/rpm_5.4.0.bb             |    4 +-
 .../strace/strace-4.5.20/sigmask.patch             |    1 +
 .../valgrind/valgrind-3.7.0/configure-fix.patch    |   23 +
 .../fix_issue_caused_by_ccache.patch               |    0
 .../fix_unsupporting_kernel_3.patch                |    0
 .../fixed-perl-path.patch                          |    0
 .../{valgrind_3.6.1.bb => valgrind_3.7.0.bb}       |   17 +-
 .../byacc/{byacc_20110908.bb => byacc_20111219.bb} |    6 +-
 .../findutils-4.4.2/findutils_fix_for_x32.patch    |    2 +-
 .../{lighttpd_1.4.29.bb => lighttpd_1.4.30.bb}     |    6 +-
 .../0001-mdadm-fix-build-failures-ppc64.patch      |   52 --
 .../mdadm/files/mdadm-3.2.2_fix_for_x32.patch      |    2 +-
 .../mdadm/{mdadm_3.2.2.bb => mdadm_3.2.3.bb}       |   13 +-
 .../{minicom-2.4 => minicom-2.5}/gcc4-scope.patch  |    0
 .../rename-conflicting-functions.patch             |    0
 .../minicom/{minicom_2.4.bb => minicom_2.5.bb}     |    6 +-
 .../pax/pax/pax-3.4_fix_for_x32.patch              |    2 +-
 .../introspection.patch                            |    0
 .../polkit-1_pam.patch                             |    0
 .../polkit/{polkit_0.102.bb => polkit_0.103.bb}    |    7 +-
 meta/recipes-extended/procps/procps_3.2.8.bb       |    4 +-
 .../quota/{quota_4.00-pre1.bb => quota_4.00.bb}    |    8 +-
 .../texinfo/texinfo-4.13a/gettext-macros.patch     |   27 +
 meta/recipes-extended/texinfo/texinfo_4.13a.bb     |    2 +-
 .../watchdog/{watchdog_5.9.bb => watchdog_5.11.bb} |    6 +-
 meta/recipes-gnome/gnome/gconf_3.2.3.bb            |    1 +
 meta/recipes-gnome/gnome/gnome-keyring_2.32.1.bb   |   12 +-
 .../use-usr-bin-env-for-python.patch               |    2 +
 .../libglade-2.6.4/python_environment.patch        |    2 +-
 meta/recipes-graphics/builder/builder_0.1.bb       |   27 +
 .../builder/files/builder_hob_start.sh             |   11 +
 .../no-hardcode.patch                              |    0
 .../{freetype_2.4.6.bb => freetype_2.4.8.bb}       |    6 +-
 .../matchbox-wm-2/matchbox-wm-2_git.bb             |    2 +-
 .../matchbox-wm/matchbox-wm_1.2.bb                 |    9 +-
 .../matchbox-wm/matchbox-wm_git.bb                 |    9 +-
 .../mesa/mesa/mesa_fix_for_x32.patch               |    2 +-
 .../mini-x-session/files/mini-x-session            |   32 +
 .../mini-x-session/mini-x-session_0.1.bb           |   24 +
 .../fix_deletion_of_last_handle.patch              |   51 ++
 ...ciaccess_0.12.1.bb => libpciaccess_0.12.902.bb} |    8 +-
 .../xorg-lib/libxt/libxt_fix_for_x32.patch         |    2 +-
 .../xorg-proto/xproto/xproto_fix_for_x32.patch     |    2 +-
 ...util-macros_1.15.0.bb => util-macros_1.16.0.bb} |    4 +-
 .../blktrace/blktrace/blktrace-makefile.patch      |    2 +
 meta/recipes-kernel/dtc/dtc/make_install.patch     |    2 +
 .../kern-tools/kern-tools-native_git.bb            |    2 +-
 .../linux-firmware/linux-firmware_git.bb           |    4 +-
 meta/recipes-kernel/linux/linux-yocto-rt_3.0.bb    |    2 +-
 meta/recipes-kernel/linux/linux-yocto-tiny/ata.cfg |    9 +
 .../recipes-kernel/linux/linux-yocto-tiny/core.cfg |   19 +
 .../linux/linux-yocto-tiny/debug.cfg               |    5 +
 .../linux/linux-yocto-tiny/devtmpfs.cfg            |    6 +
 .../linux/linux-yocto-tiny/e1000.cfg               |    7 +
 .../recipes-kernel/linux/linux-yocto-tiny/ext2.cfg |    1 +
 .../recipes-kernel/linux/linux-yocto-tiny/ext3.cfg |    2 +
 .../recipes-kernel/linux/linux-yocto-tiny/lzma.cfg |    3 +
 meta/recipes-kernel/linux/linux-yocto-tiny/net.cfg |   26 +
 .../linux/linux-yocto-tiny/qemux86/defconfig       |  613 +++++++++++++++
 .../linux/linux-yocto-tiny/ramfs.cfg               |    6 +
 .../linux/linux-yocto-tiny/rtc-pc.cfg              |   13 +
 .../linux/linux-yocto-tiny/serial.cfg              |    7 +
 meta/recipes-kernel/linux/linux-yocto-tiny/smp.cfg |    7 +
 meta/recipes-kernel/linux/linux-yocto-tiny_3.0.bb  |   36 +
 .../linux-yocto/tools-perf-no-scripting.patch      |    3 +
 meta/recipes-kernel/linux/linux-yocto_3.0.bb       |    2 +-
 meta/recipes-kernel/lttng/fix-powerpc64.patch      |   17 -
 .../lttng/{lttng-ust_0.15.bb => lttng-ust_0.16.bb} |    9 +-
 .../oprofileui/dso_linking_change_build_fix.patch  |   27 -
 .../oprofileui/migrate-from-gnomevfs-to-gio.patch  |  219 ------
 meta/recipes-kernel/oprofile/oprofileui_git.bb     |    2 +-
 meta/recipes-kernel/sysprof/files/rmb-arm.patch    |    3 +
 meta/recipes-kernel/sysprof/files/rmb-mips.patch   |    2 +
 .../systemtap/fix_for_automake_1.11.2.patch        |   46 ++
 meta/recipes-kernel/systemtap/systemtap_git.bb     |    3 +-
 .../gst-ffmpeg-0.10.13/configure-fix.patch         |   20 +
 .../lower-rank.diff                                |    0
 ...gst-ffmpeg_0.10.11.bb => gst-ffmpeg_0.10.13.bb} |   19 +-
 ...o-mp3_0.10.15.bb => gst-fluendo-mp3_0.10.16.bb} |    4 +-
 ...0.10.67.bb => gst-fluendo-mpegdemux_0.10.69.bb} |    4 +-
 ...s-bad_0.10.21.bb => gst-plugins-bad_0.10.22.bb} |    7 +-
 ...ugly_0.10.17.bb => gst-plugins-ugly_0.10.18.bb} |    6 +-
 .../libomxil/libomxil-0.9.3/configure-fix.patch    |   58 ++
 .../libomxil-0.9.3/makefile-docdir-fix.patch       |   19 +
 .../libomxil/libomxil-0.9.3/parallel-make.patch    |   18 +
 meta/recipes-multimedia/libomxil/libomxil_0.3.3.bb |   23 -
 meta/recipes-multimedia/libomxil/libomxil_0.9.3.bb |   33 +
 .../libsamplerate-0.1.7-macro-quoting.patch        |   22 -
 ...amplerate0_0.1.7.bb => libsamplerate0_0.1.8.bb} |    9 +-
 .../allow-libdir-override.patch                    |    2 +
 .../pulseaudio/pulseaudo_fix_for_x32.patch         |    2 +-
 .../libical/{libical_0.47.bb => libical_0.48.bb}   |    6 +-
 .../puzzles/{puzzles_r9306.bb => puzzles_r9375.bb} |    6 +-
 .../rxvt.desktop                                   |    0
 .../rxvt.png                                       |  Bin 2847 -> 2847 bytes
 .../xwc.patch                                      |    0
 .../{rxvt-unicode_9.12.bb => rxvt-unicode_9.14.bb} |    9 +-
 meta/recipes-sato/tasks/task-core-x11-mini.bb      |   45 ++
 meta/recipes-sato/webkit/files/GNUmakefile.am      |   37 +-
 meta/recipes-sato/webkit/files/autogen.sh          |    1 -
 meta/recipes-sato/webkit/files/configure.ac        |  395 +++++-----
 meta/recipes-sato/webkit/webkit-gtk_svn.bb         |    9 +-
 .../apr/apr-util/configure_fixes.patch             |   10 +-
 .../apr/{apr-util_1.3.12.bb => apr-util_1.4.1.bb}  |    6 +-
 meta/recipes-support/boost/boost.inc               |   17 +-
 meta/recipes-support/boost/boost_1.47.0.bb         |   27 -
 meta/recipes-support/boost/boost_1.48.0.bb         |   10 +
 meta/recipes-support/gmp/gmp/gmp_bugfix.patch      |    2 +-
 .../gnutls-2.12.14/fix-gettext-version.patch       |   23 +-
 meta/recipes-support/gnutls/gnutls_2.12.14.bb      |    2 +-
 .../{libassuan_2.0.2.bb => libassuan_2.0.3.bb}     |    4 +-
 meta/recipes-support/libevent/libevent_1.4.14b.bb  |   19 -
 meta/recipes-support/libevent/libevent_2.0.16.bb   |   22 +
 .../autoconf.patch                                 |    0
 .../{libiconv_1.13.1.bb => libiconv_1.14.bb}       |    4 +-
 .../liburcu/{liburcu_0.6.4.bb => liburcu_0.6.7.bb} |    6 +-
 meta/recipes-support/vte/vte.inc                   |    2 +-
 meta/recipes-support/vte/vte_0.24.3.bb             |    8 -
 meta/recipes-support/vte/vte_0.28.2.bb             |   10 +
 scripts/rpm2cpio.sh                                |    8 +-
 316 files changed, 3240 insertions(+), 3399 deletions(-)
 create mode 100644 meta/recipes-connectivity/avahi/files/fix_for_automake_1.11.2.patch
 rename meta/recipes-connectivity/libpcap/{libpcap-1.1.1 => libpcap-1.2.0}/aclocal.patch (100%)
 rename meta/recipes-connectivity/libpcap/{libpcap-1.1.1 => libpcap-1.2.0}/ieee80215-arphrd.patch (91%)
 rename meta/recipes-connectivity/libpcap/{libpcap_1.1.1.bb => libpcap_1.2.0.bb} (73%)
 rename meta/recipes-connectivity/ofono/{ofono_0.50.bb => ofono_1.0.bb} (63%)
 rename meta/recipes-connectivity/resolvconf/{resolvconf_1.62.bb => resolvconf_1.63.bb} (88%)
 rename meta/recipes-connectivity/telepathy/{telepathy-glib_0.17.0.bb => telepathy-glib_0.17.4.bb} (80%)
 create mode 100644 meta/recipes-connectivity/wpa-supplicant/defconfig.inc
 create mode 100644 meta/recipes-connectivity/wpa-supplicant/wpa-supplicant-0.7.3/defconfig-gnutls-nogplv3
 rename meta/recipes-core/glib-2.0/{glib-2.0_2.30.1.bb => glib-2.0_2.30.2.bb} (89%)
 create mode 100644 meta/recipes-core/jpeg/jpeg-8c/fix_for_automake_1.11.2.patch
 delete mode 100644 meta/recipes-core/udev/files/fix-alignment.patch
 delete mode 100755 meta/recipes-core/udev/files/init
 delete mode 100644 meta/recipes-core/udev/files/local.rules
 delete mode 100644 meta/recipes-core/udev/files/noasmlinkage.patch
 delete mode 100644 meta/recipes-core/udev/files/permissions.rules
 delete mode 100644 meta/recipes-core/udev/files/tmpfs.patch
 delete mode 100644 meta/recipes-core/udev/files/udev.rules
 delete mode 100644 meta/recipes-core/udev/files/udev_network_queue.sh
 delete mode 100644 meta/recipes-core/udev/files/udevsynthesize.patch
 delete mode 100644 meta/recipes-core/udev/files/udevsynthesize.sh
 delete mode 100644 meta/recipes-core/udev/udev-145/enable-gudev.patch
 delete mode 100644 meta/recipes-core/udev/udev-145/init
 delete mode 100644 meta/recipes-core/udev/udev-145/local.rules
 delete mode 100644 meta/recipes-core/udev/udev-145/noasmlinkage.patch
 delete mode 100644 meta/recipes-core/udev/udev-145/unbreak.patch
 delete mode 100644 meta/recipes-core/udev/udev-164/init
 delete mode 100644 meta/recipes-core/udev/udev-164/permissions.rules
 delete mode 100644 meta/recipes-core/udev/udev-164/run.rules
 delete mode 100644 meta/recipes-core/udev/udev-164/udev.rules
 rename meta/recipes-core/udev/{files => udev-extraconf}/mount.blacklist (100%)
 delete mode 100644 meta/recipes-core/udev/udev-new.inc
 rename meta/recipes-core/udev/{files => udev}/devfs-udev.rules (100%)
 create mode 100644 meta/recipes-core/udev/udev/init
 rename meta/recipes-core/udev/{files => udev}/links.conf (100%)
 rename meta/recipes-core/udev/{udev-164 => udev}/local.rules (100%)
 rename meta/recipes-core/udev/{files => udev}/mount.sh (100%)
 rename meta/recipes-core/udev/{files => udev}/network.sh (100%)
 rename meta/recipes-core/udev/{udev-145 => udev}/permissions.rules (100%)
 rename meta/recipes-core/udev/{udev-145 => udev}/run.rules (100%)
 rename meta/recipes-core/udev/{files => udev}/udev-166-v4l1-1.patch (100%)
 rename meta/recipes-core/udev/{files => udev}/udev-cache (42%)
 create mode 100644 meta/recipes-core/udev/udev/udev-cache.default
 rename meta/recipes-core/udev/{udev-145 => udev}/udev.rules (100%)
 delete mode 100644 meta/recipes-core/udev/udev_145.bb
 rename meta/recipes-core/util-linux/{util-linux-2.19.1 => util-linux-2.20.1}/MCONFIG (100%)
 rename meta/recipes-core/util-linux/{util-linux-2.19.1 => util-linux-2.20.1}/defines.h (100%)
 rename meta/recipes-core/util-linux/{util-linux-2.19.1 => util-linux-2.20.1}/make_include (100%)
 rename meta/recipes-core/util-linux/{util-linux-2.19.1 => util-linux-2.20.1}/remove-lscpu.patch (100%)
 rename meta/recipes-core/util-linux/{util-linux-2.19.1 => util-linux-2.20.1}/remove_sigsetmark.patch (100%)
 rename meta/recipes-core/util-linux/{util-linux-2.19.1 => util-linux-2.20.1}/swapargs.h (100%)
 rename meta/recipes-core/util-linux/{util-linux-2.19.1 => util-linux-2.20.1}/uclibc-__progname-conflict.patch (100%)
 rename meta/recipes-core/util-linux/{util-linux-2.19.1 => util-linux-2.20.1}/uclibc-compile.patch (100%)
 rename meta/recipes-core/util-linux/{util-linux-2.19.1 => util-linux-2.20.1}/util-linux-ng-2.16-mount_lock_path.patch (100%)
 rename meta/recipes-core/util-linux/{util-linux-2.19.1 => util-linux-2.20.1}/util-linux-ng-replace-siginterrupt.patch (100%)
 rename meta/recipes-core/util-linux/{util-linux_2.19.1.bb => util-linux_2.20.1.bb} (84%)
 rename meta/recipes-devtools/automake/{automake_1.11.1.bb => automake_1.11.2.bb} (81%)
 create mode 100644 meta/recipes-devtools/btrfs-tools/btrfs-tools/fix_race_condition_with_multithreaded_make.patch
 delete mode 100644 meta/recipes-devtools/chrpath/chrpath_0.13.bb
 create mode 100644 meta/recipes-devtools/chrpath/chrpath_0.14.bb
 create mode 100644 meta/recipes-devtools/elfutils/elfutils/dso-link-change.patch
 rename meta/recipes-devtools/mtd/{mtd-utils-1.4.6 => mtd-utils-1.4.9}/add-exclusion-to-mkfs-jffs2-git-2.patch (100%)
 rename meta/recipes-devtools/mtd/{mtd-utils-1.4.6 => mtd-utils-1.4.9}/mtd-utils-1.4.1/add-exclusion-to-mkfs-jffs2-git-2.patch (100%)
 rename meta/recipes-devtools/mtd/{mtd-utils_1.4.6.bb => mtd-utils_1.4.9.bb} (95%)
 create mode 100644 meta/recipes-devtools/python/python/add-md5module-support.patch
 rename meta/recipes-devtools/quilt/{quilt.inc => quilt-0.50.inc} (74%)
 delete mode 100644 meta/recipes-devtools/quilt/quilt-native_0.48.bb
 create mode 100644 meta/recipes-devtools/quilt/quilt-native_0.50.bb
 delete mode 100644 meta/recipes-devtools/quilt/quilt/gnu_patch_test_fix.patch
 delete mode 100644 meta/recipes-devtools/quilt/quilt_0.48.bb
 create mode 100644 meta/recipes-devtools/quilt/quilt_0.50.bb
 create mode 100644 meta/recipes-devtools/rpm/rpm/fix_for_automake_1.11.2.patch
 create mode 100644 meta/recipes-devtools/rpm/rpm/rpm-db-reduce.patch
 create mode 100644 meta/recipes-devtools/valgrind/valgrind-3.7.0/configure-fix.patch
 rename meta/recipes-devtools/valgrind/{valgrind-3.6.1 => valgrind-3.7.0}/fix_issue_caused_by_ccache.patch (100%)
 rename meta/recipes-devtools/valgrind/{valgrind-3.6.1 => valgrind-3.7.0}/fix_unsupporting_kernel_3.patch (100%)
 rename meta/recipes-devtools/valgrind/{valgrind-3.6.1 => valgrind-3.7.0}/fixed-perl-path.patch (100%)
 rename meta/recipes-devtools/valgrind/{valgrind_3.6.1.bb => valgrind_3.7.0.bb} (64%)
 rename meta/recipes-extended/byacc/{byacc_20110908.bb => byacc_20111219.bb} (73%)
 rename meta/recipes-extended/lighttpd/{lighttpd_1.4.29.bb => lighttpd_1.4.30.bb} (92%)
 delete mode 100644 meta/recipes-extended/mdadm/files/0001-mdadm-fix-build-failures-ppc64.patch
 rename meta/recipes-extended/mdadm/{mdadm_3.2.2.bb => mdadm_3.2.3.bb} (65%)
 rename meta/recipes-extended/minicom/{minicom-2.4 => minicom-2.5}/gcc4-scope.patch (100%)
 rename meta/recipes-extended/minicom/{minicom-2.4 => minicom-2.5}/rename-conflicting-functions.patch (100%)
 rename meta/recipes-extended/minicom/{minicom_2.4.bb => minicom_2.5.bb} (75%)
 rename meta/recipes-extended/polkit/{polkit-0.102 => polkit-0.103}/introspection.patch (100%)
 rename meta/recipes-extended/polkit/{polkit-0.102 => polkit-0.103}/polkit-1_pam.patch (100%)
 rename meta/recipes-extended/polkit/{polkit_0.102.bb => polkit_0.103.bb} (84%)
 rename meta/recipes-extended/quota/{quota_4.00-pre1.bb => quota_4.00.bb} (78%)
 rename meta/recipes-extended/watchdog/{watchdog_5.9.bb => watchdog_5.11.bb} (70%)
 create mode 100644 meta/recipes-graphics/builder/builder_0.1.bb
 create mode 100644 meta/recipes-graphics/builder/files/builder_hob_start.sh
 rename meta/recipes-graphics/freetype/{freetype-2.4.6 => freetype-2.4.8}/no-hardcode.patch (100%)
 rename meta/recipes-graphics/freetype/{freetype_2.4.6.bb => freetype_2.4.8.bb} (91%)
 create mode 100644 meta/recipes-graphics/mini-x-session/files/mini-x-session
 create mode 100644 meta/recipes-graphics/mini-x-session/mini-x-session_0.1.bb
 create mode 100644 meta/recipes-graphics/xorg-lib/libpciaccess-0.12.902/fix_deletion_of_last_handle.patch
 rename meta/recipes-graphics/xorg-lib/{libpciaccess_0.12.1.bb => libpciaccess_0.12.902.bb} (50%)
 rename meta/recipes-graphics/xorg-util/{util-macros_1.15.0.bb => util-macros_1.16.0.bb} (75%)
 create mode 100644 meta/recipes-kernel/linux/linux-yocto-tiny/ata.cfg
 create mode 100644 meta/recipes-kernel/linux/linux-yocto-tiny/core.cfg
 create mode 100644 meta/recipes-kernel/linux/linux-yocto-tiny/debug.cfg
 create mode 100644 meta/recipes-kernel/linux/linux-yocto-tiny/devtmpfs.cfg
 create mode 100644 meta/recipes-kernel/linux/linux-yocto-tiny/e1000.cfg
 create mode 100644 meta/recipes-kernel/linux/linux-yocto-tiny/ext2.cfg
 create mode 100644 meta/recipes-kernel/linux/linux-yocto-tiny/ext3.cfg
 create mode 100644 meta/recipes-kernel/linux/linux-yocto-tiny/lzma.cfg
 create mode 100644 meta/recipes-kernel/linux/linux-yocto-tiny/net.cfg
 create mode 100644 meta/recipes-kernel/linux/linux-yocto-tiny/qemux86/defconfig
 create mode 100644 meta/recipes-kernel/linux/linux-yocto-tiny/ramfs.cfg
 create mode 100644 meta/recipes-kernel/linux/linux-yocto-tiny/rtc-pc.cfg
 create mode 100644 meta/recipes-kernel/linux/linux-yocto-tiny/serial.cfg
 create mode 100644 meta/recipes-kernel/linux/linux-yocto-tiny/smp.cfg
 create mode 100644 meta/recipes-kernel/linux/linux-yocto-tiny_3.0.bb
 delete mode 100644 meta/recipes-kernel/lttng/fix-powerpc64.patch
 rename meta/recipes-kernel/lttng/{lttng-ust_0.15.bb => lttng-ust_0.16.bb} (79%)
 delete mode 100644 meta/recipes-kernel/oprofile/oprofileui/dso_linking_change_build_fix.patch
 delete mode 100644 meta/recipes-kernel/oprofile/oprofileui/migrate-from-gnomevfs-to-gio.patch
 create mode 100644 meta/recipes-kernel/systemtap/systemtap/fix_for_automake_1.11.2.patch
 create mode 100644 meta/recipes-multimedia/gstreamer/gst-ffmpeg-0.10.13/configure-fix.patch
 rename meta/recipes-multimedia/gstreamer/{gst-ffmpeg-0.10.11 => gst-ffmpeg-0.10.13}/lower-rank.diff (100%)
 rename meta/recipes-multimedia/gstreamer/{gst-ffmpeg_0.10.11.bb => gst-ffmpeg_0.10.13.bb} (58%)
 rename meta/recipes-multimedia/gstreamer/{gst-fluendo-mp3_0.10.15.bb => gst-fluendo-mp3_0.10.16.bb} (61%)
 rename meta/recipes-multimedia/gstreamer/{gst-fluendo-mpegdemux_0.10.67.bb => gst-fluendo-mpegdemux_0.10.69.bb} (71%)
 rename meta/recipes-multimedia/gstreamer/{gst-plugins-bad_0.10.21.bb => gst-plugins-bad_0.10.22.bb} (76%)
 rename meta/recipes-multimedia/gstreamer/{gst-plugins-ugly_0.10.17.bb => gst-plugins-ugly_0.10.18.bb} (84%)
 create mode 100644 meta/recipes-multimedia/libomxil/libomxil-0.9.3/configure-fix.patch
 create mode 100644 meta/recipes-multimedia/libomxil/libomxil-0.9.3/makefile-docdir-fix.patch
 create mode 100644 meta/recipes-multimedia/libomxil/libomxil-0.9.3/parallel-make.patch
 delete mode 100644 meta/recipes-multimedia/libomxil/libomxil_0.3.3.bb
 create mode 100644 meta/recipes-multimedia/libomxil/libomxil_0.9.3.bb
 delete mode 100644 meta/recipes-multimedia/libsamplerate/libsamplerate0-0.1.7/libsamplerate-0.1.7-macro-quoting.patch
 rename meta/recipes-multimedia/libsamplerate/{libsamplerate0_0.1.7.bb => libsamplerate0_0.1.8.bb} (61%)
 rename meta/recipes-sato/libical/{libical_0.47.bb => libical_0.48.bb} (78%)
 rename meta/recipes-sato/puzzles/{puzzles_r9306.bb => puzzles_r9375.bb} (91%)
 rename meta/recipes-sato/rxvt-unicode/{rxvt-unicode-9.12 => rxvt-unicode-9.14}/rxvt.desktop (100%)
 rename meta/recipes-sato/rxvt-unicode/{rxvt-unicode-9.12 => rxvt-unicode-9.14}/rxvt.png (100%)
 rename meta/recipes-sato/rxvt-unicode/{rxvt-unicode-9.12 => rxvt-unicode-9.14}/xwc.patch (100%)
 rename meta/recipes-sato/rxvt-unicode/{rxvt-unicode_9.12.bb => rxvt-unicode_9.14.bb} (88%)
 create mode 100644 meta/recipes-sato/tasks/task-core-x11-mini.bb
 rename meta/recipes-support/apr/{apr-util_1.3.12.bb => apr-util_1.4.1.bb} (91%)
 delete mode 100644 meta/recipes-support/boost/boost_1.47.0.bb
 create mode 100644 meta/recipes-support/boost/boost_1.48.0.bb
 rename meta/recipes-support/libassuan/{libassuan_2.0.2.bb => libassuan_2.0.3.bb} (82%)
 delete mode 100644 meta/recipes-support/libevent/libevent_1.4.14b.bb
 create mode 100644 meta/recipes-support/libevent/libevent_2.0.16.bb
 rename meta/recipes-support/libiconv/{libiconv-1.13.1 => libiconv-1.14}/autoconf.patch (100%)
 rename meta/recipes-support/libiconv/{libiconv_1.13.1.bb => libiconv_1.14.bb} (88%)
 rename meta/recipes-support/liburcu/{liburcu_0.6.4.bb => liburcu_0.6.7.bb} (80%)
 delete mode 100644 meta/recipes-support/vte/vte_0.24.3.bb
 create mode 100644 meta/recipes-support/vte/vte_0.28.2.bb

-- 
1.7.6.4



