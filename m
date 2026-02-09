Return-Path: <wangmy@fujitsu.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 2F810E78D69
	for <webhook@archiver.kernel.org>; Mon,  9 Feb 2026 09:04:26 +0000 (UTC)
Received: from esa2.hc1455-7.c3s2.iphmx.com (esa2.hc1455-7.c3s2.iphmx.com [207.54.90.48])
 by mx.groups.io with SMTP id smtpd.msgproc01-g2.43858.1770627858947260719
 for <openembedded-core@lists.openembedded.org>;
 Mon, 09 Feb 2026 01:04:19 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@fujitsu.com header.s=fj2 header.b=e+wUhgde;
 spf=pass (domain: fujitsu.com, ip: 207.54.90.48, mailfrom: wangmy@fujitsu.com)
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
  d=fujitsu.com; i=@fujitsu.com; q=dns/txt; s=fj2;
  t=1770627857; x=1802163857;
  h=from:to:cc:subject:date:message-id:in-reply-to:
   references:mime-version:content-transfer-encoding;
  bh=BvOzMQM0ZJjZd+sWOoZkRVdSbxh6871Zb+khvzRZPlU=;
  b=e+wUhgdeQcPUrkfnu2qVIwG1+I7FiidUre3qYBPJoBjfltLcSkvR8oEW
   sks9yG+PJpUwoTqtXJu5qy5IvyyXShot5szEERL1aRBbs6KOyXlps6092
   S4tDXpCVZo4sybhjRifEfzRlCjoVLtB4lZyebWd1W1mEV1ChYIrx9uHGf
   CF+YTZYKL4iYKTNOdLQKVOanrO6N2U63pnNIS88NLDPdh1hfemaO0OWxT
   4K7sP5Fz0XcPDY6QNByfEpo/CdEoQtPSmEsV5xsh1n/GMrXPHfPrMZPj/
   G5k0MGzLivdzBbcafmly6A1SgMFk2e+HseYix8uWoB1RJIy0aD+jfBKgm
   A==;
X-CSE-ConnectionGUID: 4krwsgC+SlGFtkq8xnsDHg==
X-CSE-MsgGUID: +5ebmAtkT3asccyDIax/nw==
X-IronPort-AV: E=McAfee;i="6800,10657,11695"; a="228980557"
X-IronPort-AV: E=Sophos;i="6.21,281,1763391600"; 
   d="scan'208";a="228980557"
Received: from unknown (HELO mail.fujitsu.com) ([51.138.80.169])
  by esa2.hc1455-7.c3s2.iphmx.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 09 Feb 2026 18:04:15 +0900
Received: from az2uksmgm2.o.css.fujitsu.com (unknown [10.151.22.199])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by az2nlsmgr4.fujitsu.com (Postfix) with ESMTPS id E21EC407561
	for <openembedded-core@lists.openembedded.org>; Mon,  9 Feb 2026 09:04:16 +0000 (UTC)
Received: from az2nlsmom3.fujitsu.com (az2nlsmom3.o.css.fujitsu.com [10.150.26.199])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by az2uksmgm2.o.css.fujitsu.com (Postfix) with ESMTPS id 726071801FD7
	for <openembedded-core@lists.openembedded.org>; Mon,  9 Feb 2026 09:04:16 +0000 (UTC)
Received: from G08FNSTD200057.g08.fujitsu.local (unknown [10.193.128.34])
	by az2nlsmom3.fujitsu.com (Postfix) with ESMTP id BE199101A41D;
	Mon,  9 Feb 2026 09:04:13 +0000 (UTC)
From: Wang Mingyu < wangmy@fujitsu.com>
To: openembedded-core@lists.openembedded.org
Cc: Wang Mingyu <wangmy@fujitsu.com>
Subject: [OE-core] [PATCH 29/39] python3-uv-build: upgrade 0.9.26 -> 0.9.28
Date: Mon,  9 Feb 2026 17:03:07 +0800
Message-ID: <20260209090317.1468-29-wangmy@fujitsu.com>
X-Mailer: git-send-email 2.49.0.windows.1
In-Reply-To: <20260209090317.1468-1-wangmy@fujitsu.com>
References: <20260209090317.1468-1-wangmy@fujitsu.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Mon, 09 Feb 2026 09:04:26 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/230740

From: Wang Mingyu <wangmy@fujitsu.com>

Signed-off-by: Wang Mingyu <wangmy@fujitsu.com>
---
 .../python/python3-uv-build-crates.inc        | 394 +++++++++---------
 ...d_0.9.26.bb => python3-uv-build_0.9.28.bb} |   2 +-
 2 files changed, 187 insertions(+), 209 deletions(-)
 rename meta/recipes-devtools/python/{python3-uv-build_0.9.26.bb => python3-uv-build_0.9.28.bb} (92%)

diff --git a/meta/recipes-devtools/python/python3-uv-build-crates.inc b/meta/recipes-devtools/python/python3-uv-build-crates.inc
index 788149e60c..3a19d4630e 100644
--- a/meta/recipes-devtools/python/python3-uv-build-crates.inc
+++ b/meta/recipes-devtools/python/python3-uv-build-crates.inc
@@ -2,7 +2,6 @@
 
 # from Cargo.lock
 SRC_URI += " \
-    crate://crates.io/addr2line/0.24.2 \
     crate://crates.io/adler2/2.0.1 \
     crate://crates.io/aes/0.8.4 \
     crate://crates.io/aho-corasick/1.1.3 \
@@ -20,15 +19,18 @@ SRC_URI += " \
     crate://crates.io/arcstr/1.2.0 \
     crate://crates.io/arrayref/0.3.9 \
     crate://crates.io/arrayvec/0.7.6 \
+    crate://crates.io/asn1-rs/0.7.1 \
+    crate://crates.io/asn1-rs-derive/0.6.0 \
+    crate://crates.io/asn1-rs-impl/0.2.0 \
     crate://crates.io/assert-json-diff/2.0.2 \
-    crate://crates.io/assert_cmd/2.0.17 \
+    crate://crates.io/assert_cmd/2.1.2 \
     crate://crates.io/assert_fs/1.1.3 \
     crate://crates.io/astral-pubgrub/0.3.3 \
     crate://crates.io/astral-reqwest-middleware/0.4.2 \
     crate://crates.io/astral-reqwest-retry/0.8.0 \
     crate://crates.io/astral-tl/0.7.11 \
     crate://crates.io/astral-tokio-tar/0.5.6 \
-    crate://crates.io/astral-version-ranges/0.1.3 \
+    crate://crates.io/astral-version-ranges/0.1.4 \
     crate://crates.io/astral_async_http_range_reader/0.9.1 \
     crate://crates.io/astral_async_zip/0.0.17 \
     crate://crates.io/async-broadcast/0.7.2 \
@@ -42,14 +44,13 @@ SRC_URI += " \
     crate://crates.io/axoprocess/0.2.1 \
     crate://crates.io/axotag/0.3.0 \
     crate://crates.io/axoupdater/0.9.1 \
-    crate://crates.io/backon/1.5.2 \
-    crate://crates.io/backtrace/0.3.75 \
+    crate://crates.io/backon/1.6.0 \
     crate://crates.io/base64/0.21.7 \
     crate://crates.io/base64/0.22.1 \
     crate://crates.io/base64ct/1.8.2 \
     crate://crates.io/bisection/0.1.0 \
     crate://crates.io/bitflags/1.3.2 \
-    crate://crates.io/bitflags/2.9.4 \
+    crate://crates.io/bitflags/2.10.0 \
     crate://crates.io/blake2/0.10.6 \
     crate://crates.io/block-buffer/0.10.4 \
     crate://crates.io/block-padding/0.3.3 \
@@ -66,7 +67,7 @@ SRC_URI += " \
     crate://crates.io/bzip2/0.5.2 \
     crate://crates.io/bzip2-sys/0.1.13+1.0.8 \
     crate://crates.io/camino/1.1.10 \
-    crate://crates.io/cargo-util/0.2.24 \
+    crate://crates.io/cargo-util/0.2.25 \
     crate://crates.io/cast/0.3.0 \
     crate://crates.io/cbc/0.1.2 \
     crate://crates.io/cc/1.2.30 \
@@ -77,29 +78,30 @@ SRC_URI += " \
     crate://crates.io/ciborium-io/0.2.2 \
     crate://crates.io/ciborium-ll/0.2.2 \
     crate://crates.io/cipher/0.4.4 \
-    crate://crates.io/clap/4.5.53 \
-    crate://crates.io/clap_builder/4.5.53 \
+    crate://crates.io/clap/4.5.54 \
+    crate://crates.io/clap_builder/4.5.54 \
     crate://crates.io/clap_complete/4.5.55 \
     crate://crates.io/clap_complete_command/0.6.1 \
     crate://crates.io/clap_complete_nushell/4.5.8 \
     crate://crates.io/clap_derive/4.5.49 \
     crate://crates.io/clap_lex/0.7.5 \
-    crate://crates.io/codspeed/4.0.5 \
-    crate://crates.io/codspeed-criterion-compat/4.0.5 \
-    crate://crates.io/codspeed-criterion-compat-walltime/4.0.5 \
+    crate://crates.io/codspeed/4.2.1 \
+    crate://crates.io/codspeed-criterion-compat/4.2.1 \
+    crate://crates.io/codspeed-criterion-compat-walltime/4.2.1 \
     crate://crates.io/color_quant/1.1.0 \
     crate://crates.io/colorchoice/1.0.4 \
     crate://crates.io/colored/2.2.0 \
     crate://crates.io/concurrent-queue/2.5.0 \
     crate://crates.io/configparser/3.1.0 \
     crate://crates.io/console/0.15.11 \
-    crate://crates.io/console/0.16.1 \
+    crate://crates.io/console/0.16.2 \
     crate://crates.io/const-oid/0.9.6 \
     crate://crates.io/const-random/0.1.18 \
     crate://crates.io/const-random-macro/0.1.16 \
     crate://crates.io/core-foundation/0.9.4 \
     crate://crates.io/core-foundation/0.10.1 \
     crate://crates.io/core-foundation-sys/0.8.7 \
+    crate://crates.io/core_maths/0.1.1 \
     crate://crates.io/cpufeatures/0.2.17 \
     crate://crates.io/crc/3.3.0 \
     crate://crates.io/crc-catalog/2.4.0 \
@@ -111,17 +113,18 @@ SRC_URI += " \
     crate://crates.io/crossbeam-utils/0.8.21 \
     crate://crates.io/crunchy/0.2.4 \
     crate://crates.io/crypto-common/0.1.6 \
-    crate://crates.io/csv/1.3.1 \
+    crate://crates.io/csv/1.4.0 \
     crate://crates.io/csv-core/0.1.12 \
     crate://crates.io/ctrlc/3.5.1 \
     crate://crates.io/cyclonedx-bom/0.8.0 \
     crate://crates.io/cyclonedx-bom-macros/0.1.0 \
     crate://crates.io/dashmap/6.1.0 \
-    crate://crates.io/data-encoding/2.9.0 \
-    crate://crates.io/data-url/0.2.0 \
+    crate://crates.io/data-encoding/2.10.0 \
+    crate://crates.io/data-url/0.3.2 \
     crate://crates.io/deadpool/0.12.3 \
     crate://crates.io/deadpool-runtime/0.1.4 \
     crate://crates.io/der/0.7.10 \
+    crate://crates.io/der-parser/10.0.0 \
     crate://crates.io/deranged/0.5.5 \
     crate://crates.io/derive_arbitrary/1.4.1 \
     crate://crates.io/diff/0.1.13 \
@@ -152,11 +155,12 @@ SRC_URI += " \
     crate://crates.io/erased-serde/0.4.6 \
     crate://crates.io/errno/0.3.13 \
     crate://crates.io/etcetera/0.11.0 \
+    crate://crates.io/euclid/0.22.11 \
     crate://crates.io/event-listener/5.4.0 \
     crate://crates.io/event-listener-strategy/0.5.4 \
     crate://crates.io/fastrand/2.3.0 \
     crate://crates.io/fdeflate/0.3.7 \
-    crate://crates.io/filetime/0.2.26 \
+    crate://crates.io/filetime/0.2.27 \
     crate://crates.io/fixedbitset/0.5.7 \
     crate://crates.io/flate2/1.1.5 \
     crate://crates.io/float-cmp/0.9.0 \
@@ -166,9 +170,9 @@ SRC_URI += " \
     crate://crates.io/foldhash/0.1.5 \
     crate://crates.io/foldhash/0.2.0 \
     crate://crates.io/fontconfig-parser/0.5.8 \
-    crate://crates.io/fontdb/0.12.0 \
+    crate://crates.io/fontdb/0.23.0 \
     crate://crates.io/form_urlencoded/1.2.2 \
-    crate://crates.io/fs-err/3.1.3 \
+    crate://crates.io/fs-err/3.2.2 \
     crate://crates.io/futures/0.3.31 \
     crate://crates.io/futures-channel/0.3.31 \
     crate://crates.io/futures-core/0.3.31 \
@@ -182,8 +186,7 @@ SRC_URI += " \
     crate://crates.io/generic-array/0.14.7 \
     crate://crates.io/getrandom/0.2.16 \
     crate://crates.io/getrandom/0.3.3 \
-    crate://crates.io/gif/0.12.0 \
-    crate://crates.io/gimli/0.31.1 \
+    crate://crates.io/gif/0.14.1 \
     crate://crates.io/glob/0.3.3 \
     crate://crates.io/globset/0.4.18 \
     crate://crates.io/globwalk/0.9.1 \
@@ -201,7 +204,7 @@ SRC_URI += " \
     crate://crates.io/hmac/0.12.1 \
     crate://crates.io/homedir/0.3.6 \
     crate://crates.io/html-escape/0.2.13 \
-    crate://crates.io/http/1.3.1 \
+    crate://crates.io/http/1.4.0 \
     crate://crates.io/http-body/1.0.1 \
     crate://crates.io/http-body-util/0.1.3 \
     crate://crates.io/http-content-range/0.2.3 \
@@ -221,13 +224,13 @@ SRC_URI += " \
     crate://crates.io/idna_adapter/1.2.1 \
     crate://crates.io/ignore/0.4.25 \
     crate://crates.io/image/0.25.6 \
-    crate://crates.io/imagesize/0.11.0 \
-    crate://crates.io/indexmap/2.12.1 \
+    crate://crates.io/image-webp/0.2.4 \
+    crate://crates.io/imagesize/0.14.0 \
+    crate://crates.io/indexmap/2.13.0 \
     crate://crates.io/indicatif/0.18.3 \
     crate://crates.io/indoc/2.0.7 \
     crate://crates.io/inout/0.1.4 \
-    crate://crates.io/insta/1.45.0 \
-    crate://crates.io/io-uring/0.7.9 \
+    crate://crates.io/insta/1.46.1 \
     crate://crates.io/ipnet/2.11.0 \
     crate://crates.io/iri-string/0.7.8 \
     crate://crates.io/is-docker/0.2.0 \
@@ -239,22 +242,20 @@ SRC_URI += " \
     crate://crates.io/itertools/0.13.0 \
     crate://crates.io/itertools/0.14.0 \
     crate://crates.io/itoa/1.0.15 \
-    crate://crates.io/jiff/0.2.16 \
-    crate://crates.io/jiff-static/0.2.16 \
+    crate://crates.io/jiff/0.2.18 \
+    crate://crates.io/jiff-static/0.2.18 \
     crate://crates.io/jiff-tzdb/0.1.4 \
     crate://crates.io/jiff-tzdb-platform/0.1.3 \
-    crate://crates.io/jobserver/0.1.33 \
-    crate://crates.io/jpeg-decoder/0.3.2 \
+    crate://crates.io/jobserver/0.1.34 \
     crate://crates.io/js-sys/0.3.77 \
     crate://crates.io/jsonwebtoken/9.3.1 \
-    crate://crates.io/junction/1.2.0 \
-    crate://crates.io/kurbo/0.8.3 \
-    crate://crates.io/kurbo/0.9.5 \
+    crate://crates.io/junction/1.4.1 \
+    crate://crates.io/kurbo/0.13.0 \
     crate://crates.io/lazy_static/1.5.0 \
     crate://crates.io/libc/0.2.178 \
     crate://crates.io/libm/0.2.15 \
     crate://crates.io/libmimalloc-sys/0.1.44 \
-    crate://crates.io/libredox/0.1.6 \
+    crate://crates.io/libredox/0.1.12 \
     crate://crates.io/libz-rs-sys/0.5.1 \
     crate://crates.io/linux-raw-sys/0.11.0 \
     crate://crates.io/litemap/0.8.0 \
@@ -268,7 +269,6 @@ SRC_URI += " \
     crate://crates.io/matchers/0.2.0 \
     crate://crates.io/md-5/0.10.6 \
     crate://crates.io/memchr/2.7.6 \
-    crate://crates.io/memmap2/0.5.10 \
     crate://crates.io/memmap2/0.9.7 \
     crate://crates.io/memoffset/0.9.1 \
     crate://crates.io/miette/7.6.0 \
@@ -276,6 +276,7 @@ SRC_URI += " \
     crate://crates.io/mimalloc/0.1.48 \
     crate://crates.io/mime/0.3.17 \
     crate://crates.io/mime_guess/2.0.5 \
+    crate://crates.io/minimal-lexical/0.2.1 \
     crate://crates.io/miniz_oxide/0.8.9 \
     crate://crates.io/mio/1.1.0 \
     crate://crates.io/miow/0.6.1 \
@@ -283,6 +284,7 @@ SRC_URI += " \
     crate://crates.io/munge_macro/0.4.5 \
     crate://crates.io/nanoid/0.4.0 \
     crate://crates.io/nix/0.30.1 \
+    crate://crates.io/nom/7.1.3 \
     crate://crates.io/normalize-line-endings/0.3.0 \
     crate://crates.io/nu-ansi-term/0.50.1 \
     crate://crates.io/num/0.4.3 \
@@ -297,7 +299,7 @@ SRC_URI += " \
     crate://crates.io/num_cpus/1.17.0 \
     crate://crates.io/objc2/0.6.3 \
     crate://crates.io/objc2-encode/4.1.0 \
-    crate://crates.io/object/0.36.7 \
+    crate://crates.io/oid-registry/0.8.1 \
     crate://crates.io/once_cell/1.21.3 \
     crate://crates.io/once_cell_polyfill/1.70.1 \
     crate://crates.io/oorandom/11.1.5 \
@@ -347,17 +349,18 @@ SRC_URI += " \
     crate://crates.io/pretty_assertions/1.4.1 \
     crate://crates.io/priority-queue/2.5.0 \
     crate://crates.io/proc-macro-crate/3.3.0 \
-    crate://crates.io/proc-macro2/1.0.103 \
+    crate://crates.io/proc-macro2/1.0.105 \
     crate://crates.io/procfs/0.18.0 \
     crate://crates.io/procfs-core/0.18.0 \
     crate://crates.io/ptr_meta/0.3.0 \
     crate://crates.io/ptr_meta_derive/0.3.0 \
     crate://crates.io/purl/0.1.6 \
+    crate://crates.io/quick-error/2.0.1 \
     crate://crates.io/quick-xml/0.38.3 \
     crate://crates.io/quinn/0.11.8 \
     crate://crates.io/quinn-proto/0.11.12 \
     crate://crates.io/quinn-udp/0.5.13 \
-    crate://crates.io/quote/1.0.42 \
+    crate://crates.io/quote/1.0.43 \
     crate://crates.io/quoted_printable/0.5.1 \
     crate://crates.io/r-efi/5.3.0 \
     crate://crates.io/rancor/0.1.0 \
@@ -369,9 +372,9 @@ SRC_URI += " \
     crate://crates.io/rand_core/0.9.3 \
     crate://crates.io/rayon/1.11.0 \
     crate://crates.io/rayon-core/1.13.0 \
-    crate://crates.io/rcgen/0.14.5 \
-    crate://crates.io/rctree/0.5.0 \
+    crate://crates.io/rcgen/0.14.6 \
     crate://crates.io/redox_syscall/0.5.15 \
+    crate://crates.io/redox_syscall/0.7.0 \
     crate://crates.io/redox_users/0.5.0 \
     crate://crates.io/ref-cast/1.0.25 \
     crate://crates.io/ref-cast-impl/1.0.25 \
@@ -388,44 +391,43 @@ SRC_URI += " \
     crate://crates.io/reqsign-google/2.0.1 \
     crate://crates.io/reqsign-http-send-reqwest/2.0.1 \
     crate://crates.io/reqwest/0.12.22 \
-    crate://crates.io/resvg/0.29.0 \
+    crate://crates.io/resvg/0.46.0 \
     crate://crates.io/retry-policies/0.5.1 \
     crate://crates.io/rgb/0.8.52 \
     crate://crates.io/ring/0.17.14 \
-    crate://crates.io/rkyv/0.8.12 \
-    crate://crates.io/rkyv_derive/0.8.12 \
+    crate://crates.io/rkyv/0.8.14 \
+    crate://crates.io/rkyv_derive/0.8.14 \
     crate://crates.io/rmp/0.8.14 \
-    crate://crates.io/rmp-serde/1.3.0 \
-    crate://crates.io/rosvgtree/0.1.0 \
-    crate://crates.io/roxmltree/0.18.1 \
+    crate://crates.io/rmp-serde/1.3.1 \
     crate://crates.io/roxmltree/0.20.0 \
+    crate://crates.io/roxmltree/0.21.1 \
     crate://crates.io/rsa/0.9.9 \
     crate://crates.io/rust-ini/0.21.3 \
     crate://crates.io/rust-netrc/0.1.2 \
-    crate://crates.io/rustc-demangle/0.1.25 \
     crate://crates.io/rustc-hash/2.1.1 \
+    crate://crates.io/rusticata-macros/4.1.0 \
     crate://crates.io/rustix/1.1.3 \
-    crate://crates.io/rustls/0.23.35 \
+    crate://crates.io/rustls/0.23.36 \
     crate://crates.io/rustls-native-certs/0.8.2 \
-    crate://crates.io/rustls-pki-types/1.12.0 \
+    crate://crates.io/rustls-pki-types/1.13.3 \
     crate://crates.io/rustls-webpki/0.103.8 \
     crate://crates.io/rustversion/1.0.21 \
-    crate://crates.io/rustybuzz/0.7.0 \
+    crate://crates.io/rustybuzz/0.20.1 \
     crate://crates.io/ryu/1.0.20 \
     crate://crates.io/salsa20/0.10.2 \
     crate://crates.io/same-file/1.0.6 \
     crate://crates.io/schannel/0.1.27 \
-    crate://crates.io/schemars/1.0.5 \
-    crate://crates.io/schemars_derive/1.0.5 \
+    crate://crates.io/schemars/1.2.0 \
+    crate://crates.io/schemars_derive/1.2.0 \
     crate://crates.io/scopeguard/1.2.0 \
     crate://crates.io/scroll/0.13.0 \
     crate://crates.io/scroll_derive/0.13.0 \
     crate://crates.io/scrypt/0.11.0 \
     crate://crates.io/seahash/4.1.0 \
     crate://crates.io/secrecy/0.10.3 \
-    crate://crates.io/secret-service/5.0.0 \
-    crate://crates.io/security-framework/3.2.0 \
-    crate://crates.io/security-framework-sys/2.14.0 \
+    crate://crates.io/secret-service/5.1.0 \
+    crate://crates.io/security-framework/3.5.1 \
+    crate://crates.io/security-framework-sys/2.15.0 \
     crate://crates.io/self-replace/1.5.0 \
     crate://crates.io/semver/1.0.26 \
     crate://crates.io/serde/1.0.228 \
@@ -433,7 +435,7 @@ SRC_URI += " \
     crate://crates.io/serde_core/1.0.228 \
     crate://crates.io/serde_derive/1.0.228 \
     crate://crates.io/serde_derive_internals/0.29.1 \
-    crate://crates.io/serde_json/1.0.147 \
+    crate://crates.io/serde_json/1.0.149 \
     crate://crates.io/serde_repr/0.1.20 \
     crate://crates.io/serde_spanned/1.0.4 \
     crate://crates.io/serde_urlencoded/0.7.1 \
@@ -451,8 +453,9 @@ SRC_URI += " \
     crate://crates.io/similar/2.7.0 \
     crate://crates.io/simple_asn1/0.6.3 \
     crate://crates.io/simplecss/0.2.2 \
-    crate://crates.io/siphasher/0.3.11 \
+    crate://crates.io/siphasher/1.0.1 \
     crate://crates.io/slab/0.4.11 \
+    crate://crates.io/slotmap/1.1.1 \
     crate://crates.io/smallvec/1.15.1 \
     crate://crates.io/smawk/0.3.2 \
     crate://crates.io/socket2/0.5.10 \
@@ -473,10 +476,8 @@ SRC_URI += " \
     crate://crates.io/supports-hyperlinks/3.1.0 \
     crate://crates.io/supports-unicode/3.0.0 \
     crate://crates.io/svg/0.18.0 \
-    crate://crates.io/svgfilters/0.4.0 \
-    crate://crates.io/svgtypes/0.9.0 \
-    crate://crates.io/svgtypes/0.10.0 \
-    crate://crates.io/syn/2.0.111 \
+    crate://crates.io/svgtypes/0.16.1 \
+    crate://crates.io/syn/2.0.114 \
     crate://crates.io/sync_wrapper/1.0.2 \
     crate://crates.io/synstructure/0.13.2 \
     crate://crates.io/sys-info/0.9.1 \
@@ -484,7 +485,7 @@ SRC_URI += " \
     crate://crates.io/system-configuration-sys/0.6.0 \
     crate://crates.io/tagu/0.1.6 \
     crate://crates.io/tar/0.4.44 \
-    crate://crates.io/target-lexicon/0.13.3 \
+    crate://crates.io/target-lexicon/0.13.4 \
     crate://crates.io/temp-env/0.3.6 \
     crate://crates.io/tempfile/3.24.0 \
     crate://crates.io/terminal_size/0.4.2 \
@@ -492,31 +493,31 @@ SRC_URI += " \
     crate://crates.io/test-case/3.3.1 \
     crate://crates.io/test-case-core/3.3.1 \
     crate://crates.io/test-case-macros/3.3.1 \
-    crate://crates.io/test-log/0.2.18 \
-    crate://crates.io/test-log-macros/0.2.18 \
+    crate://crates.io/test-log/0.2.19 \
+    crate://crates.io/test-log-macros/0.2.19 \
     crate://crates.io/textwrap/0.16.2 \
     crate://crates.io/thiserror/1.0.69 \
-    crate://crates.io/thiserror/2.0.17 \
+    crate://crates.io/thiserror/2.0.18 \
     crate://crates.io/thiserror-impl/1.0.69 \
-    crate://crates.io/thiserror-impl/2.0.17 \
+    crate://crates.io/thiserror-impl/2.0.18 \
     crate://crates.io/thread_local/1.1.9 \
-    crate://crates.io/tikv-jemalloc-sys/0.6.0+5.3.0-1-ge13ca993e8ccb9ba9847cc330696e02839f328f7 \
-    crate://crates.io/tikv-jemallocator/0.6.0 \
+    crate://crates.io/tikv-jemalloc-sys/0.6.1+5.3.0-1-ge13ca993e8ccb9ba9847cc330696e02839f328f7 \
+    crate://crates.io/tikv-jemallocator/0.6.1 \
     crate://crates.io/time/0.3.44 \
     crate://crates.io/time-core/0.1.6 \
     crate://crates.io/time-macros/0.2.24 \
     crate://crates.io/tiny-keccak/2.0.2 \
-    crate://crates.io/tiny-skia/0.8.4 \
-    crate://crates.io/tiny-skia-path/0.8.4 \
+    crate://crates.io/tiny-skia/0.11.4 \
+    crate://crates.io/tiny-skia-path/0.11.4 \
     crate://crates.io/tinystr/0.8.1 \
     crate://crates.io/tinytemplate/1.2.1 \
     crate://crates.io/tinyvec/1.9.0 \
     crate://crates.io/tinyvec_macros/0.1.1 \
-    crate://crates.io/tokio/1.47.1 \
-    crate://crates.io/tokio-macros/2.5.0 \
-    crate://crates.io/tokio-rustls/0.26.2 \
-    crate://crates.io/tokio-stream/0.1.17 \
-    crate://crates.io/tokio-util/0.7.17 \
+    crate://crates.io/tokio/1.49.0 \
+    crate://crates.io/tokio-macros/2.6.0 \
+    crate://crates.io/tokio-rustls/0.26.4 \
+    crate://crates.io/tokio-stream/0.1.18 \
+    crate://crates.io/tokio-util/0.7.18 \
     crate://crates.io/toml/0.9.10+spec-1.1.0 \
     crate://crates.io/toml_datetime/0.6.11 \
     crate://crates.io/toml_datetime/0.7.5+spec-1.1.0 \
@@ -528,30 +529,30 @@ SRC_URI += " \
     crate://crates.io/tower-http/0.6.6 \
     crate://crates.io/tower-layer/0.3.3 \
     crate://crates.io/tower-service/0.3.3 \
-    crate://crates.io/tracing/0.1.41 \
-    crate://crates.io/tracing-attributes/0.1.30 \
-    crate://crates.io/tracing-core/0.1.34 \
+    crate://crates.io/tracing/0.1.44 \
+    crate://crates.io/tracing-attributes/0.1.31 \
+    crate://crates.io/tracing-core/0.1.36 \
     crate://crates.io/tracing-durations-export/0.3.1 \
     crate://crates.io/tracing-log/0.2.0 \
     crate://crates.io/tracing-serde/0.2.0 \
-    crate://crates.io/tracing-subscriber/0.3.20 \
+    crate://crates.io/tracing-subscriber/0.3.22 \
     crate://crates.io/tracing-test/0.2.5 \
     crate://crates.io/tracing-test-macro/0.2.5 \
     crate://crates.io/tracing-tree/0.4.1 \
     crate://crates.io/try-lock/0.2.5 \
-    crate://crates.io/ttf-parser/0.18.1 \
+    crate://crates.io/ttf-parser/0.25.1 \
     crate://crates.io/typeid/1.0.3 \
     crate://crates.io/typenum/1.18.0 \
     crate://crates.io/ucd-trie/0.1.7 \
     crate://crates.io/uds_windows/1.1.0 \
     crate://crates.io/unicase/2.8.1 \
     crate://crates.io/unicode-bidi/0.3.18 \
-    crate://crates.io/unicode-bidi-mirroring/0.1.0 \
-    crate://crates.io/unicode-ccc/0.1.2 \
-    crate://crates.io/unicode-general-category/0.6.0 \
+    crate://crates.io/unicode-bidi-mirroring/0.4.0 \
+    crate://crates.io/unicode-ccc/0.4.0 \
     crate://crates.io/unicode-id/0.3.5 \
     crate://crates.io/unicode-ident/1.0.18 \
     crate://crates.io/unicode-linebreak/0.1.5 \
+    crate://crates.io/unicode-properties/0.1.4 \
     crate://crates.io/unicode-script/0.5.7 \
     crate://crates.io/unicode-vo/0.1.0 \
     crate://crates.io/unicode-width/0.1.14 \
@@ -560,9 +561,8 @@ SRC_URI += " \
     crate://crates.io/unsafe-libyaml/0.2.11 \
     crate://crates.io/unscanny/0.1.0 \
     crate://crates.io/untrusted/0.9.0 \
-    crate://crates.io/url/2.5.7 \
-    crate://crates.io/usvg/0.29.0 \
-    crate://crates.io/usvg-text-layout/0.29.0 \
+    crate://crates.io/url/2.5.8 \
+    crate://crates.io/usvg/0.46.0 \
     crate://crates.io/utf8-width/0.1.7 \
     crate://crates.io/utf8_iter/1.0.4 \
     crate://crates.io/utf8parse/0.2.2 \
@@ -574,7 +574,7 @@ SRC_URI += " \
     crate://crates.io/want/0.3.1 \
     crate://crates.io/wasi/0.11.1+wasi-snapshot-preview1 \
     crate://crates.io/wasi/0.14.2+wasi-0.2.4 \
-    crate://crates.io/wasite/0.1.0 \
+    crate://crates.io/wasite/1.0.2 \
     crate://crates.io/wasm-bindgen/0.2.100 \
     crate://crates.io/wasm-bindgen-backend/0.2.100 \
     crate://crates.io/wasm-bindgen-futures/0.4.50 \
@@ -588,19 +588,16 @@ SRC_URI += " \
     crate://crates.io/webpki-roots/1.0.2 \
     crate://crates.io/weezl/0.1.10 \
     crate://crates.io/which/8.0.0 \
-    crate://crates.io/whoami/1.6.1 \
+    crate://crates.io/whoami/2.0.2 \
     crate://crates.io/widestring/1.2.0 \
     crate://crates.io/winapi/0.3.9 \
     crate://crates.io/winapi-i686-pc-windows-gnu/0.4.0 \
     crate://crates.io/winapi-util/0.1.9 \
     crate://crates.io/winapi-x86_64-pc-windows-gnu/0.4.0 \
-    crate://crates.io/windows/0.59.0 \
     crate://crates.io/windows/0.61.3 \
     crate://crates.io/windows-collections/0.2.0 \
-    crate://crates.io/windows-core/0.59.0 \
     crate://crates.io/windows-core/0.61.2 \
     crate://crates.io/windows-future/0.2.1 \
-    crate://crates.io/windows-implement/0.59.0 \
     crate://crates.io/windows-implement/0.60.0 \
     crate://crates.io/windows-interface/0.59.1 \
     crate://crates.io/windows-link/0.1.3 \
@@ -608,40 +605,30 @@ SRC_URI += " \
     crate://crates.io/windows-numerics/0.2.0 \
     crate://crates.io/windows-registry/0.5.3 \
     crate://crates.io/windows-result/0.3.4 \
-    crate://crates.io/windows-strings/0.3.1 \
     crate://crates.io/windows-strings/0.4.2 \
     crate://crates.io/windows-sys/0.52.0 \
     crate://crates.io/windows-sys/0.59.0 \
-    crate://crates.io/windows-sys/0.60.2 \
     crate://crates.io/windows-sys/0.61.0 \
     crate://crates.io/windows-targets/0.52.6 \
-    crate://crates.io/windows-targets/0.53.2 \
     crate://crates.io/windows-threading/0.1.0 \
     crate://crates.io/windows_aarch64_gnullvm/0.52.6 \
-    crate://crates.io/windows_aarch64_gnullvm/0.53.0 \
     crate://crates.io/windows_aarch64_msvc/0.52.6 \
-    crate://crates.io/windows_aarch64_msvc/0.53.0 \
     crate://crates.io/windows_i686_gnu/0.52.6 \
-    crate://crates.io/windows_i686_gnu/0.53.0 \
     crate://crates.io/windows_i686_gnullvm/0.52.6 \
-    crate://crates.io/windows_i686_gnullvm/0.53.0 \
     crate://crates.io/windows_i686_msvc/0.52.6 \
-    crate://crates.io/windows_i686_msvc/0.53.0 \
     crate://crates.io/windows_x86_64_gnu/0.52.6 \
-    crate://crates.io/windows_x86_64_gnu/0.53.0 \
     crate://crates.io/windows_x86_64_gnullvm/0.52.6 \
-    crate://crates.io/windows_x86_64_gnullvm/0.53.0 \
     crate://crates.io/windows_x86_64_msvc/0.52.6 \
-    crate://crates.io/windows_x86_64_msvc/0.53.0 \
     crate://crates.io/winnow/0.7.13 \
     crate://crates.io/winsafe/0.0.19 \
     crate://crates.io/wiremock/0.6.5 \
     crate://crates.io/wit-bindgen-rt/0.39.0 \
     crate://crates.io/wmi/0.16.0 \
     crate://crates.io/writeable/0.6.1 \
+    crate://crates.io/x509-parser/0.18.0 \
     crate://crates.io/xattr/1.5.1 \
     crate://crates.io/xml-rs/0.8.27 \
-    crate://crates.io/xmlparser/0.13.6 \
+    crate://crates.io/xmlwriter/0.1.0 \
     crate://crates.io/xz2/0.1.7 \
     crate://crates.io/yansi/1.0.1 \
     crate://crates.io/yasna/0.5.2 \
@@ -660,17 +647,18 @@ SRC_URI += " \
     crate://crates.io/zerovec-derive/0.11.1 \
     crate://crates.io/zip/2.4.2 \
     crate://crates.io/zlib-rs/0.5.1 \
-    crate://crates.io/zmij/0.1.11 \
+    crate://crates.io/zmij/1.0.15 \
     crate://crates.io/zopfli/0.8.2 \
     crate://crates.io/zstd/0.13.3 \
     crate://crates.io/zstd-safe/7.2.4 \
     crate://crates.io/zstd-sys/2.0.15+zstd.1.5.7 \
+    crate://crates.io/zune-core/0.5.1 \
+    crate://crates.io/zune-jpeg/0.5.10 \
     crate://crates.io/zvariant/5.6.0 \
     crate://crates.io/zvariant_derive/5.6.0 \
     crate://crates.io/zvariant_utils/3.2.0 \
 "
 
-SRC_URI[addr2line-0.24.2.sha256sum] = "dfbe277e56a376000877090da837660b4427aad530e3028d44e0bffe4f89a1c1"
 SRC_URI[adler2-2.0.1.sha256sum] = "320119579fcad9c21884f5c4861d16174d0e06250625266f50fe6898340abefa"
 SRC_URI[aes-0.8.4.sha256sum] = "b169f7a6d4742236a0a00c541b845991d0ac43e546831af1249753ab4c3aa3a0"
 SRC_URI[aho-corasick-1.1.3.sha256sum] = "8e60d3430d3a69478ad0993f19238d2df97c507009a52b3c10addcd7f6bcb916"
@@ -688,15 +676,18 @@ SRC_URI[arbitrary-1.4.1.sha256sum] = "dde20b3d026af13f561bdd0f15edf01fc734f0dafc
 SRC_URI[arcstr-1.2.0.sha256sum] = "03918c3dbd7701a85c6b9887732e2921175f26c350b4563841d0958c21d57e6d"
 SRC_URI[arrayref-0.3.9.sha256sum] = "76a2e8124351fda1ef8aaaa3bbd7ebbcb486bbcd4225aca0aa0d84bb2db8fecb"
 SRC_URI[arrayvec-0.7.6.sha256sum] = "7c02d123df017efcdfbd739ef81735b36c5ba83ec3c59c80a9d7ecc718f92e50"
+SRC_URI[asn1-rs-0.7.1.sha256sum] = "56624a96882bb8c26d61312ae18cb45868e5a9992ea73c58e45c3101e56a1e60"
+SRC_URI[asn1-rs-derive-0.6.0.sha256sum] = "3109e49b1e4909e9db6515a30c633684d68cdeaa252f215214cb4fa1a5bfee2c"
+SRC_URI[asn1-rs-impl-0.2.0.sha256sum] = "7b18050c2cd6fe86c3a76584ef5e0baf286d038cda203eb6223df2cc413565f7"
 SRC_URI[assert-json-diff-2.0.2.sha256sum] = "47e4f2b81832e72834d7518d8487a0396a28cc408186a2e8854c0f98011faf12"
-SRC_URI[assert_cmd-2.0.17.sha256sum] = "2bd389a4b2970a01282ee455294913c0a43724daedcd1a24c3eb0ec1c1320b66"
+SRC_URI[assert_cmd-2.1.2.sha256sum] = "9c5bcfa8749ac45dd12cb11055aeeb6b27a3895560d60d71e3c23bf979e60514"
 SRC_URI[assert_fs-1.1.3.sha256sum] = "a652f6cb1f516886fcfee5e7a5c078b9ade62cfcb889524efe5a64d682dd27a9"
 SRC_URI[astral-pubgrub-0.3.3.sha256sum] = "d6cb15b4f5096a3a1b41fdc2736a1c33d87c78f34d3c1ec2b669e766edadd559"
 SRC_URI[astral-reqwest-middleware-0.4.2.sha256sum] = "638d02e24aeb92f9537897cd1ff82e2bc98fd9ac9575a503e27bb07cdf64d4d7"
 SRC_URI[astral-reqwest-retry-0.8.0.sha256sum] = "78ab210f6cdf8fd3254d47e5ee27ce60ed34a428ff71b4ae9477b1c84b49498c"
 SRC_URI[astral-tl-0.7.11.sha256sum] = "d90933ffb0f97e2fc2e0de21da9d3f20597b804012d199843a6fe7c2810d28f3"
 SRC_URI[astral-tokio-tar-0.5.6.sha256sum] = "ec179a06c1769b1e42e1e2cbe74c7dcdb3d6383c838454d063eaac5bbb7ebbe5"
-SRC_URI[astral-version-ranges-0.1.3.sha256sum] = "e7adc2308a566fab9de02bc0e05d18c5a21cb0e793684e4f64c8eb956969b074"
+SRC_URI[astral-version-ranges-0.1.4.sha256sum] = "31979bc305610246d78ac01d63467a12d8454c6e3b8b22b5811d343a1198dfbb"
 SRC_URI[astral_async_http_range_reader-0.9.1.sha256sum] = "7ddaca0fbbf0d91103cca7c7611790c65f6eff1d456f7fe6bf565d436dc9b8f3"
 SRC_URI[astral_async_zip-0.0.17.sha256sum] = "ab72a761e6085828cc8f0e05ed332b2554701368c5dc54de551bfaec466518ba"
 SRC_URI[async-broadcast-0.7.2.sha256sum] = "435a87a52755b8f27fcf321ac4f04b2802e337c8c4872923137471ec39c37532"
@@ -710,14 +701,13 @@ SRC_URI[axoasset-1.3.0.sha256sum] = "56b3b6c5d71b918c0f42f43f69b303d7529b4233a59
 SRC_URI[axoprocess-0.2.1.sha256sum] = "8a4b4798a6c02e91378537c63cd6e91726900b595450daa5d487bc3c11e95e1b"
 SRC_URI[axotag-0.3.0.sha256sum] = "dc923121fbc4cc72e9008436b5650b98e56f94b5799df59a1b4f572b5c6a7e6b"
 SRC_URI[axoupdater-0.9.1.sha256sum] = "dc482a1926df098f4e3806b834f3fe73a1ab54b24ab0ac481f72de479af5e982"
-SRC_URI[backon-1.5.2.sha256sum] = "592277618714fbcecda9a02ba7a8781f319d26532a88553bbacc77ba5d2b3a8d"
-SRC_URI[backtrace-0.3.75.sha256sum] = "6806a6321ec58106fea15becdad98371e28d92ccbc7c8f1b3b6dd724fe8f1002"
+SRC_URI[backon-1.6.0.sha256sum] = "cffb0e931875b666fc4fcb20fee52e9bbd1ef836fd9e9e04ec21555f9f85f7ef"
 SRC_URI[base64-0.21.7.sha256sum] = "9d297deb1925b89f2ccc13d7635fa0714f12c87adce1c75356b39ca9b7178567"
 SRC_URI[base64-0.22.1.sha256sum] = "72b3254f16251a8381aa12e40e3c4d2f0199f8c6508fbecb9d91f575e0fbb8c6"
 SRC_URI[base64ct-1.8.2.sha256sum] = "7d809780667f4410e7c41b07f52439b94d2bdf8528eeedc287fa38d3b7f95d82"
 SRC_URI[bisection-0.1.0.sha256sum] = "021e079a1bab0ecce6cf4b4b74c0c37afa4a697136eb3b127875c84a8f04a8c3"
 SRC_URI[bitflags-1.3.2.sha256sum] = "bef38d45163c2f1dde094a7dfd33ccf595c92905c8f8f4fdc18d06fb1037718a"
-SRC_URI[bitflags-2.9.4.sha256sum] = "2261d10cca569e4643e526d8dc2e62e433cc8aba21ab764233731f8d369bf394"
+SRC_URI[bitflags-2.10.0.sha256sum] = "812e12b5285cc515a9c72a5c1d3b6d46a19dac5acfef5265968c166106e31dd3"
 SRC_URI[blake2-0.10.6.sha256sum] = "46502ad458c9a52b69d4d4d32775c788b7a1b85e8bc9d482d92250fc0e3f8efe"
 SRC_URI[block-buffer-0.10.4.sha256sum] = "3078c7629b62d3f0439517fa394996acacc5cbc91c5a20d8c658e77abd503a71"
 SRC_URI[block-padding-0.3.3.sha256sum] = "a8894febbff9f758034a5b8e12d87918f56dfc64a8e1fe757d65e29041538d93"
@@ -734,7 +724,7 @@ SRC_URI[bytes-1.10.1.sha256sum] = "d71b6127be86fdcfddb610f7182ac57211d4b18a3e9c8
 SRC_URI[bzip2-0.5.2.sha256sum] = "49ecfb22d906f800d4fe833b6282cf4dc1c298f5057ca0b5445e5c209735ca47"
 SRC_URI[bzip2-sys-0.1.13+1.0.8.sha256sum] = "225bff33b2141874fe80d71e07d6eec4f85c5c216453dd96388240f96e1acc14"
 SRC_URI[camino-1.1.10.sha256sum] = "0da45bc31171d8d6960122e222a67740df867c1dd53b4d51caa297084c185cab"
-SRC_URI[cargo-util-0.2.24.sha256sum] = "f97c9ef0f8af69bfcecfe4c17a414d7bb978fe794bc1a38952e27b5c5d87492d"
+SRC_URI[cargo-util-0.2.25.sha256sum] = "03ae3fc62640c9e0235c95b07e68a59a31919d7331bd95961cc811bc0607c87b"
 SRC_URI[cast-0.3.0.sha256sum] = "37b2a672a2cb129a2e41c10b1224bb368f9f37a2b16b612598138befd7b37eb5"
 SRC_URI[cbc-0.1.2.sha256sum] = "26b52a9543ae338f279b96b0b9fed9c8093744685043739079ce85cd58f289a6"
 SRC_URI[cc-1.2.30.sha256sum] = "deec109607ca693028562ed836a5f1c4b8bd77755c4e132fc5ce11b0b6211ae7"
@@ -745,29 +735,30 @@ SRC_URI[ciborium-0.2.2.sha256sum] = "42e69ffd6f0917f5c029256a24d0161db17cea3997d
 SRC_URI[ciborium-io-0.2.2.sha256sum] = "05afea1e0a06c9be33d539b876f1ce3692f4afea2cb41f740e7743225ed1c757"
 SRC_URI[ciborium-ll-0.2.2.sha256sum] = "57663b653d948a338bfb3eeba9bb2fd5fcfaecb9e199e87e1eda4d9e8b240fd9"
 SRC_URI[cipher-0.4.4.sha256sum] = "773f3b9af64447d2ce9850330c473515014aa235e6a783b02db81ff39e4a3dad"
-SRC_URI[clap-4.5.53.sha256sum] = "c9e340e012a1bf4935f5282ed1436d1489548e8f72308207ea5df0e23d2d03f8"
-SRC_URI[clap_builder-4.5.53.sha256sum] = "d76b5d13eaa18c901fd2f7fca939fefe3a0727a953561fefdf3b2922b8569d00"
+SRC_URI[clap-4.5.54.sha256sum] = "c6e6ff9dcd79cff5cd969a17a545d79e84ab086e444102a591e288a8aa3ce394"
+SRC_URI[clap_builder-4.5.54.sha256sum] = "fa42cf4d2b7a41bc8f663a7cab4031ebafa1bf3875705bfaf8466dc60ab52c00"
 SRC_URI[clap_complete-4.5.55.sha256sum] = "a5abde44486daf70c5be8b8f8f1b66c49f86236edf6fa2abadb4d961c4c6229a"
 SRC_URI[clap_complete_command-0.6.1.sha256sum] = "da8e198c052315686d36371e8a3c5778b7852fc75cc313e4e11eeb7a644a1b62"
 SRC_URI[clap_complete_nushell-4.5.8.sha256sum] = "0a0c951694691e65bf9d421d597d68416c22de9632e884c28412cb8cd8b73dce"
 SRC_URI[clap_derive-4.5.49.sha256sum] = "2a0b5487afeab2deb2ff4e03a807ad1a03ac532ff5a2cee5d86884440c7f7671"
 SRC_URI[clap_lex-0.7.5.sha256sum] = "b94f61472cee1439c0b966b47e3aca9ae07e45d070759512cd390ea2bebc6675"
-SRC_URI[codspeed-4.0.5.sha256sum] = "fe68fdd3fe25bc26de0230718d74eb150f09f70be3141c61ea7f9b00812054aa"
-SRC_URI[codspeed-criterion-compat-4.0.5.sha256sum] = "4a06533c3c2c7b43b2efcca2dc0f228097b4c582c95f59cc187bbeb926b42cfb"
-SRC_URI[codspeed-criterion-compat-walltime-4.0.5.sha256sum] = "4102bd4dcfb09fae5cf5ca86c6c5ad0bd0cabe834cd84b5e7b7dd969fb9093e8"
+SRC_URI[codspeed-4.2.1.sha256sum] = "5f0d98d97fd75ca4489a1a0997820a6521531085e7c8a98941bd0e1264d567dd"
+SRC_URI[codspeed-criterion-compat-4.2.1.sha256sum] = "d16fe2db207123f7b3a3b5cfff0c22f99469f7534145f3573f57f4c8a5653c2c"
+SRC_URI[codspeed-criterion-compat-walltime-4.2.1.sha256sum] = "b035c7f9846b143aeabb3833f5b584023eb97b43ecbff3d997db74c4372df2bd"
 SRC_URI[color_quant-1.1.0.sha256sum] = "3d7b894f5411737b7867f4827955924d7c254fc9f4d91a6aad6b097804b1018b"
 SRC_URI[colorchoice-1.0.4.sha256sum] = "b05b61dc5112cbb17e4b6cd61790d9845d13888356391624cbe7e41efeac1e75"
 SRC_URI[colored-2.2.0.sha256sum] = "117725a109d387c937a1533ce01b450cbde6b88abceea8473c4d7a85853cda3c"
 SRC_URI[concurrent-queue-2.5.0.sha256sum] = "4ca0197aee26d1ae37445ee532fefce43251d24cc7c166799f4d46817f1d3973"
 SRC_URI[configparser-3.1.0.sha256sum] = "e57e3272f0190c3f1584272d613719ba5fc7df7f4942fe542e63d949cf3a649b"
 SRC_URI[console-0.15.11.sha256sum] = "054ccb5b10f9f2cbf51eb355ca1d05c2d279ce1804688d0db74b4733a5aeafd8"
-SRC_URI[console-0.16.1.sha256sum] = "b430743a6eb14e9764d4260d4c0d8123087d504eeb9c48f2b2a5e810dd369df4"
+SRC_URI[console-0.16.2.sha256sum] = "03e45a4a8926227e4197636ba97a9fc9b00477e9f4bd711395687c5f0734bec4"
 SRC_URI[const-oid-0.9.6.sha256sum] = "c2459377285ad874054d797f3ccebf984978aa39129f6eafde5cdc8315b612f8"
 SRC_URI[const-random-0.1.18.sha256sum] = "87e00182fe74b066627d63b85fd550ac2998d4b0bd86bfed477a0ae4c7c71359"
 SRC_URI[const-random-macro-0.1.16.sha256sum] = "f9d839f2a20b0aee515dc581a6172f2321f96cab76c1a38a4c584a194955390e"
 SRC_URI[core-foundation-0.9.4.sha256sum] = "91e195e091a93c46f7102ec7818a2aa394e1e1771c3ab4825963fa03e45afb8f"
 SRC_URI[core-foundation-0.10.1.sha256sum] = "b2a6cd9ae233e7f62ba4e9353e81a88df7fc8a5987b8d445b4d90c879bd156f6"
 SRC_URI[core-foundation-sys-0.8.7.sha256sum] = "773648b94d0e5d620f64f280777445740e61fe701025087ec8b57f45c791888b"
+SRC_URI[core_maths-0.1.1.sha256sum] = "77745e017f5edba1a9c1d854f6f3a52dac8a12dd5af5d2f54aecf61e43d80d30"
 SRC_URI[cpufeatures-0.2.17.sha256sum] = "59ed5838eebb26a2bb2e58f6d5b5316989ae9d08bab10e0e6d103e656d1b0280"
 SRC_URI[crc-3.3.0.sha256sum] = "9710d3b3739c2e349eb44fe848ad0b7c8cb1e42bd87ee49371df2f7acaf3e675"
 SRC_URI[crc-catalog-2.4.0.sha256sum] = "19d374276b40fb8bbdee95aef7c7fa6b5316ec764510eb64b8dd0e2ed0d7e7f5"
@@ -779,17 +770,18 @@ SRC_URI[crossbeam-epoch-0.9.18.sha256sum] = "5b82ac4a3c2ca9c3460964f020e1402edd5
 SRC_URI[crossbeam-utils-0.8.21.sha256sum] = "d0a5c400df2834b80a4c3327b3aad3a4c4cd4de0629063962b03235697506a28"
 SRC_URI[crunchy-0.2.4.sha256sum] = "460fbee9c2c2f33933d720630a6a0bac33ba7053db5344fac858d4b8952d77d5"
 SRC_URI[crypto-common-0.1.6.sha256sum] = "1bfb12502f3fc46cca1bb51ac28df9d618d813cdc3d2f25b9fe775a34af26bb3"
-SRC_URI[csv-1.3.1.sha256sum] = "acdc4883a9c96732e4733212c01447ebd805833b7275a73ca3ee080fd77afdaf"
+SRC_URI[csv-1.4.0.sha256sum] = "52cd9d68cf7efc6ddfaaee42e7288d3a99d613d4b50f76ce9827ae0c6e14f938"
 SRC_URI[csv-core-0.1.12.sha256sum] = "7d02f3b0da4c6504f86e9cd789d8dbafab48c2321be74e9987593de5a894d93d"
 SRC_URI[ctrlc-3.5.1.sha256sum] = "73736a89c4aff73035ba2ed2e565061954da00d4970fc9ac25dcc85a2a20d790"
 SRC_URI[cyclonedx-bom-0.8.0.sha256sum] = "ce2ec98a191e17f63b92b132f6852462de9eaee03ca8dbf2df401b9fd809bcac"
 SRC_URI[cyclonedx-bom-macros-0.1.0.sha256sum] = "c50341f21df64b412b4f917e34b7aa786c092d64f3f905f478cb76950c7e980c"
 SRC_URI[dashmap-6.1.0.sha256sum] = "5041cc499144891f3790297212f32a74fb938e5136a14943f338ef9e0ae276cf"
-SRC_URI[data-encoding-2.9.0.sha256sum] = "2a2330da5de22e8a3cb63252ce2abb30116bf5265e89c0e01bc17015ce30a476"
-SRC_URI[data-url-0.2.0.sha256sum] = "8d7439c3735f405729d52c3fbbe4de140eaf938a1fe47d227c27f8254d4302a5"
+SRC_URI[data-encoding-2.10.0.sha256sum] = "d7a1e2f27636f116493b8b860f5546edb47c8d8f8ea73e1d2a20be88e28d1fea"
+SRC_URI[data-url-0.3.2.sha256sum] = "be1e0bca6c3637f992fc1cc7cbc52a78c1ef6db076dbf1059c4323d6a2048376"
 SRC_URI[deadpool-0.12.3.sha256sum] = "0be2b1d1d6ec8d846f05e137292d0b89133caf95ef33695424c09568bdd39b1b"
 SRC_URI[deadpool-runtime-0.1.4.sha256sum] = "092966b41edc516079bdf31ec78a2e0588d1d0c08f78b91d8307215928642b2b"
 SRC_URI[der-0.7.10.sha256sum] = "e7c1832837b905bbfb5101e07cc24c8deddf52f93225eee6ead5f4d63d53ddcb"
+SRC_URI[der-parser-10.0.0.sha256sum] = "07da5016415d5a3c4dd39b11ed26f915f52fc4e0dc197d87908bc916e51bc1a6"
 SRC_URI[deranged-0.5.5.sha256sum] = "ececcb659e7ba858fb4f10388c250a7252eb0a27373f1a72b8748afdd248e587"
 SRC_URI[derive_arbitrary-1.4.1.sha256sum] = "30542c1ad912e0e3d22a1935c290e12e8a29d704a420177a31faad4a601a0800"
 SRC_URI[diff-0.1.13.sha256sum] = "56254986775e3233ffa9c4d7d3faaf6d36a2c09d30b20687e9f88bc8bafc16c8"
@@ -820,11 +812,12 @@ SRC_URI[equivalent-1.0.2.sha256sum] = "877a4ace8713b0bcf2a4e7eec82529c029f1d0619
 SRC_URI[erased-serde-0.4.6.sha256sum] = "e004d887f51fcb9fef17317a2f3525c887d8aa3f4f50fed920816a688284a5b7"
 SRC_URI[errno-0.3.13.sha256sum] = "778e2ac28f6c47af28e4907f13ffd1e1ddbd400980a9abd7c8df189bf578a5ad"
 SRC_URI[etcetera-0.11.0.sha256sum] = "de48cc4d1c1d97a20fd819def54b890cadde72ed3ad0c614822a0a433361be96"
+SRC_URI[euclid-0.22.11.sha256sum] = "ad9cdb4b747e485a12abb0e6566612956c7a1bafa3bdb8d682c5b6d403589e48"
 SRC_URI[event-listener-5.4.0.sha256sum] = "3492acde4c3fc54c845eaab3eed8bd00c7a7d881f78bfc801e43a93dec1331ae"
 SRC_URI[event-listener-strategy-0.5.4.sha256sum] = "8be9f3dfaaffdae2972880079a491a1a8bb7cbed0b8dd7a347f668b4150a3b93"
 SRC_URI[fastrand-2.3.0.sha256sum] = "37909eebbb50d72f9059c3b6d82c0463f2ff062c9e95845c43a6c9c0355411be"
 SRC_URI[fdeflate-0.3.7.sha256sum] = "1e6853b52649d4ac5c0bd02320cddc5ba956bdb407c4b75a2c6b75bf51500f8c"
-SRC_URI[filetime-0.2.26.sha256sum] = "bc0505cd1b6fa6580283f6bdf70a73fcf4aba1184038c90902b92b3dd0df63ed"
+SRC_URI[filetime-0.2.27.sha256sum] = "f98844151eee8917efc50bd9e8318cb963ae8b297431495d3f758616ea5c57db"
 SRC_URI[fixedbitset-0.5.7.sha256sum] = "1d674e81391d1e1ab681a28d99df07927c6d4aa5b027d7da16ba32d1d21ecd99"
 SRC_URI[flate2-1.1.5.sha256sum] = "bfe33edd8e85a12a67454e37f8c75e730830d83e313556ab9ebf9ee7fbeb3bfb"
 SRC_URI[float-cmp-0.9.0.sha256sum] = "98de4bbd547a563b716d8dfa9aad1cb19bfab00f4fa09a6a4ed21dbcf44ce9c4"
@@ -834,9 +827,9 @@ SRC_URI[fnv-1.0.7.sha256sum] = "3f9eec918d3f24069decb9af1554cad7c880e2da24a9afd8
 SRC_URI[foldhash-0.1.5.sha256sum] = "d9c4f5dac5e15c24eb999c26181a6ca40b39fe946cbe4c263c7209467bc83af2"
 SRC_URI[foldhash-0.2.0.sha256sum] = "77ce24cb58228fbb8aa041425bb1050850ac19177686ea6e0f41a70416f56fdb"
 SRC_URI[fontconfig-parser-0.5.8.sha256sum] = "bbc773e24e02d4ddd8395fd30dc147524273a83e54e0f312d986ea30de5f5646"
-SRC_URI[fontdb-0.12.0.sha256sum] = "ff20bef7942a72af07104346154a70a70b089c572e454b41bef6eb6cb10e9c06"
+SRC_URI[fontdb-0.23.0.sha256sum] = "457e789b3d1202543297a350643cf459f836cade38934e7a4cf6a39e7cde2905"
 SRC_URI[form_urlencoded-1.2.2.sha256sum] = "cb4cb245038516f5f85277875cdaa4f7d2c9a0fa0468de06ed190163b1581fcf"
-SRC_URI[fs-err-3.1.3.sha256sum] = "6ad492b2cf1d89d568a43508ab24f98501fe03f2f31c01e1d0fe7366a71745d2"
+SRC_URI[fs-err-3.2.2.sha256sum] = "baf68cef89750956493a66a10f512b9e58d9db21f2a573c079c0bdf1207a54a7"
 SRC_URI[futures-0.3.31.sha256sum] = "65bc07b1a8bc7c85c5f2e110c476c7389b4554ba72af57d8445ea63a576b0876"
 SRC_URI[futures-channel-0.3.31.sha256sum] = "2dff15bf788c671c1934e366d07e30c1814a8ef514e1af724a602e8a2fbe1b10"
 SRC_URI[futures-core-0.3.31.sha256sum] = "05f29059c0c2090612e8d742178b0580d2dc940c837851ad723096f87af6663e"
@@ -850,8 +843,7 @@ SRC_URI[futures-util-0.3.31.sha256sum] = "9fa08315bb612088cc391249efdc3bc77536f1
 SRC_URI[generic-array-0.14.7.sha256sum] = "85649ca51fd72272d7821adaf274ad91c288277713d9c18820d8499a7ff69e9a"
 SRC_URI[getrandom-0.2.16.sha256sum] = "335ff9f135e4384c8150d6f27c6daed433577f86b4750418338c01a1a2528592"
 SRC_URI[getrandom-0.3.3.sha256sum] = "26145e563e54f2cadc477553f1ec5ee650b00862f0a58bcd12cbdc5f0ea2d2f4"
-SRC_URI[gif-0.12.0.sha256sum] = "80792593675e051cf94a4b111980da2ba60d4a83e43e0048c5693baab3977045"
-SRC_URI[gimli-0.31.1.sha256sum] = "07e28edb80900c19c28f1072f2e8aeca7fa06b23cd4169cefe1af5aa3260783f"
+SRC_URI[gif-0.14.1.sha256sum] = "f5df2ba84018d80c213569363bdcd0c64e6933c67fe4c1d60ecf822971a3c35e"
 SRC_URI[glob-0.3.3.sha256sum] = "0cc23270f6e1808e30a928bdc84dea0b9b4136a8bc82338574f23baf47bbd280"
 SRC_URI[globset-0.4.18.sha256sum] = "52dfc19153a48bde0cbd630453615c8151bce3a5adfac7a0aebfbf0a1e1f57e3"
 SRC_URI[globwalk-0.9.1.sha256sum] = "0bf760ebf69878d9fd8f110c89703d90ce35095324d1f1edcb595c63945ee757"
@@ -869,7 +861,7 @@ SRC_URI[hkdf-0.12.4.sha256sum] = "7b5f8eb2ad728638ea2c7d47a21db23b7b58a72ed6a382
 SRC_URI[hmac-0.12.1.sha256sum] = "6c49c37c09c17a53d937dfbb742eb3a961d65a994e6bcdcf37e7399d0cc8ab5e"
 SRC_URI[homedir-0.3.6.sha256sum] = "68df315d2857b2d8d2898be54a85e1d001bbbe0dbb5f8ef847b48dd3a23c4527"
 SRC_URI[html-escape-0.2.13.sha256sum] = "6d1ad449764d627e22bfd7cd5e8868264fc9236e07c752972b4080cd351cb476"
-SRC_URI[http-1.3.1.sha256sum] = "f4a85d31aea989eead29a3aaf9e1115a180df8282431156e533de47660892565"
+SRC_URI[http-1.4.0.sha256sum] = "e3ba2a386d7f85a81f119ad7498ebe444d2e22c2af0b86b069416ace48b3311a"
 SRC_URI[http-body-1.0.1.sha256sum] = "1efedce1fb8e6913f23e0c92de8e62cd5b772a67e7b3946df930a62566c93184"
 SRC_URI[http-body-util-0.1.3.sha256sum] = "b021d93e26becf5dc7e1b75b1bed1fd93124b374ceb73f43d4d4eafec896a64a"
 SRC_URI[http-content-range-0.2.3.sha256sum] = "63f67baaf67a9ae8fae78ecee69294d552b764dbcd6f8735d0a9c9be20ab0c82"
@@ -889,13 +881,13 @@ SRC_URI[idna-1.1.0.sha256sum] = "3b0875f23caa03898994f6ddc501886a45c7d3d62d04d2d
 SRC_URI[idna_adapter-1.2.1.sha256sum] = "3acae9609540aa318d1bc588455225fb2085b9ed0c4f6bd0d9d5bcd86f1a0344"
 SRC_URI[ignore-0.4.25.sha256sum] = "d3d782a365a015e0f5c04902246139249abf769125006fbe7649e2ee88169b4a"
 SRC_URI[image-0.25.6.sha256sum] = "db35664ce6b9810857a38a906215e75a9c879f0696556a39f59c62829710251a"
-SRC_URI[imagesize-0.11.0.sha256sum] = "b72ad49b554c1728b1e83254a1b1565aea4161e28dabbfa171fc15fe62299caf"
-SRC_URI[indexmap-2.12.1.sha256sum] = "0ad4bb2b565bca0645f4d68c5c9af97fba094e9791da685bf83cb5f3ce74acf2"
+SRC_URI[image-webp-0.2.4.sha256sum] = "525e9ff3e1a4be2fbea1fdf0e98686a6d98b4d8f937e1bf7402245af1909e8c3"
+SRC_URI[imagesize-0.14.0.sha256sum] = "09e54e57b4c48b40f7aec75635392b12b3421fa26fe8b4332e63138ed278459c"
+SRC_URI[indexmap-2.13.0.sha256sum] = "7714e70437a7dc3ac8eb7e6f8df75fd8eb422675fc7678aff7364301092b1017"
 SRC_URI[indicatif-0.18.3.sha256sum] = "9375e112e4b463ec1b1c6c011953545c65a30164fbab5b581df32b3abf0dcb88"
 SRC_URI[indoc-2.0.7.sha256sum] = "79cf5c93f93228cf8efb3ba362535fb11199ac548a09ce117c9b1adc3030d706"
 SRC_URI[inout-0.1.4.sha256sum] = "879f10e63c20629ecabbb64a8010319738c66a5cd0c29b02d63d272b03751d01"
-SRC_URI[insta-1.45.0.sha256sum] = "b76866be74d68b1595eb8060cb9191dca9c021db2316558e52ddc5d55d41b66c"
-SRC_URI[io-uring-0.7.9.sha256sum] = "d93587f37623a1a17d94ef2bc9ada592f5465fe7732084ab7beefabe5c77c0c4"
+SRC_URI[insta-1.46.1.sha256sum] = "248b42847813a1550dafd15296fd9748c651d0c32194559dbc05d804d54b21e8"
 SRC_URI[ipnet-2.11.0.sha256sum] = "469fb0b9cefa57e3ef31275ee7cacb78f2fdca44e4765491884a2b119d4eb130"
 SRC_URI[iri-string-0.7.8.sha256sum] = "dbc5ebe9c3a1a7a5127f920a418f7585e9e758e911d0466ed004f393b0e380b2"
 SRC_URI[is-docker-0.2.0.sha256sum] = "928bae27f42bc99b60d9ac7334e3a21d10ad8f1835a4e12ec3ec0464765ed1b3"
@@ -907,22 +899,20 @@ SRC_URI[itertools-0.10.5.sha256sum] = "b0fd2260e829bddf4cb6ea802289de2f86d6a7a69
 SRC_URI[itertools-0.13.0.sha256sum] = "413ee7dfc52ee1a4949ceeb7dbc8a33f2d6c088194d9f922fb8318faf1f01186"
 SRC_URI[itertools-0.14.0.sha256sum] = "2b192c782037fadd9cfa75548310488aabdbf3d2da73885b31bd0abd03351285"
 SRC_URI[itoa-1.0.15.sha256sum] = "4a5f13b858c8d314ee3e8f639011f7ccefe71f97f96e50151fb991f267928e2c"
-SRC_URI[jiff-0.2.16.sha256sum] = "49cce2b81f2098e7e3efc35bc2e0a6b7abec9d34128283d7a26fa8f32a6dbb35"
-SRC_URI[jiff-static-0.2.16.sha256sum] = "980af8b43c3ad5d8d349ace167ec8170839f753a42d233ba19e08afe1850fa69"
+SRC_URI[jiff-0.2.18.sha256sum] = "e67e8da4c49d6d9909fe03361f9b620f58898859f5c7aded68351e85e71ecf50"
+SRC_URI[jiff-static-0.2.18.sha256sum] = "e0c84ee7f197eca9a86c6fd6cb771e55eb991632f15f2bc3ca6ec838929e6e78"
 SRC_URI[jiff-tzdb-0.1.4.sha256sum] = "c1283705eb0a21404d2bfd6eef2a7593d240bc42a0bdb39db0ad6fa2ec026524"
 SRC_URI[jiff-tzdb-platform-0.1.3.sha256sum] = "875a5a69ac2bab1a891711cf5eccbec1ce0341ea805560dcd90b7a2e925132e8"
-SRC_URI[jobserver-0.1.33.sha256sum] = "38f262f097c174adebe41eb73d66ae9c06b2844fb0da69969647bbddd9b0538a"
-SRC_URI[jpeg-decoder-0.3.2.sha256sum] = "00810f1d8b74be64b13dbf3db89ac67740615d6c891f0e7b6179326533011a07"
+SRC_URI[jobserver-0.1.34.sha256sum] = "9afb3de4395d6b3e67a780b6de64b51c978ecf11cb9a462c66be7d4ca9039d33"
 SRC_URI[js-sys-0.3.77.sha256sum] = "1cfaf33c695fc6e08064efbc1f72ec937429614f25eef83af942d0e227c3a28f"
 SRC_URI[jsonwebtoken-9.3.1.sha256sum] = "5a87cc7a48537badeae96744432de36f4be2b4a34a05a5ef32e9dd8a1c169dde"
-SRC_URI[junction-1.2.0.sha256sum] = "72bbdfd737a243da3dfc1f99ee8d6e166480f17ab4ac84d7c34aacd73fc7bd16"
-SRC_URI[kurbo-0.8.3.sha256sum] = "7a53776d271cfb873b17c618af0298445c88afc52837f3e948fa3fafd131f449"
-SRC_URI[kurbo-0.9.5.sha256sum] = "bd85a5776cd9500c2e2059c8c76c3b01528566b7fcbaf8098b55a33fc298849b"
+SRC_URI[junction-1.4.1.sha256sum] = "642883fdc81cf2da15ee8183fa1d2c7da452414dd41541a0f3e1428069345447"
+SRC_URI[kurbo-0.13.0.sha256sum] = "7564e90fe3c0d5771e1f0bc95322b21baaeaa0d9213fa6a0b61c99f8b17b3bfb"
 SRC_URI[lazy_static-1.5.0.sha256sum] = "bbd2bcb4c963f2ddae06a2efc7e9f3591312473c50c6685e1f298068316e66fe"
 SRC_URI[libc-0.2.178.sha256sum] = "37c93d8daa9d8a012fd8ab92f088405fb202ea0b6ab73ee2482ae66af4f42091"
 SRC_URI[libm-0.2.15.sha256sum] = "f9fbbcab51052fe104eb5e5d351cf728d30a5be1fe14d9be8a3b097481fb97de"
 SRC_URI[libmimalloc-sys-0.1.44.sha256sum] = "667f4fec20f29dfc6bc7357c582d91796c169ad7e2fce709468aefeb2c099870"
-SRC_URI[libredox-0.1.6.sha256sum] = "4488594b9328dee448adb906d8b126d9b7deb7cf5c22161ee591610bb1be83c0"
+SRC_URI[libredox-0.1.12.sha256sum] = "3d0b95e02c851351f877147b7deea7b1afb1df71b63aa5f8270716e0c5720616"
 SRC_URI[libz-rs-sys-0.5.1.sha256sum] = "172a788537a2221661b480fee8dc5f96c580eb34fa88764d3205dc356c7e4221"
 SRC_URI[linux-raw-sys-0.11.0.sha256sum] = "df1d3c3b53da64cf5760482273a98e575c651a67eec7f77df96b5b642de8f039"
 SRC_URI[litemap-0.8.0.sha256sum] = "241eaef5fd12c88705a01fc1066c48c4b36e0dd4377dcdc7ec3942cea7a69956"
@@ -936,7 +926,6 @@ SRC_URI[markdown-1.0.0.sha256sum] = "a5cab8f2cadc416a82d2e783a1946388b31654d391d
 SRC_URI[matchers-0.2.0.sha256sum] = "d1525a2a28c7f4fa0fc98bb91ae755d1e2d1505079e05539e35bc876b5d65ae9"
 SRC_URI[md-5-0.10.6.sha256sum] = "d89e7ee0cfbedfc4da3340218492196241d89eefb6dab27de5df917a6d2e78cf"
 SRC_URI[memchr-2.7.6.sha256sum] = "f52b00d39961fc5b2736ea853c9cc86238e165017a493d1d5c8eac6bdc4cc273"
-SRC_URI[memmap2-0.5.10.sha256sum] = "83faa42c0a078c393f6b29d5db232d8be22776a891f8f56e5284faee4a20b327"
 SRC_URI[memmap2-0.9.7.sha256sum] = "483758ad303d734cec05e5c12b41d7e93e6a6390c5e9dae6bdeb7c1259012d28"
 SRC_URI[memoffset-0.9.1.sha256sum] = "488016bfae457b036d996092f6cb448677611ce4449e970ceaf42695203f218a"
 SRC_URI[miette-7.6.0.sha256sum] = "5f98efec8807c63c752b5bd61f862c165c115b0a35685bdcfd9238c7aeb592b7"
@@ -944,6 +933,7 @@ SRC_URI[miette-derive-7.6.0.sha256sum] = "db5b29714e950dbb20d5e6f74f9dcec4edbcc1
 SRC_URI[mimalloc-0.1.48.sha256sum] = "e1ee66a4b64c74f4ef288bcbb9192ad9c3feaad75193129ac8509af543894fd8"
 SRC_URI[mime-0.3.17.sha256sum] = "6877bb514081ee2a7ff5ef9de3281f14a4dd4bceac4c09388074a6b5df8a139a"
 SRC_URI[mime_guess-2.0.5.sha256sum] = "f7c44f8e672c00fe5308fa235f821cb4198414e1c77935c1ab6948d3fd78550e"
+SRC_URI[minimal-lexical-0.2.1.sha256sum] = "68354c5c6bd36d73ff3feceb05efa59b6acb7626617f4962be322a825e61f79a"
 SRC_URI[miniz_oxide-0.8.9.sha256sum] = "1fa76a2c86f704bdb222d66965fb3d63269ce38518b83cb0575fca855ebb6316"
 SRC_URI[mio-1.1.0.sha256sum] = "69d83b0086dc8ecf3ce9ae2874b2d1290252e2a30720bea58a5c6639b0092873"
 SRC_URI[miow-0.6.1.sha256sum] = "536bfad37a309d62069485248eeaba1e8d9853aaf951caaeaed0585a95346f08"
@@ -951,6 +941,7 @@ SRC_URI[munge-0.4.5.sha256sum] = "9cce144fab80fbb74ec5b89d1ca9d41ddf6b644ab7e986
 SRC_URI[munge_macro-0.4.5.sha256sum] = "574af9cd5b9971cbfdf535d6a8d533778481b241c447826d976101e0149392a1"
 SRC_URI[nanoid-0.4.0.sha256sum] = "3ffa00dec017b5b1a8b7cf5e2c008bfda1aa7e0697ac1508b491fdf2622fb4d8"
 SRC_URI[nix-0.30.1.sha256sum] = "74523f3a35e05aba87a1d978330aef40f67b0304ac79c1c00b294c9830543db6"
+SRC_URI[nom-7.1.3.sha256sum] = "d273983c5a657a70a3e8f2a01329822f3b8c8172b73826411a55751e404a0a4a"
 SRC_URI[normalize-line-endings-0.3.0.sha256sum] = "61807f77802ff30975e01f4f071c8ba10c022052f98b3294119f3e615d13e5be"
 SRC_URI[nu-ansi-term-0.50.1.sha256sum] = "d4a28e057d01f97e61255210fcff094d74ed0466038633e95017f5beb68e4399"
 SRC_URI[num-0.4.3.sha256sum] = "35bd024e8b2ff75562e5f34e7f4905839deb4b22955ef5e73d2fea1b9813cb23"
@@ -965,7 +956,7 @@ SRC_URI[num-traits-0.2.19.sha256sum] = "071dfc062690e90b734c0b2273ce72ad0ffa95f0
 SRC_URI[num_cpus-1.17.0.sha256sum] = "91df4bbde75afed763b708b7eee1e8e7651e02d97f6d5dd763e89367e957b23b"
 SRC_URI[objc2-0.6.3.sha256sum] = "b7c2599ce0ec54857b29ce62166b0ed9b4f6f1a70ccc9a71165b6154caca8c05"
 SRC_URI[objc2-encode-4.1.0.sha256sum] = "ef25abbcd74fb2609453eb695bd2f860d389e457f67dc17cafc8b8cbc89d0c33"
-SRC_URI[object-0.36.7.sha256sum] = "62948e14d923ea95ea2c7c86c71013138b66525b86bdc08d2dcc262bdb497b87"
+SRC_URI[oid-registry-0.8.1.sha256sum] = "12f40cff3dde1b6087cc5d5f5d4d65712f34016a03ed60e9c08dcc392736b5b7"
 SRC_URI[once_cell-1.21.3.sha256sum] = "42f5e15c9953c5e4ccceeb2e7382a716482c34515315f7b03532b8b4e8393d2d"
 SRC_URI[once_cell_polyfill-1.70.1.sha256sum] = "a4895175b425cb1f87721b59f0f286c2092bd4af812243672510e1ac53e2e0ad"
 SRC_URI[oorandom-11.1.5.sha256sum] = "d6790f58c7ff633d8771f42965289203411a5e5c68388703c06e14f24770b41e"
@@ -1015,17 +1006,18 @@ SRC_URI[predicates-tree-1.0.12.sha256sum] = "72dd2d6d381dfb73a193c7fca536518d7ca
 SRC_URI[pretty_assertions-1.4.1.sha256sum] = "3ae130e2f271fbc2ac3a40fb1d07180839cdbbe443c7a27e1e3c13c5cac0116d"
 SRC_URI[priority-queue-2.5.0.sha256sum] = "5676d703dda103cbb035b653a9f11448c0a7216c7926bd35fcb5865475d0c970"
 SRC_URI[proc-macro-crate-3.3.0.sha256sum] = "edce586971a4dfaa28950c6f18ed55e0406c1ab88bbce2c6f6293a7aaba73d35"
-SRC_URI[proc-macro2-1.0.103.sha256sum] = "5ee95bc4ef87b8d5ba32e8b7714ccc834865276eab0aed5c9958d00ec45f49e8"
+SRC_URI[proc-macro2-1.0.105.sha256sum] = "535d180e0ecab6268a3e718bb9fd44db66bbbc256257165fc699dadf70d16fe7"
 SRC_URI[procfs-0.18.0.sha256sum] = "25485360a54d6861439d60facef26de713b1e126bf015ec8f98239467a2b82f7"
 SRC_URI[procfs-core-0.18.0.sha256sum] = "e6401bf7b6af22f78b563665d15a22e9aef27775b79b149a66ca022468a4e405"
 SRC_URI[ptr_meta-0.3.0.sha256sum] = "fe9e76f66d3f9606f44e45598d155cb13ecf09f4a28199e48daf8c8fc937ea90"
 SRC_URI[ptr_meta_derive-0.3.0.sha256sum] = "ca414edb151b4c8d125c12566ab0d74dc9cdba36fb80eb7b848c15f495fd32d1"
 SRC_URI[purl-0.1.6.sha256sum] = "60ebe4262ae91ddd28c8721111a0a6e9e58860e211fc92116c4bb85c98fd96ad"
+SRC_URI[quick-error-2.0.1.sha256sum] = "a993555f31e5a609f617c12db6250dedcac1b0a85076912c436e6fc9b2c8e6a3"
 SRC_URI[quick-xml-0.38.3.sha256sum] = "42a232e7487fc2ef313d96dde7948e7a3c05101870d8985e4fd8d26aedd27b89"
 SRC_URI[quinn-0.11.8.sha256sum] = "626214629cda6781b6dc1d316ba307189c85ba657213ce642d9c77670f8202c8"
 SRC_URI[quinn-proto-0.11.12.sha256sum] = "49df843a9161c85bb8aae55f101bc0bac8bcafd637a620d9122fd7e0b2f7422e"
 SRC_URI[quinn-udp-0.5.13.sha256sum] = "fcebb1209ee276352ef14ff8732e24cc2b02bbac986cd74a4c81bcb2f9881970"
-SRC_URI[quote-1.0.42.sha256sum] = "a338cc41d27e6cc6dce6cefc13a0729dfbb81c262b1f519331575dd80ef3067f"
+SRC_URI[quote-1.0.43.sha256sum] = "dc74d9a594b72ae6656596548f56f667211f8a97b3d4c3d467150794690dc40a"
 SRC_URI[quoted_printable-0.5.1.sha256sum] = "640c9bd8497b02465aeef5375144c26062e0dcd5939dfcbb0f5db76cb8c17c73"
 SRC_URI[r-efi-5.3.0.sha256sum] = "69cdb34c158ceb288df11e18b4bd39de994f6657d83847bdffdbd7f346754b0f"
 SRC_URI[rancor-0.1.0.sha256sum] = "caf5f7161924b9d1cea0e4cabc97c372cea92b5f927fc13c6bca67157a0ad947"
@@ -1037,9 +1029,9 @@ SRC_URI[rand_core-0.6.4.sha256sum] = "ec0be4795e2f6a28069bec0b5ff3e2ac9bafc99e6a
 SRC_URI[rand_core-0.9.3.sha256sum] = "99d9a13982dcf210057a8a78572b2217b667c3beacbf3a0d8b454f6f82837d38"
 SRC_URI[rayon-1.11.0.sha256sum] = "368f01d005bf8fd9b1206fb6fa653e6c4a81ceb1466406b81792d87c5677a58f"
 SRC_URI[rayon-core-1.13.0.sha256sum] = "22e18b0f0062d30d4230b2e85ff77fdfe4326feb054b9783a3460d8435c8ab91"
-SRC_URI[rcgen-0.14.5.sha256sum] = "5fae430c6b28f1ad601274e78b7dffa0546de0b73b4cd32f46723c0c2a16f7a5"
-SRC_URI[rctree-0.5.0.sha256sum] = "3b42e27ef78c35d3998403c1d26f3efd9e135d3e5121b0a4845cc5cc27547f4f"
+SRC_URI[rcgen-0.14.6.sha256sum] = "3ec0a99f2de91c3cddc84b37e7db80e4d96b743e05607f647eb236fc0455907f"
 SRC_URI[redox_syscall-0.5.15.sha256sum] = "7e8af0dde094006011e6a740d4879319439489813bd0bcdc7d821beaeeff48ec"
+SRC_URI[redox_syscall-0.7.0.sha256sum] = "49f3fe0889e69e2ae9e41f4d6c4c0181701d00e4697b356fb1f74173a5e0ee27"
 SRC_URI[redox_users-0.5.0.sha256sum] = "dd6f9d3d47bdd2ad6945c5015a226ec6155d0bcdfd8f7cd29f86b71f8de99d2b"
 SRC_URI[ref-cast-1.0.25.sha256sum] = "f354300ae66f76f1c85c5f84693f0ce81d747e2c3f21a45fef496d89c960bf7d"
 SRC_URI[ref-cast-impl-1.0.25.sha256sum] = "b7186006dcb21920990093f30e3dea63b7d6e977bf1256be20c3563a5db070da"
@@ -1056,44 +1048,43 @@ SRC_URI[reqsign-file-read-tokio-2.0.1.sha256sum] = "669ea66036266a9ac371d2e63cc7
 SRC_URI[reqsign-google-2.0.1.sha256sum] = "16e1942acf06b8638f16775e92e4ca9cca239519ea6f4e650d5924d1f0dc37d1"
 SRC_URI[reqsign-http-send-reqwest-2.0.1.sha256sum] = "46186bce769674f9200ad01af6f2ca42de3e819ddc002fff1edae135bfb6cd9c"
 SRC_URI[reqwest-0.12.22.sha256sum] = "cbc931937e6ca3a06e3b6c0aa7841849b160a90351d6ab467a8b9b9959767531"
-SRC_URI[resvg-0.29.0.sha256sum] = "76888219c0881e22b0ceab06fddcfe83163cd81642bd60c7842387f9c968a72e"
+SRC_URI[resvg-0.46.0.sha256sum] = "b563218631706d614e23059436526d005b50ab5f2d506b55a17eb65c5eb83419"
 SRC_URI[retry-policies-0.5.1.sha256sum] = "46a4bd6027df676bcb752d3724db0ea3c0c5fc1dd0376fec51ac7dcaf9cc69be"
 SRC_URI[rgb-0.8.52.sha256sum] = "0c6a884d2998352bb4daf0183589aec883f16a6da1f4dde84d8e2e9a5409a1ce"
 SRC_URI[ring-0.17.14.sha256sum] = "a4689e6c2294d81e88dc6261c768b63bc4fcdb852be6d1352498b114f61383b7"
-SRC_URI[rkyv-0.8.12.sha256sum] = "35a640b26f007713818e9a9b65d34da1cf58538207b052916a83d80e43f3ffa4"
-SRC_URI[rkyv_derive-0.8.12.sha256sum] = "bd83f5f173ff41e00337d97f6572e416d022ef8a19f371817259ae960324c482"
+SRC_URI[rkyv-0.8.14.sha256sum] = "360b333c61ae24e5af3ae7c8660bd6b21ccd8200dbbc5d33c2454421e85b9c69"
+SRC_URI[rkyv_derive-0.8.14.sha256sum] = "7c02f8cdd12b307ab69fe0acf4cd2249c7460eb89dce64a0febadf934ebb6a9e"
 SRC_URI[rmp-0.8.14.sha256sum] = "228ed7c16fa39782c3b3468e974aec2795e9089153cd08ee2e9aefb3613334c4"
-SRC_URI[rmp-serde-1.3.0.sha256sum] = "52e599a477cf9840e92f2cde9a7189e67b42c57532749bf90aea6ec10facd4db"
-SRC_URI[rosvgtree-0.1.0.sha256sum] = "bdc23d1ace03d6b8153c7d16f0708cd80b61ee8e80304954803354e67e40d150"
-SRC_URI[roxmltree-0.18.1.sha256sum] = "862340e351ce1b271a378ec53f304a5558f7db87f3769dc655a8f6ecbb68b302"
+SRC_URI[rmp-serde-1.3.1.sha256sum] = "72f81bee8c8ef9b577d1681a70ebbc962c232461e397b22c208c43c04b67a155"
 SRC_URI[roxmltree-0.20.0.sha256sum] = "6c20b6793b5c2fa6553b250154b78d6d0db37e72700ae35fad9387a46f487c97"
+SRC_URI[roxmltree-0.21.1.sha256sum] = "f1964b10c76125c36f8afe190065a4bf9a87bf324842c05701330bba9f1cacbb"
 SRC_URI[rsa-0.9.9.sha256sum] = "40a0376c50d0358279d9d643e4bf7b7be212f1f4ff1da9070a7b54d22ef75c88"
 SRC_URI[rust-ini-0.21.3.sha256sum] = "796e8d2b6696392a43bea58116b667fb4c29727dc5abd27d6acf338bb4f688c7"
 SRC_URI[rust-netrc-0.1.2.sha256sum] = "7e98097f62769f92dbf95fb51f71c0a68ec18a4ee2e70e0d3e4f47ac005d63e9"
-SRC_URI[rustc-demangle-0.1.25.sha256sum] = "989e6739f80c4ad5b13e0fd7fe89531180375b18520cc8c82080e4dc4035b84f"
 SRC_URI[rustc-hash-2.1.1.sha256sum] = "357703d41365b4b27c590e3ed91eabb1b663f07c4c084095e60cbed4362dff0d"
+SRC_URI[rusticata-macros-4.1.0.sha256sum] = "faf0c4a6ece9950b9abdb62b1cfcf2a68b3b67a10ba445b3bb85be2a293d0632"
 SRC_URI[rustix-1.1.3.sha256sum] = "146c9e247ccc180c1f61615433868c99f3de3ae256a30a43b49f67c2d9171f34"
-SRC_URI[rustls-0.23.35.sha256sum] = "533f54bc6a7d4f647e46ad909549eda97bf5afc1585190ef692b4286b198bd8f"
+SRC_URI[rustls-0.23.36.sha256sum] = "c665f33d38cea657d9614f766881e4d510e0eda4239891eea56b4cadcf01801b"
 SRC_URI[rustls-native-certs-0.8.2.sha256sum] = "9980d917ebb0c0536119ba501e90834767bffc3d60641457fd84a1f3fd337923"
-SRC_URI[rustls-pki-types-1.12.0.sha256sum] = "229a4a4c221013e7e1f1a043678c5cc39fe5171437c88fb47151a21e6f5b5c79"
+SRC_URI[rustls-pki-types-1.13.3.sha256sum] = "4910321ebe4151be888e35fe062169554e74aad01beafed60410131420ceffbc"
 SRC_URI[rustls-webpki-0.103.8.sha256sum] = "2ffdfa2f5286e2247234e03f680868ac2815974dc39e00ea15adc445d0aafe52"
 SRC_URI[rustversion-1.0.21.sha256sum] = "8a0d197bd2c9dc6e53b84da9556a69ba4cdfab8619eb41a8bd1cc2027a0f6b1d"
-SRC_URI[rustybuzz-0.7.0.sha256sum] = "162bdf42e261bee271b3957691018634488084ef577dddeb6420a9684cab2a6a"
+SRC_URI[rustybuzz-0.20.1.sha256sum] = "fd3c7c96f8a08ee34eff8857b11b49b07d71d1c3f4e88f8a88d4c9e9f90b1702"
 SRC_URI[ryu-1.0.20.sha256sum] = "28d3b2b1366ec20994f1fd18c3c594f05c5dd4bc44d8bb0c1c632c8d6829481f"
 SRC_URI[salsa20-0.10.2.sha256sum] = "97a22f5af31f73a954c10289c93e8a50cc23d971e80ee446f1f6f7137a088213"
 SRC_URI[same-file-1.0.6.sha256sum] = "93fc1dc3aaa9bfed95e02e6eadabb4baf7e3078b0bd1b4d7b6b0b68378900502"
 SRC_URI[schannel-0.1.27.sha256sum] = "1f29ebaa345f945cec9fbbc532eb307f0fdad8161f281b6369539c8d84876b3d"
-SRC_URI[schemars-1.0.5.sha256sum] = "1317c3bf3e7df961da95b0a56a172a02abead31276215a0497241a7624b487ce"
-SRC_URI[schemars_derive-1.0.5.sha256sum] = "5f760a6150d45dd66ec044983c124595ae76912e77ed0b44124cb3e415cce5d9"
+SRC_URI[schemars-1.2.0.sha256sum] = "54e910108742c57a770f492731f99be216a52fadd361b06c8fb59d74ccc267d2"
+SRC_URI[schemars_derive-1.2.0.sha256sum] = "4908ad288c5035a8eb12cfdf0d49270def0a268ee162b75eeee0f85d155a7c45"
 SRC_URI[scopeguard-1.2.0.sha256sum] = "94143f37725109f92c262ed2cf5e59bce7498c01bcc1502d7b9afe439a4e9f49"
 SRC_URI[scroll-0.13.0.sha256sum] = "c1257cd4248b4132760d6524d6dda4e053bc648c9070b960929bf50cfb1e7add"
 SRC_URI[scroll_derive-0.13.0.sha256sum] = "22fc4f90c27b57691bbaf11d8ecc7cfbfe98a4da6dbe60226115d322aa80c06e"
 SRC_URI[scrypt-0.11.0.sha256sum] = "0516a385866c09368f0b5bcd1caff3366aace790fcd46e2bb032697bb172fd1f"
 SRC_URI[seahash-4.1.0.sha256sum] = "1c107b6f4780854c8b126e228ea8869f4d7b71260f962fefb57b996b8959ba6b"
 SRC_URI[secrecy-0.10.3.sha256sum] = "e891af845473308773346dc847b2c23ee78fe442e0472ac50e22a18a93d3ae5a"
-SRC_URI[secret-service-5.0.0.sha256sum] = "dccff79e916a339eec808de579764e3459658c903960d5aa4f7959ee9f6d5f2b"
-SRC_URI[security-framework-3.2.0.sha256sum] = "271720403f46ca04f7ba6f55d438f8bd878d6b8ca0a1046e8228c4145bcbb316"
-SRC_URI[security-framework-sys-2.14.0.sha256sum] = "49db231d56a190491cb4aeda9527f1ad45345af50b0851622a7adb8c03b01c32"
+SRC_URI[secret-service-5.1.0.sha256sum] = "9a62d7f86047af0077255a29494136b9aaaf697c76ff70b8e49cded4e2623c14"
+SRC_URI[security-framework-3.5.1.sha256sum] = "b3297343eaf830f66ede390ea39da1d462b6b0c1b000f420d0a83f898bbbe6ef"
+SRC_URI[security-framework-sys-2.15.0.sha256sum] = "cc1f0cbffaac4852523ce30d8bd3c5cdc873501d96ff467ca09b6767bb8cd5c0"
 SRC_URI[self-replace-1.5.0.sha256sum] = "03ec815b5eab420ab893f63393878d89c90fdd94c0bcc44c07abb8ad95552fb7"
 SRC_URI[semver-1.0.26.sha256sum] = "56e6fa9c48d24d85fb3de5ad847117517440f6beceb7798af16b4a87d616b8d0"
 SRC_URI[serde-1.0.228.sha256sum] = "9a8e94ea7f378bd32cbbd37198a4a91436180c5bb472411e48b5ec2e2124ae9e"
@@ -1101,7 +1092,7 @@ SRC_URI[serde-untagged-0.1.9.sha256sum] = "f9faf48a4a2d2693be24c6289dbe26552776e
 SRC_URI[serde_core-1.0.228.sha256sum] = "41d385c7d4ca58e59fc732af25c3983b67ac852c1a25000afe1175de458b67ad"
 SRC_URI[serde_derive-1.0.228.sha256sum] = "d540f220d3187173da220f885ab66608367b6574e925011a9353e4badda91d79"
 SRC_URI[serde_derive_internals-0.29.1.sha256sum] = "18d26a20a969b9e3fdf2fc2d9f21eda6c40e2de84c9408bb5d3b05d499aae711"
-SRC_URI[serde_json-1.0.147.sha256sum] = "6af14725505314343e673e9ecb7cd7e8a36aa9791eb936235a3567cc31447ae4"
+SRC_URI[serde_json-1.0.149.sha256sum] = "83fc039473c5595ace860d8c4fafa220ff474b3fc6bfdb4293327f1a37e94d86"
 SRC_URI[serde_repr-0.1.20.sha256sum] = "175ee3e80ae9982737ca543e96133087cbd9a485eecc3bc4de9c1a37b47ea59c"
 SRC_URI[serde_spanned-1.0.4.sha256sum] = "f8bbf91e5a4d6315eee45e704372590b30e260ee83af6639d64557f51b067776"
 SRC_URI[serde_urlencoded-0.7.1.sha256sum] = "d3491c14715ca2294c4d6a88f15e84739788c1d030eed8c110436aafdaa2f3fd"
@@ -1119,8 +1110,9 @@ SRC_URI[simdutf8-0.1.5.sha256sum] = "e3a9fe34e3e7a50316060351f37187a3f546bce9549
 SRC_URI[similar-2.7.0.sha256sum] = "bbbb5d9659141646ae647b42fe094daf6c6192d1620870b449d9557f748b2daa"
 SRC_URI[simple_asn1-0.6.3.sha256sum] = "297f631f50729c8c99b84667867963997ec0b50f32b2a7dbcab828ef0541e8bb"
 SRC_URI[simplecss-0.2.2.sha256sum] = "7a9c6883ca9c3c7c90e888de77b7a5c849c779d25d74a1269b0218b14e8b136c"
-SRC_URI[siphasher-0.3.11.sha256sum] = "38b58827f4464d87d377d175e90bf58eb00fd8716ff0a62f80356b5e61555d0d"
+SRC_URI[siphasher-1.0.1.sha256sum] = "56199f7ddabf13fe5074ce809e7d3f42b42ae711800501b5b16ea82ad029c39d"
 SRC_URI[slab-0.4.11.sha256sum] = "7a2ae44ef20feb57a68b23d846850f861394c2e02dc425a50098ae8c90267589"
+SRC_URI[slotmap-1.1.1.sha256sum] = "bdd58c3c93c3d278ca835519292445cb4b0d4dc59ccfdf7ceadaab3f8aeb4038"
 SRC_URI[smallvec-1.15.1.sha256sum] = "67b1b7a3b5fe4f1376887184045fcf45c69e92af734b7aaddc05fb777b6fbd03"
 SRC_URI[smawk-0.3.2.sha256sum] = "b7c388c1b5e93756d0c740965c41e8822f866621d41acbdf6336a6a168f8840c"
 SRC_URI[socket2-0.5.10.sha256sum] = "e22376abed350d73dd1cd119b57ffccad95b4e585a7cda43e286245ce23c0678"
@@ -1141,10 +1133,8 @@ SRC_URI[supports-color-3.0.2.sha256sum] = "c64fc7232dd8d2e4ac5ce4ef302b1d81e0b80
 SRC_URI[supports-hyperlinks-3.1.0.sha256sum] = "804f44ed3c63152de6a9f90acbea1a110441de43006ea51bcce8f436196a288b"
 SRC_URI[supports-unicode-3.0.0.sha256sum] = "b7401a30af6cb5818bb64852270bb722533397edcfc7344954a38f420819ece2"
 SRC_URI[svg-0.18.0.sha256sum] = "94afda9cd163c04f6bee8b4bf2501c91548deae308373c436f36aeff3cf3c4a3"
-SRC_URI[svgfilters-0.4.0.sha256sum] = "639abcebc15fdc2df179f37d6f5463d660c1c79cd552c12343a4600827a04bce"
-SRC_URI[svgtypes-0.9.0.sha256sum] = "c9ee29c1407a5b18ccfe5f6ac82ac11bab3b14407e09c209a6c1a32098b19734"
-SRC_URI[svgtypes-0.10.0.sha256sum] = "98ffacedcdcf1da6579c907279b4f3c5492fbce99fbbf227f5ed270a589c2765"
-SRC_URI[syn-2.0.111.sha256sum] = "390cc9a294ab71bdb1aa2e99d13be9c753cd2d7bd6560c77118597410c4d2e87"
+SRC_URI[svgtypes-0.16.1.sha256sum] = "695b5790b3131dafa99b3bbfd25a216edb3d216dad9ca208d4657bfb8f2abc3d"
+SRC_URI[syn-2.0.114.sha256sum] = "d4d107df263a3013ef9b1879b0df87d706ff80f65a86ea879bd9c31f9b307c2a"
 SRC_URI[sync_wrapper-1.0.2.sha256sum] = "0bf256ce5efdfa370213c1dabab5935a12e49f2c58d15e9eac2870d3b4f27263"
 SRC_URI[synstructure-0.13.2.sha256sum] = "728a70f3dbaf5bab7f0c4b1ac8d7ae5ea60a4b5549c8a5914361c99147a709d2"
 SRC_URI[sys-info-0.9.1.sha256sum] = "0b3a0d0aba8bf96a0e1ddfdc352fc53b3df7f39318c71854910c3c4b024ae52c"
@@ -1152,7 +1142,7 @@ SRC_URI[system-configuration-0.6.1.sha256sum] = "3c879d448e9d986b661742763247d36
 SRC_URI[system-configuration-sys-0.6.0.sha256sum] = "8e1d1b10ced5ca923a1fcb8d03e96b8d3268065d724548c0211415ff6ac6bac4"
 SRC_URI[tagu-0.1.6.sha256sum] = "eddb6b06d20fba9ed21fca3d696ee1b6e870bca0bcf9fa2971f6ae2436de576a"
 SRC_URI[tar-0.4.44.sha256sum] = "1d863878d212c87a19c1a610eb53bb01fe12951c0501cf5a0d65f724914a667a"
-SRC_URI[target-lexicon-0.13.3.sha256sum] = "df7f62577c25e07834649fc3b39fafdc597c0a3527dc1c60129201ccfcbaa50c"
+SRC_URI[target-lexicon-0.13.4.sha256sum] = "b1dd07eb858a2067e2f3c7155d54e929265c264e6f37efe3ee7a8d1b5a1dd0ba"
 SRC_URI[temp-env-0.3.6.sha256sum] = "96374855068f47402c3121c6eed88d29cb1de8f3ab27090e273e420bdabcf050"
 SRC_URI[tempfile-3.24.0.sha256sum] = "655da9c7eb6305c55742045d5a8d2037996d61d8de95806335c7c86ce0f82e9c"
 SRC_URI[terminal_size-0.4.2.sha256sum] = "45c6481c4829e4cc63825e62c49186a34538b7b2750b73b266581ffb612fb5ed"
@@ -1160,31 +1150,31 @@ SRC_URI[termtree-0.5.1.sha256sum] = "8f50febec83f5ee1df3015341d8bd429f2d1cc62bcb
 SRC_URI[test-case-3.3.1.sha256sum] = "eb2550dd13afcd286853192af8601920d959b14c401fcece38071d53bf0768a8"
 SRC_URI[test-case-core-3.3.1.sha256sum] = "adcb7fd841cd518e279be3d5a3eb0636409487998a4aff22f3de87b81e88384f"
 SRC_URI[test-case-macros-3.3.1.sha256sum] = "5c89e72a01ed4c579669add59014b9a524d609c0c88c6a585ce37485879f6ffb"
-SRC_URI[test-log-0.2.18.sha256sum] = "1e33b98a582ea0be1168eba097538ee8dd4bbe0f2b01b22ac92ea30054e5be7b"
-SRC_URI[test-log-macros-0.2.18.sha256sum] = "451b374529930d7601b1eef8d32bc79ae870b6079b069401709c2a8bf9e75f36"
+SRC_URI[test-log-0.2.19.sha256sum] = "37d53ac171c92a39e4769491c4b4dde7022c60042254b5fc044ae409d34a24d4"
+SRC_URI[test-log-macros-0.2.19.sha256sum] = "be35209fd0781c5401458ab66e4f98accf63553e8fae7425503e92fdd319783b"
 SRC_URI[textwrap-0.16.2.sha256sum] = "c13547615a44dc9c452a8a534638acdf07120d4b6847c8178705da06306a3057"
 SRC_URI[thiserror-1.0.69.sha256sum] = "b6aaf5339b578ea85b50e080feb250a3e8ae8cfcdff9a461c9ec2904bc923f52"
-SRC_URI[thiserror-2.0.17.sha256sum] = "f63587ca0f12b72a0600bcba1d40081f830876000bb46dd2337a3051618f4fc8"
+SRC_URI[thiserror-2.0.18.sha256sum] = "4288b5bcbc7920c07a1149a35cf9590a2aa808e0bc1eafaade0b80947865fbc4"
 SRC_URI[thiserror-impl-1.0.69.sha256sum] = "4fee6c4efc90059e10f81e6d42c60a18f76588c3d74cb83a0b242a2b6c7504c1"
-SRC_URI[thiserror-impl-2.0.17.sha256sum] = "3ff15c8ecd7de3849db632e14d18d2571fa09dfc5ed93479bc4485c7a517c913"
+SRC_URI[thiserror-impl-2.0.18.sha256sum] = "ebc4ee7f67670e9b64d05fa4253e753e016c6c95ff35b89b7941d6b856dec1d5"
 SRC_URI[thread_local-1.1.9.sha256sum] = "f60246a4944f24f6e018aa17cdeffb7818b76356965d03b07d6a9886e8962185"
-SRC_URI[tikv-jemalloc-sys-0.6.0+5.3.0-1-ge13ca993e8ccb9ba9847cc330696e02839f328f7.sha256sum] = "cd3c60906412afa9c2b5b5a48ca6a5abe5736aec9eb48ad05037a677e52e4e2d"
-SRC_URI[tikv-jemallocator-0.6.0.sha256sum] = "4cec5ff18518d81584f477e9bfdf957f5bb0979b0bac3af4ca30b5b3ae2d2865"
+SRC_URI[tikv-jemalloc-sys-0.6.1+5.3.0-1-ge13ca993e8ccb9ba9847cc330696e02839f328f7.sha256sum] = "cd8aa5b2ab86a2cefa406d889139c162cbb230092f7d1d7cbc1716405d852a3b"
+SRC_URI[tikv-jemallocator-0.6.1.sha256sum] = "0359b4327f954e0567e69fb191cf1436617748813819c94b8cd4a431422d053a"
 SRC_URI[time-0.3.44.sha256sum] = "91e7d9e3bb61134e77bde20dd4825b97c010155709965fedf0f49bb138e52a9d"
 SRC_URI[time-core-0.1.6.sha256sum] = "40868e7c1d2f0b8d73e4a8c7f0ff63af4f6d19be117e90bd73eb1d62cf831c6b"
 SRC_URI[time-macros-0.2.24.sha256sum] = "30cfb0125f12d9c277f35663a0a33f8c30190f4e4574868a330595412d34ebf3"
 SRC_URI[tiny-keccak-2.0.2.sha256sum] = "2c9d3793400a45f954c52e73d068316d76b6f4e36977e3fcebb13a2721e80237"
-SRC_URI[tiny-skia-0.8.4.sha256sum] = "df8493a203431061e901613751931f047d1971337153f96d0e5e363d6dbf6a67"
-SRC_URI[tiny-skia-path-0.8.4.sha256sum] = "adbfb5d3f3dd57a0e11d12f4f13d4ebbbc1b5c15b7ab0a156d030b21da5f677c"
+SRC_URI[tiny-skia-0.11.4.sha256sum] = "83d13394d44dae3207b52a326c0c85a8bf87f1541f23b0d143811088497b09ab"
+SRC_URI[tiny-skia-path-0.11.4.sha256sum] = "9c9e7fc0c2e86a30b117d0462aa261b72b7a99b7ebd7deb3a14ceda95c5bdc93"
 SRC_URI[tinystr-0.8.1.sha256sum] = "5d4f6d1145dcb577acf783d4e601bc1d76a13337bb54e6233add580b07344c8b"
 SRC_URI[tinytemplate-1.2.1.sha256sum] = "be4d6b5f19ff7664e8c98d03e2139cb510db9b0a60b55f8e8709b689d939b6bc"
 SRC_URI[tinyvec-1.9.0.sha256sum] = "09b3661f17e86524eccd4371ab0429194e0d7c008abb45f7a7495b1719463c71"
 SRC_URI[tinyvec_macros-0.1.1.sha256sum] = "1f3ccbac311fea05f86f61904b462b55fb3df8837a366dfc601a0161d0532f20"
-SRC_URI[tokio-1.47.1.sha256sum] = "89e49afdadebb872d3145a5638b59eb0691ea23e46ca484037cfab3b76b95038"
-SRC_URI[tokio-macros-2.5.0.sha256sum] = "6e06d43f1345a3bcd39f6a56dbb7dcab2ba47e68e8ac134855e7e2bdbaf8cab8"
-SRC_URI[tokio-rustls-0.26.2.sha256sum] = "8e727b36a1a0e8b74c376ac2211e40c2c8af09fb4013c60d910495810f008e9b"
-SRC_URI[tokio-stream-0.1.17.sha256sum] = "eca58d7bba4a75707817a2c44174253f9236b2d5fbd055602e9d5c07c139a047"
-SRC_URI[tokio-util-0.7.17.sha256sum] = "2efa149fe76073d6e8fd97ef4f4eca7b67f599660115591483572e406e165594"
+SRC_URI[tokio-1.49.0.sha256sum] = "72a2903cd7736441aac9df9d7688bd0ce48edccaadf181c3b90be801e81d3d86"
+SRC_URI[tokio-macros-2.6.0.sha256sum] = "af407857209536a95c8e56f8231ef2c2e2aff839b22e07a1ffcbc617e9db9fa5"
+SRC_URI[tokio-rustls-0.26.4.sha256sum] = "1729aa945f29d91ba541258c8df89027d5792d85a8841fb65e8bf0f4ede4ef61"
+SRC_URI[tokio-stream-0.1.18.sha256sum] = "32da49809aab5c3bc678af03902d4ccddea2a87d028d86392a4b1560c6906c70"
+SRC_URI[tokio-util-0.7.18.sha256sum] = "9ae9cec805b01e8fc3fd2fe289f89149a9b66dd16786abd8b19cfa7b48cb0098"
 SRC_URI[toml-0.9.10+spec-1.1.0.sha256sum] = "0825052159284a1a8b4d6c0c86cbc801f2da5afd2b225fa548c72f2e74002f48"
 SRC_URI[toml_datetime-0.6.11.sha256sum] = "22cddaf88f4fbc13c51aebbf5f8eceb5c7c5a9da2ac40a13519eb5b0a0e8f11c"
 SRC_URI[toml_datetime-0.7.5+spec-1.1.0.sha256sum] = "92e1cfed4a3038bc5a127e35a2d360f145e1f4b971b551a2ba5fd7aedf7e1347"
@@ -1196,30 +1186,30 @@ SRC_URI[tower-0.5.2.sha256sum] = "d039ad9159c98b70ecfd540b2573b97f7f52c3e8d9f8ad
 SRC_URI[tower-http-0.6.6.sha256sum] = "adc82fd73de2a9722ac5da747f12383d2bfdb93591ee6c58486e0097890f05f2"
 SRC_URI[tower-layer-0.3.3.sha256sum] = "121c2a6cda46980bb0fcd1647ffaf6cd3fc79a013de288782836f6df9c48780e"
 SRC_URI[tower-service-0.3.3.sha256sum] = "8df9b6e13f2d32c91b9bd719c00d1958837bc7dec474d94952798cc8e69eeec3"
-SRC_URI[tracing-0.1.41.sha256sum] = "784e0ac535deb450455cbfa28a6f0df145ea1bb7ae51b821cf5e7927fdcfbdd0"
-SRC_URI[tracing-attributes-0.1.30.sha256sum] = "81383ab64e72a7a8b8e13130c49e3dab29def6d0c7d76a03087b3cf71c5c6903"
-SRC_URI[tracing-core-0.1.34.sha256sum] = "b9d12581f227e93f094d3af2ae690a574abb8a2b9b7a96e7cfe9647b2b617678"
+SRC_URI[tracing-0.1.44.sha256sum] = "63e71662fa4b2a2c3a26f570f037eb95bb1f85397f3cd8076caed2f026a6d100"
+SRC_URI[tracing-attributes-0.1.31.sha256sum] = "7490cfa5ec963746568740651ac6781f701c9c5ea257c58e057f3ba8cf69e8da"
+SRC_URI[tracing-core-0.1.36.sha256sum] = "db97caf9d906fbde555dd62fa95ddba9eecfd14cb388e4f491a66d74cd5fb79a"
 SRC_URI[tracing-durations-export-0.3.1.sha256sum] = "32e0c2cfee378f62291f2703bbb949b99213306c2729fe977799653c3c3404b5"
 SRC_URI[tracing-log-0.2.0.sha256sum] = "ee855f1f400bd0e5c02d150ae5de3840039a3f54b025156404e34c23c03f47c3"
 SRC_URI[tracing-serde-0.2.0.sha256sum] = "704b1aeb7be0d0a84fc9828cae51dab5970fee5088f83d1dd7ee6f6246fc6ff1"
-SRC_URI[tracing-subscriber-0.3.20.sha256sum] = "2054a14f5307d601f88daf0553e1cbf472acc4f2c51afab632431cdcd72124d5"
+SRC_URI[tracing-subscriber-0.3.22.sha256sum] = "2f30143827ddab0d256fd843b7a66d164e9f271cfa0dde49142c5ca0ca291f1e"
 SRC_URI[tracing-test-0.2.5.sha256sum] = "557b891436fe0d5e0e363427fc7f217abf9ccd510d5136549847bdcbcd011d68"
 SRC_URI[tracing-test-macro-0.2.5.sha256sum] = "04659ddb06c87d233c566112c1c9c5b9e98256d9af50ec3bc9c8327f873a7568"
 SRC_URI[tracing-tree-0.4.1.sha256sum] = "ac87aa03b6a4d5a7e4810d1a80c19601dbe0f8a837e9177f23af721c7ba7beec"
 SRC_URI[try-lock-0.2.5.sha256sum] = "e421abadd41a4225275504ea4d6566923418b7f05506fbc9c0fe86ba7396114b"
-SRC_URI[ttf-parser-0.18.1.sha256sum] = "0609f771ad9c6155384897e1df4d948e692667cc0588548b68eb44d052b27633"
+SRC_URI[ttf-parser-0.25.1.sha256sum] = "d2df906b07856748fa3f6e0ad0cbaa047052d4a7dd609e231c4f72cee8c36f31"
 SRC_URI[typeid-1.0.3.sha256sum] = "bc7d623258602320d5c55d1bc22793b57daff0ec7efc270ea7d55ce1d5f5471c"
 SRC_URI[typenum-1.18.0.sha256sum] = "1dccffe3ce07af9386bfd29e80c0ab1a8205a2fc34e4bcd40364df902cfa8f3f"
 SRC_URI[ucd-trie-0.1.7.sha256sum] = "2896d95c02a80c6d6a5d6e953d479f5ddf2dfdb6a244441010e373ac0fb88971"
 SRC_URI[uds_windows-1.1.0.sha256sum] = "89daebc3e6fd160ac4aa9fc8b3bf71e1f74fbf92367ae71fb83a037e8bf164b9"
 SRC_URI[unicase-2.8.1.sha256sum] = "75b844d17643ee918803943289730bec8aac480150456169e647ed0b576ba539"
 SRC_URI[unicode-bidi-0.3.18.sha256sum] = "5c1cb5db39152898a79168971543b1cb5020dff7fe43c8dc468b0885f5e29df5"
-SRC_URI[unicode-bidi-mirroring-0.1.0.sha256sum] = "56d12260fb92d52f9008be7e4bca09f584780eb2266dc8fecc6a192bec561694"
-SRC_URI[unicode-ccc-0.1.2.sha256sum] = "cc2520efa644f8268dce4dcd3050eaa7fc044fca03961e9998ac7e2e92b77cf1"
-SRC_URI[unicode-general-category-0.6.0.sha256sum] = "2281c8c1d221438e373249e065ca4989c4c36952c211ff21a0ee91c44a3869e7"
+SRC_URI[unicode-bidi-mirroring-0.4.0.sha256sum] = "5dfa6e8c60bb66d49db113e0125ee8711b7647b5579dc7f5f19c42357ed039fe"
+SRC_URI[unicode-ccc-0.4.0.sha256sum] = "ce61d488bcdc9bc8b5d1772c404828b17fc481c0a582b5581e95fb233aef503e"
 SRC_URI[unicode-id-0.3.5.sha256sum] = "10103c57044730945224467c09f71a4db0071c123a0648cc3e818913bde6b561"
 SRC_URI[unicode-ident-1.0.18.sha256sum] = "5a5f39404a5da50712a4c1eecf25e90dd62b613502b7e925fd4e4d19b5c96512"
 SRC_URI[unicode-linebreak-0.1.5.sha256sum] = "3b09c83c3c29d37506a3e260c08c03743a6bb66a9cd432c6934ab501a190571f"
+SRC_URI[unicode-properties-0.1.4.sha256sum] = "7df058c713841ad818f1dc5d3fd88063241cc61f49f5fbea4b951e8cf5a8d71d"
 SRC_URI[unicode-script-0.5.7.sha256sum] = "9fb421b350c9aff471779e262955939f565ec18b86c15364e6bdf0d662ca7c1f"
 SRC_URI[unicode-vo-0.1.0.sha256sum] = "b1d386ff53b415b7fe27b50bb44679e2cc4660272694b7b6f3326d8480823a94"
 SRC_URI[unicode-width-0.1.14.sha256sum] = "7dd6e30e90baa6f72411720665d41d89b9a3d039dc45b8faea1ddd07f617f6af"
@@ -1228,9 +1218,8 @@ SRC_URI[unit-prefix-0.5.1.sha256sum] = "323402cff2dd658f39ca17c789b502021b3f1870
 SRC_URI[unsafe-libyaml-0.2.11.sha256sum] = "673aac59facbab8a9007c7f6108d11f63b603f7cabff99fabf650fea5c32b861"
 SRC_URI[unscanny-0.1.0.sha256sum] = "e9df2af067a7953e9c3831320f35c1cc0600c30d44d9f7a12b01db1cd88d6b47"
 SRC_URI[untrusted-0.9.0.sha256sum] = "8ecb6da28b8a351d773b68d5825ac39017e680750f980f3a1a85cd8dd28a47c1"
-SRC_URI[url-2.5.7.sha256sum] = "08bc136a29a3d1758e07a9cca267be308aeebf5cfd5a10f3f67ab2097683ef5b"
-SRC_URI[usvg-0.29.0.sha256sum] = "63b6bb4e62619d9f68aa2d8a823fea2bff302340a1f2d45c264d5b0be170832e"
-SRC_URI[usvg-text-layout-0.29.0.sha256sum] = "195386e01bc35f860db024de275a76e7a31afdf975d18beb6d0e44764118b4db"
+SRC_URI[url-2.5.8.sha256sum] = "ff67a8a4397373c3ef660812acab3268222035010ab8680ec4215f38ba3d0eed"
+SRC_URI[usvg-0.46.0.sha256sum] = "e419dff010bb12512b0ae9e3d2f318dfbdf0167fde7eb05465134d4e8756076f"
 SRC_URI[utf8-width-0.1.7.sha256sum] = "86bd8d4e895da8537e5315b8254664e6b769c4ff3db18321b297a1e7004392e3"
 SRC_URI[utf8_iter-1.0.4.sha256sum] = "b6c140620e7ffbb22c2dee59cafe6084a59b5ffc27a8859a5f0d494b5d52b6be"
 SRC_URI[utf8parse-0.2.2.sha256sum] = "06abde3611657adf66d383f00b093d7faecc7fa57071cce2578660c9f1010821"
@@ -1242,7 +1231,7 @@ SRC_URI[walkdir-2.5.0.sha256sum] = "29790946404f91d9c5d06f9874efddea1dc06c5efe94
 SRC_URI[want-0.3.1.sha256sum] = "bfa7760aed19e106de2c7c0b581b509f2f25d3dacaf737cb82ac61bc6d760b0e"
 SRC_URI[wasi-0.11.1+wasi-snapshot-preview1.sha256sum] = "ccf3ec651a847eb01de73ccad15eb7d99f80485de043efb2f370cd654f4ea44b"
 SRC_URI[wasi-0.14.2+wasi-0.2.4.sha256sum] = "9683f9a5a998d873c0d21fcbe3c083009670149a8fab228644b8bd36b2c48cb3"
-SRC_URI[wasite-0.1.0.sha256sum] = "b8dad83b4f25e74f184f64c43b150b91efe7647395b42289f38e50566d82855b"
+SRC_URI[wasite-1.0.2.sha256sum] = "66fe902b4a6b8028a753d5424909b764ccf79b7a209eac9bf97e59cda9f71a42"
 SRC_URI[wasm-bindgen-0.2.100.sha256sum] = "1edc8929d7499fc4e8f0be2262a241556cfc54a0bea223790e71446f2aab1ef5"
 SRC_URI[wasm-bindgen-backend-0.2.100.sha256sum] = "2f0a0651a5c2bc21487bde11ee802ccaf4c51935d0d3d42a6101f98161700bc6"
 SRC_URI[wasm-bindgen-futures-0.4.50.sha256sum] = "555d470ec0bc3bb57890405e5d4322cc9ea83cebb085523ced7be4144dac1e61"
@@ -1256,19 +1245,16 @@ SRC_URI[web-time-1.1.0.sha256sum] = "5a6580f308b1fad9207618087a65c04e7a10bc77e02
 SRC_URI[webpki-roots-1.0.2.sha256sum] = "7e8983c3ab33d6fb807cfcdad2491c4ea8cbc8ed839181c7dfd9c67c83e261b2"
 SRC_URI[weezl-0.1.10.sha256sum] = "a751b3277700db47d3e574514de2eced5e54dc8a5436a3bf7a0b248b2cee16f3"
 SRC_URI[which-8.0.0.sha256sum] = "d3fabb953106c3c8eea8306e4393700d7657561cb43122571b172bbfb7c7ba1d"
-SRC_URI[whoami-1.6.1.sha256sum] = "5d4a4db5077702ca3015d3d02d74974948aba2ad9e12ab7df718ee64ccd7e97d"
+SRC_URI[whoami-2.0.2.sha256sum] = "ace4d5c7b5ab3d99629156d4e0997edbe98a4beb6d5ba99e2cae830207a81983"
 SRC_URI[widestring-1.2.0.sha256sum] = "dd7cf3379ca1aac9eea11fba24fd7e315d621f8dfe35c8d7d2be8b793726e07d"
 SRC_URI[winapi-0.3.9.sha256sum] = "5c839a674fcd7a98952e593242ea400abe93992746761e38641405d28b00f419"
 SRC_URI[winapi-i686-pc-windows-gnu-0.4.0.sha256sum] = "ac3b87c63620426dd9b991e5ce0329eff545bccbbb34f3be09ff6fb6ab51b7b6"
 SRC_URI[winapi-util-0.1.9.sha256sum] = "cf221c93e13a30d793f7645a0e7762c55d169dbb0a49671918a2319d289b10bb"
 SRC_URI[winapi-x86_64-pc-windows-gnu-0.4.0.sha256sum] = "712e227841d057c1ee1cd2fb22fa7e5a5461ae8e48fa2ca79ec42cfc1931183f"
-SRC_URI[windows-0.59.0.sha256sum] = "7f919aee0a93304be7f62e8e5027811bbba96bcb1de84d6618be56e43f8a32a1"
 SRC_URI[windows-0.61.3.sha256sum] = "9babd3a767a4c1aef6900409f85f5d53ce2544ccdfaa86dad48c91782c6d6893"
 SRC_URI[windows-collections-0.2.0.sha256sum] = "3beeceb5e5cfd9eb1d76b381630e82c4241ccd0d27f1a39ed41b2760b255c5e8"
-SRC_URI[windows-core-0.59.0.sha256sum] = "810ce18ed2112484b0d4e15d022e5f598113e220c53e373fb31e67e21670c1ce"
 SRC_URI[windows-core-0.61.2.sha256sum] = "c0fdd3ddb90610c7638aa2b3a3ab2904fb9e5cdbecc643ddb3647212781c4ae3"
 SRC_URI[windows-future-0.2.1.sha256sum] = "fc6a41e98427b19fe4b73c550f060b59fa592d7d686537eebf9385621bfbad8e"
-SRC_URI[windows-implement-0.59.0.sha256sum] = "83577b051e2f49a058c308f17f273b570a6a758386fc291b5f6a934dd84e48c1"
 SRC_URI[windows-implement-0.60.0.sha256sum] = "a47fddd13af08290e67f4acabf4b459f647552718f683a7b415d290ac744a836"
 SRC_URI[windows-interface-0.59.1.sha256sum] = "bd9211b69f8dcdfa817bfd14bf1c97c9188afa36f4750130fcdf3f400eca9fa8"
 SRC_URI[windows-link-0.1.3.sha256sum] = "5e6ad25900d524eaabdbbb96d20b4311e1e7ae1699af4fb28c17ae66c80d798a"
@@ -1276,40 +1262,30 @@ SRC_URI[windows-link-0.2.0.sha256sum] = "45e46c0661abb7180e7b9c281db115305d49ca1
 SRC_URI[windows-numerics-0.2.0.sha256sum] = "9150af68066c4c5c07ddc0ce30421554771e528bde427614c61038bc2c92c2b1"
 SRC_URI[windows-registry-0.5.3.sha256sum] = "5b8a9ed28765efc97bbc954883f4e6796c33a06546ebafacbabee9696967499e"
 SRC_URI[windows-result-0.3.4.sha256sum] = "56f42bd332cc6c8eac5af113fc0c1fd6a8fd2aa08a0119358686e5160d0586c6"
-SRC_URI[windows-strings-0.3.1.sha256sum] = "87fa48cc5d406560701792be122a10132491cff9d0aeb23583cc2dcafc847319"
 SRC_URI[windows-strings-0.4.2.sha256sum] = "56e6c93f3a0c3b36176cb1327a4958a0353d5d166c2a35cb268ace15e91d3b57"
 SRC_URI[windows-sys-0.52.0.sha256sum] = "282be5f36a8ce781fad8c8ae18fa3f9beff57ec1b52cb3de0789201425d9a33d"
 SRC_URI[windows-sys-0.59.0.sha256sum] = "1e38bc4d79ed67fd075bcc251a1c39b32a1776bbe92e5bef1f0bf1f8c531853b"
-SRC_URI[windows-sys-0.60.2.sha256sum] = "f2f500e4d28234f72040990ec9d39e3a6b950f9f22d3dba18416c35882612bcb"
 SRC_URI[windows-sys-0.61.0.sha256sum] = "e201184e40b2ede64bc2ea34968b28e33622acdbbf37104f0e4a33f7abe657aa"
 SRC_URI[windows-targets-0.52.6.sha256sum] = "9b724f72796e036ab90c1021d4780d4d3d648aca59e491e6b98e725b84e99973"
-SRC_URI[windows-targets-0.53.2.sha256sum] = "c66f69fcc9ce11da9966ddb31a40968cad001c5bedeb5c2b82ede4253ab48aef"
 SRC_URI[windows-threading-0.1.0.sha256sum] = "b66463ad2e0ea3bbf808b7f1d371311c80e115c0b71d60efc142cafbcfb057a6"
 SRC_URI[windows_aarch64_gnullvm-0.52.6.sha256sum] = "32a4622180e7a0ec044bb555404c800bc9fd9ec262ec147edd5989ccd0c02cd3"
-SRC_URI[windows_aarch64_gnullvm-0.53.0.sha256sum] = "86b8d5f90ddd19cb4a147a5fa63ca848db3df085e25fee3cc10b39b6eebae764"
 SRC_URI[windows_aarch64_msvc-0.52.6.sha256sum] = "09ec2a7bb152e2252b53fa7803150007879548bc709c039df7627cabbd05d469"
-SRC_URI[windows_aarch64_msvc-0.53.0.sha256sum] = "c7651a1f62a11b8cbd5e0d42526e55f2c99886c77e007179efff86c2b137e66c"
 SRC_URI[windows_i686_gnu-0.52.6.sha256sum] = "8e9b5ad5ab802e97eb8e295ac6720e509ee4c243f69d781394014ebfe8bbfa0b"
-SRC_URI[windows_i686_gnu-0.53.0.sha256sum] = "c1dc67659d35f387f5f6c479dc4e28f1d4bb90ddd1a5d3da2e5d97b42d6272c3"
 SRC_URI[windows_i686_gnullvm-0.52.6.sha256sum] = "0eee52d38c090b3caa76c563b86c3a4bd71ef1a819287c19d586d7334ae8ed66"
-SRC_URI[windows_i686_gnullvm-0.53.0.sha256sum] = "9ce6ccbdedbf6d6354471319e781c0dfef054c81fbc7cf83f338a4296c0cae11"
 SRC_URI[windows_i686_msvc-0.52.6.sha256sum] = "240948bc05c5e7c6dabba28bf89d89ffce3e303022809e73deaefe4f6ec56c66"
-SRC_URI[windows_i686_msvc-0.53.0.sha256sum] = "581fee95406bb13382d2f65cd4a908ca7b1e4c2f1917f143ba16efe98a589b5d"
 SRC_URI[windows_x86_64_gnu-0.52.6.sha256sum] = "147a5c80aabfbf0c7d901cb5895d1de30ef2907eb21fbbab29ca94c5b08b1a78"
-SRC_URI[windows_x86_64_gnu-0.53.0.sha256sum] = "2e55b5ac9ea33f2fc1716d1742db15574fd6fc8dadc51caab1c16a3d3b4190ba"
 SRC_URI[windows_x86_64_gnullvm-0.52.6.sha256sum] = "24d5b23dc417412679681396f2b49f3de8c1473deb516bd34410872eff51ed0d"
-SRC_URI[windows_x86_64_gnullvm-0.53.0.sha256sum] = "0a6e035dd0599267ce1ee132e51c27dd29437f63325753051e71dd9e42406c57"
 SRC_URI[windows_x86_64_msvc-0.52.6.sha256sum] = "589f6da84c646204747d1270a2a5661ea66ed1cced2631d546fdfb155959f9ec"
-SRC_URI[windows_x86_64_msvc-0.53.0.sha256sum] = "271414315aff87387382ec3d271b52d7ae78726f5d44ac98b4f4030c91880486"
 SRC_URI[winnow-0.7.13.sha256sum] = "21a0236b59786fed61e2a80582dd500fe61f18b5dca67a4a067d0bc9039339cf"
 SRC_URI[winsafe-0.0.19.sha256sum] = "d135d17ab770252ad95e9a872d365cf3090e3be864a34ab46f48555993efc904"
 SRC_URI[wiremock-0.6.5.sha256sum] = "08db1edfb05d9b3c1542e521aea074442088292f00b5f28e435c714a98f85031"
 SRC_URI[wit-bindgen-rt-0.39.0.sha256sum] = "6f42320e61fe2cfd34354ecb597f86f413484a798ba44a8ca1165c58d42da6c1"
 SRC_URI[wmi-0.16.0.sha256sum] = "5d9189bc72f0e4d814d812216ec06636ce3ea5597ff5f1ff9f9f0e5ec781c027"
 SRC_URI[writeable-0.6.1.sha256sum] = "ea2f10b9bb0928dfb1b42b65e1f9e36f7f54dbdf08457afefb38afcdec4fa2bb"
+SRC_URI[x509-parser-0.18.0.sha256sum] = "eb3e137310115a65136898d2079f003ce33331a6c4b0d51f1531d1be082b6425"
 SRC_URI[xattr-1.5.1.sha256sum] = "af3a19837351dc82ba89f8a125e22a3c475f05aba604acc023d62b2739ae2909"
 SRC_URI[xml-rs-0.8.27.sha256sum] = "6fd8403733700263c6eb89f192880191f1b83e332f7a20371ddcf421c4a337c7"
-SRC_URI[xmlparser-0.13.6.sha256sum] = "66fee0b777b0f5ac1c69bb06d361268faafa61cd4682ae064a171c16c433e9e4"
+SRC_URI[xmlwriter-0.1.0.sha256sum] = "ec7a2a501ed189703dba8b08142f057e887dfc4b2cc4db2d343ac6376ba3e0b9"
 SRC_URI[xz2-0.1.7.sha256sum] = "388c44dc09d76f1536602ead6d325eb532f5c122f17782bd57fb47baeeb767e2"
 SRC_URI[yansi-1.0.1.sha256sum] = "cfe53a6657fd280eaa890a3bc59152892ffa3e30101319d168b781ed6529b049"
 SRC_URI[yasna-0.5.2.sha256sum] = "e17bb3549cc1321ae1296b9cdc2698e2b6cb1992adfa19a8c72e5b7a738f44cd"
@@ -1328,11 +1304,13 @@ SRC_URI[zerovec-0.11.2.sha256sum] = "4a05eb080e015ba39cc9e23bbe5e7fb04d5fb040350
 SRC_URI[zerovec-derive-0.11.1.sha256sum] = "5b96237efa0c878c64bd89c436f661be4e46b2f3eff1ebb976f7ef2321d2f58f"
 SRC_URI[zip-2.4.2.sha256sum] = "fabe6324e908f85a1c52063ce7aa26b68dcb7eb6dbc83a2d148403c9bc3eba50"
 SRC_URI[zlib-rs-0.5.1.sha256sum] = "626bd9fa9734751fc50d6060752170984d7053f5a39061f524cda68023d4db8a"
-SRC_URI[zmij-0.1.11.sha256sum] = "3273ed2c1f89f63ec74ab75efe20159d0058e30831e6e9f1502cd5bf2fd8b178"
+SRC_URI[zmij-1.0.15.sha256sum] = "94f63c051f4fe3c1509da62131a678643c5b6fbdc9273b2b79d4378ebda003d2"
 SRC_URI[zopfli-0.8.2.sha256sum] = "edfc5ee405f504cd4984ecc6f14d02d55cfda60fa4b689434ef4102aae150cd7"
 SRC_URI[zstd-0.13.3.sha256sum] = "e91ee311a569c327171651566e07972200e76fcfe2242a4fa446149a3881c08a"
 SRC_URI[zstd-safe-7.2.4.sha256sum] = "8f49c4d5f0abb602a93fb8736af2a4f4dd9512e36f7f570d66e65ff867ed3b9d"
 SRC_URI[zstd-sys-2.0.15+zstd.1.5.7.sha256sum] = "eb81183ddd97d0c74cedf1d50d85c8d08c1b8b68ee863bdee9e706eedba1a237"
+SRC_URI[zune-core-0.5.1.sha256sum] = "cb8a0807f7c01457d0379ba880ba6322660448ddebc890ce29bb64da71fb40f9"
+SRC_URI[zune-jpeg-0.5.10.sha256sum] = "ea2db9186c0a6ad1aa7012046f3fadc8db9001691b367c510f5867f17f975752"
 SRC_URI[zvariant-5.6.0.sha256sum] = "d91b3680bb339216abd84714172b5138a4edac677e641ef17e1d8cb1b3ca6e6f"
 SRC_URI[zvariant_derive-5.6.0.sha256sum] = "3a8c68501be459a8dbfffbe5d792acdd23b4959940fc87785fb013b32edbc208"
 SRC_URI[zvariant_utils-3.2.0.sha256sum] = "e16edfee43e5d7b553b77872d99bc36afdda75c223ca7ad5e3fbecd82ca5fc34"
diff --git a/meta/recipes-devtools/python/python3-uv-build_0.9.26.bb b/meta/recipes-devtools/python/python3-uv-build_0.9.28.bb
similarity index 92%
rename from meta/recipes-devtools/python/python3-uv-build_0.9.26.bb
rename to meta/recipes-devtools/python/python3-uv-build_0.9.28.bb
index 4e1b52a660..b7bf7f775a 100644
--- a/meta/recipes-devtools/python/python3-uv-build_0.9.26.bb
+++ b/meta/recipes-devtools/python/python3-uv-build_0.9.28.bb
@@ -11,7 +11,7 @@ LIC_FILES_CHKSUM = "file://LICENSE-APACHE;md5=86d3f3a95c324c9479bd8986968f4327 \
                     file://crates/uv-pep508/License-Apache;md5=e23fadd6ceef8c618fc1c65191d846fa \
                     file://crates/uv-pep508/License-BSD;md5=ef7a6027dc4c2389b9afad7e690274c7"
 
-SRC_URI[sha256sum] = "ce87f3b6932229b3a5173891654d2b564881155da5114fa5590cf6eddf4d56b2"
+SRC_URI[sha256sum] = "ad9165d94b51a43671d382c7567dc972f831090457ca94ddbd1e9969487a3729"
 
 require ${BPN}-crates.inc
 
-- 
2.43.0


