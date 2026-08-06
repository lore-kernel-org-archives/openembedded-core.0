Return-Path: <auh@yoctoproject.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 706FEC5AC7A
	for <webhook@archiver.kernel.org>; Thu,  6 Aug 2026 06:24:26 +0000 (UTC)
Received: from a27-31.smtp-out.us-west-2.amazonses.com (a27-31.smtp-out.us-west-2.amazonses.com [54.240.27.31])
 by mx.groups.io with SMTP id smtpd.msgproc01-g2.13406.1785997456892639862
 for <openembedded-core@lists.openembedded.org>;
 Wed, 05 Aug 2026 23:24:17 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@yoctoproject.org header.s=lvjh2tk576v2ro5mi6k4dt3mc6wpqbky header.b=kNvMIai2;
 dkim=pass header.i=@amazonses.com header.s=hsbnp7p3ensaochzwyq5wwmceodymuwv header.b=Rn5CFVWT;
 spf=pass (domain: us-west-2.amazonses.com, ip: 54.240.27.31, mailfrom: 0101019fd5be7300-da921d3f-54ee-48cd-b11b-c67bfbf0f5c2-000000@us-west-2.amazonses.com)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/simple;
	s=lvjh2tk576v2ro5mi6k4dt3mc6wpqbky; d=yoctoproject.org;
	t=1785997456;
	h=Content-Type:MIME-Version:From:To:Cc:Subject:Message-Id:Date;
	bh=HMfdQExQMrX4vyGH0yDEVffxOXt8u5l/0sZ7L8KH5Ec=;
	b=kNvMIai2mb+GdFKTQSMol+a1FA32fJIs8kIogpGjfFLk7kE96kkvT3gmq+ZWsAkk
	7UDXjRfMYcKTo8IYM78TnSErZbfijq3Zb7kOvUVbDbECvc4WDULt9BCXddjsRULKykn
	cRmhYn4JShdaWRh4Od06Ir2rW+xhV4GkP1kBIs3M=
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/simple;
	s=hsbnp7p3ensaochzwyq5wwmceodymuwv; d=amazonses.com; t=1785997456;
	h=Content-Type:MIME-Version:From:To:Cc:Subject:Message-Id:Date:Feedback-ID;
	bh=HMfdQExQMrX4vyGH0yDEVffxOXt8u5l/0sZ7L8KH5Ec=;
	b=Rn5CFVWT8JAP1BJfz8HNo4E/zS+H53OaRkVa2DdeQK7gC/HpXQAkEx8uYzjovfQ6
	OOeQrHSbQ856a9UOHRGeyVFIZOAvbO6zvBjnBOauCbbREV8eGjOHmY99UCxVAFxxAfR
	O+vM0WvRuMg/TeA1vcGba3G32oZwcXXNwXeQY0n8=
Content-Type: multipart/mixed; boundary="===============3413278434658503312=="
MIME-Version: 1.0
From: auh@yoctoproject.org
To: Trevor Gamblin <tgamblin@baylibre.com>
Cc: openembedded-core@lists.openembedded.org
Subject: [AUH] python3-uv-build: upgrading to 0.12.2 SUCCEEDED
Message-ID: <0101019fd5be7300-da921d3f-54ee-48cd-b11b-c67bfbf0f5c2-000000@us-west-2.amazonses.com>
Date: Thu, 6 Aug 2026 06:24:16 +0000
Feedback-ID: ::1.us-west-2.9np3MYPs3fEaOBysGKSlUD4KtcmPijcmS9Az2Hwf7iQ=:AmazonSES
X-SES-Outgoing: 2026.08.06-54.240.27.31
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Thu, 06 Aug 2026 06:24:26 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/242907

--===============3413278434658503312==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit

Hello,

this email is a notification from the Auto Upgrade Helper
that the automatic attempt to upgrade the recipe(s) *python3-uv-build* to *0.12.2* has Succeeded.

Next steps:
    - apply the patch: git am 0001-python3-uv-build-upgrade-0.12.1-0.12.2.patch
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
From 5460133cf011276ed64921108e8a4f6365216426 Mon Sep 17 00:00:00 2001
From: Upgrade Helper <auh@yoctoproject.org>
Date: Thu, 6 Aug 2026 05:49:21 +0000
Subject: [PATCH] python3-uv-build: upgrade 0.12.1 -> 0.12.2

---
 .../python/python3-uv-build-crates.inc        | 48 +++++++------------
 ...d_0.12.1.bb => python3-uv-build_0.12.2.bb} |  2 +-
 2 files changed, 19 insertions(+), 31 deletions(-)
 rename meta/recipes-devtools/python/{python3-uv-build_0.12.1.bb => python3-uv-build_0.12.2.bb} (92%)

diff --git a/meta/recipes-devtools/python/python3-uv-build-crates.inc b/meta/recipes-devtools/python/python3-uv-build-crates.inc
index 3841aa17c8..1c572a86a9 100644
--- a/meta/recipes-devtools/python/python3-uv-build-crates.inc
+++ b/meta/recipes-devtools/python/python3-uv-build-crates.inc
@@ -13,7 +13,7 @@ SRC_URI += " \
     crate://crates.io/anyhow/1.0.104 \
     crate://crates.io/arcstr/1.2.0 \
     crate://crates.io/arrayvec/0.7.8 \
-    crate://crates.io/astral-tokio-tar/0.6.3 \
+    crate://crates.io/astral-tokio-tar/0.6.4 \
     crate://crates.io/astral-version-ranges/0.2.1 \
     crate://crates.io/astral_async_zip/0.0.20 \
     crate://crates.io/async-compression/0.4.19 \
@@ -33,9 +33,9 @@ SRC_URI += " \
     crate://crates.io/cc/1.2.57 \
     crate://crates.io/cfg-if/1.0.4 \
     crate://crates.io/charset/0.1.5 \
-    crate://crates.io/clap/4.6.3 \
+    crate://crates.io/clap/4.6.4 \
     crate://crates.io/clap_builder/4.6.2 \
-    crate://crates.io/clap_derive/4.6.3 \
+    crate://crates.io/clap_derive/4.6.4 \
     crate://crates.io/clap_lex/1.1.0 \
     crate://crates.io/colorchoice/1.0.5 \
     crate://crates.io/console/0.16.4 \
@@ -56,7 +56,7 @@ SRC_URI += " \
     crate://crates.io/displaydoc/0.2.5 \
     crate://crates.io/dunce/1.0.5 \
     crate://crates.io/dyn-clone/1.0.20 \
-    crate://crates.io/either/1.16.0 \
+    crate://crates.io/either/1.17.0 \
     crate://crates.io/encode_unicode/1.0.0 \
     crate://crates.io/encoding_rs/0.8.35 \
     crate://crates.io/encoding_rs_io/0.1.7 \
@@ -84,7 +84,6 @@ SRC_URI += " \
     crate://crates.io/futures-task/0.3.33 \
     crate://crates.io/futures-util/0.3.33 \
     crate://crates.io/generic-array/0.14.7 \
-    crate://crates.io/getrandom/0.3.4 \
     crate://crates.io/getrandom/0.4.3 \
     crate://crates.io/globset/0.4.19 \
     crate://crates.io/gloo-timers/0.3.0 \
@@ -108,9 +107,9 @@ SRC_URI += " \
     crate://crates.io/is_terminal_polyfill/1.70.2 \
     crate://crates.io/itertools/0.14.0 \
     crate://crates.io/itoa/1.0.17 \
-    crate://crates.io/jiff/0.2.34 \
+    crate://crates.io/jiff/0.2.35 \
     crate://crates.io/jiff-core/0.1.0 \
-    crate://crates.io/jiff-static/0.2.34 \
+    crate://crates.io/jiff-static/0.2.35 \
     crate://crates.io/jiff-tzdb/0.1.8 \
     crate://crates.io/jiff-tzdb-platform/0.1.3 \
     crate://crates.io/jobserver/0.1.35 \
@@ -118,7 +117,6 @@ SRC_URI += " \
     crate://crates.io/junction/2.0.0 \
     crate://crates.io/lazy_static/1.5.0 \
     crate://crates.io/libc/0.2.186 \
-    crate://crates.io/linux-raw-sys/0.4.15 \
     crate://crates.io/linux-raw-sys/0.12.1 \
     crate://crates.io/litemap/0.8.1 \
     crate://crates.io/lock_api/0.4.14 \
@@ -158,7 +156,6 @@ SRC_URI += " \
     crate://crates.io/ptr_meta_derive/0.3.1 \
     crate://crates.io/quote/1.0.47 \
     crate://crates.io/quoted_printable/0.5.1 \
-    crate://crates.io/r-efi/5.3.0 \
     crate://crates.io/r-efi/6.0.0 \
     crate://crates.io/rancor/0.1.1 \
     crate://crates.io/redox_syscall/0.5.15 \
@@ -172,7 +169,6 @@ SRC_URI += " \
     crate://crates.io/rkyv/0.8.17 \
     crate://crates.io/rkyv_derive/0.8.17 \
     crate://crates.io/rustc-hash/2.1.3 \
-    crate://crates.io/rustix/0.38.44 \
     crate://crates.io/rustix/1.1.4 \
     crate://crates.io/rustversion/1.0.22 \
     crate://crates.io/ryu/1.0.23 \
@@ -187,7 +183,7 @@ SRC_URI += " \
     crate://crates.io/serde_core/1.0.229 \
     crate://crates.io/serde_derive/1.0.229 \
     crate://crates.io/serde_derive_internals/0.29.1 \
-    crate://crates.io/serde_json/1.0.150 \
+    crate://crates.io/serde_json/1.0.151 \
     crate://crates.io/serde_spanned/1.1.1 \
     crate://crates.io/sha2/0.10.9 \
     crate://crates.io/sha2/0.11.0 \
@@ -219,8 +215,8 @@ SRC_URI += " \
     crate://crates.io/tinyvec_macros/0.1.1 \
     crate://crates.io/tokio/1.53.1 \
     crate://crates.io/tokio-macros/2.7.0 \
-    crate://crates.io/tokio-stream/0.1.18 \
-    crate://crates.io/tokio-util/0.7.18 \
+    crate://crates.io/tokio-stream/0.1.19 \
+    crate://crates.io/tokio-util/0.7.19 \
     crate://crates.io/toml/1.1.3+spec-1.1.0 \
     crate://crates.io/toml_datetime/1.1.1+spec-1.1.0 \
     crate://crates.io/toml_edit/0.25.13+spec-1.1.0 \
@@ -249,7 +245,6 @@ SRC_URI += " \
     crate://crates.io/vte/0.14.1 \
     crate://crates.io/walkdir/2.5.0 \
     crate://crates.io/wasi/0.11.1+wasi-snapshot-preview1 \
-    crate://crates.io/wasip2/1.0.4+wasi-0.2.12 \
     crate://crates.io/wasm-bindgen/0.2.114 \
     crate://crates.io/wasm-bindgen-macro/0.2.114 \
     crate://crates.io/wasm-bindgen-macro-support/0.2.114 \
@@ -279,7 +274,6 @@ SRC_URI += " \
     crate://crates.io/windows_x86_64_gnullvm/0.52.6 \
     crate://crates.io/windows_x86_64_msvc/0.52.6 \
     crate://crates.io/winnow/1.0.3 \
-    crate://crates.io/wit-bindgen/0.57.1 \
     crate://crates.io/writeable/0.6.2 \
     crate://crates.io/xattr/1.6.1 \
     crate://crates.io/yoke/0.8.1 \
@@ -307,7 +301,7 @@ SRC_URI[anstyle-wincon-3.0.11.sha256sum] = "291e6a250ff86cd4a820112fb8898808a366
 SRC_URI[anyhow-1.0.104.sha256sum] = "330a5ed07fa54e4702c9d6c4174f74427fc0ef6e214bbd677ae50a5099946470"
 SRC_URI[arcstr-1.2.0.sha256sum] = "03918c3dbd7701a85c6b9887732e2921175f26c350b4563841d0958c21d57e6d"
 SRC_URI[arrayvec-0.7.8.sha256sum] = "d3fb67a6e08acf24fdeccbac2cb6ac4305825bd1f117462e0e6f2f193345ad56"
-SRC_URI[astral-tokio-tar-0.6.3.sha256sum] = "08648fef353ab39a9d26f909ad53fc4f071be4c91853b78523f5cc3d9e5ebffd"
+SRC_URI[astral-tokio-tar-0.6.4.sha256sum] = "b18457efd137254e016bbde5e1d88df61c4e1a5ae2223746e56123bac6af2463"
 SRC_URI[astral-version-ranges-0.2.1.sha256sum] = "14445f6708e9a60d5098b6d6f99dbe7b5b347178b2736e1fad7a87b04e289791"
 SRC_URI[astral_async_zip-0.0.20.sha256sum] = "bd939d79959c3f49a648a1d7857d63cc62548725a6b060b8dbf0ea5c92470b63"
 SRC_URI[async-compression-0.4.19.sha256sum] = "06575e6a9673580f52661c92107baabffbf41e2141373441cbcdc47cb733003c"
@@ -327,9 +321,9 @@ SRC_URI[bytes-1.12.1.sha256sum] = "fc652a48c352aef3ea3aed32080501cf3ef6ed5da7860
 SRC_URI[cc-1.2.57.sha256sum] = "7a0dd1ca384932ff3641c8718a02769f1698e7563dc6974ffd03346116310423"
 SRC_URI[cfg-if-1.0.4.sha256sum] = "9330f8b2ff13f34540b44e946ef35111825727b38d33286ef986142615121801"
 SRC_URI[charset-0.1.5.sha256sum] = "f1f927b07c74ba84c7e5fe4db2baeb3e996ab2688992e39ac68ce3220a677c7e"
-SRC_URI[clap-4.6.3.sha256sum] = "0fb99565819980999fb7b4a1796046a5c949e6d4ff132cf5fadf5a641e20d776"
+SRC_URI[clap-4.6.4.sha256sum] = "d91e0c145792ef73a6ad36d27c75ac09f1832222a3c209689d90f534685ee5b7"
 SRC_URI[clap_builder-4.6.2.sha256sum] = "f09628afdcc538b57f3c6341e9c8e9970f18e4a481690a64974d7023bd33548b"
-SRC_URI[clap_derive-4.6.3.sha256sum] = "32f2392eae7f16557a3d727ef3a12e57b2b2ca6f98566a5f4fb41ffe305df077"
+SRC_URI[clap_derive-4.6.4.sha256sum] = "d012d2b9d65aca7f18f4d9878a045bc17899bba951561ba5ec3c2ba1eed9a061"
 SRC_URI[clap_lex-1.1.0.sha256sum] = "c8d4a3bb8b1e0c1050499d1815f5ab16d04f0959b233085fb31653fbfc9d98f9"
 SRC_URI[colorchoice-1.0.5.sha256sum] = "1d07550c9036bf2ae0c684c4297d503f838287c83c53686d05370d0e139ae570"
 SRC_URI[console-0.16.4.sha256sum] = "4fe5f465a4f6fee88fad41b85d990f84c835335e85b5d9e6e63e0d06d28cba7c"
@@ -350,7 +344,7 @@ SRC_URI[digest-0.11.3.sha256sum] = "f1dd6dbb5841937940781866fa1281a1ff7bd3bf8270
 SRC_URI[displaydoc-0.2.5.sha256sum] = "97369cbbc041bc366949bc74d34658d6cda5621039731c6310521892a3a20ae0"
 SRC_URI[dunce-1.0.5.sha256sum] = "92773504d58c093f6de2459af4af33faa518c13451eb8f2b5698ed3d36e7c813"
 SRC_URI[dyn-clone-1.0.20.sha256sum] = "d0881ea181b1df73ff77ffaaf9c7544ecc11e82fba9b5f27b262a3c73a332555"
-SRC_URI[either-1.16.0.sha256sum] = "91622ff5e7162018101f2fea40d6ebf4a78bbe5a49736a2020649edf9693679e"
+SRC_URI[either-1.17.0.sha256sum] = "9e5e8f6c15a24b9a3ee5efec809ccd006d3b30e8b3bb63c39af737c7f87daa1d"
 SRC_URI[encode_unicode-1.0.0.sha256sum] = "34aa73646ffb006b8f5147f3dc182bd4bcb190227ce861fc4a4844bf8e3cb2c0"
 SRC_URI[encoding_rs-0.8.35.sha256sum] = "75030f3c4f45dafd7586dd6780965a8c7e8e285a5ecb86713e63a79c5b2766f3"
 SRC_URI[encoding_rs_io-0.1.7.sha256sum] = "1cc3c5651fb62ab8aa3103998dade57efdd028544bd300516baa31840c252a83"
@@ -378,7 +372,6 @@ SRC_URI[futures-sink-0.3.33.sha256sum] = "e34418ac499d6305c2fb5ad0ed2f6ac998c5f8
 SRC_URI[futures-task-0.3.33.sha256sum] = "b231ed28831efb4a61a08580c4bc233ec56bc009f4cd8f52da2c3cb97df0c109"
 SRC_URI[futures-util-0.3.33.sha256sum] = "a77a90a256fce34da66415271e30f94ee91c57b04b8a2c042d9cf3220179deaa"
 SRC_URI[generic-array-0.14.7.sha256sum] = "85649ca51fd72272d7821adaf274ad91c288277713d9c18820d8499a7ff69e9a"
-SRC_URI[getrandom-0.3.4.sha256sum] = "899def5c37c4fd7b2664648c28120ecec138e4d395b459e5ca34f9cce2dd77fd"
 SRC_URI[getrandom-0.4.3.sha256sum] = "300e883d756b2e4ec94e02791f39b04b522276138852cfc41d9fb7e904106099"
 SRC_URI[globset-0.4.19.sha256sum] = "e47d37d2ae4464254884b60ab7071be2b876a9c35b696bd018ddcc76847309cd"
 SRC_URI[gloo-timers-0.3.0.sha256sum] = "bbb143cf96099802033e0d4f4963b19fd2e0b728bcf076cd9cf7f6634f092994"
@@ -402,9 +395,9 @@ SRC_URI[insta-1.48.0.sha256sum] = "86f0f8fee8c926415c58d6ae43a08523a26faccb2323f
 SRC_URI[is_terminal_polyfill-1.70.2.sha256sum] = "a6cb138bb79a146c1bd460005623e142ef0181e3d0219cb493e02f7d08a35695"
 SRC_URI[itertools-0.14.0.sha256sum] = "2b192c782037fadd9cfa75548310488aabdbf3d2da73885b31bd0abd03351285"
 SRC_URI[itoa-1.0.17.sha256sum] = "92ecc6618181def0457392ccd0ee51198e065e016d1d527a7ac1b6dc7c1f09d2"
-SRC_URI[jiff-0.2.34.sha256sum] = "e184d09547b80eb7e20d141ba2fb1fbac843ca53f4cf1b31210adc4c1adc6e16"
+SRC_URI[jiff-0.2.35.sha256sum] = "668b7183bd07af9a4885f5c35b0cc5c83c4607a913c16b7e17291832910d2dcc"
 SRC_URI[jiff-core-0.1.0.sha256sum] = "7feca88439efe53da3754500c1851dedf3cb36c524dd5cf8225cc0794de95d09"
-SRC_URI[jiff-static-0.2.34.sha256sum] = "323da076b7a6faf914dc677cb05a4b907742ff7375c8322c9e7f5061e5e0e9de"
+SRC_URI[jiff-static-0.2.35.sha256sum] = "3a69dcb3a21cfb32ce1cd056169337ca284af0766dd766e7878819b251a49204"
 SRC_URI[jiff-tzdb-0.1.8.sha256sum] = "142bd39932ad231f10513df9ab62661fead8719872150b7ad02a2df79f4e141e"
 SRC_URI[jiff-tzdb-platform-0.1.3.sha256sum] = "875a5a69ac2bab1a891711cf5eccbec1ce0341ea805560dcd90b7a2e925132e8"
 SRC_URI[jobserver-0.1.35.sha256sum] = "1c00acbd29eabad4a2392fa0e921c874934dbbf4194312ad20f04a0ed67a3cb3"
@@ -412,7 +405,6 @@ SRC_URI[js-sys-0.3.91.sha256sum] = "b49715b7073f385ba4bc528e5747d02e66cb39c6146e
 SRC_URI[junction-2.0.0.sha256sum] = "160f2eade097f30263b548aae5deb12ad349c909baa710fa24b92c9090b2e006"
 SRC_URI[lazy_static-1.5.0.sha256sum] = "bbd2bcb4c963f2ddae06a2efc7e9f3591312473c50c6685e1f298068316e66fe"
 SRC_URI[libc-0.2.186.sha256sum] = "68ab91017fe16c622486840e4c83c9a37afeff978bd239b5293d61ece587de66"
-SRC_URI[linux-raw-sys-0.4.15.sha256sum] = "d26c52dbd32dccf2d10cac7725f8eae5296885fb5703b261f7d0a0739ec807ab"
 SRC_URI[linux-raw-sys-0.12.1.sha256sum] = "32a66949e030da00e8c7d4434b251670a91556f4144941d37452769c25d58a53"
 SRC_URI[litemap-0.8.1.sha256sum] = "6373607a59f0be73a39b6fe456b8192fcc3585f602af20751600e974dd455e77"
 SRC_URI[lock_api-0.4.14.sha256sum] = "224399e74b87b5f3557511d98dff8b14089b3dadafcab6bb93eab67d3aace965"
@@ -452,7 +444,6 @@ SRC_URI[ptr_meta-0.3.1.sha256sum] = "0b9a0cf95a1196af61d4f1cbdab967179516d9a4a43
 SRC_URI[ptr_meta_derive-0.3.1.sha256sum] = "7347867d0a7e1208d93b46767be83e2b8f978c3dad35f775ac8d8847551d6fe1"
 SRC_URI[quote-1.0.47.sha256sum] = "1fbf4db142a473a8d80c26bbf18454ed458bf8d26c8219c331daecfdbd079001"
 SRC_URI[quoted_printable-0.5.1.sha256sum] = "640c9bd8497b02465aeef5375144c26062e0dcd5939dfcbb0f5db76cb8c17c73"
-SRC_URI[r-efi-5.3.0.sha256sum] = "69cdb34c158ceb288df11e18b4bd39de994f6657d83847bdffdbd7f346754b0f"
 SRC_URI[r-efi-6.0.0.sha256sum] = "f8dcc9c7d52a811697d2151c701e0d08956f92b0e24136cf4cf27b57a6a0d9bf"
 SRC_URI[rancor-0.1.1.sha256sum] = "a063ea72381527c2a0561da9c80000ef822bdd7c3241b1cc1b12100e3df081ee"
 SRC_URI[redox_syscall-0.5.15.sha256sum] = "7e8af0dde094006011e6a740d4879319439489813bd0bcdc7d821beaeeff48ec"
@@ -466,7 +457,6 @@ SRC_URI[rend-0.5.3.sha256sum] = "cadadef317c2f20755a64d7fdc48f9e7178ee6b0e1f7fce
 SRC_URI[rkyv-0.8.17.sha256sum] = "815cc8a37159a463064825246cadb07961e25cd9885908606f6d08a98d8f8874"
 SRC_URI[rkyv_derive-0.8.17.sha256sum] = "c0ed1a78a1b19d184b0daa629dd9a024573173ec7d485b287cb369fb3607cc1c"
 SRC_URI[rustc-hash-2.1.3.sha256sum] = "6b1e7f9a428571be2dc5bc0505c13fb6bf936822b894ec87abf8a08a4e51742d"
-SRC_URI[rustix-0.38.44.sha256sum] = "fdb5bc1ae2baa591800df16c9ca78619bf65c0488b41b96ccec5d11220d8c154"
 SRC_URI[rustix-1.1.4.sha256sum] = "b6fe4565b9518b83ef4f91bb47ce29620ca828bd32cb7e408f0062e9930ba190"
 SRC_URI[rustversion-1.0.22.sha256sum] = "b39cdef0fa800fc44525c84ccb54a029961a8215f9619753635a9c0d2538d46d"
 SRC_URI[ryu-1.0.23.sha256sum] = "9774ba4a74de5f7b1c1451ed6cd5285a32eddb5cccb8cc655a4e50009e06477f"
@@ -481,7 +471,7 @@ SRC_URI[serde-untagged-0.1.9.sha256sum] = "f9faf48a4a2d2693be24c6289dbe26552776e
 SRC_URI[serde_core-1.0.229.sha256sum] = "67dca2c9c51e58a4791a4b1ed58308b39c64224d349a935ab5039aa360942a48"
 SRC_URI[serde_derive-1.0.229.sha256sum] = "e7a5d71263a5a7d47b41f6b3f06ba276f10cc18b0931f1799f710578e2309348"
 SRC_URI[serde_derive_internals-0.29.1.sha256sum] = "18d26a20a969b9e3fdf2fc2d9f21eda6c40e2de84c9408bb5d3b05d499aae711"
-SRC_URI[serde_json-1.0.150.sha256sum] = "e8014e44b4736ed0538adeecded0fce2a272f22dc9578a7eb6b2d9993c74cfb9"
+SRC_URI[serde_json-1.0.151.sha256sum] = "c841b55ecdae098c80dcae9cf767f6f8a0c2cdb3416bbef72181df4d0fe73f14"
 SRC_URI[serde_spanned-1.1.1.sha256sum] = "6662b5879511e06e8999a8a235d848113e942c9124f211511b16466ee2995f26"
 SRC_URI[sha2-0.10.9.sha256sum] = "a7507d819769d01a365ab707794a4084392c824f54a7a6a7862f8c3d0892b283"
 SRC_URI[sha2-0.11.0.sha256sum] = "446ba717509524cb3f22f17ecc096f10f4822d76ab5c0b9822c5f9c284e825f4"
@@ -513,8 +503,8 @@ SRC_URI[tinyvec-1.11.0.sha256sum] = "3e61e67053d25a4e82c844e8424039d9745781b3fc4
 SRC_URI[tinyvec_macros-0.1.1.sha256sum] = "1f3ccbac311fea05f86f61904b462b55fb3df8837a366dfc601a0161d0532f20"
 SRC_URI[tokio-1.53.1.sha256sum] = "202caea871b69668250d242070849eb495be178ed697a3e98aebce5bc81a0bed"
 SRC_URI[tokio-macros-2.7.0.sha256sum] = "385a6cb71ab9ab790c5fe8d67f1645e6c450a7ce006a33de03daa956cf70a496"
-SRC_URI[tokio-stream-0.1.18.sha256sum] = "32da49809aab5c3bc678af03902d4ccddea2a87d028d86392a4b1560c6906c70"
-SRC_URI[tokio-util-0.7.18.sha256sum] = "9ae9cec805b01e8fc3fd2fe289f89149a9b66dd16786abd8b19cfa7b48cb0098"
+SRC_URI[tokio-stream-0.1.19.sha256sum] = "a3d06f0b082ba57c26b79407372e57cf2a1e28124f78e9479fe80322cf53420b"
+SRC_URI[tokio-util-0.7.19.sha256sum] = "494815d09bf52b5548659851081238f0ca39ff638363907596da739561c62c52"
 SRC_URI[toml-1.1.3+spec-1.1.0.sha256sum] = "53c96ecdfa941c8fc4fcaed14f99ada8ebed502eef533015095a07e3301d4c3c"
 SRC_URI[toml_datetime-1.1.1+spec-1.1.0.sha256sum] = "3165f65f62e28e0115a00b2ebdd37eb6f3b641855f9d636d3cd4103767159ad7"
 SRC_URI[toml_edit-0.25.13+spec-1.1.0.sha256sum] = "6975367e4d2ef766d86af01ffad14b622fecc8d4357a998fbc4deb6e9bacaf9b"
@@ -543,7 +533,6 @@ SRC_URI[version_check-0.9.5.sha256sum] = "0b928f33d975fc6ad9f86c8f283853ad26bdd5
 SRC_URI[vte-0.14.1.sha256sum] = "231fdcd7ef3037e8330d8e17e61011a2c244126acc0a982f4040ac3f9f0bc077"
 SRC_URI[walkdir-2.5.0.sha256sum] = "29790946404f91d9c5d06f9874efddea1dc06c5efe94541a7d6863108e3a5e4b"
 SRC_URI[wasi-0.11.1+wasi-snapshot-preview1.sha256sum] = "ccf3ec651a847eb01de73ccad15eb7d99f80485de043efb2f370cd654f4ea44b"
-SRC_URI[wasip2-1.0.4+wasi-0.2.12.sha256sum] = "b67efb37e106e55ce722a510d6b5f9c17f083e5fc79afc2badeb12cc313d9487"
 SRC_URI[wasm-bindgen-0.2.114.sha256sum] = "6532f9a5c1ece3798cb1c2cfdba640b9b3ba884f5db45973a6f442510a87d38e"
 SRC_URI[wasm-bindgen-macro-0.2.114.sha256sum] = "18a2d50fcf105fb33bb15f00e7a77b772945a2ee45dcf454961fd843e74c18e6"
 SRC_URI[wasm-bindgen-macro-support-0.2.114.sha256sum] = "03ce4caeaac547cdf713d280eda22a730824dd11e6b8c3ca9e42247b25c631e3"
@@ -573,7 +562,6 @@ SRC_URI[windows_x86_64_gnu-0.52.6.sha256sum] = "147a5c80aabfbf0c7d901cb5895d1de3
 SRC_URI[windows_x86_64_gnullvm-0.52.6.sha256sum] = "24d5b23dc417412679681396f2b49f3de8c1473deb516bd34410872eff51ed0d"
 SRC_URI[windows_x86_64_msvc-0.52.6.sha256sum] = "589f6da84c646204747d1270a2a5661ea66ed1cced2631d546fdfb155959f9ec"
 SRC_URI[winnow-1.0.3.sha256sum] = "0592e1c9d151f854e6fd382574c3a0855250e1d9b2f99d9281c6e6391af352f1"
-SRC_URI[wit-bindgen-0.57.1.sha256sum] = "1ebf944e87a7c253233ad6766e082e3cd714b5d03812acc24c318f549614536e"
 SRC_URI[writeable-0.6.2.sha256sum] = "9edde0db4769d2dc68579893f2306b26c6ecfbe0ef499b013d731b7b9247e0b9"
 SRC_URI[xattr-1.6.1.sha256sum] = "32e45ad4206f6d2479085147f02bc2ef834ac85886624a23575ae137c8aa8156"
 SRC_URI[yoke-0.8.1.sha256sum] = "72d6e5c6afb84d73944e5cedb052c4680d5657337201555f9f2a16b7406d4954"
diff --git a/meta/recipes-devtools/python/python3-uv-build_0.12.1.bb b/meta/recipes-devtools/python/python3-uv-build_0.12.2.bb
similarity index 92%
rename from meta/recipes-devtools/python/python3-uv-build_0.12.1.bb
rename to meta/recipes-devtools/python/python3-uv-build_0.12.2.bb
index ca2061c371..d57cdb02d0 100644
--- a/meta/recipes-devtools/python/python3-uv-build_0.12.1.bb
+++ b/meta/recipes-devtools/python/python3-uv-build_0.12.2.bb
@@ -11,7 +11,7 @@ LIC_FILES_CHKSUM = "file://LICENSE-APACHE;md5=86d3f3a95c324c9479bd8986968f4327 \
                     file://crates/uv-pep508/License-Apache;md5=e23fadd6ceef8c618fc1c65191d846fa \
                     file://crates/uv-pep508/License-BSD;md5=ef7a6027dc4c2389b9afad7e690274c7"
 
-SRC_URI[sha256sum] = "31d2767fb04777b1dc2408b23be9d1ad50ee1f566bfefb7935cbfdd34fead047"
+SRC_URI[sha256sum] = "0f8cc57218c2666c77485147b2dc54e185764bc62b63f78e0429e7f9c30a8495"
 
 require ${BPN}-crates.inc
 
-- 
2.47.1


--===============3413278434658503312==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: attachment; filename="buildhistory-diff.txt"

packages/x86-64-v3-poky-linux/python3-uv-build/python3-uv-build: FILELIST: directory renamed /usr/lib/python3.14/site-packages/uv_build-0.12.1.dist-info/licenses -> /usr/lib/python3.14/site-packages/uv_build-0.12.2.dist-info/licenses, directory renamed /usr/lib/python3.14/site-packages/uv_build-0.12.1.dist-info -> /usr/lib/python3.14/site-packages/uv_build-0.12.2.dist-info
Changes to packages/x86-64-v3-poky-linux/python3-uv-build (sysroot):
  /usr/lib/python3.14/site-packages/uv_build-0.12.1.dist-info moved to /usr/lib/python3.14/site-packages/uv_build-0.12.2.dist-info

--===============3413278434658503312==
Content-Type: application/octet-stream
MIME-Version: 1.0
Content-Transfer-Encoding: base64
Content-Disposition: attachment;
 filename="0001-python3-uv-build-upgrade-0.12.1-0.12.2.patch"

RnJvbSA1NDYwMTMzY2YwMTEyNzZlZDY0OTIxMTA4ZThhNGY2MzY1MjE2NDI2IE1vbiBTZXAgMTcg
MDA6MDA6MDAgMjAwMQpGcm9tOiBVcGdyYWRlIEhlbHBlciA8YXVoQHlvY3RvcHJvamVjdC5vcmc+
CkRhdGU6IFRodSwgNiBBdWcgMjAyNiAwNTo0OToyMSArMDAwMApTdWJqZWN0OiBbUEFUQ0hdIHB5
dGhvbjMtdXYtYnVpbGQ6IHVwZ3JhZGUgMC4xMi4xIC0+IDAuMTIuMgoKLS0tCiAuLi4vcHl0aG9u
L3B5dGhvbjMtdXYtYnVpbGQtY3JhdGVzLmluYyAgICAgICAgfCA0OCArKysrKysrLS0tLS0tLS0t
LS0tCiAuLi5kXzAuMTIuMS5iYiA9PiBweXRob24zLXV2LWJ1aWxkXzAuMTIuMi5iYn0gfCAgMiAr
LQogMiBmaWxlcyBjaGFuZ2VkLCAxOSBpbnNlcnRpb25zKCspLCAzMSBkZWxldGlvbnMoLSkKIHJl
bmFtZSBtZXRhL3JlY2lwZXMtZGV2dG9vbHMvcHl0aG9uL3tweXRob24zLXV2LWJ1aWxkXzAuMTIu
MS5iYiA9PiBweXRob24zLXV2LWJ1aWxkXzAuMTIuMi5iYn0gKDkyJSkKCmRpZmYgLS1naXQgYS9t
ZXRhL3JlY2lwZXMtZGV2dG9vbHMvcHl0aG9uL3B5dGhvbjMtdXYtYnVpbGQtY3JhdGVzLmluYyBi
L21ldGEvcmVjaXBlcy1kZXZ0b29scy9weXRob24vcHl0aG9uMy11di1idWlsZC1jcmF0ZXMuaW5j
CmluZGV4IDM4NDFhYTE3YzguLjFjNTcyYTg2YTkgMTAwNjQ0Ci0tLSBhL21ldGEvcmVjaXBlcy1k
ZXZ0b29scy9weXRob24vcHl0aG9uMy11di1idWlsZC1jcmF0ZXMuaW5jCisrKyBiL21ldGEvcmVj
aXBlcy1kZXZ0b29scy9weXRob24vcHl0aG9uMy11di1idWlsZC1jcmF0ZXMuaW5jCkBAIC0xMyw3
ICsxMyw3IEBAIFNSQ19VUkkgKz0gIiBcCiAgICAgY3JhdGU6Ly9jcmF0ZXMuaW8vYW55aG93LzEu
MC4xMDQgXAogICAgIGNyYXRlOi8vY3JhdGVzLmlvL2FyY3N0ci8xLjIuMCBcCiAgICAgY3JhdGU6
Ly9jcmF0ZXMuaW8vYXJyYXl2ZWMvMC43LjggXAotICAgIGNyYXRlOi8vY3JhdGVzLmlvL2FzdHJh
bC10b2tpby10YXIvMC42LjMgXAorICAgIGNyYXRlOi8vY3JhdGVzLmlvL2FzdHJhbC10b2tpby10
YXIvMC42LjQgXAogICAgIGNyYXRlOi8vY3JhdGVzLmlvL2FzdHJhbC12ZXJzaW9uLXJhbmdlcy8w
LjIuMSBcCiAgICAgY3JhdGU6Ly9jcmF0ZXMuaW8vYXN0cmFsX2FzeW5jX3ppcC8wLjAuMjAgXAog
ICAgIGNyYXRlOi8vY3JhdGVzLmlvL2FzeW5jLWNvbXByZXNzaW9uLzAuNC4xOSBcCkBAIC0zMyw5
ICszMyw5IEBAIFNSQ19VUkkgKz0gIiBcCiAgICAgY3JhdGU6Ly9jcmF0ZXMuaW8vY2MvMS4yLjU3
IFwKICAgICBjcmF0ZTovL2NyYXRlcy5pby9jZmctaWYvMS4wLjQgXAogICAgIGNyYXRlOi8vY3Jh
dGVzLmlvL2NoYXJzZXQvMC4xLjUgXAotICAgIGNyYXRlOi8vY3JhdGVzLmlvL2NsYXAvNC42LjMg
XAorICAgIGNyYXRlOi8vY3JhdGVzLmlvL2NsYXAvNC42LjQgXAogICAgIGNyYXRlOi8vY3JhdGVz
LmlvL2NsYXBfYnVpbGRlci80LjYuMiBcCi0gICAgY3JhdGU6Ly9jcmF0ZXMuaW8vY2xhcF9kZXJp
dmUvNC42LjMgXAorICAgIGNyYXRlOi8vY3JhdGVzLmlvL2NsYXBfZGVyaXZlLzQuNi40IFwKICAg
ICBjcmF0ZTovL2NyYXRlcy5pby9jbGFwX2xleC8xLjEuMCBcCiAgICAgY3JhdGU6Ly9jcmF0ZXMu
aW8vY29sb3JjaG9pY2UvMS4wLjUgXAogICAgIGNyYXRlOi8vY3JhdGVzLmlvL2NvbnNvbGUvMC4x
Ni40IFwKQEAgLTU2LDcgKzU2LDcgQEAgU1JDX1VSSSArPSAiIFwKICAgICBjcmF0ZTovL2NyYXRl
cy5pby9kaXNwbGF5ZG9jLzAuMi41IFwKICAgICBjcmF0ZTovL2NyYXRlcy5pby9kdW5jZS8xLjAu
NSBcCiAgICAgY3JhdGU6Ly9jcmF0ZXMuaW8vZHluLWNsb25lLzEuMC4yMCBcCi0gICAgY3JhdGU6
Ly9jcmF0ZXMuaW8vZWl0aGVyLzEuMTYuMCBcCisgICAgY3JhdGU6Ly9jcmF0ZXMuaW8vZWl0aGVy
LzEuMTcuMCBcCiAgICAgY3JhdGU6Ly9jcmF0ZXMuaW8vZW5jb2RlX3VuaWNvZGUvMS4wLjAgXAog
ICAgIGNyYXRlOi8vY3JhdGVzLmlvL2VuY29kaW5nX3JzLzAuOC4zNSBcCiAgICAgY3JhdGU6Ly9j
cmF0ZXMuaW8vZW5jb2RpbmdfcnNfaW8vMC4xLjcgXApAQCAtODQsNyArODQsNiBAQCBTUkNfVVJJ
ICs9ICIgXAogICAgIGNyYXRlOi8vY3JhdGVzLmlvL2Z1dHVyZXMtdGFzay8wLjMuMzMgXAogICAg
IGNyYXRlOi8vY3JhdGVzLmlvL2Z1dHVyZXMtdXRpbC8wLjMuMzMgXAogICAgIGNyYXRlOi8vY3Jh
dGVzLmlvL2dlbmVyaWMtYXJyYXkvMC4xNC43IFwKLSAgICBjcmF0ZTovL2NyYXRlcy5pby9nZXRy
YW5kb20vMC4zLjQgXAogICAgIGNyYXRlOi8vY3JhdGVzLmlvL2dldHJhbmRvbS8wLjQuMyBcCiAg
ICAgY3JhdGU6Ly9jcmF0ZXMuaW8vZ2xvYnNldC8wLjQuMTkgXAogICAgIGNyYXRlOi8vY3JhdGVz
LmlvL2dsb28tdGltZXJzLzAuMy4wIFwKQEAgLTEwOCw5ICsxMDcsOSBAQCBTUkNfVVJJICs9ICIg
XAogICAgIGNyYXRlOi8vY3JhdGVzLmlvL2lzX3Rlcm1pbmFsX3BvbHlmaWxsLzEuNzAuMiBcCiAg
ICAgY3JhdGU6Ly9jcmF0ZXMuaW8vaXRlcnRvb2xzLzAuMTQuMCBcCiAgICAgY3JhdGU6Ly9jcmF0
ZXMuaW8vaXRvYS8xLjAuMTcgXAotICAgIGNyYXRlOi8vY3JhdGVzLmlvL2ppZmYvMC4yLjM0IFwK
KyAgICBjcmF0ZTovL2NyYXRlcy5pby9qaWZmLzAuMi4zNSBcCiAgICAgY3JhdGU6Ly9jcmF0ZXMu
aW8vamlmZi1jb3JlLzAuMS4wIFwKLSAgICBjcmF0ZTovL2NyYXRlcy5pby9qaWZmLXN0YXRpYy8w
LjIuMzQgXAorICAgIGNyYXRlOi8vY3JhdGVzLmlvL2ppZmYtc3RhdGljLzAuMi4zNSBcCiAgICAg
Y3JhdGU6Ly9jcmF0ZXMuaW8vamlmZi10emRiLzAuMS44IFwKICAgICBjcmF0ZTovL2NyYXRlcy5p
by9qaWZmLXR6ZGItcGxhdGZvcm0vMC4xLjMgXAogICAgIGNyYXRlOi8vY3JhdGVzLmlvL2pvYnNl
cnZlci8wLjEuMzUgXApAQCAtMTE4LDcgKzExNyw2IEBAIFNSQ19VUkkgKz0gIiBcCiAgICAgY3Jh
dGU6Ly9jcmF0ZXMuaW8vanVuY3Rpb24vMi4wLjAgXAogICAgIGNyYXRlOi8vY3JhdGVzLmlvL2xh
enlfc3RhdGljLzEuNS4wIFwKICAgICBjcmF0ZTovL2NyYXRlcy5pby9saWJjLzAuMi4xODYgXAot
ICAgIGNyYXRlOi8vY3JhdGVzLmlvL2xpbnV4LXJhdy1zeXMvMC40LjE1IFwKICAgICBjcmF0ZTov
L2NyYXRlcy5pby9saW51eC1yYXctc3lzLzAuMTIuMSBcCiAgICAgY3JhdGU6Ly9jcmF0ZXMuaW8v
bGl0ZW1hcC8wLjguMSBcCiAgICAgY3JhdGU6Ly9jcmF0ZXMuaW8vbG9ja19hcGkvMC40LjE0IFwK
QEAgLTE1OCw3ICsxNTYsNiBAQCBTUkNfVVJJICs9ICIgXAogICAgIGNyYXRlOi8vY3JhdGVzLmlv
L3B0cl9tZXRhX2Rlcml2ZS8wLjMuMSBcCiAgICAgY3JhdGU6Ly9jcmF0ZXMuaW8vcXVvdGUvMS4w
LjQ3IFwKICAgICBjcmF0ZTovL2NyYXRlcy5pby9xdW90ZWRfcHJpbnRhYmxlLzAuNS4xIFwKLSAg
ICBjcmF0ZTovL2NyYXRlcy5pby9yLWVmaS81LjMuMCBcCiAgICAgY3JhdGU6Ly9jcmF0ZXMuaW8v
ci1lZmkvNi4wLjAgXAogICAgIGNyYXRlOi8vY3JhdGVzLmlvL3JhbmNvci8wLjEuMSBcCiAgICAg
Y3JhdGU6Ly9jcmF0ZXMuaW8vcmVkb3hfc3lzY2FsbC8wLjUuMTUgXApAQCAtMTcyLDcgKzE2OSw2
IEBAIFNSQ19VUkkgKz0gIiBcCiAgICAgY3JhdGU6Ly9jcmF0ZXMuaW8vcmt5di8wLjguMTcgXAog
ICAgIGNyYXRlOi8vY3JhdGVzLmlvL3JreXZfZGVyaXZlLzAuOC4xNyBcCiAgICAgY3JhdGU6Ly9j
cmF0ZXMuaW8vcnVzdGMtaGFzaC8yLjEuMyBcCi0gICAgY3JhdGU6Ly9jcmF0ZXMuaW8vcnVzdGl4
LzAuMzguNDQgXAogICAgIGNyYXRlOi8vY3JhdGVzLmlvL3J1c3RpeC8xLjEuNCBcCiAgICAgY3Jh
dGU6Ly9jcmF0ZXMuaW8vcnVzdHZlcnNpb24vMS4wLjIyIFwKICAgICBjcmF0ZTovL2NyYXRlcy5p
by9yeXUvMS4wLjIzIFwKQEAgLTE4Nyw3ICsxODMsNyBAQCBTUkNfVVJJICs9ICIgXAogICAgIGNy
YXRlOi8vY3JhdGVzLmlvL3NlcmRlX2NvcmUvMS4wLjIyOSBcCiAgICAgY3JhdGU6Ly9jcmF0ZXMu
aW8vc2VyZGVfZGVyaXZlLzEuMC4yMjkgXAogICAgIGNyYXRlOi8vY3JhdGVzLmlvL3NlcmRlX2Rl
cml2ZV9pbnRlcm5hbHMvMC4yOS4xIFwKLSAgICBjcmF0ZTovL2NyYXRlcy5pby9zZXJkZV9qc29u
LzEuMC4xNTAgXAorICAgIGNyYXRlOi8vY3JhdGVzLmlvL3NlcmRlX2pzb24vMS4wLjE1MSBcCiAg
ICAgY3JhdGU6Ly9jcmF0ZXMuaW8vc2VyZGVfc3Bhbm5lZC8xLjEuMSBcCiAgICAgY3JhdGU6Ly9j
cmF0ZXMuaW8vc2hhMi8wLjEwLjkgXAogICAgIGNyYXRlOi8vY3JhdGVzLmlvL3NoYTIvMC4xMS4w
IFwKQEAgLTIxOSw4ICsyMTUsOCBAQCBTUkNfVVJJICs9ICIgXAogICAgIGNyYXRlOi8vY3JhdGVz
LmlvL3Rpbnl2ZWNfbWFjcm9zLzAuMS4xIFwKICAgICBjcmF0ZTovL2NyYXRlcy5pby90b2tpby8x
LjUzLjEgXAogICAgIGNyYXRlOi8vY3JhdGVzLmlvL3Rva2lvLW1hY3Jvcy8yLjcuMCBcCi0gICAg
Y3JhdGU6Ly9jcmF0ZXMuaW8vdG9raW8tc3RyZWFtLzAuMS4xOCBcCi0gICAgY3JhdGU6Ly9jcmF0
ZXMuaW8vdG9raW8tdXRpbC8wLjcuMTggXAorICAgIGNyYXRlOi8vY3JhdGVzLmlvL3Rva2lvLXN0
cmVhbS8wLjEuMTkgXAorICAgIGNyYXRlOi8vY3JhdGVzLmlvL3Rva2lvLXV0aWwvMC43LjE5IFwK
ICAgICBjcmF0ZTovL2NyYXRlcy5pby90b21sLzEuMS4zK3NwZWMtMS4xLjAgXAogICAgIGNyYXRl
Oi8vY3JhdGVzLmlvL3RvbWxfZGF0ZXRpbWUvMS4xLjErc3BlYy0xLjEuMCBcCiAgICAgY3JhdGU6
Ly9jcmF0ZXMuaW8vdG9tbF9lZGl0LzAuMjUuMTMrc3BlYy0xLjEuMCBcCkBAIC0yNDksNyArMjQ1
LDYgQEAgU1JDX1VSSSArPSAiIFwKICAgICBjcmF0ZTovL2NyYXRlcy5pby92dGUvMC4xNC4xIFwK
ICAgICBjcmF0ZTovL2NyYXRlcy5pby93YWxrZGlyLzIuNS4wIFwKICAgICBjcmF0ZTovL2NyYXRl
cy5pby93YXNpLzAuMTEuMSt3YXNpLXNuYXBzaG90LXByZXZpZXcxIFwKLSAgICBjcmF0ZTovL2Ny
YXRlcy5pby93YXNpcDIvMS4wLjQrd2FzaS0wLjIuMTIgXAogICAgIGNyYXRlOi8vY3JhdGVzLmlv
L3dhc20tYmluZGdlbi8wLjIuMTE0IFwKICAgICBjcmF0ZTovL2NyYXRlcy5pby93YXNtLWJpbmRn
ZW4tbWFjcm8vMC4yLjExNCBcCiAgICAgY3JhdGU6Ly9jcmF0ZXMuaW8vd2FzbS1iaW5kZ2VuLW1h
Y3JvLXN1cHBvcnQvMC4yLjExNCBcCkBAIC0yNzksNyArMjc0LDYgQEAgU1JDX1VSSSArPSAiIFwK
ICAgICBjcmF0ZTovL2NyYXRlcy5pby93aW5kb3dzX3g4Nl82NF9nbnVsbHZtLzAuNTIuNiBcCiAg
ICAgY3JhdGU6Ly9jcmF0ZXMuaW8vd2luZG93c194ODZfNjRfbXN2Yy8wLjUyLjYgXAogICAgIGNy
YXRlOi8vY3JhdGVzLmlvL3dpbm5vdy8xLjAuMyBcCi0gICAgY3JhdGU6Ly9jcmF0ZXMuaW8vd2l0
LWJpbmRnZW4vMC41Ny4xIFwKICAgICBjcmF0ZTovL2NyYXRlcy5pby93cml0ZWFibGUvMC42LjIg
XAogICAgIGNyYXRlOi8vY3JhdGVzLmlvL3hhdHRyLzEuNi4xIFwKICAgICBjcmF0ZTovL2NyYXRl
cy5pby95b2tlLzAuOC4xIFwKQEAgLTMwNyw3ICszMDEsNyBAQCBTUkNfVVJJW2Fuc3R5bGUtd2lu
Y29uLTMuMC4xMS5zaGEyNTZzdW1dID0gIjI5MWU2YTI1MGZmODZjZDRhODIwMTEyZmI4ODk4ODA4
YTM2NgogU1JDX1VSSVthbnlob3ctMS4wLjEwNC5zaGEyNTZzdW1dID0gIjMzMGE1ZWQwN2ZhNTRl
NDcwMmM5ZDZjNDE3NGY3NDQyN2ZjMGVmNmUyMTRiYmQ2NzdhZTUwYTUwOTk5NDY0NzAiCiBTUkNf
VVJJW2FyY3N0ci0xLjIuMC5zaGEyNTZzdW1dID0gIjAzOTE4YzNkYmQ3NzAxYTg1YzZiOTg4Nzcz
MmUyOTIxMTc1ZjI2YzM1MGI0NTYzODQxZDA5NThjMjFkNTdlNmQiCiBTUkNfVVJJW2FycmF5dmVj
LTAuNy44LnNoYTI1NnN1bV0gPSAiZDNmYjY3YTZlMDhhY2YyNGZkZWNjYmFjMmNiNmFjNDMwNTgy
NWJkMWYxMTc0NjJlMGU2ZjJmMTkzMzQ1YWQ1NiIKLVNSQ19VUklbYXN0cmFsLXRva2lvLXRhci0w
LjYuMy5zaGEyNTZzdW1dID0gIjA4NjQ4ZmVmMzUzYWIzOWE5ZDI2ZjkwOWFkNTNmYzRmMDcxYmU0
YzkxODUzYjc4NTIzZjVjYzNkOWU1ZWJmZmQiCitTUkNfVVJJW2FzdHJhbC10b2tpby10YXItMC42
LjQuc2hhMjU2c3VtXSA9ICJiMTg0NTdlZmQxMzcyNTRlMDE2YmJkZTVlMWQ4OGRmNjFjNGUxYTVh
ZTIyMjM3NDZlNTYxMjNiYWM2YWYyNDYzIgogU1JDX1VSSVthc3RyYWwtdmVyc2lvbi1yYW5nZXMt
MC4yLjEuc2hhMjU2c3VtXSA9ICIxNDQ0NWY2NzA4ZTlhNjBkNTA5OGI2ZDZmOTlkYmU3YjViMzQ3
MTc4YjI3MzZlMWZhZDdhODdiMDRlMjg5NzkxIgogU1JDX1VSSVthc3RyYWxfYXN5bmNfemlwLTAu
MC4yMC5zaGEyNTZzdW1dID0gImJkOTM5ZDc5OTU5YzNmNDlhNjQ4YTFkNzg1N2Q2M2NjNjI1NDg3
MjVhNmIwNjBiOGRiZjBlYTVjOTI0NzBiNjMiCiBTUkNfVVJJW2FzeW5jLWNvbXByZXNzaW9uLTAu
NC4xOS5zaGEyNTZzdW1dID0gIjA2NTc1ZTZhOTY3MzU4MGY1MjY2MWM5MjEwN2JhYWJmZmJmNDFl
MjE0MTM3MzQ0MWNiY2RjNDdjYjczMzAwM2MiCkBAIC0zMjcsOSArMzIxLDkgQEAgU1JDX1VSSVti
eXRlcy0xLjEyLjEuc2hhMjU2c3VtXSA9ICJmYzY1MmE0OGMzNTJhZWYzZWEzYWVkMzIwODA1MDFj
ZjNlZjZlZDVkYTc4NjAKIFNSQ19VUklbY2MtMS4yLjU3LnNoYTI1NnN1bV0gPSAiN2EwZGQxY2Ez
ODQ5MzJmZjM2NDFjODcxOGEwMjc2OWYxNjk4ZTc1NjNkYzY5NzRmZmQwMzM0NjExNjMxMDQyMyIK
IFNSQ19VUklbY2ZnLWlmLTEuMC40LnNoYTI1NnN1bV0gPSAiOTMzMGY4YjJmZjEzZjM0NTQwYjQ0
ZTk0NmVmMzUxMTE4MjU3MjdiMzhkMzMyODZlZjk4NjE0MjYxNTEyMTgwMSIKIFNSQ19VUklbY2hh
cnNldC0wLjEuNS5zaGEyNTZzdW1dID0gImYxZjkyN2IwN2M3NGJhODRjN2U1ZmU0ZGIyYmFlYjNl
OTk2YWIyNjg4OTkyZTM5YWM2OGNlMzIyMGE2NzdjN2UiCi1TUkNfVVJJW2NsYXAtNC42LjMuc2hh
MjU2c3VtXSA9ICIwZmI5OTU2NTgxOTk4MDk5OWZiN2I0YTE3OTYwNDZhNWM5NDllNmQ0ZmYxMzJj
ZjVmYWRmNWE2NDFlMjBkNzc2IgorU1JDX1VSSVtjbGFwLTQuNi40LnNoYTI1NnN1bV0gPSAiZDkx
ZTBjMTQ1NzkyZWY3M2E2YWQzNmQyN2M3NWFjMDlmMTgzMjIyMmEzYzIwOTY4OWQ5MGY1MzQ2ODVl
ZTViNyIKIFNSQ19VUklbY2xhcF9idWlsZGVyLTQuNi4yLnNoYTI1NnN1bV0gPSAiZjA5NjI4YWZk
Y2M1MzhiNTdmM2M2MzQxZTljOGU5OTcwZjE4ZTRhNDgxNjkwYTY0OTc0ZDcwMjNiZDMzNTQ4YiIK
LVNSQ19VUklbY2xhcF9kZXJpdmUtNC42LjMuc2hhMjU2c3VtXSA9ICIzMmYyMzkyZWFlN2YxNjU1
N2EzZDcyN2VmM2ExMmU1N2IyYjJjYTZmOTg1NjZhNWY0ZmI0MWZmZTMwNWRmMDc3IgorU1JDX1VS
SVtjbGFwX2Rlcml2ZS00LjYuNC5zaGEyNTZzdW1dID0gImQwMTJkMmI5ZDY1YWNhN2YxOGY0ZDk4
NzhhMDQ1YmMxNzg5OWJiYTk1MTU2MWJhNWVjM2MyYmExZWVkOWEwNjEiCiBTUkNfVVJJW2NsYXBf
bGV4LTEuMS4wLnNoYTI1NnN1bV0gPSAiYzhkNGEzYmI4YjFlMGMxMDUwNDk5ZDE4MTVmNWFiMTZk
MDRmMDk1OWIyMzMwODVmYjMxNjUzZmJmYzlkOThmOSIKIFNSQ19VUklbY29sb3JjaG9pY2UtMS4w
LjUuc2hhMjU2c3VtXSA9ICIxZDA3NTUwYzkwMzZiZjJhZTBjNjg0YzQyOTdkNTAzZjgzODI4N2M4
M2M1MzY4NmQwNTM3MGQwZTEzOWFlNTcwIgogU1JDX1VSSVtjb25zb2xlLTAuMTYuNC5zaGEyNTZz
dW1dID0gIjRmZTVmNDY1YTRmNmZlZTg4ZmFkNDFiODVkOTkwZjg0YzgzNTMzNWU4NWI1ZDllNmU2
M2UwZDA2ZDI4Y2JhN2MiCkBAIC0zNTAsNyArMzQ0LDcgQEAgU1JDX1VSSVtkaWdlc3QtMC4xMS4z
LnNoYTI1NnN1bV0gPSAiZjFkZDZkYmI1ODQxOTM3OTQwNzgxODY2ZmExMjgxYTFmZjdiZDNiZjgy
NzAKIFNSQ19VUklbZGlzcGxheWRvYy0wLjIuNS5zaGEyNTZzdW1dID0gIjk3MzY5Y2JiYzA0MWJj
MzY2OTQ5YmM3NGQzNDY1OGQ2Y2RhNTYyMTAzOTczMWM2MzEwNTIxODkyYTNhMjBhZTAiCiBTUkNf
VVJJW2R1bmNlLTEuMC41LnNoYTI1NnN1bV0gPSAiOTI3NzM1MDRkNThjMDkzZjZkZTI0NTlhZjRh
ZjMzZmFhNTE4YzEzNDUxZWI4ZjJiNTY5OGVkM2QzNmU3YzgxMyIKIFNSQ19VUklbZHluLWNsb25l
LTEuMC4yMC5zaGEyNTZzdW1dID0gImQwODgxZWExODFiMWRmNzNmZjc3ZmZhYWY5Yzc1NDRlY2Mx
MWU4MmZiYTliNWYyN2IyNjJhM2M3M2EzMzI1NTUiCi1TUkNfVVJJW2VpdGhlci0xLjE2LjAuc2hh
MjU2c3VtXSA9ICI5MTYyMmZmNWU3MTYyMDE4MTAxZjJmZWE0MGQ2ZWJmNGE3OGJiZTVhNDk3MzZh
MjAyMDY0OWVkZjk2OTM2NzllIgorU1JDX1VSSVtlaXRoZXItMS4xNy4wLnNoYTI1NnN1bV0gPSAi
OWU1ZThmNmMxNWEyNGI5YTNlZTVlZmVjODA5Y2NkMDA2ZDNiMzBlOGIzYmI2M2MzOWFmNzM3Yzdm
ODdkYWExZCIKIFNSQ19VUklbZW5jb2RlX3VuaWNvZGUtMS4wLjAuc2hhMjU2c3VtXSA9ICIzNGFh
NzM2NDZmZmIwMDZiOGY1MTQ3ZjNkYzE4MmJkNGJjYjE5MDIyN2NlODYxZmM0YTQ4NDRiZjhlM2Ni
MmMwIgogU1JDX1VSSVtlbmNvZGluZ19ycy0wLjguMzUuc2hhMjU2c3VtXSA9ICI3NTAzMGYzYzRm
NDVkYWZkNzU4NmRkNjc4MDk2NWE4YzdlOGUyODVhNWVjYjg2NzEzZTYzYTc5YzViMjc2NmYzIgog
U1JDX1VSSVtlbmNvZGluZ19yc19pby0wLjEuNy5zaGEyNTZzdW1dID0gIjFjYzNjNTY1MWZiNjJh
YjhhYTMxMDM5OThkYWRlNTdlZmRkMDI4NTQ0YmQzMDA1MTZiYWEzMTg0MGMyNTJhODMiCkBAIC0z
NzgsNyArMzcyLDYgQEAgU1JDX1VSSVtmdXR1cmVzLXNpbmstMC4zLjMzLnNoYTI1NnN1bV0gPSAi
ZTM0NDE4YWM0OTlkNjMwNWMyZmI1YWQwZWQyZjZhYzk5OGM1ZjgKIFNSQ19VUklbZnV0dXJlcy10
YXNrLTAuMy4zMy5zaGEyNTZzdW1dID0gImIyMzFlZDI4ODMxZWZiNGE2MWEwODU4MGM0YmMyMzNl
YzU2YmMwMDlmNGNkOGY1MmRhMmMzY2I5N2RmMGMxMDkiCiBTUkNfVVJJW2Z1dHVyZXMtdXRpbC0w
LjMuMzMuc2hhMjU2c3VtXSA9ICJhNzdhOTBhMjU2ZmNlMzRkYTY2NDE1MjcxZTMwZjk0ZWU5MWM1
N2IwNGI4YTJjMDQyZDljZjMyMjAxNzlkZWFhIgogU1JDX1VSSVtnZW5lcmljLWFycmF5LTAuMTQu
Ny5zaGEyNTZzdW1dID0gIjg1NjQ5Y2E1MWZkNzIyNzJkNzgyMWFkYWYyNzRhZDkxYzI4ODI3Nzcx
M2Q5YzE4ODIwZDg0OTlhN2ZmNjllOWEiCi1TUkNfVVJJW2dldHJhbmRvbS0wLjMuNC5zaGEyNTZz
dW1dID0gIjg5OWRlZjVjMzdjNGZkN2IyNjY0NjQ4YzI4MTIwZWNlYzEzOGU0ZDM5NWI0NTllNWNh
MzRmOWNjZTJkZDc3ZmQiCiBTUkNfVVJJW2dldHJhbmRvbS0wLjQuMy5zaGEyNTZzdW1dID0gIjMw
MGU4ODNkNzU2YjJlNGVjOTRlMDI3OTFmMzliMDRiNTIyMjc2MTM4ODUyY2ZjNDFkOWZiN2U5MDQx
MDYwOTkiCiBTUkNfVVJJW2dsb2JzZXQtMC40LjE5LnNoYTI1NnN1bV0gPSAiZTQ3ZDM3ZDJhZTQ0
NjQyNTQ4ODRiNjBhYjcwNzFiZTJiODc2YTljMzViNjk2YmQwMThkZGNjNzY4NDczMDljZCIKIFNS
Q19VUklbZ2xvby10aW1lcnMtMC4zLjAuc2hhMjU2c3VtXSA9ICJiYmIxNDNjZjk2MDk5ODAyMDMz
ZTBkNGY0OTYzYjE5ZmQyZTBiNzI4YmNmMDc2Y2Q5Y2Y3ZjY2MzRmMDkyOTk0IgpAQCAtNDAyLDkg
KzM5NSw5IEBAIFNSQ19VUklbaW5zdGEtMS40OC4wLnNoYTI1NnN1bV0gPSAiODZmMGY4ZmVlOGM5
MjY0MTVjNThkNmFlNDNhMDg1MjNhMjZmYWNjYjIzMjNmCiBTUkNfVVJJW2lzX3Rlcm1pbmFsX3Bv
bHlmaWxsLTEuNzAuMi5zaGEyNTZzdW1dID0gImE2Y2IxMzhiYjc5YTE0NmMxYmQ0NjAwMDU2MjNl
MTQyZWYwMTgxZTNkMDIxOWNiNDkzZTAyZjdkMDhhMzU2OTUiCiBTUkNfVVJJW2l0ZXJ0b29scy0w
LjE0LjAuc2hhMjU2c3VtXSA9ICIyYjE5MmM3ODIwMzdmYWRkOWNmYTc1NTQ4MzEwNDg4YWFiZGJm
M2QyZGE3Mzg4NWIzMWJkMGFiZDAzMzUxMjg1IgogU1JDX1VSSVtpdG9hLTEuMC4xNy5zaGEyNTZz
dW1dID0gIjkyZWNjNjYxODE4MWRlZjA0NTczOTJjY2QwZWU1MTE5OGUwNjVlMDE2ZDFkNTI3YTdh
YzFiNmRjN2MxZjA5ZDIiCi1TUkNfVVJJW2ppZmYtMC4yLjM0LnNoYTI1NnN1bV0gPSAiZTE4NGQw
OTU0N2I4MGViN2UyMGQxNDFiYTJmYjFmYmFjODQzY2E1M2Y0Y2YxYjMxMjEwYWRjNGMxYWRjNmUx
NiIKK1NSQ19VUklbamlmZi0wLjIuMzUuc2hhMjU2c3VtXSA9ICI2NjhiNzE4M2JkMDdhZjlhNDg4
NWY1YzM1YjBjYzVjODNjNDYwN2E5MTNjMTZiN2UxNzI5MTgzMjkxMGQyZGNjIgogU1JDX1VSSVtq
aWZmLWNvcmUtMC4xLjAuc2hhMjU2c3VtXSA9ICI3ZmVjYTg4NDM5ZWZlNTNkYTM3NTQ1MDBjMTg1
MWRlZGYzY2IzNmM1MjRkZDVjZjgyMjVjYzA3OTRkZTk1ZDA5IgotU1JDX1VSSVtqaWZmLXN0YXRp
Yy0wLjIuMzQuc2hhMjU2c3VtXSA9ICIzMjNkYTA3NmI3YTZmYWY5MTRkYzY3N2NiMDVhNGI5MDc3
NDJmZjczNzVjODMyMmM5ZTdmNTA2MWU1ZTBlOWRlIgorU1JDX1VSSVtqaWZmLXN0YXRpYy0wLjIu
MzUuc2hhMjU2c3VtXSA9ICIzYTY5ZGNiM2EyMWNmYjMyY2UxY2QwNTYxNjkzMzdjYTI4NGFmMDc2
NmRkNzY2ZTc4Nzg4MTliMjUxYTQ5MjA0IgogU1JDX1VSSVtqaWZmLXR6ZGItMC4xLjguc2hhMjU2
c3VtXSA9ICIxNDJiZDM5OTMyYWQyMzFmMTA1MTNkZjlhYjYyNjYxZmVhZDg3MTk4NzIxNTBiN2Fk
MDJhMmRmNzlmNGUxNDFlIgogU1JDX1VSSVtqaWZmLXR6ZGItcGxhdGZvcm0tMC4xLjMuc2hhMjU2
c3VtXSA9ICI4NzVhNWE2OWFjMmJhYjFhODkxNzExY2Y1ZWNjYmVjMWNlMDM0MWVhODA1NTYwZGNk
OTBiN2EyZTkyNTEzMmU4IgogU1JDX1VSSVtqb2JzZXJ2ZXItMC4xLjM1LnNoYTI1NnN1bV0gPSAi
MWMwMGFjYmQyOWVhYmFkNGEyMzkyZmEwZTkyMWM4NzQ5MzRkYmJmNDE5NDMxMmFkMjBmMDRhMGVk
NjdhM2NiMyIKQEAgLTQxMiw3ICs0MDUsNiBAQCBTUkNfVVJJW2pzLXN5cy0wLjMuOTEuc2hhMjU2
c3VtXSA9ICJiNDk3MTViNzA3M2YzODViYTRiYzUyOGU1NzQ3ZDAyZTY2Y2IzOWM2MTQ2ZQogU1JD
X1VSSVtqdW5jdGlvbi0yLjAuMC5zaGEyNTZzdW1dID0gIjE2MGYyZWFkZTA5N2YzMDI2M2I1NDhh
YWU1ZGViMTJhZDM0OWM5MDliYWE3MTBmYTI0YjkyYzkwOTBiMmUwMDYiCiBTUkNfVVJJW2xhenlf
c3RhdGljLTEuNS4wLnNoYTI1NnN1bV0gPSAiYmJkMmJjYjRjOTYzZjJkZGFlMDZhMmVmYzdlOWYz
NTkxMzEyNDczYzUwYzY2ODVlMWYyOTgwNjgzMTZlNjZmZSIKIFNSQ19VUklbbGliYy0wLjIuMTg2
LnNoYTI1NnN1bV0gPSAiNjhhYjkxMDE3ZmUxNmM2MjI0ODY4NDBlNGM4M2M5YTM3YWZlZmY5Nzhi
ZDIzOWI1MjkzZDYxZWNlNTg3ZGU2NiIKLVNSQ19VUklbbGludXgtcmF3LXN5cy0wLjQuMTUuc2hh
MjU2c3VtXSA9ICJkMjZjNTJkYmQzMmRjY2YyZDEwY2FjNzcyNWY4ZWFlNTI5Njg4NWZiNTcwM2Iy
NjFmN2QwYTA3MzllYzgwN2FiIgogU1JDX1VSSVtsaW51eC1yYXctc3lzLTAuMTIuMS5zaGEyNTZz
dW1dID0gIjMyYTY2OTQ5ZTAzMGRhMDBlOGM3ZDQ0MzRiMjUxNjcwYTkxNTU2ZjQxNDQ5NDFkMzc0
NTI3NjljMjVkNThhNTMiCiBTUkNfVVJJW2xpdGVtYXAtMC44LjEuc2hhMjU2c3VtXSA9ICI2Mzcz
NjA3YTU5ZjBiZTczYTM5YjZmZTQ1NmI4MTkyZmNjMzU4NWY2MDJhZjIwNzUxNjAwZTk3NGRkNDU1
ZTc3IgogU1JDX1VSSVtsb2NrX2FwaS0wLjQuMTQuc2hhMjU2c3VtXSA9ICIyMjQzOTllNzRiODdi
NWYzNTU3NTExZDk4ZGZmOGIxNDA4OWIzZGFkYWZjYWI2YmI5M2VhYjY3ZDNhYWNlOTY1IgpAQCAt
NDUyLDcgKzQ0NCw2IEBAIFNSQ19VUklbcHRyX21ldGEtMC4zLjEuc2hhMjU2c3VtXSA9ICIwYjlh
MGNmOTVhMTE5NmFmNjFkNGYxY2JkYWI5NjcxNzk1MTZkOWE0YTQzCiBTUkNfVVJJW3B0cl9tZXRh
X2Rlcml2ZS0wLjMuMS5zaGEyNTZzdW1dID0gIjczNDc4NjdkMGE3ZTEyMDhkOTNiNDY3NjdiZTgz
ZTJiOGY5NzhjM2RhZDM1Zjc3NWFjOGQ4ODQ3NTUxZDZmZTEiCiBTUkNfVVJJW3F1b3RlLTEuMC40
Ny5zaGEyNTZzdW1dID0gIjFmYmY0ZGIxNDJhNDczYThkODBjMjZiYmYxODQ1NGVkNDU4YmY4ZDI2
YzgyMTljMzMxZGFlY2ZkYmQwNzkwMDEiCiBTUkNfVVJJW3F1b3RlZF9wcmludGFibGUtMC41LjEu
c2hhMjU2c3VtXSA9ICI2NDBjOWJkODQ5N2IwMjQ2NWFlZWY1Mzc1MTQ0YzI2MDYyZTBkY2Q1OTM5
ZGZjYmIwZjVkYjc2Y2I4YzE3YzczIgotU1JDX1VSSVtyLWVmaS01LjMuMC5zaGEyNTZzdW1dID0g
IjY5Y2RiMzRjMTU4Y2ViMjg4ZGYxMWUxOGI0YmQzOWRlOTk0ZjY2NTdkODM4NDdiZGZmZGJkN2Yz
NDY3NTRiMGYiCiBTUkNfVVJJW3ItZWZpLTYuMC4wLnNoYTI1NnN1bV0gPSAiZjhkY2M5YzdkNTJh
ODExNjk3ZDIxNTFjNzAxZTBkMDg5NTZmOTJiMGUyNDEzNmNmNGNmMjdiNTdhNmEwZDliZiIKIFNS
Q19VUklbcmFuY29yLTAuMS4xLnNoYTI1NnN1bV0gPSAiYTA2M2VhNzIzODE1MjdjMmEwNTYxZGE5
YzgwMDAwZWY4MjJiZGQ3YzMyNDFiMWNjMWIxMjEwMGUzZGYwODFlZSIKIFNSQ19VUklbcmVkb3hf
c3lzY2FsbC0wLjUuMTUuc2hhMjU2c3VtXSA9ICI3ZThhZjBkZGUwOTQwMDYwMTFlNmE3NDBkNDg3
OTMxOTQzOTQ4OTgxM2JkMGJjZGM3ZDgyMWJlYWVlZmY0OGVjIgpAQCAtNDY2LDcgKzQ1Nyw2IEBA
IFNSQ19VUklbcmVuZC0wLjUuMy5zaGEyNTZzdW1dID0gImNhZGFkZWYzMTdjMmYyMDc1NWE2NGQ3
ZmRjNDhmOWU3MTc4ZWU2YjBlMWY3ZmNlCiBTUkNfVVJJW3JreXYtMC44LjE3LnNoYTI1NnN1bV0g
PSAiODE1Y2M4YTM3MTU5YTQ2MzA2NDgyNTI0NmNhZGIwNzk2MWUyNWNkOTg4NTkwODYwNmY2ZDA4
YTk4ZDhmODg3NCIKIFNSQ19VUklbcmt5dl9kZXJpdmUtMC44LjE3LnNoYTI1NnN1bV0gPSAiYzBl
ZDFhNzhhMWIxOWQxODRiMGRhYTYyOWRkOWEwMjQ1NzMxNzNlYzdkNDg1YjI4N2NiMzY5ZmIzNjA3
Y2MxYyIKIFNSQ19VUklbcnVzdGMtaGFzaC0yLjEuMy5zaGEyNTZzdW1dID0gIjZiMWU3ZjlhNDI4
NTcxYmUyZGM1YmMwNTA1YzEzZmI2YmY5MzY4MjJiODk0ZWM4N2FiZjhhMDhhNGU1MTc0MmQiCi1T
UkNfVVJJW3J1c3RpeC0wLjM4LjQ0LnNoYTI1NnN1bV0gPSAiZmRiNWJjMWFlMmJhYTU5MTgwMGRm
MTZjOWNhNzg2MTliZjY1YzA0ODhiNDFiOTZjY2VjNWQxMTIyMGQ4YzE1NCIKIFNSQ19VUklbcnVz
dGl4LTEuMS40LnNoYTI1NnN1bV0gPSAiYjZmZTQ1NjViOTUxOGI4M2VmNGY5MWJiNDdjZTI5NjIw
Y2E4MjhiZDMyY2I3ZTQwOGYwMDYyZTk5MzBiYTE5MCIKIFNSQ19VUklbcnVzdHZlcnNpb24tMS4w
LjIyLnNoYTI1NnN1bV0gPSAiYjM5Y2RlZjBmYTgwMGZjNDQ1MjVjODRjY2I1NGEwMjk5NjFhODIx
NWY5NjE5NzUzNjM1YTljMGQyNTM4ZDQ2ZCIKIFNSQ19VUklbcnl1LTEuMC4yMy5zaGEyNTZzdW1d
ID0gIjk3NzRiYTRhNzRkZTVmN2IxYzE0NTFlZDZjZDUyODVhMzJlZGRiNWNjY2I4Y2M2NTVhNGU1
MDAwOWUwNjQ3N2YiCkBAIC00ODEsNyArNDcxLDcgQEAgU1JDX1VSSVtzZXJkZS11bnRhZ2dlZC0w
LjEuOS5zaGEyNTZzdW1dID0gImY5ZmFmNDhhNGEyZDI2OTNiZTI0YzYyODlkYmUyNjU1Mjc3NmUK
IFNSQ19VUklbc2VyZGVfY29yZS0xLjAuMjI5LnNoYTI1NnN1bV0gPSAiNjdkY2EyYzljNTFlNThh
NDc5MWE0YjFlZDU4MzA4YjM5YzY0MjI0ZDM0OWE5MzVhYjUwMzlhYTM2MDk0MmE0OCIKIFNSQ19V
Uklbc2VyZGVfZGVyaXZlLTEuMC4yMjkuc2hhMjU2c3VtXSA9ICJlN2E1ZDcxMjYzYTVhN2Q0N2I0
MWY2YjNmMDZiYTI3NmYxMGNjMThiMDkzMWYxNzk5ZjcxMDU3OGUyMzA5MzQ4IgogU1JDX1VSSVtz
ZXJkZV9kZXJpdmVfaW50ZXJuYWxzLTAuMjkuMS5zaGEyNTZzdW1dID0gIjE4ZDI2YTIwYTk2OWI5
ZTNmZGYyZmMyZDlmMjFlZGE2YzQwZTJkZTg0Yzk0MDhiYjVkM2IwNWQ0OTlhYWU3MTEiCi1TUkNf
VVJJW3NlcmRlX2pzb24tMS4wLjE1MC5zaGEyNTZzdW1dID0gImU4MDE0ZTQ0YjQ3MzZlZDA1Mzhh
ZGVlY2RlZDBmY2UyYTI3MmYyMmRjOTU3OGE3ZWI2YjJkOTk5M2M3NGNmYjkiCitTUkNfVVJJW3Nl
cmRlX2pzb24tMS4wLjE1MS5zaGEyNTZzdW1dID0gImM4NDFiNTVlY2RhZTA5OGM4MGRjYWU5Y2Y3
NjdmNmY4YTBjMmNkYjM0MTZiYmVmNzIxODFkZjRkMGZlNzNmMTQiCiBTUkNfVVJJW3NlcmRlX3Nw
YW5uZWQtMS4xLjEuc2hhMjU2c3VtXSA9ICI2NjYyYjU4Nzk1MTFlMDZlODk5OWE4YTIzNWQ4NDgx
MTNlOTQyYzkxMjRmMjExNTExYjE2NDY2ZWUyOTk1ZjI2IgogU1JDX1VSSVtzaGEyLTAuMTAuOS5z
aGEyNTZzdW1dID0gImE3NTA3ZDgxOTc2OWQwMWEzNjVhYjcwNzc5NGE0MDg0MzkyYzgyNGY1NGE3
YTZhNzg2MmY4YzNkMDg5MmIyODMiCiBTUkNfVVJJW3NoYTItMC4xMS4wLnNoYTI1NnN1bV0gPSAi
NDQ2YmE3MTc1MDk1MjRjYjNmMjJmMTdlY2MwOTZmMTBmNDgyMmQ3NmFiNWMwYjk4MjJjNWY5YzI4
NGU4MjVmNCIKQEAgLTUxMyw4ICs1MDMsOCBAQCBTUkNfVVJJW3Rpbnl2ZWMtMS4xMS4wLnNoYTI1
NnN1bV0gPSAiM2U2MWU2NzA1M2QyNWE0ZTgyYzg0NGU4NDI0MDM5ZDk3NDU3ODFiM2ZjNAogU1JD
X1VSSVt0aW55dmVjX21hY3Jvcy0wLjEuMS5zaGEyNTZzdW1dID0gIjFmM2NjYmFjMzExZmVhMDVm
ODZmNjE5MDRiNDYyYjU1ZmIzZGY4ODM3YTM2NmRmYzYwMWEwMTYxZDA1MzJmMjAiCiBTUkNfVVJJ
W3Rva2lvLTEuNTMuMS5zaGEyNTZzdW1dID0gIjIwMmNhZWE4NzFiNjk2NjgyNTBkMjQyMDcwODQ5
ZWI0OTViZTE3OGVkNjk3YTNlOThhZWJjZTViYzgxYTBiZWQiCiBTUkNfVVJJW3Rva2lvLW1hY3Jv
cy0yLjcuMC5zaGEyNTZzdW1dID0gIjM4NWE2Y2I3MWFiOWFiNzkwYzVmZThkNjdmMTY0NWU2YzQ1
MGE3Y2UwMDZhMzNkZTAzZGFhOTU2Y2Y3MGE0OTYiCi1TUkNfVVJJW3Rva2lvLXN0cmVhbS0wLjEu
MTguc2hhMjU2c3VtXSA9ICIzMmRhNDk4MDlhYWI1YzNiYzY3OGFmMDM5MDJkNGNjZGRlYTJhODdk
MDI4ZDg2MzkyYTRiMTU2MGM2OTA2YzcwIgotU1JDX1VSSVt0b2tpby11dGlsLTAuNy4xOC5zaGEy
NTZzdW1dID0gIjlhZTljZWM4MDViMDFlOGZjM2ZkMmZlMjg5Zjg5MTQ5YTliNjZkZDE2Nzg2YWJk
OGIxOWNmYTdiNDhjYjAwOTgiCitTUkNfVVJJW3Rva2lvLXN0cmVhbS0wLjEuMTkuc2hhMjU2c3Vt
XSA9ICJhM2QwNmYwYjA4MmJhNTdjMjZiNzk0MDczNzJlNTdjZjJhMWUyODEyNGY3OGU5NDc5ZmU4
MDMyMmNmNTM0MjBiIgorU1JDX1VSSVt0b2tpby11dGlsLTAuNy4xOS5zaGEyNTZzdW1dID0gIjQ5
NDgxNWQwOWJmNTJiNTU0ODY1OTg1MTA4MTIzOGYwY2EzOWZmNjM4MzYzOTA3NTk2ZGE3Mzk1NjFj
NjJjNTIiCiBTUkNfVVJJW3RvbWwtMS4xLjMrc3BlYy0xLjEuMC5zaGEyNTZzdW1dID0gIjUzYzk2
ZWNkZmE5NDFjOGZjNGZjYWVkMTRmOTlhZGE4ZWJlZDUwMmVlZjUzMzAxNTA5NWEwN2UzMzAxZDRj
M2MiCiBTUkNfVVJJW3RvbWxfZGF0ZXRpbWUtMS4xLjErc3BlYy0xLjEuMC5zaGEyNTZzdW1dID0g
IjMxNjVmNjVmNjJlMjhlMDExNWEwMGIyZWJkZDM3ZWI2ZjNiNjQxODU1ZjlkNjM2ZDNjZDQxMDM3
NjcxNTlhZDciCiBTUkNfVVJJW3RvbWxfZWRpdC0wLjI1LjEzK3NwZWMtMS4xLjAuc2hhMjU2c3Vt
XSA9ICI2OTc1MzY3ZTRkMmVmNzY2ZDg2YWYwMWZmYWQxNGI2MjJmZWNjOGQ0MzU3YTk5OGZiYzRk
ZWI2ZTliYWNhZjliIgpAQCAtNTQzLDcgKzUzMyw2IEBAIFNSQ19VUklbdmVyc2lvbl9jaGVjay0w
LjkuNS5zaGEyNTZzdW1dID0gIjBiOTI4ZjMzZDk3NWZjNmFkOWY4NmM4ZjI4Mzg1M2FkMjZiZGQ1
CiBTUkNfVVJJW3Z0ZS0wLjE0LjEuc2hhMjU2c3VtXSA9ICIyMzFmZGNkN2VmMzAzN2U4MzMwZDhl
MTdlNjEwMTFhMmMyNDQxMjZhY2MwYTk4MmY0MDQwYWMzZjlmMGJjMDc3IgogU1JDX1VSSVt3YWxr
ZGlyLTIuNS4wLnNoYTI1NnN1bV0gPSAiMjk3OTA5NDY0MDRmOTFkOWM1ZDA2Zjk4NzRlZmRkZWEx
ZGMwNmM1ZWZlOTQ1NDFhN2Q2ODYzMTA4ZTNhNWU0YiIKIFNSQ19VUklbd2FzaS0wLjExLjErd2Fz
aS1zbmFwc2hvdC1wcmV2aWV3MS5zaGEyNTZzdW1dID0gImNjZjNlYzY1MWE4NDdlYjAxZGU3M2Nj
YWQxNWViN2Q5OWY4MDQ4NWRlMDQzZWZiMmYzNzBjZDY1NGY0ZWE0NGIiCi1TUkNfVVJJW3dhc2lw
Mi0xLjAuNCt3YXNpLTAuMi4xMi5zaGEyNTZzdW1dID0gImI2N2VmYjM3ZTEwNmU1NWNlNzIyYTUx
MGQ2YjVmOWMxN2YwODNlNWZjNzlhZmMyYmFkZWIxMmNjMzEzZDk0ODciCiBTUkNfVVJJW3dhc20t
YmluZGdlbi0wLjIuMTE0LnNoYTI1NnN1bV0gPSAiNjUzMmY5YTVjMWVjZTM3OThjYjFjMmNmZGJh
NjQwYjliM2JhODg0ZjVkYjQ1OTczYTZmNDQyNTEwYTg3ZDM4ZSIKIFNSQ19VUklbd2FzbS1iaW5k
Z2VuLW1hY3JvLTAuMi4xMTQuc2hhMjU2c3VtXSA9ICIxOGEyZDUwZmNmMTA1ZmIzM2JiMTVmMDBl
N2E3N2I3NzI5NDVhMmVlNDVkY2Y0NTQ5NjFmZDg0M2U3NGMxOGU2IgogU1JDX1VSSVt3YXNtLWJp
bmRnZW4tbWFjcm8tc3VwcG9ydC0wLjIuMTE0LnNoYTI1NnN1bV0gPSAiMDNjZTRjYWVhYWM1NDdj
ZGY3MTNkMjgwZWRhMjJhNzMwODI0ZGQxMWU2YjhjM2NhOWU0MjI0N2IyNWM2MzFlMyIKQEAgLTU3
Myw3ICs1NjIsNiBAQCBTUkNfVVJJW3dpbmRvd3NfeDg2XzY0X2dudS0wLjUyLjYuc2hhMjU2c3Vt
XSA9ICIxNDdhNWM4MGFhYmZiZjBjN2Q5MDFjYjU4OTVkMWRlMwogU1JDX1VSSVt3aW5kb3dzX3g4
Nl82NF9nbnVsbHZtLTAuNTIuNi5zaGEyNTZzdW1dID0gIjI0ZDViMjNkYzQxNzQxMjY3OTY4MTM5
NmYyYjQ5ZjNkZThjMTQ3M2RlYjUxNmJkMzQ0MTA4NzJlZmY1MWVkMGQiCiBTUkNfVVJJW3dpbmRv
d3NfeDg2XzY0X21zdmMtMC41Mi42LnNoYTI1NnN1bV0gPSAiNTg5ZjZkYTg0YzY0NjIwNDc0N2Qx
MjcwYTJhNTY2MWVhNjZlZDFjY2VkMjYzMWQ1NDZmZGZiMTU1OTU5ZjllYyIKIFNSQ19VUklbd2lu
bm93LTEuMC4zLnNoYTI1NnN1bV0gPSAiMDU5MmUxYzlkMTUxZjg1NGU2ZmQzODI1NzRjM2EwODU1
MjUwZTFkOWIyZjk5ZDkyODFjNmU2MzkxYWYzNTJmMSIKLVNSQ19VUklbd2l0LWJpbmRnZW4tMC41
Ny4xLnNoYTI1NnN1bV0gPSAiMWViZjk0NGU4N2E3YzI1MzIzM2FkNjc2NmUwODJlM2NkNzE0YjVk
MDM4MTJhY2MyNGMzMThmNTQ5NjE0NTM2ZSIKIFNSQ19VUklbd3JpdGVhYmxlLTAuNi4yLnNoYTI1
NnN1bV0gPSAiOWVkZGUwZGI0NzY5ZDJkYzY4NTc5ODkzZjIzMDZiMjZjNmVjZmJlMGVmNDk5YjAx
M2Q3MzFiN2I5MjQ3ZTBiOSIKIFNSQ19VUklbeGF0dHItMS42LjEuc2hhMjU2c3VtXSA9ICIzMmU0
NWFkNDIwNmY2ZDI0NzkwODUxNDdmMDJiYzJlZjgzNGFjODU4ODY2MjRhMjM1NzVhZTEzN2M4YWE4
MTU2IgogU1JDX1VSSVt5b2tlLTAuOC4xLnNoYTI1NnN1bV0gPSAiNzJkNmU1YzZhZmI4NGQ3Mzk0
NGU1Y2VkYjA1MmM0NjgwZDU2NTczMzcyMDE1NTVmOWYyYTE2Yjc0MDZkNDk1NCIKZGlmZiAtLWdp
dCBhL21ldGEvcmVjaXBlcy1kZXZ0b29scy9weXRob24vcHl0aG9uMy11di1idWlsZF8wLjEyLjEu
YmIgYi9tZXRhL3JlY2lwZXMtZGV2dG9vbHMvcHl0aG9uL3B5dGhvbjMtdXYtYnVpbGRfMC4xMi4y
LmJiCnNpbWlsYXJpdHkgaW5kZXggOTIlCnJlbmFtZSBmcm9tIG1ldGEvcmVjaXBlcy1kZXZ0b29s
cy9weXRob24vcHl0aG9uMy11di1idWlsZF8wLjEyLjEuYmIKcmVuYW1lIHRvIG1ldGEvcmVjaXBl
cy1kZXZ0b29scy9weXRob24vcHl0aG9uMy11di1idWlsZF8wLjEyLjIuYmIKaW5kZXggY2EyMDYx
YzM3MS4uZDU3Y2RiMDJkMCAxMDA2NDQKLS0tIGEvbWV0YS9yZWNpcGVzLWRldnRvb2xzL3B5dGhv
bi9weXRob24zLXV2LWJ1aWxkXzAuMTIuMS5iYgorKysgYi9tZXRhL3JlY2lwZXMtZGV2dG9vbHMv
cHl0aG9uL3B5dGhvbjMtdXYtYnVpbGRfMC4xMi4yLmJiCkBAIC0xMSw3ICsxMSw3IEBAIExJQ19G
SUxFU19DSEtTVU0gPSAiZmlsZTovL0xJQ0VOU0UtQVBBQ0hFO21kNT04NmQzZjNhOTVjMzI0Yzk0
NzliZDg5ODY5NjhmNDMyNyBcCiAgICAgICAgICAgICAgICAgICAgIGZpbGU6Ly9jcmF0ZXMvdXYt
cGVwNTA4L0xpY2Vuc2UtQXBhY2hlO21kNT1lMjNmYWRkNmNlZWY4YzYxOGZjMWM2NTE5MWQ4NDZm
YSBcCiAgICAgICAgICAgICAgICAgICAgIGZpbGU6Ly9jcmF0ZXMvdXYtcGVwNTA4L0xpY2Vuc2Ut
QlNEO21kNT1lZjdhNjAyN2RjNGMyMzg5YjlhZmFkN2U2OTAyNzRjNyIKIAotU1JDX1VSSVtzaGEy
NTZzdW1dID0gIjMxZDI3NjdmYjA0Nzc3YjFkYzI0MDhiMjNiZTlkMWFkNTBlZTFmNTY2YmZlZmI3
OTM1Y2JmZGQzNGZlYWQwNDciCitTUkNfVVJJW3NoYTI1NnN1bV0gPSAiMGY4Y2M1NzIxOGMyNjY2
Yzc3NDg1MTQ3YjJkYzU0ZTE4NTc2NGJjNjJiNjNmNzhlMDQyOWU3ZjljMzBhODQ5NSIKIAogcmVx
dWlyZSAke0JQTn0tY3JhdGVzLmluYwogCi0tIAoyLjQ3LjEKCg==

--===============3413278434658503312==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: attachment; filename="buildhistory-diff-full.txt"

packages/x86-64-v3-poky-linux/python3-uv-build: PV changed from "0.12.1" to "0.12.2"
packages/x86-64-v3-poky-linux/python3-uv-build: SRC_URI changed from "https://files.pythonhosted.org/packages/source/u/uv_build/uv_build-0.12.1.tar.gz;downloadfilename=uv_build-0.12.1.tar.gz crate://crates.io/adler2/2.0.1 crate://crates.io/aho-corasick/1.1.4 crate://crates.io/allocator-api2/0.2.21 crate://crates.io/anstream/1.0.0 crate://crates.io/anstyle/1.0.14 crate://crates.io/anstyle-parse/1.0.0 crate://crates.io/anstyle-query/1.1.5 crate://crates.io/anstyle-wincon/3.0.11 crate://crates.io/anyhow/1.0.104 crate://crates.io/arcstr/1.2.0 crate://crates.io/arrayvec/0.7.8 crate://crates.io/astral-tokio-tar/0.6.3 crate://crates.io/astral-version-ranges/0.2.1 crate://crates.io/astral_async_zip/0.0.20 crate://crates.io/async-compression/0.4.19 crate://crates.io/autocfg/1.5.0 crate://crates.io/backon/1.6.0 crate://crates.io/base64/0.22.1 crate://crates.io/bitflags/1.3.2 crate://crates.io/bitflags/2.13.1 crate://crates.io/block-buffer/0.10.4 crate://crates.io/block-buffer/0.12.1 crate://cr
 ates.io/boxcar/0.2.14 crate://crates.io/bstr/1.12.1 crate://crates.io/bumpalo/3.20.2 crate://crates.io/bytecheck/0.8.2 crate://crates.io/bytecheck_derive/0.8.2 crate://crates.io/bytes/1.12.1 crate://crates.io/cc/1.2.57 crate://crates.io/cfg-if/1.0.4 crate://crates.io/charset/0.1.5 crate://crates.io/clap/4.6.3 crate://crates.io/clap_builder/4.6.2 crate://crates.io/clap_derive/4.6.3 crate://crates.io/clap_lex/1.1.0 crate://crates.io/colorchoice/1.0.5 crate://crates.io/console/0.16.4 crate://crates.io/const-oid/0.10.2 crate://crates.io/cpufeatures/0.2.17 crate://crates.io/cpufeatures/0.3.0 crate://crates.io/crc32fast/1.5.0 crate://crates.io/crypto-common/0.1.7 crate://crates.io/crypto-common/0.2.2 crate://crates.io/csv/1.4.0 crate://crates.io/csv-core/0.1.13 crate://crates.io/data-encoding/2.11.0 crate://crates.io/defmt/1.1.0 crate://crates.io/defmt-macros/1.1.0 crate://crates.io/defmt-parser/1.0.0 crate://crates.io/digest/0.10.7 crate://crates.io/digest/0.11.3 crate://crates.io/displa
 ydoc/0.2.5 crate://crates.io/dunce/1.0.5 crate://crates.io/dyn-clone/1.0.20 crate://crates.io/either/1.16.0 crate://crates.io/encode_unicode/1.0.0 crate://crates.io/encoding_rs/0.8.35 crate://crates.io/encoding_rs_io/0.1.7 crate://crates.io/enumflags2/0.7.12 crate://crates.io/enumflags2_derive/0.7.12 crate://crates.io/equivalent/1.0.2 crate://crates.io/erased-serde/0.4.10 crate://crates.io/errno/0.3.14 crate://crates.io/fastrand/2.5.0 crate://crates.io/find-msvc-tools/0.1.9 crate://crates.io/fixedbitset/0.5.7 crate://crates.io/flate2/1.1.9 crate://crates.io/foldhash/0.1.5 crate://crates.io/foldhash/0.2.0 crate://crates.io/form_urlencoded/1.2.2 crate://crates.io/fs-err/3.3.1 crate://crates.io/futures/0.3.33 crate://crates.io/futures-channel/0.3.33 crate://crates.io/futures-core/0.3.33 crate://crates.io/futures-executor/0.3.33 crate://crates.io/futures-io/0.3.33 crate://crates.io/futures-lite/2.6.1 crate://crates.io/futures-macro/0.3.33 crate://crates.io/futures-sink/0.3.33 crate://cr
 ates.io/futures-task/0.3.33 crate://crates.io/futures-util/0.3.33 crate://crates.io/generic-array/0.14.7 crate://crates.io/getrandom/0.3.4 crate://crates.io/getrandom/0.4.3 crate://crates.io/globset/0.4.19 crate://crates.io/gloo-timers/0.3.0 crate://crates.io/hashbrown/0.15.5 crate://crates.io/hashbrown/0.17.1 crate://crates.io/heck/0.5.0 crate://crates.io/hex/0.4.3 crate://crates.io/hybrid-array/0.4.13 crate://crates.io/icu_collections/2.1.1 crate://crates.io/icu_locale_core/2.1.1 crate://crates.io/icu_normalizer/2.1.1 crate://crates.io/icu_normalizer_data/2.1.1 crate://crates.io/icu_properties/2.1.2 crate://crates.io/icu_properties_data/2.1.2 crate://crates.io/icu_provider/2.1.1 crate://crates.io/idna/1.1.0 crate://crates.io/idna_adapter/1.2.1 crate://crates.io/indexmap/2.14.0 crate://crates.io/indoc/2.0.7 crate://crates.io/insta/1.48.0 crate://crates.io/is_terminal_polyfill/1.70.2 crate://crates.io/itertools/0.14.0 crate://crates.io/itoa/1.0.17 crate://crates.io/jiff/0.2.34 crate
 ://crates.io/jiff-core/0.1.0 crate://crates.io/jiff-static/0.2.34 crate://crates.io/jiff-tzdb/0.1.8 crate://crates.io/jiff-tzdb-platform/0.1.3 crate://crates.io/jobserver/0.1.35 crate://crates.io/js-sys/0.3.91 crate://crates.io/junction/2.0.0 crate://crates.io/lazy_static/1.5.0 crate://crates.io/libc/0.2.186 crate://crates.io/linux-raw-sys/0.4.15 crate://crates.io/linux-raw-sys/0.12.1 crate://crates.io/litemap/0.8.1 crate://crates.io/lock_api/0.4.14 crate://crates.io/log/0.4.29 crate://crates.io/mailparse/0.16.1 crate://crates.io/matchers/0.2.0 crate://crates.io/memchr/2.8.3 crate://crates.io/miniz_oxide/0.8.9 crate://crates.io/mio/1.2.0 crate://crates.io/munge/0.4.7 crate://crates.io/munge_macro/0.4.7 crate://crates.io/nu-ansi-term/0.50.3 crate://crates.io/once_cell/1.21.4 crate://crates.io/once_cell_polyfill/1.70.2 crate://crates.io/owo-colors/4.3.0 crate://crates.io/parking/2.2.1 crate://crates.io/parking_lot/0.12.5 crate://crates.io/parking_lot_core/0.9.12 crate://crates.io/path
 -slash/0.2.1 crate://crates.io/percent-encoding/2.3.2 crate://crates.io/pest/2.8.6 crate://crates.io/pest_derive/2.8.6 crate://crates.io/pest_generator/2.8.6 crate://crates.io/pest_meta/2.8.6 crate://crates.io/petgraph/0.8.3 crate://crates.io/pin-project/1.1.11 crate://crates.io/pin-project-internal/1.1.11 crate://crates.io/pin-project-lite/0.2.17 crate://crates.io/pkg-config/0.3.32 crate://crates.io/portable-atomic/1.13.1 crate://crates.io/portable-atomic-util/0.2.6 crate://crates.io/potential_utf/0.1.4 crate://crates.io/proc-macro-error-attr2/2.0.0 crate://crates.io/proc-macro-error2/2.0.1 crate://crates.io/proc-macro2/1.0.107 crate://crates.io/ptr_meta/0.3.1 crate://crates.io/ptr_meta_derive/0.3.1 crate://crates.io/quote/1.0.47 crate://crates.io/quoted_printable/0.5.1 crate://crates.io/r-efi/5.3.0 crate://crates.io/r-efi/6.0.0 crate://crates.io/rancor/0.1.1 crate://crates.io/redox_syscall/0.5.15 crate://crates.io/ref-cast/1.0.26 crate://crates.io/ref-cast-impl/1.0.26 crate://crat
 es.io/reflink-copy/0.1.30 crate://crates.io/regex/1.13.1 crate://crates.io/regex-automata/0.4.16 crate://crates.io/regex-syntax/0.8.11 crate://crates.io/rend/0.5.3 crate://crates.io/rkyv/0.8.17 crate://crates.io/rkyv_derive/0.8.17 crate://crates.io/rustc-hash/2.1.3 crate://crates.io/rustix/0.38.44 crate://crates.io/rustix/1.1.4 crate://crates.io/rustversion/1.0.22 crate://crates.io/ryu/1.0.23 crate://crates.io/same-file/1.0.6 crate://crates.io/schemars/1.2.1 crate://crates.io/schemars_derive/1.2.1 crate://crates.io/scopeguard/1.2.0 crate://crates.io/seahash/4.1.0 crate://crates.io/self-replace/1.5.0 crate://crates.io/serde/1.0.229 crate://crates.io/serde-untagged/0.1.9 crate://crates.io/serde_core/1.0.229 crate://crates.io/serde_derive/1.0.229 crate://crates.io/serde_derive_internals/0.29.1 crate://crates.io/serde_json/1.0.150 crate://crates.io/serde_spanned/1.1.1 crate://crates.io/sha2/0.10.9 crate://crates.io/sha2/0.11.0 crate://crates.io/sharded-slab/0.1.7 crate://crates.io/shlex
 /1.3.0 crate://crates.io/signal-hook-registry/1.4.8 crate://crates.io/simd-adler32/0.3.8 crate://crates.io/simdutf8/0.1.5 crate://crates.io/similar/2.7.0 crate://crates.io/slab/0.4.12 crate://crates.io/smallvec/1.15.2 crate://crates.io/smawk/0.3.2 crate://crates.io/spdx/0.13.4 crate://crates.io/stable_deref_trait/1.2.1 crate://crates.io/strip-ansi-escapes/0.2.1 crate://crates.io/strsim/0.11.1 crate://crates.io/syn/2.0.118 crate://crates.io/syn/3.0.3 crate://crates.io/synstructure/0.13.2 crate://crates.io/temp-env/0.3.6 crate://crates.io/tempfile/3.27.0 crate://crates.io/terminal_size/0.4.4 crate://crates.io/textwrap/0.16.2 crate://crates.io/thiserror/2.0.19 crate://crates.io/thiserror-impl/2.0.19 crate://crates.io/thread_local/1.1.9 crate://crates.io/tinystr/0.8.2 crate://crates.io/tinyvec/1.11.0 crate://crates.io/tinyvec_macros/0.1.1 crate://crates.io/tokio/1.53.1 crate://crates.io/tokio-macros/2.7.0 crate://crates.io/tokio-stream/0.1.18 crate://crates.io/tokio-util/0.7.18 crate://
 crates.io/toml/1.1.3+spec-1.1.0 crate://crates.io/toml_datetime/1.1.1+spec-1.1.0 crate://crates.io/toml_edit/0.25.13+spec-1.1.0 crate://crates.io/toml_parser/1.1.2+spec-1.1.0 crate://crates.io/toml_writer/1.1.2+spec-1.1.0 crate://crates.io/tracing/0.1.44 crate://crates.io/tracing-attributes/0.1.31 crate://crates.io/tracing-core/0.1.36 crate://crates.io/tracing-log/0.2.0 crate://crates.io/tracing-subscriber/0.3.23 crate://crates.io/tracing-test/0.2.6 crate://crates.io/tracing-test-macro/0.2.6 crate://crates.io/typeid/1.0.3 crate://crates.io/typenum/1.20.1 crate://crates.io/ucd-trie/0.1.7 crate://crates.io/unicode-ident/1.0.24 crate://crates.io/unicode-linebreak/0.1.5 crate://crates.io/unicode-width/0.2.2 crate://crates.io/unscanny/0.1.0 crate://crates.io/url/2.5.8 crate://crates.io/utf8_iter/1.0.4 crate://crates.io/utf8parse/0.2.2 crate://crates.io/uuid/1.24.0 crate://crates.io/valuable/0.1.1 crate://crates.io/version_check/0.9.5 crate://crates.io/vte/0.14.1 crate://crates.io/walkdir
 /2.5.0 crate://crates.io/wasi/0.11.1+wasi-snapshot-preview1 crate://crates.io/wasip2/1.0.4+wasi-0.2.12 crate://crates.io/wasm-bindgen/0.2.114 crate://crates.io/wasm-bindgen-macro/0.2.114 crate://crates.io/wasm-bindgen-macro-support/0.2.114 crate://crates.io/wasm-bindgen-shared/0.2.114 crate://crates.io/winapi-util/0.1.11 crate://crates.io/windows/0.61.3 crate://crates.io/windows-collections/0.2.0 crate://crates.io/windows-core/0.61.2 crate://crates.io/windows-future/0.2.1 crate://crates.io/windows-implement/0.60.2 crate://crates.io/windows-interface/0.59.3 crate://crates.io/windows-link/0.1.3 crate://crates.io/windows-link/0.2.1 crate://crates.io/windows-numerics/0.2.0 crate://crates.io/windows-result/0.3.4 crate://crates.io/windows-strings/0.4.2 crate://crates.io/windows-sys/0.52.0 crate://crates.io/windows-sys/0.61.2 crate://crates.io/windows-targets/0.52.6 crate://crates.io/windows-threading/0.1.0 crate://crates.io/windows_aarch64_gnullvm/0.52.6 crate://crates.io/windows_aarch64_
 msvc/0.52.6 crate://crates.io/windows_i686_gnu/0.52.6 crate://crates.io/windows_i686_gnullvm/0.52.6 crate://crates.io/windows_i686_msvc/0.52.6 crate://crates.io/windows_x86_64_gnu/0.52.6 crate://crates.io/windows_x86_64_gnullvm/0.52.6 crate://crates.io/windows_x86_64_msvc/0.52.6 crate://crates.io/winnow/1.0.3 crate://crates.io/wit-bindgen/0.57.1 crate://crates.io/writeable/0.6.2 crate://crates.io/xattr/1.6.1 crate://crates.io/yoke/0.8.1 crate://crates.io/yoke-derive/0.8.1 crate://crates.io/zerofrom/0.1.6 crate://crates.io/zerofrom-derive/0.1.6 crate://crates.io/zerotrie/0.2.3 crate://crates.io/zerovec/0.11.5 crate://crates.io/zerovec-derive/0.11.2 crate://crates.io/zlib-rs/0.6.3 crate://crates.io/zmij/1.0.21 crate://crates.io/zstd/0.13.3 crate://crates.io/zstd-safe/7.2.4 crate://crates.io/zstd-sys/2.0.16+zstd.1.5.7" to "https://files.pythonhosted.org/packages/source/u/uv_build/uv_build-0.12.2.tar.gz;downloadfilename=uv_build-0.12.2.tar.gz crate://crates.io/adler2/2.0.1 crate://crate
 s.io/aho-corasick/1.1.4 crate://crates.io/allocator-api2/0.2.21 crate://crates.io/anstream/1.0.0 crate://crates.io/anstyle/1.0.14 crate://crates.io/anstyle-parse/1.0.0 crate://crates.io/anstyle-query/1.1.5 crate://crates.io/anstyle-wincon/3.0.11 crate://crates.io/anyhow/1.0.104 crate://crates.io/arcstr/1.2.0 crate://crates.io/arrayvec/0.7.8 crate://crates.io/astral-tokio-tar/0.6.4 crate://crates.io/astral-version-ranges/0.2.1 crate://crates.io/astral_async_zip/0.0.20 crate://crates.io/async-compression/0.4.19 crate://crates.io/autocfg/1.5.0 crate://crates.io/backon/1.6.0 crate://crates.io/base64/0.22.1 crate://crates.io/bitflags/1.3.2 crate://crates.io/bitflags/2.13.1 crate://crates.io/block-buffer/0.10.4 crate://crates.io/block-buffer/0.12.1 crate://crates.io/boxcar/0.2.14 crate://crates.io/bstr/1.12.1 crate://crates.io/bumpalo/3.20.2 crate://crates.io/bytecheck/0.8.2 crate://crates.io/bytecheck_derive/0.8.2 crate://crates.io/bytes/1.12.1 crate://crates.io/cc/1.2.57 crate://crates.
 io/cfg-if/1.0.4 crate://crates.io/charset/0.1.5 crate://crates.io/clap/4.6.4 crate://crates.io/clap_builder/4.6.2 crate://crates.io/clap_derive/4.6.4 crate://crates.io/clap_lex/1.1.0 crate://crates.io/colorchoice/1.0.5 crate://crates.io/console/0.16.4 crate://crates.io/const-oid/0.10.2 crate://crates.io/cpufeatures/0.2.17 crate://crates.io/cpufeatures/0.3.0 crate://crates.io/crc32fast/1.5.0 crate://crates.io/crypto-common/0.1.7 crate://crates.io/crypto-common/0.2.2 crate://crates.io/csv/1.4.0 crate://crates.io/csv-core/0.1.13 crate://crates.io/data-encoding/2.11.0 crate://crates.io/defmt/1.1.0 crate://crates.io/defmt-macros/1.1.0 crate://crates.io/defmt-parser/1.0.0 crate://crates.io/digest/0.10.7 crate://crates.io/digest/0.11.3 crate://crates.io/displaydoc/0.2.5 crate://crates.io/dunce/1.0.5 crate://crates.io/dyn-clone/1.0.20 crate://crates.io/either/1.17.0 crate://crates.io/encode_unicode/1.0.0 crate://crates.io/encoding_rs/0.8.35 crate://crates.io/encoding_rs_io/0.1.7 crate://cra
 tes.io/enumflags2/0.7.12 crate://crates.io/enumflags2_derive/0.7.12 crate://crates.io/equivalent/1.0.2 crate://crates.io/erased-serde/0.4.10 crate://crates.io/errno/0.3.14 crate://crates.io/fastrand/2.5.0 crate://crates.io/find-msvc-tools/0.1.9 crate://crates.io/fixedbitset/0.5.7 crate://crates.io/flate2/1.1.9 crate://crates.io/foldhash/0.1.5 crate://crates.io/foldhash/0.2.0 crate://crates.io/form_urlencoded/1.2.2 crate://crates.io/fs-err/3.3.1 crate://crates.io/futures/0.3.33 crate://crates.io/futures-channel/0.3.33 crate://crates.io/futures-core/0.3.33 crate://crates.io/futures-executor/0.3.33 crate://crates.io/futures-io/0.3.33 crate://crates.io/futures-lite/2.6.1 crate://crates.io/futures-macro/0.3.33 crate://crates.io/futures-sink/0.3.33 crate://crates.io/futures-task/0.3.33 crate://crates.io/futures-util/0.3.33 crate://crates.io/generic-array/0.14.7 crate://crates.io/getrandom/0.4.3 crate://crates.io/globset/0.4.19 crate://crates.io/gloo-timers/0.3.0 crate://crates.io/hashbrow
 n/0.15.5 crate://crates.io/hashbrown/0.17.1 crate://crates.io/heck/0.5.0 crate://crates.io/hex/0.4.3 crate://crates.io/hybrid-array/0.4.13 crate://crates.io/icu_collections/2.1.1 crate://crates.io/icu_locale_core/2.1.1 crate://crates.io/icu_normalizer/2.1.1 crate://crates.io/icu_normalizer_data/2.1.1 crate://crates.io/icu_properties/2.1.2 crate://crates.io/icu_properties_data/2.1.2 crate://crates.io/icu_provider/2.1.1 crate://crates.io/idna/1.1.0 crate://crates.io/idna_adapter/1.2.1 crate://crates.io/indexmap/2.14.0 crate://crates.io/indoc/2.0.7 crate://crates.io/insta/1.48.0 crate://crates.io/is_terminal_polyfill/1.70.2 crate://crates.io/itertools/0.14.0 crate://crates.io/itoa/1.0.17 crate://crates.io/jiff/0.2.35 crate://crates.io/jiff-core/0.1.0 crate://crates.io/jiff-static/0.2.35 crate://crates.io/jiff-tzdb/0.1.8 crate://crates.io/jiff-tzdb-platform/0.1.3 crate://crates.io/jobserver/0.1.35 crate://crates.io/js-sys/0.3.91 crate://crates.io/junction/2.0.0 crate://crates.io/lazy_st
 atic/1.5.0 crate://crates.io/libc/0.2.186 crate://crates.io/linux-raw-sys/0.12.1 crate://crates.io/litemap/0.8.1 crate://crates.io/lock_api/0.4.14 crate://crates.io/log/0.4.29 crate://crates.io/mailparse/0.16.1 crate://crates.io/matchers/0.2.0 crate://crates.io/memchr/2.8.3 crate://crates.io/miniz_oxide/0.8.9 crate://crates.io/mio/1.2.0 crate://crates.io/munge/0.4.7 crate://crates.io/munge_macro/0.4.7 crate://crates.io/nu-ansi-term/0.50.3 crate://crates.io/once_cell/1.21.4 crate://crates.io/once_cell_polyfill/1.70.2 crate://crates.io/owo-colors/4.3.0 crate://crates.io/parking/2.2.1 crate://crates.io/parking_lot/0.12.5 crate://crates.io/parking_lot_core/0.9.12 crate://crates.io/path-slash/0.2.1 crate://crates.io/percent-encoding/2.3.2 crate://crates.io/pest/2.8.6 crate://crates.io/pest_derive/2.8.6 crate://crates.io/pest_generator/2.8.6 crate://crates.io/pest_meta/2.8.6 crate://crates.io/petgraph/0.8.3 crate://crates.io/pin-project/1.1.11 crate://crates.io/pin-project-internal/1.1.11
  crate://crates.io/pin-project-lite/0.2.17 crate://crates.io/pkg-config/0.3.32 crate://crates.io/portable-atomic/1.13.1 crate://crates.io/portable-atomic-util/0.2.6 crate://crates.io/potential_utf/0.1.4 crate://crates.io/proc-macro-error-attr2/2.0.0 crate://crates.io/proc-macro-error2/2.0.1 crate://crates.io/proc-macro2/1.0.107 crate://crates.io/ptr_meta/0.3.1 crate://crates.io/ptr_meta_derive/0.3.1 crate://crates.io/quote/1.0.47 crate://crates.io/quoted_printable/0.5.1 crate://crates.io/r-efi/6.0.0 crate://crates.io/rancor/0.1.1 crate://crates.io/redox_syscall/0.5.15 crate://crates.io/ref-cast/1.0.26 crate://crates.io/ref-cast-impl/1.0.26 crate://crates.io/reflink-copy/0.1.30 crate://crates.io/regex/1.13.1 crate://crates.io/regex-automata/0.4.16 crate://crates.io/regex-syntax/0.8.11 crate://crates.io/rend/0.5.3 crate://crates.io/rkyv/0.8.17 crate://crates.io/rkyv_derive/0.8.17 crate://crates.io/rustc-hash/2.1.3 crate://crates.io/rustix/1.1.4 crate://crates.io/rustversion/1.0.22 cra
 te://crates.io/ryu/1.0.23 crate://crates.io/same-file/1.0.6 crate://crates.io/schemars/1.2.1 crate://crates.io/schemars_derive/1.2.1 crate://crates.io/scopeguard/1.2.0 crate://crates.io/seahash/4.1.0 crate://crates.io/self-replace/1.5.0 crate://crates.io/serde/1.0.229 crate://crates.io/serde-untagged/0.1.9 crate://crates.io/serde_core/1.0.229 crate://crates.io/serde_derive/1.0.229 crate://crates.io/serde_derive_internals/0.29.1 crate://crates.io/serde_json/1.0.151 crate://crates.io/serde_spanned/1.1.1 crate://crates.io/sha2/0.10.9 crate://crates.io/sha2/0.11.0 crate://crates.io/sharded-slab/0.1.7 crate://crates.io/shlex/1.3.0 crate://crates.io/signal-hook-registry/1.4.8 crate://crates.io/simd-adler32/0.3.8 crate://crates.io/simdutf8/0.1.5 crate://crates.io/similar/2.7.0 crate://crates.io/slab/0.4.12 crate://crates.io/smallvec/1.15.2 crate://crates.io/smawk/0.3.2 crate://crates.io/spdx/0.13.4 crate://crates.io/stable_deref_trait/1.2.1 crate://crates.io/strip-ansi-escapes/0.2.1 crate:
 //crates.io/strsim/0.11.1 crate://crates.io/syn/2.0.118 crate://crates.io/syn/3.0.3 crate://crates.io/synstructure/0.13.2 crate://crates.io/temp-env/0.3.6 crate://crates.io/tempfile/3.27.0 crate://crates.io/terminal_size/0.4.4 crate://crates.io/textwrap/0.16.2 crate://crates.io/thiserror/2.0.19 crate://crates.io/thiserror-impl/2.0.19 crate://crates.io/thread_local/1.1.9 crate://crates.io/tinystr/0.8.2 crate://crates.io/tinyvec/1.11.0 crate://crates.io/tinyvec_macros/0.1.1 crate://crates.io/tokio/1.53.1 crate://crates.io/tokio-macros/2.7.0 crate://crates.io/tokio-stream/0.1.19 crate://crates.io/tokio-util/0.7.19 crate://crates.io/toml/1.1.3+spec-1.1.0 crate://crates.io/toml_datetime/1.1.1+spec-1.1.0 crate://crates.io/toml_edit/0.25.13+spec-1.1.0 crate://crates.io/toml_parser/1.1.2+spec-1.1.0 crate://crates.io/toml_writer/1.1.2+spec-1.1.0 crate://crates.io/tracing/0.1.44 crate://crates.io/tracing-attributes/0.1.31 crate://crates.io/tracing-core/0.1.36 crate://crates.io/tracing-log/0.2
 .0 crate://crates.io/tracing-subscriber/0.3.23 crate://crates.io/tracing-test/0.2.6 crate://crates.io/tracing-test-macro/0.2.6 crate://crates.io/typeid/1.0.3 crate://crates.io/typenum/1.20.1 crate://crates.io/ucd-trie/0.1.7 crate://crates.io/unicode-ident/1.0.24 crate://crates.io/unicode-linebreak/0.1.5 crate://crates.io/unicode-width/0.2.2 crate://crates.io/unscanny/0.1.0 crate://crates.io/url/2.5.8 crate://crates.io/utf8_iter/1.0.4 crate://crates.io/utf8parse/0.2.2 crate://crates.io/uuid/1.24.0 crate://crates.io/valuable/0.1.1 crate://crates.io/version_check/0.9.5 crate://crates.io/vte/0.14.1 crate://crates.io/walkdir/2.5.0 crate://crates.io/wasi/0.11.1+wasi-snapshot-preview1 crate://crates.io/wasm-bindgen/0.2.114 crate://crates.io/wasm-bindgen-macro/0.2.114 crate://crates.io/wasm-bindgen-macro-support/0.2.114 crate://crates.io/wasm-bindgen-shared/0.2.114 crate://crates.io/winapi-util/0.1.11 crate://crates.io/windows/0.61.3 crate://crates.io/windows-collections/0.2.0 crate://crate
 s.io/windows-core/0.61.2 crate://crates.io/windows-future/0.2.1 crate://crates.io/windows-implement/0.60.2 crate://crates.io/windows-interface/0.59.3 crate://crates.io/windows-link/0.1.3 crate://crates.io/windows-link/0.2.1 crate://crates.io/windows-numerics/0.2.0 crate://crates.io/windows-result/0.3.4 crate://crates.io/windows-strings/0.4.2 crate://crates.io/windows-sys/0.52.0 crate://crates.io/windows-sys/0.61.2 crate://crates.io/windows-targets/0.52.6 crate://crates.io/windows-threading/0.1.0 crate://crates.io/windows_aarch64_gnullvm/0.52.6 crate://crates.io/windows_aarch64_msvc/0.52.6 crate://crates.io/windows_i686_gnu/0.52.6 crate://crates.io/windows_i686_gnullvm/0.52.6 crate://crates.io/windows_i686_msvc/0.52.6 crate://crates.io/windows_x86_64_gnu/0.52.6 crate://crates.io/windows_x86_64_gnullvm/0.52.6 crate://crates.io/windows_x86_64_msvc/0.52.6 crate://crates.io/winnow/1.0.3 crate://crates.io/writeable/0.6.2 crate://crates.io/xattr/1.6.1 crate://crates.io/yoke/0.8.1 crate://c
 rates.io/yoke-derive/0.8.1 crate://crates.io/zerofrom/0.1.6 crate://crates.io/zerofrom-derive/0.1.6 crate://crates.io/zerotrie/0.2.3 crate://crates.io/zerovec/0.11.5 crate://crates.io/zerovec-derive/0.11.2 crate://crates.io/zlib-rs/0.6.3 crate://crates.io/zmij/1.0.21 crate://crates.io/zstd/0.13.3 crate://crates.io/zstd-safe/7.2.4 crate://crates.io/zstd-sys/2.0.16+zstd.1.5.7"
packages/x86-64-v3-poky-linux/python3-uv-build: PKGV changed from 0.12.1 [default] to 0.12.2 [default]
packages/x86-64-v3-poky-linux/python3-uv-build/python3-uv-build-dbg: PV changed from "0.12.1" to "0.12.2"
packages/x86-64-v3-poky-linux/python3-uv-build/python3-uv-build-dbg: PKGV changed from 0.12.1 [default] to 0.12.2 [default]
packages/x86-64-v3-poky-linux/python3-uv-build/python3-uv-build-dev: PV changed from "0.12.1" to "0.12.2"
packages/x86-64-v3-poky-linux/python3-uv-build/python3-uv-build-dev: PKGV changed from 0.12.1 [default] to 0.12.2 [default]
packages/x86-64-v3-poky-linux/python3-uv-build/python3-uv-build-doc: PV changed from "0.12.1" to "0.12.2"
packages/x86-64-v3-poky-linux/python3-uv-build/python3-uv-build-doc: PKGV changed from 0.12.1 [default] to 0.12.2 [default]
packages/x86-64-v3-poky-linux/python3-uv-build/python3-uv-build-locale: PV changed from "0.12.1" to "0.12.2"
packages/x86-64-v3-poky-linux/python3-uv-build/python3-uv-build-locale: PKGV changed from 0.12.1 [default] to 0.12.2 [default]
packages/x86-64-v3-poky-linux/python3-uv-build/python3-uv-build-src: PV changed from "0.12.1" to "0.12.2"
packages/x86-64-v3-poky-linux/python3-uv-build/python3-uv-build-src: PKGV changed from 0.12.1 [default] to 0.12.2 [default]
packages/x86-64-v3-poky-linux/python3-uv-build/python3-uv-build-staticdev: PV changed from "0.12.1" to "0.12.2"
packages/x86-64-v3-poky-linux/python3-uv-build/python3-uv-build-staticdev: PKGV changed from 0.12.1 [default] to 0.12.2 [default]
packages/x86-64-v3-poky-linux/python3-uv-build/python3-uv-build: PV changed from "0.12.1" to "0.12.2"
packages/x86-64-v3-poky-linux/python3-uv-build/python3-uv-build: FILELIST: directory renamed /usr/lib/python3.14/site-packages/uv_build-0.12.1.dist-info -> /usr/lib/python3.14/site-packages/uv_build-0.12.2.dist-info, directory renamed /usr/lib/python3.14/site-packages/uv_build-0.12.1.dist-info/licenses -> /usr/lib/python3.14/site-packages/uv_build-0.12.2.dist-info/licenses
packages/x86-64-v3-poky-linux/python3-uv-build/python3-uv-build: PKGV changed from 0.12.1 [default] to 0.12.2 [default]
Changes to packages/x86-64-v3-poky-linux/python3-uv-build (sysroot):
  /usr/lib/python3.14/site-packages/uv_build-0.12.1.dist-info moved to /usr/lib/python3.14/site-packages/uv_build-0.12.2.dist-info

--===============3413278434658503312==--

