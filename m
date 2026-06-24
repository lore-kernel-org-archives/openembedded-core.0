Return-Path: <auh@yoctoproject.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 4BDD0CDE004
	for <webhook@archiver.kernel.org>; Wed, 24 Jun 2026 05:40:22 +0000 (UTC)
Received: from a27-30.smtp-out.us-west-2.amazonses.com (a27-30.smtp-out.us-west-2.amazonses.com [54.240.27.30])
 by mx.groups.io with SMTP id smtpd.msgproc02-g2.680.1782279616107043945
 for <openembedded-core@lists.openembedded.org>;
 Tue, 23 Jun 2026 22:40:16 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@yoctoproject.org header.s=lvjh2tk576v2ro5mi6k4dt3mc6wpqbky header.b=A/qY5cPj;
 dkim=pass header.i=@amazonses.com header.s=hsbnp7p3ensaochzwyq5wwmceodymuwv header.b=QrntXt3X;
 spf=pass (domain: us-west-2.amazonses.com, ip: 54.240.27.30, mailfrom: 0101019ef824b1cd-d7890465-5c9b-47ef-a357-819f7a1aa5af-000000@us-west-2.amazonses.com)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/simple;
	s=lvjh2tk576v2ro5mi6k4dt3mc6wpqbky; d=yoctoproject.org;
	t=1782279615;
	h=Content-Type:MIME-Version:From:To:Cc:Subject:Message-Id:Date;
	bh=UCVZey8JKgGbIAMKQle7qjyc3/HS8Y+0j1DHrbFHjGM=;
	b=A/qY5cPjwdCtwhRr8kbUZBIrbTK2Anrp9FUULz4ThpCaGQyfW/z01ngwnnIkZEc5
	yqxtHqNtIe6lSJqmv6MwQhmatjDiY0B/dk/8kHFlrF58DUbkFf1PAVTgWFlAOUYfhEZ
	+XtrusYDEiVZVPqhxUCLM4Qga7N3SiRSdY1AbcbI=
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/simple;
	s=hsbnp7p3ensaochzwyq5wwmceodymuwv; d=amazonses.com; t=1782279615;
	h=Content-Type:MIME-Version:From:To:Cc:Subject:Message-Id:Date:Feedback-ID;
	bh=UCVZey8JKgGbIAMKQle7qjyc3/HS8Y+0j1DHrbFHjGM=;
	b=QrntXt3XXeUxa3UjGJB+WQd4cyHwUYoPXsT4A2XqHGwHLj03WK5wXS5ySwuXQulr
	I5/qmBkKTCSMJtl1jGiMGX/irRoVgODWYAZOL/lNJtEqUc2DKGX3yDgUGKAWkgdKDQm
	jHa5VS0mDoYY5UE+R5xgRfb1UsvarDzztLzwKKos=
Content-Type: multipart/mixed; boundary="===============5378969914786936916=="
MIME-Version: 1.0
From: auh@yoctoproject.org
To: Trevor Gamblin <tgamblin@baylibre.com>
Cc: openembedded-core@lists.openembedded.org
Subject: [AUH] python3-uv-build: upgrading to 0.11.24 SUCCEEDED
Message-ID: <0101019ef824b1cd-d7890465-5c9b-47ef-a357-819f7a1aa5af-000000@us-west-2.amazonses.com>
Date: Wed, 24 Jun 2026 05:40:14 +0000
Feedback-ID: ::1.us-west-2.9np3MYPs3fEaOBysGKSlUD4KtcmPijcmS9Az2Hwf7iQ=:AmazonSES
X-SES-Outgoing: 2026.06.24-54.240.27.30
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Wed, 24 Jun 2026 05:40:22 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/239471

--===============5378969914786936916==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit

Hello,

this email is a notification from the Auto Upgrade Helper
that the automatic attempt to upgrade the recipe(s) *python3-uv-build* to *0.11.24* has Succeeded.

Next steps:
    - apply the patch: git am 0001-python3-uv-build-upgrade-0.11.21-0.11.24.patch
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
From 8af1565fe24d6083c845153277fb1e32b2d6ddc8 Mon Sep 17 00:00:00 2001
From: Upgrade Helper <auh@yoctoproject.org>
Date: Wed, 24 Jun 2026 05:31:58 +0000
Subject: [PATCH] python3-uv-build: upgrade 0.11.21 -> 0.11.24

---
 .../python/python3-uv-build-crates.inc        | 62 ++++++-------------
 ...0.11.21.bb => python3-uv-build_0.11.24.bb} |  2 +-
 2 files changed, 19 insertions(+), 45 deletions(-)
 rename meta/recipes-devtools/python/{python3-uv-build_0.11.21.bb => python3-uv-build_0.11.24.bb} (92%)

diff --git a/meta/recipes-devtools/python/python3-uv-build-crates.inc b/meta/recipes-devtools/python/python3-uv-build-crates.inc
index be20115668..dffd4e8a9f 100644
--- a/meta/recipes-devtools/python/python3-uv-build-crates.inc
+++ b/meta/recipes-devtools/python/python3-uv-build-crates.inc
@@ -20,7 +20,7 @@ SRC_URI += " \
     crate://crates.io/autocfg/1.5.0 \
     crate://crates.io/backon/1.6.0 \
     crate://crates.io/base64/0.22.1 \
-    crate://crates.io/bitflags/2.11.1 \
+    crate://crates.io/bitflags/2.13.0 \
     crate://crates.io/block-buffer/0.10.4 \
     crate://crates.io/boxcar/0.2.14 \
     crate://crates.io/bstr/1.12.1 \
@@ -79,7 +79,6 @@ SRC_URI += " \
     crate://crates.io/futures-util/0.3.32 \
     crate://crates.io/generic-array/0.14.7 \
     crate://crates.io/getrandom/0.3.3 \
-    crate://crates.io/getrandom/0.4.1 \
     crate://crates.io/globset/0.4.18 \
     crate://crates.io/gloo-timers/0.3.0 \
     crate://crates.io/hashbrown/0.15.5 \
@@ -93,12 +92,11 @@ SRC_URI += " \
     crate://crates.io/icu_properties/2.1.2 \
     crate://crates.io/icu_properties_data/2.1.2 \
     crate://crates.io/icu_provider/2.1.1 \
-    crate://crates.io/id-arena/2.3.0 \
     crate://crates.io/idna/1.1.0 \
     crate://crates.io/idna_adapter/1.2.1 \
     crate://crates.io/indexmap/2.14.0 \
     crate://crates.io/indoc/2.0.7 \
-    crate://crates.io/insta/1.47.2 \
+    crate://crates.io/insta/1.48.0 \
     crate://crates.io/is_terminal_polyfill/1.70.2 \
     crate://crates.io/itertools/0.14.0 \
     crate://crates.io/itoa/1.0.17 \
@@ -110,7 +108,6 @@ SRC_URI += " \
     crate://crates.io/js-sys/0.3.91 \
     crate://crates.io/junction/2.0.0 \
     crate://crates.io/lazy_static/1.5.0 \
-    crate://crates.io/leb128fmt/0.1.0 \
     crate://crates.io/libc/0.2.186 \
     crate://crates.io/linux-raw-sys/0.12.1 \
     crate://crates.io/litemap/0.8.1 \
@@ -119,7 +116,7 @@ SRC_URI += " \
     crate://crates.io/lzma-sys/0.1.20 \
     crate://crates.io/mailparse/0.16.1 \
     crate://crates.io/matchers/0.2.0 \
-    crate://crates.io/memchr/2.8.1 \
+    crate://crates.io/memchr/2.8.2 \
     crate://crates.io/miniz_oxide/0.8.9 \
     crate://crates.io/mio/1.2.0 \
     crate://crates.io/munge/0.4.7 \
@@ -145,7 +142,6 @@ SRC_URI += " \
     crate://crates.io/portable-atomic/1.13.1 \
     crate://crates.io/portable-atomic-util/0.2.6 \
     crate://crates.io/potential_utf/0.1.4 \
-    crate://crates.io/prettyplease/0.2.37 \
     crate://crates.io/proc-macro2/1.0.106 \
     crate://crates.io/ptr_meta/0.3.1 \
     crate://crates.io/ptr_meta_derive/0.3.1 \
@@ -157,9 +153,9 @@ SRC_URI += " \
     crate://crates.io/ref-cast/1.0.25 \
     crate://crates.io/ref-cast-impl/1.0.25 \
     crate://crates.io/reflink-copy/0.1.29 \
-    crate://crates.io/regex/1.12.3 \
+    crate://crates.io/regex/1.12.4 \
     crate://crates.io/regex-automata/0.4.14 \
-    crate://crates.io/regex-syntax/0.8.10 \
+    crate://crates.io/regex-syntax/0.8.11 \
     crate://crates.io/rend/0.5.3 \
     crate://crates.io/rkyv/0.8.16 \
     crate://crates.io/rkyv_derive/0.8.16 \
@@ -173,7 +169,6 @@ SRC_URI += " \
     crate://crates.io/scopeguard/1.2.0 \
     crate://crates.io/seahash/4.1.0 \
     crate://crates.io/self-replace/1.5.0 \
-    crate://crates.io/semver/1.0.27 \
     crate://crates.io/serde/1.0.228 \
     crate://crates.io/serde-untagged/0.1.9 \
     crate://crates.io/serde_core/1.0.228 \
@@ -189,10 +184,11 @@ SRC_URI += " \
     crate://crates.io/simdutf8/0.1.5 \
     crate://crates.io/similar/2.7.0 \
     crate://crates.io/slab/0.4.12 \
-    crate://crates.io/smallvec/1.15.1 \
+    crate://crates.io/smallvec/1.15.2 \
     crate://crates.io/smawk/0.3.2 \
     crate://crates.io/spdx/0.13.4 \
     crate://crates.io/stable_deref_trait/1.2.1 \
+    crate://crates.io/strip-ansi-escapes/0.2.1 \
     crate://crates.io/strsim/0.11.1 \
     crate://crates.io/syn/2.0.117 \
     crate://crates.io/synstructure/0.13.2 \
@@ -228,26 +224,22 @@ SRC_URI += " \
     crate://crates.io/unicode-ident/1.0.24 \
     crate://crates.io/unicode-linebreak/0.1.5 \
     crate://crates.io/unicode-width/0.2.2 \
-    crate://crates.io/unicode-xid/0.2.6 \
     crate://crates.io/unscanny/0.1.0 \
     crate://crates.io/url/2.5.8 \
     crate://crates.io/utf8_iter/1.0.4 \
     crate://crates.io/utf8parse/0.2.2 \
-    crate://crates.io/uuid/1.23.2 \
+    crate://crates.io/uuid/1.23.3 \
     crate://crates.io/valuable/0.1.1 \
     crate://crates.io/version_check/0.9.5 \
+    crate://crates.io/vte/0.14.1 \
     crate://crates.io/walkdir/2.5.0 \
     crate://crates.io/wasi/0.11.1+wasi-snapshot-preview1 \
     crate://crates.io/wasi/0.14.7+wasi-0.2.4 \
     crate://crates.io/wasip2/1.0.2+wasi-0.2.9 \
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
@@ -274,11 +266,6 @@ SRC_URI += " \
     crate://crates.io/windows_x86_64_msvc/0.52.6 \
     crate://crates.io/winnow/1.0.3 \
     crate://crates.io/wit-bindgen/0.51.0 \
-    crate://crates.io/wit-bindgen-core/0.51.0 \
-    crate://crates.io/wit-bindgen-rust/0.51.0 \
-    crate://crates.io/wit-bindgen-rust-macro/0.51.0 \
-    crate://crates.io/wit-component/0.244.0 \
-    crate://crates.io/wit-parser/0.244.0 \
     crate://crates.io/writeable/0.6.2 \
     crate://crates.io/xattr/1.6.1 \
     crate://crates.io/xz2/0.1.7 \
@@ -314,7 +301,7 @@ SRC_URI[async-compression-0.4.19.sha256sum] = "06575e6a9673580f52661c92107baabff
 SRC_URI[autocfg-1.5.0.sha256sum] = "c08606f8c3cbf4ce6ec8e28fb0014a2c086708fe954eaa885384a6165172e7e8"
 SRC_URI[backon-1.6.0.sha256sum] = "cffb0e931875b666fc4fcb20fee52e9bbd1ef836fd9e9e04ec21555f9f85f7ef"
 SRC_URI[base64-0.22.1.sha256sum] = "72b3254f16251a8381aa12e40e3c4d2f0199f8c6508fbecb9d91f575e0fbb8c6"
-SRC_URI[bitflags-2.11.1.sha256sum] = "c4512299f36f043ab09a583e57bceb5a5aab7a73db1805848e8fef3c9e8c78b3"
+SRC_URI[bitflags-2.13.0.sha256sum] = "b4388bee8683e3d04af747c73422af53102d2bd24d9eadb6cbc100baef4b43f8"
 SRC_URI[block-buffer-0.10.4.sha256sum] = "3078c7629b62d3f0439517fa394996acacc5cbc91c5a20d8c658e77abd503a71"
 SRC_URI[boxcar-0.2.14.sha256sum] = "36f64beae40a84da1b4b26ff2761a5b895c12adc41dc25aaee1c4f2bbfe97a6e"
 SRC_URI[bstr-1.12.1.sha256sum] = "63044e1ae8e69f3b5a92c736ca6269b8d12fa7efe39bf34ddb06d102cf0e2cab"
@@ -373,7 +360,6 @@ SRC_URI[futures-task-0.3.32.sha256sum] = "037711b3d59c33004d3856fbdc83b99d4ff37a
 SRC_URI[futures-util-0.3.32.sha256sum] = "389ca41296e6190b48053de0321d02a77f32f8a5d2461dd38762c0593805c6d6"
 SRC_URI[generic-array-0.14.7.sha256sum] = "85649ca51fd72272d7821adaf274ad91c288277713d9c18820d8499a7ff69e9a"
 SRC_URI[getrandom-0.3.3.sha256sum] = "26145e563e54f2cadc477553f1ec5ee650b00862f0a58bcd12cbdc5f0ea2d2f4"
-SRC_URI[getrandom-0.4.1.sha256sum] = "139ef39800118c7683f2fd3c98c1b23c09ae076556b435f8e9064ae108aaeeec"
 SRC_URI[globset-0.4.18.sha256sum] = "52dfc19153a48bde0cbd630453615c8151bce3a5adfac7a0aebfbf0a1e1f57e3"
 SRC_URI[gloo-timers-0.3.0.sha256sum] = "bbb143cf96099802033e0d4f4963b19fd2e0b728bcf076cd9cf7f6634f092994"
 SRC_URI[hashbrown-0.15.5.sha256sum] = "9229cfe53dfd69f0609a49f65461bd93001ea1ef889cd5529dd176593f5338a1"
@@ -387,12 +373,11 @@ SRC_URI[icu_normalizer_data-2.1.1.sha256sum] = "7aedcccd01fc5fe81e6b489c15b247b8
 SRC_URI[icu_properties-2.1.2.sha256sum] = "020bfc02fe870ec3a66d93e677ccca0562506e5872c650f893269e08615d74ec"
 SRC_URI[icu_properties_data-2.1.2.sha256sum] = "616c294cf8d725c6afcd8f55abc17c56464ef6211f9ed59cccffe534129c77af"
 SRC_URI[icu_provider-2.1.1.sha256sum] = "85962cf0ce02e1e0a629cc34e7ca3e373ce20dda4c4d7294bbd0bf1fdb59e614"
-SRC_URI[id-arena-2.3.0.sha256sum] = "3d3067d79b975e8844ca9eb072e16b31c3c1c36928edf9c6789548c524d0d954"
 SRC_URI[idna-1.1.0.sha256sum] = "3b0875f23caa03898994f6ddc501886a45c7d3d62d04d2d90788d47be1b1e4de"
 SRC_URI[idna_adapter-1.2.1.sha256sum] = "3acae9609540aa318d1bc588455225fb2085b9ed0c4f6bd0d9d5bcd86f1a0344"
 SRC_URI[indexmap-2.14.0.sha256sum] = "d466e9454f08e4a911e14806c24e16fba1b4c121d1ea474396f396069cf949d9"
 SRC_URI[indoc-2.0.7.sha256sum] = "79cf5c93f93228cf8efb3ba362535fb11199ac548a09ce117c9b1adc3030d706"
-SRC_URI[insta-1.47.2.sha256sum] = "7b4a6248eb93a4401ed2f37dfe8ea592d3cf05b7cf4f8efa867b6895af7e094e"
+SRC_URI[insta-1.48.0.sha256sum] = "86f0f8fee8c926415c58d6ae43a08523a26faccb2323f5e6b644fe7dd4ef6b82"
 SRC_URI[is_terminal_polyfill-1.70.2.sha256sum] = "a6cb138bb79a146c1bd460005623e142ef0181e3d0219cb493e02f7d08a35695"
 SRC_URI[itertools-0.14.0.sha256sum] = "2b192c782037fadd9cfa75548310488aabdbf3d2da73885b31bd0abd03351285"
 SRC_URI[itoa-1.0.17.sha256sum] = "92ecc6618181def0457392ccd0ee51198e065e016d1d527a7ac1b6dc7c1f09d2"
@@ -404,7 +389,6 @@ SRC_URI[jobserver-0.1.34.sha256sum] = "9afb3de4395d6b3e67a780b6de64b51c978ecf11c
 SRC_URI[js-sys-0.3.91.sha256sum] = "b49715b7073f385ba4bc528e5747d02e66cb39c6146efb66b781f131f0fb399c"
 SRC_URI[junction-2.0.0.sha256sum] = "160f2eade097f30263b548aae5deb12ad349c909baa710fa24b92c9090b2e006"
 SRC_URI[lazy_static-1.5.0.sha256sum] = "bbd2bcb4c963f2ddae06a2efc7e9f3591312473c50c6685e1f298068316e66fe"
-SRC_URI[leb128fmt-0.1.0.sha256sum] = "09edd9e8b54e49e587e4f6295a7d29c3ea94d469cb40ab8ca70b288248a81db2"
 SRC_URI[libc-0.2.186.sha256sum] = "68ab91017fe16c622486840e4c83c9a37afeff978bd239b5293d61ece587de66"
 SRC_URI[linux-raw-sys-0.12.1.sha256sum] = "32a66949e030da00e8c7d4434b251670a91556f4144941d37452769c25d58a53"
 SRC_URI[litemap-0.8.1.sha256sum] = "6373607a59f0be73a39b6fe456b8192fcc3585f602af20751600e974dd455e77"
@@ -413,7 +397,7 @@ SRC_URI[log-0.4.29.sha256sum] = "5e5032e24019045c762d3c0f28f5b6b8bbf38563a659083
 SRC_URI[lzma-sys-0.1.20.sha256sum] = "5fda04ab3764e6cde78b9974eec4f779acaba7c4e84b36eca3cf77c581b85d27"
 SRC_URI[mailparse-0.16.1.sha256sum] = "60819a97ddcb831a5614eb3b0174f3620e793e97e09195a395bfa948fd68ed2f"
 SRC_URI[matchers-0.2.0.sha256sum] = "d1525a2a28c7f4fa0fc98bb91ae755d1e2d1505079e05539e35bc876b5d65ae9"
-SRC_URI[memchr-2.8.1.sha256sum] = "6b947ae49db0d222b1dbc6b113ce7248a3fc3a6ca21b696717bfc000ba4484d8"
+SRC_URI[memchr-2.8.2.sha256sum] = "88904434abc2901f197fe8cc55f0445e7ded921dba5911dad2e2b39b48e663c4"
 SRC_URI[miniz_oxide-0.8.9.sha256sum] = "1fa76a2c86f704bdb222d66965fb3d63269ce38518b83cb0575fca855ebb6316"
 SRC_URI[mio-1.2.0.sha256sum] = "50b7e5b27aa02a74bac8c3f23f448f8d87ff11f92d3aac1a6ed369ee08cc56c1"
 SRC_URI[munge-0.4.7.sha256sum] = "5e17401f259eba956ca16491461b6e8f72913a0a114e39736ce404410f915a0c"
@@ -439,7 +423,6 @@ SRC_URI[pkg-config-0.3.32.sha256sum] = "7edddbd0b52d732b21ad9a5fab5c704c14cd949e
 SRC_URI[portable-atomic-1.13.1.sha256sum] = "c33a9471896f1c69cecef8d20cbe2f7accd12527ce60845ff44c153bb2a21b49"
 SRC_URI[portable-atomic-util-0.2.6.sha256sum] = "091397be61a01d4be58e7841595bd4bfedb15f1cd54977d79b8271e94ed799a3"
 SRC_URI[potential_utf-0.1.4.sha256sum] = "b73949432f5e2a09657003c25bca5e19a0e9c84f8058ca374f49e0ebe605af77"
-SRC_URI[prettyplease-0.2.37.sha256sum] = "479ca8adacdd7ce8f1fb39ce9ecccbfe93a3f1344b3d0d97f20bc0196208f62b"
 SRC_URI[proc-macro2-1.0.106.sha256sum] = "8fd00f0bb2e90d81d1044c2b32617f68fcb9fa3bb7640c23e9c748e53fb30934"
 SRC_URI[ptr_meta-0.3.1.sha256sum] = "0b9a0cf95a1196af61d4f1cbdab967179516d9a4a4312af1f31948f8f6224a79"
 SRC_URI[ptr_meta_derive-0.3.1.sha256sum] = "7347867d0a7e1208d93b46767be83e2b8f978c3dad35f775ac8d8847551d6fe1"
@@ -451,9 +434,9 @@ SRC_URI[redox_syscall-0.5.15.sha256sum] = "7e8af0dde094006011e6a740d487931943948
 SRC_URI[ref-cast-1.0.25.sha256sum] = "f354300ae66f76f1c85c5f84693f0ce81d747e2c3f21a45fef496d89c960bf7d"
 SRC_URI[ref-cast-impl-1.0.25.sha256sum] = "b7186006dcb21920990093f30e3dea63b7d6e977bf1256be20c3563a5db070da"
 SRC_URI[reflink-copy-0.1.29.sha256sum] = "13362233b147e57674c37b802d216b7c5e3dcccbed8967c84f0d8d223868ae27"
-SRC_URI[regex-1.12.3.sha256sum] = "e10754a14b9137dd7b1e3e5b0493cc9171fdd105e0ab477f51b72e7f3ac0e276"
+SRC_URI[regex-1.12.4.sha256sum] = "f1292b7759ae1cb9ec195452d1390a074f0cd8541ab7a5a8c31cd6db45d4a6ba"
 SRC_URI[regex-automata-0.4.14.sha256sum] = "6e1dd4122fc1595e8162618945476892eefca7b88c52820e74af6262213cae8f"
-SRC_URI[regex-syntax-0.8.10.sha256sum] = "dc897dd8d9e8bd1ed8cdad82b5966c3e0ecae09fb1907d58efaa013543185d0a"
+SRC_URI[regex-syntax-0.8.11.sha256sum] = "d6f6ff9a378485b298a5286656da665ba74413d36db0979633275d2e708145d4"
 SRC_URI[rend-0.5.3.sha256sum] = "cadadef317c2f20755a64d7fdc48f9e7178ee6b0e1f7fce33fa60f1d68a276e6"
 SRC_URI[rkyv-0.8.16.sha256sum] = "73389e0c99e664f919275ab5b5b0471391fe9a8de61e1dff9b1eaf56a90f16e3"
 SRC_URI[rkyv_derive-0.8.16.sha256sum] = "5d2ed0b54125315fb36bd021e82d314d1c126548f871634b483f46b31d13cac6"
@@ -467,7 +450,6 @@ SRC_URI[schemars_derive-1.2.1.sha256sum] = "7d115b50f4aaeea07e79c1912f645c7513d8
 SRC_URI[scopeguard-1.2.0.sha256sum] = "94143f37725109f92c262ed2cf5e59bce7498c01bcc1502d7b9afe439a4e9f49"
 SRC_URI[seahash-4.1.0.sha256sum] = "1c107b6f4780854c8b126e228ea8869f4d7b71260f962fefb57b996b8959ba6b"
 SRC_URI[self-replace-1.5.0.sha256sum] = "03ec815b5eab420ab893f63393878d89c90fdd94c0bcc44c07abb8ad95552fb7"
-SRC_URI[semver-1.0.27.sha256sum] = "d767eb0aabc880b29956c35734170f26ed551a859dbd361d140cdbeca61ab1e2"
 SRC_URI[serde-1.0.228.sha256sum] = "9a8e94ea7f378bd32cbbd37198a4a91436180c5bb472411e48b5ec2e2124ae9e"
 SRC_URI[serde-untagged-0.1.9.sha256sum] = "f9faf48a4a2d2693be24c6289dbe26552776eb7737074e6722891fadbe6c5058"
 SRC_URI[serde_core-1.0.228.sha256sum] = "41d385c7d4ca58e59fc732af25c3983b67ac852c1a25000afe1175de458b67ad"
@@ -483,10 +465,11 @@ SRC_URI[simd-adler32-0.3.8.sha256sum] = "e320a6c5ad31d271ad523dcf3ad13e2767ad8b1
 SRC_URI[simdutf8-0.1.5.sha256sum] = "e3a9fe34e3e7a50316060351f37187a3f546bce95496156754b601a5fa71b76e"
 SRC_URI[similar-2.7.0.sha256sum] = "bbbb5d9659141646ae647b42fe094daf6c6192d1620870b449d9557f748b2daa"
 SRC_URI[slab-0.4.12.sha256sum] = "0c790de23124f9ab44544d7ac05d60440adc586479ce501c1d6d7da3cd8c9cf5"
-SRC_URI[smallvec-1.15.1.sha256sum] = "67b1b7a3b5fe4f1376887184045fcf45c69e92af734b7aaddc05fb777b6fbd03"
+SRC_URI[smallvec-1.15.2.sha256sum] = "8ed6a63f02c8539c91a8685a86f4099661ba3da017932f6ebbea6de3f0fa7c90"
 SRC_URI[smawk-0.3.2.sha256sum] = "b7c388c1b5e93756d0c740965c41e8822f866621d41acbdf6336a6a168f8840c"
 SRC_URI[spdx-0.13.4.sha256sum] = "a8da593e30beb790fc9424502eb898320b44e5eb30367dbda1c1edde8e2f32d7"
 SRC_URI[stable_deref_trait-1.2.1.sha256sum] = "6ce2be8dc25455e1f91df71bfa12ad37d7af1092ae736f3a6cd0e37bc7810596"
+SRC_URI[strip-ansi-escapes-0.2.1.sha256sum] = "2a8f8038e7e7969abb3f1b7c2a811225e9296da208539e0f79c5251d6cac0025"
 SRC_URI[strsim-0.11.1.sha256sum] = "7da8b5736845d9f2fcb837ea5d9e2628564b3b043a70948a3f0b778838c5fb4f"
 SRC_URI[syn-2.0.117.sha256sum] = "e665b8803e7b1d2a727f4023456bbbbe74da67099c585258af0ad9c5013b9b99"
 SRC_URI[synstructure-0.13.2.sha256sum] = "728a70f3dbaf5bab7f0c4b1ac8d7ae5ea60a4b5549c8a5914361c99147a709d2"
@@ -522,26 +505,22 @@ SRC_URI[ucd-trie-0.1.7.sha256sum] = "2896d95c02a80c6d6a5d6e953d479f5ddf2dfdb6a24
 SRC_URI[unicode-ident-1.0.24.sha256sum] = "e6e4313cd5fcd3dad5cafa179702e2b244f760991f45397d14d4ebf38247da75"
 SRC_URI[unicode-linebreak-0.1.5.sha256sum] = "3b09c83c3c29d37506a3e260c08c03743a6bb66a9cd432c6934ab501a190571f"
 SRC_URI[unicode-width-0.2.2.sha256sum] = "b4ac048d71ede7ee76d585517add45da530660ef4390e49b098733c6e897f254"
-SRC_URI[unicode-xid-0.2.6.sha256sum] = "ebc1c04c71510c7f702b52b7c350734c9ff1295c464a03335b00bb84fc54f853"
 SRC_URI[unscanny-0.1.0.sha256sum] = "e9df2af067a7953e9c3831320f35c1cc0600c30d44d9f7a12b01db1cd88d6b47"
 SRC_URI[url-2.5.8.sha256sum] = "ff67a8a4397373c3ef660812acab3268222035010ab8680ec4215f38ba3d0eed"
 SRC_URI[utf8_iter-1.0.4.sha256sum] = "b6c140620e7ffbb22c2dee59cafe6084a59b5ffc27a8859a5f0d494b5d52b6be"
 SRC_URI[utf8parse-0.2.2.sha256sum] = "06abde3611657adf66d383f00b093d7faecc7fa57071cce2578660c9f1010821"
-SRC_URI[uuid-1.23.2.sha256sum] = "d258b83ceec21034727ecee8c382cfa6c3e133699b0742c64571814fb420c9f7"
+SRC_URI[uuid-1.23.3.sha256sum] = "144d6b123cef80b301b8f72a9e2ca4370ddec21950d0a103dd22c437006d2db7"
 SRC_URI[valuable-0.1.1.sha256sum] = "ba73ea9cf16a25df0c8caa16c51acb937d5712a8429db78a3ee29d5dcacd3a65"
 SRC_URI[version_check-0.9.5.sha256sum] = "0b928f33d975fc6ad9f86c8f283853ad26bdd5b10b7f1542aa2fa15e2289105a"
+SRC_URI[vte-0.14.1.sha256sum] = "231fdcd7ef3037e8330d8e17e61011a2c244126acc0a982f4040ac3f9f0bc077"
 SRC_URI[walkdir-2.5.0.sha256sum] = "29790946404f91d9c5d06f9874efddea1dc06c5efe94541a7d6863108e3a5e4b"
 SRC_URI[wasi-0.11.1+wasi-snapshot-preview1.sha256sum] = "ccf3ec651a847eb01de73ccad15eb7d99f80485de043efb2f370cd654f4ea44b"
 SRC_URI[wasi-0.14.7+wasi-0.2.4.sha256sum] = "883478de20367e224c0090af9cf5f9fa85bed63a95c1abf3afc5c083ebc06e8c"
 SRC_URI[wasip2-1.0.2+wasi-0.2.9.sha256sum] = "9517f9239f02c069db75e65f174b3da828fe5f5b945c4dd26bd25d89c03ebcf5"
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
@@ -568,11 +547,6 @@ SRC_URI[windows_x86_64_gnullvm-0.52.6.sha256sum] = "24d5b23dc417412679681396f2b4
 SRC_URI[windows_x86_64_msvc-0.52.6.sha256sum] = "589f6da84c646204747d1270a2a5661ea66ed1cced2631d546fdfb155959f9ec"
 SRC_URI[winnow-1.0.3.sha256sum] = "0592e1c9d151f854e6fd382574c3a0855250e1d9b2f99d9281c6e6391af352f1"
 SRC_URI[wit-bindgen-0.51.0.sha256sum] = "d7249219f66ced02969388cf2bb044a09756a083d0fab1e566056b04d9fbcaa5"
-SRC_URI[wit-bindgen-core-0.51.0.sha256sum] = "ea61de684c3ea68cb082b7a88508a8b27fcc8b797d738bfc99a82facf1d752dc"
-SRC_URI[wit-bindgen-rust-0.51.0.sha256sum] = "b7c566e0f4b284dd6561c786d9cb0142da491f46a9fbed79ea69cdad5db17f21"
-SRC_URI[wit-bindgen-rust-macro-0.51.0.sha256sum] = "0c0f9bfd77e6a48eccf51359e3ae77140a7f50b1e2ebfe62422d8afdaffab17a"
-SRC_URI[wit-component-0.244.0.sha256sum] = "9d66ea20e9553b30172b5e831994e35fbde2d165325bec84fc43dbf6f4eb9cb2"
-SRC_URI[wit-parser-0.244.0.sha256sum] = "ecc8ac4bc1dc3381b7f59c34f00b67e18f910c2c0f50015669dde7def656a736"
 SRC_URI[writeable-0.6.2.sha256sum] = "9edde0db4769d2dc68579893f2306b26c6ecfbe0ef499b013d731b7b9247e0b9"
 SRC_URI[xattr-1.6.1.sha256sum] = "32e45ad4206f6d2479085147f02bc2ef834ac85886624a23575ae137c8aa8156"
 SRC_URI[xz2-0.1.7.sha256sum] = "388c44dc09d76f1536602ead6d325eb532f5c122f17782bd57fb47baeeb767e2"
diff --git a/meta/recipes-devtools/python/python3-uv-build_0.11.21.bb b/meta/recipes-devtools/python/python3-uv-build_0.11.24.bb
similarity index 92%
rename from meta/recipes-devtools/python/python3-uv-build_0.11.21.bb
rename to meta/recipes-devtools/python/python3-uv-build_0.11.24.bb
index 4ee2fdbaa7..7d9ad029e5 100644
--- a/meta/recipes-devtools/python/python3-uv-build_0.11.21.bb
+++ b/meta/recipes-devtools/python/python3-uv-build_0.11.24.bb
@@ -11,7 +11,7 @@ LIC_FILES_CHKSUM = "file://LICENSE-APACHE;md5=86d3f3a95c324c9479bd8986968f4327 \
                     file://crates/uv-pep508/License-Apache;md5=e23fadd6ceef8c618fc1c65191d846fa \
                     file://crates/uv-pep508/License-BSD;md5=ef7a6027dc4c2389b9afad7e690274c7"
 
-SRC_URI[sha256sum] = "d512911d357f71dd7c1be43503ee66ebaba9a8d207998bbea77581e95aadabe6"
+SRC_URI[sha256sum] = "3515e95b28ff73642e8659b10cf4820520a53f98951c7320fdad5ee4f5525ee5"
 
 require ${BPN}-crates.inc
 
-- 
2.47.1


--===============5378969914786936916==
Content-Type: application/octet-stream
MIME-Version: 1.0
Content-Transfer-Encoding: base64
Content-Disposition: attachment;
 filename="0001-python3-uv-build-upgrade-0.11.21-0.11.24.patch"

RnJvbSA4YWYxNTY1ZmUyNGQ2MDgzYzg0NTE1MzI3N2ZiMWUzMmIyZDZkZGM4IE1vbiBTZXAgMTcg
MDA6MDA6MDAgMjAwMQpGcm9tOiBVcGdyYWRlIEhlbHBlciA8YXVoQHlvY3RvcHJvamVjdC5vcmc+
CkRhdGU6IFdlZCwgMjQgSnVuIDIwMjYgMDU6MzE6NTggKzAwMDAKU3ViamVjdDogW1BBVENIXSBw
eXRob24zLXV2LWJ1aWxkOiB1cGdyYWRlIDAuMTEuMjEgLT4gMC4xMS4yNAoKLS0tCiAuLi4vcHl0
aG9uL3B5dGhvbjMtdXYtYnVpbGQtY3JhdGVzLmluYyAgICAgICAgfCA2MiArKysrKystLS0tLS0t
LS0tLS0tCiAuLi4wLjExLjIxLmJiID0+IHB5dGhvbjMtdXYtYnVpbGRfMC4xMS4yNC5iYn0gfCAg
MiArLQogMiBmaWxlcyBjaGFuZ2VkLCAxOSBpbnNlcnRpb25zKCspLCA0NSBkZWxldGlvbnMoLSkK
IHJlbmFtZSBtZXRhL3JlY2lwZXMtZGV2dG9vbHMvcHl0aG9uL3tweXRob24zLXV2LWJ1aWxkXzAu
MTEuMjEuYmIgPT4gcHl0aG9uMy11di1idWlsZF8wLjExLjI0LmJifSAoOTIlKQoKZGlmZiAtLWdp
dCBhL21ldGEvcmVjaXBlcy1kZXZ0b29scy9weXRob24vcHl0aG9uMy11di1idWlsZC1jcmF0ZXMu
aW5jIGIvbWV0YS9yZWNpcGVzLWRldnRvb2xzL3B5dGhvbi9weXRob24zLXV2LWJ1aWxkLWNyYXRl
cy5pbmMKaW5kZXggYmUyMDExNTY2OC4uZGZmZDRlOGE5ZiAxMDA2NDQKLS0tIGEvbWV0YS9yZWNp
cGVzLWRldnRvb2xzL3B5dGhvbi9weXRob24zLXV2LWJ1aWxkLWNyYXRlcy5pbmMKKysrIGIvbWV0
YS9yZWNpcGVzLWRldnRvb2xzL3B5dGhvbi9weXRob24zLXV2LWJ1aWxkLWNyYXRlcy5pbmMKQEAg
LTIwLDcgKzIwLDcgQEAgU1JDX1VSSSArPSAiIFwKICAgICBjcmF0ZTovL2NyYXRlcy5pby9hdXRv
Y2ZnLzEuNS4wIFwKICAgICBjcmF0ZTovL2NyYXRlcy5pby9iYWNrb24vMS42LjAgXAogICAgIGNy
YXRlOi8vY3JhdGVzLmlvL2Jhc2U2NC8wLjIyLjEgXAotICAgIGNyYXRlOi8vY3JhdGVzLmlvL2Jp
dGZsYWdzLzIuMTEuMSBcCisgICAgY3JhdGU6Ly9jcmF0ZXMuaW8vYml0ZmxhZ3MvMi4xMy4wIFwK
ICAgICBjcmF0ZTovL2NyYXRlcy5pby9ibG9jay1idWZmZXIvMC4xMC40IFwKICAgICBjcmF0ZTov
L2NyYXRlcy5pby9ib3hjYXIvMC4yLjE0IFwKICAgICBjcmF0ZTovL2NyYXRlcy5pby9ic3RyLzEu
MTIuMSBcCkBAIC03OSw3ICs3OSw2IEBAIFNSQ19VUkkgKz0gIiBcCiAgICAgY3JhdGU6Ly9jcmF0
ZXMuaW8vZnV0dXJlcy11dGlsLzAuMy4zMiBcCiAgICAgY3JhdGU6Ly9jcmF0ZXMuaW8vZ2VuZXJp
Yy1hcnJheS8wLjE0LjcgXAogICAgIGNyYXRlOi8vY3JhdGVzLmlvL2dldHJhbmRvbS8wLjMuMyBc
Ci0gICAgY3JhdGU6Ly9jcmF0ZXMuaW8vZ2V0cmFuZG9tLzAuNC4xIFwKICAgICBjcmF0ZTovL2Ny
YXRlcy5pby9nbG9ic2V0LzAuNC4xOCBcCiAgICAgY3JhdGU6Ly9jcmF0ZXMuaW8vZ2xvby10aW1l
cnMvMC4zLjAgXAogICAgIGNyYXRlOi8vY3JhdGVzLmlvL2hhc2hicm93bi8wLjE1LjUgXApAQCAt
OTMsMTIgKzkyLDExIEBAIFNSQ19VUkkgKz0gIiBcCiAgICAgY3JhdGU6Ly9jcmF0ZXMuaW8vaWN1
X3Byb3BlcnRpZXMvMi4xLjIgXAogICAgIGNyYXRlOi8vY3JhdGVzLmlvL2ljdV9wcm9wZXJ0aWVz
X2RhdGEvMi4xLjIgXAogICAgIGNyYXRlOi8vY3JhdGVzLmlvL2ljdV9wcm92aWRlci8yLjEuMSBc
Ci0gICAgY3JhdGU6Ly9jcmF0ZXMuaW8vaWQtYXJlbmEvMi4zLjAgXAogICAgIGNyYXRlOi8vY3Jh
dGVzLmlvL2lkbmEvMS4xLjAgXAogICAgIGNyYXRlOi8vY3JhdGVzLmlvL2lkbmFfYWRhcHRlci8x
LjIuMSBcCiAgICAgY3JhdGU6Ly9jcmF0ZXMuaW8vaW5kZXhtYXAvMi4xNC4wIFwKICAgICBjcmF0
ZTovL2NyYXRlcy5pby9pbmRvYy8yLjAuNyBcCi0gICAgY3JhdGU6Ly9jcmF0ZXMuaW8vaW5zdGEv
MS40Ny4yIFwKKyAgICBjcmF0ZTovL2NyYXRlcy5pby9pbnN0YS8xLjQ4LjAgXAogICAgIGNyYXRl
Oi8vY3JhdGVzLmlvL2lzX3Rlcm1pbmFsX3BvbHlmaWxsLzEuNzAuMiBcCiAgICAgY3JhdGU6Ly9j
cmF0ZXMuaW8vaXRlcnRvb2xzLzAuMTQuMCBcCiAgICAgY3JhdGU6Ly9jcmF0ZXMuaW8vaXRvYS8x
LjAuMTcgXApAQCAtMTEwLDcgKzEwOCw2IEBAIFNSQ19VUkkgKz0gIiBcCiAgICAgY3JhdGU6Ly9j
cmF0ZXMuaW8vanMtc3lzLzAuMy45MSBcCiAgICAgY3JhdGU6Ly9jcmF0ZXMuaW8vanVuY3Rpb24v
Mi4wLjAgXAogICAgIGNyYXRlOi8vY3JhdGVzLmlvL2xhenlfc3RhdGljLzEuNS4wIFwKLSAgICBj
cmF0ZTovL2NyYXRlcy5pby9sZWIxMjhmbXQvMC4xLjAgXAogICAgIGNyYXRlOi8vY3JhdGVzLmlv
L2xpYmMvMC4yLjE4NiBcCiAgICAgY3JhdGU6Ly9jcmF0ZXMuaW8vbGludXgtcmF3LXN5cy8wLjEy
LjEgXAogICAgIGNyYXRlOi8vY3JhdGVzLmlvL2xpdGVtYXAvMC44LjEgXApAQCAtMTE5LDcgKzEx
Niw3IEBAIFNSQ19VUkkgKz0gIiBcCiAgICAgY3JhdGU6Ly9jcmF0ZXMuaW8vbHptYS1zeXMvMC4x
LjIwIFwKICAgICBjcmF0ZTovL2NyYXRlcy5pby9tYWlscGFyc2UvMC4xNi4xIFwKICAgICBjcmF0
ZTovL2NyYXRlcy5pby9tYXRjaGVycy8wLjIuMCBcCi0gICAgY3JhdGU6Ly9jcmF0ZXMuaW8vbWVt
Y2hyLzIuOC4xIFwKKyAgICBjcmF0ZTovL2NyYXRlcy5pby9tZW1jaHIvMi44LjIgXAogICAgIGNy
YXRlOi8vY3JhdGVzLmlvL21pbml6X294aWRlLzAuOC45IFwKICAgICBjcmF0ZTovL2NyYXRlcy5p
by9taW8vMS4yLjAgXAogICAgIGNyYXRlOi8vY3JhdGVzLmlvL211bmdlLzAuNC43IFwKQEAgLTE0
NSw3ICsxNDIsNiBAQCBTUkNfVVJJICs9ICIgXAogICAgIGNyYXRlOi8vY3JhdGVzLmlvL3BvcnRh
YmxlLWF0b21pYy8xLjEzLjEgXAogICAgIGNyYXRlOi8vY3JhdGVzLmlvL3BvcnRhYmxlLWF0b21p
Yy11dGlsLzAuMi42IFwKICAgICBjcmF0ZTovL2NyYXRlcy5pby9wb3RlbnRpYWxfdXRmLzAuMS40
IFwKLSAgICBjcmF0ZTovL2NyYXRlcy5pby9wcmV0dHlwbGVhc2UvMC4yLjM3IFwKICAgICBjcmF0
ZTovL2NyYXRlcy5pby9wcm9jLW1hY3JvMi8xLjAuMTA2IFwKICAgICBjcmF0ZTovL2NyYXRlcy5p
by9wdHJfbWV0YS8wLjMuMSBcCiAgICAgY3JhdGU6Ly9jcmF0ZXMuaW8vcHRyX21ldGFfZGVyaXZl
LzAuMy4xIFwKQEAgLTE1Nyw5ICsxNTMsOSBAQCBTUkNfVVJJICs9ICIgXAogICAgIGNyYXRlOi8v
Y3JhdGVzLmlvL3JlZi1jYXN0LzEuMC4yNSBcCiAgICAgY3JhdGU6Ly9jcmF0ZXMuaW8vcmVmLWNh
c3QtaW1wbC8xLjAuMjUgXAogICAgIGNyYXRlOi8vY3JhdGVzLmlvL3JlZmxpbmstY29weS8wLjEu
MjkgXAotICAgIGNyYXRlOi8vY3JhdGVzLmlvL3JlZ2V4LzEuMTIuMyBcCisgICAgY3JhdGU6Ly9j
cmF0ZXMuaW8vcmVnZXgvMS4xMi40IFwKICAgICBjcmF0ZTovL2NyYXRlcy5pby9yZWdleC1hdXRv
bWF0YS8wLjQuMTQgXAotICAgIGNyYXRlOi8vY3JhdGVzLmlvL3JlZ2V4LXN5bnRheC8wLjguMTAg
XAorICAgIGNyYXRlOi8vY3JhdGVzLmlvL3JlZ2V4LXN5bnRheC8wLjguMTEgXAogICAgIGNyYXRl
Oi8vY3JhdGVzLmlvL3JlbmQvMC41LjMgXAogICAgIGNyYXRlOi8vY3JhdGVzLmlvL3JreXYvMC44
LjE2IFwKICAgICBjcmF0ZTovL2NyYXRlcy5pby9ya3l2X2Rlcml2ZS8wLjguMTYgXApAQCAtMTcz
LDcgKzE2OSw2IEBAIFNSQ19VUkkgKz0gIiBcCiAgICAgY3JhdGU6Ly9jcmF0ZXMuaW8vc2NvcGVn
dWFyZC8xLjIuMCBcCiAgICAgY3JhdGU6Ly9jcmF0ZXMuaW8vc2VhaGFzaC80LjEuMCBcCiAgICAg
Y3JhdGU6Ly9jcmF0ZXMuaW8vc2VsZi1yZXBsYWNlLzEuNS4wIFwKLSAgICBjcmF0ZTovL2NyYXRl
cy5pby9zZW12ZXIvMS4wLjI3IFwKICAgICBjcmF0ZTovL2NyYXRlcy5pby9zZXJkZS8xLjAuMjI4
IFwKICAgICBjcmF0ZTovL2NyYXRlcy5pby9zZXJkZS11bnRhZ2dlZC8wLjEuOSBcCiAgICAgY3Jh
dGU6Ly9jcmF0ZXMuaW8vc2VyZGVfY29yZS8xLjAuMjI4IFwKQEAgLTE4OSwxMCArMTg0LDExIEBA
IFNSQ19VUkkgKz0gIiBcCiAgICAgY3JhdGU6Ly9jcmF0ZXMuaW8vc2ltZHV0ZjgvMC4xLjUgXAog
ICAgIGNyYXRlOi8vY3JhdGVzLmlvL3NpbWlsYXIvMi43LjAgXAogICAgIGNyYXRlOi8vY3JhdGVz
LmlvL3NsYWIvMC40LjEyIFwKLSAgICBjcmF0ZTovL2NyYXRlcy5pby9zbWFsbHZlYy8xLjE1LjEg
XAorICAgIGNyYXRlOi8vY3JhdGVzLmlvL3NtYWxsdmVjLzEuMTUuMiBcCiAgICAgY3JhdGU6Ly9j
cmF0ZXMuaW8vc21hd2svMC4zLjIgXAogICAgIGNyYXRlOi8vY3JhdGVzLmlvL3NwZHgvMC4xMy40
IFwKICAgICBjcmF0ZTovL2NyYXRlcy5pby9zdGFibGVfZGVyZWZfdHJhaXQvMS4yLjEgXAorICAg
IGNyYXRlOi8vY3JhdGVzLmlvL3N0cmlwLWFuc2ktZXNjYXBlcy8wLjIuMSBcCiAgICAgY3JhdGU6
Ly9jcmF0ZXMuaW8vc3Ryc2ltLzAuMTEuMSBcCiAgICAgY3JhdGU6Ly9jcmF0ZXMuaW8vc3luLzIu
MC4xMTcgXAogICAgIGNyYXRlOi8vY3JhdGVzLmlvL3N5bnN0cnVjdHVyZS8wLjEzLjIgXApAQCAt
MjI4LDI2ICsyMjQsMjIgQEAgU1JDX1VSSSArPSAiIFwKICAgICBjcmF0ZTovL2NyYXRlcy5pby91
bmljb2RlLWlkZW50LzEuMC4yNCBcCiAgICAgY3JhdGU6Ly9jcmF0ZXMuaW8vdW5pY29kZS1saW5l
YnJlYWsvMC4xLjUgXAogICAgIGNyYXRlOi8vY3JhdGVzLmlvL3VuaWNvZGUtd2lkdGgvMC4yLjIg
XAotICAgIGNyYXRlOi8vY3JhdGVzLmlvL3VuaWNvZGUteGlkLzAuMi42IFwKICAgICBjcmF0ZTov
L2NyYXRlcy5pby91bnNjYW5ueS8wLjEuMCBcCiAgICAgY3JhdGU6Ly9jcmF0ZXMuaW8vdXJsLzIu
NS44IFwKICAgICBjcmF0ZTovL2NyYXRlcy5pby91dGY4X2l0ZXIvMS4wLjQgXAogICAgIGNyYXRl
Oi8vY3JhdGVzLmlvL3V0ZjhwYXJzZS8wLjIuMiBcCi0gICAgY3JhdGU6Ly9jcmF0ZXMuaW8vdXVp
ZC8xLjIzLjIgXAorICAgIGNyYXRlOi8vY3JhdGVzLmlvL3V1aWQvMS4yMy4zIFwKICAgICBjcmF0
ZTovL2NyYXRlcy5pby92YWx1YWJsZS8wLjEuMSBcCiAgICAgY3JhdGU6Ly9jcmF0ZXMuaW8vdmVy
c2lvbl9jaGVjay8wLjkuNSBcCisgICAgY3JhdGU6Ly9jcmF0ZXMuaW8vdnRlLzAuMTQuMSBcCiAg
ICAgY3JhdGU6Ly9jcmF0ZXMuaW8vd2Fsa2Rpci8yLjUuMCBcCiAgICAgY3JhdGU6Ly9jcmF0ZXMu
aW8vd2FzaS8wLjExLjErd2FzaS1zbmFwc2hvdC1wcmV2aWV3MSBcCiAgICAgY3JhdGU6Ly9jcmF0
ZXMuaW8vd2FzaS8wLjE0Ljcrd2FzaS0wLjIuNCBcCiAgICAgY3JhdGU6Ly9jcmF0ZXMuaW8vd2Fz
aXAyLzEuMC4yK3dhc2ktMC4yLjkgXAotICAgIGNyYXRlOi8vY3JhdGVzLmlvL3dhc2lwMy8wLjQu
MCt3YXNpLTAuMy4wLXJjLTIwMjYtMDEtMDYgXAogICAgIGNyYXRlOi8vY3JhdGVzLmlvL3dhc20t
YmluZGdlbi8wLjIuMTE0IFwKICAgICBjcmF0ZTovL2NyYXRlcy5pby93YXNtLWJpbmRnZW4tbWFj
cm8vMC4yLjExNCBcCiAgICAgY3JhdGU6Ly9jcmF0ZXMuaW8vd2FzbS1iaW5kZ2VuLW1hY3JvLXN1
cHBvcnQvMC4yLjExNCBcCiAgICAgY3JhdGU6Ly9jcmF0ZXMuaW8vd2FzbS1iaW5kZ2VuLXNoYXJl
ZC8wLjIuMTE0IFwKLSAgICBjcmF0ZTovL2NyYXRlcy5pby93YXNtLWVuY29kZXIvMC4yNDQuMCBc
Ci0gICAgY3JhdGU6Ly9jcmF0ZXMuaW8vd2FzbS1tZXRhZGF0YS8wLjI0NC4wIFwKLSAgICBjcmF0
ZTovL2NyYXRlcy5pby93YXNtcGFyc2VyLzAuMjQ0LjAgXAogICAgIGNyYXRlOi8vY3JhdGVzLmlv
L3dpbmFwaS11dGlsLzAuMS4xMSBcCiAgICAgY3JhdGU6Ly9jcmF0ZXMuaW8vd2luZG93cy8wLjYx
LjMgXAogICAgIGNyYXRlOi8vY3JhdGVzLmlvL3dpbmRvd3MtY29sbGVjdGlvbnMvMC4yLjAgXApA
QCAtMjc0LDExICsyNjYsNiBAQCBTUkNfVVJJICs9ICIgXAogICAgIGNyYXRlOi8vY3JhdGVzLmlv
L3dpbmRvd3NfeDg2XzY0X21zdmMvMC41Mi42IFwKICAgICBjcmF0ZTovL2NyYXRlcy5pby93aW5u
b3cvMS4wLjMgXAogICAgIGNyYXRlOi8vY3JhdGVzLmlvL3dpdC1iaW5kZ2VuLzAuNTEuMCBcCi0g
ICAgY3JhdGU6Ly9jcmF0ZXMuaW8vd2l0LWJpbmRnZW4tY29yZS8wLjUxLjAgXAotICAgIGNyYXRl
Oi8vY3JhdGVzLmlvL3dpdC1iaW5kZ2VuLXJ1c3QvMC41MS4wIFwKLSAgICBjcmF0ZTovL2NyYXRl
cy5pby93aXQtYmluZGdlbi1ydXN0LW1hY3JvLzAuNTEuMCBcCi0gICAgY3JhdGU6Ly9jcmF0ZXMu
aW8vd2l0LWNvbXBvbmVudC8wLjI0NC4wIFwKLSAgICBjcmF0ZTovL2NyYXRlcy5pby93aXQtcGFy
c2VyLzAuMjQ0LjAgXAogICAgIGNyYXRlOi8vY3JhdGVzLmlvL3dyaXRlYWJsZS8wLjYuMiBcCiAg
ICAgY3JhdGU6Ly9jcmF0ZXMuaW8veGF0dHIvMS42LjEgXAogICAgIGNyYXRlOi8vY3JhdGVzLmlv
L3h6Mi8wLjEuNyBcCkBAIC0zMTQsNyArMzAxLDcgQEAgU1JDX1VSSVthc3luYy1jb21wcmVzc2lv
bi0wLjQuMTkuc2hhMjU2c3VtXSA9ICIwNjU3NWU2YTk2NzM1ODBmNTI2NjFjOTIxMDdiYWFiZmYK
IFNSQ19VUklbYXV0b2NmZy0xLjUuMC5zaGEyNTZzdW1dID0gImMwODYwNmY4YzNjYmY0Y2U2ZWM4
ZTI4ZmIwMDE0YTJjMDg2NzA4ZmU5NTRlYWE4ODUzODRhNjE2NTE3MmU3ZTgiCiBTUkNfVVJJW2Jh
Y2tvbi0xLjYuMC5zaGEyNTZzdW1dID0gImNmZmIwZTkzMTg3NWI2NjZmYzRmY2IyMGZlZTUyZTli
YmQxZWY4MzZmZDllOWUwNGVjMjE1NTVmOWY4NWY3ZWYiCiBTUkNfVVJJW2Jhc2U2NC0wLjIyLjEu
c2hhMjU2c3VtXSA9ICI3MmIzMjU0ZjE2MjUxYTgzODFhYTEyZTQwZTNjNGQyZjAxOTlmOGM2NTA4
ZmJlY2I5ZDkxZjU3NWUwZmJiOGM2IgotU1JDX1VSSVtiaXRmbGFncy0yLjExLjEuc2hhMjU2c3Vt
XSA9ICJjNDUxMjI5OWYzNmYwNDNhYjA5YTU4M2U1N2JjZWI1YTVhYWI3YTczZGIxODA1ODQ4ZThm
ZWYzYzllOGM3OGIzIgorU1JDX1VSSVtiaXRmbGFncy0yLjEzLjAuc2hhMjU2c3VtXSA9ICJiNDM4
OGJlZTg2ODNlM2QwNGFmNzQ3YzczNDIyYWY1MzEwMmQyYmQyNGQ5ZWFkYjZjYmMxMDBiYWVmNGI0
M2Y4IgogU1JDX1VSSVtibG9jay1idWZmZXItMC4xMC40LnNoYTI1NnN1bV0gPSAiMzA3OGM3NjI5
YjYyZDNmMDQzOTUxN2ZhMzk0OTk2YWNhY2M1Y2JjOTFjNWEyMGQ4YzY1OGU3N2FiZDUwM2E3MSIK
IFNSQ19VUklbYm94Y2FyLTAuMi4xNC5zaGEyNTZzdW1dID0gIjM2ZjY0YmVhZTQwYTg0ZGExYjRi
MjZmZjI3NjFhNWI4OTVjMTJhZGM0MWRjMjVhYWVlMWM0ZjJiYmZlOTdhNmUiCiBTUkNfVVJJW2Jz
dHItMS4xMi4xLnNoYTI1NnN1bV0gPSAiNjMwNDRlMWFlOGU2OWYzYjVhOTJjNzM2Y2E2MjY5Yjhk
MTJmYTdlZmUzOWJmMzRkZGIwNmQxMDJjZjBlMmNhYiIKQEAgLTM3Myw3ICszNjAsNiBAQCBTUkNf
VVJJW2Z1dHVyZXMtdGFzay0wLjMuMzIuc2hhMjU2c3VtXSA9ICIwMzc3MTFiM2Q1OWMzMzAwNGQz
ODU2ZmJkYzgzYjk5ZDRmZjM3YQogU1JDX1VSSVtmdXR1cmVzLXV0aWwtMC4zLjMyLnNoYTI1NnN1
bV0gPSAiMzg5Y2E0MTI5NmU2MTkwYjQ4MDUzZGUwMzIxZDAyYTc3ZjMyZjhhNWQyNDYxZGQzODc2
MmMwNTkzODA1YzZkNiIKIFNSQ19VUklbZ2VuZXJpYy1hcnJheS0wLjE0Ljcuc2hhMjU2c3VtXSA9
ICI4NTY0OWNhNTFmZDcyMjcyZDc4MjFhZGFmMjc0YWQ5MWMyODgyNzc3MTNkOWMxODgyMGQ4NDk5
YTdmZjY5ZTlhIgogU1JDX1VSSVtnZXRyYW5kb20tMC4zLjMuc2hhMjU2c3VtXSA9ICIyNjE0NWU1
NjNlNTRmMmNhZGM0Nzc1NTNmMWVjNWVlNjUwYjAwODYyZjBhNThiY2QxMmNiZGM1ZjBlYTJkMmY0
IgotU1JDX1VSSVtnZXRyYW5kb20tMC40LjEuc2hhMjU2c3VtXSA9ICIxMzllZjM5ODAwMTE4Yzc2
ODNmMmZkM2M5OGMxYjIzYzA5YWUwNzY1NTZiNDM1ZjhlOTA2NGFlMTA4YWFlZWVjIgogU1JDX1VS
SVtnbG9ic2V0LTAuNC4xOC5zaGEyNTZzdW1dID0gIjUyZGZjMTkxNTNhNDhiZGUwY2JkNjMwNDUz
NjE1YzgxNTFiY2UzYTVhZGZhYzdhMGFlYmZiZjBhMWUxZjU3ZTMiCiBTUkNfVVJJW2dsb28tdGlt
ZXJzLTAuMy4wLnNoYTI1NnN1bV0gPSAiYmJiMTQzY2Y5NjA5OTgwMjAzM2UwZDRmNDk2M2IxOWZk
MmUwYjcyOGJjZjA3NmNkOWNmN2Y2NjM0ZjA5Mjk5NCIKIFNSQ19VUklbaGFzaGJyb3duLTAuMTUu
NS5zaGEyNTZzdW1dID0gIjkyMjljZmU1M2RmZDY5ZjA2MDlhNDlmNjU0NjFiZDkzMDAxZWExZWY4
ODljZDU1MjlkZDE3NjU5M2Y1MzM4YTEiCkBAIC0zODcsMTIgKzM3MywxMSBAQCBTUkNfVVJJW2lj
dV9ub3JtYWxpemVyX2RhdGEtMi4xLjEuc2hhMjU2c3VtXSA9ICI3YWVkY2NjZDAxZmM1ZmU4MWU2
YjQ4OWMxNWIyNDdiOAogU1JDX1VSSVtpY3VfcHJvcGVydGllcy0yLjEuMi5zaGEyNTZzdW1dID0g
IjAyMGJmYzAyZmU4NzBlYzNhNjZkOTNlNjc3Y2NjYTA1NjI1MDZlNTg3MmM2NTBmODkzMjY5ZTA4
NjE1ZDc0ZWMiCiBTUkNfVVJJW2ljdV9wcm9wZXJ0aWVzX2RhdGEtMi4xLjIuc2hhMjU2c3VtXSA9
ICI2MTZjMjk0Y2Y4ZDcyNWM2YWZjZDhmNTVhYmMxN2M1NjQ2NGVmNjIxMWY5ZWQ1OWNjY2ZmZTUz
NDEyOWM3N2FmIgogU1JDX1VSSVtpY3VfcHJvdmlkZXItMi4xLjEuc2hhMjU2c3VtXSA9ICI4NTk2
MmNmMGNlMDJlMWUwYTYyOWNjMzRlN2NhM2UzNzNjZTIwZGRhNGM0ZDcyOTRiYmQwYmYxZmRiNTll
NjE0IgotU1JDX1VSSVtpZC1hcmVuYS0yLjMuMC5zaGEyNTZzdW1dID0gIjNkMzA2N2Q3OWI5NzVl
ODg0NGNhOWViMDcyZTE2YjMxYzNjMWMzNjkyOGVkZjljNjc4OTU0OGM1MjRkMGQ5NTQiCiBTUkNf
VVJJW2lkbmEtMS4xLjAuc2hhMjU2c3VtXSA9ICIzYjA4NzVmMjNjYWEwMzg5ODk5NGY2ZGRjNTAx
ODg2YTQ1YzdkM2Q2MmQwNGQyZDkwNzg4ZDQ3YmUxYjFlNGRlIgogU1JDX1VSSVtpZG5hX2FkYXB0
ZXItMS4yLjEuc2hhMjU2c3VtXSA9ICIzYWNhZTk2MDk1NDBhYTMxOGQxYmM1ODg0NTUyMjVmYjIw
ODViOWVkMGM0ZjZiZDBkOWQ1YmNkODZmMWEwMzQ0IgogU1JDX1VSSVtpbmRleG1hcC0yLjE0LjAu
c2hhMjU2c3VtXSA9ICJkNDY2ZTk0NTRmMDhlNGE5MTFlMTQ4MDZjMjRlMTZmYmExYjRjMTIxZDFl
YTQ3NDM5NmYzOTYwNjljZjk0OWQ5IgogU1JDX1VSSVtpbmRvYy0yLjAuNy5zaGEyNTZzdW1dID0g
Ijc5Y2Y1YzkzZjkzMjI4Y2Y4ZWZiM2JhMzYyNTM1ZmIxMTE5OWFjNTQ4YTA5Y2UxMTdjOWIxYWRj
MzAzMGQ3MDYiCi1TUkNfVVJJW2luc3RhLTEuNDcuMi5zaGEyNTZzdW1dID0gIjdiNGE2MjQ4ZWI5
M2E0NDAxZWQyZjM3ZGZlOGVhNTkyZDNjZjA1YjdjZjRmOGVmYTg2N2I2ODk1YWY3ZTA5NGUiCitT
UkNfVVJJW2luc3RhLTEuNDguMC5zaGEyNTZzdW1dID0gIjg2ZjBmOGZlZThjOTI2NDE1YzU4ZDZh
ZTQzYTA4NTIzYTI2ZmFjY2IyMzIzZjVlNmI2NDRmZTdkZDRlZjZiODIiCiBTUkNfVVJJW2lzX3Rl
cm1pbmFsX3BvbHlmaWxsLTEuNzAuMi5zaGEyNTZzdW1dID0gImE2Y2IxMzhiYjc5YTE0NmMxYmQ0
NjAwMDU2MjNlMTQyZWYwMTgxZTNkMDIxOWNiNDkzZTAyZjdkMDhhMzU2OTUiCiBTUkNfVVJJW2l0
ZXJ0b29scy0wLjE0LjAuc2hhMjU2c3VtXSA9ICIyYjE5MmM3ODIwMzdmYWRkOWNmYTc1NTQ4MzEw
NDg4YWFiZGJmM2QyZGE3Mzg4NWIzMWJkMGFiZDAzMzUxMjg1IgogU1JDX1VSSVtpdG9hLTEuMC4x
Ny5zaGEyNTZzdW1dID0gIjkyZWNjNjYxODE4MWRlZjA0NTczOTJjY2QwZWU1MTE5OGUwNjVlMDE2
ZDFkNTI3YTdhYzFiNmRjN2MxZjA5ZDIiCkBAIC00MDQsNyArMzg5LDYgQEAgU1JDX1VSSVtqb2Jz
ZXJ2ZXItMC4xLjM0LnNoYTI1NnN1bV0gPSAiOWFmYjNkZTQzOTVkNmIzZTY3YTc4MGI2ZGU2NGI1
MWM5NzhlY2YxMWMKIFNSQ19VUklbanMtc3lzLTAuMy45MS5zaGEyNTZzdW1dID0gImI0OTcxNWI3
MDczZjM4NWJhNGJjNTI4ZTU3NDdkMDJlNjZjYjM5YzYxNDZlZmI2NmI3ODFmMTMxZjBmYjM5OWMi
CiBTUkNfVVJJW2p1bmN0aW9uLTIuMC4wLnNoYTI1NnN1bV0gPSAiMTYwZjJlYWRlMDk3ZjMwMjYz
YjU0OGFhZTVkZWIxMmFkMzQ5YzkwOWJhYTcxMGZhMjRiOTJjOTA5MGIyZTAwNiIKIFNSQ19VUklb
bGF6eV9zdGF0aWMtMS41LjAuc2hhMjU2c3VtXSA9ICJiYmQyYmNiNGM5NjNmMmRkYWUwNmEyZWZj
N2U5ZjM1OTEzMTI0NzNjNTBjNjY4NWUxZjI5ODA2ODMxNmU2NmZlIgotU1JDX1VSSVtsZWIxMjhm
bXQtMC4xLjAuc2hhMjU2c3VtXSA9ICIwOWVkZDllOGI1NGU0OWU1ODdlNGY2Mjk1YTdkMjljM2Vh
OTRkNDY5Y2I0MGFiOGNhNzBiMjg4MjQ4YTgxZGIyIgogU1JDX1VSSVtsaWJjLTAuMi4xODYuc2hh
MjU2c3VtXSA9ICI2OGFiOTEwMTdmZTE2YzYyMjQ4Njg0MGU0YzgzYzlhMzdhZmVmZjk3OGJkMjM5
YjUyOTNkNjFlY2U1ODdkZTY2IgogU1JDX1VSSVtsaW51eC1yYXctc3lzLTAuMTIuMS5zaGEyNTZz
dW1dID0gIjMyYTY2OTQ5ZTAzMGRhMDBlOGM3ZDQ0MzRiMjUxNjcwYTkxNTU2ZjQxNDQ5NDFkMzc0
NTI3NjljMjVkNThhNTMiCiBTUkNfVVJJW2xpdGVtYXAtMC44LjEuc2hhMjU2c3VtXSA9ICI2Mzcz
NjA3YTU5ZjBiZTczYTM5YjZmZTQ1NmI4MTkyZmNjMzU4NWY2MDJhZjIwNzUxNjAwZTk3NGRkNDU1
ZTc3IgpAQCAtNDEzLDcgKzM5Nyw3IEBAIFNSQ19VUklbbG9nLTAuNC4yOS5zaGEyNTZzdW1dID0g
IjVlNTAzMmUyNDAxOTA0NWM3NjJkM2MwZjI4ZjViNmI4YmJmMzg1NjNhNjU5MDgzCiBTUkNfVVJJ
W2x6bWEtc3lzLTAuMS4yMC5zaGEyNTZzdW1dID0gIjVmZGEwNGFiMzc2NGU2Y2RlNzhiOTk3NGVl
YzRmNzc5YWNhYmE3YzRlODRiMzZlY2EzY2Y3N2M1ODFiODVkMjciCiBTUkNfVVJJW21haWxwYXJz
ZS0wLjE2LjEuc2hhMjU2c3VtXSA9ICI2MDgxOWE5N2RkY2I4MzFhNTYxNGViM2IwMTc0ZjM2MjBl
NzkzZTk3ZTA5MTk1YTM5NWJmYTk0OGZkNjhlZDJmIgogU1JDX1VSSVttYXRjaGVycy0wLjIuMC5z
aGEyNTZzdW1dID0gImQxNTI1YTJhMjhjN2Y0ZmEwZmM5OGJiOTFhZTc1NWQxZTJkMTUwNTA3OWUw
NTUzOWUzNWJjODc2YjVkNjVhZTkiCi1TUkNfVVJJW21lbWNoci0yLjguMS5zaGEyNTZzdW1dID0g
IjZiOTQ3YWU0OWRiMGQyMjJiMWRiYzZiMTEzY2U3MjQ4YTNmYzNhNmNhMjFiNjk2NzE3YmZjMDAw
YmE0NDg0ZDgiCitTUkNfVVJJW21lbWNoci0yLjguMi5zaGEyNTZzdW1dID0gIjg4OTA0NDM0YWJj
MjkwMWYxOTdmZThjYzU1ZjA0NDVlN2RlZDkyMWRiYTU5MTFkYWQyZTJiMzliNDhlNjYzYzQiCiBT
UkNfVVJJW21pbml6X294aWRlLTAuOC45LnNoYTI1NnN1bV0gPSAiMWZhNzZhMmM4NmY3MDRiZGIy
MjJkNjY5NjVmYjNkNjMyNjljZTM4NTE4YjgzY2IwNTc1ZmNhODU1ZWJiNjMxNiIKIFNSQ19VUklb
bWlvLTEuMi4wLnNoYTI1NnN1bV0gPSAiNTBiN2U1YjI3YWEwMmE3NGJhYzhjM2YyM2Y0NDhmOGQ4
N2ZmMTFmOTJkM2FhYzFhNmVkMzY5ZWUwOGNjNTZjMSIKIFNSQ19VUklbbXVuZ2UtMC40Ljcuc2hh
MjU2c3VtXSA9ICI1ZTE3NDAxZjI1OWViYTk1NmNhMTY0OTE0NjFiNmU4ZjcyOTEzYTBhMTE0ZTM5
NzM2Y2U0MDQ0MTBmOTE1YTBjIgpAQCAtNDM5LDcgKzQyMyw2IEBAIFNSQ19VUklbcGtnLWNvbmZp
Zy0wLjMuMzIuc2hhMjU2c3VtXSA9ICI3ZWRkZGJkMGI1MmQ3MzJiMjFhZDlhNWZhYjVjNzA0YzE0
Y2Q5NDllCiBTUkNfVVJJW3BvcnRhYmxlLWF0b21pYy0xLjEzLjEuc2hhMjU2c3VtXSA9ICJjMzNh
OTQ3MTg5NmYxYzY5Y2VjZWY4ZDIwY2JlMmY3YWNjZDEyNTI3Y2U2MDg0NWZmNDRjMTUzYmIyYTIx
YjQ5IgogU1JDX1VSSVtwb3J0YWJsZS1hdG9taWMtdXRpbC0wLjIuNi5zaGEyNTZzdW1dID0gIjA5
MTM5N2JlNjFhMDFkNGJlNThlNzg0MTU5NWJkNGJmZWRiMTVmMWNkNTQ5NzdkNzliODI3MWU5NGVk
Nzk5YTMiCiBTUkNfVVJJW3BvdGVudGlhbF91dGYtMC4xLjQuc2hhMjU2c3VtXSA9ICJiNzM5NDk0
MzJmNWUyYTA5NjU3MDAzYzI1YmNhNWUxOWEwZTljODRmODA1OGNhMzc0ZjQ5ZTBlYmU2MDVhZjc3
IgotU1JDX1VSSVtwcmV0dHlwbGVhc2UtMC4yLjM3LnNoYTI1NnN1bV0gPSAiNDc5Y2E4YWRhY2Rk
N2NlOGYxZmIzOWNlOWVjY2NiZmU5M2EzZjEzNDRiM2QwZDk3ZjIwYmMwMTk2MjA4ZjYyYiIKIFNS
Q19VUklbcHJvYy1tYWNybzItMS4wLjEwNi5zaGEyNTZzdW1dID0gIjhmZDAwZjBiYjJlOTBkODFk
MTA0NGMyYjMyNjE3ZjY4ZmNiOWZhM2JiNzY0MGMyM2U5Yzc0OGU1M2ZiMzA5MzQiCiBTUkNfVVJJ
W3B0cl9tZXRhLTAuMy4xLnNoYTI1NnN1bV0gPSAiMGI5YTBjZjk1YTExOTZhZjYxZDRmMWNiZGFi
OTY3MTc5NTE2ZDlhNGE0MzEyYWYxZjMxOTQ4ZjhmNjIyNGE3OSIKIFNSQ19VUklbcHRyX21ldGFf
ZGVyaXZlLTAuMy4xLnNoYTI1NnN1bV0gPSAiNzM0Nzg2N2QwYTdlMTIwOGQ5M2I0Njc2N2JlODNl
MmI4Zjk3OGMzZGFkMzVmNzc1YWM4ZDg4NDc1NTFkNmZlMSIKQEAgLTQ1MSw5ICs0MzQsOSBAQCBT
UkNfVVJJW3JlZG94X3N5c2NhbGwtMC41LjE1LnNoYTI1NnN1bV0gPSAiN2U4YWYwZGRlMDk0MDA2
MDExZTZhNzQwZDQ4NzkzMTk0Mzk0OAogU1JDX1VSSVtyZWYtY2FzdC0xLjAuMjUuc2hhMjU2c3Vt
XSA9ICJmMzU0MzAwYWU2NmY3NmYxYzg1YzVmODQ2OTNmMGNlODFkNzQ3ZTJjM2YyMWE0NWZlZjQ5
NmQ4OWM5NjBiZjdkIgogU1JDX1VSSVtyZWYtY2FzdC1pbXBsLTEuMC4yNS5zaGEyNTZzdW1dID0g
ImI3MTg2MDA2ZGNiMjE5MjA5OTAwOTNmMzBlM2RlYTYzYjdkNmU5NzdiZjEyNTZiZTIwYzM1NjNh
NWRiMDcwZGEiCiBTUkNfVVJJW3JlZmxpbmstY29weS0wLjEuMjkuc2hhMjU2c3VtXSA9ICIxMzM2
MjIzM2IxNDdlNTc2NzRjMzdiODAyZDIxNmI3YzVlM2RjY2NiZWQ4OTY3Yzg0ZjBkOGQyMjM4Njhh
ZTI3IgotU1JDX1VSSVtyZWdleC0xLjEyLjMuc2hhMjU2c3VtXSA9ICJlMTA3NTRhMTRiOTEzN2Rk
N2IxZTNlNWIwNDkzY2M5MTcxZmRkMTA1ZTBhYjQ3N2Y1MWI3MmU3ZjNhYzBlMjc2IgorU1JDX1VS
SVtyZWdleC0xLjEyLjQuc2hhMjU2c3VtXSA9ICJmMTI5MmI3NzU5YWUxY2I5ZWMxOTU0NTJkMTM5
MGEwNzRmMGNkODU0MWFiN2E1YThjMzFjZDZkYjQ1ZDRhNmJhIgogU1JDX1VSSVtyZWdleC1hdXRv
bWF0YS0wLjQuMTQuc2hhMjU2c3VtXSA9ICI2ZTFkZDQxMjJmYzE1OTVlODE2MjYxODk0NTQ3Njg5
MmVlZmNhN2I4OGM1MjgyMGU3NGFmNjI2MjIxM2NhZThmIgotU1JDX1VSSVtyZWdleC1zeW50YXgt
MC44LjEwLnNoYTI1NnN1bV0gPSAiZGM4OTdkZDhkOWU4YmQxZWQ4Y2RhZDgyYjU5NjZjM2UwZWNh
ZTA5ZmIxOTA3ZDU4ZWZhYTAxMzU0MzE4NWQwYSIKK1NSQ19VUklbcmVnZXgtc3ludGF4LTAuOC4x
MS5zaGEyNTZzdW1dID0gImQ2ZjZmZjlhMzc4NDg1YjI5OGE1Mjg2NjU2ZGE2NjViYTc0NDEzZDM2
ZGIwOTc5NjMzMjc1ZDJlNzA4MTQ1ZDQiCiBTUkNfVVJJW3JlbmQtMC41LjMuc2hhMjU2c3VtXSA9
ICJjYWRhZGVmMzE3YzJmMjA3NTVhNjRkN2ZkYzQ4ZjllNzE3OGVlNmIwZTFmN2ZjZTMzZmE2MGYx
ZDY4YTI3NmU2IgogU1JDX1VSSVtya3l2LTAuOC4xNi5zaGEyNTZzdW1dID0gIjczMzg5ZTBjOTll
NjY0ZjkxOTI3NWFiNWI1YjA0NzEzOTFmZTlhOGRlNjFlMWRmZjliMWVhZjU2YTkwZjE2ZTMiCiBT
UkNfVVJJW3JreXZfZGVyaXZlLTAuOC4xNi5zaGEyNTZzdW1dID0gIjVkMmVkMGI1NDEyNTMxNWZi
MzZiZDAyMWU4MmQzMTRkMWMxMjY1NDhmODcxNjM0YjQ4M2Y0NmIzMWQxM2NhYzYiCkBAIC00Njcs
NyArNDUwLDYgQEAgU1JDX1VSSVtzY2hlbWFyc19kZXJpdmUtMS4yLjEuc2hhMjU2c3VtXSA9ICI3
ZDExNWI1MGY0YWFlZWEwN2U3OWMxOTEyZjY0NWM3NTEzZDgKIFNSQ19VUklbc2NvcGVndWFyZC0x
LjIuMC5zaGEyNTZzdW1dID0gIjk0MTQzZjM3NzI1MTA5ZjkyYzI2MmVkMmNmNWU1OWJjZTc0OThj
MDFiY2MxNTAyZDdiOWFmZTQzOWE0ZTlmNDkiCiBTUkNfVVJJW3NlYWhhc2gtNC4xLjAuc2hhMjU2
c3VtXSA9ICIxYzEwN2I2ZjQ3ODA4NTRjOGIxMjZlMjI4ZWE4ODY5ZjRkN2I3MTI2MGY5NjJmZWZi
NTdiOTk2Yjg5NTliYTZiIgogU1JDX1VSSVtzZWxmLXJlcGxhY2UtMS41LjAuc2hhMjU2c3VtXSA9
ICIwM2VjODE1YjVlYWI0MjBhYjg5M2Y2MzM5Mzg3OGQ4OWM5MGZkZDk0YzBiY2M0NGMwN2FiYjhh
ZDk1NTUyZmI3IgotU1JDX1VSSVtzZW12ZXItMS4wLjI3LnNoYTI1NnN1bV0gPSAiZDc2N2ViMGFh
YmM4ODBiMjk5NTZjMzU3MzQxNzBmMjZlZDU1MWE4NTlkYmQzNjFkMTQwY2RiZWNhNjFhYjFlMiIK
IFNSQ19VUklbc2VyZGUtMS4wLjIyOC5zaGEyNTZzdW1dID0gIjlhOGU5NGVhN2YzNzhiZDMyY2Ji
ZDM3MTk4YTRhOTE0MzYxODBjNWJiNDcyNDExZTQ4YjVlYzJlMjEyNGFlOWUiCiBTUkNfVVJJW3Nl
cmRlLXVudGFnZ2VkLTAuMS45LnNoYTI1NnN1bV0gPSAiZjlmYWY0OGE0YTJkMjY5M2JlMjRjNjI4
OWRiZTI2NTUyNzc2ZWI3NzM3MDc0ZTY3MjI4OTFmYWRiZTZjNTA1OCIKIFNSQ19VUklbc2VyZGVf
Y29yZS0xLjAuMjI4LnNoYTI1NnN1bV0gPSAiNDFkMzg1YzdkNGNhNThlNTlmYzczMmFmMjVjMzk4
M2I2N2FjODUyYzFhMjUwMDBhZmUxMTc1ZGU0NThiNjdhZCIKQEAgLTQ4MywxMCArNDY1LDExIEBA
IFNSQ19VUklbc2ltZC1hZGxlcjMyLTAuMy44LnNoYTI1NnN1bV0gPSAiZTMyMGE2YzVhZDMxZDI3
MWFkNTIzZGNmM2FkMTNlMjc2N2FkOGIxCiBTUkNfVVJJW3NpbWR1dGY4LTAuMS41LnNoYTI1NnN1
bV0gPSAiZTNhOWZlMzRlM2U3YTUwMzE2MDYwMzUxZjM3MTg3YTNmNTQ2YmNlOTU0OTYxNTY3NTRi
NjAxYTVmYTcxYjc2ZSIKIFNSQ19VUklbc2ltaWxhci0yLjcuMC5zaGEyNTZzdW1dID0gImJiYmI1
ZDk2NTkxNDE2NDZhZTY0N2I0MmZlMDk0ZGFmNmM2MTkyZDE2MjA4NzBiNDQ5ZDk1NTdmNzQ4YjJk
YWEiCiBTUkNfVVJJW3NsYWItMC40LjEyLnNoYTI1NnN1bV0gPSAiMGM3OTBkZTIzMTI0ZjlhYjQ0
NTQ0ZDdhYzA1ZDYwNDQwYWRjNTg2NDc5Y2U1MDFjMWQ2ZDdkYTNjZDhjOWNmNSIKLVNSQ19VUklb
c21hbGx2ZWMtMS4xNS4xLnNoYTI1NnN1bV0gPSAiNjdiMWI3YTNiNWZlNGYxMzc2ODg3MTg0MDQ1
ZmNmNDVjNjllOTJhZjczNGI3YWFkZGMwNWZiNzc3YjZmYmQwMyIKK1NSQ19VUklbc21hbGx2ZWMt
MS4xNS4yLnNoYTI1NnN1bV0gPSAiOGVkNmE2M2YwMmM4NTM5YzkxYTg2ODVhODZmNDA5OTY2MWJh
M2RhMDE3OTMyZjZlYmJlYTZkZTNmMGZhN2M5MCIKIFNSQ19VUklbc21hd2stMC4zLjIuc2hhMjU2
c3VtXSA9ICJiN2MzODhjMWI1ZTkzNzU2ZDBjNzQwOTY1YzQxZTg4MjJmODY2NjIxZDQxYWNiZGY2
MzM2YTZhMTY4Zjg4NDBjIgogU1JDX1VSSVtzcGR4LTAuMTMuNC5zaGEyNTZzdW1dID0gImE4ZGE1
OTNlMzBiZWI3OTBmYzk0MjQ1MDJlYjg5ODMyMGI0NGU1ZWIzMDM2N2RiZGExYzFlZGRlOGUyZjMy
ZDciCiBTUkNfVVJJW3N0YWJsZV9kZXJlZl90cmFpdC0xLjIuMS5zaGEyNTZzdW1dID0gIjZjZTJi
ZThkYzI1NDU1ZTFmOTFkZjcxYmZhMTJhZDM3ZDdhZjEwOTJhZTczNmYzYTZjZDBlMzdiYzc4MTA1
OTYiCitTUkNfVVJJW3N0cmlwLWFuc2ktZXNjYXBlcy0wLjIuMS5zaGEyNTZzdW1dID0gIjJhOGY4
MDM4ZTdlNzk2OWFiYjNmMWI3YzJhODExMjI1ZTkyOTZkYTIwODUzOWUwZjc5YzUyNTFkNmNhYzAw
MjUiCiBTUkNfVVJJW3N0cnNpbS0wLjExLjEuc2hhMjU2c3VtXSA9ICI3ZGE4YjU3MzY4NDVkOWYy
ZmNiODM3ZWE1ZDllMjYyODU2NGIzYjA0M2E3MDk0OGEzZjBiNzc4ODM4YzVmYjRmIgogU1JDX1VS
SVtzeW4tMi4wLjExNy5zaGEyNTZzdW1dID0gImU2NjViODgwM2U3YjFkMmE3MjdmNDAyMzQ1NmJi
YmJlNzRkYTY3MDk5YzU4NTI1OGFmMGFkOWM1MDEzYjliOTkiCiBTUkNfVVJJW3N5bnN0cnVjdHVy
ZS0wLjEzLjIuc2hhMjU2c3VtXSA9ICI3MjhhNzBmM2RiYWY1YmFiN2YwYzRiMWFjOGQ3YWU1ZWE2
MGE0YjU1NDljOGE1OTE0MzYxYzk5MTQ3YTcwOWQyIgpAQCAtNTIyLDI2ICs1MDUsMjIgQEAgU1JD
X1VSSVt1Y2QtdHJpZS0wLjEuNy5zaGEyNTZzdW1dID0gIjI4OTZkOTVjMDJhODBjNmQ2YTVkNmU5
NTNkNDc5ZjVkZGYyZGZkYjZhMjQKIFNSQ19VUklbdW5pY29kZS1pZGVudC0xLjAuMjQuc2hhMjU2
c3VtXSA9ICJlNmU0MzEzY2Q1ZmNkM2RhZDVjYWZhMTc5NzAyZTJiMjQ0Zjc2MDk5MWY0NTM5N2Qx
NGQ0ZWJmMzgyNDdkYTc1IgogU1JDX1VSSVt1bmljb2RlLWxpbmVicmVhay0wLjEuNS5zaGEyNTZz
dW1dID0gIjNiMDljODNjM2MyOWQzNzUwNmEzZTI2MGMwOGMwMzc0M2E2YmI2NmE5Y2Q0MzJjNjkz
NGFiNTAxYTE5MDU3MWYiCiBTUkNfVVJJW3VuaWNvZGUtd2lkdGgtMC4yLjIuc2hhMjU2c3VtXSA9
ICJiNGFjMDQ4ZDcxZWRlN2VlNzZkNTg1NTE3YWRkNDVkYTUzMDY2MGVmNDM5MGU0OWIwOTg3MzNj
NmU4OTdmMjU0IgotU1JDX1VSSVt1bmljb2RlLXhpZC0wLjIuNi5zaGEyNTZzdW1dID0gImViYzFj
MDRjNzE1MTBjN2Y3MDJiNTJiN2MzNTA3MzRjOWZmMTI5NWM0NjRhMDMzMzViMDBiYjg0ZmM1NGY4
NTMiCiBTUkNfVVJJW3Vuc2Nhbm55LTAuMS4wLnNoYTI1NnN1bV0gPSAiZTlkZjJhZjA2N2E3OTUz
ZTljMzgzMTMyMGYzNWMxY2MwNjAwYzMwZDQ0ZDlmN2ExMmIwMWRiMWNkODhkNmI0NyIKIFNSQ19V
UklbdXJsLTIuNS44LnNoYTI1NnN1bV0gPSAiZmY2N2E4YTQzOTczNzNjM2VmNjYwODEyYWNhYjMy
NjgyMjIwMzUwMTBhYjg2ODBlYzQyMTVmMzhiYTNkMGVlZCIKIFNSQ19VUklbdXRmOF9pdGVyLTEu
MC40LnNoYTI1NnN1bV0gPSAiYjZjMTQwNjIwZTdmZmJiMjJjMmRlZTU5Y2FmZTYwODRhNTliNWZm
YzI3YTg4NTlhNWYwZDQ5NGI1ZDUyYjZiZSIKIFNSQ19VUklbdXRmOHBhcnNlLTAuMi4yLnNoYTI1
NnN1bV0gPSAiMDZhYmRlMzYxMTY1N2FkZjY2ZDM4M2YwMGIwOTNkN2ZhZWNjN2ZhNTcwNzFjY2Uy
NTc4NjYwYzlmMTAxMDgyMSIKLVNSQ19VUklbdXVpZC0xLjIzLjIuc2hhMjU2c3VtXSA9ICJkMjU4
YjgzY2VlYzIxMDM0NzI3ZWNlZThjMzgyY2ZhNmMzZTEzMzY5OWIwNzQyYzY0NTcxODE0ZmI0MjBj
OWY3IgorU1JDX1VSSVt1dWlkLTEuMjMuMy5zaGEyNTZzdW1dID0gIjE0NGQ2YjEyM2NlZjgwYjMw
MWI4ZjcyYTllMmNhNDM3MGRkZWMyMTk1MGQwYTEwM2RkMjJjNDM3MDA2ZDJkYjciCiBTUkNfVVJJ
W3ZhbHVhYmxlLTAuMS4xLnNoYTI1NnN1bV0gPSAiYmE3M2VhOWNmMTZhMjVkZjBjOGNhYTE2YzUx
YWNiOTM3ZDU3MTJhODQyOWRiNzhhM2VlMjlkNWRjYWNkM2E2NSIKIFNSQ19VUklbdmVyc2lvbl9j
aGVjay0wLjkuNS5zaGEyNTZzdW1dID0gIjBiOTI4ZjMzZDk3NWZjNmFkOWY4NmM4ZjI4Mzg1M2Fk
MjZiZGQ1YjEwYjdmMTU0MmFhMmZhMTVlMjI4OTEwNWEiCitTUkNfVVJJW3Z0ZS0wLjE0LjEuc2hh
MjU2c3VtXSA9ICIyMzFmZGNkN2VmMzAzN2U4MzMwZDhlMTdlNjEwMTFhMmMyNDQxMjZhY2MwYTk4
MmY0MDQwYWMzZjlmMGJjMDc3IgogU1JDX1VSSVt3YWxrZGlyLTIuNS4wLnNoYTI1NnN1bV0gPSAi
Mjk3OTA5NDY0MDRmOTFkOWM1ZDA2Zjk4NzRlZmRkZWExZGMwNmM1ZWZlOTQ1NDFhN2Q2ODYzMTA4
ZTNhNWU0YiIKIFNSQ19VUklbd2FzaS0wLjExLjErd2FzaS1zbmFwc2hvdC1wcmV2aWV3MS5zaGEy
NTZzdW1dID0gImNjZjNlYzY1MWE4NDdlYjAxZGU3M2NjYWQxNWViN2Q5OWY4MDQ4NWRlMDQzZWZi
MmYzNzBjZDY1NGY0ZWE0NGIiCiBTUkNfVVJJW3dhc2ktMC4xNC43K3dhc2ktMC4yLjQuc2hhMjU2
c3VtXSA9ICI4ODM0NzhkZTIwMzY3ZTIyNGMwMDkwYWY5Y2Y1ZjlmYTg1YmVkNjNhOTVjMWFiZjNh
ZmM1YzA4M2ViYzA2ZThjIgogU1JDX1VSSVt3YXNpcDItMS4wLjIrd2FzaS0wLjIuOS5zaGEyNTZz
dW1dID0gIjk1MTdmOTIzOWYwMmMwNjlkYjc1ZTY1ZjE3NGIzZGE4MjhmZTVmNWI5NDVjNGRkMjZi
ZDI1ZDg5YzAzZWJjZjUiCi1TUkNfVVJJW3dhc2lwMy0wLjQuMCt3YXNpLTAuMy4wLXJjLTIwMjYt
MDEtMDYuc2hhMjU2c3VtXSA9ICI1NDI4ZjhiZjg4ZWE1ZGRjMDhmYWRkZWYyYWM0YTY3ZTM5MGI4
ODE4NmM3MDNjZTZkYmQ5NTVlMWMxNDVhY2E1IgogU1JDX1VSSVt3YXNtLWJpbmRnZW4tMC4yLjEx
NC5zaGEyNTZzdW1dID0gIjY1MzJmOWE1YzFlY2UzNzk4Y2IxYzJjZmRiYTY0MGI5YjNiYTg4NGY1
ZGI0NTk3M2E2ZjQ0MjUxMGE4N2QzOGUiCiBTUkNfVVJJW3dhc20tYmluZGdlbi1tYWNyby0wLjIu
MTE0LnNoYTI1NnN1bV0gPSAiMThhMmQ1MGZjZjEwNWZiMzNiYjE1ZjAwZTdhNzdiNzcyOTQ1YTJl
ZTQ1ZGNmNDU0OTYxZmQ4NDNlNzRjMThlNiIKIFNSQ19VUklbd2FzbS1iaW5kZ2VuLW1hY3JvLXN1
cHBvcnQtMC4yLjExNC5zaGEyNTZzdW1dID0gIjAzY2U0Y2FlYWFjNTQ3Y2RmNzEzZDI4MGVkYTIy
YTczMDgyNGRkMTFlNmI4YzNjYTllNDIyNDdiMjVjNjMxZTMiCiBTUkNfVVJJW3dhc20tYmluZGdl
bi1zaGFyZWQtMC4yLjExNC5zaGEyNTZzdW1dID0gIjc1YTMyNmI4YzIyM2VlMTc4ODNhNDI1MTkw
NzQ1NWEyNDMxYWNjMjc5MWM5OGMyNjI3OTM3NjQ5MGMzNzhjMTYiCi1TUkNfVVJJW3dhc20tZW5j
b2Rlci0wLjI0NC4wLnNoYTI1NnN1bV0gPSAiOTkwMDY1ZjJmZTYzMDAzZmUzMzdiOTMyY2ZiNWUz
YjgwZTBiNGQwZjVmZjY1MGU2OTg1YjEwNDhmNjJjODMxOSIKLVNSQ19VUklbd2FzbS1tZXRhZGF0
YS0wLjI0NC4wLnNoYTI1NnN1bV0gPSAiYmIwZTM1M2U2YTJmYmRjMTc2OTMyYmJhYWI0OTM3NjJl
YjEyNTVhNzkwMGZlMGZlYTFhMmY5NmMyOTZjYzkwOSIKLVNSQ19VUklbd2FzbXBhcnNlci0wLjI0
NC4wLnNoYTI1NnN1bV0gPSAiNDdiODA3YzcyZTFiYWM2OTM4MmIzYTZmYjNkYmU4ZWE0YzBlZDg3
ZmY1NjI5Yjg2ODVhZTZiOWE2MTEwMjhmZSIKIFNSQ19VUklbd2luYXBpLXV0aWwtMC4xLjExLnNo
YTI1NnN1bV0gPSAiYzJhN2IxYzAzYzg3NjEyMmFhNDNmMzAyMGU2YzNjM2VlNWMwNTA4MWM5YTAw
NzM5ZmFmNzUwM2FlYmExMGQyMiIKIFNSQ19VUklbd2luZG93cy0wLjYxLjMuc2hhMjU2c3VtXSA9
ICI5YmFiZDNhNzY3YTRjMWFlZjY5MDA0MDlmODVmNWQ1M2NlMjU0NGNjZGZhYTg2ZGFkNDhjOTE3
ODJjNmQ2ODkzIgogU1JDX1VSSVt3aW5kb3dzLWNvbGxlY3Rpb25zLTAuMi4wLnNoYTI1NnN1bV0g
PSAiM2JlZWNlYjVlNWNmZDllYjFkNzZiMzgxNjMwZTgyYzQyNDFjY2QwZDI3ZjFhMzllZDQxYjI3
NjBiMjU1YzVlOCIKQEAgLTU2OCwxMSArNTQ3LDYgQEAgU1JDX1VSSVt3aW5kb3dzX3g4Nl82NF9n
bnVsbHZtLTAuNTIuNi5zaGEyNTZzdW1dID0gIjI0ZDViMjNkYzQxNzQxMjY3OTY4MTM5NmYyYjQK
IFNSQ19VUklbd2luZG93c194ODZfNjRfbXN2Yy0wLjUyLjYuc2hhMjU2c3VtXSA9ICI1ODlmNmRh
ODRjNjQ2MjA0NzQ3ZDEyNzBhMmE1NjYxZWE2NmVkMWNjZWQyNjMxZDU0NmZkZmIxNTU5NTlmOWVj
IgogU1JDX1VSSVt3aW5ub3ctMS4wLjMuc2hhMjU2c3VtXSA9ICIwNTkyZTFjOWQxNTFmODU0ZTZm
ZDM4MjU3NGMzYTA4NTUyNTBlMWQ5YjJmOTlkOTI4MWM2ZTYzOTFhZjM1MmYxIgogU1JDX1VSSVt3
aXQtYmluZGdlbi0wLjUxLjAuc2hhMjU2c3VtXSA9ICJkNzI0OTIxOWY2NmNlZDAyOTY5Mzg4Y2Yy
YmIwNDRhMDk3NTZhMDgzZDBmYWIxZTU2NjA1NmIwNGQ5ZmJjYWE1IgotU1JDX1VSSVt3aXQtYmlu
ZGdlbi1jb3JlLTAuNTEuMC5zaGEyNTZzdW1dID0gImVhNjFkZTY4NGMzZWE2OGNiMDgyYjdhODg1
MDhhOGIyN2ZjYzhiNzk3ZDczOGJmYzk5YTgyZmFjZjFkNzUyZGMiCi1TUkNfVVJJW3dpdC1iaW5k
Z2VuLXJ1c3QtMC41MS4wLnNoYTI1NnN1bV0gPSAiYjdjNTY2ZTBmNGIyODRkZDY1NjFjNzg2ZDlj
YjAxNDJkYTQ5MWY0NmE5ZmJlZDc5ZWE2OWNkYWQ1ZGIxN2YyMSIKLVNSQ19VUklbd2l0LWJpbmRn
ZW4tcnVzdC1tYWNyby0wLjUxLjAuc2hhMjU2c3VtXSA9ICIwYzBmOWJmZDc3ZTZhNDhlY2NmNTEz
NTllM2FlNzcxNDBhN2Y1MGIxZTJlYmZlNjI0MjJkOGFmZGFmZmFiMTdhIgotU1JDX1VSSVt3aXQt
Y29tcG9uZW50LTAuMjQ0LjAuc2hhMjU2c3VtXSA9ICI5ZDY2ZWEyMGU5NTUzYjMwMTcyYjVlODMx
OTk0ZTM1ZmJkZTJkMTY1MzI1YmVjODRmYzQzZGJmNmY0ZWI5Y2IyIgotU1JDX1VSSVt3aXQtcGFy
c2VyLTAuMjQ0LjAuc2hhMjU2c3VtXSA9ICJlY2M4YWM0YmMxZGMzMzgxYjdmNTljMzRmMDBiNjdl
MThmOTEwYzJjMGY1MDAxNTY2OWRkZTdkZWY2NTZhNzM2IgogU1JDX1VSSVt3cml0ZWFibGUtMC42
LjIuc2hhMjU2c3VtXSA9ICI5ZWRkZTBkYjQ3NjlkMmRjNjg1Nzk4OTNmMjMwNmIyNmM2ZWNmYmUw
ZWY0OTliMDEzZDczMWI3YjkyNDdlMGI5IgogU1JDX1VSSVt4YXR0ci0xLjYuMS5zaGEyNTZzdW1d
ID0gIjMyZTQ1YWQ0MjA2ZjZkMjQ3OTA4NTE0N2YwMmJjMmVmODM0YWM4NTg4NjYyNGEyMzU3NWFl
MTM3YzhhYTgxNTYiCiBTUkNfVVJJW3h6Mi0wLjEuNy5zaGEyNTZzdW1dID0gIjM4OGM0NGRjMDlk
NzZmMTUzNjYwMmVhZDZkMzI1ZWI1MzJmNWMxMjJmMTc3ODJiZDU3ZmI0N2JhZWViNzY3ZTIiCmRp
ZmYgLS1naXQgYS9tZXRhL3JlY2lwZXMtZGV2dG9vbHMvcHl0aG9uL3B5dGhvbjMtdXYtYnVpbGRf
MC4xMS4yMS5iYiBiL21ldGEvcmVjaXBlcy1kZXZ0b29scy9weXRob24vcHl0aG9uMy11di1idWls
ZF8wLjExLjI0LmJiCnNpbWlsYXJpdHkgaW5kZXggOTIlCnJlbmFtZSBmcm9tIG1ldGEvcmVjaXBl
cy1kZXZ0b29scy9weXRob24vcHl0aG9uMy11di1idWlsZF8wLjExLjIxLmJiCnJlbmFtZSB0byBt
ZXRhL3JlY2lwZXMtZGV2dG9vbHMvcHl0aG9uL3B5dGhvbjMtdXYtYnVpbGRfMC4xMS4yNC5iYgpp
bmRleCA0ZWUyZmRiYWE3Li43ZDlhZDAyOWU1IDEwMDY0NAotLS0gYS9tZXRhL3JlY2lwZXMtZGV2
dG9vbHMvcHl0aG9uL3B5dGhvbjMtdXYtYnVpbGRfMC4xMS4yMS5iYgorKysgYi9tZXRhL3JlY2lw
ZXMtZGV2dG9vbHMvcHl0aG9uL3B5dGhvbjMtdXYtYnVpbGRfMC4xMS4yNC5iYgpAQCAtMTEsNyAr
MTEsNyBAQCBMSUNfRklMRVNfQ0hLU1VNID0gImZpbGU6Ly9MSUNFTlNFLUFQQUNIRTttZDU9ODZk
M2YzYTk1YzMyNGM5NDc5YmQ4OTg2OTY4ZjQzMjcgXAogICAgICAgICAgICAgICAgICAgICBmaWxl
Oi8vY3JhdGVzL3V2LXBlcDUwOC9MaWNlbnNlLUFwYWNoZTttZDU9ZTIzZmFkZDZjZWVmOGM2MThm
YzFjNjUxOTFkODQ2ZmEgXAogICAgICAgICAgICAgICAgICAgICBmaWxlOi8vY3JhdGVzL3V2LXBl
cDUwOC9MaWNlbnNlLUJTRDttZDU9ZWY3YTYwMjdkYzRjMjM4OWI5YWZhZDdlNjkwMjc0YzciCiAK
LVNSQ19VUklbc2hhMjU2c3VtXSA9ICJkNTEyOTExZDM1N2Y3MWRkN2MxYmU0MzUwM2VlNjZlYmFi
YTlhOGQyMDc5OThiYmVhNzc1ODFlOTVhYWRhYmU2IgorU1JDX1VSSVtzaGEyNTZzdW1dID0gIjM1
MTVlOTViMjhmZjczNjQyZTg2NTliMTBjZjQ4MjA1MjBhNTNmOTg5NTFjNzMyMGZkYWQ1ZWU0ZjU1
MjVlZTUiCiAKIHJlcXVpcmUgJHtCUE59LWNyYXRlcy5pbmMKIAotLSAKMi40Ny4xCgo=

--===============5378969914786936916==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: attachment; filename="buildhistory-diff.txt"

packages/x86-64-v3-poky-linux/python3-uv-build/python3-uv-build: FILELIST: directory renamed /usr/lib/python3.14/site-packages/uv_build-0.11.21.dist-info/licenses -> /usr/lib/python3.14/site-packages/uv_build-0.11.24.dist-info/licenses, directory renamed /usr/lib/python3.14/site-packages/uv_build-0.11.21.dist-info -> /usr/lib/python3.14/site-packages/uv_build-0.11.24.dist-info
Changes to packages/x86-64-v3-poky-linux/python3-uv-build (sysroot):
  /usr/lib/python3.14/site-packages/uv_build-0.11.21.dist-info moved to /usr/lib/python3.14/site-packages/uv_build-0.11.24.dist-info

--===============5378969914786936916==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: attachment; filename="buildhistory-diff-full.txt"

packages/x86-64-v3-poky-linux/python3-uv-build: SRC_URI changed from "https://files.pythonhosted.org/packages/source/u/uv_build/uv_build-0.11.21.tar.gz;downloadfilename=uv_build-0.11.21.tar.gz crate://crates.io/adler2/2.0.1 crate://crates.io/aho-corasick/1.1.4 crate://crates.io/allocator-api2/0.2.21 crate://crates.io/anstream/1.0.0 crate://crates.io/anstyle/1.0.14 crate://crates.io/anstyle-parse/1.0.0 crate://crates.io/anstyle-query/1.1.5 crate://crates.io/anstyle-wincon/3.0.11 crate://crates.io/anyhow/1.0.102 crate://crates.io/arcstr/1.2.0 crate://crates.io/arrayvec/0.7.6 crate://crates.io/astral-tokio-tar/0.6.2 crate://crates.io/astral-version-ranges/0.1.4 crate://crates.io/astral_async_zip/0.0.18 crate://crates.io/async-compression/0.4.19 crate://crates.io/autocfg/1.5.0 crate://crates.io/backon/1.6.0 crate://crates.io/base64/0.22.1 crate://crates.io/bitflags/2.11.1 crate://crates.io/block-buffer/0.10.4 crate://crates.io/boxcar/0.2.14 crate://crates.io/bstr/1.12.1 crate://crates.io
 /bumpalo/3.20.2 crate://crates.io/bytecheck/0.8.2 crate://crates.io/bytecheck_derive/0.8.2 crate://crates.io/bytes/1.11.1 crate://crates.io/bzip2/0.5.2 crate://crates.io/bzip2-sys/0.1.13+1.0.8 crate://crates.io/cc/1.2.57 crate://crates.io/cfg-if/1.0.4 crate://crates.io/charset/0.1.5 crate://crates.io/clap/4.6.1 crate://crates.io/clap_builder/4.6.0 crate://crates.io/clap_derive/4.6.1 crate://crates.io/clap_lex/1.1.0 crate://crates.io/colorchoice/1.0.5 crate://crates.io/console/0.16.3 crate://crates.io/cpufeatures/0.2.17 crate://crates.io/crc32fast/1.5.0 crate://crates.io/crypto-common/0.1.7 crate://crates.io/csv/1.4.0 crate://crates.io/csv-core/0.1.13 crate://crates.io/data-encoding/2.11.0 crate://crates.io/digest/0.10.7 crate://crates.io/displaydoc/0.2.5 crate://crates.io/dunce/1.0.5 crate://crates.io/dyn-clone/1.0.20 crate://crates.io/either/1.16.0 crate://crates.io/encode_unicode/1.0.0 crate://crates.io/encoding_rs/0.8.35 crate://crates.io/encoding_rs_io/0.1.7 crate://crates.io/en
 umflags2/0.7.12 crate://crates.io/enumflags2_derive/0.7.12 crate://crates.io/equivalent/1.0.2 crate://crates.io/erased-serde/0.4.10 crate://crates.io/errno/0.3.14 crate://crates.io/fastrand/2.4.1 crate://crates.io/filetime/0.2.29 crate://crates.io/find-msvc-tools/0.1.9 crate://crates.io/fixedbitset/0.5.7 crate://crates.io/flate2/1.1.9 crate://crates.io/foldhash/0.1.5 crate://crates.io/foldhash/0.2.0 crate://crates.io/form_urlencoded/1.2.2 crate://crates.io/fs-err/3.3.0 crate://crates.io/futures/0.3.32 crate://crates.io/futures-channel/0.3.32 crate://crates.io/futures-core/0.3.32 crate://crates.io/futures-executor/0.3.32 crate://crates.io/futures-io/0.3.32 crate://crates.io/futures-lite/2.6.1 crate://crates.io/futures-macro/0.3.32 crate://crates.io/futures-sink/0.3.32 crate://crates.io/futures-task/0.3.32 crate://crates.io/futures-util/0.3.32 crate://crates.io/generic-array/0.14.7 crate://crates.io/getrandom/0.3.3 crate://crates.io/getrandom/0.4.1 crate://crates.io/globset/0.4.18 cra
 te://crates.io/gloo-timers/0.3.0 crate://crates.io/hashbrown/0.15.5 crate://crates.io/hashbrown/0.17.1 crate://crates.io/heck/0.5.0 crate://crates.io/hex/0.4.3 crate://crates.io/icu_collections/2.1.1 crate://crates.io/icu_locale_core/2.1.1 crate://crates.io/icu_normalizer/2.1.1 crate://crates.io/icu_normalizer_data/2.1.1 crate://crates.io/icu_properties/2.1.2 crate://crates.io/icu_properties_data/2.1.2 crate://crates.io/icu_provider/2.1.1 crate://crates.io/id-arena/2.3.0 crate://crates.io/idna/1.1.0 crate://crates.io/idna_adapter/1.2.1 crate://crates.io/indexmap/2.14.0 crate://crates.io/indoc/2.0.7 crate://crates.io/insta/1.47.2 crate://crates.io/is_terminal_polyfill/1.70.2 crate://crates.io/itertools/0.14.0 crate://crates.io/itoa/1.0.17 crate://crates.io/jiff/0.2.28 crate://crates.io/jiff-static/0.2.28 crate://crates.io/jiff-tzdb/0.1.6 crate://crates.io/jiff-tzdb-platform/0.1.3 crate://crates.io/jobserver/0.1.34 crate://crates.io/js-sys/0.3.91 crate://crates.io/junction/2.0.0 crate
 ://crates.io/lazy_static/1.5.0 crate://crates.io/leb128fmt/0.1.0 crate://crates.io/libc/0.2.186 crate://crates.io/linux-raw-sys/0.12.1 crate://crates.io/litemap/0.8.1 crate://crates.io/lock_api/0.4.14 crate://crates.io/log/0.4.29 crate://crates.io/lzma-sys/0.1.20 crate://crates.io/mailparse/0.16.1 crate://crates.io/matchers/0.2.0 crate://crates.io/memchr/2.8.1 crate://crates.io/miniz_oxide/0.8.9 crate://crates.io/mio/1.2.0 crate://crates.io/munge/0.4.7 crate://crates.io/munge_macro/0.4.7 crate://crates.io/nu-ansi-term/0.50.3 crate://crates.io/once_cell/1.21.4 crate://crates.io/once_cell_polyfill/1.70.2 crate://crates.io/owo-colors/4.3.0 crate://crates.io/parking/2.2.1 crate://crates.io/parking_lot/0.12.5 crate://crates.io/parking_lot_core/0.9.12 crate://crates.io/path-slash/0.2.1 crate://crates.io/percent-encoding/2.3.2 crate://crates.io/pest/2.8.6 crate://crates.io/pest_derive/2.8.6 crate://crates.io/pest_generator/2.8.6 crate://crates.io/pest_meta/2.8.6 crate://crates.io/petgraph/
 0.8.3 crate://crates.io/pin-project/1.1.11 crate://crates.io/pin-project-internal/1.1.11 crate://crates.io/pin-project-lite/0.2.17 crate://crates.io/pkg-config/0.3.32 crate://crates.io/portable-atomic/1.13.1 crate://crates.io/portable-atomic-util/0.2.6 crate://crates.io/potential_utf/0.1.4 crate://crates.io/prettyplease/0.2.37 crate://crates.io/proc-macro2/1.0.106 crate://crates.io/ptr_meta/0.3.1 crate://crates.io/ptr_meta_derive/0.3.1 crate://crates.io/quote/1.0.45 crate://crates.io/quoted_printable/0.5.1 crate://crates.io/r-efi/5.3.0 crate://crates.io/rancor/0.1.1 crate://crates.io/redox_syscall/0.5.15 crate://crates.io/ref-cast/1.0.25 crate://crates.io/ref-cast-impl/1.0.25 crate://crates.io/reflink-copy/0.1.29 crate://crates.io/regex/1.12.3 crate://crates.io/regex-automata/0.4.14 crate://crates.io/regex-syntax/0.8.10 crate://crates.io/rend/0.5.3 crate://crates.io/rkyv/0.8.16 crate://crates.io/rkyv_derive/0.8.16 crate://crates.io/rustc-hash/2.1.2 crate://crates.io/rustix/1.1.4 cra
 te://crates.io/rustversion/1.0.22 crate://crates.io/ryu/1.0.23 crate://crates.io/same-file/1.0.6 crate://crates.io/schemars/1.2.1 crate://crates.io/schemars_derive/1.2.1 crate://crates.io/scopeguard/1.2.0 crate://crates.io/seahash/4.1.0 crate://crates.io/self-replace/1.5.0 crate://crates.io/semver/1.0.27 crate://crates.io/serde/1.0.228 crate://crates.io/serde-untagged/0.1.9 crate://crates.io/serde_core/1.0.228 crate://crates.io/serde_derive/1.0.228 crate://crates.io/serde_derive_internals/0.29.1 crate://crates.io/serde_json/1.0.150 crate://crates.io/serde_spanned/1.1.1 crate://crates.io/sha2/0.10.9 crate://crates.io/sharded-slab/0.1.7 crate://crates.io/shlex/1.3.0 crate://crates.io/signal-hook-registry/1.4.8 crate://crates.io/simd-adler32/0.3.8 crate://crates.io/simdutf8/0.1.5 crate://crates.io/similar/2.7.0 crate://crates.io/slab/0.4.12 crate://crates.io/smallvec/1.15.1 crate://crates.io/smawk/0.3.2 crate://crates.io/spdx/0.13.4 crate://crates.io/stable_deref_trait/1.2.1 crate://cr
 ates.io/strsim/0.11.1 crate://crates.io/syn/2.0.117 crate://crates.io/synstructure/0.13.2 crate://crates.io/temp-env/0.3.6 crate://crates.io/tempfile/3.27.0 crate://crates.io/terminal_size/0.4.4 crate://crates.io/textwrap/0.16.2 crate://crates.io/thiserror/2.0.18 crate://crates.io/thiserror-impl/2.0.18 crate://crates.io/thread_local/1.1.9 crate://crates.io/tinystr/0.8.2 crate://crates.io/tinyvec/1.11.0 crate://crates.io/tinyvec_macros/0.1.1 crate://crates.io/tokio/1.52.3 crate://crates.io/tokio-macros/2.7.0 crate://crates.io/tokio-stream/0.1.18 crate://crates.io/tokio-util/0.7.18 crate://crates.io/toml/1.1.2+spec-1.1.0 crate://crates.io/toml_datetime/1.1.1+spec-1.1.0 crate://crates.io/toml_edit/0.25.12+spec-1.1.0 crate://crates.io/toml_parser/1.1.2+spec-1.1.0 crate://crates.io/toml_writer/1.1.1+spec-1.1.0 crate://crates.io/tracing/0.1.44 crate://crates.io/tracing-attributes/0.1.31 crate://crates.io/tracing-core/0.1.36 crate://crates.io/tracing-log/0.2.0 crate://crates.io/tracing-sub
 scriber/0.3.23 crate://crates.io/tracing-test/0.2.6 crate://crates.io/tracing-test-macro/0.2.6 crate://crates.io/typeid/1.0.3 crate://crates.io/typenum/1.19.0 crate://crates.io/ucd-trie/0.1.7 crate://crates.io/unicode-ident/1.0.24 crate://crates.io/unicode-linebreak/0.1.5 crate://crates.io/unicode-width/0.2.2 crate://crates.io/unicode-xid/0.2.6 crate://crates.io/unscanny/0.1.0 crate://crates.io/url/2.5.8 crate://crates.io/utf8_iter/1.0.4 crate://crates.io/utf8parse/0.2.2 crate://crates.io/uuid/1.23.2 crate://crates.io/valuable/0.1.1 crate://crates.io/version_check/0.9.5 crate://crates.io/walkdir/2.5.0 crate://crates.io/wasi/0.11.1+wasi-snapshot-preview1 crate://crates.io/wasi/0.14.7+wasi-0.2.4 crate://crates.io/wasip2/1.0.2+wasi-0.2.9 crate://crates.io/wasip3/0.4.0+wasi-0.3.0-rc-2026-01-06 crate://crates.io/wasm-bindgen/0.2.114 crate://crates.io/wasm-bindgen-macro/0.2.114 crate://crates.io/wasm-bindgen-macro-support/0.2.114 crate://crates.io/wasm-bindgen-shared/0.2.114 crate://crate
 s.io/wasm-encoder/0.244.0 crate://crates.io/wasm-metadata/0.244.0 crate://crates.io/wasmparser/0.244.0 crate://crates.io/winapi-util/0.1.11 crate://crates.io/windows/0.61.3 crate://crates.io/windows-collections/0.2.0 crate://crates.io/windows-core/0.61.2 crate://crates.io/windows-future/0.2.1 crate://crates.io/windows-implement/0.60.2 crate://crates.io/windows-interface/0.59.3 crate://crates.io/windows-link/0.1.3 crate://crates.io/windows-link/0.2.1 crate://crates.io/windows-numerics/0.2.0 crate://crates.io/windows-result/0.3.4 crate://crates.io/windows-strings/0.4.2 crate://crates.io/windows-sys/0.52.0 crate://crates.io/windows-sys/0.61.2 crate://crates.io/windows-targets/0.52.6 crate://crates.io/windows-threading/0.1.0 crate://crates.io/windows_aarch64_gnullvm/0.52.6 crate://crates.io/windows_aarch64_msvc/0.52.6 crate://crates.io/windows_i686_gnu/0.52.6 crate://crates.io/windows_i686_gnullvm/0.52.6 crate://crates.io/windows_i686_msvc/0.52.6 crate://crates.io/windows_x86_64_gnu/0.5
 2.6 crate://crates.io/windows_x86_64_gnullvm/0.52.6 crate://crates.io/windows_x86_64_msvc/0.52.6 crate://crates.io/winnow/1.0.3 crate://crates.io/wit-bindgen/0.51.0 crate://crates.io/wit-bindgen-core/0.51.0 crate://crates.io/wit-bindgen-rust/0.51.0 crate://crates.io/wit-bindgen-rust-macro/0.51.0 crate://crates.io/wit-component/0.244.0 crate://crates.io/wit-parser/0.244.0 crate://crates.io/writeable/0.6.2 crate://crates.io/xattr/1.6.1 crate://crates.io/xz2/0.1.7 crate://crates.io/yoke/0.8.1 crate://crates.io/yoke-derive/0.8.1 crate://crates.io/zerofrom/0.1.6 crate://crates.io/zerofrom-derive/0.1.6 crate://crates.io/zerotrie/0.2.3 crate://crates.io/zerovec/0.11.5 crate://crates.io/zerovec-derive/0.11.2 crate://crates.io/zlib-rs/0.6.3 crate://crates.io/zmij/1.0.21 crate://crates.io/zstd/0.13.3 crate://crates.io/zstd-safe/7.2.4 crate://crates.io/zstd-sys/2.0.16+zstd.1.5.7" to "https://files.pythonhosted.org/packages/source/u/uv_build/uv_build-0.11.24.tar.gz;downloadfilename=uv_build-0.1
 1.24.tar.gz crate://crates.io/adler2/2.0.1 crate://crates.io/aho-corasick/1.1.4 crate://crates.io/allocator-api2/0.2.21 crate://crates.io/anstream/1.0.0 crate://crates.io/anstyle/1.0.14 crate://crates.io/anstyle-parse/1.0.0 crate://crates.io/anstyle-query/1.1.5 crate://crates.io/anstyle-wincon/3.0.11 crate://crates.io/anyhow/1.0.102 crate://crates.io/arcstr/1.2.0 crate://crates.io/arrayvec/0.7.6 crate://crates.io/astral-tokio-tar/0.6.2 crate://crates.io/astral-version-ranges/0.1.4 crate://crates.io/astral_async_zip/0.0.18 crate://crates.io/async-compression/0.4.19 crate://crates.io/autocfg/1.5.0 crate://crates.io/backon/1.6.0 crate://crates.io/base64/0.22.1 crate://crates.io/bitflags/2.13.0 crate://crates.io/block-buffer/0.10.4 crate://crates.io/boxcar/0.2.14 crate://crates.io/bstr/1.12.1 crate://crates.io/bumpalo/3.20.2 crate://crates.io/bytecheck/0.8.2 crate://crates.io/bytecheck_derive/0.8.2 crate://crates.io/bytes/1.11.1 crate://crates.io/bzip2/0.5.2 crate://crates.io/bzip2-sys/
 0.1.13+1.0.8 crate://crates.io/cc/1.2.57 crate://crates.io/cfg-if/1.0.4 crate://crates.io/charset/0.1.5 crate://crates.io/clap/4.6.1 crate://crates.io/clap_builder/4.6.0 crate://crates.io/clap_derive/4.6.1 crate://crates.io/clap_lex/1.1.0 crate://crates.io/colorchoice/1.0.5 crate://crates.io/console/0.16.3 crate://crates.io/cpufeatures/0.2.17 crate://crates.io/crc32fast/1.5.0 crate://crates.io/crypto-common/0.1.7 crate://crates.io/csv/1.4.0 crate://crates.io/csv-core/0.1.13 crate://crates.io/data-encoding/2.11.0 crate://crates.io/digest/0.10.7 crate://crates.io/displaydoc/0.2.5 crate://crates.io/dunce/1.0.5 crate://crates.io/dyn-clone/1.0.20 crate://crates.io/either/1.16.0 crate://crates.io/encode_unicode/1.0.0 crate://crates.io/encoding_rs/0.8.35 crate://crates.io/encoding_rs_io/0.1.7 crate://crates.io/enumflags2/0.7.12 crate://crates.io/enumflags2_derive/0.7.12 crate://crates.io/equivalent/1.0.2 crate://crates.io/erased-serde/0.4.10 crate://crates.io/errno/0.3.14 crate://crates.io
 /fastrand/2.4.1 crate://crates.io/filetime/0.2.29 crate://crates.io/find-msvc-tools/0.1.9 crate://crates.io/fixedbitset/0.5.7 crate://crates.io/flate2/1.1.9 crate://crates.io/foldhash/0.1.5 crate://crates.io/foldhash/0.2.0 crate://crates.io/form_urlencoded/1.2.2 crate://crates.io/fs-err/3.3.0 crate://crates.io/futures/0.3.32 crate://crates.io/futures-channel/0.3.32 crate://crates.io/futures-core/0.3.32 crate://crates.io/futures-executor/0.3.32 crate://crates.io/futures-io/0.3.32 crate://crates.io/futures-lite/2.6.1 crate://crates.io/futures-macro/0.3.32 crate://crates.io/futures-sink/0.3.32 crate://crates.io/futures-task/0.3.32 crate://crates.io/futures-util/0.3.32 crate://crates.io/generic-array/0.14.7 crate://crates.io/getrandom/0.3.3 crate://crates.io/globset/0.4.18 crate://crates.io/gloo-timers/0.3.0 crate://crates.io/hashbrown/0.15.5 crate://crates.io/hashbrown/0.17.1 crate://crates.io/heck/0.5.0 crate://crates.io/hex/0.4.3 crate://crates.io/icu_collections/2.1.1 crate://crates
 .io/icu_locale_core/2.1.1 crate://crates.io/icu_normalizer/2.1.1 crate://crates.io/icu_normalizer_data/2.1.1 crate://crates.io/icu_properties/2.1.2 crate://crates.io/icu_properties_data/2.1.2 crate://crates.io/icu_provider/2.1.1 crate://crates.io/idna/1.1.0 crate://crates.io/idna_adapter/1.2.1 crate://crates.io/indexmap/2.14.0 crate://crates.io/indoc/2.0.7 crate://crates.io/insta/1.48.0 crate://crates.io/is_terminal_polyfill/1.70.2 crate://crates.io/itertools/0.14.0 crate://crates.io/itoa/1.0.17 crate://crates.io/jiff/0.2.28 crate://crates.io/jiff-static/0.2.28 crate://crates.io/jiff-tzdb/0.1.6 crate://crates.io/jiff-tzdb-platform/0.1.3 crate://crates.io/jobserver/0.1.34 crate://crates.io/js-sys/0.3.91 crate://crates.io/junction/2.0.0 crate://crates.io/lazy_static/1.5.0 crate://crates.io/libc/0.2.186 crate://crates.io/linux-raw-sys/0.12.1 crate://crates.io/litemap/0.8.1 crate://crates.io/lock_api/0.4.14 crate://crates.io/log/0.4.29 crate://crates.io/lzma-sys/0.1.20 crate://crates.io
 /mailparse/0.16.1 crate://crates.io/matchers/0.2.0 crate://crates.io/memchr/2.8.2 crate://crates.io/miniz_oxide/0.8.9 crate://crates.io/mio/1.2.0 crate://crates.io/munge/0.4.7 crate://crates.io/munge_macro/0.4.7 crate://crates.io/nu-ansi-term/0.50.3 crate://crates.io/once_cell/1.21.4 crate://crates.io/once_cell_polyfill/1.70.2 crate://crates.io/owo-colors/4.3.0 crate://crates.io/parking/2.2.1 crate://crates.io/parking_lot/0.12.5 crate://crates.io/parking_lot_core/0.9.12 crate://crates.io/path-slash/0.2.1 crate://crates.io/percent-encoding/2.3.2 crate://crates.io/pest/2.8.6 crate://crates.io/pest_derive/2.8.6 crate://crates.io/pest_generator/2.8.6 crate://crates.io/pest_meta/2.8.6 crate://crates.io/petgraph/0.8.3 crate://crates.io/pin-project/1.1.11 crate://crates.io/pin-project-internal/1.1.11 crate://crates.io/pin-project-lite/0.2.17 crate://crates.io/pkg-config/0.3.32 crate://crates.io/portable-atomic/1.13.1 crate://crates.io/portable-atomic-util/0.2.6 crate://crates.io/potential_
 utf/0.1.4 crate://crates.io/proc-macro2/1.0.106 crate://crates.io/ptr_meta/0.3.1 crate://crates.io/ptr_meta_derive/0.3.1 crate://crates.io/quote/1.0.45 crate://crates.io/quoted_printable/0.5.1 crate://crates.io/r-efi/5.3.0 crate://crates.io/rancor/0.1.1 crate://crates.io/redox_syscall/0.5.15 crate://crates.io/ref-cast/1.0.25 crate://crates.io/ref-cast-impl/1.0.25 crate://crates.io/reflink-copy/0.1.29 crate://crates.io/regex/1.12.4 crate://crates.io/regex-automata/0.4.14 crate://crates.io/regex-syntax/0.8.11 crate://crates.io/rend/0.5.3 crate://crates.io/rkyv/0.8.16 crate://crates.io/rkyv_derive/0.8.16 crate://crates.io/rustc-hash/2.1.2 crate://crates.io/rustix/1.1.4 crate://crates.io/rustversion/1.0.22 crate://crates.io/ryu/1.0.23 crate://crates.io/same-file/1.0.6 crate://crates.io/schemars/1.2.1 crate://crates.io/schemars_derive/1.2.1 crate://crates.io/scopeguard/1.2.0 crate://crates.io/seahash/4.1.0 crate://crates.io/self-replace/1.5.0 crate://crates.io/serde/1.0.228 crate://crate
 s.io/serde-untagged/0.1.9 crate://crates.io/serde_core/1.0.228 crate://crates.io/serde_derive/1.0.228 crate://crates.io/serde_derive_internals/0.29.1 crate://crates.io/serde_json/1.0.150 crate://crates.io/serde_spanned/1.1.1 crate://crates.io/sha2/0.10.9 crate://crates.io/sharded-slab/0.1.7 crate://crates.io/shlex/1.3.0 crate://crates.io/signal-hook-registry/1.4.8 crate://crates.io/simd-adler32/0.3.8 crate://crates.io/simdutf8/0.1.5 crate://crates.io/similar/2.7.0 crate://crates.io/slab/0.4.12 crate://crates.io/smallvec/1.15.2 crate://crates.io/smawk/0.3.2 crate://crates.io/spdx/0.13.4 crate://crates.io/stable_deref_trait/1.2.1 crate://crates.io/strip-ansi-escapes/0.2.1 crate://crates.io/strsim/0.11.1 crate://crates.io/syn/2.0.117 crate://crates.io/synstructure/0.13.2 crate://crates.io/temp-env/0.3.6 crate://crates.io/tempfile/3.27.0 crate://crates.io/terminal_size/0.4.4 crate://crates.io/textwrap/0.16.2 crate://crates.io/thiserror/2.0.18 crate://crates.io/thiserror-impl/2.0.18 crat
 e://crates.io/thread_local/1.1.9 crate://crates.io/tinystr/0.8.2 crate://crates.io/tinyvec/1.11.0 crate://crates.io/tinyvec_macros/0.1.1 crate://crates.io/tokio/1.52.3 crate://crates.io/tokio-macros/2.7.0 crate://crates.io/tokio-stream/0.1.18 crate://crates.io/tokio-util/0.7.18 crate://crates.io/toml/1.1.2+spec-1.1.0 crate://crates.io/toml_datetime/1.1.1+spec-1.1.0 crate://crates.io/toml_edit/0.25.12+spec-1.1.0 crate://crates.io/toml_parser/1.1.2+spec-1.1.0 crate://crates.io/toml_writer/1.1.1+spec-1.1.0 crate://crates.io/tracing/0.1.44 crate://crates.io/tracing-attributes/0.1.31 crate://crates.io/tracing-core/0.1.36 crate://crates.io/tracing-log/0.2.0 crate://crates.io/tracing-subscriber/0.3.23 crate://crates.io/tracing-test/0.2.6 crate://crates.io/tracing-test-macro/0.2.6 crate://crates.io/typeid/1.0.3 crate://crates.io/typenum/1.19.0 crate://crates.io/ucd-trie/0.1.7 crate://crates.io/unicode-ident/1.0.24 crate://crates.io/unicode-linebreak/0.1.5 crate://crates.io/unicode-width/0.2
 .2 crate://crates.io/unscanny/0.1.0 crate://crates.io/url/2.5.8 crate://crates.io/utf8_iter/1.0.4 crate://crates.io/utf8parse/0.2.2 crate://crates.io/uuid/1.23.3 crate://crates.io/valuable/0.1.1 crate://crates.io/version_check/0.9.5 crate://crates.io/vte/0.14.1 crate://crates.io/walkdir/2.5.0 crate://crates.io/wasi/0.11.1+wasi-snapshot-preview1 crate://crates.io/wasi/0.14.7+wasi-0.2.4 crate://crates.io/wasip2/1.0.2+wasi-0.2.9 crate://crates.io/wasm-bindgen/0.2.114 crate://crates.io/wasm-bindgen-macro/0.2.114 crate://crates.io/wasm-bindgen-macro-support/0.2.114 crate://crates.io/wasm-bindgen-shared/0.2.114 crate://crates.io/winapi-util/0.1.11 crate://crates.io/windows/0.61.3 crate://crates.io/windows-collections/0.2.0 crate://crates.io/windows-core/0.61.2 crate://crates.io/windows-future/0.2.1 crate://crates.io/windows-implement/0.60.2 crate://crates.io/windows-interface/0.59.3 crate://crates.io/windows-link/0.1.3 crate://crates.io/windows-link/0.2.1 crate://crates.io/windows-numeric
 s/0.2.0 crate://crates.io/windows-result/0.3.4 crate://crates.io/windows-strings/0.4.2 crate://crates.io/windows-sys/0.52.0 crate://crates.io/windows-sys/0.61.2 crate://crates.io/windows-targets/0.52.6 crate://crates.io/windows-threading/0.1.0 crate://crates.io/windows_aarch64_gnullvm/0.52.6 crate://crates.io/windows_aarch64_msvc/0.52.6 crate://crates.io/windows_i686_gnu/0.52.6 crate://crates.io/windows_i686_gnullvm/0.52.6 crate://crates.io/windows_i686_msvc/0.52.6 crate://crates.io/windows_x86_64_gnu/0.52.6 crate://crates.io/windows_x86_64_gnullvm/0.52.6 crate://crates.io/windows_x86_64_msvc/0.52.6 crate://crates.io/winnow/1.0.3 crate://crates.io/wit-bindgen/0.51.0 crate://crates.io/writeable/0.6.2 crate://crates.io/xattr/1.6.1 crate://crates.io/xz2/0.1.7 crate://crates.io/yoke/0.8.1 crate://crates.io/yoke-derive/0.8.1 crate://crates.io/zerofrom/0.1.6 crate://crates.io/zerofrom-derive/0.1.6 crate://crates.io/zerotrie/0.2.3 crate://crates.io/zerovec/0.11.5 crate://crates.io/zerovec-
 derive/0.11.2 crate://crates.io/zlib-rs/0.6.3 crate://crates.io/zmij/1.0.21 crate://crates.io/zstd/0.13.3 crate://crates.io/zstd-safe/7.2.4 crate://crates.io/zstd-sys/2.0.16+zstd.1.5.7"
packages/x86-64-v3-poky-linux/python3-uv-build: PV changed from "0.11.21" to "0.11.24"
packages/x86-64-v3-poky-linux/python3-uv-build: PKGV changed from 0.11.21 [default] to 0.11.24 [default]
packages/x86-64-v3-poky-linux/python3-uv-build/python3-uv-build-dbg: PV changed from "0.11.21" to "0.11.24"
packages/x86-64-v3-poky-linux/python3-uv-build/python3-uv-build-dbg: PKGV changed from 0.11.21 [default] to 0.11.24 [default]
packages/x86-64-v3-poky-linux/python3-uv-build/python3-uv-build-dev: PV changed from "0.11.21" to "0.11.24"
packages/x86-64-v3-poky-linux/python3-uv-build/python3-uv-build-dev: PKGV changed from 0.11.21 [default] to 0.11.24 [default]
packages/x86-64-v3-poky-linux/python3-uv-build/python3-uv-build-doc: PV changed from "0.11.21" to "0.11.24"
packages/x86-64-v3-poky-linux/python3-uv-build/python3-uv-build-doc: PKGV changed from 0.11.21 [default] to 0.11.24 [default]
packages/x86-64-v3-poky-linux/python3-uv-build/python3-uv-build-locale: PV changed from "0.11.21" to "0.11.24"
packages/x86-64-v3-poky-linux/python3-uv-build/python3-uv-build-locale: PKGV changed from 0.11.21 [default] to 0.11.24 [default]
packages/x86-64-v3-poky-linux/python3-uv-build/python3-uv-build-src: PV changed from "0.11.21" to "0.11.24"
packages/x86-64-v3-poky-linux/python3-uv-build/python3-uv-build-src: PKGV changed from 0.11.21 [default] to 0.11.24 [default]
packages/x86-64-v3-poky-linux/python3-uv-build/python3-uv-build-staticdev: PV changed from "0.11.21" to "0.11.24"
packages/x86-64-v3-poky-linux/python3-uv-build/python3-uv-build-staticdev: PKGV changed from 0.11.21 [default] to 0.11.24 [default]
packages/x86-64-v3-poky-linux/python3-uv-build/python3-uv-build: PV changed from "0.11.21" to "0.11.24"
packages/x86-64-v3-poky-linux/python3-uv-build/python3-uv-build: PKGSIZE changed from 5340466 to 5344562 (+0%)
packages/x86-64-v3-poky-linux/python3-uv-build/python3-uv-build: PKGV changed from 0.11.21 [default] to 0.11.24 [default]
packages/x86-64-v3-poky-linux/python3-uv-build/python3-uv-build: FILELIST: directory renamed /usr/lib/python3.14/site-packages/uv_build-0.11.21.dist-info -> /usr/lib/python3.14/site-packages/uv_build-0.11.24.dist-info, directory renamed /usr/lib/python3.14/site-packages/uv_build-0.11.21.dist-info/licenses -> /usr/lib/python3.14/site-packages/uv_build-0.11.24.dist-info/licenses
Changes to packages/x86-64-v3-poky-linux/python3-uv-build (sysroot):
  /usr/lib/python3.14/site-packages/uv_build-0.11.21.dist-info moved to /usr/lib/python3.14/site-packages/uv_build-0.11.24.dist-info

--===============5378969914786936916==--

