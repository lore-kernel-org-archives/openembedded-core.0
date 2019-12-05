Return-Path: <alex.kanavin@gmail.com>
Received: from mail-wr1-f65.google.com (mail-wr1-f65.google.com
	[209.85.221.65])
	by mail.openembedded.org (Postfix) with ESMTP id D10977F874
	for <openembedded-core@lists.openembedded.org>;
	Thu,  5 Dec 2019 15:44:16 +0000 (UTC)
Received: by mail-wr1-f65.google.com with SMTP id g17so4219963wro.2
	for <openembedded-core@lists.openembedded.org>;
	Thu, 05 Dec 2019 07:44:18 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=from:to:cc:subject:date:message-id:in-reply-to:references
	:mime-version:content-transfer-encoding;
	bh=Wg3xlYqr28EGufgEq6F2KV0le1TDoELAOnAvZMkysgQ=;
	b=eHj73OO81xIkLxGUxqThcIUJelcSiQ7ZaZ1hfrTDzKi221GBF61Gz1yZM+Yqxfefqg
	6iQ9t544FI/tbIHCCjABbW7YonvcLXI8X+JHlZM4PfIi/HeamoXirV9H7YSHbmgcNGyK
	whltQF8CnqI3Ssl7bnbu8ycqUorMQpEmxoeQPMYvA8vyzA+MtjkRcOExVzMTygDmyyZR
	71KTVqM2KmhmATQov5Ze6aEG6U8tp3KwSITRBAD7PJkdbETaRBYlpCnBFoyGQXAYDMEH
	uQQUFZOVh26oGDscQ+OhaZw75N6x60uS+0djtWEzwiiKfgN+kq5LiCAse6Fx0wov4T9u
	3ibA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
	:references:mime-version:content-transfer-encoding;
	bh=Wg3xlYqr28EGufgEq6F2KV0le1TDoELAOnAvZMkysgQ=;
	b=WYQBQgRUfH1wK3GBuzccUmeAPwgyLb5442XAkdytlYXBv9nq0Rh2nvjUBlhKKgAMco
	VNSLHuwWLnXk3ZxAQGbyQKViCcQ7Bd5KCGWQOAX9P0haKQDEf1Wcux1i1IzoNNjXhMZ4
	rDsBXqe92m1Omod3nLuE7cSm2BfMGrWvLGVwpb28G/dvHd+0+XlUfGSV6l8ZG34KdAiY
	KLOo4+FKoXQ3mdaMT8gwt688FSmpPM3nJNsN3aioOGTx6BEEEHrfQRu9Kss8E/p1Q/Ix
	FeXIyk8tCPwnmgTOu01qfmCC5RbYJvqGpfSNy11K7UWmJubYk65gIx/NSHmSOxMerwxO
	Wq5Q==
X-Gm-Message-State: APjAAAXAm5BOfLrwlRFMfc6QbBXcaJcCUcOHY3US8qHsu7LWQ0J0L12v
	rGRpMqPYzYIpZhJZlFzsq7dt97yR
X-Google-Smtp-Source: APXvYqw6vGMtsZd5XVL0PB5rwl/RxnkTR7JpxhhGpftjxS76uarjEs/THUeZ7V6/CV3uwWomO8TQtw==
X-Received: by 2002:a5d:5283:: with SMTP id c3mr4096088wrv.148.1575560657414; 
	Thu, 05 Dec 2019 07:44:17 -0800 (PST)
Received: from alexander-box.rd.corpintra.net ([141.113.66.202])
	by smtp.gmail.com with ESMTPSA id z64sm223330wmg.30.2019.12.05.07.44.16
	(version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
	Thu, 05 Dec 2019 07:44:17 -0800 (PST)
From: Alexander Kanavin <alex.kanavin@gmail.com>
To: openembedded-core@lists.openembedded.org
Date: Thu,  5 Dec 2019 16:43:49 +0100
Message-Id: <20191205154357.121346-16-alex.kanavin@gmail.com>
X-Mailer: git-send-email 2.17.1
In-Reply-To: <20191205154357.121346-1-alex.kanavin@gmail.com>
References: <20191205154357.121346-1-alex.kanavin@gmail.com>
MIME-Version: 1.0
Subject: [PATCH 16/24] libtasn1: update to 4.15.0
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
X-List-Received-Date: Thu, 05 Dec 2019 15:44:17 -0000
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
 rename meta/recipes-support/gnutls/{libtasn1_4.14.bb => libtasn1_4.15.0.bb} (71%)

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
similarity index 71%
rename from meta/recipes-support/gnutls/libtasn1_4.14.bb
rename to meta/recipes-support/gnutls/libtasn1_4.15.0.bb
index ef2c1956a24..cd00d17b803 100644
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
+    # this utility is not useful and has a bogus RPATH
+    rm ${D}/${bindir}/corpus2array
+}
+
 BBCLASSEXTEND = "native nativesdk"
-- 
2.17.1


