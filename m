Return-Path: <akuster808@gmail.com>
Received: from mail-pg0-f65.google.com (mail-pg0-f65.google.com [74.125.83.65])
	by mail.openembedded.org (Postfix) with ESMTP id F3BCC7835C
	for <openembedded-core@lists.openembedded.org>;
	Fri,  3 Nov 2017 19:55:02 +0000 (UTC)
Received: by mail-pg0-f65.google.com with SMTP id k7so3339548pga.3
	for <openembedded-core@lists.openembedded.org>;
	Fri, 03 Nov 2017 12:55:04 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=from:to:subject:date:message-id:in-reply-to:references;
	bh=I35Qu5i+/laAbb80HibLUkObsaTEjG2RbC2R3ZTWVCk=;
	b=OKZtvP3RBib3XSG8oKRK+96gkAd6Rn+yBfiLZUHelqpwqXRqhQOSRn29FgIh9W5v6V
	b4psqHHM1yUH4aOcllZzvAfceWXu0E0CRtowx5EsS4xj9LM/ej775z6PyYrZiBDuOUgU
	x4O1cA1n6l0gsG86te5/U3eLZkRMan3wzEbqqq0ikWMPlJtUhkxyojpDV7+OArXpiDPR
	YVN+eivRfcCSeNzcNAgbWbZ6REz3irk+MQJ4LO2RL5fUqELnDOpQ6MZzCqygMZxsDMtO
	bS7wCngHIxjkij1fLLr6xNO5j8AVSCMZ9SsBqKdhCDNxKheLbAPw31hr3Uu6g/I5rgLt
	BMpg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:from:to:subject:date:message-id:in-reply-to
	:references;
	bh=I35Qu5i+/laAbb80HibLUkObsaTEjG2RbC2R3ZTWVCk=;
	b=KMolPkgWQ8u/BOcIA1wlNQZHZPsz0+fYuuiTz9C8utssCWKe7pYu1EsKecP2cYZcgV
	zH8cfli00V5F5LI/fOk6dtyPc2n5EzqSj1KvHK5+l5W1LUX9X9pwdV7UGlvp29q3l7kS
	N9u6s69Pdz3VEuTM3zNRQpiAjHIKcWxogBIEz4mfY6ZmXxZ4tBAB6L0nySV/TGpGAvrp
	S5k7pYeoeY+v8Y2xparrgmiqUbW+UJ/D4E77ZbeLSuFQViyxHvzylJymaimDpji/DTCc
	WGT4n2y3nCy7BFyHtc9Qhe2ixCS7HhMcHFsLzB0EYInvgF67eCgsTYJ+FuCerQKUkUKa
	VLCw==
X-Gm-Message-State: AMCzsaUfROOMxDP+YeX4lDtRq3GIa4NBbKh5ml+6z3s1jocbQ1O3pOz6
	u4y2HcTSGyeD1uep8lTobjEKyg==
X-Google-Smtp-Source: ABhQp+QRhKIryvkZhX5/vr3IskQXFLfAZLqnu7bk+xWy/WUeabw7miySkXUM5GpSVTqixtCRyOQ6qQ==
X-Received: by 10.98.64.141 with SMTP id f13mr8819689pfd.213.1509738904045;
	Fri, 03 Nov 2017 12:55:04 -0700 (PDT)
Received: from akuster-ThinkPad-T460s.mvista.com
	([2601:202:4001:9ea0:78e5:dcc3:4839:af44])
	by smtp.gmail.com with ESMTPSA id
	c26sm12781112pfl.115.2017.11.03.12.55.03
	(version=TLS1_2 cipher=ECDHE-RSA-AES128-SHA bits=128/128);
	Fri, 03 Nov 2017 12:55:03 -0700 (PDT)
From: Armin Kuster <akuster808@gmail.com>
To: akuster@mvista.com,
	openembedded-core@lists.openembedded.org
Date: Fri,  3 Nov 2017 12:54:46 -0700
Message-Id: <edcff176960173753c2ba42e7a92ac2e503f8181.1509738544.git.akuster808@gmail.com>
X-Mailer: git-send-email 2.7.4
In-Reply-To: <cover.1509738544.git.akuster808@gmail.com>
References: <cover.1509738544.git.akuster808@gmail.com>
Subject: [PATCH 12/15] libpcre2: update to 10.30
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
X-List-Received-Date: Fri, 03 Nov 2017 19:55:03 -0000

LICENSE files changed:
Amend licence to relax its conditions for chains of binary distributions.

removed included patches

includes CVE-2017-8399

Signed-off-by: Armin Kuster <akuster@mvista.com>
---
 .../libpcre/libpcre2/libpcre2-CVE-2017-7186.patch  | 96 ----------------------
 .../libpcre/libpcre2/libpcre2-CVE-2017-8786.patch  | 93 ---------------------
 .../{libpcre2_10.23.bb => libpcre2_10.30.bb}       |  8 +-
 3 files changed, 3 insertions(+), 194 deletions(-)
 delete mode 100644 meta/recipes-support/libpcre/libpcre2/libpcre2-CVE-2017-7186.patch
 delete mode 100644 meta/recipes-support/libpcre/libpcre2/libpcre2-CVE-2017-8786.patch
 rename meta/recipes-support/libpcre/{libpcre2_10.23.bb => libpcre2_10.30.bb} (85%)

diff --git a/meta/recipes-support/libpcre/libpcre2/libpcre2-CVE-2017-7186.patch b/meta/recipes-support/libpcre/libpcre2/libpcre2-CVE-2017-7186.patch
deleted file mode 100644
index bfa3bfe..0000000
--- a/meta/recipes-support/libpcre/libpcre2/libpcre2-CVE-2017-7186.patch
+++ /dev/null
@@ -1,96 +0,0 @@
-libpcre2-10.23: Fix CVE-2017-7186
-
-A fuzz on libpcre1 through the pcretest utility revealed an invalid read in the
-library. For who is interested in a detailed description of the bug, will
-follow a feedback from upstream:
-
-This was a genuine bug in the 32-bit library. Thanks for finding it. The crash
-was caused by trying to find a Unicode property for a code value greater than
-0x10ffff, the Unicode maximum, when running in non-UTF mode (where character
-values can be up to 0xffffffff).
-
-The complete ASan output:
-
-# pcretest -32 -d $FILE
-==14788==ERROR: AddressSanitizer: SEGV on unknown address 0x7f1bbffed4df (pc 0x7f1bbee3fe6b bp 0x7fff8b50d8c0 sp 0x7fff8b50d3a0 T0)
-==14788==The signal is caused by a READ memory access.
-    #0 0x7f1bbee3fe6a in match /tmp/portage/dev-libs/libpcre-8.40/work/pcre-8.40/pcre_exec.c:5473:18
-    #1 0x7f1bbee09226 in pcre32_exec /tmp/portage/dev-libs/libpcre-8.40/work/pcre-8.40/pcre_exec.c:6936:8
-    #2 0x527d6c in main /tmp/portage/dev-libs/libpcre-8.40/work/pcre-8.40/pcretest.c:5218:9
-    #3 0x7f1bbddd678f in __libc_start_main /tmp/portage/sys-libs/glibc-2.23-r3/work/glibc-2.23/csu/../csu/libc-start.c:289
-    #4 0x41b438 in _init (/usr/bin/pcretest+0x41b438)
-
-AddressSanitizer can not provide additional info.
-SUMMARY: AddressSanitizer: SEGV /tmp/portage/dev-libs/libpcre-8.40/work/pcre-8.40/pcre_exec.c:5473:18 in match
-==14788==ABORTING
-
-Upstream-Status: Backport [https://vcs.pcre.org/pcre2/code/trunk/src/pcre2_ucd.c?view=patch&r1=316&r2=670&sortby=date \
-                        https://vcs.pcre.org/pcre2/code/trunk/src/pcre2_internal.h?view=patch&r1=600&r2=670&sortby=date]
-CVE: CVE-2017-7186
-
-Signed-off-by: Robert Yang <liezhi.yang@windriver.com>
-
---- trunk/src/pcre2_ucd.c  2015/07/17 15:44:51 316
-+++ trunk/src/pcre2_ucd.c  2017/02/24 18:25:32 670
-@@ -41,6 +41,20 @@
- 
- const char *PRIV(unicode_version) = "8.0.0";
- 
-+/* If the 32-bit library is run in non-32-bit mode, character values
-+greater than 0x10ffff may be encountered. For these we set up a
-+special record. */
-+
-+#if PCRE2_CODE_UNIT_WIDTH == 32
-+const ucd_record PRIV(dummy_ucd_record)[] = {{
-+  ucp_Common,    /* script */
-+  ucp_Cn,        /* type unassigned */
-+  ucp_gbOther,   /* grapheme break property */
-+  0,             /* case set */
-+  0,             /* other case */
-+  }};
-+#endif
-+
- /* When recompiling tables with a new Unicode version, please check the
- types in this structure definition from pcre2_internal.h (the actual
- field names will be different):
---- trunk/src/pcre2_internal.h 2016/11/19 12:46:24 600
-+++ trunk/src/pcre2_internal.h 2017/02/24 18:25:32 670
-@@ -1774,10 +1774,17 @@
- /* UCD access macros */
- 
- #define UCD_BLOCK_SIZE 128
--#define GET_UCD(ch) (PRIV(ucd_records) + \
-+#define REAL_GET_UCD(ch) (PRIV(ucd_records) + \
-         PRIV(ucd_stage2)[PRIV(ucd_stage1)[(int)(ch) / UCD_BLOCK_SIZE] * \
-         UCD_BLOCK_SIZE + (int)(ch) % UCD_BLOCK_SIZE])
- 
-+#if PCRE2_CODE_UNIT_WIDTH == 32
-+#define GET_UCD(ch) ((ch > MAX_UTF_CODE_POINT)? \
-+  PRIV(dummy_ucd_record) : REAL_GET_UCD(ch))
-+#else
-+#define GET_UCD(ch) REAL_GET_UCD(ch)
-+#endif
-+
- #define UCD_CHARTYPE(ch)    GET_UCD(ch)->chartype
- #define UCD_SCRIPT(ch)      GET_UCD(ch)->script
- #define UCD_CATEGORY(ch)    PRIV(ucp_gentype)[UCD_CHARTYPE(ch)]
-@@ -1834,6 +1841,9 @@
- #define _pcre2_default_compile_context PCRE2_SUFFIX(_pcre2_default_compile_context_)
- #define _pcre2_default_match_context   PCRE2_SUFFIX(_pcre2_default_match_context_)
- #define _pcre2_default_tables          PCRE2_SUFFIX(_pcre2_default_tables_)
-+#if PCRE2_CODE_UNIT_WIDTH == 32
-+#define _pcre2_dummy_ucd_record        PCRE2_SUFFIX(_pcre2_dummy_ucd_record_)
-+#endif
- #define _pcre2_hspace_list             PCRE2_SUFFIX(_pcre2_hspace_list_)
- #define _pcre2_vspace_list             PCRE2_SUFFIX(_pcre2_vspace_list_)
- #define _pcre2_ucd_caseless_sets       PCRE2_SUFFIX(_pcre2_ucd_caseless_sets_)
-@@ -1858,6 +1868,9 @@
- extern const uint32_t                  PRIV(vspace_list)[];
- extern const uint32_t                  PRIV(ucd_caseless_sets)[];
- extern const ucd_record                PRIV(ucd_records)[];
-+#if PCRE2_CODE_UNIT_WIDTH == 32
-+extern const ucd_record                PRIV(dummy_ucd_record)[];
-+#endif
- extern const uint8_t                   PRIV(ucd_stage1)[];
- extern const uint16_t                  PRIV(ucd_stage2)[];
- extern const uint32_t                  PRIV(ucp_gbtable)[];
diff --git a/meta/recipes-support/libpcre/libpcre2/libpcre2-CVE-2017-8786.patch b/meta/recipes-support/libpcre/libpcre2/libpcre2-CVE-2017-8786.patch
deleted file mode 100644
index eafafc1..0000000
--- a/meta/recipes-support/libpcre/libpcre2/libpcre2-CVE-2017-8786.patch
+++ /dev/null
@@ -1,93 +0,0 @@
-libpcre2-10.23: Fix CVE-2017-8786
-
-The pcre2test.c in PCRE2 10.23 allows remote attackers to cause a denial of
-service (heap-based buffer overflow) or possibly have unspecified other impact
-via a crafted regular expression.
-
-Upstream-Status: Backport [https://vcs.pcre.org/pcre2/code/trunk/src/pcre2test.c?r1=692&r2=697&view=patch]
-CVE: CVE-2017-8786
-
-Signed-off-by: Robert Yang <liezhi.yang@windriver.com>
-
---- trunk/src/pcre2test.c  2017/03/21 16:18:54 692
-+++ trunk/src/pcre2test.c  2017/03/21 18:36:13 697
-@@ -1017,9 +1017,9 @@
-   if (test_mode == PCRE8_MODE) \
-     r = pcre2_get_error_message_8(a,G(b,8),G(G(b,8),_size)); \
-   else if (test_mode == PCRE16_MODE) \
--    r = pcre2_get_error_message_16(a,G(b,16),G(G(b,16),_size)); \
-+    r = pcre2_get_error_message_16(a,G(b,16),G(G(b,16),_size/2)); \
-   else \
--    r = pcre2_get_error_message_32(a,G(b,32),G(G(b,32),_size))
-+    r = pcre2_get_error_message_32(a,G(b,32),G(G(b,32),_size/4))
- 
- #define PCRE2_GET_OVECTOR_COUNT(a,b) \
-   if (test_mode == PCRE8_MODE) \
-@@ -1399,6 +1399,9 @@
- 
- /* ----- Common macros for two-mode cases ----- */
- 
-+#define BYTEONE (BITONE/8)
-+#define BYTETWO (BITTWO/8)
-+
- #define CASTFLD(t,a,b) \
-   ((test_mode == G(G(PCRE,BITONE),_MODE))? (t)(G(a,BITONE)->b) : \
-     (t)(G(a,BITTWO)->b))
-@@ -1481,9 +1484,9 @@
- 
- #define PCRE2_GET_ERROR_MESSAGE(r,a,b) \
-   if (test_mode == G(G(PCRE,BITONE),_MODE)) \
--    r = G(pcre2_get_error_message_,BITONE)(a,G(b,BITONE),G(G(b,BITONE),_size)); \
-+    r = G(pcre2_get_error_message_,BITONE)(a,G(b,BITONE),G(G(b,BITONE),_size/BYTEONE)); \
-   else \
--    r = G(pcre2_get_error_message_,BITTWO)(a,G(b,BITTWO),G(G(b,BITTWO),_size))
-+    r = G(pcre2_get_error_message_,BITTWO)(a,G(b,BITTWO),G(G(b,BITTWO),_size/BYTETWO))
- 
- #define PCRE2_GET_OVECTOR_COUNT(a,b) \
-   if (test_mode == G(G(PCRE,BITONE),_MODE)) \
-@@ -1904,7 +1907,7 @@
- #define PCRE2_DFA_MATCH(a,b,c,d,e,f,g,h,i,j) \
-   a = pcre2_dfa_match_16(G(b,16),(PCRE2_SPTR16)c,d,e,f,G(g,16),h,i,j)
- #define PCRE2_GET_ERROR_MESSAGE(r,a,b) \
--  r = pcre2_get_error_message_16(a,G(b,16),G(G(b,16),_size))
-+  r = pcre2_get_error_message_16(a,G(b,16),G(G(b,16),_size/2))
- #define PCRE2_GET_OVECTOR_COUNT(a,b) a = pcre2_get_ovector_count_16(G(b,16))
- #define PCRE2_GET_STARTCHAR(a,b) a = pcre2_get_startchar_16(G(b,16))
- #define PCRE2_JIT_COMPILE(r,a,b) r = pcre2_jit_compile_16(G(a,16),b)
-@@ -2000,7 +2003,7 @@
- #define PCRE2_DFA_MATCH(a,b,c,d,e,f,g,h,i,j) \
-   a = pcre2_dfa_match_32(G(b,32),(PCRE2_SPTR32)c,d,e,f,G(g,32),h,i,j)
- #define PCRE2_GET_ERROR_MESSAGE(r,a,b) \
--  r = pcre2_get_error_message_32(a,G(b,32),G(G(b,32),_size))
-+  r = pcre2_get_error_message_32(a,G(b,32),G(G(b,32),_size/4))
- #define PCRE2_GET_OVECTOR_COUNT(a,b) a = pcre2_get_ovector_count_32(G(b,32))
- #define PCRE2_GET_STARTCHAR(a,b) a = pcre2_get_startchar_32(G(b,32))
- #define PCRE2_JIT_COMPILE(r,a,b) r = pcre2_jit_compile_32(G(a,32),b)
-@@ -2889,7 +2892,7 @@
-   {
-   if (pbuffer32 != NULL) free(pbuffer32);
-   pbuffer32_size = 4*len + 4;
--  if (pbuffer32_size < 256) pbuffer32_size = 256;
-+  if (pbuffer32_size < 512) pbuffer32_size = 512;
-   pbuffer32 = (uint32_t *)malloc(pbuffer32_size);
-   if (pbuffer32 == NULL)
-     {
-@@ -7600,7 +7603,8 @@
-   int errcode;
-   char *endptr;
- 
--/* Ensure the relevant non-8-bit buffer is available. */
-+/* Ensure the relevant non-8-bit buffer is available. Ensure that it is at 
-+least 128 code units, because it is used for retrieving error messages. */
- 
- #ifdef SUPPORT_PCRE2_16
-   if (test_mode == PCRE16_MODE)
-@@ -7620,7 +7624,7 @@
- #ifdef SUPPORT_PCRE2_32
-   if (test_mode == PCRE32_MODE)
-     {
--    pbuffer32_size = 256;
-+    pbuffer32_size = 512;
-     pbuffer32 = (uint32_t *)malloc(pbuffer32_size);
-     if (pbuffer32 == NULL)
-       {
diff --git a/meta/recipes-support/libpcre/libpcre2_10.23.bb b/meta/recipes-support/libpcre/libpcre2_10.30.bb
similarity index 85%
rename from meta/recipes-support/libpcre/libpcre2_10.23.bb
rename to meta/recipes-support/libpcre/libpcre2_10.30.bb
index ca2b028..a7df055 100644
--- a/meta/recipes-support/libpcre/libpcre2_10.23.bb
+++ b/meta/recipes-support/libpcre/libpcre2_10.30.bb
@@ -8,16 +8,14 @@ SUMMARY = "Perl Compatible Regular Expressions version 2"
 HOMEPAGE = "http://www.pcre.org"
 SECTION = "devel"
 LICENSE = "BSD"
-LIC_FILES_CHKSUM = "file://LICENCE;md5=3de34df49e1fe3c3b59a08dff214488b"
+LIC_FILES_CHKSUM = "file://LICENCE;md5=12d55e15a0c6da5c645ba40382bd3293"
 
 SRC_URI = "https://ftp.pcre.org/pub/pcre/pcre2-${PV}.tar.bz2 \
            file://pcre-cross.patch \
-           file://libpcre2-CVE-2017-8786.patch \
-           file://libpcre2-CVE-2017-7186.patch \
 "
 
-SRC_URI[md5sum] = "b2cd00ca7e24049040099b0a46bb3649"
-SRC_URI[sha256sum] = "dfc79b918771f02d33968bd34a749ad7487fa1014aeb787fad29dd392b78c56e"
+SRC_URI[md5sum] = "d3adf4b130eed854a530390f00020a65"
+SRC_URI[sha256sum] = "90bd41c605d30e3745771eb81928d779f158081a51b2f314bbcc1f73de5773db"
 
 CVE_PRODUCT = "pcre2"
 
-- 
2.7.4


