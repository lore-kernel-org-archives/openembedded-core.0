Return-Path: <raj.khem@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id C3347C54E41
	for <webhook@archiver.kernel.org>; Tue, 27 Feb 2024 17:51:47 +0000 (UTC)
Received: from mail-pf1-f173.google.com (mail-pf1-f173.google.com [209.85.210.173])
 by mx.groups.io with SMTP id smtpd.web11.815.1709056302449753875
 for <openembedded-core@lists.openembedded.org>;
 Tue, 27 Feb 2024 09:51:42 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20230601 header.b=eOUFCk9g;
 spf=pass (domain: gmail.com, ip: 209.85.210.173, mailfrom: raj.khem@gmail.com)
Received: by mail-pf1-f173.google.com with SMTP id d2e1a72fcca58-6e0f803d9dfso3179959b3a.0
        for <openembedded-core@lists.openembedded.org>; Tue, 27 Feb 2024 09:51:42 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1709056302; x=1709661102; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=foqMeLa/MKoaWa/b94vBFl4xjxHHSl5POcf0hGyrddw=;
        b=eOUFCk9gG7gfWbFcMf7y8LxKBJjoG7ESyy75vpciYB6Ki68M+3pR2nUXVQVBEtu6Jn
         t9rlSpwT0cnjvxYMfWOcqh7adrufYyjs+c9soY90NDD0/P5nuuq8iTb+TI12PkmNTILE
         +jQCkeMiIBbSmTKLFCD4H5ORdpVrFZ9EWmte4NouSU3mQr10JQvBA7u2n0L0ZwixnMnm
         6bK9xCWh1yqMkm5fwrGlNZwre0xNovRatR5DpZHCus10n3NCwesD4EjBG004tDrlkLxb
         aNKQbfA2pXlgja1agsCDsoglAQXxI1r2zq4blENpmL+bAyHAhBdGgidOdf1UXlcK+k9s
         FdlQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1709056302; x=1709661102;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=foqMeLa/MKoaWa/b94vBFl4xjxHHSl5POcf0hGyrddw=;
        b=GnuqE9mbD/sqiYTXrXB2x8/d4QonNscHSPuBYjsCyAkDjhpnceAxB6UvGptckbazhI
         v1rT6ZzKyKVKobadMHVA9Ly2b8zOrRN2w+SqTllNFM74eMiDpB2gq4DikLY3KyDAmqJ5
         srAf6WTaAQNcLSwi0L+nieo1yPzZML18H2QChXnUbd6Qf2g8eytp9vasGKNA9PR4RaZ4
         cXpHm0XMKA/bJXWMM1hw+LvQEpbvC+4dxOPrRWB21gc6lo4oJQi8yuZvJsXkICFFs7dz
         jnQCQdlMACeGLQtGmfWWZ/U0X8z91VNKN9m6IOPWHhCGSS0e8/yOjfXa8rYLFwHCEGhp
         uF+w==
X-Gm-Message-State: AOJu0YxPwEkDKh6IzCaUvtyN/z1P93ASVyZm9/mz0+0osYdY8z8HJ5S2
	+oXFTrAl24duBfQqxKwuZFy41tu5K13gm4Mr6cBsFp7MGeW5IZWVpb9jY+o6Ayk=
X-Google-Smtp-Source: AGHT+IFjBYPLN/LPWZYXjxjDZr6l1zJMD6D/jRKdWBzfhbNzvboDgb087l+GMn6/VW4a+rta4BykoQ==
X-Received: by 2002:a05:6a00:1889:b0:6e5:4451:eb90 with SMTP id x9-20020a056a00188900b006e54451eb90mr4453916pfh.6.1709056301537;
        Tue, 27 Feb 2024 09:51:41 -0800 (PST)
Received: from apollo.hsd1.ca.comcast.net ([2601:646:9d80:4380::95e0])
        by smtp.gmail.com with ESMTPSA id e12-20020a62aa0c000000b006e5590729aasm151439pff.89.2024.02.27.09.51.41
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 27 Feb 2024 09:51:41 -0800 (PST)
From: Khem Raj <raj.khem@gmail.com>
To: openembedded-core@lists.openembedded.org
Cc: Khem Raj <raj.khem@gmail.com>
Subject: [PATCH v2 2/2] python3-cryptography: Update pyo3 crate to 0.20.3
Date: Tue, 27 Feb 2024 09:51:38 -0800
Message-ID: <20240227175138.2843184-2-raj.khem@gmail.com>
X-Mailer: git-send-email 2.44.0
In-Reply-To: <20240227175138.2843184-1-raj.khem@gmail.com>
References: <20240227175138.2843184-1-raj.khem@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Tue, 27 Feb 2024 17:51:47 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/196287

This gets it building on architectures without 64bit atomics.

Signed-off-by: Khem Raj <raj.khem@gmail.com>
---
 .../python/python3-cryptography-crates.inc    |  22 ++--
 ...m-0.20.2-to-0.20.3-in-src-rust-10462.patch | 105 ++++++++++++++++++
 .../python/python3-cryptography_42.0.2.bb     |   1 +
 3 files changed, 118 insertions(+), 10 deletions(-)
 create mode 100644 meta/recipes-devtools/python/python3-cryptography/0001-Bump-pyo3-from-0.20.2-to-0.20.3-in-src-rust-10462.patch

diff --git a/meta/recipes-devtools/python/python3-cryptography-crates.inc b/meta/recipes-devtools/python/python3-cryptography-crates.inc
index 4714c76bd2b..b26e22b70c3 100644
--- a/meta/recipes-devtools/python/python3-cryptography-crates.inc
+++ b/meta/recipes-devtools/python/python3-cryptography-crates.inc
@@ -25,12 +25,13 @@ SRC_URI += " \
     crate://crates.io/parking_lot_core/0.9.9 \
     crate://crates.io/pem/3.0.3 \
     crate://crates.io/pkg-config/0.3.29 \
+    crate://crates.io/portable-atomic/1.6.0 \
     crate://crates.io/proc-macro2/1.0.78 \
-    crate://crates.io/pyo3/0.20.2 \
-    crate://crates.io/pyo3-build-config/0.20.2 \
-    crate://crates.io/pyo3-ffi/0.20.2 \
-    crate://crates.io/pyo3-macros/0.20.2 \
-    crate://crates.io/pyo3-macros-backend/0.20.2 \
+    crate://crates.io/pyo3/0.20.3 \
+    crate://crates.io/pyo3-build-config/0.20.3 \
+    crate://crates.io/pyo3-ffi/0.20.3 \
+    crate://crates.io/pyo3-macros/0.20.3 \
+    crate://crates.io/pyo3-macros-backend/0.20.3 \
     crate://crates.io/quote/1.0.35 \
     crate://crates.io/redox_syscall/0.4.1 \
     crate://crates.io/scopeguard/1.2.0 \
@@ -74,12 +75,13 @@ SRC_URI[parking_lot-0.12.1.sha256sum] = "3742b2c103b9f06bc9fff0a37ff4912935851be
 SRC_URI[parking_lot_core-0.9.9.sha256sum] = "4c42a9226546d68acdd9c0a280d17ce19bfe27a46bf68784e4066115788d008e"
 SRC_URI[pem-3.0.3.sha256sum] = "1b8fcc794035347fb64beda2d3b462595dd2753e3f268d89c5aae77e8cf2c310"
 SRC_URI[pkg-config-0.3.29.sha256sum] = "2900ede94e305130c13ddd391e0ab7cbaeb783945ae07a279c268cb05109c6cb"
+SRC_URI[portable-atomic-1.6.0.sha256sum] = "7170ef9988bc169ba16dd36a7fa041e5c4cbeb6a35b76d4c03daded371eae7c0"
 SRC_URI[proc-macro2-1.0.78.sha256sum] = "e2422ad645d89c99f8f3e6b88a9fdeca7fabeac836b1002371c4367c8f984aae"
-SRC_URI[pyo3-0.20.2.sha256sum] = "9a89dc7a5850d0e983be1ec2a463a171d20990487c3cfcd68b5363f1ee3d6fe0"
-SRC_URI[pyo3-build-config-0.20.2.sha256sum] = "07426f0d8fe5a601f26293f300afd1a7b1ed5e78b2a705870c5f30893c5163be"
-SRC_URI[pyo3-ffi-0.20.2.sha256sum] = "dbb7dec17e17766b46bca4f1a4215a85006b4c2ecde122076c562dd058da6cf1"
-SRC_URI[pyo3-macros-0.20.2.sha256sum] = "05f738b4e40d50b5711957f142878cfa0f28e054aa0ebdfc3fd137a843f74ed3"
-SRC_URI[pyo3-macros-backend-0.20.2.sha256sum] = "0fc910d4851847827daf9d6cdd4a823fbdaab5b8818325c5e97a86da79e8881f"
+SRC_URI[pyo3-0.20.3.sha256sum] = "53bdbb96d49157e65d45cc287af5f32ffadd5f4761438b527b055fb0d4bb8233"
+SRC_URI[pyo3-build-config-0.20.3.sha256sum] = "deaa5745de3f5231ce10517a1f5dd97d53e5a2fd77aa6b5842292085831d48d7"
+SRC_URI[pyo3-ffi-0.20.3.sha256sum] = "62b42531d03e08d4ef1f6e85a2ed422eb678b8cd62b762e53891c05faf0d4afa"
+SRC_URI[pyo3-macros-0.20.3.sha256sum] = "7305c720fa01b8055ec95e484a6eca7a83c841267f0dd5280f0c8b8551d2c158"
+SRC_URI[pyo3-macros-backend-0.20.3.sha256sum] = "7c7e9b68bb9c3149c5b0cade5d07f953d6d125eb4337723c4ccdb665f1f96185"
 SRC_URI[quote-1.0.35.sha256sum] = "291ec9ab5efd934aaf503a6466c5d5251535d108ee747472c3977cc5acc868ef"
 SRC_URI[redox_syscall-0.4.1.sha256sum] = "4722d768eff46b75989dd134e5c353f0d6296e5aaa3132e776cbdb56be7731aa"
 SRC_URI[scopeguard-1.2.0.sha256sum] = "94143f37725109f92c262ed2cf5e59bce7498c01bcc1502d7b9afe439a4e9f49"
diff --git a/meta/recipes-devtools/python/python3-cryptography/0001-Bump-pyo3-from-0.20.2-to-0.20.3-in-src-rust-10462.patch b/meta/recipes-devtools/python/python3-cryptography/0001-Bump-pyo3-from-0.20.2-to-0.20.3-in-src-rust-10462.patch
new file mode 100644
index 00000000000..33dd7ae5d5a
--- /dev/null
+++ b/meta/recipes-devtools/python/python3-cryptography/0001-Bump-pyo3-from-0.20.2-to-0.20.3-in-src-rust-10462.patch
@@ -0,0 +1,105 @@
+From f6ec5ab18b5beacb08b0157c5193ea626b44b4e1 Mon Sep 17 00:00:00 2001
+From: Khem Raj <raj.khem@gmail.com>
+Date: Tue, 27 Feb 2024 09:30:15 -0800
+Subject: [PATCH] Bump pyo3 from 0.20.2 to 0.20.3 in /src/rust (#10462)
+
+It fixes build on hosts without 64bit atomics
+
+Upstream-Status: Backport [https://github.com/pyca/cryptography/commit/3598d2ee4b5060dbbe6938b893410ed35074567c]
+
+Signed-off-by: Khem Raj <raj.khem@gmail.com>
+---
+ src/rust/Cargo.lock | 28 ++++++++++++++++++----------
+ 1 file changed, 18 insertions(+), 10 deletions(-)
+
+diff --git a/src/rust/Cargo.lock b/src/rust/Cargo.lock
+index b2e0ac4..030e38d 100644
+--- a/src/rust/Cargo.lock
++++ b/src/rust/Cargo.lock
+@@ -263,6 +263,12 @@ version = "0.3.29"
+ source = "registry+https://github.com/rust-lang/crates.io-index"
+ checksum = "2900ede94e305130c13ddd391e0ab7cbaeb783945ae07a279c268cb05109c6cb"
+ 
++[[package]]
++name = "portable-atomic"
++version = "1.6.0"
++source = "registry+https://github.com/rust-lang/crates.io-index"
++checksum = "7170ef9988bc169ba16dd36a7fa041e5c4cbeb6a35b76d4c03daded371eae7c0"
++
+ [[package]]
+ name = "proc-macro2"
+ version = "1.0.78"
+@@ -274,15 +280,16 @@ dependencies = [
+ 
+ [[package]]
+ name = "pyo3"
+-version = "0.20.2"
++version = "0.20.3"
+ source = "registry+https://github.com/rust-lang/crates.io-index"
+-checksum = "9a89dc7a5850d0e983be1ec2a463a171d20990487c3cfcd68b5363f1ee3d6fe0"
++checksum = "53bdbb96d49157e65d45cc287af5f32ffadd5f4761438b527b055fb0d4bb8233"
+ dependencies = [
+  "cfg-if",
+  "indoc",
+  "libc",
+  "memoffset",
+  "parking_lot",
++ "portable-atomic",
+  "pyo3-build-config",
+  "pyo3-ffi",
+  "pyo3-macros",
+@@ -291,9 +298,9 @@ dependencies = [
+ 
+ [[package]]
+ name = "pyo3-build-config"
+-version = "0.20.2"
++version = "0.20.3"
+ source = "registry+https://github.com/rust-lang/crates.io-index"
+-checksum = "07426f0d8fe5a601f26293f300afd1a7b1ed5e78b2a705870c5f30893c5163be"
++checksum = "deaa5745de3f5231ce10517a1f5dd97d53e5a2fd77aa6b5842292085831d48d7"
+ dependencies = [
+  "once_cell",
+  "target-lexicon",
+@@ -301,9 +308,9 @@ dependencies = [
+ 
+ [[package]]
+ name = "pyo3-ffi"
+-version = "0.20.2"
++version = "0.20.3"
+ source = "registry+https://github.com/rust-lang/crates.io-index"
+-checksum = "dbb7dec17e17766b46bca4f1a4215a85006b4c2ecde122076c562dd058da6cf1"
++checksum = "62b42531d03e08d4ef1f6e85a2ed422eb678b8cd62b762e53891c05faf0d4afa"
+ dependencies = [
+  "libc",
+  "pyo3-build-config",
+@@ -311,9 +318,9 @@ dependencies = [
+ 
+ [[package]]
+ name = "pyo3-macros"
+-version = "0.20.2"
++version = "0.20.3"
+ source = "registry+https://github.com/rust-lang/crates.io-index"
+-checksum = "05f738b4e40d50b5711957f142878cfa0f28e054aa0ebdfc3fd137a843f74ed3"
++checksum = "7305c720fa01b8055ec95e484a6eca7a83c841267f0dd5280f0c8b8551d2c158"
+ dependencies = [
+  "proc-macro2",
+  "pyo3-macros-backend",
+@@ -323,12 +330,13 @@ dependencies = [
+ 
+ [[package]]
+ name = "pyo3-macros-backend"
+-version = "0.20.2"
++version = "0.20.3"
+ source = "registry+https://github.com/rust-lang/crates.io-index"
+-checksum = "0fc910d4851847827daf9d6cdd4a823fbdaab5b8818325c5e97a86da79e8881f"
++checksum = "7c7e9b68bb9c3149c5b0cade5d07f953d6d125eb4337723c4ccdb665f1f96185"
+ dependencies = [
+  "heck",
+  "proc-macro2",
++ "pyo3-build-config",
+  "quote",
+  "syn",
+ ]
+-- 
+2.44.0
+
diff --git a/meta/recipes-devtools/python/python3-cryptography_42.0.2.bb b/meta/recipes-devtools/python/python3-cryptography_42.0.2.bb
index c21c4d1a03b..da10e2e60c1 100644
--- a/meta/recipes-devtools/python/python3-cryptography_42.0.2.bb
+++ b/meta/recipes-devtools/python/python3-cryptography_42.0.2.bb
@@ -11,6 +11,7 @@ LDSHARED += "-pthread"
 SRC_URI[sha256sum] = "e0ec52ba3c7f1b7d813cd52649a5b3ef1fc0d433219dc8c93827c57eab6cf888"
 
 SRC_URI += "file://0001-pyproject.toml-remove-benchmark-disable-option.patch \
+            file://0001-Bump-pyo3-from-0.20.2-to-0.20.3-in-src-rust-10462.patch \
             file://check-memfree.py \
             file://run-ptest \
            "
-- 
2.44.0


