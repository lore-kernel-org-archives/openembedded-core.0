Return-Path: <Liezhi.Yang@windriver.com>
Received: from mail1.windriver.com (mail1.windriver.com [147.11.146.13])
	by mail.openembedded.org (Postfix) with ESMTP id 5128475D85
	for <openembedded-core@lists.openembedded.org>;
	Mon,  6 Jul 2015 10:35:38 +0000 (UTC)
Received: from ALA-HCA.corp.ad.wrs.com (ala-hca.corp.ad.wrs.com
	[147.11.189.40])
	by mail1.windriver.com (8.15.1/8.15.1) with ESMTPS id t66AZaxI026430
	(version=TLSv1 cipher=AES128-SHA bits=128 verify=FAIL)
	for <openembedded-core@lists.openembedded.org>;
	Mon, 6 Jul 2015 03:35:39 -0700 (PDT)
Received: from ala-blade47.wrs.com (147.11.105.67) by ALA-HCA.corp.ad.wrs.com
	(147.11.189.50) with Microsoft SMTP Server id 14.3.224.2;
	Mon, 6 Jul 2015 03:35:36 -0700
From: Robert Yang <liezhi.yang@windriver.com>
To: <openembedded-core@lists.openembedded.org>
Date: Mon, 6 Jul 2015 03:35:34 -0700
Message-ID: <fde60b0b9e20af88c8c031ca4ce3f9cda6bc342d.1436178756.git.liezhi.yang@windriver.com>
X-Mailer: git-send-email 1.7.9.5
In-Reply-To: <cover.1436178756.git.liezhi.yang@windriver.com>
References: <cover.1436178756.git.liezhi.yang@windriver.com>
MIME-Version: 1.0
Subject: [PATCH 1/2] gcc: remove EXTRA_OECONF_INTERMEDIATE
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
X-List-Received-Date: Mon, 06 Jul 2015 10:35:41 -0000
Content-Type: text/plain

The gcc-intermediate had been gone, so remove EXTRA_OECONF_INTERMEDIATE.

Signed-off-by: Robert Yang <liezhi.yang@windriver.com>
---
 meta/recipes-devtools/gcc/gcc-4.8.inc              |   10 ----------
 meta/recipes-devtools/gcc/gcc-4.9.inc              |   10 ----------
 meta/recipes-devtools/gcc/gcc-5.1.inc              |   10 ----------
 meta/recipes-devtools/gcc/gcc-configure-common.inc |    1 -
 4 files changed, 31 deletions(-)

diff --git a/meta/recipes-devtools/gcc/gcc-4.8.inc b/meta/recipes-devtools/gcc/gcc-4.8.inc
index 476aaf9..6a2454d 100644
--- a/meta/recipes-devtools/gcc/gcc-4.8.inc
+++ b/meta/recipes-devtools/gcc/gcc-4.8.inc
@@ -107,16 +107,6 @@ EXTRA_OECONF_INITIAL = "\
     --enable-decimal-float=no \
 "
 
-EXTRA_OECONF_INTERMEDIATE = "\
-    --disable-libmudflap \
-    --disable-libgomp \
-    --disable-libquadmath \
-    --with-system-zlib \
-    --disable-lto \
-    --disable-plugin \
-    --disable-libssp \
-"
-
 EXTRA_OECONF_append_libc-uclibc = " --disable-decimal-float "
 
 EXTRA_OECONF_PATHS = "\ 
diff --git a/meta/recipes-devtools/gcc/gcc-4.9.inc b/meta/recipes-devtools/gcc/gcc-4.9.inc
index 9ed3e09..6f53d1f 100644
--- a/meta/recipes-devtools/gcc/gcc-4.9.inc
+++ b/meta/recipes-devtools/gcc/gcc-4.9.inc
@@ -117,16 +117,6 @@ EXTRA_OECONF_INITIAL = "\
     --enable-decimal-float=no \
 "
 
-EXTRA_OECONF_INTERMEDIATE = "\
-    --disable-libmudflap \
-    --disable-libgomp \
-    --disable-libquadmath \
-    --with-system-zlib \
-    --disable-lto \
-    --disable-plugin \
-    --disable-libssp \
-"
-
 EXTRA_OECONF_append_libc-uclibc = " --disable-decimal-float "
 
 EXTRA_OECONF_PATHS = "\
diff --git a/meta/recipes-devtools/gcc/gcc-5.1.inc b/meta/recipes-devtools/gcc/gcc-5.1.inc
index 1d64f9e..63669a9 100644
--- a/meta/recipes-devtools/gcc/gcc-5.1.inc
+++ b/meta/recipes-devtools/gcc/gcc-5.1.inc
@@ -107,16 +107,6 @@ EXTRA_OECONF_INITIAL = "\
     --enable-decimal-float=no \
 "
 
-EXTRA_OECONF_INTERMEDIATE = "\
-    --disable-libmudflap \
-    --disable-libgomp \
-    --disable-libquadmath \
-    --with-system-zlib \
-    --disable-lto \
-    --disable-plugin \
-    --disable-libssp \
-"
-
 EXTRA_OECONF_append_libc-uclibc = " --disable-decimal-float "
 
 EXTRA_OECONF_PATHS = "\
diff --git a/meta/recipes-devtools/gcc/gcc-configure-common.inc b/meta/recipes-devtools/gcc/gcc-configure-common.inc
index 6c60cf9..a14be73 100644
--- a/meta/recipes-devtools/gcc/gcc-configure-common.inc
+++ b/meta/recipes-devtools/gcc/gcc-configure-common.inc
@@ -25,7 +25,6 @@ OPTSPACE = '${@bb.utils.contains("SPECIAL_ARCH_LIST", "${TARGET_ARCH}", "", "--e
 EXTRA_OECONF_BASE ?= ""
 EXTRA_OECONF_PATHS ?= ""
 EXTRA_OECONF_INITIAL ?= ""
-EXTRA_OECONF_INTERMEDIATE ?= ""
 
 GCCMULTILIB ?= "--disable-multilib"
 GCCTHREADS ?= "posix"
-- 
1.7.9.5


