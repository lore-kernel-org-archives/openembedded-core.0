Return-Path: <auh@yoctoproject.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id DDB5AC7EE2E
	for <webhook@archiver.kernel.org>; Sun,  1 Jun 2025 13:55:45 +0000 (UTC)
Received: from a27-191.smtp-out.us-west-2.amazonses.com (a27-191.smtp-out.us-west-2.amazonses.com [54.240.27.191])
 by mx.groups.io with SMTP id smtpd.web11.27762.1748786121366811216
 for <openembedded-core@lists.openembedded.org>;
 Sun, 01 Jun 2025 06:55:35 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@yoctoproject.org header.s=j46ser6a2yusdzubpv7m7ewqgesde2ie header.b=spTxfPBh;
 dkim=pass header.i=@amazonses.com header.s=gdwg2y3kokkkj5a55z2ilkup5wp5hhxx header.b=ElYVKL8H;
 spf=pass (domain: us-west-2.amazonses.com, ip: 54.240.27.191, mailfrom: 010101972bc6be10-e54dcba4-7300-4f97-a99c-65ac93fe93d8-000000@us-west-2.amazonses.com)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/simple;
	s=j46ser6a2yusdzubpv7m7ewqgesde2ie; d=yoctoproject.org;
	t=1748786134;
	h=Content-Type:MIME-Version:From:To:Cc:Subject:Message-Id:Date;
	bh=tAhX93xsna2QOS2DasmMHF9QsiBAt5OkoU3KdweV9jU=;
	b=spTxfPBhQnELHVjTccCEosqzp/wnIiWlgHX+MJg1rIRdNeU1UdRV7CoO/XhYvXa1
	GWeWtbtNKN4I5cXA66j+6+qwpdzjaZcMYUTbHnFf4FMSZLwQ28bTn0mCtVCB15WPjjz
	8epaE+CFsrPucbI27Tir6MVPzF7xzInPZLRYwiKU=
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/simple;
	s=gdwg2y3kokkkj5a55z2ilkup5wp5hhxx; d=amazonses.com; t=1748786134;
	h=Content-Type:MIME-Version:From:To:Cc:Subject:Message-Id:Date:Feedback-ID;
	bh=tAhX93xsna2QOS2DasmMHF9QsiBAt5OkoU3KdweV9jU=;
	b=ElYVKL8HHaQzw0Vw4V63MbNdRM48KPK/wNpliDWVrPlh8jiN+Oe3aQiHExIZ5SgR
	m+CgePw1QO7S/ltZ4rnMhOYLq3V/KxogxkxPWn7DXxMwog8THRmvvYtE8aJZnbU8V+P
	RrM9eUBOBPvC9Q+hc86SQHtLQVPUnpB26KJv/h6E=
Content-Type: multipart/mixed; boundary="===============7066542140933248981=="
MIME-Version: 1.0
From: auh@yoctoproject.org
To: Tim Orling <tim.orling@konsulko.com>
Cc: openembedded-core@lists.openembedded.org
Subject: [AUH] python3-maturin: upgrading to 1.8.6 SUCCEEDED
Message-ID: <010101972bc6be10-e54dcba4-7300-4f97-a99c-65ac93fe93d8-000000@us-west-2.amazonses.com>
Date: Sun, 1 Jun 2025 13:55:34 +0000
Feedback-ID: ::1.us-west-2.9np3MYPs3fEaOBysGKSlUD4KtcmPijcmS9Az2Hwf7iQ=:AmazonSES
X-SES-Outgoing: 2025.06.01-54.240.27.191
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Sun, 01 Jun 2025 13:55:45 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/217601

--===============7066542140933248981==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit

Hello,

this email is a notification from the Auto Upgrade Helper
that the automatic attempt to upgrade the recipe(s) *python3-maturin* to *1.8.6* has Succeeded.

Next steps:
    - apply the patch: git am 0001-python3-maturin-upgrade-1.8.3-1.8.6.patch
    - check the changes to upstream patches and summarize them in the commit message,
    - compile an image that contains the package
    - perform some basic sanity tests
    - amend the patch and sign it off: git commit -s --reset-author --amend
    - send it to the appropriate mailing list

Alternatively, if you believe the recipe should not be upgraded at this time,
you can fill RECIPE_NO_UPDATE_REASON in respective recipe file so that
automatic upgrades would no longer be attempted.

Please review the attached files for further information and build/update failures.
Any problem please file a bug at https://bugzilla.yoctoproject.org/enter_bug.cgi?product=Automated%20Update%20Handler

Regards,
The Upgrade Helper

-- >8 --
From d9c6e44d40c1b3b2e236262e82d99746e22b2256 Mon Sep 17 00:00:00 2001
From: Upgrade Helper <auh@yoctoproject.org>
Date: Sun, 1 Jun 2025 09:32:03 +0000
Subject: [PATCH] python3-maturin: upgrade 1.8.3 -> 1.8.6

---
 .../python/python3-maturin-crates.inc         |  20 +-
 ...l-codes-on-riscv32gc-unknown-linux-g.patch | 110 -----
 .../python/python3-maturin_1.8.3.bb           |  43 --
 .../python/python3-maturin_1.8.6.bb           | 405 ++++++++++++++++++
 4 files changed, 415 insertions(+), 163 deletions(-)
 delete mode 100644 meta/recipes-devtools/python/python3-maturin/0001-Define-more-ioctl-codes-on-riscv32gc-unknown-linux-g.patch
 delete mode 100644 meta/recipes-devtools/python/python3-maturin_1.8.3.bb
 create mode 100644 meta/recipes-devtools/python/python3-maturin_1.8.6.bb

diff --git a/meta/recipes-devtools/python/python3-maturin-crates.inc b/meta/recipes-devtools/python/python3-maturin-crates.inc
index 2f196f5657..5c939a09a8 100644
--- a/meta/recipes-devtools/python/python3-maturin-crates.inc
+++ b/meta/recipes-devtools/python/python3-maturin-crates.inc
@@ -34,7 +34,7 @@ SRC_URI += " \
     crate://crates.io/cargo-options/0.7.4 \
     crate://crates.io/cargo-platform/0.1.8 \
     crate://crates.io/cargo-xwin/0.18.4 \
-    crate://crates.io/cargo-zigbuild/0.19.7 \
+    crate://crates.io/cargo-zigbuild/0.20.0 \
     crate://crates.io/cargo_metadata/0.19.0 \
     crate://crates.io/cbindgen/0.28.0 \
     crate://crates.io/cc/1.2.16 \
@@ -60,7 +60,7 @@ SRC_URI += " \
     crate://crates.io/crc/3.2.1 \
     crate://crates.io/crc-catalog/2.4.0 \
     crate://crates.io/crc32fast/1.4.2 \
-    crate://crates.io/crossbeam-channel/0.5.13 \
+    crate://crates.io/crossbeam-channel/0.5.15 \
     crate://crates.io/crossbeam-deque/0.8.5 \
     crate://crates.io/crossbeam-epoch/0.9.18 \
     crate://crates.io/crossbeam-utils/0.8.20 \
@@ -169,10 +169,10 @@ SRC_URI += " \
     crate://crates.io/num-conv/0.1.0 \
     crate://crates.io/number_prefix/0.4.0 \
     crate://crates.io/once_cell/1.20.2 \
-    crate://crates.io/openssl/0.10.70 \
+    crate://crates.io/openssl/0.10.72 \
     crate://crates.io/openssl-macros/0.1.1 \
     crate://crates.io/openssl-probe/0.1.5 \
-    crate://crates.io/openssl-sys/0.9.105 \
+    crate://crates.io/openssl-sys/0.9.107 \
     crate://crates.io/option-ext/0.2.0 \
     crate://crates.io/os_pipe/1.2.0 \
     crate://crates.io/overload/0.1.1 \
@@ -362,7 +362,7 @@ SRC_URI += " \
     crate://crates.io/zeroize/1.8.1 \
     crate://crates.io/zerovec/0.10.4 \
     crate://crates.io/zerovec-derive/0.10.3 \
-    crate://crates.io/zip/2.2.3 \
+    crate://crates.io/zip/2.3.0 \
     crate://crates.io/zopfli/0.8.1 \
 "
 
@@ -398,7 +398,7 @@ SRC_URI[cargo-config2-0.1.26.sha256sum] = "d83ce0be8bd1479e5de6202def660e6c7e27e
 SRC_URI[cargo-options-0.7.4.sha256sum] = "f3540247c0a37a76eb324acc238dc617786ea22c43b95da560c82a8f2714321f"
 SRC_URI[cargo-platform-0.1.8.sha256sum] = "24b1f0365a6c6bb4020cd05806fd0d33c44d38046b8bd7f0e40814b9763cabfc"
 SRC_URI[cargo-xwin-0.18.4.sha256sum] = "60f1954e4ffa0f4c47b3df5e6e9508706d8dcaa56152cd672dcee02930ba0326"
-SRC_URI[cargo-zigbuild-0.19.7.sha256sum] = "04cc649328f39bbf1ef92ef753406e1785ff1074941c398e5214b6c74d318a9e"
+SRC_URI[cargo-zigbuild-0.20.0.sha256sum] = "3f6e9e856390d5b0a859acaeda16528f8a61c964bdb894c3216c254908f1c2ea"
 SRC_URI[cargo_metadata-0.19.0.sha256sum] = "afc309ed89476c8957c50fb818f56fe894db857866c3e163335faa91dc34eb85"
 SRC_URI[cbindgen-0.28.0.sha256sum] = "eadd868a2ce9ca38de7eeafdcec9c7065ef89b42b32f0839278d55f35c54d1ff"
 SRC_URI[cc-1.2.16.sha256sum] = "be714c154be609ec7f5dad223a33bf1482fff90472de28f7362806e6d4832b8c"
@@ -424,7 +424,7 @@ SRC_URI[cpufeatures-0.2.12.sha256sum] = "53fe5e26ff1b7aef8bca9c6080520cfb8d9333c
 SRC_URI[crc-3.2.1.sha256sum] = "69e6e4d7b33a94f0991c26729976b10ebde1d34c3ee82408fb536164fa10d636"
 SRC_URI[crc-catalog-2.4.0.sha256sum] = "19d374276b40fb8bbdee95aef7c7fa6b5316ec764510eb64b8dd0e2ed0d7e7f5"
 SRC_URI[crc32fast-1.4.2.sha256sum] = "a97769d94ddab943e4510d138150169a2758b5ef3eb191a9ee688de3e23ef7b3"
-SRC_URI[crossbeam-channel-0.5.13.sha256sum] = "33480d6946193aa8033910124896ca395333cae7e2d1113d1fef6c3272217df2"
+SRC_URI[crossbeam-channel-0.5.15.sha256sum] = "82b8f8f868b36967f9606790d1903570de9ceaf870a7bf9fbbd3016d636a2cb2"
 SRC_URI[crossbeam-deque-0.8.5.sha256sum] = "613f8cc01fe9cf1a3eb3d7f488fd2fa8388403e97039e2f73692932e291a770d"
 SRC_URI[crossbeam-epoch-0.9.18.sha256sum] = "5b82ac4a3c2ca9c3460964f020e1402edd5753411d7737aa39c3714ad1b5420e"
 SRC_URI[crossbeam-utils-0.8.20.sha256sum] = "22ec99545bb0ed0ea7bb9b8e1e9122ea386ff8a48c0922e43f36d45ab09e0e80"
@@ -533,10 +533,10 @@ SRC_URI[nu-ansi-term-0.46.0.sha256sum] = "77a8165726e8236064dbb45459242600304b42
 SRC_URI[num-conv-0.1.0.sha256sum] = "51d515d32fb182ee37cda2ccdcb92950d6a3c2893aa280e540671c2cd0f3b1d9"
 SRC_URI[number_prefix-0.4.0.sha256sum] = "830b246a0e5f20af87141b25c173cd1b609bd7779a4617d6ec582abaf90870f3"
 SRC_URI[once_cell-1.20.2.sha256sum] = "1261fe7e33c73b354eab43b1273a57c8f967d0391e80353e51f764ac02cf6775"
-SRC_URI[openssl-0.10.70.sha256sum] = "61cfb4e166a8bb8c9b55c500bc2308550148ece889be90f609377e58140f42c6"
+SRC_URI[openssl-0.10.72.sha256sum] = "fedfea7d58a1f73118430a55da6a286e7b044961736ce96a16a17068ea25e5da"
 SRC_URI[openssl-macros-0.1.1.sha256sum] = "a948666b637a0f465e8564c73e89d4dde00d72d4d473cc972f390fc3dcee7d9c"
 SRC_URI[openssl-probe-0.1.5.sha256sum] = "ff011a302c396a5197692431fc1948019154afc178baf7d8e37367442a4601cf"
-SRC_URI[openssl-sys-0.9.105.sha256sum] = "8b22d5b84be05a8d6947c7cb71f7c849aa0f112acd4bf51c2a7c1c988ac0a9dc"
+SRC_URI[openssl-sys-0.9.107.sha256sum] = "8288979acd84749c744a9014b4382d42b8f7b2592847b5afb2ed29e5d16ede07"
 SRC_URI[option-ext-0.2.0.sha256sum] = "04744f49eae99ab78e0d5c0b603ab218f515ea8cfe5a456d7629ad883a3b6e7d"
 SRC_URI[os_pipe-1.2.0.sha256sum] = "29d73ba8daf8fac13b0501d1abeddcfe21ba7401ada61a819144b6c2a4f32209"
 SRC_URI[overload-0.1.1.sha256sum] = "b15813163c1d831bf4a13c3610c05c0d03b39feb07f7e09fa234dac9b15aaf39"
@@ -726,5 +726,5 @@ SRC_URI[zerofrom-derive-0.1.5.sha256sum] = "595eed982f7d355beb85837f651fa22e90b3
 SRC_URI[zeroize-1.8.1.sha256sum] = "ced3678a2879b30306d323f4542626697a464a97c0a07c9aebf7ebca65cd4dde"
 SRC_URI[zerovec-0.10.4.sha256sum] = "aa2b893d79df23bfb12d5461018d408ea19dfafe76c2c7ef6d4eba614f8ff079"
 SRC_URI[zerovec-derive-0.10.3.sha256sum] = "6eafa6dfb17584ea3e2bd6e76e0cc15ad7af12b09abdd1ca55961bed9b1063c6"
-SRC_URI[zip-2.2.3.sha256sum] = "b280484c454e74e5fff658bbf7df8fdbe7a07c6b2de4a53def232c15ef138f3a"
+SRC_URI[zip-2.3.0.sha256sum] = "84e9a772a54b54236b9b744aaaf8d7be01b4d6e99725523cb82cb32d1c81b1d7"
 SRC_URI[zopfli-0.8.1.sha256sum] = "e5019f391bac5cf252e93bbcc53d039ffd62c7bfb7c150414d61369afe57e946"
diff --git a/meta/recipes-devtools/python/python3-maturin/0001-Define-more-ioctl-codes-on-riscv32gc-unknown-linux-g.patch b/meta/recipes-devtools/python/python3-maturin/0001-Define-more-ioctl-codes-on-riscv32gc-unknown-linux-g.patch
deleted file mode 100644
index aceefa7967..0000000000
--- a/meta/recipes-devtools/python/python3-maturin/0001-Define-more-ioctl-codes-on-riscv32gc-unknown-linux-g.patch
+++ /dev/null
@@ -1,110 +0,0 @@
-From 4b439b0953573e0383da7e092b1f516ba21f3398 Mon Sep 17 00:00:00 2001
-From: Dan Gohman <dev@sunfishcode.online>
-Date: Sun, 6 Apr 2025 05:22:49 -0700
-Subject: [PATCH] Define Linux ioctl codes on more architectures.
-
-Define ioctl codes including `FICLONE` and `FS_IOC32_GETVERSION` using
-`_IOR` and `_IOW` so that they're automatically supported on all
-architectures, including riscv32gc-unknown-linux-gnu.
-
-Upstream-Status: Backport [https://github.com/rust-lang/libc/pull/4382/]
-Signed-off-by: Khem Raj <raj.khem@gmail.com>
----
- src/unix/linux_like/linux/arch/generic/mod.rs | 75 ++++---------------
- 1 file changed, 15 insertions(+), 60 deletions(-)
-
---- a/src/unix/linux_like/linux/arch/generic/mod.rs
-+++ b/src/unix/linux_like/linux/arch/generic/mod.rs
-@@ -1,5 +1,5 @@
- use crate::prelude::*;
--use crate::Ioctl;
-+use crate::{Ioctl, _IOR, _IOW};
- 
- s! {
-     pub struct termios2 {
-@@ -116,21 +116,8 @@ cfg_if! {
- // pub const SO_PREFER_BUSY_POLL: c_int = 69;
- // pub const SO_BUSY_POLL_BUDGET: c_int = 70;
- 
--cfg_if! {
--    if #[cfg(any(
--        target_arch = "x86",
--        target_arch = "x86_64",
--        target_arch = "arm",
--        target_arch = "aarch64",
--        target_arch = "riscv64",
--        target_arch = "s390x",
--        target_arch = "csky",
--        target_arch = "loongarch64"
--    ))] {
--        pub const FICLONE: c_ulong = 0x40049409;
--        pub const FICLONERANGE: c_ulong = 0x4020940D;
--    }
--}
-+pub const FICLONE: Ioctl = _IOW::<c_int>(0x94, 9) as Ioctl;
-+pub const FICLONERANGE: Ioctl = _IOW::<crate::file_clone_range>(0x94, 13) as Ioctl;
- 
- // Defined in unix/linux_like/mod.rs
- // pub const SCM_TIMESTAMP: c_int = SO_TIMESTAMP;
-@@ -248,49 +235,18 @@ pub const TUNGETVNETBE: Ioctl = 0x800454
- pub const TUNSETSTEERINGEBPF: Ioctl = 0x800454e0;
- pub const TUNSETFILTEREBPF: Ioctl = 0x800454e1;
- 
--cfg_if! {
--    // Those type are constructed using the _IOC macro
--    // DD-SS_SSSS_SSSS_SSSS-TTTT_TTTT-NNNN_NNNN
--    // where D stands for direction (either None (00), Read (01) or Write (11))
--    // where S stands for size (int, long, struct...)
--    // where T stands for type ('f','v','X'...)
--    // where N stands for NR (NumbeR)
--    if #[cfg(any(
--        target_arch = "x86",
--        target_arch = "arm",
--        target_arch = "csky"
--    ))] {
--        pub const FS_IOC_GETFLAGS: Ioctl = 0x80046601;
--        pub const FS_IOC_SETFLAGS: Ioctl = 0x40046602;
--        pub const FS_IOC_GETVERSION: Ioctl = 0x80047601;
--        pub const FS_IOC_SETVERSION: Ioctl = 0x40047602;
--        pub const FS_IOC32_GETFLAGS: Ioctl = 0x80046601;
--        pub const FS_IOC32_SETFLAGS: Ioctl = 0x40046602;
--        pub const FS_IOC32_GETVERSION: Ioctl = 0x80047601;
--        pub const FS_IOC32_SETVERSION: Ioctl = 0x40047602;
--        pub const TUNATTACHFILTER: Ioctl = 0x400854d5;
--        pub const TUNDETACHFILTER: Ioctl = 0x400854d6;
--        pub const TUNGETFILTER: Ioctl = 0x800854db;
--    } else if #[cfg(any(
--        target_arch = "x86_64",
--        target_arch = "riscv64",
--        target_arch = "aarch64",
--        target_arch = "s390x",
--        target_arch = "loongarch64"
--    ))] {
--        pub const FS_IOC_GETFLAGS: Ioctl = 0x80086601;
--        pub const FS_IOC_SETFLAGS: Ioctl = 0x40086602;
--        pub const FS_IOC_GETVERSION: Ioctl = 0x80087601;
--        pub const FS_IOC_SETVERSION: Ioctl = 0x40087602;
--        pub const FS_IOC32_GETFLAGS: Ioctl = 0x80046601;
--        pub const FS_IOC32_SETFLAGS: Ioctl = 0x40046602;
--        pub const FS_IOC32_GETVERSION: Ioctl = 0x80047601;
--        pub const FS_IOC32_SETVERSION: Ioctl = 0x40047602;
--        pub const TUNATTACHFILTER: Ioctl = 0x401054d5;
--        pub const TUNDETACHFILTER: Ioctl = 0x401054d6;
--        pub const TUNGETFILTER: Ioctl = 0x801054db;
--    }
--}
-+pub const FS_IOC_GETFLAGS: Ioctl = _IOR::<c_long>('f' as u32, 1) as Ioctl;
-+pub const FS_IOC_SETFLAGS: Ioctl = _IOW::<c_long>('f' as u32, 2) as Ioctl;
-+pub const FS_IOC_GETVERSION: Ioctl = _IOR::<c_long>('v' as u32, 1) as Ioctl;
-+pub const FS_IOC_SETVERSION: Ioctl = _IOW::<c_long>('v' as u32, 2) as Ioctl;
-+pub const FS_IOC32_GETFLAGS: Ioctl = _IOR::<c_int>('f' as u32, 1) as Ioctl;
-+pub const FS_IOC32_SETFLAGS: Ioctl = _IOW::<c_int>('f' as u32, 2) as Ioctl;
-+pub const FS_IOC32_GETVERSION: Ioctl = _IOR::<c_int>('v' as u32, 1) as Ioctl;
-+pub const FS_IOC32_SETVERSION: Ioctl = _IOW::<c_int>('v' as u32, 2) as Ioctl;
-+
-+pub const TUNATTACHFILTER: Ioctl = _IOW::<crate::sock_fprog>('T' as u32, 213) as Ioctl;
-+pub const TUNDETACHFILTER: Ioctl = _IOW::<crate::sock_fprog>('T' as u32, 214) as Ioctl;
-+pub const TUNGETFILTER: Ioctl = _IOR::<crate::sock_fprog>('T' as u32, 219) as Ioctl;
- 
- cfg_if! {
-     if #[cfg(any(target_arch = "arm", target_arch = "s390x"))] {
diff --git a/meta/recipes-devtools/python/python3-maturin_1.8.3.bb b/meta/recipes-devtools/python/python3-maturin_1.8.3.bb
deleted file mode 100644
index 08975e177f..0000000000
--- a/meta/recipes-devtools/python/python3-maturin_1.8.3.bb
+++ /dev/null
@@ -1,43 +0,0 @@
-SUMMARY = "Build and publish crates with pyo3, rust-cpython, cffi bindings and rust binaries as python packages"
-HOMEPAGE = "https://github.com/pyo3/maturin"
-SECTION = "devel/python"
-LICENSE = "MIT | Apache-2.0"
-LIC_FILES_CHKSUM = "file://license-apache;md5=1836efb2eb779966696f473ee8540542 \
-                    file://license-mit;md5=85fd3b67069cff784d98ebfc7d5c0797"
-
-SRC_URI += "file://0001-Define-more-ioctl-codes-on-riscv32gc-unknown-linux-g.patch;patchdir=${CARGO_VENDORING_DIRECTORY}/libc-0.2.167"
-SRC_URI[sha256sum] = "304762f86fd53a8031b1bf006d12572a2aa0a5235485031113195cc0152e1e12"
-
-S = "${WORKDIR}/maturin-${PV}"
-
-CFLAGS += "-ffile-prefix-map=${CARGO_HOME}=${TARGET_DBGSRC_DIR}/cargo_home"
-
-DEPENDS += "\
-    python3-setuptools-rust-native \
-    python3-semantic-version-native \
-    python3-setuptools-rust \
-"
-
-require ${BPN}-crates.inc
-
-inherit pypi cargo-update-recipe-crates python_pyo3 python_setuptools_build_meta
-
-do_configure() {
-    python_pyo3_do_configure
-    cargo_common_do_configure
-    python_pep517_do_configure
-}
-
-RDEPENDS:${PN} += "\
-    cargo \
-    python3-json \
-    rust \
-"
-
-RRECOMMENDS:${PN} += "\
-    python3-ensurepip \
-    python3-pip \
-    python3-venv \
-"
-
-BBCLASSEXTEND = "native nativesdk"
diff --git a/meta/recipes-devtools/python/python3-maturin_1.8.6.bb b/meta/recipes-devtools/python/python3-maturin_1.8.6.bb
new file mode 100644
index 0000000000..d7aa9fc99f
--- /dev/null
+++ b/meta/recipes-devtools/python/python3-maturin_1.8.6.bb
@@ -0,0 +1,405 @@
+SUMMARY = "Build and publish crates with pyo3, rust-cpython, cffi bindings and rust binaries as python packages"
+HOMEPAGE = "https://github.com/pyo3/maturin"
+SECTION = "devel/python"
+LICENSE = "MIT | Apache-2.0"
+LIC_FILES_CHKSUM = "file://license-apache;md5=1836efb2eb779966696f473ee8540542 \
+                    file://license-mit;md5=85fd3b67069cff784d98ebfc7d5c0797"
+
+SRC_URI += "crate://crates.io/adler2/2.0.0 \
+           crate://crates.io/ahash/0.8.11 \
+           crate://crates.io/aho-corasick/1.1.3 \
+           crate://crates.io/allocator-api2/0.2.18 \
+           crate://crates.io/anstream/0.6.14 \
+           crate://crates.io/anstyle/1.0.7 \
+           crate://crates.io/anstyle-parse/0.2.4 \
+           crate://crates.io/anstyle-query/1.1.0 \
+           crate://crates.io/anstyle-wincon/3.0.3 \
+           crate://crates.io/anyhow/1.0.89 \
+           crate://crates.io/arbitrary/1.4.1 \
+           crate://crates.io/autocfg/1.3.0 \
+           crate://crates.io/automod/1.0.14 \
+           crate://crates.io/base64/0.21.7 \
+           crate://crates.io/base64/0.22.1 \
+           crate://crates.io/bitflags/1.3.2 \
+           crate://crates.io/bitflags/2.5.0 \
+           crate://crates.io/block-buffer/0.10.4 \
+           crate://crates.io/boxcar/0.2.8 \
+           crate://crates.io/bstr/1.10.0 \
+           crate://crates.io/bumpalo/3.16.0 \
+           crate://crates.io/byteorder/1.5.0 \
+           crate://crates.io/bytes/1.9.0 \
+           crate://crates.io/bytesize/1.3.0 \
+           crate://crates.io/bzip2/0.5.2 \
+           crate://crates.io/bzip2-sys/0.1.13+1.0.8 \
+           crate://crates.io/cab/0.6.0 \
+           crate://crates.io/camino/1.1.9 \
+           crate://crates.io/cargo-config2/0.1.26 \
+           crate://crates.io/cargo-options/0.7.4 \
+           crate://crates.io/cargo-platform/0.1.8 \
+           crate://crates.io/cargo-xwin/0.18.4 \
+           crate://crates.io/cargo-zigbuild/0.20.0 \
+           crate://crates.io/cargo_metadata/0.19.0 \
+           crate://crates.io/cbindgen/0.28.0 \
+           crate://crates.io/cc/1.2.16 \
+           crate://crates.io/cfb/0.10.0 \
+           crate://crates.io/cfg-if/1.0.0 \
+           crate://crates.io/charset/0.1.5 \
+           crate://crates.io/chumsky/0.9.3 \
+           crate://crates.io/clap/4.5.7 \
+           crate://crates.io/clap_builder/4.5.7 \
+           crate://crates.io/clap_complete/4.5.5 \
+           crate://crates.io/clap_complete_command/0.6.1 \
+           crate://crates.io/clap_complete_nushell/4.5.2 \
+           crate://crates.io/clap_derive/4.5.5 \
+           crate://crates.io/clap_lex/0.7.1 \
+           crate://crates.io/cli-table/0.4.7 \
+           crate://crates.io/colorchoice/1.0.1 \
+           crate://crates.io/configparser/3.1.0 \
+           crate://crates.io/console/0.15.8 \
+           crate://crates.io/content_inspector/0.2.4 \
+           crate://crates.io/core-foundation/0.9.4 \
+           crate://crates.io/core-foundation-sys/0.8.6 \
+           crate://crates.io/cpufeatures/0.2.12 \
+           crate://crates.io/crc/3.2.1 \
+           crate://crates.io/crc-catalog/2.4.0 \
+           crate://crates.io/crc32fast/1.4.2 \
+           crate://crates.io/crossbeam-channel/0.5.15 \
+           crate://crates.io/crossbeam-deque/0.8.5 \
+           crate://crates.io/crossbeam-epoch/0.9.18 \
+           crate://crates.io/crossbeam-utils/0.8.20 \
+           crate://crates.io/crypto-common/0.1.6 \
+           crate://crates.io/data-encoding/2.6.0 \
+           crate://crates.io/deranged/0.3.11 \
+           crate://crates.io/derive_arbitrary/1.4.1 \
+           crate://crates.io/dialoguer/0.11.0 \
+           crate://crates.io/diff/0.1.13 \
+           crate://crates.io/digest/0.10.7 \
+           crate://crates.io/dirs/5.0.1 \
+           crate://crates.io/dirs-sys/0.4.1 \
+           crate://crates.io/displaydoc/0.2.5 \
+           crate://crates.io/dissimilar/1.0.9 \
+           crate://crates.io/dunce/1.0.5 \
+           crate://crates.io/dyn-clone/1.0.17 \
+           crate://crates.io/either/1.13.0 \
+           crate://crates.io/encode_unicode/0.3.6 \
+           crate://crates.io/encoding_rs/0.8.34 \
+           crate://crates.io/equivalent/1.0.1 \
+           crate://crates.io/errno/0.3.9 \
+           crate://crates.io/expect-test/1.5.0 \
+           crate://crates.io/fastrand/2.1.0 \
+           crate://crates.io/fat-macho/0.4.9 \
+           crate://crates.io/filetime/0.2.23 \
+           crate://crates.io/flate2/1.0.33 \
+           crate://crates.io/fnv/1.0.7 \
+           crate://crates.io/foreign-types/0.3.2 \
+           crate://crates.io/foreign-types-shared/0.1.1 \
+           crate://crates.io/form_urlencoded/1.2.1 \
+           crate://crates.io/fs-err/3.0.0 \
+           crate://crates.io/fs4/0.12.0 \
+           crate://crates.io/futures/0.3.30 \
+           crate://crates.io/futures-channel/0.3.31 \
+           crate://crates.io/futures-core/0.3.31 \
+           crate://crates.io/futures-executor/0.3.30 \
+           crate://crates.io/futures-io/0.3.31 \
+           crate://crates.io/futures-macro/0.3.31 \
+           crate://crates.io/futures-sink/0.3.31 \
+           crate://crates.io/futures-task/0.3.31 \
+           crate://crates.io/futures-timer/3.0.3 \
+           crate://crates.io/futures-util/0.3.31 \
+           crate://crates.io/generic-array/0.14.7 \
+           crate://crates.io/getrandom/0.2.15 \
+           crate://crates.io/glob/0.3.1 \
+           crate://crates.io/globset/0.4.15 \
+           crate://crates.io/goblin/0.9.2 \
+           crate://crates.io/hashbrown/0.14.5 \
+           crate://crates.io/hashbrown/0.15.2 \
+           crate://crates.io/heck/0.4.1 \
+           crate://crates.io/heck/0.5.0 \
+           crate://crates.io/home/0.5.9 \
+           crate://crates.io/humantime/2.1.0 \
+           crate://crates.io/humantime-serde/1.1.1 \
+           crate://crates.io/icu_collections/1.5.0 \
+           crate://crates.io/icu_locid/1.5.0 \
+           crate://crates.io/icu_locid_transform/1.5.0 \
+           crate://crates.io/icu_locid_transform_data/1.5.0 \
+           crate://crates.io/icu_normalizer/1.5.0 \
+           crate://crates.io/icu_normalizer_data/1.5.0 \
+           crate://crates.io/icu_properties/1.5.1 \
+           crate://crates.io/icu_properties_data/1.5.0 \
+           crate://crates.io/icu_provider/1.5.0 \
+           crate://crates.io/icu_provider_macros/1.5.0 \
+           crate://crates.io/idna/1.0.3 \
+           crate://crates.io/idna_adapter/1.2.0 \
+           crate://crates.io/ignore/0.4.23 \
+           crate://crates.io/indexmap/2.6.0 \
+           crate://crates.io/indicatif/0.17.9 \
+           crate://crates.io/indoc/2.0.5 \
+           crate://crates.io/is_terminal_polyfill/1.70.0 \
+           crate://crates.io/itertools/0.12.1 \
+           crate://crates.io/itertools/0.13.0 \
+           crate://crates.io/itoa/1.0.11 \
+           crate://crates.io/js-sys/0.3.73 \
+           crate://crates.io/keyring/2.3.3 \
+           crate://crates.io/lazy_static/1.4.0 \
+           crate://crates.io/lddtree/0.3.7 \
+           crate://crates.io/libc/0.2.167 \
+           crate://crates.io/libmimalloc-sys/0.1.39 \
+           crate://crates.io/libredox/0.1.3 \
+           crate://crates.io/linux-keyutils/0.2.4 \
+           crate://crates.io/linux-raw-sys/0.4.14 \
+           crate://crates.io/litemap/0.7.3 \
+           crate://crates.io/lock_api/0.4.12 \
+           crate://crates.io/lockfree-object-pool/0.1.6 \
+           crate://crates.io/log/0.4.22 \
+           crate://crates.io/lzma-sys/0.1.20 \
+           crate://crates.io/lzxd/0.2.5 \
+           crate://crates.io/mailparse/0.15.0 \
+           crate://crates.io/matchers/0.1.0 \
+           crate://crates.io/memchr/2.7.4 \
+           crate://crates.io/mimalloc/0.1.43 \
+           crate://crates.io/mime/0.3.17 \
+           crate://crates.io/mime_guess/2.0.4 \
+           crate://crates.io/minijinja/2.5.0 \
+           crate://crates.io/minimal-lexical/0.2.1 \
+           crate://crates.io/miniz_oxide/0.8.0 \
+           crate://crates.io/msi/0.8.0 \
+           crate://crates.io/multipart/0.18.0 \
+           crate://crates.io/native-tls/0.2.12 \
+           crate://crates.io/nom/7.1.3 \
+           crate://crates.io/normalize-line-endings/0.3.0 \
+           crate://crates.io/normpath/1.2.0 \
+           crate://crates.io/nu-ansi-term/0.46.0 \
+           crate://crates.io/num-conv/0.1.0 \
+           crate://crates.io/number_prefix/0.4.0 \
+           crate://crates.io/once_cell/1.20.2 \
+           crate://crates.io/openssl/0.10.72 \
+           crate://crates.io/openssl-macros/0.1.1 \
+           crate://crates.io/openssl-probe/0.1.5 \
+           crate://crates.io/openssl-sys/0.9.107 \
+           crate://crates.io/option-ext/0.2.0 \
+           crate://crates.io/os_pipe/1.2.0 \
+           crate://crates.io/overload/0.1.1 \
+           crate://crates.io/parking_lot/0.12.3 \
+           crate://crates.io/parking_lot_core/0.9.10 \
+           crate://crates.io/paste/1.0.15 \
+           crate://crates.io/path-slash/0.2.1 \
+           crate://crates.io/pep440_rs/0.7.3 \
+           crate://crates.io/pep508_rs/0.9.2 \
+           crate://crates.io/percent-encoding/2.3.1 \
+           crate://crates.io/pin-project-lite/0.2.15 \
+           crate://crates.io/pin-utils/0.1.0 \
+           crate://crates.io/pkg-config/0.3.30 \
+           crate://crates.io/plain/0.2.3 \
+           crate://crates.io/platform-info/2.0.3 \
+           crate://crates.io/portable-atomic/1.6.0 \
+           crate://crates.io/powerfmt/0.2.0 \
+           crate://crates.io/ppv-lite86/0.2.17 \
+           crate://crates.io/pretty_assertions/1.4.1 \
+           crate://crates.io/proc-macro-crate/3.1.0 \
+           crate://crates.io/proc-macro2/1.0.92 \
+           crate://crates.io/psm/0.1.21 \
+           crate://crates.io/pyproject-toml/0.13.4 \
+           crate://crates.io/python-pkginfo/0.6.5 \
+           crate://crates.io/quote/1.0.37 \
+           crate://crates.io/quoted_printable/0.5.0 \
+           crate://crates.io/rand/0.8.5 \
+           crate://crates.io/rand_chacha/0.3.1 \
+           crate://crates.io/rand_core/0.6.4 \
+           crate://crates.io/rayon/1.10.0 \
+           crate://crates.io/rayon-core/1.12.1 \
+           crate://crates.io/redox_syscall/0.4.1 \
+           crate://crates.io/redox_syscall/0.5.1 \
+           crate://crates.io/redox_users/0.4.5 \
+           crate://crates.io/regex/1.11.1 \
+           crate://crates.io/regex-automata/0.1.10 \
+           crate://crates.io/regex-automata/0.4.9 \
+           crate://crates.io/regex-syntax/0.6.29 \
+           crate://crates.io/regex-syntax/0.8.5 \
+           crate://crates.io/relative-path/1.9.3 \
+           crate://crates.io/rfc2047-decoder/1.0.6 \
+           crate://crates.io/ring/0.17.13 \
+           crate://crates.io/rstest/0.22.0 \
+           crate://crates.io/rstest_macros/0.22.0 \
+           crate://crates.io/rustc-hash/2.0.0 \
+           crate://crates.io/rustc_version/0.4.1 \
+           crate://crates.io/rustflags/0.1.6 \
+           crate://crates.io/rustix/0.38.41 \
+           crate://crates.io/rustls/0.23.19 \
+           crate://crates.io/rustls-pemfile/2.1.3 \
+           crate://crates.io/rustls-pki-types/1.10.0 \
+           crate://crates.io/rustls-webpki/0.102.8 \
+           crate://crates.io/rustversion/1.0.18 \
+           crate://crates.io/ryu/1.0.18 \
+           crate://crates.io/same-file/1.0.6 \
+           crate://crates.io/schannel/0.1.23 \
+           crate://crates.io/schemars/0.8.21 \
+           crate://crates.io/schemars_derive/0.8.21 \
+           crate://crates.io/scopeguard/1.2.0 \
+           crate://crates.io/scroll/0.12.0 \
+           crate://crates.io/scroll_derive/0.12.0 \
+           crate://crates.io/security-framework/2.11.0 \
+           crate://crates.io/security-framework-sys/2.11.0 \
+           crate://crates.io/semver/1.0.23 \
+           crate://crates.io/serde/1.0.217 \
+           crate://crates.io/serde_derive/1.0.217 \
+           crate://crates.io/serde_derive_internals/0.29.1 \
+           crate://crates.io/serde_json/1.0.135 \
+           crate://crates.io/serde_spanned/0.6.8 \
+           crate://crates.io/sha2/0.10.8 \
+           crate://crates.io/sharded-slab/0.1.7 \
+           crate://crates.io/shell-words/1.1.0 \
+           crate://crates.io/shlex/1.3.0 \
+           crate://crates.io/simd-adler32/0.3.7 \
+           crate://crates.io/similar/2.5.0 \
+           crate://crates.io/slab/0.4.9 \
+           crate://crates.io/smallvec/1.13.2 \
+           crate://crates.io/smawk/0.3.2 \
+           crate://crates.io/snapbox/0.6.16 \
+           crate://crates.io/snapbox-macros/0.3.10 \
+           crate://crates.io/socks/0.3.4 \
+           crate://crates.io/stable_deref_trait/1.2.0 \
+           crate://crates.io/stacker/0.1.15 \
+           crate://crates.io/static_assertions/1.1.0 \
+           crate://crates.io/strsim/0.11.1 \
+           crate://crates.io/subtle/2.5.0 \
+           crate://crates.io/syn/2.0.90 \
+           crate://crates.io/synstructure/0.13.1 \
+           crate://crates.io/tar/0.4.43 \
+           crate://crates.io/target-lexicon/0.13.1 \
+           crate://crates.io/tempfile/3.11.0 \
+           crate://crates.io/termcolor/1.4.1 \
+           crate://crates.io/terminal_size/0.3.0 \
+           crate://crates.io/textwrap/0.16.1 \
+           crate://crates.io/thiserror/1.0.69 \
+           crate://crates.io/thiserror/2.0.3 \
+           crate://crates.io/thiserror-impl/1.0.69 \
+           crate://crates.io/thiserror-impl/2.0.3 \
+           crate://crates.io/thread_local/1.1.8 \
+           crate://crates.io/time/0.3.36 \
+           crate://crates.io/time-core/0.1.2 \
+           crate://crates.io/time-macros/0.2.18 \
+           crate://crates.io/tinystr/0.7.6 \
+           crate://crates.io/toml/0.8.19 \
+           crate://crates.io/toml_datetime/0.6.8 \
+           crate://crates.io/toml_edit/0.21.1 \
+           crate://crates.io/toml_edit/0.22.22 \
+           crate://crates.io/tracing/0.1.41 \
+           crate://crates.io/tracing-attributes/0.1.28 \
+           crate://crates.io/tracing-core/0.1.33 \
+           crate://crates.io/tracing-log/0.2.0 \
+           crate://crates.io/tracing-serde/0.2.0 \
+           crate://crates.io/tracing-subscriber/0.3.19 \
+           crate://crates.io/trycmd/0.15.6 \
+           crate://crates.io/twox-hash/1.6.3 \
+           crate://crates.io/typenum/1.17.0 \
+           crate://crates.io/unicase/2.7.0 \
+           crate://crates.io/unicode-ident/1.0.12 \
+           crate://crates.io/unicode-linebreak/0.1.5 \
+           crate://crates.io/unicode-width/0.1.13 \
+           crate://crates.io/unicode-width/0.2.0 \
+           crate://crates.io/unicode-xid/0.2.6 \
+           crate://crates.io/unscanny/0.1.0 \
+           crate://crates.io/untrusted/0.9.0 \
+           crate://crates.io/ureq/2.11.0 \
+           crate://crates.io/url/2.5.4 \
+           crate://crates.io/urlencoding/2.1.3 \
+           crate://crates.io/utf16_iter/1.0.5 \
+           crate://crates.io/utf8_iter/1.0.4 \
+           crate://crates.io/utf8parse/0.2.2 \
+           crate://crates.io/uuid/1.8.0 \
+           crate://crates.io/valuable/0.1.0 \
+           crate://crates.io/vcpkg/0.2.15 \
+           crate://crates.io/version-ranges/0.1.1 \
+           crate://crates.io/version_check/0.9.4 \
+           crate://crates.io/versions/6.2.0 \
+           crate://crates.io/wait-timeout/0.2.0 \
+           crate://crates.io/walkdir/2.5.0 \
+           crate://crates.io/wasi/0.11.0+wasi-snapshot-preview1 \
+           crate://crates.io/wasm-bindgen/0.2.96 \
+           crate://crates.io/wasm-bindgen-backend/0.2.96 \
+           crate://crates.io/wasm-bindgen-macro/0.2.96 \
+           crate://crates.io/wasm-bindgen-macro-support/0.2.96 \
+           crate://crates.io/wasm-bindgen-shared/0.2.96 \
+           crate://crates.io/web-time/1.1.0 \
+           crate://crates.io/webpki-roots/0.26.2 \
+           crate://crates.io/which/7.0.0 \
+           crate://crates.io/wild/2.2.1 \
+           crate://crates.io/winapi/0.3.9 \
+           crate://crates.io/winapi-i686-pc-windows-gnu/0.4.0 \
+           crate://crates.io/winapi-util/0.1.8 \
+           crate://crates.io/winapi-x86_64-pc-windows-gnu/0.4.0 \
+           crate://crates.io/windows-sys/0.48.0 \
+           crate://crates.io/windows-sys/0.52.0 \
+           crate://crates.io/windows-targets/0.48.5 \
+           crate://crates.io/windows-targets/0.52.5 \
+           crate://crates.io/windows_aarch64_gnullvm/0.48.5 \
+           crate://crates.io/windows_aarch64_gnullvm/0.52.5 \
+           crate://crates.io/windows_aarch64_msvc/0.48.5 \
+           crate://crates.io/windows_aarch64_msvc/0.52.5 \
+           crate://crates.io/windows_i686_gnu/0.48.5 \
+           crate://crates.io/windows_i686_gnu/0.52.5 \
+           crate://crates.io/windows_i686_gnullvm/0.52.5 \
+           crate://crates.io/windows_i686_msvc/0.48.5 \
+           crate://crates.io/windows_i686_msvc/0.52.5 \
+           crate://crates.io/windows_x86_64_gnu/0.48.5 \
+           crate://crates.io/windows_x86_64_gnu/0.52.5 \
+           crate://crates.io/windows_x86_64_gnullvm/0.48.5 \
+           crate://crates.io/windows_x86_64_gnullvm/0.52.5 \
+           crate://crates.io/windows_x86_64_msvc/0.48.5 \
+           crate://crates.io/windows_x86_64_msvc/0.52.5 \
+           crate://crates.io/winnow/0.5.40 \
+           crate://crates.io/winnow/0.6.20 \
+           crate://crates.io/winsafe/0.0.19 \
+           crate://crates.io/write16/1.0.0 \
+           crate://crates.io/writeable/0.5.5 \
+           crate://crates.io/xattr/1.3.1 \
+           crate://crates.io/xwin/0.6.5 \
+           crate://crates.io/xz2/0.1.7 \
+           crate://crates.io/yansi/1.0.1 \
+           crate://crates.io/yoke/0.7.4 \
+           crate://crates.io/yoke-derive/0.7.5 \
+           crate://crates.io/zerocopy/0.7.35 \
+           crate://crates.io/zerocopy-derive/0.7.35 \
+           crate://crates.io/zerofrom/0.1.4 \
+           crate://crates.io/zerofrom-derive/0.1.5 \
+           crate://crates.io/zeroize/1.8.1 \
+           crate://crates.io/zerovec/0.10.4 \
+           crate://crates.io/zerovec-derive/0.10.3 \
+           crate://crates.io/zip/2.3.0 \
+           crate://crates.io/zopfli/0.8.1 \
+           "
+SRC_URI[sha256sum] = "0e0dc2e0bfaa2e1bd238e0236cf8a2b7e2250ccaa29c1aa8d0e61fa664b0289d"
+
+S = "${WORKDIR}/maturin-${PV}"
+
+CFLAGS += "-ffile-prefix-map=${CARGO_HOME}=${TARGET_DBGSRC_DIR}/cargo_home"
+
+DEPENDS += "\
+    python3-setuptools-rust-native \
+    python3-semantic-version-native \
+    python3-setuptools-rust \
+"
+
+require ${BPN}-crates.inc
+
+inherit pypi cargo-update-recipe-crates python_pyo3 python_setuptools_build_meta
+
+do_configure() {
+    python_pyo3_do_configure
+    cargo_common_do_configure
+    python_pep517_do_configure
+}
+
+RDEPENDS:${PN} += "\
+    cargo \
+    python3-json \
+    rust \
+"
+
+RRECOMMENDS:${PN} += "\
+    python3-ensurepip \
+    python3-pip \
+    python3-venv \
+"
+
+BBCLASSEXTEND = "native nativesdk"
-- 
2.47.1


--===============7066542140933248981==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: attachment; filename="buildhistory-diff-full.txt"

packages/core2-64-poky-linux/python3-maturin: PV changed from "1.8.3" to "1.8.6"
packages/core2-64-poky-linux/python3-maturin: PKGV changed from 1.8.3 [default] to 1.8.6 [default]
packages/core2-64-poky-linux/python3-maturin: SRC_URI changed from "https://files.pythonhosted.org/packages/source/m/maturin/maturin-1.8.3.tar.gz;downloadfilename=maturin-1.8.3.tar.gz file://0001-Define-more-ioctl-codes-on-riscv32gc-unknown-linux-g.patch;patchdir=/srv/pokybuild/yocto-worker/auh/build/build/tmp/work/core2-64-poky-linux/python3-maturin/1.8.3/sources-unpack/cargo_home/bitbake/libc-0.2.167 crate://crates.io/adler2/2.0.0 crate://crates.io/ahash/0.8.11 crate://crates.io/aho-corasick/1.1.3 crate://crates.io/allocator-api2/0.2.18 crate://crates.io/anstream/0.6.14 crate://crates.io/anstyle/1.0.7 crate://crates.io/anstyle-parse/0.2.4 crate://crates.io/anstyle-query/1.1.0 crate://crates.io/anstyle-wincon/3.0.3 crate://crates.io/anyhow/1.0.89 crate://crates.io/arbitrary/1.4.1 crate://crates.io/autocfg/1.3.0 crate://crates.io/automod/1.0.14 crate://crates.io/base64/0.21.7 crate://crates.io/base64/0.22.1 crate://crates.io/bitflags/1.3.2 crate://crates.io/bitflags/2.5.0 crate://cra
 tes.io/block-buffer/0.10.4 crate://crates.io/boxcar/0.2.8 crate://crates.io/bstr/1.10.0 crate://crates.io/bumpalo/3.16.0 crate://crates.io/byteorder/1.5.0 crate://crates.io/bytes/1.9.0 crate://crates.io/bytesize/1.3.0 crate://crates.io/bzip2/0.5.2 crate://crates.io/bzip2-sys/0.1.13+1.0.8 crate://crates.io/cab/0.6.0 crate://crates.io/camino/1.1.9 crate://crates.io/cargo-config2/0.1.26 crate://crates.io/cargo-options/0.7.4 crate://crates.io/cargo-platform/0.1.8 crate://crates.io/cargo-xwin/0.18.4 crate://crates.io/cargo-zigbuild/0.19.7 crate://crates.io/cargo_metadata/0.19.0 crate://crates.io/cbindgen/0.28.0 crate://crates.io/cc/1.2.16 crate://crates.io/cfb/0.10.0 crate://crates.io/cfg-if/1.0.0 crate://crates.io/charset/0.1.5 crate://crates.io/chumsky/0.9.3 crate://crates.io/clap/4.5.7 crate://crates.io/clap_builder/4.5.7 crate://crates.io/clap_complete/4.5.5 crate://crates.io/clap_complete_command/0.6.1 crate://crates.io/clap_complete_nushell/4.5.2 crate://crates.io/clap_derive/4.5.5
  crate://crates.io/clap_lex/0.7.1 crate://crates.io/cli-table/0.4.7 crate://crates.io/colorchoice/1.0.1 crate://crates.io/configparser/3.1.0 crate://crates.io/console/0.15.8 crate://crates.io/content_inspector/0.2.4 crate://crates.io/core-foundation/0.9.4 crate://crates.io/core-foundation-sys/0.8.6 crate://crates.io/cpufeatures/0.2.12 crate://crates.io/crc/3.2.1 crate://crates.io/crc-catalog/2.4.0 crate://crates.io/crc32fast/1.4.2 crate://crates.io/crossbeam-channel/0.5.13 crate://crates.io/crossbeam-deque/0.8.5 crate://crates.io/crossbeam-epoch/0.9.18 crate://crates.io/crossbeam-utils/0.8.20 crate://crates.io/crypto-common/0.1.6 crate://crates.io/data-encoding/2.6.0 crate://crates.io/deranged/0.3.11 crate://crates.io/derive_arbitrary/1.4.1 crate://crates.io/dialoguer/0.11.0 crate://crates.io/diff/0.1.13 crate://crates.io/digest/0.10.7 crate://crates.io/dirs/5.0.1 crate://crates.io/dirs-sys/0.4.1 crate://crates.io/displaydoc/0.2.5 crate://crates.io/dissimilar/1.0.9 crate://crates.io
 /dunce/1.0.5 crate://crates.io/dyn-clone/1.0.17 crate://crates.io/either/1.13.0 crate://crates.io/encode_unicode/0.3.6 crate://crates.io/encoding_rs/0.8.34 crate://crates.io/equivalent/1.0.1 crate://crates.io/errno/0.3.9 crate://crates.io/expect-test/1.5.0 crate://crates.io/fastrand/2.1.0 crate://crates.io/fat-macho/0.4.9 crate://crates.io/filetime/0.2.23 crate://crates.io/flate2/1.0.33 crate://crates.io/fnv/1.0.7 crate://crates.io/foreign-types/0.3.2 crate://crates.io/foreign-types-shared/0.1.1 crate://crates.io/form_urlencoded/1.2.1 crate://crates.io/fs-err/3.0.0 crate://crates.io/fs4/0.12.0 crate://crates.io/futures/0.3.30 crate://crates.io/futures-channel/0.3.31 crate://crates.io/futures-core/0.3.31 crate://crates.io/futures-executor/0.3.30 crate://crates.io/futures-io/0.3.31 crate://crates.io/futures-macro/0.3.31 crate://crates.io/futures-sink/0.3.31 crate://crates.io/futures-task/0.3.31 crate://crates.io/futures-timer/3.0.3 crate://crates.io/futures-util/0.3.31 crate://crates.
 io/generic-array/0.14.7 crate://crates.io/getrandom/0.2.15 crate://crates.io/glob/0.3.1 crate://crates.io/globset/0.4.15 crate://crates.io/goblin/0.9.2 crate://crates.io/hashbrown/0.14.5 crate://crates.io/hashbrown/0.15.2 crate://crates.io/heck/0.4.1 crate://crates.io/heck/0.5.0 crate://crates.io/home/0.5.9 crate://crates.io/humantime/2.1.0 crate://crates.io/humantime-serde/1.1.1 crate://crates.io/icu_collections/1.5.0 crate://crates.io/icu_locid/1.5.0 crate://crates.io/icu_locid_transform/1.5.0 crate://crates.io/icu_locid_transform_data/1.5.0 crate://crates.io/icu_normalizer/1.5.0 crate://crates.io/icu_normalizer_data/1.5.0 crate://crates.io/icu_properties/1.5.1 crate://crates.io/icu_properties_data/1.5.0 crate://crates.io/icu_provider/1.5.0 crate://crates.io/icu_provider_macros/1.5.0 crate://crates.io/idna/1.0.3 crate://crates.io/idna_adapter/1.2.0 crate://crates.io/ignore/0.4.23 crate://crates.io/indexmap/2.6.0 crate://crates.io/indicatif/0.17.9 crate://crates.io/indoc/2.0.5 crat
 e://crates.io/is_terminal_polyfill/1.70.0 crate://crates.io/itertools/0.12.1 crate://crates.io/itertools/0.13.0 crate://crates.io/itoa/1.0.11 crate://crates.io/js-sys/0.3.73 crate://crates.io/keyring/2.3.3 crate://crates.io/lazy_static/1.4.0 crate://crates.io/lddtree/0.3.7 crate://crates.io/libc/0.2.167 crate://crates.io/libmimalloc-sys/0.1.39 crate://crates.io/libredox/0.1.3 crate://crates.io/linux-keyutils/0.2.4 crate://crates.io/linux-raw-sys/0.4.14 crate://crates.io/litemap/0.7.3 crate://crates.io/lock_api/0.4.12 crate://crates.io/lockfree-object-pool/0.1.6 crate://crates.io/log/0.4.22 crate://crates.io/lzma-sys/0.1.20 crate://crates.io/lzxd/0.2.5 crate://crates.io/mailparse/0.15.0 crate://crates.io/matchers/0.1.0 crate://crates.io/memchr/2.7.4 crate://crates.io/mimalloc/0.1.43 crate://crates.io/mime/0.3.17 crate://crates.io/mime_guess/2.0.4 crate://crates.io/minijinja/2.5.0 crate://crates.io/minimal-lexical/0.2.1 crate://crates.io/miniz_oxide/0.8.0 crate://crates.io/msi/0.8.0 c
 rate://crates.io/multipart/0.18.0 crate://crates.io/native-tls/0.2.12 crate://crates.io/nom/7.1.3 crate://crates.io/normalize-line-endings/0.3.0 crate://crates.io/normpath/1.2.0 crate://crates.io/nu-ansi-term/0.46.0 crate://crates.io/num-conv/0.1.0 crate://crates.io/number_prefix/0.4.0 crate://crates.io/once_cell/1.20.2 crate://crates.io/openssl/0.10.70 crate://crates.io/openssl-macros/0.1.1 crate://crates.io/openssl-probe/0.1.5 crate://crates.io/openssl-sys/0.9.105 crate://crates.io/option-ext/0.2.0 crate://crates.io/os_pipe/1.2.0 crate://crates.io/overload/0.1.1 crate://crates.io/parking_lot/0.12.3 crate://crates.io/parking_lot_core/0.9.10 crate://crates.io/paste/1.0.15 crate://crates.io/path-slash/0.2.1 crate://crates.io/pep440_rs/0.7.3 crate://crates.io/pep508_rs/0.9.2 crate://crates.io/percent-encoding/2.3.1 crate://crates.io/pin-project-lite/0.2.15 crate://crates.io/pin-utils/0.1.0 crate://crates.io/pkg-config/0.3.30 crate://crates.io/plain/0.2.3 crate://crates.io/platform-inf
 o/2.0.3 crate://crates.io/portable-atomic/1.6.0 crate://crates.io/powerfmt/0.2.0 crate://crates.io/ppv-lite86/0.2.17 crate://crates.io/pretty_assertions/1.4.1 crate://crates.io/proc-macro-crate/3.1.0 crate://crates.io/proc-macro2/1.0.92 crate://crates.io/psm/0.1.21 crate://crates.io/pyproject-toml/0.13.4 crate://crates.io/python-pkginfo/0.6.5 crate://crates.io/quote/1.0.37 crate://crates.io/quoted_printable/0.5.0 crate://crates.io/rand/0.8.5 crate://crates.io/rand_chacha/0.3.1 crate://crates.io/rand_core/0.6.4 crate://crates.io/rayon/1.10.0 crate://crates.io/rayon-core/1.12.1 crate://crates.io/redox_syscall/0.4.1 crate://crates.io/redox_syscall/0.5.1 crate://crates.io/redox_users/0.4.5 crate://crates.io/regex/1.11.1 crate://crates.io/regex-automata/0.1.10 crate://crates.io/regex-automata/0.4.9 crate://crates.io/regex-syntax/0.6.29 crate://crates.io/regex-syntax/0.8.5 crate://crates.io/relative-path/1.9.3 crate://crates.io/rfc2047-decoder/1.0.6 crate://crates.io/ring/0.17.13 crate://
 crates.io/rstest/0.22.0 crate://crates.io/rstest_macros/0.22.0 crate://crates.io/rustc-hash/2.0.0 crate://crates.io/rustc_version/0.4.1 crate://crates.io/rustflags/0.1.6 crate://crates.io/rustix/0.38.41 crate://crates.io/rustls/0.23.19 crate://crates.io/rustls-pemfile/2.1.3 crate://crates.io/rustls-pki-types/1.10.0 crate://crates.io/rustls-webpki/0.102.8 crate://crates.io/rustversion/1.0.18 crate://crates.io/ryu/1.0.18 crate://crates.io/same-file/1.0.6 crate://crates.io/schannel/0.1.23 crate://crates.io/schemars/0.8.21 crate://crates.io/schemars_derive/0.8.21 crate://crates.io/scopeguard/1.2.0 crate://crates.io/scroll/0.12.0 crate://crates.io/scroll_derive/0.12.0 crate://crates.io/security-framework/2.11.0 crate://crates.io/security-framework-sys/2.11.0 crate://crates.io/semver/1.0.23 crate://crates.io/serde/1.0.217 crate://crates.io/serde_derive/1.0.217 crate://crates.io/serde_derive_internals/0.29.1 crate://crates.io/serde_json/1.0.135 crate://crates.io/serde_spanned/0.6.8 crate:/
 /crates.io/sha2/0.10.8 crate://crates.io/sharded-slab/0.1.7 crate://crates.io/shell-words/1.1.0 crate://crates.io/shlex/1.3.0 crate://crates.io/simd-adler32/0.3.7 crate://crates.io/similar/2.5.0 crate://crates.io/slab/0.4.9 crate://crates.io/smallvec/1.13.2 crate://crates.io/smawk/0.3.2 crate://crates.io/snapbox/0.6.16 crate://crates.io/snapbox-macros/0.3.10 crate://crates.io/socks/0.3.4 crate://crates.io/stable_deref_trait/1.2.0 crate://crates.io/stacker/0.1.15 crate://crates.io/static_assertions/1.1.0 crate://crates.io/strsim/0.11.1 crate://crates.io/subtle/2.5.0 crate://crates.io/syn/2.0.90 crate://crates.io/synstructure/0.13.1 crate://crates.io/tar/0.4.43 crate://crates.io/target-lexicon/0.13.1 crate://crates.io/tempfile/3.11.0 crate://crates.io/termcolor/1.4.1 crate://crates.io/terminal_size/0.3.0 crate://crates.io/textwrap/0.16.1 crate://crates.io/thiserror/1.0.69 crate://crates.io/thiserror/2.0.3 crate://crates.io/thiserror-impl/1.0.69 crate://crates.io/thiserror-impl/2.0.3 c
 rate://crates.io/thread_local/1.1.8 crate://crates.io/time/0.3.36 crate://crates.io/time-core/0.1.2 crate://crates.io/time-macros/0.2.18 crate://crates.io/tinystr/0.7.6 crate://crates.io/toml/0.8.19 crate://crates.io/toml_datetime/0.6.8 crate://crates.io/toml_edit/0.21.1 crate://crates.io/toml_edit/0.22.22 crate://crates.io/tracing/0.1.41 crate://crates.io/tracing-attributes/0.1.28 crate://crates.io/tracing-core/0.1.33 crate://crates.io/tracing-log/0.2.0 crate://crates.io/tracing-serde/0.2.0 crate://crates.io/tracing-subscriber/0.3.19 crate://crates.io/trycmd/0.15.6 crate://crates.io/twox-hash/1.6.3 crate://crates.io/typenum/1.17.0 crate://crates.io/unicase/2.7.0 crate://crates.io/unicode-ident/1.0.12 crate://crates.io/unicode-linebreak/0.1.5 crate://crates.io/unicode-width/0.1.13 crate://crates.io/unicode-width/0.2.0 crate://crates.io/unicode-xid/0.2.6 crate://crates.io/unscanny/0.1.0 crate://crates.io/untrusted/0.9.0 crate://crates.io/ureq/2.11.0 crate://crates.io/url/2.5.4 crate:
 //crates.io/urlencoding/2.1.3 crate://crates.io/utf16_iter/1.0.5 crate://crates.io/utf8_iter/1.0.4 crate://crates.io/utf8parse/0.2.2 crate://crates.io/uuid/1.8.0 crate://crates.io/valuable/0.1.0 crate://crates.io/vcpkg/0.2.15 crate://crates.io/version-ranges/0.1.1 crate://crates.io/version_check/0.9.4 crate://crates.io/versions/6.2.0 crate://crates.io/wait-timeout/0.2.0 crate://crates.io/walkdir/2.5.0 crate://crates.io/wasi/0.11.0+wasi-snapshot-preview1 crate://crates.io/wasm-bindgen/0.2.96 crate://crates.io/wasm-bindgen-backend/0.2.96 crate://crates.io/wasm-bindgen-macro/0.2.96 crate://crates.io/wasm-bindgen-macro-support/0.2.96 crate://crates.io/wasm-bindgen-shared/0.2.96 crate://crates.io/web-time/1.1.0 crate://crates.io/webpki-roots/0.26.2 crate://crates.io/which/7.0.0 crate://crates.io/wild/2.2.1 crate://crates.io/winapi/0.3.9 crate://crates.io/winapi-i686-pc-windows-gnu/0.4.0 crate://crates.io/winapi-util/0.1.8 crate://crates.io/winapi-x86_64-pc-windows-gnu/0.4.0 crate://crate
 s.io/windows-sys/0.48.0 crate://crates.io/windows-sys/0.52.0 crate://crates.io/windows-targets/0.48.5 crate://crates.io/windows-targets/0.52.5 crate://crates.io/windows_aarch64_gnullvm/0.48.5 crate://crates.io/windows_aarch64_gnullvm/0.52.5 crate://crates.io/windows_aarch64_msvc/0.48.5 crate://crates.io/windows_aarch64_msvc/0.52.5 crate://crates.io/windows_i686_gnu/0.48.5 crate://crates.io/windows_i686_gnu/0.52.5 crate://crates.io/windows_i686_gnullvm/0.52.5 crate://crates.io/windows_i686_msvc/0.48.5 crate://crates.io/windows_i686_msvc/0.52.5 crate://crates.io/windows_x86_64_gnu/0.48.5 crate://crates.io/windows_x86_64_gnu/0.52.5 crate://crates.io/windows_x86_64_gnullvm/0.48.5 crate://crates.io/windows_x86_64_gnullvm/0.52.5 crate://crates.io/windows_x86_64_msvc/0.48.5 crate://crates.io/windows_x86_64_msvc/0.52.5 crate://crates.io/winnow/0.5.40 crate://crates.io/winnow/0.6.20 crate://crates.io/winsafe/0.0.19 crate://crates.io/write16/1.0.0 crate://crates.io/writeable/0.5.5 crate://cra
 tes.io/xattr/1.3.1 crate://crates.io/xwin/0.6.5 crate://crates.io/xz2/0.1.7 crate://crates.io/yansi/1.0.1 crate://crates.io/yoke/0.7.4 crate://crates.io/yoke-derive/0.7.5 crate://crates.io/zerocopy/0.7.35 crate://crates.io/zerocopy-derive/0.7.35 crate://crates.io/zerofrom/0.1.4 crate://crates.io/zerofrom-derive/0.1.5 crate://crates.io/zeroize/1.8.1 crate://crates.io/zerovec/0.10.4 crate://crates.io/zerovec-derive/0.10.3 crate://crates.io/zip/2.2.3 crate://crates.io/zopfli/0.8.1" to "https://files.pythonhosted.org/packages/source/m/maturin/maturin-1.8.6.tar.gz;downloadfilename=maturin-1.8.6.tar.gz crate://crates.io/adler2/2.0.0 crate://crates.io/ahash/0.8.11 crate://crates.io/aho-corasick/1.1.3 crate://crates.io/allocator-api2/0.2.18 crate://crates.io/anstream/0.6.14 crate://crates.io/anstyle/1.0.7 crate://crates.io/anstyle-parse/0.2.4 crate://crates.io/anstyle-query/1.1.0 crate://crates.io/anstyle-wincon/3.0.3 crate://crates.io/anyhow/1.0.89 crate://crates.io/arbitrary/1.4.1 crate:/
 /crates.io/autocfg/1.3.0 crate://crates.io/automod/1.0.14 crate://crates.io/base64/0.21.7 crate://crates.io/base64/0.22.1 crate://crates.io/bitflags/1.3.2 crate://crates.io/bitflags/2.5.0 crate://crates.io/block-buffer/0.10.4 crate://crates.io/boxcar/0.2.8 crate://crates.io/bstr/1.10.0 crate://crates.io/bumpalo/3.16.0 crate://crates.io/byteorder/1.5.0 crate://crates.io/bytes/1.9.0 crate://crates.io/bytesize/1.3.0 crate://crates.io/bzip2/0.5.2 crate://crates.io/bzip2-sys/0.1.13+1.0.8 crate://crates.io/cab/0.6.0 crate://crates.io/camino/1.1.9 crate://crates.io/cargo-config2/0.1.26 crate://crates.io/cargo-options/0.7.4 crate://crates.io/cargo-platform/0.1.8 crate://crates.io/cargo-xwin/0.18.4 crate://crates.io/cargo-zigbuild/0.20.0 crate://crates.io/cargo_metadata/0.19.0 crate://crates.io/cbindgen/0.28.0 crate://crates.io/cc/1.2.16 crate://crates.io/cfb/0.10.0 crate://crates.io/cfg-if/1.0.0 crate://crates.io/charset/0.1.5 crate://crates.io/chumsky/0.9.3 crate://crates.io/clap/4.5.7 cra
 te://crates.io/clap_builder/4.5.7 crate://crates.io/clap_complete/4.5.5 crate://crates.io/clap_complete_command/0.6.1 crate://crates.io/clap_complete_nushell/4.5.2 crate://crates.io/clap_derive/4.5.5 crate://crates.io/clap_lex/0.7.1 crate://crates.io/cli-table/0.4.7 crate://crates.io/colorchoice/1.0.1 crate://crates.io/configparser/3.1.0 crate://crates.io/console/0.15.8 crate://crates.io/content_inspector/0.2.4 crate://crates.io/core-foundation/0.9.4 crate://crates.io/core-foundation-sys/0.8.6 crate://crates.io/cpufeatures/0.2.12 crate://crates.io/crc/3.2.1 crate://crates.io/crc-catalog/2.4.0 crate://crates.io/crc32fast/1.4.2 crate://crates.io/crossbeam-channel/0.5.15 crate://crates.io/crossbeam-deque/0.8.5 crate://crates.io/crossbeam-epoch/0.9.18 crate://crates.io/crossbeam-utils/0.8.20 crate://crates.io/crypto-common/0.1.6 crate://crates.io/data-encoding/2.6.0 crate://crates.io/deranged/0.3.11 crate://crates.io/derive_arbitrary/1.4.1 crate://crates.io/dialoguer/0.11.0 crate://crat
 es.io/diff/0.1.13 crate://crates.io/digest/0.10.7 crate://crates.io/dirs/5.0.1 crate://crates.io/dirs-sys/0.4.1 crate://crates.io/displaydoc/0.2.5 crate://crates.io/dissimilar/1.0.9 crate://crates.io/dunce/1.0.5 crate://crates.io/dyn-clone/1.0.17 crate://crates.io/either/1.13.0 crate://crates.io/encode_unicode/0.3.6 crate://crates.io/encoding_rs/0.8.34 crate://crates.io/equivalent/1.0.1 crate://crates.io/errno/0.3.9 crate://crates.io/expect-test/1.5.0 crate://crates.io/fastrand/2.1.0 crate://crates.io/fat-macho/0.4.9 crate://crates.io/filetime/0.2.23 crate://crates.io/flate2/1.0.33 crate://crates.io/fnv/1.0.7 crate://crates.io/foreign-types/0.3.2 crate://crates.io/foreign-types-shared/0.1.1 crate://crates.io/form_urlencoded/1.2.1 crate://crates.io/fs-err/3.0.0 crate://crates.io/fs4/0.12.0 crate://crates.io/futures/0.3.30 crate://crates.io/futures-channel/0.3.31 crate://crates.io/futures-core/0.3.31 crate://crates.io/futures-executor/0.3.30 crate://crates.io/futures-io/0.3.31 crate:/
 /crates.io/futures-macro/0.3.31 crate://crates.io/futures-sink/0.3.31 crate://crates.io/futures-task/0.3.31 crate://crates.io/futures-timer/3.0.3 crate://crates.io/futures-util/0.3.31 crate://crates.io/generic-array/0.14.7 crate://crates.io/getrandom/0.2.15 crate://crates.io/glob/0.3.1 crate://crates.io/globset/0.4.15 crate://crates.io/goblin/0.9.2 crate://crates.io/hashbrown/0.14.5 crate://crates.io/hashbrown/0.15.2 crate://crates.io/heck/0.4.1 crate://crates.io/heck/0.5.0 crate://crates.io/home/0.5.9 crate://crates.io/humantime/2.1.0 crate://crates.io/humantime-serde/1.1.1 crate://crates.io/icu_collections/1.5.0 crate://crates.io/icu_locid/1.5.0 crate://crates.io/icu_locid_transform/1.5.0 crate://crates.io/icu_locid_transform_data/1.5.0 crate://crates.io/icu_normalizer/1.5.0 crate://crates.io/icu_normalizer_data/1.5.0 crate://crates.io/icu_properties/1.5.1 crate://crates.io/icu_properties_data/1.5.0 crate://crates.io/icu_provider/1.5.0 crate://crates.io/icu_provider_macros/1.5.0 c
 rate://crates.io/idna/1.0.3 crate://crates.io/idna_adapter/1.2.0 crate://crates.io/ignore/0.4.23 crate://crates.io/indexmap/2.6.0 crate://crates.io/indicatif/0.17.9 crate://crates.io/indoc/2.0.5 crate://crates.io/is_terminal_polyfill/1.70.0 crate://crates.io/itertools/0.12.1 crate://crates.io/itertools/0.13.0 crate://crates.io/itoa/1.0.11 crate://crates.io/js-sys/0.3.73 crate://crates.io/keyring/2.3.3 crate://crates.io/lazy_static/1.4.0 crate://crates.io/lddtree/0.3.7 crate://crates.io/libc/0.2.167 crate://crates.io/libmimalloc-sys/0.1.39 crate://crates.io/libredox/0.1.3 crate://crates.io/linux-keyutils/0.2.4 crate://crates.io/linux-raw-sys/0.4.14 crate://crates.io/litemap/0.7.3 crate://crates.io/lock_api/0.4.12 crate://crates.io/lockfree-object-pool/0.1.6 crate://crates.io/log/0.4.22 crate://crates.io/lzma-sys/0.1.20 crate://crates.io/lzxd/0.2.5 crate://crates.io/mailparse/0.15.0 crate://crates.io/matchers/0.1.0 crate://crates.io/memchr/2.7.4 crate://crates.io/mimalloc/0.1.43 crate
 ://crates.io/mime/0.3.17 crate://crates.io/mime_guess/2.0.4 crate://crates.io/minijinja/2.5.0 crate://crates.io/minimal-lexical/0.2.1 crate://crates.io/miniz_oxide/0.8.0 crate://crates.io/msi/0.8.0 crate://crates.io/multipart/0.18.0 crate://crates.io/native-tls/0.2.12 crate://crates.io/nom/7.1.3 crate://crates.io/normalize-line-endings/0.3.0 crate://crates.io/normpath/1.2.0 crate://crates.io/nu-ansi-term/0.46.0 crate://crates.io/num-conv/0.1.0 crate://crates.io/number_prefix/0.4.0 crate://crates.io/once_cell/1.20.2 crate://crates.io/openssl/0.10.72 crate://crates.io/openssl-macros/0.1.1 crate://crates.io/openssl-probe/0.1.5 crate://crates.io/openssl-sys/0.9.107 crate://crates.io/option-ext/0.2.0 crate://crates.io/os_pipe/1.2.0 crate://crates.io/overload/0.1.1 crate://crates.io/parking_lot/0.12.3 crate://crates.io/parking_lot_core/0.9.10 crate://crates.io/paste/1.0.15 crate://crates.io/path-slash/0.2.1 crate://crates.io/pep440_rs/0.7.3 crate://crates.io/pep508_rs/0.9.2 crate://crates
 .io/percent-encoding/2.3.1 crate://crates.io/pin-project-lite/0.2.15 crate://crates.io/pin-utils/0.1.0 crate://crates.io/pkg-config/0.3.30 crate://crates.io/plain/0.2.3 crate://crates.io/platform-info/2.0.3 crate://crates.io/portable-atomic/1.6.0 crate://crates.io/powerfmt/0.2.0 crate://crates.io/ppv-lite86/0.2.17 crate://crates.io/pretty_assertions/1.4.1 crate://crates.io/proc-macro-crate/3.1.0 crate://crates.io/proc-macro2/1.0.92 crate://crates.io/psm/0.1.21 crate://crates.io/pyproject-toml/0.13.4 crate://crates.io/python-pkginfo/0.6.5 crate://crates.io/quote/1.0.37 crate://crates.io/quoted_printable/0.5.0 crate://crates.io/rand/0.8.5 crate://crates.io/rand_chacha/0.3.1 crate://crates.io/rand_core/0.6.4 crate://crates.io/rayon/1.10.0 crate://crates.io/rayon-core/1.12.1 crate://crates.io/redox_syscall/0.4.1 crate://crates.io/redox_syscall/0.5.1 crate://crates.io/redox_users/0.4.5 crate://crates.io/regex/1.11.1 crate://crates.io/regex-automata/0.1.10 crate://crates.io/regex-automata
 /0.4.9 crate://crates.io/regex-syntax/0.6.29 crate://crates.io/regex-syntax/0.8.5 crate://crates.io/relative-path/1.9.3 crate://crates.io/rfc2047-decoder/1.0.6 crate://crates.io/ring/0.17.13 crate://crates.io/rstest/0.22.0 crate://crates.io/rstest_macros/0.22.0 crate://crates.io/rustc-hash/2.0.0 crate://crates.io/rustc_version/0.4.1 crate://crates.io/rustflags/0.1.6 crate://crates.io/rustix/0.38.41 crate://crates.io/rustls/0.23.19 crate://crates.io/rustls-pemfile/2.1.3 crate://crates.io/rustls-pki-types/1.10.0 crate://crates.io/rustls-webpki/0.102.8 crate://crates.io/rustversion/1.0.18 crate://crates.io/ryu/1.0.18 crate://crates.io/same-file/1.0.6 crate://crates.io/schannel/0.1.23 crate://crates.io/schemars/0.8.21 crate://crates.io/schemars_derive/0.8.21 crate://crates.io/scopeguard/1.2.0 crate://crates.io/scroll/0.12.0 crate://crates.io/scroll_derive/0.12.0 crate://crates.io/security-framework/2.11.0 crate://crates.io/security-framework-sys/2.11.0 crate://crates.io/semver/1.0.23 cr
 ate://crates.io/serde/1.0.217 crate://crates.io/serde_derive/1.0.217 crate://crates.io/serde_derive_internals/0.29.1 crate://crates.io/serde_json/1.0.135 crate://crates.io/serde_spanned/0.6.8 crate://crates.io/sha2/0.10.8 crate://crates.io/sharded-slab/0.1.7 crate://crates.io/shell-words/1.1.0 crate://crates.io/shlex/1.3.0 crate://crates.io/simd-adler32/0.3.7 crate://crates.io/similar/2.5.0 crate://crates.io/slab/0.4.9 crate://crates.io/smallvec/1.13.2 crate://crates.io/smawk/0.3.2 crate://crates.io/snapbox/0.6.16 crate://crates.io/snapbox-macros/0.3.10 crate://crates.io/socks/0.3.4 crate://crates.io/stable_deref_trait/1.2.0 crate://crates.io/stacker/0.1.15 crate://crates.io/static_assertions/1.1.0 crate://crates.io/strsim/0.11.1 crate://crates.io/subtle/2.5.0 crate://crates.io/syn/2.0.90 crate://crates.io/synstructure/0.13.1 crate://crates.io/tar/0.4.43 crate://crates.io/target-lexicon/0.13.1 crate://crates.io/tempfile/3.11.0 crate://crates.io/termcolor/1.4.1 crate://crates.io/term
 inal_size/0.3.0 crate://crates.io/textwrap/0.16.1 crate://crates.io/thiserror/1.0.69 crate://crates.io/thiserror/2.0.3 crate://crates.io/thiserror-impl/1.0.69 crate://crates.io/thiserror-impl/2.0.3 crate://crates.io/thread_local/1.1.8 crate://crates.io/time/0.3.36 crate://crates.io/time-core/0.1.2 crate://crates.io/time-macros/0.2.18 crate://crates.io/tinystr/0.7.6 crate://crates.io/toml/0.8.19 crate://crates.io/toml_datetime/0.6.8 crate://crates.io/toml_edit/0.21.1 crate://crates.io/toml_edit/0.22.22 crate://crates.io/tracing/0.1.41 crate://crates.io/tracing-attributes/0.1.28 crate://crates.io/tracing-core/0.1.33 crate://crates.io/tracing-log/0.2.0 crate://crates.io/tracing-serde/0.2.0 crate://crates.io/tracing-subscriber/0.3.19 crate://crates.io/trycmd/0.15.6 crate://crates.io/twox-hash/1.6.3 crate://crates.io/typenum/1.17.0 crate://crates.io/unicase/2.7.0 crate://crates.io/unicode-ident/1.0.12 crate://crates.io/unicode-linebreak/0.1.5 crate://crates.io/unicode-width/0.1.13 crate:
 //crates.io/unicode-width/0.2.0 crate://crates.io/unicode-xid/0.2.6 crate://crates.io/unscanny/0.1.0 crate://crates.io/untrusted/0.9.0 crate://crates.io/ureq/2.11.0 crate://crates.io/url/2.5.4 crate://crates.io/urlencoding/2.1.3 crate://crates.io/utf16_iter/1.0.5 crate://crates.io/utf8_iter/1.0.4 crate://crates.io/utf8parse/0.2.2 crate://crates.io/uuid/1.8.0 crate://crates.io/valuable/0.1.0 crate://crates.io/vcpkg/0.2.15 crate://crates.io/version-ranges/0.1.1 crate://crates.io/version_check/0.9.4 crate://crates.io/versions/6.2.0 crate://crates.io/wait-timeout/0.2.0 crate://crates.io/walkdir/2.5.0 crate://crates.io/wasi/0.11.0+wasi-snapshot-preview1 crate://crates.io/wasm-bindgen/0.2.96 crate://crates.io/wasm-bindgen-backend/0.2.96 crate://crates.io/wasm-bindgen-macro/0.2.96 crate://crates.io/wasm-bindgen-macro-support/0.2.96 crate://crates.io/wasm-bindgen-shared/0.2.96 crate://crates.io/web-time/1.1.0 crate://crates.io/webpki-roots/0.26.2 crate://crates.io/which/7.0.0 crate://crates
 .io/wild/2.2.1 crate://crates.io/winapi/0.3.9 crate://crates.io/winapi-i686-pc-windows-gnu/0.4.0 crate://crates.io/winapi-util/0.1.8 crate://crates.io/winapi-x86_64-pc-windows-gnu/0.4.0 crate://crates.io/windows-sys/0.48.0 crate://crates.io/windows-sys/0.52.0 crate://crates.io/windows-targets/0.48.5 crate://crates.io/windows-targets/0.52.5 crate://crates.io/windows_aarch64_gnullvm/0.48.5 crate://crates.io/windows_aarch64_gnullvm/0.52.5 crate://crates.io/windows_aarch64_msvc/0.48.5 crate://crates.io/windows_aarch64_msvc/0.52.5 crate://crates.io/windows_i686_gnu/0.48.5 crate://crates.io/windows_i686_gnu/0.52.5 crate://crates.io/windows_i686_gnullvm/0.52.5 crate://crates.io/windows_i686_msvc/0.48.5 crate://crates.io/windows_i686_msvc/0.52.5 crate://crates.io/windows_x86_64_gnu/0.48.5 crate://crates.io/windows_x86_64_gnu/0.52.5 crate://crates.io/windows_x86_64_gnullvm/0.48.5 crate://crates.io/windows_x86_64_gnullvm/0.52.5 crate://crates.io/windows_x86_64_msvc/0.48.5 crate://crates.io/wi
 ndows_x86_64_msvc/0.52.5 crate://crates.io/winnow/0.5.40 crate://crates.io/winnow/0.6.20 crate://crates.io/winsafe/0.0.19 crate://crates.io/write16/1.0.0 crate://crates.io/writeable/0.5.5 crate://crates.io/xattr/1.3.1 crate://crates.io/xwin/0.6.5 crate://crates.io/xz2/0.1.7 crate://crates.io/yansi/1.0.1 crate://crates.io/yoke/0.7.4 crate://crates.io/yoke-derive/0.7.5 crate://crates.io/zerocopy/0.7.35 crate://crates.io/zerocopy-derive/0.7.35 crate://crates.io/zerofrom/0.1.4 crate://crates.io/zerofrom-derive/0.1.5 crate://crates.io/zeroize/1.8.1 crate://crates.io/zerovec/0.10.4 crate://crates.io/zerovec-derive/0.10.3 crate://crates.io/zip/2.3.0 crate://crates.io/zopfli/0.8.1 crate://crates.io/adler2/2.0.0 crate://crates.io/ahash/0.8.11 crate://crates.io/aho-corasick/1.1.3 crate://crates.io/allocator-api2/0.2.18 crate://crates.io/anstream/0.6.14 crate://crates.io/anstyle/1.0.7 crate://crates.io/anstyle-parse/0.2.4 crate://crates.io/anstyle-query/1.1.0 crate://crates.io/anstyle-wincon/3
 .0.3 crate://crates.io/anyhow/1.0.89 crate://crates.io/arbitrary/1.4.1 crate://crates.io/autocfg/1.3.0 crate://crates.io/automod/1.0.14 crate://crates.io/base64/0.21.7 crate://crates.io/base64/0.22.1 crate://crates.io/bitflags/1.3.2 crate://crates.io/bitflags/2.5.0 crate://crates.io/block-buffer/0.10.4 crate://crates.io/boxcar/0.2.8 crate://crates.io/bstr/1.10.0 crate://crates.io/bumpalo/3.16.0 crate://crates.io/byteorder/1.5.0 crate://crates.io/bytes/1.9.0 crate://crates.io/bytesize/1.3.0 crate://crates.io/bzip2/0.5.2 crate://crates.io/bzip2-sys/0.1.13+1.0.8 crate://crates.io/cab/0.6.0 crate://crates.io/camino/1.1.9 crate://crates.io/cargo-config2/0.1.26 crate://crates.io/cargo-options/0.7.4 crate://crates.io/cargo-platform/0.1.8 crate://crates.io/cargo-xwin/0.18.4 crate://crates.io/cargo-zigbuild/0.20.0 crate://crates.io/cargo_metadata/0.19.0 crate://crates.io/cbindgen/0.28.0 crate://crates.io/cc/1.2.16 crate://crates.io/cfb/0.10.0 crate://crates.io/cfg-if/1.0.0 crate://crates.io/
 charset/0.1.5 crate://crates.io/chumsky/0.9.3 crate://crates.io/clap/4.5.7 crate://crates.io/clap_builder/4.5.7 crate://crates.io/clap_complete/4.5.5 crate://crates.io/clap_complete_command/0.6.1 crate://crates.io/clap_complete_nushell/4.5.2 crate://crates.io/clap_derive/4.5.5 crate://crates.io/clap_lex/0.7.1 crate://crates.io/cli-table/0.4.7 crate://crates.io/colorchoice/1.0.1 crate://crates.io/configparser/3.1.0 crate://crates.io/console/0.15.8 crate://crates.io/content_inspector/0.2.4 crate://crates.io/core-foundation/0.9.4 crate://crates.io/core-foundation-sys/0.8.6 crate://crates.io/cpufeatures/0.2.12 crate://crates.io/crc/3.2.1 crate://crates.io/crc-catalog/2.4.0 crate://crates.io/crc32fast/1.4.2 crate://crates.io/crossbeam-channel/0.5.15 crate://crates.io/crossbeam-deque/0.8.5 crate://crates.io/crossbeam-epoch/0.9.18 crate://crates.io/crossbeam-utils/0.8.20 crate://crates.io/crypto-common/0.1.6 crate://crates.io/data-encoding/2.6.0 crate://crates.io/deranged/0.3.11 crate://cr
 ates.io/derive_arbitrary/1.4.1 crate://crates.io/dialoguer/0.11.0 crate://crates.io/diff/0.1.13 crate://crates.io/digest/0.10.7 crate://crates.io/dirs/5.0.1 crate://crates.io/dirs-sys/0.4.1 crate://crates.io/displaydoc/0.2.5 crate://crates.io/dissimilar/1.0.9 crate://crates.io/dunce/1.0.5 crate://crates.io/dyn-clone/1.0.17 crate://crates.io/either/1.13.0 crate://crates.io/encode_unicode/0.3.6 crate://crates.io/encoding_rs/0.8.34 crate://crates.io/equivalent/1.0.1 crate://crates.io/errno/0.3.9 crate://crates.io/expect-test/1.5.0 crate://crates.io/fastrand/2.1.0 crate://crates.io/fat-macho/0.4.9 crate://crates.io/filetime/0.2.23 crate://crates.io/flate2/1.0.33 crate://crates.io/fnv/1.0.7 crate://crates.io/foreign-types/0.3.2 crate://crates.io/foreign-types-shared/0.1.1 crate://crates.io/form_urlencoded/1.2.1 crate://crates.io/fs-err/3.0.0 crate://crates.io/fs4/0.12.0 crate://crates.io/futures/0.3.30 crate://crates.io/futures-channel/0.3.31 crate://crates.io/futures-core/0.3.31 crate:/
 /crates.io/futures-executor/0.3.30 crate://crates.io/futures-io/0.3.31 crate://crates.io/futures-macro/0.3.31 crate://crates.io/futures-sink/0.3.31 crate://crates.io/futures-task/0.3.31 crate://crates.io/futures-timer/3.0.3 crate://crates.io/futures-util/0.3.31 crate://crates.io/generic-array/0.14.7 crate://crates.io/getrandom/0.2.15 crate://crates.io/glob/0.3.1 crate://crates.io/globset/0.4.15 crate://crates.io/goblin/0.9.2 crate://crates.io/hashbrown/0.14.5 crate://crates.io/hashbrown/0.15.2 crate://crates.io/heck/0.4.1 crate://crates.io/heck/0.5.0 crate://crates.io/home/0.5.9 crate://crates.io/humantime/2.1.0 crate://crates.io/humantime-serde/1.1.1 crate://crates.io/icu_collections/1.5.0 crate://crates.io/icu_locid/1.5.0 crate://crates.io/icu_locid_transform/1.5.0 crate://crates.io/icu_locid_transform_data/1.5.0 crate://crates.io/icu_normalizer/1.5.0 crate://crates.io/icu_normalizer_data/1.5.0 crate://crates.io/icu_properties/1.5.1 crate://crates.io/icu_properties_data/1.5.0 crat
 e://crates.io/icu_provider/1.5.0 crate://crates.io/icu_provider_macros/1.5.0 crate://crates.io/idna/1.0.3 crate://crates.io/idna_adapter/1.2.0 crate://crates.io/ignore/0.4.23 crate://crates.io/indexmap/2.6.0 crate://crates.io/indicatif/0.17.9 crate://crates.io/indoc/2.0.5 crate://crates.io/is_terminal_polyfill/1.70.0 crate://crates.io/itertools/0.12.1 crate://crates.io/itertools/0.13.0 crate://crates.io/itoa/1.0.11 crate://crates.io/js-sys/0.3.73 crate://crates.io/keyring/2.3.3 crate://crates.io/lazy_static/1.4.0 crate://crates.io/lddtree/0.3.7 crate://crates.io/libc/0.2.167 crate://crates.io/libmimalloc-sys/0.1.39 crate://crates.io/libredox/0.1.3 crate://crates.io/linux-keyutils/0.2.4 crate://crates.io/linux-raw-sys/0.4.14 crate://crates.io/litemap/0.7.3 crate://crates.io/lock_api/0.4.12 crate://crates.io/lockfree-object-pool/0.1.6 crate://crates.io/log/0.4.22 crate://crates.io/lzma-sys/0.1.20 crate://crates.io/lzxd/0.2.5 crate://crates.io/mailparse/0.15.0 crate://crates.io/matcher
 s/0.1.0 crate://crates.io/memchr/2.7.4 crate://crates.io/mimalloc/0.1.43 crate://crates.io/mime/0.3.17 crate://crates.io/mime_guess/2.0.4 crate://crates.io/minijinja/2.5.0 crate://crates.io/minimal-lexical/0.2.1 crate://crates.io/miniz_oxide/0.8.0 crate://crates.io/msi/0.8.0 crate://crates.io/multipart/0.18.0 crate://crates.io/native-tls/0.2.12 crate://crates.io/nom/7.1.3 crate://crates.io/normalize-line-endings/0.3.0 crate://crates.io/normpath/1.2.0 crate://crates.io/nu-ansi-term/0.46.0 crate://crates.io/num-conv/0.1.0 crate://crates.io/number_prefix/0.4.0 crate://crates.io/once_cell/1.20.2 crate://crates.io/openssl/0.10.72 crate://crates.io/openssl-macros/0.1.1 crate://crates.io/openssl-probe/0.1.5 crate://crates.io/openssl-sys/0.9.107 crate://crates.io/option-ext/0.2.0 crate://crates.io/os_pipe/1.2.0 crate://crates.io/overload/0.1.1 crate://crates.io/parking_lot/0.12.3 crate://crates.io/parking_lot_core/0.9.10 crate://crates.io/paste/1.0.15 crate://crates.io/path-slash/0.2.1 crat
 e://crates.io/pep440_rs/0.7.3 crate://crates.io/pep508_rs/0.9.2 crate://crates.io/percent-encoding/2.3.1 crate://crates.io/pin-project-lite/0.2.15 crate://crates.io/pin-utils/0.1.0 crate://crates.io/pkg-config/0.3.30 crate://crates.io/plain/0.2.3 crate://crates.io/platform-info/2.0.3 crate://crates.io/portable-atomic/1.6.0 crate://crates.io/powerfmt/0.2.0 crate://crates.io/ppv-lite86/0.2.17 crate://crates.io/pretty_assertions/1.4.1 crate://crates.io/proc-macro-crate/3.1.0 crate://crates.io/proc-macro2/1.0.92 crate://crates.io/psm/0.1.21 crate://crates.io/pyproject-toml/0.13.4 crate://crates.io/python-pkginfo/0.6.5 crate://crates.io/quote/1.0.37 crate://crates.io/quoted_printable/0.5.0 crate://crates.io/rand/0.8.5 crate://crates.io/rand_chacha/0.3.1 crate://crates.io/rand_core/0.6.4 crate://crates.io/rayon/1.10.0 crate://crates.io/rayon-core/1.12.1 crate://crates.io/redox_syscall/0.4.1 crate://crates.io/redox_syscall/0.5.1 crate://crates.io/redox_users/0.4.5 crate://crates.io/regex/1
 .11.1 crate://crates.io/regex-automata/0.1.10 crate://crates.io/regex-automata/0.4.9 crate://crates.io/regex-syntax/0.6.29 crate://crates.io/regex-syntax/0.8.5 crate://crates.io/relative-path/1.9.3 crate://crates.io/rfc2047-decoder/1.0.6 crate://crates.io/ring/0.17.13 crate://crates.io/rstest/0.22.0 crate://crates.io/rstest_macros/0.22.0 crate://crates.io/rustc-hash/2.0.0 crate://crates.io/rustc_version/0.4.1 crate://crates.io/rustflags/0.1.6 crate://crates.io/rustix/0.38.41 crate://crates.io/rustls/0.23.19 crate://crates.io/rustls-pemfile/2.1.3 crate://crates.io/rustls-pki-types/1.10.0 crate://crates.io/rustls-webpki/0.102.8 crate://crates.io/rustversion/1.0.18 crate://crates.io/ryu/1.0.18 crate://crates.io/same-file/1.0.6 crate://crates.io/schannel/0.1.23 crate://crates.io/schemars/0.8.21 crate://crates.io/schemars_derive/0.8.21 crate://crates.io/scopeguard/1.2.0 crate://crates.io/scroll/0.12.0 crate://crates.io/scroll_derive/0.12.0 crate://crates.io/security-framework/2.11.0 crat
 e://crates.io/security-framework-sys/2.11.0 crate://crates.io/semver/1.0.23 crate://crates.io/serde/1.0.217 crate://crates.io/serde_derive/1.0.217 crate://crates.io/serde_derive_internals/0.29.1 crate://crates.io/serde_json/1.0.135 crate://crates.io/serde_spanned/0.6.8 crate://crates.io/sha2/0.10.8 crate://crates.io/sharded-slab/0.1.7 crate://crates.io/shell-words/1.1.0 crate://crates.io/shlex/1.3.0 crate://crates.io/simd-adler32/0.3.7 crate://crates.io/similar/2.5.0 crate://crates.io/slab/0.4.9 crate://crates.io/smallvec/1.13.2 crate://crates.io/smawk/0.3.2 crate://crates.io/snapbox/0.6.16 crate://crates.io/snapbox-macros/0.3.10 crate://crates.io/socks/0.3.4 crate://crates.io/stable_deref_trait/1.2.0 crate://crates.io/stacker/0.1.15 crate://crates.io/static_assertions/1.1.0 crate://crates.io/strsim/0.11.1 crate://crates.io/subtle/2.5.0 crate://crates.io/syn/2.0.90 crate://crates.io/synstructure/0.13.1 crate://crates.io/tar/0.4.43 crate://crates.io/target-lexicon/0.13.1 crate://crat
 es.io/tempfile/3.11.0 crate://crates.io/termcolor/1.4.1 crate://crates.io/terminal_size/0.3.0 crate://crates.io/textwrap/0.16.1 crate://crates.io/thiserror/1.0.69 crate://crates.io/thiserror/2.0.3 crate://crates.io/thiserror-impl/1.0.69 crate://crates.io/thiserror-impl/2.0.3 crate://crates.io/thread_local/1.1.8 crate://crates.io/time/0.3.36 crate://crates.io/time-core/0.1.2 crate://crates.io/time-macros/0.2.18 crate://crates.io/tinystr/0.7.6 crate://crates.io/toml/0.8.19 crate://crates.io/toml_datetime/0.6.8 crate://crates.io/toml_edit/0.21.1 crate://crates.io/toml_edit/0.22.22 crate://crates.io/tracing/0.1.41 crate://crates.io/tracing-attributes/0.1.28 crate://crates.io/tracing-core/0.1.33 crate://crates.io/tracing-log/0.2.0 crate://crates.io/tracing-serde/0.2.0 crate://crates.io/tracing-subscriber/0.3.19 crate://crates.io/trycmd/0.15.6 crate://crates.io/twox-hash/1.6.3 crate://crates.io/typenum/1.17.0 crate://crates.io/unicase/2.7.0 crate://crates.io/unicode-ident/1.0.12 crate://c
 rates.io/unicode-linebreak/0.1.5 crate://crates.io/unicode-width/0.1.13 crate://crates.io/unicode-width/0.2.0 crate://crates.io/unicode-xid/0.2.6 crate://crates.io/unscanny/0.1.0 crate://crates.io/untrusted/0.9.0 crate://crates.io/ureq/2.11.0 crate://crates.io/url/2.5.4 crate://crates.io/urlencoding/2.1.3 crate://crates.io/utf16_iter/1.0.5 crate://crates.io/utf8_iter/1.0.4 crate://crates.io/utf8parse/0.2.2 crate://crates.io/uuid/1.8.0 crate://crates.io/valuable/0.1.0 crate://crates.io/vcpkg/0.2.15 crate://crates.io/version-ranges/0.1.1 crate://crates.io/version_check/0.9.4 crate://crates.io/versions/6.2.0 crate://crates.io/wait-timeout/0.2.0 crate://crates.io/walkdir/2.5.0 crate://crates.io/wasi/0.11.0+wasi-snapshot-preview1 crate://crates.io/wasm-bindgen/0.2.96 crate://crates.io/wasm-bindgen-backend/0.2.96 crate://crates.io/wasm-bindgen-macro/0.2.96 crate://crates.io/wasm-bindgen-macro-support/0.2.96 crate://crates.io/wasm-bindgen-shared/0.2.96 crate://crates.io/web-time/1.1.0 crat
 e://crates.io/webpki-roots/0.26.2 crate://crates.io/which/7.0.0 crate://crates.io/wild/2.2.1 crate://crates.io/winapi/0.3.9 crate://crates.io/winapi-i686-pc-windows-gnu/0.4.0 crate://crates.io/winapi-util/0.1.8 crate://crates.io/winapi-x86_64-pc-windows-gnu/0.4.0 crate://crates.io/windows-sys/0.48.0 crate://crates.io/windows-sys/0.52.0 crate://crates.io/windows-targets/0.48.5 crate://crates.io/windows-targets/0.52.5 crate://crates.io/windows_aarch64_gnullvm/0.48.5 crate://crates.io/windows_aarch64_gnullvm/0.52.5 crate://crates.io/windows_aarch64_msvc/0.48.5 crate://crates.io/windows_aarch64_msvc/0.52.5 crate://crates.io/windows_i686_gnu/0.48.5 crate://crates.io/windows_i686_gnu/0.52.5 crate://crates.io/windows_i686_gnullvm/0.52.5 crate://crates.io/windows_i686_msvc/0.48.5 crate://crates.io/windows_i686_msvc/0.52.5 crate://crates.io/windows_x86_64_gnu/0.48.5 crate://crates.io/windows_x86_64_gnu/0.52.5 crate://crates.io/windows_x86_64_gnullvm/0.48.5 crate://crates.io/windows_x86_64_gn
 ullvm/0.52.5 crate://crates.io/windows_x86_64_msvc/0.48.5 crate://crates.io/windows_x86_64_msvc/0.52.5 crate://crates.io/winnow/0.5.40 crate://crates.io/winnow/0.6.20 crate://crates.io/winsafe/0.0.19 crate://crates.io/write16/1.0.0 crate://crates.io/writeable/0.5.5 crate://crates.io/xattr/1.3.1 crate://crates.io/xwin/0.6.5 crate://crates.io/xz2/0.1.7 crate://crates.io/yansi/1.0.1 crate://crates.io/yoke/0.7.4 crate://crates.io/yoke-derive/0.7.5 crate://crates.io/zerocopy/0.7.35 crate://crates.io/zerocopy-derive/0.7.35 crate://crates.io/zerofrom/0.1.4 crate://crates.io/zerofrom-derive/0.1.5 crate://crates.io/zeroize/1.8.1 crate://crates.io/zerovec/0.10.4 crate://crates.io/zerovec-derive/0.10.3 crate://crates.io/zip/2.3.0 crate://crates.io/zopfli/0.8.1"
packages/core2-64-poky-linux/python3-maturin/python3-maturin-dbg: PV changed from "1.8.3" to "1.8.6"
packages/core2-64-poky-linux/python3-maturin/python3-maturin-dbg: PKGSIZE changed from 6311912 to 6337592 (+0%)
packages/core2-64-poky-linux/python3-maturin/python3-maturin-dbg: PKGV changed from 1.8.3 [default] to 1.8.6 [default]
packages/core2-64-poky-linux/python3-maturin/python3-maturin-dev: PV changed from "1.8.3" to "1.8.6"
packages/core2-64-poky-linux/python3-maturin/python3-maturin-dev: PKGV changed from 1.8.3 [default] to 1.8.6 [default]
packages/core2-64-poky-linux/python3-maturin/python3-maturin-doc: PV changed from "1.8.3" to "1.8.6"
packages/core2-64-poky-linux/python3-maturin/python3-maturin-doc: PKGV changed from 1.8.3 [default] to 1.8.6 [default]
packages/core2-64-poky-linux/python3-maturin/python3-maturin-locale: PV changed from "1.8.3" to "1.8.6"
packages/core2-64-poky-linux/python3-maturin/python3-maturin-locale: PKGV changed from 1.8.3 [default] to 1.8.6 [default]
packages/core2-64-poky-linux/python3-maturin/python3-maturin-src: PV changed from "1.8.3" to "1.8.6"
packages/core2-64-poky-linux/python3-maturin/python3-maturin-src: PKGV changed from 1.8.3 [default] to 1.8.6 [default]
packages/core2-64-poky-linux/python3-maturin/python3-maturin-staticdev: PV changed from "1.8.3" to "1.8.6"
packages/core2-64-poky-linux/python3-maturin/python3-maturin-staticdev: PKGV changed from 1.8.3 [default] to 1.8.6 [default]
packages/core2-64-poky-linux/python3-maturin/python3-maturin: PV changed from "1.8.3" to "1.8.6"
packages/core2-64-poky-linux/python3-maturin/python3-maturin: FILELIST: directory renamed /usr/lib/python3.13/site-packages/maturin-1.8.3.dist-info -> /usr/lib/python3.13/site-packages/maturin-1.8.6.dist-info, added "/usr/lib/python3.13/site-packages/maturin/bootstrap.py /usr/lib/python3.13/site-packages/maturin/__pycache__/bootstrap.cpython-313.pyc"
packages/core2-64-poky-linux/python3-maturin/python3-maturin: PKGSIZE changed from 14249615 to 14308092 (+0%)
packages/core2-64-poky-linux/python3-maturin/python3-maturin: PKGV changed from 1.8.3 [default] to 1.8.6 [default]
Changes to packages/core2-64-poky-linux/python3-maturin (sysroot):
  /usr/lib/python3.13/site-packages/maturin-1.8.3.dist-info moved to /usr/lib/python3.13/site-packages/maturin-1.8.6.dist-info
  /usr/lib/python3.13/site-packages/maturin/bootstrap.py was added
  /usr/lib/python3.13/site-packages/maturin/__pycache__/bootstrap.cpython-313.pyc was added

--===============7066542140933248981==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: attachment; filename="buildhistory-diff.txt"

packages/core2-64-poky-linux/python3-maturin/python3-maturin: FILELIST: directory renamed /usr/lib/python3.13/site-packages/maturin-1.8.3.dist-info -> /usr/lib/python3.13/site-packages/maturin-1.8.6.dist-info, added "/usr/lib/python3.13/site-packages/maturin/bootstrap.py /usr/lib/python3.13/site-packages/maturin/__pycache__/bootstrap.cpython-313.pyc"
Changes to packages/core2-64-poky-linux/python3-maturin (sysroot):
  /usr/lib/python3.13/site-packages/maturin-1.8.3.dist-info moved to /usr/lib/python3.13/site-packages/maturin-1.8.6.dist-info
  /usr/lib/python3.13/site-packages/maturin/bootstrap.py was added
  /usr/lib/python3.13/site-packages/maturin/__pycache__/bootstrap.cpython-313.pyc was added

--===============7066542140933248981==
Content-Type: application/octet-stream
MIME-Version: 1.0
Content-Transfer-Encoding: base64
Content-Disposition: attachment;
 filename="0001-python3-maturin-upgrade-1.8.3-1.8.6.patch"

RnJvbSBkOWM2ZTQ0ZDQwYzFiM2IyZTIzNjI2MmU4MmQ5OTc0NmUyMmIyMjU2IE1vbiBTZXAgMTcg
MDA6MDA6MDAgMjAwMQpGcm9tOiBVcGdyYWRlIEhlbHBlciA8YXVoQHlvY3RvcHJvamVjdC5vcmc+
CkRhdGU6IFN1biwgMSBKdW4gMjAyNSAwOTozMjowMyArMDAwMApTdWJqZWN0OiBbUEFUQ0hdIHB5
dGhvbjMtbWF0dXJpbjogdXBncmFkZSAxLjguMyAtPiAxLjguNgoKLS0tCiAuLi4vcHl0aG9uL3B5
dGhvbjMtbWF0dXJpbi1jcmF0ZXMuaW5jICAgICAgICAgfCAgMjAgKy0KIC4uLmwtY29kZXMtb24t
cmlzY3YzMmdjLXVua25vd24tbGludXgtZy5wYXRjaCB8IDExMCAtLS0tLQogLi4uL3B5dGhvbi9w
eXRob24zLW1hdHVyaW5fMS44LjMuYmIgICAgICAgICAgIHwgIDQzIC0tCiAuLi4vcHl0aG9uL3B5
dGhvbjMtbWF0dXJpbl8xLjguNi5iYiAgICAgICAgICAgfCA0MDUgKysrKysrKysrKysrKysrKysr
CiA0IGZpbGVzIGNoYW5nZWQsIDQxNSBpbnNlcnRpb25zKCspLCAxNjMgZGVsZXRpb25zKC0pCiBk
ZWxldGUgbW9kZSAxMDA2NDQgbWV0YS9yZWNpcGVzLWRldnRvb2xzL3B5dGhvbi9weXRob24zLW1h
dHVyaW4vMDAwMS1EZWZpbmUtbW9yZS1pb2N0bC1jb2Rlcy1vbi1yaXNjdjMyZ2MtdW5rbm93bi1s
aW51eC1nLnBhdGNoCiBkZWxldGUgbW9kZSAxMDA2NDQgbWV0YS9yZWNpcGVzLWRldnRvb2xzL3B5
dGhvbi9weXRob24zLW1hdHVyaW5fMS44LjMuYmIKIGNyZWF0ZSBtb2RlIDEwMDY0NCBtZXRhL3Jl
Y2lwZXMtZGV2dG9vbHMvcHl0aG9uL3B5dGhvbjMtbWF0dXJpbl8xLjguNi5iYgoKZGlmZiAtLWdp
dCBhL21ldGEvcmVjaXBlcy1kZXZ0b29scy9weXRob24vcHl0aG9uMy1tYXR1cmluLWNyYXRlcy5p
bmMgYi9tZXRhL3JlY2lwZXMtZGV2dG9vbHMvcHl0aG9uL3B5dGhvbjMtbWF0dXJpbi1jcmF0ZXMu
aW5jCmluZGV4IDJmMTk2ZjU2NTcuLjVjOTM5YTA5YTggMTAwNjQ0Ci0tLSBhL21ldGEvcmVjaXBl
cy1kZXZ0b29scy9weXRob24vcHl0aG9uMy1tYXR1cmluLWNyYXRlcy5pbmMKKysrIGIvbWV0YS9y
ZWNpcGVzLWRldnRvb2xzL3B5dGhvbi9weXRob24zLW1hdHVyaW4tY3JhdGVzLmluYwpAQCAtMzQs
NyArMzQsNyBAQCBTUkNfVVJJICs9ICIgXAogICAgIGNyYXRlOi8vY3JhdGVzLmlvL2NhcmdvLW9w
dGlvbnMvMC43LjQgXAogICAgIGNyYXRlOi8vY3JhdGVzLmlvL2NhcmdvLXBsYXRmb3JtLzAuMS44
IFwKICAgICBjcmF0ZTovL2NyYXRlcy5pby9jYXJnby14d2luLzAuMTguNCBcCi0gICAgY3JhdGU6
Ly9jcmF0ZXMuaW8vY2FyZ28temlnYnVpbGQvMC4xOS43IFwKKyAgICBjcmF0ZTovL2NyYXRlcy5p
by9jYXJnby16aWdidWlsZC8wLjIwLjAgXAogICAgIGNyYXRlOi8vY3JhdGVzLmlvL2NhcmdvX21l
dGFkYXRhLzAuMTkuMCBcCiAgICAgY3JhdGU6Ly9jcmF0ZXMuaW8vY2JpbmRnZW4vMC4yOC4wIFwK
ICAgICBjcmF0ZTovL2NyYXRlcy5pby9jYy8xLjIuMTYgXApAQCAtNjAsNyArNjAsNyBAQCBTUkNf
VVJJICs9ICIgXAogICAgIGNyYXRlOi8vY3JhdGVzLmlvL2NyYy8zLjIuMSBcCiAgICAgY3JhdGU6
Ly9jcmF0ZXMuaW8vY3JjLWNhdGFsb2cvMi40LjAgXAogICAgIGNyYXRlOi8vY3JhdGVzLmlvL2Ny
YzMyZmFzdC8xLjQuMiBcCi0gICAgY3JhdGU6Ly9jcmF0ZXMuaW8vY3Jvc3NiZWFtLWNoYW5uZWwv
MC41LjEzIFwKKyAgICBjcmF0ZTovL2NyYXRlcy5pby9jcm9zc2JlYW0tY2hhbm5lbC8wLjUuMTUg
XAogICAgIGNyYXRlOi8vY3JhdGVzLmlvL2Nyb3NzYmVhbS1kZXF1ZS8wLjguNSBcCiAgICAgY3Jh
dGU6Ly9jcmF0ZXMuaW8vY3Jvc3NiZWFtLWVwb2NoLzAuOS4xOCBcCiAgICAgY3JhdGU6Ly9jcmF0
ZXMuaW8vY3Jvc3NiZWFtLXV0aWxzLzAuOC4yMCBcCkBAIC0xNjksMTAgKzE2OSwxMCBAQCBTUkNf
VVJJICs9ICIgXAogICAgIGNyYXRlOi8vY3JhdGVzLmlvL251bS1jb252LzAuMS4wIFwKICAgICBj
cmF0ZTovL2NyYXRlcy5pby9udW1iZXJfcHJlZml4LzAuNC4wIFwKICAgICBjcmF0ZTovL2NyYXRl
cy5pby9vbmNlX2NlbGwvMS4yMC4yIFwKLSAgICBjcmF0ZTovL2NyYXRlcy5pby9vcGVuc3NsLzAu
MTAuNzAgXAorICAgIGNyYXRlOi8vY3JhdGVzLmlvL29wZW5zc2wvMC4xMC43MiBcCiAgICAgY3Jh
dGU6Ly9jcmF0ZXMuaW8vb3BlbnNzbC1tYWNyb3MvMC4xLjEgXAogICAgIGNyYXRlOi8vY3JhdGVz
LmlvL29wZW5zc2wtcHJvYmUvMC4xLjUgXAotICAgIGNyYXRlOi8vY3JhdGVzLmlvL29wZW5zc2wt
c3lzLzAuOS4xMDUgXAorICAgIGNyYXRlOi8vY3JhdGVzLmlvL29wZW5zc2wtc3lzLzAuOS4xMDcg
XAogICAgIGNyYXRlOi8vY3JhdGVzLmlvL29wdGlvbi1leHQvMC4yLjAgXAogICAgIGNyYXRlOi8v
Y3JhdGVzLmlvL29zX3BpcGUvMS4yLjAgXAogICAgIGNyYXRlOi8vY3JhdGVzLmlvL292ZXJsb2Fk
LzAuMS4xIFwKQEAgLTM2Miw3ICszNjIsNyBAQCBTUkNfVVJJICs9ICIgXAogICAgIGNyYXRlOi8v
Y3JhdGVzLmlvL3plcm9pemUvMS44LjEgXAogICAgIGNyYXRlOi8vY3JhdGVzLmlvL3plcm92ZWMv
MC4xMC40IFwKICAgICBjcmF0ZTovL2NyYXRlcy5pby96ZXJvdmVjLWRlcml2ZS8wLjEwLjMgXAot
ICAgIGNyYXRlOi8vY3JhdGVzLmlvL3ppcC8yLjIuMyBcCisgICAgY3JhdGU6Ly9jcmF0ZXMuaW8v
emlwLzIuMy4wIFwKICAgICBjcmF0ZTovL2NyYXRlcy5pby96b3BmbGkvMC44LjEgXAogIgogCkBA
IC0zOTgsNyArMzk4LDcgQEAgU1JDX1VSSVtjYXJnby1jb25maWcyLTAuMS4yNi5zaGEyNTZzdW1d
ID0gImQ4M2NlMGJlOGJkMTQ3OWU1ZGU2MjAyZGVmNjYwZTZjN2UyN2UKIFNSQ19VUklbY2FyZ28t
b3B0aW9ucy0wLjcuNC5zaGEyNTZzdW1dID0gImYzNTQwMjQ3YzBhMzdhNzZlYjMyNGFjYzIzOGRj
NjE3Nzg2ZWEyMmM0M2I5NWRhNTYwYzgyYThmMjcxNDMyMWYiCiBTUkNfVVJJW2NhcmdvLXBsYXRm
b3JtLTAuMS44LnNoYTI1NnN1bV0gPSAiMjRiMWYwMzY1YTZjNmJiNDAyMGNkMDU4MDZmZDBkMzNj
NDRkMzgwNDZiOGJkN2YwZTQwODE0Yjk3NjNjYWJmYyIKIFNSQ19VUklbY2FyZ28teHdpbi0wLjE4
LjQuc2hhMjU2c3VtXSA9ICI2MGYxOTU0ZTRmZmEwZjRjNDdiM2RmNWU2ZTk1MDg3MDZkOGRjYWE1
NjE1MmNkNjcyZGNlZTAyOTMwYmEwMzI2IgotU1JDX1VSSVtjYXJnby16aWdidWlsZC0wLjE5Ljcu
c2hhMjU2c3VtXSA9ICIwNGNjNjQ5MzI4ZjM5YmJmMWVmOTJlZjc1MzQwNmUxNzg1ZmYxMDc0OTQx
YzM5OGU1MjE0YjZjNzRkMzE4YTllIgorU1JDX1VSSVtjYXJnby16aWdidWlsZC0wLjIwLjAuc2hh
MjU2c3VtXSA9ICIzZjZlOWU4NTYzOTBkNWIwYTg1OWFjYWVkYTE2NTI4ZjhhNjFjOTY0YmRiODk0
YzMyMTZjMjU0OTA4ZjFjMmVhIgogU1JDX1VSSVtjYXJnb19tZXRhZGF0YS0wLjE5LjAuc2hhMjU2
c3VtXSA9ICJhZmMzMDllZDg5NDc2Yzg5NTdjNTBmYjgxOGY1NmZlODk0ZGI4NTc4NjZjM2UxNjMz
MzVmYWE5MWRjMzRlYjg1IgogU1JDX1VSSVtjYmluZGdlbi0wLjI4LjAuc2hhMjU2c3VtXSA9ICJl
YWRkODY4YTJjZTljYTM4ZGU3ZWVhZmRjZWM5YzcwNjVlZjg5YjQyYjMyZjA4MzkyNzhkNTVmMzVj
NTRkMWZmIgogU1JDX1VSSVtjYy0xLjIuMTYuc2hhMjU2c3VtXSA9ICJiZTcxNGMxNTRiZTYwOWVj
N2Y1ZGFkMjIzYTMzYmYxNDgyZmZmOTA0NzJkZTI4ZjczNjI4MDZlNmQ0ODMyYjhjIgpAQCAtNDI0
LDcgKzQyNCw3IEBAIFNSQ19VUklbY3B1ZmVhdHVyZXMtMC4yLjEyLnNoYTI1NnN1bV0gPSAiNTNm
ZTVlMjZmZjFiN2FlZjhiY2E5YzYwODA1MjBjZmI4ZDkzMzNjCiBTUkNfVVJJW2NyYy0zLjIuMS5z
aGEyNTZzdW1dID0gIjY5ZTZlNGQ3YjMzYTk0ZjA5OTFjMjY3Mjk5NzZiMTBlYmRlMWQzNGMzZWU4
MjQwOGZiNTM2MTY0ZmExMGQ2MzYiCiBTUkNfVVJJW2NyYy1jYXRhbG9nLTIuNC4wLnNoYTI1NnN1
bV0gPSAiMTlkMzc0Mjc2YjQwZmI4YmJkZWU5NWFlZjdjN2ZhNmI1MzE2ZWM3NjQ1MTBlYjY0Yjhk
ZDBlMmVkMGQ3ZTdmNSIKIFNSQ19VUklbY3JjMzJmYXN0LTEuNC4yLnNoYTI1NnN1bV0gPSAiYTk3
NzY5ZDk0ZGRhYjk0M2U0NTEwZDEzODE1MDE2OWEyNzU4YjVlZjNlYjE5MWE5ZWU2ODhkZTNlMjNl
ZjdiMyIKLVNSQ19VUklbY3Jvc3NiZWFtLWNoYW5uZWwtMC41LjEzLnNoYTI1NnN1bV0gPSAiMzM0
ODBkNjk0NjE5M2FhODAzMzkxMDEyNDg5NmNhMzk1MzMzY2FlN2UyZDExMTNkMWZlZjZjMzI3MjIx
N2RmMiIKK1NSQ19VUklbY3Jvc3NiZWFtLWNoYW5uZWwtMC41LjE1LnNoYTI1NnN1bV0gPSAiODJi
OGY4Zjg2OGIzNjk2N2Y5NjA2NzkwZDE5MDM1NzBkZTljZWFmODcwYTdiZjlmYmJkMzAxNmQ2MzZh
MmNiMiIKIFNSQ19VUklbY3Jvc3NiZWFtLWRlcXVlLTAuOC41LnNoYTI1NnN1bV0gPSAiNjEzZjhj
YzAxZmU5Y2YxYTNlYjNkN2Y0ODhmZDJmYTgzODg0MDNlOTcwMzllMmY3MzY5MjkzMmUyOTFhNzcw
ZCIKIFNSQ19VUklbY3Jvc3NiZWFtLWVwb2NoLTAuOS4xOC5zaGEyNTZzdW1dID0gIjViODJhYzRh
M2MyY2E5YzM0NjA5NjRmMDIwZTE0MDJlZGQ1NzUzNDExZDc3MzdhYTM5YzM3MTRhZDFiNTQyMGUi
CiBTUkNfVVJJW2Nyb3NzYmVhbS11dGlscy0wLjguMjAuc2hhMjU2c3VtXSA9ICIyMmVjOTk1NDVi
YjBlZDBlYTdiYjliOGUxZTkxMjJlYTM4NmZmOGE0OGMwOTIyZTQzZjM2ZDQ1YWIwOWUwZTgwIgpA
QCAtNTMzLDEwICs1MzMsMTAgQEAgU1JDX1VSSVtudS1hbnNpLXRlcm0tMC40Ni4wLnNoYTI1NnN1
bV0gPSAiNzdhODE2NTcyNmU4MjM2MDY0ZGJiNDU0NTkyNDI2MDAzMDRiNDIKIFNSQ19VUklbbnVt
LWNvbnYtMC4xLjAuc2hhMjU2c3VtXSA9ICI1MWQ1MTVkMzJmYjE4MmVlMzdjZGEyY2NkY2I5Mjk1
MGQ2YTNjMjg5M2FhMjgwZTU0MDY3MWMyY2QwZjNiMWQ5IgogU1JDX1VSSVtudW1iZXJfcHJlZml4
LTAuNC4wLnNoYTI1NnN1bV0gPSAiODMwYjI0NmEwZTVmMjBhZjg3MTQxYjI1YzE3M2NkMWI2MDli
ZDc3NzlhNDYxN2Q2ZWM1ODJhYmFmOTA4NzBmMyIKIFNSQ19VUklbb25jZV9jZWxsLTEuMjAuMi5z
aGEyNTZzdW1dID0gIjEyNjFmZTdlMzNjNzNiMzU0ZWFiNDNiMTI3M2E1N2M4Zjk2N2QwMzkxZTgw
MzUzZTUxZjc2NGFjMDJjZjY3NzUiCi1TUkNfVVJJW29wZW5zc2wtMC4xMC43MC5zaGEyNTZzdW1d
ID0gIjYxY2ZiNGUxNjZhOGJiOGM5YjU1YzUwMGJjMjMwODU1MDE0OGVjZTg4OWJlOTBmNjA5Mzc3
ZTU4MTQwZjQyYzYiCitTUkNfVVJJW29wZW5zc2wtMC4xMC43Mi5zaGEyNTZzdW1dID0gImZlZGZl
YTdkNThhMWY3MzExODQzMGE1NWRhNmEyODZlN2IwNDQ5NjE3MzZjZTk2YTE2YTE3MDY4ZWEyNWU1
ZGEiCiBTUkNfVVJJW29wZW5zc2wtbWFjcm9zLTAuMS4xLnNoYTI1NnN1bV0gPSAiYTk0ODY2NmI2
MzdhMGY0NjVlODU2NGM3M2U4OWQ0ZGRlMDBkNzJkNGQ0NzNjYzk3MmYzOTBmYzNkY2VlN2Q5YyIK
IFNSQ19VUklbb3BlbnNzbC1wcm9iZS0wLjEuNS5zaGEyNTZzdW1dID0gImZmMDExYTMwMmMzOTZh
NTE5NzY5MjQzMWZjMTk0ODAxOTE1NGFmYzE3OGJhZjdkOGUzNzM2NzQ0MmE0NjAxY2YiCi1TUkNf
VVJJW29wZW5zc2wtc3lzLTAuOS4xMDUuc2hhMjU2c3VtXSA9ICI4YjIyZDViODRiZTA1YThkNjk0
N2M3Y2I3MWY3Yzg0OWFhMGYxMTJhY2Q0YmY1MWMyYTdjMWM5ODhhYzBhOWRjIgorU1JDX1VSSVtv
cGVuc3NsLXN5cy0wLjkuMTA3LnNoYTI1NnN1bV0gPSAiODI4ODk3OWFjZDg0NzQ5Yzc0NGE5MDE0
YjQzODJkNDJiOGY3YjI1OTI4NDdiNWFmYjJlZDI5ZTVkMTZlZGUwNyIKIFNSQ19VUklbb3B0aW9u
LWV4dC0wLjIuMC5zaGEyNTZzdW1dID0gIjA0NzQ0ZjQ5ZWFlOTlhYjc4ZTBkNWMwYjYwM2FiMjE4
ZjUxNWVhOGNmZTVhNDU2ZDc2MjlhZDg4M2EzYjZlN2QiCiBTUkNfVVJJW29zX3BpcGUtMS4yLjAu
c2hhMjU2c3VtXSA9ICIyOWQ3M2JhOGRhZjhmYWMxM2IwNTAxZDFhYmVkZGNmZTIxYmE3NDAxYWRh
NjFhODE5MTQ0YjZjMmE0ZjMyMjA5IgogU1JDX1VSSVtvdmVybG9hZC0wLjEuMS5zaGEyNTZzdW1d
ID0gImIxNTgxMzE2M2MxZDgzMWJmNGExM2MzNjEwYzA1YzBkMDNiMzlmZWIwN2Y3ZTA5ZmEyMzRk
YWM5YjE1YWFmMzkiCkBAIC03MjYsNSArNzI2LDUgQEAgU1JDX1VSSVt6ZXJvZnJvbS1kZXJpdmUt
MC4xLjUuc2hhMjU2c3VtXSA9ICI1OTVlZWQ5ODJmN2QzNTViZWI4NTgzN2Y2NTFmYTIyZTkwYjMK
IFNSQ19VUklbemVyb2l6ZS0xLjguMS5zaGEyNTZzdW1dID0gImNlZDM2NzhhMjg3OWIzMDMwNmQz
MjNmNDU0MjYyNjY5N2E0NjRhOTdjMGEwN2M5YWViZjdlYmNhNjVjZDRkZGUiCiBTUkNfVVJJW3pl
cm92ZWMtMC4xMC40LnNoYTI1NnN1bV0gPSAiYWEyYjg5M2Q3OWRmMjNiZmIxMmQ1NDYxMDE4ZDQw
OGVhMTlkZmFmZTc2YzJjN2VmNmQ0ZWJhNjE0ZjhmZjA3OSIKIFNSQ19VUklbemVyb3ZlYy1kZXJp
dmUtMC4xMC4zLnNoYTI1NnN1bV0gPSAiNmVhZmE2ZGZiMTc1ODRlYTNlMmJkNmU3NmUwY2MxNWFk
N2FmMTJiMDlhYmRkMWNhNTU5NjFiZWQ5YjEwNjNjNiIKLVNSQ19VUklbemlwLTIuMi4zLnNoYTI1
NnN1bV0gPSAiYjI4MDQ4NGM0NTRlNzRlNWZmZjY1OGJiZjdkZjhmZGJlN2EwN2M2YjJkZTRhNTNk
ZWYyMzJjMTVlZjEzOGYzYSIKK1NSQ19VUklbemlwLTIuMy4wLnNoYTI1NnN1bV0gPSAiODRlOWE3
NzJhNTRiNTQyMzZiOWI3NDRhYWFmOGQ3YmUwMWI0ZDZlOTk3MjU1MjNjYjgyY2IzMmQxYzgxYjFk
NyIKIFNSQ19VUklbem9wZmxpLTAuOC4xLnNoYTI1NnN1bV0gPSAiZTUwMTlmMzkxYmFjNWNmMjUy
ZTkzYmJjYzUzZDAzOWZmZDYyYzdiZmI3YzE1MDQxNGQ2MTM2OWFmZTU3ZTk0NiIKZGlmZiAtLWdp
dCBhL21ldGEvcmVjaXBlcy1kZXZ0b29scy9weXRob24vcHl0aG9uMy1tYXR1cmluLzAwMDEtRGVm
aW5lLW1vcmUtaW9jdGwtY29kZXMtb24tcmlzY3YzMmdjLXVua25vd24tbGludXgtZy5wYXRjaCBi
L21ldGEvcmVjaXBlcy1kZXZ0b29scy9weXRob24vcHl0aG9uMy1tYXR1cmluLzAwMDEtRGVmaW5l
LW1vcmUtaW9jdGwtY29kZXMtb24tcmlzY3YzMmdjLXVua25vd24tbGludXgtZy5wYXRjaApkZWxl
dGVkIGZpbGUgbW9kZSAxMDA2NDQKaW5kZXggYWNlZWZhNzk2Ny4uMDAwMDAwMDAwMAotLS0gYS9t
ZXRhL3JlY2lwZXMtZGV2dG9vbHMvcHl0aG9uL3B5dGhvbjMtbWF0dXJpbi8wMDAxLURlZmluZS1t
b3JlLWlvY3RsLWNvZGVzLW9uLXJpc2N2MzJnYy11bmtub3duLWxpbnV4LWcucGF0Y2gKKysrIC9k
ZXYvbnVsbApAQCAtMSwxMTAgKzAsMCBAQAotRnJvbSA0YjQzOWIwOTUzNTczZTAzODNkYTdlMDky
YjFmNTE2YmEyMWYzMzk4IE1vbiBTZXAgMTcgMDA6MDA6MDAgMjAwMQotRnJvbTogRGFuIEdvaG1h
biA8ZGV2QHN1bmZpc2hjb2RlLm9ubGluZT4KLURhdGU6IFN1biwgNiBBcHIgMjAyNSAwNToyMjo0
OSAtMDcwMAotU3ViamVjdDogW1BBVENIXSBEZWZpbmUgTGludXggaW9jdGwgY29kZXMgb24gbW9y
ZSBhcmNoaXRlY3R1cmVzLgotCi1EZWZpbmUgaW9jdGwgY29kZXMgaW5jbHVkaW5nIGBGSUNMT05F
YCBhbmQgYEZTX0lPQzMyX0dFVFZFUlNJT05gIHVzaW5nCi1gX0lPUmAgYW5kIGBfSU9XYCBzbyB0
aGF0IHRoZXkncmUgYXV0b21hdGljYWxseSBzdXBwb3J0ZWQgb24gYWxsCi1hcmNoaXRlY3R1cmVz
LCBpbmNsdWRpbmcgcmlzY3YzMmdjLXVua25vd24tbGludXgtZ251LgotCi1VcHN0cmVhbS1TdGF0
dXM6IEJhY2twb3J0IFtodHRwczovL2dpdGh1Yi5jb20vcnVzdC1sYW5nL2xpYmMvcHVsbC80Mzgy
L10KLVNpZ25lZC1vZmYtYnk6IEtoZW0gUmFqIDxyYWoua2hlbUBnbWFpbC5jb20+Ci0tLS0KLSBz
cmMvdW5peC9saW51eF9saWtlL2xpbnV4L2FyY2gvZ2VuZXJpYy9tb2QucnMgfCA3NSArKysrLS0t
LS0tLS0tLS0tLS0tCi0gMSBmaWxlIGNoYW5nZWQsIDE1IGluc2VydGlvbnMoKyksIDYwIGRlbGV0
aW9ucygtKQotCi0tLS0gYS9zcmMvdW5peC9saW51eF9saWtlL2xpbnV4L2FyY2gvZ2VuZXJpYy9t
b2QucnMKLSsrKyBiL3NyYy91bml4L2xpbnV4X2xpa2UvbGludXgvYXJjaC9nZW5lcmljL21vZC5y
cwotQEAgLTEsNSArMSw1IEBACi0gdXNlIGNyYXRlOjpwcmVsdWRlOjoqOwotLXVzZSBjcmF0ZTo6
SW9jdGw7Ci0rdXNlIGNyYXRlOjp7SW9jdGwsIF9JT1IsIF9JT1d9OwotIAotIHMhIHsKLSAgICAg
cHViIHN0cnVjdCB0ZXJtaW9zMiB7Ci1AQCAtMTE2LDIxICsxMTYsOCBAQCBjZmdfaWYhIHsKLSAv
LyBwdWIgY29uc3QgU09fUFJFRkVSX0JVU1lfUE9MTDogY19pbnQgPSA2OTsKLSAvLyBwdWIgY29u
c3QgU09fQlVTWV9QT0xMX0JVREdFVDogY19pbnQgPSA3MDsKLSAKLS1jZmdfaWYhIHsKLS0gICAg
aWYgI1tjZmcoYW55KAotLSAgICAgICAgdGFyZ2V0X2FyY2ggPSAieDg2IiwKLS0gICAgICAgIHRh
cmdldF9hcmNoID0gIng4Nl82NCIsCi0tICAgICAgICB0YXJnZXRfYXJjaCA9ICJhcm0iLAotLSAg
ICAgICAgdGFyZ2V0X2FyY2ggPSAiYWFyY2g2NCIsCi0tICAgICAgICB0YXJnZXRfYXJjaCA9ICJy
aXNjdjY0IiwKLS0gICAgICAgIHRhcmdldF9hcmNoID0gInMzOTB4IiwKLS0gICAgICAgIHRhcmdl
dF9hcmNoID0gImNza3kiLAotLSAgICAgICAgdGFyZ2V0X2FyY2ggPSAibG9vbmdhcmNoNjQiCi0t
ICAgICkpXSB7Ci0tICAgICAgICBwdWIgY29uc3QgRklDTE9ORTogY191bG9uZyA9IDB4NDAwNDk0
MDk7Ci0tICAgICAgICBwdWIgY29uc3QgRklDTE9ORVJBTkdFOiBjX3Vsb25nID0gMHg0MDIwOTQw
RDsKLS0gICAgfQotLX0KLStwdWIgY29uc3QgRklDTE9ORTogSW9jdGwgPSBfSU9XOjo8Y19pbnQ+
KDB4OTQsIDkpIGFzIElvY3RsOwotK3B1YiBjb25zdCBGSUNMT05FUkFOR0U6IElvY3RsID0gX0lP
Vzo6PGNyYXRlOjpmaWxlX2Nsb25lX3JhbmdlPigweDk0LCAxMykgYXMgSW9jdGw7Ci0gCi0gLy8g
RGVmaW5lZCBpbiB1bml4L2xpbnV4X2xpa2UvbW9kLnJzCi0gLy8gcHViIGNvbnN0IFNDTV9USU1F
U1RBTVA6IGNfaW50ID0gU09fVElNRVNUQU1QOwotQEAgLTI0OCw0OSArMjM1LDE4IEBAIHB1YiBj
b25zdCBUVU5HRVRWTkVUQkU6IElvY3RsID0gMHg4MDA0NTQKLSBwdWIgY29uc3QgVFVOU0VUU1RF
RVJJTkdFQlBGOiBJb2N0bCA9IDB4ODAwNDU0ZTA7Ci0gcHViIGNvbnN0IFRVTlNFVEZJTFRFUkVC
UEY6IElvY3RsID0gMHg4MDA0NTRlMTsKLSAKLS1jZmdfaWYhIHsKLS0gICAgLy8gVGhvc2UgdHlw
ZSBhcmUgY29uc3RydWN0ZWQgdXNpbmcgdGhlIF9JT0MgbWFjcm8KLS0gICAgLy8gREQtU1NfU1NT
U19TU1NTX1NTU1MtVFRUVF9UVFRULU5OTk5fTk5OTgotLSAgICAvLyB3aGVyZSBEIHN0YW5kcyBm
b3IgZGlyZWN0aW9uIChlaXRoZXIgTm9uZSAoMDApLCBSZWFkICgwMSkgb3IgV3JpdGUgKDExKSkK
LS0gICAgLy8gd2hlcmUgUyBzdGFuZHMgZm9yIHNpemUgKGludCwgbG9uZywgc3RydWN0Li4uKQot
LSAgICAvLyB3aGVyZSBUIHN0YW5kcyBmb3IgdHlwZSAoJ2YnLCd2JywnWCcuLi4pCi0tICAgIC8v
IHdoZXJlIE4gc3RhbmRzIGZvciBOUiAoTnVtYmVSKQotLSAgICBpZiAjW2NmZyhhbnkoCi0tICAg
ICAgICB0YXJnZXRfYXJjaCA9ICJ4ODYiLAotLSAgICAgICAgdGFyZ2V0X2FyY2ggPSAiYXJtIiwK
LS0gICAgICAgIHRhcmdldF9hcmNoID0gImNza3kiCi0tICAgICkpXSB7Ci0tICAgICAgICBwdWIg
Y29uc3QgRlNfSU9DX0dFVEZMQUdTOiBJb2N0bCA9IDB4ODAwNDY2MDE7Ci0tICAgICAgICBwdWIg
Y29uc3QgRlNfSU9DX1NFVEZMQUdTOiBJb2N0bCA9IDB4NDAwNDY2MDI7Ci0tICAgICAgICBwdWIg
Y29uc3QgRlNfSU9DX0dFVFZFUlNJT046IElvY3RsID0gMHg4MDA0NzYwMTsKLS0gICAgICAgIHB1
YiBjb25zdCBGU19JT0NfU0VUVkVSU0lPTjogSW9jdGwgPSAweDQwMDQ3NjAyOwotLSAgICAgICAg
cHViIGNvbnN0IEZTX0lPQzMyX0dFVEZMQUdTOiBJb2N0bCA9IDB4ODAwNDY2MDE7Ci0tICAgICAg
ICBwdWIgY29uc3QgRlNfSU9DMzJfU0VURkxBR1M6IElvY3RsID0gMHg0MDA0NjYwMjsKLS0gICAg
ICAgIHB1YiBjb25zdCBGU19JT0MzMl9HRVRWRVJTSU9OOiBJb2N0bCA9IDB4ODAwNDc2MDE7Ci0t
ICAgICAgICBwdWIgY29uc3QgRlNfSU9DMzJfU0VUVkVSU0lPTjogSW9jdGwgPSAweDQwMDQ3NjAy
OwotLSAgICAgICAgcHViIGNvbnN0IFRVTkFUVEFDSEZJTFRFUjogSW9jdGwgPSAweDQwMDg1NGQ1
OwotLSAgICAgICAgcHViIGNvbnN0IFRVTkRFVEFDSEZJTFRFUjogSW9jdGwgPSAweDQwMDg1NGQ2
OwotLSAgICAgICAgcHViIGNvbnN0IFRVTkdFVEZJTFRFUjogSW9jdGwgPSAweDgwMDg1NGRiOwot
LSAgICB9IGVsc2UgaWYgI1tjZmcoYW55KAotLSAgICAgICAgdGFyZ2V0X2FyY2ggPSAieDg2XzY0
IiwKLS0gICAgICAgIHRhcmdldF9hcmNoID0gInJpc2N2NjQiLAotLSAgICAgICAgdGFyZ2V0X2Fy
Y2ggPSAiYWFyY2g2NCIsCi0tICAgICAgICB0YXJnZXRfYXJjaCA9ICJzMzkweCIsCi0tICAgICAg
ICB0YXJnZXRfYXJjaCA9ICJsb29uZ2FyY2g2NCIKLS0gICAgKSldIHsKLS0gICAgICAgIHB1YiBj
b25zdCBGU19JT0NfR0VURkxBR1M6IElvY3RsID0gMHg4MDA4NjYwMTsKLS0gICAgICAgIHB1YiBj
b25zdCBGU19JT0NfU0VURkxBR1M6IElvY3RsID0gMHg0MDA4NjYwMjsKLS0gICAgICAgIHB1YiBj
b25zdCBGU19JT0NfR0VUVkVSU0lPTjogSW9jdGwgPSAweDgwMDg3NjAxOwotLSAgICAgICAgcHVi
IGNvbnN0IEZTX0lPQ19TRVRWRVJTSU9OOiBJb2N0bCA9IDB4NDAwODc2MDI7Ci0tICAgICAgICBw
dWIgY29uc3QgRlNfSU9DMzJfR0VURkxBR1M6IElvY3RsID0gMHg4MDA0NjYwMTsKLS0gICAgICAg
IHB1YiBjb25zdCBGU19JT0MzMl9TRVRGTEFHUzogSW9jdGwgPSAweDQwMDQ2NjAyOwotLSAgICAg
ICAgcHViIGNvbnN0IEZTX0lPQzMyX0dFVFZFUlNJT046IElvY3RsID0gMHg4MDA0NzYwMTsKLS0g
ICAgICAgIHB1YiBjb25zdCBGU19JT0MzMl9TRVRWRVJTSU9OOiBJb2N0bCA9IDB4NDAwNDc2MDI7
Ci0tICAgICAgICBwdWIgY29uc3QgVFVOQVRUQUNIRklMVEVSOiBJb2N0bCA9IDB4NDAxMDU0ZDU7
Ci0tICAgICAgICBwdWIgY29uc3QgVFVOREVUQUNIRklMVEVSOiBJb2N0bCA9IDB4NDAxMDU0ZDY7
Ci0tICAgICAgICBwdWIgY29uc3QgVFVOR0VURklMVEVSOiBJb2N0bCA9IDB4ODAxMDU0ZGI7Ci0t
ICAgIH0KLS19Ci0rcHViIGNvbnN0IEZTX0lPQ19HRVRGTEFHUzogSW9jdGwgPSBfSU9SOjo8Y19s
b25nPignZicgYXMgdTMyLCAxKSBhcyBJb2N0bDsKLStwdWIgY29uc3QgRlNfSU9DX1NFVEZMQUdT
OiBJb2N0bCA9IF9JT1c6OjxjX2xvbmc+KCdmJyBhcyB1MzIsIDIpIGFzIElvY3RsOwotK3B1YiBj
b25zdCBGU19JT0NfR0VUVkVSU0lPTjogSW9jdGwgPSBfSU9SOjo8Y19sb25nPigndicgYXMgdTMy
LCAxKSBhcyBJb2N0bDsKLStwdWIgY29uc3QgRlNfSU9DX1NFVFZFUlNJT046IElvY3RsID0gX0lP
Vzo6PGNfbG9uZz4oJ3YnIGFzIHUzMiwgMikgYXMgSW9jdGw7Ci0rcHViIGNvbnN0IEZTX0lPQzMy
X0dFVEZMQUdTOiBJb2N0bCA9IF9JT1I6OjxjX2ludD4oJ2YnIGFzIHUzMiwgMSkgYXMgSW9jdGw7
Ci0rcHViIGNvbnN0IEZTX0lPQzMyX1NFVEZMQUdTOiBJb2N0bCA9IF9JT1c6OjxjX2ludD4oJ2Yn
IGFzIHUzMiwgMikgYXMgSW9jdGw7Ci0rcHViIGNvbnN0IEZTX0lPQzMyX0dFVFZFUlNJT046IElv
Y3RsID0gX0lPUjo6PGNfaW50PigndicgYXMgdTMyLCAxKSBhcyBJb2N0bDsKLStwdWIgY29uc3Qg
RlNfSU9DMzJfU0VUVkVSU0lPTjogSW9jdGwgPSBfSU9XOjo8Y19pbnQ+KCd2JyBhcyB1MzIsIDIp
IGFzIElvY3RsOwotKwotK3B1YiBjb25zdCBUVU5BVFRBQ0hGSUxURVI6IElvY3RsID0gX0lPVzo6
PGNyYXRlOjpzb2NrX2Zwcm9nPignVCcgYXMgdTMyLCAyMTMpIGFzIElvY3RsOwotK3B1YiBjb25z
dCBUVU5ERVRBQ0hGSUxURVI6IElvY3RsID0gX0lPVzo6PGNyYXRlOjpzb2NrX2Zwcm9nPignVCcg
YXMgdTMyLCAyMTQpIGFzIElvY3RsOwotK3B1YiBjb25zdCBUVU5HRVRGSUxURVI6IElvY3RsID0g
X0lPUjo6PGNyYXRlOjpzb2NrX2Zwcm9nPignVCcgYXMgdTMyLCAyMTkpIGFzIElvY3RsOwotIAot
IGNmZ19pZiEgewotICAgICBpZiAjW2NmZyhhbnkodGFyZ2V0X2FyY2ggPSAiYXJtIiwgdGFyZ2V0
X2FyY2ggPSAiczM5MHgiKSldIHsKZGlmZiAtLWdpdCBhL21ldGEvcmVjaXBlcy1kZXZ0b29scy9w
eXRob24vcHl0aG9uMy1tYXR1cmluXzEuOC4zLmJiIGIvbWV0YS9yZWNpcGVzLWRldnRvb2xzL3B5
dGhvbi9weXRob24zLW1hdHVyaW5fMS44LjMuYmIKZGVsZXRlZCBmaWxlIG1vZGUgMTAwNjQ0Cmlu
ZGV4IDA4OTc1ZTE3N2YuLjAwMDAwMDAwMDAKLS0tIGEvbWV0YS9yZWNpcGVzLWRldnRvb2xzL3B5
dGhvbi9weXRob24zLW1hdHVyaW5fMS44LjMuYmIKKysrIC9kZXYvbnVsbApAQCAtMSw0MyArMCww
IEBACi1TVU1NQVJZID0gIkJ1aWxkIGFuZCBwdWJsaXNoIGNyYXRlcyB3aXRoIHB5bzMsIHJ1c3Qt
Y3B5dGhvbiwgY2ZmaSBiaW5kaW5ncyBhbmQgcnVzdCBiaW5hcmllcyBhcyBweXRob24gcGFja2Fn
ZXMiCi1IT01FUEFHRSA9ICJodHRwczovL2dpdGh1Yi5jb20vcHlvMy9tYXR1cmluIgotU0VDVElP
TiA9ICJkZXZlbC9weXRob24iCi1MSUNFTlNFID0gIk1JVCB8IEFwYWNoZS0yLjAiCi1MSUNfRklM
RVNfQ0hLU1VNID0gImZpbGU6Ly9saWNlbnNlLWFwYWNoZTttZDU9MTgzNmVmYjJlYjc3OTk2NjY5
NmY0NzNlZTg1NDA1NDIgXAotICAgICAgICAgICAgICAgICAgICBmaWxlOi8vbGljZW5zZS1taXQ7
bWQ1PTg1ZmQzYjY3MDY5Y2ZmNzg0ZDk4ZWJmYzdkNWMwNzk3IgotCi1TUkNfVVJJICs9ICJmaWxl
Oi8vMDAwMS1EZWZpbmUtbW9yZS1pb2N0bC1jb2Rlcy1vbi1yaXNjdjMyZ2MtdW5rbm93bi1saW51
eC1nLnBhdGNoO3BhdGNoZGlyPSR7Q0FSR09fVkVORE9SSU5HX0RJUkVDVE9SWX0vbGliYy0wLjIu
MTY3IgotU1JDX1VSSVtzaGEyNTZzdW1dID0gIjMwNDc2MmY4NmZkNTNhODAzMWIxYmYwMDZkMTI1
NzJhMmFhMGE1MjM1NDg1MDMxMTEzMTk1Y2MwMTUyZTFlMTIiCi0KLVMgPSAiJHtXT1JLRElSfS9t
YXR1cmluLSR7UFZ9IgotCi1DRkxBR1MgKz0gIi1mZmlsZS1wcmVmaXgtbWFwPSR7Q0FSR09fSE9N
RX09JHtUQVJHRVRfREJHU1JDX0RJUn0vY2FyZ29faG9tZSIKLQotREVQRU5EUyArPSAiXAotICAg
IHB5dGhvbjMtc2V0dXB0b29scy1ydXN0LW5hdGl2ZSBcCi0gICAgcHl0aG9uMy1zZW1hbnRpYy12
ZXJzaW9uLW5hdGl2ZSBcCi0gICAgcHl0aG9uMy1zZXR1cHRvb2xzLXJ1c3QgXAotIgotCi1yZXF1
aXJlICR7QlBOfS1jcmF0ZXMuaW5jCi0KLWluaGVyaXQgcHlwaSBjYXJnby11cGRhdGUtcmVjaXBl
LWNyYXRlcyBweXRob25fcHlvMyBweXRob25fc2V0dXB0b29sc19idWlsZF9tZXRhCi0KLWRvX2Nv
bmZpZ3VyZSgpIHsKLSAgICBweXRob25fcHlvM19kb19jb25maWd1cmUKLSAgICBjYXJnb19jb21t
b25fZG9fY29uZmlndXJlCi0gICAgcHl0aG9uX3BlcDUxN19kb19jb25maWd1cmUKLX0KLQotUkRF
UEVORFM6JHtQTn0gKz0gIlwKLSAgICBjYXJnbyBcCi0gICAgcHl0aG9uMy1qc29uIFwKLSAgICBy
dXN0IFwKLSIKLQotUlJFQ09NTUVORFM6JHtQTn0gKz0gIlwKLSAgICBweXRob24zLWVuc3VyZXBp
cCBcCi0gICAgcHl0aG9uMy1waXAgXAotICAgIHB5dGhvbjMtdmVudiBcCi0iCi0KLUJCQ0xBU1NF
WFRFTkQgPSAibmF0aXZlIG5hdGl2ZXNkayIKZGlmZiAtLWdpdCBhL21ldGEvcmVjaXBlcy1kZXZ0
b29scy9weXRob24vcHl0aG9uMy1tYXR1cmluXzEuOC42LmJiIGIvbWV0YS9yZWNpcGVzLWRldnRv
b2xzL3B5dGhvbi9weXRob24zLW1hdHVyaW5fMS44LjYuYmIKbmV3IGZpbGUgbW9kZSAxMDA2NDQK
aW5kZXggMDAwMDAwMDAwMC4uZDdhYTlmYzk5ZgotLS0gL2Rldi9udWxsCisrKyBiL21ldGEvcmVj
aXBlcy1kZXZ0b29scy9weXRob24vcHl0aG9uMy1tYXR1cmluXzEuOC42LmJiCkBAIC0wLDAgKzEs
NDA1IEBACitTVU1NQVJZID0gIkJ1aWxkIGFuZCBwdWJsaXNoIGNyYXRlcyB3aXRoIHB5bzMsIHJ1
c3QtY3B5dGhvbiwgY2ZmaSBiaW5kaW5ncyBhbmQgcnVzdCBiaW5hcmllcyBhcyBweXRob24gcGFj
a2FnZXMiCitIT01FUEFHRSA9ICJodHRwczovL2dpdGh1Yi5jb20vcHlvMy9tYXR1cmluIgorU0VD
VElPTiA9ICJkZXZlbC9weXRob24iCitMSUNFTlNFID0gIk1JVCB8IEFwYWNoZS0yLjAiCitMSUNf
RklMRVNfQ0hLU1VNID0gImZpbGU6Ly9saWNlbnNlLWFwYWNoZTttZDU9MTgzNmVmYjJlYjc3OTk2
NjY5NmY0NzNlZTg1NDA1NDIgXAorICAgICAgICAgICAgICAgICAgICBmaWxlOi8vbGljZW5zZS1t
aXQ7bWQ1PTg1ZmQzYjY3MDY5Y2ZmNzg0ZDk4ZWJmYzdkNWMwNzk3IgorCitTUkNfVVJJICs9ICJj
cmF0ZTovL2NyYXRlcy5pby9hZGxlcjIvMi4wLjAgXAorICAgICAgICAgICBjcmF0ZTovL2NyYXRl
cy5pby9haGFzaC8wLjguMTEgXAorICAgICAgICAgICBjcmF0ZTovL2NyYXRlcy5pby9haG8tY29y
YXNpY2svMS4xLjMgXAorICAgICAgICAgICBjcmF0ZTovL2NyYXRlcy5pby9hbGxvY2F0b3ItYXBp
Mi8wLjIuMTggXAorICAgICAgICAgICBjcmF0ZTovL2NyYXRlcy5pby9hbnN0cmVhbS8wLjYuMTQg
XAorICAgICAgICAgICBjcmF0ZTovL2NyYXRlcy5pby9hbnN0eWxlLzEuMC43IFwKKyAgICAgICAg
ICAgY3JhdGU6Ly9jcmF0ZXMuaW8vYW5zdHlsZS1wYXJzZS8wLjIuNCBcCisgICAgICAgICAgIGNy
YXRlOi8vY3JhdGVzLmlvL2Fuc3R5bGUtcXVlcnkvMS4xLjAgXAorICAgICAgICAgICBjcmF0ZTov
L2NyYXRlcy5pby9hbnN0eWxlLXdpbmNvbi8zLjAuMyBcCisgICAgICAgICAgIGNyYXRlOi8vY3Jh
dGVzLmlvL2FueWhvdy8xLjAuODkgXAorICAgICAgICAgICBjcmF0ZTovL2NyYXRlcy5pby9hcmJp
dHJhcnkvMS40LjEgXAorICAgICAgICAgICBjcmF0ZTovL2NyYXRlcy5pby9hdXRvY2ZnLzEuMy4w
IFwKKyAgICAgICAgICAgY3JhdGU6Ly9jcmF0ZXMuaW8vYXV0b21vZC8xLjAuMTQgXAorICAgICAg
ICAgICBjcmF0ZTovL2NyYXRlcy5pby9iYXNlNjQvMC4yMS43IFwKKyAgICAgICAgICAgY3JhdGU6
Ly9jcmF0ZXMuaW8vYmFzZTY0LzAuMjIuMSBcCisgICAgICAgICAgIGNyYXRlOi8vY3JhdGVzLmlv
L2JpdGZsYWdzLzEuMy4yIFwKKyAgICAgICAgICAgY3JhdGU6Ly9jcmF0ZXMuaW8vYml0ZmxhZ3Mv
Mi41LjAgXAorICAgICAgICAgICBjcmF0ZTovL2NyYXRlcy5pby9ibG9jay1idWZmZXIvMC4xMC40
IFwKKyAgICAgICAgICAgY3JhdGU6Ly9jcmF0ZXMuaW8vYm94Y2FyLzAuMi44IFwKKyAgICAgICAg
ICAgY3JhdGU6Ly9jcmF0ZXMuaW8vYnN0ci8xLjEwLjAgXAorICAgICAgICAgICBjcmF0ZTovL2Ny
YXRlcy5pby9idW1wYWxvLzMuMTYuMCBcCisgICAgICAgICAgIGNyYXRlOi8vY3JhdGVzLmlvL2J5
dGVvcmRlci8xLjUuMCBcCisgICAgICAgICAgIGNyYXRlOi8vY3JhdGVzLmlvL2J5dGVzLzEuOS4w
IFwKKyAgICAgICAgICAgY3JhdGU6Ly9jcmF0ZXMuaW8vYnl0ZXNpemUvMS4zLjAgXAorICAgICAg
ICAgICBjcmF0ZTovL2NyYXRlcy5pby9iemlwMi8wLjUuMiBcCisgICAgICAgICAgIGNyYXRlOi8v
Y3JhdGVzLmlvL2J6aXAyLXN5cy8wLjEuMTMrMS4wLjggXAorICAgICAgICAgICBjcmF0ZTovL2Ny
YXRlcy5pby9jYWIvMC42LjAgXAorICAgICAgICAgICBjcmF0ZTovL2NyYXRlcy5pby9jYW1pbm8v
MS4xLjkgXAorICAgICAgICAgICBjcmF0ZTovL2NyYXRlcy5pby9jYXJnby1jb25maWcyLzAuMS4y
NiBcCisgICAgICAgICAgIGNyYXRlOi8vY3JhdGVzLmlvL2NhcmdvLW9wdGlvbnMvMC43LjQgXAor
ICAgICAgICAgICBjcmF0ZTovL2NyYXRlcy5pby9jYXJnby1wbGF0Zm9ybS8wLjEuOCBcCisgICAg
ICAgICAgIGNyYXRlOi8vY3JhdGVzLmlvL2NhcmdvLXh3aW4vMC4xOC40IFwKKyAgICAgICAgICAg
Y3JhdGU6Ly9jcmF0ZXMuaW8vY2FyZ28temlnYnVpbGQvMC4yMC4wIFwKKyAgICAgICAgICAgY3Jh
dGU6Ly9jcmF0ZXMuaW8vY2FyZ29fbWV0YWRhdGEvMC4xOS4wIFwKKyAgICAgICAgICAgY3JhdGU6
Ly9jcmF0ZXMuaW8vY2JpbmRnZW4vMC4yOC4wIFwKKyAgICAgICAgICAgY3JhdGU6Ly9jcmF0ZXMu
aW8vY2MvMS4yLjE2IFwKKyAgICAgICAgICAgY3JhdGU6Ly9jcmF0ZXMuaW8vY2ZiLzAuMTAuMCBc
CisgICAgICAgICAgIGNyYXRlOi8vY3JhdGVzLmlvL2NmZy1pZi8xLjAuMCBcCisgICAgICAgICAg
IGNyYXRlOi8vY3JhdGVzLmlvL2NoYXJzZXQvMC4xLjUgXAorICAgICAgICAgICBjcmF0ZTovL2Ny
YXRlcy5pby9jaHVtc2t5LzAuOS4zIFwKKyAgICAgICAgICAgY3JhdGU6Ly9jcmF0ZXMuaW8vY2xh
cC80LjUuNyBcCisgICAgICAgICAgIGNyYXRlOi8vY3JhdGVzLmlvL2NsYXBfYnVpbGRlci80LjUu
NyBcCisgICAgICAgICAgIGNyYXRlOi8vY3JhdGVzLmlvL2NsYXBfY29tcGxldGUvNC41LjUgXAor
ICAgICAgICAgICBjcmF0ZTovL2NyYXRlcy5pby9jbGFwX2NvbXBsZXRlX2NvbW1hbmQvMC42LjEg
XAorICAgICAgICAgICBjcmF0ZTovL2NyYXRlcy5pby9jbGFwX2NvbXBsZXRlX251c2hlbGwvNC41
LjIgXAorICAgICAgICAgICBjcmF0ZTovL2NyYXRlcy5pby9jbGFwX2Rlcml2ZS80LjUuNSBcCisg
ICAgICAgICAgIGNyYXRlOi8vY3JhdGVzLmlvL2NsYXBfbGV4LzAuNy4xIFwKKyAgICAgICAgICAg
Y3JhdGU6Ly9jcmF0ZXMuaW8vY2xpLXRhYmxlLzAuNC43IFwKKyAgICAgICAgICAgY3JhdGU6Ly9j
cmF0ZXMuaW8vY29sb3JjaG9pY2UvMS4wLjEgXAorICAgICAgICAgICBjcmF0ZTovL2NyYXRlcy5p
by9jb25maWdwYXJzZXIvMy4xLjAgXAorICAgICAgICAgICBjcmF0ZTovL2NyYXRlcy5pby9jb25z
b2xlLzAuMTUuOCBcCisgICAgICAgICAgIGNyYXRlOi8vY3JhdGVzLmlvL2NvbnRlbnRfaW5zcGVj
dG9yLzAuMi40IFwKKyAgICAgICAgICAgY3JhdGU6Ly9jcmF0ZXMuaW8vY29yZS1mb3VuZGF0aW9u
LzAuOS40IFwKKyAgICAgICAgICAgY3JhdGU6Ly9jcmF0ZXMuaW8vY29yZS1mb3VuZGF0aW9uLXN5
cy8wLjguNiBcCisgICAgICAgICAgIGNyYXRlOi8vY3JhdGVzLmlvL2NwdWZlYXR1cmVzLzAuMi4x
MiBcCisgICAgICAgICAgIGNyYXRlOi8vY3JhdGVzLmlvL2NyYy8zLjIuMSBcCisgICAgICAgICAg
IGNyYXRlOi8vY3JhdGVzLmlvL2NyYy1jYXRhbG9nLzIuNC4wIFwKKyAgICAgICAgICAgY3JhdGU6
Ly9jcmF0ZXMuaW8vY3JjMzJmYXN0LzEuNC4yIFwKKyAgICAgICAgICAgY3JhdGU6Ly9jcmF0ZXMu
aW8vY3Jvc3NiZWFtLWNoYW5uZWwvMC41LjE1IFwKKyAgICAgICAgICAgY3JhdGU6Ly9jcmF0ZXMu
aW8vY3Jvc3NiZWFtLWRlcXVlLzAuOC41IFwKKyAgICAgICAgICAgY3JhdGU6Ly9jcmF0ZXMuaW8v
Y3Jvc3NiZWFtLWVwb2NoLzAuOS4xOCBcCisgICAgICAgICAgIGNyYXRlOi8vY3JhdGVzLmlvL2Ny
b3NzYmVhbS11dGlscy8wLjguMjAgXAorICAgICAgICAgICBjcmF0ZTovL2NyYXRlcy5pby9jcnlw
dG8tY29tbW9uLzAuMS42IFwKKyAgICAgICAgICAgY3JhdGU6Ly9jcmF0ZXMuaW8vZGF0YS1lbmNv
ZGluZy8yLjYuMCBcCisgICAgICAgICAgIGNyYXRlOi8vY3JhdGVzLmlvL2RlcmFuZ2VkLzAuMy4x
MSBcCisgICAgICAgICAgIGNyYXRlOi8vY3JhdGVzLmlvL2Rlcml2ZV9hcmJpdHJhcnkvMS40LjEg
XAorICAgICAgICAgICBjcmF0ZTovL2NyYXRlcy5pby9kaWFsb2d1ZXIvMC4xMS4wIFwKKyAgICAg
ICAgICAgY3JhdGU6Ly9jcmF0ZXMuaW8vZGlmZi8wLjEuMTMgXAorICAgICAgICAgICBjcmF0ZTov
L2NyYXRlcy5pby9kaWdlc3QvMC4xMC43IFwKKyAgICAgICAgICAgY3JhdGU6Ly9jcmF0ZXMuaW8v
ZGlycy81LjAuMSBcCisgICAgICAgICAgIGNyYXRlOi8vY3JhdGVzLmlvL2RpcnMtc3lzLzAuNC4x
IFwKKyAgICAgICAgICAgY3JhdGU6Ly9jcmF0ZXMuaW8vZGlzcGxheWRvYy8wLjIuNSBcCisgICAg
ICAgICAgIGNyYXRlOi8vY3JhdGVzLmlvL2Rpc3NpbWlsYXIvMS4wLjkgXAorICAgICAgICAgICBj
cmF0ZTovL2NyYXRlcy5pby9kdW5jZS8xLjAuNSBcCisgICAgICAgICAgIGNyYXRlOi8vY3JhdGVz
LmlvL2R5bi1jbG9uZS8xLjAuMTcgXAorICAgICAgICAgICBjcmF0ZTovL2NyYXRlcy5pby9laXRo
ZXIvMS4xMy4wIFwKKyAgICAgICAgICAgY3JhdGU6Ly9jcmF0ZXMuaW8vZW5jb2RlX3VuaWNvZGUv
MC4zLjYgXAorICAgICAgICAgICBjcmF0ZTovL2NyYXRlcy5pby9lbmNvZGluZ19ycy8wLjguMzQg
XAorICAgICAgICAgICBjcmF0ZTovL2NyYXRlcy5pby9lcXVpdmFsZW50LzEuMC4xIFwKKyAgICAg
ICAgICAgY3JhdGU6Ly9jcmF0ZXMuaW8vZXJybm8vMC4zLjkgXAorICAgICAgICAgICBjcmF0ZTov
L2NyYXRlcy5pby9leHBlY3QtdGVzdC8xLjUuMCBcCisgICAgICAgICAgIGNyYXRlOi8vY3JhdGVz
LmlvL2Zhc3RyYW5kLzIuMS4wIFwKKyAgICAgICAgICAgY3JhdGU6Ly9jcmF0ZXMuaW8vZmF0LW1h
Y2hvLzAuNC45IFwKKyAgICAgICAgICAgY3JhdGU6Ly9jcmF0ZXMuaW8vZmlsZXRpbWUvMC4yLjIz
IFwKKyAgICAgICAgICAgY3JhdGU6Ly9jcmF0ZXMuaW8vZmxhdGUyLzEuMC4zMyBcCisgICAgICAg
ICAgIGNyYXRlOi8vY3JhdGVzLmlvL2Zudi8xLjAuNyBcCisgICAgICAgICAgIGNyYXRlOi8vY3Jh
dGVzLmlvL2ZvcmVpZ24tdHlwZXMvMC4zLjIgXAorICAgICAgICAgICBjcmF0ZTovL2NyYXRlcy5p
by9mb3JlaWduLXR5cGVzLXNoYXJlZC8wLjEuMSBcCisgICAgICAgICAgIGNyYXRlOi8vY3JhdGVz
LmlvL2Zvcm1fdXJsZW5jb2RlZC8xLjIuMSBcCisgICAgICAgICAgIGNyYXRlOi8vY3JhdGVzLmlv
L2ZzLWVyci8zLjAuMCBcCisgICAgICAgICAgIGNyYXRlOi8vY3JhdGVzLmlvL2ZzNC8wLjEyLjAg
XAorICAgICAgICAgICBjcmF0ZTovL2NyYXRlcy5pby9mdXR1cmVzLzAuMy4zMCBcCisgICAgICAg
ICAgIGNyYXRlOi8vY3JhdGVzLmlvL2Z1dHVyZXMtY2hhbm5lbC8wLjMuMzEgXAorICAgICAgICAg
ICBjcmF0ZTovL2NyYXRlcy5pby9mdXR1cmVzLWNvcmUvMC4zLjMxIFwKKyAgICAgICAgICAgY3Jh
dGU6Ly9jcmF0ZXMuaW8vZnV0dXJlcy1leGVjdXRvci8wLjMuMzAgXAorICAgICAgICAgICBjcmF0
ZTovL2NyYXRlcy5pby9mdXR1cmVzLWlvLzAuMy4zMSBcCisgICAgICAgICAgIGNyYXRlOi8vY3Jh
dGVzLmlvL2Z1dHVyZXMtbWFjcm8vMC4zLjMxIFwKKyAgICAgICAgICAgY3JhdGU6Ly9jcmF0ZXMu
aW8vZnV0dXJlcy1zaW5rLzAuMy4zMSBcCisgICAgICAgICAgIGNyYXRlOi8vY3JhdGVzLmlvL2Z1
dHVyZXMtdGFzay8wLjMuMzEgXAorICAgICAgICAgICBjcmF0ZTovL2NyYXRlcy5pby9mdXR1cmVz
LXRpbWVyLzMuMC4zIFwKKyAgICAgICAgICAgY3JhdGU6Ly9jcmF0ZXMuaW8vZnV0dXJlcy11dGls
LzAuMy4zMSBcCisgICAgICAgICAgIGNyYXRlOi8vY3JhdGVzLmlvL2dlbmVyaWMtYXJyYXkvMC4x
NC43IFwKKyAgICAgICAgICAgY3JhdGU6Ly9jcmF0ZXMuaW8vZ2V0cmFuZG9tLzAuMi4xNSBcCisg
ICAgICAgICAgIGNyYXRlOi8vY3JhdGVzLmlvL2dsb2IvMC4zLjEgXAorICAgICAgICAgICBjcmF0
ZTovL2NyYXRlcy5pby9nbG9ic2V0LzAuNC4xNSBcCisgICAgICAgICAgIGNyYXRlOi8vY3JhdGVz
LmlvL2dvYmxpbi8wLjkuMiBcCisgICAgICAgICAgIGNyYXRlOi8vY3JhdGVzLmlvL2hhc2hicm93
bi8wLjE0LjUgXAorICAgICAgICAgICBjcmF0ZTovL2NyYXRlcy5pby9oYXNoYnJvd24vMC4xNS4y
IFwKKyAgICAgICAgICAgY3JhdGU6Ly9jcmF0ZXMuaW8vaGVjay8wLjQuMSBcCisgICAgICAgICAg
IGNyYXRlOi8vY3JhdGVzLmlvL2hlY2svMC41LjAgXAorICAgICAgICAgICBjcmF0ZTovL2NyYXRl
cy5pby9ob21lLzAuNS45IFwKKyAgICAgICAgICAgY3JhdGU6Ly9jcmF0ZXMuaW8vaHVtYW50aW1l
LzIuMS4wIFwKKyAgICAgICAgICAgY3JhdGU6Ly9jcmF0ZXMuaW8vaHVtYW50aW1lLXNlcmRlLzEu
MS4xIFwKKyAgICAgICAgICAgY3JhdGU6Ly9jcmF0ZXMuaW8vaWN1X2NvbGxlY3Rpb25zLzEuNS4w
IFwKKyAgICAgICAgICAgY3JhdGU6Ly9jcmF0ZXMuaW8vaWN1X2xvY2lkLzEuNS4wIFwKKyAgICAg
ICAgICAgY3JhdGU6Ly9jcmF0ZXMuaW8vaWN1X2xvY2lkX3RyYW5zZm9ybS8xLjUuMCBcCisgICAg
ICAgICAgIGNyYXRlOi8vY3JhdGVzLmlvL2ljdV9sb2NpZF90cmFuc2Zvcm1fZGF0YS8xLjUuMCBc
CisgICAgICAgICAgIGNyYXRlOi8vY3JhdGVzLmlvL2ljdV9ub3JtYWxpemVyLzEuNS4wIFwKKyAg
ICAgICAgICAgY3JhdGU6Ly9jcmF0ZXMuaW8vaWN1X25vcm1hbGl6ZXJfZGF0YS8xLjUuMCBcCisg
ICAgICAgICAgIGNyYXRlOi8vY3JhdGVzLmlvL2ljdV9wcm9wZXJ0aWVzLzEuNS4xIFwKKyAgICAg
ICAgICAgY3JhdGU6Ly9jcmF0ZXMuaW8vaWN1X3Byb3BlcnRpZXNfZGF0YS8xLjUuMCBcCisgICAg
ICAgICAgIGNyYXRlOi8vY3JhdGVzLmlvL2ljdV9wcm92aWRlci8xLjUuMCBcCisgICAgICAgICAg
IGNyYXRlOi8vY3JhdGVzLmlvL2ljdV9wcm92aWRlcl9tYWNyb3MvMS41LjAgXAorICAgICAgICAg
ICBjcmF0ZTovL2NyYXRlcy5pby9pZG5hLzEuMC4zIFwKKyAgICAgICAgICAgY3JhdGU6Ly9jcmF0
ZXMuaW8vaWRuYV9hZGFwdGVyLzEuMi4wIFwKKyAgICAgICAgICAgY3JhdGU6Ly9jcmF0ZXMuaW8v
aWdub3JlLzAuNC4yMyBcCisgICAgICAgICAgIGNyYXRlOi8vY3JhdGVzLmlvL2luZGV4bWFwLzIu
Ni4wIFwKKyAgICAgICAgICAgY3JhdGU6Ly9jcmF0ZXMuaW8vaW5kaWNhdGlmLzAuMTcuOSBcCisg
ICAgICAgICAgIGNyYXRlOi8vY3JhdGVzLmlvL2luZG9jLzIuMC41IFwKKyAgICAgICAgICAgY3Jh
dGU6Ly9jcmF0ZXMuaW8vaXNfdGVybWluYWxfcG9seWZpbGwvMS43MC4wIFwKKyAgICAgICAgICAg
Y3JhdGU6Ly9jcmF0ZXMuaW8vaXRlcnRvb2xzLzAuMTIuMSBcCisgICAgICAgICAgIGNyYXRlOi8v
Y3JhdGVzLmlvL2l0ZXJ0b29scy8wLjEzLjAgXAorICAgICAgICAgICBjcmF0ZTovL2NyYXRlcy5p
by9pdG9hLzEuMC4xMSBcCisgICAgICAgICAgIGNyYXRlOi8vY3JhdGVzLmlvL2pzLXN5cy8wLjMu
NzMgXAorICAgICAgICAgICBjcmF0ZTovL2NyYXRlcy5pby9rZXlyaW5nLzIuMy4zIFwKKyAgICAg
ICAgICAgY3JhdGU6Ly9jcmF0ZXMuaW8vbGF6eV9zdGF0aWMvMS40LjAgXAorICAgICAgICAgICBj
cmF0ZTovL2NyYXRlcy5pby9sZGR0cmVlLzAuMy43IFwKKyAgICAgICAgICAgY3JhdGU6Ly9jcmF0
ZXMuaW8vbGliYy8wLjIuMTY3IFwKKyAgICAgICAgICAgY3JhdGU6Ly9jcmF0ZXMuaW8vbGlibWlt
YWxsb2Mtc3lzLzAuMS4zOSBcCisgICAgICAgICAgIGNyYXRlOi8vY3JhdGVzLmlvL2xpYnJlZG94
LzAuMS4zIFwKKyAgICAgICAgICAgY3JhdGU6Ly9jcmF0ZXMuaW8vbGludXgta2V5dXRpbHMvMC4y
LjQgXAorICAgICAgICAgICBjcmF0ZTovL2NyYXRlcy5pby9saW51eC1yYXctc3lzLzAuNC4xNCBc
CisgICAgICAgICAgIGNyYXRlOi8vY3JhdGVzLmlvL2xpdGVtYXAvMC43LjMgXAorICAgICAgICAg
ICBjcmF0ZTovL2NyYXRlcy5pby9sb2NrX2FwaS8wLjQuMTIgXAorICAgICAgICAgICBjcmF0ZTov
L2NyYXRlcy5pby9sb2NrZnJlZS1vYmplY3QtcG9vbC8wLjEuNiBcCisgICAgICAgICAgIGNyYXRl
Oi8vY3JhdGVzLmlvL2xvZy8wLjQuMjIgXAorICAgICAgICAgICBjcmF0ZTovL2NyYXRlcy5pby9s
em1hLXN5cy8wLjEuMjAgXAorICAgICAgICAgICBjcmF0ZTovL2NyYXRlcy5pby9senhkLzAuMi41
IFwKKyAgICAgICAgICAgY3JhdGU6Ly9jcmF0ZXMuaW8vbWFpbHBhcnNlLzAuMTUuMCBcCisgICAg
ICAgICAgIGNyYXRlOi8vY3JhdGVzLmlvL21hdGNoZXJzLzAuMS4wIFwKKyAgICAgICAgICAgY3Jh
dGU6Ly9jcmF0ZXMuaW8vbWVtY2hyLzIuNy40IFwKKyAgICAgICAgICAgY3JhdGU6Ly9jcmF0ZXMu
aW8vbWltYWxsb2MvMC4xLjQzIFwKKyAgICAgICAgICAgY3JhdGU6Ly9jcmF0ZXMuaW8vbWltZS8w
LjMuMTcgXAorICAgICAgICAgICBjcmF0ZTovL2NyYXRlcy5pby9taW1lX2d1ZXNzLzIuMC40IFwK
KyAgICAgICAgICAgY3JhdGU6Ly9jcmF0ZXMuaW8vbWluaWppbmphLzIuNS4wIFwKKyAgICAgICAg
ICAgY3JhdGU6Ly9jcmF0ZXMuaW8vbWluaW1hbC1sZXhpY2FsLzAuMi4xIFwKKyAgICAgICAgICAg
Y3JhdGU6Ly9jcmF0ZXMuaW8vbWluaXpfb3hpZGUvMC44LjAgXAorICAgICAgICAgICBjcmF0ZTov
L2NyYXRlcy5pby9tc2kvMC44LjAgXAorICAgICAgICAgICBjcmF0ZTovL2NyYXRlcy5pby9tdWx0
aXBhcnQvMC4xOC4wIFwKKyAgICAgICAgICAgY3JhdGU6Ly9jcmF0ZXMuaW8vbmF0aXZlLXRscy8w
LjIuMTIgXAorICAgICAgICAgICBjcmF0ZTovL2NyYXRlcy5pby9ub20vNy4xLjMgXAorICAgICAg
ICAgICBjcmF0ZTovL2NyYXRlcy5pby9ub3JtYWxpemUtbGluZS1lbmRpbmdzLzAuMy4wIFwKKyAg
ICAgICAgICAgY3JhdGU6Ly9jcmF0ZXMuaW8vbm9ybXBhdGgvMS4yLjAgXAorICAgICAgICAgICBj
cmF0ZTovL2NyYXRlcy5pby9udS1hbnNpLXRlcm0vMC40Ni4wIFwKKyAgICAgICAgICAgY3JhdGU6
Ly9jcmF0ZXMuaW8vbnVtLWNvbnYvMC4xLjAgXAorICAgICAgICAgICBjcmF0ZTovL2NyYXRlcy5p
by9udW1iZXJfcHJlZml4LzAuNC4wIFwKKyAgICAgICAgICAgY3JhdGU6Ly9jcmF0ZXMuaW8vb25j
ZV9jZWxsLzEuMjAuMiBcCisgICAgICAgICAgIGNyYXRlOi8vY3JhdGVzLmlvL29wZW5zc2wvMC4x
MC43MiBcCisgICAgICAgICAgIGNyYXRlOi8vY3JhdGVzLmlvL29wZW5zc2wtbWFjcm9zLzAuMS4x
IFwKKyAgICAgICAgICAgY3JhdGU6Ly9jcmF0ZXMuaW8vb3BlbnNzbC1wcm9iZS8wLjEuNSBcCisg
ICAgICAgICAgIGNyYXRlOi8vY3JhdGVzLmlvL29wZW5zc2wtc3lzLzAuOS4xMDcgXAorICAgICAg
ICAgICBjcmF0ZTovL2NyYXRlcy5pby9vcHRpb24tZXh0LzAuMi4wIFwKKyAgICAgICAgICAgY3Jh
dGU6Ly9jcmF0ZXMuaW8vb3NfcGlwZS8xLjIuMCBcCisgICAgICAgICAgIGNyYXRlOi8vY3JhdGVz
LmlvL292ZXJsb2FkLzAuMS4xIFwKKyAgICAgICAgICAgY3JhdGU6Ly9jcmF0ZXMuaW8vcGFya2lu
Z19sb3QvMC4xMi4zIFwKKyAgICAgICAgICAgY3JhdGU6Ly9jcmF0ZXMuaW8vcGFya2luZ19sb3Rf
Y29yZS8wLjkuMTAgXAorICAgICAgICAgICBjcmF0ZTovL2NyYXRlcy5pby9wYXN0ZS8xLjAuMTUg
XAorICAgICAgICAgICBjcmF0ZTovL2NyYXRlcy5pby9wYXRoLXNsYXNoLzAuMi4xIFwKKyAgICAg
ICAgICAgY3JhdGU6Ly9jcmF0ZXMuaW8vcGVwNDQwX3JzLzAuNy4zIFwKKyAgICAgICAgICAgY3Jh
dGU6Ly9jcmF0ZXMuaW8vcGVwNTA4X3JzLzAuOS4yIFwKKyAgICAgICAgICAgY3JhdGU6Ly9jcmF0
ZXMuaW8vcGVyY2VudC1lbmNvZGluZy8yLjMuMSBcCisgICAgICAgICAgIGNyYXRlOi8vY3JhdGVz
LmlvL3Bpbi1wcm9qZWN0LWxpdGUvMC4yLjE1IFwKKyAgICAgICAgICAgY3JhdGU6Ly9jcmF0ZXMu
aW8vcGluLXV0aWxzLzAuMS4wIFwKKyAgICAgICAgICAgY3JhdGU6Ly9jcmF0ZXMuaW8vcGtnLWNv
bmZpZy8wLjMuMzAgXAorICAgICAgICAgICBjcmF0ZTovL2NyYXRlcy5pby9wbGFpbi8wLjIuMyBc
CisgICAgICAgICAgIGNyYXRlOi8vY3JhdGVzLmlvL3BsYXRmb3JtLWluZm8vMi4wLjMgXAorICAg
ICAgICAgICBjcmF0ZTovL2NyYXRlcy5pby9wb3J0YWJsZS1hdG9taWMvMS42LjAgXAorICAgICAg
ICAgICBjcmF0ZTovL2NyYXRlcy5pby9wb3dlcmZtdC8wLjIuMCBcCisgICAgICAgICAgIGNyYXRl
Oi8vY3JhdGVzLmlvL3Bwdi1saXRlODYvMC4yLjE3IFwKKyAgICAgICAgICAgY3JhdGU6Ly9jcmF0
ZXMuaW8vcHJldHR5X2Fzc2VydGlvbnMvMS40LjEgXAorICAgICAgICAgICBjcmF0ZTovL2NyYXRl
cy5pby9wcm9jLW1hY3JvLWNyYXRlLzMuMS4wIFwKKyAgICAgICAgICAgY3JhdGU6Ly9jcmF0ZXMu
aW8vcHJvYy1tYWNybzIvMS4wLjkyIFwKKyAgICAgICAgICAgY3JhdGU6Ly9jcmF0ZXMuaW8vcHNt
LzAuMS4yMSBcCisgICAgICAgICAgIGNyYXRlOi8vY3JhdGVzLmlvL3B5cHJvamVjdC10b21sLzAu
MTMuNCBcCisgICAgICAgICAgIGNyYXRlOi8vY3JhdGVzLmlvL3B5dGhvbi1wa2dpbmZvLzAuNi41
IFwKKyAgICAgICAgICAgY3JhdGU6Ly9jcmF0ZXMuaW8vcXVvdGUvMS4wLjM3IFwKKyAgICAgICAg
ICAgY3JhdGU6Ly9jcmF0ZXMuaW8vcXVvdGVkX3ByaW50YWJsZS8wLjUuMCBcCisgICAgICAgICAg
IGNyYXRlOi8vY3JhdGVzLmlvL3JhbmQvMC44LjUgXAorICAgICAgICAgICBjcmF0ZTovL2NyYXRl
cy5pby9yYW5kX2NoYWNoYS8wLjMuMSBcCisgICAgICAgICAgIGNyYXRlOi8vY3JhdGVzLmlvL3Jh
bmRfY29yZS8wLjYuNCBcCisgICAgICAgICAgIGNyYXRlOi8vY3JhdGVzLmlvL3JheW9uLzEuMTAu
MCBcCisgICAgICAgICAgIGNyYXRlOi8vY3JhdGVzLmlvL3JheW9uLWNvcmUvMS4xMi4xIFwKKyAg
ICAgICAgICAgY3JhdGU6Ly9jcmF0ZXMuaW8vcmVkb3hfc3lzY2FsbC8wLjQuMSBcCisgICAgICAg
ICAgIGNyYXRlOi8vY3JhdGVzLmlvL3JlZG94X3N5c2NhbGwvMC41LjEgXAorICAgICAgICAgICBj
cmF0ZTovL2NyYXRlcy5pby9yZWRveF91c2Vycy8wLjQuNSBcCisgICAgICAgICAgIGNyYXRlOi8v
Y3JhdGVzLmlvL3JlZ2V4LzEuMTEuMSBcCisgICAgICAgICAgIGNyYXRlOi8vY3JhdGVzLmlvL3Jl
Z2V4LWF1dG9tYXRhLzAuMS4xMCBcCisgICAgICAgICAgIGNyYXRlOi8vY3JhdGVzLmlvL3JlZ2V4
LWF1dG9tYXRhLzAuNC45IFwKKyAgICAgICAgICAgY3JhdGU6Ly9jcmF0ZXMuaW8vcmVnZXgtc3lu
dGF4LzAuNi4yOSBcCisgICAgICAgICAgIGNyYXRlOi8vY3JhdGVzLmlvL3JlZ2V4LXN5bnRheC8w
LjguNSBcCisgICAgICAgICAgIGNyYXRlOi8vY3JhdGVzLmlvL3JlbGF0aXZlLXBhdGgvMS45LjMg
XAorICAgICAgICAgICBjcmF0ZTovL2NyYXRlcy5pby9yZmMyMDQ3LWRlY29kZXIvMS4wLjYgXAor
ICAgICAgICAgICBjcmF0ZTovL2NyYXRlcy5pby9yaW5nLzAuMTcuMTMgXAorICAgICAgICAgICBj
cmF0ZTovL2NyYXRlcy5pby9yc3Rlc3QvMC4yMi4wIFwKKyAgICAgICAgICAgY3JhdGU6Ly9jcmF0
ZXMuaW8vcnN0ZXN0X21hY3Jvcy8wLjIyLjAgXAorICAgICAgICAgICBjcmF0ZTovL2NyYXRlcy5p
by9ydXN0Yy1oYXNoLzIuMC4wIFwKKyAgICAgICAgICAgY3JhdGU6Ly9jcmF0ZXMuaW8vcnVzdGNf
dmVyc2lvbi8wLjQuMSBcCisgICAgICAgICAgIGNyYXRlOi8vY3JhdGVzLmlvL3J1c3RmbGFncy8w
LjEuNiBcCisgICAgICAgICAgIGNyYXRlOi8vY3JhdGVzLmlvL3J1c3RpeC8wLjM4LjQxIFwKKyAg
ICAgICAgICAgY3JhdGU6Ly9jcmF0ZXMuaW8vcnVzdGxzLzAuMjMuMTkgXAorICAgICAgICAgICBj
cmF0ZTovL2NyYXRlcy5pby9ydXN0bHMtcGVtZmlsZS8yLjEuMyBcCisgICAgICAgICAgIGNyYXRl
Oi8vY3JhdGVzLmlvL3J1c3Rscy1wa2ktdHlwZXMvMS4xMC4wIFwKKyAgICAgICAgICAgY3JhdGU6
Ly9jcmF0ZXMuaW8vcnVzdGxzLXdlYnBraS8wLjEwMi44IFwKKyAgICAgICAgICAgY3JhdGU6Ly9j
cmF0ZXMuaW8vcnVzdHZlcnNpb24vMS4wLjE4IFwKKyAgICAgICAgICAgY3JhdGU6Ly9jcmF0ZXMu
aW8vcnl1LzEuMC4xOCBcCisgICAgICAgICAgIGNyYXRlOi8vY3JhdGVzLmlvL3NhbWUtZmlsZS8x
LjAuNiBcCisgICAgICAgICAgIGNyYXRlOi8vY3JhdGVzLmlvL3NjaGFubmVsLzAuMS4yMyBcCisg
ICAgICAgICAgIGNyYXRlOi8vY3JhdGVzLmlvL3NjaGVtYXJzLzAuOC4yMSBcCisgICAgICAgICAg
IGNyYXRlOi8vY3JhdGVzLmlvL3NjaGVtYXJzX2Rlcml2ZS8wLjguMjEgXAorICAgICAgICAgICBj
cmF0ZTovL2NyYXRlcy5pby9zY29wZWd1YXJkLzEuMi4wIFwKKyAgICAgICAgICAgY3JhdGU6Ly9j
cmF0ZXMuaW8vc2Nyb2xsLzAuMTIuMCBcCisgICAgICAgICAgIGNyYXRlOi8vY3JhdGVzLmlvL3Nj
cm9sbF9kZXJpdmUvMC4xMi4wIFwKKyAgICAgICAgICAgY3JhdGU6Ly9jcmF0ZXMuaW8vc2VjdXJp
dHktZnJhbWV3b3JrLzIuMTEuMCBcCisgICAgICAgICAgIGNyYXRlOi8vY3JhdGVzLmlvL3NlY3Vy
aXR5LWZyYW1ld29yay1zeXMvMi4xMS4wIFwKKyAgICAgICAgICAgY3JhdGU6Ly9jcmF0ZXMuaW8v
c2VtdmVyLzEuMC4yMyBcCisgICAgICAgICAgIGNyYXRlOi8vY3JhdGVzLmlvL3NlcmRlLzEuMC4y
MTcgXAorICAgICAgICAgICBjcmF0ZTovL2NyYXRlcy5pby9zZXJkZV9kZXJpdmUvMS4wLjIxNyBc
CisgICAgICAgICAgIGNyYXRlOi8vY3JhdGVzLmlvL3NlcmRlX2Rlcml2ZV9pbnRlcm5hbHMvMC4y
OS4xIFwKKyAgICAgICAgICAgY3JhdGU6Ly9jcmF0ZXMuaW8vc2VyZGVfanNvbi8xLjAuMTM1IFwK
KyAgICAgICAgICAgY3JhdGU6Ly9jcmF0ZXMuaW8vc2VyZGVfc3Bhbm5lZC8wLjYuOCBcCisgICAg
ICAgICAgIGNyYXRlOi8vY3JhdGVzLmlvL3NoYTIvMC4xMC44IFwKKyAgICAgICAgICAgY3JhdGU6
Ly9jcmF0ZXMuaW8vc2hhcmRlZC1zbGFiLzAuMS43IFwKKyAgICAgICAgICAgY3JhdGU6Ly9jcmF0
ZXMuaW8vc2hlbGwtd29yZHMvMS4xLjAgXAorICAgICAgICAgICBjcmF0ZTovL2NyYXRlcy5pby9z
aGxleC8xLjMuMCBcCisgICAgICAgICAgIGNyYXRlOi8vY3JhdGVzLmlvL3NpbWQtYWRsZXIzMi8w
LjMuNyBcCisgICAgICAgICAgIGNyYXRlOi8vY3JhdGVzLmlvL3NpbWlsYXIvMi41LjAgXAorICAg
ICAgICAgICBjcmF0ZTovL2NyYXRlcy5pby9zbGFiLzAuNC45IFwKKyAgICAgICAgICAgY3JhdGU6
Ly9jcmF0ZXMuaW8vc21hbGx2ZWMvMS4xMy4yIFwKKyAgICAgICAgICAgY3JhdGU6Ly9jcmF0ZXMu
aW8vc21hd2svMC4zLjIgXAorICAgICAgICAgICBjcmF0ZTovL2NyYXRlcy5pby9zbmFwYm94LzAu
Ni4xNiBcCisgICAgICAgICAgIGNyYXRlOi8vY3JhdGVzLmlvL3NuYXBib3gtbWFjcm9zLzAuMy4x
MCBcCisgICAgICAgICAgIGNyYXRlOi8vY3JhdGVzLmlvL3NvY2tzLzAuMy40IFwKKyAgICAgICAg
ICAgY3JhdGU6Ly9jcmF0ZXMuaW8vc3RhYmxlX2RlcmVmX3RyYWl0LzEuMi4wIFwKKyAgICAgICAg
ICAgY3JhdGU6Ly9jcmF0ZXMuaW8vc3RhY2tlci8wLjEuMTUgXAorICAgICAgICAgICBjcmF0ZTov
L2NyYXRlcy5pby9zdGF0aWNfYXNzZXJ0aW9ucy8xLjEuMCBcCisgICAgICAgICAgIGNyYXRlOi8v
Y3JhdGVzLmlvL3N0cnNpbS8wLjExLjEgXAorICAgICAgICAgICBjcmF0ZTovL2NyYXRlcy5pby9z
dWJ0bGUvMi41LjAgXAorICAgICAgICAgICBjcmF0ZTovL2NyYXRlcy5pby9zeW4vMi4wLjkwIFwK
KyAgICAgICAgICAgY3JhdGU6Ly9jcmF0ZXMuaW8vc3luc3RydWN0dXJlLzAuMTMuMSBcCisgICAg
ICAgICAgIGNyYXRlOi8vY3JhdGVzLmlvL3Rhci8wLjQuNDMgXAorICAgICAgICAgICBjcmF0ZTov
L2NyYXRlcy5pby90YXJnZXQtbGV4aWNvbi8wLjEzLjEgXAorICAgICAgICAgICBjcmF0ZTovL2Ny
YXRlcy5pby90ZW1wZmlsZS8zLjExLjAgXAorICAgICAgICAgICBjcmF0ZTovL2NyYXRlcy5pby90
ZXJtY29sb3IvMS40LjEgXAorICAgICAgICAgICBjcmF0ZTovL2NyYXRlcy5pby90ZXJtaW5hbF9z
aXplLzAuMy4wIFwKKyAgICAgICAgICAgY3JhdGU6Ly9jcmF0ZXMuaW8vdGV4dHdyYXAvMC4xNi4x
IFwKKyAgICAgICAgICAgY3JhdGU6Ly9jcmF0ZXMuaW8vdGhpc2Vycm9yLzEuMC42OSBcCisgICAg
ICAgICAgIGNyYXRlOi8vY3JhdGVzLmlvL3RoaXNlcnJvci8yLjAuMyBcCisgICAgICAgICAgIGNy
YXRlOi8vY3JhdGVzLmlvL3RoaXNlcnJvci1pbXBsLzEuMC42OSBcCisgICAgICAgICAgIGNyYXRl
Oi8vY3JhdGVzLmlvL3RoaXNlcnJvci1pbXBsLzIuMC4zIFwKKyAgICAgICAgICAgY3JhdGU6Ly9j
cmF0ZXMuaW8vdGhyZWFkX2xvY2FsLzEuMS44IFwKKyAgICAgICAgICAgY3JhdGU6Ly9jcmF0ZXMu
aW8vdGltZS8wLjMuMzYgXAorICAgICAgICAgICBjcmF0ZTovL2NyYXRlcy5pby90aW1lLWNvcmUv
MC4xLjIgXAorICAgICAgICAgICBjcmF0ZTovL2NyYXRlcy5pby90aW1lLW1hY3Jvcy8wLjIuMTgg
XAorICAgICAgICAgICBjcmF0ZTovL2NyYXRlcy5pby90aW55c3RyLzAuNy42IFwKKyAgICAgICAg
ICAgY3JhdGU6Ly9jcmF0ZXMuaW8vdG9tbC8wLjguMTkgXAorICAgICAgICAgICBjcmF0ZTovL2Ny
YXRlcy5pby90b21sX2RhdGV0aW1lLzAuNi44IFwKKyAgICAgICAgICAgY3JhdGU6Ly9jcmF0ZXMu
aW8vdG9tbF9lZGl0LzAuMjEuMSBcCisgICAgICAgICAgIGNyYXRlOi8vY3JhdGVzLmlvL3RvbWxf
ZWRpdC8wLjIyLjIyIFwKKyAgICAgICAgICAgY3JhdGU6Ly9jcmF0ZXMuaW8vdHJhY2luZy8wLjEu
NDEgXAorICAgICAgICAgICBjcmF0ZTovL2NyYXRlcy5pby90cmFjaW5nLWF0dHJpYnV0ZXMvMC4x
LjI4IFwKKyAgICAgICAgICAgY3JhdGU6Ly9jcmF0ZXMuaW8vdHJhY2luZy1jb3JlLzAuMS4zMyBc
CisgICAgICAgICAgIGNyYXRlOi8vY3JhdGVzLmlvL3RyYWNpbmctbG9nLzAuMi4wIFwKKyAgICAg
ICAgICAgY3JhdGU6Ly9jcmF0ZXMuaW8vdHJhY2luZy1zZXJkZS8wLjIuMCBcCisgICAgICAgICAg
IGNyYXRlOi8vY3JhdGVzLmlvL3RyYWNpbmctc3Vic2NyaWJlci8wLjMuMTkgXAorICAgICAgICAg
ICBjcmF0ZTovL2NyYXRlcy5pby90cnljbWQvMC4xNS42IFwKKyAgICAgICAgICAgY3JhdGU6Ly9j
cmF0ZXMuaW8vdHdveC1oYXNoLzEuNi4zIFwKKyAgICAgICAgICAgY3JhdGU6Ly9jcmF0ZXMuaW8v
dHlwZW51bS8xLjE3LjAgXAorICAgICAgICAgICBjcmF0ZTovL2NyYXRlcy5pby91bmljYXNlLzIu
Ny4wIFwKKyAgICAgICAgICAgY3JhdGU6Ly9jcmF0ZXMuaW8vdW5pY29kZS1pZGVudC8xLjAuMTIg
XAorICAgICAgICAgICBjcmF0ZTovL2NyYXRlcy5pby91bmljb2RlLWxpbmVicmVhay8wLjEuNSBc
CisgICAgICAgICAgIGNyYXRlOi8vY3JhdGVzLmlvL3VuaWNvZGUtd2lkdGgvMC4xLjEzIFwKKyAg
ICAgICAgICAgY3JhdGU6Ly9jcmF0ZXMuaW8vdW5pY29kZS13aWR0aC8wLjIuMCBcCisgICAgICAg
ICAgIGNyYXRlOi8vY3JhdGVzLmlvL3VuaWNvZGUteGlkLzAuMi42IFwKKyAgICAgICAgICAgY3Jh
dGU6Ly9jcmF0ZXMuaW8vdW5zY2FubnkvMC4xLjAgXAorICAgICAgICAgICBjcmF0ZTovL2NyYXRl
cy5pby91bnRydXN0ZWQvMC45LjAgXAorICAgICAgICAgICBjcmF0ZTovL2NyYXRlcy5pby91cmVx
LzIuMTEuMCBcCisgICAgICAgICAgIGNyYXRlOi8vY3JhdGVzLmlvL3VybC8yLjUuNCBcCisgICAg
ICAgICAgIGNyYXRlOi8vY3JhdGVzLmlvL3VybGVuY29kaW5nLzIuMS4zIFwKKyAgICAgICAgICAg
Y3JhdGU6Ly9jcmF0ZXMuaW8vdXRmMTZfaXRlci8xLjAuNSBcCisgICAgICAgICAgIGNyYXRlOi8v
Y3JhdGVzLmlvL3V0ZjhfaXRlci8xLjAuNCBcCisgICAgICAgICAgIGNyYXRlOi8vY3JhdGVzLmlv
L3V0ZjhwYXJzZS8wLjIuMiBcCisgICAgICAgICAgIGNyYXRlOi8vY3JhdGVzLmlvL3V1aWQvMS44
LjAgXAorICAgICAgICAgICBjcmF0ZTovL2NyYXRlcy5pby92YWx1YWJsZS8wLjEuMCBcCisgICAg
ICAgICAgIGNyYXRlOi8vY3JhdGVzLmlvL3ZjcGtnLzAuMi4xNSBcCisgICAgICAgICAgIGNyYXRl
Oi8vY3JhdGVzLmlvL3ZlcnNpb24tcmFuZ2VzLzAuMS4xIFwKKyAgICAgICAgICAgY3JhdGU6Ly9j
cmF0ZXMuaW8vdmVyc2lvbl9jaGVjay8wLjkuNCBcCisgICAgICAgICAgIGNyYXRlOi8vY3JhdGVz
LmlvL3ZlcnNpb25zLzYuMi4wIFwKKyAgICAgICAgICAgY3JhdGU6Ly9jcmF0ZXMuaW8vd2FpdC10
aW1lb3V0LzAuMi4wIFwKKyAgICAgICAgICAgY3JhdGU6Ly9jcmF0ZXMuaW8vd2Fsa2Rpci8yLjUu
MCBcCisgICAgICAgICAgIGNyYXRlOi8vY3JhdGVzLmlvL3dhc2kvMC4xMS4wK3dhc2ktc25hcHNo
b3QtcHJldmlldzEgXAorICAgICAgICAgICBjcmF0ZTovL2NyYXRlcy5pby93YXNtLWJpbmRnZW4v
MC4yLjk2IFwKKyAgICAgICAgICAgY3JhdGU6Ly9jcmF0ZXMuaW8vd2FzbS1iaW5kZ2VuLWJhY2tl
bmQvMC4yLjk2IFwKKyAgICAgICAgICAgY3JhdGU6Ly9jcmF0ZXMuaW8vd2FzbS1iaW5kZ2VuLW1h
Y3JvLzAuMi45NiBcCisgICAgICAgICAgIGNyYXRlOi8vY3JhdGVzLmlvL3dhc20tYmluZGdlbi1t
YWNyby1zdXBwb3J0LzAuMi45NiBcCisgICAgICAgICAgIGNyYXRlOi8vY3JhdGVzLmlvL3dhc20t
YmluZGdlbi1zaGFyZWQvMC4yLjk2IFwKKyAgICAgICAgICAgY3JhdGU6Ly9jcmF0ZXMuaW8vd2Vi
LXRpbWUvMS4xLjAgXAorICAgICAgICAgICBjcmF0ZTovL2NyYXRlcy5pby93ZWJwa2ktcm9vdHMv
MC4yNi4yIFwKKyAgICAgICAgICAgY3JhdGU6Ly9jcmF0ZXMuaW8vd2hpY2gvNy4wLjAgXAorICAg
ICAgICAgICBjcmF0ZTovL2NyYXRlcy5pby93aWxkLzIuMi4xIFwKKyAgICAgICAgICAgY3JhdGU6
Ly9jcmF0ZXMuaW8vd2luYXBpLzAuMy45IFwKKyAgICAgICAgICAgY3JhdGU6Ly9jcmF0ZXMuaW8v
d2luYXBpLWk2ODYtcGMtd2luZG93cy1nbnUvMC40LjAgXAorICAgICAgICAgICBjcmF0ZTovL2Ny
YXRlcy5pby93aW5hcGktdXRpbC8wLjEuOCBcCisgICAgICAgICAgIGNyYXRlOi8vY3JhdGVzLmlv
L3dpbmFwaS14ODZfNjQtcGMtd2luZG93cy1nbnUvMC40LjAgXAorICAgICAgICAgICBjcmF0ZTov
L2NyYXRlcy5pby93aW5kb3dzLXN5cy8wLjQ4LjAgXAorICAgICAgICAgICBjcmF0ZTovL2NyYXRl
cy5pby93aW5kb3dzLXN5cy8wLjUyLjAgXAorICAgICAgICAgICBjcmF0ZTovL2NyYXRlcy5pby93
aW5kb3dzLXRhcmdldHMvMC40OC41IFwKKyAgICAgICAgICAgY3JhdGU6Ly9jcmF0ZXMuaW8vd2lu
ZG93cy10YXJnZXRzLzAuNTIuNSBcCisgICAgICAgICAgIGNyYXRlOi8vY3JhdGVzLmlvL3dpbmRv
d3NfYWFyY2g2NF9nbnVsbHZtLzAuNDguNSBcCisgICAgICAgICAgIGNyYXRlOi8vY3JhdGVzLmlv
L3dpbmRvd3NfYWFyY2g2NF9nbnVsbHZtLzAuNTIuNSBcCisgICAgICAgICAgIGNyYXRlOi8vY3Jh
dGVzLmlvL3dpbmRvd3NfYWFyY2g2NF9tc3ZjLzAuNDguNSBcCisgICAgICAgICAgIGNyYXRlOi8v
Y3JhdGVzLmlvL3dpbmRvd3NfYWFyY2g2NF9tc3ZjLzAuNTIuNSBcCisgICAgICAgICAgIGNyYXRl
Oi8vY3JhdGVzLmlvL3dpbmRvd3NfaTY4Nl9nbnUvMC40OC41IFwKKyAgICAgICAgICAgY3JhdGU6
Ly9jcmF0ZXMuaW8vd2luZG93c19pNjg2X2dudS8wLjUyLjUgXAorICAgICAgICAgICBjcmF0ZTov
L2NyYXRlcy5pby93aW5kb3dzX2k2ODZfZ251bGx2bS8wLjUyLjUgXAorICAgICAgICAgICBjcmF0
ZTovL2NyYXRlcy5pby93aW5kb3dzX2k2ODZfbXN2Yy8wLjQ4LjUgXAorICAgICAgICAgICBjcmF0
ZTovL2NyYXRlcy5pby93aW5kb3dzX2k2ODZfbXN2Yy8wLjUyLjUgXAorICAgICAgICAgICBjcmF0
ZTovL2NyYXRlcy5pby93aW5kb3dzX3g4Nl82NF9nbnUvMC40OC41IFwKKyAgICAgICAgICAgY3Jh
dGU6Ly9jcmF0ZXMuaW8vd2luZG93c194ODZfNjRfZ251LzAuNTIuNSBcCisgICAgICAgICAgIGNy
YXRlOi8vY3JhdGVzLmlvL3dpbmRvd3NfeDg2XzY0X2dudWxsdm0vMC40OC41IFwKKyAgICAgICAg
ICAgY3JhdGU6Ly9jcmF0ZXMuaW8vd2luZG93c194ODZfNjRfZ251bGx2bS8wLjUyLjUgXAorICAg
ICAgICAgICBjcmF0ZTovL2NyYXRlcy5pby93aW5kb3dzX3g4Nl82NF9tc3ZjLzAuNDguNSBcCisg
ICAgICAgICAgIGNyYXRlOi8vY3JhdGVzLmlvL3dpbmRvd3NfeDg2XzY0X21zdmMvMC41Mi41IFwK
KyAgICAgICAgICAgY3JhdGU6Ly9jcmF0ZXMuaW8vd2lubm93LzAuNS40MCBcCisgICAgICAgICAg
IGNyYXRlOi8vY3JhdGVzLmlvL3dpbm5vdy8wLjYuMjAgXAorICAgICAgICAgICBjcmF0ZTovL2Ny
YXRlcy5pby93aW5zYWZlLzAuMC4xOSBcCisgICAgICAgICAgIGNyYXRlOi8vY3JhdGVzLmlvL3dy
aXRlMTYvMS4wLjAgXAorICAgICAgICAgICBjcmF0ZTovL2NyYXRlcy5pby93cml0ZWFibGUvMC41
LjUgXAorICAgICAgICAgICBjcmF0ZTovL2NyYXRlcy5pby94YXR0ci8xLjMuMSBcCisgICAgICAg
ICAgIGNyYXRlOi8vY3JhdGVzLmlvL3h3aW4vMC42LjUgXAorICAgICAgICAgICBjcmF0ZTovL2Ny
YXRlcy5pby94ejIvMC4xLjcgXAorICAgICAgICAgICBjcmF0ZTovL2NyYXRlcy5pby95YW5zaS8x
LjAuMSBcCisgICAgICAgICAgIGNyYXRlOi8vY3JhdGVzLmlvL3lva2UvMC43LjQgXAorICAgICAg
ICAgICBjcmF0ZTovL2NyYXRlcy5pby95b2tlLWRlcml2ZS8wLjcuNSBcCisgICAgICAgICAgIGNy
YXRlOi8vY3JhdGVzLmlvL3plcm9jb3B5LzAuNy4zNSBcCisgICAgICAgICAgIGNyYXRlOi8vY3Jh
dGVzLmlvL3plcm9jb3B5LWRlcml2ZS8wLjcuMzUgXAorICAgICAgICAgICBjcmF0ZTovL2NyYXRl
cy5pby96ZXJvZnJvbS8wLjEuNCBcCisgICAgICAgICAgIGNyYXRlOi8vY3JhdGVzLmlvL3plcm9m
cm9tLWRlcml2ZS8wLjEuNSBcCisgICAgICAgICAgIGNyYXRlOi8vY3JhdGVzLmlvL3plcm9pemUv
MS44LjEgXAorICAgICAgICAgICBjcmF0ZTovL2NyYXRlcy5pby96ZXJvdmVjLzAuMTAuNCBcCisg
ICAgICAgICAgIGNyYXRlOi8vY3JhdGVzLmlvL3plcm92ZWMtZGVyaXZlLzAuMTAuMyBcCisgICAg
ICAgICAgIGNyYXRlOi8vY3JhdGVzLmlvL3ppcC8yLjMuMCBcCisgICAgICAgICAgIGNyYXRlOi8v
Y3JhdGVzLmlvL3pvcGZsaS8wLjguMSBcCisgICAgICAgICAgICIKK1NSQ19VUklbc2hhMjU2c3Vt
XSA9ICIwZTBkYzJlMGJmYWEyZTFiZDIzOGUwMjM2Y2Y4YTJiN2UyMjUwY2NhYTI5YzFhYThkMGU2
MWZhNjY0YjAyODlkIgorCitTID0gIiR7V09SS0RJUn0vbWF0dXJpbi0ke1BWfSIKKworQ0ZMQUdT
ICs9ICItZmZpbGUtcHJlZml4LW1hcD0ke0NBUkdPX0hPTUV9PSR7VEFSR0VUX0RCR1NSQ19ESVJ9
L2NhcmdvX2hvbWUiCisKK0RFUEVORFMgKz0gIlwKKyAgICBweXRob24zLXNldHVwdG9vbHMtcnVz
dC1uYXRpdmUgXAorICAgIHB5dGhvbjMtc2VtYW50aWMtdmVyc2lvbi1uYXRpdmUgXAorICAgIHB5
dGhvbjMtc2V0dXB0b29scy1ydXN0IFwKKyIKKworcmVxdWlyZSAke0JQTn0tY3JhdGVzLmluYwor
Citpbmhlcml0IHB5cGkgY2FyZ28tdXBkYXRlLXJlY2lwZS1jcmF0ZXMgcHl0aG9uX3B5bzMgcHl0
aG9uX3NldHVwdG9vbHNfYnVpbGRfbWV0YQorCitkb19jb25maWd1cmUoKSB7CisgICAgcHl0aG9u
X3B5bzNfZG9fY29uZmlndXJlCisgICAgY2FyZ29fY29tbW9uX2RvX2NvbmZpZ3VyZQorICAgIHB5
dGhvbl9wZXA1MTdfZG9fY29uZmlndXJlCit9CisKK1JERVBFTkRTOiR7UE59ICs9ICJcCisgICAg
Y2FyZ28gXAorICAgIHB5dGhvbjMtanNvbiBcCisgICAgcnVzdCBcCisiCisKK1JSRUNPTU1FTkRT
OiR7UE59ICs9ICJcCisgICAgcHl0aG9uMy1lbnN1cmVwaXAgXAorICAgIHB5dGhvbjMtcGlwIFwK
KyAgICBweXRob24zLXZlbnYgXAorIgorCitCQkNMQVNTRVhURU5EID0gIm5hdGl2ZSBuYXRpdmVz
ZGsiCi0tIAoyLjQ3LjEKCg==

--===============7066542140933248981==--

