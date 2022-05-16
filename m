Return-Path: <davidegarde2000@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id B051BC433FE
	for <webhook@archiver.kernel.org>; Mon, 16 May 2022 09:50:18 +0000 (UTC)
Received: from mail-ej1-f48.google.com (mail-ej1-f48.google.com
 [209.85.218.48])
 by mx.groups.io with SMTP id smtpd.web11.26903.1652694609433258996
 for <openembedded-core@lists.openembedded.org>;
 Mon, 16 May 2022 02:50:09 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20210112 header.b=VI7UwFdc;
 spf=pass (domain: gmail.com, ip: 209.85.218.48,
 mailfrom: davidegarde2000@gmail.com)
Received: by mail-ej1-f48.google.com with SMTP id z2so27549148ejj.3
        for <openembedded-core@lists.openembedded.org>;
 Mon, 16 May 2022 02:50:09 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=n6BfT0ZOY8sKC44vjWNl13o/oavXJFLWnt+YnrWwiUc=;
        b=VI7UwFdc70HdgjlrI3sHfYx+2J3Xbrp7BddLKyP1pWp6c2vUp0Madsh2sQgMNkr4kK
         7fnWacMidxSLr52GArYCxNLgkqKNziYfiM/L7nNrehU2jglJJlLN/mXK4OOcQGqPRYEu
         x9dU1ohRqGQJUA3m/cERoZH04TMjiGhfYH5/ZbbbSU3z50pJCC7eE4AFWVe6q5t1bgVy
         1ctdewT8VlCQ0mxBph0JO39uVS9Rp70NPE8V+9k31yt0h3BCbaXF0SjJswsRoEF1JzRb
         q8GHt8W6wOSKIQjymeVCsjPlcApUsGF47Vsk/W+dr4ArEHQpcIN3bDLh3eAyZ2gqBh7z
         svFg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=n6BfT0ZOY8sKC44vjWNl13o/oavXJFLWnt+YnrWwiUc=;
        b=2XuYr5xarC+YeuQPEh2RhJ7+4q8ch0JSIzXt/KKwvCr/sJx3dTL8awvfSu9WKEyLkr
         ixfzvo8Bm3oRaFV7UvpD1IK7sykfseRkOMynO18YllBaHyZ6+B/Zxyp9pLLArpk+yvyf
         PqPrMtqvnZVCs+D+g3RWkJgXW6lnzfrAPFq5Xbz5Xen87pkfLpv6RypAqehX4C7qt4ji
         1gnSxEmOZvlVBllA7seq1J4CGRlTnEJ1ALr7AQ9GTlzyJ7mgoFWu78HvU3kvil46AVAd
         r+uP28y7+RV6v3LVRthHUzb4aioFQm25pI6Myzpuq0n7YT+hrXiBjSNQuHlyMJyLz84r
         YraA==
X-Gm-Message-State: AOAM532fA7JStMnLpeRa2S3V6oZm01upy5gE3ZqHeu0iC8PoDC178ARX
	DKEAbhjLOQilsmsQz1zpmqMHzdAAr84=
X-Google-Smtp-Source: 
 ABdhPJzLhAvN+eoCh1JRvkyBJnLdI1V6eJ9hrleTwDihFqrZoW72OOyUSeY98h5zYnV1vtDxzdgC2g==
X-Received: by 2002:a17:907:3e2a:b0:6f4:d700:2e65 with SMTP id
 hp42-20020a1709073e2a00b006f4d7002e65mr14782065ejc.624.1652694607462;
        Mon, 16 May 2022 02:50:07 -0700 (PDT)
Received: from tony3oo3-XPS-13-9370.home
 (host-87-5-19-80.retail.telecomitalia.it. [87.5.19.80])
        by smtp.gmail.com with ESMTPSA id
 y21-20020a056402171500b0042617ba639esm4950548edu.40.2022.05.16.02.50.06
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 16 May 2022 02:50:07 -0700 (PDT)
From: Davide Gardenal <davidegarde2000@gmail.com>
X-Google-Original-From: Davide Gardenal <davide.gardenal@huawei.com>
To: openembedded-core@lists.openembedded.org
Cc: Davide Gardenal <davide.gardenal@huawei.com>,
	Jiaqing Zhao <jiaqing.zhao@linux.intel.com>,
	Luca Ceresoli <luca.ceresoli@bootlin.com>,
	Richard Purdie <richard.purdie@linuxfoundation.org>
Subject: [kirkstone][PATCH] libxml2: Upgrade 2.9.13 -> 2.9.14
Date: Mon, 16 May 2022 11:49:50 +0200
Message-Id: <20220516094950.1033277-1-davide.gardenal@huawei.com>
X-Mailer: git-send-email 2.32.0
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Mon, 16 May 2022 09:50:18 -0000
X-Groupsio-URL: 
 https://lists.openembedded.org/g/openembedded-core/message/165671

Signed-off-by: Jiaqing Zhao <jiaqing.zhao@linux.intel.com>
Signed-off-by: Luca Ceresoli <luca.ceresoli@bootlin.com>
Signed-off-by: Richard Purdie <richard.purdie@linuxfoundation.org>

Cherry-picked from master/c4ba21f4012e8859fc793bec7df76e56eb8058ec

Signed-off-by: Davide Gardenal <davide.gardenal@huawei.com>
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
2.32.0


