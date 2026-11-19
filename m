Received: from aer-iport-3.cisco.com (aer-iport-3.cisco.com [173.38.203.53])
 by mx.groups.io with SMTP id smtpd.msgproc01-g2.12878.1795089921632154928
 for <openembedded-core@lists.openembedded.org>;
 Thu, 19 Nov 2026 04:05:22 -0800
Authentication-Results: mx.groups.io;
 dkim=fail reason="dkim: message contains an insecure body length tag" header.i=@cisco.com header.s=iport01 header.b=Fssa/gKe;
 spf=pass (domain: cisco.com, ip: 173.38.203.53, mailfrom: deeratho@cisco.com)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
  d=cisco.com; i=@cisco.com; l=11336; q=dns/txt;
  s=iport01; t=1795089921; x=1796299521;
  h=from:to:subject:date:message-id:in-reply-to:references:
   mime-version:content-transfer-encoding;
  bh=78WNRGpPuZA+JikoJlENjOY+uaxvodsUUsY6l6rG710=;
  b=Fssa/gKe2a8swPXXBoEAv8WmRB9AeBZPhme4ZH32GnWzQR52bEMBr0AX
   ks+54fdGseyUyxw6KCn9Rs/JDlG/yT2qTy8F2UnK/vDzAEr/R5Nm78kly
   JSQl7mHpKccsZDqndD+xD3EJ0BOMtnHowUhx41ke1GQdyRYU7FXAzIwpt
   K0YbbA1JpZF5/F1MnniV50iaVG5LDAMqL8r0K53Tv36BnWFAudQQ9hAVm
   JR33j8i6jlTseRRfrvK073UxjD1HUGoNIUaUOOYRvpS37Zd05qlE0L0f3
   6V+17RK/K8JaJ70TRDPqk/eduTHqXNFtFYq2R6TNdStYQkXaGw/WGCBzg
   A==;
X-CSE-ConnectionGUID: 3SEeTVlrSZ+dUaEQeRDbzA==
X-CSE-MsgGUID: qiRAzgTRQ7uSA1L5558r4Q==
X-IPAS-Result: =?us-ascii?q?A0BIAgCL5f5q/9FK/pBaglmCV3VhQkmUKoIhA54pgX4PA?=
 =?us-ascii?q?QEBD0QNBAEBhQUCjiACJjQJDgECBAMCAwEBAQEBAQEBAQEBAQoBAQUBAQECA?=
 =?us-ascii?q?QcFgQ4Thk8NkBIBAgEDJwsBGAE9HAMBAi8rIwgZGoJoAYJ0AgERuTaBeTOBA?=
 =?us-ascii?q?YMpAUYPf9szAQsUAYE4hUKIJF0YAYR9JxsbgXKECXaBBYFcAQGBJxGGbgSCI?=
 =?us-ascii?q?oEMgVQejHkCgU+ICkiBHgNZLAFVEw0KCwcFgWgDNRIqFW4yHYEjOxeBBxsGB?=
 =?us-ascii?q?YEcgR6BEoEDXYErKF4hgQiBdgKCUYIAAgFJQQ4HRVMJJUMSRyQiCBIJARMaL?=
 =?us-ascii?q?AqBGjU8CSY/FQxnCxoFYQgCDQx0ORAwHiQvBRomPhsKgQwnHx4bDgIOGA1IE?=
 =?us-ascii?q?Sw3FRkEPm4HkzgZgxEHAXoTAQcjARdoBhsxOpMykEOCIaERCiiDeYwkj0KFe?=
 =?us-ascii?q?BozhVulFwuYfY4KlWlohGqBaDyBWXAVgm4BAQExCUoZD445g2uFE8lIIzUCC?=
 =?us-ascii?q?TIBAQcCBw4DC4FokAABJ4FWAQE?=
IronPort-Data: A9a23:IfjMv61ZDl2328TwqPbD5Ydwkn2cJEfYwER7XKvMYLTBsI5bpzBTx
 mMdUW7Ua6uOa2b9c4hyaI+190lQ65bWztJkSANl3Hw8FHgiRegpqji6wuYcGwvIc6UvmWo+t
 512huHodZ5yEzmE4Ef3b9ANlFEkvYmQXL3wFeXYDS54QA5gWU8JhAlq8wIDqtYAbeORXUXX5
 rsen+WFYAX7gmctYjpPg06+gEoHUMra6WtwUmMWPZinjHeG/1EJAZQWI72GLneQauF8Au6gS
 u/f+6qy92Xf8g1FIovNfmHTKxBirhb6ZGBiu1IOM0SQqkEqSh8ajs7XAMEhhXJ/0F1lqTzeJ
 OJl7vRcQS9xVkHFdX90vxNwS0mSNoUekFPLzOTWXcG7lyX7n3XQL/pGV3obMLEm/vxMMyJCy
 PU1ET03QhqRrrfjqF67YrEEasULJcTxeYdasXZ6wHSBXbAtQIvIROPB4towMDUY35wSW6yDO
 4xGNXw1NEWojx5nYj/7DLoykeqyj2X/dBVTqUmeouw85G27IAlZjemzbYWJK4XiqcN9h0eij
 3DJw17AXQwhHYW7lGfYomjwv7qa9c/8cMdIfFGizdZtmFCVy2kZBREaWFf+qv6jh2a6WslDM
 AoT4icooK04+UCnQ9W7WAe3yENopTYVVsAVF6gx7xuAj/KEpQ2YHWMDCDVGbbTKqfMLeNDj7
 XfR9/uBONClmOT9pa61nltMkQ6PBA==
IronPort-HdrOrdr: A9a23:cE/CCqvlUN2hReactSt3jx2h7skDWtV00zEX/kB9WHVpm6uj5q
 STdZsguyMc5Ax9ZJhko6HiBEDiewK4yXcK2+gs1N6ZNWGM0ldAbrsSj7cKqAeOJ8SRzIJgPN
 9bE5RWOZnXEUVwi9r87U2TFtYtx8TCzYWT7N2uqEuEiWpRGthdB8ATMHf8LnFL
X-Talos-CUID: 9a23:ggxlOWM8D3P0/u5DAxJK+XIqHtoeQD7R8X79GkKCJWx7YejA
X-Talos-MUID: 9a23:q8X2hAT0W2B5+ZzJRXT1hQtLJshU2Z3xFXskyLFb5pTUL3BJbmI=
X-IronPort-Anti-Spam-Filtered: true
X-IronPort-AV: E=Sophos;i="6.27,220,1787011200"; 
   d="scan'208";a="59657491"
Received: from aer-l-core-08.cisco.com ([144.254.74.209])
  by aer-iport-3.cisco.com with ESMTP/TLS/TLS_AES_256_GCM_SHA384; 19 Nov 2026 12:05:19 +0000
Received: from sjc-ads-2449.cisco.com (sjc-ads-2449.cisco.com [171.70.63.137])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256
	 client-signature RSA-PSS (4096 bits) client-digest SHA256)
	(Client CN "ciscoit-managed-infra-smtp-auth.cisco.com", Issuer "Internal Private TLS SubCA" (verified OK))
	by aer-l-core-08.cisco.com (Postfix) with ESMTPS id DFB041800024C
	for <openembedded-core@lists.openembedded.org>; Thu, 19 Nov 2026 12:05:18 +0000 (GMT)
Received: by sjc-ads-2449.cisco.com (Postfix, from userid 1795984)
	id 8F39FCC12A6; Thu, 19 Nov 2026 04:05:17 -0800 (PST)
From: "Deepak Rathore -X (deeratho - E INFOCHIPS PRIVATE LIMITED at Cisco)" <deeratho@cisco.com>
To: openembedded-core@lists.openembedded.org
Subject: [OE-core][scarthgap][PATCH v2] ruby: Fix CVE-2026-97229
Date: Thu, 19 Nov 2026 04:05:13 -0800
Message-Id: <20261119120513.2285226-1-deeratho@cisco.com>
X-Mailer: git-send-email 2.35.6
In-Reply-To: <20261111110448.3303353-1-deeratho@cisco.com>
References: <20261111110448.3303353-1-deeratho@cisco.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Outbound-Client-TLS: VERIFIED;sjc-ads-2449.cisco.com [171.70.63.137];TLSv1.3;TLS_AES_256_GCM_SHA384;256;ciscoit-managed-infra-smtp-auth.cisco.com
X-Outbound-SMTP-Client: 171.70.63.137, sjc-ads-2449.cisco.com
X-Outbound-Node: aer-l-core-08.cisco.com
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by lin-tor-korg-lkml-alma10-1 with HTTPS for <openembedded-core@lists.openembedded.org>; Thu, 19 Nov 2026 12:05:27 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/250663
Content-Type: text/plain; charset="utf-8"

From: Deepak Rathore <deeratho@cisco.com>

This patch applies the upstream Ruby 3.3 fixes for
CVE-2026-97229. The three backported commits are referenced in
[1], [2], and [3]. The upstream fix discussion is referenced in
[4], and the public CVE advisory is referenced in [5].

[1] https://github.com/ruby/ruby/commit/fa98ef030a54595d4387998b2fb48a412fc5c63c
[2] https://github.com/ruby/ruby/commit/b03e500193371ae87dc4536d855008b42a9cd1a7
[3] https://github.com/ruby/ruby/commit/f6496bca68ca445bcc1ced04818bfa4220b2bc7f
[4] https://github.com/ruby/ruby/pull/19020
[5] https://www.ruby-lang.org/en/news/2026/10/23/regexp-fixes-for-gitlab-cves/

Signed-off-by: Deepak Rathore <deeratho@cisco.com>

---
Changes since v1:
- Restore the full upstream cherry-picked commit hashes in all three
  embedded patch messages.
 .../ruby/ruby/CVE-2026-97229_p1.patch         | 97 +++++++++++++++++++
 .../ruby/ruby/CVE-2026-97229_p2.patch         | 79 +++++++++++++++
 .../ruby/ruby/CVE-2026-97229_p3.patch         | 31 ++++++
 meta/recipes-devtools/ruby/ruby_3.3.10.bb     |  5 +-
 4 files changed, 211 insertions(+), 1 deletion(-)
 create mode 100644 meta/recipes-devtools/ruby/ruby/CVE-2026-97229_p1.patch
 create mode 100644 meta/recipes-devtools/ruby/ruby/CVE-2026-97229_p2.patch
 create mode 100644 meta/recipes-devtools/ruby/ruby/CVE-2026-97229_p3.patch

diff --git a/meta/recipes-devtools/ruby/ruby/CVE-2026-97229_p1.patch b/meta/recipes-devtools/ruby/ruby/CVE-2026-97229_p1.patch
new file mode 100644
index 0000000000..4f68c23671
--- /dev/null
+++ b/meta/recipes-devtools/ruby/ruby/CVE-2026-97229_p1.patch
@@ -0,0 +1,97 @@
+From 59296a88f6d19fe07e1e0301fa4abeb53f89d117 Mon Sep 17 00:00:00 2001
+From: Hiroshi SHIBATA <hsbt@ruby-lang.org>
+Date: Fri, 25 Sep 2026 11:44:12 +0900
+Subject: [PATCH] Avoid overflow in the quantifier expansion size check
+
+Nested bounded repeats let the int product tlen * qn->lower overflow, so
+the check that keeps the compiler from unrolling a large repeat could pass
+for an enormous one, hanging the compile or emitting wrapped jump offsets.
+Compare against the limit by division instead.
+
+CVE: CVE-2026-97229
+Upstream-Status: Backport [https://github.com/ruby/ruby/commit/fa98ef030a54595d4387998b2fb48a412fc5c63c]
+
+Co-Authored-By: Claude Opus 5.5 <noreply@anthropic.com>
+(cherry picked from commit 7cfe8dc82f9f1b3f9c37c78e362fcbdf3c0b84f4)
+Signed-off-by: Deepak Rathore <deeratho@cisco.com>
+---
+ regcomp.c                | 16 ++++++++++------
+ test/ruby/test_regexp.rb | 12 ++++++++++++
+ 2 files changed, 22 insertions(+), 6 deletions(-)
+
+diff --git a/regcomp.c b/regcomp.c
+index 7bba1455e3..4eaccfaaa8 100644
+--- a/regcomp.c
++++ b/regcomp.c
+@@ -739,6 +739,10 @@ is_anychar_star_quantifier(QtfrNode* qn)
+ }
+ 
+ #define QUANTIFIER_EXPAND_LIMIT_SIZE   50
++/* (tlen * n <= QUANTIFIER_EXPAND_LIMIT_SIZE) without overflowing int: tlen
++   and n are each bounded by ONIG_MAX_REPEAT_NUM, but their product is not. */
++#define IS_EXPAND_LIMIT_OK(tlen, n) \
++  ((n) <= 0 || (tlen) <= QUANTIFIER_EXPAND_LIMIT_SIZE / (n))
+ #define CKN_ON   (ckn > 0)
+ 
+ #ifdef USE_COMBINATION_EXPLOSION_CHECK
+@@ -1003,7 +1007,7 @@ compile_length_quantifier_node(QtfrNode* qn, regex_t* reg)
+     mod_tlen = tlen;
+ 
+   if (infinite &&
+-      (qn->lower <= 1 || tlen * qn->lower <= QUANTIFIER_EXPAND_LIMIT_SIZE)) {
++      (qn->lower <= 1 || IS_EXPAND_LIMIT_OK(tlen, qn->lower))) {
+     if (qn->lower == 1 && tlen > QUANTIFIER_EXPAND_LIMIT_SIZE) {
+       len = SIZE_OP_JUMP;
+     }
+@@ -1029,8 +1033,8 @@ compile_length_quantifier_node(QtfrNode* qn, regex_t* reg)
+     len = SIZE_OP_JUMP + tlen;
+   }
+   else if (!infinite && qn->greedy &&
+-           (qn->upper == 1 || (tlen + SIZE_OP_PUSH) * qn->upper
+-                                      <= QUANTIFIER_EXPAND_LIMIT_SIZE)) {
++           (qn->upper == 1 ||
++            IS_EXPAND_LIMIT_OK(tlen + SIZE_OP_PUSH, qn->upper))) {
+     len = tlen * qn->lower;
+     len += (SIZE_OP_PUSH + tlen) * (qn->upper - qn->lower);
+   }
+@@ -1080,7 +1084,7 @@ compile_quantifier_node(QtfrNode* qn, regex_t* reg)
+     mod_tlen = tlen;
+ 
+   if (infinite &&
+-      (qn->lower <= 1 || tlen * qn->lower <= QUANTIFIER_EXPAND_LIMIT_SIZE)) {
++      (qn->lower <= 1 || IS_EXPAND_LIMIT_OK(tlen, qn->lower))) {
+     if (qn->lower == 1 && tlen > QUANTIFIER_EXPAND_LIMIT_SIZE) {
+       if (qn->greedy) {
+ #ifdef USE_OP_PUSH_OR_JUMP_EXACT
+@@ -1150,8 +1154,8 @@ compile_quantifier_node(QtfrNode* qn, regex_t* reg)
+     r = compile_tree(qn->target, reg);
+   }
+   else if (!infinite && qn->greedy &&
+-           (qn->upper == 1 || (tlen + SIZE_OP_PUSH) * qn->upper
+-                                  <= QUANTIFIER_EXPAND_LIMIT_SIZE)) {
++           (qn->upper == 1 ||
++            IS_EXPAND_LIMIT_OK(tlen + SIZE_OP_PUSH, qn->upper))) {
+     int n = qn->upper - qn->lower;
+ 
+     r = compile_tree_n_times(qn->target, qn->lower, reg);
+diff --git a/test/ruby/test_regexp.rb b/test/ruby/test_regexp.rb
+index 010be01960..debded0683 100644
+--- a/test/ruby/test_regexp.rb
++++ b/test/ruby/test_regexp.rb
+@@ -2107,4 +2107,16 @@ class TestRegexp < Test::Unit::TestCase
+       re =~ s
+     end
+   end
++
++  def test_nested_repeat_expansion_overflow
++    assert_separately([], "#{<<-"begin;"}\n#{<<-'end;'}", timeout: 30)
++    begin;
++      # A nested repeat whose expanded size overflows int must not be
++      # unrolled: the compiler used to hang or emit wrapped jump offsets.
++      ["(?:.{90000,}){90000}", "(?:.{46341,}){46341}"].each do |src|
++        re = Regexp.new(src)
++        assert_nil(re.match("x" * 10), src)
++      end
++    end;
++  end
+ end
diff --git a/meta/recipes-devtools/ruby/ruby/CVE-2026-97229_p2.patch b/meta/recipes-devtools/ruby/ruby/CVE-2026-97229_p2.patch
new file mode 100644
index 0000000000..a15e6964c4
--- /dev/null
+++ b/meta/recipes-devtools/ruby/ruby/CVE-2026-97229_p2.patch
@@ -0,0 +1,79 @@
+From 83e9b083d47536b4e10f3e8685af5c89646efab9 Mon Sep 17 00:00:00 2001
+From: Hiroshi SHIBATA <hsbt@ruby-lang.org>
+Date: Fri, 25 Sep 2026 12:10:25 +0900
+Subject: [PATCH] Reject a compiled program too big for its offset type
+
+Concatenated large repeats reach a program past INT_MAX from a few hundred
+kilobytes of source, and the offsets emitted into it wrap.  Cap the size
+while the program is emitted, which does not depend on the length pass that
+overflows along with it.
+
+CVE: CVE-2026-97229
+Upstream-Status: Backport [https://github.com/ruby/ruby/commit/b03e500193371ae87dc4536d855008b42a9cd1a7]
+
+Co-Authored-By: Claude Opus 5 <noreply@anthropic.com>
+(cherry picked from commit cf35145fc46bc278e0ab0003478fc4afe6564819)
+Signed-off-by: Deepak Rathore <deeratho@cisco.com>
+---
+ include/ruby/onigmo.h | 1 +
+ regcomp.c             | 4 ++++
+ regerror.c            | 2 ++
+ regint.h              | 5 +++++
+ 4 files changed, 12 insertions(+)
+
+diff --git a/include/ruby/onigmo.h b/include/ruby/onigmo.h
+index db290cd47a..8c8ee5a7ea 100644
+--- a/include/ruby/onigmo.h
++++ b/include/ruby/onigmo.h
+@@ -687,6 +687,7 @@ ONIG_EXTERN const OnigSyntaxType*   OnigDefaultSyntax;
+ #define ONIGERR_NEVER_ENDING_RECURSION                       -221
+ #define ONIGERR_GROUP_NUMBER_OVER_FOR_CAPTURE_HISTORY        -222
+ #define ONIGERR_INVALID_CHAR_PROPERTY_NAME                   -223
++#define ONIGERR_TOO_BIG_COMPILED_PROGRAM                     -226
+ #define ONIGERR_INVALID_CODE_POINT_VALUE                     -400
+ #define ONIGERR_INVALID_WIDE_CHAR_VALUE                      -400
+ #define ONIGERR_TOO_BIG_WIDE_CHAR_VALUE                      -401
+diff --git a/regcomp.c b/regcomp.c
+index 4eaccfaaa8..986b53eb55 100644
+--- a/regcomp.c
++++ b/regcomp.c
+@@ -223,6 +223,10 @@ unset_addr_list_add(UnsetAddrList* uslist, int offset, struct _Node* node)
+ static int
+ add_opcode(regex_t* reg, int opcode)
+ {
++  /* Every instruction passes here, so this is where a program that would
++     outgrow its offset type is stopped, while it is still being emitted. */
++  if (reg->used > MAX_COMPILED_PROGRAM_SIZE)
++    return ONIGERR_TOO_BIG_COMPILED_PROGRAM;
+   BBUF_ADD1(reg, opcode);
+   return 0;
+ }
+diff --git a/regerror.c b/regerror.c
+index b18fc2e88b..0ff581ad42 100644
+--- a/regerror.c
++++ b/regerror.c
+@@ -165,6 +165,8 @@ onig_error_code_to_format(OnigPosition code)
+     p = "group number is too big for capture history"; break;
+   case ONIGERR_INVALID_CHAR_PROPERTY_NAME:
+     p = "invalid character property name {%n}"; break;
++  case ONIGERR_TOO_BIG_COMPILED_PROGRAM:
++    p = "too big compiled program"; break;
+   case ONIGERR_TOO_MANY_CAPTURE_GROUPS:
+     p = "too many capture groups are specified"; break;
+   case ONIGERR_INVALID_CODE_POINT_VALUE:
+diff --git a/regint.h b/regint.h
+index 75abfba235..8de93f5bdf 100644
+--- a/regint.h
++++ b/regint.h
+@@ -394,6 +394,11 @@ typedef unsigned int  BitStatusType;
+ #define INT_MAX_LIMIT           ((1UL << (SIZEOF_INT * 8 - 1)) - 1)
+ #define LONG_MAX_LIMIT           ((1UL << (SIZEOF_LONG * 8 - 1)) - 1)
+ 
++/* Program offsets are RelAddrType, and the compile_length_*() functions sum
++   into int, so a larger program would wrap both.  The quarter leaves room
++   for the sums the offset arithmetic makes out of those lengths. */
++#define MAX_COMPILED_PROGRAM_SIZE  ((unsigned int )(INT_MAX_LIMIT / 4))
++
+ #define DIGITVAL(code)    ((code) - '0')
+ #define ODIGITVAL(code)   DIGITVAL(code)
+ #define XDIGITVAL(enc,code) \
diff --git a/meta/recipes-devtools/ruby/ruby/CVE-2026-97229_p3.patch b/meta/recipes-devtools/ruby/ruby/CVE-2026-97229_p3.patch
new file mode 100644
index 0000000000..d39bc52874
--- /dev/null
+++ b/meta/recipes-devtools/ruby/ruby/CVE-2026-97229_p3.patch
@@ -0,0 +1,31 @@
+From 4cca9e5cadd7b56525d012ff783c6abcf52094ba Mon Sep 17 00:00:00 2001
+From: Hiroshi SHIBATA <hsbt@ruby-lang.org>
+Date: Fri, 23 Oct 2026 10:22:03 +0900
+Subject: [PATCH] Keep the program size error from OP_END with subexp calls
+
+With a subexp call, the result of unset_addr_list_fix overwrote the error, so a pattern over the limit compiled without raising RegexpError.
+
+Follow-up to cf35145fc46.
+
+CVE: CVE-2026-97229
+Upstream-Status: Backport [https://github.com/ruby/ruby/commit/f6496bca68ca445bcc1ced04818bfa4220b2bc7f]
+
+Co-Authored-By: Claude Opus 5.5 <noreply@anthropic.com>
+(cherry picked from commit 16d8a554b2ad279e08128b5e1dc4b342fccd33d7)
+Signed-off-by: Deepak Rathore <deeratho@cisco.com>
+---
+ regcomp.c | 1 +
+ 1 file changed, 1 insertion(+)
+
+diff --git a/regcomp.c b/regcomp.c
+index 986b53eb55..b1f63e6534 100644
+--- a/regcomp.c
++++ b/regcomp.c
+@@ -5971,6 +5971,7 @@ onig_compile(regex_t* reg, const UChar* pattern, const UChar* pattern_end,
+   r = compile_tree(root, reg);
+   if (r == 0) {
+     r = add_opcode(reg, OP_END);
++    if (r != 0) goto err_unset;
+ #ifdef USE_SUBEXP_CALL
+     if (scan_env.num_call > 0) {
+       r = unset_addr_list_fix(&uslist, reg);
diff --git a/meta/recipes-devtools/ruby/ruby_3.3.10.bb b/meta/recipes-devtools/ruby/ruby_3.3.10.bb
index 936bc73e32..0cd0822ac9 100644
--- a/meta/recipes-devtools/ruby/ruby_3.3.10.bb
+++ b/meta/recipes-devtools/ruby/ruby_3.3.10.bb
@@ -27,7 +27,10 @@ SRC_URI = "http://cache.ruby-lang.org/pub/ruby/${SHRT_VER}/ruby-${PV}.tar.gz \
            file://0006-Make-gemspecs-reproducible.patch \
            file://0001-vm_dump.c-Define-REG_S1-and-REG_S2-for-musl-riscv.patch \
            file://0007-Skip-test_rm_r_no_permissions-test-under-root.patch \
-          "
+           file://CVE-2026-97229_p1.patch \
+           file://CVE-2026-97229_p2.patch \
+           file://CVE-2026-97229_p3.patch \
+           "
 UPSTREAM_CHECK_URI = "https://www.ruby-lang.org/en/downloads/"
 
 inherit autotools ptest pkgconfig
-- 
2.35.6

