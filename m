Return-Path: <wangmy@fujitsu.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 08A63C4332F
	for <webhook@archiver.kernel.org>; Mon, 22 Nov 2021 15:00:12 +0000 (UTC)
Received: from mail1.bemta26.messagelabs.com (mail1.bemta26.messagelabs.com
 [85.158.142.116])
 by mx.groups.io with SMTP id smtpd.web09.7418.1637593211108830984
 for <openembedded-core@lists.openembedded.org>;
 Mon, 22 Nov 2021 07:00:11 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@fujitsu.com header.s=170520fj header.b=tMxXGqlV;
 spf=pass (domain: fujitsu.com, ip: 85.158.142.116,
 mailfrom: wangmy@fujitsu.com)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=fujitsu.com;
	s=170520fj; t=1637593209; i=@fujitsu.com;
	bh=zZoPrKM3ClAaVBwVh1hIunAkUFcB01B+R//pp1BYR2I=;
	h=From:To:CC:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type;
	b=tMxXGqlVGuqBkcL/5iRN7H1rttL2kDqy5MBTQhPxp8uhI0KYfMdB4RJZqTCSmyhEn
	 Uwfucr2yGZHpeqmcKombSBny7JB9hS+zd4oboH7yDW8gGJbxERpAghJGvh6sCw2pBh
	 QtYHC2lJdP/l89VBi00I7m0/VI7XTYd3xACKxq+rLusvUchDFiC6ivEixvy3oFLqyq
	 aGFr5K9KKqqaXbUSW0meM6KsS4iw+T4Lymdp7LhBmWZ4T/u12Y8aMYKz5Ny9pS5TJK
	 sIwbKdhIq4FN7limrxd9Vghu46y81eGwVGj9o9sSNvEC1E0oklMbUkp4oCoOPUaF6Z
	 z8GhZFG3WI6Pw==
Received: from [100.113.7.250] (using TLSv1.2 with cipher
 DHE-RSA-AES256-GCM-SHA384 (256 bits))
	by server-5.bemta.az-b.eu-central-1.aws.symcld.net id 1A/34-25178-970BB916;
 Mon, 22 Nov 2021 15:00:09 +0000
X-Brightmail-Tracker: H4sIAAAAAAAAA+NgFrrKIsWRWlGSWpSXmKPExsViZ8MxSbdiw+x
  EgzfvbSzu/HzH7sDocW7jCsYAxijWzLyk/IoE1oxvB34yFdy2rNj24w5zA+Nngy5GLg4hgceM
  EvMXN7BBOOeZJP6tfcoC4ZxglDh6dDNTFyMnB5uAmsT0WzdYuxg5OEQE9CSu/hMFCTMLqEi8+
  N3DDmILCzhInGudwgJiswioSsz5v5gZxOYVcJK4suQNG4gtIaAgMeXhe7A4p4CzxLaP18HiQk
  A1Mxe/YYeoF5Q4OfMJC8R8CYmDL14wQ/QqSsy+3MwCYVdIzJrVxgRhq0lcPbeJeQKj4Cwk7bO
  QtC9gZFrFaJlUlJmeUZKbmJmja2hgoGtoaKxrqmtoaqyXWKWbpJdaqpucmldSlAiU1UssL9Yr
  rsxNzknRy0st2cQIDOGUQtaZOxg/vf6gd4hRkoNJSZTXaPbsRCG+pPyUyozE4oz4otKc1OJDj
  DIcHEoSvI/XAeUEi1LTUyvSMnOA8QSTluDgURLhdQBJ8xYXJOYWZ6ZDpE4x6nI0T1q+nVmIJS
  8/L1VKnLd5PVCRAEhRRmke3AhYbF9ilJUS5mVkYGAQ4ilILcrNLEGVf8UozsGoJMxbBTKFJzO
  vBG7TK6AjmICOOH18OsgRJYkIKakGJnXJAoGl2lN01dibdf2OG89dwW1kfWOu0vSfvi2HxNMy
  r6SIv9zicaJL3vb33Ml/S3O2fvllfUWuiVFjw62UjzzqMWu1C31D9rvef/mt+H9SViLTtOKf7
  Mx9C294z7l++KxhEkPkdzUWyQOin/7Zrtuy+F1hzWN9geK0P8o1SmKWylOlvnwN6qjj6fO9pv
  xv5/tjB9nq4q0mhLU7Wwd+c/aa8KX3ql3J5meqi7/F2PWfXXbqhUvB5hu2oqrfl/YceyGo3BH
  Mkm6u4eH49vKqzzJHDvzMeevgpqL0rN098bZ56ox71x1lOb8+dj+y+cH2pORz7zPivZRvTZk9
  2bLiYcjBtBPTYh85e++8tmnhCyWW4oxEQy3mouJEAAsLPMpoAwAA
X-Env-Sender: wangmy@fujitsu.com
X-Msg-Ref: server-18.tower-248.messagelabs.com!1637593208!210513!1
X-Originating-IP: [62.60.8.146]
X-SYMC-ESS-Client-Auth: outbound-route-from=pass
X-StarScan-Received: 
X-StarScan-Version: 9.81.5; banners=-,-,-
X-VirusChecked: Checked
Received: (qmail 2071 invoked from network); 22 Nov 2021 15:00:08 -0000
Received: from unknown (HELO n03ukasimr02.n03.fujitsu.local) (62.60.8.146)
  by server-18.tower-248.messagelabs.com with ECDHE-RSA-AES256-GCM-SHA384
 encrypted SMTP; 22 Nov 2021 15:00:08 -0000
Received: from n03ukasimr02.n03.fujitsu.local (localhost [127.0.0.1])
	by n03ukasimr02.n03.fujitsu.local (Postfix) with ESMTP id 72F3510045F
	for <openembedded-core@lists.openembedded.org>;
 Mon, 22 Nov 2021 15:00:08 +0000 (GMT)
Received: from R01UKEXCASM126.r01.fujitsu.local (unknown [10.183.43.178])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-SHA384 (256/256 bits))
	(No client certificate requested)
	by n03ukasimr02.n03.fujitsu.local (Postfix) with ESMTPS id 664AA100451
	for <openembedded-core@lists.openembedded.org>;
 Mon, 22 Nov 2021 15:00:08 +0000 (GMT)
Received: from localhost.localdomain.localdomain (10.167.225.33) by
 R01UKEXCASM126.r01.fujitsu.local (10.183.43.178) with Microsoft SMTP Server
 (TLS) id 15.0.1497.26; Mon, 22 Nov 2021 14:59:49 +0000
From: Wang Mingyu <wangmy@fujitsu.com>
To: <openembedded-core@lists.openembedded.org>
CC: Wang Mingyu <wangmy@fujitsu.com>
Subject: [OE-core] [PATCH] python3-scons: upgrade 4.2.0 -> 4.3.0
Date: Mon, 22 Nov 2021 22:59:34 +0800
Message-ID: <1637593174-99263-3-git-send-email-wangmy@fujitsu.com>
X-Mailer: git-send-email 1.8.3.1
In-Reply-To: <1637593174-99263-1-git-send-email-wangmy@fujitsu.com>
References: <1637593174-99263-1-git-send-email-wangmy@fujitsu.com>
MIME-Version: 1.0
Content-Type: text/plain
X-Originating-IP: [10.167.225.33]
X-ClientProxiedBy: G08CNEXCHPEKD07.g08.fujitsu.local (10.167.33.80) To
 R01UKEXCASM126.r01.fujitsu.local (10.183.43.178)
X-Virus-Scanned: ClamAV using ClamSMTP
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Mon, 22 Nov 2021 15:00:11 -0000
X-Groupsio-URL: 
 https://lists.openembedded.org/g/openembedded-core/message/158576

NOTE: 4.3.0 now requires Python 3.6.0 and above. Python 3.5.x is no longer supported

Changelog:
- Default hash algorithm check updated for SCons FIPS compliance. Now checks for hash viability
  first and then walks the tree to use the first viable hash as the default one. This typically
  selects SHA1 on FIPS-enabled systems less than Python 3.9 as the new default instead of MD5,
  unless SHA1 has also been disabled by security policy, at which point SCons selects SHA256
  as the default. For systems running Python 3.9 and later, the hashlib bug has been fixed,
  and SCons will once again default to MD5 as the preferred algorithm.
- Fix MSVS tests (vs-N.N-exec.py) for MSVS 6.0, 7.0, and 7.1 (import missing module).
- Add support for Visual Studio 2022.
- Fix reproducible builds. Restore logic respecting SOURCE_DATE_EPOCH when set.
- Fix version tests to work with updated scons --version output. (Date format changed)
- Fix issue #4021.  Change the way subst() is used in Textfile() to not evaluate '$$(' -> '$',
  but instead it should yield '$('.
- Change SCons.Platform.win32.get_architecture() to return platform.platform() when run in an
  environment where neither: PROCESSOR_ARCHITEW6432 nor PROCESSOR_ARCHITECTURE is set.
  This should fix platform tests which started failing when HOST_OS/HOST_ARCH changes
  introduced by Aaron Franke (listed below) were merged.
- Further PCH updates. It's now recommended that env['PCH'] should always be a File node.
  Either via return value from env.PCH() or by explicitly using File('StdAfx.pch').
- Added --no-ignore-skips to runtest.py. Changed default to ignore skips when setting
  runtest.py's exit status. Previously would exit 2 if any tests were skipped.
  Now will only exit 2 if user specifies --no-ignore-skips and some tests were skipped.
- Small fix to ensure CLVar default value is an empty list.
  See MongoDB bug report: https://jira.mongodb.org/browse/SERVER-59656
  Code contributed by MongoDB.
- Ninja - Fixed an issue where if you control-c and/or killed ninja while it was running scons to
  regenerate build.ninja you would end up with no build.ninja file and have to rerun scons from scratch.
  Code contributed by MongoDB.
- Define HOST_OS and HOST_ARCH in the environment for all platforms.
  Before this change, these were only defined for Win32 and OS/2.
- Fix ninja tool to never use for_sig substitution because ninja does not use signatures. This
  issue affected CommandGeneratorAction function actions specifically.
- Expanded ninja Mkdir to also support Mkdir actions.
- Added support for the PCH environment variable to support subst generators.
- Fix command line escaping for ninja dollar sign escape. Without escaping ninja properly,
  the ninja file scons regenerate and callback invocations will lose the $ characters used in
  the scons command line which ninja uses itself for escaping. For Example:
      scons BUILD=xyz OTHERVAR=$BUILD
  Prior to this fix, it would cause ninja to fail to escape the dollar sign, leading to the
  single dollar sign being used as a ninja escape character in the ninja file.
- Added ninja API 'NINJA_FORCE_SCONS_BUILD' to force a node to callback to scons.
- Two small Python 3.10 fixes: one more docstring turned into raw
  because it contained an escape; updated "helpful" syntax error message
  from 3.10 was not expected by SubstTests.py and test/Subst/Syntax.py
- EmitterProxy rich comparison set is completed (checker warning).
  Added __le__, __gt__, __ge__.
- Fix gcc/g++ tool failing if "gcc --version" returns text which fails
  to_String conversion (i.e., not UTF-8) - failure happens when tool
  initialization checks version. For gcc, the initial version string is
  not translated, for the rest, don't convert, just consume raw and discard.
- Maintenance and doc: modernize some usage in Scanner package,
  calling super(), switching some imitialization to comprehensions,
  and code formatting.  Docstring for scanner Base moved from
  init-method to class-level so it's picked up by Sphinx.
  Added new sconsign filenames to skip_entry_list in Scanner/Dir.py
- Change SCons.Scanner.Base to ScannerBase. Old name kept as an alias
  but is now unused in SCons itself.
- Call Variables option converter consistently - the converter should
  have access to the env if it needs to (issue #2064).
- Fixed the variables Add() method to accept a tuple for the variable
  name the same way AddVariables() does (issue #3869).
- The premade validator PathIsDirCreate for for PathVariable now catches
  the case where the directory could not be created due to permission
  problems, allowing a more helpful error to be emitted (issue #2828)
- Maintenance: Python thread.setDaemon is deprecated in favor of
  directly updating daemon attribute - update SCons to do this.
- Make sure when subst'ing a callable, the callable is called with
  the correct for_signature value, previously it would be true even
  if doing SUBST_RAW (issue #4037)
- Update Util/NodeList implementation to get rid of a workaround for
  early Python 3 slicing issue that is no longer a problem.
- Rework some Java tests to skip rather than fail on CI systems, where
  the working java is > v9, but a 1.8 or 9 was also found.
- Java updates: on Windows, detect more default JDK install locations.
  On all platforms, more Java versions (up to 17.0 now).  Add more information
  on version selection to docs.
  Update docs on JavaH tool in light of javah command dropped since 10.0.
  Try to be better about preserving user's passed-in JAVA* construction vars.
- Start the deprecation of the qt tool, which refers to Qt3 (usupported
  since around 2006). There's a deprecation warning added, initially
  defaulting to disabled.
- Fix crash when scons is run from a python environement where a signal
  is set from outside Python.

Signed-off-by: Wang Mingyu <wangmy@fujitsu.com>
---
 ...hon3-scons-native_4.2.0.bb => python3-scons-native_4.3.0.bb} | 0
 .../python/{python3-scons_4.2.0.bb => python3-scons_4.3.0.bb}   | 2 +-
 2 files changed, 1 insertion(+), 1 deletion(-)
 rename meta/recipes-devtools/python/{python3-scons-native_4.2.0.bb => python3-scons-native_4.3.0.bb} (100%)
 rename meta/recipes-devtools/python/{python3-scons_4.2.0.bb => python3-scons_4.3.0.bb} (87%)

diff --git a/meta/recipes-devtools/python/python3-scons-native_4.2.0.bb b/meta/recipes-devtools/python/python3-scons-native_4.3.0.bb
similarity index 100%
rename from meta/recipes-devtools/python/python3-scons-native_4.2.0.bb
rename to meta/recipes-devtools/python/python3-scons-native_4.3.0.bb
diff --git a/meta/recipes-devtools/python/python3-scons_4.2.0.bb b/meta/recipes-devtools/python/python3-scons_4.3.0.bb
similarity index 87%
rename from meta/recipes-devtools/python/python3-scons_4.2.0.bb
rename to meta/recipes-devtools/python/python3-scons_4.3.0.bb
index 23527a2cce..bff2fdae92 100644
--- a/meta/recipes-devtools/python/python3-scons_4.2.0.bb
+++ b/meta/recipes-devtools/python/python3-scons_4.3.0.bb
@@ -5,7 +5,7 @@ LICENSE = "MIT"
 LIC_FILES_CHKSUM = "file://LICENSE;md5=d903b0b8027f461402bac9b5169b36f7"
 
 SRC_URI += " file://0001-Fix-man-page-installation.patch"
-SRC_URI[sha256sum] = "691893b63f38ad14295f5104661d55cb738ec6514421c6261323351c25432b0a"
+SRC_URI[sha256sum] = "d47081587e3675cc168f1f54f0d74a69b328a2fc90ec4feb85f728677419b879"
 
 PYPI_PACKAGE = "SCons"
 
-- 
2.25.1


