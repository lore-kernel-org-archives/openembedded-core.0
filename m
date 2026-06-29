Return-Path: <adongare@cisco.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 723C5C43638
	for <webhook@archiver.kernel.org>; Mon, 29 Jun 2026 12:39:24 +0000 (UTC)
Received: from rcdn-iport-9.cisco.com (rcdn-iport-9.cisco.com [173.37.86.80])
 by mx.groups.io with SMTP id smtpd.msgproc02-g2.91207.1782736762823690166
 for <openembedded-core@lists.openembedded.org>;
 Mon, 29 Jun 2026 05:39:22 -0700
Authentication-Results: mx.groups.io;
 dkim=fail reason="dkim: message contains an insecure body length tag" header.i=@cisco.com header.s=iport01 header.b=kuXi90KI;
 spf=pass (domain: cisco.com, ip: 173.37.86.80, mailfrom: adongare@cisco.com)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
  d=cisco.com; i=@cisco.com; l=6237; q=dns/txt;
  s=iport01; t=1782736762; x=1783946362;
  h=from:to:cc:subject:date:message-id:in-reply-to:
   references:mime-version:content-transfer-encoding;
  bh=PDj467sVbyIqMlsAR2DmF8zy1FsAFJQ7a7RrH+22fHM=;
  b=kuXi90KIImahxjFuA6GE+6cuo/JkUt0bEs135O4ngKsOZhAv1dahAyvt
   EB6yWabuPDKnO0HDr0JaisqkEJCYZ46sij4n3QtCnyQKl7RthGuMbxdcD
   xfFeusfK8MKm6h71Ka9jSRR8jbUX5UwCqzGVW9X4eT+rWyfYRbbIqM+X6
   9wuVvWcguhjXy319zJYD4Q942g3Ayfa/mmZnlepB9WI58G5e7vMqgRKj6
   YYnexvuz8uZ+hDnmMtGdRncL3fvuP+ae+bBRXtQMS/8MT3Zw4EDpdxr75
   HcgJnGrk9tgLGGVMKiqCIpU0nLmrhb+C56I2B2Pzyuo1BHWEJkulEsRvt
   w==;
X-CSE-ConnectionGUID: tUm/QafmTKurg3NVr8f0sQ==
X-CSE-MsgGUID: xxCzxWAJQY680Ih6UaGA6A==
X-IPAS-Result: =?us-ascii?q?A0BHAgDHZkJq/43/Ja1UBoJZgld0X0JJA5ZIA4ETnQiBf?=
 =?us-ascii?q?g8BAQEPRA0EAQGFBgKNSwImNAkOAQIEAwIDAQEBAQEBAQEBAQELAQEFAQEBA?=
 =?us-ascii?q?gEHBYEOE4ZPDYZaAQIBAzIBRhAcAwECLysjCBmDAgGCcwIBEbY3GjeCLIEBg?=
 =?us-ascii?q?1oFCQJDUNssAQsUAQWBM4U/iB9bGAGEfCcbG4FygRWCc3aBBYFcAgOBTYZVB?=
 =?us-ascii?q?IIiehKBWh6BeoIIgRiJd0iBHgNZLAFVEw0KCwcFgWYDNRIqFW4yHYEjPheBD?=
 =?us-ascii?q?BsHBYEdgWmBBIR9Ix8DOX+BMHVYZhUwNYECAREeCoFSJwMLGA1IESw3FBsEP?=
 =?us-ascii?q?m4HjF4XD4FwTQF6EwErF2QgKApfE5MbEZI3gTWfWgoog3WMIZU6GjOEBIFXk?=
 =?us-ascii?q?kCSUZkIjgqVU32EaIFoPIFZcBWDIglKGQ+OLAwLg2CCZIIvgQHBcCQ1CwMvA?=
 =?us-ascii?q?QEHAgcOAwuBaJF9AQE?=
IronPort-Data: A9a23:Ol8jcKI3hpH6/4hbFE+RgJQlxSXFcZb7ZxGr2PjKsXjdYENS0DIBm
 GEZW2qDP/yMYDOjL9sib9u0pkkAuMOGyoBlHQcd+CA2RRqmiyZq6fd1j6vUF3nPRiEWZBs/t
 63yUvGZcoZsCCSa/kvxWlTYhSEU/bmSQbbhA/LzNCl0RAt1IA8skhsLd9QR2uaEuvDnRVnR0
 T/Oi5eHYgH9hWQkajh8B5+r8XuDgtyj4Fv0gXRmDRx7lAe2v2UYCpsZOZawIxPQKqFIHvS3T
 vr017qw+GXU5X8FUrtJRZ6iLyXm6paLVeS/oiI+t5qK23CulQRuukoPD8fwXG8M49m/c3+d/
 /0W3XC4YV9B0qQhA43xWTEAe811FfUuFLMqvRFTvOTLp3AqfUcAzN1yMURxBIQW/9pUHHtBr
 tomMmADNgu60rfeLLKTEoGAh+w5J8XteYdasXZ6wHSBUbAtQIvIROPB4towMDUY358VW62BI
 ZBENHw2ME2ojx5nYj/7DLo3kOCuiXDlfhVTqUmeouw85G27IAlZjeC0aYSLJozXLSlTtlaIj
 XDWwE3bOyBEZIS+yWS4+12F2MaayEsXX6pXTtVU7MVCh0WewGEWAhAaWVa35PK+kEOWX9NEN
 1dS/TIjq6U3/kGnQtTxGRqirxa5UgU0QdFcFag+rQqK0KeRu1rfDWkfRTkHY9sj3CMreQEXO
 payt4uBLVRSXHe9ExpxKp/8QeuOBBUo
IronPort-HdrOrdr: A9a23:Rdo4iqsknSY/xzNSdS9jYEep7skDrtV00zEX/kB9WHVpmwKj+P
 xG+85rsiMc5wxxZJhNo7290ey7MBHhHP1OkO0s1NWZPDUO0VHAROoJ0WKh+UyEJ8SUzIBgPM
 lbH5SWIeeAa2SS9fyKgzWQIpIH3MSN9ryuiKP1yndgShwvVoRbhj0Jczpy1iZNNXJ77V1TLu
 vl2vZ6
X-Talos-CUID: =?us-ascii?q?9a23=3Att3bpWvVn72G2rwQTBWOwhi36Is5T3ia9X7eJnO?=
 =?us-ascii?q?bFHxmE5urUw+eoLhdxp8=3D?=
X-Talos-MUID: =?us-ascii?q?9a23=3A2QtFrQ9R+szHICiQiMrvUKuQf9d4yLa+N2kvqKR?=
 =?us-ascii?q?Y65GlNXJNMhi00h3iFw=3D=3D?=
X-IronPort-Anti-Spam-Filtered: true
X-IronPort-AV: E=Sophos;i="6.24,231,1774310400"; 
   d="scan'208";a="501166485"
Received: from rcdn-l-core-04.cisco.com ([173.37.255.141])
  by rcdn-iport-9.cisco.com with ESMTP/TLS/TLS_AES_256_GCM_SHA384; 29 Jun 2026 12:39:21 +0000
Received: from sjc-ads-4153.cisco.com (sjc-ads-4153.cisco.com [171.70.54.174])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256
	 client-signature RSA-PSS (4096 bits) client-digest SHA256)
	(Client CN "ciscoit-managed-infra-smtp-auth.cisco.com", Issuer "Internal Private TLS SubCA" (verified OK))
	by rcdn-l-core-04.cisco.com (Postfix) with ESMTPS id C1C751800018F;
	Mon, 29 Jun 2026 12:39:21 +0000 (GMT)
Received: by sjc-ads-4153.cisco.com (Postfix, from userid 1870532)
	id 76068CC12A7; Mon, 29 Jun 2026 05:39:21 -0700 (PDT)
From: "Anil Dongare -X (adongare - E INFOCHIPS PRIVATE LIMITED at Cisco)" <adongare@cisco.com>
To: openembedded-core@lists.openembedded.org
Cc: xe-linux-external@cisco.com,
	Anil Dongare <adongare@cisco.com>
Subject: [OE-core] [wrynose] [PATCH 2/2] cargo: Fix CVE-2026-5223
Date: Mon, 29 Jun 2026 05:39:16 -0700
Message-ID: <20260629123917.60003-2-adongare@cisco.com>
X-Mailer: git-send-email 2.44.4
In-Reply-To: <20260629123917.60003-1-adongare@cisco.com>
References: <20260629123917.60003-1-adongare@cisco.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Auto-Response-Suppress: DR, OOF, AutoReply
X-Outbound-Client-TLS: VERIFIED;sjc-ads-4153.cisco.com [171.70.54.174];TLSv1.3;TLS_AES_256_GCM_SHA384;256;ciscoit-managed-infra-smtp-auth.cisco.com
X-Outbound-SMTP-Client: 171.70.54.174, sjc-ads-4153.cisco.com
X-Outbound-Node: rcdn-l-core-04.cisco.com
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Mon, 29 Jun 2026 12:39:24 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/239768

From: Anil Dongare <adongare@cisco.com>

This patch applies the upstream fix as referenced in [2], using the commit shown in [1].

[1] https://github.com/rust-lang/cargo/commit/285cebf58911eca5b7f177f5d0b1c53e1f646577
[2] https://security-tracker.debian.org/tracker/CVE-2026-5223

Signed-off-by: Anil Dongare <adongare@cisco.com>
---
 .../rust/files/CVE-2026-5223.patch            | 125 ++++++++++++++++++
 meta/recipes-devtools/rust/rust-source.inc    |   1 +
 2 files changed, 126 insertions(+)
 create mode 100644 meta/recipes-devtools/rust/files/CVE-2026-5223.patch

diff --git a/meta/recipes-devtools/rust/files/CVE-2026-5223.patch b/meta/recipes-devtools/rust/files/CVE-2026-5223.patch
new file mode 100644
index 0000000000..5041dedac5
--- /dev/null
+++ b/meta/recipes-devtools/rust/files/CVE-2026-5223.patch
@@ -0,0 +1,125 @@
+From 285cebf58911eca5b7f177f5d0b1c53e1f646577 Mon Sep 17 00:00:00 2001
+From: Josh Triplett <josh@joshtriplett.org>
+Date: Mon, 30 Mar 2026 10:35:55 -0700
+Subject: [PATCH] CVE-2026-5223: prohibit unpacking symlinks and other
+ unexpected entries
+
+Cargo has historically not allowed creating .crate packages containing
+symlinks. (It packages the symlink target in place of the symlink,
+instead.) So, any package containing a symlink would have to be
+hand-constructed. Such packages are also not allowed on crates.io, so it
+could only come from an alternate registry.
+
+Rather than dealing with symlink traversal attacks when unpacking a
+crate, just prohibit symlinks entirely.
+
+In the process, also prohibit other kinds of unusual entries. As an
+exception, allow character devices but warn about them, because some
+exist in crates on crates.io.
+
+CVE: CVE-2026-5223
+Upstream-Status: Backport [https://github.com/rust-lang/cargo/commit/285cebf58911eca5b7f177f5d0b1c53e1f646577]
+
+(cherry picked from commit 285cebf58911eca5b7f177f5d0b1c53e1f646577)
+Signed-off-by: Anil Dongare <adongare@cisco.com>
+---
+ src/tools/cargo/src/cargo/sources/registry/mod.rs | 10 +++++-
+ src/tools/cargo/tests/testsuite/registry.rs       | 39 ++++++++++-------------
+ 2 files changed, 26 insertions(+), 23 deletions(-)
+
+diff --git a/src/tools/cargo/src/cargo/sources/registry/mod.rs b/src/tools/cargo/src/cargo/sources/registry/mod.rs
+index 04d4ec3..d152a1e 100644
+--- a/src/tools/cargo/src/cargo/sources/registry/mod.rs
++++ b/src/tools/cargo/src/cargo/sources/registry/mod.rs
+@@ -197,7 +197,7 @@ use cargo_util::paths::{self, exclude_from_backups_and_indexing};
+ use flate2::read::GzDecoder;
+ use serde::Deserialize;
+ use serde::Serialize;
+-use tar::Archive;
++use tar::{Archive, EntryType};
+ use tracing::debug;
+ 
+ use crate::core::dependency::Dependency;
+@@ -1088,6 +1088,14 @@ fn unpack(
+             )
+         }
+ 
++        // Prevent unpacking symlinks and other unexpected entry types
++        match entry.header().entry_type() {
++            EntryType::Regular | EntryType::Directory => {}
++            t => anyhow::bail!(
++                "invalid tarball downloaded, contains an entry at {entry_path:?} with invalid type {t:?}",
++            ),
++        }
++
+         // Prevent unpacking the lockfile from the crate itself.
+         if entry_path
+             .file_name()
+diff --git a/src/tools/cargo/tests/testsuite/registry.rs b/src/tools/cargo/tests/testsuite/registry.rs
+index 5a30dad..4a4e836 100644
+--- a/src/tools/cargo/tests/testsuite/registry.rs
++++ b/src/tools/cargo/tests/testsuite/registry.rs
+@@ -3274,8 +3274,7 @@ fn package_lock_inside_package_is_overwritten() {
+ }
+ 
+ #[cargo_test]
+-fn package_lock_as_a_symlink_inside_package_is_overwritten() {
+-    let registry = registry::init();
++fn package_lock_as_a_symlink_inside_package_is_invalid() {
+     let p = project()
+         .file(
+             "Cargo.toml",
+@@ -3298,21 +3297,23 @@ fn package_lock_as_a_symlink_inside_package_is_overwritten() {
+         .symlink(".cargo-ok", "src/lib.rs")
+         .publish();
+ 
+-    p.cargo("check").run();
++    p.cargo("check")
++        .with_status(101)
++        .with_stderr_data(str![[r#"
++[UPDATING] `dummy-registry` index
++[LOCKING] 1 package to latest compatible version
++[DOWNLOADING] crates ...
++[DOWNLOADED] bar v0.0.1 (registry `dummy-registry`)
++[ERROR] failed to download replaced source registry `crates-io`
+ 
+-    let id = SourceId::for_registry(registry.index_url()).unwrap();
+-    let hash = cargo::util::hex::short_hash(&id);
+-    let pkg_root = paths::cargo_home()
+-        .join("registry")
+-        .join("src")
+-        .join(format!("-{}", hash))
+-        .join("bar-0.0.1");
+-    let ok = pkg_root.join(".cargo-ok");
+-    let librs = pkg_root.join("src/lib.rs");
++Caused by:
++  failed to unpack package `bar v0.0.1 (registry `dummy-registry`)`
+ 
+-    // Is correctly overwritten and doesn't affect the file linked to
+-    assert_eq!(ok.metadata().unwrap().len(), 7);
+-    assert_eq!(fs::read_to_string(librs).unwrap(), "pub fn f() {}");
++Caused by:
++  invalid tarball downloaded, contains an entry at "bar-0.0.1/.cargo-ok" with invalid type Symlink
++
++"#]])
++        .run();
+ }
+ 
+ #[cargo_test]
+@@ -4751,13 +4752,7 @@ Caused by:
+   failed to unpack package `bar v1.0.0 (registry `dummy-registry`)`
+ 
+ Caused by:
+-  failed to unpack entry at `bar-1.0.0/smuggled`
+-
+-Caused by:
+-  failed to unpack `[ROOT]/home/.cargo/registry/src/-[HASH]/bar-1.0.0/smuggled`
+-
+-Caused by:
+-  [..] when creating dir [ROOT]/home/.cargo/registry/src/-[HASH]/bar-1.0.0/smuggled
++  invalid tarball downloaded, contains an entry at "bar-1.0.0/smuggled" with invalid type Symlink
+ 
+ "#]])
+         .run();
+-- 
+2.44.4
diff --git a/meta/recipes-devtools/rust/rust-source.inc b/meta/recipes-devtools/rust/rust-source.inc
index 36407fa975..d897b2c262 100644
--- a/meta/recipes-devtools/rust/rust-source.inc
+++ b/meta/recipes-devtools/rust/rust-source.inc
@@ -12,6 +12,7 @@ SRC_URI += "https://static.rust-lang.org/dist/rustc-${RUST_VERSION}-src.tar.xz;n
             file://0001-Adjust-loongarch-assembly-test.patch;patchdir=${RUSTSRC} \
             file://0001-Fix-multiple-option-or-permutations-test-for-big-end.patch;patchdir=${RUSTSRC} \
             file://CVE-2026-5222.patch;patchdir=${RUSTSRC} \
+            file://CVE-2026-5223.patch;patchdir=${RUSTSRC} \
 "
 SRC_URI[rust.sha256sum] = "174fce10ce012317ca995810296d8af199318838180b03d68a853e0f02d4b571"
 
-- 
2.44.4


