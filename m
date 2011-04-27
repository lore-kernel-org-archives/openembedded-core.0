Received: from mga11.intel.com ([192.55.52.93])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <sgw@linux.intel.com>) id 1QEzE5-0005Jx-85
	for openembedded-core@lists.openembedded.org;
	Wed, 27 Apr 2011 09:32:00 +0200
Received: from fmsmga001.fm.intel.com ([10.253.24.23])
	by fmsmga102.fm.intel.com with ESMTP; 27 Apr 2011 00:29:25 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="4.64,273,1301900400"; d="scan'208";a="914945403"
Received: from unknown (HELO localhost) ([10.255.12.245])
	by fmsmga001.fm.intel.com with ESMTP; 27 Apr 2011 00:29:24 -0700
Message-Id: <62a7a01a4e885147d8fe17945c169d9080af4906.1303889119.git.sgw@linux.intel.com>
In-Reply-To: <cover.1303889119.git.sgw@linux.intel.com>
References: <cover.1303889119.git.sgw@linux.intel.com>
Old-Date: Sat, 23 Apr 2011 19:43:17 -0700
Date: Wed, 27 Apr 2011  0:29:24 -0700
To: openembedded-core@lists.openembedded.org
From: Saul Wold <sgw@linux.intel.com>
X-Mailman-Approved-At: Wed, 27 Apr 2011 09:50:50 +0200
Cc: Darren Hart <dvhart@linux.intel.com>, Chris Larson <clarson@kergoth.com>,
	Antonio Ospite <ospite@studenti.unina.it>
Subject: [PATCH 04/52] perl: upgrade from 5.12.2 to 5.12.3
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
X-List-Received-Date: Wed, 27 Apr 2011 07:32:00 -0000

From: Nitin A Kamble <nitin.a.kamble@intel.com>

And changed the perl tarball URL to more stable cpan location.

Signed-off-by: Nitin A Kamble <nitin.a.kamble@intel.com>
---
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

diff --git a/meta/recipes-devtools/perl/perl-5.12.2/09_fix_installperl.patch b/meta/recipes-devtools/perl/perl-5.12.3/09_fix_installperl.patch
similarity index 87%
rename from meta/recipes-devtools/perl/perl-5.12.2/09_fix_installperl.patch
rename to meta/recipes-devtools/perl/perl-5.12.3/09_fix_installperl.patch
index cfe0047..a80d17c 100644
--- a/meta/recipes-devtools/perl/perl-5.12.2/09_fix_installperl.patch
+++ b/meta/recipes-devtools/perl/perl-5.12.3/09_fix_installperl.patch
@@ -6,10 +6,10 @@ are under lib.
 Ensure that POSIX/SigAction is kept with the rest of the POSIX module
 under archlib.
 
-Index: perl-5.12.2/installperl
+Index: perl-5.12.3/installperl
 ===================================================================
---- perl-5.12.2.orig/installperl
-+++ perl-5.12.2/installperl
+--- perl-5.12.3.orig/installperl
++++ perl-5.12.3/installperl
 @@ -750,7 +750,7 @@ sub installlib {
      }
  
diff --git a/meta/recipes-devtools/perl/perl-5.12.2/Configure-multilib.patch b/meta/recipes-devtools/perl/perl-5.12.3/Configure-multilib.patch
similarity index 89%
rename from meta/recipes-devtools/perl/perl-5.12.2/Configure-multilib.patch
rename to meta/recipes-devtools/perl/perl-5.12.3/Configure-multilib.patch
index 6a4125b..ef2be3d 100644
--- a/meta/recipes-devtools/perl/perl-5.12.2/Configure-multilib.patch
+++ b/meta/recipes-devtools/perl/perl-5.12.3/Configure-multilib.patch
@@ -1,9 +1,9 @@
 Upstream-Status:Pending
 
-Index: perl-5.12.2/Configure
+Index: perl-5.12.3/Configure
 ===================================================================
---- perl-5.12.2.orig/Configure
-+++ perl-5.12.2/Configure
+--- perl-5.12.3.orig/Configure
++++ perl-5.12.3/Configure
 @@ -1316,8 +1316,9 @@ loclibpth="/usr/local/lib /opt/local/lib
  loclibpth="$loclibpth /opt/gnu/lib /usr/GNU/lib /opt/GNU/lib"
  
diff --git a/meta/recipes-devtools/perl/perl-5.12.2/Makefile.SH.patch b/meta/recipes-devtools/perl/perl-5.12.3/Makefile.SH.patch
similarity index 89%
rename from meta/recipes-devtools/perl/perl-5.12.2/Makefile.SH.patch
rename to meta/recipes-devtools/perl/perl-5.12.3/Makefile.SH.patch
index 72f1b8f..6371a3d 100644
--- a/meta/recipes-devtools/perl/perl-5.12.2/Makefile.SH.patch
+++ b/meta/recipes-devtools/perl/perl-5.12.3/Makefile.SH.patch
@@ -1,9 +1,9 @@
 Upstream-Status:Inappropriate [embedded specific]
 
-Index: perl-5.12.2/Makefile.SH
+Index: perl-5.12.3/Makefile.SH
 ===================================================================
---- perl-5.12.2.orig/Makefile.SH
-+++ perl-5.12.2/Makefile.SH
+--- perl-5.12.3.orig/Makefile.SH
++++ perl-5.12.3/Makefile.SH
 @@ -50,12 +50,12 @@ case "$useshrplib" in
  true)
  	# Prefix all runs of 'miniperl' and 'perl' with
@@ -53,14 +53,14 @@ Index: perl-5.12.2/Makefile.SH
  	    ;;
  	os390)	test -f /bin/env && ldlibpth="/bin/env $ldlibpth"
  		;;
-@@ -553,9 +543,19 @@ splintfiles = $(c1)
+@@ -557,9 +547,19 @@ splintfiles = $(c1)
  .c.s:
  	$(CCCMDSRC) -S $*.c
  
--all: $(FIRSTMAKEFILE) $(MINIPERL_EXE) miniperl $(generated_pods) $(private) $(unidatafiles) $(public) $(dynamic_ext) $(nonxs_ext) extras.make
+-all: $(FIRSTMAKEFILE) $(MINIPERL_EXE) $(generated_pods) $(private) $(unidatafiles) $(public) $(dynamic_ext) $(nonxs_ext) extras.make
 -	@echo " ";
 -	@echo "	Everything is up to date. Type '$(MAKE) test' to run test suite."
-+#all: $(FIRSTMAKEFILE) $(MINIPERL_EXE) miniperl $(generated_pods) $(private) $(unidatafiles) $(public) $(dynamic_ext) $(nonxs_ext) extras.make
++#all: $(FIRSTMAKEFILE) $(MINIPERL_EXE) $(generated_pods) $(private) $(unidatafiles) $(public) $(dynamic_ext) $(nonxs_ext) extras.make
 +#	@echo " ";
 +#	@echo "	Everything is up to date. Type '$(MAKE) test' to run test suite."
 +
@@ -76,7 +76,7 @@ Index: perl-5.12.2/Makefile.SH
  
  .PHONY: all translators utilities
  
-@@ -563,16 +563,16 @@ all: $(FIRSTMAKEFILE) $(MINIPERL_EXE) mi
+@@ -567,16 +567,16 @@ all: $(FIRSTMAKEFILE) $(MINIPERL_EXE) $(
  # by make_patchnum.pl.
  git_version.h: lib/Config_git.pl
  
@@ -96,7 +96,7 @@ Index: perl-5.12.2/Makefile.SH
  	@echo " "; echo "	Making utilities"; cd utils; $(LDLIBPTH) $(MAKE) all
  
  
-@@ -747,7 +747,7 @@ $(LIBPERL): $& $(obj) $(DYNALOADER) $(LI
+@@ -754,7 +754,7 @@ $(LIBPERL): $& $(obj) $(DYNALOADER) $(LI
  	true)
  		$spitshell >>$Makefile <<'!NO!SUBS!'
  	rm -f $@
@@ -105,7 +105,7 @@ Index: perl-5.12.2/Makefile.SH
  !NO!SUBS!
  		case "$osname" in
  		aix)
-@@ -788,7 +788,9 @@ $(MINIPERL_EXE): $& miniperlmain$(OBJ_EX
+@@ -795,7 +795,9 @@ $(MINIPERL_EXE): $& miniperlmain$(OBJ_EX
  	$(CC) -o $(MINIPERL_EXE) $(CLDFLAGS) \
  	    $(mini_obj) \
  	    miniperlmain$(OBJ_EXT) opmini$(OBJ_EXT) perlmini$(OBJ_EXT) $(libs)
@@ -116,7 +116,7 @@ Index: perl-5.12.2/Makefile.SH
  !NO!SUBS!
  		;;
  	next4*)
-@@ -796,7 +798,9 @@ $(MINIPERL_EXE): $& miniperlmain$(OBJ_EX
+@@ -803,7 +805,9 @@ $(MINIPERL_EXE): $& miniperlmain$(OBJ_EX
  $(MINIPERL_EXE): $& miniperlmain$(OBJ_EXT) $(mini_obj) perlmini$(OBJ_EXT) opmini$(OBJ_EXT)
  	$(CC) -o $(MINIPERL_EXE) $(mini_obj) \
  	    miniperlmain$(OBJ_EXT) opmini$(OBJ_EXT) perlmini$(OBJ_EXT) $(libs)
@@ -127,7 +127,7 @@ Index: perl-5.12.2/Makefile.SH
  !NO!SUBS!
  		;;
  	darwin*)
-@@ -818,7 +822,9 @@ $(MINIPERL_EXE): $& miniperlmain$(OBJ_EX
+@@ -825,7 +829,9 @@ $(MINIPERL_EXE): $& miniperlmain$(OBJ_EX
  	$(CC) $(CLDFLAGS) $(NAMESPACEFLAGS) -o $(MINIPERL_EXE) \
  	    $(mini_obj) \
  	    miniperlmain$(OBJ_EXT) opmini$(OBJ_EXT) perlmini$(OBJ_EXT) $(libs)
@@ -138,7 +138,7 @@ Index: perl-5.12.2/Makefile.SH
  !NO!SUBS!
  		;;
  	*)
-@@ -828,7 +834,10 @@ $(MINIPERL_EXE): $& miniperlmain$(OBJ_EX
+@@ -835,7 +841,10 @@ $(MINIPERL_EXE): $& miniperlmain$(OBJ_EX
  	$(LDLIBPTH) $(CC) $(CLDFLAGS) -o $(MINIPERL_EXE) \
  	    $(mini_obj) \
  	    miniperlmain$(OBJ_EXT) opmini$(OBJ_EXT) perlmini$(OBJ_EXT) $(libs)
@@ -150,7 +150,7 @@ Index: perl-5.12.2/Makefile.SH
  !NO!SUBS!
  		;;
  	esac
-@@ -950,7 +959,7 @@ case "${osname}" in
+@@ -957,7 +966,7 @@ case "${osname}" in
  catamount)
  $spitshell >>$Makefile <<!GROK!THIS!
  .PHONY: makeppport
@@ -159,7 +159,7 @@ Index: perl-5.12.2/Makefile.SH
  	-@for f in Makefile.PL PPPort_pm.PL PPPort_xs.PL ppport_h.PL; do \
  	(cd ext/Devel-PPPort && `pwd`/run.sh ../../$(MINIPERL_EXE) -I../../lib \$\$f); \
  	done
-@@ -960,7 +969,7 @@ makeppport: \$(MINIPERL_EXE) \$(CONFIGPM
+@@ -967,7 +976,7 @@ makeppport: \$(MINIPERL_EXE) \$(CONFIGPM
  *)
  $spitshell >>$Makefile <<'!NO!SUBS!'
  .PHONY: makeppport
@@ -168,7 +168,7 @@ Index: perl-5.12.2/Makefile.SH
  	$(MINIPERL) $(Icwd) mkppport
  
  !NO!SUBS!
-@@ -970,29 +979,29 @@ esac
+@@ -977,29 +986,29 @@ esac
  $spitshell >>$Makefile <<'!NO!SUBS!'
  
  .PHONY: preplibrary
@@ -205,7 +205,7 @@ Index: perl-5.12.2/Makefile.SH
  	$(MINIPERL) $(Icwd) lib/unicore/mktables -C lib/unicore -P pod -maketest -makelist -p
  #	Commented out so always runs, mktables looks at far more files than we
  #	can in this makefile to decide if needs to run or not
-@@ -1001,21 +1010,21 @@ uni.data: $(MINIPERL_EXE) $(CONFIGPM) li
+@@ -1008,21 +1017,21 @@ uni.data: $(MINIPERL_EXE) $(CONFIGPM) li
  # $(PERL_EXE) and ext because buildtoc uses Text::Wrap uses re
  # But also this ensures that all extensions are built before we try to scan
  # them, which picks up Devel::PPPort's documentation.
@@ -224,15 +224,15 @@ Index: perl-5.12.2/Makefile.SH
 +pod/perlmodlib.pod: pod/perlmodlib.PL MANIFEST
  	$(MINIPERL) $(Icwd) pod/perlmodlib.PL -q
  
- pod/perldelta.pod: pod/perl5122delta.pod
- 	$(LNS) perl5122delta.pod pod/perldelta.pod
+ pod/perldelta.pod: pod/perl5123delta.pod
+ 	$(LNS) perl5123delta.pod pod/perldelta.pod
  
 -extra.pods: $(MINIPERL_EXE)
 +extra.pods:
  	-@test ! -f extra.pods || rm -f `cat extra.pods`
  	-@rm -f extra.pods
  	-@for x in `grep -l '^=[a-z]' README.* | grep -v README.vms` ; do \
-@@ -1058,11 +1067,7 @@ no-install:
+@@ -1065,11 +1074,7 @@ no-install:
  INSTALL_DEPENDENCE = all
  
  install.perl:	$(INSTALL_DEPENDENCE) installperl
@@ -245,7 +245,7 @@ Index: perl-5.12.2/Makefile.SH
  
  # XXX Experimental. Hardwired values, but useful for testing.
  # Eventually Configure could ask for some of these values.
-@@ -1159,16 +1164,16 @@ manicheck:	FORCE
+@@ -1166,16 +1171,16 @@ manicheck:	FORCE
  #
  # DynaLoader may be needed for extensions that use Makefile.PL.
  
@@ -266,7 +266,7 @@ Index: perl-5.12.2/Makefile.SH
  	$(MINIPERL) make_ext.pl $@ MAKE=$(MAKE) LIBPERL_A=$(LIBPERL)
  !NO!SUBS!
  
-@@ -1366,10 +1371,10 @@ _test:
+@@ -1373,10 +1378,10 @@ _test:
  
  test_prep_pre: preplibrary utilities $(nonxs_ext)
  
@@ -279,7 +279,7 @@ Index: perl-5.12.2/Makefile.SH
  	$(MINIPERL) make_ext.pl $(dynamic_ext_re) MAKE=$(MAKE) LIBPERL_A=$(LIBPERL) LINKTYPE=dynamic
  	cd t && (rm -f $(PERL_EXE); $(LNS) ../$(PERL_EXE) $(PERL_EXE))
  
-@@ -1460,7 +1465,7 @@ minitest.prep:
+@@ -1467,7 +1472,7 @@ minitest.prep:
  
  # Can't depend on lib/Config.pm because that might be where miniperl
  # is crashing.
diff --git a/meta/recipes-devtools/perl/perl-5.12.2/Makefile.patch b/meta/recipes-devtools/perl/perl-5.12.3/Makefile.patch
similarity index 95%
rename from meta/recipes-devtools/perl/perl-5.12.2/Makefile.patch
rename to meta/recipes-devtools/perl/perl-5.12.3/Makefile.patch
index 2c374ed..8a279a5 100644
--- a/meta/recipes-devtools/perl/perl-5.12.2/Makefile.patch
+++ b/meta/recipes-devtools/perl/perl-5.12.3/Makefile.patch
@@ -1,9 +1,9 @@
 Upstream-Status:Inappropriate [embedded specific]
 
-Index: perl-5.12.2/Cross/Makefile
+Index: perl-5.12.3/Cross/Makefile
 ===================================================================
---- perl-5.12.2.orig/Cross/Makefile
-+++ perl-5.12.2/Cross/Makefile
+--- perl-5.12.3.orig/Cross/Makefile
++++ perl-5.12.3/Cross/Makefile
 @@ -2,7 +2,8 @@
  #
  ## $Id: Makefile,v 1.5 2003/12/12 00:48:19 red Exp red $
diff --git a/meta/recipes-devtools/perl/perl-5.12.2/asm-pageh-fix.patch b/meta/recipes-devtools/perl/perl-5.12.3/asm-pageh-fix.patch
similarity index 77%
rename from meta/recipes-devtools/perl/perl-5.12.2/asm-pageh-fix.patch
rename to meta/recipes-devtools/perl/perl-5.12.3/asm-pageh-fix.patch
index 251beb9..c65b1a1 100644
--- a/meta/recipes-devtools/perl/perl-5.12.2/asm-pageh-fix.patch
+++ b/meta/recipes-devtools/perl/perl-5.12.3/asm-pageh-fix.patch
@@ -5,10 +5,10 @@ has been definied in unistd.h since glibc 2.1. Some recent version of linux
 libc headers removed the asm/page.h resulting in failures here for some
 people.
 
-Index: perl-5.12.2/cpan/IPC-SysV/SysV.xs
+Index: perl-5.12.3/cpan/IPC-SysV/SysV.xs
 ===================================================================
---- perl-5.12.2.orig/cpan/IPC-SysV/SysV.xs	2001-07-01 04:46:07.000000000 +1000
-+++ perl-5.12.2/cpan/IPC-SysV/SysV.xs	2001-07-01 04:46:07.000000000 +1000
+--- perl-5.12.3.orig/cpan/IPC-SysV/SysV.xs	2001-07-01 04:46:07.000000000 +1000
++++ perl-5.12.3/cpan/IPC-SysV/SysV.xs	2001-07-01 04:46:07.000000000 +1000
 @@ -3,9 +3,6 @@
  #include "XSUB.h"
  
diff --git a/meta/recipes-devtools/perl/perl-5.12.2/config.sh b/meta/recipes-devtools/perl/perl-5.12.3/config.sh
similarity index 95%
rename from meta/recipes-devtools/perl/perl-5.12.2/config.sh
rename to meta/recipes-devtools/perl/perl-5.12.3/config.sh
index 12d44a8..f1c5001 100644
--- a/meta/recipes-devtools/perl/perl-5.12.2/config.sh
+++ b/meta/recipes-devtools/perl/perl-5.12.3/config.sh
@@ -14,7 +14,7 @@
 
 : Configure command line arguments.
 config_arg0='Configure'
-config_args='-des -Doptimize=-O2 -Dmyhostname=localhost -Dperladmin=root@localhost -Dcc=gcc -Dcf_by=Open Embedded -Dinstallprefix=@DESTDIR@ -Dprefix=/usr -Dvendorprefix=/usr -Dsiteprefix=/usr -Dotherlibdirs=/usr/lib/perl5/5.12.2 -Duseshrplib -Dusethreads -Duseithreads -Duselargefiles -Ud_dosuid -Dd_semctl_semun -Ui_db -Ui_ndbm -Ui_gdbm -Di_shadow -Di_syslog -Dman3ext=3pm -Duseperlio -Dinstallusrbinperl -Ubincompat5005 -Uversiononly -Dpager=/usr/bin/less -isr'
+config_args='-des -Doptimize=-O2 -Dmyhostname=localhost -Dperladmin=root@localhost -Dcc=gcc -Dcf_by=Open Embedded -Dinstallprefix=@DESTDIR@ -Dprefix=/usr -Dvendorprefix=/usr -Dsiteprefix=/usr -Dotherlibdirs=/usr/lib/perl5/5.12.3 -Duseshrplib -Dusethreads -Duseithreads -Duselargefiles -Ud_dosuid -Dd_semctl_semun -Ui_db -Ui_ndbm -Ui_gdbm -Di_shadow -Di_syslog -Dman3ext=3pm -Duseperlio -Dinstallusrbinperl -Ubincompat5005 -Uversiononly -Dpager=/usr/bin/less -isr'
 config_argc=28
 config_arg1='-des'
 config_arg2='-Doptimize=-O2'
@@ -26,7 +26,7 @@ config_arg7='-Dinstallprefix=@DESTDIR@'
 config_arg8='-Dprefix=/usr'
 config_arg9='-Dvendorprefix=/usr'
 config_arg10='-Dsiteprefix=/usr'
-config_arg11='-Dotherlibdirs=/usr/lib/perl5/5.12.2'
+config_arg11='-Dotherlibdirs=/usr/lib/perl5/5.12.3'
 config_arg12='-Duseshrplib'
 config_arg13='-Dusethreads'
 config_arg14='-Duseithreads'
@@ -67,8 +67,8 @@ api_subversion='0'
 api_version='12'
 api_versionstring='5.12.0'
 ar='ar'
-archlib='/usr/lib/perl5/5.12.2/@ARCH@-thread-multi'
-archlibexp='/usr/lib/perl5/5.12.2/@ARCH@-thread-multi'
+archlib='/usr/lib/perl5/5.12.3/@ARCH@-thread-multi'
+archlibexp='/usr/lib/perl5/5.12.3/@ARCH@-thread-multi'
 archname64=''
 archname='@ARCH@-thread-multi'
 archobjs=''
@@ -86,7 +86,7 @@ castflags='0'
 cat='cat'
 cc='gcc'
 cccdlflags='-fPIC'
-ccdlflags='-Wl,-E -Wl,-rpath,/usr/lib/perl5/5.12.2/@ARCH@-thread-multi/CORE'
+ccdlflags='-Wl,-E -Wl,-rpath,/usr/lib/perl5/5.12.3/@ARCH@-thread-multi/CORE'
 ccflags='-D_REENTRANT -D_GNU_SOURCE -fno-strict-aliasing -pipe -fstack-protector -D_LARGEFILE_SOURCE -D_FILE_OFFSET_BITS=64'
 ccflags_uselargefiles='-D_LARGEFILE_SOURCE -D_FILE_OFFSET_BITS=64'
 ccname='gcc'
@@ -746,7 +746,7 @@ inc_version_list_init='0'
 incpath=''
 inews=''
 initialinstalllocation='/usr/bin'
-installarchlib='@DESTDIR@/lib/perl5/5.12.2/@ARCH@-thread-multi'
+installarchlib='@DESTDIR@/lib/perl5/5.12.3/@ARCH@-thread-multi'
 installbin='@DESTDIR@/bin'
 installhtml1dir=''
 installhtml3dir=''
@@ -754,23 +754,23 @@ installman1dir=''
 installman3dir=''
 installprefix='@DESTDIR@'
 installprefixexp='@DESTDIR@'
-installprivlib='@DESTDIR@/lib/perl5/5.12.2'
+installprivlib='@DESTDIR@/lib/perl5/5.12.3'
 installscript='@DESTDIR@/bin'
-installsitearch='@DESTDIR@/lib/perl5/site_perl/5.12.2/@ARCH@-thread-multi'
+installsitearch='@DESTDIR@/lib/perl5/site_perl/5.12.3/@ARCH@-thread-multi'
 installsitebin='@DESTDIR@/bin'
 installsitehtml1dir=''
 installsitehtml3dir=''
-installsitelib='@DESTDIR@/lib/perl5/site_perl/5.12.2'
+installsitelib='@DESTDIR@/lib/perl5/site_perl/5.12.3'
 installsiteman1dir=''
 installsiteman3dir=''
 installsitescript='@DESTDIR@/bin'
 installstyle='lib/perl5'
 installusrbinperl='define'
-installvendorarch='@DESTDIR@/lib/perl5/vendor_perl/5.12.2/@ARCH@-thread-multi'
+installvendorarch='@DESTDIR@/lib/perl5/vendor_perl/5.12.3/@ARCH@-thread-multi'
 installvendorbin='@DESTDIR@/bin'
 installvendorhtml1dir=''
 installvendorhtml3dir=''
-installvendorlib='@DESTDIR@/lib/perl5/vendor_perl/5.12.2'
+installvendorlib='@DESTDIR@/lib/perl5/vendor_perl/5.12.3'
 installvendorman1dir=''
 installvendorman3dir=''
 installvendorscript='@DESTDIR@/bin'
@@ -864,7 +864,7 @@ optimize='-O2'
 orderlib='false'
 osname='linux'
 osvers='2.6.37-rc5-yocto-standard+'
-otherlibdirs='/usr/lib/perl5/5.12.2'
+otherlibdirs='/usr/lib/perl5/5.12.3'
 package='perl5'
 pager='/usr/bin/less -isr'
 passcat='cat /etc/passwd'
@@ -884,8 +884,8 @@ pmake=''
 pr=''
 prefix='/usr'
 prefixexp='/usr'
-privlib='/usr/lib/perl5/5.12.2'
-privlibexp='/usr/lib/perl5/5.12.2'
+privlib='/usr/lib/perl5/5.12.3'
+privlibexp='/usr/lib/perl5/5.12.3'
 procselfexe='"/proc/self/exe"'
 prototype='define'
 randbits='48'
@@ -937,17 +937,17 @@ sig_num='0 1 2 3 4 5 6 7 8 9 10 11 12 13 14 15 16 17 18 19 20 21 22 23 24 25 26
 sig_num_init='0, 1, 2, 3, 4, 5, 6, 7, 8, 9, 10, 11, 12, 13, 14, 15, 16, 17, 18, 19, 20, 21, 22, 23, 24, 25, 26, 27, 28, 29, 30, 31, 32, 33, 34, 35, 36, 37, 38, 39, 40, 41, 42, 43, 44, 45, 46, 47, 48, 49, 50, 51, 52, 53, 54, 55, 56, 57, 58, 59, 60, 61, 62, 63, 64, 6, 17, 29, 31, 0'
 sig_size='69'
 signal_t='void'
-sitearch='/usr/lib/perl5/site_perl/5.12.2/@ARCH@-thread-multi'
-sitearchexp='/usr/lib/perl5/site_perl/5.12.2/@ARCH@-thread-multi'
+sitearch='/usr/lib/perl5/site_perl/5.12.3/@ARCH@-thread-multi'
+sitearchexp='/usr/lib/perl5/site_perl/5.12.3/@ARCH@-thread-multi'
 sitebin='/usr/bin'
 sitebinexp='/usr/bin'
 sitehtml1dir=''
 sitehtml1direxp=''
 sitehtml3dir=''
 sitehtml3direxp=''
-sitelib='/usr/lib/perl5/site_perl/5.12.2'
+sitelib='/usr/lib/perl5/site_perl/5.12.3'
 sitelib_stem='/usr/lib/perl5/site_perl'
-sitelibexp='/usr/lib/perl5/site_perl/5.12.2'
+sitelibexp='/usr/lib/perl5/site_perl/5.12.3'
 siteman1dir=''
 siteman1direxp=''
 siteman3dir=''
@@ -1045,17 +1045,17 @@ uvtype='unsigned long'
 uvuformat='"lu"'
 uvxformat='"lx"'
 vaproto='define'
-vendorarch='/usr/lib/perl5/vendor_perl/5.12.2/@ARCH@-thread-multi'
-vendorarchexp='/usr/lib/perl5/vendor_perl/5.12.2/@ARCH@-thread-multi'
+vendorarch='/usr/lib/perl5/vendor_perl/5.12.3/@ARCH@-thread-multi'
+vendorarchexp='/usr/lib/perl5/vendor_perl/5.12.3/@ARCH@-thread-multi'
 vendorbin='/usr/bin'
 vendorbinexp='/usr/bin'
 vendorhtml1dir=' '
 vendorhtml1direxp=''
 vendorhtml3dir=' '
 vendorhtml3direxp=''
-vendorlib='/usr/lib/perl5/vendor_perl/5.12.2'
+vendorlib='/usr/lib/perl5/vendor_perl/5.12.3'
 vendorlib_stem='/usr/lib/perl5/vendor_perl'
-vendorlibexp='/usr/lib/perl5/vendor_perl/5.12.2'
+vendorlibexp='/usr/lib/perl5/vendor_perl/5.12.3'
 vendorman1dir=' '
 vendorman1direxp=''
 vendorman3dir=' '
@@ -1064,7 +1064,7 @@ vendorprefix='/usr'
 vendorprefixexp='/usr'
 vendorscript='/usr/bin'
 vendorscriptexp='/usr/bin'
-version='5.12.2'
+version='5.12.3'
 version_patchlevel_string='version 12 subversion 2'
 versiononly='undef'
 vi=''
diff --git a/meta/recipes-devtools/perl/perl-5.12.2/config.sh-32 b/meta/recipes-devtools/perl/perl-5.12.3/config.sh-32
similarity index 100%
rename from meta/recipes-devtools/perl/perl-5.12.2/config.sh-32
rename to meta/recipes-devtools/perl/perl-5.12.3/config.sh-32
diff --git a/meta/recipes-devtools/perl/perl-5.12.2/config.sh-32-be b/meta/recipes-devtools/perl/perl-5.12.3/config.sh-32-be
similarity index 100%
rename from meta/recipes-devtools/perl/perl-5.12.2/config.sh-32-be
rename to meta/recipes-devtools/perl/perl-5.12.3/config.sh-32-be
diff --git a/meta/recipes-devtools/perl/perl-5.12.2/config.sh-32-le b/meta/recipes-devtools/perl/perl-5.12.3/config.sh-32-le
similarity index 100%
rename from meta/recipes-devtools/perl/perl-5.12.2/config.sh-32-le
rename to meta/recipes-devtools/perl/perl-5.12.3/config.sh-32-le
diff --git a/meta/recipes-devtools/perl/perl-5.12.2/config.sh-64 b/meta/recipes-devtools/perl/perl-5.12.3/config.sh-64
similarity index 100%
rename from meta/recipes-devtools/perl/perl-5.12.2/config.sh-64
rename to meta/recipes-devtools/perl/perl-5.12.3/config.sh-64
diff --git a/meta/recipes-devtools/perl/perl-5.12.2/config.sh-64-be b/meta/recipes-devtools/perl/perl-5.12.3/config.sh-64-be
similarity index 100%
rename from meta/recipes-devtools/perl/perl-5.12.2/config.sh-64-be
rename to meta/recipes-devtools/perl/perl-5.12.3/config.sh-64-be
diff --git a/meta/recipes-devtools/perl/perl-5.12.2/config.sh-64-le b/meta/recipes-devtools/perl/perl-5.12.3/config.sh-64-le
similarity index 100%
rename from meta/recipes-devtools/perl/perl-5.12.2/config.sh-64-le
rename to meta/recipes-devtools/perl/perl-5.12.3/config.sh-64-le
diff --git a/meta/recipes-devtools/perl/perl-5.12.2/cross-generate_uudmap.patch b/meta/recipes-devtools/perl/perl-5.12.3/cross-generate_uudmap.patch
similarity index 100%
rename from meta/recipes-devtools/perl/perl-5.12.2/cross-generate_uudmap.patch
rename to meta/recipes-devtools/perl/perl-5.12.3/cross-generate_uudmap.patch
diff --git a/meta/recipes-devtools/perl/perl-5.12.2/debian/arm_optim.diff b/meta/recipes-devtools/perl/perl-5.12.3/debian/arm_optim.diff
similarity index 92%
rename from meta/recipes-devtools/perl/perl-5.12.2/debian/arm_optim.diff
rename to meta/recipes-devtools/perl/perl-5.12.3/debian/arm_optim.diff
index c86ddc9..b5b952e 100644
--- a/meta/recipes-devtools/perl/perl-5.12.2/debian/arm_optim.diff
+++ b/meta/recipes-devtools/perl/perl-5.12.3/debian/arm_optim.diff
@@ -31,4 +31,4 @@ index a5d71b9..6914ba6 100755
      toke) ;;
      universal) ;;
 -- 
-tg: (c823880..) debian/arm_optim (depends on: upstream)
+tg: (a508b62..) debian/arm_optim (depends on: upstream)
diff --git a/meta/recipes-devtools/perl/perl-5.12.2/debian/arm_thread_stress_timeout.diff b/meta/recipes-devtools/perl/perl-5.12.3/debian/arm_thread_stress_timeout.diff
similarity index 90%
rename from meta/recipes-devtools/perl/perl-5.12.2/debian/arm_thread_stress_timeout.diff
rename to meta/recipes-devtools/perl/perl-5.12.3/debian/arm_thread_stress_timeout.diff
index c4b4c13..700b344 100644
--- a/meta/recipes-devtools/perl/perl-5.12.2/debian/arm_thread_stress_timeout.diff
+++ b/meta/recipes-devtools/perl/perl-5.12.3/debian/arm_thread_stress_timeout.diff
@@ -22,4 +22,4 @@ index adfd1ed..652a3e6 100755
      my $mutex = 1;
      share($mutex);
 -- 
-tg: (c823880..) debian/arm_thread_stress_timeout (depends on: upstream)
+tg: (a508b62..) debian/arm_thread_stress_timeout (depends on: upstream)
diff --git a/meta/recipes-devtools/perl/perl-5.12.2/debian/cpan_config_path.diff b/meta/recipes-devtools/perl/perl-5.12.3/debian/cpan_config_path.diff
similarity index 92%
rename from meta/recipes-devtools/perl/perl-5.12.2/debian/cpan_config_path.diff
rename to meta/recipes-devtools/perl/perl-5.12.3/debian/cpan_config_path.diff
index 4a349b4..27b4a45 100644
--- a/meta/recipes-devtools/perl/perl-5.12.2/debian/cpan_config_path.diff
+++ b/meta/recipes-devtools/perl/perl-5.12.3/debian/cpan_config_path.diff
@@ -21,4 +21,4 @@ index 76cd81e..65a3b27 100644
          my($configpmtest) = File::Spec->catfile($configpmdir,"Config.pm");
          my $inc_key;
 -- 
-tg: (c823880..) debian/cpan_config_path (depends on: upstream)
+tg: (a508b62..) debian/cpan_config_path (depends on: upstream)
diff --git a/meta/recipes-devtools/perl/perl-5.12.2/debian/cpan_definstalldirs.diff b/meta/recipes-devtools/perl/perl-5.12.3/debian/cpan_definstalldirs.diff
similarity index 95%
rename from meta/recipes-devtools/perl/perl-5.12.2/debian/cpan_definstalldirs.diff
rename to meta/recipes-devtools/perl/perl-5.12.3/debian/cpan_definstalldirs.diff
index 3e3e53f..3931c2d 100644
--- a/meta/recipes-devtools/perl/perl-5.12.2/debian/cpan_definstalldirs.diff
+++ b/meta/recipes-devtools/perl/perl-5.12.3/debian/cpan_definstalldirs.diff
@@ -34,4 +34,4 @@ index 53ffbf1..53976ff 100644
  
      if (exists $CPAN::HandleConfig::keys{mbuild_install_build_command}
 -- 
-tg: (c823880..) debian/cpan_definstalldirs (depends on: upstream)
+tg: (a508b62..) debian/cpan_definstalldirs (depends on: upstream)
diff --git a/meta/recipes-devtools/perl/perl-5.12.2/debian/cpanplus_config_path.diff b/meta/recipes-devtools/perl/perl-5.12.3/debian/cpanplus_config_path.diff
similarity index 96%
rename from meta/recipes-devtools/perl/perl-5.12.2/debian/cpanplus_config_path.diff
rename to meta/recipes-devtools/perl/perl-5.12.3/debian/cpanplus_config_path.diff
index 6510119..8f2f5d2 100644
--- a/meta/recipes-devtools/perl/perl-5.12.2/debian/cpanplus_config_path.diff
+++ b/meta/recipes-devtools/perl/perl-5.12.3/debian/cpanplus_config_path.diff
@@ -42,4 +42,4 @@ index 1a38200..6ee0d82 100644
                                      require File::Basename;
                                      my $dir = File::Basename::dirname(
 -- 
-tg: (c823880..) debian/cpanplus_config_path (depends on: upstream)
+tg: (a508b62..) debian/cpanplus_config_path (depends on: upstream)
diff --git a/meta/recipes-devtools/perl/perl-5.12.2/debian/cpanplus_definstalldirs.diff b/meta/recipes-devtools/perl/perl-5.12.3/debian/cpanplus_definstalldirs.diff
similarity index 95%
rename from meta/recipes-devtools/perl/perl-5.12.2/debian/cpanplus_definstalldirs.diff
rename to meta/recipes-devtools/perl/perl-5.12.3/debian/cpanplus_definstalldirs.diff
index 2ec063c..bd5fe80 100644
--- a/meta/recipes-devtools/perl/perl-5.12.2/debian/cpanplus_definstalldirs.diff
+++ b/meta/recipes-devtools/perl/perl-5.12.3/debian/cpanplus_definstalldirs.diff
@@ -51,4 +51,4 @@ index 0000000..5e6e11e
 +
 +1;
 -- 
-tg: (c823880..) debian/cpanplus_definstalldirs (depends on: upstream)
+tg: (a508b62..) debian/cpanplus_definstalldirs (depends on: upstream)
diff --git a/meta/recipes-devtools/perl/perl-5.12.2/debian/db_file_ver.diff b/meta/recipes-devtools/perl/perl-5.12.3/debian/db_file_ver.diff
similarity index 95%
rename from meta/recipes-devtools/perl/perl-5.12.2/debian/db_file_ver.diff
rename to meta/recipes-devtools/perl/perl-5.12.3/debian/db_file_ver.diff
index a974d08..e9aa60a 100644
--- a/meta/recipes-devtools/perl/perl-5.12.2/debian/db_file_ver.diff
+++ b/meta/recipes-devtools/perl/perl-5.12.3/debian/db_file_ver.diff
@@ -31,4 +31,4 @@ index 47158d3..67ccdff 100644
      /* check that libdb is recent enough  -- we need 2.3.4 or greater */
      if (Major == 2 && (Minor < 3 || (Minor ==  3 && Patch < 4)))
 -- 
-tg: (c823880..) debian/db_file_ver (depends on: upstream)
+tg: (a508b62..) debian/db_file_ver (depends on: upstream)
diff --git a/meta/recipes-devtools/perl/perl-5.12.2/debian/deprecate-with-apt.diff b/meta/recipes-devtools/perl/perl-5.12.3/debian/deprecate-with-apt.diff
similarity index 97%
rename from meta/recipes-devtools/perl/perl-5.12.2/debian/deprecate-with-apt.diff
rename to meta/recipes-devtools/perl/perl-5.12.3/debian/deprecate-with-apt.diff
index e580466..ad0b0cf 100644
--- a/meta/recipes-devtools/perl/perl-5.12.2/debian/deprecate-with-apt.diff
+++ b/meta/recipes-devtools/perl/perl-5.12.3/debian/deprecate-with-apt.diff
@@ -58,4 +58,4 @@ index 7b92e0b..9db7330 100644
  	    return;
  	}
 -- 
-tg: (c823880..) debian/deprecate-with-apt (depends on: upstream)
+tg: (a508b62..) debian/deprecate-with-apt (depends on: upstream)
diff --git a/meta/recipes-devtools/perl/perl-5.12.2/debian/devel-ppport-ia64-optim.diff b/meta/recipes-devtools/perl/perl-5.12.3/debian/devel-ppport-ia64-optim.diff
similarity index 93%
rename from meta/recipes-devtools/perl/perl-5.12.2/debian/devel-ppport-ia64-optim.diff
rename to meta/recipes-devtools/perl/perl-5.12.3/debian/devel-ppport-ia64-optim.diff
index c656010..e57a315 100644
--- a/meta/recipes-devtools/perl/perl-5.12.2/debian/devel-ppport-ia64-optim.diff
+++ b/meta/recipes-devtools/perl/perl-5.12.3/debian/devel-ppport-ia64-optim.diff
@@ -31,4 +31,4 @@ index 67eebc1..f1ef7a2 100644
      $PL_FILES{'apicheck_c.PL'} = 'apicheck.c';
      push @C_FILES, qw{ apicheck.c };
 -- 
-tg: (c823880..) debian/devel-ppport-ia64-optim (depends on: upstream)
+tg: (a508b62..) debian/devel-ppport-ia64-optim (depends on: upstream)
diff --git a/meta/recipes-devtools/perl/perl-5.12.2/debian/disable-zlib-bundling.diff b/meta/recipes-devtools/perl/perl-5.12.3/debian/disable-zlib-bundling.diff
similarity index 92%
rename from meta/recipes-devtools/perl/perl-5.12.2/debian/disable-zlib-bundling.diff
rename to meta/recipes-devtools/perl/perl-5.12.3/debian/disable-zlib-bundling.diff
index e036dc5..44349a5 100644
--- a/meta/recipes-devtools/perl/perl-5.12.2/debian/disable-zlib-bundling.diff
+++ b/meta/recipes-devtools/perl/perl-5.12.3/debian/disable-zlib-bundling.diff
@@ -28,4 +28,4 @@ index c56cc03..2c6659b 100644
  OLD_ZLIB        = False
  GZIP_OS_CODE    = AUTO_DETECT
 -- 
-tg: (c823880..) debian/disable-zlib-bundling (depends on: upstream)
+tg: (a508b62..) debian/disable-zlib-bundling (depends on: upstream)
diff --git a/meta/recipes-devtools/perl/perl-5.12.2/debian/doc_info.diff b/meta/recipes-devtools/perl/perl-5.12.3/debian/doc_info.diff
similarity index 88%
rename from meta/recipes-devtools/perl/perl-5.12.2/debian/doc_info.diff
rename to meta/recipes-devtools/perl/perl-5.12.3/debian/doc_info.diff
index 2f5d9a4..be75f30 100644
--- a/meta/recipes-devtools/perl/perl-5.12.2/debian/doc_info.diff
+++ b/meta/recipes-devtools/perl/perl-5.12.3/debian/doc_info.diff
@@ -10,10 +10,10 @@ Indicate that the user needs to install the perl-doc package.
  1 files changed, 10 insertions(+), 2 deletions(-)
 
 diff --git a/pod/perl.pod b/pod/perl.pod
-index e48e526..3b0bbf6 100644
+index e67f062..3b8ae83 100644
 --- a/pod/perl.pod
 +++ b/pod/perl.pod
-@@ -241,8 +241,16 @@ For ease of access, the Perl manual has been split up into several sections.
+@@ -242,8 +242,16 @@ For ease of access, the Perl manual has been split up into several sections.
      perlwin32		Perl notes for Windows
  
  
@@ -33,4 +33,4 @@ index e48e526..3b0bbf6 100644
  In general, if something strange has gone wrong with your program and you're
  not sure where you should look for help, try the B<-w> switch first.  It will
 -- 
-tg: (c823880..) debian/doc_info (depends on: upstream)
+tg: (a508b62..) debian/doc_info (depends on: upstream)
diff --git a/meta/recipes-devtools/perl/perl-5.12.2/debian/enc2xs_inc.diff b/meta/recipes-devtools/perl/perl-5.12.3/debian/enc2xs_inc.diff
similarity index 82%
rename from meta/recipes-devtools/perl/perl-5.12.2/debian/enc2xs_inc.diff
rename to meta/recipes-devtools/perl/perl-5.12.3/debian/enc2xs_inc.diff
index e96d53d..4cac4b7 100644
--- a/meta/recipes-devtools/perl/perl-5.12.2/debian/enc2xs_inc.diff
+++ b/meta/recipes-devtools/perl/perl-5.12.3/debian/enc2xs_inc.diff
@@ -5,14 +5,15 @@ Bug-Debian: http://bugs.debian.org/290336
 
 - ignore missing directories,
 - follow symlinks (/usr/share/perl/5.8 -> 5.8.4).
-
+- filter "." out when running "enc2xs -C", it's unnecessary and causes
+  issues with follow => 1 (see #603686 and [rt.cpan.org #64585])
 
 ---
  cpan/Encode/bin/enc2xs |    8 ++++----
  1 files changed, 4 insertions(+), 4 deletions(-)
 
 diff --git a/cpan/Encode/bin/enc2xs b/cpan/Encode/bin/enc2xs
-index 773c0a0..049ecf9 100644
+index 773c0a0..bc1ae1b 100644
 --- a/cpan/Encode/bin/enc2xs
 +++ b/cpan/Encode/bin/enc2xs
 @@ -924,11 +924,11 @@ use vars qw(
@@ -43,9 +44,9 @@ index 773c0a0..049ecf9 100644
  	}
      };
 -    File::Find::find({wanted => $wanted}, @INC);
-+    File::Find::find({wanted => $wanted, follow => 1}, grep -d, @INC);
++    File::Find::find({wanted => $wanted, follow => 1}, grep -d && !/^\./, @INC);
      $_ModLines = "";
      for my $enc ( sort keys %LocalMod ) {
          $_ModLines .=
 -- 
-tg: (c823880..) debian/enc2xs_inc (depends on: upstream)
+tg: (a508b62..) debian/enc2xs_inc (depends on: upstream)
diff --git a/meta/recipes-devtools/perl/perl-5.12.2/debian/errno_ver.diff b/meta/recipes-devtools/perl/perl-5.12.3/debian/errno_ver.diff
similarity index 94%
rename from meta/recipes-devtools/perl/perl-5.12.2/debian/errno_ver.diff
rename to meta/recipes-devtools/perl/perl-5.12.3/debian/errno_ver.diff
index b28b4bc..de73ed5 100644
--- a/meta/recipes-devtools/perl/perl-5.12.2/debian/errno_ver.diff
+++ b/meta/recipes-devtools/perl/perl-5.12.3/debian/errno_ver.diff
@@ -31,4 +31,4 @@ index 124b8fc..b554cd4 100644
  \$VERSION = eval \$VERSION;
  \@ISA = qw(Exporter);
 -- 
-tg: (c823880..) debian/errno_ver (depends on: upstream)
+tg: (a508b62..) debian/errno_ver (depends on: upstream)
diff --git a/meta/recipes-devtools/perl/perl-5.12.2/debian/extutils_hacks.diff b/meta/recipes-devtools/perl/perl-5.12.3/debian/extutils_hacks.diff
similarity index 99%
rename from meta/recipes-devtools/perl/perl-5.12.2/debian/extutils_hacks.diff
rename to meta/recipes-devtools/perl/perl-5.12.3/debian/extutils_hacks.diff
index 1fb635d..e1cbdb5 100644
--- a/meta/recipes-devtools/perl/perl-5.12.2/debian/extutils_hacks.diff
+++ b/meta/recipes-devtools/perl/perl-5.12.3/debian/extutils_hacks.diff
@@ -312,4 +312,4 @@ index 24ae909..12d421d 100644
  
  ExtUtils::Embed exports the following functions:
 -- 
-tg: (c823880..) debian/extutils_hacks (depends on: upstream)
+tg: (a508b62..) debian/extutils_hacks (depends on: upstream)
diff --git a/meta/recipes-devtools/perl/perl-5.12.2/debian/fakeroot.diff b/meta/recipes-devtools/perl/perl-5.12.3/debian/fakeroot.diff
similarity index 93%
rename from meta/recipes-devtools/perl/perl-5.12.2/debian/fakeroot.diff
rename to meta/recipes-devtools/perl/perl-5.12.3/debian/fakeroot.diff
index 380955b..2c8def5 100644
--- a/meta/recipes-devtools/perl/perl-5.12.2/debian/fakeroot.diff
+++ b/meta/recipes-devtools/perl/perl-5.12.3/debian/fakeroot.diff
@@ -15,7 +15,7 @@ rule where the Makefile is created, but is for the clean/binary* targets.
  1 files changed, 2 insertions(+), 7 deletions(-)
 
 diff --git a/Makefile.SH b/Makefile.SH
-index c039938..15184d8 100755
+index fc13b2b..d420229 100755
 --- a/Makefile.SH
 +++ b/Makefile.SH
 @@ -50,12 +50,7 @@ case "$useshrplib" in
@@ -42,4 +42,4 @@ index c039938..15184d8 100755
  	    case "$osname" in
  	    os2)
 -- 
-tg: (c823880..) debian/fakeroot (depends on: upstream)
+tg: (a508b62..) debian/fakeroot (depends on: upstream)
diff --git a/meta/recipes-devtools/perl/perl-5.12.2/debian/fixes/autodie-flock.diff b/meta/recipes-devtools/perl/perl-5.12.3/debian/fixes/autodie-flock.diff
similarity index 98%
rename from meta/recipes-devtools/perl/perl-5.12.2/debian/fixes/autodie-flock.diff
rename to meta/recipes-devtools/perl/perl-5.12.3/debian/fixes/autodie-flock.diff
index 1e2c1ad..375ae41 100644
--- a/meta/recipes-devtools/perl/perl-5.12.2/debian/fixes/autodie-flock.diff
+++ b/meta/recipes-devtools/perl/perl-5.12.3/debian/fixes/autodie-flock.diff
@@ -97,4 +97,4 @@ index a7550ba..6421a56 100755
  is($@, "", "Non-blocking flock should not fail on EWOULDBLOCK");
  
 -- 
-tg: (c823880..) fixes/autodie-flock (depends on: upstream)
+tg: (a508b62..) fixes/autodie-flock (depends on: upstream)
diff --git a/meta/recipes-devtools/perl/perl-5.12.2/debian/fixes/concat-stack-corruption.diff b/meta/recipes-devtools/perl/perl-5.12.3/debian/fixes/concat-stack-corruption.diff
similarity index 91%
rename from meta/recipes-devtools/perl/perl-5.12.2/debian/fixes/concat-stack-corruption.diff
rename to meta/recipes-devtools/perl/perl-5.12.3/debian/fixes/concat-stack-corruption.diff
index ef21261..40437f3 100644
--- a/meta/recipes-devtools/perl/perl-5.12.2/debian/fixes/concat-stack-corruption.diff
+++ b/meta/recipes-devtools/perl/perl-5.12.3/debian/fixes/concat-stack-corruption.diff
@@ -15,7 +15,7 @@ and the like.
  1 files changed, 3 insertions(+), 0 deletions(-)
 
 diff --git a/pp_hot.c b/pp_hot.c
-index 3371e88..e9cccf3 100644
+index ee699ef..c5ed14e 100644
 --- a/pp_hot.c
 +++ b/pp_hot.c
 @@ -271,6 +271,8 @@ PP(pp_concat)
@@ -36,4 +36,4 @@ index 3371e88..e9cccf3 100644
      sv_catpvn_nomg(TARG, rpv, rlen);
  
 -- 
-tg: (c823880..) fixes/concat-stack-corruption (depends on: upstream)
+tg: (a508b62..) fixes/concat-stack-corruption (depends on: upstream)
diff --git a/meta/recipes-devtools/perl/perl-5.12.2/debian/fixes/cpanplus-without-home.diff b/meta/recipes-devtools/perl/perl-5.12.3/debian/fixes/cpanplus-without-home.diff
similarity index 94%
rename from meta/recipes-devtools/perl/perl-5.12.2/debian/fixes/cpanplus-without-home.diff
rename to meta/recipes-devtools/perl/perl-5.12.3/debian/fixes/cpanplus-without-home.diff
index 798b7c2..e7ff57c 100644
--- a/meta/recipes-devtools/perl/perl-5.12.2/debian/fixes/cpanplus-without-home.diff
+++ b/meta/recipes-devtools/perl/perl-5.12.3/debian/fixes/cpanplus-without-home.diff
@@ -29,4 +29,4 @@ index 27d2abc..8475c36 100644
  use Params::Check               qw[check];
  use Module::Load::Conditional   qw[can_load];
 -- 
-tg: (c823880..) fixes/cpanplus-without-home (depends on: upstream)
+tg: (a508b62..) fixes/cpanplus-without-home (depends on: upstream)
diff --git a/meta/recipes-devtools/perl/perl-5.12.2/debian/fixes/h2ph-gcc-4.5.diff b/meta/recipes-devtools/perl/perl-5.12.3/debian/fixes/h2ph-gcc-4.5.diff
similarity index 98%
rename from meta/recipes-devtools/perl/perl-5.12.2/debian/fixes/h2ph-gcc-4.5.diff
rename to meta/recipes-devtools/perl/perl-5.12.3/debian/fixes/h2ph-gcc-4.5.diff
index 49d797c..9faab81 100644
--- a/meta/recipes-devtools/perl/perl-5.12.2/debian/fixes/h2ph-gcc-4.5.diff
+++ b/meta/recipes-devtools/perl/perl-5.12.3/debian/fixes/h2ph-gcc-4.5.diff
@@ -105,4 +105,4 @@ index 8f56db4..1255807 100644
  		print PREAMBLE
  		    "unless (defined &$_) { sub $_() { \"",
 -- 
-tg: (c823880..) fixes/h2ph-gcc-4.5 (depends on: upstream)
+tg: (a508b62..) fixes/h2ph-gcc-4.5 (depends on: upstream)
diff --git a/meta/recipes-devtools/perl/perl-5.12.2/debian/fixes/hurd-ccflags.diff b/meta/recipes-devtools/perl/perl-5.12.3/debian/fixes/hurd-ccflags.diff
similarity index 92%
rename from meta/recipes-devtools/perl/perl-5.12.2/debian/fixes/hurd-ccflags.diff
rename to meta/recipes-devtools/perl/perl-5.12.3/debian/fixes/hurd-ccflags.diff
index d7b43e9..8868c64 100644
--- a/meta/recipes-devtools/perl/perl-5.12.2/debian/fixes/hurd-ccflags.diff
+++ b/meta/recipes-devtools/perl/perl-5.12.3/debian/fixes/hurd-ccflags.diff
@@ -25,4 +25,4 @@ index 2cfce54..c1ba2db 100644
  # The following routines are only available as stubs in GNU libc.
  # XXX remove this once metaconf detects the GNU libc stubs.
 -- 
-tg: (c823880..) fixes/hurd-ccflags (depends on: upstream)
+tg: (a508b62..) fixes/hurd-ccflags (depends on: upstream)
diff --git a/meta/recipes-devtools/perl/perl-5.12.2/debian/fixes/lc-numeric-docs.diff b/meta/recipes-devtools/perl/perl-5.12.3/debian/fixes/lc-numeric-docs.diff
similarity index 98%
rename from meta/recipes-devtools/perl/perl-5.12.2/debian/fixes/lc-numeric-docs.diff
rename to meta/recipes-devtools/perl/perl-5.12.3/debian/fixes/lc-numeric-docs.diff
index ece4989..67a55da 100644
--- a/meta/recipes-devtools/perl/perl-5.12.2/debian/fixes/lc-numeric-docs.diff
+++ b/meta/recipes-devtools/perl/perl-5.12.3/debian/fixes/lc-numeric-docs.diff
@@ -94,4 +94,4 @@ index 0dbabe7..0bec423 100644
  =head2 Freely available locale definitions
  
 -- 
-tg: (c823880..) fixes/lc-numeric-docs (depends on: upstream)
+tg: (a508b62..) fixes/lc-numeric-docs (depends on: upstream)
diff --git a/meta/recipes-devtools/perl/perl-5.12.2/debian/fixes/lc-numeric-sprintf.diff b/meta/recipes-devtools/perl/perl-5.12.3/debian/fixes/lc-numeric-sprintf.diff
similarity index 93%
rename from meta/recipes-devtools/perl/perl-5.12.2/debian/fixes/lc-numeric-sprintf.diff
rename to meta/recipes-devtools/perl/perl-5.12.3/debian/fixes/lc-numeric-sprintf.diff
index b150e72..9fe07eb 100644
--- a/meta/recipes-devtools/perl/perl-5.12.2/debian/fixes/lc-numeric-sprintf.diff
+++ b/meta/recipes-devtools/perl/perl-5.12.3/debian/fixes/lc-numeric-sprintf.diff
@@ -28,4 +28,4 @@ index e94f158..3c6badb 100644
  	if (PL_hints & HINT_LOCALE)
  	    goto nope;
 -- 
-tg: (c823880..) fixes/lc-numeric-sprintf (depends on: upstream)
+tg: (a508b62..) fixes/lc-numeric-sprintf (depends on: upstream)
diff --git a/meta/recipes-devtools/perl/perl-5.12.2/debian/fixes/net_smtp_docs.diff b/meta/recipes-devtools/perl/perl-5.12.3/debian/fixes/net_smtp_docs.diff
similarity index 91%
rename from meta/recipes-devtools/perl/perl-5.12.2/debian/fixes/net_smtp_docs.diff
rename to meta/recipes-devtools/perl/perl-5.12.3/debian/fixes/net_smtp_docs.diff
index f7b5e42..2307a09 100644
--- a/meta/recipes-devtools/perl/perl-5.12.2/debian/fixes/net_smtp_docs.diff
+++ b/meta/recipes-devtools/perl/perl-5.12.3/debian/fixes/net_smtp_docs.diff
@@ -22,4 +22,4 @@ index a28496d..07b2498 100644
  Example:
  
 -- 
-tg: (c823880..) fixes/net_smtp_docs (depends on: upstream)
+tg: (a508b62..) fixes/net_smtp_docs (depends on: upstream)
diff --git a/meta/recipes-devtools/perl/perl-5.12.2/debian/fixes/processPL.diff b/meta/recipes-devtools/perl/perl-5.12.3/debian/fixes/processPL.diff
similarity index 95%
rename from meta/recipes-devtools/perl/perl-5.12.2/debian/fixes/processPL.diff
rename to meta/recipes-devtools/perl/perl-5.12.3/debian/fixes/processPL.diff
index 3b645d1..fa2d7c3 100644
--- a/meta/recipes-devtools/perl/perl-5.12.2/debian/fixes/processPL.diff
+++ b/meta/recipes-devtools/perl/perl-5.12.3/debian/fixes/processPL.diff
@@ -42,4 +42,4 @@ index 239d6df..294d266 100644
  
  	}
 -- 
-tg: (c823880..) fixes/processPL (depends on: upstream)
+tg: (a508b62..) fixes/processPL (depends on: upstream)
diff --git a/meta/recipes-devtools/perl/perl-5.12.2/debian/instmodsh_doc.diff b/meta/recipes-devtools/perl/perl-5.12.3/debian/instmodsh_doc.diff
similarity index 93%
rename from meta/recipes-devtools/perl/perl-5.12.2/debian/instmodsh_doc.diff
rename to meta/recipes-devtools/perl/perl-5.12.3/debian/instmodsh_doc.diff
index cfc57fa..5555dfc 100644
--- a/meta/recipes-devtools/perl/perl-5.12.2/debian/instmodsh_doc.diff
+++ b/meta/recipes-devtools/perl/perl-5.12.3/debian/instmodsh_doc.diff
@@ -25,4 +25,4 @@ index 5874aa6..6a2f03e 100644
  
  ExtUtils::Installed
 -- 
-tg: (c823880..) debian/instmodsh_doc (depends on: upstream)
+tg: (a508b62..) debian/instmodsh_doc (depends on: upstream)
diff --git a/meta/recipes-devtools/perl/perl-5.12.2/debian/ld_run_path.diff b/meta/recipes-devtools/perl/perl-5.12.3/debian/ld_run_path.diff
similarity index 93%
rename from meta/recipes-devtools/perl/perl-5.12.2/debian/ld_run_path.diff
rename to meta/recipes-devtools/perl/perl-5.12.3/debian/ld_run_path.diff
index ced1e8f..02610d3 100644
--- a/meta/recipes-devtools/perl/perl-5.12.2/debian/ld_run_path.diff
+++ b/meta/recipes-devtools/perl/perl-5.12.3/debian/ld_run_path.diff
@@ -22,4 +22,4 @@ index b807e97..6c955d7 100644
  
  	# Handle possible linker path arguments.
 -- 
-tg: (c823880..) debian/ld_run_path (depends on: upstream)
+tg: (a508b62..) debian/ld_run_path (depends on: upstream)
diff --git a/meta/recipes-devtools/perl/perl-5.12.2/debian/libnet_config_path.diff b/meta/recipes-devtools/perl/perl-5.12.3/debian/libnet_config_path.diff
similarity index 95%
rename from meta/recipes-devtools/perl/perl-5.12.2/debian/libnet_config_path.diff
rename to meta/recipes-devtools/perl/perl-5.12.3/debian/libnet_config_path.diff
index ef0f369..a38e78a 100644
--- a/meta/recipes-devtools/perl/perl-5.12.2/debian/libnet_config_path.diff
+++ b/meta/recipes-devtools/perl/perl-5.12.3/debian/libnet_config_path.diff
@@ -34,4 +34,4 @@ index db51c1f..8404593 100644
  should return a reference to a HASH containing the keys described below.
  For example
 -- 
-tg: (c823880..) debian/libnet_config_path (depends on: upstream)
+tg: (a508b62..) debian/libnet_config_path (depends on: upstream)
diff --git a/meta/recipes-devtools/perl/perl-5.12.2/debian/m68k_thread_stress.diff b/meta/recipes-devtools/perl/perl-5.12.3/debian/m68k_thread_stress.diff
similarity index 95%
rename from meta/recipes-devtools/perl/perl-5.12.2/debian/m68k_thread_stress.diff
rename to meta/recipes-devtools/perl/perl-5.12.3/debian/m68k_thread_stress.diff
index d27a677..675c9aa 100644
--- a/meta/recipes-devtools/perl/perl-5.12.2/debian/m68k_thread_stress.diff
+++ b/meta/recipes-devtools/perl/perl-5.12.3/debian/m68k_thread_stress.diff
@@ -42,4 +42,4 @@ index e3a1086..633374e 100755
  
  use ExtUtils::testlib;
 -- 
-tg: (c823880..) debian/m68k_thread_stress (depends on: upstream)
+tg: (a508b62..) debian/m68k_thread_stress (depends on: upstream)
diff --git a/meta/recipes-devtools/perl/perl-5.12.2/debian/mod_paths.diff b/meta/recipes-devtools/perl/perl-5.12.3/debian/mod_paths.diff
similarity index 97%
rename from meta/recipes-devtools/perl/perl-5.12.2/debian/mod_paths.diff
rename to meta/recipes-devtools/perl/perl-5.12.3/debian/mod_paths.diff
index 96fe4df..26d8ed0 100644
--- a/meta/recipes-devtools/perl/perl-5.12.2/debian/mod_paths.diff
+++ b/meta/recipes-devtools/perl/perl-5.12.3/debian/mod_paths.diff
@@ -97,4 +97,4 @@ index 05cea40..023d6a0 100644
      S_incpush_use_sep(aTHX_ STR_WITH_LEN(PERL_OTHERLIBDIRS),
  		      INCPUSH_ADD_OLD_VERS|INCPUSH_ADD_ARCHONLY_SUB_DIRS
 -- 
-tg: (c823880..) debian/mod_paths (depends on: upstream)
+tg: (a508b62..) debian/mod_paths (depends on: upstream)
diff --git a/meta/recipes-devtools/perl/perl-5.12.2/debian/module_build_man_extensions.diff b/meta/recipes-devtools/perl/perl-5.12.3/debian/module_build_man_extensions.diff
similarity index 96%
rename from meta/recipes-devtools/perl/perl-5.12.2/debian/module_build_man_extensions.diff
rename to meta/recipes-devtools/perl/perl-5.12.3/debian/module_build_man_extensions.diff
index bc7fd9e..63c8441 100644
--- a/meta/recipes-devtools/perl/perl-5.12.2/debian/module_build_man_extensions.diff
+++ b/meta/recipes-devtools/perl/perl-5.12.3/debian/module_build_man_extensions.diff
@@ -30,4 +30,4 @@ index 5bd8ec7..b4e606a 100644
  	          $self->config( 'man3ext' );
      my $outfile = File::Spec->catfile( $mandir, $manpage);
 -- 
-tg: (c823880..) debian/module_build_man_extensions (depends on: upstream)
+tg: (a508b62..) debian/module_build_man_extensions (depends on: upstream)
diff --git a/meta/recipes-devtools/perl/perl-5.12.3/debian/patchlevel b/meta/recipes-devtools/perl/perl-5.12.3/debian/patchlevel
new file mode 100644
index 0000000..0839fbd
--- /dev/null
+++ b/meta/recipes-devtools/perl/perl-5.12.3/debian/patchlevel
@@ -0,0 +1,45 @@
+Subject: List packaged patches for 5.12.3-2 in patchlevel.h
+Origin: vendor
+Bug-Debian: http://bugs.debian.org/567489
+
+The list can be refreshed from information in debian/patches by running
+'debian/rules refresh-patchlevel'.
+
+
+--- perl/patchlevel.bak
++++ perl/patchlevel.h
+@@ -133,0 +134,34 @@
++	,"DEBPKG:debian/arm_thread_stress_timeout - http://bugs.debian.org/501970 Raise the timeout of ext/threads/shared/t/stress.t to accommodate slower build hosts"
++	,"DEBPKG:debian/cpan_config_path - Set location of CPAN::Config to /etc/perl as /usr may not be writable."
++	,"DEBPKG:debian/cpan_definstalldirs - Provide a sensible INSTALLDIRS default for modules installed from CPAN."
++	,"DEBPKG:debian/db_file_ver - http://bugs.debian.org/340047 Remove overly restrictive DB_File version check."
++	,"DEBPKG:debian/doc_info - Replace generic man(1) instructions with Debian-specific information."
++	,"DEBPKG:debian/enc2xs_inc - http://bugs.debian.org/290336 Tweak enc2xs to follow symlinks and ignore missing @INC directories."
++	,"DEBPKG:debian/errno_ver - http://bugs.debian.org/343351 Remove Errno version check due to upgrade problems with long-running processes."
++	,"DEBPKG:debian/extutils_hacks - Various debian-specific ExtUtils changes"
++	,"DEBPKG:debian/fakeroot - Postpone LD_LIBRARY_PATH evaluation to the binary targets."
++	,"DEBPKG:debian/instmodsh_doc - Debian policy doesn't install .packlist files for core or vendor."
++	,"DEBPKG:debian/ld_run_path - Remove standard libs from LD_RUN_PATH as per Debian policy."
++	,"DEBPKG:debian/libnet_config_path - Set location of libnet.cfg to /etc/perl/Net as /usr may not be writable."
++	,"DEBPKG:debian/m68k_thread_stress - http://bugs.debian.org/495826 Disable some threads tests on m68k for now due to missing TLS."
++	,"DEBPKG:debian/mod_paths - Tweak @INC ordering for Debian"
++	,"DEBPKG:debian/module_build_man_extensions - http://bugs.debian.org/479460 Adjust Module::Build manual page extensions for the Debian Perl policy"
++	,"DEBPKG:debian/prune_libs - http://bugs.debian.org/128355 Prune the list of libraries wanted to what we actually need."
++	,"DEBPKG:fixes/net_smtp_docs - http://bugs.debian.org/100195 [rt.cpan.org #36038] Document the Net::SMTP 'Port' option"
++	,"DEBPKG:fixes/processPL - http://bugs.debian.org/357264 [rt.cpan.org #17224] Always use PERLRUNINST when building perl modules."
++	,"DEBPKG:debian/perlivp - http://bugs.debian.org/510895 Make perlivp skip include directories in /usr/local"
++	,"DEBPKG:debian/disable-zlib-bundling - Disable zlib bundling in Compress::Raw::Zlib"
++	,"DEBPKG:debian/cpanplus_definstalldirs - http://bugs.debian.org/533707 Configure CPANPLUS to use the site directories by default."
++	,"DEBPKG:debian/cpanplus_config_path - Save local versions of CPANPLUS::Config::System into /etc/perl."
++	,"DEBPKG:fixes/autodie-flock - http://bugs.debian.org/543731 Allow for flock returning EAGAIN instead of EWOULDBLOCK on linux/parisc"
++	,"DEBPKG:debian/devel-ppport-ia64-optim - http://bugs.debian.org/548943 Work around an ICE on ia64"
++	,"DEBPKG:fixes/cpanplus-without-home - http://bugs.debian.org/577011 [rt.cpan.org #52988] Fix CPANPLUS test failures when HOME doesn't exist"
++	,"DEBPKG:debian/arm_optim - http://bugs.debian.org/580334 Downgrade the optimization of sv.c on arm due to a gcc-4.4 bug"
++	,"DEBPKG:debian/deprecate-with-apt - http://bugs.debian.org/580034 Point users to Debian packages of deprecated core modules"
++	,"DEBPKG:fixes/hurd-ccflags - http://bugs.debian.org/587901 Make hints/gnu.sh append to $ccflags rather than overriding them"
++	,"DEBPKG:debian/squelch-locale-warnings - http://bugs.debian.org/508764 Squelch locale warnings in Debian package maintainer scripts"
++	,"DEBPKG:fixes/lc-numeric-docs - http://bugs.debian.org/379329 [perl #78452] [903eb63] LC_NUMERIC documentation fixes"
++	,"DEBPKG:fixes/lc-numeric-sprintf - http://bugs.debian.org/601549 [perl #78632] [b3fd614] Fix sprintf not to ignore LC_NUMERIC with constants"
++	,"DEBPKG:fixes/concat-stack-corruption - http://bugs.debian.org/596105 [perl #78674] [e3393f5] Fix stack pointer corruption in pp_concat() with 'use encoding'"
++	,"DEBPKG:fixes/h2ph-gcc-4.5 - http://bugs.debian.org/599933 [8d66b3f] h2ph fix for gcc 4.5"
++	,"DEBPKG:patchlevel - http://bugs.debian.org/567489 List packaged patches for 5.12.3-2 in patchlevel.h"
diff --git a/meta/recipes-devtools/perl/perl-5.12.2/debian/perlivp.diff b/meta/recipes-devtools/perl/perl-5.12.3/debian/perlivp.diff
similarity index 96%
rename from meta/recipes-devtools/perl/perl-5.12.2/debian/perlivp.diff
rename to meta/recipes-devtools/perl/perl-5.12.3/debian/perlivp.diff
index ebe942c..304e4c1 100644
--- a/meta/recipes-devtools/perl/perl-5.12.2/debian/perlivp.diff
+++ b/meta/recipes-devtools/perl/perl-5.12.3/debian/perlivp.diff
@@ -37,4 +37,4 @@ index 9783261..156146f 100644
          next if $_ eq ':'; # skip -d test here
          next if $_ eq 'Dev:Pseudo:'; # why is this in @INC?
 -- 
-tg: (c823880..) debian/perlivp (depends on: upstream)
+tg: (a508b62..) debian/perlivp (depends on: upstream)
diff --git a/meta/recipes-devtools/perl/perl-5.12.2/debian/prune_libs.diff b/meta/recipes-devtools/perl/perl-5.12.3/debian/prune_libs.diff
similarity index 96%
rename from meta/recipes-devtools/perl/perl-5.12.2/debian/prune_libs.diff
rename to meta/recipes-devtools/perl/perl-5.12.3/debian/prune_libs.diff
index 0f49895..5bb072c 100644
--- a/meta/recipes-devtools/perl/perl-5.12.2/debian/prune_libs.diff
+++ b/meta/recipes-devtools/perl/perl-5.12.3/debian/prune_libs.diff
@@ -35,4 +35,4 @@ index 3a8732b..6013c86 100755
  	    perllibs="$*"
  	    ;;
 -- 
-tg: (c823880..) debian/prune_libs (depends on: upstream)
+tg: (a508b62..) debian/prune_libs (depends on: upstream)
diff --git a/meta/recipes-devtools/perl/perl-5.12.3/debian/series b/meta/recipes-devtools/perl/perl-5.12.3/debian/series
new file mode 100644
index 0000000..5425bc6
--- /dev/null
+++ b/meta/recipes-devtools/perl/perl-5.12.3/debian/series
@@ -0,0 +1,34 @@
+debian/arm_thread_stress_timeout.diff -p1
+debian/cpan_config_path.diff -p1
+debian/cpan_definstalldirs.diff -p1
+debian/db_file_ver.diff -p1
+debian/doc_info.diff -p1
+debian/enc2xs_inc.diff -p1
+debian/errno_ver.diff -p1
+debian/extutils_hacks.diff -p1
+debian/fakeroot.diff -p1
+debian/instmodsh_doc.diff -p1
+debian/ld_run_path.diff -p1
+debian/libnet_config_path.diff -p1
+debian/m68k_thread_stress.diff -p1
+debian/mod_paths.diff -p1
+debian/module_build_man_extensions.diff -p1
+debian/prune_libs.diff -p1
+fixes/net_smtp_docs.diff -p1
+fixes/processPL.diff -p1
+debian/perlivp.diff -p1
+debian/disable-zlib-bundling.diff -p1
+debian/cpanplus_definstalldirs.diff -p1
+debian/cpanplus_config_path.diff -p1
+fixes/autodie-flock.diff -p1
+debian/devel-ppport-ia64-optim.diff -p1
+fixes/cpanplus-without-home.diff -p1
+debian/arm_optim.diff -p1
+debian/deprecate-with-apt.diff -p1
+fixes/hurd-ccflags.diff -p1
+debian/squelch-locale-warnings.diff -p1
+fixes/lc-numeric-docs.diff -p1
+fixes/lc-numeric-sprintf.diff -p1
+fixes/concat-stack-corruption.diff -p1
+fixes/h2ph-gcc-4.5.diff -p1
+patchlevel -p1
diff --git a/meta/recipes-devtools/perl/perl-5.12.2/debian/squelch-locale-warnings.diff b/meta/recipes-devtools/perl/perl-5.12.3/debian/squelch-locale-warnings.diff
similarity index 96%
rename from meta/recipes-devtools/perl/perl-5.12.2/debian/squelch-locale-warnings.diff
rename to meta/recipes-devtools/perl/perl-5.12.3/debian/squelch-locale-warnings.diff
index 68c1a35..eac0fc3 100644
--- a/meta/recipes-devtools/perl/perl-5.12.2/debian/squelch-locale-warnings.diff
+++ b/meta/recipes-devtools/perl/perl-5.12.3/debian/squelch-locale-warnings.diff
@@ -52,4 +52,4 @@ index 0dbabe7..60b7bab 100644
  
  The following environment variables are not specific to Perl: They are
 -- 
-tg: (c823880..) debian/squelch-locale-warnings (depends on: upstream)
+tg: (a508b62..) debian/squelch-locale-warnings (depends on: upstream)
diff --git a/meta/recipes-devtools/perl/perl-5.12.2/generate-sh.patch b/meta/recipes-devtools/perl/perl-5.12.3/generate-sh.patch
similarity index 100%
rename from meta/recipes-devtools/perl/perl-5.12.2/generate-sh.patch
rename to meta/recipes-devtools/perl/perl-5.12.3/generate-sh.patch
diff --git a/meta/recipes-devtools/perl/perl-5.12.2/installperl.patch b/meta/recipes-devtools/perl/perl-5.12.3/installperl.patch
similarity index 81%
rename from meta/recipes-devtools/perl/perl-5.12.2/installperl.patch
rename to meta/recipes-devtools/perl/perl-5.12.3/installperl.patch
index 276eb3d..4560123 100644
--- a/meta/recipes-devtools/perl/perl-5.12.2/installperl.patch
+++ b/meta/recipes-devtools/perl/perl-5.12.3/installperl.patch
@@ -1,9 +1,9 @@
 Upstream-Status:Inappropriate [embedded specific]
 
-Index: perl-5.12.2/installperl
+Index: perl-5.12.3/installperl
 ===================================================================
---- perl-5.12.2.orig/installperl
-+++ perl-5.12.2/installperl
+--- perl-5.12.3.orig/installperl
++++ perl-5.12.3/installperl
 @@ -3,8 +3,8 @@
  BEGIN {
      require 5.004;
diff --git a/meta/recipes-devtools/perl/perl-5.12.2/letgcc-find-errno.patch b/meta/recipes-devtools/perl/perl-5.12.3/letgcc-find-errno.patch
similarity index 92%
rename from meta/recipes-devtools/perl/perl-5.12.2/letgcc-find-errno.patch
rename to meta/recipes-devtools/perl/perl-5.12.3/letgcc-find-errno.patch
index 268cb53..5161e4c 100644
--- a/meta/recipes-devtools/perl/perl-5.12.2/letgcc-find-errno.patch
+++ b/meta/recipes-devtools/perl/perl-5.12.3/letgcc-find-errno.patch
@@ -10,10 +10,10 @@ external toolchain since perl will search in ${STAGING_INCDIR} for
 errno.h (when using gcc) and that isn't where it's located - its
 wherever the external toolchain keeps it's headers.
 
-Index: perl-5.12.2/ext/Errno/Errno_pm.PL
+Index: perl-5.12.3/ext/Errno/Errno_pm.PL
 ===================================================================
---- perl-5.12.2.orig/ext/Errno/Errno_pm.PL
-+++ perl-5.12.2/ext/Errno/Errno_pm.PL
+--- perl-5.12.3.orig/ext/Errno/Errno_pm.PL
++++ perl-5.12.3/ext/Errno/Errno_pm.PL
 @@ -17,8 +17,18 @@ unlink "Errno.tmp" if -f "Errno.tmp";
  open OUT, ">Errno.tmp" or die "Cannot open Errno.tmp: $!";
  select OUT;
diff --git a/meta/recipes-devtools/perl/perl-5.12.2/native-nopacklist.patch b/meta/recipes-devtools/perl/perl-5.12.3/native-nopacklist.patch
similarity index 94%
rename from meta/recipes-devtools/perl/perl-5.12.2/native-nopacklist.patch
rename to meta/recipes-devtools/perl/perl-5.12.3/native-nopacklist.patch
index 8d5b819..389c334 100644
--- a/meta/recipes-devtools/perl/perl-5.12.2/native-nopacklist.patch
+++ b/meta/recipes-devtools/perl/perl-5.12.3/native-nopacklist.patch
@@ -2,10 +2,10 @@ Upstream-Status:Inappropriate [debian patch]
 
 Part of 52_debian_extutils_hacks.patch just to exclude the installation of .packlist files
 
-Index: perl-5.12.2/cpan/ExtUtils-MakeMaker/lib/ExtUtils/MM_Unix.pm
+Index: perl-5.12.3/cpan/ExtUtils-MakeMaker/lib/ExtUtils/MM_Unix.pm
 ===================================================================
---- perl-5.12.2.orig/cpan/ExtUtils-MakeMaker/lib/ExtUtils/MM_Unix.pm
-+++ perl-5.12.2/cpan/ExtUtils-MakeMaker/lib/ExtUtils/MM_Unix.pm
+--- perl-5.12.3.orig/cpan/ExtUtils-MakeMaker/lib/ExtUtils/MM_Unix.pm
++++ perl-5.12.3/cpan/ExtUtils-MakeMaker/lib/ExtUtils/MM_Unix.pm
 @@ -2047,8 +2047,6 @@ doc__install : doc_site_install
  
  pure_perl_install :: all
diff --git a/meta/recipes-devtools/perl/perl-5.12.2/native-perlinc.patch b/meta/recipes-devtools/perl/perl-5.12.3/native-perlinc.patch
similarity index 88%
rename from meta/recipes-devtools/perl/perl-5.12.2/native-perlinc.patch
rename to meta/recipes-devtools/perl/perl-5.12.3/native-perlinc.patch
index ffaf326..f0bb1f6 100644
--- a/meta/recipes-devtools/perl/perl-5.12.2/native-perlinc.patch
+++ b/meta/recipes-devtools/perl/perl-5.12.3/native-perlinc.patch
@@ -2,8 +2,8 @@ Upstream-Status:Inappropriate [embedded specific]
 
 Index: perl-5.8.8/lib/ExtUtils/MM_Unix.pm
 ===================================================================
---- perl-5.12.2.orig/cpan/ExtUtils-MakeMaker/lib/ExtUtils/MM_Unix.pm	2008-10-31 22:01:35.000000000 +0000
-+++ perl-5.12.2/cpan/ExtUtils-MakeMaker/lib/ExtUtils/MM_Unix.pm	2008-10-31 22:01:35.000000000 +0000
+--- perl-5.12.3.orig/cpan/ExtUtils-MakeMaker/lib/ExtUtils/MM_Unix.pm	2008-10-31 22:01:35.000000000 +0000
++++ perl-5.12.3/cpan/ExtUtils-MakeMaker/lib/ExtUtils/MM_Unix.pm	2008-10-31 22:01:35.000000000 +0000
 @@ -1597,6 +1597,19 @@
  	$self->{PERL_LIB}     ||= $Config{privlibexp};
  	$self->{PERL_ARCHLIB} ||= $Config{archlibexp};
diff --git a/meta/recipes-devtools/perl/perl-5.12.2/native-ssp.patch b/meta/recipes-devtools/perl/perl-5.12.3/native-ssp.patch
similarity index 100%
rename from meta/recipes-devtools/perl/perl-5.12.2/native-ssp.patch
rename to meta/recipes-devtools/perl/perl-5.12.3/native-ssp.patch
diff --git a/meta/recipes-devtools/perl/perl-5.12.2/parallel_build_fix_1.patch b/meta/recipes-devtools/perl/perl-5.12.3/parallel_build_fix_1.patch
similarity index 100%
rename from meta/recipes-devtools/perl/perl-5.12.2/parallel_build_fix_1.patch
rename to meta/recipes-devtools/perl/perl-5.12.3/parallel_build_fix_1.patch
diff --git a/meta/recipes-devtools/perl/perl-5.12.2/parallel_build_fix_2.patch b/meta/recipes-devtools/perl/perl-5.12.3/parallel_build_fix_2.patch
similarity index 100%
rename from meta/recipes-devtools/perl/perl-5.12.2/parallel_build_fix_2.patch
rename to meta/recipes-devtools/perl/perl-5.12.3/parallel_build_fix_2.patch
diff --git a/meta/recipes-devtools/perl/perl-5.12.2/parallel_build_fix_3.patch b/meta/recipes-devtools/perl/perl-5.12.3/parallel_build_fix_3.patch
similarity index 100%
rename from meta/recipes-devtools/perl/perl-5.12.2/parallel_build_fix_3.patch
rename to meta/recipes-devtools/perl/perl-5.12.3/parallel_build_fix_3.patch
diff --git a/meta/recipes-devtools/perl/perl-5.12.2/parallel_build_fix_4.patch b/meta/recipes-devtools/perl/perl-5.12.3/parallel_build_fix_4.patch
similarity index 100%
rename from meta/recipes-devtools/perl/perl-5.12.2/parallel_build_fix_4.patch
rename to meta/recipes-devtools/perl/perl-5.12.3/parallel_build_fix_4.patch
diff --git a/meta/recipes-devtools/perl/perl-5.12.2/parallel_build_fix_5.patch b/meta/recipes-devtools/perl/perl-5.12.3/parallel_build_fix_5.patch
similarity index 95%
rename from meta/recipes-devtools/perl/perl-5.12.2/parallel_build_fix_5.patch
rename to meta/recipes-devtools/perl/perl-5.12.3/parallel_build_fix_5.patch
index 70f7104..5891ee6 100644
--- a/meta/recipes-devtools/perl/perl-5.12.2/parallel_build_fix_5.patch
+++ b/meta/recipes-devtools/perl/perl-5.12.3/parallel_build_fix_5.patch
@@ -43,10 +43,10 @@ Date:   Mon Feb 14 10:14:18 2011 +0000
     This approach actually takes advantage of ExtUtils::MakeMaker setting an -I
     option correct for the depth of directory being built.
 
-Index: perl-5.12.2/Cross/Makefile-cross-SH
+Index: perl-5.12.3/Cross/Makefile-cross-SH
 ===================================================================
---- perl-5.12.2.orig/Cross/Makefile-cross-SH
-+++ perl-5.12.2/Cross/Makefile-cross-SH
+--- perl-5.12.3.orig/Cross/Makefile-cross-SH
++++ perl-5.12.3/Cross/Makefile-cross-SH
 @@ -324,7 +324,7 @@ $spitshell >>$Makefile <<'!NO!SUBS!'
  
  CONFIGPM = xlib/$(CROSS_NAME)/Config.pm
@@ -87,10 +87,10 @@ Index: perl-5.12.2/Cross/Makefile-cross-SH
  	@$(LDLIBPTH) $(RUN) ./miniperl$(EXE_EXT) -Ilib make_ext.pl --cross $@ MAKE=$(MAKE) LIBPERL_A=$(LIBPERL)
  !NO!SUBS!
  
-Index: perl-5.12.2/MANIFEST
+Index: perl-5.12.3/MANIFEST
 ===================================================================
---- perl-5.12.2.orig/MANIFEST
-+++ perl-5.12.2/MANIFEST
+--- perl-5.12.3.orig/MANIFEST
++++ perl-5.12.3/MANIFEST
 @@ -4747,6 +4747,7 @@ win32/wince.c			WinCE port
  win32/wince.h			WinCE port
  win32/wincesck.c		WinCE port
@@ -99,10 +99,10 @@ Index: perl-5.12.2/MANIFEST
  x2p/a2p.c			Output of a2p.y run through byacc
  x2p/a2p.h			Global declarations
  x2p/a2p.pod			Pod for awk to perl translator
-Index: perl-5.12.2/Makefile.SH
+Index: perl-5.12.3/Makefile.SH
 ===================================================================
---- perl-5.12.2.orig/Makefile.SH
-+++ perl-5.12.2/Makefile.SH
+--- perl-5.12.3.orig/Makefile.SH
++++ perl-5.12.3/Makefile.SH
 @@ -428,7 +428,7 @@ esac
  ## In the following dollars and backticks do not need the extra backslash.
  $spitshell >>$Makefile <<'!NO!SUBS!'
@@ -143,10 +143,10 @@ Index: perl-5.12.2/Makefile.SH
  	$(MINIPERL) make_ext.pl $@ MAKE=$(MAKE) LIBPERL_A=$(LIBPERL)
  !NO!SUBS!
  
-Index: perl-5.12.2/installperl
+Index: perl-5.12.3/installperl
 ===================================================================
---- perl-5.12.2.orig/installperl
-+++ perl-5.12.2/installperl
+--- perl-5.12.3.orig/installperl
++++ perl-5.12.3/installperl
 @@ -714,6 +714,8 @@ sub installlib {
      # ignore the test extensions
      return if $dir =~ m{\bXS/(?:APItest|Typemap)\b};
@@ -156,10 +156,10 @@ Index: perl-5.12.2/installperl
      # ignore the demo files
      return if $dir =~ /\b(?:demos?|eg)\b/;
  
-Index: perl-5.12.2/make_ext.pl
+Index: perl-5.12.3/make_ext.pl
 ===================================================================
---- perl-5.12.2.orig/make_ext.pl
-+++ perl-5.12.2/make_ext.pl
+--- perl-5.12.3.orig/make_ext.pl
++++ perl-5.12.3/make_ext.pl
 @@ -4,11 +4,9 @@ use warnings;
  use Config;
  BEGIN {
@@ -228,10 +228,10 @@ Index: perl-5.12.2/make_ext.pl
  	if ($is_VMS) {
  	    my $libd = VMS::Filespec::vmspath($lib_dir);
  	    push @args, "INST_LIB=$libd", "INST_ARCHLIB=$libd";
-Index: perl-5.12.2/vms/descrip_mms.template
+Index: perl-5.12.3/vms/descrip_mms.template
 ===================================================================
---- perl-5.12.2.orig/vms/descrip_mms.template
-+++ perl-5.12.2/vms/descrip_mms.template
+--- perl-5.12.3.orig/vms/descrip_mms.template
++++ perl-5.12.3/vms/descrip_mms.template
 @@ -360,7 +360,7 @@ CRTLOPTS =,$(CRTL)/Options
  unidatadirs = lib/unicore/To lib/unicore/lib
  
@@ -268,10 +268,10 @@ Index: perl-5.12.2/vms/descrip_mms.template
  
  clean : tidy cleantest
        	- $(MINIPERL) make_ext.pl "MAKE=$(MMS)" "--all" "--target=clean"
-Index: perl-5.12.2/win32/Makefile
+Index: perl-5.12.3/win32/Makefile
 ===================================================================
---- perl-5.12.2.orig/win32/Makefile
-+++ perl-5.12.2/win32/Makefile
+--- perl-5.12.3.orig/win32/Makefile
++++ perl-5.12.3/win32/Makefile
 @@ -923,6 +923,9 @@ $(CONFIGPM) : $(MINIPERL) ..\config.sh c
  	-$(MINIPERL) -I..\lib $(ICWD) config_h.PL "INST_VER=$(INST_VER)"
  	if errorlevel 1 $(MAKE) /$(MAKEFLAGS) $(CONFIGPM)
@@ -320,10 +320,10 @@ Index: perl-5.12.2/win32/Makefile
  	-del /f $(DISTDIR)\XSLoader\XSLoader.pm
  	-if exist $(LIBDIR)\App rmdir /s /q $(LIBDIR)\App
  	-if exist $(LIBDIR)\Archive rmdir /s /q $(LIBDIR)\Archive
-Index: perl-5.12.2/win32/makefile.mk
+Index: perl-5.12.3/win32/makefile.mk
 ===================================================================
---- perl-5.12.2.orig/win32/makefile.mk
-+++ perl-5.12.2/win32/makefile.mk
+--- perl-5.12.3.orig/win32/makefile.mk
++++ perl-5.12.3/win32/makefile.mk
 @@ -1215,6 +1215,10 @@ $(CONFIGPM) : $(MINIPERL) ..\config.sh c
  	$(MINIPERL) -I..\lib $(ICWD) config_h.PL "INST_VER=$(INST_VER)" \
  	    || $(MAKE) $(MAKEMACROS) $(CONFIGPM) $(MAKEFILE)
@@ -373,10 +373,10 @@ Index: perl-5.12.2/win32/makefile.mk
  	-del /f $(DISTDIR)\XSLoader\XSLoader.pm
  	-if exist $(LIBDIR)\App rmdir /s /q $(LIBDIR)\App
  	-if exist $(LIBDIR)\Archive rmdir /s /q $(LIBDIR)\Archive
-Index: perl-5.12.2/write_buildcustomize.pl
+Index: perl-5.12.3/write_buildcustomize.pl
 ===================================================================
 --- /dev/null
-+++ perl-5.12.2/write_buildcustomize.pl
++++ perl-5.12.3/write_buildcustomize.pl
 @@ -0,0 +1,50 @@
 +#!./miniperl -w
 +
diff --git a/meta/recipes-devtools/perl/perl-5.12.2/parallel_build_fix_6.patch b/meta/recipes-devtools/perl/perl-5.12.3/parallel_build_fix_6.patch
similarity index 89%
rename from meta/recipes-devtools/perl/perl-5.12.2/parallel_build_fix_6.patch
rename to meta/recipes-devtools/perl/perl-5.12.3/parallel_build_fix_6.patch
index cacf9fa..4267739 100644
--- a/meta/recipes-devtools/perl/perl-5.12.2/parallel_build_fix_6.patch
+++ b/meta/recipes-devtools/perl/perl-5.12.3/parallel_build_fix_6.patch
@@ -13,10 +13,10 @@ Date:   Mon Feb 14 20:36:36 2011 +0000
     simplifies many [Mm]akefile* rules, which previously had a special case to
     copy it early.
 
-Index: perl-5.12.2/Cross/Makefile-cross-SH
+Index: perl-5.12.3/Cross/Makefile-cross-SH
 ===================================================================
---- perl-5.12.2.orig/Cross/Makefile-cross-SH
-+++ perl-5.12.2/Cross/Makefile-cross-SH
+--- perl-5.12.3.orig/Cross/Makefile-cross-SH
++++ perl-5.12.3/Cross/Makefile-cross-SH
 @@ -727,7 +727,7 @@ fi
  $spitshell >>$Makefile <<'!NO!SUBS!'
  
@@ -46,10 +46,10 @@ Index: perl-5.12.2/Cross/Makefile-cross-SH
  	- cd t && (rm -f perl$(EXE_EXT); $(LNS) ../miniperl$(EXE_EXT) perl$(EXE_EXT)) \
  		&& $(LDLIBPTH) ./perl TEST -minitest base/*.t comp/*.t cmd/*.t run/*.t io/*.t op/*.t uni/*.t </dev/tty
  
-Index: perl-5.12.2/Makefile.SH
+Index: perl-5.12.3/Makefile.SH
 ===================================================================
---- perl-5.12.2.orig/Makefile.SH
-+++ perl-5.12.2/Makefile.SH
+--- perl-5.12.3.orig/Makefile.SH
++++ perl-5.12.3/Makefile.SH
 @@ -970,7 +970,7 @@ esac
  $spitshell >>$Makefile <<'!NO!SUBS!'
  
@@ -88,10 +88,10 @@ Index: perl-5.12.2/Makefile.SH
  	- cd t && (rm -f $(PERL_EXE); $(LNS) ../$(MINIPERL_EXE) $(PERL_EXE)) \
  		&& $(RUN_PERL) TEST -minitest base/*.t comp/*.t cmd/*.t run/*.t io/*.t re/*.t op/*.t uni/*.t </dev/tty
  
-Index: perl-5.12.2/vms/descrip_mms.template
+Index: perl-5.12.3/vms/descrip_mms.template
 ===================================================================
---- perl-5.12.2.orig/vms/descrip_mms.template
-+++ perl-5.12.2/vms/descrip_mms.template
+--- perl-5.12.3.orig/vms/descrip_mms.template
++++ perl-5.12.3/vms/descrip_mms.template
 @@ -360,7 +360,7 @@ CRTLOPTS =,$(CRTL)/Options
  unidatadirs = lib/unicore/To lib/unicore/lib
  
@@ -120,10 +120,10 @@ Index: perl-5.12.2/vms/descrip_mms.template
  	@ PERL_TEST_DRIVER == "minitest"
  	- @[.vms]test.com "$(E)" "$(__DEBUG__)"
  
-Index: perl-5.12.2/win32/Makefile
+Index: perl-5.12.3/win32/Makefile
 ===================================================================
---- perl-5.12.2.orig/win32/Makefile
-+++ perl-5.12.2/win32/Makefile
+--- perl-5.12.3.orig/win32/Makefile
++++ perl-5.12.3/win32/Makefile
 @@ -918,7 +918,6 @@ $(CONFIGPM) : $(MINIPERL) ..\config.sh c
  	if exist lib\* $(RCOPY) lib\*.* ..\lib\$(NULL)
  	$(XCOPY) ..\*.h $(COREDIR)\*.*
@@ -132,10 +132,10 @@ Index: perl-5.12.2/win32/Makefile
  	$(RCOPY) include $(COREDIR)\*.*
  	-$(MINIPERL) -I..\lib $(ICWD) config_h.PL "INST_VER=$(INST_VER)"
  	if errorlevel 1 $(MAKE) /$(MAKEFLAGS) $(CONFIGPM)
-Index: perl-5.12.2/win32/makefile.mk
+Index: perl-5.12.3/win32/makefile.mk
 ===================================================================
---- perl-5.12.2.orig/win32/makefile.mk
-+++ perl-5.12.2/win32/makefile.mk
+--- perl-5.12.3.orig/win32/makefile.mk
++++ perl-5.12.3/win32/makefile.mk
 @@ -1210,7 +1210,6 @@ $(CONFIGPM) : $(MINIPERL) ..\config.sh c
  	if exist lib\* $(RCOPY) lib\*.* ..\lib\$(NULL)
  	$(XCOPY) ..\*.h $(COREDIR)\*.*
@@ -144,10 +144,10 @@ Index: perl-5.12.2/win32/makefile.mk
  	$(RCOPY) include $(COREDIR)\*.*
  	$(MINIPERL) -I..\lib $(ICWD) config_h.PL "INST_VER=$(INST_VER)" \
  	    || $(MAKE) $(MAKEMACROS) $(CONFIGPM) $(MAKEFILE)
-Index: perl-5.12.2/write_buildcustomize.pl
+Index: perl-5.12.3/write_buildcustomize.pl
 ===================================================================
---- perl-5.12.2.orig/write_buildcustomize.pl
-+++ perl-5.12.2/write_buildcustomize.pl
+--- perl-5.12.3.orig/write_buildcustomize.pl
++++ perl-5.12.3/write_buildcustomize.pl
 @@ -24,6 +24,7 @@ my @toolchain = qw(cpan/AutoLoader/lib
  		   cpan/ExtUtils-MakeMaker/lib
  		   dist/ExtUtils-Manifest/lib
diff --git a/meta/recipes-devtools/perl/perl-5.12.2/perl-configpm-switch.patch b/meta/recipes-devtools/perl/perl-5.12.3/perl-configpm-switch.patch
similarity index 100%
rename from meta/recipes-devtools/perl/perl-5.12.2/perl-configpm-switch.patch
rename to meta/recipes-devtools/perl/perl-5.12.3/perl-configpm-switch.patch
diff --git a/meta/recipes-devtools/perl/perl-5.12.2/perl-configure.sh b/meta/recipes-devtools/perl/perl-5.12.3/perl-configure.sh
similarity index 95%
rename from meta/recipes-devtools/perl/perl-5.12.2/perl-configure.sh
rename to meta/recipes-devtools/perl/perl-5.12.3/perl-configure.sh
index c29e966..e72ce49 100755
--- a/meta/recipes-devtools/perl/perl-5.12.2/perl-configure.sh
+++ b/meta/recipes-devtools/perl/perl-5.12.3/perl-configure.sh
@@ -15,7 +15,7 @@ echo sh Configure -des \
         -Dprefix=/usr \
         -Dvendorprefix=/usr \
         -Dsiteprefix=/usr \
-        -Dotherlibdirs=/usr/lib/perl5/5.12.2 \
+        -Dotherlibdirs=/usr/lib/perl5/5.12.3 \
         -Duseshrplib \
         -Dusethreads \
         -Duseithreads \
diff --git a/meta/recipes-devtools/perl/perl-5.12.2/perl-dynloader.patch b/meta/recipes-devtools/perl/perl-5.12.3/perl-dynloader.patch
similarity index 90%
rename from meta/recipes-devtools/perl/perl-5.12.2/perl-dynloader.patch
rename to meta/recipes-devtools/perl/perl-5.12.3/perl-dynloader.patch
index 21d8bb9..d5ea00f 100644
--- a/meta/recipes-devtools/perl/perl-5.12.2/perl-dynloader.patch
+++ b/meta/recipes-devtools/perl/perl-5.12.3/perl-dynloader.patch
@@ -7,8 +7,8 @@ system.
 
 Update by Nitin A Kamble <nitin.a.kamble@intel.com> 2011/04/21
 
---- perl-5.12.2/dist/XSLoader/XSLoader_pm.PL	2007/04/20 09:03:08	1.1
-+++ perl-5.12.2/dist/XSLoader/XSLoader_pm.PL	2007/04/20 09:03:08
+--- perl-5.12.3/dist/XSLoader/XSLoader_pm.PL	2007/04/20 09:03:08	1.1
++++ perl-5.12.3/dist/XSLoader/XSLoader_pm.PL	2007/04/20 09:03:08
 @@ -65,6 +65,19 @@
  print OUT <<'EOT';
      my $modpname = join('/',@modparts);
diff --git a/meta/recipes-devtools/perl/perl-5.12.2/perl-enable-gdbm.patch b/meta/recipes-devtools/perl/perl-5.12.3/perl-enable-gdbm.patch
similarity index 100%
rename from meta/recipes-devtools/perl/perl-5.12.2/perl-enable-gdbm.patch
rename to meta/recipes-devtools/perl/perl-5.12.3/perl-enable-gdbm.patch
diff --git a/meta/recipes-devtools/perl/perl-5.12.2/perl-moreconfig.patch b/meta/recipes-devtools/perl/perl-5.12.3/perl-moreconfig.patch
similarity index 100%
rename from meta/recipes-devtools/perl/perl-5.12.2/perl-moreconfig.patch
rename to meta/recipes-devtools/perl/perl-5.12.3/perl-moreconfig.patch
diff --git a/meta/recipes-devtools/perl/perl-native_5.12.2.bb b/meta/recipes-devtools/perl/perl-native_5.12.3.bb
similarity index 94%
rename from meta/recipes-devtools/perl/perl-native_5.12.2.bb
rename to meta/recipes-devtools/perl/perl-native_5.12.3.bb
index c9882a9..0b0c949 100644
--- a/meta/recipes-devtools/perl/perl-native_5.12.2.bb
+++ b/meta/recipes-devtools/perl/perl-native_5.12.3.bb
@@ -4,7 +4,7 @@ SECTION = "libs"
 LICENSE = "Artistic|GPL"
 LIC_FILES_CHKSUM = "file://Copying;md5=2b4c6ffbcfcbdee469f02565f253d81a \
 		    file://Artistic;md5=f921793d03cc6d63ec4b15e9be8fd3f8"
-PR = "r8"
+PR = "r0"
 
 LIC_FILES_CHKSUM = "file://Copying;md5=2b4c6ffbcfcbdee469f02565f253d81a \
                     file://Artistic;md5=f921793d03cc6d63ec4b15e9be8fd3f8"
@@ -21,8 +21,8 @@ SRC_URI = "http://ftp.funet.fi/pub/CPAN/src/perl-${PV}.tar.gz \
            file://native-nopacklist.patch;patch=1 \
            file://native-perlinc.patch;patch=1"
 
-SRC_URI[md5sum] = "af2df531d46b77fdf0d97eecb03eddb2"
-SRC_URI[sha256sum] = "cf888340021d5a2d1238bbd9b8b55aaf420a848d46e4d317cb8567f86ceb1022"
+SRC_URI[md5sum] = "29975a69dce54e47fcd6331c085c6c99"
+SRC_URI[sha256sum] = "5678bfd5c2cd59253a26171bf3e681235433b00c730eea8a8046e1b225c11d2f"
 
 S = "${WORKDIR}/perl-${PV}"
 
@@ -96,7 +96,7 @@ do_install () {
 		install $i ${D}${libdir}/perl/${PV}/CORE
 	done
 
-	create_wrapper ${D}${bindir}/perl PERL5LIB='$PERL5LIB:${STAGING_LIBDIR}/perl/5.12.2:${STAGING_LIBDIR}/perl/'
+	create_wrapper ${D}${bindir}/perl PERL5LIB='$PERL5LIB:${STAGING_LIBDIR}/perl/${PV}:${STAGING_LIBDIR}/perl/'
 }
 do_install_append_nylon() {
 	# get rid of definitions not supported by the gcc version we use for nylon...
diff --git a/meta/recipes-devtools/perl/perl-rdepends_5.12.2.inc b/meta/recipes-devtools/perl/perl-rdepends_5.12.3.inc
similarity index 100%
rename from meta/recipes-devtools/perl/perl-rdepends_5.12.2.inc
rename to meta/recipes-devtools/perl/perl-rdepends_5.12.3.inc
diff --git a/meta/recipes-devtools/perl/perl-rprovides_5.12.2.inc b/meta/recipes-devtools/perl/perl-rprovides_5.12.3.inc
similarity index 100%
rename from meta/recipes-devtools/perl/perl-rprovides_5.12.2.inc
rename to meta/recipes-devtools/perl/perl-rprovides_5.12.3.inc
diff --git a/meta/recipes-devtools/perl/perl_5.12.2.bb b/meta/recipes-devtools/perl/perl_5.12.3.bb
similarity index 85%
rename from meta/recipes-devtools/perl/perl_5.12.2.bb
rename to meta/recipes-devtools/perl/perl_5.12.3.bb
index 9ce8156..584d643 100644
--- a/meta/recipes-devtools/perl/perl_5.12.2.bb
+++ b/meta/recipes-devtools/perl/perl_5.12.3.bb
@@ -8,15 +8,49 @@ PRIORITY = "optional"
 # We need gnugrep (for -I)
 DEPENDS = "virtual/db perl-native-${PV} grep-native"
 DEPENDS += "gdbm zlib"
-PR = "r4"
+PR = "r0"
 
 # 5.10.1 has Module::Build built-in
 PROVIDES += "libmodule-build-perl"
 
 # Major part of version
-#PVM = "5.12"
-
-SRC_URI = "ftp://ftp.funet.fi/pub/CPAN/src/perl-${PV}.tar.gz \
+#PVM = "5.13"
+
+SRC_URI = "http://www.cpan.org/src/5.0/perl-${PV}.tar.gz \
+	file://debian/arm_thread_stress_timeout.diff \
+	file://debian/cpan_config_path.diff \
+	file://debian/cpan_definstalldirs.diff \
+	file://debian/db_file_ver.diff \
+	file://debian/doc_info.diff \
+	file://debian/enc2xs_inc.diff \
+	file://debian/errno_ver.diff \
+	file://debian/extutils_hacks.diff \
+	file://debian/instmodsh_doc.diff \
+	file://debian/ld_run_path.diff \
+	file://debian/libnet_config_path.diff \
+	file://debian/m68k_thread_stress.diff \
+	file://debian/mod_paths.diff \
+	file://debian/module_build_man_extensions.diff \
+	file://debian/prune_libs.diff \
+	file://debian/fixes/net_smtp_docs.diff \
+	file://debian/fixes/processPL.diff \
+	file://debian/perlivp.diff \
+	file://debian/disable-zlib-bundling.diff \
+	file://debian/cpanplus_definstalldirs.diff \
+	file://debian/cpanplus_config_path.diff \
+	file://debian/fixes/autodie-flock.diff \
+	file://debian/devel-ppport-ia64-optim.diff \
+	file://debian/fixes/cpanplus-without-home.diff \
+	file://debian/arm_optim.diff \
+	file://debian/deprecate-with-apt.diff \
+	file://debian/fixes/hurd-ccflags.diff \
+	file://debian/squelch-locale-warnings.diff \
+	file://debian/fixes/lc-numeric-docs.diff \
+	file://debian/fixes/lc-numeric-sprintf.diff \
+	file://debian/fixes/concat-stack-corruption.diff \
+	file://debian/fixes/h2ph-gcc-4.5.diff \
+	file://debian/patchlevel \
+	\
         file://Makefile.patch;patch=1 \
         file://parallel_build_fix_1.patch \
         file://parallel_build_fix_2.patch \
@@ -34,38 +68,7 @@ SRC_URI = "ftp://ftp.funet.fi/pub/CPAN/src/perl-${PV}.tar.gz \
         file://native-perlinc.patch \
         file://perl-enable-gdbm.patch \
         file://cross-generate_uudmap.patch \
-        file://debian/arm_thread_stress_timeout.diff \
-        file://debian/cpan_config_path.diff \
-        file://debian/cpan_definstalldirs.diff \
-        file://debian/db_file_ver.diff \
-        file://debian/doc_info.diff \
-        file://debian/enc2xs_inc.diff \
-        file://debian/errno_ver.diff \
-        file://debian/extutils_hacks.diff \
-        file://debian/instmodsh_doc.diff \
-        file://debian/ld_run_path.diff \
-        file://debian/libnet_config_path.diff \
-        file://debian/m68k_thread_stress.diff \
-        file://debian/mod_paths.diff \
-        file://debian/module_build_man_extensions.diff \
-        file://debian/prune_libs.diff \
-        file://debian/fixes/net_smtp_docs.diff \
-        file://debian/fixes/processPL.diff \
-        file://debian/perlivp.diff \
-        file://debian/disable-zlib-bundling.diff \
-        file://debian/cpanplus_definstalldirs.diff \
-        file://debian/cpanplus_config_path.diff \
-        file://debian/fixes/autodie-flock.diff \
-        file://debian/devel-ppport-ia64-optim.diff \
-        file://debian/fixes/cpanplus-without-home.diff \
-        file://debian/arm_optim.diff \
-        file://debian/deprecate-with-apt.diff \
-        file://debian/fixes/hurd-ccflags.diff \
-        file://debian/squelch-locale-warnings.diff \
-        file://debian/fixes/lc-numeric-docs.diff \
-        file://debian/fixes/lc-numeric-sprintf.diff \
-        file://debian/fixes/concat-stack-corruption.diff \
-        file://debian/fixes/h2ph-gcc-4.5.diff \
+	\
         file://config.sh \
         file://config.sh-32 \
         file://config.sh-32-le \
@@ -73,10 +76,10 @@ SRC_URI = "ftp://ftp.funet.fi/pub/CPAN/src/perl-${PV}.tar.gz \
         file://config.sh-64 \
         file://config.sh-64-le \
         file://config.sh-64-be"
-#        file://debian/fakeroot.diff
+#	file://debian/fakeroot.diff
 
-SRC_URI[md5sum] = "af2df531d46b77fdf0d97eecb03eddb2"
-SRC_URI[sha256sum] = "cf888340021d5a2d1238bbd9b8b55aaf420a848d46e4d317cb8567f86ceb1022"
+SRC_URI[md5sum] = "29975a69dce54e47fcd6331c085c6c99"
+SRC_URI[sha256sum] = "5678bfd5c2cd59253a26171bf3e681235433b00c730eea8a8046e1b225c11d2f"
 
 inherit siteinfo
 
-- 
1.7.1.1



