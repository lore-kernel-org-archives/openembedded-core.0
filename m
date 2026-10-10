Return-Path: <auh@yoctoproject.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 59082CA9EBE
	for <webhook@archiver.kernel.org>; Sat, 10 Oct 2026 05:37:59 +0000 (UTC)
Received: from a27-192.smtp-out.us-west-2.amazonses.com (a27-192.smtp-out.us-west-2.amazonses.com [54.240.27.192])
 by mx.groups.io with SMTP id smtpd.msgproc02-g2.4314.1791610677272870834
 for <openembedded-core@lists.openembedded.org>;
 Fri, 09 Oct 2026 22:37:57 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@yoctoproject.org header.s=lvjh2tk576v2ro5mi6k4dt3mc6wpqbky header.b=ZFlpdtO9;
 dkim=pass header.i=@amazonses.com header.s=hsbnp7p3ensaochzwyq5wwmceodymuwv header.b=ox1uG/Ap;
 spf=pass (domain: us-west-2.amazonses.com, ip: 54.240.27.192, mailfrom: 010101a124516402-709a243d-88ec-4482-8b16-3c758114d939-000000@us-west-2.amazonses.com)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/simple;
	s=lvjh2tk576v2ro5mi6k4dt3mc6wpqbky; d=yoctoproject.org;
	t=1791610676;
	h=Content-Type:MIME-Version:From:To:Cc:Subject:Message-Id:Date;
	bh=uS4v9ouu4PheUFDO4WWjKI6i/y/GvUOWOj77gipoPGc=;
	b=ZFlpdtO9pqoRyi0Gp4fKHZBMmthfpYrs9mXy9NI6YY4/yvKZ4rq2b4McU2pX2r12
	S/jJUa5eLHKrXBxiIgVnqSVyvCWD2ur/+RjkkKTALosNEb4MmSkKGQfO8lcwGyJ7bK4
	kv2W7V+9MjNS1/6MuWG26q8P4PsWKdPtNgyfc09c=
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/simple;
	s=hsbnp7p3ensaochzwyq5wwmceodymuwv; d=amazonses.com; t=1791610676;
	h=Content-Type:MIME-Version:From:To:Cc:Subject:Message-Id:Date:Feedback-ID;
	bh=uS4v9ouu4PheUFDO4WWjKI6i/y/GvUOWOj77gipoPGc=;
	b=ox1uG/ApvWwFuMP0G3cBXHrChxMFo4Eig0vT1T0hJOQo/1zxbwe/s7m/MbjWbV18
	aLAmCM/Uksz2qWT7i4TQRDa0Px52V3oFMRZYYcOraWsOZJrGFFbnTV3TskJvvRWS12l
	fOLC8Zikvr7DuO+aMWz1Drn30fJVmJQwwv0toAZw=
Content-Type: multipart/mixed; boundary="===============4844468677958449083=="
MIME-Version: 1.0
From: auh@yoctoproject.org
To: Trevor Gamblin <tgamblin@baylibre.com>
Cc: openembedded-core@lists.openembedded.org
Subject: [AUH] python3-uv-build: upgrading to 0.13.0 SUCCEEDED
Message-ID: <010101a124516402-709a243d-88ec-4482-8b16-3c758114d939-000000@us-west-2.amazonses.com>
Date: Sat, 10 Oct 2026 05:37:56 +0000
Feedback-ID: ::1.us-west-2.9np3MYPs3fEaOBysGKSlUD4KtcmPijcmS9Az2Hwf7iQ=:AmazonSES
X-SES-Outgoing: 2026.10.10-54.240.27.192
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Sat, 10 Oct 2026 05:37:59 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/247493

--===============4844468677958449083==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit

Hello,

this email is a notification from the Auto Upgrade Helper
that the automatic attempt to upgrade the recipe(s) *python3-uv-build* to *0.13.0* has Succeeded.

Next steps:
    - apply the patch: git am 0001-python3-uv-build-upgrade-0.12.21-0.13.0.patch
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
From d6e13edc3d4a9dbb5b5835c87b50b65629b2bdca Mon Sep 17 00:00:00 2001
From: Upgrade Helper <auh@yoctoproject.org>
Date: Sat, 10 Oct 2026 05:19:10 +0000
Subject: [PATCH] python3-uv-build: upgrade 0.12.21 -> 0.13.0

---
 .../python/python3-uv-build-crates.inc        | 36 +++++++------------
 ..._0.12.21.bb => python3-uv-build_0.13.0.bb} |  2 +-
 2 files changed, 13 insertions(+), 25 deletions(-)
 rename meta/recipes-devtools/python/{python3-uv-build_0.12.21.bb => python3-uv-build_0.13.0.bb} (92%)

diff --git a/meta/recipes-devtools/python/python3-uv-build-crates.inc b/meta/recipes-devtools/python/python3-uv-build-crates.inc
index a21746312e..40087d0541 100644
--- a/meta/recipes-devtools/python/python3-uv-build-crates.inc
+++ b/meta/recipes-devtools/python/python3-uv-build-crates.inc
@@ -16,8 +16,8 @@ SRC_URI += " \
     crate://crates.io/arrayvec/0.7.8 \
     crate://crates.io/astral-tokio-tar/0.7.0 \
     crate://crates.io/astral-version-ranges/0.2.2 \
-    crate://crates.io/astral_async_zip/0.0.20 \
-    crate://crates.io/async-compression/0.4.19 \
+    crate://crates.io/astral_async_zip/0.0.21 \
+    crate://crates.io/async-compression/0.4.45 \
     crate://crates.io/autocfg/1.5.0 \
     crate://crates.io/backon/1.6.0 \
     crate://crates.io/base64/0.22.1 \
@@ -33,7 +33,6 @@ SRC_URI += " \
     crate://crates.io/bytes/1.12.1 \
     crate://crates.io/cap-primitives/4.0.3 \
     crate://crates.io/cap-std/4.0.3 \
-    crate://crates.io/cc/1.2.57 \
     crate://crates.io/cfg-if/1.0.4 \
     crate://crates.io/charset/0.1.5 \
     crate://crates.io/clap/4.6.6 \
@@ -41,6 +40,8 @@ SRC_URI += " \
     crate://crates.io/clap_derive/4.6.4 \
     crate://crates.io/clap_lex/1.1.0 \
     crate://crates.io/colorchoice/1.0.5 \
+    crate://crates.io/compression-codecs/0.4.45 \
+    crate://crates.io/compression-core/0.4.33 \
     crate://crates.io/console/0.16.4 \
     crate://crates.io/cpufeatures/0.2.17 \
     crate://crates.io/cpufeatures/0.3.0 \
@@ -68,7 +69,6 @@ SRC_URI += " \
     crate://crates.io/erased-serde/0.4.10 \
     crate://crates.io/errno/0.3.14 \
     crate://crates.io/fastrand/2.5.0 \
-    crate://crates.io/find-msvc-tools/0.1.9 \
     crate://crates.io/fixedbitset/0.5.7 \
     crate://crates.io/flate2/1.1.10 \
     crate://crates.io/foldhash/0.1.5 \
@@ -118,7 +118,6 @@ SRC_URI += " \
     crate://crates.io/jiff-static/0.2.35 \
     crate://crates.io/jiff-tzdb/0.1.8 \
     crate://crates.io/jiff-tzdb-platform/0.1.3 \
-    crate://crates.io/jobserver/0.1.35 \
     crate://crates.io/js-sys/0.3.91 \
     crate://crates.io/junction/2.0.0 \
     crate://crates.io/lazy_static/1.5.0 \
@@ -152,7 +151,6 @@ SRC_URI += " \
     crate://crates.io/pin-project/1.1.11 \
     crate://crates.io/pin-project-internal/1.1.11 \
     crate://crates.io/pin-project-lite/0.2.17 \
-    crate://crates.io/pkg-config/0.3.32 \
     crate://crates.io/portable-atomic/1.13.1 \
     crate://crates.io/portable-atomic-util/0.2.6 \
     crate://crates.io/potential_utf/0.1.4 \
@@ -196,13 +194,12 @@ SRC_URI += " \
     crate://crates.io/sha2/0.10.9 \
     crate://crates.io/sha2/0.11.0 \
     crate://crates.io/sharded-slab/0.1.7 \
-    crate://crates.io/shlex/1.3.0 \
     crate://crates.io/signal-hook-registry/1.4.8 \
     crate://crates.io/simd-adler32/0.3.8 \
     crate://crates.io/simdutf8/0.1.5 \
     crate://crates.io/similar/2.7.0 \
     crate://crates.io/slab/0.4.12 \
-    crate://crates.io/smallvec/1.15.2 \
+    crate://crates.io/smallvec/1.16.0 \
     crate://crates.io/smawk/0.3.2 \
     crate://crates.io/socket2/0.6.3 \
     crate://crates.io/spdx/0.13.5 \
@@ -210,7 +207,7 @@ SRC_URI += " \
     crate://crates.io/strip-ansi-escapes/0.2.1 \
     crate://crates.io/strsim/0.11.1 \
     crate://crates.io/syn/2.0.118 \
-    crate://crates.io/syn/3.0.4 \
+    crate://crates.io/syn/3.0.5 \
     crate://crates.io/synstructure/0.13.2 \
     crate://crates.io/tar-codec/0.0.14 \
     crate://crates.io/tar-framing/0.0.14 \
@@ -306,9 +303,6 @@ SRC_URI += " \
     crate://crates.io/zerovec-derive/0.11.2 \
     crate://crates.io/zlib-rs/0.6.3 \
     crate://crates.io/zmij/1.0.21 \
-    crate://crates.io/zstd/0.13.3 \
-    crate://crates.io/zstd-safe/7.2.4 \
-    crate://crates.io/zstd-sys/2.0.16+zstd.1.5.7 \
 "
 
 SRC_URI[adler2-2.0.1.sha256sum] = "320119579fcad9c21884f5c4861d16174d0e06250625266f50fe6898340abefa"
@@ -325,8 +319,8 @@ SRC_URI[arcstr-1.2.0.sha256sum] = "03918c3dbd7701a85c6b9887732e2921175f26c350b45
 SRC_URI[arrayvec-0.7.8.sha256sum] = "d3fb67a6e08acf24fdeccbac2cb6ac4305825bd1f117462e0e6f2f193345ad56"
 SRC_URI[astral-tokio-tar-0.7.0.sha256sum] = "6f2e989b33246fe9240d39accf4dd9a01e0b6c1f3ce9dd095e0a47fa02505523"
 SRC_URI[astral-version-ranges-0.2.2.sha256sum] = "81129e143a7bcea263d5a2c50b8be47ac58365dde618bc1ac50f69f497c9cb63"
-SRC_URI[astral_async_zip-0.0.20.sha256sum] = "bd939d79959c3f49a648a1d7857d63cc62548725a6b060b8dbf0ea5c92470b63"
-SRC_URI[async-compression-0.4.19.sha256sum] = "06575e6a9673580f52661c92107baabffbf41e2141373441cbcdc47cb733003c"
+SRC_URI[astral_async_zip-0.0.21.sha256sum] = "13f4a9bc6289d907c8e883d25026a54751d686da9926af271d0fc4cbe58a7f4d"
+SRC_URI[async-compression-0.4.45.sha256sum] = "24a8ec73eb862508b7041723c89386365894b4e7d9f6998bf1b8529e5b0ee254"
 SRC_URI[autocfg-1.5.0.sha256sum] = "c08606f8c3cbf4ce6ec8e28fb0014a2c086708fe954eaa885384a6165172e7e8"
 SRC_URI[backon-1.6.0.sha256sum] = "cffb0e931875b666fc4fcb20fee52e9bbd1ef836fd9e9e04ec21555f9f85f7ef"
 SRC_URI[base64-0.22.1.sha256sum] = "72b3254f16251a8381aa12e40e3c4d2f0199f8c6508fbecb9d91f575e0fbb8c6"
@@ -342,7 +336,6 @@ SRC_URI[bytecheck_derive-0.8.3.sha256sum] = "46d07918caa9eeaaf06b7873925c53a61da
 SRC_URI[bytes-1.12.1.sha256sum] = "fc652a48c352aef3ea3aed32080501cf3ef6ed5da78602a020c991775b0aff04"
 SRC_URI[cap-primitives-4.0.3.sha256sum] = "8b5f74729fd2f44701d1a8eb47e906cdb3ccd9ec0f02baad85a744b791940b18"
 SRC_URI[cap-std-4.0.3.sha256sum] = "c1ec78e242cfa2cfe276807ac2ecc00315a6c97786977414bcd1c3963b6c91b8"
-SRC_URI[cc-1.2.57.sha256sum] = "7a0dd1ca384932ff3641c8718a02769f1698e7563dc6974ffd03346116310423"
 SRC_URI[cfg-if-1.0.4.sha256sum] = "9330f8b2ff13f34540b44e946ef35111825727b38d33286ef986142615121801"
 SRC_URI[charset-0.1.5.sha256sum] = "f1f927b07c74ba84c7e5fe4db2baeb3e996ab2688992e39ac68ce3220a677c7e"
 SRC_URI[clap-4.6.6.sha256sum] = "473c7e07f409a8d772161724aa8db6a765a2532a70f9667eeb7b49d3d02fbdca"
@@ -350,6 +343,8 @@ SRC_URI[clap_builder-4.6.6.sha256sum] = "7b48fea5a88e9ae728a2dcbedbfc0e730f7d60d
 SRC_URI[clap_derive-4.6.4.sha256sum] = "d012d2b9d65aca7f18f4d9878a045bc17899bba951561ba5ec3c2ba1eed9a061"
 SRC_URI[clap_lex-1.1.0.sha256sum] = "c8d4a3bb8b1e0c1050499d1815f5ab16d04f0959b233085fb31653fbfc9d98f9"
 SRC_URI[colorchoice-1.0.5.sha256sum] = "1d07550c9036bf2ae0c684c4297d503f838287c83c53686d05370d0e139ae570"
+SRC_URI[compression-codecs-0.4.45.sha256sum] = "98fc98460ba0ad5317075d3632b8dfc45d0be8c4a49347c2a38272019717614a"
+SRC_URI[compression-core-0.4.33.sha256sum] = "6e8ccc4ea9f6acc32d102c0f6d471d11d913ad15f20c04de743374861fa1d414"
 SRC_URI[console-0.16.4.sha256sum] = "4fe5f465a4f6fee88fad41b85d990f84c835335e85b5d9e6e63e0d06d28cba7c"
 SRC_URI[cpufeatures-0.2.17.sha256sum] = "59ed5838eebb26a2bb2e58f6d5b5316989ae9d08bab10e0e6d103e656d1b0280"
 SRC_URI[cpufeatures-0.3.0.sha256sum] = "8b2a41393f66f16b0823bb79094d54ac5fbd34ab292ddafb9a0456ac9f87d201"
@@ -377,7 +372,6 @@ SRC_URI[equivalent-1.0.2.sha256sum] = "877a4ace8713b0bcf2a4e7eec82529c029f1d0619
 SRC_URI[erased-serde-0.4.10.sha256sum] = "d2add8a07dd6a8d93ff627029c51de145e12686fbc36ecb298ac22e74cf02dec"
 SRC_URI[errno-0.3.14.sha256sum] = "39cab71617ae0d63f51a36d69f866391735b51691dbda63cf6f96d042b63efeb"
 SRC_URI[fastrand-2.5.0.sha256sum] = "da7c62ceae207dd37ea5b845da6a0696c799f85e97da1ab5b7910be3c1c80223"
-SRC_URI[find-msvc-tools-0.1.9.sha256sum] = "5baebc0774151f905a1a2cc41989300b1e6fbb29aff0ceffa1064fdd3088d582"
 SRC_URI[fixedbitset-0.5.7.sha256sum] = "1d674e81391d1e1ab681a28d99df07927c6d4aa5b027d7da16ba32d1d21ecd99"
 SRC_URI[flate2-1.1.10.sha256sum] = "6e634e2e0ebac1ee034020da1ca582e17ffe4e0f5e985823721e168928136dcb"
 SRC_URI[foldhash-0.1.5.sha256sum] = "d9c4f5dac5e15c24eb999c26181a6ca40b39fe946cbe4c263c7209467bc83af2"
@@ -427,7 +421,6 @@ SRC_URI[jiff-core-0.1.0.sha256sum] = "7feca88439efe53da3754500c1851dedf3cb36c524
 SRC_URI[jiff-static-0.2.35.sha256sum] = "3a69dcb3a21cfb32ce1cd056169337ca284af0766dd766e7878819b251a49204"
 SRC_URI[jiff-tzdb-0.1.8.sha256sum] = "142bd39932ad231f10513df9ab62661fead8719872150b7ad02a2df79f4e141e"
 SRC_URI[jiff-tzdb-platform-0.1.3.sha256sum] = "875a5a69ac2bab1a891711cf5eccbec1ce0341ea805560dcd90b7a2e925132e8"
-SRC_URI[jobserver-0.1.35.sha256sum] = "1c00acbd29eabad4a2392fa0e921c874934dbbf4194312ad20f04a0ed67a3cb3"
 SRC_URI[js-sys-0.3.91.sha256sum] = "b49715b7073f385ba4bc528e5747d02e66cb39c6146efb66b781f131f0fb399c"
 SRC_URI[junction-2.0.0.sha256sum] = "160f2eade097f30263b548aae5deb12ad349c909baa710fa24b92c9090b2e006"
 SRC_URI[lazy_static-1.5.0.sha256sum] = "bbd2bcb4c963f2ddae06a2efc7e9f3591312473c50c6685e1f298068316e66fe"
@@ -461,7 +454,6 @@ SRC_URI[petgraph-0.8.3.sha256sum] = "8701b58ea97060d5e5b155d383a69952a60943f0e6d
 SRC_URI[pin-project-1.1.11.sha256sum] = "f1749c7ed4bcaf4c3d0a3efc28538844fb29bcdd7d2b67b2be7e20ba861ff517"
 SRC_URI[pin-project-internal-1.1.11.sha256sum] = "d9b20ed30f105399776b9c883e68e536ef602a16ae6f596d2c473591d6ad64c6"
 SRC_URI[pin-project-lite-0.2.17.sha256sum] = "a89322df9ebe1c1578d689c92318e070967d1042b512afbe49518723f4e6d5cd"
-SRC_URI[pkg-config-0.3.32.sha256sum] = "7edddbd0b52d732b21ad9a5fab5c704c14cd949e5e9a1ec5929a24fded1b904c"
 SRC_URI[portable-atomic-1.13.1.sha256sum] = "c33a9471896f1c69cecef8d20cbe2f7accd12527ce60845ff44c153bb2a21b49"
 SRC_URI[portable-atomic-util-0.2.6.sha256sum] = "091397be61a01d4be58e7841595bd4bfedb15f1cd54977d79b8271e94ed799a3"
 SRC_URI[potential_utf-0.1.4.sha256sum] = "b73949432f5e2a09657003c25bca5e19a0e9c84f8058ca374f49e0ebe605af77"
@@ -505,13 +497,12 @@ SRC_URI[serde_spanned-1.1.1.sha256sum] = "6662b5879511e06e8999a8a235d848113e942c
 SRC_URI[sha2-0.10.9.sha256sum] = "a7507d819769d01a365ab707794a4084392c824f54a7a6a7862f8c3d0892b283"
 SRC_URI[sha2-0.11.0.sha256sum] = "446ba717509524cb3f22f17ecc096f10f4822d76ab5c0b9822c5f9c284e825f4"
 SRC_URI[sharded-slab-0.1.7.sha256sum] = "f40ca3c46823713e0d4209592e8d6e826aa57e928f09752619fc696c499637f6"
-SRC_URI[shlex-1.3.0.sha256sum] = "0fda2ff0d084019ba4d7c6f371c95d8fd75ce3524c3cb8fb653a3023f6323e64"
 SRC_URI[signal-hook-registry-1.4.8.sha256sum] = "c4db69cba1110affc0e9f7bcd48bbf87b3f4fc7c61fc9155afd4c469eb3d6c1b"
 SRC_URI[simd-adler32-0.3.8.sha256sum] = "e320a6c5ad31d271ad523dcf3ad13e2767ad8b1cb8f047f75a8aeaf8da139da2"
 SRC_URI[simdutf8-0.1.5.sha256sum] = "e3a9fe34e3e7a50316060351f37187a3f546bce95496156754b601a5fa71b76e"
 SRC_URI[similar-2.7.0.sha256sum] = "bbbb5d9659141646ae647b42fe094daf6c6192d1620870b449d9557f748b2daa"
 SRC_URI[slab-0.4.12.sha256sum] = "0c790de23124f9ab44544d7ac05d60440adc586479ce501c1d6d7da3cd8c9cf5"
-SRC_URI[smallvec-1.15.2.sha256sum] = "8ed6a63f02c8539c91a8685a86f4099661ba3da017932f6ebbea6de3f0fa7c90"
+SRC_URI[smallvec-1.16.0.sha256sum] = "b9be42f50aa861c555654aa3a37f52f4b1074bacf4e48fe0ef7fa584e80f1f0f"
 SRC_URI[smawk-0.3.2.sha256sum] = "b7c388c1b5e93756d0c740965c41e8822f866621d41acbdf6336a6a168f8840c"
 SRC_URI[socket2-0.6.3.sha256sum] = "3a766e1110788c36f4fa1c2b71b387a7815aa65f88ce0229841826633d93723e"
 SRC_URI[spdx-0.13.5.sha256sum] = "081670c233dfbed55690cc0cd38424e0e24ac1b2673d0b408b3f7b684738dfa9"
@@ -519,7 +510,7 @@ SRC_URI[stable_deref_trait-1.2.1.sha256sum] = "6ce2be8dc25455e1f91df71bfa12ad37d
 SRC_URI[strip-ansi-escapes-0.2.1.sha256sum] = "2a8f8038e7e7969abb3f1b7c2a811225e9296da208539e0f79c5251d6cac0025"
 SRC_URI[strsim-0.11.1.sha256sum] = "7da8b5736845d9f2fcb837ea5d9e2628564b3b043a70948a3f0b778838c5fb4f"
 SRC_URI[syn-2.0.118.sha256sum] = "1b9ae57f904213ebb649ce6895b8a66c66f0203b9319718f69a5612a065b1422"
-SRC_URI[syn-3.0.4.sha256sum] = "e6275cddf4610d1775e6d1fe9469b2e77d0f39fd98fb7450901b821e0c53649f"
+SRC_URI[syn-3.0.5.sha256sum] = "12df2e0110f65b775f769bb17ef989067a1d931b2eb822bd4346631eeada89f9"
 SRC_URI[synstructure-0.13.2.sha256sum] = "728a70f3dbaf5bab7f0c4b1ac8d7ae5ea60a4b5549c8a5914361c99147a709d2"
 SRC_URI[tar-codec-0.0.14.sha256sum] = "7ea42eb144d30fcbf32c26dfea8959175bb8335bfb7b18d20c6ed32edecf0551"
 SRC_URI[tar-framing-0.0.14.sha256sum] = "783223a7a6590be4227cb821e7ce80372575511f67c824921aba0752d8ad5573"
@@ -615,6 +606,3 @@ SRC_URI[zerovec-0.11.5.sha256sum] = "6c28719294829477f525be0186d13efa9a3c602f7ec
 SRC_URI[zerovec-derive-0.11.2.sha256sum] = "eadce39539ca5cb3985590102671f2567e659fca9666581ad3411d59207951f3"
 SRC_URI[zlib-rs-0.6.3.sha256sum] = "3be3d40e40a133f9c916ee3f9f4fa2d9d63435b5fbe1bfc6d9dae0aa0ada1513"
 SRC_URI[zmij-1.0.21.sha256sum] = "b8848ee67ecc8aedbaf3e4122217aff892639231befc6a1b58d29fff4c2cabaa"
-SRC_URI[zstd-0.13.3.sha256sum] = "e91ee311a569c327171651566e07972200e76fcfe2242a4fa446149a3881c08a"
-SRC_URI[zstd-safe-7.2.4.sha256sum] = "8f49c4d5f0abb602a93fb8736af2a4f4dd9512e36f7f570d66e65ff867ed3b9d"
-SRC_URI[zstd-sys-2.0.16+zstd.1.5.7.sha256sum] = "91e19ebc2adc8f83e43039e79776e3fda8ca919132d68a1fed6a5faca2683748"
diff --git a/meta/recipes-devtools/python/python3-uv-build_0.12.21.bb b/meta/recipes-devtools/python/python3-uv-build_0.13.0.bb
similarity index 92%
rename from meta/recipes-devtools/python/python3-uv-build_0.12.21.bb
rename to meta/recipes-devtools/python/python3-uv-build_0.13.0.bb
index c2808203f9..2ad38b2054 100644
--- a/meta/recipes-devtools/python/python3-uv-build_0.12.21.bb
+++ b/meta/recipes-devtools/python/python3-uv-build_0.13.0.bb
@@ -11,7 +11,7 @@ LIC_FILES_CHKSUM = "file://LICENSE-APACHE;md5=86d3f3a95c324c9479bd8986968f4327 \
                     file://crates/uv-pep508/License-Apache;md5=e23fadd6ceef8c618fc1c65191d846fa \
                     file://crates/uv-pep508/License-BSD;md5=ef7a6027dc4c2389b9afad7e690274c7"
 
-SRC_URI[sha256sum] = "616d1ecccca300b240e65a88644f8c2996b858ff039f759d717249d28f94a2a6"
+SRC_URI[sha256sum] = "bd2614f24a58dccd4865d4f86ddd91dd01fd0efab4632e033186a8423b8a3515"
 
 require ${BPN}-crates.inc
 
-- 
2.47.1


--===============4844468677958449083==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: attachment; filename="buildhistory-diff-full.txt"

packages/x86-64-v3-poky-linux/python3-uv-build: SRC_URI changed from "https://files.pythonhosted.org/packages/source/u/uv_build/uv_build-0.12.21.tar.gz crate://crates.io/adler2/2.0.1 crate://crates.io/aho-corasick/1.1.4 crate://crates.io/ambient-authority/0.0.2 crate://crates.io/anstream/1.0.0 crate://crates.io/anstyle/1.0.14 crate://crates.io/anstyle-parse/1.0.0 crate://crates.io/anstyle-query/1.1.5 crate://crates.io/anstyle-wincon/3.0.11 crate://crates.io/anyhow/1.0.104 crate://crates.io/archive-trait/0.0.14 crate://crates.io/arcstr/1.2.0 crate://crates.io/arrayvec/0.7.8 crate://crates.io/astral-tokio-tar/0.7.0 crate://crates.io/astral-version-ranges/0.2.2 crate://crates.io/astral_async_zip/0.0.20 crate://crates.io/async-compression/0.4.19 crate://crates.io/autocfg/1.5.0 crate://crates.io/backon/1.6.0 crate://crates.io/base64/0.22.1 crate://crates.io/bitflags/1.3.2 crate://crates.io/bitflags/2.13.1 crate://crates.io/block-buffer/0.10.4 crate://crates.io/block-buffer/0.12.1 crate://
 crates.io/boxcar/0.2.14 crate://crates.io/bstr/1.12.1 crate://crates.io/bumpalo/3.20.2 crate://crates.io/bytecheck/0.8.3 crate://crates.io/bytecheck_derive/0.8.3 crate://crates.io/bytes/1.12.1 crate://crates.io/cap-primitives/4.0.3 crate://crates.io/cap-std/4.0.3 crate://crates.io/cc/1.2.57 crate://crates.io/cfg-if/1.0.4 crate://crates.io/charset/0.1.5 crate://crates.io/clap/4.6.6 crate://crates.io/clap_builder/4.6.6 crate://crates.io/clap_derive/4.6.4 crate://crates.io/clap_lex/1.1.0 crate://crates.io/colorchoice/1.0.5 crate://crates.io/console/0.16.4 crate://crates.io/cpufeatures/0.2.17 crate://crates.io/cpufeatures/0.3.0 crate://crates.io/crc32fast/1.5.0 crate://crates.io/crypto-common/0.1.7 crate://crates.io/crypto-common/0.2.2 crate://crates.io/csv/1.4.0 crate://crates.io/csv-core/0.1.13 crate://crates.io/data-encoding/2.11.1 crate://crates.io/defmt/1.1.0 crate://crates.io/defmt-macros/1.1.0 crate://crates.io/defmt-parser/1.0.0 crate://crates.io/digest/0.10.7 crate://crates.io/
 digest/0.11.3 crate://crates.io/displaydoc/0.2.5 crate://crates.io/dunce/1.0.5 crate://crates.io/dyn-clone/1.0.20 crate://crates.io/either/1.18.0 crate://crates.io/encode_unicode/1.0.0 crate://crates.io/encoding_rs/0.8.35 crate://crates.io/encoding_rs_io/0.1.8 crate://crates.io/enumflags2/0.7.12 crate://crates.io/enumflags2_derive/0.7.12 crate://crates.io/equivalent/1.0.2 crate://crates.io/erased-serde/0.4.10 crate://crates.io/errno/0.3.14 crate://crates.io/fastrand/2.5.0 crate://crates.io/find-msvc-tools/0.1.9 crate://crates.io/fixedbitset/0.5.7 crate://crates.io/flate2/1.1.10 crate://crates.io/foldhash/0.1.5 crate://crates.io/foldhash/0.2.0 crate://crates.io/form_urlencoded/1.2.2 crate://crates.io/fs-err/3.3.1 crate://crates.io/fs-set-times/0.20.3 crate://crates.io/futures/0.3.34 crate://crates.io/futures-channel/0.3.34 crate://crates.io/futures-core/0.3.34 crate://crates.io/futures-executor/0.3.34 crate://crates.io/futures-io/0.3.34 crate://crates.io/futures-lite/2.6.1 crate://cr
 ates.io/futures-macro/0.3.34 crate://crates.io/futures-sink/0.3.34 crate://crates.io/futures-task/0.3.34 crate://crates.io/futures-util/0.3.34 crate://crates.io/generic-array/0.14.7 crate://crates.io/getrandom/0.4.3 crate://crates.io/globset/0.4.20 crate://crates.io/hashbrown/0.15.5 crate://crates.io/hashbrown/0.17.1 crate://crates.io/heck/0.5.0 crate://crates.io/hex/0.4.3 crate://crates.io/hybrid-array/0.4.13 crate://crates.io/icu_collections/2.1.1 crate://crates.io/icu_locale_core/2.1.1 crate://crates.io/icu_normalizer/2.1.1 crate://crates.io/icu_normalizer_data/2.1.1 crate://crates.io/icu_properties/2.1.2 crate://crates.io/icu_properties_data/2.1.2 crate://crates.io/icu_provider/2.1.1 crate://crates.io/idna/1.1.0 crate://crates.io/idna_adapter/1.2.1 crate://crates.io/indexmap/2.14.1 crate://crates.io/indoc/2.0.7 crate://crates.io/insta/1.48.0 crate://crates.io/io-extras/0.19.0 crate://crates.io/io-lifetimes/2.0.4 crate://crates.io/io-lifetimes/3.0.1 crate://crates.io/ipnet/2.12.0
  crate://crates.io/is_terminal_polyfill/1.70.2 crate://crates.io/itertools/0.14.0 crate://crates.io/itoa/1.0.17 crate://crates.io/jiff/0.2.35 crate://crates.io/jiff-core/0.1.0 crate://crates.io/jiff-static/0.2.35 crate://crates.io/jiff-tzdb/0.1.8 crate://crates.io/jiff-tzdb-platform/0.1.3 crate://crates.io/jobserver/0.1.35 crate://crates.io/js-sys/0.3.91 crate://crates.io/junction/2.0.0 crate://crates.io/lazy_static/1.5.0 crate://crates.io/libc/0.2.189 crate://crates.io/linux-raw-sys/0.12.1 crate://crates.io/litemap/0.8.1 crate://crates.io/lock_api/0.4.14 crate://crates.io/log/0.4.29 crate://crates.io/mailparse/0.16.1 crate://crates.io/matchers/0.2.0 crate://crates.io/maybe-owned/0.3.4 crate://crates.io/memchr/2.8.3 crate://crates.io/miniz_oxide/0.9.1 crate://crates.io/mio/1.2.0 crate://crates.io/munge/0.4.7 crate://crates.io/munge_macro/0.4.7 crate://crates.io/nu-ansi-term/0.50.3 crate://crates.io/once_cell/1.21.4 crate://crates.io/once_cell_polyfill/1.70.2 crate://crates.io/owo-co
 lors/4.4.0 crate://crates.io/parking/2.2.1 crate://crates.io/parking_lot/0.12.5 crate://crates.io/parking_lot_core/0.9.12 crate://crates.io/path-slash/0.2.1 crate://crates.io/percent-encoding/2.3.2 crate://crates.io/pest/2.8.6 crate://crates.io/pest_derive/2.8.6 crate://crates.io/pest_generator/2.8.6 crate://crates.io/pest_meta/2.8.6 crate://crates.io/petgraph/0.8.3 crate://crates.io/pin-project/1.1.11 crate://crates.io/pin-project-internal/1.1.11 crate://crates.io/pin-project-lite/0.2.17 crate://crates.io/pkg-config/0.3.32 crate://crates.io/portable-atomic/1.13.1 crate://crates.io/portable-atomic-util/0.2.6 crate://crates.io/potential_utf/0.1.4 crate://crates.io/proc-macro-error-attr2/2.0.0 crate://crates.io/proc-macro-error2/2.0.1 crate://crates.io/proc-macro2/1.0.107 crate://crates.io/ptr_meta/0.3.1 crate://crates.io/ptr_meta_derive/0.3.1 crate://crates.io/quote/1.0.47 crate://crates.io/quoted_printable/0.5.1 crate://crates.io/r-efi/6.0.0 crate://crates.io/rancor/0.1.1 crate://cr
 ates.io/redox_syscall/0.5.15 crate://crates.io/ref-cast/1.0.27 crate://crates.io/ref-cast-impl/1.0.27 crate://crates.io/reflink-copy/0.1.30 crate://crates.io/regex/1.13.1 crate://crates.io/regex-automata/0.4.18 crate://crates.io/regex-syntax/0.8.11 crate://crates.io/rend/0.5.3 crate://crates.io/rkyv/0.8.18 crate://crates.io/rkyv_derive/0.8.18 crate://crates.io/rustc-hash/2.1.3 crate://crates.io/rustix/1.1.4 crate://crates.io/rustix-linux-procfs/0.1.1 crate://crates.io/rustversion/1.0.22 crate://crates.io/ryu/1.0.23 crate://crates.io/same-file/1.0.6 crate://crates.io/schemars/1.2.2 crate://crates.io/schemars_derive/1.2.2 crate://crates.io/scopeguard/1.2.0 crate://crates.io/seahash/4.1.0 crate://crates.io/self-replace/1.5.0 crate://crates.io/serde/1.0.229 crate://crates.io/serde-untagged/0.1.9 crate://crates.io/serde_core/1.0.229 crate://crates.io/serde_derive/1.0.229 crate://crates.io/serde_derive_internals/0.30.0 crate://crates.io/serde_json/1.0.151 crate://crates.io/serde_spanned/1
 .1.1 crate://crates.io/sha2/0.10.9 crate://crates.io/sha2/0.11.0 crate://crates.io/sharded-slab/0.1.7 crate://crates.io/shlex/1.3.0 crate://crates.io/signal-hook-registry/1.4.8 crate://crates.io/simd-adler32/0.3.8 crate://crates.io/simdutf8/0.1.5 crate://crates.io/similar/2.7.0 crate://crates.io/slab/0.4.12 crate://crates.io/smallvec/1.15.2 crate://crates.io/smawk/0.3.2 crate://crates.io/socket2/0.6.3 crate://crates.io/spdx/0.13.5 crate://crates.io/stable_deref_trait/1.2.1 crate://crates.io/strip-ansi-escapes/0.2.1 crate://crates.io/strsim/0.11.1 crate://crates.io/syn/2.0.118 crate://crates.io/syn/3.0.4 crate://crates.io/synstructure/0.13.2 crate://crates.io/tar-codec/0.0.14 crate://crates.io/tar-framing/0.0.14 crate://crates.io/temp-env/0.3.6 crate://crates.io/tempfile/3.27.0 crate://crates.io/terminal_size/0.4.4 crate://crates.io/textwrap/0.16.2 crate://crates.io/thiserror/2.0.20 crate://crates.io/thiserror-impl/2.0.20 crate://crates.io/thread_local/1.1.9 crate://crates.io/tinystr
 /0.8.2 crate://crates.io/tinyvec/1.11.0 crate://crates.io/tinyvec_macros/0.1.1 crate://crates.io/tokio/1.53.1 crate://crates.io/tokio-macros/2.7.0 crate://crates.io/tokio-stream/0.1.19 crate://crates.io/toml/1.1.3+spec-1.1.0 crate://crates.io/toml_datetime/1.1.1+spec-1.1.0 crate://crates.io/toml_edit/0.25.13+spec-1.1.0 crate://crates.io/toml_parser/1.1.2+spec-1.1.0 crate://crates.io/toml_writer/1.1.2+spec-1.1.0 crate://crates.io/tracing/0.1.44 crate://crates.io/tracing-attributes/0.1.31 crate://crates.io/tracing-core/0.1.36 crate://crates.io/tracing-log/0.2.0 crate://crates.io/tracing-subscriber/0.3.23 crate://crates.io/tracing-test/0.2.6 crate://crates.io/tracing-test-macro/0.2.6 crate://crates.io/typeid/1.0.3 crate://crates.io/typenum/1.20.1 crate://crates.io/ucd-trie/0.1.7 crate://crates.io/unicode-ident/1.0.24 crate://crates.io/unicode-width/0.2.2 crate://crates.io/unscanny/0.1.0 crate://crates.io/url/2.5.8 crate://crates.io/utf8_iter/1.0.4 crate://crates.io/utf8parse/0.2.2 crat
 e://crates.io/uuid/1.24.0 crate://crates.io/valuable/0.1.1 crate://crates.io/version_check/0.9.5 crate://crates.io/vte/0.14.1 crate://crates.io/walkdir/2.5.0 crate://crates.io/wasi/0.11.1+wasi-snapshot-preview1 crate://crates.io/wasm-bindgen/0.2.114 crate://crates.io/wasm-bindgen-macro/0.2.114 crate://crates.io/wasm-bindgen-macro-support/0.2.114 crate://crates.io/wasm-bindgen-shared/0.2.114 crate://crates.io/winapi-util/0.1.11 crate://crates.io/windows/0.61.3 crate://crates.io/windows-collections/0.2.0 crate://crates.io/windows-core/0.61.2 crate://crates.io/windows-future/0.2.1 crate://crates.io/windows-implement/0.60.2 crate://crates.io/windows-interface/0.59.3 crate://crates.io/windows-link/0.1.3 crate://crates.io/windows-link/0.2.1 crate://crates.io/windows-numerics/0.2.0 crate://crates.io/windows-result/0.3.4 crate://crates.io/windows-strings/0.4.2 crate://crates.io/windows-sys/0.52.0 crate://crates.io/windows-sys/0.60.2 crate://crates.io/windows-sys/0.61.2 crate://crates.io/win
 dows-targets/0.52.6 crate://crates.io/windows-targets/0.53.5 crate://crates.io/windows-threading/0.1.0 crate://crates.io/windows_aarch64_gnullvm/0.52.6 crate://crates.io/windows_aarch64_gnullvm/0.53.1 crate://crates.io/windows_aarch64_msvc/0.52.6 crate://crates.io/windows_aarch64_msvc/0.53.1 crate://crates.io/windows_i686_gnu/0.52.6 crate://crates.io/windows_i686_gnu/0.53.1 crate://crates.io/windows_i686_gnullvm/0.52.6 crate://crates.io/windows_i686_gnullvm/0.53.1 crate://crates.io/windows_i686_msvc/0.52.6 crate://crates.io/windows_i686_msvc/0.53.1 crate://crates.io/windows_x86_64_gnu/0.52.6 crate://crates.io/windows_x86_64_gnu/0.53.1 crate://crates.io/windows_x86_64_gnullvm/0.52.6 crate://crates.io/windows_x86_64_gnullvm/0.53.1 crate://crates.io/windows_x86_64_msvc/0.52.6 crate://crates.io/windows_x86_64_msvc/0.53.1 crate://crates.io/winnow/1.0.3 crate://crates.io/winx/0.36.4 crate://crates.io/writeable/0.6.2 crate://crates.io/yoke/0.8.1 crate://crates.io/yoke-derive/0.8.1 crate://
 crates.io/zerocopy/0.8.56 crate://crates.io/zerocopy-derive/0.8.56 crate://crates.io/zerofrom/0.1.6 crate://crates.io/zerofrom-derive/0.1.6 crate://crates.io/zerotrie/0.2.3 crate://crates.io/zerovec/0.11.5 crate://crates.io/zerovec-derive/0.11.2 crate://crates.io/zlib-rs/0.6.3 crate://crates.io/zmij/1.0.21 crate://crates.io/zstd/0.13.3 crate://crates.io/zstd-safe/7.2.4 crate://crates.io/zstd-sys/2.0.16+zstd.1.5.7" to "https://files.pythonhosted.org/packages/source/u/uv_build/uv_build-0.13.0.tar.gz crate://crates.io/adler2/2.0.1 crate://crates.io/aho-corasick/1.1.4 crate://crates.io/ambient-authority/0.0.2 crate://crates.io/anstream/1.0.0 crate://crates.io/anstyle/1.0.14 crate://crates.io/anstyle-parse/1.0.0 crate://crates.io/anstyle-query/1.1.5 crate://crates.io/anstyle-wincon/3.0.11 crate://crates.io/anyhow/1.0.104 crate://crates.io/archive-trait/0.0.14 crate://crates.io/arcstr/1.2.0 crate://crates.io/arrayvec/0.7.8 crate://crates.io/astral-tokio-tar/0.7.0 crate://crates.io/astral-
 version-ranges/0.2.2 crate://crates.io/astral_async_zip/0.0.21 crate://crates.io/async-compression/0.4.45 crate://crates.io/autocfg/1.5.0 crate://crates.io/backon/1.6.0 crate://crates.io/base64/0.22.1 crate://crates.io/bitflags/1.3.2 crate://crates.io/bitflags/2.13.1 crate://crates.io/block-buffer/0.10.4 crate://crates.io/block-buffer/0.12.1 crate://crates.io/boxcar/0.2.14 crate://crates.io/bstr/1.12.1 crate://crates.io/bumpalo/3.20.2 crate://crates.io/bytecheck/0.8.3 crate://crates.io/bytecheck_derive/0.8.3 crate://crates.io/bytes/1.12.1 crate://crates.io/cap-primitives/4.0.3 crate://crates.io/cap-std/4.0.3 crate://crates.io/cfg-if/1.0.4 crate://crates.io/charset/0.1.5 crate://crates.io/clap/4.6.6 crate://crates.io/clap_builder/4.6.6 crate://crates.io/clap_derive/4.6.4 crate://crates.io/clap_lex/1.1.0 crate://crates.io/colorchoice/1.0.5 crate://crates.io/compression-codecs/0.4.45 crate://crates.io/compression-core/0.4.33 crate://crates.io/console/0.16.4 crate://crates.io/cpufeature
 s/0.2.17 crate://crates.io/cpufeatures/0.3.0 crate://crates.io/crc32fast/1.5.0 crate://crates.io/crypto-common/0.1.7 crate://crates.io/crypto-common/0.2.2 crate://crates.io/csv/1.4.0 crate://crates.io/csv-core/0.1.13 crate://crates.io/data-encoding/2.11.1 crate://crates.io/defmt/1.1.0 crate://crates.io/defmt-macros/1.1.0 crate://crates.io/defmt-parser/1.0.0 crate://crates.io/digest/0.10.7 crate://crates.io/digest/0.11.3 crate://crates.io/displaydoc/0.2.5 crate://crates.io/dunce/1.0.5 crate://crates.io/dyn-clone/1.0.20 crate://crates.io/either/1.18.0 crate://crates.io/encode_unicode/1.0.0 crate://crates.io/encoding_rs/0.8.35 crate://crates.io/encoding_rs_io/0.1.8 crate://crates.io/enumflags2/0.7.12 crate://crates.io/enumflags2_derive/0.7.12 crate://crates.io/equivalent/1.0.2 crate://crates.io/erased-serde/0.4.10 crate://crates.io/errno/0.3.14 crate://crates.io/fastrand/2.5.0 crate://crates.io/fixedbitset/0.5.7 crate://crates.io/flate2/1.1.10 crate://crates.io/foldhash/0.1.5 crate://c
 rates.io/foldhash/0.2.0 crate://crates.io/form_urlencoded/1.2.2 crate://crates.io/fs-err/3.3.1 crate://crates.io/fs-set-times/0.20.3 crate://crates.io/futures/0.3.34 crate://crates.io/futures-channel/0.3.34 crate://crates.io/futures-core/0.3.34 crate://crates.io/futures-executor/0.3.34 crate://crates.io/futures-io/0.3.34 crate://crates.io/futures-lite/2.6.1 crate://crates.io/futures-macro/0.3.34 crate://crates.io/futures-sink/0.3.34 crate://crates.io/futures-task/0.3.34 crate://crates.io/futures-util/0.3.34 crate://crates.io/generic-array/0.14.7 crate://crates.io/getrandom/0.4.3 crate://crates.io/globset/0.4.20 crate://crates.io/hashbrown/0.15.5 crate://crates.io/hashbrown/0.17.1 crate://crates.io/heck/0.5.0 crate://crates.io/hex/0.4.3 crate://crates.io/hybrid-array/0.4.13 crate://crates.io/icu_collections/2.1.1 crate://crates.io/icu_locale_core/2.1.1 crate://crates.io/icu_normalizer/2.1.1 crate://crates.io/icu_normalizer_data/2.1.1 crate://crates.io/icu_properties/2.1.2 crate://cra
 tes.io/icu_properties_data/2.1.2 crate://crates.io/icu_provider/2.1.1 crate://crates.io/idna/1.1.0 crate://crates.io/idna_adapter/1.2.1 crate://crates.io/indexmap/2.14.1 crate://crates.io/indoc/2.0.7 crate://crates.io/insta/1.48.0 crate://crates.io/io-extras/0.19.0 crate://crates.io/io-lifetimes/2.0.4 crate://crates.io/io-lifetimes/3.0.1 crate://crates.io/ipnet/2.12.0 crate://crates.io/is_terminal_polyfill/1.70.2 crate://crates.io/itertools/0.14.0 crate://crates.io/itoa/1.0.17 crate://crates.io/jiff/0.2.35 crate://crates.io/jiff-core/0.1.0 crate://crates.io/jiff-static/0.2.35 crate://crates.io/jiff-tzdb/0.1.8 crate://crates.io/jiff-tzdb-platform/0.1.3 crate://crates.io/js-sys/0.3.91 crate://crates.io/junction/2.0.0 crate://crates.io/lazy_static/1.5.0 crate://crates.io/libc/0.2.189 crate://crates.io/linux-raw-sys/0.12.1 crate://crates.io/litemap/0.8.1 crate://crates.io/lock_api/0.4.14 crate://crates.io/log/0.4.29 crate://crates.io/mailparse/0.16.1 crate://crates.io/matchers/0.2.0 cra
 te://crates.io/maybe-owned/0.3.4 crate://crates.io/memchr/2.8.3 crate://crates.io/miniz_oxide/0.9.1 crate://crates.io/mio/1.2.0 crate://crates.io/munge/0.4.7 crate://crates.io/munge_macro/0.4.7 crate://crates.io/nu-ansi-term/0.50.3 crate://crates.io/once_cell/1.21.4 crate://crates.io/once_cell_polyfill/1.70.2 crate://crates.io/owo-colors/4.4.0 crate://crates.io/parking/2.2.1 crate://crates.io/parking_lot/0.12.5 crate://crates.io/parking_lot_core/0.9.12 crate://crates.io/path-slash/0.2.1 crate://crates.io/percent-encoding/2.3.2 crate://crates.io/pest/2.8.6 crate://crates.io/pest_derive/2.8.6 crate://crates.io/pest_generator/2.8.6 crate://crates.io/pest_meta/2.8.6 crate://crates.io/petgraph/0.8.3 crate://crates.io/pin-project/1.1.11 crate://crates.io/pin-project-internal/1.1.11 crate://crates.io/pin-project-lite/0.2.17 crate://crates.io/portable-atomic/1.13.1 crate://crates.io/portable-atomic-util/0.2.6 crate://crates.io/potential_utf/0.1.4 crate://crates.io/proc-macro-error-attr2/2.0
 .0 crate://crates.io/proc-macro-error2/2.0.1 crate://crates.io/proc-macro2/1.0.107 crate://crates.io/ptr_meta/0.3.1 crate://crates.io/ptr_meta_derive/0.3.1 crate://crates.io/quote/1.0.47 crate://crates.io/quoted_printable/0.5.1 crate://crates.io/r-efi/6.0.0 crate://crates.io/rancor/0.1.1 crate://crates.io/redox_syscall/0.5.15 crate://crates.io/ref-cast/1.0.27 crate://crates.io/ref-cast-impl/1.0.27 crate://crates.io/reflink-copy/0.1.30 crate://crates.io/regex/1.13.1 crate://crates.io/regex-automata/0.4.18 crate://crates.io/regex-syntax/0.8.11 crate://crates.io/rend/0.5.3 crate://crates.io/rkyv/0.8.18 crate://crates.io/rkyv_derive/0.8.18 crate://crates.io/rustc-hash/2.1.3 crate://crates.io/rustix/1.1.4 crate://crates.io/rustix-linux-procfs/0.1.1 crate://crates.io/rustversion/1.0.22 crate://crates.io/ryu/1.0.23 crate://crates.io/same-file/1.0.6 crate://crates.io/schemars/1.2.2 crate://crates.io/schemars_derive/1.2.2 crate://crates.io/scopeguard/1.2.0 crate://crates.io/seahash/4.1.0 cra
 te://crates.io/self-replace/1.5.0 crate://crates.io/serde/1.0.229 crate://crates.io/serde-untagged/0.1.9 crate://crates.io/serde_core/1.0.229 crate://crates.io/serde_derive/1.0.229 crate://crates.io/serde_derive_internals/0.30.0 crate://crates.io/serde_json/1.0.151 crate://crates.io/serde_spanned/1.1.1 crate://crates.io/sha2/0.10.9 crate://crates.io/sha2/0.11.0 crate://crates.io/sharded-slab/0.1.7 crate://crates.io/signal-hook-registry/1.4.8 crate://crates.io/simd-adler32/0.3.8 crate://crates.io/simdutf8/0.1.5 crate://crates.io/similar/2.7.0 crate://crates.io/slab/0.4.12 crate://crates.io/smallvec/1.16.0 crate://crates.io/smawk/0.3.2 crate://crates.io/socket2/0.6.3 crate://crates.io/spdx/0.13.5 crate://crates.io/stable_deref_trait/1.2.1 crate://crates.io/strip-ansi-escapes/0.2.1 crate://crates.io/strsim/0.11.1 crate://crates.io/syn/2.0.118 crate://crates.io/syn/3.0.5 crate://crates.io/synstructure/0.13.2 crate://crates.io/tar-codec/0.0.14 crate://crates.io/tar-framing/0.0.14 crate:/
 /crates.io/temp-env/0.3.6 crate://crates.io/tempfile/3.27.0 crate://crates.io/terminal_size/0.4.4 crate://crates.io/textwrap/0.16.2 crate://crates.io/thiserror/2.0.20 crate://crates.io/thiserror-impl/2.0.20 crate://crates.io/thread_local/1.1.9 crate://crates.io/tinystr/0.8.2 crate://crates.io/tinyvec/1.11.0 crate://crates.io/tinyvec_macros/0.1.1 crate://crates.io/tokio/1.53.1 crate://crates.io/tokio-macros/2.7.0 crate://crates.io/tokio-stream/0.1.19 crate://crates.io/toml/1.1.3+spec-1.1.0 crate://crates.io/toml_datetime/1.1.1+spec-1.1.0 crate://crates.io/toml_edit/0.25.13+spec-1.1.0 crate://crates.io/toml_parser/1.1.2+spec-1.1.0 crate://crates.io/toml_writer/1.1.2+spec-1.1.0 crate://crates.io/tracing/0.1.44 crate://crates.io/tracing-attributes/0.1.31 crate://crates.io/tracing-core/0.1.36 crate://crates.io/tracing-log/0.2.0 crate://crates.io/tracing-subscriber/0.3.23 crate://crates.io/tracing-test/0.2.6 crate://crates.io/tracing-test-macro/0.2.6 crate://crates.io/typeid/1.0.3 crate:/
 /crates.io/typenum/1.20.1 crate://crates.io/ucd-trie/0.1.7 crate://crates.io/unicode-ident/1.0.24 crate://crates.io/unicode-width/0.2.2 crate://crates.io/unscanny/0.1.0 crate://crates.io/url/2.5.8 crate://crates.io/utf8_iter/1.0.4 crate://crates.io/utf8parse/0.2.2 crate://crates.io/uuid/1.24.0 crate://crates.io/valuable/0.1.1 crate://crates.io/version_check/0.9.5 crate://crates.io/vte/0.14.1 crate://crates.io/walkdir/2.5.0 crate://crates.io/wasi/0.11.1+wasi-snapshot-preview1 crate://crates.io/wasm-bindgen/0.2.114 crate://crates.io/wasm-bindgen-macro/0.2.114 crate://crates.io/wasm-bindgen-macro-support/0.2.114 crate://crates.io/wasm-bindgen-shared/0.2.114 crate://crates.io/winapi-util/0.1.11 crate://crates.io/windows/0.61.3 crate://crates.io/windows-collections/0.2.0 crate://crates.io/windows-core/0.61.2 crate://crates.io/windows-future/0.2.1 crate://crates.io/windows-implement/0.60.2 crate://crates.io/windows-interface/0.59.3 crate://crates.io/windows-link/0.1.3 crate://crates.io/wi
 ndows-link/0.2.1 crate://crates.io/windows-numerics/0.2.0 crate://crates.io/windows-result/0.3.4 crate://crates.io/windows-strings/0.4.2 crate://crates.io/windows-sys/0.52.0 crate://crates.io/windows-sys/0.60.2 crate://crates.io/windows-sys/0.61.2 crate://crates.io/windows-targets/0.52.6 crate://crates.io/windows-targets/0.53.5 crate://crates.io/windows-threading/0.1.0 crate://crates.io/windows_aarch64_gnullvm/0.52.6 crate://crates.io/windows_aarch64_gnullvm/0.53.1 crate://crates.io/windows_aarch64_msvc/0.52.6 crate://crates.io/windows_aarch64_msvc/0.53.1 crate://crates.io/windows_i686_gnu/0.52.6 crate://crates.io/windows_i686_gnu/0.53.1 crate://crates.io/windows_i686_gnullvm/0.52.6 crate://crates.io/windows_i686_gnullvm/0.53.1 crate://crates.io/windows_i686_msvc/0.52.6 crate://crates.io/windows_i686_msvc/0.53.1 crate://crates.io/windows_x86_64_gnu/0.52.6 crate://crates.io/windows_x86_64_gnu/0.53.1 crate://crates.io/windows_x86_64_gnullvm/0.52.6 crate://crates.io/windows_x86_64_gnul
 lvm/0.53.1 crate://crates.io/windows_x86_64_msvc/0.52.6 crate://crates.io/windows_x86_64_msvc/0.53.1 crate://crates.io/winnow/1.0.3 crate://crates.io/winx/0.36.4 crate://crates.io/writeable/0.6.2 crate://crates.io/yoke/0.8.1 crate://crates.io/yoke-derive/0.8.1 crate://crates.io/zerocopy/0.8.56 crate://crates.io/zerocopy-derive/0.8.56 crate://crates.io/zerofrom/0.1.6 crate://crates.io/zerofrom-derive/0.1.6 crate://crates.io/zerotrie/0.2.3 crate://crates.io/zerovec/0.11.5 crate://crates.io/zerovec-derive/0.11.2 crate://crates.io/zlib-rs/0.6.3 crate://crates.io/zmij/1.0.21"
packages/x86-64-v3-poky-linux/python3-uv-build: PV changed from "0.12.21" to "0.13.0"
packages/x86-64-v3-poky-linux/python3-uv-build: PKGV changed from 0.12.21 [default] to 0.13.0 [default]
packages/x86-64-v3-poky-linux/python3-uv-build/python3-uv-build-dbg: PV changed from "0.12.21" to "0.13.0"
packages/x86-64-v3-poky-linux/python3-uv-build/python3-uv-build-dbg: PKGV changed from 0.12.21 [default] to 0.13.0 [default]
packages/x86-64-v3-poky-linux/python3-uv-build/python3-uv-build-dbg: RRECOMMENDS: removed "libzstd-dbg"
packages/x86-64-v3-poky-linux/python3-uv-build/python3-uv-build-dev: PV changed from "0.12.21" to "0.13.0"
packages/x86-64-v3-poky-linux/python3-uv-build/python3-uv-build-dev: PKGV changed from 0.12.21 [default] to 0.13.0 [default]
packages/x86-64-v3-poky-linux/python3-uv-build/python3-uv-build-dev: RRECOMMENDS: removed "libzstd-dev"
packages/x86-64-v3-poky-linux/python3-uv-build/python3-uv-build-doc: PV changed from "0.12.21" to "0.13.0"
packages/x86-64-v3-poky-linux/python3-uv-build/python3-uv-build-doc: PKGV changed from 0.12.21 [default] to 0.13.0 [default]
packages/x86-64-v3-poky-linux/python3-uv-build/python3-uv-build-locale: PV changed from "0.12.21" to "0.13.0"
packages/x86-64-v3-poky-linux/python3-uv-build/python3-uv-build-locale: PKGV changed from 0.12.21 [default] to 0.13.0 [default]
packages/x86-64-v3-poky-linux/python3-uv-build/python3-uv-build-src: PV changed from "0.12.21" to "0.13.0"
packages/x86-64-v3-poky-linux/python3-uv-build/python3-uv-build-src: PKGV changed from 0.12.21 [default] to 0.13.0 [default]
packages/x86-64-v3-poky-linux/python3-uv-build/python3-uv-build-staticdev: PV changed from "0.12.21" to "0.13.0"
packages/x86-64-v3-poky-linux/python3-uv-build/python3-uv-build-staticdev: PKGV changed from 0.12.21 [default] to 0.13.0 [default]
packages/x86-64-v3-poky-linux/python3-uv-build/python3-uv-build: FILELIST: directory renamed /usr/lib/python3.14/site-packages/uv_build-0.12.21.dist-info -> /usr/lib/python3.14/site-packages/uv_build-0.13.0.dist-info, directory renamed /usr/lib/python3.14/site-packages/uv_build-0.12.21.dist-info/licenses -> /usr/lib/python3.14/site-packages/uv_build-0.13.0.dist-info/licenses
packages/x86-64-v3-poky-linux/python3-uv-build/python3-uv-build: RDEPENDS: removed "libzstd (['>= 1.5.7'])"
packages/x86-64-v3-poky-linux/python3-uv-build/python3-uv-build: PKGSIZE changed from 4466017 to 4371808 (-2%)
packages/x86-64-v3-poky-linux/python3-uv-build/python3-uv-build: PV changed from "0.12.21" to "0.13.0"
packages/x86-64-v3-poky-linux/python3-uv-build/python3-uv-build: PKGV changed from 0.12.21 [default] to 0.13.0 [default]
Changes to packages/x86-64-v3-poky-linux/python3-uv-build (sysroot):
  /usr/lib/python3.14/site-packages/uv_build-0.13.0.dist-info was added
  /usr/lib/python3.14/site-packages/uv_build-0.13.0.dist-info/licenses was added
  /usr/lib/python3.14/site-packages/uv_build-0.13.0.dist-info/licenses/LICENSE-APACHE was added
  /usr/lib/python3.14/site-packages/uv_build-0.13.0.dist-info/licenses/LICENSE-MIT was added
  /usr/lib/python3.14/site-packages/uv_build-0.13.0.dist-info/METADATA was added
  /usr/lib/python3.14/site-packages/uv_build-0.13.0.dist-info/WHEEL was added
  /usr/lib/python3.14/site-packages/uv_build-0.12.21.dist-info was removed
  /usr/lib/python3.14/site-packages/uv_build-0.12.21.dist-info/licenses was removed
  /usr/lib/python3.14/site-packages/uv_build-0.12.21.dist-info/licenses/LICENSE-APACHE was removed
  /usr/lib/python3.14/site-packages/uv_build-0.12.21.dist-info/licenses/LICENSE-MIT was removed
  /usr/lib/python3.14/site-packages/uv_build-0.12.21.dist-info/METADATA was removed
  /usr/lib/python3.14/site-packages/uv_build-0.12.21.dist-info/WHEEL was removed

--===============4844468677958449083==
Content-Type: application/octet-stream
MIME-Version: 1.0
Content-Transfer-Encoding: base64
Content-Disposition: attachment;
 filename="0001-python3-uv-build-upgrade-0.12.21-0.13.0.patch"

RnJvbSBkNmUxM2VkYzNkNGE5ZGJiNWI1ODM1Yzg3YjUwYjY1NjI5YjJiZGNhIE1vbiBTZXAgMTcg
MDA6MDA6MDAgMjAwMQpGcm9tOiBVcGdyYWRlIEhlbHBlciA8YXVoQHlvY3RvcHJvamVjdC5vcmc+
CkRhdGU6IFNhdCwgMTAgT2N0IDIwMjYgMDU6MTk6MTAgKzAwMDAKU3ViamVjdDogW1BBVENIXSBw
eXRob24zLXV2LWJ1aWxkOiB1cGdyYWRlIDAuMTIuMjEgLT4gMC4xMy4wCgotLS0KIC4uLi9weXRo
b24vcHl0aG9uMy11di1idWlsZC1jcmF0ZXMuaW5jICAgICAgICB8IDM2ICsrKysrKystLS0tLS0t
LS0tLS0KIC4uLl8wLjEyLjIxLmJiID0+IHB5dGhvbjMtdXYtYnVpbGRfMC4xMy4wLmJifSB8ICAy
ICstCiAyIGZpbGVzIGNoYW5nZWQsIDEzIGluc2VydGlvbnMoKyksIDI1IGRlbGV0aW9ucygtKQog
cmVuYW1lIG1ldGEvcmVjaXBlcy1kZXZ0b29scy9weXRob24ve3B5dGhvbjMtdXYtYnVpbGRfMC4x
Mi4yMS5iYiA9PiBweXRob24zLXV2LWJ1aWxkXzAuMTMuMC5iYn0gKDkyJSkKCmRpZmYgLS1naXQg
YS9tZXRhL3JlY2lwZXMtZGV2dG9vbHMvcHl0aG9uL3B5dGhvbjMtdXYtYnVpbGQtY3JhdGVzLmlu
YyBiL21ldGEvcmVjaXBlcy1kZXZ0b29scy9weXRob24vcHl0aG9uMy11di1idWlsZC1jcmF0ZXMu
aW5jCmluZGV4IGEyMTc0NjMxMmUuLjQwMDg3ZDA1NDEgMTAwNjQ0Ci0tLSBhL21ldGEvcmVjaXBl
cy1kZXZ0b29scy9weXRob24vcHl0aG9uMy11di1idWlsZC1jcmF0ZXMuaW5jCisrKyBiL21ldGEv
cmVjaXBlcy1kZXZ0b29scy9weXRob24vcHl0aG9uMy11di1idWlsZC1jcmF0ZXMuaW5jCkBAIC0x
Niw4ICsxNiw4IEBAIFNSQ19VUkkgKz0gIiBcCiAgICAgY3JhdGU6Ly9jcmF0ZXMuaW8vYXJyYXl2
ZWMvMC43LjggXAogICAgIGNyYXRlOi8vY3JhdGVzLmlvL2FzdHJhbC10b2tpby10YXIvMC43LjAg
XAogICAgIGNyYXRlOi8vY3JhdGVzLmlvL2FzdHJhbC12ZXJzaW9uLXJhbmdlcy8wLjIuMiBcCi0g
ICAgY3JhdGU6Ly9jcmF0ZXMuaW8vYXN0cmFsX2FzeW5jX3ppcC8wLjAuMjAgXAotICAgIGNyYXRl
Oi8vY3JhdGVzLmlvL2FzeW5jLWNvbXByZXNzaW9uLzAuNC4xOSBcCisgICAgY3JhdGU6Ly9jcmF0
ZXMuaW8vYXN0cmFsX2FzeW5jX3ppcC8wLjAuMjEgXAorICAgIGNyYXRlOi8vY3JhdGVzLmlvL2Fz
eW5jLWNvbXByZXNzaW9uLzAuNC40NSBcCiAgICAgY3JhdGU6Ly9jcmF0ZXMuaW8vYXV0b2NmZy8x
LjUuMCBcCiAgICAgY3JhdGU6Ly9jcmF0ZXMuaW8vYmFja29uLzEuNi4wIFwKICAgICBjcmF0ZTov
L2NyYXRlcy5pby9iYXNlNjQvMC4yMi4xIFwKQEAgLTMzLDcgKzMzLDYgQEAgU1JDX1VSSSArPSAi
IFwKICAgICBjcmF0ZTovL2NyYXRlcy5pby9ieXRlcy8xLjEyLjEgXAogICAgIGNyYXRlOi8vY3Jh
dGVzLmlvL2NhcC1wcmltaXRpdmVzLzQuMC4zIFwKICAgICBjcmF0ZTovL2NyYXRlcy5pby9jYXAt
c3RkLzQuMC4zIFwKLSAgICBjcmF0ZTovL2NyYXRlcy5pby9jYy8xLjIuNTcgXAogICAgIGNyYXRl
Oi8vY3JhdGVzLmlvL2NmZy1pZi8xLjAuNCBcCiAgICAgY3JhdGU6Ly9jcmF0ZXMuaW8vY2hhcnNl
dC8wLjEuNSBcCiAgICAgY3JhdGU6Ly9jcmF0ZXMuaW8vY2xhcC80LjYuNiBcCkBAIC00MSw2ICs0
MCw4IEBAIFNSQ19VUkkgKz0gIiBcCiAgICAgY3JhdGU6Ly9jcmF0ZXMuaW8vY2xhcF9kZXJpdmUv
NC42LjQgXAogICAgIGNyYXRlOi8vY3JhdGVzLmlvL2NsYXBfbGV4LzEuMS4wIFwKICAgICBjcmF0
ZTovL2NyYXRlcy5pby9jb2xvcmNob2ljZS8xLjAuNSBcCisgICAgY3JhdGU6Ly9jcmF0ZXMuaW8v
Y29tcHJlc3Npb24tY29kZWNzLzAuNC40NSBcCisgICAgY3JhdGU6Ly9jcmF0ZXMuaW8vY29tcHJl
c3Npb24tY29yZS8wLjQuMzMgXAogICAgIGNyYXRlOi8vY3JhdGVzLmlvL2NvbnNvbGUvMC4xNi40
IFwKICAgICBjcmF0ZTovL2NyYXRlcy5pby9jcHVmZWF0dXJlcy8wLjIuMTcgXAogICAgIGNyYXRl
Oi8vY3JhdGVzLmlvL2NwdWZlYXR1cmVzLzAuMy4wIFwKQEAgLTY4LDcgKzY5LDYgQEAgU1JDX1VS
SSArPSAiIFwKICAgICBjcmF0ZTovL2NyYXRlcy5pby9lcmFzZWQtc2VyZGUvMC40LjEwIFwKICAg
ICBjcmF0ZTovL2NyYXRlcy5pby9lcnJuby8wLjMuMTQgXAogICAgIGNyYXRlOi8vY3JhdGVzLmlv
L2Zhc3RyYW5kLzIuNS4wIFwKLSAgICBjcmF0ZTovL2NyYXRlcy5pby9maW5kLW1zdmMtdG9vbHMv
MC4xLjkgXAogICAgIGNyYXRlOi8vY3JhdGVzLmlvL2ZpeGVkYml0c2V0LzAuNS43IFwKICAgICBj
cmF0ZTovL2NyYXRlcy5pby9mbGF0ZTIvMS4xLjEwIFwKICAgICBjcmF0ZTovL2NyYXRlcy5pby9m
b2xkaGFzaC8wLjEuNSBcCkBAIC0xMTgsNyArMTE4LDYgQEAgU1JDX1VSSSArPSAiIFwKICAgICBj
cmF0ZTovL2NyYXRlcy5pby9qaWZmLXN0YXRpYy8wLjIuMzUgXAogICAgIGNyYXRlOi8vY3JhdGVz
LmlvL2ppZmYtdHpkYi8wLjEuOCBcCiAgICAgY3JhdGU6Ly9jcmF0ZXMuaW8vamlmZi10emRiLXBs
YXRmb3JtLzAuMS4zIFwKLSAgICBjcmF0ZTovL2NyYXRlcy5pby9qb2JzZXJ2ZXIvMC4xLjM1IFwK
ICAgICBjcmF0ZTovL2NyYXRlcy5pby9qcy1zeXMvMC4zLjkxIFwKICAgICBjcmF0ZTovL2NyYXRl
cy5pby9qdW5jdGlvbi8yLjAuMCBcCiAgICAgY3JhdGU6Ly9jcmF0ZXMuaW8vbGF6eV9zdGF0aWMv
MS41LjAgXApAQCAtMTUyLDcgKzE1MSw2IEBAIFNSQ19VUkkgKz0gIiBcCiAgICAgY3JhdGU6Ly9j
cmF0ZXMuaW8vcGluLXByb2plY3QvMS4xLjExIFwKICAgICBjcmF0ZTovL2NyYXRlcy5pby9waW4t
cHJvamVjdC1pbnRlcm5hbC8xLjEuMTEgXAogICAgIGNyYXRlOi8vY3JhdGVzLmlvL3Bpbi1wcm9q
ZWN0LWxpdGUvMC4yLjE3IFwKLSAgICBjcmF0ZTovL2NyYXRlcy5pby9wa2ctY29uZmlnLzAuMy4z
MiBcCiAgICAgY3JhdGU6Ly9jcmF0ZXMuaW8vcG9ydGFibGUtYXRvbWljLzEuMTMuMSBcCiAgICAg
Y3JhdGU6Ly9jcmF0ZXMuaW8vcG9ydGFibGUtYXRvbWljLXV0aWwvMC4yLjYgXAogICAgIGNyYXRl
Oi8vY3JhdGVzLmlvL3BvdGVudGlhbF91dGYvMC4xLjQgXApAQCAtMTk2LDEzICsxOTQsMTIgQEAg
U1JDX1VSSSArPSAiIFwKICAgICBjcmF0ZTovL2NyYXRlcy5pby9zaGEyLzAuMTAuOSBcCiAgICAg
Y3JhdGU6Ly9jcmF0ZXMuaW8vc2hhMi8wLjExLjAgXAogICAgIGNyYXRlOi8vY3JhdGVzLmlvL3No
YXJkZWQtc2xhYi8wLjEuNyBcCi0gICAgY3JhdGU6Ly9jcmF0ZXMuaW8vc2hsZXgvMS4zLjAgXAog
ICAgIGNyYXRlOi8vY3JhdGVzLmlvL3NpZ25hbC1ob29rLXJlZ2lzdHJ5LzEuNC44IFwKICAgICBj
cmF0ZTovL2NyYXRlcy5pby9zaW1kLWFkbGVyMzIvMC4zLjggXAogICAgIGNyYXRlOi8vY3JhdGVz
LmlvL3NpbWR1dGY4LzAuMS41IFwKICAgICBjcmF0ZTovL2NyYXRlcy5pby9zaW1pbGFyLzIuNy4w
IFwKICAgICBjcmF0ZTovL2NyYXRlcy5pby9zbGFiLzAuNC4xMiBcCi0gICAgY3JhdGU6Ly9jcmF0
ZXMuaW8vc21hbGx2ZWMvMS4xNS4yIFwKKyAgICBjcmF0ZTovL2NyYXRlcy5pby9zbWFsbHZlYy8x
LjE2LjAgXAogICAgIGNyYXRlOi8vY3JhdGVzLmlvL3NtYXdrLzAuMy4yIFwKICAgICBjcmF0ZTov
L2NyYXRlcy5pby9zb2NrZXQyLzAuNi4zIFwKICAgICBjcmF0ZTovL2NyYXRlcy5pby9zcGR4LzAu
MTMuNSBcCkBAIC0yMTAsNyArMjA3LDcgQEAgU1JDX1VSSSArPSAiIFwKICAgICBjcmF0ZTovL2Ny
YXRlcy5pby9zdHJpcC1hbnNpLWVzY2FwZXMvMC4yLjEgXAogICAgIGNyYXRlOi8vY3JhdGVzLmlv
L3N0cnNpbS8wLjExLjEgXAogICAgIGNyYXRlOi8vY3JhdGVzLmlvL3N5bi8yLjAuMTE4IFwKLSAg
ICBjcmF0ZTovL2NyYXRlcy5pby9zeW4vMy4wLjQgXAorICAgIGNyYXRlOi8vY3JhdGVzLmlvL3N5
bi8zLjAuNSBcCiAgICAgY3JhdGU6Ly9jcmF0ZXMuaW8vc3luc3RydWN0dXJlLzAuMTMuMiBcCiAg
ICAgY3JhdGU6Ly9jcmF0ZXMuaW8vdGFyLWNvZGVjLzAuMC4xNCBcCiAgICAgY3JhdGU6Ly9jcmF0
ZXMuaW8vdGFyLWZyYW1pbmcvMC4wLjE0IFwKQEAgLTMwNiw5ICszMDMsNiBAQCBTUkNfVVJJICs9
ICIgXAogICAgIGNyYXRlOi8vY3JhdGVzLmlvL3plcm92ZWMtZGVyaXZlLzAuMTEuMiBcCiAgICAg
Y3JhdGU6Ly9jcmF0ZXMuaW8vemxpYi1ycy8wLjYuMyBcCiAgICAgY3JhdGU6Ly9jcmF0ZXMuaW8v
em1pai8xLjAuMjEgXAotICAgIGNyYXRlOi8vY3JhdGVzLmlvL3pzdGQvMC4xMy4zIFwKLSAgICBj
cmF0ZTovL2NyYXRlcy5pby96c3RkLXNhZmUvNy4yLjQgXAotICAgIGNyYXRlOi8vY3JhdGVzLmlv
L3pzdGQtc3lzLzIuMC4xNit6c3RkLjEuNS43IFwKICIKIAogU1JDX1VSSVthZGxlcjItMi4wLjEu
c2hhMjU2c3VtXSA9ICIzMjAxMTk1NzlmY2FkOWMyMTg4NGY1YzQ4NjFkMTYxNzRkMGUwNjI1MDYy
NTI2NmY1MGZlNjg5ODM0MGFiZWZhIgpAQCAtMzI1LDggKzMxOSw4IEBAIFNSQ19VUklbYXJjc3Ry
LTEuMi4wLnNoYTI1NnN1bV0gPSAiMDM5MThjM2RiZDc3MDFhODVjNmI5ODg3NzMyZTI5MjExNzVm
MjZjMzUwYjQ1CiBTUkNfVVJJW2FycmF5dmVjLTAuNy44LnNoYTI1NnN1bV0gPSAiZDNmYjY3YTZl
MDhhY2YyNGZkZWNjYmFjMmNiNmFjNDMwNTgyNWJkMWYxMTc0NjJlMGU2ZjJmMTkzMzQ1YWQ1NiIK
IFNSQ19VUklbYXN0cmFsLXRva2lvLXRhci0wLjcuMC5zaGEyNTZzdW1dID0gIjZmMmU5ODliMzMy
NDZmZTkyNDBkMzlhY2NmNGRkOWEwMWUwYjZjMWYzY2U5ZGQwOTVlMGE0N2ZhMDI1MDU1MjMiCiBT
UkNfVVJJW2FzdHJhbC12ZXJzaW9uLXJhbmdlcy0wLjIuMi5zaGEyNTZzdW1dID0gIjgxMTI5ZTE0
M2E3YmNlYTI2M2Q1YTJjNTBiOGJlNDdhYzU4MzY1ZGRlNjE4YmMxYWM1MGY2OWY0OTdjOWNiNjMi
Ci1TUkNfVVJJW2FzdHJhbF9hc3luY196aXAtMC4wLjIwLnNoYTI1NnN1bV0gPSAiYmQ5MzlkNzk5
NTljM2Y0OWE2NDhhMWQ3ODU3ZDYzY2M2MjU0ODcyNWE2YjA2MGI4ZGJmMGVhNWM5MjQ3MGI2MyIK
LVNSQ19VUklbYXN5bmMtY29tcHJlc3Npb24tMC40LjE5LnNoYTI1NnN1bV0gPSAiMDY1NzVlNmE5
NjczNTgwZjUyNjYxYzkyMTA3YmFhYmZmYmY0MWUyMTQxMzczNDQxY2JjZGM0N2NiNzMzMDAzYyIK
K1NSQ19VUklbYXN0cmFsX2FzeW5jX3ppcC0wLjAuMjEuc2hhMjU2c3VtXSA9ICIxM2Y0YTliYzYy
ODlkOTA3YzhlODgzZDI1MDI2YTU0NzUxZDY4NmRhOTkyNmFmMjcxZDBmYzRjYmU1OGE3ZjRkIgor
U1JDX1VSSVthc3luYy1jb21wcmVzc2lvbi0wLjQuNDUuc2hhMjU2c3VtXSA9ICIyNGE4ZWM3M2Vi
ODYyNTA4YjcwNDE3MjNjODkzODYzNjU4OTRiNGU3ZDlmNjk5OGJmMWI4NTI5ZTViMGVlMjU0Igog
U1JDX1VSSVthdXRvY2ZnLTEuNS4wLnNoYTI1NnN1bV0gPSAiYzA4NjA2ZjhjM2NiZjRjZTZlYzhl
MjhmYjAwMTRhMmMwODY3MDhmZTk1NGVhYTg4NTM4NGE2MTY1MTcyZTdlOCIKIFNSQ19VUklbYmFj
a29uLTEuNi4wLnNoYTI1NnN1bV0gPSAiY2ZmYjBlOTMxODc1YjY2NmZjNGZjYjIwZmVlNTJlOWJi
ZDFlZjgzNmZkOWU5ZTA0ZWMyMTU1NWY5Zjg1ZjdlZiIKIFNSQ19VUklbYmFzZTY0LTAuMjIuMS5z
aGEyNTZzdW1dID0gIjcyYjMyNTRmMTYyNTFhODM4MWFhMTJlNDBlM2M0ZDJmMDE5OWY4YzY1MDhm
YmVjYjlkOTFmNTc1ZTBmYmI4YzYiCkBAIC0zNDIsNyArMzM2LDYgQEAgU1JDX1VSSVtieXRlY2hl
Y2tfZGVyaXZlLTAuOC4zLnNoYTI1NnN1bV0gPSAiNDZkMDc5MThjYWE5ZWVhYWYwNmI3ODczOTI1
YzUzYTYxZGEKIFNSQ19VUklbYnl0ZXMtMS4xMi4xLnNoYTI1NnN1bV0gPSAiZmM2NTJhNDhjMzUy
YWVmM2VhM2FlZDMyMDgwNTAxY2YzZWY2ZWQ1ZGE3ODYwMmEwMjBjOTkxNzc1YjBhZmYwNCIKIFNS
Q19VUklbY2FwLXByaW1pdGl2ZXMtNC4wLjMuc2hhMjU2c3VtXSA9ICI4YjVmNzQ3MjlmZDJmNDQ3
MDFkMWE4ZWI0N2U5MDZjZGIzY2NkOWVjMGYwMmJhYWQ4NWE3NDRiNzkxOTQwYjE4IgogU1JDX1VS
SVtjYXAtc3RkLTQuMC4zLnNoYTI1NnN1bV0gPSAiYzFlYzc4ZTI0MmNmYTJjZmUyNzY4MDdhYzJl
Y2MwMDMxNWE2Yzk3Nzg2OTc3NDE0YmNkMWMzOTYzYjZjOTFiOCIKLVNSQ19VUklbY2MtMS4yLjU3
LnNoYTI1NnN1bV0gPSAiN2EwZGQxY2EzODQ5MzJmZjM2NDFjODcxOGEwMjc2OWYxNjk4ZTc1NjNk
YzY5NzRmZmQwMzM0NjExNjMxMDQyMyIKIFNSQ19VUklbY2ZnLWlmLTEuMC40LnNoYTI1NnN1bV0g
PSAiOTMzMGY4YjJmZjEzZjM0NTQwYjQ0ZTk0NmVmMzUxMTE4MjU3MjdiMzhkMzMyODZlZjk4NjE0
MjYxNTEyMTgwMSIKIFNSQ19VUklbY2hhcnNldC0wLjEuNS5zaGEyNTZzdW1dID0gImYxZjkyN2Iw
N2M3NGJhODRjN2U1ZmU0ZGIyYmFlYjNlOTk2YWIyNjg4OTkyZTM5YWM2OGNlMzIyMGE2NzdjN2Ui
CiBTUkNfVVJJW2NsYXAtNC42LjYuc2hhMjU2c3VtXSA9ICI0NzNjN2UwN2Y0MDlhOGQ3NzIxNjE3
MjRhYThkYjZhNzY1YTI1MzJhNzBmOTY2N2VlYjdiNDlkM2QwMmZiZGNhIgpAQCAtMzUwLDYgKzM0
Myw4IEBAIFNSQ19VUklbY2xhcF9idWlsZGVyLTQuNi42LnNoYTI1NnN1bV0gPSAiN2I0OGZlYTVh
ODhlOWFlNzI4YTJkY2JlZGJmYzBlNzMwZjdkNjBkCiBTUkNfVVJJW2NsYXBfZGVyaXZlLTQuNi40
LnNoYTI1NnN1bV0gPSAiZDAxMmQyYjlkNjVhY2E3ZjE4ZjRkOTg3OGEwNDViYzE3ODk5YmJhOTUx
NTYxYmE1ZWMzYzJiYTFlZWQ5YTA2MSIKIFNSQ19VUklbY2xhcF9sZXgtMS4xLjAuc2hhMjU2c3Vt
XSA9ICJjOGQ0YTNiYjhiMWUwYzEwNTA0OTlkMTgxNWY1YWIxNmQwNGYwOTU5YjIzMzA4NWZiMzE2
NTNmYmZjOWQ5OGY5IgogU1JDX1VSSVtjb2xvcmNob2ljZS0xLjAuNS5zaGEyNTZzdW1dID0gIjFk
MDc1NTBjOTAzNmJmMmFlMGM2ODRjNDI5N2Q1MDNmODM4Mjg3YzgzYzUzNjg2ZDA1MzcwZDBlMTM5
YWU1NzAiCitTUkNfVVJJW2NvbXByZXNzaW9uLWNvZGVjcy0wLjQuNDUuc2hhMjU2c3VtXSA9ICI5
OGZjOTg0NjBiYTBhZDUzMTcwNzVkMzYzMmI4ZGZjNDVkMGJlOGM0YTQ5MzQ3YzJhMzgyNzIwMTk3
MTc2MTRhIgorU1JDX1VSSVtjb21wcmVzc2lvbi1jb3JlLTAuNC4zMy5zaGEyNTZzdW1dID0gIjZl
OGNjYzRlYTlmNmFjYzMyZDEwMmMwZjZkNDcxZDExZDkxM2FkMTVmMjBjMDRkZTc0MzM3NDg2MWZh
MWQ0MTQiCiBTUkNfVVJJW2NvbnNvbGUtMC4xNi40LnNoYTI1NnN1bV0gPSAiNGZlNWY0NjVhNGY2
ZmVlODhmYWQ0MWI4NWQ5OTBmODRjODM1MzM1ZTg1YjVkOWU2ZTYzZTBkMDZkMjhjYmE3YyIKIFNS
Q19VUklbY3B1ZmVhdHVyZXMtMC4yLjE3LnNoYTI1NnN1bV0gPSAiNTllZDU4MzhlZWJiMjZhMmJi
MmU1OGY2ZDViNTMxNjk4OWFlOWQwOGJhYjEwZTBlNmQxMDNlNjU2ZDFiMDI4MCIKIFNSQ19VUklb
Y3B1ZmVhdHVyZXMtMC4zLjAuc2hhMjU2c3VtXSA9ICI4YjJhNDEzOTNmNjZmMTZiMDgyM2JiNzkw
OTRkNTRhYzVmYmQzNGFiMjkyZGRhZmI5YTA0NTZhYzlmODdkMjAxIgpAQCAtMzc3LDcgKzM3Miw2
IEBAIFNSQ19VUklbZXF1aXZhbGVudC0xLjAuMi5zaGEyNTZzdW1dID0gIjg3N2E0YWNlODcxM2Iw
YmNmMmE0ZTdlZWM4MjUyOWMwMjlmMWQwNjE5CiBTUkNfVVJJW2VyYXNlZC1zZXJkZS0wLjQuMTAu
c2hhMjU2c3VtXSA9ICJkMmFkZDhhMDdkZDZhOGQ5M2ZmNjI3MDI5YzUxZGUxNDVlMTI2ODZmYmMz
NmVjYjI5OGFjMjJlNzRjZjAyZGVjIgogU1JDX1VSSVtlcnJuby0wLjMuMTQuc2hhMjU2c3VtXSA9
ICIzOWNhYjcxNjE3YWUwZDYzZjUxYTM2ZDY5Zjg2NjM5MTczNWI1MTY5MWRiZGE2M2NmNmY5NmQw
NDJiNjNlZmViIgogU1JDX1VSSVtmYXN0cmFuZC0yLjUuMC5zaGEyNTZzdW1dID0gImRhN2M2MmNl
YWUyMDdkZDM3ZWE1Yjg0NWRhNmEwNjk2Yzc5OWY4NWU5N2RhMWFiNWI3OTEwYmUzYzFjODAyMjMi
Ci1TUkNfVVJJW2ZpbmQtbXN2Yy10b29scy0wLjEuOS5zaGEyNTZzdW1dID0gIjViYWViYzA3NzQx
NTFmOTA1YTFhMmNjNDE5ODkzMDBiMWU2ZmJiMjlhZmYwY2VmZmExMDY0ZmRkMzA4OGQ1ODIiCiBT
UkNfVVJJW2ZpeGVkYml0c2V0LTAuNS43LnNoYTI1NnN1bV0gPSAiMWQ2NzRlODEzOTFkMWUxYWI2
ODFhMjhkOTlkZjA3OTI3YzZkNGFhNWIwMjdkN2RhMTZiYTMyZDFkMjFlY2Q5OSIKIFNSQ19VUklb
ZmxhdGUyLTEuMS4xMC5zaGEyNTZzdW1dID0gIjZlNjM0ZTJlMGViYWMxZWUwMzQwMjBkYTFjYTU4
MmUxN2ZmZTRlMGY1ZTk4NTgyMzcyMWUxNjg5MjgxMzZkY2IiCiBTUkNfVVJJW2ZvbGRoYXNoLTAu
MS41LnNoYTI1NnN1bV0gPSAiZDljNGY1ZGFjNWUxNWMyNGViOTk5YzI2MTgxYTZjYTQwYjM5ZmU5
NDZjYmU0YzI2M2M3MjA5NDY3YmM4M2FmMiIKQEAgLTQyNyw3ICs0MjEsNiBAQCBTUkNfVVJJW2pp
ZmYtY29yZS0wLjEuMC5zaGEyNTZzdW1dID0gIjdmZWNhODg0MzllZmU1M2RhMzc1NDUwMGMxODUx
ZGVkZjNjYjM2YzUyNAogU1JDX1VSSVtqaWZmLXN0YXRpYy0wLjIuMzUuc2hhMjU2c3VtXSA9ICIz
YTY5ZGNiM2EyMWNmYjMyY2UxY2QwNTYxNjkzMzdjYTI4NGFmMDc2NmRkNzY2ZTc4Nzg4MTliMjUx
YTQ5MjA0IgogU1JDX1VSSVtqaWZmLXR6ZGItMC4xLjguc2hhMjU2c3VtXSA9ICIxNDJiZDM5OTMy
YWQyMzFmMTA1MTNkZjlhYjYyNjYxZmVhZDg3MTk4NzIxNTBiN2FkMDJhMmRmNzlmNGUxNDFlIgog
U1JDX1VSSVtqaWZmLXR6ZGItcGxhdGZvcm0tMC4xLjMuc2hhMjU2c3VtXSA9ICI4NzVhNWE2OWFj
MmJhYjFhODkxNzExY2Y1ZWNjYmVjMWNlMDM0MWVhODA1NTYwZGNkOTBiN2EyZTkyNTEzMmU4Igot
U1JDX1VSSVtqb2JzZXJ2ZXItMC4xLjM1LnNoYTI1NnN1bV0gPSAiMWMwMGFjYmQyOWVhYmFkNGEy
MzkyZmEwZTkyMWM4NzQ5MzRkYmJmNDE5NDMxMmFkMjBmMDRhMGVkNjdhM2NiMyIKIFNSQ19VUklb
anMtc3lzLTAuMy45MS5zaGEyNTZzdW1dID0gImI0OTcxNWI3MDczZjM4NWJhNGJjNTI4ZTU3NDdk
MDJlNjZjYjM5YzYxNDZlZmI2NmI3ODFmMTMxZjBmYjM5OWMiCiBTUkNfVVJJW2p1bmN0aW9uLTIu
MC4wLnNoYTI1NnN1bV0gPSAiMTYwZjJlYWRlMDk3ZjMwMjYzYjU0OGFhZTVkZWIxMmFkMzQ5Yzkw
OWJhYTcxMGZhMjRiOTJjOTA5MGIyZTAwNiIKIFNSQ19VUklbbGF6eV9zdGF0aWMtMS41LjAuc2hh
MjU2c3VtXSA9ICJiYmQyYmNiNGM5NjNmMmRkYWUwNmEyZWZjN2U5ZjM1OTEzMTI0NzNjNTBjNjY4
NWUxZjI5ODA2ODMxNmU2NmZlIgpAQCAtNDYxLDcgKzQ1NCw2IEBAIFNSQ19VUklbcGV0Z3JhcGgt
MC44LjMuc2hhMjU2c3VtXSA9ICI4NzAxYjU4ZWE5NzA2MGQ1ZTViMTU1ZDM4M2E2OTk1MmE2MDk0
M2YwZTZkCiBTUkNfVVJJW3Bpbi1wcm9qZWN0LTEuMS4xMS5zaGEyNTZzdW1dID0gImYxNzQ5Yzdl
ZDRiY2FmNGMzZDBhM2VmYzI4NTM4ODQ0ZmIyOWJjZGQ3ZDJiNjdiMmJlN2UyMGJhODYxZmY1MTci
CiBTUkNfVVJJW3Bpbi1wcm9qZWN0LWludGVybmFsLTEuMS4xMS5zaGEyNTZzdW1dID0gImQ5YjIw
ZWQzMGYxMDUzOTk3NzZiOWM4ODNlNjhlNTM2ZWY2MDJhMTZhZTZmNTk2ZDJjNDczNTkxZDZhZDY0
YzYiCiBTUkNfVVJJW3Bpbi1wcm9qZWN0LWxpdGUtMC4yLjE3LnNoYTI1NnN1bV0gPSAiYTg5MzIy
ZGY5ZWJlMWMxNTc4ZDY4OWM5MjMxOGUwNzA5NjdkMTA0MmI1MTJhZmJlNDk1MTg3MjNmNGU2ZDVj
ZCIKLVNSQ19VUklbcGtnLWNvbmZpZy0wLjMuMzIuc2hhMjU2c3VtXSA9ICI3ZWRkZGJkMGI1MmQ3
MzJiMjFhZDlhNWZhYjVjNzA0YzE0Y2Q5NDllNWU5YTFlYzU5MjlhMjRmZGVkMWI5MDRjIgogU1JD
X1VSSVtwb3J0YWJsZS1hdG9taWMtMS4xMy4xLnNoYTI1NnN1bV0gPSAiYzMzYTk0NzE4OTZmMWM2
OWNlY2VmOGQyMGNiZTJmN2FjY2QxMjUyN2NlNjA4NDVmZjQ0YzE1M2JiMmEyMWI0OSIKIFNSQ19V
UklbcG9ydGFibGUtYXRvbWljLXV0aWwtMC4yLjYuc2hhMjU2c3VtXSA9ICIwOTEzOTdiZTYxYTAx
ZDRiZTU4ZTc4NDE1OTViZDRiZmVkYjE1ZjFjZDU0OTc3ZDc5YjgyNzFlOTRlZDc5OWEzIgogU1JD
X1VSSVtwb3RlbnRpYWxfdXRmLTAuMS40LnNoYTI1NnN1bV0gPSAiYjczOTQ5NDMyZjVlMmEwOTY1
NzAwM2MyNWJjYTVlMTlhMGU5Yzg0ZjgwNThjYTM3NGY0OWUwZWJlNjA1YWY3NyIKQEAgLTUwNSwx
MyArNDk3LDEyIEBAIFNSQ19VUklbc2VyZGVfc3Bhbm5lZC0xLjEuMS5zaGEyNTZzdW1dID0gIjY2
NjJiNTg3OTUxMWUwNmU4OTk5YThhMjM1ZDg0ODExM2U5NDJjCiBTUkNfVVJJW3NoYTItMC4xMC45
LnNoYTI1NnN1bV0gPSAiYTc1MDdkODE5NzY5ZDAxYTM2NWFiNzA3Nzk0YTQwODQzOTJjODI0ZjU0
YTdhNmE3ODYyZjhjM2QwODkyYjI4MyIKIFNSQ19VUklbc2hhMi0wLjExLjAuc2hhMjU2c3VtXSA9
ICI0NDZiYTcxNzUwOTUyNGNiM2YyMmYxN2VjYzA5NmYxMGY0ODIyZDc2YWI1YzBiOTgyMmM1Zjlj
Mjg0ZTgyNWY0IgogU1JDX1VSSVtzaGFyZGVkLXNsYWItMC4xLjcuc2hhMjU2c3VtXSA9ICJmNDBj
YTNjNDY4MjM3MTNlMGQ0MjA5NTkyZThkNmU4MjZhYTU3ZTkyOGYwOTc1MjYxOWZjNjk2YzQ5OTYz
N2Y2IgotU1JDX1VSSVtzaGxleC0xLjMuMC5zaGEyNTZzdW1dID0gIjBmZGEyZmYwZDA4NDAxOWJh
NGQ3YzZmMzcxYzk1ZDhmZDc1Y2UzNTI0YzNjYjhmYjY1M2EzMDIzZjYzMjNlNjQiCiBTUkNfVVJJ
W3NpZ25hbC1ob29rLXJlZ2lzdHJ5LTEuNC44LnNoYTI1NnN1bV0gPSAiYzRkYjY5Y2JhMTExMGFm
ZmMwZTlmN2JjZDQ4YmJmODdiM2Y0ZmM3YzYxZmM5MTU1YWZkNGM0NjllYjNkNmMxYiIKIFNSQ19V
Uklbc2ltZC1hZGxlcjMyLTAuMy44LnNoYTI1NnN1bV0gPSAiZTMyMGE2YzVhZDMxZDI3MWFkNTIz
ZGNmM2FkMTNlMjc2N2FkOGIxY2I4ZjA0N2Y3NWE4YWVhZjhkYTEzOWRhMiIKIFNSQ19VUklbc2lt
ZHV0ZjgtMC4xLjUuc2hhMjU2c3VtXSA9ICJlM2E5ZmUzNGUzZTdhNTAzMTYwNjAzNTFmMzcxODdh
M2Y1NDZiY2U5NTQ5NjE1Njc1NGI2MDFhNWZhNzFiNzZlIgogU1JDX1VSSVtzaW1pbGFyLTIuNy4w
LnNoYTI1NnN1bV0gPSAiYmJiYjVkOTY1OTE0MTY0NmFlNjQ3YjQyZmUwOTRkYWY2YzYxOTJkMTYy
MDg3MGI0NDlkOTU1N2Y3NDhiMmRhYSIKIFNSQ19VUklbc2xhYi0wLjQuMTIuc2hhMjU2c3VtXSA9
ICIwYzc5MGRlMjMxMjRmOWFiNDQ1NDRkN2FjMDVkNjA0NDBhZGM1ODY0NzljZTUwMWMxZDZkN2Rh
M2NkOGM5Y2Y1IgotU1JDX1VSSVtzbWFsbHZlYy0xLjE1LjIuc2hhMjU2c3VtXSA9ICI4ZWQ2YTYz
ZjAyYzg1MzljOTFhODY4NWE4NmY0MDk5NjYxYmEzZGEwMTc5MzJmNmViYmVhNmRlM2YwZmE3Yzkw
IgorU1JDX1VSSVtzbWFsbHZlYy0xLjE2LjAuc2hhMjU2c3VtXSA9ICJiOWJlNDJmNTBhYTg2MWM1
NTU2NTRhYTNhMzdmNTJmNGIxMDc0YmFjZjRlNDhmZTBlZjdmYTU4NGU4MGYxZjBmIgogU1JDX1VS
SVtzbWF3ay0wLjMuMi5zaGEyNTZzdW1dID0gImI3YzM4OGMxYjVlOTM3NTZkMGM3NDA5NjVjNDFl
ODgyMmY4NjY2MjFkNDFhY2JkZjYzMzZhNmExNjhmODg0MGMiCiBTUkNfVVJJW3NvY2tldDItMC42
LjMuc2hhMjU2c3VtXSA9ICIzYTc2NmUxMTEwNzg4YzM2ZjRmYTFjMmI3MWIzODdhNzgxNWFhNjVm
ODhjZTAyMjk4NDE4MjY2MzNkOTM3MjNlIgogU1JDX1VSSVtzcGR4LTAuMTMuNS5zaGEyNTZzdW1d
ID0gIjA4MTY3MGMyMzNkZmJlZDU1NjkwY2MwY2QzODQyNGUwZTI0YWMxYjI2NzNkMGI0MDhiM2Y3
YjY4NDczOGRmYTkiCkBAIC01MTksNyArNTEwLDcgQEAgU1JDX1VSSVtzdGFibGVfZGVyZWZfdHJh
aXQtMS4yLjEuc2hhMjU2c3VtXSA9ICI2Y2UyYmU4ZGMyNTQ1NWUxZjkxZGY3MWJmYTEyYWQzN2QK
IFNSQ19VUklbc3RyaXAtYW5zaS1lc2NhcGVzLTAuMi4xLnNoYTI1NnN1bV0gPSAiMmE4ZjgwMzhl
N2U3OTY5YWJiM2YxYjdjMmE4MTEyMjVlOTI5NmRhMjA4NTM5ZTBmNzljNTI1MWQ2Y2FjMDAyNSIK
IFNSQ19VUklbc3Ryc2ltLTAuMTEuMS5zaGEyNTZzdW1dID0gIjdkYThiNTczNjg0NWQ5ZjJmY2I4
MzdlYTVkOWUyNjI4NTY0YjNiMDQzYTcwOTQ4YTNmMGI3Nzg4MzhjNWZiNGYiCiBTUkNfVVJJW3N5
bi0yLjAuMTE4LnNoYTI1NnN1bV0gPSAiMWI5YWU1N2Y5MDQyMTNlYmI2NDljZTY4OTViOGE2NmM2
NmYwMjAzYjkzMTk3MThmNjlhNTYxMmEwNjViMTQyMiIKLVNSQ19VUklbc3luLTMuMC40LnNoYTI1
NnN1bV0gPSAiZTYyNzVjZGRmNDYxMGQxNzc1ZTZkMWZlOTQ2OWIyZTc3ZDBmMzlmZDk4ZmI3NDUw
OTAxYjgyMWUwYzUzNjQ5ZiIKK1NSQ19VUklbc3luLTMuMC41LnNoYTI1NnN1bV0gPSAiMTJkZjJl
MDExMGY2NWI3NzVmNzY5YmIxN2VmOTg5MDY3YTFkOTMxYjJlYjgyMmJkNDM0NjYzMWVlYWRhODlm
OSIKIFNSQ19VUklbc3luc3RydWN0dXJlLTAuMTMuMi5zaGEyNTZzdW1dID0gIjcyOGE3MGYzZGJh
ZjViYWI3ZjBjNGIxYWM4ZDdhZTVlYTYwYTRiNTU0OWM4YTU5MTQzNjFjOTkxNDdhNzA5ZDIiCiBT
UkNfVVJJW3Rhci1jb2RlYy0wLjAuMTQuc2hhMjU2c3VtXSA9ICI3ZWE0MmViMTQ0ZDMwZmNiZjMy
YzI2ZGZlYTg5NTkxNzViYjgzMzViZmI3YjE4ZDIwYzZlZDMyZWRlY2YwNTUxIgogU1JDX1VSSVt0
YXItZnJhbWluZy0wLjAuMTQuc2hhMjU2c3VtXSA9ICI3ODMyMjNhN2E2NTkwYmU0MjI3Y2I4MjFl
N2NlODAzNzI1NzU1MTFmNjdjODI0OTIxYWJhMDc1MmQ4YWQ1NTczIgpAQCAtNjE1LDYgKzYwNiwz
IEBAIFNSQ19VUklbemVyb3ZlYy0wLjExLjUuc2hhMjU2c3VtXSA9ICI2YzI4NzE5Mjk0ODI5NDc3
ZjUyNWJlMDE4NmQxM2VmYTlhM2M2MDJmN2VjCiBTUkNfVVJJW3plcm92ZWMtZGVyaXZlLTAuMTEu
Mi5zaGEyNTZzdW1dID0gImVhZGNlMzk1MzljYTVjYjM5ODU1OTAxMDI2NzFmMjU2N2U2NTlmY2E5
NjY2NTgxYWQzNDExZDU5MjA3OTUxZjMiCiBTUkNfVVJJW3psaWItcnMtMC42LjMuc2hhMjU2c3Vt
XSA9ICIzYmUzZDQwZTQwYTEzM2Y5YzkxNmVlM2Y5ZjRmYTJkOWQ2MzQzNWI1ZmJlMWJmYzZkOWRh
ZTBhYTBhZGExNTEzIgogU1JDX1VSSVt6bWlqLTEuMC4yMS5zaGEyNTZzdW1dID0gImI4ODQ4ZWU2
N2VjYzhhZWRiYWYzZTQxMjIyMTdhZmY4OTI2MzkyMzFiZWZjNmExYjU4ZDI5ZmZmNGMyY2FiYWEi
Ci1TUkNfVVJJW3pzdGQtMC4xMy4zLnNoYTI1NnN1bV0gPSAiZTkxZWUzMTFhNTY5YzMyNzE3MTY1
MTU2NmUwNzk3MjIwMGU3NmZjZmUyMjQyYTRmYTQ0NjE0OWEzODgxYzA4YSIKLVNSQ19VUklbenN0
ZC1zYWZlLTcuMi40LnNoYTI1NnN1bV0gPSAiOGY0OWM0ZDVmMGFiYjYwMmE5M2ZiODczNmFmMmE0
ZjRkZDk1MTJlMzZmN2Y1NzBkNjZlNjVmZjg2N2VkM2I5ZCIKLVNSQ19VUklbenN0ZC1zeXMtMi4w
LjE2K3pzdGQuMS41Ljcuc2hhMjU2c3VtXSA9ICI5MWUxOWViYzJhZGM4ZjgzZTQzMDM5ZTc5Nzc2
ZTNmZGE4Y2E5MTkxMzJkNjhhMWZlZDZhNWZhY2EyNjgzNzQ4IgpkaWZmIC0tZ2l0IGEvbWV0YS9y
ZWNpcGVzLWRldnRvb2xzL3B5dGhvbi9weXRob24zLXV2LWJ1aWxkXzAuMTIuMjEuYmIgYi9tZXRh
L3JlY2lwZXMtZGV2dG9vbHMvcHl0aG9uL3B5dGhvbjMtdXYtYnVpbGRfMC4xMy4wLmJiCnNpbWls
YXJpdHkgaW5kZXggOTIlCnJlbmFtZSBmcm9tIG1ldGEvcmVjaXBlcy1kZXZ0b29scy9weXRob24v
cHl0aG9uMy11di1idWlsZF8wLjEyLjIxLmJiCnJlbmFtZSB0byBtZXRhL3JlY2lwZXMtZGV2dG9v
bHMvcHl0aG9uL3B5dGhvbjMtdXYtYnVpbGRfMC4xMy4wLmJiCmluZGV4IGMyODA4MjAzZjkuLjJh
ZDM4YjIwNTQgMTAwNjQ0Ci0tLSBhL21ldGEvcmVjaXBlcy1kZXZ0b29scy9weXRob24vcHl0aG9u
My11di1idWlsZF8wLjEyLjIxLmJiCisrKyBiL21ldGEvcmVjaXBlcy1kZXZ0b29scy9weXRob24v
cHl0aG9uMy11di1idWlsZF8wLjEzLjAuYmIKQEAgLTExLDcgKzExLDcgQEAgTElDX0ZJTEVTX0NI
S1NVTSA9ICJmaWxlOi8vTElDRU5TRS1BUEFDSEU7bWQ1PTg2ZDNmM2E5NWMzMjRjOTQ3OWJkODk4
Njk2OGY0MzI3IFwKICAgICAgICAgICAgICAgICAgICAgZmlsZTovL2NyYXRlcy91di1wZXA1MDgv
TGljZW5zZS1BcGFjaGU7bWQ1PWUyM2ZhZGQ2Y2VlZjhjNjE4ZmMxYzY1MTkxZDg0NmZhIFwKICAg
ICAgICAgICAgICAgICAgICAgZmlsZTovL2NyYXRlcy91di1wZXA1MDgvTGljZW5zZS1CU0Q7bWQ1
PWVmN2E2MDI3ZGM0YzIzODliOWFmYWQ3ZTY5MDI3NGM3IgogCi1TUkNfVVJJW3NoYTI1NnN1bV0g
PSAiNjE2ZDFlY2NjY2EzMDBiMjQwZTY1YTg4NjQ0ZjhjMjk5NmI4NThmZjAzOWY3NTlkNzE3MjQ5
ZDI4Zjk0YTJhNiIKK1NSQ19VUklbc2hhMjU2c3VtXSA9ICJiZDI2MTRmMjRhNThkY2NkNDg2NWQ0
Zjg2ZGRkOTFkZDAxZmQwZWZhYjQ2MzJlMDMzMTg2YTg0MjNiOGEzNTE1IgogCiByZXF1aXJlICR7
QlBOfS1jcmF0ZXMuaW5jCiAKLS0gCjIuNDcuMQoK

--===============4844468677958449083==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: attachment; filename="buildhistory-diff.txt"

packages/x86-64-v3-poky-linux/python3-uv-build/python3-uv-build-dbg: RRECOMMENDS: removed "libzstd-dbg"
packages/x86-64-v3-poky-linux/python3-uv-build/python3-uv-build-dev: RRECOMMENDS: removed "libzstd-dev"
packages/x86-64-v3-poky-linux/python3-uv-build/python3-uv-build: FILELIST: directory renamed /usr/lib/python3.14/site-packages/uv_build-0.12.21.dist-info -> /usr/lib/python3.14/site-packages/uv_build-0.13.0.dist-info, directory renamed /usr/lib/python3.14/site-packages/uv_build-0.12.21.dist-info/licenses -> /usr/lib/python3.14/site-packages/uv_build-0.13.0.dist-info/licenses
packages/x86-64-v3-poky-linux/python3-uv-build/python3-uv-build: RDEPENDS: removed "libzstd (['>= 1.5.7'])"
Changes to packages/x86-64-v3-poky-linux/python3-uv-build (sysroot):
  /usr/lib/python3.14/site-packages/uv_build-0.13.0.dist-info was added
  /usr/lib/python3.14/site-packages/uv_build-0.13.0.dist-info/licenses was added
  /usr/lib/python3.14/site-packages/uv_build-0.13.0.dist-info/licenses/LICENSE-APACHE was added
  /usr/lib/python3.14/site-packages/uv_build-0.13.0.dist-info/licenses/LICENSE-MIT was added
  /usr/lib/python3.14/site-packages/uv_build-0.13.0.dist-info/METADATA was added
  /usr/lib/python3.14/site-packages/uv_build-0.13.0.dist-info/WHEEL was added
  /usr/lib/python3.14/site-packages/uv_build-0.12.21.dist-info was removed
  /usr/lib/python3.14/site-packages/uv_build-0.12.21.dist-info/licenses was removed
  /usr/lib/python3.14/site-packages/uv_build-0.12.21.dist-info/licenses/LICENSE-APACHE was removed
  /usr/lib/python3.14/site-packages/uv_build-0.12.21.dist-info/licenses/LICENSE-MIT was removed
  /usr/lib/python3.14/site-packages/uv_build-0.12.21.dist-info/METADATA was removed
  /usr/lib/python3.14/site-packages/uv_build-0.12.21.dist-info/WHEEL was removed

--===============4844468677958449083==--

