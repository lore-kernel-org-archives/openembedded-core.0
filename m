Return-Path: <auh@yoctoproject.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id A94A9C44501
	for <webhook@archiver.kernel.org>; Sat, 27 Jun 2026 06:08:04 +0000 (UTC)
Received: from a27-45.smtp-out.us-west-2.amazonses.com (a27-45.smtp-out.us-west-2.amazonses.com [54.240.27.45])
 by mx.groups.io with SMTP id smtpd.msgproc02-g2.50868.1782540476549649458
 for <openembedded-core@lists.openembedded.org>;
 Fri, 26 Jun 2026 23:07:56 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@yoctoproject.org header.s=lvjh2tk576v2ro5mi6k4dt3mc6wpqbky header.b=k7tBJlmW;
 dkim=pass header.i=@amazonses.com header.s=hsbnp7p3ensaochzwyq5wwmceodymuwv header.b=IQeEsArX;
 spf=pass (domain: us-west-2.amazonses.com, ip: 54.240.27.45, mailfrom: 0101019f07b11cf9-3ee6fd98-c18c-405e-bf3a-a19cd52b19c5-000000@us-west-2.amazonses.com)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/simple;
	s=lvjh2tk576v2ro5mi6k4dt3mc6wpqbky; d=yoctoproject.org;
	t=1782540475;
	h=Content-Type:MIME-Version:From:To:Cc:Subject:Message-Id:Date;
	bh=T30M/IWwv5ZzcIAWEHm3T0QT9f5p3u0MTPq6cXiOn1E=;
	b=k7tBJlmWRj65idWTvstgAaew8CG+h/C+rvJGX9d6j+vfYIjUdMXtUU/EVMps8ZbH
	a7dXsUvSoYQwoZrVrHl9SenQseIiTo6dsczqP2UfqJFngwy95OLEpk0oOPpLpBmHTgM
	hqsLFm6HxvLwG8X3u6AaDRifoGNN4SYrav38trbo=
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/simple;
	s=hsbnp7p3ensaochzwyq5wwmceodymuwv; d=amazonses.com; t=1782540475;
	h=Content-Type:MIME-Version:From:To:Cc:Subject:Message-Id:Date:Feedback-ID;
	bh=T30M/IWwv5ZzcIAWEHm3T0QT9f5p3u0MTPq6cXiOn1E=;
	b=IQeEsArXcn/e+QVCK8h4+FfZnDqWHD/5+v2+6FtG9fJkVU6AXgyJx0yBC80G4bmO
	AljAeBc4hHRaFXUqx2jCxGcg+VeP88LFXL7VL9naFoOMNyk5LgBtSSBOGtlc5YQsL0s
	Cgixo7htAEQnVAYN5bTvCIYNzDDRuW1KGNExhpzM=
Content-Type: multipart/mixed; boundary="===============1039201330454842021=="
MIME-Version: 1.0
From: auh@yoctoproject.org
To: Trevor Gamblin <tgamblin@baylibre.com>
Cc: openembedded-core@lists.openembedded.org
Subject: [AUH] python3-uv-build: upgrading to 0.11.25 SUCCEEDED
Message-ID: <0101019f07b11cf9-3ee6fd98-c18c-405e-bf3a-a19cd52b19c5-000000@us-west-2.amazonses.com>
Date: Sat, 27 Jun 2026 06:07:55 +0000
Feedback-ID: ::1.us-west-2.9np3MYPs3fEaOBysGKSlUD4KtcmPijcmS9Az2Hwf7iQ=:AmazonSES
X-SES-Outgoing: 2026.06.27-54.240.27.45
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Sat, 27 Jun 2026 06:08:04 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/239678

--===============1039201330454842021==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit

Hello,

this email is a notification from the Auto Upgrade Helper
that the automatic attempt to upgrade the recipe(s) *python3-uv-build* to *0.11.25* has Succeeded.

Next steps:
    - apply the patch: git am 0001-python3-uv-build-upgrade-0.11.21-0.11.25.patch
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
From da83dbe214f80f3584b761bfa09ba85a5101d646 Mon Sep 17 00:00:00 2001
From: Upgrade Helper <auh@yoctoproject.org>
Date: Sat, 27 Jun 2026 05:46:19 +0000
Subject: [PATCH] python3-uv-build: upgrade 0.11.21 -> 0.11.25

---
 .../python/python3-uv-build-crates.inc        | 42 +++++++++++--------
 ...0.11.21.bb => python3-uv-build_0.11.25.bb} |  2 +-
 2 files changed, 25 insertions(+), 19 deletions(-)
 rename meta/recipes-devtools/python/{python3-uv-build_0.11.21.bb => python3-uv-build_0.11.25.bb} (92%)

diff --git a/meta/recipes-devtools/python/python3-uv-build-crates.inc b/meta/recipes-devtools/python/python3-uv-build-crates.inc
index be20115668..4ab12ad8d3 100644
--- a/meta/recipes-devtools/python/python3-uv-build-crates.inc
+++ b/meta/recipes-devtools/python/python3-uv-build-crates.inc
@@ -13,14 +13,14 @@ SRC_URI += " \
     crate://crates.io/anyhow/1.0.102 \
     crate://crates.io/arcstr/1.2.0 \
     crate://crates.io/arrayvec/0.7.6 \
-    crate://crates.io/astral-tokio-tar/0.6.2 \
+    crate://crates.io/astral-tokio-tar/0.6.3 \
     crate://crates.io/astral-version-ranges/0.1.4 \
     crate://crates.io/astral_async_zip/0.0.18 \
     crate://crates.io/async-compression/0.4.19 \
     crate://crates.io/autocfg/1.5.0 \
     crate://crates.io/backon/1.6.0 \
     crate://crates.io/base64/0.22.1 \
-    crate://crates.io/bitflags/2.11.1 \
+    crate://crates.io/bitflags/2.13.0 \
     crate://crates.io/block-buffer/0.10.4 \
     crate://crates.io/boxcar/0.2.14 \
     crate://crates.io/bstr/1.12.1 \
@@ -59,7 +59,6 @@ SRC_URI += " \
     crate://crates.io/erased-serde/0.4.10 \
     crate://crates.io/errno/0.3.14 \
     crate://crates.io/fastrand/2.4.1 \
-    crate://crates.io/filetime/0.2.29 \
     crate://crates.io/find-msvc-tools/0.1.9 \
     crate://crates.io/fixedbitset/0.5.7 \
     crate://crates.io/flate2/1.1.9 \
@@ -98,7 +97,7 @@ SRC_URI += " \
     crate://crates.io/idna_adapter/1.2.1 \
     crate://crates.io/indexmap/2.14.0 \
     crate://crates.io/indoc/2.0.7 \
-    crate://crates.io/insta/1.47.2 \
+    crate://crates.io/insta/1.48.0 \
     crate://crates.io/is_terminal_polyfill/1.70.2 \
     crate://crates.io/itertools/0.14.0 \
     crate://crates.io/itoa/1.0.17 \
@@ -112,6 +111,7 @@ SRC_URI += " \
     crate://crates.io/lazy_static/1.5.0 \
     crate://crates.io/leb128fmt/0.1.0 \
     crate://crates.io/libc/0.2.186 \
+    crate://crates.io/linux-raw-sys/0.4.15 \
     crate://crates.io/linux-raw-sys/0.12.1 \
     crate://crates.io/litemap/0.8.1 \
     crate://crates.io/lock_api/0.4.14 \
@@ -119,7 +119,7 @@ SRC_URI += " \
     crate://crates.io/lzma-sys/0.1.20 \
     crate://crates.io/mailparse/0.16.1 \
     crate://crates.io/matchers/0.2.0 \
-    crate://crates.io/memchr/2.8.1 \
+    crate://crates.io/memchr/2.8.2 \
     crate://crates.io/miniz_oxide/0.8.9 \
     crate://crates.io/mio/1.2.0 \
     crate://crates.io/munge/0.4.7 \
@@ -157,13 +157,14 @@ SRC_URI += " \
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
     crate://crates.io/rustc-hash/2.1.2 \
+    crate://crates.io/rustix/0.38.44 \
     crate://crates.io/rustix/1.1.4 \
     crate://crates.io/rustversion/1.0.22 \
     crate://crates.io/ryu/1.0.23 \
@@ -189,10 +190,11 @@ SRC_URI += " \
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
@@ -233,9 +235,10 @@ SRC_URI += " \
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
@@ -307,14 +310,14 @@ SRC_URI[anstyle-wincon-3.0.11.sha256sum] = "291e6a250ff86cd4a820112fb8898808a366
 SRC_URI[anyhow-1.0.102.sha256sum] = "7f202df86484c868dbad7eaa557ef785d5c66295e41b460ef922eca0723b842c"
 SRC_URI[arcstr-1.2.0.sha256sum] = "03918c3dbd7701a85c6b9887732e2921175f26c350b4563841d0958c21d57e6d"
 SRC_URI[arrayvec-0.7.6.sha256sum] = "7c02d123df017efcdfbd739ef81735b36c5ba83ec3c59c80a9d7ecc718f92e50"
-SRC_URI[astral-tokio-tar-0.6.2.sha256sum] = "cb50a7aae84a03bf55b067832bc376f4961b790c97e64d3eacee97d389b90277"
+SRC_URI[astral-tokio-tar-0.6.3.sha256sum] = "08648fef353ab39a9d26f909ad53fc4f071be4c91853b78523f5cc3d9e5ebffd"
 SRC_URI[astral-version-ranges-0.1.4.sha256sum] = "31979bc305610246d78ac01d63467a12d8454c6e3b8b22b5811d343a1198dfbb"
 SRC_URI[astral_async_zip-0.0.18.sha256sum] = "c15fc5b591f19dfbbbce736615908d74f1d9252bb34b231873cb995f2a997ffb"
 SRC_URI[async-compression-0.4.19.sha256sum] = "06575e6a9673580f52661c92107baabffbf41e2141373441cbcdc47cb733003c"
 SRC_URI[autocfg-1.5.0.sha256sum] = "c08606f8c3cbf4ce6ec8e28fb0014a2c086708fe954eaa885384a6165172e7e8"
 SRC_URI[backon-1.6.0.sha256sum] = "cffb0e931875b666fc4fcb20fee52e9bbd1ef836fd9e9e04ec21555f9f85f7ef"
 SRC_URI[base64-0.22.1.sha256sum] = "72b3254f16251a8381aa12e40e3c4d2f0199f8c6508fbecb9d91f575e0fbb8c6"
-SRC_URI[bitflags-2.11.1.sha256sum] = "c4512299f36f043ab09a583e57bceb5a5aab7a73db1805848e8fef3c9e8c78b3"
+SRC_URI[bitflags-2.13.0.sha256sum] = "b4388bee8683e3d04af747c73422af53102d2bd24d9eadb6cbc100baef4b43f8"
 SRC_URI[block-buffer-0.10.4.sha256sum] = "3078c7629b62d3f0439517fa394996acacc5cbc91c5a20d8c658e77abd503a71"
 SRC_URI[boxcar-0.2.14.sha256sum] = "36f64beae40a84da1b4b26ff2761a5b895c12adc41dc25aaee1c4f2bbfe97a6e"
 SRC_URI[bstr-1.12.1.sha256sum] = "63044e1ae8e69f3b5a92c736ca6269b8d12fa7efe39bf34ddb06d102cf0e2cab"
@@ -353,7 +356,6 @@ SRC_URI[equivalent-1.0.2.sha256sum] = "877a4ace8713b0bcf2a4e7eec82529c029f1d0619
 SRC_URI[erased-serde-0.4.10.sha256sum] = "d2add8a07dd6a8d93ff627029c51de145e12686fbc36ecb298ac22e74cf02dec"
 SRC_URI[errno-0.3.14.sha256sum] = "39cab71617ae0d63f51a36d69f866391735b51691dbda63cf6f96d042b63efeb"
 SRC_URI[fastrand-2.4.1.sha256sum] = "9f1f227452a390804cdb637b74a86990f2a7d7ba4b7d5693aac9b4dd6defd8d6"
-SRC_URI[filetime-0.2.29.sha256sum] = "5c287a33c7f0a620c38e641e7f60827713987b3c0f26e8ddc9462cc69cf75759"
 SRC_URI[find-msvc-tools-0.1.9.sha256sum] = "5baebc0774151f905a1a2cc41989300b1e6fbb29aff0ceffa1064fdd3088d582"
 SRC_URI[fixedbitset-0.5.7.sha256sum] = "1d674e81391d1e1ab681a28d99df07927c6d4aa5b027d7da16ba32d1d21ecd99"
 SRC_URI[flate2-1.1.9.sha256sum] = "843fba2746e448b37e26a819579957415c8cef339bf08564fe8b7ddbd959573c"
@@ -392,7 +394,7 @@ SRC_URI[idna-1.1.0.sha256sum] = "3b0875f23caa03898994f6ddc501886a45c7d3d62d04d2d
 SRC_URI[idna_adapter-1.2.1.sha256sum] = "3acae9609540aa318d1bc588455225fb2085b9ed0c4f6bd0d9d5bcd86f1a0344"
 SRC_URI[indexmap-2.14.0.sha256sum] = "d466e9454f08e4a911e14806c24e16fba1b4c121d1ea474396f396069cf949d9"
 SRC_URI[indoc-2.0.7.sha256sum] = "79cf5c93f93228cf8efb3ba362535fb11199ac548a09ce117c9b1adc3030d706"
-SRC_URI[insta-1.47.2.sha256sum] = "7b4a6248eb93a4401ed2f37dfe8ea592d3cf05b7cf4f8efa867b6895af7e094e"
+SRC_URI[insta-1.48.0.sha256sum] = "86f0f8fee8c926415c58d6ae43a08523a26faccb2323f5e6b644fe7dd4ef6b82"
 SRC_URI[is_terminal_polyfill-1.70.2.sha256sum] = "a6cb138bb79a146c1bd460005623e142ef0181e3d0219cb493e02f7d08a35695"
 SRC_URI[itertools-0.14.0.sha256sum] = "2b192c782037fadd9cfa75548310488aabdbf3d2da73885b31bd0abd03351285"
 SRC_URI[itoa-1.0.17.sha256sum] = "92ecc6618181def0457392ccd0ee51198e065e016d1d527a7ac1b6dc7c1f09d2"
@@ -406,6 +408,7 @@ SRC_URI[junction-2.0.0.sha256sum] = "160f2eade097f30263b548aae5deb12ad349c909baa
 SRC_URI[lazy_static-1.5.0.sha256sum] = "bbd2bcb4c963f2ddae06a2efc7e9f3591312473c50c6685e1f298068316e66fe"
 SRC_URI[leb128fmt-0.1.0.sha256sum] = "09edd9e8b54e49e587e4f6295a7d29c3ea94d469cb40ab8ca70b288248a81db2"
 SRC_URI[libc-0.2.186.sha256sum] = "68ab91017fe16c622486840e4c83c9a37afeff978bd239b5293d61ece587de66"
+SRC_URI[linux-raw-sys-0.4.15.sha256sum] = "d26c52dbd32dccf2d10cac7725f8eae5296885fb5703b261f7d0a0739ec807ab"
 SRC_URI[linux-raw-sys-0.12.1.sha256sum] = "32a66949e030da00e8c7d4434b251670a91556f4144941d37452769c25d58a53"
 SRC_URI[litemap-0.8.1.sha256sum] = "6373607a59f0be73a39b6fe456b8192fcc3585f602af20751600e974dd455e77"
 SRC_URI[lock_api-0.4.14.sha256sum] = "224399e74b87b5f3557511d98dff8b14089b3dadafcab6bb93eab67d3aace965"
@@ -413,7 +416,7 @@ SRC_URI[log-0.4.29.sha256sum] = "5e5032e24019045c762d3c0f28f5b6b8bbf38563a659083
 SRC_URI[lzma-sys-0.1.20.sha256sum] = "5fda04ab3764e6cde78b9974eec4f779acaba7c4e84b36eca3cf77c581b85d27"
 SRC_URI[mailparse-0.16.1.sha256sum] = "60819a97ddcb831a5614eb3b0174f3620e793e97e09195a395bfa948fd68ed2f"
 SRC_URI[matchers-0.2.0.sha256sum] = "d1525a2a28c7f4fa0fc98bb91ae755d1e2d1505079e05539e35bc876b5d65ae9"
-SRC_URI[memchr-2.8.1.sha256sum] = "6b947ae49db0d222b1dbc6b113ce7248a3fc3a6ca21b696717bfc000ba4484d8"
+SRC_URI[memchr-2.8.2.sha256sum] = "88904434abc2901f197fe8cc55f0445e7ded921dba5911dad2e2b39b48e663c4"
 SRC_URI[miniz_oxide-0.8.9.sha256sum] = "1fa76a2c86f704bdb222d66965fb3d63269ce38518b83cb0575fca855ebb6316"
 SRC_URI[mio-1.2.0.sha256sum] = "50b7e5b27aa02a74bac8c3f23f448f8d87ff11f92d3aac1a6ed369ee08cc56c1"
 SRC_URI[munge-0.4.7.sha256sum] = "5e17401f259eba956ca16491461b6e8f72913a0a114e39736ce404410f915a0c"
@@ -451,13 +454,14 @@ SRC_URI[redox_syscall-0.5.15.sha256sum] = "7e8af0dde094006011e6a740d487931943948
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
 SRC_URI[rustc-hash-2.1.2.sha256sum] = "94300abf3f1ae2e2b8ffb7b58043de3d399c73fa6f4b73826402a5c457614dbe"
+SRC_URI[rustix-0.38.44.sha256sum] = "fdb5bc1ae2baa591800df16c9ca78619bf65c0488b41b96ccec5d11220d8c154"
 SRC_URI[rustix-1.1.4.sha256sum] = "b6fe4565b9518b83ef4f91bb47ce29620ca828bd32cb7e408f0062e9930ba190"
 SRC_URI[rustversion-1.0.22.sha256sum] = "b39cdef0fa800fc44525c84ccb54a029961a8215f9619753635a9c0d2538d46d"
 SRC_URI[ryu-1.0.23.sha256sum] = "9774ba4a74de5f7b1c1451ed6cd5285a32eddb5cccb8cc655a4e50009e06477f"
@@ -483,10 +487,11 @@ SRC_URI[simd-adler32-0.3.8.sha256sum] = "e320a6c5ad31d271ad523dcf3ad13e2767ad8b1
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
@@ -527,9 +532,10 @@ SRC_URI[unscanny-0.1.0.sha256sum] = "e9df2af067a7953e9c3831320f35c1cc0600c30d44d
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
diff --git a/meta/recipes-devtools/python/python3-uv-build_0.11.21.bb b/meta/recipes-devtools/python/python3-uv-build_0.11.25.bb
similarity index 92%
rename from meta/recipes-devtools/python/python3-uv-build_0.11.21.bb
rename to meta/recipes-devtools/python/python3-uv-build_0.11.25.bb
index 4ee2fdbaa7..4583c16a69 100644
--- a/meta/recipes-devtools/python/python3-uv-build_0.11.21.bb
+++ b/meta/recipes-devtools/python/python3-uv-build_0.11.25.bb
@@ -11,7 +11,7 @@ LIC_FILES_CHKSUM = "file://LICENSE-APACHE;md5=86d3f3a95c324c9479bd8986968f4327 \
                     file://crates/uv-pep508/License-Apache;md5=e23fadd6ceef8c618fc1c65191d846fa \
                     file://crates/uv-pep508/License-BSD;md5=ef7a6027dc4c2389b9afad7e690274c7"
 
-SRC_URI[sha256sum] = "d512911d357f71dd7c1be43503ee66ebaba9a8d207998bbea77581e95aadabe6"
+SRC_URI[sha256sum] = "8b5ee3b387e04b8353a62fbedbc9e2624035c7717b4589f297a3cdd6d1026297"
 
 require ${BPN}-crates.inc
 
-- 
2.47.1


--===============1039201330454842021==
Content-Type: application/octet-stream
MIME-Version: 1.0
Content-Transfer-Encoding: base64
Content-Disposition: attachment;
 filename="0001-python3-uv-build-upgrade-0.11.21-0.11.25.patch"

RnJvbSBkYTgzZGJlMjE0ZjgwZjM1ODRiNzYxYmZhMDliYTg1YTUxMDFkNjQ2IE1vbiBTZXAgMTcg
MDA6MDA6MDAgMjAwMQpGcm9tOiBVcGdyYWRlIEhlbHBlciA8YXVoQHlvY3RvcHJvamVjdC5vcmc+
CkRhdGU6IFNhdCwgMjcgSnVuIDIwMjYgMDU6NDY6MTkgKzAwMDAKU3ViamVjdDogW1BBVENIXSBw
eXRob24zLXV2LWJ1aWxkOiB1cGdyYWRlIDAuMTEuMjEgLT4gMC4xMS4yNQoKLS0tCiAuLi4vcHl0
aG9uL3B5dGhvbjMtdXYtYnVpbGQtY3JhdGVzLmluYyAgICAgICAgfCA0MiArKysrKysrKysrKy0t
LS0tLS0tCiAuLi4wLjExLjIxLmJiID0+IHB5dGhvbjMtdXYtYnVpbGRfMC4xMS4yNS5iYn0gfCAg
MiArLQogMiBmaWxlcyBjaGFuZ2VkLCAyNSBpbnNlcnRpb25zKCspLCAxOSBkZWxldGlvbnMoLSkK
IHJlbmFtZSBtZXRhL3JlY2lwZXMtZGV2dG9vbHMvcHl0aG9uL3tweXRob24zLXV2LWJ1aWxkXzAu
MTEuMjEuYmIgPT4gcHl0aG9uMy11di1idWlsZF8wLjExLjI1LmJifSAoOTIlKQoKZGlmZiAtLWdp
dCBhL21ldGEvcmVjaXBlcy1kZXZ0b29scy9weXRob24vcHl0aG9uMy11di1idWlsZC1jcmF0ZXMu
aW5jIGIvbWV0YS9yZWNpcGVzLWRldnRvb2xzL3B5dGhvbi9weXRob24zLXV2LWJ1aWxkLWNyYXRl
cy5pbmMKaW5kZXggYmUyMDExNTY2OC4uNGFiMTJhZDhkMyAxMDA2NDQKLS0tIGEvbWV0YS9yZWNp
cGVzLWRldnRvb2xzL3B5dGhvbi9weXRob24zLXV2LWJ1aWxkLWNyYXRlcy5pbmMKKysrIGIvbWV0
YS9yZWNpcGVzLWRldnRvb2xzL3B5dGhvbi9weXRob24zLXV2LWJ1aWxkLWNyYXRlcy5pbmMKQEAg
LTEzLDE0ICsxMywxNCBAQCBTUkNfVVJJICs9ICIgXAogICAgIGNyYXRlOi8vY3JhdGVzLmlvL2Fu
eWhvdy8xLjAuMTAyIFwKICAgICBjcmF0ZTovL2NyYXRlcy5pby9hcmNzdHIvMS4yLjAgXAogICAg
IGNyYXRlOi8vY3JhdGVzLmlvL2FycmF5dmVjLzAuNy42IFwKLSAgICBjcmF0ZTovL2NyYXRlcy5p
by9hc3RyYWwtdG9raW8tdGFyLzAuNi4yIFwKKyAgICBjcmF0ZTovL2NyYXRlcy5pby9hc3RyYWwt
dG9raW8tdGFyLzAuNi4zIFwKICAgICBjcmF0ZTovL2NyYXRlcy5pby9hc3RyYWwtdmVyc2lvbi1y
YW5nZXMvMC4xLjQgXAogICAgIGNyYXRlOi8vY3JhdGVzLmlvL2FzdHJhbF9hc3luY196aXAvMC4w
LjE4IFwKICAgICBjcmF0ZTovL2NyYXRlcy5pby9hc3luYy1jb21wcmVzc2lvbi8wLjQuMTkgXAog
ICAgIGNyYXRlOi8vY3JhdGVzLmlvL2F1dG9jZmcvMS41LjAgXAogICAgIGNyYXRlOi8vY3JhdGVz
LmlvL2JhY2tvbi8xLjYuMCBcCiAgICAgY3JhdGU6Ly9jcmF0ZXMuaW8vYmFzZTY0LzAuMjIuMSBc
Ci0gICAgY3JhdGU6Ly9jcmF0ZXMuaW8vYml0ZmxhZ3MvMi4xMS4xIFwKKyAgICBjcmF0ZTovL2Ny
YXRlcy5pby9iaXRmbGFncy8yLjEzLjAgXAogICAgIGNyYXRlOi8vY3JhdGVzLmlvL2Jsb2NrLWJ1
ZmZlci8wLjEwLjQgXAogICAgIGNyYXRlOi8vY3JhdGVzLmlvL2JveGNhci8wLjIuMTQgXAogICAg
IGNyYXRlOi8vY3JhdGVzLmlvL2JzdHIvMS4xMi4xIFwKQEAgLTU5LDcgKzU5LDYgQEAgU1JDX1VS
SSArPSAiIFwKICAgICBjcmF0ZTovL2NyYXRlcy5pby9lcmFzZWQtc2VyZGUvMC40LjEwIFwKICAg
ICBjcmF0ZTovL2NyYXRlcy5pby9lcnJuby8wLjMuMTQgXAogICAgIGNyYXRlOi8vY3JhdGVzLmlv
L2Zhc3RyYW5kLzIuNC4xIFwKLSAgICBjcmF0ZTovL2NyYXRlcy5pby9maWxldGltZS8wLjIuMjkg
XAogICAgIGNyYXRlOi8vY3JhdGVzLmlvL2ZpbmQtbXN2Yy10b29scy8wLjEuOSBcCiAgICAgY3Jh
dGU6Ly9jcmF0ZXMuaW8vZml4ZWRiaXRzZXQvMC41LjcgXAogICAgIGNyYXRlOi8vY3JhdGVzLmlv
L2ZsYXRlMi8xLjEuOSBcCkBAIC05OCw3ICs5Nyw3IEBAIFNSQ19VUkkgKz0gIiBcCiAgICAgY3Jh
dGU6Ly9jcmF0ZXMuaW8vaWRuYV9hZGFwdGVyLzEuMi4xIFwKICAgICBjcmF0ZTovL2NyYXRlcy5p
by9pbmRleG1hcC8yLjE0LjAgXAogICAgIGNyYXRlOi8vY3JhdGVzLmlvL2luZG9jLzIuMC43IFwK
LSAgICBjcmF0ZTovL2NyYXRlcy5pby9pbnN0YS8xLjQ3LjIgXAorICAgIGNyYXRlOi8vY3JhdGVz
LmlvL2luc3RhLzEuNDguMCBcCiAgICAgY3JhdGU6Ly9jcmF0ZXMuaW8vaXNfdGVybWluYWxfcG9s
eWZpbGwvMS43MC4yIFwKICAgICBjcmF0ZTovL2NyYXRlcy5pby9pdGVydG9vbHMvMC4xNC4wIFwK
ICAgICBjcmF0ZTovL2NyYXRlcy5pby9pdG9hLzEuMC4xNyBcCkBAIC0xMTIsNiArMTExLDcgQEAg
U1JDX1VSSSArPSAiIFwKICAgICBjcmF0ZTovL2NyYXRlcy5pby9sYXp5X3N0YXRpYy8xLjUuMCBc
CiAgICAgY3JhdGU6Ly9jcmF0ZXMuaW8vbGViMTI4Zm10LzAuMS4wIFwKICAgICBjcmF0ZTovL2Ny
YXRlcy5pby9saWJjLzAuMi4xODYgXAorICAgIGNyYXRlOi8vY3JhdGVzLmlvL2xpbnV4LXJhdy1z
eXMvMC40LjE1IFwKICAgICBjcmF0ZTovL2NyYXRlcy5pby9saW51eC1yYXctc3lzLzAuMTIuMSBc
CiAgICAgY3JhdGU6Ly9jcmF0ZXMuaW8vbGl0ZW1hcC8wLjguMSBcCiAgICAgY3JhdGU6Ly9jcmF0
ZXMuaW8vbG9ja19hcGkvMC40LjE0IFwKQEAgLTExOSw3ICsxMTksNyBAQCBTUkNfVVJJICs9ICIg
XAogICAgIGNyYXRlOi8vY3JhdGVzLmlvL2x6bWEtc3lzLzAuMS4yMCBcCiAgICAgY3JhdGU6Ly9j
cmF0ZXMuaW8vbWFpbHBhcnNlLzAuMTYuMSBcCiAgICAgY3JhdGU6Ly9jcmF0ZXMuaW8vbWF0Y2hl
cnMvMC4yLjAgXAotICAgIGNyYXRlOi8vY3JhdGVzLmlvL21lbWNoci8yLjguMSBcCisgICAgY3Jh
dGU6Ly9jcmF0ZXMuaW8vbWVtY2hyLzIuOC4yIFwKICAgICBjcmF0ZTovL2NyYXRlcy5pby9taW5p
el9veGlkZS8wLjguOSBcCiAgICAgY3JhdGU6Ly9jcmF0ZXMuaW8vbWlvLzEuMi4wIFwKICAgICBj
cmF0ZTovL2NyYXRlcy5pby9tdW5nZS8wLjQuNyBcCkBAIC0xNTcsMTMgKzE1NywxNCBAQCBTUkNf
VVJJICs9ICIgXAogICAgIGNyYXRlOi8vY3JhdGVzLmlvL3JlZi1jYXN0LzEuMC4yNSBcCiAgICAg
Y3JhdGU6Ly9jcmF0ZXMuaW8vcmVmLWNhc3QtaW1wbC8xLjAuMjUgXAogICAgIGNyYXRlOi8vY3Jh
dGVzLmlvL3JlZmxpbmstY29weS8wLjEuMjkgXAotICAgIGNyYXRlOi8vY3JhdGVzLmlvL3JlZ2V4
LzEuMTIuMyBcCisgICAgY3JhdGU6Ly9jcmF0ZXMuaW8vcmVnZXgvMS4xMi40IFwKICAgICBjcmF0
ZTovL2NyYXRlcy5pby9yZWdleC1hdXRvbWF0YS8wLjQuMTQgXAotICAgIGNyYXRlOi8vY3JhdGVz
LmlvL3JlZ2V4LXN5bnRheC8wLjguMTAgXAorICAgIGNyYXRlOi8vY3JhdGVzLmlvL3JlZ2V4LXN5
bnRheC8wLjguMTEgXAogICAgIGNyYXRlOi8vY3JhdGVzLmlvL3JlbmQvMC41LjMgXAogICAgIGNy
YXRlOi8vY3JhdGVzLmlvL3JreXYvMC44LjE2IFwKICAgICBjcmF0ZTovL2NyYXRlcy5pby9ya3l2
X2Rlcml2ZS8wLjguMTYgXAogICAgIGNyYXRlOi8vY3JhdGVzLmlvL3J1c3RjLWhhc2gvMi4xLjIg
XAorICAgIGNyYXRlOi8vY3JhdGVzLmlvL3J1c3RpeC8wLjM4LjQ0IFwKICAgICBjcmF0ZTovL2Ny
YXRlcy5pby9ydXN0aXgvMS4xLjQgXAogICAgIGNyYXRlOi8vY3JhdGVzLmlvL3J1c3R2ZXJzaW9u
LzEuMC4yMiBcCiAgICAgY3JhdGU6Ly9jcmF0ZXMuaW8vcnl1LzEuMC4yMyBcCkBAIC0xODksMTAg
KzE5MCwxMSBAQCBTUkNfVVJJICs9ICIgXAogICAgIGNyYXRlOi8vY3JhdGVzLmlvL3NpbWR1dGY4
LzAuMS41IFwKICAgICBjcmF0ZTovL2NyYXRlcy5pby9zaW1pbGFyLzIuNy4wIFwKICAgICBjcmF0
ZTovL2NyYXRlcy5pby9zbGFiLzAuNC4xMiBcCi0gICAgY3JhdGU6Ly9jcmF0ZXMuaW8vc21hbGx2
ZWMvMS4xNS4xIFwKKyAgICBjcmF0ZTovL2NyYXRlcy5pby9zbWFsbHZlYy8xLjE1LjIgXAogICAg
IGNyYXRlOi8vY3JhdGVzLmlvL3NtYXdrLzAuMy4yIFwKICAgICBjcmF0ZTovL2NyYXRlcy5pby9z
cGR4LzAuMTMuNCBcCiAgICAgY3JhdGU6Ly9jcmF0ZXMuaW8vc3RhYmxlX2RlcmVmX3RyYWl0LzEu
Mi4xIFwKKyAgICBjcmF0ZTovL2NyYXRlcy5pby9zdHJpcC1hbnNpLWVzY2FwZXMvMC4yLjEgXAog
ICAgIGNyYXRlOi8vY3JhdGVzLmlvL3N0cnNpbS8wLjExLjEgXAogICAgIGNyYXRlOi8vY3JhdGVz
LmlvL3N5bi8yLjAuMTE3IFwKICAgICBjcmF0ZTovL2NyYXRlcy5pby9zeW5zdHJ1Y3R1cmUvMC4x
My4yIFwKQEAgLTIzMyw5ICsyMzUsMTAgQEAgU1JDX1VSSSArPSAiIFwKICAgICBjcmF0ZTovL2Ny
YXRlcy5pby91cmwvMi41LjggXAogICAgIGNyYXRlOi8vY3JhdGVzLmlvL3V0ZjhfaXRlci8xLjAu
NCBcCiAgICAgY3JhdGU6Ly9jcmF0ZXMuaW8vdXRmOHBhcnNlLzAuMi4yIFwKLSAgICBjcmF0ZTov
L2NyYXRlcy5pby91dWlkLzEuMjMuMiBcCisgICAgY3JhdGU6Ly9jcmF0ZXMuaW8vdXVpZC8xLjIz
LjMgXAogICAgIGNyYXRlOi8vY3JhdGVzLmlvL3ZhbHVhYmxlLzAuMS4xIFwKICAgICBjcmF0ZTov
L2NyYXRlcy5pby92ZXJzaW9uX2NoZWNrLzAuOS41IFwKKyAgICBjcmF0ZTovL2NyYXRlcy5pby92
dGUvMC4xNC4xIFwKICAgICBjcmF0ZTovL2NyYXRlcy5pby93YWxrZGlyLzIuNS4wIFwKICAgICBj
cmF0ZTovL2NyYXRlcy5pby93YXNpLzAuMTEuMSt3YXNpLXNuYXBzaG90LXByZXZpZXcxIFwKICAg
ICBjcmF0ZTovL2NyYXRlcy5pby93YXNpLzAuMTQuNyt3YXNpLTAuMi40IFwKQEAgLTMwNywxNCAr
MzEwLDE0IEBAIFNSQ19VUklbYW5zdHlsZS13aW5jb24tMy4wLjExLnNoYTI1NnN1bV0gPSAiMjkx
ZTZhMjUwZmY4NmNkNGE4MjAxMTJmYjg4OTg4MDhhMzY2CiBTUkNfVVJJW2FueWhvdy0xLjAuMTAy
LnNoYTI1NnN1bV0gPSAiN2YyMDJkZjg2NDg0Yzg2OGRiYWQ3ZWFhNTU3ZWY3ODVkNWM2NjI5NWU0
MWI0NjBlZjkyMmVjYTA3MjNiODQyYyIKIFNSQ19VUklbYXJjc3RyLTEuMi4wLnNoYTI1NnN1bV0g
PSAiMDM5MThjM2RiZDc3MDFhODVjNmI5ODg3NzMyZTI5MjExNzVmMjZjMzUwYjQ1NjM4NDFkMDk1
OGMyMWQ1N2U2ZCIKIFNSQ19VUklbYXJyYXl2ZWMtMC43LjYuc2hhMjU2c3VtXSA9ICI3YzAyZDEy
M2RmMDE3ZWZjZGZiZDczOWVmODE3MzViMzZjNWJhODNlYzNjNTljODBhOWQ3ZWNjNzE4ZjkyZTUw
IgotU1JDX1VSSVthc3RyYWwtdG9raW8tdGFyLTAuNi4yLnNoYTI1NnN1bV0gPSAiY2I1MGE3YWFl
ODRhMDNiZjU1YjA2NzgzMmJjMzc2ZjQ5NjFiNzkwYzk3ZTY0ZDNlYWNlZTk3ZDM4OWI5MDI3NyIK
K1NSQ19VUklbYXN0cmFsLXRva2lvLXRhci0wLjYuMy5zaGEyNTZzdW1dID0gIjA4NjQ4ZmVmMzUz
YWIzOWE5ZDI2ZjkwOWFkNTNmYzRmMDcxYmU0YzkxODUzYjc4NTIzZjVjYzNkOWU1ZWJmZmQiCiBT
UkNfVVJJW2FzdHJhbC12ZXJzaW9uLXJhbmdlcy0wLjEuNC5zaGEyNTZzdW1dID0gIjMxOTc5YmMz
MDU2MTAyNDZkNzhhYzAxZDYzNDY3YTEyZDg0NTRjNmUzYjhiMjJiNTgxMWQzNDNhMTE5OGRmYmIi
CiBTUkNfVVJJW2FzdHJhbF9hc3luY196aXAtMC4wLjE4LnNoYTI1NnN1bV0gPSAiYzE1ZmM1YjU5
MWYxOWRmYmJiY2U3MzY2MTU5MDhkNzRmMWQ5MjUyYmIzNGIyMzE4NzNjYjk5NWYyYTk5N2ZmYiIK
IFNSQ19VUklbYXN5bmMtY29tcHJlc3Npb24tMC40LjE5LnNoYTI1NnN1bV0gPSAiMDY1NzVlNmE5
NjczNTgwZjUyNjYxYzkyMTA3YmFhYmZmYmY0MWUyMTQxMzczNDQxY2JjZGM0N2NiNzMzMDAzYyIK
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
MTJmYTdlZmUzOWJmMzRkZGIwNmQxMDJjZjBlMmNhYiIKQEAgLTM1Myw3ICszNTYsNiBAQCBTUkNf
VVJJW2VxdWl2YWxlbnQtMS4wLjIuc2hhMjU2c3VtXSA9ICI4NzdhNGFjZTg3MTNiMGJjZjJhNGU3
ZWVjODI1MjljMDI5ZjFkMDYxOQogU1JDX1VSSVtlcmFzZWQtc2VyZGUtMC40LjEwLnNoYTI1NnN1
bV0gPSAiZDJhZGQ4YTA3ZGQ2YThkOTNmZjYyNzAyOWM1MWRlMTQ1ZTEyNjg2ZmJjMzZlY2IyOThh
YzIyZTc0Y2YwMmRlYyIKIFNSQ19VUklbZXJybm8tMC4zLjE0LnNoYTI1NnN1bV0gPSAiMzljYWI3
MTYxN2FlMGQ2M2Y1MWEzNmQ2OWY4NjYzOTE3MzViNTE2OTFkYmRhNjNjZjZmOTZkMDQyYjYzZWZl
YiIKIFNSQ19VUklbZmFzdHJhbmQtMi40LjEuc2hhMjU2c3VtXSA9ICI5ZjFmMjI3NDUyYTM5MDgw
NGNkYjYzN2I3NGE4Njk5MGYyYTdkN2JhNGI3ZDU2OTNhYWM5YjRkZDZkZWZkOGQ2IgotU1JDX1VS
SVtmaWxldGltZS0wLjIuMjkuc2hhMjU2c3VtXSA9ICI1YzI4N2EzM2M3ZjBhNjIwYzM4ZTY0MWU3
ZjYwODI3NzEzOTg3YjNjMGYyNmU4ZGRjOTQ2MmNjNjljZjc1NzU5IgogU1JDX1VSSVtmaW5kLW1z
dmMtdG9vbHMtMC4xLjkuc2hhMjU2c3VtXSA9ICI1YmFlYmMwNzc0MTUxZjkwNWExYTJjYzQxOTg5
MzAwYjFlNmZiYjI5YWZmMGNlZmZhMTA2NGZkZDMwODhkNTgyIgogU1JDX1VSSVtmaXhlZGJpdHNl
dC0wLjUuNy5zaGEyNTZzdW1dID0gIjFkNjc0ZTgxMzkxZDFlMWFiNjgxYTI4ZDk5ZGYwNzkyN2M2
ZDRhYTViMDI3ZDdkYTE2YmEzMmQxZDIxZWNkOTkiCiBTUkNfVVJJW2ZsYXRlMi0xLjEuOS5zaGEy
NTZzdW1dID0gIjg0M2ZiYTI3NDZlNDQ4YjM3ZTI2YTgxOTU3OTk1NzQxNWM4Y2VmMzM5YmYwODU2
NGZlOGI3ZGRiZDk1OTU3M2MiCkBAIC0zOTIsNyArMzk0LDcgQEAgU1JDX1VSSVtpZG5hLTEuMS4w
LnNoYTI1NnN1bV0gPSAiM2IwODc1ZjIzY2FhMDM4OTg5OTRmNmRkYzUwMTg4NmE0NWM3ZDNkNjJk
MDRkMmQKIFNSQ19VUklbaWRuYV9hZGFwdGVyLTEuMi4xLnNoYTI1NnN1bV0gPSAiM2FjYWU5NjA5
NTQwYWEzMThkMWJjNTg4NDU1MjI1ZmIyMDg1YjllZDBjNGY2YmQwZDlkNWJjZDg2ZjFhMDM0NCIK
IFNSQ19VUklbaW5kZXhtYXAtMi4xNC4wLnNoYTI1NnN1bV0gPSAiZDQ2NmU5NDU0ZjA4ZTRhOTEx
ZTE0ODA2YzI0ZTE2ZmJhMWI0YzEyMWQxZWE0NzQzOTZmMzk2MDY5Y2Y5NDlkOSIKIFNSQ19VUklb
aW5kb2MtMi4wLjcuc2hhMjU2c3VtXSA9ICI3OWNmNWM5M2Y5MzIyOGNmOGVmYjNiYTM2MjUzNWZi
MTExOTlhYzU0OGEwOWNlMTE3YzliMWFkYzMwMzBkNzA2IgotU1JDX1VSSVtpbnN0YS0xLjQ3LjIu
c2hhMjU2c3VtXSA9ICI3YjRhNjI0OGViOTNhNDQwMWVkMmYzN2RmZThlYTU5MmQzY2YwNWI3Y2Y0
ZjhlZmE4NjdiNjg5NWFmN2UwOTRlIgorU1JDX1VSSVtpbnN0YS0xLjQ4LjAuc2hhMjU2c3VtXSA9
ICI4NmYwZjhmZWU4YzkyNjQxNWM1OGQ2YWU0M2EwODUyM2EyNmZhY2NiMjMyM2Y1ZTZiNjQ0ZmU3
ZGQ0ZWY2YjgyIgogU1JDX1VSSVtpc190ZXJtaW5hbF9wb2x5ZmlsbC0xLjcwLjIuc2hhMjU2c3Vt
XSA9ICJhNmNiMTM4YmI3OWExNDZjMWJkNDYwMDA1NjIzZTE0MmVmMDE4MWUzZDAyMTljYjQ5M2Uw
MmY3ZDA4YTM1Njk1IgogU1JDX1VSSVtpdGVydG9vbHMtMC4xNC4wLnNoYTI1NnN1bV0gPSAiMmIx
OTJjNzgyMDM3ZmFkZDljZmE3NTU0ODMxMDQ4OGFhYmRiZjNkMmRhNzM4ODViMzFiZDBhYmQwMzM1
MTI4NSIKIFNSQ19VUklbaXRvYS0xLjAuMTcuc2hhMjU2c3VtXSA9ICI5MmVjYzY2MTgxODFkZWYw
NDU3MzkyY2NkMGVlNTExOThlMDY1ZTAxNmQxZDUyN2E3YWMxYjZkYzdjMWYwOWQyIgpAQCAtNDA2
LDYgKzQwOCw3IEBAIFNSQ19VUklbanVuY3Rpb24tMi4wLjAuc2hhMjU2c3VtXSA9ICIxNjBmMmVh
ZGUwOTdmMzAyNjNiNTQ4YWFlNWRlYjEyYWQzNDljOTA5YmFhCiBTUkNfVVJJW2xhenlfc3RhdGlj
LTEuNS4wLnNoYTI1NnN1bV0gPSAiYmJkMmJjYjRjOTYzZjJkZGFlMDZhMmVmYzdlOWYzNTkxMzEy
NDczYzUwYzY2ODVlMWYyOTgwNjgzMTZlNjZmZSIKIFNSQ19VUklbbGViMTI4Zm10LTAuMS4wLnNo
YTI1NnN1bV0gPSAiMDllZGQ5ZThiNTRlNDllNTg3ZTRmNjI5NWE3ZDI5YzNlYTk0ZDQ2OWNiNDBh
YjhjYTcwYjI4ODI0OGE4MWRiMiIKIFNSQ19VUklbbGliYy0wLjIuMTg2LnNoYTI1NnN1bV0gPSAi
NjhhYjkxMDE3ZmUxNmM2MjI0ODY4NDBlNGM4M2M5YTM3YWZlZmY5NzhiZDIzOWI1MjkzZDYxZWNl
NTg3ZGU2NiIKK1NSQ19VUklbbGludXgtcmF3LXN5cy0wLjQuMTUuc2hhMjU2c3VtXSA9ICJkMjZj
NTJkYmQzMmRjY2YyZDEwY2FjNzcyNWY4ZWFlNTI5Njg4NWZiNTcwM2IyNjFmN2QwYTA3MzllYzgw
N2FiIgogU1JDX1VSSVtsaW51eC1yYXctc3lzLTAuMTIuMS5zaGEyNTZzdW1dID0gIjMyYTY2OTQ5
ZTAzMGRhMDBlOGM3ZDQ0MzRiMjUxNjcwYTkxNTU2ZjQxNDQ5NDFkMzc0NTI3NjljMjVkNThhNTMi
CiBTUkNfVVJJW2xpdGVtYXAtMC44LjEuc2hhMjU2c3VtXSA9ICI2MzczNjA3YTU5ZjBiZTczYTM5
YjZmZTQ1NmI4MTkyZmNjMzU4NWY2MDJhZjIwNzUxNjAwZTk3NGRkNDU1ZTc3IgogU1JDX1VSSVts
b2NrX2FwaS0wLjQuMTQuc2hhMjU2c3VtXSA9ICIyMjQzOTllNzRiODdiNWYzNTU3NTExZDk4ZGZm
OGIxNDA4OWIzZGFkYWZjYWI2YmI5M2VhYjY3ZDNhYWNlOTY1IgpAQCAtNDEzLDcgKzQxNiw3IEBA
IFNSQ19VUklbbG9nLTAuNC4yOS5zaGEyNTZzdW1dID0gIjVlNTAzMmUyNDAxOTA0NWM3NjJkM2Mw
ZjI4ZjViNmI4YmJmMzg1NjNhNjU5MDgzCiBTUkNfVVJJW2x6bWEtc3lzLTAuMS4yMC5zaGEyNTZz
dW1dID0gIjVmZGEwNGFiMzc2NGU2Y2RlNzhiOTk3NGVlYzRmNzc5YWNhYmE3YzRlODRiMzZlY2Ez
Y2Y3N2M1ODFiODVkMjciCiBTUkNfVVJJW21haWxwYXJzZS0wLjE2LjEuc2hhMjU2c3VtXSA9ICI2
MDgxOWE5N2RkY2I4MzFhNTYxNGViM2IwMTc0ZjM2MjBlNzkzZTk3ZTA5MTk1YTM5NWJmYTk0OGZk
NjhlZDJmIgogU1JDX1VSSVttYXRjaGVycy0wLjIuMC5zaGEyNTZzdW1dID0gImQxNTI1YTJhMjhj
N2Y0ZmEwZmM5OGJiOTFhZTc1NWQxZTJkMTUwNTA3OWUwNTUzOWUzNWJjODc2YjVkNjVhZTkiCi1T
UkNfVVJJW21lbWNoci0yLjguMS5zaGEyNTZzdW1dID0gIjZiOTQ3YWU0OWRiMGQyMjJiMWRiYzZi
MTEzY2U3MjQ4YTNmYzNhNmNhMjFiNjk2NzE3YmZjMDAwYmE0NDg0ZDgiCitTUkNfVVJJW21lbWNo
ci0yLjguMi5zaGEyNTZzdW1dID0gIjg4OTA0NDM0YWJjMjkwMWYxOTdmZThjYzU1ZjA0NDVlN2Rl
ZDkyMWRiYTU5MTFkYWQyZTJiMzliNDhlNjYzYzQiCiBTUkNfVVJJW21pbml6X294aWRlLTAuOC45
LnNoYTI1NnN1bV0gPSAiMWZhNzZhMmM4NmY3MDRiZGIyMjJkNjY5NjVmYjNkNjMyNjljZTM4NTE4
YjgzY2IwNTc1ZmNhODU1ZWJiNjMxNiIKIFNSQ19VUklbbWlvLTEuMi4wLnNoYTI1NnN1bV0gPSAi
NTBiN2U1YjI3YWEwMmE3NGJhYzhjM2YyM2Y0NDhmOGQ4N2ZmMTFmOTJkM2FhYzFhNmVkMzY5ZWUw
OGNjNTZjMSIKIFNSQ19VUklbbXVuZ2UtMC40Ljcuc2hhMjU2c3VtXSA9ICI1ZTE3NDAxZjI1OWVi
YTk1NmNhMTY0OTE0NjFiNmU4ZjcyOTEzYTBhMTE0ZTM5NzM2Y2U0MDQ0MTBmOTE1YTBjIgpAQCAt
NDUxLDEzICs0NTQsMTQgQEAgU1JDX1VSSVtyZWRveF9zeXNjYWxsLTAuNS4xNS5zaGEyNTZzdW1d
ID0gIjdlOGFmMGRkZTA5NDAwNjAxMWU2YTc0MGQ0ODc5MzE5NDM5NDgKIFNSQ19VUklbcmVmLWNh
c3QtMS4wLjI1LnNoYTI1NnN1bV0gPSAiZjM1NDMwMGFlNjZmNzZmMWM4NWM1Zjg0NjkzZjBjZTgx
ZDc0N2UyYzNmMjFhNDVmZWY0OTZkODljOTYwYmY3ZCIKIFNSQ19VUklbcmVmLWNhc3QtaW1wbC0x
LjAuMjUuc2hhMjU2c3VtXSA9ICJiNzE4NjAwNmRjYjIxOTIwOTkwMDkzZjMwZTNkZWE2M2I3ZDZl
OTc3YmYxMjU2YmUyMGMzNTYzYTVkYjA3MGRhIgogU1JDX1VSSVtyZWZsaW5rLWNvcHktMC4xLjI5
LnNoYTI1NnN1bV0gPSAiMTMzNjIyMzNiMTQ3ZTU3Njc0YzM3YjgwMmQyMTZiN2M1ZTNkY2NjYmVk
ODk2N2M4NGYwZDhkMjIzODY4YWUyNyIKLVNSQ19VUklbcmVnZXgtMS4xMi4zLnNoYTI1NnN1bV0g
PSAiZTEwNzU0YTE0YjkxMzdkZDdiMWUzZTViMDQ5M2NjOTE3MWZkZDEwNWUwYWI0NzdmNTFiNzJl
N2YzYWMwZTI3NiIKK1NSQ19VUklbcmVnZXgtMS4xMi40LnNoYTI1NnN1bV0gPSAiZjEyOTJiNzc1
OWFlMWNiOWVjMTk1NDUyZDEzOTBhMDc0ZjBjZDg1NDFhYjdhNWE4YzMxY2Q2ZGI0NWQ0YTZiYSIK
IFNSQ19VUklbcmVnZXgtYXV0b21hdGEtMC40LjE0LnNoYTI1NnN1bV0gPSAiNmUxZGQ0MTIyZmMx
NTk1ZTgxNjI2MTg5NDU0NzY4OTJlZWZjYTdiODhjNTI4MjBlNzRhZjYyNjIyMTNjYWU4ZiIKLVNS
Q19VUklbcmVnZXgtc3ludGF4LTAuOC4xMC5zaGEyNTZzdW1dID0gImRjODk3ZGQ4ZDllOGJkMWVk
OGNkYWQ4MmI1OTY2YzNlMGVjYWUwOWZiMTkwN2Q1OGVmYWEwMTM1NDMxODVkMGEiCitTUkNfVVJJ
W3JlZ2V4LXN5bnRheC0wLjguMTEuc2hhMjU2c3VtXSA9ICJkNmY2ZmY5YTM3ODQ4NWIyOThhNTI4
NjY1NmRhNjY1YmE3NDQxM2QzNmRiMDk3OTYzMzI3NWQyZTcwODE0NWQ0IgogU1JDX1VSSVtyZW5k
LTAuNS4zLnNoYTI1NnN1bV0gPSAiY2FkYWRlZjMxN2MyZjIwNzU1YTY0ZDdmZGM0OGY5ZTcxNzhl
ZTZiMGUxZjdmY2UzM2ZhNjBmMWQ2OGEyNzZlNiIKIFNSQ19VUklbcmt5di0wLjguMTYuc2hhMjU2
c3VtXSA9ICI3MzM4OWUwYzk5ZTY2NGY5MTkyNzVhYjViNWIwNDcxMzkxZmU5YThkZTYxZTFkZmY5
YjFlYWY1NmE5MGYxNmUzIgogU1JDX1VSSVtya3l2X2Rlcml2ZS0wLjguMTYuc2hhMjU2c3VtXSA9
ICI1ZDJlZDBiNTQxMjUzMTVmYjM2YmQwMjFlODJkMzE0ZDFjMTI2NTQ4Zjg3MTYzNGI0ODNmNDZi
MzFkMTNjYWM2IgogU1JDX1VSSVtydXN0Yy1oYXNoLTIuMS4yLnNoYTI1NnN1bV0gPSAiOTQzMDBh
YmYzZjFhZTJlMmI4ZmZiN2I1ODA0M2RlM2QzOTljNzNmYTZmNGI3MzgyNjQwMmE1YzQ1NzYxNGRi
ZSIKK1NSQ19VUklbcnVzdGl4LTAuMzguNDQuc2hhMjU2c3VtXSA9ICJmZGI1YmMxYWUyYmFhNTkx
ODAwZGYxNmM5Y2E3ODYxOWJmNjVjMDQ4OGI0MWI5NmNjZWM1ZDExMjIwZDhjMTU0IgogU1JDX1VS
SVtydXN0aXgtMS4xLjQuc2hhMjU2c3VtXSA9ICJiNmZlNDU2NWI5NTE4YjgzZWY0ZjkxYmI0N2Nl
Mjk2MjBjYTgyOGJkMzJjYjdlNDA4ZjAwNjJlOTkzMGJhMTkwIgogU1JDX1VSSVtydXN0dmVyc2lv
bi0xLjAuMjIuc2hhMjU2c3VtXSA9ICJiMzljZGVmMGZhODAwZmM0NDUyNWM4NGNjYjU0YTAyOTk2
MWE4MjE1Zjk2MTk3NTM2MzVhOWMwZDI1MzhkNDZkIgogU1JDX1VSSVtyeXUtMS4wLjIzLnNoYTI1
NnN1bV0gPSAiOTc3NGJhNGE3NGRlNWY3YjFjMTQ1MWVkNmNkNTI4NWEzMmVkZGI1Y2NjYjhjYzY1
NWE0ZTUwMDA5ZTA2NDc3ZiIKQEAgLTQ4MywxMCArNDg3LDExIEBAIFNSQ19VUklbc2ltZC1hZGxl
cjMyLTAuMy44LnNoYTI1NnN1bV0gPSAiZTMyMGE2YzVhZDMxZDI3MWFkNTIzZGNmM2FkMTNlMjc2
N2FkOGIxCiBTUkNfVVJJW3NpbWR1dGY4LTAuMS41LnNoYTI1NnN1bV0gPSAiZTNhOWZlMzRlM2U3
YTUwMzE2MDYwMzUxZjM3MTg3YTNmNTQ2YmNlOTU0OTYxNTY3NTRiNjAxYTVmYTcxYjc2ZSIKIFNS
Q19VUklbc2ltaWxhci0yLjcuMC5zaGEyNTZzdW1dID0gImJiYmI1ZDk2NTkxNDE2NDZhZTY0N2I0
MmZlMDk0ZGFmNmM2MTkyZDE2MjA4NzBiNDQ5ZDk1NTdmNzQ4YjJkYWEiCiBTUkNfVVJJW3NsYWIt
MC40LjEyLnNoYTI1NnN1bV0gPSAiMGM3OTBkZTIzMTI0ZjlhYjQ0NTQ0ZDdhYzA1ZDYwNDQwYWRj
NTg2NDc5Y2U1MDFjMWQ2ZDdkYTNjZDhjOWNmNSIKLVNSQ19VUklbc21hbGx2ZWMtMS4xNS4xLnNo
YTI1NnN1bV0gPSAiNjdiMWI3YTNiNWZlNGYxMzc2ODg3MTg0MDQ1ZmNmNDVjNjllOTJhZjczNGI3
YWFkZGMwNWZiNzc3YjZmYmQwMyIKK1NSQ19VUklbc21hbGx2ZWMtMS4xNS4yLnNoYTI1NnN1bV0g
PSAiOGVkNmE2M2YwMmM4NTM5YzkxYTg2ODVhODZmNDA5OTY2MWJhM2RhMDE3OTMyZjZlYmJlYTZk
ZTNmMGZhN2M5MCIKIFNSQ19VUklbc21hd2stMC4zLjIuc2hhMjU2c3VtXSA9ICJiN2MzODhjMWI1
ZTkzNzU2ZDBjNzQwOTY1YzQxZTg4MjJmODY2NjIxZDQxYWNiZGY2MzM2YTZhMTY4Zjg4NDBjIgog
U1JDX1VSSVtzcGR4LTAuMTMuNC5zaGEyNTZzdW1dID0gImE4ZGE1OTNlMzBiZWI3OTBmYzk0MjQ1
MDJlYjg5ODMyMGI0NGU1ZWIzMDM2N2RiZGExYzFlZGRlOGUyZjMyZDciCiBTUkNfVVJJW3N0YWJs
ZV9kZXJlZl90cmFpdC0xLjIuMS5zaGEyNTZzdW1dID0gIjZjZTJiZThkYzI1NDU1ZTFmOTFkZjcx
YmZhMTJhZDM3ZDdhZjEwOTJhZTczNmYzYTZjZDBlMzdiYzc4MTA1OTYiCitTUkNfVVJJW3N0cmlw
LWFuc2ktZXNjYXBlcy0wLjIuMS5zaGEyNTZzdW1dID0gIjJhOGY4MDM4ZTdlNzk2OWFiYjNmMWI3
YzJhODExMjI1ZTkyOTZkYTIwODUzOWUwZjc5YzUyNTFkNmNhYzAwMjUiCiBTUkNfVVJJW3N0cnNp
bS0wLjExLjEuc2hhMjU2c3VtXSA9ICI3ZGE4YjU3MzY4NDVkOWYyZmNiODM3ZWE1ZDllMjYyODU2
NGIzYjA0M2E3MDk0OGEzZjBiNzc4ODM4YzVmYjRmIgogU1JDX1VSSVtzeW4tMi4wLjExNy5zaGEy
NTZzdW1dID0gImU2NjViODgwM2U3YjFkMmE3MjdmNDAyMzQ1NmJiYmJlNzRkYTY3MDk5YzU4NTI1
OGFmMGFkOWM1MDEzYjliOTkiCiBTUkNfVVJJW3N5bnN0cnVjdHVyZS0wLjEzLjIuc2hhMjU2c3Vt
XSA9ICI3MjhhNzBmM2RiYWY1YmFiN2YwYzRiMWFjOGQ3YWU1ZWE2MGE0YjU1NDljOGE1OTE0MzYx
Yzk5MTQ3YTcwOWQyIgpAQCAtNTI3LDkgKzUzMiwxMCBAQCBTUkNfVVJJW3Vuc2Nhbm55LTAuMS4w
LnNoYTI1NnN1bV0gPSAiZTlkZjJhZjA2N2E3OTUzZTljMzgzMTMyMGYzNWMxY2MwNjAwYzMwZDQ0
ZAogU1JDX1VSSVt1cmwtMi41Ljguc2hhMjU2c3VtXSA9ICJmZjY3YThhNDM5NzM3M2MzZWY2NjA4
MTJhY2FiMzI2ODIyMjAzNTAxMGFiODY4MGVjNDIxNWYzOGJhM2QwZWVkIgogU1JDX1VSSVt1dGY4
X2l0ZXItMS4wLjQuc2hhMjU2c3VtXSA9ICJiNmMxNDA2MjBlN2ZmYmIyMmMyZGVlNTljYWZlNjA4
NGE1OWI1ZmZjMjdhODg1OWE1ZjBkNDk0YjVkNTJiNmJlIgogU1JDX1VSSVt1dGY4cGFyc2UtMC4y
LjIuc2hhMjU2c3VtXSA9ICIwNmFiZGUzNjExNjU3YWRmNjZkMzgzZjAwYjA5M2Q3ZmFlY2M3ZmE1
NzA3MWNjZTI1Nzg2NjBjOWYxMDEwODIxIgotU1JDX1VSSVt1dWlkLTEuMjMuMi5zaGEyNTZzdW1d
ID0gImQyNThiODNjZWVjMjEwMzQ3MjdlY2VlOGMzODJjZmE2YzNlMTMzNjk5YjA3NDJjNjQ1NzE4
MTRmYjQyMGM5ZjciCitTUkNfVVJJW3V1aWQtMS4yMy4zLnNoYTI1NnN1bV0gPSAiMTQ0ZDZiMTIz
Y2VmODBiMzAxYjhmNzJhOWUyY2E0MzcwZGRlYzIxOTUwZDBhMTAzZGQyMmM0MzcwMDZkMmRiNyIK
IFNSQ19VUklbdmFsdWFibGUtMC4xLjEuc2hhMjU2c3VtXSA9ICJiYTczZWE5Y2YxNmEyNWRmMGM4
Y2FhMTZjNTFhY2I5MzdkNTcxMmE4NDI5ZGI3OGEzZWUyOWQ1ZGNhY2QzYTY1IgogU1JDX1VSSVt2
ZXJzaW9uX2NoZWNrLTAuOS41LnNoYTI1NnN1bV0gPSAiMGI5MjhmMzNkOTc1ZmM2YWQ5Zjg2Yzhm
MjgzODUzYWQyNmJkZDViMTBiN2YxNTQyYWEyZmExNWUyMjg5MTA1YSIKK1NSQ19VUklbdnRlLTAu
MTQuMS5zaGEyNTZzdW1dID0gIjIzMWZkY2Q3ZWYzMDM3ZTgzMzBkOGUxN2U2MTAxMWEyYzI0NDEy
NmFjYzBhOTgyZjQwNDBhYzNmOWYwYmMwNzciCiBTUkNfVVJJW3dhbGtkaXItMi41LjAuc2hhMjU2
c3VtXSA9ICIyOTc5MDk0NjQwNGY5MWQ5YzVkMDZmOTg3NGVmZGRlYTFkYzA2YzVlZmU5NDU0MWE3
ZDY4NjMxMDhlM2E1ZTRiIgogU1JDX1VSSVt3YXNpLTAuMTEuMSt3YXNpLXNuYXBzaG90LXByZXZp
ZXcxLnNoYTI1NnN1bV0gPSAiY2NmM2VjNjUxYTg0N2ViMDFkZTczY2NhZDE1ZWI3ZDk5ZjgwNDg1
ZGUwNDNlZmIyZjM3MGNkNjU0ZjRlYTQ0YiIKIFNSQ19VUklbd2FzaS0wLjE0Ljcrd2FzaS0wLjIu
NC5zaGEyNTZzdW1dID0gIjg4MzQ3OGRlMjAzNjdlMjI0YzAwOTBhZjljZjVmOWZhODViZWQ2M2E5
NWMxYWJmM2FmYzVjMDgzZWJjMDZlOGMiCmRpZmYgLS1naXQgYS9tZXRhL3JlY2lwZXMtZGV2dG9v
bHMvcHl0aG9uL3B5dGhvbjMtdXYtYnVpbGRfMC4xMS4yMS5iYiBiL21ldGEvcmVjaXBlcy1kZXZ0
b29scy9weXRob24vcHl0aG9uMy11di1idWlsZF8wLjExLjI1LmJiCnNpbWlsYXJpdHkgaW5kZXgg
OTIlCnJlbmFtZSBmcm9tIG1ldGEvcmVjaXBlcy1kZXZ0b29scy9weXRob24vcHl0aG9uMy11di1i
dWlsZF8wLjExLjIxLmJiCnJlbmFtZSB0byBtZXRhL3JlY2lwZXMtZGV2dG9vbHMvcHl0aG9uL3B5
dGhvbjMtdXYtYnVpbGRfMC4xMS4yNS5iYgppbmRleCA0ZWUyZmRiYWE3Li40NTgzYzE2YTY5IDEw
MDY0NAotLS0gYS9tZXRhL3JlY2lwZXMtZGV2dG9vbHMvcHl0aG9uL3B5dGhvbjMtdXYtYnVpbGRf
MC4xMS4yMS5iYgorKysgYi9tZXRhL3JlY2lwZXMtZGV2dG9vbHMvcHl0aG9uL3B5dGhvbjMtdXYt
YnVpbGRfMC4xMS4yNS5iYgpAQCAtMTEsNyArMTEsNyBAQCBMSUNfRklMRVNfQ0hLU1VNID0gImZp
bGU6Ly9MSUNFTlNFLUFQQUNIRTttZDU9ODZkM2YzYTk1YzMyNGM5NDc5YmQ4OTg2OTY4ZjQzMjcg
XAogICAgICAgICAgICAgICAgICAgICBmaWxlOi8vY3JhdGVzL3V2LXBlcDUwOC9MaWNlbnNlLUFw
YWNoZTttZDU9ZTIzZmFkZDZjZWVmOGM2MThmYzFjNjUxOTFkODQ2ZmEgXAogICAgICAgICAgICAg
ICAgICAgICBmaWxlOi8vY3JhdGVzL3V2LXBlcDUwOC9MaWNlbnNlLUJTRDttZDU9ZWY3YTYwMjdk
YzRjMjM4OWI5YWZhZDdlNjkwMjc0YzciCiAKLVNSQ19VUklbc2hhMjU2c3VtXSA9ICJkNTEyOTEx
ZDM1N2Y3MWRkN2MxYmU0MzUwM2VlNjZlYmFiYTlhOGQyMDc5OThiYmVhNzc1ODFlOTVhYWRhYmU2
IgorU1JDX1VSSVtzaGEyNTZzdW1dID0gIjhiNWVlM2IzODdlMDRiODM1M2E2MmZiZWRiYzllMjYy
NDAzNWM3NzE3YjQ1ODlmMjk3YTNjZGQ2ZDEwMjYyOTciCiAKIHJlcXVpcmUgJHtCUE59LWNyYXRl
cy5pbmMKIAotLSAKMi40Ny4xCgo=

--===============1039201330454842021==
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
 2.6 crate://crates.io/windows_x86_64_gnullvm/0.52.6 crate://crates.io/windows_x86_64_msvc/0.52.6 crate://crates.io/winnow/1.0.3 crate://crates.io/wit-bindgen/0.51.0 crate://crates.io/wit-bindgen-core/0.51.0 crate://crates.io/wit-bindgen-rust/0.51.0 crate://crates.io/wit-bindgen-rust-macro/0.51.0 crate://crates.io/wit-component/0.244.0 crate://crates.io/wit-parser/0.244.0 crate://crates.io/writeable/0.6.2 crate://crates.io/xattr/1.6.1 crate://crates.io/xz2/0.1.7 crate://crates.io/yoke/0.8.1 crate://crates.io/yoke-derive/0.8.1 crate://crates.io/zerofrom/0.1.6 crate://crates.io/zerofrom-derive/0.1.6 crate://crates.io/zerotrie/0.2.3 crate://crates.io/zerovec/0.11.5 crate://crates.io/zerovec-derive/0.11.2 crate://crates.io/zlib-rs/0.6.3 crate://crates.io/zmij/1.0.21 crate://crates.io/zstd/0.13.3 crate://crates.io/zstd-safe/7.2.4 crate://crates.io/zstd-sys/2.0.16+zstd.1.5.7" to "https://files.pythonhosted.org/packages/source/u/uv_build/uv_build-0.11.25.tar.gz;downloadfilename=uv_build-0.1
 1.25.tar.gz crate://crates.io/adler2/2.0.1 crate://crates.io/aho-corasick/1.1.4 crate://crates.io/allocator-api2/0.2.21 crate://crates.io/anstream/1.0.0 crate://crates.io/anstyle/1.0.14 crate://crates.io/anstyle-parse/1.0.0 crate://crates.io/anstyle-query/1.1.5 crate://crates.io/anstyle-wincon/3.0.11 crate://crates.io/anyhow/1.0.102 crate://crates.io/arcstr/1.2.0 crate://crates.io/arrayvec/0.7.6 crate://crates.io/astral-tokio-tar/0.6.3 crate://crates.io/astral-version-ranges/0.1.4 crate://crates.io/astral_async_zip/0.0.18 crate://crates.io/async-compression/0.4.19 crate://crates.io/autocfg/1.5.0 crate://crates.io/backon/1.6.0 crate://crates.io/base64/0.22.1 crate://crates.io/bitflags/2.13.0 crate://crates.io/block-buffer/0.10.4 crate://crates.io/boxcar/0.2.14 crate://crates.io/bstr/1.12.1 crate://crates.io/bumpalo/3.20.2 crate://crates.io/bytecheck/0.8.2 crate://crates.io/bytecheck_derive/0.8.2 crate://crates.io/bytes/1.11.1 crate://crates.io/bzip2/0.5.2 crate://crates.io/bzip2-sys/
 0.1.13+1.0.8 crate://crates.io/cc/1.2.57 crate://crates.io/cfg-if/1.0.4 crate://crates.io/charset/0.1.5 crate://crates.io/clap/4.6.1 crate://crates.io/clap_builder/4.6.0 crate://crates.io/clap_derive/4.6.1 crate://crates.io/clap_lex/1.1.0 crate://crates.io/colorchoice/1.0.5 crate://crates.io/console/0.16.3 crate://crates.io/cpufeatures/0.2.17 crate://crates.io/crc32fast/1.5.0 crate://crates.io/crypto-common/0.1.7 crate://crates.io/csv/1.4.0 crate://crates.io/csv-core/0.1.13 crate://crates.io/data-encoding/2.11.0 crate://crates.io/digest/0.10.7 crate://crates.io/displaydoc/0.2.5 crate://crates.io/dunce/1.0.5 crate://crates.io/dyn-clone/1.0.20 crate://crates.io/either/1.16.0 crate://crates.io/encode_unicode/1.0.0 crate://crates.io/encoding_rs/0.8.35 crate://crates.io/encoding_rs_io/0.1.7 crate://crates.io/enumflags2/0.7.12 crate://crates.io/enumflags2_derive/0.7.12 crate://crates.io/equivalent/1.0.2 crate://crates.io/erased-serde/0.4.10 crate://crates.io/errno/0.3.14 crate://crates.io
 /fastrand/2.4.1 crate://crates.io/find-msvc-tools/0.1.9 crate://crates.io/fixedbitset/0.5.7 crate://crates.io/flate2/1.1.9 crate://crates.io/foldhash/0.1.5 crate://crates.io/foldhash/0.2.0 crate://crates.io/form_urlencoded/1.2.2 crate://crates.io/fs-err/3.3.0 crate://crates.io/futures/0.3.32 crate://crates.io/futures-channel/0.3.32 crate://crates.io/futures-core/0.3.32 crate://crates.io/futures-executor/0.3.32 crate://crates.io/futures-io/0.3.32 crate://crates.io/futures-lite/2.6.1 crate://crates.io/futures-macro/0.3.32 crate://crates.io/futures-sink/0.3.32 crate://crates.io/futures-task/0.3.32 crate://crates.io/futures-util/0.3.32 crate://crates.io/generic-array/0.14.7 crate://crates.io/getrandom/0.3.3 crate://crates.io/getrandom/0.4.1 crate://crates.io/globset/0.4.18 crate://crates.io/gloo-timers/0.3.0 crate://crates.io/hashbrown/0.15.5 crate://crates.io/hashbrown/0.17.1 crate://crates.io/heck/0.5.0 crate://crates.io/hex/0.4.3 crate://crates.io/icu_collections/2.1.1 crate://crates
 .io/icu_locale_core/2.1.1 crate://crates.io/icu_normalizer/2.1.1 crate://crates.io/icu_normalizer_data/2.1.1 crate://crates.io/icu_properties/2.1.2 crate://crates.io/icu_properties_data/2.1.2 crate://crates.io/icu_provider/2.1.1 crate://crates.io/id-arena/2.3.0 crate://crates.io/idna/1.1.0 crate://crates.io/idna_adapter/1.2.1 crate://crates.io/indexmap/2.14.0 crate://crates.io/indoc/2.0.7 crate://crates.io/insta/1.48.0 crate://crates.io/is_terminal_polyfill/1.70.2 crate://crates.io/itertools/0.14.0 crate://crates.io/itoa/1.0.17 crate://crates.io/jiff/0.2.28 crate://crates.io/jiff-static/0.2.28 crate://crates.io/jiff-tzdb/0.1.6 crate://crates.io/jiff-tzdb-platform/0.1.3 crate://crates.io/jobserver/0.1.34 crate://crates.io/js-sys/0.3.91 crate://crates.io/junction/2.0.0 crate://crates.io/lazy_static/1.5.0 crate://crates.io/leb128fmt/0.1.0 crate://crates.io/libc/0.2.186 crate://crates.io/linux-raw-sys/0.4.15 crate://crates.io/linux-raw-sys/0.12.1 crate://crates.io/litemap/0.8.1 crate://
 crates.io/lock_api/0.4.14 crate://crates.io/log/0.4.29 crate://crates.io/lzma-sys/0.1.20 crate://crates.io/mailparse/0.16.1 crate://crates.io/matchers/0.2.0 crate://crates.io/memchr/2.8.2 crate://crates.io/miniz_oxide/0.8.9 crate://crates.io/mio/1.2.0 crate://crates.io/munge/0.4.7 crate://crates.io/munge_macro/0.4.7 crate://crates.io/nu-ansi-term/0.50.3 crate://crates.io/once_cell/1.21.4 crate://crates.io/once_cell_polyfill/1.70.2 crate://crates.io/owo-colors/4.3.0 crate://crates.io/parking/2.2.1 crate://crates.io/parking_lot/0.12.5 crate://crates.io/parking_lot_core/0.9.12 crate://crates.io/path-slash/0.2.1 crate://crates.io/percent-encoding/2.3.2 crate://crates.io/pest/2.8.6 crate://crates.io/pest_derive/2.8.6 crate://crates.io/pest_generator/2.8.6 crate://crates.io/pest_meta/2.8.6 crate://crates.io/petgraph/0.8.3 crate://crates.io/pin-project/1.1.11 crate://crates.io/pin-project-internal/1.1.11 crate://crates.io/pin-project-lite/0.2.17 crate://crates.io/pkg-config/0.3.32 crate://
 crates.io/portable-atomic/1.13.1 crate://crates.io/portable-atomic-util/0.2.6 crate://crates.io/potential_utf/0.1.4 crate://crates.io/prettyplease/0.2.37 crate://crates.io/proc-macro2/1.0.106 crate://crates.io/ptr_meta/0.3.1 crate://crates.io/ptr_meta_derive/0.3.1 crate://crates.io/quote/1.0.45 crate://crates.io/quoted_printable/0.5.1 crate://crates.io/r-efi/5.3.0 crate://crates.io/rancor/0.1.1 crate://crates.io/redox_syscall/0.5.15 crate://crates.io/ref-cast/1.0.25 crate://crates.io/ref-cast-impl/1.0.25 crate://crates.io/reflink-copy/0.1.29 crate://crates.io/regex/1.12.4 crate://crates.io/regex-automata/0.4.14 crate://crates.io/regex-syntax/0.8.11 crate://crates.io/rend/0.5.3 crate://crates.io/rkyv/0.8.16 crate://crates.io/rkyv_derive/0.8.16 crate://crates.io/rustc-hash/2.1.2 crate://crates.io/rustix/0.38.44 crate://crates.io/rustix/1.1.4 crate://crates.io/rustversion/1.0.22 crate://crates.io/ryu/1.0.23 crate://crates.io/same-file/1.0.6 crate://crates.io/schemars/1.2.1 crate://crat
 es.io/schemars_derive/1.2.1 crate://crates.io/scopeguard/1.2.0 crate://crates.io/seahash/4.1.0 crate://crates.io/self-replace/1.5.0 crate://crates.io/semver/1.0.27 crate://crates.io/serde/1.0.228 crate://crates.io/serde-untagged/0.1.9 crate://crates.io/serde_core/1.0.228 crate://crates.io/serde_derive/1.0.228 crate://crates.io/serde_derive_internals/0.29.1 crate://crates.io/serde_json/1.0.150 crate://crates.io/serde_spanned/1.1.1 crate://crates.io/sha2/0.10.9 crate://crates.io/sharded-slab/0.1.7 crate://crates.io/shlex/1.3.0 crate://crates.io/signal-hook-registry/1.4.8 crate://crates.io/simd-adler32/0.3.8 crate://crates.io/simdutf8/0.1.5 crate://crates.io/similar/2.7.0 crate://crates.io/slab/0.4.12 crate://crates.io/smallvec/1.15.2 crate://crates.io/smawk/0.3.2 crate://crates.io/spdx/0.13.4 crate://crates.io/stable_deref_trait/1.2.1 crate://crates.io/strip-ansi-escapes/0.2.1 crate://crates.io/strsim/0.11.1 crate://crates.io/syn/2.0.117 crate://crates.io/synstructure/0.13.2 crate://c
 rates.io/temp-env/0.3.6 crate://crates.io/tempfile/3.27.0 crate://crates.io/terminal_size/0.4.4 crate://crates.io/textwrap/0.16.2 crate://crates.io/thiserror/2.0.18 crate://crates.io/thiserror-impl/2.0.18 crate://crates.io/thread_local/1.1.9 crate://crates.io/tinystr/0.8.2 crate://crates.io/tinyvec/1.11.0 crate://crates.io/tinyvec_macros/0.1.1 crate://crates.io/tokio/1.52.3 crate://crates.io/tokio-macros/2.7.0 crate://crates.io/tokio-stream/0.1.18 crate://crates.io/tokio-util/0.7.18 crate://crates.io/toml/1.1.2+spec-1.1.0 crate://crates.io/toml_datetime/1.1.1+spec-1.1.0 crate://crates.io/toml_edit/0.25.12+spec-1.1.0 crate://crates.io/toml_parser/1.1.2+spec-1.1.0 crate://crates.io/toml_writer/1.1.1+spec-1.1.0 crate://crates.io/tracing/0.1.44 crate://crates.io/tracing-attributes/0.1.31 crate://crates.io/tracing-core/0.1.36 crate://crates.io/tracing-log/0.2.0 crate://crates.io/tracing-subscriber/0.3.23 crate://crates.io/tracing-test/0.2.6 crate://crates.io/tracing-test-macro/0.2.6 crat
 e://crates.io/typeid/1.0.3 crate://crates.io/typenum/1.19.0 crate://crates.io/ucd-trie/0.1.7 crate://crates.io/unicode-ident/1.0.24 crate://crates.io/unicode-linebreak/0.1.5 crate://crates.io/unicode-width/0.2.2 crate://crates.io/unicode-xid/0.2.6 crate://crates.io/unscanny/0.1.0 crate://crates.io/url/2.5.8 crate://crates.io/utf8_iter/1.0.4 crate://crates.io/utf8parse/0.2.2 crate://crates.io/uuid/1.23.3 crate://crates.io/valuable/0.1.1 crate://crates.io/version_check/0.9.5 crate://crates.io/vte/0.14.1 crate://crates.io/walkdir/2.5.0 crate://crates.io/wasi/0.11.1+wasi-snapshot-preview1 crate://crates.io/wasi/0.14.7+wasi-0.2.4 crate://crates.io/wasip2/1.0.2+wasi-0.2.9 crate://crates.io/wasip3/0.4.0+wasi-0.3.0-rc-2026-01-06 crate://crates.io/wasm-bindgen/0.2.114 crate://crates.io/wasm-bindgen-macro/0.2.114 crate://crates.io/wasm-bindgen-macro-support/0.2.114 crate://crates.io/wasm-bindgen-shared/0.2.114 crate://crates.io/wasm-encoder/0.244.0 crate://crates.io/wasm-metadata/0.244.0 crat
 e://crates.io/wasmparser/0.244.0 crate://crates.io/winapi-util/0.1.11 crate://crates.io/windows/0.61.3 crate://crates.io/windows-collections/0.2.0 crate://crates.io/windows-core/0.61.2 crate://crates.io/windows-future/0.2.1 crate://crates.io/windows-implement/0.60.2 crate://crates.io/windows-interface/0.59.3 crate://crates.io/windows-link/0.1.3 crate://crates.io/windows-link/0.2.1 crate://crates.io/windows-numerics/0.2.0 crate://crates.io/windows-result/0.3.4 crate://crates.io/windows-strings/0.4.2 crate://crates.io/windows-sys/0.52.0 crate://crates.io/windows-sys/0.61.2 crate://crates.io/windows-targets/0.52.6 crate://crates.io/windows-threading/0.1.0 crate://crates.io/windows_aarch64_gnullvm/0.52.6 crate://crates.io/windows_aarch64_msvc/0.52.6 crate://crates.io/windows_i686_gnu/0.52.6 crate://crates.io/windows_i686_gnullvm/0.52.6 crate://crates.io/windows_i686_msvc/0.52.6 crate://crates.io/windows_x86_64_gnu/0.52.6 crate://crates.io/windows_x86_64_gnullvm/0.52.6 crate://crates.io/
 windows_x86_64_msvc/0.52.6 crate://crates.io/winnow/1.0.3 crate://crates.io/wit-bindgen/0.51.0 crate://crates.io/wit-bindgen-core/0.51.0 crate://crates.io/wit-bindgen-rust/0.51.0 crate://crates.io/wit-bindgen-rust-macro/0.51.0 crate://crates.io/wit-component/0.244.0 crate://crates.io/wit-parser/0.244.0 crate://crates.io/writeable/0.6.2 crate://crates.io/xattr/1.6.1 crate://crates.io/xz2/0.1.7 crate://crates.io/yoke/0.8.1 crate://crates.io/yoke-derive/0.8.1 crate://crates.io/zerofrom/0.1.6 crate://crates.io/zerofrom-derive/0.1.6 crate://crates.io/zerotrie/0.2.3 crate://crates.io/zerovec/0.11.5 crate://crates.io/zerovec-derive/0.11.2 crate://crates.io/zlib-rs/0.6.3 crate://crates.io/zmij/1.0.21 crate://crates.io/zstd/0.13.3 crate://crates.io/zstd-safe/7.2.4 crate://crates.io/zstd-sys/2.0.16+zstd.1.5.7"
packages/x86-64-v3-poky-linux/python3-uv-build: PKGV changed from 0.11.21 [default] to 0.11.25 [default]
packages/x86-64-v3-poky-linux/python3-uv-build: PV changed from "0.11.21" to "0.11.25"
packages/x86-64-v3-poky-linux/python3-uv-build/python3-uv-build-dbg: PKGV changed from 0.11.21 [default] to 0.11.25 [default]
packages/x86-64-v3-poky-linux/python3-uv-build/python3-uv-build-dbg: PV changed from "0.11.21" to "0.11.25"
packages/x86-64-v3-poky-linux/python3-uv-build/python3-uv-build-dev: PKGV changed from 0.11.21 [default] to 0.11.25 [default]
packages/x86-64-v3-poky-linux/python3-uv-build/python3-uv-build-dev: PV changed from "0.11.21" to "0.11.25"
packages/x86-64-v3-poky-linux/python3-uv-build/python3-uv-build-doc: PKGV changed from 0.11.21 [default] to 0.11.25 [default]
packages/x86-64-v3-poky-linux/python3-uv-build/python3-uv-build-doc: PV changed from "0.11.21" to "0.11.25"
packages/x86-64-v3-poky-linux/python3-uv-build/python3-uv-build-locale: PKGV changed from 0.11.21 [default] to 0.11.25 [default]
packages/x86-64-v3-poky-linux/python3-uv-build/python3-uv-build-locale: PV changed from "0.11.21" to "0.11.25"
packages/x86-64-v3-poky-linux/python3-uv-build/python3-uv-build-src: PKGV changed from 0.11.21 [default] to 0.11.25 [default]
packages/x86-64-v3-poky-linux/python3-uv-build/python3-uv-build-src: PV changed from "0.11.21" to "0.11.25"
packages/x86-64-v3-poky-linux/python3-uv-build/python3-uv-build-staticdev: PKGV changed from 0.11.21 [default] to 0.11.25 [default]
packages/x86-64-v3-poky-linux/python3-uv-build/python3-uv-build-staticdev: PV changed from "0.11.21" to "0.11.25"
packages/x86-64-v3-poky-linux/python3-uv-build/python3-uv-build: FILELIST: directory renamed /usr/lib/python3.14/site-packages/uv_build-0.11.21.dist-info -> /usr/lib/python3.14/site-packages/uv_build-0.11.25.dist-info, directory renamed /usr/lib/python3.14/site-packages/uv_build-0.11.21.dist-info/licenses -> /usr/lib/python3.14/site-packages/uv_build-0.11.25.dist-info/licenses
packages/x86-64-v3-poky-linux/python3-uv-build/python3-uv-build: PKGV changed from 0.11.21 [default] to 0.11.25 [default]
packages/x86-64-v3-poky-linux/python3-uv-build/python3-uv-build: PV changed from "0.11.21" to "0.11.25"
packages/x86-64-v3-poky-linux/python3-uv-build/python3-uv-build: PKGSIZE changed from 5340466 to 5344562 (+0%)
Changes to packages/x86-64-v3-poky-linux/python3-uv-build (sysroot):
  /usr/lib/python3.14/site-packages/uv_build-0.11.21.dist-info moved to /usr/lib/python3.14/site-packages/uv_build-0.11.25.dist-info

--===============1039201330454842021==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: attachment; filename="buildhistory-diff.txt"

packages/x86-64-v3-poky-linux/python3-uv-build/python3-uv-build: FILELIST: directory renamed /usr/lib/python3.14/site-packages/uv_build-0.11.21.dist-info/licenses -> /usr/lib/python3.14/site-packages/uv_build-0.11.25.dist-info/licenses, directory renamed /usr/lib/python3.14/site-packages/uv_build-0.11.21.dist-info -> /usr/lib/python3.14/site-packages/uv_build-0.11.25.dist-info
Changes to packages/x86-64-v3-poky-linux/python3-uv-build (sysroot):
  /usr/lib/python3.14/site-packages/uv_build-0.11.21.dist-info moved to /usr/lib/python3.14/site-packages/uv_build-0.11.25.dist-info

--===============1039201330454842021==--

