Return-Path: <alex.kanavin@gmail.com>
Received: from mail-wm1-f65.google.com (mail-wm1-f65.google.com
	[209.85.128.65])
	by mail.openembedded.org (Postfix) with ESMTP id 18ED27FF47
	for <openembedded-core@lists.openembedded.org>;
	Wed, 18 Dec 2019 14:38:13 +0000 (UTC)
Received: by mail-wm1-f65.google.com with SMTP id p9so2090328wmc.2
	for <openembedded-core@lists.openembedded.org>;
	Wed, 18 Dec 2019 06:38:14 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=from:to:cc:subject:date:message-id:in-reply-to:references
	:mime-version:content-transfer-encoding;
	bh=keBLPDEe5j3tbP1LubB/c/sGwtqvvlNetRhD1Odm5G0=;
	b=OqzJDdOZwVUnK2nrLi8/zjzUsJ5Q5WPKqN2GQ/ZvJLqWxOtt+4DwaAVV7mViejHHQ7
	oh2hJz3yJjhOmD4BJ/cmMdrFkccRzoSj4fQYHloHkllEUR1xYQBmvfzI9lv/0kQXlQor
	JYbSwFRjHduHReTtfcRubSQt6w+SgHR0Y/AA0/UlxohOyJis9QlNIu1F6uURMhgKvZ+h
	tBzTr+UFRN1uASbBYn8+vFRbO3cITlL+1Rx3oYeS4a45KIovWDsSzunNukmWbfF4jrEW
	tzh+6Oi1S0Eq/3VqZ8csFvPLe7DTAGfuqOIE7hSEMmaTmXA6P9iM0Vki0fU3ancZyLDX
	FlQA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
	:references:mime-version:content-transfer-encoding;
	bh=keBLPDEe5j3tbP1LubB/c/sGwtqvvlNetRhD1Odm5G0=;
	b=MsVkEZ3U4wqTTre5/dZVceuoTERG93lVjmZLpUcZjdiDXO7M7hK1v9zBi7sDI3pIvM
	qf4yK8VHaJsJUmKH9w1dsm6yoZEtprUlW15PWuj1eXiWtDYTTSV4Ou7taewER/DkdopT
	9dNKERHYzp1+q9IdZ0oa4QBABzOqE8oAk1298uPPlGgJmqY9k0SIoRRe7zypsZV+xKeV
	l02NUpIjMiQ7qFDg4p1zT0mKf21XTmJoW9/ut3qjrxd6VRRGZrs3a/+dtKHqHAXsom1i
	o3rmLTW/ZEpZ/KYFrEAXyHjZRWnQ8G3hL2rgChyenXFpCU/pcPtNFzIBjexSEqdfpg94
	arRQ==
X-Gm-Message-State: APjAAAV7PSsOH0xw7TGD0Te/u//1CyRjXyjzuCkHUtXFRKCWDScg5xNF
	qFpDOBWYMHg0HsgVs9QnuEj3I6whaJI=
X-Google-Smtp-Source: APXvYqzq98KRfqAXeHqtu4YgruN1BD/cAEjJOAQXzaLZgsVv4UnhrVMFJpidTTFP0vZxosnflm5tiA==
X-Received: by 2002:a1c:4c10:: with SMTP id z16mr3890141wmf.136.1576679893635; 
	Wed, 18 Dec 2019 06:38:13 -0800 (PST)
Received: from alexander-box.rd.corpintra.net ([141.113.66.202])
	by smtp.gmail.com with ESMTPSA id
	d10sm2747313wrw.64.2019.12.18.06.38.12
	(version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
	Wed, 18 Dec 2019 06:38:13 -0800 (PST)
From: Alexander Kanavin <alex.kanavin@gmail.com>
To: openembedded-core@lists.openembedded.org
Date: Wed, 18 Dec 2019 15:37:44 +0100
Message-Id: <20191218143758.129308-11-alex.kanavin@gmail.com>
X-Mailer: git-send-email 2.17.1
In-Reply-To: <20191218143758.129308-1-alex.kanavin@gmail.com>
References: <20191218143758.129308-1-alex.kanavin@gmail.com>
MIME-Version: 1.0
Subject: [PATCH 11/25] libtasn1: update to 4.15.0
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
X-List-Received-Date: Wed, 18 Dec 2019 14:38:13 -0000
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit

Drop backports.

Add a patch to help builds on centos 7.

Signed-off-by: Alexander Kanavin <alex.kanavin@gmail.com>
---
 ...x-a-build-issue-with-older-compilers.patch | 35 +++++++++++++++++
 .../gnutls/libtasn1/fix-gtkdoc.patch          | 38 -------------------
 .../gnutls/libtasn1/fix-ldflags.patch         | 31 ---------------
 .../{libtasn1_4.14.bb => libtasn1_4.15.0.bb}  | 12 ++++--
 4 files changed, 43 insertions(+), 73 deletions(-)
 create mode 100644 meta/recipes-support/gnutls/libtasn1/0001-corpus2array-fix-a-build-issue-with-older-compilers.patch
 delete mode 100644 meta/recipes-support/gnutls/libtasn1/fix-gtkdoc.patch
 delete mode 100644 meta/recipes-support/gnutls/libtasn1/fix-ldflags.patch
 rename meta/recipes-support/gnutls/{libtasn1_4.14.bb => libtasn1_4.15.0.bb} (66%)

diff --git a/meta/recipes-support/gnutls/libtasn1/0001-corpus2array-fix-a-build-issue-with-older-compilers.patch b/meta/recipes-support/gnutls/libtasn1/0001-corpus2array-fix-a-build-issue-with-older-compilers.patch
new file mode 100644
index 00000000000..ed0a8f383aa
--- /dev/null
+++ b/meta/recipes-support/gnutls/libtasn1/0001-corpus2array-fix-a-build-issue-with-older-compilers.patch
@@ -0,0 +1,35 @@
+From 0b31e2c749202267c4fd060a695dc1465d512260 Mon Sep 17 00:00:00 2001
+From: Alexander Kanavin <alex.kanavin@gmail.com>
+Date: Wed, 18 Dec 2019 12:53:04 +0100
+Subject: [PATCH] corpus2array: fix a build issue with older compilers
+
+gcc 4.x does not use c99 (or later) by default, so
+a variable needs to be declared outside of the loop.
+
+Upstream-Status: Inappropriate [no longer needed with recent gcc]
+Signed-off-by: Alexander Kanavin <alex.kanavin@gmail.com>
+---
+ fuzz/corpus2array.c | 3 ++-
+ 1 file changed, 2 insertions(+), 1 deletion(-)
+
+diff --git a/fuzz/corpus2array.c b/fuzz/corpus2array.c
+index fc30524..7cefa1e 100644
+--- a/fuzz/corpus2array.c
++++ b/fuzz/corpus2array.c
+@@ -100,6 +100,7 @@ static const char *typename[24] = {
+ int main(void)
+ {
+ 	struct fuzz_elem e;
++        int i;
+ 
+ 	printf("const asn1_static_node tab[] = {\n");
+ 
+@@ -120,7 +121,7 @@ int main(void)
+ 				add = 1;
+ 			}
+ 
+-			for (int i = 8; i < 32 ; i++) {
++			for (i = 8; i < 32 ; i++) {
+ 				if ((e.type & (1U << i)) && typename[i - 8]) {
+ 					printf(add ? "|%s" : ", %s", typename[i - 8]);
+ 					add = 1;
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
similarity index 66%
rename from meta/recipes-support/gnutls/libtasn1_4.14.bb
rename to meta/recipes-support/gnutls/libtasn1_4.15.0.bb
index ef2c1956a24..f679bc36f56 100644
--- a/meta/recipes-support/gnutls/libtasn1_4.14.bb
+++ b/meta/recipes-support/gnutls/libtasn1_4.15.0.bb
@@ -10,15 +10,19 @@ LIC_FILES_CHKSUM = "file://doc/COPYING;md5=d32239bcb673463ab874e80d47fae504 \
 
 SRC_URI = "${GNU_MIRROR}/libtasn1/libtasn1-${PV}.tar.gz \
            file://dont-depend-on-help2man.patch \
-           file://fix-ldflags.patch \
-           file://fix-gtkdoc.patch \
+           file://0001-corpus2array-fix-a-build-issue-with-older-compilers.patch \
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


