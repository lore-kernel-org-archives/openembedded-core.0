Received: from mga02.intel.com ([134.134.136.20])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <nitin.a.kamble@intel.com>) id 1RH7Ku-0003vO-49
	for openembedded-core@lists.openembedded.org;
	Fri, 21 Oct 2011 07:08:04 +0200
Received: from orsmga001.jf.intel.com ([10.7.209.18])
	by orsmga101.jf.intel.com with ESMTP; 20 Oct 2011 22:02:10 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="4.67,352,1309762800"; d="scan'208";a="65429987"
Received: from nbuild0.sc.intel.com ([172.25.110.36])
	by orsmga001.jf.intel.com with ESMTP; 20 Oct 2011 22:02:10 -0700
From: nitin.a.kamble@intel.com
To: openembedded-core@lists.openembedded.org
Date: Thu, 20 Oct 2011 22:02:06 -0700
Message-Id: <cover.1319172568.git.nitin.a.kamble@intel.com>
X-Mailer: git-send-email 1.7.6.4
Subject: [PATCH 0/1] perl upgrade V2
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
X-List-Received-Date: Fri, 21 Oct 2011 05:08:04 -0000

From: Nitin A Kamble <nitin.a.kamble@intel.com>

I fixed a build issue I observer on mips in the v2. 

The following changes since commit 72a1e63b67445c65954c21f5cbfab74d617a257f:

  distro-tracking-fields: update fields for tzdata and gst-plugins-good (2011-10-20 17:13:42 +0100)

are available in the git repository at:
  git://git.pokylinux.org/poky-contrib nitin/perl
  http://git.pokylinux.org/cgit.cgi/poky-contrib/log/?h=nitin/perl

Nitin A Kamble (1):
  perl: upgrade from 5.12.3 to 5.14.2

 .../perl/files/Configure-multilib.patch            |   17 -
 .../perl/perl-5.12.3/cross-generate_uudmap.patch   |   15 -
 .../perl/perl-5.12.3/debian/arm_optim.diff         |   34 -
 .../perl/perl-5.12.3/debian/cpan_config_path.diff  |   24 -
 .../perl-5.12.3/debian/deprecate-with-apt.diff     |   61 -
 .../debian/devel-ppport-ia64-optim.diff            |   34 -
 .../perl/perl-5.12.3/debian/extutils_hacks.diff    |  315 -
 .../perl-5.12.3/debian/fixes/autodie-flock.diff    |  100 -
 .../debian/fixes/concat-stack-corruption.diff      |   39 -
 .../debian/fixes/cpanplus-without-home.diff        |   32 -
 .../perl-5.12.3/debian/fixes/h2ph-gcc-4.5.diff     |  108 -
 .../perl-5.12.3/debian/fixes/lc-numeric-docs.diff  |   97 -
 .../debian/fixes/lc-numeric-sprintf.diff           |   31 -
 .../perl/perl-5.12.3/debian/fixes/processPL.diff   |   45 -
 .../perl/perl-5.12.3/debian/patchlevel             |   45 -
 .../perl/perl-5.12.3/debian/series                 |   34 -
 .../perl/perl-5.12.3/parallel_build_fix_1.patch    |   27 -
 .../perl/perl-5.12.3/parallel_build_fix_2.patch    |   24 -
 .../perl/perl-5.12.3/parallel_build_fix_3.patch    | 6585 --------------------
 .../perl/perl-5.12.3/parallel_build_fix_4.patch    |   57 -
 .../perl/perl-5.12.3/parallel_build_fix_5.patch    |  430 --
 .../perl/perl-5.12.3/parallel_build_fix_6.patch    |  158 -
 .../09_fix_installperl.patch                       |    0
 .../Configure-multilib.patch                       |    0
 .../{perl-5.12.3 => perl-5.14.2}/MM_Unix.pm.patch  |    0
 .../{perl-5.12.3 => perl-5.14.2}/Makefile.SH.patch |  122 +-
 .../{perl-5.12.3 => perl-5.14.2}/Makefile.patch    |   17 +-
 .../asm-pageh-fix.patch                            |    0
 .../perl/{perl-5.12.3 => perl-5.14.2}/config.sh    |   65 +-
 .../perl/{perl-5.12.3 => perl-5.14.2}/config.sh-32 |    0
 .../{perl-5.12.3 => perl-5.14.2}/config.sh-32-be   |    0
 .../{perl-5.12.3 => perl-5.14.2}/config.sh-32-le   |    0
 .../perl/{perl-5.12.3 => perl-5.14.2}/config.sh-64 |    0
 .../{perl-5.12.3 => perl-5.14.2}/config.sh-64-be   |    0
 .../{perl-5.12.3 => perl-5.14.2}/config.sh-64-le   |    0
 .../perl/perl-5.14.2/cross-generate_uudmap.patch   |   15 +
 .../debian/arm_thread_stress_timeout.diff          |   13 +-
 .../debian/cpan_definstalldirs.diff                |   18 +-
 .../debian/cpanplus_config_path.diff               |   19 +-
 .../debian/cpanplus_definstalldirs.diff            |   13 +-
 .../debian/db_file_ver.diff                        |   12 +-
 .../perl-5.14.2/debian/deprecate-with-apt.diff     |  406 ++
 .../debian/disable-zlib-bundling.diff              |    7 +-
 .../debian/doc_info.diff                           |   16 +-
 .../debian/enc2xs_inc.diff                         |    9 +-
 .../debian/errno_ver.diff                          |   23 +-
 .../debian/extutils_set_libperl_path.diff          |   23 +
 .../debian/fakeroot.diff                           |   15 +-
 .../perl/perl-5.14.2/debian/find_html2text.diff    |   35 +
 .../debian/fixes/document_makemaker_ccflags.diff   |   31 +
 .../debian/fixes/extutils-cbuilder-cflags.diff     |   86 +
 .../perl-5.14.2/debian/fixes/h2ph-multiarch.diff   |   69 +
 .../debian/fixes/hurd-ccflags.diff                 |   12 +-
 .../perl/perl-5.14.2/debian/fixes/hurd-hints.diff  |   48 +
 .../perl-5.14.2/debian/fixes/index-tainting.diff   |   73 +
 .../debian/fixes/module-build-home-directory.diff  |   37 +
 .../debian/fixes/net_smtp_docs.diff                |   10 +-
 .../perl/perl-5.14.2/debian/fixes/pod_fixes.diff   |  145 +
 .../perl-5.14.2/debian/fixes/respect_umask.diff    |  153 +
 .../fixes/sys-syslog-socket-timeout-kfreebsd.patch |   36 +
 .../debian/instmodsh_doc.diff                      |    9 +-
 .../debian/ld_run_path.diff                        |   15 +-
 .../debian/libnet_config_path.diff                 |   12 +-
 .../perl/perl-5.14.2/debian/libperl_embed_doc.diff |   26 +
 .../debian/m68k_thread_stress.diff                 |   15 +-
 .../debian/mod_paths.diff                          |   15 +-
 .../debian/module_build_man_extensions.diff        |   16 +-
 .../perl-5.14.2/debian/no_packlist_perllocal.diff  |   88 +
 .../perl/perl-5.14.2/debian/patchlevel.diff        |   30 +
 .../debian/perlivp.diff                            |   19 +-
 .../perl/perl-5.14.2/debian/prefix_changes.diff    |  118 +
 .../debian/prune_libs.diff                         |   16 +-
 .../perl/perl-5.14.2/debian/series                 |   40 +
 .../perl-5.14.2/debian/skip-kfreebsd-crash.diff    |   39 +
 .../debian/skip-upstream-git-tests.diff            |   59 +
 .../debian/squelch-locale-warnings.diff            |   14 +-
 .../perl-5.14.2/debian/writable_site_dirs.diff     |   36 +
 .../fix_bad_rpath.patch                            |   13 +-
 .../{perl-5.12.3 => perl-5.14.2}/generate-sh.patch |    0
 .../{perl-5.12.3 => perl-5.14.2}/installperl.patch |    0
 .../letgcc-find-errno.patch                        |    0
 .../native-nopacklist.patch                        |    0
 .../native-perlinc.patch                           |    0
 .../perl-configpm-switch.patch                     |   18 +-
 .../{perl-5.12.3 => perl-5.14.2}/perl-configure.sh |    0
 .../perl-dynloader.patch                           |   21 +-
 .../perl-enable-gdbm.patch                         |    0
 .../perl-moreconfig.patch                          |    0
 ...perl-native_5.12.3.bb => perl-native_5.14.2.bb} |   32 +-
 ...depends_5.12.3.inc => perl-rdepends_5.14.2.inc} |   54 +-
 ...ovides_5.12.3.inc => perl-rprovides_5.14.2.inc} |    0
 .../perl/{perl_5.12.3.bb => perl_5.14.2.bb}        |   49 +-
 92 files changed, 1951 insertions(+), 8643 deletions(-)
 delete mode 100644 meta/recipes-devtools/perl/files/Configure-multilib.patch
 delete mode 100644 meta/recipes-devtools/perl/perl-5.12.3/cross-generate_uudmap.patch
 delete mode 100644 meta/recipes-devtools/perl/perl-5.12.3/debian/arm_optim.diff
 delete mode 100644 meta/recipes-devtools/perl/perl-5.12.3/debian/cpan_config_path.diff
 delete mode 100644 meta/recipes-devtools/perl/perl-5.12.3/debian/deprecate-with-apt.diff
 delete mode 100644 meta/recipes-devtools/perl/perl-5.12.3/debian/devel-ppport-ia64-optim.diff
 delete mode 100644 meta/recipes-devtools/perl/perl-5.12.3/debian/extutils_hacks.diff
 delete mode 100644 meta/recipes-devtools/perl/perl-5.12.3/debian/fixes/autodie-flock.diff
 delete mode 100644 meta/recipes-devtools/perl/perl-5.12.3/debian/fixes/concat-stack-corruption.diff
 delete mode 100644 meta/recipes-devtools/perl/perl-5.12.3/debian/fixes/cpanplus-without-home.diff
 delete mode 100644 meta/recipes-devtools/perl/perl-5.12.3/debian/fixes/h2ph-gcc-4.5.diff
 delete mode 100644 meta/recipes-devtools/perl/perl-5.12.3/debian/fixes/lc-numeric-docs.diff
 delete mode 100644 meta/recipes-devtools/perl/perl-5.12.3/debian/fixes/lc-numeric-sprintf.diff
 delete mode 100644 meta/recipes-devtools/perl/perl-5.12.3/debian/fixes/processPL.diff
 delete mode 100644 meta/recipes-devtools/perl/perl-5.12.3/debian/patchlevel
 delete mode 100644 meta/recipes-devtools/perl/perl-5.12.3/debian/series
 delete mode 100644 meta/recipes-devtools/perl/perl-5.12.3/parallel_build_fix_1.patch
 delete mode 100644 meta/recipes-devtools/perl/perl-5.12.3/parallel_build_fix_2.patch
 delete mode 100644 meta/recipes-devtools/perl/perl-5.12.3/parallel_build_fix_3.patch
 delete mode 100644 meta/recipes-devtools/perl/perl-5.12.3/parallel_build_fix_4.patch
 delete mode 100644 meta/recipes-devtools/perl/perl-5.12.3/parallel_build_fix_5.patch
 delete mode 100644 meta/recipes-devtools/perl/perl-5.12.3/parallel_build_fix_6.patch
 rename meta/recipes-devtools/perl/{perl-5.12.3 => perl-5.14.2}/09_fix_installperl.patch (100%)
 rename meta/recipes-devtools/perl/{perl-5.12.3 => perl-5.14.2}/Configure-multilib.patch (100%)
 rename meta/recipes-devtools/perl/{perl-5.12.3 => perl-5.14.2}/MM_Unix.pm.patch (100%)
 rename meta/recipes-devtools/perl/{perl-5.12.3 => perl-5.14.2}/Makefile.SH.patch (75%)
 rename meta/recipes-devtools/perl/{perl-5.12.3 => perl-5.14.2}/Makefile.patch (87%)
 rename meta/recipes-devtools/perl/{perl-5.12.3 => perl-5.14.2}/asm-pageh-fix.patch (100%)
 rename meta/recipes-devtools/perl/{perl-5.12.3 => perl-5.14.2}/config.sh (94%)
 rename meta/recipes-devtools/perl/{perl-5.12.3 => perl-5.14.2}/config.sh-32 (100%)
 rename meta/recipes-devtools/perl/{perl-5.12.3 => perl-5.14.2}/config.sh-32-be (100%)
 rename meta/recipes-devtools/perl/{perl-5.12.3 => perl-5.14.2}/config.sh-32-le (100%)
 rename meta/recipes-devtools/perl/{perl-5.12.3 => perl-5.14.2}/config.sh-64 (100%)
 rename meta/recipes-devtools/perl/{perl-5.12.3 => perl-5.14.2}/config.sh-64-be (100%)
 rename meta/recipes-devtools/perl/{perl-5.12.3 => perl-5.14.2}/config.sh-64-le (100%)
 create mode 100644 meta/recipes-devtools/perl/perl-5.14.2/cross-generate_uudmap.patch
 rename meta/recipes-devtools/perl/{perl-5.12.3 => perl-5.14.2}/debian/arm_thread_stress_timeout.diff (66%)
 rename meta/recipes-devtools/perl/{perl-5.12.3 => perl-5.14.2}/debian/cpan_definstalldirs.diff (80%)
 rename meta/recipes-devtools/perl/{perl-5.12.3 => perl-5.14.2}/debian/cpanplus_config_path.diff (83%)
 rename meta/recipes-devtools/perl/{perl-5.12.3 => perl-5.14.2}/debian/cpanplus_definstalldirs.diff (84%)
 rename meta/recipes-devtools/perl/{perl-5.12.3 => perl-5.14.2}/debian/db_file_ver.diff (83%)
 create mode 100644 meta/recipes-devtools/perl/perl-5.14.2/debian/deprecate-with-apt.diff
 rename meta/recipes-devtools/perl/{perl-5.12.3 => perl-5.14.2}/debian/disable-zlib-bundling.diff (83%)
 rename meta/recipes-devtools/perl/{perl-5.12.3 => perl-5.14.2}/debian/doc_info.diff (78%)
 rename meta/recipes-devtools/perl/{perl-5.12.3 => perl-5.14.2}/debian/enc2xs_inc.diff (90%)
 rename meta/recipes-devtools/perl/{perl-5.12.3 => perl-5.14.2}/debian/errno_ver.diff (70%)
 create mode 100644 meta/recipes-devtools/perl/perl-5.14.2/debian/extutils_set_libperl_path.diff
 rename meta/recipes-devtools/perl/{perl-5.12.3 => perl-5.14.2}/debian/fakeroot.diff (79%)
 create mode 100644 meta/recipes-devtools/perl/perl-5.14.2/debian/find_html2text.diff
 create mode 100644 meta/recipes-devtools/perl/perl-5.14.2/debian/fixes/document_makemaker_ccflags.diff
 create mode 100644 meta/recipes-devtools/perl/perl-5.14.2/debian/fixes/extutils-cbuilder-cflags.diff
 create mode 100644 meta/recipes-devtools/perl/perl-5.14.2/debian/fixes/h2ph-multiarch.diff
 rename meta/recipes-devtools/perl/{perl-5.12.3 => perl-5.14.2}/debian/fixes/hurd-ccflags.diff (67%)
 create mode 100644 meta/recipes-devtools/perl/perl-5.14.2/debian/fixes/hurd-hints.diff
 create mode 100644 meta/recipes-devtools/perl/perl-5.14.2/debian/fixes/index-tainting.diff
 create mode 100644 meta/recipes-devtools/perl/perl-5.14.2/debian/fixes/module-build-home-directory.diff
 rename meta/recipes-devtools/perl/{perl-5.12.3 => perl-5.14.2}/debian/fixes/net_smtp_docs.diff (76%)
 create mode 100644 meta/recipes-devtools/perl/perl-5.14.2/debian/fixes/pod_fixes.diff
 create mode 100644 meta/recipes-devtools/perl/perl-5.14.2/debian/fixes/respect_umask.diff
 create mode 100644 meta/recipes-devtools/perl/perl-5.14.2/debian/fixes/sys-syslog-socket-timeout-kfreebsd.patch
 rename meta/recipes-devtools/perl/{perl-5.12.3 => perl-5.14.2}/debian/instmodsh_doc.diff (81%)
 rename meta/recipes-devtools/perl/{perl-5.12.3 => perl-5.14.2}/debian/ld_run_path.diff (68%)
 rename meta/recipes-devtools/perl/{perl-5.12.3 => perl-5.14.2}/debian/libnet_config_path.diff (85%)
 create mode 100644 meta/recipes-devtools/perl/perl-5.14.2/debian/libperl_embed_doc.diff
 rename meta/recipes-devtools/perl/{perl-5.12.3 => perl-5.14.2}/debian/m68k_thread_stress.diff (78%)
 rename meta/recipes-devtools/perl/{perl-5.12.3 => perl-5.14.2}/debian/mod_paths.diff (89%)
 rename meta/recipes-devtools/perl/{perl-5.12.3 => perl-5.14.2}/debian/module_build_man_extensions.diff (81%)
 create mode 100644 meta/recipes-devtools/perl/perl-5.14.2/debian/no_packlist_perllocal.diff
 create mode 100644 meta/recipes-devtools/perl/perl-5.14.2/debian/patchlevel.diff
 rename meta/recipes-devtools/perl/{perl-5.12.3 => perl-5.14.2}/debian/perlivp.diff (77%)
 create mode 100644 meta/recipes-devtools/perl/perl-5.14.2/debian/prefix_changes.diff
 rename meta/recipes-devtools/perl/{perl-5.12.3 => perl-5.14.2}/debian/prune_libs.diff (81%)
 create mode 100644 meta/recipes-devtools/perl/perl-5.14.2/debian/series
 create mode 100644 meta/recipes-devtools/perl/perl-5.14.2/debian/skip-kfreebsd-crash.diff
 create mode 100644 meta/recipes-devtools/perl/perl-5.14.2/debian/skip-upstream-git-tests.diff
 rename meta/recipes-devtools/perl/{perl-5.12.3 => perl-5.14.2}/debian/squelch-locale-warnings.diff (86%)
 create mode 100644 meta/recipes-devtools/perl/perl-5.14.2/debian/writable_site_dirs.diff
 rename meta/recipes-devtools/perl/{perl-5.12.3 => perl-5.14.2}/fix_bad_rpath.patch (70%)
 rename meta/recipes-devtools/perl/{perl-5.12.3 => perl-5.14.2}/generate-sh.patch (100%)
 rename meta/recipes-devtools/perl/{perl-5.12.3 => perl-5.14.2}/installperl.patch (100%)
 rename meta/recipes-devtools/perl/{perl-5.12.3 => perl-5.14.2}/letgcc-find-errno.patch (100%)
 rename meta/recipes-devtools/perl/{perl-5.12.3 => perl-5.14.2}/native-nopacklist.patch (100%)
 rename meta/recipes-devtools/perl/{perl-5.12.3 => perl-5.14.2}/native-perlinc.patch (100%)
 rename meta/recipes-devtools/perl/{perl-5.12.3 => perl-5.14.2}/perl-configpm-switch.patch (76%)
 rename meta/recipes-devtools/perl/{perl-5.12.3 => perl-5.14.2}/perl-configure.sh (100%)
 rename meta/recipes-devtools/perl/{perl-5.12.3 => perl-5.14.2}/perl-dynloader.patch (69%)
 rename meta/recipes-devtools/perl/{perl-5.12.3 => perl-5.14.2}/perl-enable-gdbm.patch (100%)
 rename meta/recipes-devtools/perl/{perl-5.12.3 => perl-5.14.2}/perl-moreconfig.patch (100%)
 rename meta/recipes-devtools/perl/{perl-native_5.12.3.bb => perl-native_5.14.2.bb} (74%)
 rename meta/recipes-devtools/perl/{perl-rdepends_5.12.3.inc => perl-rdepends_5.14.2.inc} (90%)
 rename meta/recipes-devtools/perl/{perl-rprovides_5.12.3.inc => perl-rprovides_5.14.2.inc} (100%)
 rename meta/recipes-devtools/perl/{perl_5.12.3.bb => perl_5.14.2.bb} (92%)

-- 
1.7.6.4



