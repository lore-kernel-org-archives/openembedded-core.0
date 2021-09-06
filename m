Received: from mail5.wrs.com (mail5.wrs.com [192.103.53.11])
 by mx.groups.io with SMTP id smtpd.web08.16975.1630891613391481170
 for <openembedded-core@lists.openembedded.org>;
 Sun, 05 Sep 2021 18:26:53 -0700
Authentication-Results: mx.groups.io;
 dkim=missing; spf=pass (domain: windriver.com, ip: 192.103.53.11, mailfrom: randy.macleod@windriver.com)
Received: from ala-exchng01.corp.ad.wrs.com (ala-exchng01.corp.ad.wrs.com [147.11.82.252])
	by mail5.wrs.com (8.15.2/8.15.2) with ESMTPS id 1861Qoso021635
	(version=TLSv1.2 cipher=AES256-GCM-SHA384 bits=256 verify=FAIL);
	Sun, 5 Sep 2021 18:26:50 -0700
Received: from ALA-EXCHNG02.corp.ad.wrs.com (147.11.82.254) by
 ala-exchng01.corp.ad.wrs.com (147.11.82.252) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2242.12; Sun, 5 Sep 2021 18:26:50 -0700
Received: from ala-exchng01.corp.ad.wrs.com (147.11.82.252) by
 ALA-EXCHNG02.corp.ad.wrs.com (147.11.82.254) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2308.14; Sun, 5 Sep 2021 18:26:49 -0700
Received: from vme.wrs.com (172.25.44.7) by ala-exchng01.corp.ad.wrs.com
 (147.11.82.252) with Microsoft SMTP Server id 15.1.2242.12 via Frontend
 Transport; Sun, 5 Sep 2021 18:26:49 -0700
From: "Randy MacLeod" <randy.macleod@windriver.com>
To: <openembedded-core@lists.openembedded.org>
CC: <raj.khem@gmail.com>
Subject: [v2] tcmode-default: add rust to the default toolchains
Date: Sun, 5 Sep 2021 21:26:48 -0400
Message-ID: <20210906012648.49994-1-Randy.MacLeod@windriver.com>
X-Mailer: git-send-email 2.30.2
In-Reply-To: <d23ebcf2-c0f2-29c9-6a7e-60f4804310c7@gmail.com>
References: <d23ebcf2-c0f2-29c9-6a7e-60f4804310c7@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain

Remove the rust_versions.inc file and put it's content
in tcmode-default.inc is done for other toolchains.

Rename RUST_VERSION to RUSTVERSION to adhere to the
naming format used for other languages.

Signed-off-by: Randy MacLeod <Randy.MacLeod@windriver.com>
---
 meta/conf/distro/include/rust_versions.inc  | 13 -------------
 meta/conf/distro/include/tcmode-default.inc | 13 +++++++++++++
 2 files changed, 13 insertions(+), 13 deletions(-)
 delete mode 100644 meta/conf/distro/include/rust_versions.inc

diff --git a/meta/conf/distro/include/rust_versions.inc b/meta/conf/distro/include/rust_versions.inc
deleted file mode 100644
index a11ba22a8f..0000000000
--- a/meta/conf/distro/include/rust_versions.inc
+++ /dev/null
@@ -1,13 +0,0 @@
-# include this in your distribution to easily switch between versions
-# just by changing RUST_VERSION variable
-
-RUST_VERSION ?= "1.51.0"
-
-PREFERRED_VERSION_cargo ?= "${RUST_VERSION}"
-PREFERRED_VERSION_cargo-native ?= "${RUST_VERSION}"
-PREFERRED_VERSION_libstd-rs ?= "${RUST_VERSION}"
-PREFERRED_VERSION_rust ?= "${RUST_VERSION}"
-PREFERRED_VERSION_rust-cross-${TARGET_ARCH} ?= "${RUST_VERSION}"
-PREFERRED_VERSION_rust-llvm ?= "${RUST_VERSION}"
-PREFERRED_VERSION_rust-llvm-native ?= "${RUST_VERSION}"
-PREFERRED_VERSION_rust-native ?= "${RUST_VERSION}"
diff --git a/meta/conf/distro/include/tcmode-default.inc b/meta/conf/distro/include/tcmode-default.inc
index 47f23f5c39..80b03305bb 100644
--- a/meta/conf/distro/include/tcmode-default.inc
+++ b/meta/conf/distro/include/tcmode-default.inc
@@ -27,6 +27,7 @@ GOVERSION ?= "1.16%"
 # This can not use wildcards like 8.0.% since it is also used in mesa to denote
 # llvm version being used, so always bump it with llvm recipe version bump
 LLVMVERSION ?= "12.0.1"
+RUSTVERSION ?= "1.54.0"
 
 PREFERRED_VERSION_gcc ?= "${GCCVERSION}"
 PREFERRED_VERSION_gcc-cross-${TARGET_ARCH} ?= "${GCCVERSION}"
@@ -81,3 +82,15 @@ PREFERRED_VERSION_nativesdk-go-runtime ?= "${GOVERSION}"
 PREFERRED_VERSION_llvm = "${LLVMVERSION}"
 PREFERRED_VERSION_llvm-native = "${LLVMVERSION}"
 PREFERRED_VERSION_nativesdk-llvm = "${LLVMVERSION}"
+
+# Rust toolchain preferred versions:
+
+PREFERRED_VERSION_cargo ?= "${RUSTVERSION}"
+PREFERRED_VERSION_cargo-native ?= "${RUSTVERSION}"
+PREFERRED_VERSION_libstd-rs ?= "${RUSTVERSION}"
+PREFERRED_VERSION_rust ?= "${RUSTVERSION}"
+PREFERRED_VERSION_rust-cross-${TARGET_ARCH} ?= "${RUSTVERSION}"
+PREFERRED_VERSION_rust-llvm ?= "${RUSTVERSION}"
+PREFERRED_VERSION_rust-llvm-native ?= "${RUSTVERSION}"
+PREFERRED_VERSION_rust-native ?= "${RUSTVERSION}"
+
-- 
2.30.2

