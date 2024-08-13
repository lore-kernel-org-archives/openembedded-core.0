Return-Path: <tim.orling@konsulko.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id DD4B5C3DA7F
	for <webhook@archiver.kernel.org>; Tue, 13 Aug 2024 02:44:49 +0000 (UTC)
Received: from mail-pl1-f170.google.com (mail-pl1-f170.google.com [209.85.214.170])
 by mx.groups.io with SMTP id smtpd.web11.63576.1723517088021288209
 for <openembedded-core@lists.openembedded.org>;
 Mon, 12 Aug 2024 19:44:48 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@konsulko.com header.s=google header.b=tkjkL6Bb;
 spf=pass (domain: konsulko.com, ip: 209.85.214.170, mailfrom: tim.orling@konsulko.com)
Received: by mail-pl1-f170.google.com with SMTP id d9443c01a7336-1fc56fd4de1so33305615ad.0
        for <openembedded-core@lists.openembedded.org>; Mon, 12 Aug 2024 19:44:47 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=konsulko.com; s=google; t=1723517087; x=1724121887; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=ApaKGbPDN8Wxd0xw459g319AaOADOZVbP4RfnnziLac=;
        b=tkjkL6BbzAf9vMyVSPEdvT73X+h822GR+Se1RcNHXnLXZUMBjz9+znGMdcYLsnx0u3
         OIO04oUIFynKN5WZSbnzIGbg3IhJIwjJquRwkrgvVp5IpQt3QVajt7s4bWtamD+xnuug
         2ZoX1/B6X3NVmkh6hhilQKUv82GyD1iLoDbVk=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1723517087; x=1724121887;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=ApaKGbPDN8Wxd0xw459g319AaOADOZVbP4RfnnziLac=;
        b=AAg4INroIUzacg0AFQGD6GXSNlxrUrecatKkcC2vsy5i+pKiQgNiwWHlA0uDxTqPvo
         +MvYZTXwqksPhfgiBjJAayirGPQElRsKfp+6XxPIuvGuzEPuvvuHLOOQAm8zA4YehsF4
         +HaO6J2OmIdkQycZ4U3Ie3hY0tDJ2zw9I5NhpHOc4pcjFoJRLkKQHDHzp2xMBB4y4ovp
         1mr4JsS77NG0RcuyEx7EXAqYl2wsIASs816xHiQf/hexcBJ02Dcar7xb8oMCMOV5bEq4
         +ZCsgo/CI1B6E0SYgWgJoQ9Yx6nc1BrECkUwgOP2T1iCK4gHYbkD43ZJsMeYAGIqCmzR
         ARhA==
X-Gm-Message-State: AOJu0YzdTztG01NmZPB7D8sOzsVfoggdKzgKwgUJUkYkAlThb+KJ2sPc
	b+0urksTweILkFUltwgQ8Y9DtIF8xC6JATcNBEuhvojPVzVMG6QRjhl3BXPGI54lUH6uURcoYrd
	8tzw=
X-Google-Smtp-Source: AGHT+IHEPrbkaPraKQaAV1g0pvraPOkyh7T9v7QJeWX+BsZcqvd7L8Oeq1sWr+yRiMJmCF6G7jR1pw==
X-Received: by 2002:a17:902:ce8c:b0:1fc:54c4:61a7 with SMTP id d9443c01a7336-201cbc615c7mr22307465ad.23.1723517086729;
        Mon, 12 Aug 2024 19:44:46 -0700 (PDT)
Received: from localhost (c-98-232-159-17.hsd1.or.comcast.net. [98.232.159.17])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-201cd1bb247sm3410315ad.234.2024.08.12.19.44.45
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 12 Aug 2024 19:44:46 -0700 (PDT)
From: tim.orling@konsulko.com
To: openembedded-core@lists.openembedded.org
Cc: Tim Orling <tim.orling@konsulko.com>
Subject: [PATCH] python3-rpds-py: upgrade 0.18.1 -> 0.20.0
Date: Mon, 12 Aug 2024 19:44:22 -0700
Message-ID: <20240813024421.1086573-2-tim.orling@konsulko.com>
X-Mailer: git-send-email 2.46.0
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Tue, 13 Aug 2024 02:44:49 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/203241

From: Tim Orling <tim.orling@konsulko.com>

https://github.com/crate-py/rpds/compare/v0.20.0...v0.18.1

v0.20.0
  * Implements __hash__ for collections by @FlickerSoul in #81

v0.19.1
  * Make Python versions in GitHub Actions consistent by @rominf in #80

v0.19.0
  * deps: bump libc from 0.2.147 to 0.2.155 by @wxpppp in #74
  * Make Python 3.13 Compatible by @FlickerSoul in #79

Signed-off-by: Tim Orling <tim.orling@konsulko.com>
---
 .../python/python3-rpds-py-crates.inc         | 102 +++++++-----------
 ...py_0.18.1.bb => python3-rpds-py_0.20.0.bb} |   2 +-
 2 files changed, 39 insertions(+), 65 deletions(-)
 rename meta/recipes-devtools/python/{python3-rpds-py_0.18.1.bb => python3-rpds-py_0.20.0.bb} (88%)

diff --git a/meta/recipes-devtools/python/python3-rpds-py-crates.inc b/meta/recipes-devtools/python/python3-rpds-py-crates.inc
index 3551bdb5f7f..e6c1ef8add1 100644
--- a/meta/recipes-devtools/python/python3-rpds-py-crates.inc
+++ b/meta/recipes-devtools/python/python3-rpds-py-crates.inc
@@ -3,80 +3,54 @@
 # from Cargo.lock
 SRC_URI += " \
     crate://crates.io/archery/1.2.0 \
-    crate://crates.io/autocfg/1.1.0 \
-    crate://crates.io/bitflags/1.3.2 \
+    crate://crates.io/autocfg/1.3.0 \
+    crate://crates.io/cc/1.0.90 \
     crate://crates.io/cfg-if/1.0.0 \
-    crate://crates.io/heck/0.4.1 \
-    crate://crates.io/indoc/2.0.4 \
-    crate://crates.io/libc/0.2.147 \
-    crate://crates.io/lock_api/0.4.10 \
-    crate://crates.io/memoffset/0.9.0 \
-    crate://crates.io/once_cell/1.18.0 \
-    crate://crates.io/parking_lot/0.12.1 \
-    crate://crates.io/parking_lot_core/0.9.8 \
+    crate://crates.io/heck/0.5.0 \
+    crate://crates.io/indoc/2.0.5 \
+    crate://crates.io/libc/0.2.155 \
+    crate://crates.io/memoffset/0.9.1 \
+    crate://crates.io/once_cell/1.19.0 \
     crate://crates.io/portable-atomic/1.6.0 \
-    crate://crates.io/proc-macro2/1.0.66 \
-    crate://crates.io/pyo3/0.20.3 \
-    crate://crates.io/pyo3-build-config/0.20.3 \
-    crate://crates.io/pyo3-ffi/0.20.3 \
-    crate://crates.io/pyo3-macros/0.20.3 \
-    crate://crates.io/pyo3-macros-backend/0.20.3 \
-    crate://crates.io/quote/1.0.31 \
-    crate://crates.io/redox_syscall/0.3.5 \
+    crate://crates.io/proc-macro2/1.0.86 \
+    crate://crates.io/pyo3/0.22.2 \
+    crate://crates.io/pyo3-build-config/0.22.2 \
+    crate://crates.io/pyo3-ffi/0.22.2 \
+    crate://crates.io/pyo3-macros/0.22.2 \
+    crate://crates.io/pyo3-macros-backend/0.22.2 \
+    crate://crates.io/python3-dll-a/0.2.10 \
+    crate://crates.io/quote/1.0.36 \
     crate://crates.io/rpds/1.1.0 \
-    crate://crates.io/scopeguard/1.1.0 \
-    crate://crates.io/smallvec/1.11.0 \
     crate://crates.io/static_assertions/1.1.0 \
-    crate://crates.io/syn/2.0.32 \
-    crate://crates.io/target-lexicon/0.12.9 \
-    crate://crates.io/triomphe/0.1.9 \
-    crate://crates.io/unicode-ident/1.0.11 \
+    crate://crates.io/syn/2.0.69 \
+    crate://crates.io/target-lexicon/0.12.14 \
+    crate://crates.io/triomphe/0.1.13 \
+    crate://crates.io/unicode-ident/1.0.12 \
     crate://crates.io/unindent/0.2.3 \
-    crate://crates.io/windows-targets/0.48.1 \
-    crate://crates.io/windows_aarch64_gnullvm/0.48.0 \
-    crate://crates.io/windows_aarch64_msvc/0.48.0 \
-    crate://crates.io/windows_i686_gnu/0.48.0 \
-    crate://crates.io/windows_i686_msvc/0.48.0 \
-    crate://crates.io/windows_x86_64_gnu/0.48.0 \
-    crate://crates.io/windows_x86_64_gnullvm/0.48.0 \
-    crate://crates.io/windows_x86_64_msvc/0.48.0 \
 "
 
 SRC_URI[archery-1.2.0.sha256sum] = "8967cd1cc9e9e1954f644e14fbd6042fe9a37da96c52a67e44a2ac18261f8561"
-SRC_URI[autocfg-1.1.0.sha256sum] = "d468802bab17cbc0cc575e9b053f41e72aa36bfa6b7f55e3529ffa43161b97fa"
-SRC_URI[bitflags-1.3.2.sha256sum] = "bef38d45163c2f1dde094a7dfd33ccf595c92905c8f8f4fdc18d06fb1037718a"
+SRC_URI[autocfg-1.3.0.sha256sum] = "0c4b4d0bd25bd0b74681c0ad21497610ce1b7c91b1022cd21c80c6fbdd9476b0"
+SRC_URI[cc-1.0.90.sha256sum] = "8cd6604a82acf3039f1144f54b8eb34e91ffba622051189e71b781822d5ee1f5"
 SRC_URI[cfg-if-1.0.0.sha256sum] = "baf1de4339761588bc0619e3cbc0120ee582ebb74b53b4efbf79117bd2da40fd"
-SRC_URI[heck-0.4.1.sha256sum] = "95505c38b4572b2d910cecb0281560f54b440a19336cbbcb27bf6ce6adc6f5a8"
-SRC_URI[indoc-2.0.4.sha256sum] = "1e186cfbae8084e513daff4240b4797e342f988cecda4fb6c939150f96315fd8"
-SRC_URI[libc-0.2.147.sha256sum] = "b4668fb0ea861c1df094127ac5f1da3409a82116a4ba74fca2e58ef927159bb3"
-SRC_URI[lock_api-0.4.10.sha256sum] = "c1cc9717a20b1bb222f333e6a92fd32f7d8a18ddc5a3191a11af45dcbf4dcd16"
-SRC_URI[memoffset-0.9.0.sha256sum] = "5a634b1c61a95585bd15607c6ab0c4e5b226e695ff2800ba0cdccddf208c406c"
-SRC_URI[once_cell-1.18.0.sha256sum] = "dd8b5dd2ae5ed71462c540258bedcb51965123ad7e7ccf4b9a8cafaa4a63576d"
-SRC_URI[parking_lot-0.12.1.sha256sum] = "3742b2c103b9f06bc9fff0a37ff4912935851bee6d36f3c02bcc755bcfec228f"
-SRC_URI[parking_lot_core-0.9.8.sha256sum] = "93f00c865fe7cabf650081affecd3871070f26767e7b2070a3ffae14c654b447"
+SRC_URI[heck-0.5.0.sha256sum] = "2304e00983f87ffb38b55b444b5e3b60a884b5d30c0fca7d82fe33449bbe55ea"
+SRC_URI[indoc-2.0.5.sha256sum] = "b248f5224d1d606005e02c97f5aa4e88eeb230488bcc03bc9ca4d7991399f2b5"
+SRC_URI[libc-0.2.155.sha256sum] = "97b3888a4aecf77e811145cadf6eef5901f4782c53886191b2f693f24761847c"
+SRC_URI[memoffset-0.9.1.sha256sum] = "488016bfae457b036d996092f6cb448677611ce4449e970ceaf42695203f218a"
+SRC_URI[once_cell-1.19.0.sha256sum] = "3fdb12b2476b595f9358c5161aa467c2438859caa136dec86c26fdd2efe17b92"
 SRC_URI[portable-atomic-1.6.0.sha256sum] = "7170ef9988bc169ba16dd36a7fa041e5c4cbeb6a35b76d4c03daded371eae7c0"
-SRC_URI[proc-macro2-1.0.66.sha256sum] = "18fb31db3f9bddb2ea821cde30a9f70117e3f119938b5ee630b7403aa6e2ead9"
-SRC_URI[pyo3-0.20.3.sha256sum] = "53bdbb96d49157e65d45cc287af5f32ffadd5f4761438b527b055fb0d4bb8233"
-SRC_URI[pyo3-build-config-0.20.3.sha256sum] = "deaa5745de3f5231ce10517a1f5dd97d53e5a2fd77aa6b5842292085831d48d7"
-SRC_URI[pyo3-ffi-0.20.3.sha256sum] = "62b42531d03e08d4ef1f6e85a2ed422eb678b8cd62b762e53891c05faf0d4afa"
-SRC_URI[pyo3-macros-0.20.3.sha256sum] = "7305c720fa01b8055ec95e484a6eca7a83c841267f0dd5280f0c8b8551d2c158"
-SRC_URI[pyo3-macros-backend-0.20.3.sha256sum] = "7c7e9b68bb9c3149c5b0cade5d07f953d6d125eb4337723c4ccdb665f1f96185"
-SRC_URI[quote-1.0.31.sha256sum] = "5fe8a65d69dd0808184ebb5f836ab526bb259db23c657efa38711b1072ee47f0"
-SRC_URI[redox_syscall-0.3.5.sha256sum] = "567664f262709473930a4bf9e51bf2ebf3348f2e748ccc50dea20646858f8f29"
+SRC_URI[proc-macro2-1.0.86.sha256sum] = "5e719e8df665df0d1c8fbfd238015744736151d4445ec0836b8e628aae103b77"
+SRC_URI[pyo3-0.22.2.sha256sum] = "831e8e819a138c36e212f3af3fd9eeffed6bf1510a805af35b0edee5ffa59433"
+SRC_URI[pyo3-build-config-0.22.2.sha256sum] = "1e8730e591b14492a8945cdff32f089250b05f5accecf74aeddf9e8272ce1fa8"
+SRC_URI[pyo3-ffi-0.22.2.sha256sum] = "5e97e919d2df92eb88ca80a037969f44e5e70356559654962cbb3316d00300c6"
+SRC_URI[pyo3-macros-0.22.2.sha256sum] = "eb57983022ad41f9e683a599f2fd13c3664d7063a3ac5714cae4b7bee7d3f206"
+SRC_URI[pyo3-macros-backend-0.22.2.sha256sum] = "ec480c0c51ddec81019531705acac51bcdbeae563557c982aa8263bb96880372"
+SRC_URI[python3-dll-a-0.2.10.sha256sum] = "bd0b78171a90d808b319acfad166c4790d9e9759bbc14ac8273fe133673dd41b"
+SRC_URI[quote-1.0.36.sha256sum] = "0fa76aaf39101c457836aec0ce2316dbdc3ab723cdda1c6bd4e6ad4208acaca7"
 SRC_URI[rpds-1.1.0.sha256sum] = "a0e15515d3ce3313324d842629ea4905c25a13f81953eadb88f85516f59290a4"
-SRC_URI[scopeguard-1.1.0.sha256sum] = "d29ab0c6d3fc0ee92fe66e2d99f700eab17a8d57d1c1d3b748380fb20baa78cd"
-SRC_URI[smallvec-1.11.0.sha256sum] = "62bb4feee49fdd9f707ef802e22365a35de4b7b299de4763d44bfea899442ff9"
 SRC_URI[static_assertions-1.1.0.sha256sum] = "a2eb9349b6444b326872e140eb1cf5e7c522154d69e7a0ffb0fb81c06b37543f"
-SRC_URI[syn-2.0.32.sha256sum] = "239814284fd6f1a4ffe4ca893952cdd93c224b6a1571c9a9eadd670295c0c9e2"
-SRC_URI[target-lexicon-0.12.9.sha256sum] = "df8e77cb757a61f51b947ec4a7e3646efd825b73561db1c232a8ccb639e611a0"
-SRC_URI[triomphe-0.1.9.sha256sum] = "0eee8098afad3fb0c54a9007aab6804558410503ad676d4633f9c2559a00ac0f"
-SRC_URI[unicode-ident-1.0.11.sha256sum] = "301abaae475aa91687eb82514b328ab47a211a533026cb25fc3e519b86adfc3c"
+SRC_URI[syn-2.0.69.sha256sum] = "201fcda3845c23e8212cd466bfebf0bd20694490fc0356ae8e428e0824a915a6"
+SRC_URI[target-lexicon-0.12.14.sha256sum] = "e1fc403891a21bcfb7c37834ba66a547a8f402146eba7265b5a6d88059c9ff2f"
+SRC_URI[triomphe-0.1.13.sha256sum] = "e6631e42e10b40c0690bf92f404ebcfe6e1fdb480391d15f17cc8e96eeed5369"
+SRC_URI[unicode-ident-1.0.12.sha256sum] = "3354b9ac3fae1ff6755cb6db53683adb661634f67557942dea4facebec0fee4b"
 SRC_URI[unindent-0.2.3.sha256sum] = "c7de7d73e1754487cb58364ee906a499937a0dfabd86bcb980fa99ec8c8fa2ce"
-SRC_URI[windows-targets-0.48.1.sha256sum] = "05d4b17490f70499f20b9e791dcf6a299785ce8af4d709018206dc5b4953e95f"
-SRC_URI[windows_aarch64_gnullvm-0.48.0.sha256sum] = "91ae572e1b79dba883e0d315474df7305d12f569b400fcf90581b06062f7e1bc"
-SRC_URI[windows_aarch64_msvc-0.48.0.sha256sum] = "b2ef27e0d7bdfcfc7b868b317c1d32c641a6fe4629c171b8928c7b08d98d7cf3"
-SRC_URI[windows_i686_gnu-0.48.0.sha256sum] = "622a1962a7db830d6fd0a69683c80a18fda201879f0f447f065a3b7467daa241"
-SRC_URI[windows_i686_msvc-0.48.0.sha256sum] = "4542c6e364ce21bf45d69fdd2a8e455fa38d316158cfd43b3ac1c5b1b19f8e00"
-SRC_URI[windows_x86_64_gnu-0.48.0.sha256sum] = "ca2b8a661f7628cbd23440e50b05d705db3686f894fc9580820623656af974b1"
-SRC_URI[windows_x86_64_gnullvm-0.48.0.sha256sum] = "7896dbc1f41e08872e9d5e8f8baa8fdd2677f29468c4e156210174edc7f7b953"
-SRC_URI[windows_x86_64_msvc-0.48.0.sha256sum] = "1a515f5799fe4961cb532f983ce2b23082366b898e52ffbce459c86f67c8378a"
diff --git a/meta/recipes-devtools/python/python3-rpds-py_0.18.1.bb b/meta/recipes-devtools/python/python3-rpds-py_0.20.0.bb
similarity index 88%
rename from meta/recipes-devtools/python/python3-rpds-py_0.18.1.bb
rename to meta/recipes-devtools/python/python3-rpds-py_0.20.0.bb
index f46df1115c8..dd483ed88e0 100644
--- a/meta/recipes-devtools/python/python3-rpds-py_0.18.1.bb
+++ b/meta/recipes-devtools/python/python3-rpds-py_0.20.0.bb
@@ -6,7 +6,7 @@ LIC_FILES_CHKSUM = "file://LICENSE;md5=7767fa537c4596c54141f32882c4a984"
 
 SRC_URI += "file://run-ptest"
 
-SRC_URI[sha256sum] = "dc48b479d540770c811fbd1eb9ba2bb66951863e448efec2e2c102625328e92f"
+SRC_URI[sha256sum] = "d72a210824facfdaf8768cf2d7ca25a042c30320b3020de2fa04640920d4e121"
 
 require ${BPN}-crates.inc
 
-- 
2.46.0


