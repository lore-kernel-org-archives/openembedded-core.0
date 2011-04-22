Received: from mga01.intel.com ([192.55.52.88])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <sgw@linux.intel.com>) id 1QDAlw-0001pp-2P
	for openembedded-core@lists.openembedded.org;
	Fri, 22 Apr 2011 09:27:26 +0200
Received: from fmsmga001.fm.intel.com ([10.253.24.23])
	by fmsmga101.fm.intel.com with ESMTP; 22 Apr 2011 00:25:01 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="4.64,253,1301900400"; d="scan'208";a="913034244"
Received: from unknown (HELO localhost) ([10.255.12.237])
	by fmsmga001.fm.intel.com with ESMTP; 22 Apr 2011 00:25:00 -0700
Message-Id: <c5897d5f0927967f0120ae100256442b8dcde406.1303453279.git.sgw@linux.intel.com>
In-Reply-To: <cover.1303453279.git.sgw@linux.intel.com>
References: <cover.1303453279.git.sgw@linux.intel.com>
Old-Date: Wed, 20 Apr 2011 14:49:41 -0700
Date: Fri, 22 Apr 2011  0:25:00 -0700
To: openembedded-core@lists.openembedded.org
From: Saul Wold <sgw@linux.intel.com>
X-Mailman-Approved-At: Fri, 22 Apr 2011 09:33:35 +0200
Cc: Koen Kooi <koen@dominion.thruhere.net>
Subject: [PATCH 29/33] perl-5.12.2: use of PERLHOSTLIB var fix
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
X-List-Received-Date: Fri, 22 Apr 2011 07:27:26 -0000

From: Nitin A Kamble <nitin.a.kamble@intel.com>

PERLHOSTLIB var is used to build target perl. It let perl use the native
perl .so module files at the time of compilation of target perl.

These changes to perl make the PERLHOSTLIB variable also useful for
building perl modules to use native .so perl module.

Signed-off-by: Nitin A Kamble <nitin.a.kamble@intel.com>
---
 .../libperl-5.8.3-create-libperl-soname.patch      |   11 -----------
 .../perl/perl-5.12.2/09_fix_installperl.patch      |    2 ++
 .../Configure-multilib.patch                       |    2 ++
 .../perl/perl-5.12.2/Makefile.SH.patch             |    2 ++
 .../perl/perl-5.12.2/Makefile.patch                |    2 ++
 .../perl/perl-5.12.2/asm-pageh-fix.patch           |    2 ++
 .../perl/perl-5.12.2/cross-generate_uudmap.patch   |    2 ++
 .../perl/perl-5.12.2/debian/arm_optim.diff         |    2 ++
 .../debian/arm_thread_stress_timeout.diff          |    2 ++
 .../perl/perl-5.12.2/debian/cpan_config_path.diff  |    2 ++
 .../perl-5.12.2/debian/cpan_definstalldirs.diff    |    2 ++
 .../perl-5.12.2/debian/cpanplus_config_path.diff   |    2 ++
 .../debian/cpanplus_definstalldirs.diff            |    2 ++
 .../perl/perl-5.12.2/debian/db_file_ver.diff       |    2 ++
 .../perl-5.12.2/debian/deprecate-with-apt.diff     |    2 ++
 .../debian/devel-ppport-ia64-optim.diff            |    2 ++
 .../perl-5.12.2/debian/disable-zlib-bundling.diff  |    2 ++
 .../perl/perl-5.12.2/debian/doc_info.diff          |    2 ++
 .../perl/perl-5.12.2/debian/enc2xs_inc.diff        |    2 ++
 .../perl/perl-5.12.2/debian/errno_ver.diff         |    2 ++
 .../perl/perl-5.12.2/debian/extutils_hacks.diff    |    2 ++
 .../perl/perl-5.12.2/debian/fakeroot.diff          |    2 ++
 .../perl-5.12.2/debian/fixes/autodie-flock.diff    |    2 ++
 .../debian/fixes/concat-stack-corruption.diff      |    2 ++
 .../debian/fixes/cpanplus-without-home.diff        |    2 ++
 .../perl-5.12.2/debian/fixes/h2ph-gcc-4.5.diff     |    2 ++
 .../perl-5.12.2/debian/fixes/hurd-ccflags.diff     |    2 ++
 .../perl-5.12.2/debian/fixes/lc-numeric-docs.diff  |    2 ++
 .../debian/fixes/lc-numeric-sprintf.diff           |    2 ++
 .../perl-5.12.2/debian/fixes/net_smtp_docs.diff    |    2 ++
 .../perl/perl-5.12.2/debian/fixes/processPL.diff   |    2 ++
 .../perl/perl-5.12.2/debian/instmodsh_doc.diff     |    2 ++
 .../perl/perl-5.12.2/debian/ld_run_path.diff       |    2 ++
 .../perl-5.12.2/debian/libnet_config_path.diff     |    2 ++
 .../perl-5.12.2/debian/m68k_thread_stress.diff     |    2 ++
 .../perl/perl-5.12.2/debian/mod_paths.diff         |    2 ++
 .../debian/module_build_man_extensions.diff        |    2 ++
 .../perl/perl-5.12.2/debian/perlivp.diff           |    2 ++
 .../perl/perl-5.12.2/debian/prune_libs.diff        |    2 ++
 .../debian/squelch-locale-warnings.diff            |    2 ++
 .../perl/perl-5.12.2/generate-sh.patch             |    2 ++
 .../perl/perl-5.12.2/installperl.patch             |    2 ++
 .../{files => perl-5.12.2}/letgcc-find-errno.patch |    2 ++
 .../perl/perl-5.12.2/native-nopacklist.patch       |    2 ++
 .../perl/perl-5.12.2/native-perlinc.patch          |    2 ++
 .../perl/perl-5.12.2/native-ssp.patch              |    2 ++
 .../perl/perl-5.12.2/parallel_build_fix_1.patch    |    2 ++
 .../perl/perl-5.12.2/parallel_build_fix_2.patch    |    2 ++
 .../perl/perl-5.12.2/parallel_build_fix_3.patch    |    2 ++
 .../perl/perl-5.12.2/parallel_build_fix_4.patch    |    2 ++
 .../perl/perl-5.12.2/parallel_build_fix_5.patch    |    2 ++
 .../perl/perl-5.12.2/parallel_build_fix_6.patch    |    2 ++
 .../perl/perl-5.12.2/perl-configpm-switch.patch    |    2 ++
 .../perl/perl-5.12.2/perl-dynloader.patch          |   12 ++++++++++--
 .../perl/perl-5.12.2/perl-enable-gdbm.patch        |    2 ++
 .../perl/perl-5.12.2/perl-moreconfig.patch         |    2 ++
 meta/recipes-devtools/perl/perl_5.12.2.bb          |    2 +-
 57 files changed, 119 insertions(+), 14 deletions(-)
 delete mode 100644 meta/recipes-devtools/perl/files/libperl-5.8.3-create-libperl-soname.patch
 rename meta/recipes-devtools/perl/{files => perl-5.12.2}/Configure-multilib.patch (96%)
 rename meta/recipes-devtools/perl/{files => perl-5.12.2}/letgcc-find-errno.patch (96%)

diff --git a/meta/recipes-devtools/perl/files/libperl-5.8.3-create-libperl-soname.patch b/meta/recipes-devtools/perl/files/libperl-5.8.3-create-libperl-soname.patch
deleted file mode 100644
index 6b34ec2..0000000
--- a/meta/recipes-devtools/perl/files/libperl-5.8.3-create-libperl-soname.patch
+++ /dev/null
@@ -1,11 +0,0 @@
---- Makefile.SH.orig	2003-07-10 14:59:04.000000000 -0700
-+++ Makefile.SH	2003-07-10 15:14:08.000000000 -0700
-@@ -494,7 +494,7 @@
- 	case "$useshrplib" in
- 	true)
- 		$spitshell >>Makefile <<'!NO!SUBS!'
--	$(LD) -o $@ $(SHRPLDFLAGS) perl$(OBJ_EXT) $(obj) $(libs)
-+	$(LD) -o $@ $(SHRPLDFLAGS) perl$(OBJ_EXT) $(obj) $(libs) -soname libperl.so.5
- !NO!SUBS!
- 		case "$osname" in
- 		aix)
diff --git a/meta/recipes-devtools/perl/perl-5.12.2/09_fix_installperl.patch b/meta/recipes-devtools/perl/perl-5.12.2/09_fix_installperl.patch
index 6f2531b..cfe0047 100644
--- a/meta/recipes-devtools/perl/perl-5.12.2/09_fix_installperl.patch
+++ b/meta/recipes-devtools/perl/perl-5.12.2/09_fix_installperl.patch
@@ -1,3 +1,5 @@
+Upstream-Status:Inappropriate [embedded specific]
+
 Correctly identify arch-specific modules in ext/ where the .pm files
 are under lib.
 
diff --git a/meta/recipes-devtools/perl/files/Configure-multilib.patch b/meta/recipes-devtools/perl/perl-5.12.2/Configure-multilib.patch
similarity index 96%
rename from meta/recipes-devtools/perl/files/Configure-multilib.patch
rename to meta/recipes-devtools/perl/perl-5.12.2/Configure-multilib.patch
index b561b6a..6a4125b 100644
--- a/meta/recipes-devtools/perl/files/Configure-multilib.patch
+++ b/meta/recipes-devtools/perl/perl-5.12.2/Configure-multilib.patch
@@ -1,3 +1,5 @@
+Upstream-Status:Pending
+
 Index: perl-5.12.2/Configure
 ===================================================================
 --- perl-5.12.2.orig/Configure
diff --git a/meta/recipes-devtools/perl/perl-5.12.2/Makefile.SH.patch b/meta/recipes-devtools/perl/perl-5.12.2/Makefile.SH.patch
index 39e5fee..72f1b8f 100644
--- a/meta/recipes-devtools/perl/perl-5.12.2/Makefile.SH.patch
+++ b/meta/recipes-devtools/perl/perl-5.12.2/Makefile.SH.patch
@@ -1,3 +1,5 @@
+Upstream-Status:Inappropriate [embedded specific]
+
 Index: perl-5.12.2/Makefile.SH
 ===================================================================
 --- perl-5.12.2.orig/Makefile.SH
diff --git a/meta/recipes-devtools/perl/perl-5.12.2/Makefile.patch b/meta/recipes-devtools/perl/perl-5.12.2/Makefile.patch
index e7226ff..2c374ed 100644
--- a/meta/recipes-devtools/perl/perl-5.12.2/Makefile.patch
+++ b/meta/recipes-devtools/perl/perl-5.12.2/Makefile.patch
@@ -1,3 +1,5 @@
+Upstream-Status:Inappropriate [embedded specific]
+
 Index: perl-5.12.2/Cross/Makefile
 ===================================================================
 --- perl-5.12.2.orig/Cross/Makefile
diff --git a/meta/recipes-devtools/perl/perl-5.12.2/asm-pageh-fix.patch b/meta/recipes-devtools/perl/perl-5.12.2/asm-pageh-fix.patch
index c972108..251beb9 100644
--- a/meta/recipes-devtools/perl/perl-5.12.2/asm-pageh-fix.patch
+++ b/meta/recipes-devtools/perl/perl-5.12.2/asm-pageh-fix.patch
@@ -1,3 +1,5 @@
+Upstream-Status:Pending
+
 Perl inclues asm/page.h in order to get the definition for getpagesize which
 has been definied in unistd.h since glibc 2.1. Some recent version of linux
 libc headers removed the asm/page.h resulting in failures here for some
diff --git a/meta/recipes-devtools/perl/perl-5.12.2/cross-generate_uudmap.patch b/meta/recipes-devtools/perl/perl-5.12.2/cross-generate_uudmap.patch
index f6218c1..d59ad8d 100644
--- a/meta/recipes-devtools/perl/perl-5.12.2/cross-generate_uudmap.patch
+++ b/meta/recipes-devtools/perl/perl-5.12.2/cross-generate_uudmap.patch
@@ -1,3 +1,5 @@
+Upstream-Status:Inappropriate [embedded specific]
+
 Index: perl-5.10.1/Makefile.SH
 ===================================================================
 --- perl-5.10.1.orig/Makefile.SH	2010-02-12 19:06:17.000000000 +0300
diff --git a/meta/recipes-devtools/perl/perl-5.12.2/debian/arm_optim.diff b/meta/recipes-devtools/perl/perl-5.12.2/debian/arm_optim.diff
index 383df6b..c86ddc9 100644
--- a/meta/recipes-devtools/perl/perl-5.12.2/debian/arm_optim.diff
+++ b/meta/recipes-devtools/perl/perl-5.12.2/debian/arm_optim.diff
@@ -1,3 +1,5 @@
+Upstream-Status:Inappropriate [debian patch]
+
 From: Niko Tyni <ntyni@debian.org>
 Description: Downgrade the optimization of sv.c on arm due to a gcc-4.4 bug
 Bug-Debian: http://bugs.debian.org/580334
diff --git a/meta/recipes-devtools/perl/perl-5.12.2/debian/arm_thread_stress_timeout.diff b/meta/recipes-devtools/perl/perl-5.12.2/debian/arm_thread_stress_timeout.diff
index 34b8a2c..c4b4c13 100644
--- a/meta/recipes-devtools/perl/perl-5.12.2/debian/arm_thread_stress_timeout.diff
+++ b/meta/recipes-devtools/perl/perl-5.12.2/debian/arm_thread_stress_timeout.diff
@@ -1,3 +1,5 @@
+Upstream-Status:Inappropriate [debian patch]
+
 Subject: Raise the timeout of ext/threads/shared/t/stress.t to accommodate slower build hosts
 Bug-Debian: http://bugs.debian.org/501970
 
diff --git a/meta/recipes-devtools/perl/perl-5.12.2/debian/cpan_config_path.diff b/meta/recipes-devtools/perl/perl-5.12.2/debian/cpan_config_path.diff
index 799d15e..4a349b4 100644
--- a/meta/recipes-devtools/perl/perl-5.12.2/debian/cpan_config_path.diff
+++ b/meta/recipes-devtools/perl/perl-5.12.2/debian/cpan_config_path.diff
@@ -1,3 +1,5 @@
+Upstream-Status:Inappropriate [debian patch]
+
 Subject: Set location of CPAN::Config to /etc/perl as /usr may not be writable.
 
 
diff --git a/meta/recipes-devtools/perl/perl-5.12.2/debian/cpan_definstalldirs.diff b/meta/recipes-devtools/perl/perl-5.12.2/debian/cpan_definstalldirs.diff
index f64af15..3e3e53f 100644
--- a/meta/recipes-devtools/perl/perl-5.12.2/debian/cpan_definstalldirs.diff
+++ b/meta/recipes-devtools/perl/perl-5.12.2/debian/cpan_definstalldirs.diff
@@ -1,3 +1,5 @@
+Upstream-Status:Inappropriate [debian patch]
+
 Subject: Provide a sensible INSTALLDIRS default for modules installed from CPAN.
 
 Some modules which are included in core set INSTALLDIRS => 'perl'
diff --git a/meta/recipes-devtools/perl/perl-5.12.2/debian/cpanplus_config_path.diff b/meta/recipes-devtools/perl/perl-5.12.2/debian/cpanplus_config_path.diff
index 6956218..6510119 100644
--- a/meta/recipes-devtools/perl/perl-5.12.2/debian/cpanplus_config_path.diff
+++ b/meta/recipes-devtools/perl/perl-5.12.2/debian/cpanplus_config_path.diff
@@ -1,3 +1,5 @@
+Upstream-Status:Inappropriate [debian patch]
+
 From: Niko Tyni <ntyni@debian.org>
 Subject: Save local versions of CPANPLUS::Config::System into /etc/perl.
     
diff --git a/meta/recipes-devtools/perl/perl-5.12.2/debian/cpanplus_definstalldirs.diff b/meta/recipes-devtools/perl/perl-5.12.2/debian/cpanplus_definstalldirs.diff
index 3a1e209..2ec063c 100644
--- a/meta/recipes-devtools/perl/perl-5.12.2/debian/cpanplus_definstalldirs.diff
+++ b/meta/recipes-devtools/perl/perl-5.12.2/debian/cpanplus_definstalldirs.diff
@@ -1,3 +1,5 @@
+Upstream-Status:Inappropriate [debian patch]
+
 From: Niko Tyni <ntyni@debian.org>
 Subject: Configure CPANPLUS to use the site directories by default.
 Closes: 533707
diff --git a/meta/recipes-devtools/perl/perl-5.12.2/debian/db_file_ver.diff b/meta/recipes-devtools/perl/perl-5.12.2/debian/db_file_ver.diff
index 8d0e61b..a974d08 100644
--- a/meta/recipes-devtools/perl/perl-5.12.2/debian/db_file_ver.diff
+++ b/meta/recipes-devtools/perl/perl-5.12.2/debian/db_file_ver.diff
@@ -1,3 +1,5 @@
+Upstream-Status:Inappropriate [debian patch]
+
 Subject: Remove overly restrictive DB_File version check.
 Bug-Debian: http://bugs.debian.org/340047
 
diff --git a/meta/recipes-devtools/perl/perl-5.12.2/debian/deprecate-with-apt.diff b/meta/recipes-devtools/perl/perl-5.12.2/debian/deprecate-with-apt.diff
index a515035..e580466 100644
--- a/meta/recipes-devtools/perl/perl-5.12.2/debian/deprecate-with-apt.diff
+++ b/meta/recipes-devtools/perl/perl-5.12.2/debian/deprecate-with-apt.diff
@@ -1,3 +1,5 @@
+Upstream-Status:Inappropriate [debian patch]
+
 From: Niko Tyni <ntyni@debian.org>
 Subject: Point users to Debian packages of deprecated core modules
 Bug-Debian: http://bugs.debian.org/580034
diff --git a/meta/recipes-devtools/perl/perl-5.12.2/debian/devel-ppport-ia64-optim.diff b/meta/recipes-devtools/perl/perl-5.12.2/debian/devel-ppport-ia64-optim.diff
index 9e4d9cf..c656010 100644
--- a/meta/recipes-devtools/perl/perl-5.12.2/debian/devel-ppport-ia64-optim.diff
+++ b/meta/recipes-devtools/perl/perl-5.12.2/debian/devel-ppport-ia64-optim.diff
@@ -1,3 +1,5 @@
+Upstream-Status:Inappropriate [debian patch]
+
 From: Niko Tyni <ntyni@debian.org>
 Subject: Work around an ICE on ia64
 Closes: 548943
diff --git a/meta/recipes-devtools/perl/perl-5.12.2/debian/disable-zlib-bundling.diff b/meta/recipes-devtools/perl/perl-5.12.2/debian/disable-zlib-bundling.diff
index f540067..e036dc5 100644
--- a/meta/recipes-devtools/perl/perl-5.12.2/debian/disable-zlib-bundling.diff
+++ b/meta/recipes-devtools/perl/perl-5.12.2/debian/disable-zlib-bundling.diff
@@ -1,3 +1,5 @@
+Upstream-Status:Inappropriate [debian patch]
+
 From: Niko Tyni <ntyni@debian.org>
 Subject: Disable zlib bundling in Compress::Raw::Zlib
 
diff --git a/meta/recipes-devtools/perl/perl-5.12.2/debian/doc_info.diff b/meta/recipes-devtools/perl/perl-5.12.2/debian/doc_info.diff
index ec7eba9..2f5d9a4 100644
--- a/meta/recipes-devtools/perl/perl-5.12.2/debian/doc_info.diff
+++ b/meta/recipes-devtools/perl/perl-5.12.2/debian/doc_info.diff
@@ -1,3 +1,5 @@
+Upstream-Status:Inappropriate [debian patch]
+
 Subject: Replace generic man(1) instructions with Debian-specific information.
 
 Indicate that the user needs to install the perl-doc package.
diff --git a/meta/recipes-devtools/perl/perl-5.12.2/debian/enc2xs_inc.diff b/meta/recipes-devtools/perl/perl-5.12.2/debian/enc2xs_inc.diff
index 227dc10..e96d53d 100644
--- a/meta/recipes-devtools/perl/perl-5.12.2/debian/enc2xs_inc.diff
+++ b/meta/recipes-devtools/perl/perl-5.12.2/debian/enc2xs_inc.diff
@@ -1,3 +1,5 @@
+Upstream-Status:Inappropriate [debian patch]
+
 Subject: Tweak enc2xs to follow symlinks and ignore missing @INC directories.
 Bug-Debian: http://bugs.debian.org/290336
 
diff --git a/meta/recipes-devtools/perl/perl-5.12.2/debian/errno_ver.diff b/meta/recipes-devtools/perl/perl-5.12.2/debian/errno_ver.diff
index f437008..b28b4bc 100644
--- a/meta/recipes-devtools/perl/perl-5.12.2/debian/errno_ver.diff
+++ b/meta/recipes-devtools/perl/perl-5.12.2/debian/errno_ver.diff
@@ -1,3 +1,5 @@
+Upstream-Status:Inappropriate [debian patch]
+
 Subject: Remove Errno version check due to upgrade problems with long-running processes.
 Bug-Debian: http://bugs.debian.org/343351
 
diff --git a/meta/recipes-devtools/perl/perl-5.12.2/debian/extutils_hacks.diff b/meta/recipes-devtools/perl/perl-5.12.2/debian/extutils_hacks.diff
index 9134cac..1fb635d 100644
--- a/meta/recipes-devtools/perl/perl-5.12.2/debian/extutils_hacks.diff
+++ b/meta/recipes-devtools/perl/perl-5.12.2/debian/extutils_hacks.diff
@@ -1,3 +1,5 @@
+Upstream-Status:Inappropriate [debian patch]
+
 Subject: Various debian-specific ExtUtils changes
 
  * Respect umask during installation, and set as appropriate for each of
diff --git a/meta/recipes-devtools/perl/perl-5.12.2/debian/fakeroot.diff b/meta/recipes-devtools/perl/perl-5.12.2/debian/fakeroot.diff
index e3430ce..380955b 100644
--- a/meta/recipes-devtools/perl/perl-5.12.2/debian/fakeroot.diff
+++ b/meta/recipes-devtools/perl/perl-5.12.2/debian/fakeroot.diff
@@ -1,3 +1,5 @@
+Upstream-Status:Inappropriate [debian patch]
+
 Subject: Postpone LD_LIBRARY_PATH evaluation to the binary targets.
 
 Modify the setting of LD_LIBRARY_PATH to append pre-existing values at the
diff --git a/meta/recipes-devtools/perl/perl-5.12.2/debian/fixes/autodie-flock.diff b/meta/recipes-devtools/perl/perl-5.12.2/debian/fixes/autodie-flock.diff
index f8908ac..1e2c1ad 100644
--- a/meta/recipes-devtools/perl/perl-5.12.2/debian/fixes/autodie-flock.diff
+++ b/meta/recipes-devtools/perl/perl-5.12.2/debian/fixes/autodie-flock.diff
@@ -1,3 +1,5 @@
+Upstream-Status:Inappropriate [debian patch]
+
 From: Niko Tyni <ntyni@debian.org>
 Subject: Allow for flock returning EAGAIN instead of EWOULDBLOCK on linux/parisc
 Bug-Debian: http://bugs.debian.org/543731
diff --git a/meta/recipes-devtools/perl/perl-5.12.2/debian/fixes/concat-stack-corruption.diff b/meta/recipes-devtools/perl/perl-5.12.2/debian/fixes/concat-stack-corruption.diff
index 6feb840..ef21261 100644
--- a/meta/recipes-devtools/perl/perl-5.12.2/debian/fixes/concat-stack-corruption.diff
+++ b/meta/recipes-devtools/perl/perl-5.12.2/debian/fixes/concat-stack-corruption.diff
@@ -1,3 +1,5 @@
+Upstream-Status:Inappropriate [debian patch]
+
 From: Niko Tyni <ntyni@debian.org>
 Subject: Fix stack pointer corruption in pp_concat() with 'use encoding'
 Bug-Debian: http://bugs.debian.org/596105
diff --git a/meta/recipes-devtools/perl/perl-5.12.2/debian/fixes/cpanplus-without-home.diff b/meta/recipes-devtools/perl/perl-5.12.2/debian/fixes/cpanplus-without-home.diff
index 5f85894..798b7c2 100644
--- a/meta/recipes-devtools/perl/perl-5.12.2/debian/fixes/cpanplus-without-home.diff
+++ b/meta/recipes-devtools/perl/perl-5.12.2/debian/fixes/cpanplus-without-home.diff
@@ -1,3 +1,5 @@
+Upstream-Status:Inappropriate [debian patch]
+
 From: Niko Tyni <ntyni@debian.org>
 Subject: Fix CPANPLUS test failures when HOME doesn't exist
 Bug: http://rt.cpan.org/Public/Bug/Display.html?id=52988
diff --git a/meta/recipes-devtools/perl/perl-5.12.2/debian/fixes/h2ph-gcc-4.5.diff b/meta/recipes-devtools/perl/perl-5.12.2/debian/fixes/h2ph-gcc-4.5.diff
index c2baf2f..49d797c 100644
--- a/meta/recipes-devtools/perl/perl-5.12.2/debian/fixes/h2ph-gcc-4.5.diff
+++ b/meta/recipes-devtools/perl/perl-5.12.2/debian/fixes/h2ph-gcc-4.5.diff
@@ -1,3 +1,5 @@
+Upstream-Status:Inappropriate [debian patch]
+
 Author: Robin Barker <rmbarker@cpan.org>
 Subject: h2ph fix for gcc 4.5
 Bug-Debian: http://bugs.debian.org/599933
diff --git a/meta/recipes-devtools/perl/perl-5.12.2/debian/fixes/hurd-ccflags.diff b/meta/recipes-devtools/perl/perl-5.12.2/debian/fixes/hurd-ccflags.diff
index b9ea677..d7b43e9 100644
--- a/meta/recipes-devtools/perl/perl-5.12.2/debian/fixes/hurd-ccflags.diff
+++ b/meta/recipes-devtools/perl/perl-5.12.2/debian/fixes/hurd-ccflags.diff
@@ -1,3 +1,5 @@
+Upstream-Status:Inappropriate [debian patch]
+
 Author: Samuel Thibault <sthibault@debian.org>
 Subject: Make hints/gnu.sh append to $ccflags rather than overriding them
 Bug-Debian: http://bugs.debian.org/587901
diff --git a/meta/recipes-devtools/perl/perl-5.12.2/debian/fixes/lc-numeric-docs.diff b/meta/recipes-devtools/perl/perl-5.12.2/debian/fixes/lc-numeric-docs.diff
index bb5c0e8..ece4989 100644
--- a/meta/recipes-devtools/perl/perl-5.12.2/debian/fixes/lc-numeric-docs.diff
+++ b/meta/recipes-devtools/perl/perl-5.12.2/debian/fixes/lc-numeric-docs.diff
@@ -1,3 +1,5 @@
+Upstream-Status:Inappropriate [debian patch]
+
 From: Niko Tyni <ntyni@debian.org>
 Subject: LC_NUMERIC documentation fixes
 Bug-Debian: http://bugs.debian.org/379329
diff --git a/meta/recipes-devtools/perl/perl-5.12.2/debian/fixes/lc-numeric-sprintf.diff b/meta/recipes-devtools/perl/perl-5.12.2/debian/fixes/lc-numeric-sprintf.diff
index 6a39820..b150e72 100644
--- a/meta/recipes-devtools/perl/perl-5.12.2/debian/fixes/lc-numeric-sprintf.diff
+++ b/meta/recipes-devtools/perl/perl-5.12.2/debian/fixes/lc-numeric-sprintf.diff
@@ -1,3 +1,5 @@
+Upstream-Status:Inappropriate [debian patch]
+
 From: Niko Tyni <ntyni@debian.org>
 Subject: Fix sprintf not to ignore LC_NUMERIC with constants
 Bug-Debian: http://bugs.debian.org/601549
diff --git a/meta/recipes-devtools/perl/perl-5.12.2/debian/fixes/net_smtp_docs.diff b/meta/recipes-devtools/perl/perl-5.12.2/debian/fixes/net_smtp_docs.diff
index 6dc9712..f7b5e42 100644
--- a/meta/recipes-devtools/perl/perl-5.12.2/debian/fixes/net_smtp_docs.diff
+++ b/meta/recipes-devtools/perl/perl-5.12.2/debian/fixes/net_smtp_docs.diff
@@ -1,3 +1,5 @@
+Upstream-Status:Inappropriate [debian patch]
+
 Subject: Document the Net::SMTP 'Port' option
 Bug-Debian: http://bugs.debian.org/100195
 Bug: http://rt.cpan.org/Public/Bug/Display.html?id=36038
diff --git a/meta/recipes-devtools/perl/perl-5.12.2/debian/fixes/processPL.diff b/meta/recipes-devtools/perl/perl-5.12.2/debian/fixes/processPL.diff
index 5a444e3..3b645d1 100644
--- a/meta/recipes-devtools/perl/perl-5.12.2/debian/fixes/processPL.diff
+++ b/meta/recipes-devtools/perl/perl-5.12.2/debian/fixes/processPL.diff
@@ -1,3 +1,5 @@
+Upstream-Status:Inappropriate [debian patch]
+
 Subject: Always use PERLRUNINST when building perl modules.
 Bug-Debian: http://bugs.debian.org/357264
 Bug: http://rt.cpan.org/Public/Bug/Display.html?id=17224
diff --git a/meta/recipes-devtools/perl/perl-5.12.2/debian/instmodsh_doc.diff b/meta/recipes-devtools/perl/perl-5.12.2/debian/instmodsh_doc.diff
index 5670863..cfc57fa 100644
--- a/meta/recipes-devtools/perl/perl-5.12.2/debian/instmodsh_doc.diff
+++ b/meta/recipes-devtools/perl/perl-5.12.2/debian/instmodsh_doc.diff
@@ -1,3 +1,5 @@
+Upstream-Status:Inappropriate [debian patch]
+
 Subject: Debian policy doesn't install .packlist files for core or vendor.
 
 
diff --git a/meta/recipes-devtools/perl/perl-5.12.2/debian/ld_run_path.diff b/meta/recipes-devtools/perl/perl-5.12.2/debian/ld_run_path.diff
index ffcfab9..ced1e8f 100644
--- a/meta/recipes-devtools/perl/perl-5.12.2/debian/ld_run_path.diff
+++ b/meta/recipes-devtools/perl/perl-5.12.2/debian/ld_run_path.diff
@@ -1,3 +1,5 @@
+Upstream-Status:Inappropriate [debian patch]
+
 Subject: Remove standard libs from LD_RUN_PATH as per Debian policy.
 
 
diff --git a/meta/recipes-devtools/perl/perl-5.12.2/debian/libnet_config_path.diff b/meta/recipes-devtools/perl/perl-5.12.2/debian/libnet_config_path.diff
index 41bca97..ef0f369 100644
--- a/meta/recipes-devtools/perl/perl-5.12.2/debian/libnet_config_path.diff
+++ b/meta/recipes-devtools/perl/perl-5.12.2/debian/libnet_config_path.diff
@@ -1,3 +1,5 @@
+Upstream-Status:Inappropriate [debian patch]
+
 Subject: Set location of libnet.cfg to /etc/perl/Net as /usr may not be writable.
 
 
diff --git a/meta/recipes-devtools/perl/perl-5.12.2/debian/m68k_thread_stress.diff b/meta/recipes-devtools/perl/perl-5.12.2/debian/m68k_thread_stress.diff
index cda6089..d27a677 100644
--- a/meta/recipes-devtools/perl/perl-5.12.2/debian/m68k_thread_stress.diff
+++ b/meta/recipes-devtools/perl/perl-5.12.2/debian/m68k_thread_stress.diff
@@ -1,3 +1,5 @@
+Upstream-Status:Inappropriate [debian patch]
+
 Subject: Disable some threads tests on m68k for now due to missing TLS.
 Closes: #495826, #517938
 
diff --git a/meta/recipes-devtools/perl/perl-5.12.2/debian/mod_paths.diff b/meta/recipes-devtools/perl/perl-5.12.2/debian/mod_paths.diff
index bfa4721..96fe4df 100644
--- a/meta/recipes-devtools/perl/perl-5.12.2/debian/mod_paths.diff
+++ b/meta/recipes-devtools/perl/perl-5.12.2/debian/mod_paths.diff
@@ -1,3 +1,5 @@
+Upstream-Status:Inappropriate [debian patch]
+
 Subject: Tweak @INC ordering for Debian
 
 Our order is:
diff --git a/meta/recipes-devtools/perl/perl-5.12.2/debian/module_build_man_extensions.diff b/meta/recipes-devtools/perl/perl-5.12.2/debian/module_build_man_extensions.diff
index 320a90d..bc7fd9e 100644
--- a/meta/recipes-devtools/perl/perl-5.12.2/debian/module_build_man_extensions.diff
+++ b/meta/recipes-devtools/perl/perl-5.12.2/debian/module_build_man_extensions.diff
@@ -1,3 +1,5 @@
+Upstream-Status:Inappropriate [debian patch]
+
 Subject: Adjust Module::Build manual page extensions for the Debian Perl policy
 Bug-Debian: http://bugs.debian.org/479460
 
diff --git a/meta/recipes-devtools/perl/perl-5.12.2/debian/perlivp.diff b/meta/recipes-devtools/perl/perl-5.12.2/debian/perlivp.diff
index c63c1e8..ebe942c 100644
--- a/meta/recipes-devtools/perl/perl-5.12.2/debian/perlivp.diff
+++ b/meta/recipes-devtools/perl/perl-5.12.2/debian/perlivp.diff
@@ -1,3 +1,5 @@
+Upstream-Status:Inappropriate [debian patch]
+
 From: Niko Tyni <ntyni@debian.org>
 Subject: Make perlivp skip include directories in /usr/local
 Closes: 510895
diff --git a/meta/recipes-devtools/perl/perl-5.12.2/debian/prune_libs.diff b/meta/recipes-devtools/perl/perl-5.12.2/debian/prune_libs.diff
index 4d73717..0f49895 100644
--- a/meta/recipes-devtools/perl/perl-5.12.2/debian/prune_libs.diff
+++ b/meta/recipes-devtools/perl/perl-5.12.2/debian/prune_libs.diff
@@ -1,3 +1,5 @@
+Upstream-Status:Inappropriate [debian patch]
+
 Subject: Prune the list of libraries wanted to what we actually need.
 Bug-Debian: http://bugs.debian.org/128355
 
diff --git a/meta/recipes-devtools/perl/perl-5.12.2/debian/squelch-locale-warnings.diff b/meta/recipes-devtools/perl/perl-5.12.2/debian/squelch-locale-warnings.diff
index 091dec4..68c1a35 100644
--- a/meta/recipes-devtools/perl/perl-5.12.2/debian/squelch-locale-warnings.diff
+++ b/meta/recipes-devtools/perl/perl-5.12.2/debian/squelch-locale-warnings.diff
@@ -1,3 +1,5 @@
+Upstream-Status:Inappropriate [debian patch]
+
 From: Niko Tyni <ntyni@debian.org>
 Subject: Squelch locale warnings in Debian package maintainer scripts
 Bug-Debian: http://bugs.debian.org/508764
diff --git a/meta/recipes-devtools/perl/perl-5.12.2/generate-sh.patch b/meta/recipes-devtools/perl/perl-5.12.2/generate-sh.patch
index ceb7419..47f91c5 100644
--- a/meta/recipes-devtools/perl/perl-5.12.2/generate-sh.patch
+++ b/meta/recipes-devtools/perl/perl-5.12.2/generate-sh.patch
@@ -1,3 +1,5 @@
+Upstream-Status:Inappropriate [embedded specific]
+
 Use the ld flags from the supplied configuration file. For sh we need the
 flags that specify to build PIC code so that the shared libraries work.
 
diff --git a/meta/recipes-devtools/perl/perl-5.12.2/installperl.patch b/meta/recipes-devtools/perl/perl-5.12.2/installperl.patch
index d20961c..276eb3d 100644
--- a/meta/recipes-devtools/perl/perl-5.12.2/installperl.patch
+++ b/meta/recipes-devtools/perl/perl-5.12.2/installperl.patch
@@ -1,3 +1,5 @@
+Upstream-Status:Inappropriate [embedded specific]
+
 Index: perl-5.12.2/installperl
 ===================================================================
 --- perl-5.12.2.orig/installperl
diff --git a/meta/recipes-devtools/perl/files/letgcc-find-errno.patch b/meta/recipes-devtools/perl/perl-5.12.2/letgcc-find-errno.patch
similarity index 96%
rename from meta/recipes-devtools/perl/files/letgcc-find-errno.patch
rename to meta/recipes-devtools/perl/perl-5.12.2/letgcc-find-errno.patch
index 47f972d..268cb53 100644
--- a/meta/recipes-devtools/perl/files/letgcc-find-errno.patch
+++ b/meta/recipes-devtools/perl/perl-5.12.2/letgcc-find-errno.patch
@@ -1,3 +1,5 @@
+Upstream-Status:Inappropriate [embedded specific]
+
 This removes all the logic that perl uses to locate an appropriate
 errno.h for the target. Instead we simple create a file that does
 
diff --git a/meta/recipes-devtools/perl/perl-5.12.2/native-nopacklist.patch b/meta/recipes-devtools/perl/perl-5.12.2/native-nopacklist.patch
index 92b02d4..8d5b819 100644
--- a/meta/recipes-devtools/perl/perl-5.12.2/native-nopacklist.patch
+++ b/meta/recipes-devtools/perl/perl-5.12.2/native-nopacklist.patch
@@ -1,3 +1,5 @@
+Upstream-Status:Inappropriate [debian patch]
+
 Part of 52_debian_extutils_hacks.patch just to exclude the installation of .packlist files
 
 Index: perl-5.12.2/cpan/ExtUtils-MakeMaker/lib/ExtUtils/MM_Unix.pm
diff --git a/meta/recipes-devtools/perl/perl-5.12.2/native-perlinc.patch b/meta/recipes-devtools/perl/perl-5.12.2/native-perlinc.patch
index bf145ba..ffaf326 100644
--- a/meta/recipes-devtools/perl/perl-5.12.2/native-perlinc.patch
+++ b/meta/recipes-devtools/perl/perl-5.12.2/native-perlinc.patch
@@ -1,3 +1,5 @@
+Upstream-Status:Inappropriate [embedded specific]
+
 Index: perl-5.8.8/lib/ExtUtils/MM_Unix.pm
 ===================================================================
 --- perl-5.12.2.orig/cpan/ExtUtils-MakeMaker/lib/ExtUtils/MM_Unix.pm	2008-10-31 22:01:35.000000000 +0000
diff --git a/meta/recipes-devtools/perl/perl-5.12.2/native-ssp.patch b/meta/recipes-devtools/perl/perl-5.12.2/native-ssp.patch
index 1c825f5..e1e6f08 100644
--- a/meta/recipes-devtools/perl/perl-5.12.2/native-ssp.patch
+++ b/meta/recipes-devtools/perl/perl-5.12.2/native-ssp.patch
@@ -1,3 +1,5 @@
+Upstream-Status:Inappropriate [embedded specific]
+
 Fix for compiling with ssp enabled gcc:
 See http://bugs.openembedded.net/show_bug.cgi?id=1980
 
diff --git a/meta/recipes-devtools/perl/perl-5.12.2/parallel_build_fix_1.patch b/meta/recipes-devtools/perl/perl-5.12.2/parallel_build_fix_1.patch
index 63e6410..d5a6295 100644
--- a/meta/recipes-devtools/perl/perl-5.12.2/parallel_build_fix_1.patch
+++ b/meta/recipes-devtools/perl/perl-5.12.2/parallel_build_fix_1.patch
@@ -1,3 +1,5 @@
+Upstream-Status:Inappropriate [Backport]
+
 Imported from perl git tree by Nitin A Kamble <nitin.a.kamble@intel.com>
 2011-02-23
 
diff --git a/meta/recipes-devtools/perl/perl-5.12.2/parallel_build_fix_2.patch b/meta/recipes-devtools/perl/perl-5.12.2/parallel_build_fix_2.patch
index 6c536dd..a3432ab 100644
--- a/meta/recipes-devtools/perl/perl-5.12.2/parallel_build_fix_2.patch
+++ b/meta/recipes-devtools/perl/perl-5.12.2/parallel_build_fix_2.patch
@@ -1,3 +1,5 @@
+Upstream-Status:Inappropriate [Backport]
+
 Imported from perl git tree by Nitin A Kamble <nitin.a.kamble@intel.com>
 2011-02-23
 
diff --git a/meta/recipes-devtools/perl/perl-5.12.2/parallel_build_fix_3.patch b/meta/recipes-devtools/perl/perl-5.12.2/parallel_build_fix_3.patch
index a74a45d..26af1f1 100644
--- a/meta/recipes-devtools/perl/perl-5.12.2/parallel_build_fix_3.patch
+++ b/meta/recipes-devtools/perl/perl-5.12.2/parallel_build_fix_3.patch
@@ -1,3 +1,5 @@
+Upstream-Status:Inappropriate [Backport]
+
 Imported from perl git tree by Nitin A Kamble <nitin.a.kamble@intel.com>
 2011-02-23
 
diff --git a/meta/recipes-devtools/perl/perl-5.12.2/parallel_build_fix_4.patch b/meta/recipes-devtools/perl/perl-5.12.2/parallel_build_fix_4.patch
index 1a047bc..98bf074 100644
--- a/meta/recipes-devtools/perl/perl-5.12.2/parallel_build_fix_4.patch
+++ b/meta/recipes-devtools/perl/perl-5.12.2/parallel_build_fix_4.patch
@@ -1,3 +1,5 @@
+Upstream-Status:Inappropriate [Backport]
+
 commit 43c0c913165d6abe1bc0cb45a784eb1c32c3700b
 Author: Nicholas Clark <nick@ccl4.org>
 Date:   Mon Feb 14 09:06:42 2011 +0000
diff --git a/meta/recipes-devtools/perl/perl-5.12.2/parallel_build_fix_5.patch b/meta/recipes-devtools/perl/perl-5.12.2/parallel_build_fix_5.patch
index abc1922..70f7104 100644
--- a/meta/recipes-devtools/perl/perl-5.12.2/parallel_build_fix_5.patch
+++ b/meta/recipes-devtools/perl/perl-5.12.2/parallel_build_fix_5.patch
@@ -1,3 +1,5 @@
+Upstream-Status:Inappropriate [Backport]
+
 Rebased by Nitin A Kamble <nitin.a.kamble@intel.com> on 3/11/2011
 
 commit 5e4c4c91bd52a48de59520d5e9b4e3478e49c613
diff --git a/meta/recipes-devtools/perl/perl-5.12.2/parallel_build_fix_6.patch b/meta/recipes-devtools/perl/perl-5.12.2/parallel_build_fix_6.patch
index 0520c30..cacf9fa 100644
--- a/meta/recipes-devtools/perl/perl-5.12.2/parallel_build_fix_6.patch
+++ b/meta/recipes-devtools/perl/perl-5.12.2/parallel_build_fix_6.patch
@@ -1,3 +1,5 @@
+Upstream-Status:Inappropriate [Backport]
+
 Rebased by Nitin A Kamble <nitin.a.kamble@intel.com> on 3/11/2011
 
 commit 7353f64c5bca6e7102582a1e0017c850930249c3
diff --git a/meta/recipes-devtools/perl/perl-5.12.2/perl-configpm-switch.patch b/meta/recipes-devtools/perl/perl-5.12.2/perl-configpm-switch.patch
index ac519a0..9e9f342 100644
--- a/meta/recipes-devtools/perl/perl-5.12.2/perl-configpm-switch.patch
+++ b/meta/recipes-devtools/perl/perl-5.12.2/perl-configpm-switch.patch
@@ -1,3 +1,5 @@
+Upstream-Status:Inappropriate [native]
+
 This patch is used for perl-native only. It enables the switching of
 configuration files between Config_heavy.pl and
 Config_heavy-target.pl by setting the environment variables
diff --git a/meta/recipes-devtools/perl/perl-5.12.2/perl-dynloader.patch b/meta/recipes-devtools/perl/perl-5.12.2/perl-dynloader.patch
index 061a823..21d8bb9 100644
--- a/meta/recipes-devtools/perl/perl-5.12.2/perl-dynloader.patch
+++ b/meta/recipes-devtools/perl/perl-5.12.2/perl-dynloader.patch
@@ -1,11 +1,15 @@
+Upstream-Status:Inappropriate [embedded specific]
+
 Allow the location that .so files are searched for for dynamic
 loading to be changed via an environment variable. This is to allow
 us to load .so's from the host system while building for the target
 system.
 
+Update by Nitin A Kamble <nitin.a.kamble@intel.com> 2011/04/21
+
 --- perl-5.12.2/dist/XSLoader/XSLoader_pm.PL	2007/04/20 09:03:08	1.1
 +++ perl-5.12.2/dist/XSLoader/XSLoader_pm.PL	2007/04/20 09:03:08
-@@ -65,6 +65,15 @@
+@@ -65,6 +65,19 @@
  print OUT <<'EOT';
      my $modpname = join('/',@modparts);
      my $modlibname = (caller())[1];
@@ -15,7 +19,11 @@ system.
 +    {
 +        my $hostlib = $ENV{PERLHOSTLIB};
 +        print STDERR "*** Module name IN: $modlibname\n";
-+        $modlibname =~ s#(?<!/)(\.\./)*lib/#$hostlib#g;
++        ($p1, $p2, $p3, $p4, $p5) = $modlibname =~ m/(^(.*lib\/)?)((perl\/[0-9\.]*\/)?)(.*)$/;
++        print STDERR "*** p1: $p1  p3: $p3  p5: $p5\n";
++        if ( $p1 ne "" ) {
++            $modlibname = $hostlib.$p5;
++        }
 +        print STDERR "*** Module name OUT: $modlibname\n";
 +    }
      my $c = @modparts;
diff --git a/meta/recipes-devtools/perl/perl-5.12.2/perl-enable-gdbm.patch b/meta/recipes-devtools/perl/perl-5.12.2/perl-enable-gdbm.patch
index c0874c3..aa83fca 100644
--- a/meta/recipes-devtools/perl/perl-5.12.2/perl-enable-gdbm.patch
+++ b/meta/recipes-devtools/perl/perl-5.12.2/perl-enable-gdbm.patch
@@ -1,3 +1,5 @@
+Upstream-Status:Inappropriate [embedded specific]
+
 Index: perl-5.8.8/config_h.SH
 ===================================================================
 --- perl-5.8.8.orig/config_h.SH	2005-11-01 02:13:05.000000000 +0800
diff --git a/meta/recipes-devtools/perl/perl-5.12.2/perl-moreconfig.patch b/meta/recipes-devtools/perl/perl-5.12.2/perl-moreconfig.patch
index 590c725..59ce85a 100644
--- a/meta/recipes-devtools/perl/perl-5.12.2/perl-moreconfig.patch
+++ b/meta/recipes-devtools/perl/perl-5.12.2/perl-moreconfig.patch
@@ -1,3 +1,5 @@
+Upstream-Status:Inappropriate [embedded specific]
+
 We need ld in the fake config library, but it's not included by default. So
 expand the number of items included. While this works it indicates that the
 rest of the config items are not being picked up and/or are being picked up
diff --git a/meta/recipes-devtools/perl/perl_5.12.2.bb b/meta/recipes-devtools/perl/perl_5.12.2.bb
index 184e1e7..9ce8156 100644
--- a/meta/recipes-devtools/perl/perl_5.12.2.bb
+++ b/meta/recipes-devtools/perl/perl_5.12.2.bb
@@ -8,7 +8,7 @@ PRIORITY = "optional"
 # We need gnugrep (for -I)
 DEPENDS = "virtual/db perl-native-${PV} grep-native"
 DEPENDS += "gdbm zlib"
-PR = "r3"
+PR = "r4"
 
 # 5.10.1 has Module::Build built-in
 PROVIDES += "libmodule-build-perl"
-- 
1.7.1



