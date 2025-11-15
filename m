Return-Path: <auh@yoctoproject.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 515C2CEB2F7
	for <webhook@archiver.kernel.org>; Sat, 15 Nov 2025 16:38:53 +0000 (UTC)
Received: from a27-31.smtp-out.us-west-2.amazonses.com (a27-31.smtp-out.us-west-2.amazonses.com [54.240.27.31])
 by mx.groups.io with SMTP id smtpd.msgproc01-g2.11931.1763224714352186146
 for <openembedded-core@lists.openembedded.org>;
 Sat, 15 Nov 2025 08:38:43 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@yoctoproject.org header.s=j46ser6a2yusdzubpv7m7ewqgesde2ie header.b=leIeu115;
 dkim=pass header.i=@amazonses.com header.s=gdwg2y3kokkkj5a55z2ilkup5wp5hhxx header.b=HqK+jCKY;
 spf=pass (domain: us-west-2.amazonses.com, ip: 54.240.27.31, mailfrom: 0101019a88621cd3-3a685d10-43a3-483f-a108-d12d862d5196-000000@us-west-2.amazonses.com)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/simple;
	s=j46ser6a2yusdzubpv7m7ewqgesde2ie; d=yoctoproject.org;
	t=1763224722;
	h=Content-Type:MIME-Version:From:To:Cc:Subject:Message-Id:Date;
	bh=IwHfj5y7A9vDE3pbtebX1oDNodT6RwmNi1bDNTNK8SA=;
	b=leIeu115nRKxwlk8V7xx61J7SPdxJ7S+7g15sBek+4/I2kKYLsF52Sv7PQ+vpKUU
	ds7GnK27ZEntkb9AYE5dFMT9XM8pGkFCe847xDW1KCg00PW0bSOGR4kgo3W3XDX9CaE
	m4b4InDN1T80NxiRWig/Ubo8/1I2rl/xhHpwK18k=
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/simple;
	s=gdwg2y3kokkkj5a55z2ilkup5wp5hhxx; d=amazonses.com; t=1763224722;
	h=Content-Type:MIME-Version:From:To:Cc:Subject:Message-Id:Date:Feedback-ID;
	bh=IwHfj5y7A9vDE3pbtebX1oDNodT6RwmNi1bDNTNK8SA=;
	b=HqK+jCKYOuwKioV08+bDA3I+bWbWYbOnmI2PImYcjb/LXNVGf2fqhq3gWVO+gEci
	VjKcnTBJl9fpW1PaOEkHTrd4HAORdIPADW8OIdCq81ke+doDgSEeFjFbh6f7+CiGfiD
	tV2knp3XOX/Z5OQ4zwo5xpQdTOBWXcWBeJZuBnLI=
Content-Type: multipart/mixed; boundary="===============6613382397031854162=="
MIME-Version: 1.0
From: auh@yoctoproject.org
To: Tim Orling <tim.orling@konsulko.com>
Cc: openembedded-core@lists.openembedded.org
Subject: [AUH] python3-bcrypt: upgrading to 5.0.0 SUCCEEDED
Message-ID: <0101019a88621cd3-3a685d10-43a3-483f-a108-d12d862d5196-000000@us-west-2.amazonses.com>
Date: Sat, 15 Nov 2025 16:38:42 +0000
Feedback-ID: ::1.us-west-2.9np3MYPs3fEaOBysGKSlUD4KtcmPijcmS9Az2Hwf7iQ=:AmazonSES
X-SES-Outgoing: 2025.11.15-54.240.27.31
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Sat, 15 Nov 2025 16:38:53 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/226348

--===============6613382397031854162==
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
From dd55795099258d4db2d87f57ea352b39ba5addf5 Mon Sep 17 00:00:00 2001
From: Upgrade Helper <auh@yoctoproject.org>
Date: Sat, 15 Nov 2025 09:53:14 +0000
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


--===============6613382397031854162==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: attachment; filename="buildhistory-diff-full.txt"

packages/x86-64-v3-poky-linux/python3-bcrypt: SRC_URI changed from "https://files.pythonhosted.org/packages/source/b/bcrypt/bcrypt-4.3.0.tar.gz;downloadfilename=bcrypt-4.3.0.tar.gz crate://crates.io/autocfg/1.4.0 crate://crates.io/base64/0.22.1 crate://crates.io/bcrypt/0.17.0 crate://crates.io/bcrypt-pbkdf/0.10.0 crate://crates.io/bitflags/2.8.0 crate://crates.io/block-buffer/0.10.4 crate://crates.io/blowfish/0.9.1 crate://crates.io/byteorder/1.5.0 crate://crates.io/cfg-if/1.0.0 crate://crates.io/cipher/0.4.4 crate://crates.io/cpufeatures/0.2.17 crate://crates.io/crypto-common/0.1.6 crate://crates.io/digest/0.10.7 crate://crates.io/generic-array/0.14.7 crate://crates.io/getrandom/0.3.1 crate://crates.io/heck/0.5.0 crate://crates.io/indoc/2.0.5 crate://crates.io/inout/0.1.4 crate://crates.io/libc/0.2.170 crate://crates.io/memoffset/0.9.1 crate://crates.io/once_cell/1.20.3 crate://crates.io/pbkdf2/0.12.2 crate://crates.io/portable-atomic/1.11.0 crate://crates.io/proc-macro2/1.0.93 crat
 e://crates.io/pyo3/0.23.5 crate://crates.io/pyo3-build-config/0.23.5 crate://crates.io/pyo3-ffi/0.23.5 crate://crates.io/pyo3-macros/0.23.5 crate://crates.io/pyo3-macros-backend/0.23.5 crate://crates.io/quote/1.0.38 crate://crates.io/sha2/0.10.8 crate://crates.io/subtle/2.6.1 crate://crates.io/syn/2.0.98 crate://crates.io/target-lexicon/0.12.16 crate://crates.io/typenum/1.18.0 crate://crates.io/unicode-ident/1.0.17 crate://crates.io/unindent/0.2.3 crate://crates.io/version_check/0.9.5 crate://crates.io/wasi/0.13.3+wasi-0.2.2 crate://crates.io/windows-targets/0.52.6 crate://crates.io/windows_aarch64_gnullvm/0.52.6 crate://crates.io/windows_aarch64_msvc/0.52.6 crate://crates.io/windows_i686_gnu/0.52.6 crate://crates.io/windows_i686_gnullvm/0.52.6 crate://crates.io/windows_i686_msvc/0.52.6 crate://crates.io/windows_x86_64_gnu/0.52.6 crate://crates.io/windows_x86_64_gnullvm/0.52.6 crate://crates.io/windows_x86_64_msvc/0.52.6 crate://crates.io/wit-bindgen-rt/0.33.0 crate://crates.io/zero
 ize/1.8.1" to "https://files.pythonhosted.org/packages/source/b/bcrypt/bcrypt-5.0.0.tar.gz;downloadfilename=bcrypt-5.0.0.tar.gz crate://crates.io/autocfg/1.5.0 crate://crates.io/base64/0.22.1 crate://crates.io/bcrypt/0.17.1 crate://crates.io/bcrypt-pbkdf/0.10.0 crate://crates.io/block-buffer/0.10.4 crate://crates.io/blowfish/0.9.1 crate://crates.io/byteorder/1.5.0 crate://crates.io/cfg-if/1.0.3 crate://crates.io/cipher/0.4.4 crate://crates.io/cpufeatures/0.2.17 crate://crates.io/crypto-common/0.1.6 crate://crates.io/digest/0.10.7 crate://crates.io/generic-array/0.14.7 crate://crates.io/getrandom/0.3.3 crate://crates.io/heck/0.5.0 crate://crates.io/indoc/2.0.6 crate://crates.io/inout/0.1.4 crate://crates.io/libc/0.2.176 crate://crates.io/memoffset/0.9.1 crate://crates.io/once_cell/1.21.3 crate://crates.io/pbkdf2/0.12.2 crate://crates.io/portable-atomic/1.11.1 crate://crates.io/proc-macro2/1.0.101 crate://crates.io/pyo3/0.26.0 crate://crates.io/pyo3-build-config/0.26.0 crate://crates.
 io/pyo3-ffi/0.26.0 crate://crates.io/pyo3-macros/0.26.0 crate://crates.io/pyo3-macros-backend/0.26.0 crate://crates.io/quote/1.0.40 crate://crates.io/r-efi/5.3.0 crate://crates.io/sha2/0.10.9 crate://crates.io/subtle/2.6.1 crate://crates.io/syn/2.0.106 crate://crates.io/target-lexicon/0.13.3 crate://crates.io/typenum/1.18.0 crate://crates.io/unicode-ident/1.0.19 crate://crates.io/unindent/0.2.4 crate://crates.io/version_check/0.9.5 crate://crates.io/wasi/0.14.7+wasi-0.2.4 crate://crates.io/wasip2/1.0.1+wasi-0.2.4 crate://crates.io/wit-bindgen/0.46.0 crate://crates.io/zeroize/1.8.1"
packages/x86-64-v3-poky-linux/python3-bcrypt: PKGV changed from 4.3.0 [default] to 5.0.0 [default]
packages/x86-64-v3-poky-linux/python3-bcrypt: PV changed from "4.3.0" to "5.0.0"
packages/x86-64-v3-poky-linux/python3-bcrypt/python3-bcrypt-dbg: PKGSIZE changed from 151976 to 153936 (+1%)
packages/x86-64-v3-poky-linux/python3-bcrypt/python3-bcrypt-dbg: PKGV changed from 4.3.0 [default] to 5.0.0 [default]
packages/x86-64-v3-poky-linux/python3-bcrypt/python3-bcrypt-dbg: PV changed from "4.3.0" to "5.0.0"
packages/x86-64-v3-poky-linux/python3-bcrypt/python3-bcrypt-dev: PKGV changed from 4.3.0 [default] to 5.0.0 [default]
packages/x86-64-v3-poky-linux/python3-bcrypt/python3-bcrypt-dev: PV changed from "4.3.0" to "5.0.0"
packages/x86-64-v3-poky-linux/python3-bcrypt/python3-bcrypt-doc: PKGV changed from 4.3.0 [default] to 5.0.0 [default]
packages/x86-64-v3-poky-linux/python3-bcrypt/python3-bcrypt-doc: PV changed from "4.3.0" to "5.0.0"
packages/x86-64-v3-poky-linux/python3-bcrypt/python3-bcrypt-locale: PKGV changed from 4.3.0 [default] to 5.0.0 [default]
packages/x86-64-v3-poky-linux/python3-bcrypt/python3-bcrypt-locale: PV changed from "4.3.0" to "5.0.0"
packages/x86-64-v3-poky-linux/python3-bcrypt/python3-bcrypt-ptest: PKGSIZE changed from 17470 to 16888 (-3%)
packages/x86-64-v3-poky-linux/python3-bcrypt/python3-bcrypt-ptest: PKGV changed from 4.3.0 [default] to 5.0.0 [default]
packages/x86-64-v3-poky-linux/python3-bcrypt/python3-bcrypt-ptest: PV changed from "4.3.0" to "5.0.0"
packages/x86-64-v3-poky-linux/python3-bcrypt/python3-bcrypt-src: PKGV changed from 4.3.0 [default] to 5.0.0 [default]
packages/x86-64-v3-poky-linux/python3-bcrypt/python3-bcrypt-src: PV changed from "4.3.0" to "5.0.0"
packages/x86-64-v3-poky-linux/python3-bcrypt/python3-bcrypt-staticdev: PKGV changed from 4.3.0 [default] to 5.0.0 [default]
packages/x86-64-v3-poky-linux/python3-bcrypt/python3-bcrypt-staticdev: PV changed from "4.3.0" to "5.0.0"
packages/x86-64-v3-poky-linux/python3-bcrypt/python3-bcrypt: PKGSIZE changed from 531629 to 540337 (+2%)
packages/x86-64-v3-poky-linux/python3-bcrypt/python3-bcrypt: PKGV changed from 4.3.0 [default] to 5.0.0 [default]
packages/x86-64-v3-poky-linux/python3-bcrypt/python3-bcrypt: PV changed from "4.3.0" to "5.0.0"
Changes to packages/x86-64-v3-poky-linux/python3-bcrypt (sysroot):
  /usr/lib/python3.13/site-packages/bcrypt-4.3.0.dist-info moved to /usr/lib/python3.13/site-packages/bcrypt-5.0.0.dist-info

--===============6613382397031854162==
Content-Type: application/octet-stream
MIME-Version: 1.0
Content-Transfer-Encoding: base64
Content-Disposition: attachment;
 filename="0001-python3-bcrypt-upgrade-4.3.0-5.0.0.patch"

RnJvbSBkZDU1Nzk1MDk5MjU4ZDRkYjJkODdmNTdlYTM1MmIzOWJhNWFkZGY1IE1vbiBTZXAgMTcg
MDA6MDA6MDAgMjAwMQpGcm9tOiBVcGdyYWRlIEhlbHBlciA8YXVoQHlvY3RvcHJvamVjdC5vcmc+
CkRhdGU6IFNhdCwgMTUgTm92IDIwMjUgMDk6NTM6MTQgKzAwMDAKU3ViamVjdDogW1BBVENIXSBw
eXRob24zLWJjcnlwdDogdXBncmFkZSA0LjMuMCAtPiA1LjAuMAoKLS0tCiAuLi4vcHl0aG9uL3B5
dGhvbjMtYmNyeXB0LWNyYXRlcy5pbmMgICAgICAgICAgfCAxMTIgKysrKysrKystLS0tLS0tLS0t
CiAuLi5jcnlwdF80LjMuMC5iYiA9PiBweXRob24zLWJjcnlwdF81LjAuMC5iYn0gfCAgIDIgKy0K
IDIgZmlsZXMgY2hhbmdlZCwgNDkgaW5zZXJ0aW9ucygrKSwgNjUgZGVsZXRpb25zKC0pCiByZW5h
bWUgbWV0YS9yZWNpcGVzLWRldnRvb2xzL3B5dGhvbi97cHl0aG9uMy1iY3J5cHRfNC4zLjAuYmIg
PT4gcHl0aG9uMy1iY3J5cHRfNS4wLjAuYmJ9ICg4NiUpCgpkaWZmIC0tZ2l0IGEvbWV0YS9yZWNp
cGVzLWRldnRvb2xzL3B5dGhvbi9weXRob24zLWJjcnlwdC1jcmF0ZXMuaW5jIGIvbWV0YS9yZWNp
cGVzLWRldnRvb2xzL3B5dGhvbi9weXRob24zLWJjcnlwdC1jcmF0ZXMuaW5jCmluZGV4IGUwYTI5
MjY1MTkuLmJmNmVlMjZjYmYgMTAwNjQ0Ci0tLSBhL21ldGEvcmVjaXBlcy1kZXZ0b29scy9weXRo
b24vcHl0aG9uMy1iY3J5cHQtY3JhdGVzLmluYworKysgYi9tZXRhL3JlY2lwZXMtZGV2dG9vbHMv
cHl0aG9uL3B5dGhvbjMtYmNyeXB0LWNyYXRlcy5pbmMKQEAgLTIsMTA1ICsyLDg5IEBACiAKICMg
ZnJvbSBzcmMvX2JjcnlwdC9DYXJnby5sb2NrCiBTUkNfVVJJICs9ICIgXAotICAgIGNyYXRlOi8v
Y3JhdGVzLmlvL2F1dG9jZmcvMS40LjAgXAorICAgIGNyYXRlOi8vY3JhdGVzLmlvL2F1dG9jZmcv
MS41LjAgXAogICAgIGNyYXRlOi8vY3JhdGVzLmlvL2Jhc2U2NC8wLjIyLjEgXAotICAgIGNyYXRl
Oi8vY3JhdGVzLmlvL2JjcnlwdC8wLjE3LjAgXAorICAgIGNyYXRlOi8vY3JhdGVzLmlvL2Jjcnlw
dC8wLjE3LjEgXAogICAgIGNyYXRlOi8vY3JhdGVzLmlvL2JjcnlwdC1wYmtkZi8wLjEwLjAgXAot
ICAgIGNyYXRlOi8vY3JhdGVzLmlvL2JpdGZsYWdzLzIuOC4wIFwKICAgICBjcmF0ZTovL2NyYXRl
cy5pby9ibG9jay1idWZmZXIvMC4xMC40IFwKICAgICBjcmF0ZTovL2NyYXRlcy5pby9ibG93Zmlz
aC8wLjkuMSBcCiAgICAgY3JhdGU6Ly9jcmF0ZXMuaW8vYnl0ZW9yZGVyLzEuNS4wIFwKLSAgICBj
cmF0ZTovL2NyYXRlcy5pby9jZmctaWYvMS4wLjAgXAorICAgIGNyYXRlOi8vY3JhdGVzLmlvL2Nm
Zy1pZi8xLjAuMyBcCiAgICAgY3JhdGU6Ly9jcmF0ZXMuaW8vY2lwaGVyLzAuNC40IFwKICAgICBj
cmF0ZTovL2NyYXRlcy5pby9jcHVmZWF0dXJlcy8wLjIuMTcgXAogICAgIGNyYXRlOi8vY3JhdGVz
LmlvL2NyeXB0by1jb21tb24vMC4xLjYgXAogICAgIGNyYXRlOi8vY3JhdGVzLmlvL2RpZ2VzdC8w
LjEwLjcgXAogICAgIGNyYXRlOi8vY3JhdGVzLmlvL2dlbmVyaWMtYXJyYXkvMC4xNC43IFwKLSAg
ICBjcmF0ZTovL2NyYXRlcy5pby9nZXRyYW5kb20vMC4zLjEgXAorICAgIGNyYXRlOi8vY3JhdGVz
LmlvL2dldHJhbmRvbS8wLjMuMyBcCiAgICAgY3JhdGU6Ly9jcmF0ZXMuaW8vaGVjay8wLjUuMCBc
Ci0gICAgY3JhdGU6Ly9jcmF0ZXMuaW8vaW5kb2MvMi4wLjUgXAorICAgIGNyYXRlOi8vY3JhdGVz
LmlvL2luZG9jLzIuMC42IFwKICAgICBjcmF0ZTovL2NyYXRlcy5pby9pbm91dC8wLjEuNCBcCi0g
ICAgY3JhdGU6Ly9jcmF0ZXMuaW8vbGliYy8wLjIuMTcwIFwKKyAgICBjcmF0ZTovL2NyYXRlcy5p
by9saWJjLzAuMi4xNzYgXAogICAgIGNyYXRlOi8vY3JhdGVzLmlvL21lbW9mZnNldC8wLjkuMSBc
Ci0gICAgY3JhdGU6Ly9jcmF0ZXMuaW8vb25jZV9jZWxsLzEuMjAuMyBcCisgICAgY3JhdGU6Ly9j
cmF0ZXMuaW8vb25jZV9jZWxsLzEuMjEuMyBcCiAgICAgY3JhdGU6Ly9jcmF0ZXMuaW8vcGJrZGYy
LzAuMTIuMiBcCi0gICAgY3JhdGU6Ly9jcmF0ZXMuaW8vcG9ydGFibGUtYXRvbWljLzEuMTEuMCBc
Ci0gICAgY3JhdGU6Ly9jcmF0ZXMuaW8vcHJvYy1tYWNybzIvMS4wLjkzIFwKLSAgICBjcmF0ZTov
L2NyYXRlcy5pby9weW8zLzAuMjMuNSBcCi0gICAgY3JhdGU6Ly9jcmF0ZXMuaW8vcHlvMy1idWls
ZC1jb25maWcvMC4yMy41IFwKLSAgICBjcmF0ZTovL2NyYXRlcy5pby9weW8zLWZmaS8wLjIzLjUg
XAotICAgIGNyYXRlOi8vY3JhdGVzLmlvL3B5bzMtbWFjcm9zLzAuMjMuNSBcCi0gICAgY3JhdGU6
Ly9jcmF0ZXMuaW8vcHlvMy1tYWNyb3MtYmFja2VuZC8wLjIzLjUgXAotICAgIGNyYXRlOi8vY3Jh
dGVzLmlvL3F1b3RlLzEuMC4zOCBcCi0gICAgY3JhdGU6Ly9jcmF0ZXMuaW8vc2hhMi8wLjEwLjgg
XAorICAgIGNyYXRlOi8vY3JhdGVzLmlvL3BvcnRhYmxlLWF0b21pYy8xLjExLjEgXAorICAgIGNy
YXRlOi8vY3JhdGVzLmlvL3Byb2MtbWFjcm8yLzEuMC4xMDEgXAorICAgIGNyYXRlOi8vY3JhdGVz
LmlvL3B5bzMvMC4yNi4wIFwKKyAgICBjcmF0ZTovL2NyYXRlcy5pby9weW8zLWJ1aWxkLWNvbmZp
Zy8wLjI2LjAgXAorICAgIGNyYXRlOi8vY3JhdGVzLmlvL3B5bzMtZmZpLzAuMjYuMCBcCisgICAg
Y3JhdGU6Ly9jcmF0ZXMuaW8vcHlvMy1tYWNyb3MvMC4yNi4wIFwKKyAgICBjcmF0ZTovL2NyYXRl
cy5pby9weW8zLW1hY3Jvcy1iYWNrZW5kLzAuMjYuMCBcCisgICAgY3JhdGU6Ly9jcmF0ZXMuaW8v
cXVvdGUvMS4wLjQwIFwKKyAgICBjcmF0ZTovL2NyYXRlcy5pby9yLWVmaS81LjMuMCBcCisgICAg
Y3JhdGU6Ly9jcmF0ZXMuaW8vc2hhMi8wLjEwLjkgXAogICAgIGNyYXRlOi8vY3JhdGVzLmlvL3N1
YnRsZS8yLjYuMSBcCi0gICAgY3JhdGU6Ly9jcmF0ZXMuaW8vc3luLzIuMC45OCBcCi0gICAgY3Jh
dGU6Ly9jcmF0ZXMuaW8vdGFyZ2V0LWxleGljb24vMC4xMi4xNiBcCisgICAgY3JhdGU6Ly9jcmF0
ZXMuaW8vc3luLzIuMC4xMDYgXAorICAgIGNyYXRlOi8vY3JhdGVzLmlvL3RhcmdldC1sZXhpY29u
LzAuMTMuMyBcCiAgICAgY3JhdGU6Ly9jcmF0ZXMuaW8vdHlwZW51bS8xLjE4LjAgXAotICAgIGNy
YXRlOi8vY3JhdGVzLmlvL3VuaWNvZGUtaWRlbnQvMS4wLjE3IFwKLSAgICBjcmF0ZTovL2NyYXRl
cy5pby91bmluZGVudC8wLjIuMyBcCisgICAgY3JhdGU6Ly9jcmF0ZXMuaW8vdW5pY29kZS1pZGVu
dC8xLjAuMTkgXAorICAgIGNyYXRlOi8vY3JhdGVzLmlvL3VuaW5kZW50LzAuMi40IFwKICAgICBj
cmF0ZTovL2NyYXRlcy5pby92ZXJzaW9uX2NoZWNrLzAuOS41IFwKLSAgICBjcmF0ZTovL2NyYXRl
cy5pby93YXNpLzAuMTMuMyt3YXNpLTAuMi4yIFwKLSAgICBjcmF0ZTovL2NyYXRlcy5pby93aW5k
b3dzLXRhcmdldHMvMC41Mi42IFwKLSAgICBjcmF0ZTovL2NyYXRlcy5pby93aW5kb3dzX2FhcmNo
NjRfZ251bGx2bS8wLjUyLjYgXAotICAgIGNyYXRlOi8vY3JhdGVzLmlvL3dpbmRvd3NfYWFyY2g2
NF9tc3ZjLzAuNTIuNiBcCi0gICAgY3JhdGU6Ly9jcmF0ZXMuaW8vd2luZG93c19pNjg2X2dudS8w
LjUyLjYgXAotICAgIGNyYXRlOi8vY3JhdGVzLmlvL3dpbmRvd3NfaTY4Nl9nbnVsbHZtLzAuNTIu
NiBcCi0gICAgY3JhdGU6Ly9jcmF0ZXMuaW8vd2luZG93c19pNjg2X21zdmMvMC41Mi42IFwKLSAg
ICBjcmF0ZTovL2NyYXRlcy5pby93aW5kb3dzX3g4Nl82NF9nbnUvMC41Mi42IFwKLSAgICBjcmF0
ZTovL2NyYXRlcy5pby93aW5kb3dzX3g4Nl82NF9nbnVsbHZtLzAuNTIuNiBcCi0gICAgY3JhdGU6
Ly9jcmF0ZXMuaW8vd2luZG93c194ODZfNjRfbXN2Yy8wLjUyLjYgXAotICAgIGNyYXRlOi8vY3Jh
dGVzLmlvL3dpdC1iaW5kZ2VuLXJ0LzAuMzMuMCBcCisgICAgY3JhdGU6Ly9jcmF0ZXMuaW8vd2Fz
aS8wLjE0Ljcrd2FzaS0wLjIuNCBcCisgICAgY3JhdGU6Ly9jcmF0ZXMuaW8vd2FzaXAyLzEuMC4x
K3dhc2ktMC4yLjQgXAorICAgIGNyYXRlOi8vY3JhdGVzLmlvL3dpdC1iaW5kZ2VuLzAuNDYuMCBc
CiAgICAgY3JhdGU6Ly9jcmF0ZXMuaW8vemVyb2l6ZS8xLjguMSBcCiAiCiAKLVNSQ19VUklbYXV0
b2NmZy0xLjQuMC5zaGEyNTZzdW1dID0gImFjZTUwYmFkZThlNjIzNGFhMTQwZDlhMmY1NTJiYmVl
MWRiNGQzNTNmNjliODIxN2JjNTAzNDkwZmMxYTlmMjYiCitTUkNfVVJJW2F1dG9jZmctMS41LjAu
c2hhMjU2c3VtXSA9ICJjMDg2MDZmOGMzY2JmNGNlNmVjOGUyOGZiMDAxNGEyYzA4NjcwOGZlOTU0
ZWFhODg1Mzg0YTYxNjUxNzJlN2U4IgogU1JDX1VSSVtiYXNlNjQtMC4yMi4xLnNoYTI1NnN1bV0g
PSAiNzJiMzI1NGYxNjI1MWE4MzgxYWExMmU0MGUzYzRkMmYwMTk5ZjhjNjUwOGZiZWNiOWQ5MWY1
NzVlMGZiYjhjNiIKLVNSQ19VUklbYmNyeXB0LTAuMTcuMC5zaGEyNTZzdW1dID0gIjkyNzU4YWQ2
MDc3ZTRjNzZhNmNhZGJjZTUwMDVmNjY2ZGY3MGQ0ZjEzYjE5OTc2YjFhODA2MmVlZjg4MDA0MGYi
CitTUkNfVVJJW2JjcnlwdC0wLjE3LjEuc2hhMjU2c3VtXSA9ICJhYmFmNmRhNDVjNzQzODUyNzJk
ZGYwMGUxYWMwNzRjN2Q4YTZjMWExZGRhMzc2OTAyYmQ2YTQyNzUyMmE4YjJjIgogU1JDX1VSSVti
Y3J5cHQtcGJrZGYtMC4xMC4wLnNoYTI1NnN1bV0gPSAiNmFlYWMyZTFmZTg4ODc2OWYzNGYwNWFj
MzQzYmJlZjk4YjE0ZDFmZmIyOTJhYjY5ZDQ2MDhiM2FiYzg2ZjJhMiIKLVNSQ19VUklbYml0Zmxh
Z3MtMi44LjAuc2hhMjU2c3VtXSA9ICI4ZjY4ZjUzYzgzYWI5NTdmNzJjMzI2NDJmMzg2OGVlYzAz
ZWI5NzRkMWZiODJlNDUzMTI4NDU2NDgyNjEzZDM2IgogU1JDX1VSSVtibG9jay1idWZmZXItMC4x
MC40LnNoYTI1NnN1bV0gPSAiMzA3OGM3NjI5YjYyZDNmMDQzOTUxN2ZhMzk0OTk2YWNhY2M1Y2Jj
OTFjNWEyMGQ4YzY1OGU3N2FiZDUwM2E3MSIKIFNSQ19VUklbYmxvd2Zpc2gtMC45LjEuc2hhMjU2
c3VtXSA9ICJlNDEyZTJjZDBmMmIyZDkzZTAyNTQzY2VhZTc5MTdiM2M3MDMzMTU3M2RmMTllZTA0
NmJjYmMzNWU0NWU4N2Q3IgogU1JDX1VSSVtieXRlb3JkZXItMS41LjAuc2hhMjU2c3VtXSA9ICIx
ZmQwZjI1ODQxNDZmNmYyZWY0ODA4NTA1MDg4NmFjZjM1M2JlZmY3MzA1ZWJkMWFlNjk1MDBlMjdj
NjdmNjRiIgotU1JDX1VSSVtjZmctaWYtMS4wLjAuc2hhMjU2c3VtXSA9ICJiYWYxZGU0MzM5NzYx
NTg4YmMwNjE5ZTNjYmMwMTIwZWU1ODJlYmI3NGI1M2I0ZWZiZjc5MTE3YmQyZGE0MGZkIgorU1JD
X1VSSVtjZmctaWYtMS4wLjMuc2hhMjU2c3VtXSA9ICIyZmQxMjg5YzA0YTllYThjYjIyMzAwYTQ1
OWE3MmEzODVkN2M3M2QzMjU5ZTJlZDdkY2IyYWY2NzQ4MzhjZmE5IgogU1JDX1VSSVtjaXBoZXIt
MC40LjQuc2hhMjU2c3VtXSA9ICI3NzNmM2I5YWY2NDQ0N2QyY2U5ODUwMzMwYzQ3MzUxNTAxNGFh
MjM1ZTZhNzgzYjAyZGI4MWZmMzllNGEzZGFkIgogU1JDX1VSSVtjcHVmZWF0dXJlcy0wLjIuMTcu
c2hhMjU2c3VtXSA9ICI1OWVkNTgzOGVlYmIyNmEyYmIyZTU4ZjZkNWI1MzE2OTg5YWU5ZDA4YmFi
MTBlMGU2ZDEwM2U2NTZkMWIwMjgwIgogU1JDX1VSSVtjcnlwdG8tY29tbW9uLTAuMS42LnNoYTI1
NnN1bV0gPSAiMWJmYjEyNTAyZjNmYzQ2Y2NhMWJiNTFhYzI4ZGY5ZDYxOGQ4MTNjZGMzZDJmMjVi
OWZlNzc1YTM0YWYyNmJiMyIKIFNSQ19VUklbZGlnZXN0LTAuMTAuNy5zaGEyNTZzdW1dID0gIjll
ZDlhMjgxZjdiYzliNzU3NmU2MTQ2OGJhNjE1YTY2YTVjOGNmZGZmNDI0MjBhNzBhYTgyNzAxYTNi
MWUyOTIiCiBTUkNfVVJJW2dlbmVyaWMtYXJyYXktMC4xNC43LnNoYTI1NnN1bV0gPSAiODU2NDlj
YTUxZmQ3MjI3MmQ3ODIxYWRhZjI3NGFkOTFjMjg4Mjc3NzEzZDljMTg4MjBkODQ5OWE3ZmY2OWU5
YSIKLVNSQ19VUklbZ2V0cmFuZG9tLTAuMy4xLnNoYTI1NnN1bV0gPSAiNDNhNDljMzkyODgxY2U2
ZDVjM2I4Y2I3MGY5ODcxN2I3YzA3YWFiYmRmZjA2Njg3YjkwMzBkYmZiZTI3MjVmOCIKK1NSQ19V
UklbZ2V0cmFuZG9tLTAuMy4zLnNoYTI1NnN1bV0gPSAiMjYxNDVlNTYzZTU0ZjJjYWRjNDc3NTUz
ZjFlYzVlZTY1MGIwMDg2MmYwYTU4YmNkMTJjYmRjNWYwZWEyZDJmNCIKIFNSQ19VUklbaGVjay0w
LjUuMC5zaGEyNTZzdW1dID0gIjIzMDRlMDA5ODNmODdmZmIzOGI1NWI0NDRiNWUzYjYwYTg4NGI1
ZDMwYzBmY2E3ZDgyZmUzMzQ0OWJiZTU1ZWEiCi1TUkNfVVJJW2luZG9jLTIuMC41LnNoYTI1NnN1
bV0gPSAiYjI0OGY1MjI0ZDFkNjA2MDA1ZTAyYzk3ZjVhYTRlODhlZWIyMzA0ODhiY2MwM2JjOWNh
NGQ3OTkxMzk5ZjJiNSIKK1NSQ19VUklbaW5kb2MtMi4wLjYuc2hhMjU2c3VtXSA9ICJmNGM3MjQ1
YTA4NTA0OTU1NjA1NjcwZGJmMTQxZmNlYWI5NzVmMTVjYTIxNTcwNjk2YWViZTlkMmU3MTU3NmJk
IgogU1JDX1VSSVtpbm91dC0wLjEuNC5zaGEyNTZzdW1dID0gIjg3OWYxMGU2M2MyMDYyOWVjYWJi
YjY0YTgwMTAzMTk3MzhjNjZhNWNkMGMyOWIwMmQ2M2QyNzJiMDM3NTFkMDEiCi1TUkNfVVJJW2xp
YmMtMC4yLjE3MC5zaGEyNTZzdW1dID0gIjg3NWIzNjgwY2IyZjhmNzFiZGNmOWEzMGYzOGQ0ODI4
MmY1ZDNjOTVjYmY5YjNmYTU3MjY5YmI1ZDVjMDY4MjgiCitTUkNfVVJJW2xpYmMtMC4yLjE3Ni5z
aGEyNTZzdW1dID0gIjU4ZjkyOWI0ZDY3MmVhOTM3YTIzYTFhYjQ5NDE0M2Q5NjgzMzdhNWY0N2U1
NmQwODE1ZGYxZTA4OTBkZGYxNzQiCiBTUkNfVVJJW21lbW9mZnNldC0wLjkuMS5zaGEyNTZzdW1d
ID0gIjQ4ODAxNmJmYWU0NTdiMDM2ZDk5NjA5MmY2Y2I0NDg2Nzc2MTFjZTQ0NDllOTcwY2VhZjQy
Njk1MjAzZjIxOGEiCi1TUkNfVVJJW29uY2VfY2VsbC0xLjIwLjMuc2hhMjU2c3VtXSA9ICI5NDU0
NjJhNGI4MWU0M2M0ZTNiYTk2YmQ3YjQ5ZDgzNGM2ZjYxMTk4MzU2YWE4NTg3MzNiYzRhY2YzY2Jl
NjJlIgorU1JDX1VSSVtvbmNlX2NlbGwtMS4yMS4zLnNoYTI1NnN1bV0gPSAiNDJmNWUxNWM5OTUz
YzVlNGNjY2VlYjJlNzM4MmE3MTY0ODJjMzQ1MTUzMTVmN2IwMzUzMmI4YjRlODM5M2QyZCIKIFNS
Q19VUklbcGJrZGYyLTAuMTIuMi5zaGEyNTZzdW1dID0gImY4ZWQ2YTc3NjFmNzZlM2I5ZjkyZGZi
MGE2MGE2YTY0NzdjNjEwMjRiNzc1MTQ3ZmYwOTczYTAyNjUzYWJhZjIiCi1TUkNfVVJJW3BvcnRh
YmxlLWF0b21pYy0xLjExLjAuc2hhMjU2c3VtXSA9ICIzNTBlOWI0OGNiYzZiMGUwMjhiMDQ3M2Ix
MTQ0NTRjNjMxNmU1NzMzNmVlMTg0Y2VhYjZlNTNmNzJjMTc4YjNlIgotU1JDX1VSSVtwcm9jLW1h
Y3JvMi0xLjAuOTMuc2hhMjU2c3VtXSA9ICI2MDk0NmE2OGU1ZjlkMjhiMGRjMWMyMWJiOGE5N2Vl
N2QwMThhOGIzMjJmYTU3ODM4YmEzMWNjODc4ZTIyZDk5IgotU1JDX1VSSVtweW8zLTAuMjMuNS5z
aGEyNTZzdW1dID0gIjc3NzhiZmZkODVjZjM4MTc1YWMxZjU0NTUwOTY2NWQwYjliOTJhMTk4Y2E3
OTQxZjEzMWY4NWY3YTRmOWE4NzIiCi1TUkNfVVJJW3B5bzMtYnVpbGQtY29uZmlnLTAuMjMuNS5z
aGEyNTZzdW1dID0gIjk0ZjZjYmU4NmVmM2JmMTg5OThkOWRmNmUwZjNmYzEwNTBhOGM1ZWZhNDA5
YmY3MTJlNjYxYTQzNjZlMDEwZmIiCi1TUkNfVVJJW3B5bzMtZmZpLTAuMjMuNS5zaGEyNTZzdW1d
ID0gImU5ZjFiNGM0MzFjMGJiMWM4ZmIwYTMzODcwOTg1OWVlZDBkMDMwZmY2ZGFhMzQzNjhkM2Ix
NTJhNjNkZmRkOGQiCi1TUkNfVVJJW3B5bzMtbWFjcm9zLTAuMjMuNS5zaGEyNTZzdW1dID0gImZi
YzIyMDEzMjhmNjNjNDcxMGY2OGFiZGY2NTNjODlkOGRiYzI4NThiODhjNWQ4OGIwZmYzOGE3NTI4
OGE5ZGEiCi1TUkNfVVJJW3B5bzMtbWFjcm9zLWJhY2tlbmQtMC4yMy41LnNoYTI1NnN1bV0gPSAi
ZmNhNjcyNmFkMGYzZGE5YzlkZTA5M2Q2ZjExNmE5M2MxYTM4ZTQxN2VkNzNiZjEzODQ3MmNmNDA2
NGY3MjAyOCIKLVNSQ19VUklbcXVvdGUtMS4wLjM4LnNoYTI1NnN1bV0gPSAiMGU0ZGNjYWFhZjg5
NTE0ZjU0NmM2OTNkZGMxNDBmNzI5Zjk1OGMyNDc5MThhMTMzODBjY2NjNjA3ODM5MWFjYyIKLVNS
Q19VUklbc2hhMi0wLjEwLjguc2hhMjU2c3VtXSA9ICI3OTNkYjc1YWQyYmNhZmMzZmZhN2M2OGIy
MTVmZWUyNjhmNTM3OTgyY2Q5MDFkMTMyZjg5YzYzNDNmM2EzZGM4IgorU1JDX1VSSVtwb3J0YWJs
ZS1hdG9taWMtMS4xMS4xLnNoYTI1NnN1bV0gPSAiZjg0MjY3YjIwYTE2ZWE5MThlNDNjNmE4ODQz
M2MyZDU0ZmExNDVjOTJhODExYjViMDQ3Y2NiZTE1MzY3NDQ4MyIKK1NSQ19VUklbcHJvYy1tYWNy
bzItMS4wLjEwMS5zaGEyNTZzdW1dID0gIjg5YWU0M2ZkODZlNDE1OGQ2ZGI1MWFkOGUyYjgwZjMx
M2FmOWNjNzRmNWMwZTAzY2NiODdkZTA5OTk4NzMyZGUiCitTUkNfVVJJW3B5bzMtMC4yNi4wLnNo
YTI1NnN1bV0gPSAiN2JhMDExN2Y0MjEyMTAxZWU2NTQ0MDQ0ZGFlNDVhYmUxMDgzZDMwY2U3YjI5
YzRiNWNiZGZhMjM1NGUwNzM4MyIKK1NSQ19VUklbcHlvMy1idWlsZC1jb25maWctMC4yNi4wLnNo
YTI1NnN1bV0gPSAiNGZjNmRkYWYyNDk0N2QxMmE5YWEzMWFjNjU0MzFmYjFiODUxYjhmNDM2NTQy
NmUxODI5MDFlYWJmYjg3ZGY1ZiIKK1NSQ19VUklbcHlvMy1mZmktMC4yNi4wLnNoYTI1NnN1bV0g
PSAiMDI1NDc0ZDM5Mjg3MzhlZmIzOGFjMzZkNDc0NGE3NGE0MDBjOTAxYzc1OTYxOTllMjBlNDVk
OThlYjE5NDEwNSIKK1NSQ19VUklbcHlvMy1tYWNyb3MtMC4yNi4wLnNoYTI1NnN1bV0gPSAiMmU2
NGViNDg5ZjIyZmUxYzk1OTExYjc3YzQ0Y2M0MWU3YzE5ZjMwODJmYzgxY2NlOTBmNjU3Y2RjNDJm
ZmRlZCIKK1NSQ19VUklbcHlvMy1tYWNyb3MtYmFja2VuZC0wLjI2LjAuc2hhMjU2c3VtXSA9ICIx
MDAyNDZjMGVjZjQwMGI0NzUzNDFiODQ1NWE5MjEzMzQ0NTY5YWYyOWEzYzg0MWQyOTI3MGU1MzEw
MmUwZmNmIgorU1JDX1VSSVtxdW90ZS0xLjAuNDAuc2hhMjU2c3VtXSA9ICIxODg1YzAzOTU3MGRj
MDBkY2I0ZmYwODdhODllMTg1ZmQ1NmJhZTIzNGRkYzdmMDU2YTk0NWJmMzY0NjcyNDhkIgorU1JD
X1VSSVtyLWVmaS01LjMuMC5zaGEyNTZzdW1dID0gIjY5Y2RiMzRjMTU4Y2ViMjg4ZGYxMWUxOGI0
YmQzOWRlOTk0ZjY2NTdkODM4NDdiZGZmZGJkN2YzNDY3NTRiMGYiCitTUkNfVVJJW3NoYTItMC4x
MC45LnNoYTI1NnN1bV0gPSAiYTc1MDdkODE5NzY5ZDAxYTM2NWFiNzA3Nzk0YTQwODQzOTJjODI0
ZjU0YTdhNmE3ODYyZjhjM2QwODkyYjI4MyIKIFNSQ19VUklbc3VidGxlLTIuNi4xLnNoYTI1NnN1
bV0gPSAiMTNjMmJkZGVjYzU3YjM4NGRlZTE4NjUyMzU4ZmIyMzE3MmZhY2I4YTJjNTFjY2MxMGQ3
NGMxNTdiZGVhMzI5MiIKLVNSQ19VUklbc3luLTIuMC45OC5zaGEyNTZzdW1dID0gIjM2MTQ3ZjFh
NDhhZTBlYzJiNWIzYmM1YjUzN2QyNjc0NTc1NTVhMTBkYzA2ZjNkYmM4Y2IxMWJhMzAwNmQzYjEi
Ci1TUkNfVVJJW3RhcmdldC1sZXhpY29uLTAuMTIuMTYuc2hhMjU2c3VtXSA9ICI2MWM0MWFmMjdk
ZDZkMWUyN2IxYjE2YjQ4OWRiNzk4NDQzNDc4Y2VmMWYwNmE2NjBjOTZkYjYxN2JhNWRlM2IxIgor
U1JDX1VSSVtzeW4tMi4wLjEwNi5zaGEyNTZzdW1dID0gImVkZTdjNDM4MDI4ZDQ0MzZkNzExMDQ5
MTY5MTBmNWJiNjExOTcyYzVjZmQ3Zjg5YjgzMDBhODE4NmU2ZmFkYTYiCitTUkNfVVJJW3Rhcmdl
dC1sZXhpY29uLTAuMTMuMy5zaGEyNTZzdW1dID0gImRmN2Y2MjU3N2MyNWUwNzgzNDY0OWZjM2Iz
OWZhZmRjNTk3YzBhMzUyN2RjMWM2MDEyOTIwMWNjZmNiYWE1MGMiCiBTUkNfVVJJW3R5cGVudW0t
MS4xOC4wLnNoYTI1NnN1bV0gPSAiMWRjY2ZmZTNjZTA3YWY5Mzg2YmZkMjllODBjMGFiMWE4MjA1
YTJmYzM0ZTRiY2Q0MDM2NGRmOTAyY2ZhOGYzZiIKLVNSQ19VUklbdW5pY29kZS1pZGVudC0xLjAu
MTcuc2hhMjU2c3VtXSA9ICIwMGUyNDczYTkzNzc4ZWIwYmFkMzU5MDlkZmY2YTEwZDI4ZTYzZjc5
MmYxNmVkMTVlNDA0ZmNhOWQ1ZWVlZGJlIgotU1JDX1VSSVt1bmluZGVudC0wLjIuMy5zaGEyNTZz
dW1dID0gImM3ZGU3ZDczZTE3NTQ0ODdjYjU4MzY0ZWU5MDZhNDk5OTM3YTBkZmFiZDg2YmNiOTgw
ZmE5OWVjOGM4ZmEyY2UiCitTUkNfVVJJW3VuaWNvZGUtaWRlbnQtMS4wLjE5LnNoYTI1NnN1bV0g
PSAiZjYzYTU0NTQ4MTI5MTEzODkxMDU3NTEyOTQ4NmRhZWFmOGFjNTRhZWU0Mzg3ZmU3OTA2OTE5
Zjc4MzBjN2Q5ZCIKK1NSQ19VUklbdW5pbmRlbnQtMC4yLjQuc2hhMjU2c3VtXSA9ICI3MjY0ZTEw
N2Y1NTNjY2FlODc5ZDIxZmJlYTFkNjcyNGFjNzg1ZThjM2JmYzc2MjEzNzk1OWI1ODAyODI2ZWYz
IgogU1JDX1VSSVt2ZXJzaW9uX2NoZWNrLTAuOS41LnNoYTI1NnN1bV0gPSAiMGI5MjhmMzNkOTc1
ZmM2YWQ5Zjg2YzhmMjgzODUzYWQyNmJkZDViMTBiN2YxNTQyYWEyZmExNWUyMjg5MTA1YSIKLVNS
Q19VUklbd2FzaS0wLjEzLjMrd2FzaS0wLjIuMi5zaGEyNTZzdW1dID0gIjI2ODE2ZDJlMWE0YTM2
YTI5NDBiOTZjNTI5NmNlNDAzOTE3NjMzZGZmOGYzNDQwZTliMjM2ZWQ2ZjZiYWNhZDIiCi1TUkNf
VVJJW3dpbmRvd3MtdGFyZ2V0cy0wLjUyLjYuc2hhMjU2c3VtXSA9ICI5YjcyNGY3Mjc5NmUwMzZh
YjkwYzEwMjFkNDc4MGQ0ZDNkNjQ4YWNhNTllNDkxZTZiOThlNzI1Yjg0ZTk5OTczIgotU1JDX1VS
SVt3aW5kb3dzX2FhcmNoNjRfZ251bGx2bS0wLjUyLjYuc2hhMjU2c3VtXSA9ICIzMmE0NjIyMTgw
ZTdhMGVjMDQ0YmI1NTU0MDRjODAwYmM5ZmQ5ZWMyNjJlYzE0N2VkZDU5ODljY2QwYzAyY2QzIgot
U1JDX1VSSVt3aW5kb3dzX2FhcmNoNjRfbXN2Yy0wLjUyLjYuc2hhMjU2c3VtXSA9ICIwOWVjMmE3
YmIxNTJlMjI1MmI1M2ZhNzgwMzE1MDAwNzg3OTU0OGJjNzA5YzAzOWRmNzYyN2NhYmJkMDVkNDY5
IgotU1JDX1VSSVt3aW5kb3dzX2k2ODZfZ251LTAuNTIuNi5zaGEyNTZzdW1dID0gIjhlOWI1YWQ1
YWI4MDJlOTdlYjhlMjk1YWM2NzIwZTUwOWVlNGMyNDNmNjlkNzgxMzk0MDE0ZWJmZThiYmZhMGIi
Ci1TUkNfVVJJW3dpbmRvd3NfaTY4Nl9nbnVsbHZtLTAuNTIuNi5zaGEyNTZzdW1dID0gIjBlZWU1
MmQzOGMwOTBiM2NhYTc2YzU2M2I4NmMzYTRiZDcxZWYxYTgxOTI4N2MxOWQ1ODZkNzMzNGFlOGVk
NjYiCi1TUkNfVVJJW3dpbmRvd3NfaTY4Nl9tc3ZjLTAuNTIuNi5zaGEyNTZzdW1dID0gIjI0MDk0
OGJjMDVjNWU3YzZkYWJiYTI4YmY4OWQ4OWZmY2UzZTMwMzAyMjgwOWU3M2RlYWVmZTRmNmVjNTZj
NjYiCi1TUkNfVVJJW3dpbmRvd3NfeDg2XzY0X2dudS0wLjUyLjYuc2hhMjU2c3VtXSA9ICIxNDdh
NWM4MGFhYmZiZjBjN2Q5MDFjYjU4OTVkMWRlMzBlZjI5MDdlYjIxZmJiYWIyOWNhOTRjNWIwOGIx
YTc4IgotU1JDX1VSSVt3aW5kb3dzX3g4Nl82NF9nbnVsbHZtLTAuNTIuNi5zaGEyNTZzdW1dID0g
IjI0ZDViMjNkYzQxNzQxMjY3OTY4MTM5NmYyYjQ5ZjNkZThjMTQ3M2RlYjUxNmJkMzQ0MTA4NzJl
ZmY1MWVkMGQiCi1TUkNfVVJJW3dpbmRvd3NfeDg2XzY0X21zdmMtMC41Mi42LnNoYTI1NnN1bV0g
PSAiNTg5ZjZkYTg0YzY0NjIwNDc0N2QxMjcwYTJhNTY2MWVhNjZlZDFjY2VkMjYzMWQ1NDZmZGZi
MTU1OTU5ZjllYyIKLVNSQ19VUklbd2l0LWJpbmRnZW4tcnQtMC4zMy4wLnNoYTI1NnN1bV0gPSAi
MzI2OGYzZDg2NjQ1OGI3ODdmMzkwY2Y2MWY0YmJiNTYzYjkyMmQwOTEzNTlmOTYwODg0Mjk5OWVh
ZWUzOTQzYyIKK1NSQ19VUklbd2FzaS0wLjE0Ljcrd2FzaS0wLjIuNC5zaGEyNTZzdW1dID0gIjg4
MzQ3OGRlMjAzNjdlMjI0YzAwOTBhZjljZjVmOWZhODViZWQ2M2E5NWMxYWJmM2FmYzVjMDgzZWJj
MDZlOGMiCitTUkNfVVJJW3dhc2lwMi0xLjAuMSt3YXNpLTAuMi40LnNoYTI1NnN1bV0gPSAiMDU2
MjQyODQyMmM2Mzc3M2RhZDJjMzQ1YTE4ODIyNjNiYmY0ZDY1Y2YzZjQyZTkwOTIxZjc4N2VmNWFk
NThlNyIKK1NSQ19VUklbd2l0LWJpbmRnZW4tMC40Ni4wLnNoYTI1NnN1bV0gPSAiZjE3YTg1ODgz
ZDRlNmQwMGU4YTk3YzU4NmRlNzY0ZGFiY2MwNjEzM2Y3ZjFkNTVkY2U1Y2RjMDcwYWQ3ZmU1OSIK
IFNSQ19VUklbemVyb2l6ZS0xLjguMS5zaGEyNTZzdW1dID0gImNlZDM2NzhhMjg3OWIzMDMwNmQz
MjNmNDU0MjYyNjY5N2E0NjRhOTdjMGEwN2M5YWViZjdlYmNhNjVjZDRkZGUiCmRpZmYgLS1naXQg
YS9tZXRhL3JlY2lwZXMtZGV2dG9vbHMvcHl0aG9uL3B5dGhvbjMtYmNyeXB0XzQuMy4wLmJiIGIv
bWV0YS9yZWNpcGVzLWRldnRvb2xzL3B5dGhvbi9weXRob24zLWJjcnlwdF81LjAuMC5iYgpzaW1p
bGFyaXR5IGluZGV4IDg2JQpyZW5hbWUgZnJvbSBtZXRhL3JlY2lwZXMtZGV2dG9vbHMvcHl0aG9u
L3B5dGhvbjMtYmNyeXB0XzQuMy4wLmJiCnJlbmFtZSB0byBtZXRhL3JlY2lwZXMtZGV2dG9vbHMv
cHl0aG9uL3B5dGhvbjMtYmNyeXB0XzUuMC4wLmJiCmluZGV4IDkzMWFhZTQzMTAuLjYzOTdlY2Q4
MTggMTAwNjQ0Ci0tLSBhL21ldGEvcmVjaXBlcy1kZXZ0b29scy9weXRob24vcHl0aG9uMy1iY3J5
cHRfNC4zLjAuYmIKKysrIGIvbWV0YS9yZWNpcGVzLWRldnRvb2xzL3B5dGhvbi9weXRob24zLWJj
cnlwdF81LjAuMC5iYgpAQCAtNiw3ICs2LDcgQEAgSE9NRVBBR0UgPSAiaHR0cHM6Ly9weXBpLm9y
Zy9wcm9qZWN0L2JjcnlwdC8iCiBERVBFTkRTICs9ICJweXRob24zLWNmZmktbmF0aXZlIgogTERG
TEFHUyArPSAiJHtAYmIudXRpbHMuY29udGFpbnMoJ0RJU1RST19GRUFUVVJFUycsICdwdGVzdCcs
ICctZnVzZS1sZD1iZmQnLCAnJywgZCl9IgogCi1TUkNfVVJJW3NoYTI1NnN1bV0gPSAiM2EzZmQy
MjA0MTc4YjZkMmFkY2YwOWNiNGY2NDI2ZmZlZjU0NzYyNTc3YTdjOWI1NGMxNTkwMDhjYjI4OGMx
OCIKK1NSQ19VUklbc2hhMjU2c3VtXSA9ICJmNzQ4ZjdjMmQ2ZmQzNzVjYzkzZDNmYmE3ZWY0YTll
M2EwOTI0MjFiOGRiZjM0ZDhkNGRjMDZiZTk0OTJkZmRkIgogCiBpbmhlcml0IHB5cGkgcHl0aG9u
X3NldHVwdG9vbHMzX3J1c3QgY2FyZ28tdXBkYXRlLXJlY2lwZS1jcmF0ZXMgcHRlc3QtcHl0aG9u
LXB5dGVzdAogCi0tIAoyLjQ3LjEKCg==

--===============6613382397031854162==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: attachment; filename="bitbake-output-qemuarm_musl.txt"

NOTE: Reconnecting to bitbake server...
Loading cache...done.
Loaded 0 entries from dependency cache.
Parsing recipes...done.
Parsing of 947 .bb files complete (0 cached, 947 parsed). 1945 targets, 54 skipped, 0 masked, 0 errors.
Removing 92 recipes from the qemux86_64 sysroot...done.
Removing 68 recipes from the x86-64-v3 sysroot...done.
NOTE: Resolving any missing task queue dependencies

Build Configuration:
BB_VERSION           = "2.15.2"
BUILD_SYS            = "x86_64-linux"
NATIVELSBSTRING      = "universal"
TARGET_SYS           = "x86_64-poky-linux-musl"
MACHINE              = "qemux86-64"
DISTRO               = "poky"
DISTRO_VERSION       = "5.2.99+snapshot-74785efbecbbb9485442acb24593cf7931b817b2"
TUNE_FEATURES        = "m64 x86-64-v3"
TARGET_FPU           = ""
meta                 = "tmp-auh-upgrades:74785efbecbbb9485442acb24593cf7931b817b2"
meta-yocto-bsp       
meta-poky            = "master:66ea31cee15309af07afeee8dec8a6fe1d92d28e"
workspace            = "<unknown>:<unknown>"

Initialising tasks...NOTE: The /proc/pressure files can't be read. Continuing build without monitoring pressure
Sstate summary: Wanted 534 Local 521 Mirrors 0 Missed 13 Current 284 (97% match, 98% complete)
Removing 2 stale sstate objects for arch qemux86_64...done.
Removing 5 stale sstate objects for arch x86_64...done.
NOTE: Executing Tasks
NOTE: Running setscene task 288 of 818 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-devtools/python/python3-unittest-automake-output_0.3.bb:do_package_write_deb_setscene)
NOTE: Running setscene task 292 of 818 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-devtools/python/python3_3.13.9.bb:do_package_write_deb_setscene)
NOTE: Running setscene task 293 of 818 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-devtools/python/python3-cffi_1.17.1.bb:do_package_write_ipk_setscene)
NOTE: Running setscene task 296 of 818 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-devtools/python/python3-pytest_8.4.2.bb:do_package_write_rpm_setscene)
NOTE: Running setscene task 301 of 818 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-devtools/python/python3_3.13.9.bb:do_package_write_ipk_setscene)
NOTE: Running setscene task 302 of 818 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-devtools/python/python3_3.13.9.bb:do_package_write_rpm_setscene)
NOTE: Running setscene task 310 of 818 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-support/ptest-runner/ptest-runner_2.4.5.1.bb:do_package_write_deb_setscene)
NOTE: Running setscene task 311 of 818 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-devtools/python/python3-unittest-automake-output_0.3.bb:do_package_qa_setscene)
NOTE: Running setscene task 313 of 818 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-support/ptest-runner/ptest-runner_2.4.5.1.bb:do_package_write_rpm_setscene)
NOTE: Running setscene task 315 of 818 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-devtools/python/python3-bcrypt_5.0.0.bb:do_populate_lic_setscene)
NOTE: Running setscene task 322 of 818 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-devtools/python/python3-pytest_8.4.2.bb:do_package_write_deb_setscene)
NOTE: Running setscene task 336 of 818 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-devtools/python/python3-unittest-automake-output_0.3.bb:do_package_write_rpm_setscene)
NOTE: Running setscene task 349 of 818 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-devtools/python/python3_3.13.9.bb:do_package_qa_setscene)
NOTE: Running setscene task 356 of 818 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-devtools/python/python3-pytest_8.4.2.bb:do_package_qa_setscene)
NOTE: Running setscene task 357 of 818 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-support/ptest-runner/ptest-runner_2.4.5.1.bb:do_package_write_ipk_setscene)
NOTE: Running setscene task 359 of 818 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-devtools/python/python3-pytest_8.4.2.bb:do_package_write_ipk_setscene)
NOTE: recipe python3-unittest-automake-output-0.3-r0: task do_package_write_deb_setscene: Started
NOTE: recipe ptest-runner-2.4.5.1-r0: task do_package_write_deb_setscene: Started
NOTE: recipe python3-pytest-8.4.2-r0: task do_package_write_rpm_setscene: Started
NOTE: recipe ptest-runner-2.4.5.1-r0: task do_package_write_rpm_setscene: Started
NOTE: recipe python3-cffi-1.17.1-r0: task do_package_write_ipk_setscene: Started
NOTE: recipe python3-unittest-automake-output-0.3-r0: task do_package_qa_setscene: Started
NOTE: recipe python3-unittest-automake-output-0.3-r0: task do_package_write_rpm_setscene: Started
NOTE: recipe python3-pytest-8.4.2-r0: task do_package_write_deb_setscene: Started
NOTE: recipe ptest-runner-2.4.5.1-r0: task do_package_write_ipk_setscene: Started
NOTE: recipe python3-pytest-8.4.2-r0: task do_package_qa_setscene: Started
NOTE: recipe python3-pytest-8.4.2-r0: task do_package_write_ipk_setscene: Started
NOTE: recipe python3-bcrypt-5.0.0-r0: task do_populate_lic_setscene: Started
NOTE: recipe python3-3.13.9-r0: task do_package_write_deb_setscene: Started
NOTE: recipe python3-3.13.9-r0: task do_package_write_ipk_setscene: Started
NOTE: recipe python3-3.13.9-r0: task do_package_write_rpm_setscene: Started
NOTE: recipe python3-3.13.9-r0: task do_package_qa_setscene: Started
NOTE: recipe python3-unittest-automake-output-0.3-r0: task do_package_qa_setscene: Succeeded
NOTE: Running setscene task 361 of 818 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-support/ptest-runner/ptest-runner_2.4.5.1.bb:do_package_qa_setscene)
NOTE: recipe ptest-runner-2.4.5.1-r0: task do_package_write_deb_setscene: Succeeded
NOTE: recipe ptest-runner-2.4.5.1-r0: task do_package_write_rpm_setscene: Succeeded
NOTE: recipe python3-unittest-automake-output-0.3-r0: task do_package_write_deb_setscene: Succeeded
NOTE: recipe python3-pytest-8.4.2-r0: task do_package_write_rpm_setscene: Succeeded
NOTE: Running setscene task 364 of 818 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-devtools/python/python3-cffi_1.17.1.bb:do_package_qa_setscene)
NOTE: recipe python3-pytest-8.4.2-r0: task do_package_qa_setscene: Succeeded
NOTE: recipe ptest-runner-2.4.5.1-r0: task do_package_write_ipk_setscene: Succeeded
NOTE: Running setscene task 372 of 818 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-devtools/python/python3-cffi_1.17.1.bb:do_package_write_rpm_setscene)
NOTE: Running setscene task 375 of 818 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-devtools/python/python3-unittest-automake-output_0.3.bb:do_package_write_ipk_setscene)
NOTE: Running setscene task 391 of 818 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-support/ptest-runner/ptest-runner_2.4.5.1.bb:do_create_spdx_setscene)
NOTE: Running setscene task 393 of 818 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-devtools/python/python3-cffi_1.17.1.bb:do_package_write_deb_setscene)
NOTE: Running setscene task 394 of 818 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-devtools/python/python3-pytest_8.4.2.bb:do_create_spdx_setscene)
NOTE: recipe python3-pytest-8.4.2-r0: task do_package_write_ipk_setscene: Succeeded
NOTE: recipe python3-pytest-8.4.2-r0: task do_package_write_deb_setscene: Succeeded
NOTE: Running setscene task 398 of 818 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-devtools/python/python3-unittest-automake-output_0.3.bb:do_create_spdx_setscene)
NOTE: Running setscene task 399 of 818 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-devtools/python/python3-cffi_1.17.1.bb:do_create_spdx_setscene)
NOTE: recipe python3-bcrypt-5.0.0-r0: task do_populate_lic_setscene: Succeeded
NOTE: recipe python3-unittest-automake-output-0.3-r0: task do_package_write_rpm_setscene: Succeeded
NOTE: Running setscene task 400 of 818 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-devtools/python/python3-packaging_25.0.bb:do_packagedata_setscene)
NOTE: Running setscene task 401 of 818 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-devtools/python/python3-iniconfig_2.1.0.bb:do_packagedata_setscene)
NOTE: recipe python3-cffi-1.17.1-r0: task do_package_write_ipk_setscene: Succeeded
NOTE: recipe python3-3.13.9-r0: task do_package_qa_setscene: Succeeded
NOTE: Running setscene task 402 of 818 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-devtools/rust/libstd-rs_1.90.0.bb:do_create_spdx_setscene)
NOTE: Running setscene task 404 of 818 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-devtools/python/python3-pluggy_1.6.0.bb:do_packagedata_setscene)
NOTE: recipe ptest-runner-2.4.5.1-r0: task do_package_qa_setscene: Started
NOTE: recipe python3-unittest-automake-output-0.3-r0: task do_package_write_ipk_setscene: Started
NOTE: recipe python3-cffi-1.17.1-r0: task do_package_qa_setscene: Started
NOTE: recipe ptest-runner-2.4.5.1-r0: task do_create_spdx_setscene: Started
NOTE: recipe python3-cffi-1.17.1-r0: task do_package_write_rpm_setscene: Started
NOTE: recipe python3-pytest-8.4.2-r0: task do_create_spdx_setscene: Started
NOTE: recipe python3-cffi-1.17.1-r0: task do_package_write_deb_setscene: Started
NOTE: recipe python3-unittest-automake-output-0.3-r0: task do_create_spdx_setscene: Started
NOTE: recipe python3-cffi-1.17.1-r0: task do_create_spdx_setscene: Started
NOTE: recipe python3-iniconfig-2.1.0-r0: task do_packagedata_setscene: Started
NOTE: recipe python3-packaging-25.0-r0: task do_packagedata_setscene: Started
NOTE: recipe python3-pluggy-1.6.0-r0: task do_packagedata_setscene: Started
NOTE: recipe libstd-rs-1.90.0-r0: task do_create_spdx_setscene: Started
NOTE: recipe python3-cffi-1.17.1-r0: task do_package_qa_setscene: Succeeded
NOTE: recipe ptest-runner-2.4.5.1-r0: task do_package_qa_setscene: Succeeded
NOTE: Running setscene task 407 of 818 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-devtools/python/python3-colorama_0.4.6.bb:do_packagedata_setscene)
NOTE: Running setscene task 408 of 818 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-devtools/python/python3-pygments_2.19.2.bb:do_packagedata_setscene)
NOTE: recipe python3-unittest-automake-output-0.3-r0: task do_package_write_ipk_setscene: Succeeded
NOTE: recipe python3-3.13.9-r0: task do_package_write_deb_setscene: Succeeded
NOTE: recipe ptest-runner-2.4.5.1-r0: task do_create_spdx_setscene: Succeeded
NOTE: Running setscene task 409 of 818 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-devtools/python/python3-bcrypt_5.0.0.bb:do_deploy_source_date_epoch_setscene)
NOTE: Running setscene task 410 of 818 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-extended/psmisc/psmisc_23.7.bb:do_packagedata_setscene)
NOTE: recipe python3-pytest-8.4.2-r0: task do_create_spdx_setscene: Succeeded
NOTE: recipe python3-unittest-automake-output-0.3-r0: task do_create_spdx_setscene: Succeeded
NOTE: recipe python3-cffi-1.17.1-r0: task do_package_write_rpm_setscene: Succeeded
NOTE: recipe python3-3.13.9-r0: task do_package_write_ipk_setscene: Succeeded
NOTE: recipe python3-cffi-1.17.1-r0: task do_package_write_deb_setscene: Succeeded
NOTE: recipe python3-cffi-1.17.1-r0: task do_create_spdx_setscene: Succeeded
NOTE: Running setscene task 419 of 818 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-devtools/python/python3-pytest_8.4.2.bb:do_packagedata_setscene)
NOTE: Running setscene task 421 of 818 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-devtools/python/python3-cffi_1.17.1.bb:do_packagedata_setscene)
NOTE: Running setscene task 423 of 818 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-devtools/python/python3-unittest-automake-output_0.3.bb:do_packagedata_setscene)
NOTE: Running setscene task 425 of 818 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-devtools/python/python3-setuptools_80.9.0.bb:do_packagedata_setscene)
NOTE: Running setscene task 428 of 818 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-devtools/python/python3_3.13.9.bb:do_create_spdx_setscene)
NOTE: recipe python3-iniconfig-2.1.0-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe libstd-rs-1.90.0-r0: task do_create_spdx_setscene: Succeeded
NOTE: recipe python3-packaging-25.0-r0: task do_packagedata_setscene: Succeeded
NOTE: Running setscene task 433 of 818 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-devtools/rust/libstd-rs_1.90.0.bb:do_packagedata_setscene)
NOTE: Running setscene task 434 of 818 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-devtools/rust/libstd-rs_1.90.0.bb:do_populate_sysroot_setscene)
NOTE: recipe python3-colorama-0.4.6-r0: task do_packagedata_setscene: Started
NOTE: recipe python3-3.13.9-r0: task do_package_write_rpm_setscene: Succeeded
NOTE: recipe python3-pluggy-1.6.0-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe python3-pygments-2.19.2-r0: task do_packagedata_setscene: Started
NOTE: Running setscene task 442 of 818 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-support/ptest-runner/ptest-runner_2.4.5.1.bb:do_packagedata_setscene)
NOTE: Running setscene task 443 of 818 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-extended/unzip/unzip_6.0.bb:do_packagedata_setscene)
NOTE: Running setscene task 444 of 818 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-extended/sed/sed_4.9.bb:do_packagedata_setscene)
NOTE: Running setscene task 445 of 818 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-core/musl/musl-locales_git.bb:do_packagedata_setscene)
NOTE: Running setscene task 446 of 818 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-devtools/binutils/binutils_2.45.bb:do_packagedata_setscene)
NOTE: recipe psmisc-23.7-r0: task do_packagedata_setscene: Started
NOTE: recipe python3-bcrypt-5.0.0-r0: task do_deploy_source_date_epoch_setscene: Started
NOTE: recipe python3-pytest-8.4.2-r0: task do_packagedata_setscene: Started
NOTE: recipe python3-unittest-automake-output-0.3-r0: task do_packagedata_setscene: Started
NOTE: recipe python3-setuptools-80.9.0-r0: task do_packagedata_setscene: Started
NOTE: recipe python3-cffi-1.17.1-r0: task do_packagedata_setscene: Started
NOTE: recipe libstd-rs-1.90.0-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe libstd-rs-1.90.0-r0: task do_packagedata_setscene: Started
NOTE: recipe ptest-runner-2.4.5.1-r0: task do_packagedata_setscene: Started
NOTE: recipe unzip-1_6.0-r0: task do_packagedata_setscene: Started
NOTE: recipe sed-4.9-r0: task do_packagedata_setscene: Started
NOTE: recipe musl-locales-1.0+git-r0: task do_packagedata_setscene: Started
NOTE: recipe python3-bcrypt-5.0.0-r0: task do_deploy_source_date_epoch_setscene: Succeeded
NOTE: recipe binutils-2.45-r0: task do_packagedata_setscene: Started
NOTE: Running setscene task 447 of 818 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-extended/bash/bash_5.3.bb:do_packagedata_setscene)
NOTE: recipe python3-3.13.9-r0: task do_create_spdx_setscene: Started
NOTE: recipe python3-pygments-2.19.2-r0: task do_packagedata_setscene: Succeeded
NOTE: Running setscene task 448 of 818 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-devtools/gcc/gcc_15.2.bb:do_packagedata_setscene)
NOTE: recipe python3-colorama-0.4.6-r0: task do_packagedata_setscene: Succeeded
NOTE: Running setscene task 449 of 818 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-core/coreutils/coreutils_9.7.bb:do_packagedata_setscene)
NOTE: recipe python3-unittest-automake-output-0.3-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe python3-pytest-8.4.2-r0: task do_packagedata_setscene: Succeeded
NOTE: Running setscene task 450 of 818 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-support/ca-certificates/ca-certificates_20250419.bb:do_packagedata_setscene)
NOTE: Running setscene task 451 of 818 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-extended/timezone/tzdata.bb:do_packagedata_setscene)
NOTE: recipe python3-cffi-1.17.1-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe python3-setuptools-80.9.0-r0: task do_packagedata_setscene: Succeeded
NOTE: Running setscene task 456 of 818 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-devtools/python/python3-bcrypt_5.0.0.bb:do_recipe_qa_setscene)
NOTE: Running setscene task 463 of 818 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-devtools/python/python3-cffi_1.17.1.bb:do_recipe_qa_setscene)
NOTE: recipe ptest-runner-2.4.5.1-r0: task do_packagedata_setscene: Succeeded
NOTE: Running setscene task 466 of 818 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-devtools/python/python3-pycparser_2.22.bb:do_packagedata_setscene)
NOTE: recipe unzip-1_6.0-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe bash-5.3-r0: task do_packagedata_setscene: Started
NOTE: recipe python3-3.13.9-r0: task do_create_spdx_setscene: Succeeded
NOTE: Running setscene task 476 of 818 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-devtools/python/python3-pytest_8.4.2.bb:do_recipe_qa_setscene)
NOTE: Running setscene task 486 of 818 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-core/base-passwd/base-passwd_3.6.7.bb:do_packagedata_setscene)
NOTE: recipe libstd-rs-1.90.0-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe ca-certificates-20250419-r0: task do_packagedata_setscene: Started
NOTE: recipe gcc-15.2.0-r0: task do_packagedata_setscene: Started
NOTE: Running setscene task 488 of 818 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-support/libunwind/libunwind_1.8.3.bb:do_packagedata_setscene)
NOTE: recipe psmisc-23.7-r0: task do_packagedata_setscene: Succeeded
NOTE: Running setscene task 490 of 818 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-extended/shadow/shadow_4.18.0.bb:do_packagedata_setscene)
NOTE: recipe tzdata-2025b-r0: task do_packagedata_setscene: Started
NOTE: recipe coreutils-9.7-r0: task do_packagedata_setscene: Started
NOTE: recipe python3-cffi-1.17.1-r0: task do_recipe_qa_setscene: Started
NOTE: recipe python3-pycparser-2.22-r0: task do_packagedata_setscene: Started
NOTE: recipe python3-pytest-8.4.2-r0: task do_recipe_qa_setscene: Started
NOTE: recipe python3-bcrypt-5.0.0-r0: task do_recipe_qa_setscene: Started
NOTE: recipe base-passwd-3.6.7-r0: task do_packagedata_setscene: Started
NOTE: recipe musl-locales-1.0+git-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe libunwind-1.8.3-r0: task do_packagedata_setscene: Started
NOTE: Running setscene task 499 of 818 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-devtools/python/python3-unittest-automake-output_0.3.bb:do_recipe_qa_setscene)
NOTE: recipe binutils-2.45-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe shadow-4.18.0-r0: task do_packagedata_setscene: Started
NOTE: recipe ca-certificates-20250419-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe python3-cffi-1.17.1-r0: task do_recipe_qa_setscene: Succeeded
NOTE: Running setscene task 503 of 818 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-core/base-files/base-files_3.0.14.bb:do_deploy_source_date_epoch_setscene)
NOTE: Running setscene task 504 of 818 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-support/ptest-runner/ptest-runner_2.4.5.1.bb:do_recipe_qa_setscene)
NOTE: Running setscene task 513 of 818 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-devtools/elfutils/elfutils_0.193.bb:do_packagedata_setscene)
NOTE: recipe sed-4.9-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe python3-bcrypt-5.0.0-r0: task do_recipe_qa_setscene: Succeeded
NOTE: Running setscene task 522 of 818 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-devtools/gcc/gcc-runtime_15.2.bb:do_create_spdx_setscene)
NOTE: recipe tzdata-2025b-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe python3-pytest-8.4.2-r0: task do_recipe_qa_setscene: Succeeded
NOTE: recipe python3-pycparser-2.22-r0: task do_packagedata_setscene: Succeeded
NOTE: Running setscene task 534 of 818 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-devtools/python/python3_3.13.9.bb:do_packagedata_setscene)
NOTE: Running setscene task 536 of 818 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-devtools/python/python3_3.13.9.bb:do_populate_sysroot_setscene)
NOTE: recipe base-passwd-3.6.7-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe python3-unittest-automake-output-0.3-r0: task do_recipe_qa_setscene: Started
NOTE: recipe base-files-3.0.14-r0: task do_deploy_source_date_epoch_setscene: Started
NOTE: recipe ptest-runner-2.4.5.1-r0: task do_recipe_qa_setscene: Started
NOTE: recipe libunwind-1.8.3-r0: task do_packagedata_setscene: Succeeded
NOTE: Running setscene task 543 of 818 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-core/musl/libucontext_1.3.2.bb:do_packagedata_setscene)
NOTE: recipe elfutils-0.193-r0: task do_packagedata_setscene: Started
NOTE: recipe gcc-15.2.0-r0: task do_packagedata_setscene: Succeeded
NOTE: Running setscene task 546 of 818 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-support/libmpc/libmpc_1.3.1.bb:do_packagedata_setscene)
NOTE: recipe gcc-runtime-15.2.0-r0: task do_create_spdx_setscene: Started
NOTE: recipe bash-5.3-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe python3-unittest-automake-output-0.3-r0: task do_recipe_qa_setscene: Succeeded
NOTE: recipe base-files-3.0.14-r0: task do_deploy_source_date_epoch_setscene: Succeeded
NOTE: Running setscene task 552 of 818 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-core/base-files/base-files_3.0.14.bb:do_recipe_qa_setscene)
NOTE: recipe ptest-runner-2.4.5.1-r0: task do_recipe_qa_setscene: Succeeded
NOTE: recipe libucontext-1.3.2-r0: task do_packagedata_setscene: Started
NOTE: recipe python3-3.13.9-r0: task do_packagedata_setscene: Started
NOTE: recipe python3-3.13.9-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe coreutils-9.7-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe gcc-runtime-15.2.0-r0: task do_create_spdx_setscene: Succeeded
NOTE: recipe libmpc-1.3.1-r0: task do_packagedata_setscene: Started
NOTE: Running setscene task 557 of 818 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-core/musl/musl_git.bb:do_create_spdx_setscene)
NOTE: recipe base-files-3.0.14-r0: task do_recipe_qa_setscene: Started
NOTE: recipe libstd-rs-1.90.0-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: Running setscene task 559 of 818 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-devtools/rust/libstd-rs_1.90.0.bb:do_recipe_qa_setscene)
NOTE: Running setscene task 560 of 818 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-support/libunwind/libunwind_1.8.3.bb:do_populate_sysroot_setscene)
NOTE: recipe shadow-4.18.0-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe elfutils-0.193-r0: task do_packagedata_setscene: Succeeded
NOTE: Running setscene task 566 of 818 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-extended/libarchive/libarchive_3.8.2.bb:do_packagedata_setscene)
NOTE: Running setscene task 568 of 818 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-core/musl/musl-obstack.bb:do_packagedata_setscene)
NOTE: Running setscene task 570 of 818 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-devtools/json-c/json-c_0.18.bb:do_packagedata_setscene)
NOTE: Running setscene task 572 of 818 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-support/argp-standalone/argp-standalone_1.4.1.bb:do_packagedata_setscene)
NOTE: Running setscene task 573 of 818 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-support/libmicrohttpd/libmicrohttpd_1.0.2.bb:do_packagedata_setscene)
NOTE: Running setscene task 575 of 818 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-core/fts/fts_1.2.7.bb:do_packagedata_setscene)
NOTE: Running setscene task 576 of 818 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-core/musl/musl-legacy-error.bb:do_packagedata_setscene)
NOTE: recipe musl-1.2.5+git-r0: task do_create_spdx_setscene: Started
NOTE: recipe libucontext-1.3.2-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe base-files-3.0.14-r0: task do_recipe_qa_setscene: Succeeded
NOTE: recipe libmpc-1.3.1-r0: task do_packagedata_setscene: Succeeded
NOTE: Running setscene task 584 of 818 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-support/mpfr/mpfr_4.2.2.bb:do_packagedata_setscene)
NOTE: recipe libunwind-1.8.3-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe libstd-rs-1.90.0-r0: task do_recipe_qa_setscene: Started
NOTE: recipe musl-obstack-1.2.3-r0: task do_packagedata_setscene: Started
NOTE: recipe libarchive-3.8.2-r0: task do_packagedata_setscene: Started
NOTE: recipe argp-standalone-1.4.1-r0: task do_packagedata_setscene: Started
NOTE: recipe musl-legacy-error-1.0-r0: task do_packagedata_setscene: Started
NOTE: recipe fts-1.2.7-r0: task do_packagedata_setscene: Started
NOTE: recipe json-c-0.18-r0: task do_packagedata_setscene: Started
NOTE: recipe libmicrohttpd-1.0.2-r0: task do_packagedata_setscene: Started
NOTE: recipe musl-1.2.5+git-r0: task do_create_spdx_setscene: Succeeded
NOTE: Running setscene task 590 of 818 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-devtools/gcc/gcc-cross_15.2.bb:do_create_spdx_setscene)
NOTE: recipe libstd-rs-1.90.0-r0: task do_recipe_qa_setscene: Succeeded
NOTE: recipe mpfr-4.2.2-r0: task do_packagedata_setscene: Started
NOTE: Running task 899 of 2310 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-devtools/python/python3-bcrypt_5.0.0.bb:do_fetch)
NOTE: Running task 964 of 2310 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-core/base-files/base-files_3.0.14.bb:do_fetch)
NOTE: recipe libunwind-1.8.3-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: Running setscene task 591 of 818 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-core/musl/libucontext_1.3.2.bb:do_populate_sysroot_setscene)
NOTE: recipe gcc-cross-x86_64-15.2.0-r0: task do_create_spdx_setscene: Started
NOTE: Running setscene task 593 of 818 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-support/libunwind/libunwind_1.8.3.bb:do_recipe_qa_setscene)
NOTE: recipe musl-obstack-1.2.3-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe musl-legacy-error-1.0-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe argp-standalone-1.4.1-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe fts-1.2.7-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe libarchive-3.8.2-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe libmicrohttpd-1.0.2-r0: task do_packagedata_setscene: Succeeded
NOTE: Running setscene task 603 of 818 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-support/attr/acl_2.3.2.bb:do_packagedata_setscene)
NOTE: recipe json-c-0.18-r0: task do_packagedata_setscene: Succeeded
NOTE: Running setscene task 616 of 818 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-support/libgcrypt/libgcrypt_1.11.2.bb:do_packagedata_setscene)
NOTE: Running setscene task 618 of 818 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-devtools/file/file_5.46.bb:do_packagedata_setscene)
NOTE: Running setscene task 621 of 818 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-support/curl/curl_8.17.0.bb:do_packagedata_setscene)
NOTE: Running setscene task 622 of 818 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-support/gnutls/gnutls_3.8.10.bb:do_packagedata_setscene)
NOTE: recipe base-files-3.0.14-r0: task do_fetch: Started
NOTE: recipe mpfr-4.2.2-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe python3-3.13.9-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe python3-bcrypt-5.0.0-r0: task do_fetch: Started
NOTE: Running setscene task 631 of 818 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-support/gdbm/gdbm_1.26.bb:do_packagedata_setscene)
NOTE: Running setscene task 632 of 818 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-devtools/libedit/libedit_20250104-3.1.bb:do_packagedata_setscene)
NOTE: Running setscene task 633 of 818 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-support/libffi/libffi_3.5.2.bb:do_packagedata_setscene)
NOTE: Running setscene task 634 of 818 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-support/sqlite/sqlite3_3.48.0.bb:do_packagedata_setscene)
NOTE: Running setscene task 635 of 818 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-core/expat/expat_2.7.3.bb:do_packagedata_setscene)
NOTE: recipe base-files-3.0.14-r0: task do_fetch: Succeeded
NOTE: Running setscene task 636 of 818 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-core/util-linux/util-linux-libuuid_2.41.1.bb:do_packagedata_setscene)
NOTE: recipe gcc-cross-x86_64-15.2.0-r0: task do_create_spdx_setscene: Succeeded
NOTE: recipe python3-3.13.9-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: recipe libunwind-1.8.3-r0: task do_recipe_qa_setscene: Started
NOTE: recipe libucontext-1.3.2-r0: task do_populate_sysroot_setscene: Started
NOTE: Running setscene task 641 of 818 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-support/sqlite/sqlite3_3.48.0.bb:do_populate_sysroot_setscene)
NOTE: recipe python3-bcrypt-5.0.0-r0: task do_fetch: Succeeded
NOTE: Running setscene task 642 of 818 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-support/libffi/libffi_3.5.2.bb:do_populate_sysroot_setscene)
NOTE: Running setscene task 643 of 818 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-core/util-linux/util-linux-libuuid_2.41.1.bb:do_populate_sysroot_setscene)
NOTE: recipe acl-2.3.2-r0: task do_packagedata_setscene: Started
NOTE: recipe file-5.46-r0: task do_packagedata_setscene: Started
NOTE: recipe libgcrypt-1.11.2-r0: task do_packagedata_setscene: Started
NOTE: recipe curl-8.17.0-r0: task do_packagedata_setscene: Started
NOTE: recipe gnutls-3.8.10-r0: task do_packagedata_setscene: Started
NOTE: recipe libedit-20250104-3.1-r1: task do_packagedata_setscene: Started
NOTE: recipe libunwind-1.8.3-r0: task do_recipe_qa_setscene: Succeeded
NOTE: recipe libffi-3.5.2-r0: task do_packagedata_setscene: Started
NOTE: recipe gdbm-1.26-r0: task do_packagedata_setscene: Started
NOTE: recipe sqlite3-3_3.48.0-r0: task do_packagedata_setscene: Started
NOTE: Running setscene task 644 of 818 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-core/expat/expat_2.7.3.bb:do_populate_sysroot_setscene)
NOTE: recipe util-linux-libuuid-2.41.1-r0: task do_packagedata_setscene: Started
NOTE: recipe expat-2.7.3-r0: task do_packagedata_setscene: Started
NOTE: recipe sqlite3-3_3.48.0-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe libffi-3.5.2-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe util-linux-libuuid-2.41.1-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe file-5.46-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe libgcrypt-1.11.2-r0: task do_packagedata_setscene: Succeeded
NOTE: Running setscene task 645 of 818 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-devtools/libedit/libedit_20250104-3.1.bb:do_populate_sysroot_setscene)
NOTE: Running setscene task 646 of 818 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-support/gdbm/gdbm_1.26.bb:do_populate_sysroot_setscene)
NOTE: recipe curl-8.17.0-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe libucontext-1.3.2-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: Running setscene task 648 of 818 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-devtools/python/python3_3.13.9.bb:do_recipe_qa_setscene)
NOTE: recipe expat-2.7.3-r0: task do_populate_sysroot_setscene: Started
NOTE: Running setscene task 654 of 818 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-extended/lzip/lzlib_1.15.bb:do_packagedata_setscene)
NOTE: recipe acl-2.3.2-r0: task do_packagedata_setscene: Succeeded
NOTE: Running setscene task 656 of 818 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-connectivity/openssl/openssl_3.5.4.bb:do_packagedata_setscene)
WARNING: Logfile for failed setscene task is /srv/pokybuild/yocto-worker/auh/build/build/tmp/work/x86-64-v3-poky-linux-musl/libedit/20250104-3.1/temp/log.do_packagedata_setscene.2109111
WARNING: Setscene task (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-devtools/libedit/libedit_20250104-3.1.bb:do_packagedata_setscene) failed with exit code '1' - real task will be run instead
NOTE: Running setscene task 657 of 818 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-devtools/libedit/libedit_20250104-3.1.bb:do_package_setscene)
NOTE: recipe sqlite3-3_3.48.0-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe util-linux-libuuid-2.41.1-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe libffi-3.5.2-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe libedit-20250104-3.1-r1: task do_populate_sysroot_setscene: Started
NOTE: recipe libffi-3.5.2-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: recipe sqlite3-3_3.48.0-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: recipe util-linux-libuuid-2.41.1-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: recipe gdbm-1.26-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe expat-2.7.3-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe lzlib-1.15-r0: task do_packagedata_setscene: Started
NOTE: recipe gnutls-3.8.10-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe gdbm-1.26-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe openssl-3.5.4-r0: task do_packagedata_setscene: Started
NOTE: recipe python3-3.13.9-r0: task do_recipe_qa_setscene: Started
NOTE: recipe expat-2.7.3-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: recipe lzlib-1.15-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe libedit-20250104-3.1-r1: task do_populate_sysroot_setscene: Succeeded
NOTE: recipe python3-3.13.9-r0: task do_recipe_qa_setscene: Succeeded
NOTE: recipe gdbm-1.26-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: recipe openssl-3.5.4-r0: task do_packagedata_setscene: Succeeded
NOTE: Running setscene task 660 of 818 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-extended/bzip2/bzip2_1.0.8.bb:do_populate_sysroot_setscene)
NOTE: Running setscene task 661 of 818 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-extended/xz/xz_5.8.1.bb:do_packagedata_setscene)
NOTE: Running setscene task 662 of 818 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-extended/bzip2/bzip2_1.0.8.bb:do_packagedata_setscene)
NOTE: Running setscene task 664 of 818 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-connectivity/openssl/openssl_3.5.4.bb:do_populate_sysroot_setscene)
NOTE: Running setscene task 667 of 818 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-core/zlib/zlib_1.3.1.bb:do_packagedata_setscene)
NOTE: Running setscene task 671 of 818 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-core/musl/libucontext_1.3.2.bb:do_recipe_qa_setscene)
NOTE: Running setscene task 675 of 818 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-extended/xz/xz_5.8.1.bb:do_populate_sysroot_setscene)
NOTE: Running setscene task 676 of 818 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-core/zlib/zlib_1.3.1.bb:do_populate_sysroot_setscene)
NOTE: Running setscene task 681 of 818 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-support/gnutls/libtasn1_4.20.0.bb:do_packagedata_setscene)
NOTE: Running setscene task 682 of 818 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-extended/zstd/zstd_1.5.7.bb:do_packagedata_setscene)
NOTE: Running setscene task 683 of 818 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-support/libseccomp/libseccomp_2.6.0.bb:do_packagedata_setscene)
NOTE: Running setscene task 685 of 818 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-support/libgpg-error/libgpg-error_1.56.bb:do_packagedata_setscene)
NOTE: Running setscene task 686 of 818 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-support/libcap/libcap_2.76.bb:do_packagedata_setscene)
NOTE: Running setscene task 691 of 818 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-support/attr/attr_2.5.2.bb:do_packagedata_setscene)
NOTE: Running setscene task 698 of 818 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-extended/libidn/libidn2_2.3.8.bb:do_packagedata_setscene)
NOTE: recipe zlib-1.3.1-r0: task do_packagedata_setscene: Started
NOTE: recipe bzip2-1.0.8-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe zstd-1.5.7-r0: task do_packagedata_setscene: Started
NOTE: recipe zlib-1.3.1-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe xz-5.8.1-r0: task do_packagedata_setscene: Started
NOTE: recipe bzip2-1.0.8-r0: task do_packagedata_setscene: Started
NOTE: recipe libucontext-1.3.2-r0: task do_recipe_qa_setscene: Started
NOTE: recipe libtasn1-4.20.0-r0: task do_packagedata_setscene: Started
NOTE: recipe libcap-2.76-r0: task do_packagedata_setscene: Started
NOTE: recipe openssl-3.5.4-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe xz-5.8.1-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe libseccomp-2.6.0-r0: task do_packagedata_setscene: Started
NOTE: recipe libidn2-2.3.8-r0: task do_packagedata_setscene: Started
NOTE: recipe libgpg-error-1.56-r0: task do_packagedata_setscene: Started
NOTE: recipe attr-2.5.2-r0: task do_packagedata_setscene: Started
NOTE: recipe libedit-20250104-3.1-r1: task do_package_setscene: Started
NOTE: recipe libucontext-1.3.2-r0: task do_recipe_qa_setscene: Succeeded
NOTE: Running setscene task 699 of 818 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-support/sqlite/sqlite3_3.48.0.bb:do_recipe_qa_setscene)
NOTE: recipe zlib-1.3.1-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe zstd-1.5.7-r0: task do_packagedata_setscene: Succeeded
NOTE: Running setscene task 703 of 818 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-core/expat/expat_2.7.3.bb:do_recipe_qa_setscene)
NOTE: Running setscene task 704 of 818 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-support/gdbm/gdbm_1.26.bb:do_recipe_qa_setscene)
NOTE: recipe libcap-2.76-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe bzip2-1.0.8-r0: task do_packagedata_setscene: Succeeded
NOTE: Running setscene task 711 of 818 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-support/nettle/nettle_3.10.2.bb:do_packagedata_setscene)
NOTE: recipe bzip2-1.0.8-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: Running setscene task 712 of 818 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-core/util-linux/util-linux-libuuid_2.41.1.bb:do_recipe_qa_setscene)
NOTE: recipe zlib-1.3.1-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: recipe libtasn1-4.20.0-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe libseccomp-2.6.0-r0: task do_packagedata_setscene: Succeeded
NOTE: Running setscene task 714 of 818 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-support/libffi/libffi_3.5.2.bb:do_recipe_qa_setscene)
NOTE: Running setscene task 722 of 818 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-extended/pam/libpam_1.7.1.bb:do_packagedata_setscene)
NOTE: Running setscene task 726 of 818 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-core/zlib/zlib_1.3.1.bb:do_recipe_qa_setscene)
NOTE: Running setscene task 727 of 818 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-extended/bzip2/bzip2_1.0.8.bb:do_recipe_qa_setscene)
NOTE: recipe sqlite3-3_3.48.0-r0: task do_recipe_qa_setscene: Started
NOTE: recipe xz-5.8.1-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: recipe attr-2.5.2-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe expat-2.7.3-r0: task do_recipe_qa_setscene: Started
NOTE: Running task 1194 of 2310 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-devtools/python/python3-bcrypt_5.0.0.bb:do_unpack)
NOTE: recipe libgpg-error-1.56-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe xz-5.8.1-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe gdbm-1.26-r0: task do_recipe_qa_setscene: Started
NOTE: recipe util-linux-libuuid-2.41.1-r0: task do_recipe_qa_setscene: Started
NOTE: recipe libffi-3.5.2-r0: task do_recipe_qa_setscene: Started
NOTE: recipe nettle-3.10.2-r0: task do_packagedata_setscene: Started
NOTE: Running setscene task 740 of 818 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-extended/xz/xz_5.8.1.bb:do_recipe_qa_setscene)
NOTE: recipe zlib-1.3.1-r0: task do_recipe_qa_setscene: Started
NOTE: Running task 1211 of 2310 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-core/base-files/base-files_3.0.14.bb:do_unpack)
NOTE: recipe sqlite3-3_3.48.0-r0: task do_recipe_qa_setscene: Succeeded
NOTE: Running task 1224 of 2310 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-core/base-files/base-files_3.0.14.bb:do_prepare_recipe_sysroot)
NOTE: recipe libidn2-2.3.8-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe bzip2-1.0.8-r0: task do_recipe_qa_setscene: Started
NOTE: recipe openssl-3.5.4-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: recipe libpam-1.7.1-r0: task do_packagedata_setscene: Started
NOTE: Running setscene task 742 of 818 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-connectivity/openssl/openssl_3.5.4.bb:do_recipe_qa_setscene)
NOTE: Running setscene task 745 of 818 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-support/libunistring/libunistring_1.3.bb:do_packagedata_setscene)
NOTE: recipe expat-2.7.3-r0: task do_recipe_qa_setscene: Succeeded
NOTE: recipe gdbm-1.26-r0: task do_recipe_qa_setscene: Succeeded
NOTE: recipe zlib-1.3.1-r0: task do_recipe_qa_setscene: Succeeded
NOTE: recipe util-linux-libuuid-2.41.1-r0: task do_recipe_qa_setscene: Succeeded
NOTE: recipe bzip2-1.0.8-r0: task do_recipe_qa_setscene: Succeeded
NOTE: recipe libffi-3.5.2-r0: task do_recipe_qa_setscene: Succeeded
NOTE: recipe base-files-3.0.14-r0: task do_unpack: Started
NOTE: recipe xz-5.8.1-r0: task do_recipe_qa_setscene: Started
NOTE: recipe base-files-3.0.14-r0: task do_prepare_recipe_sysroot: Started
NOTE: recipe python3-bcrypt-5.0.0-r0: task do_unpack: Started
NOTE: recipe libunistring-1.3-r0: task do_packagedata_setscene: Started
NOTE: recipe nettle-3.10.2-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe openssl-3.5.4-r0: task do_recipe_qa_setscene: Started
NOTE: Running setscene task 749 of 818 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-support/gmp/gmp_6.3.0.bb:do_packagedata_setscene)
NOTE: recipe libedit-20250104-3.1-r1: task do_package_setscene: Succeeded
NOTE: recipe xz-5.8.1-r0: task do_recipe_qa_setscene: Succeeded
NOTE: Running setscene task 753 of 818 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-core/ncurses/ncurses_6.5.bb:do_packagedata_setscene)
NOTE: Running setscene task 755 of 818 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-core/ncurses/ncurses_6.5.bb:do_populate_sysroot_setscene)
NOTE: Running setscene task 756 of 818 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-devtools/libedit/libedit_20250104-3.1.bb:do_recipe_qa_setscene)
NOTE: recipe base-files-3.0.14-r0: task do_prepare_recipe_sysroot: Succeeded
NOTE: recipe openssl-3.5.4-r0: task do_recipe_qa_setscene: Succeeded
NOTE: recipe base-files-3.0.14-r0: task do_unpack: Succeeded
NOTE: Running task 1502 of 2310 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-core/base-files/base-files_3.0.14.bb:do_patch)
NOTE: recipe gmp-6.3.0-r0: task do_packagedata_setscene: Started
NOTE: recipe libunistring-1.3-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe libedit-20250104-3.1-r1: task do_recipe_qa_setscene: Started
NOTE: recipe ncurses-6.5-r0: task do_packagedata_setscene: Started
NOTE: recipe ncurses-6.5-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe base-files-3.0.14-r0: task do_patch: Started
NOTE: recipe libedit-20250104-3.1-r1: task do_recipe_qa_setscene: Succeeded
NOTE: recipe gmp-6.3.0-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe base-files-3.0.14-r0: task do_patch: Succeeded
NOTE: Running task 1520 of 2310 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-core/base-files/base-files_3.0.14.bb:do_configure)
NOTE: recipe ncurses-6.5-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: recipe ncurses-6.5-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe base-files-3.0.14-r0: task do_configure: Started
NOTE: Running setscene task 764 of 818 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-devtools/opkg-utils/opkg-utils_0.7.0.bb:do_packagedata_setscene)
NOTE: Running setscene task 765 of 818 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-devtools/opkg-utils/opkg-utils_0.7.0.bb:do_populate_sysroot_setscene)
NOTE: Running setscene task 768 of 818 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-core/ncurses/ncurses_6.5.bb:do_recipe_qa_setscene)
NOTE: recipe base-files-3.0.14-r0: task do_configure: Succeeded
NOTE: recipe opkg-utils-0.7.0-r0: task do_packagedata_setscene: Started
NOTE: recipe opkg-utils-0.7.0-r0: task do_populate_sysroot_setscene: Started
NOTE: Running task 1526 of 2310 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-core/base-files/base-files_3.0.14.bb:do_compile)
NOTE: recipe ncurses-6.5-r0: task do_recipe_qa_setscene: Started
NOTE: recipe ncurses-6.5-r0: task do_recipe_qa_setscene: Succeeded
NOTE: recipe base-files-3.0.14-r0: task do_compile: Started
NOTE: recipe libpam-1.7.1-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe python3-bcrypt-5.0.0-r0: task do_unpack: Succeeded
NOTE: recipe opkg-utils-0.7.0-r0: task do_packagedata_setscene: Succeeded
NOTE: Running setscene task 778 of 818 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-devtools/gcc/gcc-runtime_15.2.bb:do_packagedata_setscene)
NOTE: Running task 1566 of 2310 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-devtools/python/python3-bcrypt_5.0.0.bb:do_patch)
NOTE: recipe opkg-utils-0.7.0-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: recipe base-files-3.0.14-r0: task do_compile: Succeeded
NOTE: Running setscene task 779 of 818 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-devtools/gcc/gcc-runtime_15.2.bb:do_populate_sysroot_setscene)
NOTE: Running setscene task 781 of 818 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-devtools/opkg-utils/opkg-utils_0.7.0.bb:do_recipe_qa_setscene)
NOTE: Running task 1573 of 2310 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-core/base-files/base-files_3.0.14.bb:do_install)
NOTE: recipe gcc-runtime-15.2.0-r0: task do_packagedata_setscene: Started
NOTE: recipe opkg-utils-0.7.0-r0: task do_recipe_qa_setscene: Started
NOTE: recipe gcc-runtime-15.2.0-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe python3-bcrypt-5.0.0-r0: task do_patch: Started
NOTE: recipe base-files-3.0.14-r0: task do_install: Started
NOTE: recipe opkg-utils-0.7.0-r0: task do_recipe_qa_setscene: Succeeded
NOTE: recipe python3-bcrypt-5.0.0-r0: task do_patch: Succeeded
NOTE: Running task 1580 of 2310 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-devtools/python/python3-bcrypt_5.0.0.bb:do_rust_gen_targets)
NOTE: recipe gcc-runtime-15.2.0-r0: task do_packagedata_setscene: Succeeded
NOTE: Running setscene task 783 of 818 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-devtools/gcc/libgcc_15.2.bb:do_packagedata_setscene)
NOTE: recipe libgcc-15.2.0-r0: task do_packagedata_setscene: Started
NOTE: recipe python3-bcrypt-5.0.0-r0: task do_rust_gen_targets: Started
NOTE: recipe python3-bcrypt-5.0.0-r0: task do_rust_gen_targets: Succeeded
NOTE: recipe gcc-runtime-15.2.0-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: Running setscene task 784 of 818 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-devtools/gcc/gcc-runtime_15.2.bb:do_recipe_qa_setscene)
NOTE: Running setscene task 786 of 818 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-devtools/gcc/libgcc_15.2.bb:do_populate_sysroot_setscene)
NOTE: recipe libgcc-15.2.0-r0: task do_packagedata_setscene: Succeeded
NOTE: Running setscene task 788 of 818 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-core/musl/musl_git.bb:do_packagedata_setscene)
NOTE: recipe base-files-3.0.14-r0: task do_install: Succeeded
NOTE: recipe musl-1.2.5+git-r0: task do_packagedata_setscene: Started
NOTE: recipe libgcc-15.2.0-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe gcc-runtime-15.2.0-r0: task do_recipe_qa_setscene: Started
NOTE: Running task 1582 of 2310 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-core/base-files/base-files_3.0.14.bb:do_package)
NOTE: recipe gcc-runtime-15.2.0-r0: task do_recipe_qa_setscene: Succeeded
NOTE: recipe base-files-3.0.14-r0: task do_package: Started
NOTE: recipe musl-1.2.5+git-r0: task do_packagedata_setscene: Succeeded
NOTE: Running setscene task 790 of 818 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-core/musl/libssp-nonshared.bb:do_packagedata_setscene)
NOTE: Running setscene task 791 of 818 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-kernel/linux-libc-headers/linux-libc-headers_6.17.bb:do_packagedata_setscene)
NOTE: Running setscene task 792 of 818 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-core/musl/bsd-headers.bb:do_packagedata_setscene)
NOTE: recipe libgcc-15.2.0-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: Running setscene task 793 of 818 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-devtools/gcc/libgcc_15.2.bb:do_recipe_qa_setscene)
NOTE: Running setscene task 794 of 818 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-core/musl/musl_git.bb:do_populate_sysroot_setscene)
NOTE: recipe libssp-nonshared-1.0-r0: task do_packagedata_setscene: Started
NOTE: recipe bsd-headers-1.0-r0: task do_packagedata_setscene: Started
NOTE: recipe linux-libc-headers-6.17-r0: task do_packagedata_setscene: Started
NOTE: recipe musl-1.2.5+git-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe libgcc-15.2.0-r0: task do_recipe_qa_setscene: Started
NOTE: recipe libssp-nonshared-1.0-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe bsd-headers-1.0-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe linux-libc-headers-6.17-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe libgcc-15.2.0-r0: task do_recipe_qa_setscene: Succeeded
NOTE: recipe musl-1.2.5+git-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: Running setscene task 800 of 818 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-core/musl/bsd-headers.bb:do_populate_sysroot_setscene)
NOTE: Running setscene task 801 of 818 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-core/musl/libssp-nonshared.bb:do_populate_sysroot_setscene)
NOTE: Running setscene task 803 of 818 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-core/musl/musl_git.bb:do_recipe_qa_setscene)
NOTE: recipe bsd-headers-1.0-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe libssp-nonshared-1.0-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe musl-1.2.5+git-r0: task do_recipe_qa_setscene: Started
NOTE: recipe musl-1.2.5+git-r0: task do_recipe_qa_setscene: Succeeded
NOTE: recipe bsd-headers-1.0-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: recipe libssp-nonshared-1.0-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: Running setscene task 807 of 818 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-core/musl/bsd-headers.bb:do_recipe_qa_setscene)
NOTE: Running setscene task 808 of 818 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-devtools/gcc/gcc-cross_15.2.bb:do_populate_sysroot_setscene)
NOTE: Running setscene task 810 of 818 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-core/musl/libssp-nonshared.bb:do_recipe_qa_setscene)
NOTE: recipe bsd-headers-1.0-r0: task do_recipe_qa_setscene: Started
NOTE: recipe gcc-cross-x86_64-15.2.0-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe libssp-nonshared-1.0-r0: task do_recipe_qa_setscene: Started
NOTE: recipe bsd-headers-1.0-r0: task do_recipe_qa_setscene: Succeeded
NOTE: recipe libssp-nonshared-1.0-r0: task do_recipe_qa_setscene: Succeeded
NOTE: recipe gcc-cross-x86_64-15.2.0-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: Running setscene task 812 of 818 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-kernel/linux-libc-headers/linux-libc-headers_6.17.bb:do_populate_sysroot_setscene)
NOTE: recipe linux-libc-headers-6.17-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe linux-libc-headers-6.17-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: Running setscene task 816 of 818 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-kernel/linux-libc-headers/linux-libc-headers_6.17.bb:do_recipe_qa_setscene)
NOTE: Running setscene task 817 of 818 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-devtools/binutils/binutils-cross_2.45.bb:do_populate_sysroot_setscene)
NOTE: recipe binutils-cross-x86_64-2.45-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe linux-libc-headers-6.17-r0: task do_recipe_qa_setscene: Started
NOTE: recipe base-files-3.0.14-r0: task do_package: Succeeded
NOTE: recipe linux-libc-headers-6.17-r0: task do_recipe_qa_setscene: Succeeded
NOTE: Running task 1622 of 2310 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-core/base-files/base-files_3.0.14.bb:do_packagedata)
NOTE: recipe base-files-3.0.14-r0: task do_packagedata: Started
NOTE: recipe binutils-cross-x86_64-2.45-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: recipe base-files-3.0.14-r0: task do_packagedata: Succeeded
NOTE: Task /srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-core/base-files/base-files_3.0.14.bb:do_packagedata unihash changed to 322b8f8b906444532279807f4b6d94c79a2dab3feaff9de6d084f1ef1555cf0a
NOTE: Reported task /srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-core/base-files/base-files_3.0.14.bb:do_create_spdx as unihash 8633ff15ea717d32f131c0027f8458ee27ba4561428e39735f0eda5b008b4c69 to wss://hashserv-eu.yoctoproject.org/ws ({'taskhash': '49e77ad0f7768c1d808729ad654b80fbc45a1e2106282014e60471c4497f91a3', 'method': 'oe.sstatesig.OEOuthashBasic', 'unihash': '8633ff15ea717d32f131c0027f8458ee27ba4561428e39735f0eda5b008b4c69'})
NOTE: Task /srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-core/base-files/base-files_3.0.14.bb:do_create_spdx unihash changed 49e77ad0f7768c1d808729ad654b80fbc45a1e2106282014e60471c4497f91a3 -> 8633ff15ea717d32f131c0027f8458ee27ba4561428e39735f0eda5b008b4c69 as wanted
NOTE: Already covered setscene for /srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-core/base-files/base-files_3.0.14.bb:do_create_spdx so ignoring rehash (remap)
NOTE: Setscene tasks completed
NOTE: Running task 1903 of 2310 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-devtools/python/python3-bcrypt_5.0.0.bb:do_prepare_recipe_sysroot)
NOTE: Running task 1931 of 2310 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-devtools/libedit/libedit_20250104-3.1.bb:do_packagedata)
NOTE: recipe libedit-20250104-3.1-r1: task do_packagedata: Started
NOTE: recipe python3-bcrypt-5.0.0-r0: task do_prepare_recipe_sysroot: Started
NOTE: recipe libedit-20250104-3.1-r1: task do_packagedata: Succeeded
NOTE: Running task 2269 of 2310 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-devtools/python/python3-bcrypt_5.0.0.bb:do_collect_spdx_deps)
NOTE: recipe python3-bcrypt-5.0.0-r0: task do_collect_spdx_deps: Started
NOTE: recipe python3-bcrypt-5.0.0-r0: task do_prepare_recipe_sysroot: Succeeded
NOTE: Running task 2294 of 2310 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-devtools/python/python3-bcrypt_5.0.0.bb:do_rust_create_wrappers)
NOTE: recipe python3-bcrypt-5.0.0-r0: task do_collect_spdx_deps: Succeeded
NOTE: recipe python3-bcrypt-5.0.0-r0: task do_rust_create_wrappers: Started
NOTE: recipe python3-bcrypt-5.0.0-r0: task do_rust_create_wrappers: Succeeded
NOTE: Running task 2295 of 2310 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-devtools/python/python3-bcrypt_5.0.0.bb:do_configure)
NOTE: recipe python3-bcrypt-5.0.0-r0: task do_configure: Started
NOTE: recipe python3-bcrypt-5.0.0-r0: task do_configure: Succeeded
NOTE: Running task 2296 of 2310 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-devtools/python/python3-bcrypt_5.0.0.bb:do_configure_ptest_base)
NOTE: recipe python3-bcrypt-5.0.0-r0: task do_configure_ptest_base: Started
NOTE: recipe python3-bcrypt-5.0.0-r0: task do_configure_ptest_base: Succeeded
NOTE: Running task 2297 of 2310 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-devtools/python/python3-bcrypt_5.0.0.bb:do_compile)
NOTE: recipe python3-bcrypt-5.0.0-r0: task do_compile: Started
NOTE: recipe python3-bcrypt-5.0.0-r0: task do_compile: Succeeded
NOTE: Running task 2298 of 2310 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-devtools/python/python3-bcrypt_5.0.0.bb:do_compile_ptest_base)
NOTE: recipe python3-bcrypt-5.0.0-r0: task do_compile_ptest_base: Started
NOTE: recipe python3-bcrypt-5.0.0-r0: task do_compile_ptest_base: Succeeded
NOTE: Running task 2299 of 2310 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-devtools/python/python3-bcrypt_5.0.0.bb:do_install)
NOTE: recipe python3-bcrypt-5.0.0-r0: task do_install: Started
NOTE: recipe python3-bcrypt-5.0.0-r0: task do_install: Succeeded
NOTE: Running task 2300 of 2310 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-devtools/python/python3-bcrypt_5.0.0.bb:do_install_ptest_base)
NOTE: recipe python3-bcrypt-5.0.0-r0: task do_install_ptest_base: Started
NOTE: recipe python3-bcrypt-5.0.0-r0: task do_install_ptest_base: Succeeded
NOTE: Running task 2301 of 2310 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-devtools/python/python3-bcrypt_5.0.0.bb:do_package)
NOTE: Running task 2302 of 2310 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-devtools/python/python3-bcrypt_5.0.0.bb:do_populate_sysroot)
NOTE: recipe python3-bcrypt-5.0.0-r0: task do_package: Started
NOTE: recipe python3-bcrypt-5.0.0-r0: task do_populate_sysroot: Started
NOTE: recipe python3-bcrypt-5.0.0-r0: task do_populate_sysroot: Succeeded
NOTE: recipe python3-bcrypt-5.0.0-r0: task do_package: Succeeded
NOTE: Running task 2303 of 2310 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-devtools/python/python3-bcrypt_5.0.0.bb:do_packagedata)
NOTE: recipe python3-bcrypt-5.0.0-r0: task do_packagedata: Started
NOTE: recipe python3-bcrypt-5.0.0-r0: task do_packagedata: Succeeded
NOTE: Running task 2304 of 2310 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-devtools/python/python3-bcrypt_5.0.0.bb:do_create_spdx)
NOTE: Running task 2305 of 2310 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-devtools/python/python3-bcrypt_5.0.0.bb:do_package_write_ipk)
NOTE: Running task 2306 of 2310 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-devtools/python/python3-bcrypt_5.0.0.bb:do_package_write_deb)
NOTE: Running task 2307 of 2310 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-devtools/python/python3-bcrypt_5.0.0.bb:do_package_write_rpm)
NOTE: Running task 2308 of 2310 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-devtools/python/python3-bcrypt_5.0.0.bb:do_package_qa)
NOTE: recipe python3-bcrypt-5.0.0-r0: task do_create_spdx: Started
NOTE: recipe python3-bcrypt-5.0.0-r0: task do_package_write_ipk: Started
NOTE: recipe python3-bcrypt-5.0.0-r0: task do_package_write_deb: Started
NOTE: recipe python3-bcrypt-5.0.0-r0: task do_package_write_rpm: Started
NOTE: recipe python3-bcrypt-5.0.0-r0: task do_package_qa: Started
NOTE: recipe python3-bcrypt-5.0.0-r0: task do_create_spdx: Succeeded
NOTE: Running task 2309 of 2310 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-devtools/python/python3-bcrypt_5.0.0.bb:do_create_package_spdx)
NOTE: recipe python3-bcrypt-5.0.0-r0: task do_create_package_spdx: Started
NOTE: recipe python3-bcrypt-5.0.0-r0: task do_package_qa: Succeeded
NOTE: recipe python3-bcrypt-5.0.0-r0: task do_package_write_ipk: Succeeded
NOTE: Task /srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-devtools/python/python3-bcrypt_5.0.0.bb:do_package_qa unihash changed to 98b0417c0ea63d29fd01520700ef564feee54edffb0f7ae5509b2f00e571f195
NOTE: recipe python3-bcrypt-5.0.0-r0: task do_package_write_deb: Succeeded
NOTE: recipe python3-bcrypt-5.0.0-r0: task do_create_package_spdx: Succeeded
NOTE: recipe python3-bcrypt-5.0.0-r0: task do_package_write_rpm: Succeeded
NOTE: Running noexec task 2310 of 2310 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-devtools/python/python3-bcrypt_5.0.0.bb:do_build)
NOTE: Tasks Summary: Attempted 2310 tasks of which 2277 didn't need to be rerun and all succeeded.
NOTE: Writing buildhistory
NOTE: Writing buildhistory took: 2 seconds

Summary: There were 8 ERROR messages, returning a non-zero exit code.
ERROR: libedit-20250104-3.1-r1 do_packagedata_setscene: QA Issue: Package version for package libedit-src went backwards which would break package feeds (from 0:20251016-3.1-r0 to 0:20250104-3.1-r1) [version-going-backwards]
ERROR: libedit-20250104-3.1-r1 do_packagedata_setscene: QA Issue: Package version for package libedit-dbg went backwards which would break package feeds (from 0:20251016-3.1-r0 to 0:20250104-3.1-r1) [version-going-backwards]
ERROR: libedit-20250104-3.1-r1 do_packagedata_setscene: QA Issue: Package version for package libedit-staticdev went backwards which would break package feeds (from 0:20251016-3.1-r0 to 0:20250104-3.1-r1) [version-going-backwards]
ERROR: libedit-20250104-3.1-r1 do_packagedata_setscene: QA Issue: Package version for package libedit-dev went backwards which would break package feeds (from 0:20251016-3.1-r0 to 0:20250104-3.1-r1) [version-going-backwards]
ERROR: libedit-20250104-3.1-r1 do_packagedata_setscene: QA Issue: Package version for package libedit-doc went backwards which would break package feeds (from 0:20251016-3.1-r0 to 0:20250104-3.1-r1) [version-going-backwards]
ERROR: libedit-20250104-3.1-r1 do_packagedata_setscene: QA Issue: Package version for package libedit-locale went backwards which would break package feeds (from 0:20251016-3.1-r0 to 0:20250104-3.1-r1) [version-going-backwards]
ERROR: libedit-20250104-3.1-r1 do_packagedata_setscene: QA Issue: Package version for package libedit went backwards which would break package feeds (from 0:20251016-3.1-r0 to 0:20250104-3.1-r1) [version-going-backwards]
ERROR: libedit-20250104-3.1-r1 do_packagedata_setscene: Fatal QA errors were found, failing task.

--===============6613382397031854162==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: attachment; filename="buildhistory-diff.txt"

Changes to packages/x86-64-v3-poky-linux/python3-bcrypt (sysroot):
  /usr/lib/python3.13/site-packages/bcrypt-4.3.0.dist-info moved to /usr/lib/python3.13/site-packages/bcrypt-5.0.0.dist-info

--===============6613382397031854162==--

