Return-Path: <alistair23@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id CF87CEEF303
	for <webhook@archiver.kernel.org>; Thu,  5 Mar 2026 05:36:29 +0000 (UTC)
Received: from mail-pf1-f181.google.com (mail-pf1-f181.google.com [209.85.210.181])
 by mx.groups.io with SMTP id smtpd.msgproc02-g2.38019.1772688980461787765
 for <openembedded-core@lists.openembedded.org>;
 Wed, 04 Mar 2026 21:36:20 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20230601 header.b=YbW9qw+j;
 spf=pass (domain: gmail.com, ip: 209.85.210.181, mailfrom: alistair23@gmail.com)
Received: by mail-pf1-f181.google.com with SMTP id d2e1a72fcca58-829781b2b01so777678b3a.2
        for <openembedded-core@lists.openembedded.org>; Wed, 04 Mar 2026 21:36:20 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1772688979; x=1773293779; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=433fjsktT8a+s9yROZYaFczsp/nWCtXDvJGaPOHoAng=;
        b=YbW9qw+jCZ40xlYAWufB9JKaJtqDAytyGC/CWUarVlZKHl4CnhSW8Ay8/KYC5xL5YG
         1xEkQvwlJWshapmqV6OFDWNTrT4ew/52Rl7WwAUIeEAz1TMgyzSjnQt2RcOzK4+pQjzL
         +Z/el1A4/pqO4mLp/zmhfexWdkPYQHNV7rGfwpICFmKcpmnEeD51ptyuo0b1roEbVJVl
         Fcz4o52WsrS/xK1Gtgl9msD3613qkC0dd+lx+3MfEdskvOzMUn+5FmxwbZf7YuolCsZt
         9Gswi4Y5d74sV6iV9rvNQe6dMFxzxYZl1CUx+/Ehwkmo+BoMyY0PxelHrpk+PxZifsI8
         2SlQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1772688979; x=1773293779;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=433fjsktT8a+s9yROZYaFczsp/nWCtXDvJGaPOHoAng=;
        b=JP0kyAwSahahnP2ipJN1saA/QKl/iKeYL01FQp5QCTBq0T1Vxe8UUpkjYhTd9UjW3W
         4JmPOleVWPPGhhukcpbT7fZKXAdIl51IW9SvuArP+Y/59Fnqe00jfJfdjKHRUbuU/FKx
         MAVHHoljezfNO8cTkns7QOquWCb4yyrqs28MNhiNC0YHx3isXnuCwc4Dm3pJZbGIFP45
         kdO2x8ncebhd0yXWYAV63vv4Mk5QrsCKmb1c4neK9Y3KENCGypsSTr9KbMe8jj+6OJsS
         rO0EwcmmlzbVA2NjraNiG8TNWJFiDyT+SvNClrK7MKMQEJXDvVfFUUrsx4YHy0J6cLeV
         nddA==
X-Gm-Message-State: AOJu0YzDit3pOoRZe2PoYP94TvPF1co9IKBo+Mj5eL+mZ/vCUu4ipiYA
	AiFuJcD1pHGpLC6BxNkHZlbddFEbTokxMS0ugRxc3bmfohP5heJS3tGu5KLlcQ==
X-Gm-Gg: ATEYQzy9aJVpho1r9bx8w1iQEPWyZbpiItgNuj98a1qqSHGR5quSEzbwFGbEsU3/fHp
	37HMbgDjlvMhoqYXfYy6vQlEi7h0bGCAteGdbrjF+h+Hog+BNFhCdlEczcpJ02LhoCfiG5k8w4e
	ws2LiFUjAwBsAP5d/OdjMc+IRvamddRjoXfcQdZs5rNuQ73J4JdewXbNEdzZSXIY/8Cf+CidQDb
	z5+z+C8WJLpfanzPbnBWkYe42AHCqpYykPyYpftxyHIZqxnWrjFwtpnhlinPNy+CQXfuAHs1ixs
	vwSFujQF6xxUkCcJ5yhQinP0PxSnq17ZBIUpXmrlfu08CyWd4tpkaIxo0ayynGoTKA24u9a8aLA
	0FTuo4rUKYA+/q2S0xQF9XhXqXxoCIL2ADuUZ2GOeNybgZZBHErXhEpvuUDQQBrZUnWa0vetOqL
	4LzxiCPKJBFc5ZwmSpt4S3OEgegZpiINDTZ4dzUYFP2Q==
X-Received: by 2002:a05:6a00:3e1d:b0:824:a0b9:64ee with SMTP id d2e1a72fcca58-8297293e111mr4782472b3a.17.1772688979230;
        Wed, 04 Mar 2026 21:36:19 -0800 (PST)
Received: from toolbx.alistair23.me ([2403:581e:fdf9:0:6209:4521:6813:45b7])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-8273a081a14sm18993216b3a.64.2026.03.04.21.36.17
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 04 Mar 2026 21:36:18 -0800 (PST)
From: alistair23@gmail.com
X-Google-Original-From: alistair.francis@wdc.com
To: openembedded-core@lists.openembedded.org
Cc: alistair23@gmail.com,
	Alistair Francis <alistair.francis@wdc.com>
Subject: [PATCH v2] rust: Install the Rust source
Date: Thu,  5 Mar 2026 15:36:12 +1000
Message-ID: <20260305053612.1632965-1-alistair.francis@wdc.com>
X-Mailer: git-send-email 2.53.0
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Thu, 05 Mar 2026 05:36:29 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/232446

From: Alistair Francis <alistair.francis@wdc.com>

When building the Linux kernel with Rust support enabled the kernel
expects to find the Rust source as the kernel build system will cross
compile the core library.

This patch uses the Rust tooling to install the Rust source when we
install the compiller as well.

Signed-off-by: Alistair Francis <alistair.francis@wdc.com>
---
v2:
 - Update patch with new upstream submission

 ...l-fix-for-.-x-install-src-with-build.patch | 45 +++++++++++++++++++
 meta/recipes-devtools/rust/rust-source.inc    |  1 +
 meta/recipes-devtools/rust/rust_1.93.0.bb     |  4 +-
 3 files changed, 49 insertions(+), 1 deletion(-)
 create mode 100644 meta/recipes-devtools/rust/files/0001-bootstrap-minimal-fix-for-.-x-install-src-with-build.patch

diff --git a/meta/recipes-devtools/rust/files/0001-bootstrap-minimal-fix-for-.-x-install-src-with-build.patch b/meta/recipes-devtools/rust/files/0001-bootstrap-minimal-fix-for-.-x-install-src-with-build.patch
new file mode 100644
index 0000000000..aeb59ff567
--- /dev/null
+++ b/meta/recipes-devtools/rust/files/0001-bootstrap-minimal-fix-for-.-x-install-src-with-build.patch
@@ -0,0 +1,45 @@
+From e26974ca33aa322bbc60db5d1010899e40f6d624 Mon Sep 17 00:00:00 2001
+From: Alistair Francis <alistair.francis@wdc.com>
+Date: Fri, 9 Jan 2026 08:35:43 +1000
+Subject: [PATCH] bootstrap: minimal fix for ./x install src with build.docs =
+ false
+
+When running the `install src` command I'm seeing failures as the
+`builder.doc_out(host)` directory does not exist. This is because
+`match_paths_to_steps_and_run()` doesn't actually build any
+documentation as the `paths.is_empty()` causes an early return. This
+results in install failures as the `*/doc` src directory doesn't exist.
+
+This patch ensures that the builder.doc_out(host) directory exists.
+
+This fixes installing the Rust source when `build.docs = false`.
+
+This fixes installing the Rust source code in OpenEmbedded.
+
+Upstream-Status: Submitted [https://github.com/rust-lang/rust/pull/150845]
+Signed-off-by: Alistair Francis <alistair.francis@wdc.com>
+Signed-off-by: Jieyou Xu <jieyouxu@outlook.com>
+---
+ src/bootstrap/src/core/build_steps/dist.rs | 6 ++++++
+ 1 file changed, 6 insertions(+)
+
+diff --git a/src/bootstrap/src/core/build_steps/dist.rs b/src/bootstrap/src/core/build_steps/dist.rs
+index 2e291f7c2c3..28a7afd6c61 100644
+--- a/src/bootstrap/src/core/build_steps/dist.rs
++++ b/src/bootstrap/src/core/build_steps/dist.rs
+@@ -87,6 +87,12 @@ fn run(self, builder: &Builder<'_>) -> Option<GeneratedTarball> {
+         // from a shared directory.
+         builder.run_default_doc_steps();
+ 
++        // In case no default doc steps are run for host, it is possible that `<host>/doc` directory
++        // is never created.
++        if !builder.config.dry_run() {
++            t!(fs::create_dir_all(builder.doc_out(host)));
++        }
++
+         let dest = "share/doc/rust/html";
+ 
+         let mut tarball = Tarball::new(builder, "rust-docs", &host.triple);
+-- 
+2.53.0
+
diff --git a/meta/recipes-devtools/rust/rust-source.inc b/meta/recipes-devtools/rust/rust-source.inc
index 514f3fec1e..65c6dc2857 100644
--- a/meta/recipes-devtools/rust/rust-source.inc
+++ b/meta/recipes-devtools/rust/rust-source.inc
@@ -8,6 +8,7 @@ SRC_URI += "https://static.rust-lang.org/dist/rustc-${RUST_VERSION}-src.tar.xz;n
             file://0001-src-core-build_steps-tool.rs-switch-off-lto-for-rust.patch;patchdir=${RUSTSRC} \
             file://revert-link-std-statically-in-rustc_driver-feature.patch;patchdir=${RUSTSRC} \
             file://0001-riscv32-Define-plain-syscalls-as-their-time64-varian.patch;patchdir=${RUSTSRC} \
+            file://0001-bootstrap-minimal-fix-for-.-x-install-src-with-build.patch;patchdir=${RUSTSRC} \
 "
 SRC_URI[rust.sha256sum] = "e30d898272c587a22f77679f03c5e8192b5645c7c9ccc3407ad1106761507cea"
 
diff --git a/meta/recipes-devtools/rust/rust_1.93.0.bb b/meta/recipes-devtools/rust/rust_1.93.0.bb
index 2be0bd8d89..9c3efc7453 100644
--- a/meta/recipes-devtools/rust/rust_1.93.0.bb
+++ b/meta/recipes-devtools/rust/rust_1.93.0.bb
@@ -6,8 +6,9 @@ LIC_FILES_CHKSUM = "file://COPYRIGHT;md5=11a3899825f4376896e438c8c753f8dc"
 
 inherit rust
 inherit cargo_common
+inherit pkgconfig
 
-DEPENDS += "llvm"
+DEPENDS += "llvm openssl"
 # native rust uses cargo/rustc from binary snapshots to bootstrap
 # but everything else should use our native builds
 DEPENDS:append:class-target = " cargo-native rust-native"
@@ -284,6 +285,7 @@ do_install () {
 
 rust_do_install() {
     rust_runx install
+    rust_runx install src
 }
 
 rust_do_install:class-nativesdk() {
-- 
2.53.0


