Received: from a27-192.smtp-out.us-west-2.amazonses.com (a27-192.smtp-out.us-west-2.amazonses.com [54.240.27.192])
 by mx.groups.io with SMTP id smtpd.msgproc01-g2.36493.1795585771568515258
 for <openembedded-core@lists.openembedded.org>;
 Tue, 24 Nov 2026 21:49:31 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@yoctoproject.org header.s=lvjh2tk576v2ro5mi6k4dt3mc6wpqbky header.b=OxKHXzV7;
 dkim=pass header.i=@amazonses.com header.s=hsbnp7p3ensaochzwyq5wwmceodymuwv header.b=jqHcQJUv;
 spf=pass (domain: us-west-2.amazonses.com, ip: 54.240.27.192, mailfrom: 010101a211408541-4912fb35-c73d-4744-acc4-c6321456a41b-000000@us-west-2.amazonses.com)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/simple;
	s=lvjh2tk576v2ro5mi6k4dt3mc6wpqbky; d=yoctoproject.org;
	t=1795585771;
	h=Content-Type:MIME-Version:From:To:Cc:Subject:Message-Id:Date;
	bh=pcz9XCNXpHHBTwmMpDl5bfrWE6z/04kSRoafOF0/0lk=;
	b=OxKHXzV7E7OP43pNtcZCz6SVlWTtwATHy8UJfdUlWbmlEbYpUSywHtPZc7g5sR4u
	LQybpCsT1P98cYi7KynoHSSBSh4AuQyPXI99XgFbIJDLdBamDm5f/M4HWE+0k6dXXy6
	bL441S4/PfiTuTaXLVQr7A81alZg9/O2dvaXZW40=
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/simple;
	s=hsbnp7p3ensaochzwyq5wwmceodymuwv; d=amazonses.com; t=1795585771;
	h=Content-Type:MIME-Version:From:To:Cc:Subject:Message-Id:Date:Feedback-ID;
	bh=pcz9XCNXpHHBTwmMpDl5bfrWE6z/04kSRoafOF0/0lk=;
	b=jqHcQJUvcDahDPO5K+dyx1O6OkeSXGBRp05V4QBs+NabcTNFRmrZxRrJK/ZQ0Eo3
	NJA2gPFMtvdRB0jvN4DqASsrr5l6cVamIHLtlhcCtEvlGbopzZ/+xkY+M1CTkiYTm50
	BuoGp7nITbRzzkT6Lr7o4OgHXy7nEl/j8xjZ7fJc=
Content-Type: multipart/mixed; boundary="===============5692319629430855472=="
MIME-Version: 1.0
From: auh@yoctoproject.org
To: Trevor Gamblin <tgamblin@baylibre.com>
Cc: openembedded-core@lists.openembedded.org
Subject: [AUH] python3-uv-build: upgrading to 0.13.10 SUCCEEDED
Message-ID: <010101a211408541-4912fb35-c73d-4744-acc4-c6321456a41b-000000@us-west-2.amazonses.com>
Date: Wed, 25 Nov 2026 05:49:30 +0000
Feedback-ID: ::1.us-west-2.9np3MYPs3fEaOBysGKSlUD4KtcmPijcmS9Az2Hwf7iQ=:AmazonSES
X-SES-Outgoing: 2026.11.25-54.240.27.192
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by lin-tor-korg-lkml-alma10-1 with HTTPS for <openembedded-core@lists.openembedded.org>; Wed, 25 Nov 2026 05:49:36 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/251156

--===============5692319629430855472==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit

Hello,

this email is a notification from the Auto Upgrade Helper
that the automatic attempt to upgrade the recipe(s) *python3-uv-build* to *0.13.10* has Succeeded.

Next steps:
    - apply the patch: git am 0001-python3-uv-build-upgrade-0.13.8-0.13.10.patch
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
From 3b076b61359523473d8eba6e8dd5f4eedffeafc3 Mon Sep 17 00:00:00 2001
From: Upgrade Helper <auh@yoctoproject.org>
Date: Wed, 25 Nov 2026 05:34:42 +0000
Subject: [PATCH] python3-uv-build: upgrade 0.13.8 -> 0.13.10

---
 .../python/python3-uv-build-crates.inc        | 56 +++++++++----------
 ..._0.13.8.bb => python3-uv-build_0.13.10.bb} |  2 +-
 2 files changed, 29 insertions(+), 29 deletions(-)
 rename meta/recipes-devtools/python/{python3-uv-build_0.13.8.bb => python3-uv-build_0.13.10.bb} (92%)

diff --git a/meta/recipes-devtools/python/python3-uv-build-crates.inc b/meta/recipes-devtools/python/python3-uv-build-crates.inc
index 5354010b43..d4c45cf709 100644
--- a/meta/recipes-devtools/python/python3-uv-build-crates.inc
+++ b/meta/recipes-devtools/python/python3-uv-build-crates.inc
@@ -17,7 +17,7 @@ SRC_URI += " \
     crate://crates.io/astral-mail-headers/0.0.1 \
     crate://crates.io/astral-tokio-tar/0.7.1 \
     crate://crates.io/astral-version-ranges/0.2.3 \
-    crate://crates.io/astral_async_zip/0.0.22 \
+    crate://crates.io/astral_async_zip/0.0.24 \
     crate://crates.io/async-compression/0.4.50 \
     crate://crates.io/autocfg/1.5.0 \
     crate://crates.io/backon/1.6.0 \
@@ -46,7 +46,7 @@ SRC_URI += " \
     crate://crates.io/console/0.16.6 \
     crate://crates.io/cpufeatures/0.2.17 \
     crate://crates.io/cpufeatures/0.3.0 \
-    crate://crates.io/crc32fast/1.5.2 \
+    crate://crates.io/crc32fast/1.5.3 \
     crate://crates.io/crypto-common/0.1.7 \
     crate://crates.io/crypto-common/0.2.2 \
     crate://crates.io/csv/1.4.0 \
@@ -118,7 +118,7 @@ SRC_URI += " \
     crate://crates.io/js-sys/0.3.91 \
     crate://crates.io/junction/2.1.0 \
     crate://crates.io/lazy_static/1.5.0 \
-    crate://crates.io/libc/0.2.189 \
+    crate://crates.io/libc/0.2.191 \
     crate://crates.io/linux-raw-sys/0.12.1 \
     crate://crates.io/litemap/0.8.1 \
     crate://crates.io/lock_api/0.4.14 \
@@ -174,8 +174,8 @@ SRC_URI += " \
     crate://crates.io/rustversion/1.0.22 \
     crate://crates.io/ryu/1.0.23 \
     crate://crates.io/same-file/1.0.6 \
-    crate://crates.io/schemars/1.2.2 \
-    crate://crates.io/schemars_derive/1.2.2 \
+    crate://crates.io/schemars/1.2.3 \
+    crate://crates.io/schemars_derive/1.2.3 \
     crate://crates.io/scopeguard/1.2.0 \
     crate://crates.io/seahash/4.1.0 \
     crate://crates.io/self-replace/1.5.0 \
@@ -183,8 +183,8 @@ SRC_URI += " \
     crate://crates.io/serde_core/1.0.229 \
     crate://crates.io/serde_derive/1.0.229 \
     crate://crates.io/serde_derive_internals/0.30.0 \
-    crate://crates.io/serde_json/1.0.151 \
-    crate://crates.io/serde_spanned/1.1.1 \
+    crate://crates.io/serde_json/1.0.154 \
+    crate://crates.io/serde_spanned/1.1.3 \
     crate://crates.io/sha2/0.10.9 \
     crate://crates.io/sha2/0.11.0 \
     crate://crates.io/sharded-slab/0.1.7 \
@@ -193,7 +193,7 @@ SRC_URI += " \
     crate://crates.io/simdutf8/0.1.5 \
     crate://crates.io/similar/2.7.0 \
     crate://crates.io/slab/0.4.12 \
-    crate://crates.io/smallvec/1.16.2 \
+    crate://crates.io/smallvec/1.16.4 \
     crate://crates.io/smawk/0.3.2 \
     crate://crates.io/socket2/0.6.3 \
     crate://crates.io/spdx/0.13.6 \
@@ -201,7 +201,7 @@ SRC_URI += " \
     crate://crates.io/strip-ansi-escapes/0.2.1 \
     crate://crates.io/strsim/0.11.1 \
     crate://crates.io/syn/2.0.118 \
-    crate://crates.io/syn/3.0.6 \
+    crate://crates.io/syn/3.0.9 \
     crate://crates.io/synstructure/0.13.2 \
     crate://crates.io/tar-codec/0.0.16 \
     crate://crates.io/tar-framing/0.0.16 \
@@ -215,12 +215,12 @@ SRC_URI += " \
     crate://crates.io/tinystr/0.8.2 \
     crate://crates.io/tinyvec/1.11.0 \
     crate://crates.io/tinyvec_macros/0.1.1 \
-    crate://crates.io/tokio/1.53.2 \
+    crate://crates.io/tokio/1.54.1 \
     crate://crates.io/tokio-macros/2.7.0 \
     crate://crates.io/tokio-stream/0.1.19 \
-    crate://crates.io/toml/1.1.6+spec-1.1.0 \
-    crate://crates.io/toml_datetime/1.1.1+spec-1.1.0 \
-    crate://crates.io/toml_edit/0.25.15+spec-1.1.0 \
+    crate://crates.io/toml/1.1.8+spec-1.1.0 \
+    crate://crates.io/toml_datetime/1.1.3+spec-1.1.0 \
+    crate://crates.io/toml_edit/0.25.17+spec-1.1.0 \
     crate://crates.io/toml_parser/1.1.5+spec-1.1.0 \
     crate://crates.io/toml_writer/1.1.3+spec-1.1.0 \
     crate://crates.io/tracing/0.1.44 \
@@ -238,7 +238,7 @@ SRC_URI += " \
     crate://crates.io/url/2.5.8 \
     crate://crates.io/utf8_iter/1.0.4 \
     crate://crates.io/utf8parse/0.2.2 \
-    crate://crates.io/uuid/1.28.0 \
+    crate://crates.io/uuid/1.29.0 \
     crate://crates.io/valuable/0.1.1 \
     crate://crates.io/version_check/0.9.5 \
     crate://crates.io/vte/0.14.1 \
@@ -313,7 +313,7 @@ SRC_URI[arrayvec-0.7.8.sha256sum] = "d3fb67a6e08acf24fdeccbac2cb6ac4305825bd1f11
 SRC_URI[astral-mail-headers-0.0.1.sha256sum] = "dc019ecca82cfc91ffa31ab4ffe705aaa706399840a7152926b7eee736da410a"
 SRC_URI[astral-tokio-tar-0.7.1.sha256sum] = "821ed36daf7c40d00a7b62759f9833fb279fb7c87dd989ec0a4d626dcd8d1dca"
 SRC_URI[astral-version-ranges-0.2.3.sha256sum] = "b315acc4dc7f0d3ccdd557a01b6a89fa2d896e99a450b98e829fc8152f0b2f98"
-SRC_URI[astral_async_zip-0.0.22.sha256sum] = "0f8508d09c6bc6abd42767d1d43c7702891691484875ce94f7997da1301d95e9"
+SRC_URI[astral_async_zip-0.0.24.sha256sum] = "adefb98234d90e98944c7b952ad0882ccd9009f9a8fe65d086f199fc49a3f19f"
 SRC_URI[async-compression-0.4.50.sha256sum] = "ee19bd99b43e3691acbad4e840420a4881cea6c0b66a208125a824f8fd53f5a1"
 SRC_URI[autocfg-1.5.0.sha256sum] = "c08606f8c3cbf4ce6ec8e28fb0014a2c086708fe954eaa885384a6165172e7e8"
 SRC_URI[backon-1.6.0.sha256sum] = "cffb0e931875b666fc4fcb20fee52e9bbd1ef836fd9e9e04ec21555f9f85f7ef"
@@ -342,7 +342,7 @@ SRC_URI[compression-core-0.4.33.sha256sum] = "6e8ccc4ea9f6acc32d102c0f6d471d11d9
 SRC_URI[console-0.16.6.sha256sum] = "e96a4956774c13c126a8b5af4daa79384f4d826534c95a02d76afb39e2ab64e3"
 SRC_URI[cpufeatures-0.2.17.sha256sum] = "59ed5838eebb26a2bb2e58f6d5b5316989ae9d08bab10e0e6d103e656d1b0280"
 SRC_URI[cpufeatures-0.3.0.sha256sum] = "8b2a41393f66f16b0823bb79094d54ac5fbd34ab292ddafb9a0456ac9f87d201"
-SRC_URI[crc32fast-1.5.2.sha256sum] = "01a7799fd6b852db0e61728dde9a204c423b44d689dbd432522543614b490e78"
+SRC_URI[crc32fast-1.5.3.sha256sum] = "0ba106e844045ddc02c20768ac4b0b7cb45f2cc2ecbd833ac9f5dacb183c2055"
 SRC_URI[crypto-common-0.1.7.sha256sum] = "78c8292055d1c1df0cce5d180393dc8cce0abec0a7102adb6c7b1eef6016d60a"
 SRC_URI[crypto-common-0.2.2.sha256sum] = "ce6e4c961d6cd6c9a86db418387425e8bdeaf05b3c8bc1411e6dca4c252f1453"
 SRC_URI[csv-1.4.0.sha256sum] = "52cd9d68cf7efc6ddfaaee42e7288d3a99d613d4b50f76ce9827ae0c6e14f938"
@@ -414,7 +414,7 @@ SRC_URI[jiff-static-0.2.38.sha256sum] = "2cc9817253cf7c7ee4684451bd327e88d6f3658
 SRC_URI[js-sys-0.3.91.sha256sum] = "b49715b7073f385ba4bc528e5747d02e66cb39c6146efb66b781f131f0fb399c"
 SRC_URI[junction-2.1.0.sha256sum] = "cde48f36530cbd91b65f050101e6c056d6eb743cea2a8f0f19beef69c6742ff8"
 SRC_URI[lazy_static-1.5.0.sha256sum] = "bbd2bcb4c963f2ddae06a2efc7e9f3591312473c50c6685e1f298068316e66fe"
-SRC_URI[libc-0.2.189.sha256sum] = "3eaf3ede3fee6db1a4c2ee091bf8a8b4dccdc6d17f656fb07896ee72867612f2"
+SRC_URI[libc-0.2.191.sha256sum] = "65cd87c9a6d60536580b316ad985726104730a5151c99845f2490428ef91240a"
 SRC_URI[linux-raw-sys-0.12.1.sha256sum] = "32a66949e030da00e8c7d4434b251670a91556f4144941d37452769c25d58a53"
 SRC_URI[litemap-0.8.1.sha256sum] = "6373607a59f0be73a39b6fe456b8192fcc3585f602af20751600e974dd455e77"
 SRC_URI[lock_api-0.4.14.sha256sum] = "224399e74b87b5f3557511d98dff8b14089b3dadafcab6bb93eab67d3aace965"
@@ -470,8 +470,8 @@ SRC_URI[rustix-linux-procfs-0.1.1.sha256sum] = "2fc84bf7e9aa16c4f2c758f27412dc98
 SRC_URI[rustversion-1.0.22.sha256sum] = "b39cdef0fa800fc44525c84ccb54a029961a8215f9619753635a9c0d2538d46d"
 SRC_URI[ryu-1.0.23.sha256sum] = "9774ba4a74de5f7b1c1451ed6cd5285a32eddb5cccb8cc655a4e50009e06477f"
 SRC_URI[same-file-1.0.6.sha256sum] = "93fc1dc3aaa9bfed95e02e6eadabb4baf7e3078b0bd1b4d7b6b0b68378900502"
-SRC_URI[schemars-1.2.2.sha256sum] = "687274d293b6cdc6e73e0fee520bf2049650090d7164f87672d212a3c530cf4a"
-SRC_URI[schemars_derive-1.2.2.sha256sum] = "d98c67716b46af2f0b8cf752abc930f6f9aecfbf671ecfb531db8a31dbe4e2ba"
+SRC_URI[schemars-1.2.3.sha256sum] = "ab508826f74a77ca9d5aba6ff19b522583ee3eaf28a19384ff3d0e5835fadf6e"
+SRC_URI[schemars_derive-1.2.3.sha256sum] = "e1c3a92094fa7d61aa124645844facb6b554dfc797136d0f5fd1f890e2bffc69"
 SRC_URI[scopeguard-1.2.0.sha256sum] = "94143f37725109f92c262ed2cf5e59bce7498c01bcc1502d7b9afe439a4e9f49"
 SRC_URI[seahash-4.1.0.sha256sum] = "1c107b6f4780854c8b126e228ea8869f4d7b71260f962fefb57b996b8959ba6b"
 SRC_URI[self-replace-1.5.0.sha256sum] = "03ec815b5eab420ab893f63393878d89c90fdd94c0bcc44c07abb8ad95552fb7"
@@ -479,8 +479,8 @@ SRC_URI[serde-1.0.229.sha256sum] = "4148590afebada386688f18773da617792bf2ef03ffc
 SRC_URI[serde_core-1.0.229.sha256sum] = "67dca2c9c51e58a4791a4b1ed58308b39c64224d349a935ab5039aa360942a48"
 SRC_URI[serde_derive-1.0.229.sha256sum] = "e7a5d71263a5a7d47b41f6b3f06ba276f10cc18b0931f1799f710578e2309348"
 SRC_URI[serde_derive_internals-0.30.0.sha256sum] = "f852137cce035d6a4df67ccce505ff6b3e9fd3a10e3e52b24dc71e650bb1a9bd"
-SRC_URI[serde_json-1.0.151.sha256sum] = "c841b55ecdae098c80dcae9cf767f6f8a0c2cdb3416bbef72181df4d0fe73f14"
-SRC_URI[serde_spanned-1.1.1.sha256sum] = "6662b5879511e06e8999a8a235d848113e942c9124f211511b16466ee2995f26"
+SRC_URI[serde_json-1.0.154.sha256sum] = "e7e9cc8b1b85264074fbcc02a88680c4096b1e47df8f739dceb03bf482f04bd6"
+SRC_URI[serde_spanned-1.1.3.sha256sum] = "9c187e0a369471c550af028cba56d4f4fa2a489ad28151ae95a4d340a2a8b782"
 SRC_URI[sha2-0.10.9.sha256sum] = "a7507d819769d01a365ab707794a4084392c824f54a7a6a7862f8c3d0892b283"
 SRC_URI[sha2-0.11.0.sha256sum] = "446ba717509524cb3f22f17ecc096f10f4822d76ab5c0b9822c5f9c284e825f4"
 SRC_URI[sharded-slab-0.1.7.sha256sum] = "f40ca3c46823713e0d4209592e8d6e826aa57e928f09752619fc696c499637f6"
@@ -489,7 +489,7 @@ SRC_URI[simd-adler32-0.3.8.sha256sum] = "e320a6c5ad31d271ad523dcf3ad13e2767ad8b1
 SRC_URI[simdutf8-0.1.5.sha256sum] = "e3a9fe34e3e7a50316060351f37187a3f546bce95496156754b601a5fa71b76e"
 SRC_URI[similar-2.7.0.sha256sum] = "bbbb5d9659141646ae647b42fe094daf6c6192d1620870b449d9557f748b2daa"
 SRC_URI[slab-0.4.12.sha256sum] = "0c790de23124f9ab44544d7ac05d60440adc586479ce501c1d6d7da3cd8c9cf5"
-SRC_URI[smallvec-1.16.2.sha256sum] = "f9395f0f0eee849a9b707b2f06bb92a6a422090e2123bb2ef8e87a0e61892a8e"
+SRC_URI[smallvec-1.16.4.sha256sum] = "d0d5d4b1981b8bbbb7aed204cae5726d683d5d6ac7e74ec54122ea28f315e7c8"
 SRC_URI[smawk-0.3.2.sha256sum] = "b7c388c1b5e93756d0c740965c41e8822f866621d41acbdf6336a6a168f8840c"
 SRC_URI[socket2-0.6.3.sha256sum] = "3a766e1110788c36f4fa1c2b71b387a7815aa65f88ce0229841826633d93723e"
 SRC_URI[spdx-0.13.6.sha256sum] = "646c5a367da914e3babcb9cd8e91c37ccaac42325b8f86f036513ad103f2a716"
@@ -497,7 +497,7 @@ SRC_URI[stable_deref_trait-1.2.1.sha256sum] = "6ce2be8dc25455e1f91df71bfa12ad37d
 SRC_URI[strip-ansi-escapes-0.2.1.sha256sum] = "2a8f8038e7e7969abb3f1b7c2a811225e9296da208539e0f79c5251d6cac0025"
 SRC_URI[strsim-0.11.1.sha256sum] = "7da8b5736845d9f2fcb837ea5d9e2628564b3b043a70948a3f0b778838c5fb4f"
 SRC_URI[syn-2.0.118.sha256sum] = "1b9ae57f904213ebb649ce6895b8a66c66f0203b9319718f69a5612a065b1422"
-SRC_URI[syn-3.0.6.sha256sum] = "8593e8e72159ed2257d083c7a454a85cbf854f37a0966d8d483aff8c8a3ebcee"
+SRC_URI[syn-3.0.9.sha256sum] = "d78c8dee4c7bf0e14673097256fed6142ce9d3b85a408189d07482442145823b"
 SRC_URI[synstructure-0.13.2.sha256sum] = "728a70f3dbaf5bab7f0c4b1ac8d7ae5ea60a4b5549c8a5914361c99147a709d2"
 SRC_URI[tar-codec-0.0.16.sha256sum] = "6875ba507bbec6022500f46477159a03f07ebdffdb4ea043254974531df1dac2"
 SRC_URI[tar-framing-0.0.16.sha256sum] = "49727b1a300514960d425d0e741a7da3e693170f3db39de3180fdbbc07e542c5"
@@ -511,12 +511,12 @@ SRC_URI[thread_local-1.1.9.sha256sum] = "f60246a4944f24f6e018aa17cdeffb7818b7635
 SRC_URI[tinystr-0.8.2.sha256sum] = "42d3e9c45c09de15d06dd8acf5f4e0e399e85927b7f00711024eb7ae10fa4869"
 SRC_URI[tinyvec-1.11.0.sha256sum] = "3e61e67053d25a4e82c844e8424039d9745781b3fc4f32b8d55ed50f5f667ef3"
 SRC_URI[tinyvec_macros-0.1.1.sha256sum] = "1f3ccbac311fea05f86f61904b462b55fb3df8837a366dfc601a0161d0532f20"
-SRC_URI[tokio-1.53.2.sha256sum] = "e95f91fcc7a621e8b030f6aa23c71fe9838ae2fb4d8118b75602a328f5144044"
+SRC_URI[tokio-1.54.1.sha256sum] = "b52fd3255258d26fac7264ab5a76b53c13367136dc011d3d6ad4f8ed070396a3"
 SRC_URI[tokio-macros-2.7.0.sha256sum] = "385a6cb71ab9ab790c5fe8d67f1645e6c450a7ce006a33de03daa956cf70a496"
 SRC_URI[tokio-stream-0.1.19.sha256sum] = "a3d06f0b082ba57c26b79407372e57cf2a1e28124f78e9479fe80322cf53420b"
-SRC_URI[toml-1.1.6+spec-1.1.0.sha256sum] = "920602543f0911ab71da12c50d59701da54c196d1a2bf5cb4b75667f137a406a"
-SRC_URI[toml_datetime-1.1.1+spec-1.1.0.sha256sum] = "3165f65f62e28e0115a00b2ebdd37eb6f3b641855f9d636d3cd4103767159ad7"
-SRC_URI[toml_edit-0.25.15+spec-1.1.0.sha256sum] = "1340ea94a5856333492c9064b02c778b191dd2c853778d9609debdcdfea3a614"
+SRC_URI[toml-1.1.8+spec-1.1.0.sha256sum] = "20489e00e4d8741d6be680764cc12e270655e375a20d1011e844a9c3379e678d"
+SRC_URI[toml_datetime-1.1.3+spec-1.1.0.sha256sum] = "173f25c883cd2176a2d8212155638c0a60d484a9d84546d270866f40f56b6e49"
+SRC_URI[toml_edit-0.25.17+spec-1.1.0.sha256sum] = "e3641d5bbb5349a79e1020a242d251efbc546ad8048d133958323ce9c40a9c9c"
 SRC_URI[toml_parser-1.1.5+spec-1.1.0.sha256sum] = "baa693a8032d7e1cada7d0041e96126df243179ff061456783ac7f12bda4744c"
 SRC_URI[toml_writer-1.1.3+spec-1.1.0.sha256sum] = "06bdbd8cfc056b8d2e2e85f29b56a3bdbecb527cef81eb39e3e7b98af4652770"
 SRC_URI[tracing-0.1.44.sha256sum] = "63e71662fa4b2a2c3a26f570f037eb95bb1f85397f3cd8076caed2f026a6d100"
@@ -534,7 +534,7 @@ SRC_URI[unscanny-0.1.0.sha256sum] = "e9df2af067a7953e9c3831320f35c1cc0600c30d44d
 SRC_URI[url-2.5.8.sha256sum] = "ff67a8a4397373c3ef660812acab3268222035010ab8680ec4215f38ba3d0eed"
 SRC_URI[utf8_iter-1.0.4.sha256sum] = "b6c140620e7ffbb22c2dee59cafe6084a59b5ffc27a8859a5f0d494b5d52b6be"
 SRC_URI[utf8parse-0.2.2.sha256sum] = "06abde3611657adf66d383f00b093d7faecc7fa57071cce2578660c9f1010821"
-SRC_URI[uuid-1.28.0.sha256sum] = "7cc1186384beb7dd8eedea376413fd654937285ea6c9cfbb928dc3043ea4b606"
+SRC_URI[uuid-1.29.0.sha256sum] = "4a0e2d11620c50695fe12bbbfde96b3477fe606e7284c22d505c12ce51214514"
 SRC_URI[valuable-0.1.1.sha256sum] = "ba73ea9cf16a25df0c8caa16c51acb937d5712a8429db78a3ee29d5dcacd3a65"
 SRC_URI[version_check-0.9.5.sha256sum] = "0b928f33d975fc6ad9f86c8f283853ad26bdd5b10b7f1542aa2fa15e2289105a"
 SRC_URI[vte-0.14.1.sha256sum] = "231fdcd7ef3037e8330d8e17e61011a2c244126acc0a982f4040ac3f9f0bc077"
diff --git a/meta/recipes-devtools/python/python3-uv-build_0.13.8.bb b/meta/recipes-devtools/python/python3-uv-build_0.13.10.bb
similarity index 92%
rename from meta/recipes-devtools/python/python3-uv-build_0.13.8.bb
rename to meta/recipes-devtools/python/python3-uv-build_0.13.10.bb
index 68ad48b1b8..a450859044 100644
--- a/meta/recipes-devtools/python/python3-uv-build_0.13.8.bb
+++ b/meta/recipes-devtools/python/python3-uv-build_0.13.10.bb
@@ -11,7 +11,7 @@ LIC_FILES_CHKSUM = "file://LICENSE-APACHE;md5=86d3f3a95c324c9479bd8986968f4327 \
                     file://crates/uv-pep508/License-Apache;md5=e23fadd6ceef8c618fc1c65191d846fa \
                     file://crates/uv-pep508/License-BSD;md5=ef7a6027dc4c2389b9afad7e690274c7"
 
-SRC_URI[sha256sum] = "038c16dc60d63c336cb5364000e11068c79dd0142682fbd4ae3e5470c11fddc5"
+SRC_URI[sha256sum] = "29f3b0e3a636310a1e8d5eff66868f3b809f2756c533010cad3907754120d371"
 
 require ${BPN}-crates.inc
 
-- 
2.47.1


--===============5692319629430855472==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: attachment; filename="buildhistory-diff-full.txt"

packages/x86-64-v3-poky-linux/python3-uv-build: SRC_URI changed from "https://files.pythonhosted.org/packages/source/u/uv_build/uv_build-0.13.8.tar.gz crate://crates.io/adler2/2.0.1 crate://crates.io/aho-corasick/1.1.4 crate://crates.io/ambient-authority/0.0.2 crate://crates.io/anstream/1.0.0 crate://crates.io/anstyle/1.0.14 crate://crates.io/anstyle-parse/1.0.0 crate://crates.io/anstyle-query/1.1.5 crate://crates.io/anstyle-wincon/3.0.11 crate://crates.io/anyhow/1.0.104 crate://crates.io/archive-trait/0.0.16 crate://crates.io/arcstr/1.2.0 crate://crates.io/arrayvec/0.7.8 crate://crates.io/astral-mail-headers/0.0.1 crate://crates.io/astral-tokio-tar/0.7.1 crate://crates.io/astral-version-ranges/0.2.3 crate://crates.io/astral_async_zip/0.0.22 crate://crates.io/async-compression/0.4.50 crate://crates.io/autocfg/1.5.0 crate://crates.io/backon/1.6.0 crate://crates.io/base64/0.22.1 crate://crates.io/base64/0.23.1 crate://crates.io/bitflags/1.3.2 crate://crates.io/bitflags/2.13.2 crate://c
 rates.io/block-buffer/0.10.4 crate://crates.io/block-buffer/0.12.1 crate://crates.io/boxcar/0.2.14 crate://crates.io/bstr/1.12.1 crate://crates.io/bumpalo/3.20.2 crate://crates.io/bytecheck/0.8.3 crate://crates.io/bytecheck_derive/0.8.3 crate://crates.io/bytes/1.12.1 crate://crates.io/cap-primitives/4.0.3 crate://crates.io/cap-std/4.0.3 crate://crates.io/cfg-if/1.0.4 crate://crates.io/clap/4.6.7 crate://crates.io/clap_builder/4.6.7 crate://crates.io/clap_derive/4.6.7 crate://crates.io/clap_lex/1.1.0 crate://crates.io/colorchoice/1.0.5 crate://crates.io/compression-codecs/0.4.45 crate://crates.io/compression-core/0.4.33 crate://crates.io/console/0.16.6 crate://crates.io/cpufeatures/0.2.17 crate://crates.io/cpufeatures/0.3.0 crate://crates.io/crc32fast/1.5.2 crate://crates.io/crypto-common/0.1.7 crate://crates.io/crypto-common/0.2.2 crate://crates.io/csv/1.4.0 crate://crates.io/csv-core/0.1.13 crate://crates.io/defmt/1.1.0 crate://crates.io/defmt-macros/1.1.0 crate://crates.io/defmt-p
 arser/1.0.0 crate://crates.io/digest/0.10.7 crate://crates.io/digest/0.11.3 crate://crates.io/displaydoc/0.2.5 crate://crates.io/dunce/1.0.5 crate://crates.io/dyn-clone/1.0.20 crate://crates.io/either/1.19.0 crate://crates.io/encode_unicode/1.0.0 crate://crates.io/encoding_rs/0.8.35 crate://crates.io/encoding_rs_io/0.1.8 crate://crates.io/enumflags2/0.7.12 crate://crates.io/enumflags2_derive/0.7.12 crate://crates.io/equivalent/1.0.2 crate://crates.io/errno/0.3.14 crate://crates.io/fastrand/2.5.0 crate://crates.io/fixedbitset/0.5.7 crate://crates.io/flate2/1.1.10 crate://crates.io/foldhash/0.1.5 crate://crates.io/foldhash/0.2.0 crate://crates.io/form_urlencoded/1.2.2 crate://crates.io/fs-err/3.3.1 crate://crates.io/fs-set-times/0.20.3 crate://crates.io/futures/0.3.34 crate://crates.io/futures-channel/0.3.34 crate://crates.io/futures-core/0.3.34 crate://crates.io/futures-executor/0.3.34 crate://crates.io/futures-io/0.3.34 crate://crates.io/futures-lite/2.6.1 crate://crates.io/futures-
 macro/0.3.34 crate://crates.io/futures-sink/0.3.34 crate://crates.io/futures-task/0.3.34 crate://crates.io/futures-util/0.3.34 crate://crates.io/generic-array/0.14.7 crate://crates.io/getrandom/0.4.3 crate://crates.io/globset/0.4.20 crate://crates.io/hashbrown/0.15.5 crate://crates.io/hashbrown/0.17.1 crate://crates.io/heck/0.5.0 crate://crates.io/hex/0.4.3 crate://crates.io/hybrid-array/0.4.13 crate://crates.io/icu_collections/2.1.1 crate://crates.io/icu_locale_core/2.1.1 crate://crates.io/icu_normalizer/2.1.1 crate://crates.io/icu_normalizer_data/2.1.1 crate://crates.io/icu_properties/2.1.2 crate://crates.io/icu_properties_data/2.1.2 crate://crates.io/icu_provider/2.1.1 crate://crates.io/idna/1.1.0 crate://crates.io/idna_adapter/1.2.1 crate://crates.io/indexmap/2.14.2 crate://crates.io/indoc/2.0.8 crate://crates.io/insta/1.49.0 crate://crates.io/io-extras/0.19.0 crate://crates.io/io-lifetimes/2.0.4 crate://crates.io/io-lifetimes/3.0.1 crate://crates.io/ipnet/2.12.0 crate://crates.
 io/is_terminal_polyfill/1.70.2 crate://crates.io/itertools/0.14.0 crate://crates.io/itoa/1.0.17 crate://crates.io/jiff/0.2.38 crate://crates.io/jiff-core/0.1.0 crate://crates.io/jiff-static/0.2.38 crate://crates.io/js-sys/0.3.91 crate://crates.io/junction/2.1.0 crate://crates.io/lazy_static/1.5.0 crate://crates.io/libc/0.2.189 crate://crates.io/linux-raw-sys/0.12.1 crate://crates.io/litemap/0.8.1 crate://crates.io/lock_api/0.4.14 crate://crates.io/log/0.4.29 crate://crates.io/matchers/0.2.0 crate://crates.io/maybe-owned/0.3.4 crate://crates.io/memchr/2.8.3 crate://crates.io/miniz_oxide/0.9.1 crate://crates.io/mio/1.2.0 crate://crates.io/munge/0.4.7 crate://crates.io/munge_macro/0.4.7 crate://crates.io/nu-ansi-term/0.50.3 crate://crates.io/once_cell/1.21.4 crate://crates.io/once_cell_polyfill/1.70.2 crate://crates.io/owo-colors/4.4.0 crate://crates.io/parking/2.2.1 crate://crates.io/parking_lot/0.12.5 crate://crates.io/parking_lot_core/0.9.12 crate://crates.io/path-slash/0.2.1 crate:
 //crates.io/percent-encoding/2.3.2 crate://crates.io/pest/2.8.6 crate://crates.io/pest_derive/2.8.6 crate://crates.io/pest_generator/2.8.6 crate://crates.io/pest_meta/2.8.6 crate://crates.io/petgraph/0.8.3 crate://crates.io/pin-project/1.1.11 crate://crates.io/pin-project-internal/1.1.11 crate://crates.io/pin-project-lite/0.2.17 crate://crates.io/portable-atomic/1.13.1 crate://crates.io/portable-atomic-util/0.2.6 crate://crates.io/potential_utf/0.1.4 crate://crates.io/proc-macro-error-attr2/2.0.0 crate://crates.io/proc-macro-error2/2.0.1 crate://crates.io/proc-macro2/1.0.107 crate://crates.io/ptr_meta/0.3.1 crate://crates.io/ptr_meta_derive/0.3.1 crate://crates.io/quote/1.0.47 crate://crates.io/r-efi/6.0.0 crate://crates.io/rancor/0.1.1 crate://crates.io/redox_syscall/0.5.15 crate://crates.io/ref-cast/1.0.27 crate://crates.io/ref-cast-impl/1.0.27 crate://crates.io/reflink-copy/0.1.30 crate://crates.io/regex/1.13.1 crate://crates.io/regex-automata/0.4.18 crate://crates.io/regex-synta
 x/0.8.11 crate://crates.io/rend/0.5.3 crate://crates.io/rkyv/0.8.18 crate://crates.io/rkyv_derive/0.8.18 crate://crates.io/rustc-hash/2.1.3 crate://crates.io/rustix/1.1.5 crate://crates.io/rustix-linux-procfs/0.1.1 crate://crates.io/rustversion/1.0.22 crate://crates.io/ryu/1.0.23 crate://crates.io/same-file/1.0.6 crate://crates.io/schemars/1.2.2 crate://crates.io/schemars_derive/1.2.2 crate://crates.io/scopeguard/1.2.0 crate://crates.io/seahash/4.1.0 crate://crates.io/self-replace/1.5.0 crate://crates.io/serde/1.0.229 crate://crates.io/serde_core/1.0.229 crate://crates.io/serde_derive/1.0.229 crate://crates.io/serde_derive_internals/0.30.0 crate://crates.io/serde_json/1.0.151 crate://crates.io/serde_spanned/1.1.1 crate://crates.io/sha2/0.10.9 crate://crates.io/sha2/0.11.0 crate://crates.io/sharded-slab/0.1.7 crate://crates.io/signal-hook-registry/1.4.8 crate://crates.io/simd-adler32/0.3.8 crate://crates.io/simdutf8/0.1.5 crate://crates.io/similar/2.7.0 crate://crates.io/slab/0.4.12 
 crate://crates.io/smallvec/1.16.2 crate://crates.io/smawk/0.3.2 crate://crates.io/socket2/0.6.3 crate://crates.io/spdx/0.13.6 crate://crates.io/stable_deref_trait/1.2.1 crate://crates.io/strip-ansi-escapes/0.2.1 crate://crates.io/strsim/0.11.1 crate://crates.io/syn/2.0.118 crate://crates.io/syn/3.0.6 crate://crates.io/synstructure/0.13.2 crate://crates.io/tar-codec/0.0.16 crate://crates.io/tar-framing/0.0.16 crate://crates.io/temp-env/0.3.6 crate://crates.io/tempfile/3.27.0 crate://crates.io/terminal_size/0.4.4 crate://crates.io/textwrap/0.16.4 crate://crates.io/thiserror/2.0.21 crate://crates.io/thiserror-impl/2.0.21 crate://crates.io/thread_local/1.1.9 crate://crates.io/tinystr/0.8.2 crate://crates.io/tinyvec/1.11.0 crate://crates.io/tinyvec_macros/0.1.1 crate://crates.io/tokio/1.53.2 crate://crates.io/tokio-macros/2.7.0 crate://crates.io/tokio-stream/0.1.19 crate://crates.io/toml/1.1.6+spec-1.1.0 crate://crates.io/toml_datetime/1.1.1+spec-1.1.0 crate://crates.io/toml_edit/0.25.15
 +spec-1.1.0 crate://crates.io/toml_parser/1.1.5+spec-1.1.0 crate://crates.io/toml_writer/1.1.3+spec-1.1.0 crate://crates.io/tracing/0.1.44 crate://crates.io/tracing-attributes/0.1.31 crate://crates.io/tracing-core/0.1.36 crate://crates.io/tracing-log/0.2.0 crate://crates.io/tracing-subscriber/0.3.23 crate://crates.io/tracing-test/0.2.6 crate://crates.io/tracing-test-macro/0.2.6 crate://crates.io/typenum/1.20.1 crate://crates.io/ucd-trie/0.1.7 crate://crates.io/unicode-ident/1.0.24 crate://crates.io/unicode-width/0.2.2 crate://crates.io/unscanny/0.1.0 crate://crates.io/url/2.5.8 crate://crates.io/utf8_iter/1.0.4 crate://crates.io/utf8parse/0.2.2 crate://crates.io/uuid/1.28.0 crate://crates.io/valuable/0.1.1 crate://crates.io/version_check/0.9.5 crate://crates.io/vte/0.14.1 crate://crates.io/walkdir/2.5.0 crate://crates.io/wasi/0.11.1+wasi-snapshot-preview1 crate://crates.io/wasm-bindgen/0.2.114 crate://crates.io/wasm-bindgen-macro/0.2.114 crate://crates.io/wasm-bindgen-macro-support/
 0.2.114 crate://crates.io/wasm-bindgen-shared/0.2.114 crate://crates.io/winapi-util/0.1.11 crate://crates.io/windows/0.61.3 crate://crates.io/windows-collections/0.2.0 crate://crates.io/windows-core/0.61.2 crate://crates.io/windows-future/0.2.1 crate://crates.io/windows-implement/0.60.2 crate://crates.io/windows-interface/0.59.3 crate://crates.io/windows-link/0.1.3 crate://crates.io/windows-link/0.2.1 crate://crates.io/windows-numerics/0.2.0 crate://crates.io/windows-result/0.3.4 crate://crates.io/windows-strings/0.4.2 crate://crates.io/windows-sys/0.52.0 crate://crates.io/windows-sys/0.60.2 crate://crates.io/windows-sys/0.61.2 crate://crates.io/windows-targets/0.52.6 crate://crates.io/windows-targets/0.53.5 crate://crates.io/windows-threading/0.1.0 crate://crates.io/windows_aarch64_gnullvm/0.52.6 crate://crates.io/windows_aarch64_gnullvm/0.53.1 crate://crates.io/windows_aarch64_msvc/0.52.6 crate://crates.io/windows_aarch64_msvc/0.53.1 crate://crates.io/windows_i686_gnu/0.52.6 crate
 ://crates.io/windows_i686_gnu/0.53.1 crate://crates.io/windows_i686_gnullvm/0.52.6 crate://crates.io/windows_i686_gnullvm/0.53.1 crate://crates.io/windows_i686_msvc/0.52.6 crate://crates.io/windows_i686_msvc/0.53.1 crate://crates.io/windows_x86_64_gnu/0.52.6 crate://crates.io/windows_x86_64_gnu/0.53.1 crate://crates.io/windows_x86_64_gnullvm/0.52.6 crate://crates.io/windows_x86_64_gnullvm/0.53.1 crate://crates.io/windows_x86_64_msvc/0.52.6 crate://crates.io/windows_x86_64_msvc/0.53.1 crate://crates.io/winnow/1.0.3 crate://crates.io/winx/0.36.4 crate://crates.io/writeable/0.6.2 crate://crates.io/yoke/0.8.1 crate://crates.io/yoke-derive/0.8.1 crate://crates.io/zerocopy/0.8.63 crate://crates.io/zerocopy-derive/0.8.63 crate://crates.io/zerofrom/0.1.6 crate://crates.io/zerofrom-derive/0.1.6 crate://crates.io/zerotrie/0.2.3 crate://crates.io/zerovec/0.11.5 crate://crates.io/zerovec-derive/0.11.2 crate://crates.io/zlib-rs/0.6.3 crate://crates.io/zmij/1.0.21" to "https://files.pythonhosted.
 org/packages/source/u/uv_build/uv_build-0.13.10.tar.gz crate://crates.io/adler2/2.0.1 crate://crates.io/aho-corasick/1.1.4 crate://crates.io/ambient-authority/0.0.2 crate://crates.io/anstream/1.0.0 crate://crates.io/anstyle/1.0.14 crate://crates.io/anstyle-parse/1.0.0 crate://crates.io/anstyle-query/1.1.5 crate://crates.io/anstyle-wincon/3.0.11 crate://crates.io/anyhow/1.0.104 crate://crates.io/archive-trait/0.0.16 crate://crates.io/arcstr/1.2.0 crate://crates.io/arrayvec/0.7.8 crate://crates.io/astral-mail-headers/0.0.1 crate://crates.io/astral-tokio-tar/0.7.1 crate://crates.io/astral-version-ranges/0.2.3 crate://crates.io/astral_async_zip/0.0.24 crate://crates.io/async-compression/0.4.50 crate://crates.io/autocfg/1.5.0 crate://crates.io/backon/1.6.0 crate://crates.io/base64/0.22.1 crate://crates.io/base64/0.23.1 crate://crates.io/bitflags/1.3.2 crate://crates.io/bitflags/2.13.2 crate://crates.io/block-buffer/0.10.4 crate://crates.io/block-buffer/0.12.1 crate://crates.io/boxcar/0.2
 .14 crate://crates.io/bstr/1.12.1 crate://crates.io/bumpalo/3.20.2 crate://crates.io/bytecheck/0.8.3 crate://crates.io/bytecheck_derive/0.8.3 crate://crates.io/bytes/1.12.1 crate://crates.io/cap-primitives/4.0.3 crate://crates.io/cap-std/4.0.3 crate://crates.io/cfg-if/1.0.4 crate://crates.io/clap/4.6.7 crate://crates.io/clap_builder/4.6.7 crate://crates.io/clap_derive/4.6.7 crate://crates.io/clap_lex/1.1.0 crate://crates.io/colorchoice/1.0.5 crate://crates.io/compression-codecs/0.4.45 crate://crates.io/compression-core/0.4.33 crate://crates.io/console/0.16.6 crate://crates.io/cpufeatures/0.2.17 crate://crates.io/cpufeatures/0.3.0 crate://crates.io/crc32fast/1.5.3 crate://crates.io/crypto-common/0.1.7 crate://crates.io/crypto-common/0.2.2 crate://crates.io/csv/1.4.0 crate://crates.io/csv-core/0.1.13 crate://crates.io/defmt/1.1.0 crate://crates.io/defmt-macros/1.1.0 crate://crates.io/defmt-parser/1.0.0 crate://crates.io/digest/0.10.7 crate://crates.io/digest/0.11.3 crate://crates.io/d
 isplaydoc/0.2.5 crate://crates.io/dunce/1.0.5 crate://crates.io/dyn-clone/1.0.20 crate://crates.io/either/1.19.0 crate://crates.io/encode_unicode/1.0.0 crate://crates.io/encoding_rs/0.8.35 crate://crates.io/encoding_rs_io/0.1.8 crate://crates.io/enumflags2/0.7.12 crate://crates.io/enumflags2_derive/0.7.12 crate://crates.io/equivalent/1.0.2 crate://crates.io/errno/0.3.14 crate://crates.io/fastrand/2.5.0 crate://crates.io/fixedbitset/0.5.7 crate://crates.io/flate2/1.1.10 crate://crates.io/foldhash/0.1.5 crate://crates.io/foldhash/0.2.0 crate://crates.io/form_urlencoded/1.2.2 crate://crates.io/fs-err/3.3.1 crate://crates.io/fs-set-times/0.20.3 crate://crates.io/futures/0.3.34 crate://crates.io/futures-channel/0.3.34 crate://crates.io/futures-core/0.3.34 crate://crates.io/futures-executor/0.3.34 crate://crates.io/futures-io/0.3.34 crate://crates.io/futures-lite/2.6.1 crate://crates.io/futures-macro/0.3.34 crate://crates.io/futures-sink/0.3.34 crate://crates.io/futures-task/0.3.34 crate:
 //crates.io/futures-util/0.3.34 crate://crates.io/generic-array/0.14.7 crate://crates.io/getrandom/0.4.3 crate://crates.io/globset/0.4.20 crate://crates.io/hashbrown/0.15.5 crate://crates.io/hashbrown/0.17.1 crate://crates.io/heck/0.5.0 crate://crates.io/hex/0.4.3 crate://crates.io/hybrid-array/0.4.13 crate://crates.io/icu_collections/2.1.1 crate://crates.io/icu_locale_core/2.1.1 crate://crates.io/icu_normalizer/2.1.1 crate://crates.io/icu_normalizer_data/2.1.1 crate://crates.io/icu_properties/2.1.2 crate://crates.io/icu_properties_data/2.1.2 crate://crates.io/icu_provider/2.1.1 crate://crates.io/idna/1.1.0 crate://crates.io/idna_adapter/1.2.1 crate://crates.io/indexmap/2.14.2 crate://crates.io/indoc/2.0.8 crate://crates.io/insta/1.49.0 crate://crates.io/io-extras/0.19.0 crate://crates.io/io-lifetimes/2.0.4 crate://crates.io/io-lifetimes/3.0.1 crate://crates.io/ipnet/2.12.0 crate://crates.io/is_terminal_polyfill/1.70.2 crate://crates.io/itertools/0.14.0 crate://crates.io/itoa/1.0.17
  crate://crates.io/jiff/0.2.38 crate://crates.io/jiff-core/0.1.0 crate://crates.io/jiff-static/0.2.38 crate://crates.io/js-sys/0.3.91 crate://crates.io/junction/2.1.0 crate://crates.io/lazy_static/1.5.0 crate://crates.io/libc/0.2.191 crate://crates.io/linux-raw-sys/0.12.1 crate://crates.io/litemap/0.8.1 crate://crates.io/lock_api/0.4.14 crate://crates.io/log/0.4.29 crate://crates.io/matchers/0.2.0 crate://crates.io/maybe-owned/0.3.4 crate://crates.io/memchr/2.8.3 crate://crates.io/miniz_oxide/0.9.1 crate://crates.io/mio/1.2.0 crate://crates.io/munge/0.4.7 crate://crates.io/munge_macro/0.4.7 crate://crates.io/nu-ansi-term/0.50.3 crate://crates.io/once_cell/1.21.4 crate://crates.io/once_cell_polyfill/1.70.2 crate://crates.io/owo-colors/4.4.0 crate://crates.io/parking/2.2.1 crate://crates.io/parking_lot/0.12.5 crate://crates.io/parking_lot_core/0.9.12 crate://crates.io/path-slash/0.2.1 crate://crates.io/percent-encoding/2.3.2 crate://crates.io/pest/2.8.6 crate://crates.io/pest_derive/2
 .8.6 crate://crates.io/pest_generator/2.8.6 crate://crates.io/pest_meta/2.8.6 crate://crates.io/petgraph/0.8.3 crate://crates.io/pin-project/1.1.11 crate://crates.io/pin-project-internal/1.1.11 crate://crates.io/pin-project-lite/0.2.17 crate://crates.io/portable-atomic/1.13.1 crate://crates.io/portable-atomic-util/0.2.6 crate://crates.io/potential_utf/0.1.4 crate://crates.io/proc-macro-error-attr2/2.0.0 crate://crates.io/proc-macro-error2/2.0.1 crate://crates.io/proc-macro2/1.0.107 crate://crates.io/ptr_meta/0.3.1 crate://crates.io/ptr_meta_derive/0.3.1 crate://crates.io/quote/1.0.47 crate://crates.io/r-efi/6.0.0 crate://crates.io/rancor/0.1.1 crate://crates.io/redox_syscall/0.5.15 crate://crates.io/ref-cast/1.0.27 crate://crates.io/ref-cast-impl/1.0.27 crate://crates.io/reflink-copy/0.1.30 crate://crates.io/regex/1.13.1 crate://crates.io/regex-automata/0.4.18 crate://crates.io/regex-syntax/0.8.11 crate://crates.io/rend/0.5.3 crate://crates.io/rkyv/0.8.18 crate://crates.io/rkyv_deri
 ve/0.8.18 crate://crates.io/rustc-hash/2.1.3 crate://crates.io/rustix/1.1.5 crate://crates.io/rustix-linux-procfs/0.1.1 crate://crates.io/rustversion/1.0.22 crate://crates.io/ryu/1.0.23 crate://crates.io/same-file/1.0.6 crate://crates.io/schemars/1.2.3 crate://crates.io/schemars_derive/1.2.3 crate://crates.io/scopeguard/1.2.0 crate://crates.io/seahash/4.1.0 crate://crates.io/self-replace/1.5.0 crate://crates.io/serde/1.0.229 crate://crates.io/serde_core/1.0.229 crate://crates.io/serde_derive/1.0.229 crate://crates.io/serde_derive_internals/0.30.0 crate://crates.io/serde_json/1.0.154 crate://crates.io/serde_spanned/1.1.3 crate://crates.io/sha2/0.10.9 crate://crates.io/sha2/0.11.0 crate://crates.io/sharded-slab/0.1.7 crate://crates.io/signal-hook-registry/1.4.8 crate://crates.io/simd-adler32/0.3.8 crate://crates.io/simdutf8/0.1.5 crate://crates.io/similar/2.7.0 crate://crates.io/slab/0.4.12 crate://crates.io/smallvec/1.16.4 crate://crates.io/smawk/0.3.2 crate://crates.io/socket2/0.6.3
  crate://crates.io/spdx/0.13.6 crate://crates.io/stable_deref_trait/1.2.1 crate://crates.io/strip-ansi-escapes/0.2.1 crate://crates.io/strsim/0.11.1 crate://crates.io/syn/2.0.118 crate://crates.io/syn/3.0.9 crate://crates.io/synstructure/0.13.2 crate://crates.io/tar-codec/0.0.16 crate://crates.io/tar-framing/0.0.16 crate://crates.io/temp-env/0.3.6 crate://crates.io/tempfile/3.27.0 crate://crates.io/terminal_size/0.4.4 crate://crates.io/textwrap/0.16.4 crate://crates.io/thiserror/2.0.21 crate://crates.io/thiserror-impl/2.0.21 crate://crates.io/thread_local/1.1.9 crate://crates.io/tinystr/0.8.2 crate://crates.io/tinyvec/1.11.0 crate://crates.io/tinyvec_macros/0.1.1 crate://crates.io/tokio/1.54.1 crate://crates.io/tokio-macros/2.7.0 crate://crates.io/tokio-stream/0.1.19 crate://crates.io/toml/1.1.8+spec-1.1.0 crate://crates.io/toml_datetime/1.1.3+spec-1.1.0 crate://crates.io/toml_edit/0.25.17+spec-1.1.0 crate://crates.io/toml_parser/1.1.5+spec-1.1.0 crate://crates.io/toml_writer/1.1.3+
 spec-1.1.0 crate://crates.io/tracing/0.1.44 crate://crates.io/tracing-attributes/0.1.31 crate://crates.io/tracing-core/0.1.36 crate://crates.io/tracing-log/0.2.0 crate://crates.io/tracing-subscriber/0.3.23 crate://crates.io/tracing-test/0.2.6 crate://crates.io/tracing-test-macro/0.2.6 crate://crates.io/typenum/1.20.1 crate://crates.io/ucd-trie/0.1.7 crate://crates.io/unicode-ident/1.0.24 crate://crates.io/unicode-width/0.2.2 crate://crates.io/unscanny/0.1.0 crate://crates.io/url/2.5.8 crate://crates.io/utf8_iter/1.0.4 crate://crates.io/utf8parse/0.2.2 crate://crates.io/uuid/1.29.0 crate://crates.io/valuable/0.1.1 crate://crates.io/version_check/0.9.5 crate://crates.io/vte/0.14.1 crate://crates.io/walkdir/2.5.0 crate://crates.io/wasi/0.11.1+wasi-snapshot-preview1 crate://crates.io/wasm-bindgen/0.2.114 crate://crates.io/wasm-bindgen-macro/0.2.114 crate://crates.io/wasm-bindgen-macro-support/0.2.114 crate://crates.io/wasm-bindgen-shared/0.2.114 crate://crates.io/winapi-util/0.1.11 crat
 e://crates.io/windows/0.61.3 crate://crates.io/windows-collections/0.2.0 crate://crates.io/windows-core/0.61.2 crate://crates.io/windows-future/0.2.1 crate://crates.io/windows-implement/0.60.2 crate://crates.io/windows-interface/0.59.3 crate://crates.io/windows-link/0.1.3 crate://crates.io/windows-link/0.2.1 crate://crates.io/windows-numerics/0.2.0 crate://crates.io/windows-result/0.3.4 crate://crates.io/windows-strings/0.4.2 crate://crates.io/windows-sys/0.52.0 crate://crates.io/windows-sys/0.60.2 crate://crates.io/windows-sys/0.61.2 crate://crates.io/windows-targets/0.52.6 crate://crates.io/windows-targets/0.53.5 crate://crates.io/windows-threading/0.1.0 crate://crates.io/windows_aarch64_gnullvm/0.52.6 crate://crates.io/windows_aarch64_gnullvm/0.53.1 crate://crates.io/windows_aarch64_msvc/0.52.6 crate://crates.io/windows_aarch64_msvc/0.53.1 crate://crates.io/windows_i686_gnu/0.52.6 crate://crates.io/windows_i686_gnu/0.53.1 crate://crates.io/windows_i686_gnullvm/0.52.6 crate://crat
 es.io/windows_i686_gnullvm/0.53.1 crate://crates.io/windows_i686_msvc/0.52.6 crate://crates.io/windows_i686_msvc/0.53.1 crate://crates.io/windows_x86_64_gnu/0.52.6 crate://crates.io/windows_x86_64_gnu/0.53.1 crate://crates.io/windows_x86_64_gnullvm/0.52.6 crate://crates.io/windows_x86_64_gnullvm/0.53.1 crate://crates.io/windows_x86_64_msvc/0.52.6 crate://crates.io/windows_x86_64_msvc/0.53.1 crate://crates.io/winnow/1.0.3 crate://crates.io/winx/0.36.4 crate://crates.io/writeable/0.6.2 crate://crates.io/yoke/0.8.1 crate://crates.io/yoke-derive/0.8.1 crate://crates.io/zerocopy/0.8.63 crate://crates.io/zerocopy-derive/0.8.63 crate://crates.io/zerofrom/0.1.6 crate://crates.io/zerofrom-derive/0.1.6 crate://crates.io/zerotrie/0.2.3 crate://crates.io/zerovec/0.11.5 crate://crates.io/zerovec-derive/0.11.2 crate://crates.io/zlib-rs/0.6.3 crate://crates.io/zmij/1.0.21"
packages/x86-64-v3-poky-linux/python3-uv-build: PKGV changed from 0.13.8 [default] to 0.13.10 [default]
packages/x86-64-v3-poky-linux/python3-uv-build: PV changed from "0.13.8" to "0.13.10"
packages/x86-64-v3-poky-linux/python3-uv-build/python3-uv-build-dbg: PKGV changed from 0.13.8 [default] to 0.13.10 [default]
packages/x86-64-v3-poky-linux/python3-uv-build/python3-uv-build-dbg: PV changed from "0.13.8" to "0.13.10"
packages/x86-64-v3-poky-linux/python3-uv-build/python3-uv-build-dev: PKGV changed from 0.13.8 [default] to 0.13.10 [default]
packages/x86-64-v3-poky-linux/python3-uv-build/python3-uv-build-dev: PV changed from "0.13.8" to "0.13.10"
packages/x86-64-v3-poky-linux/python3-uv-build/python3-uv-build-doc: PKGV changed from 0.13.8 [default] to 0.13.10 [default]
packages/x86-64-v3-poky-linux/python3-uv-build/python3-uv-build-doc: PV changed from "0.13.8" to "0.13.10"
packages/x86-64-v3-poky-linux/python3-uv-build/python3-uv-build-locale: PKGV changed from 0.13.8 [default] to 0.13.10 [default]
packages/x86-64-v3-poky-linux/python3-uv-build/python3-uv-build-locale: PV changed from "0.13.8" to "0.13.10"
packages/x86-64-v3-poky-linux/python3-uv-build/python3-uv-build-src: PKGV changed from 0.13.8 [default] to 0.13.10 [default]
packages/x86-64-v3-poky-linux/python3-uv-build/python3-uv-build-src: PV changed from "0.13.8" to "0.13.10"
packages/x86-64-v3-poky-linux/python3-uv-build/python3-uv-build-staticdev: PKGV changed from 0.13.8 [default] to 0.13.10 [default]
packages/x86-64-v3-poky-linux/python3-uv-build/python3-uv-build-staticdev: PV changed from "0.13.8" to "0.13.10"
packages/x86-64-v3-poky-linux/python3-uv-build/python3-uv-build: PKGV changed from 0.13.8 [default] to 0.13.10 [default]
packages/x86-64-v3-poky-linux/python3-uv-build/python3-uv-build: FILELIST: directory renamed /usr/lib/python3.15/site-packages/uv_build-0.13.8.dist-info/licenses -> /usr/lib/python3.15/site-packages/uv_build-0.13.10.dist-info/licenses, directory renamed /usr/lib/python3.15/site-packages/uv_build-0.13.8.dist-info -> /usr/lib/python3.15/site-packages/uv_build-0.13.10.dist-info
packages/x86-64-v3-poky-linux/python3-uv-build/python3-uv-build: PV changed from "0.13.8" to "0.13.10"
packages/x86-64-v3-poky-linux/python3-uv-build/python3-uv-build: PKGSIZE changed from 3815026 to 3835539 (+1%)
Changes to packages/x86-64-v3-poky-linux/python3-uv-build (sysroot):
  /usr/lib/python3.15/site-packages/uv_build-0.13.10.dist-info was added
  /usr/lib/python3.15/site-packages/uv_build-0.13.10.dist-info/licenses was added
  /usr/lib/python3.15/site-packages/uv_build-0.13.10.dist-info/licenses/LICENSE-APACHE was added
  /usr/lib/python3.15/site-packages/uv_build-0.13.10.dist-info/licenses/LICENSE-MIT was added
  /usr/lib/python3.15/site-packages/uv_build-0.13.10.dist-info/METADATA was added
  /usr/lib/python3.15/site-packages/uv_build-0.13.10.dist-info/WHEEL was added
  /usr/lib/python3.15/site-packages/uv_build-0.13.8.dist-info was removed
  /usr/lib/python3.15/site-packages/uv_build-0.13.8.dist-info/licenses was removed
  /usr/lib/python3.15/site-packages/uv_build-0.13.8.dist-info/licenses/LICENSE-APACHE was removed
  /usr/lib/python3.15/site-packages/uv_build-0.13.8.dist-info/licenses/LICENSE-MIT was removed
  /usr/lib/python3.15/site-packages/uv_build-0.13.8.dist-info/METADATA was removed
  /usr/lib/python3.15/site-packages/uv_build-0.13.8.dist-info/WHEEL was removed

--===============5692319629430855472==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: attachment; filename="buildhistory-diff.txt"

packages/x86-64-v3-poky-linux/python3-uv-build/python3-uv-build: FILELIST: directory renamed /usr/lib/python3.15/site-packages/uv_build-0.13.8.dist-info/licenses -> /usr/lib/python3.15/site-packages/uv_build-0.13.10.dist-info/licenses, directory renamed /usr/lib/python3.15/site-packages/uv_build-0.13.8.dist-info -> /usr/lib/python3.15/site-packages/uv_build-0.13.10.dist-info
Changes to packages/x86-64-v3-poky-linux/python3-uv-build (sysroot):
  /usr/lib/python3.15/site-packages/uv_build-0.13.10.dist-info was added
  /usr/lib/python3.15/site-packages/uv_build-0.13.10.dist-info/licenses was added
  /usr/lib/python3.15/site-packages/uv_build-0.13.10.dist-info/licenses/LICENSE-APACHE was added
  /usr/lib/python3.15/site-packages/uv_build-0.13.10.dist-info/licenses/LICENSE-MIT was added
  /usr/lib/python3.15/site-packages/uv_build-0.13.10.dist-info/METADATA was added
  /usr/lib/python3.15/site-packages/uv_build-0.13.10.dist-info/WHEEL was added
  /usr/lib/python3.15/site-packages/uv_build-0.13.8.dist-info was removed
  /usr/lib/python3.15/site-packages/uv_build-0.13.8.dist-info/licenses was removed
  /usr/lib/python3.15/site-packages/uv_build-0.13.8.dist-info/licenses/LICENSE-APACHE was removed
  /usr/lib/python3.15/site-packages/uv_build-0.13.8.dist-info/licenses/LICENSE-MIT was removed
  /usr/lib/python3.15/site-packages/uv_build-0.13.8.dist-info/METADATA was removed
  /usr/lib/python3.15/site-packages/uv_build-0.13.8.dist-info/WHEEL was removed

--===============5692319629430855472==
Content-Type: application/octet-stream
MIME-Version: 1.0
Content-Transfer-Encoding: base64
Content-Disposition: attachment;
 filename="0001-python3-uv-build-upgrade-0.13.8-0.13.10.patch"

RnJvbSAzYjA3NmI2MTM1OTUyMzQ3M2Q4ZWJhNmU4ZGQ1ZjRlZWRmZmVhZmMzIE1vbiBTZXAgMTcg
MDA6MDA6MDAgMjAwMQpGcm9tOiBVcGdyYWRlIEhlbHBlciA8YXVoQHlvY3RvcHJvamVjdC5vcmc+
CkRhdGU6IFdlZCwgMjUgTm92IDIwMjYgMDU6MzQ6NDIgKzAwMDAKU3ViamVjdDogW1BBVENIXSBw
eXRob24zLXV2LWJ1aWxkOiB1cGdyYWRlIDAuMTMuOCAtPiAwLjEzLjEwCgotLS0KIC4uLi9weXRo
b24vcHl0aG9uMy11di1idWlsZC1jcmF0ZXMuaW5jICAgICAgICB8IDU2ICsrKysrKysrKy0tLS0t
LS0tLS0KIC4uLl8wLjEzLjguYmIgPT4gcHl0aG9uMy11di1idWlsZF8wLjEzLjEwLmJifSB8ICAy
ICstCiAyIGZpbGVzIGNoYW5nZWQsIDI5IGluc2VydGlvbnMoKyksIDI5IGRlbGV0aW9ucygtKQog
cmVuYW1lIG1ldGEvcmVjaXBlcy1kZXZ0b29scy9weXRob24ve3B5dGhvbjMtdXYtYnVpbGRfMC4x
My44LmJiID0+IHB5dGhvbjMtdXYtYnVpbGRfMC4xMy4xMC5iYn0gKDkyJSkKCmRpZmYgLS1naXQg
YS9tZXRhL3JlY2lwZXMtZGV2dG9vbHMvcHl0aG9uL3B5dGhvbjMtdXYtYnVpbGQtY3JhdGVzLmlu
YyBiL21ldGEvcmVjaXBlcy1kZXZ0b29scy9weXRob24vcHl0aG9uMy11di1idWlsZC1jcmF0ZXMu
aW5jCmluZGV4IDUzNTQwMTBiNDMuLmQ0YzQ1Y2Y3MDkgMTAwNjQ0Ci0tLSBhL21ldGEvcmVjaXBl
cy1kZXZ0b29scy9weXRob24vcHl0aG9uMy11di1idWlsZC1jcmF0ZXMuaW5jCisrKyBiL21ldGEv
cmVjaXBlcy1kZXZ0b29scy9weXRob24vcHl0aG9uMy11di1idWlsZC1jcmF0ZXMuaW5jCkBAIC0x
Nyw3ICsxNyw3IEBAIFNSQ19VUkkgKz0gIiBcCiAgICAgY3JhdGU6Ly9jcmF0ZXMuaW8vYXN0cmFs
LW1haWwtaGVhZGVycy8wLjAuMSBcCiAgICAgY3JhdGU6Ly9jcmF0ZXMuaW8vYXN0cmFsLXRva2lv
LXRhci8wLjcuMSBcCiAgICAgY3JhdGU6Ly9jcmF0ZXMuaW8vYXN0cmFsLXZlcnNpb24tcmFuZ2Vz
LzAuMi4zIFwKLSAgICBjcmF0ZTovL2NyYXRlcy5pby9hc3RyYWxfYXN5bmNfemlwLzAuMC4yMiBc
CisgICAgY3JhdGU6Ly9jcmF0ZXMuaW8vYXN0cmFsX2FzeW5jX3ppcC8wLjAuMjQgXAogICAgIGNy
YXRlOi8vY3JhdGVzLmlvL2FzeW5jLWNvbXByZXNzaW9uLzAuNC41MCBcCiAgICAgY3JhdGU6Ly9j
cmF0ZXMuaW8vYXV0b2NmZy8xLjUuMCBcCiAgICAgY3JhdGU6Ly9jcmF0ZXMuaW8vYmFja29uLzEu
Ni4wIFwKQEAgLTQ2LDcgKzQ2LDcgQEAgU1JDX1VSSSArPSAiIFwKICAgICBjcmF0ZTovL2NyYXRl
cy5pby9jb25zb2xlLzAuMTYuNiBcCiAgICAgY3JhdGU6Ly9jcmF0ZXMuaW8vY3B1ZmVhdHVyZXMv
MC4yLjE3IFwKICAgICBjcmF0ZTovL2NyYXRlcy5pby9jcHVmZWF0dXJlcy8wLjMuMCBcCi0gICAg
Y3JhdGU6Ly9jcmF0ZXMuaW8vY3JjMzJmYXN0LzEuNS4yIFwKKyAgICBjcmF0ZTovL2NyYXRlcy5p
by9jcmMzMmZhc3QvMS41LjMgXAogICAgIGNyYXRlOi8vY3JhdGVzLmlvL2NyeXB0by1jb21tb24v
MC4xLjcgXAogICAgIGNyYXRlOi8vY3JhdGVzLmlvL2NyeXB0by1jb21tb24vMC4yLjIgXAogICAg
IGNyYXRlOi8vY3JhdGVzLmlvL2Nzdi8xLjQuMCBcCkBAIC0xMTgsNyArMTE4LDcgQEAgU1JDX1VS
SSArPSAiIFwKICAgICBjcmF0ZTovL2NyYXRlcy5pby9qcy1zeXMvMC4zLjkxIFwKICAgICBjcmF0
ZTovL2NyYXRlcy5pby9qdW5jdGlvbi8yLjEuMCBcCiAgICAgY3JhdGU6Ly9jcmF0ZXMuaW8vbGF6
eV9zdGF0aWMvMS41LjAgXAotICAgIGNyYXRlOi8vY3JhdGVzLmlvL2xpYmMvMC4yLjE4OSBcCisg
ICAgY3JhdGU6Ly9jcmF0ZXMuaW8vbGliYy8wLjIuMTkxIFwKICAgICBjcmF0ZTovL2NyYXRlcy5p
by9saW51eC1yYXctc3lzLzAuMTIuMSBcCiAgICAgY3JhdGU6Ly9jcmF0ZXMuaW8vbGl0ZW1hcC8w
LjguMSBcCiAgICAgY3JhdGU6Ly9jcmF0ZXMuaW8vbG9ja19hcGkvMC40LjE0IFwKQEAgLTE3NCw4
ICsxNzQsOCBAQCBTUkNfVVJJICs9ICIgXAogICAgIGNyYXRlOi8vY3JhdGVzLmlvL3J1c3R2ZXJz
aW9uLzEuMC4yMiBcCiAgICAgY3JhdGU6Ly9jcmF0ZXMuaW8vcnl1LzEuMC4yMyBcCiAgICAgY3Jh
dGU6Ly9jcmF0ZXMuaW8vc2FtZS1maWxlLzEuMC42IFwKLSAgICBjcmF0ZTovL2NyYXRlcy5pby9z
Y2hlbWFycy8xLjIuMiBcCi0gICAgY3JhdGU6Ly9jcmF0ZXMuaW8vc2NoZW1hcnNfZGVyaXZlLzEu
Mi4yIFwKKyAgICBjcmF0ZTovL2NyYXRlcy5pby9zY2hlbWFycy8xLjIuMyBcCisgICAgY3JhdGU6
Ly9jcmF0ZXMuaW8vc2NoZW1hcnNfZGVyaXZlLzEuMi4zIFwKICAgICBjcmF0ZTovL2NyYXRlcy5p
by9zY29wZWd1YXJkLzEuMi4wIFwKICAgICBjcmF0ZTovL2NyYXRlcy5pby9zZWFoYXNoLzQuMS4w
IFwKICAgICBjcmF0ZTovL2NyYXRlcy5pby9zZWxmLXJlcGxhY2UvMS41LjAgXApAQCAtMTgzLDgg
KzE4Myw4IEBAIFNSQ19VUkkgKz0gIiBcCiAgICAgY3JhdGU6Ly9jcmF0ZXMuaW8vc2VyZGVfY29y
ZS8xLjAuMjI5IFwKICAgICBjcmF0ZTovL2NyYXRlcy5pby9zZXJkZV9kZXJpdmUvMS4wLjIyOSBc
CiAgICAgY3JhdGU6Ly9jcmF0ZXMuaW8vc2VyZGVfZGVyaXZlX2ludGVybmFscy8wLjMwLjAgXAot
ICAgIGNyYXRlOi8vY3JhdGVzLmlvL3NlcmRlX2pzb24vMS4wLjE1MSBcCi0gICAgY3JhdGU6Ly9j
cmF0ZXMuaW8vc2VyZGVfc3Bhbm5lZC8xLjEuMSBcCisgICAgY3JhdGU6Ly9jcmF0ZXMuaW8vc2Vy
ZGVfanNvbi8xLjAuMTU0IFwKKyAgICBjcmF0ZTovL2NyYXRlcy5pby9zZXJkZV9zcGFubmVkLzEu
MS4zIFwKICAgICBjcmF0ZTovL2NyYXRlcy5pby9zaGEyLzAuMTAuOSBcCiAgICAgY3JhdGU6Ly9j
cmF0ZXMuaW8vc2hhMi8wLjExLjAgXAogICAgIGNyYXRlOi8vY3JhdGVzLmlvL3NoYXJkZWQtc2xh
Yi8wLjEuNyBcCkBAIC0xOTMsNyArMTkzLDcgQEAgU1JDX1VSSSArPSAiIFwKICAgICBjcmF0ZTov
L2NyYXRlcy5pby9zaW1kdXRmOC8wLjEuNSBcCiAgICAgY3JhdGU6Ly9jcmF0ZXMuaW8vc2ltaWxh
ci8yLjcuMCBcCiAgICAgY3JhdGU6Ly9jcmF0ZXMuaW8vc2xhYi8wLjQuMTIgXAotICAgIGNyYXRl
Oi8vY3JhdGVzLmlvL3NtYWxsdmVjLzEuMTYuMiBcCisgICAgY3JhdGU6Ly9jcmF0ZXMuaW8vc21h
bGx2ZWMvMS4xNi40IFwKICAgICBjcmF0ZTovL2NyYXRlcy5pby9zbWF3ay8wLjMuMiBcCiAgICAg
Y3JhdGU6Ly9jcmF0ZXMuaW8vc29ja2V0Mi8wLjYuMyBcCiAgICAgY3JhdGU6Ly9jcmF0ZXMuaW8v
c3BkeC8wLjEzLjYgXApAQCAtMjAxLDcgKzIwMSw3IEBAIFNSQ19VUkkgKz0gIiBcCiAgICAgY3Jh
dGU6Ly9jcmF0ZXMuaW8vc3RyaXAtYW5zaS1lc2NhcGVzLzAuMi4xIFwKICAgICBjcmF0ZTovL2Ny
YXRlcy5pby9zdHJzaW0vMC4xMS4xIFwKICAgICBjcmF0ZTovL2NyYXRlcy5pby9zeW4vMi4wLjEx
OCBcCi0gICAgY3JhdGU6Ly9jcmF0ZXMuaW8vc3luLzMuMC42IFwKKyAgICBjcmF0ZTovL2NyYXRl
cy5pby9zeW4vMy4wLjkgXAogICAgIGNyYXRlOi8vY3JhdGVzLmlvL3N5bnN0cnVjdHVyZS8wLjEz
LjIgXAogICAgIGNyYXRlOi8vY3JhdGVzLmlvL3Rhci1jb2RlYy8wLjAuMTYgXAogICAgIGNyYXRl
Oi8vY3JhdGVzLmlvL3Rhci1mcmFtaW5nLzAuMC4xNiBcCkBAIC0yMTUsMTIgKzIxNSwxMiBAQCBT
UkNfVVJJICs9ICIgXAogICAgIGNyYXRlOi8vY3JhdGVzLmlvL3RpbnlzdHIvMC44LjIgXAogICAg
IGNyYXRlOi8vY3JhdGVzLmlvL3Rpbnl2ZWMvMS4xMS4wIFwKICAgICBjcmF0ZTovL2NyYXRlcy5p
by90aW55dmVjX21hY3Jvcy8wLjEuMSBcCi0gICAgY3JhdGU6Ly9jcmF0ZXMuaW8vdG9raW8vMS41
My4yIFwKKyAgICBjcmF0ZTovL2NyYXRlcy5pby90b2tpby8xLjU0LjEgXAogICAgIGNyYXRlOi8v
Y3JhdGVzLmlvL3Rva2lvLW1hY3Jvcy8yLjcuMCBcCiAgICAgY3JhdGU6Ly9jcmF0ZXMuaW8vdG9r
aW8tc3RyZWFtLzAuMS4xOSBcCi0gICAgY3JhdGU6Ly9jcmF0ZXMuaW8vdG9tbC8xLjEuNitzcGVj
LTEuMS4wIFwKLSAgICBjcmF0ZTovL2NyYXRlcy5pby90b21sX2RhdGV0aW1lLzEuMS4xK3NwZWMt
MS4xLjAgXAotICAgIGNyYXRlOi8vY3JhdGVzLmlvL3RvbWxfZWRpdC8wLjI1LjE1K3NwZWMtMS4x
LjAgXAorICAgIGNyYXRlOi8vY3JhdGVzLmlvL3RvbWwvMS4xLjgrc3BlYy0xLjEuMCBcCisgICAg
Y3JhdGU6Ly9jcmF0ZXMuaW8vdG9tbF9kYXRldGltZS8xLjEuMytzcGVjLTEuMS4wIFwKKyAgICBj
cmF0ZTovL2NyYXRlcy5pby90b21sX2VkaXQvMC4yNS4xNytzcGVjLTEuMS4wIFwKICAgICBjcmF0
ZTovL2NyYXRlcy5pby90b21sX3BhcnNlci8xLjEuNStzcGVjLTEuMS4wIFwKICAgICBjcmF0ZTov
L2NyYXRlcy5pby90b21sX3dyaXRlci8xLjEuMytzcGVjLTEuMS4wIFwKICAgICBjcmF0ZTovL2Ny
YXRlcy5pby90cmFjaW5nLzAuMS40NCBcCkBAIC0yMzgsNyArMjM4LDcgQEAgU1JDX1VSSSArPSAi
IFwKICAgICBjcmF0ZTovL2NyYXRlcy5pby91cmwvMi41LjggXAogICAgIGNyYXRlOi8vY3JhdGVz
LmlvL3V0ZjhfaXRlci8xLjAuNCBcCiAgICAgY3JhdGU6Ly9jcmF0ZXMuaW8vdXRmOHBhcnNlLzAu
Mi4yIFwKLSAgICBjcmF0ZTovL2NyYXRlcy5pby91dWlkLzEuMjguMCBcCisgICAgY3JhdGU6Ly9j
cmF0ZXMuaW8vdXVpZC8xLjI5LjAgXAogICAgIGNyYXRlOi8vY3JhdGVzLmlvL3ZhbHVhYmxlLzAu
MS4xIFwKICAgICBjcmF0ZTovL2NyYXRlcy5pby92ZXJzaW9uX2NoZWNrLzAuOS41IFwKICAgICBj
cmF0ZTovL2NyYXRlcy5pby92dGUvMC4xNC4xIFwKQEAgLTMxMyw3ICszMTMsNyBAQCBTUkNfVVJJ
W2FycmF5dmVjLTAuNy44LnNoYTI1NnN1bV0gPSAiZDNmYjY3YTZlMDhhY2YyNGZkZWNjYmFjMmNi
NmFjNDMwNTgyNWJkMWYxMQogU1JDX1VSSVthc3RyYWwtbWFpbC1oZWFkZXJzLTAuMC4xLnNoYTI1
NnN1bV0gPSAiZGMwMTllY2NhODJjZmM5MWZmYTMxYWI0ZmZlNzA1YWFhNzA2Mzk5ODQwYTcxNTI5
MjZiN2VlZTczNmRhNDEwYSIKIFNSQ19VUklbYXN0cmFsLXRva2lvLXRhci0wLjcuMS5zaGEyNTZz
dW1dID0gIjgyMWVkMzZkYWY3YzQwZDAwYTdiNjI3NTlmOTgzM2ZiMjc5ZmI3Yzg3ZGQ5ODllYzBh
NGQ2MjZkY2Q4ZDFkY2EiCiBTUkNfVVJJW2FzdHJhbC12ZXJzaW9uLXJhbmdlcy0wLjIuMy5zaGEy
NTZzdW1dID0gImIzMTVhY2M0ZGM3ZjBkM2NjZGQ1NTdhMDFiNmE4OWZhMmQ4OTZlOTlhNDUwYjk4
ZTgyOWZjODE1MmYwYjJmOTgiCi1TUkNfVVJJW2FzdHJhbF9hc3luY196aXAtMC4wLjIyLnNoYTI1
NnN1bV0gPSAiMGY4NTA4ZDA5YzZiYzZhYmQ0Mjc2N2QxZDQzYzc3MDI4OTE2OTE0ODQ4NzVjZTk0
Zjc5OTdkYTEzMDFkOTVlOSIKK1NSQ19VUklbYXN0cmFsX2FzeW5jX3ppcC0wLjAuMjQuc2hhMjU2
c3VtXSA9ICJhZGVmYjk4MjM0ZDkwZTk4OTQ0YzdiOTUyYWQwODgyY2NkOTAwOWY5YThmZTY1ZDA4
NmYxOTlmYzQ5YTNmMTlmIgogU1JDX1VSSVthc3luYy1jb21wcmVzc2lvbi0wLjQuNTAuc2hhMjU2
c3VtXSA9ICJlZTE5YmQ5OWI0M2UzNjkxYWNiYWQ0ZTg0MDQyMGE0ODgxY2VhNmMwYjY2YTIwODEy
NWE4MjRmOGZkNTNmNWExIgogU1JDX1VSSVthdXRvY2ZnLTEuNS4wLnNoYTI1NnN1bV0gPSAiYzA4
NjA2ZjhjM2NiZjRjZTZlYzhlMjhmYjAwMTRhMmMwODY3MDhmZTk1NGVhYTg4NTM4NGE2MTY1MTcy
ZTdlOCIKIFNSQ19VUklbYmFja29uLTEuNi4wLnNoYTI1NnN1bV0gPSAiY2ZmYjBlOTMxODc1YjY2
NmZjNGZjYjIwZmVlNTJlOWJiZDFlZjgzNmZkOWU5ZTA0ZWMyMTU1NWY5Zjg1ZjdlZiIKQEAgLTM0
Miw3ICszNDIsNyBAQCBTUkNfVVJJW2NvbXByZXNzaW9uLWNvcmUtMC40LjMzLnNoYTI1NnN1bV0g
PSAiNmU4Y2NjNGVhOWY2YWNjMzJkMTAyYzBmNmQ0NzFkMTFkOQogU1JDX1VSSVtjb25zb2xlLTAu
MTYuNi5zaGEyNTZzdW1dID0gImU5NmE0OTU2Nzc0YzEzYzEyNmE4YjVhZjRkYWE3OTM4NGY0ZDgy
NjUzNGM5NWEwMmQ3NmFmYjM5ZTJhYjY0ZTMiCiBTUkNfVVJJW2NwdWZlYXR1cmVzLTAuMi4xNy5z
aGEyNTZzdW1dID0gIjU5ZWQ1ODM4ZWViYjI2YTJiYjJlNThmNmQ1YjUzMTY5ODlhZTlkMDhiYWIx
MGUwZTZkMTAzZTY1NmQxYjAyODAiCiBTUkNfVVJJW2NwdWZlYXR1cmVzLTAuMy4wLnNoYTI1NnN1
bV0gPSAiOGIyYTQxMzkzZjY2ZjE2YjA4MjNiYjc5MDk0ZDU0YWM1ZmJkMzRhYjI5MmRkYWZiOWEw
NDU2YWM5Zjg3ZDIwMSIKLVNSQ19VUklbY3JjMzJmYXN0LTEuNS4yLnNoYTI1NnN1bV0gPSAiMDFh
Nzc5OWZkNmI4NTJkYjBlNjE3MjhkZGU5YTIwNGM0MjNiNDRkNjg5ZGJkNDMyNTIyNTQzNjE0YjQ5
MGU3OCIKK1NSQ19VUklbY3JjMzJmYXN0LTEuNS4zLnNoYTI1NnN1bV0gPSAiMGJhMTA2ZTg0NDA0
NWRkYzAyYzIwNzY4YWM0YjBiN2NiNDVmMmNjMmVjYmQ4MzNhYzlmNWRhY2IxODNjMjA1NSIKIFNS
Q19VUklbY3J5cHRvLWNvbW1vbi0wLjEuNy5zaGEyNTZzdW1dID0gIjc4YzgyOTIwNTVkMWMxZGYw
Y2NlNWQxODAzOTNkYzhjY2UwYWJlYzBhNzEwMmFkYjZjN2IxZWVmNjAxNmQ2MGEiCiBTUkNfVVJJ
W2NyeXB0by1jb21tb24tMC4yLjIuc2hhMjU2c3VtXSA9ICJjZTZlNGM5NjFkNmNkNmM5YTg2ZGI0
MTgzODc0MjVlOGJkZWFmMDViM2M4YmMxNDExZTZkY2E0YzI1MmYxNDUzIgogU1JDX1VSSVtjc3Yt
MS40LjAuc2hhMjU2c3VtXSA9ICI1MmNkOWQ2OGNmN2VmYzZkZGZhYWVlNDJlNzI4OGQzYTk5ZDYx
M2Q0YjUwZjc2Y2U5ODI3YWUwYzZlMTRmOTM4IgpAQCAtNDE0LDcgKzQxNCw3IEBAIFNSQ19VUklb
amlmZi1zdGF0aWMtMC4yLjM4LnNoYTI1NnN1bV0gPSAiMmNjOTgxNzI1M2NmN2M3ZWU0Njg0NDUx
YmQzMjdlODhkNmYzNjU4CiBTUkNfVVJJW2pzLXN5cy0wLjMuOTEuc2hhMjU2c3VtXSA9ICJiNDk3
MTViNzA3M2YzODViYTRiYzUyOGU1NzQ3ZDAyZTY2Y2IzOWM2MTQ2ZWZiNjZiNzgxZjEzMWYwZmIz
OTljIgogU1JDX1VSSVtqdW5jdGlvbi0yLjEuMC5zaGEyNTZzdW1dID0gImNkZTQ4ZjM2NTMwY2Jk
OTFiNjVmMDUwMTAxZTZjMDU2ZDZlYjc0M2NlYTJhOGYwZjE5YmVlZjY5YzY3NDJmZjgiCiBTUkNf
VVJJW2xhenlfc3RhdGljLTEuNS4wLnNoYTI1NnN1bV0gPSAiYmJkMmJjYjRjOTYzZjJkZGFlMDZh
MmVmYzdlOWYzNTkxMzEyNDczYzUwYzY2ODVlMWYyOTgwNjgzMTZlNjZmZSIKLVNSQ19VUklbbGli
Yy0wLjIuMTg5LnNoYTI1NnN1bV0gPSAiM2VhZjNlZGUzZmVlNmRiMWE0YzJlZTA5MWJmOGE4YjRk
Y2NkYzZkMTdmNjU2ZmIwNzg5NmVlNzI4Njc2MTJmMiIKK1NSQ19VUklbbGliYy0wLjIuMTkxLnNo
YTI1NnN1bV0gPSAiNjVjZDg3YzlhNmQ2MDUzNjU4MGIzMTZhZDk4NTcyNjEwNDczMGE1MTUxYzk5
ODQ1ZjI0OTA0MjhlZjkxMjQwYSIKIFNSQ19VUklbbGludXgtcmF3LXN5cy0wLjEyLjEuc2hhMjU2
c3VtXSA9ICIzMmE2Njk0OWUwMzBkYTAwZThjN2Q0NDM0YjI1MTY3MGE5MTU1NmY0MTQ0OTQxZDM3
NDUyNzY5YzI1ZDU4YTUzIgogU1JDX1VSSVtsaXRlbWFwLTAuOC4xLnNoYTI1NnN1bV0gPSAiNjM3
MzYwN2E1OWYwYmU3M2EzOWI2ZmU0NTZiODE5MmZjYzM1ODVmNjAyYWYyMDc1MTYwMGU5NzRkZDQ1
NWU3NyIKIFNSQ19VUklbbG9ja19hcGktMC40LjE0LnNoYTI1NnN1bV0gPSAiMjI0Mzk5ZTc0Yjg3
YjVmMzU1NzUxMWQ5OGRmZjhiMTQwODliM2RhZGFmY2FiNmJiOTNlYWI2N2QzYWFjZTk2NSIKQEAg
LTQ3MCw4ICs0NzAsOCBAQCBTUkNfVVJJW3J1c3RpeC1saW51eC1wcm9jZnMtMC4xLjEuc2hhMjU2
c3VtXSA9ICIyZmM4NGJmN2U5YWExNmM0ZjJjNzU4ZjI3NDEyZGM5OAogU1JDX1VSSVtydXN0dmVy
c2lvbi0xLjAuMjIuc2hhMjU2c3VtXSA9ICJiMzljZGVmMGZhODAwZmM0NDUyNWM4NGNjYjU0YTAy
OTk2MWE4MjE1Zjk2MTk3NTM2MzVhOWMwZDI1MzhkNDZkIgogU1JDX1VSSVtyeXUtMS4wLjIzLnNo
YTI1NnN1bV0gPSAiOTc3NGJhNGE3NGRlNWY3YjFjMTQ1MWVkNmNkNTI4NWEzMmVkZGI1Y2NjYjhj
YzY1NWE0ZTUwMDA5ZTA2NDc3ZiIKIFNSQ19VUklbc2FtZS1maWxlLTEuMC42LnNoYTI1NnN1bV0g
PSAiOTNmYzFkYzNhYWE5YmZlZDk1ZTAyZTZlYWRhYmI0YmFmN2UzMDc4YjBiZDFiNGQ3YjZiMGI2
ODM3ODkwMDUwMiIKLVNSQ19VUklbc2NoZW1hcnMtMS4yLjIuc2hhMjU2c3VtXSA9ICI2ODcyNzRk
MjkzYjZjZGM2ZTczZTBmZWU1MjBiZjIwNDk2NTAwOTBkNzE2NGY4NzY3MmQyMTJhM2M1MzBjZjRh
IgotU1JDX1VSSVtzY2hlbWFyc19kZXJpdmUtMS4yLjIuc2hhMjU2c3VtXSA9ICJkOThjNjc3MTZi
NDZhZjJmMGI4Y2Y3NTJhYmM5MzBmNmY5YWVjZmJmNjcxZWNmYjUzMWRiOGEzMWRiZTRlMmJhIgor
U1JDX1VSSVtzY2hlbWFycy0xLjIuMy5zaGEyNTZzdW1dID0gImFiNTA4ODI2Zjc0YTc3Y2E5ZDVh
YmE2ZmYxOWI1MjI1ODNlZTNlYWYyOGExOTM4NGZmM2QwZTU4MzVmYWRmNmUiCitTUkNfVVJJW3Nj
aGVtYXJzX2Rlcml2ZS0xLjIuMy5zaGEyNTZzdW1dID0gImUxYzNhOTIwOTRmYTdkNjFhYTEyNDY0
NTg0NGZhY2I2YjU1NGRmYzc5NzEzNmQwZjVmZDFmODkwZTJiZmZjNjkiCiBTUkNfVVJJW3Njb3Bl
Z3VhcmQtMS4yLjAuc2hhMjU2c3VtXSA9ICI5NDE0M2YzNzcyNTEwOWY5MmMyNjJlZDJjZjVlNTli
Y2U3NDk4YzAxYmNjMTUwMmQ3YjlhZmU0MzlhNGU5ZjQ5IgogU1JDX1VSSVtzZWFoYXNoLTQuMS4w
LnNoYTI1NnN1bV0gPSAiMWMxMDdiNmY0NzgwODU0YzhiMTI2ZTIyOGVhODg2OWY0ZDdiNzEyNjBm
OTYyZmVmYjU3Yjk5NmI4OTU5YmE2YiIKIFNSQ19VUklbc2VsZi1yZXBsYWNlLTEuNS4wLnNoYTI1
NnN1bV0gPSAiMDNlYzgxNWI1ZWFiNDIwYWI4OTNmNjMzOTM4NzhkODljOTBmZGQ5NGMwYmNjNDRj
MDdhYmI4YWQ5NTU1MmZiNyIKQEAgLTQ3OSw4ICs0NzksOCBAQCBTUkNfVVJJW3NlcmRlLTEuMC4y
Mjkuc2hhMjU2c3VtXSA9ICI0MTQ4NTkwYWZlYmFkYTM4NjY4OGYxODc3M2RhNjE3NzkyYmYyZWYw
M2ZmYwogU1JDX1VSSVtzZXJkZV9jb3JlLTEuMC4yMjkuc2hhMjU2c3VtXSA9ICI2N2RjYTJjOWM1
MWU1OGE0NzkxYTRiMWVkNTgzMDhiMzljNjQyMjRkMzQ5YTkzNWFiNTAzOWFhMzYwOTQyYTQ4Igog
U1JDX1VSSVtzZXJkZV9kZXJpdmUtMS4wLjIyOS5zaGEyNTZzdW1dID0gImU3YTVkNzEyNjNhNWE3
ZDQ3YjQxZjZiM2YwNmJhMjc2ZjEwY2MxOGIwOTMxZjE3OTlmNzEwNTc4ZTIzMDkzNDgiCiBTUkNf
VVJJW3NlcmRlX2Rlcml2ZV9pbnRlcm5hbHMtMC4zMC4wLnNoYTI1NnN1bV0gPSAiZjg1MjEzN2Nj
ZTAzNWQ2YTRkZjY3Y2NjZTUwNWZmNmIzZTlmZDNhMTBlM2U1MmIyNGRjNzFlNjUwYmIxYTliZCIK
LVNSQ19VUklbc2VyZGVfanNvbi0xLjAuMTUxLnNoYTI1NnN1bV0gPSAiYzg0MWI1NWVjZGFlMDk4
YzgwZGNhZTljZjc2N2Y2ZjhhMGMyY2RiMzQxNmJiZWY3MjE4MWRmNGQwZmU3M2YxNCIKLVNSQ19V
Uklbc2VyZGVfc3Bhbm5lZC0xLjEuMS5zaGEyNTZzdW1dID0gIjY2NjJiNTg3OTUxMWUwNmU4OTk5
YThhMjM1ZDg0ODExM2U5NDJjOTEyNGYyMTE1MTFiMTY0NjZlZTI5OTVmMjYiCitTUkNfVVJJW3Nl
cmRlX2pzb24tMS4wLjE1NC5zaGEyNTZzdW1dID0gImU3ZTljYzhiMWI4NTI2NDA3NGZiY2MwMmE4
ODY4MGM0MDk2YjFlNDdkZjhmNzM5ZGNlYjAzYmY0ODJmMDRiZDYiCitTUkNfVVJJW3NlcmRlX3Nw
YW5uZWQtMS4xLjMuc2hhMjU2c3VtXSA9ICI5YzE4N2UwYTM2OTQ3MWM1NTBhZjAyOGNiYTU2ZDRm
NGZhMmE0ODlhZDI4MTUxYWU5NWE0ZDM0MGEyYThiNzgyIgogU1JDX1VSSVtzaGEyLTAuMTAuOS5z
aGEyNTZzdW1dID0gImE3NTA3ZDgxOTc2OWQwMWEzNjVhYjcwNzc5NGE0MDg0MzkyYzgyNGY1NGE3
YTZhNzg2MmY4YzNkMDg5MmIyODMiCiBTUkNfVVJJW3NoYTItMC4xMS4wLnNoYTI1NnN1bV0gPSAi
NDQ2YmE3MTc1MDk1MjRjYjNmMjJmMTdlY2MwOTZmMTBmNDgyMmQ3NmFiNWMwYjk4MjJjNWY5YzI4
NGU4MjVmNCIKIFNSQ19VUklbc2hhcmRlZC1zbGFiLTAuMS43LnNoYTI1NnN1bV0gPSAiZjQwY2Ez
YzQ2ODIzNzEzZTBkNDIwOTU5MmU4ZDZlODI2YWE1N2U5MjhmMDk3NTI2MTlmYzY5NmM0OTk2Mzdm
NiIKQEAgLTQ4OSw3ICs0ODksNyBAQCBTUkNfVVJJW3NpbWQtYWRsZXIzMi0wLjMuOC5zaGEyNTZz
dW1dID0gImUzMjBhNmM1YWQzMWQyNzFhZDUyM2RjZjNhZDEzZTI3NjdhZDhiMQogU1JDX1VSSVtz
aW1kdXRmOC0wLjEuNS5zaGEyNTZzdW1dID0gImUzYTlmZTM0ZTNlN2E1MDMxNjA2MDM1MWYzNzE4
N2EzZjU0NmJjZTk1NDk2MTU2NzU0YjYwMWE1ZmE3MWI3NmUiCiBTUkNfVVJJW3NpbWlsYXItMi43
LjAuc2hhMjU2c3VtXSA9ICJiYmJiNWQ5NjU5MTQxNjQ2YWU2NDdiNDJmZTA5NGRhZjZjNjE5MmQx
NjIwODcwYjQ0OWQ5NTU3Zjc0OGIyZGFhIgogU1JDX1VSSVtzbGFiLTAuNC4xMi5zaGEyNTZzdW1d
ID0gIjBjNzkwZGUyMzEyNGY5YWI0NDU0NGQ3YWMwNWQ2MDQ0MGFkYzU4NjQ3OWNlNTAxYzFkNmQ3
ZGEzY2Q4YzljZjUiCi1TUkNfVVJJW3NtYWxsdmVjLTEuMTYuMi5zaGEyNTZzdW1dID0gImY5Mzk1
ZjBmMGVlZTg0OWE5YjcwN2IyZjA2YmI5MmE2YTQyMjA5MGUyMTIzYmIyZWY4ZTg3YTBlNjE4OTJh
OGUiCitTUkNfVVJJW3NtYWxsdmVjLTEuMTYuNC5zaGEyNTZzdW1dID0gImQwZDVkNGIxOTgxYjhi
YmJiN2FlZDIwNGNhZTU3MjZkNjgzZDVkNmFjN2U3NGVjNTQxMjJlYTI4ZjMxNWU3YzgiCiBTUkNf
VVJJW3NtYXdrLTAuMy4yLnNoYTI1NnN1bV0gPSAiYjdjMzg4YzFiNWU5Mzc1NmQwYzc0MDk2NWM0
MWU4ODIyZjg2NjYyMWQ0MWFjYmRmNjMzNmE2YTE2OGY4ODQwYyIKIFNSQ19VUklbc29ja2V0Mi0w
LjYuMy5zaGEyNTZzdW1dID0gIjNhNzY2ZTExMTA3ODhjMzZmNGZhMWMyYjcxYjM4N2E3ODE1YWE2
NWY4OGNlMDIyOTg0MTgyNjYzM2Q5MzcyM2UiCiBTUkNfVVJJW3NwZHgtMC4xMy42LnNoYTI1NnN1
bV0gPSAiNjQ2YzVhMzY3ZGE5MTRlM2JhYmNiOWNkOGU5MWMzN2NjYWFjNDIzMjViOGY4NmYwMzY1
MTNhZDEwM2YyYTcxNiIKQEAgLTQ5Nyw3ICs0OTcsNyBAQCBTUkNfVVJJW3N0YWJsZV9kZXJlZl90
cmFpdC0xLjIuMS5zaGEyNTZzdW1dID0gIjZjZTJiZThkYzI1NDU1ZTFmOTFkZjcxYmZhMTJhZDM3
ZAogU1JDX1VSSVtzdHJpcC1hbnNpLWVzY2FwZXMtMC4yLjEuc2hhMjU2c3VtXSA9ICIyYThmODAz
OGU3ZTc5NjlhYmIzZjFiN2MyYTgxMTIyNWU5Mjk2ZGEyMDg1MzllMGY3OWM1MjUxZDZjYWMwMDI1
IgogU1JDX1VSSVtzdHJzaW0tMC4xMS4xLnNoYTI1NnN1bV0gPSAiN2RhOGI1NzM2ODQ1ZDlmMmZj
YjgzN2VhNWQ5ZTI2Mjg1NjRiM2IwNDNhNzA5NDhhM2YwYjc3ODgzOGM1ZmI0ZiIKIFNSQ19VUklb
c3luLTIuMC4xMTguc2hhMjU2c3VtXSA9ICIxYjlhZTU3ZjkwNDIxM2ViYjY0OWNlNjg5NWI4YTY2
YzY2ZjAyMDNiOTMxOTcxOGY2OWE1NjEyYTA2NWIxNDIyIgotU1JDX1VSSVtzeW4tMy4wLjYuc2hh
MjU2c3VtXSA9ICI4NTkzZThlNzIxNTllZDIyNTdkMDgzYzdhNDU0YTg1Y2JmODU0ZjM3YTA5NjZk
OGQ0ODNhZmY4YzhhM2ViY2VlIgorU1JDX1VSSVtzeW4tMy4wLjkuc2hhMjU2c3VtXSA9ICJkNzhj
OGRlZTRjN2JmMGUxNDY3MzA5NzI1NmZlZDYxNDJjZTlkM2I4NWE0MDgxODlkMDc0ODI0NDIxNDU4
MjNiIgogU1JDX1VSSVtzeW5zdHJ1Y3R1cmUtMC4xMy4yLnNoYTI1NnN1bV0gPSAiNzI4YTcwZjNk
YmFmNWJhYjdmMGM0YjFhYzhkN2FlNWVhNjBhNGI1NTQ5YzhhNTkxNDM2MWM5OTE0N2E3MDlkMiIK
IFNSQ19VUklbdGFyLWNvZGVjLTAuMC4xNi5zaGEyNTZzdW1dID0gIjY4NzViYTUwN2JiZWM2MDIy
NTAwZjQ2NDc3MTU5YTAzZjA3ZWJkZmZkYjRlYTA0MzI1NDk3NDUzMWRmMWRhYzIiCiBTUkNfVVJJ
W3Rhci1mcmFtaW5nLTAuMC4xNi5zaGEyNTZzdW1dID0gIjQ5NzI3YjFhMzAwNTE0OTYwZDQyNWQw
ZTc0MWE3ZGEzZTY5MzE3MGYzZGIzOWRlMzE4MGZkYmJjMDdlNTQyYzUiCkBAIC01MTEsMTIgKzUx
MSwxMiBAQCBTUkNfVVJJW3RocmVhZF9sb2NhbC0xLjEuOS5zaGEyNTZzdW1dID0gImY2MDI0NmE0
OTQ0ZjI0ZjZlMDE4YWExN2NkZWZmYjc4MThiNzYzNQogU1JDX1VSSVt0aW55c3RyLTAuOC4yLnNo
YTI1NnN1bV0gPSAiNDJkM2U5YzQ1YzA5ZGUxNWQwNmRkOGFjZjVmNGUwZTM5OWU4NTkyN2I3ZjAw
NzExMDI0ZWI3YWUxMGZhNDg2OSIKIFNSQ19VUklbdGlueXZlYy0xLjExLjAuc2hhMjU2c3VtXSA9
ICIzZTYxZTY3MDUzZDI1YTRlODJjODQ0ZTg0MjQwMzlkOTc0NTc4MWIzZmM0ZjMyYjhkNTVlZDUw
ZjVmNjY3ZWYzIgogU1JDX1VSSVt0aW55dmVjX21hY3Jvcy0wLjEuMS5zaGEyNTZzdW1dID0gIjFm
M2NjYmFjMzExZmVhMDVmODZmNjE5MDRiNDYyYjU1ZmIzZGY4ODM3YTM2NmRmYzYwMWEwMTYxZDA1
MzJmMjAiCi1TUkNfVVJJW3Rva2lvLTEuNTMuMi5zaGEyNTZzdW1dID0gImU5NWY5MWZjYzdhNjIx
ZThiMDMwZjZhYTIzYzcxZmU5ODM4YWUyZmI0ZDgxMThiNzU2MDJhMzI4ZjUxNDQwNDQiCitTUkNf
VVJJW3Rva2lvLTEuNTQuMS5zaGEyNTZzdW1dID0gImI1MmZkMzI1NTI1OGQyNmZhYzcyNjRhYjVh
NzZiNTNjMTMzNjcxMzZkYzAxMWQzZDZhZDRmOGVkMDcwMzk2YTMiCiBTUkNfVVJJW3Rva2lvLW1h
Y3Jvcy0yLjcuMC5zaGEyNTZzdW1dID0gIjM4NWE2Y2I3MWFiOWFiNzkwYzVmZThkNjdmMTY0NWU2
YzQ1MGE3Y2UwMDZhMzNkZTAzZGFhOTU2Y2Y3MGE0OTYiCiBTUkNfVVJJW3Rva2lvLXN0cmVhbS0w
LjEuMTkuc2hhMjU2c3VtXSA9ICJhM2QwNmYwYjA4MmJhNTdjMjZiNzk0MDczNzJlNTdjZjJhMWUy
ODEyNGY3OGU5NDc5ZmU4MDMyMmNmNTM0MjBiIgotU1JDX1VSSVt0b21sLTEuMS42K3NwZWMtMS4x
LjAuc2hhMjU2c3VtXSA9ICI5MjA2MDI1NDNmMDkxMWFiNzFkYTEyYzUwZDU5NzAxZGE1NGMxOTZk
MWEyYmY1Y2I0Yjc1NjY3ZjEzN2E0MDZhIgotU1JDX1VSSVt0b21sX2RhdGV0aW1lLTEuMS4xK3Nw
ZWMtMS4xLjAuc2hhMjU2c3VtXSA9ICIzMTY1ZjY1ZjYyZTI4ZTAxMTVhMDBiMmViZGQzN2ViNmYz
YjY0MTg1NWY5ZDYzNmQzY2Q0MTAzNzY3MTU5YWQ3IgotU1JDX1VSSVt0b21sX2VkaXQtMC4yNS4x
NStzcGVjLTEuMS4wLnNoYTI1NnN1bV0gPSAiMTM0MGVhOTRhNTg1NjMzMzQ5MmM5MDY0YjAyYzc3
OGIxOTFkZDJjODUzNzc4ZDk2MDlkZWJkY2RmZWEzYTYxNCIKK1NSQ19VUklbdG9tbC0xLjEuOCtz
cGVjLTEuMS4wLnNoYTI1NnN1bV0gPSAiMjA0ODllMDBlNGQ4NzQxZDZiZTY4MDc2NGNjMTJlMjcw
NjU1ZTM3NWEyMGQxMDExZTg0NGE5YzMzNzllNjc4ZCIKK1NSQ19VUklbdG9tbF9kYXRldGltZS0x
LjEuMytzcGVjLTEuMS4wLnNoYTI1NnN1bV0gPSAiMTczZjI1Yzg4M2NkMjE3NmEyZDgyMTIxNTU2
MzhjMGE2MGQ0ODRhOWQ4NDU0NmQyNzA4NjZmNDBmNTZiNmU0OSIKK1NSQ19VUklbdG9tbF9lZGl0
LTAuMjUuMTcrc3BlYy0xLjEuMC5zaGEyNTZzdW1dID0gImUzNjQxZDViYmI1MzQ5YTc5ZTEwMjBh
MjQyZDI1MWVmYmM1NDZhZDgwNDhkMTMzOTU4MzIzY2U5YzQwYTljOWMiCiBTUkNfVVJJW3RvbWxf
cGFyc2VyLTEuMS41K3NwZWMtMS4xLjAuc2hhMjU2c3VtXSA9ICJiYWE2OTNhODAzMmQ3ZTFjYWRh
N2QwMDQxZTk2MTI2ZGYyNDMxNzlmZjA2MTQ1Njc4M2FjN2YxMmJkYTQ3NDRjIgogU1JDX1VSSVt0
b21sX3dyaXRlci0xLjEuMytzcGVjLTEuMS4wLnNoYTI1NnN1bV0gPSAiMDZiZGJkOGNmYzA1NmI4
ZDJlMmU4NWYyOWI1NmEzYmRiZWNiNTI3Y2VmODFlYjM5ZTNlN2I5OGFmNDY1Mjc3MCIKIFNSQ19V
UklbdHJhY2luZy0wLjEuNDQuc2hhMjU2c3VtXSA9ICI2M2U3MTY2MmZhNGIyYTJjM2EyNmY1NzBm
MDM3ZWI5NWJiMWY4NTM5N2YzY2Q4MDc2Y2FlZDJmMDI2YTZkMTAwIgpAQCAtNTM0LDcgKzUzNCw3
IEBAIFNSQ19VUklbdW5zY2FubnktMC4xLjAuc2hhMjU2c3VtXSA9ICJlOWRmMmFmMDY3YTc5NTNl
OWMzODMxMzIwZjM1YzFjYzA2MDBjMzBkNDRkCiBTUkNfVVJJW3VybC0yLjUuOC5zaGEyNTZzdW1d
ID0gImZmNjdhOGE0Mzk3MzczYzNlZjY2MDgxMmFjYWIzMjY4MjIyMDM1MDEwYWI4NjgwZWM0MjE1
ZjM4YmEzZDBlZWQiCiBTUkNfVVJJW3V0ZjhfaXRlci0xLjAuNC5zaGEyNTZzdW1dID0gImI2YzE0
MDYyMGU3ZmZiYjIyYzJkZWU1OWNhZmU2MDg0YTU5YjVmZmMyN2E4ODU5YTVmMGQ0OTRiNWQ1MmI2
YmUiCiBTUkNfVVJJW3V0ZjhwYXJzZS0wLjIuMi5zaGEyNTZzdW1dID0gIjA2YWJkZTM2MTE2NTdh
ZGY2NmQzODNmMDBiMDkzZDdmYWVjYzdmYTU3MDcxY2NlMjU3ODY2MGM5ZjEwMTA4MjEiCi1TUkNf
VVJJW3V1aWQtMS4yOC4wLnNoYTI1NnN1bV0gPSAiN2NjMTE4NjM4NGJlYjdkZDhlZWRlYTM3NjQx
M2ZkNjU0OTM3Mjg1ZWE2YzljZmJiOTI4ZGMzMDQzZWE0YjYwNiIKK1NSQ19VUklbdXVpZC0xLjI5
LjAuc2hhMjU2c3VtXSA9ICI0YTBlMmQxMTYyMGM1MDY5NWZlMTJiYmJmZGU5NmIzNDc3ZmU2MDZl
NzI4NGMyMmQ1MDVjMTJjZTUxMjE0NTE0IgogU1JDX1VSSVt2YWx1YWJsZS0wLjEuMS5zaGEyNTZz
dW1dID0gImJhNzNlYTljZjE2YTI1ZGYwYzhjYWExNmM1MWFjYjkzN2Q1NzEyYTg0MjlkYjc4YTNl
ZTI5ZDVkY2FjZDNhNjUiCiBTUkNfVVJJW3ZlcnNpb25fY2hlY2stMC45LjUuc2hhMjU2c3VtXSA9
ICIwYjkyOGYzM2Q5NzVmYzZhZDlmODZjOGYyODM4NTNhZDI2YmRkNWIxMGI3ZjE1NDJhYTJmYTE1
ZTIyODkxMDVhIgogU1JDX1VSSVt2dGUtMC4xNC4xLnNoYTI1NnN1bV0gPSAiMjMxZmRjZDdlZjMw
MzdlODMzMGQ4ZTE3ZTYxMDExYTJjMjQ0MTI2YWNjMGE5ODJmNDA0MGFjM2Y5ZjBiYzA3NyIKZGlm
ZiAtLWdpdCBhL21ldGEvcmVjaXBlcy1kZXZ0b29scy9weXRob24vcHl0aG9uMy11di1idWlsZF8w
LjEzLjguYmIgYi9tZXRhL3JlY2lwZXMtZGV2dG9vbHMvcHl0aG9uL3B5dGhvbjMtdXYtYnVpbGRf
MC4xMy4xMC5iYgpzaW1pbGFyaXR5IGluZGV4IDkyJQpyZW5hbWUgZnJvbSBtZXRhL3JlY2lwZXMt
ZGV2dG9vbHMvcHl0aG9uL3B5dGhvbjMtdXYtYnVpbGRfMC4xMy44LmJiCnJlbmFtZSB0byBtZXRh
L3JlY2lwZXMtZGV2dG9vbHMvcHl0aG9uL3B5dGhvbjMtdXYtYnVpbGRfMC4xMy4xMC5iYgppbmRl
eCA2OGFkNDhiMWI4Li5hNDUwODU5MDQ0IDEwMDY0NAotLS0gYS9tZXRhL3JlY2lwZXMtZGV2dG9v
bHMvcHl0aG9uL3B5dGhvbjMtdXYtYnVpbGRfMC4xMy44LmJiCisrKyBiL21ldGEvcmVjaXBlcy1k
ZXZ0b29scy9weXRob24vcHl0aG9uMy11di1idWlsZF8wLjEzLjEwLmJiCkBAIC0xMSw3ICsxMSw3
IEBAIExJQ19GSUxFU19DSEtTVU0gPSAiZmlsZTovL0xJQ0VOU0UtQVBBQ0hFO21kNT04NmQzZjNh
OTVjMzI0Yzk0NzliZDg5ODY5NjhmNDMyNyBcCiAgICAgICAgICAgICAgICAgICAgIGZpbGU6Ly9j
cmF0ZXMvdXYtcGVwNTA4L0xpY2Vuc2UtQXBhY2hlO21kNT1lMjNmYWRkNmNlZWY4YzYxOGZjMWM2
NTE5MWQ4NDZmYSBcCiAgICAgICAgICAgICAgICAgICAgIGZpbGU6Ly9jcmF0ZXMvdXYtcGVwNTA4
L0xpY2Vuc2UtQlNEO21kNT1lZjdhNjAyN2RjNGMyMzg5YjlhZmFkN2U2OTAyNzRjNyIKIAotU1JD
X1VSSVtzaGEyNTZzdW1dID0gIjAzOGMxNmRjNjBkNjNjMzM2Y2I1MzY0MDAwZTExMDY4Yzc5ZGQw
MTQyNjgyZmJkNGFlM2U1NDcwYzExZmRkYzUiCitTUkNfVVJJW3NoYTI1NnN1bV0gPSAiMjlmM2Iw
ZTNhNjM2MzEwYTFlOGQ1ZWZmNjY4NjhmM2I4MDlmMjc1NmM1MzMwMTBjYWQzOTA3NzU0MTIwZDM3
MSIKIAogcmVxdWlyZSAke0JQTn0tY3JhdGVzLmluYwogCi0tIAoyLjQ3LjEKCg==

--===============5692319629430855472==--
