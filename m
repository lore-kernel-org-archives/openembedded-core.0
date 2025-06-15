Return-Path: <auh@yoctoproject.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 36275C77B73
	for <webhook@archiver.kernel.org>; Sun, 15 Jun 2025 13:14:52 +0000 (UTC)
Received: from a27-30.smtp-out.us-west-2.amazonses.com (a27-30.smtp-out.us-west-2.amazonses.com [54.240.27.30])
 by mx.groups.io with SMTP id smtpd.web11.8891.1749993284377014534
 for <openembedded-core@lists.openembedded.org>;
 Sun, 15 Jun 2025 06:14:49 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@yoctoproject.org header.s=j46ser6a2yusdzubpv7m7ewqgesde2ie header.b=l0z+s00N;
 dkim=pass header.i=@amazonses.com header.s=gdwg2y3kokkkj5a55z2ilkup5wp5hhxx header.b=Fq5hkWka;
 spf=pass (domain: us-west-2.amazonses.com, ip: 54.240.27.30, mailfrom: 0101019773ba72c3-57c95bcd-fbe0-401f-a972-5d8c2150ceb6-000000@us-west-2.amazonses.com)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/simple;
	s=j46ser6a2yusdzubpv7m7ewqgesde2ie; d=yoctoproject.org;
	t=1749993288;
	h=Content-Type:MIME-Version:From:To:Cc:Subject:Message-Id:Date;
	bh=mSj5MXUBnpsCj4/lI2EFFZq26RzlgBzKwb/oHrzBudY=;
	b=l0z+s00Nv8jHqiy59BTGb8EnKUQCudd2MS6cOLbF5ZPxksKIZkZwT0GNHI/fx2/n
	FQi9IlPUjSSshu0Z1tNTTSs87sFr6tPUo1hJOLnlrjln7jRi4J+Ff7iRloBfjOirJ38
	YqC4qmGvyZGjxy4wyShzW+3eeqQptTIM159i6M/Q=
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/simple;
	s=gdwg2y3kokkkj5a55z2ilkup5wp5hhxx; d=amazonses.com; t=1749993288;
	h=Content-Type:MIME-Version:From:To:Cc:Subject:Message-Id:Date:Feedback-ID;
	bh=mSj5MXUBnpsCj4/lI2EFFZq26RzlgBzKwb/oHrzBudY=;
	b=Fq5hkWkaUGRiGbnwRKYd0SN8rtmKMjGo4Xtp3UH5BuiV7Sw3yBfqjQc3tL4hVVoG
	jW7hASNIZGIH2iLjpMUOK45Z1J0Z2htTgnqIdOkXTsXw7RabFRGRzzPTGWPTgwk7cDe
	D/D4eFZBS0iZdDuFRicxvJmXPNSCN6hWUnela8Lo=
Content-Type: multipart/mixed; boundary="===============2261669345143996173=="
MIME-Version: 1.0
From: auh@yoctoproject.org
To: Tim Orling <tim.orling@konsulko.com>
Cc: openembedded-core@lists.openembedded.org
Subject: [AUH] python3-maturin: upgrading to 1.8.7 SUCCEEDED
Message-ID: <0101019773ba72c3-57c95bcd-fbe0-401f-a972-5d8c2150ceb6-000000@us-west-2.amazonses.com>
Date: Sun, 15 Jun 2025 13:14:48 +0000
Feedback-ID: ::1.us-west-2.9np3MYPs3fEaOBysGKSlUD4KtcmPijcmS9Az2Hwf7iQ=:AmazonSES
X-SES-Outgoing: 2025.06.15-54.240.27.30
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Sun, 15 Jun 2025 13:14:52 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/218684

--===============2261669345143996173==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit

Hello,

this email is a notification from the Auto Upgrade Helper
that the automatic attempt to upgrade the recipe(s) *python3-maturin* to *1.8.7* has Succeeded.

Next steps:
    - apply the patch: git am 0001-python3-maturin-upgrade-1.8.6-1.8.7.patch
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
From 7b3b596e07e23dba7dec1393816f865839ba9140 Mon Sep 17 00:00:00 2001
From: Upgrade Helper <auh@yoctoproject.org>
Date: Sun, 15 Jun 2025 08:31:33 +0000
Subject: [PATCH] python3-maturin: upgrade 1.8.6 -> 1.8.7

---
 .../python/python3-maturin-crates.inc         |  32 +-
 ...l-codes-on-riscv32gc-unknown-linux-g.patch | 110 -----
 .../python/python3-maturin_1.8.6.bb           |  44 --
 .../python/python3-maturin_1.8.7.bb           | 414 ++++++++++++++++++
 4 files changed, 438 insertions(+), 162 deletions(-)
 delete mode 100644 meta/recipes-devtools/python/python3-maturin/0001-Define-more-ioctl-codes-on-riscv32gc-unknown-linux-g.patch
 delete mode 100644 meta/recipes-devtools/python/python3-maturin_1.8.6.bb
 create mode 100644 meta/recipes-devtools/python/python3-maturin_1.8.7.bb

diff --git a/meta/recipes-devtools/python/python3-maturin-crates.inc b/meta/recipes-devtools/python/python3-maturin-crates.inc
index 5c939a09a8..ea7bd488e6 100644
--- a/meta/recipes-devtools/python/python3-maturin-crates.inc
+++ b/meta/recipes-devtools/python/python3-maturin-crates.inc
@@ -33,10 +33,10 @@ SRC_URI += " \
     crate://crates.io/cargo-config2/0.1.26 \
     crate://crates.io/cargo-options/0.7.4 \
     crate://crates.io/cargo-platform/0.1.8 \
-    crate://crates.io/cargo-xwin/0.18.4 \
+    crate://crates.io/cargo-xwin/0.18.6 \
     crate://crates.io/cargo-zigbuild/0.20.0 \
     crate://crates.io/cargo_metadata/0.19.0 \
-    crate://crates.io/cbindgen/0.28.0 \
+    crate://crates.io/cbindgen/0.29.0 \
     crate://crates.io/cc/1.2.16 \
     crate://crates.io/cfb/0.10.0 \
     crate://crates.io/cfg-if/1.0.0 \
@@ -105,12 +105,12 @@ SRC_URI += " \
     crate://crates.io/futures-util/0.3.31 \
     crate://crates.io/generic-array/0.14.7 \
     crate://crates.io/getrandom/0.2.15 \
+    crate://crates.io/getrandom/0.3.3 \
     crate://crates.io/glob/0.3.1 \
     crate://crates.io/globset/0.4.15 \
     crate://crates.io/goblin/0.9.2 \
     crate://crates.io/hashbrown/0.14.5 \
     crate://crates.io/hashbrown/0.15.2 \
-    crate://crates.io/heck/0.4.1 \
     crate://crates.io/heck/0.5.0 \
     crate://crates.io/home/0.5.9 \
     crate://crates.io/humantime/2.1.0 \
@@ -135,11 +135,12 @@ SRC_URI += " \
     crate://crates.io/itertools/0.12.1 \
     crate://crates.io/itertools/0.13.0 \
     crate://crates.io/itoa/1.0.11 \
+    crate://crates.io/jobserver/0.1.33 \
     crate://crates.io/js-sys/0.3.73 \
     crate://crates.io/keyring/2.3.3 \
     crate://crates.io/lazy_static/1.4.0 \
     crate://crates.io/lddtree/0.3.7 \
-    crate://crates.io/libc/0.2.167 \
+    crate://crates.io/libc/0.2.172 \
     crate://crates.io/libmimalloc-sys/0.1.39 \
     crate://crates.io/libredox/0.1.3 \
     crate://crates.io/linux-keyutils/0.2.4 \
@@ -148,6 +149,7 @@ SRC_URI += " \
     crate://crates.io/lock_api/0.4.12 \
     crate://crates.io/lockfree-object-pool/0.1.6 \
     crate://crates.io/log/0.4.22 \
+    crate://crates.io/lzma-rs/0.3.0 \
     crate://crates.io/lzma-sys/0.1.20 \
     crate://crates.io/lzxd/0.2.5 \
     crate://crates.io/mailparse/0.15.0 \
@@ -199,6 +201,7 @@ SRC_URI += " \
     crate://crates.io/python-pkginfo/0.6.5 \
     crate://crates.io/quote/1.0.37 \
     crate://crates.io/quoted_printable/0.5.0 \
+    crate://crates.io/r-efi/5.2.0 \
     crate://crates.io/rand/0.8.5 \
     crate://crates.io/rand_chacha/0.3.1 \
     crate://crates.io/rand_core/0.6.4 \
@@ -312,6 +315,7 @@ SRC_URI += " \
     crate://crates.io/wait-timeout/0.2.0 \
     crate://crates.io/walkdir/2.5.0 \
     crate://crates.io/wasi/0.11.0+wasi-snapshot-preview1 \
+    crate://crates.io/wasi/0.14.2+wasi-0.2.4 \
     crate://crates.io/wasm-bindgen/0.2.96 \
     crate://crates.io/wasm-bindgen-backend/0.2.96 \
     crate://crates.io/wasm-bindgen-macro/0.2.96 \
@@ -347,6 +351,7 @@ SRC_URI += " \
     crate://crates.io/winnow/0.5.40 \
     crate://crates.io/winnow/0.6.20 \
     crate://crates.io/winsafe/0.0.19 \
+    crate://crates.io/wit-bindgen-rt/0.39.0 \
     crate://crates.io/write16/1.0.0 \
     crate://crates.io/writeable/0.5.5 \
     crate://crates.io/xattr/1.3.1 \
@@ -364,6 +369,9 @@ SRC_URI += " \
     crate://crates.io/zerovec-derive/0.10.3 \
     crate://crates.io/zip/2.3.0 \
     crate://crates.io/zopfli/0.8.1 \
+    crate://crates.io/zstd/0.13.3 \
+    crate://crates.io/zstd-safe/7.2.4 \
+    crate://crates.io/zstd-sys/2.0.15+zstd.1.5.7 \
 "
 
 SRC_URI[adler2-2.0.0.sha256sum] = "512761e0bb2578dd7380c6baaa0f4ce03e84f95e960231d1dec8bf4d7d6e2627"
@@ -397,10 +405,10 @@ SRC_URI[camino-1.1.9.sha256sum] = "8b96ec4966b5813e2c0507c1f86115c8c5abaadc39808
 SRC_URI[cargo-config2-0.1.26.sha256sum] = "d83ce0be8bd1479e5de6202def660e6c7e27e4e0599bffa4fed05bd380ec2ede"
 SRC_URI[cargo-options-0.7.4.sha256sum] = "f3540247c0a37a76eb324acc238dc617786ea22c43b95da560c82a8f2714321f"
 SRC_URI[cargo-platform-0.1.8.sha256sum] = "24b1f0365a6c6bb4020cd05806fd0d33c44d38046b8bd7f0e40814b9763cabfc"
-SRC_URI[cargo-xwin-0.18.4.sha256sum] = "60f1954e4ffa0f4c47b3df5e6e9508706d8dcaa56152cd672dcee02930ba0326"
+SRC_URI[cargo-xwin-0.18.6.sha256sum] = "5dff83aad332bd6ee29072dd874b48892cd22c58e233c25735eb4417b3999685"
 SRC_URI[cargo-zigbuild-0.20.0.sha256sum] = "3f6e9e856390d5b0a859acaeda16528f8a61c964bdb894c3216c254908f1c2ea"
 SRC_URI[cargo_metadata-0.19.0.sha256sum] = "afc309ed89476c8957c50fb818f56fe894db857866c3e163335faa91dc34eb85"
-SRC_URI[cbindgen-0.28.0.sha256sum] = "eadd868a2ce9ca38de7eeafdcec9c7065ef89b42b32f0839278d55f35c54d1ff"
+SRC_URI[cbindgen-0.29.0.sha256sum] = "975982cdb7ad6a142be15bdf84aea7ec6a9e5d4d797c004d43185b24cfe4e684"
 SRC_URI[cc-1.2.16.sha256sum] = "be714c154be609ec7f5dad223a33bf1482fff90472de28f7362806e6d4832b8c"
 SRC_URI[cfb-0.10.0.sha256sum] = "d8a4f8e55be323b378facfcf1f06aa97f6ec17cf4ac84fb17325093aaf62da41"
 SRC_URI[cfg-if-1.0.0.sha256sum] = "baf1de4339761588bc0619e3cbc0120ee582ebb74b53b4efbf79117bd2da40fd"
@@ -469,12 +477,12 @@ SRC_URI[futures-timer-3.0.3.sha256sum] = "f288b0a4f20f9a56b5d1da57e2227c661b7b16
 SRC_URI[futures-util-0.3.31.sha256sum] = "9fa08315bb612088cc391249efdc3bc77536f16c91f6cf495e6fbe85b20a4a81"
 SRC_URI[generic-array-0.14.7.sha256sum] = "85649ca51fd72272d7821adaf274ad91c288277713d9c18820d8499a7ff69e9a"
 SRC_URI[getrandom-0.2.15.sha256sum] = "c4567c8db10ae91089c99af84c68c38da3ec2f087c3f82960bcdbf3656b6f4d7"
+SRC_URI[getrandom-0.3.3.sha256sum] = "26145e563e54f2cadc477553f1ec5ee650b00862f0a58bcd12cbdc5f0ea2d2f4"
 SRC_URI[glob-0.3.1.sha256sum] = "d2fabcfbdc87f4758337ca535fb41a6d701b65693ce38287d856d1674551ec9b"
 SRC_URI[globset-0.4.15.sha256sum] = "15f1ce686646e7f1e19bf7d5533fe443a45dbfb990e00629110797578b42fb19"
 SRC_URI[goblin-0.9.2.sha256sum] = "53ab3f32d1d77146981dea5d6b1e8fe31eedcb7013e5e00d6ccd1259a4b4d923"
 SRC_URI[hashbrown-0.14.5.sha256sum] = "e5274423e17b7c9fc20b6e7e208532f9b19825d82dfd615708b70edd83df41f1"
 SRC_URI[hashbrown-0.15.2.sha256sum] = "bf151400ff0baff5465007dd2f3e717f3fe502074ca563069ce3a6629d07b289"
-SRC_URI[heck-0.4.1.sha256sum] = "95505c38b4572b2d910cecb0281560f54b440a19336cbbcb27bf6ce6adc6f5a8"
 SRC_URI[heck-0.5.0.sha256sum] = "2304e00983f87ffb38b55b444b5e3b60a884b5d30c0fca7d82fe33449bbe55ea"
 SRC_URI[home-0.5.9.sha256sum] = "e3d1354bf6b7235cb4a0576c2619fd4ed18183f689b12b006a0ee7329eeff9a5"
 SRC_URI[humantime-2.1.0.sha256sum] = "9a3a5bfb195931eeb336b2a7b4d761daec841b97f947d34394601737a7bba5e4"
@@ -499,11 +507,12 @@ SRC_URI[is_terminal_polyfill-1.70.0.sha256sum] = "f8478577c03552c21db0e2724ffb89
 SRC_URI[itertools-0.12.1.sha256sum] = "ba291022dbbd398a455acf126c1e341954079855bc60dfdda641363bd6922569"
 SRC_URI[itertools-0.13.0.sha256sum] = "413ee7dfc52ee1a4949ceeb7dbc8a33f2d6c088194d9f922fb8318faf1f01186"
 SRC_URI[itoa-1.0.11.sha256sum] = "49f1f14873335454500d59611f1cf4a4b0f786f9ac11f4312a78e4cf2566695b"
+SRC_URI[jobserver-0.1.33.sha256sum] = "38f262f097c174adebe41eb73d66ae9c06b2844fb0da69969647bbddd9b0538a"
 SRC_URI[js-sys-0.3.73.sha256sum] = "fb15147158e79fd8b8afd0252522769c4f48725460b37338544d8379d94fc8f9"
 SRC_URI[keyring-2.3.3.sha256sum] = "363387f0019d714aa60cc30ab4fe501a747f4c08fc58f069dd14be971bd495a0"
 SRC_URI[lazy_static-1.4.0.sha256sum] = "e2abad23fbc42b3700f2f279844dc832adb2b2eb069b2df918f455c4e18cc646"
 SRC_URI[lddtree-0.3.7.sha256sum] = "e0779ac94bd7b6ab781fa12388dbf79ac45ec1fa433e7d25521753be8227b08e"
-SRC_URI[libc-0.2.167.sha256sum] = "09d6582e104315a817dff97f75133544b2e094ee22447d2acf4a74e189ba06fc"
+SRC_URI[libc-0.2.172.sha256sum] = "d750af042f7ef4f724306de029d18836c26c1765a54a6a3f094cbd23a7267ffa"
 SRC_URI[libmimalloc-sys-0.1.39.sha256sum] = "23aa6811d3bd4deb8a84dde645f943476d13b248d818edcf8ce0b2f37f036b44"
 SRC_URI[libredox-0.1.3.sha256sum] = "c0ff37bd590ca25063e35af745c343cb7a0271906fb7b37e4813e8f79f00268d"
 SRC_URI[linux-keyutils-0.2.4.sha256sum] = "761e49ec5fd8a5a463f9b84e877c373d888935b71c6be78f3767fe2ae6bed18e"
@@ -512,6 +521,7 @@ SRC_URI[litemap-0.7.3.sha256sum] = "643cb0b8d4fcc284004d5fd0d67ccf61dfffadb7f75e
 SRC_URI[lock_api-0.4.12.sha256sum] = "07af8b9cdd281b7915f413fa73f29ebd5d55d0d3f0155584dade1ff18cea1b17"
 SRC_URI[lockfree-object-pool-0.1.6.sha256sum] = "9374ef4228402d4b7e403e5838cb880d9ee663314b0a900d5a6aabf0c213552e"
 SRC_URI[log-0.4.22.sha256sum] = "a7a70ba024b9dc04c27ea2f0c0548feb474ec5c54bba33a7f72f873a39d07b24"
+SRC_URI[lzma-rs-0.3.0.sha256sum] = "297e814c836ae64db86b36cf2a557ba54368d03f6afcd7d947c266692f71115e"
 SRC_URI[lzma-sys-0.1.20.sha256sum] = "5fda04ab3764e6cde78b9974eec4f779acaba7c4e84b36eca3cf77c581b85d27"
 SRC_URI[lzxd-0.2.5.sha256sum] = "5de7336a183103429ad66d11d56d8bdc9c4a2916f6b85a8f11e5b127bde12001"
 SRC_URI[mailparse-0.15.0.sha256sum] = "3da03d5980411a724e8aaf7b61a7b5e386ec55a7fb49ee3d0ff79efc7e5e7c7e"
@@ -563,6 +573,7 @@ SRC_URI[pyproject-toml-0.13.4.sha256sum] = "643af57c3f36ba90a8b53e972727d8092f74
 SRC_URI[python-pkginfo-0.6.5.sha256sum] = "c21f58880fc45e91d29b2f639ab4051aaa6a2b054534c2d343a953347d0dd600"
 SRC_URI[quote-1.0.37.sha256sum] = "b5b9d34b8991d19d98081b46eacdd8eb58c6f2b201139f7c5f643cc155a633af"
 SRC_URI[quoted_printable-0.5.0.sha256sum] = "79ec282e887b434b68c18fe5c121d38e72a5cf35119b59e54ec5b992ea9c8eb0"
+SRC_URI[r-efi-5.2.0.sha256sum] = "74765f6d916ee2faa39bc8e68e4f3ed8949b48cccdac59983d287a7cb71ce9c5"
 SRC_URI[rand-0.8.5.sha256sum] = "34af8d1a0e25924bc5b7c43c079c942339d8f0a8b57c39049bef581b46327404"
 SRC_URI[rand_chacha-0.3.1.sha256sum] = "e6c10a63a0fa32252be49d21e7709d4d4baf8d231c2dbce1eaa8141b9b127d88"
 SRC_URI[rand_core-0.6.4.sha256sum] = "ec0be4795e2f6a28069bec0b5ff3e2ac9bafc99e6a9a7dc3547996c5c816922c"
@@ -676,6 +687,7 @@ SRC_URI[versions-6.2.0.sha256sum] = "38a8931f8d167b6448076020e70b9de46dcf5ea1731
 SRC_URI[wait-timeout-0.2.0.sha256sum] = "9f200f5b12eb75f8c1ed65abd4b2db8a6e1b138a20de009dacee265a2498f3f6"
 SRC_URI[walkdir-2.5.0.sha256sum] = "29790946404f91d9c5d06f9874efddea1dc06c5efe94541a7d6863108e3a5e4b"
 SRC_URI[wasi-0.11.0+wasi-snapshot-preview1.sha256sum] = "9c8d87e72b64a3b4db28d11ce29237c246188f4f51057d65a7eab63b7987e423"
+SRC_URI[wasi-0.14.2+wasi-0.2.4.sha256sum] = "9683f9a5a998d873c0d21fcbe3c083009670149a8fab228644b8bd36b2c48cb3"
 SRC_URI[wasm-bindgen-0.2.96.sha256sum] = "21d3b25c3ea1126a2ad5f4f9068483c2af1e64168f847abe863a526b8dbfe00b"
 SRC_URI[wasm-bindgen-backend-0.2.96.sha256sum] = "52857d4c32e496dc6537646b5b117081e71fd2ff06de792e3577a150627db283"
 SRC_URI[wasm-bindgen-macro-0.2.96.sha256sum] = "920b0ffe069571ebbfc9ddc0b36ba305ef65577c94b06262ed793716a1afd981"
@@ -711,6 +723,7 @@ SRC_URI[windows_x86_64_msvc-0.52.5.sha256sum] = "bec47e5bfd1bff0eeaf6d8b485cc107
 SRC_URI[winnow-0.5.40.sha256sum] = "f593a95398737aeed53e489c785df13f3618e41dbcd6718c6addbf1395aa6876"
 SRC_URI[winnow-0.6.20.sha256sum] = "36c1fec1a2bb5866f07c25f68c26e565c4c200aebb96d7e55710c19d3e8ac49b"
 SRC_URI[winsafe-0.0.19.sha256sum] = "d135d17ab770252ad95e9a872d365cf3090e3be864a34ab46f48555993efc904"
+SRC_URI[wit-bindgen-rt-0.39.0.sha256sum] = "6f42320e61fe2cfd34354ecb597f86f413484a798ba44a8ca1165c58d42da6c1"
 SRC_URI[write16-1.0.0.sha256sum] = "d1890f4022759daae28ed4fe62859b1236caebfc61ede2f63ed4e695f3f6d936"
 SRC_URI[writeable-0.5.5.sha256sum] = "1e9df38ee2d2c3c5948ea468a8406ff0db0b29ae1ffde1bcf20ef305bcc95c51"
 SRC_URI[xattr-1.3.1.sha256sum] = "8da84f1a25939b27f6820d92aed108f83ff920fdf11a7b19366c27c4cda81d4f"
@@ -728,3 +741,6 @@ SRC_URI[zerovec-0.10.4.sha256sum] = "aa2b893d79df23bfb12d5461018d408ea19dfafe76c
 SRC_URI[zerovec-derive-0.10.3.sha256sum] = "6eafa6dfb17584ea3e2bd6e76e0cc15ad7af12b09abdd1ca55961bed9b1063c6"
 SRC_URI[zip-2.3.0.sha256sum] = "84e9a772a54b54236b9b744aaaf8d7be01b4d6e99725523cb82cb32d1c81b1d7"
 SRC_URI[zopfli-0.8.1.sha256sum] = "e5019f391bac5cf252e93bbcc53d039ffd62c7bfb7c150414d61369afe57e946"
+SRC_URI[zstd-0.13.3.sha256sum] = "e91ee311a569c327171651566e07972200e76fcfe2242a4fa446149a3881c08a"
+SRC_URI[zstd-safe-7.2.4.sha256sum] = "8f49c4d5f0abb602a93fb8736af2a4f4dd9512e36f7f570d66e65ff867ed3b9d"
+SRC_URI[zstd-sys-2.0.15+zstd.1.5.7.sha256sum] = "eb81183ddd97d0c74cedf1d50d85c8d08c1b8b68ee863bdee9e706eedba1a237"
diff --git a/meta/recipes-devtools/python/python3-maturin/0001-Define-more-ioctl-codes-on-riscv32gc-unknown-linux-g.patch b/meta/recipes-devtools/python/python3-maturin/0001-Define-more-ioctl-codes-on-riscv32gc-unknown-linux-g.patch
deleted file mode 100644
index aceefa7967..0000000000
--- a/meta/recipes-devtools/python/python3-maturin/0001-Define-more-ioctl-codes-on-riscv32gc-unknown-linux-g.patch
+++ /dev/null
@@ -1,110 +0,0 @@
-From 4b439b0953573e0383da7e092b1f516ba21f3398 Mon Sep 17 00:00:00 2001
-From: Dan Gohman <dev@sunfishcode.online>
-Date: Sun, 6 Apr 2025 05:22:49 -0700
-Subject: [PATCH] Define Linux ioctl codes on more architectures.
-
-Define ioctl codes including `FICLONE` and `FS_IOC32_GETVERSION` using
-`_IOR` and `_IOW` so that they're automatically supported on all
-architectures, including riscv32gc-unknown-linux-gnu.
-
-Upstream-Status: Backport [https://github.com/rust-lang/libc/pull/4382/]
-Signed-off-by: Khem Raj <raj.khem@gmail.com>
----
- src/unix/linux_like/linux/arch/generic/mod.rs | 75 ++++---------------
- 1 file changed, 15 insertions(+), 60 deletions(-)
-
---- a/src/unix/linux_like/linux/arch/generic/mod.rs
-+++ b/src/unix/linux_like/linux/arch/generic/mod.rs
-@@ -1,5 +1,5 @@
- use crate::prelude::*;
--use crate::Ioctl;
-+use crate::{Ioctl, _IOR, _IOW};
- 
- s! {
-     pub struct termios2 {
-@@ -116,21 +116,8 @@ cfg_if! {
- // pub const SO_PREFER_BUSY_POLL: c_int = 69;
- // pub const SO_BUSY_POLL_BUDGET: c_int = 70;
- 
--cfg_if! {
--    if #[cfg(any(
--        target_arch = "x86",
--        target_arch = "x86_64",
--        target_arch = "arm",
--        target_arch = "aarch64",
--        target_arch = "riscv64",
--        target_arch = "s390x",
--        target_arch = "csky",
--        target_arch = "loongarch64"
--    ))] {
--        pub const FICLONE: c_ulong = 0x40049409;
--        pub const FICLONERANGE: c_ulong = 0x4020940D;
--    }
--}
-+pub const FICLONE: Ioctl = _IOW::<c_int>(0x94, 9) as Ioctl;
-+pub const FICLONERANGE: Ioctl = _IOW::<crate::file_clone_range>(0x94, 13) as Ioctl;
- 
- // Defined in unix/linux_like/mod.rs
- // pub const SCM_TIMESTAMP: c_int = SO_TIMESTAMP;
-@@ -248,49 +235,18 @@ pub const TUNGETVNETBE: Ioctl = 0x800454
- pub const TUNSETSTEERINGEBPF: Ioctl = 0x800454e0;
- pub const TUNSETFILTEREBPF: Ioctl = 0x800454e1;
- 
--cfg_if! {
--    // Those type are constructed using the _IOC macro
--    // DD-SS_SSSS_SSSS_SSSS-TTTT_TTTT-NNNN_NNNN
--    // where D stands for direction (either None (00), Read (01) or Write (11))
--    // where S stands for size (int, long, struct...)
--    // where T stands for type ('f','v','X'...)
--    // where N stands for NR (NumbeR)
--    if #[cfg(any(
--        target_arch = "x86",
--        target_arch = "arm",
--        target_arch = "csky"
--    ))] {
--        pub const FS_IOC_GETFLAGS: Ioctl = 0x80046601;
--        pub const FS_IOC_SETFLAGS: Ioctl = 0x40046602;
--        pub const FS_IOC_GETVERSION: Ioctl = 0x80047601;
--        pub const FS_IOC_SETVERSION: Ioctl = 0x40047602;
--        pub const FS_IOC32_GETFLAGS: Ioctl = 0x80046601;
--        pub const FS_IOC32_SETFLAGS: Ioctl = 0x40046602;
--        pub const FS_IOC32_GETVERSION: Ioctl = 0x80047601;
--        pub const FS_IOC32_SETVERSION: Ioctl = 0x40047602;
--        pub const TUNATTACHFILTER: Ioctl = 0x400854d5;
--        pub const TUNDETACHFILTER: Ioctl = 0x400854d6;
--        pub const TUNGETFILTER: Ioctl = 0x800854db;
--    } else if #[cfg(any(
--        target_arch = "x86_64",
--        target_arch = "riscv64",
--        target_arch = "aarch64",
--        target_arch = "s390x",
--        target_arch = "loongarch64"
--    ))] {
--        pub const FS_IOC_GETFLAGS: Ioctl = 0x80086601;
--        pub const FS_IOC_SETFLAGS: Ioctl = 0x40086602;
--        pub const FS_IOC_GETVERSION: Ioctl = 0x80087601;
--        pub const FS_IOC_SETVERSION: Ioctl = 0x40087602;
--        pub const FS_IOC32_GETFLAGS: Ioctl = 0x80046601;
--        pub const FS_IOC32_SETFLAGS: Ioctl = 0x40046602;
--        pub const FS_IOC32_GETVERSION: Ioctl = 0x80047601;
--        pub const FS_IOC32_SETVERSION: Ioctl = 0x40047602;
--        pub const TUNATTACHFILTER: Ioctl = 0x401054d5;
--        pub const TUNDETACHFILTER: Ioctl = 0x401054d6;
--        pub const TUNGETFILTER: Ioctl = 0x801054db;
--    }
--}
-+pub const FS_IOC_GETFLAGS: Ioctl = _IOR::<c_long>('f' as u32, 1) as Ioctl;
-+pub const FS_IOC_SETFLAGS: Ioctl = _IOW::<c_long>('f' as u32, 2) as Ioctl;
-+pub const FS_IOC_GETVERSION: Ioctl = _IOR::<c_long>('v' as u32, 1) as Ioctl;
-+pub const FS_IOC_SETVERSION: Ioctl = _IOW::<c_long>('v' as u32, 2) as Ioctl;
-+pub const FS_IOC32_GETFLAGS: Ioctl = _IOR::<c_int>('f' as u32, 1) as Ioctl;
-+pub const FS_IOC32_SETFLAGS: Ioctl = _IOW::<c_int>('f' as u32, 2) as Ioctl;
-+pub const FS_IOC32_GETVERSION: Ioctl = _IOR::<c_int>('v' as u32, 1) as Ioctl;
-+pub const FS_IOC32_SETVERSION: Ioctl = _IOW::<c_int>('v' as u32, 2) as Ioctl;
-+
-+pub const TUNATTACHFILTER: Ioctl = _IOW::<crate::sock_fprog>('T' as u32, 213) as Ioctl;
-+pub const TUNDETACHFILTER: Ioctl = _IOW::<crate::sock_fprog>('T' as u32, 214) as Ioctl;
-+pub const TUNGETFILTER: Ioctl = _IOR::<crate::sock_fprog>('T' as u32, 219) as Ioctl;
- 
- cfg_if! {
-     if #[cfg(any(target_arch = "arm", target_arch = "s390x"))] {
diff --git a/meta/recipes-devtools/python/python3-maturin_1.8.6.bb b/meta/recipes-devtools/python/python3-maturin_1.8.6.bb
deleted file mode 100644
index ab509331c3..0000000000
--- a/meta/recipes-devtools/python/python3-maturin_1.8.6.bb
+++ /dev/null
@@ -1,44 +0,0 @@
-SUMMARY = "Build and publish crates with pyo3, rust-cpython, cffi bindings and rust binaries as python packages"
-HOMEPAGE = "https://github.com/pyo3/maturin"
-SECTION = "devel/python"
-LICENSE = "MIT | Apache-2.0"
-LIC_FILES_CHKSUM = "file://license-apache;md5=1836efb2eb779966696f473ee8540542 \
-                    file://license-mit;md5=85fd3b67069cff784d98ebfc7d5c0797"
-
-# This is needed until Cargo.lock has libc-0.2.172+
-SRC_URI += "file://0001-Define-more-ioctl-codes-on-riscv32gc-unknown-linux-g.patch;patchdir=${CARGO_VENDORING_DIRECTORY}/libc-0.2.167"
-SRC_URI[sha256sum] = "0e0dc2e0bfaa2e1bd238e0236cf8a2b7e2250ccaa29c1aa8d0e61fa664b0289d"
-
-S = "${WORKDIR}/maturin-${PV}"
-
-CFLAGS += "-ffile-prefix-map=${CARGO_HOME}=${TARGET_DBGSRC_DIR}/cargo_home"
-
-DEPENDS += "\
-    python3-setuptools-rust-native \
-    python3-semantic-version-native \
-    python3-setuptools-rust \
-"
-
-require ${BPN}-crates.inc
-
-inherit pypi cargo-update-recipe-crates python_pyo3 python_setuptools_build_meta
-
-do_configure() {
-    python_pyo3_do_configure
-    cargo_common_do_configure
-    python_pep517_do_configure
-}
-
-RDEPENDS:${PN} += "\
-    cargo \
-    python3-json \
-    rust \
-"
-
-RRECOMMENDS:${PN} += "\
-    python3-ensurepip \
-    python3-pip \
-    python3-venv \
-"
-
-BBCLASSEXTEND = "native nativesdk"
diff --git a/meta/recipes-devtools/python/python3-maturin_1.8.7.bb b/meta/recipes-devtools/python/python3-maturin_1.8.7.bb
new file mode 100644
index 0000000000..d6a6144c1e
--- /dev/null
+++ b/meta/recipes-devtools/python/python3-maturin_1.8.7.bb
@@ -0,0 +1,414 @@
+SUMMARY = "Build and publish crates with pyo3, rust-cpython, cffi bindings and rust binaries as python packages"
+HOMEPAGE = "https://github.com/pyo3/maturin"
+SECTION = "devel/python"
+LICENSE = "MIT | Apache-2.0"
+LIC_FILES_CHKSUM = "file://license-apache;md5=1836efb2eb779966696f473ee8540542 \
+                    file://license-mit;md5=85fd3b67069cff784d98ebfc7d5c0797"
+
+# This is needed until Cargo.lock has libc-0.2.172+
+SRC_URI += "crate://crates.io/adler2/2.0.0 \
+           crate://crates.io/ahash/0.8.11 \
+           crate://crates.io/aho-corasick/1.1.3 \
+           crate://crates.io/allocator-api2/0.2.18 \
+           crate://crates.io/anstream/0.6.14 \
+           crate://crates.io/anstyle/1.0.7 \
+           crate://crates.io/anstyle-parse/0.2.4 \
+           crate://crates.io/anstyle-query/1.1.0 \
+           crate://crates.io/anstyle-wincon/3.0.3 \
+           crate://crates.io/anyhow/1.0.89 \
+           crate://crates.io/arbitrary/1.4.1 \
+           crate://crates.io/autocfg/1.3.0 \
+           crate://crates.io/automod/1.0.14 \
+           crate://crates.io/base64/0.21.7 \
+           crate://crates.io/base64/0.22.1 \
+           crate://crates.io/bitflags/1.3.2 \
+           crate://crates.io/bitflags/2.5.0 \
+           crate://crates.io/block-buffer/0.10.4 \
+           crate://crates.io/boxcar/0.2.8 \
+           crate://crates.io/bstr/1.10.0 \
+           crate://crates.io/bumpalo/3.16.0 \
+           crate://crates.io/byteorder/1.5.0 \
+           crate://crates.io/bytes/1.9.0 \
+           crate://crates.io/bytesize/1.3.0 \
+           crate://crates.io/bzip2/0.5.2 \
+           crate://crates.io/bzip2-sys/0.1.13+1.0.8 \
+           crate://crates.io/cab/0.6.0 \
+           crate://crates.io/camino/1.1.9 \
+           crate://crates.io/cargo-config2/0.1.26 \
+           crate://crates.io/cargo-options/0.7.4 \
+           crate://crates.io/cargo-platform/0.1.8 \
+           crate://crates.io/cargo-xwin/0.18.6 \
+           crate://crates.io/cargo-zigbuild/0.20.0 \
+           crate://crates.io/cargo_metadata/0.19.0 \
+           crate://crates.io/cbindgen/0.29.0 \
+           crate://crates.io/cc/1.2.16 \
+           crate://crates.io/cfb/0.10.0 \
+           crate://crates.io/cfg-if/1.0.0 \
+           crate://crates.io/charset/0.1.5 \
+           crate://crates.io/chumsky/0.9.3 \
+           crate://crates.io/clap/4.5.7 \
+           crate://crates.io/clap_builder/4.5.7 \
+           crate://crates.io/clap_complete/4.5.5 \
+           crate://crates.io/clap_complete_command/0.6.1 \
+           crate://crates.io/clap_complete_nushell/4.5.2 \
+           crate://crates.io/clap_derive/4.5.5 \
+           crate://crates.io/clap_lex/0.7.1 \
+           crate://crates.io/cli-table/0.4.7 \
+           crate://crates.io/colorchoice/1.0.1 \
+           crate://crates.io/configparser/3.1.0 \
+           crate://crates.io/console/0.15.8 \
+           crate://crates.io/content_inspector/0.2.4 \
+           crate://crates.io/core-foundation/0.9.4 \
+           crate://crates.io/core-foundation-sys/0.8.6 \
+           crate://crates.io/cpufeatures/0.2.12 \
+           crate://crates.io/crc/3.2.1 \
+           crate://crates.io/crc-catalog/2.4.0 \
+           crate://crates.io/crc32fast/1.4.2 \
+           crate://crates.io/crossbeam-channel/0.5.15 \
+           crate://crates.io/crossbeam-deque/0.8.5 \
+           crate://crates.io/crossbeam-epoch/0.9.18 \
+           crate://crates.io/crossbeam-utils/0.8.20 \
+           crate://crates.io/crypto-common/0.1.6 \
+           crate://crates.io/data-encoding/2.6.0 \
+           crate://crates.io/deranged/0.3.11 \
+           crate://crates.io/derive_arbitrary/1.4.1 \
+           crate://crates.io/dialoguer/0.11.0 \
+           crate://crates.io/diff/0.1.13 \
+           crate://crates.io/digest/0.10.7 \
+           crate://crates.io/dirs/5.0.1 \
+           crate://crates.io/dirs-sys/0.4.1 \
+           crate://crates.io/displaydoc/0.2.5 \
+           crate://crates.io/dissimilar/1.0.9 \
+           crate://crates.io/dunce/1.0.5 \
+           crate://crates.io/dyn-clone/1.0.17 \
+           crate://crates.io/either/1.13.0 \
+           crate://crates.io/encode_unicode/0.3.6 \
+           crate://crates.io/encoding_rs/0.8.34 \
+           crate://crates.io/equivalent/1.0.1 \
+           crate://crates.io/errno/0.3.9 \
+           crate://crates.io/expect-test/1.5.0 \
+           crate://crates.io/fastrand/2.1.0 \
+           crate://crates.io/fat-macho/0.4.9 \
+           crate://crates.io/filetime/0.2.23 \
+           crate://crates.io/flate2/1.0.33 \
+           crate://crates.io/fnv/1.0.7 \
+           crate://crates.io/foreign-types/0.3.2 \
+           crate://crates.io/foreign-types-shared/0.1.1 \
+           crate://crates.io/form_urlencoded/1.2.1 \
+           crate://crates.io/fs-err/3.0.0 \
+           crate://crates.io/fs4/0.12.0 \
+           crate://crates.io/futures/0.3.30 \
+           crate://crates.io/futures-channel/0.3.31 \
+           crate://crates.io/futures-core/0.3.31 \
+           crate://crates.io/futures-executor/0.3.30 \
+           crate://crates.io/futures-io/0.3.31 \
+           crate://crates.io/futures-macro/0.3.31 \
+           crate://crates.io/futures-sink/0.3.31 \
+           crate://crates.io/futures-task/0.3.31 \
+           crate://crates.io/futures-timer/3.0.3 \
+           crate://crates.io/futures-util/0.3.31 \
+           crate://crates.io/generic-array/0.14.7 \
+           crate://crates.io/getrandom/0.2.15 \
+           crate://crates.io/getrandom/0.3.3 \
+           crate://crates.io/glob/0.3.1 \
+           crate://crates.io/globset/0.4.15 \
+           crate://crates.io/goblin/0.9.2 \
+           crate://crates.io/hashbrown/0.14.5 \
+           crate://crates.io/hashbrown/0.15.2 \
+           crate://crates.io/heck/0.5.0 \
+           crate://crates.io/home/0.5.9 \
+           crate://crates.io/humantime/2.1.0 \
+           crate://crates.io/humantime-serde/1.1.1 \
+           crate://crates.io/icu_collections/1.5.0 \
+           crate://crates.io/icu_locid/1.5.0 \
+           crate://crates.io/icu_locid_transform/1.5.0 \
+           crate://crates.io/icu_locid_transform_data/1.5.0 \
+           crate://crates.io/icu_normalizer/1.5.0 \
+           crate://crates.io/icu_normalizer_data/1.5.0 \
+           crate://crates.io/icu_properties/1.5.1 \
+           crate://crates.io/icu_properties_data/1.5.0 \
+           crate://crates.io/icu_provider/1.5.0 \
+           crate://crates.io/icu_provider_macros/1.5.0 \
+           crate://crates.io/idna/1.0.3 \
+           crate://crates.io/idna_adapter/1.2.0 \
+           crate://crates.io/ignore/0.4.23 \
+           crate://crates.io/indexmap/2.6.0 \
+           crate://crates.io/indicatif/0.17.9 \
+           crate://crates.io/indoc/2.0.5 \
+           crate://crates.io/is_terminal_polyfill/1.70.0 \
+           crate://crates.io/itertools/0.12.1 \
+           crate://crates.io/itertools/0.13.0 \
+           crate://crates.io/itoa/1.0.11 \
+           crate://crates.io/jobserver/0.1.33 \
+           crate://crates.io/js-sys/0.3.73 \
+           crate://crates.io/keyring/2.3.3 \
+           crate://crates.io/lazy_static/1.4.0 \
+           crate://crates.io/lddtree/0.3.7 \
+           crate://crates.io/libc/0.2.172 \
+           crate://crates.io/libmimalloc-sys/0.1.39 \
+           crate://crates.io/libredox/0.1.3 \
+           crate://crates.io/linux-keyutils/0.2.4 \
+           crate://crates.io/linux-raw-sys/0.4.14 \
+           crate://crates.io/litemap/0.7.3 \
+           crate://crates.io/lock_api/0.4.12 \
+           crate://crates.io/lockfree-object-pool/0.1.6 \
+           crate://crates.io/log/0.4.22 \
+           crate://crates.io/lzma-rs/0.3.0 \
+           crate://crates.io/lzma-sys/0.1.20 \
+           crate://crates.io/lzxd/0.2.5 \
+           crate://crates.io/mailparse/0.15.0 \
+           crate://crates.io/matchers/0.1.0 \
+           crate://crates.io/memchr/2.7.4 \
+           crate://crates.io/mimalloc/0.1.43 \
+           crate://crates.io/mime/0.3.17 \
+           crate://crates.io/mime_guess/2.0.4 \
+           crate://crates.io/minijinja/2.5.0 \
+           crate://crates.io/minimal-lexical/0.2.1 \
+           crate://crates.io/miniz_oxide/0.8.0 \
+           crate://crates.io/msi/0.8.0 \
+           crate://crates.io/multipart/0.18.0 \
+           crate://crates.io/native-tls/0.2.12 \
+           crate://crates.io/nom/7.1.3 \
+           crate://crates.io/normalize-line-endings/0.3.0 \
+           crate://crates.io/normpath/1.2.0 \
+           crate://crates.io/nu-ansi-term/0.46.0 \
+           crate://crates.io/num-conv/0.1.0 \
+           crate://crates.io/number_prefix/0.4.0 \
+           crate://crates.io/once_cell/1.20.2 \
+           crate://crates.io/openssl/0.10.72 \
+           crate://crates.io/openssl-macros/0.1.1 \
+           crate://crates.io/openssl-probe/0.1.5 \
+           crate://crates.io/openssl-sys/0.9.107 \
+           crate://crates.io/option-ext/0.2.0 \
+           crate://crates.io/os_pipe/1.2.0 \
+           crate://crates.io/overload/0.1.1 \
+           crate://crates.io/parking_lot/0.12.3 \
+           crate://crates.io/parking_lot_core/0.9.10 \
+           crate://crates.io/paste/1.0.15 \
+           crate://crates.io/path-slash/0.2.1 \
+           crate://crates.io/pep440_rs/0.7.3 \
+           crate://crates.io/pep508_rs/0.9.2 \
+           crate://crates.io/percent-encoding/2.3.1 \
+           crate://crates.io/pin-project-lite/0.2.15 \
+           crate://crates.io/pin-utils/0.1.0 \
+           crate://crates.io/pkg-config/0.3.30 \
+           crate://crates.io/plain/0.2.3 \
+           crate://crates.io/platform-info/2.0.3 \
+           crate://crates.io/portable-atomic/1.6.0 \
+           crate://crates.io/powerfmt/0.2.0 \
+           crate://crates.io/ppv-lite86/0.2.17 \
+           crate://crates.io/pretty_assertions/1.4.1 \
+           crate://crates.io/proc-macro-crate/3.1.0 \
+           crate://crates.io/proc-macro2/1.0.92 \
+           crate://crates.io/psm/0.1.21 \
+           crate://crates.io/pyproject-toml/0.13.4 \
+           crate://crates.io/python-pkginfo/0.6.5 \
+           crate://crates.io/quote/1.0.37 \
+           crate://crates.io/quoted_printable/0.5.0 \
+           crate://crates.io/r-efi/5.2.0 \
+           crate://crates.io/rand/0.8.5 \
+           crate://crates.io/rand_chacha/0.3.1 \
+           crate://crates.io/rand_core/0.6.4 \
+           crate://crates.io/rayon/1.10.0 \
+           crate://crates.io/rayon-core/1.12.1 \
+           crate://crates.io/redox_syscall/0.4.1 \
+           crate://crates.io/redox_syscall/0.5.1 \
+           crate://crates.io/redox_users/0.4.5 \
+           crate://crates.io/regex/1.11.1 \
+           crate://crates.io/regex-automata/0.1.10 \
+           crate://crates.io/regex-automata/0.4.9 \
+           crate://crates.io/regex-syntax/0.6.29 \
+           crate://crates.io/regex-syntax/0.8.5 \
+           crate://crates.io/relative-path/1.9.3 \
+           crate://crates.io/rfc2047-decoder/1.0.6 \
+           crate://crates.io/ring/0.17.13 \
+           crate://crates.io/rstest/0.22.0 \
+           crate://crates.io/rstest_macros/0.22.0 \
+           crate://crates.io/rustc-hash/2.0.0 \
+           crate://crates.io/rustc_version/0.4.1 \
+           crate://crates.io/rustflags/0.1.6 \
+           crate://crates.io/rustix/0.38.41 \
+           crate://crates.io/rustls/0.23.19 \
+           crate://crates.io/rustls-pemfile/2.1.3 \
+           crate://crates.io/rustls-pki-types/1.10.0 \
+           crate://crates.io/rustls-webpki/0.102.8 \
+           crate://crates.io/rustversion/1.0.18 \
+           crate://crates.io/ryu/1.0.18 \
+           crate://crates.io/same-file/1.0.6 \
+           crate://crates.io/schannel/0.1.23 \
+           crate://crates.io/schemars/0.8.21 \
+           crate://crates.io/schemars_derive/0.8.21 \
+           crate://crates.io/scopeguard/1.2.0 \
+           crate://crates.io/scroll/0.12.0 \
+           crate://crates.io/scroll_derive/0.12.0 \
+           crate://crates.io/security-framework/2.11.0 \
+           crate://crates.io/security-framework-sys/2.11.0 \
+           crate://crates.io/semver/1.0.23 \
+           crate://crates.io/serde/1.0.217 \
+           crate://crates.io/serde_derive/1.0.217 \
+           crate://crates.io/serde_derive_internals/0.29.1 \
+           crate://crates.io/serde_json/1.0.135 \
+           crate://crates.io/serde_spanned/0.6.8 \
+           crate://crates.io/sha2/0.10.8 \
+           crate://crates.io/sharded-slab/0.1.7 \
+           crate://crates.io/shell-words/1.1.0 \
+           crate://crates.io/shlex/1.3.0 \
+           crate://crates.io/simd-adler32/0.3.7 \
+           crate://crates.io/similar/2.5.0 \
+           crate://crates.io/slab/0.4.9 \
+           crate://crates.io/smallvec/1.13.2 \
+           crate://crates.io/smawk/0.3.2 \
+           crate://crates.io/snapbox/0.6.16 \
+           crate://crates.io/snapbox-macros/0.3.10 \
+           crate://crates.io/socks/0.3.4 \
+           crate://crates.io/stable_deref_trait/1.2.0 \
+           crate://crates.io/stacker/0.1.15 \
+           crate://crates.io/static_assertions/1.1.0 \
+           crate://crates.io/strsim/0.11.1 \
+           crate://crates.io/subtle/2.5.0 \
+           crate://crates.io/syn/2.0.90 \
+           crate://crates.io/synstructure/0.13.1 \
+           crate://crates.io/tar/0.4.43 \
+           crate://crates.io/target-lexicon/0.13.1 \
+           crate://crates.io/tempfile/3.11.0 \
+           crate://crates.io/termcolor/1.4.1 \
+           crate://crates.io/terminal_size/0.3.0 \
+           crate://crates.io/textwrap/0.16.1 \
+           crate://crates.io/thiserror/1.0.69 \
+           crate://crates.io/thiserror/2.0.3 \
+           crate://crates.io/thiserror-impl/1.0.69 \
+           crate://crates.io/thiserror-impl/2.0.3 \
+           crate://crates.io/thread_local/1.1.8 \
+           crate://crates.io/time/0.3.36 \
+           crate://crates.io/time-core/0.1.2 \
+           crate://crates.io/time-macros/0.2.18 \
+           crate://crates.io/tinystr/0.7.6 \
+           crate://crates.io/toml/0.8.19 \
+           crate://crates.io/toml_datetime/0.6.8 \
+           crate://crates.io/toml_edit/0.21.1 \
+           crate://crates.io/toml_edit/0.22.22 \
+           crate://crates.io/tracing/0.1.41 \
+           crate://crates.io/tracing-attributes/0.1.28 \
+           crate://crates.io/tracing-core/0.1.33 \
+           crate://crates.io/tracing-log/0.2.0 \
+           crate://crates.io/tracing-serde/0.2.0 \
+           crate://crates.io/tracing-subscriber/0.3.19 \
+           crate://crates.io/trycmd/0.15.6 \
+           crate://crates.io/twox-hash/1.6.3 \
+           crate://crates.io/typenum/1.17.0 \
+           crate://crates.io/unicase/2.7.0 \
+           crate://crates.io/unicode-ident/1.0.12 \
+           crate://crates.io/unicode-linebreak/0.1.5 \
+           crate://crates.io/unicode-width/0.1.13 \
+           crate://crates.io/unicode-width/0.2.0 \
+           crate://crates.io/unicode-xid/0.2.6 \
+           crate://crates.io/unscanny/0.1.0 \
+           crate://crates.io/untrusted/0.9.0 \
+           crate://crates.io/ureq/2.11.0 \
+           crate://crates.io/url/2.5.4 \
+           crate://crates.io/urlencoding/2.1.3 \
+           crate://crates.io/utf16_iter/1.0.5 \
+           crate://crates.io/utf8_iter/1.0.4 \
+           crate://crates.io/utf8parse/0.2.2 \
+           crate://crates.io/uuid/1.8.0 \
+           crate://crates.io/valuable/0.1.0 \
+           crate://crates.io/vcpkg/0.2.15 \
+           crate://crates.io/version-ranges/0.1.1 \
+           crate://crates.io/version_check/0.9.4 \
+           crate://crates.io/versions/6.2.0 \
+           crate://crates.io/wait-timeout/0.2.0 \
+           crate://crates.io/walkdir/2.5.0 \
+           crate://crates.io/wasi/0.11.0+wasi-snapshot-preview1 \
+           crate://crates.io/wasi/0.14.2+wasi-0.2.4 \
+           crate://crates.io/wasm-bindgen/0.2.96 \
+           crate://crates.io/wasm-bindgen-backend/0.2.96 \
+           crate://crates.io/wasm-bindgen-macro/0.2.96 \
+           crate://crates.io/wasm-bindgen-macro-support/0.2.96 \
+           crate://crates.io/wasm-bindgen-shared/0.2.96 \
+           crate://crates.io/web-time/1.1.0 \
+           crate://crates.io/webpki-roots/0.26.2 \
+           crate://crates.io/which/7.0.0 \
+           crate://crates.io/wild/2.2.1 \
+           crate://crates.io/winapi/0.3.9 \
+           crate://crates.io/winapi-i686-pc-windows-gnu/0.4.0 \
+           crate://crates.io/winapi-util/0.1.8 \
+           crate://crates.io/winapi-x86_64-pc-windows-gnu/0.4.0 \
+           crate://crates.io/windows-sys/0.48.0 \
+           crate://crates.io/windows-sys/0.52.0 \
+           crate://crates.io/windows-targets/0.48.5 \
+           crate://crates.io/windows-targets/0.52.5 \
+           crate://crates.io/windows_aarch64_gnullvm/0.48.5 \
+           crate://crates.io/windows_aarch64_gnullvm/0.52.5 \
+           crate://crates.io/windows_aarch64_msvc/0.48.5 \
+           crate://crates.io/windows_aarch64_msvc/0.52.5 \
+           crate://crates.io/windows_i686_gnu/0.48.5 \
+           crate://crates.io/windows_i686_gnu/0.52.5 \
+           crate://crates.io/windows_i686_gnullvm/0.52.5 \
+           crate://crates.io/windows_i686_msvc/0.48.5 \
+           crate://crates.io/windows_i686_msvc/0.52.5 \
+           crate://crates.io/windows_x86_64_gnu/0.48.5 \
+           crate://crates.io/windows_x86_64_gnu/0.52.5 \
+           crate://crates.io/windows_x86_64_gnullvm/0.48.5 \
+           crate://crates.io/windows_x86_64_gnullvm/0.52.5 \
+           crate://crates.io/windows_x86_64_msvc/0.48.5 \
+           crate://crates.io/windows_x86_64_msvc/0.52.5 \
+           crate://crates.io/winnow/0.5.40 \
+           crate://crates.io/winnow/0.6.20 \
+           crate://crates.io/winsafe/0.0.19 \
+           crate://crates.io/wit-bindgen-rt/0.39.0 \
+           crate://crates.io/write16/1.0.0 \
+           crate://crates.io/writeable/0.5.5 \
+           crate://crates.io/xattr/1.3.1 \
+           crate://crates.io/xwin/0.6.5 \
+           crate://crates.io/xz2/0.1.7 \
+           crate://crates.io/yansi/1.0.1 \
+           crate://crates.io/yoke/0.7.4 \
+           crate://crates.io/yoke-derive/0.7.5 \
+           crate://crates.io/zerocopy/0.7.35 \
+           crate://crates.io/zerocopy-derive/0.7.35 \
+           crate://crates.io/zerofrom/0.1.4 \
+           crate://crates.io/zerofrom-derive/0.1.5 \
+           crate://crates.io/zeroize/1.8.1 \
+           crate://crates.io/zerovec/0.10.4 \
+           crate://crates.io/zerovec-derive/0.10.3 \
+           crate://crates.io/zip/2.3.0 \
+           crate://crates.io/zopfli/0.8.1 \
+           crate://crates.io/zstd/0.13.3 \
+           crate://crates.io/zstd-safe/7.2.4 \
+           crate://crates.io/zstd-sys/2.0.15+zstd.1.5.7 \
+           "
+SRC_URI[sha256sum] = "96c76353f94a153c5dc1a9d3916e75fcd17e6bf216a06dcdc2f84b9f98f374af"
+
+S = "${WORKDIR}/maturin-${PV}"
+
+CFLAGS += "-ffile-prefix-map=${CARGO_HOME}=${TARGET_DBGSRC_DIR}/cargo_home"
+
+DEPENDS += "\
+    python3-setuptools-rust-native \
+    python3-semantic-version-native \
+    python3-setuptools-rust \
+"
+
+require ${BPN}-crates.inc
+
+inherit pypi cargo-update-recipe-crates python_pyo3 python_setuptools_build_meta
+
+do_configure() {
+    python_pyo3_do_configure
+    cargo_common_do_configure
+    python_pep517_do_configure
+}
+
+RDEPENDS:${PN} += "\
+    cargo \
+    python3-json \
+    rust \
+"
+
+RRECOMMENDS:${PN} += "\
+    python3-ensurepip \
+    python3-pip \
+    python3-venv \
+"
+
+BBCLASSEXTEND = "native nativesdk"
-- 
2.47.1


--===============2261669345143996173==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: attachment; filename="buildhistory-diff-full.txt"

packages/core2-64-poky-linux/python3-maturin: SRC_URI changed from "https://files.pythonhosted.org/packages/source/m/maturin/maturin-1.8.6.tar.gz;downloadfilename=maturin-1.8.6.tar.gz file://0001-Define-more-ioctl-codes-on-riscv32gc-unknown-linux-g.patch;patchdir=/srv/pokybuild/yocto-worker/auh/build/build/tmp/work/core2-64-poky-linux/python3-maturin/1.8.6/sources-unpack/cargo_home/bitbake/libc-0.2.167 crate://crates.io/adler2/2.0.0 crate://crates.io/ahash/0.8.11 crate://crates.io/aho-corasick/1.1.3 crate://crates.io/allocator-api2/0.2.18 crate://crates.io/anstream/0.6.14 crate://crates.io/anstyle/1.0.7 crate://crates.io/anstyle-parse/0.2.4 crate://crates.io/anstyle-query/1.1.0 crate://crates.io/anstyle-wincon/3.0.3 crate://crates.io/anyhow/1.0.89 crate://crates.io/arbitrary/1.4.1 crate://crates.io/autocfg/1.3.0 crate://crates.io/automod/1.0.14 crate://crates.io/base64/0.21.7 crate://crates.io/base64/0.22.1 crate://crates.io/bitflags/1.3.2 crate://crates.io/bitflags/2.5.0 crate://cra
 tes.io/block-buffer/0.10.4 crate://crates.io/boxcar/0.2.8 crate://crates.io/bstr/1.10.0 crate://crates.io/bumpalo/3.16.0 crate://crates.io/byteorder/1.5.0 crate://crates.io/bytes/1.9.0 crate://crates.io/bytesize/1.3.0 crate://crates.io/bzip2/0.5.2 crate://crates.io/bzip2-sys/0.1.13+1.0.8 crate://crates.io/cab/0.6.0 crate://crates.io/camino/1.1.9 crate://crates.io/cargo-config2/0.1.26 crate://crates.io/cargo-options/0.7.4 crate://crates.io/cargo-platform/0.1.8 crate://crates.io/cargo-xwin/0.18.4 crate://crates.io/cargo-zigbuild/0.20.0 crate://crates.io/cargo_metadata/0.19.0 crate://crates.io/cbindgen/0.28.0 crate://crates.io/cc/1.2.16 crate://crates.io/cfb/0.10.0 crate://crates.io/cfg-if/1.0.0 crate://crates.io/charset/0.1.5 crate://crates.io/chumsky/0.9.3 crate://crates.io/clap/4.5.7 crate://crates.io/clap_builder/4.5.7 crate://crates.io/clap_complete/4.5.5 crate://crates.io/clap_complete_command/0.6.1 crate://crates.io/clap_complete_nushell/4.5.2 crate://crates.io/clap_derive/4.5.5
  crate://crates.io/clap_lex/0.7.1 crate://crates.io/cli-table/0.4.7 crate://crates.io/colorchoice/1.0.1 crate://crates.io/configparser/3.1.0 crate://crates.io/console/0.15.8 crate://crates.io/content_inspector/0.2.4 crate://crates.io/core-foundation/0.9.4 crate://crates.io/core-foundation-sys/0.8.6 crate://crates.io/cpufeatures/0.2.12 crate://crates.io/crc/3.2.1 crate://crates.io/crc-catalog/2.4.0 crate://crates.io/crc32fast/1.4.2 crate://crates.io/crossbeam-channel/0.5.15 crate://crates.io/crossbeam-deque/0.8.5 crate://crates.io/crossbeam-epoch/0.9.18 crate://crates.io/crossbeam-utils/0.8.20 crate://crates.io/crypto-common/0.1.6 crate://crates.io/data-encoding/2.6.0 crate://crates.io/deranged/0.3.11 crate://crates.io/derive_arbitrary/1.4.1 crate://crates.io/dialoguer/0.11.0 crate://crates.io/diff/0.1.13 crate://crates.io/digest/0.10.7 crate://crates.io/dirs/5.0.1 crate://crates.io/dirs-sys/0.4.1 crate://crates.io/displaydoc/0.2.5 crate://crates.io/dissimilar/1.0.9 crate://crates.io
 /dunce/1.0.5 crate://crates.io/dyn-clone/1.0.17 crate://crates.io/either/1.13.0 crate://crates.io/encode_unicode/0.3.6 crate://crates.io/encoding_rs/0.8.34 crate://crates.io/equivalent/1.0.1 crate://crates.io/errno/0.3.9 crate://crates.io/expect-test/1.5.0 crate://crates.io/fastrand/2.1.0 crate://crates.io/fat-macho/0.4.9 crate://crates.io/filetime/0.2.23 crate://crates.io/flate2/1.0.33 crate://crates.io/fnv/1.0.7 crate://crates.io/foreign-types/0.3.2 crate://crates.io/foreign-types-shared/0.1.1 crate://crates.io/form_urlencoded/1.2.1 crate://crates.io/fs-err/3.0.0 crate://crates.io/fs4/0.12.0 crate://crates.io/futures/0.3.30 crate://crates.io/futures-channel/0.3.31 crate://crates.io/futures-core/0.3.31 crate://crates.io/futures-executor/0.3.30 crate://crates.io/futures-io/0.3.31 crate://crates.io/futures-macro/0.3.31 crate://crates.io/futures-sink/0.3.31 crate://crates.io/futures-task/0.3.31 crate://crates.io/futures-timer/3.0.3 crate://crates.io/futures-util/0.3.31 crate://crates.
 io/generic-array/0.14.7 crate://crates.io/getrandom/0.2.15 crate://crates.io/glob/0.3.1 crate://crates.io/globset/0.4.15 crate://crates.io/goblin/0.9.2 crate://crates.io/hashbrown/0.14.5 crate://crates.io/hashbrown/0.15.2 crate://crates.io/heck/0.4.1 crate://crates.io/heck/0.5.0 crate://crates.io/home/0.5.9 crate://crates.io/humantime/2.1.0 crate://crates.io/humantime-serde/1.1.1 crate://crates.io/icu_collections/1.5.0 crate://crates.io/icu_locid/1.5.0 crate://crates.io/icu_locid_transform/1.5.0 crate://crates.io/icu_locid_transform_data/1.5.0 crate://crates.io/icu_normalizer/1.5.0 crate://crates.io/icu_normalizer_data/1.5.0 crate://crates.io/icu_properties/1.5.1 crate://crates.io/icu_properties_data/1.5.0 crate://crates.io/icu_provider/1.5.0 crate://crates.io/icu_provider_macros/1.5.0 crate://crates.io/idna/1.0.3 crate://crates.io/idna_adapter/1.2.0 crate://crates.io/ignore/0.4.23 crate://crates.io/indexmap/2.6.0 crate://crates.io/indicatif/0.17.9 crate://crates.io/indoc/2.0.5 crat
 e://crates.io/is_terminal_polyfill/1.70.0 crate://crates.io/itertools/0.12.1 crate://crates.io/itertools/0.13.0 crate://crates.io/itoa/1.0.11 crate://crates.io/js-sys/0.3.73 crate://crates.io/keyring/2.3.3 crate://crates.io/lazy_static/1.4.0 crate://crates.io/lddtree/0.3.7 crate://crates.io/libc/0.2.167 crate://crates.io/libmimalloc-sys/0.1.39 crate://crates.io/libredox/0.1.3 crate://crates.io/linux-keyutils/0.2.4 crate://crates.io/linux-raw-sys/0.4.14 crate://crates.io/litemap/0.7.3 crate://crates.io/lock_api/0.4.12 crate://crates.io/lockfree-object-pool/0.1.6 crate://crates.io/log/0.4.22 crate://crates.io/lzma-sys/0.1.20 crate://crates.io/lzxd/0.2.5 crate://crates.io/mailparse/0.15.0 crate://crates.io/matchers/0.1.0 crate://crates.io/memchr/2.7.4 crate://crates.io/mimalloc/0.1.43 crate://crates.io/mime/0.3.17 crate://crates.io/mime_guess/2.0.4 crate://crates.io/minijinja/2.5.0 crate://crates.io/minimal-lexical/0.2.1 crate://crates.io/miniz_oxide/0.8.0 crate://crates.io/msi/0.8.0 c
 rate://crates.io/multipart/0.18.0 crate://crates.io/native-tls/0.2.12 crate://crates.io/nom/7.1.3 crate://crates.io/normalize-line-endings/0.3.0 crate://crates.io/normpath/1.2.0 crate://crates.io/nu-ansi-term/0.46.0 crate://crates.io/num-conv/0.1.0 crate://crates.io/number_prefix/0.4.0 crate://crates.io/once_cell/1.20.2 crate://crates.io/openssl/0.10.72 crate://crates.io/openssl-macros/0.1.1 crate://crates.io/openssl-probe/0.1.5 crate://crates.io/openssl-sys/0.9.107 crate://crates.io/option-ext/0.2.0 crate://crates.io/os_pipe/1.2.0 crate://crates.io/overload/0.1.1 crate://crates.io/parking_lot/0.12.3 crate://crates.io/parking_lot_core/0.9.10 crate://crates.io/paste/1.0.15 crate://crates.io/path-slash/0.2.1 crate://crates.io/pep440_rs/0.7.3 crate://crates.io/pep508_rs/0.9.2 crate://crates.io/percent-encoding/2.3.1 crate://crates.io/pin-project-lite/0.2.15 crate://crates.io/pin-utils/0.1.0 crate://crates.io/pkg-config/0.3.30 crate://crates.io/plain/0.2.3 crate://crates.io/platform-inf
 o/2.0.3 crate://crates.io/portable-atomic/1.6.0 crate://crates.io/powerfmt/0.2.0 crate://crates.io/ppv-lite86/0.2.17 crate://crates.io/pretty_assertions/1.4.1 crate://crates.io/proc-macro-crate/3.1.0 crate://crates.io/proc-macro2/1.0.92 crate://crates.io/psm/0.1.21 crate://crates.io/pyproject-toml/0.13.4 crate://crates.io/python-pkginfo/0.6.5 crate://crates.io/quote/1.0.37 crate://crates.io/quoted_printable/0.5.0 crate://crates.io/rand/0.8.5 crate://crates.io/rand_chacha/0.3.1 crate://crates.io/rand_core/0.6.4 crate://crates.io/rayon/1.10.0 crate://crates.io/rayon-core/1.12.1 crate://crates.io/redox_syscall/0.4.1 crate://crates.io/redox_syscall/0.5.1 crate://crates.io/redox_users/0.4.5 crate://crates.io/regex/1.11.1 crate://crates.io/regex-automata/0.1.10 crate://crates.io/regex-automata/0.4.9 crate://crates.io/regex-syntax/0.6.29 crate://crates.io/regex-syntax/0.8.5 crate://crates.io/relative-path/1.9.3 crate://crates.io/rfc2047-decoder/1.0.6 crate://crates.io/ring/0.17.13 crate://
 crates.io/rstest/0.22.0 crate://crates.io/rstest_macros/0.22.0 crate://crates.io/rustc-hash/2.0.0 crate://crates.io/rustc_version/0.4.1 crate://crates.io/rustflags/0.1.6 crate://crates.io/rustix/0.38.41 crate://crates.io/rustls/0.23.19 crate://crates.io/rustls-pemfile/2.1.3 crate://crates.io/rustls-pki-types/1.10.0 crate://crates.io/rustls-webpki/0.102.8 crate://crates.io/rustversion/1.0.18 crate://crates.io/ryu/1.0.18 crate://crates.io/same-file/1.0.6 crate://crates.io/schannel/0.1.23 crate://crates.io/schemars/0.8.21 crate://crates.io/schemars_derive/0.8.21 crate://crates.io/scopeguard/1.2.0 crate://crates.io/scroll/0.12.0 crate://crates.io/scroll_derive/0.12.0 crate://crates.io/security-framework/2.11.0 crate://crates.io/security-framework-sys/2.11.0 crate://crates.io/semver/1.0.23 crate://crates.io/serde/1.0.217 crate://crates.io/serde_derive/1.0.217 crate://crates.io/serde_derive_internals/0.29.1 crate://crates.io/serde_json/1.0.135 crate://crates.io/serde_spanned/0.6.8 crate:/
 /crates.io/sha2/0.10.8 crate://crates.io/sharded-slab/0.1.7 crate://crates.io/shell-words/1.1.0 crate://crates.io/shlex/1.3.0 crate://crates.io/simd-adler32/0.3.7 crate://crates.io/similar/2.5.0 crate://crates.io/slab/0.4.9 crate://crates.io/smallvec/1.13.2 crate://crates.io/smawk/0.3.2 crate://crates.io/snapbox/0.6.16 crate://crates.io/snapbox-macros/0.3.10 crate://crates.io/socks/0.3.4 crate://crates.io/stable_deref_trait/1.2.0 crate://crates.io/stacker/0.1.15 crate://crates.io/static_assertions/1.1.0 crate://crates.io/strsim/0.11.1 crate://crates.io/subtle/2.5.0 crate://crates.io/syn/2.0.90 crate://crates.io/synstructure/0.13.1 crate://crates.io/tar/0.4.43 crate://crates.io/target-lexicon/0.13.1 crate://crates.io/tempfile/3.11.0 crate://crates.io/termcolor/1.4.1 crate://crates.io/terminal_size/0.3.0 crate://crates.io/textwrap/0.16.1 crate://crates.io/thiserror/1.0.69 crate://crates.io/thiserror/2.0.3 crate://crates.io/thiserror-impl/1.0.69 crate://crates.io/thiserror-impl/2.0.3 c
 rate://crates.io/thread_local/1.1.8 crate://crates.io/time/0.3.36 crate://crates.io/time-core/0.1.2 crate://crates.io/time-macros/0.2.18 crate://crates.io/tinystr/0.7.6 crate://crates.io/toml/0.8.19 crate://crates.io/toml_datetime/0.6.8 crate://crates.io/toml_edit/0.21.1 crate://crates.io/toml_edit/0.22.22 crate://crates.io/tracing/0.1.41 crate://crates.io/tracing-attributes/0.1.28 crate://crates.io/tracing-core/0.1.33 crate://crates.io/tracing-log/0.2.0 crate://crates.io/tracing-serde/0.2.0 crate://crates.io/tracing-subscriber/0.3.19 crate://crates.io/trycmd/0.15.6 crate://crates.io/twox-hash/1.6.3 crate://crates.io/typenum/1.17.0 crate://crates.io/unicase/2.7.0 crate://crates.io/unicode-ident/1.0.12 crate://crates.io/unicode-linebreak/0.1.5 crate://crates.io/unicode-width/0.1.13 crate://crates.io/unicode-width/0.2.0 crate://crates.io/unicode-xid/0.2.6 crate://crates.io/unscanny/0.1.0 crate://crates.io/untrusted/0.9.0 crate://crates.io/ureq/2.11.0 crate://crates.io/url/2.5.4 crate:
 //crates.io/urlencoding/2.1.3 crate://crates.io/utf16_iter/1.0.5 crate://crates.io/utf8_iter/1.0.4 crate://crates.io/utf8parse/0.2.2 crate://crates.io/uuid/1.8.0 crate://crates.io/valuable/0.1.0 crate://crates.io/vcpkg/0.2.15 crate://crates.io/version-ranges/0.1.1 crate://crates.io/version_check/0.9.4 crate://crates.io/versions/6.2.0 crate://crates.io/wait-timeout/0.2.0 crate://crates.io/walkdir/2.5.0 crate://crates.io/wasi/0.11.0+wasi-snapshot-preview1 crate://crates.io/wasm-bindgen/0.2.96 crate://crates.io/wasm-bindgen-backend/0.2.96 crate://crates.io/wasm-bindgen-macro/0.2.96 crate://crates.io/wasm-bindgen-macro-support/0.2.96 crate://crates.io/wasm-bindgen-shared/0.2.96 crate://crates.io/web-time/1.1.0 crate://crates.io/webpki-roots/0.26.2 crate://crates.io/which/7.0.0 crate://crates.io/wild/2.2.1 crate://crates.io/winapi/0.3.9 crate://crates.io/winapi-i686-pc-windows-gnu/0.4.0 crate://crates.io/winapi-util/0.1.8 crate://crates.io/winapi-x86_64-pc-windows-gnu/0.4.0 crate://crate
 s.io/windows-sys/0.48.0 crate://crates.io/windows-sys/0.52.0 crate://crates.io/windows-targets/0.48.5 crate://crates.io/windows-targets/0.52.5 crate://crates.io/windows_aarch64_gnullvm/0.48.5 crate://crates.io/windows_aarch64_gnullvm/0.52.5 crate://crates.io/windows_aarch64_msvc/0.48.5 crate://crates.io/windows_aarch64_msvc/0.52.5 crate://crates.io/windows_i686_gnu/0.48.5 crate://crates.io/windows_i686_gnu/0.52.5 crate://crates.io/windows_i686_gnullvm/0.52.5 crate://crates.io/windows_i686_msvc/0.48.5 crate://crates.io/windows_i686_msvc/0.52.5 crate://crates.io/windows_x86_64_gnu/0.48.5 crate://crates.io/windows_x86_64_gnu/0.52.5 crate://crates.io/windows_x86_64_gnullvm/0.48.5 crate://crates.io/windows_x86_64_gnullvm/0.52.5 crate://crates.io/windows_x86_64_msvc/0.48.5 crate://crates.io/windows_x86_64_msvc/0.52.5 crate://crates.io/winnow/0.5.40 crate://crates.io/winnow/0.6.20 crate://crates.io/winsafe/0.0.19 crate://crates.io/write16/1.0.0 crate://crates.io/writeable/0.5.5 crate://cra
 tes.io/xattr/1.3.1 crate://crates.io/xwin/0.6.5 crate://crates.io/xz2/0.1.7 crate://crates.io/yansi/1.0.1 crate://crates.io/yoke/0.7.4 crate://crates.io/yoke-derive/0.7.5 crate://crates.io/zerocopy/0.7.35 crate://crates.io/zerocopy-derive/0.7.35 crate://crates.io/zerofrom/0.1.4 crate://crates.io/zerofrom-derive/0.1.5 crate://crates.io/zeroize/1.8.1 crate://crates.io/zerovec/0.10.4 crate://crates.io/zerovec-derive/0.10.3 crate://crates.io/zip/2.3.0 crate://crates.io/zopfli/0.8.1" to "https://files.pythonhosted.org/packages/source/m/maturin/maturin-1.8.7.tar.gz;downloadfilename=maturin-1.8.7.tar.gz crate://crates.io/adler2/2.0.0 crate://crates.io/ahash/0.8.11 crate://crates.io/aho-corasick/1.1.3 crate://crates.io/allocator-api2/0.2.18 crate://crates.io/anstream/0.6.14 crate://crates.io/anstyle/1.0.7 crate://crates.io/anstyle-parse/0.2.4 crate://crates.io/anstyle-query/1.1.0 crate://crates.io/anstyle-wincon/3.0.3 crate://crates.io/anyhow/1.0.89 crate://crates.io/arbitrary/1.4.1 crate:/
 /crates.io/autocfg/1.3.0 crate://crates.io/automod/1.0.14 crate://crates.io/base64/0.21.7 crate://crates.io/base64/0.22.1 crate://crates.io/bitflags/1.3.2 crate://crates.io/bitflags/2.5.0 crate://crates.io/block-buffer/0.10.4 crate://crates.io/boxcar/0.2.8 crate://crates.io/bstr/1.10.0 crate://crates.io/bumpalo/3.16.0 crate://crates.io/byteorder/1.5.0 crate://crates.io/bytes/1.9.0 crate://crates.io/bytesize/1.3.0 crate://crates.io/bzip2/0.5.2 crate://crates.io/bzip2-sys/0.1.13+1.0.8 crate://crates.io/cab/0.6.0 crate://crates.io/camino/1.1.9 crate://crates.io/cargo-config2/0.1.26 crate://crates.io/cargo-options/0.7.4 crate://crates.io/cargo-platform/0.1.8 crate://crates.io/cargo-xwin/0.18.6 crate://crates.io/cargo-zigbuild/0.20.0 crate://crates.io/cargo_metadata/0.19.0 crate://crates.io/cbindgen/0.29.0 crate://crates.io/cc/1.2.16 crate://crates.io/cfb/0.10.0 crate://crates.io/cfg-if/1.0.0 crate://crates.io/charset/0.1.5 crate://crates.io/chumsky/0.9.3 crate://crates.io/clap/4.5.7 cra
 te://crates.io/clap_builder/4.5.7 crate://crates.io/clap_complete/4.5.5 crate://crates.io/clap_complete_command/0.6.1 crate://crates.io/clap_complete_nushell/4.5.2 crate://crates.io/clap_derive/4.5.5 crate://crates.io/clap_lex/0.7.1 crate://crates.io/cli-table/0.4.7 crate://crates.io/colorchoice/1.0.1 crate://crates.io/configparser/3.1.0 crate://crates.io/console/0.15.8 crate://crates.io/content_inspector/0.2.4 crate://crates.io/core-foundation/0.9.4 crate://crates.io/core-foundation-sys/0.8.6 crate://crates.io/cpufeatures/0.2.12 crate://crates.io/crc/3.2.1 crate://crates.io/crc-catalog/2.4.0 crate://crates.io/crc32fast/1.4.2 crate://crates.io/crossbeam-channel/0.5.15 crate://crates.io/crossbeam-deque/0.8.5 crate://crates.io/crossbeam-epoch/0.9.18 crate://crates.io/crossbeam-utils/0.8.20 crate://crates.io/crypto-common/0.1.6 crate://crates.io/data-encoding/2.6.0 crate://crates.io/deranged/0.3.11 crate://crates.io/derive_arbitrary/1.4.1 crate://crates.io/dialoguer/0.11.0 crate://crat
 es.io/diff/0.1.13 crate://crates.io/digest/0.10.7 crate://crates.io/dirs/5.0.1 crate://crates.io/dirs-sys/0.4.1 crate://crates.io/displaydoc/0.2.5 crate://crates.io/dissimilar/1.0.9 crate://crates.io/dunce/1.0.5 crate://crates.io/dyn-clone/1.0.17 crate://crates.io/either/1.13.0 crate://crates.io/encode_unicode/0.3.6 crate://crates.io/encoding_rs/0.8.34 crate://crates.io/equivalent/1.0.1 crate://crates.io/errno/0.3.9 crate://crates.io/expect-test/1.5.0 crate://crates.io/fastrand/2.1.0 crate://crates.io/fat-macho/0.4.9 crate://crates.io/filetime/0.2.23 crate://crates.io/flate2/1.0.33 crate://crates.io/fnv/1.0.7 crate://crates.io/foreign-types/0.3.2 crate://crates.io/foreign-types-shared/0.1.1 crate://crates.io/form_urlencoded/1.2.1 crate://crates.io/fs-err/3.0.0 crate://crates.io/fs4/0.12.0 crate://crates.io/futures/0.3.30 crate://crates.io/futures-channel/0.3.31 crate://crates.io/futures-core/0.3.31 crate://crates.io/futures-executor/0.3.30 crate://crates.io/futures-io/0.3.31 crate:/
 /crates.io/futures-macro/0.3.31 crate://crates.io/futures-sink/0.3.31 crate://crates.io/futures-task/0.3.31 crate://crates.io/futures-timer/3.0.3 crate://crates.io/futures-util/0.3.31 crate://crates.io/generic-array/0.14.7 crate://crates.io/getrandom/0.2.15 crate://crates.io/getrandom/0.3.3 crate://crates.io/glob/0.3.1 crate://crates.io/globset/0.4.15 crate://crates.io/goblin/0.9.2 crate://crates.io/hashbrown/0.14.5 crate://crates.io/hashbrown/0.15.2 crate://crates.io/heck/0.5.0 crate://crates.io/home/0.5.9 crate://crates.io/humantime/2.1.0 crate://crates.io/humantime-serde/1.1.1 crate://crates.io/icu_collections/1.5.0 crate://crates.io/icu_locid/1.5.0 crate://crates.io/icu_locid_transform/1.5.0 crate://crates.io/icu_locid_transform_data/1.5.0 crate://crates.io/icu_normalizer/1.5.0 crate://crates.io/icu_normalizer_data/1.5.0 crate://crates.io/icu_properties/1.5.1 crate://crates.io/icu_properties_data/1.5.0 crate://crates.io/icu_provider/1.5.0 crate://crates.io/icu_provider_macros/1.
 5.0 crate://crates.io/idna/1.0.3 crate://crates.io/idna_adapter/1.2.0 crate://crates.io/ignore/0.4.23 crate://crates.io/indexmap/2.6.0 crate://crates.io/indicatif/0.17.9 crate://crates.io/indoc/2.0.5 crate://crates.io/is_terminal_polyfill/1.70.0 crate://crates.io/itertools/0.12.1 crate://crates.io/itertools/0.13.0 crate://crates.io/itoa/1.0.11 crate://crates.io/jobserver/0.1.33 crate://crates.io/js-sys/0.3.73 crate://crates.io/keyring/2.3.3 crate://crates.io/lazy_static/1.4.0 crate://crates.io/lddtree/0.3.7 crate://crates.io/libc/0.2.172 crate://crates.io/libmimalloc-sys/0.1.39 crate://crates.io/libredox/0.1.3 crate://crates.io/linux-keyutils/0.2.4 crate://crates.io/linux-raw-sys/0.4.14 crate://crates.io/litemap/0.7.3 crate://crates.io/lock_api/0.4.12 crate://crates.io/lockfree-object-pool/0.1.6 crate://crates.io/log/0.4.22 crate://crates.io/lzma-rs/0.3.0 crate://crates.io/lzma-sys/0.1.20 crate://crates.io/lzxd/0.2.5 crate://crates.io/mailparse/0.15.0 crate://crates.io/matchers/0.1.
 0 crate://crates.io/memchr/2.7.4 crate://crates.io/mimalloc/0.1.43 crate://crates.io/mime/0.3.17 crate://crates.io/mime_guess/2.0.4 crate://crates.io/minijinja/2.5.0 crate://crates.io/minimal-lexical/0.2.1 crate://crates.io/miniz_oxide/0.8.0 crate://crates.io/msi/0.8.0 crate://crates.io/multipart/0.18.0 crate://crates.io/native-tls/0.2.12 crate://crates.io/nom/7.1.3 crate://crates.io/normalize-line-endings/0.3.0 crate://crates.io/normpath/1.2.0 crate://crates.io/nu-ansi-term/0.46.0 crate://crates.io/num-conv/0.1.0 crate://crates.io/number_prefix/0.4.0 crate://crates.io/once_cell/1.20.2 crate://crates.io/openssl/0.10.72 crate://crates.io/openssl-macros/0.1.1 crate://crates.io/openssl-probe/0.1.5 crate://crates.io/openssl-sys/0.9.107 crate://crates.io/option-ext/0.2.0 crate://crates.io/os_pipe/1.2.0 crate://crates.io/overload/0.1.1 crate://crates.io/parking_lot/0.12.3 crate://crates.io/parking_lot_core/0.9.10 crate://crates.io/paste/1.0.15 crate://crates.io/path-slash/0.2.1 crate://cr
 ates.io/pep440_rs/0.7.3 crate://crates.io/pep508_rs/0.9.2 crate://crates.io/percent-encoding/2.3.1 crate://crates.io/pin-project-lite/0.2.15 crate://crates.io/pin-utils/0.1.0 crate://crates.io/pkg-config/0.3.30 crate://crates.io/plain/0.2.3 crate://crates.io/platform-info/2.0.3 crate://crates.io/portable-atomic/1.6.0 crate://crates.io/powerfmt/0.2.0 crate://crates.io/ppv-lite86/0.2.17 crate://crates.io/pretty_assertions/1.4.1 crate://crates.io/proc-macro-crate/3.1.0 crate://crates.io/proc-macro2/1.0.92 crate://crates.io/psm/0.1.21 crate://crates.io/pyproject-toml/0.13.4 crate://crates.io/python-pkginfo/0.6.5 crate://crates.io/quote/1.0.37 crate://crates.io/quoted_printable/0.5.0 crate://crates.io/r-efi/5.2.0 crate://crates.io/rand/0.8.5 crate://crates.io/rand_chacha/0.3.1 crate://crates.io/rand_core/0.6.4 crate://crates.io/rayon/1.10.0 crate://crates.io/rayon-core/1.12.1 crate://crates.io/redox_syscall/0.4.1 crate://crates.io/redox_syscall/0.5.1 crate://crates.io/redox_users/0.4.5 c
 rate://crates.io/regex/1.11.1 crate://crates.io/regex-automata/0.1.10 crate://crates.io/regex-automata/0.4.9 crate://crates.io/regex-syntax/0.6.29 crate://crates.io/regex-syntax/0.8.5 crate://crates.io/relative-path/1.9.3 crate://crates.io/rfc2047-decoder/1.0.6 crate://crates.io/ring/0.17.13 crate://crates.io/rstest/0.22.0 crate://crates.io/rstest_macros/0.22.0 crate://crates.io/rustc-hash/2.0.0 crate://crates.io/rustc_version/0.4.1 crate://crates.io/rustflags/0.1.6 crate://crates.io/rustix/0.38.41 crate://crates.io/rustls/0.23.19 crate://crates.io/rustls-pemfile/2.1.3 crate://crates.io/rustls-pki-types/1.10.0 crate://crates.io/rustls-webpki/0.102.8 crate://crates.io/rustversion/1.0.18 crate://crates.io/ryu/1.0.18 crate://crates.io/same-file/1.0.6 crate://crates.io/schannel/0.1.23 crate://crates.io/schemars/0.8.21 crate://crates.io/schemars_derive/0.8.21 crate://crates.io/scopeguard/1.2.0 crate://crates.io/scroll/0.12.0 crate://crates.io/scroll_derive/0.12.0 crate://crates.io/securi
 ty-framework/2.11.0 crate://crates.io/security-framework-sys/2.11.0 crate://crates.io/semver/1.0.23 crate://crates.io/serde/1.0.217 crate://crates.io/serde_derive/1.0.217 crate://crates.io/serde_derive_internals/0.29.1 crate://crates.io/serde_json/1.0.135 crate://crates.io/serde_spanned/0.6.8 crate://crates.io/sha2/0.10.8 crate://crates.io/sharded-slab/0.1.7 crate://crates.io/shell-words/1.1.0 crate://crates.io/shlex/1.3.0 crate://crates.io/simd-adler32/0.3.7 crate://crates.io/similar/2.5.0 crate://crates.io/slab/0.4.9 crate://crates.io/smallvec/1.13.2 crate://crates.io/smawk/0.3.2 crate://crates.io/snapbox/0.6.16 crate://crates.io/snapbox-macros/0.3.10 crate://crates.io/socks/0.3.4 crate://crates.io/stable_deref_trait/1.2.0 crate://crates.io/stacker/0.1.15 crate://crates.io/static_assertions/1.1.0 crate://crates.io/strsim/0.11.1 crate://crates.io/subtle/2.5.0 crate://crates.io/syn/2.0.90 crate://crates.io/synstructure/0.13.1 crate://crates.io/tar/0.4.43 crate://crates.io/target-lex
 icon/0.13.1 crate://crates.io/tempfile/3.11.0 crate://crates.io/termcolor/1.4.1 crate://crates.io/terminal_size/0.3.0 crate://crates.io/textwrap/0.16.1 crate://crates.io/thiserror/1.0.69 crate://crates.io/thiserror/2.0.3 crate://crates.io/thiserror-impl/1.0.69 crate://crates.io/thiserror-impl/2.0.3 crate://crates.io/thread_local/1.1.8 crate://crates.io/time/0.3.36 crate://crates.io/time-core/0.1.2 crate://crates.io/time-macros/0.2.18 crate://crates.io/tinystr/0.7.6 crate://crates.io/toml/0.8.19 crate://crates.io/toml_datetime/0.6.8 crate://crates.io/toml_edit/0.21.1 crate://crates.io/toml_edit/0.22.22 crate://crates.io/tracing/0.1.41 crate://crates.io/tracing-attributes/0.1.28 crate://crates.io/tracing-core/0.1.33 crate://crates.io/tracing-log/0.2.0 crate://crates.io/tracing-serde/0.2.0 crate://crates.io/tracing-subscriber/0.3.19 crate://crates.io/trycmd/0.15.6 crate://crates.io/twox-hash/1.6.3 crate://crates.io/typenum/1.17.0 crate://crates.io/unicase/2.7.0 crate://crates.io/unicod
 e-ident/1.0.12 crate://crates.io/unicode-linebreak/0.1.5 crate://crates.io/unicode-width/0.1.13 crate://crates.io/unicode-width/0.2.0 crate://crates.io/unicode-xid/0.2.6 crate://crates.io/unscanny/0.1.0 crate://crates.io/untrusted/0.9.0 crate://crates.io/ureq/2.11.0 crate://crates.io/url/2.5.4 crate://crates.io/urlencoding/2.1.3 crate://crates.io/utf16_iter/1.0.5 crate://crates.io/utf8_iter/1.0.4 crate://crates.io/utf8parse/0.2.2 crate://crates.io/uuid/1.8.0 crate://crates.io/valuable/0.1.0 crate://crates.io/vcpkg/0.2.15 crate://crates.io/version-ranges/0.1.1 crate://crates.io/version_check/0.9.4 crate://crates.io/versions/6.2.0 crate://crates.io/wait-timeout/0.2.0 crate://crates.io/walkdir/2.5.0 crate://crates.io/wasi/0.11.0+wasi-snapshot-preview1 crate://crates.io/wasi/0.14.2+wasi-0.2.4 crate://crates.io/wasm-bindgen/0.2.96 crate://crates.io/wasm-bindgen-backend/0.2.96 crate://crates.io/wasm-bindgen-macro/0.2.96 crate://crates.io/wasm-bindgen-macro-support/0.2.96 crate://crates.io
 /wasm-bindgen-shared/0.2.96 crate://crates.io/web-time/1.1.0 crate://crates.io/webpki-roots/0.26.2 crate://crates.io/which/7.0.0 crate://crates.io/wild/2.2.1 crate://crates.io/winapi/0.3.9 crate://crates.io/winapi-i686-pc-windows-gnu/0.4.0 crate://crates.io/winapi-util/0.1.8 crate://crates.io/winapi-x86_64-pc-windows-gnu/0.4.0 crate://crates.io/windows-sys/0.48.0 crate://crates.io/windows-sys/0.52.0 crate://crates.io/windows-targets/0.48.5 crate://crates.io/windows-targets/0.52.5 crate://crates.io/windows_aarch64_gnullvm/0.48.5 crate://crates.io/windows_aarch64_gnullvm/0.52.5 crate://crates.io/windows_aarch64_msvc/0.48.5 crate://crates.io/windows_aarch64_msvc/0.52.5 crate://crates.io/windows_i686_gnu/0.48.5 crate://crates.io/windows_i686_gnu/0.52.5 crate://crates.io/windows_i686_gnullvm/0.52.5 crate://crates.io/windows_i686_msvc/0.48.5 crate://crates.io/windows_i686_msvc/0.52.5 crate://crates.io/windows_x86_64_gnu/0.48.5 crate://crates.io/windows_x86_64_gnu/0.52.5 crate://crates.io/
 windows_x86_64_gnullvm/0.48.5 crate://crates.io/windows_x86_64_gnullvm/0.52.5 crate://crates.io/windows_x86_64_msvc/0.48.5 crate://crates.io/windows_x86_64_msvc/0.52.5 crate://crates.io/winnow/0.5.40 crate://crates.io/winnow/0.6.20 crate://crates.io/winsafe/0.0.19 crate://crates.io/wit-bindgen-rt/0.39.0 crate://crates.io/write16/1.0.0 crate://crates.io/writeable/0.5.5 crate://crates.io/xattr/1.3.1 crate://crates.io/xwin/0.6.5 crate://crates.io/xz2/0.1.7 crate://crates.io/yansi/1.0.1 crate://crates.io/yoke/0.7.4 crate://crates.io/yoke-derive/0.7.5 crate://crates.io/zerocopy/0.7.35 crate://crates.io/zerocopy-derive/0.7.35 crate://crates.io/zerofrom/0.1.4 crate://crates.io/zerofrom-derive/0.1.5 crate://crates.io/zeroize/1.8.1 crate://crates.io/zerovec/0.10.4 crate://crates.io/zerovec-derive/0.10.3 crate://crates.io/zip/2.3.0 crate://crates.io/zopfli/0.8.1 crate://crates.io/zstd/0.13.3 crate://crates.io/zstd-safe/7.2.4 crate://crates.io/zstd-sys/2.0.15+zstd.1.5.7 crate://crates.io/adler
 2/2.0.0 crate://crates.io/ahash/0.8.11 crate://crates.io/aho-corasick/1.1.3 crate://crates.io/allocator-api2/0.2.18 crate://crates.io/anstream/0.6.14 crate://crates.io/anstyle/1.0.7 crate://crates.io/anstyle-parse/0.2.4 crate://crates.io/anstyle-query/1.1.0 crate://crates.io/anstyle-wincon/3.0.3 crate://crates.io/anyhow/1.0.89 crate://crates.io/arbitrary/1.4.1 crate://crates.io/autocfg/1.3.0 crate://crates.io/automod/1.0.14 crate://crates.io/base64/0.21.7 crate://crates.io/base64/0.22.1 crate://crates.io/bitflags/1.3.2 crate://crates.io/bitflags/2.5.0 crate://crates.io/block-buffer/0.10.4 crate://crates.io/boxcar/0.2.8 crate://crates.io/bstr/1.10.0 crate://crates.io/bumpalo/3.16.0 crate://crates.io/byteorder/1.5.0 crate://crates.io/bytes/1.9.0 crate://crates.io/bytesize/1.3.0 crate://crates.io/bzip2/0.5.2 crate://crates.io/bzip2-sys/0.1.13+1.0.8 crate://crates.io/cab/0.6.0 crate://crates.io/camino/1.1.9 crate://crates.io/cargo-config2/0.1.26 crate://crates.io/cargo-options/0.7.4 cra
 te://crates.io/cargo-platform/0.1.8 crate://crates.io/cargo-xwin/0.18.6 crate://crates.io/cargo-zigbuild/0.20.0 crate://crates.io/cargo_metadata/0.19.0 crate://crates.io/cbindgen/0.29.0 crate://crates.io/cc/1.2.16 crate://crates.io/cfb/0.10.0 crate://crates.io/cfg-if/1.0.0 crate://crates.io/charset/0.1.5 crate://crates.io/chumsky/0.9.3 crate://crates.io/clap/4.5.7 crate://crates.io/clap_builder/4.5.7 crate://crates.io/clap_complete/4.5.5 crate://crates.io/clap_complete_command/0.6.1 crate://crates.io/clap_complete_nushell/4.5.2 crate://crates.io/clap_derive/4.5.5 crate://crates.io/clap_lex/0.7.1 crate://crates.io/cli-table/0.4.7 crate://crates.io/colorchoice/1.0.1 crate://crates.io/configparser/3.1.0 crate://crates.io/console/0.15.8 crate://crates.io/content_inspector/0.2.4 crate://crates.io/core-foundation/0.9.4 crate://crates.io/core-foundation-sys/0.8.6 crate://crates.io/cpufeatures/0.2.12 crate://crates.io/crc/3.2.1 crate://crates.io/crc-catalog/2.4.0 crate://crates.io/crc32fast
 /1.4.2 crate://crates.io/crossbeam-channel/0.5.15 crate://crates.io/crossbeam-deque/0.8.5 crate://crates.io/crossbeam-epoch/0.9.18 crate://crates.io/crossbeam-utils/0.8.20 crate://crates.io/crypto-common/0.1.6 crate://crates.io/data-encoding/2.6.0 crate://crates.io/deranged/0.3.11 crate://crates.io/derive_arbitrary/1.4.1 crate://crates.io/dialoguer/0.11.0 crate://crates.io/diff/0.1.13 crate://crates.io/digest/0.10.7 crate://crates.io/dirs/5.0.1 crate://crates.io/dirs-sys/0.4.1 crate://crates.io/displaydoc/0.2.5 crate://crates.io/dissimilar/1.0.9 crate://crates.io/dunce/1.0.5 crate://crates.io/dyn-clone/1.0.17 crate://crates.io/either/1.13.0 crate://crates.io/encode_unicode/0.3.6 crate://crates.io/encoding_rs/0.8.34 crate://crates.io/equivalent/1.0.1 crate://crates.io/errno/0.3.9 crate://crates.io/expect-test/1.5.0 crate://crates.io/fastrand/2.1.0 crate://crates.io/fat-macho/0.4.9 crate://crates.io/filetime/0.2.23 crate://crates.io/flate2/1.0.33 crate://crates.io/fnv/1.0.7 crate://cr
 ates.io/foreign-types/0.3.2 crate://crates.io/foreign-types-shared/0.1.1 crate://crates.io/form_urlencoded/1.2.1 crate://crates.io/fs-err/3.0.0 crate://crates.io/fs4/0.12.0 crate://crates.io/futures/0.3.30 crate://crates.io/futures-channel/0.3.31 crate://crates.io/futures-core/0.3.31 crate://crates.io/futures-executor/0.3.30 crate://crates.io/futures-io/0.3.31 crate://crates.io/futures-macro/0.3.31 crate://crates.io/futures-sink/0.3.31 crate://crates.io/futures-task/0.3.31 crate://crates.io/futures-timer/3.0.3 crate://crates.io/futures-util/0.3.31 crate://crates.io/generic-array/0.14.7 crate://crates.io/getrandom/0.2.15 crate://crates.io/getrandom/0.3.3 crate://crates.io/glob/0.3.1 crate://crates.io/globset/0.4.15 crate://crates.io/goblin/0.9.2 crate://crates.io/hashbrown/0.14.5 crate://crates.io/hashbrown/0.15.2 crate://crates.io/heck/0.5.0 crate://crates.io/home/0.5.9 crate://crates.io/humantime/2.1.0 crate://crates.io/humantime-serde/1.1.1 crate://crates.io/icu_collections/1.5.0 
 crate://crates.io/icu_locid/1.5.0 crate://crates.io/icu_locid_transform/1.5.0 crate://crates.io/icu_locid_transform_data/1.5.0 crate://crates.io/icu_normalizer/1.5.0 crate://crates.io/icu_normalizer_data/1.5.0 crate://crates.io/icu_properties/1.5.1 crate://crates.io/icu_properties_data/1.5.0 crate://crates.io/icu_provider/1.5.0 crate://crates.io/icu_provider_macros/1.5.0 crate://crates.io/idna/1.0.3 crate://crates.io/idna_adapter/1.2.0 crate://crates.io/ignore/0.4.23 crate://crates.io/indexmap/2.6.0 crate://crates.io/indicatif/0.17.9 crate://crates.io/indoc/2.0.5 crate://crates.io/is_terminal_polyfill/1.70.0 crate://crates.io/itertools/0.12.1 crate://crates.io/itertools/0.13.0 crate://crates.io/itoa/1.0.11 crate://crates.io/jobserver/0.1.33 crate://crates.io/js-sys/0.3.73 crate://crates.io/keyring/2.3.3 crate://crates.io/lazy_static/1.4.0 crate://crates.io/lddtree/0.3.7 crate://crates.io/libc/0.2.172 crate://crates.io/libmimalloc-sys/0.1.39 crate://crates.io/libredox/0.1.3 crate://c
 rates.io/linux-keyutils/0.2.4 crate://crates.io/linux-raw-sys/0.4.14 crate://crates.io/litemap/0.7.3 crate://crates.io/lock_api/0.4.12 crate://crates.io/lockfree-object-pool/0.1.6 crate://crates.io/log/0.4.22 crate://crates.io/lzma-rs/0.3.0 crate://crates.io/lzma-sys/0.1.20 crate://crates.io/lzxd/0.2.5 crate://crates.io/mailparse/0.15.0 crate://crates.io/matchers/0.1.0 crate://crates.io/memchr/2.7.4 crate://crates.io/mimalloc/0.1.43 crate://crates.io/mime/0.3.17 crate://crates.io/mime_guess/2.0.4 crate://crates.io/minijinja/2.5.0 crate://crates.io/minimal-lexical/0.2.1 crate://crates.io/miniz_oxide/0.8.0 crate://crates.io/msi/0.8.0 crate://crates.io/multipart/0.18.0 crate://crates.io/native-tls/0.2.12 crate://crates.io/nom/7.1.3 crate://crates.io/normalize-line-endings/0.3.0 crate://crates.io/normpath/1.2.0 crate://crates.io/nu-ansi-term/0.46.0 crate://crates.io/num-conv/0.1.0 crate://crates.io/number_prefix/0.4.0 crate://crates.io/once_cell/1.20.2 crate://crates.io/openssl/0.10.72 
 crate://crates.io/openssl-macros/0.1.1 crate://crates.io/openssl-probe/0.1.5 crate://crates.io/openssl-sys/0.9.107 crate://crates.io/option-ext/0.2.0 crate://crates.io/os_pipe/1.2.0 crate://crates.io/overload/0.1.1 crate://crates.io/parking_lot/0.12.3 crate://crates.io/parking_lot_core/0.9.10 crate://crates.io/paste/1.0.15 crate://crates.io/path-slash/0.2.1 crate://crates.io/pep440_rs/0.7.3 crate://crates.io/pep508_rs/0.9.2 crate://crates.io/percent-encoding/2.3.1 crate://crates.io/pin-project-lite/0.2.15 crate://crates.io/pin-utils/0.1.0 crate://crates.io/pkg-config/0.3.30 crate://crates.io/plain/0.2.3 crate://crates.io/platform-info/2.0.3 crate://crates.io/portable-atomic/1.6.0 crate://crates.io/powerfmt/0.2.0 crate://crates.io/ppv-lite86/0.2.17 crate://crates.io/pretty_assertions/1.4.1 crate://crates.io/proc-macro-crate/3.1.0 crate://crates.io/proc-macro2/1.0.92 crate://crates.io/psm/0.1.21 crate://crates.io/pyproject-toml/0.13.4 crate://crates.io/python-pkginfo/0.6.5 crate://cra
 tes.io/quote/1.0.37 crate://crates.io/quoted_printable/0.5.0 crate://crates.io/r-efi/5.2.0 crate://crates.io/rand/0.8.5 crate://crates.io/rand_chacha/0.3.1 crate://crates.io/rand_core/0.6.4 crate://crates.io/rayon/1.10.0 crate://crates.io/rayon-core/1.12.1 crate://crates.io/redox_syscall/0.4.1 crate://crates.io/redox_syscall/0.5.1 crate://crates.io/redox_users/0.4.5 crate://crates.io/regex/1.11.1 crate://crates.io/regex-automata/0.1.10 crate://crates.io/regex-automata/0.4.9 crate://crates.io/regex-syntax/0.6.29 crate://crates.io/regex-syntax/0.8.5 crate://crates.io/relative-path/1.9.3 crate://crates.io/rfc2047-decoder/1.0.6 crate://crates.io/ring/0.17.13 crate://crates.io/rstest/0.22.0 crate://crates.io/rstest_macros/0.22.0 crate://crates.io/rustc-hash/2.0.0 crate://crates.io/rustc_version/0.4.1 crate://crates.io/rustflags/0.1.6 crate://crates.io/rustix/0.38.41 crate://crates.io/rustls/0.23.19 crate://crates.io/rustls-pemfile/2.1.3 crate://crates.io/rustls-pki-types/1.10.0 crate://c
 rates.io/rustls-webpki/0.102.8 crate://crates.io/rustversion/1.0.18 crate://crates.io/ryu/1.0.18 crate://crates.io/same-file/1.0.6 crate://crates.io/schannel/0.1.23 crate://crates.io/schemars/0.8.21 crate://crates.io/schemars_derive/0.8.21 crate://crates.io/scopeguard/1.2.0 crate://crates.io/scroll/0.12.0 crate://crates.io/scroll_derive/0.12.0 crate://crates.io/security-framework/2.11.0 crate://crates.io/security-framework-sys/2.11.0 crate://crates.io/semver/1.0.23 crate://crates.io/serde/1.0.217 crate://crates.io/serde_derive/1.0.217 crate://crates.io/serde_derive_internals/0.29.1 crate://crates.io/serde_json/1.0.135 crate://crates.io/serde_spanned/0.6.8 crate://crates.io/sha2/0.10.8 crate://crates.io/sharded-slab/0.1.7 crate://crates.io/shell-words/1.1.0 crate://crates.io/shlex/1.3.0 crate://crates.io/simd-adler32/0.3.7 crate://crates.io/similar/2.5.0 crate://crates.io/slab/0.4.9 crate://crates.io/smallvec/1.13.2 crate://crates.io/smawk/0.3.2 crate://crates.io/snapbox/0.6.16 crate
 ://crates.io/snapbox-macros/0.3.10 crate://crates.io/socks/0.3.4 crate://crates.io/stable_deref_trait/1.2.0 crate://crates.io/stacker/0.1.15 crate://crates.io/static_assertions/1.1.0 crate://crates.io/strsim/0.11.1 crate://crates.io/subtle/2.5.0 crate://crates.io/syn/2.0.90 crate://crates.io/synstructure/0.13.1 crate://crates.io/tar/0.4.43 crate://crates.io/target-lexicon/0.13.1 crate://crates.io/tempfile/3.11.0 crate://crates.io/termcolor/1.4.1 crate://crates.io/terminal_size/0.3.0 crate://crates.io/textwrap/0.16.1 crate://crates.io/thiserror/1.0.69 crate://crates.io/thiserror/2.0.3 crate://crates.io/thiserror-impl/1.0.69 crate://crates.io/thiserror-impl/2.0.3 crate://crates.io/thread_local/1.1.8 crate://crates.io/time/0.3.36 crate://crates.io/time-core/0.1.2 crate://crates.io/time-macros/0.2.18 crate://crates.io/tinystr/0.7.6 crate://crates.io/toml/0.8.19 crate://crates.io/toml_datetime/0.6.8 crate://crates.io/toml_edit/0.21.1 crate://crates.io/toml_edit/0.22.22 crate://crates.io/
 tracing/0.1.41 crate://crates.io/tracing-attributes/0.1.28 crate://crates.io/tracing-core/0.1.33 crate://crates.io/tracing-log/0.2.0 crate://crates.io/tracing-serde/0.2.0 crate://crates.io/tracing-subscriber/0.3.19 crate://crates.io/trycmd/0.15.6 crate://crates.io/twox-hash/1.6.3 crate://crates.io/typenum/1.17.0 crate://crates.io/unicase/2.7.0 crate://crates.io/unicode-ident/1.0.12 crate://crates.io/unicode-linebreak/0.1.5 crate://crates.io/unicode-width/0.1.13 crate://crates.io/unicode-width/0.2.0 crate://crates.io/unicode-xid/0.2.6 crate://crates.io/unscanny/0.1.0 crate://crates.io/untrusted/0.9.0 crate://crates.io/ureq/2.11.0 crate://crates.io/url/2.5.4 crate://crates.io/urlencoding/2.1.3 crate://crates.io/utf16_iter/1.0.5 crate://crates.io/utf8_iter/1.0.4 crate://crates.io/utf8parse/0.2.2 crate://crates.io/uuid/1.8.0 crate://crates.io/valuable/0.1.0 crate://crates.io/vcpkg/0.2.15 crate://crates.io/version-ranges/0.1.1 crate://crates.io/version_check/0.9.4 crate://crates.io/versi
 ons/6.2.0 crate://crates.io/wait-timeout/0.2.0 crate://crates.io/walkdir/2.5.0 crate://crates.io/wasi/0.11.0+wasi-snapshot-preview1 crate://crates.io/wasi/0.14.2+wasi-0.2.4 crate://crates.io/wasm-bindgen/0.2.96 crate://crates.io/wasm-bindgen-backend/0.2.96 crate://crates.io/wasm-bindgen-macro/0.2.96 crate://crates.io/wasm-bindgen-macro-support/0.2.96 crate://crates.io/wasm-bindgen-shared/0.2.96 crate://crates.io/web-time/1.1.0 crate://crates.io/webpki-roots/0.26.2 crate://crates.io/which/7.0.0 crate://crates.io/wild/2.2.1 crate://crates.io/winapi/0.3.9 crate://crates.io/winapi-i686-pc-windows-gnu/0.4.0 crate://crates.io/winapi-util/0.1.8 crate://crates.io/winapi-x86_64-pc-windows-gnu/0.4.0 crate://crates.io/windows-sys/0.48.0 crate://crates.io/windows-sys/0.52.0 crate://crates.io/windows-targets/0.48.5 crate://crates.io/windows-targets/0.52.5 crate://crates.io/windows_aarch64_gnullvm/0.48.5 crate://crates.io/windows_aarch64_gnullvm/0.52.5 crate://crates.io/windows_aarch64_msvc/0.48.
 5 crate://crates.io/windows_aarch64_msvc/0.52.5 crate://crates.io/windows_i686_gnu/0.48.5 crate://crates.io/windows_i686_gnu/0.52.5 crate://crates.io/windows_i686_gnullvm/0.52.5 crate://crates.io/windows_i686_msvc/0.48.5 crate://crates.io/windows_i686_msvc/0.52.5 crate://crates.io/windows_x86_64_gnu/0.48.5 crate://crates.io/windows_x86_64_gnu/0.52.5 crate://crates.io/windows_x86_64_gnullvm/0.48.5 crate://crates.io/windows_x86_64_gnullvm/0.52.5 crate://crates.io/windows_x86_64_msvc/0.48.5 crate://crates.io/windows_x86_64_msvc/0.52.5 crate://crates.io/winnow/0.5.40 crate://crates.io/winnow/0.6.20 crate://crates.io/winsafe/0.0.19 crate://crates.io/wit-bindgen-rt/0.39.0 crate://crates.io/write16/1.0.0 crate://crates.io/writeable/0.5.5 crate://crates.io/xattr/1.3.1 crate://crates.io/xwin/0.6.5 crate://crates.io/xz2/0.1.7 crate://crates.io/yansi/1.0.1 crate://crates.io/yoke/0.7.4 crate://crates.io/yoke-derive/0.7.5 crate://crates.io/zerocopy/0.7.35 crate://crates.io/zerocopy-derive/0.7.35
  crate://crates.io/zerofrom/0.1.4 crate://crates.io/zerofrom-derive/0.1.5 crate://crates.io/zeroize/1.8.1 crate://crates.io/zerovec/0.10.4 crate://crates.io/zerovec-derive/0.10.3 crate://crates.io/zip/2.3.0 crate://crates.io/zopfli/0.8.1 crate://crates.io/zstd/0.13.3 crate://crates.io/zstd-safe/7.2.4 crate://crates.io/zstd-sys/2.0.15+zstd.1.5.7"
packages/core2-64-poky-linux/python3-maturin: PV changed from "1.8.6" to "1.8.7"
packages/core2-64-poky-linux/python3-maturin: PKGV changed from 1.8.6 [default] to 1.8.7 [default]
packages/core2-64-poky-linux/python3-maturin/python3-maturin-dbg: PV changed from "1.8.6" to "1.8.7"
packages/core2-64-poky-linux/python3-maturin/python3-maturin-dbg: PKGV changed from 1.8.6 [default] to 1.8.7 [default]
packages/core2-64-poky-linux/python3-maturin/python3-maturin-dbg: PKGSIZE changed from 6312760 to 6378504 (+1%)
packages/core2-64-poky-linux/python3-maturin/python3-maturin-dev: PV changed from "1.8.6" to "1.8.7"
packages/core2-64-poky-linux/python3-maturin/python3-maturin-dev: PKGV changed from 1.8.6 [default] to 1.8.7 [default]
packages/core2-64-poky-linux/python3-maturin/python3-maturin-doc: PV changed from "1.8.6" to "1.8.7"
packages/core2-64-poky-linux/python3-maturin/python3-maturin-doc: PKGV changed from 1.8.6 [default] to 1.8.7 [default]
packages/core2-64-poky-linux/python3-maturin/python3-maturin-locale: PV changed from "1.8.6" to "1.8.7"
packages/core2-64-poky-linux/python3-maturin/python3-maturin-locale: PKGV changed from 1.8.6 [default] to 1.8.7 [default]
packages/core2-64-poky-linux/python3-maturin/python3-maturin-src: PV changed from "1.8.6" to "1.8.7"
packages/core2-64-poky-linux/python3-maturin/python3-maturin-src: PKGV changed from 1.8.6 [default] to 1.8.7 [default]
packages/core2-64-poky-linux/python3-maturin/python3-maturin-staticdev: PV changed from "1.8.6" to "1.8.7"
packages/core2-64-poky-linux/python3-maturin/python3-maturin-staticdev: PKGV changed from 1.8.6 [default] to 1.8.7 [default]
packages/core2-64-poky-linux/python3-maturin/python3-maturin: PV changed from "1.8.6" to "1.8.7"
packages/core2-64-poky-linux/python3-maturin/python3-maturin: PKGV changed from 1.8.6 [default] to 1.8.7 [default]
packages/core2-64-poky-linux/python3-maturin/python3-maturin: PKGSIZE changed from 14154756 to 14638690 (+3%)
Changes to packages/core2-64-poky-linux/python3-maturin (sysroot):
  /usr/lib/python3.13/site-packages/maturin-1.8.6.dist-info moved to /usr/lib/python3.13/site-packages/maturin-1.8.7.dist-info

--===============2261669345143996173==
Content-Type: application/octet-stream
MIME-Version: 1.0
Content-Transfer-Encoding: base64
Content-Disposition: attachment;
 filename="0001-python3-maturin-upgrade-1.8.6-1.8.7.patch"

RnJvbSA3YjNiNTk2ZTA3ZTIzZGJhN2RlYzEzOTM4MTZmODY1ODM5YmE5MTQwIE1vbiBTZXAgMTcg
MDA6MDA6MDAgMjAwMQpGcm9tOiBVcGdyYWRlIEhlbHBlciA8YXVoQHlvY3RvcHJvamVjdC5vcmc+
CkRhdGU6IFN1biwgMTUgSnVuIDIwMjUgMDg6MzE6MzMgKzAwMDAKU3ViamVjdDogW1BBVENIXSBw
eXRob24zLW1hdHVyaW46IHVwZ3JhZGUgMS44LjYgLT4gMS44LjcKCi0tLQogLi4uL3B5dGhvbi9w
eXRob24zLW1hdHVyaW4tY3JhdGVzLmluYyAgICAgICAgIHwgIDMyICstCiAuLi5sLWNvZGVzLW9u
LXJpc2N2MzJnYy11bmtub3duLWxpbnV4LWcucGF0Y2ggfCAxMTAgLS0tLS0KIC4uLi9weXRob24v
cHl0aG9uMy1tYXR1cmluXzEuOC42LmJiICAgICAgICAgICB8ICA0NCAtLQogLi4uL3B5dGhvbi9w
eXRob24zLW1hdHVyaW5fMS44LjcuYmIgICAgICAgICAgIHwgNDE0ICsrKysrKysrKysrKysrKysr
KwogNCBmaWxlcyBjaGFuZ2VkLCA0MzggaW5zZXJ0aW9ucygrKSwgMTYyIGRlbGV0aW9ucygtKQog
ZGVsZXRlIG1vZGUgMTAwNjQ0IG1ldGEvcmVjaXBlcy1kZXZ0b29scy9weXRob24vcHl0aG9uMy1t
YXR1cmluLzAwMDEtRGVmaW5lLW1vcmUtaW9jdGwtY29kZXMtb24tcmlzY3YzMmdjLXVua25vd24t
bGludXgtZy5wYXRjaAogZGVsZXRlIG1vZGUgMTAwNjQ0IG1ldGEvcmVjaXBlcy1kZXZ0b29scy9w
eXRob24vcHl0aG9uMy1tYXR1cmluXzEuOC42LmJiCiBjcmVhdGUgbW9kZSAxMDA2NDQgbWV0YS9y
ZWNpcGVzLWRldnRvb2xzL3B5dGhvbi9weXRob24zLW1hdHVyaW5fMS44LjcuYmIKCmRpZmYgLS1n
aXQgYS9tZXRhL3JlY2lwZXMtZGV2dG9vbHMvcHl0aG9uL3B5dGhvbjMtbWF0dXJpbi1jcmF0ZXMu
aW5jIGIvbWV0YS9yZWNpcGVzLWRldnRvb2xzL3B5dGhvbi9weXRob24zLW1hdHVyaW4tY3JhdGVz
LmluYwppbmRleCA1YzkzOWEwOWE4Li5lYTdiZDQ4OGU2IDEwMDY0NAotLS0gYS9tZXRhL3JlY2lw
ZXMtZGV2dG9vbHMvcHl0aG9uL3B5dGhvbjMtbWF0dXJpbi1jcmF0ZXMuaW5jCisrKyBiL21ldGEv
cmVjaXBlcy1kZXZ0b29scy9weXRob24vcHl0aG9uMy1tYXR1cmluLWNyYXRlcy5pbmMKQEAgLTMz
LDEwICszMywxMCBAQCBTUkNfVVJJICs9ICIgXAogICAgIGNyYXRlOi8vY3JhdGVzLmlvL2Nhcmdv
LWNvbmZpZzIvMC4xLjI2IFwKICAgICBjcmF0ZTovL2NyYXRlcy5pby9jYXJnby1vcHRpb25zLzAu
Ny40IFwKICAgICBjcmF0ZTovL2NyYXRlcy5pby9jYXJnby1wbGF0Zm9ybS8wLjEuOCBcCi0gICAg
Y3JhdGU6Ly9jcmF0ZXMuaW8vY2FyZ28teHdpbi8wLjE4LjQgXAorICAgIGNyYXRlOi8vY3JhdGVz
LmlvL2NhcmdvLXh3aW4vMC4xOC42IFwKICAgICBjcmF0ZTovL2NyYXRlcy5pby9jYXJnby16aWdi
dWlsZC8wLjIwLjAgXAogICAgIGNyYXRlOi8vY3JhdGVzLmlvL2NhcmdvX21ldGFkYXRhLzAuMTku
MCBcCi0gICAgY3JhdGU6Ly9jcmF0ZXMuaW8vY2JpbmRnZW4vMC4yOC4wIFwKKyAgICBjcmF0ZTov
L2NyYXRlcy5pby9jYmluZGdlbi8wLjI5LjAgXAogICAgIGNyYXRlOi8vY3JhdGVzLmlvL2NjLzEu
Mi4xNiBcCiAgICAgY3JhdGU6Ly9jcmF0ZXMuaW8vY2ZiLzAuMTAuMCBcCiAgICAgY3JhdGU6Ly9j
cmF0ZXMuaW8vY2ZnLWlmLzEuMC4wIFwKQEAgLTEwNSwxMiArMTA1LDEyIEBAIFNSQ19VUkkgKz0g
IiBcCiAgICAgY3JhdGU6Ly9jcmF0ZXMuaW8vZnV0dXJlcy11dGlsLzAuMy4zMSBcCiAgICAgY3Jh
dGU6Ly9jcmF0ZXMuaW8vZ2VuZXJpYy1hcnJheS8wLjE0LjcgXAogICAgIGNyYXRlOi8vY3JhdGVz
LmlvL2dldHJhbmRvbS8wLjIuMTUgXAorICAgIGNyYXRlOi8vY3JhdGVzLmlvL2dldHJhbmRvbS8w
LjMuMyBcCiAgICAgY3JhdGU6Ly9jcmF0ZXMuaW8vZ2xvYi8wLjMuMSBcCiAgICAgY3JhdGU6Ly9j
cmF0ZXMuaW8vZ2xvYnNldC8wLjQuMTUgXAogICAgIGNyYXRlOi8vY3JhdGVzLmlvL2dvYmxpbi8w
LjkuMiBcCiAgICAgY3JhdGU6Ly9jcmF0ZXMuaW8vaGFzaGJyb3duLzAuMTQuNSBcCiAgICAgY3Jh
dGU6Ly9jcmF0ZXMuaW8vaGFzaGJyb3duLzAuMTUuMiBcCi0gICAgY3JhdGU6Ly9jcmF0ZXMuaW8v
aGVjay8wLjQuMSBcCiAgICAgY3JhdGU6Ly9jcmF0ZXMuaW8vaGVjay8wLjUuMCBcCiAgICAgY3Jh
dGU6Ly9jcmF0ZXMuaW8vaG9tZS8wLjUuOSBcCiAgICAgY3JhdGU6Ly9jcmF0ZXMuaW8vaHVtYW50
aW1lLzIuMS4wIFwKQEAgLTEzNSwxMSArMTM1LDEyIEBAIFNSQ19VUkkgKz0gIiBcCiAgICAgY3Jh
dGU6Ly9jcmF0ZXMuaW8vaXRlcnRvb2xzLzAuMTIuMSBcCiAgICAgY3JhdGU6Ly9jcmF0ZXMuaW8v
aXRlcnRvb2xzLzAuMTMuMCBcCiAgICAgY3JhdGU6Ly9jcmF0ZXMuaW8vaXRvYS8xLjAuMTEgXAor
ICAgIGNyYXRlOi8vY3JhdGVzLmlvL2pvYnNlcnZlci8wLjEuMzMgXAogICAgIGNyYXRlOi8vY3Jh
dGVzLmlvL2pzLXN5cy8wLjMuNzMgXAogICAgIGNyYXRlOi8vY3JhdGVzLmlvL2tleXJpbmcvMi4z
LjMgXAogICAgIGNyYXRlOi8vY3JhdGVzLmlvL2xhenlfc3RhdGljLzEuNC4wIFwKICAgICBjcmF0
ZTovL2NyYXRlcy5pby9sZGR0cmVlLzAuMy43IFwKLSAgICBjcmF0ZTovL2NyYXRlcy5pby9saWJj
LzAuMi4xNjcgXAorICAgIGNyYXRlOi8vY3JhdGVzLmlvL2xpYmMvMC4yLjE3MiBcCiAgICAgY3Jh
dGU6Ly9jcmF0ZXMuaW8vbGlibWltYWxsb2Mtc3lzLzAuMS4zOSBcCiAgICAgY3JhdGU6Ly9jcmF0
ZXMuaW8vbGlicmVkb3gvMC4xLjMgXAogICAgIGNyYXRlOi8vY3JhdGVzLmlvL2xpbnV4LWtleXV0
aWxzLzAuMi40IFwKQEAgLTE0OCw2ICsxNDksNyBAQCBTUkNfVVJJICs9ICIgXAogICAgIGNyYXRl
Oi8vY3JhdGVzLmlvL2xvY2tfYXBpLzAuNC4xMiBcCiAgICAgY3JhdGU6Ly9jcmF0ZXMuaW8vbG9j
a2ZyZWUtb2JqZWN0LXBvb2wvMC4xLjYgXAogICAgIGNyYXRlOi8vY3JhdGVzLmlvL2xvZy8wLjQu
MjIgXAorICAgIGNyYXRlOi8vY3JhdGVzLmlvL2x6bWEtcnMvMC4zLjAgXAogICAgIGNyYXRlOi8v
Y3JhdGVzLmlvL2x6bWEtc3lzLzAuMS4yMCBcCiAgICAgY3JhdGU6Ly9jcmF0ZXMuaW8vbHp4ZC8w
LjIuNSBcCiAgICAgY3JhdGU6Ly9jcmF0ZXMuaW8vbWFpbHBhcnNlLzAuMTUuMCBcCkBAIC0xOTks
NiArMjAxLDcgQEAgU1JDX1VSSSArPSAiIFwKICAgICBjcmF0ZTovL2NyYXRlcy5pby9weXRob24t
cGtnaW5mby8wLjYuNSBcCiAgICAgY3JhdGU6Ly9jcmF0ZXMuaW8vcXVvdGUvMS4wLjM3IFwKICAg
ICBjcmF0ZTovL2NyYXRlcy5pby9xdW90ZWRfcHJpbnRhYmxlLzAuNS4wIFwKKyAgICBjcmF0ZTov
L2NyYXRlcy5pby9yLWVmaS81LjIuMCBcCiAgICAgY3JhdGU6Ly9jcmF0ZXMuaW8vcmFuZC8wLjgu
NSBcCiAgICAgY3JhdGU6Ly9jcmF0ZXMuaW8vcmFuZF9jaGFjaGEvMC4zLjEgXAogICAgIGNyYXRl
Oi8vY3JhdGVzLmlvL3JhbmRfY29yZS8wLjYuNCBcCkBAIC0zMTIsNiArMzE1LDcgQEAgU1JDX1VS
SSArPSAiIFwKICAgICBjcmF0ZTovL2NyYXRlcy5pby93YWl0LXRpbWVvdXQvMC4yLjAgXAogICAg
IGNyYXRlOi8vY3JhdGVzLmlvL3dhbGtkaXIvMi41LjAgXAogICAgIGNyYXRlOi8vY3JhdGVzLmlv
L3dhc2kvMC4xMS4wK3dhc2ktc25hcHNob3QtcHJldmlldzEgXAorICAgIGNyYXRlOi8vY3JhdGVz
LmlvL3dhc2kvMC4xNC4yK3dhc2ktMC4yLjQgXAogICAgIGNyYXRlOi8vY3JhdGVzLmlvL3dhc20t
YmluZGdlbi8wLjIuOTYgXAogICAgIGNyYXRlOi8vY3JhdGVzLmlvL3dhc20tYmluZGdlbi1iYWNr
ZW5kLzAuMi45NiBcCiAgICAgY3JhdGU6Ly9jcmF0ZXMuaW8vd2FzbS1iaW5kZ2VuLW1hY3JvLzAu
Mi45NiBcCkBAIC0zNDcsNiArMzUxLDcgQEAgU1JDX1VSSSArPSAiIFwKICAgICBjcmF0ZTovL2Ny
YXRlcy5pby93aW5ub3cvMC41LjQwIFwKICAgICBjcmF0ZTovL2NyYXRlcy5pby93aW5ub3cvMC42
LjIwIFwKICAgICBjcmF0ZTovL2NyYXRlcy5pby93aW5zYWZlLzAuMC4xOSBcCisgICAgY3JhdGU6
Ly9jcmF0ZXMuaW8vd2l0LWJpbmRnZW4tcnQvMC4zOS4wIFwKICAgICBjcmF0ZTovL2NyYXRlcy5p
by93cml0ZTE2LzEuMC4wIFwKICAgICBjcmF0ZTovL2NyYXRlcy5pby93cml0ZWFibGUvMC41LjUg
XAogICAgIGNyYXRlOi8vY3JhdGVzLmlvL3hhdHRyLzEuMy4xIFwKQEAgLTM2NCw2ICszNjksOSBA
QCBTUkNfVVJJICs9ICIgXAogICAgIGNyYXRlOi8vY3JhdGVzLmlvL3plcm92ZWMtZGVyaXZlLzAu
MTAuMyBcCiAgICAgY3JhdGU6Ly9jcmF0ZXMuaW8vemlwLzIuMy4wIFwKICAgICBjcmF0ZTovL2Ny
YXRlcy5pby96b3BmbGkvMC44LjEgXAorICAgIGNyYXRlOi8vY3JhdGVzLmlvL3pzdGQvMC4xMy4z
IFwKKyAgICBjcmF0ZTovL2NyYXRlcy5pby96c3RkLXNhZmUvNy4yLjQgXAorICAgIGNyYXRlOi8v
Y3JhdGVzLmlvL3pzdGQtc3lzLzIuMC4xNSt6c3RkLjEuNS43IFwKICIKIAogU1JDX1VSSVthZGxl
cjItMi4wLjAuc2hhMjU2c3VtXSA9ICI1MTI3NjFlMGJiMjU3OGRkNzM4MGM2YmFhYTBmNGNlMDNl
ODRmOTVlOTYwMjMxZDFkZWM4YmY0ZDdkNmUyNjI3IgpAQCAtMzk3LDEwICs0MDUsMTAgQEAgU1JD
X1VSSVtjYW1pbm8tMS4xLjkuc2hhMjU2c3VtXSA9ICI4Yjk2ZWM0OTY2YjU4MTNlMmMwNTA3YzFm
ODYxMTVjOGM1YWJhYWRjMzk4MDgKIFNSQ19VUklbY2FyZ28tY29uZmlnMi0wLjEuMjYuc2hhMjU2
c3VtXSA9ICJkODNjZTBiZThiZDE0NzllNWRlNjIwMmRlZjY2MGU2YzdlMjdlNGUwNTk5YmZmYTRm
ZWQwNWJkMzgwZWMyZWRlIgogU1JDX1VSSVtjYXJnby1vcHRpb25zLTAuNy40LnNoYTI1NnN1bV0g
PSAiZjM1NDAyNDdjMGEzN2E3NmViMzI0YWNjMjM4ZGM2MTc3ODZlYTIyYzQzYjk1ZGE1NjBjODJh
OGYyNzE0MzIxZiIKIFNSQ19VUklbY2FyZ28tcGxhdGZvcm0tMC4xLjguc2hhMjU2c3VtXSA9ICIy
NGIxZjAzNjVhNmM2YmI0MDIwY2QwNTgwNmZkMGQzM2M0NGQzODA0NmI4YmQ3ZjBlNDA4MTRiOTc2
M2NhYmZjIgotU1JDX1VSSVtjYXJnby14d2luLTAuMTguNC5zaGEyNTZzdW1dID0gIjYwZjE5NTRl
NGZmYTBmNGM0N2IzZGY1ZTZlOTUwODcwNmQ4ZGNhYTU2MTUyY2Q2NzJkY2VlMDI5MzBiYTAzMjYi
CitTUkNfVVJJW2NhcmdvLXh3aW4tMC4xOC42LnNoYTI1NnN1bV0gPSAiNWRmZjgzYWFkMzMyYmQ2
ZWUyOTA3MmRkODc0YjQ4ODkyY2QyMmM1OGUyMzNjMjU3MzVlYjQ0MTdiMzk5OTY4NSIKIFNSQ19V
UklbY2FyZ28temlnYnVpbGQtMC4yMC4wLnNoYTI1NnN1bV0gPSAiM2Y2ZTllODU2MzkwZDViMGE4
NTlhY2FlZGExNjUyOGY4YTYxYzk2NGJkYjg5NGMzMjE2YzI1NDkwOGYxYzJlYSIKIFNSQ19VUklb
Y2FyZ29fbWV0YWRhdGEtMC4xOS4wLnNoYTI1NnN1bV0gPSAiYWZjMzA5ZWQ4OTQ3NmM4OTU3YzUw
ZmI4MThmNTZmZTg5NGRiODU3ODY2YzNlMTYzMzM1ZmFhOTFkYzM0ZWI4NSIKLVNSQ19VUklbY2Jp
bmRnZW4tMC4yOC4wLnNoYTI1NnN1bV0gPSAiZWFkZDg2OGEyY2U5Y2EzOGRlN2VlYWZkY2VjOWM3
MDY1ZWY4OWI0MmIzMmYwODM5Mjc4ZDU1ZjM1YzU0ZDFmZiIKK1NSQ19VUklbY2JpbmRnZW4tMC4y
OS4wLnNoYTI1NnN1bV0gPSAiOTc1OTgyY2RiN2FkNmExNDJiZTE1YmRmODRhZWE3ZWM2YTllNWQ0
ZDc5N2MwMDRkNDMxODViMjRjZmU0ZTY4NCIKIFNSQ19VUklbY2MtMS4yLjE2LnNoYTI1NnN1bV0g
PSAiYmU3MTRjMTU0YmU2MDllYzdmNWRhZDIyM2EzM2JmMTQ4MmZmZjkwNDcyZGUyOGY3MzYyODA2
ZTZkNDgzMmI4YyIKIFNSQ19VUklbY2ZiLTAuMTAuMC5zaGEyNTZzdW1dID0gImQ4YTRmOGU1NWJl
MzIzYjM3OGZhY2ZjZjFmMDZhYTk3ZjZlYzE3Y2Y0YWM4NGZiMTczMjUwOTNhYWY2MmRhNDEiCiBT
UkNfVVJJW2NmZy1pZi0xLjAuMC5zaGEyNTZzdW1dID0gImJhZjFkZTQzMzk3NjE1ODhiYzA2MTll
M2NiYzAxMjBlZTU4MmViYjc0YjUzYjRlZmJmNzkxMTdiZDJkYTQwZmQiCkBAIC00NjksMTIgKzQ3
NywxMiBAQCBTUkNfVVJJW2Z1dHVyZXMtdGltZXItMy4wLjMuc2hhMjU2c3VtXSA9ICJmMjg4YjBh
NGYyMGY5YTU2YjVkMWRhNTdlMjIyN2M2NjFiN2IxNgogU1JDX1VSSVtmdXR1cmVzLXV0aWwtMC4z
LjMxLnNoYTI1NnN1bV0gPSAiOWZhMDgzMTViYjYxMjA4OGNjMzkxMjQ5ZWZkYzNiYzc3NTM2ZjE2
YzkxZjZjZjQ5NWU2ZmJlODViMjBhNGE4MSIKIFNSQ19VUklbZ2VuZXJpYy1hcnJheS0wLjE0Ljcu
c2hhMjU2c3VtXSA9ICI4NTY0OWNhNTFmZDcyMjcyZDc4MjFhZGFmMjc0YWQ5MWMyODgyNzc3MTNk
OWMxODgyMGQ4NDk5YTdmZjY5ZTlhIgogU1JDX1VSSVtnZXRyYW5kb20tMC4yLjE1LnNoYTI1NnN1
bV0gPSAiYzQ1NjdjOGRiMTBhZTkxMDg5Yzk5YWY4NGM2OGMzOGRhM2VjMmYwODdjM2Y4Mjk2MGJj
ZGJmMzY1NmI2ZjRkNyIKK1NSQ19VUklbZ2V0cmFuZG9tLTAuMy4zLnNoYTI1NnN1bV0gPSAiMjYx
NDVlNTYzZTU0ZjJjYWRjNDc3NTUzZjFlYzVlZTY1MGIwMDg2MmYwYTU4YmNkMTJjYmRjNWYwZWEy
ZDJmNCIKIFNSQ19VUklbZ2xvYi0wLjMuMS5zaGEyNTZzdW1dID0gImQyZmFiY2ZiZGM4N2Y0NzU4
MzM3Y2E1MzVmYjQxYTZkNzAxYjY1NjkzY2UzODI4N2Q4NTZkMTY3NDU1MWVjOWIiCiBTUkNfVVJJ
W2dsb2JzZXQtMC40LjE1LnNoYTI1NnN1bV0gPSAiMTVmMWNlNjg2NjQ2ZTdmMWUxOWJmN2Q1NTMz
ZmU0NDNhNDVkYmZiOTkwZTAwNjI5MTEwNzk3NTc4YjQyZmIxOSIKIFNSQ19VUklbZ29ibGluLTAu
OS4yLnNoYTI1NnN1bV0gPSAiNTNhYjNmMzJkMWQ3NzE0Njk4MWRlYTVkNmIxZThmZTMxZWVkY2I3
MDEzZTVlMDBkNmNjZDEyNTlhNGI0ZDkyMyIKIFNSQ19VUklbaGFzaGJyb3duLTAuMTQuNS5zaGEy
NTZzdW1dID0gImU1Mjc0NDIzZTE3YjdjOWZjMjBiNmU3ZTIwODUzMmY5YjE5ODI1ZDgyZGZkNjE1
NzA4YjcwZWRkODNkZjQxZjEiCiBTUkNfVVJJW2hhc2hicm93bi0wLjE1LjIuc2hhMjU2c3VtXSA9
ICJiZjE1MTQwMGZmMGJhZmY1NDY1MDA3ZGQyZjNlNzE3ZjNmZTUwMjA3NGNhNTYzMDY5Y2UzYTY2
MjlkMDdiMjg5IgotU1JDX1VSSVtoZWNrLTAuNC4xLnNoYTI1NnN1bV0gPSAiOTU1MDVjMzhiNDU3
MmIyZDkxMGNlY2IwMjgxNTYwZjU0YjQ0MGExOTMzNmNiYmNiMjdiZjZjZTZhZGM2ZjVhOCIKIFNS
Q19VUklbaGVjay0wLjUuMC5zaGEyNTZzdW1dID0gIjIzMDRlMDA5ODNmODdmZmIzOGI1NWI0NDRi
NWUzYjYwYTg4NGI1ZDMwYzBmY2E3ZDgyZmUzMzQ0OWJiZTU1ZWEiCiBTUkNfVVJJW2hvbWUtMC41
Ljkuc2hhMjU2c3VtXSA9ICJlM2QxMzU0YmY2YjcyMzVjYjRhMDU3NmMyNjE5ZmQ0ZWQxODE4M2Y2
ODliMTJiMDA2YTBlZTczMjllZWZmOWE1IgogU1JDX1VSSVtodW1hbnRpbWUtMi4xLjAuc2hhMjU2
c3VtXSA9ICI5YTNhNWJmYjE5NTkzMWVlYjMzNmIyYTdiNGQ3NjFkYWVjODQxYjk3Zjk0N2QzNDM5
NDYwMTczN2E3YmJhNWU0IgpAQCAtNDk5LDExICs1MDcsMTIgQEAgU1JDX1VSSVtpc190ZXJtaW5h
bF9wb2x5ZmlsbC0xLjcwLjAuc2hhMjU2c3VtXSA9ICJmODQ3ODU3N2MwMzU1MmMyMWRiMGUyNzI0
ZmZiODkKIFNSQ19VUklbaXRlcnRvb2xzLTAuMTIuMS5zaGEyNTZzdW1dID0gImJhMjkxMDIyZGJi
ZDM5OGE0NTVhY2YxMjZjMWUzNDE5NTQwNzk4NTViYzYwZGZkZGE2NDEzNjNiZDY5MjI1NjkiCiBT
UkNfVVJJW2l0ZXJ0b29scy0wLjEzLjAuc2hhMjU2c3VtXSA9ICI0MTNlZTdkZmM1MmVlMWE0OTQ5
Y2VlYjdkYmM4YTMzZjJkNmMwODgxOTRkOWY5MjJmYjgzMThmYWYxZjAxMTg2IgogU1JDX1VSSVtp
dG9hLTEuMC4xMS5zaGEyNTZzdW1dID0gIjQ5ZjFmMTQ4NzMzMzU0NTQ1MDBkNTk2MTFmMWNmNGE0
YjBmNzg2ZjlhYzExZjQzMTJhNzhlNGNmMjU2NjY5NWIiCitTUkNfVVJJW2pvYnNlcnZlci0wLjEu
MzMuc2hhMjU2c3VtXSA9ICIzOGYyNjJmMDk3YzE3NGFkZWJlNDFlYjczZDY2YWU5YzA2YjI4NDRm
YjBkYTY5OTY5NjQ3YmJkZGQ5YjA1MzhhIgogU1JDX1VSSVtqcy1zeXMtMC4zLjczLnNoYTI1NnN1
bV0gPSAiZmIxNTE0NzE1OGU3OWZkOGI4YWZkMDI1MjUyMjc2OWM0ZjQ4NzI1NDYwYjM3MzM4NTQ0
ZDgzNzlkOTRmYzhmOSIKIFNSQ19VUklba2V5cmluZy0yLjMuMy5zaGEyNTZzdW1dID0gIjM2MzM4
N2YwMDE5ZDcxNGFhNjBjYzMwYWI0ZmU1MDFhNzQ3ZjRjMDhmYzU4ZjA2OWRkMTRiZTk3MWJkNDk1
YTAiCiBTUkNfVVJJW2xhenlfc3RhdGljLTEuNC4wLnNoYTI1NnN1bV0gPSAiZTJhYmFkMjNmYmM0
MmIzNzAwZjJmMjc5ODQ0ZGM4MzJhZGIyYjJlYjA2OWIyZGY5MThmNDU1YzRlMThjYzY0NiIKIFNS
Q19VUklbbGRkdHJlZS0wLjMuNy5zaGEyNTZzdW1dID0gImUwNzc5YWM5NGJkN2I2YWI3ODFmYTEy
Mzg4ZGJmNzlhYzQ1ZWMxZmE0MzNlN2QyNTUyMTc1M2JlODIyN2IwOGUiCi1TUkNfVVJJW2xpYmMt
MC4yLjE2Ny5zaGEyNTZzdW1dID0gIjA5ZDY1ODJlMTA0MzE1YTgxN2RmZjk3Zjc1MTMzNTQ0YjJl
MDk0ZWUyMjQ0N2QyYWNmNGE3NGUxODliYTA2ZmMiCitTUkNfVVJJW2xpYmMtMC4yLjE3Mi5zaGEy
NTZzdW1dID0gImQ3NTBhZjA0MmY3ZWY0ZjcyNDMwNmRlMDI5ZDE4ODM2YzI2YzE3NjVhNTRhNmEz
ZjA5NGNiZDIzYTcyNjdmZmEiCiBTUkNfVVJJW2xpYm1pbWFsbG9jLXN5cy0wLjEuMzkuc2hhMjU2
c3VtXSA9ICIyM2FhNjgxMWQzYmQ0ZGViOGE4NGRkZTY0NWY5NDM0NzZkMTNiMjQ4ZDgxOGVkY2Y4
Y2UwYjJmMzdmMDM2YjQ0IgogU1JDX1VSSVtsaWJyZWRveC0wLjEuMy5zaGEyNTZzdW1dID0gImMw
ZmYzN2JkNTkwY2EyNTA2M2UzNWFmNzQ1YzM0M2NiN2EwMjcxOTA2ZmI3YjM3ZTQ4MTNlOGY3OWYw
MDI2OGQiCiBTUkNfVVJJW2xpbnV4LWtleXV0aWxzLTAuMi40LnNoYTI1NnN1bV0gPSAiNzYxZTQ5
ZWM1ZmQ4YTVhNDYzZjliODRlODc3YzM3M2Q4ODg5MzViNzFjNmJlNzhmMzc2N2ZlMmFlNmJlZDE4
ZSIKQEAgLTUxMiw2ICs1MjEsNyBAQCBTUkNfVVJJW2xpdGVtYXAtMC43LjMuc2hhMjU2c3VtXSA9
ICI2NDNjYjBiOGQ0ZmNjMjg0MDA0ZDVmZDBkNjdjY2Y2MWRmZmZhZGI3Zjc1ZQogU1JDX1VSSVts
b2NrX2FwaS0wLjQuMTIuc2hhMjU2c3VtXSA9ICIwN2FmOGI5Y2RkMjgxYjc5MTVmNDEzZmE3M2Yy
OWViZDVkNTVkMGQzZjAxNTU1ODRkYWRlMWZmMThjZWExYjE3IgogU1JDX1VSSVtsb2NrZnJlZS1v
YmplY3QtcG9vbC0wLjEuNi5zaGEyNTZzdW1dID0gIjkzNzRlZjQyMjg0MDJkNGI3ZTQwM2U1ODM4
Y2I4ODBkOWVlNjYzMzE0YjBhOTAwZDVhNmFhYmYwYzIxMzU1MmUiCiBTUkNfVVJJW2xvZy0wLjQu
MjIuc2hhMjU2c3VtXSA9ICJhN2E3MGJhMDI0YjlkYzA0YzI3ZWEyZjBjMDU0OGZlYjQ3NGVjNWM1
NGJiYTMzYTdmNzJmODczYTM5ZDA3YjI0IgorU1JDX1VSSVtsem1hLXJzLTAuMy4wLnNoYTI1NnN1
bV0gPSAiMjk3ZTgxNGM4MzZhZTY0ZGI4NmIzNmNmMmE1NTdiYTU0MzY4ZDAzZjZhZmNkN2Q5NDdj
MjY2NjkyZjcxMTE1ZSIKIFNSQ19VUklbbHptYS1zeXMtMC4xLjIwLnNoYTI1NnN1bV0gPSAiNWZk
YTA0YWIzNzY0ZTZjZGU3OGI5OTc0ZWVjNGY3NzlhY2FiYTdjNGU4NGIzNmVjYTNjZjc3YzU4MWI4
NWQyNyIKIFNSQ19VUklbbHp4ZC0wLjIuNS5zaGEyNTZzdW1dID0gIjVkZTczMzZhMTgzMTAzNDI5
YWQ2NmQxMWQ1NmQ4YmRjOWM0YTI5MTZmNmI4NWE4ZjExZTViMTI3YmRlMTIwMDEiCiBTUkNfVVJJ
W21haWxwYXJzZS0wLjE1LjAuc2hhMjU2c3VtXSA9ICIzZGEwM2Q1OTgwNDExYTcyNGU4YWFmN2I2
MWE3YjVlMzg2ZWM1NWE3ZmI0OWVlM2QwZmY3OWVmYzdlNWU3YzdlIgpAQCAtNTYzLDYgKzU3Myw3
IEBAIFNSQ19VUklbcHlwcm9qZWN0LXRvbWwtMC4xMy40LnNoYTI1NnN1bV0gPSAiNjQzYWY1N2Mz
ZjM2YmE5MGE4YjUzZTk3MjcyN2Q4MDkyZjc0CiBTUkNfVVJJW3B5dGhvbi1wa2dpbmZvLTAuNi41
LnNoYTI1NnN1bV0gPSAiYzIxZjU4ODgwZmM0NWU5MWQyOWIyZjYzOWFiNDA1MWFhYTZhMmIwNTQ1
MzRjMmQzNDNhOTUzMzQ3ZDBkZDYwMCIKIFNSQ19VUklbcXVvdGUtMS4wLjM3LnNoYTI1NnN1bV0g
PSAiYjViOWQzNGI4OTkxZDE5ZDk4MDgxYjQ2ZWFjZGQ4ZWI1OGM2ZjJiMjAxMTM5ZjdjNWY2NDNj
YzE1NWE2MzNhZiIKIFNSQ19VUklbcXVvdGVkX3ByaW50YWJsZS0wLjUuMC5zaGEyNTZzdW1dID0g
Ijc5ZWMyODJlODg3YjQzNGI2OGMxOGZlNWMxMjFkMzhlNzJhNWNmMzUxMTliNTllNTRlYzViOTky
ZWE5YzhlYjAiCitTUkNfVVJJW3ItZWZpLTUuMi4wLnNoYTI1NnN1bV0gPSAiNzQ3NjVmNmQ5MTZl
ZTJmYWEzOWJjOGU2OGU0ZjNlZDg5NDliNDhjY2NkYWM1OTk4M2QyODdhN2NiNzFjZTljNSIKIFNS
Q19VUklbcmFuZC0wLjguNS5zaGEyNTZzdW1dID0gIjM0YWY4ZDFhMGUyNTkyNGJjNWI3YzQzYzA3
OWM5NDIzMzlkOGYwYThiNTdjMzkwNDliZWY1ODFiNDYzMjc0MDQiCiBTUkNfVVJJW3JhbmRfY2hh
Y2hhLTAuMy4xLnNoYTI1NnN1bV0gPSAiZTZjMTBhNjNhMGZhMzIyNTJiZTQ5ZDIxZTc3MDlkNGQ0
YmFmOGQyMzFjMmRiY2UxZWFhODE0MWI5YjEyN2Q4OCIKIFNSQ19VUklbcmFuZF9jb3JlLTAuNi40
LnNoYTI1NnN1bV0gPSAiZWMwYmU0Nzk1ZTJmNmEyODA2OWJlYzBiNWZmM2UyYWM5YmFmYzk5ZTZh
OWE3ZGMzNTQ3OTk2YzVjODE2OTIyYyIKQEAgLTY3Niw2ICs2ODcsNyBAQCBTUkNfVVJJW3ZlcnNp
b25zLTYuMi4wLnNoYTI1NnN1bV0gPSAiMzhhODkzMWY4ZDE2N2I2NDQ4MDc2MDIwZTcwYjlkZTQ2
ZGNmNWVhMTczMQogU1JDX1VSSVt3YWl0LXRpbWVvdXQtMC4yLjAuc2hhMjU2c3VtXSA9ICI5ZjIw
MGY1YjEyZWI3NWY4YzFlZDY1YWJkNGIyZGI4YTZlMWIxMzhhMjBkZTAwOWRhY2VlMjY1YTI0OThm
M2Y2IgogU1JDX1VSSVt3YWxrZGlyLTIuNS4wLnNoYTI1NnN1bV0gPSAiMjk3OTA5NDY0MDRmOTFk
OWM1ZDA2Zjk4NzRlZmRkZWExZGMwNmM1ZWZlOTQ1NDFhN2Q2ODYzMTA4ZTNhNWU0YiIKIFNSQ19V
Uklbd2FzaS0wLjExLjArd2FzaS1zbmFwc2hvdC1wcmV2aWV3MS5zaGEyNTZzdW1dID0gIjljOGQ4
N2U3MmI2NGEzYjRkYjI4ZDExY2UyOTIzN2MyNDYxODhmNGY1MTA1N2Q2NWE3ZWFiNjNiNzk4N2U0
MjMiCitTUkNfVVJJW3dhc2ktMC4xNC4yK3dhc2ktMC4yLjQuc2hhMjU2c3VtXSA9ICI5NjgzZjlh
NWE5OThkODczYzBkMjFmY2JlM2MwODMwMDk2NzAxNDlhOGZhYjIyODY0NGI4YmQzNmIyYzQ4Y2Iz
IgogU1JDX1VSSVt3YXNtLWJpbmRnZW4tMC4yLjk2LnNoYTI1NnN1bV0gPSAiMjFkM2IyNWMzZWEx
MTI2YTJhZDVmNGY5MDY4NDgzYzJhZjFlNjQxNjhmODQ3YWJlODYzYTUyNmI4ZGJmZTAwYiIKIFNS
Q19VUklbd2FzbS1iaW5kZ2VuLWJhY2tlbmQtMC4yLjk2LnNoYTI1NnN1bV0gPSAiNTI4NTdkNGMz
MmU0OTZkYzY1Mzc2NDZiNWIxMTcwODFlNzFmZDJmZjA2ZGU3OTJlMzU3N2ExNTA2MjdkYjI4MyIK
IFNSQ19VUklbd2FzbS1iaW5kZ2VuLW1hY3JvLTAuMi45Ni5zaGEyNTZzdW1dID0gIjkyMGIwZmZl
MDY5NTcxZWJiZmM5ZGRjMGIzNmJhMzA1ZWY2NTU3N2M5NGIwNjI2MmVkNzkzNzE2YTFhZmQ5ODEi
CkBAIC03MTEsNiArNzIzLDcgQEAgU1JDX1VSSVt3aW5kb3dzX3g4Nl82NF9tc3ZjLTAuNTIuNS5z
aGEyNTZzdW1dID0gImJlYzQ3ZTViZmQxYmZmMGVlYWY2ZDhiNDg1Y2MxMDcKIFNSQ19VUklbd2lu
bm93LTAuNS40MC5zaGEyNTZzdW1dID0gImY1OTNhOTUzOTg3MzdhZWVkNTNlNDg5Yzc4NWRmMTNm
MzYxOGU0MWRiY2Q2NzE4YzZhZGRiZjEzOTVhYTY4NzYiCiBTUkNfVVJJW3dpbm5vdy0wLjYuMjAu
c2hhMjU2c3VtXSA9ICIzNmMxZmVjMWEyYmI1ODY2ZjA3YzI1ZjY4YzI2ZTU2NWM0YzIwMGFlYmI5
NmQ3ZTU1NzEwYzE5ZDNlOGFjNDliIgogU1JDX1VSSVt3aW5zYWZlLTAuMC4xOS5zaGEyNTZzdW1d
ID0gImQxMzVkMTdhYjc3MDI1MmFkOTVlOWE4NzJkMzY1Y2YzMDkwZTNiZTg2NGEzNGFiNDZmNDg1
NTU5OTNlZmM5MDQiCitTUkNfVVJJW3dpdC1iaW5kZ2VuLXJ0LTAuMzkuMC5zaGEyNTZzdW1dID0g
IjZmNDIzMjBlNjFmZTJjZmQzNDM1NGVjYjU5N2Y4NmY0MTM0ODRhNzk4YmE0NGE4Y2ExMTY1YzU4
ZDQyZGE2YzEiCiBTUkNfVVJJW3dyaXRlMTYtMS4wLjAuc2hhMjU2c3VtXSA9ICJkMTg5MGY0MDIy
NzU5ZGFhZTI4ZWQ0ZmU2Mjg1OWIxMjM2Y2FlYmZjNjFlZGUyZjYzZWQ0ZTY5NWYzZjZkOTM2Igog
U1JDX1VSSVt3cml0ZWFibGUtMC41LjUuc2hhMjU2c3VtXSA9ICIxZTlkZjM4ZWUyZDJjM2M1OTQ4
ZWE0NjhhODQwNmZmMGRiMGIyOWFlMWZmZGUxYmNmMjBlZjMwNWJjYzk1YzUxIgogU1JDX1VSSVt4
YXR0ci0xLjMuMS5zaGEyNTZzdW1dID0gIjhkYTg0ZjFhMjU5MzliMjdmNjgyMGQ5MmFlZDEwOGY4
M2ZmOTIwZmRmMTFhN2IxOTM2NmMyN2M0Y2RhODFkNGYiCkBAIC03MjgsMyArNzQxLDYgQEAgU1JD
X1VSSVt6ZXJvdmVjLTAuMTAuNC5zaGEyNTZzdW1dID0gImFhMmI4OTNkNzlkZjIzYmZiMTJkNTQ2
MTAxOGQ0MDhlYTE5ZGZhZmU3NmMKIFNSQ19VUklbemVyb3ZlYy1kZXJpdmUtMC4xMC4zLnNoYTI1
NnN1bV0gPSAiNmVhZmE2ZGZiMTc1ODRlYTNlMmJkNmU3NmUwY2MxNWFkN2FmMTJiMDlhYmRkMWNh
NTU5NjFiZWQ5YjEwNjNjNiIKIFNSQ19VUklbemlwLTIuMy4wLnNoYTI1NnN1bV0gPSAiODRlOWE3
NzJhNTRiNTQyMzZiOWI3NDRhYWFmOGQ3YmUwMWI0ZDZlOTk3MjU1MjNjYjgyY2IzMmQxYzgxYjFk
NyIKIFNSQ19VUklbem9wZmxpLTAuOC4xLnNoYTI1NnN1bV0gPSAiZTUwMTlmMzkxYmFjNWNmMjUy
ZTkzYmJjYzUzZDAzOWZmZDYyYzdiZmI3YzE1MDQxNGQ2MTM2OWFmZTU3ZTk0NiIKK1NSQ19VUklb
enN0ZC0wLjEzLjMuc2hhMjU2c3VtXSA9ICJlOTFlZTMxMWE1NjljMzI3MTcxNjUxNTY2ZTA3OTcy
MjAwZTc2ZmNmZTIyNDJhNGZhNDQ2MTQ5YTM4ODFjMDhhIgorU1JDX1VSSVt6c3RkLXNhZmUtNy4y
LjQuc2hhMjU2c3VtXSA9ICI4ZjQ5YzRkNWYwYWJiNjAyYTkzZmI4NzM2YWYyYTRmNGRkOTUxMmUz
NmY3ZjU3MGQ2NmU2NWZmODY3ZWQzYjlkIgorU1JDX1VSSVt6c3RkLXN5cy0yLjAuMTUrenN0ZC4x
LjUuNy5zaGEyNTZzdW1dID0gImViODExODNkZGQ5N2QwYzc0Y2VkZjFkNTBkODVjOGQwOGMxYjhi
NjhlZTg2M2JkZWU5ZTcwNmVlZGJhMWEyMzciCmRpZmYgLS1naXQgYS9tZXRhL3JlY2lwZXMtZGV2
dG9vbHMvcHl0aG9uL3B5dGhvbjMtbWF0dXJpbi8wMDAxLURlZmluZS1tb3JlLWlvY3RsLWNvZGVz
LW9uLXJpc2N2MzJnYy11bmtub3duLWxpbnV4LWcucGF0Y2ggYi9tZXRhL3JlY2lwZXMtZGV2dG9v
bHMvcHl0aG9uL3B5dGhvbjMtbWF0dXJpbi8wMDAxLURlZmluZS1tb3JlLWlvY3RsLWNvZGVzLW9u
LXJpc2N2MzJnYy11bmtub3duLWxpbnV4LWcucGF0Y2gKZGVsZXRlZCBmaWxlIG1vZGUgMTAwNjQ0
CmluZGV4IGFjZWVmYTc5NjcuLjAwMDAwMDAwMDAKLS0tIGEvbWV0YS9yZWNpcGVzLWRldnRvb2xz
L3B5dGhvbi9weXRob24zLW1hdHVyaW4vMDAwMS1EZWZpbmUtbW9yZS1pb2N0bC1jb2Rlcy1vbi1y
aXNjdjMyZ2MtdW5rbm93bi1saW51eC1nLnBhdGNoCisrKyAvZGV2L251bGwKQEAgLTEsMTEwICsw
LDAgQEAKLUZyb20gNGI0MzliMDk1MzU3M2UwMzgzZGE3ZTA5MmIxZjUxNmJhMjFmMzM5OCBNb24g
U2VwIDE3IDAwOjAwOjAwIDIwMDEKLUZyb206IERhbiBHb2htYW4gPGRldkBzdW5maXNoY29kZS5v
bmxpbmU+Ci1EYXRlOiBTdW4sIDYgQXByIDIwMjUgMDU6MjI6NDkgLTA3MDAKLVN1YmplY3Q6IFtQ
QVRDSF0gRGVmaW5lIExpbnV4IGlvY3RsIGNvZGVzIG9uIG1vcmUgYXJjaGl0ZWN0dXJlcy4KLQot
RGVmaW5lIGlvY3RsIGNvZGVzIGluY2x1ZGluZyBgRklDTE9ORWAgYW5kIGBGU19JT0MzMl9HRVRW
RVJTSU9OYCB1c2luZwotYF9JT1JgIGFuZCBgX0lPV2Agc28gdGhhdCB0aGV5J3JlIGF1dG9tYXRp
Y2FsbHkgc3VwcG9ydGVkIG9uIGFsbAotYXJjaGl0ZWN0dXJlcywgaW5jbHVkaW5nIHJpc2N2MzJn
Yy11bmtub3duLWxpbnV4LWdudS4KLQotVXBzdHJlYW0tU3RhdHVzOiBCYWNrcG9ydCBbaHR0cHM6
Ly9naXRodWIuY29tL3J1c3QtbGFuZy9saWJjL3B1bGwvNDM4Mi9dCi1TaWduZWQtb2ZmLWJ5OiBL
aGVtIFJhaiA8cmFqLmtoZW1AZ21haWwuY29tPgotLS0tCi0gc3JjL3VuaXgvbGludXhfbGlrZS9s
aW51eC9hcmNoL2dlbmVyaWMvbW9kLnJzIHwgNzUgKysrKy0tLS0tLS0tLS0tLS0tLQotIDEgZmls
ZSBjaGFuZ2VkLCAxNSBpbnNlcnRpb25zKCspLCA2MCBkZWxldGlvbnMoLSkKLQotLS0tIGEvc3Jj
L3VuaXgvbGludXhfbGlrZS9saW51eC9hcmNoL2dlbmVyaWMvbW9kLnJzCi0rKysgYi9zcmMvdW5p
eC9saW51eF9saWtlL2xpbnV4L2FyY2gvZ2VuZXJpYy9tb2QucnMKLUBAIC0xLDUgKzEsNSBAQAot
IHVzZSBjcmF0ZTo6cHJlbHVkZTo6KjsKLS11c2UgY3JhdGU6OklvY3RsOwotK3VzZSBjcmF0ZTo6
e0lvY3RsLCBfSU9SLCBfSU9XfTsKLSAKLSBzISB7Ci0gICAgIHB1YiBzdHJ1Y3QgdGVybWlvczIg
ewotQEAgLTExNiwyMSArMTE2LDggQEAgY2ZnX2lmISB7Ci0gLy8gcHViIGNvbnN0IFNPX1BSRUZF
Ul9CVVNZX1BPTEw6IGNfaW50ID0gNjk7Ci0gLy8gcHViIGNvbnN0IFNPX0JVU1lfUE9MTF9CVURH
RVQ6IGNfaW50ID0gNzA7Ci0gCi0tY2ZnX2lmISB7Ci0tICAgIGlmICNbY2ZnKGFueSgKLS0gICAg
ICAgIHRhcmdldF9hcmNoID0gIng4NiIsCi0tICAgICAgICB0YXJnZXRfYXJjaCA9ICJ4ODZfNjQi
LAotLSAgICAgICAgdGFyZ2V0X2FyY2ggPSAiYXJtIiwKLS0gICAgICAgIHRhcmdldF9hcmNoID0g
ImFhcmNoNjQiLAotLSAgICAgICAgdGFyZ2V0X2FyY2ggPSAicmlzY3Y2NCIsCi0tICAgICAgICB0
YXJnZXRfYXJjaCA9ICJzMzkweCIsCi0tICAgICAgICB0YXJnZXRfYXJjaCA9ICJjc2t5IiwKLS0g
ICAgICAgIHRhcmdldF9hcmNoID0gImxvb25nYXJjaDY0IgotLSAgICApKV0gewotLSAgICAgICAg
cHViIGNvbnN0IEZJQ0xPTkU6IGNfdWxvbmcgPSAweDQwMDQ5NDA5OwotLSAgICAgICAgcHViIGNv
bnN0IEZJQ0xPTkVSQU5HRTogY191bG9uZyA9IDB4NDAyMDk0MEQ7Ci0tICAgIH0KLS19Ci0rcHVi
IGNvbnN0IEZJQ0xPTkU6IElvY3RsID0gX0lPVzo6PGNfaW50PigweDk0LCA5KSBhcyBJb2N0bDsK
LStwdWIgY29uc3QgRklDTE9ORVJBTkdFOiBJb2N0bCA9IF9JT1c6OjxjcmF0ZTo6ZmlsZV9jbG9u
ZV9yYW5nZT4oMHg5NCwgMTMpIGFzIElvY3RsOwotIAotIC8vIERlZmluZWQgaW4gdW5peC9saW51
eF9saWtlL21vZC5ycwotIC8vIHB1YiBjb25zdCBTQ01fVElNRVNUQU1QOiBjX2ludCA9IFNPX1RJ
TUVTVEFNUDsKLUBAIC0yNDgsNDkgKzIzNSwxOCBAQCBwdWIgY29uc3QgVFVOR0VUVk5FVEJFOiBJ
b2N0bCA9IDB4ODAwNDU0Ci0gcHViIGNvbnN0IFRVTlNFVFNURUVSSU5HRUJQRjogSW9jdGwgPSAw
eDgwMDQ1NGUwOwotIHB1YiBjb25zdCBUVU5TRVRGSUxURVJFQlBGOiBJb2N0bCA9IDB4ODAwNDU0
ZTE7Ci0gCi0tY2ZnX2lmISB7Ci0tICAgIC8vIFRob3NlIHR5cGUgYXJlIGNvbnN0cnVjdGVkIHVz
aW5nIHRoZSBfSU9DIG1hY3JvCi0tICAgIC8vIERELVNTX1NTU1NfU1NTU19TU1NTLVRUVFRfVFRU
VC1OTk5OX05OTk4KLS0gICAgLy8gd2hlcmUgRCBzdGFuZHMgZm9yIGRpcmVjdGlvbiAoZWl0aGVy
IE5vbmUgKDAwKSwgUmVhZCAoMDEpIG9yIFdyaXRlICgxMSkpCi0tICAgIC8vIHdoZXJlIFMgc3Rh
bmRzIGZvciBzaXplIChpbnQsIGxvbmcsIHN0cnVjdC4uLikKLS0gICAgLy8gd2hlcmUgVCBzdGFu
ZHMgZm9yIHR5cGUgKCdmJywndicsJ1gnLi4uKQotLSAgICAvLyB3aGVyZSBOIHN0YW5kcyBmb3Ig
TlIgKE51bWJlUikKLS0gICAgaWYgI1tjZmcoYW55KAotLSAgICAgICAgdGFyZ2V0X2FyY2ggPSAi
eDg2IiwKLS0gICAgICAgIHRhcmdldF9hcmNoID0gImFybSIsCi0tICAgICAgICB0YXJnZXRfYXJj
aCA9ICJjc2t5IgotLSAgICApKV0gewotLSAgICAgICAgcHViIGNvbnN0IEZTX0lPQ19HRVRGTEFH
UzogSW9jdGwgPSAweDgwMDQ2NjAxOwotLSAgICAgICAgcHViIGNvbnN0IEZTX0lPQ19TRVRGTEFH
UzogSW9jdGwgPSAweDQwMDQ2NjAyOwotLSAgICAgICAgcHViIGNvbnN0IEZTX0lPQ19HRVRWRVJT
SU9OOiBJb2N0bCA9IDB4ODAwNDc2MDE7Ci0tICAgICAgICBwdWIgY29uc3QgRlNfSU9DX1NFVFZF
UlNJT046IElvY3RsID0gMHg0MDA0NzYwMjsKLS0gICAgICAgIHB1YiBjb25zdCBGU19JT0MzMl9H
RVRGTEFHUzogSW9jdGwgPSAweDgwMDQ2NjAxOwotLSAgICAgICAgcHViIGNvbnN0IEZTX0lPQzMy
X1NFVEZMQUdTOiBJb2N0bCA9IDB4NDAwNDY2MDI7Ci0tICAgICAgICBwdWIgY29uc3QgRlNfSU9D
MzJfR0VUVkVSU0lPTjogSW9jdGwgPSAweDgwMDQ3NjAxOwotLSAgICAgICAgcHViIGNvbnN0IEZT
X0lPQzMyX1NFVFZFUlNJT046IElvY3RsID0gMHg0MDA0NzYwMjsKLS0gICAgICAgIHB1YiBjb25z
dCBUVU5BVFRBQ0hGSUxURVI6IElvY3RsID0gMHg0MDA4NTRkNTsKLS0gICAgICAgIHB1YiBjb25z
dCBUVU5ERVRBQ0hGSUxURVI6IElvY3RsID0gMHg0MDA4NTRkNjsKLS0gICAgICAgIHB1YiBjb25z
dCBUVU5HRVRGSUxURVI6IElvY3RsID0gMHg4MDA4NTRkYjsKLS0gICAgfSBlbHNlIGlmICNbY2Zn
KGFueSgKLS0gICAgICAgIHRhcmdldF9hcmNoID0gIng4Nl82NCIsCi0tICAgICAgICB0YXJnZXRf
YXJjaCA9ICJyaXNjdjY0IiwKLS0gICAgICAgIHRhcmdldF9hcmNoID0gImFhcmNoNjQiLAotLSAg
ICAgICAgdGFyZ2V0X2FyY2ggPSAiczM5MHgiLAotLSAgICAgICAgdGFyZ2V0X2FyY2ggPSAibG9v
bmdhcmNoNjQiCi0tICAgICkpXSB7Ci0tICAgICAgICBwdWIgY29uc3QgRlNfSU9DX0dFVEZMQUdT
OiBJb2N0bCA9IDB4ODAwODY2MDE7Ci0tICAgICAgICBwdWIgY29uc3QgRlNfSU9DX1NFVEZMQUdT
OiBJb2N0bCA9IDB4NDAwODY2MDI7Ci0tICAgICAgICBwdWIgY29uc3QgRlNfSU9DX0dFVFZFUlNJ
T046IElvY3RsID0gMHg4MDA4NzYwMTsKLS0gICAgICAgIHB1YiBjb25zdCBGU19JT0NfU0VUVkVS
U0lPTjogSW9jdGwgPSAweDQwMDg3NjAyOwotLSAgICAgICAgcHViIGNvbnN0IEZTX0lPQzMyX0dF
VEZMQUdTOiBJb2N0bCA9IDB4ODAwNDY2MDE7Ci0tICAgICAgICBwdWIgY29uc3QgRlNfSU9DMzJf
U0VURkxBR1M6IElvY3RsID0gMHg0MDA0NjYwMjsKLS0gICAgICAgIHB1YiBjb25zdCBGU19JT0Mz
Ml9HRVRWRVJTSU9OOiBJb2N0bCA9IDB4ODAwNDc2MDE7Ci0tICAgICAgICBwdWIgY29uc3QgRlNf
SU9DMzJfU0VUVkVSU0lPTjogSW9jdGwgPSAweDQwMDQ3NjAyOwotLSAgICAgICAgcHViIGNvbnN0
IFRVTkFUVEFDSEZJTFRFUjogSW9jdGwgPSAweDQwMTA1NGQ1OwotLSAgICAgICAgcHViIGNvbnN0
IFRVTkRFVEFDSEZJTFRFUjogSW9jdGwgPSAweDQwMTA1NGQ2OwotLSAgICAgICAgcHViIGNvbnN0
IFRVTkdFVEZJTFRFUjogSW9jdGwgPSAweDgwMTA1NGRiOwotLSAgICB9Ci0tfQotK3B1YiBjb25z
dCBGU19JT0NfR0VURkxBR1M6IElvY3RsID0gX0lPUjo6PGNfbG9uZz4oJ2YnIGFzIHUzMiwgMSkg
YXMgSW9jdGw7Ci0rcHViIGNvbnN0IEZTX0lPQ19TRVRGTEFHUzogSW9jdGwgPSBfSU9XOjo8Y19s
b25nPignZicgYXMgdTMyLCAyKSBhcyBJb2N0bDsKLStwdWIgY29uc3QgRlNfSU9DX0dFVFZFUlNJ
T046IElvY3RsID0gX0lPUjo6PGNfbG9uZz4oJ3YnIGFzIHUzMiwgMSkgYXMgSW9jdGw7Ci0rcHVi
IGNvbnN0IEZTX0lPQ19TRVRWRVJTSU9OOiBJb2N0bCA9IF9JT1c6OjxjX2xvbmc+KCd2JyBhcyB1
MzIsIDIpIGFzIElvY3RsOwotK3B1YiBjb25zdCBGU19JT0MzMl9HRVRGTEFHUzogSW9jdGwgPSBf
SU9SOjo8Y19pbnQ+KCdmJyBhcyB1MzIsIDEpIGFzIElvY3RsOwotK3B1YiBjb25zdCBGU19JT0Mz
Ml9TRVRGTEFHUzogSW9jdGwgPSBfSU9XOjo8Y19pbnQ+KCdmJyBhcyB1MzIsIDIpIGFzIElvY3Rs
OwotK3B1YiBjb25zdCBGU19JT0MzMl9HRVRWRVJTSU9OOiBJb2N0bCA9IF9JT1I6OjxjX2ludD4o
J3YnIGFzIHUzMiwgMSkgYXMgSW9jdGw7Ci0rcHViIGNvbnN0IEZTX0lPQzMyX1NFVFZFUlNJT046
IElvY3RsID0gX0lPVzo6PGNfaW50PigndicgYXMgdTMyLCAyKSBhcyBJb2N0bDsKLSsKLStwdWIg
Y29uc3QgVFVOQVRUQUNIRklMVEVSOiBJb2N0bCA9IF9JT1c6OjxjcmF0ZTo6c29ja19mcHJvZz4o
J1QnIGFzIHUzMiwgMjEzKSBhcyBJb2N0bDsKLStwdWIgY29uc3QgVFVOREVUQUNIRklMVEVSOiBJ
b2N0bCA9IF9JT1c6OjxjcmF0ZTo6c29ja19mcHJvZz4oJ1QnIGFzIHUzMiwgMjE0KSBhcyBJb2N0
bDsKLStwdWIgY29uc3QgVFVOR0VURklMVEVSOiBJb2N0bCA9IF9JT1I6OjxjcmF0ZTo6c29ja19m
cHJvZz4oJ1QnIGFzIHUzMiwgMjE5KSBhcyBJb2N0bDsKLSAKLSBjZmdfaWYhIHsKLSAgICAgaWYg
I1tjZmcoYW55KHRhcmdldF9hcmNoID0gImFybSIsIHRhcmdldF9hcmNoID0gInMzOTB4IikpXSB7
CmRpZmYgLS1naXQgYS9tZXRhL3JlY2lwZXMtZGV2dG9vbHMvcHl0aG9uL3B5dGhvbjMtbWF0dXJp
bl8xLjguNi5iYiBiL21ldGEvcmVjaXBlcy1kZXZ0b29scy9weXRob24vcHl0aG9uMy1tYXR1cmlu
XzEuOC42LmJiCmRlbGV0ZWQgZmlsZSBtb2RlIDEwMDY0NAppbmRleCBhYjUwOTMzMWMzLi4wMDAw
MDAwMDAwCi0tLSBhL21ldGEvcmVjaXBlcy1kZXZ0b29scy9weXRob24vcHl0aG9uMy1tYXR1cmlu
XzEuOC42LmJiCisrKyAvZGV2L251bGwKQEAgLTEsNDQgKzAsMCBAQAotU1VNTUFSWSA9ICJCdWls
ZCBhbmQgcHVibGlzaCBjcmF0ZXMgd2l0aCBweW8zLCBydXN0LWNweXRob24sIGNmZmkgYmluZGlu
Z3MgYW5kIHJ1c3QgYmluYXJpZXMgYXMgcHl0aG9uIHBhY2thZ2VzIgotSE9NRVBBR0UgPSAiaHR0
cHM6Ly9naXRodWIuY29tL3B5bzMvbWF0dXJpbiIKLVNFQ1RJT04gPSAiZGV2ZWwvcHl0aG9uIgot
TElDRU5TRSA9ICJNSVQgfCBBcGFjaGUtMi4wIgotTElDX0ZJTEVTX0NIS1NVTSA9ICJmaWxlOi8v
bGljZW5zZS1hcGFjaGU7bWQ1PTE4MzZlZmIyZWI3Nzk5NjY2OTZmNDczZWU4NTQwNTQyIFwKLSAg
ICAgICAgICAgICAgICAgICAgZmlsZTovL2xpY2Vuc2UtbWl0O21kNT04NWZkM2I2NzA2OWNmZjc4
NGQ5OGViZmM3ZDVjMDc5NyIKLQotIyBUaGlzIGlzIG5lZWRlZCB1bnRpbCBDYXJnby5sb2NrIGhh
cyBsaWJjLTAuMi4xNzIrCi1TUkNfVVJJICs9ICJmaWxlOi8vMDAwMS1EZWZpbmUtbW9yZS1pb2N0
bC1jb2Rlcy1vbi1yaXNjdjMyZ2MtdW5rbm93bi1saW51eC1nLnBhdGNoO3BhdGNoZGlyPSR7Q0FS
R09fVkVORE9SSU5HX0RJUkVDVE9SWX0vbGliYy0wLjIuMTY3IgotU1JDX1VSSVtzaGEyNTZzdW1d
ID0gIjBlMGRjMmUwYmZhYTJlMWJkMjM4ZTAyMzZjZjhhMmI3ZTIyNTBjY2FhMjljMWFhOGQwZTYx
ZmE2NjRiMDI4OWQiCi0KLVMgPSAiJHtXT1JLRElSfS9tYXR1cmluLSR7UFZ9IgotCi1DRkxBR1Mg
Kz0gIi1mZmlsZS1wcmVmaXgtbWFwPSR7Q0FSR09fSE9NRX09JHtUQVJHRVRfREJHU1JDX0RJUn0v
Y2FyZ29faG9tZSIKLQotREVQRU5EUyArPSAiXAotICAgIHB5dGhvbjMtc2V0dXB0b29scy1ydXN0
LW5hdGl2ZSBcCi0gICAgcHl0aG9uMy1zZW1hbnRpYy12ZXJzaW9uLW5hdGl2ZSBcCi0gICAgcHl0
aG9uMy1zZXR1cHRvb2xzLXJ1c3QgXAotIgotCi1yZXF1aXJlICR7QlBOfS1jcmF0ZXMuaW5jCi0K
LWluaGVyaXQgcHlwaSBjYXJnby11cGRhdGUtcmVjaXBlLWNyYXRlcyBweXRob25fcHlvMyBweXRo
b25fc2V0dXB0b29sc19idWlsZF9tZXRhCi0KLWRvX2NvbmZpZ3VyZSgpIHsKLSAgICBweXRob25f
cHlvM19kb19jb25maWd1cmUKLSAgICBjYXJnb19jb21tb25fZG9fY29uZmlndXJlCi0gICAgcHl0
aG9uX3BlcDUxN19kb19jb25maWd1cmUKLX0KLQotUkRFUEVORFM6JHtQTn0gKz0gIlwKLSAgICBj
YXJnbyBcCi0gICAgcHl0aG9uMy1qc29uIFwKLSAgICBydXN0IFwKLSIKLQotUlJFQ09NTUVORFM6
JHtQTn0gKz0gIlwKLSAgICBweXRob24zLWVuc3VyZXBpcCBcCi0gICAgcHl0aG9uMy1waXAgXAot
ICAgIHB5dGhvbjMtdmVudiBcCi0iCi0KLUJCQ0xBU1NFWFRFTkQgPSAibmF0aXZlIG5hdGl2ZXNk
ayIKZGlmZiAtLWdpdCBhL21ldGEvcmVjaXBlcy1kZXZ0b29scy9weXRob24vcHl0aG9uMy1tYXR1
cmluXzEuOC43LmJiIGIvbWV0YS9yZWNpcGVzLWRldnRvb2xzL3B5dGhvbi9weXRob24zLW1hdHVy
aW5fMS44LjcuYmIKbmV3IGZpbGUgbW9kZSAxMDA2NDQKaW5kZXggMDAwMDAwMDAwMC4uZDZhNjE0
NGMxZQotLS0gL2Rldi9udWxsCisrKyBiL21ldGEvcmVjaXBlcy1kZXZ0b29scy9weXRob24vcHl0
aG9uMy1tYXR1cmluXzEuOC43LmJiCkBAIC0wLDAgKzEsNDE0IEBACitTVU1NQVJZID0gIkJ1aWxk
IGFuZCBwdWJsaXNoIGNyYXRlcyB3aXRoIHB5bzMsIHJ1c3QtY3B5dGhvbiwgY2ZmaSBiaW5kaW5n
cyBhbmQgcnVzdCBiaW5hcmllcyBhcyBweXRob24gcGFja2FnZXMiCitIT01FUEFHRSA9ICJodHRw
czovL2dpdGh1Yi5jb20vcHlvMy9tYXR1cmluIgorU0VDVElPTiA9ICJkZXZlbC9weXRob24iCitM
SUNFTlNFID0gIk1JVCB8IEFwYWNoZS0yLjAiCitMSUNfRklMRVNfQ0hLU1VNID0gImZpbGU6Ly9s
aWNlbnNlLWFwYWNoZTttZDU9MTgzNmVmYjJlYjc3OTk2NjY5NmY0NzNlZTg1NDA1NDIgXAorICAg
ICAgICAgICAgICAgICAgICBmaWxlOi8vbGljZW5zZS1taXQ7bWQ1PTg1ZmQzYjY3MDY5Y2ZmNzg0
ZDk4ZWJmYzdkNWMwNzk3IgorCisjIFRoaXMgaXMgbmVlZGVkIHVudGlsIENhcmdvLmxvY2sgaGFz
IGxpYmMtMC4yLjE3MisKK1NSQ19VUkkgKz0gImNyYXRlOi8vY3JhdGVzLmlvL2FkbGVyMi8yLjAu
MCBcCisgICAgICAgICAgIGNyYXRlOi8vY3JhdGVzLmlvL2FoYXNoLzAuOC4xMSBcCisgICAgICAg
ICAgIGNyYXRlOi8vY3JhdGVzLmlvL2Foby1jb3Jhc2ljay8xLjEuMyBcCisgICAgICAgICAgIGNy
YXRlOi8vY3JhdGVzLmlvL2FsbG9jYXRvci1hcGkyLzAuMi4xOCBcCisgICAgICAgICAgIGNyYXRl
Oi8vY3JhdGVzLmlvL2Fuc3RyZWFtLzAuNi4xNCBcCisgICAgICAgICAgIGNyYXRlOi8vY3JhdGVz
LmlvL2Fuc3R5bGUvMS4wLjcgXAorICAgICAgICAgICBjcmF0ZTovL2NyYXRlcy5pby9hbnN0eWxl
LXBhcnNlLzAuMi40IFwKKyAgICAgICAgICAgY3JhdGU6Ly9jcmF0ZXMuaW8vYW5zdHlsZS1xdWVy
eS8xLjEuMCBcCisgICAgICAgICAgIGNyYXRlOi8vY3JhdGVzLmlvL2Fuc3R5bGUtd2luY29uLzMu
MC4zIFwKKyAgICAgICAgICAgY3JhdGU6Ly9jcmF0ZXMuaW8vYW55aG93LzEuMC44OSBcCisgICAg
ICAgICAgIGNyYXRlOi8vY3JhdGVzLmlvL2FyYml0cmFyeS8xLjQuMSBcCisgICAgICAgICAgIGNy
YXRlOi8vY3JhdGVzLmlvL2F1dG9jZmcvMS4zLjAgXAorICAgICAgICAgICBjcmF0ZTovL2NyYXRl
cy5pby9hdXRvbW9kLzEuMC4xNCBcCisgICAgICAgICAgIGNyYXRlOi8vY3JhdGVzLmlvL2Jhc2U2
NC8wLjIxLjcgXAorICAgICAgICAgICBjcmF0ZTovL2NyYXRlcy5pby9iYXNlNjQvMC4yMi4xIFwK
KyAgICAgICAgICAgY3JhdGU6Ly9jcmF0ZXMuaW8vYml0ZmxhZ3MvMS4zLjIgXAorICAgICAgICAg
ICBjcmF0ZTovL2NyYXRlcy5pby9iaXRmbGFncy8yLjUuMCBcCisgICAgICAgICAgIGNyYXRlOi8v
Y3JhdGVzLmlvL2Jsb2NrLWJ1ZmZlci8wLjEwLjQgXAorICAgICAgICAgICBjcmF0ZTovL2NyYXRl
cy5pby9ib3hjYXIvMC4yLjggXAorICAgICAgICAgICBjcmF0ZTovL2NyYXRlcy5pby9ic3RyLzEu
MTAuMCBcCisgICAgICAgICAgIGNyYXRlOi8vY3JhdGVzLmlvL2J1bXBhbG8vMy4xNi4wIFwKKyAg
ICAgICAgICAgY3JhdGU6Ly9jcmF0ZXMuaW8vYnl0ZW9yZGVyLzEuNS4wIFwKKyAgICAgICAgICAg
Y3JhdGU6Ly9jcmF0ZXMuaW8vYnl0ZXMvMS45LjAgXAorICAgICAgICAgICBjcmF0ZTovL2NyYXRl
cy5pby9ieXRlc2l6ZS8xLjMuMCBcCisgICAgICAgICAgIGNyYXRlOi8vY3JhdGVzLmlvL2J6aXAy
LzAuNS4yIFwKKyAgICAgICAgICAgY3JhdGU6Ly9jcmF0ZXMuaW8vYnppcDItc3lzLzAuMS4xMysx
LjAuOCBcCisgICAgICAgICAgIGNyYXRlOi8vY3JhdGVzLmlvL2NhYi8wLjYuMCBcCisgICAgICAg
ICAgIGNyYXRlOi8vY3JhdGVzLmlvL2NhbWluby8xLjEuOSBcCisgICAgICAgICAgIGNyYXRlOi8v
Y3JhdGVzLmlvL2NhcmdvLWNvbmZpZzIvMC4xLjI2IFwKKyAgICAgICAgICAgY3JhdGU6Ly9jcmF0
ZXMuaW8vY2FyZ28tb3B0aW9ucy8wLjcuNCBcCisgICAgICAgICAgIGNyYXRlOi8vY3JhdGVzLmlv
L2NhcmdvLXBsYXRmb3JtLzAuMS44IFwKKyAgICAgICAgICAgY3JhdGU6Ly9jcmF0ZXMuaW8vY2Fy
Z28teHdpbi8wLjE4LjYgXAorICAgICAgICAgICBjcmF0ZTovL2NyYXRlcy5pby9jYXJnby16aWdi
dWlsZC8wLjIwLjAgXAorICAgICAgICAgICBjcmF0ZTovL2NyYXRlcy5pby9jYXJnb19tZXRhZGF0
YS8wLjE5LjAgXAorICAgICAgICAgICBjcmF0ZTovL2NyYXRlcy5pby9jYmluZGdlbi8wLjI5LjAg
XAorICAgICAgICAgICBjcmF0ZTovL2NyYXRlcy5pby9jYy8xLjIuMTYgXAorICAgICAgICAgICBj
cmF0ZTovL2NyYXRlcy5pby9jZmIvMC4xMC4wIFwKKyAgICAgICAgICAgY3JhdGU6Ly9jcmF0ZXMu
aW8vY2ZnLWlmLzEuMC4wIFwKKyAgICAgICAgICAgY3JhdGU6Ly9jcmF0ZXMuaW8vY2hhcnNldC8w
LjEuNSBcCisgICAgICAgICAgIGNyYXRlOi8vY3JhdGVzLmlvL2NodW1za3kvMC45LjMgXAorICAg
ICAgICAgICBjcmF0ZTovL2NyYXRlcy5pby9jbGFwLzQuNS43IFwKKyAgICAgICAgICAgY3JhdGU6
Ly9jcmF0ZXMuaW8vY2xhcF9idWlsZGVyLzQuNS43IFwKKyAgICAgICAgICAgY3JhdGU6Ly9jcmF0
ZXMuaW8vY2xhcF9jb21wbGV0ZS80LjUuNSBcCisgICAgICAgICAgIGNyYXRlOi8vY3JhdGVzLmlv
L2NsYXBfY29tcGxldGVfY29tbWFuZC8wLjYuMSBcCisgICAgICAgICAgIGNyYXRlOi8vY3JhdGVz
LmlvL2NsYXBfY29tcGxldGVfbnVzaGVsbC80LjUuMiBcCisgICAgICAgICAgIGNyYXRlOi8vY3Jh
dGVzLmlvL2NsYXBfZGVyaXZlLzQuNS41IFwKKyAgICAgICAgICAgY3JhdGU6Ly9jcmF0ZXMuaW8v
Y2xhcF9sZXgvMC43LjEgXAorICAgICAgICAgICBjcmF0ZTovL2NyYXRlcy5pby9jbGktdGFibGUv
MC40LjcgXAorICAgICAgICAgICBjcmF0ZTovL2NyYXRlcy5pby9jb2xvcmNob2ljZS8xLjAuMSBc
CisgICAgICAgICAgIGNyYXRlOi8vY3JhdGVzLmlvL2NvbmZpZ3BhcnNlci8zLjEuMCBcCisgICAg
ICAgICAgIGNyYXRlOi8vY3JhdGVzLmlvL2NvbnNvbGUvMC4xNS44IFwKKyAgICAgICAgICAgY3Jh
dGU6Ly9jcmF0ZXMuaW8vY29udGVudF9pbnNwZWN0b3IvMC4yLjQgXAorICAgICAgICAgICBjcmF0
ZTovL2NyYXRlcy5pby9jb3JlLWZvdW5kYXRpb24vMC45LjQgXAorICAgICAgICAgICBjcmF0ZTov
L2NyYXRlcy5pby9jb3JlLWZvdW5kYXRpb24tc3lzLzAuOC42IFwKKyAgICAgICAgICAgY3JhdGU6
Ly9jcmF0ZXMuaW8vY3B1ZmVhdHVyZXMvMC4yLjEyIFwKKyAgICAgICAgICAgY3JhdGU6Ly9jcmF0
ZXMuaW8vY3JjLzMuMi4xIFwKKyAgICAgICAgICAgY3JhdGU6Ly9jcmF0ZXMuaW8vY3JjLWNhdGFs
b2cvMi40LjAgXAorICAgICAgICAgICBjcmF0ZTovL2NyYXRlcy5pby9jcmMzMmZhc3QvMS40LjIg
XAorICAgICAgICAgICBjcmF0ZTovL2NyYXRlcy5pby9jcm9zc2JlYW0tY2hhbm5lbC8wLjUuMTUg
XAorICAgICAgICAgICBjcmF0ZTovL2NyYXRlcy5pby9jcm9zc2JlYW0tZGVxdWUvMC44LjUgXAor
ICAgICAgICAgICBjcmF0ZTovL2NyYXRlcy5pby9jcm9zc2JlYW0tZXBvY2gvMC45LjE4IFwKKyAg
ICAgICAgICAgY3JhdGU6Ly9jcmF0ZXMuaW8vY3Jvc3NiZWFtLXV0aWxzLzAuOC4yMCBcCisgICAg
ICAgICAgIGNyYXRlOi8vY3JhdGVzLmlvL2NyeXB0by1jb21tb24vMC4xLjYgXAorICAgICAgICAg
ICBjcmF0ZTovL2NyYXRlcy5pby9kYXRhLWVuY29kaW5nLzIuNi4wIFwKKyAgICAgICAgICAgY3Jh
dGU6Ly9jcmF0ZXMuaW8vZGVyYW5nZWQvMC4zLjExIFwKKyAgICAgICAgICAgY3JhdGU6Ly9jcmF0
ZXMuaW8vZGVyaXZlX2FyYml0cmFyeS8xLjQuMSBcCisgICAgICAgICAgIGNyYXRlOi8vY3JhdGVz
LmlvL2RpYWxvZ3Vlci8wLjExLjAgXAorICAgICAgICAgICBjcmF0ZTovL2NyYXRlcy5pby9kaWZm
LzAuMS4xMyBcCisgICAgICAgICAgIGNyYXRlOi8vY3JhdGVzLmlvL2RpZ2VzdC8wLjEwLjcgXAor
ICAgICAgICAgICBjcmF0ZTovL2NyYXRlcy5pby9kaXJzLzUuMC4xIFwKKyAgICAgICAgICAgY3Jh
dGU6Ly9jcmF0ZXMuaW8vZGlycy1zeXMvMC40LjEgXAorICAgICAgICAgICBjcmF0ZTovL2NyYXRl
cy5pby9kaXNwbGF5ZG9jLzAuMi41IFwKKyAgICAgICAgICAgY3JhdGU6Ly9jcmF0ZXMuaW8vZGlz
c2ltaWxhci8xLjAuOSBcCisgICAgICAgICAgIGNyYXRlOi8vY3JhdGVzLmlvL2R1bmNlLzEuMC41
IFwKKyAgICAgICAgICAgY3JhdGU6Ly9jcmF0ZXMuaW8vZHluLWNsb25lLzEuMC4xNyBcCisgICAg
ICAgICAgIGNyYXRlOi8vY3JhdGVzLmlvL2VpdGhlci8xLjEzLjAgXAorICAgICAgICAgICBjcmF0
ZTovL2NyYXRlcy5pby9lbmNvZGVfdW5pY29kZS8wLjMuNiBcCisgICAgICAgICAgIGNyYXRlOi8v
Y3JhdGVzLmlvL2VuY29kaW5nX3JzLzAuOC4zNCBcCisgICAgICAgICAgIGNyYXRlOi8vY3JhdGVz
LmlvL2VxdWl2YWxlbnQvMS4wLjEgXAorICAgICAgICAgICBjcmF0ZTovL2NyYXRlcy5pby9lcnJu
by8wLjMuOSBcCisgICAgICAgICAgIGNyYXRlOi8vY3JhdGVzLmlvL2V4cGVjdC10ZXN0LzEuNS4w
IFwKKyAgICAgICAgICAgY3JhdGU6Ly9jcmF0ZXMuaW8vZmFzdHJhbmQvMi4xLjAgXAorICAgICAg
ICAgICBjcmF0ZTovL2NyYXRlcy5pby9mYXQtbWFjaG8vMC40LjkgXAorICAgICAgICAgICBjcmF0
ZTovL2NyYXRlcy5pby9maWxldGltZS8wLjIuMjMgXAorICAgICAgICAgICBjcmF0ZTovL2NyYXRl
cy5pby9mbGF0ZTIvMS4wLjMzIFwKKyAgICAgICAgICAgY3JhdGU6Ly9jcmF0ZXMuaW8vZm52LzEu
MC43IFwKKyAgICAgICAgICAgY3JhdGU6Ly9jcmF0ZXMuaW8vZm9yZWlnbi10eXBlcy8wLjMuMiBc
CisgICAgICAgICAgIGNyYXRlOi8vY3JhdGVzLmlvL2ZvcmVpZ24tdHlwZXMtc2hhcmVkLzAuMS4x
IFwKKyAgICAgICAgICAgY3JhdGU6Ly9jcmF0ZXMuaW8vZm9ybV91cmxlbmNvZGVkLzEuMi4xIFwK
KyAgICAgICAgICAgY3JhdGU6Ly9jcmF0ZXMuaW8vZnMtZXJyLzMuMC4wIFwKKyAgICAgICAgICAg
Y3JhdGU6Ly9jcmF0ZXMuaW8vZnM0LzAuMTIuMCBcCisgICAgICAgICAgIGNyYXRlOi8vY3JhdGVz
LmlvL2Z1dHVyZXMvMC4zLjMwIFwKKyAgICAgICAgICAgY3JhdGU6Ly9jcmF0ZXMuaW8vZnV0dXJl
cy1jaGFubmVsLzAuMy4zMSBcCisgICAgICAgICAgIGNyYXRlOi8vY3JhdGVzLmlvL2Z1dHVyZXMt
Y29yZS8wLjMuMzEgXAorICAgICAgICAgICBjcmF0ZTovL2NyYXRlcy5pby9mdXR1cmVzLWV4ZWN1
dG9yLzAuMy4zMCBcCisgICAgICAgICAgIGNyYXRlOi8vY3JhdGVzLmlvL2Z1dHVyZXMtaW8vMC4z
LjMxIFwKKyAgICAgICAgICAgY3JhdGU6Ly9jcmF0ZXMuaW8vZnV0dXJlcy1tYWNyby8wLjMuMzEg
XAorICAgICAgICAgICBjcmF0ZTovL2NyYXRlcy5pby9mdXR1cmVzLXNpbmsvMC4zLjMxIFwKKyAg
ICAgICAgICAgY3JhdGU6Ly9jcmF0ZXMuaW8vZnV0dXJlcy10YXNrLzAuMy4zMSBcCisgICAgICAg
ICAgIGNyYXRlOi8vY3JhdGVzLmlvL2Z1dHVyZXMtdGltZXIvMy4wLjMgXAorICAgICAgICAgICBj
cmF0ZTovL2NyYXRlcy5pby9mdXR1cmVzLXV0aWwvMC4zLjMxIFwKKyAgICAgICAgICAgY3JhdGU6
Ly9jcmF0ZXMuaW8vZ2VuZXJpYy1hcnJheS8wLjE0LjcgXAorICAgICAgICAgICBjcmF0ZTovL2Ny
YXRlcy5pby9nZXRyYW5kb20vMC4yLjE1IFwKKyAgICAgICAgICAgY3JhdGU6Ly9jcmF0ZXMuaW8v
Z2V0cmFuZG9tLzAuMy4zIFwKKyAgICAgICAgICAgY3JhdGU6Ly9jcmF0ZXMuaW8vZ2xvYi8wLjMu
MSBcCisgICAgICAgICAgIGNyYXRlOi8vY3JhdGVzLmlvL2dsb2JzZXQvMC40LjE1IFwKKyAgICAg
ICAgICAgY3JhdGU6Ly9jcmF0ZXMuaW8vZ29ibGluLzAuOS4yIFwKKyAgICAgICAgICAgY3JhdGU6
Ly9jcmF0ZXMuaW8vaGFzaGJyb3duLzAuMTQuNSBcCisgICAgICAgICAgIGNyYXRlOi8vY3JhdGVz
LmlvL2hhc2hicm93bi8wLjE1LjIgXAorICAgICAgICAgICBjcmF0ZTovL2NyYXRlcy5pby9oZWNr
LzAuNS4wIFwKKyAgICAgICAgICAgY3JhdGU6Ly9jcmF0ZXMuaW8vaG9tZS8wLjUuOSBcCisgICAg
ICAgICAgIGNyYXRlOi8vY3JhdGVzLmlvL2h1bWFudGltZS8yLjEuMCBcCisgICAgICAgICAgIGNy
YXRlOi8vY3JhdGVzLmlvL2h1bWFudGltZS1zZXJkZS8xLjEuMSBcCisgICAgICAgICAgIGNyYXRl
Oi8vY3JhdGVzLmlvL2ljdV9jb2xsZWN0aW9ucy8xLjUuMCBcCisgICAgICAgICAgIGNyYXRlOi8v
Y3JhdGVzLmlvL2ljdV9sb2NpZC8xLjUuMCBcCisgICAgICAgICAgIGNyYXRlOi8vY3JhdGVzLmlv
L2ljdV9sb2NpZF90cmFuc2Zvcm0vMS41LjAgXAorICAgICAgICAgICBjcmF0ZTovL2NyYXRlcy5p
by9pY3VfbG9jaWRfdHJhbnNmb3JtX2RhdGEvMS41LjAgXAorICAgICAgICAgICBjcmF0ZTovL2Ny
YXRlcy5pby9pY3Vfbm9ybWFsaXplci8xLjUuMCBcCisgICAgICAgICAgIGNyYXRlOi8vY3JhdGVz
LmlvL2ljdV9ub3JtYWxpemVyX2RhdGEvMS41LjAgXAorICAgICAgICAgICBjcmF0ZTovL2NyYXRl
cy5pby9pY3VfcHJvcGVydGllcy8xLjUuMSBcCisgICAgICAgICAgIGNyYXRlOi8vY3JhdGVzLmlv
L2ljdV9wcm9wZXJ0aWVzX2RhdGEvMS41LjAgXAorICAgICAgICAgICBjcmF0ZTovL2NyYXRlcy5p
by9pY3VfcHJvdmlkZXIvMS41LjAgXAorICAgICAgICAgICBjcmF0ZTovL2NyYXRlcy5pby9pY3Vf
cHJvdmlkZXJfbWFjcm9zLzEuNS4wIFwKKyAgICAgICAgICAgY3JhdGU6Ly9jcmF0ZXMuaW8vaWRu
YS8xLjAuMyBcCisgICAgICAgICAgIGNyYXRlOi8vY3JhdGVzLmlvL2lkbmFfYWRhcHRlci8xLjIu
MCBcCisgICAgICAgICAgIGNyYXRlOi8vY3JhdGVzLmlvL2lnbm9yZS8wLjQuMjMgXAorICAgICAg
ICAgICBjcmF0ZTovL2NyYXRlcy5pby9pbmRleG1hcC8yLjYuMCBcCisgICAgICAgICAgIGNyYXRl
Oi8vY3JhdGVzLmlvL2luZGljYXRpZi8wLjE3LjkgXAorICAgICAgICAgICBjcmF0ZTovL2NyYXRl
cy5pby9pbmRvYy8yLjAuNSBcCisgICAgICAgICAgIGNyYXRlOi8vY3JhdGVzLmlvL2lzX3Rlcm1p
bmFsX3BvbHlmaWxsLzEuNzAuMCBcCisgICAgICAgICAgIGNyYXRlOi8vY3JhdGVzLmlvL2l0ZXJ0
b29scy8wLjEyLjEgXAorICAgICAgICAgICBjcmF0ZTovL2NyYXRlcy5pby9pdGVydG9vbHMvMC4x
My4wIFwKKyAgICAgICAgICAgY3JhdGU6Ly9jcmF0ZXMuaW8vaXRvYS8xLjAuMTEgXAorICAgICAg
ICAgICBjcmF0ZTovL2NyYXRlcy5pby9qb2JzZXJ2ZXIvMC4xLjMzIFwKKyAgICAgICAgICAgY3Jh
dGU6Ly9jcmF0ZXMuaW8vanMtc3lzLzAuMy43MyBcCisgICAgICAgICAgIGNyYXRlOi8vY3JhdGVz
LmlvL2tleXJpbmcvMi4zLjMgXAorICAgICAgICAgICBjcmF0ZTovL2NyYXRlcy5pby9sYXp5X3N0
YXRpYy8xLjQuMCBcCisgICAgICAgICAgIGNyYXRlOi8vY3JhdGVzLmlvL2xkZHRyZWUvMC4zLjcg
XAorICAgICAgICAgICBjcmF0ZTovL2NyYXRlcy5pby9saWJjLzAuMi4xNzIgXAorICAgICAgICAg
ICBjcmF0ZTovL2NyYXRlcy5pby9saWJtaW1hbGxvYy1zeXMvMC4xLjM5IFwKKyAgICAgICAgICAg
Y3JhdGU6Ly9jcmF0ZXMuaW8vbGlicmVkb3gvMC4xLjMgXAorICAgICAgICAgICBjcmF0ZTovL2Ny
YXRlcy5pby9saW51eC1rZXl1dGlscy8wLjIuNCBcCisgICAgICAgICAgIGNyYXRlOi8vY3JhdGVz
LmlvL2xpbnV4LXJhdy1zeXMvMC40LjE0IFwKKyAgICAgICAgICAgY3JhdGU6Ly9jcmF0ZXMuaW8v
bGl0ZW1hcC8wLjcuMyBcCisgICAgICAgICAgIGNyYXRlOi8vY3JhdGVzLmlvL2xvY2tfYXBpLzAu
NC4xMiBcCisgICAgICAgICAgIGNyYXRlOi8vY3JhdGVzLmlvL2xvY2tmcmVlLW9iamVjdC1wb29s
LzAuMS42IFwKKyAgICAgICAgICAgY3JhdGU6Ly9jcmF0ZXMuaW8vbG9nLzAuNC4yMiBcCisgICAg
ICAgICAgIGNyYXRlOi8vY3JhdGVzLmlvL2x6bWEtcnMvMC4zLjAgXAorICAgICAgICAgICBjcmF0
ZTovL2NyYXRlcy5pby9sem1hLXN5cy8wLjEuMjAgXAorICAgICAgICAgICBjcmF0ZTovL2NyYXRl
cy5pby9senhkLzAuMi41IFwKKyAgICAgICAgICAgY3JhdGU6Ly9jcmF0ZXMuaW8vbWFpbHBhcnNl
LzAuMTUuMCBcCisgICAgICAgICAgIGNyYXRlOi8vY3JhdGVzLmlvL21hdGNoZXJzLzAuMS4wIFwK
KyAgICAgICAgICAgY3JhdGU6Ly9jcmF0ZXMuaW8vbWVtY2hyLzIuNy40IFwKKyAgICAgICAgICAg
Y3JhdGU6Ly9jcmF0ZXMuaW8vbWltYWxsb2MvMC4xLjQzIFwKKyAgICAgICAgICAgY3JhdGU6Ly9j
cmF0ZXMuaW8vbWltZS8wLjMuMTcgXAorICAgICAgICAgICBjcmF0ZTovL2NyYXRlcy5pby9taW1l
X2d1ZXNzLzIuMC40IFwKKyAgICAgICAgICAgY3JhdGU6Ly9jcmF0ZXMuaW8vbWluaWppbmphLzIu
NS4wIFwKKyAgICAgICAgICAgY3JhdGU6Ly9jcmF0ZXMuaW8vbWluaW1hbC1sZXhpY2FsLzAuMi4x
IFwKKyAgICAgICAgICAgY3JhdGU6Ly9jcmF0ZXMuaW8vbWluaXpfb3hpZGUvMC44LjAgXAorICAg
ICAgICAgICBjcmF0ZTovL2NyYXRlcy5pby9tc2kvMC44LjAgXAorICAgICAgICAgICBjcmF0ZTov
L2NyYXRlcy5pby9tdWx0aXBhcnQvMC4xOC4wIFwKKyAgICAgICAgICAgY3JhdGU6Ly9jcmF0ZXMu
aW8vbmF0aXZlLXRscy8wLjIuMTIgXAorICAgICAgICAgICBjcmF0ZTovL2NyYXRlcy5pby9ub20v
Ny4xLjMgXAorICAgICAgICAgICBjcmF0ZTovL2NyYXRlcy5pby9ub3JtYWxpemUtbGluZS1lbmRp
bmdzLzAuMy4wIFwKKyAgICAgICAgICAgY3JhdGU6Ly9jcmF0ZXMuaW8vbm9ybXBhdGgvMS4yLjAg
XAorICAgICAgICAgICBjcmF0ZTovL2NyYXRlcy5pby9udS1hbnNpLXRlcm0vMC40Ni4wIFwKKyAg
ICAgICAgICAgY3JhdGU6Ly9jcmF0ZXMuaW8vbnVtLWNvbnYvMC4xLjAgXAorICAgICAgICAgICBj
cmF0ZTovL2NyYXRlcy5pby9udW1iZXJfcHJlZml4LzAuNC4wIFwKKyAgICAgICAgICAgY3JhdGU6
Ly9jcmF0ZXMuaW8vb25jZV9jZWxsLzEuMjAuMiBcCisgICAgICAgICAgIGNyYXRlOi8vY3JhdGVz
LmlvL29wZW5zc2wvMC4xMC43MiBcCisgICAgICAgICAgIGNyYXRlOi8vY3JhdGVzLmlvL29wZW5z
c2wtbWFjcm9zLzAuMS4xIFwKKyAgICAgICAgICAgY3JhdGU6Ly9jcmF0ZXMuaW8vb3BlbnNzbC1w
cm9iZS8wLjEuNSBcCisgICAgICAgICAgIGNyYXRlOi8vY3JhdGVzLmlvL29wZW5zc2wtc3lzLzAu
OS4xMDcgXAorICAgICAgICAgICBjcmF0ZTovL2NyYXRlcy5pby9vcHRpb24tZXh0LzAuMi4wIFwK
KyAgICAgICAgICAgY3JhdGU6Ly9jcmF0ZXMuaW8vb3NfcGlwZS8xLjIuMCBcCisgICAgICAgICAg
IGNyYXRlOi8vY3JhdGVzLmlvL292ZXJsb2FkLzAuMS4xIFwKKyAgICAgICAgICAgY3JhdGU6Ly9j
cmF0ZXMuaW8vcGFya2luZ19sb3QvMC4xMi4zIFwKKyAgICAgICAgICAgY3JhdGU6Ly9jcmF0ZXMu
aW8vcGFya2luZ19sb3RfY29yZS8wLjkuMTAgXAorICAgICAgICAgICBjcmF0ZTovL2NyYXRlcy5p
by9wYXN0ZS8xLjAuMTUgXAorICAgICAgICAgICBjcmF0ZTovL2NyYXRlcy5pby9wYXRoLXNsYXNo
LzAuMi4xIFwKKyAgICAgICAgICAgY3JhdGU6Ly9jcmF0ZXMuaW8vcGVwNDQwX3JzLzAuNy4zIFwK
KyAgICAgICAgICAgY3JhdGU6Ly9jcmF0ZXMuaW8vcGVwNTA4X3JzLzAuOS4yIFwKKyAgICAgICAg
ICAgY3JhdGU6Ly9jcmF0ZXMuaW8vcGVyY2VudC1lbmNvZGluZy8yLjMuMSBcCisgICAgICAgICAg
IGNyYXRlOi8vY3JhdGVzLmlvL3Bpbi1wcm9qZWN0LWxpdGUvMC4yLjE1IFwKKyAgICAgICAgICAg
Y3JhdGU6Ly9jcmF0ZXMuaW8vcGluLXV0aWxzLzAuMS4wIFwKKyAgICAgICAgICAgY3JhdGU6Ly9j
cmF0ZXMuaW8vcGtnLWNvbmZpZy8wLjMuMzAgXAorICAgICAgICAgICBjcmF0ZTovL2NyYXRlcy5p
by9wbGFpbi8wLjIuMyBcCisgICAgICAgICAgIGNyYXRlOi8vY3JhdGVzLmlvL3BsYXRmb3JtLWlu
Zm8vMi4wLjMgXAorICAgICAgICAgICBjcmF0ZTovL2NyYXRlcy5pby9wb3J0YWJsZS1hdG9taWMv
MS42LjAgXAorICAgICAgICAgICBjcmF0ZTovL2NyYXRlcy5pby9wb3dlcmZtdC8wLjIuMCBcCisg
ICAgICAgICAgIGNyYXRlOi8vY3JhdGVzLmlvL3Bwdi1saXRlODYvMC4yLjE3IFwKKyAgICAgICAg
ICAgY3JhdGU6Ly9jcmF0ZXMuaW8vcHJldHR5X2Fzc2VydGlvbnMvMS40LjEgXAorICAgICAgICAg
ICBjcmF0ZTovL2NyYXRlcy5pby9wcm9jLW1hY3JvLWNyYXRlLzMuMS4wIFwKKyAgICAgICAgICAg
Y3JhdGU6Ly9jcmF0ZXMuaW8vcHJvYy1tYWNybzIvMS4wLjkyIFwKKyAgICAgICAgICAgY3JhdGU6
Ly9jcmF0ZXMuaW8vcHNtLzAuMS4yMSBcCisgICAgICAgICAgIGNyYXRlOi8vY3JhdGVzLmlvL3B5
cHJvamVjdC10b21sLzAuMTMuNCBcCisgICAgICAgICAgIGNyYXRlOi8vY3JhdGVzLmlvL3B5dGhv
bi1wa2dpbmZvLzAuNi41IFwKKyAgICAgICAgICAgY3JhdGU6Ly9jcmF0ZXMuaW8vcXVvdGUvMS4w
LjM3IFwKKyAgICAgICAgICAgY3JhdGU6Ly9jcmF0ZXMuaW8vcXVvdGVkX3ByaW50YWJsZS8wLjUu
MCBcCisgICAgICAgICAgIGNyYXRlOi8vY3JhdGVzLmlvL3ItZWZpLzUuMi4wIFwKKyAgICAgICAg
ICAgY3JhdGU6Ly9jcmF0ZXMuaW8vcmFuZC8wLjguNSBcCisgICAgICAgICAgIGNyYXRlOi8vY3Jh
dGVzLmlvL3JhbmRfY2hhY2hhLzAuMy4xIFwKKyAgICAgICAgICAgY3JhdGU6Ly9jcmF0ZXMuaW8v
cmFuZF9jb3JlLzAuNi40IFwKKyAgICAgICAgICAgY3JhdGU6Ly9jcmF0ZXMuaW8vcmF5b24vMS4x
MC4wIFwKKyAgICAgICAgICAgY3JhdGU6Ly9jcmF0ZXMuaW8vcmF5b24tY29yZS8xLjEyLjEgXAor
ICAgICAgICAgICBjcmF0ZTovL2NyYXRlcy5pby9yZWRveF9zeXNjYWxsLzAuNC4xIFwKKyAgICAg
ICAgICAgY3JhdGU6Ly9jcmF0ZXMuaW8vcmVkb3hfc3lzY2FsbC8wLjUuMSBcCisgICAgICAgICAg
IGNyYXRlOi8vY3JhdGVzLmlvL3JlZG94X3VzZXJzLzAuNC41IFwKKyAgICAgICAgICAgY3JhdGU6
Ly9jcmF0ZXMuaW8vcmVnZXgvMS4xMS4xIFwKKyAgICAgICAgICAgY3JhdGU6Ly9jcmF0ZXMuaW8v
cmVnZXgtYXV0b21hdGEvMC4xLjEwIFwKKyAgICAgICAgICAgY3JhdGU6Ly9jcmF0ZXMuaW8vcmVn
ZXgtYXV0b21hdGEvMC40LjkgXAorICAgICAgICAgICBjcmF0ZTovL2NyYXRlcy5pby9yZWdleC1z
eW50YXgvMC42LjI5IFwKKyAgICAgICAgICAgY3JhdGU6Ly9jcmF0ZXMuaW8vcmVnZXgtc3ludGF4
LzAuOC41IFwKKyAgICAgICAgICAgY3JhdGU6Ly9jcmF0ZXMuaW8vcmVsYXRpdmUtcGF0aC8xLjku
MyBcCisgICAgICAgICAgIGNyYXRlOi8vY3JhdGVzLmlvL3JmYzIwNDctZGVjb2Rlci8xLjAuNiBc
CisgICAgICAgICAgIGNyYXRlOi8vY3JhdGVzLmlvL3JpbmcvMC4xNy4xMyBcCisgICAgICAgICAg
IGNyYXRlOi8vY3JhdGVzLmlvL3JzdGVzdC8wLjIyLjAgXAorICAgICAgICAgICBjcmF0ZTovL2Ny
YXRlcy5pby9yc3Rlc3RfbWFjcm9zLzAuMjIuMCBcCisgICAgICAgICAgIGNyYXRlOi8vY3JhdGVz
LmlvL3J1c3RjLWhhc2gvMi4wLjAgXAorICAgICAgICAgICBjcmF0ZTovL2NyYXRlcy5pby9ydXN0
Y192ZXJzaW9uLzAuNC4xIFwKKyAgICAgICAgICAgY3JhdGU6Ly9jcmF0ZXMuaW8vcnVzdGZsYWdz
LzAuMS42IFwKKyAgICAgICAgICAgY3JhdGU6Ly9jcmF0ZXMuaW8vcnVzdGl4LzAuMzguNDEgXAor
ICAgICAgICAgICBjcmF0ZTovL2NyYXRlcy5pby9ydXN0bHMvMC4yMy4xOSBcCisgICAgICAgICAg
IGNyYXRlOi8vY3JhdGVzLmlvL3J1c3Rscy1wZW1maWxlLzIuMS4zIFwKKyAgICAgICAgICAgY3Jh
dGU6Ly9jcmF0ZXMuaW8vcnVzdGxzLXBraS10eXBlcy8xLjEwLjAgXAorICAgICAgICAgICBjcmF0
ZTovL2NyYXRlcy5pby9ydXN0bHMtd2VicGtpLzAuMTAyLjggXAorICAgICAgICAgICBjcmF0ZTov
L2NyYXRlcy5pby9ydXN0dmVyc2lvbi8xLjAuMTggXAorICAgICAgICAgICBjcmF0ZTovL2NyYXRl
cy5pby9yeXUvMS4wLjE4IFwKKyAgICAgICAgICAgY3JhdGU6Ly9jcmF0ZXMuaW8vc2FtZS1maWxl
LzEuMC42IFwKKyAgICAgICAgICAgY3JhdGU6Ly9jcmF0ZXMuaW8vc2NoYW5uZWwvMC4xLjIzIFwK
KyAgICAgICAgICAgY3JhdGU6Ly9jcmF0ZXMuaW8vc2NoZW1hcnMvMC44LjIxIFwKKyAgICAgICAg
ICAgY3JhdGU6Ly9jcmF0ZXMuaW8vc2NoZW1hcnNfZGVyaXZlLzAuOC4yMSBcCisgICAgICAgICAg
IGNyYXRlOi8vY3JhdGVzLmlvL3Njb3BlZ3VhcmQvMS4yLjAgXAorICAgICAgICAgICBjcmF0ZTov
L2NyYXRlcy5pby9zY3JvbGwvMC4xMi4wIFwKKyAgICAgICAgICAgY3JhdGU6Ly9jcmF0ZXMuaW8v
c2Nyb2xsX2Rlcml2ZS8wLjEyLjAgXAorICAgICAgICAgICBjcmF0ZTovL2NyYXRlcy5pby9zZWN1
cml0eS1mcmFtZXdvcmsvMi4xMS4wIFwKKyAgICAgICAgICAgY3JhdGU6Ly9jcmF0ZXMuaW8vc2Vj
dXJpdHktZnJhbWV3b3JrLXN5cy8yLjExLjAgXAorICAgICAgICAgICBjcmF0ZTovL2NyYXRlcy5p
by9zZW12ZXIvMS4wLjIzIFwKKyAgICAgICAgICAgY3JhdGU6Ly9jcmF0ZXMuaW8vc2VyZGUvMS4w
LjIxNyBcCisgICAgICAgICAgIGNyYXRlOi8vY3JhdGVzLmlvL3NlcmRlX2Rlcml2ZS8xLjAuMjE3
IFwKKyAgICAgICAgICAgY3JhdGU6Ly9jcmF0ZXMuaW8vc2VyZGVfZGVyaXZlX2ludGVybmFscy8w
LjI5LjEgXAorICAgICAgICAgICBjcmF0ZTovL2NyYXRlcy5pby9zZXJkZV9qc29uLzEuMC4xMzUg
XAorICAgICAgICAgICBjcmF0ZTovL2NyYXRlcy5pby9zZXJkZV9zcGFubmVkLzAuNi44IFwKKyAg
ICAgICAgICAgY3JhdGU6Ly9jcmF0ZXMuaW8vc2hhMi8wLjEwLjggXAorICAgICAgICAgICBjcmF0
ZTovL2NyYXRlcy5pby9zaGFyZGVkLXNsYWIvMC4xLjcgXAorICAgICAgICAgICBjcmF0ZTovL2Ny
YXRlcy5pby9zaGVsbC13b3Jkcy8xLjEuMCBcCisgICAgICAgICAgIGNyYXRlOi8vY3JhdGVzLmlv
L3NobGV4LzEuMy4wIFwKKyAgICAgICAgICAgY3JhdGU6Ly9jcmF0ZXMuaW8vc2ltZC1hZGxlcjMy
LzAuMy43IFwKKyAgICAgICAgICAgY3JhdGU6Ly9jcmF0ZXMuaW8vc2ltaWxhci8yLjUuMCBcCisg
ICAgICAgICAgIGNyYXRlOi8vY3JhdGVzLmlvL3NsYWIvMC40LjkgXAorICAgICAgICAgICBjcmF0
ZTovL2NyYXRlcy5pby9zbWFsbHZlYy8xLjEzLjIgXAorICAgICAgICAgICBjcmF0ZTovL2NyYXRl
cy5pby9zbWF3ay8wLjMuMiBcCisgICAgICAgICAgIGNyYXRlOi8vY3JhdGVzLmlvL3NuYXBib3gv
MC42LjE2IFwKKyAgICAgICAgICAgY3JhdGU6Ly9jcmF0ZXMuaW8vc25hcGJveC1tYWNyb3MvMC4z
LjEwIFwKKyAgICAgICAgICAgY3JhdGU6Ly9jcmF0ZXMuaW8vc29ja3MvMC4zLjQgXAorICAgICAg
ICAgICBjcmF0ZTovL2NyYXRlcy5pby9zdGFibGVfZGVyZWZfdHJhaXQvMS4yLjAgXAorICAgICAg
ICAgICBjcmF0ZTovL2NyYXRlcy5pby9zdGFja2VyLzAuMS4xNSBcCisgICAgICAgICAgIGNyYXRl
Oi8vY3JhdGVzLmlvL3N0YXRpY19hc3NlcnRpb25zLzEuMS4wIFwKKyAgICAgICAgICAgY3JhdGU6
Ly9jcmF0ZXMuaW8vc3Ryc2ltLzAuMTEuMSBcCisgICAgICAgICAgIGNyYXRlOi8vY3JhdGVzLmlv
L3N1YnRsZS8yLjUuMCBcCisgICAgICAgICAgIGNyYXRlOi8vY3JhdGVzLmlvL3N5bi8yLjAuOTAg
XAorICAgICAgICAgICBjcmF0ZTovL2NyYXRlcy5pby9zeW5zdHJ1Y3R1cmUvMC4xMy4xIFwKKyAg
ICAgICAgICAgY3JhdGU6Ly9jcmF0ZXMuaW8vdGFyLzAuNC40MyBcCisgICAgICAgICAgIGNyYXRl
Oi8vY3JhdGVzLmlvL3RhcmdldC1sZXhpY29uLzAuMTMuMSBcCisgICAgICAgICAgIGNyYXRlOi8v
Y3JhdGVzLmlvL3RlbXBmaWxlLzMuMTEuMCBcCisgICAgICAgICAgIGNyYXRlOi8vY3JhdGVzLmlv
L3Rlcm1jb2xvci8xLjQuMSBcCisgICAgICAgICAgIGNyYXRlOi8vY3JhdGVzLmlvL3Rlcm1pbmFs
X3NpemUvMC4zLjAgXAorICAgICAgICAgICBjcmF0ZTovL2NyYXRlcy5pby90ZXh0d3JhcC8wLjE2
LjEgXAorICAgICAgICAgICBjcmF0ZTovL2NyYXRlcy5pby90aGlzZXJyb3IvMS4wLjY5IFwKKyAg
ICAgICAgICAgY3JhdGU6Ly9jcmF0ZXMuaW8vdGhpc2Vycm9yLzIuMC4zIFwKKyAgICAgICAgICAg
Y3JhdGU6Ly9jcmF0ZXMuaW8vdGhpc2Vycm9yLWltcGwvMS4wLjY5IFwKKyAgICAgICAgICAgY3Jh
dGU6Ly9jcmF0ZXMuaW8vdGhpc2Vycm9yLWltcGwvMi4wLjMgXAorICAgICAgICAgICBjcmF0ZTov
L2NyYXRlcy5pby90aHJlYWRfbG9jYWwvMS4xLjggXAorICAgICAgICAgICBjcmF0ZTovL2NyYXRl
cy5pby90aW1lLzAuMy4zNiBcCisgICAgICAgICAgIGNyYXRlOi8vY3JhdGVzLmlvL3RpbWUtY29y
ZS8wLjEuMiBcCisgICAgICAgICAgIGNyYXRlOi8vY3JhdGVzLmlvL3RpbWUtbWFjcm9zLzAuMi4x
OCBcCisgICAgICAgICAgIGNyYXRlOi8vY3JhdGVzLmlvL3RpbnlzdHIvMC43LjYgXAorICAgICAg
ICAgICBjcmF0ZTovL2NyYXRlcy5pby90b21sLzAuOC4xOSBcCisgICAgICAgICAgIGNyYXRlOi8v
Y3JhdGVzLmlvL3RvbWxfZGF0ZXRpbWUvMC42LjggXAorICAgICAgICAgICBjcmF0ZTovL2NyYXRl
cy5pby90b21sX2VkaXQvMC4yMS4xIFwKKyAgICAgICAgICAgY3JhdGU6Ly9jcmF0ZXMuaW8vdG9t
bF9lZGl0LzAuMjIuMjIgXAorICAgICAgICAgICBjcmF0ZTovL2NyYXRlcy5pby90cmFjaW5nLzAu
MS40MSBcCisgICAgICAgICAgIGNyYXRlOi8vY3JhdGVzLmlvL3RyYWNpbmctYXR0cmlidXRlcy8w
LjEuMjggXAorICAgICAgICAgICBjcmF0ZTovL2NyYXRlcy5pby90cmFjaW5nLWNvcmUvMC4xLjMz
IFwKKyAgICAgICAgICAgY3JhdGU6Ly9jcmF0ZXMuaW8vdHJhY2luZy1sb2cvMC4yLjAgXAorICAg
ICAgICAgICBjcmF0ZTovL2NyYXRlcy5pby90cmFjaW5nLXNlcmRlLzAuMi4wIFwKKyAgICAgICAg
ICAgY3JhdGU6Ly9jcmF0ZXMuaW8vdHJhY2luZy1zdWJzY3JpYmVyLzAuMy4xOSBcCisgICAgICAg
ICAgIGNyYXRlOi8vY3JhdGVzLmlvL3RyeWNtZC8wLjE1LjYgXAorICAgICAgICAgICBjcmF0ZTov
L2NyYXRlcy5pby90d294LWhhc2gvMS42LjMgXAorICAgICAgICAgICBjcmF0ZTovL2NyYXRlcy5p
by90eXBlbnVtLzEuMTcuMCBcCisgICAgICAgICAgIGNyYXRlOi8vY3JhdGVzLmlvL3VuaWNhc2Uv
Mi43LjAgXAorICAgICAgICAgICBjcmF0ZTovL2NyYXRlcy5pby91bmljb2RlLWlkZW50LzEuMC4x
MiBcCisgICAgICAgICAgIGNyYXRlOi8vY3JhdGVzLmlvL3VuaWNvZGUtbGluZWJyZWFrLzAuMS41
IFwKKyAgICAgICAgICAgY3JhdGU6Ly9jcmF0ZXMuaW8vdW5pY29kZS13aWR0aC8wLjEuMTMgXAor
ICAgICAgICAgICBjcmF0ZTovL2NyYXRlcy5pby91bmljb2RlLXdpZHRoLzAuMi4wIFwKKyAgICAg
ICAgICAgY3JhdGU6Ly9jcmF0ZXMuaW8vdW5pY29kZS14aWQvMC4yLjYgXAorICAgICAgICAgICBj
cmF0ZTovL2NyYXRlcy5pby91bnNjYW5ueS8wLjEuMCBcCisgICAgICAgICAgIGNyYXRlOi8vY3Jh
dGVzLmlvL3VudHJ1c3RlZC8wLjkuMCBcCisgICAgICAgICAgIGNyYXRlOi8vY3JhdGVzLmlvL3Vy
ZXEvMi4xMS4wIFwKKyAgICAgICAgICAgY3JhdGU6Ly9jcmF0ZXMuaW8vdXJsLzIuNS40IFwKKyAg
ICAgICAgICAgY3JhdGU6Ly9jcmF0ZXMuaW8vdXJsZW5jb2RpbmcvMi4xLjMgXAorICAgICAgICAg
ICBjcmF0ZTovL2NyYXRlcy5pby91dGYxNl9pdGVyLzEuMC41IFwKKyAgICAgICAgICAgY3JhdGU6
Ly9jcmF0ZXMuaW8vdXRmOF9pdGVyLzEuMC40IFwKKyAgICAgICAgICAgY3JhdGU6Ly9jcmF0ZXMu
aW8vdXRmOHBhcnNlLzAuMi4yIFwKKyAgICAgICAgICAgY3JhdGU6Ly9jcmF0ZXMuaW8vdXVpZC8x
LjguMCBcCisgICAgICAgICAgIGNyYXRlOi8vY3JhdGVzLmlvL3ZhbHVhYmxlLzAuMS4wIFwKKyAg
ICAgICAgICAgY3JhdGU6Ly9jcmF0ZXMuaW8vdmNwa2cvMC4yLjE1IFwKKyAgICAgICAgICAgY3Jh
dGU6Ly9jcmF0ZXMuaW8vdmVyc2lvbi1yYW5nZXMvMC4xLjEgXAorICAgICAgICAgICBjcmF0ZTov
L2NyYXRlcy5pby92ZXJzaW9uX2NoZWNrLzAuOS40IFwKKyAgICAgICAgICAgY3JhdGU6Ly9jcmF0
ZXMuaW8vdmVyc2lvbnMvNi4yLjAgXAorICAgICAgICAgICBjcmF0ZTovL2NyYXRlcy5pby93YWl0
LXRpbWVvdXQvMC4yLjAgXAorICAgICAgICAgICBjcmF0ZTovL2NyYXRlcy5pby93YWxrZGlyLzIu
NS4wIFwKKyAgICAgICAgICAgY3JhdGU6Ly9jcmF0ZXMuaW8vd2FzaS8wLjExLjArd2FzaS1zbmFw
c2hvdC1wcmV2aWV3MSBcCisgICAgICAgICAgIGNyYXRlOi8vY3JhdGVzLmlvL3dhc2kvMC4xNC4y
K3dhc2ktMC4yLjQgXAorICAgICAgICAgICBjcmF0ZTovL2NyYXRlcy5pby93YXNtLWJpbmRnZW4v
MC4yLjk2IFwKKyAgICAgICAgICAgY3JhdGU6Ly9jcmF0ZXMuaW8vd2FzbS1iaW5kZ2VuLWJhY2tl
bmQvMC4yLjk2IFwKKyAgICAgICAgICAgY3JhdGU6Ly9jcmF0ZXMuaW8vd2FzbS1iaW5kZ2VuLW1h
Y3JvLzAuMi45NiBcCisgICAgICAgICAgIGNyYXRlOi8vY3JhdGVzLmlvL3dhc20tYmluZGdlbi1t
YWNyby1zdXBwb3J0LzAuMi45NiBcCisgICAgICAgICAgIGNyYXRlOi8vY3JhdGVzLmlvL3dhc20t
YmluZGdlbi1zaGFyZWQvMC4yLjk2IFwKKyAgICAgICAgICAgY3JhdGU6Ly9jcmF0ZXMuaW8vd2Vi
LXRpbWUvMS4xLjAgXAorICAgICAgICAgICBjcmF0ZTovL2NyYXRlcy5pby93ZWJwa2ktcm9vdHMv
MC4yNi4yIFwKKyAgICAgICAgICAgY3JhdGU6Ly9jcmF0ZXMuaW8vd2hpY2gvNy4wLjAgXAorICAg
ICAgICAgICBjcmF0ZTovL2NyYXRlcy5pby93aWxkLzIuMi4xIFwKKyAgICAgICAgICAgY3JhdGU6
Ly9jcmF0ZXMuaW8vd2luYXBpLzAuMy45IFwKKyAgICAgICAgICAgY3JhdGU6Ly9jcmF0ZXMuaW8v
d2luYXBpLWk2ODYtcGMtd2luZG93cy1nbnUvMC40LjAgXAorICAgICAgICAgICBjcmF0ZTovL2Ny
YXRlcy5pby93aW5hcGktdXRpbC8wLjEuOCBcCisgICAgICAgICAgIGNyYXRlOi8vY3JhdGVzLmlv
L3dpbmFwaS14ODZfNjQtcGMtd2luZG93cy1nbnUvMC40LjAgXAorICAgICAgICAgICBjcmF0ZTov
L2NyYXRlcy5pby93aW5kb3dzLXN5cy8wLjQ4LjAgXAorICAgICAgICAgICBjcmF0ZTovL2NyYXRl
cy5pby93aW5kb3dzLXN5cy8wLjUyLjAgXAorICAgICAgICAgICBjcmF0ZTovL2NyYXRlcy5pby93
aW5kb3dzLXRhcmdldHMvMC40OC41IFwKKyAgICAgICAgICAgY3JhdGU6Ly9jcmF0ZXMuaW8vd2lu
ZG93cy10YXJnZXRzLzAuNTIuNSBcCisgICAgICAgICAgIGNyYXRlOi8vY3JhdGVzLmlvL3dpbmRv
d3NfYWFyY2g2NF9nbnVsbHZtLzAuNDguNSBcCisgICAgICAgICAgIGNyYXRlOi8vY3JhdGVzLmlv
L3dpbmRvd3NfYWFyY2g2NF9nbnVsbHZtLzAuNTIuNSBcCisgICAgICAgICAgIGNyYXRlOi8vY3Jh
dGVzLmlvL3dpbmRvd3NfYWFyY2g2NF9tc3ZjLzAuNDguNSBcCisgICAgICAgICAgIGNyYXRlOi8v
Y3JhdGVzLmlvL3dpbmRvd3NfYWFyY2g2NF9tc3ZjLzAuNTIuNSBcCisgICAgICAgICAgIGNyYXRl
Oi8vY3JhdGVzLmlvL3dpbmRvd3NfaTY4Nl9nbnUvMC40OC41IFwKKyAgICAgICAgICAgY3JhdGU6
Ly9jcmF0ZXMuaW8vd2luZG93c19pNjg2X2dudS8wLjUyLjUgXAorICAgICAgICAgICBjcmF0ZTov
L2NyYXRlcy5pby93aW5kb3dzX2k2ODZfZ251bGx2bS8wLjUyLjUgXAorICAgICAgICAgICBjcmF0
ZTovL2NyYXRlcy5pby93aW5kb3dzX2k2ODZfbXN2Yy8wLjQ4LjUgXAorICAgICAgICAgICBjcmF0
ZTovL2NyYXRlcy5pby93aW5kb3dzX2k2ODZfbXN2Yy8wLjUyLjUgXAorICAgICAgICAgICBjcmF0
ZTovL2NyYXRlcy5pby93aW5kb3dzX3g4Nl82NF9nbnUvMC40OC41IFwKKyAgICAgICAgICAgY3Jh
dGU6Ly9jcmF0ZXMuaW8vd2luZG93c194ODZfNjRfZ251LzAuNTIuNSBcCisgICAgICAgICAgIGNy
YXRlOi8vY3JhdGVzLmlvL3dpbmRvd3NfeDg2XzY0X2dudWxsdm0vMC40OC41IFwKKyAgICAgICAg
ICAgY3JhdGU6Ly9jcmF0ZXMuaW8vd2luZG93c194ODZfNjRfZ251bGx2bS8wLjUyLjUgXAorICAg
ICAgICAgICBjcmF0ZTovL2NyYXRlcy5pby93aW5kb3dzX3g4Nl82NF9tc3ZjLzAuNDguNSBcCisg
ICAgICAgICAgIGNyYXRlOi8vY3JhdGVzLmlvL3dpbmRvd3NfeDg2XzY0X21zdmMvMC41Mi41IFwK
KyAgICAgICAgICAgY3JhdGU6Ly9jcmF0ZXMuaW8vd2lubm93LzAuNS40MCBcCisgICAgICAgICAg
IGNyYXRlOi8vY3JhdGVzLmlvL3dpbm5vdy8wLjYuMjAgXAorICAgICAgICAgICBjcmF0ZTovL2Ny
YXRlcy5pby93aW5zYWZlLzAuMC4xOSBcCisgICAgICAgICAgIGNyYXRlOi8vY3JhdGVzLmlvL3dp
dC1iaW5kZ2VuLXJ0LzAuMzkuMCBcCisgICAgICAgICAgIGNyYXRlOi8vY3JhdGVzLmlvL3dyaXRl
MTYvMS4wLjAgXAorICAgICAgICAgICBjcmF0ZTovL2NyYXRlcy5pby93cml0ZWFibGUvMC41LjUg
XAorICAgICAgICAgICBjcmF0ZTovL2NyYXRlcy5pby94YXR0ci8xLjMuMSBcCisgICAgICAgICAg
IGNyYXRlOi8vY3JhdGVzLmlvL3h3aW4vMC42LjUgXAorICAgICAgICAgICBjcmF0ZTovL2NyYXRl
cy5pby94ejIvMC4xLjcgXAorICAgICAgICAgICBjcmF0ZTovL2NyYXRlcy5pby95YW5zaS8xLjAu
MSBcCisgICAgICAgICAgIGNyYXRlOi8vY3JhdGVzLmlvL3lva2UvMC43LjQgXAorICAgICAgICAg
ICBjcmF0ZTovL2NyYXRlcy5pby95b2tlLWRlcml2ZS8wLjcuNSBcCisgICAgICAgICAgIGNyYXRl
Oi8vY3JhdGVzLmlvL3plcm9jb3B5LzAuNy4zNSBcCisgICAgICAgICAgIGNyYXRlOi8vY3JhdGVz
LmlvL3plcm9jb3B5LWRlcml2ZS8wLjcuMzUgXAorICAgICAgICAgICBjcmF0ZTovL2NyYXRlcy5p
by96ZXJvZnJvbS8wLjEuNCBcCisgICAgICAgICAgIGNyYXRlOi8vY3JhdGVzLmlvL3plcm9mcm9t
LWRlcml2ZS8wLjEuNSBcCisgICAgICAgICAgIGNyYXRlOi8vY3JhdGVzLmlvL3plcm9pemUvMS44
LjEgXAorICAgICAgICAgICBjcmF0ZTovL2NyYXRlcy5pby96ZXJvdmVjLzAuMTAuNCBcCisgICAg
ICAgICAgIGNyYXRlOi8vY3JhdGVzLmlvL3plcm92ZWMtZGVyaXZlLzAuMTAuMyBcCisgICAgICAg
ICAgIGNyYXRlOi8vY3JhdGVzLmlvL3ppcC8yLjMuMCBcCisgICAgICAgICAgIGNyYXRlOi8vY3Jh
dGVzLmlvL3pvcGZsaS8wLjguMSBcCisgICAgICAgICAgIGNyYXRlOi8vY3JhdGVzLmlvL3pzdGQv
MC4xMy4zIFwKKyAgICAgICAgICAgY3JhdGU6Ly9jcmF0ZXMuaW8venN0ZC1zYWZlLzcuMi40IFwK
KyAgICAgICAgICAgY3JhdGU6Ly9jcmF0ZXMuaW8venN0ZC1zeXMvMi4wLjE1K3pzdGQuMS41Ljcg
XAorICAgICAgICAgICAiCitTUkNfVVJJW3NoYTI1NnN1bV0gPSAiOTZjNzYzNTNmOTRhMTUzYzVk
YzFhOWQzOTE2ZTc1ZmNkMTdlNmJmMjE2YTA2ZGNkYzJmODRiOWY5OGYzNzRhZiIKKworUyA9ICIk
e1dPUktESVJ9L21hdHVyaW4tJHtQVn0iCisKK0NGTEFHUyArPSAiLWZmaWxlLXByZWZpeC1tYXA9
JHtDQVJHT19IT01FfT0ke1RBUkdFVF9EQkdTUkNfRElSfS9jYXJnb19ob21lIgorCitERVBFTkRT
ICs9ICJcCisgICAgcHl0aG9uMy1zZXR1cHRvb2xzLXJ1c3QtbmF0aXZlIFwKKyAgICBweXRob24z
LXNlbWFudGljLXZlcnNpb24tbmF0aXZlIFwKKyAgICBweXRob24zLXNldHVwdG9vbHMtcnVzdCBc
CisiCisKK3JlcXVpcmUgJHtCUE59LWNyYXRlcy5pbmMKKworaW5oZXJpdCBweXBpIGNhcmdvLXVw
ZGF0ZS1yZWNpcGUtY3JhdGVzIHB5dGhvbl9weW8zIHB5dGhvbl9zZXR1cHRvb2xzX2J1aWxkX21l
dGEKKworZG9fY29uZmlndXJlKCkgeworICAgIHB5dGhvbl9weW8zX2RvX2NvbmZpZ3VyZQorICAg
IGNhcmdvX2NvbW1vbl9kb19jb25maWd1cmUKKyAgICBweXRob25fcGVwNTE3X2RvX2NvbmZpZ3Vy
ZQorfQorCitSREVQRU5EUzoke1BOfSArPSAiXAorICAgIGNhcmdvIFwKKyAgICBweXRob24zLWpz
b24gXAorICAgIHJ1c3QgXAorIgorCitSUkVDT01NRU5EUzoke1BOfSArPSAiXAorICAgIHB5dGhv
bjMtZW5zdXJlcGlwIFwKKyAgICBweXRob24zLXBpcCBcCisgICAgcHl0aG9uMy12ZW52IFwKKyIK
KworQkJDTEFTU0VYVEVORCA9ICJuYXRpdmUgbmF0aXZlc2RrIgotLSAKMi40Ny4xCgo=

--===============2261669345143996173==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: attachment; filename="buildhistory-diff.txt"

Changes to packages/core2-64-poky-linux/python3-maturin (sysroot):
  /usr/lib/python3.13/site-packages/maturin-1.8.6.dist-info moved to /usr/lib/python3.13/site-packages/maturin-1.8.7.dist-info

--===============2261669345143996173==--

