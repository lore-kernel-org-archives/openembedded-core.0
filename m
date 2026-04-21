Return-Path: <wangmy@fujitsu.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 3811FF89235
	for <webhook@archiver.kernel.org>; Tue, 21 Apr 2026 09:57:04 +0000 (UTC)
Received: from esa9.hc1455-7.c3s2.iphmx.com (esa9.hc1455-7.c3s2.iphmx.com [139.138.36.223])
 by mx.groups.io with SMTP id smtpd.msgproc01-g2.20405.1776765418440825773
 for <openembedded-core@lists.openembedded.org>;
 Tue, 21 Apr 2026 02:56:59 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@fujitsu.com header.s=fj2 header.b=t1a9a3sE;
 spf=pass (domain: fujitsu.com, ip: 139.138.36.223, mailfrom: wangmy@fujitsu.com)
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
  d=fujitsu.com; i=@fujitsu.com; q=dns/txt; s=fj2;
  t=1776765418; x=1808301418;
  h=from:to:cc:subject:date:message-id:in-reply-to:
   references:mime-version:content-transfer-encoding;
  bh=4AYx0EYqAlSIWr5AXdn5WAS4AzeS2Gp0BLHhEXP4sfE=;
  b=t1a9a3sEZne6GUw0WL946kIyKd/vWTbAyOCK+gu9Os957Eqg8M4xP13i
   xmLVSs0beHAMZQMNsuPDlMqeoPPO43F5uhw3DkgLDLYEdxlXnQ7ffS19q
   Ugkz1vy+tNnRZgR/TfdmDoxwQzJ34DIUzeMUbcWwGcHLO93R5HUSgnYn8
   Ey6ghgZlF5Dha2CJev94Olhb/Fa1rBKedsOrm6MJB2EYZ3qS0nkA0O9Qc
   8rKtwgfXdA2py4Hs2F60bbxFT1KtT7sKVk5Uv0V21eBeqspYqdr06j+wh
   hkjYZ+nNwD20YX0MK/fW58yTPhAp4QKpOmaDxYM0qHULeu12SIMS/PBdi
   g==;
X-CSE-ConnectionGUID: 7MVyHMufSaKQFOREh5Nbfg==
X-CSE-MsgGUID: EnyduDJSQgSNTjlXGj6b+Q==
X-IronPort-AV: E=McAfee;i="6800,10657,11762"; a="226358614"
X-IronPort-AV: E=Sophos;i="6.23,191,1770562800"; 
   d="scan'208";a="226358614"
Received: from gmgwuk01.global.fujitsu.com ([172.187.114.235])
  by esa9.hc1455-7.c3s2.iphmx.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 21 Apr 2026 18:56:57 +0900
Received: from az2uksmgm4.o.css.fujitsu.com (unknown [10.151.22.201])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by gmgwuk01.global.fujitsu.com (Postfix) with ESMTPS id 0731082073D
	for <openembedded-core@lists.openembedded.org>; Tue, 21 Apr 2026 09:56:57 +0000 (UTC)
Received: from az2uksmom2.o.css.fujitsu.com (az2uksmom2.o.css.fujitsu.com [10.151.22.203])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by az2uksmgm4.o.css.fujitsu.com (Postfix) with ESMTPS id B4D1A140037B
	for <openembedded-core@lists.openembedded.org>; Tue, 21 Apr 2026 09:56:56 +0000 (UTC)
Received: from G08FNSTD200057.g08.fujitsu.local (unknown [10.167.135.104])
	by az2uksmom2.o.css.fujitsu.com (Postfix) with ESMTP id 5532F140027F;
	Tue, 21 Apr 2026 09:56:54 +0000 (UTC)
From: Wang Mingyu < wangmy@fujitsu.com>
To: openembedded-core@lists.openembedded.org
Cc: Wang Mingyu <wangmy@fujitsu.com>
Subject: [OE-core] [PATCH 28/49] python3-maturin: upgrade 1.12.4 -> 1.13.1
Date: Tue, 21 Apr 2026 17:55:38 +0800
Message-ID: <20260421095559.1856-28-wangmy@fujitsu.com>
X-Mailer: git-send-email 2.49.0.windows.1
In-Reply-To: <20260421095559.1856-1-wangmy@fujitsu.com>
References: <20260421095559.1856-1-wangmy@fujitsu.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Tue, 21 Apr 2026 09:57:04 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/235636

From: Wang Mingyu <wangmy@fujitsu.com>

Signed-off-by: Wang Mingyu <wangmy@fujitsu.com>
---
 .../python/python3-maturin-crates.inc         | 108 +++++++++++-------
 ...in_1.12.4.bb => python3-maturin_1.13.1.bb} |   2 +-
 2 files changed, 67 insertions(+), 43 deletions(-)
 rename meta/recipes-devtools/python/{python3-maturin_1.12.4.bb => python3-maturin_1.13.1.bb} (92%)

diff --git a/meta/recipes-devtools/python/python3-maturin-crates.inc b/meta/recipes-devtools/python/python3-maturin-crates.inc
index 0b9ac4dba8..6b637bfd3e 100644
--- a/meta/recipes-devtools/python/python3-maturin-crates.inc
+++ b/meta/recipes-devtools/python/python3-maturin-crates.inc
@@ -13,14 +13,15 @@ SRC_URI += " \
     crate://crates.io/anyhow/1.0.101 \
     crate://crates.io/ar_archive_writer/0.5.1 \
     crate://crates.io/arbitrary/1.4.2 \
+    crate://crates.io/arwen/0.0.5 \
+    crate://crates.io/arwen-codesign/0.0.1-alpha.1 \
     crate://crates.io/autocfg/1.5.0 \
     crate://crates.io/automod/1.0.16 \
-    crate://crates.io/base64/0.21.7 \
     crate://crates.io/base64/0.22.1 \
     crate://crates.io/base64ct/1.8.3 \
-    crate://crates.io/bitflags/1.3.2 \
     crate://crates.io/bitflags/2.10.0 \
     crate://crates.io/block-buffer/0.10.4 \
+    crate://crates.io/borrow-or-share/0.2.4 \
     crate://crates.io/boxcar/0.2.14 \
     crate://crates.io/bstr/1.12.1 \
     crate://crates.io/bumpalo/3.19.1 \
@@ -31,7 +32,7 @@ SRC_URI += " \
     crate://crates.io/cab/0.6.0 \
     crate://crates.io/camino/1.2.2 \
     crate://crates.io/cargo-config2/0.1.40 \
-    crate://crates.io/cargo-cyclonedx/0.5.7 \
+    crate://crates.io/cargo-cyclonedx/0.5.9 \
     crate://crates.io/cargo-lock/10.1.0 \
     crate://crates.io/cargo-options/0.7.6 \
     crate://crates.io/cargo-platform/0.1.9 \
@@ -76,7 +77,7 @@ SRC_URI += " \
     crate://crates.io/crossbeam-epoch/0.9.18 \
     crate://crates.io/crossbeam-utils/0.8.21 \
     crate://crates.io/crypto-common/0.1.7 \
-    crate://crates.io/cyclonedx-bom/0.8.0 \
+    crate://crates.io/cyclonedx-bom/0.8.1 \
     crate://crates.io/cyclonedx-bom-macros/0.1.0 \
     crate://crates.io/data-encoding/2.10.0 \
     crate://crates.io/der/0.7.10 \
@@ -105,9 +106,10 @@ SRC_URI += " \
     crate://crates.io/filetime/0.2.27 \
     crate://crates.io/find-msvc-tools/0.1.9 \
     crate://crates.io/flate2/1.1.9 \
-    crate://crates.io/fluent-uri/0.1.4 \
+    crate://crates.io/fluent-uri/0.4.1 \
     crate://crates.io/fnv/1.0.7 \
     crate://crates.io/foldhash/0.1.5 \
+    crate://crates.io/foldhash/0.2.0 \
     crate://crates.io/foreign-types/0.3.2 \
     crate://crates.io/foreign-types-shared/0.1.1 \
     crate://crates.io/form_urlencoded/1.2.2 \
@@ -140,7 +142,6 @@ SRC_URI += " \
     crate://crates.io/icu_properties/2.1.2 \
     crate://crates.io/icu_properties_data/2.1.2 \
     crate://crates.io/icu_provider/2.1.1 \
-    crate://crates.io/idna/0.4.0 \
     crate://crates.io/idna/1.1.0 \
     crate://crates.io/idna_adapter/1.2.1 \
     crate://crates.io/ignore/0.4.25 \
@@ -159,7 +160,7 @@ SRC_URI += " \
     crate://crates.io/js-sys/0.3.85 \
     crate://crates.io/keyring/2.3.3 \
     crate://crates.io/lazy_static/1.5.0 \
-    crate://crates.io/lddtree/0.4.0 \
+    crate://crates.io/lddtree/0.5.0 \
     crate://crates.io/libbz2-rs-sys/0.2.2 \
     crate://crates.io/libc/0.2.180 \
     crate://crates.io/libmimalloc-sys/0.1.44 \
@@ -170,7 +171,7 @@ SRC_URI += " \
     crate://crates.io/litrs/1.0.0 \
     crate://crates.io/lock_api/0.4.14 \
     crate://crates.io/log/0.4.29 \
-    crate://crates.io/lzma-rust2/0.13.0 \
+    crate://crates.io/lzma-rust2/0.16.2 \
     crate://crates.io/lzma-sys/0.1.20 \
     crate://crates.io/lzxd/0.2.6 \
     crate://crates.io/mailparse/0.16.1 \
@@ -193,6 +194,7 @@ SRC_URI += " \
     crate://crates.io/num-traits/0.2.19 \
     crate://crates.io/number_prefix/0.4.0 \
     crate://crates.io/object/0.37.3 \
+    crate://crates.io/object/0.38.1 \
     crate://crates.io/once_cell/1.21.3 \
     crate://crates.io/once_cell_polyfill/1.70.2 \
     crate://crates.io/openssl/0.10.75 \
@@ -201,7 +203,7 @@ SRC_URI += " \
     crate://crates.io/openssl-probe/0.2.1 \
     crate://crates.io/openssl-sys/0.9.111 \
     crate://crates.io/option-ext/0.2.0 \
-    crate://crates.io/ordered-float/4.6.0 \
+    crate://crates.io/ordered-float/5.1.0 \
     crate://crates.io/os_pipe/1.2.3 \
     crate://crates.io/parking_lot/0.12.5 \
     crate://crates.io/parking_lot_core/0.9.12 \
@@ -230,8 +232,9 @@ SRC_URI += " \
     crate://crates.io/proc-macro2/1.0.106 \
     crate://crates.io/psm/0.1.30 \
     crate://crates.io/purl/0.1.6 \
+    crate://crates.io/pyo3-introspection/0.28.2 \
     crate://crates.io/pyproject-toml/0.13.7 \
-    crate://crates.io/python-pkginfo/0.6.6 \
+    crate://crates.io/python-pkginfo/0.6.8 \
     crate://crates.io/quote/1.0.44 \
     crate://crates.io/quoted_printable/0.5.1 \
     crate://crates.io/r-efi/5.3.0 \
@@ -247,6 +250,7 @@ SRC_URI += " \
     crate://crates.io/redox_users/0.5.2 \
     crate://crates.io/ref-cast/1.0.25 \
     crate://crates.io/ref-cast-impl/1.0.25 \
+    crate://crates.io/reflink-copy/0.1.29 \
     crate://crates.io/regex/1.12.3 \
     crate://crates.io/regex-automata/0.3.9 \
     crate://crates.io/regex-automata/0.4.14 \
@@ -266,8 +270,9 @@ SRC_URI += " \
     crate://crates.io/rustls-pki-types/1.14.0 \
     crate://crates.io/rustls-platform-verifier/0.6.2 \
     crate://crates.io/rustls-platform-verifier-android/0.1.1 \
-    crate://crates.io/rustls-webpki/0.103.9 \
+    crate://crates.io/rustls-webpki/0.103.10 \
     crate://crates.io/rustversion/1.0.22 \
+    crate://crates.io/ruzstd/0.8.2 \
     crate://crates.io/same-file/1.0.6 \
     crate://crates.io/scc/2.4.0 \
     crate://crates.io/schannel/0.1.28 \
@@ -303,16 +308,16 @@ SRC_URI += " \
     crate://crates.io/snapbox/0.6.24 \
     crate://crates.io/snapbox-macros/0.4.0 \
     crate://crates.io/socks/0.3.4 \
-    crate://crates.io/spdx/0.10.9 \
+    crate://crates.io/spdx/0.13.4 \
     crate://crates.io/stable_deref_trait/1.2.1 \
     crate://crates.io/stacker/0.1.23 \
     crate://crates.io/strsim/0.11.1 \
-    crate://crates.io/strum/0.26.3 \
-    crate://crates.io/strum_macros/0.26.4 \
+    crate://crates.io/strum/0.28.0 \
+    crate://crates.io/strum_macros/0.28.0 \
     crate://crates.io/subtle/2.6.1 \
     crate://crates.io/syn/2.0.114 \
     crate://crates.io/synstructure/0.13.2 \
-    crate://crates.io/tar/0.4.44 \
+    crate://crates.io/tar/0.4.45 \
     crate://crates.io/target-lexicon/0.13.4 \
     crate://crates.io/tempfile/3.24.0 \
     crate://crates.io/termcolor/1.4.1 \
@@ -327,8 +332,6 @@ SRC_URI += " \
     crate://crates.io/time-core/0.1.8 \
     crate://crates.io/time-macros/0.2.27 \
     crate://crates.io/tinystr/0.8.2 \
-    crate://crates.io/tinyvec/1.10.0 \
-    crate://crates.io/tinyvec_macros/0.1.1 \
     crate://crates.io/toml/0.8.23 \
     crate://crates.io/toml/0.9.11+spec-1.1.0 \
     crate://crates.io/toml_datetime/0.6.11 \
@@ -347,12 +350,11 @@ SRC_URI += " \
     crate://crates.io/tracing-subscriber/0.3.22 \
     crate://crates.io/trycmd/0.15.11 \
     crate://crates.io/twox-hash/2.1.2 \
+    crate://crates.io/typed-path/0.12.3 \
     crate://crates.io/typenum/1.19.0 \
     crate://crates.io/unicase/2.9.0 \
-    crate://crates.io/unicode-bidi/0.3.18 \
     crate://crates.io/unicode-ident/1.0.22 \
     crate://crates.io/unicode-linebreak/0.1.5 \
-    crate://crates.io/unicode-normalization/0.1.25 \
     crate://crates.io/unicode-segmentation/1.12.0 \
     crate://crates.io/unicode-width/0.2.2 \
     crate://crates.io/unicode-xid/0.2.6 \
@@ -366,7 +368,7 @@ SRC_URI += " \
     crate://crates.io/utf8_iter/1.0.4 \
     crate://crates.io/utf8parse/0.2.2 \
     crate://crates.io/uuid/1.20.0 \
-    crate://crates.io/validator/0.16.1 \
+    crate://crates.io/validator/0.19.0 \
     crate://crates.io/valuable/0.1.1 \
     crate://crates.io/vcpkg/0.2.15 \
     crate://crates.io/version-ranges/0.1.2 \
@@ -389,7 +391,16 @@ SRC_URI += " \
     crate://crates.io/winapi-i686-pc-windows-gnu/0.4.0 \
     crate://crates.io/winapi-util/0.1.11 \
     crate://crates.io/winapi-x86_64-pc-windows-gnu/0.4.0 \
+    crate://crates.io/windows/0.62.2 \
+    crate://crates.io/windows-collections/0.3.2 \
+    crate://crates.io/windows-core/0.62.2 \
+    crate://crates.io/windows-future/0.3.2 \
+    crate://crates.io/windows-implement/0.60.2 \
+    crate://crates.io/windows-interface/0.59.3 \
     crate://crates.io/windows-link/0.2.1 \
+    crate://crates.io/windows-numerics/0.3.1 \
+    crate://crates.io/windows-result/0.4.1 \
+    crate://crates.io/windows-strings/0.5.1 \
     crate://crates.io/windows-sys/0.45.0 \
     crate://crates.io/windows-sys/0.52.0 \
     crate://crates.io/windows-sys/0.59.0 \
@@ -398,6 +409,7 @@ SRC_URI += " \
     crate://crates.io/windows-targets/0.42.2 \
     crate://crates.io/windows-targets/0.52.6 \
     crate://crates.io/windows-targets/0.53.5 \
+    crate://crates.io/windows-threading/0.2.1 \
     crate://crates.io/windows_aarch64_gnullvm/0.42.2 \
     crate://crates.io/windows_aarch64_gnullvm/0.52.6 \
     crate://crates.io/windows_aarch64_gnullvm/0.53.1 \
@@ -441,7 +453,7 @@ SRC_URI += " \
     crate://crates.io/zerovec/0.11.5 \
     crate://crates.io/zerovec-derive/0.11.2 \
     crate://crates.io/zip/4.6.1 \
-    crate://crates.io/zip/6.0.0 \
+    crate://crates.io/zip/8.1.0 \
     crate://crates.io/zlib-rs/0.6.0 \
     crate://crates.io/zmij/1.0.19 \
     crate://crates.io/zopfli/0.8.3 \
@@ -461,14 +473,15 @@ SRC_URI[anstyle-wincon-3.0.11.sha256sum] = "291e6a250ff86cd4a820112fb8898808a366
 SRC_URI[anyhow-1.0.101.sha256sum] = "5f0e0fee31ef5ed1ba1316088939cea399010ed7731dba877ed44aeb407a75ea"
 SRC_URI[ar_archive_writer-0.5.1.sha256sum] = "7eb93bbb63b9c227414f6eb3a0adfddca591a8ce1e9b60661bb08969b87e340b"
 SRC_URI[arbitrary-1.4.2.sha256sum] = "c3d036a3c4ab069c7b410a2ce876bd74808d2d0888a82667669f8e783a898bf1"
+SRC_URI[arwen-0.0.5.sha256sum] = "d44cbd9bd79165abe331ebabb9dd4d59a5dc93791be33ff15ebd71baaadc85ba"
+SRC_URI[arwen-codesign-0.0.1-alpha.1.sha256sum] = "35d7a19757bfe3658d5a95bf25a0492f29ebb21933549bdbfa4075c895510124"
 SRC_URI[autocfg-1.5.0.sha256sum] = "c08606f8c3cbf4ce6ec8e28fb0014a2c086708fe954eaa885384a6165172e7e8"
 SRC_URI[automod-1.0.16.sha256sum] = "e8b5778837666541195063243828c5b6139221b47dc4ec3ba81738e532469ab1"
-SRC_URI[base64-0.21.7.sha256sum] = "9d297deb1925b89f2ccc13d7635fa0714f12c87adce1c75356b39ca9b7178567"
 SRC_URI[base64-0.22.1.sha256sum] = "72b3254f16251a8381aa12e40e3c4d2f0199f8c6508fbecb9d91f575e0fbb8c6"
 SRC_URI[base64ct-1.8.3.sha256sum] = "2af50177e190e07a26ab74f8b1efbfe2ef87da2116221318cb1c2e82baf7de06"
-SRC_URI[bitflags-1.3.2.sha256sum] = "bef38d45163c2f1dde094a7dfd33ccf595c92905c8f8f4fdc18d06fb1037718a"
 SRC_URI[bitflags-2.10.0.sha256sum] = "812e12b5285cc515a9c72a5c1d3b6d46a19dac5acfef5265968c166106e31dd3"
 SRC_URI[block-buffer-0.10.4.sha256sum] = "3078c7629b62d3f0439517fa394996acacc5cbc91c5a20d8c658e77abd503a71"
+SRC_URI[borrow-or-share-0.2.4.sha256sum] = "dc0b364ead1874514c8c2855ab558056ebfeb775653e7ae45ff72f28f8f3166c"
 SRC_URI[boxcar-0.2.14.sha256sum] = "36f64beae40a84da1b4b26ff2761a5b895c12adc41dc25aaee1c4f2bbfe97a6e"
 SRC_URI[bstr-1.12.1.sha256sum] = "63044e1ae8e69f3b5a92c736ca6269b8d12fa7efe39bf34ddb06d102cf0e2cab"
 SRC_URI[bumpalo-3.19.1.sha256sum] = "5dd9dc738b7a8311c7ade152424974d8115f2cdad61e8dab8dac9f2362298510"
@@ -479,7 +492,7 @@ SRC_URI[bzip2-0.6.1.sha256sum] = "f3a53fac24f34a81bc9954b5d6cfce0c21e18ec6959f44
 SRC_URI[cab-0.6.0.sha256sum] = "171228650e6721d5acc0868a462cd864f49ac5f64e4a42cde270406e64e404d2"
 SRC_URI[camino-1.2.2.sha256sum] = "e629a66d692cb9ff1a1c664e41771b3dcaf961985a9774c0eb0bd1b51cf60a48"
 SRC_URI[cargo-config2-0.1.40.sha256sum] = "9821da7dd887f2a39d24a12415376dfc532200a7f9edbcf6bb97e96120a257e9"
-SRC_URI[cargo-cyclonedx-0.5.7.sha256sum] = "ed20afa5ee0c8e397f97e1ee0f71fd6c16d055abdaeddda483e4c3f73f35502b"
+SRC_URI[cargo-cyclonedx-0.5.9.sha256sum] = "5d162f67705f0f5038759d73bf546a083bf30e8677c2e944b416bca48d9d69a8"
 SRC_URI[cargo-lock-10.1.0.sha256sum] = "c06acb4f71407ba205a07cb453211e0e6a67b21904e47f6ba1f9589e38f2e454"
 SRC_URI[cargo-options-0.7.6.sha256sum] = "f89e1d6d6f65fe04d5e21be9de19d31a074e3b7e43aa39ee5b85f4cee16c3188"
 SRC_URI[cargo-platform-0.1.9.sha256sum] = "e35af189006b9c0f00a064685c727031e3ed2d8020f7ba284d78cc2671bd36ea"
@@ -524,7 +537,7 @@ SRC_URI[crossbeam-deque-0.8.6.sha256sum] = "9dd111b7b7f7d55b72c0a6ae361660ee5853
 SRC_URI[crossbeam-epoch-0.9.18.sha256sum] = "5b82ac4a3c2ca9c3460964f020e1402edd5753411d7737aa39c3714ad1b5420e"
 SRC_URI[crossbeam-utils-0.8.21.sha256sum] = "d0a5c400df2834b80a4c3327b3aad3a4c4cd4de0629063962b03235697506a28"
 SRC_URI[crypto-common-0.1.7.sha256sum] = "78c8292055d1c1df0cce5d180393dc8cce0abec0a7102adb6c7b1eef6016d60a"
-SRC_URI[cyclonedx-bom-0.8.0.sha256sum] = "ce2ec98a191e17f63b92b132f6852462de9eaee03ca8dbf2df401b9fd809bcac"
+SRC_URI[cyclonedx-bom-0.8.1.sha256sum] = "3132b69ba8c13808bd2fa5748ac5b9816eb4f4e1f0bff6b7f9254a5940dcdeef"
 SRC_URI[cyclonedx-bom-macros-0.1.0.sha256sum] = "c50341f21df64b412b4f917e34b7aa786c092d64f3f905f478cb76950c7e980c"
 SRC_URI[data-encoding-2.10.0.sha256sum] = "d7a1e2f27636f116493b8b860f5546edb47c8d8f8ea73e1d2a20be88e28d1fea"
 SRC_URI[der-0.7.10.sha256sum] = "e7c1832837b905bbfb5101e07cc24c8deddf52f93225eee6ead5f4d63d53ddcb"
@@ -553,9 +566,10 @@ SRC_URI[fat-macho-0.4.10.sha256sum] = "a64465b99fa411ca36a47048e9b1deec20f609b07
 SRC_URI[filetime-0.2.27.sha256sum] = "f98844151eee8917efc50bd9e8318cb963ae8b297431495d3f758616ea5c57db"
 SRC_URI[find-msvc-tools-0.1.9.sha256sum] = "5baebc0774151f905a1a2cc41989300b1e6fbb29aff0ceffa1064fdd3088d582"
 SRC_URI[flate2-1.1.9.sha256sum] = "843fba2746e448b37e26a819579957415c8cef339bf08564fe8b7ddbd959573c"
-SRC_URI[fluent-uri-0.1.4.sha256sum] = "17c704e9dbe1ddd863da1e6ff3567795087b1eb201ce80d8fa81162e1516500d"
+SRC_URI[fluent-uri-0.4.1.sha256sum] = "bc74ac4d8359ae70623506d512209619e5cf8f347124910440dbc221714b328e"
 SRC_URI[fnv-1.0.7.sha256sum] = "3f9eec918d3f24069decb9af1554cad7c880e2da24a9afd88aca000531ab82c1"
 SRC_URI[foldhash-0.1.5.sha256sum] = "d9c4f5dac5e15c24eb999c26181a6ca40b39fe946cbe4c263c7209467bc83af2"
+SRC_URI[foldhash-0.2.0.sha256sum] = "77ce24cb58228fbb8aa041425bb1050850ac19177686ea6e0f41a70416f56fdb"
 SRC_URI[foreign-types-0.3.2.sha256sum] = "f6f339eb8adc052cd2ca78910fda869aefa38d22d5cb648e6485e4d3fc06f3b1"
 SRC_URI[foreign-types-shared-0.1.1.sha256sum] = "00b0228411908ca8685dba7fc2cdd70ec9990a6e753e89b6ac91a84c40fbaf4b"
 SRC_URI[form_urlencoded-1.2.2.sha256sum] = "cb4cb245038516f5f85277875cdaa4f7d2c9a0fa0468de06ed190163b1581fcf"
@@ -588,7 +602,6 @@ SRC_URI[icu_normalizer_data-2.1.1.sha256sum] = "7aedcccd01fc5fe81e6b489c15b247b8
 SRC_URI[icu_properties-2.1.2.sha256sum] = "020bfc02fe870ec3a66d93e677ccca0562506e5872c650f893269e08615d74ec"
 SRC_URI[icu_properties_data-2.1.2.sha256sum] = "616c294cf8d725c6afcd8f55abc17c56464ef6211f9ed59cccffe534129c77af"
 SRC_URI[icu_provider-2.1.1.sha256sum] = "85962cf0ce02e1e0a629cc34e7ca3e373ce20dda4c4d7294bbd0bf1fdb59e614"
-SRC_URI[idna-0.4.0.sha256sum] = "7d20d6b07bfbc108882d88ed8e37d39636dcc260e15e30c45e6ba089610b917c"
 SRC_URI[idna-1.1.0.sha256sum] = "3b0875f23caa03898994f6ddc501886a45c7d3d62d04d2d90788d47be1b1e4de"
 SRC_URI[idna_adapter-1.2.1.sha256sum] = "3acae9609540aa318d1bc588455225fb2085b9ed0c4f6bd0d9d5bcd86f1a0344"
 SRC_URI[ignore-0.4.25.sha256sum] = "d3d782a365a015e0f5c04902246139249abf769125006fbe7649e2ee88169b4a"
@@ -607,7 +620,7 @@ SRC_URI[jobserver-0.1.34.sha256sum] = "9afb3de4395d6b3e67a780b6de64b51c978ecf11c
 SRC_URI[js-sys-0.3.85.sha256sum] = "8c942ebf8e95485ca0d52d97da7c5a2c387d0e7f0ba4c35e93bfcaee045955b3"
 SRC_URI[keyring-2.3.3.sha256sum] = "363387f0019d714aa60cc30ab4fe501a747f4c08fc58f069dd14be971bd495a0"
 SRC_URI[lazy_static-1.5.0.sha256sum] = "bbd2bcb4c963f2ddae06a2efc7e9f3591312473c50c6685e1f298068316e66fe"
-SRC_URI[lddtree-0.4.0.sha256sum] = "9cd71f004036b2ea41763739528084d0d2a9dea4fda11816a31d67edb2bd239f"
+SRC_URI[lddtree-0.5.0.sha256sum] = "39f71c5bd42adf4ee8e6b24da58c1f00a2817d27f618b169399f5adbf9e74492"
 SRC_URI[libbz2-rs-sys-0.2.2.sha256sum] = "2c4a545a15244c7d945065b5d392b2d2d7f21526fba56ce51467b06ed445e8f7"
 SRC_URI[libc-0.2.180.sha256sum] = "bcc35a38544a891a5f7c865aca548a982ccb3b8650a5b06d0fd33a10283c56fc"
 SRC_URI[libmimalloc-sys-0.1.44.sha256sum] = "667f4fec20f29dfc6bc7357c582d91796c169ad7e2fce709468aefeb2c099870"
@@ -618,7 +631,7 @@ SRC_URI[litemap-0.8.1.sha256sum] = "6373607a59f0be73a39b6fe456b8192fcc3585f602af
 SRC_URI[litrs-1.0.0.sha256sum] = "11d3d7f243d5c5a8b9bb5d6dd2b1602c0cb0b9db1621bafc7ed66e35ff9fe092"
 SRC_URI[lock_api-0.4.14.sha256sum] = "224399e74b87b5f3557511d98dff8b14089b3dadafcab6bb93eab67d3aace965"
 SRC_URI[log-0.4.29.sha256sum] = "5e5032e24019045c762d3c0f28f5b6b8bbf38563a65908389bf7978758920897"
-SRC_URI[lzma-rust2-0.13.0.sha256sum] = "c60a23ffb90d527e23192f1246b14746e2f7f071cb84476dd879071696c18a4a"
+SRC_URI[lzma-rust2-0.16.2.sha256sum] = "47bb1e988e6fb779cf720ad431242d3f03167c1b3f2b1aae7f1a94b2495b36ae"
 SRC_URI[lzma-sys-0.1.20.sha256sum] = "5fda04ab3764e6cde78b9974eec4f779acaba7c4e84b36eca3cf77c581b85d27"
 SRC_URI[lzxd-0.2.6.sha256sum] = "7b29dffab797218e12e4df08ef5d15ab9efca2504038b1b32b9b32fc844b39c9"
 SRC_URI[mailparse-0.16.1.sha256sum] = "60819a97ddcb831a5614eb3b0174f3620e793e97e09195a395bfa948fd68ed2f"
@@ -641,6 +654,7 @@ SRC_URI[num-conv-0.2.0.sha256sum] = "cf97ec579c3c42f953ef76dbf8d55ac91fb219dde70
 SRC_URI[num-traits-0.2.19.sha256sum] = "071dfc062690e90b734c0b2273ce72ad0ffa95f0c74596bc250dcfd960262841"
 SRC_URI[number_prefix-0.4.0.sha256sum] = "830b246a0e5f20af87141b25c173cd1b609bd7779a4617d6ec582abaf90870f3"
 SRC_URI[object-0.37.3.sha256sum] = "ff76201f031d8863c38aa7f905eca4f53abbfa15f609db4277d44cd8938f33fe"
+SRC_URI[object-0.38.1.sha256sum] = "271638cd5fa9cca89c4c304675ca658efc4e64a66c716b7cfe1afb4b9611dbbc"
 SRC_URI[once_cell-1.21.3.sha256sum] = "42f5e15c9953c5e4ccceeb2e7382a716482c34515315f7b03532b8b4e8393d2d"
 SRC_URI[once_cell_polyfill-1.70.2.sha256sum] = "384b8ab6d37215f3c5301a95a4accb5d64aa607f1fcb26a11b5303878451b4fe"
 SRC_URI[openssl-0.10.75.sha256sum] = "08838db121398ad17ab8531ce9de97b244589089e290a384c900cb9ff7434328"
@@ -649,7 +663,7 @@ SRC_URI[openssl-probe-0.1.6.sha256sum] = "d05e27ee213611ffe7d6348b942e8f942b3711
 SRC_URI[openssl-probe-0.2.1.sha256sum] = "7c87def4c32ab89d880effc9e097653c8da5d6ef28e6b539d313baaacfbafcbe"
 SRC_URI[openssl-sys-0.9.111.sha256sum] = "82cab2d520aa75e3c58898289429321eb788c3106963d0dc886ec7a5f4adc321"
 SRC_URI[option-ext-0.2.0.sha256sum] = "04744f49eae99ab78e0d5c0b603ab218f515ea8cfe5a456d7629ad883a3b6e7d"
-SRC_URI[ordered-float-4.6.0.sha256sum] = "7bb71e1b3fa6ca1c61f383464aaf2bb0e2f8e772a1f01d486832464de363b951"
+SRC_URI[ordered-float-5.1.0.sha256sum] = "7f4779c6901a562440c3786d08192c6fbda7c1c2060edd10006b05ee35d10f2d"
 SRC_URI[os_pipe-1.2.3.sha256sum] = "7d8fae84b431384b68627d0f9b3b1245fcf9f46f6c0e3dc902e9dce64edd1967"
 SRC_URI[parking_lot-0.12.5.sha256sum] = "93857453250e3077bd71ff98b6a65ea6621a19bb0f559a85248955ac12c45a1a"
 SRC_URI[parking_lot_core-0.9.12.sha256sum] = "2621685985a2ebf1c516881c026032ac7deafcda1a2c9b7850dc81e3dfcb64c1"
@@ -678,8 +692,9 @@ SRC_URI[proc-macro-crate-3.4.0.sha256sum] = "219cb19e96be00ab2e37d6e299658a0cfa8
 SRC_URI[proc-macro2-1.0.106.sha256sum] = "8fd00f0bb2e90d81d1044c2b32617f68fcb9fa3bb7640c23e9c748e53fb30934"
 SRC_URI[psm-0.1.30.sha256sum] = "3852766467df634d74f0b2d7819bf8dc483a0eb2e3b0f50f756f9cfe8b0d18d8"
 SRC_URI[purl-0.1.6.sha256sum] = "60ebe4262ae91ddd28c8721111a0a6e9e58860e211fc92116c4bb85c98fd96ad"
+SRC_URI[pyo3-introspection-0.28.2.sha256sum] = "cc11f40a1f5ec62a36963d4b4b0c051fac90c879c640baa975f45cd01afd3c38"
 SRC_URI[pyproject-toml-0.13.7.sha256sum] = "f6d755483ad14b49e76713b52285235461a5b4f73f17612353e11a5de36a5fd2"
-SRC_URI[python-pkginfo-0.6.6.sha256sum] = "464e5e2e0fb6c8c2c7aedc0cd6615258a3def4e34b417f6bf8835e76e7d441d4"
+SRC_URI[python-pkginfo-0.6.8.sha256sum] = "229fe47647d6602b9b0934b21fab8aece1c5a5aeb0a934196a14355fec656623"
 SRC_URI[quote-1.0.44.sha256sum] = "21b2ebcf727b7760c461f091f9f0f539b77b8e87f2fd88131e7f1b433b3cece4"
 SRC_URI[quoted_printable-0.5.1.sha256sum] = "640c9bd8497b02465aeef5375144c26062e0dcd5939dfcbb0f5db76cb8c17c73"
 SRC_URI[r-efi-5.3.0.sha256sum] = "69cdb34c158ceb288df11e18b4bd39de994f6657d83847bdffdbd7f346754b0f"
@@ -695,6 +710,7 @@ SRC_URI[redox_syscall-0.7.0.sha256sum] = "49f3fe0889e69e2ae9e41f4d6c4c0181701d00
 SRC_URI[redox_users-0.5.2.sha256sum] = "a4e608c6638b9c18977b00b475ac1f28d14e84b27d8d42f70e0bf1e3dec127ac"
 SRC_URI[ref-cast-1.0.25.sha256sum] = "f354300ae66f76f1c85c5f84693f0ce81d747e2c3f21a45fef496d89c960bf7d"
 SRC_URI[ref-cast-impl-1.0.25.sha256sum] = "b7186006dcb21920990093f30e3dea63b7d6e977bf1256be20c3563a5db070da"
+SRC_URI[reflink-copy-0.1.29.sha256sum] = "13362233b147e57674c37b802d216b7c5e3dcccbed8967c84f0d8d223868ae27"
 SRC_URI[regex-1.12.3.sha256sum] = "e10754a14b9137dd7b1e3e5b0493cc9171fdd105e0ab477f51b72e7f3ac0e276"
 SRC_URI[regex-automata-0.3.9.sha256sum] = "59b23e92ee4318893fa3fe3e6fb365258efbfe6ac6ab30f090cdcbb7aa37efa9"
 SRC_URI[regex-automata-0.4.14.sha256sum] = "6e1dd4122fc1595e8162618945476892eefca7b88c52820e74af6262213cae8f"
@@ -714,8 +730,9 @@ SRC_URI[rustls-native-certs-0.8.3.sha256sum] = "612460d5f7bea540c490b2b6395d8e34
 SRC_URI[rustls-pki-types-1.14.0.sha256sum] = "be040f8b0a225e40375822a563fa9524378b9d63112f53e19ffff34df5d33fdd"
 SRC_URI[rustls-platform-verifier-0.6.2.sha256sum] = "1d99feebc72bae7ab76ba994bb5e121b8d83d910ca40b36e0921f53becc41784"
 SRC_URI[rustls-platform-verifier-android-0.1.1.sha256sum] = "f87165f0995f63a9fbeea62b64d10b4d9d8e78ec6d7d51fb2125fda7bb36788f"
-SRC_URI[rustls-webpki-0.103.9.sha256sum] = "d7df23109aa6c1567d1c575b9952556388da57401e4ace1d15f79eedad0d8f53"
+SRC_URI[rustls-webpki-0.103.10.sha256sum] = "df33b2b81ac578cabaf06b89b0631153a3f416b0a886e8a7a1707fb51abbd1ef"
 SRC_URI[rustversion-1.0.22.sha256sum] = "b39cdef0fa800fc44525c84ccb54a029961a8215f9619753635a9c0d2538d46d"
+SRC_URI[ruzstd-0.8.2.sha256sum] = "e5ff0cc5e135c8870a775d3320910cd9b564ec036b4dc0b8741629020be63f01"
 SRC_URI[same-file-1.0.6.sha256sum] = "93fc1dc3aaa9bfed95e02e6eadabb4baf7e3078b0bd1b4d7b6b0b68378900502"
 SRC_URI[scc-2.4.0.sha256sum] = "46e6f046b7fef48e2660c57ed794263155d713de679057f2d0c169bfc6e756cc"
 SRC_URI[schannel-0.1.28.sha256sum] = "891d81b926048e76efe18581bf793546b4c0eaf8448d72be8de2bbee5fd166e1"
@@ -751,16 +768,16 @@ SRC_URI[smawk-0.3.2.sha256sum] = "b7c388c1b5e93756d0c740965c41e8822f866621d41acb
 SRC_URI[snapbox-0.6.24.sha256sum] = "6c1abc378119f77310836665f8523018532cf7e3faeb3b10b01da5a7321bf8e1"
 SRC_URI[snapbox-macros-0.4.0.sha256sum] = "3b750c344002d7cc69afb9da00ebd9b5c0f8ac2eb7d115d9d45d5b5f47718d74"
 SRC_URI[socks-0.3.4.sha256sum] = "f0c3dbbd9ae980613c6dd8e28a9407b50509d3803b57624d5dfe8315218cd58b"
-SRC_URI[spdx-0.10.9.sha256sum] = "c3e17e880bafaeb362a7b751ec46bdc5b61445a188f80e0606e68167cd540fa3"
+SRC_URI[spdx-0.13.4.sha256sum] = "a8da593e30beb790fc9424502eb898320b44e5eb30367dbda1c1edde8e2f32d7"
 SRC_URI[stable_deref_trait-1.2.1.sha256sum] = "6ce2be8dc25455e1f91df71bfa12ad37d7af1092ae736f3a6cd0e37bc7810596"
 SRC_URI[stacker-0.1.23.sha256sum] = "08d74a23609d509411d10e2176dc2a4346e3b4aea2e7b1869f19fdedbc71c013"
 SRC_URI[strsim-0.11.1.sha256sum] = "7da8b5736845d9f2fcb837ea5d9e2628564b3b043a70948a3f0b778838c5fb4f"
-SRC_URI[strum-0.26.3.sha256sum] = "8fec0f0aef304996cf250b31b5a10dee7980c85da9d759361292b8bca5a18f06"
-SRC_URI[strum_macros-0.26.4.sha256sum] = "4c6bee85a5a24955dc440386795aa378cd9cf82acd5f764469152d2270e581be"
+SRC_URI[strum-0.28.0.sha256sum] = "9628de9b8791db39ceda2b119bbe13134770b56c138ec1d3af810d045c04f9bd"
+SRC_URI[strum_macros-0.28.0.sha256sum] = "ab85eea0270ee17587ed4156089e10b9e6880ee688791d45a905f5b1ca36f664"
 SRC_URI[subtle-2.6.1.sha256sum] = "13c2bddecc57b384dee18652358fb23172facb8a2c51ccc10d74c157bdea3292"
 SRC_URI[syn-2.0.114.sha256sum] = "d4d107df263a3013ef9b1879b0df87d706ff80f65a86ea879bd9c31f9b307c2a"
 SRC_URI[synstructure-0.13.2.sha256sum] = "728a70f3dbaf5bab7f0c4b1ac8d7ae5ea60a4b5549c8a5914361c99147a709d2"
-SRC_URI[tar-0.4.44.sha256sum] = "1d863878d212c87a19c1a610eb53bb01fe12951c0501cf5a0d65f724914a667a"
+SRC_URI[tar-0.4.45.sha256sum] = "22692a6476a21fa75fdfc11d452fda482af402c008cdbaf3476414e122040973"
 SRC_URI[target-lexicon-0.13.4.sha256sum] = "b1dd07eb858a2067e2f3c7155d54e929265c264e6f37efe3ee7a8d1b5a1dd0ba"
 SRC_URI[tempfile-3.24.0.sha256sum] = "655da9c7eb6305c55742045d5a8d2037996d61d8de95806335c7c86ce0f82e9c"
 SRC_URI[termcolor-1.4.1.sha256sum] = "06794f8f6c5c898b3275aebefa6b8a1cb24cd2c6c79397ab15774837a0bc5755"
@@ -775,8 +792,6 @@ SRC_URI[time-0.3.47.sha256sum] = "743bd48c283afc0388f9b8827b976905fb217ad9e647fa
 SRC_URI[time-core-0.1.8.sha256sum] = "7694e1cfe791f8d31026952abf09c69ca6f6fa4e1a1229e18988f06a04a12dca"
 SRC_URI[time-macros-0.2.27.sha256sum] = "2e70e4c5a0e0a8a4823ad65dfe1a6930e4f4d756dcd9dd7939022b5e8c501215"
 SRC_URI[tinystr-0.8.2.sha256sum] = "42d3e9c45c09de15d06dd8acf5f4e0e399e85927b7f00711024eb7ae10fa4869"
-SRC_URI[tinyvec-1.10.0.sha256sum] = "bfa5fdc3bce6191a1dbc8c02d5c8bffcf557bafa17c124c5264a458f1b0613fa"
-SRC_URI[tinyvec_macros-0.1.1.sha256sum] = "1f3ccbac311fea05f86f61904b462b55fb3df8837a366dfc601a0161d0532f20"
 SRC_URI[toml-0.8.23.sha256sum] = "dc1beb996b9d83529a9e75c17a1686767d148d70663143c7854d8b4a09ced362"
 SRC_URI[toml-0.9.11+spec-1.1.0.sha256sum] = "f3afc9a848309fe1aaffaed6e1546a7a14de1f935dc9d89d32afd9a44bab7c46"
 SRC_URI[toml_datetime-0.6.11.sha256sum] = "22cddaf88f4fbc13c51aebbf5f8eceb5c7c5a9da2ac40a13519eb5b0a0e8f11c"
@@ -795,12 +810,11 @@ SRC_URI[tracing-serde-0.2.0.sha256sum] = "704b1aeb7be0d0a84fc9828cae51dab5970fee
 SRC_URI[tracing-subscriber-0.3.22.sha256sum] = "2f30143827ddab0d256fd843b7a66d164e9f271cfa0dde49142c5ca0ca291f1e"
 SRC_URI[trycmd-0.15.11.sha256sum] = "a81ea3136ddc88e19c2cc2eb3176b72abee4e831367cd8949f2a88ac5497e64e"
 SRC_URI[twox-hash-2.1.2.sha256sum] = "9ea3136b675547379c4bd395ca6b938e5ad3c3d20fad76e7fe85f9e0d011419c"
+SRC_URI[typed-path-0.12.3.sha256sum] = "8e28f89b80c87b8fb0cf04ab448d5dd0dd0ade2f8891bae878de66a75a28600e"
 SRC_URI[typenum-1.19.0.sha256sum] = "562d481066bde0658276a35467c4af00bdc6ee726305698a55b86e61d7ad82bb"
 SRC_URI[unicase-2.9.0.sha256sum] = "dbc4bc3a9f746d862c45cb89d705aa10f187bb96c76001afab07a0d35ce60142"
-SRC_URI[unicode-bidi-0.3.18.sha256sum] = "5c1cb5db39152898a79168971543b1cb5020dff7fe43c8dc468b0885f5e29df5"
 SRC_URI[unicode-ident-1.0.22.sha256sum] = "9312f7c4f6ff9069b165498234ce8be658059c6728633667c526e27dc2cf1df5"
 SRC_URI[unicode-linebreak-0.1.5.sha256sum] = "3b09c83c3c29d37506a3e260c08c03743a6bb66a9cd432c6934ab501a190571f"
-SRC_URI[unicode-normalization-0.1.25.sha256sum] = "5fd4f6878c9cb28d874b009da9e8d183b5abc80117c40bbd187a1fde336be6e8"
 SRC_URI[unicode-segmentation-1.12.0.sha256sum] = "f6ccf251212114b54433ec949fd6a7841275f9ada20dddd2f29e9ceea4501493"
 SRC_URI[unicode-width-0.2.2.sha256sum] = "b4ac048d71ede7ee76d585517add45da530660ef4390e49b098733c6e897f254"
 SRC_URI[unicode-xid-0.2.6.sha256sum] = "ebc1c04c71510c7f702b52b7c350734c9ff1295c464a03335b00bb84fc54f853"
@@ -814,7 +828,7 @@ SRC_URI[utf-8-0.7.6.sha256sum] = "09cc8ee72d2a9becf2f2febe0205bbed8fc6615b7cb429
 SRC_URI[utf8_iter-1.0.4.sha256sum] = "b6c140620e7ffbb22c2dee59cafe6084a59b5ffc27a8859a5f0d494b5d52b6be"
 SRC_URI[utf8parse-0.2.2.sha256sum] = "06abde3611657adf66d383f00b093d7faecc7fa57071cce2578660c9f1010821"
 SRC_URI[uuid-1.20.0.sha256sum] = "ee48d38b119b0cd71fe4141b30f5ba9c7c5d9f4e7a3a8b4a674e4b6ef789976f"
-SRC_URI[validator-0.16.1.sha256sum] = "b92f40481c04ff1f4f61f304d61793c7b56ff76ac1469f1beb199b1445b253bd"
+SRC_URI[validator-0.19.0.sha256sum] = "d0b4a29d8709210980a09379f27ee31549b73292c87ab9899beee1c0d3be6303"
 SRC_URI[valuable-0.1.1.sha256sum] = "ba73ea9cf16a25df0c8caa16c51acb937d5712a8429db78a3ee29d5dcacd3a65"
 SRC_URI[vcpkg-0.2.15.sha256sum] = "accd4ea62f7bb7a82fe23066fb0957d48ef677f6eeb8215f372f52e48bb32426"
 SRC_URI[version-ranges-0.1.2.sha256sum] = "3595ffe225639f1e0fd8d7269dcc05d2fbfea93cfac2fea367daf1adb60aae91"
@@ -837,7 +851,16 @@ SRC_URI[winapi-0.3.9.sha256sum] = "5c839a674fcd7a98952e593242ea400abe93992746761
 SRC_URI[winapi-i686-pc-windows-gnu-0.4.0.sha256sum] = "ac3b87c63620426dd9b991e5ce0329eff545bccbbb34f3be09ff6fb6ab51b7b6"
 SRC_URI[winapi-util-0.1.11.sha256sum] = "c2a7b1c03c876122aa43f3020e6c3c3ee5c05081c9a00739faf7503aeba10d22"
 SRC_URI[winapi-x86_64-pc-windows-gnu-0.4.0.sha256sum] = "712e227841d057c1ee1cd2fb22fa7e5a5461ae8e48fa2ca79ec42cfc1931183f"
+SRC_URI[windows-0.62.2.sha256sum] = "527fadee13e0c05939a6a05d5bd6eec6cd2e3dbd648b9f8e447c6518133d8580"
+SRC_URI[windows-collections-0.3.2.sha256sum] = "23b2d95af1a8a14a3c7367e1ed4fc9c20e0a26e79551b1454d72583c97cc6610"
+SRC_URI[windows-core-0.62.2.sha256sum] = "b8e83a14d34d0623b51dce9581199302a221863196a1dde71a7663a4c2be9deb"
+SRC_URI[windows-future-0.3.2.sha256sum] = "e1d6f90251fe18a279739e78025bd6ddc52a7e22f921070ccdc67dde84c605cb"
+SRC_URI[windows-implement-0.60.2.sha256sum] = "053e2e040ab57b9dc951b72c264860db7eb3b0200ba345b4e4c3b14f67855ddf"
+SRC_URI[windows-interface-0.59.3.sha256sum] = "3f316c4a2570ba26bbec722032c4099d8c8bc095efccdc15688708623367e358"
 SRC_URI[windows-link-0.2.1.sha256sum] = "f0805222e57f7521d6a62e36fa9163bc891acd422f971defe97d64e70d0a4fe5"
+SRC_URI[windows-numerics-0.3.1.sha256sum] = "6e2e40844ac143cdb44aead537bbf727de9b044e107a0f1220392177d15b0f26"
+SRC_URI[windows-result-0.4.1.sha256sum] = "7781fa89eaf60850ac3d2da7af8e5242a5ea78d1a11c49bf2910bb5a73853eb5"
+SRC_URI[windows-strings-0.5.1.sha256sum] = "7837d08f69c77cf6b07689544538e017c1bfcf57e34b4c0ff58e6c2cd3b37091"
 SRC_URI[windows-sys-0.45.0.sha256sum] = "75283be5efb2831d37ea142365f009c02ec203cd29a3ebecbc093d52315b66d0"
 SRC_URI[windows-sys-0.52.0.sha256sum] = "282be5f36a8ce781fad8c8ae18fa3f9beff57ec1b52cb3de0789201425d9a33d"
 SRC_URI[windows-sys-0.59.0.sha256sum] = "1e38bc4d79ed67fd075bcc251a1c39b32a1776bbe92e5bef1f0bf1f8c531853b"
@@ -846,6 +869,7 @@ SRC_URI[windows-sys-0.61.2.sha256sum] = "ae137229bcbd6cdf0f7b80a31df61766145077d
 SRC_URI[windows-targets-0.42.2.sha256sum] = "8e5180c00cd44c9b1c88adb3693291f1cd93605ded80c250a75d472756b4d071"
 SRC_URI[windows-targets-0.52.6.sha256sum] = "9b724f72796e036ab90c1021d4780d4d3d648aca59e491e6b98e725b84e99973"
 SRC_URI[windows-targets-0.53.5.sha256sum] = "4945f9f551b88e0d65f3db0bc25c33b8acea4d9e41163edf90dcd0b19f9069f3"
+SRC_URI[windows-threading-0.2.1.sha256sum] = "3949bd5b99cafdf1c7ca86b43ca564028dfe27d66958f2470940f73d86d75b37"
 SRC_URI[windows_aarch64_gnullvm-0.42.2.sha256sum] = "597a5118570b68bc08d8d59125332c54f1ba9d9adeedeef5b99b02ba2b0698f8"
 SRC_URI[windows_aarch64_gnullvm-0.52.6.sha256sum] = "32a4622180e7a0ec044bb555404c800bc9fd9ec262ec147edd5989ccd0c02cd3"
 SRC_URI[windows_aarch64_gnullvm-0.53.1.sha256sum] = "a9d8416fa8b42f5c947f8482c43e7d89e73a173cead56d044f6a56104a6d1b53"
@@ -889,7 +913,7 @@ SRC_URI[zerotrie-0.2.3.sha256sum] = "2a59c17a5562d507e4b54960e8569ebee33bee890c7
 SRC_URI[zerovec-0.11.5.sha256sum] = "6c28719294829477f525be0186d13efa9a3c602f7ec202ca9e353d310fb9a002"
 SRC_URI[zerovec-derive-0.11.2.sha256sum] = "eadce39539ca5cb3985590102671f2567e659fca9666581ad3411d59207951f3"
 SRC_URI[zip-4.6.1.sha256sum] = "caa8cd6af31c3b31c6631b8f483848b91589021b28fffe50adada48d4f4d2ed1"
-SRC_URI[zip-6.0.0.sha256sum] = "eb2a05c7c36fde6c09b08576c9f7fb4cda705990f73b58fe011abf7dfb24168b"
+SRC_URI[zip-8.1.0.sha256sum] = "6e499faf5c6b97a0d086f4a8733de6d47aee2252b8127962439d8d4311a73f72"
 SRC_URI[zlib-rs-0.6.0.sha256sum] = "a7948af682ccbc3342b6e9420e8c51c1fe5d7bf7756002b4a3c6cabfe96a7e3c"
 SRC_URI[zmij-1.0.19.sha256sum] = "3ff05f8caa9038894637571ae6b9e29466c1f4f829d26c9b28f869a29cbe3445"
 SRC_URI[zopfli-0.8.3.sha256sum] = "f05cd8797d63865425ff89b5c4a48804f35ba0ce8d125800027ad6017d2b5249"
diff --git a/meta/recipes-devtools/python/python3-maturin_1.12.4.bb b/meta/recipes-devtools/python/python3-maturin_1.13.1.bb
similarity index 92%
rename from meta/recipes-devtools/python/python3-maturin_1.12.4.bb
rename to meta/recipes-devtools/python/python3-maturin_1.13.1.bb
index bc4ff1d5c5..e3672cf326 100644
--- a/meta/recipes-devtools/python/python3-maturin_1.12.4.bb
+++ b/meta/recipes-devtools/python/python3-maturin_1.13.1.bb
@@ -5,7 +5,7 @@ LICENSE = "MIT | Apache-2.0"
 LIC_FILES_CHKSUM = "file://license-apache;md5=1836efb2eb779966696f473ee8540542 \
                     file://license-mit;md5=85fd3b67069cff784d98ebfc7d5c0797"
 
-SRC_URI[sha256sum] = "06f6438be7e723aaf4b412fb34839854b540a1350f7614fadf5bd1db2b98d5f7"
+SRC_URI[sha256sum] = "9a87ff3b8e4d1c6eac33ebfe8e261e8236516d98d45c0323550621819b5a1a2f"
 
 S = "${UNPACKDIR}/maturin-${PV}"
 
-- 
2.43.0


