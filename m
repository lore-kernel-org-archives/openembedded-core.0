Received: from rcdn-iport-4.cisco.com (rcdn-iport-4.cisco.com [173.37.86.75])
 by mx.groups.io with SMTP id smtpd.msgproc01-g2.7189.1794395099271606333
 for <openembedded-core@lists.openembedded.org>;
 Wed, 11 Nov 2026 03:04:59 -0800
Authentication-Results: mx.groups.io;
 dkim=fail reason="dkim: message contains an insecure body length tag" header.i=@cisco.com header.s=iport01 header.b=ksH8MWHA;
 spf=pass (domain: cisco.com, ip: 173.37.86.75, mailfrom: deeratho@cisco.com)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
  d=cisco.com; i=@cisco.com; l=11005; q=dns/txt;
  s=iport01; t=1794395099; x=1795604699;
  h=from:to:subject:date:message-id:mime-version:
   content-transfer-encoding;
  bh=UmSnZTRS4M4BvomY1RhDgLqZAljXcE1iKCrweIjrctA=;
  b=ksH8MWHAFjIsQ66HsOaDiKhTgtusTxONjRkNkWmacv4zIpriLqWJRkoF
   KZwpNADC2g4rPRr2tlFob2odi7A54M5D75+NpqtQUVWV7WA6+8RwMRIKM
   5aYJcOrDUN+HP56jibLQWVnIeIOZq4uV/WAME24qhtPyfSwQLppobrwbW
   yUlRJQH056SU1umpERAQw+ToX9bCJMmMYYEybaeZ4fdxgM5id5WG7eVvB
   pDDSOMGzurg/NwMYVCXV7aUwQC6juITUqiMqGKMQZn5/Pq+Bk7o+FOysq
   9rXjG4uhQQ4qRdfeqQtMJUtikmX/7ndYagyMz+H20TbQo5yuE5PuhtmRr
   g==;
X-CSE-ConnectionGUID: D5VE59BGRLu1kiB6XpPEZw==
X-CSE-MsgGUID: W3NKYmt1T5mpFoDHitTSvw==
X-IPAS-Result: =?us-ascii?q?A0BEAgAGS/Rq/5P/Ja1aglmCV3VhQkmUKoIhniWBfg8BA?=
 =?us-ascii?q?QEPRA0EAQGTJQImNAkOAQIEAwIDAQEBAQEBAQEBAQEBCgEBBQEBAQIBBwWBD?=
 =?us-ascii?q?hOGTw2QEgEtCwEYAVkDAQJaIyEagmgBgnQCARG5VoF5M4EBgykBRg9/2zMBC?=
 =?us-ascii?q?xQBgTiFQogkXRgBhH0nGxuBcoQJdoEFgVwBAYEnEYZuBIIigQyBWh6MfAKBT?=
 =?us-ascii?q?4clSIEeA1ksAVUTDQoLBwWBaAM1EioVbjIdgSM+F4EHGwYFgRyBHoESgQddg?=
 =?us-ascii?q?SsoXiGBCIF2AoJRggACAUlBDgdFUwklQxJHJCIIEgkBExosCoEaNTwJJj8VD?=
 =?us-ascii?q?GcLGgVhCAINDHQ5EDAeJC8FGiY+Gwp+GA1IESw3FRkEPm4HklUZgw4HAXoTA?=
 =?us-ascii?q?QcjARdoBhsxk2yQRIIhoREKKIN4jCSPQoV4GjOFW6UXC5h9jgqVaWiEaoFoP?=
 =?us-ascii?q?IFZcBWCbgEBATEJShkPjjmDa4UTyUgjNQIJMgEBBwIHDgMLgWiQAAEngVYBA?=
 =?us-ascii?q?Q?=
IronPort-Data: A9a23:k2OTn6uY1jmck4Nbyowx6ZTp4OfnVAdfMUV32f8akzHdYApBsoF/q
 tZmKWDSbv+DN2L1fI9wPoXgphsG75DVm4A3SQJspH1kEShEgMeUXt7xwmUckM+xwmwvaGo9s
 q3yv/GZdJhcokf0/0nrb/656yYsjclkf5KkYMbcICd9WAR4fykojBNnioYRj5Vh6TSDK1vlV
 eja/YuFZzdJ5xYuajhKsvva8Us21BjPkGpwUmIWNKgjUGD2zxH5PLpHTYmtIn3xRJVjH+LSb
 47r0LGj82rFyAwmA9Wjn6yTWhVirmn6ZFXmZtJ+AsBOszAazsAA+v9T2Mk0NS+7vw60c+VZk
 72hg3AfpTABZcUgkMxFO/VR/roX0aduoNcrKlDn2SCfItGvn3bEm51T4E8K0YIw1rtJLDwf3
 9MiDC1UbRGp2dKu+J+JVbw57igjBJGD0II3oHpsy3TdSP0hW52GGv2M7t5D1zB2jcdLdRrcT
 5NGMnw0M1KaPkAJYwtIYH49tL/Aan3XfzBVsluJpa0f6GnIxws327/oWDbQUoHWG5sMxhrI/
 Aoq+UzGWTc5BdmDkAbY92qCgcPvnD/HY5wNQejQGvlCxQf7KnYoIBoOWF22pPO0hkKzV5dUL
 FYZ0i4vtrQpskuzQ9/wWhe1rHKJslgbQdU4LgEhwBuGxqyR50OSAXIJC2cZLtcnr8QxAzct0
 zdlgu/UONCmi5XNIVr1y1tehWra1fQ9RYPaWRI5cA==
IronPort-HdrOrdr: A9a23:d2MvtKqlU6MgN5uzrdQluisaV5obeYIsimQD101hICG9Ffbo9f
 xG88506faZslsssRIb6LO90de7IE80nKQdieJ6AV7IZmbbUQWTQL2KlbGD/xTQXwvj6+Vaya
 BsN4J6CNH2EBxGqPyS2njcLz7lq+P3l5xBQozlvhNQcT0=
X-Talos-CUID: 9a23:OTKntWGaSjUUOC3xqmJLqXA5R5EPXUf50S7TImXmOX5RZY+KHAo=
X-Talos-MUID: =?us-ascii?q?9a23=3AFJ/OrQxvat7CuUEfkJgx4acAIWyaqJv1LmM8lIl?=
 =?us-ascii?q?fh5SBLQJ3FxeckAiMXJByfw=3D=3D?=
X-IronPort-Anti-Spam-Filtered: true
X-IronPort-AV: E=Sophos;i="6.27,207,1787011200"; 
   d="scan'208";a="546610482"
Received: from rcdn-l-core-10.cisco.com ([173.37.255.147])
  by rcdn-iport-4.cisco.com with ESMTP/TLS/TLS_AES_256_GCM_SHA384; 11 Nov 2026 11:04:58 +0000
Received: from sjc-ads-3552.cisco.com (sjc-ads-3552.cisco.com [171.68.249.250])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256
	 client-signature RSA-PSS (4096 bits) client-digest SHA256)
	(Client CN "ciscoit-managed-infra-smtp-auth.cisco.com", Issuer "Internal Private TLS SubCA" (verified OK))
	by rcdn-l-core-10.cisco.com (Postfix) with ESMTPS id 1BF771800025E
	for <openembedded-core@lists.openembedded.org>; Wed, 11 Nov 2026 11:04:58 +0000 (GMT)
Received: by sjc-ads-3552.cisco.com (Postfix, from userid 1795984)
	id BE585CC1600; Wed, 11 Nov 2026 03:04:57 -0800 (PST)
From: "Deepak Rathore -X (deeratho - E INFOCHIPS PRIVATE LIMITED at Cisco)" <deeratho@cisco.com>
To: openembedded-core@lists.openembedded.org
Subject: [OE-core][scarthgap][PATCH] ruby: Fix CVE-2026-97229
Date: Wed, 11 Nov 2026 03:04:48 -0800
Message-Id: <20261111110448.3303353-1-deeratho@cisco.com>
X-Mailer: git-send-email 2.35.6
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Outbound-Client-TLS: VERIFIED;sjc-ads-3552.cisco.com [171.68.249.250];TLSv1.3;TLS_AES_256_GCM_SHA384;256;ciscoit-managed-infra-smtp-auth.cisco.com
X-Outbound-SMTP-Client: 171.68.249.250, sjc-ads-3552.cisco.com
X-Outbound-Node: rcdn-l-core-10.cisco.com
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by lin-tor-korg-lkml-alma10-1 with HTTPS for <openembedded-core@lists.openembedded.org>; Wed, 11 Nov 2026 11:05:02 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/250014
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
 .../ruby/ruby/CVE-2026-97229_p1.patch         | 96 +++++++++++++++++++
 .../ruby/ruby/CVE-2026-97229_p2.patch         | 78 +++++++++++++++
 .../ruby/ruby/CVE-2026-97229_p3.patch         | 30 ++++++
 meta/recipes-devtools/ruby/ruby_3.3.10.bb     |  5 +-
 4 files changed, 208 insertions(+), 1 deletion(-)
 create mode 100644 meta/recipes-devtools/ruby/ruby/CVE-2026-97229_p1.patch
 create mode 100644 meta/recipes-devtools/ruby/ruby/CVE-2026-97229_p2.patch
 create mode 100644 meta/recipes-devtools/ruby/ruby/CVE-2026-97229_p3.patch

diff --git a/meta/recipes-devtools/ruby/ruby/CVE-2026-97229_p1.patch b/meta/recipes-devtools/ruby/ruby/CVE-2026-97229_p1.patch
new file mode 100644
index 0000000000..5585e8ceb4
--- /dev/null
+++ b/meta/recipes-devtools/ruby/ruby/CVE-2026-97229_p1.patch
@@ -0,0 +1,96 @@
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
index 0000000000..169958f3db
--- /dev/null
+++ b/meta/recipes-devtools/ruby/ruby/CVE-2026-97229_p2.patch
@@ -0,0 +1,78 @@
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
index 0000000000..aa8bfd18c3
--- /dev/null
+++ b/meta/recipes-devtools/ruby/ruby/CVE-2026-97229_p3.patch
@@ -0,0 +1,30 @@
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

