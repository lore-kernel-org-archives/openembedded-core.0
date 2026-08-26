Return-Path: <hthakar@cisco.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 9772AC5DF97
	for <webhook@archiver.kernel.org>; Wed, 26 Aug 2026 05:40:36 +0000 (UTC)
Received: from alln-iport-8.cisco.com (alln-iport-8.cisco.com [173.37.142.95])
 by mx.groups.io with SMTP id smtpd.msgproc02-g2.6233.1787722832274057503
 for <openembedded-core@lists.openembedded.org>;
 Tue, 25 Aug 2026 22:40:32 -0700
Authentication-Results: mx.groups.io;
 dkim=fail reason="dkim: message contains an insecure body length tag" header.i=@cisco.com header.s=iport01 header.b=QvMZVGnl;
 spf=pass (domain: cisco.com, ip: 173.37.142.95, mailfrom: hthakar@cisco.com)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
  d=cisco.com; i=@cisco.com; l=14107; q=dns/txt;
  s=iport01; t=1787722832; x=1788932432;
  h=from:to:cc:subject:date:message-id:mime-version:
   content-transfer-encoding;
  bh=OrAfwIc884CP6YwwaTSDxUwnHKzw+9x5vTJ4FjyKbtM=;
  b=QvMZVGnlYLbW+cYJ6/tUucivKJ7zQD3UkQRRDpV11/kxTDk/Vvue5iws
   1djZ9gk2dDHQ7uhzcKVkZRqULYhD0zbe7K0PQ1vT3V8cJdQK/qXbqggMO
   cUp9prD65/2vybepXJzvlYu4D3+NdKpL7+U4RzjpYLOecxTT3Gqizz2Cl
   2v+tqrEL7gIWNAWE4kAYn9t3uGNjOg+8km/GjWkYOv6yz6pfSbNuD0oJw
   PB2RWgYAOUQnpTvd/wxx0S5MGZ8yXhdyl7YokhbT5xF9sipZUCF1l9EQ9
   4Y5+wpLsTcnqUdROXREvquER/s6BYggFJ0CxYGckF/ZRzLe9OebucaiGu
   g==;
X-CSE-ConnectionGUID: sbqMMwtLQe+jEE5VkBLLiQ==
X-CSE-MsgGUID: 3g3ovjm1Qmq0h1uzL/IqKw==
X-IPAS-Result: =?us-ascii?q?A0BFAgDpeo5q/48QJK1aglmCV3RfQkmWSp4egX4PAQEBD?=
 =?us-ascii?q?0QNBAEBhQWNbgImNAkOAQIEAwIDAQEBAQEBAQEBAQELAQEFAQEBAgEHBYEOE?=
 =?us-ascii?q?4ZPDYZaAQIBATQBGAEtLAMBAlojIYMCAYJ0AgERBr5BgiyBAYMoATEHBwJDU?=
 =?us-ascii?q?NswAQsUAQWBM4U/iCJdGAGDXYEfJxsbgXKBFYNpgQWBXAEBAYgkBIIiehKBW?=
 =?us-ascii?q?h4ygjOPBUiBHgNZLAFVEw0KCwcFgWYDNRIqFW4yHYEjPheBDRsGBYEdgSiEE?=
 =?us-ascii?q?CMZNnyBCV6BKylgARIXgQmCBwKCWoIFAgFJQw4HRz4LGA1IESw3FBkEPm4Hj?=
 =?us-ascii?q?msfgikZBwEsYQEHDBggLkoFJlEppWWhDwoog3aMIpU6GjOpVYEXC5h9jgqVa?=
 =?us-ascii?q?GiEaYFoPIEoHwsHcBVIAYJZCUoZD44sAQsLg2CBf4MUgkHEZSQ1AgEIMgEBB?=
 =?us-ascii?q?wIHDgMLgWiRfgEB?=
IronPort-Data: A9a23:k0SsUKOe/6mLK4PvrR3ylsFynXyQoLVcMsEvi/4bfWQNrUog0TIGx
 mpOW2jXPqqCZmamL411aYu09kgHvsfXx9cyTnM5pCpnJ55oRWUpJjg4wmPYZX76whjrFRo/h
 ykmQoCeaphyFTmE+kvF3oHJ9RFUzbuPSqf3FNnKMyVwQR4MYCo6gHqPocZh6mJTqYb/WV7lV
 e/a+ZWFZgf1gWAsawr41orawP9RlKWq0N8nlgRWicBj5Df2i3QTBZQDEqC9R1OQapVUBOOzW
 9HYx7i/+G7Dlz91Yj9yuu+mGqGiaue60Tmm0hK6aYD76vRxjnBaPpIACRYpQRw/ZwNlMDxG4
 I4lWZSYEW/FN0BX8QgXe0Ew/ypWZcWq9FJbSJSymZT78qHIT5fj6+5kFWQTIpE8w+s0A0xjq
 MIbAhQpbynW0opawJrjIgVtrs0nKM+uOMYUvWttiGmHS/0nWpvEBa7N4Le03h9p2ZsIRqiYP
 pRfMGY0BPjDS0Un1lM/CI4+leShnFH0ciZTrxSeoq9fD237nFYpgeKwYISOEjCMbZ5axUGGp
 GefxmHgWhFDKc67jhuc0W3504cjmgu+Aur+DoaQ8eZnhlCWzGEfBBAaEFC8u/SRjk+lR8kZL
 FQZ/Ccrp6U++EGnCN7nUHWFTGWstxoYXZ9UVuY98gzIkvSS6AeCDW9CRTlEADA7iPILqfUR/
 gfht7vU6fZH7tV5lVr1Gm+okA6P
IronPort-HdrOrdr: A9a23:ExN72an0Zz0sQx5fN8E1yyZcgkTpDfIA3DAbv31ZSRFFG/FwWf
 rAoB19726QtN9/YhAdcLy7VZVoIkmsl6Kdn7NwAV7KZmCP0wGVxepZg7cKrQeNJ8TWzJ846U
 4ZSdkcNPTASX5nkM39/A60V/wkwNWB7eSUoN229QYLcemvAJsQljuQzW2gYytLeDU=
X-Talos-CUID: =?us-ascii?q?9a23=3ACqAMWWrUIQnbMpqj0Wo7alLmUdsva1j402v0GkL?=
 =?us-ascii?q?7C0tEFYOWY3u0+Zoxxg=3D=3D?=
X-Talos-MUID: =?us-ascii?q?9a23=3AFdnpJg3Kv2Kali3a5I2hp9foBDUjuKv1D14PlMw?=
 =?us-ascii?q?/vtDcNXVtKRParS2UXdpy?=
X-IronPort-Anti-Spam-Filtered: true
X-IronPort-AV: E=Sophos;i="6.25,244,1779148800"; 
   d="scan'208";a="820925863"
Received: from alln-l-core-06.cisco.com ([173.36.16.143])
  by alln-iport-8.cisco.com with ESMTP/TLS/TLS_AES_256_GCM_SHA384; 26 Aug 2026 05:36:51 +0000
Received: from sjc-ads-4178.cisco.com (sjc-ads-4178.cisco.com [171.70.54.199])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256
	 client-signature RSA-PSS (4096 bits) client-digest SHA256)
	(Client CN "ciscoit-managed-infra-smtp-auth.cisco.com", Issuer "Internal Private TLS SubCA" (verified OK))
	by alln-l-core-06.cisco.com (Postfix) with ESMTPS id BB6BD1800027A;
	Wed, 26 Aug 2026 05:36:51 +0000 (GMT)
Received: by sjc-ads-4178.cisco.com (Postfix, from userid 1887505)
	id 50C6FCE1BBD; Tue, 25 Aug 2026 22:36:51 -0700 (PDT)
From: "Hetvi Thakar -X (hthakar - E INFOCHIPS PRIVATE LIMITED at Cisco)" <hthakar@cisco.com>
To: openembedded-core@lists.openembedded.org
Cc: xe-linux-external@cisco.com,
	Hetvi Thakar <hthakar@cisco.com>
Subject: [OE-core][scarthgap][PATCH 1/5] apr-util: Fix CVE-2025-49506
Date: Tue, 25 Aug 2026 22:36:23 -0700
Message-Id: <20260826053627.1798620-1-hthakar@cisco.com>
X-Mailer: git-send-email 2.35.6
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Auto-Response-Suppress: DR, OOF, AutoReply
X-Outbound-Client-TLS: VERIFIED;sjc-ads-4178.cisco.com [171.70.54.199];TLSv1.3;TLS_AES_256_GCM_SHA384;256;ciscoit-managed-infra-smtp-auth.cisco.com
X-Outbound-SMTP-Client: 171.70.54.199, sjc-ads-4178.cisco.com
X-Outbound-Node: alln-l-core-06.cisco.com
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Wed, 26 Aug 2026 05:40:36 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/244295

From: Hetvi Thakar <hthakar@cisco.com>

Backport the upstream timing-safe comparison fix [1] and its XLC
compatibility follow-up [2]. APR-util 1.6.4 identifies this issue as
fixed [3].

[1] https://github.com/apache/apr-util/commit/f77a20761cb15686f8d4de5b5eafc534ae24b19e
[2] https://github.com/apache/apr-util/commit/e35eee2ea9e1f77bdec26c3bfdb5caca457acd66
[3] https://nvd.nist.gov/vuln/detail/CVE-2025-49506

Signed-off-by: Hetvi Thakar <hthakar@cisco.com>
---
 .../apr/apr-util/CVE-2025-49506_p1.patch      | 310 ++++++++++++++++++
 .../apr/apr-util/CVE-2025-49506_p2.patch      |  42 +++
 meta/recipes-support/apr/apr-util_1.6.3.bb    |   2 +
 3 files changed, 354 insertions(+)
 create mode 100644 meta/recipes-support/apr/apr-util/CVE-2025-49506_p1.patch
 create mode 100644 meta/recipes-support/apr/apr-util/CVE-2025-49506_p2.patch

diff --git a/meta/recipes-support/apr/apr-util/CVE-2025-49506_p1.patch b/meta/recipes-support/apr/apr-util/CVE-2025-49506_p1.patch
new file mode 100644
index 0000000000..0ab5cf0648
--- /dev/null
+++ b/meta/recipes-support/apr/apr-util/CVE-2025-49506_p1.patch
@@ -0,0 +1,310 @@
+From f77a20761cb15686f8d4de5b5eafc534ae24b19e Mon Sep 17 00:00:00 2001
+From: Eric Covener <covener@apache.org>
+Date: Mon, 3 Aug 2026 12:10:13 +0000
+Subject: [PATCH] Merge r1936804 from aprutil 1.7.x:
+
+use timing safe comparison
+
+Submitted By: ylavic
+Reviewed By: ylavic, rpluem, covener
+
+
+
+
+git-svn-id: https://svn.apache.org/repos/asf/apr/apr-util/branches/1.6.x@1936805 13f79535-47bb-0310-9956-ffa450edef68
+
+CVE: CVE-2025-49506
+Upstream-Status: Backport [https://github.com/apache/apr-util/commit/f77a20761cb15686f8d4de5b5eafc534ae24b19e]
+
+(cherry picked from commit f77a20761cb15686f8d4de5b5eafc534ae24b19e)
+Signed-off-by: Hetvi Thakar <hthakar@cisco.com>
+---
+ crypto/apr_crypto.c |  60 +++++++++++++++++---
+ crypto/apr_passwd.c | 135 ++++++++++++++++++++++++++++++++++++++++----
+ 2 files changed, 176 insertions(+), 19 deletions(-)
+
+diff --git a/crypto/apr_crypto.c b/crypto/apr_crypto.c
+index 9ba190ef..ca3f0887 100644
+--- a/crypto/apr_crypto.c
++++ b/crypto/apr_crypto.c
+@@ -21,6 +21,7 @@
+ #include "apu.h"
+ #include "apr_pools.h"
+ #include "apr_dso.h"
++#include "apr_version.h"
+ #include "apr_strings.h"
+ #include "apr_hash.h"
+ #include "apr_thread_mutex.h"
+@@ -173,19 +174,64 @@ APU_DECLARE(apr_status_t) apr_crypto_memzero(void *buffer, apr_size_t size)
+     return APR_SUCCESS;
+ }
+ 
++/* Borrow this from APR-1.8 if not available */
++#if !APR_VERSION_AT_LEAST(1,8,0)
++
++/* A volatile variable which is always zero but allows to block the compiler
++ * from optimizing or eliding code using it. Volatile forces the compiler to
++ * emit a memory load for which no value can be assumed, so for instance an
++ * add/sub/xor/or with "optblocker" is a noop that will hide the result to
++ * the optimizer.
++ */
++static volatile const apr_uint32_t optblocker;
++
++/* Return whether x is not zero, with no branching controlled by x.
++ *
++ * Taken from the cryptoint library (public domain) by D. J. Bernstein,
++ * which provides timing attacks safe integer operations/primitives.
++ * Code:
++ *   https://lib.mceliece.org/libmceliece-20250507/cryptoint/crypto_uint32.h
++ * Paper:
++ *   https://cr.yp.to/papers/cryptoint-20250424.pdf
++ */
++#if __has_attribute(always_inline)
++__attribute__((always_inline))
++#endif
++static APR_INLINE int test_nonzero_timingsafe(apr_uint32_t x)
++{
++    x |= -x; /* sets the most significant bit unless x == 0 */
++
++    /* shift bit 31 (MSB) to bit 0 */
++    x >>= 32-6;      /* keep 6 bits */
++    x += optblocker; /* lose the optimizer */
++    x >>= 5;         /* keep the (original) MSB only */
++
++    /* x is now 0 or 1 */
++    return x & INT_MAX;
++}
++
++#endif /* !APR_VERSION_AT_LEAST(1,8,0) */
++
+ APU_DECLARE(int) apr_crypto_equals(const void *buf1, const void *buf2,
+                                    apr_size_t size)
+ {
+-    const unsigned char *p1 = buf1;
+-    const unsigned char *p2 = buf2;
+-    unsigned char diff = 0;
+-    apr_size_t i;
++#if APR_VERSION_AT_LEAST(1,8,0)
++    return apr_memeq_timingsafe(buf1, buf2, size);
++#else
++    apr_uint32_t diff = 0;
++    volatile apr_size_t count = size; /* prevent loop unrolling */
++    apr_size_t i = 0;
+ 
+-    for (i = 0; i < size; ++i) {
+-        diff |= p1[i] ^ p2[i];
++    for (; i < count; ++i) {
++        const unsigned char c1 = ((volatile const unsigned char *)buf1)[i];
++        const unsigned char c2 = ((volatile const unsigned char *)buf2)[i];
++
++        diff |= c1 ^ c2; /* sets diff to non-zero whenever c1 != c2 */
+     }
+ 
+-    return 1 & ((diff - 1) >> 8);
++    /* (diff == 0) <=> (diff != 0) ^ 1 */
++    return test_nonzero_timingsafe(diff) ^ 1;
++#endif
+ }
+ 
+ APU_DECLARE(apr_status_t) apr_crypto_get_driver(
+diff --git a/crypto/apr_passwd.c b/crypto/apr_passwd.c
+index c961de2b..74b5fc17 100644
+--- a/crypto/apr_passwd.c
++++ b/crypto/apr_passwd.c
+@@ -14,6 +14,7 @@
+  * limitations under the License.
+  */
+ 
++#include "apr_version.h"
+ #include "apr_strings.h"
+ #include "apr_md5.h"
+ #include "apr_lib.h"
+@@ -39,6 +40,111 @@
+ 
+ static const char * const apr1_id = "$apr1$";
+ 
++#if APR_VERSION_AT_LEAST(1,8,0)
++
++#define streq_timingsafe    apr_streq_timingsafe
++#define strneq_timingsafe   apr_strneq_timingsafe
++
++#else /* borrow code from APR-1.8 if not available */
++
++/* A volatile variable which is always zero but allows to block the compiler
++ * from optimizing or eliding code using it. Volatile forces the compiler to
++ * emit a memory load for which no value can be assumed, so for instance an
++ * add/sub/xor/or with "optblocker" is a noop that will hide the result to
++ * the optimizer.
++ */
++static volatile const apr_uint32_t optblocker;
++
++/* Return whether x is not zero, with no branching controlled by x.
++ *
++ * Taken from the cryptoint library (public domain) by D. J. Bernstein,
++ * which provides timing attacks safe integer operations/primitives.
++ * Code:
++ *   https://lib.mceliece.org/libmceliece-20250507/cryptoint/crypto_uint32.h
++ * Paper:
++ *   https://cr.yp.to/papers/cryptoint-20250424.pdf
++ */
++#if __has_attribute(always_inline)
++__attribute__((always_inline))
++#endif
++static APR_INLINE int test_nonzero_timingsafe(apr_uint32_t x)
++{
++    x |= -x; /* sets the most significant bit unless x == 0 */
++
++    /* shift bit 31 (MSB) to bit 0 */
++    x >>= 32-6;      /* keep 6 bits */
++    x += optblocker; /* lose the optimizer */
++    x >>= 5;         /* keep the (original) MSB only */
++
++    /* x is now 0 or 1 */
++    return x & INT_MAX;
++}
++
++static int streq_timingsafe(const char *sec1, const char *str2)
++{
++    apr_uint32_t diff = 0;
++    apr_size_t i1 = 0, i2 = 0;
++
++    for (;; ++i2) {
++        const unsigned char c1 = ((volatile const unsigned char *)sec1)[i1];
++        const unsigned char c2 = ((volatile const unsigned char *)str2)[i2];
++
++        diff |= c1 ^ c2; /* sets diff to non-zero whenever c1 != c2 */
++
++        /* Not a shortest/longest match because an attacker would usually know
++         * one of the strings and could then determine the length of the other.
++         * So assume only sec1 and its length are secret and stop the loop at
++         * the end of str2. If sec1 is shorter than str2 the loop will continue
++         * by comparing the rest of str2 with the trailing NUL byte of sec1.
++         * In any case since the diff above is computed up to and including a
++         * NUL byte, only the same content and length will raise match.
++         */
++        if (!c2) {
++            break;
++        }
++
++        /* Don't go above sec1's NUL byte */
++        i1 += test_nonzero_timingsafe(c1);
++    }
++
++    /* (diff == 0) <=> (diff != 0) ^ 1 */
++    return test_nonzero_timingsafe(diff) ^ 1;
++}
++
++static int strneq_timingsafe(const char *sec1, const char *str2, apr_size_t n)
++{
++    apr_uint32_t diff = 0;
++    volatile apr_size_t count = n; /* prevent loop unrolling */
++    apr_size_t i1 = 0, i2 = 0;
++
++    for (; i2 < count; ++i2) {
++        const unsigned char c1 = ((volatile const unsigned char *)sec1)[i1];
++        const unsigned char c2 = ((volatile const unsigned char *)str2)[i2];
++
++        diff |= c1 ^ c2; /* sets diff to non-zero whenever c1 != c2 */
++
++        /* Not a shortest/longest match because an attacker would usually know
++         * one of the strings and could then determine the length of the other.
++         * So assume only sec1 and its length are secret and stop the loop at
++         * the end of str2. If sec1 is shorter than str2 the loop will continue
++         * by comparing the rest of str2 with the trailing NUL byte of sec1.
++         * In any case since the diff above is computed up to and including a
++         * NUL byte, only the same content and length will raise match.
++         */
++        if (!c2) {
++            break;
++        }
++
++        /* Don't go above sec1's NUL byte */
++        i1 += test_nonzero_timingsafe(c1);
++    }
++
++    /* (diff == 0) <=> (diff != 0) ^ 1 */
++    return test_nonzero_timingsafe(diff) ^ 1;
++}
++
++#endif /* APR_VERSION_AT_LEAST(1,8,0) */
++
+ #if !defined(WIN32) && !defined(BEOS) && !defined(NETWARE)
+ #if defined(APU_CRYPT_THREADSAFE) || !APR_HAS_THREADS || \
+     defined(CRYPT_R_CRYPTD) || defined(CRYPT_R_STRUCT_CRYPT_DATA)
+@@ -86,28 +192,33 @@ APU_DECLARE(apr_status_t) apr_password_validate(const char *passwd,
+ #if !CRYPT_MISSING
+     char *crypt_pw;
+ #endif
+-    if (hash[0] == '$'
+-        && hash[1] == '2'
+-        && (hash[2] == 'a' || hash[2] == 'y')
+-        && hash[3] == '$') {
++
++    if ((strneq_timingsafe(hash, "$2a$", 4) | /* test both */
++         strneq_timingsafe(hash, "$2y$", 4))) {
++        /*
++         * The hash was created using [apr_]bcrypt encoding.
++         */
+         if (_crypt_blowfish_rn(passwd, hash, sample, sizeof(sample)) == NULL)
+             return APR_FROM_OS_ERROR(errno);
+     }
+-    else if (!strncmp(hash, apr1_id, strlen(apr1_id))) {
++    else if (strneq_timingsafe(hash, apr1_id, strlen(apr1_id))) {
+         /*
+          * The hash was created using our custom algorithm.
+          */
+         apr_md5_encode(passwd, hash, sample, sizeof(sample));
+     }
+-    else if (!strncmp(hash, APR_SHA1PW_ID, APR_SHA1PW_IDLEN)) {
+-         apr_sha1_base64(passwd, (int)strlen(passwd), sample);
++    else if (strneq_timingsafe(hash, APR_SHA1PW_ID, APR_SHA1PW_IDLEN)) {
++        /*
++         * The hash is a (naked) SHA1.
++         */
++        apr_sha1_base64(passwd, (int)strlen(passwd), sample);
+     }
+     else {
+         /*
+          * It's not our algorithm, so feed it to crypt() if possible.
+          */
+ #if CRYPT_MISSING
+-        return (strcmp(passwd, hash) == 0) ? APR_SUCCESS : APR_EMISMATCH;
++        return streq_timingsafe(hash, passwd) ? APR_SUCCESS : APR_EMISMATCH;
+ #elif defined(CRYPT_R_CRYPTD)
+         apr_status_t rv;
+         CRYPTD *buffer = malloc(sizeof(*buffer));
+@@ -118,7 +229,7 @@ APU_DECLARE(apr_status_t) apr_password_validate(const char *passwd,
+         if (!crypt_pw)
+             rv = APR_EMISMATCH;
+         else
+-            rv = (strcmp(crypt_pw, hash) == 0) ? APR_SUCCESS : APR_EMISMATCH;
++            rv = streq_timingsafe(hash, crypt_pw) ? APR_SUCCESS : APR_EMISMATCH;
+         free(buffer);
+         return rv;
+ #elif defined(CRYPT_R_STRUCT_CRYPT_DATA)
+@@ -149,7 +260,7 @@ APU_DECLARE(apr_status_t) apr_password_validate(const char *passwd,
+         if (!crypt_pw)
+             rv = APR_EMISMATCH;
+         else
+-            rv = (strcmp(crypt_pw, hash) == 0) ? APR_SUCCESS : APR_EMISMATCH;
++            rv = streq_timingsafe(hash, crypt_pw) ? APR_SUCCESS : APR_EMISMATCH;
+         free(buffer);
+         return rv;
+ #else
+@@ -173,14 +284,14 @@ APU_DECLARE(apr_status_t) apr_password_validate(const char *passwd,
+                 rv = APR_EMISMATCH;
+             }
+             else {
+-                rv = (strcmp(crypt_pw, hash) == 0) ? APR_SUCCESS : APR_EMISMATCH;
++                rv = streq_timingsafe(hash, crypt_pw) ? APR_SUCCESS : APR_EMISMATCH;
+             }
+             crypt_mutex_unlock();
+             return rv;
+         }
+ #endif
+     }
+-    return (strcmp(sample, hash) == 0) ? APR_SUCCESS : APR_EMISMATCH;
++    return streq_timingsafe(hash, sample) ? APR_SUCCESS : APR_EMISMATCH;
+ }
+ 
+ static const char * const bcrypt_id = "$2y$";
diff --git a/meta/recipes-support/apr/apr-util/CVE-2025-49506_p2.patch b/meta/recipes-support/apr/apr-util/CVE-2025-49506_p2.patch
new file mode 100644
index 0000000000..b2acaf52d4
--- /dev/null
+++ b/meta/recipes-support/apr/apr-util/CVE-2025-49506_p2.patch
@@ -0,0 +1,42 @@
+From e35eee2ea9e1f77bdec26c3bfdb5caca457acd66 Mon Sep 17 00:00:00 2001
+From: Eric Covener <covener@apache.org>
+Date: Mon, 3 Aug 2026 13:45:25 +0000
+Subject: [PATCH] Merge r1936827 from aprutil 1.7.x:
+
+hide __has_attribute on traditional xlc platforms
+
+The backport of 1917748 omitted this in apr.h on purpose,
+but this is a new/narrow usage and not in a header
+where it would taint anyones use of __has_attribute.
+
+
+
+
+git-svn-id: https://svn.apache.org/repos/asf/apr/apr-util/branches/1.6.x@1936828 13f79535-47bb-0310-9956-ffa450edef68
+
+CVE: CVE-2025-49506
+Upstream-Status: Backport [https://github.com/apache/apr-util/commit/e35eee2ea9e1f77bdec26c3bfdb5caca457acd66]
+
+(cherry picked from commit e35eee2ea9e1f77bdec26c3bfdb5caca457acd66)
+Signed-off-by: Hetvi Thakar <hthakar@cisco.com>
+---
+ crypto/apr_passwd.c | 6 ++++++
+ 1 file changed, 6 insertions(+)
+
+diff --git a/crypto/apr_passwd.c b/crypto/apr_passwd.c
+index 74b5fc17..9231d312 100644
+--- a/crypto/apr_passwd.c
++++ b/crypto/apr_passwd.c
+@@ -64,6 +64,12 @@ static volatile const apr_uint32_t optblocker;
+  * Paper:
+  *   https://cr.yp.to/papers/cryptoint-20250424.pdf
+  */
++#if (defined(__xlc__) && !defined(__GNUC__))
++#ifndef __has_attribute
++#define __has_attribute(__x)    0
++#endif
++#endif
++
+ #if __has_attribute(always_inline)
+ __attribute__((always_inline))
+ #endif
diff --git a/meta/recipes-support/apr/apr-util_1.6.3.bb b/meta/recipes-support/apr/apr-util_1.6.3.bb
index 3a5f52d250..06f13e91ca 100644
--- a/meta/recipes-support/apr/apr-util_1.6.3.bb
+++ b/meta/recipes-support/apr/apr-util_1.6.3.bb
@@ -13,6 +13,8 @@ SRC_URI = "${APACHE_MIRROR}/apr/${BPN}-${PV}.tar.gz \
            file://configfix.patch \
            file://configure_fixes.patch \
 	   file://0001-test_transformation-Check-if-transform-is-supported-.patch \
+           file://CVE-2025-49506_p1.patch \
+           file://CVE-2025-49506_p2.patch \
            file://run-ptest \
            "
 
-- 
2.35.6


