Received: from mail-pg1-f171.google.com (mail-pg1-f171.google.com [209.85.215.171])
 by mx.groups.io with SMTP id smtpd.msgproc01-g2.4824.1793587153451460955
 for <openembedded-core@lists.openembedded.org>;
 Sun, 01 Nov 2026 18:39:13 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@konsulko.com header.s=google header.b=i2hfNp3V;
 spf=pass (domain: konsulko.com, ip: 209.85.215.171, mailfrom: tim.orling@konsulko.com)
Received: by mail-pg1-f171.google.com with SMTP id 41be03b00d2f7-ccca948203aso758460a12.3
        for <openembedded-core@lists.openembedded.org>; Sun, 01 Nov 2026 18:39:13 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=konsulko.com; s=google; t=1793587153; x=1794191953; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=qz+qX5WOMGRsxkqY6wtk/PwsNeeEXN88eiCr6W9PIEA=;
        b=i2hfNp3VwZdMJqGtnzl+pw1y2kp7YhD3oj7WW/G0NK5gCOxqcLy2ewtZEDQzndtzeU
         v3AxwPLA0dBZ/tM33cQ6EFjSsTPGIIKjjJRSNX66glpFRXgxR/Ic+sD/aMnDLxSyUeWN
         vIA6iNUrcWtLx2nY1FcdxRYjcuU36krPsgiQg=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1793587153; x=1794191953;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=qz+qX5WOMGRsxkqY6wtk/PwsNeeEXN88eiCr6W9PIEA=;
        b=GLjbMxw+uUUYPPcVeHe+2TGFOOmCYQeKFnXnSU/f3VNTELnD1sSgyMmEo6dIsZubDQ
         OMHT6jzo+Dwz4z8zSb8uX6VriWbCZJWNnFUIYuikOLzTMxPY6V5xFFCeq2qytlV5SRMf
         xkwXfB7NuJGHbp2b9/cB0/KspCevlaEHACWEYpb9gJ1X5iCuu6YHMZeHTdO2+GDuXh6Y
         05RXGwN3NlWN2eZbXnYcd2GUI99vaJR3TFDiSkfCbvdbzKExhpljycTfutfts8UifeLN
         +8DfvwiOR6aW1+NSnnmxxvUpoZmpdJa1N/6LLQDUMt+FLo7RlvkWvqE6Dl9zBrYt3H1m
         NtVQ==
X-Gm-Message-State: APuU4Z9SKXQtQMU/1kaRvKzg8z8C8L1LlbY34Ko9ECKHrZMSyn3VbDKR
	bi7keNJIMVRC3xzOKB5KCULiY4LQ7wCm885vwa/BgB+1kGhTiXNWFymCfjz2V8XhjKoASZc+qXU
	BFqLM
X-Gm-Gg: AYBFou16igcUQPdVOQt0HLJgH5bUQXZCq1WDiIYHXDcjv3AMB2qIuaFm7DQlWMTmI0H
	pTv5mfTyp/2cGIzSrVQ/5YRUtDqP1PmCGyMF8qZRcSZAjJsv1cxPDcjiv4dsMQsOOjfXYe5p7SD
	vYvlMLUMJI7Mc0vJ7ixpiNOocsTT0B1tsR/lbF94IPpU1PB1TsRqYpG+uxpLgTmkRy0ChrAhhBQ
	HoWGUoLcoWd041pVOXPXvPA+wjzAa3kY6lwZIAOP4pJRVBr8O526wqtpXd1gm988Lyy9667YGBO
	yWpxhMwu+biujeLo73sJTBCGkigClOkab7eRl/6aiXud3Tm8SHboAuGqZb+/cufOnyww4OlyRGy
	gudTtwv68DX2ujv60rZqmY197c8pXhvALQjfRKoEBJpCHA9sTUSUImHlUG7BlfIlF+KIwzEHNET
	RSNA3Za4a2gogStAMYTOgmsVtEXncxl4mVJpn4T7+YSj6UYT5KqzBfzwD8xKJWB1mNrllpjbUOH
	BmiYD34N8XFxJ4V3ZsZ3A6k4W57l5KIMpeGbxaVurYRcWP1N9FoDIliF5USbloRCC3xErczQz+7
	1yVzFExdeF9pRXeflJDGcScUxKheZErUx7FO0qt/4n6CRrXmxTkhWeKkZITiJ5WFrjhE5rOqLk3
	uFkuIlJ0oqcGnFg5i7HsB1BvqqQ==
X-Received: by 2002:a17:90a:e7c7:b0:3ac:a203:e092 with SMTP id 98e67ed59e1d1-3ae8953618amr6933679a91.1.1793587152500;
        Sun, 01 Nov 2026 18:39:12 -0800 (PST)
Return-Path: <tim.orling@konsulko.com>
Received: from thetis.home.local ([2606:c800:6024:2000:9eb8:9e38:131:9f02])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-3ae6e7d429fsm16181063a91.2.2026.11.01.18.39.11
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 01 Nov 2026 18:39:12 -0800 (PST)
From: tim.orling@konsulko.com
To: openembedded-core@lists.openembedded.org
Cc: Tim Orling <tim.orling@konsulko.com>
Subject: [PATCH] python3-maturin: upgrade 1.15.0 -> 1.16.0
Date: Sun,  1 Nov 2026 18:39:06 -0800
Message-ID: <20261102023906.1382528-1-tim.orling@konsulko.com>
X-Mailer: git-send-email 2.47.3
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by lin-tor-korg-lkml-alma10-1 with HTTPS for <openembedded-core@lists.openembedded.org>; Mon, 02 Nov 2026 02:39:21 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/249174
Content-Type: text/plain; charset="utf-8"

From: Tim Orling <tim.orling@konsulko.com>

1.16.0 updates rustix to 1.1.5, so drop the backported Cargo.lock patch,
and raises the maximum supported Python to 3.15. It also includes a
rustls update for RUSTSEC-2026-0285 and Python 3.15 stable ABI fixes.

Drop SECTION and S, which pypi.bbclass already sets to the same values.

https://github.com/PyO3/maturin/blob/v1.16.0/Changelog.md
https://github.com/PyO3/maturin/compare/v1.15.0...v1.16.0

Tested by building python3-maturin for target, native and nativesdk, and
with core-image-ptest-python3-rpds-py and
core-image-ptest-python3-cryptography on qemux86-64.

AI-Generated: Uses Claude Code (Claude Opus 5.5)
Signed-off-by: Tim Orling <tim.orling@konsulko.com>
---
 .../python/python3-maturin-crates.inc         |  64 ++++----
 ...01-Cargo.lock-Update-rustix-to-1.1.5.patch | 144 ------------------
 ...in_1.15.0.bb => python3-maturin_1.16.0.bb} |   7 +-
 3 files changed, 35 insertions(+), 180 deletions(-)
 delete mode 100644 meta/recipes-devtools/python/python3-maturin/0001-Cargo.lock-Update-rustix-to-1.1.5.patch
 rename meta/recipes-devtools/python/{python3-maturin_1.15.0.bb => python3-maturin_1.16.0.bb} (82%)

diff --git a/meta/recipes-devtools/python/python3-maturin-crates.inc b/meta/recipes-devtools/python/python3-maturin-crates.inc
index 68507ad754..a70632bc75 100644
--- a/meta/recipes-devtools/python/python3-maturin-crates.inc
+++ b/meta/recipes-devtools/python/python3-maturin-crates.inc
@@ -38,7 +38,7 @@ SRC_URI += " \
     crate://crates.io/cargo-platform/0.1.9 \
     crate://crates.io/cargo-platform/0.3.2 \
     crate://crates.io/cargo-xwin/0.23.1 \
-    crate://crates.io/cargo-zigbuild/0.23.1 \
+    crate://crates.io/cargo-zigbuild/0.24.0 \
     crate://crates.io/cargo_metadata/0.18.1 \
     crate://crates.io/cargo_metadata/0.23.1 \
     crate://crates.io/cbindgen/0.29.2 \
@@ -82,7 +82,7 @@ SRC_URI += " \
     crate://crates.io/cyclonedx-bom/0.8.1 \
     crate://crates.io/cyclonedx-bom-macros/0.1.0 \
     crate://crates.io/data-encoding/2.10.0 \
-    crate://crates.io/der/0.8.0 \
+    crate://crates.io/der/0.8.3 \
     crate://crates.io/deranged/0.5.8 \
     crate://crates.io/dialoguer/0.12.0 \
     crate://crates.io/diff/0.1.13 \
@@ -179,10 +179,10 @@ SRC_URI += " \
     crate://crates.io/litrs/1.0.0 \
     crate://crates.io/lock_api/0.4.14 \
     crate://crates.io/log/0.4.29 \
-    crate://crates.io/lzma-rust2/0.16.2 \
+    crate://crates.io/lzma-rust2/0.23.0 \
     crate://crates.io/lzma-sys/0.1.20 \
     crate://crates.io/lzxd/0.2.6 \
-    crate://crates.io/mailparse/0.16.1 \
+    crate://crates.io/mailparse/0.18.0 \
     crate://crates.io/matchers/0.2.0 \
     crate://crates.io/memchr/2.8.0 \
     crate://crates.io/memmap2/0.9.11 \
@@ -194,7 +194,7 @@ SRC_URI += " \
     crate://crates.io/miniz_oxide/0.8.9 \
     crate://crates.io/msi/0.10.0 \
     crate://crates.io/native-tls/0.2.18 \
-    crate://crates.io/nix/0.31.2 \
+    crate://crates.io/nix/0.31.3 \
     crate://crates.io/nom/8.0.0 \
     crate://crates.io/normalize-line-endings/0.3.0 \
     crate://crates.io/normpath/1.5.0 \
@@ -238,9 +238,9 @@ SRC_URI += " \
     crate://crates.io/proc-macro2/1.0.106 \
     crate://crates.io/psm/0.1.30 \
     crate://crates.io/purl/0.1.6 \
-    crate://crates.io/pyo3-introspection/0.29.0 \
+    crate://crates.io/pyo3-introspection/0.30.1 \
     crate://crates.io/pyproject-toml/0.13.7 \
-    crate://crates.io/python-pkginfo/0.6.8 \
+    crate://crates.io/python-pkginfo/0.7.0 \
     crate://crates.io/quote/1.0.45 \
     crate://crates.io/quoted_printable/0.5.2 \
     crate://crates.io/r-efi/5.3.0 \
@@ -269,12 +269,12 @@ SRC_URI += " \
     crate://crates.io/rustc_version/0.4.1 \
     crate://crates.io/rustflags/0.1.7 \
     crate://crates.io/rustix/1.1.5 \
-    crate://crates.io/rustls/0.23.38 \
+    crate://crates.io/rustls/0.23.46 \
     crate://crates.io/rustls-native-certs/0.8.3 \
     crate://crates.io/rustls-pki-types/1.14.0 \
     crate://crates.io/rustls-platform-verifier/0.6.2 \
     crate://crates.io/rustls-platform-verifier-android/0.1.1 \
-    crate://crates.io/rustls-webpki/0.103.13 \
+    crate://crates.io/rustls-webpki/0.103.16 \
     crate://crates.io/rustversion/1.0.22 \
     crate://crates.io/ruzstd/0.8.2 \
     crate://crates.io/same-file/1.0.6 \
@@ -357,6 +357,7 @@ SRC_URI += " \
     crate://crates.io/trycmd/1.2.0 \
     crate://crates.io/twox-hash/2.1.2 \
     crate://crates.io/typed-path/0.12.3 \
+    crate://crates.io/typed-path/0.13.0 \
     crate://crates.io/typenum/1.20.0 \
     crate://crates.io/unicase/2.9.0 \
     crate://crates.io/unicode-ident/1.0.24 \
@@ -394,8 +395,8 @@ SRC_URI += " \
     crate://crates.io/wasm-metadata/0.244.0 \
     crate://crates.io/wasmparser/0.244.0 \
     crate://crates.io/web-time/1.1.0 \
-    crate://crates.io/webpki-root-certs/1.0.7 \
-    crate://crates.io/webpki-roots/1.0.7 \
+    crate://crates.io/webpki-root-certs/1.0.10 \
+    crate://crates.io/webpki-roots/1.0.10 \
     crate://crates.io/which/8.0.2 \
     crate://crates.io/wild/2.2.1 \
     crate://crates.io/winapi/0.3.9 \
@@ -467,13 +468,14 @@ SRC_URI += " \
     crate://crates.io/zerotrie/0.2.4 \
     crate://crates.io/zerovec/0.11.6 \
     crate://crates.io/zerovec-derive/0.11.3 \
-    crate://crates.io/zip/8.5.1 \
+    crate://crates.io/zip/8.6.0 \
+    crate://crates.io/zip/9.1.3 \
     crate://crates.io/zlib-rs/0.6.3 \
     crate://crates.io/zmij/1.0.21 \
     crate://crates.io/zopfli/0.8.3 \
-    crate://crates.io/zstd/0.13.3 \
-    crate://crates.io/zstd-safe/7.2.4 \
-    crate://crates.io/zstd-sys/2.0.16+zstd.1.5.7 \
+    crate://crates.io/zstd/0.14.3 \
+    crate://crates.io/zstd-safe/8.2.0 \
+    crate://crates.io/zstd-sys/2.1.2+zstd.1.5.7 \
 "
 
 SRC_URI[adler2-2.0.1.sha256sum] = "320119579fcad9c21884f5c4861d16174d0e06250625266f50fe6898340abefa"
@@ -512,7 +514,7 @@ SRC_URI[cargo-options-0.8.1.sha256sum] = "b916a16b2a4b0ce91d46e42c51b7fc42e75422
 SRC_URI[cargo-platform-0.1.9.sha256sum] = "e35af189006b9c0f00a064685c727031e3ed2d8020f7ba284d78cc2671bd36ea"
 SRC_URI[cargo-platform-0.3.2.sha256sum] = "87a0c0e6148f11f01f32650a2ea02d532b2ad4e81d8bd41e6e565b5adc5e6082"
 SRC_URI[cargo-xwin-0.23.1.sha256sum] = "08fe6fef95319ecc03c40127b2af811522b7918b05502ebb35b2972208993a57"
-SRC_URI[cargo-zigbuild-0.23.1.sha256sum] = "9840ba8824cf43c7efb04a268090199072ad3ca8c65c386132909aee1bd4d4bf"
+SRC_URI[cargo-zigbuild-0.24.0.sha256sum] = "cfd0dbe23ae1b71e74014ba62e3262d6b2fdf76251828644823bdfd21ce5d84e"
 SRC_URI[cargo_metadata-0.18.1.sha256sum] = "2d886547e41f740c616ae73108f6eb70afe6d940c7bc697cb30f13daec073037"
 SRC_URI[cargo_metadata-0.23.1.sha256sum] = "ef987d17b0a113becdd19d3d0022d04d7ef41f9efe4f3fb63ac44ba61df3ade9"
 SRC_URI[cbindgen-0.29.2.sha256sum] = "befbfd072a8e81c02f8c507aefce431fe5e7d051f83d48a23ffc9b9fe5a11799"
@@ -556,7 +558,7 @@ SRC_URI[crypto-common-0.2.1.sha256sum] = "77727bb15fa921304124b128af125e7e3b9682
 SRC_URI[cyclonedx-bom-0.8.1.sha256sum] = "3132b69ba8c13808bd2fa5748ac5b9816eb4f4e1f0bff6b7f9254a5940dcdeef"
 SRC_URI[cyclonedx-bom-macros-0.1.0.sha256sum] = "c50341f21df64b412b4f917e34b7aa786c092d64f3f905f478cb76950c7e980c"
 SRC_URI[data-encoding-2.10.0.sha256sum] = "d7a1e2f27636f116493b8b860f5546edb47c8d8f8ea73e1d2a20be88e28d1fea"
-SRC_URI[der-0.8.0.sha256sum] = "71fd89660b2dc699704064e59e9dba0147b903e85319429e131620d022be411b"
+SRC_URI[der-0.8.3.sha256sum] = "6a996a108feb8b427a6e12fcf6af4aa83409b79d72c15337d7741368131ee004"
 SRC_URI[deranged-0.5.8.sha256sum] = "7cd812cc2bc1d69d4764bd80df88b4317eaef9e773c75226407d9bc0876b211c"
 SRC_URI[dialoguer-0.12.0.sha256sum] = "25f104b501bf2364e78d0d3974cbc774f738f5865306ed128e1e0d7499c0ad96"
 SRC_URI[diff-0.1.13.sha256sum] = "56254986775e3233ffa9c4d7d3faaf6d36a2c09d30b20687e9f88bc8bafc16c8"
@@ -653,10 +655,10 @@ SRC_URI[litemap-0.8.2.sha256sum] = "92daf443525c4cce67b150400bc2316076100ce0b368
 SRC_URI[litrs-1.0.0.sha256sum] = "11d3d7f243d5c5a8b9bb5d6dd2b1602c0cb0b9db1621bafc7ed66e35ff9fe092"
 SRC_URI[lock_api-0.4.14.sha256sum] = "224399e74b87b5f3557511d98dff8b14089b3dadafcab6bb93eab67d3aace965"
 SRC_URI[log-0.4.29.sha256sum] = "5e5032e24019045c762d3c0f28f5b6b8bbf38563a65908389bf7978758920897"
-SRC_URI[lzma-rust2-0.16.2.sha256sum] = "47bb1e988e6fb779cf720ad431242d3f03167c1b3f2b1aae7f1a94b2495b36ae"
+SRC_URI[lzma-rust2-0.23.0.sha256sum] = "f1c46f3fcd2e888afdb01a07efc071cb21300e07c68d32c3e8b01b5c8cb1fcaa"
 SRC_URI[lzma-sys-0.1.20.sha256sum] = "5fda04ab3764e6cde78b9974eec4f779acaba7c4e84b36eca3cf77c581b85d27"
 SRC_URI[lzxd-0.2.6.sha256sum] = "7b29dffab797218e12e4df08ef5d15ab9efca2504038b1b32b9b32fc844b39c9"
-SRC_URI[mailparse-0.16.1.sha256sum] = "60819a97ddcb831a5614eb3b0174f3620e793e97e09195a395bfa948fd68ed2f"
+SRC_URI[mailparse-0.18.0.sha256sum] = "068d4f5d1083883b9e626051dc5bdaa321f5be01093e61ade3ee3ab44dafeadd"
 SRC_URI[matchers-0.2.0.sha256sum] = "d1525a2a28c7f4fa0fc98bb91ae755d1e2d1505079e05539e35bc876b5d65ae9"
 SRC_URI[memchr-2.8.0.sha256sum] = "f8ca58f447f06ed17d5fc4043ce1b10dd205e060fb3ce5b979b8ed8e59ff3f79"
 SRC_URI[memmap2-0.9.11.sha256sum] = "d1219ed1b7f229ee7104d281dd01d6802fe28bb6e95d292942c4daacdeb798c0"
@@ -668,7 +670,7 @@ SRC_URI[minijinja-2.19.0.sha256sum] = "805bfd7352166bae857ee569628b52bcd85a1cecf
 SRC_URI[miniz_oxide-0.8.9.sha256sum] = "1fa76a2c86f704bdb222d66965fb3d63269ce38518b83cb0575fca855ebb6316"
 SRC_URI[msi-0.10.0.sha256sum] = "b0325f8473ef1f5c38ee42345e2cd1678299cbbfa169d1776654a2a682867420"
 SRC_URI[native-tls-0.2.18.sha256sum] = "465500e14ea162429d264d44189adc38b199b62b1c21eea9f69e4b73cb03bbf2"
-SRC_URI[nix-0.31.2.sha256sum] = "5d6d0705320c1e6ba1d912b5e37cf18071b6c2e9b7fa8215a1e8a7651966f5d3"
+SRC_URI[nix-0.31.3.sha256sum] = "cf20d2fde8ff38632c426f1165ed7436270b44f199fc55284c38276f9db47c3d"
 SRC_URI[nom-8.0.0.sha256sum] = "df9761775871bdef83bee530e60050f7e54b1105350d6884eb0fb4f46c2f9405"
 SRC_URI[normalize-line-endings-0.3.0.sha256sum] = "61807f77802ff30975e01f4f071c8ba10c022052f98b3294119f3e615d13e5be"
 SRC_URI[normpath-1.5.0.sha256sum] = "bf23ab2b905654b4cb177e30b629937b3868311d4e1cba859f899c041046e69b"
@@ -712,9 +714,9 @@ SRC_URI[proc-macro-crate-3.5.0.sha256sum] = "e67ba7e9b2b56446f1d419b1d807906278f
 SRC_URI[proc-macro2-1.0.106.sha256sum] = "8fd00f0bb2e90d81d1044c2b32617f68fcb9fa3bb7640c23e9c748e53fb30934"
 SRC_URI[psm-0.1.30.sha256sum] = "3852766467df634d74f0b2d7819bf8dc483a0eb2e3b0f50f756f9cfe8b0d18d8"
 SRC_URI[purl-0.1.6.sha256sum] = "60ebe4262ae91ddd28c8721111a0a6e9e58860e211fc92116c4bb85c98fd96ad"
-SRC_URI[pyo3-introspection-0.29.0.sha256sum] = "7775fcc875acdce3872dcb91a4b7bd155ffba6e0ea8be88b8caab7d0b34539a6"
+SRC_URI[pyo3-introspection-0.30.1.sha256sum] = "3b2ac30f128e6ab4ca1c464d6eabd30c84c7adc5955c3bb2eb7d203ea24ebd18"
 SRC_URI[pyproject-toml-0.13.7.sha256sum] = "f6d755483ad14b49e76713b52285235461a5b4f73f17612353e11a5de36a5fd2"
-SRC_URI[python-pkginfo-0.6.8.sha256sum] = "229fe47647d6602b9b0934b21fab8aece1c5a5aeb0a934196a14355fec656623"
+SRC_URI[python-pkginfo-0.7.0.sha256sum] = "ad0f01c29e3af9f28f5cfee9bcd599d8031b8cba40eced8a9ae7aa2d2e5b735c"
 SRC_URI[quote-1.0.45.sha256sum] = "41f2619966050689382d2b44f664f4bc593e129785a36d6ee376ddf37259b924"
 SRC_URI[quoted_printable-0.5.2.sha256sum] = "478e0585659a122aa407eb7e3c0e1fa51b1d8a870038bd29f0cf4a8551eea972"
 SRC_URI[r-efi-5.3.0.sha256sum] = "69cdb34c158ceb288df11e18b4bd39de994f6657d83847bdffdbd7f346754b0f"
@@ -743,12 +745,12 @@ SRC_URI[rustc-hash-2.1.2.sha256sum] = "94300abf3f1ae2e2b8ffb7b58043de3d399c73fa6
 SRC_URI[rustc_version-0.4.1.sha256sum] = "cfcb3a22ef46e85b45de6ee7e79d063319ebb6594faafcf1c225ea92ab6e9b92"
 SRC_URI[rustflags-0.1.7.sha256sum] = "a39e0e9135d7a7208ee80aa4e3e4b88f0f5ad7be92153ed70686c38a03db2e63"
 SRC_URI[rustix-1.1.5.sha256sum] = "891efababe418670775f199f0d233d84843c227a0949a883ce15b37c78d6629d"
-SRC_URI[rustls-0.23.38.sha256sum] = "69f9466fb2c14ea04357e91413efb882e2a6d4a406e625449bc0a5d360d53a21"
+SRC_URI[rustls-0.23.46.sha256sum] = "48e13bd8c0e9365c43cfa5c9e8f9ad49d3c8444926c9aac819e0e4dc503c8fdf"
 SRC_URI[rustls-native-certs-0.8.3.sha256sum] = "612460d5f7bea540c490b2b6395d8e34a953e52b491accd6c86c8164c5932a63"
 SRC_URI[rustls-pki-types-1.14.0.sha256sum] = "be040f8b0a225e40375822a563fa9524378b9d63112f53e19ffff34df5d33fdd"
 SRC_URI[rustls-platform-verifier-0.6.2.sha256sum] = "1d99feebc72bae7ab76ba994bb5e121b8d83d910ca40b36e0921f53becc41784"
 SRC_URI[rustls-platform-verifier-android-0.1.1.sha256sum] = "f87165f0995f63a9fbeea62b64d10b4d9d8e78ec6d7d51fb2125fda7bb36788f"
-SRC_URI[rustls-webpki-0.103.13.sha256sum] = "61c429a8649f110dddef65e2a5ad240f747e85f7758a6bccc7e5777bd33f756e"
+SRC_URI[rustls-webpki-0.103.16.sha256sum] = "4443b1b6d39d7c663139942cc4558262562d2c84123bb6282ef177009ca8b281"
 SRC_URI[rustversion-1.0.22.sha256sum] = "b39cdef0fa800fc44525c84ccb54a029961a8215f9619753635a9c0d2538d46d"
 SRC_URI[ruzstd-0.8.2.sha256sum] = "e5ff0cc5e135c8870a775d3320910cd9b564ec036b4dc0b8741629020be63f01"
 SRC_URI[same-file-1.0.6.sha256sum] = "93fc1dc3aaa9bfed95e02e6eadabb4baf7e3078b0bd1b4d7b6b0b68378900502"
@@ -831,6 +833,7 @@ SRC_URI[tracing-subscriber-0.3.23.sha256sum] = "cb7f578e5945fb242538965c2d0b0441
 SRC_URI[trycmd-1.2.0.sha256sum] = "218889993f76bda9b2ef57c12c3cab0eef4fd54ec7b36d1704849867f69e7bb4"
 SRC_URI[twox-hash-2.1.2.sha256sum] = "9ea3136b675547379c4bd395ca6b938e5ad3c3d20fad76e7fe85f9e0d011419c"
 SRC_URI[typed-path-0.12.3.sha256sum] = "8e28f89b80c87b8fb0cf04ab448d5dd0dd0ade2f8891bae878de66a75a28600e"
+SRC_URI[typed-path-0.13.0.sha256sum] = "9ce898823d8cd0f028662d2f349694b1af0a5cc9be83f1d213a00d3147445e1e"
 SRC_URI[typenum-1.20.0.sha256sum] = "40ce102ab67701b8526c123c1bab5cbe42d7040ccfd0f64af1a385808d2f43de"
 SRC_URI[unicase-2.9.0.sha256sum] = "dbc4bc3a9f746d862c45cb89d705aa10f187bb96c76001afab07a0d35ce60142"
 SRC_URI[unicode-ident-1.0.24.sha256sum] = "e6e4313cd5fcd3dad5cafa179702e2b244f760991f45397d14d4ebf38247da75"
@@ -868,8 +871,8 @@ SRC_URI[wasm-encoder-0.244.0.sha256sum] = "990065f2fe63003fe337b932cfb5e3b80e0b4
 SRC_URI[wasm-metadata-0.244.0.sha256sum] = "bb0e353e6a2fbdc176932bbaab493762eb1255a7900fe0fea1a2f96c296cc909"
 SRC_URI[wasmparser-0.244.0.sha256sum] = "47b807c72e1bac69382b3a6fb3dbe8ea4c0ed87ff5629b8685ae6b9a611028fe"
 SRC_URI[web-time-1.1.0.sha256sum] = "5a6580f308b1fad9207618087a65c04e7a10bc77e02c8e84e9b00dd4b12fa0bb"
-SRC_URI[webpki-root-certs-1.0.7.sha256sum] = "f31141ce3fc3e300ae89b78c0dd67f9708061d1d2eda54b8209346fd6be9a92c"
-SRC_URI[webpki-roots-1.0.7.sha256sum] = "52f5ee44c96cf55f1b349600768e3ece3a8f26010c05265ab73f945bb1a2eb9d"
+SRC_URI[webpki-root-certs-1.0.10.sha256sum] = "58ec80e73fd8baf57bf0d9615554c75348bda990d6d5bbeab964dd068319fecb"
+SRC_URI[webpki-roots-1.0.10.sha256sum] = "1c1c8e20c8a38fc7d65abfe74eb7280e4aa667e8eec8bc84996d2874810748d9"
 SRC_URI[which-8.0.2.sha256sum] = "81995fafaaaf6ae47a7d0cc83c67caf92aeb7e5331650ae6ff856f7c0c60c459"
 SRC_URI[wild-2.2.1.sha256sum] = "a3131afc8c575281e1e80f36ed6a092aa502c08b18ed7524e86fbbb12bb410e1"
 SRC_URI[winapi-0.3.9.sha256sum] = "5c839a674fcd7a98952e593242ea400abe93992746761e38641405d28b00f419"
@@ -941,10 +944,11 @@ SRC_URI[zeroize-1.8.2.sha256sum] = "b97154e67e32c85465826e8bcc1c59429aaaf107c1e4
 SRC_URI[zerotrie-0.2.4.sha256sum] = "0f9152d31db0792fa83f70fb2f83148effb5c1f5b8c7686c3459e361d9bc20bf"
 SRC_URI[zerovec-0.11.6.sha256sum] = "90f911cbc359ab6af17377d242225f4d75119aec87ea711a880987b18cd7b239"
 SRC_URI[zerovec-derive-0.11.3.sha256sum] = "625dc425cab0dca6dc3c3319506e6593dcb08a9f387ea3b284dbd52a92c40555"
-SRC_URI[zip-8.5.1.sha256sum] = "dcab981e19633ebcf0b001ddd37dd802996098bc1864f90b7c5d970ce76c1d59"
+SRC_URI[zip-8.6.0.sha256sum] = "2d04a6b5381502aa6087c94c669499eb1602eb9c5e8198e534de571f7154809b"
+SRC_URI[zip-9.1.3.sha256sum] = "1156b39d142a34b999c2310a50455e0cb3760bf7efad0122f796d813bee26ccb"
 SRC_URI[zlib-rs-0.6.3.sha256sum] = "3be3d40e40a133f9c916ee3f9f4fa2d9d63435b5fbe1bfc6d9dae0aa0ada1513"
 SRC_URI[zmij-1.0.21.sha256sum] = "b8848ee67ecc8aedbaf3e4122217aff892639231befc6a1b58d29fff4c2cabaa"
 SRC_URI[zopfli-0.8.3.sha256sum] = "f05cd8797d63865425ff89b5c4a48804f35ba0ce8d125800027ad6017d2b5249"
-SRC_URI[zstd-0.13.3.sha256sum] = "e91ee311a569c327171651566e07972200e76fcfe2242a4fa446149a3881c08a"
-SRC_URI[zstd-safe-7.2.4.sha256sum] = "8f49c4d5f0abb602a93fb8736af2a4f4dd9512e36f7f570d66e65ff867ed3b9d"
-SRC_URI[zstd-sys-2.0.16+zstd.1.5.7.sha256sum] = "91e19ebc2adc8f83e43039e79776e3fda8ca919132d68a1fed6a5faca2683748"
+SRC_URI[zstd-0.14.3.sha256sum] = "db3ae9bf90af6e40197bef767eeefc46ad6397420fe873830bd85e5fbbfb3c70"
+SRC_URI[zstd-safe-8.2.0.sha256sum] = "ded520f16b29e1a9b771c722221b2b0a0398c2316d9bb3c42b458a5414d7434b"
+SRC_URI[zstd-sys-2.1.2+zstd.1.5.7.sha256sum] = "481ada9c543b2323cbb7bbdbb5249177fbf0188ed959ed2c15e4b22421c84ed3"
diff --git a/meta/recipes-devtools/python/python3-maturin/0001-Cargo.lock-Update-rustix-to-1.1.5.patch b/meta/recipes-devtools/python/python3-maturin/0001-Cargo.lock-Update-rustix-to-1.1.5.patch
deleted file mode 100644
index 675cc0c7bb..0000000000
--- a/meta/recipes-devtools/python/python3-maturin/0001-Cargo.lock-Update-rustix-to-1.1.5.patch
+++ /dev/null
@@ -1,144 +0,0 @@
-From: Khem Raj <khem.raj@oss.qualcomm.com>
-Date: Thu, 22 Oct 2026 17:00:00 -0700
-Subject: [PATCH] Cargo.lock: Update rustix to 1.1.5
-
-rustix 1.1.4 glob-imports the STATX_* constants from linux-raw-sys for
-non-glibc Linux targets, assuming libc does not define them. libc
-defines them for musl with its musl 1.2 layouts, which libc 0.2.190
-enables by default on riscv32 and earlier versions with the
-libc_unstable_musl_v1_2_3 cfg, so the names become ambiguous:
-
-  error[E0659]: `STATX_MODE` is ambiguous
-    --> rustix-1.1.4/src/fs/statx.rs:78:25
-
-rustix 1.1.5 imports them explicitly instead [1]. Update it with
-'cargo update -p rustix'.
-
-[1] https://github.com/bytecodealliance/rustix/pull/1676
-
-Upstream-Status: Submitted [https://github.com/PyO3/maturin/pull/3344]
-Signed-off-by: Khem Raj <khem.raj@oss.qualcomm.com>
----
- Cargo.lock | 28 ++++++++++++++--------------
- 1 file changed, 14 insertions(+), 14 deletions(-)
-
---- a/Cargo.lock
-+++ b/Cargo.lock
-@@ -59,7 +59,7 @@ version = "1.1.5"
- source = "registry+https://github.com/rust-lang/crates.io-index"
- checksum = "40c48f72fd53cd289104fc64099abca73db4166ad86ea0b4341abe65af83dadc"
- dependencies = [
-- "windows-sys 0.61.2",
-+ "windows-sys 0.60.2",
- ]
- 
- [[package]]
-@@ -70,7 +70,7 @@ checksum = "291e6a250ff86cd4a820112fb8898808a366d8f9f58ce16d1f538353ad55747d"
- dependencies = [
-  "anstyle",
-  "once_cell_polyfill",
-- "windows-sys 0.61.2",
-+ "windows-sys 0.60.2",
- ]
- 
- [[package]]
-@@ -879,7 +879,7 @@ dependencies = [
-  "libc",
-  "option-ext",
-  "redox_users",
-- "windows-sys 0.61.2",
-+ "windows-sys 0.59.0",
- ]
- 
- [[package]]
-@@ -967,7 +967,7 @@ source = "registry+https://github.com/rust-lang/crates.io-index"
- checksum = "39cab71617ae0d63f51a36d69f866391735b51691dbda63cf6f96d042b63efeb"
- dependencies = [
-  "libc",
-- "windows-sys 0.61.2",
-+ "windows-sys 0.52.0",
- ]
- 
- [[package]]
-@@ -1478,7 +1478,7 @@ checksum = "3640c1c38b8e4e43584d8df18be5fc6b0aa314ce6ebf51b53313d4306cca8e46"
- dependencies = [
-  "hermit-abi",
-  "libc",
-- "windows-sys 0.61.2",
-+ "windows-sys 0.52.0",
- ]
- 
- [[package]]
-@@ -1961,7 +1961,7 @@ version = "0.50.3"
- source = "registry+https://github.com/rust-lang/crates.io-index"
- checksum = "7957b9740744892f114936ab4a57b3f487491bbeafaf8083688b16841a4240e5"
- dependencies = [
-- "windows-sys 0.61.2",
-+ "windows-sys 0.59.0",
- ]
- 
- [[package]]
-@@ -2079,7 +2079,7 @@ source = "registry+https://github.com/rust-lang/crates.io-index"
- checksum = "7d8fae84b431384b68627d0f9b3b1245fcf9f46f6c0e3dc902e9dce64edd1967"
- dependencies = [
-  "libc",
-- "windows-sys 0.61.2",
-+ "windows-sys 0.45.0",
- ]
- 
- [[package]]
-@@ -2629,15 +2629,15 @@ checksum = "a39e0e9135d7a7208ee80aa4e3e4b88f0f5ad7be92153ed70686c38a03db2e63"
- 
- [[package]]
- name = "rustix"
--version = "1.1.4"
-+version = "1.1.5"
- source = "registry+https://github.com/rust-lang/crates.io-index"
--checksum = "b6fe4565b9518b83ef4f91bb47ce29620ca828bd32cb7e408f0062e9930ba190"
-+checksum = "891efababe418670775f199f0d233d84843c227a0949a883ce15b37c78d6629d"
- dependencies = [
-  "bitflags",
-  "errno",
-  "libc",
-  "linux-raw-sys",
-- "windows-sys 0.61.2",
-+ "windows-sys 0.52.0",
- ]
- 
- [[package]]
-@@ -2694,7 +2694,7 @@ dependencies = [
-  "security-framework 3.7.0",
-  "security-framework-sys",
-  "webpki-root-certs",
-- "windows-sys 0.61.2",
-+ "windows-sys 0.52.0",
- ]
- 
- [[package]]
-@@ -3185,7 +3185,7 @@ dependencies = [
-  "getrandom 0.4.2",
-  "once_cell",
-  "rustix",
-- "windows-sys 0.61.2",
-+ "windows-sys 0.52.0",
- ]
- 
- [[package]]
-@@ -3204,7 +3204,7 @@ source = "registry+https://github.com/rust-lang/crates.io-index"
- checksum = "230a1b821ccbd75b185820a1f1ff7b14d21da1e442e22c0863ea5f08771a8874"
- dependencies = [
-  "rustix",
-- "windows-sys 0.61.2",
-+ "windows-sys 0.59.0",
- ]
- 
- [[package]]
-@@ -3921,7 +3921,7 @@ version = "0.1.11"
- source = "registry+https://github.com/rust-lang/crates.io-index"
- checksum = "c2a7b1c03c876122aa43f3020e6c3c3ee5c05081c9a00739faf7503aeba10d22"
- dependencies = [
-- "windows-sys 0.61.2",
-+ "windows-sys 0.52.0",
- ]
- 
- [[package]]
diff --git a/meta/recipes-devtools/python/python3-maturin_1.15.0.bb b/meta/recipes-devtools/python/python3-maturin_1.16.0.bb
similarity index 82%
rename from meta/recipes-devtools/python/python3-maturin_1.15.0.bb
rename to meta/recipes-devtools/python/python3-maturin_1.16.0.bb
index a29e29bda9..b212a036ef 100644
--- a/meta/recipes-devtools/python/python3-maturin_1.15.0.bb
+++ b/meta/recipes-devtools/python/python3-maturin_1.16.0.bb
@@ -1,15 +1,10 @@
 SUMMARY = "Build and publish crates with pyo3, rust-cpython, cffi bindings and rust binaries as python packages"
 HOMEPAGE = "https://github.com/pyo3/maturin"
-SECTION = "devel/python"
 LICENSE = "Apache-2.0 OR MIT"
 LIC_FILES_CHKSUM = "file://license-apache;md5=1836efb2eb779966696f473ee8540542 \
                     file://license-mit;md5=85fd3b67069cff784d98ebfc7d5c0797"
 
-SRC_URI += "file://0001-Cargo.lock-Update-rustix-to-1.1.5.patch"
-
-SRC_URI[sha256sum] = "94b26cc8e8aba61a5f2099715fe640e18c5f678e9a500408b38761263954228a"
-
-S = "${UNPACKDIR}/maturin-${PV}"
+SRC_URI[sha256sum] = "13e69ca12542999d8c5467131de72a49bb76e4c284b9a45c5783df7c0fcb3a8a"
 
 CFLAGS += "-ffile-prefix-map=${CARGO_HOME}=${TARGET_DBGSRC_DIR}/cargo_home"
 
-- 
2.47.3

