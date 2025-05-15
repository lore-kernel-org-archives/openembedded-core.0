Return-Path: <auh@yoctoproject.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id CEECAC54E71
	for <webhook@archiver.kernel.org>; Thu, 15 May 2025 12:31:59 +0000 (UTC)
Received: from a27-191.smtp-out.us-west-2.amazonses.com (a27-191.smtp-out.us-west-2.amazonses.com [54.240.27.191])
 by mx.groups.io with SMTP id smtpd.web10.11260.1747312312429516824
 for <openembedded-core@lists.openembedded.org>;
 Thu, 15 May 2025 05:31:56 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@yoctoproject.org header.s=j46ser6a2yusdzubpv7m7ewqgesde2ie header.b=P1YvxB8B;
 dkim=pass header.i=@amazonses.com header.s=gdwg2y3kokkkj5a55z2ilkup5wp5hhxx header.b=LCVfjCSs;
 spf=pass (domain: us-west-2.amazonses.com, ip: 54.240.27.191, mailfrom: 01010196d3ee0b16-caf611eb-8114-408c-addd-6a70e6e1f078-000000@us-west-2.amazonses.com)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/simple;
	s=j46ser6a2yusdzubpv7m7ewqgesde2ie; d=yoctoproject.org;
	t=1747312315;
	h=Content-Type:MIME-Version:From:To:Cc:Subject:Message-Id:Date;
	bh=EperAP9Zmx3TTTMIry51VD3FsRtyPfk6WOrWAhKMi/4=;
	b=P1YvxB8BNy59oHOSaLxc+NuKNkSow6nwQYoCcCLjOqDo9gr9SHGMs2bVP21fqYeb
	NtOUlVTbYYA/ZjPUPAyygPdUmRERb8NefO+9GVqpH+mH6CBTRGJj6m38LE6VAMKv4nZ
	0smpmsKqpYqQDiiVsVtPTDZagPTZSDNbn8duscB0=
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/simple;
	s=gdwg2y3kokkkj5a55z2ilkup5wp5hhxx; d=amazonses.com; t=1747312315;
	h=Content-Type:MIME-Version:From:To:Cc:Subject:Message-Id:Date:Feedback-ID;
	bh=EperAP9Zmx3TTTMIry51VD3FsRtyPfk6WOrWAhKMi/4=;
	b=LCVfjCSs/X3wH+u9zupN5bt1dtA80UaPcnqs0HYDUX30wPQJJDgW+24AYDGcR3s5
	j8QPKkoB719kEE7oGP+sCERAw4FowM2klgCDRjj1UKW3GgMrX7w1fyXK9ti7Y7MDeoS
	KFzV/RW6qkFFmOSH4UuujXbT4Znu1BaAYjTQOcsQ=
Content-Type: multipart/mixed; boundary="===============6295717561839837911=="
MIME-Version: 1.0
From: auh@yoctoproject.org
To: Tim Orling <tim.orling@konsulko.com>
Cc: openembedded-core@lists.openembedded.org
Subject: [AUH] python3-maturin: upgrading to 1.8.6 SUCCEEDED
Message-ID: <01010196d3ee0b16-caf611eb-8114-408c-addd-6a70e6e1f078-000000@us-west-2.amazonses.com>
Date: Thu, 15 May 2025 12:31:55 +0000
Feedback-ID: ::1.us-west-2.9np3MYPs3fEaOBysGKSlUD4KtcmPijcmS9Az2Hwf7iQ=:AmazonSES
X-SES-Outgoing: 2025.05.15-54.240.27.191
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Thu, 15 May 2025 12:31:59 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/216616

--===============6295717561839837911==
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
From 3afd6e92c2fe8b17563fd0c1c62e86ef814a44e7 Mon Sep 17 00:00:00 2001
From: Upgrade Helper <auh@yoctoproject.org>
Date: Thu, 15 May 2025 08:03:49 +0000
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


--===============6295717561839837911==
Content-Type: application/octet-stream
MIME-Version: 1.0
Content-Transfer-Encoding: base64
Content-Disposition: attachment;
 filename="0001-python3-maturin-upgrade-1.8.3-1.8.6.patch"

RnJvbSAzYWZkNmU5MmMyZmU4YjE3NTYzZmQwYzFjNjJlODZlZjgxNGE0NGU3IE1vbiBTZXAgMTcg
MDA6MDA6MDAgMjAwMQpGcm9tOiBVcGdyYWRlIEhlbHBlciA8YXVoQHlvY3RvcHJvamVjdC5vcmc+
CkRhdGU6IFRodSwgMTUgTWF5IDIwMjUgMDg6MDM6NDkgKzAwMDAKU3ViamVjdDogW1BBVENIXSBw
eXRob24zLW1hdHVyaW46IHVwZ3JhZGUgMS44LjMgLT4gMS44LjYKCi0tLQogLi4uL3B5dGhvbi9w
eXRob24zLW1hdHVyaW4tY3JhdGVzLmluYyAgICAgICAgIHwgIDIwICstCiAuLi5sLWNvZGVzLW9u
LXJpc2N2MzJnYy11bmtub3duLWxpbnV4LWcucGF0Y2ggfCAxMTAgLS0tLS0KIC4uLi9weXRob24v
cHl0aG9uMy1tYXR1cmluXzEuOC4zLmJiICAgICAgICAgICB8ICA0MyAtLQogLi4uL3B5dGhvbi9w
eXRob24zLW1hdHVyaW5fMS44LjYuYmIgICAgICAgICAgIHwgNDA1ICsrKysrKysrKysrKysrKysr
KwogNCBmaWxlcyBjaGFuZ2VkLCA0MTUgaW5zZXJ0aW9ucygrKSwgMTYzIGRlbGV0aW9ucygtKQog
ZGVsZXRlIG1vZGUgMTAwNjQ0IG1ldGEvcmVjaXBlcy1kZXZ0b29scy9weXRob24vcHl0aG9uMy1t
YXR1cmluLzAwMDEtRGVmaW5lLW1vcmUtaW9jdGwtY29kZXMtb24tcmlzY3YzMmdjLXVua25vd24t
bGludXgtZy5wYXRjaAogZGVsZXRlIG1vZGUgMTAwNjQ0IG1ldGEvcmVjaXBlcy1kZXZ0b29scy9w
eXRob24vcHl0aG9uMy1tYXR1cmluXzEuOC4zLmJiCiBjcmVhdGUgbW9kZSAxMDA2NDQgbWV0YS9y
ZWNpcGVzLWRldnRvb2xzL3B5dGhvbi9weXRob24zLW1hdHVyaW5fMS44LjYuYmIKCmRpZmYgLS1n
aXQgYS9tZXRhL3JlY2lwZXMtZGV2dG9vbHMvcHl0aG9uL3B5dGhvbjMtbWF0dXJpbi1jcmF0ZXMu
aW5jIGIvbWV0YS9yZWNpcGVzLWRldnRvb2xzL3B5dGhvbi9weXRob24zLW1hdHVyaW4tY3JhdGVz
LmluYwppbmRleCAyZjE5NmY1NjU3Li41YzkzOWEwOWE4IDEwMDY0NAotLS0gYS9tZXRhL3JlY2lw
ZXMtZGV2dG9vbHMvcHl0aG9uL3B5dGhvbjMtbWF0dXJpbi1jcmF0ZXMuaW5jCisrKyBiL21ldGEv
cmVjaXBlcy1kZXZ0b29scy9weXRob24vcHl0aG9uMy1tYXR1cmluLWNyYXRlcy5pbmMKQEAgLTM0
LDcgKzM0LDcgQEAgU1JDX1VSSSArPSAiIFwKICAgICBjcmF0ZTovL2NyYXRlcy5pby9jYXJnby1v
cHRpb25zLzAuNy40IFwKICAgICBjcmF0ZTovL2NyYXRlcy5pby9jYXJnby1wbGF0Zm9ybS8wLjEu
OCBcCiAgICAgY3JhdGU6Ly9jcmF0ZXMuaW8vY2FyZ28teHdpbi8wLjE4LjQgXAotICAgIGNyYXRl
Oi8vY3JhdGVzLmlvL2NhcmdvLXppZ2J1aWxkLzAuMTkuNyBcCisgICAgY3JhdGU6Ly9jcmF0ZXMu
aW8vY2FyZ28temlnYnVpbGQvMC4yMC4wIFwKICAgICBjcmF0ZTovL2NyYXRlcy5pby9jYXJnb19t
ZXRhZGF0YS8wLjE5LjAgXAogICAgIGNyYXRlOi8vY3JhdGVzLmlvL2NiaW5kZ2VuLzAuMjguMCBc
CiAgICAgY3JhdGU6Ly9jcmF0ZXMuaW8vY2MvMS4yLjE2IFwKQEAgLTYwLDcgKzYwLDcgQEAgU1JD
X1VSSSArPSAiIFwKICAgICBjcmF0ZTovL2NyYXRlcy5pby9jcmMvMy4yLjEgXAogICAgIGNyYXRl
Oi8vY3JhdGVzLmlvL2NyYy1jYXRhbG9nLzIuNC4wIFwKICAgICBjcmF0ZTovL2NyYXRlcy5pby9j
cmMzMmZhc3QvMS40LjIgXAotICAgIGNyYXRlOi8vY3JhdGVzLmlvL2Nyb3NzYmVhbS1jaGFubmVs
LzAuNS4xMyBcCisgICAgY3JhdGU6Ly9jcmF0ZXMuaW8vY3Jvc3NiZWFtLWNoYW5uZWwvMC41LjE1
IFwKICAgICBjcmF0ZTovL2NyYXRlcy5pby9jcm9zc2JlYW0tZGVxdWUvMC44LjUgXAogICAgIGNy
YXRlOi8vY3JhdGVzLmlvL2Nyb3NzYmVhbS1lcG9jaC8wLjkuMTggXAogICAgIGNyYXRlOi8vY3Jh
dGVzLmlvL2Nyb3NzYmVhbS11dGlscy8wLjguMjAgXApAQCAtMTY5LDEwICsxNjksMTAgQEAgU1JD
X1VSSSArPSAiIFwKICAgICBjcmF0ZTovL2NyYXRlcy5pby9udW0tY29udi8wLjEuMCBcCiAgICAg
Y3JhdGU6Ly9jcmF0ZXMuaW8vbnVtYmVyX3ByZWZpeC8wLjQuMCBcCiAgICAgY3JhdGU6Ly9jcmF0
ZXMuaW8vb25jZV9jZWxsLzEuMjAuMiBcCi0gICAgY3JhdGU6Ly9jcmF0ZXMuaW8vb3BlbnNzbC8w
LjEwLjcwIFwKKyAgICBjcmF0ZTovL2NyYXRlcy5pby9vcGVuc3NsLzAuMTAuNzIgXAogICAgIGNy
YXRlOi8vY3JhdGVzLmlvL29wZW5zc2wtbWFjcm9zLzAuMS4xIFwKICAgICBjcmF0ZTovL2NyYXRl
cy5pby9vcGVuc3NsLXByb2JlLzAuMS41IFwKLSAgICBjcmF0ZTovL2NyYXRlcy5pby9vcGVuc3Ns
LXN5cy8wLjkuMTA1IFwKKyAgICBjcmF0ZTovL2NyYXRlcy5pby9vcGVuc3NsLXN5cy8wLjkuMTA3
IFwKICAgICBjcmF0ZTovL2NyYXRlcy5pby9vcHRpb24tZXh0LzAuMi4wIFwKICAgICBjcmF0ZTov
L2NyYXRlcy5pby9vc19waXBlLzEuMi4wIFwKICAgICBjcmF0ZTovL2NyYXRlcy5pby9vdmVybG9h
ZC8wLjEuMSBcCkBAIC0zNjIsNyArMzYyLDcgQEAgU1JDX1VSSSArPSAiIFwKICAgICBjcmF0ZTov
L2NyYXRlcy5pby96ZXJvaXplLzEuOC4xIFwKICAgICBjcmF0ZTovL2NyYXRlcy5pby96ZXJvdmVj
LzAuMTAuNCBcCiAgICAgY3JhdGU6Ly9jcmF0ZXMuaW8vemVyb3ZlYy1kZXJpdmUvMC4xMC4zIFwK
LSAgICBjcmF0ZTovL2NyYXRlcy5pby96aXAvMi4yLjMgXAorICAgIGNyYXRlOi8vY3JhdGVzLmlv
L3ppcC8yLjMuMCBcCiAgICAgY3JhdGU6Ly9jcmF0ZXMuaW8vem9wZmxpLzAuOC4xIFwKICIKIApA
QCAtMzk4LDcgKzM5OCw3IEBAIFNSQ19VUklbY2FyZ28tY29uZmlnMi0wLjEuMjYuc2hhMjU2c3Vt
XSA9ICJkODNjZTBiZThiZDE0NzllNWRlNjIwMmRlZjY2MGU2YzdlMjdlCiBTUkNfVVJJW2Nhcmdv
LW9wdGlvbnMtMC43LjQuc2hhMjU2c3VtXSA9ICJmMzU0MDI0N2MwYTM3YTc2ZWIzMjRhY2MyMzhk
YzYxNzc4NmVhMjJjNDNiOTVkYTU2MGM4MmE4ZjI3MTQzMjFmIgogU1JDX1VSSVtjYXJnby1wbGF0
Zm9ybS0wLjEuOC5zaGEyNTZzdW1dID0gIjI0YjFmMDM2NWE2YzZiYjQwMjBjZDA1ODA2ZmQwZDMz
YzQ0ZDM4MDQ2YjhiZDdmMGU0MDgxNGI5NzYzY2FiZmMiCiBTUkNfVVJJW2NhcmdvLXh3aW4tMC4x
OC40LnNoYTI1NnN1bV0gPSAiNjBmMTk1NGU0ZmZhMGY0YzQ3YjNkZjVlNmU5NTA4NzA2ZDhkY2Fh
NTYxNTJjZDY3MmRjZWUwMjkzMGJhMDMyNiIKLVNSQ19VUklbY2FyZ28temlnYnVpbGQtMC4xOS43
LnNoYTI1NnN1bV0gPSAiMDRjYzY0OTMyOGYzOWJiZjFlZjkyZWY3NTM0MDZlMTc4NWZmMTA3NDk0
MWMzOThlNTIxNGI2Yzc0ZDMxOGE5ZSIKK1NSQ19VUklbY2FyZ28temlnYnVpbGQtMC4yMC4wLnNo
YTI1NnN1bV0gPSAiM2Y2ZTllODU2MzkwZDViMGE4NTlhY2FlZGExNjUyOGY4YTYxYzk2NGJkYjg5
NGMzMjE2YzI1NDkwOGYxYzJlYSIKIFNSQ19VUklbY2FyZ29fbWV0YWRhdGEtMC4xOS4wLnNoYTI1
NnN1bV0gPSAiYWZjMzA5ZWQ4OTQ3NmM4OTU3YzUwZmI4MThmNTZmZTg5NGRiODU3ODY2YzNlMTYz
MzM1ZmFhOTFkYzM0ZWI4NSIKIFNSQ19VUklbY2JpbmRnZW4tMC4yOC4wLnNoYTI1NnN1bV0gPSAi
ZWFkZDg2OGEyY2U5Y2EzOGRlN2VlYWZkY2VjOWM3MDY1ZWY4OWI0MmIzMmYwODM5Mjc4ZDU1ZjM1
YzU0ZDFmZiIKIFNSQ19VUklbY2MtMS4yLjE2LnNoYTI1NnN1bV0gPSAiYmU3MTRjMTU0YmU2MDll
YzdmNWRhZDIyM2EzM2JmMTQ4MmZmZjkwNDcyZGUyOGY3MzYyODA2ZTZkNDgzMmI4YyIKQEAgLTQy
NCw3ICs0MjQsNyBAQCBTUkNfVVJJW2NwdWZlYXR1cmVzLTAuMi4xMi5zaGEyNTZzdW1dID0gIjUz
ZmU1ZTI2ZmYxYjdhZWY4YmNhOWM2MDgwNTIwY2ZiOGQ5MzMzYwogU1JDX1VSSVtjcmMtMy4yLjEu
c2hhMjU2c3VtXSA9ICI2OWU2ZTRkN2IzM2E5NGYwOTkxYzI2NzI5OTc2YjEwZWJkZTFkMzRjM2Vl
ODI0MDhmYjUzNjE2NGZhMTBkNjM2IgogU1JDX1VSSVtjcmMtY2F0YWxvZy0yLjQuMC5zaGEyNTZz
dW1dID0gIjE5ZDM3NDI3NmI0MGZiOGJiZGVlOTVhZWY3YzdmYTZiNTMxNmVjNzY0NTEwZWI2NGI4
ZGQwZTJlZDBkN2U3ZjUiCiBTUkNfVVJJW2NyYzMyZmFzdC0xLjQuMi5zaGEyNTZzdW1dID0gImE5
Nzc2OWQ5NGRkYWI5NDNlNDUxMGQxMzgxNTAxNjlhMjc1OGI1ZWYzZWIxOTFhOWVlNjg4ZGUzZTIz
ZWY3YjMiCi1TUkNfVVJJW2Nyb3NzYmVhbS1jaGFubmVsLTAuNS4xMy5zaGEyNTZzdW1dID0gIjMz
NDgwZDY5NDYxOTNhYTgwMzM5MTAxMjQ4OTZjYTM5NTMzM2NhZTdlMmQxMTEzZDFmZWY2YzMyNzIy
MTdkZjIiCitTUkNfVVJJW2Nyb3NzYmVhbS1jaGFubmVsLTAuNS4xNS5zaGEyNTZzdW1dID0gIjgy
YjhmOGY4NjhiMzY5NjdmOTYwNjc5MGQxOTAzNTcwZGU5Y2VhZjg3MGE3YmY5ZmJiZDMwMTZkNjM2
YTJjYjIiCiBTUkNfVVJJW2Nyb3NzYmVhbS1kZXF1ZS0wLjguNS5zaGEyNTZzdW1dID0gIjYxM2Y4
Y2MwMWZlOWNmMWEzZWIzZDdmNDg4ZmQyZmE4Mzg4NDAzZTk3MDM5ZTJmNzM2OTI5MzJlMjkxYTc3
MGQiCiBTUkNfVVJJW2Nyb3NzYmVhbS1lcG9jaC0wLjkuMTguc2hhMjU2c3VtXSA9ICI1YjgyYWM0
YTNjMmNhOWMzNDYwOTY0ZjAyMGUxNDAyZWRkNTc1MzQxMWQ3NzM3YWEzOWMzNzE0YWQxYjU0MjBl
IgogU1JDX1VSSVtjcm9zc2JlYW0tdXRpbHMtMC44LjIwLnNoYTI1NnN1bV0gPSAiMjJlYzk5NTQ1
YmIwZWQwZWE3YmI5YjhlMWU5MTIyZWEzODZmZjhhNDhjMDkyMmU0M2YzNmQ0NWFiMDllMGU4MCIK
QEAgLTUzMywxMCArNTMzLDEwIEBAIFNSQ19VUklbbnUtYW5zaS10ZXJtLTAuNDYuMC5zaGEyNTZz
dW1dID0gIjc3YTgxNjU3MjZlODIzNjA2NGRiYjQ1NDU5MjQyNjAwMzA0YjQyCiBTUkNfVVJJW251
bS1jb252LTAuMS4wLnNoYTI1NnN1bV0gPSAiNTFkNTE1ZDMyZmIxODJlZTM3Y2RhMmNjZGNiOTI5
NTBkNmEzYzI4OTNhYTI4MGU1NDA2NzFjMmNkMGYzYjFkOSIKIFNSQ19VUklbbnVtYmVyX3ByZWZp
eC0wLjQuMC5zaGEyNTZzdW1dID0gIjgzMGIyNDZhMGU1ZjIwYWY4NzE0MWIyNWMxNzNjZDFiNjA5
YmQ3Nzc5YTQ2MTdkNmVjNTgyYWJhZjkwODcwZjMiCiBTUkNfVVJJW29uY2VfY2VsbC0xLjIwLjIu
c2hhMjU2c3VtXSA9ICIxMjYxZmU3ZTMzYzczYjM1NGVhYjQzYjEyNzNhNTdjOGY5NjdkMDM5MWU4
MDM1M2U1MWY3NjRhYzAyY2Y2Nzc1IgotU1JDX1VSSVtvcGVuc3NsLTAuMTAuNzAuc2hhMjU2c3Vt
XSA9ICI2MWNmYjRlMTY2YThiYjhjOWI1NWM1MDBiYzIzMDg1NTAxNDhlY2U4ODliZTkwZjYwOTM3
N2U1ODE0MGY0MmM2IgorU1JDX1VSSVtvcGVuc3NsLTAuMTAuNzIuc2hhMjU2c3VtXSA9ICJmZWRm
ZWE3ZDU4YTFmNzMxMTg0MzBhNTVkYTZhMjg2ZTdiMDQ0OTYxNzM2Y2U5NmExNmExNzA2OGVhMjVl
NWRhIgogU1JDX1VSSVtvcGVuc3NsLW1hY3Jvcy0wLjEuMS5zaGEyNTZzdW1dID0gImE5NDg2NjZi
NjM3YTBmNDY1ZTg1NjRjNzNlODlkNGRkZTAwZDcyZDRkNDczY2M5NzJmMzkwZmMzZGNlZTdkOWMi
CiBTUkNfVVJJW29wZW5zc2wtcHJvYmUtMC4xLjUuc2hhMjU2c3VtXSA9ICJmZjAxMWEzMDJjMzk2
YTUxOTc2OTI0MzFmYzE5NDgwMTkxNTRhZmMxNzhiYWY3ZDhlMzczNjc0NDJhNDYwMWNmIgotU1JD
X1VSSVtvcGVuc3NsLXN5cy0wLjkuMTA1LnNoYTI1NnN1bV0gPSAiOGIyMmQ1Yjg0YmUwNWE4ZDY5
NDdjN2NiNzFmN2M4NDlhYTBmMTEyYWNkNGJmNTFjMmE3YzFjOTg4YWMwYTlkYyIKK1NSQ19VUklb
b3BlbnNzbC1zeXMtMC45LjEwNy5zaGEyNTZzdW1dID0gIjgyODg5NzlhY2Q4NDc0OWM3NDRhOTAx
NGI0MzgyZDQyYjhmN2IyNTkyODQ3YjVhZmIyZWQyOWU1ZDE2ZWRlMDciCiBTUkNfVVJJW29wdGlv
bi1leHQtMC4yLjAuc2hhMjU2c3VtXSA9ICIwNDc0NGY0OWVhZTk5YWI3OGUwZDVjMGI2MDNhYjIx
OGY1MTVlYThjZmU1YTQ1NmQ3NjI5YWQ4ODNhM2I2ZTdkIgogU1JDX1VSSVtvc19waXBlLTEuMi4w
LnNoYTI1NnN1bV0gPSAiMjlkNzNiYThkYWY4ZmFjMTNiMDUwMWQxYWJlZGRjZmUyMWJhNzQwMWFk
YTYxYTgxOTE0NGI2YzJhNGYzMjIwOSIKIFNSQ19VUklbb3ZlcmxvYWQtMC4xLjEuc2hhMjU2c3Vt
XSA9ICJiMTU4MTMxNjNjMWQ4MzFiZjRhMTNjMzYxMGMwNWMwZDAzYjM5ZmViMDdmN2UwOWZhMjM0
ZGFjOWIxNWFhZjM5IgpAQCAtNzI2LDUgKzcyNiw1IEBAIFNSQ19VUklbemVyb2Zyb20tZGVyaXZl
LTAuMS41LnNoYTI1NnN1bV0gPSAiNTk1ZWVkOTgyZjdkMzU1YmViODU4MzdmNjUxZmEyMmU5MGIz
CiBTUkNfVVJJW3plcm9pemUtMS44LjEuc2hhMjU2c3VtXSA9ICJjZWQzNjc4YTI4NzliMzAzMDZk
MzIzZjQ1NDI2MjY2OTdhNDY0YTk3YzBhMDdjOWFlYmY3ZWJjYTY1Y2Q0ZGRlIgogU1JDX1VSSVt6
ZXJvdmVjLTAuMTAuNC5zaGEyNTZzdW1dID0gImFhMmI4OTNkNzlkZjIzYmZiMTJkNTQ2MTAxOGQ0
MDhlYTE5ZGZhZmU3NmMyYzdlZjZkNGViYTYxNGY4ZmYwNzkiCiBTUkNfVVJJW3plcm92ZWMtZGVy
aXZlLTAuMTAuMy5zaGEyNTZzdW1dID0gIjZlYWZhNmRmYjE3NTg0ZWEzZTJiZDZlNzZlMGNjMTVh
ZDdhZjEyYjA5YWJkZDFjYTU1OTYxYmVkOWIxMDYzYzYiCi1TUkNfVVJJW3ppcC0yLjIuMy5zaGEy
NTZzdW1dID0gImIyODA0ODRjNDU0ZTc0ZTVmZmY2NThiYmY3ZGY4ZmRiZTdhMDdjNmIyZGU0YTUz
ZGVmMjMyYzE1ZWYxMzhmM2EiCitTUkNfVVJJW3ppcC0yLjMuMC5zaGEyNTZzdW1dID0gIjg0ZTlh
NzcyYTU0YjU0MjM2YjliNzQ0YWFhZjhkN2JlMDFiNGQ2ZTk5NzI1NTIzY2I4MmNiMzJkMWM4MWIx
ZDciCiBTUkNfVVJJW3pvcGZsaS0wLjguMS5zaGEyNTZzdW1dID0gImU1MDE5ZjM5MWJhYzVjZjI1
MmU5M2JiY2M1M2QwMzlmZmQ2MmM3YmZiN2MxNTA0MTRkNjEzNjlhZmU1N2U5NDYiCmRpZmYgLS1n
aXQgYS9tZXRhL3JlY2lwZXMtZGV2dG9vbHMvcHl0aG9uL3B5dGhvbjMtbWF0dXJpbi8wMDAxLURl
ZmluZS1tb3JlLWlvY3RsLWNvZGVzLW9uLXJpc2N2MzJnYy11bmtub3duLWxpbnV4LWcucGF0Y2gg
Yi9tZXRhL3JlY2lwZXMtZGV2dG9vbHMvcHl0aG9uL3B5dGhvbjMtbWF0dXJpbi8wMDAxLURlZmlu
ZS1tb3JlLWlvY3RsLWNvZGVzLW9uLXJpc2N2MzJnYy11bmtub3duLWxpbnV4LWcucGF0Y2gKZGVs
ZXRlZCBmaWxlIG1vZGUgMTAwNjQ0CmluZGV4IGFjZWVmYTc5NjcuLjAwMDAwMDAwMDAKLS0tIGEv
bWV0YS9yZWNpcGVzLWRldnRvb2xzL3B5dGhvbi9weXRob24zLW1hdHVyaW4vMDAwMS1EZWZpbmUt
bW9yZS1pb2N0bC1jb2Rlcy1vbi1yaXNjdjMyZ2MtdW5rbm93bi1saW51eC1nLnBhdGNoCisrKyAv
ZGV2L251bGwKQEAgLTEsMTEwICswLDAgQEAKLUZyb20gNGI0MzliMDk1MzU3M2UwMzgzZGE3ZTA5
MmIxZjUxNmJhMjFmMzM5OCBNb24gU2VwIDE3IDAwOjAwOjAwIDIwMDEKLUZyb206IERhbiBHb2ht
YW4gPGRldkBzdW5maXNoY29kZS5vbmxpbmU+Ci1EYXRlOiBTdW4sIDYgQXByIDIwMjUgMDU6MjI6
NDkgLTA3MDAKLVN1YmplY3Q6IFtQQVRDSF0gRGVmaW5lIExpbnV4IGlvY3RsIGNvZGVzIG9uIG1v
cmUgYXJjaGl0ZWN0dXJlcy4KLQotRGVmaW5lIGlvY3RsIGNvZGVzIGluY2x1ZGluZyBgRklDTE9O
RWAgYW5kIGBGU19JT0MzMl9HRVRWRVJTSU9OYCB1c2luZwotYF9JT1JgIGFuZCBgX0lPV2Agc28g
dGhhdCB0aGV5J3JlIGF1dG9tYXRpY2FsbHkgc3VwcG9ydGVkIG9uIGFsbAotYXJjaGl0ZWN0dXJl
cywgaW5jbHVkaW5nIHJpc2N2MzJnYy11bmtub3duLWxpbnV4LWdudS4KLQotVXBzdHJlYW0tU3Rh
dHVzOiBCYWNrcG9ydCBbaHR0cHM6Ly9naXRodWIuY29tL3J1c3QtbGFuZy9saWJjL3B1bGwvNDM4
Mi9dCi1TaWduZWQtb2ZmLWJ5OiBLaGVtIFJhaiA8cmFqLmtoZW1AZ21haWwuY29tPgotLS0tCi0g
c3JjL3VuaXgvbGludXhfbGlrZS9saW51eC9hcmNoL2dlbmVyaWMvbW9kLnJzIHwgNzUgKysrKy0t
LS0tLS0tLS0tLS0tLQotIDEgZmlsZSBjaGFuZ2VkLCAxNSBpbnNlcnRpb25zKCspLCA2MCBkZWxl
dGlvbnMoLSkKLQotLS0tIGEvc3JjL3VuaXgvbGludXhfbGlrZS9saW51eC9hcmNoL2dlbmVyaWMv
bW9kLnJzCi0rKysgYi9zcmMvdW5peC9saW51eF9saWtlL2xpbnV4L2FyY2gvZ2VuZXJpYy9tb2Qu
cnMKLUBAIC0xLDUgKzEsNSBAQAotIHVzZSBjcmF0ZTo6cHJlbHVkZTo6KjsKLS11c2UgY3JhdGU6
OklvY3RsOwotK3VzZSBjcmF0ZTo6e0lvY3RsLCBfSU9SLCBfSU9XfTsKLSAKLSBzISB7Ci0gICAg
IHB1YiBzdHJ1Y3QgdGVybWlvczIgewotQEAgLTExNiwyMSArMTE2LDggQEAgY2ZnX2lmISB7Ci0g
Ly8gcHViIGNvbnN0IFNPX1BSRUZFUl9CVVNZX1BPTEw6IGNfaW50ID0gNjk7Ci0gLy8gcHViIGNv
bnN0IFNPX0JVU1lfUE9MTF9CVURHRVQ6IGNfaW50ID0gNzA7Ci0gCi0tY2ZnX2lmISB7Ci0tICAg
IGlmICNbY2ZnKGFueSgKLS0gICAgICAgIHRhcmdldF9hcmNoID0gIng4NiIsCi0tICAgICAgICB0
YXJnZXRfYXJjaCA9ICJ4ODZfNjQiLAotLSAgICAgICAgdGFyZ2V0X2FyY2ggPSAiYXJtIiwKLS0g
ICAgICAgIHRhcmdldF9hcmNoID0gImFhcmNoNjQiLAotLSAgICAgICAgdGFyZ2V0X2FyY2ggPSAi
cmlzY3Y2NCIsCi0tICAgICAgICB0YXJnZXRfYXJjaCA9ICJzMzkweCIsCi0tICAgICAgICB0YXJn
ZXRfYXJjaCA9ICJjc2t5IiwKLS0gICAgICAgIHRhcmdldF9hcmNoID0gImxvb25nYXJjaDY0Igot
LSAgICApKV0gewotLSAgICAgICAgcHViIGNvbnN0IEZJQ0xPTkU6IGNfdWxvbmcgPSAweDQwMDQ5
NDA5OwotLSAgICAgICAgcHViIGNvbnN0IEZJQ0xPTkVSQU5HRTogY191bG9uZyA9IDB4NDAyMDk0
MEQ7Ci0tICAgIH0KLS19Ci0rcHViIGNvbnN0IEZJQ0xPTkU6IElvY3RsID0gX0lPVzo6PGNfaW50
PigweDk0LCA5KSBhcyBJb2N0bDsKLStwdWIgY29uc3QgRklDTE9ORVJBTkdFOiBJb2N0bCA9IF9J
T1c6OjxjcmF0ZTo6ZmlsZV9jbG9uZV9yYW5nZT4oMHg5NCwgMTMpIGFzIElvY3RsOwotIAotIC8v
IERlZmluZWQgaW4gdW5peC9saW51eF9saWtlL21vZC5ycwotIC8vIHB1YiBjb25zdCBTQ01fVElN
RVNUQU1QOiBjX2ludCA9IFNPX1RJTUVTVEFNUDsKLUBAIC0yNDgsNDkgKzIzNSwxOCBAQCBwdWIg
Y29uc3QgVFVOR0VUVk5FVEJFOiBJb2N0bCA9IDB4ODAwNDU0Ci0gcHViIGNvbnN0IFRVTlNFVFNU
RUVSSU5HRUJQRjogSW9jdGwgPSAweDgwMDQ1NGUwOwotIHB1YiBjb25zdCBUVU5TRVRGSUxURVJF
QlBGOiBJb2N0bCA9IDB4ODAwNDU0ZTE7Ci0gCi0tY2ZnX2lmISB7Ci0tICAgIC8vIFRob3NlIHR5
cGUgYXJlIGNvbnN0cnVjdGVkIHVzaW5nIHRoZSBfSU9DIG1hY3JvCi0tICAgIC8vIERELVNTX1NT
U1NfU1NTU19TU1NTLVRUVFRfVFRUVC1OTk5OX05OTk4KLS0gICAgLy8gd2hlcmUgRCBzdGFuZHMg
Zm9yIGRpcmVjdGlvbiAoZWl0aGVyIE5vbmUgKDAwKSwgUmVhZCAoMDEpIG9yIFdyaXRlICgxMSkp
Ci0tICAgIC8vIHdoZXJlIFMgc3RhbmRzIGZvciBzaXplIChpbnQsIGxvbmcsIHN0cnVjdC4uLikK
LS0gICAgLy8gd2hlcmUgVCBzdGFuZHMgZm9yIHR5cGUgKCdmJywndicsJ1gnLi4uKQotLSAgICAv
LyB3aGVyZSBOIHN0YW5kcyBmb3IgTlIgKE51bWJlUikKLS0gICAgaWYgI1tjZmcoYW55KAotLSAg
ICAgICAgdGFyZ2V0X2FyY2ggPSAieDg2IiwKLS0gICAgICAgIHRhcmdldF9hcmNoID0gImFybSIs
Ci0tICAgICAgICB0YXJnZXRfYXJjaCA9ICJjc2t5IgotLSAgICApKV0gewotLSAgICAgICAgcHVi
IGNvbnN0IEZTX0lPQ19HRVRGTEFHUzogSW9jdGwgPSAweDgwMDQ2NjAxOwotLSAgICAgICAgcHVi
IGNvbnN0IEZTX0lPQ19TRVRGTEFHUzogSW9jdGwgPSAweDQwMDQ2NjAyOwotLSAgICAgICAgcHVi
IGNvbnN0IEZTX0lPQ19HRVRWRVJTSU9OOiBJb2N0bCA9IDB4ODAwNDc2MDE7Ci0tICAgICAgICBw
dWIgY29uc3QgRlNfSU9DX1NFVFZFUlNJT046IElvY3RsID0gMHg0MDA0NzYwMjsKLS0gICAgICAg
IHB1YiBjb25zdCBGU19JT0MzMl9HRVRGTEFHUzogSW9jdGwgPSAweDgwMDQ2NjAxOwotLSAgICAg
ICAgcHViIGNvbnN0IEZTX0lPQzMyX1NFVEZMQUdTOiBJb2N0bCA9IDB4NDAwNDY2MDI7Ci0tICAg
ICAgICBwdWIgY29uc3QgRlNfSU9DMzJfR0VUVkVSU0lPTjogSW9jdGwgPSAweDgwMDQ3NjAxOwot
LSAgICAgICAgcHViIGNvbnN0IEZTX0lPQzMyX1NFVFZFUlNJT046IElvY3RsID0gMHg0MDA0NzYw
MjsKLS0gICAgICAgIHB1YiBjb25zdCBUVU5BVFRBQ0hGSUxURVI6IElvY3RsID0gMHg0MDA4NTRk
NTsKLS0gICAgICAgIHB1YiBjb25zdCBUVU5ERVRBQ0hGSUxURVI6IElvY3RsID0gMHg0MDA4NTRk
NjsKLS0gICAgICAgIHB1YiBjb25zdCBUVU5HRVRGSUxURVI6IElvY3RsID0gMHg4MDA4NTRkYjsK
LS0gICAgfSBlbHNlIGlmICNbY2ZnKGFueSgKLS0gICAgICAgIHRhcmdldF9hcmNoID0gIng4Nl82
NCIsCi0tICAgICAgICB0YXJnZXRfYXJjaCA9ICJyaXNjdjY0IiwKLS0gICAgICAgIHRhcmdldF9h
cmNoID0gImFhcmNoNjQiLAotLSAgICAgICAgdGFyZ2V0X2FyY2ggPSAiczM5MHgiLAotLSAgICAg
ICAgdGFyZ2V0X2FyY2ggPSAibG9vbmdhcmNoNjQiCi0tICAgICkpXSB7Ci0tICAgICAgICBwdWIg
Y29uc3QgRlNfSU9DX0dFVEZMQUdTOiBJb2N0bCA9IDB4ODAwODY2MDE7Ci0tICAgICAgICBwdWIg
Y29uc3QgRlNfSU9DX1NFVEZMQUdTOiBJb2N0bCA9IDB4NDAwODY2MDI7Ci0tICAgICAgICBwdWIg
Y29uc3QgRlNfSU9DX0dFVFZFUlNJT046IElvY3RsID0gMHg4MDA4NzYwMTsKLS0gICAgICAgIHB1
YiBjb25zdCBGU19JT0NfU0VUVkVSU0lPTjogSW9jdGwgPSAweDQwMDg3NjAyOwotLSAgICAgICAg
cHViIGNvbnN0IEZTX0lPQzMyX0dFVEZMQUdTOiBJb2N0bCA9IDB4ODAwNDY2MDE7Ci0tICAgICAg
ICBwdWIgY29uc3QgRlNfSU9DMzJfU0VURkxBR1M6IElvY3RsID0gMHg0MDA0NjYwMjsKLS0gICAg
ICAgIHB1YiBjb25zdCBGU19JT0MzMl9HRVRWRVJTSU9OOiBJb2N0bCA9IDB4ODAwNDc2MDE7Ci0t
ICAgICAgICBwdWIgY29uc3QgRlNfSU9DMzJfU0VUVkVSU0lPTjogSW9jdGwgPSAweDQwMDQ3NjAy
OwotLSAgICAgICAgcHViIGNvbnN0IFRVTkFUVEFDSEZJTFRFUjogSW9jdGwgPSAweDQwMTA1NGQ1
OwotLSAgICAgICAgcHViIGNvbnN0IFRVTkRFVEFDSEZJTFRFUjogSW9jdGwgPSAweDQwMTA1NGQ2
OwotLSAgICAgICAgcHViIGNvbnN0IFRVTkdFVEZJTFRFUjogSW9jdGwgPSAweDgwMTA1NGRiOwot
LSAgICB9Ci0tfQotK3B1YiBjb25zdCBGU19JT0NfR0VURkxBR1M6IElvY3RsID0gX0lPUjo6PGNf
bG9uZz4oJ2YnIGFzIHUzMiwgMSkgYXMgSW9jdGw7Ci0rcHViIGNvbnN0IEZTX0lPQ19TRVRGTEFH
UzogSW9jdGwgPSBfSU9XOjo8Y19sb25nPignZicgYXMgdTMyLCAyKSBhcyBJb2N0bDsKLStwdWIg
Y29uc3QgRlNfSU9DX0dFVFZFUlNJT046IElvY3RsID0gX0lPUjo6PGNfbG9uZz4oJ3YnIGFzIHUz
MiwgMSkgYXMgSW9jdGw7Ci0rcHViIGNvbnN0IEZTX0lPQ19TRVRWRVJTSU9OOiBJb2N0bCA9IF9J
T1c6OjxjX2xvbmc+KCd2JyBhcyB1MzIsIDIpIGFzIElvY3RsOwotK3B1YiBjb25zdCBGU19JT0Mz
Ml9HRVRGTEFHUzogSW9jdGwgPSBfSU9SOjo8Y19pbnQ+KCdmJyBhcyB1MzIsIDEpIGFzIElvY3Rs
OwotK3B1YiBjb25zdCBGU19JT0MzMl9TRVRGTEFHUzogSW9jdGwgPSBfSU9XOjo8Y19pbnQ+KCdm
JyBhcyB1MzIsIDIpIGFzIElvY3RsOwotK3B1YiBjb25zdCBGU19JT0MzMl9HRVRWRVJTSU9OOiBJ
b2N0bCA9IF9JT1I6OjxjX2ludD4oJ3YnIGFzIHUzMiwgMSkgYXMgSW9jdGw7Ci0rcHViIGNvbnN0
IEZTX0lPQzMyX1NFVFZFUlNJT046IElvY3RsID0gX0lPVzo6PGNfaW50PigndicgYXMgdTMyLCAy
KSBhcyBJb2N0bDsKLSsKLStwdWIgY29uc3QgVFVOQVRUQUNIRklMVEVSOiBJb2N0bCA9IF9JT1c6
OjxjcmF0ZTo6c29ja19mcHJvZz4oJ1QnIGFzIHUzMiwgMjEzKSBhcyBJb2N0bDsKLStwdWIgY29u
c3QgVFVOREVUQUNIRklMVEVSOiBJb2N0bCA9IF9JT1c6OjxjcmF0ZTo6c29ja19mcHJvZz4oJ1Qn
IGFzIHUzMiwgMjE0KSBhcyBJb2N0bDsKLStwdWIgY29uc3QgVFVOR0VURklMVEVSOiBJb2N0bCA9
IF9JT1I6OjxjcmF0ZTo6c29ja19mcHJvZz4oJ1QnIGFzIHUzMiwgMjE5KSBhcyBJb2N0bDsKLSAK
LSBjZmdfaWYhIHsKLSAgICAgaWYgI1tjZmcoYW55KHRhcmdldF9hcmNoID0gImFybSIsIHRhcmdl
dF9hcmNoID0gInMzOTB4IikpXSB7CmRpZmYgLS1naXQgYS9tZXRhL3JlY2lwZXMtZGV2dG9vbHMv
cHl0aG9uL3B5dGhvbjMtbWF0dXJpbl8xLjguMy5iYiBiL21ldGEvcmVjaXBlcy1kZXZ0b29scy9w
eXRob24vcHl0aG9uMy1tYXR1cmluXzEuOC4zLmJiCmRlbGV0ZWQgZmlsZSBtb2RlIDEwMDY0NApp
bmRleCAwODk3NWUxNzdmLi4wMDAwMDAwMDAwCi0tLSBhL21ldGEvcmVjaXBlcy1kZXZ0b29scy9w
eXRob24vcHl0aG9uMy1tYXR1cmluXzEuOC4zLmJiCisrKyAvZGV2L251bGwKQEAgLTEsNDMgKzAs
MCBAQAotU1VNTUFSWSA9ICJCdWlsZCBhbmQgcHVibGlzaCBjcmF0ZXMgd2l0aCBweW8zLCBydXN0
LWNweXRob24sIGNmZmkgYmluZGluZ3MgYW5kIHJ1c3QgYmluYXJpZXMgYXMgcHl0aG9uIHBhY2th
Z2VzIgotSE9NRVBBR0UgPSAiaHR0cHM6Ly9naXRodWIuY29tL3B5bzMvbWF0dXJpbiIKLVNFQ1RJ
T04gPSAiZGV2ZWwvcHl0aG9uIgotTElDRU5TRSA9ICJNSVQgfCBBcGFjaGUtMi4wIgotTElDX0ZJ
TEVTX0NIS1NVTSA9ICJmaWxlOi8vbGljZW5zZS1hcGFjaGU7bWQ1PTE4MzZlZmIyZWI3Nzk5NjY2
OTZmNDczZWU4NTQwNTQyIFwKLSAgICAgICAgICAgICAgICAgICAgZmlsZTovL2xpY2Vuc2UtbWl0
O21kNT04NWZkM2I2NzA2OWNmZjc4NGQ5OGViZmM3ZDVjMDc5NyIKLQotU1JDX1VSSSArPSAiZmls
ZTovLzAwMDEtRGVmaW5lLW1vcmUtaW9jdGwtY29kZXMtb24tcmlzY3YzMmdjLXVua25vd24tbGlu
dXgtZy5wYXRjaDtwYXRjaGRpcj0ke0NBUkdPX1ZFTkRPUklOR19ESVJFQ1RPUll9L2xpYmMtMC4y
LjE2NyIKLVNSQ19VUklbc2hhMjU2c3VtXSA9ICIzMDQ3NjJmODZmZDUzYTgwMzFiMWJmMDA2ZDEy
NTcyYTJhYTBhNTIzNTQ4NTAzMTExMzE5NWNjMDE1MmUxZTEyIgotCi1TID0gIiR7V09SS0RJUn0v
bWF0dXJpbi0ke1BWfSIKLQotQ0ZMQUdTICs9ICItZmZpbGUtcHJlZml4LW1hcD0ke0NBUkdPX0hP
TUV9PSR7VEFSR0VUX0RCR1NSQ19ESVJ9L2NhcmdvX2hvbWUiCi0KLURFUEVORFMgKz0gIlwKLSAg
ICBweXRob24zLXNldHVwdG9vbHMtcnVzdC1uYXRpdmUgXAotICAgIHB5dGhvbjMtc2VtYW50aWMt
dmVyc2lvbi1uYXRpdmUgXAotICAgIHB5dGhvbjMtc2V0dXB0b29scy1ydXN0IFwKLSIKLQotcmVx
dWlyZSAke0JQTn0tY3JhdGVzLmluYwotCi1pbmhlcml0IHB5cGkgY2FyZ28tdXBkYXRlLXJlY2lw
ZS1jcmF0ZXMgcHl0aG9uX3B5bzMgcHl0aG9uX3NldHVwdG9vbHNfYnVpbGRfbWV0YQotCi1kb19j
b25maWd1cmUoKSB7Ci0gICAgcHl0aG9uX3B5bzNfZG9fY29uZmlndXJlCi0gICAgY2FyZ29fY29t
bW9uX2RvX2NvbmZpZ3VyZQotICAgIHB5dGhvbl9wZXA1MTdfZG9fY29uZmlndXJlCi19Ci0KLVJE
RVBFTkRTOiR7UE59ICs9ICJcCi0gICAgY2FyZ28gXAotICAgIHB5dGhvbjMtanNvbiBcCi0gICAg
cnVzdCBcCi0iCi0KLVJSRUNPTU1FTkRTOiR7UE59ICs9ICJcCi0gICAgcHl0aG9uMy1lbnN1cmVw
aXAgXAotICAgIHB5dGhvbjMtcGlwIFwKLSAgICBweXRob24zLXZlbnYgXAotIgotCi1CQkNMQVNT
RVhURU5EID0gIm5hdGl2ZSBuYXRpdmVzZGsiCmRpZmYgLS1naXQgYS9tZXRhL3JlY2lwZXMtZGV2
dG9vbHMvcHl0aG9uL3B5dGhvbjMtbWF0dXJpbl8xLjguNi5iYiBiL21ldGEvcmVjaXBlcy1kZXZ0
b29scy9weXRob24vcHl0aG9uMy1tYXR1cmluXzEuOC42LmJiCm5ldyBmaWxlIG1vZGUgMTAwNjQ0
CmluZGV4IDAwMDAwMDAwMDAuLmQ3YWE5ZmM5OWYKLS0tIC9kZXYvbnVsbAorKysgYi9tZXRhL3Jl
Y2lwZXMtZGV2dG9vbHMvcHl0aG9uL3B5dGhvbjMtbWF0dXJpbl8xLjguNi5iYgpAQCAtMCwwICsx
LDQwNSBAQAorU1VNTUFSWSA9ICJCdWlsZCBhbmQgcHVibGlzaCBjcmF0ZXMgd2l0aCBweW8zLCBy
dXN0LWNweXRob24sIGNmZmkgYmluZGluZ3MgYW5kIHJ1c3QgYmluYXJpZXMgYXMgcHl0aG9uIHBh
Y2thZ2VzIgorSE9NRVBBR0UgPSAiaHR0cHM6Ly9naXRodWIuY29tL3B5bzMvbWF0dXJpbiIKK1NF
Q1RJT04gPSAiZGV2ZWwvcHl0aG9uIgorTElDRU5TRSA9ICJNSVQgfCBBcGFjaGUtMi4wIgorTElD
X0ZJTEVTX0NIS1NVTSA9ICJmaWxlOi8vbGljZW5zZS1hcGFjaGU7bWQ1PTE4MzZlZmIyZWI3Nzk5
NjY2OTZmNDczZWU4NTQwNTQyIFwKKyAgICAgICAgICAgICAgICAgICAgZmlsZTovL2xpY2Vuc2Ut
bWl0O21kNT04NWZkM2I2NzA2OWNmZjc4NGQ5OGViZmM3ZDVjMDc5NyIKKworU1JDX1VSSSArPSAi
Y3JhdGU6Ly9jcmF0ZXMuaW8vYWRsZXIyLzIuMC4wIFwKKyAgICAgICAgICAgY3JhdGU6Ly9jcmF0
ZXMuaW8vYWhhc2gvMC44LjExIFwKKyAgICAgICAgICAgY3JhdGU6Ly9jcmF0ZXMuaW8vYWhvLWNv
cmFzaWNrLzEuMS4zIFwKKyAgICAgICAgICAgY3JhdGU6Ly9jcmF0ZXMuaW8vYWxsb2NhdG9yLWFw
aTIvMC4yLjE4IFwKKyAgICAgICAgICAgY3JhdGU6Ly9jcmF0ZXMuaW8vYW5zdHJlYW0vMC42LjE0
IFwKKyAgICAgICAgICAgY3JhdGU6Ly9jcmF0ZXMuaW8vYW5zdHlsZS8xLjAuNyBcCisgICAgICAg
ICAgIGNyYXRlOi8vY3JhdGVzLmlvL2Fuc3R5bGUtcGFyc2UvMC4yLjQgXAorICAgICAgICAgICBj
cmF0ZTovL2NyYXRlcy5pby9hbnN0eWxlLXF1ZXJ5LzEuMS4wIFwKKyAgICAgICAgICAgY3JhdGU6
Ly9jcmF0ZXMuaW8vYW5zdHlsZS13aW5jb24vMy4wLjMgXAorICAgICAgICAgICBjcmF0ZTovL2Ny
YXRlcy5pby9hbnlob3cvMS4wLjg5IFwKKyAgICAgICAgICAgY3JhdGU6Ly9jcmF0ZXMuaW8vYXJi
aXRyYXJ5LzEuNC4xIFwKKyAgICAgICAgICAgY3JhdGU6Ly9jcmF0ZXMuaW8vYXV0b2NmZy8xLjMu
MCBcCisgICAgICAgICAgIGNyYXRlOi8vY3JhdGVzLmlvL2F1dG9tb2QvMS4wLjE0IFwKKyAgICAg
ICAgICAgY3JhdGU6Ly9jcmF0ZXMuaW8vYmFzZTY0LzAuMjEuNyBcCisgICAgICAgICAgIGNyYXRl
Oi8vY3JhdGVzLmlvL2Jhc2U2NC8wLjIyLjEgXAorICAgICAgICAgICBjcmF0ZTovL2NyYXRlcy5p
by9iaXRmbGFncy8xLjMuMiBcCisgICAgICAgICAgIGNyYXRlOi8vY3JhdGVzLmlvL2JpdGZsYWdz
LzIuNS4wIFwKKyAgICAgICAgICAgY3JhdGU6Ly9jcmF0ZXMuaW8vYmxvY2stYnVmZmVyLzAuMTAu
NCBcCisgICAgICAgICAgIGNyYXRlOi8vY3JhdGVzLmlvL2JveGNhci8wLjIuOCBcCisgICAgICAg
ICAgIGNyYXRlOi8vY3JhdGVzLmlvL2JzdHIvMS4xMC4wIFwKKyAgICAgICAgICAgY3JhdGU6Ly9j
cmF0ZXMuaW8vYnVtcGFsby8zLjE2LjAgXAorICAgICAgICAgICBjcmF0ZTovL2NyYXRlcy5pby9i
eXRlb3JkZXIvMS41LjAgXAorICAgICAgICAgICBjcmF0ZTovL2NyYXRlcy5pby9ieXRlcy8xLjku
MCBcCisgICAgICAgICAgIGNyYXRlOi8vY3JhdGVzLmlvL2J5dGVzaXplLzEuMy4wIFwKKyAgICAg
ICAgICAgY3JhdGU6Ly9jcmF0ZXMuaW8vYnppcDIvMC41LjIgXAorICAgICAgICAgICBjcmF0ZTov
L2NyYXRlcy5pby9iemlwMi1zeXMvMC4xLjEzKzEuMC44IFwKKyAgICAgICAgICAgY3JhdGU6Ly9j
cmF0ZXMuaW8vY2FiLzAuNi4wIFwKKyAgICAgICAgICAgY3JhdGU6Ly9jcmF0ZXMuaW8vY2FtaW5v
LzEuMS45IFwKKyAgICAgICAgICAgY3JhdGU6Ly9jcmF0ZXMuaW8vY2FyZ28tY29uZmlnMi8wLjEu
MjYgXAorICAgICAgICAgICBjcmF0ZTovL2NyYXRlcy5pby9jYXJnby1vcHRpb25zLzAuNy40IFwK
KyAgICAgICAgICAgY3JhdGU6Ly9jcmF0ZXMuaW8vY2FyZ28tcGxhdGZvcm0vMC4xLjggXAorICAg
ICAgICAgICBjcmF0ZTovL2NyYXRlcy5pby9jYXJnby14d2luLzAuMTguNCBcCisgICAgICAgICAg
IGNyYXRlOi8vY3JhdGVzLmlvL2NhcmdvLXppZ2J1aWxkLzAuMjAuMCBcCisgICAgICAgICAgIGNy
YXRlOi8vY3JhdGVzLmlvL2NhcmdvX21ldGFkYXRhLzAuMTkuMCBcCisgICAgICAgICAgIGNyYXRl
Oi8vY3JhdGVzLmlvL2NiaW5kZ2VuLzAuMjguMCBcCisgICAgICAgICAgIGNyYXRlOi8vY3JhdGVz
LmlvL2NjLzEuMi4xNiBcCisgICAgICAgICAgIGNyYXRlOi8vY3JhdGVzLmlvL2NmYi8wLjEwLjAg
XAorICAgICAgICAgICBjcmF0ZTovL2NyYXRlcy5pby9jZmctaWYvMS4wLjAgXAorICAgICAgICAg
ICBjcmF0ZTovL2NyYXRlcy5pby9jaGFyc2V0LzAuMS41IFwKKyAgICAgICAgICAgY3JhdGU6Ly9j
cmF0ZXMuaW8vY2h1bXNreS8wLjkuMyBcCisgICAgICAgICAgIGNyYXRlOi8vY3JhdGVzLmlvL2Ns
YXAvNC41LjcgXAorICAgICAgICAgICBjcmF0ZTovL2NyYXRlcy5pby9jbGFwX2J1aWxkZXIvNC41
LjcgXAorICAgICAgICAgICBjcmF0ZTovL2NyYXRlcy5pby9jbGFwX2NvbXBsZXRlLzQuNS41IFwK
KyAgICAgICAgICAgY3JhdGU6Ly9jcmF0ZXMuaW8vY2xhcF9jb21wbGV0ZV9jb21tYW5kLzAuNi4x
IFwKKyAgICAgICAgICAgY3JhdGU6Ly9jcmF0ZXMuaW8vY2xhcF9jb21wbGV0ZV9udXNoZWxsLzQu
NS4yIFwKKyAgICAgICAgICAgY3JhdGU6Ly9jcmF0ZXMuaW8vY2xhcF9kZXJpdmUvNC41LjUgXAor
ICAgICAgICAgICBjcmF0ZTovL2NyYXRlcy5pby9jbGFwX2xleC8wLjcuMSBcCisgICAgICAgICAg
IGNyYXRlOi8vY3JhdGVzLmlvL2NsaS10YWJsZS8wLjQuNyBcCisgICAgICAgICAgIGNyYXRlOi8v
Y3JhdGVzLmlvL2NvbG9yY2hvaWNlLzEuMC4xIFwKKyAgICAgICAgICAgY3JhdGU6Ly9jcmF0ZXMu
aW8vY29uZmlncGFyc2VyLzMuMS4wIFwKKyAgICAgICAgICAgY3JhdGU6Ly9jcmF0ZXMuaW8vY29u
c29sZS8wLjE1LjggXAorICAgICAgICAgICBjcmF0ZTovL2NyYXRlcy5pby9jb250ZW50X2luc3Bl
Y3Rvci8wLjIuNCBcCisgICAgICAgICAgIGNyYXRlOi8vY3JhdGVzLmlvL2NvcmUtZm91bmRhdGlv
bi8wLjkuNCBcCisgICAgICAgICAgIGNyYXRlOi8vY3JhdGVzLmlvL2NvcmUtZm91bmRhdGlvbi1z
eXMvMC44LjYgXAorICAgICAgICAgICBjcmF0ZTovL2NyYXRlcy5pby9jcHVmZWF0dXJlcy8wLjIu
MTIgXAorICAgICAgICAgICBjcmF0ZTovL2NyYXRlcy5pby9jcmMvMy4yLjEgXAorICAgICAgICAg
ICBjcmF0ZTovL2NyYXRlcy5pby9jcmMtY2F0YWxvZy8yLjQuMCBcCisgICAgICAgICAgIGNyYXRl
Oi8vY3JhdGVzLmlvL2NyYzMyZmFzdC8xLjQuMiBcCisgICAgICAgICAgIGNyYXRlOi8vY3JhdGVz
LmlvL2Nyb3NzYmVhbS1jaGFubmVsLzAuNS4xNSBcCisgICAgICAgICAgIGNyYXRlOi8vY3JhdGVz
LmlvL2Nyb3NzYmVhbS1kZXF1ZS8wLjguNSBcCisgICAgICAgICAgIGNyYXRlOi8vY3JhdGVzLmlv
L2Nyb3NzYmVhbS1lcG9jaC8wLjkuMTggXAorICAgICAgICAgICBjcmF0ZTovL2NyYXRlcy5pby9j
cm9zc2JlYW0tdXRpbHMvMC44LjIwIFwKKyAgICAgICAgICAgY3JhdGU6Ly9jcmF0ZXMuaW8vY3J5
cHRvLWNvbW1vbi8wLjEuNiBcCisgICAgICAgICAgIGNyYXRlOi8vY3JhdGVzLmlvL2RhdGEtZW5j
b2RpbmcvMi42LjAgXAorICAgICAgICAgICBjcmF0ZTovL2NyYXRlcy5pby9kZXJhbmdlZC8wLjMu
MTEgXAorICAgICAgICAgICBjcmF0ZTovL2NyYXRlcy5pby9kZXJpdmVfYXJiaXRyYXJ5LzEuNC4x
IFwKKyAgICAgICAgICAgY3JhdGU6Ly9jcmF0ZXMuaW8vZGlhbG9ndWVyLzAuMTEuMCBcCisgICAg
ICAgICAgIGNyYXRlOi8vY3JhdGVzLmlvL2RpZmYvMC4xLjEzIFwKKyAgICAgICAgICAgY3JhdGU6
Ly9jcmF0ZXMuaW8vZGlnZXN0LzAuMTAuNyBcCisgICAgICAgICAgIGNyYXRlOi8vY3JhdGVzLmlv
L2RpcnMvNS4wLjEgXAorICAgICAgICAgICBjcmF0ZTovL2NyYXRlcy5pby9kaXJzLXN5cy8wLjQu
MSBcCisgICAgICAgICAgIGNyYXRlOi8vY3JhdGVzLmlvL2Rpc3BsYXlkb2MvMC4yLjUgXAorICAg
ICAgICAgICBjcmF0ZTovL2NyYXRlcy5pby9kaXNzaW1pbGFyLzEuMC45IFwKKyAgICAgICAgICAg
Y3JhdGU6Ly9jcmF0ZXMuaW8vZHVuY2UvMS4wLjUgXAorICAgICAgICAgICBjcmF0ZTovL2NyYXRl
cy5pby9keW4tY2xvbmUvMS4wLjE3IFwKKyAgICAgICAgICAgY3JhdGU6Ly9jcmF0ZXMuaW8vZWl0
aGVyLzEuMTMuMCBcCisgICAgICAgICAgIGNyYXRlOi8vY3JhdGVzLmlvL2VuY29kZV91bmljb2Rl
LzAuMy42IFwKKyAgICAgICAgICAgY3JhdGU6Ly9jcmF0ZXMuaW8vZW5jb2RpbmdfcnMvMC44LjM0
IFwKKyAgICAgICAgICAgY3JhdGU6Ly9jcmF0ZXMuaW8vZXF1aXZhbGVudC8xLjAuMSBcCisgICAg
ICAgICAgIGNyYXRlOi8vY3JhdGVzLmlvL2Vycm5vLzAuMy45IFwKKyAgICAgICAgICAgY3JhdGU6
Ly9jcmF0ZXMuaW8vZXhwZWN0LXRlc3QvMS41LjAgXAorICAgICAgICAgICBjcmF0ZTovL2NyYXRl
cy5pby9mYXN0cmFuZC8yLjEuMCBcCisgICAgICAgICAgIGNyYXRlOi8vY3JhdGVzLmlvL2ZhdC1t
YWNoby8wLjQuOSBcCisgICAgICAgICAgIGNyYXRlOi8vY3JhdGVzLmlvL2ZpbGV0aW1lLzAuMi4y
MyBcCisgICAgICAgICAgIGNyYXRlOi8vY3JhdGVzLmlvL2ZsYXRlMi8xLjAuMzMgXAorICAgICAg
ICAgICBjcmF0ZTovL2NyYXRlcy5pby9mbnYvMS4wLjcgXAorICAgICAgICAgICBjcmF0ZTovL2Ny
YXRlcy5pby9mb3JlaWduLXR5cGVzLzAuMy4yIFwKKyAgICAgICAgICAgY3JhdGU6Ly9jcmF0ZXMu
aW8vZm9yZWlnbi10eXBlcy1zaGFyZWQvMC4xLjEgXAorICAgICAgICAgICBjcmF0ZTovL2NyYXRl
cy5pby9mb3JtX3VybGVuY29kZWQvMS4yLjEgXAorICAgICAgICAgICBjcmF0ZTovL2NyYXRlcy5p
by9mcy1lcnIvMy4wLjAgXAorICAgICAgICAgICBjcmF0ZTovL2NyYXRlcy5pby9mczQvMC4xMi4w
IFwKKyAgICAgICAgICAgY3JhdGU6Ly9jcmF0ZXMuaW8vZnV0dXJlcy8wLjMuMzAgXAorICAgICAg
ICAgICBjcmF0ZTovL2NyYXRlcy5pby9mdXR1cmVzLWNoYW5uZWwvMC4zLjMxIFwKKyAgICAgICAg
ICAgY3JhdGU6Ly9jcmF0ZXMuaW8vZnV0dXJlcy1jb3JlLzAuMy4zMSBcCisgICAgICAgICAgIGNy
YXRlOi8vY3JhdGVzLmlvL2Z1dHVyZXMtZXhlY3V0b3IvMC4zLjMwIFwKKyAgICAgICAgICAgY3Jh
dGU6Ly9jcmF0ZXMuaW8vZnV0dXJlcy1pby8wLjMuMzEgXAorICAgICAgICAgICBjcmF0ZTovL2Ny
YXRlcy5pby9mdXR1cmVzLW1hY3JvLzAuMy4zMSBcCisgICAgICAgICAgIGNyYXRlOi8vY3JhdGVz
LmlvL2Z1dHVyZXMtc2luay8wLjMuMzEgXAorICAgICAgICAgICBjcmF0ZTovL2NyYXRlcy5pby9m
dXR1cmVzLXRhc2svMC4zLjMxIFwKKyAgICAgICAgICAgY3JhdGU6Ly9jcmF0ZXMuaW8vZnV0dXJl
cy10aW1lci8zLjAuMyBcCisgICAgICAgICAgIGNyYXRlOi8vY3JhdGVzLmlvL2Z1dHVyZXMtdXRp
bC8wLjMuMzEgXAorICAgICAgICAgICBjcmF0ZTovL2NyYXRlcy5pby9nZW5lcmljLWFycmF5LzAu
MTQuNyBcCisgICAgICAgICAgIGNyYXRlOi8vY3JhdGVzLmlvL2dldHJhbmRvbS8wLjIuMTUgXAor
ICAgICAgICAgICBjcmF0ZTovL2NyYXRlcy5pby9nbG9iLzAuMy4xIFwKKyAgICAgICAgICAgY3Jh
dGU6Ly9jcmF0ZXMuaW8vZ2xvYnNldC8wLjQuMTUgXAorICAgICAgICAgICBjcmF0ZTovL2NyYXRl
cy5pby9nb2JsaW4vMC45LjIgXAorICAgICAgICAgICBjcmF0ZTovL2NyYXRlcy5pby9oYXNoYnJv
d24vMC4xNC41IFwKKyAgICAgICAgICAgY3JhdGU6Ly9jcmF0ZXMuaW8vaGFzaGJyb3duLzAuMTUu
MiBcCisgICAgICAgICAgIGNyYXRlOi8vY3JhdGVzLmlvL2hlY2svMC40LjEgXAorICAgICAgICAg
ICBjcmF0ZTovL2NyYXRlcy5pby9oZWNrLzAuNS4wIFwKKyAgICAgICAgICAgY3JhdGU6Ly9jcmF0
ZXMuaW8vaG9tZS8wLjUuOSBcCisgICAgICAgICAgIGNyYXRlOi8vY3JhdGVzLmlvL2h1bWFudGlt
ZS8yLjEuMCBcCisgICAgICAgICAgIGNyYXRlOi8vY3JhdGVzLmlvL2h1bWFudGltZS1zZXJkZS8x
LjEuMSBcCisgICAgICAgICAgIGNyYXRlOi8vY3JhdGVzLmlvL2ljdV9jb2xsZWN0aW9ucy8xLjUu
MCBcCisgICAgICAgICAgIGNyYXRlOi8vY3JhdGVzLmlvL2ljdV9sb2NpZC8xLjUuMCBcCisgICAg
ICAgICAgIGNyYXRlOi8vY3JhdGVzLmlvL2ljdV9sb2NpZF90cmFuc2Zvcm0vMS41LjAgXAorICAg
ICAgICAgICBjcmF0ZTovL2NyYXRlcy5pby9pY3VfbG9jaWRfdHJhbnNmb3JtX2RhdGEvMS41LjAg
XAorICAgICAgICAgICBjcmF0ZTovL2NyYXRlcy5pby9pY3Vfbm9ybWFsaXplci8xLjUuMCBcCisg
ICAgICAgICAgIGNyYXRlOi8vY3JhdGVzLmlvL2ljdV9ub3JtYWxpemVyX2RhdGEvMS41LjAgXAor
ICAgICAgICAgICBjcmF0ZTovL2NyYXRlcy5pby9pY3VfcHJvcGVydGllcy8xLjUuMSBcCisgICAg
ICAgICAgIGNyYXRlOi8vY3JhdGVzLmlvL2ljdV9wcm9wZXJ0aWVzX2RhdGEvMS41LjAgXAorICAg
ICAgICAgICBjcmF0ZTovL2NyYXRlcy5pby9pY3VfcHJvdmlkZXIvMS41LjAgXAorICAgICAgICAg
ICBjcmF0ZTovL2NyYXRlcy5pby9pY3VfcHJvdmlkZXJfbWFjcm9zLzEuNS4wIFwKKyAgICAgICAg
ICAgY3JhdGU6Ly9jcmF0ZXMuaW8vaWRuYS8xLjAuMyBcCisgICAgICAgICAgIGNyYXRlOi8vY3Jh
dGVzLmlvL2lkbmFfYWRhcHRlci8xLjIuMCBcCisgICAgICAgICAgIGNyYXRlOi8vY3JhdGVzLmlv
L2lnbm9yZS8wLjQuMjMgXAorICAgICAgICAgICBjcmF0ZTovL2NyYXRlcy5pby9pbmRleG1hcC8y
LjYuMCBcCisgICAgICAgICAgIGNyYXRlOi8vY3JhdGVzLmlvL2luZGljYXRpZi8wLjE3LjkgXAor
ICAgICAgICAgICBjcmF0ZTovL2NyYXRlcy5pby9pbmRvYy8yLjAuNSBcCisgICAgICAgICAgIGNy
YXRlOi8vY3JhdGVzLmlvL2lzX3Rlcm1pbmFsX3BvbHlmaWxsLzEuNzAuMCBcCisgICAgICAgICAg
IGNyYXRlOi8vY3JhdGVzLmlvL2l0ZXJ0b29scy8wLjEyLjEgXAorICAgICAgICAgICBjcmF0ZTov
L2NyYXRlcy5pby9pdGVydG9vbHMvMC4xMy4wIFwKKyAgICAgICAgICAgY3JhdGU6Ly9jcmF0ZXMu
aW8vaXRvYS8xLjAuMTEgXAorICAgICAgICAgICBjcmF0ZTovL2NyYXRlcy5pby9qcy1zeXMvMC4z
LjczIFwKKyAgICAgICAgICAgY3JhdGU6Ly9jcmF0ZXMuaW8va2V5cmluZy8yLjMuMyBcCisgICAg
ICAgICAgIGNyYXRlOi8vY3JhdGVzLmlvL2xhenlfc3RhdGljLzEuNC4wIFwKKyAgICAgICAgICAg
Y3JhdGU6Ly9jcmF0ZXMuaW8vbGRkdHJlZS8wLjMuNyBcCisgICAgICAgICAgIGNyYXRlOi8vY3Jh
dGVzLmlvL2xpYmMvMC4yLjE2NyBcCisgICAgICAgICAgIGNyYXRlOi8vY3JhdGVzLmlvL2xpYm1p
bWFsbG9jLXN5cy8wLjEuMzkgXAorICAgICAgICAgICBjcmF0ZTovL2NyYXRlcy5pby9saWJyZWRv
eC8wLjEuMyBcCisgICAgICAgICAgIGNyYXRlOi8vY3JhdGVzLmlvL2xpbnV4LWtleXV0aWxzLzAu
Mi40IFwKKyAgICAgICAgICAgY3JhdGU6Ly9jcmF0ZXMuaW8vbGludXgtcmF3LXN5cy8wLjQuMTQg
XAorICAgICAgICAgICBjcmF0ZTovL2NyYXRlcy5pby9saXRlbWFwLzAuNy4zIFwKKyAgICAgICAg
ICAgY3JhdGU6Ly9jcmF0ZXMuaW8vbG9ja19hcGkvMC40LjEyIFwKKyAgICAgICAgICAgY3JhdGU6
Ly9jcmF0ZXMuaW8vbG9ja2ZyZWUtb2JqZWN0LXBvb2wvMC4xLjYgXAorICAgICAgICAgICBjcmF0
ZTovL2NyYXRlcy5pby9sb2cvMC40LjIyIFwKKyAgICAgICAgICAgY3JhdGU6Ly9jcmF0ZXMuaW8v
bHptYS1zeXMvMC4xLjIwIFwKKyAgICAgICAgICAgY3JhdGU6Ly9jcmF0ZXMuaW8vbHp4ZC8wLjIu
NSBcCisgICAgICAgICAgIGNyYXRlOi8vY3JhdGVzLmlvL21haWxwYXJzZS8wLjE1LjAgXAorICAg
ICAgICAgICBjcmF0ZTovL2NyYXRlcy5pby9tYXRjaGVycy8wLjEuMCBcCisgICAgICAgICAgIGNy
YXRlOi8vY3JhdGVzLmlvL21lbWNoci8yLjcuNCBcCisgICAgICAgICAgIGNyYXRlOi8vY3JhdGVz
LmlvL21pbWFsbG9jLzAuMS40MyBcCisgICAgICAgICAgIGNyYXRlOi8vY3JhdGVzLmlvL21pbWUv
MC4zLjE3IFwKKyAgICAgICAgICAgY3JhdGU6Ly9jcmF0ZXMuaW8vbWltZV9ndWVzcy8yLjAuNCBc
CisgICAgICAgICAgIGNyYXRlOi8vY3JhdGVzLmlvL21pbmlqaW5qYS8yLjUuMCBcCisgICAgICAg
ICAgIGNyYXRlOi8vY3JhdGVzLmlvL21pbmltYWwtbGV4aWNhbC8wLjIuMSBcCisgICAgICAgICAg
IGNyYXRlOi8vY3JhdGVzLmlvL21pbml6X294aWRlLzAuOC4wIFwKKyAgICAgICAgICAgY3JhdGU6
Ly9jcmF0ZXMuaW8vbXNpLzAuOC4wIFwKKyAgICAgICAgICAgY3JhdGU6Ly9jcmF0ZXMuaW8vbXVs
dGlwYXJ0LzAuMTguMCBcCisgICAgICAgICAgIGNyYXRlOi8vY3JhdGVzLmlvL25hdGl2ZS10bHMv
MC4yLjEyIFwKKyAgICAgICAgICAgY3JhdGU6Ly9jcmF0ZXMuaW8vbm9tLzcuMS4zIFwKKyAgICAg
ICAgICAgY3JhdGU6Ly9jcmF0ZXMuaW8vbm9ybWFsaXplLWxpbmUtZW5kaW5ncy8wLjMuMCBcCisg
ICAgICAgICAgIGNyYXRlOi8vY3JhdGVzLmlvL25vcm1wYXRoLzEuMi4wIFwKKyAgICAgICAgICAg
Y3JhdGU6Ly9jcmF0ZXMuaW8vbnUtYW5zaS10ZXJtLzAuNDYuMCBcCisgICAgICAgICAgIGNyYXRl
Oi8vY3JhdGVzLmlvL251bS1jb252LzAuMS4wIFwKKyAgICAgICAgICAgY3JhdGU6Ly9jcmF0ZXMu
aW8vbnVtYmVyX3ByZWZpeC8wLjQuMCBcCisgICAgICAgICAgIGNyYXRlOi8vY3JhdGVzLmlvL29u
Y2VfY2VsbC8xLjIwLjIgXAorICAgICAgICAgICBjcmF0ZTovL2NyYXRlcy5pby9vcGVuc3NsLzAu
MTAuNzIgXAorICAgICAgICAgICBjcmF0ZTovL2NyYXRlcy5pby9vcGVuc3NsLW1hY3Jvcy8wLjEu
MSBcCisgICAgICAgICAgIGNyYXRlOi8vY3JhdGVzLmlvL29wZW5zc2wtcHJvYmUvMC4xLjUgXAor
ICAgICAgICAgICBjcmF0ZTovL2NyYXRlcy5pby9vcGVuc3NsLXN5cy8wLjkuMTA3IFwKKyAgICAg
ICAgICAgY3JhdGU6Ly9jcmF0ZXMuaW8vb3B0aW9uLWV4dC8wLjIuMCBcCisgICAgICAgICAgIGNy
YXRlOi8vY3JhdGVzLmlvL29zX3BpcGUvMS4yLjAgXAorICAgICAgICAgICBjcmF0ZTovL2NyYXRl
cy5pby9vdmVybG9hZC8wLjEuMSBcCisgICAgICAgICAgIGNyYXRlOi8vY3JhdGVzLmlvL3Bhcmtp
bmdfbG90LzAuMTIuMyBcCisgICAgICAgICAgIGNyYXRlOi8vY3JhdGVzLmlvL3BhcmtpbmdfbG90
X2NvcmUvMC45LjEwIFwKKyAgICAgICAgICAgY3JhdGU6Ly9jcmF0ZXMuaW8vcGFzdGUvMS4wLjE1
IFwKKyAgICAgICAgICAgY3JhdGU6Ly9jcmF0ZXMuaW8vcGF0aC1zbGFzaC8wLjIuMSBcCisgICAg
ICAgICAgIGNyYXRlOi8vY3JhdGVzLmlvL3BlcDQ0MF9ycy8wLjcuMyBcCisgICAgICAgICAgIGNy
YXRlOi8vY3JhdGVzLmlvL3BlcDUwOF9ycy8wLjkuMiBcCisgICAgICAgICAgIGNyYXRlOi8vY3Jh
dGVzLmlvL3BlcmNlbnQtZW5jb2RpbmcvMi4zLjEgXAorICAgICAgICAgICBjcmF0ZTovL2NyYXRl
cy5pby9waW4tcHJvamVjdC1saXRlLzAuMi4xNSBcCisgICAgICAgICAgIGNyYXRlOi8vY3JhdGVz
LmlvL3Bpbi11dGlscy8wLjEuMCBcCisgICAgICAgICAgIGNyYXRlOi8vY3JhdGVzLmlvL3BrZy1j
b25maWcvMC4zLjMwIFwKKyAgICAgICAgICAgY3JhdGU6Ly9jcmF0ZXMuaW8vcGxhaW4vMC4yLjMg
XAorICAgICAgICAgICBjcmF0ZTovL2NyYXRlcy5pby9wbGF0Zm9ybS1pbmZvLzIuMC4zIFwKKyAg
ICAgICAgICAgY3JhdGU6Ly9jcmF0ZXMuaW8vcG9ydGFibGUtYXRvbWljLzEuNi4wIFwKKyAgICAg
ICAgICAgY3JhdGU6Ly9jcmF0ZXMuaW8vcG93ZXJmbXQvMC4yLjAgXAorICAgICAgICAgICBjcmF0
ZTovL2NyYXRlcy5pby9wcHYtbGl0ZTg2LzAuMi4xNyBcCisgICAgICAgICAgIGNyYXRlOi8vY3Jh
dGVzLmlvL3ByZXR0eV9hc3NlcnRpb25zLzEuNC4xIFwKKyAgICAgICAgICAgY3JhdGU6Ly9jcmF0
ZXMuaW8vcHJvYy1tYWNyby1jcmF0ZS8zLjEuMCBcCisgICAgICAgICAgIGNyYXRlOi8vY3JhdGVz
LmlvL3Byb2MtbWFjcm8yLzEuMC45MiBcCisgICAgICAgICAgIGNyYXRlOi8vY3JhdGVzLmlvL3Bz
bS8wLjEuMjEgXAorICAgICAgICAgICBjcmF0ZTovL2NyYXRlcy5pby9weXByb2plY3QtdG9tbC8w
LjEzLjQgXAorICAgICAgICAgICBjcmF0ZTovL2NyYXRlcy5pby9weXRob24tcGtnaW5mby8wLjYu
NSBcCisgICAgICAgICAgIGNyYXRlOi8vY3JhdGVzLmlvL3F1b3RlLzEuMC4zNyBcCisgICAgICAg
ICAgIGNyYXRlOi8vY3JhdGVzLmlvL3F1b3RlZF9wcmludGFibGUvMC41LjAgXAorICAgICAgICAg
ICBjcmF0ZTovL2NyYXRlcy5pby9yYW5kLzAuOC41IFwKKyAgICAgICAgICAgY3JhdGU6Ly9jcmF0
ZXMuaW8vcmFuZF9jaGFjaGEvMC4zLjEgXAorICAgICAgICAgICBjcmF0ZTovL2NyYXRlcy5pby9y
YW5kX2NvcmUvMC42LjQgXAorICAgICAgICAgICBjcmF0ZTovL2NyYXRlcy5pby9yYXlvbi8xLjEw
LjAgXAorICAgICAgICAgICBjcmF0ZTovL2NyYXRlcy5pby9yYXlvbi1jb3JlLzEuMTIuMSBcCisg
ICAgICAgICAgIGNyYXRlOi8vY3JhdGVzLmlvL3JlZG94X3N5c2NhbGwvMC40LjEgXAorICAgICAg
ICAgICBjcmF0ZTovL2NyYXRlcy5pby9yZWRveF9zeXNjYWxsLzAuNS4xIFwKKyAgICAgICAgICAg
Y3JhdGU6Ly9jcmF0ZXMuaW8vcmVkb3hfdXNlcnMvMC40LjUgXAorICAgICAgICAgICBjcmF0ZTov
L2NyYXRlcy5pby9yZWdleC8xLjExLjEgXAorICAgICAgICAgICBjcmF0ZTovL2NyYXRlcy5pby9y
ZWdleC1hdXRvbWF0YS8wLjEuMTAgXAorICAgICAgICAgICBjcmF0ZTovL2NyYXRlcy5pby9yZWdl
eC1hdXRvbWF0YS8wLjQuOSBcCisgICAgICAgICAgIGNyYXRlOi8vY3JhdGVzLmlvL3JlZ2V4LXN5
bnRheC8wLjYuMjkgXAorICAgICAgICAgICBjcmF0ZTovL2NyYXRlcy5pby9yZWdleC1zeW50YXgv
MC44LjUgXAorICAgICAgICAgICBjcmF0ZTovL2NyYXRlcy5pby9yZWxhdGl2ZS1wYXRoLzEuOS4z
IFwKKyAgICAgICAgICAgY3JhdGU6Ly9jcmF0ZXMuaW8vcmZjMjA0Ny1kZWNvZGVyLzEuMC42IFwK
KyAgICAgICAgICAgY3JhdGU6Ly9jcmF0ZXMuaW8vcmluZy8wLjE3LjEzIFwKKyAgICAgICAgICAg
Y3JhdGU6Ly9jcmF0ZXMuaW8vcnN0ZXN0LzAuMjIuMCBcCisgICAgICAgICAgIGNyYXRlOi8vY3Jh
dGVzLmlvL3JzdGVzdF9tYWNyb3MvMC4yMi4wIFwKKyAgICAgICAgICAgY3JhdGU6Ly9jcmF0ZXMu
aW8vcnVzdGMtaGFzaC8yLjAuMCBcCisgICAgICAgICAgIGNyYXRlOi8vY3JhdGVzLmlvL3J1c3Rj
X3ZlcnNpb24vMC40LjEgXAorICAgICAgICAgICBjcmF0ZTovL2NyYXRlcy5pby9ydXN0ZmxhZ3Mv
MC4xLjYgXAorICAgICAgICAgICBjcmF0ZTovL2NyYXRlcy5pby9ydXN0aXgvMC4zOC40MSBcCisg
ICAgICAgICAgIGNyYXRlOi8vY3JhdGVzLmlvL3J1c3Rscy8wLjIzLjE5IFwKKyAgICAgICAgICAg
Y3JhdGU6Ly9jcmF0ZXMuaW8vcnVzdGxzLXBlbWZpbGUvMi4xLjMgXAorICAgICAgICAgICBjcmF0
ZTovL2NyYXRlcy5pby9ydXN0bHMtcGtpLXR5cGVzLzEuMTAuMCBcCisgICAgICAgICAgIGNyYXRl
Oi8vY3JhdGVzLmlvL3J1c3Rscy13ZWJwa2kvMC4xMDIuOCBcCisgICAgICAgICAgIGNyYXRlOi8v
Y3JhdGVzLmlvL3J1c3R2ZXJzaW9uLzEuMC4xOCBcCisgICAgICAgICAgIGNyYXRlOi8vY3JhdGVz
LmlvL3J5dS8xLjAuMTggXAorICAgICAgICAgICBjcmF0ZTovL2NyYXRlcy5pby9zYW1lLWZpbGUv
MS4wLjYgXAorICAgICAgICAgICBjcmF0ZTovL2NyYXRlcy5pby9zY2hhbm5lbC8wLjEuMjMgXAor
ICAgICAgICAgICBjcmF0ZTovL2NyYXRlcy5pby9zY2hlbWFycy8wLjguMjEgXAorICAgICAgICAg
ICBjcmF0ZTovL2NyYXRlcy5pby9zY2hlbWFyc19kZXJpdmUvMC44LjIxIFwKKyAgICAgICAgICAg
Y3JhdGU6Ly9jcmF0ZXMuaW8vc2NvcGVndWFyZC8xLjIuMCBcCisgICAgICAgICAgIGNyYXRlOi8v
Y3JhdGVzLmlvL3Njcm9sbC8wLjEyLjAgXAorICAgICAgICAgICBjcmF0ZTovL2NyYXRlcy5pby9z
Y3JvbGxfZGVyaXZlLzAuMTIuMCBcCisgICAgICAgICAgIGNyYXRlOi8vY3JhdGVzLmlvL3NlY3Vy
aXR5LWZyYW1ld29yay8yLjExLjAgXAorICAgICAgICAgICBjcmF0ZTovL2NyYXRlcy5pby9zZWN1
cml0eS1mcmFtZXdvcmstc3lzLzIuMTEuMCBcCisgICAgICAgICAgIGNyYXRlOi8vY3JhdGVzLmlv
L3NlbXZlci8xLjAuMjMgXAorICAgICAgICAgICBjcmF0ZTovL2NyYXRlcy5pby9zZXJkZS8xLjAu
MjE3IFwKKyAgICAgICAgICAgY3JhdGU6Ly9jcmF0ZXMuaW8vc2VyZGVfZGVyaXZlLzEuMC4yMTcg
XAorICAgICAgICAgICBjcmF0ZTovL2NyYXRlcy5pby9zZXJkZV9kZXJpdmVfaW50ZXJuYWxzLzAu
MjkuMSBcCisgICAgICAgICAgIGNyYXRlOi8vY3JhdGVzLmlvL3NlcmRlX2pzb24vMS4wLjEzNSBc
CisgICAgICAgICAgIGNyYXRlOi8vY3JhdGVzLmlvL3NlcmRlX3NwYW5uZWQvMC42LjggXAorICAg
ICAgICAgICBjcmF0ZTovL2NyYXRlcy5pby9zaGEyLzAuMTAuOCBcCisgICAgICAgICAgIGNyYXRl
Oi8vY3JhdGVzLmlvL3NoYXJkZWQtc2xhYi8wLjEuNyBcCisgICAgICAgICAgIGNyYXRlOi8vY3Jh
dGVzLmlvL3NoZWxsLXdvcmRzLzEuMS4wIFwKKyAgICAgICAgICAgY3JhdGU6Ly9jcmF0ZXMuaW8v
c2hsZXgvMS4zLjAgXAorICAgICAgICAgICBjcmF0ZTovL2NyYXRlcy5pby9zaW1kLWFkbGVyMzIv
MC4zLjcgXAorICAgICAgICAgICBjcmF0ZTovL2NyYXRlcy5pby9zaW1pbGFyLzIuNS4wIFwKKyAg
ICAgICAgICAgY3JhdGU6Ly9jcmF0ZXMuaW8vc2xhYi8wLjQuOSBcCisgICAgICAgICAgIGNyYXRl
Oi8vY3JhdGVzLmlvL3NtYWxsdmVjLzEuMTMuMiBcCisgICAgICAgICAgIGNyYXRlOi8vY3JhdGVz
LmlvL3NtYXdrLzAuMy4yIFwKKyAgICAgICAgICAgY3JhdGU6Ly9jcmF0ZXMuaW8vc25hcGJveC8w
LjYuMTYgXAorICAgICAgICAgICBjcmF0ZTovL2NyYXRlcy5pby9zbmFwYm94LW1hY3Jvcy8wLjMu
MTAgXAorICAgICAgICAgICBjcmF0ZTovL2NyYXRlcy5pby9zb2Nrcy8wLjMuNCBcCisgICAgICAg
ICAgIGNyYXRlOi8vY3JhdGVzLmlvL3N0YWJsZV9kZXJlZl90cmFpdC8xLjIuMCBcCisgICAgICAg
ICAgIGNyYXRlOi8vY3JhdGVzLmlvL3N0YWNrZXIvMC4xLjE1IFwKKyAgICAgICAgICAgY3JhdGU6
Ly9jcmF0ZXMuaW8vc3RhdGljX2Fzc2VydGlvbnMvMS4xLjAgXAorICAgICAgICAgICBjcmF0ZTov
L2NyYXRlcy5pby9zdHJzaW0vMC4xMS4xIFwKKyAgICAgICAgICAgY3JhdGU6Ly9jcmF0ZXMuaW8v
c3VidGxlLzIuNS4wIFwKKyAgICAgICAgICAgY3JhdGU6Ly9jcmF0ZXMuaW8vc3luLzIuMC45MCBc
CisgICAgICAgICAgIGNyYXRlOi8vY3JhdGVzLmlvL3N5bnN0cnVjdHVyZS8wLjEzLjEgXAorICAg
ICAgICAgICBjcmF0ZTovL2NyYXRlcy5pby90YXIvMC40LjQzIFwKKyAgICAgICAgICAgY3JhdGU6
Ly9jcmF0ZXMuaW8vdGFyZ2V0LWxleGljb24vMC4xMy4xIFwKKyAgICAgICAgICAgY3JhdGU6Ly9j
cmF0ZXMuaW8vdGVtcGZpbGUvMy4xMS4wIFwKKyAgICAgICAgICAgY3JhdGU6Ly9jcmF0ZXMuaW8v
dGVybWNvbG9yLzEuNC4xIFwKKyAgICAgICAgICAgY3JhdGU6Ly9jcmF0ZXMuaW8vdGVybWluYWxf
c2l6ZS8wLjMuMCBcCisgICAgICAgICAgIGNyYXRlOi8vY3JhdGVzLmlvL3RleHR3cmFwLzAuMTYu
MSBcCisgICAgICAgICAgIGNyYXRlOi8vY3JhdGVzLmlvL3RoaXNlcnJvci8xLjAuNjkgXAorICAg
ICAgICAgICBjcmF0ZTovL2NyYXRlcy5pby90aGlzZXJyb3IvMi4wLjMgXAorICAgICAgICAgICBj
cmF0ZTovL2NyYXRlcy5pby90aGlzZXJyb3ItaW1wbC8xLjAuNjkgXAorICAgICAgICAgICBjcmF0
ZTovL2NyYXRlcy5pby90aGlzZXJyb3ItaW1wbC8yLjAuMyBcCisgICAgICAgICAgIGNyYXRlOi8v
Y3JhdGVzLmlvL3RocmVhZF9sb2NhbC8xLjEuOCBcCisgICAgICAgICAgIGNyYXRlOi8vY3JhdGVz
LmlvL3RpbWUvMC4zLjM2IFwKKyAgICAgICAgICAgY3JhdGU6Ly9jcmF0ZXMuaW8vdGltZS1jb3Jl
LzAuMS4yIFwKKyAgICAgICAgICAgY3JhdGU6Ly9jcmF0ZXMuaW8vdGltZS1tYWNyb3MvMC4yLjE4
IFwKKyAgICAgICAgICAgY3JhdGU6Ly9jcmF0ZXMuaW8vdGlueXN0ci8wLjcuNiBcCisgICAgICAg
ICAgIGNyYXRlOi8vY3JhdGVzLmlvL3RvbWwvMC44LjE5IFwKKyAgICAgICAgICAgY3JhdGU6Ly9j
cmF0ZXMuaW8vdG9tbF9kYXRldGltZS8wLjYuOCBcCisgICAgICAgICAgIGNyYXRlOi8vY3JhdGVz
LmlvL3RvbWxfZWRpdC8wLjIxLjEgXAorICAgICAgICAgICBjcmF0ZTovL2NyYXRlcy5pby90b21s
X2VkaXQvMC4yMi4yMiBcCisgICAgICAgICAgIGNyYXRlOi8vY3JhdGVzLmlvL3RyYWNpbmcvMC4x
LjQxIFwKKyAgICAgICAgICAgY3JhdGU6Ly9jcmF0ZXMuaW8vdHJhY2luZy1hdHRyaWJ1dGVzLzAu
MS4yOCBcCisgICAgICAgICAgIGNyYXRlOi8vY3JhdGVzLmlvL3RyYWNpbmctY29yZS8wLjEuMzMg
XAorICAgICAgICAgICBjcmF0ZTovL2NyYXRlcy5pby90cmFjaW5nLWxvZy8wLjIuMCBcCisgICAg
ICAgICAgIGNyYXRlOi8vY3JhdGVzLmlvL3RyYWNpbmctc2VyZGUvMC4yLjAgXAorICAgICAgICAg
ICBjcmF0ZTovL2NyYXRlcy5pby90cmFjaW5nLXN1YnNjcmliZXIvMC4zLjE5IFwKKyAgICAgICAg
ICAgY3JhdGU6Ly9jcmF0ZXMuaW8vdHJ5Y21kLzAuMTUuNiBcCisgICAgICAgICAgIGNyYXRlOi8v
Y3JhdGVzLmlvL3R3b3gtaGFzaC8xLjYuMyBcCisgICAgICAgICAgIGNyYXRlOi8vY3JhdGVzLmlv
L3R5cGVudW0vMS4xNy4wIFwKKyAgICAgICAgICAgY3JhdGU6Ly9jcmF0ZXMuaW8vdW5pY2FzZS8y
LjcuMCBcCisgICAgICAgICAgIGNyYXRlOi8vY3JhdGVzLmlvL3VuaWNvZGUtaWRlbnQvMS4wLjEy
IFwKKyAgICAgICAgICAgY3JhdGU6Ly9jcmF0ZXMuaW8vdW5pY29kZS1saW5lYnJlYWsvMC4xLjUg
XAorICAgICAgICAgICBjcmF0ZTovL2NyYXRlcy5pby91bmljb2RlLXdpZHRoLzAuMS4xMyBcCisg
ICAgICAgICAgIGNyYXRlOi8vY3JhdGVzLmlvL3VuaWNvZGUtd2lkdGgvMC4yLjAgXAorICAgICAg
ICAgICBjcmF0ZTovL2NyYXRlcy5pby91bmljb2RlLXhpZC8wLjIuNiBcCisgICAgICAgICAgIGNy
YXRlOi8vY3JhdGVzLmlvL3Vuc2Nhbm55LzAuMS4wIFwKKyAgICAgICAgICAgY3JhdGU6Ly9jcmF0
ZXMuaW8vdW50cnVzdGVkLzAuOS4wIFwKKyAgICAgICAgICAgY3JhdGU6Ly9jcmF0ZXMuaW8vdXJl
cS8yLjExLjAgXAorICAgICAgICAgICBjcmF0ZTovL2NyYXRlcy5pby91cmwvMi41LjQgXAorICAg
ICAgICAgICBjcmF0ZTovL2NyYXRlcy5pby91cmxlbmNvZGluZy8yLjEuMyBcCisgICAgICAgICAg
IGNyYXRlOi8vY3JhdGVzLmlvL3V0ZjE2X2l0ZXIvMS4wLjUgXAorICAgICAgICAgICBjcmF0ZTov
L2NyYXRlcy5pby91dGY4X2l0ZXIvMS4wLjQgXAorICAgICAgICAgICBjcmF0ZTovL2NyYXRlcy5p
by91dGY4cGFyc2UvMC4yLjIgXAorICAgICAgICAgICBjcmF0ZTovL2NyYXRlcy5pby91dWlkLzEu
OC4wIFwKKyAgICAgICAgICAgY3JhdGU6Ly9jcmF0ZXMuaW8vdmFsdWFibGUvMC4xLjAgXAorICAg
ICAgICAgICBjcmF0ZTovL2NyYXRlcy5pby92Y3BrZy8wLjIuMTUgXAorICAgICAgICAgICBjcmF0
ZTovL2NyYXRlcy5pby92ZXJzaW9uLXJhbmdlcy8wLjEuMSBcCisgICAgICAgICAgIGNyYXRlOi8v
Y3JhdGVzLmlvL3ZlcnNpb25fY2hlY2svMC45LjQgXAorICAgICAgICAgICBjcmF0ZTovL2NyYXRl
cy5pby92ZXJzaW9ucy82LjIuMCBcCisgICAgICAgICAgIGNyYXRlOi8vY3JhdGVzLmlvL3dhaXQt
dGltZW91dC8wLjIuMCBcCisgICAgICAgICAgIGNyYXRlOi8vY3JhdGVzLmlvL3dhbGtkaXIvMi41
LjAgXAorICAgICAgICAgICBjcmF0ZTovL2NyYXRlcy5pby93YXNpLzAuMTEuMCt3YXNpLXNuYXBz
aG90LXByZXZpZXcxIFwKKyAgICAgICAgICAgY3JhdGU6Ly9jcmF0ZXMuaW8vd2FzbS1iaW5kZ2Vu
LzAuMi45NiBcCisgICAgICAgICAgIGNyYXRlOi8vY3JhdGVzLmlvL3dhc20tYmluZGdlbi1iYWNr
ZW5kLzAuMi45NiBcCisgICAgICAgICAgIGNyYXRlOi8vY3JhdGVzLmlvL3dhc20tYmluZGdlbi1t
YWNyby8wLjIuOTYgXAorICAgICAgICAgICBjcmF0ZTovL2NyYXRlcy5pby93YXNtLWJpbmRnZW4t
bWFjcm8tc3VwcG9ydC8wLjIuOTYgXAorICAgICAgICAgICBjcmF0ZTovL2NyYXRlcy5pby93YXNt
LWJpbmRnZW4tc2hhcmVkLzAuMi45NiBcCisgICAgICAgICAgIGNyYXRlOi8vY3JhdGVzLmlvL3dl
Yi10aW1lLzEuMS4wIFwKKyAgICAgICAgICAgY3JhdGU6Ly9jcmF0ZXMuaW8vd2VicGtpLXJvb3Rz
LzAuMjYuMiBcCisgICAgICAgICAgIGNyYXRlOi8vY3JhdGVzLmlvL3doaWNoLzcuMC4wIFwKKyAg
ICAgICAgICAgY3JhdGU6Ly9jcmF0ZXMuaW8vd2lsZC8yLjIuMSBcCisgICAgICAgICAgIGNyYXRl
Oi8vY3JhdGVzLmlvL3dpbmFwaS8wLjMuOSBcCisgICAgICAgICAgIGNyYXRlOi8vY3JhdGVzLmlv
L3dpbmFwaS1pNjg2LXBjLXdpbmRvd3MtZ251LzAuNC4wIFwKKyAgICAgICAgICAgY3JhdGU6Ly9j
cmF0ZXMuaW8vd2luYXBpLXV0aWwvMC4xLjggXAorICAgICAgICAgICBjcmF0ZTovL2NyYXRlcy5p
by93aW5hcGkteDg2XzY0LXBjLXdpbmRvd3MtZ251LzAuNC4wIFwKKyAgICAgICAgICAgY3JhdGU6
Ly9jcmF0ZXMuaW8vd2luZG93cy1zeXMvMC40OC4wIFwKKyAgICAgICAgICAgY3JhdGU6Ly9jcmF0
ZXMuaW8vd2luZG93cy1zeXMvMC41Mi4wIFwKKyAgICAgICAgICAgY3JhdGU6Ly9jcmF0ZXMuaW8v
d2luZG93cy10YXJnZXRzLzAuNDguNSBcCisgICAgICAgICAgIGNyYXRlOi8vY3JhdGVzLmlvL3dp
bmRvd3MtdGFyZ2V0cy8wLjUyLjUgXAorICAgICAgICAgICBjcmF0ZTovL2NyYXRlcy5pby93aW5k
b3dzX2FhcmNoNjRfZ251bGx2bS8wLjQ4LjUgXAorICAgICAgICAgICBjcmF0ZTovL2NyYXRlcy5p
by93aW5kb3dzX2FhcmNoNjRfZ251bGx2bS8wLjUyLjUgXAorICAgICAgICAgICBjcmF0ZTovL2Ny
YXRlcy5pby93aW5kb3dzX2FhcmNoNjRfbXN2Yy8wLjQ4LjUgXAorICAgICAgICAgICBjcmF0ZTov
L2NyYXRlcy5pby93aW5kb3dzX2FhcmNoNjRfbXN2Yy8wLjUyLjUgXAorICAgICAgICAgICBjcmF0
ZTovL2NyYXRlcy5pby93aW5kb3dzX2k2ODZfZ251LzAuNDguNSBcCisgICAgICAgICAgIGNyYXRl
Oi8vY3JhdGVzLmlvL3dpbmRvd3NfaTY4Nl9nbnUvMC41Mi41IFwKKyAgICAgICAgICAgY3JhdGU6
Ly9jcmF0ZXMuaW8vd2luZG93c19pNjg2X2dudWxsdm0vMC41Mi41IFwKKyAgICAgICAgICAgY3Jh
dGU6Ly9jcmF0ZXMuaW8vd2luZG93c19pNjg2X21zdmMvMC40OC41IFwKKyAgICAgICAgICAgY3Jh
dGU6Ly9jcmF0ZXMuaW8vd2luZG93c19pNjg2X21zdmMvMC41Mi41IFwKKyAgICAgICAgICAgY3Jh
dGU6Ly9jcmF0ZXMuaW8vd2luZG93c194ODZfNjRfZ251LzAuNDguNSBcCisgICAgICAgICAgIGNy
YXRlOi8vY3JhdGVzLmlvL3dpbmRvd3NfeDg2XzY0X2dudS8wLjUyLjUgXAorICAgICAgICAgICBj
cmF0ZTovL2NyYXRlcy5pby93aW5kb3dzX3g4Nl82NF9nbnVsbHZtLzAuNDguNSBcCisgICAgICAg
ICAgIGNyYXRlOi8vY3JhdGVzLmlvL3dpbmRvd3NfeDg2XzY0X2dudWxsdm0vMC41Mi41IFwKKyAg
ICAgICAgICAgY3JhdGU6Ly9jcmF0ZXMuaW8vd2luZG93c194ODZfNjRfbXN2Yy8wLjQ4LjUgXAor
ICAgICAgICAgICBjcmF0ZTovL2NyYXRlcy5pby93aW5kb3dzX3g4Nl82NF9tc3ZjLzAuNTIuNSBc
CisgICAgICAgICAgIGNyYXRlOi8vY3JhdGVzLmlvL3dpbm5vdy8wLjUuNDAgXAorICAgICAgICAg
ICBjcmF0ZTovL2NyYXRlcy5pby93aW5ub3cvMC42LjIwIFwKKyAgICAgICAgICAgY3JhdGU6Ly9j
cmF0ZXMuaW8vd2luc2FmZS8wLjAuMTkgXAorICAgICAgICAgICBjcmF0ZTovL2NyYXRlcy5pby93
cml0ZTE2LzEuMC4wIFwKKyAgICAgICAgICAgY3JhdGU6Ly9jcmF0ZXMuaW8vd3JpdGVhYmxlLzAu
NS41IFwKKyAgICAgICAgICAgY3JhdGU6Ly9jcmF0ZXMuaW8veGF0dHIvMS4zLjEgXAorICAgICAg
ICAgICBjcmF0ZTovL2NyYXRlcy5pby94d2luLzAuNi41IFwKKyAgICAgICAgICAgY3JhdGU6Ly9j
cmF0ZXMuaW8veHoyLzAuMS43IFwKKyAgICAgICAgICAgY3JhdGU6Ly9jcmF0ZXMuaW8veWFuc2kv
MS4wLjEgXAorICAgICAgICAgICBjcmF0ZTovL2NyYXRlcy5pby95b2tlLzAuNy40IFwKKyAgICAg
ICAgICAgY3JhdGU6Ly9jcmF0ZXMuaW8veW9rZS1kZXJpdmUvMC43LjUgXAorICAgICAgICAgICBj
cmF0ZTovL2NyYXRlcy5pby96ZXJvY29weS8wLjcuMzUgXAorICAgICAgICAgICBjcmF0ZTovL2Ny
YXRlcy5pby96ZXJvY29weS1kZXJpdmUvMC43LjM1IFwKKyAgICAgICAgICAgY3JhdGU6Ly9jcmF0
ZXMuaW8vemVyb2Zyb20vMC4xLjQgXAorICAgICAgICAgICBjcmF0ZTovL2NyYXRlcy5pby96ZXJv
ZnJvbS1kZXJpdmUvMC4xLjUgXAorICAgICAgICAgICBjcmF0ZTovL2NyYXRlcy5pby96ZXJvaXpl
LzEuOC4xIFwKKyAgICAgICAgICAgY3JhdGU6Ly9jcmF0ZXMuaW8vemVyb3ZlYy8wLjEwLjQgXAor
ICAgICAgICAgICBjcmF0ZTovL2NyYXRlcy5pby96ZXJvdmVjLWRlcml2ZS8wLjEwLjMgXAorICAg
ICAgICAgICBjcmF0ZTovL2NyYXRlcy5pby96aXAvMi4zLjAgXAorICAgICAgICAgICBjcmF0ZTov
L2NyYXRlcy5pby96b3BmbGkvMC44LjEgXAorICAgICAgICAgICAiCitTUkNfVVJJW3NoYTI1NnN1
bV0gPSAiMGUwZGMyZTBiZmFhMmUxYmQyMzhlMDIzNmNmOGEyYjdlMjI1MGNjYWEyOWMxYWE4ZDBl
NjFmYTY2NGIwMjg5ZCIKKworUyA9ICIke1dPUktESVJ9L21hdHVyaW4tJHtQVn0iCisKK0NGTEFH
UyArPSAiLWZmaWxlLXByZWZpeC1tYXA9JHtDQVJHT19IT01FfT0ke1RBUkdFVF9EQkdTUkNfRElS
fS9jYXJnb19ob21lIgorCitERVBFTkRTICs9ICJcCisgICAgcHl0aG9uMy1zZXR1cHRvb2xzLXJ1
c3QtbmF0aXZlIFwKKyAgICBweXRob24zLXNlbWFudGljLXZlcnNpb24tbmF0aXZlIFwKKyAgICBw
eXRob24zLXNldHVwdG9vbHMtcnVzdCBcCisiCisKK3JlcXVpcmUgJHtCUE59LWNyYXRlcy5pbmMK
KworaW5oZXJpdCBweXBpIGNhcmdvLXVwZGF0ZS1yZWNpcGUtY3JhdGVzIHB5dGhvbl9weW8zIHB5
dGhvbl9zZXR1cHRvb2xzX2J1aWxkX21ldGEKKworZG9fY29uZmlndXJlKCkgeworICAgIHB5dGhv
bl9weW8zX2RvX2NvbmZpZ3VyZQorICAgIGNhcmdvX2NvbW1vbl9kb19jb25maWd1cmUKKyAgICBw
eXRob25fcGVwNTE3X2RvX2NvbmZpZ3VyZQorfQorCitSREVQRU5EUzoke1BOfSArPSAiXAorICAg
IGNhcmdvIFwKKyAgICBweXRob24zLWpzb24gXAorICAgIHJ1c3QgXAorIgorCitSUkVDT01NRU5E
Uzoke1BOfSArPSAiXAorICAgIHB5dGhvbjMtZW5zdXJlcGlwIFwKKyAgICBweXRob24zLXBpcCBc
CisgICAgcHl0aG9uMy12ZW52IFwKKyIKKworQkJDTEFTU0VYVEVORCA9ICJuYXRpdmUgbmF0aXZl
c2RrIgotLSAKMi40Ny4xCgo=

--===============6295717561839837911==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: attachment; filename="buildhistory-diff-full.txt"

packages/core2-64-poky-linux/python3-maturin: PV changed from "1.8.3" to "1.8.6"
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
packages/core2-64-poky-linux/python3-maturin: PKGV changed from 1.8.3 [default] to 1.8.6 [default]
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
packages/core2-64-poky-linux/python3-maturin/python3-maturin: PKGSIZE changed from 14249615 to 14308092 (+0%)
packages/core2-64-poky-linux/python3-maturin/python3-maturin: FILELIST: directory renamed /usr/lib/python3.13/site-packages/maturin-1.8.3.dist-info -> /usr/lib/python3.13/site-packages/maturin-1.8.6.dist-info, added "/usr/lib/python3.13/site-packages/maturin/bootstrap.py /usr/lib/python3.13/site-packages/maturin/__pycache__/bootstrap.cpython-313.pyc"
packages/core2-64-poky-linux/python3-maturin/python3-maturin: PKGV changed from 1.8.3 [default] to 1.8.6 [default]
Changes to packages/core2-64-poky-linux/python3-maturin (sysroot):
  /usr/lib/python3.13/site-packages/maturin-1.8.3.dist-info moved to /usr/lib/python3.13/site-packages/maturin-1.8.6.dist-info
  /usr/lib/python3.13/site-packages/maturin/bootstrap.py was added
  /usr/lib/python3.13/site-packages/maturin/__pycache__/bootstrap.cpython-313.pyc was added

--===============6295717561839837911==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: attachment; filename="buildhistory-diff.txt"

packages/core2-64-poky-linux/python3-maturin/python3-maturin: FILELIST: directory renamed /usr/lib/python3.13/site-packages/maturin-1.8.3.dist-info -> /usr/lib/python3.13/site-packages/maturin-1.8.6.dist-info, added "/usr/lib/python3.13/site-packages/maturin/bootstrap.py /usr/lib/python3.13/site-packages/maturin/__pycache__/bootstrap.cpython-313.pyc"
Changes to packages/core2-64-poky-linux/python3-maturin (sysroot):
  /usr/lib/python3.13/site-packages/maturin-1.8.3.dist-info moved to /usr/lib/python3.13/site-packages/maturin-1.8.6.dist-info
  /usr/lib/python3.13/site-packages/maturin/bootstrap.py was added
  /usr/lib/python3.13/site-packages/maturin/__pycache__/bootstrap.cpython-313.pyc was added

--===============6295717561839837911==--

