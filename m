Return-Path: <alex.kanavin@gmail.com>
Received: from mail-wr1-f68.google.com (mail-wr1-f68.google.com
	[209.85.221.68])
	by mail.openembedded.org (Postfix) with ESMTP id AEE117F7CB
	for <openembedded-core@lists.openembedded.org>;
	Fri,  6 Dec 2019 13:25:58 +0000 (UTC)
Received: by mail-wr1-f68.google.com with SMTP id a15so7719797wrf.9
	for <openembedded-core@lists.openembedded.org>;
	Fri, 06 Dec 2019 05:26:00 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=from:to:cc:subject:date:message-id:in-reply-to:references
	:mime-version:content-transfer-encoding;
	bh=AfL66+o8hezhHUuX7wH0MfkFnz0d9nbPd/rnbiFD340=;
	b=Dn/gVa/BodSeANc0NbNPWMkw0ahuBUiwpPREbR0ZsbsLXdsPYE1Grbt32yiWWcBeeE
	JTpeYeifr8IiJoPyRHsnBRZFoUXM3NsqvYY0Y5DVGZ6Ai5XxB8LusugdFtp1QM6z+hrf
	LzpHbBFrOL44p7lwFK2YztdsRwZVpUr8wsX0FR6FCcOuyfzwxKdkScs9WhRKqVrJ5hdi
	XfydMTv0yAEUjB27iFVdWITVHLjo92AcRcn3XbBkldGbo5SsqTQMuNNKKJnU2lkFgykE
	6Tbsgpq4t2RDU+9LVNiMpK1432SB6lF7K4OxTUz1ebmF6OusRLLC+wXU22OUXTsr14DX
	YF1w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
	:references:mime-version:content-transfer-encoding;
	bh=AfL66+o8hezhHUuX7wH0MfkFnz0d9nbPd/rnbiFD340=;
	b=h4/YOQLlwgLsAw3WR6zA1rb+44MblAb2khp/TvB7Vus5v6SL52H3vJ5xfRHq5Uiv6o
	tWCrDTusGzNPYuhXvhfaNc2CfHoxXu16IHSk8aurR+YOV76CMO2nWjMDXPgVkje116Id
	SJ/vCg1N5pylj5dUIFwuus8PcUGTFaOH/iL3tOWy/Wa/z5+kMH7huJSY8YM6NrIsq3vG
	2LBOHgJnEvRVE6CXgwGI9XLp0ZLb2j44xZghyuLxbsiSfAEeytbc45/nCDoglVUlDkqD
	SekCTBwdlGxdmBXgV9aYQo66GS3jgWv5Fx9rRuILvcG3HoV6Q1WnRmeJMTGqVydOt6vq
	PVlA==
X-Gm-Message-State: APjAAAWVlcHSq+tJK1iUIyKoVf69sUj+ABLRd9afOarfpAOx7rAuaIs9
	4xkbFcRFz7IfzZNPCS0N6u8wDTpa
X-Google-Smtp-Source: APXvYqyBir7uwye6UxTyQuwFMjw+dk2+xGnD1B6xuH6dGqIyLBjS/+tiuJOzhsDjXPZ+YKyMWNUVMw==
X-Received: by 2002:adf:f091:: with SMTP id n17mr16190288wro.387.1575638759161;
	Fri, 06 Dec 2019 05:25:59 -0800 (PST)
Received: from alexander-box.rd.corpintra.net ([141.113.66.202])
	by smtp.gmail.com with ESMTPSA id
	l15sm16250475wrv.39.2019.12.06.05.25.58
	(version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
	Fri, 06 Dec 2019 05:25:58 -0800 (PST)
From: Alexander Kanavin <alex.kanavin@gmail.com>
To: openembedded-core@lists.openembedded.org
Date: Fri,  6 Dec 2019 14:25:53 +0100
Message-Id: <20191206132553.53449-2-alex.kanavin@gmail.com>
X-Mailer: git-send-email 2.17.1
In-Reply-To: <20191206132553.53449-1-alex.kanavin@gmail.com>
References: <20191206132553.53449-1-alex.kanavin@gmail.com>
MIME-Version: 1.0
Subject: [PATCH 2/2] libtasn1: update to 4.15.0
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
X-List-Received-Date: Fri, 06 Dec 2019 13:25:58 -0000
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit

Drop backports.

Signed-off-by: Alexander Kanavin <alex.kanavin@gmail.com>
---
 .../gnutls/libtasn1/fix-gtkdoc.patch          | 38 -------------------
 .../gnutls/libtasn1/fix-ldflags.patch         | 31 ---------------
 .../{libtasn1_4.14.bb => libtasn1_4.15.0.bb}  | 11 ++++--
 3 files changed, 7 insertions(+), 73 deletions(-)
 delete mode 100644 meta/recipes-support/gnutls/libtasn1/fix-gtkdoc.patch
 delete mode 100644 meta/recipes-support/gnutls/libtasn1/fix-ldflags.patch
 rename meta/recipes-support/gnutls/{libtasn1_4.14.bb => libtasn1_4.15.0.bb} (72%)

diff --git a/meta/recipes-support/gnutls/libtasn1/fix-gtkdoc.patch b/meta/recipes-support/gnutls/libtasn1/fix-gtkdoc.patch
deleted file mode 100644
index bfc9b9fca7e..00000000000
--- a/meta/recipes-support/gnutls/libtasn1/fix-gtkdoc.patch
+++ /dev/null
@@ -1,38 +0,0 @@
-Upstream-Status: Backport [https://gitlab.com/gnutls/libtasn1/merge_requests/49]
-Signed-off-by: Ross Burton <ross.burton@intel.com>
-
-From ebd4f871b5241809f6a5b461444a6d331e15c949 Mon Sep 17 00:00:00 2001
-From: Ross Burton <ross.burton@intel.com>
-Date: Mon, 9 Sep 2019 13:11:39 +0100
-Subject: [PATCH] doc/reference: don't add empty object hierarchy chapter
-
-The object hierarchy section is empty because there are no GObjects in the
-libtasn1 API.  With gtk-doc 1.30 onwards if there are no objects then the object
-hierarchy file won't exist, resulting in a failure when building the
-documentation:
-
-| ../libtasn1-docs.xml:39: element include: XInclude error : could not load ../xml/tree_index.sgml, and no fallback was found
-
-Signed-off-by: Ross Burton <ross.burton@intel.com>
----
- doc/reference/libtasn1-docs.xml | 4 ----
- 1 file changed, 4 deletions(-)
-
-diff --git a/doc/reference/libtasn1-docs.xml b/doc/reference/libtasn1-docs.xml
-index accdb85..f88b888 100644
---- a/doc/reference/libtasn1-docs.xml
-+++ b/doc/reference/libtasn1-docs.xml
-@@ -34,10 +34,6 @@
-         <xi:include href="xml/libtasn1.xml"/>
- 
-   </chapter>
--  <chapter id="object-tree">
--    <title>Object Hierarchy</title>
--    <xi:include href="xml/tree_index.sgml"/>
--  </chapter>
-   <index id="api-index-full">
-     <title>API Index</title>
-     <xi:include href="xml/api-index-full.xml"><xi:fallback /></xi:include>
--- 
-2.20.1
-
diff --git a/meta/recipes-support/gnutls/libtasn1/fix-ldflags.patch b/meta/recipes-support/gnutls/libtasn1/fix-ldflags.patch
deleted file mode 100644
index f18f3c62679..00000000000
--- a/meta/recipes-support/gnutls/libtasn1/fix-ldflags.patch
+++ /dev/null
@@ -1,31 +0,0 @@
-From a6f93b7ace347bc4fe29eb4a8fe4383d786cc8d0 Mon Sep 17 00:00:00 2001
-From: =?UTF-8?q?Tim=20R=C3=BChsen?= <tim.ruehsen@gmx.de>
-Date: Tue, 23 Jul 2019 20:44:01 +0200
-Subject: [PATCH] Fix LDFLAGS to AM_LDFLAGS in src/Makefile.am
-MIME-Version: 1.0
-Content-Type: text/plain; charset=UTF-8
-Content-Transfer-Encoding: 8bit
-
-Signed-off-by: Tim Rühsen <tim.ruehsen@gmx.de>
-Upstream-Status: Backport
-Signed-off-by: Anuj Mittal <anuj.mittal@intel.com>
----
- src/Makefile.am | 2 +-
- 1 file changed, 1 insertion(+), 1 deletion(-)
-
-diff --git a/src/Makefile.am b/src/Makefile.am
-index 5bf3622..4459767 100644
---- a/src/Makefile.am
-+++ b/src/Makefile.am
-@@ -21,7 +21,7 @@ AM_CPPFLAGS = -I$(top_builddir)/lib/includes -I$(top_srcdir)/lib/includes \
-  -I$(top_builddir)/lib/gl -I$(top_srcdir)/lib/gl $(CODE_COVERAGE_CPPFLAGS)
- 
- LDADD = ../lib/libtasn1.la
--LDFLAGS = $(CODE_COVERAGE_LDFLAGS)
-+AM_LDFLAGS = $(CODE_COVERAGE_LDFLAGS)
- 
- bin_PROGRAMS = asn1Parser asn1Coding asn1Decoding
- 
--- 
-2.21.0
-
diff --git a/meta/recipes-support/gnutls/libtasn1_4.14.bb b/meta/recipes-support/gnutls/libtasn1_4.15.0.bb
similarity index 72%
rename from meta/recipes-support/gnutls/libtasn1_4.14.bb
rename to meta/recipes-support/gnutls/libtasn1_4.15.0.bb
index ef2c1956a24..398faa29a86 100644
--- a/meta/recipes-support/gnutls/libtasn1_4.14.bb
+++ b/meta/recipes-support/gnutls/libtasn1_4.15.0.bb
@@ -10,15 +10,18 @@ LIC_FILES_CHKSUM = "file://doc/COPYING;md5=d32239bcb673463ab874e80d47fae504 \
 
 SRC_URI = "${GNU_MIRROR}/libtasn1/libtasn1-${PV}.tar.gz \
            file://dont-depend-on-help2man.patch \
-           file://fix-ldflags.patch \
-           file://fix-gtkdoc.patch \
            "
 
 DEPENDS = "bison-native"
 
-SRC_URI[md5sum] = "e9918200ed4a778e2b3cbe34c1be4205"
-SRC_URI[sha256sum] = "9e604ba5c5c8ea403487695c2e407405820d98540d9de884d6e844f9a9c5ba08"
+SRC_URI[md5sum] = "33e3fb5501bb2142184238c815b0beb8"
+SRC_URI[sha256sum] = "dd77509fe8f5304deafbca654dc7f0ea57f5841f41ba530cff9a5bf71382739e"
 
 inherit autotools texinfo lib_package gtk-doc
 
+do_install_append () {
+    # this utility has a bogus RPATH
+    chrpath -d ${D}/${bindir}/corpus2array
+}
+
 BBCLASSEXTEND = "native nativesdk"
-- 
2.17.1


