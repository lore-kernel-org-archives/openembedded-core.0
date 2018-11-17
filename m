Return-Path: <richard.purdie@linuxfoundation.org>
Received: from mail-wm1-f66.google.com (mail-wm1-f66.google.com
	[209.85.128.66])
	by mail.openembedded.org (Postfix) with ESMTP id 76A086C26C
	for <openembedded-core@lists.openembedded.org>;
	Sat, 17 Nov 2018 22:57:59 +0000 (UTC)
Received: by mail-wm1-f66.google.com with SMTP id p2-v6so1880455wmc.2
	for <openembedded-core@lists.openembedded.org>;
	Sat, 17 Nov 2018 14:58:00 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=linuxfoundation.org; s=google;
	h=from:to:subject:date:message-id:in-reply-to:references;
	bh=/l5sQdZdgNog/4FZ8b6CKN6Ys9RqHqcjyOHmm/2cIJA=;
	b=JIztu7dAGBoj/ZpQedkuQFLrRo5DjJjyLAXd5R56Yc4oNOyVgkcdS+7LFTZeMtZOyu
	SAukJXCQ5cjD+K+8irdNCSOdLLjbStPdf+oRvFl6E10n+BiuMndJUeSsZOZwZhuvnJXW
	Qp0iYTpymd7Pc4C89ueLsWsiYnPoMxmm6LQuY=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:from:to:subject:date:message-id:in-reply-to
	:references;
	bh=/l5sQdZdgNog/4FZ8b6CKN6Ys9RqHqcjyOHmm/2cIJA=;
	b=EEjQBMfcGb4hFWXF12hmbR8hJIhGKUvLuwWSedmIkzJE4n1TNTEjWiezAgFeg5xbsS
	W2Btwe9Kttm0ArtN3rjWGBlZQbDiooMHGoEvtUjGkYpym8yrFmBu8SNu57xKZ4+5rA/6
	gbEmRScqdcR6hmSZnbbbf8UGt1yw04qijEAnTqgc6pacr/cG7EPuVX+2pDyhrjlKa+i+
	BASpCiClt9CvVeKuZGxwBghDI62jCkaVVEh/fnGE1+qvr4kdsUDn2whiR1Xc/c5o9/Zz
	l/p9Tsb27j7HHMffPJiymU96DCw+s/OBPVLHkTEp45n8v9MuwCO/wG4NLHLRZ6uZhV7o
	MqqQ==
X-Gm-Message-State: AA+aEWZnW2W+CcchGTkW9WMAJrawAr9SNI9choGfjkacnizodgsHzPb4
	6142mZzuk+dbB3aGAMSFtQdQyzf2Vjc=
X-Google-Smtp-Source: AJdET5dnwKCqWlpgb3qslDVTyAEyMBz8d4vtP/Ryf+5tEeoGT6FUg5uaZ8tTp1cPNYPxPvusHMn6vQ==
X-Received: by 2002:a1c:f41:: with SMTP id 62mr2398375wmp.96.1542495479537;
	Sat, 17 Nov 2018 14:57:59 -0800 (PST)
Received: from hex.int.rpsys.net (5751f4a1.skybroadband.com. [87.81.244.161])
	by smtp.gmail.com with ESMTPSA id
	l15sm12658470wrw.4.2018.11.17.14.57.58
	for <openembedded-core@lists.openembedded.org>
	(version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
	Sat, 17 Nov 2018 14:57:58 -0800 (PST)
From: Richard Purdie <richard.purdie@linuxfoundation.org>
To: openembedded-core@lists.openembedded.org
Date: Sat, 17 Nov 2018 22:57:48 +0000
Message-Id: <20181117225753.15733-4-richard.purdie@linuxfoundation.org>
X-Mailer: git-send-email 2.17.1
In-Reply-To: <20181117225753.15733-1-richard.purdie@linuxfoundation.org>
References: <20181117225753.15733-1-richard.purdie@linuxfoundation.org>
Subject: [PATCH 4/9] nasm: Upgrade 2.13.03 -> 2.14
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
X-List-Received-Date: Sat, 17 Nov 2018 22:58:00 -0000

The patches are all backports or have equivalent changes in the new
release so can be dropped.

Upstream reworked the install handling to use DESTDIR instead of INSTALLROOT
and we no longer need to create directories.

Signed-off-by: Richard Purdie <richard.purdie@linuxfoundation.org>
---
 ...are-not-reading-past-end-of-a-buffer.patch | 65 -------------------
 ...ure-function-attribute-from-seg_init.patch | 27 --------
 ...001-assemble-Check-global-line-limit.patch | 50 --------------
 ...0001-eval-Eliminate-division-by-zero.patch | 40 ------------
 .../nasm/nasm/0001-fix-CVE-2018-8882.patch    | 30 ---------
 ...parse_size-Check-for-string-provided.patch | 37 -----------
 meta/recipes-devtools/nasm/nasm_2.13.03.bb    | 35 ----------
 meta/recipes-devtools/nasm/nasm_2.14.bb       | 25 +++++++
 8 files changed, 25 insertions(+), 284 deletions(-)
 delete mode 100644 meta/recipes-devtools/nasm/nasm/0001-Verify-that-we-are-not-reading-past-end-of-a-buffer.patch
 delete mode 100644 meta/recipes-devtools/nasm/nasm/0001-asmlib-Drop-pure-function-attribute-from-seg_init.patch
 delete mode 100644 meta/recipes-devtools/nasm/nasm/0001-assemble-Check-global-line-limit.patch
 delete mode 100644 meta/recipes-devtools/nasm/nasm/0001-eval-Eliminate-division-by-zero.patch
 delete mode 100644 meta/recipes-devtools/nasm/nasm/0001-fix-CVE-2018-8882.patch
 delete mode 100644 meta/recipes-devtools/nasm/nasm/0001-preproc-parse_size-Check-for-string-provided.patch
 delete mode 100644 meta/recipes-devtools/nasm/nasm_2.13.03.bb
 create mode 100644 meta/recipes-devtools/nasm/nasm_2.14.bb

diff --git a/meta/recipes-devtools/nasm/nasm/0001-Verify-that-we-are-not-reading-past-end-of-a-buffer.patch b/meta/recipes-devtools/nasm/nasm/0001-Verify-that-we-are-not-reading-past-end-of-a-buffer.patch
deleted file mode 100644
index a56a08b5a82..00000000000
--- a/meta/recipes-devtools/nasm/nasm/0001-Verify-that-we-are-not-reading-past-end-of-a-buffer.patch
+++ /dev/null
@@ -1,65 +0,0 @@
-From c5785fdf1d660eaefb9711284414262d0cfe8843 Mon Sep 17 00:00:00 2001
-From: Adam Majer <amajer@suse.de>
-Date: Fri, 17 Aug 2018 14:48:17 +0800
-Subject: [PATCH] Verify that we are not reading past end of a buffer
-
-Simple reproducer is just,
-
-    ret &d:ep
-
-which triggers a buffer overread due to parsing of an invalid
-segment override.
-
-Signed-off-by: Adam Majer <amajer@suse.de>
-
-Upstream-Status: Submitted [https://bugzilla.nasm.us/show_bug.cgi?id=3392447]
-CVE: CVE-2018-8883
-Signed-off-by: Hongxu Jia <hongxu.jia@windriver.com>
----
- include/opflags.h | 2 +-
- include/tables.h  | 1 +
- x86/regs.pl       | 3 ++-
- 3 files changed, 4 insertions(+), 2 deletions(-)
-
-diff --git a/include/opflags.h b/include/opflags.h
-index ef2838c1..8d4b6b1e 100644
---- a/include/opflags.h
-+++ b/include/opflags.h
-@@ -166,7 +166,7 @@
- #define REG_CLASS_BND           GEN_REG_CLASS(9)
- 
- #define is_class(class, op)         (!((opflags_t)(class) & ~(opflags_t)(op)))
--#define is_reg_class(class, reg)    is_class((class), nasm_reg_flags[(reg)])
-+#define is_reg_class(class, reg)    is_class((class), ((reg) < nasm_reg_flags_size ? nasm_reg_flags[(reg)] : 0))
- 
- #define IS_SREG(reg)                is_reg_class(REG_SREG, (reg))
- #define IS_FSGS(reg)                is_reg_class(REG_FSGS, (reg))
-diff --git a/include/tables.h b/include/tables.h
-index 24a665e2..458752ce 100644
---- a/include/tables.h
-+++ b/include/tables.h
-@@ -64,6 +64,7 @@ extern const char * const nasm_reg_names[];
- typedef uint64_t opflags_t;
- typedef uint16_t  decoflags_t;
- extern const opflags_t nasm_reg_flags[];
-+extern const size_t nasm_reg_flags_size;
- /* regvals.c */
- extern const int nasm_regvals[];
- 
-diff --git a/x86/regs.pl b/x86/regs.pl
-index 3a1b56f5..cb5cea68 100755
---- a/x86/regs.pl
-+++ b/x86/regs.pl
-@@ -158,7 +158,8 @@ if ( $fmt eq 'h' ) {
- 	printf "    %-15s /* %-5s */\n",
- 		$regs{$reg}.',', $reg;
-     }
--    print "};\n";
-+    print "};\n\n";
-+    print "const size_t nasm_reg_flags_size = sizeof(nasm_reg_flags) / sizeof(opflags_t);\n";
- } elsif ( $fmt eq 'vc' ) {
-     # Output regvals.c
-     print "/* automatically generated from $file - do not edit */\n\n";
--- 
-2.17.1
-
diff --git a/meta/recipes-devtools/nasm/nasm/0001-asmlib-Drop-pure-function-attribute-from-seg_init.patch b/meta/recipes-devtools/nasm/nasm/0001-asmlib-Drop-pure-function-attribute-from-seg_init.patch
deleted file mode 100644
index 12ae3a94df3..00000000000
--- a/meta/recipes-devtools/nasm/nasm/0001-asmlib-Drop-pure-function-attribute-from-seg_init.patch
+++ /dev/null
@@ -1,27 +0,0 @@
-From 77c3a77210d8ca8b94e999c711156e984a8dc737 Mon Sep 17 00:00:00 2001
-From: Khem Raj <raj.khem@gmail.com>
-Date: Sat, 31 Mar 2018 11:05:33 -0700
-Subject: [PATCH] asmlib: Drop pure function attribute from seg_init
-
-seg_init returns void, so it is impure function
-
-Signed-off-by: Khem Raj <raj.khem@gmail.com>
----
-Upstream-Status: Submitted
-
- include/nasmlib.h | 2 +-
- 1 file changed, 1 insertion(+), 1 deletion(-)
-
-diff --git a/include/nasmlib.h b/include/nasmlib.h
-index 79e866b..b80b7e2 100644
---- a/include/nasmlib.h
-+++ b/include/nasmlib.h
-@@ -191,7 +191,7 @@ int64_t readstrnum(char *str, int length, bool *warn);
-  * seg_init: Initialise the segment-number allocator.
-  * seg_alloc: allocate a hitherto unused segment number.
-  */
--void pure_func seg_init(void);
-+void seg_init(void);
- int32_t pure_func seg_alloc(void);
- 
- /*
diff --git a/meta/recipes-devtools/nasm/nasm/0001-assemble-Check-global-line-limit.patch b/meta/recipes-devtools/nasm/nasm/0001-assemble-Check-global-line-limit.patch
deleted file mode 100644
index 682d4c72771..00000000000
--- a/meta/recipes-devtools/nasm/nasm/0001-assemble-Check-global-line-limit.patch
+++ /dev/null
@@ -1,50 +0,0 @@
-From 7a46d6b9e3a1d8a0ab0d816ef1bf194ad285e082 Mon Sep 17 00:00:00 2001
-From: "Chang S. Bae" <chang.seok.bae@intel.com>
-Date: Fri, 17 Aug 2018 14:26:03 +0800
-Subject: [PATCH] assemble: Check global line limit
-
-Without the limit, the while loop opens to semi-infinite
-that will exhaustively consume the heap space. Also, the
-index value gets into the garbage.
-
-https://bugzilla.nasm.us/show_bug.cgi?id=3392474
-
-Reported-by : Dongliang Mu <mudongliangabcd@gmail.com>
-Signed-off-by: Chang S. Bae <chang.seok.bae@intel.com>
-Signed-off-by: Cyrill Gorcunov <gorcunov@gmail.com>
-
-Upstream-Status: Backport from upstream [http://repo.or.cz/nasm.git]
-CVE: CVE-2018-10316
-Signed-off-by: Hongxu Jia <hongxu.jia@windriver.com>
----
- asm/nasm.c | 7 ++++++-
- 1 file changed, 6 insertions(+), 1 deletion(-)
-
-diff --git a/asm/nasm.c b/asm/nasm.c
-index 8497ec9..81f6cee 100644
---- a/asm/nasm.c
-+++ b/asm/nasm.c
-@@ -99,6 +99,8 @@ static char outname[FILENAME_MAX];
- static char listname[FILENAME_MAX];
- static char errname[FILENAME_MAX];
- static int globallineno;        /* for forward-reference tracking */
-+#define GLOBALLINENO_MAX    INT32_MAX
-+
- /* static int pass = 0; */
- const struct ofmt *ofmt = &OF_DEFAULT;
- const struct ofmt_alias *ofmt_alias = NULL;
-@@ -1360,7 +1362,10 @@ static void assemble_file(char *fname, StrList **depend_ptr)
-         location.offset = offs = get_curr_offs();
- 
-         while ((line = preproc->getline())) {
--            globallineno++;
-+            if (globallineno++ == GLOBALLINENO_MAX)
-+                nasm_error(ERR_FATAL,
-+                    "overall line number reaches the maximum %d\n",
-+                    GLOBALLINENO_MAX);
- 
-             /*
-              * Here we parse our directives; this is not handled by the
--- 
-2.7.4
-
diff --git a/meta/recipes-devtools/nasm/nasm/0001-eval-Eliminate-division-by-zero.patch b/meta/recipes-devtools/nasm/nasm/0001-eval-Eliminate-division-by-zero.patch
deleted file mode 100644
index 6c332497c9c..00000000000
--- a/meta/recipes-devtools/nasm/nasm/0001-eval-Eliminate-division-by-zero.patch
+++ /dev/null
@@ -1,40 +0,0 @@
-From ceec0d818798aeaa75ed4907e6135b0247ed46b2 Mon Sep 17 00:00:00 2001
-From: Cyrill Gorcunov <gorcunov@gmail.com>
-Date: Sun, 14 Oct 2018 01:26:19 +0300
-Subject: [PATCH] eval: Eliminate division by zero
-
-When doing division we should detect if the value we're
-divided by is not zero. Instead of is_unknown() helper
-we should use is_just_unknown().
-
-https://bugzilla.nasm.us/show_bug.cgi?id=3392515
-https://bugzilla.nasm.us/show_bug.cgi?id=3392473
-
-Reported-by: Jun <jxx13@psu.edu>
-Reported-by: stuartly <situlingyun@gmail.com>
-Signed-off-by: Cyrill Gorcunov <gorcunov@gmail.com>
-
-Upstream-Status: Backport [https://github.com/netwide-assembler/nasm/commit/ceec0d818798aeaa75ed4907e6135b0247ed46b2.patch]
-CVE: CVE-2018-10016
-Signed-off-by: Hongxu Jia <hongxu.jia@windriver.com>
-
----
- asm/eval.c | 2 +-
- 1 file changed, 1 insertion(+), 1 deletion(-)
-
-diff --git a/asm/eval.c b/asm/eval.c
-index 1a6680f..7e727a4 100644
---- a/asm/eval.c
-+++ b/asm/eval.c
-@@ -580,7 +580,7 @@ static expr *expr5(int critical)
-                   " scalar values");
-             return NULL;
-         }
--        if (j != '*' && !is_unknown(f) && reloc_value(f) == 0) {
-+        if (j != '*' && !is_just_unknown(f) && reloc_value(f) == 0) {
-             nasm_error(ERR_NONFATAL, "division by zero");
-             return NULL;
-         }
--- 
-2.10.2
-
diff --git a/meta/recipes-devtools/nasm/nasm/0001-fix-CVE-2018-8882.patch b/meta/recipes-devtools/nasm/nasm/0001-fix-CVE-2018-8882.patch
deleted file mode 100644
index bc706c3f152..00000000000
--- a/meta/recipes-devtools/nasm/nasm/0001-fix-CVE-2018-8882.patch
+++ /dev/null
@@ -1,30 +0,0 @@
-From 33438037e00ec750bff020578b1a5b6f75f60555 Mon Sep 17 00:00:00 2001
-From: Adam Majer <amajer@suse.de>
-Date: Fri, 17 Aug 2018 14:41:02 +0800
-Subject: [PATCH] fix CVE-2018-8882
-
-https://bugzilla.nasm.us/show_bug.cgi?id=3392445
-
-Upstream-Status: Submitted [https://bugzilla.nasm.us/show_bug.cgi?id=3392445]
-CVE: CVE-2018-8882
-Signed-off-by: Hongxu Jia <hongxu.jia@windriver.com>
----
- asm/float.c | 2 ++
- 1 file changed, 2 insertions(+)
-
-diff --git a/asm/float.c b/asm/float.c
-index dcf69fea..2965d3db 100644
---- a/asm/float.c
-+++ b/asm/float.c
-@@ -608,6 +608,8 @@ static void ieee_shr(fp_limb *mant, int i)
-         if (offs)
-             for (j = MANT_LIMBS-1; j >= offs; j--)
-                 mant[j] = mant[j-offs];
-+    } else if (MANT_LIMBS-1-offs < 0) {
-+        j = MANT_LIMBS-1;
-     } else {
-         n = mant[MANT_LIMBS-1-offs] >> sr;
-         for (j = MANT_LIMBS-1; j > offs; j--) {
--- 
-2.17.1
-
diff --git a/meta/recipes-devtools/nasm/nasm/0001-preproc-parse_size-Check-for-string-provided.patch b/meta/recipes-devtools/nasm/nasm/0001-preproc-parse_size-Check-for-string-provided.patch
deleted file mode 100644
index 2121fd17f3a..00000000000
--- a/meta/recipes-devtools/nasm/nasm/0001-preproc-parse_size-Check-for-string-provided.patch
+++ /dev/null
@@ -1,37 +0,0 @@
-From a2f43331a853b7cc449cae3361ee1fb54c7fad8d Mon Sep 17 00:00:00 2001
-From: Cyrill Gorcunov <gorcunov@gmail.com>
-Date: Sat, 29 Sep 2018 14:30:14 +0300
-Subject: [PATCH] preproc: parse_size -- Check for string provided
-
-In case if the string is nil we will have sigsegv.
-
-https://bugzilla.nasm.us/show_bug.cgi?id=3392507
-
-Signed-off-by: Cyrill Gorcunov <gorcunov@gmail.com>
-
-CVE: CVE-2018-1000667
-Upstream-Status: Backport
-https://repo.or.cz/nasm/nasm.git/commit/c713b5f994cf7b29164c3b6838b91f0499591434
-
-Signed-off-by: Hongxu Jia <hongxu.jia@windriver.com>
----
- asm/preproc.c | 3 +--
- 1 file changed, 1 insertion(+), 2 deletions(-)
-
-diff --git a/asm/preproc.c b/asm/preproc.c
-index 475926d..1d770a5 100644
---- a/asm/preproc.c
-+++ b/asm/preproc.c
-@@ -2216,8 +2216,7 @@ static int parse_size(const char *str) {
-         { "byte", "dword", "oword", "qword", "tword", "word", "yword" };
-     static const int sizes[] =
-         { 0, 1, 4, 16, 8, 10, 2, 32 };
--
--    return sizes[bsii(str, size_names, ARRAY_SIZE(size_names))+1];
-+    return str ? sizes[bsii(str, size_names, ARRAY_SIZE(size_names))+1] : 0;
- }
- 
- /*
--- 
-2.8.1
-
diff --git a/meta/recipes-devtools/nasm/nasm_2.13.03.bb b/meta/recipes-devtools/nasm/nasm_2.13.03.bb
deleted file mode 100644
index de4c55446a2..00000000000
--- a/meta/recipes-devtools/nasm/nasm_2.13.03.bb
+++ /dev/null
@@ -1,35 +0,0 @@
-SUMMARY = "General-purpose x86 assembler"
-SECTION = "devel"
-LICENSE = "BSD-2-Clause"
-LIC_FILES_CHKSUM = "file://LICENSE;md5=90904486f8fbf1861cf42752e1a39efe"
-
-SRC_URI = "http://www.nasm.us/pub/nasm/releasebuilds/${PV}/nasm-${PV}.tar.bz2 \
-           file://0001-asmlib-Drop-pure-function-attribute-from-seg_init.patch \
-           file://0001-assemble-Check-global-line-limit.patch \
-           file://0001-fix-CVE-2018-8882.patch \
-           file://0001-Verify-that-we-are-not-reading-past-end-of-a-buffer.patch \
-           file://0001-eval-Eliminate-division-by-zero.patch \
-           file://0001-preproc-parse_size-Check-for-string-provided.patch \
-           "
-
-SRC_URI[md5sum] = "0c581d482f39d5111879ca9601938f74"
-SRC_URI[sha256sum] = "63ec86477ad3f0f6292325fd89e1d93aea2e2fd490070863f17d48f7cd387011"
-
-inherit autotools-brokensep
-
-do_configure_prepend () {
-	if [ -f ${S}/aclocal.m4 ] && [ ! -f ${S}/acinclude.m4 ]; then
-		mv ${S}/aclocal.m4 ${S}/acinclude.m4
-	fi
-}
-
-do_install() {
-	install -d ${D}${bindir}
-	install -d ${D}${mandir}/man1
-
-	oe_runmake 'INSTALLROOT=${D}' install
-}
-
-BBCLASSEXTEND = "native"
-
-DEPENDS = "groff-native"
diff --git a/meta/recipes-devtools/nasm/nasm_2.14.bb b/meta/recipes-devtools/nasm/nasm_2.14.bb
new file mode 100644
index 00000000000..231d4e6b15f
--- /dev/null
+++ b/meta/recipes-devtools/nasm/nasm_2.14.bb
@@ -0,0 +1,25 @@
+SUMMARY = "General-purpose x86 assembler"
+SECTION = "devel"
+LICENSE = "BSD-2-Clause"
+LIC_FILES_CHKSUM = "file://LICENSE;md5=90904486f8fbf1861cf42752e1a39efe"
+
+SRC_URI = "http://www.nasm.us/pub/nasm/releasebuilds/${PV}/nasm-${PV}.tar.bz2"
+
+SRC_URI[md5sum] = "238a240d3f869a52f8ac38ee3f8faafa"
+SRC_URI[sha256sum] = "d43cfd27cad53d0c22a9bf9702e9dffcc7018a0df21d15b92c56d250d747c744"
+
+inherit autotools-brokensep
+
+do_configure_prepend () {
+	if [ -f ${S}/aclocal.m4 ] && [ ! -f ${S}/acinclude.m4 ]; then
+		mv ${S}/aclocal.m4 ${S}/acinclude.m4
+	fi
+}
+
+do_install() {
+	oe_runmake 'DESTDIR=${D}' install
+}
+
+BBCLASSEXTEND = "native"
+
+DEPENDS = "groff-native"
-- 
2.17.1


