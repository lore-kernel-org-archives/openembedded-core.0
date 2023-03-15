Return-Path: <wangmy@fujitsu.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id C2323C6FD1D
	for <webhook@archiver.kernel.org>; Wed, 15 Mar 2023 11:09:59 +0000 (UTC)
Received: from mail1.bemta37.messagelabs.com (mail1.bemta37.messagelabs.com [85.158.142.1])
 by mx.groups.io with SMTP id smtpd.web10.5030.1678878590194132957
 for <openembedded-core@lists.openembedded.org>;
 Wed, 15 Mar 2023 04:09:50 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@fujitsu.com header.s=170520fj header.b=Zo4se87J;
 spf=pass (domain: fujitsu.com, ip: 85.158.142.1, mailfrom: wangmy@fujitsu.com)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=fujitsu.com;
	s=170520fj; t=1678878588; i=@fujitsu.com;
	bh=3t7EJ8pPyLej7Djq3z6as6LdkqoUjClu8a4KFyHnUJs=;
	h=From:To:CC:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type;
	b=Zo4se87JMK+DcUoNcfJZ1PCs7lxTM5A4AwWlI0YJvkXqEl1NK9pSVcWOvZ+z9Pzyt
	 /pbRpwmXNQ39ftz7vSFlC1A1eQw7hvYfFUxHuVf9lUsl9pgIWNu7j14icAcLnUAf+0
	 5xY01PrzXqeslJ0gGXO/qTCuigyWDI1kfH+j1JVI5N9Lh76Khw5TOFLZCzdPLCwufm
	 /Iy4rERaEw5p8mK4p5YNg6hWjUTvEIPGqV86P0+DaUufUMiL5tqZr/foICtYnGfTPE
	 Cl/fzVGT1nJG300YbSBlq7QdH7A/Gy/uTAgHJ+JotLrWd0KCX3dfxhZjrJ4qQQv1nq
	 P6OIvRKM1DC+Q==
X-Brightmail-Tracker: H4sIAAAAAAAAA+NgFrrNIsWRWlGSWpSXmKPExsViZ8ORpFu1XDD
  FYP4XRYs7P9+xW9ybv4DNgcnj3MYVjB4dv68zBjBFsWbmJeVXJLBmPL9+gbXgml/FvGVHWRsY
  fzl2MXJxCAlsZJTY+mMaG4SzhEni4M4Oxi5GTiBnD6PEy80OIDabgJTEjfv/gYo4OEQE9CSu/
  hMFCTMLOEo0z7/PBmILCzhINH2azg5iswioSny5cYMJxOYVcJI4tGIFWI2EgILElIfvmUFsTg
  FniUe/njFBrHKS+LBiLgtEvaDEyZlPWCDmS0gcfPGCGaJXUWL25WYWCLtConH6ISYIW03i6rl
  NzBMYBWchaZ+FpH0BI9MqRrPi1KKy1CJdI72kosz0jJLcxMwcvcQq3US91FLdvPyikgxdQ73E
  8mK91OJiveLK3OScFL281JJNjMBwTilO/rSDcV3vX71DjJIcTEqivH/WCKQI8SXlp1RmJBZnx
  BeV5qQWH2KU4eBQkuDlWyKYIiRYlJqeWpGWmQOMLZi0BAePkghvRD1Qmre4IDG3ODMdInWKUZ
  fj45+Le5mFWPLy81KlxHnblwIVCYAUZZTmwY2AxfklRlkpYV5GBgYGIZ6C1KLczBJU+VeM4hy
  MSsK8y0Cm8GTmlcBtegV0BBPQEbzzBECOKElESEk1MHlXy+o9PXbG9aQV3ys9+cmu+8wWhBp3
  zt951ZrHZPUfRVHe7TtO5CzU6zU1ebHMKG/WH5+scxNe7FmccMVsoYvfyw0ffbqmbvHnCzw0I
  2iT241T5yeXlu9/3ZHLnrazfQFzs/RDN5fmCqGSF0u6wqtSYqVWLt/N2xOQZO+oOXPhbt5bb1
  vC32xM8vjTmTF5dfzO7Pw0DSaRw/NPcU+//WrVy48ppd8tYx5apm87udSo1lJ//ZzqMsfbUpq
  Ky6/eYihndv/67ahx5I6Ju4SMa9p4vshWNSff62KRj2xbGyW7P1Mm/Lqr9K0YR1ex7arHo+Yl
  OD+YYVHo6BT7ed6F10vXfiv5E1epcirkOsvzBiWW4oxEQy3mouJEAFiwDXtuAwAA
X-Env-Sender: wangmy@fujitsu.com
X-Msg-Ref: server-3.tower-745.messagelabs.com!1678878586!721591!1
X-Originating-IP: [62.60.8.98]
X-SYMC-ESS-Client-Auth: outbound-route-from=pass
X-StarScan-Received: 
X-StarScan-Version: 9.103.1; banners=-,-,-
X-VirusChecked: Checked
Received: (qmail 21845 invoked from network); 15 Mar 2023 11:09:46 -0000
Received: from unknown (HELO n03ukasimr03.n03.fujitsu.local) (62.60.8.98)
  by server-3.tower-745.messagelabs.com with ECDHE-RSA-AES256-GCM-SHA384 encrypted SMTP; 15 Mar 2023 11:09:46 -0000
Received: from n03ukasimr03.n03.fujitsu.local (localhost [127.0.0.1])
	by n03ukasimr03.n03.fujitsu.local (Postfix) with ESMTP id DDC451B0;
	Wed, 15 Mar 2023 11:09:45 +0000 (GMT)
Received: from R01UKEXCASM121.r01.fujitsu.local (R01UKEXCASM121 [10.183.43.173])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-SHA384 (256/256 bits))
	(No client certificate requested)
	by n03ukasimr03.n03.fujitsu.local (Postfix) with ESMTPS id D2C6D1AC;
	Wed, 15 Mar 2023 11:09:45 +0000 (GMT)
Received: from localhost.localdomain (10.167.225.33) by
 R01UKEXCASM121.r01.fujitsu.local (10.183.43.173) with Microsoft SMTP Server
 (TLS) id 15.0.1497.42; Wed, 15 Mar 2023 11:09:43 +0000
From: <wangmy@fujitsu.com>
To: <openembedded-core@lists.openembedded.org>
CC: Upgrade Helper <uh@not.set>, Wang Mingyu <wangmy@fujitsu.com>
Subject: [OE-core] [PATCH] python3-scons: upgrade 4.4.0 -> 4.5.1
Date: Wed, 15 Mar 2023 19:09:05 +0800
Message-ID: <1678878545-19387-5-git-send-email-wangmy@fujitsu.com>
X-Mailer: git-send-email 1.8.3.1
In-Reply-To: <1678878545-19387-1-git-send-email-wangmy@fujitsu.com>
References: <1678878545-19387-1-git-send-email-wangmy@fujitsu.com>
MIME-Version: 1.0
Content-Type: text/plain
X-Originating-IP: [10.167.225.33]
X-ClientProxiedBy: G08CNEXCHPEKD07.g08.fujitsu.local (10.167.33.80) To
 R01UKEXCASM121.r01.fujitsu.local (10.183.43.173)
X-Virus-Scanned: ClamAV using ClamSMTP
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Wed, 15 Mar 2023 11:09:59 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/178539

From: Upgrade Helper <uh@not.set>

Changelog:
==========
- Fix a problem in 4.5.0 where using something like the following code
  will cause a Clone()'d environment to share the CPPDEFINES with the
  original Environment() which was cloned. Causing leakage of changes
  to CPPDEFINES when they should be completely independent after the Clone.
      env=Environment(CPPDEFINES=['a'])
      env.Append(CPPDEFINES=['b']) (or AppendUnique,Prepend,PrependUnique)
      env1=env.Clone()
      env1.Append(CPPDEFINES=['c']) (or any other modification, but not overwriting CPPDEFINES
  Now env['CPPDEFINES'] will contain 'c' when it should not.
- Do not initialize DefaultEnvironment when calling EnsureSConsVersion(),
  EnsurePythonVersion(), Exit(), GetLaunchDir() and SConscriptChdir().
- Remove unused private method SConsEnvironment._exceeds_version().
- Added ValidateOptions() which will check that all command line options are in either
  those specified by SCons itself, or by AddOption() in SConstruct/SConscript.  It should
  not be called until all AddOption() calls are completed. Resolves Issue #4187
- Refactored SCons/Taskmaster into a package. Moved SCons/Jobs.py into that package.
  NOTE: If you hook into SCons.Jobs, you'll have to change that to use SCons.Taskmaster.Jobs
- Changed the Taskmaster trace logic to use python's logging module. The output formatting
  should remain (mostly) the same. Minor update to unittest for this to adjust for 1 less newline.
- Migrated logging logic for --taskmastertrace to use Python's logging module. Added logging
  to NewParallel Job class (Andrew Morrow's new parallel job implementation)
- Ninja: Fix execution environment sanitation for launching ninja. Previously if you set an
  execution environment variable set to a python list it would crash. Now it
  will create a string joining the list with os.pathsep
- Move execution environment sanitation from Action._subproc() to
  SCons.Util.sanitize_shell_env(ENV)
- Moved rpm and debian directories under packaging
- Added logic to help packagers enable reproducible builds into packaging/etc/. Please
  read packaging/etc/README.txt if you are interested.
- Added --experimental=tm_v2, which enables Andrew Morrow's new NewParallel Job implementation.
  This should scale much better for highly parallel builds. You can also enable this via SetOption().
- Fixed command line argument --diskcheck: previously a value of 'none' was ignored.
  SetOption('diskcheck','none') is unaffected, as it did not have the problem.
- Added overrides argument to SCons.Subst.scons_subst(), subst_list(), subst(), and Action's process(),
  strfunction(). This allows passing a dictionary of envvars to override when evaluating subst()'d strings/lists
- Fixed Issue #4275 - when outputting compilation db and TEMPFILE was in use, the compilation db would have
  command lines using the generated tempfile for long command lines, instead of the full command line for
  the compilation step for the source/target pair.
- Renamed the qt tools to qt3 since the logic in that tool is only for QT version 3.  Renamed all env vars
  which affect qt3 from QT_ to QT3_.  If you are still using SCons to build QT 3 code, you'll need to update
  your SConscripts.  Note that using 'qt' tool has been deprecated for some time.
- Added JAVAPROCESSORPATH construction variable which populates -processorpath.
- Updated JavaScanner to scan JAVAPROCESSORPATH.
- Added FILE_ENCODING, to allow explicitly setting the text encoding for files
  written by the Textfile() and Substfile() builders. If not specified, Textfile() and Substfile() builders
  will write files as UTF-8. Fixed Issue #4302.
- Add newline to end of compilation db (compile_commands.json).
- Added error message to handle the case when SCons attempts to retrieve all the targets
  for a specified builder from the CacheDir, fails to do so, and then runs into an error
  when deleting the files which were retrieved. Previously if this happened there was no
  errors or warnings.
- Fix issue #2757, where Configure checks that perform a check which reads a modified source
  (including program, source or header file(s)) would incorrectly mark that file "up to date" so the
  actual build would not see the file as modified. Leading to incorrect incremental builds.
  Now configure checks now clear node info for non conftest nodes, so they will be re-evaluated for
  the real taskmaster run when the build commences.
- Avoid returning UniqueList for `children` and other `Executor` APIs. This type
  iterates more slowly than the builtin types. Also simplify uniquer_hashables to
  use an faster implementation under the assumption of ordered dictionaries.
- Fixed runtest.py failure on Windows caused by excessive escaping of the path to python.exe.
- Run LaTeX after biber/bibtex only if necessary
- Added -fsanitize support to ParseFlags().  This will propagate to CCFLAGS and LINKFLAGS.
- A list argument as the source to the Copy() action function is now
  correctly handled by converting elements to string. Copy errors out
  if asked to copy a list to an existing non-directory destination.
  Both the implementation and the strfunction which prints the progress
  message were adjusted. Fixes #3009.
- doc: EnsureSConsVersion, EnsurePythonVersion, Exit, GetLaunchDir and
  SConscriptChdir are now listed as Global functions only; the
  Environment versions still work but are not documented.
- The Java scanner processing of JAVACLASSPATH for dependencies was
  changed to split on os.pathsep instead of space, to match usage of
  passing a path string like "xxx:yyy:zzz". This is not portable -
  passing a POSIX-style path string (with ':') won't work on Windows
  (';') - which is now documented with a hint to use a list instead
  to be portable. Splitting on space broke paths with embedded spaces.
  Fixes #4243.
- Cleanup: make sure BoolVariable usage in tests and examples uses Python
  boolean values instead of 0/1.
- Stop telling people to run "python setup.py install" in the User Guide.
  Adds new content on using virtualenvs to be able to have multiple
  different SCons versions available on one system.
- Added the "DefaultEnvironment(tools=[])" stanza to a number of tests
  that are known to be particularly slow.  It's still just a tiny
  speedup, but the Windows CI had been occasionally timing out,
  so maybe this helps a bit.
- Remove an extra existence check in one ninja test that caused it
  to be skipped on some otherwise-valid Windows installations.
- test framework tests now pass on Linux and Windows (the latter can
  still run into problems on some configurations), and automated
  tests are now run on changes in this area so future problems can
  be spotted.
- The single-file Util module was split into a package with a few
  functional areas getting their own files - Util.py had grown to
  over 2100 lines.
- Add a zipapp package of scons-local: can use SCons from a local
  file which does not need unpacking.
- Additional explanations for MSVSProject and MSVSSolution builders.
- Fix a problem (present in 4.4.0 only) where a Java inner class could
  not be cached because the emitted filename contained a '$' and when
  looked up through a node ended up generating a Python SyntaxError
  because it was passed through scons_subst().
- Have the gfortran tool do a better job of honoring user preferences
  for the dialect tools (F77, F90, F03 and F09, as well as the shared-library
  equivalents SHF77,  SHF90, SHF03, SHF09). Previously these were
  unconditionally overwritten to 'gfortran'; the change should be more
  in line with expectations of how these variables should work.
  Also cleaned a few Fortran tests - test behavior does not change.
- Updated MSVC documentation - adds "version added" annotations on recently
  added construction variables and provides a version-mapping table.
- Add Python 3.12 support, and indicate 3.11/3.12 support in package.
  3.12 is in alpha for this SCons release, the bytecode sequences
  embedded in SCons/ActionTests.py may need to change later, but
  based on what is known now, 3.12 itself should work with this release.
- Add "append" keyword argument to Configure context's CheckLib and
  CheckLibWithHeader to control whether to append or prepend (issue #2767)
  Also added "unique" keyword, to control whether a library is added
  or not if it is already in the $LIBS construction var in the
  configure context. (issue #2768).
- Completely refactored the CPPDEFINES logic in Append/AppendUnique/Prepend/PrependUnique
  This change fixes the following GH Issues:
  - GH Issue #3876 - Append() and AppendUnique() will handle CPPDEFINES the same
  - GH Issue #4254 - Make handling tuples in CPPDEFINES consistent.
  - We no longer sort the keys added to CPPDEFINES by their dictionary keys.
    We take advantage that their order is now stable based on insertion order
    in Python 3.5+
  - Added/modifed unit and system tests to verify these changes.

Signed-off-by: Wang Mingyu <wangmy@fujitsu.com>
---
 .../python/{python3-scons_4.4.0.bb => python3-scons_4.5.1.bb}   | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)
 rename meta/recipes-devtools/python/{python3-scons_4.4.0.bb => python3-scons_4.5.1.bb} (90%)

diff --git a/meta/recipes-devtools/python/python3-scons_4.4.0.bb b/meta/recipes-devtools/python/python3-scons_4.5.1.bb
similarity index 90%
rename from meta/recipes-devtools/python/python3-scons_4.4.0.bb
rename to meta/recipes-devtools/python/python3-scons_4.5.1.bb
index ad1149597f..279347ac9c 100644
--- a/meta/recipes-devtools/python/python3-scons_4.4.0.bb
+++ b/meta/recipes-devtools/python/python3-scons_4.5.1.bb
@@ -5,7 +5,7 @@ LICENSE = "MIT"
 LIC_FILES_CHKSUM = "file://LICENSE;md5=d903b0b8027f461402bac9b5169b36f7"
 
 SRC_URI += " file://0001-Fix-man-page-installation.patch"
-SRC_URI[sha256sum] = "7703c4e9d2200b4854a31800c1dbd4587e1fa86e75f58795c740bcfa7eca7eaa"
+SRC_URI[sha256sum] = "9daeabe4d87ba2bd4ea15410765fc1ed2d931b723e4dc730a487a3911b9a1738"
 
 PYPI_PACKAGE = "SCons"
 
-- 
2.34.1


