Return-Path: <alex.kanavin@gmail.com>
Received: from mail-wr1-f42.google.com (mail-wr1-f42.google.com
	[209.85.221.42])
	by mail.openembedded.org (Postfix) with ESMTP id A16267FC9A
	for <openembedded-core@lists.openembedded.org>;
	Wed, 27 Nov 2019 16:40:20 +0000 (UTC)
Received: by mail-wr1-f42.google.com with SMTP id z7so24030848wrl.13
	for <openembedded-core@lists.openembedded.org>;
	Wed, 27 Nov 2019 08:40:22 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=from:to:cc:subject:date:message-id:in-reply-to:references
	:mime-version:content-transfer-encoding;
	bh=JTFz22hChG0t7v6B/ld0yQbMOn91zaOrfVncnX0VCYU=;
	b=s6+y6aF5vCjnf2GkcWVhUNHOBXNhGOBvTbTYxGjNI69Tt3MdFEppsisKc7UvhAebtC
	nXpyzpiBlYmFBTjXNUJyF7sfBHhM8k8CvI3jfbRbqpr28YihM4/a9/E16r9PmaSNGZsz
	JSXByY6QPr21bNsetCQ2vNcbfHoN8DADHHhd4A8GkPFsPfQm5eL7THxaRSe59kOTKfKN
	sM9drRWdtDZ5bH4jstynp/RZqq3ZcWfyxUGyOUwiGo48axbMSzgixTvqi4nZNOCtQbxJ
	GeeutWtGBTwqb7ZlkaD53sdGZi2QAFG6Q+I4M4hecmnOVh52ju4vcwP9dAXgPKeK1/SY
	1zWQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
	:references:mime-version:content-transfer-encoding;
	bh=JTFz22hChG0t7v6B/ld0yQbMOn91zaOrfVncnX0VCYU=;
	b=dgAl6acTSp2dG6hCxUYlwxF8juCkNs+UmV4hXOUmjRimVnGsH0xsL8WIy1qq3fBmbH
	qDGYy1aZF3jpImIQtjFpwE6AeAsllApnW5HGoAF0d7EmtkQRDcUhvV3Ip1uabKXJd/vQ
	8SLf7BqJ8/eBkZa23J0psLqhYGzsu4NVq7jS0NflAz7YaPYPV1DtXYtdw3aZMltGlg/g
	yTd+OGyeMH8S4u0JqqajAmwaB7uiuJHFoxmoVXPAoijQLGVRTlZ5sZ0G+YvMte/onZeZ
	DltNAzc+d/vWpvnKLGms4tTJfkdWgV6e6moC6pYeRQN95BLhdwl8bjEXZ4rdAWUrdCUp
	z6iw==
X-Gm-Message-State: APjAAAWG9Gt0g1hq59VzIDxf94dXgimhHIW8FfpIwCXJCXrehBmfCm5h
	+R4+xDoPWjl/KBEEMckN1fU856Dv
X-Google-Smtp-Source: APXvYqxgHc+Es63DQeLrkrs6IfRqugw+iqNbsvgjPDekkONDUO8/0Mq9MZF0xWxRx26fYC29CG7UKQ==
X-Received: by 2002:adf:fa08:: with SMTP id m8mr45891794wrr.276.1574872820992; 
	Wed, 27 Nov 2019 08:40:20 -0800 (PST)
Received: from alexander-box.rd.corpintra.net ([141.113.66.202])
	by smtp.gmail.com with ESMTPSA id w4sm19743067wrs.1.2019.11.27.08.40.20
	(version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
	Wed, 27 Nov 2019 08:40:20 -0800 (PST)
From: Alexander Kanavin <alex.kanavin@gmail.com>
To: openembedded-core@lists.openembedded.org
Date: Wed, 27 Nov 2019 17:40:02 +0100
Message-Id: <20191127164003.115980-13-alex.kanavin@gmail.com>
X-Mailer: git-send-email 2.17.1
In-Reply-To: <20191127164003.115980-1-alex.kanavin@gmail.com>
References: <20191127164003.115980-1-alex.kanavin@gmail.com>
MIME-Version: 1.0
Subject: [PATCH 13/14] flex: update to 2.6.4
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
X-List-Received-Date: Wed, 27 Nov 2019 16:40:22 -0000
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit

Add a backport patch that addresses segfaults on newer glibc versions.

Remove:
CVE-2016-6354.patch (backport)
0002-avoid-c-comments-in-c-code-fails-with-gcc-6.patch (issue fixed upstream)
do_not_create_pdf_doc.patch (issue fixed upstream)

ptest pass rate is 100%.

Signed-off-by: Alexander Kanavin <alex.kanavin@gmail.com>
---
 ...SE_SYSTEM_EXTENSIONS-in-configure.ac.patch | 32 ++++++++++
 ...-comments-in-c-code-fails-with-gcc-6.patch | 64 -------------------
 .../flex/flex/CVE-2016-6354.patch             | 59 -----------------
 .../flex/flex/do_not_create_pdf_doc.patch     | 17 -----
 meta/recipes-devtools/flex/flex/run-ptest     |  2 +-
 .../flex/{flex_2.6.0.bb => flex_2.6.4.bb}     | 10 ++-
 6 files changed, 37 insertions(+), 147 deletions(-)
 create mode 100644 meta/recipes-devtools/flex/flex/0001-build-AC_USE_SYSTEM_EXTENSIONS-in-configure.ac.patch
 delete mode 100644 meta/recipes-devtools/flex/flex/0002-avoid-c-comments-in-c-code-fails-with-gcc-6.patch
 delete mode 100644 meta/recipes-devtools/flex/flex/CVE-2016-6354.patch
 delete mode 100644 meta/recipes-devtools/flex/flex/do_not_create_pdf_doc.patch
 rename meta/recipes-devtools/flex/{flex_2.6.0.bb => flex_2.6.4.bb} (86%)

diff --git a/meta/recipes-devtools/flex/flex/0001-build-AC_USE_SYSTEM_EXTENSIONS-in-configure.ac.patch b/meta/recipes-devtools/flex/flex/0001-build-AC_USE_SYSTEM_EXTENSIONS-in-configure.ac.patch
new file mode 100644
index 00000000000..60bf7ce8cfd
--- /dev/null
+++ b/meta/recipes-devtools/flex/flex/0001-build-AC_USE_SYSTEM_EXTENSIONS-in-configure.ac.patch
@@ -0,0 +1,32 @@
+From ed1f7e9de0d6a1d5a9e581e02a63593d22cf1e52 Mon Sep 17 00:00:00 2001
+From: Explorer09 <explorer09@gmail.com>
+Date: Mon, 4 Sep 2017 10:47:33 +0800
+Subject: [PATCH] build: AC_USE_SYSTEM_EXTENSIONS in configure.ac.
+
+This would, e.g. define _GNU_SOURCE in config.h, enabling the
+reallocarray() prototype in glibc 2.26+ on Linux systems with that
+version of glibc.
+
+Fixes #241.
+
+Upstream-Status: Backport
+Signed-off-by: Alexander Kanavin <alex.kanavin@gmail.com>
+---
+ configure.ac | 2 ++
+ 1 file changed, 2 insertions(+)
+
+diff --git a/configure.ac b/configure.ac
+index 55e774b..c879fe1 100644
+--- a/configure.ac
++++ b/configure.ac
+@@ -25,8 +25,10 @@
+ # autoconf requirements and initialization
+ 
+ AC_INIT([the fast lexical analyser generator],[2.6.4],[flex-help@lists.sourceforge.net],[flex])
++AC_PREREQ([2.60])
+ AC_CONFIG_SRCDIR([src/scan.l])
+ AC_CONFIG_AUX_DIR([build-aux])
++AC_USE_SYSTEM_EXTENSIONS
+ LT_INIT
+ AM_INIT_AUTOMAKE([1.11.3 -Wno-portability foreign check-news std-options dist-lzip parallel-tests subdir-objects])
+ AC_CONFIG_HEADER([src/config.h])
diff --git a/meta/recipes-devtools/flex/flex/0002-avoid-c-comments-in-c-code-fails-with-gcc-6.patch b/meta/recipes-devtools/flex/flex/0002-avoid-c-comments-in-c-code-fails-with-gcc-6.patch
deleted file mode 100644
index 438ca5f5276..00000000000
--- a/meta/recipes-devtools/flex/flex/0002-avoid-c-comments-in-c-code-fails-with-gcc-6.patch
+++ /dev/null
@@ -1,64 +0,0 @@
-From 7072befe1397af4eb01c3ff7edf99f0cd5076089 Mon Sep 17 00:00:00 2001
-From: =?UTF-8?q?Andreas=20M=C3=BCller?= <schnitzeltony@googlemail.com>
-Date: Tue, 30 Aug 2016 14:25:32 +0200
-Subject: [PATCH] avoid c++ comments in c-code - fails with gcc-6
-MIME-Version: 1.0
-Content-Type: text/plain; charset=UTF-8
-Content-Transfer-Encoding: 8bit
-
-fixes:
-
-| error: C++ style comments are not allowed in ISO C90
-| num_to_alloc = 1; // After all that talk, this was set to 1 anyways...
-
-Upstream-Status: Pending
-
-Signed-off-by: Andreas Müller <schnitzeltony@googlemail.com>
----
- src/flex.skl | 2 +-
- src/scan.c   | 2 +-
- src/skel.c   | 2 +-
- 3 files changed, 3 insertions(+), 3 deletions(-)
-
-diff --git a/src/flex.skl b/src/flex.skl
-index 73a0b9e..ed71627 100644
---- a/src/flex.skl
-+++ b/src/flex.skl
-@@ -2350,7 +2350,7 @@ void yyFlexLexer::yyensure_buffer_stack(void)
- 		 * scanner will even need a stack. We use 2 instead of 1 to avoid an
- 		 * immediate realloc on the next call.
-          */
--		num_to_alloc = 1; // After all that talk, this was set to 1 anyways...
-+		num_to_alloc = 1; /* After all that talk, this was set to 1 anyways... */
- 		YY_G(yy_buffer_stack) = (struct yy_buffer_state**)yyalloc
- 								(num_to_alloc * sizeof(struct yy_buffer_state*)
- 								M4_YY_CALL_LAST_ARG);
-diff --git a/src/scan.c b/src/scan.c
-index b55df2d..f1dce75 100644
---- a/src/scan.c
-+++ b/src/scan.c
-@@ -4672,7 +4672,7 @@ static void yyensure_buffer_stack (void)
- 		 * scanner will even need a stack. We use 2 instead of 1 to avoid an
- 		 * immediate realloc on the next call.
-          */
--		num_to_alloc = 1; // After all that talk, this was set to 1 anyways...
-+		num_to_alloc = 1; /* After all that talk, this was set to 1 anyways...*/
- 		(yy_buffer_stack) = (struct yy_buffer_state**)yyalloc
- 								(num_to_alloc * sizeof(struct yy_buffer_state*)
- 								);
-diff --git a/src/skel.c b/src/skel.c
-index ef657d3..26cc889 100644
---- a/src/skel.c
-+++ b/src/skel.c
-@@ -2561,7 +2561,7 @@ const char *skel[] = {
-   "		 * scanner will even need a stack. We use 2 instead of 1 to avoid an",
-   "		 * immediate realloc on the next call.",
-   "         */",
--  "		num_to_alloc = 1; // After all that talk, this was set to 1 anyways...",
-+  "		num_to_alloc = 1; /* After all that talk, this was set to 1 anyways... */",
-   "		YY_G(yy_buffer_stack) = (struct yy_buffer_state**)yyalloc",
-   "								(num_to_alloc * sizeof(struct yy_buffer_state*)",
-   "								M4_YY_CALL_LAST_ARG);",
--- 
-2.5.5
-
diff --git a/meta/recipes-devtools/flex/flex/CVE-2016-6354.patch b/meta/recipes-devtools/flex/flex/CVE-2016-6354.patch
deleted file mode 100644
index 216ac7ae1c4..00000000000
--- a/meta/recipes-devtools/flex/flex/CVE-2016-6354.patch
+++ /dev/null
@@ -1,59 +0,0 @@
-From 3939eccdff598f47e5b37b05d58bf1b44d3796e7 Mon Sep 17 00:00:00 2001
-From: Jussi Kukkonen <jussi.kukkonen@intel.com>
-Date: Fri, 7 Oct 2016 14:15:38 +0300
-Subject: [PATCH] Prevent buffer overflow in yy_get_next_buffer
-
-This is upstream commit a5cbe929ac3255d371e698f62dc256afe7006466
-with some additional backporting to make binutils build again.
-
-Upstream-Status: Backport
-CVE: CVE-2016-6354
-Signed-off-by: Jussi Kukkonen <jussi.kukkonen@intel.com>
----
- src/flex.skl | 2 +-
- src/scan.c   | 2 +-
- src/skel.c   | 2 +-
- 3 files changed, 3 insertions(+), 3 deletions(-)
-
-diff --git a/src/flex.skl b/src/flex.skl
-index ed71627..814d562 100644
---- a/src/flex.skl
-+++ b/src/flex.skl
-@@ -1718,7 +1718,7 @@ int yyFlexLexer::yy_get_next_buffer()
- 
- 	else
- 		{
--			yy_size_t num_to_read =
-+			int num_to_read =
- 			YY_CURRENT_BUFFER_LVALUE->yy_buf_size - number_to_move - 1;
- 
- 		while ( num_to_read <= 0 )
-diff --git a/src/scan.c b/src/scan.c
-index f1dce75..1949872 100644
---- a/src/scan.c
-+++ b/src/scan.c
-@@ -4181,7 +4181,7 @@ static int yy_get_next_buffer (void)
- 
- 	else
- 		{
--			yy_size_t num_to_read =
-+			int num_to_read =
- 			YY_CURRENT_BUFFER_LVALUE->yy_buf_size - number_to_move - 1;
- 
- 		while ( num_to_read <= 0 )
-diff --git a/src/skel.c b/src/skel.c
-index 26cc889..0344d18 100644
---- a/src/skel.c
-+++ b/src/skel.c
-@@ -1929,7 +1929,7 @@ const char *skel[] = {
-   "",
-   "	else",
-   "		{",
--  "			yy_size_t num_to_read =",
-+  "			int num_to_read =",
-   "			YY_CURRENT_BUFFER_LVALUE->yy_buf_size - number_to_move - 1;",
-   "",
-   "		while ( num_to_read <= 0 )",
--- 
-2.1.4
-
diff --git a/meta/recipes-devtools/flex/flex/do_not_create_pdf_doc.patch b/meta/recipes-devtools/flex/flex/do_not_create_pdf_doc.patch
deleted file mode 100644
index 29792efee87..00000000000
--- a/meta/recipes-devtools/flex/flex/do_not_create_pdf_doc.patch
+++ /dev/null
@@ -1,17 +0,0 @@
-Upstream-Status: Inappropriate (embedded specific)
-
-Signed-off-by: Laurentiu Palcu <laurentiu.palcu@intel.com>
-
-Index: flex-2.6.0/doc/Makefile.am
-===================================================================
---- flex-2.6.0.orig/doc/Makefile.am
-+++ flex-2.6.0/doc/Makefile.am
-@@ -2,7 +2,7 @@ help2man = @HELP2MAN@
- 
- info_TEXINFOS =	flex.texi
- dist_man_MANS = flex.1
--dist_doc_DATA= flex.pdf
-+EXTRA_DIST= flex.pdf
- 
- CLEANFILES = \
- 	flex.aux \
diff --git a/meta/recipes-devtools/flex/flex/run-ptest b/meta/recipes-devtools/flex/flex/run-ptest
index 19db3379002..037301c40fa 100755
--- a/meta/recipes-devtools/flex/flex/run-ptest
+++ b/meta/recipes-devtools/flex/flex/run-ptest
@@ -2,4 +2,4 @@
 
 # make would want to rebuild some files with a compiler otherwise :-/
 make FLEX=/usr/bin/flex -t check-TESTS || true
-make FLEX=/usr/bin/flex check-TESTS
+make FLEX=/usr/bin/flex abs_builddir=./ check-TESTS
diff --git a/meta/recipes-devtools/flex/flex_2.6.0.bb b/meta/recipes-devtools/flex/flex_2.6.4.bb
similarity index 86%
rename from meta/recipes-devtools/flex/flex_2.6.0.bb
rename to meta/recipes-devtools/flex/flex_2.6.4.bb
index 9bdd99c59f8..347018df1b7 100644
--- a/meta/recipes-devtools/flex/flex_2.6.0.bb
+++ b/meta/recipes-devtools/flex/flex_2.6.4.bb
@@ -10,17 +10,15 @@ BBCLASSEXTEND = "native nativesdk"
 
 LIC_FILES_CHKSUM = "file://COPYING;md5=e4742cf92e89040b39486a6219b68067"
 
-SRC_URI = "${SOURCEFORGE_MIRROR}/flex/flex-${PV}.tar.bz2 \
+SRC_URI = "https://github.com/westes/flex/releases/download/v${PV}/flex-${PV}.tar.gz \
            file://run-ptest \
-           file://do_not_create_pdf_doc.patch \
            file://0001-tests-add-a-target-for-building-tests-without-runnin.patch \
-           file://0002-avoid-c-comments-in-c-code-fails-with-gcc-6.patch \
-           file://CVE-2016-6354.patch \
            ${@bb.utils.contains('PTEST_ENABLED', '1', '', 'file://disable-tests.patch', d)} \
+           file://0001-build-AC_USE_SYSTEM_EXTENSIONS-in-configure.ac.patch \
            "
 
-SRC_URI[md5sum] = "266270f13c48ed043d95648075084d59"
-SRC_URI[sha256sum] = "24e611ef5a4703a191012f80c1027dc9d12555183ce0ecd46f3636e587e9b8e9"
+SRC_URI[md5sum] = "2882e3179748cc9f9c23ec593d6adc8d"
+SRC_URI[sha256sum] = "e87aae032bf07c26f85ac0ed3250998c37621d95f8bd748b31f15b33c45ee995"
 
 # Flex has moved to github from 2.6.1 onwards
 UPSTREAM_CHECK_URI = "https://github.com/westes/flex/releases"
-- 
2.17.1


