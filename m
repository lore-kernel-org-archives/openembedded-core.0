Return-Path: <auh@yoctoproject.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 236B0C88E46
	for <webhook@archiver.kernel.org>; Thu, 10 Sep 2026 06:00:33 +0000 (UTC)
Received: from a27-31.smtp-out.us-west-2.amazonses.com (a27-31.smtp-out.us-west-2.amazonses.com [54.240.27.31])
 by mx.groups.io with SMTP id smtpd.msgproc01-g2.7482.1789020029008167757
 for <openembedded-core@lists.openembedded.org>;
 Wed, 09 Sep 2026 23:00:29 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@yoctoproject.org header.s=lvjh2tk576v2ro5mi6k4dt3mc6wpqbky header.b=SYZEFkHN;
 dkim=pass header.i=@amazonses.com header.s=hsbnp7p3ensaochzwyq5wwmceodymuwv header.b=3INYNVOl;
 spf=pass (domain: us-west-2.amazonses.com, ip: 54.240.27.31, mailfrom: 010101a089e73d2d-4b5b9b39-151a-47f1-b985-06e24e4d108c-000000@us-west-2.amazonses.com)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/simple;
	s=lvjh2tk576v2ro5mi6k4dt3mc6wpqbky; d=yoctoproject.org;
	t=1789020028;
	h=Content-Type:MIME-Version:From:To:Cc:Subject:Message-Id:Date;
	bh=XVW4VBS0jWCiO6wgo6vSApXRK1RcHVTmAGkZeHdEO9A=;
	b=SYZEFkHNL1iW8IaLXF5TokR7iIezXgWAvsh0WmbOzN/A7vV3Xjo2b3Hb2CUvyfsR
	Lf4xyL2M+QRGEanNonZj6E1Nl6XKwJHzAs2oUTBRizg5cIQqJUmbUx68v4UPW69uSRE
	lXb3MJ4h7H1dZO9hzIcGdcd+YJeUa6MvuoU5Gr+w=
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/simple;
	s=hsbnp7p3ensaochzwyq5wwmceodymuwv; d=amazonses.com; t=1789020028;
	h=Content-Type:MIME-Version:From:To:Cc:Subject:Message-Id:Date:Feedback-ID;
	bh=XVW4VBS0jWCiO6wgo6vSApXRK1RcHVTmAGkZeHdEO9A=;
	b=3INYNVOlzAFUC8HlSq1u0qZn7rf1RTQ3O07fb9wxYdo1p6rBaRwVHC+hUKrub48r
	hC2d4osWh5UCDIymEOtXabwny72SNXN8rMVpat5PdeQbLhUcpD3gvX9Tg1jlVgxI698
	aFnN1EC0o5Da7h8NDvLSRqslHEsoUM7RwK4KDGOE=
Content-Type: multipart/mixed; boundary="===============2559691286835417350=="
MIME-Version: 1.0
From: auh@yoctoproject.org
To: Trevor Gamblin <tgamblin@baylibre.com>
Cc: openembedded-core@lists.openembedded.org
Subject: [AUH] python3-uv-build: upgrading to 0.12.12 SUCCEEDED
Message-ID: <010101a089e73d2d-4b5b9b39-151a-47f1-b985-06e24e4d108c-000000@us-west-2.amazonses.com>
Date: Thu, 10 Sep 2026 06:00:28 +0000
Feedback-ID: ::1.us-west-2.9np3MYPs3fEaOBysGKSlUD4KtcmPijcmS9Az2Hwf7iQ=:AmazonSES
X-SES-Outgoing: 2026.09.10-54.240.27.31
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Thu, 10 Sep 2026 06:00:33 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/245536

--===============2559691286835417350==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit

Hello,

this email is a notification from the Auto Upgrade Helper
that the automatic attempt to upgrade the recipe(s) *python3-uv-build* to *0.12.12* has Succeeded.

Next steps:
    - apply the patch: git am 0001-python3-uv-build-upgrade-0.12.10-0.12.12.patch
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
From 81bab94630ff16122c1dfdf77e4f9a237c58e3ec Mon Sep 17 00:00:00 2001
From: Upgrade Helper <auh@yoctoproject.org>
Date: Thu, 10 Sep 2026 05:42:15 +0000
Subject: [PATCH] python3-uv-build: upgrade 0.12.10 -> 0.12.12

---
 .../python/python3-uv-build-crates.inc        | 52 +++++++++++--------
 ...0.12.10.bb => python3-uv-build_0.12.12.bb} |  2 +-
 2 files changed, 31 insertions(+), 23 deletions(-)
 rename meta/recipes-devtools/python/{python3-uv-build_0.12.10.bb => python3-uv-build_0.12.12.bb} (92%)

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
diff --git a/meta/recipes-devtools/python/python3-uv-build_0.12.10.bb b/meta/recipes-devtools/python/python3-uv-build_0.12.12.bb
similarity index 92%
rename from meta/recipes-devtools/python/python3-uv-build_0.12.10.bb
rename to meta/recipes-devtools/python/python3-uv-build_0.12.12.bb
index 12cf5c7cc3..f75eab5ee8 100644
--- a/meta/recipes-devtools/python/python3-uv-build_0.12.10.bb
+++ b/meta/recipes-devtools/python/python3-uv-build_0.12.12.bb
@@ -11,7 +11,7 @@ LIC_FILES_CHKSUM = "file://LICENSE-APACHE;md5=86d3f3a95c324c9479bd8986968f4327 \
                     file://crates/uv-pep508/License-Apache;md5=e23fadd6ceef8c618fc1c65191d846fa \
                     file://crates/uv-pep508/License-BSD;md5=ef7a6027dc4c2389b9afad7e690274c7"
 
-SRC_URI[sha256sum] = "c83c0f1dd2c921091d1974f56d64221c010e173d9e6d52ec2a2582650c2d5197"
+SRC_URI[sha256sum] = "cbcfa5191898d5ca277faebdc6ca612dd4afb1fad25cd7948f43484a8da022c3"
 
 require ${BPN}-crates.inc
 
-- 
2.47.1


--===============2559691286835417350==
Content-Type: application/octet-stream
MIME-Version: 1.0
Content-Transfer-Encoding: base64
Content-Disposition: attachment;
 filename="0001-python3-uv-build-upgrade-0.12.10-0.12.12.patch"

RnJvbSA4MWJhYjk0NjMwZmYxNjEyMmMxZGZkZjc3ZTRmOWEyMzdjNThlM2VjIE1vbiBTZXAgMTcg
MDA6MDA6MDAgMjAwMQpGcm9tOiBVcGdyYWRlIEhlbHBlciA8YXVoQHlvY3RvcHJvamVjdC5vcmc+
CkRhdGU6IFRodSwgMTAgU2VwIDIwMjYgMDU6NDI6MTUgKzAwMDAKU3ViamVjdDogW1BBVENIXSBw
eXRob24zLXV2LWJ1aWxkOiB1cGdyYWRlIDAuMTIuMTAgLT4gMC4xMi4xMgoKLS0tCiAuLi4vcHl0
aG9uL3B5dGhvbjMtdXYtYnVpbGQtY3JhdGVzLmluYyAgICAgICAgfCA1MiArKysrKysrKysrKy0t
LS0tLS0tCiAuLi4wLjEyLjEwLmJiID0+IHB5dGhvbjMtdXYtYnVpbGRfMC4xMi4xMi5iYn0gfCAg
MiArLQogMiBmaWxlcyBjaGFuZ2VkLCAzMSBpbnNlcnRpb25zKCspLCAyMyBkZWxldGlvbnMoLSkK
IHJlbmFtZSBtZXRhL3JlY2lwZXMtZGV2dG9vbHMvcHl0aG9uL3tweXRob24zLXV2LWJ1aWxkXzAu
MTIuMTAuYmIgPT4gcHl0aG9uMy11di1idWlsZF8wLjEyLjEyLmJifSAoOTIlKQoKZGlmZiAtLWdp
dCBhL21ldGEvcmVjaXBlcy1kZXZ0b29scy9weXRob24vcHl0aG9uMy11di1idWlsZC1jcmF0ZXMu
aW5jIGIvbWV0YS9yZWNpcGVzLWRldnRvb2xzL3B5dGhvbi9weXRob24zLXV2LWJ1aWxkLWNyYXRl
cy5pbmMKaW5kZXggMTNjNGFmNWRiYy4uMDJlOGY5YThhYiAxMDA2NDQKLS0tIGEvbWV0YS9yZWNp
cGVzLWRldnRvb2xzL3B5dGhvbi9weXRob24zLXV2LWJ1aWxkLWNyYXRlcy5pbmMKKysrIGIvbWV0
YS9yZWNpcGVzLWRldnRvb2xzL3B5dGhvbi9weXRob24zLXV2LWJ1aWxkLWNyYXRlcy5pbmMKQEAg
LTI5LDE2ICsyOSwxNiBAQCBTUkNfVVJJICs9ICIgXAogICAgIGNyYXRlOi8vY3JhdGVzLmlvL2Jv
eGNhci8wLjIuMTQgXAogICAgIGNyYXRlOi8vY3JhdGVzLmlvL2JzdHIvMS4xMi4xIFwKICAgICBj
cmF0ZTovL2NyYXRlcy5pby9idW1wYWxvLzMuMjAuMiBcCi0gICAgY3JhdGU6Ly9jcmF0ZXMuaW8v
Ynl0ZWNoZWNrLzAuOC4yIFwKLSAgICBjcmF0ZTovL2NyYXRlcy5pby9ieXRlY2hlY2tfZGVyaXZl
LzAuOC4yIFwKKyAgICBjcmF0ZTovL2NyYXRlcy5pby9ieXRlY2hlY2svMC44LjMgXAorICAgIGNy
YXRlOi8vY3JhdGVzLmlvL2J5dGVjaGVja19kZXJpdmUvMC44LjMgXAogICAgIGNyYXRlOi8vY3Jh
dGVzLmlvL2J5dGVzLzEuMTIuMSBcCiAgICAgY3JhdGU6Ly9jcmF0ZXMuaW8vY2FwLXByaW1pdGl2
ZXMvNC4wLjMgXAogICAgIGNyYXRlOi8vY3JhdGVzLmlvL2NhcC1zdGQvNC4wLjMgXAogICAgIGNy
YXRlOi8vY3JhdGVzLmlvL2NjLzEuMi41NyBcCiAgICAgY3JhdGU6Ly9jcmF0ZXMuaW8vY2ZnLWlm
LzEuMC40IFwKICAgICBjcmF0ZTovL2NyYXRlcy5pby9jaGFyc2V0LzAuMS41IFwKLSAgICBjcmF0
ZTovL2NyYXRlcy5pby9jbGFwLzQuNi41IFwKLSAgICBjcmF0ZTovL2NyYXRlcy5pby9jbGFwX2J1
aWxkZXIvNC42LjUgXAorICAgIGNyYXRlOi8vY3JhdGVzLmlvL2NsYXAvNC42LjYgXAorICAgIGNy
YXRlOi8vY3JhdGVzLmlvL2NsYXBfYnVpbGRlci80LjYuNiBcCiAgICAgY3JhdGU6Ly9jcmF0ZXMu
aW8vY2xhcF9kZXJpdmUvNC42LjQgXAogICAgIGNyYXRlOi8vY3JhdGVzLmlvL2NsYXBfbGV4LzEu
MS4wIFwKICAgICBjcmF0ZTovL2NyYXRlcy5pby9jb2xvcmNob2ljZS8xLjAuNSBcCkBAIC01MSw3
ICs1MSw3IEBAIFNSQ19VUkkgKz0gIiBcCiAgICAgY3JhdGU6Ly9jcmF0ZXMuaW8vY3J5cHRvLWNv
bW1vbi8wLjIuMiBcCiAgICAgY3JhdGU6Ly9jcmF0ZXMuaW8vY3N2LzEuNC4wIFwKICAgICBjcmF0
ZTovL2NyYXRlcy5pby9jc3YtY29yZS8wLjEuMTMgXAotICAgIGNyYXRlOi8vY3JhdGVzLmlvL2Rh
dGEtZW5jb2RpbmcvMi4xMS4wIFwKKyAgICBjcmF0ZTovL2NyYXRlcy5pby9kYXRhLWVuY29kaW5n
LzIuMTEuMSBcCiAgICAgY3JhdGU6Ly9jcmF0ZXMuaW8vZGVmbXQvMS4xLjAgXAogICAgIGNyYXRl
Oi8vY3JhdGVzLmlvL2RlZm10LW1hY3Jvcy8xLjEuMCBcCiAgICAgY3JhdGU6Ly9jcmF0ZXMuaW8v
ZGVmbXQtcGFyc2VyLzEuMC4wIFwKQEAgLTYzLDcgKzYzLDcgQEAgU1JDX1VSSSArPSAiIFwKICAg
ICBjcmF0ZTovL2NyYXRlcy5pby9laXRoZXIvMS4xNy4wIFwKICAgICBjcmF0ZTovL2NyYXRlcy5p
by9lbmNvZGVfdW5pY29kZS8xLjAuMCBcCiAgICAgY3JhdGU6Ly9jcmF0ZXMuaW8vZW5jb2Rpbmdf
cnMvMC44LjM1IFwKLSAgICBjcmF0ZTovL2NyYXRlcy5pby9lbmNvZGluZ19yc19pby8wLjEuNyBc
CisgICAgY3JhdGU6Ly9jcmF0ZXMuaW8vZW5jb2RpbmdfcnNfaW8vMC4xLjggXAogICAgIGNyYXRl
Oi8vY3JhdGVzLmlvL2VudW1mbGFnczIvMC43LjEyIFwKICAgICBjcmF0ZTovL2NyYXRlcy5pby9l
bnVtZmxhZ3MyX2Rlcml2ZS8wLjcuMTIgXAogICAgIGNyYXRlOi8vY3JhdGVzLmlvL2VxdWl2YWxl
bnQvMS4wLjIgXApAQCAtODksOCArODksOSBAQCBTUkNfVVJJICs9ICIgXAogICAgIGNyYXRlOi8v
Y3JhdGVzLmlvL2Z1dHVyZXMtdGFzay8wLjMuMzMgXAogICAgIGNyYXRlOi8vY3JhdGVzLmlvL2Z1
dHVyZXMtdXRpbC8wLjMuMzMgXAogICAgIGNyYXRlOi8vY3JhdGVzLmlvL2dlbmVyaWMtYXJyYXkv
MC4xNC43IFwKKyAgICBjcmF0ZTovL2NyYXRlcy5pby9nZXRyYW5kb20vMC4zLjQgXAogICAgIGNy
YXRlOi8vY3JhdGVzLmlvL2dldHJhbmRvbS8wLjQuMyBcCi0gICAgY3JhdGU6Ly9jcmF0ZXMuaW8v
Z2xvYnNldC8wLjQuMTkgXAorICAgIGNyYXRlOi8vY3JhdGVzLmlvL2dsb2JzZXQvMC40LjIwIFwK
ICAgICBjcmF0ZTovL2NyYXRlcy5pby9nbG9vLXRpbWVycy8wLjMuMCBcCiAgICAgY3JhdGU6Ly9j
cmF0ZXMuaW8vaGFzaGJyb3duLzAuMTUuNSBcCiAgICAgY3JhdGU6Ly9jcmF0ZXMuaW8vaGFzaGJy
b3duLzAuMTcuMSBcCkBAIC0xNjYsNiArMTY3LDcgQEAgU1JDX1VSSSArPSAiIFwKICAgICBjcmF0
ZTovL2NyYXRlcy5pby9wdHJfbWV0YV9kZXJpdmUvMC4zLjEgXAogICAgIGNyYXRlOi8vY3JhdGVz
LmlvL3F1b3RlLzEuMC40NyBcCiAgICAgY3JhdGU6Ly9jcmF0ZXMuaW8vcXVvdGVkX3ByaW50YWJs
ZS8wLjUuMSBcCisgICAgY3JhdGU6Ly9jcmF0ZXMuaW8vci1lZmkvNS4zLjAgXAogICAgIGNyYXRl
Oi8vY3JhdGVzLmlvL3ItZWZpLzYuMC4wIFwKICAgICBjcmF0ZTovL2NyYXRlcy5pby9yYW5jb3Iv
MC4xLjEgXAogICAgIGNyYXRlOi8vY3JhdGVzLmlvL3JlZG94X3N5c2NhbGwvMC41LjE1IFwKQEAg
LTE3MywxMSArMTc1LDExIEBAIFNSQ19VUkkgKz0gIiBcCiAgICAgY3JhdGU6Ly9jcmF0ZXMuaW8v
cmVmLWNhc3QtaW1wbC8xLjAuMjYgXAogICAgIGNyYXRlOi8vY3JhdGVzLmlvL3JlZmxpbmstY29w
eS8wLjEuMzAgXAogICAgIGNyYXRlOi8vY3JhdGVzLmlvL3JlZ2V4LzEuMTMuMSBcCi0gICAgY3Jh
dGU6Ly9jcmF0ZXMuaW8vcmVnZXgtYXV0b21hdGEvMC40LjE2IFwKKyAgICBjcmF0ZTovL2NyYXRl
cy5pby9yZWdleC1hdXRvbWF0YS8wLjQuMTggXAogICAgIGNyYXRlOi8vY3JhdGVzLmlvL3JlZ2V4
LXN5bnRheC8wLjguMTEgXAogICAgIGNyYXRlOi8vY3JhdGVzLmlvL3JlbmQvMC41LjMgXAotICAg
IGNyYXRlOi8vY3JhdGVzLmlvL3JreXYvMC44LjE3IFwKLSAgICBjcmF0ZTovL2NyYXRlcy5pby9y
a3l2X2Rlcml2ZS8wLjguMTcgXAorICAgIGNyYXRlOi8vY3JhdGVzLmlvL3JreXYvMC44LjE4IFwK
KyAgICBjcmF0ZTovL2NyYXRlcy5pby9ya3l2X2Rlcml2ZS8wLjguMTggXAogICAgIGNyYXRlOi8v
Y3JhdGVzLmlvL3J1c3RjLWhhc2gvMi4xLjMgXAogICAgIGNyYXRlOi8vY3JhdGVzLmlvL3J1c3Rp
eC8xLjEuNCBcCiAgICAgY3JhdGU6Ly9jcmF0ZXMuaW8vcnVzdGl4LWxpbnV4LXByb2Nmcy8wLjEu
MSBcCkBAIC0yMDcsNyArMjA5LDcgQEAgU1JDX1VSSSArPSAiIFwKICAgICBjcmF0ZTovL2NyYXRl
cy5pby9zbGFiLzAuNC4xMiBcCiAgICAgY3JhdGU6Ly9jcmF0ZXMuaW8vc21hbGx2ZWMvMS4xNS4y
IFwKICAgICBjcmF0ZTovL2NyYXRlcy5pby9zbWF3ay8wLjMuMiBcCi0gICAgY3JhdGU6Ly9jcmF0
ZXMuaW8vc3BkeC8wLjEzLjQgXAorICAgIGNyYXRlOi8vY3JhdGVzLmlvL3NwZHgvMC4xMy41IFwK
ICAgICBjcmF0ZTovL2NyYXRlcy5pby9zdGFibGVfZGVyZWZfdHJhaXQvMS4yLjEgXAogICAgIGNy
YXRlOi8vY3JhdGVzLmlvL3N0cmlwLWFuc2ktZXNjYXBlcy8wLjIuMSBcCiAgICAgY3JhdGU6Ly9j
cmF0ZXMuaW8vc3Ryc2ltLzAuMTEuMSBcCkBAIC0yNTgsNiArMjYwLDcgQEAgU1JDX1VSSSArPSAi
IFwKICAgICBjcmF0ZTovL2NyYXRlcy5pby92dGUvMC4xNC4xIFwKICAgICBjcmF0ZTovL2NyYXRl
cy5pby93YWxrZGlyLzIuNS4wIFwKICAgICBjcmF0ZTovL2NyYXRlcy5pby93YXNpLzAuMTEuMSt3
YXNpLXNuYXBzaG90LXByZXZpZXcxIFwKKyAgICBjcmF0ZTovL2NyYXRlcy5pby93YXNpcDIvMS4w
LjQrd2FzaS0wLjIuMTIgXAogICAgIGNyYXRlOi8vY3JhdGVzLmlvL3dhc20tYmluZGdlbi8wLjIu
MTE0IFwKICAgICBjcmF0ZTovL2NyYXRlcy5pby93YXNtLWJpbmRnZW4tbWFjcm8vMC4yLjExNCBc
CiAgICAgY3JhdGU6Ly9jcmF0ZXMuaW8vd2FzbS1iaW5kZ2VuLW1hY3JvLXN1cHBvcnQvMC4yLjEx
NCBcCkBAIC0yOTgsNiArMzAxLDcgQEAgU1JDX1VSSSArPSAiIFwKICAgICBjcmF0ZTovL2NyYXRl
cy5pby93aW5kb3dzX3g4Nl82NF9tc3ZjLzAuNTMuMSBcCiAgICAgY3JhdGU6Ly9jcmF0ZXMuaW8v
d2lubm93LzEuMC4zIFwKICAgICBjcmF0ZTovL2NyYXRlcy5pby93aW54LzAuMzYuNCBcCisgICAg
Y3JhdGU6Ly9jcmF0ZXMuaW8vd2l0LWJpbmRnZW4vMC41Ny4xIFwKICAgICBjcmF0ZTovL2NyYXRl
cy5pby93cml0ZWFibGUvMC42LjIgXAogICAgIGNyYXRlOi8vY3JhdGVzLmlvL3hhdHRyLzEuNi4x
IFwKICAgICBjcmF0ZTovL2NyYXRlcy5pby95b2tlLzAuOC4xIFwKQEAgLTM0MywxNiArMzQ3LDE2
IEBAIFNSQ19VUklbYmxvY2stYnVmZmVyLTAuMTIuMS5zaGEyNTZzdW1dID0gImQyZjZjN2RiZTk1
YTZlZDY3YWQ5ZjE4ZTU3ZGFmOTNhMmYwMzRjCiBTUkNfVVJJW2JveGNhci0wLjIuMTQuc2hhMjU2
c3VtXSA9ICIzNmY2NGJlYWU0MGE4NGRhMWI0YjI2ZmYyNzYxYTViODk1YzEyYWRjNDFkYzI1YWFl
ZTFjNGYyYmJmZTk3YTZlIgogU1JDX1VSSVtic3RyLTEuMTIuMS5zaGEyNTZzdW1dID0gIjYzMDQ0
ZTFhZThlNjlmM2I1YTkyYzczNmNhNjI2OWI4ZDEyZmE3ZWZlMzliZjM0ZGRiMDZkMTAyY2YwZTJj
YWIiCiBTUkNfVVJJW2J1bXBhbG8tMy4yMC4yLnNoYTI1NnN1bV0gPSAiNWQyMDc4OTg2OGY0YjAx
YjJmMmNhZWM5ZjVjNGUwMjEzYjQxZTNlNTcwMmE1MDE1N2Q2OTlhZTMxY2VkMmZjYiIKLVNSQ19V
UklbYnl0ZWNoZWNrLTAuOC4yLnNoYTI1NnN1bV0gPSAiMGNhYTMzYTJjMGVkY2EwNDE5ZDE1YWM3
MjNkZmYwM2YxOTU2Zjc5NzgzMjliMWUzYjVmZGFhYWVkOWQzY2E4YiIKLVNSQ19VUklbYnl0ZWNo
ZWNrX2Rlcml2ZS0wLjguMi5zaGEyNTZzdW1dID0gIjg5Mzg1ZTgyYjVkMTgyMWQyMjE5ZTBiMDk1
ZWZhMmNjMWYyNDZjYmY5OTA4MGYzYmU0NmExYTg1YzBkMzkyZDkiCitTUkNfVVJJW2J5dGVjaGVj
ay0wLjguMy5zaGEyNTZzdW1dID0gIjI2MzMzZWVhYzc1NGYwYWQ4YTZiY2QwZWIwYWMwMTIxNTYz
MDJlNGUxNmI4NTJiNzJlZTM5OWFlYTRmMTJjMjkiCitTUkNfVVJJW2J5dGVjaGVja19kZXJpdmUt
MC44LjMuc2hhMjU2c3VtXSA9ICI0NmQwNzkxOGNhYTllZWFhZjA2Yjc4NzM5MjVjNTNhNjFkYWFj
MTczNTM5YjRmNzcxNTA5MDc0NWU0NGU0ZTY5IgogU1JDX1VSSVtieXRlcy0xLjEyLjEuc2hhMjU2
c3VtXSA9ICJmYzY1MmE0OGMzNTJhZWYzZWEzYWVkMzIwODA1MDFjZjNlZjZlZDVkYTc4NjAyYTAy
MGM5OTE3NzViMGFmZjA0IgogU1JDX1VSSVtjYXAtcHJpbWl0aXZlcy00LjAuMy5zaGEyNTZzdW1d
ID0gIjhiNWY3NDcyOWZkMmY0NDcwMWQxYThlYjQ3ZTkwNmNkYjNjY2Q5ZWMwZjAyYmFhZDg1YTc0
NGI3OTE5NDBiMTgiCiBTUkNfVVJJW2NhcC1zdGQtNC4wLjMuc2hhMjU2c3VtXSA9ICJjMWVjNzhl
MjQyY2ZhMmNmZTI3NjgwN2FjMmVjYzAwMzE1YTZjOTc3ODY5Nzc0MTRiY2QxYzM5NjNiNmM5MWI4
IgogU1JDX1VSSVtjYy0xLjIuNTcuc2hhMjU2c3VtXSA9ICI3YTBkZDFjYTM4NDkzMmZmMzY0MWM4
NzE4YTAyNzY5ZjE2OThlNzU2M2RjNjk3NGZmZDAzMzQ2MTE2MzEwNDIzIgogU1JDX1VSSVtjZmct
aWYtMS4wLjQuc2hhMjU2c3VtXSA9ICI5MzMwZjhiMmZmMTNmMzQ1NDBiNDRlOTQ2ZWYzNTExMTgy
NTcyN2IzOGQzMzI4NmVmOTg2MTQyNjE1MTIxODAxIgogU1JDX1VSSVtjaGFyc2V0LTAuMS41LnNo
YTI1NnN1bV0gPSAiZjFmOTI3YjA3Yzc0YmE4NGM3ZTVmZTRkYjJiYWViM2U5OTZhYjI2ODg5OTJl
MzlhYzY4Y2UzMjIwYTY3N2M3ZSIKLVNSQ19VUklbY2xhcC00LjYuNS5zaGEyNTZzdW1dID0gIjMw
MWI1NjY1ODU5OGU0OGYzNjQ4NjQ3YWM2ZmM4ODdiZTdlNzEwOGVkZGZhNGU5YjYzZmNmM2VjNThj
MGNhZGYiCi1TUkNfVVJJW2NsYXBfYnVpbGRlci00LjYuNS5zaGEyNTZzdW1dID0gIjk0YTY1NDAz
ZDFhMWJkMjhmN2RjNjhlYjg1MDZlODg3NDgwOGVlNWVlY2I1OTI5OGRlNTg4ZTJlMTQwN2EwNzgi
CitTUkNfVVJJW2NsYXAtNC42LjYuc2hhMjU2c3VtXSA9ICI0NzNjN2UwN2Y0MDlhOGQ3NzIxNjE3
MjRhYThkYjZhNzY1YTI1MzJhNzBmOTY2N2VlYjdiNDlkM2QwMmZiZGNhIgorU1JDX1VSSVtjbGFw
X2J1aWxkZXItNC42LjYuc2hhMjU2c3VtXSA9ICI3YjQ4ZmVhNWE4OGU5YWU3MjhhMmRjYmVkYmZj
MGU3MzBmN2Q2MGRhNDJlMWNiMDQ5YTgzYzlmYjhiNzg5ODg5IgogU1JDX1VSSVtjbGFwX2Rlcml2
ZS00LjYuNC5zaGEyNTZzdW1dID0gImQwMTJkMmI5ZDY1YWNhN2YxOGY0ZDk4NzhhMDQ1YmMxNzg5
OWJiYTk1MTU2MWJhNWVjM2MyYmExZWVkOWEwNjEiCiBTUkNfVVJJW2NsYXBfbGV4LTEuMS4wLnNo
YTI1NnN1bV0gPSAiYzhkNGEzYmI4YjFlMGMxMDUwNDk5ZDE4MTVmNWFiMTZkMDRmMDk1OWIyMzMw
ODVmYjMxNjUzZmJmYzlkOThmOSIKIFNSQ19VUklbY29sb3JjaG9pY2UtMS4wLjUuc2hhMjU2c3Vt
XSA9ICIxZDA3NTUwYzkwMzZiZjJhZTBjNjg0YzQyOTdkNTAzZjgzODI4N2M4M2M1MzY4NmQwNTM3
MGQwZTEzOWFlNTcwIgpAQCAtMzY1LDcgKzM2OSw3IEBAIFNSQ19VUklbY3J5cHRvLWNvbW1vbi0w
LjEuNy5zaGEyNTZzdW1dID0gIjc4YzgyOTIwNTVkMWMxZGYwY2NlNWQxODAzOTNkYzhjY2UwYWJl
CiBTUkNfVVJJW2NyeXB0by1jb21tb24tMC4yLjIuc2hhMjU2c3VtXSA9ICJjZTZlNGM5NjFkNmNk
NmM5YTg2ZGI0MTgzODc0MjVlOGJkZWFmMDViM2M4YmMxNDExZTZkY2E0YzI1MmYxNDUzIgogU1JD
X1VSSVtjc3YtMS40LjAuc2hhMjU2c3VtXSA9ICI1MmNkOWQ2OGNmN2VmYzZkZGZhYWVlNDJlNzI4
OGQzYTk5ZDYxM2Q0YjUwZjc2Y2U5ODI3YWUwYzZlMTRmOTM4IgogU1JDX1VSSVtjc3YtY29yZS0w
LjEuMTMuc2hhMjU2c3VtXSA9ICI3MDRhM2MyNjk5NmE4MDQ3MTE4OTI2NTgxNGRiYzJjMjU3NTk4
Yjk2YjhhN2ZlYWUyZDMxYWNlNjQ2YmI5NzgyIgotU1JDX1VSSVtkYXRhLWVuY29kaW5nLTIuMTEu
MC5zaGEyNTZzdW1dID0gImE0YWU1ZjE1ZGRhM2M3MDhjMGFkZTg0YmZlZTMxY2NhYjQ0YTNkYTRm
ODgwMTVlZDIyZjYzNzMyYWJlMzAwYzgiCitTUkNfVVJJW2RhdGEtZW5jb2RpbmctMi4xMS4xLnNo
YTI1NnN1bV0gPSAiNDU4M2E0NTUxZGY0NmUyNzkyZjgyY2VlYWM0NWU4NTBkMmUyZDVkZWJiYTBi
OTFmMTAyMzg1Y2RhNWIxMWYwNiIKIFNSQ19VUklbZGVmbXQtMS4xLjAuc2hhMjU2c3VtXSA9ICJh
NmU1MjQ1MDY0OTBhMTk1M2QyMzdjYjg3YjFjZmMxZTQ2Zjg4YzE4ZjEwYTIyZGZlMGY1MDdkYzZi
ZmM3ZjdmIgogU1JDX1VSSVtkZWZtdC1tYWNyb3MtMS4xLjAuc2hhMjU2c3VtXSA9ICJmMGEyNzc3
MGU5YzhmNzE5YTc5ZDhiNjM4MjgxZjRkODI4Zjc3ZDhmZDYxZTBiZDk0NDUxYjliODVlNTc2YTBi
IgogU1JDX1VSSVtkZWZtdC1wYXJzZXItMS4wLjAuc2hhMjU2c3VtXSA9ICIxMGQ2MDMzNGIzYjJl
N2M5ZDkxZWY4MTUwYWJmYjZmYTRjMWMzOWViYmNmNGE4MWMyZTM0NmFhZDkzOWZlZTNlIgpAQCAt
Mzc3LDcgKzM4MSw3IEBAIFNSQ19VUklbZHluLWNsb25lLTEuMC4yMC5zaGEyNTZzdW1dID0gImQw
ODgxZWExODFiMWRmNzNmZjc3ZmZhYWY5Yzc1NDRlY2MxMWU4MmZiCiBTUkNfVVJJW2VpdGhlci0x
LjE3LjAuc2hhMjU2c3VtXSA9ICI5ZTVlOGY2YzE1YTI0YjlhM2VlNWVmZWM4MDljY2QwMDZkM2Iz
MGU4YjNiYjYzYzM5YWY3MzdjN2Y4N2RhYTFkIgogU1JDX1VSSVtlbmNvZGVfdW5pY29kZS0xLjAu
MC5zaGEyNTZzdW1dID0gIjM0YWE3MzY0NmZmYjAwNmI4ZjUxNDdmM2RjMTgyYmQ0YmNiMTkwMjI3
Y2U4NjFmYzRhNDg0NGJmOGUzY2IyYzAiCiBTUkNfVVJJW2VuY29kaW5nX3JzLTAuOC4zNS5zaGEy
NTZzdW1dID0gIjc1MDMwZjNjNGY0NWRhZmQ3NTg2ZGQ2NzgwOTY1YThjN2U4ZTI4NWE1ZWNiODY3
MTNlNjNhNzljNWIyNzY2ZjMiCi1TUkNfVVJJW2VuY29kaW5nX3JzX2lvLTAuMS43LnNoYTI1NnN1
bV0gPSAiMWNjM2M1NjUxZmI2MmFiOGFhMzEwMzk5OGRhZGU1N2VmZGQwMjg1NDRiZDMwMDUxNmJh
YTMxODQwYzI1MmE4MyIKK1NSQ19VUklbZW5jb2RpbmdfcnNfaW8tMC4xLjguc2hhMjU2c3VtXSA9
ICJmYmEzZmU4NDcwNDVlY2ZmNzk0YjljMTM4MjkzYTgwZGI5MTQ2NzhjNDUzYWQ2M2ZiZjBjNmE5
ZWI2ZTAwYjIyIgogU1JDX1VSSVtlbnVtZmxhZ3MyLTAuNy4xMi5zaGEyNTZzdW1dID0gIjEwMjdm
NzY4MGM4NTNlMDU2ZWJjZWM2ODM2MTVmYjZmYmJjMDdkYmFhMTNiNGQ1ZDk0NDJiMTQ2ZGVkNGVj
ZWYiCiBTUkNfVVJJW2VudW1mbGFnczJfZGVyaXZlLTAuNy4xMi5zaGEyNTZzdW1dID0gIjY3Yzc4
YTRkOGZkZjk5NTNhNWM5ZDQ1OGY5ZWZlOTQwZmQ5N2EwY2FiMDk0MWMwNzVhODEzYWM1OTQ3MzM4
MjciCiBTUkNfVVJJW2VxdWl2YWxlbnQtMS4wLjIuc2hhMjU2c3VtXSA9ICI4NzdhNGFjZTg3MTNi
MGJjZjJhNGU3ZWVjODI1MjljMDI5ZjFkMDYxOTg4NmQxODE0NWZlYTk2YzNmZmU1YzBmIgpAQCAt
NDAzLDggKzQwNyw5IEBAIFNSQ19VUklbZnV0dXJlcy1zaW5rLTAuMy4zMy5zaGEyNTZzdW1dID0g
ImUzNDQxOGFjNDk5ZDYzMDVjMmZiNWFkMGVkMmY2YWM5OThjNWY4CiBTUkNfVVJJW2Z1dHVyZXMt
dGFzay0wLjMuMzMuc2hhMjU2c3VtXSA9ICJiMjMxZWQyODgzMWVmYjRhNjFhMDg1ODBjNGJjMjMz
ZWM1NmJjMDA5ZjRjZDhmNTJkYTJjM2NiOTdkZjBjMTA5IgogU1JDX1VSSVtmdXR1cmVzLXV0aWwt
MC4zLjMzLnNoYTI1NnN1bV0gPSAiYTc3YTkwYTI1NmZjZTM0ZGE2NjQxNTI3MWUzMGY5NGVlOTFj
NTdiMDRiOGEyYzA0MmQ5Y2YzMjIwMTc5ZGVhYSIKIFNSQ19VUklbZ2VuZXJpYy1hcnJheS0wLjE0
Ljcuc2hhMjU2c3VtXSA9ICI4NTY0OWNhNTFmZDcyMjcyZDc4MjFhZGFmMjc0YWQ5MWMyODgyNzc3
MTNkOWMxODgyMGQ4NDk5YTdmZjY5ZTlhIgorU1JDX1VSSVtnZXRyYW5kb20tMC4zLjQuc2hhMjU2
c3VtXSA9ICI4OTlkZWY1YzM3YzRmZDdiMjY2NDY0OGMyODEyMGVjZWMxMzhlNGQzOTViNDU5ZTVj
YTM0ZjljY2UyZGQ3N2ZkIgogU1JDX1VSSVtnZXRyYW5kb20tMC40LjMuc2hhMjU2c3VtXSA9ICIz
MDBlODgzZDc1NmIyZTRlYzk0ZTAyNzkxZjM5YjA0YjUyMjI3NjEzODg1MmNmYzQxZDlmYjdlOTA0
MTA2MDk5IgotU1JDX1VSSVtnbG9ic2V0LTAuNC4xOS5zaGEyNTZzdW1dID0gImU0N2QzN2QyYWU0
NDY0MjU0ODg0YjYwYWI3MDcxYmUyYjg3NmE5YzM1YjY5NmJkMDE4ZGRjYzc2ODQ3MzA5Y2QiCitT
UkNfVVJJW2dsb2JzZXQtMC40LjIwLnNoYTI1NnN1bV0gPSAiMDdjMzRhOTQxMDQ2NWI0NWJkOTc4
NzQ0M2JjNzM3MGYzNzczNWJhZDA0YjBmMGNkNTdmZjFhMzE4NmM5ODk4OCIKIFNSQ19VUklbZ2xv
by10aW1lcnMtMC4zLjAuc2hhMjU2c3VtXSA9ICJiYmIxNDNjZjk2MDk5ODAyMDMzZTBkNGY0OTYz
YjE5ZmQyZTBiNzI4YmNmMDc2Y2Q5Y2Y3ZjY2MzRmMDkyOTk0IgogU1JDX1VSSVtoYXNoYnJvd24t
MC4xNS41LnNoYTI1NnN1bV0gPSAiOTIyOWNmZTUzZGZkNjlmMDYwOWE0OWY2NTQ2MWJkOTMwMDFl
YTFlZjg4OWNkNTUyOWRkMTc2NTkzZjUzMzhhMSIKIFNSQ19VUklbaGFzaGJyb3duLTAuMTcuMS5z
aGEyNTZzdW1dID0gImVkNTkwOWI2ZTg5YTJkYjQ0NTZlNTRjZDVmNjczNzkxZDdlY2E2NzMyMjAy
YmJmMmE5Y2M1MDRmZTJmOWI4NGEiCkBAIC00ODAsNiArNDg1LDcgQEAgU1JDX1VSSVtwdHJfbWV0
YS0wLjMuMS5zaGEyNTZzdW1dID0gIjBiOWEwY2Y5NWExMTk2YWY2MWQ0ZjFjYmRhYjk2NzE3OTUx
NmQ5YTRhNDMKIFNSQ19VUklbcHRyX21ldGFfZGVyaXZlLTAuMy4xLnNoYTI1NnN1bV0gPSAiNzM0
Nzg2N2QwYTdlMTIwOGQ5M2I0Njc2N2JlODNlMmI4Zjk3OGMzZGFkMzVmNzc1YWM4ZDg4NDc1NTFk
NmZlMSIKIFNSQ19VUklbcXVvdGUtMS4wLjQ3LnNoYTI1NnN1bV0gPSAiMWZiZjRkYjE0MmE0NzNh
OGQ4MGMyNmJiZjE4NDU0ZWQ0NThiZjhkMjZjODIxOWMzMzFkYWVjZmRiZDA3OTAwMSIKIFNSQ19V
UklbcXVvdGVkX3ByaW50YWJsZS0wLjUuMS5zaGEyNTZzdW1dID0gIjY0MGM5YmQ4NDk3YjAyNDY1
YWVlZjUzNzUxNDRjMjYwNjJlMGRjZDU5MzlkZmNiYjBmNWRiNzZjYjhjMTdjNzMiCitTUkNfVVJJ
W3ItZWZpLTUuMy4wLnNoYTI1NnN1bV0gPSAiNjljZGIzNGMxNThjZWIyODhkZjExZTE4YjRiZDM5
ZGU5OTRmNjY1N2Q4Mzg0N2JkZmZkYmQ3ZjM0Njc1NGIwZiIKIFNSQ19VUklbci1lZmktNi4wLjAu
c2hhMjU2c3VtXSA9ICJmOGRjYzljN2Q1MmE4MTE2OTdkMjE1MWM3MDFlMGQwODk1NmY5MmIwZTI0
MTM2Y2Y0Y2YyN2I1N2E2YTBkOWJmIgogU1JDX1VSSVtyYW5jb3ItMC4xLjEuc2hhMjU2c3VtXSA9
ICJhMDYzZWE3MjM4MTUyN2MyYTA1NjFkYTljODAwMDBlZjgyMmJkZDdjMzI0MWIxY2MxYjEyMTAw
ZTNkZjA4MWVlIgogU1JDX1VSSVtyZWRveF9zeXNjYWxsLTAuNS4xNS5zaGEyNTZzdW1dID0gIjdl
OGFmMGRkZTA5NDAwNjAxMWU2YTc0MGQ0ODc5MzE5NDM5NDg5ODEzYmQwYmNkYzdkODIxYmVhZWVm
ZjQ4ZWMiCkBAIC00ODcsMTEgKzQ5MywxMSBAQCBTUkNfVVJJW3JlZi1jYXN0LTEuMC4yNi5zaGEy
NTZzdW1dID0gIjIxNmU4Zjc3M2Q3OTIzYmNiYTljZWI4NmE4NmM5M2NhYmIzOTAzYTExOAogU1JD
X1VSSVtyZWYtY2FzdC1pbXBsLTEuMC4yNi5zaGEyNTZzdW1dID0gIjJjOTI4MzY4NWZlZWM3ZDY5
YWY3NWZiMGU4NThkNWU3Mzc4ZjMzZmU0ZmM2OTkzODNiMjkxNmFiOTI3M2UwM2MiCiBTUkNfVVJJ
W3JlZmxpbmstY29weS0wLjEuMzAuc2hhMjU2c3VtXSA9ICJkOWRkN2FiNGFmMDM2M2Q1Y2NmZDI4
MzhkNzgyYTI4MTk2Y2YzMmE1Y2MyZTRmZTNjNWRjODNmMmJlNTg4YjhiIgogU1JDX1VSSVtyZWdl
eC0xLjEzLjEuc2hhMjU2c3VtXSA9ICJmMDIwMjM3YjZjOGVlZDkzZGIyZTJjYjUzYzAwYzYwYThl
MWJjNzNkYTdkMDczMTk5YTExODA0MDE0NTAyMThkIgotU1JDX1VSSVtyZWdleC1hdXRvbWF0YS0w
LjQuMTYuc2hhMjU2c3VtXSA9ICI4ZmNmZGIzNmJkYTBjODgwYzU5MzFjZGM3YTJiY2RjOGJhNDU1
Njg0N2I5ZDkxMmJjYTcwYmM5NDcwODcxMWFkIgorU1JDX1VSSVtyZWdleC1hdXRvbWF0YS0wLjQu
MTguc2hhMjU2c3VtXSA9ICJhZDg1NTNiOWIyNjQxMzI1MWNiZjMwZTYyMDU5NWM3YTQxYjM4ODdm
MDNkYTA0NTc5YzBlNmIwZDZhMDZiNGIyIgogU1JDX1VSSVtyZWdleC1zeW50YXgtMC44LjExLnNo
YTI1NnN1bV0gPSAiZDZmNmZmOWEzNzg0ODViMjk4YTUyODY2NTZkYTY2NWJhNzQ0MTNkMzZkYjA5
Nzk2MzMyNzVkMmU3MDgxNDVkNCIKIFNSQ19VUklbcmVuZC0wLjUuMy5zaGEyNTZzdW1dID0gImNh
ZGFkZWYzMTdjMmYyMDc1NWE2NGQ3ZmRjNDhmOWU3MTc4ZWU2YjBlMWY3ZmNlMzNmYTYwZjFkNjhh
Mjc2ZTYiCi1TUkNfVVJJW3JreXYtMC44LjE3LnNoYTI1NnN1bV0gPSAiODE1Y2M4YTM3MTU5YTQ2
MzA2NDgyNTI0NmNhZGIwNzk2MWUyNWNkOTg4NTkwODYwNmY2ZDA4YTk4ZDhmODg3NCIKLVNSQ19V
Uklbcmt5dl9kZXJpdmUtMC44LjE3LnNoYTI1NnN1bV0gPSAiYzBlZDFhNzhhMWIxOWQxODRiMGRh
YTYyOWRkOWEwMjQ1NzMxNzNlYzdkNDg1YjI4N2NiMzY5ZmIzNjA3Y2MxYyIKK1NSQ19VUklbcmt5
di0wLjguMTguc2hhMjU2c3VtXSA9ICJkOTc3NjA5M2I3Y2ExNzA0NTRhYjE0MDY5NTRmN2I3ZDk3
YTU3YzUxZGM2YzA2NDI5NTdmYjJlZjI1YzJkMzk5IgorU1JDX1VSSVtya3l2X2Rlcml2ZS0wLjgu
MTguc2hhMjU2c3VtXSA9ICIxYzI1ZWY2MDRhYzdkZDgzOWQ0NGQ2NDY0ODk1MmVhMjNjOTc4NjZm
MTI0ZmY2NzFiMGVkMmNmM2FkOWJiMDZlIgogU1JDX1VSSVtydXN0Yy1oYXNoLTIuMS4zLnNoYTI1
NnN1bV0gPSAiNmIxZTdmOWE0Mjg1NzFiZTJkYzViYzA1MDVjMTNmYjZiZjkzNjgyMmI4OTRlYzg3
YWJmOGEwOGE0ZTUxNzQyZCIKIFNSQ19VUklbcnVzdGl4LTEuMS40LnNoYTI1NnN1bV0gPSAiYjZm
ZTQ1NjViOTUxOGI4M2VmNGY5MWJiNDdjZTI5NjIwY2E4MjhiZDMyY2I3ZTQwOGYwMDYyZTk5MzBi
YTE5MCIKIFNSQ19VUklbcnVzdGl4LWxpbnV4LXByb2Nmcy0wLjEuMS5zaGEyNTZzdW1dID0gIjJm
Yzg0YmY3ZTlhYTE2YzRmMmM3NThmMjc0MTJkYzk4NDEzNDFlMTZhYTY4MmQ5YzdhYzMwOGZlM2Vl
MTIwNTYiCkBAIC01MjEsNyArNTI3LDcgQEAgU1JDX1VSSVtzaW1pbGFyLTIuNy4wLnNoYTI1NnN1
bV0gPSAiYmJiYjVkOTY1OTE0MTY0NmFlNjQ3YjQyZmUwOTRkYWY2YzYxOTJkMTYyMDgKIFNSQ19V
Uklbc2xhYi0wLjQuMTIuc2hhMjU2c3VtXSA9ICIwYzc5MGRlMjMxMjRmOWFiNDQ1NDRkN2FjMDVk
NjA0NDBhZGM1ODY0NzljZTUwMWMxZDZkN2RhM2NkOGM5Y2Y1IgogU1JDX1VSSVtzbWFsbHZlYy0x
LjE1LjIuc2hhMjU2c3VtXSA9ICI4ZWQ2YTYzZjAyYzg1MzljOTFhODY4NWE4NmY0MDk5NjYxYmEz
ZGEwMTc5MzJmNmViYmVhNmRlM2YwZmE3YzkwIgogU1JDX1VSSVtzbWF3ay0wLjMuMi5zaGEyNTZz
dW1dID0gImI3YzM4OGMxYjVlOTM3NTZkMGM3NDA5NjVjNDFlODgyMmY4NjY2MjFkNDFhY2JkZjYz
MzZhNmExNjhmODg0MGMiCi1TUkNfVVJJW3NwZHgtMC4xMy40LnNoYTI1NnN1bV0gPSAiYThkYTU5
M2UzMGJlYjc5MGZjOTQyNDUwMmViODk4MzIwYjQ0ZTVlYjMwMzY3ZGJkYTFjMWVkZGU4ZTJmMzJk
NyIKK1NSQ19VUklbc3BkeC0wLjEzLjUuc2hhMjU2c3VtXSA9ICIwODE2NzBjMjMzZGZiZWQ1NTY5
MGNjMGNkMzg0MjRlMGUyNGFjMWIyNjczZDBiNDA4YjNmN2I2ODQ3MzhkZmE5IgogU1JDX1VSSVtz
dGFibGVfZGVyZWZfdHJhaXQtMS4yLjEuc2hhMjU2c3VtXSA9ICI2Y2UyYmU4ZGMyNTQ1NWUxZjkx
ZGY3MWJmYTEyYWQzN2Q3YWYxMDkyYWU3MzZmM2E2Y2QwZTM3YmM3ODEwNTk2IgogU1JDX1VSSVtz
dHJpcC1hbnNpLWVzY2FwZXMtMC4yLjEuc2hhMjU2c3VtXSA9ICIyYThmODAzOGU3ZTc5NjlhYmIz
ZjFiN2MyYTgxMTIyNWU5Mjk2ZGEyMDg1MzllMGY3OWM1MjUxZDZjYWMwMDI1IgogU1JDX1VSSVtz
dHJzaW0tMC4xMS4xLnNoYTI1NnN1bV0gPSAiN2RhOGI1NzM2ODQ1ZDlmMmZjYjgzN2VhNWQ5ZTI2
Mjg1NjRiM2IwNDNhNzA5NDhhM2YwYjc3ODgzOGM1ZmI0ZiIKQEAgLTU3Miw2ICs1NzgsNyBAQCBT
UkNfVVJJW3ZlcnNpb25fY2hlY2stMC45LjUuc2hhMjU2c3VtXSA9ICIwYjkyOGYzM2Q5NzVmYzZh
ZDlmODZjOGYyODM4NTNhZDI2YmRkNQogU1JDX1VSSVt2dGUtMC4xNC4xLnNoYTI1NnN1bV0gPSAi
MjMxZmRjZDdlZjMwMzdlODMzMGQ4ZTE3ZTYxMDExYTJjMjQ0MTI2YWNjMGE5ODJmNDA0MGFjM2Y5
ZjBiYzA3NyIKIFNSQ19VUklbd2Fsa2Rpci0yLjUuMC5zaGEyNTZzdW1dID0gIjI5NzkwOTQ2NDA0
ZjkxZDljNWQwNmY5ODc0ZWZkZGVhMWRjMDZjNWVmZTk0NTQxYTdkNjg2MzEwOGUzYTVlNGIiCiBT
UkNfVVJJW3dhc2ktMC4xMS4xK3dhc2ktc25hcHNob3QtcHJldmlldzEuc2hhMjU2c3VtXSA9ICJj
Y2YzZWM2NTFhODQ3ZWIwMWRlNzNjY2FkMTVlYjdkOTlmODA0ODVkZTA0M2VmYjJmMzcwY2Q2NTRm
NGVhNDRiIgorU1JDX1VSSVt3YXNpcDItMS4wLjQrd2FzaS0wLjIuMTIuc2hhMjU2c3VtXSA9ICJi
NjdlZmIzN2UxMDZlNTVjZTcyMmE1MTBkNmI1ZjljMTdmMDgzZTVmYzc5YWZjMmJhZGViMTJjYzMx
M2Q5NDg3IgogU1JDX1VSSVt3YXNtLWJpbmRnZW4tMC4yLjExNC5zaGEyNTZzdW1dID0gIjY1MzJm
OWE1YzFlY2UzNzk4Y2IxYzJjZmRiYTY0MGI5YjNiYTg4NGY1ZGI0NTk3M2E2ZjQ0MjUxMGE4N2Qz
OGUiCiBTUkNfVVJJW3dhc20tYmluZGdlbi1tYWNyby0wLjIuMTE0LnNoYTI1NnN1bV0gPSAiMThh
MmQ1MGZjZjEwNWZiMzNiYjE1ZjAwZTdhNzdiNzcyOTQ1YTJlZTQ1ZGNmNDU0OTYxZmQ4NDNlNzRj
MThlNiIKIFNSQ19VUklbd2FzbS1iaW5kZ2VuLW1hY3JvLXN1cHBvcnQtMC4yLjExNC5zaGEyNTZz
dW1dID0gIjAzY2U0Y2FlYWFjNTQ3Y2RmNzEzZDI4MGVkYTIyYTczMDgyNGRkMTFlNmI4YzNjYTll
NDIyNDdiMjVjNjMxZTMiCkBAIC02MTIsNiArNjE5LDcgQEAgU1JDX1VSSVt3aW5kb3dzX3g4Nl82
NF9tc3ZjLTAuNTIuNi5zaGEyNTZzdW1dID0gIjU4OWY2ZGE4NGM2NDYyMDQ3NDdkMTI3MGEyYTU2
NjEKIFNSQ19VUklbd2luZG93c194ODZfNjRfbXN2Yy0wLjUzLjEuc2hhMjU2c3VtXSA9ICJkNmJi
ZmY1ZjBhYWRhNDI3YTFlNWE2ZGE1ZjFmOTgxNTgxODJmMjY1NTZmMzQ1YWM5ZTA0ZDM2ZDBlYmVk
NjUwIgogU1JDX1VSSVt3aW5ub3ctMS4wLjMuc2hhMjU2c3VtXSA9ICIwNTkyZTFjOWQxNTFmODU0
ZTZmZDM4MjU3NGMzYTA4NTUyNTBlMWQ5YjJmOTlkOTI4MWM2ZTYzOTFhZjM1MmYxIgogU1JDX1VS
SVt3aW54LTAuMzYuNC5zaGEyNTZzdW1dID0gIjNmM2ZkMzc2ZjcxOTU4Yjg2MmU3YWZiMjBjZmU1
YTIyODMwZTE5NjM0NjJmM2ExN2Y0OWQ4MmE2YzFkMWY0MmQiCitTUkNfVVJJW3dpdC1iaW5kZ2Vu
LTAuNTcuMS5zaGEyNTZzdW1dID0gIjFlYmY5NDRlODdhN2MyNTMyMzNhZDY3NjZlMDgyZTNjZDcx
NGI1ZDAzODEyYWNjMjRjMzE4ZjU0OTYxNDUzNmUiCiBTUkNfVVJJW3dyaXRlYWJsZS0wLjYuMi5z
aGEyNTZzdW1dID0gIjllZGRlMGRiNDc2OWQyZGM2ODU3OTg5M2YyMzA2YjI2YzZlY2ZiZTBlZjQ5
OWIwMTNkNzMxYjdiOTI0N2UwYjkiCiBTUkNfVVJJW3hhdHRyLTEuNi4xLnNoYTI1NnN1bV0gPSAi
MzJlNDVhZDQyMDZmNmQyNDc5MDg1MTQ3ZjAyYmMyZWY4MzRhYzg1ODg2NjI0YTIzNTc1YWUxMzdj
OGFhODE1NiIKIFNSQ19VUklbeW9rZS0wLjguMS5zaGEyNTZzdW1dID0gIjcyZDZlNWM2YWZiODRk
NzM5NDRlNWNlZGIwNTJjNDY4MGQ1NjU3MzM3MjAxNTU1ZjlmMmExNmI3NDA2ZDQ5NTQiCmRpZmYg
LS1naXQgYS9tZXRhL3JlY2lwZXMtZGV2dG9vbHMvcHl0aG9uL3B5dGhvbjMtdXYtYnVpbGRfMC4x
Mi4xMC5iYiBiL21ldGEvcmVjaXBlcy1kZXZ0b29scy9weXRob24vcHl0aG9uMy11di1idWlsZF8w
LjEyLjEyLmJiCnNpbWlsYXJpdHkgaW5kZXggOTIlCnJlbmFtZSBmcm9tIG1ldGEvcmVjaXBlcy1k
ZXZ0b29scy9weXRob24vcHl0aG9uMy11di1idWlsZF8wLjEyLjEwLmJiCnJlbmFtZSB0byBtZXRh
L3JlY2lwZXMtZGV2dG9vbHMvcHl0aG9uL3B5dGhvbjMtdXYtYnVpbGRfMC4xMi4xMi5iYgppbmRl
eCAxMmNmNWM3Y2MzLi5mNzVlYWI1ZWU4IDEwMDY0NAotLS0gYS9tZXRhL3JlY2lwZXMtZGV2dG9v
bHMvcHl0aG9uL3B5dGhvbjMtdXYtYnVpbGRfMC4xMi4xMC5iYgorKysgYi9tZXRhL3JlY2lwZXMt
ZGV2dG9vbHMvcHl0aG9uL3B5dGhvbjMtdXYtYnVpbGRfMC4xMi4xMi5iYgpAQCAtMTEsNyArMTEs
NyBAQCBMSUNfRklMRVNfQ0hLU1VNID0gImZpbGU6Ly9MSUNFTlNFLUFQQUNIRTttZDU9ODZkM2Yz
YTk1YzMyNGM5NDc5YmQ4OTg2OTY4ZjQzMjcgXAogICAgICAgICAgICAgICAgICAgICBmaWxlOi8v
Y3JhdGVzL3V2LXBlcDUwOC9MaWNlbnNlLUFwYWNoZTttZDU9ZTIzZmFkZDZjZWVmOGM2MThmYzFj
NjUxOTFkODQ2ZmEgXAogICAgICAgICAgICAgICAgICAgICBmaWxlOi8vY3JhdGVzL3V2LXBlcDUw
OC9MaWNlbnNlLUJTRDttZDU9ZWY3YTYwMjdkYzRjMjM4OWI5YWZhZDdlNjkwMjc0YzciCiAKLVNS
Q19VUklbc2hhMjU2c3VtXSA9ICJjODNjMGYxZGQyYzkyMTA5MWQxOTc0ZjU2ZDY0MjIxYzAxMGUx
NzNkOWU2ZDUyZWMyYTI1ODI2NTBjMmQ1MTk3IgorU1JDX1VSSVtzaGEyNTZzdW1dID0gImNiY2Zh
NTE5MTg5OGQ1Y2EyNzdmYWViZGM2Y2E2MTJkZDRhZmIxZmFkMjVjZDc5NDhmNDM0ODRhOGRhMDIy
YzMiCiAKIHJlcXVpcmUgJHtCUE59LWNyYXRlcy5pbmMKIAotLSAKMi40Ny4xCgo=

--===============2559691286835417350==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: attachment; filename="buildhistory-diff.txt"

packages/x86-64-v3-poky-linux/python3-uv-build/python3-uv-build: FILELIST: directory renamed /usr/lib/python3.14/site-packages/uv_build-0.12.10.dist-info/licenses -> /usr/lib/python3.14/site-packages/uv_build-0.12.12.dist-info/licenses, directory renamed /usr/lib/python3.14/site-packages/uv_build-0.12.10.dist-info -> /usr/lib/python3.14/site-packages/uv_build-0.12.12.dist-info
Changes to packages/x86-64-v3-poky-linux/python3-uv-build (sysroot):
  /usr/lib/python3.14/site-packages/uv_build-0.12.10.dist-info moved to /usr/lib/python3.14/site-packages/uv_build-0.12.12.dist-info

--===============2559691286835417350==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: attachment; filename="buildhistory-diff-full.txt"

packages/x86-64-v3-poky-linux/python3-uv-build: PKGV changed from 0.12.10 [default] to 0.12.12 [default]
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
 es.io/winnow/1.0.3 crate://crates.io/winx/0.36.4 crate://crates.io/writeable/0.6.2 crate://crates.io/xattr/1.6.1 crate://crates.io/yoke/0.8.1 crate://crates.io/yoke-derive/0.8.1 crate://crates.io/zerocopy/0.8.56 crate://crates.io/zerocopy-derive/0.8.56 crate://crates.io/zerofrom/0.1.6 crate://crates.io/zerofrom-derive/0.1.6 crate://crates.io/zerotrie/0.2.3 crate://crates.io/zerovec/0.11.5 crate://crates.io/zerovec-derive/0.11.2 crate://crates.io/zlib-rs/0.6.3 crate://crates.io/zmij/1.0.21 crate://crates.io/zstd/0.13.3 crate://crates.io/zstd-safe/7.2.4 crate://crates.io/zstd-sys/2.0.16+zstd.1.5.7" to "https://files.pythonhosted.org/packages/source/u/uv_build/uv_build-0.12.12.tar.gz crate://crates.io/adler2/2.0.1 crate://crates.io/aho-corasick/1.1.4 crate://crates.io/allocator-api2/0.2.21 crate://crates.io/ambient-authority/0.0.2 crate://crates.io/anstream/1.0.0 crate://crates.io/anstyle/1.0.14 crate://crates.io/anstyle-parse/1.0.0 crate://crates.io/anstyle-query/1.1.5 crate://crates.
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
packages/x86-64-v3-poky-linux/python3-uv-build: PV changed from "0.12.10" to "0.12.12"
packages/x86-64-v3-poky-linux/python3-uv-build/python3-uv-build-dbg: PV changed from "0.12.10" to "0.12.12"
packages/x86-64-v3-poky-linux/python3-uv-build/python3-uv-build-dbg: PKGV changed from 0.12.10 [default] to 0.12.12 [default]
packages/x86-64-v3-poky-linux/python3-uv-build/python3-uv-build-dev: PV changed from "0.12.10" to "0.12.12"
packages/x86-64-v3-poky-linux/python3-uv-build/python3-uv-build-dev: PKGV changed from 0.12.10 [default] to 0.12.12 [default]
packages/x86-64-v3-poky-linux/python3-uv-build/python3-uv-build-doc: PV changed from "0.12.10" to "0.12.12"
packages/x86-64-v3-poky-linux/python3-uv-build/python3-uv-build-doc: PKGV changed from 0.12.10 [default] to 0.12.12 [default]
packages/x86-64-v3-poky-linux/python3-uv-build/python3-uv-build-locale: PV changed from "0.12.10" to "0.12.12"
packages/x86-64-v3-poky-linux/python3-uv-build/python3-uv-build-locale: PKGV changed from 0.12.10 [default] to 0.12.12 [default]
packages/x86-64-v3-poky-linux/python3-uv-build/python3-uv-build-src: PV changed from "0.12.10" to "0.12.12"
packages/x86-64-v3-poky-linux/python3-uv-build/python3-uv-build-src: PKGV changed from 0.12.10 [default] to 0.12.12 [default]
packages/x86-64-v3-poky-linux/python3-uv-build/python3-uv-build-staticdev: PV changed from "0.12.10" to "0.12.12"
packages/x86-64-v3-poky-linux/python3-uv-build/python3-uv-build-staticdev: PKGV changed from 0.12.10 [default] to 0.12.12 [default]
packages/x86-64-v3-poky-linux/python3-uv-build/python3-uv-build: PV changed from "0.12.10" to "0.12.12"
packages/x86-64-v3-poky-linux/python3-uv-build/python3-uv-build: PKGSIZE changed from 4483353 to 4495657 (+0%)
packages/x86-64-v3-poky-linux/python3-uv-build/python3-uv-build: FILELIST: directory renamed /usr/lib/python3.14/site-packages/uv_build-0.12.10.dist-info/licenses -> /usr/lib/python3.14/site-packages/uv_build-0.12.12.dist-info/licenses, directory renamed /usr/lib/python3.14/site-packages/uv_build-0.12.10.dist-info -> /usr/lib/python3.14/site-packages/uv_build-0.12.12.dist-info
packages/x86-64-v3-poky-linux/python3-uv-build/python3-uv-build: PKGV changed from 0.12.10 [default] to 0.12.12 [default]
Changes to packages/x86-64-v3-poky-linux/python3-uv-build (sysroot):
  /usr/lib/python3.14/site-packages/uv_build-0.12.10.dist-info moved to /usr/lib/python3.14/site-packages/uv_build-0.12.12.dist-info

--===============2559691286835417350==--

