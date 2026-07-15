Return-Path: <deeratho@cisco.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id C1E5CC44501
	for <webhook@archiver.kernel.org>; Wed, 15 Jul 2026 17:24:35 +0000 (UTC)
Received: from rcdn-iport-9.cisco.com (rcdn-iport-9.cisco.com [173.37.86.80])
 by mx.groups.io with SMTP id smtpd.msgproc01-g2.7.1784136268430520106
 for <openembedded-core@lists.openembedded.org>;
 Wed, 15 Jul 2026 10:24:28 -0700
Authentication-Results: mx.groups.io;
 dkim=fail reason="dkim: message contains an insecure body length tag" header.i=@cisco.com header.s=iport01 header.b=EczvyIpw;
 spf=pass (domain: cisco.com, ip: 173.37.86.80, mailfrom: deeratho@cisco.com)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
  d=cisco.com; i=@cisco.com; l=9673; q=dns/txt;
  s=iport01; t=1784136268; x=1785345868;
  h=from:to:subject:date:message-id:in-reply-to:references:
   mime-version:content-transfer-encoding;
  bh=5YZOm04AnEgetuyBNQ+NNeLsL960OLNOwNk7OXzvXCM=;
  b=EczvyIpw1HsuZ/ZOxu9AZNGjOj27BIfhypboD4StJ8zREWqsp7cHpDE0
   HAJmrP0kDsIyVhGzZVvlf3OacmihQr6Imw4Nl2ZwmcAUSKOydu9NstQYg
   uBUgX+Rm0MmyhKZSyfOMV8l8D4UbS0ozaoZspjny38ENRy+jF+8DjZFxx
   zyGcl4RX6wX7a65GRaHELFwPWzHvvpKWaSKIjgplvt7ByZ2SUo7MSIeXx
   M/yJwuaogZ+2ZGl+mv1+zjvCXL3SDHWYpnunxyMI/rLVTwCTT4sdvCssy
   gAnY5Xt4VlmtmUimnSrn19Ki27NTZ+pDIwJtL8gJ4rI2PTHfwk0JbdXj9
   Q==;
X-CSE-ConnectionGUID: WkhpngH1SJazrM53dv16IA==
X-CSE-MsgGUID: NgrGKMl4QG+lkF4+tIURqA==
X-IPAS-Result: =?us-ascii?q?A0BKAgBwwVdq/47/Ja1aHgEBCxIMggULgld0X0JJhFePU?=
 =?us-ascii?q?oIhA54bgX4PAQEBD0QNBAEBhQUCjVECJjQJDgECBAMCAwEBAQEBAQEBAQEBC?=
 =?us-ascii?q?wEBBQEBAQIBBwWBDhOGTw2GWgECAQMjBAsBGAE9HAMBAgMCJgICKyMIEQiDA?=
 =?us-ascii?q?gGCdAMRvTJ6fzOBAYMoAT8CQ1DbLgELFAGBCi6FP4MdAYUCXBgBhHwnGxuBc?=
 =?us-ascii?q?oEVg2mBBYFcAYU8gmoEgiKBDIFaHoIGjXNIgQIcA1ksAVUTDQoLBwWBZgM1E?=
 =?us-ascii?q?ioVbjIdgSM+FzRYGwcFgR2BUIEChHYjHwM5f4EwdUp3LWoSF4FRghSBGgMLG?=
 =?us-ascii?q?A1IESw3FBsEPQFuB41KJYI4BgGBBAoBKyJ+gS6TEwEJkjShEgoog3WMIZU6G?=
 =?us-ascii?q?jOEBJQXklELmH2OCpYOQoRpgWg8gSgcAwsHcBU7gmcJShkPjioDCwuFX4MUy?=
 =?us-ascii?q?QU8NQIBCDIBAQcCBw4DC4FokX4BAQ?=
IronPort-Data: A9a23:vZXOmq0IT/icDQPrTPbD5YJwkn2cJEfYwER7XKvMYLTBsI5bp2YAn
 zFND2yBaf+Ja2f3fdlzao619xlXucfWz99rGQRk3Hw8FHgiRegpqji6wuYcGwvIc6UvmWo+t
 512huHodZ5yFjmH4E/xbtANlFEkvYmQXL3wFeXYDS54QA5gWU8JhAlq8wIDqtYAbeORXUXX5
 Lsen+WFYAX7g2EtbzpNg06+gEoHUMra6WtwUmMWPZinjHeG/1EJAZQWI72GLneQauF8Au6gS
 u/f+6qy92Xf8g1FIovNfmHTKxBirhb6ZGBiu1IOM0SQqkEqSh8ajs7XAMEhhXJ/0F1lqTzeJ
 OJl7vRcQS9xVkHFdX90vxNwS0mSNoUekFPLzOTWXcG7lyX7n3XQL/pGM0I2JYsX2r9MI2hc7
 9lFczwTN06irrfjqF67YrEEasULNsLnOsYb/3pn1zycVatgSpHYSKKM7thdtNsyrpkRRrCFO
 IxDNGcpNUiaC/FMEg9/5JYWkOqlnHDjczpwo1OOrq1x6G/WpOB0+OW1YYCPIIXRG625mG6+q
 Xjp3EH9Xig1d9ic52bG7lORvPbmyHaTtIU6UefQGuRRqFqLy2oeDRcbWVe2rbyyjVSzc9ZeM
 FAPvC02oK4/8UamQtXwU1u/unHsg/IHc8BbH+t/7ESGzbDZpl7EQGMFVTVGLtchsafaWAAX6
 7NApPuxbRQHjVFfYSj1Gmu8xd9qBRUoEA==
IronPort-HdrOrdr: A9a23:jcL0QKFx04QzPtOppLqEyseALOsnbusQ8zAXPidKOHtom62j5q
 STdZsguyMc5Ax9ZJhko6HiBEDiewK4yXcK2+gs1N6ZNWGM0ldAbrsSj7cKqAeOJ8SRzIJgPN
 9bE5RWOZnXEUVwi9r87U2TFtYtx8TCzYWT7N2uqUuEiWpRGtldB8ATMHfjLnFL
X-Talos-CUID: 9a23:GAOhjWApMwoI+7H6ExZk9FYSFeB8SV/U3m31fhS0Fz83aZTAHA==
X-Talos-MUID: =?us-ascii?q?9a23=3AVUtTQw4SNi4wWqD7eyO7xNcWxoxO7L6BK2UJzaw?=
 =?us-ascii?q?p+M2HG3AzJxagti2eF9o=3D?=
X-IronPort-Anti-Spam-Filtered: true
X-IronPort-AV: E=Sophos;i="6.25,165,1779148800"; 
   d="scan'208";a="509222136"
Received: from rcdn-l-core-05.cisco.com ([173.37.255.142])
  by rcdn-iport-9.cisco.com with ESMTP/TLS/TLS_AES_256_GCM_SHA384; 15 Jul 2026 17:24:27 +0000
Received: from bgl-ads-3413.cisco.com (bgl-ads-3413.cisco.com [173.39.60.50])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256
	 client-signature RSA-PSS (4096 bits) client-digest SHA256)
	(Client CN "ciscoit-managed-infra-smtp-auth.cisco.com", Issuer "Internal Private TLS SubCA" (verified OK))
	by rcdn-l-core-05.cisco.com (Postfix) with ESMTPS id 1C5E818000201
	for <openembedded-core@lists.openembedded.org>; Wed, 15 Jul 2026 17:24:27 +0000 (GMT)
Received: by bgl-ads-3413.cisco.com (Postfix, from userid 1795984)
	id 3EDA1CC037D; Wed, 15 Jul 2026 22:54:25 +0530 (IST)
From: "Deepak Rathore -X (deeratho - E INFOCHIPS PRIVATE LIMITED at Cisco)" <deeratho@cisco.com>
To: openembedded-core@lists.openembedded.org
Subject: [OE-core][scarthgap][PATCH 3/6] glib-2.0: fix CVE-2026-58012
Date: Wed, 15 Jul 2026 22:53:27 +0530
Message-Id: <20260715172330.1149253-3-deeratho@cisco.com>
X-Mailer: git-send-email 2.35.6
In-Reply-To: <20260715172330.1149253-1-deeratho@cisco.com>
References: <20260715172330.1149253-1-deeratho@cisco.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-Outbound-Client-TLS: VERIFIED;bgl-ads-3413.cisco.com [173.39.60.50];TLSv1.3;TLS_AES_256_GCM_SHA384;256;ciscoit-managed-infra-smtp-auth.cisco.com
X-Outbound-SMTP-Client: 173.39.60.50, bgl-ads-3413.cisco.com
X-Outbound-Node: rcdn-l-core-05.cisco.com
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Wed, 15 Jul 2026 17:24:35 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/241028

From: Deepak Rathore <deeratho@cisco.com>

This patch applies the upstream 2.86.5 backport for
CVE-2026-58012. The upstream fix commit is referenced in [1],
and the public CVE advisory is referenced in [2].

[1] https://gitlab.gnome.org/GNOME/glib/-/commit/d337aabd24ee2b8ac2a690dba3ccf26aa70e638f
[2] https://nvd.nist.gov/vuln/detail/CVE-2026-58012

Signed-off-by: Deepak Rathore <deeratho@cisco.com>
---
 .../glib-2.0/glib-2.0/CVE-2026-58012.patch    | 228 ++++++++++++++++++
 meta/recipes-core/glib-2.0/glib-2.0_2.78.6.bb |   1 +
 2 files changed, 229 insertions(+)
 create mode 100644 meta/recipes-core/glib-2.0/glib-2.0/CVE-2026-58012.patch

diff --git a/meta/recipes-core/glib-2.0/glib-2.0/CVE-2026-58012.patch b/meta/recipes-core/glib-2.0/glib-2.0/CVE-2026-58012.patch
new file mode 100644
index 0000000000..7f8435809c
--- /dev/null
+++ b/meta/recipes-core/glib-2.0/glib-2.0/CVE-2026-58012.patch
@@ -0,0 +1,228 @@
+From 74564fefcec22fc1efc187c36aa1fb8dcfe34454 Mon Sep 17 00:00:00 2001
+From: Philip Withnall <pwithnall@gnome.org>
+Date: Tue, 31 Mar 2026 16:13:57 +0100
+Subject: [PATCH] gregex: Fix case changing substitutions with G_REGEX_RAW
+
+In `G_REGEX_RAW` mode, the input string is treated as a byte array
+(basically ASCII) rather than a unichar array. Accordingly, the case
+changing code for substitutions needs to operate on bytes with
+`G_REGEX_RAW`, rather than operating on unichars.
+
+This fixes a potential buffer overflow when trying to do a case change
+on a match of a set of bytes which are a truncated multi-byte UTF-8
+encoding at the end of the input buffer.
+
+Spotted by linhlhq as #YWH-PGM9867-193. I adapted their reproducer as
+the unit test, but implemented the fix in `gregex.c` independently.
+
+Fixes: #3918
+
+CVE: CVE-2026-58012
+Upstream-Status: Backport [https://gitlab.gnome.org/GNOME/glib/-/commit/d337aabd24ee2b8ac2a690dba3ccf26aa70e638f]
+
+Signed-off-by: Philip Withnall <pwithnall@gnome.org>
+(cherry picked from commit d337aabd24ee2b8ac2a690dba3ccf26aa70e638f)
+Signed-off-by: Deepak Rathore <deeratho@cisco.com>
+---
+ glib/gregex.c      | 59 ++++++++++++++++++++++++++++++++++------------
+ glib/tests/regex.c | 53 +++++++++++++++++++++++++++++++++++++++++
+ 2 files changed, 97 insertions(+), 15 deletions(-)
+
+diff --git a/glib/gregex.c b/glib/gregex.c
+index 116ecacbb..496b34bbd 100644
+--- a/glib/gregex.c
++++ b/glib/gregex.c
+@@ -3147,19 +3147,25 @@ split_replacement (const gchar  *replacement,
+   return g_list_reverse (list);
+ }
+ 
+-/* Change the case of c based on change_case. */
+-#define CHANGE_CASE(c, change_case) \
++/* Change the case of c based on change_case.
++ * g_ascii_to*() will happily pass through non-ASCII bytes unchanged. */
++#define UTF8_CHANGE_CASE(c, change_case) \
+         (((change_case) & CHANGE_CASE_LOWER_MASK) ? \
+                 g_unichar_tolower (c) : \
+                 g_unichar_toupper (c))
++#define RAW_CHANGE_CASE(c, change_case) \
++        (((change_case) & CHANGE_CASE_LOWER_MASK) ? \
++                g_ascii_tolower (c) : \
++                g_ascii_toupper (c))
+ 
++/* If @text_is_raw is set, @text might not be valid UTF-8 (but will be
++ * nul-terminated). */
+ static void
+ string_append (GString     *string,
+                const gchar *text,
++               gboolean     text_is_raw,
+                ChangeCase  *change_case)
+ {
+-  gunichar c;
+-
+   if (text[0] == '\0')
+     return;
+ 
+@@ -3169,22 +3175,44 @@ string_append (GString     *string,
+     }
+   else if (*change_case & CHANGE_CASE_SINGLE_MASK)
+     {
+-      c = g_utf8_get_char (text);
+-      g_string_append_unichar (string, CHANGE_CASE (c, *change_case));
+-      g_string_append (string, g_utf8_next_char (text));
++      if (!text_is_raw)
++        {
++          gunichar c = g_utf8_get_char (text);
++          g_string_append_unichar (string, UTF8_CHANGE_CASE (c, *change_case));
++          g_string_append (string, g_utf8_next_char (text));
++        }
++      else
++        {
++          g_string_append_c (string, RAW_CHANGE_CASE (text[0], *change_case));
++          g_string_append (string, text + 1);
++        }
++
+       *change_case = CHANGE_CASE_NONE;
+     }
+   else
+     {
+-      while (*text != '\0')
++      if (!text_is_raw)
+         {
+-          c = g_utf8_get_char (text);
+-          g_string_append_unichar (string, CHANGE_CASE (c, *change_case));
+-          text = g_utf8_next_char (text);
++          while (*text != '\0')
++            {
++              gunichar c = g_utf8_get_char (text);
++              g_string_append_unichar (string, UTF8_CHANGE_CASE (c, *change_case));
++              text = g_utf8_next_char (text);
++            }
++        }
++      else
++        {
++          while (*text != '\0')
++            {
++              char c = *text;
++              g_string_append_c (string, RAW_CHANGE_CASE (c, *change_case));
++              text++;
++            }
+         }
+     }
+ }
+ 
++/* @match_info is (nullable) */
+ static gboolean
+ interpolate_replacement (const GMatchInfo *match_info,
+                          GString          *result,
+@@ -3194,6 +3222,7 @@ interpolate_replacement (const GMatchInfo *match_info,
+   InterpolationData *idata;
+   gchar *match;
+   ChangeCase change_case = CHANGE_CASE_NONE;
++  gboolean is_raw = (match_info != NULL && (match_info->regex->orig_compile_opts & G_REGEX_RAW));
+ 
+   for (list = data; list; list = list->next)
+     {
+@@ -3201,10 +3230,10 @@ interpolate_replacement (const GMatchInfo *match_info,
+       switch (idata->type)
+         {
+         case REPL_TYPE_STRING:
+-          string_append (result, idata->text, &change_case);
++          string_append (result, idata->text, is_raw, &change_case);
+           break;
+         case REPL_TYPE_CHARACTER:
+-          g_string_append_c (result, CHANGE_CASE (idata->c, change_case));
++          g_string_append_c (result, UTF8_CHANGE_CASE (idata->c, change_case));
+           if (change_case & CHANGE_CASE_SINGLE_MASK)
+             change_case = CHANGE_CASE_NONE;
+           break;
+@@ -3212,7 +3241,7 @@ interpolate_replacement (const GMatchInfo *match_info,
+           match = g_match_info_fetch (match_info, idata->num);
+           if (match)
+             {
+-              string_append (result, match, &change_case);
++              string_append (result, match, is_raw, &change_case);
+               g_free (match);
+             }
+           break;
+@@ -3220,7 +3249,7 @@ interpolate_replacement (const GMatchInfo *match_info,
+           match = g_match_info_fetch_named (match_info, idata->text);
+           if (match)
+             {
+-              string_append (result, match, &change_case);
++              string_append (result, match, is_raw, &change_case);
+               g_free (match);
+             }
+           break;
+diff --git a/glib/tests/regex.c b/glib/tests/regex.c
+index d7a698ec6..bffb52a87 100644
+--- a/glib/tests/regex.c
++++ b/glib/tests/regex.c
+@@ -2529,6 +2529,58 @@ test_compiled_regex_after_jit_failure (void)
+   g_regex_unref (regex);
+ }
+ 
++static void
++test_replace_raw_change_case (void)
++{
++  GError *local_error = NULL;
++  GRegex *regex = NULL;
++
++  g_test_bug ("https://gitlab.gnome.org/GNOME/glib/-/issues/3918");
++  g_test_summary ("Test that case changes as part of a replacement are handled correctly in G_REGEX_RAW mode");
++
++  /*
++   * Match a multi-byte sequence in RAW mode. The pattern matches
++   * exactly 2 bytes. The subject contains a 4-byte UTF-8 lead (0xF4)
++   * followed by only one continuation byte, then NUL.
++   *
++   * The matched substring will be "\xf4\x80" (2 bytes, heap-allocated
++   * as 3-byte buffer with NUL). If the code regresses and tries to handle
++   * the replacement as UTF-8 then g_utf8_get_char() would see 0xF4 and try
++   * to read 4 bytes, going 1 byte past the NUL into OOB territory.
++   */
++  regex = g_regex_new ("..", G_REGEX_RAW, 0, &local_error);
++  g_assert_no_error (local_error);
++
++  /*
++   * Build a subject string with truncated UTF-8.
++   * \xF4 = 4-byte UTF-8 lead byte
++   * \x80 = continuation byte
++   * No 3rd/4th continuation bytes — the match is only 2 bytes.
++   *
++   * \U\0 = uppercase the entire match → triggers string_append()
++   * with case change on the 2-byte non-UTF-8 match.
++   */
++  char subject[] = "\xf4\x80";
++  char *result = g_regex_replace (regex, subject, -1, 0, "\\U\\0", 0, &local_error);
++  g_assert_no_error (local_error);
++
++  g_clear_pointer (&result, g_free);
++  g_clear_pointer (&regex, g_regex_unref);
++
++  /*
++   * Second variant: single-char case change \u with \0 backreference.
++   */
++  regex = g_regex_new (".", G_REGEX_RAW, 0, &local_error);
++  g_assert_no_error (local_error);
++
++  char subject2[] = "\xe6\xb0";  /* 3-byte UTF-8 lead, only 2 bytes */
++  result = g_regex_replace (regex, subject2, -1, 0, "\\u\\0", 0, &local_error);
++  g_assert_no_error (local_error);
++
++  g_clear_pointer (&result, g_free);
++  g_clear_pointer (&regex, g_regex_unref);
++}
++
+ int
+ main (int argc, char *argv[])
+ {
+@@ -2550,6 +2602,7 @@ main (int argc, char *argv[])
+   g_test_add_func ("/regex/jit-unsupported-matching", test_jit_unsupported_matching_options);
+   g_test_add_func ("/regex/unmatched-named-subpattern", test_unmatched_named_subpattern);
+   g_test_add_func ("/regex/compiled-regex-after-jit-failure", test_compiled_regex_after_jit_failure);
++  g_test_add_func ("/regex/replace-raw-change-case", test_replace_raw_change_case);
+ 
+   /* TEST_NEW(pattern, compile_opts, match_opts) */
+   TEST_NEW("[A-Z]+", G_REGEX_CASELESS | G_REGEX_EXTENDED | G_REGEX_OPTIMIZE, G_REGEX_MATCH_NOTBOL | G_REGEX_MATCH_PARTIAL);
+-- 
+2.35.6
diff --git a/meta/recipes-core/glib-2.0/glib-2.0_2.78.6.bb b/meta/recipes-core/glib-2.0/glib-2.0_2.78.6.bb
index 6532d7eac0..2a4a1dad5b 100644
--- a/meta/recipes-core/glib-2.0/glib-2.0_2.78.6.bb
+++ b/meta/recipes-core/glib-2.0/glib-2.0_2.78.6.bb
@@ -49,6 +49,7 @@ SRC_URI = "${GNOME_MIRROR}/glib/${SHRT_VER}/glib-${PV}.tar.xz \
            file://CVE-2026-1489-04.patch \
            file://CVE-2026-58010.patch \
            file://CVE-2026-58011.patch \
+           file://CVE-2026-58012.patch \
            "
 SRC_URI:append:class-native = " file://relocate-modules.patch \
                                 file://0001-meson.build-do-not-enable-pidfd-features-on-native-g.patch \
-- 
2.35.6


