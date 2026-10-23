Received: from mail-dl1-f41.google.com (mail-dl1-f41.google.com [74.125.82.41])
 by mx.groups.io with SMTP id smtpd.msgproc02-g2.355.1792729673843685056
 for <openembedded-core@lists.openembedded.org>;
 Thu, 22 Oct 2026 21:27:53 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20251104 header.b=MMLTGfzx;
 spf=pass (domain: gmail.com, ip: 74.125.82.41, mailfrom: raj.khem@gmail.com)
Received: by mail-dl1-f41.google.com with SMTP id a92af1059eb24-1846bc43c28so559423c88.0
        for <openembedded-core@lists.openembedded.org>; Thu, 22 Oct 2026 21:27:53 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1792729673; x=1793334473; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=dSpCVpFhaleISG7nO83sXg+xj7L3Q4NRd//i1GYuXzA=;
        b=MMLTGfzxHWxbwzHLEF84NvsNBdBGU2smiYGneTmW6mtunQ753N8XVzYo3ogK9WO/E+
         o7tiVRROsxuCXLh6JtktwL6qCrejo2KMaiAO8cHn2RLI7f9HMKSC+JNIpW7zUTRpK9Se
         5LmuCxyTQu2j+18FCLhFGeYa0Pcq72qSs4ALn0N0px4gjqQYNzAl6sUblMQdFyiVpUjc
         4M/7/pEKq8iVSQUKnl6kGz+UG4RkT+WgOkoVWnJe7RnDTWPbi4W8+FJB8BIiMb7we6cq
         Vtr5lqbd4yd5R7FWuejavpyirmuNn4sYr9l507QKSaV+t5zXHhz/32ce7oVBhnY6tMz/
         wduQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1792729673; x=1793334473;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=dSpCVpFhaleISG7nO83sXg+xj7L3Q4NRd//i1GYuXzA=;
        b=dTxfxeKznIq1n+6a5AzrbiShfoxoSqNLkV9wdZ+5V++4MKlPEyBQRZZFSluAaKc+Wx
         v/qs7YqwrVSqdu27ZA1GSHEfDGJohgBF/EsgWLAgFemmFfrCv9SXeCZW/tP7RP68G/V4
         w0+QYtaLgAHGa+GtmjupcL/DoBUMS8yj6kpJmJ0IcptrQ3t22re8of8iTPullxN6pnaA
         VtvA2MgddmWbgUahEFpwvg9Sr+LJExQNiD60M/WUgWSbabnKpxC7/hE/Y9JmiCYh8wJP
         U40QbIE1uAWJ8AzPcbT7uIF3bsoJi27d7B5VPgPXPCxSky8MgCzPOFMDim6kFpuiFo++
         yOVw==
X-Gm-Message-State: AFq9FYKCeEkz95pSUiJzhPUq9awWNemvZdbj+CJAB0E8RGV8/LjkO/RB
	3T1vzorRtXCnLCAsSrngaIRsRqKI9EmZTBpXr0FyEXK7AIa3B9Pg8FU/UYGNhM+AxbA=
X-Gm-Gg: AYBFou2scaocKjURGOc7KSwVF8Ogid8PUkq2Hh6v5GMDowuWxUhV6PelOnL2u9UdzPM
	ZN1HAJDRdqiTeYwLeVNuYrayKNfnpkBFMME1+qqr/zr4kOvXNaoqfYqvV54VI1KpC4g1d9Qjb78
	Pfb2Yijm+TkQKRBq9TirH3aYf7SiFCJTaHVo8TIrpC78iwLBtezovWWwCT5kSa62j3mL7DlBWFh
	wT0694th7UT7nkcARcOUDTNnNglZNtPjv/M7vwGKvBQtI7xQyYnRbF0Z8BDKn51U1Ht7h+HTBJT
	9a2Xgp5a3lyOaDbz67NhSLebdNsZzC6M99LmubBl1LmXzSuo8/kh56X3dposFkfKVv1Ys6vz3Ac
	WRGJRFJH3q2t6ZaVlL/A0rDUnVkqoQBEuG94i4ibtFJzmrMoHVIXu+YLuNViwr3c2hCYhGXdFDr
	+MAksglyonXfzb+fj7PEUJCD1ifUbspYR6jS1yPVNUT7NZIHGRmVeusFekJjbllw9XOz6WbC7AZ
	kNkhvX6+MyhnST+yXK5EBFWFcQgq6SMcm4P4oaBBZa2iEUpPsefCShv31wOggEne9eWDndje3Sm
	5csUCwTwnOrqYQjZmZSg84YwWYK1OypTWWXIC612tUQamTs0IBh4xj/MU8NtMMZ2vH9dj7OGOni
	TFUVzNxw18lGbzzxz6FcvmoOpzDy3cf6caUnUMDkN1luA9bzZfsaBky+PqCtqxkipEPDVX8ZYh9
	F1T3QsIngFYSUrhSuT6mM20qnFwgiXDlp4Za3+/G5KZpYTg+xEmN2QAnUwG+tkVH1HTzYWj8L64
	PNdLWqKRiTlNHdzdi+mA2vTHs7+Rt0=
X-Received: by 2002:a05:7022:3f01:b0:14c:c947:6afb with SMTP id a92af1059eb24-195c4d61986mr1749291c88.15.1792729672822;
        Thu, 22 Oct 2026 21:27:52 -0700 (PDT)
Return-Path: <raj.khem@gmail.com>
Received: from apollo.tail3ccdd3.ts.net ([147.160.63.35])
        by smtp.gmail.com with ESMTPSA id a92af1059eb24-195eca18b99sm2597400c88.20.2026.10.22.21.27.51
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 22 Oct 2026 21:27:52 -0700 (PDT)
From: Khem Raj <raj.khem@gmail.com>
X-Google-Original-From: Khem Raj <khem.raj@oss.qualcomm.com>
To: openembedded-core@lists.openembedded.org
Cc: Khem Raj <khem.raj@oss.qualcomm.com>
Subject: [PATCH 1/2] python3-maturin: Update rustix to 1.1.5
Date: Thu, 22 Oct 2026 21:27:48 -0700
Message-ID: <20261023042749.1756636-1-khem.raj@oss.qualcomm.com>
X-Mailer: git-send-email 2.56.0
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by lin-tor-korg-lkml-alma10-1 with HTTPS for <openembedded-core@lists.openembedded.org>; Fri, 23 Oct 2026 04:27:59 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/248473
Content-Type: text/plain; charset="utf-8"

rustix 1.1.4 glob-imports the STATX_* constants from linux-raw-sys for
non-glibc Linux targets, but libc also defines them for musl with its
musl 1.2 layouts, which are used on riscv32, so the build fails:

  error[E0659]: `STATX_MODE` is ambiguous

rustix 1.1.5 imports them explicitly. Add a patch that updates it in
Cargo.lock and regenerate python3-maturin-crates.inc.

Signed-off-by: Khem Raj <khem.raj@oss.qualcomm.com>
---
 .../python/python3-maturin-crates.inc         |   4 +-
 ...01-Cargo.lock-Update-rustix-to-1.1.5.patch | 144 ++++++++++++++++++
 .../python/python3-maturin_1.15.0.bb          |   2 +
 3 files changed, 148 insertions(+), 2 deletions(-)
 create mode 100644 meta/recipes-devtools/python/python3-maturin/0001-Cargo.lock-Update-rustix-to-1.1.5.patch

diff --git a/meta/recipes-devtools/python/python3-maturin-crates.inc b/meta/recipes-devtools/python/python3-maturin-crates.inc
index 0674a34bca..68507ad754 100644
--- a/meta/recipes-devtools/python/python3-maturin-crates.inc
+++ b/meta/recipes-devtools/python/python3-maturin-crates.inc
@@ -268,7 +268,7 @@ SRC_URI += " \
     crate://crates.io/rustc-hash/2.1.2 \
     crate://crates.io/rustc_version/0.4.1 \
     crate://crates.io/rustflags/0.1.7 \
-    crate://crates.io/rustix/1.1.4 \
+    crate://crates.io/rustix/1.1.5 \
     crate://crates.io/rustls/0.23.38 \
     crate://crates.io/rustls-native-certs/0.8.3 \
     crate://crates.io/rustls-pki-types/1.14.0 \
@@ -742,7 +742,7 @@ SRC_URI[rstest_macros-0.26.1.sha256sum] = "9c845311f0ff7951c5506121a9ad75aec44d0
 SRC_URI[rustc-hash-2.1.2.sha256sum] = "94300abf3f1ae2e2b8ffb7b58043de3d399c73fa6f4b73826402a5c457614dbe"
 SRC_URI[rustc_version-0.4.1.sha256sum] = "cfcb3a22ef46e85b45de6ee7e79d063319ebb6594faafcf1c225ea92ab6e9b92"
 SRC_URI[rustflags-0.1.7.sha256sum] = "a39e0e9135d7a7208ee80aa4e3e4b88f0f5ad7be92153ed70686c38a03db2e63"
-SRC_URI[rustix-1.1.4.sha256sum] = "b6fe4565b9518b83ef4f91bb47ce29620ca828bd32cb7e408f0062e9930ba190"
+SRC_URI[rustix-1.1.5.sha256sum] = "891efababe418670775f199f0d233d84843c227a0949a883ce15b37c78d6629d"
 SRC_URI[rustls-0.23.38.sha256sum] = "69f9466fb2c14ea04357e91413efb882e2a6d4a406e625449bc0a5d360d53a21"
 SRC_URI[rustls-native-certs-0.8.3.sha256sum] = "612460d5f7bea540c490b2b6395d8e34a953e52b491accd6c86c8164c5932a63"
 SRC_URI[rustls-pki-types-1.14.0.sha256sum] = "be040f8b0a225e40375822a563fa9524378b9d63112f53e19ffff34df5d33fdd"
diff --git a/meta/recipes-devtools/python/python3-maturin/0001-Cargo.lock-Update-rustix-to-1.1.5.patch b/meta/recipes-devtools/python/python3-maturin/0001-Cargo.lock-Update-rustix-to-1.1.5.patch
new file mode 100644
index 0000000000..675cc0c7bb
--- /dev/null
+++ b/meta/recipes-devtools/python/python3-maturin/0001-Cargo.lock-Update-rustix-to-1.1.5.patch
@@ -0,0 +1,144 @@
+From: Khem Raj <khem.raj@oss.qualcomm.com>
+Date: Thu, 22 Oct 2026 17:00:00 -0700
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
+'cargo update -p rustix'.
+
+[1] https://github.com/bytecodealliance/rustix/pull/1676
+
+Upstream-Status: Submitted [https://github.com/PyO3/maturin/pull/3344]
+Signed-off-by: Khem Raj <khem.raj@oss.qualcomm.com>
+---
+ Cargo.lock | 28 ++++++++++++++--------------
+ 1 file changed, 14 insertions(+), 14 deletions(-)
+
+--- a/Cargo.lock
++++ b/Cargo.lock
+@@ -59,7 +59,7 @@ version = "1.1.5"
+ source = "registry+https://github.com/rust-lang/crates.io-index"
+ checksum = "40c48f72fd53cd289104fc64099abca73db4166ad86ea0b4341abe65af83dadc"
+ dependencies = [
+- "windows-sys 0.61.2",
++ "windows-sys 0.60.2",
+ ]
+ 
+ [[package]]
+@@ -70,7 +70,7 @@ checksum = "291e6a250ff86cd4a820112fb8898808a366d8f9f58ce16d1f538353ad55747d"
+ dependencies = [
+  "anstyle",
+  "once_cell_polyfill",
+- "windows-sys 0.61.2",
++ "windows-sys 0.60.2",
+ ]
+ 
+ [[package]]
+@@ -879,7 +879,7 @@ dependencies = [
+  "libc",
+  "option-ext",
+  "redox_users",
+- "windows-sys 0.61.2",
++ "windows-sys 0.59.0",
+ ]
+ 
+ [[package]]
+@@ -967,7 +967,7 @@ source = "registry+https://github.com/rust-lang/crates.io-index"
+ checksum = "39cab71617ae0d63f51a36d69f866391735b51691dbda63cf6f96d042b63efeb"
+ dependencies = [
+  "libc",
+- "windows-sys 0.61.2",
++ "windows-sys 0.52.0",
+ ]
+ 
+ [[package]]
+@@ -1478,7 +1478,7 @@ checksum = "3640c1c38b8e4e43584d8df18be5fc6b0aa314ce6ebf51b53313d4306cca8e46"
+ dependencies = [
+  "hermit-abi",
+  "libc",
+- "windows-sys 0.61.2",
++ "windows-sys 0.52.0",
+ ]
+ 
+ [[package]]
+@@ -1961,7 +1961,7 @@ version = "0.50.3"
+ source = "registry+https://github.com/rust-lang/crates.io-index"
+ checksum = "7957b9740744892f114936ab4a57b3f487491bbeafaf8083688b16841a4240e5"
+ dependencies = [
+- "windows-sys 0.61.2",
++ "windows-sys 0.59.0",
+ ]
+ 
+ [[package]]
+@@ -2079,7 +2079,7 @@ source = "registry+https://github.com/rust-lang/crates.io-index"
+ checksum = "7d8fae84b431384b68627d0f9b3b1245fcf9f46f6c0e3dc902e9dce64edd1967"
+ dependencies = [
+  "libc",
+- "windows-sys 0.61.2",
++ "windows-sys 0.45.0",
+ ]
+ 
+ [[package]]
+@@ -2629,15 +2629,15 @@ checksum = "a39e0e9135d7a7208ee80aa4e3e4b88f0f5ad7be92153ed70686c38a03db2e63"
+ 
+ [[package]]
+ name = "rustix"
+-version = "1.1.4"
++version = "1.1.5"
+ source = "registry+https://github.com/rust-lang/crates.io-index"
+-checksum = "b6fe4565b9518b83ef4f91bb47ce29620ca828bd32cb7e408f0062e9930ba190"
++checksum = "891efababe418670775f199f0d233d84843c227a0949a883ce15b37c78d6629d"
+ dependencies = [
+  "bitflags",
+  "errno",
+  "libc",
+  "linux-raw-sys",
+- "windows-sys 0.61.2",
++ "windows-sys 0.52.0",
+ ]
+ 
+ [[package]]
+@@ -2694,7 +2694,7 @@ dependencies = [
+  "security-framework 3.7.0",
+  "security-framework-sys",
+  "webpki-root-certs",
+- "windows-sys 0.61.2",
++ "windows-sys 0.52.0",
+ ]
+ 
+ [[package]]
+@@ -3185,7 +3185,7 @@ dependencies = [
+  "getrandom 0.4.2",
+  "once_cell",
+  "rustix",
+- "windows-sys 0.61.2",
++ "windows-sys 0.52.0",
+ ]
+ 
+ [[package]]
+@@ -3204,7 +3204,7 @@ source = "registry+https://github.com/rust-lang/crates.io-index"
+ checksum = "230a1b821ccbd75b185820a1f1ff7b14d21da1e442e22c0863ea5f08771a8874"
+ dependencies = [
+  "rustix",
+- "windows-sys 0.61.2",
++ "windows-sys 0.59.0",
+ ]
+ 
+ [[package]]
+@@ -3921,7 +3921,7 @@ version = "0.1.11"
+ source = "registry+https://github.com/rust-lang/crates.io-index"
+ checksum = "c2a7b1c03c876122aa43f3020e6c3c3ee5c05081c9a00739faf7503aeba10d22"
+ dependencies = [
+- "windows-sys 0.61.2",
++ "windows-sys 0.52.0",
+ ]
+ 
+ [[package]]
diff --git a/meta/recipes-devtools/python/python3-maturin_1.15.0.bb b/meta/recipes-devtools/python/python3-maturin_1.15.0.bb
index 8ab27b6676..a29e29bda9 100644
--- a/meta/recipes-devtools/python/python3-maturin_1.15.0.bb
+++ b/meta/recipes-devtools/python/python3-maturin_1.15.0.bb
@@ -5,6 +5,8 @@ LICENSE = "Apache-2.0 OR MIT"
 LIC_FILES_CHKSUM = "file://license-apache;md5=1836efb2eb779966696f473ee8540542 \
                     file://license-mit;md5=85fd3b67069cff784d98ebfc7d5c0797"
 
+SRC_URI += "file://0001-Cargo.lock-Update-rustix-to-1.1.5.patch"
+
 SRC_URI[sha256sum] = "94b26cc8e8aba61a5f2099715fe640e18c5f678e9a500408b38761263954228a"
 
 S = "${UNPACKDIR}/maturin-${PV}"
