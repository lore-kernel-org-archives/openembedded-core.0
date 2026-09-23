Return-Path: <auh@yoctoproject.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 70376C9830C
	for <webhook@archiver.kernel.org>; Wed, 23 Sep 2026 06:27:59 +0000 (UTC)
Received: from a27-45.smtp-out.us-west-2.amazonses.com (a27-45.smtp-out.us-west-2.amazonses.com [54.240.27.45])
 by mx.groups.io with SMTP id smtpd.msgproc01-g2.1222.1790144863509375643
 for <openembedded-core@lists.openembedded.org>;
 Tue, 22 Sep 2026 23:27:49 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@yoctoproject.org header.s=lvjh2tk576v2ro5mi6k4dt3mc6wpqbky header.b=hG10zzhv;
 dkim=pass header.i=@amazonses.com header.s=hsbnp7p3ensaochzwyq5wwmceodymuwv header.b=Hmpy2Ql6;
 spf=pass (domain: us-west-2.amazonses.com, ip: 54.240.27.45, mailfrom: 010101a0ccf2f4b1-3d72d851-cc9a-4024-894f-eb0a704e164b-000000@us-west-2.amazonses.com)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/simple;
	s=lvjh2tk576v2ro5mi6k4dt3mc6wpqbky; d=yoctoproject.org;
	t=1790144869;
	h=Content-Type:MIME-Version:From:To:Cc:Subject:Message-Id:Date;
	bh=NcXeNbbiXzFS1SDnYPfdNP6xWmF2ATRBgYaZW/n6c6U=;
	b=hG10zzhvX5DvGFw1OlZ7uQQBoS1pS0YWwFmOWInuOB6cBnhhPOhVKpEU0bwt0Zf4
	nYCASe1LM5cz2xrTruO1/lJyPKW0PnTrdgyOBq63z9mT79CbU0JYr+2uzT/doF6hHQ5
	Ywp1qxb/Kf8HcMwKd1Sp82z5ja80VMkTqBeyauFA=
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/simple;
	s=hsbnp7p3ensaochzwyq5wwmceodymuwv; d=amazonses.com; t=1790144869;
	h=Content-Type:MIME-Version:From:To:Cc:Subject:Message-Id:Date:Feedback-ID;
	bh=NcXeNbbiXzFS1SDnYPfdNP6xWmF2ATRBgYaZW/n6c6U=;
	b=Hmpy2Ql6texj/dyq1cPMNNBYC+rU4Y9Jukp8Pu6P1qjiMa9w2hIDXjeE5nLb6FGY
	fG2t2bJA5ndJ+Hnqm+EpBNT0E/E2m0BSZU6eo2YorgkdC/ilJNNgm74ScAvVbSD2HOu
	5rNE2CXOqRqFfllQ8CfKnrfCKUjI1ZrwP98YLnz4=
Content-Type: multipart/mixed; boundary="===============2991536531201223529=="
MIME-Version: 1.0
From: auh@yoctoproject.org
To: Trevor Gamblin <tgamblin@baylibre.com>
Cc: openembedded-core@lists.openembedded.org
Subject: [AUH] python3-uv-build: upgrading to 0.12.18 SUCCEEDED
Message-ID: <010101a0ccf2f4b1-3d72d851-cc9a-4024-894f-eb0a704e164b-000000@us-west-2.amazonses.com>
Date: Wed, 23 Sep 2026 06:27:49 +0000
Feedback-ID: ::1.us-west-2.9np3MYPs3fEaOBysGKSlUD4KtcmPijcmS9Az2Hwf7iQ=:AmazonSES
X-SES-Outgoing: 2026.09.23-54.240.27.45
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Wed, 23 Sep 2026 06:27:59 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/246445

--===============2991536531201223529==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit

Hello,

this email is a notification from the Auto Upgrade Helper
that the automatic attempt to upgrade the recipe(s) *python3-uv-build* to *0.12.18* has Succeeded.

Next steps:
    - apply the patch: git am 0001-python3-uv-build-upgrade-0.12.13-0.12.18.patch
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
From be97a8a65156688e942d8e2f5a254676c5bf0fc1 Mon Sep 17 00:00:00 2001
From: Upgrade Helper <auh@yoctoproject.org>
Date: Wed, 23 Sep 2026 06:19:37 +0000
Subject: [PATCH] python3-uv-build: upgrade 0.12.13 -> 0.12.18

---
 .../python/python3-uv-build-crates.inc        | 78 +++++++------------
 ...0.12.13.bb => python3-uv-build_0.12.18.bb} |  2 +-
 2 files changed, 31 insertions(+), 49 deletions(-)
 rename meta/recipes-devtools/python/{python3-uv-build_0.12.13.bb => python3-uv-build_0.12.18.bb} (92%)

diff --git a/meta/recipes-devtools/python/python3-uv-build-crates.inc b/meta/recipes-devtools/python/python3-uv-build-crates.inc
index 02e8f9a8ab..3ba46dd5de 100644
--- a/meta/recipes-devtools/python/python3-uv-build-crates.inc
+++ b/meta/recipes-devtools/python/python3-uv-build-crates.inc
@@ -4,7 +4,6 @@
 SRC_URI += " \
     crate://crates.io/adler2/2.0.1 \
     crate://crates.io/aho-corasick/1.1.4 \
-    crate://crates.io/allocator-api2/0.2.21 \
     crate://crates.io/ambient-authority/0.0.2 \
     crate://crates.io/anstream/1.0.0 \
     crate://crates.io/anstyle/1.0.14 \
@@ -43,7 +42,6 @@ SRC_URI += " \
     crate://crates.io/clap_lex/1.1.0 \
     crate://crates.io/colorchoice/1.0.5 \
     crate://crates.io/console/0.16.4 \
-    crate://crates.io/const-oid/0.10.2 \
     crate://crates.io/cpufeatures/0.2.17 \
     crate://crates.io/cpufeatures/0.3.0 \
     crate://crates.io/crc32fast/1.5.0 \
@@ -60,7 +58,7 @@ SRC_URI += " \
     crate://crates.io/displaydoc/0.2.5 \
     crate://crates.io/dunce/1.0.5 \
     crate://crates.io/dyn-clone/1.0.20 \
-    crate://crates.io/either/1.17.0 \
+    crate://crates.io/either/1.18.0 \
     crate://crates.io/encode_unicode/1.0.0 \
     crate://crates.io/encoding_rs/0.8.35 \
     crate://crates.io/encoding_rs_io/0.1.8 \
@@ -78,21 +76,19 @@ SRC_URI += " \
     crate://crates.io/form_urlencoded/1.2.2 \
     crate://crates.io/fs-err/3.3.1 \
     crate://crates.io/fs-set-times/0.20.3 \
-    crate://crates.io/futures/0.3.33 \
-    crate://crates.io/futures-channel/0.3.33 \
-    crate://crates.io/futures-core/0.3.33 \
-    crate://crates.io/futures-executor/0.3.33 \
-    crate://crates.io/futures-io/0.3.33 \
+    crate://crates.io/futures/0.3.34 \
+    crate://crates.io/futures-channel/0.3.34 \
+    crate://crates.io/futures-core/0.3.34 \
+    crate://crates.io/futures-executor/0.3.34 \
+    crate://crates.io/futures-io/0.3.34 \
     crate://crates.io/futures-lite/2.6.1 \
-    crate://crates.io/futures-macro/0.3.33 \
-    crate://crates.io/futures-sink/0.3.33 \
-    crate://crates.io/futures-task/0.3.33 \
-    crate://crates.io/futures-util/0.3.33 \
+    crate://crates.io/futures-macro/0.3.34 \
+    crate://crates.io/futures-sink/0.3.34 \
+    crate://crates.io/futures-task/0.3.34 \
+    crate://crates.io/futures-util/0.3.34 \
     crate://crates.io/generic-array/0.14.7 \
-    crate://crates.io/getrandom/0.3.4 \
     crate://crates.io/getrandom/0.4.3 \
     crate://crates.io/globset/0.4.20 \
-    crate://crates.io/gloo-timers/0.3.0 \
     crate://crates.io/hashbrown/0.15.5 \
     crate://crates.io/hashbrown/0.17.1 \
     crate://crates.io/heck/0.5.0 \
@@ -167,12 +163,11 @@ SRC_URI += " \
     crate://crates.io/ptr_meta_derive/0.3.1 \
     crate://crates.io/quote/1.0.47 \
     crate://crates.io/quoted_printable/0.5.1 \
-    crate://crates.io/r-efi/5.3.0 \
     crate://crates.io/r-efi/6.0.0 \
     crate://crates.io/rancor/0.1.1 \
     crate://crates.io/redox_syscall/0.5.15 \
-    crate://crates.io/ref-cast/1.0.26 \
-    crate://crates.io/ref-cast-impl/1.0.26 \
+    crate://crates.io/ref-cast/1.0.27 \
+    crate://crates.io/ref-cast-impl/1.0.27 \
     crate://crates.io/reflink-copy/0.1.30 \
     crate://crates.io/regex/1.13.1 \
     crate://crates.io/regex-automata/0.4.18 \
@@ -209,6 +204,7 @@ SRC_URI += " \
     crate://crates.io/slab/0.4.12 \
     crate://crates.io/smallvec/1.15.2 \
     crate://crates.io/smawk/0.3.2 \
+    crate://crates.io/socket2/0.6.3 \
     crate://crates.io/spdx/0.13.5 \
     crate://crates.io/stable_deref_trait/1.2.1 \
     crate://crates.io/strip-ansi-escapes/0.2.1 \
@@ -222,8 +218,8 @@ SRC_URI += " \
     crate://crates.io/tempfile/3.27.0 \
     crate://crates.io/terminal_size/0.4.4 \
     crate://crates.io/textwrap/0.16.2 \
-    crate://crates.io/thiserror/2.0.19 \
-    crate://crates.io/thiserror-impl/2.0.19 \
+    crate://crates.io/thiserror/2.0.20 \
+    crate://crates.io/thiserror-impl/2.0.20 \
     crate://crates.io/thread_local/1.1.9 \
     crate://crates.io/tinystr/0.8.2 \
     crate://crates.io/tinyvec/1.11.0 \
@@ -231,7 +227,6 @@ SRC_URI += " \
     crate://crates.io/tokio/1.53.1 \
     crate://crates.io/tokio-macros/2.7.0 \
     crate://crates.io/tokio-stream/0.1.19 \
-    crate://crates.io/tokio-util/0.7.19 \
     crate://crates.io/toml/1.1.3+spec-1.1.0 \
     crate://crates.io/toml_datetime/1.1.1+spec-1.1.0 \
     crate://crates.io/toml_edit/0.25.13+spec-1.1.0 \
@@ -248,7 +243,6 @@ SRC_URI += " \
     crate://crates.io/typenum/1.20.1 \
     crate://crates.io/ucd-trie/0.1.7 \
     crate://crates.io/unicode-ident/1.0.24 \
-    crate://crates.io/unicode-linebreak/0.1.5 \
     crate://crates.io/unicode-width/0.2.2 \
     crate://crates.io/unscanny/0.1.0 \
     crate://crates.io/url/2.5.8 \
@@ -260,7 +254,6 @@ SRC_URI += " \
     crate://crates.io/vte/0.14.1 \
     crate://crates.io/walkdir/2.5.0 \
     crate://crates.io/wasi/0.11.1+wasi-snapshot-preview1 \
-    crate://crates.io/wasip2/1.0.4+wasi-0.2.12 \
     crate://crates.io/wasm-bindgen/0.2.114 \
     crate://crates.io/wasm-bindgen-macro/0.2.114 \
     crate://crates.io/wasm-bindgen-macro-support/0.2.114 \
@@ -301,9 +294,7 @@ SRC_URI += " \
     crate://crates.io/windows_x86_64_msvc/0.53.1 \
     crate://crates.io/winnow/1.0.3 \
     crate://crates.io/winx/0.36.4 \
-    crate://crates.io/wit-bindgen/0.57.1 \
     crate://crates.io/writeable/0.6.2 \
-    crate://crates.io/xattr/1.6.1 \
     crate://crates.io/yoke/0.8.1 \
     crate://crates.io/yoke-derive/0.8.1 \
     crate://crates.io/zerocopy/0.8.56 \
@@ -322,7 +313,6 @@ SRC_URI += " \
 
 SRC_URI[adler2-2.0.1.sha256sum] = "320119579fcad9c21884f5c4861d16174d0e06250625266f50fe6898340abefa"
 SRC_URI[aho-corasick-1.1.4.sha256sum] = "ddd31a130427c27518df266943a5308ed92d4b226cc639f5a8f1002816174301"
-SRC_URI[allocator-api2-0.2.21.sha256sum] = "683d7910e743518b0e34f1186f92494becacb047c7b6bf616c96772180fef923"
 SRC_URI[ambient-authority-0.0.2.sha256sum] = "e9d4ee0d472d1cd2e28c97dfa124b3d8d992e10eb0a035f33f5d12e3a177ba3b"
 SRC_URI[anstream-1.0.0.sha256sum] = "824a212faf96e9acacdbd09febd34438f8f711fb84e09a8916013cd7815ca28d"
 SRC_URI[anstyle-1.0.14.sha256sum] = "940b3a0ca603d1eade50a4846a2afffd5ef57a9feac2c0e2ec2e14f9ead76000"
@@ -361,7 +351,6 @@ SRC_URI[clap_derive-4.6.4.sha256sum] = "d012d2b9d65aca7f18f4d9878a045bc17899bba9
 SRC_URI[clap_lex-1.1.0.sha256sum] = "c8d4a3bb8b1e0c1050499d1815f5ab16d04f0959b233085fb31653fbfc9d98f9"
 SRC_URI[colorchoice-1.0.5.sha256sum] = "1d07550c9036bf2ae0c684c4297d503f838287c83c53686d05370d0e139ae570"
 SRC_URI[console-0.16.4.sha256sum] = "4fe5f465a4f6fee88fad41b85d990f84c835335e85b5d9e6e63e0d06d28cba7c"
-SRC_URI[const-oid-0.10.2.sha256sum] = "a6ef517f0926dd24a1582492c791b6a4818a4d94e789a334894aa15b0d12f55c"
 SRC_URI[cpufeatures-0.2.17.sha256sum] = "59ed5838eebb26a2bb2e58f6d5b5316989ae9d08bab10e0e6d103e656d1b0280"
 SRC_URI[cpufeatures-0.3.0.sha256sum] = "8b2a41393f66f16b0823bb79094d54ac5fbd34ab292ddafb9a0456ac9f87d201"
 SRC_URI[crc32fast-1.5.0.sha256sum] = "9481c1c90cbf2ac953f07c8d4a58aa3945c425b7185c9154d67a65e4230da511"
@@ -378,7 +367,7 @@ SRC_URI[digest-0.11.3.sha256sum] = "f1dd6dbb5841937940781866fa1281a1ff7bd3bf8270
 SRC_URI[displaydoc-0.2.5.sha256sum] = "97369cbbc041bc366949bc74d34658d6cda5621039731c6310521892a3a20ae0"
 SRC_URI[dunce-1.0.5.sha256sum] = "92773504d58c093f6de2459af4af33faa518c13451eb8f2b5698ed3d36e7c813"
 SRC_URI[dyn-clone-1.0.20.sha256sum] = "d0881ea181b1df73ff77ffaaf9c7544ecc11e82fba9b5f27b262a3c73a332555"
-SRC_URI[either-1.17.0.sha256sum] = "9e5e8f6c15a24b9a3ee5efec809ccd006d3b30e8b3bb63c39af737c7f87daa1d"
+SRC_URI[either-1.18.0.sha256sum] = "252afb9ae5eaa683babdc6a068b3f5726eb19e05070c731f9b2a23a7c3e8ed34"
 SRC_URI[encode_unicode-1.0.0.sha256sum] = "34aa73646ffb006b8f5147f3dc182bd4bcb190227ce861fc4a4844bf8e3cb2c0"
 SRC_URI[encoding_rs-0.8.35.sha256sum] = "75030f3c4f45dafd7586dd6780965a8c7e8e285a5ecb86713e63a79c5b2766f3"
 SRC_URI[encoding_rs_io-0.1.8.sha256sum] = "fba3fe847045ecff794b9c138293a80db914678c453ad63fbf0c6a9eb6e00b22"
@@ -396,21 +385,19 @@ SRC_URI[foldhash-0.2.0.sha256sum] = "77ce24cb58228fbb8aa041425bb1050850ac1917768
 SRC_URI[form_urlencoded-1.2.2.sha256sum] = "cb4cb245038516f5f85277875cdaa4f7d2c9a0fa0468de06ed190163b1581fcf"
 SRC_URI[fs-err-3.3.1.sha256sum] = "b91aa448ca50d7e79433bdf3ee8d99215430d2ec02ade5aefab2a073a1822e8a"
 SRC_URI[fs-set-times-0.20.3.sha256sum] = "94e7099f6313ecacbe1256e8ff9d617b75d1bcb16a6fddef94866d225a01a14a"
-SRC_URI[futures-0.3.33.sha256sum] = "a88cf1f829d945f548cf8fec32c61b1f202b6d93b45848602fc02af4b12ad218"
-SRC_URI[futures-channel-0.3.33.sha256sum] = "262590f4fe6afeb0bc83be1daa64e52657fe185690a958af7f3ad0e92085c5ae"
-SRC_URI[futures-core-0.3.33.sha256sum] = "2cd50c473c80f6d7c3670a752354b8e569b1a7cbfdc0419ec88e5edad85e0dc7"
-SRC_URI[futures-executor-0.3.33.sha256sum] = "6754879cc9f2c66f88c6e5c35344bb0bdb0708b0352b1201815667c7eabc7458"
-SRC_URI[futures-io-0.3.33.sha256sum] = "4577ecaa3c4f96589d473f679a71b596316f6641bc350038b962a5daf0085d7a"
+SRC_URI[futures-0.3.34.sha256sum] = "9a31d2a3fbaaeb2af2368bbdd904aa8e812d3c04a1ee10d3171f52d556e5d0a3"
+SRC_URI[futures-channel-0.3.34.sha256sum] = "b1f9e3d69d39e4862ffed03ed071a76f9a13ba1d9109d355b0f0aa6b15e393c4"
+SRC_URI[futures-core-0.3.34.sha256sum] = "92d699e522242e69e3003b94ecc1f960f3a5e015aa7c5d7486e65ad01dd94f5e"
+SRC_URI[futures-executor-0.3.34.sha256sum] = "031b47cf1a3c6cc8bc2fc76cd437f521619387907d469316e7c0bc278f1f5432"
+SRC_URI[futures-io-0.3.34.sha256sum] = "53c0fa8157de1303bfffdaa1cc2a673bfffb60102f76b0ef4441659124373fed"
 SRC_URI[futures-lite-2.6.1.sha256sum] = "f78e10609fe0e0b3f4157ffab1876319b5b0db102a2c60dc4626306dc46b44ad"
-SRC_URI[futures-macro-0.3.33.sha256sum] = "2d6d3cde68c518367be28956066ddfef33813991b77a55005a69dae04bf3b10b"
-SRC_URI[futures-sink-0.3.33.sha256sum] = "e34418ac499d6305c2fb5ad0ed2f6ac998c5f8ca209b4510f7f94242c647e307"
-SRC_URI[futures-task-0.3.33.sha256sum] = "b231ed28831efb4a61a08580c4bc233ec56bc009f4cd8f52da2c3cb97df0c109"
-SRC_URI[futures-util-0.3.33.sha256sum] = "a77a90a256fce34da66415271e30f94ee91c57b04b8a2c042d9cf3220179deaa"
+SRC_URI[futures-macro-0.3.34.sha256sum] = "9fb9654ba8355388abeb8dcb4fc62f511300867002afc858860463bdd9fe0c44"
+SRC_URI[futures-sink-0.3.34.sha256sum] = "1944426bf7d03f1d14f708785e4b33efd750b36d48a157b836b3efc15ede8e1d"
+SRC_URI[futures-task-0.3.34.sha256sum] = "cd417de3d1d015fc3bfd2b1ea46dfc7bab72ef86f1cc7cc9c78e728b34a6d1fd"
+SRC_URI[futures-util-0.3.34.sha256sum] = "0d50a92467f8ba5dd6e3ee5d4bd04d73ab2e4e1c44474a0674821dfce14b79bc"
 SRC_URI[generic-array-0.14.7.sha256sum] = "85649ca51fd72272d7821adaf274ad91c288277713d9c18820d8499a7ff69e9a"
-SRC_URI[getrandom-0.3.4.sha256sum] = "899def5c37c4fd7b2664648c28120ecec138e4d395b459e5ca34f9cce2dd77fd"
 SRC_URI[getrandom-0.4.3.sha256sum] = "300e883d756b2e4ec94e02791f39b04b522276138852cfc41d9fb7e904106099"
 SRC_URI[globset-0.4.20.sha256sum] = "07c34a9410465b45bd9787443bc7370f37735bad04b0f0cd57ff1a3186c98988"
-SRC_URI[gloo-timers-0.3.0.sha256sum] = "bbb143cf96099802033e0d4f4963b19fd2e0b728bcf076cd9cf7f6634f092994"
 SRC_URI[hashbrown-0.15.5.sha256sum] = "9229cfe53dfd69f0609a49f65461bd93001ea1ef889cd5529dd176593f5338a1"
 SRC_URI[hashbrown-0.17.1.sha256sum] = "ed5909b6e89a2db4456e54cd5f673791d7eca6732202bbf2a9cc504fe2f9b84a"
 SRC_URI[heck-0.5.0.sha256sum] = "2304e00983f87ffb38b55b444b5e3b60a884b5d30c0fca7d82fe33449bbe55ea"
@@ -485,12 +472,11 @@ SRC_URI[ptr_meta-0.3.1.sha256sum] = "0b9a0cf95a1196af61d4f1cbdab967179516d9a4a43
 SRC_URI[ptr_meta_derive-0.3.1.sha256sum] = "7347867d0a7e1208d93b46767be83e2b8f978c3dad35f775ac8d8847551d6fe1"
 SRC_URI[quote-1.0.47.sha256sum] = "1fbf4db142a473a8d80c26bbf18454ed458bf8d26c8219c331daecfdbd079001"
 SRC_URI[quoted_printable-0.5.1.sha256sum] = "640c9bd8497b02465aeef5375144c26062e0dcd5939dfcbb0f5db76cb8c17c73"
-SRC_URI[r-efi-5.3.0.sha256sum] = "69cdb34c158ceb288df11e18b4bd39de994f6657d83847bdffdbd7f346754b0f"
 SRC_URI[r-efi-6.0.0.sha256sum] = "f8dcc9c7d52a811697d2151c701e0d08956f92b0e24136cf4cf27b57a6a0d9bf"
 SRC_URI[rancor-0.1.1.sha256sum] = "a063ea72381527c2a0561da9c80000ef822bdd7c3241b1cc1b12100e3df081ee"
 SRC_URI[redox_syscall-0.5.15.sha256sum] = "7e8af0dde094006011e6a740d4879319439489813bd0bcdc7d821beaeeff48ec"
-SRC_URI[ref-cast-1.0.26.sha256sum] = "216e8f773d7923bcba9ceb86a86c93cabb3903a11872fc3f138c49630e50b96d"
-SRC_URI[ref-cast-impl-1.0.26.sha256sum] = "2c9283685feec7d69af75fb0e858d5e7378f33fe4fc699383b2916ab9273e03c"
+SRC_URI[ref-cast-1.0.27.sha256sum] = "7e440fb4e4b4147295338efb76001ab9e4efc0e5839df2c47fc5ac2381d365c3"
+SRC_URI[ref-cast-impl-1.0.27.sha256sum] = "92ecd8964f8453721699a1ed72037b0db49ce2f5a5138486ee89bed6f67cdf3a"
 SRC_URI[reflink-copy-0.1.30.sha256sum] = "d9dd7ab4af0363d5ccfd2838d782a28196cf32a5cc2e4fe3c5dc83f2be588b8b"
 SRC_URI[regex-1.13.1.sha256sum] = "f020237b6c8eed93db2e2cb53c00c60a8e1bc73da7d073199a1180401450218d"
 SRC_URI[regex-automata-0.4.18.sha256sum] = "ad8553b9b26413251cbf30e620595c7a41b3887f03da04579c0e6b0d6a06b4b2"
@@ -527,6 +513,7 @@ SRC_URI[similar-2.7.0.sha256sum] = "bbbb5d9659141646ae647b42fe094daf6c6192d16208
 SRC_URI[slab-0.4.12.sha256sum] = "0c790de23124f9ab44544d7ac05d60440adc586479ce501c1d6d7da3cd8c9cf5"
 SRC_URI[smallvec-1.15.2.sha256sum] = "8ed6a63f02c8539c91a8685a86f4099661ba3da017932f6ebbea6de3f0fa7c90"
 SRC_URI[smawk-0.3.2.sha256sum] = "b7c388c1b5e93756d0c740965c41e8822f866621d41acbdf6336a6a168f8840c"
+SRC_URI[socket2-0.6.3.sha256sum] = "3a766e1110788c36f4fa1c2b71b387a7815aa65f88ce0229841826633d93723e"
 SRC_URI[spdx-0.13.5.sha256sum] = "081670c233dfbed55690cc0cd38424e0e24ac1b2673d0b408b3f7b684738dfa9"
 SRC_URI[stable_deref_trait-1.2.1.sha256sum] = "6ce2be8dc25455e1f91df71bfa12ad37d7af1092ae736f3a6cd0e37bc7810596"
 SRC_URI[strip-ansi-escapes-0.2.1.sha256sum] = "2a8f8038e7e7969abb3f1b7c2a811225e9296da208539e0f79c5251d6cac0025"
@@ -540,8 +527,8 @@ SRC_URI[temp-env-0.3.6.sha256sum] = "96374855068f47402c3121c6eed88d29cb1de8f3ab2
 SRC_URI[tempfile-3.27.0.sha256sum] = "32497e9a4c7b38532efcdebeef879707aa9f794296a4f0244f6f69e9bc8574bd"
 SRC_URI[terminal_size-0.4.4.sha256sum] = "230a1b821ccbd75b185820a1f1ff7b14d21da1e442e22c0863ea5f08771a8874"
 SRC_URI[textwrap-0.16.2.sha256sum] = "c13547615a44dc9c452a8a534638acdf07120d4b6847c8178705da06306a3057"
-SRC_URI[thiserror-2.0.19.sha256sum] = "09a43598840e33d5b0331f38c5e30d13bb11c11210a4b58f0d9b18a5a5eefcd9"
-SRC_URI[thiserror-impl-2.0.19.sha256sum] = "43cbfe0cf76104d42a574802844187e84a305e531ed54455f11fbde0f10541cd"
+SRC_URI[thiserror-2.0.20.sha256sum] = "ec86235f5fcc2a73650310756d2ac5b138a5780bbbdfae3eeccec992c435ba4f"
+SRC_URI[thiserror-impl-2.0.20.sha256sum] = "bc04cd3e1236dd4a98afca4569f2deb3f120e5422a4023be2cb683f8486292af"
 SRC_URI[thread_local-1.1.9.sha256sum] = "f60246a4944f24f6e018aa17cdeffb7818b76356965d03b07d6a9886e8962185"
 SRC_URI[tinystr-0.8.2.sha256sum] = "42d3e9c45c09de15d06dd8acf5f4e0e399e85927b7f00711024eb7ae10fa4869"
 SRC_URI[tinyvec-1.11.0.sha256sum] = "3e61e67053d25a4e82c844e8424039d9745781b3fc4f32b8d55ed50f5f667ef3"
@@ -549,7 +536,6 @@ SRC_URI[tinyvec_macros-0.1.1.sha256sum] = "1f3ccbac311fea05f86f61904b462b55fb3df
 SRC_URI[tokio-1.53.1.sha256sum] = "202caea871b69668250d242070849eb495be178ed697a3e98aebce5bc81a0bed"
 SRC_URI[tokio-macros-2.7.0.sha256sum] = "385a6cb71ab9ab790c5fe8d67f1645e6c450a7ce006a33de03daa956cf70a496"
 SRC_URI[tokio-stream-0.1.19.sha256sum] = "a3d06f0b082ba57c26b79407372e57cf2a1e28124f78e9479fe80322cf53420b"
-SRC_URI[tokio-util-0.7.19.sha256sum] = "494815d09bf52b5548659851081238f0ca39ff638363907596da739561c62c52"
 SRC_URI[toml-1.1.3+spec-1.1.0.sha256sum] = "53c96ecdfa941c8fc4fcaed14f99ada8ebed502eef533015095a07e3301d4c3c"
 SRC_URI[toml_datetime-1.1.1+spec-1.1.0.sha256sum] = "3165f65f62e28e0115a00b2ebdd37eb6f3b641855f9d636d3cd4103767159ad7"
 SRC_URI[toml_edit-0.25.13+spec-1.1.0.sha256sum] = "6975367e4d2ef766d86af01ffad14b622fecc8d4357a998fbc4deb6e9bacaf9b"
@@ -566,7 +552,6 @@ SRC_URI[typeid-1.0.3.sha256sum] = "bc7d623258602320d5c55d1bc22793b57daff0ec7efc2
 SRC_URI[typenum-1.20.1.sha256sum] = "b6f5e870be6c3b371b77fe0ee0bafb859fa4964b4404c27de1d380043c4dda20"
 SRC_URI[ucd-trie-0.1.7.sha256sum] = "2896d95c02a80c6d6a5d6e953d479f5ddf2dfdb6a244441010e373ac0fb88971"
 SRC_URI[unicode-ident-1.0.24.sha256sum] = "e6e4313cd5fcd3dad5cafa179702e2b244f760991f45397d14d4ebf38247da75"
-SRC_URI[unicode-linebreak-0.1.5.sha256sum] = "3b09c83c3c29d37506a3e260c08c03743a6bb66a9cd432c6934ab501a190571f"
 SRC_URI[unicode-width-0.2.2.sha256sum] = "b4ac048d71ede7ee76d585517add45da530660ef4390e49b098733c6e897f254"
 SRC_URI[unscanny-0.1.0.sha256sum] = "e9df2af067a7953e9c3831320f35c1cc0600c30d44d9f7a12b01db1cd88d6b47"
 SRC_URI[url-2.5.8.sha256sum] = "ff67a8a4397373c3ef660812acab3268222035010ab8680ec4215f38ba3d0eed"
@@ -578,7 +563,6 @@ SRC_URI[version_check-0.9.5.sha256sum] = "0b928f33d975fc6ad9f86c8f283853ad26bdd5
 SRC_URI[vte-0.14.1.sha256sum] = "231fdcd7ef3037e8330d8e17e61011a2c244126acc0a982f4040ac3f9f0bc077"
 SRC_URI[walkdir-2.5.0.sha256sum] = "29790946404f91d9c5d06f9874efddea1dc06c5efe94541a7d6863108e3a5e4b"
 SRC_URI[wasi-0.11.1+wasi-snapshot-preview1.sha256sum] = "ccf3ec651a847eb01de73ccad15eb7d99f80485de043efb2f370cd654f4ea44b"
-SRC_URI[wasip2-1.0.4+wasi-0.2.12.sha256sum] = "b67efb37e106e55ce722a510d6b5f9c17f083e5fc79afc2badeb12cc313d9487"
 SRC_URI[wasm-bindgen-0.2.114.sha256sum] = "6532f9a5c1ece3798cb1c2cfdba640b9b3ba884f5db45973a6f442510a87d38e"
 SRC_URI[wasm-bindgen-macro-0.2.114.sha256sum] = "18a2d50fcf105fb33bb15f00e7a77b772945a2ee45dcf454961fd843e74c18e6"
 SRC_URI[wasm-bindgen-macro-support-0.2.114.sha256sum] = "03ce4caeaac547cdf713d280eda22a730824dd11e6b8c3ca9e42247b25c631e3"
@@ -619,9 +603,7 @@ SRC_URI[windows_x86_64_msvc-0.52.6.sha256sum] = "589f6da84c646204747d1270a2a5661
 SRC_URI[windows_x86_64_msvc-0.53.1.sha256sum] = "d6bbff5f0aada427a1e5a6da5f1f98158182f26556f345ac9e04d36d0ebed650"
 SRC_URI[winnow-1.0.3.sha256sum] = "0592e1c9d151f854e6fd382574c3a0855250e1d9b2f99d9281c6e6391af352f1"
 SRC_URI[winx-0.36.4.sha256sum] = "3f3fd376f71958b862e7afb20cfe5a22830e1963462f3a17f49d82a6c1d1f42d"
-SRC_URI[wit-bindgen-0.57.1.sha256sum] = "1ebf944e87a7c253233ad6766e082e3cd714b5d03812acc24c318f549614536e"
 SRC_URI[writeable-0.6.2.sha256sum] = "9edde0db4769d2dc68579893f2306b26c6ecfbe0ef499b013d731b7b9247e0b9"
-SRC_URI[xattr-1.6.1.sha256sum] = "32e45ad4206f6d2479085147f02bc2ef834ac85886624a23575ae137c8aa8156"
 SRC_URI[yoke-0.8.1.sha256sum] = "72d6e5c6afb84d73944e5cedb052c4680d5657337201555f9f2a16b7406d4954"
 SRC_URI[yoke-derive-0.8.1.sha256sum] = "b659052874eb698efe5b9e8cf382204678a0086ebf46982b79d6ca3182927e5d"
 SRC_URI[zerocopy-0.8.56.sha256sum] = "556764e583adb45a9f8d413c2a147fa7e8d821e48e12b14fd560b607998b75eb"
diff --git a/meta/recipes-devtools/python/python3-uv-build_0.12.13.bb b/meta/recipes-devtools/python/python3-uv-build_0.12.18.bb
similarity index 92%
rename from meta/recipes-devtools/python/python3-uv-build_0.12.13.bb
rename to meta/recipes-devtools/python/python3-uv-build_0.12.18.bb
index 51e85d5a85..d39c97449d 100644
--- a/meta/recipes-devtools/python/python3-uv-build_0.12.13.bb
+++ b/meta/recipes-devtools/python/python3-uv-build_0.12.18.bb
@@ -11,7 +11,7 @@ LIC_FILES_CHKSUM = "file://LICENSE-APACHE;md5=86d3f3a95c324c9479bd8986968f4327 \
                     file://crates/uv-pep508/License-Apache;md5=e23fadd6ceef8c618fc1c65191d846fa \
                     file://crates/uv-pep508/License-BSD;md5=ef7a6027dc4c2389b9afad7e690274c7"
 
-SRC_URI[sha256sum] = "46936ab24c8674be28df2784a9ca2878478a84a98e6ce3df5cb976102e99b8f1"
+SRC_URI[sha256sum] = "cea2cf07119f7f1ff9be6391330cd54f3f396d5412d2aa8234dd8527d716328e"
 
 require ${BPN}-crates.inc
 
-- 
2.47.1


--===============2991536531201223529==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: attachment; filename="buildhistory-diff-full.txt"

packages/x86-64-v3-poky-linux/python3-uv-build: PV changed from "0.12.13" to "0.12.18"
packages/x86-64-v3-poky-linux/python3-uv-build: SRC_URI changed from "https://files.pythonhosted.org/packages/source/u/uv_build/uv_build-0.12.13.tar.gz crate://crates.io/adler2/2.0.1 crate://crates.io/aho-corasick/1.1.4 crate://crates.io/allocator-api2/0.2.21 crate://crates.io/ambient-authority/0.0.2 crate://crates.io/anstream/1.0.0 crate://crates.io/anstyle/1.0.14 crate://crates.io/anstyle-parse/1.0.0 crate://crates.io/anstyle-query/1.1.5 crate://crates.io/anstyle-wincon/3.0.11 crate://crates.io/anyhow/1.0.104 crate://crates.io/archive-trait/0.0.14 crate://crates.io/arcstr/1.2.0 crate://crates.io/arrayvec/0.7.8 crate://crates.io/astral-tokio-tar/0.7.0 crate://crates.io/astral-version-ranges/0.2.2 crate://crates.io/astral_async_zip/0.0.20 crate://crates.io/async-compression/0.4.19 crate://crates.io/autocfg/1.5.0 crate://crates.io/backon/1.6.0 crate://crates.io/base64/0.22.1 crate://crates.io/bitflags/1.3.2 crate://crates.io/bitflags/2.13.1 crate://crates.io/block-buffer/0.10.4 crate:
 //crates.io/block-buffer/0.12.1 crate://crates.io/boxcar/0.2.14 crate://crates.io/bstr/1.12.1 crate://crates.io/bumpalo/3.20.2 crate://crates.io/bytecheck/0.8.3 crate://crates.io/bytecheck_derive/0.8.3 crate://crates.io/bytes/1.12.1 crate://crates.io/cap-primitives/4.0.3 crate://crates.io/cap-std/4.0.3 crate://crates.io/cc/1.2.57 crate://crates.io/cfg-if/1.0.4 crate://crates.io/charset/0.1.5 crate://crates.io/clap/4.6.6 crate://crates.io/clap_builder/4.6.6 crate://crates.io/clap_derive/4.6.4 crate://crates.io/clap_lex/1.1.0 crate://crates.io/colorchoice/1.0.5 crate://crates.io/console/0.16.4 crate://crates.io/const-oid/0.10.2 crate://crates.io/cpufeatures/0.2.17 crate://crates.io/cpufeatures/0.3.0 crate://crates.io/crc32fast/1.5.0 crate://crates.io/crypto-common/0.1.7 crate://crates.io/crypto-common/0.2.2 crate://crates.io/csv/1.4.0 crate://crates.io/csv-core/0.1.13 crate://crates.io/data-encoding/2.11.1 crate://crates.io/defmt/1.1.0 crate://crates.io/defmt-macros/1.1.0 crate://crat
 es.io/defmt-parser/1.0.0 crate://crates.io/digest/0.10.7 crate://crates.io/digest/0.11.3 crate://crates.io/displaydoc/0.2.5 crate://crates.io/dunce/1.0.5 crate://crates.io/dyn-clone/1.0.20 crate://crates.io/either/1.17.0 crate://crates.io/encode_unicode/1.0.0 crate://crates.io/encoding_rs/0.8.35 crate://crates.io/encoding_rs_io/0.1.8 crate://crates.io/enumflags2/0.7.12 crate://crates.io/enumflags2_derive/0.7.12 crate://crates.io/equivalent/1.0.2 crate://crates.io/erased-serde/0.4.10 crate://crates.io/errno/0.3.14 crate://crates.io/fastrand/2.5.0 crate://crates.io/find-msvc-tools/0.1.9 crate://crates.io/fixedbitset/0.5.7 crate://crates.io/flate2/1.1.9 crate://crates.io/foldhash/0.1.5 crate://crates.io/foldhash/0.2.0 crate://crates.io/form_urlencoded/1.2.2 crate://crates.io/fs-err/3.3.1 crate://crates.io/fs-set-times/0.20.3 crate://crates.io/futures/0.3.33 crate://crates.io/futures-channel/0.3.33 crate://crates.io/futures-core/0.3.33 crate://crates.io/futures-executor/0.3.33 crate://c
 rates.io/futures-io/0.3.33 crate://crates.io/futures-lite/2.6.1 crate://crates.io/futures-macro/0.3.33 crate://crates.io/futures-sink/0.3.33 crate://crates.io/futures-task/0.3.33 crate://crates.io/futures-util/0.3.33 crate://crates.io/generic-array/0.14.7 crate://crates.io/getrandom/0.3.4 crate://crates.io/getrandom/0.4.3 crate://crates.io/globset/0.4.20 crate://crates.io/gloo-timers/0.3.0 crate://crates.io/hashbrown/0.15.5 crate://crates.io/hashbrown/0.17.1 crate://crates.io/heck/0.5.0 crate://crates.io/hex/0.4.3 crate://crates.io/hybrid-array/0.4.13 crate://crates.io/icu_collections/2.1.1 crate://crates.io/icu_locale_core/2.1.1 crate://crates.io/icu_normalizer/2.1.1 crate://crates.io/icu_normalizer_data/2.1.1 crate://crates.io/icu_properties/2.1.2 crate://crates.io/icu_properties_data/2.1.2 crate://crates.io/icu_provider/2.1.1 crate://crates.io/idna/1.1.0 crate://crates.io/idna_adapter/1.2.1 crate://crates.io/indexmap/2.14.0 crate://crates.io/indoc/2.0.7 crate://crates.io/insta/1.
 48.0 crate://crates.io/io-extras/0.19.0 crate://crates.io/io-lifetimes/2.0.4 crate://crates.io/io-lifetimes/3.0.1 crate://crates.io/ipnet/2.12.0 crate://crates.io/is_terminal_polyfill/1.70.2 crate://crates.io/itertools/0.14.0 crate://crates.io/itoa/1.0.17 crate://crates.io/jiff/0.2.35 crate://crates.io/jiff-core/0.1.0 crate://crates.io/jiff-static/0.2.35 crate://crates.io/jiff-tzdb/0.1.8 crate://crates.io/jiff-tzdb-platform/0.1.3 crate://crates.io/jobserver/0.1.35 crate://crates.io/js-sys/0.3.91 crate://crates.io/junction/2.0.0 crate://crates.io/lazy_static/1.5.0 crate://crates.io/libc/0.2.189 crate://crates.io/linux-raw-sys/0.12.1 crate://crates.io/litemap/0.8.1 crate://crates.io/lock_api/0.4.14 crate://crates.io/log/0.4.29 crate://crates.io/mailparse/0.16.1 crate://crates.io/matchers/0.2.0 crate://crates.io/maybe-owned/0.3.4 crate://crates.io/memchr/2.8.3 crate://crates.io/miniz_oxide/0.8.9 crate://crates.io/mio/1.2.0 crate://crates.io/munge/0.4.7 crate://crates.io/munge_macro/0.4
 .7 crate://crates.io/nu-ansi-term/0.50.3 crate://crates.io/once_cell/1.21.4 crate://crates.io/once_cell_polyfill/1.70.2 crate://crates.io/owo-colors/4.3.0 crate://crates.io/parking/2.2.1 crate://crates.io/parking_lot/0.12.5 crate://crates.io/parking_lot_core/0.9.12 crate://crates.io/path-slash/0.2.1 crate://crates.io/percent-encoding/2.3.2 crate://crates.io/pest/2.8.6 crate://crates.io/pest_derive/2.8.6 crate://crates.io/pest_generator/2.8.6 crate://crates.io/pest_meta/2.8.6 crate://crates.io/petgraph/0.8.3 crate://crates.io/pin-project/1.1.11 crate://crates.io/pin-project-internal/1.1.11 crate://crates.io/pin-project-lite/0.2.17 crate://crates.io/pkg-config/0.3.32 crate://crates.io/portable-atomic/1.13.1 crate://crates.io/portable-atomic-util/0.2.6 crate://crates.io/potential_utf/0.1.4 crate://crates.io/proc-macro-error-attr2/2.0.0 crate://crates.io/proc-macro-error2/2.0.1 crate://crates.io/proc-macro2/1.0.107 crate://crates.io/ptr_meta/0.3.1 crate://crates.io/ptr_meta_derive/0.3.1
  crate://crates.io/quote/1.0.47 crate://crates.io/quoted_printable/0.5.1 crate://crates.io/r-efi/5.3.0 crate://crates.io/r-efi/6.0.0 crate://crates.io/rancor/0.1.1 crate://crates.io/redox_syscall/0.5.15 crate://crates.io/ref-cast/1.0.26 crate://crates.io/ref-cast-impl/1.0.26 crate://crates.io/reflink-copy/0.1.30 crate://crates.io/regex/1.13.1 crate://crates.io/regex-automata/0.4.18 crate://crates.io/regex-syntax/0.8.11 crate://crates.io/rend/0.5.3 crate://crates.io/rkyv/0.8.18 crate://crates.io/rkyv_derive/0.8.18 crate://crates.io/rustc-hash/2.1.3 crate://crates.io/rustix/1.1.4 crate://crates.io/rustix-linux-procfs/0.1.1 crate://crates.io/rustversion/1.0.22 crate://crates.io/ryu/1.0.23 crate://crates.io/same-file/1.0.6 crate://crates.io/schemars/1.2.2 crate://crates.io/schemars_derive/1.2.2 crate://crates.io/scopeguard/1.2.0 crate://crates.io/seahash/4.1.0 crate://crates.io/self-replace/1.5.0 crate://crates.io/serde/1.0.229 crate://crates.io/serde-untagged/0.1.9 crate://crates.io/se
 rde_core/1.0.229 crate://crates.io/serde_derive/1.0.229 crate://crates.io/serde_derive_internals/0.30.0 crate://crates.io/serde_json/1.0.151 crate://crates.io/serde_spanned/1.1.1 crate://crates.io/sha2/0.10.9 crate://crates.io/sha2/0.11.0 crate://crates.io/sharded-slab/0.1.7 crate://crates.io/shlex/1.3.0 crate://crates.io/signal-hook-registry/1.4.8 crate://crates.io/simd-adler32/0.3.8 crate://crates.io/simdutf8/0.1.5 crate://crates.io/similar/2.7.0 crate://crates.io/slab/0.4.12 crate://crates.io/smallvec/1.15.2 crate://crates.io/smawk/0.3.2 crate://crates.io/spdx/0.13.5 crate://crates.io/stable_deref_trait/1.2.1 crate://crates.io/strip-ansi-escapes/0.2.1 crate://crates.io/strsim/0.11.1 crate://crates.io/syn/2.0.118 crate://crates.io/syn/3.0.3 crate://crates.io/synstructure/0.13.2 crate://crates.io/tar-codec/0.0.14 crate://crates.io/tar-framing/0.0.14 crate://crates.io/temp-env/0.3.6 crate://crates.io/tempfile/3.27.0 crate://crates.io/terminal_size/0.4.4 crate://crates.io/textwrap/0.
 16.2 crate://crates.io/thiserror/2.0.19 crate://crates.io/thiserror-impl/2.0.19 crate://crates.io/thread_local/1.1.9 crate://crates.io/tinystr/0.8.2 crate://crates.io/tinyvec/1.11.0 crate://crates.io/tinyvec_macros/0.1.1 crate://crates.io/tokio/1.53.1 crate://crates.io/tokio-macros/2.7.0 crate://crates.io/tokio-stream/0.1.19 crate://crates.io/tokio-util/0.7.19 crate://crates.io/toml/1.1.3+spec-1.1.0 crate://crates.io/toml_datetime/1.1.1+spec-1.1.0 crate://crates.io/toml_edit/0.25.13+spec-1.1.0 crate://crates.io/toml_parser/1.1.2+spec-1.1.0 crate://crates.io/toml_writer/1.1.2+spec-1.1.0 crate://crates.io/tracing/0.1.44 crate://crates.io/tracing-attributes/0.1.31 crate://crates.io/tracing-core/0.1.36 crate://crates.io/tracing-log/0.2.0 crate://crates.io/tracing-subscriber/0.3.23 crate://crates.io/tracing-test/0.2.6 crate://crates.io/tracing-test-macro/0.2.6 crate://crates.io/typeid/1.0.3 crate://crates.io/typenum/1.20.1 crate://crates.io/ucd-trie/0.1.7 crate://crates.io/unicode-ident/
 1.0.24 crate://crates.io/unicode-linebreak/0.1.5 crate://crates.io/unicode-width/0.2.2 crate://crates.io/unscanny/0.1.0 crate://crates.io/url/2.5.8 crate://crates.io/utf8_iter/1.0.4 crate://crates.io/utf8parse/0.2.2 crate://crates.io/uuid/1.24.0 crate://crates.io/valuable/0.1.1 crate://crates.io/version_check/0.9.5 crate://crates.io/vte/0.14.1 crate://crates.io/walkdir/2.5.0 crate://crates.io/wasi/0.11.1+wasi-snapshot-preview1 crate://crates.io/wasip2/1.0.4+wasi-0.2.12 crate://crates.io/wasm-bindgen/0.2.114 crate://crates.io/wasm-bindgen-macro/0.2.114 crate://crates.io/wasm-bindgen-macro-support/0.2.114 crate://crates.io/wasm-bindgen-shared/0.2.114 crate://crates.io/winapi-util/0.1.11 crate://crates.io/windows/0.61.3 crate://crates.io/windows-collections/0.2.0 crate://crates.io/windows-core/0.61.2 crate://crates.io/windows-future/0.2.1 crate://crates.io/windows-implement/0.60.2 crate://crates.io/windows-interface/0.59.3 crate://crates.io/windows-link/0.1.3 crate://crates.io/windows-
 link/0.2.1 crate://crates.io/windows-numerics/0.2.0 crate://crates.io/windows-result/0.3.4 crate://crates.io/windows-strings/0.4.2 crate://crates.io/windows-sys/0.52.0 crate://crates.io/windows-sys/0.60.2 crate://crates.io/windows-sys/0.61.2 crate://crates.io/windows-targets/0.52.6 crate://crates.io/windows-targets/0.53.5 crate://crates.io/windows-threading/0.1.0 crate://crates.io/windows_aarch64_gnullvm/0.52.6 crate://crates.io/windows_aarch64_gnullvm/0.53.1 crate://crates.io/windows_aarch64_msvc/0.52.6 crate://crates.io/windows_aarch64_msvc/0.53.1 crate://crates.io/windows_i686_gnu/0.52.6 crate://crates.io/windows_i686_gnu/0.53.1 crate://crates.io/windows_i686_gnullvm/0.52.6 crate://crates.io/windows_i686_gnullvm/0.53.1 crate://crates.io/windows_i686_msvc/0.52.6 crate://crates.io/windows_i686_msvc/0.53.1 crate://crates.io/windows_x86_64_gnu/0.52.6 crate://crates.io/windows_x86_64_gnu/0.53.1 crate://crates.io/windows_x86_64_gnullvm/0.52.6 crate://crates.io/windows_x86_64_gnullvm/0.
 53.1 crate://crates.io/windows_x86_64_msvc/0.52.6 crate://crates.io/windows_x86_64_msvc/0.53.1 crate://crates.io/winnow/1.0.3 crate://crates.io/winx/0.36.4 crate://crates.io/wit-bindgen/0.57.1 crate://crates.io/writeable/0.6.2 crate://crates.io/xattr/1.6.1 crate://crates.io/yoke/0.8.1 crate://crates.io/yoke-derive/0.8.1 crate://crates.io/zerocopy/0.8.56 crate://crates.io/zerocopy-derive/0.8.56 crate://crates.io/zerofrom/0.1.6 crate://crates.io/zerofrom-derive/0.1.6 crate://crates.io/zerotrie/0.2.3 crate://crates.io/zerovec/0.11.5 crate://crates.io/zerovec-derive/0.11.2 crate://crates.io/zlib-rs/0.6.3 crate://crates.io/zmij/1.0.21 crate://crates.io/zstd/0.13.3 crate://crates.io/zstd-safe/7.2.4 crate://crates.io/zstd-sys/2.0.16+zstd.1.5.7" to "https://files.pythonhosted.org/packages/source/u/uv_build/uv_build-0.12.18.tar.gz crate://crates.io/adler2/2.0.1 crate://crates.io/aho-corasick/1.1.4 crate://crates.io/ambient-authority/0.0.2 crate://crates.io/anstream/1.0.0 crate://crates.io/an
 style/1.0.14 crate://crates.io/anstyle-parse/1.0.0 crate://crates.io/anstyle-query/1.1.5 crate://crates.io/anstyle-wincon/3.0.11 crate://crates.io/anyhow/1.0.104 crate://crates.io/archive-trait/0.0.14 crate://crates.io/arcstr/1.2.0 crate://crates.io/arrayvec/0.7.8 crate://crates.io/astral-tokio-tar/0.7.0 crate://crates.io/astral-version-ranges/0.2.2 crate://crates.io/astral_async_zip/0.0.20 crate://crates.io/async-compression/0.4.19 crate://crates.io/autocfg/1.5.0 crate://crates.io/backon/1.6.0 crate://crates.io/base64/0.22.1 crate://crates.io/bitflags/1.3.2 crate://crates.io/bitflags/2.13.1 crate://crates.io/block-buffer/0.10.4 crate://crates.io/block-buffer/0.12.1 crate://crates.io/boxcar/0.2.14 crate://crates.io/bstr/1.12.1 crate://crates.io/bumpalo/3.20.2 crate://crates.io/bytecheck/0.8.3 crate://crates.io/bytecheck_derive/0.8.3 crate://crates.io/bytes/1.12.1 crate://crates.io/cap-primitives/4.0.3 crate://crates.io/cap-std/4.0.3 crate://crates.io/cc/1.2.57 crate://crates.io/cfg-
 if/1.0.4 crate://crates.io/charset/0.1.5 crate://crates.io/clap/4.6.6 crate://crates.io/clap_builder/4.6.6 crate://crates.io/clap_derive/4.6.4 crate://crates.io/clap_lex/1.1.0 crate://crates.io/colorchoice/1.0.5 crate://crates.io/console/0.16.4 crate://crates.io/cpufeatures/0.2.17 crate://crates.io/cpufeatures/0.3.0 crate://crates.io/crc32fast/1.5.0 crate://crates.io/crypto-common/0.1.7 crate://crates.io/crypto-common/0.2.2 crate://crates.io/csv/1.4.0 crate://crates.io/csv-core/0.1.13 crate://crates.io/data-encoding/2.11.1 crate://crates.io/defmt/1.1.0 crate://crates.io/defmt-macros/1.1.0 crate://crates.io/defmt-parser/1.0.0 crate://crates.io/digest/0.10.7 crate://crates.io/digest/0.11.3 crate://crates.io/displaydoc/0.2.5 crate://crates.io/dunce/1.0.5 crate://crates.io/dyn-clone/1.0.20 crate://crates.io/either/1.18.0 crate://crates.io/encode_unicode/1.0.0 crate://crates.io/encoding_rs/0.8.35 crate://crates.io/encoding_rs_io/0.1.8 crate://crates.io/enumflags2/0.7.12 crate://crates.io
 /enumflags2_derive/0.7.12 crate://crates.io/equivalent/1.0.2 crate://crates.io/erased-serde/0.4.10 crate://crates.io/errno/0.3.14 crate://crates.io/fastrand/2.5.0 crate://crates.io/find-msvc-tools/0.1.9 crate://crates.io/fixedbitset/0.5.7 crate://crates.io/flate2/1.1.9 crate://crates.io/foldhash/0.1.5 crate://crates.io/foldhash/0.2.0 crate://crates.io/form_urlencoded/1.2.2 crate://crates.io/fs-err/3.3.1 crate://crates.io/fs-set-times/0.20.3 crate://crates.io/futures/0.3.34 crate://crates.io/futures-channel/0.3.34 crate://crates.io/futures-core/0.3.34 crate://crates.io/futures-executor/0.3.34 crate://crates.io/futures-io/0.3.34 crate://crates.io/futures-lite/2.6.1 crate://crates.io/futures-macro/0.3.34 crate://crates.io/futures-sink/0.3.34 crate://crates.io/futures-task/0.3.34 crate://crates.io/futures-util/0.3.34 crate://crates.io/generic-array/0.14.7 crate://crates.io/getrandom/0.4.3 crate://crates.io/globset/0.4.20 crate://crates.io/hashbrown/0.15.5 crate://crates.io/hashbrown/0.1
 7.1 crate://crates.io/heck/0.5.0 crate://crates.io/hex/0.4.3 crate://crates.io/hybrid-array/0.4.13 crate://crates.io/icu_collections/2.1.1 crate://crates.io/icu_locale_core/2.1.1 crate://crates.io/icu_normalizer/2.1.1 crate://crates.io/icu_normalizer_data/2.1.1 crate://crates.io/icu_properties/2.1.2 crate://crates.io/icu_properties_data/2.1.2 crate://crates.io/icu_provider/2.1.1 crate://crates.io/idna/1.1.0 crate://crates.io/idna_adapter/1.2.1 crate://crates.io/indexmap/2.14.0 crate://crates.io/indoc/2.0.7 crate://crates.io/insta/1.48.0 crate://crates.io/io-extras/0.19.0 crate://crates.io/io-lifetimes/2.0.4 crate://crates.io/io-lifetimes/3.0.1 crate://crates.io/ipnet/2.12.0 crate://crates.io/is_terminal_polyfill/1.70.2 crate://crates.io/itertools/0.14.0 crate://crates.io/itoa/1.0.17 crate://crates.io/jiff/0.2.35 crate://crates.io/jiff-core/0.1.0 crate://crates.io/jiff-static/0.2.35 crate://crates.io/jiff-tzdb/0.1.8 crate://crates.io/jiff-tzdb-platform/0.1.3 crate://crates.io/jobserv
 er/0.1.35 crate://crates.io/js-sys/0.3.91 crate://crates.io/junction/2.0.0 crate://crates.io/lazy_static/1.5.0 crate://crates.io/libc/0.2.189 crate://crates.io/linux-raw-sys/0.12.1 crate://crates.io/litemap/0.8.1 crate://crates.io/lock_api/0.4.14 crate://crates.io/log/0.4.29 crate://crates.io/mailparse/0.16.1 crate://crates.io/matchers/0.2.0 crate://crates.io/maybe-owned/0.3.4 crate://crates.io/memchr/2.8.3 crate://crates.io/miniz_oxide/0.8.9 crate://crates.io/mio/1.2.0 crate://crates.io/munge/0.4.7 crate://crates.io/munge_macro/0.4.7 crate://crates.io/nu-ansi-term/0.50.3 crate://crates.io/once_cell/1.21.4 crate://crates.io/once_cell_polyfill/1.70.2 crate://crates.io/owo-colors/4.3.0 crate://crates.io/parking/2.2.1 crate://crates.io/parking_lot/0.12.5 crate://crates.io/parking_lot_core/0.9.12 crate://crates.io/path-slash/0.2.1 crate://crates.io/percent-encoding/2.3.2 crate://crates.io/pest/2.8.6 crate://crates.io/pest_derive/2.8.6 crate://crates.io/pest_generator/2.8.6 crate://crate
 s.io/pest_meta/2.8.6 crate://crates.io/petgraph/0.8.3 crate://crates.io/pin-project/1.1.11 crate://crates.io/pin-project-internal/1.1.11 crate://crates.io/pin-project-lite/0.2.17 crate://crates.io/pkg-config/0.3.32 crate://crates.io/portable-atomic/1.13.1 crate://crates.io/portable-atomic-util/0.2.6 crate://crates.io/potential_utf/0.1.4 crate://crates.io/proc-macro-error-attr2/2.0.0 crate://crates.io/proc-macro-error2/2.0.1 crate://crates.io/proc-macro2/1.0.107 crate://crates.io/ptr_meta/0.3.1 crate://crates.io/ptr_meta_derive/0.3.1 crate://crates.io/quote/1.0.47 crate://crates.io/quoted_printable/0.5.1 crate://crates.io/r-efi/6.0.0 crate://crates.io/rancor/0.1.1 crate://crates.io/redox_syscall/0.5.15 crate://crates.io/ref-cast/1.0.27 crate://crates.io/ref-cast-impl/1.0.27 crate://crates.io/reflink-copy/0.1.30 crate://crates.io/regex/1.13.1 crate://crates.io/regex-automata/0.4.18 crate://crates.io/regex-syntax/0.8.11 crate://crates.io/rend/0.5.3 crate://crates.io/rkyv/0.8.18 crate:/
 /crates.io/rkyv_derive/0.8.18 crate://crates.io/rustc-hash/2.1.3 crate://crates.io/rustix/1.1.4 crate://crates.io/rustix-linux-procfs/0.1.1 crate://crates.io/rustversion/1.0.22 crate://crates.io/ryu/1.0.23 crate://crates.io/same-file/1.0.6 crate://crates.io/schemars/1.2.2 crate://crates.io/schemars_derive/1.2.2 crate://crates.io/scopeguard/1.2.0 crate://crates.io/seahash/4.1.0 crate://crates.io/self-replace/1.5.0 crate://crates.io/serde/1.0.229 crate://crates.io/serde-untagged/0.1.9 crate://crates.io/serde_core/1.0.229 crate://crates.io/serde_derive/1.0.229 crate://crates.io/serde_derive_internals/0.30.0 crate://crates.io/serde_json/1.0.151 crate://crates.io/serde_spanned/1.1.1 crate://crates.io/sha2/0.10.9 crate://crates.io/sha2/0.11.0 crate://crates.io/sharded-slab/0.1.7 crate://crates.io/shlex/1.3.0 crate://crates.io/signal-hook-registry/1.4.8 crate://crates.io/simd-adler32/0.3.8 crate://crates.io/simdutf8/0.1.5 crate://crates.io/similar/2.7.0 crate://crates.io/slab/0.4.12 crate:
 //crates.io/smallvec/1.15.2 crate://crates.io/smawk/0.3.2 crate://crates.io/socket2/0.6.3 crate://crates.io/spdx/0.13.5 crate://crates.io/stable_deref_trait/1.2.1 crate://crates.io/strip-ansi-escapes/0.2.1 crate://crates.io/strsim/0.11.1 crate://crates.io/syn/2.0.118 crate://crates.io/syn/3.0.3 crate://crates.io/synstructure/0.13.2 crate://crates.io/tar-codec/0.0.14 crate://crates.io/tar-framing/0.0.14 crate://crates.io/temp-env/0.3.6 crate://crates.io/tempfile/3.27.0 crate://crates.io/terminal_size/0.4.4 crate://crates.io/textwrap/0.16.2 crate://crates.io/thiserror/2.0.20 crate://crates.io/thiserror-impl/2.0.20 crate://crates.io/thread_local/1.1.9 crate://crates.io/tinystr/0.8.2 crate://crates.io/tinyvec/1.11.0 crate://crates.io/tinyvec_macros/0.1.1 crate://crates.io/tokio/1.53.1 crate://crates.io/tokio-macros/2.7.0 crate://crates.io/tokio-stream/0.1.19 crate://crates.io/toml/1.1.3+spec-1.1.0 crate://crates.io/toml_datetime/1.1.1+spec-1.1.0 crate://crates.io/toml_edit/0.25.13+spec-
 1.1.0 crate://crates.io/toml_parser/1.1.2+spec-1.1.0 crate://crates.io/toml_writer/1.1.2+spec-1.1.0 crate://crates.io/tracing/0.1.44 crate://crates.io/tracing-attributes/0.1.31 crate://crates.io/tracing-core/0.1.36 crate://crates.io/tracing-log/0.2.0 crate://crates.io/tracing-subscriber/0.3.23 crate://crates.io/tracing-test/0.2.6 crate://crates.io/tracing-test-macro/0.2.6 crate://crates.io/typeid/1.0.3 crate://crates.io/typenum/1.20.1 crate://crates.io/ucd-trie/0.1.7 crate://crates.io/unicode-ident/1.0.24 crate://crates.io/unicode-width/0.2.2 crate://crates.io/unscanny/0.1.0 crate://crates.io/url/2.5.8 crate://crates.io/utf8_iter/1.0.4 crate://crates.io/utf8parse/0.2.2 crate://crates.io/uuid/1.24.0 crate://crates.io/valuable/0.1.1 crate://crates.io/version_check/0.9.5 crate://crates.io/vte/0.14.1 crate://crates.io/walkdir/2.5.0 crate://crates.io/wasi/0.11.1+wasi-snapshot-preview1 crate://crates.io/wasm-bindgen/0.2.114 crate://crates.io/wasm-bindgen-macro/0.2.114 crate://crates.io/wa
 sm-bindgen-macro-support/0.2.114 crate://crates.io/wasm-bindgen-shared/0.2.114 crate://crates.io/winapi-util/0.1.11 crate://crates.io/windows/0.61.3 crate://crates.io/windows-collections/0.2.0 crate://crates.io/windows-core/0.61.2 crate://crates.io/windows-future/0.2.1 crate://crates.io/windows-implement/0.60.2 crate://crates.io/windows-interface/0.59.3 crate://crates.io/windows-link/0.1.3 crate://crates.io/windows-link/0.2.1 crate://crates.io/windows-numerics/0.2.0 crate://crates.io/windows-result/0.3.4 crate://crates.io/windows-strings/0.4.2 crate://crates.io/windows-sys/0.52.0 crate://crates.io/windows-sys/0.60.2 crate://crates.io/windows-sys/0.61.2 crate://crates.io/windows-targets/0.52.6 crate://crates.io/windows-targets/0.53.5 crate://crates.io/windows-threading/0.1.0 crate://crates.io/windows_aarch64_gnullvm/0.52.6 crate://crates.io/windows_aarch64_gnullvm/0.53.1 crate://crates.io/windows_aarch64_msvc/0.52.6 crate://crates.io/windows_aarch64_msvc/0.53.1 crate://crates.io/wind
 ows_i686_gnu/0.52.6 crate://crates.io/windows_i686_gnu/0.53.1 crate://crates.io/windows_i686_gnullvm/0.52.6 crate://crates.io/windows_i686_gnullvm/0.53.1 crate://crates.io/windows_i686_msvc/0.52.6 crate://crates.io/windows_i686_msvc/0.53.1 crate://crates.io/windows_x86_64_gnu/0.52.6 crate://crates.io/windows_x86_64_gnu/0.53.1 crate://crates.io/windows_x86_64_gnullvm/0.52.6 crate://crates.io/windows_x86_64_gnullvm/0.53.1 crate://crates.io/windows_x86_64_msvc/0.52.6 crate://crates.io/windows_x86_64_msvc/0.53.1 crate://crates.io/winnow/1.0.3 crate://crates.io/winx/0.36.4 crate://crates.io/writeable/0.6.2 crate://crates.io/yoke/0.8.1 crate://crates.io/yoke-derive/0.8.1 crate://crates.io/zerocopy/0.8.56 crate://crates.io/zerocopy-derive/0.8.56 crate://crates.io/zerofrom/0.1.6 crate://crates.io/zerofrom-derive/0.1.6 crate://crates.io/zerotrie/0.2.3 crate://crates.io/zerovec/0.11.5 crate://crates.io/zerovec-derive/0.11.2 crate://crates.io/zlib-rs/0.6.3 crate://crates.io/zmij/1.0.21 crate:/
 /crates.io/zstd/0.13.3 crate://crates.io/zstd-safe/7.2.4 crate://crates.io/zstd-sys/2.0.16+zstd.1.5.7"
packages/x86-64-v3-poky-linux/python3-uv-build: PKGV changed from 0.12.13 [default] to 0.12.18 [default]
packages/x86-64-v3-poky-linux/python3-uv-build/python3-uv-build-dbg: PV changed from "0.12.13" to "0.12.18"
packages/x86-64-v3-poky-linux/python3-uv-build/python3-uv-build-dbg: PKGV changed from 0.12.13 [default] to 0.12.18 [default]
packages/x86-64-v3-poky-linux/python3-uv-build/python3-uv-build-dev: PV changed from "0.12.13" to "0.12.18"
packages/x86-64-v3-poky-linux/python3-uv-build/python3-uv-build-dev: PKGV changed from 0.12.13 [default] to 0.12.18 [default]
packages/x86-64-v3-poky-linux/python3-uv-build/python3-uv-build-doc: PV changed from "0.12.13" to "0.12.18"
packages/x86-64-v3-poky-linux/python3-uv-build/python3-uv-build-doc: PKGV changed from 0.12.13 [default] to 0.12.18 [default]
packages/x86-64-v3-poky-linux/python3-uv-build/python3-uv-build-locale: PV changed from "0.12.13" to "0.12.18"
packages/x86-64-v3-poky-linux/python3-uv-build/python3-uv-build-locale: PKGV changed from 0.12.13 [default] to 0.12.18 [default]
packages/x86-64-v3-poky-linux/python3-uv-build/python3-uv-build-src: PV changed from "0.12.13" to "0.12.18"
packages/x86-64-v3-poky-linux/python3-uv-build/python3-uv-build-src: PKGV changed from 0.12.13 [default] to 0.12.18 [default]
packages/x86-64-v3-poky-linux/python3-uv-build/python3-uv-build-staticdev: PV changed from "0.12.13" to "0.12.18"
packages/x86-64-v3-poky-linux/python3-uv-build/python3-uv-build-staticdev: PKGV changed from 0.12.13 [default] to 0.12.18 [default]
packages/x86-64-v3-poky-linux/python3-uv-build/python3-uv-build: PV changed from "0.12.13" to "0.12.18"
packages/x86-64-v3-poky-linux/python3-uv-build/python3-uv-build: PKGSIZE changed from 4495657 to 4486369 (-0%)
packages/x86-64-v3-poky-linux/python3-uv-build/python3-uv-build: PKGV changed from 0.12.13 [default] to 0.12.18 [default]
packages/x86-64-v3-poky-linux/python3-uv-build/python3-uv-build: FILELIST: directory renamed /usr/lib/python3.14/site-packages/uv_build-0.12.13.dist-info -> /usr/lib/python3.14/site-packages/uv_build-0.12.18.dist-info, directory renamed /usr/lib/python3.14/site-packages/uv_build-0.12.13.dist-info/licenses -> /usr/lib/python3.14/site-packages/uv_build-0.12.18.dist-info/licenses
Changes to packages/x86-64-v3-poky-linux/python3-uv-build (sysroot):
  /usr/lib/python3.14/site-packages/uv_build-0.12.13.dist-info moved to /usr/lib/python3.14/site-packages/uv_build-0.12.18.dist-info

--===============2991536531201223529==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: attachment; filename="buildhistory-diff.txt"

packages/x86-64-v3-poky-linux/python3-uv-build/python3-uv-build: FILELIST: directory renamed /usr/lib/python3.14/site-packages/uv_build-0.12.13.dist-info -> /usr/lib/python3.14/site-packages/uv_build-0.12.18.dist-info, directory renamed /usr/lib/python3.14/site-packages/uv_build-0.12.13.dist-info/licenses -> /usr/lib/python3.14/site-packages/uv_build-0.12.18.dist-info/licenses
Changes to packages/x86-64-v3-poky-linux/python3-uv-build (sysroot):
  /usr/lib/python3.14/site-packages/uv_build-0.12.13.dist-info moved to /usr/lib/python3.14/site-packages/uv_build-0.12.18.dist-info

--===============2991536531201223529==
Content-Type: application/octet-stream
MIME-Version: 1.0
Content-Transfer-Encoding: base64
Content-Disposition: attachment;
 filename="0001-python3-uv-build-upgrade-0.12.13-0.12.18.patch"

RnJvbSBiZTk3YThhNjUxNTY2ODhlOTQyZDhlMmY1YTI1NDY3NmM1YmYwZmMxIE1vbiBTZXAgMTcg
MDA6MDA6MDAgMjAwMQpGcm9tOiBVcGdyYWRlIEhlbHBlciA8YXVoQHlvY3RvcHJvamVjdC5vcmc+
CkRhdGU6IFdlZCwgMjMgU2VwIDIwMjYgMDY6MTk6MzcgKzAwMDAKU3ViamVjdDogW1BBVENIXSBw
eXRob24zLXV2LWJ1aWxkOiB1cGdyYWRlIDAuMTIuMTMgLT4gMC4xMi4xOAoKLS0tCiAuLi4vcHl0
aG9uL3B5dGhvbjMtdXYtYnVpbGQtY3JhdGVzLmluYyAgICAgICAgfCA3OCArKysrKysrLS0tLS0t
LS0tLS0tCiAuLi4wLjEyLjEzLmJiID0+IHB5dGhvbjMtdXYtYnVpbGRfMC4xMi4xOC5iYn0gfCAg
MiArLQogMiBmaWxlcyBjaGFuZ2VkLCAzMSBpbnNlcnRpb25zKCspLCA0OSBkZWxldGlvbnMoLSkK
IHJlbmFtZSBtZXRhL3JlY2lwZXMtZGV2dG9vbHMvcHl0aG9uL3tweXRob24zLXV2LWJ1aWxkXzAu
MTIuMTMuYmIgPT4gcHl0aG9uMy11di1idWlsZF8wLjEyLjE4LmJifSAoOTIlKQoKZGlmZiAtLWdp
dCBhL21ldGEvcmVjaXBlcy1kZXZ0b29scy9weXRob24vcHl0aG9uMy11di1idWlsZC1jcmF0ZXMu
aW5jIGIvbWV0YS9yZWNpcGVzLWRldnRvb2xzL3B5dGhvbi9weXRob24zLXV2LWJ1aWxkLWNyYXRl
cy5pbmMKaW5kZXggMDJlOGY5YThhYi4uM2JhNDZkZDVkZSAxMDA2NDQKLS0tIGEvbWV0YS9yZWNp
cGVzLWRldnRvb2xzL3B5dGhvbi9weXRob24zLXV2LWJ1aWxkLWNyYXRlcy5pbmMKKysrIGIvbWV0
YS9yZWNpcGVzLWRldnRvb2xzL3B5dGhvbi9weXRob24zLXV2LWJ1aWxkLWNyYXRlcy5pbmMKQEAg
LTQsNyArNCw2IEBACiBTUkNfVVJJICs9ICIgXAogICAgIGNyYXRlOi8vY3JhdGVzLmlvL2FkbGVy
Mi8yLjAuMSBcCiAgICAgY3JhdGU6Ly9jcmF0ZXMuaW8vYWhvLWNvcmFzaWNrLzEuMS40IFwKLSAg
ICBjcmF0ZTovL2NyYXRlcy5pby9hbGxvY2F0b3ItYXBpMi8wLjIuMjEgXAogICAgIGNyYXRlOi8v
Y3JhdGVzLmlvL2FtYmllbnQtYXV0aG9yaXR5LzAuMC4yIFwKICAgICBjcmF0ZTovL2NyYXRlcy5p
by9hbnN0cmVhbS8xLjAuMCBcCiAgICAgY3JhdGU6Ly9jcmF0ZXMuaW8vYW5zdHlsZS8xLjAuMTQg
XApAQCAtNDMsNyArNDIsNiBAQCBTUkNfVVJJICs9ICIgXAogICAgIGNyYXRlOi8vY3JhdGVzLmlv
L2NsYXBfbGV4LzEuMS4wIFwKICAgICBjcmF0ZTovL2NyYXRlcy5pby9jb2xvcmNob2ljZS8xLjAu
NSBcCiAgICAgY3JhdGU6Ly9jcmF0ZXMuaW8vY29uc29sZS8wLjE2LjQgXAotICAgIGNyYXRlOi8v
Y3JhdGVzLmlvL2NvbnN0LW9pZC8wLjEwLjIgXAogICAgIGNyYXRlOi8vY3JhdGVzLmlvL2NwdWZl
YXR1cmVzLzAuMi4xNyBcCiAgICAgY3JhdGU6Ly9jcmF0ZXMuaW8vY3B1ZmVhdHVyZXMvMC4zLjAg
XAogICAgIGNyYXRlOi8vY3JhdGVzLmlvL2NyYzMyZmFzdC8xLjUuMCBcCkBAIC02MCw3ICs1OCw3
IEBAIFNSQ19VUkkgKz0gIiBcCiAgICAgY3JhdGU6Ly9jcmF0ZXMuaW8vZGlzcGxheWRvYy8wLjIu
NSBcCiAgICAgY3JhdGU6Ly9jcmF0ZXMuaW8vZHVuY2UvMS4wLjUgXAogICAgIGNyYXRlOi8vY3Jh
dGVzLmlvL2R5bi1jbG9uZS8xLjAuMjAgXAotICAgIGNyYXRlOi8vY3JhdGVzLmlvL2VpdGhlci8x
LjE3LjAgXAorICAgIGNyYXRlOi8vY3JhdGVzLmlvL2VpdGhlci8xLjE4LjAgXAogICAgIGNyYXRl
Oi8vY3JhdGVzLmlvL2VuY29kZV91bmljb2RlLzEuMC4wIFwKICAgICBjcmF0ZTovL2NyYXRlcy5p
by9lbmNvZGluZ19ycy8wLjguMzUgXAogICAgIGNyYXRlOi8vY3JhdGVzLmlvL2VuY29kaW5nX3Jz
X2lvLzAuMS44IFwKQEAgLTc4LDIxICs3NiwxOSBAQCBTUkNfVVJJICs9ICIgXAogICAgIGNyYXRl
Oi8vY3JhdGVzLmlvL2Zvcm1fdXJsZW5jb2RlZC8xLjIuMiBcCiAgICAgY3JhdGU6Ly9jcmF0ZXMu
aW8vZnMtZXJyLzMuMy4xIFwKICAgICBjcmF0ZTovL2NyYXRlcy5pby9mcy1zZXQtdGltZXMvMC4y
MC4zIFwKLSAgICBjcmF0ZTovL2NyYXRlcy5pby9mdXR1cmVzLzAuMy4zMyBcCi0gICAgY3JhdGU6
Ly9jcmF0ZXMuaW8vZnV0dXJlcy1jaGFubmVsLzAuMy4zMyBcCi0gICAgY3JhdGU6Ly9jcmF0ZXMu
aW8vZnV0dXJlcy1jb3JlLzAuMy4zMyBcCi0gICAgY3JhdGU6Ly9jcmF0ZXMuaW8vZnV0dXJlcy1l
eGVjdXRvci8wLjMuMzMgXAotICAgIGNyYXRlOi8vY3JhdGVzLmlvL2Z1dHVyZXMtaW8vMC4zLjMz
IFwKKyAgICBjcmF0ZTovL2NyYXRlcy5pby9mdXR1cmVzLzAuMy4zNCBcCisgICAgY3JhdGU6Ly9j
cmF0ZXMuaW8vZnV0dXJlcy1jaGFubmVsLzAuMy4zNCBcCisgICAgY3JhdGU6Ly9jcmF0ZXMuaW8v
ZnV0dXJlcy1jb3JlLzAuMy4zNCBcCisgICAgY3JhdGU6Ly9jcmF0ZXMuaW8vZnV0dXJlcy1leGVj
dXRvci8wLjMuMzQgXAorICAgIGNyYXRlOi8vY3JhdGVzLmlvL2Z1dHVyZXMtaW8vMC4zLjM0IFwK
ICAgICBjcmF0ZTovL2NyYXRlcy5pby9mdXR1cmVzLWxpdGUvMi42LjEgXAotICAgIGNyYXRlOi8v
Y3JhdGVzLmlvL2Z1dHVyZXMtbWFjcm8vMC4zLjMzIFwKLSAgICBjcmF0ZTovL2NyYXRlcy5pby9m
dXR1cmVzLXNpbmsvMC4zLjMzIFwKLSAgICBjcmF0ZTovL2NyYXRlcy5pby9mdXR1cmVzLXRhc2sv
MC4zLjMzIFwKLSAgICBjcmF0ZTovL2NyYXRlcy5pby9mdXR1cmVzLXV0aWwvMC4zLjMzIFwKKyAg
ICBjcmF0ZTovL2NyYXRlcy5pby9mdXR1cmVzLW1hY3JvLzAuMy4zNCBcCisgICAgY3JhdGU6Ly9j
cmF0ZXMuaW8vZnV0dXJlcy1zaW5rLzAuMy4zNCBcCisgICAgY3JhdGU6Ly9jcmF0ZXMuaW8vZnV0
dXJlcy10YXNrLzAuMy4zNCBcCisgICAgY3JhdGU6Ly9jcmF0ZXMuaW8vZnV0dXJlcy11dGlsLzAu
My4zNCBcCiAgICAgY3JhdGU6Ly9jcmF0ZXMuaW8vZ2VuZXJpYy1hcnJheS8wLjE0LjcgXAotICAg
IGNyYXRlOi8vY3JhdGVzLmlvL2dldHJhbmRvbS8wLjMuNCBcCiAgICAgY3JhdGU6Ly9jcmF0ZXMu
aW8vZ2V0cmFuZG9tLzAuNC4zIFwKICAgICBjcmF0ZTovL2NyYXRlcy5pby9nbG9ic2V0LzAuNC4y
MCBcCi0gICAgY3JhdGU6Ly9jcmF0ZXMuaW8vZ2xvby10aW1lcnMvMC4zLjAgXAogICAgIGNyYXRl
Oi8vY3JhdGVzLmlvL2hhc2hicm93bi8wLjE1LjUgXAogICAgIGNyYXRlOi8vY3JhdGVzLmlvL2hh
c2hicm93bi8wLjE3LjEgXAogICAgIGNyYXRlOi8vY3JhdGVzLmlvL2hlY2svMC41LjAgXApAQCAt
MTY3LDEyICsxNjMsMTEgQEAgU1JDX1VSSSArPSAiIFwKICAgICBjcmF0ZTovL2NyYXRlcy5pby9w
dHJfbWV0YV9kZXJpdmUvMC4zLjEgXAogICAgIGNyYXRlOi8vY3JhdGVzLmlvL3F1b3RlLzEuMC40
NyBcCiAgICAgY3JhdGU6Ly9jcmF0ZXMuaW8vcXVvdGVkX3ByaW50YWJsZS8wLjUuMSBcCi0gICAg
Y3JhdGU6Ly9jcmF0ZXMuaW8vci1lZmkvNS4zLjAgXAogICAgIGNyYXRlOi8vY3JhdGVzLmlvL3It
ZWZpLzYuMC4wIFwKICAgICBjcmF0ZTovL2NyYXRlcy5pby9yYW5jb3IvMC4xLjEgXAogICAgIGNy
YXRlOi8vY3JhdGVzLmlvL3JlZG94X3N5c2NhbGwvMC41LjE1IFwKLSAgICBjcmF0ZTovL2NyYXRl
cy5pby9yZWYtY2FzdC8xLjAuMjYgXAotICAgIGNyYXRlOi8vY3JhdGVzLmlvL3JlZi1jYXN0LWlt
cGwvMS4wLjI2IFwKKyAgICBjcmF0ZTovL2NyYXRlcy5pby9yZWYtY2FzdC8xLjAuMjcgXAorICAg
IGNyYXRlOi8vY3JhdGVzLmlvL3JlZi1jYXN0LWltcGwvMS4wLjI3IFwKICAgICBjcmF0ZTovL2Ny
YXRlcy5pby9yZWZsaW5rLWNvcHkvMC4xLjMwIFwKICAgICBjcmF0ZTovL2NyYXRlcy5pby9yZWdl
eC8xLjEzLjEgXAogICAgIGNyYXRlOi8vY3JhdGVzLmlvL3JlZ2V4LWF1dG9tYXRhLzAuNC4xOCBc
CkBAIC0yMDksNiArMjA0LDcgQEAgU1JDX1VSSSArPSAiIFwKICAgICBjcmF0ZTovL2NyYXRlcy5p
by9zbGFiLzAuNC4xMiBcCiAgICAgY3JhdGU6Ly9jcmF0ZXMuaW8vc21hbGx2ZWMvMS4xNS4yIFwK
ICAgICBjcmF0ZTovL2NyYXRlcy5pby9zbWF3ay8wLjMuMiBcCisgICAgY3JhdGU6Ly9jcmF0ZXMu
aW8vc29ja2V0Mi8wLjYuMyBcCiAgICAgY3JhdGU6Ly9jcmF0ZXMuaW8vc3BkeC8wLjEzLjUgXAog
ICAgIGNyYXRlOi8vY3JhdGVzLmlvL3N0YWJsZV9kZXJlZl90cmFpdC8xLjIuMSBcCiAgICAgY3Jh
dGU6Ly9jcmF0ZXMuaW8vc3RyaXAtYW5zaS1lc2NhcGVzLzAuMi4xIFwKQEAgLTIyMiw4ICsyMTgs
OCBAQCBTUkNfVVJJICs9ICIgXAogICAgIGNyYXRlOi8vY3JhdGVzLmlvL3RlbXBmaWxlLzMuMjcu
MCBcCiAgICAgY3JhdGU6Ly9jcmF0ZXMuaW8vdGVybWluYWxfc2l6ZS8wLjQuNCBcCiAgICAgY3Jh
dGU6Ly9jcmF0ZXMuaW8vdGV4dHdyYXAvMC4xNi4yIFwKLSAgICBjcmF0ZTovL2NyYXRlcy5pby90
aGlzZXJyb3IvMi4wLjE5IFwKLSAgICBjcmF0ZTovL2NyYXRlcy5pby90aGlzZXJyb3ItaW1wbC8y
LjAuMTkgXAorICAgIGNyYXRlOi8vY3JhdGVzLmlvL3RoaXNlcnJvci8yLjAuMjAgXAorICAgIGNy
YXRlOi8vY3JhdGVzLmlvL3RoaXNlcnJvci1pbXBsLzIuMC4yMCBcCiAgICAgY3JhdGU6Ly9jcmF0
ZXMuaW8vdGhyZWFkX2xvY2FsLzEuMS45IFwKICAgICBjcmF0ZTovL2NyYXRlcy5pby90aW55c3Ry
LzAuOC4yIFwKICAgICBjcmF0ZTovL2NyYXRlcy5pby90aW55dmVjLzEuMTEuMCBcCkBAIC0yMzEs
NyArMjI3LDYgQEAgU1JDX1VSSSArPSAiIFwKICAgICBjcmF0ZTovL2NyYXRlcy5pby90b2tpby8x
LjUzLjEgXAogICAgIGNyYXRlOi8vY3JhdGVzLmlvL3Rva2lvLW1hY3Jvcy8yLjcuMCBcCiAgICAg
Y3JhdGU6Ly9jcmF0ZXMuaW8vdG9raW8tc3RyZWFtLzAuMS4xOSBcCi0gICAgY3JhdGU6Ly9jcmF0
ZXMuaW8vdG9raW8tdXRpbC8wLjcuMTkgXAogICAgIGNyYXRlOi8vY3JhdGVzLmlvL3RvbWwvMS4x
LjMrc3BlYy0xLjEuMCBcCiAgICAgY3JhdGU6Ly9jcmF0ZXMuaW8vdG9tbF9kYXRldGltZS8xLjEu
MStzcGVjLTEuMS4wIFwKICAgICBjcmF0ZTovL2NyYXRlcy5pby90b21sX2VkaXQvMC4yNS4xMytz
cGVjLTEuMS4wIFwKQEAgLTI0OCw3ICsyNDMsNiBAQCBTUkNfVVJJICs9ICIgXAogICAgIGNyYXRl
Oi8vY3JhdGVzLmlvL3R5cGVudW0vMS4yMC4xIFwKICAgICBjcmF0ZTovL2NyYXRlcy5pby91Y2Qt
dHJpZS8wLjEuNyBcCiAgICAgY3JhdGU6Ly9jcmF0ZXMuaW8vdW5pY29kZS1pZGVudC8xLjAuMjQg
XAotICAgIGNyYXRlOi8vY3JhdGVzLmlvL3VuaWNvZGUtbGluZWJyZWFrLzAuMS41IFwKICAgICBj
cmF0ZTovL2NyYXRlcy5pby91bmljb2RlLXdpZHRoLzAuMi4yIFwKICAgICBjcmF0ZTovL2NyYXRl
cy5pby91bnNjYW5ueS8wLjEuMCBcCiAgICAgY3JhdGU6Ly9jcmF0ZXMuaW8vdXJsLzIuNS44IFwK
QEAgLTI2MCw3ICsyNTQsNiBAQCBTUkNfVVJJICs9ICIgXAogICAgIGNyYXRlOi8vY3JhdGVzLmlv
L3Z0ZS8wLjE0LjEgXAogICAgIGNyYXRlOi8vY3JhdGVzLmlvL3dhbGtkaXIvMi41LjAgXAogICAg
IGNyYXRlOi8vY3JhdGVzLmlvL3dhc2kvMC4xMS4xK3dhc2ktc25hcHNob3QtcHJldmlldzEgXAot
ICAgIGNyYXRlOi8vY3JhdGVzLmlvL3dhc2lwMi8xLjAuNCt3YXNpLTAuMi4xMiBcCiAgICAgY3Jh
dGU6Ly9jcmF0ZXMuaW8vd2FzbS1iaW5kZ2VuLzAuMi4xMTQgXAogICAgIGNyYXRlOi8vY3JhdGVz
LmlvL3dhc20tYmluZGdlbi1tYWNyby8wLjIuMTE0IFwKICAgICBjcmF0ZTovL2NyYXRlcy5pby93
YXNtLWJpbmRnZW4tbWFjcm8tc3VwcG9ydC8wLjIuMTE0IFwKQEAgLTMwMSw5ICsyOTQsNyBAQCBT
UkNfVVJJICs9ICIgXAogICAgIGNyYXRlOi8vY3JhdGVzLmlvL3dpbmRvd3NfeDg2XzY0X21zdmMv
MC41My4xIFwKICAgICBjcmF0ZTovL2NyYXRlcy5pby93aW5ub3cvMS4wLjMgXAogICAgIGNyYXRl
Oi8vY3JhdGVzLmlvL3dpbngvMC4zNi40IFwKLSAgICBjcmF0ZTovL2NyYXRlcy5pby93aXQtYmlu
ZGdlbi8wLjU3LjEgXAogICAgIGNyYXRlOi8vY3JhdGVzLmlvL3dyaXRlYWJsZS8wLjYuMiBcCi0g
ICAgY3JhdGU6Ly9jcmF0ZXMuaW8veGF0dHIvMS42LjEgXAogICAgIGNyYXRlOi8vY3JhdGVzLmlv
L3lva2UvMC44LjEgXAogICAgIGNyYXRlOi8vY3JhdGVzLmlvL3lva2UtZGVyaXZlLzAuOC4xIFwK
ICAgICBjcmF0ZTovL2NyYXRlcy5pby96ZXJvY29weS8wLjguNTYgXApAQCAtMzIyLDcgKzMxMyw2
IEBAIFNSQ19VUkkgKz0gIiBcCiAKIFNSQ19VUklbYWRsZXIyLTIuMC4xLnNoYTI1NnN1bV0gPSAi
MzIwMTE5NTc5ZmNhZDljMjE4ODRmNWM0ODYxZDE2MTc0ZDBlMDYyNTA2MjUyNjZmNTBmZTY4OTgz
NDBhYmVmYSIKIFNSQ19VUklbYWhvLWNvcmFzaWNrLTEuMS40LnNoYTI1NnN1bV0gPSAiZGRkMzFh
MTMwNDI3YzI3NTE4ZGYyNjY5NDNhNTMwOGVkOTJkNGIyMjZjYzYzOWY1YThmMTAwMjgxNjE3NDMw
MSIKLVNSQ19VUklbYWxsb2NhdG9yLWFwaTItMC4yLjIxLnNoYTI1NnN1bV0gPSAiNjgzZDc5MTBl
NzQzNTE4YjBlMzRmMTE4NmY5MjQ5NGJlY2FjYjA0N2M3YjZiZjYxNmM5Njc3MjE4MGZlZjkyMyIK
IFNSQ19VUklbYW1iaWVudC1hdXRob3JpdHktMC4wLjIuc2hhMjU2c3VtXSA9ICJlOWQ0ZWUwZDQ3
MmQxY2QyZTI4Yzk3ZGZhMTI0YjNkOGQ5OTJlMTBlYjBhMDM1ZjMzZjVkMTJlM2ExNzdiYTNiIgog
U1JDX1VSSVthbnN0cmVhbS0xLjAuMC5zaGEyNTZzdW1dID0gIjgyNGEyMTJmYWY5NmU5YWNhY2Ri
ZDA5ZmViZDM0NDM4ZjhmNzExZmI4NGUwOWE4OTE2MDEzY2Q3ODE1Y2EyOGQiCiBTUkNfVVJJW2Fu
c3R5bGUtMS4wLjE0LnNoYTI1NnN1bV0gPSAiOTQwYjNhMGNhNjAzZDFlYWRlNTBhNDg0NmEyYWZm
ZmQ1ZWY1N2E5ZmVhYzJjMGUyZWMyZTE0ZjllYWQ3NjAwMCIKQEAgLTM2MSw3ICszNTEsNiBAQCBT
UkNfVVJJW2NsYXBfZGVyaXZlLTQuNi40LnNoYTI1NnN1bV0gPSAiZDAxMmQyYjlkNjVhY2E3ZjE4
ZjRkOTg3OGEwNDViYzE3ODk5YmJhOQogU1JDX1VSSVtjbGFwX2xleC0xLjEuMC5zaGEyNTZzdW1d
ID0gImM4ZDRhM2JiOGIxZTBjMTA1MDQ5OWQxODE1ZjVhYjE2ZDA0ZjA5NTliMjMzMDg1ZmIzMTY1
M2ZiZmM5ZDk4ZjkiCiBTUkNfVVJJW2NvbG9yY2hvaWNlLTEuMC41LnNoYTI1NnN1bV0gPSAiMWQw
NzU1MGM5MDM2YmYyYWUwYzY4NGM0Mjk3ZDUwM2Y4MzgyODdjODNjNTM2ODZkMDUzNzBkMGUxMzlh
ZTU3MCIKIFNSQ19VUklbY29uc29sZS0wLjE2LjQuc2hhMjU2c3VtXSA9ICI0ZmU1ZjQ2NWE0ZjZm
ZWU4OGZhZDQxYjg1ZDk5MGY4NGM4MzUzMzVlODViNWQ5ZTZlNjNlMGQwNmQyOGNiYTdjIgotU1JD
X1VSSVtjb25zdC1vaWQtMC4xMC4yLnNoYTI1NnN1bV0gPSAiYTZlZjUxN2YwOTI2ZGQyNGExNTgy
NDkyYzc5MWI2YTQ4MThhNGQ5NGU3ODlhMzM0ODk0YWExNWIwZDEyZjU1YyIKIFNSQ19VUklbY3B1
ZmVhdHVyZXMtMC4yLjE3LnNoYTI1NnN1bV0gPSAiNTllZDU4MzhlZWJiMjZhMmJiMmU1OGY2ZDVi
NTMxNjk4OWFlOWQwOGJhYjEwZTBlNmQxMDNlNjU2ZDFiMDI4MCIKIFNSQ19VUklbY3B1ZmVhdHVy
ZXMtMC4zLjAuc2hhMjU2c3VtXSA9ICI4YjJhNDEzOTNmNjZmMTZiMDgyM2JiNzkwOTRkNTRhYzVm
YmQzNGFiMjkyZGRhZmI5YTA0NTZhYzlmODdkMjAxIgogU1JDX1VSSVtjcmMzMmZhc3QtMS41LjAu
c2hhMjU2c3VtXSA9ICI5NDgxYzFjOTBjYmYyYWM5NTNmMDdjOGQ0YTU4YWEzOTQ1YzQyNWI3MTg1
YzkxNTRkNjdhNjVlNDIzMGRhNTExIgpAQCAtMzc4LDcgKzM2Nyw3IEBAIFNSQ19VUklbZGlnZXN0
LTAuMTEuMy5zaGEyNTZzdW1dID0gImYxZGQ2ZGJiNTg0MTkzNzk0MDc4MTg2NmZhMTI4MWExZmY3
YmQzYmY4MjcwCiBTUkNfVVJJW2Rpc3BsYXlkb2MtMC4yLjUuc2hhMjU2c3VtXSA9ICI5NzM2OWNi
YmMwNDFiYzM2Njk0OWJjNzRkMzQ2NThkNmNkYTU2MjEwMzk3MzFjNjMxMDUyMTg5MmEzYTIwYWUw
IgogU1JDX1VSSVtkdW5jZS0xLjAuNS5zaGEyNTZzdW1dID0gIjkyNzczNTA0ZDU4YzA5M2Y2ZGUy
NDU5YWY0YWYzM2ZhYTUxOGMxMzQ1MWViOGYyYjU2OThlZDNkMzZlN2M4MTMiCiBTUkNfVVJJW2R5
bi1jbG9uZS0xLjAuMjAuc2hhMjU2c3VtXSA9ICJkMDg4MWVhMTgxYjFkZjczZmY3N2ZmYWFmOWM3
NTQ0ZWNjMTFlODJmYmE5YjVmMjdiMjYyYTNjNzNhMzMyNTU1IgotU1JDX1VSSVtlaXRoZXItMS4x
Ny4wLnNoYTI1NnN1bV0gPSAiOWU1ZThmNmMxNWEyNGI5YTNlZTVlZmVjODA5Y2NkMDA2ZDNiMzBl
OGIzYmI2M2MzOWFmNzM3YzdmODdkYWExZCIKK1NSQ19VUklbZWl0aGVyLTEuMTguMC5zaGEyNTZz
dW1dID0gIjI1MmFmYjlhZTVlYWE2ODNiYWJkYzZhMDY4YjNmNTcyNmViMTllMDUwNzBjNzMxZjli
MmEyM2E3YzNlOGVkMzQiCiBTUkNfVVJJW2VuY29kZV91bmljb2RlLTEuMC4wLnNoYTI1NnN1bV0g
PSAiMzRhYTczNjQ2ZmZiMDA2YjhmNTE0N2YzZGMxODJiZDRiY2IxOTAyMjdjZTg2MWZjNGE0ODQ0
YmY4ZTNjYjJjMCIKIFNSQ19VUklbZW5jb2RpbmdfcnMtMC44LjM1LnNoYTI1NnN1bV0gPSAiNzUw
MzBmM2M0ZjQ1ZGFmZDc1ODZkZDY3ODA5NjVhOGM3ZThlMjg1YTVlY2I4NjcxM2U2M2E3OWM1YjI3
NjZmMyIKIFNSQ19VUklbZW5jb2RpbmdfcnNfaW8tMC4xLjguc2hhMjU2c3VtXSA9ICJmYmEzZmU4
NDcwNDVlY2ZmNzk0YjljMTM4MjkzYTgwZGI5MTQ2NzhjNDUzYWQ2M2ZiZjBjNmE5ZWI2ZTAwYjIy
IgpAQCAtMzk2LDIxICszODUsMTkgQEAgU1JDX1VSSVtmb2xkaGFzaC0wLjIuMC5zaGEyNTZzdW1d
ID0gIjc3Y2UyNGNiNTgyMjhmYmI4YWEwNDE0MjViYjEwNTA4NTBhYzE5MTc3NjgKIFNSQ19VUklb
Zm9ybV91cmxlbmNvZGVkLTEuMi4yLnNoYTI1NnN1bV0gPSAiY2I0Y2IyNDUwMzg1MTZmNWY4NTI3
Nzg3NWNkYWE0ZjdkMmM5YTBmYTA0NjhkZTA2ZWQxOTAxNjNiMTU4MWZjZiIKIFNSQ19VUklbZnMt
ZXJyLTMuMy4xLnNoYTI1NnN1bV0gPSAiYjkxYWE0NDhjYTUwZDdlNzk0MzNiZGYzZWU4ZDk5MjE1
NDMwZDJlYzAyYWRlNWFlZmFiMmEwNzNhMTgyMmU4YSIKIFNSQ19VUklbZnMtc2V0LXRpbWVzLTAu
MjAuMy5zaGEyNTZzdW1dID0gIjk0ZTcwOTlmNjMxM2VjYWNiZTEyNTZlOGZmOWQ2MTdiNzVkMWJj
YjE2YTZmZGRlZjk0ODY2ZDIyNWEwMWExNGEiCi1TUkNfVVJJW2Z1dHVyZXMtMC4zLjMzLnNoYTI1
NnN1bV0gPSAiYTg4Y2YxZjgyOWQ5NDVmNTQ4Y2Y4ZmVjMzJjNjFiMWYyMDJiNmQ5M2I0NTg0ODYw
MmZjMDJhZjRiMTJhZDIxOCIKLVNSQ19VUklbZnV0dXJlcy1jaGFubmVsLTAuMy4zMy5zaGEyNTZz
dW1dID0gIjI2MjU5MGY0ZmU2YWZlYjBiYzgzYmUxZGFhNjRlNTI2NTdmZTE4NTY5MGE5NThhZjdm
M2FkMGU5MjA4NWM1YWUiCi1TUkNfVVJJW2Z1dHVyZXMtY29yZS0wLjMuMzMuc2hhMjU2c3VtXSA9
ICIyY2Q1MGM0NzNjODBmNmQ3YzM2NzBhNzUyMzU0YjhlNTY5YjFhN2NiZmRjMDQxOWVjODhlNWVk
YWQ4NWUwZGM3IgotU1JDX1VSSVtmdXR1cmVzLWV4ZWN1dG9yLTAuMy4zMy5zaGEyNTZzdW1dID0g
IjY3NTQ4NzljYzlmMmM2NmY4OGM2ZTVjMzUzNDRiYjBiZGIwNzA4YjAzNTJiMTIwMTgxNTY2N2M3
ZWFiYzc0NTgiCi1TUkNfVVJJW2Z1dHVyZXMtaW8tMC4zLjMzLnNoYTI1NnN1bV0gPSAiNDU3N2Vj
YWEzYzRmOTY1ODlkNDczZjY3OWE3MWI1OTYzMTZmNjY0MWJjMzUwMDM4Yjk2MmE1ZGFmMDA4NWQ3
YSIKK1NSQ19VUklbZnV0dXJlcy0wLjMuMzQuc2hhMjU2c3VtXSA9ICI5YTMxZDJhM2ZiYWFlYjJh
ZjIzNjhiYmRkOTA0YWE4ZTgxMmQzYzA0YTFlZTEwZDMxNzFmNTJkNTU2ZTVkMGEzIgorU1JDX1VS
SVtmdXR1cmVzLWNoYW5uZWwtMC4zLjM0LnNoYTI1NnN1bV0gPSAiYjFmOWUzZDY5ZDM5ZTQ4NjJm
ZmVkMDNlZDA3MWE3NmY5YTEzYmExZDkxMDlkMzU1YjBmMGFhNmIxNWUzOTNjNCIKK1NSQ19VUklb
ZnV0dXJlcy1jb3JlLTAuMy4zNC5zaGEyNTZzdW1dID0gIjkyZDY5OWU1MjIyNDJlNjllMzAwM2I5
NGVjYzFmOTYwZjNhNWUwMTVhYTdjNWQ3NDg2ZTY1YWQwMWRkOTRmNWUiCitTUkNfVVJJW2Z1dHVy
ZXMtZXhlY3V0b3ItMC4zLjM0LnNoYTI1NnN1bV0gPSAiMDMxYjQ3Y2YxYTNjNmNjOGJjMmZjNzZj
ZDQzN2Y1MjE2MTkzODc5MDdkNDY5MzE2ZTdjMGJjMjc4ZjFmNTQzMiIKK1NSQ19VUklbZnV0dXJl
cy1pby0wLjMuMzQuc2hhMjU2c3VtXSA9ICI1M2MwZmE4MTU3ZGUxMzAzYmZmZmRhYTFjYzJhNjcz
YmZmZmI2MDEwMmY3NmIwZWY0NDQxNjU5MTI0MzczZmVkIgogU1JDX1VSSVtmdXR1cmVzLWxpdGUt
Mi42LjEuc2hhMjU2c3VtXSA9ICJmNzhlMTA2MDlmZTBlMGIzZjQxNTdmZmFiMTg3NjMxOWI1YjBk
YjEwMmEyYzYwZGM0NjI2MzA2ZGM0NmI0NGFkIgotU1JDX1VSSVtmdXR1cmVzLW1hY3JvLTAuMy4z
My5zaGEyNTZzdW1dID0gIjJkNmQzY2RlNjhjNTE4MzY3YmUyODk1NjA2NmRkZmVmMzM4MTM5OTFi
NzdhNTUwMDVhNjlkYWUwNGJmM2IxMGIiCi1TUkNfVVJJW2Z1dHVyZXMtc2luay0wLjMuMzMuc2hh
MjU2c3VtXSA9ICJlMzQ0MThhYzQ5OWQ2MzA1YzJmYjVhZDBlZDJmNmFjOTk4YzVmOGNhMjA5YjQ1
MTBmN2Y5NDI0MmM2NDdlMzA3IgotU1JDX1VSSVtmdXR1cmVzLXRhc2stMC4zLjMzLnNoYTI1NnN1
bV0gPSAiYjIzMWVkMjg4MzFlZmI0YTYxYTA4NTgwYzRiYzIzM2VjNTZiYzAwOWY0Y2Q4ZjUyZGEy
YzNjYjk3ZGYwYzEwOSIKLVNSQ19VUklbZnV0dXJlcy11dGlsLTAuMy4zMy5zaGEyNTZzdW1dID0g
ImE3N2E5MGEyNTZmY2UzNGRhNjY0MTUyNzFlMzBmOTRlZTkxYzU3YjA0YjhhMmMwNDJkOWNmMzIy
MDE3OWRlYWEiCitTUkNfVVJJW2Z1dHVyZXMtbWFjcm8tMC4zLjM0LnNoYTI1NnN1bV0gPSAiOWZi
OTY1NGJhODM1NTM4OGFiZWI4ZGNiNGZjNjJmNTExMzAwODY3MDAyYWZjODU4ODYwNDYzYmRkOWZl
MGM0NCIKK1NSQ19VUklbZnV0dXJlcy1zaW5rLTAuMy4zNC5zaGEyNTZzdW1dID0gIjE5NDQ0MjZi
ZjdkMDNmMWQxNGY3MDg3ODVlNGIzM2VmZDc1MGIzNmQ0OGExNTdiODM2YjNlZmMxNWVkZThlMWQi
CitTUkNfVVJJW2Z1dHVyZXMtdGFzay0wLjMuMzQuc2hhMjU2c3VtXSA9ICJjZDQxN2RlM2QxZDAx
NWZjM2JmZDJiMWVhNDZkZmM3YmFiNzJlZjg2ZjFjYzdjYzljNzhlNzI4YjM0YTZkMWZkIgorU1JD
X1VSSVtmdXR1cmVzLXV0aWwtMC4zLjM0LnNoYTI1NnN1bV0gPSAiMGQ1MGE5MjQ2N2Y4YmE1ZGQ2
ZTNlZTVkNGJkMDRkNzNhYjJlNGUxYzQ0NDc0YTA2NzQ4MjFkZmNlMTRiNzliYyIKIFNSQ19VUklb
Z2VuZXJpYy1hcnJheS0wLjE0Ljcuc2hhMjU2c3VtXSA9ICI4NTY0OWNhNTFmZDcyMjcyZDc4MjFh
ZGFmMjc0YWQ5MWMyODgyNzc3MTNkOWMxODgyMGQ4NDk5YTdmZjY5ZTlhIgotU1JDX1VSSVtnZXRy
YW5kb20tMC4zLjQuc2hhMjU2c3VtXSA9ICI4OTlkZWY1YzM3YzRmZDdiMjY2NDY0OGMyODEyMGVj
ZWMxMzhlNGQzOTViNDU5ZTVjYTM0ZjljY2UyZGQ3N2ZkIgogU1JDX1VSSVtnZXRyYW5kb20tMC40
LjMuc2hhMjU2c3VtXSA9ICIzMDBlODgzZDc1NmIyZTRlYzk0ZTAyNzkxZjM5YjA0YjUyMjI3NjEz
ODg1MmNmYzQxZDlmYjdlOTA0MTA2MDk5IgogU1JDX1VSSVtnbG9ic2V0LTAuNC4yMC5zaGEyNTZz
dW1dID0gIjA3YzM0YTk0MTA0NjViNDViZDk3ODc0NDNiYzczNzBmMzc3MzViYWQwNGIwZjBjZDU3
ZmYxYTMxODZjOTg5ODgiCi1TUkNfVVJJW2dsb28tdGltZXJzLTAuMy4wLnNoYTI1NnN1bV0gPSAi
YmJiMTQzY2Y5NjA5OTgwMjAzM2UwZDRmNDk2M2IxOWZkMmUwYjcyOGJjZjA3NmNkOWNmN2Y2NjM0
ZjA5Mjk5NCIKIFNSQ19VUklbaGFzaGJyb3duLTAuMTUuNS5zaGEyNTZzdW1dID0gIjkyMjljZmU1
M2RmZDY5ZjA2MDlhNDlmNjU0NjFiZDkzMDAxZWExZWY4ODljZDU1MjlkZDE3NjU5M2Y1MzM4YTEi
CiBTUkNfVVJJW2hhc2hicm93bi0wLjE3LjEuc2hhMjU2c3VtXSA9ICJlZDU5MDliNmU4OWEyZGI0
NDU2ZTU0Y2Q1ZjY3Mzc5MWQ3ZWNhNjczMjIwMmJiZjJhOWNjNTA0ZmUyZjliODRhIgogU1JDX1VS
SVtoZWNrLTAuNS4wLnNoYTI1NnN1bV0gPSAiMjMwNGUwMDk4M2Y4N2ZmYjM4YjU1YjQ0NGI1ZTNi
NjBhODg0YjVkMzBjMGZjYTdkODJmZTMzNDQ5YmJlNTVlYSIKQEAgLTQ4NSwxMiArNDcyLDExIEBA
IFNSQ19VUklbcHRyX21ldGEtMC4zLjEuc2hhMjU2c3VtXSA9ICIwYjlhMGNmOTVhMTE5NmFmNjFk
NGYxY2JkYWI5NjcxNzk1MTZkOWE0YTQzCiBTUkNfVVJJW3B0cl9tZXRhX2Rlcml2ZS0wLjMuMS5z
aGEyNTZzdW1dID0gIjczNDc4NjdkMGE3ZTEyMDhkOTNiNDY3NjdiZTgzZTJiOGY5NzhjM2RhZDM1
Zjc3NWFjOGQ4ODQ3NTUxZDZmZTEiCiBTUkNfVVJJW3F1b3RlLTEuMC40Ny5zaGEyNTZzdW1dID0g
IjFmYmY0ZGIxNDJhNDczYThkODBjMjZiYmYxODQ1NGVkNDU4YmY4ZDI2YzgyMTljMzMxZGFlY2Zk
YmQwNzkwMDEiCiBTUkNfVVJJW3F1b3RlZF9wcmludGFibGUtMC41LjEuc2hhMjU2c3VtXSA9ICI2
NDBjOWJkODQ5N2IwMjQ2NWFlZWY1Mzc1MTQ0YzI2MDYyZTBkY2Q1OTM5ZGZjYmIwZjVkYjc2Y2I4
YzE3YzczIgotU1JDX1VSSVtyLWVmaS01LjMuMC5zaGEyNTZzdW1dID0gIjY5Y2RiMzRjMTU4Y2Vi
Mjg4ZGYxMWUxOGI0YmQzOWRlOTk0ZjY2NTdkODM4NDdiZGZmZGJkN2YzNDY3NTRiMGYiCiBTUkNf
VVJJW3ItZWZpLTYuMC4wLnNoYTI1NnN1bV0gPSAiZjhkY2M5YzdkNTJhODExNjk3ZDIxNTFjNzAx
ZTBkMDg5NTZmOTJiMGUyNDEzNmNmNGNmMjdiNTdhNmEwZDliZiIKIFNSQ19VUklbcmFuY29yLTAu
MS4xLnNoYTI1NnN1bV0gPSAiYTA2M2VhNzIzODE1MjdjMmEwNTYxZGE5YzgwMDAwZWY4MjJiZGQ3
YzMyNDFiMWNjMWIxMjEwMGUzZGYwODFlZSIKIFNSQ19VUklbcmVkb3hfc3lzY2FsbC0wLjUuMTUu
c2hhMjU2c3VtXSA9ICI3ZThhZjBkZGUwOTQwMDYwMTFlNmE3NDBkNDg3OTMxOTQzOTQ4OTgxM2Jk
MGJjZGM3ZDgyMWJlYWVlZmY0OGVjIgotU1JDX1VSSVtyZWYtY2FzdC0xLjAuMjYuc2hhMjU2c3Vt
XSA9ICIyMTZlOGY3NzNkNzkyM2JjYmE5Y2ViODZhODZjOTNjYWJiMzkwM2ExMTg3MmZjM2YxMzhj
NDk2MzBlNTBiOTZkIgotU1JDX1VSSVtyZWYtY2FzdC1pbXBsLTEuMC4yNi5zaGEyNTZzdW1dID0g
IjJjOTI4MzY4NWZlZWM3ZDY5YWY3NWZiMGU4NThkNWU3Mzc4ZjMzZmU0ZmM2OTkzODNiMjkxNmFi
OTI3M2UwM2MiCitTUkNfVVJJW3JlZi1jYXN0LTEuMC4yNy5zaGEyNTZzdW1dID0gIjdlNDQwZmI0
ZTRiNDE0NzI5NTMzOGVmYjc2MDAxYWI5ZTRlZmMwZTU4MzlkZjJjNDdmYzVhYzIzODFkMzY1YzMi
CitTUkNfVVJJW3JlZi1jYXN0LWltcGwtMS4wLjI3LnNoYTI1NnN1bV0gPSAiOTJlY2Q4OTY0Zjg0
NTM3MjE2OTlhMWVkNzIwMzdiMGRiNDljZTJmNWE1MTM4NDg2ZWU4OWJlZDZmNjdjZGYzYSIKIFNS
Q19VUklbcmVmbGluay1jb3B5LTAuMS4zMC5zaGEyNTZzdW1dID0gImQ5ZGQ3YWI0YWYwMzYzZDVj
Y2ZkMjgzOGQ3ODJhMjgxOTZjZjMyYTVjYzJlNGZlM2M1ZGM4M2YyYmU1ODhiOGIiCiBTUkNfVVJJ
W3JlZ2V4LTEuMTMuMS5zaGEyNTZzdW1dID0gImYwMjAyMzdiNmM4ZWVkOTNkYjJlMmNiNTNjMDBj
NjBhOGUxYmM3M2RhN2QwNzMxOTlhMTE4MDQwMTQ1MDIxOGQiCiBTUkNfVVJJW3JlZ2V4LWF1dG9t
YXRhLTAuNC4xOC5zaGEyNTZzdW1dID0gImFkODU1M2I5YjI2NDEzMjUxY2JmMzBlNjIwNTk1Yzdh
NDFiMzg4N2YwM2RhMDQ1NzljMGU2YjBkNmEwNmI0YjIiCkBAIC01MjcsNiArNTEzLDcgQEAgU1JD
X1VSSVtzaW1pbGFyLTIuNy4wLnNoYTI1NnN1bV0gPSAiYmJiYjVkOTY1OTE0MTY0NmFlNjQ3YjQy
ZmUwOTRkYWY2YzYxOTJkMTYyMDgKIFNSQ19VUklbc2xhYi0wLjQuMTIuc2hhMjU2c3VtXSA9ICIw
Yzc5MGRlMjMxMjRmOWFiNDQ1NDRkN2FjMDVkNjA0NDBhZGM1ODY0NzljZTUwMWMxZDZkN2RhM2Nk
OGM5Y2Y1IgogU1JDX1VSSVtzbWFsbHZlYy0xLjE1LjIuc2hhMjU2c3VtXSA9ICI4ZWQ2YTYzZjAy
Yzg1MzljOTFhODY4NWE4NmY0MDk5NjYxYmEzZGEwMTc5MzJmNmViYmVhNmRlM2YwZmE3YzkwIgog
U1JDX1VSSVtzbWF3ay0wLjMuMi5zaGEyNTZzdW1dID0gImI3YzM4OGMxYjVlOTM3NTZkMGM3NDA5
NjVjNDFlODgyMmY4NjY2MjFkNDFhY2JkZjYzMzZhNmExNjhmODg0MGMiCitTUkNfVVJJW3NvY2tl
dDItMC42LjMuc2hhMjU2c3VtXSA9ICIzYTc2NmUxMTEwNzg4YzM2ZjRmYTFjMmI3MWIzODdhNzgx
NWFhNjVmODhjZTAyMjk4NDE4MjY2MzNkOTM3MjNlIgogU1JDX1VSSVtzcGR4LTAuMTMuNS5zaGEy
NTZzdW1dID0gIjA4MTY3MGMyMzNkZmJlZDU1NjkwY2MwY2QzODQyNGUwZTI0YWMxYjI2NzNkMGI0
MDhiM2Y3YjY4NDczOGRmYTkiCiBTUkNfVVJJW3N0YWJsZV9kZXJlZl90cmFpdC0xLjIuMS5zaGEy
NTZzdW1dID0gIjZjZTJiZThkYzI1NDU1ZTFmOTFkZjcxYmZhMTJhZDM3ZDdhZjEwOTJhZTczNmYz
YTZjZDBlMzdiYzc4MTA1OTYiCiBTUkNfVVJJW3N0cmlwLWFuc2ktZXNjYXBlcy0wLjIuMS5zaGEy
NTZzdW1dID0gIjJhOGY4MDM4ZTdlNzk2OWFiYjNmMWI3YzJhODExMjI1ZTkyOTZkYTIwODUzOWUw
Zjc5YzUyNTFkNmNhYzAwMjUiCkBAIC01NDAsOCArNTI3LDggQEAgU1JDX1VSSVt0ZW1wLWVudi0w
LjMuNi5zaGEyNTZzdW1dID0gIjk2Mzc0ODU1MDY4ZjQ3NDAyYzMxMjFjNmVlZDg4ZDI5Y2IxZGU4
ZjNhYjIKIFNSQ19VUklbdGVtcGZpbGUtMy4yNy4wLnNoYTI1NnN1bV0gPSAiMzI0OTdlOWE0Yzdi
Mzg1MzJlZmNkZWJlZWY4Nzk3MDdhYTlmNzk0Mjk2YTRmMDI0NGY2ZjY5ZTliYzg1NzRiZCIKIFNS
Q19VUklbdGVybWluYWxfc2l6ZS0wLjQuNC5zaGEyNTZzdW1dID0gIjIzMGExYjgyMWNjYmQ3NWIx
ODU4MjBhMWYxZmY3YjE0ZDIxZGExZTQ0MmUyMmMwODYzZWE1ZjA4NzcxYTg4NzQiCiBTUkNfVVJJ
W3RleHR3cmFwLTAuMTYuMi5zaGEyNTZzdW1dID0gImMxMzU0NzYxNWE0NGRjOWM0NTJhOGE1MzQ2
MzhhY2RmMDcxMjBkNGI2ODQ3YzgxNzg3MDVkYTA2MzA2YTMwNTciCi1TUkNfVVJJW3RoaXNlcnJv
ci0yLjAuMTkuc2hhMjU2c3VtXSA9ICIwOWE0MzU5ODg0MGUzM2Q1YjAzMzFmMzhjNWUzMGQxM2Ji
MTFjMTEyMTBhNGI1OGYwZDliMThhNWE1ZWVmY2Q5IgotU1JDX1VSSVt0aGlzZXJyb3ItaW1wbC0y
LjAuMTkuc2hhMjU2c3VtXSA9ICI0M2NiZmUwY2Y3NjEwNGQ0MmE1NzQ4MDI4NDQxODdlODRhMzA1
ZTUzMWVkNTQ0NTVmMTFmYmRlMGYxMDU0MWNkIgorU1JDX1VSSVt0aGlzZXJyb3ItMi4wLjIwLnNo
YTI1NnN1bV0gPSAiZWM4NjIzNWY1ZmNjMmE3MzY1MDMxMDc1NmQyYWM1YjEzOGE1NzgwYmJiZGZh
ZTNlZWNjZWM5OTJjNDM1YmE0ZiIKK1NSQ19VUklbdGhpc2Vycm9yLWltcGwtMi4wLjIwLnNoYTI1
NnN1bV0gPSAiYmMwNGNkM2UxMjM2ZGQ0YTk4YWZjYTQ1NjlmMmRlYjNmMTIwZTU0MjJhNDAyM2Jl
MmNiNjgzZjg0ODYyOTJhZiIKIFNSQ19VUklbdGhyZWFkX2xvY2FsLTEuMS45LnNoYTI1NnN1bV0g
PSAiZjYwMjQ2YTQ5NDRmMjRmNmUwMThhYTE3Y2RlZmZiNzgxOGI3NjM1Njk2NWQwM2IwN2Q2YTk4
ODZlODk2MjE4NSIKIFNSQ19VUklbdGlueXN0ci0wLjguMi5zaGEyNTZzdW1dID0gIjQyZDNlOWM0
NWMwOWRlMTVkMDZkZDhhY2Y1ZjRlMGUzOTllODU5MjdiN2YwMDcxMTAyNGViN2FlMTBmYTQ4Njki
CiBTUkNfVVJJW3Rpbnl2ZWMtMS4xMS4wLnNoYTI1NnN1bV0gPSAiM2U2MWU2NzA1M2QyNWE0ZTgy
Yzg0NGU4NDI0MDM5ZDk3NDU3ODFiM2ZjNGYzMmI4ZDU1ZWQ1MGY1ZjY2N2VmMyIKQEAgLTU0OSw3
ICs1MzYsNiBAQCBTUkNfVVJJW3Rpbnl2ZWNfbWFjcm9zLTAuMS4xLnNoYTI1NnN1bV0gPSAiMWYz
Y2NiYWMzMTFmZWEwNWY4NmY2MTkwNGI0NjJiNTVmYjNkZgogU1JDX1VSSVt0b2tpby0xLjUzLjEu
c2hhMjU2c3VtXSA9ICIyMDJjYWVhODcxYjY5NjY4MjUwZDI0MjA3MDg0OWViNDk1YmUxNzhlZDY5
N2EzZTk4YWViY2U1YmM4MWEwYmVkIgogU1JDX1VSSVt0b2tpby1tYWNyb3MtMi43LjAuc2hhMjU2
c3VtXSA9ICIzODVhNmNiNzFhYjlhYjc5MGM1ZmU4ZDY3ZjE2NDVlNmM0NTBhN2NlMDA2YTMzZGUw
M2RhYTk1NmNmNzBhNDk2IgogU1JDX1VSSVt0b2tpby1zdHJlYW0tMC4xLjE5LnNoYTI1NnN1bV0g
PSAiYTNkMDZmMGIwODJiYTU3YzI2Yjc5NDA3MzcyZTU3Y2YyYTFlMjgxMjRmNzhlOTQ3OWZlODAz
MjJjZjUzNDIwYiIKLVNSQ19VUklbdG9raW8tdXRpbC0wLjcuMTkuc2hhMjU2c3VtXSA9ICI0OTQ4
MTVkMDliZjUyYjU1NDg2NTk4NTEwODEyMzhmMGNhMzlmZjYzODM2MzkwNzU5NmRhNzM5NTYxYzYy
YzUyIgogU1JDX1VSSVt0b21sLTEuMS4zK3NwZWMtMS4xLjAuc2hhMjU2c3VtXSA9ICI1M2M5NmVj
ZGZhOTQxYzhmYzRmY2FlZDE0Zjk5YWRhOGViZWQ1MDJlZWY1MzMwMTUwOTVhMDdlMzMwMWQ0YzNj
IgogU1JDX1VSSVt0b21sX2RhdGV0aW1lLTEuMS4xK3NwZWMtMS4xLjAuc2hhMjU2c3VtXSA9ICIz
MTY1ZjY1ZjYyZTI4ZTAxMTVhMDBiMmViZGQzN2ViNmYzYjY0MTg1NWY5ZDYzNmQzY2Q0MTAzNzY3
MTU5YWQ3IgogU1JDX1VSSVt0b21sX2VkaXQtMC4yNS4xMytzcGVjLTEuMS4wLnNoYTI1NnN1bV0g
PSAiNjk3NTM2N2U0ZDJlZjc2NmQ4NmFmMDFmZmFkMTRiNjIyZmVjYzhkNDM1N2E5OThmYmM0ZGVi
NmU5YmFjYWY5YiIKQEAgLTU2Niw3ICs1NTIsNiBAQCBTUkNfVVJJW3R5cGVpZC0xLjAuMy5zaGEy
NTZzdW1dID0gImJjN2Q2MjMyNTg2MDIzMjBkNWM1NWQxYmMyMjc5M2I1N2RhZmYwZWM3ZWZjMgog
U1JDX1VSSVt0eXBlbnVtLTEuMjAuMS5zaGEyNTZzdW1dID0gImI2ZjVlODcwYmU2YzNiMzcxYjc3
ZmUwZWUwYmFmYjg1OWZhNDk2NGI0NDA0YzI3ZGUxZDM4MDA0M2M0ZGRhMjAiCiBTUkNfVVJJW3Vj
ZC10cmllLTAuMS43LnNoYTI1NnN1bV0gPSAiMjg5NmQ5NWMwMmE4MGM2ZDZhNWQ2ZTk1M2Q0Nzlm
NWRkZjJkZmRiNmEyNDQ0NDEwMTBlMzczYWMwZmI4ODk3MSIKIFNSQ19VUklbdW5pY29kZS1pZGVu
dC0xLjAuMjQuc2hhMjU2c3VtXSA9ICJlNmU0MzEzY2Q1ZmNkM2RhZDVjYWZhMTc5NzAyZTJiMjQ0
Zjc2MDk5MWY0NTM5N2QxNGQ0ZWJmMzgyNDdkYTc1IgotU1JDX1VSSVt1bmljb2RlLWxpbmVicmVh
ay0wLjEuNS5zaGEyNTZzdW1dID0gIjNiMDljODNjM2MyOWQzNzUwNmEzZTI2MGMwOGMwMzc0M2E2
YmI2NmE5Y2Q0MzJjNjkzNGFiNTAxYTE5MDU3MWYiCiBTUkNfVVJJW3VuaWNvZGUtd2lkdGgtMC4y
LjIuc2hhMjU2c3VtXSA9ICJiNGFjMDQ4ZDcxZWRlN2VlNzZkNTg1NTE3YWRkNDVkYTUzMDY2MGVm
NDM5MGU0OWIwOTg3MzNjNmU4OTdmMjU0IgogU1JDX1VSSVt1bnNjYW5ueS0wLjEuMC5zaGEyNTZz
dW1dID0gImU5ZGYyYWYwNjdhNzk1M2U5YzM4MzEzMjBmMzVjMWNjMDYwMGMzMGQ0NGQ5ZjdhMTJi
MDFkYjFjZDg4ZDZiNDciCiBTUkNfVVJJW3VybC0yLjUuOC5zaGEyNTZzdW1dID0gImZmNjdhOGE0
Mzk3MzczYzNlZjY2MDgxMmFjYWIzMjY4MjIyMDM1MDEwYWI4NjgwZWM0MjE1ZjM4YmEzZDBlZWQi
CkBAIC01NzgsNyArNTYzLDYgQEAgU1JDX1VSSVt2ZXJzaW9uX2NoZWNrLTAuOS41LnNoYTI1NnN1
bV0gPSAiMGI5MjhmMzNkOTc1ZmM2YWQ5Zjg2YzhmMjgzODUzYWQyNmJkZDUKIFNSQ19VUklbdnRl
LTAuMTQuMS5zaGEyNTZzdW1dID0gIjIzMWZkY2Q3ZWYzMDM3ZTgzMzBkOGUxN2U2MTAxMWEyYzI0
NDEyNmFjYzBhOTgyZjQwNDBhYzNmOWYwYmMwNzciCiBTUkNfVVJJW3dhbGtkaXItMi41LjAuc2hh
MjU2c3VtXSA9ICIyOTc5MDk0NjQwNGY5MWQ5YzVkMDZmOTg3NGVmZGRlYTFkYzA2YzVlZmU5NDU0
MWE3ZDY4NjMxMDhlM2E1ZTRiIgogU1JDX1VSSVt3YXNpLTAuMTEuMSt3YXNpLXNuYXBzaG90LXBy
ZXZpZXcxLnNoYTI1NnN1bV0gPSAiY2NmM2VjNjUxYTg0N2ViMDFkZTczY2NhZDE1ZWI3ZDk5Zjgw
NDg1ZGUwNDNlZmIyZjM3MGNkNjU0ZjRlYTQ0YiIKLVNSQ19VUklbd2FzaXAyLTEuMC40K3dhc2kt
MC4yLjEyLnNoYTI1NnN1bV0gPSAiYjY3ZWZiMzdlMTA2ZTU1Y2U3MjJhNTEwZDZiNWY5YzE3ZjA4
M2U1ZmM3OWFmYzJiYWRlYjEyY2MzMTNkOTQ4NyIKIFNSQ19VUklbd2FzbS1iaW5kZ2VuLTAuMi4x
MTQuc2hhMjU2c3VtXSA9ICI2NTMyZjlhNWMxZWNlMzc5OGNiMWMyY2ZkYmE2NDBiOWIzYmE4ODRm
NWRiNDU5NzNhNmY0NDI1MTBhODdkMzhlIgogU1JDX1VSSVt3YXNtLWJpbmRnZW4tbWFjcm8tMC4y
LjExNC5zaGEyNTZzdW1dID0gIjE4YTJkNTBmY2YxMDVmYjMzYmIxNWYwMGU3YTc3Yjc3Mjk0NWEy
ZWU0NWRjZjQ1NDk2MWZkODQzZTc0YzE4ZTYiCiBTUkNfVVJJW3dhc20tYmluZGdlbi1tYWNyby1z
dXBwb3J0LTAuMi4xMTQuc2hhMjU2c3VtXSA9ICIwM2NlNGNhZWFhYzU0N2NkZjcxM2QyODBlZGEy
MmE3MzA4MjRkZDExZTZiOGMzY2E5ZTQyMjQ3YjI1YzYzMWUzIgpAQCAtNjE5LDkgKzYwMyw3IEBA
IFNSQ19VUklbd2luZG93c194ODZfNjRfbXN2Yy0wLjUyLjYuc2hhMjU2c3VtXSA9ICI1ODlmNmRh
ODRjNjQ2MjA0NzQ3ZDEyNzBhMmE1NjYxCiBTUkNfVVJJW3dpbmRvd3NfeDg2XzY0X21zdmMtMC41
My4xLnNoYTI1NnN1bV0gPSAiZDZiYmZmNWYwYWFkYTQyN2ExZTVhNmRhNWYxZjk4MTU4MTgyZjI2
NTU2ZjM0NWFjOWUwNGQzNmQwZWJlZDY1MCIKIFNSQ19VUklbd2lubm93LTEuMC4zLnNoYTI1NnN1
bV0gPSAiMDU5MmUxYzlkMTUxZjg1NGU2ZmQzODI1NzRjM2EwODU1MjUwZTFkOWIyZjk5ZDkyODFj
NmU2MzkxYWYzNTJmMSIKIFNSQ19VUklbd2lueC0wLjM2LjQuc2hhMjU2c3VtXSA9ICIzZjNmZDM3
NmY3MTk1OGI4NjJlN2FmYjIwY2ZlNWEyMjgzMGUxOTYzNDYyZjNhMTdmNDlkODJhNmMxZDFmNDJk
IgotU1JDX1VSSVt3aXQtYmluZGdlbi0wLjU3LjEuc2hhMjU2c3VtXSA9ICIxZWJmOTQ0ZTg3YTdj
MjUzMjMzYWQ2NzY2ZTA4MmUzY2Q3MTRiNWQwMzgxMmFjYzI0YzMxOGY1NDk2MTQ1MzZlIgogU1JD
X1VSSVt3cml0ZWFibGUtMC42LjIuc2hhMjU2c3VtXSA9ICI5ZWRkZTBkYjQ3NjlkMmRjNjg1Nzk4
OTNmMjMwNmIyNmM2ZWNmYmUwZWY0OTliMDEzZDczMWI3YjkyNDdlMGI5IgotU1JDX1VSSVt4YXR0
ci0xLjYuMS5zaGEyNTZzdW1dID0gIjMyZTQ1YWQ0MjA2ZjZkMjQ3OTA4NTE0N2YwMmJjMmVmODM0
YWM4NTg4NjYyNGEyMzU3NWFlMTM3YzhhYTgxNTYiCiBTUkNfVVJJW3lva2UtMC44LjEuc2hhMjU2
c3VtXSA9ICI3MmQ2ZTVjNmFmYjg0ZDczOTQ0ZTVjZWRiMDUyYzQ2ODBkNTY1NzMzNzIwMTU1NWY5
ZjJhMTZiNzQwNmQ0OTU0IgogU1JDX1VSSVt5b2tlLWRlcml2ZS0wLjguMS5zaGEyNTZzdW1dID0g
ImI2NTkwNTI4NzRlYjY5OGVmZTViOWU4Y2YzODIyMDQ2NzhhMDA4NmViZjQ2OTgyYjc5ZDZjYTMx
ODI5MjdlNWQiCiBTUkNfVVJJW3plcm9jb3B5LTAuOC41Ni5zaGEyNTZzdW1dID0gIjU1Njc2NGU1
ODNhZGI0NWE5ZjhkNDEzYzJhMTQ3ZmE3ZThkODIxZTQ4ZTEyYjE0ZmQ1NjBiNjA3OTk4Yjc1ZWIi
CmRpZmYgLS1naXQgYS9tZXRhL3JlY2lwZXMtZGV2dG9vbHMvcHl0aG9uL3B5dGhvbjMtdXYtYnVp
bGRfMC4xMi4xMy5iYiBiL21ldGEvcmVjaXBlcy1kZXZ0b29scy9weXRob24vcHl0aG9uMy11di1i
dWlsZF8wLjEyLjE4LmJiCnNpbWlsYXJpdHkgaW5kZXggOTIlCnJlbmFtZSBmcm9tIG1ldGEvcmVj
aXBlcy1kZXZ0b29scy9weXRob24vcHl0aG9uMy11di1idWlsZF8wLjEyLjEzLmJiCnJlbmFtZSB0
byBtZXRhL3JlY2lwZXMtZGV2dG9vbHMvcHl0aG9uL3B5dGhvbjMtdXYtYnVpbGRfMC4xMi4xOC5i
YgppbmRleCA1MWU4NWQ1YTg1Li5kMzljOTc0NDlkIDEwMDY0NAotLS0gYS9tZXRhL3JlY2lwZXMt
ZGV2dG9vbHMvcHl0aG9uL3B5dGhvbjMtdXYtYnVpbGRfMC4xMi4xMy5iYgorKysgYi9tZXRhL3Jl
Y2lwZXMtZGV2dG9vbHMvcHl0aG9uL3B5dGhvbjMtdXYtYnVpbGRfMC4xMi4xOC5iYgpAQCAtMTEs
NyArMTEsNyBAQCBMSUNfRklMRVNfQ0hLU1VNID0gImZpbGU6Ly9MSUNFTlNFLUFQQUNIRTttZDU9
ODZkM2YzYTk1YzMyNGM5NDc5YmQ4OTg2OTY4ZjQzMjcgXAogICAgICAgICAgICAgICAgICAgICBm
aWxlOi8vY3JhdGVzL3V2LXBlcDUwOC9MaWNlbnNlLUFwYWNoZTttZDU9ZTIzZmFkZDZjZWVmOGM2
MThmYzFjNjUxOTFkODQ2ZmEgXAogICAgICAgICAgICAgICAgICAgICBmaWxlOi8vY3JhdGVzL3V2
LXBlcDUwOC9MaWNlbnNlLUJTRDttZDU9ZWY3YTYwMjdkYzRjMjM4OWI5YWZhZDdlNjkwMjc0Yzci
CiAKLVNSQ19VUklbc2hhMjU2c3VtXSA9ICI0NjkzNmFiMjRjODY3NGJlMjhkZjI3ODRhOWNhMjg3
ODQ3OGE4NGE5OGU2Y2UzZGY1Y2I5NzYxMDJlOTliOGYxIgorU1JDX1VSSVtzaGEyNTZzdW1dID0g
ImNlYTJjZjA3MTE5ZjdmMWZmOWJlNjM5MTMzMGNkNTRmM2YzOTZkNTQxMmQyYWE4MjM0ZGQ4NTI3
ZDcxNjMyOGUiCiAKIHJlcXVpcmUgJHtCUE59LWNyYXRlcy5pbmMKIAotLSAKMi40Ny4xCgo=

--===============2991536531201223529==--

