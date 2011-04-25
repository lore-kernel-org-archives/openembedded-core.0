Received: from mga09.intel.com ([134.134.136.24])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <nitin.a.kamble@intel.com>) id 1QE9eC-0002g4-8Y
	for openembedded-core@lists.openembedded.org;
	Mon, 25 Apr 2011 02:27:29 +0200
Received: from orsmga002.jf.intel.com ([10.7.209.21])
	by orsmga102.jf.intel.com with ESMTP; 24 Apr 2011 17:24:59 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="4.64,264,1301900400"; d="scan'208";a="633502458"
Received: from nbuild1.sc.intel.com (HELO localhost) ([172.25.110.36])
	by orsmga002.jf.intel.com with ESMTP; 24 Apr 2011 17:24:59 -0700
Message-Id: <cover.1303690971.git.nitin.a.kamble@intel.com>
Old-Date: Sun, 24 Apr 2011 17:22:51 -0700
Date: Sun, 24 Apr 2011 17:24:38 -0700
To: openembedded-core@lists.openembedded.org,poky@yoctoproject.org
From: Nitin A Kamble <nitin.a.kamble@intel.com>
Subject: [PATCH 0/1] perl recipe upgrade
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
X-List-Received-Date: Mon, 25 Apr 2011 00:27:29 -0000

From: Nitin A Kamble <nitin.a.kamble@intel.com>

Pull URL: git://git.pokylinux.org/poky-contrib.git
  Branch: nitin/upgrades
  Browse: http://git.pokylinux.org/cgit.cgi/poky-contrib/log/?h=nitin/upgrades

Thanks,
    Nitin A Kamble <nitin.a.kamble@intel.com>
---


Nitin A Kamble (1):
  perl: upgrade from 5.12.2 to 5.12.3

 .../09_fix_installperl.patch                       |    6 +-
 .../Configure-multilib.patch                       |    6 +-
 .../{perl-5.12.2 => perl-5.12.3}/Makefile.SH.patch |   44 ++++++------
 .../{perl-5.12.2 => perl-5.12.3}/Makefile.patch    |    6 +-
 .../asm-pageh-fix.patch                            |    6 +-
 .../perl/{perl-5.12.2 => perl-5.12.3}/config.sh    |   46 ++++++------
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
 .../perl/perl-5.12.3/debian/patchlevel             |   45 +++++++++++
 .../debian/perlivp.diff                            |    2 +-
 .../debian/prune_libs.diff                         |    2 +-
 .../perl/perl-5.12.3/debian/series                 |   34 +++++++++
 .../debian/squelch-locale-warnings.diff            |    2 +-
 .../{perl-5.12.2 => perl-5.12.3}/generate-sh.patch |    0
 .../{perl-5.12.2 => perl-5.12.3}/installperl.patch |    6 +-
 .../letgcc-find-errno.patch                        |    6 +-
 .../native-nopacklist.patch                        |    6 +-
 .../native-perlinc.patch                           |    4 +-
 .../{perl-5.12.2 => perl-5.12.3}/native-ssp.patch  |    0
 .../parallel_build_fix_1.patch                     |    0
 .../parallel_build_fix_2.patch                     |    0
 .../parallel_build_fix_3.patch                     |    0
 .../parallel_build_fix_4.patch                     |    0
 .../parallel_build_fix_5.patch                     |   52 +++++++-------
 .../parallel_build_fix_6.patch                     |   36 +++++-----
 .../perl-configpm-switch.patch                     |    0
 .../{perl-5.12.2 => perl-5.12.3}/perl-configure.sh |    2 +-
 .../perl-dynloader.patch                           |    4 +-
 .../perl-enable-gdbm.patch                         |    0
 .../perl-moreconfig.patch                          |    0
 ...perl-native_5.12.2.bb => perl-native_5.12.3.bb} |    8 +-
 ...depends_5.12.2.inc => perl-rdepends_5.12.3.inc} |    0
 ...ovides_5.12.2.inc => perl-rprovides_5.12.3.inc} |    0
 .../perl/{perl_5.12.2.bb => perl_5.12.3.bb}        |   79 ++++++++++----------
 69 files changed, 280 insertions(+), 197 deletions(-)
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
 rename meta/recipes-devtools/perl/{perl-5.12.2 => perl-5.12.3}/native-ssp.patch (100%)
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
 rename meta/recipes-devtools/perl/{perl_5.12.2.bb => perl_5.12.3.bb} (85%)

-- 
1.7.2.2



