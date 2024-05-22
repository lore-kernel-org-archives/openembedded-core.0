Return-Path: <tim.orling@konsulko.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 83668C25B78
	for <webhook@archiver.kernel.org>; Wed, 22 May 2024 21:20:36 +0000 (UTC)
Received: from mail-pl1-f179.google.com (mail-pl1-f179.google.com [209.85.214.179])
 by mx.groups.io with SMTP id smtpd.web11.2378.1716412834911228580
 for <openembedded-core@lists.openembedded.org>;
 Wed, 22 May 2024 14:20:35 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@konsulko.com header.s=google header.b=mmBvTBcT;
 spf=pass (domain: konsulko.com, ip: 209.85.214.179, mailfrom: tim.orling@konsulko.com)
Received: by mail-pl1-f179.google.com with SMTP id d9443c01a7336-1f338ebe621so1922435ad.0
        for <openembedded-core@lists.openembedded.org>; Wed, 22 May 2024 14:20:34 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=konsulko.com; s=google; t=1716412834; x=1717017634; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=q4ZccTMg8TOAuhQ6XLJNDTuZEFE2c07dEpMhljLsSqM=;
        b=mmBvTBcTArbxhQceJskr2uKfjtK1Ymw3swP+bNBly72HPtDDFQBX1aKTe690Vpc9JW
         emIHpEgILqS0MPBIF6q9gGt9mEG33TFuVJOUCURtcGzOuS0xoMBa952POoUGHOqvgiwi
         LA1QUDdEbUd/tomCNyDfo+oSHLg1XmW70m9EM=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1716412834; x=1717017634;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=q4ZccTMg8TOAuhQ6XLJNDTuZEFE2c07dEpMhljLsSqM=;
        b=mA81nUfa7aXDJN7YTr2T7YuqRKeu5XT5co6jx4jhqYaFTK7ffXCoB9P990C65ac0Ch
         0nHEKjuxcVUQiDTnT6+0zxH/69mEG14O49h1S1W686s3zXGGyuXpT+uA9qAQkFxZfFp8
         z23Cmulj566+qybp/LzhEGeK4lr11X68sKjpEmw9TiUcorq1lncPtdS1BANd8MULhO9P
         r9SxCOO9YTA3gQY5wWis7b8oDo14TLH/S9dzsDQwx1fP6VqvvzecEwby5JbfMJGWit/h
         +hqRUUjM+Bibs+JuMZSc1I4j/oY2QHYCg9vMeefQ5WKH11iS7RHCUYTH6/tp0eHZn+xP
         pRCA==
X-Gm-Message-State: AOJu0YxIwXSzQW03oTbwM+rB0qc6olsZjtq6LIoci9n6FeUocyJAjmq9
	6Elqg/gfAQCjgczDWyx3JvnqcbUdiLEKIrX4/JbBquU3iWAb2VhAtejIUaXwGH3NDCS53qEAjAw
	qaoA=
X-Google-Smtp-Source: AGHT+IEIjaCC8BIPJFiY1rRgolZagKErg/izfFnSKwO1jeZMInXjjkF7DLzwFUlkdG2+OnCEgf76EA==
X-Received: by 2002:a17:902:da8a:b0:1f3:3b0:61a7 with SMTP id d9443c01a7336-1f339f0b3c7mr5992695ad.12.1716412833679;
        Wed, 22 May 2024 14:20:33 -0700 (PDT)
Received: from localhost ([2601:1c0:ca00:bd60:1f22:ace1:7b84:99b9])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-1f32cf4390asm12398065ad.164.2024.05.22.14.20.32
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 22 May 2024 14:20:33 -0700 (PDT)
From: tim.orling@konsulko.com
To: openembedded-core@lists.openembedded.org
Cc: Tim Orling <tim.orling@konsulko.com>
Subject: [PATCH] python3-bcrypt: upgrade 4.1.2 -> 4.1.3
Date: Wed, 22 May 2024 14:20:00 -0700
Message-ID: <20240522211959.3226804-2-tim.orling@konsulko.com>
X-Mailer: git-send-email 2.45.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Wed, 22 May 2024 21:20:36 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/199770

From: Tim Orling <tim.orling@konsulko.com>

https://github.com/pyca/bcrypt/compare/4.1.2...4.1.3

Upstream release notes:
Bump Rust dependency versions

* Drop 0001-Bump-pyo3-from-0.20.0-to-0.20.3-in-src-_bcrypt-746.patch -- merged
* Refresh -crates.inc

Signed-off-by: Tim Orling <tim.orling@konsulko.com>
---
Tested with core-image-ptest-python3-bcrypt on qemux86-64

 .../python/python3-bcrypt-crates.inc          | 126 +++++++++---------
 ...-0.20.0-to-0.20.3-in-src-_bcrypt-746.patch | 111 ---------------
 ...crypt_4.1.2.bb => python3-bcrypt_4.1.3.bb} |   3 +-
 3 files changed, 65 insertions(+), 175 deletions(-)
 delete mode 100644 meta/recipes-devtools/python/python3-bcrypt/0001-Bump-pyo3-from-0.20.0-to-0.20.3-in-src-_bcrypt-746.patch
 rename meta/recipes-devtools/python/{python3-bcrypt_4.1.2.bb => python3-bcrypt_4.1.3.bb} (83%)

diff --git a/meta/recipes-devtools/python/python3-bcrypt-crates.inc b/meta/recipes-devtools/python/python3-bcrypt-crates.inc
index 0e7479f0b57..7d9e1f3b597 100644
--- a/meta/recipes-devtools/python/python3-bcrypt-crates.inc
+++ b/meta/recipes-devtools/python/python3-bcrypt-crates.inc
@@ -2,113 +2,115 @@
 
 # from src/_bcrypt/Cargo.lock
 SRC_URI += " \
-    crate://crates.io/autocfg/1.1.0 \
-    crate://crates.io/base64/0.21.5 \
-    crate://crates.io/bcrypt/0.15.0 \
+    crate://crates.io/autocfg/1.3.0 \
+    crate://crates.io/base64/0.22.1 \
+    crate://crates.io/bcrypt/0.15.1 \
     crate://crates.io/bcrypt-pbkdf/0.10.0 \
-    crate://crates.io/bitflags/1.3.2 \
+    crate://crates.io/bitflags/2.5.0 \
     crate://crates.io/block-buffer/0.10.4 \
     crate://crates.io/blowfish/0.9.1 \
     crate://crates.io/byteorder/1.5.0 \
     crate://crates.io/cfg-if/1.0.0 \
     crate://crates.io/cipher/0.4.4 \
-    crate://crates.io/cpufeatures/0.2.11 \
+    crate://crates.io/cpufeatures/0.2.12 \
     crate://crates.io/crypto-common/0.1.6 \
     crate://crates.io/digest/0.10.7 \
     crate://crates.io/generic-array/0.14.7 \
-    crate://crates.io/getrandom/0.2.11 \
+    crate://crates.io/getrandom/0.2.14 \
     crate://crates.io/heck/0.4.1 \
-    crate://crates.io/indoc/2.0.4 \
+    crate://crates.io/indoc/2.0.5 \
     crate://crates.io/inout/0.1.3 \
-    crate://crates.io/libc/0.2.151 \
-    crate://crates.io/lock_api/0.4.11 \
-    crate://crates.io/memoffset/0.9.0 \
+    crate://crates.io/libc/0.2.154 \
+    crate://crates.io/lock_api/0.4.12 \
+    crate://crates.io/memoffset/0.9.1 \
     crate://crates.io/once_cell/1.19.0 \
-    crate://crates.io/parking_lot/0.12.1 \
-    crate://crates.io/parking_lot_core/0.9.9 \
+    crate://crates.io/parking_lot/0.12.2 \
+    crate://crates.io/parking_lot_core/0.9.10 \
     crate://crates.io/pbkdf2/0.12.2 \
     crate://crates.io/portable-atomic/1.6.0 \
-    crate://crates.io/proc-macro2/1.0.70 \
-    crate://crates.io/pyo3/0.20.3 \
-    crate://crates.io/pyo3-build-config/0.20.3 \
-    crate://crates.io/pyo3-ffi/0.20.3 \
-    crate://crates.io/pyo3-macros/0.20.3 \
-    crate://crates.io/pyo3-macros-backend/0.20.3 \
-    crate://crates.io/quote/1.0.33 \
-    crate://crates.io/redox_syscall/0.4.1 \
+    crate://crates.io/proc-macro2/1.0.81 \
+    crate://crates.io/pyo3/0.21.2 \
+    crate://crates.io/pyo3-build-config/0.21.2 \
+    crate://crates.io/pyo3-ffi/0.21.2 \
+    crate://crates.io/pyo3-macros/0.21.2 \
+    crate://crates.io/pyo3-macros-backend/0.21.2 \
+    crate://crates.io/quote/1.0.36 \
+    crate://crates.io/redox_syscall/0.5.1 \
     crate://crates.io/scopeguard/1.2.0 \
     crate://crates.io/sha2/0.10.8 \
-    crate://crates.io/smallvec/1.11.2 \
+    crate://crates.io/smallvec/1.13.2 \
     crate://crates.io/subtle/2.5.0 \
-    crate://crates.io/syn/2.0.41 \
-    crate://crates.io/target-lexicon/0.12.12 \
+    crate://crates.io/syn/2.0.60 \
+    crate://crates.io/target-lexicon/0.12.14 \
     crate://crates.io/typenum/1.17.0 \
     crate://crates.io/unicode-ident/1.0.12 \
     crate://crates.io/unindent/0.2.3 \
     crate://crates.io/version_check/0.9.4 \
     crate://crates.io/wasi/0.11.0+wasi-snapshot-preview1 \
-    crate://crates.io/windows-targets/0.48.5 \
-    crate://crates.io/windows_aarch64_gnullvm/0.48.5 \
-    crate://crates.io/windows_aarch64_msvc/0.48.5 \
-    crate://crates.io/windows_i686_gnu/0.48.5 \
-    crate://crates.io/windows_i686_msvc/0.48.5 \
-    crate://crates.io/windows_x86_64_gnu/0.48.5 \
-    crate://crates.io/windows_x86_64_gnullvm/0.48.5 \
-    crate://crates.io/windows_x86_64_msvc/0.48.5 \
+    crate://crates.io/windows-targets/0.52.5 \
+    crate://crates.io/windows_aarch64_gnullvm/0.52.5 \
+    crate://crates.io/windows_aarch64_msvc/0.52.5 \
+    crate://crates.io/windows_i686_gnu/0.52.5 \
+    crate://crates.io/windows_i686_gnullvm/0.52.5 \
+    crate://crates.io/windows_i686_msvc/0.52.5 \
+    crate://crates.io/windows_x86_64_gnu/0.52.5 \
+    crate://crates.io/windows_x86_64_gnullvm/0.52.5 \
+    crate://crates.io/windows_x86_64_msvc/0.52.5 \
     crate://crates.io/zeroize/1.7.0 \
 "
 
-SRC_URI[autocfg-1.1.0.sha256sum] = "d468802bab17cbc0cc575e9b053f41e72aa36bfa6b7f55e3529ffa43161b97fa"
-SRC_URI[base64-0.21.5.sha256sum] = "35636a1494ede3b646cc98f74f8e62c773a38a659ebc777a2cf26b9b74171df9"
-SRC_URI[bcrypt-0.15.0.sha256sum] = "28d1c9c15093eb224f0baa400f38fcd713fc1391a6f1c389d886beef146d60a3"
+SRC_URI[autocfg-1.3.0.sha256sum] = "0c4b4d0bd25bd0b74681c0ad21497610ce1b7c91b1022cd21c80c6fbdd9476b0"
+SRC_URI[base64-0.22.1.sha256sum] = "72b3254f16251a8381aa12e40e3c4d2f0199f8c6508fbecb9d91f575e0fbb8c6"
+SRC_URI[bcrypt-0.15.1.sha256sum] = "e65938ed058ef47d92cf8b346cc76ef48984572ade631927e9937b5ffc7662c7"
 SRC_URI[bcrypt-pbkdf-0.10.0.sha256sum] = "6aeac2e1fe888769f34f05ac343bbef98b14d1ffb292ab69d4608b3abc86f2a2"
-SRC_URI[bitflags-1.3.2.sha256sum] = "bef38d45163c2f1dde094a7dfd33ccf595c92905c8f8f4fdc18d06fb1037718a"
+SRC_URI[bitflags-2.5.0.sha256sum] = "cf4b9d6a944f767f8e5e0db018570623c85f3d925ac718db4e06d0187adb21c1"
 SRC_URI[block-buffer-0.10.4.sha256sum] = "3078c7629b62d3f0439517fa394996acacc5cbc91c5a20d8c658e77abd503a71"
 SRC_URI[blowfish-0.9.1.sha256sum] = "e412e2cd0f2b2d93e02543ceae7917b3c70331573df19ee046bcbc35e45e87d7"
 SRC_URI[byteorder-1.5.0.sha256sum] = "1fd0f2584146f6f2ef48085050886acf353beff7305ebd1ae69500e27c67f64b"
 SRC_URI[cfg-if-1.0.0.sha256sum] = "baf1de4339761588bc0619e3cbc0120ee582ebb74b53b4efbf79117bd2da40fd"
 SRC_URI[cipher-0.4.4.sha256sum] = "773f3b9af64447d2ce9850330c473515014aa235e6a783b02db81ff39e4a3dad"
-SRC_URI[cpufeatures-0.2.11.sha256sum] = "ce420fe07aecd3e67c5f910618fe65e94158f6dcc0adf44e00d69ce2bdfe0fd0"
+SRC_URI[cpufeatures-0.2.12.sha256sum] = "53fe5e26ff1b7aef8bca9c6080520cfb8d9333c7568e1829cef191a9723e5504"
 SRC_URI[crypto-common-0.1.6.sha256sum] = "1bfb12502f3fc46cca1bb51ac28df9d618d813cdc3d2f25b9fe775a34af26bb3"
 SRC_URI[digest-0.10.7.sha256sum] = "9ed9a281f7bc9b7576e61468ba615a66a5c8cfdff42420a70aa82701a3b1e292"
 SRC_URI[generic-array-0.14.7.sha256sum] = "85649ca51fd72272d7821adaf274ad91c288277713d9c18820d8499a7ff69e9a"
-SRC_URI[getrandom-0.2.11.sha256sum] = "fe9006bed769170c11f845cf00c7c1e9092aeb3f268e007c3e760ac68008070f"
+SRC_URI[getrandom-0.2.14.sha256sum] = "94b22e06ecb0110981051723910cbf0b5f5e09a2062dd7663334ee79a9d1286c"
 SRC_URI[heck-0.4.1.sha256sum] = "95505c38b4572b2d910cecb0281560f54b440a19336cbbcb27bf6ce6adc6f5a8"
-SRC_URI[indoc-2.0.4.sha256sum] = "1e186cfbae8084e513daff4240b4797e342f988cecda4fb6c939150f96315fd8"
+SRC_URI[indoc-2.0.5.sha256sum] = "b248f5224d1d606005e02c97f5aa4e88eeb230488bcc03bc9ca4d7991399f2b5"
 SRC_URI[inout-0.1.3.sha256sum] = "a0c10553d664a4d0bcff9f4215d0aac67a639cc68ef660840afe309b807bc9f5"
-SRC_URI[libc-0.2.151.sha256sum] = "302d7ab3130588088d277783b1e2d2e10c9e9e4a16dd9050e6ec93fb3e7048f4"
-SRC_URI[lock_api-0.4.11.sha256sum] = "3c168f8615b12bc01f9c17e2eb0cc07dcae1940121185446edc3744920e8ef45"
-SRC_URI[memoffset-0.9.0.sha256sum] = "5a634b1c61a95585bd15607c6ab0c4e5b226e695ff2800ba0cdccddf208c406c"
+SRC_URI[libc-0.2.154.sha256sum] = "ae743338b92ff9146ce83992f766a31066a91a8c84a45e0e9f21e7cf6de6d346"
+SRC_URI[lock_api-0.4.12.sha256sum] = "07af8b9cdd281b7915f413fa73f29ebd5d55d0d3f0155584dade1ff18cea1b17"
+SRC_URI[memoffset-0.9.1.sha256sum] = "488016bfae457b036d996092f6cb448677611ce4449e970ceaf42695203f218a"
 SRC_URI[once_cell-1.19.0.sha256sum] = "3fdb12b2476b595f9358c5161aa467c2438859caa136dec86c26fdd2efe17b92"
-SRC_URI[parking_lot-0.12.1.sha256sum] = "3742b2c103b9f06bc9fff0a37ff4912935851bee6d36f3c02bcc755bcfec228f"
-SRC_URI[parking_lot_core-0.9.9.sha256sum] = "4c42a9226546d68acdd9c0a280d17ce19bfe27a46bf68784e4066115788d008e"
+SRC_URI[parking_lot-0.12.2.sha256sum] = "7e4af0ca4f6caed20e900d564c242b8e5d4903fdacf31d3daf527b66fe6f42fb"
+SRC_URI[parking_lot_core-0.9.10.sha256sum] = "1e401f977ab385c9e4e3ab30627d6f26d00e2c73eef317493c4ec6d468726cf8"
 SRC_URI[pbkdf2-0.12.2.sha256sum] = "f8ed6a7761f76e3b9f92dfb0a60a6a6477c61024b775147ff0973a02653abaf2"
 SRC_URI[portable-atomic-1.6.0.sha256sum] = "7170ef9988bc169ba16dd36a7fa041e5c4cbeb6a35b76d4c03daded371eae7c0"
-SRC_URI[proc-macro2-1.0.70.sha256sum] = "39278fbbf5fb4f646ce651690877f89d1c5811a3d4acb27700c1cb3cdb78fd3b"
-SRC_URI[pyo3-0.20.3.sha256sum] = "53bdbb96d49157e65d45cc287af5f32ffadd5f4761438b527b055fb0d4bb8233"
-SRC_URI[pyo3-build-config-0.20.3.sha256sum] = "deaa5745de3f5231ce10517a1f5dd97d53e5a2fd77aa6b5842292085831d48d7"
-SRC_URI[pyo3-ffi-0.20.3.sha256sum] = "62b42531d03e08d4ef1f6e85a2ed422eb678b8cd62b762e53891c05faf0d4afa"
-SRC_URI[pyo3-macros-0.20.3.sha256sum] = "7305c720fa01b8055ec95e484a6eca7a83c841267f0dd5280f0c8b8551d2c158"
-SRC_URI[pyo3-macros-backend-0.20.3.sha256sum] = "7c7e9b68bb9c3149c5b0cade5d07f953d6d125eb4337723c4ccdb665f1f96185"
-SRC_URI[quote-1.0.33.sha256sum] = "5267fca4496028628a95160fc423a33e8b2e6af8a5302579e322e4b520293cae"
-SRC_URI[redox_syscall-0.4.1.sha256sum] = "4722d768eff46b75989dd134e5c353f0d6296e5aaa3132e776cbdb56be7731aa"
+SRC_URI[proc-macro2-1.0.81.sha256sum] = "3d1597b0c024618f09a9c3b8655b7e430397a36d23fdafec26d6965e9eec3eba"
+SRC_URI[pyo3-0.21.2.sha256sum] = "a5e00b96a521718e08e03b1a622f01c8a8deb50719335de3f60b3b3950f069d8"
+SRC_URI[pyo3-build-config-0.21.2.sha256sum] = "7883df5835fafdad87c0d888b266c8ec0f4c9ca48a5bed6bbb592e8dedee1b50"
+SRC_URI[pyo3-ffi-0.21.2.sha256sum] = "01be5843dc60b916ab4dad1dca6d20b9b4e6ddc8e15f50c47fe6d85f1fb97403"
+SRC_URI[pyo3-macros-0.21.2.sha256sum] = "77b34069fc0682e11b31dbd10321cbf94808394c56fd996796ce45217dfac53c"
+SRC_URI[pyo3-macros-backend-0.21.2.sha256sum] = "08260721f32db5e1a5beae69a55553f56b99bd0e1c3e6e0a5e8851a9d0f5a85c"
+SRC_URI[quote-1.0.36.sha256sum] = "0fa76aaf39101c457836aec0ce2316dbdc3ab723cdda1c6bd4e6ad4208acaca7"
+SRC_URI[redox_syscall-0.5.1.sha256sum] = "469052894dcb553421e483e4209ee581a45100d31b4018de03e5a7ad86374a7e"
 SRC_URI[scopeguard-1.2.0.sha256sum] = "94143f37725109f92c262ed2cf5e59bce7498c01bcc1502d7b9afe439a4e9f49"
 SRC_URI[sha2-0.10.8.sha256sum] = "793db75ad2bcafc3ffa7c68b215fee268f537982cd901d132f89c6343f3a3dc8"
-SRC_URI[smallvec-1.11.2.sha256sum] = "4dccd0940a2dcdf68d092b8cbab7dc0ad8fa938bf95787e1b916b0e3d0e8e970"
+SRC_URI[smallvec-1.13.2.sha256sum] = "3c5e1a9a646d36c3599cd173a41282daf47c44583ad367b8e6837255952e5c67"
 SRC_URI[subtle-2.5.0.sha256sum] = "81cdd64d312baedb58e21336b31bc043b77e01cc99033ce76ef539f78e965ebc"
-SRC_URI[syn-2.0.41.sha256sum] = "44c8b28c477cc3bf0e7966561e3460130e1255f7a1cf71931075f1c5e7a7e269"
-SRC_URI[target-lexicon-0.12.12.sha256sum] = "14c39fd04924ca3a864207c66fc2cd7d22d7c016007f9ce846cbb9326331930a"
+SRC_URI[syn-2.0.60.sha256sum] = "909518bc7b1c9b779f1bbf07f2929d35af9f0f37e47c6e9ef7f9dddc1e1821f3"
+SRC_URI[target-lexicon-0.12.14.sha256sum] = "e1fc403891a21bcfb7c37834ba66a547a8f402146eba7265b5a6d88059c9ff2f"
 SRC_URI[typenum-1.17.0.sha256sum] = "42ff0bf0c66b8238c6f3b578df37d0b7848e55df8577b3f74f92a69acceeb825"
 SRC_URI[unicode-ident-1.0.12.sha256sum] = "3354b9ac3fae1ff6755cb6db53683adb661634f67557942dea4facebec0fee4b"
 SRC_URI[unindent-0.2.3.sha256sum] = "c7de7d73e1754487cb58364ee906a499937a0dfabd86bcb980fa99ec8c8fa2ce"
 SRC_URI[version_check-0.9.4.sha256sum] = "49874b5167b65d7193b8aba1567f5c7d93d001cafc34600cee003eda787e483f"
 SRC_URI[wasi-0.11.0+wasi-snapshot-preview1.sha256sum] = "9c8d87e72b64a3b4db28d11ce29237c246188f4f51057d65a7eab63b7987e423"
-SRC_URI[windows-targets-0.48.5.sha256sum] = "9a2fa6e2155d7247be68c096456083145c183cbbbc2764150dda45a87197940c"
-SRC_URI[windows_aarch64_gnullvm-0.48.5.sha256sum] = "2b38e32f0abccf9987a4e3079dfb67dcd799fb61361e53e2882c3cbaf0d905d8"
-SRC_URI[windows_aarch64_msvc-0.48.5.sha256sum] = "dc35310971f3b2dbbf3f0690a219f40e2d9afcf64f9ab7cc1be722937c26b4bc"
-SRC_URI[windows_i686_gnu-0.48.5.sha256sum] = "a75915e7def60c94dcef72200b9a8e58e5091744960da64ec734a6c6e9b3743e"
-SRC_URI[windows_i686_msvc-0.48.5.sha256sum] = "8f55c233f70c4b27f66c523580f78f1004e8b5a8b659e05a4eb49d4166cca406"
-SRC_URI[windows_x86_64_gnu-0.48.5.sha256sum] = "53d40abd2583d23e4718fddf1ebec84dbff8381c07cae67ff7768bbf19c6718e"
-SRC_URI[windows_x86_64_gnullvm-0.48.5.sha256sum] = "0b7b52767868a23d5bab768e390dc5f5c55825b6d30b86c844ff2dc7414044cc"
-SRC_URI[windows_x86_64_msvc-0.48.5.sha256sum] = "ed94fce61571a4006852b7389a063ab983c02eb1bb37b47f8272ce92d06d9538"
+SRC_URI[windows-targets-0.52.5.sha256sum] = "6f0713a46559409d202e70e28227288446bf7841d3211583a4b53e3f6d96e7eb"
+SRC_URI[windows_aarch64_gnullvm-0.52.5.sha256sum] = "7088eed71e8b8dda258ecc8bac5fb1153c5cffaf2578fc8ff5d61e23578d3263"
+SRC_URI[windows_aarch64_msvc-0.52.5.sha256sum] = "9985fd1504e250c615ca5f281c3f7a6da76213ebd5ccc9561496568a2752afb6"
+SRC_URI[windows_i686_gnu-0.52.5.sha256sum] = "88ba073cf16d5372720ec942a8ccbf61626074c6d4dd2e745299726ce8b89670"
+SRC_URI[windows_i686_gnullvm-0.52.5.sha256sum] = "87f4261229030a858f36b459e748ae97545d6f1ec60e5e0d6a3d32e0dc232ee9"
+SRC_URI[windows_i686_msvc-0.52.5.sha256sum] = "db3c2bf3d13d5b658be73463284eaf12830ac9a26a90c717b7f771dfe97487bf"
+SRC_URI[windows_x86_64_gnu-0.52.5.sha256sum] = "4e4246f76bdeff09eb48875a0fd3e2af6aada79d409d33011886d3e1581517d9"
+SRC_URI[windows_x86_64_gnullvm-0.52.5.sha256sum] = "852298e482cd67c356ddd9570386e2862b5673c85bd5f88df9ab6802b334c596"
+SRC_URI[windows_x86_64_msvc-0.52.5.sha256sum] = "bec47e5bfd1bff0eeaf6d8b485cc1074891a197ab4225d504cb7a1ab88b02bf0"
 SRC_URI[zeroize-1.7.0.sha256sum] = "525b4ec142c6b68a2d10f01f7bbf6755599ca3f81ea53b8431b7dd348f5fdb2d"
diff --git a/meta/recipes-devtools/python/python3-bcrypt/0001-Bump-pyo3-from-0.20.0-to-0.20.3-in-src-_bcrypt-746.patch b/meta/recipes-devtools/python/python3-bcrypt/0001-Bump-pyo3-from-0.20.0-to-0.20.3-in-src-_bcrypt-746.patch
deleted file mode 100644
index 3f671fcc981..00000000000
--- a/meta/recipes-devtools/python/python3-bcrypt/0001-Bump-pyo3-from-0.20.0-to-0.20.3-in-src-_bcrypt-746.patch
+++ /dev/null
@@ -1,111 +0,0 @@
-From cfdd98b3215cc12e66190a9c7f0a32c052e3c2e7 Mon Sep 17 00:00:00 2001
-From: Khem Raj <raj.khem@gmail.com>
-Date: Mon, 26 Feb 2024 18:26:30 -0800
-Subject: [PATCH] Bump pyo3 from 0.20.0 to 0.20.3 in /src/_bcrypt (#746)
-
-It fixes build on hosts without 64bit atomics
-
-Upstream-Status: Backport [https://github.com/pyca/bcrypt/commit/c2ef9350798ab59b18e8a0e04a01389858578fe0]
-Signed-off-by: Khem Raj <raj.khem@gmail.com>
----
- src/_bcrypt/Cargo.lock | 22 ++++++++++++++--------
- src/_bcrypt/Cargo.toml |  2 +-
- 2 files changed, 15 insertions(+), 9 deletions(-)
-
---- a/src/_bcrypt/Cargo.lock
-+++ b/src/_bcrypt/Cargo.lock
-@@ -233,6 +233,12 @@ dependencies = [
- ]
- 
- [[package]]
-+name = "portable-atomic"
-+version = "1.6.0"
-+source = "registry+https://github.com/rust-lang/crates.io-index"
-+checksum = "7170ef9988bc169ba16dd36a7fa041e5c4cbeb6a35b76d4c03daded371eae7c0"
-+
-+[[package]]
- name = "proc-macro2"
- version = "1.0.70"
- source = "registry+https://github.com/rust-lang/crates.io-index"
-@@ -243,15 +249,16 @@ dependencies = [
- 
- [[package]]
- name = "pyo3"
--version = "0.20.0"
-+version = "0.20.3"
- source = "registry+https://github.com/rust-lang/crates.io-index"
--checksum = "04e8453b658fe480c3e70c8ed4e3d3ec33eb74988bd186561b0cc66b85c3bc4b"
-+checksum = "53bdbb96d49157e65d45cc287af5f32ffadd5f4761438b527b055fb0d4bb8233"
- dependencies = [
-  "cfg-if",
-  "indoc",
-  "libc",
-  "memoffset",
-  "parking_lot",
-+ "portable-atomic",
-  "pyo3-build-config",
-  "pyo3-ffi",
-  "pyo3-macros",
-@@ -260,9 +267,9 @@ dependencies = [
- 
- [[package]]
- name = "pyo3-build-config"
--version = "0.20.0"
-+version = "0.20.3"
- source = "registry+https://github.com/rust-lang/crates.io-index"
--checksum = "a96fe70b176a89cff78f2fa7b3c930081e163d5379b4dcdf993e3ae29ca662e5"
-+checksum = "deaa5745de3f5231ce10517a1f5dd97d53e5a2fd77aa6b5842292085831d48d7"
- dependencies = [
-  "once_cell",
-  "target-lexicon",
-@@ -270,9 +277,9 @@ dependencies = [
- 
- [[package]]
- name = "pyo3-ffi"
--version = "0.20.0"
-+version = "0.20.3"
- source = "registry+https://github.com/rust-lang/crates.io-index"
--checksum = "214929900fd25e6604661ed9cf349727c8920d47deff196c4e28165a6ef2a96b"
-+checksum = "62b42531d03e08d4ef1f6e85a2ed422eb678b8cd62b762e53891c05faf0d4afa"
- dependencies = [
-  "libc",
-  "pyo3-build-config",
-@@ -280,9 +287,9 @@ dependencies = [
- 
- [[package]]
- name = "pyo3-macros"
--version = "0.20.0"
-+version = "0.20.3"
- source = "registry+https://github.com/rust-lang/crates.io-index"
--checksum = "dac53072f717aa1bfa4db832b39de8c875b7c7af4f4a6fe93cdbf9264cf8383b"
-+checksum = "7305c720fa01b8055ec95e484a6eca7a83c841267f0dd5280f0c8b8551d2c158"
- dependencies = [
-  "proc-macro2",
-  "pyo3-macros-backend",
-@@ -292,12 +299,13 @@ dependencies = [
- 
- [[package]]
- name = "pyo3-macros-backend"
--version = "0.20.0"
-+version = "0.20.3"
- source = "registry+https://github.com/rust-lang/crates.io-index"
--checksum = "7774b5a8282bd4f25f803b1f0d945120be959a36c72e08e7cd031c792fdfd424"
-+checksum = "7c7e9b68bb9c3149c5b0cade5d07f953d6d125eb4337723c4ccdb665f1f96185"
- dependencies = [
-  "heck",
-  "proc-macro2",
-+ "pyo3-build-config",
-  "quote",
-  "syn",
- ]
---- a/src/_bcrypt/Cargo.toml
-+++ b/src/_bcrypt/Cargo.toml
-@@ -6,7 +6,7 @@ edition = "2018"
- publish = false
- 
- [dependencies]
--pyo3 = { version = "0.20.0", features = ["abi3"] }
-+pyo3 = { version = "0.20.3", features = ["abi3"] }
- bcrypt = "0.15"
- bcrypt-pbkdf = "0.10.0"
- base64 = "0.21.5"
diff --git a/meta/recipes-devtools/python/python3-bcrypt_4.1.2.bb b/meta/recipes-devtools/python/python3-bcrypt_4.1.3.bb
similarity index 83%
rename from meta/recipes-devtools/python/python3-bcrypt_4.1.2.bb
rename to meta/recipes-devtools/python/python3-bcrypt_4.1.3.bb
index 57b08b37000..deb5cbdee3d 100644
--- a/meta/recipes-devtools/python/python3-bcrypt_4.1.2.bb
+++ b/meta/recipes-devtools/python/python3-bcrypt_4.1.3.bb
@@ -6,12 +6,11 @@ HOMEPAGE = "https://pypi.org/project/bcrypt/"
 DEPENDS += "python3-cffi-native"
 LDFLAGS:append = "${@bb.utils.contains('DISTRO_FEATURES', 'ptest', ' -fuse-ld=bfd', '', d)}"
 
-SRC_URI[sha256sum] = "33313a1200a3ae90b75587ceac502b048b840fc69e7f7a0905b5f87fac7a1258"
+SRC_URI[sha256sum] = "2ee15dd749f5952fe3f0430d0ff6b74082e159c50332a1413d51b5689cf06623"
 
 inherit pypi python_setuptools3_rust ptest-cargo cargo-update-recipe-crates
 
 SRC_URI += " \
-	file://0001-Bump-pyo3-from-0.20.0-to-0.20.3-in-src-_bcrypt-746.patch \
 	file://run-ptest \
 "
 
-- 
2.45.1


