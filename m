Received: from mail-pj1-f45.google.com (mail-pj1-f45.google.com [209.85.216.45])
 by mx.groups.io with SMTP id smtpd.web09.21422.1626653716088055491
 for <openembedded-core@lists.openembedded.org>;
 Sun, 18 Jul 2021 17:15:16 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20161025 header.b=seT7MOS7;
 spf=pass (domain: gmail.com, ip: 209.85.216.45, mailfrom: ticotimo@gmail.com)
Received: by mail-pj1-f45.google.com with SMTP id o3-20020a17090a6783b0290173ce472b8aso13041581pjj.2
        for <openembedded-core@lists.openembedded.org>; Sun, 18 Jul 2021 17:15:16 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:content-transfer-encoding;
        bh=xD7OF4oH5cq89cMM228jJWhcpbxEmB4kKr4UfW6ovj4=;
        b=seT7MOS7p5BXbExbDnzRP3WJjg1Tl3RdleN8W0201C3bunrI6QF908MHDLtsr6llwg
         L7CgBYEyVUc21IKs06eax3QPdG5xGpGm48itqdl0XasM6psQZHqKmNPORbymIElvs9f8
         RdDu4oYkeNX4sQAB8XCN0NG21H6ZjWjgULA9+ai5HW/cXOkPHbzFCTzwlVmNZ35GW804
         tN5Ap1lj/knrtM+HYdm8iuak8lR14wuIJGqBtHT1NyBxhkDVCWx4d7MQCJXUg0jD+mEz
         DbGOy43BmFpgted1VIlZ4myXlkGt2HEDlVDIFhdn2qHOwfdgh3LoHS7zzGM6w8onnTW6
         +t7w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=xD7OF4oH5cq89cMM228jJWhcpbxEmB4kKr4UfW6ovj4=;
        b=GtqRffi3mjiI6X3XiIMQt0bf9UosNCC04vg65vARYpZuSaUVKS1qb2UO2E86NJ+19X
         qMI5SmjomxThm8eSeiM9S3Vlvohp1U42ceH8XlYF0aITEw0xEIZVX5lMEPvZZRZzByEA
         LsWypsgWlG7AiIVtthnZZ+B0L5Grwf5FjBJf5j5bUr3Yt6m5yth4H1JltCfvY6s2xXTu
         9P/gaaAGef1DY0V1t+obue1xdBZ2mig33gtaVBpDb0vNVr3ux6sb/4WAkSAdNY5ZYJcj
         Qi9wvkkGJroYFejrB36l99m80K68uq7XavrSfv3ykwfM5qryxX+IgyJAnjn4cg0CB//0
         FbDA==
X-Gm-Message-State: AOAM532Gmz6vZJ2QzN+wpMeK7IIvATgsHDulOrp2gjhGHoytbRTZ5wVF
	nnH6/ty5SrLO27X4Sc13bOMYyt993EK9Yg==
X-Google-Smtp-Source: ABdhPJxMNFLNk9GUPGfcPy8j8iURVGUd5fJaXCsr4z43W98jZ1iOTTbeNMt9qRMDJZ72iFqA+UD3ZQ==
X-Received: by 2002:a17:902:b684:b029:12b:8104:b4dc with SMTP id c4-20020a170902b684b029012b8104b4dcmr4940901pls.63.1626653715232;
        Sun, 18 Jul 2021 17:15:15 -0700 (PDT)
Return-Path: <ticotimo@gmail.com>
Received: from nereus.local ([2601:1c0:6000:1830:d2e4:4478:7db4:dfbd])
        by smtp.gmail.com with ESMTPSA id c204sm2152083pfb.90.2021.07.18.17.15.14
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 18 Jul 2021 17:15:14 -0700 (PDT)
From: "Tim Orling" <ticotimo@gmail.com>
X-Google-Original-From: Tim Orling <timothy.t.orling@intel.com>
To: openembedded-core@lists.openembedded.org
Cc: steve@sakoman.com,
	Tony Tascioglu <tony.tascioglu@windriver.com>,
	Richard Purdie <richard.purdie@linuxfoundation.org>,
	Tim Orling <timothy.t.orling@intel.com>
Subject: [dunfell][PATCH 1/1] libxml2: Update to 2.9.12
Date: Sun, 18 Jul 2021 17:15:05 -0700
Message-Id: <c68ee1d5c1c5e3bac27ee0aa33ed78f900824419.1626652989.git.timothy.t.orling@intel.com>
X-Mailer: git-send-email 2.30.2
In-Reply-To: <cover.1626652989.git.timothy.t.orling@intel.com>
References: <cover.1626652989.git.timothy.t.orling@intel.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

From: Tony Tascioglu <tony.tascioglu@windriver.com>

Drop CVE patches which are fixed by the new upstream version.

Modify conflicting patches to apply to the new versions:
   libxml2/libxml-m4-use-pkgconfig.patch
   libxml2/0001-Make-ptest-run-the-python-tests-if-python-is-enabled.patch

Drop fix-python39, which is merged upstream.

Removed hunk for tstLastError.py from
   libxml2/0001-Make-ptest-run-the-python-tests-if-python-is-enabled.patch
since it has been fixed upstream by:

   8c3e52e: Updated python/tests/tstLastError.py

   libxml2.registerErrorHandler(None,None):
   None is not acceptable as first argument
   failUnlessEqual replaced by assertEqual

The checksums for the licence file changed because a typo was fixed
across the files. The licence remains the same.
The obsolete MD5 checksums for the tar files have been dropped in
favor of SHA256.

The new release also adds fuzz tests, which are removed from the
makefile to allow the ptests to run. Fuzz testing is done upstream
and there is no need to run them as part of ptests which are
intended for functionality testing.

(From OE-Core rev: c7c429d05ca51b0404f09981f6c9bcad7dc33222)

Signed-off-by: Tony Tascioglu <tony.tascioglu@windriver.com>
Signed-off-by: Richard Purdie <richard.purdie@linuxfoundation.org>

Backport to dunfell
Fixes CVE-2021-3541

References:
https://web.nvd.nist.gov/view/vuln/detail?vulnId=CVE-2021-3541
https://bugzilla.redhat.com/show_bug.cgi?id=1950515

Signed-off-by: Tim Orling <timothy.t.orling@intel.com>
---
 ...he-python-tests-if-python-is-enabled.patch | 34 +++++----------
 .../libxml/libxml2/CVE-2019-20388.patch       | 37 ----------------
 .../libxml/libxml2/CVE-2020-24977.patch       | 41 ------------------
 .../libxml/libxml2/CVE-2020-7595.patch        | 36 ----------------
 .../libxml2/libxml-m4-use-pkgconfig.patch     | 33 ++++++++------
 .../libxml2/remove-fuzz-from-ptests.patch     | 43 +++++++++++++++++++
 .../{libxml2_2.9.10.bb => libxml2_2.9.12.bb}  | 17 +++-----
 7 files changed, 80 insertions(+), 161 deletions(-)
 delete mode 100644 meta/recipes-core/libxml/libxml2/CVE-2019-20388.patch
 delete mode 100644 meta/recipes-core/libxml/libxml2/CVE-2020-24977.patch
 delete mode 100644 meta/recipes-core/libxml/libxml2/CVE-2020-7595.patch
 create mode 100644 meta/recipes-core/libxml/libxml2/remove-fuzz-from-ptests.patch
 rename meta/recipes-core/libxml/{libxml2_2.9.10.bb => libxml2_2.9.12.bb} (85%)

diff --git a/meta/recipes-core/libxml/libxml2/0001-Make-ptest-run-the-python-tests-if-python-is-enabled.patch b/meta/recipes-core/libxml/libxml2/0001-Make-ptest-run-the-python-tests-if-python-is-enabled.patch
index 5e9a0a506bd..6d9ede61941 100644
--- a/meta/recipes-core/libxml/libxml2/0001-Make-ptest-run-the-python-tests-if-python-is-enabled.patch
+++ b/meta/recipes-core/libxml/libxml2/0001-Make-ptest-run-the-python-tests-if-python-is-enabled.patch
@@ -1,4 +1,4 @@
-From 2b5fb416aa275fd2a17a0139a2f783998bcb42cc Mon Sep 17 00:00:00 2001
+From ea1993d1d9a18c5e61b9cb271892b0a48f508d32 Mon Sep 17 00:00:00 2001
 From: Peter Kjellerstedt <pkj@axis.com>
 Date: Fri, 9 Jun 2017 17:50:46 +0200
 Subject: [PATCH] Make ptest run the python tests if python is enabled
@@ -8,16 +8,14 @@ be due to the fact that the tests are forced to run with Python 3.
 
 Upstream-Status: Inappropriate [OE specific]
 Signed-off-by: Peter Kjellerstedt <peter.kjellerstedt@axis.com>
-
 ---
- Makefile.am                  |  2 +-
- python/Makefile.am           |  9 +++++++++
- python/tests/Makefile.am     | 10 ++++++++++
- python/tests/tstLastError.py |  2 +-
- 4 files changed, 21 insertions(+), 2 deletions(-)
+ Makefile.am              |  2 +-
+ python/Makefile.am       |  9 +++++++++
+ python/tests/Makefile.am | 10 ++++++++++
+ 3 files changed, 20 insertions(+), 1 deletion(-)
 
 diff --git a/Makefile.am b/Makefile.am
-index ae62274..bd1e425 100644
+index b428452b..dc18d6dd 100644
 --- a/Makefile.am
 +++ b/Makefile.am
 @@ -203,9 +203,9 @@ install-ptest:
@@ -32,7 +30,7 @@ index ae62274..bd1e425 100644
  runtests: runtest$(EXEEXT) testrecurse$(EXEEXT) testapi$(EXEEXT) \
            testchar$(EXEEXT) testdict$(EXEEXT) runxmlconf$(EXEEXT)
 diff --git a/python/Makefile.am b/python/Makefile.am
-index 34aed96..ba3ec6a 100644
+index 34aed96c..ba3ec6a4 100644
 --- a/python/Makefile.am
 +++ b/python/Makefile.am
 @@ -48,7 +48,16 @@ GENERATED = libxml2class.py libxml2class.txt $(BUILT_SOURCES)
@@ -53,7 +51,7 @@ index 34aed96..ba3ec6a 100644
  tests test: all
  	cd tests && $(MAKE) tests
 diff --git a/python/tests/Makefile.am b/python/tests/Makefile.am
-index 227e24d..021bb29 100644
+index 227e24df..3568c2d2 100644
 --- a/python/tests/Makefile.am
 +++ b/python/tests/Makefile.am
 @@ -59,6 +59,11 @@ XMLS=		\
@@ -83,16 +81,6 @@ index 227e24d..021bb29 100644
 +
  tests:
  endif
-diff --git a/python/tests/tstLastError.py b/python/tests/tstLastError.py
-index 81d0acc..162c8db 100755
---- a/python/tests/tstLastError.py
-+++ b/python/tests/tstLastError.py
-@@ -25,7 +25,7 @@ class TestCase(unittest.TestCase):
-         when the exception is raised, check the libxml2.lastError for
-         expected values."""
-         # disable the default error handler
--        libxml2.registerErrorHandler(None,None)
-+        libxml2.registerErrorHandler(lambda ctx,str: None,None)
-         try:
-             f(*args)
-         except exc:
+--
+2.25.1
+
diff --git a/meta/recipes-core/libxml/libxml2/CVE-2019-20388.patch b/meta/recipes-core/libxml/libxml2/CVE-2019-20388.patch
deleted file mode 100644
index 88eb65a6a5e..00000000000
--- a/meta/recipes-core/libxml/libxml2/CVE-2019-20388.patch
+++ /dev/null
@@ -1,37 +0,0 @@
-From 7ffcd44d7e6c46704f8af0321d9314cd26e0e18a Mon Sep 17 00:00:00 2001
-From: Zhipeng Xie <xiezhipeng1@huawei.com>
-Date: Tue, 20 Aug 2019 16:33:06 +0800
-Subject: [PATCH] Fix memory leak in xmlSchemaValidateStream
-
-When ctxt->schema is NULL, xmlSchemaSAXPlug->xmlSchemaPreRun
-alloc a new schema for ctxt->schema and set vctxt->xsiAssemble
-to 1. Then xmlSchemaVStart->xmlSchemaPreRun initialize
-vctxt->xsiAssemble to 0 again which cause the alloced schema
-can not be freed anymore.
-
-Found with libFuzzer.
-
-Upstream-Status: Backport [https://gitlab.gnome.org/GNOME/libxml2/commit/7ffcd44d7e6c46704f8af0321d9314cd26e0e18a]
-CVE: CVE-2019-20388
-
-Signed-off-by: Zhipeng Xie <xiezhipeng1@huawei.com>
-Signed-off-by: Lee Chee Yang <chee.yang.lee@intel.com>
----
- xmlschemas.c | 1 -
- 1 file changed, 1 deletion(-)
-
-diff --git a/xmlschemas.c b/xmlschemas.c
-index 301c8449..39d92182 100644
---- a/xmlschemas.c
-+++ b/xmlschemas.c
-@@ -28090,7 +28090,6 @@ xmlSchemaPreRun(xmlSchemaValidCtxtPtr vctxt) {
-     vctxt->nberrors = 0;
-     vctxt->depth = -1;
-     vctxt->skipDepth = -1;
--    vctxt->xsiAssemble = 0;
-     vctxt->hasKeyrefs = 0;
- #ifdef ENABLE_IDC_NODE_TABLES_TEST
-     vctxt->createIDCNodeTables = 1;
--- 
-2.24.1
-
diff --git a/meta/recipes-core/libxml/libxml2/CVE-2020-24977.patch b/meta/recipes-core/libxml/libxml2/CVE-2020-24977.patch
deleted file mode 100644
index 82243466607..00000000000
--- a/meta/recipes-core/libxml/libxml2/CVE-2020-24977.patch
+++ /dev/null
@@ -1,41 +0,0 @@
-From 50f06b3efb638efb0abd95dc62dca05ae67882c2 Mon Sep 17 00:00:00 2001
-From: Nick Wellnhofer <wellnhofer@aevum.de>
-Date: Fri, 7 Aug 2020 21:54:27 +0200
-Subject: [PATCH] Fix out-of-bounds read with 'xmllint --htmlout'
-
-Make sure that truncated UTF-8 sequences don't cause an out-of-bounds
-array access.
-
-Thanks to @SuhwanSong and the Agency for Defense Development (ADD) for
-the report.
-
-Fixes #178.
-
-CVE: CVE-2020-24977
-Upstream-Status: Backport [https://gitlab.gnome.org/GNOME/libxml2/-/commit/50f06b3efb638efb0abd95dc62dca05ae67882c2]
-
-Signed-off-by: Ovidiu Panait <ovidiu.panait@windriver.com>
----
- xmllint.c | 6 ++++++
- 1 file changed, 6 insertions(+)
-
-diff --git a/xmllint.c b/xmllint.c
-index f6a8e463..c647486f 100644
---- a/xmllint.c
-+++ b/xmllint.c
-@@ -528,6 +528,12 @@ static void
- xmlHTMLEncodeSend(void) {
-     char *result;
- 
-+    /*
-+     * xmlEncodeEntitiesReentrant assumes valid UTF-8, but the buffer might
-+     * end with a truncated UTF-8 sequence. This is a hack to at least avoid
-+     * an out-of-bounds read.
-+     */
-+    memset(&buffer[sizeof(buffer)-4], 0, 4);
-     result = (char *) xmlEncodeEntitiesReentrant(NULL, BAD_CAST buffer);
-     if (result) {
- 	xmlGenericError(xmlGenericErrorContext, "%s", result);
--- 
-2.17.1
-
diff --git a/meta/recipes-core/libxml/libxml2/CVE-2020-7595.patch b/meta/recipes-core/libxml/libxml2/CVE-2020-7595.patch
deleted file mode 100644
index facfefd3626..00000000000
--- a/meta/recipes-core/libxml/libxml2/CVE-2020-7595.patch
+++ /dev/null
@@ -1,36 +0,0 @@
-From 0e1a49c8907645d2e155f0d89d4d9895ac5112b5 Mon Sep 17 00:00:00 2001
-From: Zhipeng Xie <xiezhipeng1@huawei.com>
-Date: Thu, 12 Dec 2019 17:30:55 +0800
-Subject: [PATCH] Fix infinite loop in xmlStringLenDecodeEntities
-
-When ctxt->instate == XML_PARSER_EOF,xmlParseStringEntityRef
-return NULL which cause a infinite loop in xmlStringLenDecodeEntities
-
-Found with libFuzzer.
-
-Signed-off-by: Zhipeng Xie <xiezhipeng1@huawei.com>
-
-Upstream-Status: Backport [https://gitlab.gnome.org/GNOME/libxml2/commit/0e1a49c89076]
-CVE: CVE-2020-7595
-Signed-off-by: Anuj Mittal <anuj.mittal@intel.com> 
----
- parser.c | 3 ++-
- 1 file changed, 2 insertions(+), 1 deletion(-)
-
-diff --git a/parser.c b/parser.c
-index d1c31963..a34bb6cd 100644
---- a/parser.c
-+++ b/parser.c
-@@ -2646,7 +2646,8 @@ xmlStringLenDecodeEntities(xmlParserCtxtPtr ctxt, const xmlChar *str, int len,
-     else
-         c = 0;
-     while ((c != 0) && (c != end) && /* non input consuming loop */
--	   (c != end2) && (c != end3)) {
-+           (c != end2) && (c != end3) &&
-+           (ctxt->instate != XML_PARSER_EOF)) {
- 
- 	if (c == 0) break;
-         if ((c == '&') && (str[1] == '#')) {
--- 
-2.24.1
-
diff --git a/meta/recipes-core/libxml/libxml2/libxml-m4-use-pkgconfig.patch b/meta/recipes-core/libxml/libxml2/libxml-m4-use-pkgconfig.patch
index e6998f6e683..90fa1937751 100644
--- a/meta/recipes-core/libxml/libxml2/libxml-m4-use-pkgconfig.patch
+++ b/meta/recipes-core/libxml/libxml2/libxml-m4-use-pkgconfig.patch
@@ -1,7 +1,8 @@
-From 43edc9a445ed66cceb7533eadeef242940b4592c Mon Sep 17 00:00:00 2001
-From: Hongxu Jia <hongxu.jia@windriver.com>
-Date: Sat, 11 May 2019 20:37:12 +0800
+From f57da62218cf72c1342da82abafdac6b0a2e4997 Mon Sep 17 00:00:00 2001
+From: Tony Tascioglu <tony.tascioglu@windriver.com>
+Date: Fri, 14 May 2021 11:50:35 -0400
 Subject: [PATCH] AM_PATH_XML2 uses xml-config which we disable through
+
 binconfig-disabled.bbclass, so port it to use pkg-config instead.
 
 Upstream-Status: Pending
@@ -9,16 +10,22 @@ Signed-off-by: Ross Burton <ross.burton@intel.com>
 
 Rebase to 2.9.9
 Signed-off-by: Hongxu Jia <hongxu.jia@windriver.com>
+
+Updated to apply cleanly to v2.9.12
+
+Signed-off-by: Tony Tascioglu <tony.tascioglu@windriver.com>
 ---
- libxml.m4 | 186 ++------------------------------------------------------------
- 1 file changed, 5 insertions(+), 181 deletions(-)
+ libxml.m4 | 190 ++----------------------------------------------------
+ 1 file changed, 5 insertions(+), 185 deletions(-)
 
 diff --git a/libxml.m4 b/libxml.m4
-index 2d7a6f5..1c53585 100644
+index 09de9fe2..1c535853 100644
 --- a/libxml.m4
 +++ b/libxml.m4
-@@ -1,188 +1,12 @@
+@@ -1,192 +1,12 @@
 -# Configure paths for LIBXML2
+-# Simon Josefsson 2020-02-12
+-# Fix autoconf 2.70+ warnings
 -# Mike Hommey 2004-06-19
 -# use CPPFLAGS instead of CFLAGS
 -# Toshio Kuratomi 2001-04-21
@@ -78,7 +85,8 @@ index 2d7a6f5..1c53585 100644
 -dnl (Also sanity checks the results of xml2-config to some extent)
 -dnl
 -      rm -f conf.xmltest
--      AC_TRY_RUN([
+-      AC_RUN_IFELSE(
+-            [AC_LANG_SOURCE([[
 -#include <stdlib.h>
 -#include <stdio.h>
 -#include <string.h>
@@ -148,12 +156,12 @@ index 2d7a6f5..1c53585 100644
 -        printf("*** being found. The easiest way to fix this is to remove the old version\n");
 -        printf("*** of LIBXML, but you can also set the XML2_CONFIG environment to point to the\n");
 -        printf("*** correct copy of xml2-config. (In this case, you will have to\n");
--        printf("*** modify your LD_LIBRARY_PATH enviroment variable, or edit /etc/ld.so.conf\n");
+-        printf("*** modify your LD_LIBRARY_PATH environment variable, or edit /etc/ld.so.conf\n");
 -        printf("*** so that the correct libraries are found at run-time))\n");
 -    }
 -  return 1;
 -}
--],, no_xml=yes,[echo $ac_n "cross compiling; assumed OK... $ac_c"])
+-]])],, no_xml=yes,[echo $ac_n "cross compiling; assumed OK... $ac_c"])
 -       CPPFLAGS="$ac_save_CPPFLAGS"
 -       LIBS="$ac_save_LIBS"
 -     fi
@@ -178,10 +186,11 @@ index 2d7a6f5..1c53585 100644
 -          echo "*** Could not run libxml test program, checking why..."
 -          CPPFLAGS="$CPPFLAGS $XML_CPPFLAGS"
 -          LIBS="$LIBS $XML_LIBS"
--          AC_TRY_LINK([
+-	  AC_LINK_IFELSE(
+-            [AC_LANG_PROGRAM([[
 -#include <libxml/xmlversion.h>
 -#include <stdio.h>
--],      [ LIBXML_TEST_VERSION; return 0;],
+-]],    [[ LIBXML_TEST_VERSION; return 0;]])],
 -        [ echo "*** The test program compiled, but did not run. This usually means"
 -          echo "*** that the run-time linker is not finding LIBXML or finding the wrong"
 -          echo "*** version of LIBXML. If it is not finding LIBXML, you'll need to set your"
diff --git a/meta/recipes-core/libxml/libxml2/remove-fuzz-from-ptests.patch b/meta/recipes-core/libxml/libxml2/remove-fuzz-from-ptests.patch
new file mode 100644
index 00000000000..e80c46054e5
--- /dev/null
+++ b/meta/recipes-core/libxml/libxml2/remove-fuzz-from-ptests.patch
@@ -0,0 +1,43 @@
+From e49a0d4a8f3f725d6f683854e1cad36a3cd02962 Mon Sep 17 00:00:00 2001
+From: Tony Tascioglu <tony.tascioglu@windriver.com>
+Date: Wed, 19 May 2021 19:43:56 -0400
+Subject: [PATCH] Remove fuzz testing from executing with ptests.
+
+Upstream version 2.9.12 introduced new fuzz-testing and a corresponding
+folder fuzz. These tests are not required for ptests of this package.
+
+This patch removes the fuzz testing targets from the Makefile.
+Otherwise, running the ptests will fail due to the invalid directory.
+
+Signed-off-by: Tony Tascioglu <tony.tascioglu@windriver.com>
+---
+ Makefile.am | 5 ++---
+ 1 file changed, 2 insertions(+), 3 deletions(-)
+
+diff --git a/Makefile.am b/Makefile.am
+index a9284b95..3d7b344d 100644
+--- a/Makefile.am
++++ b/Makefile.am
+@@ -2,9 +2,9 @@
+
+ ACLOCAL_AMFLAGS = -I m4
+
+-SUBDIRS = include . doc example fuzz xstc $(PYTHON_SUBDIR)
++SUBDIRS = include . doc example xstc $(PYTHON_SUBDIR)
+
+-DIST_SUBDIRS = include . doc example fuzz python xstc
++DIST_SUBDIRS = include . doc example python xstc
+
+ AM_CPPFLAGS = -I$(top_builddir)/include -I$(srcdir)/include
+
+@@ -210,7 +210,6 @@ runtests: runtest$(EXEEXT) testrecurse$(EXEEXT) testapi$(EXEEXT) \
+ 	    $(CHECKER) ./runxmlconf$(EXEEXT)
+ 	@(if [ "$(PYTHON_SUBDIR)" != "" ] ; then cd python ; \
+ 	    $(MAKE) tests ; fi)
+-	@cd fuzz; $(MAKE) tests
+
+ check: all runtests
+
+--
+2.25.1
+
diff --git a/meta/recipes-core/libxml/libxml2_2.9.10.bb b/meta/recipes-core/libxml/libxml2_2.9.12.bb
similarity index 85%
rename from meta/recipes-core/libxml/libxml2_2.9.10.bb
rename to meta/recipes-core/libxml/libxml2_2.9.12.bb
index b5fb3e6315e..cb228576098 100644
--- a/meta/recipes-core/libxml/libxml2_2.9.10.bb
+++ b/meta/recipes-core/libxml/libxml2_2.9.12.bb
@@ -5,9 +5,9 @@ BUGTRACKER = "http://bugzilla.gnome.org/buglist.cgi?product=libxml2"
 SECTION = "libs"
 LICENSE = "MIT"
 LIC_FILES_CHKSUM = "file://Copyright;md5=2044417e2e5006b65a8b9067b683fcf1 \
-                    file://hash.c;beginline=6;endline=15;md5=96f7296605eae807670fb08947829969 \
-                    file://list.c;beginline=4;endline=13;md5=cdbfa3dee51c099edb04e39f762ee907 \
-                    file://trio.c;beginline=5;endline=14;md5=6c025753c86d958722ec76e94cae932e"
+                    file://hash.c;beginline=6;endline=15;md5=e77f77b12cb69e203d8b4090a0eee879 \
+                    file://list.c;beginline=4;endline=13;md5=b9c25b021ccaf287e50060602d20f3a7 \
+                    file://trio.c;beginline=5;endline=14;md5=cd4f61e27f88c1d43df112966b1cd28f"
 
 DEPENDS = "zlib virtual/libiconv"
 
@@ -20,17 +20,10 @@ SRC_URI = "http://www.xmlsoft.org/sources/libxml2-${PV}.tar.gz;name=libtar \
            file://libxml-m4-use-pkgconfig.patch \
            file://0001-Make-ptest-run-the-python-tests-if-python-is-enabled.patch \
            file://fix-execution-of-ptests.patch \
-           file://CVE-2020-7595.patch \
-           file://CVE-2019-20388.patch \
-           file://CVE-2020-24977.patch \
-           file://CVE-2021-3517.patch \
-           file://CVE-2021-3537.patch \
-           file://CVE-2021-3518.patch \
+           file://remove-fuzz-from-ptests.patch \
            "
 
-SRC_URI[libtar.md5sum] = "10942a1dc23137a8aa07f0639cbfece5"
-SRC_URI[libtar.sha256sum] = "aafee193ffb8fe0c82d4afef6ef91972cbaf5feea100edc2f262750611b4be1f"
-SRC_URI[testtar.md5sum] = "ae3d1ebe000a3972afa104ca7f0e1b4a"
+SRC_URI[libtar.sha256sum] = "c8d6681e38c56f172892c85ddc0852e1fd4b53b4209e7f4ebf17f7e2eae71d92"
 SRC_URI[testtar.sha256sum] = "96151685cec997e1f9f3387e3626d61e6284d4d6e66e0e440c209286c03e9cc7"
 
 BINCONFIG = "${bindir}/xml2-config"
-- 
2.30.2

