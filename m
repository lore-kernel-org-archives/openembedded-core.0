Return-Path: <auh@yoctoproject.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 0FC4FC28B28
	for <webhook@archiver.kernel.org>; Sat,  1 Mar 2025 11:25:28 +0000 (UTC)
Received: from a27-191.smtp-out.us-west-2.amazonses.com (a27-191.smtp-out.us-west-2.amazonses.com [54.240.27.191])
 by mx.groups.io with SMTP id smtpd.web11.7053.1740828323993215744
 for <openembedded-core@lists.openembedded.org>;
 Sat, 01 Mar 2025 03:25:24 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@yoctoproject.org header.s=rnkzp2s7ci3kogmesvov2nwn7wcc2dgx header.b=BorMHW73;
 dkim=pass header.i=@amazonses.com header.s=7v7vs6w47njt4pimodk5mmttbegzsi6n header.b=J9j2ctFx;
 spf=pass (domain: us-west-2.amazonses.com, ip: 54.240.27.191, mailfrom: 01010195517430ea-bc3d0786-7926-48a4-8349-c056d7c0202c-000000@us-west-2.amazonses.com)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/simple;
	s=rnkzp2s7ci3kogmesvov2nwn7wcc2dgx; d=yoctoproject.org;
	t=1740828324;
	h=Content-Type:MIME-Version:From:To:Cc:Subject:Message-Id:Date;
	bh=CsAH7fwHK4jfTy9QVKyzgqz0+Y3X20JnqOCAi6Icxc0=;
	b=BorMHW73Aif84ocjDOXuYli4sRyQi8Rj2ENYelFHSArbJAMWUlXF+ps2DtOg8yw4
	jfJFlE+MxiQRUQ+yD8aeH09yCzJPqBucU8knaT8sns2hzumsTLnhMXMrlGcyNqBpPcU
	8gFldhDhauhJ4v5XG9p7eOWlaz4R/tns3HnRFs84=
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/simple;
	s=7v7vs6w47njt4pimodk5mmttbegzsi6n; d=amazonses.com; t=1740828324;
	h=Content-Type:MIME-Version:From:To:Cc:Subject:Message-Id:Date:Feedback-ID;
	bh=CsAH7fwHK4jfTy9QVKyzgqz0+Y3X20JnqOCAi6Icxc0=;
	b=J9j2ctFxIojQvKbmXVGkMIn1SzAagXUqM4FGtE0F3nyRR9LAaVCK5jUl1F3UJdNP
	dlw1894d2nfA4UrxTmxcfP2Kd8tdPVokaQgQVB8CyiKs3f9wGdJahAEG2uK7oIbSV6B
	wnS5ykseOcCMT1KhFSsiM6RLf2i+GidVgDTlnSKU=
Content-Type: multipart/mixed; boundary="===============9073433903153287974=="
MIME-Version: 1.0
From: auh@yoctoproject.org
To: Tim Orling <tim.orling@konsulko.com>
Cc: openembedded-core@lists.openembedded.org
Subject: [AUH] python3-bcrypt: upgrading to 4.3.0 SUCCEEDED
Message-ID: <01010195517430ea-bc3d0786-7926-48a4-8349-c056d7c0202c-000000@us-west-2.amazonses.com>
Date: Sat, 1 Mar 2025 11:25:24 +0000
Feedback-ID: ::1.us-west-2.9np3MYPs3fEaOBysGKSlUD4KtcmPijcmS9Az2Hwf7iQ=:AmazonSES
X-SES-Outgoing: 2025.03.01-54.240.27.191
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Sat, 01 Mar 2025 11:25:28 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/212117

--===============9073433903153287974==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit

Hello,

this email is a notification from the Auto Upgrade Helper
that the automatic attempt to upgrade the recipe(s) *python3-bcrypt* to *4.3.0* has Succeeded.

Next steps:
    - apply the patch: git am 0001-python3-bcrypt-upgrade-4.2.1-4.3.0.patch
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
From 34cea89bad5e6f9d8a97501a6bfe1e171b848ab2 Mon Sep 17 00:00:00 2001
From: Upgrade Helper <auh@yoctoproject.org>
Date: Sat, 1 Mar 2025 07:50:04 +0000
Subject: [PATCH] python3-bcrypt: upgrade 4.2.1 -> 4.3.0

---
 .../python/python3-bcrypt-crates.inc          | 94 ++++++++++++-------
 ...crypt_4.2.1.bb => python3-bcrypt_4.3.0.bb} |  2 +-
 2 files changed, 59 insertions(+), 37 deletions(-)
 rename meta/recipes-devtools/python/{python3-bcrypt_4.2.1.bb => python3-bcrypt_4.3.0.bb} (86%)

diff --git a/meta/recipes-devtools/python/python3-bcrypt-crates.inc b/meta/recipes-devtools/python/python3-bcrypt-crates.inc
index 576abcd7cb..e0a2926519 100644
--- a/meta/recipes-devtools/python/python3-bcrypt-crates.inc
+++ b/meta/recipes-devtools/python/python3-bcrypt-crates.inc
@@ -4,81 +4,103 @@
 SRC_URI += " \
     crate://crates.io/autocfg/1.4.0 \
     crate://crates.io/base64/0.22.1 \
-    crate://crates.io/bcrypt/0.16.0 \
+    crate://crates.io/bcrypt/0.17.0 \
     crate://crates.io/bcrypt-pbkdf/0.10.0 \
+    crate://crates.io/bitflags/2.8.0 \
     crate://crates.io/block-buffer/0.10.4 \
     crate://crates.io/blowfish/0.9.1 \
     crate://crates.io/byteorder/1.5.0 \
     crate://crates.io/cfg-if/1.0.0 \
     crate://crates.io/cipher/0.4.4 \
-    crate://crates.io/cpufeatures/0.2.15 \
+    crate://crates.io/cpufeatures/0.2.17 \
     crate://crates.io/crypto-common/0.1.6 \
     crate://crates.io/digest/0.10.7 \
     crate://crates.io/generic-array/0.14.7 \
-    crate://crates.io/getrandom/0.2.15 \
+    crate://crates.io/getrandom/0.3.1 \
     crate://crates.io/heck/0.5.0 \
     crate://crates.io/indoc/2.0.5 \
-    crate://crates.io/inout/0.1.3 \
-    crate://crates.io/libc/0.2.164 \
+    crate://crates.io/inout/0.1.4 \
+    crate://crates.io/libc/0.2.170 \
     crate://crates.io/memoffset/0.9.1 \
-    crate://crates.io/once_cell/1.20.2 \
+    crate://crates.io/once_cell/1.20.3 \
     crate://crates.io/pbkdf2/0.12.2 \
-    crate://crates.io/portable-atomic/1.9.0 \
-    crate://crates.io/proc-macro2/1.0.89 \
-    crate://crates.io/pyo3/0.23.1 \
-    crate://crates.io/pyo3-build-config/0.23.1 \
-    crate://crates.io/pyo3-ffi/0.23.1 \
-    crate://crates.io/pyo3-macros/0.23.1 \
-    crate://crates.io/pyo3-macros-backend/0.23.1 \
-    crate://crates.io/quote/1.0.37 \
+    crate://crates.io/portable-atomic/1.11.0 \
+    crate://crates.io/proc-macro2/1.0.93 \
+    crate://crates.io/pyo3/0.23.5 \
+    crate://crates.io/pyo3-build-config/0.23.5 \
+    crate://crates.io/pyo3-ffi/0.23.5 \
+    crate://crates.io/pyo3-macros/0.23.5 \
+    crate://crates.io/pyo3-macros-backend/0.23.5 \
+    crate://crates.io/quote/1.0.38 \
     crate://crates.io/sha2/0.10.8 \
     crate://crates.io/subtle/2.6.1 \
-    crate://crates.io/syn/2.0.87 \
+    crate://crates.io/syn/2.0.98 \
     crate://crates.io/target-lexicon/0.12.16 \
-    crate://crates.io/typenum/1.17.0 \
-    crate://crates.io/unicode-ident/1.0.13 \
+    crate://crates.io/typenum/1.18.0 \
+    crate://crates.io/unicode-ident/1.0.17 \
     crate://crates.io/unindent/0.2.3 \
     crate://crates.io/version_check/0.9.5 \
-    crate://crates.io/wasi/0.11.0+wasi-snapshot-preview1 \
+    crate://crates.io/wasi/0.13.3+wasi-0.2.2 \
+    crate://crates.io/windows-targets/0.52.6 \
+    crate://crates.io/windows_aarch64_gnullvm/0.52.6 \
+    crate://crates.io/windows_aarch64_msvc/0.52.6 \
+    crate://crates.io/windows_i686_gnu/0.52.6 \
+    crate://crates.io/windows_i686_gnullvm/0.52.6 \
+    crate://crates.io/windows_i686_msvc/0.52.6 \
+    crate://crates.io/windows_x86_64_gnu/0.52.6 \
+    crate://crates.io/windows_x86_64_gnullvm/0.52.6 \
+    crate://crates.io/windows_x86_64_msvc/0.52.6 \
+    crate://crates.io/wit-bindgen-rt/0.33.0 \
     crate://crates.io/zeroize/1.8.1 \
 "
 
 SRC_URI[autocfg-1.4.0.sha256sum] = "ace50bade8e6234aa140d9a2f552bbee1db4d353f69b8217bc503490fc1a9f26"
 SRC_URI[base64-0.22.1.sha256sum] = "72b3254f16251a8381aa12e40e3c4d2f0199f8c6508fbecb9d91f575e0fbb8c6"
-SRC_URI[bcrypt-0.16.0.sha256sum] = "2b1866ecef4f2d06a0bb77880015fdf2b89e25a1c2e5addacb87e459c86dc67e"
+SRC_URI[bcrypt-0.17.0.sha256sum] = "92758ad6077e4c76a6cadbce5005f666df70d4f13b19976b1a8062eef880040f"
 SRC_URI[bcrypt-pbkdf-0.10.0.sha256sum] = "6aeac2e1fe888769f34f05ac343bbef98b14d1ffb292ab69d4608b3abc86f2a2"
+SRC_URI[bitflags-2.8.0.sha256sum] = "8f68f53c83ab957f72c32642f3868eec03eb974d1fb82e453128456482613d36"
 SRC_URI[block-buffer-0.10.4.sha256sum] = "3078c7629b62d3f0439517fa394996acacc5cbc91c5a20d8c658e77abd503a71"
 SRC_URI[blowfish-0.9.1.sha256sum] = "e412e2cd0f2b2d93e02543ceae7917b3c70331573df19ee046bcbc35e45e87d7"
 SRC_URI[byteorder-1.5.0.sha256sum] = "1fd0f2584146f6f2ef48085050886acf353beff7305ebd1ae69500e27c67f64b"
 SRC_URI[cfg-if-1.0.0.sha256sum] = "baf1de4339761588bc0619e3cbc0120ee582ebb74b53b4efbf79117bd2da40fd"
 SRC_URI[cipher-0.4.4.sha256sum] = "773f3b9af64447d2ce9850330c473515014aa235e6a783b02db81ff39e4a3dad"
-SRC_URI[cpufeatures-0.2.15.sha256sum] = "0ca741a962e1b0bff6d724a1a0958b686406e853bb14061f218562e1896f95e6"
+SRC_URI[cpufeatures-0.2.17.sha256sum] = "59ed5838eebb26a2bb2e58f6d5b5316989ae9d08bab10e0e6d103e656d1b0280"
 SRC_URI[crypto-common-0.1.6.sha256sum] = "1bfb12502f3fc46cca1bb51ac28df9d618d813cdc3d2f25b9fe775a34af26bb3"
 SRC_URI[digest-0.10.7.sha256sum] = "9ed9a281f7bc9b7576e61468ba615a66a5c8cfdff42420a70aa82701a3b1e292"
 SRC_URI[generic-array-0.14.7.sha256sum] = "85649ca51fd72272d7821adaf274ad91c288277713d9c18820d8499a7ff69e9a"
-SRC_URI[getrandom-0.2.15.sha256sum] = "c4567c8db10ae91089c99af84c68c38da3ec2f087c3f82960bcdbf3656b6f4d7"
+SRC_URI[getrandom-0.3.1.sha256sum] = "43a49c392881ce6d5c3b8cb70f98717b7c07aabbdff06687b9030dbfbe2725f8"
 SRC_URI[heck-0.5.0.sha256sum] = "2304e00983f87ffb38b55b444b5e3b60a884b5d30c0fca7d82fe33449bbe55ea"
 SRC_URI[indoc-2.0.5.sha256sum] = "b248f5224d1d606005e02c97f5aa4e88eeb230488bcc03bc9ca4d7991399f2b5"
-SRC_URI[inout-0.1.3.sha256sum] = "a0c10553d664a4d0bcff9f4215d0aac67a639cc68ef660840afe309b807bc9f5"
-SRC_URI[libc-0.2.164.sha256sum] = "433bfe06b8c75da9b2e3fbea6e5329ff87748f0b144ef75306e674c3f6f7c13f"
+SRC_URI[inout-0.1.4.sha256sum] = "879f10e63c20629ecabbb64a8010319738c66a5cd0c29b02d63d272b03751d01"
+SRC_URI[libc-0.2.170.sha256sum] = "875b3680cb2f8f71bdcf9a30f38d48282f5d3c95cbf9b3fa57269bb5d5c06828"
 SRC_URI[memoffset-0.9.1.sha256sum] = "488016bfae457b036d996092f6cb448677611ce4449e970ceaf42695203f218a"
-SRC_URI[once_cell-1.20.2.sha256sum] = "1261fe7e33c73b354eab43b1273a57c8f967d0391e80353e51f764ac02cf6775"
+SRC_URI[once_cell-1.20.3.sha256sum] = "945462a4b81e43c4e3ba96bd7b49d834c6f61198356aa858733bc4acf3cbe62e"
 SRC_URI[pbkdf2-0.12.2.sha256sum] = "f8ed6a7761f76e3b9f92dfb0a60a6a6477c61024b775147ff0973a02653abaf2"
-SRC_URI[portable-atomic-1.9.0.sha256sum] = "cc9c68a3f6da06753e9335d63e27f6b9754dd1920d941135b7ea8224f141adb2"
-SRC_URI[proc-macro2-1.0.89.sha256sum] = "f139b0662de085916d1fb67d2b4169d1addddda1919e696f3252b740b629986e"
-SRC_URI[pyo3-0.23.1.sha256sum] = "7ebb0c0cc0de9678e53be9ccf8a2ab53045e6e3a8be03393ceccc5e7396ccb40"
-SRC_URI[pyo3-build-config-0.23.1.sha256sum] = "80e3ce69c4ec34476534b490e412b871ba03a82e35604c3dfb95fcb6bfb60c09"
-SRC_URI[pyo3-ffi-0.23.1.sha256sum] = "3b09f311c76b36dfd6dd6f7fa6f9f18e7e46a1c937110d283e80b12ba2468a75"
-SRC_URI[pyo3-macros-0.23.1.sha256sum] = "fd4f74086536d1e1deaff99ec0387481fb3325c82e4e48be0e75ab3d3fcb487a"
-SRC_URI[pyo3-macros-backend-0.23.1.sha256sum] = "9e77dfeb76b32bbf069144a5ea0a36176ab59c8db9ce28732d0f06f096bbfbc8"
-SRC_URI[quote-1.0.37.sha256sum] = "b5b9d34b8991d19d98081b46eacdd8eb58c6f2b201139f7c5f643cc155a633af"
+SRC_URI[portable-atomic-1.11.0.sha256sum] = "350e9b48cbc6b0e028b0473b114454c6316e57336ee184ceab6e53f72c178b3e"
+SRC_URI[proc-macro2-1.0.93.sha256sum] = "60946a68e5f9d28b0dc1c21bb8a97ee7d018a8b322fa57838ba31cc878e22d99"
+SRC_URI[pyo3-0.23.5.sha256sum] = "7778bffd85cf38175ac1f545509665d0b9b92a198ca7941f131f85f7a4f9a872"
+SRC_URI[pyo3-build-config-0.23.5.sha256sum] = "94f6cbe86ef3bf18998d9df6e0f3fc1050a8c5efa409bf712e661a4366e010fb"
+SRC_URI[pyo3-ffi-0.23.5.sha256sum] = "e9f1b4c431c0bb1c8fb0a338709859eed0d030ff6daa34368d3b152a63dfdd8d"
+SRC_URI[pyo3-macros-0.23.5.sha256sum] = "fbc2201328f63c4710f68abdf653c89d8dbc2858b88c5d88b0ff38a75288a9da"
+SRC_URI[pyo3-macros-backend-0.23.5.sha256sum] = "fca6726ad0f3da9c9de093d6f116a93c1a38e417ed73bf138472cf4064f72028"
+SRC_URI[quote-1.0.38.sha256sum] = "0e4dccaaaf89514f546c693ddc140f729f958c247918a13380cccc6078391acc"
 SRC_URI[sha2-0.10.8.sha256sum] = "793db75ad2bcafc3ffa7c68b215fee268f537982cd901d132f89c6343f3a3dc8"
 SRC_URI[subtle-2.6.1.sha256sum] = "13c2bddecc57b384dee18652358fb23172facb8a2c51ccc10d74c157bdea3292"
-SRC_URI[syn-2.0.87.sha256sum] = "25aa4ce346d03a6dcd68dd8b4010bcb74e54e62c90c573f394c46eae99aba32d"
+SRC_URI[syn-2.0.98.sha256sum] = "36147f1a48ae0ec2b5b3bc5b537d267457555a10dc06f3dbc8cb11ba3006d3b1"
 SRC_URI[target-lexicon-0.12.16.sha256sum] = "61c41af27dd6d1e27b1b16b489db798443478cef1f06a660c96db617ba5de3b1"
-SRC_URI[typenum-1.17.0.sha256sum] = "42ff0bf0c66b8238c6f3b578df37d0b7848e55df8577b3f74f92a69acceeb825"
-SRC_URI[unicode-ident-1.0.13.sha256sum] = "e91b56cd4cadaeb79bbf1a5645f6b4f8dc5bde8834ad5894a8db35fda9efa1fe"
+SRC_URI[typenum-1.18.0.sha256sum] = "1dccffe3ce07af9386bfd29e80c0ab1a8205a2fc34e4bcd40364df902cfa8f3f"
+SRC_URI[unicode-ident-1.0.17.sha256sum] = "00e2473a93778eb0bad35909dff6a10d28e63f792f16ed15e404fca9d5eeedbe"
 SRC_URI[unindent-0.2.3.sha256sum] = "c7de7d73e1754487cb58364ee906a499937a0dfabd86bcb980fa99ec8c8fa2ce"
 SRC_URI[version_check-0.9.5.sha256sum] = "0b928f33d975fc6ad9f86c8f283853ad26bdd5b10b7f1542aa2fa15e2289105a"
-SRC_URI[wasi-0.11.0+wasi-snapshot-preview1.sha256sum] = "9c8d87e72b64a3b4db28d11ce29237c246188f4f51057d65a7eab63b7987e423"
+SRC_URI[wasi-0.13.3+wasi-0.2.2.sha256sum] = "26816d2e1a4a36a2940b96c5296ce403917633dff8f3440e9b236ed6f6bacad2"
+SRC_URI[windows-targets-0.52.6.sha256sum] = "9b724f72796e036ab90c1021d4780d4d3d648aca59e491e6b98e725b84e99973"
+SRC_URI[windows_aarch64_gnullvm-0.52.6.sha256sum] = "32a4622180e7a0ec044bb555404c800bc9fd9ec262ec147edd5989ccd0c02cd3"
+SRC_URI[windows_aarch64_msvc-0.52.6.sha256sum] = "09ec2a7bb152e2252b53fa7803150007879548bc709c039df7627cabbd05d469"
+SRC_URI[windows_i686_gnu-0.52.6.sha256sum] = "8e9b5ad5ab802e97eb8e295ac6720e509ee4c243f69d781394014ebfe8bbfa0b"
+SRC_URI[windows_i686_gnullvm-0.52.6.sha256sum] = "0eee52d38c090b3caa76c563b86c3a4bd71ef1a819287c19d586d7334ae8ed66"
+SRC_URI[windows_i686_msvc-0.52.6.sha256sum] = "240948bc05c5e7c6dabba28bf89d89ffce3e303022809e73deaefe4f6ec56c66"
+SRC_URI[windows_x86_64_gnu-0.52.6.sha256sum] = "147a5c80aabfbf0c7d901cb5895d1de30ef2907eb21fbbab29ca94c5b08b1a78"
+SRC_URI[windows_x86_64_gnullvm-0.52.6.sha256sum] = "24d5b23dc417412679681396f2b49f3de8c1473deb516bd34410872eff51ed0d"
+SRC_URI[windows_x86_64_msvc-0.52.6.sha256sum] = "589f6da84c646204747d1270a2a5661ea66ed1cced2631d546fdfb155959f9ec"
+SRC_URI[wit-bindgen-rt-0.33.0.sha256sum] = "3268f3d866458b787f390cf61f4bbb563b922d091359f9608842999eaee3943c"
 SRC_URI[zeroize-1.8.1.sha256sum] = "ced3678a2879b30306d323f4542626697a464a97c0a07c9aebf7ebca65cd4dde"
diff --git a/meta/recipes-devtools/python/python3-bcrypt_4.2.1.bb b/meta/recipes-devtools/python/python3-bcrypt_4.3.0.bb
similarity index 86%
rename from meta/recipes-devtools/python/python3-bcrypt_4.2.1.bb
rename to meta/recipes-devtools/python/python3-bcrypt_4.3.0.bb
index 004e8ce8b1..931aae4310 100644
--- a/meta/recipes-devtools/python/python3-bcrypt_4.2.1.bb
+++ b/meta/recipes-devtools/python/python3-bcrypt_4.3.0.bb
@@ -6,7 +6,7 @@ HOMEPAGE = "https://pypi.org/project/bcrypt/"
 DEPENDS += "python3-cffi-native"
 LDFLAGS += "${@bb.utils.contains('DISTRO_FEATURES', 'ptest', '-fuse-ld=bfd', '', d)}"
 
-SRC_URI[sha256sum] = "6765386e3ab87f569b276988742039baab087b2cdb01e809d74e74503c2faafe"
+SRC_URI[sha256sum] = "3a3fd2204178b6d2adcf09cb4f6426ffef54762577a7c9b54c159008cb288c18"
 
 inherit pypi python_setuptools3_rust cargo-update-recipe-crates ptest-python-pytest
 
-- 
2.44.1


--===============9073433903153287974==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: attachment; filename="buildhistory-diff-full.txt"

packages/core2-64-poky-linux/python3-bcrypt: PV changed from "4.2.1" to "4.3.0"
packages/core2-64-poky-linux/python3-bcrypt: SRC_URI changed from "https://files.pythonhosted.org/packages/source/b/bcrypt/bcrypt-4.2.1.tar.gz;downloadfilename=bcrypt-4.2.1.tar.gz crate://crates.io/autocfg/1.4.0 crate://crates.io/base64/0.22.1 crate://crates.io/bcrypt/0.16.0 crate://crates.io/bcrypt-pbkdf/0.10.0 crate://crates.io/block-buffer/0.10.4 crate://crates.io/blowfish/0.9.1 crate://crates.io/byteorder/1.5.0 crate://crates.io/cfg-if/1.0.0 crate://crates.io/cipher/0.4.4 crate://crates.io/cpufeatures/0.2.15 crate://crates.io/crypto-common/0.1.6 crate://crates.io/digest/0.10.7 crate://crates.io/generic-array/0.14.7 crate://crates.io/getrandom/0.2.15 crate://crates.io/heck/0.5.0 crate://crates.io/indoc/2.0.5 crate://crates.io/inout/0.1.3 crate://crates.io/libc/0.2.164 crate://crates.io/memoffset/0.9.1 crate://crates.io/once_cell/1.20.2 crate://crates.io/pbkdf2/0.12.2 crate://crates.io/portable-atomic/1.9.0 crate://crates.io/proc-macro2/1.0.89 crate://crates.io/pyo3/0.23.1 crate://
 crates.io/pyo3-build-config/0.23.1 crate://crates.io/pyo3-ffi/0.23.1 crate://crates.io/pyo3-macros/0.23.1 crate://crates.io/pyo3-macros-backend/0.23.1 crate://crates.io/quote/1.0.37 crate://crates.io/sha2/0.10.8 crate://crates.io/subtle/2.6.1 crate://crates.io/syn/2.0.87 crate://crates.io/target-lexicon/0.12.16 crate://crates.io/typenum/1.17.0 crate://crates.io/unicode-ident/1.0.13 crate://crates.io/unindent/0.2.3 crate://crates.io/version_check/0.9.5 crate://crates.io/wasi/0.11.0+wasi-snapshot-preview1 crate://crates.io/zeroize/1.8.1" to "https://files.pythonhosted.org/packages/source/b/bcrypt/bcrypt-4.3.0.tar.gz;downloadfilename=bcrypt-4.3.0.tar.gz crate://crates.io/autocfg/1.4.0 crate://crates.io/base64/0.22.1 crate://crates.io/bcrypt/0.17.0 crate://crates.io/bcrypt-pbkdf/0.10.0 crate://crates.io/bitflags/2.8.0 crate://crates.io/block-buffer/0.10.4 crate://crates.io/blowfish/0.9.1 crate://crates.io/byteorder/1.5.0 crate://crates.io/cfg-if/1.0.0 crate://crates.io/cipher/0.4.4 crat
 e://crates.io/cpufeatures/0.2.17 crate://crates.io/crypto-common/0.1.6 crate://crates.io/digest/0.10.7 crate://crates.io/generic-array/0.14.7 crate://crates.io/getrandom/0.3.1 crate://crates.io/heck/0.5.0 crate://crates.io/indoc/2.0.5 crate://crates.io/inout/0.1.4 crate://crates.io/libc/0.2.170 crate://crates.io/memoffset/0.9.1 crate://crates.io/once_cell/1.20.3 crate://crates.io/pbkdf2/0.12.2 crate://crates.io/portable-atomic/1.11.0 crate://crates.io/proc-macro2/1.0.93 crate://crates.io/pyo3/0.23.5 crate://crates.io/pyo3-build-config/0.23.5 crate://crates.io/pyo3-ffi/0.23.5 crate://crates.io/pyo3-macros/0.23.5 crate://crates.io/pyo3-macros-backend/0.23.5 crate://crates.io/quote/1.0.38 crate://crates.io/sha2/0.10.8 crate://crates.io/subtle/2.6.1 crate://crates.io/syn/2.0.98 crate://crates.io/target-lexicon/0.12.16 crate://crates.io/typenum/1.18.0 crate://crates.io/unicode-ident/1.0.17 crate://crates.io/unindent/0.2.3 crate://crates.io/version_check/0.9.5 crate://crates.io/wasi/0.13.
 3+wasi-0.2.2 crate://crates.io/windows-targets/0.52.6 crate://crates.io/windows_aarch64_gnullvm/0.52.6 crate://crates.io/windows_aarch64_msvc/0.52.6 crate://crates.io/windows_i686_gnu/0.52.6 crate://crates.io/windows_i686_gnullvm/0.52.6 crate://crates.io/windows_i686_msvc/0.52.6 crate://crates.io/windows_x86_64_gnu/0.52.6 crate://crates.io/windows_x86_64_gnullvm/0.52.6 crate://crates.io/windows_x86_64_msvc/0.52.6 crate://crates.io/wit-bindgen-rt/0.33.0 crate://crates.io/zeroize/1.8.1"
packages/core2-64-poky-linux/python3-bcrypt: PKGV changed from 4.2.1 [default] to 4.3.0 [default]
packages/core2-64-poky-linux/python3-bcrypt/python3-bcrypt-dbg: PV changed from "4.2.1" to "4.3.0"
packages/core2-64-poky-linux/python3-bcrypt/python3-bcrypt-dbg: PKGV changed from 4.2.1 [default] to 4.3.0 [default]
packages/core2-64-poky-linux/python3-bcrypt/python3-bcrypt-dbg: PKGSIZE changed from 140944 to 141528 (+0%)
packages/core2-64-poky-linux/python3-bcrypt/python3-bcrypt-dev: PV changed from "4.2.1" to "4.3.0"
packages/core2-64-poky-linux/python3-bcrypt/python3-bcrypt-dev: PKGV changed from 4.2.1 [default] to 4.3.0 [default]
packages/core2-64-poky-linux/python3-bcrypt/python3-bcrypt-doc: PV changed from "4.2.1" to "4.3.0"
packages/core2-64-poky-linux/python3-bcrypt/python3-bcrypt-doc: PKGV changed from 4.2.1 [default] to 4.3.0 [default]
packages/core2-64-poky-linux/python3-bcrypt/python3-bcrypt-locale: PV changed from "4.2.1" to "4.3.0"
packages/core2-64-poky-linux/python3-bcrypt/python3-bcrypt-locale: PKGV changed from 4.2.1 [default] to 4.3.0 [default]
packages/core2-64-poky-linux/python3-bcrypt/python3-bcrypt-ptest: PV changed from "4.2.1" to "4.3.0"
packages/core2-64-poky-linux/python3-bcrypt/python3-bcrypt-ptest: PKGV changed from 4.2.1 [default] to 4.3.0 [default]
packages/core2-64-poky-linux/python3-bcrypt/python3-bcrypt-ptest: PKGSIZE changed from 16674 to 17470 (+5%)
packages/core2-64-poky-linux/python3-bcrypt/python3-bcrypt-src: PV changed from "4.2.1" to "4.3.0"
packages/core2-64-poky-linux/python3-bcrypt/python3-bcrypt-src: PKGV changed from 4.2.1 [default] to 4.3.0 [default]
packages/core2-64-poky-linux/python3-bcrypt/python3-bcrypt-staticdev: PV changed from "4.2.1" to "4.3.0"
packages/core2-64-poky-linux/python3-bcrypt/python3-bcrypt-staticdev: PKGV changed from 4.2.1 [default] to 4.3.0 [default]
packages/core2-64-poky-linux/python3-bcrypt/python3-bcrypt: PV changed from "4.2.1" to "4.3.0"
packages/core2-64-poky-linux/python3-bcrypt/python3-bcrypt: PKGV changed from 4.2.1 [default] to 4.3.0 [default]
packages/core2-64-poky-linux/python3-bcrypt/python3-bcrypt: PKGSIZE changed from 545340 to 545567 (+0%)
Changes to packages/core2-64-poky-linux/python3-bcrypt (sysroot):
  /usr/lib/python3.13/site-packages/bcrypt-4.2.1.dist-info moved to /usr/lib/python3.13/site-packages/bcrypt-4.3.0.dist-info

--===============9073433903153287974==
Content-Type: application/octet-stream
MIME-Version: 1.0
Content-Transfer-Encoding: base64
Content-Disposition: attachment;
 filename="0001-python3-bcrypt-upgrade-4.2.1-4.3.0.patch"

RnJvbSAzNGNlYTg5YmFkNWU2ZjlkOGE5NzUwMWE2YmZlMWUxNzFiODQ4YWIyIE1vbiBTZXAgMTcg
MDA6MDA6MDAgMjAwMQpGcm9tOiBVcGdyYWRlIEhlbHBlciA8YXVoQHlvY3RvcHJvamVjdC5vcmc+
CkRhdGU6IFNhdCwgMSBNYXIgMjAyNSAwNzo1MDowNCArMDAwMApTdWJqZWN0OiBbUEFUQ0hdIHB5
dGhvbjMtYmNyeXB0OiB1cGdyYWRlIDQuMi4xIC0+IDQuMy4wCgotLS0KIC4uLi9weXRob24vcHl0
aG9uMy1iY3J5cHQtY3JhdGVzLmluYyAgICAgICAgICB8IDk0ICsrKysrKysrKysrKy0tLS0tLS0K
IC4uLmNyeXB0XzQuMi4xLmJiID0+IHB5dGhvbjMtYmNyeXB0XzQuMy4wLmJifSB8ICAyICstCiAy
IGZpbGVzIGNoYW5nZWQsIDU5IGluc2VydGlvbnMoKyksIDM3IGRlbGV0aW9ucygtKQogcmVuYW1l
IG1ldGEvcmVjaXBlcy1kZXZ0b29scy9weXRob24ve3B5dGhvbjMtYmNyeXB0XzQuMi4xLmJiID0+
IHB5dGhvbjMtYmNyeXB0XzQuMy4wLmJifSAoODYlKQoKZGlmZiAtLWdpdCBhL21ldGEvcmVjaXBl
cy1kZXZ0b29scy9weXRob24vcHl0aG9uMy1iY3J5cHQtY3JhdGVzLmluYyBiL21ldGEvcmVjaXBl
cy1kZXZ0b29scy9weXRob24vcHl0aG9uMy1iY3J5cHQtY3JhdGVzLmluYwppbmRleCA1NzZhYmNk
N2NiLi5lMGEyOTI2NTE5IDEwMDY0NAotLS0gYS9tZXRhL3JlY2lwZXMtZGV2dG9vbHMvcHl0aG9u
L3B5dGhvbjMtYmNyeXB0LWNyYXRlcy5pbmMKKysrIGIvbWV0YS9yZWNpcGVzLWRldnRvb2xzL3B5
dGhvbi9weXRob24zLWJjcnlwdC1jcmF0ZXMuaW5jCkBAIC00LDgxICs0LDEwMyBAQAogU1JDX1VS
SSArPSAiIFwKICAgICBjcmF0ZTovL2NyYXRlcy5pby9hdXRvY2ZnLzEuNC4wIFwKICAgICBjcmF0
ZTovL2NyYXRlcy5pby9iYXNlNjQvMC4yMi4xIFwKLSAgICBjcmF0ZTovL2NyYXRlcy5pby9iY3J5
cHQvMC4xNi4wIFwKKyAgICBjcmF0ZTovL2NyYXRlcy5pby9iY3J5cHQvMC4xNy4wIFwKICAgICBj
cmF0ZTovL2NyYXRlcy5pby9iY3J5cHQtcGJrZGYvMC4xMC4wIFwKKyAgICBjcmF0ZTovL2NyYXRl
cy5pby9iaXRmbGFncy8yLjguMCBcCiAgICAgY3JhdGU6Ly9jcmF0ZXMuaW8vYmxvY2stYnVmZmVy
LzAuMTAuNCBcCiAgICAgY3JhdGU6Ly9jcmF0ZXMuaW8vYmxvd2Zpc2gvMC45LjEgXAogICAgIGNy
YXRlOi8vY3JhdGVzLmlvL2J5dGVvcmRlci8xLjUuMCBcCiAgICAgY3JhdGU6Ly9jcmF0ZXMuaW8v
Y2ZnLWlmLzEuMC4wIFwKICAgICBjcmF0ZTovL2NyYXRlcy5pby9jaXBoZXIvMC40LjQgXAotICAg
IGNyYXRlOi8vY3JhdGVzLmlvL2NwdWZlYXR1cmVzLzAuMi4xNSBcCisgICAgY3JhdGU6Ly9jcmF0
ZXMuaW8vY3B1ZmVhdHVyZXMvMC4yLjE3IFwKICAgICBjcmF0ZTovL2NyYXRlcy5pby9jcnlwdG8t
Y29tbW9uLzAuMS42IFwKICAgICBjcmF0ZTovL2NyYXRlcy5pby9kaWdlc3QvMC4xMC43IFwKICAg
ICBjcmF0ZTovL2NyYXRlcy5pby9nZW5lcmljLWFycmF5LzAuMTQuNyBcCi0gICAgY3JhdGU6Ly9j
cmF0ZXMuaW8vZ2V0cmFuZG9tLzAuMi4xNSBcCisgICAgY3JhdGU6Ly9jcmF0ZXMuaW8vZ2V0cmFu
ZG9tLzAuMy4xIFwKICAgICBjcmF0ZTovL2NyYXRlcy5pby9oZWNrLzAuNS4wIFwKICAgICBjcmF0
ZTovL2NyYXRlcy5pby9pbmRvYy8yLjAuNSBcCi0gICAgY3JhdGU6Ly9jcmF0ZXMuaW8vaW5vdXQv
MC4xLjMgXAotICAgIGNyYXRlOi8vY3JhdGVzLmlvL2xpYmMvMC4yLjE2NCBcCisgICAgY3JhdGU6
Ly9jcmF0ZXMuaW8vaW5vdXQvMC4xLjQgXAorICAgIGNyYXRlOi8vY3JhdGVzLmlvL2xpYmMvMC4y
LjE3MCBcCiAgICAgY3JhdGU6Ly9jcmF0ZXMuaW8vbWVtb2Zmc2V0LzAuOS4xIFwKLSAgICBjcmF0
ZTovL2NyYXRlcy5pby9vbmNlX2NlbGwvMS4yMC4yIFwKKyAgICBjcmF0ZTovL2NyYXRlcy5pby9v
bmNlX2NlbGwvMS4yMC4zIFwKICAgICBjcmF0ZTovL2NyYXRlcy5pby9wYmtkZjIvMC4xMi4yIFwK
LSAgICBjcmF0ZTovL2NyYXRlcy5pby9wb3J0YWJsZS1hdG9taWMvMS45LjAgXAotICAgIGNyYXRl
Oi8vY3JhdGVzLmlvL3Byb2MtbWFjcm8yLzEuMC44OSBcCi0gICAgY3JhdGU6Ly9jcmF0ZXMuaW8v
cHlvMy8wLjIzLjEgXAotICAgIGNyYXRlOi8vY3JhdGVzLmlvL3B5bzMtYnVpbGQtY29uZmlnLzAu
MjMuMSBcCi0gICAgY3JhdGU6Ly9jcmF0ZXMuaW8vcHlvMy1mZmkvMC4yMy4xIFwKLSAgICBjcmF0
ZTovL2NyYXRlcy5pby9weW8zLW1hY3Jvcy8wLjIzLjEgXAotICAgIGNyYXRlOi8vY3JhdGVzLmlv
L3B5bzMtbWFjcm9zLWJhY2tlbmQvMC4yMy4xIFwKLSAgICBjcmF0ZTovL2NyYXRlcy5pby9xdW90
ZS8xLjAuMzcgXAorICAgIGNyYXRlOi8vY3JhdGVzLmlvL3BvcnRhYmxlLWF0b21pYy8xLjExLjAg
XAorICAgIGNyYXRlOi8vY3JhdGVzLmlvL3Byb2MtbWFjcm8yLzEuMC45MyBcCisgICAgY3JhdGU6
Ly9jcmF0ZXMuaW8vcHlvMy8wLjIzLjUgXAorICAgIGNyYXRlOi8vY3JhdGVzLmlvL3B5bzMtYnVp
bGQtY29uZmlnLzAuMjMuNSBcCisgICAgY3JhdGU6Ly9jcmF0ZXMuaW8vcHlvMy1mZmkvMC4yMy41
IFwKKyAgICBjcmF0ZTovL2NyYXRlcy5pby9weW8zLW1hY3Jvcy8wLjIzLjUgXAorICAgIGNyYXRl
Oi8vY3JhdGVzLmlvL3B5bzMtbWFjcm9zLWJhY2tlbmQvMC4yMy41IFwKKyAgICBjcmF0ZTovL2Ny
YXRlcy5pby9xdW90ZS8xLjAuMzggXAogICAgIGNyYXRlOi8vY3JhdGVzLmlvL3NoYTIvMC4xMC44
IFwKICAgICBjcmF0ZTovL2NyYXRlcy5pby9zdWJ0bGUvMi42LjEgXAotICAgIGNyYXRlOi8vY3Jh
dGVzLmlvL3N5bi8yLjAuODcgXAorICAgIGNyYXRlOi8vY3JhdGVzLmlvL3N5bi8yLjAuOTggXAog
ICAgIGNyYXRlOi8vY3JhdGVzLmlvL3RhcmdldC1sZXhpY29uLzAuMTIuMTYgXAotICAgIGNyYXRl
Oi8vY3JhdGVzLmlvL3R5cGVudW0vMS4xNy4wIFwKLSAgICBjcmF0ZTovL2NyYXRlcy5pby91bmlj
b2RlLWlkZW50LzEuMC4xMyBcCisgICAgY3JhdGU6Ly9jcmF0ZXMuaW8vdHlwZW51bS8xLjE4LjAg
XAorICAgIGNyYXRlOi8vY3JhdGVzLmlvL3VuaWNvZGUtaWRlbnQvMS4wLjE3IFwKICAgICBjcmF0
ZTovL2NyYXRlcy5pby91bmluZGVudC8wLjIuMyBcCiAgICAgY3JhdGU6Ly9jcmF0ZXMuaW8vdmVy
c2lvbl9jaGVjay8wLjkuNSBcCi0gICAgY3JhdGU6Ly9jcmF0ZXMuaW8vd2FzaS8wLjExLjArd2Fz
aS1zbmFwc2hvdC1wcmV2aWV3MSBcCisgICAgY3JhdGU6Ly9jcmF0ZXMuaW8vd2FzaS8wLjEzLjMr
d2FzaS0wLjIuMiBcCisgICAgY3JhdGU6Ly9jcmF0ZXMuaW8vd2luZG93cy10YXJnZXRzLzAuNTIu
NiBcCisgICAgY3JhdGU6Ly9jcmF0ZXMuaW8vd2luZG93c19hYXJjaDY0X2dudWxsdm0vMC41Mi42
IFwKKyAgICBjcmF0ZTovL2NyYXRlcy5pby93aW5kb3dzX2FhcmNoNjRfbXN2Yy8wLjUyLjYgXAor
ICAgIGNyYXRlOi8vY3JhdGVzLmlvL3dpbmRvd3NfaTY4Nl9nbnUvMC41Mi42IFwKKyAgICBjcmF0
ZTovL2NyYXRlcy5pby93aW5kb3dzX2k2ODZfZ251bGx2bS8wLjUyLjYgXAorICAgIGNyYXRlOi8v
Y3JhdGVzLmlvL3dpbmRvd3NfaTY4Nl9tc3ZjLzAuNTIuNiBcCisgICAgY3JhdGU6Ly9jcmF0ZXMu
aW8vd2luZG93c194ODZfNjRfZ251LzAuNTIuNiBcCisgICAgY3JhdGU6Ly9jcmF0ZXMuaW8vd2lu
ZG93c194ODZfNjRfZ251bGx2bS8wLjUyLjYgXAorICAgIGNyYXRlOi8vY3JhdGVzLmlvL3dpbmRv
d3NfeDg2XzY0X21zdmMvMC41Mi42IFwKKyAgICBjcmF0ZTovL2NyYXRlcy5pby93aXQtYmluZGdl
bi1ydC8wLjMzLjAgXAogICAgIGNyYXRlOi8vY3JhdGVzLmlvL3plcm9pemUvMS44LjEgXAogIgog
CiBTUkNfVVJJW2F1dG9jZmctMS40LjAuc2hhMjU2c3VtXSA9ICJhY2U1MGJhZGU4ZTYyMzRhYTE0
MGQ5YTJmNTUyYmJlZTFkYjRkMzUzZjY5YjgyMTdiYzUwMzQ5MGZjMWE5ZjI2IgogU1JDX1VSSVti
YXNlNjQtMC4yMi4xLnNoYTI1NnN1bV0gPSAiNzJiMzI1NGYxNjI1MWE4MzgxYWExMmU0MGUzYzRk
MmYwMTk5ZjhjNjUwOGZiZWNiOWQ5MWY1NzVlMGZiYjhjNiIKLVNSQ19VUklbYmNyeXB0LTAuMTYu
MC5zaGEyNTZzdW1dID0gIjJiMTg2NmVjZWY0ZjJkMDZhMGJiNzc4ODAwMTVmZGYyYjg5ZTI1YTFj
MmU1YWRkYWNiODdlNDU5Yzg2ZGM2N2UiCitTUkNfVVJJW2JjcnlwdC0wLjE3LjAuc2hhMjU2c3Vt
XSA9ICI5Mjc1OGFkNjA3N2U0Yzc2YTZjYWRiY2U1MDA1ZjY2NmRmNzBkNGYxM2IxOTk3NmIxYTgw
NjJlZWY4ODAwNDBmIgogU1JDX1VSSVtiY3J5cHQtcGJrZGYtMC4xMC4wLnNoYTI1NnN1bV0gPSAi
NmFlYWMyZTFmZTg4ODc2OWYzNGYwNWFjMzQzYmJlZjk4YjE0ZDFmZmIyOTJhYjY5ZDQ2MDhiM2Fi
Yzg2ZjJhMiIKK1NSQ19VUklbYml0ZmxhZ3MtMi44LjAuc2hhMjU2c3VtXSA9ICI4ZjY4ZjUzYzgz
YWI5NTdmNzJjMzI2NDJmMzg2OGVlYzAzZWI5NzRkMWZiODJlNDUzMTI4NDU2NDgyNjEzZDM2Igog
U1JDX1VSSVtibG9jay1idWZmZXItMC4xMC40LnNoYTI1NnN1bV0gPSAiMzA3OGM3NjI5YjYyZDNm
MDQzOTUxN2ZhMzk0OTk2YWNhY2M1Y2JjOTFjNWEyMGQ4YzY1OGU3N2FiZDUwM2E3MSIKIFNSQ19V
UklbYmxvd2Zpc2gtMC45LjEuc2hhMjU2c3VtXSA9ICJlNDEyZTJjZDBmMmIyZDkzZTAyNTQzY2Vh
ZTc5MTdiM2M3MDMzMTU3M2RmMTllZTA0NmJjYmMzNWU0NWU4N2Q3IgogU1JDX1VSSVtieXRlb3Jk
ZXItMS41LjAuc2hhMjU2c3VtXSA9ICIxZmQwZjI1ODQxNDZmNmYyZWY0ODA4NTA1MDg4NmFjZjM1
M2JlZmY3MzA1ZWJkMWFlNjk1MDBlMjdjNjdmNjRiIgogU1JDX1VSSVtjZmctaWYtMS4wLjAuc2hh
MjU2c3VtXSA9ICJiYWYxZGU0MzM5NzYxNTg4YmMwNjE5ZTNjYmMwMTIwZWU1ODJlYmI3NGI1M2I0
ZWZiZjc5MTE3YmQyZGE0MGZkIgogU1JDX1VSSVtjaXBoZXItMC40LjQuc2hhMjU2c3VtXSA9ICI3
NzNmM2I5YWY2NDQ0N2QyY2U5ODUwMzMwYzQ3MzUxNTAxNGFhMjM1ZTZhNzgzYjAyZGI4MWZmMzll
NGEzZGFkIgotU1JDX1VSSVtjcHVmZWF0dXJlcy0wLjIuMTUuc2hhMjU2c3VtXSA9ICIwY2E3NDFh
OTYyZTFiMGJmZjZkNzI0YTFhMDk1OGI2ODY0MDZlODUzYmIxNDA2MWYyMTg1NjJlMTg5NmY5NWU2
IgorU1JDX1VSSVtjcHVmZWF0dXJlcy0wLjIuMTcuc2hhMjU2c3VtXSA9ICI1OWVkNTgzOGVlYmIy
NmEyYmIyZTU4ZjZkNWI1MzE2OTg5YWU5ZDA4YmFiMTBlMGU2ZDEwM2U2NTZkMWIwMjgwIgogU1JD
X1VSSVtjcnlwdG8tY29tbW9uLTAuMS42LnNoYTI1NnN1bV0gPSAiMWJmYjEyNTAyZjNmYzQ2Y2Nh
MWJiNTFhYzI4ZGY5ZDYxOGQ4MTNjZGMzZDJmMjViOWZlNzc1YTM0YWYyNmJiMyIKIFNSQ19VUklb
ZGlnZXN0LTAuMTAuNy5zaGEyNTZzdW1dID0gIjllZDlhMjgxZjdiYzliNzU3NmU2MTQ2OGJhNjE1
YTY2YTVjOGNmZGZmNDI0MjBhNzBhYTgyNzAxYTNiMWUyOTIiCiBTUkNfVVJJW2dlbmVyaWMtYXJy
YXktMC4xNC43LnNoYTI1NnN1bV0gPSAiODU2NDljYTUxZmQ3MjI3MmQ3ODIxYWRhZjI3NGFkOTFj
Mjg4Mjc3NzEzZDljMTg4MjBkODQ5OWE3ZmY2OWU5YSIKLVNSQ19VUklbZ2V0cmFuZG9tLTAuMi4x
NS5zaGEyNTZzdW1dID0gImM0NTY3YzhkYjEwYWU5MTA4OWM5OWFmODRjNjhjMzhkYTNlYzJmMDg3
YzNmODI5NjBiY2RiZjM2NTZiNmY0ZDciCitTUkNfVVJJW2dldHJhbmRvbS0wLjMuMS5zaGEyNTZz
dW1dID0gIjQzYTQ5YzM5Mjg4MWNlNmQ1YzNiOGNiNzBmOTg3MTdiN2MwN2FhYmJkZmYwNjY4N2I5
MDMwZGJmYmUyNzI1ZjgiCiBTUkNfVVJJW2hlY2stMC41LjAuc2hhMjU2c3VtXSA9ICIyMzA0ZTAw
OTgzZjg3ZmZiMzhiNTViNDQ0YjVlM2I2MGE4ODRiNWQzMGMwZmNhN2Q4MmZlMzM0NDliYmU1NWVh
IgogU1JDX1VSSVtpbmRvYy0yLjAuNS5zaGEyNTZzdW1dID0gImIyNDhmNTIyNGQxZDYwNjAwNWUw
MmM5N2Y1YWE0ZTg4ZWViMjMwNDg4YmNjMDNiYzljYTRkNzk5MTM5OWYyYjUiCi1TUkNfVVJJW2lu
b3V0LTAuMS4zLnNoYTI1NnN1bV0gPSAiYTBjMTA1NTNkNjY0YTRkMGJjZmY5ZjQyMTVkMGFhYzY3
YTYzOWNjNjhlZjY2MDg0MGFmZTMwOWI4MDdiYzlmNSIKLVNSQ19VUklbbGliYy0wLjIuMTY0LnNo
YTI1NnN1bV0gPSAiNDMzYmZlMDZiOGM3NWRhOWIyZTNmYmVhNmU1MzI5ZmY4Nzc0OGYwYjE0NGVm
NzUzMDZlNjc0YzNmNmY3YzEzZiIKK1NSQ19VUklbaW5vdXQtMC4xLjQuc2hhMjU2c3VtXSA9ICI4
NzlmMTBlNjNjMjA2MjllY2FiYmI2NGE4MDEwMzE5NzM4YzY2YTVjZDBjMjliMDJkNjNkMjcyYjAz
NzUxZDAxIgorU1JDX1VSSVtsaWJjLTAuMi4xNzAuc2hhMjU2c3VtXSA9ICI4NzViMzY4MGNiMmY4
ZjcxYmRjZjlhMzBmMzhkNDgyODJmNWQzYzk1Y2JmOWIzZmE1NzI2OWJiNWQ1YzA2ODI4IgogU1JD
X1VSSVttZW1vZmZzZXQtMC45LjEuc2hhMjU2c3VtXSA9ICI0ODgwMTZiZmFlNDU3YjAzNmQ5OTYw
OTJmNmNiNDQ4Njc3NjExY2U0NDQ5ZTk3MGNlYWY0MjY5NTIwM2YyMThhIgotU1JDX1VSSVtvbmNl
X2NlbGwtMS4yMC4yLnNoYTI1NnN1bV0gPSAiMTI2MWZlN2UzM2M3M2IzNTRlYWI0M2IxMjczYTU3
YzhmOTY3ZDAzOTFlODAzNTNlNTFmNzY0YWMwMmNmNjc3NSIKK1NSQ19VUklbb25jZV9jZWxsLTEu
MjAuMy5zaGEyNTZzdW1dID0gIjk0NTQ2MmE0YjgxZTQzYzRlM2JhOTZiZDdiNDlkODM0YzZmNjEx
OTgzNTZhYTg1ODczM2JjNGFjZjNjYmU2MmUiCiBTUkNfVVJJW3Bia2RmMi0wLjEyLjIuc2hhMjU2
c3VtXSA9ICJmOGVkNmE3NzYxZjc2ZTNiOWY5MmRmYjBhNjBhNmE2NDc3YzYxMDI0Yjc3NTE0N2Zm
MDk3M2EwMjY1M2FiYWYyIgotU1JDX1VSSVtwb3J0YWJsZS1hdG9taWMtMS45LjAuc2hhMjU2c3Vt
XSA9ICJjYzljNjhhM2Y2ZGEwNjc1M2U5MzM1ZDYzZTI3ZjZiOTc1NGRkMTkyMGQ5NDExMzViN2Vh
ODIyNGYxNDFhZGIyIgotU1JDX1VSSVtwcm9jLW1hY3JvMi0xLjAuODkuc2hhMjU2c3VtXSA9ICJm
MTM5YjA2NjJkZTA4NTkxNmQxZmI2N2QyYjQxNjlkMWFkZGRkZGExOTE5ZTY5NmYzMjUyYjc0MGI2
Mjk5ODZlIgotU1JDX1VSSVtweW8zLTAuMjMuMS5zaGEyNTZzdW1dID0gIjdlYmIwYzBjYzBkZTk2
NzhlNTNiZTljY2Y4YTJhYjUzMDQ1ZTZlM2E4YmUwMzM5M2NlY2NjNWU3Mzk2Y2NiNDAiCi1TUkNf
VVJJW3B5bzMtYnVpbGQtY29uZmlnLTAuMjMuMS5zaGEyNTZzdW1dID0gIjgwZTNjZTY5YzRlYzM0
NDc2NTM0YjQ5MGU0MTJiODcxYmEwM2E4MmUzNTYwNGMzZGZiOTVmY2I2YmZiNjBjMDkiCi1TUkNf
VVJJW3B5bzMtZmZpLTAuMjMuMS5zaGEyNTZzdW1dID0gIjNiMDlmMzExYzc2YjM2ZGZkNmRkNmY3
ZmE2ZjlmMThlN2U0NmExYzkzNzExMGQyODNlODBiMTJiYTI0NjhhNzUiCi1TUkNfVVJJW3B5bzMt
bWFjcm9zLTAuMjMuMS5zaGEyNTZzdW1dID0gImZkNGY3NDA4NjUzNmQxZTFkZWFmZjk5ZWMwMzg3
NDgxZmIzMzI1YzgyZTRlNDhiZTBlNzVhYjNkM2ZjYjQ4N2EiCi1TUkNfVVJJW3B5bzMtbWFjcm9z
LWJhY2tlbmQtMC4yMy4xLnNoYTI1NnN1bV0gPSAiOWU3N2RmZWI3NmIzMmJiZjA2OTE0NGE1ZWEw
YTM2MTc2YWI1OWM4ZGI5Y2UyODczMmQwZjA2ZjA5NmJiZmJjOCIKLVNSQ19VUklbcXVvdGUtMS4w
LjM3LnNoYTI1NnN1bV0gPSAiYjViOWQzNGI4OTkxZDE5ZDk4MDgxYjQ2ZWFjZGQ4ZWI1OGM2ZjJi
MjAxMTM5ZjdjNWY2NDNjYzE1NWE2MzNhZiIKK1NSQ19VUklbcG9ydGFibGUtYXRvbWljLTEuMTEu
MC5zaGEyNTZzdW1dID0gIjM1MGU5YjQ4Y2JjNmIwZTAyOGIwNDczYjExNDQ1NGM2MzE2ZTU3MzM2
ZWUxODRjZWFiNmU1M2Y3MmMxNzhiM2UiCitTUkNfVVJJW3Byb2MtbWFjcm8yLTEuMC45My5zaGEy
NTZzdW1dID0gIjYwOTQ2YTY4ZTVmOWQyOGIwZGMxYzIxYmI4YTk3ZWU3ZDAxOGE4YjMyMmZhNTc4
MzhiYTMxY2M4NzhlMjJkOTkiCitTUkNfVVJJW3B5bzMtMC4yMy41LnNoYTI1NnN1bV0gPSAiNzc3
OGJmZmQ4NWNmMzgxNzVhYzFmNTQ1NTA5NjY1ZDBiOWI5MmExOThjYTc5NDFmMTMxZjg1ZjdhNGY5
YTg3MiIKK1NSQ19VUklbcHlvMy1idWlsZC1jb25maWctMC4yMy41LnNoYTI1NnN1bV0gPSAiOTRm
NmNiZTg2ZWYzYmYxODk5OGQ5ZGY2ZTBmM2ZjMTA1MGE4YzVlZmE0MDliZjcxMmU2NjFhNDM2NmUw
MTBmYiIKK1NSQ19VUklbcHlvMy1mZmktMC4yMy41LnNoYTI1NnN1bV0gPSAiZTlmMWI0YzQzMWMw
YmIxYzhmYjBhMzM4NzA5ODU5ZWVkMGQwMzBmZjZkYWEzNDM2OGQzYjE1MmE2M2RmZGQ4ZCIKK1NS
Q19VUklbcHlvMy1tYWNyb3MtMC4yMy41LnNoYTI1NnN1bV0gPSAiZmJjMjIwMTMyOGY2M2M0NzEw
ZjY4YWJkZjY1M2M4OWQ4ZGJjMjg1OGI4OGM1ZDg4YjBmZjM4YTc1Mjg4YTlkYSIKK1NSQ19VUklb
cHlvMy1tYWNyb3MtYmFja2VuZC0wLjIzLjUuc2hhMjU2c3VtXSA9ICJmY2E2NzI2YWQwZjNkYTlj
OWRlMDkzZDZmMTE2YTkzYzFhMzhlNDE3ZWQ3M2JmMTM4NDcyY2Y0MDY0ZjcyMDI4IgorU1JDX1VS
SVtxdW90ZS0xLjAuMzguc2hhMjU2c3VtXSA9ICIwZTRkY2NhYWFmODk1MTRmNTQ2YzY5M2RkYzE0
MGY3MjlmOTU4YzI0NzkxOGExMzM4MGNjY2M2MDc4MzkxYWNjIgogU1JDX1VSSVtzaGEyLTAuMTAu
OC5zaGEyNTZzdW1dID0gIjc5M2RiNzVhZDJiY2FmYzNmZmE3YzY4YjIxNWZlZTI2OGY1Mzc5ODJj
ZDkwMWQxMzJmODljNjM0M2YzYTNkYzgiCiBTUkNfVVJJW3N1YnRsZS0yLjYuMS5zaGEyNTZzdW1d
ID0gIjEzYzJiZGRlY2M1N2IzODRkZWUxODY1MjM1OGZiMjMxNzJmYWNiOGEyYzUxY2NjMTBkNzRj
MTU3YmRlYTMyOTIiCi1TUkNfVVJJW3N5bi0yLjAuODcuc2hhMjU2c3VtXSA9ICIyNWFhNGNlMzQ2
ZDAzYTZkY2Q2OGRkOGI0MDEwYmNiNzRlNTRlNjJjOTBjNTczZjM5NGM0NmVhZTk5YWJhMzJkIgor
U1JDX1VSSVtzeW4tMi4wLjk4LnNoYTI1NnN1bV0gPSAiMzYxNDdmMWE0OGFlMGVjMmI1YjNiYzVi
NTM3ZDI2NzQ1NzU1NWExMGRjMDZmM2RiYzhjYjExYmEzMDA2ZDNiMSIKIFNSQ19VUklbdGFyZ2V0
LWxleGljb24tMC4xMi4xNi5zaGEyNTZzdW1dID0gIjYxYzQxYWYyN2RkNmQxZTI3YjFiMTZiNDg5
ZGI3OTg0NDM0NzhjZWYxZjA2YTY2MGM5NmRiNjE3YmE1ZGUzYjEiCi1TUkNfVVJJW3R5cGVudW0t
MS4xNy4wLnNoYTI1NnN1bV0gPSAiNDJmZjBiZjBjNjZiODIzOGM2ZjNiNTc4ZGYzN2QwYjc4NDhl
NTVkZjg1NzdiM2Y3NGY5MmE2OWFjY2VlYjgyNSIKLVNSQ19VUklbdW5pY29kZS1pZGVudC0xLjAu
MTMuc2hhMjU2c3VtXSA9ICJlOTFiNTZjZDRjYWRhZWI3OWJiZjFhNTY0NWY2YjRmOGRjNWJkZTg4
MzRhZDU4OTRhOGRiMzVmZGE5ZWZhMWZlIgorU1JDX1VSSVt0eXBlbnVtLTEuMTguMC5zaGEyNTZz
dW1dID0gIjFkY2NmZmUzY2UwN2FmOTM4NmJmZDI5ZTgwYzBhYjFhODIwNWEyZmMzNGU0YmNkNDAz
NjRkZjkwMmNmYThmM2YiCitTUkNfVVJJW3VuaWNvZGUtaWRlbnQtMS4wLjE3LnNoYTI1NnN1bV0g
PSAiMDBlMjQ3M2E5Mzc3OGViMGJhZDM1OTA5ZGZmNmExMGQyOGU2M2Y3OTJmMTZlZDE1ZTQwNGZj
YTlkNWVlZWRiZSIKIFNSQ19VUklbdW5pbmRlbnQtMC4yLjMuc2hhMjU2c3VtXSA9ICJjN2RlN2Q3
M2UxNzU0NDg3Y2I1ODM2NGVlOTA2YTQ5OTkzN2EwZGZhYmQ4NmJjYjk4MGZhOTllYzhjOGZhMmNl
IgogU1JDX1VSSVt2ZXJzaW9uX2NoZWNrLTAuOS41LnNoYTI1NnN1bV0gPSAiMGI5MjhmMzNkOTc1
ZmM2YWQ5Zjg2YzhmMjgzODUzYWQyNmJkZDViMTBiN2YxNTQyYWEyZmExNWUyMjg5MTA1YSIKLVNS
Q19VUklbd2FzaS0wLjExLjArd2FzaS1zbmFwc2hvdC1wcmV2aWV3MS5zaGEyNTZzdW1dID0gIjlj
OGQ4N2U3MmI2NGEzYjRkYjI4ZDExY2UyOTIzN2MyNDYxODhmNGY1MTA1N2Q2NWE3ZWFiNjNiNzk4
N2U0MjMiCitTUkNfVVJJW3dhc2ktMC4xMy4zK3dhc2ktMC4yLjIuc2hhMjU2c3VtXSA9ICIyNjgx
NmQyZTFhNGEzNmEyOTQwYjk2YzUyOTZjZTQwMzkxNzYzM2RmZjhmMzQ0MGU5YjIzNmVkNmY2YmFj
YWQyIgorU1JDX1VSSVt3aW5kb3dzLXRhcmdldHMtMC41Mi42LnNoYTI1NnN1bV0gPSAiOWI3MjRm
NzI3OTZlMDM2YWI5MGMxMDIxZDQ3ODBkNGQzZDY0OGFjYTU5ZTQ5MWU2Yjk4ZTcyNWI4NGU5OTk3
MyIKK1NSQ19VUklbd2luZG93c19hYXJjaDY0X2dudWxsdm0tMC41Mi42LnNoYTI1NnN1bV0gPSAi
MzJhNDYyMjE4MGU3YTBlYzA0NGJiNTU1NDA0YzgwMGJjOWZkOWVjMjYyZWMxNDdlZGQ1OTg5Y2Nk
MGMwMmNkMyIKK1NSQ19VUklbd2luZG93c19hYXJjaDY0X21zdmMtMC41Mi42LnNoYTI1NnN1bV0g
PSAiMDllYzJhN2JiMTUyZTIyNTJiNTNmYTc4MDMxNTAwMDc4Nzk1NDhiYzcwOWMwMzlkZjc2Mjdj
YWJiZDA1ZDQ2OSIKK1NSQ19VUklbd2luZG93c19pNjg2X2dudS0wLjUyLjYuc2hhMjU2c3VtXSA9
ICI4ZTliNWFkNWFiODAyZTk3ZWI4ZTI5NWFjNjcyMGU1MDllZTRjMjQzZjY5ZDc4MTM5NDAxNGVi
ZmU4YmJmYTBiIgorU1JDX1VSSVt3aW5kb3dzX2k2ODZfZ251bGx2bS0wLjUyLjYuc2hhMjU2c3Vt
XSA9ICIwZWVlNTJkMzhjMDkwYjNjYWE3NmM1NjNiODZjM2E0YmQ3MWVmMWE4MTkyODdjMTlkNTg2
ZDczMzRhZThlZDY2IgorU1JDX1VSSVt3aW5kb3dzX2k2ODZfbXN2Yy0wLjUyLjYuc2hhMjU2c3Vt
XSA9ICIyNDA5NDhiYzA1YzVlN2M2ZGFiYmEyOGJmODlkODlmZmNlM2UzMDMwMjI4MDllNzNkZWFl
ZmU0ZjZlYzU2YzY2IgorU1JDX1VSSVt3aW5kb3dzX3g4Nl82NF9nbnUtMC41Mi42LnNoYTI1NnN1
bV0gPSAiMTQ3YTVjODBhYWJmYmYwYzdkOTAxY2I1ODk1ZDFkZTMwZWYyOTA3ZWIyMWZiYmFiMjlj
YTk0YzViMDhiMWE3OCIKK1NSQ19VUklbd2luZG93c194ODZfNjRfZ251bGx2bS0wLjUyLjYuc2hh
MjU2c3VtXSA9ICIyNGQ1YjIzZGM0MTc0MTI2Nzk2ODEzOTZmMmI0OWYzZGU4YzE0NzNkZWI1MTZi
ZDM0NDEwODcyZWZmNTFlZDBkIgorU1JDX1VSSVt3aW5kb3dzX3g4Nl82NF9tc3ZjLTAuNTIuNi5z
aGEyNTZzdW1dID0gIjU4OWY2ZGE4NGM2NDYyMDQ3NDdkMTI3MGEyYTU2NjFlYTY2ZWQxY2NlZDI2
MzFkNTQ2ZmRmYjE1NTk1OWY5ZWMiCitTUkNfVVJJW3dpdC1iaW5kZ2VuLXJ0LTAuMzMuMC5zaGEy
NTZzdW1dID0gIjMyNjhmM2Q4NjY0NThiNzg3ZjM5MGNmNjFmNGJiYjU2M2I5MjJkMDkxMzU5Zjk2
MDg4NDI5OTllYWVlMzk0M2MiCiBTUkNfVVJJW3plcm9pemUtMS44LjEuc2hhMjU2c3VtXSA9ICJj
ZWQzNjc4YTI4NzliMzAzMDZkMzIzZjQ1NDI2MjY2OTdhNDY0YTk3YzBhMDdjOWFlYmY3ZWJjYTY1
Y2Q0ZGRlIgpkaWZmIC0tZ2l0IGEvbWV0YS9yZWNpcGVzLWRldnRvb2xzL3B5dGhvbi9weXRob24z
LWJjcnlwdF80LjIuMS5iYiBiL21ldGEvcmVjaXBlcy1kZXZ0b29scy9weXRob24vcHl0aG9uMy1i
Y3J5cHRfNC4zLjAuYmIKc2ltaWxhcml0eSBpbmRleCA4NiUKcmVuYW1lIGZyb20gbWV0YS9yZWNp
cGVzLWRldnRvb2xzL3B5dGhvbi9weXRob24zLWJjcnlwdF80LjIuMS5iYgpyZW5hbWUgdG8gbWV0
YS9yZWNpcGVzLWRldnRvb2xzL3B5dGhvbi9weXRob24zLWJjcnlwdF80LjMuMC5iYgppbmRleCAw
MDRlOGNlOGIxLi45MzFhYWU0MzEwIDEwMDY0NAotLS0gYS9tZXRhL3JlY2lwZXMtZGV2dG9vbHMv
cHl0aG9uL3B5dGhvbjMtYmNyeXB0XzQuMi4xLmJiCisrKyBiL21ldGEvcmVjaXBlcy1kZXZ0b29s
cy9weXRob24vcHl0aG9uMy1iY3J5cHRfNC4zLjAuYmIKQEAgLTYsNyArNiw3IEBAIEhPTUVQQUdF
ID0gImh0dHBzOi8vcHlwaS5vcmcvcHJvamVjdC9iY3J5cHQvIgogREVQRU5EUyArPSAicHl0aG9u
My1jZmZpLW5hdGl2ZSIKIExERkxBR1MgKz0gIiR7QGJiLnV0aWxzLmNvbnRhaW5zKCdESVNUUk9f
RkVBVFVSRVMnLCAncHRlc3QnLCAnLWZ1c2UtbGQ9YmZkJywgJycsIGQpfSIKIAotU1JDX1VSSVtz
aGEyNTZzdW1dID0gIjY3NjUzODZlM2FiODdmNTY5YjI3Njk4ODc0MjAzOWJhYWIwODdiMmNkYjAx
ZTgwOWQ3NGU3NDUwM2MyZmFhZmUiCitTUkNfVVJJW3NoYTI1NnN1bV0gPSAiM2EzZmQyMjA0MTc4
YjZkMmFkY2YwOWNiNGY2NDI2ZmZlZjU0NzYyNTc3YTdjOWI1NGMxNTkwMDhjYjI4OGMxOCIKIAog
aW5oZXJpdCBweXBpIHB5dGhvbl9zZXR1cHRvb2xzM19ydXN0IGNhcmdvLXVwZGF0ZS1yZWNpcGUt
Y3JhdGVzIHB0ZXN0LXB5dGhvbi1weXRlc3QKIAotLSAKMi40NC4xCgo=

--===============9073433903153287974==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: attachment; filename="buildhistory-diff.txt"

Changes to packages/core2-64-poky-linux/python3-bcrypt (sysroot):
  /usr/lib/python3.13/site-packages/bcrypt-4.2.1.dist-info moved to /usr/lib/python3.13/site-packages/bcrypt-4.3.0.dist-info

--===============9073433903153287974==--

