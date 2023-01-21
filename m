Return-Path: <ticotimo@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id F1850C004D4
	for <webhook@archiver.kernel.org>; Sat, 21 Jan 2023 18:43:47 +0000 (UTC)
Received: from mail-pj1-f48.google.com (mail-pj1-f48.google.com [209.85.216.48])
 by mx.groups.io with SMTP id smtpd.web10.3097.1674326618028647275
 for <openembedded-core@lists.openembedded.org>;
 Sat, 21 Jan 2023 10:43:38 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20210112 header.b=bnOcQYBp;
 spf=pass (domain: gmail.com, ip: 209.85.216.48, mailfrom: ticotimo@gmail.com)
Received: by mail-pj1-f48.google.com with SMTP id bj3so8481990pjb.0
        for <openembedded-core@lists.openembedded.org>; Sat, 21 Jan 2023 10:43:37 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=/fq3s8Ko769XYXJqTT2V0DLaJ28bf1+euYMfMVuXPIk=;
        b=bnOcQYBpjyWUYf8ArPT6M2EnOkQkT3I+4LxWhhC03e7T4MdLLda6l91zi9hG7GESOs
         1T5hglYxh1rjqRAf38cBIVjVBqZlm0NCMfxIu12fV9t865UfYBMcblfj+eSg0wmMPbBJ
         SKoTf81vQr2bPHqg026AwTLrR6X1YTzrbPoFLIe+9fgfPLz3m2cMOKYmOK776JK2eDCe
         7cu9aMEWevPQABpJmYjHQnXCrnkR6U0U03QZj+ItLrV15+9gM1P9XSeRkp1BUeH0ntAT
         XAVglBG2T322gY2ryLuCTOU5vgHgZZPXy65rd7Iwh3ftIxCD4gqj46ixyXbEq+CZiFYa
         NX5Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=/fq3s8Ko769XYXJqTT2V0DLaJ28bf1+euYMfMVuXPIk=;
        b=zA9IEu0nwnzP18QgTn4lUmv2wC0wkeuriSGdsTUg1w8gDZXf7j71zRt93sTPF10ilH
         f5JSTavpOt5ZMbEtd9DLFFuCQNC7wKppYvdl/+pw4nO2vLPegUI9v6/5nHI7pkiCM8o6
         IzlhZfmPqFTtsxQzdARLRkwAp0Fi+9WvJZ0nCAfi4fjKHz7fsZyaXg5CpDF3XmpxcL1V
         KeQS4CStrWDgtnD4o0b1fxQ36FzzXGlwIUVIEogSLoIuOlf9IcR2AfqLI/KOOsTe8Zb7
         J8YmbarYmFwAWwlcL1MaXV0rVhF5Rf+I+nANZ426jmlUPWcwFaBNpm1iZeTufdbyMPSN
         y95w==
X-Gm-Message-State: AFqh2kodtvEwuf9tU6yjFOfYZt+OhysUO4S3Orxfv2athIS3u4BW11hl
	xwY7WOAk6EwFx7bvSE+RTC7SlbVqODs=
X-Google-Smtp-Source: AMrXdXs08p0xX9WbywiIO9W9NlIpyqfCNaHlBz7RquPUVNTsiHd53oW8iNpyovTRmCZnkR0on01yjw==
X-Received: by 2002:a17:902:f149:b0:193:23b6:d23b with SMTP id d9-20020a170902f14900b0019323b6d23bmr16345977plb.16.1674326616515;
        Sat, 21 Jan 2023 10:43:36 -0800 (PST)
Received: from nereus.hsd1.or.comcast.net ([2601:1c0:ca00:cea0:ae98:a494:e65d:a980])
        by smtp.gmail.com with ESMTPSA id p11-20020a1709026b8b00b001897e2fd65dsm29125882plk.9.2023.01.21.10.43.35
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 21 Jan 2023 10:43:35 -0800 (PST)
From: Tim Orling <ticotimo@gmail.com>
X-Google-Original-From: Tim Orling <tim.orling@konsulko.com>
To: openembedded-core@lists.openembedded.org
Cc: Tim Orling <tim.orling@konsulko.com>
Subject: [PATCH] python3-cryptography{-vectors}: 38.0.4 -> 39.0.0
Date: Sat, 21 Jan 2023 10:40:30 -0800
Message-Id: <20230121184029.844726-1-tim.orling@konsulko.com>
X-Mailer: git-send-email 2.30.2
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Sat, 21 Jan 2023 18:43:47 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/176255

* python3-cryptography-crates.inc: update for 39.0.0
* python3-cryptography-vectors: upgrade 38.0.4 -> 39.0.0

Highlights from Changelog:
https://cryptography.io/en/latest/changelog/#v39-0-0

39.0.0 - 2023-01-01

* BACKWARDS INCOMPATIBLE: Support for OpenSSL 1.1.0 has been removed.
  Users on older version of OpenSSL will need to upgrade.

* BACKWARDS INCOMPATIBLE: Dropped support for LibreSSL < 3.5. The new
  minimum LibreSSL version is 3.5.0. Going forward our policy is to
  support versions of LibreSSL that are available in versions of OpenBSD
  that are still receiving security support.

* BACKWARDS INCOMPATIBLE: Removed the encode_point and from_encoded_point
  methods on EllipticCurvePublicNumbers, which had been deprecated for
  several years. public_bytes() and from_encoded_point() should be used
  instead.

* BACKWARDS INCOMPATIBLE: Support for using MD5 or SHA1 in
  CertificateBuilder, other X.509 builders, and PKCS7 has been removed.

* ANNOUNCEMENT: The next version of cryptography (40.0) will change the
  way we link OpenSSL. This will only impact users who build cryptography
  from source (i.e., not from a wheel), and specify their own version of
  OpenSSL. For those users, the CFLAGS, LDFLAGS, INCLUDE, LIB, and
  CRYPTOGRAPHY_SUPPRESS_LINK_FLAGS environment variables will no longer
  be respected.

Signed-off-by: Tim Orling <tim.orling@konsulko.com>
---
All ptests pass on qemux86-64

 .../python/python3-cryptography-crates.inc    | 123 ++++++++++--------
 ...=> python3-cryptography-vectors_39.0.0.bb} |   2 +-
 ....0.4.bb => python3-cryptography_39.0.0.bb} |   2 +-
 3 files changed, 70 insertions(+), 57 deletions(-)
 rename meta/recipes-devtools/python/{python3-cryptography-vectors_38.0.4.bb => python3-cryptography-vectors_39.0.0.bb} (90%)
 rename meta/recipes-devtools/python/{python3-cryptography_38.0.4.bb => python3-cryptography_39.0.0.bb} (95%)

diff --git a/meta/recipes-devtools/python/python3-cryptography-crates.inc b/meta/recipes-devtools/python/python3-cryptography-crates.inc
index 9339a15091..a0c8fa50c9 100644
--- a/meta/recipes-devtools/python/python3-cryptography-crates.inc
+++ b/meta/recipes-devtools/python/python3-cryptography-crates.inc
@@ -1,58 +1,71 @@
 # Autogenerated with 'bitbake -c update_crates python3-cryptography'
 
-SRC_URI += " \ 
-        crate://crates.io/Inflector/0.11.4 \ 
-        crate://crates.io/aliasable/0.1.3 \ 
-        crate://crates.io/android_system_properties/0.1.5 \ 
-        crate://crates.io/asn1/0.12.2 \ 
-        crate://crates.io/asn1_derive/0.12.2 \ 
-        crate://crates.io/autocfg/1.1.0 \ 
-        crate://crates.io/base64/0.13.0 \ 
-        crate://crates.io/bitflags/1.3.2 \ 
-        crate://crates.io/bumpalo/3.10.0 \ 
-        crate://crates.io/cfg-if/1.0.0 \ 
-        crate://crates.io/chrono/0.4.22 \ 
-        crate://crates.io/core-foundation-sys/0.8.3 \ 
-        crate://crates.io/iana-time-zone/0.1.47 \ 
-        crate://crates.io/indoc/0.3.6 \ 
-        crate://crates.io/indoc-impl/0.3.6 \ 
-        crate://crates.io/instant/0.1.12 \ 
-        crate://crates.io/js-sys/0.3.59 \ 
-        crate://crates.io/libc/0.2.132 \ 
-        crate://crates.io/lock_api/0.4.8 \ 
-        crate://crates.io/log/0.4.17 \ 
-        crate://crates.io/num-integer/0.1.45 \ 
-        crate://crates.io/num-traits/0.2.15 \ 
-        crate://crates.io/once_cell/1.14.0 \ 
-        crate://crates.io/ouroboros/0.15.4 \ 
-        crate://crates.io/ouroboros_macro/0.15.4 \ 
-        crate://crates.io/parking_lot/0.11.2 \ 
-        crate://crates.io/parking_lot_core/0.8.5 \ 
-        crate://crates.io/paste/0.1.18 \ 
-        crate://crates.io/paste-impl/0.1.18 \ 
-        crate://crates.io/pem/1.1.0 \ 
-        crate://crates.io/proc-macro-error/1.0.4 \ 
-        crate://crates.io/proc-macro-error-attr/1.0.4 \ 
-        crate://crates.io/proc-macro-hack/0.5.19 \ 
-        crate://crates.io/proc-macro2/1.0.43 \ 
-        crate://crates.io/pyo3/0.15.2 \ 
-        crate://crates.io/pyo3-build-config/0.15.2 \ 
-        crate://crates.io/pyo3-macros/0.15.2 \ 
-        crate://crates.io/pyo3-macros-backend/0.15.2 \ 
-        crate://crates.io/quote/1.0.21 \ 
-        crate://crates.io/redox_syscall/0.2.16 \ 
-        crate://crates.io/scopeguard/1.1.0 \ 
-        crate://crates.io/smallvec/1.9.0 \ 
-        crate://crates.io/syn/1.0.99 \ 
-        crate://crates.io/unicode-ident/1.0.3 \ 
-        crate://crates.io/unindent/0.1.10 \ 
-        crate://crates.io/version_check/0.9.4 \ 
-        crate://crates.io/wasm-bindgen/0.2.82 \ 
-        crate://crates.io/wasm-bindgen-backend/0.2.82 \ 
-        crate://crates.io/wasm-bindgen-macro/0.2.82 \ 
-        crate://crates.io/wasm-bindgen-macro-support/0.2.82 \ 
-        crate://crates.io/wasm-bindgen-shared/0.2.82 \ 
-        crate://crates.io/winapi/0.3.9 \ 
-        crate://crates.io/winapi-i686-pc-windows-gnu/0.4.0 \ 
-        crate://crates.io/winapi-x86_64-pc-windows-gnu/0.4.0 \ 
+# from src/rust/Cargo.lock
+SRC_URI += " \
+    crate://crates.io/Inflector/0.11.4 \
+    crate://crates.io/aliasable/0.1.3 \
+    crate://crates.io/android_system_properties/0.1.5 \
+    crate://crates.io/asn1/0.13.0 \
+    crate://crates.io/asn1_derive/0.13.0 \
+    crate://crates.io/autocfg/1.1.0 \
+    crate://crates.io/base64/0.13.1 \
+    crate://crates.io/bitflags/1.3.2 \
+    crate://crates.io/bumpalo/3.10.0 \
+    crate://crates.io/cc/1.0.78 \
+    crate://crates.io/cfg-if/1.0.0 \
+    crate://crates.io/chrono/0.4.23 \
+    crate://crates.io/codespan-reporting/0.11.1 \
+    crate://crates.io/core-foundation-sys/0.8.3 \
+    crate://crates.io/cxx/1.0.85 \
+    crate://crates.io/cxx-build/1.0.85 \
+    crate://crates.io/cxxbridge-flags/1.0.85 \
+    crate://crates.io/cxxbridge-macro/1.0.85 \
+    crate://crates.io/iana-time-zone/0.1.53 \
+    crate://crates.io/iana-time-zone-haiku/0.1.1 \
+    crate://crates.io/indoc/0.3.6 \
+    crate://crates.io/indoc-impl/0.3.6 \
+    crate://crates.io/instant/0.1.12 \
+    crate://crates.io/js-sys/0.3.60 \
+    crate://crates.io/libc/0.2.139 \
+    crate://crates.io/link-cplusplus/1.0.8 \
+    crate://crates.io/lock_api/0.4.9 \
+    crate://crates.io/log/0.4.17 \
+    crate://crates.io/num-integer/0.1.45 \
+    crate://crates.io/num-traits/0.2.15 \
+    crate://crates.io/once_cell/1.14.0 \
+    crate://crates.io/ouroboros/0.15.5 \
+    crate://crates.io/ouroboros_macro/0.15.5 \
+    crate://crates.io/parking_lot/0.11.2 \
+    crate://crates.io/parking_lot_core/0.8.6 \
+    crate://crates.io/paste/0.1.18 \
+    crate://crates.io/paste-impl/0.1.18 \
+    crate://crates.io/pem/1.1.0 \
+    crate://crates.io/proc-macro-error/1.0.4 \
+    crate://crates.io/proc-macro-error-attr/1.0.4 \
+    crate://crates.io/proc-macro-hack/0.5.20+deprecated \
+    crate://crates.io/proc-macro2/1.0.49 \
+    crate://crates.io/pyo3/0.15.2 \
+    crate://crates.io/pyo3-build-config/0.15.2 \
+    crate://crates.io/pyo3-macros/0.15.2 \
+    crate://crates.io/pyo3-macros-backend/0.15.2 \
+    crate://crates.io/quote/1.0.23 \
+    crate://crates.io/redox_syscall/0.2.16 \
+    crate://crates.io/scopeguard/1.1.0 \
+    crate://crates.io/scratch/1.0.3 \
+    crate://crates.io/smallvec/1.10.0 \
+    crate://crates.io/syn/1.0.107 \
+    crate://crates.io/termcolor/1.1.3 \
+    crate://crates.io/unicode-ident/1.0.6 \
+    crate://crates.io/unicode-width/0.1.10 \
+    crate://crates.io/unindent/0.1.11 \
+    crate://crates.io/version_check/0.9.4 \
+    crate://crates.io/wasm-bindgen/0.2.83 \
+    crate://crates.io/wasm-bindgen-backend/0.2.83 \
+    crate://crates.io/wasm-bindgen-macro/0.2.83 \
+    crate://crates.io/wasm-bindgen-macro-support/0.2.83 \
+    crate://crates.io/wasm-bindgen-shared/0.2.83 \
+    crate://crates.io/winapi/0.3.9 \
+    crate://crates.io/winapi-i686-pc-windows-gnu/0.4.0 \
+    crate://crates.io/winapi-util/0.1.5 \
+    crate://crates.io/winapi-x86_64-pc-windows-gnu/0.4.0 \
 "
diff --git a/meta/recipes-devtools/python/python3-cryptography-vectors_38.0.4.bb b/meta/recipes-devtools/python/python3-cryptography-vectors_39.0.0.bb
similarity index 90%
rename from meta/recipes-devtools/python/python3-cryptography-vectors_38.0.4.bb
rename to meta/recipes-devtools/python/python3-cryptography-vectors_39.0.0.bb
index a36cbeb09a..6aaf6501b4 100644
--- a/meta/recipes-devtools/python/python3-cryptography-vectors_38.0.4.bb
+++ b/meta/recipes-devtools/python/python3-cryptography-vectors_39.0.0.bb
@@ -9,7 +9,7 @@ LIC_FILES_CHKSUM = "file://LICENSE;md5=8c3617db4fb6fae01f1d253ab91511e4 \
 # NOTE: Make sure to keep this recipe at the same version as python3-cryptography
 #       Upgrade both recipes at the same time
 
-SRC_URI[sha256sum] = "6ec62695bec5df810288ddceae998ae691cdb8a162808d6cbc960d3deb9a7db1"
+SRC_URI[sha256sum] = "52e59670a0820b5bbfa85f724b8aebd61385787eb8b6607f64d533969124b2a0"
 
 PYPI_PACKAGE = "cryptography_vectors"
 
diff --git a/meta/recipes-devtools/python/python3-cryptography_38.0.4.bb b/meta/recipes-devtools/python/python3-cryptography_39.0.0.bb
similarity index 95%
rename from meta/recipes-devtools/python/python3-cryptography_38.0.4.bb
rename to meta/recipes-devtools/python/python3-cryptography_39.0.0.bb
index 5d279e7db1..cca192bc84 100644
--- a/meta/recipes-devtools/python/python3-cryptography_38.0.4.bb
+++ b/meta/recipes-devtools/python/python3-cryptography_39.0.0.bb
@@ -9,7 +9,7 @@ LIC_FILES_CHKSUM = "file://LICENSE;md5=bf405a8056a6647e7d077b0e7bc36aba \
                    "
 LDSHARED += "-pthread"
 
-SRC_URI[sha256sum] = "175c1a818b87c9ac80bb7377f5520b7f31b3ef2a0004e2420319beadedb67290"
+SRC_URI[sha256sum] = "f964c7dcf7802d133e8dbd1565914fa0194f9d683d82411989889ecd701e8adf"
 
 SRC_URI += "\
     file://0002-Cargo.toml-edition-2018-2021.patch \
-- 
2.30.2


