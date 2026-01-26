Return-Path: <wangmy@fujitsu.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id D8D3CC88E7C
	for <webhook@archiver.kernel.org>; Mon, 26 Jan 2026 12:39:06 +0000 (UTC)
Received: from esa6.hc1455-7.c3s2.iphmx.com (esa6.hc1455-7.c3s2.iphmx.com [68.232.139.139])
 by mx.groups.io with SMTP id smtpd.msgproc02-g2.18505.1769431141766865267
 for <openembedded-core@lists.openembedded.org>;
 Mon, 26 Jan 2026 04:39:02 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@fujitsu.com header.s=fj2 header.b=sJr7AKay;
 spf=pass (domain: fujitsu.com, ip: 68.232.139.139, mailfrom: wangmy@fujitsu.com)
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
  d=fujitsu.com; i=@fujitsu.com; q=dns/txt; s=fj2;
  t=1769431142; x=1800967142;
  h=from:to:cc:subject:date:message-id:in-reply-to:
   references:mime-version:content-transfer-encoding;
  bh=6XUIwcXbiaBr356xqYVWHshIWQY9cu+GTe+Phz+8XyY=;
  b=sJr7AKayIj+54K64UO+sz4TeDZD79vf6PmWW9gaNvb1QZHGjcnjepkpa
   8TbiYxTJsWPzdWfqeK5FecAApkuOD58cOkfbT0tWuNYmlVJ3Cs0V+WaAe
   uzClu65Nz5dLyEJSS7zuiRlZsmoMdv98f2UBBRH5l9nOGlPNqIB29JgsD
   +UVs4FrkBPOAopO1vGUGeDTfuVcIWw11w1B406tnrmEGSeFDlaGoPgXaS
   UlJsWxCFsc7CvanalgW0+rlCKkDEA/SY3gW9HQNdLmgUwzCRmBp/GrT/B
   /7wBU0jM3N4qsCveb7lx2YdhX+mDxeam0Fc7JgfmFnKVCF6v0VWQnzIf4
   g==;
X-CSE-ConnectionGUID: 44Nni2VbQ4inPBf2QIbutw==
X-CSE-MsgGUID: FiHW68JHRzOcNTMQlWg+Eg==
X-IronPort-AV: E=McAfee;i="6800,10657,11683"; a="231176039"
X-IronPort-AV: E=Sophos;i="6.21,255,1763391600"; 
   d="scan'208";a="231176039"
Received: from unknown (HELO az2uksmgr4.o.css.fujitsu.com) ([52.151.125.19])
  by esa6.hc1455-7.c3s2.iphmx.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 26 Jan 2026 21:39:00 +0900
Received: from az2uksmgm2.o.css.fujitsu.com (unknown [10.151.22.199])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by az2uksmgr4.o.css.fujitsu.com (Postfix) with ESMTPS id 3B9FBC05C5A
	for <openembedded-core@lists.openembedded.org>; Mon, 26 Jan 2026 12:39:00 +0000 (UTC)
Received: from az2nlsmom3.fujitsu.com (az2nlsmom3.o.css.fujitsu.com [10.150.26.199])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by az2uksmgm2.o.css.fujitsu.com (Postfix) with ESMTPS id DFD8618000E4
	for <openembedded-core@lists.openembedded.org>; Mon, 26 Jan 2026 12:38:59 +0000 (UTC)
Received: from G08FNSTD200057.g08.fujitsu.local (unknown [10.193.128.34])
	by az2nlsmom3.fujitsu.com (Postfix) with ESMTP id 51B33101905D;
	Mon, 26 Jan 2026 12:38:57 +0000 (UTC)
From: Wang Mingyu < wangmy@fujitsu.com>
To: openembedded-core@lists.openembedded.org
Cc: Wang Mingyu <wangmy@fujitsu.com>
Subject: [OE-core] [PATCH 15/17] python3-uv-build: upgrade 0.9.18 -> 0.9.26
Date: Mon, 26 Jan 2026 20:38:42 +0800
Message-ID: <20260126123844.1052-4-wangmy@fujitsu.com>
X-Mailer: git-send-email 2.49.0.windows.1
In-Reply-To: <20260126123844.1052-1-wangmy@fujitsu.com>
References: <20260126123844.1052-1-wangmy@fujitsu.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Mon, 26 Jan 2026 12:39:06 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/229999

From: Wang Mingyu <wangmy@fujitsu.com>

Signed-off-by: Wang Mingyu <wangmy@fujitsu.com>
---
 .../python/python3-uv-build-crates.inc        | 134 +++++++++++-------
 ...d_0.9.18.bb => python3-uv-build_0.9.26.bb} |   2 +-
 2 files changed, 85 insertions(+), 51 deletions(-)
 rename meta/recipes-devtools/python/{python3-uv-build_0.9.18.bb => python3-uv-build_0.9.26.bb} (92%)

diff --git a/meta/recipes-devtools/python/python3-uv-build-crates.inc b/meta/recipes-devtools/python/python3-uv-build-crates.inc
index 6aadd77746..788149e60c 100644
--- a/meta/recipes-devtools/python/python3-uv-build-crates.inc
+++ b/meta/recipes-devtools/python/python3-uv-build-crates.inc
@@ -25,7 +25,7 @@ SRC_URI += " \
     crate://crates.io/assert_fs/1.1.3 \
     crate://crates.io/astral-pubgrub/0.3.3 \
     crate://crates.io/astral-reqwest-middleware/0.4.2 \
-    crate://crates.io/astral-reqwest-retry/0.7.0 \
+    crate://crates.io/astral-reqwest-retry/0.8.0 \
     crate://crates.io/astral-tl/0.7.11 \
     crate://crates.io/astral-tokio-tar/0.5.6 \
     crate://crates.io/astral-version-ranges/0.1.3 \
@@ -46,6 +46,7 @@ SRC_URI += " \
     crate://crates.io/backtrace/0.3.75 \
     crate://crates.io/base64/0.21.7 \
     crate://crates.io/base64/0.22.1 \
+    crate://crates.io/base64ct/1.8.2 \
     crate://crates.io/bisection/0.1.0 \
     crate://crates.io/bitflags/1.3.2 \
     crate://crates.io/bitflags/2.9.4 \
@@ -120,6 +121,7 @@ SRC_URI += " \
     crate://crates.io/data-url/0.2.0 \
     crate://crates.io/deadpool/0.12.3 \
     crate://crates.io/deadpool-runtime/0.1.4 \
+    crate://crates.io/der/0.7.10 \
     crate://crates.io/deranged/0.5.5 \
     crate://crates.io/derive_arbitrary/1.4.1 \
     crate://crates.io/diff/0.1.13 \
@@ -187,7 +189,7 @@ SRC_URI += " \
     crate://crates.io/globwalk/0.9.1 \
     crate://crates.io/gloo-timers/0.3.0 \
     crate://crates.io/goblin/0.10.4 \
-    crate://crates.io/h2/0.4.12 \
+    crate://crates.io/h2/0.4.13 \
     crate://crates.io/half/2.6.0 \
     crate://crates.io/hashbrown/0.14.5 \
     crate://crates.io/hashbrown/0.15.5 \
@@ -205,9 +207,9 @@ SRC_URI += " \
     crate://crates.io/http-content-range/0.2.3 \
     crate://crates.io/httparse/1.10.1 \
     crate://crates.io/httpdate/1.0.3 \
-    crate://crates.io/hyper/1.7.0 \
+    crate://crates.io/hyper/1.8.1 \
     crate://crates.io/hyper-rustls/0.27.7 \
-    crate://crates.io/hyper-util/0.1.16 \
+    crate://crates.io/hyper-util/0.1.19 \
     crate://crates.io/icu_collections/2.0.0 \
     crate://crates.io/icu_locale_core/2.0.0 \
     crate://crates.io/icu_normalizer/2.0.0 \
@@ -224,7 +226,7 @@ SRC_URI += " \
     crate://crates.io/indicatif/0.18.3 \
     crate://crates.io/indoc/2.0.7 \
     crate://crates.io/inout/0.1.4 \
-    crate://crates.io/insta/1.43.2 \
+    crate://crates.io/insta/1.45.0 \
     crate://crates.io/io-uring/0.7.9 \
     crate://crates.io/ipnet/2.11.0 \
     crate://crates.io/iri-string/0.7.8 \
@@ -244,16 +246,17 @@ SRC_URI += " \
     crate://crates.io/jobserver/0.1.33 \
     crate://crates.io/jpeg-decoder/0.3.2 \
     crate://crates.io/js-sys/0.3.77 \
+    crate://crates.io/jsonwebtoken/9.3.1 \
     crate://crates.io/junction/1.2.0 \
     crate://crates.io/kurbo/0.8.3 \
     crate://crates.io/kurbo/0.9.5 \
     crate://crates.io/lazy_static/1.5.0 \
-    crate://crates.io/libc/0.2.175 \
+    crate://crates.io/libc/0.2.178 \
+    crate://crates.io/libm/0.2.15 \
     crate://crates.io/libmimalloc-sys/0.1.44 \
     crate://crates.io/libredox/0.1.6 \
     crate://crates.io/libz-rs-sys/0.5.1 \
-    crate://crates.io/linux-raw-sys/0.4.15 \
-    crate://crates.io/linux-raw-sys/0.9.4 \
+    crate://crates.io/linux-raw-sys/0.11.0 \
     crate://crates.io/litemap/0.8.0 \
     crate://crates.io/lock_api/0.4.13 \
     crate://crates.io/log/0.4.27 \
@@ -274,7 +277,7 @@ SRC_URI += " \
     crate://crates.io/mime/0.3.17 \
     crate://crates.io/mime_guess/2.0.5 \
     crate://crates.io/miniz_oxide/0.8.9 \
-    crate://crates.io/mio/1.0.4 \
+    crate://crates.io/mio/1.1.0 \
     crate://crates.io/miow/0.6.1 \
     crate://crates.io/munge/0.4.5 \
     crate://crates.io/munge_macro/0.4.5 \
@@ -284,6 +287,7 @@ SRC_URI += " \
     crate://crates.io/nu-ansi-term/0.50.1 \
     crate://crates.io/num/0.4.3 \
     crate://crates.io/num-bigint/0.4.6 \
+    crate://crates.io/num-bigint-dig/0.8.6 \
     crate://crates.io/num-complex/0.4.6 \
     crate://crates.io/num-conv/0.1.0 \
     crate://crates.io/num-integer/0.1.46 \
@@ -311,7 +315,9 @@ SRC_URI += " \
     crate://crates.io/paste/1.0.15 \
     crate://crates.io/path-slash/0.2.1 \
     crate://crates.io/pathdiff/0.2.3 \
+    crate://crates.io/pbkdf2/0.12.2 \
     crate://crates.io/pem/3.0.6 \
+    crate://crates.io/pem-rfc7468/0.7.0 \
     crate://crates.io/percent-encoding/2.3.2 \
     crate://crates.io/pest/2.8.1 \
     crate://crates.io/pest_derive/2.8.1 \
@@ -323,6 +329,9 @@ SRC_URI += " \
     crate://crates.io/pin-project-internal/1.1.10 \
     crate://crates.io/pin-project-lite/0.2.16 \
     crate://crates.io/pin-utils/0.1.0 \
+    crate://crates.io/pkcs1/0.7.5 \
+    crate://crates.io/pkcs5/0.7.1 \
+    crate://crates.io/pkcs8/0.10.2 \
     crate://crates.io/pkg-config/0.3.32 \
     crate://crates.io/plain/0.2.3 \
     crate://crates.io/png/0.17.16 \
@@ -339,8 +348,8 @@ SRC_URI += " \
     crate://crates.io/priority-queue/2.5.0 \
     crate://crates.io/proc-macro-crate/3.3.0 \
     crate://crates.io/proc-macro2/1.0.103 \
-    crate://crates.io/procfs/0.17.0 \
-    crate://crates.io/procfs-core/0.17.0 \
+    crate://crates.io/procfs/0.18.0 \
+    crate://crates.io/procfs-core/0.18.0 \
     crate://crates.io/ptr_meta/0.3.0 \
     crate://crates.io/ptr_meta_derive/0.3.0 \
     crate://crates.io/purl/0.1.6 \
@@ -367,7 +376,7 @@ SRC_URI += " \
     crate://crates.io/ref-cast/1.0.25 \
     crate://crates.io/ref-cast-impl/1.0.25 \
     crate://crates.io/reflink-copy/0.1.28 \
-    crate://crates.io/regex/1.11.2 \
+    crate://crates.io/regex/1.12.2 \
     crate://crates.io/regex-automata/0.4.13 \
     crate://crates.io/regex-syntax/0.8.5 \
     crate://crates.io/rend/0.5.2 \
@@ -376,10 +385,11 @@ SRC_URI += " \
     crate://crates.io/reqsign-command-execute-tokio/2.0.1 \
     crate://crates.io/reqsign-core/2.0.1 \
     crate://crates.io/reqsign-file-read-tokio/2.0.1 \
+    crate://crates.io/reqsign-google/2.0.1 \
     crate://crates.io/reqsign-http-send-reqwest/2.0.1 \
     crate://crates.io/reqwest/0.12.22 \
     crate://crates.io/resvg/0.29.0 \
-    crate://crates.io/retry-policies/0.4.0 \
+    crate://crates.io/retry-policies/0.5.1 \
     crate://crates.io/rgb/0.8.52 \
     crate://crates.io/ring/0.17.14 \
     crate://crates.io/rkyv/0.8.12 \
@@ -389,12 +399,12 @@ SRC_URI += " \
     crate://crates.io/rosvgtree/0.1.0 \
     crate://crates.io/roxmltree/0.18.1 \
     crate://crates.io/roxmltree/0.20.0 \
+    crate://crates.io/rsa/0.9.9 \
     crate://crates.io/rust-ini/0.21.3 \
     crate://crates.io/rust-netrc/0.1.2 \
     crate://crates.io/rustc-demangle/0.1.25 \
     crate://crates.io/rustc-hash/2.1.1 \
-    crate://crates.io/rustix/0.38.44 \
-    crate://crates.io/rustix/1.0.8 \
+    crate://crates.io/rustix/1.1.3 \
     crate://crates.io/rustls/0.23.35 \
     crate://crates.io/rustls-native-certs/0.8.2 \
     crate://crates.io/rustls-pki-types/1.12.0 \
@@ -402,6 +412,7 @@ SRC_URI += " \
     crate://crates.io/rustversion/1.0.21 \
     crate://crates.io/rustybuzz/0.7.0 \
     crate://crates.io/ryu/1.0.20 \
+    crate://crates.io/salsa20/0.10.2 \
     crate://crates.io/same-file/1.0.6 \
     crate://crates.io/schannel/0.1.27 \
     crate://crates.io/schemars/1.0.5 \
@@ -409,6 +420,7 @@ SRC_URI += " \
     crate://crates.io/scopeguard/1.2.0 \
     crate://crates.io/scroll/0.13.0 \
     crate://crates.io/scroll_derive/0.13.0 \
+    crate://crates.io/scrypt/0.11.0 \
     crate://crates.io/seahash/4.1.0 \
     crate://crates.io/secrecy/0.10.3 \
     crate://crates.io/secret-service/5.0.0 \
@@ -421,9 +433,9 @@ SRC_URI += " \
     crate://crates.io/serde_core/1.0.228 \
     crate://crates.io/serde_derive/1.0.228 \
     crate://crates.io/serde_derive_internals/0.29.1 \
-    crate://crates.io/serde_json/1.0.145 \
+    crate://crates.io/serde_json/1.0.147 \
     crate://crates.io/serde_repr/0.1.20 \
-    crate://crates.io/serde_spanned/1.0.3 \
+    crate://crates.io/serde_spanned/1.0.4 \
     crate://crates.io/serde_urlencoded/0.7.1 \
     crate://crates.io/serde_yaml/0.9.34+deprecated \
     crate://crates.io/sha1/0.10.6 \
@@ -433,9 +445,11 @@ SRC_URI += " \
     crate://crates.io/shellexpand/3.1.1 \
     crate://crates.io/shlex/1.3.0 \
     crate://crates.io/signal-hook-registry/1.4.5 \
+    crate://crates.io/signature/2.2.0 \
     crate://crates.io/simd-adler32/0.3.7 \
     crate://crates.io/simdutf8/0.1.5 \
     crate://crates.io/similar/2.7.0 \
+    crate://crates.io/simple_asn1/0.6.3 \
     crate://crates.io/simplecss/0.2.2 \
     crate://crates.io/siphasher/0.3.11 \
     crate://crates.io/slab/0.4.11 \
@@ -444,7 +458,9 @@ SRC_URI += " \
     crate://crates.io/socket2/0.5.10 \
     crate://crates.io/socket2/0.6.0 \
     crate://crates.io/spdx/0.10.9 \
-    crate://crates.io/spdx/0.13.2 \
+    crate://crates.io/spdx/0.13.3 \
+    crate://crates.io/spin/0.9.8 \
+    crate://crates.io/spki/0.7.3 \
     crate://crates.io/stable_deref_trait/1.2.0 \
     crate://crates.io/static_assertions/1.1.0 \
     crate://crates.io/statrs/0.18.0 \
@@ -470,7 +486,7 @@ SRC_URI += " \
     crate://crates.io/tar/0.4.44 \
     crate://crates.io/target-lexicon/0.13.3 \
     crate://crates.io/temp-env/0.3.6 \
-    crate://crates.io/tempfile/3.20.0 \
+    crate://crates.io/tempfile/3.24.0 \
     crate://crates.io/terminal_size/0.4.2 \
     crate://crates.io/termtree/0.5.1 \
     crate://crates.io/test-case/3.3.1 \
@@ -501,13 +517,13 @@ SRC_URI += " \
     crate://crates.io/tokio-rustls/0.26.2 \
     crate://crates.io/tokio-stream/0.1.17 \
     crate://crates.io/tokio-util/0.7.17 \
-    crate://crates.io/toml/0.9.8 \
+    crate://crates.io/toml/0.9.10+spec-1.1.0 \
     crate://crates.io/toml_datetime/0.6.11 \
-    crate://crates.io/toml_datetime/0.7.3 \
+    crate://crates.io/toml_datetime/0.7.5+spec-1.1.0 \
     crate://crates.io/toml_edit/0.22.27 \
-    crate://crates.io/toml_edit/0.23.7 \
-    crate://crates.io/toml_parser/1.0.4 \
-    crate://crates.io/toml_writer/1.0.4 \
+    crate://crates.io/toml_edit/0.24.0+spec-1.1.0 \
+    crate://crates.io/toml_parser/1.0.6+spec-1.1.0 \
+    crate://crates.io/toml_writer/1.0.6+spec-1.1.0 \
     crate://crates.io/tower/0.5.2 \
     crate://crates.io/tower-http/0.6.6 \
     crate://crates.io/tower-layer/0.3.3 \
@@ -550,7 +566,7 @@ SRC_URI += " \
     crate://crates.io/utf8-width/0.1.7 \
     crate://crates.io/utf8_iter/1.0.4 \
     crate://crates.io/utf8parse/0.2.2 \
-    crate://crates.io/uuid/1.17.0 \
+    crate://crates.io/uuid/1.19.0 \
     crate://crates.io/valuable/0.1.1 \
     crate://crates.io/version_check/0.9.5 \
     crate://crates.io/wait-timeout/0.2.1 \
@@ -644,6 +660,7 @@ SRC_URI += " \
     crate://crates.io/zerovec-derive/0.11.1 \
     crate://crates.io/zip/2.4.2 \
     crate://crates.io/zlib-rs/0.5.1 \
+    crate://crates.io/zmij/0.1.11 \
     crate://crates.io/zopfli/0.8.2 \
     crate://crates.io/zstd/0.13.3 \
     crate://crates.io/zstd-safe/7.2.4 \
@@ -676,7 +693,7 @@ SRC_URI[assert_cmd-2.0.17.sha256sum] = "2bd389a4b2970a01282ee455294913c0a43724da
 SRC_URI[assert_fs-1.1.3.sha256sum] = "a652f6cb1f516886fcfee5e7a5c078b9ade62cfcb889524efe5a64d682dd27a9"
 SRC_URI[astral-pubgrub-0.3.3.sha256sum] = "d6cb15b4f5096a3a1b41fdc2736a1c33d87c78f34d3c1ec2b669e766edadd559"
 SRC_URI[astral-reqwest-middleware-0.4.2.sha256sum] = "638d02e24aeb92f9537897cd1ff82e2bc98fd9ac9575a503e27bb07cdf64d4d7"
-SRC_URI[astral-reqwest-retry-0.7.0.sha256sum] = "cb7549bd00f62f73f2e7e76f3f77ccdabb31873f4f02f758ed88ad739d522867"
+SRC_URI[astral-reqwest-retry-0.8.0.sha256sum] = "78ab210f6cdf8fd3254d47e5ee27ce60ed34a428ff71b4ae9477b1c84b49498c"
 SRC_URI[astral-tl-0.7.11.sha256sum] = "d90933ffb0f97e2fc2e0de21da9d3f20597b804012d199843a6fe7c2810d28f3"
 SRC_URI[astral-tokio-tar-0.5.6.sha256sum] = "ec179a06c1769b1e42e1e2cbe74c7dcdb3d6383c838454d063eaac5bbb7ebbe5"
 SRC_URI[astral-version-ranges-0.1.3.sha256sum] = "e7adc2308a566fab9de02bc0e05d18c5a21cb0e793684e4f64c8eb956969b074"
@@ -697,6 +714,7 @@ SRC_URI[backon-1.5.2.sha256sum] = "592277618714fbcecda9a02ba7a8781f319d26532a885
 SRC_URI[backtrace-0.3.75.sha256sum] = "6806a6321ec58106fea15becdad98371e28d92ccbc7c8f1b3b6dd724fe8f1002"
 SRC_URI[base64-0.21.7.sha256sum] = "9d297deb1925b89f2ccc13d7635fa0714f12c87adce1c75356b39ca9b7178567"
 SRC_URI[base64-0.22.1.sha256sum] = "72b3254f16251a8381aa12e40e3c4d2f0199f8c6508fbecb9d91f575e0fbb8c6"
+SRC_URI[base64ct-1.8.2.sha256sum] = "7d809780667f4410e7c41b07f52439b94d2bdf8528eeedc287fa38d3b7f95d82"
 SRC_URI[bisection-0.1.0.sha256sum] = "021e079a1bab0ecce6cf4b4b74c0c37afa4a697136eb3b127875c84a8f04a8c3"
 SRC_URI[bitflags-1.3.2.sha256sum] = "bef38d45163c2f1dde094a7dfd33ccf595c92905c8f8f4fdc18d06fb1037718a"
 SRC_URI[bitflags-2.9.4.sha256sum] = "2261d10cca569e4643e526d8dc2e62e433cc8aba21ab764233731f8d369bf394"
@@ -771,6 +789,7 @@ SRC_URI[data-encoding-2.9.0.sha256sum] = "2a2330da5de22e8a3cb63252ce2abb30116bf5
 SRC_URI[data-url-0.2.0.sha256sum] = "8d7439c3735f405729d52c3fbbe4de140eaf938a1fe47d227c27f8254d4302a5"
 SRC_URI[deadpool-0.12.3.sha256sum] = "0be2b1d1d6ec8d846f05e137292d0b89133caf95ef33695424c09568bdd39b1b"
 SRC_URI[deadpool-runtime-0.1.4.sha256sum] = "092966b41edc516079bdf31ec78a2e0588d1d0c08f78b91d8307215928642b2b"
+SRC_URI[der-0.7.10.sha256sum] = "e7c1832837b905bbfb5101e07cc24c8deddf52f93225eee6ead5f4d63d53ddcb"
 SRC_URI[deranged-0.5.5.sha256sum] = "ececcb659e7ba858fb4f10388c250a7252eb0a27373f1a72b8748afdd248e587"
 SRC_URI[derive_arbitrary-1.4.1.sha256sum] = "30542c1ad912e0e3d22a1935c290e12e8a29d704a420177a31faad4a601a0800"
 SRC_URI[diff-0.1.13.sha256sum] = "56254986775e3233ffa9c4d7d3faaf6d36a2c09d30b20687e9f88bc8bafc16c8"
@@ -838,7 +857,7 @@ SRC_URI[globset-0.4.18.sha256sum] = "52dfc19153a48bde0cbd630453615c8151bce3a5adf
 SRC_URI[globwalk-0.9.1.sha256sum] = "0bf760ebf69878d9fd8f110c89703d90ce35095324d1f1edcb595c63945ee757"
 SRC_URI[gloo-timers-0.3.0.sha256sum] = "bbb143cf96099802033e0d4f4963b19fd2e0b728bcf076cd9cf7f6634f092994"
 SRC_URI[goblin-0.10.4.sha256sum] = "4db6758c546e6f81f265638c980e5e84dfbda80cfd8e89e02f83454c8e8124bd"
-SRC_URI[h2-0.4.12.sha256sum] = "f3c0b69cfcb4e1b9f1bf2f53f95f766e4661169728ec61cd3fe5a0166f2d1386"
+SRC_URI[h2-0.4.13.sha256sum] = "2f44da3a8150a6703ed5d34e164b875fd14c2cdab9af1252a9a1020bde2bdc54"
 SRC_URI[half-2.6.0.sha256sum] = "459196ed295495a68f7d7fe1d84f6c4b7ff0e21fe3017b2f283c6fac3ad803c9"
 SRC_URI[hashbrown-0.14.5.sha256sum] = "e5274423e17b7c9fc20b6e7e208532f9b19825d82dfd615708b70edd83df41f1"
 SRC_URI[hashbrown-0.15.5.sha256sum] = "9229cfe53dfd69f0609a49f65461bd93001ea1ef889cd5529dd176593f5338a1"
@@ -856,9 +875,9 @@ SRC_URI[http-body-util-0.1.3.sha256sum] = "b021d93e26becf5dc7e1b75b1bed1fd93124b
 SRC_URI[http-content-range-0.2.3.sha256sum] = "63f67baaf67a9ae8fae78ecee69294d552b764dbcd6f8735d0a9c9be20ab0c82"
 SRC_URI[httparse-1.10.1.sha256sum] = "6dbf3de79e51f3d586ab4cb9d5c3e2c14aa28ed23d180cf89b4df0454a69cc87"
 SRC_URI[httpdate-1.0.3.sha256sum] = "df3b46402a9d5adb4c86a0cf463f42e19994e3ee891101b1841f30a545cb49a9"
-SRC_URI[hyper-1.7.0.sha256sum] = "eb3aa54a13a0dfe7fbe3a59e0c76093041720fdc77b110cc0fc260fafb4dc51e"
+SRC_URI[hyper-1.8.1.sha256sum] = "2ab2d4f250c3d7b1c9fcdff1cece94ea4e2dfbec68614f7b87cb205f24ca9d11"
 SRC_URI[hyper-rustls-0.27.7.sha256sum] = "e3c93eb611681b207e1fe55d5a71ecf91572ec8a6705cdb6857f7d8d5242cf58"
-SRC_URI[hyper-util-0.1.16.sha256sum] = "8d9b05277c7e8da2c93a568989bb6207bef0112e8d17df7a6eda4a3cf143bc5e"
+SRC_URI[hyper-util-0.1.19.sha256sum] = "727805d60e7938b76b826a6ef209eb70eaa1812794f9424d4a4e2d740662df5f"
 SRC_URI[icu_collections-2.0.0.sha256sum] = "200072f5d0e3614556f94a9930d5dc3e0662a652823904c3a75dc3b0af7fee47"
 SRC_URI[icu_locale_core-2.0.0.sha256sum] = "0cde2700ccaed3872079a65fb1a78f6c0a36c91570f28755dda67bc8f7d9f00a"
 SRC_URI[icu_normalizer-2.0.0.sha256sum] = "436880e8e18df4d7bbc06d58432329d6458cc84531f7ac5f024e93deadb37979"
@@ -875,7 +894,7 @@ SRC_URI[indexmap-2.12.1.sha256sum] = "0ad4bb2b565bca0645f4d68c5c9af97fba094e9791
 SRC_URI[indicatif-0.18.3.sha256sum] = "9375e112e4b463ec1b1c6c011953545c65a30164fbab5b581df32b3abf0dcb88"
 SRC_URI[indoc-2.0.7.sha256sum] = "79cf5c93f93228cf8efb3ba362535fb11199ac548a09ce117c9b1adc3030d706"
 SRC_URI[inout-0.1.4.sha256sum] = "879f10e63c20629ecabbb64a8010319738c66a5cd0c29b02d63d272b03751d01"
-SRC_URI[insta-1.43.2.sha256sum] = "46fdb647ebde000f43b5b53f773c30cf9b0cb4300453208713fa38b2c70935a0"
+SRC_URI[insta-1.45.0.sha256sum] = "b76866be74d68b1595eb8060cb9191dca9c021db2316558e52ddc5d55d41b66c"
 SRC_URI[io-uring-0.7.9.sha256sum] = "d93587f37623a1a17d94ef2bc9ada592f5465fe7732084ab7beefabe5c77c0c4"
 SRC_URI[ipnet-2.11.0.sha256sum] = "469fb0b9cefa57e3ef31275ee7cacb78f2fdca44e4765491884a2b119d4eb130"
 SRC_URI[iri-string-0.7.8.sha256sum] = "dbc5ebe9c3a1a7a5127f920a418f7585e9e758e911d0466ed004f393b0e380b2"
@@ -895,16 +914,17 @@ SRC_URI[jiff-tzdb-platform-0.1.3.sha256sum] = "875a5a69ac2bab1a891711cf5eccbec1c
 SRC_URI[jobserver-0.1.33.sha256sum] = "38f262f097c174adebe41eb73d66ae9c06b2844fb0da69969647bbddd9b0538a"
 SRC_URI[jpeg-decoder-0.3.2.sha256sum] = "00810f1d8b74be64b13dbf3db89ac67740615d6c891f0e7b6179326533011a07"
 SRC_URI[js-sys-0.3.77.sha256sum] = "1cfaf33c695fc6e08064efbc1f72ec937429614f25eef83af942d0e227c3a28f"
+SRC_URI[jsonwebtoken-9.3.1.sha256sum] = "5a87cc7a48537badeae96744432de36f4be2b4a34a05a5ef32e9dd8a1c169dde"
 SRC_URI[junction-1.2.0.sha256sum] = "72bbdfd737a243da3dfc1f99ee8d6e166480f17ab4ac84d7c34aacd73fc7bd16"
 SRC_URI[kurbo-0.8.3.sha256sum] = "7a53776d271cfb873b17c618af0298445c88afc52837f3e948fa3fafd131f449"
 SRC_URI[kurbo-0.9.5.sha256sum] = "bd85a5776cd9500c2e2059c8c76c3b01528566b7fcbaf8098b55a33fc298849b"
 SRC_URI[lazy_static-1.5.0.sha256sum] = "bbd2bcb4c963f2ddae06a2efc7e9f3591312473c50c6685e1f298068316e66fe"
-SRC_URI[libc-0.2.175.sha256sum] = "6a82ae493e598baaea5209805c49bbf2ea7de956d50d7da0da1164f9c6d28543"
+SRC_URI[libc-0.2.178.sha256sum] = "37c93d8daa9d8a012fd8ab92f088405fb202ea0b6ab73ee2482ae66af4f42091"
+SRC_URI[libm-0.2.15.sha256sum] = "f9fbbcab51052fe104eb5e5d351cf728d30a5be1fe14d9be8a3b097481fb97de"
 SRC_URI[libmimalloc-sys-0.1.44.sha256sum] = "667f4fec20f29dfc6bc7357c582d91796c169ad7e2fce709468aefeb2c099870"
 SRC_URI[libredox-0.1.6.sha256sum] = "4488594b9328dee448adb906d8b126d9b7deb7cf5c22161ee591610bb1be83c0"
 SRC_URI[libz-rs-sys-0.5.1.sha256sum] = "172a788537a2221661b480fee8dc5f96c580eb34fa88764d3205dc356c7e4221"
-SRC_URI[linux-raw-sys-0.4.15.sha256sum] = "d26c52dbd32dccf2d10cac7725f8eae5296885fb5703b261f7d0a0739ec807ab"
-SRC_URI[linux-raw-sys-0.9.4.sha256sum] = "cd945864f07fe9f5371a27ad7b52a172b4b499999f1d97574c9fa68373937e12"
+SRC_URI[linux-raw-sys-0.11.0.sha256sum] = "df1d3c3b53da64cf5760482273a98e575c651a67eec7f77df96b5b642de8f039"
 SRC_URI[litemap-0.8.0.sha256sum] = "241eaef5fd12c88705a01fc1066c48c4b36e0dd4377dcdc7ec3942cea7a69956"
 SRC_URI[lock_api-0.4.13.sha256sum] = "96936507f153605bddfcda068dd804796c84324ed2510809e5b2a624c81da765"
 SRC_URI[log-0.4.27.sha256sum] = "13dc2df351e3202783a1fe0d44375f7295ffb4049267b0f3018346dc122a1d94"
@@ -925,7 +945,7 @@ SRC_URI[mimalloc-0.1.48.sha256sum] = "e1ee66a4b64c74f4ef288bcbb9192ad9c3feaad751
 SRC_URI[mime-0.3.17.sha256sum] = "6877bb514081ee2a7ff5ef9de3281f14a4dd4bceac4c09388074a6b5df8a139a"
 SRC_URI[mime_guess-2.0.5.sha256sum] = "f7c44f8e672c00fe5308fa235f821cb4198414e1c77935c1ab6948d3fd78550e"
 SRC_URI[miniz_oxide-0.8.9.sha256sum] = "1fa76a2c86f704bdb222d66965fb3d63269ce38518b83cb0575fca855ebb6316"
-SRC_URI[mio-1.0.4.sha256sum] = "78bed444cc8a2160f01cbcf811ef18cac863ad68ae8ca62092e8db51d51c761c"
+SRC_URI[mio-1.1.0.sha256sum] = "69d83b0086dc8ecf3ce9ae2874b2d1290252e2a30720bea58a5c6639b0092873"
 SRC_URI[miow-0.6.1.sha256sum] = "536bfad37a309d62069485248eeaba1e8d9853aaf951caaeaed0585a95346f08"
 SRC_URI[munge-0.4.5.sha256sum] = "9cce144fab80fbb74ec5b89d1ca9d41ddf6b644ab7e986f7d3ed0aab31625cb1"
 SRC_URI[munge_macro-0.4.5.sha256sum] = "574af9cd5b9971cbfdf535d6a8d533778481b241c447826d976101e0149392a1"
@@ -935,6 +955,7 @@ SRC_URI[normalize-line-endings-0.3.0.sha256sum] = "61807f77802ff30975e01f4f071c8
 SRC_URI[nu-ansi-term-0.50.1.sha256sum] = "d4a28e057d01f97e61255210fcff094d74ed0466038633e95017f5beb68e4399"
 SRC_URI[num-0.4.3.sha256sum] = "35bd024e8b2ff75562e5f34e7f4905839deb4b22955ef5e73d2fea1b9813cb23"
 SRC_URI[num-bigint-0.4.6.sha256sum] = "a5e44f723f1133c9deac646763579fdb3ac745e418f2a7af9cd0c431da1f20b9"
+SRC_URI[num-bigint-dig-0.8.6.sha256sum] = "e661dda6640fad38e827a6d4a310ff4763082116fe217f279885c97f511bb0b7"
 SRC_URI[num-complex-0.4.6.sha256sum] = "73f88a1307638156682bada9d7604135552957b7818057dcef22705b4d509495"
 SRC_URI[num-conv-0.1.0.sha256sum] = "51d515d32fb182ee37cda2ccdcb92950d6a3c2893aa280e540671c2cd0f3b1d9"
 SRC_URI[num-integer-0.1.46.sha256sum] = "7969661fd2958a5cb096e56c8e1ad0444ac2bbcd0061bd28660485a44879858f"
@@ -962,7 +983,9 @@ SRC_URI[parking_lot_core-0.9.11.sha256sum] = "bc838d2a56b5b1a6c25f55575dfc605fab
 SRC_URI[paste-1.0.15.sha256sum] = "57c0d7b74b563b49d38dae00a0c37d4d6de9b432382b2892f0574ddcae73fd0a"
 SRC_URI[path-slash-0.2.1.sha256sum] = "1e91099d4268b0e11973f036e885d652fb0b21fedcf69738c627f94db6a44f42"
 SRC_URI[pathdiff-0.2.3.sha256sum] = "df94ce210e5bc13cb6651479fa48d14f601d9858cfe0467f43ae157023b938d3"
+SRC_URI[pbkdf2-0.12.2.sha256sum] = "f8ed6a7761f76e3b9f92dfb0a60a6a6477c61024b775147ff0973a02653abaf2"
 SRC_URI[pem-3.0.6.sha256sum] = "1d30c53c26bc5b31a98cd02d20f25a7c8567146caf63ed593a9d87b2775291be"
+SRC_URI[pem-rfc7468-0.7.0.sha256sum] = "88b39c9bfcfc231068454382784bb460aae594343fb030d46e9f50a645418412"
 SRC_URI[percent-encoding-2.3.2.sha256sum] = "9b4f627cb1b25917193a259e49bdad08f671f8d9708acfd5fe0a8c1455d87220"
 SRC_URI[pest-2.8.1.sha256sum] = "1db05f56d34358a8b1066f67cbb203ee3e7ed2ba674a6263a1d5ec6db2204323"
 SRC_URI[pest_derive-2.8.1.sha256sum] = "bb056d9e8ea77922845ec74a1c4e8fb17e7c218cc4fc11a15c5d25e189aa40bc"
@@ -974,6 +997,9 @@ SRC_URI[pin-project-1.1.10.sha256sum] = "677f1add503faace112b9f1373e43e9e054bfdd
 SRC_URI[pin-project-internal-1.1.10.sha256sum] = "6e918e4ff8c4549eb882f14b3a4bc8c8bc93de829416eacf579f1207a8fbf861"
 SRC_URI[pin-project-lite-0.2.16.sha256sum] = "3b3cff922bd51709b605d9ead9aa71031d81447142d828eb4a6eba76fe619f9b"
 SRC_URI[pin-utils-0.1.0.sha256sum] = "8b870d8c151b6f2fb93e84a13146138f05d02ed11c7e7c54f8826aaaf7c9f184"
+SRC_URI[pkcs1-0.7.5.sha256sum] = "c8ffb9f10fa047879315e6625af03c164b16962a5368d724ed16323b68ace47f"
+SRC_URI[pkcs5-0.7.1.sha256sum] = "e847e2c91a18bfa887dd028ec33f2fe6f25db77db3619024764914affe8b69a6"
+SRC_URI[pkcs8-0.10.2.sha256sum] = "f950b2377845cebe5cf8b5165cb3cc1a5e0fa5cfa3e1f7f55707d8fd82e0a7b7"
 SRC_URI[pkg-config-0.3.32.sha256sum] = "7edddbd0b52d732b21ad9a5fab5c704c14cd949e5e9a1ec5929a24fded1b904c"
 SRC_URI[plain-0.2.3.sha256sum] = "b4596b6d070b27117e987119b4dac604f3c58cfb0b191112e24771b2faeac1a6"
 SRC_URI[png-0.17.16.sha256sum] = "82151a2fc869e011c153adc57cf2789ccb8d9906ce52c0b39a6b5697749d7526"
@@ -990,8 +1016,8 @@ SRC_URI[pretty_assertions-1.4.1.sha256sum] = "3ae130e2f271fbc2ac3a40fb1d07180839
 SRC_URI[priority-queue-2.5.0.sha256sum] = "5676d703dda103cbb035b653a9f11448c0a7216c7926bd35fcb5865475d0c970"
 SRC_URI[proc-macro-crate-3.3.0.sha256sum] = "edce586971a4dfaa28950c6f18ed55e0406c1ab88bbce2c6f6293a7aaba73d35"
 SRC_URI[proc-macro2-1.0.103.sha256sum] = "5ee95bc4ef87b8d5ba32e8b7714ccc834865276eab0aed5c9958d00ec45f49e8"
-SRC_URI[procfs-0.17.0.sha256sum] = "cc5b72d8145275d844d4b5f6d4e1eef00c8cd889edb6035c21675d1bb1f45c9f"
-SRC_URI[procfs-core-0.17.0.sha256sum] = "239df02d8349b06fc07398a3a1697b06418223b1c7725085e801e7c0fc6a12ec"
+SRC_URI[procfs-0.18.0.sha256sum] = "25485360a54d6861439d60facef26de713b1e126bf015ec8f98239467a2b82f7"
+SRC_URI[procfs-core-0.18.0.sha256sum] = "e6401bf7b6af22f78b563665d15a22e9aef27775b79b149a66ca022468a4e405"
 SRC_URI[ptr_meta-0.3.0.sha256sum] = "fe9e76f66d3f9606f44e45598d155cb13ecf09f4a28199e48daf8c8fc937ea90"
 SRC_URI[ptr_meta_derive-0.3.0.sha256sum] = "ca414edb151b4c8d125c12566ab0d74dc9cdba36fb80eb7b848c15f495fd32d1"
 SRC_URI[purl-0.1.6.sha256sum] = "60ebe4262ae91ddd28c8721111a0a6e9e58860e211fc92116c4bb85c98fd96ad"
@@ -1018,7 +1044,7 @@ SRC_URI[redox_users-0.5.0.sha256sum] = "dd6f9d3d47bdd2ad6945c5015a226ec6155d0bcd
 SRC_URI[ref-cast-1.0.25.sha256sum] = "f354300ae66f76f1c85c5f84693f0ce81d747e2c3f21a45fef496d89c960bf7d"
 SRC_URI[ref-cast-impl-1.0.25.sha256sum] = "b7186006dcb21920990093f30e3dea63b7d6e977bf1256be20c3563a5db070da"
 SRC_URI[reflink-copy-0.1.28.sha256sum] = "23bbed272e39c47a095a5242218a67412a220006842558b03fe2935e8f3d7b92"
-SRC_URI[regex-1.11.2.sha256sum] = "23d7fd106d8c02486a8d64e778353d1cffe08ce79ac2e82f540c86d0facf6912"
+SRC_URI[regex-1.12.2.sha256sum] = "843bc0191f75f3e22651ae5f1e72939ab2f72a4bc30fa80a066bd66edefc24d4"
 SRC_URI[regex-automata-0.4.13.sha256sum] = "5276caf25ac86c8d810222b3dbb938e512c55c6831a10f3e6ed1c93b84041f1c"
 SRC_URI[regex-syntax-0.8.5.sha256sum] = "2b15c43186be67a4fd63bee50d0303afffcef381492ebe2c5d87f324e1b8815c"
 SRC_URI[rend-0.5.2.sha256sum] = "a35e8a6bf28cd121053a66aa2e6a2e3eaffad4a60012179f0e864aa5ffeff215"
@@ -1027,10 +1053,11 @@ SRC_URI[reqsign-aws-v4-2.0.1.sha256sum] = "4510c2a3e42b653cf788d560a3d54b0ae4cc3
 SRC_URI[reqsign-command-execute-tokio-2.0.1.sha256sum] = "38b53d033600f533135afec8e97be99c80fcf8177f6285da6c7300955d5377a1"
 SRC_URI[reqsign-core-2.0.1.sha256sum] = "39da118ccf3bdb067ac6cc40136fec99bc5ba418cbd388dc88e4ce0e5d0b1423"
 SRC_URI[reqsign-file-read-tokio-2.0.1.sha256sum] = "669ea66036266a9ac371d2e63cc7d345e69994da0168b4e6f3487fe21e126f76"
+SRC_URI[reqsign-google-2.0.1.sha256sum] = "16e1942acf06b8638f16775e92e4ca9cca239519ea6f4e650d5924d1f0dc37d1"
 SRC_URI[reqsign-http-send-reqwest-2.0.1.sha256sum] = "46186bce769674f9200ad01af6f2ca42de3e819ddc002fff1edae135bfb6cd9c"
 SRC_URI[reqwest-0.12.22.sha256sum] = "cbc931937e6ca3a06e3b6c0aa7841849b160a90351d6ab467a8b9b9959767531"
 SRC_URI[resvg-0.29.0.sha256sum] = "76888219c0881e22b0ceab06fddcfe83163cd81642bd60c7842387f9c968a72e"
-SRC_URI[retry-policies-0.4.0.sha256sum] = "5875471e6cab2871bc150ecb8c727db5113c9338cc3354dc5ee3425b6aa40a1c"
+SRC_URI[retry-policies-0.5.1.sha256sum] = "46a4bd6027df676bcb752d3724db0ea3c0c5fc1dd0376fec51ac7dcaf9cc69be"
 SRC_URI[rgb-0.8.52.sha256sum] = "0c6a884d2998352bb4daf0183589aec883f16a6da1f4dde84d8e2e9a5409a1ce"
 SRC_URI[ring-0.17.14.sha256sum] = "a4689e6c2294d81e88dc6261c768b63bc4fcdb852be6d1352498b114f61383b7"
 SRC_URI[rkyv-0.8.12.sha256sum] = "35a640b26f007713818e9a9b65d34da1cf58538207b052916a83d80e43f3ffa4"
@@ -1040,12 +1067,12 @@ SRC_URI[rmp-serde-1.3.0.sha256sum] = "52e599a477cf9840e92f2cde9a7189e67b42c57532
 SRC_URI[rosvgtree-0.1.0.sha256sum] = "bdc23d1ace03d6b8153c7d16f0708cd80b61ee8e80304954803354e67e40d150"
 SRC_URI[roxmltree-0.18.1.sha256sum] = "862340e351ce1b271a378ec53f304a5558f7db87f3769dc655a8f6ecbb68b302"
 SRC_URI[roxmltree-0.20.0.sha256sum] = "6c20b6793b5c2fa6553b250154b78d6d0db37e72700ae35fad9387a46f487c97"
+SRC_URI[rsa-0.9.9.sha256sum] = "40a0376c50d0358279d9d643e4bf7b7be212f1f4ff1da9070a7b54d22ef75c88"
 SRC_URI[rust-ini-0.21.3.sha256sum] = "796e8d2b6696392a43bea58116b667fb4c29727dc5abd27d6acf338bb4f688c7"
 SRC_URI[rust-netrc-0.1.2.sha256sum] = "7e98097f62769f92dbf95fb51f71c0a68ec18a4ee2e70e0d3e4f47ac005d63e9"
 SRC_URI[rustc-demangle-0.1.25.sha256sum] = "989e6739f80c4ad5b13e0fd7fe89531180375b18520cc8c82080e4dc4035b84f"
 SRC_URI[rustc-hash-2.1.1.sha256sum] = "357703d41365b4b27c590e3ed91eabb1b663f07c4c084095e60cbed4362dff0d"
-SRC_URI[rustix-0.38.44.sha256sum] = "fdb5bc1ae2baa591800df16c9ca78619bf65c0488b41b96ccec5d11220d8c154"
-SRC_URI[rustix-1.0.8.sha256sum] = "11181fbabf243db407ef8df94a6ce0b2f9a733bd8be4ad02b4eda9602296cac8"
+SRC_URI[rustix-1.1.3.sha256sum] = "146c9e247ccc180c1f61615433868c99f3de3ae256a30a43b49f67c2d9171f34"
 SRC_URI[rustls-0.23.35.sha256sum] = "533f54bc6a7d4f647e46ad909549eda97bf5afc1585190ef692b4286b198bd8f"
 SRC_URI[rustls-native-certs-0.8.2.sha256sum] = "9980d917ebb0c0536119ba501e90834767bffc3d60641457fd84a1f3fd337923"
 SRC_URI[rustls-pki-types-1.12.0.sha256sum] = "229a4a4c221013e7e1f1a043678c5cc39fe5171437c88fb47151a21e6f5b5c79"
@@ -1053,6 +1080,7 @@ SRC_URI[rustls-webpki-0.103.8.sha256sum] = "2ffdfa2f5286e2247234e03f680868ac2815
 SRC_URI[rustversion-1.0.21.sha256sum] = "8a0d197bd2c9dc6e53b84da9556a69ba4cdfab8619eb41a8bd1cc2027a0f6b1d"
 SRC_URI[rustybuzz-0.7.0.sha256sum] = "162bdf42e261bee271b3957691018634488084ef577dddeb6420a9684cab2a6a"
 SRC_URI[ryu-1.0.20.sha256sum] = "28d3b2b1366ec20994f1fd18c3c594f05c5dd4bc44d8bb0c1c632c8d6829481f"
+SRC_URI[salsa20-0.10.2.sha256sum] = "97a22f5af31f73a954c10289c93e8a50cc23d971e80ee446f1f6f7137a088213"
 SRC_URI[same-file-1.0.6.sha256sum] = "93fc1dc3aaa9bfed95e02e6eadabb4baf7e3078b0bd1b4d7b6b0b68378900502"
 SRC_URI[schannel-0.1.27.sha256sum] = "1f29ebaa345f945cec9fbbc532eb307f0fdad8161f281b6369539c8d84876b3d"
 SRC_URI[schemars-1.0.5.sha256sum] = "1317c3bf3e7df961da95b0a56a172a02abead31276215a0497241a7624b487ce"
@@ -1060,6 +1088,7 @@ SRC_URI[schemars_derive-1.0.5.sha256sum] = "5f760a6150d45dd66ec044983c124595ae76
 SRC_URI[scopeguard-1.2.0.sha256sum] = "94143f37725109f92c262ed2cf5e59bce7498c01bcc1502d7b9afe439a4e9f49"
 SRC_URI[scroll-0.13.0.sha256sum] = "c1257cd4248b4132760d6524d6dda4e053bc648c9070b960929bf50cfb1e7add"
 SRC_URI[scroll_derive-0.13.0.sha256sum] = "22fc4f90c27b57691bbaf11d8ecc7cfbfe98a4da6dbe60226115d322aa80c06e"
+SRC_URI[scrypt-0.11.0.sha256sum] = "0516a385866c09368f0b5bcd1caff3366aace790fcd46e2bb032697bb172fd1f"
 SRC_URI[seahash-4.1.0.sha256sum] = "1c107b6f4780854c8b126e228ea8869f4d7b71260f962fefb57b996b8959ba6b"
 SRC_URI[secrecy-0.10.3.sha256sum] = "e891af845473308773346dc847b2c23ee78fe442e0472ac50e22a18a93d3ae5a"
 SRC_URI[secret-service-5.0.0.sha256sum] = "dccff79e916a339eec808de579764e3459658c903960d5aa4f7959ee9f6d5f2b"
@@ -1072,9 +1101,9 @@ SRC_URI[serde-untagged-0.1.9.sha256sum] = "f9faf48a4a2d2693be24c6289dbe26552776e
 SRC_URI[serde_core-1.0.228.sha256sum] = "41d385c7d4ca58e59fc732af25c3983b67ac852c1a25000afe1175de458b67ad"
 SRC_URI[serde_derive-1.0.228.sha256sum] = "d540f220d3187173da220f885ab66608367b6574e925011a9353e4badda91d79"
 SRC_URI[serde_derive_internals-0.29.1.sha256sum] = "18d26a20a969b9e3fdf2fc2d9f21eda6c40e2de84c9408bb5d3b05d499aae711"
-SRC_URI[serde_json-1.0.145.sha256sum] = "402a6f66d8c709116cf22f558eab210f5a50187f702eb4d7e5ef38d9a7f1c79c"
+SRC_URI[serde_json-1.0.147.sha256sum] = "6af14725505314343e673e9ecb7cd7e8a36aa9791eb936235a3567cc31447ae4"
 SRC_URI[serde_repr-0.1.20.sha256sum] = "175ee3e80ae9982737ca543e96133087cbd9a485eecc3bc4de9c1a37b47ea59c"
-SRC_URI[serde_spanned-1.0.3.sha256sum] = "e24345aa0fe688594e73770a5f6d1b216508b4f93484c0026d521acd30134392"
+SRC_URI[serde_spanned-1.0.4.sha256sum] = "f8bbf91e5a4d6315eee45e704372590b30e260ee83af6639d64557f51b067776"
 SRC_URI[serde_urlencoded-0.7.1.sha256sum] = "d3491c14715ca2294c4d6a88f15e84739788c1d030eed8c110436aafdaa2f3fd"
 SRC_URI[serde_yaml-0.9.34+deprecated.sha256sum] = "6a8b1a1a2ebf674015cc02edccce75287f1a0130d394307b36743c2f5d504b47"
 SRC_URI[sha1-0.10.6.sha256sum] = "e3bf829a2d51ab4a5ddf1352d8470c140cadc8301b2ae1789db023f01cedd6ba"
@@ -1084,9 +1113,11 @@ SRC_URI[shell-escape-0.1.5.sha256sum] = "45bb67a18fa91266cc7807181f62f9178a6873b
 SRC_URI[shellexpand-3.1.1.sha256sum] = "8b1fdf65dd6331831494dd616b30351c38e96e45921a27745cf98490458b90bb"
 SRC_URI[shlex-1.3.0.sha256sum] = "0fda2ff0d084019ba4d7c6f371c95d8fd75ce3524c3cb8fb653a3023f6323e64"
 SRC_URI[signal-hook-registry-1.4.5.sha256sum] = "9203b8055f63a2a00e2f593bb0510367fe707d7ff1e5c872de2f537b339e5410"
+SRC_URI[signature-2.2.0.sha256sum] = "77549399552de45a898a580c1b41d445bf730df867cc44e6c0233bbc4b8329de"
 SRC_URI[simd-adler32-0.3.7.sha256sum] = "d66dc143e6b11c1eddc06d5c423cfc97062865baf299914ab64caa38182078fe"
 SRC_URI[simdutf8-0.1.5.sha256sum] = "e3a9fe34e3e7a50316060351f37187a3f546bce95496156754b601a5fa71b76e"
 SRC_URI[similar-2.7.0.sha256sum] = "bbbb5d9659141646ae647b42fe094daf6c6192d1620870b449d9557f748b2daa"
+SRC_URI[simple_asn1-0.6.3.sha256sum] = "297f631f50729c8c99b84667867963997ec0b50f32b2a7dbcab828ef0541e8bb"
 SRC_URI[simplecss-0.2.2.sha256sum] = "7a9c6883ca9c3c7c90e888de77b7a5c849c779d25d74a1269b0218b14e8b136c"
 SRC_URI[siphasher-0.3.11.sha256sum] = "38b58827f4464d87d377d175e90bf58eb00fd8716ff0a62f80356b5e61555d0d"
 SRC_URI[slab-0.4.11.sha256sum] = "7a2ae44ef20feb57a68b23d846850f861394c2e02dc425a50098ae8c90267589"
@@ -1095,7 +1126,9 @@ SRC_URI[smawk-0.3.2.sha256sum] = "b7c388c1b5e93756d0c740965c41e8822f866621d41acb
 SRC_URI[socket2-0.5.10.sha256sum] = "e22376abed350d73dd1cd119b57ffccad95b4e585a7cda43e286245ce23c0678"
 SRC_URI[socket2-0.6.0.sha256sum] = "233504af464074f9d066d7b5416c5f9b894a5862a6506e306f7b816cdd6f1807"
 SRC_URI[spdx-0.10.9.sha256sum] = "c3e17e880bafaeb362a7b751ec46bdc5b61445a188f80e0606e68167cd540fa3"
-SRC_URI[spdx-0.13.2.sha256sum] = "35107b1c818f4e9cb9e6c4444ca560ba03b4ee1288dcecc6d7830c2023a7609e"
+SRC_URI[spdx-0.13.3.sha256sum] = "afd765179d12cdd06192e02b1d8c6b0d46bd26de9bf16ce04c881428ca2cc7ed"
+SRC_URI[spin-0.9.8.sha256sum] = "6980e8d7511241f8acf4aebddbb1ff938df5eebe98691418c4468d0b72a96a67"
+SRC_URI[spki-0.7.3.sha256sum] = "d91ed6c858b01f942cd56b37a94b3e0a1798290327d1236e4d9cf4eaca44d29d"
 SRC_URI[stable_deref_trait-1.2.0.sha256sum] = "a8f112729512f8e442d81f95a8a7ddf2b7c6b8a1a6f509a95864142b30cab2d3"
 SRC_URI[static_assertions-1.1.0.sha256sum] = "a2eb9349b6444b326872e140eb1cf5e7c522154d69e7a0ffb0fb81c06b37543f"
 SRC_URI[statrs-0.18.0.sha256sum] = "2a3fe7c28c6512e766b0874335db33c94ad7b8f9054228ae1c2abd47ce7d335e"
@@ -1121,7 +1154,7 @@ SRC_URI[tagu-0.1.6.sha256sum] = "eddb6b06d20fba9ed21fca3d696ee1b6e870bca0bcf9fa2
 SRC_URI[tar-0.4.44.sha256sum] = "1d863878d212c87a19c1a610eb53bb01fe12951c0501cf5a0d65f724914a667a"
 SRC_URI[target-lexicon-0.13.3.sha256sum] = "df7f62577c25e07834649fc3b39fafdc597c0a3527dc1c60129201ccfcbaa50c"
 SRC_URI[temp-env-0.3.6.sha256sum] = "96374855068f47402c3121c6eed88d29cb1de8f3ab27090e273e420bdabcf050"
-SRC_URI[tempfile-3.20.0.sha256sum] = "e8a64e3985349f2441a1a9ef0b853f869006c3855f2cda6862a94d26ebb9d6a1"
+SRC_URI[tempfile-3.24.0.sha256sum] = "655da9c7eb6305c55742045d5a8d2037996d61d8de95806335c7c86ce0f82e9c"
 SRC_URI[terminal_size-0.4.2.sha256sum] = "45c6481c4829e4cc63825e62c49186a34538b7b2750b73b266581ffb612fb5ed"
 SRC_URI[termtree-0.5.1.sha256sum] = "8f50febec83f5ee1df3015341d8bd429f2d1cc62bcba7ea2076759d315084683"
 SRC_URI[test-case-3.3.1.sha256sum] = "eb2550dd13afcd286853192af8601920d959b14c401fcece38071d53bf0768a8"
@@ -1152,13 +1185,13 @@ SRC_URI[tokio-macros-2.5.0.sha256sum] = "6e06d43f1345a3bcd39f6a56dbb7dcab2ba47e6
 SRC_URI[tokio-rustls-0.26.2.sha256sum] = "8e727b36a1a0e8b74c376ac2211e40c2c8af09fb4013c60d910495810f008e9b"
 SRC_URI[tokio-stream-0.1.17.sha256sum] = "eca58d7bba4a75707817a2c44174253f9236b2d5fbd055602e9d5c07c139a047"
 SRC_URI[tokio-util-0.7.17.sha256sum] = "2efa149fe76073d6e8fd97ef4f4eca7b67f599660115591483572e406e165594"
-SRC_URI[toml-0.9.8.sha256sum] = "f0dc8b1fb61449e27716ec0e1bdf0f6b8f3e8f6b05391e8497b8b6d7804ea6d8"
+SRC_URI[toml-0.9.10+spec-1.1.0.sha256sum] = "0825052159284a1a8b4d6c0c86cbc801f2da5afd2b225fa548c72f2e74002f48"
 SRC_URI[toml_datetime-0.6.11.sha256sum] = "22cddaf88f4fbc13c51aebbf5f8eceb5c7c5a9da2ac40a13519eb5b0a0e8f11c"
-SRC_URI[toml_datetime-0.7.3.sha256sum] = "f2cdb639ebbc97961c51720f858597f7f24c4fc295327923af55b74c3c724533"
+SRC_URI[toml_datetime-0.7.5+spec-1.1.0.sha256sum] = "92e1cfed4a3038bc5a127e35a2d360f145e1f4b971b551a2ba5fd7aedf7e1347"
 SRC_URI[toml_edit-0.22.27.sha256sum] = "41fe8c660ae4257887cf66394862d21dbca4a6ddd26f04a3560410406a2f819a"
-SRC_URI[toml_edit-0.23.7.sha256sum] = "6485ef6d0d9b5d0ec17244ff7eb05310113c3f316f2d14200d4de56b3cb98f8d"
-SRC_URI[toml_parser-1.0.4.sha256sum] = "c0cbe268d35bdb4bb5a56a2de88d0ad0eb70af5384a99d648cd4b3d04039800e"
-SRC_URI[toml_writer-1.0.4.sha256sum] = "df8b2b54733674ad286d16267dcfc7a71ed5c776e4ac7aa3c3e2561f7c637bf2"
+SRC_URI[toml_edit-0.24.0+spec-1.1.0.sha256sum] = "8c740b185920170a6d9191122cafef7010bd6270a3824594bff6784c04d7f09e"
+SRC_URI[toml_parser-1.0.6+spec-1.1.0.sha256sum] = "a3198b4b0a8e11f09dd03e133c0280504d0801269e9afa46362ffde1cbeebf44"
+SRC_URI[toml_writer-1.0.6+spec-1.1.0.sha256sum] = "ab16f14aed21ee8bfd8ec22513f7287cd4a91aa92e44edfe2c17ddd004e92607"
 SRC_URI[tower-0.5.2.sha256sum] = "d039ad9159c98b70ecfd540b2573b97f7f52c3e8d9f8ad57a24b916a536975f9"
 SRC_URI[tower-http-0.6.6.sha256sum] = "adc82fd73de2a9722ac5da747f12383d2bfdb93591ee6c58486e0097890f05f2"
 SRC_URI[tower-layer-0.3.3.sha256sum] = "121c2a6cda46980bb0fcd1647ffaf6cd3fc79a013de288782836f6df9c48780e"
@@ -1201,7 +1234,7 @@ SRC_URI[usvg-text-layout-0.29.0.sha256sum] = "195386e01bc35f860db024de275a76e7a3
 SRC_URI[utf8-width-0.1.7.sha256sum] = "86bd8d4e895da8537e5315b8254664e6b769c4ff3db18321b297a1e7004392e3"
 SRC_URI[utf8_iter-1.0.4.sha256sum] = "b6c140620e7ffbb22c2dee59cafe6084a59b5ffc27a8859a5f0d494b5d52b6be"
 SRC_URI[utf8parse-0.2.2.sha256sum] = "06abde3611657adf66d383f00b093d7faecc7fa57071cce2578660c9f1010821"
-SRC_URI[uuid-1.17.0.sha256sum] = "3cf4199d1e5d15ddd86a694e4d0dffa9c323ce759fea589f00fef9d81cc1931d"
+SRC_URI[uuid-1.19.0.sha256sum] = "e2e054861b4bd027cd373e18e8d8d8e6548085000e41290d95ce0c373a654b4a"
 SRC_URI[valuable-0.1.1.sha256sum] = "ba73ea9cf16a25df0c8caa16c51acb937d5712a8429db78a3ee29d5dcacd3a65"
 SRC_URI[version_check-0.9.5.sha256sum] = "0b928f33d975fc6ad9f86c8f283853ad26bdd5b10b7f1542aa2fa15e2289105a"
 SRC_URI[wait-timeout-0.2.1.sha256sum] = "09ac3b126d3914f9849036f826e054cbabdc8519970b8998ddaf3b5bd3c65f11"
@@ -1295,6 +1328,7 @@ SRC_URI[zerovec-0.11.2.sha256sum] = "4a05eb080e015ba39cc9e23bbe5e7fb04d5fb040350
 SRC_URI[zerovec-derive-0.11.1.sha256sum] = "5b96237efa0c878c64bd89c436f661be4e46b2f3eff1ebb976f7ef2321d2f58f"
 SRC_URI[zip-2.4.2.sha256sum] = "fabe6324e908f85a1c52063ce7aa26b68dcb7eb6dbc83a2d148403c9bc3eba50"
 SRC_URI[zlib-rs-0.5.1.sha256sum] = "626bd9fa9734751fc50d6060752170984d7053f5a39061f524cda68023d4db8a"
+SRC_URI[zmij-0.1.11.sha256sum] = "3273ed2c1f89f63ec74ab75efe20159d0058e30831e6e9f1502cd5bf2fd8b178"
 SRC_URI[zopfli-0.8.2.sha256sum] = "edfc5ee405f504cd4984ecc6f14d02d55cfda60fa4b689434ef4102aae150cd7"
 SRC_URI[zstd-0.13.3.sha256sum] = "e91ee311a569c327171651566e07972200e76fcfe2242a4fa446149a3881c08a"
 SRC_URI[zstd-safe-7.2.4.sha256sum] = "8f49c4d5f0abb602a93fb8736af2a4f4dd9512e36f7f570d66e65ff867ed3b9d"
diff --git a/meta/recipes-devtools/python/python3-uv-build_0.9.18.bb b/meta/recipes-devtools/python/python3-uv-build_0.9.26.bb
similarity index 92%
rename from meta/recipes-devtools/python/python3-uv-build_0.9.18.bb
rename to meta/recipes-devtools/python/python3-uv-build_0.9.26.bb
index aa14349197..4e1b52a660 100644
--- a/meta/recipes-devtools/python/python3-uv-build_0.9.18.bb
+++ b/meta/recipes-devtools/python/python3-uv-build_0.9.26.bb
@@ -11,7 +11,7 @@ LIC_FILES_CHKSUM = "file://LICENSE-APACHE;md5=86d3f3a95c324c9479bd8986968f4327 \
                     file://crates/uv-pep508/License-Apache;md5=e23fadd6ceef8c618fc1c65191d846fa \
                     file://crates/uv-pep508/License-BSD;md5=ef7a6027dc4c2389b9afad7e690274c7"
 
-SRC_URI[sha256sum] = "ae3458ebc3c2ae69cca621a1e6f1e280a7cb6c729f829b325fef4a65a55efa9d"
+SRC_URI[sha256sum] = "ce87f3b6932229b3a5173891654d2b564881155da5114fa5590cf6eddf4d56b2"
 
 require ${BPN}-crates.inc
 
-- 
2.43.0


