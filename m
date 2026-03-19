Return-Path: <wangmy@fujitsu.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 10E0B108E1D6
	for <webhook@archiver.kernel.org>; Thu, 19 Mar 2026 10:20:36 +0000 (UTC)
Received: from esa2.hc1455-7.c3s2.iphmx.com (esa2.hc1455-7.c3s2.iphmx.com [207.54.90.48])
 by mx.groups.io with SMTP id smtpd.msgproc01-g2.7943.1773915631548567094
 for <openembedded-core@lists.openembedded.org>;
 Thu, 19 Mar 2026 03:20:33 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@fujitsu.com header.s=fj2 header.b=byS8JPwj;
 spf=pass (domain: fujitsu.com, ip: 207.54.90.48, mailfrom: wangmy@fujitsu.com)
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
  d=fujitsu.com; i=@fujitsu.com; q=dns/txt; s=fj2;
  t=1773915633; x=1805451633;
  h=from:to:cc:subject:date:message-id:in-reply-to:
   references:mime-version:content-transfer-encoding;
  bh=rmp6+h0tOzfT/h9+Xs9Ug/cwbGQVune30C+9tpbYt7k=;
  b=byS8JPwjIOlBpDA8sLmB1Ic+OWspjzEbksnNY14VtadoOEGxytL/NnXT
   KFcCVS6S/02x2l+vXuDleztbyfX3SFhxH/CvtGfiYTD1DVHKtlBgaurGO
   Y2mYn5Bqmv5BpUAL6wrFsEzUKMBM6bOL2U4abozWsmMxxlcX47dsnMSyV
   HXZVJbyBXAR8DJI2qeRuSj4caoTFns5yjsH5QGGZYSDAZVhLhV9k312zs
   /xxBBJzSguVEioLI3xHnaNZYkuOuRgoBkHQ2O/IhVMoOC28XlUq5rAbGy
   DtttaY+OwRyM6nuzbEkFtrYzZh4jR4Sxwc34dHzRb0H+h8Une69H/tkt7
   g==;
X-CSE-ConnectionGUID: xc7t1T6FRSqWdFVRqR31lg==
X-CSE-MsgGUID: 9+hMwWV2StqeFSncUQcjpw==
X-IronPort-AV: E=McAfee;i="6800,10657,11733"; a="233833385"
X-IronPort-AV: E=Sophos;i="6.23,129,1770562800"; 
   d="scan'208";a="233833385"
Received: from gmgwuk01.global.fujitsu.com ([172.187.114.235])
  by esa2.hc1455-7.c3s2.iphmx.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 19 Mar 2026 19:15:28 +0900
Received: from az2uksmgm4.o.css.fujitsu.com (unknown [10.151.22.201])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by gmgwuk01.global.fujitsu.com (Postfix) with ESMTPS id CF6FC820C19
	for <openembedded-core@lists.openembedded.org>; Thu, 19 Mar 2026 10:15:27 +0000 (UTC)
Received: from az2nlsmom3.fujitsu.com (az2nlsmom3.o.css.fujitsu.com [10.150.26.199])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by az2uksmgm4.o.css.fujitsu.com (Postfix) with ESMTPS id 7EBF31410C97
	for <openembedded-core@lists.openembedded.org>; Thu, 19 Mar 2026 10:15:27 +0000 (UTC)
Received: from G08FNSTD200057.g08.fujitsu.local (unknown [10.193.160.5])
	by az2nlsmom3.fujitsu.com (Postfix) with ESMTP id 97B07101E523;
	Thu, 19 Mar 2026 10:15:24 +0000 (UTC)
From: Wang Mingyu < wangmy@fujitsu.com>
To: openembedded-core@lists.openembedded.org
Cc: Wang Mingyu <wangmy@fujitsu.com>
Subject: [OE-core] [PATCH 33/40] python3-uv-build: upgrade 0.10.4 -> 0.10.10
Date: Thu, 19 Mar 2026 18:13:25 +0800
Message-ID: <20260319101332.2067-33-wangmy@fujitsu.com>
X-Mailer: git-send-email 2.49.0.windows.1
In-Reply-To: <20260319101332.2067-1-wangmy@fujitsu.com>
References: <20260319101332.2067-1-wangmy@fujitsu.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Thu, 19 Mar 2026 10:20:36 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/233505

From: Wang Mingyu <wangmy@fujitsu.com>

Signed-off-by: Wang Mingyu <wangmy@fujitsu.com>
---
 .../python/python3-uv-build-crates.inc        | 264 ++++++++++--------
 ..._0.10.4.bb => python3-uv-build_0.10.10.bb} |   2 +-
 2 files changed, 153 insertions(+), 113 deletions(-)
 rename meta/recipes-devtools/python/{python3-uv-build_0.10.4.bb => python3-uv-build_0.10.10.bb} (92%)

diff --git a/meta/recipes-devtools/python/python3-uv-build-crates.inc b/meta/recipes-devtools/python/python3-uv-build-crates.inc
index d81eaf7787..6b8cf5f1fb 100644
--- a/meta/recipes-devtools/python/python3-uv-build-crates.inc
+++ b/meta/recipes-devtools/python/python3-uv-build-crates.inc
@@ -9,11 +9,13 @@ SRC_URI += " \
     crate://crates.io/ambient-id/0.0.10 \
     crate://crates.io/anes/0.1.6 \
     crate://crates.io/anstream/0.6.21 \
+    crate://crates.io/anstream/1.0.0 \
     crate://crates.io/anstyle/1.0.11 \
     crate://crates.io/anstyle-parse/0.2.7 \
+    crate://crates.io/anstyle-parse/1.0.0 \
     crate://crates.io/anstyle-query/1.1.3 \
     crate://crates.io/anstyle-wincon/3.0.9 \
-    crate://crates.io/anyhow/1.0.101 \
+    crate://crates.io/anyhow/1.0.102 \
     crate://crates.io/approx/0.5.1 \
     crate://crates.io/arcstr/1.2.0 \
     crate://crates.io/arrayref/0.3.9 \
@@ -49,7 +51,7 @@ SRC_URI += " \
     crate://crates.io/base64ct/1.8.2 \
     crate://crates.io/bisection/0.1.0 \
     crate://crates.io/bitflags/1.3.2 \
-    crate://crates.io/bitflags/2.10.0 \
+    crate://crates.io/bitflags/2.11.0 \
     crate://crates.io/blake2/0.10.6 \
     crate://crates.io/block-buffer/0.10.4 \
     crate://crates.io/block-padding/0.3.3 \
@@ -59,7 +61,7 @@ SRC_URI += " \
     crate://crates.io/bumpalo/3.19.0 \
     crate://crates.io/bytecheck/0.8.2 \
     crate://crates.io/bytecheck_derive/0.8.2 \
-    crate://crates.io/bytemuck/1.23.1 \
+    crate://crates.io/bytemuck/1.25.0 \
     crate://crates.io/byteorder/1.5.0 \
     crate://crates.io/byteorder-lite/0.1.0 \
     crate://crates.io/bytes/1.11.1 \
@@ -78,13 +80,13 @@ SRC_URI += " \
     crate://crates.io/ciborium-io/0.2.2 \
     crate://crates.io/ciborium-ll/0.2.2 \
     crate://crates.io/cipher/0.4.4 \
-    crate://crates.io/clap/4.5.57 \
-    crate://crates.io/clap_builder/4.5.57 \
+    crate://crates.io/clap/4.5.60 \
+    crate://crates.io/clap_builder/4.5.60 \
     crate://crates.io/clap_complete/4.5.55 \
     crate://crates.io/clap_complete_command/0.6.1 \
     crate://crates.io/clap_complete_nushell/4.5.8 \
     crate://crates.io/clap_derive/4.5.55 \
-    crate://crates.io/clap_lex/0.7.5 \
+    crate://crates.io/clap_lex/1.0.0 \
     crate://crates.io/codspeed/4.3.0 \
     crate://crates.io/codspeed-criterion-compat/4.3.0 \
     crate://crates.io/codspeed-criterion-compat-walltime/4.3.0 \
@@ -115,7 +117,7 @@ SRC_URI += " \
     crate://crates.io/crypto-common/0.1.6 \
     crate://crates.io/csv/1.4.0 \
     crate://crates.io/csv-core/0.1.12 \
-    crate://crates.io/ctrlc/3.5.1 \
+    crate://crates.io/ctrlc/3.5.2 \
     crate://crates.io/cyclonedx-bom/0.8.0 \
     crate://crates.io/cyclonedx-bom-macros/0.1.0 \
     crate://crates.io/dashmap/6.1.0 \
@@ -147,9 +149,9 @@ SRC_URI += " \
     crate://crates.io/endi/1.1.0 \
     crate://crates.io/enumflags2/0.7.12 \
     crate://crates.io/enumflags2_derive/0.7.12 \
-    crate://crates.io/env_filter/0.1.3 \
+    crate://crates.io/env_filter/1.0.0 \
     crate://crates.io/env_home/0.1.0 \
-    crate://crates.io/env_logger/0.11.8 \
+    crate://crates.io/env_logger/0.11.9 \
     crate://crates.io/equivalent/1.0.2 \
     crate://crates.io/erased-serde/0.4.6 \
     crate://crates.io/errno/0.3.13 \
@@ -172,25 +174,26 @@ SRC_URI += " \
     crate://crates.io/fontdb/0.23.0 \
     crate://crates.io/form_urlencoded/1.2.2 \
     crate://crates.io/fs-err/3.3.0 \
-    crate://crates.io/futures/0.3.31 \
-    crate://crates.io/futures-channel/0.3.31 \
-    crate://crates.io/futures-core/0.3.31 \
-    crate://crates.io/futures-executor/0.3.31 \
-    crate://crates.io/futures-io/0.3.31 \
+    crate://crates.io/futures/0.3.32 \
+    crate://crates.io/futures-channel/0.3.32 \
+    crate://crates.io/futures-core/0.3.32 \
+    crate://crates.io/futures-executor/0.3.32 \
+    crate://crates.io/futures-io/0.3.32 \
     crate://crates.io/futures-lite/2.6.0 \
-    crate://crates.io/futures-macro/0.3.31 \
-    crate://crates.io/futures-sink/0.3.31 \
-    crate://crates.io/futures-task/0.3.31 \
-    crate://crates.io/futures-util/0.3.31 \
+    crate://crates.io/futures-macro/0.3.32 \
+    crate://crates.io/futures-sink/0.3.32 \
+    crate://crates.io/futures-task/0.3.32 \
+    crate://crates.io/futures-util/0.3.32 \
     crate://crates.io/generic-array/0.14.7 \
     crate://crates.io/getrandom/0.2.16 \
     crate://crates.io/getrandom/0.3.3 \
+    crate://crates.io/getrandom/0.4.1 \
     crate://crates.io/gif/0.14.1 \
     crate://crates.io/glob/0.3.3 \
     crate://crates.io/globset/0.4.18 \
     crate://crates.io/globwalk/0.9.1 \
     crate://crates.io/gloo-timers/0.3.0 \
-    crate://crates.io/goblin/0.10.4 \
+    crate://crates.io/goblin/0.10.5 \
     crate://crates.io/h2/0.4.13 \
     crate://crates.io/half/2.6.0 \
     crate://crates.io/hashbrown/0.14.5 \
@@ -219,6 +222,7 @@ SRC_URI += " \
     crate://crates.io/icu_properties/2.0.1 \
     crate://crates.io/icu_properties_data/2.0.1 \
     crate://crates.io/icu_provider/2.0.0 \
+    crate://crates.io/id-arena/2.3.0 \
     crate://crates.io/idna/1.1.0 \
     crate://crates.io/idna_adapter/1.2.1 \
     crate://crates.io/ignore/0.4.25 \
@@ -226,7 +230,7 @@ SRC_URI += " \
     crate://crates.io/image-webp/0.2.4 \
     crate://crates.io/imagesize/0.14.0 \
     crate://crates.io/indexmap/2.13.0 \
-    crate://crates.io/indicatif/0.18.3 \
+    crate://crates.io/indicatif/0.18.4 \
     crate://crates.io/indoc/2.0.7 \
     crate://crates.io/inout/0.1.4 \
     crate://crates.io/insta/1.46.3 \
@@ -241,27 +245,28 @@ SRC_URI += " \
     crate://crates.io/itertools/0.13.0 \
     crate://crates.io/itertools/0.14.0 \
     crate://crates.io/itoa/1.0.15 \
-    crate://crates.io/jiff/0.2.19 \
-    crate://crates.io/jiff-static/0.2.19 \
+    crate://crates.io/jiff/0.2.22 \
+    crate://crates.io/jiff-static/0.2.22 \
     crate://crates.io/jiff-tzdb/0.1.4 \
     crate://crates.io/jiff-tzdb-platform/0.1.3 \
     crate://crates.io/jobserver/0.1.34 \
     crate://crates.io/js-sys/0.3.77 \
     crate://crates.io/jsonwebtoken/9.3.1 \
-    crate://crates.io/junction/1.4.1 \
+    crate://crates.io/junction/1.4.2 \
     crate://crates.io/kurbo/0.13.0 \
     crate://crates.io/lazy_static/1.5.0 \
+    crate://crates.io/leb128fmt/0.1.0 \
     crate://crates.io/libbz2-rs-sys/0.2.2 \
-    crate://crates.io/libc/0.2.178 \
+    crate://crates.io/libc/0.2.180 \
     crate://crates.io/libm/0.2.15 \
     crate://crates.io/libmimalloc-sys/0.1.44 \
     crate://crates.io/libredox/0.1.12 \
     crate://crates.io/linux-raw-sys/0.11.0 \
     crate://crates.io/litemap/0.8.0 \
     crate://crates.io/lock_api/0.4.13 \
-    crate://crates.io/log/0.4.27 \
+    crate://crates.io/log/0.4.29 \
     crate://crates.io/lru-slab/0.1.2 \
-    crate://crates.io/lzma-rust2/0.15.7 \
+    crate://crates.io/lzma-rust2/0.16.1 \
     crate://crates.io/lzma-sys/0.1.20 \
     crate://crates.io/mailparse/0.16.1 \
     crate://crates.io/markdown/1.0.0 \
@@ -283,6 +288,7 @@ SRC_URI += " \
     crate://crates.io/munge_macro/0.4.5 \
     crate://crates.io/nanoid/0.4.0 \
     crate://crates.io/nix/0.30.1 \
+    crate://crates.io/nix/0.31.1 \
     crate://crates.io/nom/7.1.3 \
     crate://crates.io/normalize-line-endings/0.3.0 \
     crate://crates.io/nu-ansi-term/0.50.1 \
@@ -290,7 +296,7 @@ SRC_URI += " \
     crate://crates.io/num-bigint/0.4.6 \
     crate://crates.io/num-bigint-dig/0.8.6 \
     crate://crates.io/num-complex/0.4.6 \
-    crate://crates.io/num-conv/0.1.0 \
+    crate://crates.io/num-conv/0.2.0 \
     crate://crates.io/num-integer/0.1.46 \
     crate://crates.io/num-iter/0.1.45 \
     crate://crates.io/num-rational/0.4.2 \
@@ -309,7 +315,7 @@ SRC_URI += " \
     crate://crates.io/ordered-multimap/0.7.3 \
     crate://crates.io/ordered-stream/0.2.0 \
     crate://crates.io/os_str_bytes/6.6.1 \
-    crate://crates.io/owo-colors/4.2.3 \
+    crate://crates.io/owo-colors/4.3.0 \
     crate://crates.io/parking/2.2.1 \
     crate://crates.io/parking_lot/0.12.4 \
     crate://crates.io/parking_lot_core/0.9.11 \
@@ -335,17 +341,18 @@ SRC_URI += " \
     crate://crates.io/pkcs8/0.10.2 \
     crate://crates.io/pkg-config/0.3.32 \
     crate://crates.io/plain/0.2.3 \
-    crate://crates.io/png/0.17.16 \
+    crate://crates.io/png/0.18.1 \
     crate://crates.io/poloto/19.1.2 \
-    crate://crates.io/portable-atomic/1.11.1 \
+    crate://crates.io/portable-atomic/1.13.1 \
     crate://crates.io/portable-atomic-util/0.2.4 \
     crate://crates.io/potential_utf/0.1.2 \
     crate://crates.io/powerfmt/0.2.0 \
     crate://crates.io/ppv-lite86/0.2.21 \
-    crate://crates.io/predicates/3.1.3 \
+    crate://crates.io/predicates/3.1.4 \
     crate://crates.io/predicates-core/1.0.9 \
     crate://crates.io/predicates-tree/1.0.12 \
     crate://crates.io/pretty_assertions/1.4.1 \
+    crate://crates.io/prettyplease/0.2.37 \
     crate://crates.io/priority-queue/2.5.0 \
     crate://crates.io/proc-macro-crate/3.3.0 \
     crate://crates.io/proc-macro2/1.0.106 \
@@ -357,7 +364,7 @@ SRC_URI += " \
     crate://crates.io/quick-error/2.0.1 \
     crate://crates.io/quick-xml/0.38.3 \
     crate://crates.io/quinn/0.11.8 \
-    crate://crates.io/quinn-proto/0.11.12 \
+    crate://crates.io/quinn-proto/0.11.14 \
     crate://crates.io/quinn-udp/0.5.13 \
     crate://crates.io/quote/1.0.44 \
     crate://crates.io/quoted_printable/0.5.1 \
@@ -377,7 +384,7 @@ SRC_URI += " \
     crate://crates.io/redox_users/0.5.0 \
     crate://crates.io/ref-cast/1.0.25 \
     crate://crates.io/ref-cast-impl/1.0.25 \
-    crate://crates.io/reflink-copy/0.1.28 \
+    crate://crates.io/reflink-copy/0.1.29 \
     crate://crates.io/regex/1.12.3 \
     crate://crates.io/regex-automata/0.4.14 \
     crate://crates.io/regex-syntax/0.8.5 \
@@ -390,23 +397,23 @@ SRC_URI += " \
     crate://crates.io/reqsign-google/2.0.1 \
     crate://crates.io/reqsign-http-send-reqwest/2.0.1 \
     crate://crates.io/reqwest/0.12.22 \
-    crate://crates.io/resvg/0.46.0 \
+    crate://crates.io/resvg/0.47.0 \
     crate://crates.io/retry-policies/0.5.1 \
     crate://crates.io/rgb/0.8.52 \
     crate://crates.io/ring/0.17.14 \
-    crate://crates.io/rkyv/0.8.14 \
-    crate://crates.io/rkyv_derive/0.8.14 \
+    crate://crates.io/rkyv/0.8.15 \
+    crate://crates.io/rkyv_derive/0.8.15 \
     crate://crates.io/rmp/0.8.14 \
     crate://crates.io/rmp-serde/1.3.1 \
     crate://crates.io/roxmltree/0.20.0 \
     crate://crates.io/roxmltree/0.21.1 \
-    crate://crates.io/rsa/0.9.9 \
+    crate://crates.io/rsa/0.9.10 \
     crate://crates.io/rust-ini/0.21.3 \
     crate://crates.io/rust-netrc/0.1.2 \
     crate://crates.io/rustc-hash/2.1.1 \
     crate://crates.io/rusticata-macros/4.1.0 \
     crate://crates.io/rustix/1.1.3 \
-    crate://crates.io/rustls/0.23.36 \
+    crate://crates.io/rustls/0.23.37 \
     crate://crates.io/rustls-native-certs/0.8.2 \
     crate://crates.io/rustls-pki-types/1.13.3 \
     crate://crates.io/rustls-webpki/0.103.8 \
@@ -425,8 +432,8 @@ SRC_URI += " \
     crate://crates.io/seahash/4.1.0 \
     crate://crates.io/secrecy/0.10.3 \
     crate://crates.io/secret-service/5.1.0 \
-    crate://crates.io/security-framework/3.5.1 \
-    crate://crates.io/security-framework-sys/2.15.0 \
+    crate://crates.io/security-framework/3.7.0 \
+    crate://crates.io/security-framework-sys/2.17.0 \
     crate://crates.io/self-replace/1.5.0 \
     crate://crates.io/semver/1.0.26 \
     crate://crates.io/serde/1.0.228 \
@@ -460,7 +467,7 @@ SRC_URI += " \
     crate://crates.io/socket2/0.5.10 \
     crate://crates.io/socket2/0.6.0 \
     crate://crates.io/spdx/0.10.9 \
-    crate://crates.io/spdx/0.13.3 \
+    crate://crates.io/spdx/0.13.4 \
     crate://crates.io/spin/0.9.8 \
     crate://crates.io/spki/0.7.3 \
     crate://crates.io/stable_deref_trait/1.2.0 \
@@ -476,17 +483,16 @@ SRC_URI += " \
     crate://crates.io/supports-unicode/3.0.0 \
     crate://crates.io/svg/0.18.0 \
     crate://crates.io/svgtypes/0.16.1 \
-    crate://crates.io/syn/2.0.114 \
+    crate://crates.io/syn/2.0.117 \
     crate://crates.io/sync_wrapper/1.0.2 \
     crate://crates.io/synstructure/0.13.2 \
-    crate://crates.io/sys-info/0.9.1 \
     crate://crates.io/system-configuration/0.7.0 \
     crate://crates.io/system-configuration-sys/0.6.0 \
     crate://crates.io/tagu/0.1.6 \
     crate://crates.io/tar/0.4.44 \
-    crate://crates.io/target-lexicon/0.13.4 \
+    crate://crates.io/target-lexicon/0.13.5 \
     crate://crates.io/temp-env/0.3.6 \
-    crate://crates.io/tempfile/3.24.0 \
+    crate://crates.io/tempfile/3.25.0 \
     crate://crates.io/terminal_size/0.4.2 \
     crate://crates.io/termtree/0.5.1 \
     crate://crates.io/test-case/3.3.1 \
@@ -502,12 +508,12 @@ SRC_URI += " \
     crate://crates.io/thread_local/1.1.9 \
     crate://crates.io/tikv-jemalloc-sys/0.6.1+5.3.0-1-ge13ca993e8ccb9ba9847cc330696e02839f328f7 \
     crate://crates.io/tikv-jemallocator/0.6.1 \
-    crate://crates.io/time/0.3.44 \
-    crate://crates.io/time-core/0.1.6 \
-    crate://crates.io/time-macros/0.2.24 \
+    crate://crates.io/time/0.3.47 \
+    crate://crates.io/time-core/0.1.8 \
+    crate://crates.io/time-macros/0.2.27 \
     crate://crates.io/tiny-keccak/2.0.2 \
-    crate://crates.io/tiny-skia/0.11.4 \
-    crate://crates.io/tiny-skia-path/0.11.4 \
+    crate://crates.io/tiny-skia/0.12.0 \
+    crate://crates.io/tiny-skia-path/0.12.0 \
     crate://crates.io/tinystr/0.8.1 \
     crate://crates.io/tinytemplate/1.2.1 \
     crate://crates.io/tinyvec/1.9.0 \
@@ -540,6 +546,7 @@ SRC_URI += " \
     crate://crates.io/tracing-tree/0.4.1 \
     crate://crates.io/try-lock/0.2.5 \
     crate://crates.io/ttf-parser/0.25.1 \
+    crate://crates.io/typed-path/0.12.3 \
     crate://crates.io/typeid/1.0.3 \
     crate://crates.io/typenum/1.18.0 \
     crate://crates.io/ucd-trie/0.1.7 \
@@ -556,16 +563,17 @@ SRC_URI += " \
     crate://crates.io/unicode-vo/0.1.0 \
     crate://crates.io/unicode-width/0.1.14 \
     crate://crates.io/unicode-width/0.2.2 \
+    crate://crates.io/unicode-xid/0.2.6 \
     crate://crates.io/unit-prefix/0.5.1 \
     crate://crates.io/unsafe-libyaml/0.2.11 \
     crate://crates.io/unscanny/0.1.0 \
     crate://crates.io/untrusted/0.9.0 \
     crate://crates.io/url/2.5.8 \
-    crate://crates.io/usvg/0.46.0 \
+    crate://crates.io/usvg/0.47.0 \
     crate://crates.io/utf8-width/0.1.7 \
     crate://crates.io/utf8_iter/1.0.4 \
     crate://crates.io/utf8parse/0.2.2 \
-    crate://crates.io/uuid/1.20.0 \
+    crate://crates.io/uuid/1.21.0 \
     crate://crates.io/valuable/0.1.1 \
     crate://crates.io/version_check/0.9.5 \
     crate://crates.io/wait-timeout/0.2.1 \
@@ -573,6 +581,8 @@ SRC_URI += " \
     crate://crates.io/want/0.3.1 \
     crate://crates.io/wasi/0.11.1+wasi-snapshot-preview1 \
     crate://crates.io/wasi/0.14.2+wasi-0.2.4 \
+    crate://crates.io/wasip2/1.0.2+wasi-0.2.9 \
+    crate://crates.io/wasip3/0.4.0+wasi-0.3.0-rc-2026-01-06 \
     crate://crates.io/wasite/1.0.2 \
     crate://crates.io/wasm-bindgen/0.2.100 \
     crate://crates.io/wasm-bindgen-backend/0.2.100 \
@@ -580,7 +590,10 @@ SRC_URI += " \
     crate://crates.io/wasm-bindgen-macro/0.2.100 \
     crate://crates.io/wasm-bindgen-macro-support/0.2.100 \
     crate://crates.io/wasm-bindgen-shared/0.2.100 \
+    crate://crates.io/wasm-encoder/0.244.0 \
+    crate://crates.io/wasm-metadata/0.244.0 \
     crate://crates.io/wasm-streams/0.4.2 \
+    crate://crates.io/wasmparser/0.244.0 \
     crate://crates.io/wasmtimer/0.4.2 \
     crate://crates.io/web-sys/0.3.77 \
     crate://crates.io/web-time/1.1.0 \
@@ -600,7 +613,7 @@ SRC_URI += " \
     crate://crates.io/windows-implement/0.60.0 \
     crate://crates.io/windows-interface/0.59.1 \
     crate://crates.io/windows-link/0.1.3 \
-    crate://crates.io/windows-link/0.2.0 \
+    crate://crates.io/windows-link/0.2.1 \
     crate://crates.io/windows-numerics/0.2.0 \
     crate://crates.io/windows-registry/0.5.3 \
     crate://crates.io/windows-result/0.3.4 \
@@ -610,6 +623,7 @@ SRC_URI += " \
     crate://crates.io/windows-sys/0.61.0 \
     crate://crates.io/windows-targets/0.52.6 \
     crate://crates.io/windows-threading/0.1.0 \
+    crate://crates.io/windows-version/0.1.7 \
     crate://crates.io/windows_aarch64_gnullvm/0.52.6 \
     crate://crates.io/windows_aarch64_msvc/0.52.6 \
     crate://crates.io/windows_i686_gnu/0.52.6 \
@@ -621,7 +635,13 @@ SRC_URI += " \
     crate://crates.io/winnow/0.7.13 \
     crate://crates.io/winsafe/0.0.19 \
     crate://crates.io/wiremock/0.6.5 \
+    crate://crates.io/wit-bindgen/0.51.0 \
+    crate://crates.io/wit-bindgen-core/0.51.0 \
     crate://crates.io/wit-bindgen-rt/0.39.0 \
+    crate://crates.io/wit-bindgen-rust/0.51.0 \
+    crate://crates.io/wit-bindgen-rust-macro/0.51.0 \
+    crate://crates.io/wit-component/0.244.0 \
+    crate://crates.io/wit-parser/0.244.0 \
     crate://crates.io/wmi/0.16.0 \
     crate://crates.io/writeable/0.6.1 \
     crate://crates.io/x509-parser/0.18.0 \
@@ -644,10 +664,10 @@ SRC_URI += " \
     crate://crates.io/zerotrie/0.2.2 \
     crate://crates.io/zerovec/0.11.2 \
     crate://crates.io/zerovec-derive/0.11.1 \
-    crate://crates.io/zip/7.1.0 \
-    crate://crates.io/zlib-rs/0.6.0 \
+    crate://crates.io/zip/8.1.0 \
+    crate://crates.io/zlib-rs/0.6.2 \
     crate://crates.io/zmij/1.0.15 \
-    crate://crates.io/zopfli/0.8.2 \
+    crate://crates.io/zopfli/0.8.3 \
     crate://crates.io/zstd/0.13.3 \
     crate://crates.io/zstd-safe/7.2.4 \
     crate://crates.io/zstd-sys/2.0.15+zstd.1.5.7 \
@@ -665,11 +685,13 @@ SRC_URI[allocator-api2-0.2.21.sha256sum] = "683d7910e743518b0e34f1186f92494becac
 SRC_URI[ambient-id-0.0.10.sha256sum] = "e61320f0a8ca54a235b0e49307b16dcade6eecd441b1f8a8c7ca9204056cb17c"
 SRC_URI[anes-0.1.6.sha256sum] = "4b46cbb362ab8752921c97e041f5e366ee6297bd428a31275b9fcf1e380f7299"
 SRC_URI[anstream-0.6.21.sha256sum] = "43d5b281e737544384e969a5ccad3f1cdd24b48086a0fc1b2a5262a26b8f4f4a"
+SRC_URI[anstream-1.0.0.sha256sum] = "824a212faf96e9acacdbd09febd34438f8f711fb84e09a8916013cd7815ca28d"
 SRC_URI[anstyle-1.0.11.sha256sum] = "862ed96ca487e809f1c8e5a8447f6ee2cf102f846893800b20cebdf541fc6bbd"
 SRC_URI[anstyle-parse-0.2.7.sha256sum] = "4e7644824f0aa2c7b9384579234ef10eb7efb6a0deb83f9630a49594dd9c15c2"
+SRC_URI[anstyle-parse-1.0.0.sha256sum] = "52ce7f38b242319f7cabaa6813055467063ecdc9d355bbb4ce0c68908cd8130e"
 SRC_URI[anstyle-query-1.1.3.sha256sum] = "6c8bdeb6047d8983be085bab0ba1472e6dc604e7041dbf6fcd5e71523014fae9"
 SRC_URI[anstyle-wincon-3.0.9.sha256sum] = "403f75924867bb1033c59fbf0797484329750cfbe3c4325cd33127941fabc882"
-SRC_URI[anyhow-1.0.101.sha256sum] = "5f0e0fee31ef5ed1ba1316088939cea399010ed7731dba877ed44aeb407a75ea"
+SRC_URI[anyhow-1.0.102.sha256sum] = "7f202df86484c868dbad7eaa557ef785d5c66295e41b460ef922eca0723b842c"
 SRC_URI[approx-0.5.1.sha256sum] = "cab112f0a86d568ea0e627cc1d6be74a1e9cd55214684db5561995f6dad897c6"
 SRC_URI[arcstr-1.2.0.sha256sum] = "03918c3dbd7701a85c6b9887732e2921175f26c350b4563841d0958c21d57e6d"
 SRC_URI[arrayref-0.3.9.sha256sum] = "76a2e8124351fda1ef8aaaa3bbd7ebbcb486bbcd4225aca0aa0d84bb2db8fecb"
@@ -705,7 +727,7 @@ SRC_URI[base64-0.22.1.sha256sum] = "72b3254f16251a8381aa12e40e3c4d2f0199f8c6508f
 SRC_URI[base64ct-1.8.2.sha256sum] = "7d809780667f4410e7c41b07f52439b94d2bdf8528eeedc287fa38d3b7f95d82"
 SRC_URI[bisection-0.1.0.sha256sum] = "021e079a1bab0ecce6cf4b4b74c0c37afa4a697136eb3b127875c84a8f04a8c3"
 SRC_URI[bitflags-1.3.2.sha256sum] = "bef38d45163c2f1dde094a7dfd33ccf595c92905c8f8f4fdc18d06fb1037718a"
-SRC_URI[bitflags-2.10.0.sha256sum] = "812e12b5285cc515a9c72a5c1d3b6d46a19dac5acfef5265968c166106e31dd3"
+SRC_URI[bitflags-2.11.0.sha256sum] = "843867be96c8daad0d758b57df9392b6d8d271134fce549de6ce169ff98a92af"
 SRC_URI[blake2-0.10.6.sha256sum] = "46502ad458c9a52b69d4d4d32775c788b7a1b85e8bc9d482d92250fc0e3f8efe"
 SRC_URI[block-buffer-0.10.4.sha256sum] = "3078c7629b62d3f0439517fa394996acacc5cbc91c5a20d8c658e77abd503a71"
 SRC_URI[block-padding-0.3.3.sha256sum] = "a8894febbff9f758034a5b8e12d87918f56dfc64a8e1fe757d65e29041538d93"
@@ -715,7 +737,7 @@ SRC_URI[bstr-1.12.0.sha256sum] = "234113d19d0d7d613b40e86fb654acf958910802bcceab
 SRC_URI[bumpalo-3.19.0.sha256sum] = "46c5e41b57b8bba42a04676d81cb89e9ee8e859a1a66f80a5a72e1cb76b34d43"
 SRC_URI[bytecheck-0.8.2.sha256sum] = "0caa33a2c0edca0419d15ac723dff03f1956f7978329b1e3b5fdaaaed9d3ca8b"
 SRC_URI[bytecheck_derive-0.8.2.sha256sum] = "89385e82b5d1821d2219e0b095efa2cc1f246cbf99080f3be46a1a85c0d392d9"
-SRC_URI[bytemuck-1.23.1.sha256sum] = "5c76a5792e44e4abe34d3abf15636779261d45a7450612059293d1d2cfc63422"
+SRC_URI[bytemuck-1.25.0.sha256sum] = "c8efb64bd706a16a1bdde310ae86b351e4d21550d98d056f22f8a7f7a2183fec"
 SRC_URI[byteorder-1.5.0.sha256sum] = "1fd0f2584146f6f2ef48085050886acf353beff7305ebd1ae69500e27c67f64b"
 SRC_URI[byteorder-lite-0.1.0.sha256sum] = "8f1fe948ff07f4bd06c30984e69f5b4899c516a3ef74f34df92a2df2ab535495"
 SRC_URI[bytes-1.11.1.sha256sum] = "1e748733b7cbc798e1434b6ac524f0c1ff2ab456fe201501e6497c8417a4fc33"
@@ -734,13 +756,13 @@ SRC_URI[ciborium-0.2.2.sha256sum] = "42e69ffd6f0917f5c029256a24d0161db17cea3997d
 SRC_URI[ciborium-io-0.2.2.sha256sum] = "05afea1e0a06c9be33d539b876f1ce3692f4afea2cb41f740e7743225ed1c757"
 SRC_URI[ciborium-ll-0.2.2.sha256sum] = "57663b653d948a338bfb3eeba9bb2fd5fcfaecb9e199e87e1eda4d9e8b240fd9"
 SRC_URI[cipher-0.4.4.sha256sum] = "773f3b9af64447d2ce9850330c473515014aa235e6a783b02db81ff39e4a3dad"
-SRC_URI[clap-4.5.57.sha256sum] = "6899ea499e3fb9305a65d5ebf6e3d2248c5fab291f300ad0a704fbe142eae31a"
-SRC_URI[clap_builder-4.5.57.sha256sum] = "7b12c8b680195a62a8364d16b8447b01b6c2c8f9aaf68bee653be34d4245e238"
+SRC_URI[clap-4.5.60.sha256sum] = "2797f34da339ce31042b27d23607e051786132987f595b02ba4f6a6dffb7030a"
+SRC_URI[clap_builder-4.5.60.sha256sum] = "24a241312cea5059b13574bb9b3861cabf758b879c15190b37b6d6fd63ab6876"
 SRC_URI[clap_complete-4.5.55.sha256sum] = "a5abde44486daf70c5be8b8f8f1b66c49f86236edf6fa2abadb4d961c4c6229a"
 SRC_URI[clap_complete_command-0.6.1.sha256sum] = "da8e198c052315686d36371e8a3c5778b7852fc75cc313e4e11eeb7a644a1b62"
 SRC_URI[clap_complete_nushell-4.5.8.sha256sum] = "0a0c951694691e65bf9d421d597d68416c22de9632e884c28412cb8cd8b73dce"
 SRC_URI[clap_derive-4.5.55.sha256sum] = "a92793da1a46a5f2a02a6f4c46c6496b28c43638adea8306fcb0caa1634f24e5"
-SRC_URI[clap_lex-0.7.5.sha256sum] = "b94f61472cee1439c0b966b47e3aca9ae07e45d070759512cd390ea2bebc6675"
+SRC_URI[clap_lex-1.0.0.sha256sum] = "3a822ea5bc7590f9d40f1ba12c0dc3c2760f3482c6984db1573ad11031420831"
 SRC_URI[codspeed-4.3.0.sha256sum] = "38c2eb3388ebe26b5a0ab6bf4969d9c4840143d7f6df07caa3cc851b0606cef6"
 SRC_URI[codspeed-criterion-compat-4.3.0.sha256sum] = "e1e270597a1d1e183f86d1cc9f94f0133654ee3daf201c17903ee29363555dd7"
 SRC_URI[codspeed-criterion-compat-walltime-4.3.0.sha256sum] = "e6c2613d2fac930fe34456be76f9124ee0800bb9db2e7fd2d6c65b9ebe98a292"
@@ -771,7 +793,7 @@ SRC_URI[crunchy-0.2.4.sha256sum] = "460fbee9c2c2f33933d720630a6a0bac33ba7053db53
 SRC_URI[crypto-common-0.1.6.sha256sum] = "1bfb12502f3fc46cca1bb51ac28df9d618d813cdc3d2f25b9fe775a34af26bb3"
 SRC_URI[csv-1.4.0.sha256sum] = "52cd9d68cf7efc6ddfaaee42e7288d3a99d613d4b50f76ce9827ae0c6e14f938"
 SRC_URI[csv-core-0.1.12.sha256sum] = "7d02f3b0da4c6504f86e9cd789d8dbafab48c2321be74e9987593de5a894d93d"
-SRC_URI[ctrlc-3.5.1.sha256sum] = "73736a89c4aff73035ba2ed2e565061954da00d4970fc9ac25dcc85a2a20d790"
+SRC_URI[ctrlc-3.5.2.sha256sum] = "e0b1fab2ae45819af2d0731d60f2afe17227ebb1a1538a236da84c93e9a60162"
 SRC_URI[cyclonedx-bom-0.8.0.sha256sum] = "ce2ec98a191e17f63b92b132f6852462de9eaee03ca8dbf2df401b9fd809bcac"
 SRC_URI[cyclonedx-bom-macros-0.1.0.sha256sum] = "c50341f21df64b412b4f917e34b7aa786c092d64f3f905f478cb76950c7e980c"
 SRC_URI[dashmap-6.1.0.sha256sum] = "5041cc499144891f3790297212f32a74fb938e5136a14943f338ef9e0ae276cf"
@@ -803,9 +825,9 @@ SRC_URI[encoding_rs_io-0.1.7.sha256sum] = "1cc3c5651fb62ab8aa3103998dade57efdd02
 SRC_URI[endi-1.1.0.sha256sum] = "a3d8a32ae18130a3c84dd492d4215c3d913c3b07c6b63c2eb3eb7ff1101ab7bf"
 SRC_URI[enumflags2-0.7.12.sha256sum] = "1027f7680c853e056ebcec683615fb6fbbc07dbaa13b4d5d9442b146ded4ecef"
 SRC_URI[enumflags2_derive-0.7.12.sha256sum] = "67c78a4d8fdf9953a5c9d458f9efe940fd97a0cab0941c075a813ac594733827"
-SRC_URI[env_filter-0.1.3.sha256sum] = "186e05a59d4c50738528153b83b0b0194d3a29507dfec16eccd4b342903397d0"
+SRC_URI[env_filter-1.0.0.sha256sum] = "7a1c3cc8e57274ec99de65301228b537f1e4eedc1b8e0f9411c6caac8ae7308f"
 SRC_URI[env_home-0.1.0.sha256sum] = "c7f84e12ccf0a7ddc17a6c41c93326024c42920d7ee630d04950e6926645c0fe"
-SRC_URI[env_logger-0.11.8.sha256sum] = "13c863f0904021b108aa8b2f55046443e6b1ebde8fd4a15c399893aae4fa069f"
+SRC_URI[env_logger-0.11.9.sha256sum] = "b2daee4ea451f429a58296525ddf28b45a3b64f1acf6587e2067437bb11e218d"
 SRC_URI[equivalent-1.0.2.sha256sum] = "877a4ace8713b0bcf2a4e7eec82529c029f1d0619886d18145fea96c3ffe5c0f"
 SRC_URI[erased-serde-0.4.6.sha256sum] = "e004d887f51fcb9fef17317a2f3525c887d8aa3f4f50fed920816a688284a5b7"
 SRC_URI[errno-0.3.13.sha256sum] = "778e2ac28f6c47af28e4907f13ffd1e1ddbd400980a9abd7c8df189bf578a5ad"
@@ -828,25 +850,26 @@ SRC_URI[fontconfig-parser-0.5.8.sha256sum] = "bbc773e24e02d4ddd8395fd30dc1475242
 SRC_URI[fontdb-0.23.0.sha256sum] = "457e789b3d1202543297a350643cf459f836cade38934e7a4cf6a39e7cde2905"
 SRC_URI[form_urlencoded-1.2.2.sha256sum] = "cb4cb245038516f5f85277875cdaa4f7d2c9a0fa0468de06ed190163b1581fcf"
 SRC_URI[fs-err-3.3.0.sha256sum] = "73fde052dbfc920003cfd2c8e2c6e6d4cc7c1091538c3a24226cec0665ab08c0"
-SRC_URI[futures-0.3.31.sha256sum] = "65bc07b1a8bc7c85c5f2e110c476c7389b4554ba72af57d8445ea63a576b0876"
-SRC_URI[futures-channel-0.3.31.sha256sum] = "2dff15bf788c671c1934e366d07e30c1814a8ef514e1af724a602e8a2fbe1b10"
-SRC_URI[futures-core-0.3.31.sha256sum] = "05f29059c0c2090612e8d742178b0580d2dc940c837851ad723096f87af6663e"
-SRC_URI[futures-executor-0.3.31.sha256sum] = "1e28d1d997f585e54aebc3f97d39e72338912123a67330d723fdbb564d646c9f"
-SRC_URI[futures-io-0.3.31.sha256sum] = "9e5c1b78ca4aae1ac06c48a526a655760685149f0d465d21f37abfe57ce075c6"
+SRC_URI[futures-0.3.32.sha256sum] = "8b147ee9d1f6d097cef9ce628cd2ee62288d963e16fb287bd9286455b241382d"
+SRC_URI[futures-channel-0.3.32.sha256sum] = "07bbe89c50d7a535e539b8c17bc0b49bdb77747034daa8087407d655f3f7cc1d"
+SRC_URI[futures-core-0.3.32.sha256sum] = "7e3450815272ef58cec6d564423f6e755e25379b217b0bc688e295ba24df6b1d"
+SRC_URI[futures-executor-0.3.32.sha256sum] = "baf29c38818342a3b26b5b923639e7b1f4a61fc5e76102d4b1981c6dc7a7579d"
+SRC_URI[futures-io-0.3.32.sha256sum] = "cecba35d7ad927e23624b22ad55235f2239cfa44fd10428eecbeba6d6a717718"
 SRC_URI[futures-lite-2.6.0.sha256sum] = "f5edaec856126859abb19ed65f39e90fea3a9574b9707f13539acf4abf7eb532"
-SRC_URI[futures-macro-0.3.31.sha256sum] = "162ee34ebcb7c64a8abebc059ce0fee27c2262618d7b60ed8faf72fef13c3650"
-SRC_URI[futures-sink-0.3.31.sha256sum] = "e575fab7d1e0dcb8d0c7bcf9a63ee213816ab51902e6d244a95819acacf1d4f7"
-SRC_URI[futures-task-0.3.31.sha256sum] = "f90f7dce0722e95104fcb095585910c0977252f286e354b5e3bd38902cd99988"
-SRC_URI[futures-util-0.3.31.sha256sum] = "9fa08315bb612088cc391249efdc3bc77536f16c91f6cf495e6fbe85b20a4a81"
+SRC_URI[futures-macro-0.3.32.sha256sum] = "e835b70203e41293343137df5c0664546da5745f82ec9b84d40be8336958447b"
+SRC_URI[futures-sink-0.3.32.sha256sum] = "c39754e157331b013978ec91992bde1ac089843443c49cbc7f46150b0fad0893"
+SRC_URI[futures-task-0.3.32.sha256sum] = "037711b3d59c33004d3856fbdc83b99d4ff37a24768fa1be9ce3538a1cde4393"
+SRC_URI[futures-util-0.3.32.sha256sum] = "389ca41296e6190b48053de0321d02a77f32f8a5d2461dd38762c0593805c6d6"
 SRC_URI[generic-array-0.14.7.sha256sum] = "85649ca51fd72272d7821adaf274ad91c288277713d9c18820d8499a7ff69e9a"
 SRC_URI[getrandom-0.2.16.sha256sum] = "335ff9f135e4384c8150d6f27c6daed433577f86b4750418338c01a1a2528592"
 SRC_URI[getrandom-0.3.3.sha256sum] = "26145e563e54f2cadc477553f1ec5ee650b00862f0a58bcd12cbdc5f0ea2d2f4"
+SRC_URI[getrandom-0.4.1.sha256sum] = "139ef39800118c7683f2fd3c98c1b23c09ae076556b435f8e9064ae108aaeeec"
 SRC_URI[gif-0.14.1.sha256sum] = "f5df2ba84018d80c213569363bdcd0c64e6933c67fe4c1d60ecf822971a3c35e"
 SRC_URI[glob-0.3.3.sha256sum] = "0cc23270f6e1808e30a928bdc84dea0b9b4136a8bc82338574f23baf47bbd280"
 SRC_URI[globset-0.4.18.sha256sum] = "52dfc19153a48bde0cbd630453615c8151bce3a5adfac7a0aebfbf0a1e1f57e3"
 SRC_URI[globwalk-0.9.1.sha256sum] = "0bf760ebf69878d9fd8f110c89703d90ce35095324d1f1edcb595c63945ee757"
 SRC_URI[gloo-timers-0.3.0.sha256sum] = "bbb143cf96099802033e0d4f4963b19fd2e0b728bcf076cd9cf7f6634f092994"
-SRC_URI[goblin-0.10.4.sha256sum] = "4db6758c546e6f81f265638c980e5e84dfbda80cfd8e89e02f83454c8e8124bd"
+SRC_URI[goblin-0.10.5.sha256sum] = "983a6aafb3b12d4c41ea78d39e189af4298ce747353945ff5105b54a056e5cd9"
 SRC_URI[h2-0.4.13.sha256sum] = "2f44da3a8150a6703ed5d34e164b875fd14c2cdab9af1252a9a1020bde2bdc54"
 SRC_URI[half-2.6.0.sha256sum] = "459196ed295495a68f7d7fe1d84f6c4b7ff0e21fe3017b2f283c6fac3ad803c9"
 SRC_URI[hashbrown-0.14.5.sha256sum] = "e5274423e17b7c9fc20b6e7e208532f9b19825d82dfd615708b70edd83df41f1"
@@ -875,6 +898,7 @@ SRC_URI[icu_normalizer_data-2.0.0.sha256sum] = "00210d6893afc98edb752b664b8890f0
 SRC_URI[icu_properties-2.0.1.sha256sum] = "016c619c1eeb94efb86809b015c58f479963de65bdb6253345c1a1276f22e32b"
 SRC_URI[icu_properties_data-2.0.1.sha256sum] = "298459143998310acd25ffe6810ed544932242d3f07083eee1084d83a71bd632"
 SRC_URI[icu_provider-2.0.0.sha256sum] = "03c80da27b5f4187909049ee2d72f276f0d9f99a42c306bd0131ecfe04d8e5af"
+SRC_URI[id-arena-2.3.0.sha256sum] = "3d3067d79b975e8844ca9eb072e16b31c3c1c36928edf9c6789548c524d0d954"
 SRC_URI[idna-1.1.0.sha256sum] = "3b0875f23caa03898994f6ddc501886a45c7d3d62d04d2d90788d47be1b1e4de"
 SRC_URI[idna_adapter-1.2.1.sha256sum] = "3acae9609540aa318d1bc588455225fb2085b9ed0c4f6bd0d9d5bcd86f1a0344"
 SRC_URI[ignore-0.4.25.sha256sum] = "d3d782a365a015e0f5c04902246139249abf769125006fbe7649e2ee88169b4a"
@@ -882,7 +906,7 @@ SRC_URI[image-0.25.6.sha256sum] = "db35664ce6b9810857a38a906215e75a9c879f0696556
 SRC_URI[image-webp-0.2.4.sha256sum] = "525e9ff3e1a4be2fbea1fdf0e98686a6d98b4d8f937e1bf7402245af1909e8c3"
 SRC_URI[imagesize-0.14.0.sha256sum] = "09e54e57b4c48b40f7aec75635392b12b3421fa26fe8b4332e63138ed278459c"
 SRC_URI[indexmap-2.13.0.sha256sum] = "7714e70437a7dc3ac8eb7e6f8df75fd8eb422675fc7678aff7364301092b1017"
-SRC_URI[indicatif-0.18.3.sha256sum] = "9375e112e4b463ec1b1c6c011953545c65a30164fbab5b581df32b3abf0dcb88"
+SRC_URI[indicatif-0.18.4.sha256sum] = "25470f23803092da7d239834776d653104d551bc4d7eacaf31e6837854b8e9eb"
 SRC_URI[indoc-2.0.7.sha256sum] = "79cf5c93f93228cf8efb3ba362535fb11199ac548a09ce117c9b1adc3030d706"
 SRC_URI[inout-0.1.4.sha256sum] = "879f10e63c20629ecabbb64a8010319738c66a5cd0c29b02d63d272b03751d01"
 SRC_URI[insta-1.46.3.sha256sum] = "e82db8c87c7f1ccecb34ce0c24399b8a73081427f3c7c50a5d597925356115e4"
@@ -897,27 +921,28 @@ SRC_URI[itertools-0.10.5.sha256sum] = "b0fd2260e829bddf4cb6ea802289de2f86d6a7a69
 SRC_URI[itertools-0.13.0.sha256sum] = "413ee7dfc52ee1a4949ceeb7dbc8a33f2d6c088194d9f922fb8318faf1f01186"
 SRC_URI[itertools-0.14.0.sha256sum] = "2b192c782037fadd9cfa75548310488aabdbf3d2da73885b31bd0abd03351285"
 SRC_URI[itoa-1.0.15.sha256sum] = "4a5f13b858c8d314ee3e8f639011f7ccefe71f97f96e50151fb991f267928e2c"
-SRC_URI[jiff-0.2.19.sha256sum] = "d89a5b5e10d5a9ad6e5d1f4bd58225f655d6fe9767575a5e8ac5a6fe64e04495"
-SRC_URI[jiff-static-0.2.19.sha256sum] = "ff7a39c8862fc1369215ccf0a8f12dd4598c7f6484704359f0351bd617034dbf"
+SRC_URI[jiff-0.2.22.sha256sum] = "819b44bc7c87d9117eb522f14d46e918add69ff12713c475946b0a29363ed1c2"
+SRC_URI[jiff-static-0.2.22.sha256sum] = "470252db18ecc35fd766c0891b1e3ec6cbbcd62507e85276c01bf75d8e94d4a1"
 SRC_URI[jiff-tzdb-0.1.4.sha256sum] = "c1283705eb0a21404d2bfd6eef2a7593d240bc42a0bdb39db0ad6fa2ec026524"
 SRC_URI[jiff-tzdb-platform-0.1.3.sha256sum] = "875a5a69ac2bab1a891711cf5eccbec1ce0341ea805560dcd90b7a2e925132e8"
 SRC_URI[jobserver-0.1.34.sha256sum] = "9afb3de4395d6b3e67a780b6de64b51c978ecf11cb9a462c66be7d4ca9039d33"
 SRC_URI[js-sys-0.3.77.sha256sum] = "1cfaf33c695fc6e08064efbc1f72ec937429614f25eef83af942d0e227c3a28f"
 SRC_URI[jsonwebtoken-9.3.1.sha256sum] = "5a87cc7a48537badeae96744432de36f4be2b4a34a05a5ef32e9dd8a1c169dde"
-SRC_URI[junction-1.4.1.sha256sum] = "642883fdc81cf2da15ee8183fa1d2c7da452414dd41541a0f3e1428069345447"
+SRC_URI[junction-1.4.2.sha256sum] = "8cfc352a66ba903c23239ef51e809508b6fc2b0f90e3476ac7a9ff47e863ae95"
 SRC_URI[kurbo-0.13.0.sha256sum] = "7564e90fe3c0d5771e1f0bc95322b21baaeaa0d9213fa6a0b61c99f8b17b3bfb"
 SRC_URI[lazy_static-1.5.0.sha256sum] = "bbd2bcb4c963f2ddae06a2efc7e9f3591312473c50c6685e1f298068316e66fe"
+SRC_URI[leb128fmt-0.1.0.sha256sum] = "09edd9e8b54e49e587e4f6295a7d29c3ea94d469cb40ab8ca70b288248a81db2"
 SRC_URI[libbz2-rs-sys-0.2.2.sha256sum] = "2c4a545a15244c7d945065b5d392b2d2d7f21526fba56ce51467b06ed445e8f7"
-SRC_URI[libc-0.2.178.sha256sum] = "37c93d8daa9d8a012fd8ab92f088405fb202ea0b6ab73ee2482ae66af4f42091"
+SRC_URI[libc-0.2.180.sha256sum] = "bcc35a38544a891a5f7c865aca548a982ccb3b8650a5b06d0fd33a10283c56fc"
 SRC_URI[libm-0.2.15.sha256sum] = "f9fbbcab51052fe104eb5e5d351cf728d30a5be1fe14d9be8a3b097481fb97de"
 SRC_URI[libmimalloc-sys-0.1.44.sha256sum] = "667f4fec20f29dfc6bc7357c582d91796c169ad7e2fce709468aefeb2c099870"
 SRC_URI[libredox-0.1.12.sha256sum] = "3d0b95e02c851351f877147b7deea7b1afb1df71b63aa5f8270716e0c5720616"
 SRC_URI[linux-raw-sys-0.11.0.sha256sum] = "df1d3c3b53da64cf5760482273a98e575c651a67eec7f77df96b5b642de8f039"
 SRC_URI[litemap-0.8.0.sha256sum] = "241eaef5fd12c88705a01fc1066c48c4b36e0dd4377dcdc7ec3942cea7a69956"
 SRC_URI[lock_api-0.4.13.sha256sum] = "96936507f153605bddfcda068dd804796c84324ed2510809e5b2a624c81da765"
-SRC_URI[log-0.4.27.sha256sum] = "13dc2df351e3202783a1fe0d44375f7295ffb4049267b0f3018346dc122a1d94"
+SRC_URI[log-0.4.29.sha256sum] = "5e5032e24019045c762d3c0f28f5b6b8bbf38563a65908389bf7978758920897"
 SRC_URI[lru-slab-0.1.2.sha256sum] = "112b39cec0b298b6c1999fee3e31427f74f676e4cb9879ed1a121b43661a4154"
-SRC_URI[lzma-rust2-0.15.7.sha256sum] = "1670343e58806300d87950e3401e820b519b9384281bbabfb15e3636689ffd69"
+SRC_URI[lzma-rust2-0.16.1.sha256sum] = "d673a11333485e7d8b93d62a9a5b07b22daf5e8a8655a44c1bb18aa4bf3d1524"
 SRC_URI[lzma-sys-0.1.20.sha256sum] = "5fda04ab3764e6cde78b9974eec4f779acaba7c4e84b36eca3cf77c581b85d27"
 SRC_URI[mailparse-0.16.1.sha256sum] = "60819a97ddcb831a5614eb3b0174f3620e793e97e09195a395bfa948fd68ed2f"
 SRC_URI[markdown-1.0.0.sha256sum] = "a5cab8f2cadc416a82d2e783a1946388b31654d391d1c7d92cc1f03e295b1deb"
@@ -939,6 +964,7 @@ SRC_URI[munge-0.4.5.sha256sum] = "9cce144fab80fbb74ec5b89d1ca9d41ddf6b644ab7e986
 SRC_URI[munge_macro-0.4.5.sha256sum] = "574af9cd5b9971cbfdf535d6a8d533778481b241c447826d976101e0149392a1"
 SRC_URI[nanoid-0.4.0.sha256sum] = "3ffa00dec017b5b1a8b7cf5e2c008bfda1aa7e0697ac1508b491fdf2622fb4d8"
 SRC_URI[nix-0.30.1.sha256sum] = "74523f3a35e05aba87a1d978330aef40f67b0304ac79c1c00b294c9830543db6"
+SRC_URI[nix-0.31.1.sha256sum] = "225e7cfe711e0ba79a68baeddb2982723e4235247aefce1482f2f16c27865b66"
 SRC_URI[nom-7.1.3.sha256sum] = "d273983c5a657a70a3e8f2a01329822f3b8c8172b73826411a55751e404a0a4a"
 SRC_URI[normalize-line-endings-0.3.0.sha256sum] = "61807f77802ff30975e01f4f071c8ba10c022052f98b3294119f3e615d13e5be"
 SRC_URI[nu-ansi-term-0.50.1.sha256sum] = "d4a28e057d01f97e61255210fcff094d74ed0466038633e95017f5beb68e4399"
@@ -946,7 +972,7 @@ SRC_URI[num-0.4.3.sha256sum] = "35bd024e8b2ff75562e5f34e7f4905839deb4b22955ef5e7
 SRC_URI[num-bigint-0.4.6.sha256sum] = "a5e44f723f1133c9deac646763579fdb3ac745e418f2a7af9cd0c431da1f20b9"
 SRC_URI[num-bigint-dig-0.8.6.sha256sum] = "e661dda6640fad38e827a6d4a310ff4763082116fe217f279885c97f511bb0b7"
 SRC_URI[num-complex-0.4.6.sha256sum] = "73f88a1307638156682bada9d7604135552957b7818057dcef22705b4d509495"
-SRC_URI[num-conv-0.1.0.sha256sum] = "51d515d32fb182ee37cda2ccdcb92950d6a3c2893aa280e540671c2cd0f3b1d9"
+SRC_URI[num-conv-0.2.0.sha256sum] = "cf97ec579c3c42f953ef76dbf8d55ac91fb219dde70e49aa4a6b7d74e9919050"
 SRC_URI[num-integer-0.1.46.sha256sum] = "7969661fd2958a5cb096e56c8e1ad0444ac2bbcd0061bd28660485a44879858f"
 SRC_URI[num-iter-0.1.45.sha256sum] = "1429034a0490724d0075ebb2bc9e875d6503c3cf69e235a8941aa757d83ef5bf"
 SRC_URI[num-rational-0.4.2.sha256sum] = "f83d14da390562dca69fc84082e73e548e1ad308d24accdedd2720017cb37824"
@@ -965,7 +991,7 @@ SRC_URI[ordered-float-4.6.0.sha256sum] = "7bb71e1b3fa6ca1c61f383464aaf2bb0e2f8e7
 SRC_URI[ordered-multimap-0.7.3.sha256sum] = "49203cdcae0030493bad186b28da2fa25645fa276a51b6fec8010d281e02ef79"
 SRC_URI[ordered-stream-0.2.0.sha256sum] = "9aa2b01e1d916879f73a53d01d1d6cee68adbb31d6d9177a8cfce093cced1d50"
 SRC_URI[os_str_bytes-6.6.1.sha256sum] = "e2355d85b9a3786f481747ced0e0ff2ba35213a1f9bd406ed906554d7af805a1"
-SRC_URI[owo-colors-4.2.3.sha256sum] = "9c6901729fa79e91a0913333229e9ca5dc725089d1c363b2f4b4760709dc4a52"
+SRC_URI[owo-colors-4.3.0.sha256sum] = "d211803b9b6b570f68772237e415a029d5a50c65d382910b879fb19d3271f94d"
 SRC_URI[parking-2.2.1.sha256sum] = "f38d5652c16fde515bb1ecef450ab0f6a219d619a7274976324d5e377f7dceba"
 SRC_URI[parking_lot-0.12.4.sha256sum] = "70d58bf43669b5795d1576d0641cfb6fbb2057bf629506267a92807158584a13"
 SRC_URI[parking_lot_core-0.9.11.sha256sum] = "bc838d2a56b5b1a6c25f55575dfc605fabb63bb2365f6c2353ef9159aa69e4a5"
@@ -991,17 +1017,18 @@ SRC_URI[pkcs5-0.7.1.sha256sum] = "e847e2c91a18bfa887dd028ec33f2fe6f25db77db36190
 SRC_URI[pkcs8-0.10.2.sha256sum] = "f950b2377845cebe5cf8b5165cb3cc1a5e0fa5cfa3e1f7f55707d8fd82e0a7b7"
 SRC_URI[pkg-config-0.3.32.sha256sum] = "7edddbd0b52d732b21ad9a5fab5c704c14cd949e5e9a1ec5929a24fded1b904c"
 SRC_URI[plain-0.2.3.sha256sum] = "b4596b6d070b27117e987119b4dac604f3c58cfb0b191112e24771b2faeac1a6"
-SRC_URI[png-0.17.16.sha256sum] = "82151a2fc869e011c153adc57cf2789ccb8d9906ce52c0b39a6b5697749d7526"
+SRC_URI[png-0.18.1.sha256sum] = "60769b8b31b2a9f263dae2776c37b1b28ae246943cf719eb6946a1db05128a61"
 SRC_URI[poloto-19.1.2.sha256sum] = "164dbd541c9832e92fa34452e9c2e98b515a548a3f8549fb2402fe1cd5e46b96"
-SRC_URI[portable-atomic-1.11.1.sha256sum] = "f84267b20a16ea918e43c6a88433c2d54fa145c92a811b5b047ccbe153674483"
+SRC_URI[portable-atomic-1.13.1.sha256sum] = "c33a9471896f1c69cecef8d20cbe2f7accd12527ce60845ff44c153bb2a21b49"
 SRC_URI[portable-atomic-util-0.2.4.sha256sum] = "d8a2f0d8d040d7848a709caf78912debcc3f33ee4b3cac47d73d1e1069e83507"
 SRC_URI[potential_utf-0.1.2.sha256sum] = "e5a7c30837279ca13e7c867e9e40053bc68740f988cb07f7ca6df43cc734b585"
 SRC_URI[powerfmt-0.2.0.sha256sum] = "439ee305def115ba05938db6eb1644ff94165c5ab5e9420d1c1bcedbba909391"
 SRC_URI[ppv-lite86-0.2.21.sha256sum] = "85eae3c4ed2f50dcfe72643da4befc30deadb458a9b590d720cde2f2b1e97da9"
-SRC_URI[predicates-3.1.3.sha256sum] = "a5d19ee57562043d37e82899fade9a22ebab7be9cef5026b07fda9cdd4293573"
+SRC_URI[predicates-3.1.4.sha256sum] = "ada8f2932f28a27ee7b70dd6c1c39ea0675c55a36879ab92f3a715eaa1e63cfe"
 SRC_URI[predicates-core-1.0.9.sha256sum] = "727e462b119fe9c93fd0eb1429a5f7647394014cf3c04ab2c0350eeb09095ffa"
 SRC_URI[predicates-tree-1.0.12.sha256sum] = "72dd2d6d381dfb73a193c7fca536518d7caee39fc8503f74e7dc0be0531b425c"
 SRC_URI[pretty_assertions-1.4.1.sha256sum] = "3ae130e2f271fbc2ac3a40fb1d07180839cdbbe443c7a27e1e3c13c5cac0116d"
+SRC_URI[prettyplease-0.2.37.sha256sum] = "479ca8adacdd7ce8f1fb39ce9ecccbfe93a3f1344b3d0d97f20bc0196208f62b"
 SRC_URI[priority-queue-2.5.0.sha256sum] = "5676d703dda103cbb035b653a9f11448c0a7216c7926bd35fcb5865475d0c970"
 SRC_URI[proc-macro-crate-3.3.0.sha256sum] = "edce586971a4dfaa28950c6f18ed55e0406c1ab88bbce2c6f6293a7aaba73d35"
 SRC_URI[proc-macro2-1.0.106.sha256sum] = "8fd00f0bb2e90d81d1044c2b32617f68fcb9fa3bb7640c23e9c748e53fb30934"
@@ -1013,7 +1040,7 @@ SRC_URI[purl-0.1.6.sha256sum] = "60ebe4262ae91ddd28c8721111a0a6e9e58860e211fc921
 SRC_URI[quick-error-2.0.1.sha256sum] = "a993555f31e5a609f617c12db6250dedcac1b0a85076912c436e6fc9b2c8e6a3"
 SRC_URI[quick-xml-0.38.3.sha256sum] = "42a232e7487fc2ef313d96dde7948e7a3c05101870d8985e4fd8d26aedd27b89"
 SRC_URI[quinn-0.11.8.sha256sum] = "626214629cda6781b6dc1d316ba307189c85ba657213ce642d9c77670f8202c8"
-SRC_URI[quinn-proto-0.11.12.sha256sum] = "49df843a9161c85bb8aae55f101bc0bac8bcafd637a620d9122fd7e0b2f7422e"
+SRC_URI[quinn-proto-0.11.14.sha256sum] = "434b42fec591c96ef50e21e886936e66d3cc3f737104fdb9b737c40ffb94c098"
 SRC_URI[quinn-udp-0.5.13.sha256sum] = "fcebb1209ee276352ef14ff8732e24cc2b02bbac986cd74a4c81bcb2f9881970"
 SRC_URI[quote-1.0.44.sha256sum] = "21b2ebcf727b7760c461f091f9f0f539b77b8e87f2fd88131e7f1b433b3cece4"
 SRC_URI[quoted_printable-0.5.1.sha256sum] = "640c9bd8497b02465aeef5375144c26062e0dcd5939dfcbb0f5db76cb8c17c73"
@@ -1033,7 +1060,7 @@ SRC_URI[redox_syscall-0.7.0.sha256sum] = "49f3fe0889e69e2ae9e41f4d6c4c0181701d00
 SRC_URI[redox_users-0.5.0.sha256sum] = "dd6f9d3d47bdd2ad6945c5015a226ec6155d0bcdfd8f7cd29f86b71f8de99d2b"
 SRC_URI[ref-cast-1.0.25.sha256sum] = "f354300ae66f76f1c85c5f84693f0ce81d747e2c3f21a45fef496d89c960bf7d"
 SRC_URI[ref-cast-impl-1.0.25.sha256sum] = "b7186006dcb21920990093f30e3dea63b7d6e977bf1256be20c3563a5db070da"
-SRC_URI[reflink-copy-0.1.28.sha256sum] = "23bbed272e39c47a095a5242218a67412a220006842558b03fe2935e8f3d7b92"
+SRC_URI[reflink-copy-0.1.29.sha256sum] = "13362233b147e57674c37b802d216b7c5e3dcccbed8967c84f0d8d223868ae27"
 SRC_URI[regex-1.12.3.sha256sum] = "e10754a14b9137dd7b1e3e5b0493cc9171fdd105e0ab477f51b72e7f3ac0e276"
 SRC_URI[regex-automata-0.4.14.sha256sum] = "6e1dd4122fc1595e8162618945476892eefca7b88c52820e74af6262213cae8f"
 SRC_URI[regex-syntax-0.8.5.sha256sum] = "2b15c43186be67a4fd63bee50d0303afffcef381492ebe2c5d87f324e1b8815c"
@@ -1046,23 +1073,23 @@ SRC_URI[reqsign-file-read-tokio-2.0.1.sha256sum] = "669ea66036266a9ac371d2e63cc7
 SRC_URI[reqsign-google-2.0.1.sha256sum] = "16e1942acf06b8638f16775e92e4ca9cca239519ea6f4e650d5924d1f0dc37d1"
 SRC_URI[reqsign-http-send-reqwest-2.0.1.sha256sum] = "46186bce769674f9200ad01af6f2ca42de3e819ddc002fff1edae135bfb6cd9c"
 SRC_URI[reqwest-0.12.22.sha256sum] = "cbc931937e6ca3a06e3b6c0aa7841849b160a90351d6ab467a8b9b9959767531"
-SRC_URI[resvg-0.46.0.sha256sum] = "b563218631706d614e23059436526d005b50ab5f2d506b55a17eb65c5eb83419"
+SRC_URI[resvg-0.47.0.sha256sum] = "9be183ad6a216aa96f33e4c8033b0988b8b3ea6fd2359d19af5bac4643fd8e81"
 SRC_URI[retry-policies-0.5.1.sha256sum] = "46a4bd6027df676bcb752d3724db0ea3c0c5fc1dd0376fec51ac7dcaf9cc69be"
 SRC_URI[rgb-0.8.52.sha256sum] = "0c6a884d2998352bb4daf0183589aec883f16a6da1f4dde84d8e2e9a5409a1ce"
 SRC_URI[ring-0.17.14.sha256sum] = "a4689e6c2294d81e88dc6261c768b63bc4fcdb852be6d1352498b114f61383b7"
-SRC_URI[rkyv-0.8.14.sha256sum] = "360b333c61ae24e5af3ae7c8660bd6b21ccd8200dbbc5d33c2454421e85b9c69"
-SRC_URI[rkyv_derive-0.8.14.sha256sum] = "7c02f8cdd12b307ab69fe0acf4cd2249c7460eb89dce64a0febadf934ebb6a9e"
+SRC_URI[rkyv-0.8.15.sha256sum] = "1a30e631b7f4a03dee9056b8ef6982e8ba371dd5bedb74d3ec86df4499132c70"
+SRC_URI[rkyv_derive-0.8.15.sha256sum] = "8100bb34c0a1d0f907143db3149e6b4eea3c33b9ee8b189720168e818303986f"
 SRC_URI[rmp-0.8.14.sha256sum] = "228ed7c16fa39782c3b3468e974aec2795e9089153cd08ee2e9aefb3613334c4"
 SRC_URI[rmp-serde-1.3.1.sha256sum] = "72f81bee8c8ef9b577d1681a70ebbc962c232461e397b22c208c43c04b67a155"
 SRC_URI[roxmltree-0.20.0.sha256sum] = "6c20b6793b5c2fa6553b250154b78d6d0db37e72700ae35fad9387a46f487c97"
 SRC_URI[roxmltree-0.21.1.sha256sum] = "f1964b10c76125c36f8afe190065a4bf9a87bf324842c05701330bba9f1cacbb"
-SRC_URI[rsa-0.9.9.sha256sum] = "40a0376c50d0358279d9d643e4bf7b7be212f1f4ff1da9070a7b54d22ef75c88"
+SRC_URI[rsa-0.9.10.sha256sum] = "b8573f03f5883dcaebdfcf4725caa1ecb9c15b2ef50c43a07b816e06799bb12d"
 SRC_URI[rust-ini-0.21.3.sha256sum] = "796e8d2b6696392a43bea58116b667fb4c29727dc5abd27d6acf338bb4f688c7"
 SRC_URI[rust-netrc-0.1.2.sha256sum] = "7e98097f62769f92dbf95fb51f71c0a68ec18a4ee2e70e0d3e4f47ac005d63e9"
 SRC_URI[rustc-hash-2.1.1.sha256sum] = "357703d41365b4b27c590e3ed91eabb1b663f07c4c084095e60cbed4362dff0d"
 SRC_URI[rusticata-macros-4.1.0.sha256sum] = "faf0c4a6ece9950b9abdb62b1cfcf2a68b3b67a10ba445b3bb85be2a293d0632"
 SRC_URI[rustix-1.1.3.sha256sum] = "146c9e247ccc180c1f61615433868c99f3de3ae256a30a43b49f67c2d9171f34"
-SRC_URI[rustls-0.23.36.sha256sum] = "c665f33d38cea657d9614f766881e4d510e0eda4239891eea56b4cadcf01801b"
+SRC_URI[rustls-0.23.37.sha256sum] = "758025cb5fccfd3bc2fd74708fd4682be41d99e5dff73c377c0646c6012c73a4"
 SRC_URI[rustls-native-certs-0.8.2.sha256sum] = "9980d917ebb0c0536119ba501e90834767bffc3d60641457fd84a1f3fd337923"
 SRC_URI[rustls-pki-types-1.13.3.sha256sum] = "4910321ebe4151be888e35fe062169554e74aad01beafed60410131420ceffbc"
 SRC_URI[rustls-webpki-0.103.8.sha256sum] = "2ffdfa2f5286e2247234e03f680868ac2815974dc39e00ea15adc445d0aafe52"
@@ -1081,8 +1108,8 @@ SRC_URI[scrypt-0.11.0.sha256sum] = "0516a385866c09368f0b5bcd1caff3366aace790fcd4
 SRC_URI[seahash-4.1.0.sha256sum] = "1c107b6f4780854c8b126e228ea8869f4d7b71260f962fefb57b996b8959ba6b"
 SRC_URI[secrecy-0.10.3.sha256sum] = "e891af845473308773346dc847b2c23ee78fe442e0472ac50e22a18a93d3ae5a"
 SRC_URI[secret-service-5.1.0.sha256sum] = "9a62d7f86047af0077255a29494136b9aaaf697c76ff70b8e49cded4e2623c14"
-SRC_URI[security-framework-3.5.1.sha256sum] = "b3297343eaf830f66ede390ea39da1d462b6b0c1b000f420d0a83f898bbbe6ef"
-SRC_URI[security-framework-sys-2.15.0.sha256sum] = "cc1f0cbffaac4852523ce30d8bd3c5cdc873501d96ff467ca09b6767bb8cd5c0"
+SRC_URI[security-framework-3.7.0.sha256sum] = "b7f4bc775c73d9a02cde8bf7b2ec4c9d12743edf609006c7facc23998404cd1d"
+SRC_URI[security-framework-sys-2.17.0.sha256sum] = "6ce2691df843ecc5d231c0b14ece2acc3efb62c0a398c7e1d875f3983ce020e3"
 SRC_URI[self-replace-1.5.0.sha256sum] = "03ec815b5eab420ab893f63393878d89c90fdd94c0bcc44c07abb8ad95552fb7"
 SRC_URI[semver-1.0.26.sha256sum] = "56e6fa9c48d24d85fb3de5ad847117517440f6beceb7798af16b4a87d616b8d0"
 SRC_URI[serde-1.0.228.sha256sum] = "9a8e94ea7f378bd32cbbd37198a4a91436180c5bb472411e48b5ec2e2124ae9e"
@@ -1116,7 +1143,7 @@ SRC_URI[smawk-0.3.2.sha256sum] = "b7c388c1b5e93756d0c740965c41e8822f866621d41acb
 SRC_URI[socket2-0.5.10.sha256sum] = "e22376abed350d73dd1cd119b57ffccad95b4e585a7cda43e286245ce23c0678"
 SRC_URI[socket2-0.6.0.sha256sum] = "233504af464074f9d066d7b5416c5f9b894a5862a6506e306f7b816cdd6f1807"
 SRC_URI[spdx-0.10.9.sha256sum] = "c3e17e880bafaeb362a7b751ec46bdc5b61445a188f80e0606e68167cd540fa3"
-SRC_URI[spdx-0.13.3.sha256sum] = "afd765179d12cdd06192e02b1d8c6b0d46bd26de9bf16ce04c881428ca2cc7ed"
+SRC_URI[spdx-0.13.4.sha256sum] = "a8da593e30beb790fc9424502eb898320b44e5eb30367dbda1c1edde8e2f32d7"
 SRC_URI[spin-0.9.8.sha256sum] = "6980e8d7511241f8acf4aebddbb1ff938df5eebe98691418c4468d0b72a96a67"
 SRC_URI[spki-0.7.3.sha256sum] = "d91ed6c858b01f942cd56b37a94b3e0a1798290327d1236e4d9cf4eaca44d29d"
 SRC_URI[stable_deref_trait-1.2.0.sha256sum] = "a8f112729512f8e442d81f95a8a7ddf2b7c6b8a1a6f509a95864142b30cab2d3"
@@ -1132,17 +1159,16 @@ SRC_URI[supports-hyperlinks-3.1.0.sha256sum] = "804f44ed3c63152de6a9f90acbea1a11
 SRC_URI[supports-unicode-3.0.0.sha256sum] = "b7401a30af6cb5818bb64852270bb722533397edcfc7344954a38f420819ece2"
 SRC_URI[svg-0.18.0.sha256sum] = "94afda9cd163c04f6bee8b4bf2501c91548deae308373c436f36aeff3cf3c4a3"
 SRC_URI[svgtypes-0.16.1.sha256sum] = "695b5790b3131dafa99b3bbfd25a216edb3d216dad9ca208d4657bfb8f2abc3d"
-SRC_URI[syn-2.0.114.sha256sum] = "d4d107df263a3013ef9b1879b0df87d706ff80f65a86ea879bd9c31f9b307c2a"
+SRC_URI[syn-2.0.117.sha256sum] = "e665b8803e7b1d2a727f4023456bbbbe74da67099c585258af0ad9c5013b9b99"
 SRC_URI[sync_wrapper-1.0.2.sha256sum] = "0bf256ce5efdfa370213c1dabab5935a12e49f2c58d15e9eac2870d3b4f27263"
 SRC_URI[synstructure-0.13.2.sha256sum] = "728a70f3dbaf5bab7f0c4b1ac8d7ae5ea60a4b5549c8a5914361c99147a709d2"
-SRC_URI[sys-info-0.9.1.sha256sum] = "0b3a0d0aba8bf96a0e1ddfdc352fc53b3df7f39318c71854910c3c4b024ae52c"
 SRC_URI[system-configuration-0.7.0.sha256sum] = "a13f3d0daba03132c0aa9767f98351b3488edc2c100cda2d2ec2b04f3d8d3c8b"
 SRC_URI[system-configuration-sys-0.6.0.sha256sum] = "8e1d1b10ced5ca923a1fcb8d03e96b8d3268065d724548c0211415ff6ac6bac4"
 SRC_URI[tagu-0.1.6.sha256sum] = "eddb6b06d20fba9ed21fca3d696ee1b6e870bca0bcf9fa2971f6ae2436de576a"
 SRC_URI[tar-0.4.44.sha256sum] = "1d863878d212c87a19c1a610eb53bb01fe12951c0501cf5a0d65f724914a667a"
-SRC_URI[target-lexicon-0.13.4.sha256sum] = "b1dd07eb858a2067e2f3c7155d54e929265c264e6f37efe3ee7a8d1b5a1dd0ba"
+SRC_URI[target-lexicon-0.13.5.sha256sum] = "adb6935a6f5c20170eeceb1a3835a49e12e19d792f6dd344ccc76a985ca5a6ca"
 SRC_URI[temp-env-0.3.6.sha256sum] = "96374855068f47402c3121c6eed88d29cb1de8f3ab27090e273e420bdabcf050"
-SRC_URI[tempfile-3.24.0.sha256sum] = "655da9c7eb6305c55742045d5a8d2037996d61d8de95806335c7c86ce0f82e9c"
+SRC_URI[tempfile-3.25.0.sha256sum] = "0136791f7c95b1f6dd99f9cc786b91bb81c3800b639b3478e561ddb7be95e5f1"
 SRC_URI[terminal_size-0.4.2.sha256sum] = "45c6481c4829e4cc63825e62c49186a34538b7b2750b73b266581ffb612fb5ed"
 SRC_URI[termtree-0.5.1.sha256sum] = "8f50febec83f5ee1df3015341d8bd429f2d1cc62bcba7ea2076759d315084683"
 SRC_URI[test-case-3.3.1.sha256sum] = "eb2550dd13afcd286853192af8601920d959b14c401fcece38071d53bf0768a8"
@@ -1158,12 +1184,12 @@ SRC_URI[thiserror-impl-2.0.18.sha256sum] = "ebc4ee7f67670e9b64d05fa4253e753e016c
 SRC_URI[thread_local-1.1.9.sha256sum] = "f60246a4944f24f6e018aa17cdeffb7818b76356965d03b07d6a9886e8962185"
 SRC_URI[tikv-jemalloc-sys-0.6.1+5.3.0-1-ge13ca993e8ccb9ba9847cc330696e02839f328f7.sha256sum] = "cd8aa5b2ab86a2cefa406d889139c162cbb230092f7d1d7cbc1716405d852a3b"
 SRC_URI[tikv-jemallocator-0.6.1.sha256sum] = "0359b4327f954e0567e69fb191cf1436617748813819c94b8cd4a431422d053a"
-SRC_URI[time-0.3.44.sha256sum] = "91e7d9e3bb61134e77bde20dd4825b97c010155709965fedf0f49bb138e52a9d"
-SRC_URI[time-core-0.1.6.sha256sum] = "40868e7c1d2f0b8d73e4a8c7f0ff63af4f6d19be117e90bd73eb1d62cf831c6b"
-SRC_URI[time-macros-0.2.24.sha256sum] = "30cfb0125f12d9c277f35663a0a33f8c30190f4e4574868a330595412d34ebf3"
+SRC_URI[time-0.3.47.sha256sum] = "743bd48c283afc0388f9b8827b976905fb217ad9e647fae3a379a9283c4def2c"
+SRC_URI[time-core-0.1.8.sha256sum] = "7694e1cfe791f8d31026952abf09c69ca6f6fa4e1a1229e18988f06a04a12dca"
+SRC_URI[time-macros-0.2.27.sha256sum] = "2e70e4c5a0e0a8a4823ad65dfe1a6930e4f4d756dcd9dd7939022b5e8c501215"
 SRC_URI[tiny-keccak-2.0.2.sha256sum] = "2c9d3793400a45f954c52e73d068316d76b6f4e36977e3fcebb13a2721e80237"
-SRC_URI[tiny-skia-0.11.4.sha256sum] = "83d13394d44dae3207b52a326c0c85a8bf87f1541f23b0d143811088497b09ab"
-SRC_URI[tiny-skia-path-0.11.4.sha256sum] = "9c9e7fc0c2e86a30b117d0462aa261b72b7a99b7ebd7deb3a14ceda95c5bdc93"
+SRC_URI[tiny-skia-0.12.0.sha256sum] = "47ffee5eaaf5527f630fb0e356b90ebdec84d5d18d937c5e440350f88c5a91ea"
+SRC_URI[tiny-skia-path-0.12.0.sha256sum] = "edca365c3faccca67d06593c5980fa6c57687de727a03131735bb85f01fdeeb9"
 SRC_URI[tinystr-0.8.1.sha256sum] = "5d4f6d1145dcb577acf783d4e601bc1d76a13337bb54e6233add580b07344c8b"
 SRC_URI[tinytemplate-1.2.1.sha256sum] = "be4d6b5f19ff7664e8c98d03e2139cb510db9b0a60b55f8e8709b689d939b6bc"
 SRC_URI[tinyvec-1.9.0.sha256sum] = "09b3661f17e86524eccd4371ab0429194e0d7c008abb45f7a7495b1719463c71"
@@ -1196,6 +1222,7 @@ SRC_URI[tracing-test-macro-0.2.6.sha256sum] = "ad06847b7afb65c7866a36664b75c40b8
 SRC_URI[tracing-tree-0.4.1.sha256sum] = "ac87aa03b6a4d5a7e4810d1a80c19601dbe0f8a837e9177f23af721c7ba7beec"
 SRC_URI[try-lock-0.2.5.sha256sum] = "e421abadd41a4225275504ea4d6566923418b7f05506fbc9c0fe86ba7396114b"
 SRC_URI[ttf-parser-0.25.1.sha256sum] = "d2df906b07856748fa3f6e0ad0cbaa047052d4a7dd609e231c4f72cee8c36f31"
+SRC_URI[typed-path-0.12.3.sha256sum] = "8e28f89b80c87b8fb0cf04ab448d5dd0dd0ade2f8891bae878de66a75a28600e"
 SRC_URI[typeid-1.0.3.sha256sum] = "bc7d623258602320d5c55d1bc22793b57daff0ec7efc270ea7d55ce1d5f5471c"
 SRC_URI[typenum-1.18.0.sha256sum] = "1dccffe3ce07af9386bfd29e80c0ab1a8205a2fc34e4bcd40364df902cfa8f3f"
 SRC_URI[ucd-trie-0.1.7.sha256sum] = "2896d95c02a80c6d6a5d6e953d479f5ddf2dfdb6a244441010e373ac0fb88971"
@@ -1212,16 +1239,17 @@ SRC_URI[unicode-script-0.5.7.sha256sum] = "9fb421b350c9aff471779e262955939f565ec
 SRC_URI[unicode-vo-0.1.0.sha256sum] = "b1d386ff53b415b7fe27b50bb44679e2cc4660272694b7b6f3326d8480823a94"
 SRC_URI[unicode-width-0.1.14.sha256sum] = "7dd6e30e90baa6f72411720665d41d89b9a3d039dc45b8faea1ddd07f617f6af"
 SRC_URI[unicode-width-0.2.2.sha256sum] = "b4ac048d71ede7ee76d585517add45da530660ef4390e49b098733c6e897f254"
+SRC_URI[unicode-xid-0.2.6.sha256sum] = "ebc1c04c71510c7f702b52b7c350734c9ff1295c464a03335b00bb84fc54f853"
 SRC_URI[unit-prefix-0.5.1.sha256sum] = "323402cff2dd658f39ca17c789b502021b3f18707c91cdf22e3838e1b4023817"
 SRC_URI[unsafe-libyaml-0.2.11.sha256sum] = "673aac59facbab8a9007c7f6108d11f63b603f7cabff99fabf650fea5c32b861"
 SRC_URI[unscanny-0.1.0.sha256sum] = "e9df2af067a7953e9c3831320f35c1cc0600c30d44d9f7a12b01db1cd88d6b47"
 SRC_URI[untrusted-0.9.0.sha256sum] = "8ecb6da28b8a351d773b68d5825ac39017e680750f980f3a1a85cd8dd28a47c1"
 SRC_URI[url-2.5.8.sha256sum] = "ff67a8a4397373c3ef660812acab3268222035010ab8680ec4215f38ba3d0eed"
-SRC_URI[usvg-0.46.0.sha256sum] = "e419dff010bb12512b0ae9e3d2f318dfbdf0167fde7eb05465134d4e8756076f"
+SRC_URI[usvg-0.47.0.sha256sum] = "d46cf96c5f498d36b7a9693bc6a7075c0bb9303189d61b2249b0dc3d309c07de"
 SRC_URI[utf8-width-0.1.7.sha256sum] = "86bd8d4e895da8537e5315b8254664e6b769c4ff3db18321b297a1e7004392e3"
 SRC_URI[utf8_iter-1.0.4.sha256sum] = "b6c140620e7ffbb22c2dee59cafe6084a59b5ffc27a8859a5f0d494b5d52b6be"
 SRC_URI[utf8parse-0.2.2.sha256sum] = "06abde3611657adf66d383f00b093d7faecc7fa57071cce2578660c9f1010821"
-SRC_URI[uuid-1.20.0.sha256sum] = "ee48d38b119b0cd71fe4141b30f5ba9c7c5d9f4e7a3a8b4a674e4b6ef789976f"
+SRC_URI[uuid-1.21.0.sha256sum] = "b672338555252d43fd2240c714dc444b8c6fb0a5c5335e65a07bba7742735ddb"
 SRC_URI[valuable-0.1.1.sha256sum] = "ba73ea9cf16a25df0c8caa16c51acb937d5712a8429db78a3ee29d5dcacd3a65"
 SRC_URI[version_check-0.9.5.sha256sum] = "0b928f33d975fc6ad9f86c8f283853ad26bdd5b10b7f1542aa2fa15e2289105a"
 SRC_URI[wait-timeout-0.2.1.sha256sum] = "09ac3b126d3914f9849036f826e054cbabdc8519970b8998ddaf3b5bd3c65f11"
@@ -1229,6 +1257,8 @@ SRC_URI[walkdir-2.5.0.sha256sum] = "29790946404f91d9c5d06f9874efddea1dc06c5efe94
 SRC_URI[want-0.3.1.sha256sum] = "bfa7760aed19e106de2c7c0b581b509f2f25d3dacaf737cb82ac61bc6d760b0e"
 SRC_URI[wasi-0.11.1+wasi-snapshot-preview1.sha256sum] = "ccf3ec651a847eb01de73ccad15eb7d99f80485de043efb2f370cd654f4ea44b"
 SRC_URI[wasi-0.14.2+wasi-0.2.4.sha256sum] = "9683f9a5a998d873c0d21fcbe3c083009670149a8fab228644b8bd36b2c48cb3"
+SRC_URI[wasip2-1.0.2+wasi-0.2.9.sha256sum] = "9517f9239f02c069db75e65f174b3da828fe5f5b945c4dd26bd25d89c03ebcf5"
+SRC_URI[wasip3-0.4.0+wasi-0.3.0-rc-2026-01-06.sha256sum] = "5428f8bf88ea5ddc08faddef2ac4a67e390b88186c703ce6dbd955e1c145aca5"
 SRC_URI[wasite-1.0.2.sha256sum] = "66fe902b4a6b8028a753d5424909b764ccf79b7a209eac9bf97e59cda9f71a42"
 SRC_URI[wasm-bindgen-0.2.100.sha256sum] = "1edc8929d7499fc4e8f0be2262a241556cfc54a0bea223790e71446f2aab1ef5"
 SRC_URI[wasm-bindgen-backend-0.2.100.sha256sum] = "2f0a0651a5c2bc21487bde11ee802ccaf4c51935d0d3d42a6101f98161700bc6"
@@ -1236,7 +1266,10 @@ SRC_URI[wasm-bindgen-futures-0.4.50.sha256sum] = "555d470ec0bc3bb57890405e5d4322
 SRC_URI[wasm-bindgen-macro-0.2.100.sha256sum] = "7fe63fc6d09ed3792bd0897b314f53de8e16568c2b3f7982f468c0bf9bd0b407"
 SRC_URI[wasm-bindgen-macro-support-0.2.100.sha256sum] = "8ae87ea40c9f689fc23f209965b6fb8a99ad69aeeb0231408be24920604395de"
 SRC_URI[wasm-bindgen-shared-0.2.100.sha256sum] = "1a05d73b933a847d6cccdda8f838a22ff101ad9bf93e33684f39c1f5f0eece3d"
+SRC_URI[wasm-encoder-0.244.0.sha256sum] = "990065f2fe63003fe337b932cfb5e3b80e0b4d0f5ff650e6985b1048f62c8319"
+SRC_URI[wasm-metadata-0.244.0.sha256sum] = "bb0e353e6a2fbdc176932bbaab493762eb1255a7900fe0fea1a2f96c296cc909"
 SRC_URI[wasm-streams-0.4.2.sha256sum] = "15053d8d85c7eccdbefef60f06769760a563c7f0a9d6902a13d35c7800b0ad65"
+SRC_URI[wasmparser-0.244.0.sha256sum] = "47b807c72e1bac69382b3a6fb3dbe8ea4c0ed87ff5629b8685ae6b9a611028fe"
 SRC_URI[wasmtimer-0.4.2.sha256sum] = "d8d49b5d6c64e8558d9b1b065014426f35c18de636895d24893dbbd329743446"
 SRC_URI[web-sys-0.3.77.sha256sum] = "33b6dd2ef9186f1f2072e409e99cd22a975331a6b3591b12c764e0e55c60d5d2"
 SRC_URI[web-time-1.1.0.sha256sum] = "5a6580f308b1fad9207618087a65c04e7a10bc77e02c8e84e9b00dd4b12fa0bb"
@@ -1256,7 +1289,7 @@ SRC_URI[windows-future-0.2.1.sha256sum] = "fc6a41e98427b19fe4b73c550f060b59fa592
 SRC_URI[windows-implement-0.60.0.sha256sum] = "a47fddd13af08290e67f4acabf4b459f647552718f683a7b415d290ac744a836"
 SRC_URI[windows-interface-0.59.1.sha256sum] = "bd9211b69f8dcdfa817bfd14bf1c97c9188afa36f4750130fcdf3f400eca9fa8"
 SRC_URI[windows-link-0.1.3.sha256sum] = "5e6ad25900d524eaabdbbb96d20b4311e1e7ae1699af4fb28c17ae66c80d798a"
-SRC_URI[windows-link-0.2.0.sha256sum] = "45e46c0661abb7180e7b9c281db115305d49ca1709ab8242adf09666d2173c65"
+SRC_URI[windows-link-0.2.1.sha256sum] = "f0805222e57f7521d6a62e36fa9163bc891acd422f971defe97d64e70d0a4fe5"
 SRC_URI[windows-numerics-0.2.0.sha256sum] = "9150af68066c4c5c07ddc0ce30421554771e528bde427614c61038bc2c92c2b1"
 SRC_URI[windows-registry-0.5.3.sha256sum] = "5b8a9ed28765efc97bbc954883f4e6796c33a06546ebafacbabee9696967499e"
 SRC_URI[windows-result-0.3.4.sha256sum] = "56f42bd332cc6c8eac5af113fc0c1fd6a8fd2aa08a0119358686e5160d0586c6"
@@ -1266,6 +1299,7 @@ SRC_URI[windows-sys-0.59.0.sha256sum] = "1e38bc4d79ed67fd075bcc251a1c39b32a1776b
 SRC_URI[windows-sys-0.61.0.sha256sum] = "e201184e40b2ede64bc2ea34968b28e33622acdbbf37104f0e4a33f7abe657aa"
 SRC_URI[windows-targets-0.52.6.sha256sum] = "9b724f72796e036ab90c1021d4780d4d3d648aca59e491e6b98e725b84e99973"
 SRC_URI[windows-threading-0.1.0.sha256sum] = "b66463ad2e0ea3bbf808b7f1d371311c80e115c0b71d60efc142cafbcfb057a6"
+SRC_URI[windows-version-0.1.7.sha256sum] = "e4060a1da109b9d0326b7262c8e12c84df67cc0dbc9e33cf49e01ccc2eb63631"
 SRC_URI[windows_aarch64_gnullvm-0.52.6.sha256sum] = "32a4622180e7a0ec044bb555404c800bc9fd9ec262ec147edd5989ccd0c02cd3"
 SRC_URI[windows_aarch64_msvc-0.52.6.sha256sum] = "09ec2a7bb152e2252b53fa7803150007879548bc709c039df7627cabbd05d469"
 SRC_URI[windows_i686_gnu-0.52.6.sha256sum] = "8e9b5ad5ab802e97eb8e295ac6720e509ee4c243f69d781394014ebfe8bbfa0b"
@@ -1277,7 +1311,13 @@ SRC_URI[windows_x86_64_msvc-0.52.6.sha256sum] = "589f6da84c646204747d1270a2a5661
 SRC_URI[winnow-0.7.13.sha256sum] = "21a0236b59786fed61e2a80582dd500fe61f18b5dca67a4a067d0bc9039339cf"
 SRC_URI[winsafe-0.0.19.sha256sum] = "d135d17ab770252ad95e9a872d365cf3090e3be864a34ab46f48555993efc904"
 SRC_URI[wiremock-0.6.5.sha256sum] = "08db1edfb05d9b3c1542e521aea074442088292f00b5f28e435c714a98f85031"
+SRC_URI[wit-bindgen-0.51.0.sha256sum] = "d7249219f66ced02969388cf2bb044a09756a083d0fab1e566056b04d9fbcaa5"
+SRC_URI[wit-bindgen-core-0.51.0.sha256sum] = "ea61de684c3ea68cb082b7a88508a8b27fcc8b797d738bfc99a82facf1d752dc"
 SRC_URI[wit-bindgen-rt-0.39.0.sha256sum] = "6f42320e61fe2cfd34354ecb597f86f413484a798ba44a8ca1165c58d42da6c1"
+SRC_URI[wit-bindgen-rust-0.51.0.sha256sum] = "b7c566e0f4b284dd6561c786d9cb0142da491f46a9fbed79ea69cdad5db17f21"
+SRC_URI[wit-bindgen-rust-macro-0.51.0.sha256sum] = "0c0f9bfd77e6a48eccf51359e3ae77140a7f50b1e2ebfe62422d8afdaffab17a"
+SRC_URI[wit-component-0.244.0.sha256sum] = "9d66ea20e9553b30172b5e831994e35fbde2d165325bec84fc43dbf6f4eb9cb2"
+SRC_URI[wit-parser-0.244.0.sha256sum] = "ecc8ac4bc1dc3381b7f59c34f00b67e18f910c2c0f50015669dde7def656a736"
 SRC_URI[wmi-0.16.0.sha256sum] = "5d9189bc72f0e4d814d812216ec06636ce3ea5597ff5f1ff9f9f0e5ec781c027"
 SRC_URI[writeable-0.6.1.sha256sum] = "ea2f10b9bb0928dfb1b42b65e1f9e36f7f54dbdf08457afefb38afcdec4fa2bb"
 SRC_URI[x509-parser-0.18.0.sha256sum] = "eb3e137310115a65136898d2079f003ce33331a6c4b0d51f1531d1be082b6425"
@@ -1300,10 +1340,10 @@ SRC_URI[zeroize-1.8.2.sha256sum] = "b97154e67e32c85465826e8bcc1c59429aaaf107c1e4
 SRC_URI[zerotrie-0.2.2.sha256sum] = "36f0bbd478583f79edad978b407914f61b2972f5af6fa089686016be8f9af595"
 SRC_URI[zerovec-0.11.2.sha256sum] = "4a05eb080e015ba39cc9e23bbe5e7fb04d5fb040350f99f34e338d5fdd294428"
 SRC_URI[zerovec-derive-0.11.1.sha256sum] = "5b96237efa0c878c64bd89c436f661be4e46b2f3eff1ebb976f7ef2321d2f58f"
-SRC_URI[zip-7.1.0.sha256sum] = "9013f1222db8a6d680f13a7ccdc60a781199cd09c2fa4eff58e728bb181757fc"
-SRC_URI[zlib-rs-0.6.0.sha256sum] = "a7948af682ccbc3342b6e9420e8c51c1fe5d7bf7756002b4a3c6cabfe96a7e3c"
+SRC_URI[zip-8.1.0.sha256sum] = "6e499faf5c6b97a0d086f4a8733de6d47aee2252b8127962439d8d4311a73f72"
+SRC_URI[zlib-rs-0.6.2.sha256sum] = "c745c48e1007337ed136dc99df34128b9faa6ed542d80a1c673cf55a6d7236c8"
 SRC_URI[zmij-1.0.15.sha256sum] = "94f63c051f4fe3c1509da62131a678643c5b6fbdc9273b2b79d4378ebda003d2"
-SRC_URI[zopfli-0.8.2.sha256sum] = "edfc5ee405f504cd4984ecc6f14d02d55cfda60fa4b689434ef4102aae150cd7"
+SRC_URI[zopfli-0.8.3.sha256sum] = "f05cd8797d63865425ff89b5c4a48804f35ba0ce8d125800027ad6017d2b5249"
 SRC_URI[zstd-0.13.3.sha256sum] = "e91ee311a569c327171651566e07972200e76fcfe2242a4fa446149a3881c08a"
 SRC_URI[zstd-safe-7.2.4.sha256sum] = "8f49c4d5f0abb602a93fb8736af2a4f4dd9512e36f7f570d66e65ff867ed3b9d"
 SRC_URI[zstd-sys-2.0.15+zstd.1.5.7.sha256sum] = "eb81183ddd97d0c74cedf1d50d85c8d08c1b8b68ee863bdee9e706eedba1a237"
diff --git a/meta/recipes-devtools/python/python3-uv-build_0.10.4.bb b/meta/recipes-devtools/python/python3-uv-build_0.10.10.bb
similarity index 92%
rename from meta/recipes-devtools/python/python3-uv-build_0.10.4.bb
rename to meta/recipes-devtools/python/python3-uv-build_0.10.10.bb
index 5394fecc97..0b56a34bf3 100644
--- a/meta/recipes-devtools/python/python3-uv-build_0.10.4.bb
+++ b/meta/recipes-devtools/python/python3-uv-build_0.10.10.bb
@@ -11,7 +11,7 @@ LIC_FILES_CHKSUM = "file://LICENSE-APACHE;md5=86d3f3a95c324c9479bd8986968f4327 \
                     file://crates/uv-pep508/License-Apache;md5=e23fadd6ceef8c618fc1c65191d846fa \
                     file://crates/uv-pep508/License-BSD;md5=ef7a6027dc4c2389b9afad7e690274c7"
 
-SRC_URI[sha256sum] = "fb201561844484d77cc9318c2ad7c51a0006e11c632037877a9524166fa47717"
+SRC_URI[sha256sum] = "53d5a58ff7b1a6b1200f77ec3e4a8d361d1fe6eca562d5a359bf4a96bd2cc9c5"
 
 require ${BPN}-crates.inc
 
-- 
2.43.0


