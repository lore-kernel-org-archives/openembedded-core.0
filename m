Return-Path: <alejandro.hernandez@linux.intel.com>
Received: from mga14.intel.com (mga14.intel.com [192.55.52.115])
	by mail.openembedded.org (Postfix) with ESMTP id 911AC6FF7D
	for <openembedded-core@lists.openembedded.org>;
	Wed, 20 Jan 2016 15:56:06 +0000 (UTC)
Received: from orsmga001.jf.intel.com ([10.7.209.18])
	by fmsmga103.fm.intel.com with ESMTP; 20 Jan 2016 07:56:07 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.22,321,1449561600"; d="scan'208";a="864752654"
Received: from yctb02.ostc.intel.com (HELO yctb02.otcr.intel.com)
	([10.23.219.47])
	by orsmga001.jf.intel.com with ESMTP; 20 Jan 2016 07:56:07 -0800
From: Alejandro Hernandez <alejandro.hernandez@linux.intel.com>
To: openembedded-core@lists.openembedded.org
Date: Wed, 20 Jan 2016 15:56:57 +0000
Message-Id: <36695bbf21d61c14fb643558421eeff4c7df9c5a.1453305308.git.alejandro.hernandez@linux.intel.com>
X-Mailer: git-send-email 1.8.4.5
In-Reply-To: <cover.1453305308.git.alejandro.hernandez@linux.intel.com>
References: <cover.1453305308.git.alejandro.hernandez@linux.intel.com>
Subject: [PATCH 1/1] perl: Upgrade to 5.22.1
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
X-List-Received-Date: Wed, 20 Jan 2016 15:56:08 -0000

Rebased:
- Makefile.SH.patch

Signed-off-by: Alejandro Hernandez <alejandro.hernandez@linux.intel.com>
---
 ...perl-native_5.22.0.bb => perl-native_5.22.1.bb} |  4 +-
 ...depends_5.22.0.inc => perl-rdepends_5.22.1.inc} |  0
 meta/recipes-devtools/perl/perl/Makefile.SH.patch  | 63 +++++++++++-----------
 meta/recipes-devtools/perl/perl/config.sh          | 50 ++++++++---------
 .../perl/{perl_5.22.0.bb => perl_5.22.1.bb}        |  4 +-
 5 files changed, 61 insertions(+), 60 deletions(-)
 rename meta/recipes-devtools/perl/{perl-native_5.22.0.bb => perl-native_5.22.1.bb} (96%)
 rename meta/recipes-devtools/perl/{perl-rdepends_5.22.0.inc => perl-rdepends_5.22.1.inc} (100%)
 rename meta/recipes-devtools/perl/{perl_5.22.0.bb => perl_5.22.1.bb} (99%)

diff --git a/meta/recipes-devtools/perl/perl-native_5.22.0.bb b/meta/recipes-devtools/perl/perl-native_5.22.1.bb
similarity index 96%
rename from meta/recipes-devtools/perl/perl-native_5.22.0.bb
rename to meta/recipes-devtools/perl/perl-native_5.22.1.bb
index b4dda31..9ffb248 100644
--- a/meta/recipes-devtools/perl/perl-native_5.22.0.bb
+++ b/meta/recipes-devtools/perl/perl-native_5.22.1.bb
@@ -11,8 +11,8 @@ SRC_URI += "\
            file://perl-PathTools-don-t-filter-out-blib-from-INC.patch \
           "
 
-SRC_URI[md5sum] = "ff0f09b17de426eff323426cb140ee79"
-SRC_URI[sha256sum] = "be83ead0c5c26cbbe626fa4bac1a4beabe23a9eebc15d35ba49ccde11878e196"
+SRC_URI[md5sum] = "6671e4829cbaf9cecafa9a84f141b0a3"
+SRC_URI[sha256sum] = "9e87317d693ce828095204be0d09af8d60b8785533fadea1a82b6f0e071e5c79"
 
 inherit native
 
diff --git a/meta/recipes-devtools/perl/perl-rdepends_5.22.0.inc b/meta/recipes-devtools/perl/perl-rdepends_5.22.1.inc
similarity index 100%
rename from meta/recipes-devtools/perl/perl-rdepends_5.22.0.inc
rename to meta/recipes-devtools/perl/perl-rdepends_5.22.1.inc
diff --git a/meta/recipes-devtools/perl/perl/Makefile.SH.patch b/meta/recipes-devtools/perl/perl/Makefile.SH.patch
index 3de2331..edf49d6 100644
--- a/meta/recipes-devtools/perl/perl/Makefile.SH.patch
+++ b/meta/recipes-devtools/perl/perl/Makefile.SH.patch
@@ -5,10 +5,10 @@ Signed-off-by: Hongxu Jia <hongxu.jia@windriver.com>
  Makefile.SH |  145 +++++++++++++++++++++++++++--------------------------------
  1 file changed, 67 insertions(+), 78 deletions(-)
 
-diff --git a/Makefile.SH b/Makefile.SH
-index 034d812..67e08fd 100755
---- a/Makefile.SH
-+++ b/Makefile.SH
+Index: perl-5.22.1/Makefile.SH
+===================================================================
+--- perl-5.22.1.orig/Makefile.SH
++++ perl-5.22.1/Makefile.SH
 @@ -39,10 +39,10 @@ case "$useshrplib" in
  true)
  	# Prefix all runs of 'miniperl' and 'perl' with
@@ -67,6 +67,10 @@ index 034d812..67e08fd 100755
 -all: $(FIRSTMAKEFILE) $(MINIPERL_EXE) $(generated_pods) $(private) $(unidatafiles) $(public) $(dynamic_ext) $(nonxs_ext) extras.make $(MANIFEST_SRT)
 -	@echo " ";
 -	@echo "	Everything is up to date. Type '$(MAKE) test' to run test suite."
+-
+-$(MANIFEST_SRT):	MANIFEST $(PERL_EXE)
+-	@$(RUN_PERL) Porting/manisort -q || (echo "WARNING: re-sorting MANIFEST"; \
+-	    $(RUN_PERL) Porting/manisort -q -o MANIFEST; sh -c true)
 +#all: $(FIRSTMAKEFILE) $(MINIPERL_EXE) $(generated_pods) $(private) $(unidatafiles) $(public) $(dynamic_ext) $(nonxs_ext) extras.make $(MANIFEST_SRT)
 +#	@echo " ";
 +#	@echo "	Everything is up to date. Type '$(MAKE) test' to run test suite."
@@ -76,10 +80,7 @@ index 034d812..67e08fd 100755
 +more: $(generated_pods) $(private) $(public)
 +
 +more2: $(dynamic_ext)
- 
--$(MANIFEST_SRT):	MANIFEST $(PERL_EXE)
--	@$(RUN_PERL) Porting/manisort -q || (echo "WARNING: re-sorting MANIFEST"; \
--	    $(RUN_PERL) Porting/manisort -q -o MANIFEST; sh -c true)
++
 +more3: $(nonxs_ext)
 +
 +more4: extras.make $(MANIFEST_SRT)
@@ -144,7 +145,7 @@ index 034d812..67e08fd 100755
  	./$(MINIPERLEXP) makedef.pl PLATFORM=os2 -DPERL_DLL=$(PERL_DLL) CC_FLAGS="$(OPTIMIZE)" > perl5.def
  
  !NO!SUBS!
-@@ -829,7 +829,7 @@ $(LIBPERL): $& $(obj) $(DYNALOADER) $(LIBPERLEXPORT)
+@@ -829,7 +829,7 @@ $(LIBPERL): $& $(obj) $(DYNALOADER) $(LI
  	true)
  		$spitshell >>$Makefile <<'!NO!SUBS!'
  	rm -f $@
@@ -175,7 +176,7 @@ index 034d812..67e08fd 100755
  	$(MINIPERL) -f write_buildcustomize.pl    
  !NO!SUBS!
  		;;
-@@ -907,7 +911,9 @@ lib/buildcustomize.pl: $& $(mini_obj) write_buildcustomize.pl
+@@ -907,7 +911,9 @@ lib/buildcustomize.pl: $& $(mini_obj) wr
  	-@rm -f miniperl.xok
  	$(CC) $(CLDFLAGS) $(NAMESPACEFLAGS) -o $(MINIPERL_EXE) \
  	    $(mini_obj) $(libs)
@@ -186,7 +187,7 @@ index 034d812..67e08fd 100755
  	$(MINIPERL) -f write_buildcustomize.pl
  !NO!SUBS!
  		;;
-@@ -918,7 +924,9 @@ lib/buildcustomize.pl: \$& \$(mini_obj) write_buildcustomize.pl
+@@ -918,7 +924,9 @@ lib/buildcustomize.pl: \$& \$(mini_obj)
  	-@rm -f miniperl.xok
  	-@rm \$(MINIPERL_EXE)
  	\$(LNS) \$(HOST_PERL) \$(MINIPERL_EXE)
@@ -197,7 +198,7 @@ index 034d812..67e08fd 100755
  	\$(MINIPERL) -f write_buildcustomize.pl 'osname' "$osname"
  !GROK!THIS!
  		else
-@@ -927,7 +935,9 @@ lib/buildcustomize.pl: $& $(mini_obj) write_buildcustomize.pl
+@@ -927,7 +935,9 @@ lib/buildcustomize.pl: $& $(mini_obj) wr
  	-@rm -f miniperl.xok
  	$(CC) $(CLDFLAGS) -o $(MINIPERL_EXE) \
  	    $(mini_obj) $(libs)
@@ -217,7 +218,7 @@ index 034d812..67e08fd 100755
  	-@for f in Makefile.PL PPPort_pm.PL PPPort_xs.PL ppport_h.PL; do \
  	(cd ext/Devel-PPPort && `pwd`/run.sh ../../$(MINIPERL_EXE) -I../../lib \$\$f); \
  	done
-@@ -981,7 +991,7 @@ makeppport: \$(MINIPERL_EXE) \$(CONFIGPM)
+@@ -981,7 +991,7 @@ makeppport: \$(MINIPERL_EXE) \$(CONFIGPM
  *)
  $spitshell >>$Makefile <<'!NO!SUBS!'
  .PHONY: makeppport
@@ -246,7 +247,7 @@ index 034d812..67e08fd 100755
  	$(MINIPERL) lib/unicore/mktables -C lib/unicore -P pod -maketest -makelist -p
  #	Commented out so always runs, mktables looks at far more files than we
  #	can in this makefile to decide if needs to run or not
-@@ -1009,12 +1019,12 @@ uni.data: $(MINIPERL_EXE) $(CONFIGPM) lib/unicore/mktables $(nonxs_ext)
+@@ -1009,12 +1019,12 @@ uni.data: $(MINIPERL_EXE) $(CONFIGPM) li
  # $(PERL_EXE) and ext because pod_lib.pl needs Digest::MD5
  # But also this ensures that all extensions are built before we try to scan
  # them, which picks up Devel::PPPort's documentation.
@@ -262,9 +263,9 @@ index 034d812..67e08fd 100755
  	$(MINIPERL) autodoc.pl
  
  pod/perlmodlib.pod: $(MINIPERL_EXE) pod/perlmodlib.PL MANIFEST
-@@ -1024,7 +1034,7 @@ pod/perl5220delta.pod: pod/perldelta.pod
- 	$(RMS) pod/perl5220delta.pod
- 	$(LNS) perldelta.pod pod/perl5220delta.pod
+@@ -1024,7 +1034,7 @@ pod/perl5221delta.pod: pod/perldelta.pod
+ 	$(RMS) pod/perl5221delta.pod
+ 	$(LNS) perldelta.pod pod/perl5221delta.pod
  
 -extra.pods: $(MINIPERL_EXE)
 +extra.pods:
@@ -300,11 +301,11 @@ index 034d812..67e08fd 100755
  install.perl:	$(INSTALL_DEPENDENCE) installperl
 -	$(RUN_PERL) installperl --destdir=$(DESTDIR) $(INSTALLFLAGS) $(STRIPFLAGS)
 -	-@test ! -s extras.lst || PATH="`pwd`:\${PATH}" PERL5LIB="`pwd`/lib" \$(RUN_PERL) -Ilib -MCPAN -e '@ARGV&&install(@ARGV)' `cat extras.lst`
-+	./hostperl -Ifake_config_library -Ilib -MConfig installperl --destdir=$(DESTDIR) $(INSTALLFLAGS) $(STRIPFLAGS)
- 
+-
 -install.man:	all installman
 -	$(RUN_PERL) installman --destdir=$(DESTDIR) $(INSTALLFLAGS)
--
++	./hostperl -Ifake_config_library -Ilib -MConfig installperl --destdir=$(DESTDIR) $(INSTALLFLAGS) $(STRIPFLAGS)
+ 
 -# XXX Experimental. Hardwired values, but useful for testing.
 -# Eventually Configure could ask for some of these values.
 -install.html: all installhtml
@@ -337,7 +338,7 @@ index 034d812..67e08fd 100755
  	$(MINIPERL) make_ext.pl $@ $(MAKE_EXT_ARGS) MAKE="$(MAKE)" LIBPERL_A=$(LIBPERL) LINKTYPE=static $(STATIC_LDFLAGS)
  
  n_dummy $(nonxs_ext):	$(MINIPERL_EXE) lib/buildcustomize.pl preplibrary FORCE
-@@ -1405,14 +1394,14 @@ test_prep_pre: preplibrary utilities $(nonxs_ext)
+@@ -1405,14 +1394,14 @@ test_prep_pre: preplibrary utilities $(n
  
  case "$targethost" in
  '') $spitshell >>$Makefile <<'!NO!SUBS!'
@@ -354,7 +355,7 @@ index 034d812..67e08fd 100755
  	\$(dynamic_ext) \$(TEST_PERL_DLL) runtests \
  	\$(generated_pods)
  	$to libperl.*
-@@ -1465,7 +1454,7 @@ test_prep test-prep: test_prep_pre \$(MINIPERL_EXE) \$(unidatafiles) \$(PERL_EXE
+@@ -1465,7 +1454,7 @@ test_prep test-prep: test_prep_pre \$(MI
  esac
  
  $spitshell >>$Makefile <<'!NO!SUBS!'
@@ -363,12 +364,12 @@ index 034d812..67e08fd 100755
  	$(MINIPERL) make_ext.pl $(dynamic_ext_re) MAKE="$(MAKE)" LIBPERL_A=$(LIBPERL) LINKTYPE=dynamic
  	cd t && (rm -f $(PERL_EXE); $(LNS) ../$(PERL_EXE) $(PERL_EXE))
  !NO!SUBS!
-@@ -1516,7 +1505,7 @@ $spitshell >>$Makefile <<'!NO!SUBS!'
- 
- # Can't depend on lib/Config.pm because that might be where miniperl
- # is crashing.
--minitest: $(MINIPERL_EXE)
-+minitest:
- 	-@test -f lib/Config.pm || $(MAKE) lib/Config.pm $(unidatafiles)
- 	@echo " "
- 	@echo "You may see some irrelevant test failures if you have been unable"
+@@ -1526,7 +1515,7 @@ minitest_prep:
+ 
+ MINITEST_TESTS = base/*.t comp/*.t cmd/*.t run/*.t io/*.t re/*.t opbasic/*.t op/*.t uni/*.t perf/*.t
+ 
+-minitest: $(MINIPERL_EXE) minitest_prep
++minitest: minitest_prep
+ 	- cd t && $(RUN_PERL) TEST $(MINITEST_TESTS) </dev/tty
+ 
+ minitest-notty minitest_notty: $(MINIPERL_EXE) minitest_prep
diff --git a/meta/recipes-devtools/perl/perl/config.sh b/meta/recipes-devtools/perl/perl/config.sh
index 9fb5042..59e016e 100644
--- a/meta/recipes-devtools/perl/perl/config.sh
+++ b/meta/recipes-devtools/perl/perl/config.sh
@@ -14,7 +14,7 @@
 
 : Configure command line arguments.
 config_arg0='Configure'
-config_args='-des -Doptimize=-O2 -Dmyhostname=localhost -Dperladmin=root@localhost -Dcc=gcc -Dcf_by=Open Embedded -Dinstallprefix=@EXECPREFIX@ -Dprefix=@EXECPREFIX@ -Dvendorprefix=@EXECPREFIX@ -Dsiteprefix=@EXECPREFIX@ -Dotherlibdirs=@LIBDIR@/perl/5.22.0 -Duseshrplib -Dusethreads -Duseithreads -Duselargefiles -Ud_dosuid -Dd_semctl_semun -Ui_db -Ui_ndbm -Ui_gdbm -Di_shadow -Di_syslog -Dman3ext=3pm -Duseperlio -Dinstallusrbinperl -Ubincompat5005 -Uversiononly -Dpager=@USRBIN@/less -isr'
+config_args='-des -Doptimize=-O2 -Dmyhostname=localhost -Dperladmin=root@localhost -Dcc=gcc -Dcf_by=Open Embedded -Dinstallprefix=@EXECPREFIX@ -Dprefix=@EXECPREFIX@ -Dvendorprefix=@EXECPREFIX@ -Dsiteprefix=@EXECPREFIX@ -Dotherlibdirs=@LIBDIR@/perl/5.22.1 -Duseshrplib -Dusethreads -Duseithreads -Duselargefiles -Ud_dosuid -Dd_semctl_semun -Ui_db -Ui_ndbm -Ui_gdbm -Di_shadow -Di_syslog -Dman3ext=3pm -Duseperlio -Dinstallusrbinperl -Ubincompat5005 -Uversiononly -Dpager=@USRBIN@/less -isr'
 config_argc=28
 config_arg1='-des'
 config_arg2='-Doptimize=-O2'
@@ -26,7 +26,7 @@ config_arg7='-Dinstallprefix=@EXECPREFIX@'
 config_arg8='-Dprefix=@EXECPREFIX@'
 config_arg9='-Dvendorprefix=@EXECPREFIX@'
 config_arg10='-Dsiteprefix=@EXECPREFIX@'
-config_arg11='-Dotherlibdirs=@LIBDIR@/perl/5.22.0'
+config_arg11='-Dotherlibdirs=@LIBDIR@/perl/5.22.1'
 config_arg12='-Duseshrplib'
 config_arg13='-Dusethreads'
 config_arg14='-Duseithreads'
@@ -66,11 +66,11 @@ aphostname=''
 api_revision='5'
 api_subversion='0'
 api_version='22'
-api_versionstring='5.22.0'
+api_versionstring='5.22.1'
 ar='ar'
-archlib='@LIBDIR@/perl/5.22.0/@ARCH@-thread-multi'
-archlibexp='@STAGINGDIR@@LIBDIR@/perl/5.22.0/@ARCH@-thread-multi'
-archlib_exp='@LIBDIR@/perl/5.22.0/@ARCH@-thread-multi'
+archlib='@LIBDIR@/perl/5.22.1/@ARCH@-thread-multi'
+archlibexp='@STAGINGDIR@@LIBDIR@/perl/5.22.1/@ARCH@-thread-multi'
+archlib_exp='@LIBDIR@/perl/5.22.1/@ARCH@-thread-multi'
 archname64=''
 archname='@ARCH@-thread-multi'
 archobjs=''
@@ -88,7 +88,7 @@ castflags='0'
 cat='cat'
 cc='gcc'
 cccdlflags='-fPIC'
-ccdlflags='-Wl,-E -Wl,-rpath,@LIBDIR@/perl/5.22.0/@ARCH@-thread-multi/CORE'
+ccdlflags='-Wl,-E -Wl,-rpath,@LIBDIR@/perl/5.22.1/@ARCH@-thread-multi/CORE'
 ccflags='-D_REENTRANT -D_GNU_SOURCE -fwrapv -fno-strict-aliasing -pipe -D_LARGEFILE_SOURCE -D_FILE_OFFSET_BITS=64 -D_FORTIFY_SOURCE=2'
 ccflags_uselargefiles='-D_LARGEFILE_SOURCE -D_FILE_OFFSET_BITS=64'
 ccname='gcc'
@@ -834,7 +834,7 @@ inc_version_list_init='0'
 incpath=''
 inews=''
 initialinstalllocation='@USRBIN@'
-installarchlib='@LIBDIR@/perl/5.22.0/@ARCH@-thread-multi'
+installarchlib='@LIBDIR@/perl/5.22.1/@ARCH@-thread-multi'
 installbin='@USRBIN@'
 installhtml1dir=''
 installhtml3dir=''
@@ -842,23 +842,23 @@ installman1dir=''
 installman3dir=''
 installprefix='@EXECPREFIX@'
 installprefixexp='@EXECPREFIX@'
-installprivlib='@LIBDIR@/perl/5.22.0'
+installprivlib='@LIBDIR@/perl/5.22.1'
 installscript='@USRBIN@'
-installsitearch='@LIBDIR@/perl/site_perl/5.22.0/@ARCH@-thread-multi'
+installsitearch='@LIBDIR@/perl/site_perl/5.22.1/@ARCH@-thread-multi'
 installsitebin='@USRBIN@'
 installsitehtml1dir=''
 installsitehtml3dir=''
-installsitelib='@LIBDIR@/perl/site_perl/5.22.0'
+installsitelib='@LIBDIR@/perl/site_perl/5.22.1'
 installsiteman1dir=''
 installsiteman3dir=''
 installsitescript='@USRBIN@'
 installstyle='lib/perl'
 installusrbinperl='define'
-installvendorarch='@LIBDIR@/perl/vendor_perl/5.22.0/@ARCH@-thread-multi'
+installvendorarch='@LIBDIR@/perl/vendor_perl/5.22.1/@ARCH@-thread-multi'
 installvendorbin='@USRBIN@'
 installvendorhtml1dir=''
 installvendorhtml3dir=''
-installvendorlib='@LIBDIR@/perl/vendor_perl/5.22.0'
+installvendorlib='@LIBDIR@/perl/vendor_perl/5.22.1'
 installvendorman1dir=''
 installvendorman3dir=''
 installvendorscript='@USRBIN@'
@@ -957,7 +957,7 @@ optimize='-O2'
 orderlib='false'
 osname='linux'
 osvers='3.19.5-yocto-standard'
-otherlibdirs='@LIBDIR@/perl/5.22.0'
+otherlibdirs='@LIBDIR@/perl/5.22.1'
 package='perl'
 pager='/usr/bin/less -isr'
 passcat='cat /etc/passwd'
@@ -978,8 +978,8 @@ pmake=''
 pr=''
 prefix='@EXECPREFIX@'
 prefixexp='@EXECPREFIX@'
-privlib='@LIBDIR@/perl/5.22.0'
-privlibexp='@LIBDIR@/perl/5.22.0'
+privlib='@LIBDIR@/perl/5.22.1'
+privlibexp='@LIBDIR@/perl/5.22.1'
 procselfexe='"/proc/self/exe"'
 prototype='define'
 ptrsize='8'
@@ -1045,17 +1045,17 @@ sig_num='0 1 2 3 4 5 6 7 8 9 10 11 12 13 14 15 16 17 18 19 20 21 22 23 24 25 26
 sig_num_init='0, 1, 2, 3, 4, 5, 6, 7, 8, 9, 10, 11, 12, 13, 14, 15, 16, 17, 18, 19, 20, 21, 22, 23, 24, 25, 26, 27, 28, 29, 30, 31, 32, 33, 34, 35, 36, 37, 38, 39, 40, 41, 42, 43, 44, 45, 46, 47, 48, 49, 50, 51, 52, 53, 54, 55, 56, 57, 58, 59, 60, 61, 62, 63, 64, 6, 17, 29, 31, 0'
 sig_size='69'
 signal_t='void'
-sitearch='@LIBDIR@/perl/site_perl/5.22.0/@ARCH@-thread-multi'
-sitearchexp='@LIBDIR@/perl/site_perl/5.22.0/@ARCH@-thread-multi'
+sitearch='@LIBDIR@/perl/site_perl/5.22.1/@ARCH@-thread-multi'
+sitearchexp='@LIBDIR@/perl/site_perl/5.22.1/@ARCH@-thread-multi'
 sitebin='@USRBIN@'
 sitebinexp='@USRBIN@'
 sitehtml1dir=''
 sitehtml1direxp=''
 sitehtml3dir=''
 sitehtml3direxp=''
-sitelib='@LIBDIR@/perl/site_perl/5.22.0'
+sitelib='@LIBDIR@/perl/site_perl/5.22.1'
 sitelib_stem='@LIBDIR@/perl/site_perl'
-sitelibexp='@LIBDIR@/perl/site_perl/5.22.0'
+sitelibexp='@LIBDIR@/perl/site_perl/5.22.1'
 siteman1dir=''
 siteman1direxp=''
 siteman3dir=''
@@ -1174,17 +1174,17 @@ uvtype='unsigned long'
 uvuformat='"lu"'
 uvxformat='"lx"'
 vaproto='define'
-vendorarch='@LIBDIR@/perl/vendor_perl/5.22.0/@ARCH@-thread-multi'
-vendorarchexp='@LIBDIR@/perl/vendor_perl/5.22.0/@ARCH@-thread-multi'
+vendorarch='@LIBDIR@/perl/vendor_perl/5.22.1/@ARCH@-thread-multi'
+vendorarchexp='@LIBDIR@/perl/vendor_perl/5.22.1/@ARCH@-thread-multi'
 vendorbin='@USRBIN@'
 vendorbinexp='@USRBIN@'
 vendorhtml1dir=' '
 vendorhtml1direxp=''
 vendorhtml3dir=' '
 vendorhtml3direxp=''
-vendorlib='@LIBDIR@/perl/vendor_perl/5.22.0'
+vendorlib='@LIBDIR@/perl/vendor_perl/5.22.1'
 vendorlib_stem='@LIBDIR@/perl/vendor_perl'
-vendorlibexp='@LIBDIR@/perl/vendor_perl/5.22.0'
+vendorlibexp='@LIBDIR@/perl/vendor_perl/5.22.1'
 vendorman1dir=' '
 vendorman1direxp=''
 vendorman3dir=' '
@@ -1193,7 +1193,7 @@ vendorprefix='@EXECPREFIX@'
 vendorprefixexp='@EXECPREFIX@'
 vendorscript='@USRBIN@'
 vendorscriptexp='@USRBIN@'
-version='5.22.0'
+version='5.22.1'
 version_patchlevel_string='version 22 subversion 0'
 versiononly='undef'
 vi=''
diff --git a/meta/recipes-devtools/perl/perl_5.22.0.bb b/meta/recipes-devtools/perl/perl_5.22.1.bb
similarity index 99%
rename from meta/recipes-devtools/perl/perl_5.22.0.bb
rename to meta/recipes-devtools/perl/perl_5.22.1.bb
index 29dd12d..705852c 100644
--- a/meta/recipes-devtools/perl/perl_5.22.0.bb
+++ b/meta/recipes-devtools/perl/perl_5.22.1.bb
@@ -71,8 +71,8 @@ SRC_URI_append_class-target = " \
             file://test/ext-DynaLoader-t-DynaLoader.t-fix-calling-dl_findfil.patch \
            "
 
-SRC_URI[md5sum] = "ff0f09b17de426eff323426cb140ee79"
-SRC_URI[sha256sum] = "be83ead0c5c26cbbe626fa4bac1a4beabe23a9eebc15d35ba49ccde11878e196"
+SRC_URI[md5sum] = "6671e4829cbaf9cecafa9a84f141b0a3"
+SRC_URI[sha256sum] = "9e87317d693ce828095204be0d09af8d60b8785533fadea1a82b6f0e071e5c79"
 
 inherit perlnative siteinfo
 
-- 
1.8.4.5


