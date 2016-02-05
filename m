Return-Path: <ross.burton@intel.com>
Received: from mail-wm0-f41.google.com (mail-wm0-f41.google.com [74.125.82.41])
	by mail.openembedded.org (Postfix) with ESMTP id 66374770E3
	for <openembedded-core@lists.openembedded.org>;
	Fri,  5 Feb 2016 11:47:39 +0000 (UTC)
Received: by mail-wm0-f41.google.com with SMTP id p63so23371824wmp.1
	for <openembedded-core@lists.openembedded.org>;
	Fri, 05 Feb 2016 03:47:40 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=intel-com.20150623.gappssmtp.com; s=20150623;
	h=from:to:subject:date:message-id;
	bh=KDqQlEryb9N/hmvXazF2CMSTylRnJcRj8UDCLgpRXkQ=;
	b=J0CKWjQVBTKEtqg8pSVaEGCLXCRvAuxcOYHDWg7sdu4lFaIXKGVAaoln/6wCVM8ubw
	9yuyM/cyBq9/EuFq4Ys+C0fA042pgE1tqsbICYPWJ0xku75slNXphrfureC+p/sPyysT
	+BMd6K4Za6a8nXHrIiJaPC7mYAEh/fPyla/CPz1+1BysTyUUHTJK/FBmXwfsFjeyznSn
	dte1AxEHDXLvi9RMute6q4tBndCt8KN6dWRzQuxQl3+mQWJV9LzYQVyGGdDDjOD1bJZT
	EutYvpXBS1BNbf93sfJVj0FPgQ8dezEz26ZPE3rBRm2mdCFF8J5fjE/Z7LGXDP6lnGAI
	ZAzg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20130820;
	h=x-gm-message-state:from:to:subject:date:message-id;
	bh=KDqQlEryb9N/hmvXazF2CMSTylRnJcRj8UDCLgpRXkQ=;
	b=eIjh+XikHaWfm/VMGXQc6M3gjyNepL9Wy/hpQ61eNosLguxm7VDiYBp8lYg89x2009
	Kh79Hk3XRukrj9xKiN5x4fswrOkN64sfO1PxTcGrnBnYLydDBxzAl72DhglkH/tewBMR
	DkW7RhQDcxMPQft+f7U7Jm092gqJQRQu+/+brmYG5L0gql+RQ0U1a6LJVT0TXknOTM+q
	x7fcRa01wsfMiQDPJjZyv8WylIXeEiegPSKHgEb0eL66Sdcbv7FZXFku1d7AGFdjiEK1
	ei2rwbdM5CB+5gxsWR+LvM6g+cqh1+xQWF84VmArHnE88bPOgvYmPYuklfCiijkeca9R
	s26w==
X-Gm-Message-State: AG10YORfgmDpJWK4E8oDBMgImENzODA6N8KEwJgTKwrA9YynzeB11sIn2MZxvWcDbqchI6H6
X-Received: by 10.28.129.139 with SMTP id c133mr15997236wmd.30.1454672859545; 
	Fri, 05 Feb 2016 03:47:39 -0800 (PST)
Received: from flashheart.burtonini.com (home.burtonini.com. [81.2.106.35])
	by smtp.gmail.com with ESMTPSA id
	lh1sm15459046wjb.20.2016.02.05.03.47.38
	for <openembedded-core@lists.openembedded.org>
	(version=TLS1_2 cipher=ECDHE-RSA-AES128-SHA bits=128/128);
	Fri, 05 Feb 2016 03:47:38 -0800 (PST)
From: Ross Burton <ross.burton@intel.com>
To: openembedded-core@lists.openembedded.org
Date: Fri,  5 Feb 2016 11:47:34 +0000
Message-Id: <1454672856-13680-1-git-send-email-ross.burton@intel.com>
X-Mailer: git-send-email 2.7.0
Subject: [PATCH 1/3] python3: remove optimize by default patch
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
X-List-Received-Date: Fri, 05 Feb 2016 11:47:41 -0000

Python 3 resurrected the default to optimised patch, on the rationale that
embedded systems want all the performance they can get.  Unfortunately the only
impact Python "optimisation" has is to remove all asserts which can be actively
harmful, so remove this patch.

Signed-off-by: Ross Burton <ross.burton@intel.com>
---
 .../python/python3/04-default-is-optimized.patch   | 59 ----------------------
 meta/recipes-devtools/python/python3_3.5.1.bb      |  1 -
 2 files changed, 60 deletions(-)
 delete mode 100644 meta/recipes-devtools/python/python3/04-default-is-optimized.patch

diff --git a/meta/recipes-devtools/python/python3/04-default-is-optimized.patch b/meta/recipes-devtools/python/python3/04-default-is-optimized.patch
deleted file mode 100644
index 4b8a7e5..0000000
--- a/meta/recipes-devtools/python/python3/04-default-is-optimized.patch
+++ /dev/null
@@ -1,59 +0,0 @@
-Upstream-Status: Inappropriate [embedded specific]
-
-# when compiling for an embedded system, we need every bit of
-# performance we can get. default to optimized with the option
-# of opt-out.
-# Signed-Off: Michael 'Mickey' Lauer <mickey@vanille-media.de>
-
-
-2012/05/01
-Signed-Off-By: Nitin A Kamble <nitin.a.kamble@intel.com>
-
-Rebased for 3.4.2 02/2015
-Signed-off-by: Alejandro Hernandez <alejandro.hernandez@linux.intel.com>
-
-Index: Python-3.5.0/Modules/main.c
-===================================================================
---- Python-3.5.0.orig/Modules/main.c
-+++ Python-3.5.0/Modules/main.c
-@@ -37,7 +37,7 @@ static wchar_t **orig_argv;
- static int  orig_argc;
- 
- /* command line options */
--#define BASE_OPTS L"bBc:dEhiIJm:OqRsStuvVW:xX:?"
-+#define BASE_OPTS L"bBc:dEhiIJm:NOqRsStuvVW:xX:?"
- 
- #define PROGRAM_OPTS BASE_OPTS
- 
-@@ -63,6 +63,7 @@ static char *usage_2 = "\
- -m mod : run library module as a script (terminates option list)\n\
- -O     : optimize generated bytecode slightly; also PYTHONOPTIMIZE=x\n\
- -OO    : remove doc-strings in addition to the -O optimizations\n\
-+-N     : do NOT optimize generated bytecode\n\
- -q     : don't print version and copyright messages on interactive startup\n\
- -s     : don't add user site directory to sys.path; also PYTHONNOUSERSITE\n\
- -S     : don't imply 'import site' on initialization\n\
-@@ -419,8 +420,8 @@ Py_Main(int argc, wchar_t **argv)
- 
-         /* case 'J': reserved for Jython */
- 
--        case 'O':
--            Py_OptimizeFlag++;
-+        case 'N':
-+            Py_OptimizeFlag=0;
-             break;
- 
-         case 'B':
-Index: Python-3.5.0/Python/pylifecycle.c
-===================================================================
---- Python-3.5.0.orig/Python/pylifecycle.c
-+++ Python-3.5.0/Python/pylifecycle.c
-@@ -80,7 +80,7 @@ int Py_VerboseFlag; /* Needed by import.
- int Py_QuietFlag; /* Needed by sysmodule.c */
- int Py_InteractiveFlag; /* Needed by Py_FdIsInteractive() below */
- int Py_InspectFlag; /* Needed to determine whether to exit at SystemExit */
--int Py_OptimizeFlag = 0; /* Needed by compile.c */
-+int Py_OptimizeFlag = 1; /* Needed by compile.c */
- int Py_NoSiteFlag; /* Suppress 'import site' */
- int Py_BytesWarningFlag; /* Warn on str(bytes) and str(buffer) */
- int Py_UseClassExceptionsFlag = 1; /* Needed by bltinmodule.c: deprecated */
diff --git a/meta/recipes-devtools/python/python3_3.5.1.bb b/meta/recipes-devtools/python/python3_3.5.1.bb
index 54007d3..11f959b 100644
--- a/meta/recipes-devtools/python/python3_3.5.1.bb
+++ b/meta/recipes-devtools/python/python3_3.5.1.bb
@@ -22,7 +22,6 @@ ${DISTRO_SRC_URI} \
 
 SRC_URI += "\
             file://03-fix-tkinter-detection.patch \
-            file://04-default-is-optimized.patch \
             file://avoid_warning_about_tkinter.patch \
             file://cgi_py.patch \
             file://host_include_contamination.patch \
-- 
2.7.0


