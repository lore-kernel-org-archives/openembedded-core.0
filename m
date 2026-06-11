Return-Path: <auh@yoctoproject.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 08DFFCDB46D
	for <webhook@archiver.kernel.org>; Thu, 11 Jun 2026 16:31:55 +0000 (UTC)
Received: from a27-30.smtp-out.us-west-2.amazonses.com (a27-30.smtp-out.us-west-2.amazonses.com [54.240.27.30])
 by mx.groups.io with SMTP id smtpd.msgproc02-g2.50426.1781195507849530454
 for <openembedded-core@lists.openembedded.org>;
 Thu, 11 Jun 2026 09:31:49 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@yoctoproject.org header.s=lvjh2tk576v2ro5mi6k4dt3mc6wpqbky header.b=E+BMXFKe;
 dkim=pass header.i=@amazonses.com header.s=hsbnp7p3ensaochzwyq5wwmceodymuwv header.b=gxENbGyN;
 spf=pass (domain: us-west-2.amazonses.com, ip: 54.240.27.30, mailfrom: 0101019eb7868ae8-98eddb2c-4b9a-4842-acc9-f7920ae9eeb7-000000@us-west-2.amazonses.com)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/simple;
	s=lvjh2tk576v2ro5mi6k4dt3mc6wpqbky; d=yoctoproject.org;
	t=1781195508;
	h=Content-Type:MIME-Version:From:To:Cc:Subject:Message-Id:Date;
	bh=KTfgs4XRTwaX76tKwk0BB9LTzNcW6GxNWjt5JTSNw44=;
	b=E+BMXFKeailvvKNI8+3PYnB1z2Ow/iS2sD5bUxm7r6d0XbYKiTO1kVCJDkHlSjCO
	T2nZJxLXgahEugbMKd4opOVOg90/GaQ8SSufGzl4pEDA21rml2a3PmcyKbsPIugWhw+
	76NtCwSmA1Ghty7FIDHBrfeXrk5rqwAZMWOh78sM=
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/simple;
	s=hsbnp7p3ensaochzwyq5wwmceodymuwv; d=amazonses.com; t=1781195508;
	h=Content-Type:MIME-Version:From:To:Cc:Subject:Message-Id:Date:Feedback-ID;
	bh=KTfgs4XRTwaX76tKwk0BB9LTzNcW6GxNWjt5JTSNw44=;
	b=gxENbGyNB3lvUy8utl7r+NuECm24zncSjLRVR90LrZC6uZWNbVEUSnynm1RIYBwL
	FNkrsEahSnVVpioCml8XujDoU7zVtnw3zEdWSL+l0PM7p49WWE0aTonJ+xqOpeO8pj2
	jPtoE0i/bV8p+b0rEiTGbC5BT2GUOOYx2zHPCWSQ=
Content-Type: multipart/mixed; boundary="===============6628009220276699985=="
MIME-Version: 1.0
From: auh@yoctoproject.org
To: Trevor Gamblin <tgamblin@baylibre.com>
Cc: openembedded-core@lists.openembedded.org
Subject: [AUH] python3-uv-build: upgrading to 0.11.20 SUCCEEDED
Message-ID: <0101019eb7868ae8-98eddb2c-4b9a-4842-acc9-f7920ae9eeb7-000000@us-west-2.amazonses.com>
Date: Thu, 11 Jun 2026 16:31:48 +0000
Feedback-ID: ::1.us-west-2.9np3MYPs3fEaOBysGKSlUD4KtcmPijcmS9Az2Hwf7iQ=:AmazonSES
X-SES-Outgoing: 2026.06.11-54.240.27.30
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Thu, 11 Jun 2026 16:31:55 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/238505

--===============6628009220276699985==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit

Hello,

this email is a notification from the Auto Upgrade Helper
that the automatic attempt to upgrade the recipe(s) *python3-uv-build* to *0.11.20* has Succeeded.

Next steps:
    - apply the patch: git am 0001-python3-uv-build-upgrade-0.11.17-0.11.20.patch
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
From 3828578855359c305cfd3f01e4112eec911e3d95 Mon Sep 17 00:00:00 2001
From: Upgrade Helper <auh@yoctoproject.org>
Date: Thu, 11 Jun 2026 10:25:31 +0000
Subject: [PATCH] python3-uv-build: upgrade 0.11.17 -> 0.11.20

---
 .../python/python3-uv-build-crates.inc        | 60 +++++++------------
 ...0.11.17.bb => python3-uv-build_0.11.20.bb} |  2 +-
 2 files changed, 21 insertions(+), 41 deletions(-)
 rename meta/recipes-devtools/python/{python3-uv-build_0.11.17.bb => python3-uv-build_0.11.20.bb} (92%)

diff --git a/meta/recipes-devtools/python/python3-uv-build-crates.inc b/meta/recipes-devtools/python/python3-uv-build-crates.inc
index 6c4d4ac473..be20115668 100644
--- a/meta/recipes-devtools/python/python3-uv-build-crates.inc
+++ b/meta/recipes-devtools/python/python3-uv-build-crates.inc
@@ -15,7 +15,7 @@ SRC_URI += " \
     crate://crates.io/arrayvec/0.7.6 \
     crate://crates.io/astral-tokio-tar/0.6.2 \
     crate://crates.io/astral-version-ranges/0.1.4 \
-    crate://crates.io/astral_async_zip/0.0.18-rc4 \
+    crate://crates.io/astral_async_zip/0.0.18 \
     crate://crates.io/async-compression/0.4.19 \
     crate://crates.io/autocfg/1.5.0 \
     crate://crates.io/backon/1.6.0 \
@@ -49,7 +49,7 @@ SRC_URI += " \
     crate://crates.io/displaydoc/0.2.5 \
     crate://crates.io/dunce/1.0.5 \
     crate://crates.io/dyn-clone/1.0.20 \
-    crate://crates.io/either/1.15.0 \
+    crate://crates.io/either/1.16.0 \
     crate://crates.io/encode_unicode/1.0.0 \
     crate://crates.io/encoding_rs/0.8.35 \
     crate://crates.io/encoding_rs_io/0.1.7 \
@@ -102,8 +102,8 @@ SRC_URI += " \
     crate://crates.io/is_terminal_polyfill/1.70.2 \
     crate://crates.io/itertools/0.14.0 \
     crate://crates.io/itoa/1.0.17 \
-    crate://crates.io/jiff/0.2.24 \
-    crate://crates.io/jiff-static/0.2.24 \
+    crate://crates.io/jiff/0.2.28 \
+    crate://crates.io/jiff-static/0.2.28 \
     crate://crates.io/jiff-tzdb/0.1.6 \
     crate://crates.io/jiff-tzdb-platform/0.1.3 \
     crate://crates.io/jobserver/0.1.34 \
@@ -111,7 +111,7 @@ SRC_URI += " \
     crate://crates.io/junction/2.0.0 \
     crate://crates.io/lazy_static/1.5.0 \
     crate://crates.io/leb128fmt/0.1.0 \
-    crate://crates.io/libc/0.2.183 \
+    crate://crates.io/libc/0.2.186 \
     crate://crates.io/linux-raw-sys/0.12.1 \
     crate://crates.io/litemap/0.8.1 \
     crate://crates.io/lock_api/0.4.14 \
@@ -119,7 +119,7 @@ SRC_URI += " \
     crate://crates.io/lzma-sys/0.1.20 \
     crate://crates.io/mailparse/0.16.1 \
     crate://crates.io/matchers/0.2.0 \
-    crate://crates.io/memchr/2.8.0 \
+    crate://crates.io/memchr/2.8.1 \
     crate://crates.io/miniz_oxide/0.8.9 \
     crate://crates.io/mio/1.2.0 \
     crate://crates.io/munge/0.4.7 \
@@ -179,7 +179,7 @@ SRC_URI += " \
     crate://crates.io/serde_core/1.0.228 \
     crate://crates.io/serde_derive/1.0.228 \
     crate://crates.io/serde_derive_internals/0.29.1 \
-    crate://crates.io/serde_json/1.0.149 \
+    crate://crates.io/serde_json/1.0.150 \
     crate://crates.io/serde_spanned/1.1.1 \
     crate://crates.io/sha2/0.10.9 \
     crate://crates.io/sharded-slab/0.1.7 \
@@ -198,7 +198,7 @@ SRC_URI += " \
     crate://crates.io/synstructure/0.13.2 \
     crate://crates.io/temp-env/0.3.6 \
     crate://crates.io/tempfile/3.27.0 \
-    crate://crates.io/terminal_size/0.4.3 \
+    crate://crates.io/terminal_size/0.4.4 \
     crate://crates.io/textwrap/0.16.2 \
     crate://crates.io/thiserror/2.0.18 \
     crate://crates.io/thiserror-impl/2.0.18 \
@@ -212,7 +212,7 @@ SRC_URI += " \
     crate://crates.io/tokio-util/0.7.18 \
     crate://crates.io/toml/1.1.2+spec-1.1.0 \
     crate://crates.io/toml_datetime/1.1.1+spec-1.1.0 \
-    crate://crates.io/toml_edit/0.25.11+spec-1.1.0 \
+    crate://crates.io/toml_edit/0.25.12+spec-1.1.0 \
     crate://crates.io/toml_parser/1.1.2+spec-1.1.0 \
     crate://crates.io/toml_writer/1.1.1+spec-1.1.0 \
     crate://crates.io/tracing/0.1.44 \
@@ -233,7 +233,7 @@ SRC_URI += " \
     crate://crates.io/url/2.5.8 \
     crate://crates.io/utf8_iter/1.0.4 \
     crate://crates.io/utf8parse/0.2.2 \
-    crate://crates.io/uuid/1.23.1 \
+    crate://crates.io/uuid/1.23.2 \
     crate://crates.io/valuable/0.1.1 \
     crate://crates.io/version_check/0.9.5 \
     crate://crates.io/walkdir/2.5.0 \
@@ -261,27 +261,17 @@ SRC_URI += " \
     crate://crates.io/windows-result/0.3.4 \
     crate://crates.io/windows-strings/0.4.2 \
     crate://crates.io/windows-sys/0.52.0 \
-    crate://crates.io/windows-sys/0.60.2 \
     crate://crates.io/windows-sys/0.61.2 \
     crate://crates.io/windows-targets/0.52.6 \
-    crate://crates.io/windows-targets/0.53.5 \
     crate://crates.io/windows-threading/0.1.0 \
     crate://crates.io/windows_aarch64_gnullvm/0.52.6 \
-    crate://crates.io/windows_aarch64_gnullvm/0.53.1 \
     crate://crates.io/windows_aarch64_msvc/0.52.6 \
-    crate://crates.io/windows_aarch64_msvc/0.53.1 \
     crate://crates.io/windows_i686_gnu/0.52.6 \
-    crate://crates.io/windows_i686_gnu/0.53.1 \
     crate://crates.io/windows_i686_gnullvm/0.52.6 \
-    crate://crates.io/windows_i686_gnullvm/0.53.1 \
     crate://crates.io/windows_i686_msvc/0.52.6 \
-    crate://crates.io/windows_i686_msvc/0.53.1 \
     crate://crates.io/windows_x86_64_gnu/0.52.6 \
-    crate://crates.io/windows_x86_64_gnu/0.53.1 \
     crate://crates.io/windows_x86_64_gnullvm/0.52.6 \
-    crate://crates.io/windows_x86_64_gnullvm/0.53.1 \
     crate://crates.io/windows_x86_64_msvc/0.52.6 \
-    crate://crates.io/windows_x86_64_msvc/0.53.1 \
     crate://crates.io/winnow/1.0.3 \
     crate://crates.io/wit-bindgen/0.51.0 \
     crate://crates.io/wit-bindgen-core/0.51.0 \
@@ -319,7 +309,7 @@ SRC_URI[arcstr-1.2.0.sha256sum] = "03918c3dbd7701a85c6b9887732e2921175f26c350b45
 SRC_URI[arrayvec-0.7.6.sha256sum] = "7c02d123df017efcdfbd739ef81735b36c5ba83ec3c59c80a9d7ecc718f92e50"
 SRC_URI[astral-tokio-tar-0.6.2.sha256sum] = "cb50a7aae84a03bf55b067832bc376f4961b790c97e64d3eacee97d389b90277"
 SRC_URI[astral-version-ranges-0.1.4.sha256sum] = "31979bc305610246d78ac01d63467a12d8454c6e3b8b22b5811d343a1198dfbb"
-SRC_URI[astral_async_zip-0.0.18-rc4.sha256sum] = "9d523231a4339307c7699aa5d9492fe6873906afefc9d7853b5e7ffbfee3c7f1"
+SRC_URI[astral_async_zip-0.0.18.sha256sum] = "c15fc5b591f19dfbbbce736615908d74f1d9252bb34b231873cb995f2a997ffb"
 SRC_URI[async-compression-0.4.19.sha256sum] = "06575e6a9673580f52661c92107baabffbf41e2141373441cbcdc47cb733003c"
 SRC_URI[autocfg-1.5.0.sha256sum] = "c08606f8c3cbf4ce6ec8e28fb0014a2c086708fe954eaa885384a6165172e7e8"
 SRC_URI[backon-1.6.0.sha256sum] = "cffb0e931875b666fc4fcb20fee52e9bbd1ef836fd9e9e04ec21555f9f85f7ef"
@@ -353,7 +343,7 @@ SRC_URI[digest-0.10.7.sha256sum] = "9ed9a281f7bc9b7576e61468ba615a66a5c8cfdff424
 SRC_URI[displaydoc-0.2.5.sha256sum] = "97369cbbc041bc366949bc74d34658d6cda5621039731c6310521892a3a20ae0"
 SRC_URI[dunce-1.0.5.sha256sum] = "92773504d58c093f6de2459af4af33faa518c13451eb8f2b5698ed3d36e7c813"
 SRC_URI[dyn-clone-1.0.20.sha256sum] = "d0881ea181b1df73ff77ffaaf9c7544ecc11e82fba9b5f27b262a3c73a332555"
-SRC_URI[either-1.15.0.sha256sum] = "48c757948c5ede0e46177b7add2e67155f70e33c07fea8284df6576da70b3719"
+SRC_URI[either-1.16.0.sha256sum] = "91622ff5e7162018101f2fea40d6ebf4a78bbe5a49736a2020649edf9693679e"
 SRC_URI[encode_unicode-1.0.0.sha256sum] = "34aa73646ffb006b8f5147f3dc182bd4bcb190227ce861fc4a4844bf8e3cb2c0"
 SRC_URI[encoding_rs-0.8.35.sha256sum] = "75030f3c4f45dafd7586dd6780965a8c7e8e285a5ecb86713e63a79c5b2766f3"
 SRC_URI[encoding_rs_io-0.1.7.sha256sum] = "1cc3c5651fb62ab8aa3103998dade57efdd028544bd300516baa31840c252a83"
@@ -406,8 +396,8 @@ SRC_URI[insta-1.47.2.sha256sum] = "7b4a6248eb93a4401ed2f37dfe8ea592d3cf05b7cf4f8
 SRC_URI[is_terminal_polyfill-1.70.2.sha256sum] = "a6cb138bb79a146c1bd460005623e142ef0181e3d0219cb493e02f7d08a35695"
 SRC_URI[itertools-0.14.0.sha256sum] = "2b192c782037fadd9cfa75548310488aabdbf3d2da73885b31bd0abd03351285"
 SRC_URI[itoa-1.0.17.sha256sum] = "92ecc6618181def0457392ccd0ee51198e065e016d1d527a7ac1b6dc7c1f09d2"
-SRC_URI[jiff-0.2.24.sha256sum] = "f00b5dbd620d61dfdcb6007c9c1f6054ebd75319f163d886a9055cec1155073d"
-SRC_URI[jiff-static-0.2.24.sha256sum] = "e000de030ff8022ea1da3f466fbb0f3a809f5e51ed31f6dd931c35181ad8e6d7"
+SRC_URI[jiff-0.2.28.sha256sum] = "4603d3033e49e2b0e31229fcab20a5d40089c607d975cd9c80551dc69eed9102"
+SRC_URI[jiff-static-0.2.28.sha256sum] = "782d32378dddf207193ac91cefb848ad41abb58195c95168e1291227a0832b47"
 SRC_URI[jiff-tzdb-0.1.6.sha256sum] = "c900ef84826f1338a557697dc8fc601df9ca9af4ac137c7fb61d4c6f2dfd3076"
 SRC_URI[jiff-tzdb-platform-0.1.3.sha256sum] = "875a5a69ac2bab1a891711cf5eccbec1ce0341ea805560dcd90b7a2e925132e8"
 SRC_URI[jobserver-0.1.34.sha256sum] = "9afb3de4395d6b3e67a780b6de64b51c978ecf11cb9a462c66be7d4ca9039d33"
@@ -415,7 +405,7 @@ SRC_URI[js-sys-0.3.91.sha256sum] = "b49715b7073f385ba4bc528e5747d02e66cb39c6146e
 SRC_URI[junction-2.0.0.sha256sum] = "160f2eade097f30263b548aae5deb12ad349c909baa710fa24b92c9090b2e006"
 SRC_URI[lazy_static-1.5.0.sha256sum] = "bbd2bcb4c963f2ddae06a2efc7e9f3591312473c50c6685e1f298068316e66fe"
 SRC_URI[leb128fmt-0.1.0.sha256sum] = "09edd9e8b54e49e587e4f6295a7d29c3ea94d469cb40ab8ca70b288248a81db2"
-SRC_URI[libc-0.2.183.sha256sum] = "b5b646652bf6661599e1da8901b3b9522896f01e736bad5f723fe7a3a27f899d"
+SRC_URI[libc-0.2.186.sha256sum] = "68ab91017fe16c622486840e4c83c9a37afeff978bd239b5293d61ece587de66"
 SRC_URI[linux-raw-sys-0.12.1.sha256sum] = "32a66949e030da00e8c7d4434b251670a91556f4144941d37452769c25d58a53"
 SRC_URI[litemap-0.8.1.sha256sum] = "6373607a59f0be73a39b6fe456b8192fcc3585f602af20751600e974dd455e77"
 SRC_URI[lock_api-0.4.14.sha256sum] = "224399e74b87b5f3557511d98dff8b14089b3dadafcab6bb93eab67d3aace965"
@@ -423,7 +413,7 @@ SRC_URI[log-0.4.29.sha256sum] = "5e5032e24019045c762d3c0f28f5b6b8bbf38563a659083
 SRC_URI[lzma-sys-0.1.20.sha256sum] = "5fda04ab3764e6cde78b9974eec4f779acaba7c4e84b36eca3cf77c581b85d27"
 SRC_URI[mailparse-0.16.1.sha256sum] = "60819a97ddcb831a5614eb3b0174f3620e793e97e09195a395bfa948fd68ed2f"
 SRC_URI[matchers-0.2.0.sha256sum] = "d1525a2a28c7f4fa0fc98bb91ae755d1e2d1505079e05539e35bc876b5d65ae9"
-SRC_URI[memchr-2.8.0.sha256sum] = "f8ca58f447f06ed17d5fc4043ce1b10dd205e060fb3ce5b979b8ed8e59ff3f79"
+SRC_URI[memchr-2.8.1.sha256sum] = "6b947ae49db0d222b1dbc6b113ce7248a3fc3a6ca21b696717bfc000ba4484d8"
 SRC_URI[miniz_oxide-0.8.9.sha256sum] = "1fa76a2c86f704bdb222d66965fb3d63269ce38518b83cb0575fca855ebb6316"
 SRC_URI[mio-1.2.0.sha256sum] = "50b7e5b27aa02a74bac8c3f23f448f8d87ff11f92d3aac1a6ed369ee08cc56c1"
 SRC_URI[munge-0.4.7.sha256sum] = "5e17401f259eba956ca16491461b6e8f72913a0a114e39736ce404410f915a0c"
@@ -483,7 +473,7 @@ SRC_URI[serde-untagged-0.1.9.sha256sum] = "f9faf48a4a2d2693be24c6289dbe26552776e
 SRC_URI[serde_core-1.0.228.sha256sum] = "41d385c7d4ca58e59fc732af25c3983b67ac852c1a25000afe1175de458b67ad"
 SRC_URI[serde_derive-1.0.228.sha256sum] = "d540f220d3187173da220f885ab66608367b6574e925011a9353e4badda91d79"
 SRC_URI[serde_derive_internals-0.29.1.sha256sum] = "18d26a20a969b9e3fdf2fc2d9f21eda6c40e2de84c9408bb5d3b05d499aae711"
-SRC_URI[serde_json-1.0.149.sha256sum] = "83fc039473c5595ace860d8c4fafa220ff474b3fc6bfdb4293327f1a37e94d86"
+SRC_URI[serde_json-1.0.150.sha256sum] = "e8014e44b4736ed0538adeecded0fce2a272f22dc9578a7eb6b2d9993c74cfb9"
 SRC_URI[serde_spanned-1.1.1.sha256sum] = "6662b5879511e06e8999a8a235d848113e942c9124f211511b16466ee2995f26"
 SRC_URI[sha2-0.10.9.sha256sum] = "a7507d819769d01a365ab707794a4084392c824f54a7a6a7862f8c3d0892b283"
 SRC_URI[sharded-slab-0.1.7.sha256sum] = "f40ca3c46823713e0d4209592e8d6e826aa57e928f09752619fc696c499637f6"
@@ -502,7 +492,7 @@ SRC_URI[syn-2.0.117.sha256sum] = "e665b8803e7b1d2a727f4023456bbbbe74da67099c5852
 SRC_URI[synstructure-0.13.2.sha256sum] = "728a70f3dbaf5bab7f0c4b1ac8d7ae5ea60a4b5549c8a5914361c99147a709d2"
 SRC_URI[temp-env-0.3.6.sha256sum] = "96374855068f47402c3121c6eed88d29cb1de8f3ab27090e273e420bdabcf050"
 SRC_URI[tempfile-3.27.0.sha256sum] = "32497e9a4c7b38532efcdebeef879707aa9f794296a4f0244f6f69e9bc8574bd"
-SRC_URI[terminal_size-0.4.3.sha256sum] = "60b8cb979cb11c32ce1603f8137b22262a9d131aaa5c37b5678025f22b8becd0"
+SRC_URI[terminal_size-0.4.4.sha256sum] = "230a1b821ccbd75b185820a1f1ff7b14d21da1e442e22c0863ea5f08771a8874"
 SRC_URI[textwrap-0.16.2.sha256sum] = "c13547615a44dc9c452a8a534638acdf07120d4b6847c8178705da06306a3057"
 SRC_URI[thiserror-2.0.18.sha256sum] = "4288b5bcbc7920c07a1149a35cf9590a2aa808e0bc1eafaade0b80947865fbc4"
 SRC_URI[thiserror-impl-2.0.18.sha256sum] = "ebc4ee7f67670e9b64d05fa4253e753e016c6c95ff35b89b7941d6b856dec1d5"
@@ -516,7 +506,7 @@ SRC_URI[tokio-stream-0.1.18.sha256sum] = "32da49809aab5c3bc678af03902d4ccddea2a8
 SRC_URI[tokio-util-0.7.18.sha256sum] = "9ae9cec805b01e8fc3fd2fe289f89149a9b66dd16786abd8b19cfa7b48cb0098"
 SRC_URI[toml-1.1.2+spec-1.1.0.sha256sum] = "81f3d15e84cbcd896376e6730314d59fb5a87f31e4b038454184435cd57defee"
 SRC_URI[toml_datetime-1.1.1+spec-1.1.0.sha256sum] = "3165f65f62e28e0115a00b2ebdd37eb6f3b641855f9d636d3cd4103767159ad7"
-SRC_URI[toml_edit-0.25.11+spec-1.1.0.sha256sum] = "0b59c4d22ed448339746c59b905d24568fcbb3ab65a500494f7b8c3e97739f2b"
+SRC_URI[toml_edit-0.25.12+spec-1.1.0.sha256sum] = "d2153edc6955a6c354fad8f5efd38b6a8769bdccf9fe50f8e1329f81b0baa5d7"
 SRC_URI[toml_parser-1.1.2+spec-1.1.0.sha256sum] = "a2abe9b86193656635d2411dc43050282ca48aa31c2451210f4202550afb7526"
 SRC_URI[toml_writer-1.1.1+spec-1.1.0.sha256sum] = "756daf9b1013ebe47a8776667b466417e2d4c5679d441c26230efd9ef78692db"
 SRC_URI[tracing-0.1.44.sha256sum] = "63e71662fa4b2a2c3a26f570f037eb95bb1f85397f3cd8076caed2f026a6d100"
@@ -537,7 +527,7 @@ SRC_URI[unscanny-0.1.0.sha256sum] = "e9df2af067a7953e9c3831320f35c1cc0600c30d44d
 SRC_URI[url-2.5.8.sha256sum] = "ff67a8a4397373c3ef660812acab3268222035010ab8680ec4215f38ba3d0eed"
 SRC_URI[utf8_iter-1.0.4.sha256sum] = "b6c140620e7ffbb22c2dee59cafe6084a59b5ffc27a8859a5f0d494b5d52b6be"
 SRC_URI[utf8parse-0.2.2.sha256sum] = "06abde3611657adf66d383f00b093d7faecc7fa57071cce2578660c9f1010821"
-SRC_URI[uuid-1.23.1.sha256sum] = "ddd74a9687298c6858e9b88ec8935ec45d22e8fd5e6394fa1bd4e99a87789c76"
+SRC_URI[uuid-1.23.2.sha256sum] = "d258b83ceec21034727ecee8c382cfa6c3e133699b0742c64571814fb420c9f7"
 SRC_URI[valuable-0.1.1.sha256sum] = "ba73ea9cf16a25df0c8caa16c51acb937d5712a8429db78a3ee29d5dcacd3a65"
 SRC_URI[version_check-0.9.5.sha256sum] = "0b928f33d975fc6ad9f86c8f283853ad26bdd5b10b7f1542aa2fa15e2289105a"
 SRC_URI[walkdir-2.5.0.sha256sum] = "29790946404f91d9c5d06f9874efddea1dc06c5efe94541a7d6863108e3a5e4b"
@@ -565,27 +555,17 @@ SRC_URI[windows-numerics-0.2.0.sha256sum] = "9150af68066c4c5c07ddc0ce30421554771
 SRC_URI[windows-result-0.3.4.sha256sum] = "56f42bd332cc6c8eac5af113fc0c1fd6a8fd2aa08a0119358686e5160d0586c6"
 SRC_URI[windows-strings-0.4.2.sha256sum] = "56e6c93f3a0c3b36176cb1327a4958a0353d5d166c2a35cb268ace15e91d3b57"
 SRC_URI[windows-sys-0.52.0.sha256sum] = "282be5f36a8ce781fad8c8ae18fa3f9beff57ec1b52cb3de0789201425d9a33d"
-SRC_URI[windows-sys-0.60.2.sha256sum] = "f2f500e4d28234f72040990ec9d39e3a6b950f9f22d3dba18416c35882612bcb"
 SRC_URI[windows-sys-0.61.2.sha256sum] = "ae137229bcbd6cdf0f7b80a31df61766145077ddf49416a728b02cb3921ff3fc"
 SRC_URI[windows-targets-0.52.6.sha256sum] = "9b724f72796e036ab90c1021d4780d4d3d648aca59e491e6b98e725b84e99973"
-SRC_URI[windows-targets-0.53.5.sha256sum] = "4945f9f551b88e0d65f3db0bc25c33b8acea4d9e41163edf90dcd0b19f9069f3"
 SRC_URI[windows-threading-0.1.0.sha256sum] = "b66463ad2e0ea3bbf808b7f1d371311c80e115c0b71d60efc142cafbcfb057a6"
 SRC_URI[windows_aarch64_gnullvm-0.52.6.sha256sum] = "32a4622180e7a0ec044bb555404c800bc9fd9ec262ec147edd5989ccd0c02cd3"
-SRC_URI[windows_aarch64_gnullvm-0.53.1.sha256sum] = "a9d8416fa8b42f5c947f8482c43e7d89e73a173cead56d044f6a56104a6d1b53"
 SRC_URI[windows_aarch64_msvc-0.52.6.sha256sum] = "09ec2a7bb152e2252b53fa7803150007879548bc709c039df7627cabbd05d469"
-SRC_URI[windows_aarch64_msvc-0.53.1.sha256sum] = "b9d782e804c2f632e395708e99a94275910eb9100b2114651e04744e9b125006"
 SRC_URI[windows_i686_gnu-0.52.6.sha256sum] = "8e9b5ad5ab802e97eb8e295ac6720e509ee4c243f69d781394014ebfe8bbfa0b"
-SRC_URI[windows_i686_gnu-0.53.1.sha256sum] = "960e6da069d81e09becb0ca57a65220ddff016ff2d6af6a223cf372a506593a3"
 SRC_URI[windows_i686_gnullvm-0.52.6.sha256sum] = "0eee52d38c090b3caa76c563b86c3a4bd71ef1a819287c19d586d7334ae8ed66"
-SRC_URI[windows_i686_gnullvm-0.53.1.sha256sum] = "fa7359d10048f68ab8b09fa71c3daccfb0e9b559aed648a8f95469c27057180c"
 SRC_URI[windows_i686_msvc-0.52.6.sha256sum] = "240948bc05c5e7c6dabba28bf89d89ffce3e303022809e73deaefe4f6ec56c66"
-SRC_URI[windows_i686_msvc-0.53.1.sha256sum] = "1e7ac75179f18232fe9c285163565a57ef8d3c89254a30685b57d83a38d326c2"
 SRC_URI[windows_x86_64_gnu-0.52.6.sha256sum] = "147a5c80aabfbf0c7d901cb5895d1de30ef2907eb21fbbab29ca94c5b08b1a78"
-SRC_URI[windows_x86_64_gnu-0.53.1.sha256sum] = "9c3842cdd74a865a8066ab39c8a7a473c0778a3f29370b5fd6b4b9aa7df4a499"
 SRC_URI[windows_x86_64_gnullvm-0.52.6.sha256sum] = "24d5b23dc417412679681396f2b49f3de8c1473deb516bd34410872eff51ed0d"
-SRC_URI[windows_x86_64_gnullvm-0.53.1.sha256sum] = "0ffa179e2d07eee8ad8f57493436566c7cc30ac536a3379fdf008f47f6bb7ae1"
 SRC_URI[windows_x86_64_msvc-0.52.6.sha256sum] = "589f6da84c646204747d1270a2a5661ea66ed1cced2631d546fdfb155959f9ec"
-SRC_URI[windows_x86_64_msvc-0.53.1.sha256sum] = "d6bbff5f0aada427a1e5a6da5f1f98158182f26556f345ac9e04d36d0ebed650"
 SRC_URI[winnow-1.0.3.sha256sum] = "0592e1c9d151f854e6fd382574c3a0855250e1d9b2f99d9281c6e6391af352f1"
 SRC_URI[wit-bindgen-0.51.0.sha256sum] = "d7249219f66ced02969388cf2bb044a09756a083d0fab1e566056b04d9fbcaa5"
 SRC_URI[wit-bindgen-core-0.51.0.sha256sum] = "ea61de684c3ea68cb082b7a88508a8b27fcc8b797d738bfc99a82facf1d752dc"
diff --git a/meta/recipes-devtools/python/python3-uv-build_0.11.17.bb b/meta/recipes-devtools/python/python3-uv-build_0.11.20.bb
similarity index 92%
rename from meta/recipes-devtools/python/python3-uv-build_0.11.17.bb
rename to meta/recipes-devtools/python/python3-uv-build_0.11.20.bb
index 4241f66586..a3cd4fe5e9 100644
--- a/meta/recipes-devtools/python/python3-uv-build_0.11.17.bb
+++ b/meta/recipes-devtools/python/python3-uv-build_0.11.20.bb
@@ -11,7 +11,7 @@ LIC_FILES_CHKSUM = "file://LICENSE-APACHE;md5=86d3f3a95c324c9479bd8986968f4327 \
                     file://crates/uv-pep508/License-Apache;md5=e23fadd6ceef8c618fc1c65191d846fa \
                     file://crates/uv-pep508/License-BSD;md5=ef7a6027dc4c2389b9afad7e690274c7"
 
-SRC_URI[sha256sum] = "98fd71027ba123126ef586b681efece5f6e71b05c3ea58c27866853bba1966b9"
+SRC_URI[sha256sum] = "111bee2cf5de314d43c60dd1af364c6268e73b32d8f6ac1e941242ff56086366"
 
 require ${BPN}-crates.inc
 
-- 
2.47.1


--===============6628009220276699985==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: attachment; filename="buildhistory-diff-full.txt"

packages/x86-64-v3-poky-linux/python3-uv-build: PKGV changed from 0.11.17 [default] to 0.11.20 [default]
packages/x86-64-v3-poky-linux/python3-uv-build: PV changed from "0.11.17" to "0.11.20"
packages/x86-64-v3-poky-linux/python3-uv-build: SRC_URI changed from "https://files.pythonhosted.org/packages/source/u/uv_build/uv_build-0.11.17.tar.gz;downloadfilename=uv_build-0.11.17.tar.gz crate://crates.io/adler2/2.0.1 crate://crates.io/aho-corasick/1.1.4 crate://crates.io/allocator-api2/0.2.21 crate://crates.io/anstream/1.0.0 crate://crates.io/anstyle/1.0.14 crate://crates.io/anstyle-parse/1.0.0 crate://crates.io/anstyle-query/1.1.5 crate://crates.io/anstyle-wincon/3.0.11 crate://crates.io/anyhow/1.0.102 crate://crates.io/arcstr/1.2.0 crate://crates.io/arrayvec/0.7.6 crate://crates.io/astral-tokio-tar/0.6.2 crate://crates.io/astral-version-ranges/0.1.4 crate://crates.io/astral_async_zip/0.0.18-rc4 crate://crates.io/async-compression/0.4.19 crate://crates.io/autocfg/1.5.0 crate://crates.io/backon/1.6.0 crate://crates.io/base64/0.22.1 crate://crates.io/bitflags/2.11.1 crate://crates.io/block-buffer/0.10.4 crate://crates.io/boxcar/0.2.14 crate://crates.io/bstr/1.12.1 crate://crate
 s.io/bumpalo/3.20.2 crate://crates.io/bytecheck/0.8.2 crate://crates.io/bytecheck_derive/0.8.2 crate://crates.io/bytes/1.11.1 crate://crates.io/bzip2/0.5.2 crate://crates.io/bzip2-sys/0.1.13+1.0.8 crate://crates.io/cc/1.2.57 crate://crates.io/cfg-if/1.0.4 crate://crates.io/charset/0.1.5 crate://crates.io/clap/4.6.1 crate://crates.io/clap_builder/4.6.0 crate://crates.io/clap_derive/4.6.1 crate://crates.io/clap_lex/1.1.0 crate://crates.io/colorchoice/1.0.5 crate://crates.io/console/0.16.3 crate://crates.io/cpufeatures/0.2.17 crate://crates.io/crc32fast/1.5.0 crate://crates.io/crypto-common/0.1.7 crate://crates.io/csv/1.4.0 crate://crates.io/csv-core/0.1.13 crate://crates.io/data-encoding/2.11.0 crate://crates.io/digest/0.10.7 crate://crates.io/displaydoc/0.2.5 crate://crates.io/dunce/1.0.5 crate://crates.io/dyn-clone/1.0.20 crate://crates.io/either/1.15.0 crate://crates.io/encode_unicode/1.0.0 crate://crates.io/encoding_rs/0.8.35 crate://crates.io/encoding_rs_io/0.1.7 crate://crates.i
 o/enumflags2/0.7.12 crate://crates.io/enumflags2_derive/0.7.12 crate://crates.io/equivalent/1.0.2 crate://crates.io/erased-serde/0.4.10 crate://crates.io/errno/0.3.14 crate://crates.io/fastrand/2.4.1 crate://crates.io/filetime/0.2.29 crate://crates.io/find-msvc-tools/0.1.9 crate://crates.io/fixedbitset/0.5.7 crate://crates.io/flate2/1.1.9 crate://crates.io/foldhash/0.1.5 crate://crates.io/foldhash/0.2.0 crate://crates.io/form_urlencoded/1.2.2 crate://crates.io/fs-err/3.3.0 crate://crates.io/futures/0.3.32 crate://crates.io/futures-channel/0.3.32 crate://crates.io/futures-core/0.3.32 crate://crates.io/futures-executor/0.3.32 crate://crates.io/futures-io/0.3.32 crate://crates.io/futures-lite/2.6.1 crate://crates.io/futures-macro/0.3.32 crate://crates.io/futures-sink/0.3.32 crate://crates.io/futures-task/0.3.32 crate://crates.io/futures-util/0.3.32 crate://crates.io/generic-array/0.14.7 crate://crates.io/getrandom/0.3.3 crate://crates.io/getrandom/0.4.1 crate://crates.io/globset/0.4.18
  crate://crates.io/gloo-timers/0.3.0 crate://crates.io/hashbrown/0.15.5 crate://crates.io/hashbrown/0.17.1 crate://crates.io/heck/0.5.0 crate://crates.io/hex/0.4.3 crate://crates.io/icu_collections/2.1.1 crate://crates.io/icu_locale_core/2.1.1 crate://crates.io/icu_normalizer/2.1.1 crate://crates.io/icu_normalizer_data/2.1.1 crate://crates.io/icu_properties/2.1.2 crate://crates.io/icu_properties_data/2.1.2 crate://crates.io/icu_provider/2.1.1 crate://crates.io/id-arena/2.3.0 crate://crates.io/idna/1.1.0 crate://crates.io/idna_adapter/1.2.1 crate://crates.io/indexmap/2.14.0 crate://crates.io/indoc/2.0.7 crate://crates.io/insta/1.47.2 crate://crates.io/is_terminal_polyfill/1.70.2 crate://crates.io/itertools/0.14.0 crate://crates.io/itoa/1.0.17 crate://crates.io/jiff/0.2.24 crate://crates.io/jiff-static/0.2.24 crate://crates.io/jiff-tzdb/0.1.6 crate://crates.io/jiff-tzdb-platform/0.1.3 crate://crates.io/jobserver/0.1.34 crate://crates.io/js-sys/0.3.91 crate://crates.io/junction/2.0.0 c
 rate://crates.io/lazy_static/1.5.0 crate://crates.io/leb128fmt/0.1.0 crate://crates.io/libc/0.2.183 crate://crates.io/linux-raw-sys/0.12.1 crate://crates.io/litemap/0.8.1 crate://crates.io/lock_api/0.4.14 crate://crates.io/log/0.4.29 crate://crates.io/lzma-sys/0.1.20 crate://crates.io/mailparse/0.16.1 crate://crates.io/matchers/0.2.0 crate://crates.io/memchr/2.8.0 crate://crates.io/miniz_oxide/0.8.9 crate://crates.io/mio/1.2.0 crate://crates.io/munge/0.4.7 crate://crates.io/munge_macro/0.4.7 crate://crates.io/nu-ansi-term/0.50.3 crate://crates.io/once_cell/1.21.4 crate://crates.io/once_cell_polyfill/1.70.2 crate://crates.io/owo-colors/4.3.0 crate://crates.io/parking/2.2.1 crate://crates.io/parking_lot/0.12.5 crate://crates.io/parking_lot_core/0.9.12 crate://crates.io/path-slash/0.2.1 crate://crates.io/percent-encoding/2.3.2 crate://crates.io/pest/2.8.6 crate://crates.io/pest_derive/2.8.6 crate://crates.io/pest_generator/2.8.6 crate://crates.io/pest_meta/2.8.6 crate://crates.io/petgr
 aph/0.8.3 crate://crates.io/pin-project/1.1.11 crate://crates.io/pin-project-internal/1.1.11 crate://crates.io/pin-project-lite/0.2.17 crate://crates.io/pkg-config/0.3.32 crate://crates.io/portable-atomic/1.13.1 crate://crates.io/portable-atomic-util/0.2.6 crate://crates.io/potential_utf/0.1.4 crate://crates.io/prettyplease/0.2.37 crate://crates.io/proc-macro2/1.0.106 crate://crates.io/ptr_meta/0.3.1 crate://crates.io/ptr_meta_derive/0.3.1 crate://crates.io/quote/1.0.45 crate://crates.io/quoted_printable/0.5.1 crate://crates.io/r-efi/5.3.0 crate://crates.io/rancor/0.1.1 crate://crates.io/redox_syscall/0.5.15 crate://crates.io/ref-cast/1.0.25 crate://crates.io/ref-cast-impl/1.0.25 crate://crates.io/reflink-copy/0.1.29 crate://crates.io/regex/1.12.3 crate://crates.io/regex-automata/0.4.14 crate://crates.io/regex-syntax/0.8.10 crate://crates.io/rend/0.5.3 crate://crates.io/rkyv/0.8.16 crate://crates.io/rkyv_derive/0.8.16 crate://crates.io/rustc-hash/2.1.2 crate://crates.io/rustix/1.1.4
  crate://crates.io/rustversion/1.0.22 crate://crates.io/ryu/1.0.23 crate://crates.io/same-file/1.0.6 crate://crates.io/schemars/1.2.1 crate://crates.io/schemars_derive/1.2.1 crate://crates.io/scopeguard/1.2.0 crate://crates.io/seahash/4.1.0 crate://crates.io/self-replace/1.5.0 crate://crates.io/semver/1.0.27 crate://crates.io/serde/1.0.228 crate://crates.io/serde-untagged/0.1.9 crate://crates.io/serde_core/1.0.228 crate://crates.io/serde_derive/1.0.228 crate://crates.io/serde_derive_internals/0.29.1 crate://crates.io/serde_json/1.0.149 crate://crates.io/serde_spanned/1.1.1 crate://crates.io/sha2/0.10.9 crate://crates.io/sharded-slab/0.1.7 crate://crates.io/shlex/1.3.0 crate://crates.io/signal-hook-registry/1.4.8 crate://crates.io/simd-adler32/0.3.8 crate://crates.io/simdutf8/0.1.5 crate://crates.io/similar/2.7.0 crate://crates.io/slab/0.4.12 crate://crates.io/smallvec/1.15.1 crate://crates.io/smawk/0.3.2 crate://crates.io/spdx/0.13.4 crate://crates.io/stable_deref_trait/1.2.1 crate:
 //crates.io/strsim/0.11.1 crate://crates.io/syn/2.0.117 crate://crates.io/synstructure/0.13.2 crate://crates.io/temp-env/0.3.6 crate://crates.io/tempfile/3.27.0 crate://crates.io/terminal_size/0.4.3 crate://crates.io/textwrap/0.16.2 crate://crates.io/thiserror/2.0.18 crate://crates.io/thiserror-impl/2.0.18 crate://crates.io/thread_local/1.1.9 crate://crates.io/tinystr/0.8.2 crate://crates.io/tinyvec/1.11.0 crate://crates.io/tinyvec_macros/0.1.1 crate://crates.io/tokio/1.52.3 crate://crates.io/tokio-macros/2.7.0 crate://crates.io/tokio-stream/0.1.18 crate://crates.io/tokio-util/0.7.18 crate://crates.io/toml/1.1.2+spec-1.1.0 crate://crates.io/toml_datetime/1.1.1+spec-1.1.0 crate://crates.io/toml_edit/0.25.11+spec-1.1.0 crate://crates.io/toml_parser/1.1.2+spec-1.1.0 crate://crates.io/toml_writer/1.1.1+spec-1.1.0 crate://crates.io/tracing/0.1.44 crate://crates.io/tracing-attributes/0.1.31 crate://crates.io/tracing-core/0.1.36 crate://crates.io/tracing-log/0.2.0 crate://crates.io/tracing
 -subscriber/0.3.23 crate://crates.io/tracing-test/0.2.6 crate://crates.io/tracing-test-macro/0.2.6 crate://crates.io/typeid/1.0.3 crate://crates.io/typenum/1.19.0 crate://crates.io/ucd-trie/0.1.7 crate://crates.io/unicode-ident/1.0.24 crate://crates.io/unicode-linebreak/0.1.5 crate://crates.io/unicode-width/0.2.2 crate://crates.io/unicode-xid/0.2.6 crate://crates.io/unscanny/0.1.0 crate://crates.io/url/2.5.8 crate://crates.io/utf8_iter/1.0.4 crate://crates.io/utf8parse/0.2.2 crate://crates.io/uuid/1.23.1 crate://crates.io/valuable/0.1.1 crate://crates.io/version_check/0.9.5 crate://crates.io/walkdir/2.5.0 crate://crates.io/wasi/0.11.1+wasi-snapshot-preview1 crate://crates.io/wasi/0.14.7+wasi-0.2.4 crate://crates.io/wasip2/1.0.2+wasi-0.2.9 crate://crates.io/wasip3/0.4.0+wasi-0.3.0-rc-2026-01-06 crate://crates.io/wasm-bindgen/0.2.114 crate://crates.io/wasm-bindgen-macro/0.2.114 crate://crates.io/wasm-bindgen-macro-support/0.2.114 crate://crates.io/wasm-bindgen-shared/0.2.114 crate://c
 rates.io/wasm-encoder/0.244.0 crate://crates.io/wasm-metadata/0.244.0 crate://crates.io/wasmparser/0.244.0 crate://crates.io/winapi-util/0.1.11 crate://crates.io/windows/0.61.3 crate://crates.io/windows-collections/0.2.0 crate://crates.io/windows-core/0.61.2 crate://crates.io/windows-future/0.2.1 crate://crates.io/windows-implement/0.60.2 crate://crates.io/windows-interface/0.59.3 crate://crates.io/windows-link/0.1.3 crate://crates.io/windows-link/0.2.1 crate://crates.io/windows-numerics/0.2.0 crate://crates.io/windows-result/0.3.4 crate://crates.io/windows-strings/0.4.2 crate://crates.io/windows-sys/0.52.0 crate://crates.io/windows-sys/0.60.2 crate://crates.io/windows-sys/0.61.2 crate://crates.io/windows-targets/0.52.6 crate://crates.io/windows-targets/0.53.5 crate://crates.io/windows-threading/0.1.0 crate://crates.io/windows_aarch64_gnullvm/0.52.6 crate://crates.io/windows_aarch64_gnullvm/0.53.1 crate://crates.io/windows_aarch64_msvc/0.52.6 crate://crates.io/windows_aarch64_msvc/0
 .53.1 crate://crates.io/windows_i686_gnu/0.52.6 crate://crates.io/windows_i686_gnu/0.53.1 crate://crates.io/windows_i686_gnullvm/0.52.6 crate://crates.io/windows_i686_gnullvm/0.53.1 crate://crates.io/windows_i686_msvc/0.52.6 crate://crates.io/windows_i686_msvc/0.53.1 crate://crates.io/windows_x86_64_gnu/0.52.6 crate://crates.io/windows_x86_64_gnu/0.53.1 crate://crates.io/windows_x86_64_gnullvm/0.52.6 crate://crates.io/windows_x86_64_gnullvm/0.53.1 crate://crates.io/windows_x86_64_msvc/0.52.6 crate://crates.io/windows_x86_64_msvc/0.53.1 crate://crates.io/winnow/1.0.3 crate://crates.io/wit-bindgen/0.51.0 crate://crates.io/wit-bindgen-core/0.51.0 crate://crates.io/wit-bindgen-rust/0.51.0 crate://crates.io/wit-bindgen-rust-macro/0.51.0 crate://crates.io/wit-component/0.244.0 crate://crates.io/wit-parser/0.244.0 crate://crates.io/writeable/0.6.2 crate://crates.io/xattr/1.6.1 crate://crates.io/xz2/0.1.7 crate://crates.io/yoke/0.8.1 crate://crates.io/yoke-derive/0.8.1 crate://crates.io/zer
 ofrom/0.1.6 crate://crates.io/zerofrom-derive/0.1.6 crate://crates.io/zerotrie/0.2.3 crate://crates.io/zerovec/0.11.5 crate://crates.io/zerovec-derive/0.11.2 crate://crates.io/zlib-rs/0.6.3 crate://crates.io/zmij/1.0.21 crate://crates.io/zstd/0.13.3 crate://crates.io/zstd-safe/7.2.4 crate://crates.io/zstd-sys/2.0.16+zstd.1.5.7" to "https://files.pythonhosted.org/packages/source/u/uv_build/uv_build-0.11.20.tar.gz;downloadfilename=uv_build-0.11.20.tar.gz crate://crates.io/adler2/2.0.1 crate://crates.io/aho-corasick/1.1.4 crate://crates.io/allocator-api2/0.2.21 crate://crates.io/anstream/1.0.0 crate://crates.io/anstyle/1.0.14 crate://crates.io/anstyle-parse/1.0.0 crate://crates.io/anstyle-query/1.1.5 crate://crates.io/anstyle-wincon/3.0.11 crate://crates.io/anyhow/1.0.102 crate://crates.io/arcstr/1.2.0 crate://crates.io/arrayvec/0.7.6 crate://crates.io/astral-tokio-tar/0.6.2 crate://crates.io/astral-version-ranges/0.1.4 crate://crates.io/astral_async_zip/0.0.18 crate://crates.io/async-
 compression/0.4.19 crate://crates.io/autocfg/1.5.0 crate://crates.io/backon/1.6.0 crate://crates.io/base64/0.22.1 crate://crates.io/bitflags/2.11.1 crate://crates.io/block-buffer/0.10.4 crate://crates.io/boxcar/0.2.14 crate://crates.io/bstr/1.12.1 crate://crates.io/bumpalo/3.20.2 crate://crates.io/bytecheck/0.8.2 crate://crates.io/bytecheck_derive/0.8.2 crate://crates.io/bytes/1.11.1 crate://crates.io/bzip2/0.5.2 crate://crates.io/bzip2-sys/0.1.13+1.0.8 crate://crates.io/cc/1.2.57 crate://crates.io/cfg-if/1.0.4 crate://crates.io/charset/0.1.5 crate://crates.io/clap/4.6.1 crate://crates.io/clap_builder/4.6.0 crate://crates.io/clap_derive/4.6.1 crate://crates.io/clap_lex/1.1.0 crate://crates.io/colorchoice/1.0.5 crate://crates.io/console/0.16.3 crate://crates.io/cpufeatures/0.2.17 crate://crates.io/crc32fast/1.5.0 crate://crates.io/crypto-common/0.1.7 crate://crates.io/csv/1.4.0 crate://crates.io/csv-core/0.1.13 crate://crates.io/data-encoding/2.11.0 crate://crates.io/digest/0.10.7 cr
 ate://crates.io/displaydoc/0.2.5 crate://crates.io/dunce/1.0.5 crate://crates.io/dyn-clone/1.0.20 crate://crates.io/either/1.16.0 crate://crates.io/encode_unicode/1.0.0 crate://crates.io/encoding_rs/0.8.35 crate://crates.io/encoding_rs_io/0.1.7 crate://crates.io/enumflags2/0.7.12 crate://crates.io/enumflags2_derive/0.7.12 crate://crates.io/equivalent/1.0.2 crate://crates.io/erased-serde/0.4.10 crate://crates.io/errno/0.3.14 crate://crates.io/fastrand/2.4.1 crate://crates.io/filetime/0.2.29 crate://crates.io/find-msvc-tools/0.1.9 crate://crates.io/fixedbitset/0.5.7 crate://crates.io/flate2/1.1.9 crate://crates.io/foldhash/0.1.5 crate://crates.io/foldhash/0.2.0 crate://crates.io/form_urlencoded/1.2.2 crate://crates.io/fs-err/3.3.0 crate://crates.io/futures/0.3.32 crate://crates.io/futures-channel/0.3.32 crate://crates.io/futures-core/0.3.32 crate://crates.io/futures-executor/0.3.32 crate://crates.io/futures-io/0.3.32 crate://crates.io/futures-lite/2.6.1 crate://crates.io/futures-macro
 /0.3.32 crate://crates.io/futures-sink/0.3.32 crate://crates.io/futures-task/0.3.32 crate://crates.io/futures-util/0.3.32 crate://crates.io/generic-array/0.14.7 crate://crates.io/getrandom/0.3.3 crate://crates.io/getrandom/0.4.1 crate://crates.io/globset/0.4.18 crate://crates.io/gloo-timers/0.3.0 crate://crates.io/hashbrown/0.15.5 crate://crates.io/hashbrown/0.17.1 crate://crates.io/heck/0.5.0 crate://crates.io/hex/0.4.3 crate://crates.io/icu_collections/2.1.1 crate://crates.io/icu_locale_core/2.1.1 crate://crates.io/icu_normalizer/2.1.1 crate://crates.io/icu_normalizer_data/2.1.1 crate://crates.io/icu_properties/2.1.2 crate://crates.io/icu_properties_data/2.1.2 crate://crates.io/icu_provider/2.1.1 crate://crates.io/id-arena/2.3.0 crate://crates.io/idna/1.1.0 crate://crates.io/idna_adapter/1.2.1 crate://crates.io/indexmap/2.14.0 crate://crates.io/indoc/2.0.7 crate://crates.io/insta/1.47.2 crate://crates.io/is_terminal_polyfill/1.70.2 crate://crates.io/itertools/0.14.0 crate://crates
 .io/itoa/1.0.17 crate://crates.io/jiff/0.2.28 crate://crates.io/jiff-static/0.2.28 crate://crates.io/jiff-tzdb/0.1.6 crate://crates.io/jiff-tzdb-platform/0.1.3 crate://crates.io/jobserver/0.1.34 crate://crates.io/js-sys/0.3.91 crate://crates.io/junction/2.0.0 crate://crates.io/lazy_static/1.5.0 crate://crates.io/leb128fmt/0.1.0 crate://crates.io/libc/0.2.186 crate://crates.io/linux-raw-sys/0.12.1 crate://crates.io/litemap/0.8.1 crate://crates.io/lock_api/0.4.14 crate://crates.io/log/0.4.29 crate://crates.io/lzma-sys/0.1.20 crate://crates.io/mailparse/0.16.1 crate://crates.io/matchers/0.2.0 crate://crates.io/memchr/2.8.1 crate://crates.io/miniz_oxide/0.8.9 crate://crates.io/mio/1.2.0 crate://crates.io/munge/0.4.7 crate://crates.io/munge_macro/0.4.7 crate://crates.io/nu-ansi-term/0.50.3 crate://crates.io/once_cell/1.21.4 crate://crates.io/once_cell_polyfill/1.70.2 crate://crates.io/owo-colors/4.3.0 crate://crates.io/parking/2.2.1 crate://crates.io/parking_lot/0.12.5 crate://crates.io/
 parking_lot_core/0.9.12 crate://crates.io/path-slash/0.2.1 crate://crates.io/percent-encoding/2.3.2 crate://crates.io/pest/2.8.6 crate://crates.io/pest_derive/2.8.6 crate://crates.io/pest_generator/2.8.6 crate://crates.io/pest_meta/2.8.6 crate://crates.io/petgraph/0.8.3 crate://crates.io/pin-project/1.1.11 crate://crates.io/pin-project-internal/1.1.11 crate://crates.io/pin-project-lite/0.2.17 crate://crates.io/pkg-config/0.3.32 crate://crates.io/portable-atomic/1.13.1 crate://crates.io/portable-atomic-util/0.2.6 crate://crates.io/potential_utf/0.1.4 crate://crates.io/prettyplease/0.2.37 crate://crates.io/proc-macro2/1.0.106 crate://crates.io/ptr_meta/0.3.1 crate://crates.io/ptr_meta_derive/0.3.1 crate://crates.io/quote/1.0.45 crate://crates.io/quoted_printable/0.5.1 crate://crates.io/r-efi/5.3.0 crate://crates.io/rancor/0.1.1 crate://crates.io/redox_syscall/0.5.15 crate://crates.io/ref-cast/1.0.25 crate://crates.io/ref-cast-impl/1.0.25 crate://crates.io/reflink-copy/0.1.29 crate://c
 rates.io/regex/1.12.3 crate://crates.io/regex-automata/0.4.14 crate://crates.io/regex-syntax/0.8.10 crate://crates.io/rend/0.5.3 crate://crates.io/rkyv/0.8.16 crate://crates.io/rkyv_derive/0.8.16 crate://crates.io/rustc-hash/2.1.2 crate://crates.io/rustix/1.1.4 crate://crates.io/rustversion/1.0.22 crate://crates.io/ryu/1.0.23 crate://crates.io/same-file/1.0.6 crate://crates.io/schemars/1.2.1 crate://crates.io/schemars_derive/1.2.1 crate://crates.io/scopeguard/1.2.0 crate://crates.io/seahash/4.1.0 crate://crates.io/self-replace/1.5.0 crate://crates.io/semver/1.0.27 crate://crates.io/serde/1.0.228 crate://crates.io/serde-untagged/0.1.9 crate://crates.io/serde_core/1.0.228 crate://crates.io/serde_derive/1.0.228 crate://crates.io/serde_derive_internals/0.29.1 crate://crates.io/serde_json/1.0.150 crate://crates.io/serde_spanned/1.1.1 crate://crates.io/sha2/0.10.9 crate://crates.io/sharded-slab/0.1.7 crate://crates.io/shlex/1.3.0 crate://crates.io/signal-hook-registry/1.4.8 crate://crates
 .io/simd-adler32/0.3.8 crate://crates.io/simdutf8/0.1.5 crate://crates.io/similar/2.7.0 crate://crates.io/slab/0.4.12 crate://crates.io/smallvec/1.15.1 crate://crates.io/smawk/0.3.2 crate://crates.io/spdx/0.13.4 crate://crates.io/stable_deref_trait/1.2.1 crate://crates.io/strsim/0.11.1 crate://crates.io/syn/2.0.117 crate://crates.io/synstructure/0.13.2 crate://crates.io/temp-env/0.3.6 crate://crates.io/tempfile/3.27.0 crate://crates.io/terminal_size/0.4.4 crate://crates.io/textwrap/0.16.2 crate://crates.io/thiserror/2.0.18 crate://crates.io/thiserror-impl/2.0.18 crate://crates.io/thread_local/1.1.9 crate://crates.io/tinystr/0.8.2 crate://crates.io/tinyvec/1.11.0 crate://crates.io/tinyvec_macros/0.1.1 crate://crates.io/tokio/1.52.3 crate://crates.io/tokio-macros/2.7.0 crate://crates.io/tokio-stream/0.1.18 crate://crates.io/tokio-util/0.7.18 crate://crates.io/toml/1.1.2+spec-1.1.0 crate://crates.io/toml_datetime/1.1.1+spec-1.1.0 crate://crates.io/toml_edit/0.25.12+spec-1.1.0 crate://c
 rates.io/toml_parser/1.1.2+spec-1.1.0 crate://crates.io/toml_writer/1.1.1+spec-1.1.0 crate://crates.io/tracing/0.1.44 crate://crates.io/tracing-attributes/0.1.31 crate://crates.io/tracing-core/0.1.36 crate://crates.io/tracing-log/0.2.0 crate://crates.io/tracing-subscriber/0.3.23 crate://crates.io/tracing-test/0.2.6 crate://crates.io/tracing-test-macro/0.2.6 crate://crates.io/typeid/1.0.3 crate://crates.io/typenum/1.19.0 crate://crates.io/ucd-trie/0.1.7 crate://crates.io/unicode-ident/1.0.24 crate://crates.io/unicode-linebreak/0.1.5 crate://crates.io/unicode-width/0.2.2 crate://crates.io/unicode-xid/0.2.6 crate://crates.io/unscanny/0.1.0 crate://crates.io/url/2.5.8 crate://crates.io/utf8_iter/1.0.4 crate://crates.io/utf8parse/0.2.2 crate://crates.io/uuid/1.23.2 crate://crates.io/valuable/0.1.1 crate://crates.io/version_check/0.9.5 crate://crates.io/walkdir/2.5.0 crate://crates.io/wasi/0.11.1+wasi-snapshot-preview1 crate://crates.io/wasi/0.14.7+wasi-0.2.4 crate://crates.io/wasip2/1.0.
 2+wasi-0.2.9 crate://crates.io/wasip3/0.4.0+wasi-0.3.0-rc-2026-01-06 crate://crates.io/wasm-bindgen/0.2.114 crate://crates.io/wasm-bindgen-macro/0.2.114 crate://crates.io/wasm-bindgen-macro-support/0.2.114 crate://crates.io/wasm-bindgen-shared/0.2.114 crate://crates.io/wasm-encoder/0.244.0 crate://crates.io/wasm-metadata/0.244.0 crate://crates.io/wasmparser/0.244.0 crate://crates.io/winapi-util/0.1.11 crate://crates.io/windows/0.61.3 crate://crates.io/windows-collections/0.2.0 crate://crates.io/windows-core/0.61.2 crate://crates.io/windows-future/0.2.1 crate://crates.io/windows-implement/0.60.2 crate://crates.io/windows-interface/0.59.3 crate://crates.io/windows-link/0.1.3 crate://crates.io/windows-link/0.2.1 crate://crates.io/windows-numerics/0.2.0 crate://crates.io/windows-result/0.3.4 crate://crates.io/windows-strings/0.4.2 crate://crates.io/windows-sys/0.52.0 crate://crates.io/windows-sys/0.61.2 crate://crates.io/windows-targets/0.52.6 crate://crates.io/windows-threading/0.1.0 c
 rate://crates.io/windows_aarch64_gnullvm/0.52.6 crate://crates.io/windows_aarch64_msvc/0.52.6 crate://crates.io/windows_i686_gnu/0.52.6 crate://crates.io/windows_i686_gnullvm/0.52.6 crate://crates.io/windows_i686_msvc/0.52.6 crate://crates.io/windows_x86_64_gnu/0.52.6 crate://crates.io/windows_x86_64_gnullvm/0.52.6 crate://crates.io/windows_x86_64_msvc/0.52.6 crate://crates.io/winnow/1.0.3 crate://crates.io/wit-bindgen/0.51.0 crate://crates.io/wit-bindgen-core/0.51.0 crate://crates.io/wit-bindgen-rust/0.51.0 crate://crates.io/wit-bindgen-rust-macro/0.51.0 crate://crates.io/wit-component/0.244.0 crate://crates.io/wit-parser/0.244.0 crate://crates.io/writeable/0.6.2 crate://crates.io/xattr/1.6.1 crate://crates.io/xz2/0.1.7 crate://crates.io/yoke/0.8.1 crate://crates.io/yoke-derive/0.8.1 crate://crates.io/zerofrom/0.1.6 crate://crates.io/zerofrom-derive/0.1.6 crate://crates.io/zerotrie/0.2.3 crate://crates.io/zerovec/0.11.5 crate://crates.io/zerovec-derive/0.11.2 crate://crates.io/zlib
 -rs/0.6.3 crate://crates.io/zmij/1.0.21 crate://crates.io/zstd/0.13.3 crate://crates.io/zstd-safe/7.2.4 crate://crates.io/zstd-sys/2.0.16+zstd.1.5.7"
packages/x86-64-v3-poky-linux/python3-uv-build/python3-uv-build-dbg: PKGV changed from 0.11.17 [default] to 0.11.20 [default]
packages/x86-64-v3-poky-linux/python3-uv-build/python3-uv-build-dbg: PV changed from "0.11.17" to "0.11.20"
packages/x86-64-v3-poky-linux/python3-uv-build/python3-uv-build-dev: PKGV changed from 0.11.17 [default] to 0.11.20 [default]
packages/x86-64-v3-poky-linux/python3-uv-build/python3-uv-build-dev: PV changed from "0.11.17" to "0.11.20"
packages/x86-64-v3-poky-linux/python3-uv-build/python3-uv-build-doc: PKGV changed from 0.11.17 [default] to 0.11.20 [default]
packages/x86-64-v3-poky-linux/python3-uv-build/python3-uv-build-doc: PV changed from "0.11.17" to "0.11.20"
packages/x86-64-v3-poky-linux/python3-uv-build/python3-uv-build-locale: PKGV changed from 0.11.17 [default] to 0.11.20 [default]
packages/x86-64-v3-poky-linux/python3-uv-build/python3-uv-build-locale: PV changed from "0.11.17" to "0.11.20"
packages/x86-64-v3-poky-linux/python3-uv-build/python3-uv-build-src: PKGV changed from 0.11.17 [default] to 0.11.20 [default]
packages/x86-64-v3-poky-linux/python3-uv-build/python3-uv-build-src: PV changed from "0.11.17" to "0.11.20"
packages/x86-64-v3-poky-linux/python3-uv-build/python3-uv-build-staticdev: PKGV changed from 0.11.17 [default] to 0.11.20 [default]
packages/x86-64-v3-poky-linux/python3-uv-build/python3-uv-build-staticdev: PV changed from "0.11.17" to "0.11.20"
packages/x86-64-v3-poky-linux/python3-uv-build/python3-uv-build: PKGV changed from 0.11.17 [default] to 0.11.20 [default]
packages/x86-64-v3-poky-linux/python3-uv-build/python3-uv-build: FILELIST: directory renamed /usr/lib/python3.14/site-packages/uv_build-0.11.17.dist-info/licenses -> /usr/lib/python3.14/site-packages/uv_build-0.11.20.dist-info/licenses, directory renamed /usr/lib/python3.14/site-packages/uv_build-0.11.17.dist-info -> /usr/lib/python3.14/site-packages/uv_build-0.11.20.dist-info
packages/x86-64-v3-poky-linux/python3-uv-build/python3-uv-build: PV changed from "0.11.17" to "0.11.20"
packages/x86-64-v3-poky-linux/python3-uv-build/python3-uv-build: PKGSIZE changed from 5340466 to 5344562 (+0%)
Changes to packages/x86-64-v3-poky-linux/python3-uv-build (sysroot):
  /usr/lib/python3.14/site-packages/uv_build-0.11.17.dist-info moved to /usr/lib/python3.14/site-packages/uv_build-0.11.20.dist-info

--===============6628009220276699985==
Content-Type: application/octet-stream
MIME-Version: 1.0
Content-Transfer-Encoding: base64
Content-Disposition: attachment;
 filename="0001-python3-uv-build-upgrade-0.11.17-0.11.20.patch"

RnJvbSAzODI4NTc4ODU1MzU5YzMwNWNmZDNmMDFlNDExMmVlYzkxMWUzZDk1IE1vbiBTZXAgMTcg
MDA6MDA6MDAgMjAwMQpGcm9tOiBVcGdyYWRlIEhlbHBlciA8YXVoQHlvY3RvcHJvamVjdC5vcmc+
CkRhdGU6IFRodSwgMTEgSnVuIDIwMjYgMTA6MjU6MzEgKzAwMDAKU3ViamVjdDogW1BBVENIXSBw
eXRob24zLXV2LWJ1aWxkOiB1cGdyYWRlIDAuMTEuMTcgLT4gMC4xMS4yMAoKLS0tCiAuLi4vcHl0
aG9uL3B5dGhvbjMtdXYtYnVpbGQtY3JhdGVzLmluYyAgICAgICAgfCA2MCArKysrKysrLS0tLS0t
LS0tLS0tCiAuLi4wLjExLjE3LmJiID0+IHB5dGhvbjMtdXYtYnVpbGRfMC4xMS4yMC5iYn0gfCAg
MiArLQogMiBmaWxlcyBjaGFuZ2VkLCAyMSBpbnNlcnRpb25zKCspLCA0MSBkZWxldGlvbnMoLSkK
IHJlbmFtZSBtZXRhL3JlY2lwZXMtZGV2dG9vbHMvcHl0aG9uL3tweXRob24zLXV2LWJ1aWxkXzAu
MTEuMTcuYmIgPT4gcHl0aG9uMy11di1idWlsZF8wLjExLjIwLmJifSAoOTIlKQoKZGlmZiAtLWdp
dCBhL21ldGEvcmVjaXBlcy1kZXZ0b29scy9weXRob24vcHl0aG9uMy11di1idWlsZC1jcmF0ZXMu
aW5jIGIvbWV0YS9yZWNpcGVzLWRldnRvb2xzL3B5dGhvbi9weXRob24zLXV2LWJ1aWxkLWNyYXRl
cy5pbmMKaW5kZXggNmM0ZDRhYzQ3My4uYmUyMDExNTY2OCAxMDA2NDQKLS0tIGEvbWV0YS9yZWNp
cGVzLWRldnRvb2xzL3B5dGhvbi9weXRob24zLXV2LWJ1aWxkLWNyYXRlcy5pbmMKKysrIGIvbWV0
YS9yZWNpcGVzLWRldnRvb2xzL3B5dGhvbi9weXRob24zLXV2LWJ1aWxkLWNyYXRlcy5pbmMKQEAg
LTE1LDcgKzE1LDcgQEAgU1JDX1VSSSArPSAiIFwKICAgICBjcmF0ZTovL2NyYXRlcy5pby9hcnJh
eXZlYy8wLjcuNiBcCiAgICAgY3JhdGU6Ly9jcmF0ZXMuaW8vYXN0cmFsLXRva2lvLXRhci8wLjYu
MiBcCiAgICAgY3JhdGU6Ly9jcmF0ZXMuaW8vYXN0cmFsLXZlcnNpb24tcmFuZ2VzLzAuMS40IFwK
LSAgICBjcmF0ZTovL2NyYXRlcy5pby9hc3RyYWxfYXN5bmNfemlwLzAuMC4xOC1yYzQgXAorICAg
IGNyYXRlOi8vY3JhdGVzLmlvL2FzdHJhbF9hc3luY196aXAvMC4wLjE4IFwKICAgICBjcmF0ZTov
L2NyYXRlcy5pby9hc3luYy1jb21wcmVzc2lvbi8wLjQuMTkgXAogICAgIGNyYXRlOi8vY3JhdGVz
LmlvL2F1dG9jZmcvMS41LjAgXAogICAgIGNyYXRlOi8vY3JhdGVzLmlvL2JhY2tvbi8xLjYuMCBc
CkBAIC00OSw3ICs0OSw3IEBAIFNSQ19VUkkgKz0gIiBcCiAgICAgY3JhdGU6Ly9jcmF0ZXMuaW8v
ZGlzcGxheWRvYy8wLjIuNSBcCiAgICAgY3JhdGU6Ly9jcmF0ZXMuaW8vZHVuY2UvMS4wLjUgXAog
ICAgIGNyYXRlOi8vY3JhdGVzLmlvL2R5bi1jbG9uZS8xLjAuMjAgXAotICAgIGNyYXRlOi8vY3Jh
dGVzLmlvL2VpdGhlci8xLjE1LjAgXAorICAgIGNyYXRlOi8vY3JhdGVzLmlvL2VpdGhlci8xLjE2
LjAgXAogICAgIGNyYXRlOi8vY3JhdGVzLmlvL2VuY29kZV91bmljb2RlLzEuMC4wIFwKICAgICBj
cmF0ZTovL2NyYXRlcy5pby9lbmNvZGluZ19ycy8wLjguMzUgXAogICAgIGNyYXRlOi8vY3JhdGVz
LmlvL2VuY29kaW5nX3JzX2lvLzAuMS43IFwKQEAgLTEwMiw4ICsxMDIsOCBAQCBTUkNfVVJJICs9
ICIgXAogICAgIGNyYXRlOi8vY3JhdGVzLmlvL2lzX3Rlcm1pbmFsX3BvbHlmaWxsLzEuNzAuMiBc
CiAgICAgY3JhdGU6Ly9jcmF0ZXMuaW8vaXRlcnRvb2xzLzAuMTQuMCBcCiAgICAgY3JhdGU6Ly9j
cmF0ZXMuaW8vaXRvYS8xLjAuMTcgXAotICAgIGNyYXRlOi8vY3JhdGVzLmlvL2ppZmYvMC4yLjI0
IFwKLSAgICBjcmF0ZTovL2NyYXRlcy5pby9qaWZmLXN0YXRpYy8wLjIuMjQgXAorICAgIGNyYXRl
Oi8vY3JhdGVzLmlvL2ppZmYvMC4yLjI4IFwKKyAgICBjcmF0ZTovL2NyYXRlcy5pby9qaWZmLXN0
YXRpYy8wLjIuMjggXAogICAgIGNyYXRlOi8vY3JhdGVzLmlvL2ppZmYtdHpkYi8wLjEuNiBcCiAg
ICAgY3JhdGU6Ly9jcmF0ZXMuaW8vamlmZi10emRiLXBsYXRmb3JtLzAuMS4zIFwKICAgICBjcmF0
ZTovL2NyYXRlcy5pby9qb2JzZXJ2ZXIvMC4xLjM0IFwKQEAgLTExMSw3ICsxMTEsNyBAQCBTUkNf
VVJJICs9ICIgXAogICAgIGNyYXRlOi8vY3JhdGVzLmlvL2p1bmN0aW9uLzIuMC4wIFwKICAgICBj
cmF0ZTovL2NyYXRlcy5pby9sYXp5X3N0YXRpYy8xLjUuMCBcCiAgICAgY3JhdGU6Ly9jcmF0ZXMu
aW8vbGViMTI4Zm10LzAuMS4wIFwKLSAgICBjcmF0ZTovL2NyYXRlcy5pby9saWJjLzAuMi4xODMg
XAorICAgIGNyYXRlOi8vY3JhdGVzLmlvL2xpYmMvMC4yLjE4NiBcCiAgICAgY3JhdGU6Ly9jcmF0
ZXMuaW8vbGludXgtcmF3LXN5cy8wLjEyLjEgXAogICAgIGNyYXRlOi8vY3JhdGVzLmlvL2xpdGVt
YXAvMC44LjEgXAogICAgIGNyYXRlOi8vY3JhdGVzLmlvL2xvY2tfYXBpLzAuNC4xNCBcCkBAIC0x
MTksNyArMTE5LDcgQEAgU1JDX1VSSSArPSAiIFwKICAgICBjcmF0ZTovL2NyYXRlcy5pby9sem1h
LXN5cy8wLjEuMjAgXAogICAgIGNyYXRlOi8vY3JhdGVzLmlvL21haWxwYXJzZS8wLjE2LjEgXAog
ICAgIGNyYXRlOi8vY3JhdGVzLmlvL21hdGNoZXJzLzAuMi4wIFwKLSAgICBjcmF0ZTovL2NyYXRl
cy5pby9tZW1jaHIvMi44LjAgXAorICAgIGNyYXRlOi8vY3JhdGVzLmlvL21lbWNoci8yLjguMSBc
CiAgICAgY3JhdGU6Ly9jcmF0ZXMuaW8vbWluaXpfb3hpZGUvMC44LjkgXAogICAgIGNyYXRlOi8v
Y3JhdGVzLmlvL21pby8xLjIuMCBcCiAgICAgY3JhdGU6Ly9jcmF0ZXMuaW8vbXVuZ2UvMC40Ljcg
XApAQCAtMTc5LDcgKzE3OSw3IEBAIFNSQ19VUkkgKz0gIiBcCiAgICAgY3JhdGU6Ly9jcmF0ZXMu
aW8vc2VyZGVfY29yZS8xLjAuMjI4IFwKICAgICBjcmF0ZTovL2NyYXRlcy5pby9zZXJkZV9kZXJp
dmUvMS4wLjIyOCBcCiAgICAgY3JhdGU6Ly9jcmF0ZXMuaW8vc2VyZGVfZGVyaXZlX2ludGVybmFs
cy8wLjI5LjEgXAotICAgIGNyYXRlOi8vY3JhdGVzLmlvL3NlcmRlX2pzb24vMS4wLjE0OSBcCisg
ICAgY3JhdGU6Ly9jcmF0ZXMuaW8vc2VyZGVfanNvbi8xLjAuMTUwIFwKICAgICBjcmF0ZTovL2Ny
YXRlcy5pby9zZXJkZV9zcGFubmVkLzEuMS4xIFwKICAgICBjcmF0ZTovL2NyYXRlcy5pby9zaGEy
LzAuMTAuOSBcCiAgICAgY3JhdGU6Ly9jcmF0ZXMuaW8vc2hhcmRlZC1zbGFiLzAuMS43IFwKQEAg
LTE5OCw3ICsxOTgsNyBAQCBTUkNfVVJJICs9ICIgXAogICAgIGNyYXRlOi8vY3JhdGVzLmlvL3N5
bnN0cnVjdHVyZS8wLjEzLjIgXAogICAgIGNyYXRlOi8vY3JhdGVzLmlvL3RlbXAtZW52LzAuMy42
IFwKICAgICBjcmF0ZTovL2NyYXRlcy5pby90ZW1wZmlsZS8zLjI3LjAgXAotICAgIGNyYXRlOi8v
Y3JhdGVzLmlvL3Rlcm1pbmFsX3NpemUvMC40LjMgXAorICAgIGNyYXRlOi8vY3JhdGVzLmlvL3Rl
cm1pbmFsX3NpemUvMC40LjQgXAogICAgIGNyYXRlOi8vY3JhdGVzLmlvL3RleHR3cmFwLzAuMTYu
MiBcCiAgICAgY3JhdGU6Ly9jcmF0ZXMuaW8vdGhpc2Vycm9yLzIuMC4xOCBcCiAgICAgY3JhdGU6
Ly9jcmF0ZXMuaW8vdGhpc2Vycm9yLWltcGwvMi4wLjE4IFwKQEAgLTIxMiw3ICsyMTIsNyBAQCBT
UkNfVVJJICs9ICIgXAogICAgIGNyYXRlOi8vY3JhdGVzLmlvL3Rva2lvLXV0aWwvMC43LjE4IFwK
ICAgICBjcmF0ZTovL2NyYXRlcy5pby90b21sLzEuMS4yK3NwZWMtMS4xLjAgXAogICAgIGNyYXRl
Oi8vY3JhdGVzLmlvL3RvbWxfZGF0ZXRpbWUvMS4xLjErc3BlYy0xLjEuMCBcCi0gICAgY3JhdGU6
Ly9jcmF0ZXMuaW8vdG9tbF9lZGl0LzAuMjUuMTErc3BlYy0xLjEuMCBcCisgICAgY3JhdGU6Ly9j
cmF0ZXMuaW8vdG9tbF9lZGl0LzAuMjUuMTIrc3BlYy0xLjEuMCBcCiAgICAgY3JhdGU6Ly9jcmF0
ZXMuaW8vdG9tbF9wYXJzZXIvMS4xLjIrc3BlYy0xLjEuMCBcCiAgICAgY3JhdGU6Ly9jcmF0ZXMu
aW8vdG9tbF93cml0ZXIvMS4xLjErc3BlYy0xLjEuMCBcCiAgICAgY3JhdGU6Ly9jcmF0ZXMuaW8v
dHJhY2luZy8wLjEuNDQgXApAQCAtMjMzLDcgKzIzMyw3IEBAIFNSQ19VUkkgKz0gIiBcCiAgICAg
Y3JhdGU6Ly9jcmF0ZXMuaW8vdXJsLzIuNS44IFwKICAgICBjcmF0ZTovL2NyYXRlcy5pby91dGY4
X2l0ZXIvMS4wLjQgXAogICAgIGNyYXRlOi8vY3JhdGVzLmlvL3V0ZjhwYXJzZS8wLjIuMiBcCi0g
ICAgY3JhdGU6Ly9jcmF0ZXMuaW8vdXVpZC8xLjIzLjEgXAorICAgIGNyYXRlOi8vY3JhdGVzLmlv
L3V1aWQvMS4yMy4yIFwKICAgICBjcmF0ZTovL2NyYXRlcy5pby92YWx1YWJsZS8wLjEuMSBcCiAg
ICAgY3JhdGU6Ly9jcmF0ZXMuaW8vdmVyc2lvbl9jaGVjay8wLjkuNSBcCiAgICAgY3JhdGU6Ly9j
cmF0ZXMuaW8vd2Fsa2Rpci8yLjUuMCBcCkBAIC0yNjEsMjcgKzI2MSwxNyBAQCBTUkNfVVJJICs9
ICIgXAogICAgIGNyYXRlOi8vY3JhdGVzLmlvL3dpbmRvd3MtcmVzdWx0LzAuMy40IFwKICAgICBj
cmF0ZTovL2NyYXRlcy5pby93aW5kb3dzLXN0cmluZ3MvMC40LjIgXAogICAgIGNyYXRlOi8vY3Jh
dGVzLmlvL3dpbmRvd3Mtc3lzLzAuNTIuMCBcCi0gICAgY3JhdGU6Ly9jcmF0ZXMuaW8vd2luZG93
cy1zeXMvMC42MC4yIFwKICAgICBjcmF0ZTovL2NyYXRlcy5pby93aW5kb3dzLXN5cy8wLjYxLjIg
XAogICAgIGNyYXRlOi8vY3JhdGVzLmlvL3dpbmRvd3MtdGFyZ2V0cy8wLjUyLjYgXAotICAgIGNy
YXRlOi8vY3JhdGVzLmlvL3dpbmRvd3MtdGFyZ2V0cy8wLjUzLjUgXAogICAgIGNyYXRlOi8vY3Jh
dGVzLmlvL3dpbmRvd3MtdGhyZWFkaW5nLzAuMS4wIFwKICAgICBjcmF0ZTovL2NyYXRlcy5pby93
aW5kb3dzX2FhcmNoNjRfZ251bGx2bS8wLjUyLjYgXAotICAgIGNyYXRlOi8vY3JhdGVzLmlvL3dp
bmRvd3NfYWFyY2g2NF9nbnVsbHZtLzAuNTMuMSBcCiAgICAgY3JhdGU6Ly9jcmF0ZXMuaW8vd2lu
ZG93c19hYXJjaDY0X21zdmMvMC41Mi42IFwKLSAgICBjcmF0ZTovL2NyYXRlcy5pby93aW5kb3dz
X2FhcmNoNjRfbXN2Yy8wLjUzLjEgXAogICAgIGNyYXRlOi8vY3JhdGVzLmlvL3dpbmRvd3NfaTY4
Nl9nbnUvMC41Mi42IFwKLSAgICBjcmF0ZTovL2NyYXRlcy5pby93aW5kb3dzX2k2ODZfZ251LzAu
NTMuMSBcCiAgICAgY3JhdGU6Ly9jcmF0ZXMuaW8vd2luZG93c19pNjg2X2dudWxsdm0vMC41Mi42
IFwKLSAgICBjcmF0ZTovL2NyYXRlcy5pby93aW5kb3dzX2k2ODZfZ251bGx2bS8wLjUzLjEgXAog
ICAgIGNyYXRlOi8vY3JhdGVzLmlvL3dpbmRvd3NfaTY4Nl9tc3ZjLzAuNTIuNiBcCi0gICAgY3Jh
dGU6Ly9jcmF0ZXMuaW8vd2luZG93c19pNjg2X21zdmMvMC41My4xIFwKICAgICBjcmF0ZTovL2Ny
YXRlcy5pby93aW5kb3dzX3g4Nl82NF9nbnUvMC41Mi42IFwKLSAgICBjcmF0ZTovL2NyYXRlcy5p
by93aW5kb3dzX3g4Nl82NF9nbnUvMC41My4xIFwKICAgICBjcmF0ZTovL2NyYXRlcy5pby93aW5k
b3dzX3g4Nl82NF9nbnVsbHZtLzAuNTIuNiBcCi0gICAgY3JhdGU6Ly9jcmF0ZXMuaW8vd2luZG93
c194ODZfNjRfZ251bGx2bS8wLjUzLjEgXAogICAgIGNyYXRlOi8vY3JhdGVzLmlvL3dpbmRvd3Nf
eDg2XzY0X21zdmMvMC41Mi42IFwKLSAgICBjcmF0ZTovL2NyYXRlcy5pby93aW5kb3dzX3g4Nl82
NF9tc3ZjLzAuNTMuMSBcCiAgICAgY3JhdGU6Ly9jcmF0ZXMuaW8vd2lubm93LzEuMC4zIFwKICAg
ICBjcmF0ZTovL2NyYXRlcy5pby93aXQtYmluZGdlbi8wLjUxLjAgXAogICAgIGNyYXRlOi8vY3Jh
dGVzLmlvL3dpdC1iaW5kZ2VuLWNvcmUvMC41MS4wIFwKQEAgLTMxOSw3ICszMDksNyBAQCBTUkNf
VVJJW2FyY3N0ci0xLjIuMC5zaGEyNTZzdW1dID0gIjAzOTE4YzNkYmQ3NzAxYTg1YzZiOTg4Nzcz
MmUyOTIxMTc1ZjI2YzM1MGI0NQogU1JDX1VSSVthcnJheXZlYy0wLjcuNi5zaGEyNTZzdW1dID0g
IjdjMDJkMTIzZGYwMTdlZmNkZmJkNzM5ZWY4MTczNWIzNmM1YmE4M2VjM2M1OWM4MGE5ZDdlY2M3
MThmOTJlNTAiCiBTUkNfVVJJW2FzdHJhbC10b2tpby10YXItMC42LjIuc2hhMjU2c3VtXSA9ICJj
YjUwYTdhYWU4NGEwM2JmNTViMDY3ODMyYmMzNzZmNDk2MWI3OTBjOTdlNjRkM2VhY2VlOTdkMzg5
YjkwMjc3IgogU1JDX1VSSVthc3RyYWwtdmVyc2lvbi1yYW5nZXMtMC4xLjQuc2hhMjU2c3VtXSA9
ICIzMTk3OWJjMzA1NjEwMjQ2ZDc4YWMwMWQ2MzQ2N2ExMmQ4NDU0YzZlM2I4YjIyYjU4MTFkMzQz
YTExOThkZmJiIgotU1JDX1VSSVthc3RyYWxfYXN5bmNfemlwLTAuMC4xOC1yYzQuc2hhMjU2c3Vt
XSA9ICI5ZDUyMzIzMWE0MzM5MzA3Yzc2OTlhYTVkOTQ5MmZlNjg3MzkwNmFmZWZjOWQ3ODUzYjVl
N2ZmYmZlZTNjN2YxIgorU1JDX1VSSVthc3RyYWxfYXN5bmNfemlwLTAuMC4xOC5zaGEyNTZzdW1d
ID0gImMxNWZjNWI1OTFmMTlkZmJiYmNlNzM2NjE1OTA4ZDc0ZjFkOTI1MmJiMzRiMjMxODczY2I5
OTVmMmE5OTdmZmIiCiBTUkNfVVJJW2FzeW5jLWNvbXByZXNzaW9uLTAuNC4xOS5zaGEyNTZzdW1d
ID0gIjA2NTc1ZTZhOTY3MzU4MGY1MjY2MWM5MjEwN2JhYWJmZmJmNDFlMjE0MTM3MzQ0MWNiY2Rj
NDdjYjczMzAwM2MiCiBTUkNfVVJJW2F1dG9jZmctMS41LjAuc2hhMjU2c3VtXSA9ICJjMDg2MDZm
OGMzY2JmNGNlNmVjOGUyOGZiMDAxNGEyYzA4NjcwOGZlOTU0ZWFhODg1Mzg0YTYxNjUxNzJlN2U4
IgogU1JDX1VSSVtiYWNrb24tMS42LjAuc2hhMjU2c3VtXSA9ICJjZmZiMGU5MzE4NzViNjY2ZmM0
ZmNiMjBmZWU1MmU5YmJkMWVmODM2ZmQ5ZTllMDRlYzIxNTU1ZjlmODVmN2VmIgpAQCAtMzUzLDcg
KzM0Myw3IEBAIFNSQ19VUklbZGlnZXN0LTAuMTAuNy5zaGEyNTZzdW1dID0gIjllZDlhMjgxZjdi
YzliNzU3NmU2MTQ2OGJhNjE1YTY2YTVjOGNmZGZmNDI0CiBTUkNfVVJJW2Rpc3BsYXlkb2MtMC4y
LjUuc2hhMjU2c3VtXSA9ICI5NzM2OWNiYmMwNDFiYzM2Njk0OWJjNzRkMzQ2NThkNmNkYTU2MjEw
Mzk3MzFjNjMxMDUyMTg5MmEzYTIwYWUwIgogU1JDX1VSSVtkdW5jZS0xLjAuNS5zaGEyNTZzdW1d
ID0gIjkyNzczNTA0ZDU4YzA5M2Y2ZGUyNDU5YWY0YWYzM2ZhYTUxOGMxMzQ1MWViOGYyYjU2OThl
ZDNkMzZlN2M4MTMiCiBTUkNfVVJJW2R5bi1jbG9uZS0xLjAuMjAuc2hhMjU2c3VtXSA9ICJkMDg4
MWVhMTgxYjFkZjczZmY3N2ZmYWFmOWM3NTQ0ZWNjMTFlODJmYmE5YjVmMjdiMjYyYTNjNzNhMzMy
NTU1IgotU1JDX1VSSVtlaXRoZXItMS4xNS4wLnNoYTI1NnN1bV0gPSAiNDhjNzU3OTQ4YzVlZGUw
ZTQ2MTc3YjdhZGQyZTY3MTU1ZjcwZTMzYzA3ZmVhODI4NGRmNjU3NmRhNzBiMzcxOSIKK1NSQ19V
UklbZWl0aGVyLTEuMTYuMC5zaGEyNTZzdW1dID0gIjkxNjIyZmY1ZTcxNjIwMTgxMDFmMmZlYTQw
ZDZlYmY0YTc4YmJlNWE0OTczNmEyMDIwNjQ5ZWRmOTY5MzY3OWUiCiBTUkNfVVJJW2VuY29kZV91
bmljb2RlLTEuMC4wLnNoYTI1NnN1bV0gPSAiMzRhYTczNjQ2ZmZiMDA2YjhmNTE0N2YzZGMxODJi
ZDRiY2IxOTAyMjdjZTg2MWZjNGE0ODQ0YmY4ZTNjYjJjMCIKIFNSQ19VUklbZW5jb2RpbmdfcnMt
MC44LjM1LnNoYTI1NnN1bV0gPSAiNzUwMzBmM2M0ZjQ1ZGFmZDc1ODZkZDY3ODA5NjVhOGM3ZThl
Mjg1YTVlY2I4NjcxM2U2M2E3OWM1YjI3NjZmMyIKIFNSQ19VUklbZW5jb2RpbmdfcnNfaW8tMC4x
Ljcuc2hhMjU2c3VtXSA9ICIxY2MzYzU2NTFmYjYyYWI4YWEzMTAzOTk4ZGFkZTU3ZWZkZDAyODU0
NGJkMzAwNTE2YmFhMzE4NDBjMjUyYTgzIgpAQCAtNDA2LDggKzM5Niw4IEBAIFNSQ19VUklbaW5z
dGEtMS40Ny4yLnNoYTI1NnN1bV0gPSAiN2I0YTYyNDhlYjkzYTQ0MDFlZDJmMzdkZmU4ZWE1OTJk
M2NmMDViN2NmNGY4CiBTUkNfVVJJW2lzX3Rlcm1pbmFsX3BvbHlmaWxsLTEuNzAuMi5zaGEyNTZz
dW1dID0gImE2Y2IxMzhiYjc5YTE0NmMxYmQ0NjAwMDU2MjNlMTQyZWYwMTgxZTNkMDIxOWNiNDkz
ZTAyZjdkMDhhMzU2OTUiCiBTUkNfVVJJW2l0ZXJ0b29scy0wLjE0LjAuc2hhMjU2c3VtXSA9ICIy
YjE5MmM3ODIwMzdmYWRkOWNmYTc1NTQ4MzEwNDg4YWFiZGJmM2QyZGE3Mzg4NWIzMWJkMGFiZDAz
MzUxMjg1IgogU1JDX1VSSVtpdG9hLTEuMC4xNy5zaGEyNTZzdW1dID0gIjkyZWNjNjYxODE4MWRl
ZjA0NTczOTJjY2QwZWU1MTE5OGUwNjVlMDE2ZDFkNTI3YTdhYzFiNmRjN2MxZjA5ZDIiCi1TUkNf
VVJJW2ppZmYtMC4yLjI0LnNoYTI1NnN1bV0gPSAiZjAwYjVkYmQ2MjBkNjFkZmRjYjYwMDdjOWMx
ZjYwNTRlYmQ3NTMxOWYxNjNkODg2YTkwNTVjZWMxMTU1MDczZCIKLVNSQ19VUklbamlmZi1zdGF0
aWMtMC4yLjI0LnNoYTI1NnN1bV0gPSAiZTAwMGRlMDMwZmY4MDIyZWExZGEzZjQ2NmZiYjBmM2E4
MDlmNWU1MWVkMzFmNmRkOTMxYzM1MTgxYWQ4ZTZkNyIKK1NSQ19VUklbamlmZi0wLjIuMjguc2hh
MjU2c3VtXSA9ICI0NjAzZDMwMzNlNDllMmIwZTMxMjI5ZmNhYjIwYTVkNDAwODljNjA3ZDk3NWNk
OWM4MDU1MWRjNjllZWQ5MTAyIgorU1JDX1VSSVtqaWZmLXN0YXRpYy0wLjIuMjguc2hhMjU2c3Vt
XSA9ICI3ODJkMzIzNzhkZGRmMjA3MTkzYWM5MWNlZmI4NDhhZDQxYWJiNTgxOTVjOTUxNjhlMTI5
MTIyN2EwODMyYjQ3IgogU1JDX1VSSVtqaWZmLXR6ZGItMC4xLjYuc2hhMjU2c3VtXSA9ICJjOTAw
ZWY4NDgyNmYxMzM4YTU1NzY5N2RjOGZjNjAxZGY5Y2E5YWY0YWMxMzdjN2ZiNjFkNGM2ZjJkZmQz
MDc2IgogU1JDX1VSSVtqaWZmLXR6ZGItcGxhdGZvcm0tMC4xLjMuc2hhMjU2c3VtXSA9ICI4NzVh
NWE2OWFjMmJhYjFhODkxNzExY2Y1ZWNjYmVjMWNlMDM0MWVhODA1NTYwZGNkOTBiN2EyZTkyNTEz
MmU4IgogU1JDX1VSSVtqb2JzZXJ2ZXItMC4xLjM0LnNoYTI1NnN1bV0gPSAiOWFmYjNkZTQzOTVk
NmIzZTY3YTc4MGI2ZGU2NGI1MWM5NzhlY2YxMWNiOWE0NjJjNjZiZTdkNGNhOTAzOWQzMyIKQEAg
LTQxNSw3ICs0MDUsNyBAQCBTUkNfVVJJW2pzLXN5cy0wLjMuOTEuc2hhMjU2c3VtXSA9ICJiNDk3
MTViNzA3M2YzODViYTRiYzUyOGU1NzQ3ZDAyZTY2Y2IzOWM2MTQ2ZQogU1JDX1VSSVtqdW5jdGlv
bi0yLjAuMC5zaGEyNTZzdW1dID0gIjE2MGYyZWFkZTA5N2YzMDI2M2I1NDhhYWU1ZGViMTJhZDM0
OWM5MDliYWE3MTBmYTI0YjkyYzkwOTBiMmUwMDYiCiBTUkNfVVJJW2xhenlfc3RhdGljLTEuNS4w
LnNoYTI1NnN1bV0gPSAiYmJkMmJjYjRjOTYzZjJkZGFlMDZhMmVmYzdlOWYzNTkxMzEyNDczYzUw
YzY2ODVlMWYyOTgwNjgzMTZlNjZmZSIKIFNSQ19VUklbbGViMTI4Zm10LTAuMS4wLnNoYTI1NnN1
bV0gPSAiMDllZGQ5ZThiNTRlNDllNTg3ZTRmNjI5NWE3ZDI5YzNlYTk0ZDQ2OWNiNDBhYjhjYTcw
YjI4ODI0OGE4MWRiMiIKLVNSQ19VUklbbGliYy0wLjIuMTgzLnNoYTI1NnN1bV0gPSAiYjViNjQ2
NjUyYmY2NjYxNTk5ZTFkYTg5MDFiM2I5NTIyODk2ZjAxZTczNmJhZDVmNzIzZmU3YTNhMjdmODk5
ZCIKK1NSQ19VUklbbGliYy0wLjIuMTg2LnNoYTI1NnN1bV0gPSAiNjhhYjkxMDE3ZmUxNmM2MjI0
ODY4NDBlNGM4M2M5YTM3YWZlZmY5NzhiZDIzOWI1MjkzZDYxZWNlNTg3ZGU2NiIKIFNSQ19VUklb
bGludXgtcmF3LXN5cy0wLjEyLjEuc2hhMjU2c3VtXSA9ICIzMmE2Njk0OWUwMzBkYTAwZThjN2Q0
NDM0YjI1MTY3MGE5MTU1NmY0MTQ0OTQxZDM3NDUyNzY5YzI1ZDU4YTUzIgogU1JDX1VSSVtsaXRl
bWFwLTAuOC4xLnNoYTI1NnN1bV0gPSAiNjM3MzYwN2E1OWYwYmU3M2EzOWI2ZmU0NTZiODE5MmZj
YzM1ODVmNjAyYWYyMDc1MTYwMGU5NzRkZDQ1NWU3NyIKIFNSQ19VUklbbG9ja19hcGktMC40LjE0
LnNoYTI1NnN1bV0gPSAiMjI0Mzk5ZTc0Yjg3YjVmMzU1NzUxMWQ5OGRmZjhiMTQwODliM2RhZGFm
Y2FiNmJiOTNlYWI2N2QzYWFjZTk2NSIKQEAgLTQyMyw3ICs0MTMsNyBAQCBTUkNfVVJJW2xvZy0w
LjQuMjkuc2hhMjU2c3VtXSA9ICI1ZTUwMzJlMjQwMTkwNDVjNzYyZDNjMGYyOGY1YjZiOGJiZjM4
NTYzYTY1OTA4MwogU1JDX1VSSVtsem1hLXN5cy0wLjEuMjAuc2hhMjU2c3VtXSA9ICI1ZmRhMDRh
YjM3NjRlNmNkZTc4Yjk5NzRlZWM0Zjc3OWFjYWJhN2M0ZTg0YjM2ZWNhM2NmNzdjNTgxYjg1ZDI3
IgogU1JDX1VSSVttYWlscGFyc2UtMC4xNi4xLnNoYTI1NnN1bV0gPSAiNjA4MTlhOTdkZGNiODMx
YTU2MTRlYjNiMDE3NGYzNjIwZTc5M2U5N2UwOTE5NWEzOTViZmE5NDhmZDY4ZWQyZiIKIFNSQ19V
UklbbWF0Y2hlcnMtMC4yLjAuc2hhMjU2c3VtXSA9ICJkMTUyNWEyYTI4YzdmNGZhMGZjOThiYjkx
YWU3NTVkMWUyZDE1MDUwNzllMDU1MzllMzViYzg3NmI1ZDY1YWU5IgotU1JDX1VSSVttZW1jaHIt
Mi44LjAuc2hhMjU2c3VtXSA9ICJmOGNhNThmNDQ3ZjA2ZWQxN2Q1ZmM0MDQzY2UxYjEwZGQyMDVl
MDYwZmIzY2U1Yjk3OWI4ZWQ4ZTU5ZmYzZjc5IgorU1JDX1VSSVttZW1jaHItMi44LjEuc2hhMjU2
c3VtXSA9ICI2Yjk0N2FlNDlkYjBkMjIyYjFkYmM2YjExM2NlNzI0OGEzZmMzYTZjYTIxYjY5Njcx
N2JmYzAwMGJhNDQ4NGQ4IgogU1JDX1VSSVttaW5pel9veGlkZS0wLjguOS5zaGEyNTZzdW1dID0g
IjFmYTc2YTJjODZmNzA0YmRiMjIyZDY2OTY1ZmIzZDYzMjY5Y2UzODUxOGI4M2NiMDU3NWZjYTg1
NWViYjYzMTYiCiBTUkNfVVJJW21pby0xLjIuMC5zaGEyNTZzdW1dID0gIjUwYjdlNWIyN2FhMDJh
NzRiYWM4YzNmMjNmNDQ4ZjhkODdmZjExZjkyZDNhYWMxYTZlZDM2OWVlMDhjYzU2YzEiCiBTUkNf
VVJJW211bmdlLTAuNC43LnNoYTI1NnN1bV0gPSAiNWUxNzQwMWYyNTllYmE5NTZjYTE2NDkxNDYx
YjZlOGY3MjkxM2EwYTExNGUzOTczNmNlNDA0NDEwZjkxNWEwYyIKQEAgLTQ4Myw3ICs0NzMsNyBA
QCBTUkNfVVJJW3NlcmRlLXVudGFnZ2VkLTAuMS45LnNoYTI1NnN1bV0gPSAiZjlmYWY0OGE0YTJk
MjY5M2JlMjRjNjI4OWRiZTI2NTUyNzc2ZQogU1JDX1VSSVtzZXJkZV9jb3JlLTEuMC4yMjguc2hh
MjU2c3VtXSA9ICI0MWQzODVjN2Q0Y2E1OGU1OWZjNzMyYWYyNWMzOTgzYjY3YWM4NTJjMWEyNTAw
MGFmZTExNzVkZTQ1OGI2N2FkIgogU1JDX1VSSVtzZXJkZV9kZXJpdmUtMS4wLjIyOC5zaGEyNTZz
dW1dID0gImQ1NDBmMjIwZDMxODcxNzNkYTIyMGY4ODVhYjY2NjA4MzY3YjY1NzRlOTI1MDExYTkz
NTNlNGJhZGRhOTFkNzkiCiBTUkNfVVJJW3NlcmRlX2Rlcml2ZV9pbnRlcm5hbHMtMC4yOS4xLnNo
YTI1NnN1bV0gPSAiMThkMjZhMjBhOTY5YjllM2ZkZjJmYzJkOWYyMWVkYTZjNDBlMmRlODRjOTQw
OGJiNWQzYjA1ZDQ5OWFhZTcxMSIKLVNSQ19VUklbc2VyZGVfanNvbi0xLjAuMTQ5LnNoYTI1NnN1
bV0gPSAiODNmYzAzOTQ3M2M1NTk1YWNlODYwZDhjNGZhZmEyMjBmZjQ3NGIzZmM2YmZkYjQyOTMz
MjdmMWEzN2U5NGQ4NiIKK1NSQ19VUklbc2VyZGVfanNvbi0xLjAuMTUwLnNoYTI1NnN1bV0gPSAi
ZTgwMTRlNDRiNDczNmVkMDUzOGFkZWVjZGVkMGZjZTJhMjcyZjIyZGM5NTc4YTdlYjZiMmQ5OTkz
Yzc0Y2ZiOSIKIFNSQ19VUklbc2VyZGVfc3Bhbm5lZC0xLjEuMS5zaGEyNTZzdW1dID0gIjY2NjJi
NTg3OTUxMWUwNmU4OTk5YThhMjM1ZDg0ODExM2U5NDJjOTEyNGYyMTE1MTFiMTY0NjZlZTI5OTVm
MjYiCiBTUkNfVVJJW3NoYTItMC4xMC45LnNoYTI1NnN1bV0gPSAiYTc1MDdkODE5NzY5ZDAxYTM2
NWFiNzA3Nzk0YTQwODQzOTJjODI0ZjU0YTdhNmE3ODYyZjhjM2QwODkyYjI4MyIKIFNSQ19VUklb
c2hhcmRlZC1zbGFiLTAuMS43LnNoYTI1NnN1bV0gPSAiZjQwY2EzYzQ2ODIzNzEzZTBkNDIwOTU5
MmU4ZDZlODI2YWE1N2U5MjhmMDk3NTI2MTlmYzY5NmM0OTk2MzdmNiIKQEAgLTUwMiw3ICs0OTIs
NyBAQCBTUkNfVVJJW3N5bi0yLjAuMTE3LnNoYTI1NnN1bV0gPSAiZTY2NWI4ODAzZTdiMWQyYTcy
N2Y0MDIzNDU2YmJiYmU3NGRhNjcwOTljNTg1MgogU1JDX1VSSVtzeW5zdHJ1Y3R1cmUtMC4xMy4y
LnNoYTI1NnN1bV0gPSAiNzI4YTcwZjNkYmFmNWJhYjdmMGM0YjFhYzhkN2FlNWVhNjBhNGI1NTQ5
YzhhNTkxNDM2MWM5OTE0N2E3MDlkMiIKIFNSQ19VUklbdGVtcC1lbnYtMC4zLjYuc2hhMjU2c3Vt
XSA9ICI5NjM3NDg1NTA2OGY0NzQwMmMzMTIxYzZlZWQ4OGQyOWNiMWRlOGYzYWIyNzA5MGUyNzNl
NDIwYmRhYmNmMDUwIgogU1JDX1VSSVt0ZW1wZmlsZS0zLjI3LjAuc2hhMjU2c3VtXSA9ICIzMjQ5
N2U5YTRjN2IzODUzMmVmY2RlYmVlZjg3OTcwN2FhOWY3OTQyOTZhNGYwMjQ0ZjZmNjllOWJjODU3
NGJkIgotU1JDX1VSSVt0ZXJtaW5hbF9zaXplLTAuNC4zLnNoYTI1NnN1bV0gPSAiNjBiOGNiOTc5
Y2IxMWMzMmNlMTYwM2Y4MTM3YjIyMjYyYTlkMTMxYWFhNWMzN2I1Njc4MDI1ZjIyYjhiZWNkMCIK
K1NSQ19VUklbdGVybWluYWxfc2l6ZS0wLjQuNC5zaGEyNTZzdW1dID0gIjIzMGExYjgyMWNjYmQ3
NWIxODU4MjBhMWYxZmY3YjE0ZDIxZGExZTQ0MmUyMmMwODYzZWE1ZjA4NzcxYTg4NzQiCiBTUkNf
VVJJW3RleHR3cmFwLTAuMTYuMi5zaGEyNTZzdW1dID0gImMxMzU0NzYxNWE0NGRjOWM0NTJhOGE1
MzQ2MzhhY2RmMDcxMjBkNGI2ODQ3YzgxNzg3MDVkYTA2MzA2YTMwNTciCiBTUkNfVVJJW3RoaXNl
cnJvci0yLjAuMTguc2hhMjU2c3VtXSA9ICI0Mjg4YjViY2JjNzkyMGMwN2ExMTQ5YTM1Y2Y5NTkw
YTJhYTgwOGUwYmMxZWFmYWFkZTBiODA5NDc4NjVmYmM0IgogU1JDX1VSSVt0aGlzZXJyb3ItaW1w
bC0yLjAuMTguc2hhMjU2c3VtXSA9ICJlYmM0ZWU3ZjY3NjcwZTliNjRkMDVmYTQyNTNlNzUzZTAx
NmM2Yzk1ZmYzNWI4OWI3OTQxZDZiODU2ZGVjMWQ1IgpAQCAtNTE2LDcgKzUwNiw3IEBAIFNSQ19V
UklbdG9raW8tc3RyZWFtLTAuMS4xOC5zaGEyNTZzdW1dID0gIjMyZGE0OTgwOWFhYjVjM2JjNjc4
YWYwMzkwMmQ0Y2NkZGVhMmE4CiBTUkNfVVJJW3Rva2lvLXV0aWwtMC43LjE4LnNoYTI1NnN1bV0g
PSAiOWFlOWNlYzgwNWIwMWU4ZmMzZmQyZmUyODlmODkxNDlhOWI2NmRkMTY3ODZhYmQ4YjE5Y2Zh
N2I0OGNiMDA5OCIKIFNSQ19VUklbdG9tbC0xLjEuMitzcGVjLTEuMS4wLnNoYTI1NnN1bV0gPSAi
ODFmM2QxNWU4NGNiY2Q4OTYzNzZlNjczMDMxNGQ1OWZiNWE4N2YzMWU0YjAzODQ1NDE4NDQzNWNk
NTdkZWZlZSIKIFNSQ19VUklbdG9tbF9kYXRldGltZS0xLjEuMStzcGVjLTEuMS4wLnNoYTI1NnN1
bV0gPSAiMzE2NWY2NWY2MmUyOGUwMTE1YTAwYjJlYmRkMzdlYjZmM2I2NDE4NTVmOWQ2MzZkM2Nk
NDEwMzc2NzE1OWFkNyIKLVNSQ19VUklbdG9tbF9lZGl0LTAuMjUuMTErc3BlYy0xLjEuMC5zaGEy
NTZzdW1dID0gIjBiNTljNGQyMmVkNDQ4MzM5NzQ2YzU5YjkwNWQyNDU2OGZjYmIzYWI2NWE1MDA0
OTRmN2I4YzNlOTc3MzlmMmIiCitTUkNfVVJJW3RvbWxfZWRpdC0wLjI1LjEyK3NwZWMtMS4xLjAu
c2hhMjU2c3VtXSA9ICJkMjE1M2VkYzY5NTVhNmMzNTRmYWQ4ZjVlZmQzOGI2YTg3NjliZGNjZjlm
ZTUwZjhlMTMyOWY4MWIwYmFhNWQ3IgogU1JDX1VSSVt0b21sX3BhcnNlci0xLjEuMitzcGVjLTEu
MS4wLnNoYTI1NnN1bV0gPSAiYTJhYmU5Yjg2MTkzNjU2NjM1ZDI0MTFkYzQzMDUwMjgyY2E0OGFh
MzFjMjQ1MTIxMGY0MjAyNTUwYWZiNzUyNiIKIFNSQ19VUklbdG9tbF93cml0ZXItMS4xLjErc3Bl
Yy0xLjEuMC5zaGEyNTZzdW1dID0gIjc1NmRhZjliMTAxM2ViZTQ3YTg3NzY2NjdiNDY2NDE3ZTJk
NGM1Njc5ZDQ0MWMyNjIzMGVmZDllZjc4NjkyZGIiCiBTUkNfVVJJW3RyYWNpbmctMC4xLjQ0LnNo
YTI1NnN1bV0gPSAiNjNlNzE2NjJmYTRiMmEyYzNhMjZmNTcwZjAzN2ViOTViYjFmODUzOTdmM2Nk
ODA3NmNhZWQyZjAyNmE2ZDEwMCIKQEAgLTUzNyw3ICs1MjcsNyBAQCBTUkNfVVJJW3Vuc2Nhbm55
LTAuMS4wLnNoYTI1NnN1bV0gPSAiZTlkZjJhZjA2N2E3OTUzZTljMzgzMTMyMGYzNWMxY2MwNjAw
YzMwZDQ0ZAogU1JDX1VSSVt1cmwtMi41Ljguc2hhMjU2c3VtXSA9ICJmZjY3YThhNDM5NzM3M2Mz
ZWY2NjA4MTJhY2FiMzI2ODIyMjAzNTAxMGFiODY4MGVjNDIxNWYzOGJhM2QwZWVkIgogU1JDX1VS
SVt1dGY4X2l0ZXItMS4wLjQuc2hhMjU2c3VtXSA9ICJiNmMxNDA2MjBlN2ZmYmIyMmMyZGVlNTlj
YWZlNjA4NGE1OWI1ZmZjMjdhODg1OWE1ZjBkNDk0YjVkNTJiNmJlIgogU1JDX1VSSVt1dGY4cGFy
c2UtMC4yLjIuc2hhMjU2c3VtXSA9ICIwNmFiZGUzNjExNjU3YWRmNjZkMzgzZjAwYjA5M2Q3ZmFl
Y2M3ZmE1NzA3MWNjZTI1Nzg2NjBjOWYxMDEwODIxIgotU1JDX1VSSVt1dWlkLTEuMjMuMS5zaGEy
NTZzdW1dID0gImRkZDc0YTk2ODcyOThjNjg1OGU5Yjg4ZWM4OTM1ZWM0NWQyMmU4ZmQ1ZTYzOTRm
YTFiZDRlOTlhODc3ODljNzYiCitTUkNfVVJJW3V1aWQtMS4yMy4yLnNoYTI1NnN1bV0gPSAiZDI1
OGI4M2NlZWMyMTAzNDcyN2VjZWU4YzM4MmNmYTZjM2UxMzM2OTliMDc0MmM2NDU3MTgxNGZiNDIw
YzlmNyIKIFNSQ19VUklbdmFsdWFibGUtMC4xLjEuc2hhMjU2c3VtXSA9ICJiYTczZWE5Y2YxNmEy
NWRmMGM4Y2FhMTZjNTFhY2I5MzdkNTcxMmE4NDI5ZGI3OGEzZWUyOWQ1ZGNhY2QzYTY1IgogU1JD
X1VSSVt2ZXJzaW9uX2NoZWNrLTAuOS41LnNoYTI1NnN1bV0gPSAiMGI5MjhmMzNkOTc1ZmM2YWQ5
Zjg2YzhmMjgzODUzYWQyNmJkZDViMTBiN2YxNTQyYWEyZmExNWUyMjg5MTA1YSIKIFNSQ19VUklb
d2Fsa2Rpci0yLjUuMC5zaGEyNTZzdW1dID0gIjI5NzkwOTQ2NDA0ZjkxZDljNWQwNmY5ODc0ZWZk
ZGVhMWRjMDZjNWVmZTk0NTQxYTdkNjg2MzEwOGUzYTVlNGIiCkBAIC01NjUsMjcgKzU1NSwxNyBA
QCBTUkNfVVJJW3dpbmRvd3MtbnVtZXJpY3MtMC4yLjAuc2hhMjU2c3VtXSA9ICI5MTUwYWY2ODA2
NmM0YzVjMDdkZGMwY2UzMDQyMTU1NDc3MQogU1JDX1VSSVt3aW5kb3dzLXJlc3VsdC0wLjMuNC5z
aGEyNTZzdW1dID0gIjU2ZjQyYmQzMzJjYzZjOGVhYzVhZjExM2ZjMGMxZmQ2YThmZDJhYTA4YTAx
MTkzNTg2ODZlNTE2MGQwNTg2YzYiCiBTUkNfVVJJW3dpbmRvd3Mtc3RyaW5ncy0wLjQuMi5zaGEy
NTZzdW1dID0gIjU2ZTZjOTNmM2EwYzNiMzYxNzZjYjEzMjdhNDk1OGEwMzUzZDVkMTY2YzJhMzVj
YjI2OGFjZTE1ZTkxZDNiNTciCiBTUkNfVVJJW3dpbmRvd3Mtc3lzLTAuNTIuMC5zaGEyNTZzdW1d
ID0gIjI4MmJlNWYzNmE4Y2U3ODFmYWQ4YzhhZTE4ZmEzZjliZWZmNTdlYzFiNTJjYjNkZTA3ODky
MDE0MjVkOWEzM2QiCi1TUkNfVVJJW3dpbmRvd3Mtc3lzLTAuNjAuMi5zaGEyNTZzdW1dID0gImYy
ZjUwMGU0ZDI4MjM0ZjcyMDQwOTkwZWM5ZDM5ZTNhNmI5NTBmOWYyMmQzZGJhMTg0MTZjMzU4ODI2
MTJiY2IiCiBTUkNfVVJJW3dpbmRvd3Mtc3lzLTAuNjEuMi5zaGEyNTZzdW1dID0gImFlMTM3MjI5
YmNiZDZjZGYwZjdiODBhMzFkZjYxNzY2MTQ1MDc3ZGRmNDk0MTZhNzI4YjAyY2IzOTIxZmYzZmMi
CiBTUkNfVVJJW3dpbmRvd3MtdGFyZ2V0cy0wLjUyLjYuc2hhMjU2c3VtXSA9ICI5YjcyNGY3Mjc5
NmUwMzZhYjkwYzEwMjFkNDc4MGQ0ZDNkNjQ4YWNhNTllNDkxZTZiOThlNzI1Yjg0ZTk5OTczIgot
U1JDX1VSSVt3aW5kb3dzLXRhcmdldHMtMC41My41LnNoYTI1NnN1bV0gPSAiNDk0NWY5ZjU1MWI4
OGUwZDY1ZjNkYjBiYzI1YzMzYjhhY2VhNGQ5ZTQxMTYzZWRmOTBkY2QwYjE5ZjkwNjlmMyIKIFNS
Q19VUklbd2luZG93cy10aHJlYWRpbmctMC4xLjAuc2hhMjU2c3VtXSA9ICJiNjY0NjNhZDJlMGVh
M2JiZjgwOGI3ZjFkMzcxMzExYzgwZTExNWMwYjcxZDYwZWZjMTQyY2FmYmNmYjA1N2E2IgogU1JD
X1VSSVt3aW5kb3dzX2FhcmNoNjRfZ251bGx2bS0wLjUyLjYuc2hhMjU2c3VtXSA9ICIzMmE0NjIy
MTgwZTdhMGVjMDQ0YmI1NTU0MDRjODAwYmM5ZmQ5ZWMyNjJlYzE0N2VkZDU5ODljY2QwYzAyY2Qz
IgotU1JDX1VSSVt3aW5kb3dzX2FhcmNoNjRfZ251bGx2bS0wLjUzLjEuc2hhMjU2c3VtXSA9ICJh
OWQ4NDE2ZmE4YjQyZjVjOTQ3Zjg0ODJjNDNlN2Q4OWU3M2ExNzNjZWFkNTZkMDQ0ZjZhNTYxMDRh
NmQxYjUzIgogU1JDX1VSSVt3aW5kb3dzX2FhcmNoNjRfbXN2Yy0wLjUyLjYuc2hhMjU2c3VtXSA9
ICIwOWVjMmE3YmIxNTJlMjI1MmI1M2ZhNzgwMzE1MDAwNzg3OTU0OGJjNzA5YzAzOWRmNzYyN2Nh
YmJkMDVkNDY5IgotU1JDX1VSSVt3aW5kb3dzX2FhcmNoNjRfbXN2Yy0wLjUzLjEuc2hhMjU2c3Vt
XSA9ICJiOWQ3ODJlODA0YzJmNjMyZTM5NTcwOGU5OWE5NDI3NTkxMGViOTEwMGIyMTE0NjUxZTA0
NzQ0ZTliMTI1MDA2IgogU1JDX1VSSVt3aW5kb3dzX2k2ODZfZ251LTAuNTIuNi5zaGEyNTZzdW1d
ID0gIjhlOWI1YWQ1YWI4MDJlOTdlYjhlMjk1YWM2NzIwZTUwOWVlNGMyNDNmNjlkNzgxMzk0MDE0
ZWJmZThiYmZhMGIiCi1TUkNfVVJJW3dpbmRvd3NfaTY4Nl9nbnUtMC41My4xLnNoYTI1NnN1bV0g
PSAiOTYwZTZkYTA2OWQ4MWUwOWJlY2IwY2E1N2E2NTIyMGRkZmYwMTZmZjJkNmFmNmEyMjNjZjM3
MmE1MDY1OTNhMyIKIFNSQ19VUklbd2luZG93c19pNjg2X2dudWxsdm0tMC41Mi42LnNoYTI1NnN1
bV0gPSAiMGVlZTUyZDM4YzA5MGIzY2FhNzZjNTYzYjg2YzNhNGJkNzFlZjFhODE5Mjg3YzE5ZDU4
NmQ3MzM0YWU4ZWQ2NiIKLVNSQ19VUklbd2luZG93c19pNjg2X2dudWxsdm0tMC41My4xLnNoYTI1
NnN1bV0gPSAiZmE3MzU5ZDEwMDQ4ZjY4YWI4YjA5ZmE3MWMzZGFjY2ZiMGU5YjU1OWFlZDY0OGE4
Zjk1NDY5YzI3MDU3MTgwYyIKIFNSQ19VUklbd2luZG93c19pNjg2X21zdmMtMC41Mi42LnNoYTI1
NnN1bV0gPSAiMjQwOTQ4YmMwNWM1ZTdjNmRhYmJhMjhiZjg5ZDg5ZmZjZTNlMzAzMDIyODA5ZTcz
ZGVhZWZlNGY2ZWM1NmM2NiIKLVNSQ19VUklbd2luZG93c19pNjg2X21zdmMtMC41My4xLnNoYTI1
NnN1bV0gPSAiMWU3YWM3NTE3OWYxODIzMmZlOWMyODUxNjM1NjVhNTdlZjhkM2M4OTI1NGEzMDY4
NWI1N2Q4M2EzOGQzMjZjMiIKIFNSQ19VUklbd2luZG93c194ODZfNjRfZ251LTAuNTIuNi5zaGEy
NTZzdW1dID0gIjE0N2E1YzgwYWFiZmJmMGM3ZDkwMWNiNTg5NWQxZGUzMGVmMjkwN2ViMjFmYmJh
YjI5Y2E5NGM1YjA4YjFhNzgiCi1TUkNfVVJJW3dpbmRvd3NfeDg2XzY0X2dudS0wLjUzLjEuc2hh
MjU2c3VtXSA9ICI5YzM4NDJjZGQ3NGE4NjVhODA2NmFiMzljOGE3YTQ3M2MwNzc4YTNmMjkzNzBi
NWZkNmI0YjlhYTdkZjRhNDk5IgogU1JDX1VSSVt3aW5kb3dzX3g4Nl82NF9nbnVsbHZtLTAuNTIu
Ni5zaGEyNTZzdW1dID0gIjI0ZDViMjNkYzQxNzQxMjY3OTY4MTM5NmYyYjQ5ZjNkZThjMTQ3M2Rl
YjUxNmJkMzQ0MTA4NzJlZmY1MWVkMGQiCi1TUkNfVVJJW3dpbmRvd3NfeDg2XzY0X2dudWxsdm0t
MC41My4xLnNoYTI1NnN1bV0gPSAiMGZmYTE3OWUyZDA3ZWVlOGFkOGY1NzQ5MzQzNjU2NmM3Y2Mz
MGFjNTM2YTMzNzlmZGYwMDhmNDdmNmJiN2FlMSIKIFNSQ19VUklbd2luZG93c194ODZfNjRfbXN2
Yy0wLjUyLjYuc2hhMjU2c3VtXSA9ICI1ODlmNmRhODRjNjQ2MjA0NzQ3ZDEyNzBhMmE1NjYxZWE2
NmVkMWNjZWQyNjMxZDU0NmZkZmIxNTU5NTlmOWVjIgotU1JDX1VSSVt3aW5kb3dzX3g4Nl82NF9t
c3ZjLTAuNTMuMS5zaGEyNTZzdW1dID0gImQ2YmJmZjVmMGFhZGE0MjdhMWU1YTZkYTVmMWY5ODE1
ODE4MmYyNjU1NmYzNDVhYzllMDRkMzZkMGViZWQ2NTAiCiBTUkNfVVJJW3dpbm5vdy0xLjAuMy5z
aGEyNTZzdW1dID0gIjA1OTJlMWM5ZDE1MWY4NTRlNmZkMzgyNTc0YzNhMDg1NTI1MGUxZDliMmY5
OWQ5MjgxYzZlNjM5MWFmMzUyZjEiCiBTUkNfVVJJW3dpdC1iaW5kZ2VuLTAuNTEuMC5zaGEyNTZz
dW1dID0gImQ3MjQ5MjE5ZjY2Y2VkMDI5NjkzODhjZjJiYjA0NGEwOTc1NmEwODNkMGZhYjFlNTY2
MDU2YjA0ZDlmYmNhYTUiCiBTUkNfVVJJW3dpdC1iaW5kZ2VuLWNvcmUtMC41MS4wLnNoYTI1NnN1
bV0gPSAiZWE2MWRlNjg0YzNlYTY4Y2IwODJiN2E4ODUwOGE4YjI3ZmNjOGI3OTdkNzM4YmZjOTlh
ODJmYWNmMWQ3NTJkYyIKZGlmZiAtLWdpdCBhL21ldGEvcmVjaXBlcy1kZXZ0b29scy9weXRob24v
cHl0aG9uMy11di1idWlsZF8wLjExLjE3LmJiIGIvbWV0YS9yZWNpcGVzLWRldnRvb2xzL3B5dGhv
bi9weXRob24zLXV2LWJ1aWxkXzAuMTEuMjAuYmIKc2ltaWxhcml0eSBpbmRleCA5MiUKcmVuYW1l
IGZyb20gbWV0YS9yZWNpcGVzLWRldnRvb2xzL3B5dGhvbi9weXRob24zLXV2LWJ1aWxkXzAuMTEu
MTcuYmIKcmVuYW1lIHRvIG1ldGEvcmVjaXBlcy1kZXZ0b29scy9weXRob24vcHl0aG9uMy11di1i
dWlsZF8wLjExLjIwLmJiCmluZGV4IDQyNDFmNjY1ODYuLmEzY2Q0ZmU1ZTkgMTAwNjQ0Ci0tLSBh
L21ldGEvcmVjaXBlcy1kZXZ0b29scy9weXRob24vcHl0aG9uMy11di1idWlsZF8wLjExLjE3LmJi
CisrKyBiL21ldGEvcmVjaXBlcy1kZXZ0b29scy9weXRob24vcHl0aG9uMy11di1idWlsZF8wLjEx
LjIwLmJiCkBAIC0xMSw3ICsxMSw3IEBAIExJQ19GSUxFU19DSEtTVU0gPSAiZmlsZTovL0xJQ0VO
U0UtQVBBQ0hFO21kNT04NmQzZjNhOTVjMzI0Yzk0NzliZDg5ODY5NjhmNDMyNyBcCiAgICAgICAg
ICAgICAgICAgICAgIGZpbGU6Ly9jcmF0ZXMvdXYtcGVwNTA4L0xpY2Vuc2UtQXBhY2hlO21kNT1l
MjNmYWRkNmNlZWY4YzYxOGZjMWM2NTE5MWQ4NDZmYSBcCiAgICAgICAgICAgICAgICAgICAgIGZp
bGU6Ly9jcmF0ZXMvdXYtcGVwNTA4L0xpY2Vuc2UtQlNEO21kNT1lZjdhNjAyN2RjNGMyMzg5Yjlh
ZmFkN2U2OTAyNzRjNyIKIAotU1JDX1VSSVtzaGEyNTZzdW1dID0gIjk4ZmQ3MTAyN2JhMTIzMTI2
ZWY1ODZiNjgxZWZlY2U1ZjZlNzFiMDVjM2VhNThjMjc4NjY4NTNiYmExOTY2YjkiCitTUkNfVVJJ
W3NoYTI1NnN1bV0gPSAiMTExYmVlMmNmNWRlMzE0ZDQzYzYwZGQxYWYzNjRjNjI2OGU3M2IzMmQ4
ZjZhYzFlOTQxMjQyZmY1NjA4NjM2NiIKIAogcmVxdWlyZSAke0JQTn0tY3JhdGVzLmluYwogCi0t
IAoyLjQ3LjEKCg==

--===============6628009220276699985==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: attachment; filename="buildhistory-diff.txt"

packages/x86-64-v3-poky-linux/python3-uv-build/python3-uv-build: FILELIST: directory renamed /usr/lib/python3.14/site-packages/uv_build-0.11.17.dist-info -> /usr/lib/python3.14/site-packages/uv_build-0.11.20.dist-info, directory renamed /usr/lib/python3.14/site-packages/uv_build-0.11.17.dist-info/licenses -> /usr/lib/python3.14/site-packages/uv_build-0.11.20.dist-info/licenses
Changes to packages/x86-64-v3-poky-linux/python3-uv-build (sysroot):
  /usr/lib/python3.14/site-packages/uv_build-0.11.17.dist-info moved to /usr/lib/python3.14/site-packages/uv_build-0.11.20.dist-info

--===============6628009220276699985==--

