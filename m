Return-Path: <auh@yoctoproject.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 0BBF9C79FBE
	for <webhook@archiver.kernel.org>; Wed,  9 Sep 2026 05:42:36 +0000 (UTC)
Received: from a27-192.smtp-out.us-west-2.amazonses.com (a27-192.smtp-out.us-west-2.amazonses.com [54.240.27.192])
 by mx.groups.io with SMTP id smtpd.msgproc01-g2.5178.1788932547823415129
 for <openembedded-core@lists.openembedded.org>;
 Tue, 08 Sep 2026 22:42:27 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@yoctoproject.org header.s=lvjh2tk576v2ro5mi6k4dt3mc6wpqbky header.b=ZyQ5bWye;
 dkim=pass header.i=@amazonses.com header.s=hsbnp7p3ensaochzwyq5wwmceodymuwv header.b=hI9ECkD8;
 spf=pass (domain: us-west-2.amazonses.com, ip: 54.240.27.192, mailfrom: 010101a084b06110-d8f9ed6f-04a4-432e-897d-4beaba3bd81d-000000@us-west-2.amazonses.com)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/simple;
	s=lvjh2tk576v2ro5mi6k4dt3mc6wpqbky; d=yoctoproject.org;
	t=1788932547;
	h=Content-Type:MIME-Version:From:To:Cc:Subject:Message-Id:Date;
	bh=M+KRgZloDpQC4VH53IHVm8wdlcsKp7xZXPFZ6a6dmM0=;
	b=ZyQ5bWyeU+5RX7Y86kdSZMCbhrXwQMiG8E3Xk2m3cjbTDxRaGQptCX6UyVHSwqMk
	QxJyjxG/B8ipL7cuvrfhrLGXJ9ujjLB1vDsaDdGDNBD3Ggw2LTAsvn4cIX2KiWQhxFp
	GsuqR7a3mh04GO0X3noH+JtpP51p2L59z7y7Km0I=
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/simple;
	s=hsbnp7p3ensaochzwyq5wwmceodymuwv; d=amazonses.com; t=1788932547;
	h=Content-Type:MIME-Version:From:To:Cc:Subject:Message-Id:Date:Feedback-ID;
	bh=M+KRgZloDpQC4VH53IHVm8wdlcsKp7xZXPFZ6a6dmM0=;
	b=hI9ECkD8wW3OHY6uYX5/K9v/x5iJ0UKC+FXAC0DkedpHtWauj3JWGf5mw7tOdx4a
	+aPBlQorVI0DpQ+lt4NIK8xkX5kiA2qQbA+i0+sqetpuRuUWsVeT9779HoFCduy/VhF
	Ld6TxbzvwNnZhzXpOs7iQ8zSbrPbuIMMubThaB1w=
Content-Type: multipart/mixed; boundary="===============2686610472632495508=="
MIME-Version: 1.0
From: auh@yoctoproject.org
To: Trevor Gamblin <tgamblin@baylibre.com>
Cc: openembedded-core@lists.openembedded.org
Subject: [AUH] python3-uv-build: upgrading to 0.12.11 SUCCEEDED
Message-ID: <010101a084b06110-d8f9ed6f-04a4-432e-897d-4beaba3bd81d-000000@us-west-2.amazonses.com>
Date: Wed, 9 Sep 2026 05:42:26 +0000
Feedback-ID: ::1.us-west-2.9np3MYPs3fEaOBysGKSlUD4KtcmPijcmS9Az2Hwf7iQ=:AmazonSES
X-SES-Outgoing: 2026.09.09-54.240.27.192
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Wed, 09 Sep 2026 05:42:36 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/245397

--===============2686610472632495508==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit

Hello,

this email is a notification from the Auto Upgrade Helper
that the automatic attempt to upgrade the recipe(s) *python3-uv-build* to *0.12.11* has Succeeded.

Next steps:
    - apply the patch: git am 0001-python3-uv-build-upgrade-0.12.10-0.12.11.patch
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
From 47e223b35991f2f245f9d865e66fb1449264e267 Mon Sep 17 00:00:00 2001
From: Upgrade Helper <auh@yoctoproject.org>
Date: Wed, 9 Sep 2026 05:23:03 +0000
Subject: [PATCH] python3-uv-build: upgrade 0.12.10 -> 0.12.11

---
 .../python/python3-uv-build-crates.inc        | 52 +++++++++++--------
 ...0.12.10.bb => python3-uv-build_0.12.11.bb} |  2 +-
 2 files changed, 31 insertions(+), 23 deletions(-)
 rename meta/recipes-devtools/python/{python3-uv-build_0.12.10.bb => python3-uv-build_0.12.11.bb} (92%)

diff --git a/meta/recipes-devtools/python/python3-uv-build-crates.inc b/meta/recipes-devtools/python/python3-uv-build-crates.inc
index 13c4af5dbc..02e8f9a8ab 100644
--- a/meta/recipes-devtools/python/python3-uv-build-crates.inc
+++ b/meta/recipes-devtools/python/python3-uv-build-crates.inc
@@ -29,16 +29,16 @@ SRC_URI += " \
     crate://crates.io/boxcar/0.2.14 \
     crate://crates.io/bstr/1.12.1 \
     crate://crates.io/bumpalo/3.20.2 \
-    crate://crates.io/bytecheck/0.8.2 \
-    crate://crates.io/bytecheck_derive/0.8.2 \
+    crate://crates.io/bytecheck/0.8.3 \
+    crate://crates.io/bytecheck_derive/0.8.3 \
     crate://crates.io/bytes/1.12.1 \
     crate://crates.io/cap-primitives/4.0.3 \
     crate://crates.io/cap-std/4.0.3 \
     crate://crates.io/cc/1.2.57 \
     crate://crates.io/cfg-if/1.0.4 \
     crate://crates.io/charset/0.1.5 \
-    crate://crates.io/clap/4.6.5 \
-    crate://crates.io/clap_builder/4.6.5 \
+    crate://crates.io/clap/4.6.6 \
+    crate://crates.io/clap_builder/4.6.6 \
     crate://crates.io/clap_derive/4.6.4 \
     crate://crates.io/clap_lex/1.1.0 \
     crate://crates.io/colorchoice/1.0.5 \
@@ -51,7 +51,7 @@ SRC_URI += " \
     crate://crates.io/crypto-common/0.2.2 \
     crate://crates.io/csv/1.4.0 \
     crate://crates.io/csv-core/0.1.13 \
-    crate://crates.io/data-encoding/2.11.0 \
+    crate://crates.io/data-encoding/2.11.1 \
     crate://crates.io/defmt/1.1.0 \
     crate://crates.io/defmt-macros/1.1.0 \
     crate://crates.io/defmt-parser/1.0.0 \
@@ -63,7 +63,7 @@ SRC_URI += " \
     crate://crates.io/either/1.17.0 \
     crate://crates.io/encode_unicode/1.0.0 \
     crate://crates.io/encoding_rs/0.8.35 \
-    crate://crates.io/encoding_rs_io/0.1.7 \
+    crate://crates.io/encoding_rs_io/0.1.8 \
     crate://crates.io/enumflags2/0.7.12 \
     crate://crates.io/enumflags2_derive/0.7.12 \
     crate://crates.io/equivalent/1.0.2 \
@@ -89,8 +89,9 @@ SRC_URI += " \
     crate://crates.io/futures-task/0.3.33 \
     crate://crates.io/futures-util/0.3.33 \
     crate://crates.io/generic-array/0.14.7 \
+    crate://crates.io/getrandom/0.3.4 \
     crate://crates.io/getrandom/0.4.3 \
-    crate://crates.io/globset/0.4.19 \
+    crate://crates.io/globset/0.4.20 \
     crate://crates.io/gloo-timers/0.3.0 \
     crate://crates.io/hashbrown/0.15.5 \
     crate://crates.io/hashbrown/0.17.1 \
@@ -166,6 +167,7 @@ SRC_URI += " \
     crate://crates.io/ptr_meta_derive/0.3.1 \
     crate://crates.io/quote/1.0.47 \
     crate://crates.io/quoted_printable/0.5.1 \
+    crate://crates.io/r-efi/5.3.0 \
     crate://crates.io/r-efi/6.0.0 \
     crate://crates.io/rancor/0.1.1 \
     crate://crates.io/redox_syscall/0.5.15 \
@@ -173,11 +175,11 @@ SRC_URI += " \
     crate://crates.io/ref-cast-impl/1.0.26 \
     crate://crates.io/reflink-copy/0.1.30 \
     crate://crates.io/regex/1.13.1 \
-    crate://crates.io/regex-automata/0.4.16 \
+    crate://crates.io/regex-automata/0.4.18 \
     crate://crates.io/regex-syntax/0.8.11 \
     crate://crates.io/rend/0.5.3 \
-    crate://crates.io/rkyv/0.8.17 \
-    crate://crates.io/rkyv_derive/0.8.17 \
+    crate://crates.io/rkyv/0.8.18 \
+    crate://crates.io/rkyv_derive/0.8.18 \
     crate://crates.io/rustc-hash/2.1.3 \
     crate://crates.io/rustix/1.1.4 \
     crate://crates.io/rustix-linux-procfs/0.1.1 \
@@ -207,7 +209,7 @@ SRC_URI += " \
     crate://crates.io/slab/0.4.12 \
     crate://crates.io/smallvec/1.15.2 \
     crate://crates.io/smawk/0.3.2 \
-    crate://crates.io/spdx/0.13.4 \
+    crate://crates.io/spdx/0.13.5 \
     crate://crates.io/stable_deref_trait/1.2.1 \
     crate://crates.io/strip-ansi-escapes/0.2.1 \
     crate://crates.io/strsim/0.11.1 \
@@ -258,6 +260,7 @@ SRC_URI += " \
     crate://crates.io/vte/0.14.1 \
     crate://crates.io/walkdir/2.5.0 \
     crate://crates.io/wasi/0.11.1+wasi-snapshot-preview1 \
+    crate://crates.io/wasip2/1.0.4+wasi-0.2.12 \
     crate://crates.io/wasm-bindgen/0.2.114 \
     crate://crates.io/wasm-bindgen-macro/0.2.114 \
     crate://crates.io/wasm-bindgen-macro-support/0.2.114 \
@@ -298,6 +301,7 @@ SRC_URI += " \
     crate://crates.io/windows_x86_64_msvc/0.53.1 \
     crate://crates.io/winnow/1.0.3 \
     crate://crates.io/winx/0.36.4 \
+    crate://crates.io/wit-bindgen/0.57.1 \
     crate://crates.io/writeable/0.6.2 \
     crate://crates.io/xattr/1.6.1 \
     crate://crates.io/yoke/0.8.1 \
@@ -343,16 +347,16 @@ SRC_URI[block-buffer-0.12.1.sha256sum] = "d2f6c7dbe95a6ed67ad9f18e57daf93a2f034c
 SRC_URI[boxcar-0.2.14.sha256sum] = "36f64beae40a84da1b4b26ff2761a5b895c12adc41dc25aaee1c4f2bbfe97a6e"
 SRC_URI[bstr-1.12.1.sha256sum] = "63044e1ae8e69f3b5a92c736ca6269b8d12fa7efe39bf34ddb06d102cf0e2cab"
 SRC_URI[bumpalo-3.20.2.sha256sum] = "5d20789868f4b01b2f2caec9f5c4e0213b41e3e5702a50157d699ae31ced2fcb"
-SRC_URI[bytecheck-0.8.2.sha256sum] = "0caa33a2c0edca0419d15ac723dff03f1956f7978329b1e3b5fdaaaed9d3ca8b"
-SRC_URI[bytecheck_derive-0.8.2.sha256sum] = "89385e82b5d1821d2219e0b095efa2cc1f246cbf99080f3be46a1a85c0d392d9"
+SRC_URI[bytecheck-0.8.3.sha256sum] = "26333eeac754f0ad8a6bcd0eb0ac012156302e4e16b852b72ee399aea4f12c29"
+SRC_URI[bytecheck_derive-0.8.3.sha256sum] = "46d07918caa9eeaaf06b7873925c53a61daac173539b4f7715090745e44e4e69"
 SRC_URI[bytes-1.12.1.sha256sum] = "fc652a48c352aef3ea3aed32080501cf3ef6ed5da78602a020c991775b0aff04"
 SRC_URI[cap-primitives-4.0.3.sha256sum] = "8b5f74729fd2f44701d1a8eb47e906cdb3ccd9ec0f02baad85a744b791940b18"
 SRC_URI[cap-std-4.0.3.sha256sum] = "c1ec78e242cfa2cfe276807ac2ecc00315a6c97786977414bcd1c3963b6c91b8"
 SRC_URI[cc-1.2.57.sha256sum] = "7a0dd1ca384932ff3641c8718a02769f1698e7563dc6974ffd03346116310423"
 SRC_URI[cfg-if-1.0.4.sha256sum] = "9330f8b2ff13f34540b44e946ef35111825727b38d33286ef986142615121801"
 SRC_URI[charset-0.1.5.sha256sum] = "f1f927b07c74ba84c7e5fe4db2baeb3e996ab2688992e39ac68ce3220a677c7e"
-SRC_URI[clap-4.6.5.sha256sum] = "301b56658598e48f3648647ac6fc887be7e7108eddfa4e9b63fcf3ec58c0cadf"
-SRC_URI[clap_builder-4.6.5.sha256sum] = "94a65403d1a1bd28f7dc68eb8506e8874808ee5eecb59298de588e2e1407a078"
+SRC_URI[clap-4.6.6.sha256sum] = "473c7e07f409a8d772161724aa8db6a765a2532a70f9667eeb7b49d3d02fbdca"
+SRC_URI[clap_builder-4.6.6.sha256sum] = "7b48fea5a88e9ae728a2dcbedbfc0e730f7d60da42e1cb049a83c9fb8b789889"
 SRC_URI[clap_derive-4.6.4.sha256sum] = "d012d2b9d65aca7f18f4d9878a045bc17899bba951561ba5ec3c2ba1eed9a061"
 SRC_URI[clap_lex-1.1.0.sha256sum] = "c8d4a3bb8b1e0c1050499d1815f5ab16d04f0959b233085fb31653fbfc9d98f9"
 SRC_URI[colorchoice-1.0.5.sha256sum] = "1d07550c9036bf2ae0c684c4297d503f838287c83c53686d05370d0e139ae570"
@@ -365,7 +369,7 @@ SRC_URI[crypto-common-0.1.7.sha256sum] = "78c8292055d1c1df0cce5d180393dc8cce0abe
 SRC_URI[crypto-common-0.2.2.sha256sum] = "ce6e4c961d6cd6c9a86db418387425e8bdeaf05b3c8bc1411e6dca4c252f1453"
 SRC_URI[csv-1.4.0.sha256sum] = "52cd9d68cf7efc6ddfaaee42e7288d3a99d613d4b50f76ce9827ae0c6e14f938"
 SRC_URI[csv-core-0.1.13.sha256sum] = "704a3c26996a80471189265814dbc2c257598b96b8a7feae2d31ace646bb9782"
-SRC_URI[data-encoding-2.11.0.sha256sum] = "a4ae5f15dda3c708c0ade84bfee31ccab44a3da4f88015ed22f63732abe300c8"
+SRC_URI[data-encoding-2.11.1.sha256sum] = "4583a4551df46e2792f82ceeac45e850d2e2d5debba0b91f102385cda5b11f06"
 SRC_URI[defmt-1.1.0.sha256sum] = "a6e524506490a1953d237cb87b1cfc1e46f88c18f10a22dfe0f507dc6bfc7f7f"
 SRC_URI[defmt-macros-1.1.0.sha256sum] = "f0a27770e9c8f719a79d8b638281f4d828f77d8fd61e0bd94451b9b85e576a0b"
 SRC_URI[defmt-parser-1.0.0.sha256sum] = "10d60334b3b2e7c9d91ef8150abfb6fa4c1c39ebbcf4a81c2e346aad939fee3e"
@@ -377,7 +381,7 @@ SRC_URI[dyn-clone-1.0.20.sha256sum] = "d0881ea181b1df73ff77ffaaf9c7544ecc11e82fb
 SRC_URI[either-1.17.0.sha256sum] = "9e5e8f6c15a24b9a3ee5efec809ccd006d3b30e8b3bb63c39af737c7f87daa1d"
 SRC_URI[encode_unicode-1.0.0.sha256sum] = "34aa73646ffb006b8f5147f3dc182bd4bcb190227ce861fc4a4844bf8e3cb2c0"
 SRC_URI[encoding_rs-0.8.35.sha256sum] = "75030f3c4f45dafd7586dd6780965a8c7e8e285a5ecb86713e63a79c5b2766f3"
-SRC_URI[encoding_rs_io-0.1.7.sha256sum] = "1cc3c5651fb62ab8aa3103998dade57efdd028544bd300516baa31840c252a83"
+SRC_URI[encoding_rs_io-0.1.8.sha256sum] = "fba3fe847045ecff794b9c138293a80db914678c453ad63fbf0c6a9eb6e00b22"
 SRC_URI[enumflags2-0.7.12.sha256sum] = "1027f7680c853e056ebcec683615fb6fbbc07dbaa13b4d5d9442b146ded4ecef"
 SRC_URI[enumflags2_derive-0.7.12.sha256sum] = "67c78a4d8fdf9953a5c9d458f9efe940fd97a0cab0941c075a813ac594733827"
 SRC_URI[equivalent-1.0.2.sha256sum] = "877a4ace8713b0bcf2a4e7eec82529c029f1d0619886d18145fea96c3ffe5c0f"
@@ -403,8 +407,9 @@ SRC_URI[futures-sink-0.3.33.sha256sum] = "e34418ac499d6305c2fb5ad0ed2f6ac998c5f8
 SRC_URI[futures-task-0.3.33.sha256sum] = "b231ed28831efb4a61a08580c4bc233ec56bc009f4cd8f52da2c3cb97df0c109"
 SRC_URI[futures-util-0.3.33.sha256sum] = "a77a90a256fce34da66415271e30f94ee91c57b04b8a2c042d9cf3220179deaa"
 SRC_URI[generic-array-0.14.7.sha256sum] = "85649ca51fd72272d7821adaf274ad91c288277713d9c18820d8499a7ff69e9a"
+SRC_URI[getrandom-0.3.4.sha256sum] = "899def5c37c4fd7b2664648c28120ecec138e4d395b459e5ca34f9cce2dd77fd"
 SRC_URI[getrandom-0.4.3.sha256sum] = "300e883d756b2e4ec94e02791f39b04b522276138852cfc41d9fb7e904106099"
-SRC_URI[globset-0.4.19.sha256sum] = "e47d37d2ae4464254884b60ab7071be2b876a9c35b696bd018ddcc76847309cd"
+SRC_URI[globset-0.4.20.sha256sum] = "07c34a9410465b45bd9787443bc7370f37735bad04b0f0cd57ff1a3186c98988"
 SRC_URI[gloo-timers-0.3.0.sha256sum] = "bbb143cf96099802033e0d4f4963b19fd2e0b728bcf076cd9cf7f6634f092994"
 SRC_URI[hashbrown-0.15.5.sha256sum] = "9229cfe53dfd69f0609a49f65461bd93001ea1ef889cd5529dd176593f5338a1"
 SRC_URI[hashbrown-0.17.1.sha256sum] = "ed5909b6e89a2db4456e54cd5f673791d7eca6732202bbf2a9cc504fe2f9b84a"
@@ -480,6 +485,7 @@ SRC_URI[ptr_meta-0.3.1.sha256sum] = "0b9a0cf95a1196af61d4f1cbdab967179516d9a4a43
 SRC_URI[ptr_meta_derive-0.3.1.sha256sum] = "7347867d0a7e1208d93b46767be83e2b8f978c3dad35f775ac8d8847551d6fe1"
 SRC_URI[quote-1.0.47.sha256sum] = "1fbf4db142a473a8d80c26bbf18454ed458bf8d26c8219c331daecfdbd079001"
 SRC_URI[quoted_printable-0.5.1.sha256sum] = "640c9bd8497b02465aeef5375144c26062e0dcd5939dfcbb0f5db76cb8c17c73"
+SRC_URI[r-efi-5.3.0.sha256sum] = "69cdb34c158ceb288df11e18b4bd39de994f6657d83847bdffdbd7f346754b0f"
 SRC_URI[r-efi-6.0.0.sha256sum] = "f8dcc9c7d52a811697d2151c701e0d08956f92b0e24136cf4cf27b57a6a0d9bf"
 SRC_URI[rancor-0.1.1.sha256sum] = "a063ea72381527c2a0561da9c80000ef822bdd7c3241b1cc1b12100e3df081ee"
 SRC_URI[redox_syscall-0.5.15.sha256sum] = "7e8af0dde094006011e6a740d4879319439489813bd0bcdc7d821beaeeff48ec"
@@ -487,11 +493,11 @@ SRC_URI[ref-cast-1.0.26.sha256sum] = "216e8f773d7923bcba9ceb86a86c93cabb3903a118
 SRC_URI[ref-cast-impl-1.0.26.sha256sum] = "2c9283685feec7d69af75fb0e858d5e7378f33fe4fc699383b2916ab9273e03c"
 SRC_URI[reflink-copy-0.1.30.sha256sum] = "d9dd7ab4af0363d5ccfd2838d782a28196cf32a5cc2e4fe3c5dc83f2be588b8b"
 SRC_URI[regex-1.13.1.sha256sum] = "f020237b6c8eed93db2e2cb53c00c60a8e1bc73da7d073199a1180401450218d"
-SRC_URI[regex-automata-0.4.16.sha256sum] = "8fcfdb36bda0c880c5931cdc7a2bcdc8ba4556847b9d912bca70bc94708711ad"
+SRC_URI[regex-automata-0.4.18.sha256sum] = "ad8553b9b26413251cbf30e620595c7a41b3887f03da04579c0e6b0d6a06b4b2"
 SRC_URI[regex-syntax-0.8.11.sha256sum] = "d6f6ff9a378485b298a5286656da665ba74413d36db0979633275d2e708145d4"
 SRC_URI[rend-0.5.3.sha256sum] = "cadadef317c2f20755a64d7fdc48f9e7178ee6b0e1f7fce33fa60f1d68a276e6"
-SRC_URI[rkyv-0.8.17.sha256sum] = "815cc8a37159a463064825246cadb07961e25cd9885908606f6d08a98d8f8874"
-SRC_URI[rkyv_derive-0.8.17.sha256sum] = "c0ed1a78a1b19d184b0daa629dd9a024573173ec7d485b287cb369fb3607cc1c"
+SRC_URI[rkyv-0.8.18.sha256sum] = "d9776093b7ca170454ab1406954f7b7d97a57c51dc6c0642957fb2ef25c2d399"
+SRC_URI[rkyv_derive-0.8.18.sha256sum] = "1c25ef604ac7dd839d44d64648952ea23c97866f124ff671b0ed2cf3ad9bb06e"
 SRC_URI[rustc-hash-2.1.3.sha256sum] = "6b1e7f9a428571be2dc5bc0505c13fb6bf936822b894ec87abf8a08a4e51742d"
 SRC_URI[rustix-1.1.4.sha256sum] = "b6fe4565b9518b83ef4f91bb47ce29620ca828bd32cb7e408f0062e9930ba190"
 SRC_URI[rustix-linux-procfs-0.1.1.sha256sum] = "2fc84bf7e9aa16c4f2c758f27412dc9841341e16aa682d9c7ac308fe3ee12056"
@@ -521,7 +527,7 @@ SRC_URI[similar-2.7.0.sha256sum] = "bbbb5d9659141646ae647b42fe094daf6c6192d16208
 SRC_URI[slab-0.4.12.sha256sum] = "0c790de23124f9ab44544d7ac05d60440adc586479ce501c1d6d7da3cd8c9cf5"
 SRC_URI[smallvec-1.15.2.sha256sum] = "8ed6a63f02c8539c91a8685a86f4099661ba3da017932f6ebbea6de3f0fa7c90"
 SRC_URI[smawk-0.3.2.sha256sum] = "b7c388c1b5e93756d0c740965c41e8822f866621d41acbdf6336a6a168f8840c"
-SRC_URI[spdx-0.13.4.sha256sum] = "a8da593e30beb790fc9424502eb898320b44e5eb30367dbda1c1edde8e2f32d7"
+SRC_URI[spdx-0.13.5.sha256sum] = "081670c233dfbed55690cc0cd38424e0e24ac1b2673d0b408b3f7b684738dfa9"
 SRC_URI[stable_deref_trait-1.2.1.sha256sum] = "6ce2be8dc25455e1f91df71bfa12ad37d7af1092ae736f3a6cd0e37bc7810596"
 SRC_URI[strip-ansi-escapes-0.2.1.sha256sum] = "2a8f8038e7e7969abb3f1b7c2a811225e9296da208539e0f79c5251d6cac0025"
 SRC_URI[strsim-0.11.1.sha256sum] = "7da8b5736845d9f2fcb837ea5d9e2628564b3b043a70948a3f0b778838c5fb4f"
@@ -572,6 +578,7 @@ SRC_URI[version_check-0.9.5.sha256sum] = "0b928f33d975fc6ad9f86c8f283853ad26bdd5
 SRC_URI[vte-0.14.1.sha256sum] = "231fdcd7ef3037e8330d8e17e61011a2c244126acc0a982f4040ac3f9f0bc077"
 SRC_URI[walkdir-2.5.0.sha256sum] = "29790946404f91d9c5d06f9874efddea1dc06c5efe94541a7d6863108e3a5e4b"
 SRC_URI[wasi-0.11.1+wasi-snapshot-preview1.sha256sum] = "ccf3ec651a847eb01de73ccad15eb7d99f80485de043efb2f370cd654f4ea44b"
+SRC_URI[wasip2-1.0.4+wasi-0.2.12.sha256sum] = "b67efb37e106e55ce722a510d6b5f9c17f083e5fc79afc2badeb12cc313d9487"
 SRC_URI[wasm-bindgen-0.2.114.sha256sum] = "6532f9a5c1ece3798cb1c2cfdba640b9b3ba884f5db45973a6f442510a87d38e"
 SRC_URI[wasm-bindgen-macro-0.2.114.sha256sum] = "18a2d50fcf105fb33bb15f00e7a77b772945a2ee45dcf454961fd843e74c18e6"
 SRC_URI[wasm-bindgen-macro-support-0.2.114.sha256sum] = "03ce4caeaac547cdf713d280eda22a730824dd11e6b8c3ca9e42247b25c631e3"
@@ -612,6 +619,7 @@ SRC_URI[windows_x86_64_msvc-0.52.6.sha256sum] = "589f6da84c646204747d1270a2a5661
 SRC_URI[windows_x86_64_msvc-0.53.1.sha256sum] = "d6bbff5f0aada427a1e5a6da5f1f98158182f26556f345ac9e04d36d0ebed650"
 SRC_URI[winnow-1.0.3.sha256sum] = "0592e1c9d151f854e6fd382574c3a0855250e1d9b2f99d9281c6e6391af352f1"
 SRC_URI[winx-0.36.4.sha256sum] = "3f3fd376f71958b862e7afb20cfe5a22830e1963462f3a17f49d82a6c1d1f42d"
+SRC_URI[wit-bindgen-0.57.1.sha256sum] = "1ebf944e87a7c253233ad6766e082e3cd714b5d03812acc24c318f549614536e"
 SRC_URI[writeable-0.6.2.sha256sum] = "9edde0db4769d2dc68579893f2306b26c6ecfbe0ef499b013d731b7b9247e0b9"
 SRC_URI[xattr-1.6.1.sha256sum] = "32e45ad4206f6d2479085147f02bc2ef834ac85886624a23575ae137c8aa8156"
 SRC_URI[yoke-0.8.1.sha256sum] = "72d6e5c6afb84d73944e5cedb052c4680d5657337201555f9f2a16b7406d4954"
diff --git a/meta/recipes-devtools/python/python3-uv-build_0.12.10.bb b/meta/recipes-devtools/python/python3-uv-build_0.12.11.bb
similarity index 92%
rename from meta/recipes-devtools/python/python3-uv-build_0.12.10.bb
rename to meta/recipes-devtools/python/python3-uv-build_0.12.11.bb
index 12cf5c7cc3..a42d0cbffc 100644
--- a/meta/recipes-devtools/python/python3-uv-build_0.12.10.bb
+++ b/meta/recipes-devtools/python/python3-uv-build_0.12.11.bb
@@ -11,7 +11,7 @@ LIC_FILES_CHKSUM = "file://LICENSE-APACHE;md5=86d3f3a95c324c9479bd8986968f4327 \
                     file://crates/uv-pep508/License-Apache;md5=e23fadd6ceef8c618fc1c65191d846fa \
                     file://crates/uv-pep508/License-BSD;md5=ef7a6027dc4c2389b9afad7e690274c7"
 
-SRC_URI[sha256sum] = "c83c0f1dd2c921091d1974f56d64221c010e173d9e6d52ec2a2582650c2d5197"
+SRC_URI[sha256sum] = "63055cac20756cf4e702608fde72021e6ee48db5021cfa2e1b398c876cf32834"
 
 require ${BPN}-crates.inc
 
-- 
2.47.1


--===============2686610472632495508==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: attachment; filename="buildhistory-diff.txt"

packages/x86-64-v3-poky-linux/python3-uv-build/python3-uv-build: FILELIST: directory renamed /usr/lib/python3.14/site-packages/uv_build-0.12.10.dist-info -> /usr/lib/python3.14/site-packages/uv_build-0.12.11.dist-info, directory renamed /usr/lib/python3.14/site-packages/uv_build-0.12.10.dist-info/licenses -> /usr/lib/python3.14/site-packages/uv_build-0.12.11.dist-info/licenses
Changes to packages/x86-64-v3-poky-linux/python3-uv-build (sysroot):
  /usr/lib/python3.14/site-packages/uv_build-0.12.10.dist-info moved to /usr/lib/python3.14/site-packages/uv_build-0.12.11.dist-info

--===============2686610472632495508==
Content-Type: application/octet-stream
MIME-Version: 1.0
Content-Transfer-Encoding: base64
Content-Disposition: attachment;
 filename="0001-python3-uv-build-upgrade-0.12.10-0.12.11.patch"

RnJvbSA0N2UyMjNiMzU5OTFmMmYyNDVmOWQ4NjVlNjZmYjE0NDkyNjRlMjY3IE1vbiBTZXAgMTcg
MDA6MDA6MDAgMjAwMQpGcm9tOiBVcGdyYWRlIEhlbHBlciA8YXVoQHlvY3RvcHJvamVjdC5vcmc+
CkRhdGU6IFdlZCwgOSBTZXAgMjAyNiAwNToyMzowMyArMDAwMApTdWJqZWN0OiBbUEFUQ0hdIHB5
dGhvbjMtdXYtYnVpbGQ6IHVwZ3JhZGUgMC4xMi4xMCAtPiAwLjEyLjExCgotLS0KIC4uLi9weXRo
b24vcHl0aG9uMy11di1idWlsZC1jcmF0ZXMuaW5jICAgICAgICB8IDUyICsrKysrKysrKysrLS0t
LS0tLS0KIC4uLjAuMTIuMTAuYmIgPT4gcHl0aG9uMy11di1idWlsZF8wLjEyLjExLmJifSB8ICAy
ICstCiAyIGZpbGVzIGNoYW5nZWQsIDMxIGluc2VydGlvbnMoKyksIDIzIGRlbGV0aW9ucygtKQog
cmVuYW1lIG1ldGEvcmVjaXBlcy1kZXZ0b29scy9weXRob24ve3B5dGhvbjMtdXYtYnVpbGRfMC4x
Mi4xMC5iYiA9PiBweXRob24zLXV2LWJ1aWxkXzAuMTIuMTEuYmJ9ICg5MiUpCgpkaWZmIC0tZ2l0
IGEvbWV0YS9yZWNpcGVzLWRldnRvb2xzL3B5dGhvbi9weXRob24zLXV2LWJ1aWxkLWNyYXRlcy5p
bmMgYi9tZXRhL3JlY2lwZXMtZGV2dG9vbHMvcHl0aG9uL3B5dGhvbjMtdXYtYnVpbGQtY3JhdGVz
LmluYwppbmRleCAxM2M0YWY1ZGJjLi4wMmU4ZjlhOGFiIDEwMDY0NAotLS0gYS9tZXRhL3JlY2lw
ZXMtZGV2dG9vbHMvcHl0aG9uL3B5dGhvbjMtdXYtYnVpbGQtY3JhdGVzLmluYworKysgYi9tZXRh
L3JlY2lwZXMtZGV2dG9vbHMvcHl0aG9uL3B5dGhvbjMtdXYtYnVpbGQtY3JhdGVzLmluYwpAQCAt
MjksMTYgKzI5LDE2IEBAIFNSQ19VUkkgKz0gIiBcCiAgICAgY3JhdGU6Ly9jcmF0ZXMuaW8vYm94
Y2FyLzAuMi4xNCBcCiAgICAgY3JhdGU6Ly9jcmF0ZXMuaW8vYnN0ci8xLjEyLjEgXAogICAgIGNy
YXRlOi8vY3JhdGVzLmlvL2J1bXBhbG8vMy4yMC4yIFwKLSAgICBjcmF0ZTovL2NyYXRlcy5pby9i
eXRlY2hlY2svMC44LjIgXAotICAgIGNyYXRlOi8vY3JhdGVzLmlvL2J5dGVjaGVja19kZXJpdmUv
MC44LjIgXAorICAgIGNyYXRlOi8vY3JhdGVzLmlvL2J5dGVjaGVjay8wLjguMyBcCisgICAgY3Jh
dGU6Ly9jcmF0ZXMuaW8vYnl0ZWNoZWNrX2Rlcml2ZS8wLjguMyBcCiAgICAgY3JhdGU6Ly9jcmF0
ZXMuaW8vYnl0ZXMvMS4xMi4xIFwKICAgICBjcmF0ZTovL2NyYXRlcy5pby9jYXAtcHJpbWl0aXZl
cy80LjAuMyBcCiAgICAgY3JhdGU6Ly9jcmF0ZXMuaW8vY2FwLXN0ZC80LjAuMyBcCiAgICAgY3Jh
dGU6Ly9jcmF0ZXMuaW8vY2MvMS4yLjU3IFwKICAgICBjcmF0ZTovL2NyYXRlcy5pby9jZmctaWYv
MS4wLjQgXAogICAgIGNyYXRlOi8vY3JhdGVzLmlvL2NoYXJzZXQvMC4xLjUgXAotICAgIGNyYXRl
Oi8vY3JhdGVzLmlvL2NsYXAvNC42LjUgXAotICAgIGNyYXRlOi8vY3JhdGVzLmlvL2NsYXBfYnVp
bGRlci80LjYuNSBcCisgICAgY3JhdGU6Ly9jcmF0ZXMuaW8vY2xhcC80LjYuNiBcCisgICAgY3Jh
dGU6Ly9jcmF0ZXMuaW8vY2xhcF9idWlsZGVyLzQuNi42IFwKICAgICBjcmF0ZTovL2NyYXRlcy5p
by9jbGFwX2Rlcml2ZS80LjYuNCBcCiAgICAgY3JhdGU6Ly9jcmF0ZXMuaW8vY2xhcF9sZXgvMS4x
LjAgXAogICAgIGNyYXRlOi8vY3JhdGVzLmlvL2NvbG9yY2hvaWNlLzEuMC41IFwKQEAgLTUxLDcg
KzUxLDcgQEAgU1JDX1VSSSArPSAiIFwKICAgICBjcmF0ZTovL2NyYXRlcy5pby9jcnlwdG8tY29t
bW9uLzAuMi4yIFwKICAgICBjcmF0ZTovL2NyYXRlcy5pby9jc3YvMS40LjAgXAogICAgIGNyYXRl
Oi8vY3JhdGVzLmlvL2Nzdi1jb3JlLzAuMS4xMyBcCi0gICAgY3JhdGU6Ly9jcmF0ZXMuaW8vZGF0
YS1lbmNvZGluZy8yLjExLjAgXAorICAgIGNyYXRlOi8vY3JhdGVzLmlvL2RhdGEtZW5jb2Rpbmcv
Mi4xMS4xIFwKICAgICBjcmF0ZTovL2NyYXRlcy5pby9kZWZtdC8xLjEuMCBcCiAgICAgY3JhdGU6
Ly9jcmF0ZXMuaW8vZGVmbXQtbWFjcm9zLzEuMS4wIFwKICAgICBjcmF0ZTovL2NyYXRlcy5pby9k
ZWZtdC1wYXJzZXIvMS4wLjAgXApAQCAtNjMsNyArNjMsNyBAQCBTUkNfVVJJICs9ICIgXAogICAg
IGNyYXRlOi8vY3JhdGVzLmlvL2VpdGhlci8xLjE3LjAgXAogICAgIGNyYXRlOi8vY3JhdGVzLmlv
L2VuY29kZV91bmljb2RlLzEuMC4wIFwKICAgICBjcmF0ZTovL2NyYXRlcy5pby9lbmNvZGluZ19y
cy8wLjguMzUgXAotICAgIGNyYXRlOi8vY3JhdGVzLmlvL2VuY29kaW5nX3JzX2lvLzAuMS43IFwK
KyAgICBjcmF0ZTovL2NyYXRlcy5pby9lbmNvZGluZ19yc19pby8wLjEuOCBcCiAgICAgY3JhdGU6
Ly9jcmF0ZXMuaW8vZW51bWZsYWdzMi8wLjcuMTIgXAogICAgIGNyYXRlOi8vY3JhdGVzLmlvL2Vu
dW1mbGFnczJfZGVyaXZlLzAuNy4xMiBcCiAgICAgY3JhdGU6Ly9jcmF0ZXMuaW8vZXF1aXZhbGVu
dC8xLjAuMiBcCkBAIC04OSw4ICs4OSw5IEBAIFNSQ19VUkkgKz0gIiBcCiAgICAgY3JhdGU6Ly9j
cmF0ZXMuaW8vZnV0dXJlcy10YXNrLzAuMy4zMyBcCiAgICAgY3JhdGU6Ly9jcmF0ZXMuaW8vZnV0
dXJlcy11dGlsLzAuMy4zMyBcCiAgICAgY3JhdGU6Ly9jcmF0ZXMuaW8vZ2VuZXJpYy1hcnJheS8w
LjE0LjcgXAorICAgIGNyYXRlOi8vY3JhdGVzLmlvL2dldHJhbmRvbS8wLjMuNCBcCiAgICAgY3Jh
dGU6Ly9jcmF0ZXMuaW8vZ2V0cmFuZG9tLzAuNC4zIFwKLSAgICBjcmF0ZTovL2NyYXRlcy5pby9n
bG9ic2V0LzAuNC4xOSBcCisgICAgY3JhdGU6Ly9jcmF0ZXMuaW8vZ2xvYnNldC8wLjQuMjAgXAog
ICAgIGNyYXRlOi8vY3JhdGVzLmlvL2dsb28tdGltZXJzLzAuMy4wIFwKICAgICBjcmF0ZTovL2Ny
YXRlcy5pby9oYXNoYnJvd24vMC4xNS41IFwKICAgICBjcmF0ZTovL2NyYXRlcy5pby9oYXNoYnJv
d24vMC4xNy4xIFwKQEAgLTE2Niw2ICsxNjcsNyBAQCBTUkNfVVJJICs9ICIgXAogICAgIGNyYXRl
Oi8vY3JhdGVzLmlvL3B0cl9tZXRhX2Rlcml2ZS8wLjMuMSBcCiAgICAgY3JhdGU6Ly9jcmF0ZXMu
aW8vcXVvdGUvMS4wLjQ3IFwKICAgICBjcmF0ZTovL2NyYXRlcy5pby9xdW90ZWRfcHJpbnRhYmxl
LzAuNS4xIFwKKyAgICBjcmF0ZTovL2NyYXRlcy5pby9yLWVmaS81LjMuMCBcCiAgICAgY3JhdGU6
Ly9jcmF0ZXMuaW8vci1lZmkvNi4wLjAgXAogICAgIGNyYXRlOi8vY3JhdGVzLmlvL3JhbmNvci8w
LjEuMSBcCiAgICAgY3JhdGU6Ly9jcmF0ZXMuaW8vcmVkb3hfc3lzY2FsbC8wLjUuMTUgXApAQCAt
MTczLDExICsxNzUsMTEgQEAgU1JDX1VSSSArPSAiIFwKICAgICBjcmF0ZTovL2NyYXRlcy5pby9y
ZWYtY2FzdC1pbXBsLzEuMC4yNiBcCiAgICAgY3JhdGU6Ly9jcmF0ZXMuaW8vcmVmbGluay1jb3B5
LzAuMS4zMCBcCiAgICAgY3JhdGU6Ly9jcmF0ZXMuaW8vcmVnZXgvMS4xMy4xIFwKLSAgICBjcmF0
ZTovL2NyYXRlcy5pby9yZWdleC1hdXRvbWF0YS8wLjQuMTYgXAorICAgIGNyYXRlOi8vY3JhdGVz
LmlvL3JlZ2V4LWF1dG9tYXRhLzAuNC4xOCBcCiAgICAgY3JhdGU6Ly9jcmF0ZXMuaW8vcmVnZXgt
c3ludGF4LzAuOC4xMSBcCiAgICAgY3JhdGU6Ly9jcmF0ZXMuaW8vcmVuZC8wLjUuMyBcCi0gICAg
Y3JhdGU6Ly9jcmF0ZXMuaW8vcmt5di8wLjguMTcgXAotICAgIGNyYXRlOi8vY3JhdGVzLmlvL3Jr
eXZfZGVyaXZlLzAuOC4xNyBcCisgICAgY3JhdGU6Ly9jcmF0ZXMuaW8vcmt5di8wLjguMTggXAor
ICAgIGNyYXRlOi8vY3JhdGVzLmlvL3JreXZfZGVyaXZlLzAuOC4xOCBcCiAgICAgY3JhdGU6Ly9j
cmF0ZXMuaW8vcnVzdGMtaGFzaC8yLjEuMyBcCiAgICAgY3JhdGU6Ly9jcmF0ZXMuaW8vcnVzdGl4
LzEuMS40IFwKICAgICBjcmF0ZTovL2NyYXRlcy5pby9ydXN0aXgtbGludXgtcHJvY2ZzLzAuMS4x
IFwKQEAgLTIwNyw3ICsyMDksNyBAQCBTUkNfVVJJICs9ICIgXAogICAgIGNyYXRlOi8vY3JhdGVz
LmlvL3NsYWIvMC40LjEyIFwKICAgICBjcmF0ZTovL2NyYXRlcy5pby9zbWFsbHZlYy8xLjE1LjIg
XAogICAgIGNyYXRlOi8vY3JhdGVzLmlvL3NtYXdrLzAuMy4yIFwKLSAgICBjcmF0ZTovL2NyYXRl
cy5pby9zcGR4LzAuMTMuNCBcCisgICAgY3JhdGU6Ly9jcmF0ZXMuaW8vc3BkeC8wLjEzLjUgXAog
ICAgIGNyYXRlOi8vY3JhdGVzLmlvL3N0YWJsZV9kZXJlZl90cmFpdC8xLjIuMSBcCiAgICAgY3Jh
dGU6Ly9jcmF0ZXMuaW8vc3RyaXAtYW5zaS1lc2NhcGVzLzAuMi4xIFwKICAgICBjcmF0ZTovL2Ny
YXRlcy5pby9zdHJzaW0vMC4xMS4xIFwKQEAgLTI1OCw2ICsyNjAsNyBAQCBTUkNfVVJJICs9ICIg
XAogICAgIGNyYXRlOi8vY3JhdGVzLmlvL3Z0ZS8wLjE0LjEgXAogICAgIGNyYXRlOi8vY3JhdGVz
LmlvL3dhbGtkaXIvMi41LjAgXAogICAgIGNyYXRlOi8vY3JhdGVzLmlvL3dhc2kvMC4xMS4xK3dh
c2ktc25hcHNob3QtcHJldmlldzEgXAorICAgIGNyYXRlOi8vY3JhdGVzLmlvL3dhc2lwMi8xLjAu
NCt3YXNpLTAuMi4xMiBcCiAgICAgY3JhdGU6Ly9jcmF0ZXMuaW8vd2FzbS1iaW5kZ2VuLzAuMi4x
MTQgXAogICAgIGNyYXRlOi8vY3JhdGVzLmlvL3dhc20tYmluZGdlbi1tYWNyby8wLjIuMTE0IFwK
ICAgICBjcmF0ZTovL2NyYXRlcy5pby93YXNtLWJpbmRnZW4tbWFjcm8tc3VwcG9ydC8wLjIuMTE0
IFwKQEAgLTI5OCw2ICszMDEsNyBAQCBTUkNfVVJJICs9ICIgXAogICAgIGNyYXRlOi8vY3JhdGVz
LmlvL3dpbmRvd3NfeDg2XzY0X21zdmMvMC41My4xIFwKICAgICBjcmF0ZTovL2NyYXRlcy5pby93
aW5ub3cvMS4wLjMgXAogICAgIGNyYXRlOi8vY3JhdGVzLmlvL3dpbngvMC4zNi40IFwKKyAgICBj
cmF0ZTovL2NyYXRlcy5pby93aXQtYmluZGdlbi8wLjU3LjEgXAogICAgIGNyYXRlOi8vY3JhdGVz
LmlvL3dyaXRlYWJsZS8wLjYuMiBcCiAgICAgY3JhdGU6Ly9jcmF0ZXMuaW8veGF0dHIvMS42LjEg
XAogICAgIGNyYXRlOi8vY3JhdGVzLmlvL3lva2UvMC44LjEgXApAQCAtMzQzLDE2ICszNDcsMTYg
QEAgU1JDX1VSSVtibG9jay1idWZmZXItMC4xMi4xLnNoYTI1NnN1bV0gPSAiZDJmNmM3ZGJlOTVh
NmVkNjdhZDlmMThlNTdkYWY5M2EyZjAzNGMKIFNSQ19VUklbYm94Y2FyLTAuMi4xNC5zaGEyNTZz
dW1dID0gIjM2ZjY0YmVhZTQwYTg0ZGExYjRiMjZmZjI3NjFhNWI4OTVjMTJhZGM0MWRjMjVhYWVl
MWM0ZjJiYmZlOTdhNmUiCiBTUkNfVVJJW2JzdHItMS4xMi4xLnNoYTI1NnN1bV0gPSAiNjMwNDRl
MWFlOGU2OWYzYjVhOTJjNzM2Y2E2MjY5YjhkMTJmYTdlZmUzOWJmMzRkZGIwNmQxMDJjZjBlMmNh
YiIKIFNSQ19VUklbYnVtcGFsby0zLjIwLjIuc2hhMjU2c3VtXSA9ICI1ZDIwNzg5ODY4ZjRiMDFi
MmYyY2FlYzlmNWM0ZTAyMTNiNDFlM2U1NzAyYTUwMTU3ZDY5OWFlMzFjZWQyZmNiIgotU1JDX1VS
SVtieXRlY2hlY2stMC44LjIuc2hhMjU2c3VtXSA9ICIwY2FhMzNhMmMwZWRjYTA0MTlkMTVhYzcy
M2RmZjAzZjE5NTZmNzk3ODMyOWIxZTNiNWZkYWFhZWQ5ZDNjYThiIgotU1JDX1VSSVtieXRlY2hl
Y2tfZGVyaXZlLTAuOC4yLnNoYTI1NnN1bV0gPSAiODkzODVlODJiNWQxODIxZDIyMTllMGIwOTVl
ZmEyY2MxZjI0NmNiZjk5MDgwZjNiZTQ2YTFhODVjMGQzOTJkOSIKK1NSQ19VUklbYnl0ZWNoZWNr
LTAuOC4zLnNoYTI1NnN1bV0gPSAiMjYzMzNlZWFjNzU0ZjBhZDhhNmJjZDBlYjBhYzAxMjE1NjMw
MmU0ZTE2Yjg1MmI3MmVlMzk5YWVhNGYxMmMyOSIKK1NSQ19VUklbYnl0ZWNoZWNrX2Rlcml2ZS0w
LjguMy5zaGEyNTZzdW1dID0gIjQ2ZDA3OTE4Y2FhOWVlYWFmMDZiNzg3MzkyNWM1M2E2MWRhYWMx
NzM1MzliNGY3NzE1MDkwNzQ1ZTQ0ZTRlNjkiCiBTUkNfVVJJW2J5dGVzLTEuMTIuMS5zaGEyNTZz
dW1dID0gImZjNjUyYTQ4YzM1MmFlZjNlYTNhZWQzMjA4MDUwMWNmM2VmNmVkNWRhNzg2MDJhMDIw
Yzk5MTc3NWIwYWZmMDQiCiBTUkNfVVJJW2NhcC1wcmltaXRpdmVzLTQuMC4zLnNoYTI1NnN1bV0g
PSAiOGI1Zjc0NzI5ZmQyZjQ0NzAxZDFhOGViNDdlOTA2Y2RiM2NjZDllYzBmMDJiYWFkODVhNzQ0
Yjc5MTk0MGIxOCIKIFNSQ19VUklbY2FwLXN0ZC00LjAuMy5zaGEyNTZzdW1dID0gImMxZWM3OGUy
NDJjZmEyY2ZlMjc2ODA3YWMyZWNjMDAzMTVhNmM5Nzc4Njk3NzQxNGJjZDFjMzk2M2I2YzkxYjgi
CiBTUkNfVVJJW2NjLTEuMi41Ny5zaGEyNTZzdW1dID0gIjdhMGRkMWNhMzg0OTMyZmYzNjQxYzg3
MThhMDI3NjlmMTY5OGU3NTYzZGM2OTc0ZmZkMDMzNDYxMTYzMTA0MjMiCiBTUkNfVVJJW2NmZy1p
Zi0xLjAuNC5zaGEyNTZzdW1dID0gIjkzMzBmOGIyZmYxM2YzNDU0MGI0NGU5NDZlZjM1MTExODI1
NzI3YjM4ZDMzMjg2ZWY5ODYxNDI2MTUxMjE4MDEiCiBTUkNfVVJJW2NoYXJzZXQtMC4xLjUuc2hh
MjU2c3VtXSA9ICJmMWY5MjdiMDdjNzRiYTg0YzdlNWZlNGRiMmJhZWIzZTk5NmFiMjY4ODk5MmUz
OWFjNjhjZTMyMjBhNjc3YzdlIgotU1JDX1VSSVtjbGFwLTQuNi41LnNoYTI1NnN1bV0gPSAiMzAx
YjU2NjU4NTk4ZTQ4ZjM2NDg2NDdhYzZmYzg4N2JlN2U3MTA4ZWRkZmE0ZTliNjNmY2YzZWM1OGMw
Y2FkZiIKLVNSQ19VUklbY2xhcF9idWlsZGVyLTQuNi41LnNoYTI1NnN1bV0gPSAiOTRhNjU0MDNk
MWExYmQyOGY3ZGM2OGViODUwNmU4ODc0ODA4ZWU1ZWVjYjU5Mjk4ZGU1ODhlMmUxNDA3YTA3OCIK
K1NSQ19VUklbY2xhcC00LjYuNi5zaGEyNTZzdW1dID0gIjQ3M2M3ZTA3ZjQwOWE4ZDc3MjE2MTcy
NGFhOGRiNmE3NjVhMjUzMmE3MGY5NjY3ZWViN2I0OWQzZDAyZmJkY2EiCitTUkNfVVJJW2NsYXBf
YnVpbGRlci00LjYuNi5zaGEyNTZzdW1dID0gIjdiNDhmZWE1YTg4ZTlhZTcyOGEyZGNiZWRiZmMw
ZTczMGY3ZDYwZGE0MmUxY2IwNDlhODNjOWZiOGI3ODk4ODkiCiBTUkNfVVJJW2NsYXBfZGVyaXZl
LTQuNi40LnNoYTI1NnN1bV0gPSAiZDAxMmQyYjlkNjVhY2E3ZjE4ZjRkOTg3OGEwNDViYzE3ODk5
YmJhOTUxNTYxYmE1ZWMzYzJiYTFlZWQ5YTA2MSIKIFNSQ19VUklbY2xhcF9sZXgtMS4xLjAuc2hh
MjU2c3VtXSA9ICJjOGQ0YTNiYjhiMWUwYzEwNTA0OTlkMTgxNWY1YWIxNmQwNGYwOTU5YjIzMzA4
NWZiMzE2NTNmYmZjOWQ5OGY5IgogU1JDX1VSSVtjb2xvcmNob2ljZS0xLjAuNS5zaGEyNTZzdW1d
ID0gIjFkMDc1NTBjOTAzNmJmMmFlMGM2ODRjNDI5N2Q1MDNmODM4Mjg3YzgzYzUzNjg2ZDA1Mzcw
ZDBlMTM5YWU1NzAiCkBAIC0zNjUsNyArMzY5LDcgQEAgU1JDX1VSSVtjcnlwdG8tY29tbW9uLTAu
MS43LnNoYTI1NnN1bV0gPSAiNzhjODI5MjA1NWQxYzFkZjBjY2U1ZDE4MDM5M2RjOGNjZTBhYmUK
IFNSQ19VUklbY3J5cHRvLWNvbW1vbi0wLjIuMi5zaGEyNTZzdW1dID0gImNlNmU0Yzk2MWQ2Y2Q2
YzlhODZkYjQxODM4NzQyNWU4YmRlYWYwNWIzYzhiYzE0MTFlNmRjYTRjMjUyZjE0NTMiCiBTUkNf
VVJJW2Nzdi0xLjQuMC5zaGEyNTZzdW1dID0gIjUyY2Q5ZDY4Y2Y3ZWZjNmRkZmFhZWU0MmU3Mjg4
ZDNhOTlkNjEzZDRiNTBmNzZjZTk4MjdhZTBjNmUxNGY5MzgiCiBTUkNfVVJJW2Nzdi1jb3JlLTAu
MS4xMy5zaGEyNTZzdW1dID0gIjcwNGEzYzI2OTk2YTgwNDcxMTg5MjY1ODE0ZGJjMmMyNTc1OThi
OTZiOGE3ZmVhZTJkMzFhY2U2NDZiYjk3ODIiCi1TUkNfVVJJW2RhdGEtZW5jb2RpbmctMi4xMS4w
LnNoYTI1NnN1bV0gPSAiYTRhZTVmMTVkZGEzYzcwOGMwYWRlODRiZmVlMzFjY2FiNDRhM2RhNGY4
ODAxNWVkMjJmNjM3MzJhYmUzMDBjOCIKK1NSQ19VUklbZGF0YS1lbmNvZGluZy0yLjExLjEuc2hh
MjU2c3VtXSA9ICI0NTgzYTQ1NTFkZjQ2ZTI3OTJmODJjZWVhYzQ1ZTg1MGQyZTJkNWRlYmJhMGI5
MWYxMDIzODVjZGE1YjExZjA2IgogU1JDX1VSSVtkZWZtdC0xLjEuMC5zaGEyNTZzdW1dID0gImE2
ZTUyNDUwNjQ5MGExOTUzZDIzN2NiODdiMWNmYzFlNDZmODhjMThmMTBhMjJkZmUwZjUwN2RjNmJm
YzdmN2YiCiBTUkNfVVJJW2RlZm10LW1hY3Jvcy0xLjEuMC5zaGEyNTZzdW1dID0gImYwYTI3Nzcw
ZTljOGY3MTlhNzlkOGI2MzgyODFmNGQ4MjhmNzdkOGZkNjFlMGJkOTQ0NTFiOWI4NWU1NzZhMGIi
CiBTUkNfVVJJW2RlZm10LXBhcnNlci0xLjAuMC5zaGEyNTZzdW1dID0gIjEwZDYwMzM0YjNiMmU3
YzlkOTFlZjgxNTBhYmZiNmZhNGMxYzM5ZWJiY2Y0YTgxYzJlMzQ2YWFkOTM5ZmVlM2UiCkBAIC0z
NzcsNyArMzgxLDcgQEAgU1JDX1VSSVtkeW4tY2xvbmUtMS4wLjIwLnNoYTI1NnN1bV0gPSAiZDA4
ODFlYTE4MWIxZGY3M2ZmNzdmZmFhZjljNzU0NGVjYzExZTgyZmIKIFNSQ19VUklbZWl0aGVyLTEu
MTcuMC5zaGEyNTZzdW1dID0gIjllNWU4ZjZjMTVhMjRiOWEzZWU1ZWZlYzgwOWNjZDAwNmQzYjMw
ZThiM2JiNjNjMzlhZjczN2M3Zjg3ZGFhMWQiCiBTUkNfVVJJW2VuY29kZV91bmljb2RlLTEuMC4w
LnNoYTI1NnN1bV0gPSAiMzRhYTczNjQ2ZmZiMDA2YjhmNTE0N2YzZGMxODJiZDRiY2IxOTAyMjdj
ZTg2MWZjNGE0ODQ0YmY4ZTNjYjJjMCIKIFNSQ19VUklbZW5jb2RpbmdfcnMtMC44LjM1LnNoYTI1
NnN1bV0gPSAiNzUwMzBmM2M0ZjQ1ZGFmZDc1ODZkZDY3ODA5NjVhOGM3ZThlMjg1YTVlY2I4Njcx
M2U2M2E3OWM1YjI3NjZmMyIKLVNSQ19VUklbZW5jb2RpbmdfcnNfaW8tMC4xLjcuc2hhMjU2c3Vt
XSA9ICIxY2MzYzU2NTFmYjYyYWI4YWEzMTAzOTk4ZGFkZTU3ZWZkZDAyODU0NGJkMzAwNTE2YmFh
MzE4NDBjMjUyYTgzIgorU1JDX1VSSVtlbmNvZGluZ19yc19pby0wLjEuOC5zaGEyNTZzdW1dID0g
ImZiYTNmZTg0NzA0NWVjZmY3OTRiOWMxMzgyOTNhODBkYjkxNDY3OGM0NTNhZDYzZmJmMGM2YTll
YjZlMDBiMjIiCiBTUkNfVVJJW2VudW1mbGFnczItMC43LjEyLnNoYTI1NnN1bV0gPSAiMTAyN2Y3
NjgwYzg1M2UwNTZlYmNlYzY4MzYxNWZiNmZiYmMwN2RiYWExM2I0ZDVkOTQ0MmIxNDZkZWQ0ZWNl
ZiIKIFNSQ19VUklbZW51bWZsYWdzMl9kZXJpdmUtMC43LjEyLnNoYTI1NnN1bV0gPSAiNjdjNzhh
NGQ4ZmRmOTk1M2E1YzlkNDU4ZjllZmU5NDBmZDk3YTBjYWIwOTQxYzA3NWE4MTNhYzU5NDczMzgy
NyIKIFNSQ19VUklbZXF1aXZhbGVudC0xLjAuMi5zaGEyNTZzdW1dID0gIjg3N2E0YWNlODcxM2Iw
YmNmMmE0ZTdlZWM4MjUyOWMwMjlmMWQwNjE5ODg2ZDE4MTQ1ZmVhOTZjM2ZmZTVjMGYiCkBAIC00
MDMsOCArNDA3LDkgQEAgU1JDX1VSSVtmdXR1cmVzLXNpbmstMC4zLjMzLnNoYTI1NnN1bV0gPSAi
ZTM0NDE4YWM0OTlkNjMwNWMyZmI1YWQwZWQyZjZhYzk5OGM1ZjgKIFNSQ19VUklbZnV0dXJlcy10
YXNrLTAuMy4zMy5zaGEyNTZzdW1dID0gImIyMzFlZDI4ODMxZWZiNGE2MWEwODU4MGM0YmMyMzNl
YzU2YmMwMDlmNGNkOGY1MmRhMmMzY2I5N2RmMGMxMDkiCiBTUkNfVVJJW2Z1dHVyZXMtdXRpbC0w
LjMuMzMuc2hhMjU2c3VtXSA9ICJhNzdhOTBhMjU2ZmNlMzRkYTY2NDE1MjcxZTMwZjk0ZWU5MWM1
N2IwNGI4YTJjMDQyZDljZjMyMjAxNzlkZWFhIgogU1JDX1VSSVtnZW5lcmljLWFycmF5LTAuMTQu
Ny5zaGEyNTZzdW1dID0gIjg1NjQ5Y2E1MWZkNzIyNzJkNzgyMWFkYWYyNzRhZDkxYzI4ODI3Nzcx
M2Q5YzE4ODIwZDg0OTlhN2ZmNjllOWEiCitTUkNfVVJJW2dldHJhbmRvbS0wLjMuNC5zaGEyNTZz
dW1dID0gIjg5OWRlZjVjMzdjNGZkN2IyNjY0NjQ4YzI4MTIwZWNlYzEzOGU0ZDM5NWI0NTllNWNh
MzRmOWNjZTJkZDc3ZmQiCiBTUkNfVVJJW2dldHJhbmRvbS0wLjQuMy5zaGEyNTZzdW1dID0gIjMw
MGU4ODNkNzU2YjJlNGVjOTRlMDI3OTFmMzliMDRiNTIyMjc2MTM4ODUyY2ZjNDFkOWZiN2U5MDQx
MDYwOTkiCi1TUkNfVVJJW2dsb2JzZXQtMC40LjE5LnNoYTI1NnN1bV0gPSAiZTQ3ZDM3ZDJhZTQ0
NjQyNTQ4ODRiNjBhYjcwNzFiZTJiODc2YTljMzViNjk2YmQwMThkZGNjNzY4NDczMDljZCIKK1NS
Q19VUklbZ2xvYnNldC0wLjQuMjAuc2hhMjU2c3VtXSA9ICIwN2MzNGE5NDEwNDY1YjQ1YmQ5Nzg3
NDQzYmM3MzcwZjM3NzM1YmFkMDRiMGYwY2Q1N2ZmMWEzMTg2Yzk4OTg4IgogU1JDX1VSSVtnbG9v
LXRpbWVycy0wLjMuMC5zaGEyNTZzdW1dID0gImJiYjE0M2NmOTYwOTk4MDIwMzNlMGQ0ZjQ5NjNi
MTlmZDJlMGI3MjhiY2YwNzZjZDljZjdmNjYzNGYwOTI5OTQiCiBTUkNfVVJJW2hhc2hicm93bi0w
LjE1LjUuc2hhMjU2c3VtXSA9ICI5MjI5Y2ZlNTNkZmQ2OWYwNjA5YTQ5ZjY1NDYxYmQ5MzAwMWVh
MWVmODg5Y2Q1NTI5ZGQxNzY1OTNmNTMzOGExIgogU1JDX1VSSVtoYXNoYnJvd24tMC4xNy4xLnNo
YTI1NnN1bV0gPSAiZWQ1OTA5YjZlODlhMmRiNDQ1NmU1NGNkNWY2NzM3OTFkN2VjYTY3MzIyMDJi
YmYyYTljYzUwNGZlMmY5Yjg0YSIKQEAgLTQ4MCw2ICs0ODUsNyBAQCBTUkNfVVJJW3B0cl9tZXRh
LTAuMy4xLnNoYTI1NnN1bV0gPSAiMGI5YTBjZjk1YTExOTZhZjYxZDRmMWNiZGFiOTY3MTc5NTE2
ZDlhNGE0MwogU1JDX1VSSVtwdHJfbWV0YV9kZXJpdmUtMC4zLjEuc2hhMjU2c3VtXSA9ICI3MzQ3
ODY3ZDBhN2UxMjA4ZDkzYjQ2NzY3YmU4M2UyYjhmOTc4YzNkYWQzNWY3NzVhYzhkODg0NzU1MWQ2
ZmUxIgogU1JDX1VSSVtxdW90ZS0xLjAuNDcuc2hhMjU2c3VtXSA9ICIxZmJmNGRiMTQyYTQ3M2E4
ZDgwYzI2YmJmMTg0NTRlZDQ1OGJmOGQyNmM4MjE5YzMzMWRhZWNmZGJkMDc5MDAxIgogU1JDX1VS
SVtxdW90ZWRfcHJpbnRhYmxlLTAuNS4xLnNoYTI1NnN1bV0gPSAiNjQwYzliZDg0OTdiMDI0NjVh
ZWVmNTM3NTE0NGMyNjA2MmUwZGNkNTkzOWRmY2JiMGY1ZGI3NmNiOGMxN2M3MyIKK1NSQ19VUklb
ci1lZmktNS4zLjAuc2hhMjU2c3VtXSA9ICI2OWNkYjM0YzE1OGNlYjI4OGRmMTFlMThiNGJkMzlk
ZTk5NGY2NjU3ZDgzODQ3YmRmZmRiZDdmMzQ2NzU0YjBmIgogU1JDX1VSSVtyLWVmaS02LjAuMC5z
aGEyNTZzdW1dID0gImY4ZGNjOWM3ZDUyYTgxMTY5N2QyMTUxYzcwMWUwZDA4OTU2ZjkyYjBlMjQx
MzZjZjRjZjI3YjU3YTZhMGQ5YmYiCiBTUkNfVVJJW3JhbmNvci0wLjEuMS5zaGEyNTZzdW1dID0g
ImEwNjNlYTcyMzgxNTI3YzJhMDU2MWRhOWM4MDAwMGVmODIyYmRkN2MzMjQxYjFjYzFiMTIxMDBl
M2RmMDgxZWUiCiBTUkNfVVJJW3JlZG94X3N5c2NhbGwtMC41LjE1LnNoYTI1NnN1bV0gPSAiN2U4
YWYwZGRlMDk0MDA2MDExZTZhNzQwZDQ4NzkzMTk0Mzk0ODk4MTNiZDBiY2RjN2Q4MjFiZWFlZWZm
NDhlYyIKQEAgLTQ4NywxMSArNDkzLDExIEBAIFNSQ19VUklbcmVmLWNhc3QtMS4wLjI2LnNoYTI1
NnN1bV0gPSAiMjE2ZThmNzczZDc5MjNiY2JhOWNlYjg2YTg2YzkzY2FiYjM5MDNhMTE4CiBTUkNf
VVJJW3JlZi1jYXN0LWltcGwtMS4wLjI2LnNoYTI1NnN1bV0gPSAiMmM5MjgzNjg1ZmVlYzdkNjlh
Zjc1ZmIwZTg1OGQ1ZTczNzhmMzNmZTRmYzY5OTM4M2IyOTE2YWI5MjczZTAzYyIKIFNSQ19VUklb
cmVmbGluay1jb3B5LTAuMS4zMC5zaGEyNTZzdW1dID0gImQ5ZGQ3YWI0YWYwMzYzZDVjY2ZkMjgz
OGQ3ODJhMjgxOTZjZjMyYTVjYzJlNGZlM2M1ZGM4M2YyYmU1ODhiOGIiCiBTUkNfVVJJW3JlZ2V4
LTEuMTMuMS5zaGEyNTZzdW1dID0gImYwMjAyMzdiNmM4ZWVkOTNkYjJlMmNiNTNjMDBjNjBhOGUx
YmM3M2RhN2QwNzMxOTlhMTE4MDQwMTQ1MDIxOGQiCi1TUkNfVVJJW3JlZ2V4LWF1dG9tYXRhLTAu
NC4xNi5zaGEyNTZzdW1dID0gIjhmY2ZkYjM2YmRhMGM4ODBjNTkzMWNkYzdhMmJjZGM4YmE0NTU2
ODQ3YjlkOTEyYmNhNzBiYzk0NzA4NzExYWQiCitTUkNfVVJJW3JlZ2V4LWF1dG9tYXRhLTAuNC4x
OC5zaGEyNTZzdW1dID0gImFkODU1M2I5YjI2NDEzMjUxY2JmMzBlNjIwNTk1YzdhNDFiMzg4N2Yw
M2RhMDQ1NzljMGU2YjBkNmEwNmI0YjIiCiBTUkNfVVJJW3JlZ2V4LXN5bnRheC0wLjguMTEuc2hh
MjU2c3VtXSA9ICJkNmY2ZmY5YTM3ODQ4NWIyOThhNTI4NjY1NmRhNjY1YmE3NDQxM2QzNmRiMDk3
OTYzMzI3NWQyZTcwODE0NWQ0IgogU1JDX1VSSVtyZW5kLTAuNS4zLnNoYTI1NnN1bV0gPSAiY2Fk
YWRlZjMxN2MyZjIwNzU1YTY0ZDdmZGM0OGY5ZTcxNzhlZTZiMGUxZjdmY2UzM2ZhNjBmMWQ2OGEy
NzZlNiIKLVNSQ19VUklbcmt5di0wLjguMTcuc2hhMjU2c3VtXSA9ICI4MTVjYzhhMzcxNTlhNDYz
MDY0ODI1MjQ2Y2FkYjA3OTYxZTI1Y2Q5ODg1OTA4NjA2ZjZkMDhhOThkOGY4ODc0IgotU1JDX1VS
SVtya3l2X2Rlcml2ZS0wLjguMTcuc2hhMjU2c3VtXSA9ICJjMGVkMWE3OGExYjE5ZDE4NGIwZGFh
NjI5ZGQ5YTAyNDU3MzE3M2VjN2Q0ODViMjg3Y2IzNjlmYjM2MDdjYzFjIgorU1JDX1VSSVtya3l2
LTAuOC4xOC5zaGEyNTZzdW1dID0gImQ5Nzc2MDkzYjdjYTE3MDQ1NGFiMTQwNjk1NGY3YjdkOTdh
NTdjNTFkYzZjMDY0Mjk1N2ZiMmVmMjVjMmQzOTkiCitTUkNfVVJJW3JreXZfZGVyaXZlLTAuOC4x
OC5zaGEyNTZzdW1dID0gIjFjMjVlZjYwNGFjN2RkODM5ZDQ0ZDY0NjQ4OTUyZWEyM2M5Nzg2NmYx
MjRmZjY3MWIwZWQyY2YzYWQ5YmIwNmUiCiBTUkNfVVJJW3J1c3RjLWhhc2gtMi4xLjMuc2hhMjU2
c3VtXSA9ICI2YjFlN2Y5YTQyODU3MWJlMmRjNWJjMDUwNWMxM2ZiNmJmOTM2ODIyYjg5NGVjODdh
YmY4YTA4YTRlNTE3NDJkIgogU1JDX1VSSVtydXN0aXgtMS4xLjQuc2hhMjU2c3VtXSA9ICJiNmZl
NDU2NWI5NTE4YjgzZWY0ZjkxYmI0N2NlMjk2MjBjYTgyOGJkMzJjYjdlNDA4ZjAwNjJlOTkzMGJh
MTkwIgogU1JDX1VSSVtydXN0aXgtbGludXgtcHJvY2ZzLTAuMS4xLnNoYTI1NnN1bV0gPSAiMmZj
ODRiZjdlOWFhMTZjNGYyYzc1OGYyNzQxMmRjOTg0MTM0MWUxNmFhNjgyZDljN2FjMzA4ZmUzZWUx
MjA1NiIKQEAgLTUyMSw3ICs1MjcsNyBAQCBTUkNfVVJJW3NpbWlsYXItMi43LjAuc2hhMjU2c3Vt
XSA9ICJiYmJiNWQ5NjU5MTQxNjQ2YWU2NDdiNDJmZTA5NGRhZjZjNjE5MmQxNjIwOAogU1JDX1VS
SVtzbGFiLTAuNC4xMi5zaGEyNTZzdW1dID0gIjBjNzkwZGUyMzEyNGY5YWI0NDU0NGQ3YWMwNWQ2
MDQ0MGFkYzU4NjQ3OWNlNTAxYzFkNmQ3ZGEzY2Q4YzljZjUiCiBTUkNfVVJJW3NtYWxsdmVjLTEu
MTUuMi5zaGEyNTZzdW1dID0gIjhlZDZhNjNmMDJjODUzOWM5MWE4Njg1YTg2ZjQwOTk2NjFiYTNk
YTAxNzkzMmY2ZWJiZWE2ZGUzZjBmYTdjOTAiCiBTUkNfVVJJW3NtYXdrLTAuMy4yLnNoYTI1NnN1
bV0gPSAiYjdjMzg4YzFiNWU5Mzc1NmQwYzc0MDk2NWM0MWU4ODIyZjg2NjYyMWQ0MWFjYmRmNjMz
NmE2YTE2OGY4ODQwYyIKLVNSQ19VUklbc3BkeC0wLjEzLjQuc2hhMjU2c3VtXSA9ICJhOGRhNTkz
ZTMwYmViNzkwZmM5NDI0NTAyZWI4OTgzMjBiNDRlNWViMzAzNjdkYmRhMWMxZWRkZThlMmYzMmQ3
IgorU1JDX1VSSVtzcGR4LTAuMTMuNS5zaGEyNTZzdW1dID0gIjA4MTY3MGMyMzNkZmJlZDU1Njkw
Y2MwY2QzODQyNGUwZTI0YWMxYjI2NzNkMGI0MDhiM2Y3YjY4NDczOGRmYTkiCiBTUkNfVVJJW3N0
YWJsZV9kZXJlZl90cmFpdC0xLjIuMS5zaGEyNTZzdW1dID0gIjZjZTJiZThkYzI1NDU1ZTFmOTFk
ZjcxYmZhMTJhZDM3ZDdhZjEwOTJhZTczNmYzYTZjZDBlMzdiYzc4MTA1OTYiCiBTUkNfVVJJW3N0
cmlwLWFuc2ktZXNjYXBlcy0wLjIuMS5zaGEyNTZzdW1dID0gIjJhOGY4MDM4ZTdlNzk2OWFiYjNm
MWI3YzJhODExMjI1ZTkyOTZkYTIwODUzOWUwZjc5YzUyNTFkNmNhYzAwMjUiCiBTUkNfVVJJW3N0
cnNpbS0wLjExLjEuc2hhMjU2c3VtXSA9ICI3ZGE4YjU3MzY4NDVkOWYyZmNiODM3ZWE1ZDllMjYy
ODU2NGIzYjA0M2E3MDk0OGEzZjBiNzc4ODM4YzVmYjRmIgpAQCAtNTcyLDYgKzU3OCw3IEBAIFNS
Q19VUklbdmVyc2lvbl9jaGVjay0wLjkuNS5zaGEyNTZzdW1dID0gIjBiOTI4ZjMzZDk3NWZjNmFk
OWY4NmM4ZjI4Mzg1M2FkMjZiZGQ1CiBTUkNfVVJJW3Z0ZS0wLjE0LjEuc2hhMjU2c3VtXSA9ICIy
MzFmZGNkN2VmMzAzN2U4MzMwZDhlMTdlNjEwMTFhMmMyNDQxMjZhY2MwYTk4MmY0MDQwYWMzZjlm
MGJjMDc3IgogU1JDX1VSSVt3YWxrZGlyLTIuNS4wLnNoYTI1NnN1bV0gPSAiMjk3OTA5NDY0MDRm
OTFkOWM1ZDA2Zjk4NzRlZmRkZWExZGMwNmM1ZWZlOTQ1NDFhN2Q2ODYzMTA4ZTNhNWU0YiIKIFNS
Q19VUklbd2FzaS0wLjExLjErd2FzaS1zbmFwc2hvdC1wcmV2aWV3MS5zaGEyNTZzdW1dID0gImNj
ZjNlYzY1MWE4NDdlYjAxZGU3M2NjYWQxNWViN2Q5OWY4MDQ4NWRlMDQzZWZiMmYzNzBjZDY1NGY0
ZWE0NGIiCitTUkNfVVJJW3dhc2lwMi0xLjAuNCt3YXNpLTAuMi4xMi5zaGEyNTZzdW1dID0gImI2
N2VmYjM3ZTEwNmU1NWNlNzIyYTUxMGQ2YjVmOWMxN2YwODNlNWZjNzlhZmMyYmFkZWIxMmNjMzEz
ZDk0ODciCiBTUkNfVVJJW3dhc20tYmluZGdlbi0wLjIuMTE0LnNoYTI1NnN1bV0gPSAiNjUzMmY5
YTVjMWVjZTM3OThjYjFjMmNmZGJhNjQwYjliM2JhODg0ZjVkYjQ1OTczYTZmNDQyNTEwYTg3ZDM4
ZSIKIFNSQ19VUklbd2FzbS1iaW5kZ2VuLW1hY3JvLTAuMi4xMTQuc2hhMjU2c3VtXSA9ICIxOGEy
ZDUwZmNmMTA1ZmIzM2JiMTVmMDBlN2E3N2I3NzI5NDVhMmVlNDVkY2Y0NTQ5NjFmZDg0M2U3NGMx
OGU2IgogU1JDX1VSSVt3YXNtLWJpbmRnZW4tbWFjcm8tc3VwcG9ydC0wLjIuMTE0LnNoYTI1NnN1
bV0gPSAiMDNjZTRjYWVhYWM1NDdjZGY3MTNkMjgwZWRhMjJhNzMwODI0ZGQxMWU2YjhjM2NhOWU0
MjI0N2IyNWM2MzFlMyIKQEAgLTYxMiw2ICs2MTksNyBAQCBTUkNfVVJJW3dpbmRvd3NfeDg2XzY0
X21zdmMtMC41Mi42LnNoYTI1NnN1bV0gPSAiNTg5ZjZkYTg0YzY0NjIwNDc0N2QxMjcwYTJhNTY2
MQogU1JDX1VSSVt3aW5kb3dzX3g4Nl82NF9tc3ZjLTAuNTMuMS5zaGEyNTZzdW1dID0gImQ2YmJm
ZjVmMGFhZGE0MjdhMWU1YTZkYTVmMWY5ODE1ODE4MmYyNjU1NmYzNDVhYzllMDRkMzZkMGViZWQ2
NTAiCiBTUkNfVVJJW3dpbm5vdy0xLjAuMy5zaGEyNTZzdW1dID0gIjA1OTJlMWM5ZDE1MWY4NTRl
NmZkMzgyNTc0YzNhMDg1NTI1MGUxZDliMmY5OWQ5MjgxYzZlNjM5MWFmMzUyZjEiCiBTUkNfVVJJ
W3dpbngtMC4zNi40LnNoYTI1NnN1bV0gPSAiM2YzZmQzNzZmNzE5NThiODYyZTdhZmIyMGNmZTVh
MjI4MzBlMTk2MzQ2MmYzYTE3ZjQ5ZDgyYTZjMWQxZjQyZCIKK1NSQ19VUklbd2l0LWJpbmRnZW4t
MC41Ny4xLnNoYTI1NnN1bV0gPSAiMWViZjk0NGU4N2E3YzI1MzIzM2FkNjc2NmUwODJlM2NkNzE0
YjVkMDM4MTJhY2MyNGMzMThmNTQ5NjE0NTM2ZSIKIFNSQ19VUklbd3JpdGVhYmxlLTAuNi4yLnNo
YTI1NnN1bV0gPSAiOWVkZGUwZGI0NzY5ZDJkYzY4NTc5ODkzZjIzMDZiMjZjNmVjZmJlMGVmNDk5
YjAxM2Q3MzFiN2I5MjQ3ZTBiOSIKIFNSQ19VUklbeGF0dHItMS42LjEuc2hhMjU2c3VtXSA9ICIz
MmU0NWFkNDIwNmY2ZDI0NzkwODUxNDdmMDJiYzJlZjgzNGFjODU4ODY2MjRhMjM1NzVhZTEzN2M4
YWE4MTU2IgogU1JDX1VSSVt5b2tlLTAuOC4xLnNoYTI1NnN1bV0gPSAiNzJkNmU1YzZhZmI4NGQ3
Mzk0NGU1Y2VkYjA1MmM0NjgwZDU2NTczMzcyMDE1NTVmOWYyYTE2Yjc0MDZkNDk1NCIKZGlmZiAt
LWdpdCBhL21ldGEvcmVjaXBlcy1kZXZ0b29scy9weXRob24vcHl0aG9uMy11di1idWlsZF8wLjEy
LjEwLmJiIGIvbWV0YS9yZWNpcGVzLWRldnRvb2xzL3B5dGhvbi9weXRob24zLXV2LWJ1aWxkXzAu
MTIuMTEuYmIKc2ltaWxhcml0eSBpbmRleCA5MiUKcmVuYW1lIGZyb20gbWV0YS9yZWNpcGVzLWRl
dnRvb2xzL3B5dGhvbi9weXRob24zLXV2LWJ1aWxkXzAuMTIuMTAuYmIKcmVuYW1lIHRvIG1ldGEv
cmVjaXBlcy1kZXZ0b29scy9weXRob24vcHl0aG9uMy11di1idWlsZF8wLjEyLjExLmJiCmluZGV4
IDEyY2Y1YzdjYzMuLmE0MmQwY2JmZmMgMTAwNjQ0Ci0tLSBhL21ldGEvcmVjaXBlcy1kZXZ0b29s
cy9weXRob24vcHl0aG9uMy11di1idWlsZF8wLjEyLjEwLmJiCisrKyBiL21ldGEvcmVjaXBlcy1k
ZXZ0b29scy9weXRob24vcHl0aG9uMy11di1idWlsZF8wLjEyLjExLmJiCkBAIC0xMSw3ICsxMSw3
IEBAIExJQ19GSUxFU19DSEtTVU0gPSAiZmlsZTovL0xJQ0VOU0UtQVBBQ0hFO21kNT04NmQzZjNh
OTVjMzI0Yzk0NzliZDg5ODY5NjhmNDMyNyBcCiAgICAgICAgICAgICAgICAgICAgIGZpbGU6Ly9j
cmF0ZXMvdXYtcGVwNTA4L0xpY2Vuc2UtQXBhY2hlO21kNT1lMjNmYWRkNmNlZWY4YzYxOGZjMWM2
NTE5MWQ4NDZmYSBcCiAgICAgICAgICAgICAgICAgICAgIGZpbGU6Ly9jcmF0ZXMvdXYtcGVwNTA4
L0xpY2Vuc2UtQlNEO21kNT1lZjdhNjAyN2RjNGMyMzg5YjlhZmFkN2U2OTAyNzRjNyIKIAotU1JD
X1VSSVtzaGEyNTZzdW1dID0gImM4M2MwZjFkZDJjOTIxMDkxZDE5NzRmNTZkNjQyMjFjMDEwZTE3
M2Q5ZTZkNTJlYzJhMjU4MjY1MGMyZDUxOTciCitTUkNfVVJJW3NoYTI1NnN1bV0gPSAiNjMwNTVj
YWMyMDc1NmNmNGU3MDI2MDhmZGU3MjAyMWU2ZWU0OGRiNTAyMWNmYTJlMWIzOThjODc2Y2YzMjgz
NCIKIAogcmVxdWlyZSAke0JQTn0tY3JhdGVzLmluYwogCi0tIAoyLjQ3LjEKCg==

--===============2686610472632495508==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: attachment; filename="buildhistory-diff-full.txt"

packages/x86-64-v3-poky-linux/python3-uv-build: SRC_URI changed from "https://files.pythonhosted.org/packages/source/u/uv_build/uv_build-0.12.10.tar.gz crate://crates.io/adler2/2.0.1 crate://crates.io/aho-corasick/1.1.4 crate://crates.io/allocator-api2/0.2.21 crate://crates.io/ambient-authority/0.0.2 crate://crates.io/anstream/1.0.0 crate://crates.io/anstyle/1.0.14 crate://crates.io/anstyle-parse/1.0.0 crate://crates.io/anstyle-query/1.1.5 crate://crates.io/anstyle-wincon/3.0.11 crate://crates.io/anyhow/1.0.104 crate://crates.io/archive-trait/0.0.14 crate://crates.io/arcstr/1.2.0 crate://crates.io/arrayvec/0.7.8 crate://crates.io/astral-tokio-tar/0.7.0 crate://crates.io/astral-version-ranges/0.2.2 crate://crates.io/astral_async_zip/0.0.20 crate://crates.io/async-compression/0.4.19 crate://crates.io/autocfg/1.5.0 crate://crates.io/backon/1.6.0 crate://crates.io/base64/0.22.1 crate://crates.io/bitflags/1.3.2 crate://crates.io/bitflags/2.13.1 crate://crates.io/block-buffer/0.10.4 crate:
 //crates.io/block-buffer/0.12.1 crate://crates.io/boxcar/0.2.14 crate://crates.io/bstr/1.12.1 crate://crates.io/bumpalo/3.20.2 crate://crates.io/bytecheck/0.8.2 crate://crates.io/bytecheck_derive/0.8.2 crate://crates.io/bytes/1.12.1 crate://crates.io/cap-primitives/4.0.3 crate://crates.io/cap-std/4.0.3 crate://crates.io/cc/1.2.57 crate://crates.io/cfg-if/1.0.4 crate://crates.io/charset/0.1.5 crate://crates.io/clap/4.6.5 crate://crates.io/clap_builder/4.6.5 crate://crates.io/clap_derive/4.6.4 crate://crates.io/clap_lex/1.1.0 crate://crates.io/colorchoice/1.0.5 crate://crates.io/console/0.16.4 crate://crates.io/const-oid/0.10.2 crate://crates.io/cpufeatures/0.2.17 crate://crates.io/cpufeatures/0.3.0 crate://crates.io/crc32fast/1.5.0 crate://crates.io/crypto-common/0.1.7 crate://crates.io/crypto-common/0.2.2 crate://crates.io/csv/1.4.0 crate://crates.io/csv-core/0.1.13 crate://crates.io/data-encoding/2.11.0 crate://crates.io/defmt/1.1.0 crate://crates.io/defmt-macros/1.1.0 crate://crat
 es.io/defmt-parser/1.0.0 crate://crates.io/digest/0.10.7 crate://crates.io/digest/0.11.3 crate://crates.io/displaydoc/0.2.5 crate://crates.io/dunce/1.0.5 crate://crates.io/dyn-clone/1.0.20 crate://crates.io/either/1.17.0 crate://crates.io/encode_unicode/1.0.0 crate://crates.io/encoding_rs/0.8.35 crate://crates.io/encoding_rs_io/0.1.7 crate://crates.io/enumflags2/0.7.12 crate://crates.io/enumflags2_derive/0.7.12 crate://crates.io/equivalent/1.0.2 crate://crates.io/erased-serde/0.4.10 crate://crates.io/errno/0.3.14 crate://crates.io/fastrand/2.5.0 crate://crates.io/find-msvc-tools/0.1.9 crate://crates.io/fixedbitset/0.5.7 crate://crates.io/flate2/1.1.9 crate://crates.io/foldhash/0.1.5 crate://crates.io/foldhash/0.2.0 crate://crates.io/form_urlencoded/1.2.2 crate://crates.io/fs-err/3.3.1 crate://crates.io/fs-set-times/0.20.3 crate://crates.io/futures/0.3.33 crate://crates.io/futures-channel/0.3.33 crate://crates.io/futures-core/0.3.33 crate://crates.io/futures-executor/0.3.33 crate://c
 rates.io/futures-io/0.3.33 crate://crates.io/futures-lite/2.6.1 crate://crates.io/futures-macro/0.3.33 crate://crates.io/futures-sink/0.3.33 crate://crates.io/futures-task/0.3.33 crate://crates.io/futures-util/0.3.33 crate://crates.io/generic-array/0.14.7 crate://crates.io/getrandom/0.4.3 crate://crates.io/globset/0.4.19 crate://crates.io/gloo-timers/0.3.0 crate://crates.io/hashbrown/0.15.5 crate://crates.io/hashbrown/0.17.1 crate://crates.io/heck/0.5.0 crate://crates.io/hex/0.4.3 crate://crates.io/hybrid-array/0.4.13 crate://crates.io/icu_collections/2.1.1 crate://crates.io/icu_locale_core/2.1.1 crate://crates.io/icu_normalizer/2.1.1 crate://crates.io/icu_normalizer_data/2.1.1 crate://crates.io/icu_properties/2.1.2 crate://crates.io/icu_properties_data/2.1.2 crate://crates.io/icu_provider/2.1.1 crate://crates.io/idna/1.1.0 crate://crates.io/idna_adapter/1.2.1 crate://crates.io/indexmap/2.14.0 crate://crates.io/indoc/2.0.7 crate://crates.io/insta/1.48.0 crate://crates.io/io-extras/0
 .19.0 crate://crates.io/io-lifetimes/2.0.4 crate://crates.io/io-lifetimes/3.0.1 crate://crates.io/ipnet/2.12.0 crate://crates.io/is_terminal_polyfill/1.70.2 crate://crates.io/itertools/0.14.0 crate://crates.io/itoa/1.0.17 crate://crates.io/jiff/0.2.35 crate://crates.io/jiff-core/0.1.0 crate://crates.io/jiff-static/0.2.35 crate://crates.io/jiff-tzdb/0.1.8 crate://crates.io/jiff-tzdb-platform/0.1.3 crate://crates.io/jobserver/0.1.35 crate://crates.io/js-sys/0.3.91 crate://crates.io/junction/2.0.0 crate://crates.io/lazy_static/1.5.0 crate://crates.io/libc/0.2.189 crate://crates.io/linux-raw-sys/0.12.1 crate://crates.io/litemap/0.8.1 crate://crates.io/lock_api/0.4.14 crate://crates.io/log/0.4.29 crate://crates.io/mailparse/0.16.1 crate://crates.io/matchers/0.2.0 crate://crates.io/maybe-owned/0.3.4 crate://crates.io/memchr/2.8.3 crate://crates.io/miniz_oxide/0.8.9 crate://crates.io/mio/1.2.0 crate://crates.io/munge/0.4.7 crate://crates.io/munge_macro/0.4.7 crate://crates.io/nu-ansi-term/
 0.50.3 crate://crates.io/once_cell/1.21.4 crate://crates.io/once_cell_polyfill/1.70.2 crate://crates.io/owo-colors/4.3.0 crate://crates.io/parking/2.2.1 crate://crates.io/parking_lot/0.12.5 crate://crates.io/parking_lot_core/0.9.12 crate://crates.io/path-slash/0.2.1 crate://crates.io/percent-encoding/2.3.2 crate://crates.io/pest/2.8.6 crate://crates.io/pest_derive/2.8.6 crate://crates.io/pest_generator/2.8.6 crate://crates.io/pest_meta/2.8.6 crate://crates.io/petgraph/0.8.3 crate://crates.io/pin-project/1.1.11 crate://crates.io/pin-project-internal/1.1.11 crate://crates.io/pin-project-lite/0.2.17 crate://crates.io/pkg-config/0.3.32 crate://crates.io/portable-atomic/1.13.1 crate://crates.io/portable-atomic-util/0.2.6 crate://crates.io/potential_utf/0.1.4 crate://crates.io/proc-macro-error-attr2/2.0.0 crate://crates.io/proc-macro-error2/2.0.1 crate://crates.io/proc-macro2/1.0.107 crate://crates.io/ptr_meta/0.3.1 crate://crates.io/ptr_meta_derive/0.3.1 crate://crates.io/quote/1.0.47 cr
 ate://crates.io/quoted_printable/0.5.1 crate://crates.io/r-efi/6.0.0 crate://crates.io/rancor/0.1.1 crate://crates.io/redox_syscall/0.5.15 crate://crates.io/ref-cast/1.0.26 crate://crates.io/ref-cast-impl/1.0.26 crate://crates.io/reflink-copy/0.1.30 crate://crates.io/regex/1.13.1 crate://crates.io/regex-automata/0.4.16 crate://crates.io/regex-syntax/0.8.11 crate://crates.io/rend/0.5.3 crate://crates.io/rkyv/0.8.17 crate://crates.io/rkyv_derive/0.8.17 crate://crates.io/rustc-hash/2.1.3 crate://crates.io/rustix/1.1.4 crate://crates.io/rustix-linux-procfs/0.1.1 crate://crates.io/rustversion/1.0.22 crate://crates.io/ryu/1.0.23 crate://crates.io/same-file/1.0.6 crate://crates.io/schemars/1.2.2 crate://crates.io/schemars_derive/1.2.2 crate://crates.io/scopeguard/1.2.0 crate://crates.io/seahash/4.1.0 crate://crates.io/self-replace/1.5.0 crate://crates.io/serde/1.0.229 crate://crates.io/serde-untagged/0.1.9 crate://crates.io/serde_core/1.0.229 crate://crates.io/serde_derive/1.0.229 crate://
 crates.io/serde_derive_internals/0.30.0 crate://crates.io/serde_json/1.0.151 crate://crates.io/serde_spanned/1.1.1 crate://crates.io/sha2/0.10.9 crate://crates.io/sha2/0.11.0 crate://crates.io/sharded-slab/0.1.7 crate://crates.io/shlex/1.3.0 crate://crates.io/signal-hook-registry/1.4.8 crate://crates.io/simd-adler32/0.3.8 crate://crates.io/simdutf8/0.1.5 crate://crates.io/similar/2.7.0 crate://crates.io/slab/0.4.12 crate://crates.io/smallvec/1.15.2 crate://crates.io/smawk/0.3.2 crate://crates.io/spdx/0.13.4 crate://crates.io/stable_deref_trait/1.2.1 crate://crates.io/strip-ansi-escapes/0.2.1 crate://crates.io/strsim/0.11.1 crate://crates.io/syn/2.0.118 crate://crates.io/syn/3.0.3 crate://crates.io/synstructure/0.13.2 crate://crates.io/tar-codec/0.0.14 crate://crates.io/tar-framing/0.0.14 crate://crates.io/temp-env/0.3.6 crate://crates.io/tempfile/3.27.0 crate://crates.io/terminal_size/0.4.4 crate://crates.io/textwrap/0.16.2 crate://crates.io/thiserror/2.0.19 crate://crates.io/thiser
 ror-impl/2.0.19 crate://crates.io/thread_local/1.1.9 crate://crates.io/tinystr/0.8.2 crate://crates.io/tinyvec/1.11.0 crate://crates.io/tinyvec_macros/0.1.1 crate://crates.io/tokio/1.53.1 crate://crates.io/tokio-macros/2.7.0 crate://crates.io/tokio-stream/0.1.19 crate://crates.io/tokio-util/0.7.19 crate://crates.io/toml/1.1.3+spec-1.1.0 crate://crates.io/toml_datetime/1.1.1+spec-1.1.0 crate://crates.io/toml_edit/0.25.13+spec-1.1.0 crate://crates.io/toml_parser/1.1.2+spec-1.1.0 crate://crates.io/toml_writer/1.1.2+spec-1.1.0 crate://crates.io/tracing/0.1.44 crate://crates.io/tracing-attributes/0.1.31 crate://crates.io/tracing-core/0.1.36 crate://crates.io/tracing-log/0.2.0 crate://crates.io/tracing-subscriber/0.3.23 crate://crates.io/tracing-test/0.2.6 crate://crates.io/tracing-test-macro/0.2.6 crate://crates.io/typeid/1.0.3 crate://crates.io/typenum/1.20.1 crate://crates.io/ucd-trie/0.1.7 crate://crates.io/unicode-ident/1.0.24 crate://crates.io/unicode-linebreak/0.1.5 crate://crates.
 io/unicode-width/0.2.2 crate://crates.io/unscanny/0.1.0 crate://crates.io/url/2.5.8 crate://crates.io/utf8_iter/1.0.4 crate://crates.io/utf8parse/0.2.2 crate://crates.io/uuid/1.24.0 crate://crates.io/valuable/0.1.1 crate://crates.io/version_check/0.9.5 crate://crates.io/vte/0.14.1 crate://crates.io/walkdir/2.5.0 crate://crates.io/wasi/0.11.1+wasi-snapshot-preview1 crate://crates.io/wasm-bindgen/0.2.114 crate://crates.io/wasm-bindgen-macro/0.2.114 crate://crates.io/wasm-bindgen-macro-support/0.2.114 crate://crates.io/wasm-bindgen-shared/0.2.114 crate://crates.io/winapi-util/0.1.11 crate://crates.io/windows/0.61.3 crate://crates.io/windows-collections/0.2.0 crate://crates.io/windows-core/0.61.2 crate://crates.io/windows-future/0.2.1 crate://crates.io/windows-implement/0.60.2 crate://crates.io/windows-interface/0.59.3 crate://crates.io/windows-link/0.1.3 crate://crates.io/windows-link/0.2.1 crate://crates.io/windows-numerics/0.2.0 crate://crates.io/windows-result/0.3.4 crate://crates.i
 o/windows-strings/0.4.2 crate://crates.io/windows-sys/0.52.0 crate://crates.io/windows-sys/0.60.2 crate://crates.io/windows-sys/0.61.2 crate://crates.io/windows-targets/0.52.6 crate://crates.io/windows-targets/0.53.5 crate://crates.io/windows-threading/0.1.0 crate://crates.io/windows_aarch64_gnullvm/0.52.6 crate://crates.io/windows_aarch64_gnullvm/0.53.1 crate://crates.io/windows_aarch64_msvc/0.52.6 crate://crates.io/windows_aarch64_msvc/0.53.1 crate://crates.io/windows_i686_gnu/0.52.6 crate://crates.io/windows_i686_gnu/0.53.1 crate://crates.io/windows_i686_gnullvm/0.52.6 crate://crates.io/windows_i686_gnullvm/0.53.1 crate://crates.io/windows_i686_msvc/0.52.6 crate://crates.io/windows_i686_msvc/0.53.1 crate://crates.io/windows_x86_64_gnu/0.52.6 crate://crates.io/windows_x86_64_gnu/0.53.1 crate://crates.io/windows_x86_64_gnullvm/0.52.6 crate://crates.io/windows_x86_64_gnullvm/0.53.1 crate://crates.io/windows_x86_64_msvc/0.52.6 crate://crates.io/windows_x86_64_msvc/0.53.1 crate://crat
 es.io/winnow/1.0.3 crate://crates.io/winx/0.36.4 crate://crates.io/writeable/0.6.2 crate://crates.io/xattr/1.6.1 crate://crates.io/yoke/0.8.1 crate://crates.io/yoke-derive/0.8.1 crate://crates.io/zerocopy/0.8.56 crate://crates.io/zerocopy-derive/0.8.56 crate://crates.io/zerofrom/0.1.6 crate://crates.io/zerofrom-derive/0.1.6 crate://crates.io/zerotrie/0.2.3 crate://crates.io/zerovec/0.11.5 crate://crates.io/zerovec-derive/0.11.2 crate://crates.io/zlib-rs/0.6.3 crate://crates.io/zmij/1.0.21 crate://crates.io/zstd/0.13.3 crate://crates.io/zstd-safe/7.2.4 crate://crates.io/zstd-sys/2.0.16+zstd.1.5.7" to "https://files.pythonhosted.org/packages/source/u/uv_build/uv_build-0.12.11.tar.gz crate://crates.io/adler2/2.0.1 crate://crates.io/aho-corasick/1.1.4 crate://crates.io/allocator-api2/0.2.21 crate://crates.io/ambient-authority/0.0.2 crate://crates.io/anstream/1.0.0 crate://crates.io/anstyle/1.0.14 crate://crates.io/anstyle-parse/1.0.0 crate://crates.io/anstyle-query/1.1.5 crate://crates.
 io/anstyle-wincon/3.0.11 crate://crates.io/anyhow/1.0.104 crate://crates.io/archive-trait/0.0.14 crate://crates.io/arcstr/1.2.0 crate://crates.io/arrayvec/0.7.8 crate://crates.io/astral-tokio-tar/0.7.0 crate://crates.io/astral-version-ranges/0.2.2 crate://crates.io/astral_async_zip/0.0.20 crate://crates.io/async-compression/0.4.19 crate://crates.io/autocfg/1.5.0 crate://crates.io/backon/1.6.0 crate://crates.io/base64/0.22.1 crate://crates.io/bitflags/1.3.2 crate://crates.io/bitflags/2.13.1 crate://crates.io/block-buffer/0.10.4 crate://crates.io/block-buffer/0.12.1 crate://crates.io/boxcar/0.2.14 crate://crates.io/bstr/1.12.1 crate://crates.io/bumpalo/3.20.2 crate://crates.io/bytecheck/0.8.3 crate://crates.io/bytecheck_derive/0.8.3 crate://crates.io/bytes/1.12.1 crate://crates.io/cap-primitives/4.0.3 crate://crates.io/cap-std/4.0.3 crate://crates.io/cc/1.2.57 crate://crates.io/cfg-if/1.0.4 crate://crates.io/charset/0.1.5 crate://crates.io/clap/4.6.6 crate://crates.io/clap_builder/4.6
 .6 crate://crates.io/clap_derive/4.6.4 crate://crates.io/clap_lex/1.1.0 crate://crates.io/colorchoice/1.0.5 crate://crates.io/console/0.16.4 crate://crates.io/const-oid/0.10.2 crate://crates.io/cpufeatures/0.2.17 crate://crates.io/cpufeatures/0.3.0 crate://crates.io/crc32fast/1.5.0 crate://crates.io/crypto-common/0.1.7 crate://crates.io/crypto-common/0.2.2 crate://crates.io/csv/1.4.0 crate://crates.io/csv-core/0.1.13 crate://crates.io/data-encoding/2.11.1 crate://crates.io/defmt/1.1.0 crate://crates.io/defmt-macros/1.1.0 crate://crates.io/defmt-parser/1.0.0 crate://crates.io/digest/0.10.7 crate://crates.io/digest/0.11.3 crate://crates.io/displaydoc/0.2.5 crate://crates.io/dunce/1.0.5 crate://crates.io/dyn-clone/1.0.20 crate://crates.io/either/1.17.0 crate://crates.io/encode_unicode/1.0.0 crate://crates.io/encoding_rs/0.8.35 crate://crates.io/encoding_rs_io/0.1.8 crate://crates.io/enumflags2/0.7.12 crate://crates.io/enumflags2_derive/0.7.12 crate://crates.io/equivalent/1.0.2 crate://
 crates.io/erased-serde/0.4.10 crate://crates.io/errno/0.3.14 crate://crates.io/fastrand/2.5.0 crate://crates.io/find-msvc-tools/0.1.9 crate://crates.io/fixedbitset/0.5.7 crate://crates.io/flate2/1.1.9 crate://crates.io/foldhash/0.1.5 crate://crates.io/foldhash/0.2.0 crate://crates.io/form_urlencoded/1.2.2 crate://crates.io/fs-err/3.3.1 crate://crates.io/fs-set-times/0.20.3 crate://crates.io/futures/0.3.33 crate://crates.io/futures-channel/0.3.33 crate://crates.io/futures-core/0.3.33 crate://crates.io/futures-executor/0.3.33 crate://crates.io/futures-io/0.3.33 crate://crates.io/futures-lite/2.6.1 crate://crates.io/futures-macro/0.3.33 crate://crates.io/futures-sink/0.3.33 crate://crates.io/futures-task/0.3.33 crate://crates.io/futures-util/0.3.33 crate://crates.io/generic-array/0.14.7 crate://crates.io/getrandom/0.3.4 crate://crates.io/getrandom/0.4.3 crate://crates.io/globset/0.4.20 crate://crates.io/gloo-timers/0.3.0 crate://crates.io/hashbrown/0.15.5 crate://crates.io/hashbrown/0.
 17.1 crate://crates.io/heck/0.5.0 crate://crates.io/hex/0.4.3 crate://crates.io/hybrid-array/0.4.13 crate://crates.io/icu_collections/2.1.1 crate://crates.io/icu_locale_core/2.1.1 crate://crates.io/icu_normalizer/2.1.1 crate://crates.io/icu_normalizer_data/2.1.1 crate://crates.io/icu_properties/2.1.2 crate://crates.io/icu_properties_data/2.1.2 crate://crates.io/icu_provider/2.1.1 crate://crates.io/idna/1.1.0 crate://crates.io/idna_adapter/1.2.1 crate://crates.io/indexmap/2.14.0 crate://crates.io/indoc/2.0.7 crate://crates.io/insta/1.48.0 crate://crates.io/io-extras/0.19.0 crate://crates.io/io-lifetimes/2.0.4 crate://crates.io/io-lifetimes/3.0.1 crate://crates.io/ipnet/2.12.0 crate://crates.io/is_terminal_polyfill/1.70.2 crate://crates.io/itertools/0.14.0 crate://crates.io/itoa/1.0.17 crate://crates.io/jiff/0.2.35 crate://crates.io/jiff-core/0.1.0 crate://crates.io/jiff-static/0.2.35 crate://crates.io/jiff-tzdb/0.1.8 crate://crates.io/jiff-tzdb-platform/0.1.3 crate://crates.io/jobser
 ver/0.1.35 crate://crates.io/js-sys/0.3.91 crate://crates.io/junction/2.0.0 crate://crates.io/lazy_static/1.5.0 crate://crates.io/libc/0.2.189 crate://crates.io/linux-raw-sys/0.12.1 crate://crates.io/litemap/0.8.1 crate://crates.io/lock_api/0.4.14 crate://crates.io/log/0.4.29 crate://crates.io/mailparse/0.16.1 crate://crates.io/matchers/0.2.0 crate://crates.io/maybe-owned/0.3.4 crate://crates.io/memchr/2.8.3 crate://crates.io/miniz_oxide/0.8.9 crate://crates.io/mio/1.2.0 crate://crates.io/munge/0.4.7 crate://crates.io/munge_macro/0.4.7 crate://crates.io/nu-ansi-term/0.50.3 crate://crates.io/once_cell/1.21.4 crate://crates.io/once_cell_polyfill/1.70.2 crate://crates.io/owo-colors/4.3.0 crate://crates.io/parking/2.2.1 crate://crates.io/parking_lot/0.12.5 crate://crates.io/parking_lot_core/0.9.12 crate://crates.io/path-slash/0.2.1 crate://crates.io/percent-encoding/2.3.2 crate://crates.io/pest/2.8.6 crate://crates.io/pest_derive/2.8.6 crate://crates.io/pest_generator/2.8.6 crate://crat
 es.io/pest_meta/2.8.6 crate://crates.io/petgraph/0.8.3 crate://crates.io/pin-project/1.1.11 crate://crates.io/pin-project-internal/1.1.11 crate://crates.io/pin-project-lite/0.2.17 crate://crates.io/pkg-config/0.3.32 crate://crates.io/portable-atomic/1.13.1 crate://crates.io/portable-atomic-util/0.2.6 crate://crates.io/potential_utf/0.1.4 crate://crates.io/proc-macro-error-attr2/2.0.0 crate://crates.io/proc-macro-error2/2.0.1 crate://crates.io/proc-macro2/1.0.107 crate://crates.io/ptr_meta/0.3.1 crate://crates.io/ptr_meta_derive/0.3.1 crate://crates.io/quote/1.0.47 crate://crates.io/quoted_printable/0.5.1 crate://crates.io/r-efi/5.3.0 crate://crates.io/r-efi/6.0.0 crate://crates.io/rancor/0.1.1 crate://crates.io/redox_syscall/0.5.15 crate://crates.io/ref-cast/1.0.26 crate://crates.io/ref-cast-impl/1.0.26 crate://crates.io/reflink-copy/0.1.30 crate://crates.io/regex/1.13.1 crate://crates.io/regex-automata/0.4.18 crate://crates.io/regex-syntax/0.8.11 crate://crates.io/rend/0.5.3 crate:
 //crates.io/rkyv/0.8.18 crate://crates.io/rkyv_derive/0.8.18 crate://crates.io/rustc-hash/2.1.3 crate://crates.io/rustix/1.1.4 crate://crates.io/rustix-linux-procfs/0.1.1 crate://crates.io/rustversion/1.0.22 crate://crates.io/ryu/1.0.23 crate://crates.io/same-file/1.0.6 crate://crates.io/schemars/1.2.2 crate://crates.io/schemars_derive/1.2.2 crate://crates.io/scopeguard/1.2.0 crate://crates.io/seahash/4.1.0 crate://crates.io/self-replace/1.5.0 crate://crates.io/serde/1.0.229 crate://crates.io/serde-untagged/0.1.9 crate://crates.io/serde_core/1.0.229 crate://crates.io/serde_derive/1.0.229 crate://crates.io/serde_derive_internals/0.30.0 crate://crates.io/serde_json/1.0.151 crate://crates.io/serde_spanned/1.1.1 crate://crates.io/sha2/0.10.9 crate://crates.io/sha2/0.11.0 crate://crates.io/sharded-slab/0.1.7 crate://crates.io/shlex/1.3.0 crate://crates.io/signal-hook-registry/1.4.8 crate://crates.io/simd-adler32/0.3.8 crate://crates.io/simdutf8/0.1.5 crate://crates.io/similar/2.7.0 crate
 ://crates.io/slab/0.4.12 crate://crates.io/smallvec/1.15.2 crate://crates.io/smawk/0.3.2 crate://crates.io/spdx/0.13.5 crate://crates.io/stable_deref_trait/1.2.1 crate://crates.io/strip-ansi-escapes/0.2.1 crate://crates.io/strsim/0.11.1 crate://crates.io/syn/2.0.118 crate://crates.io/syn/3.0.3 crate://crates.io/synstructure/0.13.2 crate://crates.io/tar-codec/0.0.14 crate://crates.io/tar-framing/0.0.14 crate://crates.io/temp-env/0.3.6 crate://crates.io/tempfile/3.27.0 crate://crates.io/terminal_size/0.4.4 crate://crates.io/textwrap/0.16.2 crate://crates.io/thiserror/2.0.19 crate://crates.io/thiserror-impl/2.0.19 crate://crates.io/thread_local/1.1.9 crate://crates.io/tinystr/0.8.2 crate://crates.io/tinyvec/1.11.0 crate://crates.io/tinyvec_macros/0.1.1 crate://crates.io/tokio/1.53.1 crate://crates.io/tokio-macros/2.7.0 crate://crates.io/tokio-stream/0.1.19 crate://crates.io/tokio-util/0.7.19 crate://crates.io/toml/1.1.3+spec-1.1.0 crate://crates.io/toml_datetime/1.1.1+spec-1.1.0 crate:
 //crates.io/toml_edit/0.25.13+spec-1.1.0 crate://crates.io/toml_parser/1.1.2+spec-1.1.0 crate://crates.io/toml_writer/1.1.2+spec-1.1.0 crate://crates.io/tracing/0.1.44 crate://crates.io/tracing-attributes/0.1.31 crate://crates.io/tracing-core/0.1.36 crate://crates.io/tracing-log/0.2.0 crate://crates.io/tracing-subscriber/0.3.23 crate://crates.io/tracing-test/0.2.6 crate://crates.io/tracing-test-macro/0.2.6 crate://crates.io/typeid/1.0.3 crate://crates.io/typenum/1.20.1 crate://crates.io/ucd-trie/0.1.7 crate://crates.io/unicode-ident/1.0.24 crate://crates.io/unicode-linebreak/0.1.5 crate://crates.io/unicode-width/0.2.2 crate://crates.io/unscanny/0.1.0 crate://crates.io/url/2.5.8 crate://crates.io/utf8_iter/1.0.4 crate://crates.io/utf8parse/0.2.2 crate://crates.io/uuid/1.24.0 crate://crates.io/valuable/0.1.1 crate://crates.io/version_check/0.9.5 crate://crates.io/vte/0.14.1 crate://crates.io/walkdir/2.5.0 crate://crates.io/wasi/0.11.1+wasi-snapshot-preview1 crate://crates.io/wasip2/1.
 0.4+wasi-0.2.12 crate://crates.io/wasm-bindgen/0.2.114 crate://crates.io/wasm-bindgen-macro/0.2.114 crate://crates.io/wasm-bindgen-macro-support/0.2.114 crate://crates.io/wasm-bindgen-shared/0.2.114 crate://crates.io/winapi-util/0.1.11 crate://crates.io/windows/0.61.3 crate://crates.io/windows-collections/0.2.0 crate://crates.io/windows-core/0.61.2 crate://crates.io/windows-future/0.2.1 crate://crates.io/windows-implement/0.60.2 crate://crates.io/windows-interface/0.59.3 crate://crates.io/windows-link/0.1.3 crate://crates.io/windows-link/0.2.1 crate://crates.io/windows-numerics/0.2.0 crate://crates.io/windows-result/0.3.4 crate://crates.io/windows-strings/0.4.2 crate://crates.io/windows-sys/0.52.0 crate://crates.io/windows-sys/0.60.2 crate://crates.io/windows-sys/0.61.2 crate://crates.io/windows-targets/0.52.6 crate://crates.io/windows-targets/0.53.5 crate://crates.io/windows-threading/0.1.0 crate://crates.io/windows_aarch64_gnullvm/0.52.6 crate://crates.io/windows_aarch64_gnullvm/0
 .53.1 crate://crates.io/windows_aarch64_msvc/0.52.6 crate://crates.io/windows_aarch64_msvc/0.53.1 crate://crates.io/windows_i686_gnu/0.52.6 crate://crates.io/windows_i686_gnu/0.53.1 crate://crates.io/windows_i686_gnullvm/0.52.6 crate://crates.io/windows_i686_gnullvm/0.53.1 crate://crates.io/windows_i686_msvc/0.52.6 crate://crates.io/windows_i686_msvc/0.53.1 crate://crates.io/windows_x86_64_gnu/0.52.6 crate://crates.io/windows_x86_64_gnu/0.53.1 crate://crates.io/windows_x86_64_gnullvm/0.52.6 crate://crates.io/windows_x86_64_gnullvm/0.53.1 crate://crates.io/windows_x86_64_msvc/0.52.6 crate://crates.io/windows_x86_64_msvc/0.53.1 crate://crates.io/winnow/1.0.3 crate://crates.io/winx/0.36.4 crate://crates.io/wit-bindgen/0.57.1 crate://crates.io/writeable/0.6.2 crate://crates.io/xattr/1.6.1 crate://crates.io/yoke/0.8.1 crate://crates.io/yoke-derive/0.8.1 crate://crates.io/zerocopy/0.8.56 crate://crates.io/zerocopy-derive/0.8.56 crate://crates.io/zerofrom/0.1.6 crate://crates.io/zerofrom-d
 erive/0.1.6 crate://crates.io/zerotrie/0.2.3 crate://crates.io/zerovec/0.11.5 crate://crates.io/zerovec-derive/0.11.2 crate://crates.io/zlib-rs/0.6.3 crate://crates.io/zmij/1.0.21 crate://crates.io/zstd/0.13.3 crate://crates.io/zstd-safe/7.2.4 crate://crates.io/zstd-sys/2.0.16+zstd.1.5.7"
packages/x86-64-v3-poky-linux/python3-uv-build: PKGV changed from 0.12.10 [default] to 0.12.11 [default]
packages/x86-64-v3-poky-linux/python3-uv-build: PV changed from "0.12.10" to "0.12.11"
packages/x86-64-v3-poky-linux/python3-uv-build/python3-uv-build-dbg: PKGV changed from 0.12.10 [default] to 0.12.11 [default]
packages/x86-64-v3-poky-linux/python3-uv-build/python3-uv-build-dbg: PV changed from "0.12.10" to "0.12.11"
packages/x86-64-v3-poky-linux/python3-uv-build/python3-uv-build-dev: PKGV changed from 0.12.10 [default] to 0.12.11 [default]
packages/x86-64-v3-poky-linux/python3-uv-build/python3-uv-build-dev: PV changed from "0.12.10" to "0.12.11"
packages/x86-64-v3-poky-linux/python3-uv-build/python3-uv-build-doc: PKGV changed from 0.12.10 [default] to 0.12.11 [default]
packages/x86-64-v3-poky-linux/python3-uv-build/python3-uv-build-doc: PV changed from "0.12.10" to "0.12.11"
packages/x86-64-v3-poky-linux/python3-uv-build/python3-uv-build-locale: PKGV changed from 0.12.10 [default] to 0.12.11 [default]
packages/x86-64-v3-poky-linux/python3-uv-build/python3-uv-build-locale: PV changed from "0.12.10" to "0.12.11"
packages/x86-64-v3-poky-linux/python3-uv-build/python3-uv-build-src: PKGV changed from 0.12.10 [default] to 0.12.11 [default]
packages/x86-64-v3-poky-linux/python3-uv-build/python3-uv-build-src: PV changed from "0.12.10" to "0.12.11"
packages/x86-64-v3-poky-linux/python3-uv-build/python3-uv-build-staticdev: PKGV changed from 0.12.10 [default] to 0.12.11 [default]
packages/x86-64-v3-poky-linux/python3-uv-build/python3-uv-build-staticdev: PV changed from "0.12.10" to "0.12.11"
packages/x86-64-v3-poky-linux/python3-uv-build/python3-uv-build: PKGSIZE changed from 4483353 to 4495657 (+0%)
packages/x86-64-v3-poky-linux/python3-uv-build/python3-uv-build: FILELIST: directory renamed /usr/lib/python3.14/site-packages/uv_build-0.12.10.dist-info/licenses -> /usr/lib/python3.14/site-packages/uv_build-0.12.11.dist-info/licenses, directory renamed /usr/lib/python3.14/site-packages/uv_build-0.12.10.dist-info -> /usr/lib/python3.14/site-packages/uv_build-0.12.11.dist-info
packages/x86-64-v3-poky-linux/python3-uv-build/python3-uv-build: PKGV changed from 0.12.10 [default] to 0.12.11 [default]
packages/x86-64-v3-poky-linux/python3-uv-build/python3-uv-build: PV changed from "0.12.10" to "0.12.11"
Changes to packages/x86-64-v3-poky-linux/python3-uv-build (sysroot):
  /usr/lib/python3.14/site-packages/uv_build-0.12.10.dist-info moved to /usr/lib/python3.14/site-packages/uv_build-0.12.11.dist-info

--===============2686610472632495508==--

