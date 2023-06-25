Return-Path: <alex.kanavin@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id B4424C04A94
	for <webhook@archiver.kernel.org>; Sun, 25 Jun 2023 21:22:57 +0000 (UTC)
Received: from mail-wm1-f43.google.com (mail-wm1-f43.google.com [209.85.128.43])
 by mx.groups.io with SMTP id smtpd.web11.20168.1687728169809708121
 for <openembedded-core@lists.openembedded.org>;
 Sun, 25 Jun 2023 14:22:50 -0700
Authentication-Results: mx.groups.io;
 dkim=fail reason="signature has expired" header.i=@gmail.com header.s=20221208 header.b=EUauXs5G;
 spf=pass (domain: gmail.com, ip: 209.85.128.43, mailfrom: alex.kanavin@gmail.com)
Received: by mail-wm1-f43.google.com with SMTP id 5b1f17b1804b1-3fa93d61d48so5562045e9.0
        for <openembedded-core@lists.openembedded.org>; Sun, 25 Jun 2023 14:22:49 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20221208; t=1687728168; x=1690320168;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=MdkgFfYjxbaFOUTqXfHvOafZ5N3rV+bg9oHDEbVbVcs=;
        b=EUauXs5G9zp0PkGS0xAk0XpT3h4tufM5vtevZ2Wez+GPhSvp55E0ioJrYDlXqkZqX8
         Wjddv1MLZzGUyb9r67PMTRpDnEWgbKHuB5Lueu8L2gMQ7x3WE2JxNjzohGF6+FaUZxue
         lP9uE29p/NQ8R7JTsMPkrpqVAVkitOEbR9r0fNdlhM9AUYvOD6bOiH7HCiJ3PNyTPL8p
         Yn/VX5QTyeCGWjHO4UvYEg/BOMvniROApz1CSXIRAcCTXaDUmE0OgufRVVUvPX/IxXKv
         rOQkYQDFis7tq1bZszvy5WmL7N0W6tUKUwZ2AoNOLPv24H6hCdKoK5rP4yed3Z/wtAs6
         uBYw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1687728168; x=1690320168;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=MdkgFfYjxbaFOUTqXfHvOafZ5N3rV+bg9oHDEbVbVcs=;
        b=UVBTz34iIuMMeCSgcra8CVIBtLFDzCtSKxtGqr1uEowXyarrXOyQWVDQECiyolZ1yV
         CdJ6KWLtAUI911iOoLkmtYxFnTHRmeT3MfQXb1Z5sjEUtt8GdE720O9TM8tO19LU0FC4
         un9h2r78HoY2kHWNby9+EDBY2uA60fQfX0CGvFViIQOEJMXDxiMLsQ4bUvz+2rM0Z4xU
         KHSlmnh6yqL6IEldKQtjw+fS2Nz5CsD450Jf6SbaeVb7K2A1dZLE9GztMRyw1/+nGSnl
         3zs2x7GG7QoAVUiSXTMfBGl4gIGIFwjkBcMJoDOaG+qIRm+3lTY8yyMn2MYRkQvjDUqJ
         dSvw==
X-Gm-Message-State: AC+VfDzrHURRqDcrymHnh5Zf4qVgAEe0LTKRVNV41YryIz9V38UA17VH
	wgoIpqcUdiEGeodZHTiIV99B/MbSeLfwjg==
X-Google-Smtp-Source: ACHHUZ4vyfvSPjHyVdJIYFzGovaP/LkGH8lehi9Uvrh8+Pmsg+Mmy8VdWP2sfaa3faRjwxhbv5pJAw==
X-Received: by 2002:a7b:c8c2:0:b0:3f9:c27a:d176 with SMTP id f2-20020a7bc8c2000000b003f9c27ad176mr10093832wml.6.1687728168103;
        Sun, 25 Jun 2023 14:22:48 -0700 (PDT)
Received: from Zen2.lab.linutronix.de. (drugstore.linutronix.de. [80.153.143.164])
        by smtp.gmail.com with ESMTPSA id q9-20020a056000136900b0030f9c3219aasm5426736wrz.47.2023.06.25.14.22.47
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 25 Jun 2023 14:22:47 -0700 (PDT)
From: Alexander Kanavin <alex.kanavin@gmail.com>
X-Google-Original-From: Alexander Kanavin <alex@linutronix.de>
To: openembedded-core@lists.openembedded.org
Cc: Alexander Kanavin <alex@linutronix.de>
Subject: [PATCH 07/21] python3-cryptography: update 39.0.2 -> 41.0.1
Date: Sun, 25 Jun 2023 23:22:27 +0200
Message-Id: <20230625212241.915739-7-alex@linutronix.de>
X-Mailer: git-send-email 2.30.2
In-Reply-To: <20230625212241.915739-1-alex@linutronix.de>
References: <20230625212241.915739-1-alex@linutronix.de>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Sun, 25 Jun 2023 21:22:57 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/183382

Drop 0002-Cargo.toml-edition-2018-2021.patch
(issue fixed upstream)

License-Update: PSF licensed code removed as of
https://github.com/pyca/cryptography/commit/5e6476a4c6e094926a983dcf5cbe9488c30aeb53

Signed-off-by: Alexander Kanavin <alex@linutronix.de>
---
 .../python/python3-cryptography-crates.inc    | 182 ++++++++----------
 ...i-substitute-include-path-from-targe.patch |  29 +++
 ...toml-remove-benchmark-disable-option.patch |  25 ++-
 .../0002-Cargo.toml-edition-2018-2021.patch   |  28 ---
 ....0.2.bb => python3-cryptography_41.0.1.bb} |  20 +-
 5 files changed, 131 insertions(+), 153 deletions(-)
 create mode 100644 meta/recipes-devtools/python/python3-cryptography/0001-cryptography-cffi-substitute-include-path-from-targe.patch
 delete mode 100644 meta/recipes-devtools/python/python3-cryptography/0002-Cargo.toml-edition-2018-2021.patch
 rename meta/recipes-devtools/python/{python3-cryptography_39.0.2.bb => python3-cryptography_41.0.1.bb} (74%)

diff --git a/meta/recipes-devtools/python/python3-cryptography-crates.inc b/meta/recipes-devtools/python/python3-cryptography-crates.inc
index 410c9f40428..3b16e323992 100644
--- a/meta/recipes-devtools/python/python3-cryptography-crates.inc
+++ b/meta/recipes-devtools/python/python3-cryptography-crates.inc
@@ -4,135 +4,109 @@
 SRC_URI += " \
     crate://crates.io/Inflector/0.11.4 \
     crate://crates.io/aliasable/0.1.3 \
-    crate://crates.io/android_system_properties/0.1.5 \
-    crate://crates.io/asn1/0.13.0 \
-    crate://crates.io/asn1_derive/0.13.0 \
+    crate://crates.io/asn1/0.15.2 \
+    crate://crates.io/asn1_derive/0.15.2 \
     crate://crates.io/autocfg/1.1.0 \
     crate://crates.io/base64/0.13.1 \
     crate://crates.io/bitflags/1.3.2 \
-    crate://crates.io/bumpalo/3.10.0 \
-    crate://crates.io/cc/1.0.78 \
+    crate://crates.io/cc/1.0.79 \
     crate://crates.io/cfg-if/1.0.0 \
-    crate://crates.io/chrono/0.4.23 \
-    crate://crates.io/codespan-reporting/0.11.1 \
-    crate://crates.io/core-foundation-sys/0.8.3 \
-    crate://crates.io/cxx/1.0.85 \
-    crate://crates.io/cxx-build/1.0.85 \
-    crate://crates.io/cxxbridge-flags/1.0.85 \
-    crate://crates.io/cxxbridge-macro/1.0.85 \
-    crate://crates.io/iana-time-zone/0.1.53 \
-    crate://crates.io/iana-time-zone-haiku/0.1.1 \
-    crate://crates.io/indoc/0.3.6 \
-    crate://crates.io/indoc-impl/0.3.6 \
-    crate://crates.io/instant/0.1.12 \
-    crate://crates.io/js-sys/0.3.60 \
-    crate://crates.io/libc/0.2.139 \
-    crate://crates.io/link-cplusplus/1.0.8 \
+    crate://crates.io/foreign-types/0.3.2 \
+    crate://crates.io/foreign-types-shared/0.1.1 \
+    crate://crates.io/indoc/1.0.9 \
+    crate://crates.io/libc/0.2.144 \
     crate://crates.io/lock_api/0.4.9 \
-    crate://crates.io/log/0.4.17 \
-    crate://crates.io/num-integer/0.1.45 \
-    crate://crates.io/num-traits/0.2.15 \
-    crate://crates.io/once_cell/1.14.0 \
-    crate://crates.io/ouroboros/0.15.5 \
-    crate://crates.io/ouroboros_macro/0.15.5 \
-    crate://crates.io/parking_lot/0.11.2 \
-    crate://crates.io/parking_lot_core/0.8.6 \
-    crate://crates.io/paste/0.1.18 \
-    crate://crates.io/paste-impl/0.1.18 \
-    crate://crates.io/pem/1.1.0 \
+    crate://crates.io/memoffset/0.8.0 \
+    crate://crates.io/once_cell/1.17.2 \
+    crate://crates.io/openssl/0.10.54 \
+    crate://crates.io/openssl-macros/0.1.1 \
+    crate://crates.io/openssl-sys/0.9.88 \
+    crate://crates.io/ouroboros/0.15.6 \
+    crate://crates.io/ouroboros_macro/0.15.6 \
+    crate://crates.io/parking_lot/0.12.1 \
+    crate://crates.io/parking_lot_core/0.9.7 \
+    crate://crates.io/pem/1.1.1 \
+    crate://crates.io/pkg-config/0.3.27 \
     crate://crates.io/proc-macro-error/1.0.4 \
     crate://crates.io/proc-macro-error-attr/1.0.4 \
-    crate://crates.io/proc-macro-hack/0.5.20+deprecated \
-    crate://crates.io/proc-macro2/1.0.49 \
-    crate://crates.io/pyo3/0.15.2 \
-    crate://crates.io/pyo3-build-config/0.15.2 \
-    crate://crates.io/pyo3-macros/0.15.2 \
-    crate://crates.io/pyo3-macros-backend/0.15.2 \
-    crate://crates.io/quote/1.0.23 \
+    crate://crates.io/proc-macro2/1.0.59 \
+    crate://crates.io/pyo3/0.18.3 \
+    crate://crates.io/pyo3-build-config/0.18.3 \
+    crate://crates.io/pyo3-ffi/0.18.3 \
+    crate://crates.io/pyo3-macros/0.18.3 \
+    crate://crates.io/pyo3-macros-backend/0.18.3 \
+    crate://crates.io/quote/1.0.28 \
     crate://crates.io/redox_syscall/0.2.16 \
     crate://crates.io/scopeguard/1.1.0 \
-    crate://crates.io/scratch/1.0.3 \
     crate://crates.io/smallvec/1.10.0 \
-    crate://crates.io/syn/1.0.107 \
-    crate://crates.io/termcolor/1.1.3 \
-    crate://crates.io/unicode-ident/1.0.6 \
-    crate://crates.io/unicode-width/0.1.10 \
+    crate://crates.io/syn/1.0.109 \
+    crate://crates.io/syn/2.0.18 \
+    crate://crates.io/target-lexicon/0.12.7 \
+    crate://crates.io/unicode-ident/1.0.9 \
     crate://crates.io/unindent/0.1.11 \
+    crate://crates.io/vcpkg/0.2.15 \
     crate://crates.io/version_check/0.9.4 \
-    crate://crates.io/wasm-bindgen/0.2.83 \
-    crate://crates.io/wasm-bindgen-backend/0.2.83 \
-    crate://crates.io/wasm-bindgen-macro/0.2.83 \
-    crate://crates.io/wasm-bindgen-macro-support/0.2.83 \
-    crate://crates.io/wasm-bindgen-shared/0.2.83 \
-    crate://crates.io/winapi/0.3.9 \
-    crate://crates.io/winapi-i686-pc-windows-gnu/0.4.0 \
-    crate://crates.io/winapi-util/0.1.5 \
-    crate://crates.io/winapi-x86_64-pc-windows-gnu/0.4.0 \
+    crate://crates.io/windows-sys/0.45.0 \
+    crate://crates.io/windows-targets/0.42.2 \
+    crate://crates.io/windows_aarch64_gnullvm/0.42.2 \
+    crate://crates.io/windows_aarch64_msvc/0.42.2 \
+    crate://crates.io/windows_i686_gnu/0.42.2 \
+    crate://crates.io/windows_i686_msvc/0.42.2 \
+    crate://crates.io/windows_x86_64_gnu/0.42.2 \
+    crate://crates.io/windows_x86_64_gnullvm/0.42.2 \
+    crate://crates.io/windows_x86_64_msvc/0.42.2 \
 "
 
 SRC_URI[Inflector-0.11.4.sha256sum] = "fe438c63458706e03479442743baae6c88256498e6431708f6dfc520a26515d3"
 SRC_URI[aliasable-0.1.3.sha256sum] = "250f629c0161ad8107cf89319e990051fae62832fd343083bea452d93e2205fd"
-SRC_URI[android_system_properties-0.1.5.sha256sum] = "819e7219dbd41043ac279b19830f2efc897156490d7fd6ea916720117ee66311"
-SRC_URI[asn1-0.13.0.sha256sum] = "2affba5e62ee09eeba078f01a00c4aed45ac4287e091298eccbb0d4802efbdc5"
-SRC_URI[asn1_derive-0.13.0.sha256sum] = "bfab79c195875e5aef2bd20b4c8ed8d43ef9610bcffefbbcf66f88f555cc78af"
+SRC_URI[asn1-0.15.2.sha256sum] = "28c19b9324de5b815b6487e0f8098312791b09de0dbf3d5c2db1fe2d95bab973"
+SRC_URI[asn1_derive-0.15.2.sha256sum] = "a045c3ccad89f244a86bd1e6cf1a7bf645296e7692698b056399b6efd4639407"
 SRC_URI[autocfg-1.1.0.sha256sum] = "d468802bab17cbc0cc575e9b053f41e72aa36bfa6b7f55e3529ffa43161b97fa"
 SRC_URI[base64-0.13.1.sha256sum] = "9e1b586273c5702936fe7b7d6896644d8be71e6314cfe09d3167c95f712589e8"
 SRC_URI[bitflags-1.3.2.sha256sum] = "bef38d45163c2f1dde094a7dfd33ccf595c92905c8f8f4fdc18d06fb1037718a"
-SRC_URI[bumpalo-3.10.0.sha256sum] = "37ccbd214614c6783386c1af30caf03192f17891059cecc394b4fb119e363de3"
-SRC_URI[cc-1.0.78.sha256sum] = "a20104e2335ce8a659d6dd92a51a767a0c062599c73b343fd152cb401e828c3d"
+SRC_URI[cc-1.0.79.sha256sum] = "50d30906286121d95be3d479533b458f87493b30a4b5f79a607db8f5d11aa91f"
 SRC_URI[cfg-if-1.0.0.sha256sum] = "baf1de4339761588bc0619e3cbc0120ee582ebb74b53b4efbf79117bd2da40fd"
-SRC_URI[chrono-0.4.23.sha256sum] = "16b0a3d9ed01224b22057780a37bb8c5dbfe1be8ba48678e7bf57ec4b385411f"
-SRC_URI[codespan-reporting-0.11.1.sha256sum] = "3538270d33cc669650c4b093848450d380def10c331d38c768e34cac80576e6e"
-SRC_URI[core-foundation-sys-0.8.3.sha256sum] = "5827cebf4670468b8772dd191856768aedcb1b0278a04f989f7766351917b9dc"
-SRC_URI[cxx-1.0.85.sha256sum] = "5add3fc1717409d029b20c5b6903fc0c0b02fa6741d820054f4a2efa5e5816fd"
-SRC_URI[cxx-build-1.0.85.sha256sum] = "b4c87959ba14bc6fbc61df77c3fcfe180fc32b93538c4f1031dd802ccb5f2ff0"
-SRC_URI[cxxbridge-flags-1.0.85.sha256sum] = "69a3e162fde4e594ed2b07d0f83c6c67b745e7f28ce58c6df5e6b6bef99dfb59"
-SRC_URI[cxxbridge-macro-1.0.85.sha256sum] = "3e7e2adeb6a0d4a282e581096b06e1791532b7d576dcde5ccd9382acf55db8e6"
-SRC_URI[iana-time-zone-0.1.53.sha256sum] = "64c122667b287044802d6ce17ee2ddf13207ed924c712de9a66a5814d5b64765"
-SRC_URI[iana-time-zone-haiku-0.1.1.sha256sum] = "0703ae284fc167426161c2e3f1da3ea71d94b21bedbcc9494e92b28e334e3dca"
-SRC_URI[indoc-0.3.6.sha256sum] = "47741a8bc60fb26eb8d6e0238bbb26d8575ff623fdc97b1a2c00c050b9684ed8"
-SRC_URI[indoc-impl-0.3.6.sha256sum] = "ce046d161f000fffde5f432a0d034d0341dc152643b2598ed5bfce44c4f3a8f0"
-SRC_URI[instant-0.1.12.sha256sum] = "7a5bbe824c507c5da5956355e86a746d82e0e1464f65d862cc5e71da70e94b2c"
-SRC_URI[js-sys-0.3.60.sha256sum] = "49409df3e3bf0856b916e2ceaca09ee28e6871cf7d9ce97a692cacfdb2a25a47"
-SRC_URI[libc-0.2.139.sha256sum] = "201de327520df007757c1f0adce6e827fe8562fbc28bfd9c15571c66ca1f5f79"
-SRC_URI[link-cplusplus-1.0.8.sha256sum] = "ecd207c9c713c34f95a097a5b029ac2ce6010530c7b49d7fea24d977dede04f5"
+SRC_URI[foreign-types-0.3.2.sha256sum] = "f6f339eb8adc052cd2ca78910fda869aefa38d22d5cb648e6485e4d3fc06f3b1"
+SRC_URI[foreign-types-shared-0.1.1.sha256sum] = "00b0228411908ca8685dba7fc2cdd70ec9990a6e753e89b6ac91a84c40fbaf4b"
+SRC_URI[indoc-1.0.9.sha256sum] = "bfa799dd5ed20a7e349f3b4639aa80d74549c81716d9ec4f994c9b5815598306"
+SRC_URI[libc-0.2.144.sha256sum] = "2b00cc1c228a6782d0f076e7b232802e0c5689d41bb5df366f2a6b6621cfdfe1"
 SRC_URI[lock_api-0.4.9.sha256sum] = "435011366fe56583b16cf956f9df0095b405b82d76425bc8981c0e22e60ec4df"
-SRC_URI[log-0.4.17.sha256sum] = "abb12e687cfb44aa40f41fc3978ef76448f9b6038cad6aef4259d3c095a2382e"
-SRC_URI[num-integer-0.1.45.sha256sum] = "225d3389fb3509a24c93f5c29eb6bde2586b98d9f016636dff58d7c6f7569cd9"
-SRC_URI[num-traits-0.2.15.sha256sum] = "578ede34cf02f8924ab9447f50c28075b4d3e5b269972345e7e0372b38c6cdcd"
-SRC_URI[once_cell-1.14.0.sha256sum] = "2f7254b99e31cad77da24b08ebf628882739a608578bb1bcdfc1f9c21260d7c0"
-SRC_URI[ouroboros-0.15.5.sha256sum] = "dfbb50b356159620db6ac971c6d5c9ab788c9cc38a6f49619fca2a27acb062ca"
-SRC_URI[ouroboros_macro-0.15.5.sha256sum] = "4a0d9d1a6191c4f391f87219d1ea42b23f09ee84d64763cd05ee6ea88d9f384d"
-SRC_URI[parking_lot-0.11.2.sha256sum] = "7d17b78036a60663b797adeaee46f5c9dfebb86948d1255007a1d6be0271ff99"
-SRC_URI[parking_lot_core-0.8.6.sha256sum] = "60a2cfe6f0ad2bfc16aefa463b497d5c7a5ecd44a23efa72aa342d90177356dc"
-SRC_URI[paste-0.1.18.sha256sum] = "45ca20c77d80be666aef2b45486da86238fabe33e38306bd3118fe4af33fa880"
-SRC_URI[paste-impl-0.1.18.sha256sum] = "d95a7db200b97ef370c8e6de0088252f7e0dfff7d047a28528e47456c0fc98b6"
-SRC_URI[pem-1.1.0.sha256sum] = "03c64931a1a212348ec4f3b4362585eca7159d0d09cbdf4a7f74f02173596fd4"
+SRC_URI[memoffset-0.8.0.sha256sum] = "d61c719bcfbcf5d62b3a09efa6088de8c54bc0bfcd3ea7ae39fcc186108b8de1"
+SRC_URI[once_cell-1.17.2.sha256sum] = "9670a07f94779e00908f3e686eab508878ebb390ba6e604d3a284c00e8d0487b"
+SRC_URI[openssl-0.10.54.sha256sum] = "69b3f656a17a6cbc115b5c7a40c616947d213ba182135b014d6051b73ab6f019"
+SRC_URI[openssl-macros-0.1.1.sha256sum] = "a948666b637a0f465e8564c73e89d4dde00d72d4d473cc972f390fc3dcee7d9c"
+SRC_URI[openssl-sys-0.9.88.sha256sum] = "c2ce0f250f34a308dcfdbb351f511359857d4ed2134ba715a4eadd46e1ffd617"
+SRC_URI[ouroboros-0.15.6.sha256sum] = "e1358bd1558bd2a083fed428ffeda486fbfb323e698cdda7794259d592ca72db"
+SRC_URI[ouroboros_macro-0.15.6.sha256sum] = "5f7d21ccd03305a674437ee1248f3ab5d4b1db095cf1caf49f1713ddf61956b7"
+SRC_URI[parking_lot-0.12.1.sha256sum] = "3742b2c103b9f06bc9fff0a37ff4912935851bee6d36f3c02bcc755bcfec228f"
+SRC_URI[parking_lot_core-0.9.7.sha256sum] = "9069cbb9f99e3a5083476ccb29ceb1de18b9118cafa53e90c9551235de2b9521"
+SRC_URI[pem-1.1.1.sha256sum] = "a8835c273a76a90455d7344889b0964598e3316e2a79ede8e36f16bdcf2228b8"
+SRC_URI[pkg-config-0.3.27.sha256sum] = "26072860ba924cbfa98ea39c8c19b4dd6a4a25423dbdf219c1eca91aa0cf6964"
 SRC_URI[proc-macro-error-1.0.4.sha256sum] = "da25490ff9892aab3fcf7c36f08cfb902dd3e71ca0f9f9517bea02a73a5ce38c"
 SRC_URI[proc-macro-error-attr-1.0.4.sha256sum] = "a1be40180e52ecc98ad80b184934baf3d0d29f979574e439af5a55274b35f869"
-SRC_URI[proc-macro-hack-0.5.20+deprecated.sha256sum] = "dc375e1527247fe1a97d8b7156678dfe7c1af2fc075c9a4db3690ecd2a148068"
-SRC_URI[proc-macro2-1.0.49.sha256sum] = "57a8eca9f9c4ffde41714334dee777596264c7825420f521abc92b5b5deb63a5"
-SRC_URI[pyo3-0.15.2.sha256sum] = "d41d50a7271e08c7c8a54cd24af5d62f73ee3a6f6a314215281ebdec421d5752"
-SRC_URI[pyo3-build-config-0.15.2.sha256sum] = "779239fc40b8e18bc8416d3a37d280ca9b9fb04bda54b98037bb6748595c2410"
-SRC_URI[pyo3-macros-0.15.2.sha256sum] = "00b247e8c664be87998d8628e86f282c25066165f1f8dda66100c48202fdb93a"
-SRC_URI[pyo3-macros-backend-0.15.2.sha256sum] = "5a8c2812c412e00e641d99eeb79dd478317d981d938aa60325dfa7157b607095"
-SRC_URI[quote-1.0.23.sha256sum] = "8856d8364d252a14d474036ea1358d63c9e6965c8e5c1885c18f73d70bff9c7b"
+SRC_URI[proc-macro2-1.0.59.sha256sum] = "6aeca18b86b413c660b781aa319e4e2648a3e6f9eadc9b47e9038e6fe9f3451b"
+SRC_URI[pyo3-0.18.3.sha256sum] = "e3b1ac5b3731ba34fdaa9785f8d74d17448cd18f30cf19e0c7e7b1fdb5272109"
+SRC_URI[pyo3-build-config-0.18.3.sha256sum] = "9cb946f5ac61bb61a5014924910d936ebd2b23b705f7a4a3c40b05c720b079a3"
+SRC_URI[pyo3-ffi-0.18.3.sha256sum] = "fd4d7c5337821916ea2a1d21d1092e8443cf34879e53a0ac653fbb98f44ff65c"
+SRC_URI[pyo3-macros-0.18.3.sha256sum] = "a9d39c55dab3fc5a4b25bbd1ac10a2da452c4aca13bb450f22818a002e29648d"
+SRC_URI[pyo3-macros-backend-0.18.3.sha256sum] = "97daff08a4c48320587b5224cc98d609e3c27b6d437315bd40b605c98eeb5918"
+SRC_URI[quote-1.0.28.sha256sum] = "1b9ab9c7eadfd8df19006f1cf1a4aed13540ed5cbc047010ece5826e10825488"
 SRC_URI[redox_syscall-0.2.16.sha256sum] = "fb5a58c1855b4b6819d59012155603f0b22ad30cad752600aadfcb695265519a"
 SRC_URI[scopeguard-1.1.0.sha256sum] = "d29ab0c6d3fc0ee92fe66e2d99f700eab17a8d57d1c1d3b748380fb20baa78cd"
-SRC_URI[scratch-1.0.3.sha256sum] = "ddccb15bcce173023b3fedd9436f882a0739b8dfb45e4f6b6002bee5929f61b2"
 SRC_URI[smallvec-1.10.0.sha256sum] = "a507befe795404456341dfab10cef66ead4c041f62b8b11bbb92bffe5d0953e0"
-SRC_URI[syn-1.0.107.sha256sum] = "1f4064b5b16e03ae50984a5a8ed5d4f8803e6bc1fd170a3cda91a1be4b18e3f5"
-SRC_URI[termcolor-1.1.3.sha256sum] = "bab24d30b911b2376f3a13cc2cd443142f0c81dda04c118693e35b3835757755"
-SRC_URI[unicode-ident-1.0.6.sha256sum] = "84a22b9f218b40614adcb3f4ff08b703773ad44fa9423e4e0d346d5db86e4ebc"
-SRC_URI[unicode-width-0.1.10.sha256sum] = "c0edd1e5b14653f783770bce4a4dabb4a5108a5370a5f5d8cfe8710c361f6c8b"
+SRC_URI[syn-1.0.109.sha256sum] = "72b64191b275b66ffe2469e8af2c1cfe3bafa67b529ead792a6d0160888b4237"
+SRC_URI[syn-2.0.18.sha256sum] = "32d41677bcbe24c20c52e7c70b0d8db04134c5d1066bf98662e2871ad200ea3e"
+SRC_URI[target-lexicon-0.12.7.sha256sum] = "fd1ba337640d60c3e96bc6f0638a939b9c9a7f2c316a1598c279828b3d1dc8c5"
+SRC_URI[unicode-ident-1.0.9.sha256sum] = "b15811caf2415fb889178633e7724bad2509101cde276048e013b9def5e51fa0"
 SRC_URI[unindent-0.1.11.sha256sum] = "e1766d682d402817b5ac4490b3c3002d91dfa0d22812f341609f97b08757359c"
+SRC_URI[vcpkg-0.2.15.sha256sum] = "accd4ea62f7bb7a82fe23066fb0957d48ef677f6eeb8215f372f52e48bb32426"
 SRC_URI[version_check-0.9.4.sha256sum] = "49874b5167b65d7193b8aba1567f5c7d93d001cafc34600cee003eda787e483f"
-SRC_URI[wasm-bindgen-0.2.83.sha256sum] = "eaf9f5aceeec8be17c128b2e93e031fb8a4d469bb9c4ae2d7dc1888b26887268"
-SRC_URI[wasm-bindgen-backend-0.2.83.sha256sum] = "4c8ffb332579b0557b52d268b91feab8df3615f265d5270fec2a8c95b17c1142"
-SRC_URI[wasm-bindgen-macro-0.2.83.sha256sum] = "052be0f94026e6cbc75cdefc9bae13fd6052cdcaf532fa6c45e7ae33a1e6c810"
-SRC_URI[wasm-bindgen-macro-support-0.2.83.sha256sum] = "07bc0c051dc5f23e307b13285f9d75df86bfdf816c5721e573dec1f9b8aa193c"
-SRC_URI[wasm-bindgen-shared-0.2.83.sha256sum] = "1c38c045535d93ec4f0b4defec448e4291638ee608530863b1e2ba115d4fff7f"
-SRC_URI[winapi-0.3.9.sha256sum] = "5c839a674fcd7a98952e593242ea400abe93992746761e38641405d28b00f419"
-SRC_URI[winapi-i686-pc-windows-gnu-0.4.0.sha256sum] = "ac3b87c63620426dd9b991e5ce0329eff545bccbbb34f3be09ff6fb6ab51b7b6"
-SRC_URI[winapi-util-0.1.5.sha256sum] = "70ec6ce85bb158151cae5e5c87f95a8e97d2c0c4b001223f33a334e3ce5de178"
-SRC_URI[winapi-x86_64-pc-windows-gnu-0.4.0.sha256sum] = "712e227841d057c1ee1cd2fb22fa7e5a5461ae8e48fa2ca79ec42cfc1931183f"
+SRC_URI[windows-sys-0.45.0.sha256sum] = "75283be5efb2831d37ea142365f009c02ec203cd29a3ebecbc093d52315b66d0"
+SRC_URI[windows-targets-0.42.2.sha256sum] = "8e5180c00cd44c9b1c88adb3693291f1cd93605ded80c250a75d472756b4d071"
+SRC_URI[windows_aarch64_gnullvm-0.42.2.sha256sum] = "597a5118570b68bc08d8d59125332c54f1ba9d9adeedeef5b99b02ba2b0698f8"
+SRC_URI[windows_aarch64_msvc-0.42.2.sha256sum] = "e08e8864a60f06ef0d0ff4ba04124db8b0fb3be5776a5cd47641e942e58c4d43"
+SRC_URI[windows_i686_gnu-0.42.2.sha256sum] = "c61d927d8da41da96a81f029489353e68739737d3beca43145c8afec9a31a84f"
+SRC_URI[windows_i686_msvc-0.42.2.sha256sum] = "44d840b6ec649f480a41c8d80f9c65108b92d89345dd94027bfe06ac444d1060"
+SRC_URI[windows_x86_64_gnu-0.42.2.sha256sum] = "8de912b8b8feb55c064867cf047dda097f92d51efad5b491dfb98f6bbb70cb36"
+SRC_URI[windows_x86_64_gnullvm-0.42.2.sha256sum] = "26d41b46a36d453748aedef1486d5c7a85db22e56aff34643984ea85514e94a3"
+SRC_URI[windows_x86_64_msvc-0.42.2.sha256sum] = "9aec5da331524158c6d1a4ac0ab1541149c0b9505fde06423b02f5ef0106b9f0"
diff --git a/meta/recipes-devtools/python/python3-cryptography/0001-cryptography-cffi-substitute-include-path-from-targe.patch b/meta/recipes-devtools/python/python3-cryptography/0001-cryptography-cffi-substitute-include-path-from-targe.patch
new file mode 100644
index 00000000000..1a60abada79
--- /dev/null
+++ b/meta/recipes-devtools/python/python3-cryptography/0001-cryptography-cffi-substitute-include-path-from-targe.patch
@@ -0,0 +1,29 @@
+From 04aac6c88152088778c6551dfa86b2fc446dc61c Mon Sep 17 00:00:00 2001
+From: Alexander Kanavin <alex@linutronix.de>
+Date: Mon, 19 Jun 2023 13:27:28 +0200
+Subject: [PATCH] cryptography-cffi: substitute include path from target
+ sysroot
+
+Upstream-Status: Accepted [https://github.com/pyca/cryptography/pull/9105]
+
+Signed-off-by: Alexander Kanavin <alex@linutronix.de>
+---
+ src/rust/cryptography-cffi/build.rs | 2 +-
+ 1 file changed, 1 insertion(+), 1 deletion(-)
+
+diff --git a/src/rust/cryptography-cffi/build.rs b/src/rust/cryptography-cffi/build.rs
+index 4a40990..08abb95 100644
+--- a/src/rust/cryptography-cffi/build.rs
++++ b/src/rust/cryptography-cffi/build.rs
+@@ -48,7 +48,7 @@ fn main() {
+     println!("cargo:rustc-cfg=python_implementation=\"{}\"", python_impl);
+     let python_include = run_python_script(
+         &python,
+-        "import sysconfig; print(sysconfig.get_path('include'), end='')",
++        "import sysconfig; print(sysconfig.get_config_var('INCLUDEPY'), end='')",
+     )
+     .unwrap();
+     let openssl_include =
+-- 
+2.30.2
+
diff --git a/meta/recipes-devtools/python/python3-cryptography/0001-pyproject.toml-remove-benchmark-disable-option.patch b/meta/recipes-devtools/python/python3-cryptography/0001-pyproject.toml-remove-benchmark-disable-option.patch
index 481f5952465..69cf451d576 100644
--- a/meta/recipes-devtools/python/python3-cryptography/0001-pyproject.toml-remove-benchmark-disable-option.patch
+++ b/meta/recipes-devtools/python/python3-cryptography/0001-pyproject.toml-remove-benchmark-disable-option.patch
@@ -1,4 +1,4 @@
-From ce972ea92d724f232323a9a6265a8b44d913d4d8 Mon Sep 17 00:00:00 2001
+From b7dd3ce1d75d1e6255e1aca82aa7f401d4246a75 Mon Sep 17 00:00:00 2001
 From: Mingli Yu <mingli.yu@windriver.com>
 Date: Tue, 17 May 2022 17:22:48 +0800
 Subject: [PATCH] pyproject.toml: remove --benchmark-disable option
@@ -18,23 +18,28 @@ Fixes:
 Upstream-Status: Inappropriate [OE specific]
 
 Signed-off-by: Mingli Yu <mingli.yu@windriver.com>
+
 ---
- pyproject.toml | 2 +-
- 1 file changed, 1 insertion(+), 1 deletion(-)
+ pyproject.toml | 4 ++--
+ 1 file changed, 2 insertions(+), 2 deletions(-)
 
 diff --git a/pyproject.toml b/pyproject.toml
-index 4d58129..b011fca 100644
+index b2e511f..4a285af 100644
 --- a/pyproject.toml
 +++ b/pyproject.toml
-@@ -15,7 +15,7 @@ line-length = 79
- target-version = ["py36"]
+@@ -85,7 +85,7 @@ line-length = 79
+ target-version = ["py37"]
  
  [tool.pytest.ini_options]
 -addopts = "-r s --capture=no --strict-markers --benchmark-disable"
 +addopts = "-r s --capture=no --strict-markers"
+ console_output_style = "progress-even-when-capture-no"
  markers = [
      "skip_fips: this test is not executed in FIPS mode",
-     "supported: parametrized test requiring only_if and skip_message",
--- 
-2.25.1
-
+@@ -151,4 +151,4 @@ git-only = [
+     "ci-constraints-requirements.txt",
+     ".gitattributes",
+     ".gitignore",
+-]
+\ No newline at end of file
++]
diff --git a/meta/recipes-devtools/python/python3-cryptography/0002-Cargo.toml-edition-2018-2021.patch b/meta/recipes-devtools/python/python3-cryptography/0002-Cargo.toml-edition-2018-2021.patch
deleted file mode 100644
index 366e3a4d39a..00000000000
--- a/meta/recipes-devtools/python/python3-cryptography/0002-Cargo.toml-edition-2018-2021.patch
+++ /dev/null
@@ -1,28 +0,0 @@
-From 4b73298b214a5b69ea6edf3c2e21dd82b2b29708 Mon Sep 17 00:00:00 2001
-From: Tim Orling <tim.orling@konsulko.com>
-Date: Fri, 14 Jan 2022 22:34:59 -0800
-Subject: [PATCH 2/2] Cargo.toml: edition 2018 -> 2021
-
-Upstream-Status: Pending
-
-Signed-off-by: Tim Orling <tim.orling@konsulko.com>
----
- src/rust/Cargo.toml | 2 +-
- 1 file changed, 1 insertion(+), 1 deletion(-)
-
-diff --git a/src/rust/Cargo.toml b/src/rust/Cargo.toml
-index 174eaa80..7ad053d9 100644
---- a/src/rust/Cargo.toml
-+++ b/src/rust/Cargo.toml
-@@ -2,7 +2,7 @@
- name = "cryptography-rust"
- version = "0.1.0"
- authors = ["The cryptography developers <cryptography-dev@python.org>"]
--edition = "2018"
-+edition = "2021"
- publish = false
- 
- [dependencies]
--- 
-2.30.2
-
diff --git a/meta/recipes-devtools/python/python3-cryptography_39.0.2.bb b/meta/recipes-devtools/python/python3-cryptography_41.0.1.bb
similarity index 74%
rename from meta/recipes-devtools/python/python3-cryptography_39.0.2.bb
rename to meta/recipes-devtools/python/python3-cryptography_41.0.1.bb
index 449e3ba1bcc..fc4f70246be 100644
--- a/meta/recipes-devtools/python/python3-cryptography_39.0.2.bb
+++ b/meta/recipes-devtools/python/python3-cryptography_41.0.1.bb
@@ -1,26 +1,24 @@
 SUMMARY = "Provides cryptographic recipes and primitives to python developers"
 HOMEPAGE = "https://cryptography.io/"
 SECTION = "devel/python"
-LICENSE = "( Apache-2.0 | BSD-3-Clause ) & PSF-2.0"
-LIC_FILES_CHKSUM = "file://LICENSE;md5=bf405a8056a6647e7d077b0e7bc36aba \
+LICENSE = "Apache-2.0 | BSD-3-Clause"
+LIC_FILES_CHKSUM = "file://LICENSE;md5=8c3617db4fb6fae01f1d253ab91511e4 \
                     file://LICENSE.APACHE;md5=4e168cce331e5c827d4c2b68a6200e1b \
                     file://LICENSE.BSD;md5=5ae30ba4123bc4f2fa49aa0b0dce887b \
-                    file://LICENSE.PSF;md5=43c37d21e1dbad10cddcd150ba2c0595 \
                    "
 LDSHARED += "-pthread"
 
-SRC_URI[sha256sum] = "bc5b871e977c8ee5a1bbc42fa8d19bcc08baf0c51cbf1586b0e87a2694dde42f"
+SRC_URI[sha256sum] = "d34579085401d3f49762d2f7d6634d6b6c2ae1242202e860f4d26b046e3a1006"
 
-SRC_URI += "\
-    file://0002-Cargo.toml-edition-2018-2021.patch \
-    file://0001-pyproject.toml-remove-benchmark-disable-option.patch \
-    file://check-memfree.py \
-    file://run-ptest \
-"
+SRC_URI += "file://0001-pyproject.toml-remove-benchmark-disable-option.patch \
+            file://0001-cryptography-cffi-substitute-include-path-from-targe.patch \
+            file://check-memfree.py \
+            file://run-ptest \
+           "
 
 require ${BPN}-crates.inc
 
-inherit pypi python_setuptools3_rust cargo-update-recipe-crates
+inherit pypi python_setuptools3_rust cargo-update-recipe-crates pkgconfig
 
 DEPENDS += " \
     ${PYTHON_PN}-cffi-native \
-- 
2.30.2


