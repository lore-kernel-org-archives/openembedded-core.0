Return-Path: <auh@yoctoproject.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 74427CCD18F
	for <webhook@archiver.kernel.org>; Wed,  1 Oct 2025 13:32:23 +0000 (UTC)
Received: from a27-192.smtp-out.us-west-2.amazonses.com (a27-192.smtp-out.us-west-2.amazonses.com [54.240.27.192])
 by mx.groups.io with SMTP id smtpd.web10.17948.1759325539179501843
 for <openembedded-core@lists.openembedded.org>;
 Wed, 01 Oct 2025 06:32:19 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@yoctoproject.org header.s=j46ser6a2yusdzubpv7m7ewqgesde2ie header.b=SRs32DTv;
 dkim=pass header.i=@amazonses.com header.s=gdwg2y3kokkkj5a55z2ilkup5wp5hhxx header.b=hOzjKnbE;
 spf=pass (domain: us-west-2.amazonses.com, ip: 54.240.27.192, mailfrom: 010101999ff94890-5e3fb99b-8a66-4e46-abf0-269bed639660-000000@us-west-2.amazonses.com)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/simple;
	s=j46ser6a2yusdzubpv7m7ewqgesde2ie; d=yoctoproject.org;
	t=1759325538;
	h=Content-Type:MIME-Version:From:To:Cc:Subject:Message-Id:Date;
	bh=NvDuOQy84v6GdYna1nJMuYUY0srGYBWFt/uDsUgB5H4=;
	b=SRs32DTvvEaXsFRxUP6O55nlyjS7r6LlFYDQudMTQGga1V5itsheCC9bklZ+STM4
	HyZHSivKgmSRJ/7X/1KIjwjYHcLwgKHr3iAioCWynCYIPc9vcVitEPpvBW5HCX2LU3F
	1XK7E/6KPKn3zLb1xq1+pqEnG4pvcdyJqG89i8F0=
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/simple;
	s=gdwg2y3kokkkj5a55z2ilkup5wp5hhxx; d=amazonses.com; t=1759325538;
	h=Content-Type:MIME-Version:From:To:Cc:Subject:Message-Id:Date:Feedback-ID;
	bh=NvDuOQy84v6GdYna1nJMuYUY0srGYBWFt/uDsUgB5H4=;
	b=hOzjKnbEfVeWihM8yZzKWcp4muYXKoy+bnqcW6h1hDu6NApaipazlqERcYQyj36c
	+iecCT+ZxPfYwAt3UzCuvyV8Ly8SkbSHDOaq4oTiVnOI7ZOCxWib8Dq8Gmbn/OypWLK
	OaFrsyXwA/JZD5gn1Rsi/hLykT0FR6UMsR81vhdE=
Content-Type: multipart/mixed; boundary="===============5275995096746644768=="
MIME-Version: 1.0
From: auh@yoctoproject.org
To: Tim Orling <tim.orling@konsulko.com>
Cc: openembedded-core@lists.openembedded.org
Subject: [AUH] python3-bcrypt: upgrading to 5.0.0 SUCCEEDED
Message-ID: <010101999ff94890-5e3fb99b-8a66-4e46-abf0-269bed639660-000000@us-west-2.amazonses.com>
Date: Wed, 1 Oct 2025 13:32:18 +0000
Feedback-ID: ::1.us-west-2.9np3MYPs3fEaOBysGKSlUD4KtcmPijcmS9Az2Hwf7iQ=:AmazonSES
X-SES-Outgoing: 2025.10.01-54.240.27.192
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Wed, 01 Oct 2025 13:32:23 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/224236

--===============5275995096746644768==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit

Hello,

this email is a notification from the Auto Upgrade Helper
that the automatic attempt to upgrade the recipe(s) *python3-bcrypt* to *5.0.0* has Succeeded.

Next steps:
    - apply the patch: git am 0001-python3-bcrypt-upgrade-4.3.0-5.0.0.patch
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
From 72fd4e236a9393514af797900c08729c23856289 Mon Sep 17 00:00:00 2001
From: Upgrade Helper <auh@yoctoproject.org>
Date: Wed, 1 Oct 2025 08:44:40 +0000
Subject: [PATCH] python3-bcrypt: upgrade 4.3.0 -> 5.0.0

---
 .../python/python3-bcrypt-crates.inc          | 112 ++++++++----------
 ...crypt_4.3.0.bb => python3-bcrypt_5.0.0.bb} |   2 +-
 2 files changed, 49 insertions(+), 65 deletions(-)
 rename meta/recipes-devtools/python/{python3-bcrypt_4.3.0.bb => python3-bcrypt_5.0.0.bb} (86%)

diff --git a/meta/recipes-devtools/python/python3-bcrypt-crates.inc b/meta/recipes-devtools/python/python3-bcrypt-crates.inc
index e0a2926519..bf6ee26cbf 100644
--- a/meta/recipes-devtools/python/python3-bcrypt-crates.inc
+++ b/meta/recipes-devtools/python/python3-bcrypt-crates.inc
@@ -2,105 +2,89 @@
 
 # from src/_bcrypt/Cargo.lock
 SRC_URI += " \
-    crate://crates.io/autocfg/1.4.0 \
+    crate://crates.io/autocfg/1.5.0 \
     crate://crates.io/base64/0.22.1 \
-    crate://crates.io/bcrypt/0.17.0 \
+    crate://crates.io/bcrypt/0.17.1 \
     crate://crates.io/bcrypt-pbkdf/0.10.0 \
-    crate://crates.io/bitflags/2.8.0 \
     crate://crates.io/block-buffer/0.10.4 \
     crate://crates.io/blowfish/0.9.1 \
     crate://crates.io/byteorder/1.5.0 \
-    crate://crates.io/cfg-if/1.0.0 \
+    crate://crates.io/cfg-if/1.0.3 \
     crate://crates.io/cipher/0.4.4 \
     crate://crates.io/cpufeatures/0.2.17 \
     crate://crates.io/crypto-common/0.1.6 \
     crate://crates.io/digest/0.10.7 \
     crate://crates.io/generic-array/0.14.7 \
-    crate://crates.io/getrandom/0.3.1 \
+    crate://crates.io/getrandom/0.3.3 \
     crate://crates.io/heck/0.5.0 \
-    crate://crates.io/indoc/2.0.5 \
+    crate://crates.io/indoc/2.0.6 \
     crate://crates.io/inout/0.1.4 \
-    crate://crates.io/libc/0.2.170 \
+    crate://crates.io/libc/0.2.176 \
     crate://crates.io/memoffset/0.9.1 \
-    crate://crates.io/once_cell/1.20.3 \
+    crate://crates.io/once_cell/1.21.3 \
     crate://crates.io/pbkdf2/0.12.2 \
-    crate://crates.io/portable-atomic/1.11.0 \
-    crate://crates.io/proc-macro2/1.0.93 \
-    crate://crates.io/pyo3/0.23.5 \
-    crate://crates.io/pyo3-build-config/0.23.5 \
-    crate://crates.io/pyo3-ffi/0.23.5 \
-    crate://crates.io/pyo3-macros/0.23.5 \
-    crate://crates.io/pyo3-macros-backend/0.23.5 \
-    crate://crates.io/quote/1.0.38 \
-    crate://crates.io/sha2/0.10.8 \
+    crate://crates.io/portable-atomic/1.11.1 \
+    crate://crates.io/proc-macro2/1.0.101 \
+    crate://crates.io/pyo3/0.26.0 \
+    crate://crates.io/pyo3-build-config/0.26.0 \
+    crate://crates.io/pyo3-ffi/0.26.0 \
+    crate://crates.io/pyo3-macros/0.26.0 \
+    crate://crates.io/pyo3-macros-backend/0.26.0 \
+    crate://crates.io/quote/1.0.40 \
+    crate://crates.io/r-efi/5.3.0 \
+    crate://crates.io/sha2/0.10.9 \
     crate://crates.io/subtle/2.6.1 \
-    crate://crates.io/syn/2.0.98 \
-    crate://crates.io/target-lexicon/0.12.16 \
+    crate://crates.io/syn/2.0.106 \
+    crate://crates.io/target-lexicon/0.13.3 \
     crate://crates.io/typenum/1.18.0 \
-    crate://crates.io/unicode-ident/1.0.17 \
-    crate://crates.io/unindent/0.2.3 \
+    crate://crates.io/unicode-ident/1.0.19 \
+    crate://crates.io/unindent/0.2.4 \
     crate://crates.io/version_check/0.9.5 \
-    crate://crates.io/wasi/0.13.3+wasi-0.2.2 \
-    crate://crates.io/windows-targets/0.52.6 \
-    crate://crates.io/windows_aarch64_gnullvm/0.52.6 \
-    crate://crates.io/windows_aarch64_msvc/0.52.6 \
-    crate://crates.io/windows_i686_gnu/0.52.6 \
-    crate://crates.io/windows_i686_gnullvm/0.52.6 \
-    crate://crates.io/windows_i686_msvc/0.52.6 \
-    crate://crates.io/windows_x86_64_gnu/0.52.6 \
-    crate://crates.io/windows_x86_64_gnullvm/0.52.6 \
-    crate://crates.io/windows_x86_64_msvc/0.52.6 \
-    crate://crates.io/wit-bindgen-rt/0.33.0 \
+    crate://crates.io/wasi/0.14.7+wasi-0.2.4 \
+    crate://crates.io/wasip2/1.0.1+wasi-0.2.4 \
+    crate://crates.io/wit-bindgen/0.46.0 \
     crate://crates.io/zeroize/1.8.1 \
 "
 
-SRC_URI[autocfg-1.4.0.sha256sum] = "ace50bade8e6234aa140d9a2f552bbee1db4d353f69b8217bc503490fc1a9f26"
+SRC_URI[autocfg-1.5.0.sha256sum] = "c08606f8c3cbf4ce6ec8e28fb0014a2c086708fe954eaa885384a6165172e7e8"
 SRC_URI[base64-0.22.1.sha256sum] = "72b3254f16251a8381aa12e40e3c4d2f0199f8c6508fbecb9d91f575e0fbb8c6"
-SRC_URI[bcrypt-0.17.0.sha256sum] = "92758ad6077e4c76a6cadbce5005f666df70d4f13b19976b1a8062eef880040f"
+SRC_URI[bcrypt-0.17.1.sha256sum] = "abaf6da45c74385272ddf00e1ac074c7d8a6c1a1dda376902bd6a427522a8b2c"
 SRC_URI[bcrypt-pbkdf-0.10.0.sha256sum] = "6aeac2e1fe888769f34f05ac343bbef98b14d1ffb292ab69d4608b3abc86f2a2"
-SRC_URI[bitflags-2.8.0.sha256sum] = "8f68f53c83ab957f72c32642f3868eec03eb974d1fb82e453128456482613d36"
 SRC_URI[block-buffer-0.10.4.sha256sum] = "3078c7629b62d3f0439517fa394996acacc5cbc91c5a20d8c658e77abd503a71"
 SRC_URI[blowfish-0.9.1.sha256sum] = "e412e2cd0f2b2d93e02543ceae7917b3c70331573df19ee046bcbc35e45e87d7"
 SRC_URI[byteorder-1.5.0.sha256sum] = "1fd0f2584146f6f2ef48085050886acf353beff7305ebd1ae69500e27c67f64b"
-SRC_URI[cfg-if-1.0.0.sha256sum] = "baf1de4339761588bc0619e3cbc0120ee582ebb74b53b4efbf79117bd2da40fd"
+SRC_URI[cfg-if-1.0.3.sha256sum] = "2fd1289c04a9ea8cb22300a459a72a385d7c73d3259e2ed7dcb2af674838cfa9"
 SRC_URI[cipher-0.4.4.sha256sum] = "773f3b9af64447d2ce9850330c473515014aa235e6a783b02db81ff39e4a3dad"
 SRC_URI[cpufeatures-0.2.17.sha256sum] = "59ed5838eebb26a2bb2e58f6d5b5316989ae9d08bab10e0e6d103e656d1b0280"
 SRC_URI[crypto-common-0.1.6.sha256sum] = "1bfb12502f3fc46cca1bb51ac28df9d618d813cdc3d2f25b9fe775a34af26bb3"
 SRC_URI[digest-0.10.7.sha256sum] = "9ed9a281f7bc9b7576e61468ba615a66a5c8cfdff42420a70aa82701a3b1e292"
 SRC_URI[generic-array-0.14.7.sha256sum] = "85649ca51fd72272d7821adaf274ad91c288277713d9c18820d8499a7ff69e9a"
-SRC_URI[getrandom-0.3.1.sha256sum] = "43a49c392881ce6d5c3b8cb70f98717b7c07aabbdff06687b9030dbfbe2725f8"
+SRC_URI[getrandom-0.3.3.sha256sum] = "26145e563e54f2cadc477553f1ec5ee650b00862f0a58bcd12cbdc5f0ea2d2f4"
 SRC_URI[heck-0.5.0.sha256sum] = "2304e00983f87ffb38b55b444b5e3b60a884b5d30c0fca7d82fe33449bbe55ea"
-SRC_URI[indoc-2.0.5.sha256sum] = "b248f5224d1d606005e02c97f5aa4e88eeb230488bcc03bc9ca4d7991399f2b5"
+SRC_URI[indoc-2.0.6.sha256sum] = "f4c7245a08504955605670dbf141fceab975f15ca21570696aebe9d2e71576bd"
 SRC_URI[inout-0.1.4.sha256sum] = "879f10e63c20629ecabbb64a8010319738c66a5cd0c29b02d63d272b03751d01"
-SRC_URI[libc-0.2.170.sha256sum] = "875b3680cb2f8f71bdcf9a30f38d48282f5d3c95cbf9b3fa57269bb5d5c06828"
+SRC_URI[libc-0.2.176.sha256sum] = "58f929b4d672ea937a23a1ab494143d968337a5f47e56d0815df1e0890ddf174"
 SRC_URI[memoffset-0.9.1.sha256sum] = "488016bfae457b036d996092f6cb448677611ce4449e970ceaf42695203f218a"
-SRC_URI[once_cell-1.20.3.sha256sum] = "945462a4b81e43c4e3ba96bd7b49d834c6f61198356aa858733bc4acf3cbe62e"
+SRC_URI[once_cell-1.21.3.sha256sum] = "42f5e15c9953c5e4ccceeb2e7382a716482c34515315f7b03532b8b4e8393d2d"
 SRC_URI[pbkdf2-0.12.2.sha256sum] = "f8ed6a7761f76e3b9f92dfb0a60a6a6477c61024b775147ff0973a02653abaf2"
-SRC_URI[portable-atomic-1.11.0.sha256sum] = "350e9b48cbc6b0e028b0473b114454c6316e57336ee184ceab6e53f72c178b3e"
-SRC_URI[proc-macro2-1.0.93.sha256sum] = "60946a68e5f9d28b0dc1c21bb8a97ee7d018a8b322fa57838ba31cc878e22d99"
-SRC_URI[pyo3-0.23.5.sha256sum] = "7778bffd85cf38175ac1f545509665d0b9b92a198ca7941f131f85f7a4f9a872"
-SRC_URI[pyo3-build-config-0.23.5.sha256sum] = "94f6cbe86ef3bf18998d9df6e0f3fc1050a8c5efa409bf712e661a4366e010fb"
-SRC_URI[pyo3-ffi-0.23.5.sha256sum] = "e9f1b4c431c0bb1c8fb0a338709859eed0d030ff6daa34368d3b152a63dfdd8d"
-SRC_URI[pyo3-macros-0.23.5.sha256sum] = "fbc2201328f63c4710f68abdf653c89d8dbc2858b88c5d88b0ff38a75288a9da"
-SRC_URI[pyo3-macros-backend-0.23.5.sha256sum] = "fca6726ad0f3da9c9de093d6f116a93c1a38e417ed73bf138472cf4064f72028"
-SRC_URI[quote-1.0.38.sha256sum] = "0e4dccaaaf89514f546c693ddc140f729f958c247918a13380cccc6078391acc"
-SRC_URI[sha2-0.10.8.sha256sum] = "793db75ad2bcafc3ffa7c68b215fee268f537982cd901d132f89c6343f3a3dc8"
+SRC_URI[portable-atomic-1.11.1.sha256sum] = "f84267b20a16ea918e43c6a88433c2d54fa145c92a811b5b047ccbe153674483"
+SRC_URI[proc-macro2-1.0.101.sha256sum] = "89ae43fd86e4158d6db51ad8e2b80f313af9cc74f5c0e03ccb87de09998732de"
+SRC_URI[pyo3-0.26.0.sha256sum] = "7ba0117f4212101ee6544044dae45abe1083d30ce7b29c4b5cbdfa2354e07383"
+SRC_URI[pyo3-build-config-0.26.0.sha256sum] = "4fc6ddaf24947d12a9aa31ac65431fb1b851b8f4365426e182901eabfb87df5f"
+SRC_URI[pyo3-ffi-0.26.0.sha256sum] = "025474d3928738efb38ac36d4744a74a400c901c7596199e20e45d98eb194105"
+SRC_URI[pyo3-macros-0.26.0.sha256sum] = "2e64eb489f22fe1c95911b77c44cc41e7c19f3082fc81cce90f657cdc42ffded"
+SRC_URI[pyo3-macros-backend-0.26.0.sha256sum] = "100246c0ecf400b475341b8455a9213344569af29a3c841d29270e53102e0fcf"
+SRC_URI[quote-1.0.40.sha256sum] = "1885c039570dc00dcb4ff087a89e185fd56bae234ddc7f056a945bf36467248d"
+SRC_URI[r-efi-5.3.0.sha256sum] = "69cdb34c158ceb288df11e18b4bd39de994f6657d83847bdffdbd7f346754b0f"
+SRC_URI[sha2-0.10.9.sha256sum] = "a7507d819769d01a365ab707794a4084392c824f54a7a6a7862f8c3d0892b283"
 SRC_URI[subtle-2.6.1.sha256sum] = "13c2bddecc57b384dee18652358fb23172facb8a2c51ccc10d74c157bdea3292"
-SRC_URI[syn-2.0.98.sha256sum] = "36147f1a48ae0ec2b5b3bc5b537d267457555a10dc06f3dbc8cb11ba3006d3b1"
-SRC_URI[target-lexicon-0.12.16.sha256sum] = "61c41af27dd6d1e27b1b16b489db798443478cef1f06a660c96db617ba5de3b1"
+SRC_URI[syn-2.0.106.sha256sum] = "ede7c438028d4436d71104916910f5bb611972c5cfd7f89b8300a8186e6fada6"
+SRC_URI[target-lexicon-0.13.3.sha256sum] = "df7f62577c25e07834649fc3b39fafdc597c0a3527dc1c60129201ccfcbaa50c"
 SRC_URI[typenum-1.18.0.sha256sum] = "1dccffe3ce07af9386bfd29e80c0ab1a8205a2fc34e4bcd40364df902cfa8f3f"
-SRC_URI[unicode-ident-1.0.17.sha256sum] = "00e2473a93778eb0bad35909dff6a10d28e63f792f16ed15e404fca9d5eeedbe"
-SRC_URI[unindent-0.2.3.sha256sum] = "c7de7d73e1754487cb58364ee906a499937a0dfabd86bcb980fa99ec8c8fa2ce"
+SRC_URI[unicode-ident-1.0.19.sha256sum] = "f63a545481291138910575129486daeaf8ac54aee4387fe7906919f7830c7d9d"
+SRC_URI[unindent-0.2.4.sha256sum] = "7264e107f553ccae879d21fbea1d6724ac785e8c3bfc762137959b5802826ef3"
 SRC_URI[version_check-0.9.5.sha256sum] = "0b928f33d975fc6ad9f86c8f283853ad26bdd5b10b7f1542aa2fa15e2289105a"
-SRC_URI[wasi-0.13.3+wasi-0.2.2.sha256sum] = "26816d2e1a4a36a2940b96c5296ce403917633dff8f3440e9b236ed6f6bacad2"
-SRC_URI[windows-targets-0.52.6.sha256sum] = "9b724f72796e036ab90c1021d4780d4d3d648aca59e491e6b98e725b84e99973"
-SRC_URI[windows_aarch64_gnullvm-0.52.6.sha256sum] = "32a4622180e7a0ec044bb555404c800bc9fd9ec262ec147edd5989ccd0c02cd3"
-SRC_URI[windows_aarch64_msvc-0.52.6.sha256sum] = "09ec2a7bb152e2252b53fa7803150007879548bc709c039df7627cabbd05d469"
-SRC_URI[windows_i686_gnu-0.52.6.sha256sum] = "8e9b5ad5ab802e97eb8e295ac6720e509ee4c243f69d781394014ebfe8bbfa0b"
-SRC_URI[windows_i686_gnullvm-0.52.6.sha256sum] = "0eee52d38c090b3caa76c563b86c3a4bd71ef1a819287c19d586d7334ae8ed66"
-SRC_URI[windows_i686_msvc-0.52.6.sha256sum] = "240948bc05c5e7c6dabba28bf89d89ffce3e303022809e73deaefe4f6ec56c66"
-SRC_URI[windows_x86_64_gnu-0.52.6.sha256sum] = "147a5c80aabfbf0c7d901cb5895d1de30ef2907eb21fbbab29ca94c5b08b1a78"
-SRC_URI[windows_x86_64_gnullvm-0.52.6.sha256sum] = "24d5b23dc417412679681396f2b49f3de8c1473deb516bd34410872eff51ed0d"
-SRC_URI[windows_x86_64_msvc-0.52.6.sha256sum] = "589f6da84c646204747d1270a2a5661ea66ed1cced2631d546fdfb155959f9ec"
-SRC_URI[wit-bindgen-rt-0.33.0.sha256sum] = "3268f3d866458b787f390cf61f4bbb563b922d091359f9608842999eaee3943c"
+SRC_URI[wasi-0.14.7+wasi-0.2.4.sha256sum] = "883478de20367e224c0090af9cf5f9fa85bed63a95c1abf3afc5c083ebc06e8c"
+SRC_URI[wasip2-1.0.1+wasi-0.2.4.sha256sum] = "0562428422c63773dad2c345a1882263bbf4d65cf3f42e90921f787ef5ad58e7"
+SRC_URI[wit-bindgen-0.46.0.sha256sum] = "f17a85883d4e6d00e8a97c586de764dabcc06133f7f1d55dce5cdc070ad7fe59"
 SRC_URI[zeroize-1.8.1.sha256sum] = "ced3678a2879b30306d323f4542626697a464a97c0a07c9aebf7ebca65cd4dde"
diff --git a/meta/recipes-devtools/python/python3-bcrypt_4.3.0.bb b/meta/recipes-devtools/python/python3-bcrypt_5.0.0.bb
similarity index 86%
rename from meta/recipes-devtools/python/python3-bcrypt_4.3.0.bb
rename to meta/recipes-devtools/python/python3-bcrypt_5.0.0.bb
index 931aae4310..6397ecd818 100644
--- a/meta/recipes-devtools/python/python3-bcrypt_4.3.0.bb
+++ b/meta/recipes-devtools/python/python3-bcrypt_5.0.0.bb
@@ -6,7 +6,7 @@ HOMEPAGE = "https://pypi.org/project/bcrypt/"
 DEPENDS += "python3-cffi-native"
 LDFLAGS += "${@bb.utils.contains('DISTRO_FEATURES', 'ptest', '-fuse-ld=bfd', '', d)}"
 
-SRC_URI[sha256sum] = "3a3fd2204178b6d2adcf09cb4f6426ffef54762577a7c9b54c159008cb288c18"
+SRC_URI[sha256sum] = "f748f7c2d6fd375cc93d3fba7ef4a9e3a092421b8dbf34d8d4dc06be9492dfdd"
 
 inherit pypi python_setuptools3_rust cargo-update-recipe-crates ptest-python-pytest
 
-- 
2.47.1


--===============5275995096746644768==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: attachment; filename="buildhistory-diff-full.txt"

packages/x86-64-v3-poky-linux/python3-bcrypt: PV changed from "4.3.0" to "5.0.0"
packages/x86-64-v3-poky-linux/python3-bcrypt: SRC_URI changed from "https://files.pythonhosted.org/packages/source/b/bcrypt/bcrypt-4.3.0.tar.gz;downloadfilename=bcrypt-4.3.0.tar.gz crate://crates.io/autocfg/1.4.0 crate://crates.io/base64/0.22.1 crate://crates.io/bcrypt/0.17.0 crate://crates.io/bcrypt-pbkdf/0.10.0 crate://crates.io/bitflags/2.8.0 crate://crates.io/block-buffer/0.10.4 crate://crates.io/blowfish/0.9.1 crate://crates.io/byteorder/1.5.0 crate://crates.io/cfg-if/1.0.0 crate://crates.io/cipher/0.4.4 crate://crates.io/cpufeatures/0.2.17 crate://crates.io/crypto-common/0.1.6 crate://crates.io/digest/0.10.7 crate://crates.io/generic-array/0.14.7 crate://crates.io/getrandom/0.3.1 crate://crates.io/heck/0.5.0 crate://crates.io/indoc/2.0.5 crate://crates.io/inout/0.1.4 crate://crates.io/libc/0.2.170 crate://crates.io/memoffset/0.9.1 crate://crates.io/once_cell/1.20.3 crate://crates.io/pbkdf2/0.12.2 crate://crates.io/portable-atomic/1.11.0 crate://crates.io/proc-macro2/1.0.93 crat
 e://crates.io/pyo3/0.23.5 crate://crates.io/pyo3-build-config/0.23.5 crate://crates.io/pyo3-ffi/0.23.5 crate://crates.io/pyo3-macros/0.23.5 crate://crates.io/pyo3-macros-backend/0.23.5 crate://crates.io/quote/1.0.38 crate://crates.io/sha2/0.10.8 crate://crates.io/subtle/2.6.1 crate://crates.io/syn/2.0.98 crate://crates.io/target-lexicon/0.12.16 crate://crates.io/typenum/1.18.0 crate://crates.io/unicode-ident/1.0.17 crate://crates.io/unindent/0.2.3 crate://crates.io/version_check/0.9.5 crate://crates.io/wasi/0.13.3+wasi-0.2.2 crate://crates.io/windows-targets/0.52.6 crate://crates.io/windows_aarch64_gnullvm/0.52.6 crate://crates.io/windows_aarch64_msvc/0.52.6 crate://crates.io/windows_i686_gnu/0.52.6 crate://crates.io/windows_i686_gnullvm/0.52.6 crate://crates.io/windows_i686_msvc/0.52.6 crate://crates.io/windows_x86_64_gnu/0.52.6 crate://crates.io/windows_x86_64_gnullvm/0.52.6 crate://crates.io/windows_x86_64_msvc/0.52.6 crate://crates.io/wit-bindgen-rt/0.33.0 crate://crates.io/zero
 ize/1.8.1" to "https://files.pythonhosted.org/packages/source/b/bcrypt/bcrypt-5.0.0.tar.gz;downloadfilename=bcrypt-5.0.0.tar.gz crate://crates.io/autocfg/1.5.0 crate://crates.io/base64/0.22.1 crate://crates.io/bcrypt/0.17.1 crate://crates.io/bcrypt-pbkdf/0.10.0 crate://crates.io/block-buffer/0.10.4 crate://crates.io/blowfish/0.9.1 crate://crates.io/byteorder/1.5.0 crate://crates.io/cfg-if/1.0.3 crate://crates.io/cipher/0.4.4 crate://crates.io/cpufeatures/0.2.17 crate://crates.io/crypto-common/0.1.6 crate://crates.io/digest/0.10.7 crate://crates.io/generic-array/0.14.7 crate://crates.io/getrandom/0.3.3 crate://crates.io/heck/0.5.0 crate://crates.io/indoc/2.0.6 crate://crates.io/inout/0.1.4 crate://crates.io/libc/0.2.176 crate://crates.io/memoffset/0.9.1 crate://crates.io/once_cell/1.21.3 crate://crates.io/pbkdf2/0.12.2 crate://crates.io/portable-atomic/1.11.1 crate://crates.io/proc-macro2/1.0.101 crate://crates.io/pyo3/0.26.0 crate://crates.io/pyo3-build-config/0.26.0 crate://crates.
 io/pyo3-ffi/0.26.0 crate://crates.io/pyo3-macros/0.26.0 crate://crates.io/pyo3-macros-backend/0.26.0 crate://crates.io/quote/1.0.40 crate://crates.io/r-efi/5.3.0 crate://crates.io/sha2/0.10.9 crate://crates.io/subtle/2.6.1 crate://crates.io/syn/2.0.106 crate://crates.io/target-lexicon/0.13.3 crate://crates.io/typenum/1.18.0 crate://crates.io/unicode-ident/1.0.19 crate://crates.io/unindent/0.2.4 crate://crates.io/version_check/0.9.5 crate://crates.io/wasi/0.14.7+wasi-0.2.4 crate://crates.io/wasip2/1.0.1+wasi-0.2.4 crate://crates.io/wit-bindgen/0.46.0 crate://crates.io/zeroize/1.8.1"
packages/x86-64-v3-poky-linux/python3-bcrypt: PKGV changed from 4.3.0 [default] to 5.0.0 [default]
packages/x86-64-v3-poky-linux/python3-bcrypt/python3-bcrypt-dbg: PKGSIZE changed from 151944 to 153560 (+1%)
packages/x86-64-v3-poky-linux/python3-bcrypt/python3-bcrypt-dbg: PV changed from "4.3.0" to "5.0.0"
packages/x86-64-v3-poky-linux/python3-bcrypt/python3-bcrypt-dbg: PKGV changed from 4.3.0 [default] to 5.0.0 [default]
packages/x86-64-v3-poky-linux/python3-bcrypt/python3-bcrypt-dev: PV changed from "4.3.0" to "5.0.0"
packages/x86-64-v3-poky-linux/python3-bcrypt/python3-bcrypt-dev: PKGV changed from 4.3.0 [default] to 5.0.0 [default]
packages/x86-64-v3-poky-linux/python3-bcrypt/python3-bcrypt-doc: PV changed from "4.3.0" to "5.0.0"
packages/x86-64-v3-poky-linux/python3-bcrypt/python3-bcrypt-doc: PKGV changed from 4.3.0 [default] to 5.0.0 [default]
packages/x86-64-v3-poky-linux/python3-bcrypt/python3-bcrypt-locale: PV changed from "4.3.0" to "5.0.0"
packages/x86-64-v3-poky-linux/python3-bcrypt/python3-bcrypt-locale: PKGV changed from 4.3.0 [default] to 5.0.0 [default]
packages/x86-64-v3-poky-linux/python3-bcrypt/python3-bcrypt-ptest: PKGSIZE changed from 17470 to 16888 (-3%)
packages/x86-64-v3-poky-linux/python3-bcrypt/python3-bcrypt-ptest: PV changed from "4.3.0" to "5.0.0"
packages/x86-64-v3-poky-linux/python3-bcrypt/python3-bcrypt-ptest: PKGV changed from 4.3.0 [default] to 5.0.0 [default]
packages/x86-64-v3-poky-linux/python3-bcrypt/python3-bcrypt-src: PV changed from "4.3.0" to "5.0.0"
packages/x86-64-v3-poky-linux/python3-bcrypt/python3-bcrypt-src: PKGV changed from 4.3.0 [default] to 5.0.0 [default]
packages/x86-64-v3-poky-linux/python3-bcrypt/python3-bcrypt-staticdev: PV changed from "4.3.0" to "5.0.0"
packages/x86-64-v3-poky-linux/python3-bcrypt/python3-bcrypt-staticdev: PKGV changed from 4.3.0 [default] to 5.0.0 [default]
packages/x86-64-v3-poky-linux/python3-bcrypt/python3-bcrypt: PKGSIZE changed from 527533 to 536241 (+2%)
packages/x86-64-v3-poky-linux/python3-bcrypt/python3-bcrypt: PV changed from "4.3.0" to "5.0.0"
packages/x86-64-v3-poky-linux/python3-bcrypt/python3-bcrypt: PKGV changed from 4.3.0 [default] to 5.0.0 [default]
Changes to packages/x86-64-v3-poky-linux/python3-bcrypt (sysroot):
  /usr/lib/python3.13/site-packages/bcrypt-4.3.0.dist-info moved to /usr/lib/python3.13/site-packages/bcrypt-5.0.0.dist-info

--===============5275995096746644768==
Content-Type: application/octet-stream
MIME-Version: 1.0
Content-Transfer-Encoding: base64
Content-Disposition: attachment;
 filename="0001-python3-bcrypt-upgrade-4.3.0-5.0.0.patch"

RnJvbSA3MmZkNGUyMzZhOTM5MzUxNGFmNzk3OTAwYzA4NzI5YzIzODU2Mjg5IE1vbiBTZXAgMTcg
MDA6MDA6MDAgMjAwMQpGcm9tOiBVcGdyYWRlIEhlbHBlciA8YXVoQHlvY3RvcHJvamVjdC5vcmc+
CkRhdGU6IFdlZCwgMSBPY3QgMjAyNSAwODo0NDo0MCArMDAwMApTdWJqZWN0OiBbUEFUQ0hdIHB5
dGhvbjMtYmNyeXB0OiB1cGdyYWRlIDQuMy4wIC0+IDUuMC4wCgotLS0KIC4uLi9weXRob24vcHl0
aG9uMy1iY3J5cHQtY3JhdGVzLmluYyAgICAgICAgICB8IDExMiArKysrKysrKy0tLS0tLS0tLS0K
IC4uLmNyeXB0XzQuMy4wLmJiID0+IHB5dGhvbjMtYmNyeXB0XzUuMC4wLmJifSB8ICAgMiArLQog
MiBmaWxlcyBjaGFuZ2VkLCA0OSBpbnNlcnRpb25zKCspLCA2NSBkZWxldGlvbnMoLSkKIHJlbmFt
ZSBtZXRhL3JlY2lwZXMtZGV2dG9vbHMvcHl0aG9uL3tweXRob24zLWJjcnlwdF80LjMuMC5iYiA9
PiBweXRob24zLWJjcnlwdF81LjAuMC5iYn0gKDg2JSkKCmRpZmYgLS1naXQgYS9tZXRhL3JlY2lw
ZXMtZGV2dG9vbHMvcHl0aG9uL3B5dGhvbjMtYmNyeXB0LWNyYXRlcy5pbmMgYi9tZXRhL3JlY2lw
ZXMtZGV2dG9vbHMvcHl0aG9uL3B5dGhvbjMtYmNyeXB0LWNyYXRlcy5pbmMKaW5kZXggZTBhMjky
NjUxOS4uYmY2ZWUyNmNiZiAxMDA2NDQKLS0tIGEvbWV0YS9yZWNpcGVzLWRldnRvb2xzL3B5dGhv
bi9weXRob24zLWJjcnlwdC1jcmF0ZXMuaW5jCisrKyBiL21ldGEvcmVjaXBlcy1kZXZ0b29scy9w
eXRob24vcHl0aG9uMy1iY3J5cHQtY3JhdGVzLmluYwpAQCAtMiwxMDUgKzIsODkgQEAKIAogIyBm
cm9tIHNyYy9fYmNyeXB0L0NhcmdvLmxvY2sKIFNSQ19VUkkgKz0gIiBcCi0gICAgY3JhdGU6Ly9j
cmF0ZXMuaW8vYXV0b2NmZy8xLjQuMCBcCisgICAgY3JhdGU6Ly9jcmF0ZXMuaW8vYXV0b2NmZy8x
LjUuMCBcCiAgICAgY3JhdGU6Ly9jcmF0ZXMuaW8vYmFzZTY0LzAuMjIuMSBcCi0gICAgY3JhdGU6
Ly9jcmF0ZXMuaW8vYmNyeXB0LzAuMTcuMCBcCisgICAgY3JhdGU6Ly9jcmF0ZXMuaW8vYmNyeXB0
LzAuMTcuMSBcCiAgICAgY3JhdGU6Ly9jcmF0ZXMuaW8vYmNyeXB0LXBia2RmLzAuMTAuMCBcCi0g
ICAgY3JhdGU6Ly9jcmF0ZXMuaW8vYml0ZmxhZ3MvMi44LjAgXAogICAgIGNyYXRlOi8vY3JhdGVz
LmlvL2Jsb2NrLWJ1ZmZlci8wLjEwLjQgXAogICAgIGNyYXRlOi8vY3JhdGVzLmlvL2Jsb3dmaXNo
LzAuOS4xIFwKICAgICBjcmF0ZTovL2NyYXRlcy5pby9ieXRlb3JkZXIvMS41LjAgXAotICAgIGNy
YXRlOi8vY3JhdGVzLmlvL2NmZy1pZi8xLjAuMCBcCisgICAgY3JhdGU6Ly9jcmF0ZXMuaW8vY2Zn
LWlmLzEuMC4zIFwKICAgICBjcmF0ZTovL2NyYXRlcy5pby9jaXBoZXIvMC40LjQgXAogICAgIGNy
YXRlOi8vY3JhdGVzLmlvL2NwdWZlYXR1cmVzLzAuMi4xNyBcCiAgICAgY3JhdGU6Ly9jcmF0ZXMu
aW8vY3J5cHRvLWNvbW1vbi8wLjEuNiBcCiAgICAgY3JhdGU6Ly9jcmF0ZXMuaW8vZGlnZXN0LzAu
MTAuNyBcCiAgICAgY3JhdGU6Ly9jcmF0ZXMuaW8vZ2VuZXJpYy1hcnJheS8wLjE0LjcgXAotICAg
IGNyYXRlOi8vY3JhdGVzLmlvL2dldHJhbmRvbS8wLjMuMSBcCisgICAgY3JhdGU6Ly9jcmF0ZXMu
aW8vZ2V0cmFuZG9tLzAuMy4zIFwKICAgICBjcmF0ZTovL2NyYXRlcy5pby9oZWNrLzAuNS4wIFwK
LSAgICBjcmF0ZTovL2NyYXRlcy5pby9pbmRvYy8yLjAuNSBcCisgICAgY3JhdGU6Ly9jcmF0ZXMu
aW8vaW5kb2MvMi4wLjYgXAogICAgIGNyYXRlOi8vY3JhdGVzLmlvL2lub3V0LzAuMS40IFwKLSAg
ICBjcmF0ZTovL2NyYXRlcy5pby9saWJjLzAuMi4xNzAgXAorICAgIGNyYXRlOi8vY3JhdGVzLmlv
L2xpYmMvMC4yLjE3NiBcCiAgICAgY3JhdGU6Ly9jcmF0ZXMuaW8vbWVtb2Zmc2V0LzAuOS4xIFwK
LSAgICBjcmF0ZTovL2NyYXRlcy5pby9vbmNlX2NlbGwvMS4yMC4zIFwKKyAgICBjcmF0ZTovL2Ny
YXRlcy5pby9vbmNlX2NlbGwvMS4yMS4zIFwKICAgICBjcmF0ZTovL2NyYXRlcy5pby9wYmtkZjIv
MC4xMi4yIFwKLSAgICBjcmF0ZTovL2NyYXRlcy5pby9wb3J0YWJsZS1hdG9taWMvMS4xMS4wIFwK
LSAgICBjcmF0ZTovL2NyYXRlcy5pby9wcm9jLW1hY3JvMi8xLjAuOTMgXAotICAgIGNyYXRlOi8v
Y3JhdGVzLmlvL3B5bzMvMC4yMy41IFwKLSAgICBjcmF0ZTovL2NyYXRlcy5pby9weW8zLWJ1aWxk
LWNvbmZpZy8wLjIzLjUgXAotICAgIGNyYXRlOi8vY3JhdGVzLmlvL3B5bzMtZmZpLzAuMjMuNSBc
Ci0gICAgY3JhdGU6Ly9jcmF0ZXMuaW8vcHlvMy1tYWNyb3MvMC4yMy41IFwKLSAgICBjcmF0ZTov
L2NyYXRlcy5pby9weW8zLW1hY3Jvcy1iYWNrZW5kLzAuMjMuNSBcCi0gICAgY3JhdGU6Ly9jcmF0
ZXMuaW8vcXVvdGUvMS4wLjM4IFwKLSAgICBjcmF0ZTovL2NyYXRlcy5pby9zaGEyLzAuMTAuOCBc
CisgICAgY3JhdGU6Ly9jcmF0ZXMuaW8vcG9ydGFibGUtYXRvbWljLzEuMTEuMSBcCisgICAgY3Jh
dGU6Ly9jcmF0ZXMuaW8vcHJvYy1tYWNybzIvMS4wLjEwMSBcCisgICAgY3JhdGU6Ly9jcmF0ZXMu
aW8vcHlvMy8wLjI2LjAgXAorICAgIGNyYXRlOi8vY3JhdGVzLmlvL3B5bzMtYnVpbGQtY29uZmln
LzAuMjYuMCBcCisgICAgY3JhdGU6Ly9jcmF0ZXMuaW8vcHlvMy1mZmkvMC4yNi4wIFwKKyAgICBj
cmF0ZTovL2NyYXRlcy5pby9weW8zLW1hY3Jvcy8wLjI2LjAgXAorICAgIGNyYXRlOi8vY3JhdGVz
LmlvL3B5bzMtbWFjcm9zLWJhY2tlbmQvMC4yNi4wIFwKKyAgICBjcmF0ZTovL2NyYXRlcy5pby9x
dW90ZS8xLjAuNDAgXAorICAgIGNyYXRlOi8vY3JhdGVzLmlvL3ItZWZpLzUuMy4wIFwKKyAgICBj
cmF0ZTovL2NyYXRlcy5pby9zaGEyLzAuMTAuOSBcCiAgICAgY3JhdGU6Ly9jcmF0ZXMuaW8vc3Vi
dGxlLzIuNi4xIFwKLSAgICBjcmF0ZTovL2NyYXRlcy5pby9zeW4vMi4wLjk4IFwKLSAgICBjcmF0
ZTovL2NyYXRlcy5pby90YXJnZXQtbGV4aWNvbi8wLjEyLjE2IFwKKyAgICBjcmF0ZTovL2NyYXRl
cy5pby9zeW4vMi4wLjEwNiBcCisgICAgY3JhdGU6Ly9jcmF0ZXMuaW8vdGFyZ2V0LWxleGljb24v
MC4xMy4zIFwKICAgICBjcmF0ZTovL2NyYXRlcy5pby90eXBlbnVtLzEuMTguMCBcCi0gICAgY3Jh
dGU6Ly9jcmF0ZXMuaW8vdW5pY29kZS1pZGVudC8xLjAuMTcgXAotICAgIGNyYXRlOi8vY3JhdGVz
LmlvL3VuaW5kZW50LzAuMi4zIFwKKyAgICBjcmF0ZTovL2NyYXRlcy5pby91bmljb2RlLWlkZW50
LzEuMC4xOSBcCisgICAgY3JhdGU6Ly9jcmF0ZXMuaW8vdW5pbmRlbnQvMC4yLjQgXAogICAgIGNy
YXRlOi8vY3JhdGVzLmlvL3ZlcnNpb25fY2hlY2svMC45LjUgXAotICAgIGNyYXRlOi8vY3JhdGVz
LmlvL3dhc2kvMC4xMy4zK3dhc2ktMC4yLjIgXAotICAgIGNyYXRlOi8vY3JhdGVzLmlvL3dpbmRv
d3MtdGFyZ2V0cy8wLjUyLjYgXAotICAgIGNyYXRlOi8vY3JhdGVzLmlvL3dpbmRvd3NfYWFyY2g2
NF9nbnVsbHZtLzAuNTIuNiBcCi0gICAgY3JhdGU6Ly9jcmF0ZXMuaW8vd2luZG93c19hYXJjaDY0
X21zdmMvMC41Mi42IFwKLSAgICBjcmF0ZTovL2NyYXRlcy5pby93aW5kb3dzX2k2ODZfZ251LzAu
NTIuNiBcCi0gICAgY3JhdGU6Ly9jcmF0ZXMuaW8vd2luZG93c19pNjg2X2dudWxsdm0vMC41Mi42
IFwKLSAgICBjcmF0ZTovL2NyYXRlcy5pby93aW5kb3dzX2k2ODZfbXN2Yy8wLjUyLjYgXAotICAg
IGNyYXRlOi8vY3JhdGVzLmlvL3dpbmRvd3NfeDg2XzY0X2dudS8wLjUyLjYgXAotICAgIGNyYXRl
Oi8vY3JhdGVzLmlvL3dpbmRvd3NfeDg2XzY0X2dudWxsdm0vMC41Mi42IFwKLSAgICBjcmF0ZTov
L2NyYXRlcy5pby93aW5kb3dzX3g4Nl82NF9tc3ZjLzAuNTIuNiBcCi0gICAgY3JhdGU6Ly9jcmF0
ZXMuaW8vd2l0LWJpbmRnZW4tcnQvMC4zMy4wIFwKKyAgICBjcmF0ZTovL2NyYXRlcy5pby93YXNp
LzAuMTQuNyt3YXNpLTAuMi40IFwKKyAgICBjcmF0ZTovL2NyYXRlcy5pby93YXNpcDIvMS4wLjEr
d2FzaS0wLjIuNCBcCisgICAgY3JhdGU6Ly9jcmF0ZXMuaW8vd2l0LWJpbmRnZW4vMC40Ni4wIFwK
ICAgICBjcmF0ZTovL2NyYXRlcy5pby96ZXJvaXplLzEuOC4xIFwKICIKIAotU1JDX1VSSVthdXRv
Y2ZnLTEuNC4wLnNoYTI1NnN1bV0gPSAiYWNlNTBiYWRlOGU2MjM0YWExNDBkOWEyZjU1MmJiZWUx
ZGI0ZDM1M2Y2OWI4MjE3YmM1MDM0OTBmYzFhOWYyNiIKK1NSQ19VUklbYXV0b2NmZy0xLjUuMC5z
aGEyNTZzdW1dID0gImMwODYwNmY4YzNjYmY0Y2U2ZWM4ZTI4ZmIwMDE0YTJjMDg2NzA4ZmU5NTRl
YWE4ODUzODRhNjE2NTE3MmU3ZTgiCiBTUkNfVVJJW2Jhc2U2NC0wLjIyLjEuc2hhMjU2c3VtXSA9
ICI3MmIzMjU0ZjE2MjUxYTgzODFhYTEyZTQwZTNjNGQyZjAxOTlmOGM2NTA4ZmJlY2I5ZDkxZjU3
NWUwZmJiOGM2IgotU1JDX1VSSVtiY3J5cHQtMC4xNy4wLnNoYTI1NnN1bV0gPSAiOTI3NThhZDYw
NzdlNGM3NmE2Y2FkYmNlNTAwNWY2NjZkZjcwZDRmMTNiMTk5NzZiMWE4MDYyZWVmODgwMDQwZiIK
K1NSQ19VUklbYmNyeXB0LTAuMTcuMS5zaGEyNTZzdW1dID0gImFiYWY2ZGE0NWM3NDM4NTI3MmRk
ZjAwZTFhYzA3NGM3ZDhhNmMxYTFkZGEzNzY5MDJiZDZhNDI3NTIyYThiMmMiCiBTUkNfVVJJW2Jj
cnlwdC1wYmtkZi0wLjEwLjAuc2hhMjU2c3VtXSA9ICI2YWVhYzJlMWZlODg4NzY5ZjM0ZjA1YWMz
NDNiYmVmOThiMTRkMWZmYjI5MmFiNjlkNDYwOGIzYWJjODZmMmEyIgotU1JDX1VSSVtiaXRmbGFn
cy0yLjguMC5zaGEyNTZzdW1dID0gIjhmNjhmNTNjODNhYjk1N2Y3MmMzMjY0MmYzODY4ZWVjMDNl
Yjk3NGQxZmI4MmU0NTMxMjg0NTY0ODI2MTNkMzYiCiBTUkNfVVJJW2Jsb2NrLWJ1ZmZlci0wLjEw
LjQuc2hhMjU2c3VtXSA9ICIzMDc4Yzc2MjliNjJkM2YwNDM5NTE3ZmEzOTQ5OTZhY2FjYzVjYmM5
MWM1YTIwZDhjNjU4ZTc3YWJkNTAzYTcxIgogU1JDX1VSSVtibG93ZmlzaC0wLjkuMS5zaGEyNTZz
dW1dID0gImU0MTJlMmNkMGYyYjJkOTNlMDI1NDNjZWFlNzkxN2IzYzcwMzMxNTczZGYxOWVlMDQ2
YmNiYzM1ZTQ1ZTg3ZDciCiBTUkNfVVJJW2J5dGVvcmRlci0xLjUuMC5zaGEyNTZzdW1dID0gIjFm
ZDBmMjU4NDE0NmY2ZjJlZjQ4MDg1MDUwODg2YWNmMzUzYmVmZjczMDVlYmQxYWU2OTUwMGUyN2M2
N2Y2NGIiCi1TUkNfVVJJW2NmZy1pZi0xLjAuMC5zaGEyNTZzdW1dID0gImJhZjFkZTQzMzk3NjE1
ODhiYzA2MTllM2NiYzAxMjBlZTU4MmViYjc0YjUzYjRlZmJmNzkxMTdiZDJkYTQwZmQiCitTUkNf
VVJJW2NmZy1pZi0xLjAuMy5zaGEyNTZzdW1dID0gIjJmZDEyODljMDRhOWVhOGNiMjIzMDBhNDU5
YTcyYTM4NWQ3YzczZDMyNTllMmVkN2RjYjJhZjY3NDgzOGNmYTkiCiBTUkNfVVJJW2NpcGhlci0w
LjQuNC5zaGEyNTZzdW1dID0gIjc3M2YzYjlhZjY0NDQ3ZDJjZTk4NTAzMzBjNDczNTE1MDE0YWEy
MzVlNmE3ODNiMDJkYjgxZmYzOWU0YTNkYWQiCiBTUkNfVVJJW2NwdWZlYXR1cmVzLTAuMi4xNy5z
aGEyNTZzdW1dID0gIjU5ZWQ1ODM4ZWViYjI2YTJiYjJlNThmNmQ1YjUzMTY5ODlhZTlkMDhiYWIx
MGUwZTZkMTAzZTY1NmQxYjAyODAiCiBTUkNfVVJJW2NyeXB0by1jb21tb24tMC4xLjYuc2hhMjU2
c3VtXSA9ICIxYmZiMTI1MDJmM2ZjNDZjY2ExYmI1MWFjMjhkZjlkNjE4ZDgxM2NkYzNkMmYyNWI5
ZmU3NzVhMzRhZjI2YmIzIgogU1JDX1VSSVtkaWdlc3QtMC4xMC43LnNoYTI1NnN1bV0gPSAiOWVk
OWEyODFmN2JjOWI3NTc2ZTYxNDY4YmE2MTVhNjZhNWM4Y2ZkZmY0MjQyMGE3MGFhODI3MDFhM2Ix
ZTI5MiIKIFNSQ19VUklbZ2VuZXJpYy1hcnJheS0wLjE0Ljcuc2hhMjU2c3VtXSA9ICI4NTY0OWNh
NTFmZDcyMjcyZDc4MjFhZGFmMjc0YWQ5MWMyODgyNzc3MTNkOWMxODgyMGQ4NDk5YTdmZjY5ZTlh
IgotU1JDX1VSSVtnZXRyYW5kb20tMC4zLjEuc2hhMjU2c3VtXSA9ICI0M2E0OWMzOTI4ODFjZTZk
NWMzYjhjYjcwZjk4NzE3YjdjMDdhYWJiZGZmMDY2ODdiOTAzMGRiZmJlMjcyNWY4IgorU1JDX1VS
SVtnZXRyYW5kb20tMC4zLjMuc2hhMjU2c3VtXSA9ICIyNjE0NWU1NjNlNTRmMmNhZGM0Nzc1NTNm
MWVjNWVlNjUwYjAwODYyZjBhNThiY2QxMmNiZGM1ZjBlYTJkMmY0IgogU1JDX1VSSVtoZWNrLTAu
NS4wLnNoYTI1NnN1bV0gPSAiMjMwNGUwMDk4M2Y4N2ZmYjM4YjU1YjQ0NGI1ZTNiNjBhODg0YjVk
MzBjMGZjYTdkODJmZTMzNDQ5YmJlNTVlYSIKLVNSQ19VUklbaW5kb2MtMi4wLjUuc2hhMjU2c3Vt
XSA9ICJiMjQ4ZjUyMjRkMWQ2MDYwMDVlMDJjOTdmNWFhNGU4OGVlYjIzMDQ4OGJjYzAzYmM5Y2E0
ZDc5OTEzOTlmMmI1IgorU1JDX1VSSVtpbmRvYy0yLjAuNi5zaGEyNTZzdW1dID0gImY0YzcyNDVh
MDg1MDQ5NTU2MDU2NzBkYmYxNDFmY2VhYjk3NWYxNWNhMjE1NzA2OTZhZWJlOWQyZTcxNTc2YmQi
CiBTUkNfVVJJW2lub3V0LTAuMS40LnNoYTI1NnN1bV0gPSAiODc5ZjEwZTYzYzIwNjI5ZWNhYmJi
NjRhODAxMDMxOTczOGM2NmE1Y2QwYzI5YjAyZDYzZDI3MmIwMzc1MWQwMSIKLVNSQ19VUklbbGli
Yy0wLjIuMTcwLnNoYTI1NnN1bV0gPSAiODc1YjM2ODBjYjJmOGY3MWJkY2Y5YTMwZjM4ZDQ4Mjgy
ZjVkM2M5NWNiZjliM2ZhNTcyNjliYjVkNWMwNjgyOCIKK1NSQ19VUklbbGliYy0wLjIuMTc2LnNo
YTI1NnN1bV0gPSAiNThmOTI5YjRkNjcyZWE5MzdhMjNhMWFiNDk0MTQzZDk2ODMzN2E1ZjQ3ZTU2
ZDA4MTVkZjFlMDg5MGRkZjE3NCIKIFNSQ19VUklbbWVtb2Zmc2V0LTAuOS4xLnNoYTI1NnN1bV0g
PSAiNDg4MDE2YmZhZTQ1N2IwMzZkOTk2MDkyZjZjYjQ0ODY3NzYxMWNlNDQ0OWU5NzBjZWFmNDI2
OTUyMDNmMjE4YSIKLVNSQ19VUklbb25jZV9jZWxsLTEuMjAuMy5zaGEyNTZzdW1dID0gIjk0NTQ2
MmE0YjgxZTQzYzRlM2JhOTZiZDdiNDlkODM0YzZmNjExOTgzNTZhYTg1ODczM2JjNGFjZjNjYmU2
MmUiCitTUkNfVVJJW29uY2VfY2VsbC0xLjIxLjMuc2hhMjU2c3VtXSA9ICI0MmY1ZTE1Yzk5NTNj
NWU0Y2NjZWViMmU3MzgyYTcxNjQ4MmMzNDUxNTMxNWY3YjAzNTMyYjhiNGU4MzkzZDJkIgogU1JD
X1VSSVtwYmtkZjItMC4xMi4yLnNoYTI1NnN1bV0gPSAiZjhlZDZhNzc2MWY3NmUzYjlmOTJkZmIw
YTYwYTZhNjQ3N2M2MTAyNGI3NzUxNDdmZjA5NzNhMDI2NTNhYmFmMiIKLVNSQ19VUklbcG9ydGFi
bGUtYXRvbWljLTEuMTEuMC5zaGEyNTZzdW1dID0gIjM1MGU5YjQ4Y2JjNmIwZTAyOGIwNDczYjEx
NDQ1NGM2MzE2ZTU3MzM2ZWUxODRjZWFiNmU1M2Y3MmMxNzhiM2UiCi1TUkNfVVJJW3Byb2MtbWFj
cm8yLTEuMC45My5zaGEyNTZzdW1dID0gIjYwOTQ2YTY4ZTVmOWQyOGIwZGMxYzIxYmI4YTk3ZWU3
ZDAxOGE4YjMyMmZhNTc4MzhiYTMxY2M4NzhlMjJkOTkiCi1TUkNfVVJJW3B5bzMtMC4yMy41LnNo
YTI1NnN1bV0gPSAiNzc3OGJmZmQ4NWNmMzgxNzVhYzFmNTQ1NTA5NjY1ZDBiOWI5MmExOThjYTc5
NDFmMTMxZjg1ZjdhNGY5YTg3MiIKLVNSQ19VUklbcHlvMy1idWlsZC1jb25maWctMC4yMy41LnNo
YTI1NnN1bV0gPSAiOTRmNmNiZTg2ZWYzYmYxODk5OGQ5ZGY2ZTBmM2ZjMTA1MGE4YzVlZmE0MDli
ZjcxMmU2NjFhNDM2NmUwMTBmYiIKLVNSQ19VUklbcHlvMy1mZmktMC4yMy41LnNoYTI1NnN1bV0g
PSAiZTlmMWI0YzQzMWMwYmIxYzhmYjBhMzM4NzA5ODU5ZWVkMGQwMzBmZjZkYWEzNDM2OGQzYjE1
MmE2M2RmZGQ4ZCIKLVNSQ19VUklbcHlvMy1tYWNyb3MtMC4yMy41LnNoYTI1NnN1bV0gPSAiZmJj
MjIwMTMyOGY2M2M0NzEwZjY4YWJkZjY1M2M4OWQ4ZGJjMjg1OGI4OGM1ZDg4YjBmZjM4YTc1Mjg4
YTlkYSIKLVNSQ19VUklbcHlvMy1tYWNyb3MtYmFja2VuZC0wLjIzLjUuc2hhMjU2c3VtXSA9ICJm
Y2E2NzI2YWQwZjNkYTljOWRlMDkzZDZmMTE2YTkzYzFhMzhlNDE3ZWQ3M2JmMTM4NDcyY2Y0MDY0
ZjcyMDI4IgotU1JDX1VSSVtxdW90ZS0xLjAuMzguc2hhMjU2c3VtXSA9ICIwZTRkY2NhYWFmODk1
MTRmNTQ2YzY5M2RkYzE0MGY3MjlmOTU4YzI0NzkxOGExMzM4MGNjY2M2MDc4MzkxYWNjIgotU1JD
X1VSSVtzaGEyLTAuMTAuOC5zaGEyNTZzdW1dID0gIjc5M2RiNzVhZDJiY2FmYzNmZmE3YzY4YjIx
NWZlZTI2OGY1Mzc5ODJjZDkwMWQxMzJmODljNjM0M2YzYTNkYzgiCitTUkNfVVJJW3BvcnRhYmxl
LWF0b21pYy0xLjExLjEuc2hhMjU2c3VtXSA9ICJmODQyNjdiMjBhMTZlYTkxOGU0M2M2YTg4NDMz
YzJkNTRmYTE0NWM5MmE4MTFiNWIwNDdjY2JlMTUzNjc0NDgzIgorU1JDX1VSSVtwcm9jLW1hY3Jv
Mi0xLjAuMTAxLnNoYTI1NnN1bV0gPSAiODlhZTQzZmQ4NmU0MTU4ZDZkYjUxYWQ4ZTJiODBmMzEz
YWY5Y2M3NGY1YzBlMDNjY2I4N2RlMDk5OTg3MzJkZSIKK1NSQ19VUklbcHlvMy0wLjI2LjAuc2hh
MjU2c3VtXSA9ICI3YmEwMTE3ZjQyMTIxMDFlZTY1NDQwNDRkYWU0NWFiZTEwODNkMzBjZTdiMjlj
NGI1Y2JkZmEyMzU0ZTA3MzgzIgorU1JDX1VSSVtweW8zLWJ1aWxkLWNvbmZpZy0wLjI2LjAuc2hh
MjU2c3VtXSA9ICI0ZmM2ZGRhZjI0OTQ3ZDEyYTlhYTMxYWM2NTQzMWZiMWI4NTFiOGY0MzY1NDI2
ZTE4MjkwMWVhYmZiODdkZjVmIgorU1JDX1VSSVtweW8zLWZmaS0wLjI2LjAuc2hhMjU2c3VtXSA9
ICIwMjU0NzRkMzkyODczOGVmYjM4YWMzNmQ0NzQ0YTc0YTQwMGM5MDFjNzU5NjE5OWUyMGU0NWQ5
OGViMTk0MTA1IgorU1JDX1VSSVtweW8zLW1hY3Jvcy0wLjI2LjAuc2hhMjU2c3VtXSA9ICIyZTY0
ZWI0ODlmMjJmZTFjOTU5MTFiNzdjNDRjYzQxZTdjMTlmMzA4MmZjODFjY2U5MGY2NTdjZGM0MmZm
ZGVkIgorU1JDX1VSSVtweW8zLW1hY3Jvcy1iYWNrZW5kLTAuMjYuMC5zaGEyNTZzdW1dID0gIjEw
MDI0NmMwZWNmNDAwYjQ3NTM0MWI4NDU1YTkyMTMzNDQ1NjlhZjI5YTNjODQxZDI5MjcwZTUzMTAy
ZTBmY2YiCitTUkNfVVJJW3F1b3RlLTEuMC40MC5zaGEyNTZzdW1dID0gIjE4ODVjMDM5NTcwZGMw
MGRjYjRmZjA4N2E4OWUxODVmZDU2YmFlMjM0ZGRjN2YwNTZhOTQ1YmYzNjQ2NzI0OGQiCitTUkNf
VVJJW3ItZWZpLTUuMy4wLnNoYTI1NnN1bV0gPSAiNjljZGIzNGMxNThjZWIyODhkZjExZTE4YjRi
ZDM5ZGU5OTRmNjY1N2Q4Mzg0N2JkZmZkYmQ3ZjM0Njc1NGIwZiIKK1NSQ19VUklbc2hhMi0wLjEw
Ljkuc2hhMjU2c3VtXSA9ICJhNzUwN2Q4MTk3NjlkMDFhMzY1YWI3MDc3OTRhNDA4NDM5MmM4MjRm
NTRhN2E2YTc4NjJmOGMzZDA4OTJiMjgzIgogU1JDX1VSSVtzdWJ0bGUtMi42LjEuc2hhMjU2c3Vt
XSA9ICIxM2MyYmRkZWNjNTdiMzg0ZGVlMTg2NTIzNThmYjIzMTcyZmFjYjhhMmM1MWNjYzEwZDc0
YzE1N2JkZWEzMjkyIgotU1JDX1VSSVtzeW4tMi4wLjk4LnNoYTI1NnN1bV0gPSAiMzYxNDdmMWE0
OGFlMGVjMmI1YjNiYzViNTM3ZDI2NzQ1NzU1NWExMGRjMDZmM2RiYzhjYjExYmEzMDA2ZDNiMSIK
LVNSQ19VUklbdGFyZ2V0LWxleGljb24tMC4xMi4xNi5zaGEyNTZzdW1dID0gIjYxYzQxYWYyN2Rk
NmQxZTI3YjFiMTZiNDg5ZGI3OTg0NDM0NzhjZWYxZjA2YTY2MGM5NmRiNjE3YmE1ZGUzYjEiCitT
UkNfVVJJW3N5bi0yLjAuMTA2LnNoYTI1NnN1bV0gPSAiZWRlN2M0MzgwMjhkNDQzNmQ3MTEwNDkx
NjkxMGY1YmI2MTE5NzJjNWNmZDdmODliODMwMGE4MTg2ZTZmYWRhNiIKK1NSQ19VUklbdGFyZ2V0
LWxleGljb24tMC4xMy4zLnNoYTI1NnN1bV0gPSAiZGY3ZjYyNTc3YzI1ZTA3ODM0NjQ5ZmMzYjM5
ZmFmZGM1OTdjMGEzNTI3ZGMxYzYwMTI5MjAxY2NmY2JhYTUwYyIKIFNSQ19VUklbdHlwZW51bS0x
LjE4LjAuc2hhMjU2c3VtXSA9ICIxZGNjZmZlM2NlMDdhZjkzODZiZmQyOWU4MGMwYWIxYTgyMDVh
MmZjMzRlNGJjZDQwMzY0ZGY5MDJjZmE4ZjNmIgotU1JDX1VSSVt1bmljb2RlLWlkZW50LTEuMC4x
Ny5zaGEyNTZzdW1dID0gIjAwZTI0NzNhOTM3NzhlYjBiYWQzNTkwOWRmZjZhMTBkMjhlNjNmNzky
ZjE2ZWQxNWU0MDRmY2E5ZDVlZWVkYmUiCi1TUkNfVVJJW3VuaW5kZW50LTAuMi4zLnNoYTI1NnN1
bV0gPSAiYzdkZTdkNzNlMTc1NDQ4N2NiNTgzNjRlZTkwNmE0OTk5MzdhMGRmYWJkODZiY2I5ODBm
YTk5ZWM4YzhmYTJjZSIKK1NSQ19VUklbdW5pY29kZS1pZGVudC0xLjAuMTkuc2hhMjU2c3VtXSA9
ICJmNjNhNTQ1NDgxMjkxMTM4OTEwNTc1MTI5NDg2ZGFlYWY4YWM1NGFlZTQzODdmZTc5MDY5MTlm
NzgzMGM3ZDlkIgorU1JDX1VSSVt1bmluZGVudC0wLjIuNC5zaGEyNTZzdW1dID0gIjcyNjRlMTA3
ZjU1M2NjYWU4NzlkMjFmYmVhMWQ2NzI0YWM3ODVlOGMzYmZjNzYyMTM3OTU5YjU4MDI4MjZlZjMi
CiBTUkNfVVJJW3ZlcnNpb25fY2hlY2stMC45LjUuc2hhMjU2c3VtXSA9ICIwYjkyOGYzM2Q5NzVm
YzZhZDlmODZjOGYyODM4NTNhZDI2YmRkNWIxMGI3ZjE1NDJhYTJmYTE1ZTIyODkxMDVhIgotU1JD
X1VSSVt3YXNpLTAuMTMuMyt3YXNpLTAuMi4yLnNoYTI1NnN1bV0gPSAiMjY4MTZkMmUxYTRhMzZh
Mjk0MGI5NmM1Mjk2Y2U0MDM5MTc2MzNkZmY4ZjM0NDBlOWIyMzZlZDZmNmJhY2FkMiIKLVNSQ19V
Uklbd2luZG93cy10YXJnZXRzLTAuNTIuNi5zaGEyNTZzdW1dID0gIjliNzI0ZjcyNzk2ZTAzNmFi
OTBjMTAyMWQ0NzgwZDRkM2Q2NDhhY2E1OWU0OTFlNmI5OGU3MjViODRlOTk5NzMiCi1TUkNfVVJJ
W3dpbmRvd3NfYWFyY2g2NF9nbnVsbHZtLTAuNTIuNi5zaGEyNTZzdW1dID0gIjMyYTQ2MjIxODBl
N2EwZWMwNDRiYjU1NTQwNGM4MDBiYzlmZDllYzI2MmVjMTQ3ZWRkNTk4OWNjZDBjMDJjZDMiCi1T
UkNfVVJJW3dpbmRvd3NfYWFyY2g2NF9tc3ZjLTAuNTIuNi5zaGEyNTZzdW1dID0gIjA5ZWMyYTdi
YjE1MmUyMjUyYjUzZmE3ODAzMTUwMDA3ODc5NTQ4YmM3MDljMDM5ZGY3NjI3Y2FiYmQwNWQ0Njki
Ci1TUkNfVVJJW3dpbmRvd3NfaTY4Nl9nbnUtMC41Mi42LnNoYTI1NnN1bV0gPSAiOGU5YjVhZDVh
YjgwMmU5N2ViOGUyOTVhYzY3MjBlNTA5ZWU0YzI0M2Y2OWQ3ODEzOTQwMTRlYmZlOGJiZmEwYiIK
LVNSQ19VUklbd2luZG93c19pNjg2X2dudWxsdm0tMC41Mi42LnNoYTI1NnN1bV0gPSAiMGVlZTUy
ZDM4YzA5MGIzY2FhNzZjNTYzYjg2YzNhNGJkNzFlZjFhODE5Mjg3YzE5ZDU4NmQ3MzM0YWU4ZWQ2
NiIKLVNSQ19VUklbd2luZG93c19pNjg2X21zdmMtMC41Mi42LnNoYTI1NnN1bV0gPSAiMjQwOTQ4
YmMwNWM1ZTdjNmRhYmJhMjhiZjg5ZDg5ZmZjZTNlMzAzMDIyODA5ZTczZGVhZWZlNGY2ZWM1NmM2
NiIKLVNSQ19VUklbd2luZG93c194ODZfNjRfZ251LTAuNTIuNi5zaGEyNTZzdW1dID0gIjE0N2E1
YzgwYWFiZmJmMGM3ZDkwMWNiNTg5NWQxZGUzMGVmMjkwN2ViMjFmYmJhYjI5Y2E5NGM1YjA4YjFh
NzgiCi1TUkNfVVJJW3dpbmRvd3NfeDg2XzY0X2dudWxsdm0tMC41Mi42LnNoYTI1NnN1bV0gPSAi
MjRkNWIyM2RjNDE3NDEyNjc5NjgxMzk2ZjJiNDlmM2RlOGMxNDczZGViNTE2YmQzNDQxMDg3MmVm
ZjUxZWQwZCIKLVNSQ19VUklbd2luZG93c194ODZfNjRfbXN2Yy0wLjUyLjYuc2hhMjU2c3VtXSA9
ICI1ODlmNmRhODRjNjQ2MjA0NzQ3ZDEyNzBhMmE1NjYxZWE2NmVkMWNjZWQyNjMxZDU0NmZkZmIx
NTU5NTlmOWVjIgotU1JDX1VSSVt3aXQtYmluZGdlbi1ydC0wLjMzLjAuc2hhMjU2c3VtXSA9ICIz
MjY4ZjNkODY2NDU4Yjc4N2YzOTBjZjYxZjRiYmI1NjNiOTIyZDA5MTM1OWY5NjA4ODQyOTk5ZWFl
ZTM5NDNjIgorU1JDX1VSSVt3YXNpLTAuMTQuNyt3YXNpLTAuMi40LnNoYTI1NnN1bV0gPSAiODgz
NDc4ZGUyMDM2N2UyMjRjMDA5MGFmOWNmNWY5ZmE4NWJlZDYzYTk1YzFhYmYzYWZjNWMwODNlYmMw
NmU4YyIKK1NSQ19VUklbd2FzaXAyLTEuMC4xK3dhc2ktMC4yLjQuc2hhMjU2c3VtXSA9ICIwNTYy
NDI4NDIyYzYzNzczZGFkMmMzNDVhMTg4MjI2M2JiZjRkNjVjZjNmNDJlOTA5MjFmNzg3ZWY1YWQ1
OGU3IgorU1JDX1VSSVt3aXQtYmluZGdlbi0wLjQ2LjAuc2hhMjU2c3VtXSA9ICJmMTdhODU4ODNk
NGU2ZDAwZThhOTdjNTg2ZGU3NjRkYWJjYzA2MTMzZjdmMWQ1NWRjZTVjZGMwNzBhZDdmZTU5Igog
U1JDX1VSSVt6ZXJvaXplLTEuOC4xLnNoYTI1NnN1bV0gPSAiY2VkMzY3OGEyODc5YjMwMzA2ZDMy
M2Y0NTQyNjI2Njk3YTQ2NGE5N2MwYTA3YzlhZWJmN2ViY2E2NWNkNGRkZSIKZGlmZiAtLWdpdCBh
L21ldGEvcmVjaXBlcy1kZXZ0b29scy9weXRob24vcHl0aG9uMy1iY3J5cHRfNC4zLjAuYmIgYi9t
ZXRhL3JlY2lwZXMtZGV2dG9vbHMvcHl0aG9uL3B5dGhvbjMtYmNyeXB0XzUuMC4wLmJiCnNpbWls
YXJpdHkgaW5kZXggODYlCnJlbmFtZSBmcm9tIG1ldGEvcmVjaXBlcy1kZXZ0b29scy9weXRob24v
cHl0aG9uMy1iY3J5cHRfNC4zLjAuYmIKcmVuYW1lIHRvIG1ldGEvcmVjaXBlcy1kZXZ0b29scy9w
eXRob24vcHl0aG9uMy1iY3J5cHRfNS4wLjAuYmIKaW5kZXggOTMxYWFlNDMxMC4uNjM5N2VjZDgx
OCAxMDA2NDQKLS0tIGEvbWV0YS9yZWNpcGVzLWRldnRvb2xzL3B5dGhvbi9weXRob24zLWJjcnlw
dF80LjMuMC5iYgorKysgYi9tZXRhL3JlY2lwZXMtZGV2dG9vbHMvcHl0aG9uL3B5dGhvbjMtYmNy
eXB0XzUuMC4wLmJiCkBAIC02LDcgKzYsNyBAQCBIT01FUEFHRSA9ICJodHRwczovL3B5cGkub3Jn
L3Byb2plY3QvYmNyeXB0LyIKIERFUEVORFMgKz0gInB5dGhvbjMtY2ZmaS1uYXRpdmUiCiBMREZM
QUdTICs9ICIke0BiYi51dGlscy5jb250YWlucygnRElTVFJPX0ZFQVRVUkVTJywgJ3B0ZXN0Jywg
Jy1mdXNlLWxkPWJmZCcsICcnLCBkKX0iCiAKLVNSQ19VUklbc2hhMjU2c3VtXSA9ICIzYTNmZDIy
MDQxNzhiNmQyYWRjZjA5Y2I0ZjY0MjZmZmVmNTQ3NjI1NzdhN2M5YjU0YzE1OTAwOGNiMjg4YzE4
IgorU1JDX1VSSVtzaGEyNTZzdW1dID0gImY3NDhmN2MyZDZmZDM3NWNjOTNkM2ZiYTdlZjRhOWUz
YTA5MjQyMWI4ZGJmMzRkOGQ0ZGMwNmJlOTQ5MmRmZGQiCiAKIGluaGVyaXQgcHlwaSBweXRob25f
c2V0dXB0b29sczNfcnVzdCBjYXJnby11cGRhdGUtcmVjaXBlLWNyYXRlcyBwdGVzdC1weXRob24t
cHl0ZXN0CiAKLS0gCjIuNDcuMQoK

--===============5275995096746644768==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: attachment; filename="buildhistory-diff.txt"

Changes to packages/x86-64-v3-poky-linux/python3-bcrypt (sysroot):
  /usr/lib/python3.13/site-packages/bcrypt-4.3.0.dist-info moved to /usr/lib/python3.13/site-packages/bcrypt-5.0.0.dist-info

--===============5275995096746644768==--

