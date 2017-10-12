Return-Path: <denis@denix.org>
Received: from mailout4.zoneedit.com (mailout4.zoneedit.com [64.68.198.17])
	by mail.openembedded.org (Postfix) with ESMTP id D1BB16FF69
	for <openembedded-core@lists.openembedded.org>;
	Thu, 12 Oct 2017 19:11:04 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by mailout4.zoneedit.com (Postfix) with ESMTP id CD29A20AD5;
	Thu, 12 Oct 2017 19:11:05 +0000 (UTC)
Received: from mailout4.zoneedit.com ([127.0.0.1])
	by localhost (zmo03-pco.easydns.vpn [127.0.0.1]) (amavisd-new,
	port 10024)
	with ESMTP id c44Nu86Gfwyy; Thu, 12 Oct 2017 19:11:05 +0000 (UTC)
Received: from mail.denix.org (pool-100-15-85-143.washdc.fios.verizon.net
	[100.15.85.143])
	(using TLSv1 with cipher DHE-RSA-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by mailout4.zoneedit.com (Postfix) with ESMTPSA id 8B8DB204B1;
	Thu, 12 Oct 2017 19:11:04 +0000 (UTC)
Received: by mail.denix.org (Postfix, from userid 1000)
	id 1313E1626EC; Thu, 12 Oct 2017 15:11:04 -0400 (EDT)
Date: Thu, 12 Oct 2017 15:11:04 -0400
From: Denys Dmytriyenko <denis@denix.org>
To: leonardo.sandoval.gonzalez@linux.intel.com
Message-ID: <20171012191104.GJ9221@denix.org>
References: <20171012183523.130193-1-leonardo.sandoval.gonzalez@linux.intel.com>
	<20171012183523.130193-2-leonardo.sandoval.gonzalez@linux.intel.com>
MIME-Version: 1.0
In-Reply-To: <20171012183523.130193-2-leonardo.sandoval.gonzalez@linux.intel.com>
User-Agent: Mutt/1.5.20 (2009-06-14)
Cc: openembedded-core@lists.openembedded.org
Subject: Re: [PATCH 2/4] perl: upgrade to 5.26.1
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
X-List-Received-Date: Thu, 12 Oct 2017 19:11:05 -0000
Content-Type: text/plain; charset=iso-8859-1
Content-Disposition: inline
Content-Transfer-Encoding: 8bit

On Thu, Oct 12, 2017 at 11:35:21AM -0700, leonardo.sandoval.gonzalez@linux.intel.com wrote:
> From: Leonardo Sandoval <leonardo.sandoval.gonzalez@linux.intel.com>
> 
> Highlights:
> 
>     * Patches rebased to 5.26.1 and just one removed
> 
>     * Several configs values taken from upstream script uconfig[64].sh were introduced in
>     config.sh, avoiding pre-processor issues.
> 
>     * Several libraries paths now included a './' as prefix, because @INC does not
>     include local paths.

https://wiki.gentoo.org/wiki/Project:Perl/5.26_Known_Issues


>     * Manifypods is excluded from compilation due to compilation errors (see patch for
>     more info)
> 
>     * New perl creates a static library (<libdir>/auto/Unicode/Normalize/Normalize.a) thus
>     there is a new staticdev package.
> 
> New packages included (compared to previous version):
> 
>     perl-module-math-bigint-lib
>     perl-module-test2
>     perl-module-test2-api
>     perl-module-test2-api-breakage
>     perl-module-test2-api-context
>     perl-module-test2-api-instance
>     perl-module-test2-api-stack
>     perl-module-test2-event
>     perl-module-test2-event-bail
>     perl-module-test2-event-diag
>     perl-module-test2-event-encoding
>     perl-module-test2-event-exception
>     perl-module-test2-event-generic
>     perl-module-test2-event-info
>     perl-module-test2-event-note
>     perl-module-test2-event-ok
>     perl-module-test2-event-plan
>     perl-module-test2-event-skip
>     perl-module-test2-event-subtest
>     perl-module-test2-event-tap-version
>     perl-module-test2-event-waiting
>     perl-module-test2-formatter
>     perl-module-test2-formatter-tap
>     perl-module-test2-hub
>     perl-module-test2-hub-interceptor
>     perl-module-test2-hub-interceptor-terminator
>     perl-module-test2-hub-subtest
>     perl-module-test2-ipc
>     perl-module-test2-ipc-driver
>     perl-module-test2-ipc-driver-files
>     perl-module-test2-tools-tiny
>     perl-module-test2-util
>     perl-module-test2-util-externalmeta
>     perl-module-test2-util-hashbase
>     perl-module-test2-util-trace
>     perl-module-test-builder-formatter
>     perl-module-test-builder-tododiag
>     perl-module-unicode-collate-locale-de-at-ph
>     perl-module-unicode-collate-locale-fr-ca
>     perl-module-unicode-collate-locale-he
>     perl-module-unicode-collate-locale-ug-cyrl
>     perl-module-unicode-collate-locale-vo
>     perl-module-unicode-normalize-staticdev
> 
> Signed-off-by: Leonardo Sandoval <leonardo.sandoval.gonzalez@linux.intel.com>
> ---
>  ...depends_5.24.1.inc => perl-rdepends_5.26.1.inc} |   0
>  meta/recipes-devtools/perl/perl/Makefile.SH.patch  |  82 +++++-----
>  .../perl/perl/PPPort_pm-fix-require.patch          |  28 ++++
>  .../perl/perl/PPPort_xs-fix-require.patch          |  36 ++++
>  .../perl/perl/avoid-manifypods.patch               |  28 ++++
>  .../perl/collade-makefile-use-local-mkheader.patch |  29 ++++
>  meta/recipes-devtools/perl/perl/config.sh          |  83 ++++++----
>  meta/recipes-devtools/perl/perl/config.sh-32       |   2 +
>  meta/recipes-devtools/perl/perl/config.sh-64       |   2 +
>  .../perl/perl/debian/fixes/respect_umask.diff      |  26 +--
>  .../perl/perl/debian/no_packlist_perllocal.diff    |  25 +--
>  .../perl/perl/debian/prefix_changes.diff           |  33 ++--
>  .../perl/perl/debian/writable_site_dirs.diff       |  14 +-
>  .../perl/perl/letgcc-find-errno.patch              |  26 ++-
>  .../perl/perl/native-nopacklist-native.patch       |  29 ++++
>  .../perl/perl/native-nopacklist-partial.patch      |  95 +++++++++++
>  ...-PathTools-don-t-filter-out-blib-from-INC.patch |  22 +--
>  ...erl-fix-conflict-between-skip_all-and-END.patch | 181 ---------------------
>  .../perl/perl/perl-test-customized.patch           | 123 +++++++-------
>  .../perl/perl/pport_h-fix-require.patch            |  42 +++++
>  .../perl/perl/utils-Makefile-force-miniperl.patch  |  28 ++++
>  .../perl/perl/write_buildcustomize.patch           |  40 +++++
>  .../perl/{perl_5.24.1.bb => perl_5.26.1.bb}        |  14 +-
>  23 files changed, 621 insertions(+), 367 deletions(-)
>  rename meta/recipes-devtools/perl/{perl-rdepends_5.24.1.inc => perl-rdepends_5.26.1.inc} (100%)
>  create mode 100644 meta/recipes-devtools/perl/perl/PPPort_pm-fix-require.patch
>  create mode 100644 meta/recipes-devtools/perl/perl/PPPort_xs-fix-require.patch
>  create mode 100644 meta/recipes-devtools/perl/perl/avoid-manifypods.patch
>  create mode 100644 meta/recipes-devtools/perl/perl/collade-makefile-use-local-mkheader.patch
>  create mode 100644 meta/recipes-devtools/perl/perl/native-nopacklist-native.patch
>  create mode 100644 meta/recipes-devtools/perl/perl/native-nopacklist-partial.patch
>  delete mode 100644 meta/recipes-devtools/perl/perl/perl-fix-conflict-between-skip_all-and-END.patch
>  create mode 100644 meta/recipes-devtools/perl/perl/pport_h-fix-require.patch
>  create mode 100644 meta/recipes-devtools/perl/perl/utils-Makefile-force-miniperl.patch
>  create mode 100644 meta/recipes-devtools/perl/perl/write_buildcustomize.patch
>  rename meta/recipes-devtools/perl/{perl_5.24.1.bb => perl_5.26.1.bb} (94%)
> 
> diff --git a/meta/recipes-devtools/perl/perl-rdepends_5.24.1.inc b/meta/recipes-devtools/perl/perl-rdepends_5.26.1.inc
> similarity index 100%
> rename from meta/recipes-devtools/perl/perl-rdepends_5.24.1.inc
> rename to meta/recipes-devtools/perl/perl-rdepends_5.26.1.inc
> diff --git a/meta/recipes-devtools/perl/perl/Makefile.SH.patch b/meta/recipes-devtools/perl/perl/Makefile.SH.patch
> index fd8237fe79..e3e4519297 100644
> --- a/meta/recipes-devtools/perl/perl/Makefile.SH.patch
> +++ b/meta/recipes-devtools/perl/perl/Makefile.SH.patch
> @@ -1,7 +1,8 @@
> -From 4dd9f3f81d8c81c96ff1ea0890ea55685f28b7e9 Mon Sep 17 00:00:00 2001
> +From 58b0bb026371235bdcf3ee36106f19b045488619 Mon Sep 17 00:00:00 2001
>  From: Hongxu Jia <hongxu.jia@windriver.com>
>  Date: Tue, 1 Jul 2014 15:51:53 +0800
> -Subject: [PATCH 28/49] perl, perl-native, perl-ptest: upgrade from 5.14.3 to
> +Subject: [PATCH 29/49] perl, perl-native, perl-ptest: upgrade from 5.14.3 to
> +
>   5.20.0
>  
>  Upstream-Status:Inappropriate [embedded specific]
> @@ -9,11 +10,11 @@ Upstream-Status:Inappropriate [embedded specific]
>  Signed-off-by: Hongxu Jia <hongxu.jia@windriver.com>
>  
>  ---
> - Makefile.SH | 147 ++++++++++++++++++++++++++++--------------------------------
> - 1 file changed, 68 insertions(+), 79 deletions(-)
> + Makefile.SH | 153 ++++++++++++++++++++++++++++--------------------------------
> + 1 file changed, 72 insertions(+), 81 deletions(-)
>  
>  diff --git a/Makefile.SH b/Makefile.SH
> -index 916b332..b143d46 100755
> +index 598abdf..3f95b11 100755
>  --- a/Makefile.SH
>  +++ b/Makefile.SH
>  @@ -48,10 +48,10 @@ case "$useshrplib" in
> @@ -67,7 +68,7 @@ index 916b332..b143d46 100755
>   	    ;;
>   	os390)	test -f /bin/env && ldlibpth="/bin/env $ldlibpth"
>   		;;
> -@@ -596,13 +586,23 @@ splintfiles = $(c1)
> +@@ -618,13 +608,23 @@ lintflags = \
>   	@echo `$(CCCMDSRC)` -S $*.c
>   	@`$(CCCMDSRC)` -S $*.c
>   
> @@ -97,7 +98,7 @@ index 916b332..b143d46 100755
>   	@touch $(MANIFEST_SRT)
>   
>   .PHONY: all utilities
> -@@ -611,7 +611,7 @@ $(MANIFEST_SRT):	MANIFEST $(PERL_EXE)
> +@@ -633,7 +633,7 @@ $(MANIFEST_SRT):	MANIFEST $(PERL_EXE)
>   # by make_patchnum.pl.
>   git_version.h: lib/Config_git.pl
>   
> @@ -106,7 +107,7 @@ index 916b332..b143d46 100755
>   	$(MINIPERL) make_patchnum.pl
>   
>   # make sure that we recompile perl.c if the git version changes
> -@@ -624,7 +624,7 @@ perl$(OBJ_EXT): git_version.h
> +@@ -646,7 +646,7 @@ perl$(OBJ_EXT): git_version.h
>   # loading, we need to build perl first.
>   case "$usedl$static_cwd" in
>   defineundef)
> @@ -115,25 +116,31 @@ index 916b332..b143d46 100755
>       ;;
>   definedefine)
>       util_deps='$(PERL_EXE) $(CONFIGPM) FORCE'
> -@@ -634,7 +634,7 @@ definedefine)
> +@@ -656,8 +656,9 @@ definedefine)
>   esac
>   
>   $spitshell >>$Makefile <<!GROK!THIS!
>  -utils/Makefile: \$(MINIPERL_EXE) \$(CONFIGPM) utils/Makefile.PL
> +-	\$(MINIPERL) utils/Makefile.PL
> ++
>  +utils/Makefile: \$(CONFIGPM) utils/Makefile.PL
> - 	\$(MINIPERL) -Ilib utils/Makefile.PL
> ++	\$(MINIPERL) -Ilib utils/Makefile.PL
>   
>   utilities:	utils/Makefile $util_deps
> -@@ -743,7 +743,7 @@ ext.libs: $(static_ext)
> + 	@echo " "; echo "	Making utilities"; cd utils; \$(LDLIBPTH) \$(MAKE) all
> +@@ -765,8 +766,9 @@ ext.libs: $(static_ext)
>   ;;
>   *)
>   $spitshell >>$Makefile <<'!NO!SUBS!'
>  -perlmain.c: $(MINIPERL_EXE) ext/ExtUtils-Miniperl/pm_to_blib
> +-	$(MINIPERL) -MExtUtils::Miniperl -e 'writemain(\"perlmain.c", @ARGV)' DynaLoader $(static_ext)
> ++
>  +perlmain.c: ext/ExtUtils-Miniperl/lib/ExtUtils/Miniperl.pm
> - 	$(MINIPERL) -Ilib -MExtUtils::Miniperl -e 'writemain(\"perlmain.c", @ARGV)' DynaLoader $(static_ext)
> ++	$(MINIPERL) -Ilib -MExtUtils::Miniperl -e 'writemain(\"perlmain.c", @ARGV)' DynaLoader $(static_ext)
>   
>   # The file ext.libs is a list of libraries that must be linked in
> -@@ -806,7 +806,7 @@ PERLEXPORT		= perl.exp
> + # for static extensions, e.g. -lm -lgdbm, etc.  The individual
> +@@ -828,7 +830,7 @@ PERLEXPORT		= perl.exp
>   	;;
>   	esac
>   	$spitshell >>$Makefile <<'!NO!SUBS!'
> @@ -142,7 +149,7 @@ index 916b332..b143d46 100755
>   	./$(MINIPERLEXP) makedef.pl --sort-fold PLATFORM=aix CC_FLAGS="$(OPTIMIZE)" > perl.exp
>   
>   !NO!SUBS!
> -@@ -815,7 +815,7 @@ os2)
> +@@ -837,7 +839,7 @@ os2)
>   	$spitshell >>$Makefile <<'!NO!SUBS!'
>   MINIPERLEXP		= miniperl
>   
> @@ -151,7 +158,7 @@ index 916b332..b143d46 100755
>   	./$(MINIPERLEXP) makedef.pl PLATFORM=os2 -DPERL_DLL=$(PERL_DLL) CC_FLAGS="$(OPTIMIZE)" > perl5.def
>   
>   !NO!SUBS!
> -@@ -878,7 +878,7 @@ $(LIBPERL): $& $(perllib_objs) $(DYNALOADER) $(LIBPERLEXPORT)
> +@@ -913,7 +915,7 @@ $(LIBPERL): $& $(perllib_dep) $(DYNALOADER) $(LIBPERLEXPORT)
>   	true)
>   		$spitshell >>$Makefile <<'!NO!SUBS!'
>   	rm -f $@
> @@ -160,7 +167,7 @@ index 916b332..b143d46 100755
>   !NO!SUBS!
>   		case "$osname" in
>   		aix)
> -@@ -936,15 +936,19 @@ lib/buildcustomize.pl: $& $(miniperl_objs) write_buildcustomize.pl
> +@@ -971,15 +973,19 @@ lib/buildcustomize.pl: $& $(miniperl_objs) write_buildcustomize.pl
>   		$spitshell >>$Makefile <<'!NO!SUBS!'
>   lib/buildcustomize.pl: $& $(miniperl_objs)
>   	$(CC) -o $(MINIPERL_EXE) $(CLDFLAGS) $(miniperl_objs) $(libs)
> @@ -183,7 +190,7 @@ index 916b332..b143d46 100755
>   	$(MINIPERL) -f write_buildcustomize.pl    
>   !NO!SUBS!
>   		;;
> -@@ -966,7 +970,9 @@ lib/buildcustomize.pl: $& $(miniperl_objs) write_buildcustomize.pl
> +@@ -1001,7 +1007,9 @@ lib/buildcustomize.pl: $& $(miniperl_objs) write_buildcustomize.pl
>   	-@rm -f miniperl.xok
>   	$(CC) $(CLDFLAGS) $(NAMESPACEFLAGS) -o $(MINIPERL_EXE) \
>   	    $(miniperl_objs) $(libs)
> @@ -194,7 +201,7 @@ index 916b332..b143d46 100755
>   	$(MINIPERL) -f write_buildcustomize.pl
>   !NO!SUBS!
>   		;;
> -@@ -977,7 +983,9 @@ lib/buildcustomize.pl: \$& \$(miniperl_objs) write_buildcustomize.pl
> +@@ -1012,7 +1020,9 @@ lib/buildcustomize.pl: \$& \$(miniperl_dep) write_buildcustomize.pl
>   	-@rm -f miniperl.xok
>   	-@rm \$(MINIPERL_EXE)
>   	\$(LNS) \$(HOST_PERL) \$(MINIPERL_EXE)
> @@ -205,7 +212,7 @@ index 916b332..b143d46 100755
>   	\$(MINIPERL) -f write_buildcustomize.pl 'osname' "$osname"
>   !GROK!THIS!
>   		else
> -@@ -986,7 +994,9 @@ lib/buildcustomize.pl: $& $(miniperl_objs) write_buildcustomize.pl
> +@@ -1021,7 +1031,9 @@ lib/buildcustomize.pl: $& $(miniperl_dep) write_buildcustomize.pl
>   	-@rm -f miniperl.xok
>   	$(CC) $(CLDFLAGS) -o $(MINIPERL_EXE) \
>   	    $(miniperl_objs) $(libs)
> @@ -216,7 +223,7 @@ index 916b332..b143d46 100755
>   	$(MINIPERL) -f write_buildcustomize.pl
>   !NO!SUBS!
>   		fi
> -@@ -1036,7 +1046,7 @@ case "${osname}" in
> +@@ -1071,7 +1083,7 @@ case "${osname}" in
>   catamount)
>   $spitshell >>$Makefile <<!GROK!THIS!
>   .PHONY: makeppport
> @@ -225,7 +232,7 @@ index 916b332..b143d46 100755
>   	-@for f in Makefile.PL PPPort_pm.PL PPPort_xs.PL ppport_h.PL; do \
>   	(cd ext/Devel-PPPort && `pwd`/run.sh ../../$(MINIPERL_EXE) -I../../lib \$\$f); \
>   	done
> -@@ -1046,7 +1056,7 @@ makeppport: \$(MINIPERL_EXE) \$(CONFIGPM)
> +@@ -1081,7 +1093,7 @@ makeppport: \$(MINIPERL_EXE) \$(CONFIGPM)
>   *)
>   $spitshell >>$Makefile <<'!NO!SUBS!'
>   .PHONY: makeppport
> @@ -234,7 +241,7 @@ index 916b332..b143d46 100755
>   	$(MINIPERL) mkppport
>   
>   !NO!SUBS!
> -@@ -1056,16 +1066,16 @@ esac
> +@@ -1091,16 +1103,16 @@ esac
>   $spitshell >>$Makefile <<'!NO!SUBS!'
>   
>   .PHONY: preplibrary
> @@ -254,7 +261,7 @@ index 916b332..b143d46 100755
>   	$(MINIPERL) lib/unicore/mktables -C lib/unicore -P pod -maketest -makelist -p
>   #	Commented out so always runs, mktables looks at far more files than we
>   #	can in this makefile to decide if needs to run or not
> -@@ -1074,12 +1084,12 @@ uni.data: $(MINIPERL_EXE) $(CONFIGPM) lib/unicore/mktables $(nonxs_ext)
> +@@ -1109,12 +1121,12 @@ uni.data: $(MINIPERL_EXE) $(CONFIGPM) lib/unicore/mktables $(nonxs_ext)
>   # $(PERL_EXE) and ext because pod_lib.pl needs Digest::MD5
>   # But also this ensures that all extensions are built before we try to scan
>   # them, which picks up Devel::PPPort's documentation.
> @@ -270,16 +277,16 @@ index 916b332..b143d46 100755
>   	$(MINIPERL) autodoc.pl
>   
>   pod/perlmodlib.pod: $(MINIPERL_EXE) pod/perlmodlib.PL MANIFEST
> -@@ -1089,7 +1099,7 @@ pod/perl5240delta.pod: pod/perldelta.pod
> - 	$(RMS) pod/perl5240delta.pod
> - 	$(LNS) perldelta.pod pod/perl5240delta.pod
> +@@ -1124,7 +1136,7 @@ pod/perl5261delta.pod: pod/perldelta.pod
> + 	$(RMS) pod/perl5261delta.pod
> + 	$(LNS) perldelta.pod pod/perl5261delta.pod
>   
>  -extra.pods: $(MINIPERL_EXE)
>  +extra.pods:
>   	-@test ! -f extra.pods || rm -f `cat extra.pods`
>   	-@rm -f extra.pods
>   	-@for x in `grep -l '^=[a-z]' README.* | grep -v README.vms` ; do \
> -@@ -1133,8 +1143,7 @@ EOT
> +@@ -1168,8 +1180,7 @@ EOT
>           $spitshell >>$Makefile <<EOT
>   
>   install_$name install-$name: \$(INSTALL_DEPENDENCE) installperl all installman
> @@ -289,7 +296,7 @@ index 916b332..b143d46 100755
>   EOT
>       fi
>   
> -@@ -1144,11 +1153,7 @@ done
> +@@ -1179,11 +1190,7 @@ done
>   if test "X$hostperl" != X; then
>   	$spitshell >>$Makefile <<'!NO!SUBS!'
>   install.perl:	$(INSTALL_DEPENDENCE) installperl
> @@ -302,17 +309,17 @@ index 916b332..b143d46 100755
>   
>   # XXX Experimental. Hardwired values, but useful for testing.
>   # Eventually Configure could ask for some of these values.
> -@@ -1166,24 +1171,8 @@ install.html: all installhtml
> +@@ -1201,24 +1208,8 @@ install.html: all installhtml
>   else
>   	$spitshell >>$Makefile <<'!NO!SUBS!'
>   install.perl:	$(INSTALL_DEPENDENCE) installperl
>  -	$(RUN_PERL) installperl --destdir=$(DESTDIR) $(INSTALLFLAGS) $(STRIPFLAGS)
>  -	-@test ! -s extras.lst || PATH="`pwd`:\${PATH}" PERL5LIB="`pwd`/lib" \$(RUN_PERL) -Ilib -MCPAN -e '@ARGV&&install(@ARGV)' `cat extras.lst`
> --
> --install.man:	all installman
> --	$(RUN_PERL) installman --destdir=$(DESTDIR) $(INSTALLFLAGS)
>  +	./hostperl -Ifake_config_library -Ilib -MConfig installperl --destdir=$(DESTDIR) $(INSTALLFLAGS) $(STRIPFLAGS)
>   
> +-install.man:	all installman
> +-	$(RUN_PERL) installman --destdir=$(DESTDIR) $(INSTALLFLAGS)
> +-
>  -# XXX Experimental. Hardwired values, but useful for testing.
>  -# Eventually Configure could ask for some of these values.
>  -install.html: all installhtml
> @@ -328,7 +335,7 @@ index 916b332..b143d46 100755
>   !NO!SUBS!
>   fi
>   
> -@@ -1275,13 +1264,13 @@ manicheck:	FORCE
> +@@ -1310,13 +1301,13 @@ manicheck:	FORCE
>   #
>   # DynaLoader may be needed for extensions that use Makefile.PL.
>   
> @@ -345,7 +352,7 @@ index 916b332..b143d46 100755
>   	$(MINIPERL) make_ext.pl $@ $(MAKE_EXT_ARGS) MAKE="$(MAKE)" LIBPERL_A=$(LIBPERL) LINKTYPE=static $(STATIC_LDFLAGS)
>   
>   n_dummy $(nonxs_ext):	$(MINIPERL_EXE) lib/buildcustomize.pl preplibrary FORCE
> -@@ -1479,14 +1468,14 @@ test_prep_pre: preplibrary utilities $(nonxs_ext)
> +@@ -1514,14 +1505,14 @@ test_prep_pre: preplibrary utilities $(nonxs_ext)
>   
>   case "$targethost" in
>   '') $spitshell >>$Makefile <<'!NO!SUBS!'
> @@ -362,7 +369,7 @@ index 916b332..b143d46 100755
>   	\$(dynamic_ext) \$(TEST_PERL_DLL) runtests \
>   	\$(generated_pods)
>   	$to libperl.*
> -@@ -1539,7 +1528,7 @@ test_prep test-prep: test_prep_pre \$(MINIPERL_EXE) \$(unidatafiles) \$(PERL_EXE
> +@@ -1574,7 +1565,7 @@ test_prep test-prep: test_prep_pre \$(MINIPERL_EXE) \$(unidatafiles) \$(PERL_EXE
>   esac
>   
>   $spitshell >>$Makefile <<'!NO!SUBS!'
> @@ -371,7 +378,7 @@ index 916b332..b143d46 100755
>   	$(MINIPERL) make_ext.pl $(dynamic_ext_re) MAKE="$(MAKE)" LIBPERL_A=$(LIBPERL) LINKTYPE=dynamic
>   	cd t && (rm -f $(PERL_EXE); $(LNS) ../$(PERL_EXE) $(PERL_EXE))
>   !NO!SUBS!
> -@@ -1600,7 +1589,7 @@ minitest_prep:
> +@@ -1635,7 +1626,7 @@ minitest_prep:
>   
>   MINITEST_TESTS = base/*.t comp/*.t cmd/*.t run/*.t io/*.t re/*.t opbasic/*.t op/*.t uni/*.t perf/*.t
>   
> @@ -380,6 +387,5 @@ index 916b332..b143d46 100755
>   	- cd t && $(RUN_PERL) TEST $(MINITEST_TESTS) <$(devtty)
>   
>   minitest-notty minitest_notty: $(MINIPERL_EXE) minitest_prep
> --- 
> -2.1.4
> +
>  
> diff --git a/meta/recipes-devtools/perl/perl/PPPort_pm-fix-require.patch b/meta/recipes-devtools/perl/perl/PPPort_pm-fix-require.patch
> new file mode 100644
> index 0000000000..47a7f5c558
> --- /dev/null
> +++ b/meta/recipes-devtools/perl/perl/PPPort_pm-fix-require.patch
> @@ -0,0 +1,28 @@
> +From 62d3500bb6a4addd96a8f2f44f5589c866dfe2e6 Mon Sep 17 00:00:00 2001
> +From: Leonardo Sandoval <leonardo.sandoval.gonzalez@linux.intel.com>
> +Date: Fri, 6 Oct 2017 14:01:08 -0700
> +Subject: [PATCH] PPPort_pm.PL: require ppptools.pl starting at local directory
> +
> +Upstream-Status: Innapropiate [OE-Core specific]
> +
> +Signed-off-by: Leonardo Sandoval <leonardo.sandoval.gonzalez@linux.intel.com>
> +---
> + cpan/Devel-PPPort/PPPort_pm.PL | 2 +-
> + 1 file changed, 1 insertion(+), 1 deletion(-)
> +
> +diff --git a/cpan/Devel-PPPort/PPPort_pm.PL b/cpan/Devel-PPPort/PPPort_pm.PL
> +index ad75b13..7d143a2 100644
> +--- a/cpan/Devel-PPPort/PPPort_pm.PL
> ++++ b/cpan/Devel-PPPort/PPPort_pm.PL
> +@@ -15,7 +15,7 @@
> + 
> + use strict;
> + $^W = 1;
> +-require "parts/ppptools.pl";
> ++require "./parts/ppptools.pl";
> + 
> + my $INCLUDE = 'parts/inc';
> + my $DPPP = 'DPPP_';
> +-- 
> +2.12.3
> +
> diff --git a/meta/recipes-devtools/perl/perl/PPPort_xs-fix-require.patch b/meta/recipes-devtools/perl/perl/PPPort_xs-fix-require.patch
> new file mode 100644
> index 0000000000..e35c5a9c45
> --- /dev/null
> +++ b/meta/recipes-devtools/perl/perl/PPPort_xs-fix-require.patch
> @@ -0,0 +1,36 @@
> +From d265a66644af0e04518a6957f84456f3a3ad1a74 Mon Sep 17 00:00:00 2001
> +From: Leonardo Sandoval <leonardo.sandoval.gonzalez@linux.intel.com>
> +Date: Fri, 6 Oct 2017 15:01:32 -0700
> +Subject: [PATCH] PPPort_xs.PL: require ppptools.pl starting at local directory
> +
> +Otherwise, the following errors is observed:
> +
> +    | Can't locate parts/ppptools.pl in @INC (@INC contains: ../../lib ../../lib build/tmp/work/i586-poky-linux/perl/5.26.1-r0/recipe-sysroot-native/usr/bin/perl-native/../../../usr/lib/perl-native/perl/site_perl/5.26.1 build/tmp/work/i586-poky-linux/perl/5.26.1-r0/recipe-sysroot-native/usr/bin/perl-native/../../../usr/lib/perl-native/perl/vendor_perl/5.26.1 build/tmp/work/i586-poky-linux/perl/5.26.1-r0/recipe-sysroot-native/usr/bin/perl-native/../../../usr/lib/perl-native/perl/5.26.1 build/tmp/work/x86_64-linux/perl-native/5.26.1-r0/recipe-sysroot-native/usr/lib/perl-native/perl/site_perl/5.26.1 build/tmp/work/x86_64-linux/perl-native/5.26.1-r0/recipe-sysroot-native/usr/lib/perl-native/perl/vendor_perl/5.26.1 build/tmp/work/x86_64-linux/perl-native/5.26.1-r0/recipe-sysroot-native/usr/lib/perl-native/perl/5.26.1) at PPPort_xs.PL line 18.
> +    |
> +    | Can't locate parts/ppptools.pl in @INC (@INC contains: ../../lib ../../lib build/tmp/work/i586-poky-linux/perl/5.26.1-r0/recipe-sysroot-native/usr/bin/perl-native/../../../usr/lib/perl-native/perl/site_perl/5.26.1 build/tmp/work/i586-poky-linux/perl/5.26.1-r0/recipe-sysroot-native/usr/bin/perl-native/../../../usr/lib/perl-native/perl/vendor_perl/5.26.1 build/tmp/work/i586-poky-linux/perl/5.26.1-r0/recipe-sysroot-native/usr/bin/perl-native/../../../usr/lib/perl-native/perl/5.26.1 build/tmp/work/x86_64-linux/perl-native/5.26.1-r0/recipe-sysroot-native/usr/lib/perl-native/perl/site_perl/5.26.1 build/tmp/work/x86_64-linux/perl-native/5.26.1-r0/recipe-sysroot-native/usr/lib/perl-native/perl/vendor_perl/5.26.1 build/tmp/work/x86_64-linux/perl-native/5.26.1-r0/recipe-sysroot-native/usr/lib/perl-native/perl/5.26.1) at PPPort_xs.PL line 18.
> +    | Makefile:538: recipe for target 'RealPPPort.xs' failed
> +    | make[2]: *** [RealPPPort.xs] Error 2
> +
> +Upstream-Status: Innapropiate [OE-Core specific]
> +
> +Signed-off-by: Leonardo Sandoval <leonardo.sandoval.gonzalez@linux.intel.com>
> +---
> + cpan/Devel-PPPort/PPPort_xs.PL | 2 +-
> + 1 file changed, 1 insertion(+), 1 deletion(-)
> +
> +diff --git a/cpan/Devel-PPPort/PPPort_xs.PL b/cpan/Devel-PPPort/PPPort_xs.PL
> +index 5f18940..d00cffa 100644
> +--- a/cpan/Devel-PPPort/PPPort_xs.PL
> ++++ b/cpan/Devel-PPPort/PPPort_xs.PL
> +@@ -15,7 +15,7 @@
> + 
> + use strict;
> + $^W = 1;
> +-require "parts/ppptools.pl";
> ++require "./parts/ppptools.pl";
> + 
> + my %SECTION = (
> +   xshead => { code => '', header => "/* ---- code from __FILE__ ---- */" },
> +-- 
> +2.12.3
> +
> diff --git a/meta/recipes-devtools/perl/perl/avoid-manifypods.patch b/meta/recipes-devtools/perl/perl/avoid-manifypods.patch
> new file mode 100644
> index 0000000000..faa35c96b2
> --- /dev/null
> +++ b/meta/recipes-devtools/perl/perl/avoid-manifypods.patch
> @@ -0,0 +1,28 @@
> +From 6fecce2bf463a1dc4d953bd36de306db61f92c27 Mon Sep 17 00:00:00 2001
> +From: Leonardo Sandoval <leonardo.sandoval.gonzalez@linux.intel.com>
> +Date: Fri, 6 Oct 2017 13:52:42 -0700
> +Subject: [PATCH] MM_Unix.pm: avoid manifypods target execution
> +
> +Upstream-Status: Innapropiate [OE-Core specific]
> +
> +Signed-off-by: Leonardo Sandoval <leonardo.sandoval.gonzalez@linux.intel.com>
> +---
> + cpan/ExtUtils-MakeMaker/lib/ExtUtils/MM_Unix.pm | 2 +-
> + 1 file changed, 1 insertion(+), 1 deletion(-)
> +
> +diff --git a/cpan/ExtUtils-MakeMaker/lib/ExtUtils/MM_Unix.pm b/cpan/ExtUtils-MakeMaker/lib/ExtUtils/MM_Unix.pm
> +index 9d65a69..76b1f65 100644
> +--- a/cpan/ExtUtils-MakeMaker/lib/ExtUtils/MM_Unix.pm
> ++++ b/cpan/ExtUtils-MakeMaker/lib/ExtUtils/MM_Unix.pm
> +@@ -3799,7 +3799,7 @@ sub all_target {
> +     my $self = shift;
> + 
> +     return <<'MAKE_EXT';
> +-all :: pure_all manifypods
> ++all :: pure_all
> + 	$(NOECHO) $(NOOP)
> + MAKE_EXT
> + }
> +-- 
> +2.12.3
> +
> diff --git a/meta/recipes-devtools/perl/perl/collade-makefile-use-local-mkheader.patch b/meta/recipes-devtools/perl/perl/collade-makefile-use-local-mkheader.patch
> new file mode 100644
> index 0000000000..31b2a4b575
> --- /dev/null
> +++ b/meta/recipes-devtools/perl/perl/collade-makefile-use-local-mkheader.patch
> @@ -0,0 +1,29 @@
> +From 3047280d55c6482d0e526d91f707d1308ab7e703 Mon Sep 17 00:00:00 2001
> +From: Leonardo Sandoval <leonardo.sandoval.gonzalez@linux.intel.com>
> +Date: Mon, 9 Oct 2017 07:53:38 -0700
> +Subject: [PATCH] Unicode-Collade/Makefile.PL: indicate to use local mkheader
> + script
> +
> +Upstream-Status: Innapropiate [OE-Core specific]
> +
> +Signed-off-by: Leonardo Sandoval <leonardo.sandoval.gonzalez@linux.intel.com>
> +---
> + cpan/Unicode-Collate/Makefile.PL | 2 +-
> + 1 file changed, 1 insertion(+), 1 deletion(-)
> +
> +diff --git a/cpan/Unicode-Collate/Makefile.PL b/cpan/Unicode-Collate/Makefile.PL
> +index 4103bc9..1d127b7 100644
> +--- a/cpan/Unicode-Collate/Makefile.PL
> ++++ b/cpan/Unicode-Collate/Makefile.PL
> +@@ -6,7 +6,7 @@ my $clean = {};
> + if (-f "Collate.xs") {
> +     print "Making header files for XS...\n";
> + 
> +-    do 'mkheader' or die $@ || "mkheader: $!";
> ++    do './mkheader' or die $@ || "mkheader: $!";
> + 
> +     $clean = { FILES => 'ucatbl.h' };
> + }
> +-- 
> +2.12.3
> +
> diff --git a/meta/recipes-devtools/perl/perl/config.sh b/meta/recipes-devtools/perl/perl/config.sh
> index 4657673005..c491ff49ec 100644
> --- a/meta/recipes-devtools/perl/perl/config.sh
> +++ b/meta/recipes-devtools/perl/perl/config.sh
> @@ -14,7 +14,7 @@
>  
>  : Configure command line arguments.
>  config_arg0='Configure'
> -config_args='-des -Doptimize=-O2 -Dmyhostname=localhost -Dperladmin=root@localhost -Dcc=gcc -Dcf_by=Open Embedded -Dinstallprefix=@EXECPREFIX@ -Dprefix=@EXECPREFIX@ -Dvendorprefix=@EXECPREFIX@ -Dsiteprefix=@EXECPREFIX@ -Dotherlibdirs=@LIBDIR@/perl/5.24.1 -Duseshrplib -Dusethreads -Duseithreads -Duselargefiles -Ud_dosuid -Dd_semctl_semun -Ui_db -Ui_ndbm -Ui_gdbm -Di_shadow -Di_syslog -Dman3ext=3pm -Duseperlio -Dinstallusrbinperl -Ubincompat5005 -Uversiononly -Dpager=@USRBIN@/less -isr'
> +config_args='-des -Doptimize=-O2 -Dmyhostname=localhost -Dperladmin=root@localhost -Dcc=gcc -Dcf_by=Open Embedded -Dinstallprefix=@EXECPREFIX@ -Dprefix=@EXECPREFIX@ -Dvendorprefix=@EXECPREFIX@ -Dsiteprefix=@EXECPREFIX@ -Dotherlibdirs=@LIBDIR@/perl/5.26.1 -Duseshrplib -Dusethreads -Duseithreads -Duselargefiles -Ud_dosuid -Dd_semctl_semun -Ui_db -Ui_ndbm -Ui_gdbm -Di_shadow -Di_syslog -Dman3ext=3pm -Duseperlio -Dinstallusrbinperl -Ubincompat5005 -Uversiononly -Dpager=@USRBIN@/less -isr'
>  config_argc=28
>  config_arg1='-des'
>  config_arg2='-Doptimize=-O2'
> @@ -26,7 +26,7 @@ config_arg7='-Dinstallprefix=@EXECPREFIX@'
>  config_arg8='-Dprefix=@EXECPREFIX@'
>  config_arg9='-Dvendorprefix=@EXECPREFIX@'
>  config_arg10='-Dsiteprefix=@EXECPREFIX@'
> -config_arg11='-Dotherlibdirs=@LIBDIR@/perl/5.24.1'
> +config_arg11='-Dotherlibdirs=@LIBDIR@/perl/5.26.1'
>  config_arg12='-Duseshrplib'
>  config_arg13='-Dusethreads'
>  config_arg14='-Duseithreads'
> @@ -45,6 +45,27 @@ config_arg26='-Ubincompat5005'
>  config_arg27='-Uversiononly'
>  config_arg28='-Dpager=@USRBIN@/less -isr'
>  
> +# taken from uconfig.sh
> +d_long_double_style_ieee='undef'
> +d_long_double_style_ieee_doubledouble='undef'
> +d_long_double_style_ieee_extended='undef'
> +d_long_double_style_ieee_std='undef'
> +d_long_double_style_vax='undef'
> +d_gai_strerror='undef'
> +d_querylocale='undef'
> +i_xlocale='undef'
> +d_strerror_l='undef'
> +default_inc_excludes_dot='undef'
> +d_double_has_inf='define'
> +d_double_has_nan='define'
> +d_double_has_negative_zero='define'
> +d_double_has_subnormals='define'
> +d_double_style_cray='undef'
> +d_double_style_ibm='undef'
> +d_double_style_ieee='define'
> +d_double_style_vax='undef'
> +
> +
>  Author=''
>  Date=''
>  Header=''
> @@ -65,12 +86,12 @@ ansi2knr=''
>  aphostname=''
>  api_revision='5'
>  api_subversion='1'
> -api_version='24'
> -api_versionstring='5.24.1'
> +api_version='26'
> +api_versionstring='5.26.1'
>  ar='ar'
> -archlib='@LIBDIR@/perl/5.24.1/@ARCH@-thread-multi'
> -archlibexp='@STAGINGDIR@@LIBDIR@/perl/5.24.1/@ARCH@-thread-multi'
> -archlib_exp='@LIBDIR@/perl/5.24.1/@ARCH@-thread-multi'
> +archlib='@LIBDIR@/perl/5.26.1/@ARCH@-thread-multi'
> +archlibexp='@STAGINGDIR@@LIBDIR@/perl/5.26.1/@ARCH@-thread-multi'
> +archlib_exp='@LIBDIR@/perl/5.26.1/@ARCH@-thread-multi'
>  archname64=''
>  archname='@ARCH@-thread-multi'
>  archobjs=''
> @@ -88,7 +109,7 @@ castflags='0'
>  cat='cat'
>  cc='gcc'
>  cccdlflags='-fPIC'
> -ccdlflags='-Wl,-E -Wl,-rpath,@LIBDIR@/perl/5.24.1/@ARCH@-thread-multi/CORE'
> +ccdlflags='-Wl,-E -Wl,-rpath,@LIBDIR@/perl/5.26.1/@ARCH@-thread-multi/CORE'
>  ccflags='-D_REENTRANT -D_GNU_SOURCE -fwrapv -fno-strict-aliasing -pipe -D_LARGEFILE_SOURCE -D_FILE_OFFSET_BITS=64 -D_FORTIFY_SOURCE=2'
>  ccflags_uselargefiles='-D_LARGEFILE_SOURCE -D_FILE_OFFSET_BITS=64'
>  ccname='gcc'
> @@ -838,7 +859,7 @@ inc_version_list_init='0'
>  incpath=''
>  inews=''
>  initialinstalllocation='@USRBIN@'
> -installarchlib='@LIBDIR@/perl/5.24.1/@ARCH@-thread-multi'
> +installarchlib='@LIBDIR@/perl/5.26.1/@ARCH@-thread-multi'
>  installbin='@USRBIN@'
>  installhtml1dir=''
>  installhtml3dir=''
> @@ -846,23 +867,23 @@ installman1dir=''
>  installman3dir=''
>  installprefix='@EXECPREFIX@'
>  installprefixexp='@EXECPREFIX@'
> -installprivlib='@LIBDIR@/perl/5.24.1'
> +installprivlib='@LIBDIR@/perl/5.26.1'
>  installscript='@USRBIN@'
> -installsitearch='@LIBDIR@/perl/site_perl/5.24.1/@ARCH@-thread-multi'
> +installsitearch='@LIBDIR@/perl/site_perl/5.26.1/@ARCH@-thread-multi'
>  installsitebin='@USRBIN@'
>  installsitehtml1dir=''
>  installsitehtml3dir=''
> -installsitelib='@LIBDIR@/perl/site_perl/5.24.1'
> +installsitelib='@LIBDIR@/perl/site_perl/5.26.1'
>  installsiteman1dir=''
>  installsiteman3dir=''
>  installsitescript='@USRBIN@'
>  installstyle='lib/perl'
>  installusrbinperl='define'
> -installvendorarch='@LIBDIR@/perl/vendor_perl/5.24.1/@ARCH@-thread-multi'
> +installvendorarch='@LIBDIR@/perl/vendor_perl/5.26.1/@ARCH@-thread-multi'
>  installvendorbin='@USRBIN@'
>  installvendorhtml1dir=''
>  installvendorhtml3dir=''
> -installvendorlib='@LIBDIR@/perl/vendor_perl/5.24.1'
> +installvendorlib='@LIBDIR@/perl/vendor_perl/5.26.1'
>  installvendorman1dir=''
>  installvendorman3dir=''
>  installvendorscript='@USRBIN@'
> @@ -899,10 +920,8 @@ lns='/bin/ln -s'
>  localtime_r_proto='REENTRANT_PROTO_S_TS'
>  locincpth='@EXECPREFIX@/local/include /opt/local/include @EXECPREFIX@/gnu/include /opt/gnu/include @EXECPREFIX@/GNU/include /opt/GNU/include'
>  loclibpth='@EXECPREFIX@/local@BASELIBDIR@ /opt/local@BASELIBDIR@ @EXECPREFIX@/gnu@BASELIBDIR@ /opt/gnu@BASELIBDIR@ @EXECPREFIX@/GNU@BASELIBDIR@ /opt/GNU@BASELIBDIR@'
> -longdblinfbytes='0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x80, 0xff, 0x7f, 0x00, 0x00'
>  longdblkind='3'
>  longdblmantbits='64'
> -longdblnanbytes='0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0xc0, 0xff, 0xff, 0x32, 0xf7'
>  longdblsize='16'
>  longlongsize='8'
>  longsize='8'
> @@ -965,11 +984,11 @@ optimize='-O2'
>  orderlib='false'
>  osname='linux'
>  osvers='3.19.5-yocto-standard'
> -otherlibdirs='@LIBDIR@/perl/5.24.1'
> +otherlibdirs='@LIBDIR@/perl/5.26.1'
>  package='perl'
>  pager='/usr/bin/less -isr'
>  passcat='cat /etc/passwd'
> -patchlevel='24'
> +patchlevel='26'
>  path_sep=':'
>  perl5='@USRBIN@/perl'
>  perl='perl'
> @@ -986,8 +1005,8 @@ pmake=''
>  pr=''
>  prefix='@EXECPREFIX@'
>  prefixexp='@EXECPREFIX@'
> -privlib='@LIBDIR@/perl/5.24.1'
> -privlibexp='@LIBDIR@/perl/5.24.1'
> +privlib='@LIBDIR@/perl/5.26.1'
> +privlibexp='@LIBDIR@/perl/5.26.1'
>  procselfexe='"/proc/self/exe"'
>  prototype='define'
>  ptrsize='8'
> @@ -1053,17 +1072,17 @@ sig_num='0 1 2 3 4 5 6 7 8 9 10 11 12 13 14 15 16 17 18 19 20 21 22 23 24 25 26
>  sig_num_init='0, 1, 2, 3, 4, 5, 6, 7, 8, 9, 10, 11, 12, 13, 14, 15, 16, 17, 18, 19, 20, 21, 22, 23, 24, 25, 26, 27, 28, 29, 30, 31, 32, 33, 34, 35, 36, 37, 38, 39, 40, 41, 42, 43, 44, 45, 46, 47, 48, 49, 50, 51, 52, 53, 54, 55, 56, 57, 58, 59, 60, 61, 62, 63, 64, 6, 17, 29, 31, 0'
>  sig_size='69'
>  signal_t='void'
> -sitearch='@LIBDIR@/perl/site_perl/5.24.1/@ARCH@-thread-multi'
> -sitearchexp='@LIBDIR@/perl/site_perl/5.24.1/@ARCH@-thread-multi'
> +sitearch='@LIBDIR@/perl/site_perl/5.26.1/@ARCH@-thread-multi'
> +sitearchexp='@LIBDIR@/perl/site_perl/5.26.1/@ARCH@-thread-multi'
>  sitebin='@USRBIN@'
>  sitebinexp='@USRBIN@'
>  sitehtml1dir=''
>  sitehtml1direxp=''
>  sitehtml3dir=''
>  sitehtml3direxp=''
> -sitelib='@LIBDIR@/perl/site_perl/5.24.1'
> +sitelib='@LIBDIR@/perl/site_perl/5.26.1'
>  sitelib_stem='@LIBDIR@/perl/site_perl'
> -sitelibexp='@LIBDIR@/perl/site_perl/5.24.1'
> +sitelibexp='@LIBDIR@/perl/site_perl/5.26.1'
>  siteman1dir=''
>  siteman1direxp=''
>  siteman3dir=''
> @@ -1182,17 +1201,17 @@ uvtype='unsigned long'
>  uvuformat='"lu"'
>  uvxformat='"lx"'
>  vaproto='define'
> -vendorarch='@LIBDIR@/perl/vendor_perl/5.24.1/@ARCH@-thread-multi'
> -vendorarchexp='@LIBDIR@/perl/vendor_perl/5.24.1/@ARCH@-thread-multi'
> +vendorarch='@LIBDIR@/perl/vendor_perl/5.26.1/@ARCH@-thread-multi'
> +vendorarchexp='@LIBDIR@/perl/vendor_perl/5.26.1/@ARCH@-thread-multi'
>  vendorbin='@USRBIN@'
>  vendorbinexp='@USRBIN@'
>  vendorhtml1dir=' '
>  vendorhtml1direxp=''
>  vendorhtml3dir=' '
>  vendorhtml3direxp=''
> -vendorlib='@LIBDIR@/perl/vendor_perl/5.24.1'
> +vendorlib='@LIBDIR@/perl/vendor_perl/5.26.1'
>  vendorlib_stem='@LIBDIR@/perl/vendor_perl'
> -vendorlibexp='@LIBDIR@/perl/vendor_perl/5.24.1'
> +vendorlibexp='@LIBDIR@/perl/vendor_perl/5.26.1'
>  vendorman1dir=' '
>  vendorman1direxp=''
>  vendorman3dir=' '
> @@ -1201,8 +1220,8 @@ vendorprefix='@EXECPREFIX@'
>  vendorprefixexp='@EXECPREFIX@'
>  vendorscript='@USRBIN@'
>  vendorscriptexp='@USRBIN@'
> -version='5.24.1'
> -version_patchlevel_string='version 24 subversion 1'
> +version='5.26.1'
> +version_patchlevel_string='version 26 subversion 1'
>  versiononly='undef'
>  vi=''
>  xlibpth='@LIBDIR@/386 @BASELIBDIR@386'
> @@ -1211,10 +1230,10 @@ yaccflags=''
>  zcat=''
>  zip='zip'
>  PERL_REVISION=5
> -PERL_VERSION=24
> +PERL_VERSION=26
>  PERL_SUBVERSION=1
>  PERL_API_REVISION=5
> -PERL_API_VERSION=24
> +PERL_API_VERSION=26
>  PERL_API_SUBVERSION=1
>  PERL_PATCHLEVEL=''
>  PERL_CONFIG_SH=true
> diff --git a/meta/recipes-devtools/perl/perl/config.sh-32 b/meta/recipes-devtools/perl/perl/config.sh-32
> index 7259a0c6ae..229ca103e9 100644
> --- a/meta/recipes-devtools/perl/perl/config.sh-32
> +++ b/meta/recipes-devtools/perl/perl/config.sh-32
> @@ -10,6 +10,8 @@ i64type='long long'
>  ivsize='4'
>  longdblsize='12'
>  longsize='4'
> +doubleinfbytes='0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0xf0, 0x7f'
> +doublenanbytes='0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0xf8, 0x7f'
>  myuname='linux qemux86 2.6.37-rc5-yocto-standard+ #1 preempt mon dec 20 14:21:27 pst 2010 i686 gnulinux '
>  need_va_copy='undef'
>  netdb_host_type='const void *'
> diff --git a/meta/recipes-devtools/perl/perl/config.sh-64 b/meta/recipes-devtools/perl/perl/config.sh-64
> index 6929d3a09d..19637b4dbb 100644
> --- a/meta/recipes-devtools/perl/perl/config.sh-64
> +++ b/meta/recipes-devtools/perl/perl/config.sh-64
> @@ -10,6 +10,8 @@ i64type='long'
>  ivsize='8'
>  longdblsize='16'
>  longsize='8'
> +longdblinfbytes='0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0xff, 0x7f, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00'
> +longdblnanbytes='0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x80, 0xff, 0x7f, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00'
>  myuname='linux qemux86-64 2.6.37-rc5-yocto-standard+ #1 smp preempt mon dec 20 17:19:50 pst 2010 x86_64 gnulinux '
>  need_va_copy='define'
>  netdb_host_type='char *'
> diff --git a/meta/recipes-devtools/perl/perl/debian/fixes/respect_umask.diff b/meta/recipes-devtools/perl/perl/debian/fixes/respect_umask.diff
> index c8663f5357..c9066847a5 100644
> --- a/meta/recipes-devtools/perl/perl/debian/fixes/respect_umask.diff
> +++ b/meta/recipes-devtools/perl/perl/debian/fixes/respect_umask.diff
> @@ -1,4 +1,4 @@
> -From d9d535ef97f57af6e9728075944c33f3b0b5372f Mon Sep 17 00:00:00 2001
> +From 7eef41c8a5ae32ee6ea32163ee38abe9e5156544 Mon Sep 17 00:00:00 2001
>  From: Brendan O'Dea <bod@debian.org>
>  Date: Tue, 8 Mar 2005 19:30:38 +1100
>  Subject: Respect umask during installation
> @@ -8,6 +8,7 @@ site directories.
>  
>  Patch-Name: fixes/respect_umask.diff
>  Upstream-Status: Pending
> +
>  ---
>   cpan/ExtUtils-Install/lib/ExtUtils/Install.pm   | 18 +++++++++---------
>   cpan/ExtUtils-MakeMaker/lib/ExtUtils/MM_Unix.pm | 18 +++++++++---------
> @@ -89,10 +90,10 @@ index 1e8ac4c..3e79121 100644
>           if ($need_filtering) {
>               run_filter($pm_filter, $from, $to);
>  diff --git a/cpan/ExtUtils-MakeMaker/lib/ExtUtils/MM_Unix.pm b/cpan/ExtUtils-MakeMaker/lib/ExtUtils/MM_Unix.pm
> -index f63145c..197f102 100644
> +index 66a24d7..588c54b 100644
>  --- a/cpan/ExtUtils-MakeMaker/lib/ExtUtils/MM_Unix.pm
>  +++ b/cpan/ExtUtils-MakeMaker/lib/ExtUtils/MM_Unix.pm
> -@@ -2118,7 +2118,7 @@ doc__install : doc_site_install
> +@@ -2223,7 +2223,7 @@ doc__install : doc_site_install
>   	$(NOECHO) $(ECHO) INSTALLDIRS not defined, defaulting to INSTALLDIRS=site
>   
>   pure_perl_install :: all
> @@ -101,7 +102,7 @@ index f63145c..197f102 100644
>   };
>   
>       push @m,
> -@@ -2138,7 +2138,7 @@ q{		"$(INST_LIB)" "$(DESTINSTALLPRIVLIB)" \
> +@@ -2243,7 +2243,7 @@ q{		"$(INST_LIB)" "$(DESTINSTALLPRIVLIB)" \
>   
>   
>   pure_site_install :: all
> @@ -110,7 +111,7 @@ index f63145c..197f102 100644
>   };
>       push @m,
>   q{		read "}.$self->catfile('$(SITEARCHEXP)','auto','$(FULLEXT)','.packlist').q{" \
> -@@ -2156,7 +2156,7 @@ q{		"$(INST_LIB)" "$(DESTINSTALLSITELIB)" \
> +@@ -2261,7 +2261,7 @@ q{		"$(INST_LIB)" "$(DESTINSTALLSITELIB)" \
>   		"}.$self->catdir('$(PERL_ARCHLIB)','auto','$(FULLEXT)').q{"
>   
>   pure_vendor_install :: all
> @@ -119,7 +120,7 @@ index f63145c..197f102 100644
>   };
>       push @m,
>   q{		read "}.$self->catfile('$(VENDORARCHEXP)','auto','$(FULLEXT)','.packlist').q{" \
> -@@ -2188,8 +2188,8 @@ doc_vendor_install :: all
> +@@ -2293,8 +2293,8 @@ doc_vendor_install :: all
>       push @m, q{
>   doc_perl_install :: all
>   	$(NOECHO) $(ECHO) Appending installation info to "$(DESTINSTALLARCHLIB)/perllocal.pod"
> @@ -128,9 +129,9 @@ index f63145c..197f102 100644
>  +	-$(NOECHO) umask 022; $(MKPATH) "$(DESTINSTALLARCHLIB)"
>  +	-$(NOECHO) umask 022; $(DOC_INSTALL) \
>   		"Module" "$(NAME)" \
> - 		"installed into" $(INSTALLPRIVLIB) \
> + 		"installed into" "$(INSTALLPRIVLIB)" \
>   		LINKTYPE "$(LINKTYPE)" \
> -@@ -2199,8 +2199,8 @@ doc_perl_install :: all
> +@@ -2304,8 +2304,8 @@ doc_perl_install :: all
>   
>   doc_site_install :: all
>   	$(NOECHO) $(ECHO) Appending installation info to "$(DESTINSTALLARCHLIB)/perllocal.pod"
> @@ -139,9 +140,9 @@ index f63145c..197f102 100644
>  +	-$(NOECHO) umask 022; $(MKPATH) "$(DESTINSTALLARCHLIB)"
>  +	-$(NOECHO) umask 022; $(DOC_INSTALL) \
>   		"Module" "$(NAME)" \
> - 		"installed into" $(INSTALLSITELIB) \
> + 		"installed into" "$(INSTALLSITELIB)" \
>   		LINKTYPE "$(LINKTYPE)" \
> -@@ -2210,8 +2210,8 @@ doc_site_install :: all
> +@@ -2315,8 +2315,8 @@ doc_site_install :: all
>   
>   doc_vendor_install :: all
>   	$(NOECHO) $(ECHO) Appending installation info to "$(DESTINSTALLARCHLIB)/perllocal.pod"
> @@ -150,5 +151,8 @@ index f63145c..197f102 100644
>  +	-$(NOECHO) umask 022; $(MKPATH) "$(DESTINSTALLARCHLIB)"
>  +	-$(NOECHO) umask 022; $(DOC_INSTALL) \
>   		"Module" "$(NAME)" \
> - 		"installed into" $(INSTALLVENDORLIB) \
> + 		"installed into" "$(INSTALLVENDORLIB)" \
>   		LINKTYPE "$(LINKTYPE)" \
> +-- 
> +2.12.3
> +
> diff --git a/meta/recipes-devtools/perl/perl/debian/no_packlist_perllocal.diff b/meta/recipes-devtools/perl/perl/debian/no_packlist_perllocal.diff
> index 7484bec413..295e271557 100644
> --- a/meta/recipes-devtools/perl/perl/debian/no_packlist_perllocal.diff
> +++ b/meta/recipes-devtools/perl/perl/debian/no_packlist_perllocal.diff
> @@ -1,19 +1,21 @@
> -From 240f2f4aeb3850bc0c5370b9fbc3909573bed9b3 Mon Sep 17 00:00:00 2001
> +From d22228b25e80bb52c503176f6199e9801fc421b7 Mon Sep 17 00:00:00 2001
>  From: Brendan O'Dea <bod@debian.org>
>  Date: Tue, 8 Mar 2005 19:30:38 +1100
> -Subject: Don't install .packlist or perllocal.pod for perl or vendor
> +Subject: Don't install .packlist or perllocal.pod for perl or
> + vendor
>  
>  Patch-Name: debian/no_packlist_perllocal.diff
>  Upstream-Status: Pending
> +
>  ---
>   cpan/ExtUtils-MakeMaker/lib/ExtUtils/MM_Unix.pm | 35 +++----------------------
>   1 file changed, 3 insertions(+), 32 deletions(-)
>  
>  diff --git a/cpan/ExtUtils-MakeMaker/lib/ExtUtils/MM_Unix.pm b/cpan/ExtUtils-MakeMaker/lib/ExtUtils/MM_Unix.pm
> -index 570a631..391dc22 100644
> +index c3f5553..5f9673e 100644
>  --- a/cpan/ExtUtils-MakeMaker/lib/ExtUtils/MM_Unix.pm
>  +++ b/cpan/ExtUtils-MakeMaker/lib/ExtUtils/MM_Unix.pm
> -@@ -2122,11 +2122,6 @@ pure_perl_install :: all
> +@@ -2227,11 +2227,6 @@ pure_perl_install :: all
>   };
>   
>       push @m,
> @@ -25,7 +27,7 @@ index 570a631..391dc22 100644
>   q{		"$(INST_LIB)" "$(DESTINSTALLPRIVLIB)" \
>   		"$(INST_ARCHLIB)" "$(DESTINSTALLARCHLIB)" \
>   		"$(INST_BIN)" "$(DESTINSTALLBIN)" \
> -@@ -2158,10 +2153,6 @@ q{		"$(INST_LIB)" "$(DESTINSTALLSITELIB)" \
> +@@ -2263,10 +2258,6 @@ q{		"$(INST_LIB)" "$(DESTINSTALLSITELIB)" \
>   pure_vendor_install :: all
>   	$(NOECHO) umask 022; $(MOD_INSTALL) \
>   };
> @@ -36,7 +38,7 @@ index 570a631..391dc22 100644
>   
>       push @m,
>   q{		"$(INST_LIB)" "$(DESTINSTALLVENDORLIB)" \
> -@@ -2187,37 +2178,19 @@ doc_vendor_install :: all
> +@@ -2292,37 +2283,19 @@ doc_vendor_install :: all
>   
>       push @m, q{
>   doc_perl_install :: all
> @@ -44,7 +46,7 @@ index 570a631..391dc22 100644
>  -	-$(NOECHO) umask 022; $(MKPATH) "$(DESTINSTALLARCHLIB)"
>  -	-$(NOECHO) umask 022; $(DOC_INSTALL) \
>  -		"Module" "$(NAME)" \
> --		"installed into" $(INSTALLPRIVLIB) \
> +-		"installed into" "$(INSTALLPRIVLIB)" \
>  -		LINKTYPE "$(LINKTYPE)" \
>  -		VERSION "$(VERSION)" \
>  -		EXE_FILES "$(EXE_FILES)" \
> @@ -57,7 +59,7 @@ index 570a631..391dc22 100644
>  +	-$(NOECHO) umask 02; $(MKPATH) "$(DESTINSTALLSITEARCH)"
>   	-$(NOECHO) umask 02; $(DOC_INSTALL) \
>   		"Module" "$(NAME)" \
> - 		"installed into" $(INSTALLSITELIB) \
> + 		"installed into" "$(INSTALLSITELIB)" \
>   		LINKTYPE "$(LINKTYPE)" \
>   		VERSION "$(VERSION)" \
>   		EXE_FILES "$(EXE_FILES)" \
> @@ -69,7 +71,7 @@ index 570a631..391dc22 100644
>  -	-$(NOECHO) umask 022; $(MKPATH) "$(DESTINSTALLARCHLIB)"
>  -	-$(NOECHO) umask 022; $(DOC_INSTALL) \
>  -		"Module" "$(NAME)" \
> --		"installed into" $(INSTALLVENDORLIB) \
> +-		"installed into" "$(INSTALLVENDORLIB)" \
>  -		LINKTYPE "$(LINKTYPE)" \
>  -		VERSION "$(VERSION)" \
>  -		EXE_FILES "$(EXE_FILES)" \
> @@ -77,7 +79,7 @@ index 570a631..391dc22 100644
>   
>   } unless $self->{NO_PERLLOCAL};
>   
> -@@ -2226,13 +2199,11 @@ uninstall :: uninstall_from_$(INSTALLDIRS)dirs
> +@@ -2331,13 +2304,11 @@ uninstall :: uninstall_from_$(INSTALLDIRS)dirs
>   	$(NOECHO) $(NOOP)
>   
>   uninstall_from_perldirs ::
> @@ -91,3 +93,6 @@ index 570a631..391dc22 100644
>   };
>   
>       join("",@m);
> +-- 
> +2.12.3
> +
> diff --git a/meta/recipes-devtools/perl/perl/debian/prefix_changes.diff b/meta/recipes-devtools/perl/perl/debian/prefix_changes.diff
> index b681c3e892..01fda61bee 100644
> --- a/meta/recipes-devtools/perl/perl/debian/prefix_changes.diff
> +++ b/meta/recipes-devtools/perl/perl/debian/prefix_changes.diff
> @@ -1,7 +1,8 @@
> -From 914948f026efce02cf0abff8b0312aaad96592ed Mon Sep 17 00:00:00 2001
> +From 9dd4fc60a520a47410f3c3e3ff22142cf3376ea3 Mon Sep 17 00:00:00 2001
>  From: Brendan O'Dea <bod@debian.org>
>  Date: Tue, 8 Mar 2005 19:30:38 +1100
> -Subject: Fiddle with *PREFIX and variables written to the makefile
> +Subject: Fiddle with *PREFIX and variables written to the
> + makefile
>  
>  Fiddle with *PREFIX and variables written to the makefile so that
>  install directories may be changed when make is run by passing
> @@ -10,6 +11,7 @@ modules).
>  
>  Patch-Name: debian/prefix_changes.diff
>  Upstream-Status: Pending
> +
>  ---
>   cpan/ExtUtils-MakeMaker/lib/ExtUtils/MM_Any.pm  | 12 ++++++------
>   cpan/ExtUtils-MakeMaker/lib/ExtUtils/MM_Unix.pm |  3 +--
> @@ -18,10 +20,10 @@ Upstream-Status: Pending
>   4 files changed, 13 insertions(+), 16 deletions(-)
>  
>  diff --git a/cpan/ExtUtils-MakeMaker/lib/ExtUtils/MM_Any.pm b/cpan/ExtUtils-MakeMaker/lib/ExtUtils/MM_Any.pm
> -index 4c00129..1ea2035 100644
> +index 433a8dd..7fb501e 100644
>  --- a/cpan/ExtUtils-MakeMaker/lib/ExtUtils/MM_Any.pm
>  +++ b/cpan/ExtUtils-MakeMaker/lib/ExtUtils/MM_Any.pm
> -@@ -902,8 +902,6 @@ all POD files in MAN1PODS and MAN3PODS.
> +@@ -1063,8 +1063,6 @@ all POD files in MAN1PODS and MAN3PODS.
>   sub manifypods_target {
>       my($self) = shift;
>   
> @@ -30,16 +32,16 @@ index 4c00129..1ea2035 100644
>       my $dependencies  = '';
>   
>       # populate manXpods & dependencies:
> -@@ -919,7 +917,7 @@ END
> +@@ -1080,7 +1078,7 @@ END
>       foreach my $section (qw(1 3)) {
>           my $pods = $self->{"MAN${section}PODS"};
> -         my $p2m = sprintf <<CMD, $] > 5.008 ? " -u" : "";
> --	\$(NOECHO) \$(POD2MAN) --section=$section --perm_rw=\$(PERM_RW)%s
> +         my $p2m = sprintf <<'CMD', $section, $] > 5.008 ? " -u" : "";
> +-	$(NOECHO) $(POD2MAN) --section=%s --perm_rw=$(PERM_RW)%s
>  +	\$(NOECHO) \$(POD2MAN) --section=\$(MAN${section}EXT) --perm_rw=\$(PERM_RW)%s
>   CMD
>           push @man_cmds, $self->split_command($p2m, map {($_,$pods->{$_})} sort keys %$pods);
>       }
> -@@ -1875,9 +1873,11 @@ sub init_INSTALL_from_PREFIX {
> +@@ -2022,9 +2020,11 @@ sub init_INSTALL_from_PREFIX {
>           $self->{SITEPREFIX}   ||= $sprefix;
>           $self->{VENDORPREFIX} ||= $vprefix;
>   
> @@ -55,10 +57,10 @@ index 4c00129..1ea2035 100644
>   
>       my $arch    = $Config{archname};
>  diff --git a/cpan/ExtUtils-MakeMaker/lib/ExtUtils/MM_Unix.pm b/cpan/ExtUtils-MakeMaker/lib/ExtUtils/MM_Unix.pm
> -index 391dc22..4a8e14c 100644
> +index 5f9673e..89213ed 100644
>  --- a/cpan/ExtUtils-MakeMaker/lib/ExtUtils/MM_Unix.pm
>  +++ b/cpan/ExtUtils-MakeMaker/lib/ExtUtils/MM_Unix.pm
> -@@ -3077,8 +3077,7 @@ sub prefixify {
> +@@ -3173,8 +3173,7 @@ sub prefixify {
>       warn "  prefixify $var => $path\n" if $Verbose >= 2;
>       warn "    from $sprefix to $rprefix\n" if $Verbose >= 2;
>   
> @@ -69,10 +71,10 @@ index 391dc22..4a8e14c 100644
>   
>           warn "    cannot prefix, using default.\n" if $Verbose >= 2;
>  diff --git a/cpan/ExtUtils-MakeMaker/t/INST.t b/cpan/ExtUtils-MakeMaker/t/INST.t
> -index 91058bb..e399ced 100644
> +index 3562162..e8d8025 100644
>  --- a/cpan/ExtUtils-MakeMaker/t/INST.t
>  +++ b/cpan/ExtUtils-MakeMaker/t/INST.t
> -@@ -65,9 +65,7 @@ isa_ok( $mm, 'ExtUtils::MakeMaker' );
> +@@ -67,9 +67,7 @@ isa_ok( $mm, 'ExtUtils::MakeMaker' );
>   is( $mm->{NAME}, 'Big::Dummy',  'NAME' );
>   is( $mm->{VERSION}, 0.01,            'VERSION' );
>   
> @@ -84,7 +86,7 @@ index 91058bb..e399ced 100644
>   is( !!$mm->{PERL_CORE}, !!$ENV{PERL_CORE}, 'PERL_CORE' );
>   
>  diff --git a/cpan/ExtUtils-MakeMaker/t/INST_PREFIX.t b/cpan/ExtUtils-MakeMaker/t/INST_PREFIX.t
> -index e8de7c6..3fb3f12 100644
> +index 5f7d395..fde96cb 100644
>  --- a/cpan/ExtUtils-MakeMaker/t/INST_PREFIX.t
>  +++ b/cpan/ExtUtils-MakeMaker/t/INST_PREFIX.t
>  @@ -10,7 +10,7 @@ BEGIN {
> @@ -96,7 +98,7 @@ index e8de7c6..3fb3f12 100644
>   use MakeMaker::Test::Utils;
>   use MakeMaker::Test::Setup::BFD;
>   use ExtUtils::MakeMaker;
> -@@ -62,16 +62,16 @@ like( $stdout->read, qr{
> +@@ -64,16 +64,16 @@ like( $stdout->read, qr{
>                           (?:Writing\ MYMETA.yml\ and\ MYMETA.json\n)?
>   }x );
>   
> @@ -117,3 +119,6 @@ index e8de7c6..3fb3f12 100644
>   
>   
>   my $PREFIX = File::Spec->catdir('foo', 'bar');
> +-- 
> +2.12.3
> +
> diff --git a/meta/recipes-devtools/perl/perl/debian/writable_site_dirs.diff b/meta/recipes-devtools/perl/perl/debian/writable_site_dirs.diff
> index ab373b333c..f52a38bf2f 100644
> --- a/meta/recipes-devtools/perl/perl/debian/writable_site_dirs.diff
> +++ b/meta/recipes-devtools/perl/perl/debian/writable_site_dirs.diff
> @@ -1,4 +1,4 @@
> -From 591c1f9b7d4755bfc59d9665bab1f2ca410de765 Mon Sep 17 00:00:00 2001
> +From 2c82a64e1a27010dfbef5831de2fe73e283763aa Mon Sep 17 00:00:00 2001
>  From: Brendan O'Dea <bod@debian.org>
>  Date: Tue, 8 Mar 2005 19:30:38 +1100
>  Subject: Set umask approproately for site install directories
> @@ -7,15 +7,16 @@ Policy requires group writable site directories
>  
>  Patch-Name: debian/writable_site_dirs.diff
>  Upstream-Status: Pending
> +
>  ---
>   cpan/ExtUtils-MakeMaker/lib/ExtUtils/MM_Unix.pm | 6 +++---
>   1 file changed, 3 insertions(+), 3 deletions(-)
>  
>  diff --git a/cpan/ExtUtils-MakeMaker/lib/ExtUtils/MM_Unix.pm b/cpan/ExtUtils-MakeMaker/lib/ExtUtils/MM_Unix.pm
> -index 197f102..5f1b87f 100644
> +index 588c54b..285bb8c 100644
>  --- a/cpan/ExtUtils-MakeMaker/lib/ExtUtils/MM_Unix.pm
>  +++ b/cpan/ExtUtils-MakeMaker/lib/ExtUtils/MM_Unix.pm
> -@@ -2138,7 +2138,7 @@ q{		"$(INST_LIB)" "$(DESTINSTALLPRIVLIB)" \
> +@@ -2243,7 +2243,7 @@ q{		"$(INST_LIB)" "$(DESTINSTALLPRIVLIB)" \
>   
>   
>   pure_site_install :: all
> @@ -24,7 +25,7 @@ index 197f102..5f1b87f 100644
>   };
>       push @m,
>   q{		read "}.$self->catfile('$(SITEARCHEXP)','auto','$(FULLEXT)','.packlist').q{" \
> -@@ -2199,8 +2199,8 @@ doc_perl_install :: all
> +@@ -2304,8 +2304,8 @@ doc_perl_install :: all
>   
>   doc_site_install :: all
>   	$(NOECHO) $(ECHO) Appending installation info to "$(DESTINSTALLARCHLIB)/perllocal.pod"
> @@ -33,5 +34,8 @@ index 197f102..5f1b87f 100644
>  +	-$(NOECHO) umask 02; $(MKPATH) "$(DESTINSTALLARCHLIB)"
>  +	-$(NOECHO) umask 02; $(DOC_INSTALL) \
>   		"Module" "$(NAME)" \
> - 		"installed into" $(INSTALLSITELIB) \
> + 		"installed into" "$(INSTALLSITELIB)" \
>   		LINKTYPE "$(LINKTYPE)" \
> +-- 
> +2.12.3
> +
> diff --git a/meta/recipes-devtools/perl/perl/letgcc-find-errno.patch b/meta/recipes-devtools/perl/perl/letgcc-find-errno.patch
> index 5161e4c8b6..45fef05ba9 100644
> --- a/meta/recipes-devtools/perl/perl/letgcc-find-errno.patch
> +++ b/meta/recipes-devtools/perl/perl/letgcc-find-errno.patch
> @@ -1,3 +1,8 @@
> +From 4a9fd881468beea2cac3e84ef0530f1cbc07fa68 Mon Sep 17 00:00:00 2001
> +From: Richard Purdie <richard@openedhand.com>
> +Date: Sun, 27 May 2007 21:04:11 +0000
> +Subject: perl: 5.8.7 -> 5.8.8 (from OE)
> +
>  Upstream-Status:Inappropriate [embedded specific]
>  
>  This removes all the logic that perl uses to locate an appropriate
> @@ -10,12 +15,16 @@ external toolchain since perl will search in ${STAGING_INCDIR} for
>  errno.h (when using gcc) and that isn't where it's located - its
>  wherever the external toolchain keeps it's headers.
>  
> -Index: perl-5.12.3/ext/Errno/Errno_pm.PL
> -===================================================================
> ---- perl-5.12.3.orig/ext/Errno/Errno_pm.PL
> -+++ perl-5.12.3/ext/Errno/Errno_pm.PL
> -@@ -17,8 +17,18 @@ unlink "Errno.tmp" if -f "Errno.tmp";
> - open OUT, ">Errno.tmp" or die "Cannot open Errno.tmp: $!";
> +---
> + ext/Errno/Errno_pm.PL | 16 +++++++++++++---
> + 1 file changed, 13 insertions(+), 3 deletions(-)
> +
> +diff --git a/ext/Errno/Errno_pm.PL b/ext/Errno/Errno_pm.PL
> +index c1ec382..db77339 100644
> +--- a/ext/Errno/Errno_pm.PL
> ++++ b/ext/Errno/Errno_pm.PL
> +@@ -16,8 +16,18 @@ unlink "Errno.tmp" if -f "Errno.tmp";
> + open OUT, '>', 'Errno.tmp' or die "Cannot open Errno.tmp: $!";
>   select OUT;
>   my $file;
>  -my @files = get_files();
> @@ -35,7 +44,7 @@ Index: perl-5.12.3/ext/Errno/Errno_pm.PL
>       # MinGW complains "warning: #pragma system_header ignored outside include
>       # file" if the header files are processed individually, so include them
>       # all in .c file and process that instead.
> -@@ -53,7 +63,7 @@ sub process_file {
> +@@ -52,7 +62,7 @@ sub process_file {
>           chomp($file = `cygpath -w "$file"`);
>       }
>   
> @@ -44,3 +53,6 @@ Index: perl-5.12.3/ext/Errno/Errno_pm.PL
>   #    warn "Processing $file\n";
>   
>       local *FH;
> +-- 
> +2.12.3
> +
> diff --git a/meta/recipes-devtools/perl/perl/native-nopacklist-native.patch b/meta/recipes-devtools/perl/perl/native-nopacklist-native.patch
> new file mode 100644
> index 0000000000..15a1166558
> --- /dev/null
> +++ b/meta/recipes-devtools/perl/perl/native-nopacklist-native.patch
> @@ -0,0 +1,29 @@
> +From 36547c650c828347597e24c96fd51fd9b223a508 Mon Sep 17 00:00:00 2001
> +From: Leonardo Sandoval <leonardo.sandoval.gonzalez@linux.intel.com>
> +Date: Mon, 21 Aug 2017 09:20:34 -0700
> +Subject: [PATCH] native-nopacklsit-partial.path
> +
> +Signed-off-by: Leonardo Sandoval <leonardo.sandoval.gonzalez@linux.intel.com>
> +---
> + cpan/ExtUtils-MakeMaker/lib/ExtUtils/MM_Unix.pm | 5 -----
> + 1 file changed, 5 deletions(-)
> +
> +diff --git a/cpan/ExtUtils-MakeMaker/lib/ExtUtils/MM_Unix.pm b/cpan/ExtUtils-MakeMaker/lib/ExtUtils/MM_Unix.pm
> +index 66a24d7..72cb54d 100644
> +--- a/cpan/ExtUtils-MakeMaker/lib/ExtUtils/MM_Unix.pm
> ++++ b/cpan/ExtUtils-MakeMaker/lib/ExtUtils/MM_Unix.pm
> +@@ -2227,11 +2227,6 @@ pure_perl_install :: all
> + };
> + 
> +     push @m,
> +-q{		read "}.$self->catfile('$(PERL_ARCHLIB)','auto','$(FULLEXT)','.packlist').q{" \
> +-		write "}.$self->catfile('$(DESTINSTALLARCHLIB)','auto','$(FULLEXT)','.packlist').q{" \
> +-} unless $self->{NO_PACKLIST};
> +-
> +-    push @m,
> + q{		"$(INST_LIB)" "$(DESTINSTALLPRIVLIB)" \
> + 		"$(INST_ARCHLIB)" "$(DESTINSTALLARCHLIB)" \
> + 		"$(INST_BIN)" "$(DESTINSTALLBIN)" \
> +-- 
> +2.12.3
> +
> diff --git a/meta/recipes-devtools/perl/perl/native-nopacklist-partial.patch b/meta/recipes-devtools/perl/perl/native-nopacklist-partial.patch
> new file mode 100644
> index 0000000000..b100ee171a
> --- /dev/null
> +++ b/meta/recipes-devtools/perl/perl/native-nopacklist-partial.patch
> @@ -0,0 +1,95 @@
> +From 80efb6960eb2e136737681b4235069229d19e70a Mon Sep 17 00:00:00 2001
> +From: Leonardo Sandoval <leonardo.sandoval.gonzalez@linux.intel.com>
> +Date: Mon, 21 Aug 2017 09:20:34 -0700
> +Subject: [PATCH] native-nopacklsit-partial.path
> +
> +Signed-off-by: Leonardo Sandoval <leonardo.sandoval.gonzalez@linux.intel.com>
> +---
> + cpan/ExtUtils-MakeMaker/lib/ExtUtils/MM_Unix.pm | 35 +++----------------------
> + 1 file changed, 3 insertions(+), 32 deletions(-)
> +
> +diff --git a/cpan/ExtUtils-MakeMaker/lib/ExtUtils/MM_Unix.pm b/cpan/ExtUtils-MakeMaker/lib/ExtUtils/MM_Unix.pm
> +index 66a24d7..d691eb3 100644
> +--- a/cpan/ExtUtils-MakeMaker/lib/ExtUtils/MM_Unix.pm
> ++++ b/cpan/ExtUtils-MakeMaker/lib/ExtUtils/MM_Unix.pm
> +@@ -2227,11 +2227,6 @@ pure_perl_install :: all
> + };
> + 
> +     push @m,
> +-q{		read "}.$self->catfile('$(PERL_ARCHLIB)','auto','$(FULLEXT)','.packlist').q{" \
> +-		write "}.$self->catfile('$(DESTINSTALLARCHLIB)','auto','$(FULLEXT)','.packlist').q{" \
> +-} unless $self->{NO_PACKLIST};
> +-
> +-    push @m,
> + q{		"$(INST_LIB)" "$(DESTINSTALLPRIVLIB)" \
> + 		"$(INST_ARCHLIB)" "$(DESTINSTALLARCHLIB)" \
> + 		"$(INST_BIN)" "$(DESTINSTALLBIN)" \
> +@@ -2245,10 +2240,6 @@ q{		"$(INST_LIB)" "$(DESTINSTALLPRIVLIB)" \
> + pure_site_install :: all
> + 	$(NOECHO) $(MOD_INSTALL) \
> + };
> +-    push @m,
> +-q{		read "}.$self->catfile('$(SITEARCHEXP)','auto','$(FULLEXT)','.packlist').q{" \
> +-		write "}.$self->catfile('$(DESTINSTALLSITEARCH)','auto','$(FULLEXT)','.packlist').q{" \
> +-} unless $self->{NO_PACKLIST};
> + 
> +     push @m,
> + q{		"$(INST_LIB)" "$(DESTINSTALLSITELIB)" \
> +@@ -2292,37 +2283,19 @@ doc_vendor_install :: all
> + 
> +     push @m, q{
> + doc_perl_install :: all
> +-	$(NOECHO) $(ECHO) Appending installation info to "$(DESTINSTALLARCHLIB)/perllocal.pod"
> +-	-$(NOECHO) $(MKPATH) "$(DESTINSTALLARCHLIB)"
> +-	-$(NOECHO) $(DOC_INSTALL) \
> +-		"Module" "$(NAME)" \
> +-		"installed into" "$(INSTALLPRIVLIB)" \
> +-		LINKTYPE "$(LINKTYPE)" \
> +-		VERSION "$(VERSION)" \
> +-		EXE_FILES "$(EXE_FILES)" \
> +-		>> "}.$self->catfile('$(DESTINSTALLARCHLIB)','perllocal.pod').q{"
> + 
> + doc_site_install :: all
> +-	$(NOECHO) $(ECHO) Appending installation info to "$(DESTINSTALLARCHLIB)/perllocal.pod"
> +-	-$(NOECHO) $(MKPATH) "$(DESTINSTALLARCHLIB)"
> ++	$(NOECHO) $(ECHO) Appending installation info to "$(DESTINSTALLSITEARCH)/perllocal.pod"
> ++	-$(NOECHO) $(MKPATH) "$(DESTINSTALLSITEARCH)"
> + 	-$(NOECHO) $(DOC_INSTALL) \
> + 		"Module" "$(NAME)" \
> + 		"installed into" "$(INSTALLSITELIB)" \
> + 		LINKTYPE "$(LINKTYPE)" \
> + 		VERSION "$(VERSION)" \
> + 		EXE_FILES "$(EXE_FILES)" \
> +-		>> "}.$self->catfile('$(DESTINSTALLARCHLIB)','perllocal.pod').q{"
> ++		>> "}.$self->catfile('$(DESTINSTALLSITEARCH)','perllocal.pod').q{"
> + 
> + doc_vendor_install :: all
> +-	$(NOECHO) $(ECHO) Appending installation info to "$(DESTINSTALLARCHLIB)/perllocal.pod"
> +-	-$(NOECHO) $(MKPATH) "$(DESTINSTALLARCHLIB)"
> +-	-$(NOECHO) $(DOC_INSTALL) \
> +-		"Module" "$(NAME)" \
> +-		"installed into" "$(INSTALLVENDORLIB)" \
> +-		LINKTYPE "$(LINKTYPE)" \
> +-		VERSION "$(VERSION)" \
> +-		EXE_FILES "$(EXE_FILES)" \
> +-		>> "}.$self->catfile('$(DESTINSTALLARCHLIB)','perllocal.pod').q{"
> + 
> + } unless $self->{NO_PERLLOCAL};
> + 
> +@@ -2331,13 +2304,11 @@ uninstall :: uninstall_from_$(INSTALLDIRS)dirs
> + 	$(NOECHO) $(NOOP)
> + 
> + uninstall_from_perldirs ::
> +-	$(NOECHO) $(UNINSTALL) "}.$self->catfile('$(PERL_ARCHLIB)','auto','$(FULLEXT)','.packlist').q{"
> + 
> + uninstall_from_sitedirs ::
> + 	$(NOECHO) $(UNINSTALL) "}.$self->catfile('$(SITEARCHEXP)','auto','$(FULLEXT)','.packlist').q{"
> + 
> + uninstall_from_vendordirs ::
> +-	$(NOECHO) $(UNINSTALL) "}.$self->catfile('$(VENDORARCHEXP)','auto','$(FULLEXT)','.packlist').q{"
> + };
> + 
> +     join("",@m);
> +-- 
> +2.12.3
> +
> diff --git a/meta/recipes-devtools/perl/perl/perl-PathTools-don-t-filter-out-blib-from-INC.patch b/meta/recipes-devtools/perl/perl/perl-PathTools-don-t-filter-out-blib-from-INC.patch
> index 7dd904140a..141cfaa698 100644
> --- a/meta/recipes-devtools/perl/perl/perl-PathTools-don-t-filter-out-blib-from-INC.patch
> +++ b/meta/recipes-devtools/perl/perl/perl-PathTools-don-t-filter-out-blib-from-INC.patch
> @@ -1,4 +1,4 @@
> -From 90c252cecc38aed5d5faedb30485dd6eee2e54eb Mon Sep 17 00:00:00 2001
> +From 258d748f274925d839ebfd117c1d29755b30f512 Mon Sep 17 00:00:00 2001
>  From: Wenzong Fan <wenzong.fan@windriver.com>
>  Date: Wed, 11 Feb 2015 15:14:40 +0800
>  Subject: [PATCH] perl / PathTools: don't filter out blib from @INC
> @@ -13,21 +13,23 @@ the @INC and cause build errors like:
>  Upstream-Status: Pending
>  
>  Signed-off-by: Wenzong Fan <wenzong.fan@windriver.com>
> +
>  ---
> - dist/PathTools/Makefile.PL | 3 ---
> - 1 file changed, 3 deletions(-)
> + dist/PathTools/Makefile.PL | 1 +
> + 1 file changed, 1 insertion(+)
>  
>  diff --git a/dist/PathTools/Makefile.PL b/dist/PathTools/Makefile.PL
> -index 1b21de4..f562cb2 100644
> +index 71b9a60..50765ce 100644
>  --- a/dist/PathTools/Makefile.PL
>  +++ b/dist/PathTools/Makefile.PL
> -@@ -1,6 +1,3 @@
> --
> --BEGIN { @INC = grep {!/blib/} @INC }
> --
> +@@ -6,6 +6,7 @@
> + # get mixed up and SEGVs ensue.
> + 
> + BEGIN { @INC = grep { $_ ne "blib/arch" and $_ ne "blib/lib" } @INC }
> ++BEGIN { @INC = grep {!/blib/} @INC }
> + 
>   require 5.005;
>   use ExtUtils::MakeMaker;
> - WriteMakefile
>  -- 
> -1.9.1
> +2.12.3
>  
> diff --git a/meta/recipes-devtools/perl/perl/perl-fix-conflict-between-skip_all-and-END.patch b/meta/recipes-devtools/perl/perl/perl-fix-conflict-between-skip_all-and-END.patch
> deleted file mode 100644
> index de946dbec7..0000000000
> --- a/meta/recipes-devtools/perl/perl/perl-fix-conflict-between-skip_all-and-END.patch
> +++ /dev/null
> @@ -1,181 +0,0 @@
> -Some Perl tests fail when run on a cross-compiled target machine. Apply
> -a slightly tweaked upstream patch to fix the problems. Notes:
> -    1. as of 2 Jun 2016, the original patch has been applied to the current
> -       EUMM releases, but has not made it into perl core yet.
> -    2. when the base perl package is upgraded in Yocto, this patch may need
> -       to be replaced by the original upstream version to correctly apply
> -       to the current version of ExtUtils-MakeMaker at that time.
> -
> -[YOCTO #8656]
> -
> -Upstream-Status: Backport
> -
> -Signed-off-by: Bill Randle <william.c.randle@intel.com>
> -
> -From 4a07a3bd18363986112cf2b39dec3c2985353ffb Mon Sep 17 00:00:00 2001
> -From: Francois Perrad <francois.perrad@gadz.org>
> -Date: Mon, 22 Dec 2014 19:04:34 +0100
> -Subject: [PATCH] fix conflict between skip_all and END section
> -
> -since the commit 430de781809a6be3bcd25a349dc40ce54405ab53
> -the test suite fails in cross-compil environment (perl-5.21.6 & perl-5.21.7)
> -like this :
> -
> -    $ ./perl harness -v ../cpan/ExtUtils-MakeMaker/t/INSTALL_BASE.t
> -    ../cpan/ExtUtils-MakeMaker/t/INSTALL_BASE.t ..
> -    1..0 # SKIP cross-compiling and make not available
> -    ok 1 - chdir updir
> -    ok 2 - teardown
> -    # Looks like you planned 0 tests but ran 2.
> -    skipped: cross-compiling and make not available
> -
> -this commit restores the implicit call of plan() at import time of Test::More
> -
> -Signed-off-by: Francois Perrad <francois.perrad@gadz.org>
> ----
> - cpan/ExtUtils-MakeMaker/t/INSTALL_BASE.t     | 7 ++++---
> - cpan/ExtUtils-MakeMaker/t/PL_FILES.t         | 4 ++--
> - cpan/ExtUtils-MakeMaker/t/basic.t            | 4 ++--
> - cpan/ExtUtils-MakeMaker/t/echo.t             | 6 +++---
> - cpan/ExtUtils-MakeMaker/t/min_perl_version.t | 4 ++--
> - cpan/ExtUtils-MakeMaker/t/pm_to_blib.t       | 4 ++--
> - cpan/ExtUtils-MakeMaker/t/recurs.t           | 4 ++--
> - cpan/ExtUtils-MakeMaker/t/several_authors.t  | 4 ++--
> - 8 files changed, 19 insertions(+), 18 deletions(-)
> -
> -diff --git a/cpan/ExtUtils-MakeMaker/t/INSTALL_BASE.t b/cpan/ExtUtils-MakeMaker/t/INSTALL_BASE.t
> -index f27b62c..3bbb3a6 100644
> ---- a/cpan/ExtUtils-MakeMaker/t/INSTALL_BASE.t
> -+++ b/cpan/ExtUtils-MakeMaker/t/INSTALL_BASE.t
> -@@ -15,12 +15,13 @@ $CLEANUP &&= 1; # so always 1 or numerically 0
> - 
> - use MakeMaker::Test::Utils;
> - use MakeMaker::Test::Setup::BFD;
> --use Test::More;
> - use Config;
> - use ExtUtils::MM;
> --plan !MM->can_run(make()) && $ENV{PERL_CORE} && $Config{'usecrosscompile'}
> -+use Test::More
> -+    !MM->can_run(make()) && $ENV{PERL_CORE} && $Config{'usecrosscompile'}
> -     ? (skip_all => "cross-compiling and make not available")
> --    : (tests => 3 + $CLEANUP + @INSTDIRS * (15 + $CLEANUP));
> -+    : ();
> -+plan tests => 3 + $CLEANUP + @INSTDIRS * (15 + $CLEANUP);
> - 
> - my $Is_VMS = $^O eq 'VMS';
> - 
> -diff --git a/cpan/ExtUtils-MakeMaker/t/PL_FILES.t b/cpan/ExtUtils-MakeMaker/t/PL_FILES.t
> -index 0779dbb..85d53a5 100644
> ---- a/cpan/ExtUtils-MakeMaker/t/PL_FILES.t
> -+++ b/cpan/ExtUtils-MakeMaker/t/PL_FILES.t
> -@@ -11,9 +11,9 @@ use File::Temp qw[tempdir];
> - use MakeMaker::Test::Setup::PL_FILES;
> - use MakeMaker::Test::Utils;
> - use Config;
> --use Test::More;
> - use ExtUtils::MM;
> --plan !MM->can_run(make()) && $ENV{PERL_CORE} && $Config{'usecrosscompile'}
> -+use Test::More
> -+    !MM->can_run(make()) && $ENV{PERL_CORE} && $Config{'usecrosscompile'}
> -     ? (skip_all => "cross-compiling and make not available")
> -     : (tests => 9);
> - 
> -diff --git a/cpan/ExtUtils-MakeMaker/t/basic.t b/cpan/ExtUtils-MakeMaker/t/basic.t
> -index 3dd66ad..eddf2e9 100644
> ---- a/cpan/ExtUtils-MakeMaker/t/basic.t
> -+++ b/cpan/ExtUtils-MakeMaker/t/basic.t
> -@@ -20,9 +20,9 @@ use utf8;
> - use MakeMaker::Test::Utils;
> - use MakeMaker::Test::Setup::BFD;
> - use Config;
> --use Test::More;
> - use ExtUtils::MM;
> --plan !MM->can_run(make()) && $ENV{PERL_CORE} && $Config{'usecrosscompile'}
> -+use Test::More
> -+    !MM->can_run(make()) && $ENV{PERL_CORE} && $Config{'usecrosscompile'}
> -     ? (skip_all => "cross-compiling and make not available")
> -     : (tests => 171);
> - use File::Find;
> -diff --git a/cpan/ExtUtils-MakeMaker/t/echo.t b/cpan/ExtUtils-MakeMaker/t/echo.t
> -index 789b85f..c43bc47 100644
> ---- a/cpan/ExtUtils-MakeMaker/t/echo.t
> -+++ b/cpan/ExtUtils-MakeMaker/t/echo.t
> -@@ -14,11 +14,11 @@ use MakeMaker::Test::Utils;
> - use File::Temp;
> - use Cwd 'abs_path';
> - 
> --use Test::More;
> - use ExtUtils::MM;
> --plan !MM->can_run(make()) && $ENV{PERL_CORE} && $Config{'usecrosscompile'}
> -+use Test::More
> -+    !MM->can_run(make()) && $ENV{PERL_CORE} && $Config{'usecrosscompile'}
> -     ? (skip_all => "cross-compiling and make not available")
> --    : ();
> -+    : (tests => 18);
> - 
> - #--------------------- Setup
> - 
> -diff --git a/cpan/ExtUtils-MakeMaker/t/min_perl_version.t b/cpan/ExtUtils-MakeMaker/t/min_perl_version.t
> -index c5d78d6..2ef118d 100644
> ---- a/cpan/ExtUtils-MakeMaker/t/min_perl_version.t
> -+++ b/cpan/ExtUtils-MakeMaker/t/min_perl_version.t
> -@@ -13,9 +13,9 @@ use TieOut;
> - use MakeMaker::Test::Utils;
> - use MakeMaker::Test::Setup::MPV;
> - use Config;
> --use Test::More;
> - use ExtUtils::MM;
> --plan !MM->can_run(make()) && $ENV{PERL_CORE} && $Config{'usecrosscompile'}
> -+use Test::More
> -+    !MM->can_run(make()) && $ENV{PERL_CORE} && $Config{'usecrosscompile'}
> -     ? (skip_all => "cross-compiling and make not available")
> -     : (tests => 36);
> - use File::Path;
> -diff --git a/cpan/ExtUtils-MakeMaker/t/pm_to_blib.t b/cpan/ExtUtils-MakeMaker/t/pm_to_blib.t
> -index f1e348e..ebfa26c 100644
> ---- a/cpan/ExtUtils-MakeMaker/t/pm_to_blib.t
> -+++ b/cpan/ExtUtils-MakeMaker/t/pm_to_blib.t
> -@@ -12,9 +12,9 @@ use ExtUtils::MakeMaker;
> - use MakeMaker::Test::Utils;
> - use MakeMaker::Test::Setup::BFD;
> - use Config;
> --use Test::More;
> - use ExtUtils::MM;
> --plan !MM->can_run(make()) && $ENV{PERL_CORE} && $Config{'usecrosscompile'}
> -+use Test::More
> -+    !MM->can_run(make()) && $ENV{PERL_CORE} && $Config{'usecrosscompile'}
> -     ? (skip_all => "cross-compiling and make not available")
> -     : 'no_plan';
> - 
> -diff --git a/cpan/ExtUtils-MakeMaker/t/recurs.t b/cpan/ExtUtils-MakeMaker/t/recurs.t
> -index 84c09a2..661e0db 100644
> ---- a/cpan/ExtUtils-MakeMaker/t/recurs.t
> -+++ b/cpan/ExtUtils-MakeMaker/t/recurs.t
> -@@ -14,9 +14,9 @@ use File::Temp qw[tempdir];
> - use MakeMaker::Test::Utils;
> - use MakeMaker::Test::Setup::Recurs;
> - use Config;
> --use Test::More;
> - use ExtUtils::MM;
> --plan !MM->can_run(make()) && $ENV{PERL_CORE} && $Config{'usecrosscompile'}
> -+use Test::More
> -+    !MM->can_run(make()) && $ENV{PERL_CORE} && $Config{'usecrosscompile'}
> -     ? (skip_all => "cross-compiling and make not available")
> -     : (tests => 26);
> - 
> -diff --git a/cpan/ExtUtils-MakeMaker/t/several_authors.t b/cpan/ExtUtils-MakeMaker/t/several_authors.t
> -index 1a75a3e..869e9f0 100644
> ---- a/cpan/ExtUtils-MakeMaker/t/several_authors.t
> -+++ b/cpan/ExtUtils-MakeMaker/t/several_authors.t
> -@@ -13,9 +13,9 @@ use TieOut;
> - use MakeMaker::Test::Utils;
> - use MakeMaker::Test::Setup::SAS;
> - use Config;
> --use Test::More;
> - use ExtUtils::MM;
> --plan !MM->can_run(make()) && $ENV{PERL_CORE} && $Config{'usecrosscompile'}
> -+use Test::More
> -+    !MM->can_run(make()) && $ENV{PERL_CORE} && $Config{'usecrosscompile'}
> -     ? (skip_all => "cross-compiling and make not available")
> -     : (tests => 20);
> - use File::Path;
> diff --git a/meta/recipes-devtools/perl/perl/perl-test-customized.patch b/meta/recipes-devtools/perl/perl/perl-test-customized.patch
> index 90e4dcd5fb..1157057209 100644
> --- a/meta/recipes-devtools/perl/perl/perl-test-customized.patch
> +++ b/meta/recipes-devtools/perl/perl/perl-test-customized.patch
> @@ -1,4 +1,4 @@
> -From 64df09205b6ccb5a434a4e53e8e0a32377ab634f Mon Sep 17 00:00:00 2001
> +From 8c8f3f0d19d14dc47307bd647bdfde4adefbcc22 Mon Sep 17 00:00:00 2001
>  From: =?UTF-8?q?An=C3=ADbal=20Lim=C3=B3n?= <anibal.limon@linux.intel.com>
>  Date: Thu, 24 Nov 2016 10:49:55 -0600
>  Subject: [PATCH] The OE core recipies customize some ExtUtils-MakeMaker
> @@ -13,74 +13,85 @@ Upstream-Status: Inappropriate [embedded specific]
>  
>  Signed-off-by: Bill Randle <william.c.randle@intel.com>
>  Signed-off-by: Aníbal Limón <anibal.limon@linux.intel.com>
> +
>  ---
> - t/porting/customized.dat | 16 ++++++++--------
> - 1 file changed, 8 insertions(+), 8 deletions(-)
> + t/porting/customized.dat | 59 +++++++++++++++++++++++++++++++++++++++++++++++-
> + 1 file changed, 58 insertions(+), 1 deletion(-)
>  
>  diff --git a/t/porting/customized.dat b/t/porting/customized.dat
> -index defeae1..b5d3c46 100644
> +index 5014b3e..5b3453f 100644
>  --- a/t/porting/customized.dat
>  +++ b/t/porting/customized.dat
> -@@ -18,12 +18,12 @@ Encode cpan/Encode/bin/unidump 715f47c2fcc661268f3c6cd3de0d27c72b745cd2
> - Encode cpan/Encode/Encode.pm e146861ff2e6aaa62defa4887eade68dd7b17c8e
> - Encode cpan/Encode/encoding.pm 51c19efc9bfe8467d6ae12a4654f6e7f980715bf
> +@@ -1,6 +1,44 @@
> + Digest cpan/Digest/Digest.pm 43f7f544cb11842b2f55c73e28930da50774e081
> + Encode cpan/Encode/Unicode/Unicode.pm 9749692c67f7d69083034de9184a93f070ab4799
>   ExtUtils::Constant cpan/ExtUtils-Constant/t/Constant.t a0369c919e216fb02767a637666bb4577ad79b02
> --ExtUtils::MakeMaker cpan/ExtUtils-MakeMaker/bin/instmodsh 5bc04a0173b8b787f465271b6186220326ae8eef
>  +ExtUtils::MakeMaker cpan/ExtUtils-MakeMaker/bin/instmodsh 2070fe968fa344d89aea1bdc6a8dbb0c467d0612
> - ExtUtils::MakeMaker cpan/ExtUtils-MakeMaker/lib/ExtUtils/Command.pm e3a372e07392179711ea9972087c1105a2780fad
> - ExtUtils::MakeMaker cpan/ExtUtils-MakeMaker/lib/ExtUtils/Command/MM.pm b72721bd6aa9bf7ec328bda99a8fdb63cac6114d
> - ExtUtils::MakeMaker cpan/ExtUtils-MakeMaker/lib/ExtUtils/Liblist.pm 0e1e4c25eddb999fec6c4dc66593f76db34cfd16
> --ExtUtils::MakeMaker cpan/ExtUtils-MakeMaker/lib/ExtUtils/Liblist/Kid.pm bfd2aa00ca4ed251f342e1d1ad704abbaf5a615e
> --ExtUtils::MakeMaker cpan/ExtUtils-MakeMaker/lib/ExtUtils/MakeMaker.pm 5529ae3064365eafd99536621305d52f4ab31b45
> ++ExtUtils::MakeMaker cpan/ExtUtils-MakeMaker/lib/ExtUtils/Command.pm e3a372e07392179711ea9972087c1105a2780fad
> ++ExtUtils::MakeMaker cpan/ExtUtils-MakeMaker/lib/ExtUtils/Command/MM.pm b72721bd6aa9bf7ec328bda99a8fdb63cac6114d
> ++ExtUtils::MakeMaker cpan/ExtUtils-MakeMaker/lib/ExtUtils/Liblist.pm 0e1e4c25eddb999fec6c4dc66593f76db34cfd16
>  +ExtUtils::MakeMaker cpan/ExtUtils-MakeMaker/lib/ExtUtils/Liblist/Kid.pm d593d8fdc5c0ebcb6d3701c70fc6640c50d93455
>  +ExtUtils::MakeMaker cpan/ExtUtils-MakeMaker/lib/ExtUtils/MakeMaker.pm bf9174c70a0e50ff2fee4552c7df89b37d292da1
> - ExtUtils::MakeMaker cpan/ExtUtils-MakeMaker/lib/ExtUtils/MakeMaker/Config.pm bc88b275af73b8faac6abd59a9aad3f625925810
> - ExtUtils::MakeMaker cpan/ExtUtils-MakeMaker/lib/ExtUtils/MakeMaker/FAQ.pod 062e5d14a803fbbec8d61803086a3d7997e8a473
> - ExtUtils::MakeMaker cpan/ExtUtils-MakeMaker/lib/ExtUtils/MakeMaker/Tutorial.pod a8a9cab7d67922ed3d6883c864e1fe29aaa6ad89
> -@@ -33,7 +33,7 @@ ExtUtils::MakeMaker cpan/ExtUtils-MakeMaker/lib/ExtUtils/Mkbootstrap.pm 412e95c3
> - ExtUtils::MakeMaker cpan/ExtUtils-MakeMaker/lib/ExtUtils/Mksymlists.pm 8559ef191b4371d0c381472464856a8a73825b2a
> - ExtUtils::MakeMaker cpan/ExtUtils-MakeMaker/lib/ExtUtils/MM.pm 09d579ed9daea95c3bf47de2e0b8fe3aa0ff6447
> - ExtUtils::MakeMaker cpan/ExtUtils-MakeMaker/lib/ExtUtils/MM_AIX.pm f720c13748293b792f7073aa96e7daecb590b183
> --ExtUtils::MakeMaker cpan/ExtUtils-MakeMaker/lib/ExtUtils/MM_Any.pm 243649a399d293ae7ad0f26b7eab2668aa864ce8
> ++ExtUtils::MakeMaker cpan/ExtUtils-MakeMaker/lib/ExtUtils/MakeMaker/Config.pm bc88b275af73b8faac6abd59a9aad3f625925810
> ++ExtUtils::MakeMaker cpan/ExtUtils-MakeMaker/lib/ExtUtils/MakeMaker/FAQ.pod 062e5d14a803fbbec8d61803086a3d7997e8a473
> ++ExtUtils::MakeMaker cpan/ExtUtils-MakeMaker/lib/ExtUtils/MakeMaker/Tutorial.pod a8a9cab7d67922ed3d6883c864e1fe29aaa6ad89
> ++ExtUtils::MakeMaker cpan/ExtUtils-MakeMaker/lib/ExtUtils/MakeMaker/version.pm 0c970778ac7b437d9363b314dd0ab85b7d83c8cb
> ++ExtUtils::MakeMaker cpan/ExtUtils-MakeMaker/lib/ExtUtils/MakeMaker/version/regex.pm 987b7b5567b95a085a69037a7fa99af2b9bdf4df
> ++ExtUtils::MakeMaker cpan/ExtUtils-MakeMaker/lib/ExtUtils/Mkbootstrap.pm 412e95c37fa10f007f3137e9e142ac30f3427d9f
> ++ExtUtils::MakeMaker cpan/ExtUtils-MakeMaker/lib/ExtUtils/Mksymlists.pm 8559ef191b4371d0c381472464856a8a73825b2a
> ++ExtUtils::MakeMaker cpan/ExtUtils-MakeMaker/lib/ExtUtils/MM.pm 09d579ed9daea95c3bf47de2e0b8fe3aa0ff6447
> ++ExtUtils::MakeMaker cpan/ExtUtils-MakeMaker/lib/ExtUtils/MM_AIX.pm f720c13748293b792f7073aa96e7daecb590b183
>  +ExtUtils::MakeMaker cpan/ExtUtils-MakeMaker/lib/ExtUtils/MM_Any.pm ec39f68802a6fee8daaa914fc7131f40533cfc23
> - ExtUtils::MakeMaker cpan/ExtUtils-MakeMaker/lib/ExtUtils/MM_BeOS.pm b63c90129303b2c17d084fb828aa2c02a2ad85b8
> - ExtUtils::MakeMaker cpan/ExtUtils-MakeMaker/lib/ExtUtils/MM_Cygwin.pm cabd1c97eaa427067811d92807e34c17940c7350
> - ExtUtils::MakeMaker cpan/ExtUtils-MakeMaker/lib/ExtUtils/MM_Darwin.pm 6a185d897a600c34615a6073f4de0ac2f54fef3e
> -@@ -42,7 +42,7 @@ ExtUtils::MakeMaker cpan/ExtUtils-MakeMaker/lib/ExtUtils/MM_MacOS.pm 1f5eb772eed
> - ExtUtils::MakeMaker cpan/ExtUtils-MakeMaker/lib/ExtUtils/MM_NW5.pm de777d7809c0d73e5d4622a29921731c7e5dff48
> - ExtUtils::MakeMaker cpan/ExtUtils-MakeMaker/lib/ExtUtils/MM_OS2.pm 01e8f08a82b5304009574e3ac0892b4066ff7639
> - ExtUtils::MakeMaker cpan/ExtUtils-MakeMaker/lib/ExtUtils/MM_QNX.pm 5340052b58557a6764f5ac9f8b807fefec404a06
> --ExtUtils::MakeMaker cpan/ExtUtils-MakeMaker/lib/ExtUtils/MM_Unix.pm 3c3b93f431b0a51b9592b3d69624dbf5409f6f74
> ++ExtUtils::MakeMaker cpan/ExtUtils-MakeMaker/lib/ExtUtils/MM_BeOS.pm b63c90129303b2c17d084fb828aa2c02a2ad85b8
> ++ExtUtils::MakeMaker cpan/ExtUtils-MakeMaker/lib/ExtUtils/MM_Cygwin.pm cabd1c97eaa427067811d92807e34c17940c7350
> ++ExtUtils::MakeMaker cpan/ExtUtils-MakeMaker/lib/ExtUtils/MM_Darwin.pm 6a185d897a600c34615a6073f4de0ac2f54fef3e
> ++ExtUtils::MakeMaker cpan/ExtUtils-MakeMaker/lib/ExtUtils/MM_DOS.pm fcf2f8e3461deb32e4b3f37a00002477bc8e976e
> ++ExtUtils::MakeMaker cpan/ExtUtils-MakeMaker/lib/ExtUtils/MM_MacOS.pm 1f5eb772eedfce56434161e2ff080e0cb03ee260
> ++ExtUtils::MakeMaker cpan/ExtUtils-MakeMaker/lib/ExtUtils/MM_NW5.pm de777d7809c0d73e5d4622a29921731c7e5dff48
> ++ExtUtils::MakeMaker cpan/ExtUtils-MakeMaker/lib/ExtUtils/MM_OS2.pm 01e8f08a82b5304009574e3ac0892b4066ff7639
> ++ExtUtils::MakeMaker cpan/ExtUtils-MakeMaker/lib/ExtUtils/MM_QNX.pm 5340052b58557a6764f5ac9f8b807fefec404a06
>  +ExtUtils::MakeMaker cpan/ExtUtils-MakeMaker/lib/ExtUtils/MM_Unix.pm 0d6ed5e4bdcdcd28e968e8629a592fdd0cc84818
> - ExtUtils::MakeMaker cpan/ExtUtils-MakeMaker/lib/ExtUtils/MM_UWIN.pm 40397f4cd2d49700b80b4ef490da98add24c5b37
> - ExtUtils::MakeMaker cpan/ExtUtils-MakeMaker/lib/ExtUtils/MM_VMS.pm 147e97fbabb74841f0733dbd5d1b9f3fa51f87c1
> - ExtUtils::MakeMaker cpan/ExtUtils-MakeMaker/lib/ExtUtils/MM_VOS.pm 3f13ed7045ff3443bcb4dd6c95c98b9bd705820f
> -@@ -51,7 +51,7 @@ ExtUtils::MakeMaker cpan/ExtUtils-MakeMaker/lib/ExtUtils/MM_Win95.pm 48e8a2fe176
> - ExtUtils::MakeMaker cpan/ExtUtils-MakeMaker/lib/ExtUtils/MY.pm 6fefe99045b64459905d4721f3a494d8d50f7ab9
> - ExtUtils::MakeMaker cpan/ExtUtils-MakeMaker/lib/ExtUtils/testlib.pm 172778ad21c065a89cd270668eb9f99a7364b41c
> - ExtUtils::MakeMaker cpan/ExtUtils-MakeMaker/t/cd.t 0a71fbd646a7be8358b07b6f64f838243cc0aef4
> --ExtUtils::MakeMaker cpan/ExtUtils-MakeMaker/t/echo.t 37aec8f794c52e037540757eb5b2556f79419ff7
> ++ExtUtils::MakeMaker cpan/ExtUtils-MakeMaker/lib/ExtUtils/MM_UWIN.pm 40397f4cd2d49700b80b4ef490da98add24c5b37
> ++ExtUtils::MakeMaker cpan/ExtUtils-MakeMaker/lib/ExtUtils/MM_VMS.pm 147e97fbabb74841f0733dbd5d1b9f3fa51f87c1
> ++ExtUtils::MakeMaker cpan/ExtUtils-MakeMaker/lib/ExtUtils/MM_VOS.pm 3f13ed7045ff3443bcb4dd6c95c98b9bd705820f
> ++ExtUtils::MakeMaker cpan/ExtUtils-MakeMaker/lib/ExtUtils/MM_Win32.pm 10b2a0651d14ec8b1367e986288533a40bac8380
> ++ExtUtils::MakeMaker cpan/ExtUtils-MakeMaker/lib/ExtUtils/MM_Win95.pm 48e8a2fe1763ba0228a12a8d363af8d033817ba9
> ++ExtUtils::MakeMaker cpan/ExtUtils-MakeMaker/lib/ExtUtils/MY.pm 6fefe99045b64459905d4721f3a494d8d50f7ab9
> ++ExtUtils::MakeMaker cpan/ExtUtils-MakeMaker/lib/ExtUtils/testlib.pm 172778ad21c065a89cd270668eb9f99a7364b41c
> ++ExtUtils::MakeMaker cpan/ExtUtils-MakeMaker/t/cd.t 0a71fbd646a7be8358b07b6f64f838243cc0aef4
>  +ExtUtils::MakeMaker cpan/ExtUtils-MakeMaker/t/echo.t 1a93dd8834e4bb0e5facf08204e782807567b2eb
> - ExtUtils::MakeMaker cpan/ExtUtils-MakeMaker/t/lib/MakeMaker/Test/NoXS.pm 371cdff1b2375017907cfbc9c8f4a31f5ad10582
> - ExtUtils::MakeMaker cpan/ExtUtils-MakeMaker/t/prereq.t 53bda2c549fd13a6b6c13a070ca6bc79883081c0
> - ExtUtils::MakeMaker cpan/ExtUtils-MakeMaker/t/vstrings.t 90035a2bdbf45f15b9c3196d072d7cba7e662871
> -@@ -165,7 +165,7 @@ bignum cpan/bignum/lib/bigrat.pm 7fccc9df30e43dbbae6e5ea91b26c8046545c9a9
> - bignum cpan/bignum/lib/Math/BigFloat/Trace.pm a6b4b995e18f4083252e6dc72e9bef69671893dd
> - bignum cpan/bignum/lib/Math/BigInt/Trace.pm d9596963673760cae3eeeb752c1eeeec50bb2290
> - libnet cpan/libnet/lib/Net/Cmd.pm a44a10c939a4c35f923c4638054178c32f1d283a
> --libnet cpan/libnet/lib/Net/Config.pm 9bd49bf4de0dc438bceee0ef4baf8ba7a6633327
> ++ExtUtils::MakeMaker cpan/ExtUtils-MakeMaker/t/lib/MakeMaker/Test/NoXS.pm 371cdff1b2375017907cfbc9c8f4a31f5ad10582
> ++ExtUtils::MakeMaker cpan/ExtUtils-MakeMaker/t/prereq.t 53bda2c549fd13a6b6c13a070ca6bc79883081c0
> ++ExtUtils::MakeMaker cpan/ExtUtils-MakeMaker/t/vstrings.t 90035a2bdbf45f15b9c3196d072d7cba7e662871
> ++File::Fetch cpan/File-Fetch/lib/File/Fetch.pm bd0b64a1d8ee2ffac39e017f9fa9f78f95514b4d
> + File::Path cpan/File-Path/lib/File/Path.pm fd8ce4420a0c113d3f47dd3223859743655c1da8
> + File::Path cpan/File-Path/t/Path_win32.t 94b9276557ce7f80b91f6fd9bfa7a0cd9bf9683e
> + JSON::PP cpan/JSON-PP/bin/json_pp a7b8de6c201ef177ee82624ee4ca6a47cc1a3b4f
> +@@ -80,4 +118,23 @@ Test::Harness cpan/Test-Harness/lib/TAP/Parser/YAMLish/Writer.pm bf1fbfff9720330
> + Test::Harness cpan/Test-Harness/lib/Test/Harness.pm da2d76ba673372da129060c9d0adb8cf0d91f9f7
> + Test::Simple cpan/Test-Simple/t/Test2/modules/IPC/Driver/Files.t 59648b5745fda06177d81c2c21f55b09f6e129bb
> + autodie cpan/autodie/t/mkdir.t 9e70d2282a3cc7d76a78bf8144fccba20fb37dac
> +-version cpan/version/lib/version.pm a032a751524bdd07a93c945d2a1703abe7ad8ef0
> ++bignum cpan/bignum/lib/bigint.pm 56330354995409dab5073ea92d749f8727e265db
> ++bignum cpan/bignum/lib/bignum.pm e999973f78e6be12282c11bb6328246b31a9576b
> ++bignum cpan/bignum/lib/bigrat.pm 7fccc9df30e43dbbae6e5ea91b26c8046545c9a9
> ++bignum cpan/bignum/lib/Math/BigFloat/Trace.pm a6b4b995e18f4083252e6dc72e9bef69671893dd
> ++bignum cpan/bignum/lib/Math/BigInt/Trace.pm d9596963673760cae3eeeb752c1eeeec50bb2290
> ++libnet cpan/libnet/lib/Net/Cmd.pm a44a10c939a4c35f923c4638054178c32f1d283a
>  +libnet cpan/libnet/lib/Net/Config.pm 2873da5efbffed67934dd297ef6f360b3558cb0b
> - libnet cpan/libnet/lib/Net/Domain.pm 1bbed50f70fd1ff3e1cdf087b19a9349cddfaced
> - libnet cpan/libnet/lib/Net/FTP.pm 40dba553c8d44e1530daec2d07a6e50910401f2e
> - libnet cpan/libnet/lib/Net/FTP/A.pm c570b10730b168990034dcf9cb00e305a100f336
> -@@ -176,6 +176,6 @@ libnet cpan/libnet/lib/Net/FTP/L.pm ac1599c775faee0474710e4f75051c8949f13df2
> - libnet cpan/libnet/lib/Net/Netrc.pm 009cfc08f8a5bf247257acb64a21e1b6ad8b2c9c
> - libnet cpan/libnet/lib/Net/NNTP.pm 6325fc05fd9ef81dc8d461a77b2a3f56ad1ae114
> - libnet cpan/libnet/lib/Net/POP3.pm 2d8065646df80061dae5a9e3465a36a6557165fd
> --libnet cpan/libnet/lib/Net/SMTP.pm f3ed7a177b49ee0ba65ac1c414de797cdbbe6886
> ++libnet cpan/libnet/lib/Net/Domain.pm 1bbed50f70fd1ff3e1cdf087b19a9349cddfaced
> ++libnet cpan/libnet/lib/Net/FTP.pm 40dba553c8d44e1530daec2d07a6e50910401f2e
> ++libnet cpan/libnet/lib/Net/FTP/A.pm c570b10730b168990034dcf9cb00e305a100f336
> ++libnet cpan/libnet/lib/Net/FTP/dataconn.pm ebb554781e74b37dbd57883cff3b668f436dcfe4
> ++libnet cpan/libnet/lib/Net/FTP/E.pm 1ec473a8601f7c8d1584c833202f90744b471f41
> ++libnet cpan/libnet/lib/Net/FTP/I.pm b1d50346092915ca177af988917dbae54b1bd000
> ++libnet cpan/libnet/lib/Net/FTP/L.pm ac1599c775faee0474710e4f75051c8949f13df2
> ++libnet cpan/libnet/lib/Net/Netrc.pm 009cfc08f8a5bf247257acb64a21e1b6ad8b2c9c
> ++libnet cpan/libnet/lib/Net/NNTP.pm 6325fc05fd9ef81dc8d461a77b2a3f56ad1ae114
> ++libnet cpan/libnet/lib/Net/POP3.pm 2d8065646df80061dae5a9e3465a36a6557165fd
>  +libnet cpan/libnet/lib/Net/SMTP.pm f1beb42bfbef4333ed24ad63d5dd1aa5c67b20c7
> - libnet cpan/libnet/lib/Net/Time.pm b3df8bbaa3bc253fbf77e8386c59a1b2aae13627
> - version cpan/version/lib/version.pm ff75e2076be10bd4c05133cd979fda0b38ca8653
> ++libnet cpan/libnet/lib/Net/Time.pm b3df8bbaa3bc253fbf77e8386c59a1b2aae13627
> ++version cpan/version/lib/version.pm ff75e2076be10bd4c05133cd979fda0b38ca8653
>  -- 
> -2.1.4
> +2.12.3
>  
> diff --git a/meta/recipes-devtools/perl/perl/pport_h-fix-require.patch b/meta/recipes-devtools/perl/perl/pport_h-fix-require.patch
> new file mode 100644
> index 0000000000..9e6403a29e
> --- /dev/null
> +++ b/meta/recipes-devtools/perl/perl/pport_h-fix-require.patch
> @@ -0,0 +1,42 @@
> +From c1786cef13f436eb9704f39428bd985f4ac6097b Mon Sep 17 00:00:00 2001
> +From: Leonardo Sandoval <leonardo.sandoval.gonzalez@linux.intel.com>
> +Date: Fri, 6 Oct 2017 14:54:52 -0700
> +Subject: [PATCH] pport_h.PL: require PPPort.pm starting at local directory
> +
> +    | running "build/tmp/work/i586-poky-linux/perl/5.26.1-r0/recipe-sysroot-native/usr/bin/perl-native/perl5.26.1.real" -I../../lib ppport_h.PL
> +    |
> +    | running "build/tmp/work/i586-poky-linux/perl/5.26.1-r0/recipe-sysroot-native/usr/bin/perl-native/perl5.26.1.real" -I../../lib ppport_h.PL
> +    | Can't locate PPPort.pm in @INC (you may need to install the PPPort module) (@INC contains: ../../lib build/tmp/work/i586-poky-linux/perl/5.26.1-r0/recipe-sysroot-native/usr/bin/perl-native/../../../usr/lib/perl-native/perl/site_perl/5.26.1 build/tmp/work/i586-poky-linux/perl/5.26.1-r0/recipe-sysroot-native/usr/bin/perl-native/../../../usr/lib/perl-native/perl/vendor_perl/5.26.1 build/tmp/work/i586-poky-linux/perl/5.26.1-r0/recipe-sysroot-native/usr/bin/perl-native/../../../usr/lib/perl-native/perl/5.26.1 build/tmp/work/x86_64-linux/perl-native/5.26.1-r0/recipe-sysroot-native/usr/lib/perl-native/perl/site_perl/5.26.1 build/tmp/work/x86_64-linux/perl-native/5.26.1-r0/recipe-sysroot-native/usr/lib/perl-native/perl/vendor_perl/5.26.1 build/tmp/work/x86_64-linux/perl-native/5.26.1-r0/recipe-sysroot-native/usr/lib/perl-native/perl/5.26.1) at ppport_h.PL line 17.
> +    |
> +    | Can't locate PPPort.pm in @INC (you may need to install the PPPort module) (@INC contains: ../../lib build/tmp/work/i586-poky-linux/perl/5.26.1-r0/recipe-sysroot-native/usr/bin/perl-native/../../../usr/lib/perl-native/perl/site_perl/5.26.1 build/tmp/work/i586-poky-linux/perl/5.26.1-r0/recipe-sysroot-native/usr/bin/perl-native/../../../usr/lib/perl-native/perl/vendor_perl/5.26.1 build/tmp/work/i586-poky-linux/perl/5.26.1-r0/recipe-sysroot-native/usr/bin/perl-native/../../../usr/lib/perl-native/perl/5.26.1 build/tmp/work/x86_64-linux/perl-native/5.26.1-r0/recipe-sysroot-native/usr/lib/perl-native/perl/site_perl/5.26.1 build/tmp/work/x86_64-linux/perl-native/5.26.1-r0/recipe-sysroot-native/usr/lib/perl-native/perl/vendor_perl/5.26.1 build/tmp/work/x86_64-linux/perl-native/5.26.1-r0/recipe-sysroot-native/usr/lib/perl-native/perl/5.26.1) at ppport_h.PL line 17.
> +    | "build/tmp/work/i586-poky-linux/perl/5.26.1-r0/recipe-sysroot-native/usr/bin/perl-native/perl5.26.1.real" -I../../lib ppport_h.PL failed: 512
> +    |
> +    | "build/tmp/work/i586-poky-linux/perl/5.26.1-r0/recipe-sysroot-native/usr/bin/perl-native/perl5.26.1.real" -I../../lib ppport_h.PL failed: 512
> +    | removing temporary file PPPort.pm
> +    |
> +    | removing temporary file PPPort.pm
> +    | makefile:395: recipe for target 'makeppport' failed
> +    | make[1]: *** [makeppport] Error 2
> +
> +Upstream-Status: Innapropiate [OE-Core specific]
> +
> +Signed-off-by: Leonardo Sandoval <leonardo.sandoval.gonzalez@linux.intel.com>
> +---
> + cpan/Devel-PPPort/ppport_h.PL | 2 +-
> + 1 file changed, 1 insertion(+), 1 deletion(-)
> +
> +diff --git a/cpan/Devel-PPPort/ppport_h.PL b/cpan/Devel-PPPort/ppport_h.PL
> +index e8c7c1e..b7877b3 100644
> +--- a/cpan/Devel-PPPort/ppport_h.PL
> ++++ b/cpan/Devel-PPPort/ppport_h.PL
> +@@ -14,6 +14,6 @@
> + ################################################################################
> + 
> + package Devel::PPPort;
> +-require "PPPort.pm";
> ++require "./PPPort.pm";
> + rename 'ppport.h', 'ppport.old' if -f 'ppport.h';
> + unlink "ppport.old" if WriteFile("ppport.h") && -f 'ppport.h';
> +-- 
> +2.12.3
> +
> diff --git a/meta/recipes-devtools/perl/perl/utils-Makefile-force-miniperl.patch b/meta/recipes-devtools/perl/perl/utils-Makefile-force-miniperl.patch
> new file mode 100644
> index 0000000000..325fe57b1d
> --- /dev/null
> +++ b/meta/recipes-devtools/perl/perl/utils-Makefile-force-miniperl.patch
> @@ -0,0 +1,28 @@
> +From b80278a9ac843ba3b1ffc7ba1c567df9ce6e0eb0 Mon Sep 17 00:00:00 2001
> +From: Leonardo Sandoval <leonardo.sandoval.gonzalez@linux.intel.com>
> +Date: Mon, 9 Oct 2017 09:34:17 -0700
> +Subject: [PATCH] utils/Makefile.PL: force miniperl usage
> +
> +Upstream-Status: Innapropiate [OE-Core specific]
> +
> +Signed-off-by: Leonardo Sandoval <leonardo.sandoval.gonzalez@linux.intel.com>
> +---
> + utils/Makefile.PL | 2 +-
> + 1 file changed, 1 insertion(+), 1 deletion(-)
> +
> +diff --git a/utils/Makefile.PL b/utils/Makefile.PL
> +index f9f80ed..c6b57d7 100644
> +--- a/utils/Makefile.PL
> ++++ b/utils/Makefile.PL
> +@@ -21,7 +21,7 @@ my $fh = open_new($target, undef, {by => $0}, 1);
> + 
> + # These use the Cwd extension.  For statically-built perls, we
> + # need perl, not just miniperl.
> +-my $perl = defined $Config{usedl} ? '../miniperl' : '../perl';
> ++my $perl = '../miniperl'; # defined $Config{usedl} ? '../miniperl' : '../perl';
> + 
> + print $fh <<"EOT";
> + PERL = $perl
> +-- 
> +2.12.3
> +
> diff --git a/meta/recipes-devtools/perl/perl/write_buildcustomize.patch b/meta/recipes-devtools/perl/perl/write_buildcustomize.patch
> new file mode 100644
> index 0000000000..6d40f84a27
> --- /dev/null
> +++ b/meta/recipes-devtools/perl/perl/write_buildcustomize.patch
> @@ -0,0 +1,40 @@
> +From f1888a44b9720d31c35caf3d26a79824b066d43f Mon Sep 17 00:00:00 2001
> +From: Leonardo Sandoval <leonardo.sandoval.gonzalez@linux.intel.com>
> +Date: Fri, 6 Oct 2017 12:13:20 -0700
> +Subject: [PATCH] write_buildcustomize.pl: start at local directory when
> + looking for lib/buildcustomize.pl
> +
> +Otherwise, on the do_compile step we observe the following:
> +
> +    | mv -f miniperl miniperl-target
> +    | ln -s hostperl miniperl
> +    | # ./miniperl -w -Ilib -Idist/Exporter/lib -MExporter -e '<?>' || sh -c 'echo >&2 Failed to build miniperl.  Please run make minitest; exit 1'
> +    | ./miniperl -Ilib -f write_buildcustomize.pl
> +    | do "lib/buildcustomize.pl" failed, '.' is no longer in @INC; did you mean do "./lib/buildcustomize.pl"? at write_buildcustomize.pl line 101.
> +    | Can't load generated lib/buildcustomize.pl:  at write_buildcustomize.pl line 112.
> +    | makefile:373: recipe for target 'lib/buildcustomize.pl' failed
> +    | make[1]: *** [lib/buildcustomize.pl] Error 2
> +
> +Upstream-Status: Pending
> +
> +Signed-off-by: Leonardo Sandoval <leonardo.sandoval.gonzalez@linux.intel.com>
> +---
> + write_buildcustomize.pl | 2 +-
> + 1 file changed, 1 insertion(+), 1 deletion(-)
> +
> +diff --git a/write_buildcustomize.pl b/write_buildcustomize.pl
> +index 8666a6b..6b4de3a 100644
> +--- a/write_buildcustomize.pl
> ++++ b/write_buildcustomize.pl
> +@@ -3,7 +3,7 @@
> + use strict;
> + 
> + my $osname = $^O;
> +-my $file = 'lib/buildcustomize.pl';
> ++my $file = './lib/buildcustomize.pl';
> + 
> + if ( @ARGV % 2 ) {
> +     my $dir = shift;
> +-- 
> +2.12.3
> +
> diff --git a/meta/recipes-devtools/perl/perl_5.24.1.bb b/meta/recipes-devtools/perl/perl_5.26.1.bb
> similarity index 94%
> rename from meta/recipes-devtools/perl/perl_5.24.1.bb
> rename to meta/recipes-devtools/perl/perl_5.26.1.bb
> index 1e1d4f50fc..fded3d8dbc 100644
> --- a/meta/recipes-devtools/perl/perl_5.24.1.bb
> +++ b/meta/recipes-devtools/perl/perl_5.26.1.bb
> @@ -63,8 +63,14 @@ SRC_URI += " \
>          file://ext-ODBM_File-t-odbm.t-fix-the-path-of-dbmt_common.p.patch \
>          file://perl-PathTools-don-t-filter-out-blib-from-INC.patch \
>          file://perl-errno-generation-gcc5.patch \
> -        file://perl-fix-conflict-between-skip_all-and-END.patch \
>          file://perl-test-customized.patch \
> +        file://write_buildcustomize.patch \
> +        file://avoid-manifypods.patch \
> +        file://PPPort_pm-fix-require.patch \
> +        file://pport_h-fix-require.patch \
> +        file://PPPort_xs-fix-require.patch \
> +        file://collade-makefile-use-local-mkheader.patch \
> +        file://utils-Makefile-force-miniperl.patch \
>  "
>  
>  # Fix test case issues
> @@ -73,8 +79,8 @@ SRC_URI_append_class-target = " \
>              file://test/ext-DynaLoader-t-DynaLoader.t-fix-calling-dl_findfil.patch \
>             "
>  
> -SRC_URI[md5sum] = "af6a84c7c3e2b8b269c105a5db2f6d53"
> -SRC_URI[sha256sum] = "03a77bac4505c270f1890ece75afc7d4b555090b41aa41ea478747e23b2afb3f"
> +SRC_URI[md5sum] = "70e988b4318739b0cf3ad5e120bfde88"
> +SRC_URI[sha256sum] = "fe8208133e73e47afc3251c08d2c21c5a60160165a8ab8b669c43a420e4ec680"
>  
>  inherit perlnative siteinfo
>  
> @@ -312,6 +318,8 @@ PACKAGESPLITFUNCS_prepend = "split_perl_packages "
>  python split_perl_packages () {
>      libdir = d.expand('${libdir}/perl/${PV}')
>      do_split_packages(d, libdir, 'auto/([^.]*)/[^/]*\.(so|ld|ix|al)', 'perl-module-%s', 'perl module %s', recursive=True, match_path=True, prepend=False)
> +    do_split_packages(d, libdir, 'auto/([^.]*)/.*\.[a]', 'perl-module-%s-staticdev', 'perl module %s', recursive=True, match_path=True, prepend=False)
> +    do_split_packages(d, libdir, 'auto/([^.]*)/.*\.[^a]', 'perl-module-%s', 'perl module %s', recursive=True, match_path=True, prepend=False)
>      do_split_packages(d, libdir, 'Module/([^\/]*)\.pm', 'perl-module-%s', 'perl module %s', recursive=True, allow_dirs=False, match_path=True, prepend=False)
>      do_split_packages(d, libdir, 'Module/([^\/]*)/.*', 'perl-module-%s', 'perl module %s', recursive=True, allow_dirs=False, match_path=True, prepend=False)
>      do_split_packages(d, libdir, '(^(?!(CPAN\/|CPANPLUS\/|Module\/|unicore\/|auto\/)[^\/]).*)\.(pm|pl|e2x)', 'perl-module-%s', 'perl module %s', recursive=True, allow_dirs=False, match_path=True, prepend=False)
> -- 
> 2.12.3
> 
> -- 
> _______________________________________________
> Openembedded-core mailing list
> Openembedded-core@lists.openembedded.org
> http://lists.openembedded.org/mailman/listinfo/openembedded-core


