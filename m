Return-Path: <auh@yoctoproject.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id C6C13C44501
	for <webhook@archiver.kernel.org>; Thu, 16 Jul 2026 05:23:53 +0000 (UTC)
Received: from a27-45.smtp-out.us-west-2.amazonses.com (a27-45.smtp-out.us-west-2.amazonses.com [54.240.27.45])
 by mx.groups.io with SMTP id smtpd.msgproc01-g2.6149.1784179428872848023
 for <openembedded-core@lists.openembedded.org>;
 Wed, 15 Jul 2026 22:23:49 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@yoctoproject.org header.s=lvjh2tk576v2ro5mi6k4dt3mc6wpqbky header.b=jdcKdIwX;
 dkim=pass header.i=@amazonses.com header.s=hsbnp7p3ensaochzwyq5wwmceodymuwv header.b=0qDQNegO;
 spf=pass (domain: us-west-2.amazonses.com, ip: 54.240.27.45, mailfrom: 0101019f69618a63-cf2a8444-d454-4963-95c9-f1b2e4ccd615-000000@us-west-2.amazonses.com)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/simple;
	s=lvjh2tk576v2ro5mi6k4dt3mc6wpqbky; d=yoctoproject.org;
	t=1784179428;
	h=Content-Type:MIME-Version:From:To:Cc:Subject:Message-Id:Date;
	bh=MfYfMWKdbeMhYaEdl2ElCdeKUUGH+yQtkcUn27IZ4wg=;
	b=jdcKdIwXM3kBt8utQT2rKbTQ1DucZxO7v4NIbzV10sQQHnERJAu9lhO/qQ7GiJuK
	C4ohARuBTbsF83qWTJSdMisD0U9tpFPHy2omdgdgMOoeX5I5y1dGHraEC5ECMvDTs4y
	hOB2UTvLQQre6VY+ebrRYT6uEiv8Pys/vOZv9jFQ=
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/simple;
	s=hsbnp7p3ensaochzwyq5wwmceodymuwv; d=amazonses.com; t=1784179428;
	h=Content-Type:MIME-Version:From:To:Cc:Subject:Message-Id:Date:Feedback-ID;
	bh=MfYfMWKdbeMhYaEdl2ElCdeKUUGH+yQtkcUn27IZ4wg=;
	b=0qDQNegOdtWuzBtPYKcr8qmOSeT4TrPUyMD21Ot2AeTqBPv+lycIu+7pIG3xSHSv
	73+hKgVDlYaDbNs3z0qamWnfYl+ULZ2/cnNuGlLbvh2UrXvmUIuoXZoUnKX0oop8iYP
	NMjjjhg3g57SfEw722dwfwvbBnI5CzNuXbNFUwZY=
Content-Type: multipart/mixed; boundary="===============2104764467314560601=="
MIME-Version: 1.0
From: auh@yoctoproject.org
To: Trevor Gamblin <tgamblin@baylibre.com>
Cc: openembedded-core@lists.openembedded.org
Subject: [AUH] python3-uv-build: upgrading to 0.11.29 SUCCEEDED
Message-ID: <0101019f69618a63-cf2a8444-d454-4963-95c9-f1b2e4ccd615-000000@us-west-2.amazonses.com>
Date: Thu, 16 Jul 2026 05:23:47 +0000
Feedback-ID: ::1.us-west-2.9np3MYPs3fEaOBysGKSlUD4KtcmPijcmS9Az2Hwf7iQ=:AmazonSES
X-SES-Outgoing: 2026.07.16-54.240.27.45
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Thu, 16 Jul 2026 05:23:53 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/241050

--===============2104764467314560601==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit

Hello,

this email is a notification from the Auto Upgrade Helper
that the automatic attempt to upgrade the recipe(s) *python3-uv-build* to *0.11.29* has Succeeded.

Next steps:
    - apply the patch: git am 0001-python3-uv-build-upgrade-0.11.28-0.11.29.patch
    - check the changes to upstream patches and summarize them in the commit message,
    - compile an image that contains the package
    - perform some basic sanity tests
    - amend the patch and sign it off: git commit -s --reset-author --amend
    - send it to the appropriate mailing list

Alternatively, if you believe the recipe should not be upgraded at this time,
you can fill RECIPE_NO_UPDATE_REASON in respective recipe file so that
automatic upgrades would no longer be attempted.

Please review the attached files for further information and build/update failures.
Any problem please file a bug at https://bugzilla.yoctoproject.org/enter_bug.cgi?product=Automated%20Update%20Handler

Regards,
The Upgrade Helper

-- >8 --
From c8a855a992e86e303d6b95d507ba76d2ecd2cecd Mon Sep 17 00:00:00 2001
From: Upgrade Helper <auh@yoctoproject.org>
Date: Thu, 16 Jul 2026 05:23:44 +0000
Subject: [PATCH] python3-uv-build: upgrade 0.11.28 -> 0.11.29

---
 .../python/python3-uv-build-crates.inc        | 88 ++++++-------------
 ...0.11.28.bb => python3-uv-build_0.11.29.bb} |  2 +-
 2 files changed, 27 insertions(+), 63 deletions(-)
 rename meta/recipes-devtools/python/{python3-uv-build_0.11.28.bb => python3-uv-build_0.11.29.bb} (92%)

diff --git a/meta/recipes-devtools/python/python3-uv-build-crates.inc b/meta/recipes-devtools/python/python3-uv-build-crates.inc
index 97225725c2..f1de38878c 100644
--- a/meta/recipes-devtools/python/python3-uv-build-crates.inc
+++ b/meta/recipes-devtools/python/python3-uv-build-crates.inc
@@ -12,9 +12,9 @@ SRC_URI += " \
     crate://crates.io/anstyle-wincon/3.0.11 \
     crate://crates.io/anyhow/1.0.103 \
     crate://crates.io/arcstr/1.2.0 \
-    crate://crates.io/arrayvec/0.7.7 \
+    crate://crates.io/arrayvec/0.7.8 \
     crate://crates.io/astral-tokio-tar/0.6.3 \
-    crate://crates.io/astral-version-ranges/0.2.0 \
+    crate://crates.io/astral-version-ranges/0.2.1 \
     crate://crates.io/astral_async_zip/0.0.20 \
     crate://crates.io/async-compression/0.4.19 \
     crate://crates.io/autocfg/1.5.0 \
@@ -39,7 +39,7 @@ SRC_URI += " \
     crate://crates.io/clap_derive/4.6.1 \
     crate://crates.io/clap_lex/1.1.0 \
     crate://crates.io/colorchoice/1.0.5 \
-    crate://crates.io/console/0.16.3 \
+    crate://crates.io/console/0.16.4 \
     crate://crates.io/cpufeatures/0.2.17 \
     crate://crates.io/crc32fast/1.5.0 \
     crate://crates.io/crypto-common/0.1.7 \
@@ -69,7 +69,7 @@ SRC_URI += " \
     crate://crates.io/foldhash/0.1.5 \
     crate://crates.io/foldhash/0.2.0 \
     crate://crates.io/form_urlencoded/1.2.2 \
-    crate://crates.io/fs-err/3.3.0 \
+    crate://crates.io/fs-err/3.3.1 \
     crate://crates.io/futures/0.3.32 \
     crate://crates.io/futures-channel/0.3.32 \
     crate://crates.io/futures-core/0.3.32 \
@@ -81,8 +81,7 @@ SRC_URI += " \
     crate://crates.io/futures-task/0.3.32 \
     crate://crates.io/futures-util/0.3.32 \
     crate://crates.io/generic-array/0.14.7 \
-    crate://crates.io/getrandom/0.3.3 \
-    crate://crates.io/getrandom/0.4.1 \
+    crate://crates.io/getrandom/0.4.3 \
     crate://crates.io/globset/0.4.18 \
     crate://crates.io/gloo-timers/0.3.0 \
     crate://crates.io/hashbrown/0.15.5 \
@@ -96,7 +95,6 @@ SRC_URI += " \
     crate://crates.io/icu_properties/2.1.2 \
     crate://crates.io/icu_properties_data/2.1.2 \
     crate://crates.io/icu_provider/2.1.1 \
-    crate://crates.io/id-arena/2.3.0 \
     crate://crates.io/idna/1.1.0 \
     crate://crates.io/idna_adapter/1.2.1 \
     crate://crates.io/indexmap/2.14.0 \
@@ -105,15 +103,14 @@ SRC_URI += " \
     crate://crates.io/is_terminal_polyfill/1.70.2 \
     crate://crates.io/itertools/0.14.0 \
     crate://crates.io/itoa/1.0.17 \
-    crate://crates.io/jiff/0.2.29 \
-    crate://crates.io/jiff-static/0.2.29 \
+    crate://crates.io/jiff/0.2.31 \
+    crate://crates.io/jiff-static/0.2.31 \
     crate://crates.io/jiff-tzdb/0.1.6 \
     crate://crates.io/jiff-tzdb-platform/0.1.3 \
-    crate://crates.io/jobserver/0.1.34 \
+    crate://crates.io/jobserver/0.1.35 \
     crate://crates.io/js-sys/0.3.91 \
     crate://crates.io/junction/2.0.0 \
     crate://crates.io/lazy_static/1.5.0 \
-    crate://crates.io/leb128fmt/0.1.0 \
     crate://crates.io/libc/0.2.186 \
     crate://crates.io/linux-raw-sys/0.4.15 \
     crate://crates.io/linux-raw-sys/0.12.1 \
@@ -149,7 +146,6 @@ SRC_URI += " \
     crate://crates.io/portable-atomic/1.13.1 \
     crate://crates.io/portable-atomic-util/0.2.6 \
     crate://crates.io/potential_utf/0.1.4 \
-    crate://crates.io/prettyplease/0.2.37 \
     crate://crates.io/proc-macro-error-attr2/2.0.0 \
     crate://crates.io/proc-macro-error2/2.0.1 \
     crate://crates.io/proc-macro2/1.0.106 \
@@ -157,7 +153,7 @@ SRC_URI += " \
     crate://crates.io/ptr_meta_derive/0.3.1 \
     crate://crates.io/quote/1.0.46 \
     crate://crates.io/quoted_printable/0.5.1 \
-    crate://crates.io/r-efi/5.3.0 \
+    crate://crates.io/r-efi/6.0.0 \
     crate://crates.io/rancor/0.1.1 \
     crate://crates.io/redox_syscall/0.5.15 \
     crate://crates.io/ref-cast/1.0.25 \
@@ -167,9 +163,9 @@ SRC_URI += " \
     crate://crates.io/regex-automata/0.4.14 \
     crate://crates.io/regex-syntax/0.8.11 \
     crate://crates.io/rend/0.5.3 \
-    crate://crates.io/rkyv/0.8.16 \
-    crate://crates.io/rkyv_derive/0.8.16 \
-    crate://crates.io/rustc-hash/2.1.2 \
+    crate://crates.io/rkyv/0.8.17 \
+    crate://crates.io/rkyv_derive/0.8.17 \
+    crate://crates.io/rustc-hash/2.1.3 \
     crate://crates.io/rustix/0.38.44 \
     crate://crates.io/rustix/1.1.4 \
     crate://crates.io/rustversion/1.0.22 \
@@ -180,7 +176,6 @@ SRC_URI += " \
     crate://crates.io/scopeguard/1.2.0 \
     crate://crates.io/seahash/4.1.0 \
     crate://crates.io/self-replace/1.5.0 \
-    crate://crates.io/semver/1.0.27 \
     crate://crates.io/serde/1.0.228 \
     crate://crates.io/serde-untagged/0.1.9 \
     crate://crates.io/serde_core/1.0.228 \
@@ -231,12 +226,11 @@ SRC_URI += " \
     crate://crates.io/tracing-test/0.2.6 \
     crate://crates.io/tracing-test-macro/0.2.6 \
     crate://crates.io/typeid/1.0.3 \
-    crate://crates.io/typenum/1.19.0 \
+    crate://crates.io/typenum/1.20.1 \
     crate://crates.io/ucd-trie/0.1.7 \
     crate://crates.io/unicode-ident/1.0.24 \
     crate://crates.io/unicode-linebreak/0.1.5 \
     crate://crates.io/unicode-width/0.2.2 \
-    crate://crates.io/unicode-xid/0.2.6 \
     crate://crates.io/unscanny/0.1.0 \
     crate://crates.io/url/2.5.8 \
     crate://crates.io/utf8_iter/1.0.4 \
@@ -247,16 +241,10 @@ SRC_URI += " \
     crate://crates.io/vte/0.14.1 \
     crate://crates.io/walkdir/2.5.0 \
     crate://crates.io/wasi/0.11.1+wasi-snapshot-preview1 \
-    crate://crates.io/wasi/0.14.7+wasi-0.2.4 \
-    crate://crates.io/wasip2/1.0.2+wasi-0.2.9 \
-    crate://crates.io/wasip3/0.4.0+wasi-0.3.0-rc-2026-01-06 \
     crate://crates.io/wasm-bindgen/0.2.114 \
     crate://crates.io/wasm-bindgen-macro/0.2.114 \
     crate://crates.io/wasm-bindgen-macro-support/0.2.114 \
     crate://crates.io/wasm-bindgen-shared/0.2.114 \
-    crate://crates.io/wasm-encoder/0.244.0 \
-    crate://crates.io/wasm-metadata/0.244.0 \
-    crate://crates.io/wasmparser/0.244.0 \
     crate://crates.io/winapi-util/0.1.11 \
     crate://crates.io/windows/0.61.3 \
     crate://crates.io/windows-collections/0.2.0 \
@@ -282,12 +270,6 @@ SRC_URI += " \
     crate://crates.io/windows_x86_64_gnullvm/0.52.6 \
     crate://crates.io/windows_x86_64_msvc/0.52.6 \
     crate://crates.io/winnow/1.0.3 \
-    crate://crates.io/wit-bindgen/0.51.0 \
-    crate://crates.io/wit-bindgen-core/0.51.0 \
-    crate://crates.io/wit-bindgen-rust/0.51.0 \
-    crate://crates.io/wit-bindgen-rust-macro/0.51.0 \
-    crate://crates.io/wit-component/0.244.0 \
-    crate://crates.io/wit-parser/0.244.0 \
     crate://crates.io/writeable/0.6.2 \
     crate://crates.io/xattr/1.6.1 \
     crate://crates.io/xz2/0.1.7 \
@@ -315,9 +297,9 @@ SRC_URI[anstyle-query-1.1.5.sha256sum] = "40c48f72fd53cd289104fc64099abca73db416
 SRC_URI[anstyle-wincon-3.0.11.sha256sum] = "291e6a250ff86cd4a820112fb8898808a366d8f9f58ce16d1f538353ad55747d"
 SRC_URI[anyhow-1.0.103.sha256sum] = "2a4385e2e34eb35d6b3efe798b9eb88096925d87726c0798709bf56d9ed84af3"
 SRC_URI[arcstr-1.2.0.sha256sum] = "03918c3dbd7701a85c6b9887732e2921175f26c350b4563841d0958c21d57e6d"
-SRC_URI[arrayvec-0.7.7.sha256sum] = "f02882884d3e1bc524fb12c79f107f6ad0e1cfd498c536ffb494301740995dfe"
+SRC_URI[arrayvec-0.7.8.sha256sum] = "d3fb67a6e08acf24fdeccbac2cb6ac4305825bd1f117462e0e6f2f193345ad56"
 SRC_URI[astral-tokio-tar-0.6.3.sha256sum] = "08648fef353ab39a9d26f909ad53fc4f071be4c91853b78523f5cc3d9e5ebffd"
-SRC_URI[astral-version-ranges-0.2.0.sha256sum] = "086f936efdefab117f5a72367fb3d68c4fded8ba5a7008e3c63365eecf723822"
+SRC_URI[astral-version-ranges-0.2.1.sha256sum] = "14445f6708e9a60d5098b6d6f99dbe7b5b347178b2736e1fad7a87b04e289791"
 SRC_URI[astral_async_zip-0.0.20.sha256sum] = "bd939d79959c3f49a648a1d7857d63cc62548725a6b060b8dbf0ea5c92470b63"
 SRC_URI[async-compression-0.4.19.sha256sum] = "06575e6a9673580f52661c92107baabffbf41e2141373441cbcdc47cb733003c"
 SRC_URI[autocfg-1.5.0.sha256sum] = "c08606f8c3cbf4ce6ec8e28fb0014a2c086708fe954eaa885384a6165172e7e8"
@@ -342,7 +324,7 @@ SRC_URI[clap_builder-4.6.0.sha256sum] = "714a53001bf66416adb0e2ef5ac857140e7dc3a
 SRC_URI[clap_derive-4.6.1.sha256sum] = "f2ce8604710f6733aa641a2b3731eaa1e8b3d9973d5e3565da11800813f997a9"
 SRC_URI[clap_lex-1.1.0.sha256sum] = "c8d4a3bb8b1e0c1050499d1815f5ab16d04f0959b233085fb31653fbfc9d98f9"
 SRC_URI[colorchoice-1.0.5.sha256sum] = "1d07550c9036bf2ae0c684c4297d503f838287c83c53686d05370d0e139ae570"
-SRC_URI[console-0.16.3.sha256sum] = "d64e8af5551369d19cf50138de61f1c42074ab970f74e99be916646777f8fc87"
+SRC_URI[console-0.16.4.sha256sum] = "4fe5f465a4f6fee88fad41b85d990f84c835335e85b5d9e6e63e0d06d28cba7c"
 SRC_URI[cpufeatures-0.2.17.sha256sum] = "59ed5838eebb26a2bb2e58f6d5b5316989ae9d08bab10e0e6d103e656d1b0280"
 SRC_URI[crc32fast-1.5.0.sha256sum] = "9481c1c90cbf2ac953f07c8d4a58aa3945c425b7185c9154d67a65e4230da511"
 SRC_URI[crypto-common-0.1.7.sha256sum] = "78c8292055d1c1df0cce5d180393dc8cce0abec0a7102adb6c7b1eef6016d60a"
@@ -372,7 +354,7 @@ SRC_URI[flate2-1.1.9.sha256sum] = "843fba2746e448b37e26a819579957415c8cef339bf08
 SRC_URI[foldhash-0.1.5.sha256sum] = "d9c4f5dac5e15c24eb999c26181a6ca40b39fe946cbe4c263c7209467bc83af2"
 SRC_URI[foldhash-0.2.0.sha256sum] = "77ce24cb58228fbb8aa041425bb1050850ac19177686ea6e0f41a70416f56fdb"
 SRC_URI[form_urlencoded-1.2.2.sha256sum] = "cb4cb245038516f5f85277875cdaa4f7d2c9a0fa0468de06ed190163b1581fcf"
-SRC_URI[fs-err-3.3.0.sha256sum] = "73fde052dbfc920003cfd2c8e2c6e6d4cc7c1091538c3a24226cec0665ab08c0"
+SRC_URI[fs-err-3.3.1.sha256sum] = "b91aa448ca50d7e79433bdf3ee8d99215430d2ec02ade5aefab2a073a1822e8a"
 SRC_URI[futures-0.3.32.sha256sum] = "8b147ee9d1f6d097cef9ce628cd2ee62288d963e16fb287bd9286455b241382d"
 SRC_URI[futures-channel-0.3.32.sha256sum] = "07bbe89c50d7a535e539b8c17bc0b49bdb77747034daa8087407d655f3f7cc1d"
 SRC_URI[futures-core-0.3.32.sha256sum] = "7e3450815272ef58cec6d564423f6e755e25379b217b0bc688e295ba24df6b1d"
@@ -384,8 +366,7 @@ SRC_URI[futures-sink-0.3.32.sha256sum] = "c39754e157331b013978ec91992bde1ac08984
 SRC_URI[futures-task-0.3.32.sha256sum] = "037711b3d59c33004d3856fbdc83b99d4ff37a24768fa1be9ce3538a1cde4393"
 SRC_URI[futures-util-0.3.32.sha256sum] = "389ca41296e6190b48053de0321d02a77f32f8a5d2461dd38762c0593805c6d6"
 SRC_URI[generic-array-0.14.7.sha256sum] = "85649ca51fd72272d7821adaf274ad91c288277713d9c18820d8499a7ff69e9a"
-SRC_URI[getrandom-0.3.3.sha256sum] = "26145e563e54f2cadc477553f1ec5ee650b00862f0a58bcd12cbdc5f0ea2d2f4"
-SRC_URI[getrandom-0.4.1.sha256sum] = "139ef39800118c7683f2fd3c98c1b23c09ae076556b435f8e9064ae108aaeeec"
+SRC_URI[getrandom-0.4.3.sha256sum] = "300e883d756b2e4ec94e02791f39b04b522276138852cfc41d9fb7e904106099"
 SRC_URI[globset-0.4.18.sha256sum] = "52dfc19153a48bde0cbd630453615c8151bce3a5adfac7a0aebfbf0a1e1f57e3"
 SRC_URI[gloo-timers-0.3.0.sha256sum] = "bbb143cf96099802033e0d4f4963b19fd2e0b728bcf076cd9cf7f6634f092994"
 SRC_URI[hashbrown-0.15.5.sha256sum] = "9229cfe53dfd69f0609a49f65461bd93001ea1ef889cd5529dd176593f5338a1"
@@ -399,7 +380,6 @@ SRC_URI[icu_normalizer_data-2.1.1.sha256sum] = "7aedcccd01fc5fe81e6b489c15b247b8
 SRC_URI[icu_properties-2.1.2.sha256sum] = "020bfc02fe870ec3a66d93e677ccca0562506e5872c650f893269e08615d74ec"
 SRC_URI[icu_properties_data-2.1.2.sha256sum] = "616c294cf8d725c6afcd8f55abc17c56464ef6211f9ed59cccffe534129c77af"
 SRC_URI[icu_provider-2.1.1.sha256sum] = "85962cf0ce02e1e0a629cc34e7ca3e373ce20dda4c4d7294bbd0bf1fdb59e614"
-SRC_URI[id-arena-2.3.0.sha256sum] = "3d3067d79b975e8844ca9eb072e16b31c3c1c36928edf9c6789548c524d0d954"
 SRC_URI[idna-1.1.0.sha256sum] = "3b0875f23caa03898994f6ddc501886a45c7d3d62d04d2d90788d47be1b1e4de"
 SRC_URI[idna_adapter-1.2.1.sha256sum] = "3acae9609540aa318d1bc588455225fb2085b9ed0c4f6bd0d9d5bcd86f1a0344"
 SRC_URI[indexmap-2.14.0.sha256sum] = "d466e9454f08e4a911e14806c24e16fba1b4c121d1ea474396f396069cf949d9"
@@ -408,15 +388,14 @@ SRC_URI[insta-1.48.0.sha256sum] = "86f0f8fee8c926415c58d6ae43a08523a26faccb2323f
 SRC_URI[is_terminal_polyfill-1.70.2.sha256sum] = "a6cb138bb79a146c1bd460005623e142ef0181e3d0219cb493e02f7d08a35695"
 SRC_URI[itertools-0.14.0.sha256sum] = "2b192c782037fadd9cfa75548310488aabdbf3d2da73885b31bd0abd03351285"
 SRC_URI[itoa-1.0.17.sha256sum] = "92ecc6618181def0457392ccd0ee51198e065e016d1d527a7ac1b6dc7c1f09d2"
-SRC_URI[jiff-0.2.29.sha256sum] = "34f877a98676d2fb664698d74cc6a51ce6c484ce8c770f05d0108ec9090aeb46"
-SRC_URI[jiff-static-0.2.29.sha256sum] = "0666b5ab5ecaca213fc2a85b8c0083d9004e84ee2d5f9a7e0017aaf50986f25f"
+SRC_URI[jiff-0.2.31.sha256sum] = "ccfe6121cbe750cf81efa362d85c0bde7ea298ec43092d3a193baca59cdbd634"
+SRC_URI[jiff-static-0.2.31.sha256sum] = "e165e897f662d428f3cd3828a919dbe067c2d42bb1031eede74ef9d27ecdedd2"
 SRC_URI[jiff-tzdb-0.1.6.sha256sum] = "c900ef84826f1338a557697dc8fc601df9ca9af4ac137c7fb61d4c6f2dfd3076"
 SRC_URI[jiff-tzdb-platform-0.1.3.sha256sum] = "875a5a69ac2bab1a891711cf5eccbec1ce0341ea805560dcd90b7a2e925132e8"
-SRC_URI[jobserver-0.1.34.sha256sum] = "9afb3de4395d6b3e67a780b6de64b51c978ecf11cb9a462c66be7d4ca9039d33"
+SRC_URI[jobserver-0.1.35.sha256sum] = "1c00acbd29eabad4a2392fa0e921c874934dbbf4194312ad20f04a0ed67a3cb3"
 SRC_URI[js-sys-0.3.91.sha256sum] = "b49715b7073f385ba4bc528e5747d02e66cb39c6146efb66b781f131f0fb399c"
 SRC_URI[junction-2.0.0.sha256sum] = "160f2eade097f30263b548aae5deb12ad349c909baa710fa24b92c9090b2e006"
 SRC_URI[lazy_static-1.5.0.sha256sum] = "bbd2bcb4c963f2ddae06a2efc7e9f3591312473c50c6685e1f298068316e66fe"
-SRC_URI[leb128fmt-0.1.0.sha256sum] = "09edd9e8b54e49e587e4f6295a7d29c3ea94d469cb40ab8ca70b288248a81db2"
 SRC_URI[libc-0.2.186.sha256sum] = "68ab91017fe16c622486840e4c83c9a37afeff978bd239b5293d61ece587de66"
 SRC_URI[linux-raw-sys-0.4.15.sha256sum] = "d26c52dbd32dccf2d10cac7725f8eae5296885fb5703b261f7d0a0739ec807ab"
 SRC_URI[linux-raw-sys-0.12.1.sha256sum] = "32a66949e030da00e8c7d4434b251670a91556f4144941d37452769c25d58a53"
@@ -452,7 +431,6 @@ SRC_URI[pkg-config-0.3.32.sha256sum] = "7edddbd0b52d732b21ad9a5fab5c704c14cd949e
 SRC_URI[portable-atomic-1.13.1.sha256sum] = "c33a9471896f1c69cecef8d20cbe2f7accd12527ce60845ff44c153bb2a21b49"
 SRC_URI[portable-atomic-util-0.2.6.sha256sum] = "091397be61a01d4be58e7841595bd4bfedb15f1cd54977d79b8271e94ed799a3"
 SRC_URI[potential_utf-0.1.4.sha256sum] = "b73949432f5e2a09657003c25bca5e19a0e9c84f8058ca374f49e0ebe605af77"
-SRC_URI[prettyplease-0.2.37.sha256sum] = "479ca8adacdd7ce8f1fb39ce9ecccbfe93a3f1344b3d0d97f20bc0196208f62b"
 SRC_URI[proc-macro-error-attr2-2.0.0.sha256sum] = "96de42df36bb9bba5542fe9f1a054b8cc87e172759a1868aa05c1f3acc89dfc5"
 SRC_URI[proc-macro-error2-2.0.1.sha256sum] = "11ec05c52be0a07b08061f7dd003e7d7092e0472bc731b4af7bb1ef876109802"
 SRC_URI[proc-macro2-1.0.106.sha256sum] = "8fd00f0bb2e90d81d1044c2b32617f68fcb9fa3bb7640c23e9c748e53fb30934"
@@ -460,7 +438,7 @@ SRC_URI[ptr_meta-0.3.1.sha256sum] = "0b9a0cf95a1196af61d4f1cbdab967179516d9a4a43
 SRC_URI[ptr_meta_derive-0.3.1.sha256sum] = "7347867d0a7e1208d93b46767be83e2b8f978c3dad35f775ac8d8847551d6fe1"
 SRC_URI[quote-1.0.46.sha256sum] = "dfbc457d0c7a0759a614551b11a6409e5951f6c7537be1f1b7682b9ae9230368"
 SRC_URI[quoted_printable-0.5.1.sha256sum] = "640c9bd8497b02465aeef5375144c26062e0dcd5939dfcbb0f5db76cb8c17c73"
-SRC_URI[r-efi-5.3.0.sha256sum] = "69cdb34c158ceb288df11e18b4bd39de994f6657d83847bdffdbd7f346754b0f"
+SRC_URI[r-efi-6.0.0.sha256sum] = "f8dcc9c7d52a811697d2151c701e0d08956f92b0e24136cf4cf27b57a6a0d9bf"
 SRC_URI[rancor-0.1.1.sha256sum] = "a063ea72381527c2a0561da9c80000ef822bdd7c3241b1cc1b12100e3df081ee"
 SRC_URI[redox_syscall-0.5.15.sha256sum] = "7e8af0dde094006011e6a740d4879319439489813bd0bcdc7d821beaeeff48ec"
 SRC_URI[ref-cast-1.0.25.sha256sum] = "f354300ae66f76f1c85c5f84693f0ce81d747e2c3f21a45fef496d89c960bf7d"
@@ -470,9 +448,9 @@ SRC_URI[regex-1.12.4.sha256sum] = "f1292b7759ae1cb9ec195452d1390a074f0cd8541ab7a
 SRC_URI[regex-automata-0.4.14.sha256sum] = "6e1dd4122fc1595e8162618945476892eefca7b88c52820e74af6262213cae8f"
 SRC_URI[regex-syntax-0.8.11.sha256sum] = "d6f6ff9a378485b298a5286656da665ba74413d36db0979633275d2e708145d4"
 SRC_URI[rend-0.5.3.sha256sum] = "cadadef317c2f20755a64d7fdc48f9e7178ee6b0e1f7fce33fa60f1d68a276e6"
-SRC_URI[rkyv-0.8.16.sha256sum] = "73389e0c99e664f919275ab5b5b0471391fe9a8de61e1dff9b1eaf56a90f16e3"
-SRC_URI[rkyv_derive-0.8.16.sha256sum] = "5d2ed0b54125315fb36bd021e82d314d1c126548f871634b483f46b31d13cac6"
-SRC_URI[rustc-hash-2.1.2.sha256sum] = "94300abf3f1ae2e2b8ffb7b58043de3d399c73fa6f4b73826402a5c457614dbe"
+SRC_URI[rkyv-0.8.17.sha256sum] = "815cc8a37159a463064825246cadb07961e25cd9885908606f6d08a98d8f8874"
+SRC_URI[rkyv_derive-0.8.17.sha256sum] = "c0ed1a78a1b19d184b0daa629dd9a024573173ec7d485b287cb369fb3607cc1c"
+SRC_URI[rustc-hash-2.1.3.sha256sum] = "6b1e7f9a428571be2dc5bc0505c13fb6bf936822b894ec87abf8a08a4e51742d"
 SRC_URI[rustix-0.38.44.sha256sum] = "fdb5bc1ae2baa591800df16c9ca78619bf65c0488b41b96ccec5d11220d8c154"
 SRC_URI[rustix-1.1.4.sha256sum] = "b6fe4565b9518b83ef4f91bb47ce29620ca828bd32cb7e408f0062e9930ba190"
 SRC_URI[rustversion-1.0.22.sha256sum] = "b39cdef0fa800fc44525c84ccb54a029961a8215f9619753635a9c0d2538d46d"
@@ -483,7 +461,6 @@ SRC_URI[schemars_derive-1.2.1.sha256sum] = "7d115b50f4aaeea07e79c1912f645c7513d8
 SRC_URI[scopeguard-1.2.0.sha256sum] = "94143f37725109f92c262ed2cf5e59bce7498c01bcc1502d7b9afe439a4e9f49"
 SRC_URI[seahash-4.1.0.sha256sum] = "1c107b6f4780854c8b126e228ea8869f4d7b71260f962fefb57b996b8959ba6b"
 SRC_URI[self-replace-1.5.0.sha256sum] = "03ec815b5eab420ab893f63393878d89c90fdd94c0bcc44c07abb8ad95552fb7"
-SRC_URI[semver-1.0.27.sha256sum] = "d767eb0aabc880b29956c35734170f26ed551a859dbd361d140cdbeca61ab1e2"
 SRC_URI[serde-1.0.228.sha256sum] = "9a8e94ea7f378bd32cbbd37198a4a91436180c5bb472411e48b5ec2e2124ae9e"
 SRC_URI[serde-untagged-0.1.9.sha256sum] = "f9faf48a4a2d2693be24c6289dbe26552776eb7737074e6722891fadbe6c5058"
 SRC_URI[serde_core-1.0.228.sha256sum] = "41d385c7d4ca58e59fc732af25c3983b67ac852c1a25000afe1175de458b67ad"
@@ -534,12 +511,11 @@ SRC_URI[tracing-subscriber-0.3.23.sha256sum] = "cb7f578e5945fb242538965c2d0b0441
 SRC_URI[tracing-test-0.2.6.sha256sum] = "19a4c448db514d4f24c5ddb9f73f2ee71bfb24c526cf0c570ba142d1119e0051"
 SRC_URI[tracing-test-macro-0.2.6.sha256sum] = "ad06847b7afb65c7866a36664b75c40b895e318cea4f71299f013fb22965329d"
 SRC_URI[typeid-1.0.3.sha256sum] = "bc7d623258602320d5c55d1bc22793b57daff0ec7efc270ea7d55ce1d5f5471c"
-SRC_URI[typenum-1.19.0.sha256sum] = "562d481066bde0658276a35467c4af00bdc6ee726305698a55b86e61d7ad82bb"
+SRC_URI[typenum-1.20.1.sha256sum] = "b6f5e870be6c3b371b77fe0ee0bafb859fa4964b4404c27de1d380043c4dda20"
 SRC_URI[ucd-trie-0.1.7.sha256sum] = "2896d95c02a80c6d6a5d6e953d479f5ddf2dfdb6a244441010e373ac0fb88971"
 SRC_URI[unicode-ident-1.0.24.sha256sum] = "e6e4313cd5fcd3dad5cafa179702e2b244f760991f45397d14d4ebf38247da75"
 SRC_URI[unicode-linebreak-0.1.5.sha256sum] = "3b09c83c3c29d37506a3e260c08c03743a6bb66a9cd432c6934ab501a190571f"
 SRC_URI[unicode-width-0.2.2.sha256sum] = "b4ac048d71ede7ee76d585517add45da530660ef4390e49b098733c6e897f254"
-SRC_URI[unicode-xid-0.2.6.sha256sum] = "ebc1c04c71510c7f702b52b7c350734c9ff1295c464a03335b00bb84fc54f853"
 SRC_URI[unscanny-0.1.0.sha256sum] = "e9df2af067a7953e9c3831320f35c1cc0600c30d44d9f7a12b01db1cd88d6b47"
 SRC_URI[url-2.5.8.sha256sum] = "ff67a8a4397373c3ef660812acab3268222035010ab8680ec4215f38ba3d0eed"
 SRC_URI[utf8_iter-1.0.4.sha256sum] = "b6c140620e7ffbb22c2dee59cafe6084a59b5ffc27a8859a5f0d494b5d52b6be"
@@ -550,16 +526,10 @@ SRC_URI[version_check-0.9.5.sha256sum] = "0b928f33d975fc6ad9f86c8f283853ad26bdd5
 SRC_URI[vte-0.14.1.sha256sum] = "231fdcd7ef3037e8330d8e17e61011a2c244126acc0a982f4040ac3f9f0bc077"
 SRC_URI[walkdir-2.5.0.sha256sum] = "29790946404f91d9c5d06f9874efddea1dc06c5efe94541a7d6863108e3a5e4b"
 SRC_URI[wasi-0.11.1+wasi-snapshot-preview1.sha256sum] = "ccf3ec651a847eb01de73ccad15eb7d99f80485de043efb2f370cd654f4ea44b"
-SRC_URI[wasi-0.14.7+wasi-0.2.4.sha256sum] = "883478de20367e224c0090af9cf5f9fa85bed63a95c1abf3afc5c083ebc06e8c"
-SRC_URI[wasip2-1.0.2+wasi-0.2.9.sha256sum] = "9517f9239f02c069db75e65f174b3da828fe5f5b945c4dd26bd25d89c03ebcf5"
-SRC_URI[wasip3-0.4.0+wasi-0.3.0-rc-2026-01-06.sha256sum] = "5428f8bf88ea5ddc08faddef2ac4a67e390b88186c703ce6dbd955e1c145aca5"
 SRC_URI[wasm-bindgen-0.2.114.sha256sum] = "6532f9a5c1ece3798cb1c2cfdba640b9b3ba884f5db45973a6f442510a87d38e"
 SRC_URI[wasm-bindgen-macro-0.2.114.sha256sum] = "18a2d50fcf105fb33bb15f00e7a77b772945a2ee45dcf454961fd843e74c18e6"
 SRC_URI[wasm-bindgen-macro-support-0.2.114.sha256sum] = "03ce4caeaac547cdf713d280eda22a730824dd11e6b8c3ca9e42247b25c631e3"
 SRC_URI[wasm-bindgen-shared-0.2.114.sha256sum] = "75a326b8c223ee17883a4251907455a2431acc2791c98c26279376490c378c16"
-SRC_URI[wasm-encoder-0.244.0.sha256sum] = "990065f2fe63003fe337b932cfb5e3b80e0b4d0f5ff650e6985b1048f62c8319"
-SRC_URI[wasm-metadata-0.244.0.sha256sum] = "bb0e353e6a2fbdc176932bbaab493762eb1255a7900fe0fea1a2f96c296cc909"
-SRC_URI[wasmparser-0.244.0.sha256sum] = "47b807c72e1bac69382b3a6fb3dbe8ea4c0ed87ff5629b8685ae6b9a611028fe"
 SRC_URI[winapi-util-0.1.11.sha256sum] = "c2a7b1c03c876122aa43f3020e6c3c3ee5c05081c9a00739faf7503aeba10d22"
 SRC_URI[windows-0.61.3.sha256sum] = "9babd3a767a4c1aef6900409f85f5d53ce2544ccdfaa86dad48c91782c6d6893"
 SRC_URI[windows-collections-0.2.0.sha256sum] = "3beeceb5e5cfd9eb1d76b381630e82c4241ccd0d27f1a39ed41b2760b255c5e8"
@@ -585,12 +555,6 @@ SRC_URI[windows_x86_64_gnu-0.52.6.sha256sum] = "147a5c80aabfbf0c7d901cb5895d1de3
 SRC_URI[windows_x86_64_gnullvm-0.52.6.sha256sum] = "24d5b23dc417412679681396f2b49f3de8c1473deb516bd34410872eff51ed0d"
 SRC_URI[windows_x86_64_msvc-0.52.6.sha256sum] = "589f6da84c646204747d1270a2a5661ea66ed1cced2631d546fdfb155959f9ec"
 SRC_URI[winnow-1.0.3.sha256sum] = "0592e1c9d151f854e6fd382574c3a0855250e1d9b2f99d9281c6e6391af352f1"
-SRC_URI[wit-bindgen-0.51.0.sha256sum] = "d7249219f66ced02969388cf2bb044a09756a083d0fab1e566056b04d9fbcaa5"
-SRC_URI[wit-bindgen-core-0.51.0.sha256sum] = "ea61de684c3ea68cb082b7a88508a8b27fcc8b797d738bfc99a82facf1d752dc"
-SRC_URI[wit-bindgen-rust-0.51.0.sha256sum] = "b7c566e0f4b284dd6561c786d9cb0142da491f46a9fbed79ea69cdad5db17f21"
-SRC_URI[wit-bindgen-rust-macro-0.51.0.sha256sum] = "0c0f9bfd77e6a48eccf51359e3ae77140a7f50b1e2ebfe62422d8afdaffab17a"
-SRC_URI[wit-component-0.244.0.sha256sum] = "9d66ea20e9553b30172b5e831994e35fbde2d165325bec84fc43dbf6f4eb9cb2"
-SRC_URI[wit-parser-0.244.0.sha256sum] = "ecc8ac4bc1dc3381b7f59c34f00b67e18f910c2c0f50015669dde7def656a736"
 SRC_URI[writeable-0.6.2.sha256sum] = "9edde0db4769d2dc68579893f2306b26c6ecfbe0ef499b013d731b7b9247e0b9"
 SRC_URI[xattr-1.6.1.sha256sum] = "32e45ad4206f6d2479085147f02bc2ef834ac85886624a23575ae137c8aa8156"
 SRC_URI[xz2-0.1.7.sha256sum] = "388c44dc09d76f1536602ead6d325eb532f5c122f17782bd57fb47baeeb767e2"
diff --git a/meta/recipes-devtools/python/python3-uv-build_0.11.28.bb b/meta/recipes-devtools/python/python3-uv-build_0.11.29.bb
similarity index 92%
rename from meta/recipes-devtools/python/python3-uv-build_0.11.28.bb
rename to meta/recipes-devtools/python/python3-uv-build_0.11.29.bb
index 08ab097482..a2fdce47a0 100644
--- a/meta/recipes-devtools/python/python3-uv-build_0.11.28.bb
+++ b/meta/recipes-devtools/python/python3-uv-build_0.11.29.bb
@@ -11,7 +11,7 @@ LIC_FILES_CHKSUM = "file://LICENSE-APACHE;md5=86d3f3a95c324c9479bd8986968f4327 \
                     file://crates/uv-pep508/License-Apache;md5=e23fadd6ceef8c618fc1c65191d846fa \
                     file://crates/uv-pep508/License-BSD;md5=ef7a6027dc4c2389b9afad7e690274c7"
 
-SRC_URI[sha256sum] = "daba66fd25a9a82caa23949686e967cbb69fd056177e991650643186057adaef"
+SRC_URI[sha256sum] = "7dd16d50366f410ae494a27be20b45206feeac37d99dc53abfa1a04410069b78"
 
 require ${BPN}-crates.inc
 
-- 
2.47.1


--===============2104764467314560601==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: attachment; filename="buildhistory-diff-full.txt"

packages/x86-64-v3-poky-linux/python3-uv-build: SRC_URI changed from "https://files.pythonhosted.org/packages/source/u/uv_build/uv_build-0.11.28.tar.gz;downloadfilename=uv_build-0.11.28.tar.gz crate://crates.io/adler2/2.0.1 crate://crates.io/aho-corasick/1.1.4 crate://crates.io/allocator-api2/0.2.21 crate://crates.io/anstream/1.0.0 crate://crates.io/anstyle/1.0.14 crate://crates.io/anstyle-parse/1.0.0 crate://crates.io/anstyle-query/1.1.5 crate://crates.io/anstyle-wincon/3.0.11 crate://crates.io/anyhow/1.0.103 crate://crates.io/arcstr/1.2.0 crate://crates.io/arrayvec/0.7.7 crate://crates.io/astral-tokio-tar/0.6.3 crate://crates.io/astral-version-ranges/0.2.0 crate://crates.io/astral_async_zip/0.0.20 crate://crates.io/async-compression/0.4.19 crate://crates.io/autocfg/1.5.0 crate://crates.io/backon/1.6.0 crate://crates.io/base64/0.22.1 crate://crates.io/bitflags/1.3.2 crate://crates.io/bitflags/2.13.0 crate://crates.io/block-buffer/0.10.4 crate://crates.io/boxcar/0.2.14 crate://crates
 .io/bstr/1.12.1 crate://crates.io/bumpalo/3.20.2 crate://crates.io/bytecheck/0.8.2 crate://crates.io/bytecheck_derive/0.8.2 crate://crates.io/bytes/1.12.0 crate://crates.io/bzip2/0.5.2 crate://crates.io/bzip2-sys/0.1.13+1.0.8 crate://crates.io/cc/1.2.57 crate://crates.io/cfg-if/1.0.4 crate://crates.io/charset/0.1.5 crate://crates.io/clap/4.6.1 crate://crates.io/clap_builder/4.6.0 crate://crates.io/clap_derive/4.6.1 crate://crates.io/clap_lex/1.1.0 crate://crates.io/colorchoice/1.0.5 crate://crates.io/console/0.16.3 crate://crates.io/cpufeatures/0.2.17 crate://crates.io/crc32fast/1.5.0 crate://crates.io/crypto-common/0.1.7 crate://crates.io/csv/1.4.0 crate://crates.io/csv-core/0.1.13 crate://crates.io/data-encoding/2.11.0 crate://crates.io/defmt/1.1.0 crate://crates.io/defmt-macros/1.1.0 crate://crates.io/defmt-parser/1.0.0 crate://crates.io/digest/0.10.7 crate://crates.io/displaydoc/0.2.5 crate://crates.io/dunce/1.0.5 crate://crates.io/dyn-clone/1.0.20 crate://crates.io/either/1.16.
 0 crate://crates.io/encode_unicode/1.0.0 crate://crates.io/encoding_rs/0.8.35 crate://crates.io/encoding_rs_io/0.1.7 crate://crates.io/enumflags2/0.7.12 crate://crates.io/enumflags2_derive/0.7.12 crate://crates.io/equivalent/1.0.2 crate://crates.io/erased-serde/0.4.10 crate://crates.io/errno/0.3.14 crate://crates.io/fastrand/2.4.1 crate://crates.io/find-msvc-tools/0.1.9 crate://crates.io/fixedbitset/0.5.7 crate://crates.io/flate2/1.1.9 crate://crates.io/foldhash/0.1.5 crate://crates.io/foldhash/0.2.0 crate://crates.io/form_urlencoded/1.2.2 crate://crates.io/fs-err/3.3.0 crate://crates.io/futures/0.3.32 crate://crates.io/futures-channel/0.3.32 crate://crates.io/futures-core/0.3.32 crate://crates.io/futures-executor/0.3.32 crate://crates.io/futures-io/0.3.32 crate://crates.io/futures-lite/2.6.1 crate://crates.io/futures-macro/0.3.32 crate://crates.io/futures-sink/0.3.32 crate://crates.io/futures-task/0.3.32 crate://crates.io/futures-util/0.3.32 crate://crates.io/generic-array/0.14.7 c
 rate://crates.io/getrandom/0.3.3 crate://crates.io/getrandom/0.4.1 crate://crates.io/globset/0.4.18 crate://crates.io/gloo-timers/0.3.0 crate://crates.io/hashbrown/0.15.5 crate://crates.io/hashbrown/0.17.1 crate://crates.io/heck/0.5.0 crate://crates.io/hex/0.4.3 crate://crates.io/icu_collections/2.1.1 crate://crates.io/icu_locale_core/2.1.1 crate://crates.io/icu_normalizer/2.1.1 crate://crates.io/icu_normalizer_data/2.1.1 crate://crates.io/icu_properties/2.1.2 crate://crates.io/icu_properties_data/2.1.2 crate://crates.io/icu_provider/2.1.1 crate://crates.io/id-arena/2.3.0 crate://crates.io/idna/1.1.0 crate://crates.io/idna_adapter/1.2.1 crate://crates.io/indexmap/2.14.0 crate://crates.io/indoc/2.0.7 crate://crates.io/insta/1.48.0 crate://crates.io/is_terminal_polyfill/1.70.2 crate://crates.io/itertools/0.14.0 crate://crates.io/itoa/1.0.17 crate://crates.io/jiff/0.2.29 crate://crates.io/jiff-static/0.2.29 crate://crates.io/jiff-tzdb/0.1.6 crate://crates.io/jiff-tzdb-platform/0.1.3 cr
 ate://crates.io/jobserver/0.1.34 crate://crates.io/js-sys/0.3.91 crate://crates.io/junction/2.0.0 crate://crates.io/lazy_static/1.5.0 crate://crates.io/leb128fmt/0.1.0 crate://crates.io/libc/0.2.186 crate://crates.io/linux-raw-sys/0.4.15 crate://crates.io/linux-raw-sys/0.12.1 crate://crates.io/litemap/0.8.1 crate://crates.io/lock_api/0.4.14 crate://crates.io/log/0.4.29 crate://crates.io/lzma-sys/0.1.20 crate://crates.io/mailparse/0.16.1 crate://crates.io/matchers/0.2.0 crate://crates.io/memchr/2.8.2 crate://crates.io/miniz_oxide/0.8.9 crate://crates.io/mio/1.2.0 crate://crates.io/munge/0.4.7 crate://crates.io/munge_macro/0.4.7 crate://crates.io/nu-ansi-term/0.50.3 crate://crates.io/once_cell/1.21.4 crate://crates.io/once_cell_polyfill/1.70.2 crate://crates.io/owo-colors/4.3.0 crate://crates.io/parking/2.2.1 crate://crates.io/parking_lot/0.12.5 crate://crates.io/parking_lot_core/0.9.12 crate://crates.io/path-slash/0.2.1 crate://crates.io/percent-encoding/2.3.2 crate://crates.io/pest/
 2.8.6 crate://crates.io/pest_derive/2.8.6 crate://crates.io/pest_generator/2.8.6 crate://crates.io/pest_meta/2.8.6 crate://crates.io/petgraph/0.8.3 crate://crates.io/pin-project/1.1.11 crate://crates.io/pin-project-internal/1.1.11 crate://crates.io/pin-project-lite/0.2.17 crate://crates.io/pkg-config/0.3.32 crate://crates.io/portable-atomic/1.13.1 crate://crates.io/portable-atomic-util/0.2.6 crate://crates.io/potential_utf/0.1.4 crate://crates.io/prettyplease/0.2.37 crate://crates.io/proc-macro-error-attr2/2.0.0 crate://crates.io/proc-macro-error2/2.0.1 crate://crates.io/proc-macro2/1.0.106 crate://crates.io/ptr_meta/0.3.1 crate://crates.io/ptr_meta_derive/0.3.1 crate://crates.io/quote/1.0.46 crate://crates.io/quoted_printable/0.5.1 crate://crates.io/r-efi/5.3.0 crate://crates.io/rancor/0.1.1 crate://crates.io/redox_syscall/0.5.15 crate://crates.io/ref-cast/1.0.25 crate://crates.io/ref-cast-impl/1.0.25 crate://crates.io/reflink-copy/0.1.30 crate://crates.io/regex/1.12.4 crate://crat
 es.io/regex-automata/0.4.14 crate://crates.io/regex-syntax/0.8.11 crate://crates.io/rend/0.5.3 crate://crates.io/rkyv/0.8.16 crate://crates.io/rkyv_derive/0.8.16 crate://crates.io/rustc-hash/2.1.2 crate://crates.io/rustix/0.38.44 crate://crates.io/rustix/1.1.4 crate://crates.io/rustversion/1.0.22 crate://crates.io/ryu/1.0.23 crate://crates.io/same-file/1.0.6 crate://crates.io/schemars/1.2.1 crate://crates.io/schemars_derive/1.2.1 crate://crates.io/scopeguard/1.2.0 crate://crates.io/seahash/4.1.0 crate://crates.io/self-replace/1.5.0 crate://crates.io/semver/1.0.27 crate://crates.io/serde/1.0.228 crate://crates.io/serde-untagged/0.1.9 crate://crates.io/serde_core/1.0.228 crate://crates.io/serde_derive/1.0.228 crate://crates.io/serde_derive_internals/0.29.1 crate://crates.io/serde_json/1.0.150 crate://crates.io/serde_spanned/1.1.1 crate://crates.io/sha2/0.10.9 crate://crates.io/sharded-slab/0.1.7 crate://crates.io/shlex/1.3.0 crate://crates.io/signal-hook-registry/1.4.8 crate://crates.
 io/simd-adler32/0.3.8 crate://crates.io/simdutf8/0.1.5 crate://crates.io/similar/2.7.0 crate://crates.io/slab/0.4.12 crate://crates.io/smallvec/1.15.2 crate://crates.io/smawk/0.3.2 crate://crates.io/spdx/0.13.4 crate://crates.io/stable_deref_trait/1.2.1 crate://crates.io/strip-ansi-escapes/0.2.1 crate://crates.io/strsim/0.11.1 crate://crates.io/syn/2.0.118 crate://crates.io/synstructure/0.13.2 crate://crates.io/temp-env/0.3.6 crate://crates.io/tempfile/3.27.0 crate://crates.io/terminal_size/0.4.4 crate://crates.io/textwrap/0.16.2 crate://crates.io/thiserror/2.0.18 crate://crates.io/thiserror-impl/2.0.18 crate://crates.io/thread_local/1.1.9 crate://crates.io/tinystr/0.8.2 crate://crates.io/tinyvec/1.11.0 crate://crates.io/tinyvec_macros/0.1.1 crate://crates.io/tokio/1.52.3 crate://crates.io/tokio-macros/2.7.0 crate://crates.io/tokio-stream/0.1.18 crate://crates.io/tokio-util/0.7.18 crate://crates.io/toml/1.1.2+spec-1.1.0 crate://crates.io/toml_datetime/1.1.1+spec-1.1.0 crate://crates
 .io/toml_edit/0.25.12+spec-1.1.0 crate://crates.io/toml_parser/1.1.2+spec-1.1.0 crate://crates.io/toml_writer/1.1.1+spec-1.1.0 crate://crates.io/tracing/0.1.44 crate://crates.io/tracing-attributes/0.1.31 crate://crates.io/tracing-core/0.1.36 crate://crates.io/tracing-log/0.2.0 crate://crates.io/tracing-subscriber/0.3.23 crate://crates.io/tracing-test/0.2.6 crate://crates.io/tracing-test-macro/0.2.6 crate://crates.io/typeid/1.0.3 crate://crates.io/typenum/1.19.0 crate://crates.io/ucd-trie/0.1.7 crate://crates.io/unicode-ident/1.0.24 crate://crates.io/unicode-linebreak/0.1.5 crate://crates.io/unicode-width/0.2.2 crate://crates.io/unicode-xid/0.2.6 crate://crates.io/unscanny/0.1.0 crate://crates.io/url/2.5.8 crate://crates.io/utf8_iter/1.0.4 crate://crates.io/utf8parse/0.2.2 crate://crates.io/uuid/1.23.4 crate://crates.io/valuable/0.1.1 crate://crates.io/version_check/0.9.5 crate://crates.io/vte/0.14.1 crate://crates.io/walkdir/2.5.0 crate://crates.io/wasi/0.11.1+wasi-snapshot-preview1
  crate://crates.io/wasi/0.14.7+wasi-0.2.4 crate://crates.io/wasip2/1.0.2+wasi-0.2.9 crate://crates.io/wasip3/0.4.0+wasi-0.3.0-rc-2026-01-06 crate://crates.io/wasm-bindgen/0.2.114 crate://crates.io/wasm-bindgen-macro/0.2.114 crate://crates.io/wasm-bindgen-macro-support/0.2.114 crate://crates.io/wasm-bindgen-shared/0.2.114 crate://crates.io/wasm-encoder/0.244.0 crate://crates.io/wasm-metadata/0.244.0 crate://crates.io/wasmparser/0.244.0 crate://crates.io/winapi-util/0.1.11 crate://crates.io/windows/0.61.3 crate://crates.io/windows-collections/0.2.0 crate://crates.io/windows-core/0.61.2 crate://crates.io/windows-future/0.2.1 crate://crates.io/windows-implement/0.60.2 crate://crates.io/windows-interface/0.59.3 crate://crates.io/windows-link/0.1.3 crate://crates.io/windows-link/0.2.1 crate://crates.io/windows-numerics/0.2.0 crate://crates.io/windows-result/0.3.4 crate://crates.io/windows-strings/0.4.2 crate://crates.io/windows-sys/0.52.0 crate://crates.io/windows-sys/0.61.2 crate://crate
 s.io/windows-targets/0.52.6 crate://crates.io/windows-threading/0.1.0 crate://crates.io/windows_aarch64_gnullvm/0.52.6 crate://crates.io/windows_aarch64_msvc/0.52.6 crate://crates.io/windows_i686_gnu/0.52.6 crate://crates.io/windows_i686_gnullvm/0.52.6 crate://crates.io/windows_i686_msvc/0.52.6 crate://crates.io/windows_x86_64_gnu/0.52.6 crate://crates.io/windows_x86_64_gnullvm/0.52.6 crate://crates.io/windows_x86_64_msvc/0.52.6 crate://crates.io/winnow/1.0.3 crate://crates.io/wit-bindgen/0.51.0 crate://crates.io/wit-bindgen-core/0.51.0 crate://crates.io/wit-bindgen-rust/0.51.0 crate://crates.io/wit-bindgen-rust-macro/0.51.0 crate://crates.io/wit-component/0.244.0 crate://crates.io/wit-parser/0.244.0 crate://crates.io/writeable/0.6.2 crate://crates.io/xattr/1.6.1 crate://crates.io/xz2/0.1.7 crate://crates.io/yoke/0.8.1 crate://crates.io/yoke-derive/0.8.1 crate://crates.io/zerofrom/0.1.6 crate://crates.io/zerofrom-derive/0.1.6 crate://crates.io/zerotrie/0.2.3 crate://crates.io/zerove
 c/0.11.5 crate://crates.io/zerovec-derive/0.11.2 crate://crates.io/zlib-rs/0.6.3 crate://crates.io/zmij/1.0.21 crate://crates.io/zstd/0.13.3 crate://crates.io/zstd-safe/7.2.4 crate://crates.io/zstd-sys/2.0.16+zstd.1.5.7" to "https://files.pythonhosted.org/packages/source/u/uv_build/uv_build-0.11.29.tar.gz;downloadfilename=uv_build-0.11.29.tar.gz crate://crates.io/adler2/2.0.1 crate://crates.io/aho-corasick/1.1.4 crate://crates.io/allocator-api2/0.2.21 crate://crates.io/anstream/1.0.0 crate://crates.io/anstyle/1.0.14 crate://crates.io/anstyle-parse/1.0.0 crate://crates.io/anstyle-query/1.1.5 crate://crates.io/anstyle-wincon/3.0.11 crate://crates.io/anyhow/1.0.103 crate://crates.io/arcstr/1.2.0 crate://crates.io/arrayvec/0.7.8 crate://crates.io/astral-tokio-tar/0.6.3 crate://crates.io/astral-version-ranges/0.2.1 crate://crates.io/astral_async_zip/0.0.20 crate://crates.io/async-compression/0.4.19 crate://crates.io/autocfg/1.5.0 crate://crates.io/backon/1.6.0 crate://crates.io/base64/0.
 22.1 crate://crates.io/bitflags/1.3.2 crate://crates.io/bitflags/2.13.0 crate://crates.io/block-buffer/0.10.4 crate://crates.io/boxcar/0.2.14 crate://crates.io/bstr/1.12.1 crate://crates.io/bumpalo/3.20.2 crate://crates.io/bytecheck/0.8.2 crate://crates.io/bytecheck_derive/0.8.2 crate://crates.io/bytes/1.12.0 crate://crates.io/bzip2/0.5.2 crate://crates.io/bzip2-sys/0.1.13+1.0.8 crate://crates.io/cc/1.2.57 crate://crates.io/cfg-if/1.0.4 crate://crates.io/charset/0.1.5 crate://crates.io/clap/4.6.1 crate://crates.io/clap_builder/4.6.0 crate://crates.io/clap_derive/4.6.1 crate://crates.io/clap_lex/1.1.0 crate://crates.io/colorchoice/1.0.5 crate://crates.io/console/0.16.4 crate://crates.io/cpufeatures/0.2.17 crate://crates.io/crc32fast/1.5.0 crate://crates.io/crypto-common/0.1.7 crate://crates.io/csv/1.4.0 crate://crates.io/csv-core/0.1.13 crate://crates.io/data-encoding/2.11.0 crate://crates.io/defmt/1.1.0 crate://crates.io/defmt-macros/1.1.0 crate://crates.io/defmt-parser/1.0.0 crate:
 //crates.io/digest/0.10.7 crate://crates.io/displaydoc/0.2.5 crate://crates.io/dunce/1.0.5 crate://crates.io/dyn-clone/1.0.20 crate://crates.io/either/1.16.0 crate://crates.io/encode_unicode/1.0.0 crate://crates.io/encoding_rs/0.8.35 crate://crates.io/encoding_rs_io/0.1.7 crate://crates.io/enumflags2/0.7.12 crate://crates.io/enumflags2_derive/0.7.12 crate://crates.io/equivalent/1.0.2 crate://crates.io/erased-serde/0.4.10 crate://crates.io/errno/0.3.14 crate://crates.io/fastrand/2.4.1 crate://crates.io/find-msvc-tools/0.1.9 crate://crates.io/fixedbitset/0.5.7 crate://crates.io/flate2/1.1.9 crate://crates.io/foldhash/0.1.5 crate://crates.io/foldhash/0.2.0 crate://crates.io/form_urlencoded/1.2.2 crate://crates.io/fs-err/3.3.1 crate://crates.io/futures/0.3.32 crate://crates.io/futures-channel/0.3.32 crate://crates.io/futures-core/0.3.32 crate://crates.io/futures-executor/0.3.32 crate://crates.io/futures-io/0.3.32 crate://crates.io/futures-lite/2.6.1 crate://crates.io/futures-macro/0.3.3
 2 crate://crates.io/futures-sink/0.3.32 crate://crates.io/futures-task/0.3.32 crate://crates.io/futures-util/0.3.32 crate://crates.io/generic-array/0.14.7 crate://crates.io/getrandom/0.4.3 crate://crates.io/globset/0.4.18 crate://crates.io/gloo-timers/0.3.0 crate://crates.io/hashbrown/0.15.5 crate://crates.io/hashbrown/0.17.1 crate://crates.io/heck/0.5.0 crate://crates.io/hex/0.4.3 crate://crates.io/icu_collections/2.1.1 crate://crates.io/icu_locale_core/2.1.1 crate://crates.io/icu_normalizer/2.1.1 crate://crates.io/icu_normalizer_data/2.1.1 crate://crates.io/icu_properties/2.1.2 crate://crates.io/icu_properties_data/2.1.2 crate://crates.io/icu_provider/2.1.1 crate://crates.io/idna/1.1.0 crate://crates.io/idna_adapter/1.2.1 crate://crates.io/indexmap/2.14.0 crate://crates.io/indoc/2.0.7 crate://crates.io/insta/1.48.0 crate://crates.io/is_terminal_polyfill/1.70.2 crate://crates.io/itertools/0.14.0 crate://crates.io/itoa/1.0.17 crate://crates.io/jiff/0.2.31 crate://crates.io/jiff-stat
 ic/0.2.31 crate://crates.io/jiff-tzdb/0.1.6 crate://crates.io/jiff-tzdb-platform/0.1.3 crate://crates.io/jobserver/0.1.35 crate://crates.io/js-sys/0.3.91 crate://crates.io/junction/2.0.0 crate://crates.io/lazy_static/1.5.0 crate://crates.io/libc/0.2.186 crate://crates.io/linux-raw-sys/0.4.15 crate://crates.io/linux-raw-sys/0.12.1 crate://crates.io/litemap/0.8.1 crate://crates.io/lock_api/0.4.14 crate://crates.io/log/0.4.29 crate://crates.io/lzma-sys/0.1.20 crate://crates.io/mailparse/0.16.1 crate://crates.io/matchers/0.2.0 crate://crates.io/memchr/2.8.2 crate://crates.io/miniz_oxide/0.8.9 crate://crates.io/mio/1.2.0 crate://crates.io/munge/0.4.7 crate://crates.io/munge_macro/0.4.7 crate://crates.io/nu-ansi-term/0.50.3 crate://crates.io/once_cell/1.21.4 crate://crates.io/once_cell_polyfill/1.70.2 crate://crates.io/owo-colors/4.3.0 crate://crates.io/parking/2.2.1 crate://crates.io/parking_lot/0.12.5 crate://crates.io/parking_lot_core/0.9.12 crate://crates.io/path-slash/0.2.1 crate://c
 rates.io/percent-encoding/2.3.2 crate://crates.io/pest/2.8.6 crate://crates.io/pest_derive/2.8.6 crate://crates.io/pest_generator/2.8.6 crate://crates.io/pest_meta/2.8.6 crate://crates.io/petgraph/0.8.3 crate://crates.io/pin-project/1.1.11 crate://crates.io/pin-project-internal/1.1.11 crate://crates.io/pin-project-lite/0.2.17 crate://crates.io/pkg-config/0.3.32 crate://crates.io/portable-atomic/1.13.1 crate://crates.io/portable-atomic-util/0.2.6 crate://crates.io/potential_utf/0.1.4 crate://crates.io/proc-macro-error-attr2/2.0.0 crate://crates.io/proc-macro-error2/2.0.1 crate://crates.io/proc-macro2/1.0.106 crate://crates.io/ptr_meta/0.3.1 crate://crates.io/ptr_meta_derive/0.3.1 crate://crates.io/quote/1.0.46 crate://crates.io/quoted_printable/0.5.1 crate://crates.io/r-efi/6.0.0 crate://crates.io/rancor/0.1.1 crate://crates.io/redox_syscall/0.5.15 crate://crates.io/ref-cast/1.0.25 crate://crates.io/ref-cast-impl/1.0.25 crate://crates.io/reflink-copy/0.1.30 crate://crates.io/regex/1.
 12.4 crate://crates.io/regex-automata/0.4.14 crate://crates.io/regex-syntax/0.8.11 crate://crates.io/rend/0.5.3 crate://crates.io/rkyv/0.8.17 crate://crates.io/rkyv_derive/0.8.17 crate://crates.io/rustc-hash/2.1.3 crate://crates.io/rustix/0.38.44 crate://crates.io/rustix/1.1.4 crate://crates.io/rustversion/1.0.22 crate://crates.io/ryu/1.0.23 crate://crates.io/same-file/1.0.6 crate://crates.io/schemars/1.2.1 crate://crates.io/schemars_derive/1.2.1 crate://crates.io/scopeguard/1.2.0 crate://crates.io/seahash/4.1.0 crate://crates.io/self-replace/1.5.0 crate://crates.io/serde/1.0.228 crate://crates.io/serde-untagged/0.1.9 crate://crates.io/serde_core/1.0.228 crate://crates.io/serde_derive/1.0.228 crate://crates.io/serde_derive_internals/0.29.1 crate://crates.io/serde_json/1.0.150 crate://crates.io/serde_spanned/1.1.1 crate://crates.io/sha2/0.10.9 crate://crates.io/sharded-slab/0.1.7 crate://crates.io/shlex/1.3.0 crate://crates.io/signal-hook-registry/1.4.8 crate://crates.io/simd-adler32
 /0.3.8 crate://crates.io/simdutf8/0.1.5 crate://crates.io/similar/2.7.0 crate://crates.io/slab/0.4.12 crate://crates.io/smallvec/1.15.2 crate://crates.io/smawk/0.3.2 crate://crates.io/spdx/0.13.4 crate://crates.io/stable_deref_trait/1.2.1 crate://crates.io/strip-ansi-escapes/0.2.1 crate://crates.io/strsim/0.11.1 crate://crates.io/syn/2.0.118 crate://crates.io/synstructure/0.13.2 crate://crates.io/temp-env/0.3.6 crate://crates.io/tempfile/3.27.0 crate://crates.io/terminal_size/0.4.4 crate://crates.io/textwrap/0.16.2 crate://crates.io/thiserror/2.0.18 crate://crates.io/thiserror-impl/2.0.18 crate://crates.io/thread_local/1.1.9 crate://crates.io/tinystr/0.8.2 crate://crates.io/tinyvec/1.11.0 crate://crates.io/tinyvec_macros/0.1.1 crate://crates.io/tokio/1.52.3 crate://crates.io/tokio-macros/2.7.0 crate://crates.io/tokio-stream/0.1.18 crate://crates.io/tokio-util/0.7.18 crate://crates.io/toml/1.1.2+spec-1.1.0 crate://crates.io/toml_datetime/1.1.1+spec-1.1.0 crate://crates.io/toml_edit/0
 .25.12+spec-1.1.0 crate://crates.io/toml_parser/1.1.2+spec-1.1.0 crate://crates.io/toml_writer/1.1.1+spec-1.1.0 crate://crates.io/tracing/0.1.44 crate://crates.io/tracing-attributes/0.1.31 crate://crates.io/tracing-core/0.1.36 crate://crates.io/tracing-log/0.2.0 crate://crates.io/tracing-subscriber/0.3.23 crate://crates.io/tracing-test/0.2.6 crate://crates.io/tracing-test-macro/0.2.6 crate://crates.io/typeid/1.0.3 crate://crates.io/typenum/1.20.1 crate://crates.io/ucd-trie/0.1.7 crate://crates.io/unicode-ident/1.0.24 crate://crates.io/unicode-linebreak/0.1.5 crate://crates.io/unicode-width/0.2.2 crate://crates.io/unscanny/0.1.0 crate://crates.io/url/2.5.8 crate://crates.io/utf8_iter/1.0.4 crate://crates.io/utf8parse/0.2.2 crate://crates.io/uuid/1.23.4 crate://crates.io/valuable/0.1.1 crate://crates.io/version_check/0.9.5 crate://crates.io/vte/0.14.1 crate://crates.io/walkdir/2.5.0 crate://crates.io/wasi/0.11.1+wasi-snapshot-preview1 crate://crates.io/wasm-bindgen/0.2.114 crate://cra
 tes.io/wasm-bindgen-macro/0.2.114 crate://crates.io/wasm-bindgen-macro-support/0.2.114 crate://crates.io/wasm-bindgen-shared/0.2.114 crate://crates.io/winapi-util/0.1.11 crate://crates.io/windows/0.61.3 crate://crates.io/windows-collections/0.2.0 crate://crates.io/windows-core/0.61.2 crate://crates.io/windows-future/0.2.1 crate://crates.io/windows-implement/0.60.2 crate://crates.io/windows-interface/0.59.3 crate://crates.io/windows-link/0.1.3 crate://crates.io/windows-link/0.2.1 crate://crates.io/windows-numerics/0.2.0 crate://crates.io/windows-result/0.3.4 crate://crates.io/windows-strings/0.4.2 crate://crates.io/windows-sys/0.52.0 crate://crates.io/windows-sys/0.61.2 crate://crates.io/windows-targets/0.52.6 crate://crates.io/windows-threading/0.1.0 crate://crates.io/windows_aarch64_gnullvm/0.52.6 crate://crates.io/windows_aarch64_msvc/0.52.6 crate://crates.io/windows_i686_gnu/0.52.6 crate://crates.io/windows_i686_gnullvm/0.52.6 crate://crates.io/windows_i686_msvc/0.52.6 crate://cr
 ates.io/windows_x86_64_gnu/0.52.6 crate://crates.io/windows_x86_64_gnullvm/0.52.6 crate://crates.io/windows_x86_64_msvc/0.52.6 crate://crates.io/winnow/1.0.3 crate://crates.io/writeable/0.6.2 crate://crates.io/xattr/1.6.1 crate://crates.io/xz2/0.1.7 crate://crates.io/yoke/0.8.1 crate://crates.io/yoke-derive/0.8.1 crate://crates.io/zerofrom/0.1.6 crate://crates.io/zerofrom-derive/0.1.6 crate://crates.io/zerotrie/0.2.3 crate://crates.io/zerovec/0.11.5 crate://crates.io/zerovec-derive/0.11.2 crate://crates.io/zlib-rs/0.6.3 crate://crates.io/zmij/1.0.21 crate://crates.io/zstd/0.13.3 crate://crates.io/zstd-safe/7.2.4 crate://crates.io/zstd-sys/2.0.16+zstd.1.5.7"
packages/x86-64-v3-poky-linux/python3-uv-build: PV changed from "0.11.28" to "0.11.29"
packages/x86-64-v3-poky-linux/python3-uv-build: PKGV changed from 0.11.28 [default] to 0.11.29 [default]
packages/x86-64-v3-poky-linux/python3-uv-build/python3-uv-build-dbg: PV changed from "0.11.28" to "0.11.29"
packages/x86-64-v3-poky-linux/python3-uv-build/python3-uv-build-dbg: PKGV changed from 0.11.28 [default] to 0.11.29 [default]
packages/x86-64-v3-poky-linux/python3-uv-build/python3-uv-build-dev: PV changed from "0.11.28" to "0.11.29"
packages/x86-64-v3-poky-linux/python3-uv-build/python3-uv-build-dev: PKGV changed from 0.11.28 [default] to 0.11.29 [default]
packages/x86-64-v3-poky-linux/python3-uv-build/python3-uv-build-doc: PV changed from "0.11.28" to "0.11.29"
packages/x86-64-v3-poky-linux/python3-uv-build/python3-uv-build-doc: PKGV changed from 0.11.28 [default] to 0.11.29 [default]
packages/x86-64-v3-poky-linux/python3-uv-build/python3-uv-build-locale: PV changed from "0.11.28" to "0.11.29"
packages/x86-64-v3-poky-linux/python3-uv-build/python3-uv-build-locale: PKGV changed from 0.11.28 [default] to 0.11.29 [default]
packages/x86-64-v3-poky-linux/python3-uv-build/python3-uv-build-src: PV changed from "0.11.28" to "0.11.29"
packages/x86-64-v3-poky-linux/python3-uv-build/python3-uv-build-src: PKGV changed from 0.11.28 [default] to 0.11.29 [default]
packages/x86-64-v3-poky-linux/python3-uv-build/python3-uv-build-staticdev: PV changed from "0.11.28" to "0.11.29"
packages/x86-64-v3-poky-linux/python3-uv-build/python3-uv-build-staticdev: PKGV changed from 0.11.28 [default] to 0.11.29 [default]
packages/x86-64-v3-poky-linux/python3-uv-build/python3-uv-build: PV changed from "0.11.28" to "0.11.29"
packages/x86-64-v3-poky-linux/python3-uv-build/python3-uv-build: FILELIST: directory renamed /usr/lib/python3.14/site-packages/uv_build-0.11.28.dist-info/licenses -> /usr/lib/python3.14/site-packages/uv_build-0.11.29.dist-info/licenses, directory renamed /usr/lib/python3.14/site-packages/uv_build-0.11.28.dist-info -> /usr/lib/python3.14/site-packages/uv_build-0.11.29.dist-info
packages/x86-64-v3-poky-linux/python3-uv-build/python3-uv-build: PKGV changed from 0.11.28 [default] to 0.11.29 [default]
Changes to packages/x86-64-v3-poky-linux/python3-uv-build (sysroot):
  /usr/lib/python3.14/site-packages/uv_build-0.11.28.dist-info moved to /usr/lib/python3.14/site-packages/uv_build-0.11.29.dist-info

--===============2104764467314560601==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: attachment; filename="buildhistory-diff.txt"

packages/x86-64-v3-poky-linux/python3-uv-build/python3-uv-build: FILELIST: directory renamed /usr/lib/python3.14/site-packages/uv_build-0.11.28.dist-info -> /usr/lib/python3.14/site-packages/uv_build-0.11.29.dist-info, directory renamed /usr/lib/python3.14/site-packages/uv_build-0.11.28.dist-info/licenses -> /usr/lib/python3.14/site-packages/uv_build-0.11.29.dist-info/licenses
Changes to packages/x86-64-v3-poky-linux/python3-uv-build (sysroot):
  /usr/lib/python3.14/site-packages/uv_build-0.11.28.dist-info moved to /usr/lib/python3.14/site-packages/uv_build-0.11.29.dist-info

--===============2104764467314560601==
Content-Type: application/octet-stream
MIME-Version: 1.0
Content-Transfer-Encoding: base64
Content-Disposition: attachment;
 filename="0001-python3-uv-build-upgrade-0.11.28-0.11.29.patch"

RnJvbSBjOGE4NTVhOTkyZTg2ZTMwM2Q2Yjk1ZDUwN2JhNzZkMmVjZDJjZWNkIE1vbiBTZXAgMTcg
MDA6MDA6MDAgMjAwMQpGcm9tOiBVcGdyYWRlIEhlbHBlciA8YXVoQHlvY3RvcHJvamVjdC5vcmc+
CkRhdGU6IFRodSwgMTYgSnVsIDIwMjYgMDU6MjM6NDQgKzAwMDAKU3ViamVjdDogW1BBVENIXSBw
eXRob24zLXV2LWJ1aWxkOiB1cGdyYWRlIDAuMTEuMjggLT4gMC4xMS4yOQoKLS0tCiAuLi4vcHl0
aG9uL3B5dGhvbjMtdXYtYnVpbGQtY3JhdGVzLmluYyAgICAgICAgfCA4OCArKysrKystLS0tLS0t
LS0tLS0tCiAuLi4wLjExLjI4LmJiID0+IHB5dGhvbjMtdXYtYnVpbGRfMC4xMS4yOS5iYn0gfCAg
MiArLQogMiBmaWxlcyBjaGFuZ2VkLCAyNyBpbnNlcnRpb25zKCspLCA2MyBkZWxldGlvbnMoLSkK
IHJlbmFtZSBtZXRhL3JlY2lwZXMtZGV2dG9vbHMvcHl0aG9uL3tweXRob24zLXV2LWJ1aWxkXzAu
MTEuMjguYmIgPT4gcHl0aG9uMy11di1idWlsZF8wLjExLjI5LmJifSAoOTIlKQoKZGlmZiAtLWdp
dCBhL21ldGEvcmVjaXBlcy1kZXZ0b29scy9weXRob24vcHl0aG9uMy11di1idWlsZC1jcmF0ZXMu
aW5jIGIvbWV0YS9yZWNpcGVzLWRldnRvb2xzL3B5dGhvbi9weXRob24zLXV2LWJ1aWxkLWNyYXRl
cy5pbmMKaW5kZXggOTcyMjU3MjVjMi4uZjFkZTM4ODc4YyAxMDA2NDQKLS0tIGEvbWV0YS9yZWNp
cGVzLWRldnRvb2xzL3B5dGhvbi9weXRob24zLXV2LWJ1aWxkLWNyYXRlcy5pbmMKKysrIGIvbWV0
YS9yZWNpcGVzLWRldnRvb2xzL3B5dGhvbi9weXRob24zLXV2LWJ1aWxkLWNyYXRlcy5pbmMKQEAg
LTEyLDkgKzEyLDkgQEAgU1JDX1VSSSArPSAiIFwKICAgICBjcmF0ZTovL2NyYXRlcy5pby9hbnN0
eWxlLXdpbmNvbi8zLjAuMTEgXAogICAgIGNyYXRlOi8vY3JhdGVzLmlvL2FueWhvdy8xLjAuMTAz
IFwKICAgICBjcmF0ZTovL2NyYXRlcy5pby9hcmNzdHIvMS4yLjAgXAotICAgIGNyYXRlOi8vY3Jh
dGVzLmlvL2FycmF5dmVjLzAuNy43IFwKKyAgICBjcmF0ZTovL2NyYXRlcy5pby9hcnJheXZlYy8w
LjcuOCBcCiAgICAgY3JhdGU6Ly9jcmF0ZXMuaW8vYXN0cmFsLXRva2lvLXRhci8wLjYuMyBcCi0g
ICAgY3JhdGU6Ly9jcmF0ZXMuaW8vYXN0cmFsLXZlcnNpb24tcmFuZ2VzLzAuMi4wIFwKKyAgICBj
cmF0ZTovL2NyYXRlcy5pby9hc3RyYWwtdmVyc2lvbi1yYW5nZXMvMC4yLjEgXAogICAgIGNyYXRl
Oi8vY3JhdGVzLmlvL2FzdHJhbF9hc3luY196aXAvMC4wLjIwIFwKICAgICBjcmF0ZTovL2NyYXRl
cy5pby9hc3luYy1jb21wcmVzc2lvbi8wLjQuMTkgXAogICAgIGNyYXRlOi8vY3JhdGVzLmlvL2F1
dG9jZmcvMS41LjAgXApAQCAtMzksNyArMzksNyBAQCBTUkNfVVJJICs9ICIgXAogICAgIGNyYXRl
Oi8vY3JhdGVzLmlvL2NsYXBfZGVyaXZlLzQuNi4xIFwKICAgICBjcmF0ZTovL2NyYXRlcy5pby9j
bGFwX2xleC8xLjEuMCBcCiAgICAgY3JhdGU6Ly9jcmF0ZXMuaW8vY29sb3JjaG9pY2UvMS4wLjUg
XAotICAgIGNyYXRlOi8vY3JhdGVzLmlvL2NvbnNvbGUvMC4xNi4zIFwKKyAgICBjcmF0ZTovL2Ny
YXRlcy5pby9jb25zb2xlLzAuMTYuNCBcCiAgICAgY3JhdGU6Ly9jcmF0ZXMuaW8vY3B1ZmVhdHVy
ZXMvMC4yLjE3IFwKICAgICBjcmF0ZTovL2NyYXRlcy5pby9jcmMzMmZhc3QvMS41LjAgXAogICAg
IGNyYXRlOi8vY3JhdGVzLmlvL2NyeXB0by1jb21tb24vMC4xLjcgXApAQCAtNjksNyArNjksNyBA
QCBTUkNfVVJJICs9ICIgXAogICAgIGNyYXRlOi8vY3JhdGVzLmlvL2ZvbGRoYXNoLzAuMS41IFwK
ICAgICBjcmF0ZTovL2NyYXRlcy5pby9mb2xkaGFzaC8wLjIuMCBcCiAgICAgY3JhdGU6Ly9jcmF0
ZXMuaW8vZm9ybV91cmxlbmNvZGVkLzEuMi4yIFwKLSAgICBjcmF0ZTovL2NyYXRlcy5pby9mcy1l
cnIvMy4zLjAgXAorICAgIGNyYXRlOi8vY3JhdGVzLmlvL2ZzLWVyci8zLjMuMSBcCiAgICAgY3Jh
dGU6Ly9jcmF0ZXMuaW8vZnV0dXJlcy8wLjMuMzIgXAogICAgIGNyYXRlOi8vY3JhdGVzLmlvL2Z1
dHVyZXMtY2hhbm5lbC8wLjMuMzIgXAogICAgIGNyYXRlOi8vY3JhdGVzLmlvL2Z1dHVyZXMtY29y
ZS8wLjMuMzIgXApAQCAtODEsOCArODEsNyBAQCBTUkNfVVJJICs9ICIgXAogICAgIGNyYXRlOi8v
Y3JhdGVzLmlvL2Z1dHVyZXMtdGFzay8wLjMuMzIgXAogICAgIGNyYXRlOi8vY3JhdGVzLmlvL2Z1
dHVyZXMtdXRpbC8wLjMuMzIgXAogICAgIGNyYXRlOi8vY3JhdGVzLmlvL2dlbmVyaWMtYXJyYXkv
MC4xNC43IFwKLSAgICBjcmF0ZTovL2NyYXRlcy5pby9nZXRyYW5kb20vMC4zLjMgXAotICAgIGNy
YXRlOi8vY3JhdGVzLmlvL2dldHJhbmRvbS8wLjQuMSBcCisgICAgY3JhdGU6Ly9jcmF0ZXMuaW8v
Z2V0cmFuZG9tLzAuNC4zIFwKICAgICBjcmF0ZTovL2NyYXRlcy5pby9nbG9ic2V0LzAuNC4xOCBc
CiAgICAgY3JhdGU6Ly9jcmF0ZXMuaW8vZ2xvby10aW1lcnMvMC4zLjAgXAogICAgIGNyYXRlOi8v
Y3JhdGVzLmlvL2hhc2hicm93bi8wLjE1LjUgXApAQCAtOTYsNyArOTUsNiBAQCBTUkNfVVJJICs9
ICIgXAogICAgIGNyYXRlOi8vY3JhdGVzLmlvL2ljdV9wcm9wZXJ0aWVzLzIuMS4yIFwKICAgICBj
cmF0ZTovL2NyYXRlcy5pby9pY3VfcHJvcGVydGllc19kYXRhLzIuMS4yIFwKICAgICBjcmF0ZTov
L2NyYXRlcy5pby9pY3VfcHJvdmlkZXIvMi4xLjEgXAotICAgIGNyYXRlOi8vY3JhdGVzLmlvL2lk
LWFyZW5hLzIuMy4wIFwKICAgICBjcmF0ZTovL2NyYXRlcy5pby9pZG5hLzEuMS4wIFwKICAgICBj
cmF0ZTovL2NyYXRlcy5pby9pZG5hX2FkYXB0ZXIvMS4yLjEgXAogICAgIGNyYXRlOi8vY3JhdGVz
LmlvL2luZGV4bWFwLzIuMTQuMCBcCkBAIC0xMDUsMTUgKzEwMywxNCBAQCBTUkNfVVJJICs9ICIg
XAogICAgIGNyYXRlOi8vY3JhdGVzLmlvL2lzX3Rlcm1pbmFsX3BvbHlmaWxsLzEuNzAuMiBcCiAg
ICAgY3JhdGU6Ly9jcmF0ZXMuaW8vaXRlcnRvb2xzLzAuMTQuMCBcCiAgICAgY3JhdGU6Ly9jcmF0
ZXMuaW8vaXRvYS8xLjAuMTcgXAotICAgIGNyYXRlOi8vY3JhdGVzLmlvL2ppZmYvMC4yLjI5IFwK
LSAgICBjcmF0ZTovL2NyYXRlcy5pby9qaWZmLXN0YXRpYy8wLjIuMjkgXAorICAgIGNyYXRlOi8v
Y3JhdGVzLmlvL2ppZmYvMC4yLjMxIFwKKyAgICBjcmF0ZTovL2NyYXRlcy5pby9qaWZmLXN0YXRp
Yy8wLjIuMzEgXAogICAgIGNyYXRlOi8vY3JhdGVzLmlvL2ppZmYtdHpkYi8wLjEuNiBcCiAgICAg
Y3JhdGU6Ly9jcmF0ZXMuaW8vamlmZi10emRiLXBsYXRmb3JtLzAuMS4zIFwKLSAgICBjcmF0ZTov
L2NyYXRlcy5pby9qb2JzZXJ2ZXIvMC4xLjM0IFwKKyAgICBjcmF0ZTovL2NyYXRlcy5pby9qb2Jz
ZXJ2ZXIvMC4xLjM1IFwKICAgICBjcmF0ZTovL2NyYXRlcy5pby9qcy1zeXMvMC4zLjkxIFwKICAg
ICBjcmF0ZTovL2NyYXRlcy5pby9qdW5jdGlvbi8yLjAuMCBcCiAgICAgY3JhdGU6Ly9jcmF0ZXMu
aW8vbGF6eV9zdGF0aWMvMS41LjAgXAotICAgIGNyYXRlOi8vY3JhdGVzLmlvL2xlYjEyOGZtdC8w
LjEuMCBcCiAgICAgY3JhdGU6Ly9jcmF0ZXMuaW8vbGliYy8wLjIuMTg2IFwKICAgICBjcmF0ZTov
L2NyYXRlcy5pby9saW51eC1yYXctc3lzLzAuNC4xNSBcCiAgICAgY3JhdGU6Ly9jcmF0ZXMuaW8v
bGludXgtcmF3LXN5cy8wLjEyLjEgXApAQCAtMTQ5LDcgKzE0Niw2IEBAIFNSQ19VUkkgKz0gIiBc
CiAgICAgY3JhdGU6Ly9jcmF0ZXMuaW8vcG9ydGFibGUtYXRvbWljLzEuMTMuMSBcCiAgICAgY3Jh
dGU6Ly9jcmF0ZXMuaW8vcG9ydGFibGUtYXRvbWljLXV0aWwvMC4yLjYgXAogICAgIGNyYXRlOi8v
Y3JhdGVzLmlvL3BvdGVudGlhbF91dGYvMC4xLjQgXAotICAgIGNyYXRlOi8vY3JhdGVzLmlvL3By
ZXR0eXBsZWFzZS8wLjIuMzcgXAogICAgIGNyYXRlOi8vY3JhdGVzLmlvL3Byb2MtbWFjcm8tZXJy
b3ItYXR0cjIvMi4wLjAgXAogICAgIGNyYXRlOi8vY3JhdGVzLmlvL3Byb2MtbWFjcm8tZXJyb3Iy
LzIuMC4xIFwKICAgICBjcmF0ZTovL2NyYXRlcy5pby9wcm9jLW1hY3JvMi8xLjAuMTA2IFwKQEAg
LTE1Nyw3ICsxNTMsNyBAQCBTUkNfVVJJICs9ICIgXAogICAgIGNyYXRlOi8vY3JhdGVzLmlvL3B0
cl9tZXRhX2Rlcml2ZS8wLjMuMSBcCiAgICAgY3JhdGU6Ly9jcmF0ZXMuaW8vcXVvdGUvMS4wLjQ2
IFwKICAgICBjcmF0ZTovL2NyYXRlcy5pby9xdW90ZWRfcHJpbnRhYmxlLzAuNS4xIFwKLSAgICBj
cmF0ZTovL2NyYXRlcy5pby9yLWVmaS81LjMuMCBcCisgICAgY3JhdGU6Ly9jcmF0ZXMuaW8vci1l
ZmkvNi4wLjAgXAogICAgIGNyYXRlOi8vY3JhdGVzLmlvL3JhbmNvci8wLjEuMSBcCiAgICAgY3Jh
dGU6Ly9jcmF0ZXMuaW8vcmVkb3hfc3lzY2FsbC8wLjUuMTUgXAogICAgIGNyYXRlOi8vY3JhdGVz
LmlvL3JlZi1jYXN0LzEuMC4yNSBcCkBAIC0xNjcsOSArMTYzLDkgQEAgU1JDX1VSSSArPSAiIFwK
ICAgICBjcmF0ZTovL2NyYXRlcy5pby9yZWdleC1hdXRvbWF0YS8wLjQuMTQgXAogICAgIGNyYXRl
Oi8vY3JhdGVzLmlvL3JlZ2V4LXN5bnRheC8wLjguMTEgXAogICAgIGNyYXRlOi8vY3JhdGVzLmlv
L3JlbmQvMC41LjMgXAotICAgIGNyYXRlOi8vY3JhdGVzLmlvL3JreXYvMC44LjE2IFwKLSAgICBj
cmF0ZTovL2NyYXRlcy5pby9ya3l2X2Rlcml2ZS8wLjguMTYgXAotICAgIGNyYXRlOi8vY3JhdGVz
LmlvL3J1c3RjLWhhc2gvMi4xLjIgXAorICAgIGNyYXRlOi8vY3JhdGVzLmlvL3JreXYvMC44LjE3
IFwKKyAgICBjcmF0ZTovL2NyYXRlcy5pby9ya3l2X2Rlcml2ZS8wLjguMTcgXAorICAgIGNyYXRl
Oi8vY3JhdGVzLmlvL3J1c3RjLWhhc2gvMi4xLjMgXAogICAgIGNyYXRlOi8vY3JhdGVzLmlvL3J1
c3RpeC8wLjM4LjQ0IFwKICAgICBjcmF0ZTovL2NyYXRlcy5pby9ydXN0aXgvMS4xLjQgXAogICAg
IGNyYXRlOi8vY3JhdGVzLmlvL3J1c3R2ZXJzaW9uLzEuMC4yMiBcCkBAIC0xODAsNyArMTc2LDYg
QEAgU1JDX1VSSSArPSAiIFwKICAgICBjcmF0ZTovL2NyYXRlcy5pby9zY29wZWd1YXJkLzEuMi4w
IFwKICAgICBjcmF0ZTovL2NyYXRlcy5pby9zZWFoYXNoLzQuMS4wIFwKICAgICBjcmF0ZTovL2Ny
YXRlcy5pby9zZWxmLXJlcGxhY2UvMS41LjAgXAotICAgIGNyYXRlOi8vY3JhdGVzLmlvL3NlbXZl
ci8xLjAuMjcgXAogICAgIGNyYXRlOi8vY3JhdGVzLmlvL3NlcmRlLzEuMC4yMjggXAogICAgIGNy
YXRlOi8vY3JhdGVzLmlvL3NlcmRlLXVudGFnZ2VkLzAuMS45IFwKICAgICBjcmF0ZTovL2NyYXRl
cy5pby9zZXJkZV9jb3JlLzEuMC4yMjggXApAQCAtMjMxLDEyICsyMjYsMTEgQEAgU1JDX1VSSSAr
PSAiIFwKICAgICBjcmF0ZTovL2NyYXRlcy5pby90cmFjaW5nLXRlc3QvMC4yLjYgXAogICAgIGNy
YXRlOi8vY3JhdGVzLmlvL3RyYWNpbmctdGVzdC1tYWNyby8wLjIuNiBcCiAgICAgY3JhdGU6Ly9j
cmF0ZXMuaW8vdHlwZWlkLzEuMC4zIFwKLSAgICBjcmF0ZTovL2NyYXRlcy5pby90eXBlbnVtLzEu
MTkuMCBcCisgICAgY3JhdGU6Ly9jcmF0ZXMuaW8vdHlwZW51bS8xLjIwLjEgXAogICAgIGNyYXRl
Oi8vY3JhdGVzLmlvL3VjZC10cmllLzAuMS43IFwKICAgICBjcmF0ZTovL2NyYXRlcy5pby91bmlj
b2RlLWlkZW50LzEuMC4yNCBcCiAgICAgY3JhdGU6Ly9jcmF0ZXMuaW8vdW5pY29kZS1saW5lYnJl
YWsvMC4xLjUgXAogICAgIGNyYXRlOi8vY3JhdGVzLmlvL3VuaWNvZGUtd2lkdGgvMC4yLjIgXAot
ICAgIGNyYXRlOi8vY3JhdGVzLmlvL3VuaWNvZGUteGlkLzAuMi42IFwKICAgICBjcmF0ZTovL2Ny
YXRlcy5pby91bnNjYW5ueS8wLjEuMCBcCiAgICAgY3JhdGU6Ly9jcmF0ZXMuaW8vdXJsLzIuNS44
IFwKICAgICBjcmF0ZTovL2NyYXRlcy5pby91dGY4X2l0ZXIvMS4wLjQgXApAQCAtMjQ3LDE2ICsy
NDEsMTAgQEAgU1JDX1VSSSArPSAiIFwKICAgICBjcmF0ZTovL2NyYXRlcy5pby92dGUvMC4xNC4x
IFwKICAgICBjcmF0ZTovL2NyYXRlcy5pby93YWxrZGlyLzIuNS4wIFwKICAgICBjcmF0ZTovL2Ny
YXRlcy5pby93YXNpLzAuMTEuMSt3YXNpLXNuYXBzaG90LXByZXZpZXcxIFwKLSAgICBjcmF0ZTov
L2NyYXRlcy5pby93YXNpLzAuMTQuNyt3YXNpLTAuMi40IFwKLSAgICBjcmF0ZTovL2NyYXRlcy5p
by93YXNpcDIvMS4wLjIrd2FzaS0wLjIuOSBcCi0gICAgY3JhdGU6Ly9jcmF0ZXMuaW8vd2FzaXAz
LzAuNC4wK3dhc2ktMC4zLjAtcmMtMjAyNi0wMS0wNiBcCiAgICAgY3JhdGU6Ly9jcmF0ZXMuaW8v
d2FzbS1iaW5kZ2VuLzAuMi4xMTQgXAogICAgIGNyYXRlOi8vY3JhdGVzLmlvL3dhc20tYmluZGdl
bi1tYWNyby8wLjIuMTE0IFwKICAgICBjcmF0ZTovL2NyYXRlcy5pby93YXNtLWJpbmRnZW4tbWFj
cm8tc3VwcG9ydC8wLjIuMTE0IFwKICAgICBjcmF0ZTovL2NyYXRlcy5pby93YXNtLWJpbmRnZW4t
c2hhcmVkLzAuMi4xMTQgXAotICAgIGNyYXRlOi8vY3JhdGVzLmlvL3dhc20tZW5jb2Rlci8wLjI0
NC4wIFwKLSAgICBjcmF0ZTovL2NyYXRlcy5pby93YXNtLW1ldGFkYXRhLzAuMjQ0LjAgXAotICAg
IGNyYXRlOi8vY3JhdGVzLmlvL3dhc21wYXJzZXIvMC4yNDQuMCBcCiAgICAgY3JhdGU6Ly9jcmF0
ZXMuaW8vd2luYXBpLXV0aWwvMC4xLjExIFwKICAgICBjcmF0ZTovL2NyYXRlcy5pby93aW5kb3dz
LzAuNjEuMyBcCiAgICAgY3JhdGU6Ly9jcmF0ZXMuaW8vd2luZG93cy1jb2xsZWN0aW9ucy8wLjIu
MCBcCkBAIC0yODIsMTIgKzI3MCw2IEBAIFNSQ19VUkkgKz0gIiBcCiAgICAgY3JhdGU6Ly9jcmF0
ZXMuaW8vd2luZG93c194ODZfNjRfZ251bGx2bS8wLjUyLjYgXAogICAgIGNyYXRlOi8vY3JhdGVz
LmlvL3dpbmRvd3NfeDg2XzY0X21zdmMvMC41Mi42IFwKICAgICBjcmF0ZTovL2NyYXRlcy5pby93
aW5ub3cvMS4wLjMgXAotICAgIGNyYXRlOi8vY3JhdGVzLmlvL3dpdC1iaW5kZ2VuLzAuNTEuMCBc
Ci0gICAgY3JhdGU6Ly9jcmF0ZXMuaW8vd2l0LWJpbmRnZW4tY29yZS8wLjUxLjAgXAotICAgIGNy
YXRlOi8vY3JhdGVzLmlvL3dpdC1iaW5kZ2VuLXJ1c3QvMC41MS4wIFwKLSAgICBjcmF0ZTovL2Ny
YXRlcy5pby93aXQtYmluZGdlbi1ydXN0LW1hY3JvLzAuNTEuMCBcCi0gICAgY3JhdGU6Ly9jcmF0
ZXMuaW8vd2l0LWNvbXBvbmVudC8wLjI0NC4wIFwKLSAgICBjcmF0ZTovL2NyYXRlcy5pby93aXQt
cGFyc2VyLzAuMjQ0LjAgXAogICAgIGNyYXRlOi8vY3JhdGVzLmlvL3dyaXRlYWJsZS8wLjYuMiBc
CiAgICAgY3JhdGU6Ly9jcmF0ZXMuaW8veGF0dHIvMS42LjEgXAogICAgIGNyYXRlOi8vY3JhdGVz
LmlvL3h6Mi8wLjEuNyBcCkBAIC0zMTUsOSArMjk3LDkgQEAgU1JDX1VSSVthbnN0eWxlLXF1ZXJ5
LTEuMS41LnNoYTI1NnN1bV0gPSAiNDBjNDhmNzJmZDUzY2QyODkxMDRmYzY0MDk5YWJjYTczZGI0
MTYKIFNSQ19VUklbYW5zdHlsZS13aW5jb24tMy4wLjExLnNoYTI1NnN1bV0gPSAiMjkxZTZhMjUw
ZmY4NmNkNGE4MjAxMTJmYjg4OTg4MDhhMzY2ZDhmOWY1OGNlMTZkMWY1MzgzNTNhZDU1NzQ3ZCIK
IFNSQ19VUklbYW55aG93LTEuMC4xMDMuc2hhMjU2c3VtXSA9ICIyYTQzODVlMmUzNGViMzVkNmIz
ZWZlNzk4YjllYjg4MDk2OTI1ZDg3NzI2YzA3OTg3MDliZjU2ZDllZDg0YWYzIgogU1JDX1VSSVth
cmNzdHItMS4yLjAuc2hhMjU2c3VtXSA9ICIwMzkxOGMzZGJkNzcwMWE4NWM2Yjk4ODc3MzJlMjky
MTE3NWYyNmMzNTBiNDU2Mzg0MWQwOTU4YzIxZDU3ZTZkIgotU1JDX1VSSVthcnJheXZlYy0wLjcu
Ny5zaGEyNTZzdW1dID0gImYwMjg4Mjg4NGQzZTFiYzUyNGZiMTJjNzlmMTA3ZjZhZDBlMWNmZDQ5
OGM1MzZmZmI0OTQzMDE3NDA5OTVkZmUiCitTUkNfVVJJW2FycmF5dmVjLTAuNy44LnNoYTI1NnN1
bV0gPSAiZDNmYjY3YTZlMDhhY2YyNGZkZWNjYmFjMmNiNmFjNDMwNTgyNWJkMWYxMTc0NjJlMGU2
ZjJmMTkzMzQ1YWQ1NiIKIFNSQ19VUklbYXN0cmFsLXRva2lvLXRhci0wLjYuMy5zaGEyNTZzdW1d
ID0gIjA4NjQ4ZmVmMzUzYWIzOWE5ZDI2ZjkwOWFkNTNmYzRmMDcxYmU0YzkxODUzYjc4NTIzZjVj
YzNkOWU1ZWJmZmQiCi1TUkNfVVJJW2FzdHJhbC12ZXJzaW9uLXJhbmdlcy0wLjIuMC5zaGEyNTZz
dW1dID0gIjA4NmY5MzZlZmRlZmFiMTE3ZjVhNzIzNjdmYjNkNjhjNGZkZWQ4YmE1YTcwMDhlM2M2
MzM2NWVlY2Y3MjM4MjIiCitTUkNfVVJJW2FzdHJhbC12ZXJzaW9uLXJhbmdlcy0wLjIuMS5zaGEy
NTZzdW1dID0gIjE0NDQ1ZjY3MDhlOWE2MGQ1MDk4YjZkNmY5OWRiZTdiNWIzNDcxNzhiMjczNmUx
ZmFkN2E4N2IwNGUyODk3OTEiCiBTUkNfVVJJW2FzdHJhbF9hc3luY196aXAtMC4wLjIwLnNoYTI1
NnN1bV0gPSAiYmQ5MzlkNzk5NTljM2Y0OWE2NDhhMWQ3ODU3ZDYzY2M2MjU0ODcyNWE2YjA2MGI4
ZGJmMGVhNWM5MjQ3MGI2MyIKIFNSQ19VUklbYXN5bmMtY29tcHJlc3Npb24tMC40LjE5LnNoYTI1
NnN1bV0gPSAiMDY1NzVlNmE5NjczNTgwZjUyNjYxYzkyMTA3YmFhYmZmYmY0MWUyMTQxMzczNDQx
Y2JjZGM0N2NiNzMzMDAzYyIKIFNSQ19VUklbYXV0b2NmZy0xLjUuMC5zaGEyNTZzdW1dID0gImMw
ODYwNmY4YzNjYmY0Y2U2ZWM4ZTI4ZmIwMDE0YTJjMDg2NzA4ZmU5NTRlYWE4ODUzODRhNjE2NTE3
MmU3ZTgiCkBAIC0zNDIsNyArMzI0LDcgQEAgU1JDX1VSSVtjbGFwX2J1aWxkZXItNC42LjAuc2hh
MjU2c3VtXSA9ICI3MTRhNTMwMDFiZjY2NDE2YWRiMGUyZWY1YWM4NTcxNDBlN2RjM2EKIFNSQ19V
UklbY2xhcF9kZXJpdmUtNC42LjEuc2hhMjU2c3VtXSA9ICJmMmNlODYwNDcxMGY2NzMzYWE2NDFh
MmIzNzMxZWFhMWU4YjNkOTk3M2Q1ZTM1NjVkYTExODAwODEzZjk5N2E5IgogU1JDX1VSSVtjbGFw
X2xleC0xLjEuMC5zaGEyNTZzdW1dID0gImM4ZDRhM2JiOGIxZTBjMTA1MDQ5OWQxODE1ZjVhYjE2
ZDA0ZjA5NTliMjMzMDg1ZmIzMTY1M2ZiZmM5ZDk4ZjkiCiBTUkNfVVJJW2NvbG9yY2hvaWNlLTEu
MC41LnNoYTI1NnN1bV0gPSAiMWQwNzU1MGM5MDM2YmYyYWUwYzY4NGM0Mjk3ZDUwM2Y4MzgyODdj
ODNjNTM2ODZkMDUzNzBkMGUxMzlhZTU3MCIKLVNSQ19VUklbY29uc29sZS0wLjE2LjMuc2hhMjU2
c3VtXSA9ICJkNjRlOGFmNTU1MTM2OWQxOWNmNTAxMzhkZTYxZjFjNDIwNzRhYjk3MGY3NGU5OWJl
OTE2NjQ2Nzc3ZjhmYzg3IgorU1JDX1VSSVtjb25zb2xlLTAuMTYuNC5zaGEyNTZzdW1dID0gIjRm
ZTVmNDY1YTRmNmZlZTg4ZmFkNDFiODVkOTkwZjg0YzgzNTMzNWU4NWI1ZDllNmU2M2UwZDA2ZDI4
Y2JhN2MiCiBTUkNfVVJJW2NwdWZlYXR1cmVzLTAuMi4xNy5zaGEyNTZzdW1dID0gIjU5ZWQ1ODM4
ZWViYjI2YTJiYjJlNThmNmQ1YjUzMTY5ODlhZTlkMDhiYWIxMGUwZTZkMTAzZTY1NmQxYjAyODAi
CiBTUkNfVVJJW2NyYzMyZmFzdC0xLjUuMC5zaGEyNTZzdW1dID0gIjk0ODFjMWM5MGNiZjJhYzk1
M2YwN2M4ZDRhNThhYTM5NDVjNDI1YjcxODVjOTE1NGQ2N2E2NWU0MjMwZGE1MTEiCiBTUkNfVVJJ
W2NyeXB0by1jb21tb24tMC4xLjcuc2hhMjU2c3VtXSA9ICI3OGM4MjkyMDU1ZDFjMWRmMGNjZTVk
MTgwMzkzZGM4Y2NlMGFiZWMwYTcxMDJhZGI2YzdiMWVlZjYwMTZkNjBhIgpAQCAtMzcyLDcgKzM1
NCw3IEBAIFNSQ19VUklbZmxhdGUyLTEuMS45LnNoYTI1NnN1bV0gPSAiODQzZmJhMjc0NmU0NDhi
MzdlMjZhODE5NTc5OTU3NDE1YzhjZWYzMzliZjA4CiBTUkNfVVJJW2ZvbGRoYXNoLTAuMS41LnNo
YTI1NnN1bV0gPSAiZDljNGY1ZGFjNWUxNWMyNGViOTk5YzI2MTgxYTZjYTQwYjM5ZmU5NDZjYmU0
YzI2M2M3MjA5NDY3YmM4M2FmMiIKIFNSQ19VUklbZm9sZGhhc2gtMC4yLjAuc2hhMjU2c3VtXSA9
ICI3N2NlMjRjYjU4MjI4ZmJiOGFhMDQxNDI1YmIxMDUwODUwYWMxOTE3NzY4NmVhNmUwZjQxYTcw
NDE2ZjU2ZmRiIgogU1JDX1VSSVtmb3JtX3VybGVuY29kZWQtMS4yLjIuc2hhMjU2c3VtXSA9ICJj
YjRjYjI0NTAzODUxNmY1Zjg1Mjc3ODc1Y2RhYTRmN2QyYzlhMGZhMDQ2OGRlMDZlZDE5MDE2M2Ix
NTgxZmNmIgotU1JDX1VSSVtmcy1lcnItMy4zLjAuc2hhMjU2c3VtXSA9ICI3M2ZkZTA1MmRiZmM5
MjAwMDNjZmQyYzhlMmM2ZTZkNGNjN2MxMDkxNTM4YzNhMjQyMjZjZWMwNjY1YWIwOGMwIgorU1JD
X1VSSVtmcy1lcnItMy4zLjEuc2hhMjU2c3VtXSA9ICJiOTFhYTQ0OGNhNTBkN2U3OTQzM2JkZjNl
ZThkOTkyMTU0MzBkMmVjMDJhZGU1YWVmYWIyYTA3M2ExODIyZThhIgogU1JDX1VSSVtmdXR1cmVz
LTAuMy4zMi5zaGEyNTZzdW1dID0gIjhiMTQ3ZWU5ZDFmNmQwOTdjZWY5Y2U2MjhjZDJlZTYyMjg4
ZDk2M2UxNmZiMjg3YmQ5Mjg2NDU1YjI0MTM4MmQiCiBTUkNfVVJJW2Z1dHVyZXMtY2hhbm5lbC0w
LjMuMzIuc2hhMjU2c3VtXSA9ICIwN2JiZTg5YzUwZDdhNTM1ZTUzOWI4YzE3YmMwYjQ5YmRiNzc3
NDcwMzRkYWE4MDg3NDA3ZDY1NWYzZjdjYzFkIgogU1JDX1VSSVtmdXR1cmVzLWNvcmUtMC4zLjMy
LnNoYTI1NnN1bV0gPSAiN2UzNDUwODE1MjcyZWY1OGNlYzZkNTY0NDIzZjZlNzU1ZTI1Mzc5YjIx
N2IwYmM2ODhlMjk1YmEyNGRmNmIxZCIKQEAgLTM4NCw4ICszNjYsNyBAQCBTUkNfVVJJW2Z1dHVy
ZXMtc2luay0wLjMuMzIuc2hhMjU2c3VtXSA9ICJjMzk3NTRlMTU3MzMxYjAxMzk3OGVjOTE5OTJi
ZGUxYWMwODk4NAogU1JDX1VSSVtmdXR1cmVzLXRhc2stMC4zLjMyLnNoYTI1NnN1bV0gPSAiMDM3
NzExYjNkNTljMzMwMDRkMzg1NmZiZGM4M2I5OWQ0ZmYzN2EyNDc2OGZhMWJlOWNlMzUzOGExY2Rl
NDM5MyIKIFNSQ19VUklbZnV0dXJlcy11dGlsLTAuMy4zMi5zaGEyNTZzdW1dID0gIjM4OWNhNDEy
OTZlNjE5MGI0ODA1M2RlMDMyMWQwMmE3N2YzMmY4YTVkMjQ2MWRkMzg3NjJjMDU5MzgwNWM2ZDYi
CiBTUkNfVVJJW2dlbmVyaWMtYXJyYXktMC4xNC43LnNoYTI1NnN1bV0gPSAiODU2NDljYTUxZmQ3
MjI3MmQ3ODIxYWRhZjI3NGFkOTFjMjg4Mjc3NzEzZDljMTg4MjBkODQ5OWE3ZmY2OWU5YSIKLVNS
Q19VUklbZ2V0cmFuZG9tLTAuMy4zLnNoYTI1NnN1bV0gPSAiMjYxNDVlNTYzZTU0ZjJjYWRjNDc3
NTUzZjFlYzVlZTY1MGIwMDg2MmYwYTU4YmNkMTJjYmRjNWYwZWEyZDJmNCIKLVNSQ19VUklbZ2V0
cmFuZG9tLTAuNC4xLnNoYTI1NnN1bV0gPSAiMTM5ZWYzOTgwMDExOGM3NjgzZjJmZDNjOThjMWIy
M2MwOWFlMDc2NTU2YjQzNWY4ZTkwNjRhZTEwOGFhZWVlYyIKK1NSQ19VUklbZ2V0cmFuZG9tLTAu
NC4zLnNoYTI1NnN1bV0gPSAiMzAwZTg4M2Q3NTZiMmU0ZWM5NGUwMjc5MWYzOWIwNGI1MjIyNzYx
Mzg4NTJjZmM0MWQ5ZmI3ZTkwNDEwNjA5OSIKIFNSQ19VUklbZ2xvYnNldC0wLjQuMTguc2hhMjU2
c3VtXSA9ICI1MmRmYzE5MTUzYTQ4YmRlMGNiZDYzMDQ1MzYxNWM4MTUxYmNlM2E1YWRmYWM3YTBh
ZWJmYmYwYTFlMWY1N2UzIgogU1JDX1VSSVtnbG9vLXRpbWVycy0wLjMuMC5zaGEyNTZzdW1dID0g
ImJiYjE0M2NmOTYwOTk4MDIwMzNlMGQ0ZjQ5NjNiMTlmZDJlMGI3MjhiY2YwNzZjZDljZjdmNjYz
NGYwOTI5OTQiCiBTUkNfVVJJW2hhc2hicm93bi0wLjE1LjUuc2hhMjU2c3VtXSA9ICI5MjI5Y2Zl
NTNkZmQ2OWYwNjA5YTQ5ZjY1NDYxYmQ5MzAwMWVhMWVmODg5Y2Q1NTI5ZGQxNzY1OTNmNTMzOGEx
IgpAQCAtMzk5LDcgKzM4MCw2IEBAIFNSQ19VUklbaWN1X25vcm1hbGl6ZXJfZGF0YS0yLjEuMS5z
aGEyNTZzdW1dID0gIjdhZWRjY2NkMDFmYzVmZTgxZTZiNDg5YzE1YjI0N2I4CiBTUkNfVVJJW2lj
dV9wcm9wZXJ0aWVzLTIuMS4yLnNoYTI1NnN1bV0gPSAiMDIwYmZjMDJmZTg3MGVjM2E2NmQ5M2U2
NzdjY2NhMDU2MjUwNmU1ODcyYzY1MGY4OTMyNjllMDg2MTVkNzRlYyIKIFNSQ19VUklbaWN1X3By
b3BlcnRpZXNfZGF0YS0yLjEuMi5zaGEyNTZzdW1dID0gIjYxNmMyOTRjZjhkNzI1YzZhZmNkOGY1
NWFiYzE3YzU2NDY0ZWY2MjExZjllZDU5Y2NjZmZlNTM0MTI5Yzc3YWYiCiBTUkNfVVJJW2ljdV9w
cm92aWRlci0yLjEuMS5zaGEyNTZzdW1dID0gIjg1OTYyY2YwY2UwMmUxZTBhNjI5Y2MzNGU3Y2Ez
ZTM3M2NlMjBkZGE0YzRkNzI5NGJiZDBiZjFmZGI1OWU2MTQiCi1TUkNfVVJJW2lkLWFyZW5hLTIu
My4wLnNoYTI1NnN1bV0gPSAiM2QzMDY3ZDc5Yjk3NWU4ODQ0Y2E5ZWIwNzJlMTZiMzFjM2MxYzM2
OTI4ZWRmOWM2Nzg5NTQ4YzUyNGQwZDk1NCIKIFNSQ19VUklbaWRuYS0xLjEuMC5zaGEyNTZzdW1d
ID0gIjNiMDg3NWYyM2NhYTAzODk4OTk0ZjZkZGM1MDE4ODZhNDVjN2QzZDYyZDA0ZDJkOTA3ODhk
NDdiZTFiMWU0ZGUiCiBTUkNfVVJJW2lkbmFfYWRhcHRlci0xLjIuMS5zaGEyNTZzdW1dID0gIjNh
Y2FlOTYwOTU0MGFhMzE4ZDFiYzU4ODQ1NTIyNWZiMjA4NWI5ZWQwYzRmNmJkMGQ5ZDViY2Q4NmYx
YTAzNDQiCiBTUkNfVVJJW2luZGV4bWFwLTIuMTQuMC5zaGEyNTZzdW1dID0gImQ0NjZlOTQ1NGYw
OGU0YTkxMWUxNDgwNmMyNGUxNmZiYTFiNGMxMjFkMWVhNDc0Mzk2ZjM5NjA2OWNmOTQ5ZDkiCkBA
IC00MDgsMTUgKzM4OCwxNCBAQCBTUkNfVVJJW2luc3RhLTEuNDguMC5zaGEyNTZzdW1dID0gIjg2
ZjBmOGZlZThjOTI2NDE1YzU4ZDZhZTQzYTA4NTIzYTI2ZmFjY2IyMzIzZgogU1JDX1VSSVtpc190
ZXJtaW5hbF9wb2x5ZmlsbC0xLjcwLjIuc2hhMjU2c3VtXSA9ICJhNmNiMTM4YmI3OWExNDZjMWJk
NDYwMDA1NjIzZTE0MmVmMDE4MWUzZDAyMTljYjQ5M2UwMmY3ZDA4YTM1Njk1IgogU1JDX1VSSVtp
dGVydG9vbHMtMC4xNC4wLnNoYTI1NnN1bV0gPSAiMmIxOTJjNzgyMDM3ZmFkZDljZmE3NTU0ODMx
MDQ4OGFhYmRiZjNkMmRhNzM4ODViMzFiZDBhYmQwMzM1MTI4NSIKIFNSQ19VUklbaXRvYS0xLjAu
MTcuc2hhMjU2c3VtXSA9ICI5MmVjYzY2MTgxODFkZWYwNDU3MzkyY2NkMGVlNTExOThlMDY1ZTAx
NmQxZDUyN2E3YWMxYjZkYzdjMWYwOWQyIgotU1JDX1VSSVtqaWZmLTAuMi4yOS5zaGEyNTZzdW1d
ID0gIjM0Zjg3N2E5ODY3NmQyZmI2NjQ2OThkNzRjYzZhNTFjZTZjNDg0Y2U4Yzc3MGYwNWQwMTA4
ZWM5MDkwYWViNDYiCi1TUkNfVVJJW2ppZmYtc3RhdGljLTAuMi4yOS5zaGEyNTZzdW1dID0gIjA2
NjZiNWFiNWVjYWNhMjEzZmMyYTg1YjhjMDA4M2Q5MDA0ZTg0ZWUyZDVmOWE3ZTAwMTdhYWY1MDk4
NmYyNWYiCitTUkNfVVJJW2ppZmYtMC4yLjMxLnNoYTI1NnN1bV0gPSAiY2NmZTYxMjFjYmU3NTBj
ZjgxZWZhMzYyZDg1YzBiZGU3ZWEyOThlYzQzMDkyZDNhMTkzYmFjYTU5Y2RiZDYzNCIKK1NSQ19V
UklbamlmZi1zdGF0aWMtMC4yLjMxLnNoYTI1NnN1bV0gPSAiZTE2NWU4OTdmNjYyZDQyOGYzY2Qz
ODI4YTkxOWRiZTA2N2MyZDQyYmIxMDMxZWVkZTc0ZWY5ZDI3ZWNkZWRkMiIKIFNSQ19VUklbamlm
Zi10emRiLTAuMS42LnNoYTI1NnN1bV0gPSAiYzkwMGVmODQ4MjZmMTMzOGE1NTc2OTdkYzhmYzYw
MWRmOWNhOWFmNGFjMTM3YzdmYjYxZDRjNmYyZGZkMzA3NiIKIFNSQ19VUklbamlmZi10emRiLXBs
YXRmb3JtLTAuMS4zLnNoYTI1NnN1bV0gPSAiODc1YTVhNjlhYzJiYWIxYTg5MTcxMWNmNWVjY2Jl
YzFjZTAzNDFlYTgwNTU2MGRjZDkwYjdhMmU5MjUxMzJlOCIKLVNSQ19VUklbam9ic2VydmVyLTAu
MS4zNC5zaGEyNTZzdW1dID0gIjlhZmIzZGU0Mzk1ZDZiM2U2N2E3ODBiNmRlNjRiNTFjOTc4ZWNm
MTFjYjlhNDYyYzY2YmU3ZDRjYTkwMzlkMzMiCitTUkNfVVJJW2pvYnNlcnZlci0wLjEuMzUuc2hh
MjU2c3VtXSA9ICIxYzAwYWNiZDI5ZWFiYWQ0YTIzOTJmYTBlOTIxYzg3NDkzNGRiYmY0MTk0MzEy
YWQyMGYwNGEwZWQ2N2EzY2IzIgogU1JDX1VSSVtqcy1zeXMtMC4zLjkxLnNoYTI1NnN1bV0gPSAi
YjQ5NzE1YjcwNzNmMzg1YmE0YmM1MjhlNTc0N2QwMmU2NmNiMzljNjE0NmVmYjY2Yjc4MWYxMzFm
MGZiMzk5YyIKIFNSQ19VUklbanVuY3Rpb24tMi4wLjAuc2hhMjU2c3VtXSA9ICIxNjBmMmVhZGUw
OTdmMzAyNjNiNTQ4YWFlNWRlYjEyYWQzNDljOTA5YmFhNzEwZmEyNGI5MmM5MDkwYjJlMDA2Igog
U1JDX1VSSVtsYXp5X3N0YXRpYy0xLjUuMC5zaGEyNTZzdW1dID0gImJiZDJiY2I0Yzk2M2YyZGRh
ZTA2YTJlZmM3ZTlmMzU5MTMxMjQ3M2M1MGM2Njg1ZTFmMjk4MDY4MzE2ZTY2ZmUiCi1TUkNfVVJJ
W2xlYjEyOGZtdC0wLjEuMC5zaGEyNTZzdW1dID0gIjA5ZWRkOWU4YjU0ZTQ5ZTU4N2U0ZjYyOTVh
N2QyOWMzZWE5NGQ0NjljYjQwYWI4Y2E3MGIyODgyNDhhODFkYjIiCiBTUkNfVVJJW2xpYmMtMC4y
LjE4Ni5zaGEyNTZzdW1dID0gIjY4YWI5MTAxN2ZlMTZjNjIyNDg2ODQwZTRjODNjOWEzN2FmZWZm
OTc4YmQyMzliNTI5M2Q2MWVjZTU4N2RlNjYiCiBTUkNfVVJJW2xpbnV4LXJhdy1zeXMtMC40LjE1
LnNoYTI1NnN1bV0gPSAiZDI2YzUyZGJkMzJkY2NmMmQxMGNhYzc3MjVmOGVhZTUyOTY4ODVmYjU3
MDNiMjYxZjdkMGEwNzM5ZWM4MDdhYiIKIFNSQ19VUklbbGludXgtcmF3LXN5cy0wLjEyLjEuc2hh
MjU2c3VtXSA9ICIzMmE2Njk0OWUwMzBkYTAwZThjN2Q0NDM0YjI1MTY3MGE5MTU1NmY0MTQ0OTQx
ZDM3NDUyNzY5YzI1ZDU4YTUzIgpAQCAtNDUyLDcgKzQzMSw2IEBAIFNSQ19VUklbcGtnLWNvbmZp
Zy0wLjMuMzIuc2hhMjU2c3VtXSA9ICI3ZWRkZGJkMGI1MmQ3MzJiMjFhZDlhNWZhYjVjNzA0YzE0
Y2Q5NDllCiBTUkNfVVJJW3BvcnRhYmxlLWF0b21pYy0xLjEzLjEuc2hhMjU2c3VtXSA9ICJjMzNh
OTQ3MTg5NmYxYzY5Y2VjZWY4ZDIwY2JlMmY3YWNjZDEyNTI3Y2U2MDg0NWZmNDRjMTUzYmIyYTIx
YjQ5IgogU1JDX1VSSVtwb3J0YWJsZS1hdG9taWMtdXRpbC0wLjIuNi5zaGEyNTZzdW1dID0gIjA5
MTM5N2JlNjFhMDFkNGJlNThlNzg0MTU5NWJkNGJmZWRiMTVmMWNkNTQ5NzdkNzliODI3MWU5NGVk
Nzk5YTMiCiBTUkNfVVJJW3BvdGVudGlhbF91dGYtMC4xLjQuc2hhMjU2c3VtXSA9ICJiNzM5NDk0
MzJmNWUyYTA5NjU3MDAzYzI1YmNhNWUxOWEwZTljODRmODA1OGNhMzc0ZjQ5ZTBlYmU2MDVhZjc3
IgotU1JDX1VSSVtwcmV0dHlwbGVhc2UtMC4yLjM3LnNoYTI1NnN1bV0gPSAiNDc5Y2E4YWRhY2Rk
N2NlOGYxZmIzOWNlOWVjY2NiZmU5M2EzZjEzNDRiM2QwZDk3ZjIwYmMwMTk2MjA4ZjYyYiIKIFNS
Q19VUklbcHJvYy1tYWNyby1lcnJvci1hdHRyMi0yLjAuMC5zaGEyNTZzdW1dID0gIjk2ZGU0MmRm
MzZiYjliYmE1NTQyZmU5ZjFhMDU0YjhjYzg3ZTE3Mjc1OWExODY4YWEwNWMxZjNhY2M4OWRmYzUi
CiBTUkNfVVJJW3Byb2MtbWFjcm8tZXJyb3IyLTIuMC4xLnNoYTI1NnN1bV0gPSAiMTFlYzA1YzUy
YmUwYTA3YjA4MDYxZjdkZDAwM2U3ZDcwOTJlMDQ3MmJjNzMxYjRhZjdiYjFlZjg3NjEwOTgwMiIK
IFNSQ19VUklbcHJvYy1tYWNybzItMS4wLjEwNi5zaGEyNTZzdW1dID0gIjhmZDAwZjBiYjJlOTBk
ODFkMTA0NGMyYjMyNjE3ZjY4ZmNiOWZhM2JiNzY0MGMyM2U5Yzc0OGU1M2ZiMzA5MzQiCkBAIC00
NjAsNyArNDM4LDcgQEAgU1JDX1VSSVtwdHJfbWV0YS0wLjMuMS5zaGEyNTZzdW1dID0gIjBiOWEw
Y2Y5NWExMTk2YWY2MWQ0ZjFjYmRhYjk2NzE3OTUxNmQ5YTRhNDMKIFNSQ19VUklbcHRyX21ldGFf
ZGVyaXZlLTAuMy4xLnNoYTI1NnN1bV0gPSAiNzM0Nzg2N2QwYTdlMTIwOGQ5M2I0Njc2N2JlODNl
MmI4Zjk3OGMzZGFkMzVmNzc1YWM4ZDg4NDc1NTFkNmZlMSIKIFNSQ19VUklbcXVvdGUtMS4wLjQ2
LnNoYTI1NnN1bV0gPSAiZGZiYzQ1N2QwYzdhMDc1OWE2MTQ1NTFiMTFhNjQwOWU1OTUxZjZjNzUz
N2JlMWYxYjc2ODJiOWFlOTIzMDM2OCIKIFNSQ19VUklbcXVvdGVkX3ByaW50YWJsZS0wLjUuMS5z
aGEyNTZzdW1dID0gIjY0MGM5YmQ4NDk3YjAyNDY1YWVlZjUzNzUxNDRjMjYwNjJlMGRjZDU5Mzlk
ZmNiYjBmNWRiNzZjYjhjMTdjNzMiCi1TUkNfVVJJW3ItZWZpLTUuMy4wLnNoYTI1NnN1bV0gPSAi
NjljZGIzNGMxNThjZWIyODhkZjExZTE4YjRiZDM5ZGU5OTRmNjY1N2Q4Mzg0N2JkZmZkYmQ3ZjM0
Njc1NGIwZiIKK1NSQ19VUklbci1lZmktNi4wLjAuc2hhMjU2c3VtXSA9ICJmOGRjYzljN2Q1MmE4
MTE2OTdkMjE1MWM3MDFlMGQwODk1NmY5MmIwZTI0MTM2Y2Y0Y2YyN2I1N2E2YTBkOWJmIgogU1JD
X1VSSVtyYW5jb3ItMC4xLjEuc2hhMjU2c3VtXSA9ICJhMDYzZWE3MjM4MTUyN2MyYTA1NjFkYTlj
ODAwMDBlZjgyMmJkZDdjMzI0MWIxY2MxYjEyMTAwZTNkZjA4MWVlIgogU1JDX1VSSVtyZWRveF9z
eXNjYWxsLTAuNS4xNS5zaGEyNTZzdW1dID0gIjdlOGFmMGRkZTA5NDAwNjAxMWU2YTc0MGQ0ODc5
MzE5NDM5NDg5ODEzYmQwYmNkYzdkODIxYmVhZWVmZjQ4ZWMiCiBTUkNfVVJJW3JlZi1jYXN0LTEu
MC4yNS5zaGEyNTZzdW1dID0gImYzNTQzMDBhZTY2Zjc2ZjFjODVjNWY4NDY5M2YwY2U4MWQ3NDdl
MmMzZjIxYTQ1ZmVmNDk2ZDg5Yzk2MGJmN2QiCkBAIC00NzAsOSArNDQ4LDkgQEAgU1JDX1VSSVty
ZWdleC0xLjEyLjQuc2hhMjU2c3VtXSA9ICJmMTI5MmI3NzU5YWUxY2I5ZWMxOTU0NTJkMTM5MGEw
NzRmMGNkODU0MWFiN2EKIFNSQ19VUklbcmVnZXgtYXV0b21hdGEtMC40LjE0LnNoYTI1NnN1bV0g
PSAiNmUxZGQ0MTIyZmMxNTk1ZTgxNjI2MTg5NDU0NzY4OTJlZWZjYTdiODhjNTI4MjBlNzRhZjYy
NjIyMTNjYWU4ZiIKIFNSQ19VUklbcmVnZXgtc3ludGF4LTAuOC4xMS5zaGEyNTZzdW1dID0gImQ2
ZjZmZjlhMzc4NDg1YjI5OGE1Mjg2NjU2ZGE2NjViYTc0NDEzZDM2ZGIwOTc5NjMzMjc1ZDJlNzA4
MTQ1ZDQiCiBTUkNfVVJJW3JlbmQtMC41LjMuc2hhMjU2c3VtXSA9ICJjYWRhZGVmMzE3YzJmMjA3
NTVhNjRkN2ZkYzQ4ZjllNzE3OGVlNmIwZTFmN2ZjZTMzZmE2MGYxZDY4YTI3NmU2IgotU1JDX1VS
SVtya3l2LTAuOC4xNi5zaGEyNTZzdW1dID0gIjczMzg5ZTBjOTllNjY0ZjkxOTI3NWFiNWI1YjA0
NzEzOTFmZTlhOGRlNjFlMWRmZjliMWVhZjU2YTkwZjE2ZTMiCi1TUkNfVVJJW3JreXZfZGVyaXZl
LTAuOC4xNi5zaGEyNTZzdW1dID0gIjVkMmVkMGI1NDEyNTMxNWZiMzZiZDAyMWU4MmQzMTRkMWMx
MjY1NDhmODcxNjM0YjQ4M2Y0NmIzMWQxM2NhYzYiCi1TUkNfVVJJW3J1c3RjLWhhc2gtMi4xLjIu
c2hhMjU2c3VtXSA9ICI5NDMwMGFiZjNmMWFlMmUyYjhmZmI3YjU4MDQzZGUzZDM5OWM3M2ZhNmY0
YjczODI2NDAyYTVjNDU3NjE0ZGJlIgorU1JDX1VSSVtya3l2LTAuOC4xNy5zaGEyNTZzdW1dID0g
IjgxNWNjOGEzNzE1OWE0NjMwNjQ4MjUyNDZjYWRiMDc5NjFlMjVjZDk4ODU5MDg2MDZmNmQwOGE5
OGQ4Zjg4NzQiCitTUkNfVVJJW3JreXZfZGVyaXZlLTAuOC4xNy5zaGEyNTZzdW1dID0gImMwZWQx
YTc4YTFiMTlkMTg0YjBkYWE2MjlkZDlhMDI0NTczMTczZWM3ZDQ4NWIyODdjYjM2OWZiMzYwN2Nj
MWMiCitTUkNfVVJJW3J1c3RjLWhhc2gtMi4xLjMuc2hhMjU2c3VtXSA9ICI2YjFlN2Y5YTQyODU3
MWJlMmRjNWJjMDUwNWMxM2ZiNmJmOTM2ODIyYjg5NGVjODdhYmY4YTA4YTRlNTE3NDJkIgogU1JD
X1VSSVtydXN0aXgtMC4zOC40NC5zaGEyNTZzdW1dID0gImZkYjViYzFhZTJiYWE1OTE4MDBkZjE2
YzljYTc4NjE5YmY2NWMwNDg4YjQxYjk2Y2NlYzVkMTEyMjBkOGMxNTQiCiBTUkNfVVJJW3J1c3Rp
eC0xLjEuNC5zaGEyNTZzdW1dID0gImI2ZmU0NTY1Yjk1MThiODNlZjRmOTFiYjQ3Y2UyOTYyMGNh
ODI4YmQzMmNiN2U0MDhmMDA2MmU5OTMwYmExOTAiCiBTUkNfVVJJW3J1c3R2ZXJzaW9uLTEuMC4y
Mi5zaGEyNTZzdW1dID0gImIzOWNkZWYwZmE4MDBmYzQ0NTI1Yzg0Y2NiNTRhMDI5OTYxYTgyMTVm
OTYxOTc1MzYzNWE5YzBkMjUzOGQ0NmQiCkBAIC00ODMsNyArNDYxLDYgQEAgU1JDX1VSSVtzY2hl
bWFyc19kZXJpdmUtMS4yLjEuc2hhMjU2c3VtXSA9ICI3ZDExNWI1MGY0YWFlZWEwN2U3OWMxOTEy
ZjY0NWM3NTEzZDgKIFNSQ19VUklbc2NvcGVndWFyZC0xLjIuMC5zaGEyNTZzdW1dID0gIjk0MTQz
ZjM3NzI1MTA5ZjkyYzI2MmVkMmNmNWU1OWJjZTc0OThjMDFiY2MxNTAyZDdiOWFmZTQzOWE0ZTlm
NDkiCiBTUkNfVVJJW3NlYWhhc2gtNC4xLjAuc2hhMjU2c3VtXSA9ICIxYzEwN2I2ZjQ3ODA4NTRj
OGIxMjZlMjI4ZWE4ODY5ZjRkN2I3MTI2MGY5NjJmZWZiNTdiOTk2Yjg5NTliYTZiIgogU1JDX1VS
SVtzZWxmLXJlcGxhY2UtMS41LjAuc2hhMjU2c3VtXSA9ICIwM2VjODE1YjVlYWI0MjBhYjg5M2Y2
MzM5Mzg3OGQ4OWM5MGZkZDk0YzBiY2M0NGMwN2FiYjhhZDk1NTUyZmI3IgotU1JDX1VSSVtzZW12
ZXItMS4wLjI3LnNoYTI1NnN1bV0gPSAiZDc2N2ViMGFhYmM4ODBiMjk5NTZjMzU3MzQxNzBmMjZl
ZDU1MWE4NTlkYmQzNjFkMTQwY2RiZWNhNjFhYjFlMiIKIFNSQ19VUklbc2VyZGUtMS4wLjIyOC5z
aGEyNTZzdW1dID0gIjlhOGU5NGVhN2YzNzhiZDMyY2JiZDM3MTk4YTRhOTE0MzYxODBjNWJiNDcy
NDExZTQ4YjVlYzJlMjEyNGFlOWUiCiBTUkNfVVJJW3NlcmRlLXVudGFnZ2VkLTAuMS45LnNoYTI1
NnN1bV0gPSAiZjlmYWY0OGE0YTJkMjY5M2JlMjRjNjI4OWRiZTI2NTUyNzc2ZWI3NzM3MDc0ZTY3
MjI4OTFmYWRiZTZjNTA1OCIKIFNSQ19VUklbc2VyZGVfY29yZS0xLjAuMjI4LnNoYTI1NnN1bV0g
PSAiNDFkMzg1YzdkNGNhNThlNTlmYzczMmFmMjVjMzk4M2I2N2FjODUyYzFhMjUwMDBhZmUxMTc1
ZGU0NThiNjdhZCIKQEAgLTUzNCwxMiArNTExLDExIEBAIFNSQ19VUklbdHJhY2luZy1zdWJzY3Jp
YmVyLTAuMy4yMy5zaGEyNTZzdW1dID0gImNiN2Y1NzhlNTk0NWZiMjQyNTM4OTY1YzJkMGIwNDQx
CiBTUkNfVVJJW3RyYWNpbmctdGVzdC0wLjIuNi5zaGEyNTZzdW1dID0gIjE5YTRjNDQ4ZGI1MTRk
NGYyNGM1ZGRiOWY3M2YyZWU3MWJmYjI0YzUyNmNmMGM1NzBiYTE0MmQxMTE5ZTAwNTEiCiBTUkNf
VVJJW3RyYWNpbmctdGVzdC1tYWNyby0wLjIuNi5zaGEyNTZzdW1dID0gImFkMDY4NDdiN2FmYjY1
Yzc4NjZhMzY2NjRiNzVjNDBiODk1ZTMxOGNlYTRmNzEyOTlmMDEzZmIyMjk2NTMyOWQiCiBTUkNf
VVJJW3R5cGVpZC0xLjAuMy5zaGEyNTZzdW1dID0gImJjN2Q2MjMyNTg2MDIzMjBkNWM1NWQxYmMy
Mjc5M2I1N2RhZmYwZWM3ZWZjMjcwZWE3ZDU1Y2UxZDVmNTQ3MWMiCi1TUkNfVVJJW3R5cGVudW0t
MS4xOS4wLnNoYTI1NnN1bV0gPSAiNTYyZDQ4MTA2NmJkZTA2NTgyNzZhMzU0NjdjNGFmMDBiZGM2
ZWU3MjYzMDU2OThhNTViODZlNjFkN2FkODJiYiIKK1NSQ19VUklbdHlwZW51bS0xLjIwLjEuc2hh
MjU2c3VtXSA9ICJiNmY1ZTg3MGJlNmMzYjM3MWI3N2ZlMGVlMGJhZmI4NTlmYTQ5NjRiNDQwNGMy
N2RlMWQzODAwNDNjNGRkYTIwIgogU1JDX1VSSVt1Y2QtdHJpZS0wLjEuNy5zaGEyNTZzdW1dID0g
IjI4OTZkOTVjMDJhODBjNmQ2YTVkNmU5NTNkNDc5ZjVkZGYyZGZkYjZhMjQ0NDQxMDEwZTM3M2Fj
MGZiODg5NzEiCiBTUkNfVVJJW3VuaWNvZGUtaWRlbnQtMS4wLjI0LnNoYTI1NnN1bV0gPSAiZTZl
NDMxM2NkNWZjZDNkYWQ1Y2FmYTE3OTcwMmUyYjI0NGY3NjA5OTFmNDUzOTdkMTRkNGViZjM4MjQ3
ZGE3NSIKIFNSQ19VUklbdW5pY29kZS1saW5lYnJlYWstMC4xLjUuc2hhMjU2c3VtXSA9ICIzYjA5
YzgzYzNjMjlkMzc1MDZhM2UyNjBjMDhjMDM3NDNhNmJiNjZhOWNkNDMyYzY5MzRhYjUwMWExOTA1
NzFmIgogU1JDX1VSSVt1bmljb2RlLXdpZHRoLTAuMi4yLnNoYTI1NnN1bV0gPSAiYjRhYzA0OGQ3
MWVkZTdlZTc2ZDU4NTUxN2FkZDQ1ZGE1MzA2NjBlZjQzOTBlNDliMDk4NzMzYzZlODk3ZjI1NCIK
LVNSQ19VUklbdW5pY29kZS14aWQtMC4yLjYuc2hhMjU2c3VtXSA9ICJlYmMxYzA0YzcxNTEwYzdm
NzAyYjUyYjdjMzUwNzM0YzlmZjEyOTVjNDY0YTAzMzM1YjAwYmI4NGZjNTRmODUzIgogU1JDX1VS
SVt1bnNjYW5ueS0wLjEuMC5zaGEyNTZzdW1dID0gImU5ZGYyYWYwNjdhNzk1M2U5YzM4MzEzMjBm
MzVjMWNjMDYwMGMzMGQ0NGQ5ZjdhMTJiMDFkYjFjZDg4ZDZiNDciCiBTUkNfVVJJW3VybC0yLjUu
OC5zaGEyNTZzdW1dID0gImZmNjdhOGE0Mzk3MzczYzNlZjY2MDgxMmFjYWIzMjY4MjIyMDM1MDEw
YWI4NjgwZWM0MjE1ZjM4YmEzZDBlZWQiCiBTUkNfVVJJW3V0ZjhfaXRlci0xLjAuNC5zaGEyNTZz
dW1dID0gImI2YzE0MDYyMGU3ZmZiYjIyYzJkZWU1OWNhZmU2MDg0YTU5YjVmZmMyN2E4ODU5YTVm
MGQ0OTRiNWQ1MmI2YmUiCkBAIC01NTAsMTYgKzUyNiwxMCBAQCBTUkNfVVJJW3ZlcnNpb25fY2hl
Y2stMC45LjUuc2hhMjU2c3VtXSA9ICIwYjkyOGYzM2Q5NzVmYzZhZDlmODZjOGYyODM4NTNhZDI2
YmRkNQogU1JDX1VSSVt2dGUtMC4xNC4xLnNoYTI1NnN1bV0gPSAiMjMxZmRjZDdlZjMwMzdlODMz
MGQ4ZTE3ZTYxMDExYTJjMjQ0MTI2YWNjMGE5ODJmNDA0MGFjM2Y5ZjBiYzA3NyIKIFNSQ19VUklb
d2Fsa2Rpci0yLjUuMC5zaGEyNTZzdW1dID0gIjI5NzkwOTQ2NDA0ZjkxZDljNWQwNmY5ODc0ZWZk
ZGVhMWRjMDZjNWVmZTk0NTQxYTdkNjg2MzEwOGUzYTVlNGIiCiBTUkNfVVJJW3dhc2ktMC4xMS4x
K3dhc2ktc25hcHNob3QtcHJldmlldzEuc2hhMjU2c3VtXSA9ICJjY2YzZWM2NTFhODQ3ZWIwMWRl
NzNjY2FkMTVlYjdkOTlmODA0ODVkZTA0M2VmYjJmMzcwY2Q2NTRmNGVhNDRiIgotU1JDX1VSSVt3
YXNpLTAuMTQuNyt3YXNpLTAuMi40LnNoYTI1NnN1bV0gPSAiODgzNDc4ZGUyMDM2N2UyMjRjMDA5
MGFmOWNmNWY5ZmE4NWJlZDYzYTk1YzFhYmYzYWZjNWMwODNlYmMwNmU4YyIKLVNSQ19VUklbd2Fz
aXAyLTEuMC4yK3dhc2ktMC4yLjkuc2hhMjU2c3VtXSA9ICI5NTE3ZjkyMzlmMDJjMDY5ZGI3NWU2
NWYxNzRiM2RhODI4ZmU1ZjViOTQ1YzRkZDI2YmQyNWQ4OWMwM2ViY2Y1IgotU1JDX1VSSVt3YXNp
cDMtMC40LjArd2FzaS0wLjMuMC1yYy0yMDI2LTAxLTA2LnNoYTI1NnN1bV0gPSAiNTQyOGY4YmY4
OGVhNWRkYzA4ZmFkZGVmMmFjNGE2N2UzOTBiODgxODZjNzAzY2U2ZGJkOTU1ZTFjMTQ1YWNhNSIK
IFNSQ19VUklbd2FzbS1iaW5kZ2VuLTAuMi4xMTQuc2hhMjU2c3VtXSA9ICI2NTMyZjlhNWMxZWNl
Mzc5OGNiMWMyY2ZkYmE2NDBiOWIzYmE4ODRmNWRiNDU5NzNhNmY0NDI1MTBhODdkMzhlIgogU1JD
X1VSSVt3YXNtLWJpbmRnZW4tbWFjcm8tMC4yLjExNC5zaGEyNTZzdW1dID0gIjE4YTJkNTBmY2Yx
MDVmYjMzYmIxNWYwMGU3YTc3Yjc3Mjk0NWEyZWU0NWRjZjQ1NDk2MWZkODQzZTc0YzE4ZTYiCiBT
UkNfVVJJW3dhc20tYmluZGdlbi1tYWNyby1zdXBwb3J0LTAuMi4xMTQuc2hhMjU2c3VtXSA9ICIw
M2NlNGNhZWFhYzU0N2NkZjcxM2QyODBlZGEyMmE3MzA4MjRkZDExZTZiOGMzY2E5ZTQyMjQ3YjI1
YzYzMWUzIgogU1JDX1VSSVt3YXNtLWJpbmRnZW4tc2hhcmVkLTAuMi4xMTQuc2hhMjU2c3VtXSA9
ICI3NWEzMjZiOGMyMjNlZTE3ODgzYTQyNTE5MDc0NTVhMjQzMWFjYzI3OTFjOThjMjYyNzkzNzY0
OTBjMzc4YzE2IgotU1JDX1VSSVt3YXNtLWVuY29kZXItMC4yNDQuMC5zaGEyNTZzdW1dID0gIjk5
MDA2NWYyZmU2MzAwM2ZlMzM3YjkzMmNmYjVlM2I4MGUwYjRkMGY1ZmY2NTBlNjk4NWIxMDQ4ZjYy
YzgzMTkiCi1TUkNfVVJJW3dhc20tbWV0YWRhdGEtMC4yNDQuMC5zaGEyNTZzdW1dID0gImJiMGUz
NTNlNmEyZmJkYzE3NjkzMmJiYWFiNDkzNzYyZWIxMjU1YTc5MDBmZTBmZWExYTJmOTZjMjk2Y2M5
MDkiCi1TUkNfVVJJW3dhc21wYXJzZXItMC4yNDQuMC5zaGEyNTZzdW1dID0gIjQ3YjgwN2M3MmUx
YmFjNjkzODJiM2E2ZmIzZGJlOGVhNGMwZWQ4N2ZmNTYyOWI4Njg1YWU2YjlhNjExMDI4ZmUiCiBT
UkNfVVJJW3dpbmFwaS11dGlsLTAuMS4xMS5zaGEyNTZzdW1dID0gImMyYTdiMWMwM2M4NzYxMjJh
YTQzZjMwMjBlNmMzYzNlZTVjMDUwODFjOWEwMDczOWZhZjc1MDNhZWJhMTBkMjIiCiBTUkNfVVJJ
W3dpbmRvd3MtMC42MS4zLnNoYTI1NnN1bV0gPSAiOWJhYmQzYTc2N2E0YzFhZWY2OTAwNDA5Zjg1
ZjVkNTNjZTI1NDRjY2RmYWE4NmRhZDQ4YzkxNzgyYzZkNjg5MyIKIFNSQ19VUklbd2luZG93cy1j
b2xsZWN0aW9ucy0wLjIuMC5zaGEyNTZzdW1dID0gIjNiZWVjZWI1ZTVjZmQ5ZWIxZDc2YjM4MTYz
MGU4MmM0MjQxY2NkMGQyN2YxYTM5ZWQ0MWIyNzYwYjI1NWM1ZTgiCkBAIC01ODUsMTIgKzU1NSw2
IEBAIFNSQ19VUklbd2luZG93c194ODZfNjRfZ251LTAuNTIuNi5zaGEyNTZzdW1dID0gIjE0N2E1
YzgwYWFiZmJmMGM3ZDkwMWNiNTg5NWQxZGUzCiBTUkNfVVJJW3dpbmRvd3NfeDg2XzY0X2dudWxs
dm0tMC41Mi42LnNoYTI1NnN1bV0gPSAiMjRkNWIyM2RjNDE3NDEyNjc5NjgxMzk2ZjJiNDlmM2Rl
OGMxNDczZGViNTE2YmQzNDQxMDg3MmVmZjUxZWQwZCIKIFNSQ19VUklbd2luZG93c194ODZfNjRf
bXN2Yy0wLjUyLjYuc2hhMjU2c3VtXSA9ICI1ODlmNmRhODRjNjQ2MjA0NzQ3ZDEyNzBhMmE1NjYx
ZWE2NmVkMWNjZWQyNjMxZDU0NmZkZmIxNTU5NTlmOWVjIgogU1JDX1VSSVt3aW5ub3ctMS4wLjMu
c2hhMjU2c3VtXSA9ICIwNTkyZTFjOWQxNTFmODU0ZTZmZDM4MjU3NGMzYTA4NTUyNTBlMWQ5YjJm
OTlkOTI4MWM2ZTYzOTFhZjM1MmYxIgotU1JDX1VSSVt3aXQtYmluZGdlbi0wLjUxLjAuc2hhMjU2
c3VtXSA9ICJkNzI0OTIxOWY2NmNlZDAyOTY5Mzg4Y2YyYmIwNDRhMDk3NTZhMDgzZDBmYWIxZTU2
NjA1NmIwNGQ5ZmJjYWE1IgotU1JDX1VSSVt3aXQtYmluZGdlbi1jb3JlLTAuNTEuMC5zaGEyNTZz
dW1dID0gImVhNjFkZTY4NGMzZWE2OGNiMDgyYjdhODg1MDhhOGIyN2ZjYzhiNzk3ZDczOGJmYzk5
YTgyZmFjZjFkNzUyZGMiCi1TUkNfVVJJW3dpdC1iaW5kZ2VuLXJ1c3QtMC41MS4wLnNoYTI1NnN1
bV0gPSAiYjdjNTY2ZTBmNGIyODRkZDY1NjFjNzg2ZDljYjAxNDJkYTQ5MWY0NmE5ZmJlZDc5ZWE2
OWNkYWQ1ZGIxN2YyMSIKLVNSQ19VUklbd2l0LWJpbmRnZW4tcnVzdC1tYWNyby0wLjUxLjAuc2hh
MjU2c3VtXSA9ICIwYzBmOWJmZDc3ZTZhNDhlY2NmNTEzNTllM2FlNzcxNDBhN2Y1MGIxZTJlYmZl
NjI0MjJkOGFmZGFmZmFiMTdhIgotU1JDX1VSSVt3aXQtY29tcG9uZW50LTAuMjQ0LjAuc2hhMjU2
c3VtXSA9ICI5ZDY2ZWEyMGU5NTUzYjMwMTcyYjVlODMxOTk0ZTM1ZmJkZTJkMTY1MzI1YmVjODRm
YzQzZGJmNmY0ZWI5Y2IyIgotU1JDX1VSSVt3aXQtcGFyc2VyLTAuMjQ0LjAuc2hhMjU2c3VtXSA9
ICJlY2M4YWM0YmMxZGMzMzgxYjdmNTljMzRmMDBiNjdlMThmOTEwYzJjMGY1MDAxNTY2OWRkZTdk
ZWY2NTZhNzM2IgogU1JDX1VSSVt3cml0ZWFibGUtMC42LjIuc2hhMjU2c3VtXSA9ICI5ZWRkZTBk
YjQ3NjlkMmRjNjg1Nzk4OTNmMjMwNmIyNmM2ZWNmYmUwZWY0OTliMDEzZDczMWI3YjkyNDdlMGI5
IgogU1JDX1VSSVt4YXR0ci0xLjYuMS5zaGEyNTZzdW1dID0gIjMyZTQ1YWQ0MjA2ZjZkMjQ3OTA4
NTE0N2YwMmJjMmVmODM0YWM4NTg4NjYyNGEyMzU3NWFlMTM3YzhhYTgxNTYiCiBTUkNfVVJJW3h6
Mi0wLjEuNy5zaGEyNTZzdW1dID0gIjM4OGM0NGRjMDlkNzZmMTUzNjYwMmVhZDZkMzI1ZWI1MzJm
NWMxMjJmMTc3ODJiZDU3ZmI0N2JhZWViNzY3ZTIiCmRpZmYgLS1naXQgYS9tZXRhL3JlY2lwZXMt
ZGV2dG9vbHMvcHl0aG9uL3B5dGhvbjMtdXYtYnVpbGRfMC4xMS4yOC5iYiBiL21ldGEvcmVjaXBl
cy1kZXZ0b29scy9weXRob24vcHl0aG9uMy11di1idWlsZF8wLjExLjI5LmJiCnNpbWlsYXJpdHkg
aW5kZXggOTIlCnJlbmFtZSBmcm9tIG1ldGEvcmVjaXBlcy1kZXZ0b29scy9weXRob24vcHl0aG9u
My11di1idWlsZF8wLjExLjI4LmJiCnJlbmFtZSB0byBtZXRhL3JlY2lwZXMtZGV2dG9vbHMvcHl0
aG9uL3B5dGhvbjMtdXYtYnVpbGRfMC4xMS4yOS5iYgppbmRleCAwOGFiMDk3NDgyLi5hMmZkY2U0
N2EwIDEwMDY0NAotLS0gYS9tZXRhL3JlY2lwZXMtZGV2dG9vbHMvcHl0aG9uL3B5dGhvbjMtdXYt
YnVpbGRfMC4xMS4yOC5iYgorKysgYi9tZXRhL3JlY2lwZXMtZGV2dG9vbHMvcHl0aG9uL3B5dGhv
bjMtdXYtYnVpbGRfMC4xMS4yOS5iYgpAQCAtMTEsNyArMTEsNyBAQCBMSUNfRklMRVNfQ0hLU1VN
ID0gImZpbGU6Ly9MSUNFTlNFLUFQQUNIRTttZDU9ODZkM2YzYTk1YzMyNGM5NDc5YmQ4OTg2OTY4
ZjQzMjcgXAogICAgICAgICAgICAgICAgICAgICBmaWxlOi8vY3JhdGVzL3V2LXBlcDUwOC9MaWNl
bnNlLUFwYWNoZTttZDU9ZTIzZmFkZDZjZWVmOGM2MThmYzFjNjUxOTFkODQ2ZmEgXAogICAgICAg
ICAgICAgICAgICAgICBmaWxlOi8vY3JhdGVzL3V2LXBlcDUwOC9MaWNlbnNlLUJTRDttZDU9ZWY3
YTYwMjdkYzRjMjM4OWI5YWZhZDdlNjkwMjc0YzciCiAKLVNSQ19VUklbc2hhMjU2c3VtXSA9ICJk
YWJhNjZmZDI1YTlhODJjYWEyMzk0OTY4NmU5NjdjYmI2OWZkMDU2MTc3ZTk5MTY1MDY0MzE4NjA1
N2FkYWVmIgorU1JDX1VSSVtzaGEyNTZzdW1dID0gIjdkZDE2ZDUwMzY2ZjQxMGFlNDk0YTI3YmUy
MGI0NTIwNmZlZWFjMzdkOTlkYzUzYWJmYTFhMDQ0MTAwNjliNzgiCiAKIHJlcXVpcmUgJHtCUE59
LWNyYXRlcy5pbmMKIAotLSAKMi40Ny4xCgo=

--===============2104764467314560601==--

