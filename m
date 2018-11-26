Return-Path: <akuster808@gmail.com>
Received: from mail-pl1-f194.google.com (mail-pl1-f194.google.com
	[209.85.214.194])
	by mail.openembedded.org (Postfix) with ESMTP id 122C86C46D
	for <openembedded-core@lists.openembedded.org>;
	Mon, 26 Nov 2018 15:48:06 +0000 (UTC)
Received: by mail-pl1-f194.google.com with SMTP id u18so1488067plq.7
	for <openembedded-core@lists.openembedded.org>;
	Mon, 26 Nov 2018 07:48:08 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=from:to:subject:date:message-id;
	bh=3/VYrMIcmqIGU1H83aucYPSMkuZ3slq298tG/Dr+JVw=;
	b=JCUg2OLv6oB9U+itEaIxqHi+hjKWeYzKgOTC0gZWkBQmPYolGdjnpHNciYC77Jaiwz
	fp9nGXvj2SV9atNBvWyFm0VRiSu96d1RrFjn8+9BHBhwC50Y73fVp1JEvMt/n6scNIdY
	godTbepv8OqJ4foODPhiL2Ct0Y45otHjum84YkWMl9/xfuyjpZ4wkACziR1bRB/q+NXz
	Hsz7uol/OPE3++G4iM7iVTalBqfkFuZtSE9eTEm4lYAkXDv80wTHRsMRtpNeMFiNtJj8
	nsxtVu1wjmUkOgaAevzQLJ69qlthfS7Kj1438H8aUrNuGYcof0hpPENYMqnkpwFImiib
	veIA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:from:to:subject:date:message-id;
	bh=3/VYrMIcmqIGU1H83aucYPSMkuZ3slq298tG/Dr+JVw=;
	b=bXSI9KnPKxdfjsHSdWt1XZAkQEgZx6YWc5qo0OYdfgObb+7C7h3CSoE8EW+1GlmFEX
	FAJB8M+EYbw9P5PRqRbZthxJQ/xK76jAQu4eW95MQ+EY7n2HuAFZKmcOESQHDsfHor3C
	ZoaMHYJiKZqqkW+wkSHbVLAUVhUOtudag5K5PgQnLxBsXyTyV2kL14ZLCOjIELeddcry
	BY9MxP3vTB1mzcumZZ3DQzlGVCClagwyeaHRHKYhnf/ywqXf7jtcm8sd7S7S1L1ZnCsq
	nV1SpRzw107ihMAEtNCCt7ixrAh9f1Y6qP9aj3K5MBwbKkXbP10xF+u2RQEeOyTQC+fe
	UtXQ==
X-Gm-Message-State: AA+aEWY54x6yOoB+LJZY4NTBZFoBlYm9f8filfY1HsBkXRlKE+1s7oXi
	nXOApMIfvaYGLbq33JRZZp3Nl3U1
X-Google-Smtp-Source: AFSGD/ViUULV1KEzLynrfEDr4xocKH9rRQp1kZh973VUhJP0PynnCmOcuIqRj55NyknV8o41RIO6oA==
X-Received: by 2002:a17:902:8346:: with SMTP id
	z6mr28191152pln.340.1543247287826; 
	Mon, 26 Nov 2018 07:48:07 -0800 (PST)
Received: from akuster-ThinkPad-T460s.mvista.com (174-24-96-92.clsp.qwest.net.
	[174.24.96.92]) by smtp.gmail.com with ESMTPSA id
	m67sm2492079pfb.25.2018.11.26.07.48.06
	for <openembedded-core@lists.openembedded.org>
	(version=TLS1_2 cipher=ECDHE-RSA-AES128-SHA bits=128/128);
	Mon, 26 Nov 2018 07:48:07 -0800 (PST)
From: Armin Kuster <akuster808@gmail.com>
To: openembedded-core@lists.openembedded.org
Date: Mon, 26 Nov 2018 08:48:04 -0700
Message-Id: <1543247284-30168-1-git-send-email-akuster808@gmail.com>
X-Mailer: git-send-email 2.7.4
Subject: [sumo][PATCH] postgresql: update to 9.4.20
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
X-List-Received-Date: Mon, 26 Nov 2018 15:48:07 -0000

Bug fix only updates.
see: https://www.postgresql.org/docs/9.4/release-9-4-20.html

Patches refreshed

Signed-off-by: Armin Kuster <akuster808@gmail.com>
---
 .../files/0001-Use-pkg-config-for-libxml2-detection.patch      |  8 ++++----
 meta-oe/recipes-dbs/postgresql/files/not-check-libperl.patch   | 10 +++++-----
 .../postgresql/{postgresql_9.4.17.bb => postgresql_9.4.20.bb}  |  4 ++--
 3 files changed, 11 insertions(+), 11 deletions(-)
 rename meta-oe/recipes-dbs/postgresql/{postgresql_9.4.17.bb => postgresql_9.4.20.bb} (63%)

diff --git a/meta-oe/recipes-dbs/postgresql/files/0001-Use-pkg-config-for-libxml2-detection.patch b/meta-oe/recipes-dbs/postgresql/files/0001-Use-pkg-config-for-libxml2-detection.patch
index ce2a60c..fafbc25 100644
--- a/meta-oe/recipes-dbs/postgresql/files/0001-Use-pkg-config-for-libxml2-detection.patch
+++ b/meta-oe/recipes-dbs/postgresql/files/0001-Use-pkg-config-for-libxml2-detection.patch
@@ -12,11 +12,11 @@ Signed-off-by: Philip Balister <philip@balister.org>
  configure.in | 15 ++-------------
  1 file changed, 2 insertions(+), 13 deletions(-)
 
-Index: postgresql-9.4.15/configure.in
+Index: postgresql-9.4.20/configure.in
 ===================================================================
---- postgresql-9.4.15.orig/configure.in
-+++ postgresql-9.4.15/configure.in
-@@ -759,19 +759,8 @@ PGAC_ARG_BOOL(with, libxml, no, [build w
+--- postgresql-9.4.20.orig/configure.in
++++ postgresql-9.4.20/configure.in
+@@ -789,19 +789,8 @@ PGAC_ARG_BOOL(with, libxml, no, [build w
                [AC_DEFINE([USE_LIBXML], 1, [Define to 1 to build with XML support. (--with-libxml)])])
  
  if test "$with_libxml" = yes ; then
diff --git a/meta-oe/recipes-dbs/postgresql/files/not-check-libperl.patch b/meta-oe/recipes-dbs/postgresql/files/not-check-libperl.patch
index 9715109..c57b421 100644
--- a/meta-oe/recipes-dbs/postgresql/files/not-check-libperl.patch
+++ b/meta-oe/recipes-dbs/postgresql/files/not-check-libperl.patch
@@ -13,16 +13,16 @@ Signed-off-by: Roy Li <rongqing.li@windriver.com>
  configure.in | 2 +-
  1 file changed, 1 insertion(+), 1 deletion(-)
 
-Index: postgresql-9.4.15/configure.in
+Index: postgresql-9.4.20/configure.in
 ===================================================================
---- postgresql-9.4.15.orig/configure.in
-+++ postgresql-9.4.15/configure.in
-@@ -1879,7 +1879,7 @@ if test "$with_tcl" = yes; then
+--- postgresql-9.4.20.orig/configure.in
++++ postgresql-9.4.20/configure.in
+@@ -1931,7 +1931,7 @@ if test "$with_tcl" = yes; then
  fi
  
  # check for <perl.h>
 -if test "$with_perl" = yes; then
 +if test "$with_perl" = yes && test "$cross_compiling" = no; then
    ac_save_CPPFLAGS=$CPPFLAGS
-   CPPFLAGS="$CPPFLAGS -I$perl_archlibexp/CORE"
+   CPPFLAGS="$CPPFLAGS $perl_includespec"
    AC_CHECK_HEADER(perl.h, [], [AC_MSG_ERROR([header file <perl.h> is required for Perl])],
diff --git a/meta-oe/recipes-dbs/postgresql/postgresql_9.4.17.bb b/meta-oe/recipes-dbs/postgresql/postgresql_9.4.20.bb
similarity index 63%
rename from meta-oe/recipes-dbs/postgresql/postgresql_9.4.17.bb
rename to meta-oe/recipes-dbs/postgresql/postgresql_9.4.20.bb
index 061184a..61f623e 100644
--- a/meta-oe/recipes-dbs/postgresql/postgresql_9.4.17.bb
+++ b/meta-oe/recipes-dbs/postgresql/postgresql_9.4.20.bb
@@ -10,5 +10,5 @@ do_compile_prepend_libc-musl() {
     sed -i -e 's/\-lnsl//g' ${B}/src/Makefile.global
 }
 
-SRC_URI[md5sum] = "0a08f4078f5e4a54e764f63ad38a6de3"
-SRC_URI[sha256sum] = "7a320cd335052b840d209dc9688f09965763351c590e3cc7bf577591179fd7c6"
+SRC_URI[md5sum] = "5821867741c821736266f27b6b8a859a"
+SRC_URI[sha256sum] = "eeb1d8ddb2854c9e4d8b5cbd65665260c0ae8cbcb911003f24c2d82ccb97f87f"
-- 
2.7.4


