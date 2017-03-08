Return-Path: <liu.ming50@gmail.com>
Received: from mail-wr0-f193.google.com (mail-wr0-f193.google.com
	[209.85.128.193])
	by mail.openembedded.org (Postfix) with ESMTP id 08F266011B
	for <openembedded-core@lists.openembedded.org>;
	Wed,  8 Mar 2017 14:17:35 +0000 (UTC)
Received: by mail-wr0-f193.google.com with SMTP id g10so4331783wrg.0
	for <openembedded-core@lists.openembedded.org>;
	Wed, 08 Mar 2017 06:17:37 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=from:to:cc:subject:date:message-id;
	bh=PHOLSKy4KdGD1B4mi2SACWBka1BSmLqustGjqSpptBw=;
	b=X4TsayL1u8hZJ897GdAF2d507CrGvhK6Ofcxrf8ukrqI3uU+BdbmST3atNSLFV00YA
	3hl/9TWdU/WzbqVKrsmaLxIa1fkxXl2LK453Rkiiu//xqcQdXMYSvGvia2u1mGkqM9Oa
	b2R5fF1Way5iKRrqTtVdiYwb4eE/Y1ZZ5CXNGbJakQhafHtY3lvaiYfMqNpgWzlIP7/5
	Q3a4UCTF00SGzsNJg3yl6tqle8jT+G3V/uan52/0sFO9Ku7WjVsjOcBnB78ge5y7s5Te
	qYr4efGb6suBxEStyiC7HTbvnUSdTSPV+3f9VZ8sIva/IwjyvCVmZl8oU0WTy2eispdp
	2tDQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:from:to:cc:subject:date:message-id;
	bh=PHOLSKy4KdGD1B4mi2SACWBka1BSmLqustGjqSpptBw=;
	b=WZYni3X9RmWsWd53gK0ITS3wgcu05jLWIjeQJKcBL0jDhrYn8XM9HbCPQnamQpscMa
	Cx3/pzZCqzaTSs3lE3VdRyqYhajncNeZWJX3OaCklKxx4Dx4AtEj3msWhjgppmeBGk2C
	E9/g1ttEeMvDhf+rPPUGTEyTk+YkFf/p+aWujIPhUyWap5qMY7KOY75M5TltF/S86nCZ
	v4+t2hYNKmsLQ2LaZ3ZchCCj2Q883aLFY8Z638WTtc6DkrRYHnbHNPuPCxKPi1wCRMJ9
	UGU3zj3ObsEYxs8wY14atYQwb+7YSMkgM8hDlM0k8Oo5yrNWKXlfnGiFQ0wnxx9Hh1np
	bmdg==
X-Gm-Message-State: AMke39kqDKNsJKKp6L/GE8zq0uIalw45B4mBeWrYtR4Se8t6UWDbPC85xITMSmvWQC0sgA==
X-Received: by 10.223.173.53 with SMTP id p50mr6045014wrc.112.1488982656748;
	Wed, 08 Mar 2017 06:17:36 -0800 (PST)
Received: from peterliu-Precision-M4800.emea.group.atlascopco.com
	([117.136.38.232]) by smtp.gmail.com with ESMTPSA id
	m80sm4869178wmi.34.2017.03.08.06.17.32
	(version=TLS1_2 cipher=ECDHE-RSA-AES128-SHA bits=128/128);
	Wed, 08 Mar 2017 06:17:35 -0800 (PST)
From: liu.ming50@gmail.com
To: openembedded-core@lists.openembedded.org
Date: Wed,  8 Mar 2017 15:17:14 +0100
Message-Id: <1488982634-24222-1-git-send-email-liu.ming50@gmail.com>
X-Mailer: git-send-email 1.9.1
Cc: Ming Liu <peter.x.liu@external.atlascopco.com>
Subject: [PATCH] Do not append to BBCLASSEXTEND
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
X-List-Received-Date: Wed, 08 Mar 2017 14:17:36 -0000

From: Ming Liu <peter.x.liu@external.atlascopco.com>

Replace some "+=/=+" with "=" when setting BBCLASSEXTEND, they are
redundant and inconsistent with the same setting in other recipes.

Signed-off-by: Ming Liu <peter.x.liu@external.atlascopco.com>
---
 meta/recipes-devtools/build-compare/build-compare_git.bb         | 2 +-
 meta/recipes-extended/libsolv/libsolv_0.6.24.bb                  | 2 +-
 meta/recipes-extended/lzip/lzip_1.18.bb                          | 2 +-
 meta/recipes-extended/wget/wget.inc                              | 2 +-
 meta/recipes-support/ca-certificates/ca-certificates_20161130.bb | 2 +-
 meta/recipes-support/lz4/lz4.bb                                  | 2 +-
 meta/recipes-support/lzop/lzop_1.03.bb                           | 2 +-
 7 files changed, 7 insertions(+), 7 deletions(-)

diff --git a/meta/recipes-devtools/build-compare/build-compare_git.bb b/meta/recipes-devtools/build-compare/build-compare_git.bb
index e432143..eb12e40 100644
--- a/meta/recipes-devtools/build-compare/build-compare_git.bb
+++ b/meta/recipes-devtools/build-compare/build-compare_git.bb
@@ -22,7 +22,7 @@ PV = "git+${SRCPV}"
 
 S = "${WORKDIR}/git"
 
-BBCLASSEXTEND += "native nativesdk"
+BBCLASSEXTEND = "native nativesdk"
 
 do_install() {
     install -d ${D}/${bindir}
diff --git a/meta/recipes-extended/libsolv/libsolv_0.6.24.bb b/meta/recipes-extended/libsolv/libsolv_0.6.24.bb
index 6de38b5..73db5ed 100644
--- a/meta/recipes-extended/libsolv/libsolv_0.6.24.bb
+++ b/meta/recipes-extended/libsolv/libsolv_0.6.24.bb
@@ -27,4 +27,4 @@ FILES_${PN}-dev += "${datadir}/cmake/Modules/FindLibSolv.cmake"
 FILES_${PN}-tools = "${bindir}/*"
 FILES_${PN}ext = "${libdir}/${PN}ext.so.*"
 
-BBCLASSEXTEND =+ "native nativesdk"
+BBCLASSEXTEND = "native nativesdk"
diff --git a/meta/recipes-extended/lzip/lzip_1.18.bb b/meta/recipes-extended/lzip/lzip_1.18.bb
index 30c7dd5..c1dc8ce 100644
--- a/meta/recipes-extended/lzip/lzip_1.18.bb
+++ b/meta/recipes-extended/lzip/lzip_1.18.bb
@@ -38,4 +38,4 @@ do_install () {
     fi
 }
 
-BBCLASSEXTEND += "native nativesdk"
+BBCLASSEXTEND = "native nativesdk"
diff --git a/meta/recipes-extended/wget/wget.inc b/meta/recipes-extended/wget/wget.inc
index 9eb051f..1299edb 100644
--- a/meta/recipes-extended/wget/wget.inc
+++ b/meta/recipes-extended/wget/wget.inc
@@ -16,7 +16,7 @@ ALTERNATIVE_PRIORITY = "100"
 
 RRECOMMENDS_${PN} += "ca-certificates"
 
-BBCLASSEXTEND += "nativesdk"
+BBCLASSEXTEND = "nativesdk"
 
 PACKAGECONFIG ??= "${@bb.utils.filter('DISTRO_FEATURES', 'ipv6', d)}"
 PACKAGECONFIG[libuuid] = "--with-libuuid, --without-libuuid,util-linux"
diff --git a/meta/recipes-support/ca-certificates/ca-certificates_20161130.bb b/meta/recipes-support/ca-certificates/ca-certificates_20161130.bb
index e47bad1..42088b9 100644
--- a/meta/recipes-support/ca-certificates/ca-certificates_20161130.bb
+++ b/meta/recipes-support/ca-certificates/ca-certificates_20161130.bb
@@ -80,4 +80,4 @@ do_install_append_class-native () {
 
 RDEPENDS_${PN} += "openssl"
 
-BBCLASSEXTEND += "native nativesdk"
+BBCLASSEXTEND = "native nativesdk"
diff --git a/meta/recipes-support/lz4/lz4.bb b/meta/recipes-support/lz4/lz4.bb
index 18e56d0..03c5a7a 100644
--- a/meta/recipes-support/lz4/lz4.bb
+++ b/meta/recipes-support/lz4/lz4.bb
@@ -18,4 +18,4 @@ do_install() {
 	oe_runmake install
 }
 
-BBCLASSEXTEND += "native nativesdk"
+BBCLASSEXTEND = "native nativesdk"
diff --git a/meta/recipes-support/lzop/lzop_1.03.bb b/meta/recipes-support/lzop/lzop_1.03.bb
index 649e724..6f09002 100644
--- a/meta/recipes-support/lzop/lzop_1.03.bb
+++ b/meta/recipes-support/lzop/lzop_1.03.bb
@@ -26,4 +26,4 @@ do_configure_prepend () {
     install -Dm 0644 ${WORKDIR}/acinclude.m4 ${S}/acinclude.m4
 }
 
-BBCLASSEXTEND += "native nativesdk"
+BBCLASSEXTEND = "native nativesdk"
-- 
1.9.1


