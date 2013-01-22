Received: from mail.windriver.com ([147.11.1.11])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <Kai.Kang@windriver.com>) id 1TxTbr-0005uL-2X
	for openembedded-core@lists.openembedded.org;
	Tue, 22 Jan 2013 03:29:11 +0100
Received: from ALA-HCA.corp.ad.wrs.com (ala-hca.corp.ad.wrs.com
	[147.11.189.40])
	by mail.windriver.com (8.14.5/8.14.3) with ESMTP id r0M2De3t008013
	(version=TLSv1/SSLv3 cipher=AES128-SHA bits=128 verify=FAIL);
	Mon, 21 Jan 2013 18:13:40 -0800 (PST)
Received: from localhost.localdomain (128.224.162.205) by
	ALA-HCA.corp.ad.wrs.com (147.11.189.50) with Microsoft SMTP Server
	(TLS) id 14.2.318.4; Mon, 21 Jan 2013 18:13:40 -0800
From: Kang Kai <kai.kang@windriver.com>
To: <openembedded-core@lists.openembedded.org>
Date: Tue, 22 Jan 2013 10:14:51 +0800
Message-ID: <2a2ec8be3f7be19c7088c14c620b1f0582505a5e.1358763272.git.kai.kang@windriver.com>
X-Mailer: git-send-email 1.7.5.4
In-Reply-To: <cover.1358763271.git.kai.kang@windriver.com>
References: <cover.1358763271.git.kai.kang@windriver.com>
MIME-Version: 1.0
X-Originating-IP: [128.224.162.205]
Cc: Zhenfeng.Zhao@windriver.com, scott.a.garman@intel.com
Subject: [PATCH 2/2] perl: update to 5.14.3
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
X-List-Received-Date: Tue, 22 Jan 2013 02:29:12 -0000
Content-Type: text/plain

There is a securty issue:
http://web.nvd.nist.gov/view/vuln/detail?vulnId=CVE-2012-5195
Update perl to 5.14.3 to resolve this problem.

Patches hurd-ccflags.diff, h2ph-multiarch.diff, index-tainting.diff and
hurd-hints.diff have been merged, so remove them from SRC_URI.
Update patches config.sh and Makefile.SH.patch with new PV.

[Yocto 3701]

Signed-off-by: Kang Kai <kai.kang@windriver.com>
---
 .../perl-5.14.2/debian/fixes/hurd-ccflags.diff     |   31 ------------
 .../perl/perl-5.14.2/debian/fixes/hurd-hints.diff  |   49 --------------------
 .../09_fix_installperl.patch                       |    0
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
 .../perl-archlib-exp.patch                         |    0
 .../{perl-5.14.2 => perl-5.14.3}/perl-configure.sh |    0
 .../perl-dynloader.patch                           |    0
 .../perl-enable-gdbm.patch                         |    0
 .../perl-moreconfig.patch                          |    0
 ...depends_5.14.2.inc => perl-rdepends_5.14.3.inc} |    0
 ...ovides_5.14.2.inc => perl-rprovides_5.14.3.inc} |    0
 .../perl/{perl_5.14.2.bb => perl_5.14.3.bb}        |    6 +--
 65 files changed, 27 insertions(+), 111 deletions(-)
 delete mode 100644 meta/recipes-devtools/perl/perl-5.14.2/debian/fixes/hurd-ccflags.diff
 delete mode 100644 meta/recipes-devtools/perl/perl-5.14.2/debian/fixes/hurd-hints.diff
 rename meta/recipes-devtools/perl/{perl-5.14.2 => perl-5.14.3}/09_fix_installperl.patch (100%)
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
 rename meta/recipes-devtools/perl/{perl-5.14.2 => perl-5.14.3}/perl-archlib-exp.patch (100%)
 rename meta/recipes-devtools/perl/{perl-5.14.2 => perl-5.14.3}/perl-configure.sh (100%)
 rename meta/recipes-devtools/perl/{perl-5.14.2 => perl-5.14.3}/perl-dynloader.patch (100%)
 rename meta/recipes-devtools/perl/{perl-5.14.2 => perl-5.14.3}/perl-enable-gdbm.patch (100%)
 rename meta/recipes-devtools/perl/{perl-5.14.2 => perl-5.14.3}/perl-moreconfig.patch (100%)
 rename meta/recipes-devtools/perl/{perl-rdepends_5.14.2.inc => perl-rdepends_5.14.3.inc} (100%)
 rename meta/recipes-devtools/perl/{perl-rprovides_5.14.2.inc => perl-rprovides_5.14.3.inc} (100%)
 rename meta/recipes-devtools/perl/{perl_5.14.2.bb => perl_5.14.3.bb} (98%)

diff --git a/meta/recipes-devtools/perl/perl-5.14.2/debian/fixes/hurd-ccflags.diff b/meta/recipes-devtools/perl/perl-5.14.2/debian/fixes/hurd-ccflags.diff
deleted file mode 100644
index 6822720..0000000
--- a/meta/recipes-devtools/perl/perl-5.14.2/debian/fixes/hurd-ccflags.diff
+++ /dev/null
@@ -1,31 +0,0 @@
-Upstream-Status:Inappropriate [debian patches]
-From f66e8575cb0ca11171f43efe0f9e3c6e790b75bc Mon Sep 17 00:00:00 2001
-From: Samuel Thibault <sthibault@debian.org>
-Date: Wed, 4 Aug 2010 13:34:05 +0300
-Subject: Make hints/gnu.sh append to $ccflags rather than overriding them
-
-Bug: http://rt.perl.org/rt3/Public/Bug/Display.html?id=92244
-Bug-Debian: http://bugs.debian.org/587901
-Origin: upstream, http://perl5.git.perl.org/perl.git/commit/a190e648879
-
-Don't override possible extra $ccflags values given to Configure
-on GNU/Hurd.
-
-Patch-Name: fixes/hurd-ccflags.diff
----
- hints/gnu.sh |    2 +-
- 1 files changed, 1 insertions(+), 1 deletions(-)
-
-diff --git a/hints/gnu.sh b/hints/gnu.sh
-index 2cfce54..c1ba2db 100644
---- a/hints/gnu.sh
-+++ b/hints/gnu.sh
-@@ -19,7 +19,7 @@ lddlflags='-shared'
- ccdlflags='-Wl,-E'
- 
- # Debian bug #258618
--ccflags='-D_GNU_SOURCE'
-+ccflags="-D_GNU_SOURCE $ccflags"
- 
- # The following routines are only available as stubs in GNU libc.
- # XXX remove this once metaconf detects the GNU libc stubs.
diff --git a/meta/recipes-devtools/perl/perl-5.14.2/debian/fixes/hurd-hints.diff b/meta/recipes-devtools/perl/perl-5.14.2/debian/fixes/hurd-hints.diff
deleted file mode 100644
index 6c55e71..0000000
--- a/meta/recipes-devtools/perl/perl-5.14.2/debian/fixes/hurd-hints.diff
+++ /dev/null
@@ -1,49 +0,0 @@
-Upstream-Status:Inappropriate [debian patches]
-From d6fd7595fcd04b332e7449f59ea298639f10a183 Mon Sep 17 00:00:00 2001
-From: Pino Toscano <pino@debian.org>
-Date: Wed, 10 Aug 2011 08:11:33 +0300
-Subject: Improve general GNU hints, needed for GNU/Hurd.
-
-Bug-Debian: http://bugs.debian.org/636609
-
-Patch-Name: fixes/hurd-hints.diff
----
- ext/ODBM_File/hints/gnu.pl |    1 +
- hints/gnu.sh               |   12 ++++++++++++
- 2 files changed, 13 insertions(+), 0 deletions(-)
- create mode 100644 ext/ODBM_File/hints/gnu.pl
-
-diff --git a/ext/ODBM_File/hints/gnu.pl b/ext/ODBM_File/hints/gnu.pl
-new file mode 100644
-index 0000000..db63567
---- /dev/null
-+++ b/ext/ODBM_File/hints/gnu.pl
-@@ -0,0 +1 @@
-+do './hints/linux.pl' or die $@;
-diff --git a/hints/gnu.sh b/hints/gnu.sh
-index c1ba2db..f075642 100644
---- a/hints/gnu.sh
-+++ b/hints/gnu.sh
-@@ -8,10 +8,22 @@ set `echo X "$libswanted "| sed -e 's/ nsl / /' -e 's/ c / pthread /'`
- shift
- libswanted="$*"
- 
-+# Debian 4.0 puts ndbm in the -lgdbm_compat library.
-+libswanted="$libswanted gdbm_compat"
-+
- case "$optimize" in
- '') optimize='-O2' ;;
- esac
- 
-+case "$plibpth" in
-+'') plibpth=`gcc -print-search-dirs | grep libraries |
-+        cut -f2- -d= | tr ':' $trnl | grep -v 'gcc' | sed -e 's:/$::'`
-+    set X $plibpth # Collapse all entries on one line
-+    shift
-+    plibpth="$*"
-+    ;;
-+esac
-+
- # Flags needed to produce shared libraries.
- lddlflags='-shared'
- 
diff --git a/meta/recipes-devtools/perl/perl-5.14.2/09_fix_installperl.patch b/meta/recipes-devtools/perl/perl-5.14.3/09_fix_installperl.patch
similarity index 100%
rename from meta/recipes-devtools/perl/perl-5.14.2/09_fix_installperl.patch
rename to meta/recipes-devtools/perl/perl-5.14.3/09_fix_installperl.patch
diff --git a/meta/recipes-devtools/perl/perl-5.14.2/Makefile.SH.patch b/meta/recipes-devtools/perl/perl-5.14.3/Makefile.SH.patch
similarity index 99%
rename from meta/recipes-devtools/perl/perl-5.14.2/Makefile.SH.patch
rename to meta/recipes-devtools/perl/perl-5.14.3/Makefile.SH.patch
index c9fd5e2..41f2b53 100644
--- a/meta/recipes-devtools/perl/perl-5.14.2/Makefile.SH.patch
+++ b/meta/recipes-devtools/perl/perl-5.14.3/Makefile.SH.patch
@@ -232,8 +232,8 @@ Index: perl-5.14.2/Makefile.SH
 +pod/perlmodlib.pod: pod/perlmodlib.PL MANIFEST
  	$(MINIPERL) $(Icwd) pod/perlmodlib.PL -q
  
- pod/perl5142delta.pod: pod/perldelta.pod
- 	$(LNS) perldelta.pod pod/perl5142delta.pod
+ pod/perl5143delta.pod: pod/perldelta.pod
+ 	$(LNS) perldelta.pod pod/perl5143delta.pod
  
 -extra.pods: $(MINIPERL_EXE)
 +extra.pods: 
diff --git a/meta/recipes-devtools/perl/perl-5.14.2/Makefile.patch b/meta/recipes-devtools/perl/perl-5.14.3/Makefile.patch
similarity index 100%
rename from meta/recipes-devtools/perl/perl-5.14.2/Makefile.patch
rename to meta/recipes-devtools/perl/perl-5.14.3/Makefile.patch
diff --git a/meta/recipes-devtools/perl/perl-5.14.2/asm-pageh-fix.patch b/meta/recipes-devtools/perl/perl-5.14.3/asm-pageh-fix.patch
similarity index 100%
rename from meta/recipes-devtools/perl/perl-5.14.2/asm-pageh-fix.patch
rename to meta/recipes-devtools/perl/perl-5.14.3/asm-pageh-fix.patch
diff --git a/meta/recipes-devtools/perl/perl-5.14.2/config.sh b/meta/recipes-devtools/perl/perl-5.14.3/config.sh
similarity index 95%
rename from meta/recipes-devtools/perl/perl-5.14.2/config.sh
rename to meta/recipes-devtools/perl/perl-5.14.3/config.sh
index 324a67c..dc507cf 100644
--- a/meta/recipes-devtools/perl/perl-5.14.2/config.sh
+++ b/meta/recipes-devtools/perl/perl-5.14.3/config.sh
@@ -14,7 +14,7 @@
 
 : Configure command line arguments.
 config_arg0='Configure'
-config_args='-des -Doptimize=-O2 -Dmyhostname=localhost -Dperladmin=root@localhost -Dcc=gcc -Dcf_by=Open Embedded -Dinstallprefix=@EXECPREFIX@ -Dprefix=@EXECPREFIX@ -Dvendorprefix=@EXECPREFIX@ -Dsiteprefix=@EXECPREFIX@ -Dotherlibdirs=@LIBDIR@/perl/5.14.2 -Duseshrplib -Dusethreads -Duseithreads -Duselargefiles -Ud_dosuid -Dd_semctl_semun -Ui_db -Ui_ndbm -Ui_gdbm -Di_shadow -Di_syslog -Dman3ext=3pm -Duseperlio -Dinstallusrbinperl -Ubincompat5005 -Uversiononly -Dpager=/usr/bin/less -isr'
+config_args='-des -Doptimize=-O2 -Dmyhostname=localhost -Dperladmin=root@localhost -Dcc=gcc -Dcf_by=Open Embedded -Dinstallprefix=@EXECPREFIX@ -Dprefix=@EXECPREFIX@ -Dvendorprefix=@EXECPREFIX@ -Dsiteprefix=@EXECPREFIX@ -Dotherlibdirs=@LIBDIR@/perl/5.14.3 -Duseshrplib -Dusethreads -Duseithreads -Duselargefiles -Ud_dosuid -Dd_semctl_semun -Ui_db -Ui_ndbm -Ui_gdbm -Di_shadow -Di_syslog -Dman3ext=3pm -Duseperlio -Dinstallusrbinperl -Ubincompat5005 -Uversiononly -Dpager=/usr/bin/less -isr'
 config_argc=28
 config_arg1='-des'
 config_arg2='-Doptimize=-O2'
@@ -26,7 +26,7 @@ config_arg7='-Dinstallprefix=@EXECPREFIX@'
 config_arg8='-Dprefix=@EXECPREFIX@'
 config_arg9='-Dvendorprefix=@EXECPREFIX@'
 config_arg10='-Dsiteprefix=@EXECPREFIX@'
-config_arg11='-Dotherlibdirs=@LIBDIR@/perl/5.14.2'
+config_arg11='-Dotherlibdirs=@LIBDIR@/perl/5.14.3'
 config_arg12='-Duseshrplib'
 config_arg13='-Dusethreads'
 config_arg14='-Duseithreads'
@@ -67,9 +67,9 @@ api_subversion='0'
 api_version='14'
 api_versionstring='5.14.0'
 ar='ar'
-archlib='@LIBDIR@/perl/5.14.2/@ARCH@-thread-multi'
-archlibexp='@STAGINGDIR@@LIBDIR@/perl/5.14.2/@ARCH@-thread-multi'
-archlib_exp='@LIBDIR@/perl/5.14.2/@ARCH@-thread-multi'
+archlib='@LIBDIR@/perl/5.14.3/@ARCH@-thread-multi'
+archlibexp='@STAGINGDIR@@LIBDIR@/perl/5.14.3/@ARCH@-thread-multi'
+archlib_exp='@LIBDIR@/perl/5.14.3/@ARCH@-thread-multi'
 archname64=''
 archname='@ARCH@-thread-multi'
 archobjs=''
@@ -87,7 +87,7 @@ castflags='0'
 cat='cat'
 cc='gcc'
 cccdlflags='-fPIC'
-ccdlflags='-Wl,-E -Wl,-rpath,@LIBDIR@/perl/5.14.2/@ARCH@-thread-multi/CORE'
+ccdlflags='-Wl,-E -Wl,-rpath,@LIBDIR@/perl/5.14.3/@ARCH@-thread-multi/CORE'
 ccflags='-D_REENTRANT -D_GNU_SOURCE -fno-strict-aliasing -pipe -fstack-protector -D_LARGEFILE_SOURCE -D_FILE_OFFSET_BITS=64'
 ccflags_uselargefiles='-D_LARGEFILE_SOURCE -D_FILE_OFFSET_BITS=64'
 ccname='gcc'
@@ -747,7 +747,7 @@ inc_version_list_init='0'
 incpath=''
 inews=''
 initialinstalllocation='@USRBIN@'
-installarchlib='@LIBDIR@/perl/5.14.2/@ARCH@-thread-multi'
+installarchlib='@LIBDIR@/perl/5.14.3/@ARCH@-thread-multi'
 installbin='@USRBIN@'
 installhtml1dir=''
 installhtml3dir=''
@@ -755,23 +755,23 @@ installman1dir=''
 installman3dir=''
 installprefix='@EXECPREFIX@'
 installprefixexp='@EXECPREFIX@'
-installprivlib='@LIBDIR@/perl/5.14.2'
+installprivlib='@LIBDIR@/perl/5.14.3'
 installscript='@USRBIN@'
-installsitearch='@LIBDIR@/perl/site_perl/5.14.2/@ARCH@-thread-multi'
+installsitearch='@LIBDIR@/perl/site_perl/5.14.3/@ARCH@-thread-multi'
 installsitebin='@USRBIN@'
 installsitehtml1dir=''
 installsitehtml3dir=''
-installsitelib='@LIBDIR@/perl/site_perl/5.14.2'
+installsitelib='@LIBDIR@/perl/site_perl/5.14.3'
 installsiteman1dir=''
 installsiteman3dir=''
 installsitescript='@USRBIN@'
 installstyle='lib/perl'
 installusrbinperl='define'
-installvendorarch='@LIBDIR@/perl/vendor_perl/5.14.2/@ARCH@-thread-multi'
+installvendorarch='@LIBDIR@/perl/vendor_perl/5.14.3/@ARCH@-thread-multi'
 installvendorbin='@USRBIN@'
 installvendorhtml1dir=''
 installvendorhtml3dir=''
-installvendorlib='@LIBDIR@/perl/vendor_perl/5.14.2'
+installvendorlib='@LIBDIR@/perl/vendor_perl/5.14.3'
 installvendorman1dir=''
 installvendorman3dir=''
 installvendorscript='@USRBIN@'
@@ -881,7 +881,7 @@ optimize='-O2'
 orderlib='false'
 osname='linux'
 osvers='2.6.37-rc5-yocto-standard+'
-otherlibdirs='@LIBDIR@/perl/5.14.2'
+otherlibdirs='@LIBDIR@/perl/5.14.3'
 package='perl5'
 pager='/usr/bin/less -isr'
 passcat='cat /etc/passwd'
@@ -901,8 +901,8 @@ pmake=''
 pr=''
 prefix='@EXECPREFIX@'
 prefixexp='@EXECPREFIX@'
-privlib='@LIBDIR@/perl/5.14.2'
-privlibexp='@LIBDIR@/perl/5.14.2'
+privlib='@LIBDIR@/perl/5.14.3'
+privlibexp='@LIBDIR@/perl/5.14.3'
 procselfexe='"/proc/self/exe"'
 prototype='define'
 randbits='48'
@@ -954,17 +954,17 @@ sig_num='0 1 2 3 4 5 6 7 8 9 10 11 12 13 14 15 16 17 18 19 20 21 22 23 24 25 26
 sig_num_init='0, 1, 2, 3, 4, 5, 6, 7, 8, 9, 10, 11, 12, 13, 14, 15, 16, 17, 18, 19, 20, 21, 22, 23, 24, 25, 26, 27, 28, 29, 30, 31, 32, 33, 34, 35, 36, 37, 38, 39, 40, 41, 42, 43, 44, 45, 46, 47, 48, 49, 50, 51, 52, 53, 54, 55, 56, 57, 58, 59, 60, 61, 62, 63, 64, 6, 17, 29, 31, 0'
 sig_size='69'
 signal_t='void'
-sitearch='@LIBDIR@/perl/site_perl/5.14.2/@ARCH@-thread-multi'
-sitearchexp='@LIBDIR@/perl/site_perl/5.14.2/@ARCH@-thread-multi'
+sitearch='@LIBDIR@/perl/site_perl/5.14.3/@ARCH@-thread-multi'
+sitearchexp='@LIBDIR@/perl/site_perl/5.14.3/@ARCH@-thread-multi'
 sitebin='@USRBIN@'
 sitebinexp='@USRBIN@'
 sitehtml1dir=''
 sitehtml1direxp=''
 sitehtml3dir=''
 sitehtml3direxp=''
-sitelib='@LIBDIR@/perl/site_perl/5.14.2'
+sitelib='@LIBDIR@/perl/site_perl/5.14.3'
 sitelib_stem='@LIBDIR@/perl/site_perl'
-sitelibexp='@LIBDIR@/perl/site_perl/5.14.2'
+sitelibexp='@LIBDIR@/perl/site_perl/5.14.3'
 siteman1dir=''
 siteman1direxp=''
 siteman3dir=''
@@ -1062,17 +1062,17 @@ uvtype='unsigned long'
 uvuformat='"lu"'
 uvxformat='"lx"'
 vaproto='define'
-vendorarch='@LIBDIR@/perl/vendor_perl/5.14.2/@ARCH@-thread-multi'
-vendorarchexp='@LIBDIR@/perl/vendor_perl/5.14.2/@ARCH@-thread-multi'
+vendorarch='@LIBDIR@/perl/vendor_perl/5.14.3/@ARCH@-thread-multi'
+vendorarchexp='@LIBDIR@/perl/vendor_perl/5.14.3/@ARCH@-thread-multi'
 vendorbin='@USRBIN@'
 vendorbinexp='@USRBIN@'
 vendorhtml1dir=' '
 vendorhtml1direxp=''
 vendorhtml3dir=' '
 vendorhtml3direxp=''
-vendorlib='@LIBDIR@/perl/vendor_perl/5.14.2'
+vendorlib='@LIBDIR@/perl/vendor_perl/5.14.3'
 vendorlib_stem='@LIBDIR@/perl/vendor_perl'
-vendorlibexp='@LIBDIR@/perl/vendor_perl/5.14.2'
+vendorlibexp='@LIBDIR@/perl/vendor_perl/5.14.3'
 vendorman1dir=' '
 vendorman1direxp=''
 vendorman3dir=' '
@@ -1081,7 +1081,7 @@ vendorprefix='/usr'
 vendorprefixexp='/usr'
 vendorscript='@USRBIN@'
 vendorscriptexp='@USRBIN@'
-version='5.14.2'
+version='5.14.3'
 version_patchlevel_string='version 14 subversion 2'
 versiononly='undef'
 vi=''
diff --git a/meta/recipes-devtools/perl/perl-5.14.2/config.sh-32 b/meta/recipes-devtools/perl/perl-5.14.3/config.sh-32
similarity index 100%
rename from meta/recipes-devtools/perl/perl-5.14.2/config.sh-32
rename to meta/recipes-devtools/perl/perl-5.14.3/config.sh-32
diff --git a/meta/recipes-devtools/perl/perl-5.14.2/config.sh-32-be b/meta/recipes-devtools/perl/perl-5.14.3/config.sh-32-be
similarity index 100%
rename from meta/recipes-devtools/perl/perl-5.14.2/config.sh-32-be
rename to meta/recipes-devtools/perl/perl-5.14.3/config.sh-32-be
diff --git a/meta/recipes-devtools/perl/perl-5.14.2/config.sh-32-le b/meta/recipes-devtools/perl/perl-5.14.3/config.sh-32-le
similarity index 100%
rename from meta/recipes-devtools/perl/perl-5.14.2/config.sh-32-le
rename to meta/recipes-devtools/perl/perl-5.14.3/config.sh-32-le
diff --git a/meta/recipes-devtools/perl/perl-5.14.2/config.sh-64 b/meta/recipes-devtools/perl/perl-5.14.3/config.sh-64
similarity index 100%
rename from meta/recipes-devtools/perl/perl-5.14.2/config.sh-64
rename to meta/recipes-devtools/perl/perl-5.14.3/config.sh-64
diff --git a/meta/recipes-devtools/perl/perl-5.14.2/config.sh-64-be b/meta/recipes-devtools/perl/perl-5.14.3/config.sh-64-be
similarity index 100%
rename from meta/recipes-devtools/perl/perl-5.14.2/config.sh-64-be
rename to meta/recipes-devtools/perl/perl-5.14.3/config.sh-64-be
diff --git a/meta/recipes-devtools/perl/perl-5.14.2/config.sh-64-le b/meta/recipes-devtools/perl/perl-5.14.3/config.sh-64-le
similarity index 100%
rename from meta/recipes-devtools/perl/perl-5.14.2/config.sh-64-le
rename to meta/recipes-devtools/perl/perl-5.14.3/config.sh-64-le
diff --git a/meta/recipes-devtools/perl/perl-5.14.2/cross-generate_uudmap.patch b/meta/recipes-devtools/perl/perl-5.14.3/cross-generate_uudmap.patch
similarity index 100%
rename from meta/recipes-devtools/perl/perl-5.14.2/cross-generate_uudmap.patch
rename to meta/recipes-devtools/perl/perl-5.14.3/cross-generate_uudmap.patch
diff --git a/meta/recipes-devtools/perl/perl-5.14.2/debian/arm_thread_stress_timeout.diff b/meta/recipes-devtools/perl/perl-5.14.3/debian/arm_thread_stress_timeout.diff
similarity index 100%
rename from meta/recipes-devtools/perl/perl-5.14.2/debian/arm_thread_stress_timeout.diff
rename to meta/recipes-devtools/perl/perl-5.14.3/debian/arm_thread_stress_timeout.diff
diff --git a/meta/recipes-devtools/perl/perl-5.14.2/debian/cpan_definstalldirs.diff b/meta/recipes-devtools/perl/perl-5.14.3/debian/cpan_definstalldirs.diff
similarity index 100%
rename from meta/recipes-devtools/perl/perl-5.14.2/debian/cpan_definstalldirs.diff
rename to meta/recipes-devtools/perl/perl-5.14.3/debian/cpan_definstalldirs.diff
diff --git a/meta/recipes-devtools/perl/perl-5.14.2/debian/cpanplus_config_path.diff b/meta/recipes-devtools/perl/perl-5.14.3/debian/cpanplus_config_path.diff
similarity index 100%
rename from meta/recipes-devtools/perl/perl-5.14.2/debian/cpanplus_config_path.diff
rename to meta/recipes-devtools/perl/perl-5.14.3/debian/cpanplus_config_path.diff
diff --git a/meta/recipes-devtools/perl/perl-5.14.2/debian/cpanplus_definstalldirs.diff b/meta/recipes-devtools/perl/perl-5.14.3/debian/cpanplus_definstalldirs.diff
similarity index 100%
rename from meta/recipes-devtools/perl/perl-5.14.2/debian/cpanplus_definstalldirs.diff
rename to meta/recipes-devtools/perl/perl-5.14.3/debian/cpanplus_definstalldirs.diff
diff --git a/meta/recipes-devtools/perl/perl-5.14.2/debian/db_file_ver.diff b/meta/recipes-devtools/perl/perl-5.14.3/debian/db_file_ver.diff
similarity index 100%
rename from meta/recipes-devtools/perl/perl-5.14.2/debian/db_file_ver.diff
rename to meta/recipes-devtools/perl/perl-5.14.3/debian/db_file_ver.diff
diff --git a/meta/recipes-devtools/perl/perl-5.14.2/debian/deprecate-with-apt.diff b/meta/recipes-devtools/perl/perl-5.14.3/debian/deprecate-with-apt.diff
similarity index 100%
rename from meta/recipes-devtools/perl/perl-5.14.2/debian/deprecate-with-apt.diff
rename to meta/recipes-devtools/perl/perl-5.14.3/debian/deprecate-with-apt.diff
diff --git a/meta/recipes-devtools/perl/perl-5.14.2/debian/disable-zlib-bundling.diff b/meta/recipes-devtools/perl/perl-5.14.3/debian/disable-zlib-bundling.diff
similarity index 100%
rename from meta/recipes-devtools/perl/perl-5.14.2/debian/disable-zlib-bundling.diff
rename to meta/recipes-devtools/perl/perl-5.14.3/debian/disable-zlib-bundling.diff
diff --git a/meta/recipes-devtools/perl/perl-5.14.2/debian/doc_info.diff b/meta/recipes-devtools/perl/perl-5.14.3/debian/doc_info.diff
similarity index 100%
rename from meta/recipes-devtools/perl/perl-5.14.2/debian/doc_info.diff
rename to meta/recipes-devtools/perl/perl-5.14.3/debian/doc_info.diff
diff --git a/meta/recipes-devtools/perl/perl-5.14.2/debian/enc2xs_inc.diff b/meta/recipes-devtools/perl/perl-5.14.3/debian/enc2xs_inc.diff
similarity index 100%
rename from meta/recipes-devtools/perl/perl-5.14.2/debian/enc2xs_inc.diff
rename to meta/recipes-devtools/perl/perl-5.14.3/debian/enc2xs_inc.diff
diff --git a/meta/recipes-devtools/perl/perl-5.14.2/debian/errno_ver.diff b/meta/recipes-devtools/perl/perl-5.14.3/debian/errno_ver.diff
similarity index 100%
rename from meta/recipes-devtools/perl/perl-5.14.2/debian/errno_ver.diff
rename to meta/recipes-devtools/perl/perl-5.14.3/debian/errno_ver.diff
diff --git a/meta/recipes-devtools/perl/perl-5.14.2/debian/extutils_set_libperl_path.diff b/meta/recipes-devtools/perl/perl-5.14.3/debian/extutils_set_libperl_path.diff
similarity index 100%
rename from meta/recipes-devtools/perl/perl-5.14.2/debian/extutils_set_libperl_path.diff
rename to meta/recipes-devtools/perl/perl-5.14.3/debian/extutils_set_libperl_path.diff
diff --git a/meta/recipes-devtools/perl/perl-5.14.2/debian/fakeroot.diff b/meta/recipes-devtools/perl/perl-5.14.3/debian/fakeroot.diff
similarity index 100%
rename from meta/recipes-devtools/perl/perl-5.14.2/debian/fakeroot.diff
rename to meta/recipes-devtools/perl/perl-5.14.3/debian/fakeroot.diff
diff --git a/meta/recipes-devtools/perl/perl-5.14.2/debian/find_html2text.diff b/meta/recipes-devtools/perl/perl-5.14.3/debian/find_html2text.diff
similarity index 100%
rename from meta/recipes-devtools/perl/perl-5.14.2/debian/find_html2text.diff
rename to meta/recipes-devtools/perl/perl-5.14.3/debian/find_html2text.diff
diff --git a/meta/recipes-devtools/perl/perl-5.14.2/debian/fixes/document_makemaker_ccflags.diff b/meta/recipes-devtools/perl/perl-5.14.3/debian/fixes/document_makemaker_ccflags.diff
similarity index 100%
rename from meta/recipes-devtools/perl/perl-5.14.2/debian/fixes/document_makemaker_ccflags.diff
rename to meta/recipes-devtools/perl/perl-5.14.3/debian/fixes/document_makemaker_ccflags.diff
diff --git a/meta/recipes-devtools/perl/perl-5.14.2/debian/fixes/extutils-cbuilder-cflags.diff b/meta/recipes-devtools/perl/perl-5.14.3/debian/fixes/extutils-cbuilder-cflags.diff
similarity index 100%
rename from meta/recipes-devtools/perl/perl-5.14.2/debian/fixes/extutils-cbuilder-cflags.diff
rename to meta/recipes-devtools/perl/perl-5.14.3/debian/fixes/extutils-cbuilder-cflags.diff
diff --git a/meta/recipes-devtools/perl/perl-5.14.2/debian/fixes/h2ph-multiarch.diff b/meta/recipes-devtools/perl/perl-5.14.3/debian/fixes/h2ph-multiarch.diff
similarity index 100%
rename from meta/recipes-devtools/perl/perl-5.14.2/debian/fixes/h2ph-multiarch.diff
rename to meta/recipes-devtools/perl/perl-5.14.3/debian/fixes/h2ph-multiarch.diff
diff --git a/meta/recipes-devtools/perl/perl-5.14.2/debian/fixes/index-tainting.diff b/meta/recipes-devtools/perl/perl-5.14.3/debian/fixes/index-tainting.diff
similarity index 100%
rename from meta/recipes-devtools/perl/perl-5.14.2/debian/fixes/index-tainting.diff
rename to meta/recipes-devtools/perl/perl-5.14.3/debian/fixes/index-tainting.diff
diff --git a/meta/recipes-devtools/perl/perl-5.14.2/debian/fixes/module-build-home-directory.diff b/meta/recipes-devtools/perl/perl-5.14.3/debian/fixes/module-build-home-directory.diff
similarity index 100%
rename from meta/recipes-devtools/perl/perl-5.14.2/debian/fixes/module-build-home-directory.diff
rename to meta/recipes-devtools/perl/perl-5.14.3/debian/fixes/module-build-home-directory.diff
diff --git a/meta/recipes-devtools/perl/perl-5.14.2/debian/fixes/net_smtp_docs.diff b/meta/recipes-devtools/perl/perl-5.14.3/debian/fixes/net_smtp_docs.diff
similarity index 100%
rename from meta/recipes-devtools/perl/perl-5.14.2/debian/fixes/net_smtp_docs.diff
rename to meta/recipes-devtools/perl/perl-5.14.3/debian/fixes/net_smtp_docs.diff
diff --git a/meta/recipes-devtools/perl/perl-5.14.2/debian/fixes/pod_fixes.diff b/meta/recipes-devtools/perl/perl-5.14.3/debian/fixes/pod_fixes.diff
similarity index 100%
rename from meta/recipes-devtools/perl/perl-5.14.2/debian/fixes/pod_fixes.diff
rename to meta/recipes-devtools/perl/perl-5.14.3/debian/fixes/pod_fixes.diff
diff --git a/meta/recipes-devtools/perl/perl-5.14.2/debian/fixes/respect_umask.diff b/meta/recipes-devtools/perl/perl-5.14.3/debian/fixes/respect_umask.diff
similarity index 100%
rename from meta/recipes-devtools/perl/perl-5.14.2/debian/fixes/respect_umask.diff
rename to meta/recipes-devtools/perl/perl-5.14.3/debian/fixes/respect_umask.diff
diff --git a/meta/recipes-devtools/perl/perl-5.14.2/debian/fixes/sys-syslog-socket-timeout-kfreebsd.patch b/meta/recipes-devtools/perl/perl-5.14.3/debian/fixes/sys-syslog-socket-timeout-kfreebsd.patch
similarity index 100%
rename from meta/recipes-devtools/perl/perl-5.14.2/debian/fixes/sys-syslog-socket-timeout-kfreebsd.patch
rename to meta/recipes-devtools/perl/perl-5.14.3/debian/fixes/sys-syslog-socket-timeout-kfreebsd.patch
diff --git a/meta/recipes-devtools/perl/perl-5.14.2/debian/instmodsh_doc.diff b/meta/recipes-devtools/perl/perl-5.14.3/debian/instmodsh_doc.diff
similarity index 100%
rename from meta/recipes-devtools/perl/perl-5.14.2/debian/instmodsh_doc.diff
rename to meta/recipes-devtools/perl/perl-5.14.3/debian/instmodsh_doc.diff
diff --git a/meta/recipes-devtools/perl/perl-5.14.2/debian/ld_run_path.diff b/meta/recipes-devtools/perl/perl-5.14.3/debian/ld_run_path.diff
similarity index 100%
rename from meta/recipes-devtools/perl/perl-5.14.2/debian/ld_run_path.diff
rename to meta/recipes-devtools/perl/perl-5.14.3/debian/ld_run_path.diff
diff --git a/meta/recipes-devtools/perl/perl-5.14.2/debian/libnet_config_path.diff b/meta/recipes-devtools/perl/perl-5.14.3/debian/libnet_config_path.diff
similarity index 100%
rename from meta/recipes-devtools/perl/perl-5.14.2/debian/libnet_config_path.diff
rename to meta/recipes-devtools/perl/perl-5.14.3/debian/libnet_config_path.diff
diff --git a/meta/recipes-devtools/perl/perl-5.14.2/debian/libperl_embed_doc.diff b/meta/recipes-devtools/perl/perl-5.14.3/debian/libperl_embed_doc.diff
similarity index 100%
rename from meta/recipes-devtools/perl/perl-5.14.2/debian/libperl_embed_doc.diff
rename to meta/recipes-devtools/perl/perl-5.14.3/debian/libperl_embed_doc.diff
diff --git a/meta/recipes-devtools/perl/perl-5.14.2/debian/m68k_thread_stress.diff b/meta/recipes-devtools/perl/perl-5.14.3/debian/m68k_thread_stress.diff
similarity index 100%
rename from meta/recipes-devtools/perl/perl-5.14.2/debian/m68k_thread_stress.diff
rename to meta/recipes-devtools/perl/perl-5.14.3/debian/m68k_thread_stress.diff
diff --git a/meta/recipes-devtools/perl/perl-5.14.2/debian/mod_paths.diff b/meta/recipes-devtools/perl/perl-5.14.3/debian/mod_paths.diff
similarity index 100%
rename from meta/recipes-devtools/perl/perl-5.14.2/debian/mod_paths.diff
rename to meta/recipes-devtools/perl/perl-5.14.3/debian/mod_paths.diff
diff --git a/meta/recipes-devtools/perl/perl-5.14.2/debian/module_build_man_extensions.diff b/meta/recipes-devtools/perl/perl-5.14.3/debian/module_build_man_extensions.diff
similarity index 100%
rename from meta/recipes-devtools/perl/perl-5.14.2/debian/module_build_man_extensions.diff
rename to meta/recipes-devtools/perl/perl-5.14.3/debian/module_build_man_extensions.diff
diff --git a/meta/recipes-devtools/perl/perl-5.14.2/debian/no_packlist_perllocal.diff b/meta/recipes-devtools/perl/perl-5.14.3/debian/no_packlist_perllocal.diff
similarity index 100%
rename from meta/recipes-devtools/perl/perl-5.14.2/debian/no_packlist_perllocal.diff
rename to meta/recipes-devtools/perl/perl-5.14.3/debian/no_packlist_perllocal.diff
diff --git a/meta/recipes-devtools/perl/perl-5.14.2/debian/patchlevel.diff b/meta/recipes-devtools/perl/perl-5.14.3/debian/patchlevel.diff
similarity index 100%
rename from meta/recipes-devtools/perl/perl-5.14.2/debian/patchlevel.diff
rename to meta/recipes-devtools/perl/perl-5.14.3/debian/patchlevel.diff
diff --git a/meta/recipes-devtools/perl/perl-5.14.2/debian/perlivp.diff b/meta/recipes-devtools/perl/perl-5.14.3/debian/perlivp.diff
similarity index 100%
rename from meta/recipes-devtools/perl/perl-5.14.2/debian/perlivp.diff
rename to meta/recipes-devtools/perl/perl-5.14.3/debian/perlivp.diff
diff --git a/meta/recipes-devtools/perl/perl-5.14.2/debian/prefix_changes.diff b/meta/recipes-devtools/perl/perl-5.14.3/debian/prefix_changes.diff
similarity index 100%
rename from meta/recipes-devtools/perl/perl-5.14.2/debian/prefix_changes.diff
rename to meta/recipes-devtools/perl/perl-5.14.3/debian/prefix_changes.diff
diff --git a/meta/recipes-devtools/perl/perl-5.14.2/debian/prune_libs.diff b/meta/recipes-devtools/perl/perl-5.14.3/debian/prune_libs.diff
similarity index 100%
rename from meta/recipes-devtools/perl/perl-5.14.2/debian/prune_libs.diff
rename to meta/recipes-devtools/perl/perl-5.14.3/debian/prune_libs.diff
diff --git a/meta/recipes-devtools/perl/perl-5.14.2/debian/series b/meta/recipes-devtools/perl/perl-5.14.3/debian/series
similarity index 100%
rename from meta/recipes-devtools/perl/perl-5.14.2/debian/series
rename to meta/recipes-devtools/perl/perl-5.14.3/debian/series
diff --git a/meta/recipes-devtools/perl/perl-5.14.2/debian/skip-kfreebsd-crash.diff b/meta/recipes-devtools/perl/perl-5.14.3/debian/skip-kfreebsd-crash.diff
similarity index 100%
rename from meta/recipes-devtools/perl/perl-5.14.2/debian/skip-kfreebsd-crash.diff
rename to meta/recipes-devtools/perl/perl-5.14.3/debian/skip-kfreebsd-crash.diff
diff --git a/meta/recipes-devtools/perl/perl-5.14.2/debian/skip-upstream-git-tests.diff b/meta/recipes-devtools/perl/perl-5.14.3/debian/skip-upstream-git-tests.diff
similarity index 100%
rename from meta/recipes-devtools/perl/perl-5.14.2/debian/skip-upstream-git-tests.diff
rename to meta/recipes-devtools/perl/perl-5.14.3/debian/skip-upstream-git-tests.diff
diff --git a/meta/recipes-devtools/perl/perl-5.14.2/debian/squelch-locale-warnings.diff b/meta/recipes-devtools/perl/perl-5.14.3/debian/squelch-locale-warnings.diff
similarity index 100%
rename from meta/recipes-devtools/perl/perl-5.14.2/debian/squelch-locale-warnings.diff
rename to meta/recipes-devtools/perl/perl-5.14.3/debian/squelch-locale-warnings.diff
diff --git a/meta/recipes-devtools/perl/perl-5.14.2/debian/writable_site_dirs.diff b/meta/recipes-devtools/perl/perl-5.14.3/debian/writable_site_dirs.diff
similarity index 100%
rename from meta/recipes-devtools/perl/perl-5.14.2/debian/writable_site_dirs.diff
rename to meta/recipes-devtools/perl/perl-5.14.3/debian/writable_site_dirs.diff
diff --git a/meta/recipes-devtools/perl/perl-5.14.2/fix_bad_rpath.patch b/meta/recipes-devtools/perl/perl-5.14.3/fix_bad_rpath.patch
similarity index 100%
rename from meta/recipes-devtools/perl/perl-5.14.2/fix_bad_rpath.patch
rename to meta/recipes-devtools/perl/perl-5.14.3/fix_bad_rpath.patch
diff --git a/meta/recipes-devtools/perl/perl-5.14.2/generate-sh.patch b/meta/recipes-devtools/perl/perl-5.14.3/generate-sh.patch
similarity index 100%
rename from meta/recipes-devtools/perl/perl-5.14.2/generate-sh.patch
rename to meta/recipes-devtools/perl/perl-5.14.3/generate-sh.patch
diff --git a/meta/recipes-devtools/perl/perl-5.14.2/installperl.patch b/meta/recipes-devtools/perl/perl-5.14.3/installperl.patch
similarity index 100%
rename from meta/recipes-devtools/perl/perl-5.14.2/installperl.patch
rename to meta/recipes-devtools/perl/perl-5.14.3/installperl.patch
diff --git a/meta/recipes-devtools/perl/perl-5.14.2/letgcc-find-errno.patch b/meta/recipes-devtools/perl/perl-5.14.3/letgcc-find-errno.patch
similarity index 100%
rename from meta/recipes-devtools/perl/perl-5.14.2/letgcc-find-errno.patch
rename to meta/recipes-devtools/perl/perl-5.14.3/letgcc-find-errno.patch
diff --git a/meta/recipes-devtools/perl/perl-5.14.2/perl-archlib-exp.patch b/meta/recipes-devtools/perl/perl-5.14.3/perl-archlib-exp.patch
similarity index 100%
rename from meta/recipes-devtools/perl/perl-5.14.2/perl-archlib-exp.patch
rename to meta/recipes-devtools/perl/perl-5.14.3/perl-archlib-exp.patch
diff --git a/meta/recipes-devtools/perl/perl-5.14.2/perl-configure.sh b/meta/recipes-devtools/perl/perl-5.14.3/perl-configure.sh
similarity index 100%
rename from meta/recipes-devtools/perl/perl-5.14.2/perl-configure.sh
rename to meta/recipes-devtools/perl/perl-5.14.3/perl-configure.sh
diff --git a/meta/recipes-devtools/perl/perl-5.14.2/perl-dynloader.patch b/meta/recipes-devtools/perl/perl-5.14.3/perl-dynloader.patch
similarity index 100%
rename from meta/recipes-devtools/perl/perl-5.14.2/perl-dynloader.patch
rename to meta/recipes-devtools/perl/perl-5.14.3/perl-dynloader.patch
diff --git a/meta/recipes-devtools/perl/perl-5.14.2/perl-enable-gdbm.patch b/meta/recipes-devtools/perl/perl-5.14.3/perl-enable-gdbm.patch
similarity index 100%
rename from meta/recipes-devtools/perl/perl-5.14.2/perl-enable-gdbm.patch
rename to meta/recipes-devtools/perl/perl-5.14.3/perl-enable-gdbm.patch
diff --git a/meta/recipes-devtools/perl/perl-5.14.2/perl-moreconfig.patch b/meta/recipes-devtools/perl/perl-5.14.3/perl-moreconfig.patch
similarity index 100%
rename from meta/recipes-devtools/perl/perl-5.14.2/perl-moreconfig.patch
rename to meta/recipes-devtools/perl/perl-5.14.3/perl-moreconfig.patch
diff --git a/meta/recipes-devtools/perl/perl-rdepends_5.14.2.inc b/meta/recipes-devtools/perl/perl-rdepends_5.14.3.inc
similarity index 100%
rename from meta/recipes-devtools/perl/perl-rdepends_5.14.2.inc
rename to meta/recipes-devtools/perl/perl-rdepends_5.14.3.inc
diff --git a/meta/recipes-devtools/perl/perl-rprovides_5.14.2.inc b/meta/recipes-devtools/perl/perl-rprovides_5.14.3.inc
similarity index 100%
rename from meta/recipes-devtools/perl/perl-rprovides_5.14.2.inc
rename to meta/recipes-devtools/perl/perl-rprovides_5.14.3.inc
diff --git a/meta/recipes-devtools/perl/perl_5.14.2.bb b/meta/recipes-devtools/perl/perl_5.14.3.bb
similarity index 98%
rename from meta/recipes-devtools/perl/perl_5.14.2.bb
rename to meta/recipes-devtools/perl/perl_5.14.3.bb
index f924ebd..73b69a4 100644
--- a/meta/recipes-devtools/perl/perl_5.14.2.bb
+++ b/meta/recipes-devtools/perl/perl_5.14.3.bb
@@ -7,7 +7,7 @@ LIC_FILES_CHKSUM = "file://Copying;md5=2b4c6ffbcfcbdee469f02565f253d81a \
 # We need gnugrep (for -I)
 DEPENDS = "virtual/db grep-native"
 DEPENDS += "gdbm zlib"
-PR = "r18"
+PR = "r0"
 
 # 5.10.1 has Module::Build built-in
 PROVIDES += "libmodule-build-perl"
@@ -39,17 +39,13 @@ SRC_URI = "http://www.cpan.org/src/5.0/perl-${PV}.tar.gz \
 	file://debian/cpanplus_definstalldirs.diff \
 	file://debian/cpanplus_config_path.diff \
 	file://debian/deprecate-with-apt.diff \
-	file://debian/fixes/hurd-ccflags.diff \
 	file://debian/squelch-locale-warnings.diff \
 	file://debian/skip-upstream-git-tests.diff \
 	file://debian/fixes/extutils-cbuilder-cflags.diff \
 	file://debian/fixes/module-build-home-directory.diff \
-	file://debian/fixes/h2ph-multiarch.diff \
-	file://debian/fixes/index-tainting.diff \
 	file://debian/skip-kfreebsd-crash.diff \
 	file://debian/fixes/document_makemaker_ccflags.diff \
 	file://debian/fixes/sys-syslog-socket-timeout-kfreebsd.patch \
-	file://debian/fixes/hurd-hints.diff \
 	file://debian/fixes/pod_fixes.diff \
 	file://debian/find_html2text.diff \
 	\
-- 
1.7.5.4



