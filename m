Return-Path: <alexander.kanavin@linux.intel.com>
Received: from mga14.intel.com (mga14.intel.com [192.55.52.115])
	by mail.openembedded.org (Postfix) with ESMTP id BA2CA783CF
	for <openembedded-core@lists.openembedded.org>;
	Fri, 16 Jun 2017 12:28:47 +0000 (UTC)
Received: from fmsmga001.fm.intel.com ([10.253.24.23])
	by fmsmga103.fm.intel.com with ESMTP/TLS/DHE-RSA-AES256-GCM-SHA384;
	16 Jun 2017 05:28:49 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.39,347,1493708400"; d="scan'208";a="1161279493"
Received: from kanavin-desktop.fi.intel.com ([10.237.68.161])
	by fmsmga001.fm.intel.com with ESMTP; 16 Jun 2017 05:28:48 -0700
From: Alexander Kanavin <alexander.kanavin@linux.intel.com>
To: openembedded-core@lists.openembedded.org
Date: Fri, 16 Jun 2017 15:28:23 +0300
Message-Id: <cover.1497615866.git.alexander.kanavin@linux.intel.com>
X-Mailer: git-send-email 2.11.0
Subject: [PATCH 00/32] Version updates and recipe removals
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
X-List-Received-Date: Fri, 16 Jun 2017 12:28:49 -0000

This patchset has the usual bunch of version updates and upstream check fixes.

It also carries a number of recipe removals for the stuff that is no longer
needed in oe-core. In particular recipes mandated by LSB4 are trimmed down
(https://bugzilla.yoctoproject.org/show_bug.cgi?id=11316).

There's also an new selftest which detects regressions in upstream version checks
(https://bugzilla.yoctoproject.org/show_bug.cgi?id=11031).

The following changes since commit 9ea5a31776440abd6468f003c5e1905f079446d3:

  ovmf: fix secureboot PACKAGECONFIG + OpenSSL update (2017-06-16 10:58:23 +0100)

are available in the git repository at:

  git://git.yoctoproject.org/poky-contrib akanavin/package-version-updates
  http://git.yoctoproject.org/cgit.cgi/poky-contrib/log/?h=akanavin/package-version-updates

Alexander Kanavin (28):
  libiconv: remove recipe
  python-pycurl: remove the recipe
  python: remove unused 2.x versions of several packages
  packagegroup-core-lsb: do not include Qt4 anymore
  libpng12: remove the recipe
  recipes-lsb4/perl: remove the recipes
  mailx: remove the recipe
  README.LSB: describe oe-core's deviations from the LSB spec
  trace-cmd: update to 2.6.1
  oe-selftest: add a test for upstream version check regressions
  logrotate: fix upstream version check
  speex: fix upstream version check
  libid3tag: fix upstream version check
  grub2: remove autogen dependency
  autogen-native: remove the recipe
  remake: remove the recipe
  guile: remove the recipe
  bdwgc: remove the recipe
  uninative-flags.inc: do not default to old C++ ABI
  icu: update to 59.1
  epiphany: update to 3.24.2
  gobject-introspection: update to 1.52.1
  python3-pygobject: update to 3.24.1
  gettext: relocate msgfmt utility for all recipes
  gnomebase.bbclass: add datadir/icons and datadir/appdata to standard
    FILES list
  liburcu: update to 0.10.0
  npth: update to 1.5
  dmidecode: update to 3.1

Khem Raj (1):
  webkitgtk: Upgrade to 2.16.3

Upgrade Helper (3):
  vala: upgrade to 0.36.3
  libfakekey: upgrade to 0.3+gitAUTOINC+7ad885912e
  btrfs-tools: upgrade to 4.11

 README.LSB                                         |   25 +
 meta-selftest/files/distrodata/checkpkg_exceptions |   26 +
 meta/classes/gnomebase.bbclass                     |    2 +
 meta/conf/distro/include/distro_alias.inc          |    2 -
 meta/conf/distro/include/security_flags.inc        |    2 -
 meta/conf/distro/include/uninative-flags.inc       |   10 -
 meta/lib/oeqa/selftest/cases/distrodata.py         |   43 +
 meta/recipes-bsp/grub/grub2.inc                    |    2 +-
 meta/recipes-core/gettext/gettext_0.19.8.1.bb      |    4 +
 .../autogen/autogen-native_5.18.12.bb              |   40 -
 ...pts.m4-regenerate-it-from-config-libopts..patch |   39 -
 ...2-autoopts-mk-tpl-config.sh-fix-perl-path.patch |   32 -
 .../fix-script-err-when-processing-libguile.patch  |   37 -
 .../autogen/autogen/increase-timeout-limit.patch   |   30 -
 ...ig.sh-force-exit-value-to-be-0-in-subproc.patch |   30 -
 .../{btrfs-tools_4.10.2.bb => btrfs-tools_4.11.bb} |    2 +-
 .../{dmidecode_3.0.bb => dmidecode_3.1.bb}         |    4 +-
 .../recipes-devtools/guile/files/arm_aarch64.patch |   19 -
 .../guile/files/arm_endianness.patch               |   23 -
 ...-modules-are-removed-gc-test-as-unresolve.patch |   39 -
 ...with-owner-not-retained-threads-test-as-u.patch |   33 -
 .../guile/files/guile_2.0.6_fix_sed_error.patch    |   24 -
 .../guile/files/libguile-Makefile.am-hook.patch    |   42 -
 .../guile/files/opensuse/guile-64bit.patch         |   39 -
 .../files/workaround-ice-ssa-corruption.patch      |   60 -
 meta/recipes-devtools/guile/guile_2.0.14.bb        |  125 -
 meta/recipes-devtools/python/python-async_0.6.2.bb |    5 -
 meta/recipes-devtools/python/python-git_2.1.3.bb   |    7 -
 meta/recipes-devtools/python/python-gitdb_0.6.4.bb |    7 -
 meta/recipes-devtools/python/python-mako_1.0.6.bb  |   17 -
 .../python/python-pexpect_4.2.1.bb                 |   28 -
 .../python/python-ptyprocess_0.5.1.bb              |   23 -
 meta/recipes-devtools/python/python-pycurl.inc     |   31 -
 .../python/python-pycurl/no-static-link.patch      |   17 -
 .../python/python-pycurl_7.21.5.bb                 |    3 -
 meta/recipes-devtools/python/python-six_1.10.0.bb  |    4 -
 meta/recipes-devtools/python/python-smmap_0.9.0.bb |    5 -
 .../python/python3-pycurl_7.21.5.bb                |    5 -
 ...bject_3.22.0.bb => python3-pygobject_3.24.1.bb} |    4 +-
 meta/recipes-devtools/remake/remake.inc            |   16 -
 .../remake/remake/version-remake.texi.patch        |   16 -
 meta/recipes-devtools/remake/remake_4.1+dbg-1.1.bb |   28 -
 .../vala/{vala_0.36.2.bb => vala_0.36.3.bb}        |    4 +-
 meta/recipes-extended/logrotate/logrotate_3.9.1.bb |    1 +
 ...e-weak-symbol-optopt-to-fix-FTBFS-on-mips.patch |   59 -
 ...-SSL2-support-since-it-is-no-longer-suppo.patch |   41 -
 ...ntian-warning-warning-macro-N-not-defined.patch |   25 -
 .../0011-outof-Introduce-expandaddr-flag.patch     |   71 -
 ...ble-option-processing-for-email-addresses.patch |   79 -
 ...c-Unconditionally-require-wordexp-support.patch |  113 -
 ...4-globname-Invoke-wordexp-with-WRDE_NOCMD.patch |   31 -
 .../mailx/files/0015-usr-sbin-sendmail.patch       |   38 -
 .../files/explicitly.disable.krb5.support.patch    |   46 -
 meta/recipes-extended/mailx/mailx_12.5-5.bb        |   53 -
 .../packagegroups/packagegroup-core-lsb.bb         |   34 -
 .../{epiphany_3.22.6.bb => epiphany_3.24.2.bb}     |   12 +-
 ...n_1.50.0.bb => gobject-introspection_1.52.1.bb} |    6 +-
 meta/recipes-graphics/libfakekey/libfakekey_git.bb |    4 +-
 meta/recipes-kernel/sysprof/sysprof_3.24.1.bb      |    5 -
 meta/recipes-kernel/trace-cmd/kernelshark_git.bb   |    3 +-
 meta/recipes-kernel/trace-cmd/trace-cmd.inc        |    5 +-
 ...its.h-so-that-PATH_MAX-is-defined-an-issu.patch |   27 +
 meta/recipes-kernel/trace-cmd/trace-cmd_git.bb     |    4 +-
 meta/recipes-lsb4/libpng/libpng12_1.2.57.bb        |   36 -
 meta/recipes-lsb4/perl/libclass-isa-perl_0.36.bb   |   31 -
 meta/recipes-lsb4/perl/libdumpvalue-perl_1.17.bb   |   18 -
 meta/recipes-lsb4/perl/libenv-perl_1.04.bb         |   21 -
 .../perl/libfile-checktree-perl_4.41.bb            |   32 -
 .../recipes-lsb4/perl/libi18n-collate-perl_1.02.bb |   21 -
 meta/recipes-lsb4/perl/libpod-plainer-perl_1.04.bb |   23 -
 .../libid3tag/libid3tag_0.15.1b.bb                 |    2 +
 meta/recipes-multimedia/speex/speex_1.2.0.bb       |    1 +
 .../webkit/webkitgtk/ppc-musl-fix.patch            |   12 +-
 .../{webkitgtk_2.16.1.bb => webkitgtk_2.16.3.bb}   |    5 +-
 ...ac-add-check-for-NO_GETCONTEXT-definition.patch |   29 -
 .../bdwgc/bdwgc/musl_header_fix.patch              |   27 -
 meta/recipes-support/bdwgc/bdwgc_7.6.0.bb          |   42 -
 .../icu/{icu_58.2.bb => icu_59.1.bb}               |    6 +-
 .../libiconv-1.14/add-relocatable-module.patch     | 5008 --------------------
 .../libiconv/libiconv-1.14/autoconf.patch          |   50 -
 meta/recipes-support/libiconv/libiconv_1.14.bb     |   52 -
 .../0001-Support-for-NIOS2-architecture.patch      |  145 -
 .../{liburcu_0.9.3.bb => liburcu_0.10.0.bb}        |    9 +-
 .../npth/{npth_1.3.bb => npth_1.5.bb}              |    9 +-
 84 files changed, 177 insertions(+), 7013 deletions(-)
 create mode 100644 README.LSB
 create mode 100644 meta-selftest/files/distrodata/checkpkg_exceptions
 create mode 100644 meta/lib/oeqa/selftest/cases/distrodata.py
 delete mode 100644 meta/recipes-devtools/autogen/autogen-native_5.18.12.bb
 delete mode 100644 meta/recipes-devtools/autogen/autogen/0001-config-libopts.m4-regenerate-it-from-config-libopts..patch
 delete mode 100644 meta/recipes-devtools/autogen/autogen/0002-autoopts-mk-tpl-config.sh-fix-perl-path.patch
 delete mode 100644 meta/recipes-devtools/autogen/autogen/fix-script-err-when-processing-libguile.patch
 delete mode 100644 meta/recipes-devtools/autogen/autogen/increase-timeout-limit.patch
 delete mode 100644 meta/recipes-devtools/autogen/autogen/mk-tpl-config.sh-force-exit-value-to-be-0-in-subproc.patch
 rename meta/recipes-devtools/btrfs-tools/{btrfs-tools_4.10.2.bb => btrfs-tools_4.11.bb} (95%)
 rename meta/recipes-devtools/dmidecode/{dmidecode_3.0.bb => dmidecode_3.1.bb} (80%)
 delete mode 100644 meta/recipes-devtools/guile/files/arm_aarch64.patch
 delete mode 100644 meta/recipes-devtools/guile/files/arm_endianness.patch
 delete mode 100644 meta/recipes-devtools/guile/files/debian/0002-Mark-Unused-modules-are-removed-gc-test-as-unresolve.patch
 delete mode 100644 meta/recipes-devtools/guile/files/debian/0003-Mark-mutex-with-owner-not-retained-threads-test-as-u.patch
 delete mode 100644 meta/recipes-devtools/guile/files/guile_2.0.6_fix_sed_error.patch
 delete mode 100644 meta/recipes-devtools/guile/files/libguile-Makefile.am-hook.patch
 delete mode 100644 meta/recipes-devtools/guile/files/opensuse/guile-64bit.patch
 delete mode 100644 meta/recipes-devtools/guile/files/workaround-ice-ssa-corruption.patch
 delete mode 100644 meta/recipes-devtools/guile/guile_2.0.14.bb
 delete mode 100644 meta/recipes-devtools/python/python-async_0.6.2.bb
 delete mode 100644 meta/recipes-devtools/python/python-git_2.1.3.bb
 delete mode 100644 meta/recipes-devtools/python/python-gitdb_0.6.4.bb
 delete mode 100644 meta/recipes-devtools/python/python-mako_1.0.6.bb
 delete mode 100644 meta/recipes-devtools/python/python-pexpect_4.2.1.bb
 delete mode 100644 meta/recipes-devtools/python/python-ptyprocess_0.5.1.bb
 delete mode 100644 meta/recipes-devtools/python/python-pycurl.inc
 delete mode 100644 meta/recipes-devtools/python/python-pycurl/no-static-link.patch
 delete mode 100644 meta/recipes-devtools/python/python-pycurl_7.21.5.bb
 delete mode 100644 meta/recipes-devtools/python/python-six_1.10.0.bb
 delete mode 100644 meta/recipes-devtools/python/python-smmap_0.9.0.bb
 delete mode 100644 meta/recipes-devtools/python/python3-pycurl_7.21.5.bb
 rename meta/recipes-devtools/python/{python3-pygobject_3.22.0.bb => python3-pygobject_3.24.1.bb} (87%)
 delete mode 100644 meta/recipes-devtools/remake/remake.inc
 delete mode 100644 meta/recipes-devtools/remake/remake/version-remake.texi.patch
 delete mode 100644 meta/recipes-devtools/remake/remake_4.1+dbg-1.1.bb
 rename meta/recipes-devtools/vala/{vala_0.36.2.bb => vala_0.36.3.bb} (56%)
 delete mode 100644 meta/recipes-extended/mailx/files/0001-Don-t-reuse-weak-symbol-optopt-to-fix-FTBFS-on-mips.patch
 delete mode 100644 meta/recipes-extended/mailx/files/0002-Patched-out-SSL2-support-since-it-is-no-longer-suppo.patch
 delete mode 100644 meta/recipes-extended/mailx/files/0003-Fixed-Lintian-warning-warning-macro-N-not-defined.patch
 delete mode 100644 meta/recipes-extended/mailx/files/0011-outof-Introduce-expandaddr-flag.patch
 delete mode 100644 meta/recipes-extended/mailx/files/0012-unpack-Disable-option-processing-for-email-addresses.patch
 delete mode 100644 meta/recipes-extended/mailx/files/0013-fio.c-Unconditionally-require-wordexp-support.patch
 delete mode 100644 meta/recipes-extended/mailx/files/0014-globname-Invoke-wordexp-with-WRDE_NOCMD.patch
 delete mode 100644 meta/recipes-extended/mailx/files/0015-usr-sbin-sendmail.patch
 delete mode 100644 meta/recipes-extended/mailx/files/explicitly.disable.krb5.support.patch
 delete mode 100644 meta/recipes-extended/mailx/mailx_12.5-5.bb
 rename meta/recipes-gnome/epiphany/{epiphany_3.22.6.bb => epiphany_3.24.2.bb} (57%)
 rename meta/recipes-gnome/gobject-introspection/{gobject-introspection_1.50.0.bb => gobject-introspection_1.52.1.bb} (97%)
 create mode 100644 meta/recipes-kernel/trace-cmd/trace-cmd/0001-Include-limits.h-so-that-PATH_MAX-is-defined-an-issu.patch
 delete mode 100644 meta/recipes-lsb4/libpng/libpng12_1.2.57.bb
 delete mode 100644 meta/recipes-lsb4/perl/libclass-isa-perl_0.36.bb
 delete mode 100644 meta/recipes-lsb4/perl/libdumpvalue-perl_1.17.bb
 delete mode 100644 meta/recipes-lsb4/perl/libenv-perl_1.04.bb
 delete mode 100644 meta/recipes-lsb4/perl/libfile-checktree-perl_4.41.bb
 delete mode 100644 meta/recipes-lsb4/perl/libi18n-collate-perl_1.02.bb
 delete mode 100644 meta/recipes-lsb4/perl/libpod-plainer-perl_1.04.bb
 rename meta/recipes-sato/webkit/{webkitgtk_2.16.1.bb => webkitgtk_2.16.3.bb} (96%)
 delete mode 100644 meta/recipes-support/bdwgc/bdwgc/0001-configure.ac-add-check-for-NO_GETCONTEXT-definition.patch
 delete mode 100644 meta/recipes-support/bdwgc/bdwgc/musl_header_fix.patch
 delete mode 100644 meta/recipes-support/bdwgc/bdwgc_7.6.0.bb
 rename meta/recipes-support/icu/{icu_58.2.bb => icu_59.1.bb} (77%)
 delete mode 100644 meta/recipes-support/libiconv/libiconv-1.14/add-relocatable-module.patch
 delete mode 100644 meta/recipes-support/libiconv/libiconv-1.14/autoconf.patch
 delete mode 100644 meta/recipes-support/libiconv/libiconv_1.14.bb
 delete mode 100644 meta/recipes-support/liburcu/liburcu/0001-Support-for-NIOS2-architecture.patch
 rename meta/recipes-support/liburcu/{liburcu_0.9.3.bb => liburcu_0.10.0.bb} (51%)
 rename meta/recipes-support/npth/{npth_1.3.bb => npth_1.5.bb} (61%)

-- 
2.11.0


