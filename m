Received: from mga02.intel.com ([134.134.136.20])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <sgw@linux.intel.com>) id 1QEzE2-0005Js-51
	for openembedded-core@lists.openembedded.org;
	Wed, 27 Apr 2011 09:31:56 +0200
Received: from orsmga001.jf.intel.com ([10.7.209.18])
	by orsmga101.jf.intel.com with ESMTP; 27 Apr 2011 00:29:19 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="4.64,273,1301900400"; d="scan'208";a="739028153"
Received: from unknown (HELO localhost) ([10.255.12.245])
	by orsmga001.jf.intel.com with ESMTP; 27 Apr 2011 00:29:18 -0700
Message-Id: <cover.1303889119.git.sgw@linux.intel.com>
Old-Date: Wed, 27 Apr 2011 00:25:19 -0700
Date: Wed, 27 Apr 2011  0:29:17 -0700
To: openembedded-core@lists.openembedded.org
From: Saul Wold <sgw@linux.intel.com>
X-Mailman-Approved-At: Wed, 27 Apr 2011 09:50:49 +0200
Cc: Darren Hart <dvhart@linux.intel.com>, Chris Larson <clarson@kergoth.com>,
	Antonio Ospite <ospite@studenti.unina.it>
Subject: [PATCH 00/52] Updated Consolidated pull
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
X-List-Received-Date: Wed, 27 Apr 2011 07:31:56 -0000

From: Saul Wold <sgw@linux.intel.com>

Richard,

This has been reviewed and build on x86 and ARM, I have worked also to build
full world, it's almost there, qemu on the target needs a few more tweaks, it's
closer!

Please consider these changes.

Thanks
   Sau!


Pull URL: git://git.openembedded.org/openembedded-core-contrib
  Branch: sgw/stage
  Browse: http://git.openembedded.org/cgit.cgi/openembedded-core-contrib/log/?h=sgw/stage

Thanks,
    Saul Wold <sgw@linux.intel.com>
---


Darren Hart (3):
  logging: fix oedebug loglevel test
  logging: remove unused BBDEBUG from local.conf.sample
  logging: add bb* logging mechanisms for bash recipe functions

Dongxiao Xu (13):
  rxvt-unicode: upgrade to version 9.10
  valgrind: upgrade to version 3.6.1
  bluez-hcidump: upgrade to version 2.0
  gupnp-av: upgrade to version 0.8.0
  libsndfile1: upgrade to version 1.0.24
  glib-2.0: upgrade to version 2.28.6
  libfm: Remove the flag of G_DISABLE_DEPRECATED
  polkit: upgrade to version 0.101.
  gst-fluendo-mpegdemux: upgrade to version 0.10.67
  libsamplerate0: upgrade to version 0.1.7
  alsa-utils: upgrade to version 1.0.24.2
  cwautomacros: upgrade to version 20110201
  distro_tracking_fields: cwautomacros, valgrind, etc

Khem Raj (19):
  gcc: Add recipes for 4.6.0
  sstate.bbclass: Reduce SSTATE_MANIFESTS assignment to be weak
  libiconv: update from 1.9.2 -> 1.11.1
  elfutils_0.148.bb: Fix compilation issues on uclibc
  perl_5.12.2.bb: Undefine features not found in uclibc
  xorg-lib: inherit gettext class instead of adding gettext to DEPENDS
    directly
  attr: Fix compilation on uclibc
  linux-tools.inc: Dummify do_compile_perf and do_install_perf for
    uclibc
  gettext.bbclass: Use _append instead of =+
  insane.bbclass: Move code to add function to tasks toward the end
  insane.bbclass: Checking for NLS too when checking gettext dependency
  autotools.bbclass: Copy gettext files only if --disable-nls is not
    set
  gettext: Divide packaging into gettext-runtime and rest
  gettext_0.17.bb: PROVIDE virtual/gettext and RCONFLICT with
    proxy-libintl
  poky-default.inc: Weakly assign gettext to provide virtual/gettext
  glib-2.0: Inherit gettext should provide right libintl so remove from
    DEPENDS
  util-linux.inc: remove virtual/libintl from DEPENDS
  perl_5.12.2.bb: Undefine features not found in uclibc
  alsa-utils_1.0.23.bb: Fix compilation for uclibc targets

Nitin A Kamble (3):
  perl: upgrade from 5.12.2 to 5.12.3
  tar-1.17 (GPLv2) bugfix
  cpio-2.8 (GPLv2) bug fix

Qing He (2):
  sat-solver: fix arch=all packages
  quilt: fix test for target build

Saul Wold (10):
  gdb: set --without-ust for EXTRA_OEFLAGS
  web: update svn to 131 to fix build issue
  python: add missing cytpes modules
  libsdl: add SRC_URI Checksums
  clutter-box2d: add DEPENDS for clutter-1.6
  table: move old clutter demo to meta-demoapps
  tidy: move old clutter demo to meta-demoapps
  alsa-tools: Add checksums
  world-broken: add older clutters since we don't want clutter
    confusion
  qemu: Fix non-sdl/opengl build

Scott Garman (2):
  cdrtools: recipe and patch cleanup
  distro_tracking_fields.inc: add cdrtools recipe

 .../recipes-graphics/clutter/table.inc             |    0
 .../recipes-graphics/clutter/table/fixes.patch     |    0
 .../recipes-graphics/clutter/table_git.bb          |    0
 .../recipes-graphics/clutter/tidy.inc              |    0
 .../recipes-graphics/clutter/tidy/autofoo.patch    |    0
 .../clutter/tidy/tidy-enable-tests.patch           |    0
 .../recipes-graphics/clutter/tidy_git.bb           |    0
 meta/classes/autotools.bbclass                     |   19 +-
 meta/classes/base.bbclass                          |    9 +-
 meta/classes/gettext.bbclass                       |   38 +-
 meta/classes/insane.bbclass                        |   24 +-
 meta/classes/logging.bbclass                       |   72 +
 meta/classes/sstate.bbclass                        |    2 +-
 .../conf/distro/include/distro_tracking_fields.inc |   83 +-
 .../conf/distro/include/poky-default-revisions.inc |    2 +-
 meta/conf/distro/include/poky-default.inc          |    1 +
 meta/conf/distro/include/world-broken.inc          |    9 +-
 meta/conf/local.conf.sample                        |    2 -
 ...{bluez-hcidump_1.42.bb => bluez-hcidump_2.0.bb} |    8 +-
 .../gupnp/{gupnp-av_0.7.0.bb => gupnp-av_0.8.0.bb} |    4 +-
 meta/recipes-core/gettext/gettext_0.17.bb          |   39 +-
 .../60_wait-longer-for-threads-to-die.patch        |    2 +
 .../glib-2.0/glib-2.0/configure-libtool.patch      |    2 +
 .../glib-2.0/glib-2.0/g_once_init_enter.patch      |    2 +
 .../glib-2.0/glib-2.0/glib-gettextize-dir.patch    |    2 +
 meta/recipes-core/glib-2.0/glib-2.0/no-iconv.patch |  104 +
 meta/recipes-core/glib-2.0/glib-2.0_2.26.1.bb      |   16 -
 meta/recipes-core/glib-2.0/glib-2.0_2.27.5.bb      |    5 +-
 meta/recipes-core/glib-2.0/glib-2.0_2.28.6.bb      |   18 +
 meta/recipes-core/glib-2.0/glib.inc                |    4 +-
 meta/recipes-core/util-linux/util-linux.inc        |    6 +-
 .../cdrtools-native/glibc-conflict-rename.patch    |    8 +
 .../cdrtools/cdrtools-native/no_usr_src.patch      |    7 +
 .../cdrtools/cdrtools-native_2.01.bb               |   22 +-
 .../elfutils/elfutils-0.148/mempcpy.patch          |   23 +
 meta/recipes-devtools/elfutils/elfutils_0.148.bb   |    6 +-
 meta/recipes-devtools/gcc/gcc-4.6.0.inc            |   82 +
 .../gcc/gcc-4.6.0/100-uclibc-conf.patch            |   37 +
 .../gcc/gcc-4.6.0/103-uclibc-conf-noupstream.patch |   15 +
 .../gcc/gcc-4.6.0/200-uclibc-locale.patch          | 2840 ++++++++++++++++++++
 .../gcc/gcc-4.6.0/203-uclibc-locale-no__x.patch    |  233 ++
 .../gcc-4.6.0/204-uclibc-locale-wchar_fix.patch    |   52 +
 .../gcc/gcc-4.6.0/205-uclibc-locale-update.patch   |  519 ++++
 .../gcc/gcc-4.6.0/301-missing-execinfo_h.patch     |   13 +
 .../gcc/gcc-4.6.0/302-c99-snprintf.patch           |   13 +
 .../gcc/gcc-4.6.0/303-c99-complex-ugly-hack.patch  |   14 +
 .../gcc/gcc-4.6.0/304-index_macro.patch            |   28 +
 .../gcc-4.6.0/305-libmudflap-susv3-legacy.patch    |   49 +
 .../gcc/gcc-4.6.0/306-libstdc++-namespace.patch    |   38 +
 .../gcc/gcc-4.6.0/307-locale_facets.patch          |   19 +
 .../gcc/gcc-4.6.0/602-sdk-libstdc++-includes.patch |   20 +
 .../recipes-devtools/gcc/gcc-4.6.0/64bithack.patch |   33 +
 .../gcc/gcc-4.6.0/740-sh-pr24836.patch             |   29 +
 .../gcc/gcc-4.6.0/800-arm-bigendian.patch          |   34 +
 .../gcc/gcc-4.6.0/904-flatten-switch-stmt-00.patch |   74 +
 .../gcc/gcc-4.6.0/COLLECT_GCC_OPTIONS.patch        |   23 +
 .../GPLUSPLUS_INCLUDE_DIR_with_sysroot.patch       |   33 +
 .../gcc/gcc-4.6.0/arm-bswapsi2.patch               |   13 +
 .../gcc/gcc-4.6.0/arm-nolibfloat.patch             |   24 +
 .../gcc/gcc-4.6.0/arm-softfloat.patch              |   16 +
 .../gcc/gcc-4.6.0/arm-unbreak-eabi-armv4t.dpatch   |   36 +
 .../gcc/gcc-4.6.0/cache-amnesia.patch              |   31 +
 .../gcc-4.6.0/disable_relax_pic_calls_flag.patch   |   46 +
 .../gcc/gcc-4.6.0/fortran-cross-compile-hack.patch |   30 +
 .../gcc/gcc-4.6.0/gcc-4.0.2-e300c2c3.patch         |  319 +++
 .../gcc-4.3.1-ARCH_FLAGS_FOR_TARGET.patch          |   31 +
 .../gcc-4.3.3-SYSROOT_CFLAGS_FOR_TARGET.patch      |  114 +
 .../gcc/gcc-4.6.0/gcc-arm-frename-registers.patch  |   25 +
 .../gcc/gcc-4.6.0/gcc-flags-for-build.patch        |  178 ++
 .../gcc/gcc-4.6.0/gcc-ice-hack.dpatch              |  331 +++
 .../gcc/gcc-4.6.0/gcc-poison-dir-extend.patch      |   25 +
 .../gcc/gcc-4.6.0/gcc-poison-parameters.patch      |   74 +
 .../gcc-4.6.0/gcc-poison-system-directories.patch  |  221 ++
 .../gcc-uclibc-locale-ctype_touplow_t.patch        |   70 +
 .../gcc/gcc-4.6.0/libstdc++-pic.dpatch             |   71 +
 .../gcc/gcc-4.6.0/optional_libstdc.patch           |   84 +
 meta/recipes-devtools/gcc/gcc-4.6.0/pr30961.dpatch |  179 ++
 meta/recipes-devtools/gcc/gcc-4.6.0/pr35942.patch  |   38 +
 .../gcc/gcc-4.6.0/zecke-xgcc-cpp.patch             |   28 +
 .../gcc/gcc-cross-initial_4.6.0.bb                 |    2 +
 .../gcc/gcc-cross-intermediate_4.6.0.bb            |    3 +
 meta/recipes-devtools/gcc/gcc-cross_4.6.0.bb       |    8 +
 .../gcc/gcc-crosssdk-initial_4.6.0.bb              |    4 +
 .../gcc/gcc-crosssdk-intermediate_4.6.0.bb         |    4 +
 meta/recipes-devtools/gcc/gcc-runtime_4.6.0.bb     |   10 +
 meta/recipes-devtools/gcc/gcc_4.6.0.bb             |    7 +
 meta/recipes-devtools/gcc/libgcc_4.6.0.bb          |   46 +
 meta/recipes-devtools/gdb/gdb-common.inc           |    5 +-
 .../perl/perl-5.12.2/native-ssp.patch              |   16 -
 .../09_fix_installperl.patch                       |    6 +-
 .../Configure-multilib.patch                       |    6 +-
 .../{perl-5.12.2 => perl-5.12.3}/Makefile.SH.patch |   44 +-
 .../{perl-5.12.2 => perl-5.12.3}/Makefile.patch    |    6 +-
 .../asm-pageh-fix.patch                            |    6 +-
 .../perl/{perl-5.12.2 => perl-5.12.3}/config.sh    |   46 +-
 .../perl/{perl-5.12.2 => perl-5.12.3}/config.sh-32 |    0
 .../{perl-5.12.2 => perl-5.12.3}/config.sh-32-be   |    0
 .../{perl-5.12.2 => perl-5.12.3}/config.sh-32-le   |    0
 .../perl/{perl-5.12.2 => perl-5.12.3}/config.sh-64 |    0
 .../{perl-5.12.2 => perl-5.12.3}/config.sh-64-be   |    0
 .../{perl-5.12.2 => perl-5.12.3}/config.sh-64-le   |    0
 .../cross-generate_uudmap.patch                    |    0
 .../debian/arm_optim.diff                          |    2 +-
 .../debian/arm_thread_stress_timeout.diff          |    2 +-
 .../debian/cpan_config_path.diff                   |    2 +-
 .../debian/cpan_definstalldirs.diff                |    2 +-
 .../debian/cpanplus_config_path.diff               |    2 +-
 .../debian/cpanplus_definstalldirs.diff            |    2 +-
 .../debian/db_file_ver.diff                        |    2 +-
 .../debian/deprecate-with-apt.diff                 |    2 +-
 .../debian/devel-ppport-ia64-optim.diff            |    2 +-
 .../debian/disable-zlib-bundling.diff              |    2 +-
 .../debian/doc_info.diff                           |    6 +-
 .../debian/enc2xs_inc.diff                         |    9 +-
 .../debian/errno_ver.diff                          |    2 +-
 .../debian/extutils_hacks.diff                     |    2 +-
 .../debian/fakeroot.diff                           |    4 +-
 .../debian/fixes/autodie-flock.diff                |    2 +-
 .../debian/fixes/concat-stack-corruption.diff      |    4 +-
 .../debian/fixes/cpanplus-without-home.diff        |    2 +-
 .../debian/fixes/h2ph-gcc-4.5.diff                 |    2 +-
 .../debian/fixes/hurd-ccflags.diff                 |    2 +-
 .../debian/fixes/lc-numeric-docs.diff              |    2 +-
 .../debian/fixes/lc-numeric-sprintf.diff           |    2 +-
 .../debian/fixes/net_smtp_docs.diff                |    2 +-
 .../debian/fixes/processPL.diff                    |    2 +-
 .../debian/instmodsh_doc.diff                      |    2 +-
 .../debian/ld_run_path.diff                        |    2 +-
 .../debian/libnet_config_path.diff                 |    2 +-
 .../debian/m68k_thread_stress.diff                 |    2 +-
 .../debian/mod_paths.diff                          |    2 +-
 .../debian/module_build_man_extensions.diff        |    2 +-
 .../perl/perl-5.12.3/debian/patchlevel             |   45 +
 .../debian/perlivp.diff                            |    2 +-
 .../debian/prune_libs.diff                         |    2 +-
 .../perl/perl-5.12.3/debian/series                 |   34 +
 .../debian/squelch-locale-warnings.diff            |    2 +-
 .../{perl-5.12.2 => perl-5.12.3}/generate-sh.patch |    0
 .../{perl-5.12.2 => perl-5.12.3}/installperl.patch |    6 +-
 .../letgcc-find-errno.patch                        |    6 +-
 .../native-nopacklist.patch                        |    6 +-
 .../native-perlinc.patch                           |    4 +-
 .../parallel_build_fix_1.patch                     |    0
 .../parallel_build_fix_2.patch                     |    0
 .../parallel_build_fix_3.patch                     |    0
 .../parallel_build_fix_4.patch                     |    0
 .../parallel_build_fix_5.patch                     |   52 +-
 .../parallel_build_fix_6.patch                     |   36 +-
 .../perl-configpm-switch.patch                     |    0
 .../{perl-5.12.2 => perl-5.12.3}/perl-configure.sh |    2 +-
 .../perl-dynloader.patch                           |    4 +-
 .../perl-enable-gdbm.patch                         |    0
 .../perl-moreconfig.patch                          |    0
 ...perl-native_5.12.2.bb => perl-native_5.12.3.bb} |    8 +-
 ...depends_5.12.2.inc => perl-rdepends_5.12.3.inc} |    0
 ...ovides_5.12.2.inc => perl-rprovides_5.12.3.inc} |    0
 .../perl/{perl_5.12.2.bb => perl_5.12.3.bb}        |  111 +-
 .../python/06-ctypes-libffi-fix-configure.patch    |   58 +
 meta/recipes-devtools/python/python_2.6.6.bb       |    3 +-
 .../qemu/qemu-0.14.0/opengl-sdl-fix.patch          |   41 +
 meta/recipes-devtools/qemu/qemu.inc                |    2 +
 meta/recipes-devtools/qemu/qemu_0.14.0.bb          |    3 +-
 .../quilt/quilt/gnu_patch_test_fix_target.patch    |   26 +
 meta/recipes-devtools/quilt/quilt_0.48.bb          |    6 +-
 .../fix_issue_caused_by_ccache.patch               |    2 +
 .../fixed-perl-path.patch                          |    2 +
 .../{valgrind_3.6.0.bb => valgrind_3.6.1.bb}       |    4 +-
 .../cpio/cpio-2.8/avoid_heap_overflow.patch        |   25 +
 meta/recipes-extended/cpio/cpio_2.8.bb             |    6 +-
 ...macros_20090610.bb => cwautomacros_20110201.bb} |    4 +-
 .../polkit/polkit-0.101/introspection.patch        |  104 +
 .../polkit/{polkit_0.99.bb => polkit_0.101.bb}     |   11 +-
 ...sat-solver_poky.patch => sat-solver_core.patch} |   27 +-
 meta/recipes-extended/sat-solver/sat-solver_git.bb |   16 +-
 .../tar/tar-1.17/avoid_heap_overflow.patch         |   22 +
 meta/recipes-extended/tar/tar_1.17.bb              |    3 +-
 .../clutter/clutter-box2d-1.6_0.10.0.bb            |    2 +
 .../libsdl/libsdl-nativesdk_1.2.11.bb              |    3 +
 meta/recipes-graphics/xorg-lib/libxau_1.0.6.bb     |    4 +-
 meta/recipes-graphics/xorg-lib/libxdmcp_1.1.0.bb   |    4 +-
 meta/recipes-graphics/xorg-lib/xtrans_1.2.6.bb     |    3 +-
 meta/recipes-kernel/linux/linux-tools.inc          |   17 +-
 meta/recipes-multimedia/alsa/alsa-tools_1.0.20.bb  |    8 +-
 .../ncursesfix.patch                               |   22 +-
 ...alsa-utils_1.0.23.bb => alsa-utils_1.0.24.2.bb} |   13 +-
 ...0.10.62.bb => gst-fluendo-mpegdemux_0.10.67.bb} |    4 +-
 .../libsamplerate-0.1.7-macro-quoting.patch        |   22 +
 ...amplerate0_0.1.2.bb => libsamplerate0_0.1.7.bb} |   11 +-
 .../libsndfile/libsndfile1/acincludefix.patch      |   26 -
 .../libsndfile/libsndfile1/add-cxx.patch           |   18 -
 ...libsndfile1_1.0.23.bb => libsndfile1_1.0.24.bb} |    4 +-
 .../recipes-sato/rxvt-unicode/files/makefile.patch |   20 -
 meta/recipes-sato/rxvt-unicode/files/rxvt.desktop  |   11 -
 .../rxvt-unicode/files/signedchar.patch            |   11 -
 meta/recipes-sato/rxvt-unicode/files/xwc.patch     |   28 -
 .../rxvt-unicode/rxvt-unicode-5.6/xwc.patch        |   24 -
 .../rxvt-unicode/rxvt-unicode-9.10/rxvt.desktop    |    9 +
 .../{files => rxvt-unicode-9.10}/rxvt.png          |  Bin 2847 -> 2847 bytes
 .../rxvt-unicode/rxvt-unicode-9.10/xwc.patch       |   26 +
 .../{rxvt-unicode_5.6.bb => rxvt-unicode_9.10.bb}  |   39 +-
 meta/recipes-support/attr/attr.inc                 |    4 +
 meta/recipes-support/attr/ea-acl.inc               |    4 +-
 .../libfm/libfm-0.1.14/use_deprecate_func.patch    |   11 +
 meta/recipes-support/libfm/libfm_0.1.14.bb         |    5 +-
 .../libiconv/libiconv-1.11.1/autoconf.patch        |   48 +
 .../shared_preloadable_libiconv_linux.patch        |   24 +
 meta/recipes-support/libiconv/libiconv_1.11.1.bb   |   30 +
 meta/recipes-support/libiconv/libiconv_1.9.2.bb    |   21 -
 208 files changed, 7583 insertions(+), 593 deletions(-)
 rename {meta => meta-demoapps}/recipes-graphics/clutter/table.inc (100%)
 rename {meta => meta-demoapps}/recipes-graphics/clutter/table/fixes.patch (100%)
 rename {meta => meta-demoapps}/recipes-graphics/clutter/table_git.bb (100%)
 rename {meta => meta-demoapps}/recipes-graphics/clutter/tidy.inc (100%)
 rename {meta => meta-demoapps}/recipes-graphics/clutter/tidy/autofoo.patch (100%)
 rename {meta => meta-demoapps}/recipes-graphics/clutter/tidy/tidy-enable-tests.patch (100%)
 rename {meta => meta-demoapps}/recipes-graphics/clutter/tidy_git.bb (100%)
 create mode 100644 meta/classes/logging.bbclass
 rename meta/recipes-connectivity/bluez/{bluez-hcidump_1.42.bb => bluez-hcidump_2.0.bb} (69%)
 rename meta/recipes-connectivity/gupnp/{gupnp-av_0.7.0.bb => gupnp-av_0.8.0.bb} (77%)
 create mode 100644 meta/recipes-core/glib-2.0/glib-2.0/no-iconv.patch
 delete mode 100644 meta/recipes-core/glib-2.0/glib-2.0_2.26.1.bb
 create mode 100644 meta/recipes-core/glib-2.0/glib-2.0_2.28.6.bb
 create mode 100644 meta/recipes-devtools/elfutils/elfutils-0.148/mempcpy.patch
 create mode 100644 meta/recipes-devtools/gcc/gcc-4.6.0.inc
 create mode 100644 meta/recipes-devtools/gcc/gcc-4.6.0/100-uclibc-conf.patch
 create mode 100644 meta/recipes-devtools/gcc/gcc-4.6.0/103-uclibc-conf-noupstream.patch
 create mode 100644 meta/recipes-devtools/gcc/gcc-4.6.0/200-uclibc-locale.patch
 create mode 100644 meta/recipes-devtools/gcc/gcc-4.6.0/203-uclibc-locale-no__x.patch
 create mode 100644 meta/recipes-devtools/gcc/gcc-4.6.0/204-uclibc-locale-wchar_fix.patch
 create mode 100644 meta/recipes-devtools/gcc/gcc-4.6.0/205-uclibc-locale-update.patch
 create mode 100644 meta/recipes-devtools/gcc/gcc-4.6.0/301-missing-execinfo_h.patch
 create mode 100644 meta/recipes-devtools/gcc/gcc-4.6.0/302-c99-snprintf.patch
 create mode 100644 meta/recipes-devtools/gcc/gcc-4.6.0/303-c99-complex-ugly-hack.patch
 create mode 100644 meta/recipes-devtools/gcc/gcc-4.6.0/304-index_macro.patch
 create mode 100644 meta/recipes-devtools/gcc/gcc-4.6.0/305-libmudflap-susv3-legacy.patch
 create mode 100644 meta/recipes-devtools/gcc/gcc-4.6.0/306-libstdc++-namespace.patch
 create mode 100644 meta/recipes-devtools/gcc/gcc-4.6.0/307-locale_facets.patch
 create mode 100644 meta/recipes-devtools/gcc/gcc-4.6.0/602-sdk-libstdc++-includes.patch
 create mode 100644 meta/recipes-devtools/gcc/gcc-4.6.0/64bithack.patch
 create mode 100644 meta/recipes-devtools/gcc/gcc-4.6.0/740-sh-pr24836.patch
 create mode 100644 meta/recipes-devtools/gcc/gcc-4.6.0/800-arm-bigendian.patch
 create mode 100644 meta/recipes-devtools/gcc/gcc-4.6.0/904-flatten-switch-stmt-00.patch
 create mode 100644 meta/recipes-devtools/gcc/gcc-4.6.0/COLLECT_GCC_OPTIONS.patch
 create mode 100644 meta/recipes-devtools/gcc/gcc-4.6.0/GPLUSPLUS_INCLUDE_DIR_with_sysroot.patch
 create mode 100644 meta/recipes-devtools/gcc/gcc-4.6.0/arm-bswapsi2.patch
 create mode 100644 meta/recipes-devtools/gcc/gcc-4.6.0/arm-nolibfloat.patch
 create mode 100644 meta/recipes-devtools/gcc/gcc-4.6.0/arm-softfloat.patch
 create mode 100644 meta/recipes-devtools/gcc/gcc-4.6.0/arm-unbreak-eabi-armv4t.dpatch
 create mode 100644 meta/recipes-devtools/gcc/gcc-4.6.0/cache-amnesia.patch
 create mode 100644 meta/recipes-devtools/gcc/gcc-4.6.0/disable_relax_pic_calls_flag.patch
 create mode 100644 meta/recipes-devtools/gcc/gcc-4.6.0/fortran-cross-compile-hack.patch
 create mode 100644 meta/recipes-devtools/gcc/gcc-4.6.0/gcc-4.0.2-e300c2c3.patch
 create mode 100644 meta/recipes-devtools/gcc/gcc-4.6.0/gcc-4.3.1-ARCH_FLAGS_FOR_TARGET.patch
 create mode 100644 meta/recipes-devtools/gcc/gcc-4.6.0/gcc-4.3.3-SYSROOT_CFLAGS_FOR_TARGET.patch
 create mode 100644 meta/recipes-devtools/gcc/gcc-4.6.0/gcc-arm-frename-registers.patch
 create mode 100644 meta/recipes-devtools/gcc/gcc-4.6.0/gcc-flags-for-build.patch
 create mode 100644 meta/recipes-devtools/gcc/gcc-4.6.0/gcc-ice-hack.dpatch
 create mode 100644 meta/recipes-devtools/gcc/gcc-4.6.0/gcc-poison-dir-extend.patch
 create mode 100644 meta/recipes-devtools/gcc/gcc-4.6.0/gcc-poison-parameters.patch
 create mode 100644 meta/recipes-devtools/gcc/gcc-4.6.0/gcc-poison-system-directories.patch
 create mode 100644 meta/recipes-devtools/gcc/gcc-4.6.0/gcc-uclibc-locale-ctype_touplow_t.patch
 create mode 100644 meta/recipes-devtools/gcc/gcc-4.6.0/libstdc++-pic.dpatch
 create mode 100644 meta/recipes-devtools/gcc/gcc-4.6.0/optional_libstdc.patch
 create mode 100644 meta/recipes-devtools/gcc/gcc-4.6.0/pr30961.dpatch
 create mode 100644 meta/recipes-devtools/gcc/gcc-4.6.0/pr35942.patch
 create mode 100644 meta/recipes-devtools/gcc/gcc-4.6.0/zecke-xgcc-cpp.patch
 create mode 100644 meta/recipes-devtools/gcc/gcc-cross-initial_4.6.0.bb
 create mode 100644 meta/recipes-devtools/gcc/gcc-cross-intermediate_4.6.0.bb
 create mode 100644 meta/recipes-devtools/gcc/gcc-cross_4.6.0.bb
 create mode 100644 meta/recipes-devtools/gcc/gcc-crosssdk-initial_4.6.0.bb
 create mode 100644 meta/recipes-devtools/gcc/gcc-crosssdk-intermediate_4.6.0.bb
 create mode 100644 meta/recipes-devtools/gcc/gcc-runtime_4.6.0.bb
 create mode 100644 meta/recipes-devtools/gcc/gcc_4.6.0.bb
 create mode 100644 meta/recipes-devtools/gcc/libgcc_4.6.0.bb
 delete mode 100644 meta/recipes-devtools/perl/perl-5.12.2/native-ssp.patch
 rename meta/recipes-devtools/perl/{perl-5.12.2 => perl-5.12.3}/09_fix_installperl.patch (87%)
 rename meta/recipes-devtools/perl/{perl-5.12.2 => perl-5.12.3}/Configure-multilib.patch (89%)
 rename meta/recipes-devtools/perl/{perl-5.12.2 => perl-5.12.3}/Makefile.SH.patch (89%)
 rename meta/recipes-devtools/perl/{perl-5.12.2 => perl-5.12.3}/Makefile.patch (95%)
 rename meta/recipes-devtools/perl/{perl-5.12.2 => perl-5.12.3}/asm-pageh-fix.patch (77%)
 rename meta/recipes-devtools/perl/{perl-5.12.2 => perl-5.12.3}/config.sh (95%)
 rename meta/recipes-devtools/perl/{perl-5.12.2 => perl-5.12.3}/config.sh-32 (100%)
 rename meta/recipes-devtools/perl/{perl-5.12.2 => perl-5.12.3}/config.sh-32-be (100%)
 rename meta/recipes-devtools/perl/{perl-5.12.2 => perl-5.12.3}/config.sh-32-le (100%)
 rename meta/recipes-devtools/perl/{perl-5.12.2 => perl-5.12.3}/config.sh-64 (100%)
 rename meta/recipes-devtools/perl/{perl-5.12.2 => perl-5.12.3}/config.sh-64-be (100%)
 rename meta/recipes-devtools/perl/{perl-5.12.2 => perl-5.12.3}/config.sh-64-le (100%)
 rename meta/recipes-devtools/perl/{perl-5.12.2 => perl-5.12.3}/cross-generate_uudmap.patch (100%)
 rename meta/recipes-devtools/perl/{perl-5.12.2 => perl-5.12.3}/debian/arm_optim.diff (92%)
 rename meta/recipes-devtools/perl/{perl-5.12.2 => perl-5.12.3}/debian/arm_thread_stress_timeout.diff (90%)
 rename meta/recipes-devtools/perl/{perl-5.12.2 => perl-5.12.3}/debian/cpan_config_path.diff (92%)
 rename meta/recipes-devtools/perl/{perl-5.12.2 => perl-5.12.3}/debian/cpan_definstalldirs.diff (95%)
 rename meta/recipes-devtools/perl/{perl-5.12.2 => perl-5.12.3}/debian/cpanplus_config_path.diff (96%)
 rename meta/recipes-devtools/perl/{perl-5.12.2 => perl-5.12.3}/debian/cpanplus_definstalldirs.diff (95%)
 rename meta/recipes-devtools/perl/{perl-5.12.2 => perl-5.12.3}/debian/db_file_ver.diff (95%)
 rename meta/recipes-devtools/perl/{perl-5.12.2 => perl-5.12.3}/debian/deprecate-with-apt.diff (97%)
 rename meta/recipes-devtools/perl/{perl-5.12.2 => perl-5.12.3}/debian/devel-ppport-ia64-optim.diff (93%)
 rename meta/recipes-devtools/perl/{perl-5.12.2 => perl-5.12.3}/debian/disable-zlib-bundling.diff (92%)
 rename meta/recipes-devtools/perl/{perl-5.12.2 => perl-5.12.3}/debian/doc_info.diff (88%)
 rename meta/recipes-devtools/perl/{perl-5.12.2 => perl-5.12.3}/debian/enc2xs_inc.diff (82%)
 rename meta/recipes-devtools/perl/{perl-5.12.2 => perl-5.12.3}/debian/errno_ver.diff (94%)
 rename meta/recipes-devtools/perl/{perl-5.12.2 => perl-5.12.3}/debian/extutils_hacks.diff (99%)
 rename meta/recipes-devtools/perl/{perl-5.12.2 => perl-5.12.3}/debian/fakeroot.diff (93%)
 rename meta/recipes-devtools/perl/{perl-5.12.2 => perl-5.12.3}/debian/fixes/autodie-flock.diff (98%)
 rename meta/recipes-devtools/perl/{perl-5.12.2 => perl-5.12.3}/debian/fixes/concat-stack-corruption.diff (91%)
 rename meta/recipes-devtools/perl/{perl-5.12.2 => perl-5.12.3}/debian/fixes/cpanplus-without-home.diff (94%)
 rename meta/recipes-devtools/perl/{perl-5.12.2 => perl-5.12.3}/debian/fixes/h2ph-gcc-4.5.diff (98%)
 rename meta/recipes-devtools/perl/{perl-5.12.2 => perl-5.12.3}/debian/fixes/hurd-ccflags.diff (92%)
 rename meta/recipes-devtools/perl/{perl-5.12.2 => perl-5.12.3}/debian/fixes/lc-numeric-docs.diff (98%)
 rename meta/recipes-devtools/perl/{perl-5.12.2 => perl-5.12.3}/debian/fixes/lc-numeric-sprintf.diff (93%)
 rename meta/recipes-devtools/perl/{perl-5.12.2 => perl-5.12.3}/debian/fixes/net_smtp_docs.diff (91%)
 rename meta/recipes-devtools/perl/{perl-5.12.2 => perl-5.12.3}/debian/fixes/processPL.diff (95%)
 rename meta/recipes-devtools/perl/{perl-5.12.2 => perl-5.12.3}/debian/instmodsh_doc.diff (93%)
 rename meta/recipes-devtools/perl/{perl-5.12.2 => perl-5.12.3}/debian/ld_run_path.diff (93%)
 rename meta/recipes-devtools/perl/{perl-5.12.2 => perl-5.12.3}/debian/libnet_config_path.diff (95%)
 rename meta/recipes-devtools/perl/{perl-5.12.2 => perl-5.12.3}/debian/m68k_thread_stress.diff (95%)
 rename meta/recipes-devtools/perl/{perl-5.12.2 => perl-5.12.3}/debian/mod_paths.diff (97%)
 rename meta/recipes-devtools/perl/{perl-5.12.2 => perl-5.12.3}/debian/module_build_man_extensions.diff (96%)
 create mode 100644 meta/recipes-devtools/perl/perl-5.12.3/debian/patchlevel
 rename meta/recipes-devtools/perl/{perl-5.12.2 => perl-5.12.3}/debian/perlivp.diff (96%)
 rename meta/recipes-devtools/perl/{perl-5.12.2 => perl-5.12.3}/debian/prune_libs.diff (96%)
 create mode 100644 meta/recipes-devtools/perl/perl-5.12.3/debian/series
 rename meta/recipes-devtools/perl/{perl-5.12.2 => perl-5.12.3}/debian/squelch-locale-warnings.diff (96%)
 rename meta/recipes-devtools/perl/{perl-5.12.2 => perl-5.12.3}/generate-sh.patch (100%)
 rename meta/recipes-devtools/perl/{perl-5.12.2 => perl-5.12.3}/installperl.patch (81%)
 rename meta/recipes-devtools/perl/{perl-5.12.2 => perl-5.12.3}/letgcc-find-errno.patch (92%)
 rename meta/recipes-devtools/perl/{perl-5.12.2 => perl-5.12.3}/native-nopacklist.patch (94%)
 rename meta/recipes-devtools/perl/{perl-5.12.2 => perl-5.12.3}/native-perlinc.patch (88%)
 rename meta/recipes-devtools/perl/{perl-5.12.2 => perl-5.12.3}/parallel_build_fix_1.patch (100%)
 rename meta/recipes-devtools/perl/{perl-5.12.2 => perl-5.12.3}/parallel_build_fix_2.patch (100%)
 rename meta/recipes-devtools/perl/{perl-5.12.2 => perl-5.12.3}/parallel_build_fix_3.patch (100%)
 rename meta/recipes-devtools/perl/{perl-5.12.2 => perl-5.12.3}/parallel_build_fix_4.patch (100%)
 rename meta/recipes-devtools/perl/{perl-5.12.2 => perl-5.12.3}/parallel_build_fix_5.patch (95%)
 rename meta/recipes-devtools/perl/{perl-5.12.2 => perl-5.12.3}/parallel_build_fix_6.patch (89%)
 rename meta/recipes-devtools/perl/{perl-5.12.2 => perl-5.12.3}/perl-configpm-switch.patch (100%)
 rename meta/recipes-devtools/perl/{perl-5.12.2 => perl-5.12.3}/perl-configure.sh (95%)
 rename meta/recipes-devtools/perl/{perl-5.12.2 => perl-5.12.3}/perl-dynloader.patch (90%)
 rename meta/recipes-devtools/perl/{perl-5.12.2 => perl-5.12.3}/perl-enable-gdbm.patch (100%)
 rename meta/recipes-devtools/perl/{perl-5.12.2 => perl-5.12.3}/perl-moreconfig.patch (100%)
 rename meta/recipes-devtools/perl/{perl-native_5.12.2.bb => perl-native_5.12.3.bb} (94%)
 rename meta/recipes-devtools/perl/{perl-rdepends_5.12.2.inc => perl-rdepends_5.12.3.inc} (100%)
 rename meta/recipes-devtools/perl/{perl-rprovides_5.12.2.inc => perl-rprovides_5.12.3.inc} (100%)
 rename meta/recipes-devtools/perl/{perl_5.12.2.bb => perl_5.12.3.bb} (79%)
 create mode 100644 meta/recipes-devtools/python/python/06-ctypes-libffi-fix-configure.patch
 create mode 100644 meta/recipes-devtools/qemu/qemu-0.14.0/opengl-sdl-fix.patch
 create mode 100644 meta/recipes-devtools/quilt/quilt/gnu_patch_test_fix_target.patch
 rename meta/recipes-devtools/valgrind/{valgrind-3.6.0 => valgrind-3.6.1}/fix_issue_caused_by_ccache.patch (94%)
 rename meta/recipes-devtools/valgrind/{valgrind-3.6.0 => valgrind-3.6.1}/fixed-perl-path.patch (97%)
 rename meta/recipes-devtools/valgrind/{valgrind_3.6.0.bb => valgrind_3.6.1.bb} (86%)
 create mode 100644 meta/recipes-extended/cpio/cpio-2.8/avoid_heap_overflow.patch
 rename meta/recipes-extended/cwautomacros/{cwautomacros_20090610.bb => cwautomacros_20110201.bb} (74%)
 create mode 100644 meta/recipes-extended/polkit/polkit-0.101/introspection.patch
 rename meta/recipes-extended/polkit/{polkit_0.99.bb => polkit_0.101.bb} (77%)
 rename meta/recipes-extended/sat-solver/sat-solver/{sat-solver_poky.patch => sat-solver_core.patch} (81%)
 create mode 100644 meta/recipes-extended/tar/tar-1.17/avoid_heap_overflow.patch
 rename meta/recipes-multimedia/alsa/{alsa-utils-1.0.23 => alsa-utils-1.0.24.2}/ncursesfix.patch (70%)
 rename meta/recipes-multimedia/alsa/{alsa-utils_1.0.23.bb => alsa-utils_1.0.24.2.bb} (89%)
 rename meta/recipes-multimedia/gstreamer/{gst-fluendo-mpegdemux_0.10.62.bb => gst-fluendo-mpegdemux_0.10.67.bb} (71%)
 create mode 100644 meta/recipes-multimedia/libsamplerate/libsamplerate0-0.1.7/libsamplerate-0.1.7-macro-quoting.patch
 rename meta/recipes-multimedia/libsamplerate/{libsamplerate0_0.1.2.bb => libsamplerate0_0.1.7.bb} (59%)
 delete mode 100644 meta/recipes-multimedia/libsndfile/libsndfile1/acincludefix.patch
 delete mode 100644 meta/recipes-multimedia/libsndfile/libsndfile1/add-cxx.patch
 rename meta/recipes-multimedia/libsndfile/{libsndfile1_1.0.23.bb => libsndfile1_1.0.24.bb} (80%)
 delete mode 100644 meta/recipes-sato/rxvt-unicode/files/makefile.patch
 delete mode 100644 meta/recipes-sato/rxvt-unicode/files/rxvt.desktop
 delete mode 100644 meta/recipes-sato/rxvt-unicode/files/signedchar.patch
 delete mode 100644 meta/recipes-sato/rxvt-unicode/files/xwc.patch
 delete mode 100644 meta/recipes-sato/rxvt-unicode/rxvt-unicode-5.6/xwc.patch
 create mode 100644 meta/recipes-sato/rxvt-unicode/rxvt-unicode-9.10/rxvt.desktop
 rename meta/recipes-sato/rxvt-unicode/{files => rxvt-unicode-9.10}/rxvt.png (100%)
 create mode 100644 meta/recipes-sato/rxvt-unicode/rxvt-unicode-9.10/xwc.patch
 rename meta/recipes-sato/rxvt-unicode/{rxvt-unicode_5.6.bb => rxvt-unicode_9.10.bb} (69%)
 create mode 100644 meta/recipes-support/libfm/libfm-0.1.14/use_deprecate_func.patch
 create mode 100644 meta/recipes-support/libiconv/libiconv-1.11.1/autoconf.patch
 create mode 100644 meta/recipes-support/libiconv/libiconv-1.11.1/shared_preloadable_libiconv_linux.patch
 create mode 100644 meta/recipes-support/libiconv/libiconv_1.11.1.bb
 delete mode 100644 meta/recipes-support/libiconv/libiconv_1.9.2.bb



