Return-Path: <akuster808@gmail.com>
Received: from mail-pl1-f195.google.com (mail-pl1-f195.google.com
	[209.85.214.195])
	by mail.openembedded.org (Postfix) with ESMTP id 7E9077F9A5
	for <openembedded-core@lists.openembedded.org>;
	Thu, 28 Nov 2019 15:14:49 +0000 (UTC)
Received: by mail-pl1-f195.google.com with SMTP id w7so11701924plz.12
	for <openembedded-core@lists.openembedded.org>;
	Thu, 28 Nov 2019 07:14:50 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=subject:to:references:from:openpgp:autocrypt:message-id:date
	:user-agent:mime-version:in-reply-to:content-transfer-encoding
	:content-language;
	bh=DQl1niQmP4g+s6Sv4shX2hU5kPgAK2pt9OR6P6gK2zI=;
	b=TM0+HuXIAARnvJQY+iigrQY2s8nGN1IWMZtXhvHFowhk6Ev5qMcOgxTPtSeRyP5Pp8
	bTahi0vDy2DW1/hU58pNhEavrCSo+BptXm0A0K3G9Xbzo7pTR3i0jEtltylgI7ccvUEp
	/oSxODpEL8TVgZFI8HFyDgG6uQOo4eczHnyNi8LHtXFNaKgkphkMpJdUesodg36oscP1
	JEWsjwLbSu6LxY8/lav/B4yz7a9aweX4hbcLoIWhTohP0gJQ7m7BisiUjE0vNrPow5T4
	POAKUwRUTej2XApjfbEq8YQNSc8lcWBo3mt3ed3+aMF/ZkwMlkHrlgI5C8F9cDDU/KOH
	yQtg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:subject:to:references:from:openpgp:autocrypt
	:message-id:date:user-agent:mime-version:in-reply-to
	:content-transfer-encoding:content-language;
	bh=DQl1niQmP4g+s6Sv4shX2hU5kPgAK2pt9OR6P6gK2zI=;
	b=kzUF4Vp8yV4K2hw7EPvsJCQdPwkdSb/Ex4xohMj5ybvVeeoPzdS35YCdcfnG16rj/P
	NpJ1Kdu2whxDkeafQzjWHm6C9KmrosWY3PRJvyMt2U3/PsGisxVTuMWDtUBIWgrD/0QC
	21nWXNudsIak0v9ob1GhzaJprH48WVW6yD2cee3i8ceo9sC5Mz9fnzKkTkBJ/mJ1q2Sa
	sPnpqwWuhM9fMp9faRlqdy2W3MIlV9dcNs/CT51HCNIgpGxMii4CZijs9nCu/BkwdEsA
	vAqvcJ8abS46eZRyOBwrvfwgaXGCJ9ZyE0RdCZzulxBSSISqUdkB6UNmBYncGJas/Tgi
	nB+w==
X-Gm-Message-State: APjAAAXRGBm3I9vLMBPjETzbW35Lq6iBZhDULqfamsPiKfGJ9psylhPO
	gOxOXGLjJ3kLeh0uffUATZDhKr3J
X-Google-Smtp-Source: APXvYqzR3+H5kDQpZuCshDiyLeNyImX7JogccOtQaIfcVi3eLH9QZxg5HexowjuRsQ2iVmv20YkoRw==
X-Received: by 2002:a17:90a:1958:: with SMTP id
	24mr13392867pjh.114.1574954090245; 
	Thu, 28 Nov 2019 07:14:50 -0800 (PST)
Received: from ?IPv6:2601:202:4180:a5c0:1045:7bbb:60b1:28c7?
	([2601:202:4180:a5c0:1045:7bbb:60b1:28c7])
	by smtp.gmail.com with ESMTPSA id
	q184sm21375928pfc.111.2019.11.28.07.14.49
	(version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
	Thu, 28 Nov 2019 07:14:49 -0800 (PST)
To: Alexander Kanavin <alex.kanavin@gmail.com>,
	openembedded-core@lists.openembedded.org
References: <20191127164003.115980-1-alex.kanavin@gmail.com>
	<20191127164003.115980-13-alex.kanavin@gmail.com>
From: akuster808 <akuster808@gmail.com>
Openpgp: preference=signencrypt
Autocrypt: addr=akuster808@gmail.com; prefer-encrypt=mutual; keydata=
	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
	8CS2NxU=
Message-ID: <99022154-a793-98d3-69a0-6b446fe56b92@gmail.com>
Date: Thu, 28 Nov 2019 07:14:48 -0800
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:60.0) Gecko/20100101
	Thunderbird/60.9.0
MIME-Version: 1.0
In-Reply-To: <20191127164003.115980-13-alex.kanavin@gmail.com>
Subject: Re: [PATCH 13/14] flex: update to 2.6.4
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
X-List-Received-Date: Thu, 28 Nov 2019 15:14:49 -0000
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: 8bit
Content-Language: en-US



On 11/27/19 8:40 AM, Alexander Kanavin wrote:
> Add a backport patch that addresses segfaults on newer glibc versions.
>
> Remove:
> CVE-2016-6354.patch (backport)
> 0002-avoid-c-comments-in-c-code-fails-with-gcc-6.patch (issue fixed upstream)

This cause AB build failure

https://errors.yoctoproject.org/Errors/Details/288799/


>
> ptest pass rate is 100%.
>
> Signed-off-by: Alexander Kanavin <alex.kanavin@gmail.com>
> ---
>  ...SE_SYSTEM_EXTENSIONS-in-configure.ac.patch | 32 ++++++++++
>  ...-comments-in-c-code-fails-with-gcc-6.patch | 64 -------------------
>  .../flex/flex/CVE-2016-6354.patch             | 59 -----------------
>  .../flex/flex/do_not_create_pdf_doc.patch     | 17 -----
>  meta/recipes-devtools/flex/flex/run-ptest     |  2 +-
>  .../flex/{flex_2.6.0.bb => flex_2.6.4.bb}     | 10 ++-
>  6 files changed, 37 insertions(+), 147 deletions(-)
>  create mode 100644 meta/recipes-devtools/flex/flex/0001-build-AC_USE_SYSTEM_EXTENSIONS-in-configure.ac.patch
>  delete mode 100644 meta/recipes-devtools/flex/flex/0002-avoid-c-comments-in-c-code-fails-with-gcc-6.patch
>  delete mode 100644 meta/recipes-devtools/flex/flex/CVE-2016-6354.patch
>  delete mode 100644 meta/recipes-devtools/flex/flex/do_not_create_pdf_doc.patch
>  rename meta/recipes-devtools/flex/{flex_2.6.0.bb => flex_2.6.4.bb} (86%)
>
> diff --git a/meta/recipes-devtools/flex/flex/0001-build-AC_USE_SYSTEM_EXTENSIONS-in-configure.ac.patch b/meta/recipes-devtools/flex/flex/0001-build-AC_USE_SYSTEM_EXTENSIONS-in-configure.ac.patch
> new file mode 100644
> index 00000000000..60bf7ce8cfd
> --- /dev/null
> +++ b/meta/recipes-devtools/flex/flex/0001-build-AC_USE_SYSTEM_EXTENSIONS-in-configure.ac.patch
> @@ -0,0 +1,32 @@
> +From ed1f7e9de0d6a1d5a9e581e02a63593d22cf1e52 Mon Sep 17 00:00:00 2001
> +From: Explorer09 <explorer09@gmail.com>
> +Date: Mon, 4 Sep 2017 10:47:33 +0800
> +Subject: [PATCH] build: AC_USE_SYSTEM_EXTENSIONS in configure.ac.
> +
> +This would, e.g. define _GNU_SOURCE in config.h, enabling the
> +reallocarray() prototype in glibc 2.26+ on Linux systems with that
> +version of glibc.
> +
> +Fixes #241.
> +
> +Upstream-Status: Backport
> +Signed-off-by: Alexander Kanavin <alex.kanavin@gmail.com>
> +---
> + configure.ac | 2 ++
> + 1 file changed, 2 insertions(+)
> +
> +diff --git a/configure.ac b/configure.ac
> +index 55e774b..c879fe1 100644
> +--- a/configure.ac
> ++++ b/configure.ac
> +@@ -25,8 +25,10 @@
> + # autoconf requirements and initialization
> + 
> + AC_INIT([the fast lexical analyser generator],[2.6.4],[flex-help@lists.sourceforge.net],[flex])
> ++AC_PREREQ([2.60])
> + AC_CONFIG_SRCDIR([src/scan.l])
> + AC_CONFIG_AUX_DIR([build-aux])
> ++AC_USE_SYSTEM_EXTENSIONS
> + LT_INIT
> + AM_INIT_AUTOMAKE([1.11.3 -Wno-portability foreign check-news std-options dist-lzip parallel-tests subdir-objects])
> + AC_CONFIG_HEADER([src/config.h])
> diff --git a/meta/recipes-devtools/flex/flex/0002-avoid-c-comments-in-c-code-fails-with-gcc-6.patch b/meta/recipes-devtools/flex/flex/0002-avoid-c-comments-in-c-code-fails-with-gcc-6.patch
> deleted file mode 100644
> index 438ca5f5276..00000000000
> --- a/meta/recipes-devtools/flex/flex/0002-avoid-c-comments-in-c-code-fails-with-gcc-6.patch
> +++ /dev/null
> @@ -1,64 +0,0 @@
> -From 7072befe1397af4eb01c3ff7edf99f0cd5076089 Mon Sep 17 00:00:00 2001
> -From: =?UTF-8?q?Andreas=20M=C3=BCller?= <schnitzeltony@googlemail.com>
> -Date: Tue, 30 Aug 2016 14:25:32 +0200
> -Subject: [PATCH] avoid c++ comments in c-code - fails with gcc-6
> -MIME-Version: 1.0
> -Content-Type: text/plain; charset=UTF-8
> -Content-Transfer-Encoding: 8bit
> -
> -fixes:
> -
> -| error: C++ style comments are not allowed in ISO C90
> -| num_to_alloc = 1; // After all that talk, this was set to 1 anyways...
> -
> -Upstream-Status: Pending
> -
> -Signed-off-by: Andreas Müller <schnitzeltony@googlemail.com>
> ----
> - src/flex.skl | 2 +-
> - src/scan.c   | 2 +-
> - src/skel.c   | 2 +-
> - 3 files changed, 3 insertions(+), 3 deletions(-)
> -
> -diff --git a/src/flex.skl b/src/flex.skl
> -index 73a0b9e..ed71627 100644
> ---- a/src/flex.skl
> -+++ b/src/flex.skl
> -@@ -2350,7 +2350,7 @@ void yyFlexLexer::yyensure_buffer_stack(void)
> - 		 * scanner will even need a stack. We use 2 instead of 1 to avoid an
> - 		 * immediate realloc on the next call.
> -          */
> --		num_to_alloc = 1; // After all that talk, this was set to 1 anyways...
> -+		num_to_alloc = 1; /* After all that talk, this was set to 1 anyways... */
> - 		YY_G(yy_buffer_stack) = (struct yy_buffer_state**)yyalloc
> - 								(num_to_alloc * sizeof(struct yy_buffer_state*)
> - 								M4_YY_CALL_LAST_ARG);
> -diff --git a/src/scan.c b/src/scan.c
> -index b55df2d..f1dce75 100644
> ---- a/src/scan.c
> -+++ b/src/scan.c
> -@@ -4672,7 +4672,7 @@ static void yyensure_buffer_stack (void)
> - 		 * scanner will even need a stack. We use 2 instead of 1 to avoid an
> - 		 * immediate realloc on the next call.
> -          */
> --		num_to_alloc = 1; // After all that talk, this was set to 1 anyways...
> -+		num_to_alloc = 1; /* After all that talk, this was set to 1 anyways...*/
> - 		(yy_buffer_stack) = (struct yy_buffer_state**)yyalloc
> - 								(num_to_alloc * sizeof(struct yy_buffer_state*)
> - 								);
> -diff --git a/src/skel.c b/src/skel.c
> -index ef657d3..26cc889 100644
> ---- a/src/skel.c
> -+++ b/src/skel.c
> -@@ -2561,7 +2561,7 @@ const char *skel[] = {
> -   "		 * scanner will even need a stack. We use 2 instead of 1 to avoid an",
> -   "		 * immediate realloc on the next call.",
> -   "         */",
> --  "		num_to_alloc = 1; // After all that talk, this was set to 1 anyways...",
> -+  "		num_to_alloc = 1; /* After all that talk, this was set to 1 anyways... */",
> -   "		YY_G(yy_buffer_stack) = (struct yy_buffer_state**)yyalloc",
> -   "								(num_to_alloc * sizeof(struct yy_buffer_state*)",
> -   "								M4_YY_CALL_LAST_ARG);",
> --- 
> -2.5.5
> -
> diff --git a/meta/recipes-devtools/flex/flex/CVE-2016-6354.patch b/meta/recipes-devtools/flex/flex/CVE-2016-6354.patch
> deleted file mode 100644
> index 216ac7ae1c4..00000000000
> --- a/meta/recipes-devtools/flex/flex/CVE-2016-6354.patch
> +++ /dev/null
> @@ -1,59 +0,0 @@
> -From 3939eccdff598f47e5b37b05d58bf1b44d3796e7 Mon Sep 17 00:00:00 2001
> -From: Jussi Kukkonen <jussi.kukkonen@intel.com>
> -Date: Fri, 7 Oct 2016 14:15:38 +0300
> -Subject: [PATCH] Prevent buffer overflow in yy_get_next_buffer
> -
> -This is upstream commit a5cbe929ac3255d371e698f62dc256afe7006466
> -with some additional backporting to make binutils build again.
> -
> -Upstream-Status: Backport
> -CVE: CVE-2016-6354
> -Signed-off-by: Jussi Kukkonen <jussi.kukkonen@intel.com>
> ----
> - src/flex.skl | 2 +-
> - src/scan.c   | 2 +-
> - src/skel.c   | 2 +-
> - 3 files changed, 3 insertions(+), 3 deletions(-)
> -
> -diff --git a/src/flex.skl b/src/flex.skl
> -index ed71627..814d562 100644
> ---- a/src/flex.skl
> -+++ b/src/flex.skl
> -@@ -1718,7 +1718,7 @@ int yyFlexLexer::yy_get_next_buffer()
> - 
> - 	else
> - 		{
> --			yy_size_t num_to_read =
> -+			int num_to_read =
> - 			YY_CURRENT_BUFFER_LVALUE->yy_buf_size - number_to_move - 1;
> - 
> - 		while ( num_to_read <= 0 )
> -diff --git a/src/scan.c b/src/scan.c
> -index f1dce75..1949872 100644
> ---- a/src/scan.c
> -+++ b/src/scan.c
> -@@ -4181,7 +4181,7 @@ static int yy_get_next_buffer (void)
> - 
> - 	else
> - 		{
> --			yy_size_t num_to_read =
> -+			int num_to_read =
> - 			YY_CURRENT_BUFFER_LVALUE->yy_buf_size - number_to_move - 1;
> - 
> - 		while ( num_to_read <= 0 )
> -diff --git a/src/skel.c b/src/skel.c
> -index 26cc889..0344d18 100644
> ---- a/src/skel.c
> -+++ b/src/skel.c
> -@@ -1929,7 +1929,7 @@ const char *skel[] = {
> -   "",
> -   "	else",
> -   "		{",
> --  "			yy_size_t num_to_read =",
> -+  "			int num_to_read =",
> -   "			YY_CURRENT_BUFFER_LVALUE->yy_buf_size - number_to_move - 1;",
> -   "",
> -   "		while ( num_to_read <= 0 )",
> --- 
> -2.1.4
> -
> diff --git a/meta/recipes-devtools/flex/flex/do_not_create_pdf_doc.patch b/meta/recipes-devtools/flex/flex/do_not_create_pdf_doc.patch
> deleted file mode 100644
> index 29792efee87..00000000000
> --- a/meta/recipes-devtools/flex/flex/do_not_create_pdf_doc.patch
> +++ /dev/null
> @@ -1,17 +0,0 @@
> -Upstream-Status: Inappropriate (embedded specific)
> -
> -Signed-off-by: Laurentiu Palcu <laurentiu.palcu@intel.com>
> -
> -Index: flex-2.6.0/doc/Makefile.am
> -===================================================================
> ---- flex-2.6.0.orig/doc/Makefile.am
> -+++ flex-2.6.0/doc/Makefile.am
> -@@ -2,7 +2,7 @@ help2man = @HELP2MAN@
> - 
> - info_TEXINFOS =	flex.texi
> - dist_man_MANS = flex.1
> --dist_doc_DATA= flex.pdf
> -+EXTRA_DIST= flex.pdf
> - 
> - CLEANFILES = \
> - 	flex.aux \
> diff --git a/meta/recipes-devtools/flex/flex/run-ptest b/meta/recipes-devtools/flex/flex/run-ptest
> index 19db3379002..037301c40fa 100755
> --- a/meta/recipes-devtools/flex/flex/run-ptest
> +++ b/meta/recipes-devtools/flex/flex/run-ptest
> @@ -2,4 +2,4 @@
>  
>  # make would want to rebuild some files with a compiler otherwise :-/
>  make FLEX=/usr/bin/flex -t check-TESTS || true
> -make FLEX=/usr/bin/flex check-TESTS
> +make FLEX=/usr/bin/flex abs_builddir=./ check-TESTS
> diff --git a/meta/recipes-devtools/flex/flex_2.6.0.bb b/meta/recipes-devtools/flex/flex_2.6.4.bb
> similarity index 86%
> rename from meta/recipes-devtools/flex/flex_2.6.0.bb
> rename to meta/recipes-devtools/flex/flex_2.6.4.bb
> index 9bdd99c59f8..347018df1b7 100644
> --- a/meta/recipes-devtools/flex/flex_2.6.0.bb
> +++ b/meta/recipes-devtools/flex/flex_2.6.4.bb
> @@ -10,17 +10,15 @@ BBCLASSEXTEND = "native nativesdk"
>  
>  LIC_FILES_CHKSUM = "file://COPYING;md5=e4742cf92e89040b39486a6219b68067"
>  
> -SRC_URI = "${SOURCEFORGE_MIRROR}/flex/flex-${PV}.tar.bz2 \
> +SRC_URI = "https://github.com/westes/flex/releases/download/v${PV}/flex-${PV}.tar.gz \
>             file://run-ptest \
> -           file://do_not_create_pdf_doc.patch \
>             file://0001-tests-add-a-target-for-building-tests-without-runnin.patch \
> -           file://0002-avoid-c-comments-in-c-code-fails-with-gcc-6.patch \
> -           file://CVE-2016-6354.patch \
>             ${@bb.utils.contains('PTEST_ENABLED', '1', '', 'file://disable-tests.patch', d)} \
> +           file://0001-build-AC_USE_SYSTEM_EXTENSIONS-in-configure.ac.patch \
>             "
>  
> -SRC_URI[md5sum] = "266270f13c48ed043d95648075084d59"
> -SRC_URI[sha256sum] = "24e611ef5a4703a191012f80c1027dc9d12555183ce0ecd46f3636e587e9b8e9"
> +SRC_URI[md5sum] = "2882e3179748cc9f9c23ec593d6adc8d"
> +SRC_URI[sha256sum] = "e87aae032bf07c26f85ac0ed3250998c37621d95f8bd748b31f15b33c45ee995"
>  
>  # Flex has moved to github from 2.6.1 onwards
>  UPSTREAM_CHECK_URI = "https://github.com/westes/flex/releases"


