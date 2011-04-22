Received: from mga02.intel.com ([134.134.136.20])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <sgw@linux.intel.com>) id 1QDAlT-0001ob-IY
	for openembedded-core@lists.openembedded.org;
	Fri, 22 Apr 2011 09:26:56 +0200
Received: from orsmga001.jf.intel.com ([10.7.209.18])
	by orsmga101.jf.intel.com with ESMTP; 22 Apr 2011 00:24:29 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="4.64,253,1301900400"; d="scan'208";a="736914023"
Received: from unknown (HELO localhost) ([10.255.12.237])
	by orsmga001.jf.intel.com with ESMTP; 22 Apr 2011 00:24:28 -0700
Message-Id: <cover.1303453279.git.sgw@linux.intel.com>
Old-Date: Thu, 21 Apr 2011 23:21:19 -0700
MIME-Version: 1.0
Date: Fri, 22 Apr 2011  0:24:28 -0700
To: openembedded-core@lists.openembedded.org
From: Saul Wold <sgw@linux.intel.com>
X-Mailman-Approved-At: Fri, 22 Apr 2011 09:33:35 +0200
Cc: Koen Kooi <koen@dominion.thruhere.net>
Subject: [PATCH 00/33] Consolidated Pull request for OE-Core & Poky/master
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
X-List-Received-Date: Fri, 22 Apr 2011 07:26:56 -0000
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit

From: Saul Wold <sgw@linux.intel.com>

Richard

Here is a batch of Update from the Community and the Yotco Metadata team,
I have tested these on x86 and ARM full and incremental builds.

These patches address both Updates, CVEs and build related issues.


Pull URL: git://git.openembedded.org/openembedded-core-contrib
  Branch: sgw/stage
  Browse: http://git.openembedded.org/cgit.cgi/openembedded-core-contrib/log/?h=sgw/stage

Thanks,
    Saul Wold <sgw@linux.intel.com>
---


Dexuan Cui (9):
  libxfixes: upgrade from 4.0.5 to the latest version 5.0
  util-macros: upgrade from 1.11.0 to 1.13.0
  preferred-xorg-versions.inc: update libxfixes, util-macros,
    xorg-cf-files
  mdadm: upgrade from 3.1.4 to the latest version 3.2.1
  liburcu: upgrade from 0.5.2 to 0.5.4
  lttng-ust: upgrade from 0.11 to the latest version 0.12
  task-poky-tools.bb, task-sdk-gmae.inc: enable lttng-ust for ARM
  lttng-viewer: upgrade from 0.12.36 to the latest version 0.12.38
  distro_tracking_fields.inc: update the info for the following recipes

Gary Thomas (1):
  Control over when package init scripts are run

Khem Raj (2):
  gcc: Add recipes for 4.6.0
  pcmciautils: Upgrade 017 -> 018

Nitin A Kamble (8):
  mpfr: upgrade from 3.0.0 to 3.0.1
  python-gst: upgrade from 0.10.19 to 0.10.21
  git: upgrade from 1.7.3.4 to 1.7.4.3
  python-pycairo: fix installation path of __init__.py
  perl-5.12.2: use of PERLHOSTLIB var fix
  cpan.bbclass: export PERLHOSTLIB for perl modules
  libxml-parser-perl: upgrade from 2.36 to 2.40
  distro_tracking: recipe information update

Petr Štetiar (1):
  modutils-initscripts: fix wrong order of module loading happening in
    udev

Saul Wold (4):
  slang: Fix host contamination issue
  qemu: disable sdl for target build
  ofono: add bluze to DEPENDS list
  qemu-helper-nativesdk: Update LIC_FILE_CHKSUM for renamed helper

Scott Garman (1):
  cdrtools: upgrade to v3.00

Tom Zanussi (1):
  linux-tools.inc: turn off newt and dwarf for perf

Zhai Edwin (6):
  tasks: Upgrade to 0.19 (from 0.18)
  avahi: Upgrade to 0.6.30 (from 0.6.28)
  consolekit: Upgrade to 0.4.4 (from 0.4.3)
  libgpg-error: Upgrade to 1.10 (from 1.9)
  jpeg: Upgrade to 8c (from 8b)
  puzzles: Upgrade to svn r9151 (from r9084)

 meta/classes/cpan.bbclass                          |    1 +
 meta/classes/rootfs_rpm.bbclass                    |   11 +-
 .../conf/distro/include/distro_tracking_fields.inc |   72 +-
 .../distro/include/preferred-xorg-versions.inc     |    8 +-
 .../pcmciautils-017/version_workaround.patch       |   16 -
 .../makefile_fix.patch                             |   58 +-
 meta/recipes-bsp/pcmciautils/pcmciautils.inc       |    1 +
 meta/recipes-bsp/pcmciautils/pcmciautils_017.bb    |   12 -
 meta/recipes-bsp/pcmciautils/pcmciautils_018.bb    |   11 +
 meta/recipes-connectivity/avahi/avahi.inc          |    2 +-
 .../avahi/{avahi_0.6.28.bb => avahi_0.6.30.bb}     |    6 +-
 .../avahi/files/initscript.patch                   |    2 +
 meta/recipes-connectivity/ofono/ofono.inc          |    2 +-
 .../{jpeg-8b => jpeg-8c}/debian-libjpeg7_7-1.diff  |    4 +
 meta/recipes-core/jpeg/{jpeg_8b.bb => jpeg_8c.bb}  |    8 +-
 meta/recipes-core/tasks/task-core-tools.bb         |    8 +-
 .../cdrtools-native/glibc-conflict-rename.patch    |  228 --
 .../cdrtools/cdrtools-native/no_usr_src.patch      |   26 -
 .../cdrtools/cdrtools-native_2.01.bb               |   26 -
 .../cdrtools/cdrtools-native_3.00.bb               |   24 +
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
 meta/recipes-devtools/git/files/autotools.patch    |    2 +
 .../git/{git_1.7.3.4.bb => git_1.7.4.3.bb}         |    4 +-
 meta/recipes-devtools/opkg/opkg.inc                |    4 +
 meta/recipes-devtools/opkg/opkg_0.1.8.bb           |   13 +-
 meta/recipes-devtools/opkg/opkg_svn.bb             |   13 +-
 .../libperl-5.8.3-create-libperl-soname.patch      |   11 -
 ...e_2.36.bb => libxml-parser-perl-native_2.40.bb} |    0
 ...ser-perl_2.36.bb => libxml-parser-perl_2.40.bb} |    8 +-
 .../perl/perl-5.12.2/09_fix_installperl.patch      |    2 +
 .../Configure-multilib.patch                       |    2 +
 .../perl/perl-5.12.2/Makefile.SH.patch             |    2 +
 .../perl/perl-5.12.2/Makefile.patch                |    2 +
 .../perl/perl-5.12.2/asm-pageh-fix.patch           |    2 +
 .../perl/perl-5.12.2/cross-generate_uudmap.patch   |    2 +
 .../perl/perl-5.12.2/debian/arm_optim.diff         |    2 +
 .../debian/arm_thread_stress_timeout.diff          |    2 +
 .../perl/perl-5.12.2/debian/cpan_config_path.diff  |    2 +
 .../perl-5.12.2/debian/cpan_definstalldirs.diff    |    2 +
 .../perl-5.12.2/debian/cpanplus_config_path.diff   |    2 +
 .../debian/cpanplus_definstalldirs.diff            |    2 +
 .../perl/perl-5.12.2/debian/db_file_ver.diff       |    2 +
 .../perl-5.12.2/debian/deprecate-with-apt.diff     |    2 +
 .../debian/devel-ppport-ia64-optim.diff            |    2 +
 .../perl-5.12.2/debian/disable-zlib-bundling.diff  |    2 +
 .../perl/perl-5.12.2/debian/doc_info.diff          |    2 +
 .../perl/perl-5.12.2/debian/enc2xs_inc.diff        |    2 +
 .../perl/perl-5.12.2/debian/errno_ver.diff         |    2 +
 .../perl/perl-5.12.2/debian/extutils_hacks.diff    |    2 +
 .../perl/perl-5.12.2/debian/fakeroot.diff          |    2 +
 .../perl-5.12.2/debian/fixes/autodie-flock.diff    |    2 +
 .../debian/fixes/concat-stack-corruption.diff      |    2 +
 .../debian/fixes/cpanplus-without-home.diff        |    2 +
 .../perl-5.12.2/debian/fixes/h2ph-gcc-4.5.diff     |    2 +
 .../perl-5.12.2/debian/fixes/hurd-ccflags.diff     |    2 +
 .../perl-5.12.2/debian/fixes/lc-numeric-docs.diff  |    2 +
 .../debian/fixes/lc-numeric-sprintf.diff           |    2 +
 .../perl-5.12.2/debian/fixes/net_smtp_docs.diff    |    2 +
 .../perl/perl-5.12.2/debian/fixes/processPL.diff   |    2 +
 .../perl/perl-5.12.2/debian/instmodsh_doc.diff     |    2 +
 .../perl/perl-5.12.2/debian/ld_run_path.diff       |    2 +
 .../perl-5.12.2/debian/libnet_config_path.diff     |    2 +
 .../perl-5.12.2/debian/m68k_thread_stress.diff     |    2 +
 .../perl/perl-5.12.2/debian/mod_paths.diff         |    2 +
 .../debian/module_build_man_extensions.diff        |    2 +
 .../perl/perl-5.12.2/debian/perlivp.diff           |    2 +
 .../perl/perl-5.12.2/debian/prune_libs.diff        |    2 +
 .../debian/squelch-locale-warnings.diff            |    2 +
 .../perl/perl-5.12.2/generate-sh.patch             |    2 +
 .../perl/perl-5.12.2/installperl.patch             |    2 +
 .../{files => perl-5.12.2}/letgcc-find-errno.patch |    2 +
 .../perl/perl-5.12.2/native-nopacklist.patch       |    2 +
 .../perl/perl-5.12.2/native-perlinc.patch          |    2 +
 .../perl/perl-5.12.2/native-ssp.patch              |    2 +
 .../perl/perl-5.12.2/parallel_build_fix_1.patch    |    2 +
 .../perl/perl-5.12.2/parallel_build_fix_2.patch    |    2 +
 .../perl/perl-5.12.2/parallel_build_fix_3.patch    |    2 +
 .../perl/perl-5.12.2/parallel_build_fix_4.patch    |    2 +
 .../perl/perl-5.12.2/parallel_build_fix_5.patch    |    2 +
 .../perl/perl-5.12.2/parallel_build_fix_6.patch    |    2 +
 .../perl/perl-5.12.2/perl-configpm-switch.patch    |    2 +
 .../perl/perl-5.12.2/perl-dynloader.patch          |   12 +-
 .../perl/perl-5.12.2/perl-enable-gdbm.patch        |    2 +
 .../perl/perl-5.12.2/perl-moreconfig.patch         |    2 +
 meta/recipes-devtools/perl/perl_5.12.2.bb          |    2 +-
 .../python/python-gst/python-path.patch            |    2 +
 ...python-gst_0.10.19.bb => python-gst_0.10.21.bb} |    6 +-
 .../python/python-pycairo_1.8.10.bb                |    8 +-
 .../qemu/qemu-helper-nativesdk_1.0.bb              |    2 +-
 meta/recipes-devtools/qemu/qemu.inc                |    8 +-
 meta/recipes-extended/mdadm/files/fix-z-now.patch  |   15 -
 .../mdadm/{mdadm_3.1.4.bb => mdadm_3.2.1.bb}       |    9 +-
 meta/recipes-extended/slang/slang_2.2.4.bb         |    3 +-
 meta/recipes-gnome/tasks/task-core-sdk-gmae.bb     |    4 +-
 .../tasks/task-core-standalone-gmae-sdk-target.bb  |    4 +-
 meta/recipes-gnome/tasks/task-sdk-gmae.inc         |    1 +
 .../{libxfixes_4.0.5.bb => libxfixes_5.0.bb}       |    4 +-
 ...util-macros_1.11.0.bb => util-macros_1.13.0.bb} |    4 +-
 meta/recipes-kernel/linux/linux-tools.inc          |    4 +-
 ...remove_ppc_specific_time_reading_function.patch |   85 -
 meta/recipes-kernel/lttng/lttng-ust_0.11.bb        |   32 -
 meta/recipes-kernel/lttng/lttng-ust_0.12.bb        |   28 +
 ...g-viewer_0.12.36.bb => lttng-viewer_0.12.38.bb} |    6 +-
 .../modutils/modutils-initscripts.bb               |    4 +-
 meta/recipes-sato/pimlico/tasks/tasks-owl.diff     |    5 +
 .../pimlico/{tasks_0.18.bb => tasks_0.19.bb}       |    4 +-
 .../puzzles/files/oh-puzzles-owl-menu.patch        |    5 +
 .../puzzles/{puzzles_r9084.bb => puzzles_r9151.bb} |    2 +-
 .../{consolekit_0.4.3.bb => consolekit_0.4.4.bb}   |   10 +-
 .../consolekit/files/nopolkit.patch                |    2 +
 .../pkgconfig.patch                                |    2 +
 .../{libgpg-error_1.9.bb => libgpg-error_1.10.bb}  |    6 +-
 .../liburcu/{liburcu_0.5.2.bb => liburcu_0.5.4.bb} |   11 +-
 .../mpfr/{mpfr_3.0.0.bb => mpfr_3.0.1.bb}          |    4 +-
 164 files changed, 6659 insertions(+), 590 deletions(-)
 delete mode 100644 meta/recipes-bsp/pcmciautils/pcmciautils-017/version_workaround.patch
 rename meta/recipes-bsp/pcmciautils/{pcmciautils-017 => pcmciautils-018}/makefile_fix.patch (63%)
 delete mode 100644 meta/recipes-bsp/pcmciautils/pcmciautils_017.bb
 create mode 100644 meta/recipes-bsp/pcmciautils/pcmciautils_018.bb
 rename meta/recipes-connectivity/avahi/{avahi_0.6.28.bb => avahi_0.6.30.bb} (82%)
 rename meta/recipes-core/jpeg/{jpeg-8b => jpeg-8c}/debian-libjpeg7_7-1.diff (98%)
 rename meta/recipes-core/jpeg/{jpeg_8b.bb => jpeg_8c.bb} (85%)
 delete mode 100644 meta/recipes-devtools/cdrtools/cdrtools-native/glibc-conflict-rename.patch
 delete mode 100644 meta/recipes-devtools/cdrtools/cdrtools-native/no_usr_src.patch
 delete mode 100644 meta/recipes-devtools/cdrtools/cdrtools-native_2.01.bb
 create mode 100644 meta/recipes-devtools/cdrtools/cdrtools-native_3.00.bb
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
 rename meta/recipes-devtools/git/{git_1.7.3.4.bb => git_1.7.4.3.bb} (59%)
 delete mode 100644 meta/recipes-devtools/perl/files/libperl-5.8.3-create-libperl-soname.patch
 rename meta/recipes-devtools/perl/{libxml-parser-perl-native_2.36.bb => libxml-parser-perl-native_2.40.bb} (100%)
 rename meta/recipes-devtools/perl/{libxml-parser-perl_2.36.bb => libxml-parser-perl_2.40.bb} (61%)
 rename meta/recipes-devtools/perl/{files => perl-5.12.2}/Configure-multilib.patch (96%)
 rename meta/recipes-devtools/perl/{files => perl-5.12.2}/letgcc-find-errno.patch (96%)
 rename meta/recipes-devtools/python/{python-gst_0.10.19.bb => python-gst_0.10.21.bb} (82%)
 delete mode 100644 meta/recipes-extended/mdadm/files/fix-z-now.patch
 rename meta/recipes-extended/mdadm/{mdadm_3.1.4.bb => mdadm_3.2.1.bb} (78%)
 rename meta/recipes-graphics/xorg-lib/{libxfixes_4.0.5.bb => libxfixes_5.0.bb} (79%)
 rename meta/recipes-graphics/xorg-util/{util-macros_1.11.0.bb => util-macros_1.13.0.bb} (79%)
 delete mode 100644 meta/recipes-kernel/lttng/lttng-ust-0.11/remove_ppc_specific_time_reading_function.patch
 delete mode 100644 meta/recipes-kernel/lttng/lttng-ust_0.11.bb
 create mode 100644 meta/recipes-kernel/lttng/lttng-ust_0.12.bb
 rename meta/recipes-kernel/lttng/{lttng-viewer_0.12.36.bb => lttng-viewer_0.12.38.bb} (85%)
 rename meta/recipes-sato/pimlico/{tasks_0.18.bb => tasks_0.19.bb} (78%)
 rename meta/recipes-sato/puzzles/{puzzles_r9084.bb => puzzles_r9151.bb} (94%)
 rename meta/recipes-support/consolekit/{consolekit_0.4.3.bb => consolekit_0.4.4.bb} (75%)
 rename meta/recipes-support/libgpg-error/{libgpg-error-1.9 => libgpg-error-1.10}/pkgconfig.patch (98%)
 rename meta/recipes-support/libgpg-error/{libgpg-error_1.9.bb => libgpg-error_1.10.bb} (82%)
 rename meta/recipes-support/liburcu/{liburcu_0.5.2.bb => liburcu_0.5.4.bb} (61%)
 rename meta/recipes-support/mpfr/{mpfr_3.0.0.bb => mpfr_3.0.1.bb} (70%)



