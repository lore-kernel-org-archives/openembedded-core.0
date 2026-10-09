Return-Path: <auh@yoctoproject.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id AD934CA601E
	for <webhook@archiver.kernel.org>; Fri,  9 Oct 2026 06:50:24 +0000 (UTC)
Received: from a27-29.smtp-out.us-west-2.amazonses.com (a27-29.smtp-out.us-west-2.amazonses.com [54.240.27.29])
 by mx.groups.io with SMTP id smtpd.msgproc02-g2.2262.1791528620731910279
 for <openembedded-core@lists.openembedded.org>;
 Thu, 08 Oct 2026 23:50:20 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@yoctoproject.org header.s=lvjh2tk576v2ro5mi6k4dt3mc6wpqbky header.b=PTWFgbid;
 dkim=pass header.i=@amazonses.com header.s=hsbnp7p3ensaochzwyq5wwmceodymuwv header.b=BPYSG4Q2;
 spf=pass (domain: us-west-2.amazonses.com, ip: 54.240.27.29, mailfrom: 010101a11f6d4eb7-89848a06-eb55-4c7a-bb89-b4280592117a-000000@us-west-2.amazonses.com)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/simple;
	s=lvjh2tk576v2ro5mi6k4dt3mc6wpqbky; d=yoctoproject.org;
	t=1791528619;
	h=Content-Type:MIME-Version:From:To:Cc:Subject:Message-Id:Date;
	bh=3RxJgXJar8JdfoSiNjDKA2Y60Jm7bsUK7+2gHU4KEV0=;
	b=PTWFgbidvF3Hmq8mxxhdVRvZDS//D7P6heOidHwFUkQzGfAB4FAhWf2amstpVAPN
	fazh5S+fdjT1pSMRNeMZ5szrZ0pgJ2s2PKQ7GBVJKg4zJQKpLTJHmo8TQy0UfZRQHii
	J5DE6yg5SQtBYuEp2uViiEj/175t7QZltPwiPbXI=
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/simple;
	s=hsbnp7p3ensaochzwyq5wwmceodymuwv; d=amazonses.com; t=1791528619;
	h=Content-Type:MIME-Version:From:To:Cc:Subject:Message-Id:Date:Feedback-ID;
	bh=3RxJgXJar8JdfoSiNjDKA2Y60Jm7bsUK7+2gHU4KEV0=;
	b=BPYSG4Q2QziZIaWwRopEcfZgPbC0C5locNFvMg4GyosPYYIofRodBrWq4h/afoTX
	AvUOSSAuE48FvOW/zr8FFxEHBKzDCY7OSwq0wMnc5pHeKHPUB+hDGw/pLU4iHdOgjXZ
	VGczTCA2uUHWC1/nlyuwnxqXaHSs1tBpGnFcOgOs=
Content-Type: multipart/mixed; boundary="===============1380989050488275645=="
MIME-Version: 1.0
From: auh@yoctoproject.org
To: Trevor Gamblin <tgamblin@baylibre.com>
Cc: openembedded-core@lists.openembedded.org
Subject: [AUH] python3-uv-build: upgrading to 0.12.24 SUCCEEDED
Message-ID: <010101a11f6d4eb7-89848a06-eb55-4c7a-bb89-b4280592117a-000000@us-west-2.amazonses.com>
Date: Fri, 9 Oct 2026 06:50:19 +0000
Feedback-ID: ::1.us-west-2.9np3MYPs3fEaOBysGKSlUD4KtcmPijcmS9Az2Hwf7iQ=:AmazonSES
X-SES-Outgoing: 2026.10.09-54.240.27.29
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Fri, 09 Oct 2026 06:50:24 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/247460

--===============1380989050488275645==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit

Hello,

this email is a notification from the Auto Upgrade Helper
that the automatic attempt to upgrade the recipe(s) *python3-uv-build* to *0.12.24* has Succeeded.

Next steps:
    - apply the patch: git am 0001-python3-uv-build-upgrade-0.12.21-0.12.24.patch
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
From a286612e23836454228cedb440594167e448a21e Mon Sep 17 00:00:00 2001
From: Upgrade Helper <auh@yoctoproject.org>
Date: Fri, 9 Oct 2026 05:58:02 +0000
Subject: [PATCH] python3-uv-build: upgrade 0.12.21 -> 0.12.24

---
 .../python/python3-uv-build-crates.inc        | 36 +++++++------------
 ...0.12.21.bb => python3-uv-build_0.12.24.bb} |  2 +-
 2 files changed, 13 insertions(+), 25 deletions(-)
 rename meta/recipes-devtools/python/{python3-uv-build_0.12.21.bb => python3-uv-build_0.12.24.bb} (92%)

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
diff --git a/meta/recipes-devtools/python/python3-uv-build_0.12.21.bb b/meta/recipes-devtools/python/python3-uv-build_0.12.24.bb
similarity index 92%
rename from meta/recipes-devtools/python/python3-uv-build_0.12.21.bb
rename to meta/recipes-devtools/python/python3-uv-build_0.12.24.bb
index c2808203f9..4716c6643e 100644
--- a/meta/recipes-devtools/python/python3-uv-build_0.12.21.bb
+++ b/meta/recipes-devtools/python/python3-uv-build_0.12.24.bb
@@ -11,7 +11,7 @@ LIC_FILES_CHKSUM = "file://LICENSE-APACHE;md5=86d3f3a95c324c9479bd8986968f4327 \
                     file://crates/uv-pep508/License-Apache;md5=e23fadd6ceef8c618fc1c65191d846fa \
                     file://crates/uv-pep508/License-BSD;md5=ef7a6027dc4c2389b9afad7e690274c7"
 
-SRC_URI[sha256sum] = "616d1ecccca300b240e65a88644f8c2996b858ff039f759d717249d28f94a2a6"
+SRC_URI[sha256sum] = "7f67b18a83af209b66b1ec3d6ed565406dab2ebfee7bbe3598b541e7d39a5e5a"
 
 require ${BPN}-crates.inc
 
-- 
2.47.1


--===============1380989050488275645==
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
 crates.io/zerocopy/0.8.56 crate://crates.io/zerocopy-derive/0.8.56 crate://crates.io/zerofrom/0.1.6 crate://crates.io/zerofrom-derive/0.1.6 crate://crates.io/zerotrie/0.2.3 crate://crates.io/zerovec/0.11.5 crate://crates.io/zerovec-derive/0.11.2 crate://crates.io/zlib-rs/0.6.3 crate://crates.io/zmij/1.0.21 crate://crates.io/zstd/0.13.3 crate://crates.io/zstd-safe/7.2.4 crate://crates.io/zstd-sys/2.0.16+zstd.1.5.7" to "https://files.pythonhosted.org/packages/source/u/uv_build/uv_build-0.12.24.tar.gz crate://crates.io/adler2/2.0.1 crate://crates.io/aho-corasick/1.1.4 crate://crates.io/ambient-authority/0.0.2 crate://crates.io/anstream/1.0.0 crate://crates.io/anstyle/1.0.14 crate://crates.io/anstyle-parse/1.0.0 crate://crates.io/anstyle-query/1.1.5 crate://crates.io/anstyle-wincon/3.0.11 crate://crates.io/anyhow/1.0.104 crate://crates.io/archive-trait/0.0.14 crate://crates.io/arcstr/1.2.0 crate://crates.io/arrayvec/0.7.8 crate://crates.io/astral-tokio-tar/0.7.0 crate://crates.io/astral
 -version-ranges/0.2.2 crate://crates.io/astral_async_zip/0.0.21 crate://crates.io/async-compression/0.4.45 crate://crates.io/autocfg/1.5.0 crate://crates.io/backon/1.6.0 crate://crates.io/base64/0.22.1 crate://crates.io/bitflags/1.3.2 crate://crates.io/bitflags/2.13.1 crate://crates.io/block-buffer/0.10.4 crate://crates.io/block-buffer/0.12.1 crate://crates.io/boxcar/0.2.14 crate://crates.io/bstr/1.12.1 crate://crates.io/bumpalo/3.20.2 crate://crates.io/bytecheck/0.8.3 crate://crates.io/bytecheck_derive/0.8.3 crate://crates.io/bytes/1.12.1 crate://crates.io/cap-primitives/4.0.3 crate://crates.io/cap-std/4.0.3 crate://crates.io/cfg-if/1.0.4 crate://crates.io/charset/0.1.5 crate://crates.io/clap/4.6.6 crate://crates.io/clap_builder/4.6.6 crate://crates.io/clap_derive/4.6.4 crate://crates.io/clap_lex/1.1.0 crate://crates.io/colorchoice/1.0.5 crate://crates.io/compression-codecs/0.4.45 crate://crates.io/compression-core/0.4.33 crate://crates.io/console/0.16.4 crate://crates.io/cpufeatur
 es/0.2.17 crate://crates.io/cpufeatures/0.3.0 crate://crates.io/crc32fast/1.5.0 crate://crates.io/crypto-common/0.1.7 crate://crates.io/crypto-common/0.2.2 crate://crates.io/csv/1.4.0 crate://crates.io/csv-core/0.1.13 crate://crates.io/data-encoding/2.11.1 crate://crates.io/defmt/1.1.0 crate://crates.io/defmt-macros/1.1.0 crate://crates.io/defmt-parser/1.0.0 crate://crates.io/digest/0.10.7 crate://crates.io/digest/0.11.3 crate://crates.io/displaydoc/0.2.5 crate://crates.io/dunce/1.0.5 crate://crates.io/dyn-clone/1.0.20 crate://crates.io/either/1.18.0 crate://crates.io/encode_unicode/1.0.0 crate://crates.io/encoding_rs/0.8.35 crate://crates.io/encoding_rs_io/0.1.8 crate://crates.io/enumflags2/0.7.12 crate://crates.io/enumflags2_derive/0.7.12 crate://crates.io/equivalent/1.0.2 crate://crates.io/erased-serde/0.4.10 crate://crates.io/errno/0.3.14 crate://crates.io/fastrand/2.5.0 crate://crates.io/fixedbitset/0.5.7 crate://crates.io/flate2/1.1.10 crate://crates.io/foldhash/0.1.5 crate://
 crates.io/foldhash/0.2.0 crate://crates.io/form_urlencoded/1.2.2 crate://crates.io/fs-err/3.3.1 crate://crates.io/fs-set-times/0.20.3 crate://crates.io/futures/0.3.34 crate://crates.io/futures-channel/0.3.34 crate://crates.io/futures-core/0.3.34 crate://crates.io/futures-executor/0.3.34 crate://crates.io/futures-io/0.3.34 crate://crates.io/futures-lite/2.6.1 crate://crates.io/futures-macro/0.3.34 crate://crates.io/futures-sink/0.3.34 crate://crates.io/futures-task/0.3.34 crate://crates.io/futures-util/0.3.34 crate://crates.io/generic-array/0.14.7 crate://crates.io/getrandom/0.4.3 crate://crates.io/globset/0.4.20 crate://crates.io/hashbrown/0.15.5 crate://crates.io/hashbrown/0.17.1 crate://crates.io/heck/0.5.0 crate://crates.io/hex/0.4.3 crate://crates.io/hybrid-array/0.4.13 crate://crates.io/icu_collections/2.1.1 crate://crates.io/icu_locale_core/2.1.1 crate://crates.io/icu_normalizer/2.1.1 crate://crates.io/icu_normalizer_data/2.1.1 crate://crates.io/icu_properties/2.1.2 crate://cr
 ates.io/icu_properties_data/2.1.2 crate://crates.io/icu_provider/2.1.1 crate://crates.io/idna/1.1.0 crate://crates.io/idna_adapter/1.2.1 crate://crates.io/indexmap/2.14.1 crate://crates.io/indoc/2.0.7 crate://crates.io/insta/1.48.0 crate://crates.io/io-extras/0.19.0 crate://crates.io/io-lifetimes/2.0.4 crate://crates.io/io-lifetimes/3.0.1 crate://crates.io/ipnet/2.12.0 crate://crates.io/is_terminal_polyfill/1.70.2 crate://crates.io/itertools/0.14.0 crate://crates.io/itoa/1.0.17 crate://crates.io/jiff/0.2.35 crate://crates.io/jiff-core/0.1.0 crate://crates.io/jiff-static/0.2.35 crate://crates.io/jiff-tzdb/0.1.8 crate://crates.io/jiff-tzdb-platform/0.1.3 crate://crates.io/js-sys/0.3.91 crate://crates.io/junction/2.0.0 crate://crates.io/lazy_static/1.5.0 crate://crates.io/libc/0.2.189 crate://crates.io/linux-raw-sys/0.12.1 crate://crates.io/litemap/0.8.1 crate://crates.io/lock_api/0.4.14 crate://crates.io/log/0.4.29 crate://crates.io/mailparse/0.16.1 crate://crates.io/matchers/0.2.0 cr
 ate://crates.io/maybe-owned/0.3.4 crate://crates.io/memchr/2.8.3 crate://crates.io/miniz_oxide/0.9.1 crate://crates.io/mio/1.2.0 crate://crates.io/munge/0.4.7 crate://crates.io/munge_macro/0.4.7 crate://crates.io/nu-ansi-term/0.50.3 crate://crates.io/once_cell/1.21.4 crate://crates.io/once_cell_polyfill/1.70.2 crate://crates.io/owo-colors/4.4.0 crate://crates.io/parking/2.2.1 crate://crates.io/parking_lot/0.12.5 crate://crates.io/parking_lot_core/0.9.12 crate://crates.io/path-slash/0.2.1 crate://crates.io/percent-encoding/2.3.2 crate://crates.io/pest/2.8.6 crate://crates.io/pest_derive/2.8.6 crate://crates.io/pest_generator/2.8.6 crate://crates.io/pest_meta/2.8.6 crate://crates.io/petgraph/0.8.3 crate://crates.io/pin-project/1.1.11 crate://crates.io/pin-project-internal/1.1.11 crate://crates.io/pin-project-lite/0.2.17 crate://crates.io/portable-atomic/1.13.1 crate://crates.io/portable-atomic-util/0.2.6 crate://crates.io/potential_utf/0.1.4 crate://crates.io/proc-macro-error-attr2/2.
 0.0 crate://crates.io/proc-macro-error2/2.0.1 crate://crates.io/proc-macro2/1.0.107 crate://crates.io/ptr_meta/0.3.1 crate://crates.io/ptr_meta_derive/0.3.1 crate://crates.io/quote/1.0.47 crate://crates.io/quoted_printable/0.5.1 crate://crates.io/r-efi/6.0.0 crate://crates.io/rancor/0.1.1 crate://crates.io/redox_syscall/0.5.15 crate://crates.io/ref-cast/1.0.27 crate://crates.io/ref-cast-impl/1.0.27 crate://crates.io/reflink-copy/0.1.30 crate://crates.io/regex/1.13.1 crate://crates.io/regex-automata/0.4.18 crate://crates.io/regex-syntax/0.8.11 crate://crates.io/rend/0.5.3 crate://crates.io/rkyv/0.8.18 crate://crates.io/rkyv_derive/0.8.18 crate://crates.io/rustc-hash/2.1.3 crate://crates.io/rustix/1.1.4 crate://crates.io/rustix-linux-procfs/0.1.1 crate://crates.io/rustversion/1.0.22 crate://crates.io/ryu/1.0.23 crate://crates.io/same-file/1.0.6 crate://crates.io/schemars/1.2.2 crate://crates.io/schemars_derive/1.2.2 crate://crates.io/scopeguard/1.2.0 crate://crates.io/seahash/4.1.0 cr
 ate://crates.io/self-replace/1.5.0 crate://crates.io/serde/1.0.229 crate://crates.io/serde-untagged/0.1.9 crate://crates.io/serde_core/1.0.229 crate://crates.io/serde_derive/1.0.229 crate://crates.io/serde_derive_internals/0.30.0 crate://crates.io/serde_json/1.0.151 crate://crates.io/serde_spanned/1.1.1 crate://crates.io/sha2/0.10.9 crate://crates.io/sha2/0.11.0 crate://crates.io/sharded-slab/0.1.7 crate://crates.io/signal-hook-registry/1.4.8 crate://crates.io/simd-adler32/0.3.8 crate://crates.io/simdutf8/0.1.5 crate://crates.io/similar/2.7.0 crate://crates.io/slab/0.4.12 crate://crates.io/smallvec/1.16.0 crate://crates.io/smawk/0.3.2 crate://crates.io/socket2/0.6.3 crate://crates.io/spdx/0.13.5 crate://crates.io/stable_deref_trait/1.2.1 crate://crates.io/strip-ansi-escapes/0.2.1 crate://crates.io/strsim/0.11.1 crate://crates.io/syn/2.0.118 crate://crates.io/syn/3.0.5 crate://crates.io/synstructure/0.13.2 crate://crates.io/tar-codec/0.0.14 crate://crates.io/tar-framing/0.0.14 crate:
 //crates.io/temp-env/0.3.6 crate://crates.io/tempfile/3.27.0 crate://crates.io/terminal_size/0.4.4 crate://crates.io/textwrap/0.16.2 crate://crates.io/thiserror/2.0.20 crate://crates.io/thiserror-impl/2.0.20 crate://crates.io/thread_local/1.1.9 crate://crates.io/tinystr/0.8.2 crate://crates.io/tinyvec/1.11.0 crate://crates.io/tinyvec_macros/0.1.1 crate://crates.io/tokio/1.53.1 crate://crates.io/tokio-macros/2.7.0 crate://crates.io/tokio-stream/0.1.19 crate://crates.io/toml/1.1.3+spec-1.1.0 crate://crates.io/toml_datetime/1.1.1+spec-1.1.0 crate://crates.io/toml_edit/0.25.13+spec-1.1.0 crate://crates.io/toml_parser/1.1.2+spec-1.1.0 crate://crates.io/toml_writer/1.1.2+spec-1.1.0 crate://crates.io/tracing/0.1.44 crate://crates.io/tracing-attributes/0.1.31 crate://crates.io/tracing-core/0.1.36 crate://crates.io/tracing-log/0.2.0 crate://crates.io/tracing-subscriber/0.3.23 crate://crates.io/tracing-test/0.2.6 crate://crates.io/tracing-test-macro/0.2.6 crate://crates.io/typeid/1.0.3 crate:
 //crates.io/typenum/1.20.1 crate://crates.io/ucd-trie/0.1.7 crate://crates.io/unicode-ident/1.0.24 crate://crates.io/unicode-width/0.2.2 crate://crates.io/unscanny/0.1.0 crate://crates.io/url/2.5.8 crate://crates.io/utf8_iter/1.0.4 crate://crates.io/utf8parse/0.2.2 crate://crates.io/uuid/1.24.0 crate://crates.io/valuable/0.1.1 crate://crates.io/version_check/0.9.5 crate://crates.io/vte/0.14.1 crate://crates.io/walkdir/2.5.0 crate://crates.io/wasi/0.11.1+wasi-snapshot-preview1 crate://crates.io/wasm-bindgen/0.2.114 crate://crates.io/wasm-bindgen-macro/0.2.114 crate://crates.io/wasm-bindgen-macro-support/0.2.114 crate://crates.io/wasm-bindgen-shared/0.2.114 crate://crates.io/winapi-util/0.1.11 crate://crates.io/windows/0.61.3 crate://crates.io/windows-collections/0.2.0 crate://crates.io/windows-core/0.61.2 crate://crates.io/windows-future/0.2.1 crate://crates.io/windows-implement/0.60.2 crate://crates.io/windows-interface/0.59.3 crate://crates.io/windows-link/0.1.3 crate://crates.io/w
 indows-link/0.2.1 crate://crates.io/windows-numerics/0.2.0 crate://crates.io/windows-result/0.3.4 crate://crates.io/windows-strings/0.4.2 crate://crates.io/windows-sys/0.52.0 crate://crates.io/windows-sys/0.60.2 crate://crates.io/windows-sys/0.61.2 crate://crates.io/windows-targets/0.52.6 crate://crates.io/windows-targets/0.53.5 crate://crates.io/windows-threading/0.1.0 crate://crates.io/windows_aarch64_gnullvm/0.52.6 crate://crates.io/windows_aarch64_gnullvm/0.53.1 crate://crates.io/windows_aarch64_msvc/0.52.6 crate://crates.io/windows_aarch64_msvc/0.53.1 crate://crates.io/windows_i686_gnu/0.52.6 crate://crates.io/windows_i686_gnu/0.53.1 crate://crates.io/windows_i686_gnullvm/0.52.6 crate://crates.io/windows_i686_gnullvm/0.53.1 crate://crates.io/windows_i686_msvc/0.52.6 crate://crates.io/windows_i686_msvc/0.53.1 crate://crates.io/windows_x86_64_gnu/0.52.6 crate://crates.io/windows_x86_64_gnu/0.53.1 crate://crates.io/windows_x86_64_gnullvm/0.52.6 crate://crates.io/windows_x86_64_gnu
 llvm/0.53.1 crate://crates.io/windows_x86_64_msvc/0.52.6 crate://crates.io/windows_x86_64_msvc/0.53.1 crate://crates.io/winnow/1.0.3 crate://crates.io/winx/0.36.4 crate://crates.io/writeable/0.6.2 crate://crates.io/yoke/0.8.1 crate://crates.io/yoke-derive/0.8.1 crate://crates.io/zerocopy/0.8.56 crate://crates.io/zerocopy-derive/0.8.56 crate://crates.io/zerofrom/0.1.6 crate://crates.io/zerofrom-derive/0.1.6 crate://crates.io/zerotrie/0.2.3 crate://crates.io/zerovec/0.11.5 crate://crates.io/zerovec-derive/0.11.2 crate://crates.io/zlib-rs/0.6.3 crate://crates.io/zmij/1.0.21"
packages/x86-64-v3-poky-linux/python3-uv-build: PV changed from "0.12.21" to "0.12.24"
packages/x86-64-v3-poky-linux/python3-uv-build: PKGV changed from 0.12.21 [default] to 0.12.24 [default]
packages/x86-64-v3-poky-linux/python3-uv-build/python3-uv-build-dbg: RRECOMMENDS: removed "libzstd-dbg"
packages/x86-64-v3-poky-linux/python3-uv-build/python3-uv-build-dbg: PV changed from "0.12.21" to "0.12.24"
packages/x86-64-v3-poky-linux/python3-uv-build/python3-uv-build-dbg: PKGV changed from 0.12.21 [default] to 0.12.24 [default]
packages/x86-64-v3-poky-linux/python3-uv-build/python3-uv-build-dev: RRECOMMENDS: removed "libzstd-dev"
packages/x86-64-v3-poky-linux/python3-uv-build/python3-uv-build-dev: PV changed from "0.12.21" to "0.12.24"
packages/x86-64-v3-poky-linux/python3-uv-build/python3-uv-build-dev: PKGV changed from 0.12.21 [default] to 0.12.24 [default]
packages/x86-64-v3-poky-linux/python3-uv-build/python3-uv-build-doc: PV changed from "0.12.21" to "0.12.24"
packages/x86-64-v3-poky-linux/python3-uv-build/python3-uv-build-doc: PKGV changed from 0.12.21 [default] to 0.12.24 [default]
packages/x86-64-v3-poky-linux/python3-uv-build/python3-uv-build-locale: PV changed from "0.12.21" to "0.12.24"
packages/x86-64-v3-poky-linux/python3-uv-build/python3-uv-build-locale: PKGV changed from 0.12.21 [default] to 0.12.24 [default]
packages/x86-64-v3-poky-linux/python3-uv-build/python3-uv-build-src: PV changed from "0.12.21" to "0.12.24"
packages/x86-64-v3-poky-linux/python3-uv-build/python3-uv-build-src: PKGV changed from 0.12.21 [default] to 0.12.24 [default]
packages/x86-64-v3-poky-linux/python3-uv-build/python3-uv-build-staticdev: PV changed from "0.12.21" to "0.12.24"
packages/x86-64-v3-poky-linux/python3-uv-build/python3-uv-build-staticdev: PKGV changed from 0.12.21 [default] to 0.12.24 [default]
packages/x86-64-v3-poky-linux/python3-uv-build/python3-uv-build: FILELIST: directory renamed /usr/lib/python3.14/site-packages/uv_build-0.12.21.dist-info/licenses -> /usr/lib/python3.14/site-packages/uv_build-0.12.24.dist-info/licenses, directory renamed /usr/lib/python3.14/site-packages/uv_build-0.12.21.dist-info -> /usr/lib/python3.14/site-packages/uv_build-0.12.24.dist-info
packages/x86-64-v3-poky-linux/python3-uv-build/python3-uv-build: PV changed from "0.12.21" to "0.12.24"
packages/x86-64-v3-poky-linux/python3-uv-build/python3-uv-build: PKGSIZE changed from 4466017 to 4359521 (-2%)
packages/x86-64-v3-poky-linux/python3-uv-build/python3-uv-build: PKGV changed from 0.12.21 [default] to 0.12.24 [default]
packages/x86-64-v3-poky-linux/python3-uv-build/python3-uv-build: RDEPENDS: removed "libzstd (['>= 1.5.7'])"
Changes to packages/x86-64-v3-poky-linux/python3-uv-build (sysroot):
  /usr/lib/python3.14/site-packages/uv_build-0.12.21.dist-info moved to /usr/lib/python3.14/site-packages/uv_build-0.12.24.dist-info

--===============1380989050488275645==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: attachment; filename="buildhistory-diff.txt"

packages/x86-64-v3-poky-linux/python3-uv-build/python3-uv-build-dbg: RRECOMMENDS: removed "libzstd-dbg"
packages/x86-64-v3-poky-linux/python3-uv-build/python3-uv-build-dev: RRECOMMENDS: removed "libzstd-dev"
packages/x86-64-v3-poky-linux/python3-uv-build/python3-uv-build: FILELIST: directory renamed /usr/lib/python3.14/site-packages/uv_build-0.12.21.dist-info -> /usr/lib/python3.14/site-packages/uv_build-0.12.24.dist-info, directory renamed /usr/lib/python3.14/site-packages/uv_build-0.12.21.dist-info/licenses -> /usr/lib/python3.14/site-packages/uv_build-0.12.24.dist-info/licenses
packages/x86-64-v3-poky-linux/python3-uv-build/python3-uv-build: RDEPENDS: removed "libzstd (['>= 1.5.7'])"
Changes to packages/x86-64-v3-poky-linux/python3-uv-build (sysroot):
  /usr/lib/python3.14/site-packages/uv_build-0.12.21.dist-info moved to /usr/lib/python3.14/site-packages/uv_build-0.12.24.dist-info

--===============1380989050488275645==
Content-Type: application/octet-stream
MIME-Version: 1.0
Content-Transfer-Encoding: base64
Content-Disposition: attachment;
 filename="0001-python3-uv-build-upgrade-0.12.21-0.12.24.patch"

RnJvbSBhMjg2NjEyZTIzODM2NDU0MjI4Y2VkYjQ0MDU5NDE2N2U0NDhhMjFlIE1vbiBTZXAgMTcg
MDA6MDA6MDAgMjAwMQpGcm9tOiBVcGdyYWRlIEhlbHBlciA8YXVoQHlvY3RvcHJvamVjdC5vcmc+
CkRhdGU6IEZyaSwgOSBPY3QgMjAyNiAwNTo1ODowMiArMDAwMApTdWJqZWN0OiBbUEFUQ0hdIHB5
dGhvbjMtdXYtYnVpbGQ6IHVwZ3JhZGUgMC4xMi4yMSAtPiAwLjEyLjI0CgotLS0KIC4uLi9weXRo
b24vcHl0aG9uMy11di1idWlsZC1jcmF0ZXMuaW5jICAgICAgICB8IDM2ICsrKysrKystLS0tLS0t
LS0tLS0KIC4uLjAuMTIuMjEuYmIgPT4gcHl0aG9uMy11di1idWlsZF8wLjEyLjI0LmJifSB8ICAy
ICstCiAyIGZpbGVzIGNoYW5nZWQsIDEzIGluc2VydGlvbnMoKyksIDI1IGRlbGV0aW9ucygtKQog
cmVuYW1lIG1ldGEvcmVjaXBlcy1kZXZ0b29scy9weXRob24ve3B5dGhvbjMtdXYtYnVpbGRfMC4x
Mi4yMS5iYiA9PiBweXRob24zLXV2LWJ1aWxkXzAuMTIuMjQuYmJ9ICg5MiUpCgpkaWZmIC0tZ2l0
IGEvbWV0YS9yZWNpcGVzLWRldnRvb2xzL3B5dGhvbi9weXRob24zLXV2LWJ1aWxkLWNyYXRlcy5p
bmMgYi9tZXRhL3JlY2lwZXMtZGV2dG9vbHMvcHl0aG9uL3B5dGhvbjMtdXYtYnVpbGQtY3JhdGVz
LmluYwppbmRleCBhMjE3NDYzMTJlLi40MDA4N2QwNTQxIDEwMDY0NAotLS0gYS9tZXRhL3JlY2lw
ZXMtZGV2dG9vbHMvcHl0aG9uL3B5dGhvbjMtdXYtYnVpbGQtY3JhdGVzLmluYworKysgYi9tZXRh
L3JlY2lwZXMtZGV2dG9vbHMvcHl0aG9uL3B5dGhvbjMtdXYtYnVpbGQtY3JhdGVzLmluYwpAQCAt
MTYsOCArMTYsOCBAQCBTUkNfVVJJICs9ICIgXAogICAgIGNyYXRlOi8vY3JhdGVzLmlvL2FycmF5
dmVjLzAuNy44IFwKICAgICBjcmF0ZTovL2NyYXRlcy5pby9hc3RyYWwtdG9raW8tdGFyLzAuNy4w
IFwKICAgICBjcmF0ZTovL2NyYXRlcy5pby9hc3RyYWwtdmVyc2lvbi1yYW5nZXMvMC4yLjIgXAot
ICAgIGNyYXRlOi8vY3JhdGVzLmlvL2FzdHJhbF9hc3luY196aXAvMC4wLjIwIFwKLSAgICBjcmF0
ZTovL2NyYXRlcy5pby9hc3luYy1jb21wcmVzc2lvbi8wLjQuMTkgXAorICAgIGNyYXRlOi8vY3Jh
dGVzLmlvL2FzdHJhbF9hc3luY196aXAvMC4wLjIxIFwKKyAgICBjcmF0ZTovL2NyYXRlcy5pby9h
c3luYy1jb21wcmVzc2lvbi8wLjQuNDUgXAogICAgIGNyYXRlOi8vY3JhdGVzLmlvL2F1dG9jZmcv
MS41LjAgXAogICAgIGNyYXRlOi8vY3JhdGVzLmlvL2JhY2tvbi8xLjYuMCBcCiAgICAgY3JhdGU6
Ly9jcmF0ZXMuaW8vYmFzZTY0LzAuMjIuMSBcCkBAIC0zMyw3ICszMyw2IEBAIFNSQ19VUkkgKz0g
IiBcCiAgICAgY3JhdGU6Ly9jcmF0ZXMuaW8vYnl0ZXMvMS4xMi4xIFwKICAgICBjcmF0ZTovL2Ny
YXRlcy5pby9jYXAtcHJpbWl0aXZlcy80LjAuMyBcCiAgICAgY3JhdGU6Ly9jcmF0ZXMuaW8vY2Fw
LXN0ZC80LjAuMyBcCi0gICAgY3JhdGU6Ly9jcmF0ZXMuaW8vY2MvMS4yLjU3IFwKICAgICBjcmF0
ZTovL2NyYXRlcy5pby9jZmctaWYvMS4wLjQgXAogICAgIGNyYXRlOi8vY3JhdGVzLmlvL2NoYXJz
ZXQvMC4xLjUgXAogICAgIGNyYXRlOi8vY3JhdGVzLmlvL2NsYXAvNC42LjYgXApAQCAtNDEsNiAr
NDAsOCBAQCBTUkNfVVJJICs9ICIgXAogICAgIGNyYXRlOi8vY3JhdGVzLmlvL2NsYXBfZGVyaXZl
LzQuNi40IFwKICAgICBjcmF0ZTovL2NyYXRlcy5pby9jbGFwX2xleC8xLjEuMCBcCiAgICAgY3Jh
dGU6Ly9jcmF0ZXMuaW8vY29sb3JjaG9pY2UvMS4wLjUgXAorICAgIGNyYXRlOi8vY3JhdGVzLmlv
L2NvbXByZXNzaW9uLWNvZGVjcy8wLjQuNDUgXAorICAgIGNyYXRlOi8vY3JhdGVzLmlvL2NvbXBy
ZXNzaW9uLWNvcmUvMC40LjMzIFwKICAgICBjcmF0ZTovL2NyYXRlcy5pby9jb25zb2xlLzAuMTYu
NCBcCiAgICAgY3JhdGU6Ly9jcmF0ZXMuaW8vY3B1ZmVhdHVyZXMvMC4yLjE3IFwKICAgICBjcmF0
ZTovL2NyYXRlcy5pby9jcHVmZWF0dXJlcy8wLjMuMCBcCkBAIC02OCw3ICs2OSw2IEBAIFNSQ19V
UkkgKz0gIiBcCiAgICAgY3JhdGU6Ly9jcmF0ZXMuaW8vZXJhc2VkLXNlcmRlLzAuNC4xMCBcCiAg
ICAgY3JhdGU6Ly9jcmF0ZXMuaW8vZXJybm8vMC4zLjE0IFwKICAgICBjcmF0ZTovL2NyYXRlcy5p
by9mYXN0cmFuZC8yLjUuMCBcCi0gICAgY3JhdGU6Ly9jcmF0ZXMuaW8vZmluZC1tc3ZjLXRvb2xz
LzAuMS45IFwKICAgICBjcmF0ZTovL2NyYXRlcy5pby9maXhlZGJpdHNldC8wLjUuNyBcCiAgICAg
Y3JhdGU6Ly9jcmF0ZXMuaW8vZmxhdGUyLzEuMS4xMCBcCiAgICAgY3JhdGU6Ly9jcmF0ZXMuaW8v
Zm9sZGhhc2gvMC4xLjUgXApAQCAtMTE4LDcgKzExOCw2IEBAIFNSQ19VUkkgKz0gIiBcCiAgICAg
Y3JhdGU6Ly9jcmF0ZXMuaW8vamlmZi1zdGF0aWMvMC4yLjM1IFwKICAgICBjcmF0ZTovL2NyYXRl
cy5pby9qaWZmLXR6ZGIvMC4xLjggXAogICAgIGNyYXRlOi8vY3JhdGVzLmlvL2ppZmYtdHpkYi1w
bGF0Zm9ybS8wLjEuMyBcCi0gICAgY3JhdGU6Ly9jcmF0ZXMuaW8vam9ic2VydmVyLzAuMS4zNSBc
CiAgICAgY3JhdGU6Ly9jcmF0ZXMuaW8vanMtc3lzLzAuMy45MSBcCiAgICAgY3JhdGU6Ly9jcmF0
ZXMuaW8vanVuY3Rpb24vMi4wLjAgXAogICAgIGNyYXRlOi8vY3JhdGVzLmlvL2xhenlfc3RhdGlj
LzEuNS4wIFwKQEAgLTE1Miw3ICsxNTEsNiBAQCBTUkNfVVJJICs9ICIgXAogICAgIGNyYXRlOi8v
Y3JhdGVzLmlvL3Bpbi1wcm9qZWN0LzEuMS4xMSBcCiAgICAgY3JhdGU6Ly9jcmF0ZXMuaW8vcGlu
LXByb2plY3QtaW50ZXJuYWwvMS4xLjExIFwKICAgICBjcmF0ZTovL2NyYXRlcy5pby9waW4tcHJv
amVjdC1saXRlLzAuMi4xNyBcCi0gICAgY3JhdGU6Ly9jcmF0ZXMuaW8vcGtnLWNvbmZpZy8wLjMu
MzIgXAogICAgIGNyYXRlOi8vY3JhdGVzLmlvL3BvcnRhYmxlLWF0b21pYy8xLjEzLjEgXAogICAg
IGNyYXRlOi8vY3JhdGVzLmlvL3BvcnRhYmxlLWF0b21pYy11dGlsLzAuMi42IFwKICAgICBjcmF0
ZTovL2NyYXRlcy5pby9wb3RlbnRpYWxfdXRmLzAuMS40IFwKQEAgLTE5NiwxMyArMTk0LDEyIEBA
IFNSQ19VUkkgKz0gIiBcCiAgICAgY3JhdGU6Ly9jcmF0ZXMuaW8vc2hhMi8wLjEwLjkgXAogICAg
IGNyYXRlOi8vY3JhdGVzLmlvL3NoYTIvMC4xMS4wIFwKICAgICBjcmF0ZTovL2NyYXRlcy5pby9z
aGFyZGVkLXNsYWIvMC4xLjcgXAotICAgIGNyYXRlOi8vY3JhdGVzLmlvL3NobGV4LzEuMy4wIFwK
ICAgICBjcmF0ZTovL2NyYXRlcy5pby9zaWduYWwtaG9vay1yZWdpc3RyeS8xLjQuOCBcCiAgICAg
Y3JhdGU6Ly9jcmF0ZXMuaW8vc2ltZC1hZGxlcjMyLzAuMy44IFwKICAgICBjcmF0ZTovL2NyYXRl
cy5pby9zaW1kdXRmOC8wLjEuNSBcCiAgICAgY3JhdGU6Ly9jcmF0ZXMuaW8vc2ltaWxhci8yLjcu
MCBcCiAgICAgY3JhdGU6Ly9jcmF0ZXMuaW8vc2xhYi8wLjQuMTIgXAotICAgIGNyYXRlOi8vY3Jh
dGVzLmlvL3NtYWxsdmVjLzEuMTUuMiBcCisgICAgY3JhdGU6Ly9jcmF0ZXMuaW8vc21hbGx2ZWMv
MS4xNi4wIFwKICAgICBjcmF0ZTovL2NyYXRlcy5pby9zbWF3ay8wLjMuMiBcCiAgICAgY3JhdGU6
Ly9jcmF0ZXMuaW8vc29ja2V0Mi8wLjYuMyBcCiAgICAgY3JhdGU6Ly9jcmF0ZXMuaW8vc3BkeC8w
LjEzLjUgXApAQCAtMjEwLDcgKzIwNyw3IEBAIFNSQ19VUkkgKz0gIiBcCiAgICAgY3JhdGU6Ly9j
cmF0ZXMuaW8vc3RyaXAtYW5zaS1lc2NhcGVzLzAuMi4xIFwKICAgICBjcmF0ZTovL2NyYXRlcy5p
by9zdHJzaW0vMC4xMS4xIFwKICAgICBjcmF0ZTovL2NyYXRlcy5pby9zeW4vMi4wLjExOCBcCi0g
ICAgY3JhdGU6Ly9jcmF0ZXMuaW8vc3luLzMuMC40IFwKKyAgICBjcmF0ZTovL2NyYXRlcy5pby9z
eW4vMy4wLjUgXAogICAgIGNyYXRlOi8vY3JhdGVzLmlvL3N5bnN0cnVjdHVyZS8wLjEzLjIgXAog
ICAgIGNyYXRlOi8vY3JhdGVzLmlvL3Rhci1jb2RlYy8wLjAuMTQgXAogICAgIGNyYXRlOi8vY3Jh
dGVzLmlvL3Rhci1mcmFtaW5nLzAuMC4xNCBcCkBAIC0zMDYsOSArMzAzLDYgQEAgU1JDX1VSSSAr
PSAiIFwKICAgICBjcmF0ZTovL2NyYXRlcy5pby96ZXJvdmVjLWRlcml2ZS8wLjExLjIgXAogICAg
IGNyYXRlOi8vY3JhdGVzLmlvL3psaWItcnMvMC42LjMgXAogICAgIGNyYXRlOi8vY3JhdGVzLmlv
L3ptaWovMS4wLjIxIFwKLSAgICBjcmF0ZTovL2NyYXRlcy5pby96c3RkLzAuMTMuMyBcCi0gICAg
Y3JhdGU6Ly9jcmF0ZXMuaW8venN0ZC1zYWZlLzcuMi40IFwKLSAgICBjcmF0ZTovL2NyYXRlcy5p
by96c3RkLXN5cy8yLjAuMTYrenN0ZC4xLjUuNyBcCiAiCiAKIFNSQ19VUklbYWRsZXIyLTIuMC4x
LnNoYTI1NnN1bV0gPSAiMzIwMTE5NTc5ZmNhZDljMjE4ODRmNWM0ODYxZDE2MTc0ZDBlMDYyNTA2
MjUyNjZmNTBmZTY4OTgzNDBhYmVmYSIKQEAgLTMyNSw4ICszMTksOCBAQCBTUkNfVVJJW2FyY3N0
ci0xLjIuMC5zaGEyNTZzdW1dID0gIjAzOTE4YzNkYmQ3NzAxYTg1YzZiOTg4NzczMmUyOTIxMTc1
ZjI2YzM1MGI0NQogU1JDX1VSSVthcnJheXZlYy0wLjcuOC5zaGEyNTZzdW1dID0gImQzZmI2N2E2
ZTA4YWNmMjRmZGVjY2JhYzJjYjZhYzQzMDU4MjViZDFmMTE3NDYyZTBlNmYyZjE5MzM0NWFkNTYi
CiBTUkNfVVJJW2FzdHJhbC10b2tpby10YXItMC43LjAuc2hhMjU2c3VtXSA9ICI2ZjJlOTg5YjMz
MjQ2ZmU5MjQwZDM5YWNjZjRkZDlhMDFlMGI2YzFmM2NlOWRkMDk1ZTBhNDdmYTAyNTA1NTIzIgog
U1JDX1VSSVthc3RyYWwtdmVyc2lvbi1yYW5nZXMtMC4yLjIuc2hhMjU2c3VtXSA9ICI4MTEyOWUx
NDNhN2JjZWEyNjNkNWEyYzUwYjhiZTQ3YWM1ODM2NWRkZTYxOGJjMWFjNTBmNjlmNDk3YzljYjYz
IgotU1JDX1VSSVthc3RyYWxfYXN5bmNfemlwLTAuMC4yMC5zaGEyNTZzdW1dID0gImJkOTM5ZDc5
OTU5YzNmNDlhNjQ4YTFkNzg1N2Q2M2NjNjI1NDg3MjVhNmIwNjBiOGRiZjBlYTVjOTI0NzBiNjMi
Ci1TUkNfVVJJW2FzeW5jLWNvbXByZXNzaW9uLTAuNC4xOS5zaGEyNTZzdW1dID0gIjA2NTc1ZTZh
OTY3MzU4MGY1MjY2MWM5MjEwN2JhYWJmZmJmNDFlMjE0MTM3MzQ0MWNiY2RjNDdjYjczMzAwM2Mi
CitTUkNfVVJJW2FzdHJhbF9hc3luY196aXAtMC4wLjIxLnNoYTI1NnN1bV0gPSAiMTNmNGE5YmM2
Mjg5ZDkwN2M4ZTg4M2QyNTAyNmE1NDc1MWQ2ODZkYTk5MjZhZjI3MWQwZmM0Y2JlNThhN2Y0ZCIK
K1NSQ19VUklbYXN5bmMtY29tcHJlc3Npb24tMC40LjQ1LnNoYTI1NnN1bV0gPSAiMjRhOGVjNzNl
Yjg2MjUwOGI3MDQxNzIzYzg5Mzg2MzY1ODk0YjRlN2Q5ZjY5OThiZjFiODUyOWU1YjBlZTI1NCIK
IFNSQ19VUklbYXV0b2NmZy0xLjUuMC5zaGEyNTZzdW1dID0gImMwODYwNmY4YzNjYmY0Y2U2ZWM4
ZTI4ZmIwMDE0YTJjMDg2NzA4ZmU5NTRlYWE4ODUzODRhNjE2NTE3MmU3ZTgiCiBTUkNfVVJJW2Jh
Y2tvbi0xLjYuMC5zaGEyNTZzdW1dID0gImNmZmIwZTkzMTg3NWI2NjZmYzRmY2IyMGZlZTUyZTli
YmQxZWY4MzZmZDllOWUwNGVjMjE1NTVmOWY4NWY3ZWYiCiBTUkNfVVJJW2Jhc2U2NC0wLjIyLjEu
c2hhMjU2c3VtXSA9ICI3MmIzMjU0ZjE2MjUxYTgzODFhYTEyZTQwZTNjNGQyZjAxOTlmOGM2NTA4
ZmJlY2I5ZDkxZjU3NWUwZmJiOGM2IgpAQCAtMzQyLDcgKzMzNiw2IEBAIFNSQ19VUklbYnl0ZWNo
ZWNrX2Rlcml2ZS0wLjguMy5zaGEyNTZzdW1dID0gIjQ2ZDA3OTE4Y2FhOWVlYWFmMDZiNzg3Mzky
NWM1M2E2MWRhCiBTUkNfVVJJW2J5dGVzLTEuMTIuMS5zaGEyNTZzdW1dID0gImZjNjUyYTQ4YzM1
MmFlZjNlYTNhZWQzMjA4MDUwMWNmM2VmNmVkNWRhNzg2MDJhMDIwYzk5MTc3NWIwYWZmMDQiCiBT
UkNfVVJJW2NhcC1wcmltaXRpdmVzLTQuMC4zLnNoYTI1NnN1bV0gPSAiOGI1Zjc0NzI5ZmQyZjQ0
NzAxZDFhOGViNDdlOTA2Y2RiM2NjZDllYzBmMDJiYWFkODVhNzQ0Yjc5MTk0MGIxOCIKIFNSQ19V
UklbY2FwLXN0ZC00LjAuMy5zaGEyNTZzdW1dID0gImMxZWM3OGUyNDJjZmEyY2ZlMjc2ODA3YWMy
ZWNjMDAzMTVhNmM5Nzc4Njk3NzQxNGJjZDFjMzk2M2I2YzkxYjgiCi1TUkNfVVJJW2NjLTEuMi41
Ny5zaGEyNTZzdW1dID0gIjdhMGRkMWNhMzg0OTMyZmYzNjQxYzg3MThhMDI3NjlmMTY5OGU3NTYz
ZGM2OTc0ZmZkMDMzNDYxMTYzMTA0MjMiCiBTUkNfVVJJW2NmZy1pZi0xLjAuNC5zaGEyNTZzdW1d
ID0gIjkzMzBmOGIyZmYxM2YzNDU0MGI0NGU5NDZlZjM1MTExODI1NzI3YjM4ZDMzMjg2ZWY5ODYx
NDI2MTUxMjE4MDEiCiBTUkNfVVJJW2NoYXJzZXQtMC4xLjUuc2hhMjU2c3VtXSA9ICJmMWY5Mjdi
MDdjNzRiYTg0YzdlNWZlNGRiMmJhZWIzZTk5NmFiMjY4ODk5MmUzOWFjNjhjZTMyMjBhNjc3Yzdl
IgogU1JDX1VSSVtjbGFwLTQuNi42LnNoYTI1NnN1bV0gPSAiNDczYzdlMDdmNDA5YThkNzcyMTYx
NzI0YWE4ZGI2YTc2NWEyNTMyYTcwZjk2NjdlZWI3YjQ5ZDNkMDJmYmRjYSIKQEAgLTM1MCw2ICsz
NDMsOCBAQCBTUkNfVVJJW2NsYXBfYnVpbGRlci00LjYuNi5zaGEyNTZzdW1dID0gIjdiNDhmZWE1
YTg4ZTlhZTcyOGEyZGNiZWRiZmMwZTczMGY3ZDYwZAogU1JDX1VSSVtjbGFwX2Rlcml2ZS00LjYu
NC5zaGEyNTZzdW1dID0gImQwMTJkMmI5ZDY1YWNhN2YxOGY0ZDk4NzhhMDQ1YmMxNzg5OWJiYTk1
MTU2MWJhNWVjM2MyYmExZWVkOWEwNjEiCiBTUkNfVVJJW2NsYXBfbGV4LTEuMS4wLnNoYTI1NnN1
bV0gPSAiYzhkNGEzYmI4YjFlMGMxMDUwNDk5ZDE4MTVmNWFiMTZkMDRmMDk1OWIyMzMwODVmYjMx
NjUzZmJmYzlkOThmOSIKIFNSQ19VUklbY29sb3JjaG9pY2UtMS4wLjUuc2hhMjU2c3VtXSA9ICIx
ZDA3NTUwYzkwMzZiZjJhZTBjNjg0YzQyOTdkNTAzZjgzODI4N2M4M2M1MzY4NmQwNTM3MGQwZTEz
OWFlNTcwIgorU1JDX1VSSVtjb21wcmVzc2lvbi1jb2RlY3MtMC40LjQ1LnNoYTI1NnN1bV0gPSAi
OThmYzk4NDYwYmEwYWQ1MzE3MDc1ZDM2MzJiOGRmYzQ1ZDBiZThjNGE0OTM0N2MyYTM4MjcyMDE5
NzE3NjE0YSIKK1NSQ19VUklbY29tcHJlc3Npb24tY29yZS0wLjQuMzMuc2hhMjU2c3VtXSA9ICI2
ZThjY2M0ZWE5ZjZhY2MzMmQxMDJjMGY2ZDQ3MWQxMWQ5MTNhZDE1ZjIwYzA0ZGU3NDMzNzQ4NjFm
YTFkNDE0IgogU1JDX1VSSVtjb25zb2xlLTAuMTYuNC5zaGEyNTZzdW1dID0gIjRmZTVmNDY1YTRm
NmZlZTg4ZmFkNDFiODVkOTkwZjg0YzgzNTMzNWU4NWI1ZDllNmU2M2UwZDA2ZDI4Y2JhN2MiCiBT
UkNfVVJJW2NwdWZlYXR1cmVzLTAuMi4xNy5zaGEyNTZzdW1dID0gIjU5ZWQ1ODM4ZWViYjI2YTJi
YjJlNThmNmQ1YjUzMTY5ODlhZTlkMDhiYWIxMGUwZTZkMTAzZTY1NmQxYjAyODAiCiBTUkNfVVJJ
W2NwdWZlYXR1cmVzLTAuMy4wLnNoYTI1NnN1bV0gPSAiOGIyYTQxMzkzZjY2ZjE2YjA4MjNiYjc5
MDk0ZDU0YWM1ZmJkMzRhYjI5MmRkYWZiOWEwNDU2YWM5Zjg3ZDIwMSIKQEAgLTM3Nyw3ICszNzIs
NiBAQCBTUkNfVVJJW2VxdWl2YWxlbnQtMS4wLjIuc2hhMjU2c3VtXSA9ICI4NzdhNGFjZTg3MTNi
MGJjZjJhNGU3ZWVjODI1MjljMDI5ZjFkMDYxOQogU1JDX1VSSVtlcmFzZWQtc2VyZGUtMC40LjEw
LnNoYTI1NnN1bV0gPSAiZDJhZGQ4YTA3ZGQ2YThkOTNmZjYyNzAyOWM1MWRlMTQ1ZTEyNjg2ZmJj
MzZlY2IyOThhYzIyZTc0Y2YwMmRlYyIKIFNSQ19VUklbZXJybm8tMC4zLjE0LnNoYTI1NnN1bV0g
PSAiMzljYWI3MTYxN2FlMGQ2M2Y1MWEzNmQ2OWY4NjYzOTE3MzViNTE2OTFkYmRhNjNjZjZmOTZk
MDQyYjYzZWZlYiIKIFNSQ19VUklbZmFzdHJhbmQtMi41LjAuc2hhMjU2c3VtXSA9ICJkYTdjNjJj
ZWFlMjA3ZGQzN2VhNWI4NDVkYTZhMDY5NmM3OTlmODVlOTdkYTFhYjViNzkxMGJlM2MxYzgwMjIz
IgotU1JDX1VSSVtmaW5kLW1zdmMtdG9vbHMtMC4xLjkuc2hhMjU2c3VtXSA9ICI1YmFlYmMwNzc0
MTUxZjkwNWExYTJjYzQxOTg5MzAwYjFlNmZiYjI5YWZmMGNlZmZhMTA2NGZkZDMwODhkNTgyIgog
U1JDX1VSSVtmaXhlZGJpdHNldC0wLjUuNy5zaGEyNTZzdW1dID0gIjFkNjc0ZTgxMzkxZDFlMWFi
NjgxYTI4ZDk5ZGYwNzkyN2M2ZDRhYTViMDI3ZDdkYTE2YmEzMmQxZDIxZWNkOTkiCiBTUkNfVVJJ
W2ZsYXRlMi0xLjEuMTAuc2hhMjU2c3VtXSA9ICI2ZTYzNGUyZTBlYmFjMWVlMDM0MDIwZGExY2E1
ODJlMTdmZmU0ZTBmNWU5ODU4MjM3MjFlMTY4OTI4MTM2ZGNiIgogU1JDX1VSSVtmb2xkaGFzaC0w
LjEuNS5zaGEyNTZzdW1dID0gImQ5YzRmNWRhYzVlMTVjMjRlYjk5OWMyNjE4MWE2Y2E0MGIzOWZl
OTQ2Y2JlNGMyNjNjNzIwOTQ2N2JjODNhZjIiCkBAIC00MjcsNyArNDIxLDYgQEAgU1JDX1VSSVtq
aWZmLWNvcmUtMC4xLjAuc2hhMjU2c3VtXSA9ICI3ZmVjYTg4NDM5ZWZlNTNkYTM3NTQ1MDBjMTg1
MWRlZGYzY2IzNmM1MjQKIFNSQ19VUklbamlmZi1zdGF0aWMtMC4yLjM1LnNoYTI1NnN1bV0gPSAi
M2E2OWRjYjNhMjFjZmIzMmNlMWNkMDU2MTY5MzM3Y2EyODRhZjA3NjZkZDc2NmU3ODc4ODE5YjI1
MWE0OTIwNCIKIFNSQ19VUklbamlmZi10emRiLTAuMS44LnNoYTI1NnN1bV0gPSAiMTQyYmQzOTkz
MmFkMjMxZjEwNTEzZGY5YWI2MjY2MWZlYWQ4NzE5ODcyMTUwYjdhZDAyYTJkZjc5ZjRlMTQxZSIK
IFNSQ19VUklbamlmZi10emRiLXBsYXRmb3JtLTAuMS4zLnNoYTI1NnN1bV0gPSAiODc1YTVhNjlh
YzJiYWIxYTg5MTcxMWNmNWVjY2JlYzFjZTAzNDFlYTgwNTU2MGRjZDkwYjdhMmU5MjUxMzJlOCIK
LVNSQ19VUklbam9ic2VydmVyLTAuMS4zNS5zaGEyNTZzdW1dID0gIjFjMDBhY2JkMjllYWJhZDRh
MjM5MmZhMGU5MjFjODc0OTM0ZGJiZjQxOTQzMTJhZDIwZjA0YTBlZDY3YTNjYjMiCiBTUkNfVVJJ
W2pzLXN5cy0wLjMuOTEuc2hhMjU2c3VtXSA9ICJiNDk3MTViNzA3M2YzODViYTRiYzUyOGU1NzQ3
ZDAyZTY2Y2IzOWM2MTQ2ZWZiNjZiNzgxZjEzMWYwZmIzOTljIgogU1JDX1VSSVtqdW5jdGlvbi0y
LjAuMC5zaGEyNTZzdW1dID0gIjE2MGYyZWFkZTA5N2YzMDI2M2I1NDhhYWU1ZGViMTJhZDM0OWM5
MDliYWE3MTBmYTI0YjkyYzkwOTBiMmUwMDYiCiBTUkNfVVJJW2xhenlfc3RhdGljLTEuNS4wLnNo
YTI1NnN1bV0gPSAiYmJkMmJjYjRjOTYzZjJkZGFlMDZhMmVmYzdlOWYzNTkxMzEyNDczYzUwYzY2
ODVlMWYyOTgwNjgzMTZlNjZmZSIKQEAgLTQ2MSw3ICs0NTQsNiBAQCBTUkNfVVJJW3BldGdyYXBo
LTAuOC4zLnNoYTI1NnN1bV0gPSAiODcwMWI1OGVhOTcwNjBkNWU1YjE1NWQzODNhNjk5NTJhNjA5
NDNmMGU2ZAogU1JDX1VSSVtwaW4tcHJvamVjdC0xLjEuMTEuc2hhMjU2c3VtXSA9ICJmMTc0OWM3
ZWQ0YmNhZjRjM2QwYTNlZmMyODUzODg0NGZiMjliY2RkN2QyYjY3YjJiZTdlMjBiYTg2MWZmNTE3
IgogU1JDX1VSSVtwaW4tcHJvamVjdC1pbnRlcm5hbC0xLjEuMTEuc2hhMjU2c3VtXSA9ICJkOWIy
MGVkMzBmMTA1Mzk5Nzc2YjljODgzZTY4ZTUzNmVmNjAyYTE2YWU2ZjU5NmQyYzQ3MzU5MWQ2YWQ2
NGM2IgogU1JDX1VSSVtwaW4tcHJvamVjdC1saXRlLTAuMi4xNy5zaGEyNTZzdW1dID0gImE4OTMy
MmRmOWViZTFjMTU3OGQ2ODljOTIzMThlMDcwOTY3ZDEwNDJiNTEyYWZiZTQ5NTE4NzIzZjRlNmQ1
Y2QiCi1TUkNfVVJJW3BrZy1jb25maWctMC4zLjMyLnNoYTI1NnN1bV0gPSAiN2VkZGRiZDBiNTJk
NzMyYjIxYWQ5YTVmYWI1YzcwNGMxNGNkOTQ5ZTVlOWExZWM1OTI5YTI0ZmRlZDFiOTA0YyIKIFNS
Q19VUklbcG9ydGFibGUtYXRvbWljLTEuMTMuMS5zaGEyNTZzdW1dID0gImMzM2E5NDcxODk2ZjFj
NjljZWNlZjhkMjBjYmUyZjdhY2NkMTI1MjdjZTYwODQ1ZmY0NGMxNTNiYjJhMjFiNDkiCiBTUkNf
VVJJW3BvcnRhYmxlLWF0b21pYy11dGlsLTAuMi42LnNoYTI1NnN1bV0gPSAiMDkxMzk3YmU2MWEw
MWQ0YmU1OGU3ODQxNTk1YmQ0YmZlZGIxNWYxY2Q1NDk3N2Q3OWI4MjcxZTk0ZWQ3OTlhMyIKIFNS
Q19VUklbcG90ZW50aWFsX3V0Zi0wLjEuNC5zaGEyNTZzdW1dID0gImI3Mzk0OTQzMmY1ZTJhMDk2
NTcwMDNjMjViY2E1ZTE5YTBlOWM4NGY4MDU4Y2EzNzRmNDllMGViZTYwNWFmNzciCkBAIC01MDUs
MTMgKzQ5NywxMiBAQCBTUkNfVVJJW3NlcmRlX3NwYW5uZWQtMS4xLjEuc2hhMjU2c3VtXSA9ICI2
NjYyYjU4Nzk1MTFlMDZlODk5OWE4YTIzNWQ4NDgxMTNlOTQyYwogU1JDX1VSSVtzaGEyLTAuMTAu
OS5zaGEyNTZzdW1dID0gImE3NTA3ZDgxOTc2OWQwMWEzNjVhYjcwNzc5NGE0MDg0MzkyYzgyNGY1
NGE3YTZhNzg2MmY4YzNkMDg5MmIyODMiCiBTUkNfVVJJW3NoYTItMC4xMS4wLnNoYTI1NnN1bV0g
PSAiNDQ2YmE3MTc1MDk1MjRjYjNmMjJmMTdlY2MwOTZmMTBmNDgyMmQ3NmFiNWMwYjk4MjJjNWY5
YzI4NGU4MjVmNCIKIFNSQ19VUklbc2hhcmRlZC1zbGFiLTAuMS43LnNoYTI1NnN1bV0gPSAiZjQw
Y2EzYzQ2ODIzNzEzZTBkNDIwOTU5MmU4ZDZlODI2YWE1N2U5MjhmMDk3NTI2MTlmYzY5NmM0OTk2
MzdmNiIKLVNSQ19VUklbc2hsZXgtMS4zLjAuc2hhMjU2c3VtXSA9ICIwZmRhMmZmMGQwODQwMTli
YTRkN2M2ZjM3MWM5NWQ4ZmQ3NWNlMzUyNGMzY2I4ZmI2NTNhMzAyM2Y2MzIzZTY0IgogU1JDX1VS
SVtzaWduYWwtaG9vay1yZWdpc3RyeS0xLjQuOC5zaGEyNTZzdW1dID0gImM0ZGI2OWNiYTExMTBh
ZmZjMGU5ZjdiY2Q0OGJiZjg3YjNmNGZjN2M2MWZjOTE1NWFmZDRjNDY5ZWIzZDZjMWIiCiBTUkNf
VVJJW3NpbWQtYWRsZXIzMi0wLjMuOC5zaGEyNTZzdW1dID0gImUzMjBhNmM1YWQzMWQyNzFhZDUy
M2RjZjNhZDEzZTI3NjdhZDhiMWNiOGYwNDdmNzVhOGFlYWY4ZGExMzlkYTIiCiBTUkNfVVJJW3Np
bWR1dGY4LTAuMS41LnNoYTI1NnN1bV0gPSAiZTNhOWZlMzRlM2U3YTUwMzE2MDYwMzUxZjM3MTg3
YTNmNTQ2YmNlOTU0OTYxNTY3NTRiNjAxYTVmYTcxYjc2ZSIKIFNSQ19VUklbc2ltaWxhci0yLjcu
MC5zaGEyNTZzdW1dID0gImJiYmI1ZDk2NTkxNDE2NDZhZTY0N2I0MmZlMDk0ZGFmNmM2MTkyZDE2
MjA4NzBiNDQ5ZDk1NTdmNzQ4YjJkYWEiCiBTUkNfVVJJW3NsYWItMC40LjEyLnNoYTI1NnN1bV0g
PSAiMGM3OTBkZTIzMTI0ZjlhYjQ0NTQ0ZDdhYzA1ZDYwNDQwYWRjNTg2NDc5Y2U1MDFjMWQ2ZDdk
YTNjZDhjOWNmNSIKLVNSQ19VUklbc21hbGx2ZWMtMS4xNS4yLnNoYTI1NnN1bV0gPSAiOGVkNmE2
M2YwMmM4NTM5YzkxYTg2ODVhODZmNDA5OTY2MWJhM2RhMDE3OTMyZjZlYmJlYTZkZTNmMGZhN2M5
MCIKK1NSQ19VUklbc21hbGx2ZWMtMS4xNi4wLnNoYTI1NnN1bV0gPSAiYjliZTQyZjUwYWE4NjFj
NTU1NjU0YWEzYTM3ZjUyZjRiMTA3NGJhY2Y0ZTQ4ZmUwZWY3ZmE1ODRlODBmMWYwZiIKIFNSQ19V
Uklbc21hd2stMC4zLjIuc2hhMjU2c3VtXSA9ICJiN2MzODhjMWI1ZTkzNzU2ZDBjNzQwOTY1YzQx
ZTg4MjJmODY2NjIxZDQxYWNiZGY2MzM2YTZhMTY4Zjg4NDBjIgogU1JDX1VSSVtzb2NrZXQyLTAu
Ni4zLnNoYTI1NnN1bV0gPSAiM2E3NjZlMTExMDc4OGMzNmY0ZmExYzJiNzFiMzg3YTc4MTVhYTY1
Zjg4Y2UwMjI5ODQxODI2NjMzZDkzNzIzZSIKIFNSQ19VUklbc3BkeC0wLjEzLjUuc2hhMjU2c3Vt
XSA9ICIwODE2NzBjMjMzZGZiZWQ1NTY5MGNjMGNkMzg0MjRlMGUyNGFjMWIyNjczZDBiNDA4YjNm
N2I2ODQ3MzhkZmE5IgpAQCAtNTE5LDcgKzUxMCw3IEBAIFNSQ19VUklbc3RhYmxlX2RlcmVmX3Ry
YWl0LTEuMi4xLnNoYTI1NnN1bV0gPSAiNmNlMmJlOGRjMjU0NTVlMWY5MWRmNzFiZmExMmFkMzdk
CiBTUkNfVVJJW3N0cmlwLWFuc2ktZXNjYXBlcy0wLjIuMS5zaGEyNTZzdW1dID0gIjJhOGY4MDM4
ZTdlNzk2OWFiYjNmMWI3YzJhODExMjI1ZTkyOTZkYTIwODUzOWUwZjc5YzUyNTFkNmNhYzAwMjUi
CiBTUkNfVVJJW3N0cnNpbS0wLjExLjEuc2hhMjU2c3VtXSA9ICI3ZGE4YjU3MzY4NDVkOWYyZmNi
ODM3ZWE1ZDllMjYyODU2NGIzYjA0M2E3MDk0OGEzZjBiNzc4ODM4YzVmYjRmIgogU1JDX1VSSVtz
eW4tMi4wLjExOC5zaGEyNTZzdW1dID0gIjFiOWFlNTdmOTA0MjEzZWJiNjQ5Y2U2ODk1YjhhNjZj
NjZmMDIwM2I5MzE5NzE4ZjY5YTU2MTJhMDY1YjE0MjIiCi1TUkNfVVJJW3N5bi0zLjAuNC5zaGEy
NTZzdW1dID0gImU2Mjc1Y2RkZjQ2MTBkMTc3NWU2ZDFmZTk0NjliMmU3N2QwZjM5ZmQ5OGZiNzQ1
MDkwMWI4MjFlMGM1MzY0OWYiCitTUkNfVVJJW3N5bi0zLjAuNS5zaGEyNTZzdW1dID0gIjEyZGYy
ZTAxMTBmNjViNzc1Zjc2OWJiMTdlZjk4OTA2N2ExZDkzMWIyZWI4MjJiZDQzNDY2MzFlZWFkYTg5
ZjkiCiBTUkNfVVJJW3N5bnN0cnVjdHVyZS0wLjEzLjIuc2hhMjU2c3VtXSA9ICI3MjhhNzBmM2Ri
YWY1YmFiN2YwYzRiMWFjOGQ3YWU1ZWE2MGE0YjU1NDljOGE1OTE0MzYxYzk5MTQ3YTcwOWQyIgog
U1JDX1VSSVt0YXItY29kZWMtMC4wLjE0LnNoYTI1NnN1bV0gPSAiN2VhNDJlYjE0NGQzMGZjYmYz
MmMyNmRmZWE4OTU5MTc1YmI4MzM1YmZiN2IxOGQyMGM2ZWQzMmVkZWNmMDU1MSIKIFNSQ19VUklb
dGFyLWZyYW1pbmctMC4wLjE0LnNoYTI1NnN1bV0gPSAiNzgzMjIzYTdhNjU5MGJlNDIyN2NiODIx
ZTdjZTgwMzcyNTc1NTExZjY3YzgyNDkyMWFiYTA3NTJkOGFkNTU3MyIKQEAgLTYxNSw2ICs2MDYs
MyBAQCBTUkNfVVJJW3plcm92ZWMtMC4xMS41LnNoYTI1NnN1bV0gPSAiNmMyODcxOTI5NDgyOTQ3
N2Y1MjViZTAxODZkMTNlZmE5YTNjNjAyZjdlYwogU1JDX1VSSVt6ZXJvdmVjLWRlcml2ZS0wLjEx
LjIuc2hhMjU2c3VtXSA9ICJlYWRjZTM5NTM5Y2E1Y2IzOTg1NTkwMTAyNjcxZjI1NjdlNjU5ZmNh
OTY2NjU4MWFkMzQxMWQ1OTIwNzk1MWYzIgogU1JDX1VSSVt6bGliLXJzLTAuNi4zLnNoYTI1NnN1
bV0gPSAiM2JlM2Q0MGU0MGExMzNmOWM5MTZlZTNmOWY0ZmEyZDlkNjM0MzViNWZiZTFiZmM2ZDlk
YWUwYWEwYWRhMTUxMyIKIFNSQ19VUklbem1pai0xLjAuMjEuc2hhMjU2c3VtXSA9ICJiODg0OGVl
NjdlY2M4YWVkYmFmM2U0MTIyMjE3YWZmODkyNjM5MjMxYmVmYzZhMWI1OGQyOWZmZjRjMmNhYmFh
IgotU1JDX1VSSVt6c3RkLTAuMTMuMy5zaGEyNTZzdW1dID0gImU5MWVlMzExYTU2OWMzMjcxNzE2
NTE1NjZlMDc5NzIyMDBlNzZmY2ZlMjI0MmE0ZmE0NDYxNDlhMzg4MWMwOGEiCi1TUkNfVVJJW3pz
dGQtc2FmZS03LjIuNC5zaGEyNTZzdW1dID0gIjhmNDljNGQ1ZjBhYmI2MDJhOTNmYjg3MzZhZjJh
NGY0ZGQ5NTEyZTM2ZjdmNTcwZDY2ZTY1ZmY4NjdlZDNiOWQiCi1TUkNfVVJJW3pzdGQtc3lzLTIu
MC4xNit6c3RkLjEuNS43LnNoYTI1NnN1bV0gPSAiOTFlMTllYmMyYWRjOGY4M2U0MzAzOWU3OTc3
NmUzZmRhOGNhOTE5MTMyZDY4YTFmZWQ2YTVmYWNhMjY4Mzc0OCIKZGlmZiAtLWdpdCBhL21ldGEv
cmVjaXBlcy1kZXZ0b29scy9weXRob24vcHl0aG9uMy11di1idWlsZF8wLjEyLjIxLmJiIGIvbWV0
YS9yZWNpcGVzLWRldnRvb2xzL3B5dGhvbi9weXRob24zLXV2LWJ1aWxkXzAuMTIuMjQuYmIKc2lt
aWxhcml0eSBpbmRleCA5MiUKcmVuYW1lIGZyb20gbWV0YS9yZWNpcGVzLWRldnRvb2xzL3B5dGhv
bi9weXRob24zLXV2LWJ1aWxkXzAuMTIuMjEuYmIKcmVuYW1lIHRvIG1ldGEvcmVjaXBlcy1kZXZ0
b29scy9weXRob24vcHl0aG9uMy11di1idWlsZF8wLjEyLjI0LmJiCmluZGV4IGMyODA4MjAzZjku
LjQ3MTZjNjY0M2UgMTAwNjQ0Ci0tLSBhL21ldGEvcmVjaXBlcy1kZXZ0b29scy9weXRob24vcHl0
aG9uMy11di1idWlsZF8wLjEyLjIxLmJiCisrKyBiL21ldGEvcmVjaXBlcy1kZXZ0b29scy9weXRo
b24vcHl0aG9uMy11di1idWlsZF8wLjEyLjI0LmJiCkBAIC0xMSw3ICsxMSw3IEBAIExJQ19GSUxF
U19DSEtTVU0gPSAiZmlsZTovL0xJQ0VOU0UtQVBBQ0hFO21kNT04NmQzZjNhOTVjMzI0Yzk0Nzli
ZDg5ODY5NjhmNDMyNyBcCiAgICAgICAgICAgICAgICAgICAgIGZpbGU6Ly9jcmF0ZXMvdXYtcGVw
NTA4L0xpY2Vuc2UtQXBhY2hlO21kNT1lMjNmYWRkNmNlZWY4YzYxOGZjMWM2NTE5MWQ4NDZmYSBc
CiAgICAgICAgICAgICAgICAgICAgIGZpbGU6Ly9jcmF0ZXMvdXYtcGVwNTA4L0xpY2Vuc2UtQlNE
O21kNT1lZjdhNjAyN2RjNGMyMzg5YjlhZmFkN2U2OTAyNzRjNyIKIAotU1JDX1VSSVtzaGEyNTZz
dW1dID0gIjYxNmQxZWNjY2NhMzAwYjI0MGU2NWE4ODY0NGY4YzI5OTZiODU4ZmYwMzlmNzU5ZDcx
NzI0OWQyOGY5NGEyYTYiCitTUkNfVVJJW3NoYTI1NnN1bV0gPSAiN2Y2N2IxOGE4M2FmMjA5YjY2
YjFlYzNkNmVkNTY1NDA2ZGFiMmViZmVlN2JiZTM1OThiNTQxZTdkMzlhNWU1YSIKIAogcmVxdWly
ZSAke0JQTn0tY3JhdGVzLmluYwogCi0tIAoyLjQ3LjEKCg==

--===============1380989050488275645==--

