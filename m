Return-Path: <ticotimo@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 0C70DC4332F
	for <webhook@archiver.kernel.org>; Sat,  8 Oct 2022 23:55:16 +0000 (UTC)
Received: from mail-pf1-f170.google.com (mail-pf1-f170.google.com
 [209.85.210.170])
 by mx.groups.io with SMTP id smtpd.web09.9315.1665273310190726084
 for <openembedded-core@lists.openembedded.org>;
 Sat, 08 Oct 2022 16:55:10 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20210112 header.b=PuZykydo;
 spf=pass (domain: gmail.com, ip: 209.85.210.170,
 mailfrom: ticotimo@gmail.com)
Received: by mail-pf1-f170.google.com with SMTP id i6so7935170pfb.2
        for <openembedded-core@lists.openembedded.org>;
 Sat, 08 Oct 2022 16:55:10 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=gx/n/yoP0dS2If559aD21BJ8XkSsosjLb+Na5gGJWWw=;
        b=PuZykydoJUc4GKX+xS8xVtEy/saQ3E8B7QPfurlrrQqkcWNAyozAvf/172pQZR1z2K
         EpBWu8EqaP1DttI0YIQIM/ZJdlTA7rjdC/Trla91a4WGDo3lFJr6oCGU3a0L6MgG1M+/
         iQ/zJ/wFZW5JkkFN1pssYK+sJfEWraSO0aJQLOQa7EfYRfDxHu6SPAQJhYZBvCtGF3Vg
         mNgjI9ViLd0XQYcCxHkEIjdxqswSuGIgvsIz3xsZG/N8wTfm3cwWKu51qwA/BSwVgCr/
         VvI1DECp9vyYaeIvAWlmd1lA3UOydkO65+6o4RcAutC7wo5yQH30bdul6wPXYx5haoVi
         q+vg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=gx/n/yoP0dS2If559aD21BJ8XkSsosjLb+Na5gGJWWw=;
        b=BMWbaxbudBSyYkM9Yub09uawiGzpYRjpgxLDpSAfIyWVHGFWC5WdYF1h6mepTTmLIX
         kxFLbleXIcPiWl0oSGdgRD41uTfsnMGgb/bOB+HrNGkr1ByXBgn/tMKNPHYBdrMmyJW1
         1rt180jfLoNhbITlopGuFf7xlBWqwZFuRcyPI07eqyhRHe/teGbrvW2Bk00SPC34s+ex
         TcY3qD0cNmO1guRsGAN+v3LkEz6xcBtsyLGrufza2G2iMjy4oeSJ2aSkqbrmNLTF2A9Z
         kg1FLOqOMRizKaYBhYTefN4td417s2SVIet/MFtliItUt1Bh7uIuS3yC/zmYf0CoSzJ/
         D7pw==
X-Gm-Message-State: ACrzQf3RiICP6uSYuUVX5WVcagYecbj/TXMgUcNo6yZOrEVbD37i42P8
	0aGtR5quU3YhxEU5MotMf+i8p7L2VLI=
X-Google-Smtp-Source: 
 AMsMyM598d/d0tqx/LrShdxhMYMgbjXqv1xcFi1Opq/0QykIHUhBKrKQ4tc1F2PAqQQVQrivYqF67w==
X-Received: by 2002:a05:6a02:104:b0:430:93ec:776f with SMTP id
 bg4-20020a056a02010400b0043093ec776fmr10293277pgb.544.1665273309090;
        Sat, 08 Oct 2022 16:55:09 -0700 (PDT)
Received: from chiron.hsd1.or.comcast.net
 ([2601:1c0:ca00:cea0:170:23ea:e88e:bfb7])
        by smtp.gmail.com with ESMTPSA id
 k11-20020a170902ce0b00b0017f57787a4asm3814710plg.229.2022.10.08.16.55.08
        for <openembedded-core@lists.openembedded.org>
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 08 Oct 2022 16:55:08 -0700 (PDT)
From: Tim Orling <ticotimo@gmail.com>
X-Google-Original-From: Tim Orling <tim.orling@konsulko.com>
To: openembedded-core@lists.openembedded.org
Subject: [PATCH 01/10] python3-cryptography: upgrade 37.0.4 -> 38.0.1
Date: Sat,  8 Oct 2022 16:54:45 -0700
Message-Id: 
 <84594a2a5a9392187568022af9453e97fae2aa9c.1665270768.git.tim.orling@konsulko.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <cover.1665270768.git.tim.orling@konsulko.com>
References: <cover.1665270768.git.tim.orling@konsulko.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Sat, 08 Oct 2022 23:55:16 -0000
X-Groupsio-URL: 
 https://lists.openembedded.org/g/openembedded-core/message/171539

* Drop 0001-Cargo.toml-specify-pem-version.patch, superceded.
* Update crate:// (via cargo bitbake)
* Manually fix crate:// versions to satisfy cargo

Release notes:

38.0.1 - 2022-09-07
  - Fixed parsing TLVs in ASN.1 with length greater than 65535 bytes
    (typically seen in large CRLs).

38.0.0 - 2022-09-06
  - Final deprecation of OpenSSL 1.1.0. The next release of cryptography
    will drop support.
  (For complete release notes, see:
  https://github.com/pyca/cryptography/blob/main/CHANGELOG.rst#3800---2022-09-06)

Signed-off-by: Tim Orling <tim.orling@konsulko.com>
---
 .../0001-Cargo.toml-specify-pem-version.patch |  29 -----
 ....0.4.bb => python3-cryptography_38.0.1.bb} | 113 ++++++++++--------
 2 files changed, 61 insertions(+), 81 deletions(-)
 delete mode 100644 meta/recipes-devtools/python/python3-cryptography/0001-Cargo.toml-specify-pem-version.patch
 rename meta/recipes-devtools/python/{python3-cryptography_37.0.4.bb => python3-cryptography_38.0.1.bb} (41%)

diff --git a/meta/recipes-devtools/python/python3-cryptography/0001-Cargo.toml-specify-pem-version.patch b/meta/recipes-devtools/python/python3-cryptography/0001-Cargo.toml-specify-pem-version.patch
deleted file mode 100644
index 7266fd7befb..00000000000
--- a/meta/recipes-devtools/python/python3-cryptography/0001-Cargo.toml-specify-pem-version.patch
+++ /dev/null
@@ -1,29 +0,0 @@
-From d41203b9b79f5edc2d33b0d62921822294dfaa6b Mon Sep 17 00:00:00 2001
-From: Tim Orling <tim.orling@konsulko.com>
-Date: Fri, 14 Jan 2022 22:02:25 -0800
-Subject: [PATCH] Cargo.toml: specify pem version
-
-pem = "1.0" is not resolving, specify the current
-pem = { version: "1.0.2"}
-
-Upstream-Status: Pending
-
-Signed-off-by: Tim Orling <tim.orling@konsulko.com>
-
----
- src/rust/Cargo.toml | 2 +-
- 1 file changed, 1 insertion(+), 1 deletion(-)
-
-diff --git a/src/rust/Cargo.toml b/src/rust/Cargo.toml
-index d17245d..f8f6416 100644
---- a/src/rust/Cargo.toml
-+++ b/src/rust/Cargo.toml
-@@ -9,7 +9,7 @@ publish = false
- lazy_static = "1"
- pyo3 = { version = "0.15.2" }
- asn1 = { version = "0.8.7", default-features = false, features = ["derive"] }
--pem = "1.0"
-+pem = { version = "1.0.2" }
- chrono = { version = "0.4", default-features = false, features = ["alloc", "clock"] }
- ouroboros = "0.15"
- 
diff --git a/meta/recipes-devtools/python/python3-cryptography_37.0.4.bb b/meta/recipes-devtools/python/python3-cryptography_38.0.1.bb
similarity index 41%
rename from meta/recipes-devtools/python/python3-cryptography_37.0.4.bb
rename to meta/recipes-devtools/python/python3-cryptography_38.0.1.bb
index c91a8c77712..905293a43e5 100644
--- a/meta/recipes-devtools/python/python3-cryptography_37.0.4.bb
+++ b/meta/recipes-devtools/python/python3-cryptography_38.0.1.bb
@@ -9,59 +9,68 @@ LIC_FILES_CHKSUM = "file://LICENSE;md5=bf405a8056a6647e7d077b0e7bc36aba \
                    "
 LDSHARED += "-pthread"
 
-SRC_URI[sha256sum] = "63f9c17c0e2474ccbebc9302ce2f07b55b3b3fcb211ded18a42d5764f5c10a82"
+SRC_URI[sha256sum] = "1db3d807a14931fa317f96435695d9ec386be7b84b618cc61cfa5d08b0ae33d7"
 
-SRC_URI += "file://run-ptest \
-           file://check-memfree.py \
-           file://0001-Cargo.toml-specify-pem-version.patch \
-           file://0002-Cargo.toml-edition-2018-2021.patch \
-           file://0001-pyproject.toml-remove-benchmark-disable-option.patch \
-           crate://crates.io/Inflector/0.11.4 \
-           crate://crates.io/aliasable/0.1.3 \
-           crate://crates.io/asn1/0.8.7 \
-           crate://crates.io/asn1_derive/0.8.7 \
-           crate://crates.io/autocfg/1.1.0 \
-           crate://crates.io/base64/0.13.0 \
-           crate://crates.io/bitflags/1.3.2 \
-           crate://crates.io/cfg-if/1.0.0 \
-           crate://crates.io/chrono/0.4.19 \
-           crate://crates.io/indoc-impl/0.3.6 \
-           crate://crates.io/indoc/0.3.6 \
-           crate://crates.io/instant/0.1.12 \
-           crate://crates.io/lazy_static/1.4.0 \
-           crate://crates.io/libc/0.2.124 \
-           crate://crates.io/lock_api/0.4.7 \
-           crate://crates.io/num-integer/0.1.44 \
-           crate://crates.io/num-traits/0.2.14 \
-           crate://crates.io/once_cell/1.10.0 \
-           crate://crates.io/ouroboros/0.15.0 \
-           crate://crates.io/ouroboros_macro/0.15.0 \
-           crate://crates.io/parking_lot/0.11.2 \
-           crate://crates.io/parking_lot_core/0.8.5 \
-           crate://crates.io/paste-impl/0.1.18 \
-           crate://crates.io/paste/0.1.18 \
-           crate://crates.io/pem/1.0.2 \
-           crate://crates.io/proc-macro-error-attr/1.0.4 \
-           crate://crates.io/proc-macro-error/1.0.4 \
-           crate://crates.io/proc-macro-hack/0.5.19 \
-           crate://crates.io/proc-macro2/1.0.37 \
-           crate://crates.io/pyo3-build-config/0.15.2 \
-           crate://crates.io/pyo3-macros-backend/0.15.2 \
-           crate://crates.io/pyo3-macros/0.15.2 \
-           crate://crates.io/pyo3/0.15.2 \
-           crate://crates.io/quote/1.0.18 \
-           crate://crates.io/redox_syscall/0.2.13 \
-           crate://crates.io/scopeguard/1.1.0 \
-           crate://crates.io/smallvec/1.8.0 \
-           crate://crates.io/stable_deref_trait/1.2.0 \
-           crate://crates.io/syn/1.0.91 \
-           crate://crates.io/unicode-xid/0.2.2 \
-           crate://crates.io/unindent/0.1.8 \
-           crate://crates.io/version_check/0.9.4 \
-           crate://crates.io/winapi-i686-pc-windows-gnu/0.4.0 \
-           crate://crates.io/winapi-x86_64-pc-windows-gnu/0.4.0 \
-           crate://crates.io/winapi/0.3.9 \
-           "
+SRC_URI += "\
+    file://0002-Cargo.toml-edition-2018-2021.patch \
+    file://0001-pyproject.toml-remove-benchmark-disable-option.patch \
+    file://check-memfree.py \
+    file://run-ptest \
+    crate://crates.io/Inflector/0.11.4 \
+    crate://crates.io/aliasable/0.1.3 \
+    crate://crates.io/android_system_properties/0.1.5 \
+    crate://crates.io/asn1/0.12.2 \
+    crate://crates.io/asn1_derive/0.12.2 \
+    crate://crates.io/autocfg/1.1.0 \
+    crate://crates.io/base64/0.13.0 \
+    crate://crates.io/bitflags/1.3.2 \
+    crate://crates.io/bumpalo/3.10.0 \
+    crate://crates.io/cfg-if/1.0.0 \
+    crate://crates.io/chrono/0.4.22 \
+    crate://crates.io/core-foundation-sys/0.8.3 \
+    crate://crates.io/iana-time-zone/0.1.47 \
+    crate://crates.io/indoc-impl/0.3.6 \
+    crate://crates.io/indoc/0.3.6 \
+    crate://crates.io/instant/0.1.12 \
+    crate://crates.io/js-sys/0.3.59 \
+    crate://crates.io/libc/0.2.132 \
+    crate://crates.io/lock_api/0.4.8 \
+    crate://crates.io/log/0.4.17 \
+    crate://crates.io/num-integer/0.1.45 \
+    crate://crates.io/num-traits/0.2.15 \
+    crate://crates.io/once_cell/1.14.0 \
+    crate://crates.io/ouroboros/0.15.4 \
+    crate://crates.io/ouroboros_macro/0.15.4 \
+    crate://crates.io/parking_lot/0.11.2 \
+    crate://crates.io/parking_lot_core/0.8.5 \
+    crate://crates.io/paste-impl/0.1.18 \
+    crate://crates.io/paste/0.1.18 \
+    crate://crates.io/pem/1.1.0 \
+    crate://crates.io/proc-macro-error-attr/1.0.4 \
+    crate://crates.io/proc-macro-error/1.0.4 \
+    crate://crates.io/proc-macro-hack/0.5.19 \
+    crate://crates.io/proc-macro2/1.0.43 \
+    crate://crates.io/pyo3-build-config/0.15.2 \
+    crate://crates.io/pyo3-macros-backend/0.15.2 \
+    crate://crates.io/pyo3-macros/0.15.2 \
+    crate://crates.io/pyo3/0.15.2 \
+    crate://crates.io/quote/1.0.21 \
+    crate://crates.io/redox_syscall/0.2.16 \
+    crate://crates.io/scopeguard/1.1.0 \
+    crate://crates.io/smallvec/1.9.0 \
+    crate://crates.io/syn/1.0.99 \
+    crate://crates.io/unicode-ident/1.0.3 \
+    crate://crates.io/unindent/0.1.10 \
+    crate://crates.io/version_check/0.9.4 \
+    crate://crates.io/wasm-bindgen/0.2.82 \
+    crate://crates.io/wasm-bindgen-backend/0.2.82 \
+    crate://crates.io/wasm-bindgen-macro-support/0.2.82 \
+    crate://crates.io/wasm-bindgen-macro/0.2.82 \
+    crate://crates.io/wasm-bindgen-shared/0.2.82 \
+    crate://crates.io/winapi/0.3.9 \
+    crate://crates.io/winapi-i686-pc-windows-gnu/0.4.0 \
+    crate://crates.io/winapi-x86_64-pc-windows-gnu/0.4.0 \
+"
 
 inherit pypi python_setuptools3_rust
 
-- 
2.34.1


