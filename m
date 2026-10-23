Received: from mail-dy1-f170.google.com (mail-dy1-f170.google.com [74.125.82.170])
 by mx.groups.io with SMTP id smtpd.msgproc02-g2.356.1792729675035653535
 for <openembedded-core@lists.openembedded.org>;
 Thu, 22 Oct 2026 21:27:55 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20251104 header.b=H7UtJZJv;
 spf=pass (domain: gmail.com, ip: 74.125.82.170, mailfrom: raj.khem@gmail.com)
Received: by mail-dy1-f170.google.com with SMTP id 5a478bee46e88-33bf40b0c8bso247020eec.0
        for <openembedded-core@lists.openembedded.org>; Thu, 22 Oct 2026 21:27:55 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1792729674; x=1793334474; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=9tWjNNVFHxgpIKepE9ddtZjZCUALfdnGzFgnowzwz1E=;
        b=H7UtJZJvSm7uc48O3qQU6Ub6qN75QJee5shJonscb1F2hCiIUR/D9rsUPnCK2zWhOc
         HgBP1cFRJW9VRikHTmvmwbRJQ92v1Uf+iP/JoKcvjnRwG2S9pzXBvivjuSEyAS1Ha6RB
         TYauKs2R/GLkBasxRuAzVzIq/V12pF+AgHTre5Il95a6n8n59eCFJbgpeh4Kluwjiduz
         YSnA1quuLDTd2ffF503yQiXnY4IyEPDFIoDfd68uOwgd5Oyhkw/Gzq7MMXcQrnl5WiTd
         aVAcVg3RRl0KJ8bhDfBC+zn+myTAkUGFq28DmaHcYSEhM96jdFuH1kCyl2ZBvpU4VE5K
         mC9A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1792729674; x=1793334474;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=9tWjNNVFHxgpIKepE9ddtZjZCUALfdnGzFgnowzwz1E=;
        b=PAwNWBE7rZHmm+Ktjwspir54G3ZxQjKu0i8/rEIYZByx8xSRAOJ9ErIf5FuIYf+HH0
         t+Vzau7UhmZo6MHzsXVei+RuPhigCDfJHi+3ihFUvYyE65J1jbngTrU/g11YxEQSMxE2
         ULRBzH/WA5G0OG+HpfNGYiZNvp64sKHRXl/RTpFgaEDFIaA1EDuWjqm8MjX54uezsIAo
         0dVy4io0c79dQxZBUd6umcpsLoVh8xxVgGdGe+63UhZYW2JdbJBjN3/dJ+xXrX0SXRFx
         VZxCFlxAXQMtvVNik3pHDlwnByuSOcfB/tdlubm0dDInjIYkM1oG06yyEm1+JUBhIaiC
         tJjQ==
X-Gm-Message-State: AFq9FYKhIGWoOjDIMxEn9GerhFHaT6JYzhOtF7wL+1bPCAvnuDQsNzml
	wkIFqiIm5IyNvu/OJGktbO+okhchiKxk6wPGnuzedHsZcyqlJg2PVJeDT/4K+ZUt6GQ=
X-Gm-Gg: AYBFou3T2IbMmeE+X9AXnpwZKTjgJrakHz7WO+WGciePkuWPCO1YtVlfpCmAGRt8ceU
	AIPZto2btb4WgW5oK3OSlf5lF3DlRzRwd/PNg2j6gDPZlWYCi1CVGMAlJlyAjQoYPGbmcRKxUjj
	PHDsk5XTH1oZ+rQyBI+RTdjL1jzZHQ6oh4nbEvmMWLrBLhrBp2mznmU+87teNDGJ1CV9NFSJ0Rt
	i5iPXhCqfF3yeANX4uRYs0V1C8slnjzizWCHx/LxcpiHZeV8M7x4j/BZPbrtDnWJUKDqkjA50zB
	UH3FWKZ9PgLWJOvMPASm5PD65FoaDvzqywp3TIqURp9RZgvNVi1/sidiE8GZwuSyXLNIL7RyL7p
	xRaAvwryEGvH0LKf8FKHRUr8ses7hMjGCtP9owgENvB2swCL+YUlp1mZvW4lW6Qe9nf4xQVI/b0
	TnO+np5rKVd237FnqZrZUFuajQDDYErsYCJLY4sZCWPzPWf+ikoSJJDH/b/oxXuFheNLEhHhqhk
	5jYHYgYGo0MDLdf8S2le5vdOBnVvxJDZesIpUWX3lEYqHXT4c7/yoEZzV1eS9MgpkN7oWlH4IOj
	qNppknm9DrsFQHk4hHCWBrOyUdW6azXRsDm/6osQWqrD015rEEKcAFD5lxhej1KTTGzi79ym5J3
	V9+MLSqEeof1KwWlw8gaqGdx8bADfl+gxtyn6LZa0MQ5+ScmXIXIBE9wpquVpcM76IhgA8v5Z87
	lcDxipC03AFSFA/IuVwumIbPKeN95MH3+TVHtEXZIPRzPJgDvxgn5GaoNiZrLgEC5fyQHd7EE0P
	YPRBA7dgWIgry2E9h1uX8RLJiMQXZ0=
X-Received: by 2002:a05:701b:4212:20b0:163:a197:722d with SMTP id a92af1059eb24-195bfcb2992mr1783620c88.4.1792729674151;
        Thu, 22 Oct 2026 21:27:54 -0700 (PDT)
Return-Path: <raj.khem@gmail.com>
Received: from apollo.tail3ccdd3.ts.net ([147.160.63.35])
        by smtp.gmail.com with ESMTPSA id a92af1059eb24-195eca18b99sm2597400c88.20.2026.10.22.21.27.53
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 22 Oct 2026 21:27:53 -0700 (PDT)
From: Khem Raj <raj.khem@gmail.com>
X-Google-Original-From: Khem Raj <khem.raj@oss.qualcomm.com>
To: openembedded-core@lists.openembedded.org
Cc: Khem Raj <khem.raj@oss.qualcomm.com>
Subject: [PATCH 2/2] python3-uv-build: Update rustix to 1.1.5
Date: Thu, 22 Oct 2026 21:27:49 -0700
Message-ID: <20261023042749.1756636-2-khem.raj@oss.qualcomm.com>
X-Mailer: git-send-email 2.56.0
In-Reply-To: <20261023042749.1756636-1-khem.raj@oss.qualcomm.com>
References: <20261023042749.1756636-1-khem.raj@oss.qualcomm.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by lin-tor-korg-lkml-alma10-1 with HTTPS for <openembedded-core@lists.openembedded.org>; Fri, 23 Oct 2026 04:27:59 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/248474
Content-Type: text/plain; charset="utf-8"

rustix 1.1.4 glob-imports the STATX_* constants from linux-raw-sys for
non-glibc Linux targets, but libc also defines them for musl with its
musl 1.2 layouts, which are used on riscv32, so the build fails:

  error[E0659]: `STATX_MODE` is ambiguous

rustix 1.1.5 imports them explicitly. Add a patch that updates it in
Cargo.lock and regenerate python3-uv-build-crates.inc.

Signed-off-by: Khem Raj <khem.raj@oss.qualcomm.com>
---
 .../python/python3-uv-build-crates.inc        |  4 +-
 ...01-Cargo.lock-Update-rustix-to-1.1.5.patch | 82 +++++++++++++++++++
 .../python/python3-uv-build_0.13.0.bb         |  2 +
 3 files changed, 86 insertions(+), 2 deletions(-)
 create mode 100644 meta/recipes-devtools/python/python3-uv-build/0001-Cargo.lock-Update-rustix-to-1.1.5.patch

diff --git a/meta/recipes-devtools/python/python3-uv-build-crates.inc b/meta/recipes-devtools/python/python3-uv-build-crates.inc
index 40087d0541..336e701554 100644
--- a/meta/recipes-devtools/python/python3-uv-build-crates.inc
+++ b/meta/recipes-devtools/python/python3-uv-build-crates.inc
@@ -174,7 +174,7 @@ SRC_URI += " \
     crate://crates.io/rkyv/0.8.18 \
     crate://crates.io/rkyv_derive/0.8.18 \
     crate://crates.io/rustc-hash/2.1.3 \
-    crate://crates.io/rustix/1.1.4 \
+    crate://crates.io/rustix/1.1.5 \
     crate://crates.io/rustix-linux-procfs/0.1.1 \
     crate://crates.io/rustversion/1.0.22 \
     crate://crates.io/ryu/1.0.23 \
@@ -477,7 +477,7 @@ SRC_URI[rend-0.5.3.sha256sum] = "cadadef317c2f20755a64d7fdc48f9e7178ee6b0e1f7fce
 SRC_URI[rkyv-0.8.18.sha256sum] = "d9776093b7ca170454ab1406954f7b7d97a57c51dc6c0642957fb2ef25c2d399"
 SRC_URI[rkyv_derive-0.8.18.sha256sum] = "1c25ef604ac7dd839d44d64648952ea23c97866f124ff671b0ed2cf3ad9bb06e"
 SRC_URI[rustc-hash-2.1.3.sha256sum] = "6b1e7f9a428571be2dc5bc0505c13fb6bf936822b894ec87abf8a08a4e51742d"
-SRC_URI[rustix-1.1.4.sha256sum] = "b6fe4565b9518b83ef4f91bb47ce29620ca828bd32cb7e408f0062e9930ba190"
+SRC_URI[rustix-1.1.5.sha256sum] = "891efababe418670775f199f0d233d84843c227a0949a883ce15b37c78d6629d"
 SRC_URI[rustix-linux-procfs-0.1.1.sha256sum] = "2fc84bf7e9aa16c4f2c758f27412dc9841341e16aa682d9c7ac308fe3ee12056"
 SRC_URI[rustversion-1.0.22.sha256sum] = "b39cdef0fa800fc44525c84ccb54a029961a8215f9619753635a9c0d2538d46d"
 SRC_URI[ryu-1.0.23.sha256sum] = "9774ba4a74de5f7b1c1451ed6cd5285a32eddb5cccb8cc655a4e50009e06477f"
diff --git a/meta/recipes-devtools/python/python3-uv-build/0001-Cargo.lock-Update-rustix-to-1.1.5.patch b/meta/recipes-devtools/python/python3-uv-build/0001-Cargo.lock-Update-rustix-to-1.1.5.patch
new file mode 100644
index 0000000000..aa4be8d6a1
--- /dev/null
+++ b/meta/recipes-devtools/python/python3-uv-build/0001-Cargo.lock-Update-rustix-to-1.1.5.patch
@@ -0,0 +1,82 @@
+From: Khem Raj <khem.raj@oss.qualcomm.com>
+Date: Thu, 22 Oct 2026 18:00:00 -0700
+Subject: [PATCH] Cargo.lock: Update rustix to 1.1.5
+
+rustix 1.1.4 glob-imports the STATX_* constants from linux-raw-sys for
+non-glibc Linux targets, assuming libc does not define them. libc
+defines them for musl with its musl 1.2 layouts, which libc 0.2.190
+enables by default on riscv32 and earlier versions with the
+libc_unstable_musl_v1_2_3 cfg, so the names become ambiguous:
+
+  error[E0659]: `STATX_MODE` is ambiguous
+    --> rustix-1.1.4/src/fs/statx.rs:78:25
+
+rustix 1.1.5 imports them explicitly instead [1]. Update it with
+'cargo update -p rustix', as uv has done after this release [2].
+
+[1] https://github.com/bytecodealliance/rustix/pull/1676
+[2] https://github.com/astral-sh/uv/pull/22699
+
+Upstream-Status: Backport [https://github.com/astral-sh/uv/pull/22699]
+Signed-off-by: Khem Raj <khem.raj@oss.qualcomm.com>
+---
+ Cargo.lock | 14 +++++++-------
+ 1 file changed, 7 insertions(+), 7 deletions(-)
+
+--- a/Cargo.lock
++++ b/Cargo.lock
+@@ -599,7 +599,7 @@ source = "registry+https://github.com/rust-lang/crates.io-index"
+ checksum = "39cab71617ae0d63f51a36d69f866391735b51691dbda63cf6f96d042b63efeb"
+ dependencies = [
+  "libc",
+- "windows-sys 0.52.0",
++ "windows-sys 0.60.2",
+ ]
+ 
+ [[package]]
+@@ -987,7 +987,7 @@ source = "registry+https://github.com/rust-lang/crates.io-index"
+ checksum = "20fd6de4ccfcc187e38bc21cfa543cb5a302cb86a8b114eb7f0bf0dc9f8ac00f"
+ dependencies = [
+  "io-lifetimes 3.0.1",
+- "windows-sys 0.52.0",
++ "windows-sys 0.60.2",
+ ]
+ 
+ [[package]]
+@@ -1585,15 +1585,15 @@ checksum = "6b1e7f9a428571be2dc5bc0505c13fb6bf936822b894ec87abf8a08a4e51742d"
+ 
+ [[package]]
+ name = "rustix"
+-version = "1.1.4"
++version = "1.1.5"
+ source = "registry+https://github.com/rust-lang/crates.io-index"
+-checksum = "b6fe4565b9518b83ef4f91bb47ce29620ca828bd32cb7e408f0062e9930ba190"
++checksum = "891efababe418670775f199f0d233d84843c227a0949a883ce15b37c78d6629d"
+ dependencies = [
+  "bitflags 2.13.1",
+  "errno",
+  "libc",
+  "linux-raw-sys",
+- "windows-sys 0.52.0",
++ "windows-sys 0.60.2",
+ ]
+ 
+ [[package]]
+@@ -1943,7 +1943,7 @@ dependencies = [
+  "getrandom",
+  "once_cell",
+  "rustix",
+- "windows-sys 0.52.0",
++ "windows-sys 0.60.2",
+ ]
+ 
+ [[package]]
+@@ -2733,7 +2733,7 @@ version = "0.1.11"
+ source = "registry+https://github.com/rust-lang/crates.io-index"
+ checksum = "c2a7b1c03c876122aa43f3020e6c3c3ee5c05081c9a00739faf7503aeba10d22"
+ dependencies = [
+- "windows-sys 0.52.0",
++ "windows-sys 0.60.2",
+ ]
+ 
+ [[package]]
diff --git a/meta/recipes-devtools/python/python3-uv-build_0.13.0.bb b/meta/recipes-devtools/python/python3-uv-build_0.13.0.bb
index 2ad38b2054..97c8675a78 100644
--- a/meta/recipes-devtools/python/python3-uv-build_0.13.0.bb
+++ b/meta/recipes-devtools/python/python3-uv-build_0.13.0.bb
@@ -11,6 +11,8 @@ LIC_FILES_CHKSUM = "file://LICENSE-APACHE;md5=86d3f3a95c324c9479bd8986968f4327 \
                     file://crates/uv-pep508/License-Apache;md5=e23fadd6ceef8c618fc1c65191d846fa \
                     file://crates/uv-pep508/License-BSD;md5=ef7a6027dc4c2389b9afad7e690274c7"
 
+SRC_URI += "file://0001-Cargo.lock-Update-rustix-to-1.1.5.patch"
+
 SRC_URI[sha256sum] = "bd2614f24a58dccd4865d4f86ddd91dd01fd0efab4632e033186a8423b8a3515"
 
 require ${BPN}-crates.inc
