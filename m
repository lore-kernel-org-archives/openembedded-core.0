Return-Path: <auh@yoctoproject.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id BFFBEC43602
	for <webhook@archiver.kernel.org>; Tue,  7 Jul 2026 05:50:03 +0000 (UTC)
Received: from a27-191.smtp-out.us-west-2.amazonses.com (a27-191.smtp-out.us-west-2.amazonses.com [54.240.27.191])
 by mx.groups.io with SMTP id smtpd.msgproc01-g2.167394.1783403394337120045
 for <openembedded-core@lists.openembedded.org>;
 Mon, 06 Jul 2026 22:49:57 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@yoctoproject.org header.s=lvjh2tk576v2ro5mi6k4dt3mc6wpqbky header.b=fHh0bdgv;
 dkim=pass header.i=@amazonses.com header.s=hsbnp7p3ensaochzwyq5wwmceodymuwv header.b=KitrFIQi;
 spf=pass (domain: us-west-2.amazonses.com, ip: 54.240.27.191, mailfrom: 0101019f3b203d89-35446e41-64dc-4ff0-adec-e80d7b4eb3a3-000000@us-west-2.amazonses.com)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/simple;
	s=lvjh2tk576v2ro5mi6k4dt3mc6wpqbky; d=yoctoproject.org;
	t=1783403396;
	h=Content-Type:MIME-Version:From:To:Cc:Subject:Message-Id:Date;
	bh=3oyfyAii9h/L/Zc5L+xwWS3gbhCxeY12AAgbQsskYXY=;
	b=fHh0bdgvMhrpM4CFUt2IuvbqMYYksW1fh6QtcEFELrxFpboIFq/NvDOK4/vpk4I+
	UdGGU1IBD+LQsT7jLYnrPw5Jpe4LwdFEHFUCLDLKgKZ+JjTGYqwPcpqA4oD7lpmEaCT
	vB3ARDIDcLNFJjhKa9Ja0xiyKxiLhwjZXyK9eUhk=
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/simple;
	s=hsbnp7p3ensaochzwyq5wwmceodymuwv; d=amazonses.com; t=1783403396;
	h=Content-Type:MIME-Version:From:To:Cc:Subject:Message-Id:Date:Feedback-ID;
	bh=3oyfyAii9h/L/Zc5L+xwWS3gbhCxeY12AAgbQsskYXY=;
	b=KitrFIQiHpiHS0AQpIOHTJXxt3zE9LFDpI7t1eg4hvvCxwwd+9WpS3jJujzIzC5o
	6b2+R72bYxbvz0wUpzsTc1Ui72kvxeLhzME5M6Bwco/OyXIEl/UorZozcja22Whj/xK
	4kPcIQ7HNOKWVCEy+1eCi8MtxJKB1BvrEOPBAPmc=
Content-Type: multipart/mixed; boundary="===============3716546925724268501=="
MIME-Version: 1.0
From: auh@yoctoproject.org
To: Trevor Gamblin <tgamblin@baylibre.com>
Cc: openembedded-core@lists.openembedded.org
Subject: [AUH] python3-uv-build: upgrading to 0.11.27 SUCCEEDED
Message-ID: <0101019f3b203d89-35446e41-64dc-4ff0-adec-e80d7b4eb3a3-000000@us-west-2.amazonses.com>
Date: Tue, 7 Jul 2026 05:49:56 +0000
Feedback-ID: ::1.us-west-2.9np3MYPs3fEaOBysGKSlUD4KtcmPijcmS9Az2Hwf7iQ=:AmazonSES
X-SES-Outgoing: 2026.07.07-54.240.27.191
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Tue, 07 Jul 2026 05:50:03 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/240355

--===============3716546925724268501==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit

Hello,

this email is a notification from the Auto Upgrade Helper
that the automatic attempt to upgrade the recipe(s) *python3-uv-build* to *0.11.27* has Succeeded.

Next steps:
    - apply the patch: git am 0001-python3-uv-build-upgrade-0.11.26-0.11.27.patch
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
From 6948025341b4f4ca339b1b135c062ce7c48a43bb Mon Sep 17 00:00:00 2001
From: Upgrade Helper <auh@yoctoproject.org>
Date: Tue, 7 Jul 2026 05:46:34 +0000
Subject: [PATCH] python3-uv-build: upgrade 0.11.26 -> 0.11.27

---
 .../python/python3-uv-build-crates.inc        | 42 +++----------------
 ...0.11.26.bb => python3-uv-build_0.11.27.bb} |  2 +-
 2 files changed, 7 insertions(+), 37 deletions(-)
 rename meta/recipes-devtools/python/{python3-uv-build_0.11.26.bb => python3-uv-build_0.11.27.bb} (92%)

diff --git a/meta/recipes-devtools/python/python3-uv-build-crates.inc b/meta/recipes-devtools/python/python3-uv-build-crates.inc
index 5f8b1b1183..3762e9a698 100644
--- a/meta/recipes-devtools/python/python3-uv-build-crates.inc
+++ b/meta/recipes-devtools/python/python3-uv-build-crates.inc
@@ -10,7 +10,7 @@ SRC_URI += " \
     crate://crates.io/anstyle-parse/1.0.0 \
     crate://crates.io/anstyle-query/1.1.5 \
     crate://crates.io/anstyle-wincon/3.0.11 \
-    crate://crates.io/anyhow/1.0.102 \
+    crate://crates.io/anyhow/1.0.103 \
     crate://crates.io/arcstr/1.2.0 \
     crate://crates.io/arrayvec/0.7.7 \
     crate://crates.io/astral-tokio-tar/0.6.3 \
@@ -82,7 +82,6 @@ SRC_URI += " \
     crate://crates.io/futures-util/0.3.32 \
     crate://crates.io/generic-array/0.14.7 \
     crate://crates.io/getrandom/0.3.3 \
-    crate://crates.io/getrandom/0.4.1 \
     crate://crates.io/globset/0.4.18 \
     crate://crates.io/gloo-timers/0.3.0 \
     crate://crates.io/hashbrown/0.15.5 \
@@ -96,7 +95,6 @@ SRC_URI += " \
     crate://crates.io/icu_properties/2.1.2 \
     crate://crates.io/icu_properties_data/2.1.2 \
     crate://crates.io/icu_provider/2.1.1 \
-    crate://crates.io/id-arena/2.3.0 \
     crate://crates.io/idna/1.1.0 \
     crate://crates.io/idna_adapter/1.2.1 \
     crate://crates.io/indexmap/2.14.0 \
@@ -113,7 +111,6 @@ SRC_URI += " \
     crate://crates.io/js-sys/0.3.91 \
     crate://crates.io/junction/2.0.0 \
     crate://crates.io/lazy_static/1.5.0 \
-    crate://crates.io/leb128fmt/0.1.0 \
     crate://crates.io/libc/0.2.186 \
     crate://crates.io/linux-raw-sys/0.4.15 \
     crate://crates.io/linux-raw-sys/0.12.1 \
@@ -149,13 +146,12 @@ SRC_URI += " \
     crate://crates.io/portable-atomic/1.13.1 \
     crate://crates.io/portable-atomic-util/0.2.6 \
     crate://crates.io/potential_utf/0.1.4 \
-    crate://crates.io/prettyplease/0.2.37 \
     crate://crates.io/proc-macro-error-attr2/2.0.0 \
     crate://crates.io/proc-macro-error2/2.0.1 \
     crate://crates.io/proc-macro2/1.0.106 \
     crate://crates.io/ptr_meta/0.3.1 \
     crate://crates.io/ptr_meta_derive/0.3.1 \
-    crate://crates.io/quote/1.0.45 \
+    crate://crates.io/quote/1.0.46 \
     crate://crates.io/quoted_printable/0.5.1 \
     crate://crates.io/r-efi/5.3.0 \
     crate://crates.io/rancor/0.1.1 \
@@ -180,7 +176,6 @@ SRC_URI += " \
     crate://crates.io/scopeguard/1.2.0 \
     crate://crates.io/seahash/4.1.0 \
     crate://crates.io/self-replace/1.5.0 \
-    crate://crates.io/semver/1.0.27 \
     crate://crates.io/serde/1.0.228 \
     crate://crates.io/serde-untagged/0.1.9 \
     crate://crates.io/serde_core/1.0.228 \
@@ -236,12 +231,11 @@ SRC_URI += " \
     crate://crates.io/unicode-ident/1.0.24 \
     crate://crates.io/unicode-linebreak/0.1.5 \
     crate://crates.io/unicode-width/0.2.2 \
-    crate://crates.io/unicode-xid/0.2.6 \
     crate://crates.io/unscanny/0.1.0 \
     crate://crates.io/url/2.5.8 \
     crate://crates.io/utf8_iter/1.0.4 \
     crate://crates.io/utf8parse/0.2.2 \
-    crate://crates.io/uuid/1.23.3 \
+    crate://crates.io/uuid/1.23.4 \
     crate://crates.io/valuable/0.1.1 \
     crate://crates.io/version_check/0.9.5 \
     crate://crates.io/vte/0.14.1 \
@@ -249,14 +243,10 @@ SRC_URI += " \
     crate://crates.io/wasi/0.11.1+wasi-snapshot-preview1 \
     crate://crates.io/wasi/0.14.7+wasi-0.2.4 \
     crate://crates.io/wasip2/1.0.2+wasi-0.2.9 \
-    crate://crates.io/wasip3/0.4.0+wasi-0.3.0-rc-2026-01-06 \
     crate://crates.io/wasm-bindgen/0.2.114 \
     crate://crates.io/wasm-bindgen-macro/0.2.114 \
     crate://crates.io/wasm-bindgen-macro-support/0.2.114 \
     crate://crates.io/wasm-bindgen-shared/0.2.114 \
-    crate://crates.io/wasm-encoder/0.244.0 \
-    crate://crates.io/wasm-metadata/0.244.0 \
-    crate://crates.io/wasmparser/0.244.0 \
     crate://crates.io/winapi-util/0.1.11 \
     crate://crates.io/windows/0.61.3 \
     crate://crates.io/windows-collections/0.2.0 \
@@ -283,11 +273,6 @@ SRC_URI += " \
     crate://crates.io/windows_x86_64_msvc/0.52.6 \
     crate://crates.io/winnow/1.0.3 \
     crate://crates.io/wit-bindgen/0.51.0 \
-    crate://crates.io/wit-bindgen-core/0.51.0 \
-    crate://crates.io/wit-bindgen-rust/0.51.0 \
-    crate://crates.io/wit-bindgen-rust-macro/0.51.0 \
-    crate://crates.io/wit-component/0.244.0 \
-    crate://crates.io/wit-parser/0.244.0 \
     crate://crates.io/writeable/0.6.2 \
     crate://crates.io/xattr/1.6.1 \
     crate://crates.io/xz2/0.1.7 \
@@ -313,7 +298,7 @@ SRC_URI[anstyle-1.0.14.sha256sum] = "940b3a0ca603d1eade50a4846a2afffd5ef57a9feac
 SRC_URI[anstyle-parse-1.0.0.sha256sum] = "52ce7f38b242319f7cabaa6813055467063ecdc9d355bbb4ce0c68908cd8130e"
 SRC_URI[anstyle-query-1.1.5.sha256sum] = "40c48f72fd53cd289104fc64099abca73db4166ad86ea0b4341abe65af83dadc"
 SRC_URI[anstyle-wincon-3.0.11.sha256sum] = "291e6a250ff86cd4a820112fb8898808a366d8f9f58ce16d1f538353ad55747d"
-SRC_URI[anyhow-1.0.102.sha256sum] = "7f202df86484c868dbad7eaa557ef785d5c66295e41b460ef922eca0723b842c"
+SRC_URI[anyhow-1.0.103.sha256sum] = "2a4385e2e34eb35d6b3efe798b9eb88096925d87726c0798709bf56d9ed84af3"
 SRC_URI[arcstr-1.2.0.sha256sum] = "03918c3dbd7701a85c6b9887732e2921175f26c350b4563841d0958c21d57e6d"
 SRC_URI[arrayvec-0.7.7.sha256sum] = "f02882884d3e1bc524fb12c79f107f6ad0e1cfd498c536ffb494301740995dfe"
 SRC_URI[astral-tokio-tar-0.6.3.sha256sum] = "08648fef353ab39a9d26f909ad53fc4f071be4c91853b78523f5cc3d9e5ebffd"
@@ -385,7 +370,6 @@ SRC_URI[futures-task-0.3.32.sha256sum] = "037711b3d59c33004d3856fbdc83b99d4ff37a
 SRC_URI[futures-util-0.3.32.sha256sum] = "389ca41296e6190b48053de0321d02a77f32f8a5d2461dd38762c0593805c6d6"
 SRC_URI[generic-array-0.14.7.sha256sum] = "85649ca51fd72272d7821adaf274ad91c288277713d9c18820d8499a7ff69e9a"
 SRC_URI[getrandom-0.3.3.sha256sum] = "26145e563e54f2cadc477553f1ec5ee650b00862f0a58bcd12cbdc5f0ea2d2f4"
-SRC_URI[getrandom-0.4.1.sha256sum] = "139ef39800118c7683f2fd3c98c1b23c09ae076556b435f8e9064ae108aaeeec"
 SRC_URI[globset-0.4.18.sha256sum] = "52dfc19153a48bde0cbd630453615c8151bce3a5adfac7a0aebfbf0a1e1f57e3"
 SRC_URI[gloo-timers-0.3.0.sha256sum] = "bbb143cf96099802033e0d4f4963b19fd2e0b728bcf076cd9cf7f6634f092994"
 SRC_URI[hashbrown-0.15.5.sha256sum] = "9229cfe53dfd69f0609a49f65461bd93001ea1ef889cd5529dd176593f5338a1"
@@ -399,7 +383,6 @@ SRC_URI[icu_normalizer_data-2.1.1.sha256sum] = "7aedcccd01fc5fe81e6b489c15b247b8
 SRC_URI[icu_properties-2.1.2.sha256sum] = "020bfc02fe870ec3a66d93e677ccca0562506e5872c650f893269e08615d74ec"
 SRC_URI[icu_properties_data-2.1.2.sha256sum] = "616c294cf8d725c6afcd8f55abc17c56464ef6211f9ed59cccffe534129c77af"
 SRC_URI[icu_provider-2.1.1.sha256sum] = "85962cf0ce02e1e0a629cc34e7ca3e373ce20dda4c4d7294bbd0bf1fdb59e614"
-SRC_URI[id-arena-2.3.0.sha256sum] = "3d3067d79b975e8844ca9eb072e16b31c3c1c36928edf9c6789548c524d0d954"
 SRC_URI[idna-1.1.0.sha256sum] = "3b0875f23caa03898994f6ddc501886a45c7d3d62d04d2d90788d47be1b1e4de"
 SRC_URI[idna_adapter-1.2.1.sha256sum] = "3acae9609540aa318d1bc588455225fb2085b9ed0c4f6bd0d9d5bcd86f1a0344"
 SRC_URI[indexmap-2.14.0.sha256sum] = "d466e9454f08e4a911e14806c24e16fba1b4c121d1ea474396f396069cf949d9"
@@ -416,7 +399,6 @@ SRC_URI[jobserver-0.1.34.sha256sum] = "9afb3de4395d6b3e67a780b6de64b51c978ecf11c
 SRC_URI[js-sys-0.3.91.sha256sum] = "b49715b7073f385ba4bc528e5747d02e66cb39c6146efb66b781f131f0fb399c"
 SRC_URI[junction-2.0.0.sha256sum] = "160f2eade097f30263b548aae5deb12ad349c909baa710fa24b92c9090b2e006"
 SRC_URI[lazy_static-1.5.0.sha256sum] = "bbd2bcb4c963f2ddae06a2efc7e9f3591312473c50c6685e1f298068316e66fe"
-SRC_URI[leb128fmt-0.1.0.sha256sum] = "09edd9e8b54e49e587e4f6295a7d29c3ea94d469cb40ab8ca70b288248a81db2"
 SRC_URI[libc-0.2.186.sha256sum] = "68ab91017fe16c622486840e4c83c9a37afeff978bd239b5293d61ece587de66"
 SRC_URI[linux-raw-sys-0.4.15.sha256sum] = "d26c52dbd32dccf2d10cac7725f8eae5296885fb5703b261f7d0a0739ec807ab"
 SRC_URI[linux-raw-sys-0.12.1.sha256sum] = "32a66949e030da00e8c7d4434b251670a91556f4144941d37452769c25d58a53"
@@ -452,13 +434,12 @@ SRC_URI[pkg-config-0.3.32.sha256sum] = "7edddbd0b52d732b21ad9a5fab5c704c14cd949e
 SRC_URI[portable-atomic-1.13.1.sha256sum] = "c33a9471896f1c69cecef8d20cbe2f7accd12527ce60845ff44c153bb2a21b49"
 SRC_URI[portable-atomic-util-0.2.6.sha256sum] = "091397be61a01d4be58e7841595bd4bfedb15f1cd54977d79b8271e94ed799a3"
 SRC_URI[potential_utf-0.1.4.sha256sum] = "b73949432f5e2a09657003c25bca5e19a0e9c84f8058ca374f49e0ebe605af77"
-SRC_URI[prettyplease-0.2.37.sha256sum] = "479ca8adacdd7ce8f1fb39ce9ecccbfe93a3f1344b3d0d97f20bc0196208f62b"
 SRC_URI[proc-macro-error-attr2-2.0.0.sha256sum] = "96de42df36bb9bba5542fe9f1a054b8cc87e172759a1868aa05c1f3acc89dfc5"
 SRC_URI[proc-macro-error2-2.0.1.sha256sum] = "11ec05c52be0a07b08061f7dd003e7d7092e0472bc731b4af7bb1ef876109802"
 SRC_URI[proc-macro2-1.0.106.sha256sum] = "8fd00f0bb2e90d81d1044c2b32617f68fcb9fa3bb7640c23e9c748e53fb30934"
 SRC_URI[ptr_meta-0.3.1.sha256sum] = "0b9a0cf95a1196af61d4f1cbdab967179516d9a4a4312af1f31948f8f6224a79"
 SRC_URI[ptr_meta_derive-0.3.1.sha256sum] = "7347867d0a7e1208d93b46767be83e2b8f978c3dad35f775ac8d8847551d6fe1"
-SRC_URI[quote-1.0.45.sha256sum] = "41f2619966050689382d2b44f664f4bc593e129785a36d6ee376ddf37259b924"
+SRC_URI[quote-1.0.46.sha256sum] = "dfbc457d0c7a0759a614551b11a6409e5951f6c7537be1f1b7682b9ae9230368"
 SRC_URI[quoted_printable-0.5.1.sha256sum] = "640c9bd8497b02465aeef5375144c26062e0dcd5939dfcbb0f5db76cb8c17c73"
 SRC_URI[r-efi-5.3.0.sha256sum] = "69cdb34c158ceb288df11e18b4bd39de994f6657d83847bdffdbd7f346754b0f"
 SRC_URI[rancor-0.1.1.sha256sum] = "a063ea72381527c2a0561da9c80000ef822bdd7c3241b1cc1b12100e3df081ee"
@@ -483,7 +464,6 @@ SRC_URI[schemars_derive-1.2.1.sha256sum] = "7d115b50f4aaeea07e79c1912f645c7513d8
 SRC_URI[scopeguard-1.2.0.sha256sum] = "94143f37725109f92c262ed2cf5e59bce7498c01bcc1502d7b9afe439a4e9f49"
 SRC_URI[seahash-4.1.0.sha256sum] = "1c107b6f4780854c8b126e228ea8869f4d7b71260f962fefb57b996b8959ba6b"
 SRC_URI[self-replace-1.5.0.sha256sum] = "03ec815b5eab420ab893f63393878d89c90fdd94c0bcc44c07abb8ad95552fb7"
-SRC_URI[semver-1.0.27.sha256sum] = "d767eb0aabc880b29956c35734170f26ed551a859dbd361d140cdbeca61ab1e2"
 SRC_URI[serde-1.0.228.sha256sum] = "9a8e94ea7f378bd32cbbd37198a4a91436180c5bb472411e48b5ec2e2124ae9e"
 SRC_URI[serde-untagged-0.1.9.sha256sum] = "f9faf48a4a2d2693be24c6289dbe26552776eb7737074e6722891fadbe6c5058"
 SRC_URI[serde_core-1.0.228.sha256sum] = "41d385c7d4ca58e59fc732af25c3983b67ac852c1a25000afe1175de458b67ad"
@@ -539,12 +519,11 @@ SRC_URI[ucd-trie-0.1.7.sha256sum] = "2896d95c02a80c6d6a5d6e953d479f5ddf2dfdb6a24
 SRC_URI[unicode-ident-1.0.24.sha256sum] = "e6e4313cd5fcd3dad5cafa179702e2b244f760991f45397d14d4ebf38247da75"
 SRC_URI[unicode-linebreak-0.1.5.sha256sum] = "3b09c83c3c29d37506a3e260c08c03743a6bb66a9cd432c6934ab501a190571f"
 SRC_URI[unicode-width-0.2.2.sha256sum] = "b4ac048d71ede7ee76d585517add45da530660ef4390e49b098733c6e897f254"
-SRC_URI[unicode-xid-0.2.6.sha256sum] = "ebc1c04c71510c7f702b52b7c350734c9ff1295c464a03335b00bb84fc54f853"
 SRC_URI[unscanny-0.1.0.sha256sum] = "e9df2af067a7953e9c3831320f35c1cc0600c30d44d9f7a12b01db1cd88d6b47"
 SRC_URI[url-2.5.8.sha256sum] = "ff67a8a4397373c3ef660812acab3268222035010ab8680ec4215f38ba3d0eed"
 SRC_URI[utf8_iter-1.0.4.sha256sum] = "b6c140620e7ffbb22c2dee59cafe6084a59b5ffc27a8859a5f0d494b5d52b6be"
 SRC_URI[utf8parse-0.2.2.sha256sum] = "06abde3611657adf66d383f00b093d7faecc7fa57071cce2578660c9f1010821"
-SRC_URI[uuid-1.23.3.sha256sum] = "144d6b123cef80b301b8f72a9e2ca4370ddec21950d0a103dd22c437006d2db7"
+SRC_URI[uuid-1.23.4.sha256sum] = "bf80a72845275afea99e7f2b434723d3bc7e38470fcd1c7ed39a599c73319a53"
 SRC_URI[valuable-0.1.1.sha256sum] = "ba73ea9cf16a25df0c8caa16c51acb937d5712a8429db78a3ee29d5dcacd3a65"
 SRC_URI[version_check-0.9.5.sha256sum] = "0b928f33d975fc6ad9f86c8f283853ad26bdd5b10b7f1542aa2fa15e2289105a"
 SRC_URI[vte-0.14.1.sha256sum] = "231fdcd7ef3037e8330d8e17e61011a2c244126acc0a982f4040ac3f9f0bc077"
@@ -552,14 +531,10 @@ SRC_URI[walkdir-2.5.0.sha256sum] = "29790946404f91d9c5d06f9874efddea1dc06c5efe94
 SRC_URI[wasi-0.11.1+wasi-snapshot-preview1.sha256sum] = "ccf3ec651a847eb01de73ccad15eb7d99f80485de043efb2f370cd654f4ea44b"
 SRC_URI[wasi-0.14.7+wasi-0.2.4.sha256sum] = "883478de20367e224c0090af9cf5f9fa85bed63a95c1abf3afc5c083ebc06e8c"
 SRC_URI[wasip2-1.0.2+wasi-0.2.9.sha256sum] = "9517f9239f02c069db75e65f174b3da828fe5f5b945c4dd26bd25d89c03ebcf5"
-SRC_URI[wasip3-0.4.0+wasi-0.3.0-rc-2026-01-06.sha256sum] = "5428f8bf88ea5ddc08faddef2ac4a67e390b88186c703ce6dbd955e1c145aca5"
 SRC_URI[wasm-bindgen-0.2.114.sha256sum] = "6532f9a5c1ece3798cb1c2cfdba640b9b3ba884f5db45973a6f442510a87d38e"
 SRC_URI[wasm-bindgen-macro-0.2.114.sha256sum] = "18a2d50fcf105fb33bb15f00e7a77b772945a2ee45dcf454961fd843e74c18e6"
 SRC_URI[wasm-bindgen-macro-support-0.2.114.sha256sum] = "03ce4caeaac547cdf713d280eda22a730824dd11e6b8c3ca9e42247b25c631e3"
 SRC_URI[wasm-bindgen-shared-0.2.114.sha256sum] = "75a326b8c223ee17883a4251907455a2431acc2791c98c26279376490c378c16"
-SRC_URI[wasm-encoder-0.244.0.sha256sum] = "990065f2fe63003fe337b932cfb5e3b80e0b4d0f5ff650e6985b1048f62c8319"
-SRC_URI[wasm-metadata-0.244.0.sha256sum] = "bb0e353e6a2fbdc176932bbaab493762eb1255a7900fe0fea1a2f96c296cc909"
-SRC_URI[wasmparser-0.244.0.sha256sum] = "47b807c72e1bac69382b3a6fb3dbe8ea4c0ed87ff5629b8685ae6b9a611028fe"
 SRC_URI[winapi-util-0.1.11.sha256sum] = "c2a7b1c03c876122aa43f3020e6c3c3ee5c05081c9a00739faf7503aeba10d22"
 SRC_URI[windows-0.61.3.sha256sum] = "9babd3a767a4c1aef6900409f85f5d53ce2544ccdfaa86dad48c91782c6d6893"
 SRC_URI[windows-collections-0.2.0.sha256sum] = "3beeceb5e5cfd9eb1d76b381630e82c4241ccd0d27f1a39ed41b2760b255c5e8"
@@ -586,11 +561,6 @@ SRC_URI[windows_x86_64_gnullvm-0.52.6.sha256sum] = "24d5b23dc417412679681396f2b4
 SRC_URI[windows_x86_64_msvc-0.52.6.sha256sum] = "589f6da84c646204747d1270a2a5661ea66ed1cced2631d546fdfb155959f9ec"
 SRC_URI[winnow-1.0.3.sha256sum] = "0592e1c9d151f854e6fd382574c3a0855250e1d9b2f99d9281c6e6391af352f1"
 SRC_URI[wit-bindgen-0.51.0.sha256sum] = "d7249219f66ced02969388cf2bb044a09756a083d0fab1e566056b04d9fbcaa5"
-SRC_URI[wit-bindgen-core-0.51.0.sha256sum] = "ea61de684c3ea68cb082b7a88508a8b27fcc8b797d738bfc99a82facf1d752dc"
-SRC_URI[wit-bindgen-rust-0.51.0.sha256sum] = "b7c566e0f4b284dd6561c786d9cb0142da491f46a9fbed79ea69cdad5db17f21"
-SRC_URI[wit-bindgen-rust-macro-0.51.0.sha256sum] = "0c0f9bfd77e6a48eccf51359e3ae77140a7f50b1e2ebfe62422d8afdaffab17a"
-SRC_URI[wit-component-0.244.0.sha256sum] = "9d66ea20e9553b30172b5e831994e35fbde2d165325bec84fc43dbf6f4eb9cb2"
-SRC_URI[wit-parser-0.244.0.sha256sum] = "ecc8ac4bc1dc3381b7f59c34f00b67e18f910c2c0f50015669dde7def656a736"
 SRC_URI[writeable-0.6.2.sha256sum] = "9edde0db4769d2dc68579893f2306b26c6ecfbe0ef499b013d731b7b9247e0b9"
 SRC_URI[xattr-1.6.1.sha256sum] = "32e45ad4206f6d2479085147f02bc2ef834ac85886624a23575ae137c8aa8156"
 SRC_URI[xz2-0.1.7.sha256sum] = "388c44dc09d76f1536602ead6d325eb532f5c122f17782bd57fb47baeeb767e2"
diff --git a/meta/recipes-devtools/python/python3-uv-build_0.11.26.bb b/meta/recipes-devtools/python/python3-uv-build_0.11.27.bb
similarity index 92%
rename from meta/recipes-devtools/python/python3-uv-build_0.11.26.bb
rename to meta/recipes-devtools/python/python3-uv-build_0.11.27.bb
index 5256edaeae..aaa010283e 100644
--- a/meta/recipes-devtools/python/python3-uv-build_0.11.26.bb
+++ b/meta/recipes-devtools/python/python3-uv-build_0.11.27.bb
@@ -11,7 +11,7 @@ LIC_FILES_CHKSUM = "file://LICENSE-APACHE;md5=86d3f3a95c324c9479bd8986968f4327 \
                     file://crates/uv-pep508/License-Apache;md5=e23fadd6ceef8c618fc1c65191d846fa \
                     file://crates/uv-pep508/License-BSD;md5=ef7a6027dc4c2389b9afad7e690274c7"
 
-SRC_URI[sha256sum] = "4ec58a93d29967a07b8de466b7fe35e0e0cb0ca2bcab8b61d80403b5a9b7a34b"
+SRC_URI[sha256sum] = "bd91e225e3d8a28c5fc06bae31ab91374570aae2a77a128750e98a7c539360f4"
 
 require ${BPN}-crates.inc
 
-- 
2.47.1


--===============3716546925724268501==
Content-Type: application/octet-stream
MIME-Version: 1.0
Content-Transfer-Encoding: base64
Content-Disposition: attachment;
 filename="0001-python3-uv-build-upgrade-0.11.26-0.11.27.patch"

RnJvbSA2OTQ4MDI1MzQxYjRmNGNhMzM5YjFiMTM1YzA2MmNlN2M0OGE0M2JiIE1vbiBTZXAgMTcg
MDA6MDA6MDAgMjAwMQpGcm9tOiBVcGdyYWRlIEhlbHBlciA8YXVoQHlvY3RvcHJvamVjdC5vcmc+
CkRhdGU6IFR1ZSwgNyBKdWwgMjAyNiAwNTo0NjozNCArMDAwMApTdWJqZWN0OiBbUEFUQ0hdIHB5
dGhvbjMtdXYtYnVpbGQ6IHVwZ3JhZGUgMC4xMS4yNiAtPiAwLjExLjI3CgotLS0KIC4uLi9weXRo
b24vcHl0aG9uMy11di1idWlsZC1jcmF0ZXMuaW5jICAgICAgICB8IDQyICsrKy0tLS0tLS0tLS0t
LS0tLS0KIC4uLjAuMTEuMjYuYmIgPT4gcHl0aG9uMy11di1idWlsZF8wLjExLjI3LmJifSB8ICAy
ICstCiAyIGZpbGVzIGNoYW5nZWQsIDcgaW5zZXJ0aW9ucygrKSwgMzcgZGVsZXRpb25zKC0pCiBy
ZW5hbWUgbWV0YS9yZWNpcGVzLWRldnRvb2xzL3B5dGhvbi97cHl0aG9uMy11di1idWlsZF8wLjEx
LjI2LmJiID0+IHB5dGhvbjMtdXYtYnVpbGRfMC4xMS4yNy5iYn0gKDkyJSkKCmRpZmYgLS1naXQg
YS9tZXRhL3JlY2lwZXMtZGV2dG9vbHMvcHl0aG9uL3B5dGhvbjMtdXYtYnVpbGQtY3JhdGVzLmlu
YyBiL21ldGEvcmVjaXBlcy1kZXZ0b29scy9weXRob24vcHl0aG9uMy11di1idWlsZC1jcmF0ZXMu
aW5jCmluZGV4IDVmOGIxYjExODMuLjM3NjJlOWE2OTggMTAwNjQ0Ci0tLSBhL21ldGEvcmVjaXBl
cy1kZXZ0b29scy9weXRob24vcHl0aG9uMy11di1idWlsZC1jcmF0ZXMuaW5jCisrKyBiL21ldGEv
cmVjaXBlcy1kZXZ0b29scy9weXRob24vcHl0aG9uMy11di1idWlsZC1jcmF0ZXMuaW5jCkBAIC0x
MCw3ICsxMCw3IEBAIFNSQ19VUkkgKz0gIiBcCiAgICAgY3JhdGU6Ly9jcmF0ZXMuaW8vYW5zdHls
ZS1wYXJzZS8xLjAuMCBcCiAgICAgY3JhdGU6Ly9jcmF0ZXMuaW8vYW5zdHlsZS1xdWVyeS8xLjEu
NSBcCiAgICAgY3JhdGU6Ly9jcmF0ZXMuaW8vYW5zdHlsZS13aW5jb24vMy4wLjExIFwKLSAgICBj
cmF0ZTovL2NyYXRlcy5pby9hbnlob3cvMS4wLjEwMiBcCisgICAgY3JhdGU6Ly9jcmF0ZXMuaW8v
YW55aG93LzEuMC4xMDMgXAogICAgIGNyYXRlOi8vY3JhdGVzLmlvL2FyY3N0ci8xLjIuMCBcCiAg
ICAgY3JhdGU6Ly9jcmF0ZXMuaW8vYXJyYXl2ZWMvMC43LjcgXAogICAgIGNyYXRlOi8vY3JhdGVz
LmlvL2FzdHJhbC10b2tpby10YXIvMC42LjMgXApAQCAtODIsNyArODIsNiBAQCBTUkNfVVJJICs9
ICIgXAogICAgIGNyYXRlOi8vY3JhdGVzLmlvL2Z1dHVyZXMtdXRpbC8wLjMuMzIgXAogICAgIGNy
YXRlOi8vY3JhdGVzLmlvL2dlbmVyaWMtYXJyYXkvMC4xNC43IFwKICAgICBjcmF0ZTovL2NyYXRl
cy5pby9nZXRyYW5kb20vMC4zLjMgXAotICAgIGNyYXRlOi8vY3JhdGVzLmlvL2dldHJhbmRvbS8w
LjQuMSBcCiAgICAgY3JhdGU6Ly9jcmF0ZXMuaW8vZ2xvYnNldC8wLjQuMTggXAogICAgIGNyYXRl
Oi8vY3JhdGVzLmlvL2dsb28tdGltZXJzLzAuMy4wIFwKICAgICBjcmF0ZTovL2NyYXRlcy5pby9o
YXNoYnJvd24vMC4xNS41IFwKQEAgLTk2LDcgKzk1LDYgQEAgU1JDX1VSSSArPSAiIFwKICAgICBj
cmF0ZTovL2NyYXRlcy5pby9pY3VfcHJvcGVydGllcy8yLjEuMiBcCiAgICAgY3JhdGU6Ly9jcmF0
ZXMuaW8vaWN1X3Byb3BlcnRpZXNfZGF0YS8yLjEuMiBcCiAgICAgY3JhdGU6Ly9jcmF0ZXMuaW8v
aWN1X3Byb3ZpZGVyLzIuMS4xIFwKLSAgICBjcmF0ZTovL2NyYXRlcy5pby9pZC1hcmVuYS8yLjMu
MCBcCiAgICAgY3JhdGU6Ly9jcmF0ZXMuaW8vaWRuYS8xLjEuMCBcCiAgICAgY3JhdGU6Ly9jcmF0
ZXMuaW8vaWRuYV9hZGFwdGVyLzEuMi4xIFwKICAgICBjcmF0ZTovL2NyYXRlcy5pby9pbmRleG1h
cC8yLjE0LjAgXApAQCAtMTEzLDcgKzExMSw2IEBAIFNSQ19VUkkgKz0gIiBcCiAgICAgY3JhdGU6
Ly9jcmF0ZXMuaW8vanMtc3lzLzAuMy45MSBcCiAgICAgY3JhdGU6Ly9jcmF0ZXMuaW8vanVuY3Rp
b24vMi4wLjAgXAogICAgIGNyYXRlOi8vY3JhdGVzLmlvL2xhenlfc3RhdGljLzEuNS4wIFwKLSAg
ICBjcmF0ZTovL2NyYXRlcy5pby9sZWIxMjhmbXQvMC4xLjAgXAogICAgIGNyYXRlOi8vY3JhdGVz
LmlvL2xpYmMvMC4yLjE4NiBcCiAgICAgY3JhdGU6Ly9jcmF0ZXMuaW8vbGludXgtcmF3LXN5cy8w
LjQuMTUgXAogICAgIGNyYXRlOi8vY3JhdGVzLmlvL2xpbnV4LXJhdy1zeXMvMC4xMi4xIFwKQEAg
LTE0OSwxMyArMTQ2LDEyIEBAIFNSQ19VUkkgKz0gIiBcCiAgICAgY3JhdGU6Ly9jcmF0ZXMuaW8v
cG9ydGFibGUtYXRvbWljLzEuMTMuMSBcCiAgICAgY3JhdGU6Ly9jcmF0ZXMuaW8vcG9ydGFibGUt
YXRvbWljLXV0aWwvMC4yLjYgXAogICAgIGNyYXRlOi8vY3JhdGVzLmlvL3BvdGVudGlhbF91dGYv
MC4xLjQgXAotICAgIGNyYXRlOi8vY3JhdGVzLmlvL3ByZXR0eXBsZWFzZS8wLjIuMzcgXAogICAg
IGNyYXRlOi8vY3JhdGVzLmlvL3Byb2MtbWFjcm8tZXJyb3ItYXR0cjIvMi4wLjAgXAogICAgIGNy
YXRlOi8vY3JhdGVzLmlvL3Byb2MtbWFjcm8tZXJyb3IyLzIuMC4xIFwKICAgICBjcmF0ZTovL2Ny
YXRlcy5pby9wcm9jLW1hY3JvMi8xLjAuMTA2IFwKICAgICBjcmF0ZTovL2NyYXRlcy5pby9wdHJf
bWV0YS8wLjMuMSBcCiAgICAgY3JhdGU6Ly9jcmF0ZXMuaW8vcHRyX21ldGFfZGVyaXZlLzAuMy4x
IFwKLSAgICBjcmF0ZTovL2NyYXRlcy5pby9xdW90ZS8xLjAuNDUgXAorICAgIGNyYXRlOi8vY3Jh
dGVzLmlvL3F1b3RlLzEuMC40NiBcCiAgICAgY3JhdGU6Ly9jcmF0ZXMuaW8vcXVvdGVkX3ByaW50
YWJsZS8wLjUuMSBcCiAgICAgY3JhdGU6Ly9jcmF0ZXMuaW8vci1lZmkvNS4zLjAgXAogICAgIGNy
YXRlOi8vY3JhdGVzLmlvL3JhbmNvci8wLjEuMSBcCkBAIC0xODAsNyArMTc2LDYgQEAgU1JDX1VS
SSArPSAiIFwKICAgICBjcmF0ZTovL2NyYXRlcy5pby9zY29wZWd1YXJkLzEuMi4wIFwKICAgICBj
cmF0ZTovL2NyYXRlcy5pby9zZWFoYXNoLzQuMS4wIFwKICAgICBjcmF0ZTovL2NyYXRlcy5pby9z
ZWxmLXJlcGxhY2UvMS41LjAgXAotICAgIGNyYXRlOi8vY3JhdGVzLmlvL3NlbXZlci8xLjAuMjcg
XAogICAgIGNyYXRlOi8vY3JhdGVzLmlvL3NlcmRlLzEuMC4yMjggXAogICAgIGNyYXRlOi8vY3Jh
dGVzLmlvL3NlcmRlLXVudGFnZ2VkLzAuMS45IFwKICAgICBjcmF0ZTovL2NyYXRlcy5pby9zZXJk
ZV9jb3JlLzEuMC4yMjggXApAQCAtMjM2LDEyICsyMzEsMTEgQEAgU1JDX1VSSSArPSAiIFwKICAg
ICBjcmF0ZTovL2NyYXRlcy5pby91bmljb2RlLWlkZW50LzEuMC4yNCBcCiAgICAgY3JhdGU6Ly9j
cmF0ZXMuaW8vdW5pY29kZS1saW5lYnJlYWsvMC4xLjUgXAogICAgIGNyYXRlOi8vY3JhdGVzLmlv
L3VuaWNvZGUtd2lkdGgvMC4yLjIgXAotICAgIGNyYXRlOi8vY3JhdGVzLmlvL3VuaWNvZGUteGlk
LzAuMi42IFwKICAgICBjcmF0ZTovL2NyYXRlcy5pby91bnNjYW5ueS8wLjEuMCBcCiAgICAgY3Jh
dGU6Ly9jcmF0ZXMuaW8vdXJsLzIuNS44IFwKICAgICBjcmF0ZTovL2NyYXRlcy5pby91dGY4X2l0
ZXIvMS4wLjQgXAogICAgIGNyYXRlOi8vY3JhdGVzLmlvL3V0ZjhwYXJzZS8wLjIuMiBcCi0gICAg
Y3JhdGU6Ly9jcmF0ZXMuaW8vdXVpZC8xLjIzLjMgXAorICAgIGNyYXRlOi8vY3JhdGVzLmlvL3V1
aWQvMS4yMy40IFwKICAgICBjcmF0ZTovL2NyYXRlcy5pby92YWx1YWJsZS8wLjEuMSBcCiAgICAg
Y3JhdGU6Ly9jcmF0ZXMuaW8vdmVyc2lvbl9jaGVjay8wLjkuNSBcCiAgICAgY3JhdGU6Ly9jcmF0
ZXMuaW8vdnRlLzAuMTQuMSBcCkBAIC0yNDksMTQgKzI0MywxMCBAQCBTUkNfVVJJICs9ICIgXAog
ICAgIGNyYXRlOi8vY3JhdGVzLmlvL3dhc2kvMC4xMS4xK3dhc2ktc25hcHNob3QtcHJldmlldzEg
XAogICAgIGNyYXRlOi8vY3JhdGVzLmlvL3dhc2kvMC4xNC43K3dhc2ktMC4yLjQgXAogICAgIGNy
YXRlOi8vY3JhdGVzLmlvL3dhc2lwMi8xLjAuMit3YXNpLTAuMi45IFwKLSAgICBjcmF0ZTovL2Ny
YXRlcy5pby93YXNpcDMvMC40LjArd2FzaS0wLjMuMC1yYy0yMDI2LTAxLTA2IFwKICAgICBjcmF0
ZTovL2NyYXRlcy5pby93YXNtLWJpbmRnZW4vMC4yLjExNCBcCiAgICAgY3JhdGU6Ly9jcmF0ZXMu
aW8vd2FzbS1iaW5kZ2VuLW1hY3JvLzAuMi4xMTQgXAogICAgIGNyYXRlOi8vY3JhdGVzLmlvL3dh
c20tYmluZGdlbi1tYWNyby1zdXBwb3J0LzAuMi4xMTQgXAogICAgIGNyYXRlOi8vY3JhdGVzLmlv
L3dhc20tYmluZGdlbi1zaGFyZWQvMC4yLjExNCBcCi0gICAgY3JhdGU6Ly9jcmF0ZXMuaW8vd2Fz
bS1lbmNvZGVyLzAuMjQ0LjAgXAotICAgIGNyYXRlOi8vY3JhdGVzLmlvL3dhc20tbWV0YWRhdGEv
MC4yNDQuMCBcCi0gICAgY3JhdGU6Ly9jcmF0ZXMuaW8vd2FzbXBhcnNlci8wLjI0NC4wIFwKICAg
ICBjcmF0ZTovL2NyYXRlcy5pby93aW5hcGktdXRpbC8wLjEuMTEgXAogICAgIGNyYXRlOi8vY3Jh
dGVzLmlvL3dpbmRvd3MvMC42MS4zIFwKICAgICBjcmF0ZTovL2NyYXRlcy5pby93aW5kb3dzLWNv
bGxlY3Rpb25zLzAuMi4wIFwKQEAgLTI4MywxMSArMjczLDYgQEAgU1JDX1VSSSArPSAiIFwKICAg
ICBjcmF0ZTovL2NyYXRlcy5pby93aW5kb3dzX3g4Nl82NF9tc3ZjLzAuNTIuNiBcCiAgICAgY3Jh
dGU6Ly9jcmF0ZXMuaW8vd2lubm93LzEuMC4zIFwKICAgICBjcmF0ZTovL2NyYXRlcy5pby93aXQt
YmluZGdlbi8wLjUxLjAgXAotICAgIGNyYXRlOi8vY3JhdGVzLmlvL3dpdC1iaW5kZ2VuLWNvcmUv
MC41MS4wIFwKLSAgICBjcmF0ZTovL2NyYXRlcy5pby93aXQtYmluZGdlbi1ydXN0LzAuNTEuMCBc
Ci0gICAgY3JhdGU6Ly9jcmF0ZXMuaW8vd2l0LWJpbmRnZW4tcnVzdC1tYWNyby8wLjUxLjAgXAot
ICAgIGNyYXRlOi8vY3JhdGVzLmlvL3dpdC1jb21wb25lbnQvMC4yNDQuMCBcCi0gICAgY3JhdGU6
Ly9jcmF0ZXMuaW8vd2l0LXBhcnNlci8wLjI0NC4wIFwKICAgICBjcmF0ZTovL2NyYXRlcy5pby93
cml0ZWFibGUvMC42LjIgXAogICAgIGNyYXRlOi8vY3JhdGVzLmlvL3hhdHRyLzEuNi4xIFwKICAg
ICBjcmF0ZTovL2NyYXRlcy5pby94ejIvMC4xLjcgXApAQCAtMzEzLDcgKzI5OCw3IEBAIFNSQ19V
UklbYW5zdHlsZS0xLjAuMTQuc2hhMjU2c3VtXSA9ICI5NDBiM2EwY2E2MDNkMWVhZGU1MGE0ODQ2
YTJhZmZmZDVlZjU3YTlmZWFjCiBTUkNfVVJJW2Fuc3R5bGUtcGFyc2UtMS4wLjAuc2hhMjU2c3Vt
XSA9ICI1MmNlN2YzOGIyNDIzMTlmN2NhYmFhNjgxMzA1NTQ2NzA2M2VjZGM5ZDM1NWJiYjRjZTBj
Njg5MDhjZDgxMzBlIgogU1JDX1VSSVthbnN0eWxlLXF1ZXJ5LTEuMS41LnNoYTI1NnN1bV0gPSAi
NDBjNDhmNzJmZDUzY2QyODkxMDRmYzY0MDk5YWJjYTczZGI0MTY2YWQ4NmVhMGI0MzQxYWJlNjVh
ZjgzZGFkYyIKIFNSQ19VUklbYW5zdHlsZS13aW5jb24tMy4wLjExLnNoYTI1NnN1bV0gPSAiMjkx
ZTZhMjUwZmY4NmNkNGE4MjAxMTJmYjg4OTg4MDhhMzY2ZDhmOWY1OGNlMTZkMWY1MzgzNTNhZDU1
NzQ3ZCIKLVNSQ19VUklbYW55aG93LTEuMC4xMDIuc2hhMjU2c3VtXSA9ICI3ZjIwMmRmODY0ODRj
ODY4ZGJhZDdlYWE1NTdlZjc4NWQ1YzY2Mjk1ZTQxYjQ2MGVmOTIyZWNhMDcyM2I4NDJjIgorU1JD
X1VSSVthbnlob3ctMS4wLjEwMy5zaGEyNTZzdW1dID0gIjJhNDM4NWUyZTM0ZWIzNWQ2YjNlZmU3
OThiOWViODgwOTY5MjVkODc3MjZjMDc5ODcwOWJmNTZkOWVkODRhZjMiCiBTUkNfVVJJW2FyY3N0
ci0xLjIuMC5zaGEyNTZzdW1dID0gIjAzOTE4YzNkYmQ3NzAxYTg1YzZiOTg4NzczMmUyOTIxMTc1
ZjI2YzM1MGI0NTYzODQxZDA5NThjMjFkNTdlNmQiCiBTUkNfVVJJW2FycmF5dmVjLTAuNy43LnNo
YTI1NnN1bV0gPSAiZjAyODgyODg0ZDNlMWJjNTI0ZmIxMmM3OWYxMDdmNmFkMGUxY2ZkNDk4YzUz
NmZmYjQ5NDMwMTc0MDk5NWRmZSIKIFNSQ19VUklbYXN0cmFsLXRva2lvLXRhci0wLjYuMy5zaGEy
NTZzdW1dID0gIjA4NjQ4ZmVmMzUzYWIzOWE5ZDI2ZjkwOWFkNTNmYzRmMDcxYmU0YzkxODUzYjc4
NTIzZjVjYzNkOWU1ZWJmZmQiCkBAIC0zODUsNyArMzcwLDYgQEAgU1JDX1VSSVtmdXR1cmVzLXRh
c2stMC4zLjMyLnNoYTI1NnN1bV0gPSAiMDM3NzExYjNkNTljMzMwMDRkMzg1NmZiZGM4M2I5OWQ0
ZmYzN2EKIFNSQ19VUklbZnV0dXJlcy11dGlsLTAuMy4zMi5zaGEyNTZzdW1dID0gIjM4OWNhNDEy
OTZlNjE5MGI0ODA1M2RlMDMyMWQwMmE3N2YzMmY4YTVkMjQ2MWRkMzg3NjJjMDU5MzgwNWM2ZDYi
CiBTUkNfVVJJW2dlbmVyaWMtYXJyYXktMC4xNC43LnNoYTI1NnN1bV0gPSAiODU2NDljYTUxZmQ3
MjI3MmQ3ODIxYWRhZjI3NGFkOTFjMjg4Mjc3NzEzZDljMTg4MjBkODQ5OWE3ZmY2OWU5YSIKIFNS
Q19VUklbZ2V0cmFuZG9tLTAuMy4zLnNoYTI1NnN1bV0gPSAiMjYxNDVlNTYzZTU0ZjJjYWRjNDc3
NTUzZjFlYzVlZTY1MGIwMDg2MmYwYTU4YmNkMTJjYmRjNWYwZWEyZDJmNCIKLVNSQ19VUklbZ2V0
cmFuZG9tLTAuNC4xLnNoYTI1NnN1bV0gPSAiMTM5ZWYzOTgwMDExOGM3NjgzZjJmZDNjOThjMWIy
M2MwOWFlMDc2NTU2YjQzNWY4ZTkwNjRhZTEwOGFhZWVlYyIKIFNSQ19VUklbZ2xvYnNldC0wLjQu
MTguc2hhMjU2c3VtXSA9ICI1MmRmYzE5MTUzYTQ4YmRlMGNiZDYzMDQ1MzYxNWM4MTUxYmNlM2E1
YWRmYWM3YTBhZWJmYmYwYTFlMWY1N2UzIgogU1JDX1VSSVtnbG9vLXRpbWVycy0wLjMuMC5zaGEy
NTZzdW1dID0gImJiYjE0M2NmOTYwOTk4MDIwMzNlMGQ0ZjQ5NjNiMTlmZDJlMGI3MjhiY2YwNzZj
ZDljZjdmNjYzNGYwOTI5OTQiCiBTUkNfVVJJW2hhc2hicm93bi0wLjE1LjUuc2hhMjU2c3VtXSA9
ICI5MjI5Y2ZlNTNkZmQ2OWYwNjA5YTQ5ZjY1NDYxYmQ5MzAwMWVhMWVmODg5Y2Q1NTI5ZGQxNzY1
OTNmNTMzOGExIgpAQCAtMzk5LDcgKzM4Myw2IEBAIFNSQ19VUklbaWN1X25vcm1hbGl6ZXJfZGF0
YS0yLjEuMS5zaGEyNTZzdW1dID0gIjdhZWRjY2NkMDFmYzVmZTgxZTZiNDg5YzE1YjI0N2I4CiBT
UkNfVVJJW2ljdV9wcm9wZXJ0aWVzLTIuMS4yLnNoYTI1NnN1bV0gPSAiMDIwYmZjMDJmZTg3MGVj
M2E2NmQ5M2U2NzdjY2NhMDU2MjUwNmU1ODcyYzY1MGY4OTMyNjllMDg2MTVkNzRlYyIKIFNSQ19V
UklbaWN1X3Byb3BlcnRpZXNfZGF0YS0yLjEuMi5zaGEyNTZzdW1dID0gIjYxNmMyOTRjZjhkNzI1
YzZhZmNkOGY1NWFiYzE3YzU2NDY0ZWY2MjExZjllZDU5Y2NjZmZlNTM0MTI5Yzc3YWYiCiBTUkNf
VVJJW2ljdV9wcm92aWRlci0yLjEuMS5zaGEyNTZzdW1dID0gIjg1OTYyY2YwY2UwMmUxZTBhNjI5
Y2MzNGU3Y2EzZTM3M2NlMjBkZGE0YzRkNzI5NGJiZDBiZjFmZGI1OWU2MTQiCi1TUkNfVVJJW2lk
LWFyZW5hLTIuMy4wLnNoYTI1NnN1bV0gPSAiM2QzMDY3ZDc5Yjk3NWU4ODQ0Y2E5ZWIwNzJlMTZi
MzFjM2MxYzM2OTI4ZWRmOWM2Nzg5NTQ4YzUyNGQwZDk1NCIKIFNSQ19VUklbaWRuYS0xLjEuMC5z
aGEyNTZzdW1dID0gIjNiMDg3NWYyM2NhYTAzODk4OTk0ZjZkZGM1MDE4ODZhNDVjN2QzZDYyZDA0
ZDJkOTA3ODhkNDdiZTFiMWU0ZGUiCiBTUkNfVVJJW2lkbmFfYWRhcHRlci0xLjIuMS5zaGEyNTZz
dW1dID0gIjNhY2FlOTYwOTU0MGFhMzE4ZDFiYzU4ODQ1NTIyNWZiMjA4NWI5ZWQwYzRmNmJkMGQ5
ZDViY2Q4NmYxYTAzNDQiCiBTUkNfVVJJW2luZGV4bWFwLTIuMTQuMC5zaGEyNTZzdW1dID0gImQ0
NjZlOTQ1NGYwOGU0YTkxMWUxNDgwNmMyNGUxNmZiYTFiNGMxMjFkMWVhNDc0Mzk2ZjM5NjA2OWNm
OTQ5ZDkiCkBAIC00MTYsNyArMzk5LDYgQEAgU1JDX1VSSVtqb2JzZXJ2ZXItMC4xLjM0LnNoYTI1
NnN1bV0gPSAiOWFmYjNkZTQzOTVkNmIzZTY3YTc4MGI2ZGU2NGI1MWM5NzhlY2YxMWMKIFNSQ19V
UklbanMtc3lzLTAuMy45MS5zaGEyNTZzdW1dID0gImI0OTcxNWI3MDczZjM4NWJhNGJjNTI4ZTU3
NDdkMDJlNjZjYjM5YzYxNDZlZmI2NmI3ODFmMTMxZjBmYjM5OWMiCiBTUkNfVVJJW2p1bmN0aW9u
LTIuMC4wLnNoYTI1NnN1bV0gPSAiMTYwZjJlYWRlMDk3ZjMwMjYzYjU0OGFhZTVkZWIxMmFkMzQ5
YzkwOWJhYTcxMGZhMjRiOTJjOTA5MGIyZTAwNiIKIFNSQ19VUklbbGF6eV9zdGF0aWMtMS41LjAu
c2hhMjU2c3VtXSA9ICJiYmQyYmNiNGM5NjNmMmRkYWUwNmEyZWZjN2U5ZjM1OTEzMTI0NzNjNTBj
NjY4NWUxZjI5ODA2ODMxNmU2NmZlIgotU1JDX1VSSVtsZWIxMjhmbXQtMC4xLjAuc2hhMjU2c3Vt
XSA9ICIwOWVkZDllOGI1NGU0OWU1ODdlNGY2Mjk1YTdkMjljM2VhOTRkNDY5Y2I0MGFiOGNhNzBi
Mjg4MjQ4YTgxZGIyIgogU1JDX1VSSVtsaWJjLTAuMi4xODYuc2hhMjU2c3VtXSA9ICI2OGFiOTEw
MTdmZTE2YzYyMjQ4Njg0MGU0YzgzYzlhMzdhZmVmZjk3OGJkMjM5YjUyOTNkNjFlY2U1ODdkZTY2
IgogU1JDX1VSSVtsaW51eC1yYXctc3lzLTAuNC4xNS5zaGEyNTZzdW1dID0gImQyNmM1MmRiZDMy
ZGNjZjJkMTBjYWM3NzI1ZjhlYWU1Mjk2ODg1ZmI1NzAzYjI2MWY3ZDBhMDczOWVjODA3YWIiCiBT
UkNfVVJJW2xpbnV4LXJhdy1zeXMtMC4xMi4xLnNoYTI1NnN1bV0gPSAiMzJhNjY5NDllMDMwZGEw
MGU4YzdkNDQzNGIyNTE2NzBhOTE1NTZmNDE0NDk0MWQzNzQ1Mjc2OWMyNWQ1OGE1MyIKQEAgLTQ1
MiwxMyArNDM0LDEyIEBAIFNSQ19VUklbcGtnLWNvbmZpZy0wLjMuMzIuc2hhMjU2c3VtXSA9ICI3
ZWRkZGJkMGI1MmQ3MzJiMjFhZDlhNWZhYjVjNzA0YzE0Y2Q5NDllCiBTUkNfVVJJW3BvcnRhYmxl
LWF0b21pYy0xLjEzLjEuc2hhMjU2c3VtXSA9ICJjMzNhOTQ3MTg5NmYxYzY5Y2VjZWY4ZDIwY2Jl
MmY3YWNjZDEyNTI3Y2U2MDg0NWZmNDRjMTUzYmIyYTIxYjQ5IgogU1JDX1VSSVtwb3J0YWJsZS1h
dG9taWMtdXRpbC0wLjIuNi5zaGEyNTZzdW1dID0gIjA5MTM5N2JlNjFhMDFkNGJlNThlNzg0MTU5
NWJkNGJmZWRiMTVmMWNkNTQ5NzdkNzliODI3MWU5NGVkNzk5YTMiCiBTUkNfVVJJW3BvdGVudGlh
bF91dGYtMC4xLjQuc2hhMjU2c3VtXSA9ICJiNzM5NDk0MzJmNWUyYTA5NjU3MDAzYzI1YmNhNWUx
OWEwZTljODRmODA1OGNhMzc0ZjQ5ZTBlYmU2MDVhZjc3IgotU1JDX1VSSVtwcmV0dHlwbGVhc2Ut
MC4yLjM3LnNoYTI1NnN1bV0gPSAiNDc5Y2E4YWRhY2RkN2NlOGYxZmIzOWNlOWVjY2NiZmU5M2Ez
ZjEzNDRiM2QwZDk3ZjIwYmMwMTk2MjA4ZjYyYiIKIFNSQ19VUklbcHJvYy1tYWNyby1lcnJvci1h
dHRyMi0yLjAuMC5zaGEyNTZzdW1dID0gIjk2ZGU0MmRmMzZiYjliYmE1NTQyZmU5ZjFhMDU0Yjhj
Yzg3ZTE3Mjc1OWExODY4YWEwNWMxZjNhY2M4OWRmYzUiCiBTUkNfVVJJW3Byb2MtbWFjcm8tZXJy
b3IyLTIuMC4xLnNoYTI1NnN1bV0gPSAiMTFlYzA1YzUyYmUwYTA3YjA4MDYxZjdkZDAwM2U3ZDcw
OTJlMDQ3MmJjNzMxYjRhZjdiYjFlZjg3NjEwOTgwMiIKIFNSQ19VUklbcHJvYy1tYWNybzItMS4w
LjEwNi5zaGEyNTZzdW1dID0gIjhmZDAwZjBiYjJlOTBkODFkMTA0NGMyYjMyNjE3ZjY4ZmNiOWZh
M2JiNzY0MGMyM2U5Yzc0OGU1M2ZiMzA5MzQiCiBTUkNfVVJJW3B0cl9tZXRhLTAuMy4xLnNoYTI1
NnN1bV0gPSAiMGI5YTBjZjk1YTExOTZhZjYxZDRmMWNiZGFiOTY3MTc5NTE2ZDlhNGE0MzEyYWYx
ZjMxOTQ4ZjhmNjIyNGE3OSIKIFNSQ19VUklbcHRyX21ldGFfZGVyaXZlLTAuMy4xLnNoYTI1NnN1
bV0gPSAiNzM0Nzg2N2QwYTdlMTIwOGQ5M2I0Njc2N2JlODNlMmI4Zjk3OGMzZGFkMzVmNzc1YWM4
ZDg4NDc1NTFkNmZlMSIKLVNSQ19VUklbcXVvdGUtMS4wLjQ1LnNoYTI1NnN1bV0gPSAiNDFmMjYx
OTk2NjA1MDY4OTM4MmQyYjQ0ZjY2NGY0YmM1OTNlMTI5Nzg1YTM2ZDZlZTM3NmRkZjM3MjU5Yjky
NCIKK1NSQ19VUklbcXVvdGUtMS4wLjQ2LnNoYTI1NnN1bV0gPSAiZGZiYzQ1N2QwYzdhMDc1OWE2
MTQ1NTFiMTFhNjQwOWU1OTUxZjZjNzUzN2JlMWYxYjc2ODJiOWFlOTIzMDM2OCIKIFNSQ19VUklb
cXVvdGVkX3ByaW50YWJsZS0wLjUuMS5zaGEyNTZzdW1dID0gIjY0MGM5YmQ4NDk3YjAyNDY1YWVl
ZjUzNzUxNDRjMjYwNjJlMGRjZDU5MzlkZmNiYjBmNWRiNzZjYjhjMTdjNzMiCiBTUkNfVVJJW3It
ZWZpLTUuMy4wLnNoYTI1NnN1bV0gPSAiNjljZGIzNGMxNThjZWIyODhkZjExZTE4YjRiZDM5ZGU5
OTRmNjY1N2Q4Mzg0N2JkZmZkYmQ3ZjM0Njc1NGIwZiIKIFNSQ19VUklbcmFuY29yLTAuMS4xLnNo
YTI1NnN1bV0gPSAiYTA2M2VhNzIzODE1MjdjMmEwNTYxZGE5YzgwMDAwZWY4MjJiZGQ3YzMyNDFi
MWNjMWIxMjEwMGUzZGYwODFlZSIKQEAgLTQ4Myw3ICs0NjQsNiBAQCBTUkNfVVJJW3NjaGVtYXJz
X2Rlcml2ZS0xLjIuMS5zaGEyNTZzdW1dID0gIjdkMTE1YjUwZjRhYWVlYTA3ZTc5YzE5MTJmNjQ1
Yzc1MTNkOAogU1JDX1VSSVtzY29wZWd1YXJkLTEuMi4wLnNoYTI1NnN1bV0gPSAiOTQxNDNmMzc3
MjUxMDlmOTJjMjYyZWQyY2Y1ZTU5YmNlNzQ5OGMwMWJjYzE1MDJkN2I5YWZlNDM5YTRlOWY0OSIK
IFNSQ19VUklbc2VhaGFzaC00LjEuMC5zaGEyNTZzdW1dID0gIjFjMTA3YjZmNDc4MDg1NGM4YjEy
NmUyMjhlYTg4NjlmNGQ3YjcxMjYwZjk2MmZlZmI1N2I5OTZiODk1OWJhNmIiCiBTUkNfVVJJW3Nl
bGYtcmVwbGFjZS0xLjUuMC5zaGEyNTZzdW1dID0gIjAzZWM4MTViNWVhYjQyMGFiODkzZjYzMzkz
ODc4ZDg5YzkwZmRkOTRjMGJjYzQ0YzA3YWJiOGFkOTU1NTJmYjciCi1TUkNfVVJJW3NlbXZlci0x
LjAuMjcuc2hhMjU2c3VtXSA9ICJkNzY3ZWIwYWFiYzg4MGIyOTk1NmMzNTczNDE3MGYyNmVkNTUx
YTg1OWRiZDM2MWQxNDBjZGJlY2E2MWFiMWUyIgogU1JDX1VSSVtzZXJkZS0xLjAuMjI4LnNoYTI1
NnN1bV0gPSAiOWE4ZTk0ZWE3ZjM3OGJkMzJjYmJkMzcxOThhNGE5MTQzNjE4MGM1YmI0NzI0MTFl
NDhiNWVjMmUyMTI0YWU5ZSIKIFNSQ19VUklbc2VyZGUtdW50YWdnZWQtMC4xLjkuc2hhMjU2c3Vt
XSA9ICJmOWZhZjQ4YTRhMmQyNjkzYmUyNGM2Mjg5ZGJlMjY1NTI3NzZlYjc3MzcwNzRlNjcyMjg5
MWZhZGJlNmM1MDU4IgogU1JDX1VSSVtzZXJkZV9jb3JlLTEuMC4yMjguc2hhMjU2c3VtXSA9ICI0
MWQzODVjN2Q0Y2E1OGU1OWZjNzMyYWYyNWMzOTgzYjY3YWM4NTJjMWEyNTAwMGFmZTExNzVkZTQ1
OGI2N2FkIgpAQCAtNTM5LDEyICs1MTksMTEgQEAgU1JDX1VSSVt1Y2QtdHJpZS0wLjEuNy5zaGEy
NTZzdW1dID0gIjI4OTZkOTVjMDJhODBjNmQ2YTVkNmU5NTNkNDc5ZjVkZGYyZGZkYjZhMjQKIFNS
Q19VUklbdW5pY29kZS1pZGVudC0xLjAuMjQuc2hhMjU2c3VtXSA9ICJlNmU0MzEzY2Q1ZmNkM2Rh
ZDVjYWZhMTc5NzAyZTJiMjQ0Zjc2MDk5MWY0NTM5N2QxNGQ0ZWJmMzgyNDdkYTc1IgogU1JDX1VS
SVt1bmljb2RlLWxpbmVicmVhay0wLjEuNS5zaGEyNTZzdW1dID0gIjNiMDljODNjM2MyOWQzNzUw
NmEzZTI2MGMwOGMwMzc0M2E2YmI2NmE5Y2Q0MzJjNjkzNGFiNTAxYTE5MDU3MWYiCiBTUkNfVVJJ
W3VuaWNvZGUtd2lkdGgtMC4yLjIuc2hhMjU2c3VtXSA9ICJiNGFjMDQ4ZDcxZWRlN2VlNzZkNTg1
NTE3YWRkNDVkYTUzMDY2MGVmNDM5MGU0OWIwOTg3MzNjNmU4OTdmMjU0IgotU1JDX1VSSVt1bmlj
b2RlLXhpZC0wLjIuNi5zaGEyNTZzdW1dID0gImViYzFjMDRjNzE1MTBjN2Y3MDJiNTJiN2MzNTA3
MzRjOWZmMTI5NWM0NjRhMDMzMzViMDBiYjg0ZmM1NGY4NTMiCiBTUkNfVVJJW3Vuc2Nhbm55LTAu
MS4wLnNoYTI1NnN1bV0gPSAiZTlkZjJhZjA2N2E3OTUzZTljMzgzMTMyMGYzNWMxY2MwNjAwYzMw
ZDQ0ZDlmN2ExMmIwMWRiMWNkODhkNmI0NyIKIFNSQ19VUklbdXJsLTIuNS44LnNoYTI1NnN1bV0g
PSAiZmY2N2E4YTQzOTczNzNjM2VmNjYwODEyYWNhYjMyNjgyMjIwMzUwMTBhYjg2ODBlYzQyMTVm
MzhiYTNkMGVlZCIKIFNSQ19VUklbdXRmOF9pdGVyLTEuMC40LnNoYTI1NnN1bV0gPSAiYjZjMTQw
NjIwZTdmZmJiMjJjMmRlZTU5Y2FmZTYwODRhNTliNWZmYzI3YTg4NTlhNWYwZDQ5NGI1ZDUyYjZi
ZSIKIFNSQ19VUklbdXRmOHBhcnNlLTAuMi4yLnNoYTI1NnN1bV0gPSAiMDZhYmRlMzYxMTY1N2Fk
ZjY2ZDM4M2YwMGIwOTNkN2ZhZWNjN2ZhNTcwNzFjY2UyNTc4NjYwYzlmMTAxMDgyMSIKLVNSQ19V
UklbdXVpZC0xLjIzLjMuc2hhMjU2c3VtXSA9ICIxNDRkNmIxMjNjZWY4MGIzMDFiOGY3MmE5ZTJj
YTQzNzBkZGVjMjE5NTBkMGExMDNkZDIyYzQzNzAwNmQyZGI3IgorU1JDX1VSSVt1dWlkLTEuMjMu
NC5zaGEyNTZzdW1dID0gImJmODBhNzI4NDUyNzVhZmVhOTllN2YyYjQzNDcyM2QzYmM3ZTM4NDcw
ZmNkMWM3ZWQzOWE1OTljNzMzMTlhNTMiCiBTUkNfVVJJW3ZhbHVhYmxlLTAuMS4xLnNoYTI1NnN1
bV0gPSAiYmE3M2VhOWNmMTZhMjVkZjBjOGNhYTE2YzUxYWNiOTM3ZDU3MTJhODQyOWRiNzhhM2Vl
MjlkNWRjYWNkM2E2NSIKIFNSQ19VUklbdmVyc2lvbl9jaGVjay0wLjkuNS5zaGEyNTZzdW1dID0g
IjBiOTI4ZjMzZDk3NWZjNmFkOWY4NmM4ZjI4Mzg1M2FkMjZiZGQ1YjEwYjdmMTU0MmFhMmZhMTVl
MjI4OTEwNWEiCiBTUkNfVVJJW3Z0ZS0wLjE0LjEuc2hhMjU2c3VtXSA9ICIyMzFmZGNkN2VmMzAz
N2U4MzMwZDhlMTdlNjEwMTFhMmMyNDQxMjZhY2MwYTk4MmY0MDQwYWMzZjlmMGJjMDc3IgpAQCAt
NTUyLDE0ICs1MzEsMTAgQEAgU1JDX1VSSVt3YWxrZGlyLTIuNS4wLnNoYTI1NnN1bV0gPSAiMjk3
OTA5NDY0MDRmOTFkOWM1ZDA2Zjk4NzRlZmRkZWExZGMwNmM1ZWZlOTQKIFNSQ19VUklbd2FzaS0w
LjExLjErd2FzaS1zbmFwc2hvdC1wcmV2aWV3MS5zaGEyNTZzdW1dID0gImNjZjNlYzY1MWE4NDdl
YjAxZGU3M2NjYWQxNWViN2Q5OWY4MDQ4NWRlMDQzZWZiMmYzNzBjZDY1NGY0ZWE0NGIiCiBTUkNf
VVJJW3dhc2ktMC4xNC43K3dhc2ktMC4yLjQuc2hhMjU2c3VtXSA9ICI4ODM0NzhkZTIwMzY3ZTIy
NGMwMDkwYWY5Y2Y1ZjlmYTg1YmVkNjNhOTVjMWFiZjNhZmM1YzA4M2ViYzA2ZThjIgogU1JDX1VS
SVt3YXNpcDItMS4wLjIrd2FzaS0wLjIuOS5zaGEyNTZzdW1dID0gIjk1MTdmOTIzOWYwMmMwNjlk
Yjc1ZTY1ZjE3NGIzZGE4MjhmZTVmNWI5NDVjNGRkMjZiZDI1ZDg5YzAzZWJjZjUiCi1TUkNfVVJJ
W3dhc2lwMy0wLjQuMCt3YXNpLTAuMy4wLXJjLTIwMjYtMDEtMDYuc2hhMjU2c3VtXSA9ICI1NDI4
ZjhiZjg4ZWE1ZGRjMDhmYWRkZWYyYWM0YTY3ZTM5MGI4ODE4NmM3MDNjZTZkYmQ5NTVlMWMxNDVh
Y2E1IgogU1JDX1VSSVt3YXNtLWJpbmRnZW4tMC4yLjExNC5zaGEyNTZzdW1dID0gIjY1MzJmOWE1
YzFlY2UzNzk4Y2IxYzJjZmRiYTY0MGI5YjNiYTg4NGY1ZGI0NTk3M2E2ZjQ0MjUxMGE4N2QzOGUi
CiBTUkNfVVJJW3dhc20tYmluZGdlbi1tYWNyby0wLjIuMTE0LnNoYTI1NnN1bV0gPSAiMThhMmQ1
MGZjZjEwNWZiMzNiYjE1ZjAwZTdhNzdiNzcyOTQ1YTJlZTQ1ZGNmNDU0OTYxZmQ4NDNlNzRjMThl
NiIKIFNSQ19VUklbd2FzbS1iaW5kZ2VuLW1hY3JvLXN1cHBvcnQtMC4yLjExNC5zaGEyNTZzdW1d
ID0gIjAzY2U0Y2FlYWFjNTQ3Y2RmNzEzZDI4MGVkYTIyYTczMDgyNGRkMTFlNmI4YzNjYTllNDIy
NDdiMjVjNjMxZTMiCiBTUkNfVVJJW3dhc20tYmluZGdlbi1zaGFyZWQtMC4yLjExNC5zaGEyNTZz
dW1dID0gIjc1YTMyNmI4YzIyM2VlMTc4ODNhNDI1MTkwNzQ1NWEyNDMxYWNjMjc5MWM5OGMyNjI3
OTM3NjQ5MGMzNzhjMTYiCi1TUkNfVVJJW3dhc20tZW5jb2Rlci0wLjI0NC4wLnNoYTI1NnN1bV0g
PSAiOTkwMDY1ZjJmZTYzMDAzZmUzMzdiOTMyY2ZiNWUzYjgwZTBiNGQwZjVmZjY1MGU2OTg1YjEw
NDhmNjJjODMxOSIKLVNSQ19VUklbd2FzbS1tZXRhZGF0YS0wLjI0NC4wLnNoYTI1NnN1bV0gPSAi
YmIwZTM1M2U2YTJmYmRjMTc2OTMyYmJhYWI0OTM3NjJlYjEyNTVhNzkwMGZlMGZlYTFhMmY5NmMy
OTZjYzkwOSIKLVNSQ19VUklbd2FzbXBhcnNlci0wLjI0NC4wLnNoYTI1NnN1bV0gPSAiNDdiODA3
YzcyZTFiYWM2OTM4MmIzYTZmYjNkYmU4ZWE0YzBlZDg3ZmY1NjI5Yjg2ODVhZTZiOWE2MTEwMjhm
ZSIKIFNSQ19VUklbd2luYXBpLXV0aWwtMC4xLjExLnNoYTI1NnN1bV0gPSAiYzJhN2IxYzAzYzg3
NjEyMmFhNDNmMzAyMGU2YzNjM2VlNWMwNTA4MWM5YTAwNzM5ZmFmNzUwM2FlYmExMGQyMiIKIFNS
Q19VUklbd2luZG93cy0wLjYxLjMuc2hhMjU2c3VtXSA9ICI5YmFiZDNhNzY3YTRjMWFlZjY5MDA0
MDlmODVmNWQ1M2NlMjU0NGNjZGZhYTg2ZGFkNDhjOTE3ODJjNmQ2ODkzIgogU1JDX1VSSVt3aW5k
b3dzLWNvbGxlY3Rpb25zLTAuMi4wLnNoYTI1NnN1bV0gPSAiM2JlZWNlYjVlNWNmZDllYjFkNzZi
MzgxNjMwZTgyYzQyNDFjY2QwZDI3ZjFhMzllZDQxYjI3NjBiMjU1YzVlOCIKQEAgLTU4NiwxMSAr
NTYxLDYgQEAgU1JDX1VSSVt3aW5kb3dzX3g4Nl82NF9nbnVsbHZtLTAuNTIuNi5zaGEyNTZzdW1d
ID0gIjI0ZDViMjNkYzQxNzQxMjY3OTY4MTM5NmYyYjQKIFNSQ19VUklbd2luZG93c194ODZfNjRf
bXN2Yy0wLjUyLjYuc2hhMjU2c3VtXSA9ICI1ODlmNmRhODRjNjQ2MjA0NzQ3ZDEyNzBhMmE1NjYx
ZWE2NmVkMWNjZWQyNjMxZDU0NmZkZmIxNTU5NTlmOWVjIgogU1JDX1VSSVt3aW5ub3ctMS4wLjMu
c2hhMjU2c3VtXSA9ICIwNTkyZTFjOWQxNTFmODU0ZTZmZDM4MjU3NGMzYTA4NTUyNTBlMWQ5YjJm
OTlkOTI4MWM2ZTYzOTFhZjM1MmYxIgogU1JDX1VSSVt3aXQtYmluZGdlbi0wLjUxLjAuc2hhMjU2
c3VtXSA9ICJkNzI0OTIxOWY2NmNlZDAyOTY5Mzg4Y2YyYmIwNDRhMDk3NTZhMDgzZDBmYWIxZTU2
NjA1NmIwNGQ5ZmJjYWE1IgotU1JDX1VSSVt3aXQtYmluZGdlbi1jb3JlLTAuNTEuMC5zaGEyNTZz
dW1dID0gImVhNjFkZTY4NGMzZWE2OGNiMDgyYjdhODg1MDhhOGIyN2ZjYzhiNzk3ZDczOGJmYzk5
YTgyZmFjZjFkNzUyZGMiCi1TUkNfVVJJW3dpdC1iaW5kZ2VuLXJ1c3QtMC41MS4wLnNoYTI1NnN1
bV0gPSAiYjdjNTY2ZTBmNGIyODRkZDY1NjFjNzg2ZDljYjAxNDJkYTQ5MWY0NmE5ZmJlZDc5ZWE2
OWNkYWQ1ZGIxN2YyMSIKLVNSQ19VUklbd2l0LWJpbmRnZW4tcnVzdC1tYWNyby0wLjUxLjAuc2hh
MjU2c3VtXSA9ICIwYzBmOWJmZDc3ZTZhNDhlY2NmNTEzNTllM2FlNzcxNDBhN2Y1MGIxZTJlYmZl
NjI0MjJkOGFmZGFmZmFiMTdhIgotU1JDX1VSSVt3aXQtY29tcG9uZW50LTAuMjQ0LjAuc2hhMjU2
c3VtXSA9ICI5ZDY2ZWEyMGU5NTUzYjMwMTcyYjVlODMxOTk0ZTM1ZmJkZTJkMTY1MzI1YmVjODRm
YzQzZGJmNmY0ZWI5Y2IyIgotU1JDX1VSSVt3aXQtcGFyc2VyLTAuMjQ0LjAuc2hhMjU2c3VtXSA9
ICJlY2M4YWM0YmMxZGMzMzgxYjdmNTljMzRmMDBiNjdlMThmOTEwYzJjMGY1MDAxNTY2OWRkZTdk
ZWY2NTZhNzM2IgogU1JDX1VSSVt3cml0ZWFibGUtMC42LjIuc2hhMjU2c3VtXSA9ICI5ZWRkZTBk
YjQ3NjlkMmRjNjg1Nzk4OTNmMjMwNmIyNmM2ZWNmYmUwZWY0OTliMDEzZDczMWI3YjkyNDdlMGI5
IgogU1JDX1VSSVt4YXR0ci0xLjYuMS5zaGEyNTZzdW1dID0gIjMyZTQ1YWQ0MjA2ZjZkMjQ3OTA4
NTE0N2YwMmJjMmVmODM0YWM4NTg4NjYyNGEyMzU3NWFlMTM3YzhhYTgxNTYiCiBTUkNfVVJJW3h6
Mi0wLjEuNy5zaGEyNTZzdW1dID0gIjM4OGM0NGRjMDlkNzZmMTUzNjYwMmVhZDZkMzI1ZWI1MzJm
NWMxMjJmMTc3ODJiZDU3ZmI0N2JhZWViNzY3ZTIiCmRpZmYgLS1naXQgYS9tZXRhL3JlY2lwZXMt
ZGV2dG9vbHMvcHl0aG9uL3B5dGhvbjMtdXYtYnVpbGRfMC4xMS4yNi5iYiBiL21ldGEvcmVjaXBl
cy1kZXZ0b29scy9weXRob24vcHl0aG9uMy11di1idWlsZF8wLjExLjI3LmJiCnNpbWlsYXJpdHkg
aW5kZXggOTIlCnJlbmFtZSBmcm9tIG1ldGEvcmVjaXBlcy1kZXZ0b29scy9weXRob24vcHl0aG9u
My11di1idWlsZF8wLjExLjI2LmJiCnJlbmFtZSB0byBtZXRhL3JlY2lwZXMtZGV2dG9vbHMvcHl0
aG9uL3B5dGhvbjMtdXYtYnVpbGRfMC4xMS4yNy5iYgppbmRleCA1MjU2ZWRhZWFlLi5hYWEwMTAy
ODNlIDEwMDY0NAotLS0gYS9tZXRhL3JlY2lwZXMtZGV2dG9vbHMvcHl0aG9uL3B5dGhvbjMtdXYt
YnVpbGRfMC4xMS4yNi5iYgorKysgYi9tZXRhL3JlY2lwZXMtZGV2dG9vbHMvcHl0aG9uL3B5dGhv
bjMtdXYtYnVpbGRfMC4xMS4yNy5iYgpAQCAtMTEsNyArMTEsNyBAQCBMSUNfRklMRVNfQ0hLU1VN
ID0gImZpbGU6Ly9MSUNFTlNFLUFQQUNIRTttZDU9ODZkM2YzYTk1YzMyNGM5NDc5YmQ4OTg2OTY4
ZjQzMjcgXAogICAgICAgICAgICAgICAgICAgICBmaWxlOi8vY3JhdGVzL3V2LXBlcDUwOC9MaWNl
bnNlLUFwYWNoZTttZDU9ZTIzZmFkZDZjZWVmOGM2MThmYzFjNjUxOTFkODQ2ZmEgXAogICAgICAg
ICAgICAgICAgICAgICBmaWxlOi8vY3JhdGVzL3V2LXBlcDUwOC9MaWNlbnNlLUJTRDttZDU9ZWY3
YTYwMjdkYzRjMjM4OWI5YWZhZDdlNjkwMjc0YzciCiAKLVNSQ19VUklbc2hhMjU2c3VtXSA9ICI0
ZWM1OGE5M2QyOTk2N2EwN2I4ZGU0NjZiN2ZlMzVlMGUwY2IwY2EyYmNhYjhiNjFkODA0MDNiNWE5
YjdhMzRiIgorU1JDX1VSSVtzaGEyNTZzdW1dID0gImJkOTFlMjI1ZTNkOGEyOGM1ZmMwNmJhZTMx
YWI5MTM3NDU3MGFhZTJhNzdhMTI4NzUwZTk4YTdjNTM5MzYwZjQiCiAKIHJlcXVpcmUgJHtCUE59
LWNyYXRlcy5pbmMKIAotLSAKMi40Ny4xCgo=

--===============3716546925724268501==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: attachment; filename="buildhistory-diff-full.txt"

packages/x86-64-v3-poky-linux/python3-uv-build: SRC_URI changed from "https://files.pythonhosted.org/packages/source/u/uv_build/uv_build-0.11.26.tar.gz;downloadfilename=uv_build-0.11.26.tar.gz crate://crates.io/adler2/2.0.1 crate://crates.io/aho-corasick/1.1.4 crate://crates.io/allocator-api2/0.2.21 crate://crates.io/anstream/1.0.0 crate://crates.io/anstyle/1.0.14 crate://crates.io/anstyle-parse/1.0.0 crate://crates.io/anstyle-query/1.1.5 crate://crates.io/anstyle-wincon/3.0.11 crate://crates.io/anyhow/1.0.102 crate://crates.io/arcstr/1.2.0 crate://crates.io/arrayvec/0.7.7 crate://crates.io/astral-tokio-tar/0.6.3 crate://crates.io/astral-version-ranges/0.2.0 crate://crates.io/astral_async_zip/0.0.18 crate://crates.io/async-compression/0.4.19 crate://crates.io/autocfg/1.5.0 crate://crates.io/backon/1.6.0 crate://crates.io/base64/0.22.1 crate://crates.io/bitflags/1.3.2 crate://crates.io/bitflags/2.13.0 crate://crates.io/block-buffer/0.10.4 crate://crates.io/boxcar/0.2.14 crate://crates
 .io/bstr/1.12.1 crate://crates.io/bumpalo/3.20.2 crate://crates.io/bytecheck/0.8.2 crate://crates.io/bytecheck_derive/0.8.2 crate://crates.io/bytes/1.12.0 crate://crates.io/bzip2/0.5.2 crate://crates.io/bzip2-sys/0.1.13+1.0.8 crate://crates.io/cc/1.2.57 crate://crates.io/cfg-if/1.0.4 crate://crates.io/charset/0.1.5 crate://crates.io/clap/4.6.1 crate://crates.io/clap_builder/4.6.0 crate://crates.io/clap_derive/4.6.1 crate://crates.io/clap_lex/1.1.0 crate://crates.io/colorchoice/1.0.5 crate://crates.io/console/0.16.3 crate://crates.io/cpufeatures/0.2.17 crate://crates.io/crc32fast/1.5.0 crate://crates.io/crypto-common/0.1.7 crate://crates.io/csv/1.4.0 crate://crates.io/csv-core/0.1.13 crate://crates.io/data-encoding/2.11.0 crate://crates.io/defmt/1.1.0 crate://crates.io/defmt-macros/1.1.0 crate://crates.io/defmt-parser/1.0.0 crate://crates.io/digest/0.10.7 crate://crates.io/displaydoc/0.2.5 crate://crates.io/dunce/1.0.5 crate://crates.io/dyn-clone/1.0.20 crate://crates.io/either/1.16.
 0 crate://crates.io/encode_unicode/1.0.0 crate://crates.io/encoding_rs/0.8.35 crate://crates.io/encoding_rs_io/0.1.7 crate://crates.io/enumflags2/0.7.12 crate://crates.io/enumflags2_derive/0.7.12 crate://crates.io/equivalent/1.0.2 crate://crates.io/erased-serde/0.4.10 crate://crates.io/errno/0.3.14 crate://crates.io/fastrand/2.4.1 crate://crates.io/find-msvc-tools/0.1.9 crate://crates.io/fixedbitset/0.5.7 crate://crates.io/flate2/1.1.9 crate://crates.io/foldhash/0.1.5 crate://crates.io/foldhash/0.2.0 crate://crates.io/form_urlencoded/1.2.2 crate://crates.io/fs-err/3.3.0 crate://crates.io/futures/0.3.32 crate://crates.io/futures-channel/0.3.32 crate://crates.io/futures-core/0.3.32 crate://crates.io/futures-executor/0.3.32 crate://crates.io/futures-io/0.3.32 crate://crates.io/futures-lite/2.6.1 crate://crates.io/futures-macro/0.3.32 crate://crates.io/futures-sink/0.3.32 crate://crates.io/futures-task/0.3.32 crate://crates.io/futures-util/0.3.32 crate://crates.io/generic-array/0.14.7 c
 rate://crates.io/getrandom/0.3.3 crate://crates.io/getrandom/0.4.1 crate://crates.io/globset/0.4.18 crate://crates.io/gloo-timers/0.3.0 crate://crates.io/hashbrown/0.15.5 crate://crates.io/hashbrown/0.17.1 crate://crates.io/heck/0.5.0 crate://crates.io/hex/0.4.3 crate://crates.io/icu_collections/2.1.1 crate://crates.io/icu_locale_core/2.1.1 crate://crates.io/icu_normalizer/2.1.1 crate://crates.io/icu_normalizer_data/2.1.1 crate://crates.io/icu_properties/2.1.2 crate://crates.io/icu_properties_data/2.1.2 crate://crates.io/icu_provider/2.1.1 crate://crates.io/id-arena/2.3.0 crate://crates.io/idna/1.1.0 crate://crates.io/idna_adapter/1.2.1 crate://crates.io/indexmap/2.14.0 crate://crates.io/indoc/2.0.7 crate://crates.io/insta/1.48.0 crate://crates.io/is_terminal_polyfill/1.70.2 crate://crates.io/itertools/0.14.0 crate://crates.io/itoa/1.0.17 crate://crates.io/jiff/0.2.29 crate://crates.io/jiff-static/0.2.29 crate://crates.io/jiff-tzdb/0.1.6 crate://crates.io/jiff-tzdb-platform/0.1.3 cr
 ate://crates.io/jobserver/0.1.34 crate://crates.io/js-sys/0.3.91 crate://crates.io/junction/2.0.0 crate://crates.io/lazy_static/1.5.0 crate://crates.io/leb128fmt/0.1.0 crate://crates.io/libc/0.2.186 crate://crates.io/linux-raw-sys/0.4.15 crate://crates.io/linux-raw-sys/0.12.1 crate://crates.io/litemap/0.8.1 crate://crates.io/lock_api/0.4.14 crate://crates.io/log/0.4.29 crate://crates.io/lzma-sys/0.1.20 crate://crates.io/mailparse/0.16.1 crate://crates.io/matchers/0.2.0 crate://crates.io/memchr/2.8.2 crate://crates.io/miniz_oxide/0.8.9 crate://crates.io/mio/1.2.0 crate://crates.io/munge/0.4.7 crate://crates.io/munge_macro/0.4.7 crate://crates.io/nu-ansi-term/0.50.3 crate://crates.io/once_cell/1.21.4 crate://crates.io/once_cell_polyfill/1.70.2 crate://crates.io/owo-colors/4.3.0 crate://crates.io/parking/2.2.1 crate://crates.io/parking_lot/0.12.5 crate://crates.io/parking_lot_core/0.9.12 crate://crates.io/path-slash/0.2.1 crate://crates.io/percent-encoding/2.3.2 crate://crates.io/pest/
 2.8.6 crate://crates.io/pest_derive/2.8.6 crate://crates.io/pest_generator/2.8.6 crate://crates.io/pest_meta/2.8.6 crate://crates.io/petgraph/0.8.3 crate://crates.io/pin-project/1.1.11 crate://crates.io/pin-project-internal/1.1.11 crate://crates.io/pin-project-lite/0.2.17 crate://crates.io/pkg-config/0.3.32 crate://crates.io/portable-atomic/1.13.1 crate://crates.io/portable-atomic-util/0.2.6 crate://crates.io/potential_utf/0.1.4 crate://crates.io/prettyplease/0.2.37 crate://crates.io/proc-macro-error-attr2/2.0.0 crate://crates.io/proc-macro-error2/2.0.1 crate://crates.io/proc-macro2/1.0.106 crate://crates.io/ptr_meta/0.3.1 crate://crates.io/ptr_meta_derive/0.3.1 crate://crates.io/quote/1.0.45 crate://crates.io/quoted_printable/0.5.1 crate://crates.io/r-efi/5.3.0 crate://crates.io/rancor/0.1.1 crate://crates.io/redox_syscall/0.5.15 crate://crates.io/ref-cast/1.0.25 crate://crates.io/ref-cast-impl/1.0.25 crate://crates.io/reflink-copy/0.1.30 crate://crates.io/regex/1.12.4 crate://crat
 es.io/regex-automata/0.4.14 crate://crates.io/regex-syntax/0.8.11 crate://crates.io/rend/0.5.3 crate://crates.io/rkyv/0.8.16 crate://crates.io/rkyv_derive/0.8.16 crate://crates.io/rustc-hash/2.1.2 crate://crates.io/rustix/0.38.44 crate://crates.io/rustix/1.1.4 crate://crates.io/rustversion/1.0.22 crate://crates.io/ryu/1.0.23 crate://crates.io/same-file/1.0.6 crate://crates.io/schemars/1.2.1 crate://crates.io/schemars_derive/1.2.1 crate://crates.io/scopeguard/1.2.0 crate://crates.io/seahash/4.1.0 crate://crates.io/self-replace/1.5.0 crate://crates.io/semver/1.0.27 crate://crates.io/serde/1.0.228 crate://crates.io/serde-untagged/0.1.9 crate://crates.io/serde_core/1.0.228 crate://crates.io/serde_derive/1.0.228 crate://crates.io/serde_derive_internals/0.29.1 crate://crates.io/serde_json/1.0.150 crate://crates.io/serde_spanned/1.1.1 crate://crates.io/sha2/0.10.9 crate://crates.io/sharded-slab/0.1.7 crate://crates.io/shlex/1.3.0 crate://crates.io/signal-hook-registry/1.4.8 crate://crates.
 io/simd-adler32/0.3.8 crate://crates.io/simdutf8/0.1.5 crate://crates.io/similar/2.7.0 crate://crates.io/slab/0.4.12 crate://crates.io/smallvec/1.15.2 crate://crates.io/smawk/0.3.2 crate://crates.io/spdx/0.13.4 crate://crates.io/stable_deref_trait/1.2.1 crate://crates.io/strip-ansi-escapes/0.2.1 crate://crates.io/strsim/0.11.1 crate://crates.io/syn/2.0.118 crate://crates.io/synstructure/0.13.2 crate://crates.io/temp-env/0.3.6 crate://crates.io/tempfile/3.27.0 crate://crates.io/terminal_size/0.4.4 crate://crates.io/textwrap/0.16.2 crate://crates.io/thiserror/2.0.18 crate://crates.io/thiserror-impl/2.0.18 crate://crates.io/thread_local/1.1.9 crate://crates.io/tinystr/0.8.2 crate://crates.io/tinyvec/1.11.0 crate://crates.io/tinyvec_macros/0.1.1 crate://crates.io/tokio/1.52.3 crate://crates.io/tokio-macros/2.7.0 crate://crates.io/tokio-stream/0.1.18 crate://crates.io/tokio-util/0.7.18 crate://crates.io/toml/1.1.2+spec-1.1.0 crate://crates.io/toml_datetime/1.1.1+spec-1.1.0 crate://crates
 .io/toml_edit/0.25.12+spec-1.1.0 crate://crates.io/toml_parser/1.1.2+spec-1.1.0 crate://crates.io/toml_writer/1.1.1+spec-1.1.0 crate://crates.io/tracing/0.1.44 crate://crates.io/tracing-attributes/0.1.31 crate://crates.io/tracing-core/0.1.36 crate://crates.io/tracing-log/0.2.0 crate://crates.io/tracing-subscriber/0.3.23 crate://crates.io/tracing-test/0.2.6 crate://crates.io/tracing-test-macro/0.2.6 crate://crates.io/typeid/1.0.3 crate://crates.io/typenum/1.19.0 crate://crates.io/ucd-trie/0.1.7 crate://crates.io/unicode-ident/1.0.24 crate://crates.io/unicode-linebreak/0.1.5 crate://crates.io/unicode-width/0.2.2 crate://crates.io/unicode-xid/0.2.6 crate://crates.io/unscanny/0.1.0 crate://crates.io/url/2.5.8 crate://crates.io/utf8_iter/1.0.4 crate://crates.io/utf8parse/0.2.2 crate://crates.io/uuid/1.23.3 crate://crates.io/valuable/0.1.1 crate://crates.io/version_check/0.9.5 crate://crates.io/vte/0.14.1 crate://crates.io/walkdir/2.5.0 crate://crates.io/wasi/0.11.1+wasi-snapshot-preview1
  crate://crates.io/wasi/0.14.7+wasi-0.2.4 crate://crates.io/wasip2/1.0.2+wasi-0.2.9 crate://crates.io/wasip3/0.4.0+wasi-0.3.0-rc-2026-01-06 crate://crates.io/wasm-bindgen/0.2.114 crate://crates.io/wasm-bindgen-macro/0.2.114 crate://crates.io/wasm-bindgen-macro-support/0.2.114 crate://crates.io/wasm-bindgen-shared/0.2.114 crate://crates.io/wasm-encoder/0.244.0 crate://crates.io/wasm-metadata/0.244.0 crate://crates.io/wasmparser/0.244.0 crate://crates.io/winapi-util/0.1.11 crate://crates.io/windows/0.61.3 crate://crates.io/windows-collections/0.2.0 crate://crates.io/windows-core/0.61.2 crate://crates.io/windows-future/0.2.1 crate://crates.io/windows-implement/0.60.2 crate://crates.io/windows-interface/0.59.3 crate://crates.io/windows-link/0.1.3 crate://crates.io/windows-link/0.2.1 crate://crates.io/windows-numerics/0.2.0 crate://crates.io/windows-result/0.3.4 crate://crates.io/windows-strings/0.4.2 crate://crates.io/windows-sys/0.52.0 crate://crates.io/windows-sys/0.61.2 crate://crate
 s.io/windows-targets/0.52.6 crate://crates.io/windows-threading/0.1.0 crate://crates.io/windows_aarch64_gnullvm/0.52.6 crate://crates.io/windows_aarch64_msvc/0.52.6 crate://crates.io/windows_i686_gnu/0.52.6 crate://crates.io/windows_i686_gnullvm/0.52.6 crate://crates.io/windows_i686_msvc/0.52.6 crate://crates.io/windows_x86_64_gnu/0.52.6 crate://crates.io/windows_x86_64_gnullvm/0.52.6 crate://crates.io/windows_x86_64_msvc/0.52.6 crate://crates.io/winnow/1.0.3 crate://crates.io/wit-bindgen/0.51.0 crate://crates.io/wit-bindgen-core/0.51.0 crate://crates.io/wit-bindgen-rust/0.51.0 crate://crates.io/wit-bindgen-rust-macro/0.51.0 crate://crates.io/wit-component/0.244.0 crate://crates.io/wit-parser/0.244.0 crate://crates.io/writeable/0.6.2 crate://crates.io/xattr/1.6.1 crate://crates.io/xz2/0.1.7 crate://crates.io/yoke/0.8.1 crate://crates.io/yoke-derive/0.8.1 crate://crates.io/zerofrom/0.1.6 crate://crates.io/zerofrom-derive/0.1.6 crate://crates.io/zerotrie/0.2.3 crate://crates.io/zerove
 c/0.11.5 crate://crates.io/zerovec-derive/0.11.2 crate://crates.io/zlib-rs/0.6.3 crate://crates.io/zmij/1.0.21 crate://crates.io/zstd/0.13.3 crate://crates.io/zstd-safe/7.2.4 crate://crates.io/zstd-sys/2.0.16+zstd.1.5.7" to "https://files.pythonhosted.org/packages/source/u/uv_build/uv_build-0.11.27.tar.gz;downloadfilename=uv_build-0.11.27.tar.gz crate://crates.io/adler2/2.0.1 crate://crates.io/aho-corasick/1.1.4 crate://crates.io/allocator-api2/0.2.21 crate://crates.io/anstream/1.0.0 crate://crates.io/anstyle/1.0.14 crate://crates.io/anstyle-parse/1.0.0 crate://crates.io/anstyle-query/1.1.5 crate://crates.io/anstyle-wincon/3.0.11 crate://crates.io/anyhow/1.0.103 crate://crates.io/arcstr/1.2.0 crate://crates.io/arrayvec/0.7.7 crate://crates.io/astral-tokio-tar/0.6.3 crate://crates.io/astral-version-ranges/0.2.0 crate://crates.io/astral_async_zip/0.0.18 crate://crates.io/async-compression/0.4.19 crate://crates.io/autocfg/1.5.0 crate://crates.io/backon/1.6.0 crate://crates.io/base64/0.
 22.1 crate://crates.io/bitflags/1.3.2 crate://crates.io/bitflags/2.13.0 crate://crates.io/block-buffer/0.10.4 crate://crates.io/boxcar/0.2.14 crate://crates.io/bstr/1.12.1 crate://crates.io/bumpalo/3.20.2 crate://crates.io/bytecheck/0.8.2 crate://crates.io/bytecheck_derive/0.8.2 crate://crates.io/bytes/1.12.0 crate://crates.io/bzip2/0.5.2 crate://crates.io/bzip2-sys/0.1.13+1.0.8 crate://crates.io/cc/1.2.57 crate://crates.io/cfg-if/1.0.4 crate://crates.io/charset/0.1.5 crate://crates.io/clap/4.6.1 crate://crates.io/clap_builder/4.6.0 crate://crates.io/clap_derive/4.6.1 crate://crates.io/clap_lex/1.1.0 crate://crates.io/colorchoice/1.0.5 crate://crates.io/console/0.16.3 crate://crates.io/cpufeatures/0.2.17 crate://crates.io/crc32fast/1.5.0 crate://crates.io/crypto-common/0.1.7 crate://crates.io/csv/1.4.0 crate://crates.io/csv-core/0.1.13 crate://crates.io/data-encoding/2.11.0 crate://crates.io/defmt/1.1.0 crate://crates.io/defmt-macros/1.1.0 crate://crates.io/defmt-parser/1.0.0 crate:
 //crates.io/digest/0.10.7 crate://crates.io/displaydoc/0.2.5 crate://crates.io/dunce/1.0.5 crate://crates.io/dyn-clone/1.0.20 crate://crates.io/either/1.16.0 crate://crates.io/encode_unicode/1.0.0 crate://crates.io/encoding_rs/0.8.35 crate://crates.io/encoding_rs_io/0.1.7 crate://crates.io/enumflags2/0.7.12 crate://crates.io/enumflags2_derive/0.7.12 crate://crates.io/equivalent/1.0.2 crate://crates.io/erased-serde/0.4.10 crate://crates.io/errno/0.3.14 crate://crates.io/fastrand/2.4.1 crate://crates.io/find-msvc-tools/0.1.9 crate://crates.io/fixedbitset/0.5.7 crate://crates.io/flate2/1.1.9 crate://crates.io/foldhash/0.1.5 crate://crates.io/foldhash/0.2.0 crate://crates.io/form_urlencoded/1.2.2 crate://crates.io/fs-err/3.3.0 crate://crates.io/futures/0.3.32 crate://crates.io/futures-channel/0.3.32 crate://crates.io/futures-core/0.3.32 crate://crates.io/futures-executor/0.3.32 crate://crates.io/futures-io/0.3.32 crate://crates.io/futures-lite/2.6.1 crate://crates.io/futures-macro/0.3.3
 2 crate://crates.io/futures-sink/0.3.32 crate://crates.io/futures-task/0.3.32 crate://crates.io/futures-util/0.3.32 crate://crates.io/generic-array/0.14.7 crate://crates.io/getrandom/0.3.3 crate://crates.io/globset/0.4.18 crate://crates.io/gloo-timers/0.3.0 crate://crates.io/hashbrown/0.15.5 crate://crates.io/hashbrown/0.17.1 crate://crates.io/heck/0.5.0 crate://crates.io/hex/0.4.3 crate://crates.io/icu_collections/2.1.1 crate://crates.io/icu_locale_core/2.1.1 crate://crates.io/icu_normalizer/2.1.1 crate://crates.io/icu_normalizer_data/2.1.1 crate://crates.io/icu_properties/2.1.2 crate://crates.io/icu_properties_data/2.1.2 crate://crates.io/icu_provider/2.1.1 crate://crates.io/idna/1.1.0 crate://crates.io/idna_adapter/1.2.1 crate://crates.io/indexmap/2.14.0 crate://crates.io/indoc/2.0.7 crate://crates.io/insta/1.48.0 crate://crates.io/is_terminal_polyfill/1.70.2 crate://crates.io/itertools/0.14.0 crate://crates.io/itoa/1.0.17 crate://crates.io/jiff/0.2.29 crate://crates.io/jiff-stat
 ic/0.2.29 crate://crates.io/jiff-tzdb/0.1.6 crate://crates.io/jiff-tzdb-platform/0.1.3 crate://crates.io/jobserver/0.1.34 crate://crates.io/js-sys/0.3.91 crate://crates.io/junction/2.0.0 crate://crates.io/lazy_static/1.5.0 crate://crates.io/libc/0.2.186 crate://crates.io/linux-raw-sys/0.4.15 crate://crates.io/linux-raw-sys/0.12.1 crate://crates.io/litemap/0.8.1 crate://crates.io/lock_api/0.4.14 crate://crates.io/log/0.4.29 crate://crates.io/lzma-sys/0.1.20 crate://crates.io/mailparse/0.16.1 crate://crates.io/matchers/0.2.0 crate://crates.io/memchr/2.8.2 crate://crates.io/miniz_oxide/0.8.9 crate://crates.io/mio/1.2.0 crate://crates.io/munge/0.4.7 crate://crates.io/munge_macro/0.4.7 crate://crates.io/nu-ansi-term/0.50.3 crate://crates.io/once_cell/1.21.4 crate://crates.io/once_cell_polyfill/1.70.2 crate://crates.io/owo-colors/4.3.0 crate://crates.io/parking/2.2.1 crate://crates.io/parking_lot/0.12.5 crate://crates.io/parking_lot_core/0.9.12 crate://crates.io/path-slash/0.2.1 crate://c
 rates.io/percent-encoding/2.3.2 crate://crates.io/pest/2.8.6 crate://crates.io/pest_derive/2.8.6 crate://crates.io/pest_generator/2.8.6 crate://crates.io/pest_meta/2.8.6 crate://crates.io/petgraph/0.8.3 crate://crates.io/pin-project/1.1.11 crate://crates.io/pin-project-internal/1.1.11 crate://crates.io/pin-project-lite/0.2.17 crate://crates.io/pkg-config/0.3.32 crate://crates.io/portable-atomic/1.13.1 crate://crates.io/portable-atomic-util/0.2.6 crate://crates.io/potential_utf/0.1.4 crate://crates.io/proc-macro-error-attr2/2.0.0 crate://crates.io/proc-macro-error2/2.0.1 crate://crates.io/proc-macro2/1.0.106 crate://crates.io/ptr_meta/0.3.1 crate://crates.io/ptr_meta_derive/0.3.1 crate://crates.io/quote/1.0.46 crate://crates.io/quoted_printable/0.5.1 crate://crates.io/r-efi/5.3.0 crate://crates.io/rancor/0.1.1 crate://crates.io/redox_syscall/0.5.15 crate://crates.io/ref-cast/1.0.25 crate://crates.io/ref-cast-impl/1.0.25 crate://crates.io/reflink-copy/0.1.30 crate://crates.io/regex/1.
 12.4 crate://crates.io/regex-automata/0.4.14 crate://crates.io/regex-syntax/0.8.11 crate://crates.io/rend/0.5.3 crate://crates.io/rkyv/0.8.16 crate://crates.io/rkyv_derive/0.8.16 crate://crates.io/rustc-hash/2.1.2 crate://crates.io/rustix/0.38.44 crate://crates.io/rustix/1.1.4 crate://crates.io/rustversion/1.0.22 crate://crates.io/ryu/1.0.23 crate://crates.io/same-file/1.0.6 crate://crates.io/schemars/1.2.1 crate://crates.io/schemars_derive/1.2.1 crate://crates.io/scopeguard/1.2.0 crate://crates.io/seahash/4.1.0 crate://crates.io/self-replace/1.5.0 crate://crates.io/serde/1.0.228 crate://crates.io/serde-untagged/0.1.9 crate://crates.io/serde_core/1.0.228 crate://crates.io/serde_derive/1.0.228 crate://crates.io/serde_derive_internals/0.29.1 crate://crates.io/serde_json/1.0.150 crate://crates.io/serde_spanned/1.1.1 crate://crates.io/sha2/0.10.9 crate://crates.io/sharded-slab/0.1.7 crate://crates.io/shlex/1.3.0 crate://crates.io/signal-hook-registry/1.4.8 crate://crates.io/simd-adler32
 /0.3.8 crate://crates.io/simdutf8/0.1.5 crate://crates.io/similar/2.7.0 crate://crates.io/slab/0.4.12 crate://crates.io/smallvec/1.15.2 crate://crates.io/smawk/0.3.2 crate://crates.io/spdx/0.13.4 crate://crates.io/stable_deref_trait/1.2.1 crate://crates.io/strip-ansi-escapes/0.2.1 crate://crates.io/strsim/0.11.1 crate://crates.io/syn/2.0.118 crate://crates.io/synstructure/0.13.2 crate://crates.io/temp-env/0.3.6 crate://crates.io/tempfile/3.27.0 crate://crates.io/terminal_size/0.4.4 crate://crates.io/textwrap/0.16.2 crate://crates.io/thiserror/2.0.18 crate://crates.io/thiserror-impl/2.0.18 crate://crates.io/thread_local/1.1.9 crate://crates.io/tinystr/0.8.2 crate://crates.io/tinyvec/1.11.0 crate://crates.io/tinyvec_macros/0.1.1 crate://crates.io/tokio/1.52.3 crate://crates.io/tokio-macros/2.7.0 crate://crates.io/tokio-stream/0.1.18 crate://crates.io/tokio-util/0.7.18 crate://crates.io/toml/1.1.2+spec-1.1.0 crate://crates.io/toml_datetime/1.1.1+spec-1.1.0 crate://crates.io/toml_edit/0
 .25.12+spec-1.1.0 crate://crates.io/toml_parser/1.1.2+spec-1.1.0 crate://crates.io/toml_writer/1.1.1+spec-1.1.0 crate://crates.io/tracing/0.1.44 crate://crates.io/tracing-attributes/0.1.31 crate://crates.io/tracing-core/0.1.36 crate://crates.io/tracing-log/0.2.0 crate://crates.io/tracing-subscriber/0.3.23 crate://crates.io/tracing-test/0.2.6 crate://crates.io/tracing-test-macro/0.2.6 crate://crates.io/typeid/1.0.3 crate://crates.io/typenum/1.19.0 crate://crates.io/ucd-trie/0.1.7 crate://crates.io/unicode-ident/1.0.24 crate://crates.io/unicode-linebreak/0.1.5 crate://crates.io/unicode-width/0.2.2 crate://crates.io/unscanny/0.1.0 crate://crates.io/url/2.5.8 crate://crates.io/utf8_iter/1.0.4 crate://crates.io/utf8parse/0.2.2 crate://crates.io/uuid/1.23.4 crate://crates.io/valuable/0.1.1 crate://crates.io/version_check/0.9.5 crate://crates.io/vte/0.14.1 crate://crates.io/walkdir/2.5.0 crate://crates.io/wasi/0.11.1+wasi-snapshot-preview1 crate://crates.io/wasi/0.14.7+wasi-0.2.4 crate://c
 rates.io/wasip2/1.0.2+wasi-0.2.9 crate://crates.io/wasm-bindgen/0.2.114 crate://crates.io/wasm-bindgen-macro/0.2.114 crate://crates.io/wasm-bindgen-macro-support/0.2.114 crate://crates.io/wasm-bindgen-shared/0.2.114 crate://crates.io/winapi-util/0.1.11 crate://crates.io/windows/0.61.3 crate://crates.io/windows-collections/0.2.0 crate://crates.io/windows-core/0.61.2 crate://crates.io/windows-future/0.2.1 crate://crates.io/windows-implement/0.60.2 crate://crates.io/windows-interface/0.59.3 crate://crates.io/windows-link/0.1.3 crate://crates.io/windows-link/0.2.1 crate://crates.io/windows-numerics/0.2.0 crate://crates.io/windows-result/0.3.4 crate://crates.io/windows-strings/0.4.2 crate://crates.io/windows-sys/0.52.0 crate://crates.io/windows-sys/0.61.2 crate://crates.io/windows-targets/0.52.6 crate://crates.io/windows-threading/0.1.0 crate://crates.io/windows_aarch64_gnullvm/0.52.6 crate://crates.io/windows_aarch64_msvc/0.52.6 crate://crates.io/windows_i686_gnu/0.52.6 crate://crates.i
 o/windows_i686_gnullvm/0.52.6 crate://crates.io/windows_i686_msvc/0.52.6 crate://crates.io/windows_x86_64_gnu/0.52.6 crate://crates.io/windows_x86_64_gnullvm/0.52.6 crate://crates.io/windows_x86_64_msvc/0.52.6 crate://crates.io/winnow/1.0.3 crate://crates.io/wit-bindgen/0.51.0 crate://crates.io/writeable/0.6.2 crate://crates.io/xattr/1.6.1 crate://crates.io/xz2/0.1.7 crate://crates.io/yoke/0.8.1 crate://crates.io/yoke-derive/0.8.1 crate://crates.io/zerofrom/0.1.6 crate://crates.io/zerofrom-derive/0.1.6 crate://crates.io/zerotrie/0.2.3 crate://crates.io/zerovec/0.11.5 crate://crates.io/zerovec-derive/0.11.2 crate://crates.io/zlib-rs/0.6.3 crate://crates.io/zmij/1.0.21 crate://crates.io/zstd/0.13.3 crate://crates.io/zstd-safe/7.2.4 crate://crates.io/zstd-sys/2.0.16+zstd.1.5.7"
packages/x86-64-v3-poky-linux/python3-uv-build: PKGV changed from 0.11.26 [default] to 0.11.27 [default]
packages/x86-64-v3-poky-linux/python3-uv-build: PV changed from "0.11.26" to "0.11.27"
packages/x86-64-v3-poky-linux/python3-uv-build/python3-uv-build-dbg: PKGV changed from 0.11.26 [default] to 0.11.27 [default]
packages/x86-64-v3-poky-linux/python3-uv-build/python3-uv-build-dbg: PV changed from "0.11.26" to "0.11.27"
packages/x86-64-v3-poky-linux/python3-uv-build/python3-uv-build-dev: PKGV changed from 0.11.26 [default] to 0.11.27 [default]
packages/x86-64-v3-poky-linux/python3-uv-build/python3-uv-build-dev: PV changed from "0.11.26" to "0.11.27"
packages/x86-64-v3-poky-linux/python3-uv-build/python3-uv-build-doc: PKGV changed from 0.11.26 [default] to 0.11.27 [default]
packages/x86-64-v3-poky-linux/python3-uv-build/python3-uv-build-doc: PV changed from "0.11.26" to "0.11.27"
packages/x86-64-v3-poky-linux/python3-uv-build/python3-uv-build-locale: PKGV changed from 0.11.26 [default] to 0.11.27 [default]
packages/x86-64-v3-poky-linux/python3-uv-build/python3-uv-build-locale: PV changed from "0.11.26" to "0.11.27"
packages/x86-64-v3-poky-linux/python3-uv-build/python3-uv-build-src: PKGV changed from 0.11.26 [default] to 0.11.27 [default]
packages/x86-64-v3-poky-linux/python3-uv-build/python3-uv-build-src: PV changed from "0.11.26" to "0.11.27"
packages/x86-64-v3-poky-linux/python3-uv-build/python3-uv-build-staticdev: PKGV changed from 0.11.26 [default] to 0.11.27 [default]
packages/x86-64-v3-poky-linux/python3-uv-build/python3-uv-build-staticdev: PV changed from "0.11.26" to "0.11.27"
packages/x86-64-v3-poky-linux/python3-uv-build/python3-uv-build: FILELIST: directory renamed /usr/lib/python3.14/site-packages/uv_build-0.11.26.dist-info -> /usr/lib/python3.14/site-packages/uv_build-0.11.27.dist-info, directory renamed /usr/lib/python3.14/site-packages/uv_build-0.11.26.dist-info/licenses -> /usr/lib/python3.14/site-packages/uv_build-0.11.27.dist-info/licenses
packages/x86-64-v3-poky-linux/python3-uv-build/python3-uv-build: PKGV changed from 0.11.26 [default] to 0.11.27 [default]
packages/x86-64-v3-poky-linux/python3-uv-build/python3-uv-build: PV changed from "0.11.26" to "0.11.27"
Changes to packages/x86-64-v3-poky-linux/python3-uv-build (sysroot):
  /usr/lib/python3.14/site-packages/uv_build-0.11.26.dist-info moved to /usr/lib/python3.14/site-packages/uv_build-0.11.27.dist-info

--===============3716546925724268501==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: attachment; filename="buildhistory-diff.txt"

packages/x86-64-v3-poky-linux/python3-uv-build/python3-uv-build: FILELIST: directory renamed /usr/lib/python3.14/site-packages/uv_build-0.11.26.dist-info -> /usr/lib/python3.14/site-packages/uv_build-0.11.27.dist-info, directory renamed /usr/lib/python3.14/site-packages/uv_build-0.11.26.dist-info/licenses -> /usr/lib/python3.14/site-packages/uv_build-0.11.27.dist-info/licenses
Changes to packages/x86-64-v3-poky-linux/python3-uv-build (sysroot):
  /usr/lib/python3.14/site-packages/uv_build-0.11.26.dist-info moved to /usr/lib/python3.14/site-packages/uv_build-0.11.27.dist-info

--===============3716546925724268501==--

