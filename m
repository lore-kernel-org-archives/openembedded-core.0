Received: from mail5.wrs.com (mail5.wrs.com [192.103.53.11])
 by mx.groups.io with SMTP id smtpd.web09.6613.1630686040773305923
 for <openembedded-core@lists.openembedded.org>;
 Fri, 03 Sep 2021 09:20:41 -0700
Authentication-Results: mx.groups.io;
 dkim=missing; spf=pass (domain: windriver.com, ip: 192.103.53.11, mailfrom: randy.macleod@windriver.com)
Received: from ala-exchng01.corp.ad.wrs.com (ala-exchng01.corp.ad.wrs.com [147.11.82.252])
	by mail5.wrs.com (8.15.2/8.15.2) with ESMTPS id 183GKctE000819
	(version=TLSv1.2 cipher=AES256-GCM-SHA384 bits=256 verify=FAIL)
	for <openembedded-core@lists.openembedded.org>; Fri, 3 Sep 2021 09:20:39 -0700
Received: from ala-exchng01.corp.ad.wrs.com (147.11.82.252) by
 ala-exchng01.corp.ad.wrs.com (147.11.82.252) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2242.12; Fri, 3 Sep 2021 09:20:37 -0700
Received: from vme.wrs.com (172.25.44.7) by ala-exchng01.corp.ad.wrs.com
 (147.11.82.252) with Microsoft SMTP Server id 15.1.2242.12 via Frontend
 Transport; Fri, 3 Sep 2021 09:20:37 -0700
From: "Randy MacLeod" <randy.macleod@windriver.com>
To: <openembedded-core@lists.openembedded.org>
Subject: [PATCH] rust: remove rust_versions.inc since there can be only one.
Date: Fri, 3 Sep 2021 12:20:36 -0400
Message-ID: <20210903162036.221917-1-Randy.MacLeod@windriver.com>
X-Mailer: git-send-email 2.30.2
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain

oe-core has only one version of the Rust toolchain,
so remove the ability to change versions.
This file belongs in the meta-rust layer.

Signed-off-by: Randy MacLeod <Randy.MacLeod@windriver.com>
---
 meta/conf/distro/include/rust_versions.inc | 13 -------------
 1 file changed, 13 deletions(-)
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
-- 
2.30.2

