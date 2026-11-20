Received: from aer-iport-1.cisco.com (aer-iport-1.cisco.com [173.38.203.51])
 by mx.groups.io with SMTP id smtpd.msgproc01-g2.2326.1795165276171015888
 for <openembedded-core@lists.openembedded.org>;
 Fri, 20 Nov 2026 01:01:16 -0800
Authentication-Results: mx.groups.io;
 dkim=fail reason="dkim: message contains an insecure body length tag" header.i=@cisco.com header.s=iport01 header.b=AqUA1INY;
 spf=pass (domain: cisco.com, ip: 173.38.203.51, mailfrom: devanshp@cisco.com)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
  d=cisco.com; i=@cisco.com; l=20645; q=dns/txt;
  s=iport01; t=1795165276; x=1796374876;
  h=from:to:subject:date:message-id:mime-version:
   content-transfer-encoding;
  bh=cf+jdxeeQyQyG23LEAoyYj7UfzVgFw7v0YLUa/p5oUY=;
  b=AqUA1INYTYlEmNVHKsa1v+XeQuN8capNQjrNRU5cDGU/0ZooRuTSTBNu
   GLJvlxkGUP8mPbVOU1p1PwMfvX4FGr4CBrBrC5GRfUfz5ERghnJYgk+1Y
   nTdzZ3VbEFQQkBxA/4G6SI2lKdkhBjP/Qck2ieJ4D0betLXtskNsGw9aP
   VvdV/UJ0S2+IlDVH1zDzT6NuzuYMkRM5iDGivEc6P5vWbJObWdV64D4fP
   Zo13qcyy/oywyP3SXls1h2ZY57/AFyhWivqL8GnT/grUrg9wASJmuzoxT
   9g30jwfKItx1T4apNY/j8cJaoXcY+b+pb7AjoJ9qqsacGag15kgMZ4MrM
   w==;
X-CSE-ConnectionGUID: RYHBPdySTn6rswjw9AvIsg==
X-CSE-MsgGUID: al39cnP9SMm/UqoPhMZ1Ng==
X-IPAS-Result: =?us-ascii?q?A0BEAgCvCwBr/9VK/pBaglmCV3VgQ0mUKoIhniyBJANXD?=
 =?us-ascii?q?wEBAQ9EDQQBAYQ/jmkCJjQJDgECBAMCAwEBAQEBAQEBAQEBAQoBAQUBAQECA?=
 =?us-ascii?q?QcFgQ4Thk8NkBIBLQsBcgMBAlojIYMCAYJ0AxG4c4F5M4EBg2kCQ1DbMwELF?=
 =?us-ascii?q?AGBOIVCiCRdGAGEfScbG4FyhH+BBYFcAQGIJgSCIoEMgVSNFwKBT4gmSIEeA?=
 =?us-ascii?q?1ksAVUTDQoLBwWBaAM1EioVbjIdgSM7F4EHGwYFgRyBHoESgQNdgSsoXiGBC?=
 =?us-ascii?q?IF2AoJRggACAUlBDgdFUwklQxJHJCIIEgkBExosCoEaNTwJJj8VDGcLGgVhC?=
 =?us-ascii?q?AINDHQ5EDAeJC8FGiY+GwqBDCcfHhsOAh8QBg0YDUgRLDcVGQQ+bgeTbIJ5G?=
 =?us-ascii?q?QcWG10BKxeCApNSkjahEQoog3mMJJU6GjOEBIFXkkOSVAuYfYs3glOWBBY3h?=
 =?us-ascii?q?GqBaDw5gQ4LB3AVgyIJShkPji4LC4NggX/MXCYyCzIBAQcCBw4DC4FokX4BA?=
 =?us-ascii?q?Q?=
IronPort-Data: A9a23:ntm+IqAoSVhIehVW/33iw5YqxClBgxIJ4kV8jS/XYbTApG9whjIPx
 2UfXjuEbP/YN2TyLYt1PNux9EMB7MCByIc2OVdlrnsFo1CmBibm6XV1Cm+qYkt+++WaFBoPA
 /02M4eGcYZsCC+G+39BC5C5xVFkz6aEW7HgP+DNPyF1VGdMRTwo4f5Zs7ZRbrVA357jXGthh
 fuo+5eBYQb/g2ctWo4pw/vrRC1H7ayaVAww5jTSVdgT1HfCmn8cCo4oJK3ZBxPQXolOE+emc
 P3Ixbe/83mx109F5gSNy+uTnuUiG9Y+DCDW4pZkc/HKbitq+kTe5p0G2M80Mi+7vdkmc+dZk
 72hvbToIesg0zaldO41C3G0GAkmVUFKFSOuzXWX6aSuI0P6n3TE+cROJnk6LLYk/LhtGn5M6
 q0xNhEWYUXW7w626OrTpuhEj8k5ac2uN4QFtzQ5l3fSDO0tRtbIRKCiCd1whWtswJoTQbCBO
 4xDMGEHgBfoO3WjPn8bBYw3mvyonlH0ciZTrxSeoq9fD237klYogeS0b4O9ltqiTMEOz02en
 jP92mG+PwgdDNy6+2Oj/Sf57gPItWahMG4IL5W/7vNsjViZy2AfBRFTXlyhrNG9i1WiQJRYM
 0ES9y8koKQ++UDtScPyNyBUu1aNswRZX59bFPc3rVjXjKHV+A2eQGMDS1atdeAbiSP/fhRyv
 nfhoj8jLWUHXGG9IZ5FyoqpkA==
IronPort-HdrOrdr: A9a23:jWkm06+QyjtKGV0AlfZuk+DoI+orL9Y04lQ7vn2ZLiYlEPBw+P
 rBoB1273LJYVUqKRIdcK67WZVoKEm0nfUe3WB7B9iftWfd1FdAVLsD0aLShxv9Bib56ulRkY
 1kc6R4FZnMKGISt7ee3OF9eOxQp+VuN8uT9IPj80s=
X-Talos-CUID: =?us-ascii?q?9a23=3AhsS/gWifNWzCgkxTR03RZgTEdTJuSEz95k/cMnS?=
 =?us-ascii?q?EDzhzU6KXVg655oJ/nJ87?=
X-Talos-MUID: 9a23:uPuiQwbXgSBrcOBTvju31TpkDJZTxqHpNVkKqZUjiZCiOnkl
X-IronPort-Anti-Spam-Filtered: true
X-IronPort-AV: E=Sophos;i="6.27,222,1787011200"; 
   d="scan'208";a="62194171"
Received: from aer-l-core-12.cisco.com ([144.254.74.213])
  by aer-iport-1.cisco.com with ESMTP/TLS/TLS_AES_256_GCM_SHA384; 20 Nov 2026 09:01:12 +0000
Received: from sjc-ads-4935.cisco.com (sjc-ads-4935.cisco.com [10.28.39.199])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256
	 client-signature RSA-PSS (4096 bits) client-digest SHA256)
	(Client CN "ciscoit-managed-infra-smtp-auth.cisco.com", Issuer "Internal Private TLS SubCA" (verified OK))
	by aer-l-core-12.cisco.com (Postfix) with ESMTPS id B407A1800022F
	for <openembedded-core@lists.openembedded.org>; Fri, 20 Nov 2026 09:01:11 +0000 (GMT)
Received: by sjc-ads-4935.cisco.com (Postfix, from userid 1887503)
	id 68F7BCC2EF3; Fri, 20 Nov 2026 01:01:10 -0800 (PST)
From: "Devansh Patel -X (devanshp - E INFOCHIPS PRIVATE LIMITED at Cisco)" <devanshp@cisco.com>
To: openembedded-core@lists.openembedded.org
Subject: [OE-core][wrynose][PATCH] ovmf: Fix CVE-2026-111497
Date: Fri, 20 Nov 2026 01:01:10 -0800
Message-Id: <20261120090110.945428-1-devanshp@cisco.com>
X-Mailer: git-send-email 2.35.6
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Outbound-Client-TLS: VERIFIED;sjc-ads-4935.cisco.com [10.28.39.199];TLSv1.3;TLS_AES_256_GCM_SHA384;256;ciscoit-managed-infra-smtp-auth.cisco.com
X-Outbound-SMTP-Client: 10.28.39.199, sjc-ads-4935.cisco.com
X-Outbound-Node: aer-l-core-12.cisco.com
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by lin-tor-korg-lkml-alma10-1 with HTTPS for <openembedded-core@lists.openembedded.org>; Fri, 20 Nov 2026 09:01:20 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/250750
Content-Type: text/plain; charset="utf-8"

From: Devansh Patel <devanshp@cisco.com>

This patch applies the upstream v1.2 decoder backport for
CVE-2026-111497. The upstream fix commit is referenced in [1],
and the public CVE advisory is referenced in [2].

Fix both embedded Brotli copies. BaseTools BrotliCompress builds the
affected decoder and exposes decompression through its -d option.
Retain the existing EDK II and Brotli revisions and their integration
changes while adding the complete decoder and public-header fix.

[1] https://github.com/google/brotli/commit/b418fa81c48262a86a95332b0bc6d62c30aa78b6
[2] https://nvd.nist.gov/vuln/detail/CVE-2026-111497

Signed-off-by: Devansh Patel <devanshp@cisco.com>
---
 .../ovmf/ovmf/CVE-2026-111497_p1.patch        | 239 ++++++++++++++++++
 .../ovmf/ovmf/CVE-2026-111497_p2.patch        | 239 ++++++++++++++++++
 meta/recipes-core/ovmf/ovmf_git.bb            |   2 +
 3 files changed, 480 insertions(+)
 create mode 100644 meta/recipes-core/ovmf/ovmf/CVE-2026-111497_p1.patch
 create mode 100644 meta/recipes-core/ovmf/ovmf/CVE-2026-111497_p2.patch

diff --git a/meta/recipes-core/ovmf/ovmf/CVE-2026-111497_p1.patch b/meta/recipes-core/ovmf/ovmf/CVE-2026-111497_p1.patch
new file mode 100644
index 0000000000..cc1d1fc8c6
--- /dev/null
+++ b/meta/recipes-core/ovmf/ovmf/CVE-2026-111497_p1.patch
@@ -0,0 +1,239 @@
+From 269352a41be083ebb9d21a9a9677eb804406fd9a Mon Sep 17 00:00:00 2001
+From: Evgenii Kliuchnikov <eustas@google.com>
+Date: Fri, 27 Feb 2026 05:10:32 -0800
+Subject: [PATCH] Detect and report invalid stream earlier.
+
+PiperOrigin-RevId: 876198329
+
+CVE: CVE-2026-111497
+Upstream-Status: Backport [https://github.com/google/brotli/commit/b418fa81c48262a86a95332b0bc6d62c30aa78b6]
+
+(cherry picked from commit 0ed4268a4401abcb4472096340477cf4af7d1a2b)
+Signed-off-by: Devansh Patel <devanshp@cisco.com>
+---
+ c/dec/decode.c            | 89 ++++++++++++++++++++++++++-------------
+ c/include/brotli/decode.h |  4 +-
+ 2 files changed, 60 insertions(+), 33 deletions(-)
+
+diff --git a/c/dec/decode.c b/c/dec/decode.c
+index e87e7f5..74db1a2 100644
+--- a/c/dec/decode.c
++++ b/c/dec/decode.c
+@@ -1176,7 +1176,7 @@ static BrotliDecoderErrorCode DecodeContextMap(brotli_reg_t context_map_size,
+ 
+ /* Decodes a command or literal and updates block type ring-buffer.
+    Reads 3..54 bits. */
+-static BROTLI_INLINE BROTLI_BOOL DecodeBlockTypeAndLength(
++static BROTLI_INLINE BrotliDecoderErrorCode DecodeBlockTypeAndLength(
+     int safe, BrotliDecoderState* s, int tree_type) {
+   brotli_reg_t max_block_type = s->num_block_types[tree_type];
+   const HuffmanCode* type_tree = &s->block_type_trees[
+@@ -1187,7 +1187,7 @@ static BROTLI_INLINE BROTLI_BOOL DecodeBlockTypeAndLength(
+   brotli_reg_t* ringbuffer = &s->block_type_rb[tree_type * 2];
+   brotli_reg_t block_type;
+   if (max_block_type <= 1) {
+-    return BROTLI_FALSE;
++    return BROTLI_DECODER_ERROR_FORMAT_BLOCK_SWITCH;
+   }
+ 
+   /* Read 0..15 + 3..39 bits. */
+@@ -1197,11 +1197,13 @@ static BROTLI_INLINE BROTLI_BOOL DecodeBlockTypeAndLength(
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
+@@ -1217,7 +1219,7 @@ static BROTLI_INLINE BROTLI_BOOL DecodeBlockTypeAndLength(
+   }
+   ringbuffer[0] = ringbuffer[1];
+   ringbuffer[1] = block_type;
+-  return BROTLI_TRUE;
++  return BROTLI_DECODER_SUCCESS;
+ }
+ 
+ static BROTLI_INLINE void DetectTrivialLiteralBlockTypes(
+@@ -1254,62 +1256,68 @@ static BROTLI_INLINE void PrepareLiteralDecoding(BrotliDecoderState* s) {
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
+-    BrotliDecoderState* s) {
++static BROTLI_NOINLINE BrotliDecoderErrorCode
++SafeDecodeCommandBlockSwitch(BrotliDecoderState* s) {
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
+@@ -1940,6 +1948,9 @@ static BROTLI_INLINE BROTLI_BOOL CheckInputAmount(
+   return BrotliCheckInputAmount(br);
+ }
+ 
++/* NB: METHOD should return BROTLI_FALSE only in case there is not enough input;
++       in case of "unsafe" execution, when input is guaranteed to be sufficient,
++       result is ignored. */
+ #define BROTLI_SAFE(METHOD)                       \
+   {                                               \
+     if (safe) {                                   \
+@@ -1952,6 +1963,22 @@ static BROTLI_INLINE BROTLI_BOOL CheckInputAmount(
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
+@@ -1991,7 +2018,7 @@ CommandBegin:
+     goto saveStateAndReturn;
+   }
+   if (BROTLI_PREDICT_FALSE(s->block_length[1] == 0)) {
+-    BROTLI_SAFE(DecodeCommandBlockSwitch(s));
++    BROTLI_SAFE_WITH_STATUS(DecodeCommandBlockSwitch(s));
+     goto CommandBegin;
+   }
+   /* Read the insert/copy length in the command. */
+@@ -2136,7 +2163,7 @@ CommandPostDecodeLiterals:
+   } else {
+     /* Read distance code in the command, unless it was implicitly zero. */
+     if (BROTLI_PREDICT_FALSE(s->block_length[2] == 0)) {
+-      BROTLI_SAFE(DecodeDistanceBlockSwitch(s));
++      BROTLI_SAFE_WITH_STATUS(DecodeDistanceBlockSwitch(s));
+     }
+     BROTLI_SAFE(ReadDistance(s, br));
+   }
+@@ -2330,7 +2357,7 @@ CommandPostWrapCopy:
+   }
+ 
+ NextLiteralBlock:
+-  BROTLI_SAFE(DecodeLiteralBlockSwitch(s));
++  BROTLI_SAFE_WITH_STATUS(DecodeLiteralBlockSwitch(s));
+   goto CommandInner;
+ 
+ saveStateAndReturn:
+@@ -2552,6 +2579,8 @@ BrotliDecoderResult BrotliDecoderDecompressStream(
+         if (result != BROTLI_DECODER_SUCCESS) {
+           break;
+         }
++        BROTLI_DCHECK(s->meta_block_remaining_len <=
++                      (int)BROTLI_BLOCK_SIZE_CAP);
+         BROTLI_LOG_UINT(s->is_last_metablock);
+         BROTLI_LOG_UINT(s->meta_block_remaining_len);
+         BROTLI_LOG_UINT(s->is_metadata);
+diff --git a/c/include/brotli/decode.h b/c/include/brotli/decode.h
+index 8d436db..10d01e3 100644
+--- a/c/include/brotli/decode.h
++++ b/c/include/brotli/decode.h
+@@ -85,9 +85,7 @@ typedef enum {
+   BROTLI_ERROR_CODE(_ERROR_FORMAT_, PADDING_1, -14) SEPARATOR              \
+   BROTLI_ERROR_CODE(_ERROR_FORMAT_, PADDING_2, -15) SEPARATOR              \
+   BROTLI_ERROR_CODE(_ERROR_FORMAT_, DISTANCE, -16) SEPARATOR               \
+-                                                                           \
+-  /* -17 code is reserved */                                               \
+-                                                                           \
++  BROTLI_ERROR_CODE(_ERROR_FORMAT_, BLOCK_SWITCH, -17) SEPARATOR           \
+   BROTLI_ERROR_CODE(_ERROR_, COMPOUND_DICTIONARY, -18) SEPARATOR           \
+   BROTLI_ERROR_CODE(_ERROR_, DICTIONARY_NOT_SET, -19) SEPARATOR            \
+   BROTLI_ERROR_CODE(_ERROR_, INVALID_ARGUMENTS, -20) SEPARATOR             \
diff --git a/meta/recipes-core/ovmf/ovmf/CVE-2026-111497_p2.patch b/meta/recipes-core/ovmf/ovmf/CVE-2026-111497_p2.patch
new file mode 100644
index 0000000000..cc1d1fc8c6
--- /dev/null
+++ b/meta/recipes-core/ovmf/ovmf/CVE-2026-111497_p2.patch
@@ -0,0 +1,239 @@
+From 269352a41be083ebb9d21a9a9677eb804406fd9a Mon Sep 17 00:00:00 2001
+From: Evgenii Kliuchnikov <eustas@google.com>
+Date: Fri, 27 Feb 2026 05:10:32 -0800
+Subject: [PATCH] Detect and report invalid stream earlier.
+
+PiperOrigin-RevId: 876198329
+
+CVE: CVE-2026-111497
+Upstream-Status: Backport [https://github.com/google/brotli/commit/b418fa81c48262a86a95332b0bc6d62c30aa78b6]
+
+(cherry picked from commit 0ed4268a4401abcb4472096340477cf4af7d1a2b)
+Signed-off-by: Devansh Patel <devanshp@cisco.com>
+---
+ c/dec/decode.c            | 89 ++++++++++++++++++++++++++-------------
+ c/include/brotli/decode.h |  4 +-
+ 2 files changed, 60 insertions(+), 33 deletions(-)
+
+diff --git a/c/dec/decode.c b/c/dec/decode.c
+index e87e7f5..74db1a2 100644
+--- a/c/dec/decode.c
++++ b/c/dec/decode.c
+@@ -1176,7 +1176,7 @@ static BrotliDecoderErrorCode DecodeContextMap(brotli_reg_t context_map_size,
+ 
+ /* Decodes a command or literal and updates block type ring-buffer.
+    Reads 3..54 bits. */
+-static BROTLI_INLINE BROTLI_BOOL DecodeBlockTypeAndLength(
++static BROTLI_INLINE BrotliDecoderErrorCode DecodeBlockTypeAndLength(
+     int safe, BrotliDecoderState* s, int tree_type) {
+   brotli_reg_t max_block_type = s->num_block_types[tree_type];
+   const HuffmanCode* type_tree = &s->block_type_trees[
+@@ -1187,7 +1187,7 @@ static BROTLI_INLINE BROTLI_BOOL DecodeBlockTypeAndLength(
+   brotli_reg_t* ringbuffer = &s->block_type_rb[tree_type * 2];
+   brotli_reg_t block_type;
+   if (max_block_type <= 1) {
+-    return BROTLI_FALSE;
++    return BROTLI_DECODER_ERROR_FORMAT_BLOCK_SWITCH;
+   }
+ 
+   /* Read 0..15 + 3..39 bits. */
+@@ -1197,11 +1197,13 @@ static BROTLI_INLINE BROTLI_BOOL DecodeBlockTypeAndLength(
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
+@@ -1217,7 +1219,7 @@ static BROTLI_INLINE BROTLI_BOOL DecodeBlockTypeAndLength(
+   }
+   ringbuffer[0] = ringbuffer[1];
+   ringbuffer[1] = block_type;
+-  return BROTLI_TRUE;
++  return BROTLI_DECODER_SUCCESS;
+ }
+ 
+ static BROTLI_INLINE void DetectTrivialLiteralBlockTypes(
+@@ -1254,62 +1256,68 @@ static BROTLI_INLINE void PrepareLiteralDecoding(BrotliDecoderState* s) {
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
+-    BrotliDecoderState* s) {
++static BROTLI_NOINLINE BrotliDecoderErrorCode
++SafeDecodeCommandBlockSwitch(BrotliDecoderState* s) {
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
+@@ -1940,6 +1948,9 @@ static BROTLI_INLINE BROTLI_BOOL CheckInputAmount(
+   return BrotliCheckInputAmount(br);
+ }
+ 
++/* NB: METHOD should return BROTLI_FALSE only in case there is not enough input;
++       in case of "unsafe" execution, when input is guaranteed to be sufficient,
++       result is ignored. */
+ #define BROTLI_SAFE(METHOD)                       \
+   {                                               \
+     if (safe) {                                   \
+@@ -1952,6 +1963,22 @@ static BROTLI_INLINE BROTLI_BOOL CheckInputAmount(
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
+@@ -1991,7 +2018,7 @@ CommandBegin:
+     goto saveStateAndReturn;
+   }
+   if (BROTLI_PREDICT_FALSE(s->block_length[1] == 0)) {
+-    BROTLI_SAFE(DecodeCommandBlockSwitch(s));
++    BROTLI_SAFE_WITH_STATUS(DecodeCommandBlockSwitch(s));
+     goto CommandBegin;
+   }
+   /* Read the insert/copy length in the command. */
+@@ -2136,7 +2163,7 @@ CommandPostDecodeLiterals:
+   } else {
+     /* Read distance code in the command, unless it was implicitly zero. */
+     if (BROTLI_PREDICT_FALSE(s->block_length[2] == 0)) {
+-      BROTLI_SAFE(DecodeDistanceBlockSwitch(s));
++      BROTLI_SAFE_WITH_STATUS(DecodeDistanceBlockSwitch(s));
+     }
+     BROTLI_SAFE(ReadDistance(s, br));
+   }
+@@ -2330,7 +2357,7 @@ CommandPostWrapCopy:
+   }
+ 
+ NextLiteralBlock:
+-  BROTLI_SAFE(DecodeLiteralBlockSwitch(s));
++  BROTLI_SAFE_WITH_STATUS(DecodeLiteralBlockSwitch(s));
+   goto CommandInner;
+ 
+ saveStateAndReturn:
+@@ -2552,6 +2579,8 @@ BrotliDecoderResult BrotliDecoderDecompressStream(
+         if (result != BROTLI_DECODER_SUCCESS) {
+           break;
+         }
++        BROTLI_DCHECK(s->meta_block_remaining_len <=
++                      (int)BROTLI_BLOCK_SIZE_CAP);
+         BROTLI_LOG_UINT(s->is_last_metablock);
+         BROTLI_LOG_UINT(s->meta_block_remaining_len);
+         BROTLI_LOG_UINT(s->is_metadata);
+diff --git a/c/include/brotli/decode.h b/c/include/brotli/decode.h
+index 8d436db..10d01e3 100644
+--- a/c/include/brotli/decode.h
++++ b/c/include/brotli/decode.h
+@@ -85,9 +85,7 @@ typedef enum {
+   BROTLI_ERROR_CODE(_ERROR_FORMAT_, PADDING_1, -14) SEPARATOR              \
+   BROTLI_ERROR_CODE(_ERROR_FORMAT_, PADDING_2, -15) SEPARATOR              \
+   BROTLI_ERROR_CODE(_ERROR_FORMAT_, DISTANCE, -16) SEPARATOR               \
+-                                                                           \
+-  /* -17 code is reserved */                                               \
+-                                                                           \
++  BROTLI_ERROR_CODE(_ERROR_FORMAT_, BLOCK_SWITCH, -17) SEPARATOR           \
+   BROTLI_ERROR_CODE(_ERROR_, COMPOUND_DICTIONARY, -18) SEPARATOR           \
+   BROTLI_ERROR_CODE(_ERROR_, DICTIONARY_NOT_SET, -19) SEPARATOR            \
+   BROTLI_ERROR_CODE(_ERROR_, INVALID_ARGUMENTS, -20) SEPARATOR             \
diff --git a/meta/recipes-core/ovmf/ovmf_git.bb b/meta/recipes-core/ovmf/ovmf_git.bb
index cd6a40a9d0..d832a98444 100644
--- a/meta/recipes-core/ovmf/ovmf_git.bb
+++ b/meta/recipes-core/ovmf/ovmf_git.bb
@@ -28,6 +28,8 @@ SRC_URI = "gitsm://github.com/tianocore/edk2.git;branch=master;protocol=https;ta
            file://0005-UefiCpuPkg-CpuExceptionHandlerLib-fix-push-instructi.patch \
            file://0001-BaseTools-StringFuncs-fix-gcc-16-warning.patch \
            file://0002-BaseTools-EfiRom-fix-compiler-warning.patch \
+           file://CVE-2026-111497_p1.patch;patchdir=BaseTools/Source/C/BrotliCompress/brotli \
+           file://CVE-2026-111497_p2.patch;patchdir=MdeModulePkg/Library/BrotliCustomDecompressLib/brotli \
            "
 
 PV = "edk2-stable202511"
-- 
2.35.6

