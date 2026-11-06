Received: from rcdn-iport-6.cisco.com (rcdn-iport-6.cisco.com [173.37.86.77])
 by mx.groups.io with SMTP id smtpd.msgproc01-g2.1217.1793949576312656142
 for <openembedded-core@lists.openembedded.org>;
 Thu, 05 Nov 2026 23:19:36 -0800
Authentication-Results: mx.groups.io;
 dkim=fail reason="dkim: message contains an insecure body length tag" header.i=@cisco.com header.s=iport01 header.b=Q8tgAH5F;
 spf=pass (domain: cisco.com, ip: 173.37.86.77, mailfrom: dkelaiya@cisco.com)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
  d=cisco.com; i=@cisco.com; l=28438; q=dns/txt;
  s=iport01; t=1793949576; x=1795159176;
  h=from:to:cc:subject:date:message-id:in-reply-to:
   references:mime-version:content-transfer-encoding;
  bh=ZqUkH27PYeq3b++p1HYivokxCLUwrKIPbo3exMoZ7Lc=;
  b=Q8tgAH5FqlY5iaG5EKg0Eju6P7bCn3kffS3uO3i0FZi1DShX8kglZDHC
   /aN619KGD3BFd14Zqviwmez6s/YYRCmfF2avyP0xHDgM0mvrR3HrESYuN
   xgvLeCB0j1ofq4+/ybXxC7L5P1R17B4FCPecEYhdHo/Tys98rhtgB/v2z
   yw+cAkxAXWZBeRMZAORxRmaI8mZjnAJUFoVWl62nzUE47vPiyTHU6hTz3
   DQyadC3m5ItutE/xNJ16sz7gWCinNYmivHlbKjEqWihdYo1ylZmuoAEPS
   6JZaDDt9xsnjcwTWhfukGlRA0Vn8BZy+uUjHNE2enAEK3zfrxzrmow+RU
   A==;
X-CSE-ConnectionGUID: CzlVFVl5T7eP9DZtsUxf5g==
X-CSE-MsgGUID: NAp20Tq1R82tLhWgifzBJw==
X-IPAS-Result: =?us-ascii?q?A0BJAgDtfu1q/5L/Ja1aglmCV3VgQ0mWSwOBE5A5jFWBf?=
 =?us-ascii?q?g8BAQEPRA0EAQGFBQKOHQImNAkOAQIEAwIDAQEBAQEBAQEBAQEBCgEBBQEBA?=
 =?us-ascii?q?QIBBwWBDhOGTw2QEgECAQMaDQsBGAEtEBwDAQIvKyMIGYMCAYJ0AxEGuzgbN?=
 =?us-ascii?q?4F5M4EBgykBPwICQAFQ2zMBCxQBgTiFQIgjXRgBRIQ5JxsbgXKBFYJzdoEFg?=
 =?us-ascii?q?VwCAYFHhl4Egg0VgQyBWh5ughmIVYEeAoFRhnlIgR4DWSwBVRMNCgsHBYFoA?=
 =?us-ascii?q?zUSKhVuMh2BIz4XgQcbBgWBHYEegRKBB12BKyhdASGBCIF2AoJRggACAUlBD?=
 =?us-ascii?q?gdFUwklQxJHJCIIEgkBExosCoEaNTwJJj8VDGQLGgVhCAINDHQ5EDAeJC8FH?=
 =?us-ascii?q?CY+GwovGA1IESw3FRkEPm4Hkj2CZRsLBQIBFUsCGBMBKQKBTRsFEAY4AhGSb?=
 =?us-ascii?q?x0JAQeQFoIhgTWfXAoog3iMJJU6GjOEBIFXiz2ZWQuYfY4KlWkbTYRpgWg8g?=
 =?us-ascii?q?VlwFYMiCRY0GQ+OLgsLg2CGQMYFJjICCTIBAQcCBw4DC4FohGGNHQEB?=
IronPort-Data: A9a23:We4HDK9slL8jQmZoY7jCDrUD0X+TJUtcMsCJ2f8bNWPcYEJGY0x3n
 WpMXmqHMv2IYGajftpwOd7gpx4Cv5KGnd8yGwFk+31EQiMRo6IpJzg2wmQcns+2BpeeJK6yx
 5xGMrEsFOhtEDmB4E/rbei5xZVF/fngbqLmD+LZMTxGSwZhSSMw4TpugOdRbrRA2bBVOCvT/
 4mtyyHjEAX9gWAtazpJs/vrRC5H5ZwehhtJ5jTSWtgT1LPuvyF9JI4SI6i3M0z5TuF8dsamR
 /zOxa2O5WjQ+REgELuNyt4XpWVTH9Y+lSDX4pZnc/DKbipq/0Te4Y5nXBYoUnq7vh3S9zxHJ
 HqhgrTrIeshFvWkdO3wyHC0GQkmVUFN0OevzXRSLaV/wmWeG0YAzcmCA2kdL4km1NhzXF0R+
 MRJBAIRdS2Tib+5lefTpulE3qzPLeHxN48Z/3UlxjbDALN+ENbIQr7B4plT2zJYasJmRKmFI
 ZFGL2AyMVKZP0Mn1lQ/UPrSmM+khXT7ejxJoXqepLE85C7YywkZPL3FbYaJK4LXHJ0J9qqej
 kTv5z6hPghDDozF1R6FzX2tiP3lvzyuDer+E5X9rJaGmma7wXQeDhATX1a3rfS1z0W5Qd93L
 00P5jFoqrA/8kGuRNTxUxC05nmesXYht8F4CeY27kSJj6HT+QvcXjlCRT9aY9tgv8gzLdA36
 mK0cxrSLWQHmNWopbi1r994cRva1fApEFI/
IronPort-HdrOrdr: A9a23:gUAWW6vIWcnvpBqsViedHGlc7skDVNV00zEX/kB9WHVpmwKj+P
 xG+85rsiMc5wxxZJhNo7290ey7MBHhHP1OkO0s1MmZPDUO0VHAROoJ0WKh+UyEJ8SUzIBgPM
 lbH5SWcOeAbmRSvILd/BSyFcomzZ2s9aClgvqb8lJWJDsaDZ2JK2xCe36m+oocfng+OaYE
X-Talos-CUID: 9a23:MRXeJW+FP4BRmPF2HI+Vv2UGHv4LTHmA8CjdGx6UO3pyda2bFFDFrQ==
X-Talos-MUID: 9a23:QK2GIAYEiRXaJ+BTkRb03mleLZ5Ss/6yLEAynpQIqeOmKnkl
X-IronPort-Anti-Spam-Filtered: true
X-IronPort-AV: E=Sophos;i="6.27,197,1787011200"; 
   d="scan'208";a="544965104"
Received: from rcdn-l-core-09.cisco.com ([173.37.255.146])
  by rcdn-iport-6.cisco.com with ESMTP/TLS/TLS_AES_256_GCM_SHA384; 06 Nov 2026 07:19:35 +0000
Received: from sjc-ads-5675.cisco.com (sjc-ads-5675.cisco.com [10.28.88.189])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by rcdn-l-core-09.cisco.com (Postfix) with ESMTPS id ACA61180004B9;
	Fri,  6 Nov 2026 07:19:35 +0000 (GMT)
Received: by sjc-ads-5675.cisco.com (Postfix, from userid 1887444)
	id 12E9DCBEFAB; Thu,  5 Nov 2026 23:19:35 -0800 (PST)
From: "Darsh Kelaiya -X (dkelaiya - E INFOCHIPS PRIVATE LIMITED at Cisco)" <dkelaiya@cisco.com>
To: openembedded-core@lists.openembedded.org
Cc: Darsh Kelaiya <dkelaiya@cisco.com>
Subject: [OE-core][wrynose][PATCH 9/9] curl: fix CVE-2026-87866
Date: Thu,  5 Nov 2026 23:19:32 -0800
Message-Id: <20261106071932.490299-10-dkelaiya@cisco.com>
X-Mailer: git-send-email 2.35.6
In-Reply-To: <20261106071932.490299-1-dkelaiya@cisco.com>
References: <20261106071932.490299-1-dkelaiya@cisco.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Outbound-Client-TLS: ANONYMOUS;sjc-ads-5675.cisco.com [10.28.88.189];TLSv1.3;TLS_AES_256_GCM_SHA384;256
X-Outbound-SMTP-Client: 10.28.88.189, sjc-ads-5675.cisco.com
X-Outbound-Node: rcdn-l-core-09.cisco.com
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by lin-tor-korg-lkml-alma10-1 with HTTPS for <openembedded-core@lists.openembedded.org>; Fri, 06 Nov 2026 07:19:48 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/249605
Content-Type: text/plain; charset="utf-8"

From: Darsh Kelaiya <dkelaiya@cisco.com>

This patch applies the upstream fix as referenced in [2],
using the commit shown in [1].

Require the two certificate validity time fields to consume their
complete ASN.1 element before parsing the subject and public key.
This prevents wolfSSL pinning from accepting a different embedded key
than the key used for the TLS connection.

Carry the shared parser's byte-pointer updates and all TLS caller
changes so downstream layers enabling wolfSSL receive the source fix.
Retain the valid and malformed certificate regression in unit1657.

Adapt the older conversion helpers and unit-test entry point. Document
the omitted type-only updates to three tests absent from curl 8.19.0.

[1] https://github.com/curl/curl/commit/ed131747c1a3dc7f816d26724c44537ac8acba44
[2] https://curl.se/docs/CVE-2026-87866.html

Signed-off-by: Darsh Kelaiya <dkelaiya@cisco.com>
---
 .../curl/curl/CVE-2026-87866.patch            | 750 ++++++++++++++++++
 meta/recipes-support/curl/curl_8.19.0.bb      |   1 +
 2 files changed, 751 insertions(+)
 create mode 100644 meta/recipes-support/curl/curl/CVE-2026-87866.patch

diff --git a/meta/recipes-support/curl/curl/CVE-2026-87866.patch b/meta/recipes-support/curl/curl/CVE-2026-87866.patch
new file mode 100644
index 0000000000..c42aee1f0f
--- /dev/null
+++ b/meta/recipes-support/curl/curl/CVE-2026-87866.patch
@@ -0,0 +1,750 @@
+From ed131747c1a3dc7f816d26724c44537ac8acba44 Mon Sep 17 00:00:00 2001
+From: Stefan Eissing <stefan@eissing.org>
+Date: Wed, 2 Sep 2026 12:25:50 +0200
+Subject: [PATCH] x509: stricter parsing
+
+Check that the "validity" ASN.1 field has a length matching the
+contained date elements and fail the parsing otherwise.
+
+This is a precaution against malformed cert data that should have been
+caught by the TLS backend already. A bit added defense.
+
+Closes #22799
+
+CVE: CVE-2026-87866
+Upstream-Status: Backport [https://github.com/curl/curl/commit/ed131747c1a3dc7f816d26724c44537ac8acba44]
+
+Backport Changes:
+- Apply the byte-pointer updates to curl 8.19.0's older ASN.1 helpers.
+  Retain its Boolean, bit-string, integer and OID conversion logic,
+  including OID2str()'s symbolic argument in its updated signature.
+- Keep getASN1Element_()'s older flat length branches while applying
+  the byte reads and bounds comparison.
+- Expose getASN1Element() with UNITTEST and remove the older
+  Curl_x509_getASN1Element() wrapper. Add the private test prototype
+  to x509asn1.h: the old generator extracts only single-line prototypes.
+  Guard the production forward declaration to avoid a duplicate in
+  unit-test builds; retain WARN_UNUSED_RESULT on both declarations.
+- Adapt test1657 from the old CURLcode wrapper to the parser's pointer
+  result with the same success/error expectations. Rename its
+  inactive-build message to match the parser name.
+- Omit the type-only updates to unit1666, unit1667 and unit1676. These
+  tests are absent in 8.19.0; [1], [2] and [3] introduced them for OID
+  conversion, ASN.1-to-string conversion and DH public-key extraction.
+
+[1] https://github.com/curl/curl/commit/673e14cd33ef720b8c2b7e3485084e6e41a2c9dd
+[2] https://github.com/curl/curl/commit/14782b36fea2a5f69029b2b898302b6ba5aef838
+[3] https://github.com/curl/curl/commit/61d59c9e39b451b30feb431b780a5cc325757921
+
+Signed-off-by: Darsh Kelaiya <dkelaiya@cisco.com>
+---
+ lib/vtls/gtls.c       |   4 +-
+ lib/vtls/mbedtls.c    |   5 +-
+ lib/vtls/rustls.c     |  13 ++---
+ lib/vtls/schannel.c   |  10 ++--
+ lib/vtls/wolfssl.c    |   4 +-
+ lib/vtls/x509asn1.c   | 124 +++++++++++++++++++++---------------------
+ lib/vtls/x509asn1.h   |  22 ++++----
+ tests/unit/unit1651.c |   6 +-
+ tests/unit/unit1657.c |  79 ++++++++++++++++++++++++---
+ 9 files changed, 163 insertions(+), 104 deletions(-)
+
+diff --git a/lib/vtls/gtls.c b/lib/vtls/gtls.c
+index b87b27d864..02a8147520 100644
+--- a/lib/vtls/gtls.c
++++ b/lib/vtls/gtls.c
+@@ -1626,8 +1626,8 @@ CURLcode Curl_gtls_verifyserver(struct Curl_cfilter *cf,
+         goto out;
+ 
+       for(i = 0; i < chain.num_certs; i++) {
+-        const char *beg = (const char *)chain.certs[i].data;
+-        const char *end = beg + chain.certs[i].size;
++        const uint8_t *beg = chain.certs[i].data;
++        const uint8_t *end = beg + chain.certs[i].size;
+ 
+         result = Curl_extract_certinfo(data, (int)i, beg, end);
+         if(result)
+diff --git a/lib/vtls/mbedtls.c b/lib/vtls/mbedtls.c
+index d2199df884..cf7ac29594 100644
+--- a/lib/vtls/mbedtls.c
++++ b/lib/vtls/mbedtls.c
+@@ -431,9 +431,8 @@ static void mbed_extract_certinfo(struct Curl_easy *data,
+   result = Curl_ssl_init_certinfo(data, cert_count);
+ 
+   for(i = 0, cur = crt; result == CURLE_OK && cur; ++i, cur = cur->next) {
+-    const char *beg = (const char *)cur->raw.p;
+-    const char *end = beg + cur->raw.len;
+-    result = Curl_extract_certinfo(data, i, beg, end);
++    result = Curl_extract_certinfo(data, i, cur->raw.p,
++                                   cur->raw.p + cur->raw.len);
+   }
+ }
+ 
+diff --git a/lib/vtls/rustls.c b/lib/vtls/rustls.c
+index 89619432b8..017e7ddcd8 100644
+--- a/lib/vtls/rustls.c
++++ b/lib/vtls/rustls.c
+@@ -1225,15 +1225,10 @@ static CURLcode cr_connect(struct Curl_cfilter *cf, struct Curl_easy *data,
+                   (int)errorlen, errorbuf);
+             return map_error(rresult);
+           }
+-          {
+-            const char *beg;
+-            const char *end;
+-            beg = (const char *)der_data;
+-            end = (const char *)(der_data + der_len);
+-            result = Curl_extract_certinfo(data, (int)i, beg, end);
+-            if(result)
+-              return result;
+-          }
++          result = Curl_extract_certinfo(data, (int)i,
++                                         der_data, der_data + der_len);
++          if(result)
++            return result;
+         }
+       }
+ 
+diff --git a/lib/vtls/schannel.c b/lib/vtls/schannel.c
+index a4f57c7c0a..643b6d510c 100644
+--- a/lib/vtls/schannel.c
++++ b/lib/vtls/schannel.c
+@@ -1108,7 +1108,7 @@ static CURLcode schannel_pkp_pin_peer_pubkey(struct Curl_cfilter *cf,
+ 
+   do {
+     SECURITY_STATUS sspi_status;
+-    const char *x509_der;
++    uint8_t *x509_der;
+     DWORD x509_der_len;
+     struct Curl_X509certificate x509_parsed;
+     struct Curl_asn1Element *pubkey;
+@@ -1129,7 +1129,7 @@ static CURLcode schannel_pkp_pin_peer_pubkey(struct Curl_cfilter *cf,
+          (pCertContextServer->cbCertEncoded > 0)))
+       break;
+ 
+-    x509_der = (const char *)pCertContextServer->pbCertEncoded;
++    x509_der = (uint8_t *)pCertContextServer->pbCertEncoded;
+     x509_der_len = pCertContextServer->cbCertEncoded;
+     memset(&x509_parsed, 0, sizeof(x509_parsed));
+     if(Curl_parseX509(&x509_parsed, x509_der, x509_der + x509_der_len))
+@@ -1543,12 +1543,12 @@ static bool add_cert_to_certinfo(const CERT_CONTEXT *ccert_context,
+   struct Adder_args *args = (struct Adder_args *)raw_arg;
+   args->result = CURLE_OK;
+   if(valid_cert_encoding(ccert_context)) {
+-    const char *beg = (const char *)ccert_context->pbCertEncoded;
+-    const char *end = beg + ccert_context->cbCertEncoded;
+     int insert_index = reverse_order ? (args->certs_count - 1) - args->idx :
+                        args->idx;
+     args->result = Curl_extract_certinfo(args->data, insert_index,
+-                                         beg, end);
++                                         ccert_context->pbCertEncoded,
++                                         ccert_context->pbCertEncoded +
++                                         ccert_context->cbCertEncoded);
+     args->idx++;
+   }
+   return args->result == CURLE_OK;
+diff --git a/lib/vtls/wolfssl.c b/lib/vtls/wolfssl.c
+index c901ebfe1e..5a2967d275 100644
+--- a/lib/vtls/wolfssl.c
++++ b/lib/vtls/wolfssl.c
+@@ -1545,7 +1545,7 @@ CURLcode Curl_wssl_verify_pinned(struct Curl_cfilter *cf,
+ 
+   if(pinnedpubkey) {
+ #ifdef KEEP_PEER_CERT
+-    const char *x509_der;
++    const uint8_t *x509_der;
+     int x509_der_len;
+     struct Curl_X509certificate x509_parsed;
+     struct Curl_asn1Element *pubkey;
+@@ -1558,7 +1558,7 @@ CURLcode Curl_wssl_verify_pinned(struct Curl_cfilter *cf,
+       goto end;
+     }
+ 
+-    x509_der = (const char *)wolfSSL_X509_get_der(x509, &x509_der_len);
++    x509_der = wolfSSL_X509_get_der(x509, &x509_der_len);
+     if(!x509_der) {
+       failf(data, "SSL: failed retrieving ASN.1 server certificate");
+       goto end;
+diff --git a/lib/vtls/x509asn1.c b/lib/vtls/x509asn1.c
+index b687a60193..65f2d9229d 100644
+--- a/lib/vtls/x509asn1.c
++++ b/lib/vtls/x509asn1.c
+@@ -160,17 +160,19 @@ static const struct Curl_OID OIDtable[] = {
+  * Please note there is no pretension here to rewrite a full SSL library.
+  */
+ 
+-static const char *getASN1Element(struct Curl_asn1Element *elem,
+-                                  const char *beg, const char *end)
++#ifndef UNITTESTS
++static const uint8_t *getASN1Element(struct Curl_asn1Element *elem,
++                                     const uint8_t *beg, const uint8_t *end)
+   WARN_UNUSED_RESULT;
++#endif
+ 
+ #define CURL_ASN1_MAX_RECURSIONS    16
+ 
+-static const char *getASN1Element_(struct Curl_asn1Element *elem,
+-                                   const char *beg, const char *end,
++static const uint8_t *getASN1Element_(struct Curl_asn1Element *elem,
++                                      const uint8_t *beg, const uint8_t *end,
+                                    size_t lvl)
+ {
+-  unsigned char b;
++  uint8_t b;
+   size_t len;
+   struct Curl_asn1Element lelem;
+ 
+@@ -185,7 +187,7 @@ static const char *getASN1Element_(struct Curl_asn1Element *elem,
+ 
+   /* Process header byte. */
+   elem->header = beg;
+-  b = (unsigned char)*beg++;
++  b = *beg++;
+   elem->constructed = (b & 0x20) != 0;
+   elem->eclass = (b >> 6) & 3;
+   b &= 0x1F;
+@@ -196,7 +198,7 @@ static const char *getASN1Element_(struct Curl_asn1Element *elem,
+   /* Process length. */
+   if(beg >= end)
+     return NULL;
+-  b = (unsigned char)*beg++;
++  b = *beg++;
+   if(!(b & 0x80))
+     len = b;
+   else if(!(b &= 0x7F)) {
+@@ -215,7 +217,7 @@ static const char *getASN1Element_(struct Curl_asn1Element *elem,
+     elem->end = beg;
+     return beg + 1;
+   }
+-  else if((unsigned)b > (size_t)(end - beg))
++  else if(b > (size_t)(end - beg))
+     return NULL; /* Does not fit in source. */
+   else {
+     /* Get long length. */
+@@ -223,7 +225,7 @@ static const char *getASN1Element_(struct Curl_asn1Element *elem,
+     do {
+       if(len & 0xFF000000L)
+         return NULL;  /* Lengths > 32 bits are not supported. */
+-      len = (len << 8) | (unsigned char) *beg++;
++      len = (len << 8) | *beg++;
+     } while(--b);
+   }
+   if(len > (size_t)(end - beg))
+@@ -233,8 +235,11 @@ static const char *getASN1Element_(struct Curl_asn1Element *elem,
+   return elem->end;
+ }
+ 
+-static const char *getASN1Element(struct Curl_asn1Element *elem,
+-                                  const char *beg, const char *end)
++/*
++ * @unittest 1657
++ */
++UNITTEST const uint8_t *getASN1Element(struct Curl_asn1Element *elem,
++                                       const uint8_t *beg, const uint8_t *end)
+ {
+   return getASN1Element_(elem, beg, end, 0);
+ }
+@@ -255,17 +260,6 @@ static const struct Curl_OID *searchOID(const char *oid)
+   return NULL;
+ }
+ 
+-#ifdef UNITTESTS
+-/* used by unit1657.c */
+-CURLcode Curl_x509_getASN1Element(struct Curl_asn1Element *elem,
+-                                  const char *beg, const char *end)
+-{
+-  if(getASN1Element(elem, beg, end))
+-    return CURLE_OK;
+-  return CURLE_BAD_FUNCTION_ARGUMENT;
+-}
+-#endif
+-
+ /*
+  * Convert an ASN.1 Boolean value into its string representation.
+  *
+@@ -273,7 +267,7 @@ CURLcode Curl_x509_getASN1Element(struct Curl_asn1Element *elem,
+  */
+ 
+ static CURLcode bool2str(struct dynbuf *store,
+-                         const char *beg, const char *end)
++                         const uint8_t *beg, const uint8_t *end)
+ {
+   if(end - beg != 1)
+     return CURLE_BAD_FUNCTION_ARGUMENT;
+@@ -286,17 +280,18 @@ static CURLcode bool2str(struct dynbuf *store,
+  * Return error code.
+  */
+ static CURLcode octet2str(struct dynbuf *store,
+-                          const char *beg, const char *end)
++                          const uint8_t *beg, const uint8_t *end)
+ {
+   CURLcode result = CURLE_OK;
+ 
+   while(!result && beg < end)
+-    result = curlx_dyn_addf(store, "%02x:", (unsigned char)*beg++);
++    result = curlx_dyn_addf(store, "%02x:", *beg++);
+ 
+   return result;
+ }
+ 
+-static CURLcode bit2str(struct dynbuf *store, const char *beg, const char *end)
++static CURLcode bit2str(struct dynbuf *store,
++                        const uint8_t *beg, const uint8_t *end)
+ {
+   /* Convert an ASN.1 bit string to a printable string. */
+ 
+@@ -310,7 +305,8 @@ static CURLcode bit2str(struct dynbuf *store, const char *beg, const char *end)
+  *
+  * Returns error.
+  */
+-static CURLcode int2str(struct dynbuf *store, const char *beg, const char *end)
++static CURLcode int2str(struct dynbuf *store,
++                        const uint8_t *beg, const uint8_t *end)
+ {
+   unsigned int val = 0;
+   size_t n = end - beg;
+@@ -326,7 +322,7 @@ static CURLcode int2str(struct dynbuf *store, const char *beg, const char *end)
+     val = ~val;
+ 
+   do
+-    val = (val << 8) | *(const unsigned char *)beg++;
++    val = (val << 8) | *beg++;
+   while(beg < end);
+   return curlx_dyn_addf(store, "%s%x", val >= 10 ? "0x" : "", val);
+ }
+@@ -339,8 +335,8 @@ static CURLcode int2str(struct dynbuf *store, const char *beg, const char *end)
+  *
+  * Returns error.
+  */
+-static CURLcode utf8asn1str(struct dynbuf *to, int type, const char *from,
+-                            const char *end)
++static CURLcode utf8asn1str(struct dynbuf *to, int type,
++                            const uint8_t *from, const uint8_t *end)
+ {
+   size_t inlength = end - from;
+   int size = 1;
+@@ -381,14 +377,14 @@ static CURLcode utf8asn1str(struct dynbuf *to, int type, const char *from,
+ 
+       switch(size) {
+       case 4:
+-        wc = (wc << 8) | *(const unsigned char *)from++;
+-        wc = (wc << 8) | *(const unsigned char *)from++;
++        wc = (wc << 8) | *from++;
++        wc = (wc << 8) | *from++;
+         FALLTHROUGH();
+       case 2:
+-        wc = (wc << 8) | *(const unsigned char *)from++;
++        wc = (wc << 8) | *from++;
+         FALLTHROUGH();
+       default: /* case 1: */
+-        wc = (wc << 8) | *(const unsigned char *)from++;
++        wc = (wc << 8) | *from++;
+       }
+       if(wc >= 0x00000080) {
+         if(wc >= 0x00000800) {
+@@ -422,14 +418,14 @@ static CURLcode utf8asn1str(struct dynbuf *to, int type, const char *from,
+  * Return error code.
+  */
+ static CURLcode encodeOID(struct dynbuf *store,
+-                          const char *beg, const char *end)
++                          const uint8_t *beg, const uint8_t *end)
+ {
+   unsigned int x;
+   unsigned int y;
+   CURLcode result = CURLE_OK;
+ 
+   /* Process the first two numbers. */
+-  y = *(const unsigned char *)beg++;
++  y = *beg++;
+   x = y / 40;
+   y -= x * 40;
+ 
+@@ -445,7 +441,7 @@ static CURLcode encodeOID(struct dynbuf *store,
+         return CURLE_OK;
+       else if(beg == end)
+         return CURLE_BAD_FUNCTION_ARGUMENT;
+-      y = *(const unsigned char *)beg++;
++      y = *beg++;
+       x = (x << 7) | (y & 0x7F);
+     } while(y & 0x80);
+     result = curlx_dyn_addf(store, ".%u", x);
+@@ -460,7 +456,7 @@ static CURLcode encodeOID(struct dynbuf *store,
+  */
+ 
+ static CURLcode OID2str(struct dynbuf *store,
+-                        const char *beg, const char *end, bool symbolic)
++                        const uint8_t *beg, const uint8_t *end, bool symbolic)
+ {
+   CURLcode result = CURLE_OK;
+   if(beg < end) {
+@@ -650,10 +646,12 @@ static CURLcode ASN1tostr(struct dynbuf *store,
+     result = OID2str(store, elem->beg, elem->end, TRUE);
+     break;
+   case CURL_ASN1_UTC_TIME:
+-    result = UTime2str(store, elem->beg, elem->end);
++    result = UTime2str(store, (const char *)elem->beg,
++                       (const char *)elem->end);
+     break;
+   case CURL_ASN1_GENERALIZED_TIME:
+-    result = GTime2str(store, elem->beg, elem->end);
++    result = GTime2str(store, (const char *)elem->beg,
++                       (const char *)elem->end);
+     break;
+   case CURL_ASN1_UTF8_STRING:
+   case CURL_ASN1_NUMERIC_STRING:
+@@ -681,10 +679,10 @@ static CURLcode encodeDN(struct dynbuf *store, struct Curl_asn1Element *dn)
+   struct Curl_asn1Element atv;
+   struct Curl_asn1Element oid;
+   struct Curl_asn1Element value;
+-  const char *p1;
+-  const char *p2;
+-  const char *p3;
+-  const char *str;
++  const uint8_t *p1;
++  const uint8_t *p2;
++  const uint8_t *p3;
++  const uint8_t *str;
+   CURLcode result = CURLE_OK;
+   bool added = FALSE;
+   struct dynbuf temp;
+@@ -716,7 +714,7 @@ static CURLcode encodeDN(struct dynbuf *store, struct Curl_asn1Element *dn)
+       if(result)
+         goto error;
+ 
+-      str = curlx_dyn_ptr(&temp);
++      str = curlx_dyn_uptr(&temp);
+ 
+       if(!str) {
+         result = CURLE_BAD_FUNCTION_ARGUMENT;
+@@ -737,7 +735,7 @@ static CURLcode encodeDN(struct dynbuf *store, struct Curl_asn1Element *dn)
+       }
+ 
+       /* Encode attribute name. */
+-      result = curlx_dyn_add(store, str);
++      result = curlx_dyn_add(store, (const char *)str);
+       if(result)
+         goto error;
+ 
+@@ -769,13 +767,14 @@ error:
+  * See RFC 5280.
+  */
+ int Curl_parseX509(struct Curl_X509certificate *cert,
+-                   const char *beg, const char *end)
++                   const uint8_t *beg, const uint8_t *end)
+ {
+   struct Curl_asn1Element elem;
+   struct Curl_asn1Element tbsCertificate;
+-  const char *ccp;
+-  static const char defaultVersion = 0;  /* v1. */
++  const uint8_t *ccp;
++  static const uint8_t defaultVersion = 0;  /* v1. */
+ 
++  memset(cert, 0, sizeof(*cert));
+   cert->certificate.header = NULL;
+   cert->certificate.beg = beg;
+   cert->certificate.end = end;
+@@ -831,6 +830,9 @@ int Curl_parseX509(struct Curl_X509certificate *cert,
+     return -1;
+   if(!getASN1Element(&cert->notAfter, ccp, elem.end))
+     return -1;
++  /* These two fields MUST consume all of the validity elem */
++  if(elem.end != cert->notAfter.end)
++    return -1;
+   /* Get subject. */
+   beg = getASN1Element(&cert->subject, beg, end);
+   if(!beg)
+@@ -851,10 +853,10 @@ int Curl_parseX509(struct Curl_X509certificate *cert,
+   cert->issuerUniqueID.tag = cert->subjectUniqueID.tag = 0;
+   cert->extensions.tag = elem.tag = 0;
+   cert->issuerUniqueID.header = cert->subjectUniqueID.header = NULL;
+-  cert->issuerUniqueID.beg = cert->issuerUniqueID.end = "";
+-  cert->subjectUniqueID.beg = cert->subjectUniqueID.end = "";
++  cert->issuerUniqueID.beg = cert->issuerUniqueID.end = beg;
++  cert->subjectUniqueID.beg = cert->subjectUniqueID.end = beg;
+   cert->extensions.header = NULL;
+-  cert->extensions.beg = cert->extensions.end = "";
++  cert->extensions.beg = cert->extensions.end = beg;
+   if(beg < end) {
+     beg = getASN1Element(&elem, beg, end);
+     if(!beg)
+@@ -888,7 +890,7 @@ int Curl_parseX509(struct Curl_X509certificate *cert,
+ 
+ static CURLcode dumpAlgo(struct dynbuf *store,
+                          struct Curl_asn1Element *param,
+-                         const char *beg, const char *end)
++                         const uint8_t *beg, const uint8_t *end)
+ {
+   struct Curl_asn1Element oid;
+ 
+@@ -901,7 +903,7 @@ static CURLcode dumpAlgo(struct dynbuf *store,
+   param->tag = 0;
+   param->beg = param->end = end;
+   if(beg < end) {
+-    const char *p = getASN1Element(param, beg, end);
++    const uint8_t *p = getASN1Element(param, beg, end);
+     if(!p)
+       return CURLE_BAD_FUNCTION_ARGUMENT;
+   }
+@@ -972,7 +974,7 @@ static int do_pubkey(struct Curl_easy *data, int certnum, const char *algo,
+ {
+   struct Curl_asn1Element elem;
+   struct Curl_asn1Element pk;
+-  const char *p;
++  const uint8_t *p;
+ 
+   /* Generate all information records for the public key. */
+ 
+@@ -1004,7 +1006,7 @@ static int do_pubkey(struct Curl_easy *data, int certnum, const char *algo,
+     return 1;
+ 
+   if(curl_strequal(algo, "rsaEncryption")) {
+-    const char *q;
++    const uint8_t *q;
+     size_t len;
+ 
+     p = getASN1Element(&elem, pk.beg, pk.end);
+@@ -1017,7 +1019,7 @@ static int do_pubkey(struct Curl_easy *data, int certnum, const char *algo,
+     len = ((elem.end - q) * 8);
+     if(len) {
+       unsigned int i;
+-      for(i = *(const unsigned char *)q; !(i & 0x80); i <<= 1)
++      for(i = *q; !(i & 0x80); i <<= 1)
+         len--;
+     }
+     if(len > 32)
+@@ -1083,8 +1085,8 @@ static CURLcode DNtostr(struct dynbuf *store, struct Curl_asn1Element *dn)
+ 
+ CURLcode Curl_extract_certinfo(struct Curl_easy *data,
+                                int certnum,
+-                               const char *beg,
+-                               const char *end)
++                               const uint8_t *beg,
++                               const uint8_t *end)
+ {
+   struct Curl_X509certificate cert;
+   struct Curl_asn1Element param;
+@@ -1093,7 +1095,7 @@ CURLcode Curl_extract_certinfo(struct Curl_easy *data,
+   struct dynbuf out;
+   CURLcode result = CURLE_OK;
+   unsigned int version;
+-  const char *ptr;
++  const uint8_t *ptr;
+   int rc;
+ 
+   if(!data->set.ssl.certinfo)
+@@ -1132,7 +1134,7 @@ CURLcode Curl_extract_certinfo(struct Curl_easy *data,
+   /* Version (always fits in less than 32 bits). */
+   version = 0;
+   for(ptr = cert.version.beg; ptr < cert.version.end; ptr++)
+-    version = (version << 8) | *(const unsigned char *)ptr;
++    version = (version << 8) | *ptr;
+   if(data->set.ssl.certinfo) {
+     result = curlx_dyn_addf(&out, "%x", version);
+     if(result)
+diff --git a/lib/vtls/x509asn1.h b/lib/vtls/x509asn1.h
+index 829dfd884f..e5374108e5 100644
+--- a/lib/vtls/x509asn1.h
++++ b/lib/vtls/x509asn1.h
+@@ -38,11 +38,11 @@
+ 
+ /* ASN.1 parsed element. */
+ struct Curl_asn1Element {
+-  const char *header;         /* Pointer to header byte. */
+-  const char *beg;            /* Pointer to element data. */
+-  const char *end;            /* Pointer to 1st byte after element. */
+-  unsigned char eclass;       /* ASN.1 element class. */
+-  unsigned char tag;          /* ASN.1 element tag. */
++  const uint8_t *header;      /* Pointer to header byte. */
++  const uint8_t *beg;         /* Pointer to element data. */
++  const uint8_t *end;         /* Pointer to 1st byte after element. */
++  uint8_t eclass;             /* ASN.1 element class. */
++  uint8_t tag;                /* ASN.1 element tag. */
+   BIT(constructed);           /* Element is constructed. */
+ };
+ 
+@@ -70,22 +70,22 @@ struct Curl_X509certificate {
+  */
+ 
+ int Curl_parseX509(struct Curl_X509certificate *cert,
+-                   const char *beg, const char *end);
++                   const uint8_t *beg, const uint8_t *end);
+ CURLcode Curl_extract_certinfo(struct Curl_easy *data, int certnum,
+-                               const char *beg, const char *end);
++                               const uint8_t *beg, const uint8_t *end);
+ CURLcode Curl_verifyhost(struct Curl_cfilter *cf, struct Curl_easy *data,
+-                         const char *beg, const char *end);
++                         const uint8_t *beg, const uint8_t *end);
+ 
+ #ifdef UNITTESTS
++const uint8_t *getASN1Element(struct Curl_asn1Element *elem,
++                              const uint8_t *beg, const uint8_t *end)
++  WARN_UNUSED_RESULT;
+ #if defined(USE_GNUTLS) || defined(USE_SCHANNEL) || defined(USE_MBEDTLS) || \
+   defined(USE_RUSTLS)
+ 
+ /* used by unit1656.c */
+ CURLcode Curl_x509_GTime2str(struct dynbuf *store,
+                              const char *beg, const char *end);
+-/* used by unit1657.c */
+-CURLcode Curl_x509_getASN1Element(struct Curl_asn1Element *elem,
+-                                  const char *beg, const char *end);
+ #endif /* USE_GNUTLS || USE_SCHANNEL || USE_MBEDTLS || RUSTLS */
+ #endif /* UNITTESTS */
+ 
+diff --git a/tests/unit/unit1651.c b/tests/unit/unit1651.c
+index 10fc979724..ce8cbaedc5 100644
+--- a/tests/unit/unit1651.c
++++ b/tests/unit/unit1651.c
+@@ -33,7 +33,7 @@ static CURLcode test_unit1651(const char *arg)
+ 
+   /* cert captured from gdb when connecting to curl.se on October 26
+      2018. */
+-  static unsigned char cert[] = {
++  static uint8_t cert[] = {
+     0x30, 0x82, 0x0F, 0x5B, 0x30, 0x82, 0x0E, 0x43, 0xA0, 0x03, 0x02, 0x01,
+     0x02, 0x02, 0x0C, 0x08, 0x77, 0x99, 0x2C, 0x6B, 0x67, 0xE1, 0x18, 0xD6,
+     0x66, 0x66, 0x9E, 0x30, 0x0D, 0x06, 0x09, 0x2A, 0x86, 0x48, 0x86, 0xF7,
+@@ -365,8 +365,8 @@ static CURLcode test_unit1651(const char *arg)
+   };
+ 
+   CURLcode result;
+-  const char *beg = (const char *)&cert[0];
+-  const char *end = (const char *)&cert[sizeof(cert)];
++  const uint8_t *beg = &cert[0];
++  const uint8_t *end = &cert[sizeof(cert)];
+   struct Curl_easy *data;
+   int i;
+   int byte;
+diff --git a/tests/unit/unit1657.c b/tests/unit/unit1657.c
+index 7c769e78da..716df1856c 100644
+--- a/tests/unit/unit1657.c
++++ b/tests/unit/unit1657.c
+@@ -23,7 +23,8 @@
+  ***************************************************************************/
+ #include "unitcheck.h"
+ 
+-#if defined(USE_GNUTLS) || defined(USE_SCHANNEL) || defined(USE_MBEDTLS)
++#if defined(USE_GNUTLS) || defined(USE_WOLFSSL) || defined(USE_SCHANNEL) || \
++  defined(USE_MBEDTLS) || defined(USE_RUSTLS)
+ 
+ #include "vtls/x509asn1.h"
+ 
+@@ -38,8 +39,8 @@ static CURLcode make1657_nested(const struct test1657_spec *spec,
+ {
+   CURLcode result;
+   size_t i;
+-  unsigned char open_undef[] = { 0x32, 0x80 };
+-  unsigned char close_undef[] = { 0x00, 0x00 };
++  uint8_t open_undef[] = { 0x32, 0x80 };
++  uint8_t close_undef[] = { 0x00, 0x00 };
+ 
+   for(i = 0; i < spec->n; ++i) {
+     result = curlx_dyn_addn(buf, open_undef, sizeof(open_undef));
+@@ -66,7 +67,8 @@ static bool do_test1657(const struct test1657_spec *spec, size_t i,
+ {
+   CURLcode result;
+   struct Curl_asn1Element elem;
+-  const char *in;
++  const uint8_t *in;
++  const uint8_t *ptr;
+ 
+   memset(&elem, 0, sizeof(elem));
+   curlx_dyn_reset(buf);
+@@ -75,8 +77,9 @@ static bool do_test1657(const struct test1657_spec *spec, size_t i,
+     curl_mfprintf(stderr, "test %zu: error setting buf %d\n", i, result);
+     return FALSE;
+   }
+-  in = curlx_dyn_ptr(buf);
+-  result = Curl_x509_getASN1Element(&elem, in, in + curlx_dyn_len(buf));
++  in = curlx_dyn_uptr(buf);
++  ptr = getASN1Element(&elem, in, in + curlx_dyn_len(buf));
++  result = ptr ? CURLE_OK : CURLE_BAD_FUNCTION_ARGUMENT;
+   if(result != spec->result_exp) {
+     curl_mfprintf(stderr, "test %zu: expect result %d, got %d\n",
+                   i, spec->result_exp, result);
+@@ -85,6 +88,59 @@ static bool do_test1657(const struct test1657_spec *spec, size_t i,
+   return TRUE;
+ }
+ 
++struct test1657_cert_spec {
++  const char * const pem;
++  bool exp_success;
++};
++
++static const struct test1657_cert_spec test1657_certs[] = {
++  { /* a valid certificate */
++    "MIIBGTCBzKADAgECAhQ8Ssn8BaVsqlKKccv81NFuKY1vATAFBgMrZXAwADAeFw0y"
++    "NjA5MDIwNDU0MjZaFw0yNjEwMDIwNDU0MjZaMAAwKjAFBgMrZXADIQBeG0S343s9"
++    "5yRmIK8xZmGvUmiiYvRH5ZMcPq6rvHHKwqNYMFYwNQYDKgMEBC4wADAqMAUGAytl"
++    "cAMhAPP5TXSe2WHt/bebbP8eHPXrG3LNxYz8TnHNgpwTFsT7MB0GA1UdDgQWBBR6"
++    "aqL9LrZiIpgYCy0X4fNrhgFQsTAFBgMrZXADQQALU0OHGcIvfTwyin/+u9csJ9hZ"
++    "W0c+XdHJY5uDdCR1O92K4Vnozf/QCe7ITOJ8aUnCs7Jgf5xrDgyXZNdum04A",
++    TRUE
++  },
++  { /* a certificate with "validity" element that has too long length */
++    "MIIBGTCBzKADAgECAhQ8Ssn8BaVsqlKKccv81NFuKY1vATAFBgMrZXAwADBZFw0y"
++    "NjA5MDIwNDU0MjZaFw0yNjEwMDIwNDU0MjZaMAAwKjAFBgMrZXADIQBeG0S343s9"
++    "5yRmIK8xZmGvUmiiYvRH5ZMcPq6rvHHKwqNYMFYwNQYDKgMEBC4wADAqMAUGAytl"
++    "cAMhAPP5TXSe2WHt/bebbP8eHPXrG3LNxYz8TnHNgpwTFsT7MB0GA1UdDgQWBBR6"
++    "aqL9LrZiIpgYCy0X4fNrhgFQsTAFBgMrZXADQQALU0OHGcIvfTwyin/+u9csJ9hZ"
++    "W0c+XdHJY5uDdCR1O92K4Vnozf/QCe7ITOJ8aUnCs7Jgf5xrDgyXZNdum04A",
++    FALSE
++  }
++};
++
++static bool test1657_parse_cert(size_t i,
++                                const struct test1657_cert_spec *spec)
++{
++  struct Curl_X509certificate cert;
++  CURLcode result;
++  uint8_t *cert_der;
++  size_t cert_der_len;
++  bool success;
++
++  result = curlx_base64_decode(spec->pem, &cert_der, &cert_der_len);
++  if(result) {
++    curl_mfprintf(stderr, "cert %zu: base64 decoding failed: %d\n",
++                  i, (int)result);
++    return FALSE;
++  }
++
++  success = !Curl_parseX509(&cert, cert_der, cert_der +  cert_der_len);
++  if(success != spec->exp_success) {
++    curl_mfprintf(stderr, "cert %zu: parsing DER %sfailed\n", i,
++                  spec->exp_success ? "" : "should have ");
++    return FALSE;
++  }
++
++  curlx_free(cert_der);
++  return TRUE;
++}
++
+ static CURLcode test_unit1657(const char *arg)
+ {
+   UNITTEST_BEGIN_SIMPLE
+@@ -104,7 +160,14 @@ static CURLcode test_unit1657(const char *arg)
+     if(!do_test1657(&test1657_specs[i], i, &dbuf))
+       all_ok = FALSE;
+   }
+-  fail_unless(all_ok, "some tests of Curl_x509_getASN1Element() fails");
++  fail_unless(all_ok, "some getASN1Element() tests failed");
++
++  all_ok = TRUE;
++  for(i = 0; i < CURL_ARRAYSIZE(test1657_certs); ++i) {
++    if(!test1657_parse_cert(i, &test1657_certs[i]))
++      all_ok = FALSE;
++  }
++  fail_unless(all_ok, "some certificate tests failed");
+ 
+   curlx_dyn_free(&dbuf);
+   curl_global_cleanup();
+@@ -117,7 +180,7 @@ static CURLcode test_unit1657(const char *arg)
+ static CURLcode test_unit1657(const char *arg)
+ {
+   UNITTEST_BEGIN_SIMPLE
+-  puts("not tested since Curl_x509_getASN1Element() is not built in");
++  puts("not tested since getASN1Element() is not built in");
+   UNITTEST_END_SIMPLE
+ }
+ 
+-- 
+2.35.6
diff --git a/meta/recipes-support/curl/curl_8.19.0.bb b/meta/recipes-support/curl/curl_8.19.0.bb
index 026b5a3638..51479d8b6a 100644
--- a/meta/recipes-support/curl/curl_8.19.0.bb
+++ b/meta/recipes-support/curl/curl_8.19.0.bb
@@ -71,6 +71,7 @@ SRC_URI = "https://curl.se/download/${BP}.tar.xz \
            file://CVE-2026-94266_p1.patch \
            file://CVE-2026-94266_p2.patch \
            file://CVE-2026-107929.patch \
+           file://CVE-2026-87866.patch \
            "
 
 SRC_URI:append:class-nativesdk = " \
-- 
2.35.6
