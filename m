Return-Path: <ross.burton@intel.com>
Received: from mail-wr0-f175.google.com (mail-wr0-f175.google.com
	[209.85.128.175])
	by mail.openembedded.org (Postfix) with ESMTP id 0CD4278709
	for <openembedded-core@lists.openembedded.org>;
	Wed, 21 Feb 2018 14:45:45 +0000 (UTC)
Received: by mail-wr0-f175.google.com with SMTP id w77so5182715wrc.6
	for <openembedded-core@lists.openembedded.org>;
	Wed, 21 Feb 2018 06:45:47 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=intel-com.20150623.gappssmtp.com; s=20150623;
	h=from:to:subject:date:message-id:mime-version
	:content-transfer-encoding;
	bh=RiERxdA9ojfGA7NSC4NYcY2bd7IybS8ZBu/EL8W9OIk=;
	b=phPsId+LPP0mf8j6vA0ULS7Mhwe9VI+cEJ8gzNQxTjuUc8hmDYYRASXDCyazD7jBo2
	zeGK2x2lBqLBGPt4Nz5/xIQwMPB7nQHQowUbvLrBAr+LmBIUg5PlCI7YkmnfjlizBcfe
	aG1BjhXwaZj9Wf0oU8Ja5ktBL/dGdytd/jcTAhQiLaWQhUuajVw+3ZtMcIJ5xWlzeyHx
	yDB6liveYSit2oZfDvI/XNdT5G4YTneInB0HBcWtf8aJT8waNseG0CmvklnppvJf6c9w
	hoJrKWmHvbeyderjiijb+OW/onBlpNyCSykM5x6ypJcZhiWzLzJeJtp97tggmCLGG+oQ
	yObQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:from:to:subject:date:message-id:mime-version
	:content-transfer-encoding;
	bh=RiERxdA9ojfGA7NSC4NYcY2bd7IybS8ZBu/EL8W9OIk=;
	b=aeY9abozG3WR0c1K6VrCB0m4VMGh89P78gh6xUzdRDWB2a6TlVe+2XUsHbD9yVuquT
	P5aLnjWuBDsi4sy0tqPcw/2Aik8M+nrxdWtEAXPdQYVvVYyFN1Bu5Ql/9nsp8AotT4iY
	zam/dMYiE4URvLoFzjlmdt+vuVQlikgAxCw8aGqaxenGXjGKFEMu0iGUU7+NfBG4Q/+1
	CC8znD2bYyaXN8KgSvV9McRIREYUxb+nmnr/Zh/Fv02eu9TV0RgG92ZFEcXLDxoPDcs7
	iqhNIv2KSmG7oy8huneGE+tDxPuIGJ5F+9ybspzqH+aoHKglSFvqKYh9dodDAtQ06/q1
	HRWA==
X-Gm-Message-State: APf1xPCaB3RyJJdatkkSHlcenHT/CwtgPUgQVaoxzmMQ+trhfWIpTqZ9
	RXtyVOPQcIWC1PWANqIKOLbMqcZl
X-Google-Smtp-Source: AH8x22624vOl+WXhgEfRNn+Tam1/HL8iO3THr6BfvyB+fo2NmusqVzhbpOCZOp7ivAntPCMt1S+BDQ==
X-Received: by 10.223.170.211 with SMTP id i19mr1892522wrc.261.1519224346169; 
	Wed, 21 Feb 2018 06:45:46 -0800 (PST)
Received: from flashheart.burtonini.com (35.106.2.81.in-addr.arpa.
	[81.2.106.35]) by smtp.gmail.com with ESMTPSA id
	y64sm16793915wrb.56.2018.02.21.06.45.44
	for <openembedded-core@lists.openembedded.org>
	(version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
	Wed, 21 Feb 2018 06:45:45 -0800 (PST)
From: Ross Burton <ross.burton@intel.com>
To: openembedded-core@lists.openembedded.org
Date: Wed, 21 Feb 2018 14:45:43 +0000
Message-Id: <20180221144543.2907-1-ross.burton@intel.com>
X-Mailer: git-send-email 2.11.0
MIME-Version: 1.0
Subject: [PATCH] flex: upgrade to 2.6.4
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
X-List-Received-Date: Wed, 21 Feb 2018 14:45:46 -0000
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit

Upgrade to 2.6.4 and use the new tarballs on GitHub.

Remove patches which have been merged upstream.

The new releases of Flex bootstrap differently, but the bootstrapping code isn't
entirely cross-friendly yet so depend on flex-native and pass
--disable-bootstrap.

Signed-off-by: Ross Burton <ross.burton@intel.com>
---
 ...oid-c-comments-in-c-code-fails-with-gcc-6.patch | 64 ----------------------
 .../recipes-devtools/flex/flex/CVE-2016-6354.patch | 59 --------------------
 .../flex/flex/do_not_create_pdf_doc.patch          | 17 ------
 .../flex/{flex_2.6.0.bb => flex_2.6.4.bb}          | 17 +++---
 4 files changed, 8 insertions(+), 149 deletions(-)
 delete mode 100644 meta/recipes-devtools/flex/flex/0002-avoid-c-comments-in-c-code-fails-with-gcc-6.patch
 delete mode 100644 meta/recipes-devtools/flex/flex/CVE-2016-6354.patch
 delete mode 100644 meta/recipes-devtools/flex/flex/do_not_create_pdf_doc.patch
 rename meta/recipes-devtools/flex/{flex_2.6.0.bb => flex_2.6.4.bb} (76%)

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
index 032833ae7a9..00000000000
--- a/meta/recipes-devtools/flex/flex/do_not_create_pdf_doc.patch
+++ /dev/null
@@ -1,17 +0,0 @@
-Upstream-Status: Inappropriate (embedded specific)
-
-Signed-off-by: Laurentiu Palcu <laurentiu.palcu@intel.com>
-
-Index: flex-2.5.37/doc/Makefile.am
-===================================================================
---- flex-2.5.37.orig/doc/Makefile.am	2012-07-21 04:18:27.000000000 +0300
-+++ flex-2.5.37/doc/Makefile.am	2013-07-30 17:57:09.834834531 +0300
-@@ -2,7 +2,7 @@
- 
- info_TEXINFOS =	flex.texi
- dist_man_MANS = flex.1
--dist_doc_DATA= flex.pdf
-+EXTRA_DIST= flex.pdf
- 
- CLEANFILES = \
- 	flex.hks \
diff --git a/meta/recipes-devtools/flex/flex_2.6.0.bb b/meta/recipes-devtools/flex/flex_2.6.4.bb
similarity index 76%
rename from meta/recipes-devtools/flex/flex_2.6.0.bb
rename to meta/recipes-devtools/flex/flex_2.6.4.bb
index a906fe8dc64..3684b0c881b 100644
--- a/meta/recipes-devtools/flex/flex_2.6.0.bb
+++ b/meta/recipes-devtools/flex/flex_2.6.4.bb
@@ -5,29 +5,28 @@ HOMEPAGE = "http://sourceforge.net/projects/flex/"
 SECTION = "devel"
 LICENSE = "BSD"
 
-DEPENDS = "${@bb.utils.contains('PTEST_ENABLED', '1', 'bison-native flex-native', '', d)}"
+DEPENDS = "flex-native ${@bb.utils.contains('PTEST_ENABLED', '1', 'bison-native', '', d)}"
 BBCLASSEXTEND = "native nativesdk"
 
 LIC_FILES_CHKSUM = "file://COPYING;md5=e4742cf92e89040b39486a6219b68067"
 
-SRC_URI = "${SOURCEFORGE_MIRROR}/flex/flex-${PV}.tar.bz2 \
+SRC_URI = "https://github.com/westes/${BPN}/releases/download/v${PV}/${BP}.tar.gz \
            file://run-ptest \
-           file://do_not_create_pdf_doc.patch \
            file://0001-tests-add-a-target-for-building-tests-without-runnin.patch \
-           file://0002-avoid-c-comments-in-c-code-fails-with-gcc-6.patch \
-           file://CVE-2016-6354.patch \
-           ${@bb.utils.contains('PTEST_ENABLED', '1', '', 'file://disable-tests.patch', d)} \
+           file://disable-tests.patch \
            "
 
-SRC_URI[md5sum] = "266270f13c48ed043d95648075084d59"
-SRC_URI[sha256sum] = "24e611ef5a4703a191012f80c1027dc9d12555183ce0ecd46f3636e587e9b8e9"
+SRC_URI[md5sum] = "2882e3179748cc9f9c23ec593d6adc8d"
+SRC_URI[sha256sum] = "e87aae032bf07c26f85ac0ed3250998c37621d95f8bd748b31f15b33c45ee995"
 
-# Flex has moved to github from 2.6.1 onwards
 UPSTREAM_CHECK_URI = "https://github.com/westes/flex/releases"
 UPSTREAM_CHECK_REGEX = "flex-(?P<pver>\d+(\.\d+)+)\.tar"
 
 inherit autotools gettext texinfo ptest
 
+EXTRA_OECONF_append_class-target = " --disable-bootstrap"
+EXTRA_OECONF_append_class-nativesdk = " --disable-bootstrap"
+
 M4 = "${bindir}/m4"
 M4_class-native = "${STAGING_BINDIR_NATIVE}/m4"
 EXTRA_OECONF += "ac_cv_path_M4=${M4}"
-- 
2.11.0


