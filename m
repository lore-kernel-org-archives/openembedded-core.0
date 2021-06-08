Received: from mail-ot1-f44.google.com (mail-ot1-f44.google.com [209.85.210.44])
 by mx.groups.io with SMTP id smtpd.web10.13267.1623163445872717607
 for <openembedded-core@lists.openembedded.org>;
 Tue, 08 Jun 2021 07:44:06 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@sakoman-com.20150623.gappssmtp.com header.s=20150623 header.b=r2552pkL;
 spf=softfail (domain: sakoman.com, ip: 209.85.210.44, mailfrom: steve@sakoman.com)
Received: by mail-ot1-f44.google.com with SMTP id c31-20020a056830349fb02903a5bfa6138bso20513991otu.7
        for <openembedded-core@lists.openembedded.org>; Tue, 08 Jun 2021 07:44:05 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=sakoman-com.20150623.gappssmtp.com; s=20150623;
        h=from:to:subject:date:message-id:in-reply-to:references:mime-version
         :content-transfer-encoding;
        bh=kX6Bbc0Oa3tvZq3pgm0uE4N0yE4caPiW3xa4Vx/ANIA=;
        b=r2552pkLN3pUDbvLp5Gk9h/mbpwNvxrSs1VeSbe2myNyrPYjUM20a2kOZ4mJ0RJ7Fz
         7AVZlPLnMJmJ3Nq6hdYtjfrbPQj1eVng0cd9vNEZLJ0GGrmhXKP6AxDUqnyR30Ap2ONY
         8Mz6z1Gq6TIiqaueouQxaAKL6nUJnMEmUPmvVLUuxSbW130EjqORWF2eAkvkc5zmjv+B
         Pg1mxn3iUvrHT3T94VEa5ds0WZ6jPP34feO+2qZ9bBRZu7LqGcblQqhGUv3mRTWRaLFy
         VI6GHpgFPHuYqGR+Zum75eQ6/jU7p40kpl/q9PU7nB3a4OFDBdc4KWHzmDHA9UcW6QaB
         gxgQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=kX6Bbc0Oa3tvZq3pgm0uE4N0yE4caPiW3xa4Vx/ANIA=;
        b=OeOx41Ja3SoUXW/hCtTgZmyiDpV7etD8Kg3+uH2Ydq5oW1s2g8THzZyHpxUs90cWpo
         K2fi+61ik4ty+pT1lV/Y/MNmwEQOYWwhDbqpmYiz47MEnmsG62fxPzQaBVvYWkRWtUc/
         nAmci85OY80L6Xf+J43Nr8pZ9bwh53halx4iDMbWloHK/4EHQNERib/Hb/0R69oCdjNZ
         XUHTNGsAFW7OBnJDJGP+uiJ5Od4s7TNf5mlmCegvbpIX/2/AL3QqAGlf9bZWvNJWTXit
         57SaAJ611u8Wf42O8eI8sQ6adKgBD1TrXA7GuRjE7A41YeAtJ8pBBwSetZk312RWGl4u
         guYg==
X-Gm-Message-State: AOAM530dPt38AHKhz8H3FffewcrnQexrN779GhDHH185veRtY2USzG7E
	iqouTWny7tBFq6G7Z1zI3jl61MG3PD+IZd+ERto=
X-Google-Smtp-Source: ABdhPJxJsXYkuDb7WQFrtuA1V0DI+fT6xm00wY8laEQRgyWSs4OklR/1D4ShfKnLoY3RIxpQnaUJ2A==
X-Received: by 2002:a9d:2034:: with SMTP id n49mr16159142ota.231.1623163444685;
        Tue, 08 Jun 2021 07:44:04 -0700 (PDT)
Return-Path: <steve@sakoman.com>
Received: from localhost.localdomain ([172.243.4.16])
        by smtp.gmail.com with ESMTPSA id l10sm631979otj.17.2021.06.08.07.44.00
        for <openembedded-core@lists.openembedded.org>
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 08 Jun 2021 07:44:04 -0700 (PDT)
From: "Steve Sakoman" <steve@sakoman.com>
To: openembedded-core@lists.openembedded.org
Subject: [OE-core][dunfell 1/6] libxml: fix CVE-2021-3517 CVE-2021-3537
Date: Tue,  8 Jun 2021 04:42:30 -1000
Message-Id: <f177c0ec321f005dd9ce63aec2d700fd53c993ff.1623163071.git.steve@sakoman.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <cover.1623163071.git.steve@sakoman.com>
References: <cover.1623163071.git.steve@sakoman.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

From: Lee Chee Yang <chee.yang.lee@intel.com>

Signed-off-by: Lee Chee Yang <chee.yang.lee@intel.com>
Signed-off-by: Steve Sakoman <steve@sakoman.com>
---
 .../libxml/libxml2/CVE-2021-3517.patch        | 53 +++++++++++++++++++
 .../libxml/libxml2/CVE-2021-3537.patch        | 50 +++++++++++++++++
 meta/recipes-core/libxml/libxml2_2.9.10.bb    |  2 +
 3 files changed, 105 insertions(+)
 create mode 100644 meta/recipes-core/libxml/libxml2/CVE-2021-3517.patch
 create mode 100644 meta/recipes-core/libxml/libxml2/CVE-2021-3537.patch

diff --git a/meta/recipes-core/libxml/libxml2/CVE-2021-3517.patch b/meta/recipes-core/libxml/libxml2/CVE-2021-3517.patch
new file mode 100644
index 0000000000..e88a8ae7c6
--- /dev/null
+++ b/meta/recipes-core/libxml/libxml2/CVE-2021-3517.patch
@@ -0,0 +1,53 @@
+From bf22713507fe1fc3a2c4b525cf0a88c2dc87a3a2 Mon Sep 17 00:00:00 2001
+From: Joel Hockey <joel.hockey@gmail.com>
+Date: Sun, 16 Aug 2020 17:19:35 -0700
+Subject: [PATCH] Validate UTF8 in xmlEncodeEntities
+
+Code is currently assuming UTF-8 without validating. Truncated UTF-8
+input can cause out-of-bounds array access.
+
+Adds further checks to partial fix in 50f06b3e.
+
+Fixes #178
+Upstream-Status: Backport [https://gitlab.gnome.org/GNOME/libxml2/-/commit/bf22713507fe1fc3a2c4b525cf0a88c2dc87a3a2]
+CVE: CVE-2021-3517
+Signed-off-by: Chee Yang Lee <chee.yang.lee@intel.com>
+
+---
+ entities.c | 16 +++++++++++++++-
+ 1 file changed, 15 insertions(+), 1 deletion(-)
+
+diff --git a/entities.c b/entities.c
+index 37b99a56..1a8f86f0 100644
+--- a/entities.c
++++ b/entities.c
+@@ -704,11 +704,25 @@ xmlEncodeEntitiesInternal(xmlDocPtr doc, const xmlChar *input, int attr) {
+ 	    } else {
+ 		/*
+ 		 * We assume we have UTF-8 input.
++		 * It must match either:
++		 *   110xxxxx 10xxxxxx
++		 *   1110xxxx 10xxxxxx 10xxxxxx
++		 *   11110xxx 10xxxxxx 10xxxxxx 10xxxxxx
++		 * That is:
++		 *   cur[0] is 11xxxxxx
++		 *   cur[1] is 10xxxxxx
++		 *   cur[2] is 10xxxxxx if cur[0] is 111xxxxx
++		 *   cur[3] is 10xxxxxx if cur[0] is 1111xxxx
++		 *   cur[0] is not 11111xxx
+ 		 */
+ 		char buf[11], *ptr;
+ 		int val = 0, l = 1;
+ 
+-		if (*cur < 0xC0) {
++		if (((cur[0] & 0xC0) != 0xC0) ||
++		    ((cur[1] & 0xC0) != 0x80) ||
++		    (((cur[0] & 0xE0) == 0xE0) && ((cur[2] & 0xC0) != 0x80)) ||
++		    (((cur[0] & 0xF0) == 0xF0) && ((cur[3] & 0xC0) != 0x80)) ||
++		    (((cur[0] & 0xF8) == 0xF8))) {
+ 		    xmlEntitiesErr(XML_CHECK_NOT_UTF8,
+ 			    "xmlEncodeEntities: input not UTF-8");
+ 		    if (doc != NULL)
+-- 
+GitLab
+
diff --git a/meta/recipes-core/libxml/libxml2/CVE-2021-3537.patch b/meta/recipes-core/libxml/libxml2/CVE-2021-3537.patch
new file mode 100644
index 0000000000..9e64c2a36d
--- /dev/null
+++ b/meta/recipes-core/libxml/libxml2/CVE-2021-3537.patch
@@ -0,0 +1,50 @@
+From babe75030c7f64a37826bb3342317134568bef61 Mon Sep 17 00:00:00 2001
+From: Nick Wellnhofer <wellnhofer@aevum.de>
+Date: Sat, 1 May 2021 16:53:33 +0200
+Subject: [PATCH] Propagate error in xmlParseElementChildrenContentDeclPriv
+
+Check return value of recursive calls to
+xmlParseElementChildrenContentDeclPriv and return immediately in case
+of errors. Otherwise, struct xmlElementContent could contain unexpected
+null pointers, leading to a null deref when post-validating documents
+which aren't well-formed and parsed in recovery mode.
+
+Fixes #243.
+
+Upstream-Status: Backport
+[https://gitlab.gnome.org/GNOME/libxml2/-/commit/babe75030c7f64a37826bb3342317134568bef61]
+CVE: CVE-2021-3537
+Signed-off-by: Chee Yang Lee <chee.yang.lee@intel.com>
+
+---
+ parser.c | 7 +++++++
+ 1 file changed, 7 insertions(+)
+
+diff --git a/parser.c b/parser.c
+index b42e6043..73c27edd 100644
+--- a/parser.c
++++ b/parser.c
+@@ -6208,6 +6208,8 @@ xmlParseElementChildrenContentDeclPriv(xmlParserCtxtPtr ctxt, int inputchk,
+ 	SKIP_BLANKS;
+         cur = ret = xmlParseElementChildrenContentDeclPriv(ctxt, inputid,
+                                                            depth + 1);
++        if (cur == NULL)
++            return(NULL);
+ 	SKIP_BLANKS;
+ 	GROW;
+     } else {
+@@ -6341,6 +6343,11 @@ xmlParseElementChildrenContentDeclPriv(xmlParserCtxtPtr ctxt, int inputchk,
+ 	    SKIP_BLANKS;
+ 	    last = xmlParseElementChildrenContentDeclPriv(ctxt, inputid,
+                                                           depth + 1);
++            if (last == NULL) {
++		if (ret != NULL)
++		    xmlFreeDocElementContent(ctxt->myDoc, ret);
++		return(NULL);
++            }
+ 	    SKIP_BLANKS;
+ 	} else {
+ 	    elem = xmlParseName(ctxt);
+-- 
+GitLab
+
diff --git a/meta/recipes-core/libxml/libxml2_2.9.10.bb b/meta/recipes-core/libxml/libxml2_2.9.10.bb
index db660b9869..097613fb28 100644
--- a/meta/recipes-core/libxml/libxml2_2.9.10.bb
+++ b/meta/recipes-core/libxml/libxml2_2.9.10.bb
@@ -23,6 +23,8 @@ SRC_URI = "http://www.xmlsoft.org/sources/libxml2-${PV}.tar.gz;name=libtar \
            file://CVE-2020-7595.patch \
            file://CVE-2019-20388.patch \
            file://CVE-2020-24977.patch \
+           file://CVE-2021-3517.patch \
+           file://CVE-2021-3537.patch \
            "
 
 SRC_URI[libtar.md5sum] = "10942a1dc23137a8aa07f0639cbfece5"
-- 
2.25.1

