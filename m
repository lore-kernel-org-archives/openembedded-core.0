Return-Path: <steve@sakoman.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 59637C433EF
	for <webhook@archiver.kernel.org>; Tue, 17 May 2022 18:25:27 +0000 (UTC)
Received: from mail-pg1-f176.google.com (mail-pg1-f176.google.com
 [209.85.215.176])
 by mx.groups.io with SMTP id smtpd.web08.1177.1652811908700518213
 for <openembedded-core@lists.openembedded.org>;
 Tue, 17 May 2022 11:25:21 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@sakoman-com.20210112.gappssmtp.com header.s=20210112
 header.b=5OqgMxE9;
 spf=softfail (domain: sakoman.com, ip: 209.85.215.176,
 mailfrom: steve@sakoman.com)
Received: by mail-pg1-f176.google.com with SMTP id a19so17459199pgw.6
        for <openembedded-core@lists.openembedded.org>;
 Tue, 17 May 2022 11:25:21 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=sakoman-com.20210112.gappssmtp.com; s=20210112;
        h=from:to:subject:date:message-id:in-reply-to:references:mime-version
         :content-transfer-encoding;
        bh=dwHxWXojlfjBwh//mp9OmkbTDhvUTakNa1bCfGHDHsU=;
        b=5OqgMxE9QjeVkFsTp+PMHX7ynSYEcGVm7EcQfo7x/IHv8vGeH6P/0awXX0jBJwplCN
         cyysm89hRFlFSxfnOkoF300MEe02TwPsWv3dmaYGdF1PQrRferPmY7zxFK+5qm8x713w
         CjffTCAM9aTTptv9sWYKb4k1IkJm3h2RfrdXGyttdafkONq/3gpmo5dEvQqv9ReeQXSC
         FLWgRKK+eft4t1WYTeALpwoSPV/UudtN1fDH2UMCFFB39MGeZy7WZwC+3loC5dNHGcw7
         c9wXtaqHvX7ACz8mlxo/BwtwS/7q2DxRRneZr7Lg3jI837D2vbskiGkX7VfmsfaUzu+h
         bgmg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:from:to:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=dwHxWXojlfjBwh//mp9OmkbTDhvUTakNa1bCfGHDHsU=;
        b=XsgPKPGSesED8t3TDVS3itnkAbEkvNrKQBVAy86s1M6U1Iny4Cy/lm7mca0p9mypbT
         7voaNfFax46Ksk3qdSHTTboa+2+zpMoZVFkU4LqC5TwDq2dVNQ70U5DA6YRPSYP+cksE
         g3lNuKxZj/XB+vvjbvNVS48PC4Me/x1BnFOfNejShCuG1MDfs88eyZXJ9tooQahA4/0r
         uh7/UO+nJJYDFYfebvNN/sNQc34DEA+SrPNZ1T4+uJ8ZRg3ggGfW019G+hrqGLrZZWUQ
         h8a/uBvbtmRLFUKho29IbI2DRA6RTBA8QGq1dFGH5FXuCyIBY66tJMEp4b2iR8pFEJ7B
         RKQw==
X-Gm-Message-State: AOAM532bZ0w5tW8r7DzxnaP82YVsAOTHAcCPP9FpPquhk841cDS9x6W2
	u11MVGgr6xhwTinhu+Ipk0DcWEwU6mQWticq
X-Google-Smtp-Source: 
 ABdhPJx6gf8B7aOU8fgnZrgeXKDoj3HsAUV2eP9Vy3Lc/kyeiYL6Jf4zEIIPg3o3847mBOHidnqDwQ==
X-Received: by 2002:a05:6a00:2311:b0:4e1:52bf:e466 with SMTP id
 h17-20020a056a00231100b004e152bfe466mr23598339pfh.77.1652811920340;
        Tue, 17 May 2022 11:25:20 -0700 (PDT)
Received: from hexa.router0800d9.com (dhcp-72-253-6-214.hawaiiantel.net.
 [72.253.6.214])
        by smtp.gmail.com with ESMTPSA id
 f9-20020a170902684900b0015e8d4eb1d1sm9408188pln.27.2022.05.17.11.25.18
        for <openembedded-core@lists.openembedded.org>
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 17 May 2022 11:25:19 -0700 (PDT)
From: Steve Sakoman <steve@sakoman.com>
To: openembedded-core@lists.openembedded.org
Subject: [OE-core][kirkstone 18/31] libxml2: Upgrade 2.9.13 -> 2.9.14
Date: Tue, 17 May 2022 08:24:04 -1000
Message-Id: 
 <393b81058f3b970eb906a7f9daa842d8a0747700.1652811454.git.steve@sakoman.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <cover.1652811454.git.steve@sakoman.com>
References: <cover.1652811454.git.steve@sakoman.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Tue, 17 May 2022 18:25:27 -0000
X-Groupsio-URL: 
 https://lists.openembedded.org/g/openembedded-core/message/165763

From: Jiaqing Zhao <jiaqing.zhao@linux.intel.com>

Security

[CVE-2022-29824] Integer overflow in xmlBuf and xmlBuffer
Fix potential double-free in xmlXPtrStringRangeFunction
Fix memory leak in xmlFindCharEncodingHandler
Normalize XPath strings in-place
Prevent integer-overflow in htmlSkipBlankChars() and xmlSkipBlankChars() (David Kilzer)
Fix leak of xmlElementContent (David Kilzer)

Bug fixes

Fix parsing of subtracted regex character classes
Fix recursion check in xinclude.c
Reset last error in xmlCleanupGlobals
Fix certain combinations of regex range quantifiers
Fix range quantifier on subregex

Improvements

Fix recovery from invalid HTML start tags

Build system, portability

Define LFS macros before including system headers
Initialize XPath floating-point globals
configure: check for icu DEFS (James Hilliard)
configure.ac: produce tar.xz only (GNOME policy) (David Seifert)
CMakeLists.txt: Fix LIBXML_VERSION_NUMBER
Fix build with older Python versions
Fix --without-valid build

Signed-off-by: Jiaqing Zhao <jiaqing.zhao@linux.intel.com>
Signed-off-by: Luca Ceresoli <luca.ceresoli@bootlin.com>
Signed-off-by: Richard Purdie <richard.purdie@linuxfoundation.org>
(cherry picked from commit c4ba21f4012e8859fc793bec7df76e56eb8058ec)
Signed-off-by: Steve Sakoman <steve@sakoman.com>
---
 .../CVE-2022-23308-fix-regression.patch       | 99 -------------------
 .../libxml2/libxml-m4-use-pkgconfig.patch     | 21 ++--
 .../{libxml2_2.9.13.bb => libxml2_2.9.14.bb}  |  5 +-
 3 files changed, 14 insertions(+), 111 deletions(-)
 delete mode 100644 meta/recipes-core/libxml/libxml2/CVE-2022-23308-fix-regression.patch
 rename meta/recipes-core/libxml/{libxml2_2.9.13.bb => libxml2_2.9.14.bb} (96%)

diff --git a/meta/recipes-core/libxml/libxml2/CVE-2022-23308-fix-regression.patch b/meta/recipes-core/libxml/libxml2/CVE-2022-23308-fix-regression.patch
deleted file mode 100644
index e188914613..0000000000
--- a/meta/recipes-core/libxml/libxml2/CVE-2022-23308-fix-regression.patch
+++ /dev/null
@@ -1,99 +0,0 @@
-From 646fe48d1c8a74310c409ddf81fe7df6700052af Mon Sep 17 00:00:00 2001
-From: Nick Wellnhofer <wellnhofer@aevum.de>
-Date: Tue, 22 Feb 2022 11:51:08 +0100
-Subject: [PATCH] Fix --without-valid build
-
-Regressed in commit 652dd12a.
----
- valid.c | 58 ++++++++++++++++++++++++++++-----------------------------
- 1 file changed, 29 insertions(+), 29 deletions(-)
----
-
-From https://github.com/GNOME/libxml2.git
- commit 646fe48d1c8a74310c409ddf81fe7df6700052af
-
-CVE: CVE-2022-23308
-Upstream-Status: Backport
-
-Signed-off-by: Joe Slater <joe.slater@windriver.com>
-
-
-diff --git a/valid.c b/valid.c
-index 8e596f1d..9684683a 100644
---- a/valid.c
-+++ b/valid.c
-@@ -479,35 +479,6 @@ nodeVPop(xmlValidCtxtPtr ctxt)
-     return (ret);
- }
- 
--/**
-- * xmlValidNormalizeString:
-- * @str: a string
-- *
-- * Normalize a string in-place.
-- */
--static void
--xmlValidNormalizeString(xmlChar *str) {
--    xmlChar *dst;
--    const xmlChar *src;
--
--    if (str == NULL)
--        return;
--    src = str;
--    dst = str;
--
--    while (*src == 0x20) src++;
--    while (*src != 0) {
--	if (*src == 0x20) {
--	    while (*src == 0x20) src++;
--	    if (*src != 0)
--		*dst++ = 0x20;
--	} else {
--	    *dst++ = *src++;
--	}
--    }
--    *dst = 0;
--}
--
- #ifdef DEBUG_VALID_ALGO
- static void
- xmlValidPrintNode(xmlNodePtr cur) {
-@@ -2636,6 +2607,35 @@ xmlDumpNotationTable(xmlBufferPtr buf, xmlNotationTablePtr table) {
- 	    (xmlDictOwns(dict, (const xmlChar *)(str)) == 0)))	\
- 	    xmlFree((char *)(str));
- 
-+/**
-+ * xmlValidNormalizeString:
-+ * @str: a string
-+ *
-+ * Normalize a string in-place.
-+ */
-+static void
-+xmlValidNormalizeString(xmlChar *str) {
-+    xmlChar *dst;
-+    const xmlChar *src;
-+
-+    if (str == NULL)
-+        return;
-+    src = str;
-+    dst = str;
-+
-+    while (*src == 0x20) src++;
-+    while (*src != 0) {
-+	if (*src == 0x20) {
-+	    while (*src == 0x20) src++;
-+	    if (*src != 0)
-+		*dst++ = 0x20;
-+	} else {
-+	    *dst++ = *src++;
-+	}
-+    }
-+    *dst = 0;
-+}
-+
- static int
- xmlIsStreaming(xmlValidCtxtPtr ctxt) {
-     xmlParserCtxtPtr pctxt;
--- 
-2.35.1
-
diff --git a/meta/recipes-core/libxml/libxml2/libxml-m4-use-pkgconfig.patch b/meta/recipes-core/libxml/libxml2/libxml-m4-use-pkgconfig.patch
index d211f65da3..cc9da88a29 100644
--- a/meta/recipes-core/libxml/libxml2/libxml-m4-use-pkgconfig.patch
+++ b/meta/recipes-core/libxml/libxml2/libxml-m4-use-pkgconfig.patch
@@ -1,4 +1,4 @@
-From f57da62218cf72c1342da82abafdac6b0a2e4997 Mon Sep 17 00:00:00 2001
+From 7196bce35954c4b46391cb0139aeb15ed628fa54 Mon Sep 17 00:00:00 2001
 From: Tony Tascioglu <tony.tascioglu@windriver.com>
 Date: Fri, 14 May 2021 11:50:35 -0400
 Subject: [PATCH] AM_PATH_XML2 uses xml-config which we disable through
@@ -16,16 +16,18 @@ Rebase to 2.9.9
 Signed-off-by: Hongxu Jia <hongxu.jia@windriver.com>
 
 Updated to apply cleanly to v2.9.12
-
 Signed-off-by: Tony Tascioglu <tony.tascioglu@windriver.com>
+
+Rebase to 2.9.14
+Signed-off-by: Jiaqing Zhao <jiaqing.zhao@linux.intel.com>
 ---
- libxml.m4 | 190 ++----------------------------------------------------
- 1 file changed, 5 insertions(+), 185 deletions(-)
+ libxml.m4 | 189 ++----------------------------------------------------
+ 1 file changed, 5 insertions(+), 184 deletions(-)
 
-Index: libxml2-2.9.13/libxml.m4
-===================================================================
---- libxml2-2.9.13.orig/libxml.m4
-+++ libxml2-2.9.13/libxml.m4
+diff --git a/libxml.m4 b/libxml.m4
+index fc7790c..1c53585 100644
+--- a/libxml.m4
++++ b/libxml.m4
 @@ -1,191 +1,12 @@
 -# Configure paths for LIBXML2
 -# Simon Josefsson 2020-02-12
@@ -223,3 +225,6 @@ Index: libxml2-2.9.13/libxml.m4
 -  AC_SUBST(XML_LIBS)
 -  rm -f conf.xmltest
  ])
+-- 
+2.34.1
+
diff --git a/meta/recipes-core/libxml/libxml2_2.9.13.bb b/meta/recipes-core/libxml/libxml2_2.9.14.bb
similarity index 96%
rename from meta/recipes-core/libxml/libxml2_2.9.13.bb
rename to meta/recipes-core/libxml/libxml2_2.9.14.bb
index e361b53bfd..3081ebf92f 100644
--- a/meta/recipes-core/libxml/libxml2_2.9.13.bb
+++ b/meta/recipes-core/libxml/libxml2_2.9.14.bb
@@ -23,11 +23,8 @@ SRC_URI += "http://www.w3.org/XML/Test/xmlts20080827.tar.gz;subdir=${BP};name=te
            file://remove-fuzz-from-ptests.patch \
            file://libxml-m4-use-pkgconfig.patch \
            "
-# will be in v2.9.14
-#
-SRC_URI += "file://CVE-2022-23308-fix-regression.patch"
 
-SRC_URI[archive.sha256sum] = "276130602d12fe484ecc03447ee5e759d0465558fbc9d6bd144e3745306ebf0e"
+SRC_URI[archive.sha256sum] = "60d74a257d1ccec0475e749cba2f21559e48139efba6ff28224357c7c798dfee"
 SRC_URI[testtar.sha256sum] = "96151685cec997e1f9f3387e3626d61e6284d4d6e66e0e440c209286c03e9cc7"
 
 BINCONFIG = "${bindir}/xml2-config"
-- 
2.25.1


