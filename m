Return-Path: <ticotimo@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id B2B26C4167B
	for <webhook@archiver.kernel.org>; Tue,  5 Dec 2023 01:11:35 +0000 (UTC)
Received: from mail-oi1-f180.google.com (mail-oi1-f180.google.com [209.85.167.180])
 by mx.groups.io with SMTP id smtpd.web10.89177.1701738690931022248
 for <openembedded-core@lists.openembedded.org>;
 Mon, 04 Dec 2023 17:11:31 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20230601 header.b=dSFC04e5;
 spf=pass (domain: gmail.com, ip: 209.85.167.180, mailfrom: ticotimo@gmail.com)
Received: by mail-oi1-f180.google.com with SMTP id 5614622812f47-3b83fc26e4cso2802514b6e.2
        for <openembedded-core@lists.openembedded.org>; Mon, 04 Dec 2023 17:11:30 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1701738690; x=1702343490; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=SK4FlmD4RK1fY5zVh4ErBXyy+3oWF+ermsevWesyt6Q=;
        b=dSFC04e5ZSOO3cbWmPxboxWV1gZBo9l+C45sKuwuPz1b4JlkJubyPrKw9G/rTz1hwQ
         RzCTxFywlJtL9LEtXRgKLE2avDB31Eohn0VPBMqwRNYSfb9GS1GYZQqh/Di/zJgMMqnm
         HnR0y03PCdHZnNaW6TIGehvcRLecHxuaIWY8rvzMLEVJw3Joi1FPzrt7Td2g81FwRRur
         M0sijZyuB6sWFRK0zTNCTS9F3X3T53jZoIX3tCtGsZtIBtRhV3lrxw2GH84SshCzz1ds
         GxYf6Pty+uP3DIhpc9GylRE2QcCw1VgfmfV1jZLPMnv4RN07un8TPDnov61UrGGafe2l
         orzQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1701738690; x=1702343490;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=SK4FlmD4RK1fY5zVh4ErBXyy+3oWF+ermsevWesyt6Q=;
        b=D4NOTl4uN10C7jE97xUKx+8Auo8If8CtMHm1O2YAOmCRxH5h/Ic+4IdPUEN8kf1KGf
         7+YSMiCYbBAc+q+VnfE0vnrPz/oBBUcMaM/3l+Zmmod9XRU/u2eB0aU02xGdwMv2c3S8
         9u/vNpdP37PXEZYswge2ZYST6t35UNeAbeStRcbFeuCoOwo1+Bat8chDd6/Dg9U9shGu
         xHCn9cNjhA7NauzZT3RmUZkRb5s4GGstojyx5U5ql9DjmCYwDoHo9X4fXdBOs0u8t8Xv
         auFDkIuNmKOCLt+CkCkDwrYXEQfs3h8H//almfrJOflAusHAvfDMnpDGNdQQzvyfHctO
         3Gsw==
X-Gm-Message-State: AOJu0YzraRtBg+hoJ1ccP5B0TIVLN0ci9FVggZzqYbGQpSuJ3Uas5BpN
	m3oWEU3W+HumthNOa2F3YwxU7B0KVTM=
X-Google-Smtp-Source: AGHT+IGVeSSHDOb90VA4jxu68YZ0sixh9elq7p4LBzTjkG2D9Jq7IJHQG0Dz4toDA3yZW3OYnO9UCA==
X-Received: by 2002:a05:6808:23cc:b0:3b6:d04c:d98f with SMTP id bq12-20020a05680823cc00b003b6d04cd98fmr5520891oib.0.1701738689668;
        Mon, 04 Dec 2023 17:11:29 -0800 (PST)
Received: from chiron.hsd1.or.comcast.net ([2601:1c0:ca00:cea0:926f:4feb:70b6:eaf2])
        by smtp.gmail.com with ESMTPSA id m6-20020a056a00080600b006ce565a5ff0sm1923626pfk.156.2023.12.04.17.10.43
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 04 Dec 2023 17:11:05 -0800 (PST)
From: Tim Orling <ticotimo@gmail.com>
X-Google-Original-From: Tim Orling <tim.orling@konsulko.com>
To: openembedded-core@lists.openembedded.org
Cc: Tim Orling <tim.orling@konsulko.com>
Subject: [PATCH] python3-bcrypt: upgrade 4.0.1 -> 4.1.1
Date: Mon,  4 Dec 2023 17:08:54 -0800
Message-Id: <20231205010853.2661764-1-tim.orling@konsulko.com>
X-Mailer: git-send-email 2.34.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Tue, 05 Dec 2023 01:11:35 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/191770

* Refresh -crates.inc

https://github.com/pyca/bcrypt/blob/4.1.1/README.rst#changelog

4.1.1
  * Fixed the type signature on the kdf method.
4.1.0
  * Dropped support for Python 3.6.
  * Bumped MSRV to 1.64. (Note: Rust 1.63 can be used by setting
    the BCRYPT_ALLOW_RUST_163 environment variable)

Signed-off-by: Tim Orling <tim.orling@konsulko.com>
---
Tested with core-image-ptest-python3-bcrypt on qemux86-64 (all tests pass)

 .../python/python3-bcrypt-crates.inc          | 172 +++++++++---------
 ...crypt_4.0.1.bb => python3-bcrypt_4.1.1.bb} |   2 +-
 2 files changed, 91 insertions(+), 83 deletions(-)
 rename meta/recipes-devtools/python/{python3-bcrypt_4.0.1.bb => python3-bcrypt_4.1.1.bb} (90%)

diff --git a/meta/recipes-devtools/python/python3-bcrypt-crates.inc b/meta/recipes-devtools/python/python3-bcrypt-crates.inc
index 16d9e55cc57..b99d753a877 100644
--- a/meta/recipes-devtools/python/python3-bcrypt-crates.inc
+++ b/meta/recipes-devtools/python/python3-bcrypt-crates.inc
@@ -3,102 +3,110 @@
 # from src/_bcrypt/Cargo.lock
 SRC_URI += " \
     crate://crates.io/autocfg/1.1.0 \
-    crate://crates.io/base64/0.13.0 \
-    crate://crates.io/bcrypt/0.13.0 \
-    crate://crates.io/bcrypt-pbkdf/0.8.1 \
+    crate://crates.io/base64/0.21.5 \
+    crate://crates.io/bcrypt/0.15.0 \
+    crate://crates.io/bcrypt-pbkdf/0.10.0 \
     crate://crates.io/bitflags/1.3.2 \
-    crate://crates.io/block-buffer/0.10.3 \
+    crate://crates.io/block-buffer/0.10.4 \
     crate://crates.io/blowfish/0.9.1 \
-    crate://crates.io/byteorder/1.4.3 \
+    crate://crates.io/byteorder/1.5.0 \
     crate://crates.io/cfg-if/1.0.0 \
-    crate://crates.io/cipher/0.4.3 \
-    crate://crates.io/cpufeatures/0.2.5 \
+    crate://crates.io/cipher/0.4.4 \
+    crate://crates.io/cpufeatures/0.2.11 \
     crate://crates.io/crypto-common/0.1.6 \
-    crate://crates.io/digest/0.10.5 \
-    crate://crates.io/generic-array/0.14.6 \
-    crate://crates.io/getrandom/0.2.7 \
-    crate://crates.io/indoc/0.3.6 \
-    crate://crates.io/indoc-impl/0.3.6 \
+    crate://crates.io/digest/0.10.7 \
+    crate://crates.io/generic-array/0.14.7 \
+    crate://crates.io/getrandom/0.2.11 \
+    crate://crates.io/heck/0.4.1 \
+    crate://crates.io/indoc/2.0.4 \
     crate://crates.io/inout/0.1.3 \
-    crate://crates.io/instant/0.1.12 \
-    crate://crates.io/libc/0.2.134 \
-    crate://crates.io/lock_api/0.4.9 \
-    crate://crates.io/once_cell/1.15.0 \
-    crate://crates.io/parking_lot/0.11.2 \
-    crate://crates.io/parking_lot_core/0.8.5 \
-    crate://crates.io/paste/0.1.18 \
-    crate://crates.io/paste-impl/0.1.18 \
-    crate://crates.io/pbkdf2/0.10.1 \
-    crate://crates.io/proc-macro-hack/0.5.19 \
-    crate://crates.io/proc-macro2/1.0.46 \
-    crate://crates.io/pyo3/0.15.2 \
-    crate://crates.io/pyo3-build-config/0.15.2 \
-    crate://crates.io/pyo3-macros/0.15.2 \
-    crate://crates.io/pyo3-macros-backend/0.15.2 \
-    crate://crates.io/quote/1.0.21 \
-    crate://crates.io/redox_syscall/0.2.16 \
-    crate://crates.io/scopeguard/1.1.0 \
-    crate://crates.io/sha2/0.10.6 \
-    crate://crates.io/smallvec/1.10.0 \
-    crate://crates.io/subtle/2.4.1 \
-    crate://crates.io/syn/1.0.102 \
-    crate://crates.io/typenum/1.15.0 \
-    crate://crates.io/unicode-ident/1.0.4 \
-    crate://crates.io/unindent/0.1.10 \
+    crate://crates.io/libc/0.2.150 \
+    crate://crates.io/lock_api/0.4.11 \
+    crate://crates.io/memoffset/0.9.0 \
+    crate://crates.io/once_cell/1.18.0 \
+    crate://crates.io/parking_lot/0.12.1 \
+    crate://crates.io/parking_lot_core/0.9.9 \
+    crate://crates.io/pbkdf2/0.12.2 \
+    crate://crates.io/proc-macro2/1.0.70 \
+    crate://crates.io/pyo3/0.20.0 \
+    crate://crates.io/pyo3-build-config/0.20.0 \
+    crate://crates.io/pyo3-ffi/0.20.0 \
+    crate://crates.io/pyo3-macros/0.20.0 \
+    crate://crates.io/pyo3-macros-backend/0.20.0 \
+    crate://crates.io/quote/1.0.33 \
+    crate://crates.io/redox_syscall/0.4.1 \
+    crate://crates.io/scopeguard/1.2.0 \
+    crate://crates.io/sha2/0.10.8 \
+    crate://crates.io/smallvec/1.11.2 \
+    crate://crates.io/subtle/2.5.0 \
+    crate://crates.io/syn/2.0.39 \
+    crate://crates.io/target-lexicon/0.12.12 \
+    crate://crates.io/typenum/1.17.0 \
+    crate://crates.io/unicode-ident/1.0.12 \
+    crate://crates.io/unindent/0.2.3 \
     crate://crates.io/version_check/0.9.4 \
     crate://crates.io/wasi/0.11.0+wasi-snapshot-preview1 \
-    crate://crates.io/winapi/0.3.9 \
-    crate://crates.io/winapi-i686-pc-windows-gnu/0.4.0 \
-    crate://crates.io/winapi-x86_64-pc-windows-gnu/0.4.0 \
-    crate://crates.io/zeroize/1.5.7 \
+    crate://crates.io/windows-targets/0.48.5 \
+    crate://crates.io/windows_aarch64_gnullvm/0.48.5 \
+    crate://crates.io/windows_aarch64_msvc/0.48.5 \
+    crate://crates.io/windows_i686_gnu/0.48.5 \
+    crate://crates.io/windows_i686_msvc/0.48.5 \
+    crate://crates.io/windows_x86_64_gnu/0.48.5 \
+    crate://crates.io/windows_x86_64_gnullvm/0.48.5 \
+    crate://crates.io/windows_x86_64_msvc/0.48.5 \
+    crate://crates.io/zeroize/1.7.0 \
 "
 
 SRC_URI[autocfg-1.1.0.sha256sum] = "d468802bab17cbc0cc575e9b053f41e72aa36bfa6b7f55e3529ffa43161b97fa"
-SRC_URI[base64-0.13.0.sha256sum] = "904dfeac50f3cdaba28fc6f57fdcddb75f49ed61346676a78c4ffe55877802fd"
-SRC_URI[bcrypt-0.13.0.sha256sum] = "a7e7c93a3fb23b2fdde989b2c9ec4dd153063ec81f408507f84c090cd91c6641"
-SRC_URI[bcrypt-pbkdf-0.8.1.sha256sum] = "f4ef233ffa9cb9c7820b2b0e9efd0821ed180e866c9120ec9f45518659742074"
+SRC_URI[base64-0.21.5.sha256sum] = "35636a1494ede3b646cc98f74f8e62c773a38a659ebc777a2cf26b9b74171df9"
+SRC_URI[bcrypt-0.15.0.sha256sum] = "28d1c9c15093eb224f0baa400f38fcd713fc1391a6f1c389d886beef146d60a3"
+SRC_URI[bcrypt-pbkdf-0.10.0.sha256sum] = "6aeac2e1fe888769f34f05ac343bbef98b14d1ffb292ab69d4608b3abc86f2a2"
 SRC_URI[bitflags-1.3.2.sha256sum] = "bef38d45163c2f1dde094a7dfd33ccf595c92905c8f8f4fdc18d06fb1037718a"
-SRC_URI[block-buffer-0.10.3.sha256sum] = "69cce20737498f97b993470a6e536b8523f0af7892a4f928cceb1ac5e52ebe7e"
+SRC_URI[block-buffer-0.10.4.sha256sum] = "3078c7629b62d3f0439517fa394996acacc5cbc91c5a20d8c658e77abd503a71"
 SRC_URI[blowfish-0.9.1.sha256sum] = "e412e2cd0f2b2d93e02543ceae7917b3c70331573df19ee046bcbc35e45e87d7"
-SRC_URI[byteorder-1.4.3.sha256sum] = "14c189c53d098945499cdfa7ecc63567cf3886b3332b312a5b4585d8d3a6a610"
+SRC_URI[byteorder-1.5.0.sha256sum] = "1fd0f2584146f6f2ef48085050886acf353beff7305ebd1ae69500e27c67f64b"
 SRC_URI[cfg-if-1.0.0.sha256sum] = "baf1de4339761588bc0619e3cbc0120ee582ebb74b53b4efbf79117bd2da40fd"
-SRC_URI[cipher-0.4.3.sha256sum] = "d1873270f8f7942c191139cb8a40fd228da6c3fd2fc376d7e92d47aa14aeb59e"
-SRC_URI[cpufeatures-0.2.5.sha256sum] = "28d997bd5e24a5928dd43e46dc529867e207907fe0b239c3477d924f7f2ca320"
+SRC_URI[cipher-0.4.4.sha256sum] = "773f3b9af64447d2ce9850330c473515014aa235e6a783b02db81ff39e4a3dad"
+SRC_URI[cpufeatures-0.2.11.sha256sum] = "ce420fe07aecd3e67c5f910618fe65e94158f6dcc0adf44e00d69ce2bdfe0fd0"
 SRC_URI[crypto-common-0.1.6.sha256sum] = "1bfb12502f3fc46cca1bb51ac28df9d618d813cdc3d2f25b9fe775a34af26bb3"
-SRC_URI[digest-0.10.5.sha256sum] = "adfbc57365a37acbd2ebf2b64d7e69bb766e2fea813521ed536f5d0520dcf86c"
-SRC_URI[generic-array-0.14.6.sha256sum] = "bff49e947297f3312447abdca79f45f4738097cc82b06e72054d2223f601f1b9"
-SRC_URI[getrandom-0.2.7.sha256sum] = "4eb1a864a501629691edf6c15a593b7a51eebaa1e8468e9ddc623de7c9b58ec6"
-SRC_URI[indoc-0.3.6.sha256sum] = "47741a8bc60fb26eb8d6e0238bbb26d8575ff623fdc97b1a2c00c050b9684ed8"
-SRC_URI[indoc-impl-0.3.6.sha256sum] = "ce046d161f000fffde5f432a0d034d0341dc152643b2598ed5bfce44c4f3a8f0"
+SRC_URI[digest-0.10.7.sha256sum] = "9ed9a281f7bc9b7576e61468ba615a66a5c8cfdff42420a70aa82701a3b1e292"
+SRC_URI[generic-array-0.14.7.sha256sum] = "85649ca51fd72272d7821adaf274ad91c288277713d9c18820d8499a7ff69e9a"
+SRC_URI[getrandom-0.2.11.sha256sum] = "fe9006bed769170c11f845cf00c7c1e9092aeb3f268e007c3e760ac68008070f"
+SRC_URI[heck-0.4.1.sha256sum] = "95505c38b4572b2d910cecb0281560f54b440a19336cbbcb27bf6ce6adc6f5a8"
+SRC_URI[indoc-2.0.4.sha256sum] = "1e186cfbae8084e513daff4240b4797e342f988cecda4fb6c939150f96315fd8"
 SRC_URI[inout-0.1.3.sha256sum] = "a0c10553d664a4d0bcff9f4215d0aac67a639cc68ef660840afe309b807bc9f5"
-SRC_URI[instant-0.1.12.sha256sum] = "7a5bbe824c507c5da5956355e86a746d82e0e1464f65d862cc5e71da70e94b2c"
-SRC_URI[libc-0.2.134.sha256sum] = "329c933548736bc49fd575ee68c89e8be4d260064184389a5b77517cddd99ffb"
-SRC_URI[lock_api-0.4.9.sha256sum] = "435011366fe56583b16cf956f9df0095b405b82d76425bc8981c0e22e60ec4df"
-SRC_URI[once_cell-1.15.0.sha256sum] = "e82dad04139b71a90c080c8463fe0dc7902db5192d939bd0950f074d014339e1"
-SRC_URI[parking_lot-0.11.2.sha256sum] = "7d17b78036a60663b797adeaee46f5c9dfebb86948d1255007a1d6be0271ff99"
-SRC_URI[parking_lot_core-0.8.5.sha256sum] = "d76e8e1493bcac0d2766c42737f34458f1c8c50c0d23bcb24ea953affb273216"
-SRC_URI[paste-0.1.18.sha256sum] = "45ca20c77d80be666aef2b45486da86238fabe33e38306bd3118fe4af33fa880"
-SRC_URI[paste-impl-0.1.18.sha256sum] = "d95a7db200b97ef370c8e6de0088252f7e0dfff7d047a28528e47456c0fc98b6"
-SRC_URI[pbkdf2-0.10.1.sha256sum] = "271779f35b581956db91a3e55737327a03aa051e90b1c47aeb189508533adfd7"
-SRC_URI[proc-macro-hack-0.5.19.sha256sum] = "dbf0c48bc1d91375ae5c3cd81e3722dff1abcf81a30960240640d223f59fe0e5"
-SRC_URI[proc-macro2-1.0.46.sha256sum] = "94e2ef8dbfc347b10c094890f778ee2e36ca9bb4262e86dc99cd217e35f3470b"
-SRC_URI[pyo3-0.15.2.sha256sum] = "d41d50a7271e08c7c8a54cd24af5d62f73ee3a6f6a314215281ebdec421d5752"
-SRC_URI[pyo3-build-config-0.15.2.sha256sum] = "779239fc40b8e18bc8416d3a37d280ca9b9fb04bda54b98037bb6748595c2410"
-SRC_URI[pyo3-macros-0.15.2.sha256sum] = "00b247e8c664be87998d8628e86f282c25066165f1f8dda66100c48202fdb93a"
-SRC_URI[pyo3-macros-backend-0.15.2.sha256sum] = "5a8c2812c412e00e641d99eeb79dd478317d981d938aa60325dfa7157b607095"
-SRC_URI[quote-1.0.21.sha256sum] = "bbe448f377a7d6961e30f5955f9b8d106c3f5e449d493ee1b125c1d43c2b5179"
-SRC_URI[redox_syscall-0.2.16.sha256sum] = "fb5a58c1855b4b6819d59012155603f0b22ad30cad752600aadfcb695265519a"
-SRC_URI[scopeguard-1.1.0.sha256sum] = "d29ab0c6d3fc0ee92fe66e2d99f700eab17a8d57d1c1d3b748380fb20baa78cd"
-SRC_URI[sha2-0.10.6.sha256sum] = "82e6b795fe2e3b1e845bafcb27aa35405c4d47cdfc92af5fc8d3002f76cebdc0"
-SRC_URI[smallvec-1.10.0.sha256sum] = "a507befe795404456341dfab10cef66ead4c041f62b8b11bbb92bffe5d0953e0"
-SRC_URI[subtle-2.4.1.sha256sum] = "6bdef32e8150c2a081110b42772ffe7d7c9032b606bc226c8260fd97e0976601"
-SRC_URI[syn-1.0.102.sha256sum] = "3fcd952facd492f9be3ef0d0b7032a6e442ee9b361d4acc2b1d0c4aaa5f613a1"
-SRC_URI[typenum-1.15.0.sha256sum] = "dcf81ac59edc17cc8697ff311e8f5ef2d99fcbd9817b34cec66f90b6c3dfd987"
-SRC_URI[unicode-ident-1.0.4.sha256sum] = "dcc811dc4066ac62f84f11307873c4850cb653bfa9b1719cee2bd2204a4bc5dd"
-SRC_URI[unindent-0.1.10.sha256sum] = "58ee9362deb4a96cef4d437d1ad49cffc9b9e92d202b6995674e928ce684f112"
+SRC_URI[libc-0.2.150.sha256sum] = "89d92a4743f9a61002fae18374ed11e7973f530cb3a3255fb354818118b2203c"
+SRC_URI[lock_api-0.4.11.sha256sum] = "3c168f8615b12bc01f9c17e2eb0cc07dcae1940121185446edc3744920e8ef45"
+SRC_URI[memoffset-0.9.0.sha256sum] = "5a634b1c61a95585bd15607c6ab0c4e5b226e695ff2800ba0cdccddf208c406c"
+SRC_URI[once_cell-1.18.0.sha256sum] = "dd8b5dd2ae5ed71462c540258bedcb51965123ad7e7ccf4b9a8cafaa4a63576d"
+SRC_URI[parking_lot-0.12.1.sha256sum] = "3742b2c103b9f06bc9fff0a37ff4912935851bee6d36f3c02bcc755bcfec228f"
+SRC_URI[parking_lot_core-0.9.9.sha256sum] = "4c42a9226546d68acdd9c0a280d17ce19bfe27a46bf68784e4066115788d008e"
+SRC_URI[pbkdf2-0.12.2.sha256sum] = "f8ed6a7761f76e3b9f92dfb0a60a6a6477c61024b775147ff0973a02653abaf2"
+SRC_URI[proc-macro2-1.0.70.sha256sum] = "39278fbbf5fb4f646ce651690877f89d1c5811a3d4acb27700c1cb3cdb78fd3b"
+SRC_URI[pyo3-0.20.0.sha256sum] = "04e8453b658fe480c3e70c8ed4e3d3ec33eb74988bd186561b0cc66b85c3bc4b"
+SRC_URI[pyo3-build-config-0.20.0.sha256sum] = "a96fe70b176a89cff78f2fa7b3c930081e163d5379b4dcdf993e3ae29ca662e5"
+SRC_URI[pyo3-ffi-0.20.0.sha256sum] = "214929900fd25e6604661ed9cf349727c8920d47deff196c4e28165a6ef2a96b"
+SRC_URI[pyo3-macros-0.20.0.sha256sum] = "dac53072f717aa1bfa4db832b39de8c875b7c7af4f4a6fe93cdbf9264cf8383b"
+SRC_URI[pyo3-macros-backend-0.20.0.sha256sum] = "7774b5a8282bd4f25f803b1f0d945120be959a36c72e08e7cd031c792fdfd424"
+SRC_URI[quote-1.0.33.sha256sum] = "5267fca4496028628a95160fc423a33e8b2e6af8a5302579e322e4b520293cae"
+SRC_URI[redox_syscall-0.4.1.sha256sum] = "4722d768eff46b75989dd134e5c353f0d6296e5aaa3132e776cbdb56be7731aa"
+SRC_URI[scopeguard-1.2.0.sha256sum] = "94143f37725109f92c262ed2cf5e59bce7498c01bcc1502d7b9afe439a4e9f49"
+SRC_URI[sha2-0.10.8.sha256sum] = "793db75ad2bcafc3ffa7c68b215fee268f537982cd901d132f89c6343f3a3dc8"
+SRC_URI[smallvec-1.11.2.sha256sum] = "4dccd0940a2dcdf68d092b8cbab7dc0ad8fa938bf95787e1b916b0e3d0e8e970"
+SRC_URI[subtle-2.5.0.sha256sum] = "81cdd64d312baedb58e21336b31bc043b77e01cc99033ce76ef539f78e965ebc"
+SRC_URI[syn-2.0.39.sha256sum] = "23e78b90f2fcf45d3e842032ce32e3f2d1545ba6636271dcbf24fa306d87be7a"
+SRC_URI[target-lexicon-0.12.12.sha256sum] = "14c39fd04924ca3a864207c66fc2cd7d22d7c016007f9ce846cbb9326331930a"
+SRC_URI[typenum-1.17.0.sha256sum] = "42ff0bf0c66b8238c6f3b578df37d0b7848e55df8577b3f74f92a69acceeb825"
+SRC_URI[unicode-ident-1.0.12.sha256sum] = "3354b9ac3fae1ff6755cb6db53683adb661634f67557942dea4facebec0fee4b"
+SRC_URI[unindent-0.2.3.sha256sum] = "c7de7d73e1754487cb58364ee906a499937a0dfabd86bcb980fa99ec8c8fa2ce"
 SRC_URI[version_check-0.9.4.sha256sum] = "49874b5167b65d7193b8aba1567f5c7d93d001cafc34600cee003eda787e483f"
 SRC_URI[wasi-0.11.0+wasi-snapshot-preview1.sha256sum] = "9c8d87e72b64a3b4db28d11ce29237c246188f4f51057d65a7eab63b7987e423"
-SRC_URI[winapi-0.3.9.sha256sum] = "5c839a674fcd7a98952e593242ea400abe93992746761e38641405d28b00f419"
-SRC_URI[winapi-i686-pc-windows-gnu-0.4.0.sha256sum] = "ac3b87c63620426dd9b991e5ce0329eff545bccbbb34f3be09ff6fb6ab51b7b6"
-SRC_URI[winapi-x86_64-pc-windows-gnu-0.4.0.sha256sum] = "712e227841d057c1ee1cd2fb22fa7e5a5461ae8e48fa2ca79ec42cfc1931183f"
-SRC_URI[zeroize-1.5.7.sha256sum] = "c394b5bd0c6f669e7275d9c20aa90ae064cb22e75a1cad54e1b34088034b149f"
+SRC_URI[windows-targets-0.48.5.sha256sum] = "9a2fa6e2155d7247be68c096456083145c183cbbbc2764150dda45a87197940c"
+SRC_URI[windows_aarch64_gnullvm-0.48.5.sha256sum] = "2b38e32f0abccf9987a4e3079dfb67dcd799fb61361e53e2882c3cbaf0d905d8"
+SRC_URI[windows_aarch64_msvc-0.48.5.sha256sum] = "dc35310971f3b2dbbf3f0690a219f40e2d9afcf64f9ab7cc1be722937c26b4bc"
+SRC_URI[windows_i686_gnu-0.48.5.sha256sum] = "a75915e7def60c94dcef72200b9a8e58e5091744960da64ec734a6c6e9b3743e"
+SRC_URI[windows_i686_msvc-0.48.5.sha256sum] = "8f55c233f70c4b27f66c523580f78f1004e8b5a8b659e05a4eb49d4166cca406"
+SRC_URI[windows_x86_64_gnu-0.48.5.sha256sum] = "53d40abd2583d23e4718fddf1ebec84dbff8381c07cae67ff7768bbf19c6718e"
+SRC_URI[windows_x86_64_gnullvm-0.48.5.sha256sum] = "0b7b52767868a23d5bab768e390dc5f5c55825b6d30b86c844ff2dc7414044cc"
+SRC_URI[windows_x86_64_msvc-0.48.5.sha256sum] = "ed94fce61571a4006852b7389a063ab983c02eb1bb37b47f8272ce92d06d9538"
+SRC_URI[zeroize-1.7.0.sha256sum] = "525b4ec142c6b68a2d10f01f7bbf6755599ca3f81ea53b8431b7dd348f5fdb2d"
diff --git a/meta/recipes-devtools/python/python3-bcrypt_4.0.1.bb b/meta/recipes-devtools/python/python3-bcrypt_4.1.1.bb
similarity index 90%
rename from meta/recipes-devtools/python/python3-bcrypt_4.0.1.bb
rename to meta/recipes-devtools/python/python3-bcrypt_4.1.1.bb
index d8377de96c1..30063c3410f 100644
--- a/meta/recipes-devtools/python/python3-bcrypt_4.0.1.bb
+++ b/meta/recipes-devtools/python/python3-bcrypt_4.1.1.bb
@@ -6,7 +6,7 @@ HOMEPAGE = "https://pypi.org/project/bcrypt/"
 DEPENDS += "${PYTHON_PN}-cffi-native"
 LDFLAGS:append = "${@bb.utils.contains('DISTRO_FEATURES', 'ptest', ' -fuse-ld=bfd', '', d)}"
 
-SRC_URI[sha256sum] = "27d375903ac8261cfe4047f6709d16f7d18d39b1ec92aaf72af989552a650ebd"
+SRC_URI[sha256sum] = "df37f5418d4f1cdcff845f60e747a015389fa4e63703c918330865e06ad80007"
 
 inherit pypi python_setuptools3_rust ptest-cargo cargo-update-recipe-crates
 
-- 
2.34.1


