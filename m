Return-Path: <alex.kanavin@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 279A3C433F5
	for <webhook@archiver.kernel.org>; Wed, 10 Nov 2021 19:39:48 +0000 (UTC)
Received: from mail-wr1-f54.google.com (mail-wr1-f54.google.com
 [209.85.221.54])
 by mx.groups.io with SMTP id smtpd.web12.331.1636573186962216501
 for <openembedded-core@lists.openembedded.org>;
 Wed, 10 Nov 2021 11:39:47 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20210112 header.b=WrEoNbW0;
 spf=pass (domain: gmail.com, ip: 209.85.221.54,
 mailfrom: alex.kanavin@gmail.com)
Received: by mail-wr1-f54.google.com with SMTP id w29so5861022wra.12
        for <openembedded-core@lists.openembedded.org>;
 Wed, 10 Nov 2021 11:39:46 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:content-transfer-encoding;
        bh=zwSqOfIYfjz30SqvYtKUzr7hBMBHLAv18c+7NEyIwY8=;
        b=WrEoNbW0BWd2a+u7tPErqmFU79bxu0ZCJ5/pmzciJW83WbRSD80xjXNuT6dZlO5r4Q
         PxyaShNEuyXf/fx3RCdD8zCucDKNj4qwaMLMX91pvUNcYhSvitGYvzdefkts3/7aMLVp
         tq/dJqNa/InuyeXa3a0hQjS1jGN6iI1CKp/+E+FRcv6TzVb7kppbytG1naHFZwcFMQ4t
         dlD+lAYc6OH4c+LBXEM50BgGET5ilTzY9SlCbAkevWqV1eE/2mfs93+r3u+bQa5/MAxg
         22aRCf2yI/1fmF4NCGR5dreknHubTIDrEFcN/us+QqtTstdXf0fNy/ODDdQfkAX7eoo3
         MBxg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=zwSqOfIYfjz30SqvYtKUzr7hBMBHLAv18c+7NEyIwY8=;
        b=D76DqL/YvohsWuXRbQKHy8PuG0t1bSNVeqHurZpWoVZr2qXoToh730BFtiHK4m8Obj
         e0AzAotErlGHhZ/2ekB6zQTrX1kqRYKZLTplEljabsgWyPx1s1144Z3VcutmetHW+hnl
         YzHnLr6WhQ/4kAKgpA6b2eJPUOZh+SvtPiuei7FscgCsBTR9eq8mQa3frwmgDXOXgBCd
         MXQr3N5RYEhf2RBM572NQP6qQxMqQr0ynG70/ItavRirPk1lwiSLjwQYOvtnHr2Na7eI
         G0mOP+7JhTJh6kEuNUdBOSdDMc6uQROFh3wl1YhvihSbpwCczivxpCxoRRcZs2xMOX8Z
         CucA==
X-Gm-Message-State: AOAM533nrdQeVo4BHLt1XgYfEWI7fxe0ojTON6K/lEvgz0BAYm3801Hr
	rfS0k1zl9enF2BjgzM3lT9tIVuCg85s=
X-Google-Smtp-Source: 
 ABdhPJzvfDH+NbtVgciGAMN85s0F3BHAD45B9LNAUYlye0zCl5CB5S1n2vHHNciM8zWcKupgUUiSYA==
X-Received: by 2002:a05:6000:2c2:: with SMTP id
 o2mr1885788wry.360.1636573185386;
        Wed, 10 Nov 2021 11:39:45 -0800 (PST)
Received: from nereus.lab.linutronix.de. (b2b-109-90-143-203.unitymedia.biz.
 [109.90.143.203])
        by smtp.gmail.com with ESMTPSA id
 q18sm6865124wmc.7.2021.11.10.11.39.44
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 10 Nov 2021 11:39:45 -0800 (PST)
From: Alexander Kanavin <alex.kanavin@gmail.com>
X-Google-Original-From: Alexander Kanavin <alex@linutronix.de>
To: openembedded-core@lists.openembedded.org
Cc: Alexander Kanavin <alex@linutronix.de>,
	Khem Raj <raj.khem@gmail.com>
Subject: [PATCH 06/24] rust: update 1.56.0 -> 1.56.1
Date: Wed, 10 Nov 2021 20:39:19 +0100
Message-Id: <20211110193937.2606747-6-alex@linutronix.de>
X-Mailer: git-send-email 2.20.1
In-Reply-To: <20211110193937.2606747-1-alex@linutronix.de>
References: <20211110193937.2606747-1-alex@linutronix.de>
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Wed, 10 Nov 2021 19:39:48 -0000
X-Groupsio-URL: 
 https://lists.openembedded.org/g/openembedded-core/message/158090

This update includes fixes for the 'trojan source' vulnerability:
https://blog.rust-lang.org/2021/11/01/Rust-1.56.1.html

Drop two unused patches.

Signed-off-by: Alexander Kanavin <alex@linutronix.de>
---
 meta/conf/distro/include/tcmode-default.inc   |  2 +-
 ...56.0.bb =3D> cargo-cross-canadian_1.56.1.bb} |  0
 .../{cargo_1.56.0.bb =3D> cargo_1.56.1.bb}      |  0
 .../rust/files/riscv-march.patch              | 73 -------------------
 meta/recipes-devtools/rust/files/rv64gc.patch | 37 ----------
 ...ibstd-rs_1.56.0.bb =3D> libstd-rs_1.56.1.bb} |  0
 ....56.0.bb =3D> rust-cross-canadian_1.56.1.bb} |  0
 ...t-cross_1.56.0.bb =3D> rust-cross_1.56.1.bb} |  0
 ...-llvm-allow-env-override-of-exe-path.patch |  1 +
 ...ust-llvm_1.56.0.bb =3D> rust-llvm_1.56.1.bb} |  0
 meta/recipes-devtools/rust/rust-snapshot.inc  | 16 ++--
 meta/recipes-devtools/rust/rust-source.inc    |  2 +-
 ...bb =3D> rust-tools-cross-canadian_1.56.1.bb} |  0
 .../rust/{rust_1.56.0.bb =3D> rust_1.56.1.bb}   |  0
 14 files changed, 11 insertions(+), 120 deletions(-)
 rename meta/recipes-devtools/cargo/{cargo-cross-canadian_1.56.0.bb =3D> ca=
rgo-cross-canadian_1.56.1.bb} (100%)
 rename meta/recipes-devtools/cargo/{cargo_1.56.0.bb =3D> cargo_1.56.1.bb} =
(100%)
 delete mode 100644 meta/recipes-devtools/rust/files/riscv-march.patch
 delete mode 100644 meta/recipes-devtools/rust/files/rv64gc.patch
 rename meta/recipes-devtools/rust/{libstd-rs_1.56.0.bb =3D> libstd-rs_1.56=
.1.bb} (100%)
 rename meta/recipes-devtools/rust/{rust-cross-canadian_1.56.0.bb =3D> rust=
-cross-canadian_1.56.1.bb} (100%)
 rename meta/recipes-devtools/rust/{rust-cross_1.56.0.bb =3D> rust-cross_1.=
56.1.bb} (100%)
 rename meta/recipes-devtools/rust/{rust-llvm_1.56.0.bb =3D> rust-llvm_1.56=
.1.bb} (100%)
 rename meta/recipes-devtools/rust/{rust-tools-cross-canadian_1.56.0.bb =3D=
> rust-tools-cross-canadian_1.56.1.bb} (100%)
 rename meta/recipes-devtools/rust/{rust_1.56.0.bb =3D> rust_1.56.1.bb} (10=
0%)

diff --git a/meta/conf/distro/include/tcmode-default.inc b/meta/conf/distro=
/include/tcmode-default.inc
index 609f2fd0eb..d5167ee9ad 100644
--- a/meta/conf/distro/include/tcmode-default.inc
+++ b/meta/conf/distro/include/tcmode-default.inc
@@ -27,7 +27,7 @@ GOVERSION ?=3D "1.16%"
 # This can not use wildcards like 8.0.% since it is also used in mesa to d=
enote
 # llvm version being used, so always bump it with llvm recipe version bump
 LLVMVERSION ?=3D "12.0.1"
-RUSTVERSION ?=3D "1.56.0"
+RUSTVERSION ?=3D "1.56.1"
=20
 PREFERRED_VERSION_gcc ?=3D "${GCCVERSION}"
 PREFERRED_VERSION_gcc-cross-${TARGET_ARCH} ?=3D "${GCCVERSION}"
diff --git a/meta/recipes-devtools/cargo/cargo-cross-canadian_1.56.0.bb b/m=
eta/recipes-devtools/cargo/cargo-cross-canadian_1.56.1.bb
similarity index 100%
rename from meta/recipes-devtools/cargo/cargo-cross-canadian_1.56.0.bb
rename to meta/recipes-devtools/cargo/cargo-cross-canadian_1.56.1.bb
diff --git a/meta/recipes-devtools/cargo/cargo_1.56.0.bb b/meta/recipes-dev=
tools/cargo/cargo_1.56.1.bb
similarity index 100%
rename from meta/recipes-devtools/cargo/cargo_1.56.0.bb
rename to meta/recipes-devtools/cargo/cargo_1.56.1.bb
diff --git a/meta/recipes-devtools/rust/files/riscv-march.patch b/meta/reci=
pes-devtools/rust/files/riscv-march.patch
deleted file mode 100644
index a10b3a4d93..0000000000
--- a/meta/recipes-devtools/rust/files/riscv-march.patch
+++ /dev/null
@@ -1,73 +0,0 @@
-Add suppor for riscv64 and riscv32 musl targets
-
-Upstream-Status: Pending
-Signed-off-by: Khem Raj <raj.khem@gmail.com>
-
---- a/vendor/cc/src/lib.rs
-+++ b/vendor/cc/src/lib.rs
-@@ -2361,6 +2361,7 @@ impl Build {
-                 "riscv-none-embed",
-             ]),
-             "riscv64gc-unknown-linux-gnu" =3D> Some("riscv64-linux-gnu"),
-+            "riscv64gc-unknown-linux-musl" =3D> Some("riscv64-linux-musl"=
),
-             "s390x-unknown-linux-gnu" =3D> Some("s390x-linux-gnu"),
-             "sparc-unknown-linux-gnu" =3D> Some("sparc-linux-gnu"),
-             "sparc64-unknown-linux-gnu" =3D> Some("sparc64-linux-gnu"),
---- a/compiler/rustc_target/src/spec/mod.rs
-+++ b/compiler/rustc_target/src/spec/mod.rs
-@@ -641,9 +641,11 @@ supported_targets! {
-     ("riscv32imc-unknown-none-elf", riscv32imc_unknown_none_elf),
-     ("riscv32imac-unknown-none-elf", riscv32imac_unknown_none_elf),
-     ("riscv32gc-unknown-linux-gnu", riscv32gc_unknown_linux_gnu),
-+    ("riscv32gc-unknown-linux-musl", riscv32gc_unknown_linux_musl),
-     ("riscv64imac-unknown-none-elf", riscv64imac_unknown_none_elf),
-     ("riscv64gc-unknown-none-elf", riscv64gc_unknown_none_elf),
-     ("riscv64gc-unknown-linux-gnu", riscv64gc_unknown_linux_gnu),
-+    ("riscv64gc-unknown-linux-musl", riscv64gc_unknown_linux_musl),
-=20
-     ("aarch64-unknown-none", aarch64_unknown_none),
-     ("aarch64-unknown-none-softfloat", aarch64_unknown_none_softfloat),
---- /dev/null
-+++ b/compiler/rustc_target/src/spec/riscv32gc_unknown_linux_musl.rs
-@@ -0,0 +1,19 @@
-+use crate::spec::{CodeModel, Target, TargetOptions};
-+
-+pub fn target() -> Target {
-+    Target {
-+        llvm_target: "riscv32-unknown-linux-musl".to_string(),
-+        pointer_width: 32,
-+        data_layout: "e-m:e-p:32:32-i64:64-n32-S128".to_string(),
-+        arch: "riscv32".to_string(),
-+        options: TargetOptions {
-+            unsupported_abis: super::riscv_base::unsupported_abis(),
-+            code_model: Some(CodeModel::Medium),
-+            cpu: "generic-rv32".to_string(),
-+            features: "+m,+a,+f,+d,+c".to_string(),
-+            llvm_abiname: "ilp32d".to_string(),
-+            max_atomic_width: Some(32),
-+            ..super::linux_musl_base::opts()
-+        },
-+    }
-+}
---- /dev/null
-+++ b/compiler/rustc_target/src/spec/riscv64gc_unknown_linux_musl.rs
-@@ -0,0 +1,19 @@
-+use crate::spec::{CodeModel, Target, TargetOptions};
-+
-+pub fn target() -> Target {
-+    Target {
-+        llvm_target: "riscv64-unknown-linux-musl".to_string(),
-+        pointer_width: 64,
-+        data_layout: "e-m:e-p:64:64-i64:64-i128:128-n64-S128".to_string(),
-+        arch: "riscv64".to_string(),
-+        options: TargetOptions {
-+            unsupported_abis: super::riscv_base::unsupported_abis(),
-+            code_model: Some(CodeModel::Medium),
-+            cpu: "generic-rv64".to_string(),
-+            features: "+m,+a,+f,+d,+c".to_string(),
-+            llvm_abiname: "lp64d".to_string(),
-+            max_atomic_width: Some(64),
-+            ..super::linux_musl_base::opts()
-+        },
-+    }
-+}
diff --git a/meta/recipes-devtools/rust/files/rv64gc.patch b/meta/recipes-d=
evtools/rust/files/rv64gc.patch
deleted file mode 100644
index aab1e18453..0000000000
--- a/meta/recipes-devtools/rust/files/rv64gc.patch
+++ /dev/null
@@ -1,37 +0,0 @@
---- a/vendor/cc-1.0.60/.cargo-checksum.json
-+++ b/vendor/cc-1.0.60/.cargo-checksum.json
-@@ -1 +1 @@
--{"files":{"Cargo.lock":"30b9e23f97015aea3eed3e17c6d76d565c2924efec8bdae64=
c899080847afe89","Cargo.toml":"f6f22b69df3df57c58373cdee72b22218ffa030bc375=
b36632660037dd72c866","LICENSE-APACHE":"a60eea817514531668d7e00765731449fe1=
4d059d3249e0bc93b36de45f759f2","LICENSE-MIT":"378f5840b258e2779c39418f3f2d7=
b2ba96f1c7917dd6be0713f88305dbda397","README.md":"51405d284d2e0620db62c655c=
652fc0ec84f20c1cb30529227355c9575a9e6dd","src/bin/gcc-shim.rs":"b7790787502=
9494b6288841c3aed2e4939ed40708c7f597fca5c9e2570490ca6","src/com.rs":"bcdaf1=
c28b71e6ef889c6b08d1ce9d7c0761344a677f523bc4c3cd297957f804","src/lib.rs":"9=
03c5f2f5dd0cc7d04f99f605a95e6abde8b38156fd4e73eefc58493f55a4e5a","src/regis=
try.rs":"3cc1b5a50879fa751572878ae1d0afbfc960c11665258492754b2c8bccb0ff5d",=
"src/setup_config.rs":"7014103587d3382eac599cb76f016e2609b8140970861b223798=
2d1db24af265","src/winapi.rs":"ea8b7edbb9ff87957254f465c2334e714c5d6b3b19a8=
d757c48ea7ca0881c50c","src/windows_registry.rs":"52afe8554f577c87841c48ddee=
3ba7ffe70a00129e1d6eeb2ec0efb3d2b9aa11","tests/cc_env.rs":"e02b3b0824ad039b=
47e4462c5ef6dbe6c824c28e7953af94a0f28f7b5158042e","tests/cflags.rs":"57f06e=
b5ce1557e5b4a032d0c4673e18fbe6f8d26c1deb153126e368b96b41b3","tests/cxxflags=
.rs":"c2c6c6d8a0d7146616fa1caed26876ee7bc9fcfffd525eb4743593cade5f3371","te=
sts/support/mod.rs":"16274867f23871e9b07614eda4c7344da13d1751fed63d4f633857=
e40be86394","tests/test.rs":"65c073e0e2cf4aa0433066102788e9f57442719e6f32f5=
ad5248aa7132bb4597"},"package":"ef611cc68ff783f18535d77ddd080185275713d852c=
4f5cbb6122c462a7a825c"}
-\ No newline at end of file
-+{"files":{"Cargo.lock":"30b9e23f97015aea3eed3e17c6d76d565c2924efec8bdae64=
c899080847afe89","Cargo.toml":"f6f22b69df3df57c58373cdee72b22218ffa030bc375=
b36632660037dd72c866","LICENSE-APACHE":"a60eea817514531668d7e00765731449fe1=
4d059d3249e0bc93b36de45f759f2","LICENSE-MIT":"378f5840b258e2779c39418f3f2d7=
b2ba96f1c7917dd6be0713f88305dbda397","README.md":"51405d284d2e0620db62c655c=
652fc0ec84f20c1cb30529227355c9575a9e6dd","src/bin/gcc-shim.rs":"b7790787502=
9494b6288841c3aed2e4939ed40708c7f597fca5c9e2570490ca6","src/com.rs":"bcdaf1=
c28b71e6ef889c6b08d1ce9d7c0761344a677f523bc4c3cd297957f804","src/lib.rs":"2=
788af2bdf425f267b33bc524f3e627851b52422e38f480a7e39eb834264fd73","src/regis=
try.rs":"3cc1b5a50879fa751572878ae1d0afbfc960c11665258492754b2c8bccb0ff5d",=
"src/setup_config.rs":"7014103587d3382eac599cb76f016e2609b8140970861b223798=
2d1db24af265","src/winapi.rs":"ea8b7edbb9ff87957254f465c2334e714c5d6b3b19a8=
d757c48ea7ca0881c50c","src/windows_registry.rs":"52afe8554f577c87841c48ddee=
3ba7ffe70a00129e1d6eeb2ec0efb3d2b9aa11","tests/cc_env.rs":"e02b3b0824ad039b=
47e4462c5ef6dbe6c824c28e7953af94a0f28f7b5158042e","tests/cflags.rs":"57f06e=
b5ce1557e5b4a032d0c4673e18fbe6f8d26c1deb153126e368b96b41b3","tests/cxxflags=
.rs":"c2c6c6d8a0d7146616fa1caed26876ee7bc9fcfffd525eb4743593cade5f3371","te=
sts/support/mod.rs":"16274867f23871e9b07614eda4c7344da13d1751fed63d4f633857=
e40be86394","tests/test.rs":"65c073e0e2cf4aa0433066102788e9f57442719e6f32f5=
ad5248aa7132bb4597"},"package":"ef611cc68ff783f18535d77ddd080185275713d852c=
4f5cbb6122c462a7a825c"}
---- a/vendor/cc-1.0.60/src/lib.rs
-+++ b/vendor/cc-1.0.60/src/lib.rs
-@@ -1639,14 +1639,17 @@ impl Build {
-                     let mut parts =3D target.split('-');
-                     if let Some(arch) =3D parts.next() {
-                         let arch =3D &arch[5..];
--                        cmd.args.push(("-march=3Drv".to_owned() + arch).i=
nto());
-                         if target.contains("linux") && arch.starts_with("=
64") {
-+                            cmd.args.push(("-march=3Drv64gc").into());
-                             cmd.args.push("-mabi=3Dlp64d".into());
-                         } else if target.contains("linux") && arch.starts=
_with("32") {
-+                            cmd.args.push(("-march=3Drv32gc").into());
-                             cmd.args.push("-mabi=3Dilp32d".into());
-                         } else if arch.starts_with("64") {
-+                            cmd.args.push(("-march=3Drv".to_owned() + arc=
h).into());
-                             cmd.args.push("-mabi=3Dlp64".into());
-                         } else {
-+                            cmd.args.push(("-march=3Drv".to_owned() + arc=
h).into());
-                             cmd.args.push("-mabi=3Dilp32".into());
-                         }
-                         cmd.args.push("-mcmodel=3Dmedany".into());
-@@ -2332,6 +2335,9 @@ impl Build {
-                 "riscv-none-embed",
-             ]),
-             "riscv64gc-unknown-linux-gnu" =3D> Some("riscv64-linux-gnu"),
-+            "riscv32gc-unknown-linux-gnu" =3D> Some("riscv32-linux-gnu"),
-+            "riscv64gc-unknown-linux-musl" =3D> Some("riscv64-linux-musl"=
),
-+            "riscv32gc-unknown-linux-musl" =3D> Some("riscv32-linux-musl"=
),
-             "s390x-unknown-linux-gnu" =3D> Some("s390x-linux-gnu"),
-             "sparc-unknown-linux-gnu" =3D> Some("sparc-linux-gnu"),
-             "sparc64-unknown-linux-gnu" =3D> Some("sparc64-linux-gnu"),
diff --git a/meta/recipes-devtools/rust/libstd-rs_1.56.0.bb b/meta/recipes-=
devtools/rust/libstd-rs_1.56.1.bb
similarity index 100%
rename from meta/recipes-devtools/rust/libstd-rs_1.56.0.bb
rename to meta/recipes-devtools/rust/libstd-rs_1.56.1.bb
diff --git a/meta/recipes-devtools/rust/rust-cross-canadian_1.56.0.bb b/met=
a/recipes-devtools/rust/rust-cross-canadian_1.56.1.bb
similarity index 100%
rename from meta/recipes-devtools/rust/rust-cross-canadian_1.56.0.bb
rename to meta/recipes-devtools/rust/rust-cross-canadian_1.56.1.bb
diff --git a/meta/recipes-devtools/rust/rust-cross_1.56.0.bb b/meta/recipes=
-devtools/rust/rust-cross_1.56.1.bb
similarity index 100%
rename from meta/recipes-devtools/rust/rust-cross_1.56.0.bb
rename to meta/recipes-devtools/rust/rust-cross_1.56.1.bb
diff --git a/meta/recipes-devtools/rust/rust-llvm/0002-llvm-allow-env-overr=
ide-of-exe-path.patch b/meta/recipes-devtools/rust/rust-llvm/0002-llvm-allo=
w-env-override-of-exe-path.patch
index 943c2118bb..9be26677a9 100644
--- a/meta/recipes-devtools/rust/rust-llvm/0002-llvm-allow-env-override-of-=
exe-path.patch
+++ b/meta/recipes-devtools/rust/rust-llvm/0002-llvm-allow-env-override-of-=
exe-path.patch
@@ -8,6 +8,7 @@ return the libraries, include directories, etc. from inside=
 the sysroot rather
 than from the native sysroot. Thus provide an env override for calling
 llvm-config from a target sysroot.
=20
+Upstream-Status: Inappropriate [oe-core specific]
 Signed-off-by: Martin Kelly <mkelly@xevo.com>
 Signed-off-by: Khem Raj <raj.khem@gmail.com>
 ---
diff --git a/meta/recipes-devtools/rust/rust-llvm_1.56.0.bb b/meta/recipes-=
devtools/rust/rust-llvm_1.56.1.bb
similarity index 100%
rename from meta/recipes-devtools/rust/rust-llvm_1.56.0.bb
rename to meta/recipes-devtools/rust/rust-llvm_1.56.1.bb
diff --git a/meta/recipes-devtools/rust/rust-snapshot.inc b/meta/recipes-de=
vtools/rust/rust-snapshot.inc
index 18e98d70a0..3418a2e0ba 100644
--- a/meta/recipes-devtools/rust/rust-snapshot.inc
+++ b/meta/recipes-devtools/rust/rust-snapshot.inc
@@ -2,17 +2,17 @@
 ## snapshot info is taken from rust/src/stage0.txt
 ## TODO: find a way to add additional SRC_URIs based on the contents of an
 ##       earlier SRC_URI.
-RS_VERSION =3D "1.56.0"
-CARGO_VERSION =3D "1.56.0"
+RS_VERSION =3D "1.56.1"
+CARGO_VERSION =3D "1.56.1"
=20
 # TODO: Add hashes for other architecture toolchains as well. Make a scrip=
t?
-SRC_URI[rust-std-snapshot-x86_64.sha256sum] =3D "f693e4f41a959d62528e0043b=
0b010c4815fb9f5887267ae34ff8b860f8ec4ae"
-SRC_URI[rustc-snapshot-x86_64.sha256sum] =3D "2a5f919e2036496c02ab4707a5eb=
8bd8a4ce6ea589e01cb39f25d213a26dcdfe"
-SRC_URI[cargo-snapshot-x86_64.sha256sum] =3D "f972125810d2db7df2e0af56d9f6=
a3dcdacc52d983bdf0ca17309b45fc44209b"
+SRC_URI[rust-std-snapshot-x86_64.sha256sum] =3D "b01011cbb5503c456ecc6a557=
a38e099994b8497df545c661ce8fd48c5beadc6"
+SRC_URI[rustc-snapshot-x86_64.sha256sum] =3D "a7001d1218b62d377cab15522d1b=
1c376b073c05f7d0ff32cf278871a5eeda3d"
+SRC_URI[cargo-snapshot-x86_64.sha256sum] =3D "dfed65a50e2b58b6807c1fb6f8af=
a7abd5c3b22c682d505721d615823687c708"
=20
-SRC_URI[rust-std-snapshot-aarch64.sha256sum] =3D "3cd1c69c618e5efaf578a156=
c2a950c93964f9b47ba4d705d5700bdc64880231"
-SRC_URI[rustc-snapshot-aarch64.sha256sum] =3D "0d2491a59f697d2ea52fc429b8d=
4665acb5f79b0e16703f3604b61b8aa68d1c4"
-SRC_URI[cargo-snapshot-aarch64.sha256sum] =3D "9d97cd655845572846c058577f6=
8ea74b6111f8ea7649db308f786475f764a09"
+SRC_URI[rust-std-snapshot-aarch64.sha256sum] =3D "a83416d15354e4dfa1c1e4a7=
56282c6be7169679f2b04eca82ed34e2116b93f0"
+SRC_URI[rustc-snapshot-aarch64.sha256sum] =3D "77aec6a8c5f3d33941c79a48cda=
3bb08878c23dd1947dc027dfe5c4da41305b3"
+SRC_URI[cargo-snapshot-aarch64.sha256sum] =3D "3d263eb1871b5d6ca4b198b9611=
925923e9353e1f5c2becf8c7b784298e88743"
=20
 SRC_URI +=3D " \
     https://static.rust-lang.org/dist/${RUST_STD_SNAPSHOT}.tar.xz;name=3Dr=
ust-std-snapshot-${BUILD_ARCH};subdir=3Drust-snapshot-components \
diff --git a/meta/recipes-devtools/rust/rust-source.inc b/meta/recipes-devt=
ools/rust/rust-source.inc
index 326a592544..e197604716 100644
--- a/meta/recipes-devtools/rust/rust-source.inc
+++ b/meta/recipes-devtools/rust/rust-source.inc
@@ -1,5 +1,5 @@
 SRC_URI +=3D "https://static.rust-lang.org/dist/rustc-${PV}-src.tar.xz;nam=
e=3Drust"
-SRC_URI[rust.sha256sum] =3D "f13468889833c88e744ad579c5d8fbb7ecb53216159b5=
4481a90e5dcdaa9e320"
+SRC_URI[rust.sha256sum] =3D "61fdcc8bc2530ee18f91318347e09b7cc07e9ca04b1c6=
27c135ecc8dcb8f2ac5"
=20
 RUSTSRC =3D "${WORKDIR}/rustc-${PV}-src"
=20
diff --git a/meta/recipes-devtools/rust/rust-tools-cross-canadian_1.56.0.bb=
 b/meta/recipes-devtools/rust/rust-tools-cross-canadian_1.56.1.bb
similarity index 100%
rename from meta/recipes-devtools/rust/rust-tools-cross-canadian_1.56.0.bb
rename to meta/recipes-devtools/rust/rust-tools-cross-canadian_1.56.1.bb
diff --git a/meta/recipes-devtools/rust/rust_1.56.0.bb b/meta/recipes-devto=
ols/rust/rust_1.56.1.bb
similarity index 100%
rename from meta/recipes-devtools/rust/rust_1.56.0.bb
rename to meta/recipes-devtools/rust/rust_1.56.1.bb
--=20
2.20.1


