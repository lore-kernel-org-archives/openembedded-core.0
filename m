Received: from mail.windriver.com ([147.11.1.11])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <Kai.Kang@windriver.com>) id 1TyJGr-0001zq-In
	for openembedded-core@lists.openembedded.org;
	Thu, 24 Jan 2013 10:38:58 +0100
Received: from ALA-HCA.corp.ad.wrs.com (ala-hca.corp.ad.wrs.com
	[147.11.189.40])
	by mail.windriver.com (8.14.5/8.14.3) with ESMTP id r0O9NNVZ005060
	(version=TLSv1/SSLv3 cipher=AES128-SHA bits=128 verify=FAIL);
	Thu, 24 Jan 2013 01:23:23 -0800 (PST)
Received: from localhost.localdomain (128.224.162.205) by
	ALA-HCA.corp.ad.wrs.com (147.11.189.50) with Microsoft SMTP Server
	(TLS) id 14.2.318.4; Thu, 24 Jan 2013 01:23:23 -0800
From: Kang Kai <kai.kang@windriver.com>
To: <sgw@linux.intel.com>
Date: Thu, 24 Jan 2013 17:24:34 +0800
Message-ID: <cover.1359019292.git.kai.kang@windriver.com>
X-Mailer: git-send-email 1.7.5.4
MIME-Version: 1.0
X-Originating-IP: [128.224.162.205]
Cc: Zhenfeng.Zhao@windriver.com, openembedded-core@lists.openembedded.org
Subject: [PATCH 0/2] V2: Upgrade perl to 5.14.3
X-BeenThere: openembedded-core@lists.openembedded.org
X-Mailman-Version: 2.1.11
Precedence: list
List-Id: Patches and discussions about the oe-core layer
	<openembedded-core.lists.openembedded.org>
List-Unsubscribe: <http://lists.linuxtogo.org/cgi-bin/mailman/options/openembedded-core>,
	<mailto:openembedded-core-request@lists.openembedded.org?subject=unsubscribe>
List-Archive: <http://lists.linuxtogo.org/pipermail/openembedded-core>
List-Post: <mailto:openembedded-core@lists.openembedded.org>
List-Help: <mailto:openembedded-core-request@lists.openembedded.org?subject=help>
List-Subscribe: <http://lists.linuxtogo.org/cgi-bin/mailman/listinfo/openembedded-core>,
	<mailto:openembedded-core-request@lists.openembedded.org?subject=subscribe>
X-List-Received-Date: Thu, 24 Jan 2013 09:38:58 -0000
Content-Type: text/plain

V2:
Update checksum for perl.
And for danny I sent a patch which from upstream to fix the security problem.

The following changes since commit 8d6e55bf2192524bda84138b5356a2791adbbe61:

  prserv: add LOCALCOUNT to AUTOINCs migration feature (2013-01-22 16:01:32 +0000)

are available in the git repository at:
  git://git.pokylinux.org/poky-contrib kangkai/upgrade-perl
  http://git.pokylinux.org/cgit.cgi/poky-contrib/log/?h=kangkai/upgrade-perl

Kang Kai (2):
  perl-native: update to 5.14.3:
  perl: update to 5.14.3

 .../perl-5.14.2/debian/fixes/hurd-ccflags.diff     |   31 ------------
 .../perl/perl-5.14.2/debian/fixes/hurd-hints.diff  |   49 --------------------
 .../09_fix_installperl.patch                       |    0
 .../Configure-multilib.patch                       |    0
 .../{perl-5.14.2 => perl-5.14.3}/MM_Unix.pm.patch  |    0
 .../{perl-5.14.2 => perl-5.14.3}/Makefile.SH.patch |    4 +-
 .../{perl-5.14.2 => perl-5.14.3}/Makefile.patch    |    0
 .../asm-pageh-fix.patch                            |    0
 .../perl/{perl-5.14.2 => perl-5.14.3}/config.sh    |   48 ++++++++++----------
 .../perl/{perl-5.14.2 => perl-5.14.3}/config.sh-32 |    0
 .../{perl-5.14.2 => perl-5.14.3}/config.sh-32-be   |    0
 .../{perl-5.14.2 => perl-5.14.3}/config.sh-32-le   |    0
 .../perl/{perl-5.14.2 => perl-5.14.3}/config.sh-64 |    0
 .../{perl-5.14.2 => perl-5.14.3}/config.sh-64-be   |    0
 .../{perl-5.14.2 => perl-5.14.3}/config.sh-64-le   |    0
 .../cross-generate_uudmap.patch                    |    0
 .../debian/arm_thread_stress_timeout.diff          |    0
 .../debian/cpan_definstalldirs.diff                |    0
 .../debian/cpanplus_config_path.diff               |    0
 .../debian/cpanplus_definstalldirs.diff            |    0
 .../debian/db_file_ver.diff                        |    0
 .../debian/deprecate-with-apt.diff                 |    0
 .../debian/disable-zlib-bundling.diff              |    0
 .../debian/doc_info.diff                           |    0
 .../debian/enc2xs_inc.diff                         |    0
 .../debian/errno_ver.diff                          |    0
 .../debian/extutils_set_libperl_path.diff          |    0
 .../debian/fakeroot.diff                           |    0
 .../debian/find_html2text.diff                     |    0
 .../debian/fixes/document_makemaker_ccflags.diff   |    0
 .../debian/fixes/extutils-cbuilder-cflags.diff     |    0
 .../debian/fixes/h2ph-multiarch.diff               |    0
 .../debian/fixes/index-tainting.diff               |    0
 .../debian/fixes/module-build-home-directory.diff  |    0
 .../debian/fixes/net_smtp_docs.diff                |    0
 .../debian/fixes/pod_fixes.diff                    |    0
 .../debian/fixes/respect_umask.diff                |    0
 .../fixes/sys-syslog-socket-timeout-kfreebsd.patch |    0
 .../debian/instmodsh_doc.diff                      |    0
 .../debian/ld_run_path.diff                        |    0
 .../debian/libnet_config_path.diff                 |    0
 .../debian/libperl_embed_doc.diff                  |    0
 .../debian/m68k_thread_stress.diff                 |    0
 .../debian/mod_paths.diff                          |    0
 .../debian/module_build_man_extensions.diff        |    0
 .../debian/no_packlist_perllocal.diff              |    0
 .../debian/patchlevel.diff                         |    0
 .../debian/perlivp.diff                            |    0
 .../debian/prefix_changes.diff                     |    0
 .../debian/prune_libs.diff                         |    0
 .../{perl-5.14.2 => perl-5.14.3}/debian/series     |    0
 .../debian/skip-kfreebsd-crash.diff                |    0
 .../debian/skip-upstream-git-tests.diff            |    0
 .../debian/squelch-locale-warnings.diff            |    0
 .../debian/writable_site_dirs.diff                 |    0
 .../fix_bad_rpath.patch                            |    0
 .../{perl-5.14.2 => perl-5.14.3}/generate-sh.patch |    0
 .../{perl-5.14.2 => perl-5.14.3}/installperl.patch |    0
 .../letgcc-find-errno.patch                        |    0
 .../native-nopacklist.patch                        |    0
 .../native-perlinc.patch                           |    0
 .../perl-archlib-exp.patch                         |    0
 .../perl-build-in-t-dir.patch                      |    0
 .../perl-configpm-switch.patch                     |    0
 .../{perl-5.14.2 => perl-5.14.3}/perl-configure.sh |    0
 .../perl-dynloader.patch                           |    0
 .../perl-enable-gdbm.patch                         |    0
 .../perl-moreconfig.patch                          |    0
 ...perl-native_5.14.2.bb => perl-native_5.14.3.bb} |    6 +-
 ...depends_5.14.2.inc => perl-rdepends_5.14.3.inc} |    0
 ...ovides_5.14.2.inc => perl-rprovides_5.14.3.inc} |    0
 .../perl/{perl_5.14.2.bb => perl_5.14.3.bb}        |   10 +---
 72 files changed, 32 insertions(+), 116 deletions(-)
 delete mode 100644 meta/recipes-devtools/perl/perl-5.14.2/debian/fixes/hurd-ccflags.diff
 delete mode 100644 meta/recipes-devtools/perl/perl-5.14.2/debian/fixes/hurd-hints.diff
 rename meta/recipes-devtools/perl/{perl-5.14.2 => perl-5.14.3}/09_fix_installperl.patch (100%)
 rename meta/recipes-devtools/perl/{perl-5.14.2 => perl-5.14.3}/Configure-multilib.patch (100%)
 rename meta/recipes-devtools/perl/{perl-5.14.2 => perl-5.14.3}/MM_Unix.pm.patch (100%)
 rename meta/recipes-devtools/perl/{perl-5.14.2 => perl-5.14.3}/Makefile.SH.patch (99%)
 rename meta/recipes-devtools/perl/{perl-5.14.2 => perl-5.14.3}/Makefile.patch (100%)
 rename meta/recipes-devtools/perl/{perl-5.14.2 => perl-5.14.3}/asm-pageh-fix.patch (100%)
 rename meta/recipes-devtools/perl/{perl-5.14.2 => perl-5.14.3}/config.sh (95%)
 rename meta/recipes-devtools/perl/{perl-5.14.2 => perl-5.14.3}/config.sh-32 (100%)
 rename meta/recipes-devtools/perl/{perl-5.14.2 => perl-5.14.3}/config.sh-32-be (100%)
 rename meta/recipes-devtools/perl/{perl-5.14.2 => perl-5.14.3}/config.sh-32-le (100%)
 rename meta/recipes-devtools/perl/{perl-5.14.2 => perl-5.14.3}/config.sh-64 (100%)
 rename meta/recipes-devtools/perl/{perl-5.14.2 => perl-5.14.3}/config.sh-64-be (100%)
 rename meta/recipes-devtools/perl/{perl-5.14.2 => perl-5.14.3}/config.sh-64-le (100%)
 rename meta/recipes-devtools/perl/{perl-5.14.2 => perl-5.14.3}/cross-generate_uudmap.patch (100%)
 rename meta/recipes-devtools/perl/{perl-5.14.2 => perl-5.14.3}/debian/arm_thread_stress_timeout.diff (100%)
 rename meta/recipes-devtools/perl/{perl-5.14.2 => perl-5.14.3}/debian/cpan_definstalldirs.diff (100%)
 rename meta/recipes-devtools/perl/{perl-5.14.2 => perl-5.14.3}/debian/cpanplus_config_path.diff (100%)
 rename meta/recipes-devtools/perl/{perl-5.14.2 => perl-5.14.3}/debian/cpanplus_definstalldirs.diff (100%)
 rename meta/recipes-devtools/perl/{perl-5.14.2 => perl-5.14.3}/debian/db_file_ver.diff (100%)
 rename meta/recipes-devtools/perl/{perl-5.14.2 => perl-5.14.3}/debian/deprecate-with-apt.diff (100%)
 rename meta/recipes-devtools/perl/{perl-5.14.2 => perl-5.14.3}/debian/disable-zlib-bundling.diff (100%)
 rename meta/recipes-devtools/perl/{perl-5.14.2 => perl-5.14.3}/debian/doc_info.diff (100%)
 rename meta/recipes-devtools/perl/{perl-5.14.2 => perl-5.14.3}/debian/enc2xs_inc.diff (100%)
 rename meta/recipes-devtools/perl/{perl-5.14.2 => perl-5.14.3}/debian/errno_ver.diff (100%)
 rename meta/recipes-devtools/perl/{perl-5.14.2 => perl-5.14.3}/debian/extutils_set_libperl_path.diff (100%)
 rename meta/recipes-devtools/perl/{perl-5.14.2 => perl-5.14.3}/debian/fakeroot.diff (100%)
 rename meta/recipes-devtools/perl/{perl-5.14.2 => perl-5.14.3}/debian/find_html2text.diff (100%)
 rename meta/recipes-devtools/perl/{perl-5.14.2 => perl-5.14.3}/debian/fixes/document_makemaker_ccflags.diff (100%)
 rename meta/recipes-devtools/perl/{perl-5.14.2 => perl-5.14.3}/debian/fixes/extutils-cbuilder-cflags.diff (100%)
 rename meta/recipes-devtools/perl/{perl-5.14.2 => perl-5.14.3}/debian/fixes/h2ph-multiarch.diff (100%)
 rename meta/recipes-devtools/perl/{perl-5.14.2 => perl-5.14.3}/debian/fixes/index-tainting.diff (100%)
 rename meta/recipes-devtools/perl/{perl-5.14.2 => perl-5.14.3}/debian/fixes/module-build-home-directory.diff (100%)
 rename meta/recipes-devtools/perl/{perl-5.14.2 => perl-5.14.3}/debian/fixes/net_smtp_docs.diff (100%)
 rename meta/recipes-devtools/perl/{perl-5.14.2 => perl-5.14.3}/debian/fixes/pod_fixes.diff (100%)
 rename meta/recipes-devtools/perl/{perl-5.14.2 => perl-5.14.3}/debian/fixes/respect_umask.diff (100%)
 rename meta/recipes-devtools/perl/{perl-5.14.2 => perl-5.14.3}/debian/fixes/sys-syslog-socket-timeout-kfreebsd.patch (100%)
 rename meta/recipes-devtools/perl/{perl-5.14.2 => perl-5.14.3}/debian/instmodsh_doc.diff (100%)
 rename meta/recipes-devtools/perl/{perl-5.14.2 => perl-5.14.3}/debian/ld_run_path.diff (100%)
 rename meta/recipes-devtools/perl/{perl-5.14.2 => perl-5.14.3}/debian/libnet_config_path.diff (100%)
 rename meta/recipes-devtools/perl/{perl-5.14.2 => perl-5.14.3}/debian/libperl_embed_doc.diff (100%)
 rename meta/recipes-devtools/perl/{perl-5.14.2 => perl-5.14.3}/debian/m68k_thread_stress.diff (100%)
 rename meta/recipes-devtools/perl/{perl-5.14.2 => perl-5.14.3}/debian/mod_paths.diff (100%)
 rename meta/recipes-devtools/perl/{perl-5.14.2 => perl-5.14.3}/debian/module_build_man_extensions.diff (100%)
 rename meta/recipes-devtools/perl/{perl-5.14.2 => perl-5.14.3}/debian/no_packlist_perllocal.diff (100%)
 rename meta/recipes-devtools/perl/{perl-5.14.2 => perl-5.14.3}/debian/patchlevel.diff (100%)
 rename meta/recipes-devtools/perl/{perl-5.14.2 => perl-5.14.3}/debian/perlivp.diff (100%)
 rename meta/recipes-devtools/perl/{perl-5.14.2 => perl-5.14.3}/debian/prefix_changes.diff (100%)
 rename meta/recipes-devtools/perl/{perl-5.14.2 => perl-5.14.3}/debian/prune_libs.diff (100%)
 rename meta/recipes-devtools/perl/{perl-5.14.2 => perl-5.14.3}/debian/series (100%)
 rename meta/recipes-devtools/perl/{perl-5.14.2 => perl-5.14.3}/debian/skip-kfreebsd-crash.diff (100%)
 rename meta/recipes-devtools/perl/{perl-5.14.2 => perl-5.14.3}/debian/skip-upstream-git-tests.diff (100%)
 rename meta/recipes-devtools/perl/{perl-5.14.2 => perl-5.14.3}/debian/squelch-locale-warnings.diff (100%)
 rename meta/recipes-devtools/perl/{perl-5.14.2 => perl-5.14.3}/debian/writable_site_dirs.diff (100%)
 rename meta/recipes-devtools/perl/{perl-5.14.2 => perl-5.14.3}/fix_bad_rpath.patch (100%)
 rename meta/recipes-devtools/perl/{perl-5.14.2 => perl-5.14.3}/generate-sh.patch (100%)
 rename meta/recipes-devtools/perl/{perl-5.14.2 => perl-5.14.3}/installperl.patch (100%)
 rename meta/recipes-devtools/perl/{perl-5.14.2 => perl-5.14.3}/letgcc-find-errno.patch (100%)
 rename meta/recipes-devtools/perl/{perl-5.14.2 => perl-5.14.3}/native-nopacklist.patch (100%)
 rename meta/recipes-devtools/perl/{perl-5.14.2 => perl-5.14.3}/native-perlinc.patch (100%)
 rename meta/recipes-devtools/perl/{perl-5.14.2 => perl-5.14.3}/perl-archlib-exp.patch (100%)
 rename meta/recipes-devtools/perl/{perl-5.14.2 => perl-5.14.3}/perl-build-in-t-dir.patch (100%)
 rename meta/recipes-devtools/perl/{perl-5.14.2 => perl-5.14.3}/perl-configpm-switch.patch (100%)
 rename meta/recipes-devtools/perl/{perl-5.14.2 => perl-5.14.3}/perl-configure.sh (100%)
 rename meta/recipes-devtools/perl/{perl-5.14.2 => perl-5.14.3}/perl-dynloader.patch (100%)
 rename meta/recipes-devtools/perl/{perl-5.14.2 => perl-5.14.3}/perl-enable-gdbm.patch (100%)
 rename meta/recipes-devtools/perl/{perl-5.14.2 => perl-5.14.3}/perl-moreconfig.patch (100%)
 rename meta/recipes-devtools/perl/{perl-native_5.14.2.bb => perl-native_5.14.3.bb} (96%)
 rename meta/recipes-devtools/perl/{perl-rdepends_5.14.2.inc => perl-rdepends_5.14.3.inc} (100%)
 rename meta/recipes-devtools/perl/{perl-rprovides_5.14.2.inc => perl-rprovides_5.14.3.inc} (100%)
 rename meta/recipes-devtools/perl/{perl_5.14.2.bb => perl_5.14.3.bb} (97%)

-- 
1.7.5.4



