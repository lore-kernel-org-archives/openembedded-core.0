Received: from aer-iport-4.cisco.com (aer-iport-4.cisco.com [173.38.203.54])
 by mx.groups.io with SMTP id smtpd.msgproc01-g2.2328.1795165286702139252
 for <openembedded-core@lists.openembedded.org>;
 Fri, 20 Nov 2026 01:01:27 -0800
Authentication-Results: mx.groups.io;
 dkim=fail reason="dkim: message contains an insecure body length tag" header.i=@cisco.com header.s=iport01 header.b=dJhM6NKi;
 spf=pass (domain: cisco.com, ip: 173.38.203.54, mailfrom: devanshp@cisco.com)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
  d=cisco.com; i=@cisco.com; l=21425; q=dns/txt;
  s=iport01; t=1795165287; x=1796374887;
  h=from:to:subject:date:message-id:mime-version:
   content-transfer-encoding;
  bh=yO+MkQkmr9XM+aY57XqNM6px63PXCIQx9fZ8VPTn+Dc=;
  b=dJhM6NKiWCjg5k4zYdugK4PSPF3rDuUgzhmeWkjG7dz5GM2yq4Su1pwp
   NCGNxek3q0RDl6AI03305EBF2yJBFcH3uHgb7kW62LBIuxcCqlYHGNLT/
   vvuAVs7eM+l5Bm59avo/xPToWxZ69JVj4ADLj482OeVqIP0fnxHBjTYyl
   +An6EZELpvnGnshncKrIdCkifxjjXqmcMfITHfjHgmbHdXiMDg6BWLUjY
   O9cNr5KY7vjug5YtxejU7y0qt7goLvuzA2VTIa8gHuktWbn4SST9yAWs+
   EBmn5CHN1Xpkg9Yxi0IMcC/T4c328mnzM8SsEFw77v8yH0rDvwofQP/7Z
   g==;
X-CSE-ConnectionGUID: zHdB98M3RMaYucboaR35qQ==
X-CSE-MsgGUID: V8zZW+dYRo24u6oX67+Vfg==
X-IPAS-Result: =?us-ascii?q?A0CvAgCvCwBr/85K/pBaglmCV3VgQ0mUKoIhi2mSQ4F+D?=
 =?us-ascii?q?wEBAQ9EDQQBAYQ/jmkCJjQJDgECBAMCAwEBAQEBAQEBAQEBAQoBAQUBAQECA?=
 =?us-ascii?q?QcFgQ4Thk8NkBIBIA0LAXIDAQJPCyMhgwIBgjoDNwMRuHOBeTOBAYNpAkNQ2?=
 =?us-ascii?q?EwNgloBCxQBgTiFQoMAhSRdGAGEfScbG4FyhAl2gQWBGkIBAYgmBIIigQyBV?=
 =?us-ascii?q?I0XAoFPiCZIgR4DWSwBVRMNCgsHBYFoAzUSKhVuMh2BIzsXgQcbBgWBHIEeg?=
 =?us-ascii?q?RKBA12BKyheIYEIgXYCglGCAAIBSUEOB0VTCSVDEkckIggSCQETGiwKgRo1P?=
 =?us-ascii?q?AkmPxUMZwsaBWEIAg0MdDkQMB4kLwUaJj4bCoEMJx8eGw4CHxAGDRgNSBEsN?=
 =?us-ascii?q?xUZBD5uB5NsgnkZBxYbShMBKxeBAWUKARGTUpI2oCBxCiiDeYwkjz6FfBozh?=
 =?us-ascii?q?ASBV5JDklQLmH2LN4JThAqRek2EaoFoPDmBDgsHcBWDIglKGQ+OLgsLg2CBf?=
 =?us-ascii?q?8xcJjILMgEBBwIHDgMLgWiRfgEB?=
IronPort-Data: A9a23:hAubm6sOUIH7UWW88vg/3zTZh+fnVAJfMUV32f8akzHdYApBsoF/q
 tZmKWrVbPffMzOkeIonb4+zo0sDvMeBzoNhGQs9rnsyESoVgMeUXt7xwmUckM+xwmwvaGo9s
 q3yv/GZdJhcokf0/0nrb/656ykmiMlkf5KkYMbcICd9WAR4fykojBNnioYRj5Vh6TSDK1vlV
 eja/YuFZzdJ5xYuajhKsvvZ8Eo21BjPkGpwUmIWNKgjUGD2zxH5PLpHTYmtIn3xRJVjH+LSb
 47r0LGj82rFyAwmA9Wjn6yTWhVirmn6ZFXmZtJ+AsBOszAazsAA+v9T2Mk0NS+7vw60c+VZk
 72hg3AfpTABZcUgkMxFO/VR/roX0aduoNcrKlDn2SCfItGvn3bEm51T4E8K0YIw6MZ7KzAe0
 KciDTk8cxuJgOuMm++ic7w57igjBJGD0II3s3x6iDWcBvE8TNWbHuPB5MRT23E7gcUm8fT2P
 pZFL2AyMFKfP1sVYgl/5JEWxI9EglHzfiNRrkmVvYI84nPYy0p6172F3N/9JIbTGZ4IxxvwS
 mTuwTTrMC5ZOO2lzmDZ7yyrtrGQ3h31V9dHfFG/3rsw6LGJ/UQUEBAQWF6xrPW1h0L7UNVFJ
 mQQ+zEytu417EGtQ9z3UhG0rXLCuQQTM+e8CMUz5RvIzu/f5ByUQzBZCDVAc9ch8sQxQFTGy
 2O0oj8gPhQ32JX9dJ5X3u78Qe+aUcTNEVI/WA==
IronPort-HdrOrdr: A9a23:Z11mFK/M5LE0P6Weq6Fuk+DoI+orL9Y04lQ7vn2ZLiYlEPBw+P
 rBoB1273LJYVUqKRIdcK67WZVoKEm0nfUe3WB7B9iftWfd1FdAVLsD0aLShxv9Bib56ulRkY
 1kc6R4FZnMKGISt7ee3OF9eOxQp+VuN8uT9IPj80s=
X-Talos-CUID: =?us-ascii?q?9a23=3AWsEFkmiFMQCXqWcyIbH4COER0zJuYF3R5iaABhS?=
 =?us-ascii?q?CLG9YVbafTlaqo/59qp87?=
X-Talos-MUID: 9a23:mohImwVv/nTB1Zrq/AG8lgNdd8tZ2aP0VF1TlqVY5Iq6OyMlbg==
X-IronPort-Anti-Spam-Filtered: true
X-IronPort-AV: E=Sophos;i="6.27,222,1787011200"; 
   d="scan'208";a="62143515"
Received: from aer-l-core-05.cisco.com ([144.254.74.206])
  by aer-iport-4.cisco.com with ESMTP/TLS/TLS_AES_256_GCM_SHA384; 20 Nov 2026 09:01:24 +0000
Received: from sjc-ads-4935.cisco.com (sjc-ads-4935.cisco.com [10.28.39.199])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256
	 client-signature RSA-PSS (4096 bits) client-digest SHA256)
	(Client CN "ciscoit-managed-infra-smtp-auth.cisco.com", Issuer "Internal Private TLS SubCA" (verified OK))
	by aer-l-core-05.cisco.com (Postfix) with ESMTPS id 19D201800021A
	for <openembedded-core@lists.openembedded.org>; Fri, 20 Nov 2026 09:01:24 +0000 (GMT)
Received: by sjc-ads-4935.cisco.com (Postfix, from userid 1887503)
	id C3871CC2EF3; Fri, 20 Nov 2026 01:01:22 -0800 (PST)
From: "Devansh Patel -X (devanshp - E INFOCHIPS PRIVATE LIMITED at Cisco)" <devanshp@cisco.com>
To: openembedded-core@lists.openembedded.org
Subject: [OE-core][scarthgap][PATCH] ovmf: Fix CVE-2026-111497
Date: Fri, 20 Nov 2026 01:01:22 -0800
Message-Id: <20261120090122.945548-1-devanshp@cisco.com>
X-Mailer: git-send-email 2.35.6
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Outbound-Client-TLS: VERIFIED;sjc-ads-4935.cisco.com [10.28.39.199];TLSv1.3;TLS_AES_256_GCM_SHA384;256;ciscoit-managed-infra-smtp-auth.cisco.com
X-Outbound-SMTP-Client: 10.28.39.199, sjc-ads-4935.cisco.com
X-Outbound-Node: aer-l-core-05.cisco.com
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by lin-tor-korg-lkml-alma10-1 with HTTPS for <openembedded-core@lists.openembedded.org>; Fri, 20 Nov 2026 09:01:29 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/250751
Content-Type: text/plain; charset="utf-8"

From: Devansh Patel <devanshp@cisco.com>

This patch applies the upstream v1.0 decoder backport for
CVE-2026-111497. The upstream fix commit is referenced in [1],
and the public CVE advisory is referenced in [2].

Fix both embedded Brotli copies. BaseTools BrotliCompress builds the
affected decoder and exposes decompression through its -d option.
Retain the existing EDK II and Brotli revisions and their integration
changes while adding the complete decoder and public-header fix.

Resolve the older header context by retaining its compound-dictionary
error code and inserting the upstream block-switch error declaration.
The decoder source changes are identical to the upstream fix.

[1] https://github.com/google/brotli/commit/50a9b70a4d5e1443fc40927952276b68fffa83a0
[2] https://nvd.nist.gov/vuln/detail/CVE-2026-111497

Signed-off-by: Devansh Patel <devanshp@cisco.com>
---
 .../ovmf/ovmf/CVE-2026-111497_p1.patch        | 243 ++++++++++++++++++
 .../ovmf/ovmf/CVE-2026-111497_p2.patch        | 243 ++++++++++++++++++
 meta/recipes-core/ovmf/ovmf_git.bb            |   2 +
 3 files changed, 488 insertions(+)
 create mode 100644 meta/recipes-core/ovmf/ovmf/CVE-2026-111497_p1.patch
 create mode 100644 meta/recipes-core/ovmf/ovmf/CVE-2026-111497_p2.patch

diff --git a/meta/recipes-core/ovmf/ovmf/CVE-2026-111497_p1.patch b/meta/recipes-core/ovmf/ovmf/CVE-2026-111497_p1.patch
new file mode 100644
index 0000000000..53fefb110b
--- /dev/null
+++ b/meta/recipes-core/ovmf/ovmf/CVE-2026-111497_p1.patch
@@ -0,0 +1,243 @@
+From 64c4d6b60010a49f20f8c98309fdb133d6b7a0e8 Mon Sep 17 00:00:00 2001
+From: Evgenii Kliuchnikov <eustas.ru@gmail.com>
+Date: Wed, 21 Oct 2026 11:25:30 +0000
+Subject: [PATCH] Detect and report invalid stream earlier.
+
+PiperOrigin-RevId: 876198329
+
+CVE: CVE-2026-111497
+Upstream-Status: Backport [https://github.com/google/brotli/commit/50a9b70a4d5e1443fc40927952276b68fffa83a0]
+
+Backport Changes:
+- The original header hunk fails against the EDK II dictionary API.
+  Retain its COMPOUND_DICTIONARY error (-18), insert the unchanged
+  upstream BLOCK_SWITCH error (-17), and remove the stale -17 reservation.
+  Omit the upstream comment reserving -18, which this target already uses.
+
+(cherry picked from commit 0ed4268a4401abcb4472096340477cf4af7d1a2b
+Signed-off-by: Devansh Patel <devanshp@cisco.com>
+---
+ c/dec/decode.c            | 87 +++++++++++++++++++++++++--------------
+ c/include/brotli/decode.h |  2 +-
+ 2 files changed, 58 insertions(+), 31 deletions(-)
+
+diff --git a/c/dec/decode.c b/c/dec/decode.c
+index 2fe58a7..359e416 100644
+--- a/c/dec/decode.c
++++ b/c/dec/decode.c
+@@ -1118,7 +1118,7 @@ static BrotliDecoderErrorCode DecodeContextMap(uint32_t context_map_size,
+ 
+ /* Decodes a command or literal and updates block type ring-buffer.
+    Reads 3..54 bits. */
+-static BROTLI_INLINE BROTLI_BOOL DecodeBlockTypeAndLength(
++static BROTLI_INLINE BrotliDecoderErrorCode DecodeBlockTypeAndLength(
+     int safe, BrotliDecoderState* s, int tree_type) {
+   uint32_t max_block_type = s->num_block_types[tree_type];
+   const HuffmanCode* type_tree = &s->block_type_trees[
+@@ -1129,7 +1129,7 @@ static BROTLI_INLINE BROTLI_BOOL DecodeBlockTypeAndLength(
+   uint32_t* ringbuffer = &s->block_type_rb[tree_type * 2];
+   uint32_t block_type;
+   if (max_block_type <= 1) {
+-    return BROTLI_FALSE;
++    return BROTLI_DECODER_ERROR_FORMAT_BLOCK_SWITCH;
+   }
+ 
+   /* Read 0..15 + 3..39 bits. */
+@@ -1139,11 +1139,13 @@ static BROTLI_INLINE BROTLI_BOOL DecodeBlockTypeAndLength(
+   } else {
+     BrotliBitReaderState memento;
+     BrotliBitReaderSaveState(br, &memento);
+-    if (!SafeReadSymbol(type_tree, br, &block_type)) return BROTLI_FALSE;
++    if (!SafeReadSymbol(type_tree, br, &block_type)) {
++      return BROTLI_DECODER_NEEDS_MORE_INPUT;
++    }
+     if (!SafeReadBlockLength(s, &s->block_length[tree_type], len_tree, br)) {
+       s->substate_read_block_length = BROTLI_STATE_READ_BLOCK_LENGTH_NONE;
+       BrotliBitReaderRestoreState(br, &memento);
+-      return BROTLI_FALSE;
++      return BROTLI_DECODER_NEEDS_MORE_INPUT;
+     }
+   }
+ 
+@@ -1159,7 +1161,7 @@ static BROTLI_INLINE BROTLI_BOOL DecodeBlockTypeAndLength(
+   }
+   ringbuffer[0] = ringbuffer[1];
+   ringbuffer[1] = block_type;
+-  return BROTLI_TRUE;
++  return BROTLI_DECODER_SUCCESS;
+ }
+ 
+ static BROTLI_INLINE void DetectTrivialLiteralBlockTypes(
+@@ -1195,62 +1197,68 @@ static BROTLI_INLINE void PrepareLiteralDecoding(BrotliDecoderState* s) {
+ 
+ /* Decodes the block type and updates the state for literal context.
+    Reads 3..54 bits. */
+-static BROTLI_INLINE BROTLI_BOOL DecodeLiteralBlockSwitchInternal(
++static BROTLI_INLINE BrotliDecoderErrorCode DecodeLiteralBlockSwitchInternal(
+     int safe, BrotliDecoderState* s) {
+-  if (!DecodeBlockTypeAndLength(safe, s, 0)) {
+-    return BROTLI_FALSE;
++  BrotliDecoderErrorCode result = DecodeBlockTypeAndLength(safe, s, 0);
++  if (result != BROTLI_DECODER_SUCCESS) {
++    return result;
+   }
+   PrepareLiteralDecoding(s);
+-  return BROTLI_TRUE;
++  return BROTLI_DECODER_SUCCESS;
+ }
+ 
+-static void BROTLI_NOINLINE DecodeLiteralBlockSwitch(BrotliDecoderState* s) {
+-  DecodeLiteralBlockSwitchInternal(0, s);
++static BROTLI_NOINLINE BrotliDecoderErrorCode
++DecodeLiteralBlockSwitch(BrotliDecoderState* s) {
++  return DecodeLiteralBlockSwitchInternal(0, s);
+ }
+ 
+-static BROTLI_BOOL BROTLI_NOINLINE SafeDecodeLiteralBlockSwitch(
++static BROTLI_NOINLINE BrotliDecoderErrorCode SafeDecodeLiteralBlockSwitch(
+     BrotliDecoderState* s) {
+   return DecodeLiteralBlockSwitchInternal(1, s);
+ }
+ 
+ /* Block switch for insert/copy length.
+    Reads 3..54 bits. */
+-static BROTLI_INLINE BROTLI_BOOL DecodeCommandBlockSwitchInternal(
++static BROTLI_INLINE BrotliDecoderErrorCode DecodeCommandBlockSwitchInternal(
+     int safe, BrotliDecoderState* s) {
+-  if (!DecodeBlockTypeAndLength(safe, s, 1)) {
+-    return BROTLI_FALSE;
++  BrotliDecoderErrorCode result = DecodeBlockTypeAndLength(safe, s, 1);
++  if (result != BROTLI_DECODER_SUCCESS) {
++    return result;
+   }
+   s->htree_command = s->insert_copy_hgroup.htrees[s->block_type_rb[3]];
+-  return BROTLI_TRUE;
++  return BROTLI_DECODER_SUCCESS;
+ }
+ 
+-static void BROTLI_NOINLINE DecodeCommandBlockSwitch(BrotliDecoderState* s) {
+-  DecodeCommandBlockSwitchInternal(0, s);
++static BROTLI_NOINLINE BrotliDecoderErrorCode
++DecodeCommandBlockSwitch(BrotliDecoderState* s) {
++  return DecodeCommandBlockSwitchInternal(0, s);
+ }
+ 
+-static BROTLI_BOOL BROTLI_NOINLINE SafeDecodeCommandBlockSwitch(
++static BROTLI_NOINLINE BrotliDecoderErrorCode SafeDecodeCommandBlockSwitch(
+     BrotliDecoderState* s) {
+   return DecodeCommandBlockSwitchInternal(1, s);
+ }
+ 
+ /* Block switch for distance codes.
+    Reads 3..54 bits. */
+-static BROTLI_INLINE BROTLI_BOOL DecodeDistanceBlockSwitchInternal(
++static BROTLI_INLINE BrotliDecoderErrorCode DecodeDistanceBlockSwitchInternal(
+     int safe, BrotliDecoderState* s) {
+-  if (!DecodeBlockTypeAndLength(safe, s, 2)) {
+-    return BROTLI_FALSE;
++  BrotliDecoderErrorCode result = DecodeBlockTypeAndLength(safe, s, 2);
++  if (result != BROTLI_DECODER_SUCCESS) {
++    return result;
+   }
+   s->dist_context_map_slice = s->dist_context_map +
+       (s->block_type_rb[5] << BROTLI_DISTANCE_CONTEXT_BITS);
+   s->dist_htree_index = s->dist_context_map_slice[s->distance_context];
+-  return BROTLI_TRUE;
++  return BROTLI_DECODER_SUCCESS;
+ }
+ 
+-static void BROTLI_NOINLINE DecodeDistanceBlockSwitch(BrotliDecoderState* s) {
+-  DecodeDistanceBlockSwitchInternal(0, s);
++static BROTLI_NOINLINE BrotliDecoderErrorCode
++DecodeDistanceBlockSwitch(BrotliDecoderState* s) {
++  return DecodeDistanceBlockSwitchInternal(0, s);
+ }
+ 
+-static BROTLI_BOOL BROTLI_NOINLINE SafeDecodeDistanceBlockSwitch(
++static BROTLI_NOINLINE BrotliDecoderErrorCode SafeDecodeDistanceBlockSwitch(
+     BrotliDecoderState* s) {
+   return DecodeDistanceBlockSwitchInternal(1, s);
+ }
+@@ -1829,6 +1837,9 @@ static BROTLI_INLINE BROTLI_BOOL CheckInputAmount(
+   return BrotliCheckInputAmount(br, num);
+ }
+ 
++/* NB: METHOD should return BROTLI_FALSE only in case there is not enough input;
++       in case of "unsafe" execution, when input is guaranteed to be sufficient,
++       result is ignored. */
+ #define BROTLI_SAFE(METHOD)                       \
+   {                                               \
+     if (safe) {                                   \
+@@ -1841,6 +1852,22 @@ static BROTLI_INLINE BROTLI_BOOL CheckInputAmount(
+     }                                             \
+   }
+ 
++/* NB: METHOD should return BROTLI_DECODER_SUCCESS, BROTLI_DECODER_ERROR_*, or
++   BROTLI_DECODER_NEEDS_MORE_INPUT; the later two break the processing. */
++#define BROTLI_SAFE_WITH_STATUS(METHOD)         \
++  {                                             \
++    BrotliDecoderErrorCode status;              \
++    if (safe) {                                 \
++      status = Safe##METHOD;                    \
++    } else {                                    \
++      status = METHOD;                          \
++    }                                           \
++    if (status != BROTLI_DECODER_SUCCESS) {     \
++      result = status;                          \
++      goto saveStateAndReturn;                  \
++    }                                           \
++  }
++
+ static BROTLI_INLINE BrotliDecoderErrorCode ProcessCommandsInternal(
+     int safe, BrotliDecoderState* s) {
+   int pos = s->pos;
+@@ -1880,7 +1907,7 @@ CommandBegin:
+     goto saveStateAndReturn;
+   }
+   if (BROTLI_PREDICT_FALSE(s->block_length[1] == 0)) {
+-    BROTLI_SAFE(DecodeCommandBlockSwitch(s));
++    BROTLI_SAFE_WITH_STATUS(DecodeCommandBlockSwitch(s));
+     goto CommandBegin;
+   }
+   /* Read the insert/copy length in the command. */
+@@ -1908,7 +1935,7 @@ CommandInner:
+         goto saveStateAndReturn;
+       }
+       if (BROTLI_PREDICT_FALSE(s->block_length[0] == 0)) {
+-        BROTLI_SAFE(DecodeLiteralBlockSwitch(s));
++        BROTLI_SAFE_WITH_STATUS(DecodeLiteralBlockSwitch(s));
+         PreloadSymbol(safe, s->literal_htree, br, &bits, &value);
+         if (!s->trivial_literal_context) goto CommandInner;
+       }
+@@ -1944,7 +1971,7 @@ CommandInner:
+         goto saveStateAndReturn;
+       }
+       if (BROTLI_PREDICT_FALSE(s->block_length[0] == 0)) {
+-        BROTLI_SAFE(DecodeLiteralBlockSwitch(s));
++        BROTLI_SAFE_WITH_STATUS(DecodeLiteralBlockSwitch(s));
+         if (s->trivial_literal_context) goto CommandInner;
+       }
+       context = BROTLI_CONTEXT(p1, p2, s->context_lookup);
+@@ -1991,7 +2018,7 @@ CommandPostDecodeLiterals:
+   } else {
+     /* Read distance code in the command, unless it was implicitly zero. */
+     if (BROTLI_PREDICT_FALSE(s->block_length[2] == 0)) {
+-      BROTLI_SAFE(DecodeDistanceBlockSwitch(s));
++      BROTLI_SAFE_WITH_STATUS(DecodeDistanceBlockSwitch(s));
+     }
+     BROTLI_SAFE(ReadDistance(s, br));
+   }
+diff --git a/c/include/brotli/decode.h b/c/include/brotli/decode.h
+index 9b580d2..f731d03 100644
+--- a/c/include/brotli/decode.h
++++ b/c/include/brotli/decode.h
+@@ -85,8 +85,8 @@ typedef enum {
+   BROTLI_ERROR_CODE(_ERROR_FORMAT_, PADDING_1, -14) SEPARATOR              \
+   BROTLI_ERROR_CODE(_ERROR_FORMAT_, PADDING_2, -15) SEPARATOR              \
+   BROTLI_ERROR_CODE(_ERROR_FORMAT_, DISTANCE, -16) SEPARATOR               \
++  BROTLI_ERROR_CODE(_ERROR_FORMAT_, BLOCK_SWITCH, -17) SEPARATOR           \
+                                                                            \
+-  /* -17 code is reserved */                                               \
+                                                                            \
+   BROTLI_ERROR_CODE(_ERROR_, COMPOUND_DICTIONARY, -18) SEPARATOR           \
+   BROTLI_ERROR_CODE(_ERROR_, DICTIONARY_NOT_SET, -19) SEPARATOR            \
diff --git a/meta/recipes-core/ovmf/ovmf/CVE-2026-111497_p2.patch b/meta/recipes-core/ovmf/ovmf/CVE-2026-111497_p2.patch
new file mode 100644
index 0000000000..53fefb110b
--- /dev/null
+++ b/meta/recipes-core/ovmf/ovmf/CVE-2026-111497_p2.patch
@@ -0,0 +1,243 @@
+From 64c4d6b60010a49f20f8c98309fdb133d6b7a0e8 Mon Sep 17 00:00:00 2001
+From: Evgenii Kliuchnikov <eustas.ru@gmail.com>
+Date: Wed, 21 Oct 2026 11:25:30 +0000
+Subject: [PATCH] Detect and report invalid stream earlier.
+
+PiperOrigin-RevId: 876198329
+
+CVE: CVE-2026-111497
+Upstream-Status: Backport [https://github.com/google/brotli/commit/50a9b70a4d5e1443fc40927952276b68fffa83a0]
+
+Backport Changes:
+- The original header hunk fails against the EDK II dictionary API.
+  Retain its COMPOUND_DICTIONARY error (-18), insert the unchanged
+  upstream BLOCK_SWITCH error (-17), and remove the stale -17 reservation.
+  Omit the upstream comment reserving -18, which this target already uses.
+
+(cherry picked from commit 0ed4268a4401abcb4472096340477cf4af7d1a2b
+Signed-off-by: Devansh Patel <devanshp@cisco.com>
+---
+ c/dec/decode.c            | 87 +++++++++++++++++++++++++--------------
+ c/include/brotli/decode.h |  2 +-
+ 2 files changed, 58 insertions(+), 31 deletions(-)
+
+diff --git a/c/dec/decode.c b/c/dec/decode.c
+index 2fe58a7..359e416 100644
+--- a/c/dec/decode.c
++++ b/c/dec/decode.c
+@@ -1118,7 +1118,7 @@ static BrotliDecoderErrorCode DecodeContextMap(uint32_t context_map_size,
+ 
+ /* Decodes a command or literal and updates block type ring-buffer.
+    Reads 3..54 bits. */
+-static BROTLI_INLINE BROTLI_BOOL DecodeBlockTypeAndLength(
++static BROTLI_INLINE BrotliDecoderErrorCode DecodeBlockTypeAndLength(
+     int safe, BrotliDecoderState* s, int tree_type) {
+   uint32_t max_block_type = s->num_block_types[tree_type];
+   const HuffmanCode* type_tree = &s->block_type_trees[
+@@ -1129,7 +1129,7 @@ static BROTLI_INLINE BROTLI_BOOL DecodeBlockTypeAndLength(
+   uint32_t* ringbuffer = &s->block_type_rb[tree_type * 2];
+   uint32_t block_type;
+   if (max_block_type <= 1) {
+-    return BROTLI_FALSE;
++    return BROTLI_DECODER_ERROR_FORMAT_BLOCK_SWITCH;
+   }
+ 
+   /* Read 0..15 + 3..39 bits. */
+@@ -1139,11 +1139,13 @@ static BROTLI_INLINE BROTLI_BOOL DecodeBlockTypeAndLength(
+   } else {
+     BrotliBitReaderState memento;
+     BrotliBitReaderSaveState(br, &memento);
+-    if (!SafeReadSymbol(type_tree, br, &block_type)) return BROTLI_FALSE;
++    if (!SafeReadSymbol(type_tree, br, &block_type)) {
++      return BROTLI_DECODER_NEEDS_MORE_INPUT;
++    }
+     if (!SafeReadBlockLength(s, &s->block_length[tree_type], len_tree, br)) {
+       s->substate_read_block_length = BROTLI_STATE_READ_BLOCK_LENGTH_NONE;
+       BrotliBitReaderRestoreState(br, &memento);
+-      return BROTLI_FALSE;
++      return BROTLI_DECODER_NEEDS_MORE_INPUT;
+     }
+   }
+ 
+@@ -1159,7 +1161,7 @@ static BROTLI_INLINE BROTLI_BOOL DecodeBlockTypeAndLength(
+   }
+   ringbuffer[0] = ringbuffer[1];
+   ringbuffer[1] = block_type;
+-  return BROTLI_TRUE;
++  return BROTLI_DECODER_SUCCESS;
+ }
+ 
+ static BROTLI_INLINE void DetectTrivialLiteralBlockTypes(
+@@ -1195,62 +1197,68 @@ static BROTLI_INLINE void PrepareLiteralDecoding(BrotliDecoderState* s) {
+ 
+ /* Decodes the block type and updates the state for literal context.
+    Reads 3..54 bits. */
+-static BROTLI_INLINE BROTLI_BOOL DecodeLiteralBlockSwitchInternal(
++static BROTLI_INLINE BrotliDecoderErrorCode DecodeLiteralBlockSwitchInternal(
+     int safe, BrotliDecoderState* s) {
+-  if (!DecodeBlockTypeAndLength(safe, s, 0)) {
+-    return BROTLI_FALSE;
++  BrotliDecoderErrorCode result = DecodeBlockTypeAndLength(safe, s, 0);
++  if (result != BROTLI_DECODER_SUCCESS) {
++    return result;
+   }
+   PrepareLiteralDecoding(s);
+-  return BROTLI_TRUE;
++  return BROTLI_DECODER_SUCCESS;
+ }
+ 
+-static void BROTLI_NOINLINE DecodeLiteralBlockSwitch(BrotliDecoderState* s) {
+-  DecodeLiteralBlockSwitchInternal(0, s);
++static BROTLI_NOINLINE BrotliDecoderErrorCode
++DecodeLiteralBlockSwitch(BrotliDecoderState* s) {
++  return DecodeLiteralBlockSwitchInternal(0, s);
+ }
+ 
+-static BROTLI_BOOL BROTLI_NOINLINE SafeDecodeLiteralBlockSwitch(
++static BROTLI_NOINLINE BrotliDecoderErrorCode SafeDecodeLiteralBlockSwitch(
+     BrotliDecoderState* s) {
+   return DecodeLiteralBlockSwitchInternal(1, s);
+ }
+ 
+ /* Block switch for insert/copy length.
+    Reads 3..54 bits. */
+-static BROTLI_INLINE BROTLI_BOOL DecodeCommandBlockSwitchInternal(
++static BROTLI_INLINE BrotliDecoderErrorCode DecodeCommandBlockSwitchInternal(
+     int safe, BrotliDecoderState* s) {
+-  if (!DecodeBlockTypeAndLength(safe, s, 1)) {
+-    return BROTLI_FALSE;
++  BrotliDecoderErrorCode result = DecodeBlockTypeAndLength(safe, s, 1);
++  if (result != BROTLI_DECODER_SUCCESS) {
++    return result;
+   }
+   s->htree_command = s->insert_copy_hgroup.htrees[s->block_type_rb[3]];
+-  return BROTLI_TRUE;
++  return BROTLI_DECODER_SUCCESS;
+ }
+ 
+-static void BROTLI_NOINLINE DecodeCommandBlockSwitch(BrotliDecoderState* s) {
+-  DecodeCommandBlockSwitchInternal(0, s);
++static BROTLI_NOINLINE BrotliDecoderErrorCode
++DecodeCommandBlockSwitch(BrotliDecoderState* s) {
++  return DecodeCommandBlockSwitchInternal(0, s);
+ }
+ 
+-static BROTLI_BOOL BROTLI_NOINLINE SafeDecodeCommandBlockSwitch(
++static BROTLI_NOINLINE BrotliDecoderErrorCode SafeDecodeCommandBlockSwitch(
+     BrotliDecoderState* s) {
+   return DecodeCommandBlockSwitchInternal(1, s);
+ }
+ 
+ /* Block switch for distance codes.
+    Reads 3..54 bits. */
+-static BROTLI_INLINE BROTLI_BOOL DecodeDistanceBlockSwitchInternal(
++static BROTLI_INLINE BrotliDecoderErrorCode DecodeDistanceBlockSwitchInternal(
+     int safe, BrotliDecoderState* s) {
+-  if (!DecodeBlockTypeAndLength(safe, s, 2)) {
+-    return BROTLI_FALSE;
++  BrotliDecoderErrorCode result = DecodeBlockTypeAndLength(safe, s, 2);
++  if (result != BROTLI_DECODER_SUCCESS) {
++    return result;
+   }
+   s->dist_context_map_slice = s->dist_context_map +
+       (s->block_type_rb[5] << BROTLI_DISTANCE_CONTEXT_BITS);
+   s->dist_htree_index = s->dist_context_map_slice[s->distance_context];
+-  return BROTLI_TRUE;
++  return BROTLI_DECODER_SUCCESS;
+ }
+ 
+-static void BROTLI_NOINLINE DecodeDistanceBlockSwitch(BrotliDecoderState* s) {
+-  DecodeDistanceBlockSwitchInternal(0, s);
++static BROTLI_NOINLINE BrotliDecoderErrorCode
++DecodeDistanceBlockSwitch(BrotliDecoderState* s) {
++  return DecodeDistanceBlockSwitchInternal(0, s);
+ }
+ 
+-static BROTLI_BOOL BROTLI_NOINLINE SafeDecodeDistanceBlockSwitch(
++static BROTLI_NOINLINE BrotliDecoderErrorCode SafeDecodeDistanceBlockSwitch(
+     BrotliDecoderState* s) {
+   return DecodeDistanceBlockSwitchInternal(1, s);
+ }
+@@ -1829,6 +1837,9 @@ static BROTLI_INLINE BROTLI_BOOL CheckInputAmount(
+   return BrotliCheckInputAmount(br, num);
+ }
+ 
++/* NB: METHOD should return BROTLI_FALSE only in case there is not enough input;
++       in case of "unsafe" execution, when input is guaranteed to be sufficient,
++       result is ignored. */
+ #define BROTLI_SAFE(METHOD)                       \
+   {                                               \
+     if (safe) {                                   \
+@@ -1841,6 +1852,22 @@ static BROTLI_INLINE BROTLI_BOOL CheckInputAmount(
+     }                                             \
+   }
+ 
++/* NB: METHOD should return BROTLI_DECODER_SUCCESS, BROTLI_DECODER_ERROR_*, or
++   BROTLI_DECODER_NEEDS_MORE_INPUT; the later two break the processing. */
++#define BROTLI_SAFE_WITH_STATUS(METHOD)         \
++  {                                             \
++    BrotliDecoderErrorCode status;              \
++    if (safe) {                                 \
++      status = Safe##METHOD;                    \
++    } else {                                    \
++      status = METHOD;                          \
++    }                                           \
++    if (status != BROTLI_DECODER_SUCCESS) {     \
++      result = status;                          \
++      goto saveStateAndReturn;                  \
++    }                                           \
++  }
++
+ static BROTLI_INLINE BrotliDecoderErrorCode ProcessCommandsInternal(
+     int safe, BrotliDecoderState* s) {
+   int pos = s->pos;
+@@ -1880,7 +1907,7 @@ CommandBegin:
+     goto saveStateAndReturn;
+   }
+   if (BROTLI_PREDICT_FALSE(s->block_length[1] == 0)) {
+-    BROTLI_SAFE(DecodeCommandBlockSwitch(s));
++    BROTLI_SAFE_WITH_STATUS(DecodeCommandBlockSwitch(s));
+     goto CommandBegin;
+   }
+   /* Read the insert/copy length in the command. */
+@@ -1908,7 +1935,7 @@ CommandInner:
+         goto saveStateAndReturn;
+       }
+       if (BROTLI_PREDICT_FALSE(s->block_length[0] == 0)) {
+-        BROTLI_SAFE(DecodeLiteralBlockSwitch(s));
++        BROTLI_SAFE_WITH_STATUS(DecodeLiteralBlockSwitch(s));
+         PreloadSymbol(safe, s->literal_htree, br, &bits, &value);
+         if (!s->trivial_literal_context) goto CommandInner;
+       }
+@@ -1944,7 +1971,7 @@ CommandInner:
+         goto saveStateAndReturn;
+       }
+       if (BROTLI_PREDICT_FALSE(s->block_length[0] == 0)) {
+-        BROTLI_SAFE(DecodeLiteralBlockSwitch(s));
++        BROTLI_SAFE_WITH_STATUS(DecodeLiteralBlockSwitch(s));
+         if (s->trivial_literal_context) goto CommandInner;
+       }
+       context = BROTLI_CONTEXT(p1, p2, s->context_lookup);
+@@ -1991,7 +2018,7 @@ CommandPostDecodeLiterals:
+   } else {
+     /* Read distance code in the command, unless it was implicitly zero. */
+     if (BROTLI_PREDICT_FALSE(s->block_length[2] == 0)) {
+-      BROTLI_SAFE(DecodeDistanceBlockSwitch(s));
++      BROTLI_SAFE_WITH_STATUS(DecodeDistanceBlockSwitch(s));
+     }
+     BROTLI_SAFE(ReadDistance(s, br));
+   }
+diff --git a/c/include/brotli/decode.h b/c/include/brotli/decode.h
+index 9b580d2..f731d03 100644
+--- a/c/include/brotli/decode.h
++++ b/c/include/brotli/decode.h
+@@ -85,8 +85,8 @@ typedef enum {
+   BROTLI_ERROR_CODE(_ERROR_FORMAT_, PADDING_1, -14) SEPARATOR              \
+   BROTLI_ERROR_CODE(_ERROR_FORMAT_, PADDING_2, -15) SEPARATOR              \
+   BROTLI_ERROR_CODE(_ERROR_FORMAT_, DISTANCE, -16) SEPARATOR               \
++  BROTLI_ERROR_CODE(_ERROR_FORMAT_, BLOCK_SWITCH, -17) SEPARATOR           \
+                                                                            \
+-  /* -17 code is reserved */                                               \
+                                                                            \
+   BROTLI_ERROR_CODE(_ERROR_, COMPOUND_DICTIONARY, -18) SEPARATOR           \
+   BROTLI_ERROR_CODE(_ERROR_, DICTIONARY_NOT_SET, -19) SEPARATOR            \
diff --git a/meta/recipes-core/ovmf/ovmf_git.bb b/meta/recipes-core/ovmf/ovmf_git.bb
index 06e96d3a08..8b20adabc0 100644
--- a/meta/recipes-core/ovmf/ovmf_git.bb
+++ b/meta/recipes-core/ovmf/ovmf_git.bb
@@ -40,6 +40,8 @@ SRC_URI = "gitsm://github.com/tianocore/edk2.git;branch=master;protocol=https \
            file://CVE-2025-2296-8.patch \
            file://CVE-2025-2296-9.patch \
            file://CVE-2024-38798.patch \
+           file://CVE-2026-111497_p1.patch;patchdir=BaseTools/Source/C/BrotliCompress/brotli \
+           file://CVE-2026-111497_p2.patch;patchdir=MdeModulePkg/Library/BrotliCustomDecompressLib/brotli \
            "
 
 PV = "edk2-stable202402"
-- 
2.35.6

