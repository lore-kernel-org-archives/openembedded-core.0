Return-Path: <alex.kanavin@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 6A038CCA486
	for <webhook@archiver.kernel.org>; Tue,  5 Jul 2022 17:04:00 +0000 (UTC)
Received: from mail-ed1-f52.google.com (mail-ed1-f52.google.com
 [209.85.208.52])
 by mx.groups.io with SMTP id smtpd.web08.86607.1657040631594873007
 for <openembedded-core@lists.openembedded.org>;
 Tue, 05 Jul 2022 10:03:52 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20210112 header.b=fl55nReh;
 spf=pass (domain: gmail.com, ip: 209.85.208.52,
 mailfrom: alex.kanavin@gmail.com)
Received: by mail-ed1-f52.google.com with SMTP id x10so8751772edd.13
        for <openembedded-core@lists.openembedded.org>;
 Tue, 05 Jul 2022 10:03:51 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:content-transfer-encoding;
        bh=RkbNaq/Tx9STCpCS9d5nGRy78nP/FpU3kV+UTCytJMk=;
        b=fl55nRehDR1s6tZhhr9IGUl+8bpF8McWRnFJHaRL1/XixpLlA/+i/hL9Bgavrpz8Vh
         u434ZisuF7jWaOc+dzhnAz5QIwTEJh72xD8cGHXsG6rje4TWGvgBEEX403vxCgftN5A7
         74mhPIiw134epr8+l8/PtWtl2KcLhsiWHrioeZvlEtMP2CeMxJd17m1h5eAIQTUC6NQ/
         8pBKy2tQbNt172kA5Ezu06UFGeDDrYB0JjcXo5XYrvcB1PepCd95GUQYFEDOyxFXpqND
         37LJVLcWn+2x20XxEnKEgTE9QA6/KUgH/lkSa0YRSJ3bwarV/LLJtP+QiMas/pUc1FSK
         0kSQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=RkbNaq/Tx9STCpCS9d5nGRy78nP/FpU3kV+UTCytJMk=;
        b=I9Ng+Fw+h/ffAUOq1zsPmjXvMArppUHcliCIMDNDezuxmwU3se1bto1n/cgBCtMpOY
         cy1xfT/3PW+7tl5igPb9bl+0EHSCJRernJ3Qosxuo8Q0+kj5+/TCsLBcs7ts83nmdSzT
         kmLos+PR5OxF6z+11eBGBAAE/kt3+Lc80qxwzOWsLC0I2d51ERw52oVqNztOSblCL7l7
         Sx8kcBf3Look7XZpdF7LVBAMVDglwgEdnwu86O4P9IIjuLPUi/zTuX8rtzmr+bM82ZN5
         CuM7T3FmnHaYQdpkhcoxgY082rOE0M+hptm/XD4TaSMBP/nX5tlHz4Ng+Sbar5WCMjLU
         X+Gw==
X-Gm-Message-State: AJIora/UK8hkF7G0QvxMSeUch+HJOfg1UK1NSmj6dNDmzDg1NQfgxT4p
	VnuMECT0IlpJ9ECgkzdtH4yUUMjdq2yuOw==
X-Google-Smtp-Source: 
 AGRyM1sbmibMvJtC31Abhpk/s+8boqw3hVv/O7wymw9boiHRaw3GaJSBdU5S8p6HThJTSnc1s5HIJw==
X-Received: by 2002:a05:6402:d0a:b0:437:f9a1:8493 with SMTP id
 eb10-20020a0564020d0a00b00437f9a18493mr43407000edb.226.1657040629281;
        Tue, 05 Jul 2022 10:03:49 -0700 (PDT)
Received: from Zen2.lab.linutronix.de. (drugstore.linutronix.de.
 [80.153.143.164])
        by smtp.gmail.com with ESMTPSA id
 x2-20020a05640225c200b00435651c4a01sm23999886edb.56.2022.07.05.10.03.48
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 05 Jul 2022 10:03:48 -0700 (PDT)
From: Alexander Kanavin <alex.kanavin@gmail.com>
X-Google-Original-From: Alexander Kanavin <alex@linutronix.de>
To: openembedded-core@lists.openembedded.org
Cc: Alexander Kanavin <alex@linutronix.de>
Subject: [PATCH 3/7] rust: update 1.60.0 -> 1.62.0
Date: Tue,  5 Jul 2022 19:03:35 +0200
Message-Id: <20220705170339.771017-3-alex@linutronix.de>
X-Mailer: git-send-email 2.30.2
In-Reply-To: <20220705170339.771017-1-alex@linutronix.de>
References: <20220705170339.771017-1-alex@linutronix.de>
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Tue, 05 Jul 2022 17:04:00 -0000
X-Groupsio-URL: 
 https://lists.openembedded.org/g/openembedded-core/message/167673

Drop the two libstdc patches as they've finally appeared upstream.

Disable the use of libstdc++.a from the host distributions, as it results
in cross-distro contamination in rust-native.

Signed-off-by: Alexander Kanavin <alex@linutronix.de>
---
 meta/conf/distro/include/tcmode-default.inc   |  2 +-
 ...60.0.bb =3D> cargo-cross-canadian_1.62.0.bb} |  0
 .../{cargo_1.60.0.bb =3D> cargo_1.62.0.bb}      |  0
 ...syscalls-to-musl-riscv64-definitions.patch | 44 -------------------
 ...checksums-for-modified-vendored-libc.patch | 18 --------
 .../recipes-devtools/rust/libstd-rs_1.60.0.bb | 12 -----
 .../recipes-devtools/rust/libstd-rs_1.62.0.bb |  7 +++
 ....60.0.bb =3D> rust-cross-canadian_1.62.0.bb} |  0
 ...t-cross_1.60.0.bb =3D> rust-cross_1.62.0.bb} |  0
 ...ssdk_1.60.0.bb =3D> rust-crosssdk_1.62.0.bb} |  0
 ...ust-llvm_1.60.0.bb =3D> rust-llvm_1.62.0.bb} |  0
 meta/recipes-devtools/rust/rust-snapshot.inc  | 22 +++++-----
 meta/recipes-devtools/rust/rust-source.inc    |  2 +-
 ...bb =3D> rust-tools-cross-canadian_1.62.0.bb} |  0
 meta/recipes-devtools/rust/rust.inc           |  4 ++
 .../rust/{rust_1.60.0.bb =3D> rust_1.62.0.bb}   |  0
 16 files changed, 24 insertions(+), 87 deletions(-)
 rename meta/recipes-devtools/cargo/{cargo-cross-canadian_1.60.0.bb =3D> ca=
rgo-cross-canadian_1.62.0.bb} (100%)
 rename meta/recipes-devtools/cargo/{cargo_1.60.0.bb =3D> cargo_1.62.0.bb} =
(100%)
 delete mode 100644 meta/recipes-devtools/rust/libstd-rs/0001-Add-400-serie=
s-syscalls-to-musl-riscv64-definitions.patch
 delete mode 100644 meta/recipes-devtools/rust/libstd-rs/0001-Update-checks=
ums-for-modified-vendored-libc.patch
 delete mode 100644 meta/recipes-devtools/rust/libstd-rs_1.60.0.bb
 create mode 100644 meta/recipes-devtools/rust/libstd-rs_1.62.0.bb
 rename meta/recipes-devtools/rust/{rust-cross-canadian_1.60.0.bb =3D> rust=
-cross-canadian_1.62.0.bb} (100%)
 rename meta/recipes-devtools/rust/{rust-cross_1.60.0.bb =3D> rust-cross_1.=
62.0.bb} (100%)
 rename meta/recipes-devtools/rust/{rust-crosssdk_1.60.0.bb =3D> rust-cross=
sdk_1.62.0.bb} (100%)
 rename meta/recipes-devtools/rust/{rust-llvm_1.60.0.bb =3D> rust-llvm_1.62=
.0.bb} (100%)
 rename meta/recipes-devtools/rust/{rust-tools-cross-canadian_1.60.0.bb =3D=
> rust-tools-cross-canadian_1.62.0.bb} (100%)
 rename meta/recipes-devtools/rust/{rust_1.60.0.bb =3D> rust_1.62.0.bb} (10=
0%)

diff --git a/meta/conf/distro/include/tcmode-default.inc b/meta/conf/distro=
/include/tcmode-default.inc
index eb2f01b967..860671e2de 100644
--- a/meta/conf/distro/include/tcmode-default.inc
+++ b/meta/conf/distro/include/tcmode-default.inc
@@ -27,7 +27,7 @@ GOVERSION ?=3D "1.18%"
 # This can not use wildcards like 8.0.% since it is also used in mesa to d=
enote
 # llvm version being used, so always bump it with llvm recipe version bump
 LLVMVERSION ?=3D "14.0.4"
-RUSTVERSION ?=3D "1.60%"
+RUSTVERSION ?=3D "1.62%"
=20
 PREFERRED_VERSION_gcc ?=3D "${GCCVERSION}"
 PREFERRED_VERSION_gcc-cross-${TARGET_ARCH} ?=3D "${GCCVERSION}"
diff --git a/meta/recipes-devtools/cargo/cargo-cross-canadian_1.60.0.bb b/m=
eta/recipes-devtools/cargo/cargo-cross-canadian_1.62.0.bb
similarity index 100%
rename from meta/recipes-devtools/cargo/cargo-cross-canadian_1.60.0.bb
rename to meta/recipes-devtools/cargo/cargo-cross-canadian_1.62.0.bb
diff --git a/meta/recipes-devtools/cargo/cargo_1.60.0.bb b/meta/recipes-dev=
tools/cargo/cargo_1.62.0.bb
similarity index 100%
rename from meta/recipes-devtools/cargo/cargo_1.60.0.bb
rename to meta/recipes-devtools/cargo/cargo_1.62.0.bb
diff --git a/meta/recipes-devtools/rust/libstd-rs/0001-Add-400-series-sysca=
lls-to-musl-riscv64-definitions.patch b/meta/recipes-devtools/rust/libstd-r=
s/0001-Add-400-series-syscalls-to-musl-riscv64-definitions.patch
deleted file mode 100644
index 2f2ca27910..0000000000
--- a/meta/recipes-devtools/rust/libstd-rs/0001-Add-400-series-syscalls-to-=
musl-riscv64-definitions.patch
+++ /dev/null
@@ -1,44 +0,0 @@
-From 7b3bc1de0c79a1b410105ce36bbe9f774438d263 Mon Sep 17 00:00:00 2001
-From: Ross Schulman <ross@rbs.io>
-Date: Tue, 1 Feb 2022 09:13:16 -0500
-Subject: [PATCH] Add 400-series syscalls to musl riscv64 definitions
-
-Upstream-Status: Backport [https://github.com/rust-lang/libc/commit/7b3bc1=
de0c79a1b410105ce36bbe9f774438d263]
-Signed-off-by: Khem Raj <raj.khem@gmail.com>
----
- .../linux_like/linux/musl/b64/riscv64/mod.rs  | 19 +++++++++++++++++++
- 1 file changed, 19 insertions(+)
-
-diff --git a/vendor/libc-0.2.116/src/unix/linux_like/linux/musl/b64/riscv6=
4/mod.rs b/vendor/libc-0.2.116/src/unix/linux_like/linux/musl/b64/riscv64/m=
od.rs
-index 6b17621c7..2036583d5 100644
---- a/vendor/libc-0.2.116/src/unix/linux_like/linux/musl/b64/riscv64/mod.rs
-+++ b/vendor/libc-0.2.116/src/unix/linux_like/linux/musl/b64/riscv64/mod.rs
-@@ -465,6 +465,25 @@ pub const SYS_pkey_mprotect: ::c_long =3D 288;
- pub const SYS_pkey_alloc: ::c_long =3D 289;
- pub const SYS_pkey_free: ::c_long =3D 290;
- pub const SYS_statx: ::c_long =3D 291;
-+pub const SYS_pidfd_send_signal: ::c_long =3D 424;
-+pub const SYS_io_uring_setup: ::c_long =3D 425;
-+pub const SYS_io_uring_enter: ::c_long =3D 426;
-+pub const SYS_io_uring_register: ::c_long =3D 427;
-+pub const SYS_open_tree: ::c_long =3D 428;
-+pub const SYS_move_mount: ::c_long =3D 429;
-+pub const SYS_fsopen: ::c_long =3D 430;
-+pub const SYS_fsconfig: ::c_long =3D 431;
-+pub const SYS_fsmount: ::c_long =3D 432;
-+pub const SYS_fspick: ::c_long =3D 433;
-+pub const SYS_pidfd_open: ::c_long =3D 434;
-+pub const SYS_clone3: ::c_long =3D 435;
-+pub const SYS_close_range: ::c_long =3D 436;
-+pub const SYS_openat2: ::c_long =3D 437;
-+pub const SYS_pidfd_getfd: ::c_long =3D 438;
-+pub const SYS_faccessat2: ::c_long =3D 439;
-+pub const SYS_process_madvise: ::c_long =3D 440;
-+pub const SYS_epoll_pwait2: ::c_long =3D 441;
-+pub const SYS_mount_setattr: ::c_long =3D 442;
-=20
- pub const O_APPEND: ::c_int =3D 1024;
- pub const O_DIRECT: ::c_int =3D 0x4000;
---=20
-2.35.1
-
diff --git a/meta/recipes-devtools/rust/libstd-rs/0001-Update-checksums-for=
-modified-vendored-libc.patch b/meta/recipes-devtools/rust/libstd-rs/0001-U=
pdate-checksums-for-modified-vendored-libc.patch
deleted file mode 100644
index 923a8fbf84..0000000000
--- a/meta/recipes-devtools/rust/libstd-rs/0001-Update-checksums-for-modifi=
ed-vendored-libc.patch
+++ /dev/null
@@ -1,18 +0,0 @@
-From 7d16c193959f306b50978b415cc3718029c0d8d5 Mon Sep 17 00:00:00 2001
-From: Khem Raj <raj.khem@gmail.com>
-Date: Mon, 14 Mar 2022 11:06:39 -0700
-Subject: [PATCH] Update checksums for modified vendored libc
-
-Upstream-Status: Inappropriate [Relevant until backported patch is needed]
-
-Signed-off-by: Khem Raj <raj.khem@gmail.com>
----
- vendor/libc-0.2.116/.cargo-checksum.json | 2 +-
- 1 file changed, 1 insertion(+), 1 deletion(-)
-
---- a/vendor/libc-0.2.116/.cargo-checksum.json
-+++ b/vendor/libc-0.2.116/.cargo-checksum.json
-@@ -1 +1 @@
--{"files":{"CONTRIBUTING.md":"752eea5a703d11b485c6b5f195f51bd2c79aa5159b61=
9ce09555c779e1fb586b","Cargo.toml":"5bb1b7c99c97f4a5c211e2803482b3bac420044=
ad1c53a24c06630d4c8df3348","LICENSE-APACHE":"a60eea817514531668d7e007657314=
49fe14d059d3249e0bc93b36de45f759f2","LICENSE-MIT":"a8d47ff51ca256f56a8932db=
a07660672dbfe3004257ca8de708aac1415937a1","README.md":"8228847944f1332882fb=
b00275b6f30e4a8aad08a13569c25d52cac012cc2a47","build.rs":"0a4edcc040533d370=
a2a736f2e218516182471e8b0d9ed5dc2a6c08d5d852a83","rustfmt.toml":"eaa2ea84fc=
1ba0359b77680804903e07bb38d257ab11986b95b158e460f787b2","src/fixed_width_in=
ts.rs":"34c60f12ec5eeb90f13ec3b954427532111c2446e69617616a97aefc1086a9f1","=
src/fuchsia/aarch64.rs":"378776a9e40766154a54c94c2a7b4675b5c302a38e6e42da99=
e67bfbaee60e56","src/fuchsia/align.rs":"ae1cf8f011a99737eabeb14ffff768e60f1=
3b13363d7646744dbb0f443dab3d6","src/fuchsia/mod.rs":"bc8c46531bd1a2429f36aa=
f2bc137b50e42505b798de83f34eecfa94ad89179b","src/fuchsia/no_align.rs":"303f=
3f1b255e0088b5715094353cf00476131d8e94e6aebb3f469557771c8b8a","src/fuchsia/=
x86_64.rs":"93a3632b5cf67d2a6bcb7dc0a558605252d5fe689e0f38d8aa2ec5852255ac8=
7","src/hermit/aarch64.rs":"86048676e335944c37a63d0083d0f368ae10ceccefeed9d=
ebb3bbe08777fc682","src/hermit/mod.rs":"d3bfce41e4463d4be8020a2d063c9bfa8b6=
65f45f1cc6cbf3163f5d01e7cb21f","src/hermit/x86_64.rs":"ab832b7524e5fb15c49f=
f7431165ab1a37dc4667ae0b58e8306f4c539bfa110c","src/lib.rs":"adc4f6af60e57ea=
dc01042ec4312bd592fa3002850b8c70740bfd95ddd2d77fb","src/macros.rs":"148cf62=
f43a1732a8f37c5e7c9673e51b69cee124c27ee9883c94d2da8edff20","src/psp.rs":"dd=
31aabd46171d474ec5828372e28588935120e7355c90c105360d8fa9264c1c","src/sgx.rs=
":"16a95cdefc81c5ee00d8353a60db363c4cc3e0f75abcd5d0144723f2a306ed1b","src/s=
olid/aarch64.rs":"a726e47f324adf73a4a0b67a2c183408d0cad105ae66acf36db37a42a=
b7f8707","src/solid/arm.rs":"e39a4f74ebbef3b97b8c95758ad741123d84ed3eb48d9c=
f4f1f4872097fc27fe","src/solid/mod.rs":"98dc29c3e5773318ba258a4a2b7407f25aa=
52d40885a0024fbe43676fe54d14b","src/switch.rs":"9da3dd39b3de45a7928789926e8=
572d00e1e11a39e6f7289a1349aadce90edba","src/unix/align.rs":"2cdc7c826ef7ae6=
1f5171c5ae8c445a743d86f1a7f2d9d7e4ceeec56d6874f65","src/unix/bsd/apple/b32/=
align.rs":"ec833a747866fe19ca2d9b4d3c9ff0385faba5edf4bd0d15fa68884c40b0e26c=
","src/unix/bsd/apple/b32/mod.rs":"2546ad3eb6aecb95f916648bc63264117c92b4b4=
859532b34cb011e4c75a5a72","src/unix/bsd/apple/b64/aarch64/align.rs":"f0c321=
265dd7671f16106b84951ac7dd77ed2e65c6623cbf2d29e76531984770","src/unix/bsd/a=
pple/b64/aarch64/mod.rs":"44c217a4f263afe7a97435de9323d20a96c37836f899ca092=
5306d4b7e073c27","src/unix/bsd/apple/b64/align.rs":"ec833a747866fe19ca2d9b4=
d3c9ff0385faba5edf4bd0d15fa68884c40b0e26c","src/unix/bsd/apple/b64/mod.rs":=
"f5e278a1af7fb358891d1c9be4eb7e815aaca0c5cb738d0c3604ba2208a856f7","src/uni=
x/bsd/apple/b64/x86_64/align.rs":"ec833a747866fe19ca2d9b4d3c9ff0385faba5edf=
4bd0d15fa68884c40b0e26c","src/unix/bsd/apple/b64/x86_64/mod.rs":"8c87c58550=
38aae5d433c8f5eb3b29b0a175879a0245342b3bfd83bdf4cfd936","src/unix/bsd/apple=
/mod.rs":"394a28c9924c4d973d980dc529627cdccf6ca710f7aec46500a868fa76f493df"=
,"src/unix/bsd/freebsdlike/dragonfly/errno.rs":"8295b8bb0dfd38d2cdb4d9192cd=
eeb534cc6c3b208170e64615fa3e0edb3e578","src/unix/bsd/freebsdlike/dragonfly/=
mod.rs":"829c863803f2029396177026b6f6bd7f91e857032c5a133aa48247a6c3c01431",=
"src/unix/bsd/freebsdlike/freebsd/aarch64.rs":"2a215bd6136b8617aacedf9be738=
ccee94da9d29b418e9a78101d6291c182352","src/unix/bsd/freebsdlike/freebsd/arm=
.rs":"59d6a670eea562fb87686e243e0a84603d29a2028a3d4b3f99ccc01bd04d2f47","sr=
c/unix/bsd/freebsdlike/freebsd/freebsd11/b64.rs":"9808d152c1196aa647f1b0f0c=
f84dac8c930da7d7f897a44975545e3d9d17681","src/unix/bsd/freebsdlike/freebsd/=
freebsd11/mod.rs":"a6eee615e6ca5a6e04b526bb6b22d13b9356e87e51825cda33476c37=
a46cb0ef","src/unix/bsd/freebsdlike/freebsd/freebsd12/b64.rs":"61cbe45f8499=
bedb168106b686d4f8239472f25c7553b069eec2afe197ff2df6","src/unix/bsd/freebsd=
like/freebsd/freebsd12/mod.rs":"266fe364867d858610b51a950e936fb10c7990f5e62=
7cd59f7947f4b232ab259","src/unix/bsd/freebsdlike/freebsd/freebsd12/x86_64.r=
s":"2df36a7f122f6d6e5753cfb4d22e915cc80f6bc91c0161b3daae55a481bfd052","src/=
unix/bsd/freebsdlike/freebsd/freebsd13/b64.rs":"61cbe45f8499bedb168106b686d=
4f8239472f25c7553b069eec2afe197ff2df6","src/unix/bsd/freebsdlike/freebsd/fr=
eebsd13/mod.rs":"12bf5c9aef74d43005aca762a48c2c6d64c21d138bd789b20f7143fc20=
a6db95","src/unix/bsd/freebsdlike/freebsd/freebsd13/x86_64.rs":"2df36a7f122=
f6d6e5753cfb4d22e915cc80f6bc91c0161b3daae55a481bfd052","src/unix/bsd/freebs=
dlike/freebsd/freebsd14/b64.rs":"61cbe45f8499bedb168106b686d4f8239472f25c75=
53b069eec2afe197ff2df6","src/unix/bsd/freebsdlike/freebsd/freebsd14/mod.rs"=
:"fdbc49a641a247aabb6e725647826bc5341447d9bff1319bfe092ba5fcda7b26","src/un=
ix/bsd/freebsdlike/freebsd/freebsd14/x86_64.rs":"2df36a7f122f6d6e5753cfb4d2=
2e915cc80f6bc91c0161b3daae55a481bfd052","src/unix/bsd/freebsdlike/freebsd/m=
od.rs":"9e6d77f35ff7d9f3cdd8596ca88f2eb39fd74cd8a135f99cc487fdb164422f83","=
src/unix/bsd/freebsdlike/freebsd/powerpc.rs":"9ca3f82f88974e6db5569f2d76a5a=
3749b248a31747a6c0da5820492bdfeca42","src/unix/bsd/freebsdlike/freebsd/powe=
rpc64.rs":"2dae3ecc87eac3b11657aa98915def55fc4b5c0de11fe26aae23329a54628a9a=
","src/unix/bsd/freebsdlike/freebsd/riscv64.rs":"8f591bd273464d684c4f64365f=
8ed56a8138175daa70d96008541393057a0dae","src/unix/bsd/freebsdlike/freebsd/x=
86.rs":"c5005e3249eb7c93cfbac72a9e9272320d80ce7983da990ceb05a447f59a02c5","=
src/unix/bsd/freebsdlike/freebsd/x86_64/align.rs":"0e1f69a88fca1c32874b1daf=
5db3d446fefbe518dca497f096cc9168c39dde70","src/unix/bsd/freebsdlike/freebsd=
/x86_64/mod.rs":"51e4dd0c8ae247bb652feda5adad9333ea3bb30c750c3a3935e0b0e47d=
7803eb","src/unix/bsd/freebsdlike/mod.rs":"365ab1c1ce8b7ca061b1bdb38aac534c=
b600e978746eb309f6d1792b3f67db39","src/unix/bsd/mod.rs":"2fed08973739d7f6a7=
412b204724af64b1a915c712689c250cf9a08263ba05ff","src/unix/bsd/netbsdlike/mo=
d.rs":"07b97b75fa72215b54c9869f50eee3167ea835fd674cf3fa036bdbd6904c563b","s=
rc/unix/bsd/netbsdlike/netbsd/aarch64.rs":"65dcb58d11e8d8028401a9d07ca3eb4c=
b4f053e04249cc877353449d84ccc4cb","src/unix/bsd/netbsdlike/netbsd/arm.rs":"=
58cdbb70b0d6f536551f0f3bb3725d2d75c4690db12c26c034e7d6ec4a924452","src/unix=
/bsd/netbsdlike/netbsd/mod.rs":"5f927d3d26165689b3ae7a7535ea5504068a406ef76=
705572c610995dbea1f0e","src/unix/bsd/netbsdlike/netbsd/powerpc.rs":"ee7ff5d=
89d0ed22f531237b5059aa669df93a3b5c489fa641465ace8d405bf41","src/unix/bsd/ne=
tbsdlike/netbsd/sparc64.rs":"9489f4b3e4566f43bb12dfb92238960613dac7f6a45cc1=
3068a8d152b902d7d9","src/unix/bsd/netbsdlike/netbsd/x86.rs":"20692320e36bfe=
028d1a34d16fe12ca77aa909cb02bda167376f98f1a09aefe7","src/unix/bsd/netbsdlik=
e/netbsd/x86_64.rs":"1afe5ef46b14397cdd68664b5b232e4f5b035b6db1d4cf411c899d=
51ebca9f30","src/unix/bsd/netbsdlike/openbsd/aarch64.rs":"dd91931d373b7ecaf=
6e2de25adadee10d16fa9b12c2cbacdff3eb291e1ba36af","src/unix/bsd/netbsdlike/o=
penbsd/arm.rs":"01580d261bc6447bb327a0d982181b7bdabfa066cee65a30373d3ced729=
ad307","src/unix/bsd/netbsdlike/openbsd/mips64.rs":"8532a189ae10c7d668d9d40=
65da8b05d124e09bd39442c9f74a7f231c43eca48","src/unix/bsd/netbsdlike/openbsd=
/mod.rs":"98c95365b892679b4976b928714a0b6fc61f01fe662e7066170448d6c1eaef5e"=
,"src/unix/bsd/netbsdlike/openbsd/powerpc.rs":"01580d261bc6447bb327a0d98218=
1b7bdabfa066cee65a30373d3ced729ad307","src/unix/bsd/netbsdlike/openbsd/powe=
rpc64.rs":"1dd5449dd1fd3d51e30ffdeeaece91d0aaf05c710e0ac699fecc5461cfa2c28e=
","src/unix/bsd/netbsdlike/openbsd/riscv64.rs":"1dd5449dd1fd3d51e30ffdeeaec=
e91d0aaf05c710e0ac699fecc5461cfa2c28e","src/unix/bsd/netbsdlike/openbsd/spa=
rc64.rs":"d04fd287afbaa2c5df9d48c94e8374a532a3ba491b424ddf018270c7312f4085"=
,"src/unix/bsd/netbsdlike/openbsd/x86.rs":"6f7f5c4fde2a2259eb547890cbd86570=
cea04ef85347d7569e94e679448bec87","src/unix/bsd/netbsdlike/openbsd/x86_64.r=
s":"d31db31630289c85af3339dbe357998a21ca584cbae31607448fe2cf7675a4e1","src/=
unix/haiku/b32.rs":"a2efdbf7158a6da341e1db9176b0ab193ba88b449616239ed95dced=
11f54d87b","src/unix/haiku/b64.rs":"ff8115367d3d7d354f792d6176dfaaa26353f57=
056197b563bf4681f91ff7985","src/unix/haiku/mod.rs":"41c1cc641a21a2433fe38e9=
b4038c4ac94ef10a00c38351c79c4e7f3affadc6e","src/unix/haiku/native.rs":"4485=
5f52906f607de137fc4baa8c6b1b9a26baaa666f25d5f7a7ec5e017c8be6","src/unix/hai=
ku/x86_64.rs":"3ec3aeeb7ed208b8916f3e32d42bfd085ff5e16936a1a35d9a52789f043b=
7237","src/unix/hermit/aarch64.rs":"86048676e335944c37a63d0083d0f368ae10cec=
cefeed9debb3bbe08777fc682","src/unix/hermit/mod.rs":"859814f5df89e28fd4b345=
db399d181e11e7ed413841b6ff703a1fcbdbf013ae","src/unix/hermit/x86_64.rs":"ab=
832b7524e5fb15c49ff7431165ab1a37dc4667ae0b58e8306f4c539bfa110c","src/unix/l=
inux_like/android/b32/arm.rs":"433c1530f602cc5ed26610c58055dde0c4ceea5e0015=
0063b24ddc60768332a4","src/unix/linux_like/android/b32/mod.rs":"d971b98530a=
96f5892f98e1edc3133cf278d1b3939d77ab0a27a6323e0961715","src/unix/linux_like=
/android/b32/x86/align.rs":"812914e4241df82e32b12375ca3374615dc3a4bdd4cf31f=
0423c5815320c0dab","src/unix/linux_like/android/b32/x86/mod.rs":"8388bd3a0f=
cb5636bf965eee6dc95ae6860b85a2b555b387c868aa4d4e01ec89","src/unix/linux_lik=
e/android/b64/aarch64/align.rs":"2179c3b1608fa4bf68840482bfc2b2fa3ee2faf6fc=
ae3770f9e505cddca35c7b","src/unix/linux_like/android/b64/aarch64/mod.rs":"7=
8b837d764c5ab6d262f12c3824d8ef05a94c03b9342b88462454ca7a52d203d","src/unix/=
linux_like/android/b64/mod.rs":"d7bbbadafdb2cb2ff8e9cde3d89a03b9facaabb6b2d=
45705225d3ece1c5cce37","src/unix/linux_like/android/b64/x86_64/align.rs":"7=
169d07a9fd4716f7512719aec9fda5d8bed306dc0720ffc1b21696c9951e3c6","src/unix/=
linux_like/android/b64/x86_64/mod.rs":"06b22dc184e85a988ab969c75cadc52b9878=
faeab0eb9d21215878c95fe07c19","src/unix/linux_like/android/mod.rs":"f19d7ce=
918bd273709578b3cfc3be02192ff1b0d4561de0018796db3fe04b179","src/unix/linux_=
like/emscripten/align.rs":"86c95cbed7a7161b1f23ee06843e7b0e2340ad92b2cb86fe=
2a8ef3e0e8c36216","src/unix/linux_like/emscripten/mod.rs":"b71d37106750f57b=
c2dae4e9bcb473ff098ef48235827e41a1687a39825f0aa4","src/unix/linux_like/emsc=
ripten/no_align.rs":"0128e4aa721a9902754828b61b5ec7d8a86619983ed1e0544a85d3=
5b1051fad6","src/unix/linux_like/linux/align.rs":"213e70ebed2703e14a9cf1766=
6b21ecbf180b7bff7fa22fdbb36dbbd52df326d","src/unix/linux_like/linux/arch/ge=
neric/mod.rs":"b6efaded9b9631410a265dd52398d9bddb387d35b9f513e9c0432dc5233d=
da39","src/unix/linux_like/linux/arch/mips/mod.rs":"4588078cd2b1c046379c8a5=
5f728b838ff7f9151fcd8a1a5389683f1bda13550","src/unix/linux_like/linux/arch/=
mod.rs":"466a29622e47c6c7f1500682b2eb17f5566dd81b322cd6348f0fdd355cec593a",=
"src/unix/linux_like/linux/arch/powerpc/mod.rs":"c447e417cdb966a4da64e2755f=
d91f64ab14098f529098bf437053d7e08843db","src/unix/linux_like/linux/arch/spa=
rc/mod.rs":"9b89a4e798bb83b3e0f4052fa2d2bb6f5e9508da69a2e5b40b40795e4b4256a=
e","src/unix/linux_like/linux/gnu/align.rs":"e4a3c27fe20a57b8d612c34cb05bc7=
0646edb5cec7251957315afa53a7b9f936","src/unix/linux_like/linux/gnu/b32/arm/=
align.rs":"3fed009dc9af3cc81be7087da9d2d7d1f39845e4497e290259c5cdbae25f039d=
","src/unix/linux_like/linux/gnu/b32/arm/mod.rs":"877ff42aa56e599084df9a837=
4e1f3eaf8ec05a445f2887b10aee5744c093f02","src/unix/linux_like/linux/gnu/b32=
/mips/align.rs":"429fb5e005cb7143602d430098b6ebfb7d360685b194f333dfd587472a=
e954ee","src/unix/linux_like/linux/gnu/b32/mips/mod.rs":"9fdf7cf98bc9215385=
4ba04b2892009ec8bd855d12e1f68e91d3df2418ff6364","src/unix/linux_like/linux/=
gnu/b32/mod.rs":"ad23b70a5f849d5a6dbbf6d608221d2928b1834956d71d072bcc0eb941=
b0d856","src/unix/linux_like/linux/gnu/b32/powerpc.rs":"240468afe2fe42fd60a=
5568add147dc0ff097a6469ffadfdd5b9756dfd0323f2","src/unix/linux_like/linux/g=
nu/b32/riscv32/mod.rs":"dc99518121e911db120b157ad289e5e6964f3a42df53b091eaf=
071dbf5c04098","src/unix/linux_like/linux/gnu/b32/sparc/align.rs":"21adbed2=
7df73e2d1ed934aaf733a643003d7baf2bde9c48ea440895bcca6d41","src/unix/linux_l=
ike/linux/gnu/b32/sparc/mod.rs":"ae203726810da9312b484b0b7891a35527748c069f=
11e91d6d9afc73297b1cbb","src/unix/linux_like/linux/gnu/b32/x86/align.rs":"e=
4bafdc4a519a7922a81b37a62bbfd1177a2f620890eef8f1fbc47162e9eb413","src/unix/=
linux_like/linux/gnu/b32/x86/mod.rs":"eb8d002ccb3dfcf6c94e8826afe9f8c496a81=
3fa3d770c7dbc1024b45f870c2f","src/unix/linux_like/linux/gnu/b64/aarch64/ali=
gn.rs":"2179c3b1608fa4bf68840482bfc2b2fa3ee2faf6fcae3770f9e505cddca35c7b","=
src/unix/linux_like/linux/gnu/b64/aarch64/ilp32.rs":"21a21503ef2e095f437104=
4915d4bfb07a8578011cb5c713cd9f45947b0b5730","src/unix/linux_like/linux/gnu/=
b64/aarch64/lp64.rs":"e78c3cd197f44832338b414d1a9bc0d194f44c74db77bd7bf830c=
1fff62b2690","src/unix/linux_like/linux/gnu/b64/aarch64/mod.rs":"79991b2801=
0bfa01501dc5aa0ba2f7d8394539447398169a052c541cb21e20bd","src/unix/linux_lik=
e/linux/gnu/b64/mips64/align.rs":"7169d07a9fd4716f7512719aec9fda5d8bed306dc=
0720ffc1b21696c9951e3c6","src/unix/linux_like/linux/gnu/b64/mips64/mod.rs":=
"506050a20f8de53907a893d2711f1bed6e6c019580d5dde55f5dbdcfa40802f5","src/uni=
x/linux_like/linux/gnu/b64/mod.rs":"6336065423c26b59681fd2ce77f1117ea36af13=
e163fdadaefd108bd8191e8c8","src/unix/linux_like/linux/gnu/b64/powerpc64/ali=
gn.rs":"e29c4868bbecfa4a6cd8a2ad06193f3bbc78a468cc1dc9df83f002f1268130d9","=
src/unix/linux_like/linux/gnu/b64/powerpc64/mod.rs":"b53ee7b973b91c2175d164=
76c87547f8b36c2f0b716f456018fdd2728ab4d59f","src/unix/linux_like/linux/gnu/=
b64/riscv64/mod.rs":"7cbadd208b719c3cbab0432cb6bb236f1e79a01823790aa6b07366=
433ca0991b","src/unix/linux_like/linux/gnu/b64/s390x.rs":"59228db655d6a54d2=
0b9431c705ed7966f94b98d61e53b992c8f8ee05e176e77","src/unix/linux_like/linux=
/gnu/b64/sparc64/align.rs":"e29c4868bbecfa4a6cd8a2ad06193f3bbc78a468cc1dc9d=
f83f002f1268130d9","src/unix/linux_like/linux/gnu/b64/sparc64/mod.rs":"cb97=
50d9153428712eb32928fb85a1e67f9687f42ef698c3bb79951c219361d0","src/unix/lin=
ux_like/linux/gnu/b64/x86_64/align.rs":"7169d07a9fd4716f7512719aec9fda5d8be=
d306dc0720ffc1b21696c9951e3c6","src/unix/linux_like/linux/gnu/b64/x86_64/mo=
d.rs":"e4cbe0f5a3d100490f4f648bcadcd26899cf2f4760e6ee8ccb56ce16d598cc18","s=
rc/unix/linux_like/linux/gnu/b64/x86_64/not_x32.rs":"f775ac2b754f90b63053fe=
22afe1d19d306b5404995568d6805baa9249fb617f","src/unix/linux_like/linux/gnu/=
b64/x86_64/x32.rs":"4ba1b58468f55254717366f50fdfd3e4114fde6dc442a56681926c4=
d7e5b6b0d","src/unix/linux_like/linux/gnu/mod.rs":"13899330d3118c5e41854f89=
7c2e455f1b7db949384d36cff1d3042fd25a4475","src/unix/linux_like/linux/gnu/no=
_align.rs":"9cd223135de75315840ff9c3fd5441ba1cb632b96b5c85a76f8316c86653db2=
5","src/unix/linux_like/linux/mod.rs":"3aaa8a783a1ec2134e27a45d7de6296b97f9=
4e543bf5ec2c6c4ea5d24afb167f","src/unix/linux_like/linux/musl/b32/arm/align=
.rs":"3e8ac052c1043764776b54c93ba4260e061df998631737a897d9d47d54f7b80c","sr=
c/unix/linux_like/linux/musl/b32/arm/mod.rs":"8625290735a1294a50b34bb2b8d3b=
515305325187027cc577c72b0762f3a265e","src/unix/linux_like/linux/musl/b32/he=
xagon.rs":"dbc8aeb2bd3cd2269e0e95858c5ba0e0204b1ca0bcc5df517fb3f7f71134d044=
","src/unix/linux_like/linux/musl/b32/mips/align.rs":"429fb5e005cb7143602d4=
30098b6ebfb7d360685b194f333dfd587472ae954ee","src/unix/linux_like/linux/mus=
l/b32/mips/mod.rs":"65e3917900a9dfa0b4602e87d17305ebfa56a0c0dea61e3975099c9=
a6b9e967b","src/unix/linux_like/linux/musl/b32/mod.rs":"bac24312f6629ef76aa=
12dd41123061e3a77a244e7fda7bbfcdf5c57996b61e6","src/unix/linux_like/linux/m=
usl/b32/powerpc.rs":"e898b490365c84c0f1856ea8640463c558b5a247d845ca0c116776=
79272ea20f","src/unix/linux_like/linux/musl/b32/x86/align.rs":"08e77fbd7435=
d7dec2ff56932433bece3f02e47ce810f89004a275a86d39cbe1","src/unix/linux_like/=
linux/musl/b32/x86/mod.rs":"9a9f4926d5a1fbe406f5ab84742680fe4941ab929005e7f=
efc4e2bc6686ba5eb","src/unix/linux_like/linux/musl/b64/aarch64/align.rs":"7=
98a9229d70ce235394f2dd625f6c4c1e10519a94382dc5b091952b638ae2928","src/unix/=
linux_like/linux/musl/b64/aarch64/mod.rs":"cddcde68c13104f18edd611ce23e60a4=
f9b4fcae1baa57fb92284495d3a77850","src/unix/linux_like/linux/musl/b64/mips6=
4.rs":"4a5d543195da94aaa45be067d6d145c8092bebf3611898aa2beccc0cd55d5f3f","s=
rc/unix/linux_like/linux/musl/b64/mod.rs":"d847206d9f2d594c8febe780a938cdcc=
f40d985dafc11e90f235947735a09bac","src/unix/linux_like/linux/musl/b64/power=
pc64.rs":"37b08e5f5f84bc72b62c439ac9282db71ff59b80cd2775c5588941b7a135e6bc"=
,"src/unix/linux_like/linux/musl/b64/riscv64/mod.rs":"88d58ec165c404ab8e44a=
e43ee51ae6982924dae07309dbc504404f142515b7a","src/unix/linux_like/linux/mus=
l/b64/s390x.rs":"9b05b1fae6bcb7cb6d909b9973977fde01684175f3e26c27dcb44223cc=
3933d9","src/unix/linux_like/linux/musl/b64/x86_64/align.rs":"7169d07a9fd47=
16f7512719aec9fda5d8bed306dc0720ffc1b21696c9951e3c6","src/unix/linux_like/l=
inux/musl/b64/x86_64/mod.rs":"d3762f374cd3aaa1e0e3f79d36f9edc7fd4c8492e561e=
e4bd0e80e727eef4e9e","src/unix/linux_like/linux/musl/mod.rs":"c9a24828d62f2=
0e0cc0b835197f48bc31aa51db7ca4880341292271cc2df7aae","src/unix/linux_like/l=
inux/no_align.rs":"5ed04c53bf9d27da9b4d65ba7625c6ac53330162683d1b3df98950ca=
afa3507b","src/unix/linux_like/linux/non_exhaustive.rs":"181a05bf94fdb911db=
83ce793b993bd6548a4115b306a7ef3c10f745a8fea3e9","src/unix/linux_like/linux/=
uclibc/align.rs":"9ed16138d8e439bd90930845a65eafa7ebd67366e6bf633936d44014f=
6e4c959","src/unix/linux_like/linux/uclibc/arm/align.rs":"e4a3c27fe20a57b8d=
612c34cb05bc70646edb5cec7251957315afa53a7b9f936","src/unix/linux_like/linux=
/uclibc/arm/mod.rs":"6d83b37ebe54384269b5c5cc3c9c370f97bdc8c646c9aee8705f0d=
e1aca80067","src/unix/linux_like/linux/uclibc/arm/no_align.rs":"9cd223135de=
75315840ff9c3fd5441ba1cb632b96b5c85a76f8316c86653db25","src/unix/linux_like=
/linux/uclibc/mips/mips32/align.rs":"e4a3c27fe20a57b8d612c34cb05bc70646edb5=
cec7251957315afa53a7b9f936","src/unix/linux_like/linux/uclibc/mips/mips32/m=
od.rs":"edb86245bcc0e340de277e20752463cb4004104fe97737a71afdcc8b06bee703","=
src/unix/linux_like/linux/uclibc/mips/mips32/no_align.rs":"9cd223135de75315=
840ff9c3fd5441ba1cb632b96b5c85a76f8316c86653db25","src/unix/linux_like/linu=
x/uclibc/mips/mips64/align.rs":"a7bdcb18a37a2d91e64d5fad83ea3edc78f5412adb2=
8f77ab077dbb26dd08b2d","src/unix/linux_like/linux/uclibc/mips/mips64/mod.rs=
":"57d5e24ceb98e1ef90de231c4cf7f0275ac410d407607b240af6744504ec1f2a","src/u=
nix/linux_like/linux/uclibc/mips/mips64/no_align.rs":"4a18e3875698c85229599=
225ac3401a2a40da87e77b2ad4ef47c6fcd5a24ed30","src/unix/linux_like/linux/ucl=
ibc/mips/mod.rs":"4eea5256e47e485dd1e50c147a56697d286e0395a77674317e83a28fb=
43a12d8","src/unix/linux_like/linux/uclibc/mod.rs":"d2f5d6a3381bceec0b036bb=
3979c113c9c4144b134368e39b3f9f2fbef79f5cc","src/unix/linux_like/linux/uclib=
c/no_align.rs":"3f28637046524618adaa1012e26cb7ffe94b9396e6b518cccdc69d59f27=
4d709","src/unix/linux_like/linux/uclibc/x86_64/l4re.rs":"024eba5753e852dbd=
d212427351affe7e83f9916c1864bce414d7aa2618f192e","src/unix/linux_like/linux=
/uclibc/x86_64/mod.rs":"583349563b537104e2265be893f65e302e568a54f4022b8f14a=
2cf3200ac39ba","src/unix/linux_like/linux/uclibc/x86_64/other.rs":"42c3f71e=
58cabba373f6a55a623f3c31b85049eb64824c09c2b082b3b2d6a0a8","src/unix/linux_l=
ike/mod.rs":"dd4f7a1d66d8501b4a2c4e75e6e9305ed69f1002ae99e410596a6c63687859=
5a","src/unix/mod.rs":"22300f25d8f3adcdcd419222a2d5657e44c835eb4a0f90e05b69=
1c7bcc3a787e","src/unix/newlib/aarch64/mod.rs":"bb269c1468a9676442554600e87=
417079a787fe6220dfc23b3109639259e8710","src/unix/newlib/align.rs":"28aaf87f=
afbc6b312622719d472d8cf65f9e5467d15339df5f73e66d8502b28a","src/unix/newlib/=
arm/mod.rs":"c71be856bfd7f576b2db28af9f680211cbe6c1cac7d537bbc8020b39591af0=
7c","src/unix/newlib/espidf/mod.rs":"c198cb4beccdab483be61c102da74dc51ac80f=
766797e33021f3110394ed5a3d","src/unix/newlib/horizon/mod.rs":"95cb1e5f469a3=
d90ce27f03d8f70121c82edd26ab762db4aa373857b87e12d98","src/unix/newlib/mod.r=
s":"c33c46ad76627c24927b63953d9271e01bbc7f4967381675baf61442470a41cb","src/=
unix/newlib/no_align.rs":"e0743b2179495a9514bc3a4d1781e492878c4ec834ee0085d=
0891dd1712e82fb","src/unix/newlib/powerpc/mod.rs":"2d0f7af28b47f7a2a6c210eb=
d1c1f33ed8eac62e56b5af2b856de2ad3fdc5187","src/unix/no_align.rs":"c06e95373=
b9088266e0b14bba0954eef95f93fb2b01d951855e382d22de78e53","src/unix/redox/mo=
d.rs":"cc4794afa4fbed9d6612894ea476228f9d8533950162d6416fc4d16073e1dac4","s=
rc/unix/solarish/compat.rs":"b07a5bfac925eb012003a459ba6bddbd3bfa9c44b3394d=
a2ac5a602e54beae9c","src/unix/solarish/illumos.rs":"a092f6676a0d208e803819b=
f32f928714e93606fb9062cf55b5fb7a121d47481","src/unix/solarish/mod.rs":"01dc=
4208b5b0d901550dc9a6f060e7d446a303919287b328fda556d9dc569b34","src/unix/sol=
arish/solaris.rs":"65b005453aefa9b9d4fc860fe77cfec80d8c97a51342b15daf55fc3e=
808bb384","src/unix/solarish/x86_64.rs":"9d761573bdccbdd1ac61da571f7e96b537=
4df70241d9b72d45a069611f495085","src/vxworks/aarch64.rs":"98f0afdc511cd0255=
7e506c21fed6737585490a1dce7a9d4941d08c437762b99","src/vxworks/arm.rs":"acb7=
968ce99fe3f4abdf39d98f8133d21a4fba435b8ef7084777cb181d788e88","src/vxworks/=
mod.rs":"aea3da66f2140f2a82dfc9c58f6e6531d2dd9c15ea696e0f95a0d4a2a187b5b6",=
"src/vxworks/powerpc.rs":"acb7968ce99fe3f4abdf39d98f8133d21a4fba435b8ef7084=
777cb181d788e88","src/vxworks/powerpc64.rs":"98f0afdc511cd02557e506c21fed67=
37585490a1dce7a9d4941d08c437762b99","src/vxworks/x86.rs":"552f007f38317620b=
23889cb7c49d1d115841252439060122f52f434fbc6e5ba","src/vxworks/x86_64.rs":"0=
18d92be3ad628a129eff9f2f5dfbc0883d8b8e5f2fa917b900a7f98ed6b514a","src/wasi.=
rs":"817e7592e47f06ece5266fb35625c1aba0a23128e4015a9de2fbf94aba5f1312","src=
/windows/gnu/align.rs":"b2c13ec1b9f3b39a75c452c80c951dff9d0215e31d77e883b45=
02afb31794647","src/windows/gnu/mod.rs":"3c8c7edb7cdf5d0c44af936db2a9486958=
5c69dfabeef30571b4f4e38375767a","src/windows/mod.rs":"e3ad95ba54f76e74c3016=
11fe868d3d94f6b8939b03be672f568b06b10ae71c7","src/windows/msvc/mod.rs":"c06=
8271e00fca6b62bc4bf44bcf142cfc38caeded9b6c4e01d1ceef3ccf986f4","tests/const=
_fn.rs":"cb75a1f0864f926aebe79118fc34d51a0d1ade2c20a394e7774c7e545f21f1f4"}=
,"package":"565dbd88872dbe4cc8a46e527f26483c1d1f7afa6b884a3bd6cd893d4f98da7=
4"}
-\ No newline at end of file
-+{"files":{"CONTRIBUTING.md":"752eea5a703d11b485c6b5f195f51bd2c79aa5159b61=
9ce09555c779e1fb586b","Cargo.toml":"5bb1b7c99c97f4a5c211e2803482b3bac420044=
ad1c53a24c06630d4c8df3348","LICENSE-APACHE":"a60eea817514531668d7e007657314=
49fe14d059d3249e0bc93b36de45f759f2","LICENSE-MIT":"a8d47ff51ca256f56a8932db=
a07660672dbfe3004257ca8de708aac1415937a1","README.md":"8228847944f1332882fb=
b00275b6f30e4a8aad08a13569c25d52cac012cc2a47","build.rs":"0a4edcc040533d370=
a2a736f2e218516182471e8b0d9ed5dc2a6c08d5d852a83","rustfmt.toml":"eaa2ea84fc=
1ba0359b77680804903e07bb38d257ab11986b95b158e460f787b2","src/fixed_width_in=
ts.rs":"34c60f12ec5eeb90f13ec3b954427532111c2446e69617616a97aefc1086a9f1","=
src/fuchsia/aarch64.rs":"378776a9e40766154a54c94c2a7b4675b5c302a38e6e42da99=
e67bfbaee60e56","src/fuchsia/align.rs":"ae1cf8f011a99737eabeb14ffff768e60f1=
3b13363d7646744dbb0f443dab3d6","src/fuchsia/mod.rs":"bc8c46531bd1a2429f36aa=
f2bc137b50e42505b798de83f34eecfa94ad89179b","src/fuchsia/no_align.rs":"303f=
3f1b255e0088b5715094353cf00476131d8e94e6aebb3f469557771c8b8a","src/fuchsia/=
x86_64.rs":"93a3632b5cf67d2a6bcb7dc0a558605252d5fe689e0f38d8aa2ec5852255ac8=
7","src/hermit/aarch64.rs":"86048676e335944c37a63d0083d0f368ae10ceccefeed9d=
ebb3bbe08777fc682","src/hermit/mod.rs":"d3bfce41e4463d4be8020a2d063c9bfa8b6=
65f45f1cc6cbf3163f5d01e7cb21f","src/hermit/x86_64.rs":"ab832b7524e5fb15c49f=
f7431165ab1a37dc4667ae0b58e8306f4c539bfa110c","src/lib.rs":"adc4f6af60e57ea=
dc01042ec4312bd592fa3002850b8c70740bfd95ddd2d77fb","src/macros.rs":"148cf62=
f43a1732a8f37c5e7c9673e51b69cee124c27ee9883c94d2da8edff20","src/psp.rs":"dd=
31aabd46171d474ec5828372e28588935120e7355c90c105360d8fa9264c1c","src/sgx.rs=
":"16a95cdefc81c5ee00d8353a60db363c4cc3e0f75abcd5d0144723f2a306ed1b","src/s=
olid/aarch64.rs":"a726e47f324adf73a4a0b67a2c183408d0cad105ae66acf36db37a42a=
b7f8707","src/solid/arm.rs":"e39a4f74ebbef3b97b8c95758ad741123d84ed3eb48d9c=
f4f1f4872097fc27fe","src/solid/mod.rs":"98dc29c3e5773318ba258a4a2b7407f25aa=
52d40885a0024fbe43676fe54d14b","src/switch.rs":"9da3dd39b3de45a7928789926e8=
572d00e1e11a39e6f7289a1349aadce90edba","src/unix/align.rs":"2cdc7c826ef7ae6=
1f5171c5ae8c445a743d86f1a7f2d9d7e4ceeec56d6874f65","src/unix/bsd/apple/b32/=
align.rs":"ec833a747866fe19ca2d9b4d3c9ff0385faba5edf4bd0d15fa68884c40b0e26c=
","src/unix/bsd/apple/b32/mod.rs":"2546ad3eb6aecb95f916648bc63264117c92b4b4=
859532b34cb011e4c75a5a72","src/unix/bsd/apple/b64/aarch64/align.rs":"f0c321=
265dd7671f16106b84951ac7dd77ed2e65c6623cbf2d29e76531984770","src/unix/bsd/a=
pple/b64/aarch64/mod.rs":"44c217a4f263afe7a97435de9323d20a96c37836f899ca092=
5306d4b7e073c27","src/unix/bsd/apple/b64/align.rs":"ec833a747866fe19ca2d9b4=
d3c9ff0385faba5edf4bd0d15fa68884c40b0e26c","src/unix/bsd/apple/b64/mod.rs":=
"f5e278a1af7fb358891d1c9be4eb7e815aaca0c5cb738d0c3604ba2208a856f7","src/uni=
x/bsd/apple/b64/x86_64/align.rs":"ec833a747866fe19ca2d9b4d3c9ff0385faba5edf=
4bd0d15fa68884c40b0e26c","src/unix/bsd/apple/b64/x86_64/mod.rs":"8c87c58550=
38aae5d433c8f5eb3b29b0a175879a0245342b3bfd83bdf4cfd936","src/unix/bsd/apple=
/mod.rs":"394a28c9924c4d973d980dc529627cdccf6ca710f7aec46500a868fa76f493df"=
,"src/unix/bsd/freebsdlike/dragonfly/errno.rs":"8295b8bb0dfd38d2cdb4d9192cd=
eeb534cc6c3b208170e64615fa3e0edb3e578","src/unix/bsd/freebsdlike/dragonfly/=
mod.rs":"829c863803f2029396177026b6f6bd7f91e857032c5a133aa48247a6c3c01431",=
"src/unix/bsd/freebsdlike/freebsd/aarch64.rs":"2a215bd6136b8617aacedf9be738=
ccee94da9d29b418e9a78101d6291c182352","src/unix/bsd/freebsdlike/freebsd/arm=
.rs":"59d6a670eea562fb87686e243e0a84603d29a2028a3d4b3f99ccc01bd04d2f47","sr=
c/unix/bsd/freebsdlike/freebsd/freebsd11/b64.rs":"9808d152c1196aa647f1b0f0c=
f84dac8c930da7d7f897a44975545e3d9d17681","src/unix/bsd/freebsdlike/freebsd/=
freebsd11/mod.rs":"a6eee615e6ca5a6e04b526bb6b22d13b9356e87e51825cda33476c37=
a46cb0ef","src/unix/bsd/freebsdlike/freebsd/freebsd12/b64.rs":"61cbe45f8499=
bedb168106b686d4f8239472f25c7553b069eec2afe197ff2df6","src/unix/bsd/freebsd=
like/freebsd/freebsd12/mod.rs":"266fe364867d858610b51a950e936fb10c7990f5e62=
7cd59f7947f4b232ab259","src/unix/bsd/freebsdlike/freebsd/freebsd12/x86_64.r=
s":"2df36a7f122f6d6e5753cfb4d22e915cc80f6bc91c0161b3daae55a481bfd052","src/=
unix/bsd/freebsdlike/freebsd/freebsd13/b64.rs":"61cbe45f8499bedb168106b686d=
4f8239472f25c7553b069eec2afe197ff2df6","src/unix/bsd/freebsdlike/freebsd/fr=
eebsd13/mod.rs":"12bf5c9aef74d43005aca762a48c2c6d64c21d138bd789b20f7143fc20=
a6db95","src/unix/bsd/freebsdlike/freebsd/freebsd13/x86_64.rs":"2df36a7f122=
f6d6e5753cfb4d22e915cc80f6bc91c0161b3daae55a481bfd052","src/unix/bsd/freebs=
dlike/freebsd/freebsd14/b64.rs":"61cbe45f8499bedb168106b686d4f8239472f25c75=
53b069eec2afe197ff2df6","src/unix/bsd/freebsdlike/freebsd/freebsd14/mod.rs"=
:"fdbc49a641a247aabb6e725647826bc5341447d9bff1319bfe092ba5fcda7b26","src/un=
ix/bsd/freebsdlike/freebsd/freebsd14/x86_64.rs":"2df36a7f122f6d6e5753cfb4d2=
2e915cc80f6bc91c0161b3daae55a481bfd052","src/unix/bsd/freebsdlike/freebsd/m=
od.rs":"9e6d77f35ff7d9f3cdd8596ca88f2eb39fd74cd8a135f99cc487fdb164422f83","=
src/unix/bsd/freebsdlike/freebsd/powerpc.rs":"9ca3f82f88974e6db5569f2d76a5a=
3749b248a31747a6c0da5820492bdfeca42","src/unix/bsd/freebsdlike/freebsd/powe=
rpc64.rs":"2dae3ecc87eac3b11657aa98915def55fc4b5c0de11fe26aae23329a54628a9a=
","src/unix/bsd/freebsdlike/freebsd/riscv64.rs":"8f591bd273464d684c4f64365f=
8ed56a8138175daa70d96008541393057a0dae","src/unix/bsd/freebsdlike/freebsd/x=
86.rs":"c5005e3249eb7c93cfbac72a9e9272320d80ce7983da990ceb05a447f59a02c5","=
src/unix/bsd/freebsdlike/freebsd/x86_64/align.rs":"0e1f69a88fca1c32874b1daf=
5db3d446fefbe518dca497f096cc9168c39dde70","src/unix/bsd/freebsdlike/freebsd=
/x86_64/mod.rs":"51e4dd0c8ae247bb652feda5adad9333ea3bb30c750c3a3935e0b0e47d=
7803eb","src/unix/bsd/freebsdlike/mod.rs":"365ab1c1ce8b7ca061b1bdb38aac534c=
b600e978746eb309f6d1792b3f67db39","src/unix/bsd/mod.rs":"2fed08973739d7f6a7=
412b204724af64b1a915c712689c250cf9a08263ba05ff","src/unix/bsd/netbsdlike/mo=
d.rs":"07b97b75fa72215b54c9869f50eee3167ea835fd674cf3fa036bdbd6904c563b","s=
rc/unix/bsd/netbsdlike/netbsd/aarch64.rs":"65dcb58d11e8d8028401a9d07ca3eb4c=
b4f053e04249cc877353449d84ccc4cb","src/unix/bsd/netbsdlike/netbsd/arm.rs":"=
58cdbb70b0d6f536551f0f3bb3725d2d75c4690db12c26c034e7d6ec4a924452","src/unix=
/bsd/netbsdlike/netbsd/mod.rs":"5f927d3d26165689b3ae7a7535ea5504068a406ef76=
705572c610995dbea1f0e","src/unix/bsd/netbsdlike/netbsd/powerpc.rs":"ee7ff5d=
89d0ed22f531237b5059aa669df93a3b5c489fa641465ace8d405bf41","src/unix/bsd/ne=
tbsdlike/netbsd/sparc64.rs":"9489f4b3e4566f43bb12dfb92238960613dac7f6a45cc1=
3068a8d152b902d7d9","src/unix/bsd/netbsdlike/netbsd/x86.rs":"20692320e36bfe=
028d1a34d16fe12ca77aa909cb02bda167376f98f1a09aefe7","src/unix/bsd/netbsdlik=
e/netbsd/x86_64.rs":"1afe5ef46b14397cdd68664b5b232e4f5b035b6db1d4cf411c899d=
51ebca9f30","src/unix/bsd/netbsdlike/openbsd/aarch64.rs":"dd91931d373b7ecaf=
6e2de25adadee10d16fa9b12c2cbacdff3eb291e1ba36af","src/unix/bsd/netbsdlike/o=
penbsd/arm.rs":"01580d261bc6447bb327a0d982181b7bdabfa066cee65a30373d3ced729=
ad307","src/unix/bsd/netbsdlike/openbsd/mips64.rs":"8532a189ae10c7d668d9d40=
65da8b05d124e09bd39442c9f74a7f231c43eca48","src/unix/bsd/netbsdlike/openbsd=
/mod.rs":"98c95365b892679b4976b928714a0b6fc61f01fe662e7066170448d6c1eaef5e"=
,"src/unix/bsd/netbsdlike/openbsd/powerpc.rs":"01580d261bc6447bb327a0d98218=
1b7bdabfa066cee65a30373d3ced729ad307","src/unix/bsd/netbsdlike/openbsd/powe=
rpc64.rs":"1dd5449dd1fd3d51e30ffdeeaece91d0aaf05c710e0ac699fecc5461cfa2c28e=
","src/unix/bsd/netbsdlike/openbsd/riscv64.rs":"1dd5449dd1fd3d51e30ffdeeaec=
e91d0aaf05c710e0ac699fecc5461cfa2c28e","src/unix/bsd/netbsdlike/openbsd/spa=
rc64.rs":"d04fd287afbaa2c5df9d48c94e8374a532a3ba491b424ddf018270c7312f4085"=
,"src/unix/bsd/netbsdlike/openbsd/x86.rs":"6f7f5c4fde2a2259eb547890cbd86570=
cea04ef85347d7569e94e679448bec87","src/unix/bsd/netbsdlike/openbsd/x86_64.r=
s":"d31db31630289c85af3339dbe357998a21ca584cbae31607448fe2cf7675a4e1","src/=
unix/haiku/b32.rs":"a2efdbf7158a6da341e1db9176b0ab193ba88b449616239ed95dced=
11f54d87b","src/unix/haiku/b64.rs":"ff8115367d3d7d354f792d6176dfaaa26353f57=
056197b563bf4681f91ff7985","src/unix/haiku/mod.rs":"41c1cc641a21a2433fe38e9=
b4038c4ac94ef10a00c38351c79c4e7f3affadc6e","src/unix/haiku/native.rs":"4485=
5f52906f607de137fc4baa8c6b1b9a26baaa666f25d5f7a7ec5e017c8be6","src/unix/hai=
ku/x86_64.rs":"3ec3aeeb7ed208b8916f3e32d42bfd085ff5e16936a1a35d9a52789f043b=
7237","src/unix/hermit/aarch64.rs":"86048676e335944c37a63d0083d0f368ae10cec=
cefeed9debb3bbe08777fc682","src/unix/hermit/mod.rs":"859814f5df89e28fd4b345=
db399d181e11e7ed413841b6ff703a1fcbdbf013ae","src/unix/hermit/x86_64.rs":"ab=
832b7524e5fb15c49ff7431165ab1a37dc4667ae0b58e8306f4c539bfa110c","src/unix/l=
inux_like/android/b32/arm.rs":"433c1530f602cc5ed26610c58055dde0c4ceea5e0015=
0063b24ddc60768332a4","src/unix/linux_like/android/b32/mod.rs":"d971b98530a=
96f5892f98e1edc3133cf278d1b3939d77ab0a27a6323e0961715","src/unix/linux_like=
/android/b32/x86/align.rs":"812914e4241df82e32b12375ca3374615dc3a4bdd4cf31f=
0423c5815320c0dab","src/unix/linux_like/android/b32/x86/mod.rs":"8388bd3a0f=
cb5636bf965eee6dc95ae6860b85a2b555b387c868aa4d4e01ec89","src/unix/linux_lik=
e/android/b64/aarch64/align.rs":"2179c3b1608fa4bf68840482bfc2b2fa3ee2faf6fc=
ae3770f9e505cddca35c7b","src/unix/linux_like/android/b64/aarch64/mod.rs":"7=
8b837d764c5ab6d262f12c3824d8ef05a94c03b9342b88462454ca7a52d203d","src/unix/=
linux_like/android/b64/mod.rs":"d7bbbadafdb2cb2ff8e9cde3d89a03b9facaabb6b2d=
45705225d3ece1c5cce37","src/unix/linux_like/android/b64/x86_64/align.rs":"7=
169d07a9fd4716f7512719aec9fda5d8bed306dc0720ffc1b21696c9951e3c6","src/unix/=
linux_like/android/b64/x86_64/mod.rs":"06b22dc184e85a988ab969c75cadc52b9878=
faeab0eb9d21215878c95fe07c19","src/unix/linux_like/android/mod.rs":"f19d7ce=
918bd273709578b3cfc3be02192ff1b0d4561de0018796db3fe04b179","src/unix/linux_=
like/emscripten/align.rs":"86c95cbed7a7161b1f23ee06843e7b0e2340ad92b2cb86fe=
2a8ef3e0e8c36216","src/unix/linux_like/emscripten/mod.rs":"b71d37106750f57b=
c2dae4e9bcb473ff098ef48235827e41a1687a39825f0aa4","src/unix/linux_like/emsc=
ripten/no_align.rs":"0128e4aa721a9902754828b61b5ec7d8a86619983ed1e0544a85d3=
5b1051fad6","src/unix/linux_like/linux/align.rs":"213e70ebed2703e14a9cf1766=
6b21ecbf180b7bff7fa22fdbb36dbbd52df326d","src/unix/linux_like/linux/arch/ge=
neric/mod.rs":"b6efaded9b9631410a265dd52398d9bddb387d35b9f513e9c0432dc5233d=
da39","src/unix/linux_like/linux/arch/mips/mod.rs":"4588078cd2b1c046379c8a5=
5f728b838ff7f9151fcd8a1a5389683f1bda13550","src/unix/linux_like/linux/arch/=
mod.rs":"466a29622e47c6c7f1500682b2eb17f5566dd81b322cd6348f0fdd355cec593a",=
"src/unix/linux_like/linux/arch/powerpc/mod.rs":"c447e417cdb966a4da64e2755f=
d91f64ab14098f529098bf437053d7e08843db","src/unix/linux_like/linux/arch/spa=
rc/mod.rs":"9b89a4e798bb83b3e0f4052fa2d2bb6f5e9508da69a2e5b40b40795e4b4256a=
e","src/unix/linux_like/linux/gnu/align.rs":"e4a3c27fe20a57b8d612c34cb05bc7=
0646edb5cec7251957315afa53a7b9f936","src/unix/linux_like/linux/gnu/b32/arm/=
align.rs":"3fed009dc9af3cc81be7087da9d2d7d1f39845e4497e290259c5cdbae25f039d=
","src/unix/linux_like/linux/gnu/b32/arm/mod.rs":"877ff42aa56e599084df9a837=
4e1f3eaf8ec05a445f2887b10aee5744c093f02","src/unix/linux_like/linux/gnu/b32=
/mips/align.rs":"429fb5e005cb7143602d430098b6ebfb7d360685b194f333dfd587472a=
e954ee","src/unix/linux_like/linux/gnu/b32/mips/mod.rs":"9fdf7cf98bc9215385=
4ba04b2892009ec8bd855d12e1f68e91d3df2418ff6364","src/unix/linux_like/linux/=
gnu/b32/mod.rs":"ad23b70a5f849d5a6dbbf6d608221d2928b1834956d71d072bcc0eb941=
b0d856","src/unix/linux_like/linux/gnu/b32/powerpc.rs":"240468afe2fe42fd60a=
5568add147dc0ff097a6469ffadfdd5b9756dfd0323f2","src/unix/linux_like/linux/g=
nu/b32/riscv32/mod.rs":"dc99518121e911db120b157ad289e5e6964f3a42df53b091eaf=
071dbf5c04098","src/unix/linux_like/linux/gnu/b32/sparc/align.rs":"21adbed2=
7df73e2d1ed934aaf733a643003d7baf2bde9c48ea440895bcca6d41","src/unix/linux_l=
ike/linux/gnu/b32/sparc/mod.rs":"ae203726810da9312b484b0b7891a35527748c069f=
11e91d6d9afc73297b1cbb","src/unix/linux_like/linux/gnu/b32/x86/align.rs":"e=
4bafdc4a519a7922a81b37a62bbfd1177a2f620890eef8f1fbc47162e9eb413","src/unix/=
linux_like/linux/gnu/b32/x86/mod.rs":"eb8d002ccb3dfcf6c94e8826afe9f8c496a81=
3fa3d770c7dbc1024b45f870c2f","src/unix/linux_like/linux/gnu/b64/aarch64/ali=
gn.rs":"2179c3b1608fa4bf68840482bfc2b2fa3ee2faf6fcae3770f9e505cddca35c7b","=
src/unix/linux_like/linux/gnu/b64/aarch64/ilp32.rs":"21a21503ef2e095f437104=
4915d4bfb07a8578011cb5c713cd9f45947b0b5730","src/unix/linux_like/linux/gnu/=
b64/aarch64/lp64.rs":"e78c3cd197f44832338b414d1a9bc0d194f44c74db77bd7bf830c=
1fff62b2690","src/unix/linux_like/linux/gnu/b64/aarch64/mod.rs":"79991b2801=
0bfa01501dc5aa0ba2f7d8394539447398169a052c541cb21e20bd","src/unix/linux_lik=
e/linux/gnu/b64/mips64/align.rs":"7169d07a9fd4716f7512719aec9fda5d8bed306dc=
0720ffc1b21696c9951e3c6","src/unix/linux_like/linux/gnu/b64/mips64/mod.rs":=
"506050a20f8de53907a893d2711f1bed6e6c019580d5dde55f5dbdcfa40802f5","src/uni=
x/linux_like/linux/gnu/b64/mod.rs":"6336065423c26b59681fd2ce77f1117ea36af13=
e163fdadaefd108bd8191e8c8","src/unix/linux_like/linux/gnu/b64/powerpc64/ali=
gn.rs":"e29c4868bbecfa4a6cd8a2ad06193f3bbc78a468cc1dc9df83f002f1268130d9","=
src/unix/linux_like/linux/gnu/b64/powerpc64/mod.rs":"b53ee7b973b91c2175d164=
76c87547f8b36c2f0b716f456018fdd2728ab4d59f","src/unix/linux_like/linux/gnu/=
b64/riscv64/mod.rs":"7cbadd208b719c3cbab0432cb6bb236f1e79a01823790aa6b07366=
433ca0991b","src/unix/linux_like/linux/gnu/b64/s390x.rs":"59228db655d6a54d2=
0b9431c705ed7966f94b98d61e53b992c8f8ee05e176e77","src/unix/linux_like/linux=
/gnu/b64/sparc64/align.rs":"e29c4868bbecfa4a6cd8a2ad06193f3bbc78a468cc1dc9d=
f83f002f1268130d9","src/unix/linux_like/linux/gnu/b64/sparc64/mod.rs":"cb97=
50d9153428712eb32928fb85a1e67f9687f42ef698c3bb79951c219361d0","src/unix/lin=
ux_like/linux/gnu/b64/x86_64/align.rs":"7169d07a9fd4716f7512719aec9fda5d8be=
d306dc0720ffc1b21696c9951e3c6","src/unix/linux_like/linux/gnu/b64/x86_64/mo=
d.rs":"e4cbe0f5a3d100490f4f648bcadcd26899cf2f4760e6ee8ccb56ce16d598cc18","s=
rc/unix/linux_like/linux/gnu/b64/x86_64/not_x32.rs":"f775ac2b754f90b63053fe=
22afe1d19d306b5404995568d6805baa9249fb617f","src/unix/linux_like/linux/gnu/=
b64/x86_64/x32.rs":"4ba1b58468f55254717366f50fdfd3e4114fde6dc442a56681926c4=
d7e5b6b0d","src/unix/linux_like/linux/gnu/mod.rs":"13899330d3118c5e41854f89=
7c2e455f1b7db949384d36cff1d3042fd25a4475","src/unix/linux_like/linux/gnu/no=
_align.rs":"9cd223135de75315840ff9c3fd5441ba1cb632b96b5c85a76f8316c86653db2=
5","src/unix/linux_like/linux/mod.rs":"3aaa8a783a1ec2134e27a45d7de6296b97f9=
4e543bf5ec2c6c4ea5d24afb167f","src/unix/linux_like/linux/musl/b32/arm/align=
.rs":"3e8ac052c1043764776b54c93ba4260e061df998631737a897d9d47d54f7b80c","sr=
c/unix/linux_like/linux/musl/b32/arm/mod.rs":"8625290735a1294a50b34bb2b8d3b=
515305325187027cc577c72b0762f3a265e","src/unix/linux_like/linux/musl/b32/he=
xagon.rs":"dbc8aeb2bd3cd2269e0e95858c5ba0e0204b1ca0bcc5df517fb3f7f71134d044=
","src/unix/linux_like/linux/musl/b32/mips/align.rs":"429fb5e005cb7143602d4=
30098b6ebfb7d360685b194f333dfd587472ae954ee","src/unix/linux_like/linux/mus=
l/b32/mips/mod.rs":"65e3917900a9dfa0b4602e87d17305ebfa56a0c0dea61e3975099c9=
a6b9e967b","src/unix/linux_like/linux/musl/b32/mod.rs":"bac24312f6629ef76aa=
12dd41123061e3a77a244e7fda7bbfcdf5c57996b61e6","src/unix/linux_like/linux/m=
usl/b32/powerpc.rs":"e898b490365c84c0f1856ea8640463c558b5a247d845ca0c116776=
79272ea20f","src/unix/linux_like/linux/musl/b32/x86/align.rs":"08e77fbd7435=
d7dec2ff56932433bece3f02e47ce810f89004a275a86d39cbe1","src/unix/linux_like/=
linux/musl/b32/x86/mod.rs":"9a9f4926d5a1fbe406f5ab84742680fe4941ab929005e7f=
efc4e2bc6686ba5eb","src/unix/linux_like/linux/musl/b64/aarch64/align.rs":"7=
98a9229d70ce235394f2dd625f6c4c1e10519a94382dc5b091952b638ae2928","src/unix/=
linux_like/linux/musl/b64/aarch64/mod.rs":"cddcde68c13104f18edd611ce23e60a4=
f9b4fcae1baa57fb92284495d3a77850","src/unix/linux_like/linux/musl/b64/mips6=
4.rs":"4a5d543195da94aaa45be067d6d145c8092bebf3611898aa2beccc0cd55d5f3f","s=
rc/unix/linux_like/linux/musl/b64/mod.rs":"d847206d9f2d594c8febe780a938cdcc=
f40d985dafc11e90f235947735a09bac","src/unix/linux_like/linux/musl/b64/power=
pc64.rs":"37b08e5f5f84bc72b62c439ac9282db71ff59b80cd2775c5588941b7a135e6bc"=
,"src/unix/linux_like/linux/musl/b64/riscv64/mod.rs":"0c7ee2f0ef9868b2ee628=
748d20cfb2f5ed52da2c862500c9b8406269a89dc52","src/unix/linux_like/linux/mus=
l/b64/s390x.rs":"9b05b1fae6bcb7cb6d909b9973977fde01684175f3e26c27dcb44223cc=
3933d9","src/unix/linux_like/linux/musl/b64/x86_64/align.rs":"7169d07a9fd47=
16f7512719aec9fda5d8bed306dc0720ffc1b21696c9951e3c6","src/unix/linux_like/l=
inux/musl/b64/x86_64/mod.rs":"d3762f374cd3aaa1e0e3f79d36f9edc7fd4c8492e561e=
e4bd0e80e727eef4e9e","src/unix/linux_like/linux/musl/mod.rs":"c9a24828d62f2=
0e0cc0b835197f48bc31aa51db7ca4880341292271cc2df7aae","src/unix/linux_like/l=
inux/no_align.rs":"5ed04c53bf9d27da9b4d65ba7625c6ac53330162683d1b3df98950ca=
afa3507b","src/unix/linux_like/linux/non_exhaustive.rs":"181a05bf94fdb911db=
83ce793b993bd6548a4115b306a7ef3c10f745a8fea3e9","src/unix/linux_like/linux/=
uclibc/align.rs":"9ed16138d8e439bd90930845a65eafa7ebd67366e6bf633936d44014f=
6e4c959","src/unix/linux_like/linux/uclibc/arm/align.rs":"e4a3c27fe20a57b8d=
612c34cb05bc70646edb5cec7251957315afa53a7b9f936","src/unix/linux_like/linux=
/uclibc/arm/mod.rs":"6d83b37ebe54384269b5c5cc3c9c370f97bdc8c646c9aee8705f0d=
e1aca80067","src/unix/linux_like/linux/uclibc/arm/no_align.rs":"9cd223135de=
75315840ff9c3fd5441ba1cb632b96b5c85a76f8316c86653db25","src/unix/linux_like=
/linux/uclibc/mips/mips32/align.rs":"e4a3c27fe20a57b8d612c34cb05bc70646edb5=
cec7251957315afa53a7b9f936","src/unix/linux_like/linux/uclibc/mips/mips32/m=
od.rs":"edb86245bcc0e340de277e20752463cb4004104fe97737a71afdcc8b06bee703","=
src/unix/linux_like/linux/uclibc/mips/mips32/no_align.rs":"9cd223135de75315=
840ff9c3fd5441ba1cb632b96b5c85a76f8316c86653db25","src/unix/linux_like/linu=
x/uclibc/mips/mips64/align.rs":"a7bdcb18a37a2d91e64d5fad83ea3edc78f5412adb2=
8f77ab077dbb26dd08b2d","src/unix/linux_like/linux/uclibc/mips/mips64/mod.rs=
":"57d5e24ceb98e1ef90de231c4cf7f0275ac410d407607b240af6744504ec1f2a","src/u=
nix/linux_like/linux/uclibc/mips/mips64/no_align.rs":"4a18e3875698c85229599=
225ac3401a2a40da87e77b2ad4ef47c6fcd5a24ed30","src/unix/linux_like/linux/ucl=
ibc/mips/mod.rs":"4eea5256e47e485dd1e50c147a56697d286e0395a77674317e83a28fb=
43a12d8","src/unix/linux_like/linux/uclibc/mod.rs":"d2f5d6a3381bceec0b036bb=
3979c113c9c4144b134368e39b3f9f2fbef79f5cc","src/unix/linux_like/linux/uclib=
c/no_align.rs":"3f28637046524618adaa1012e26cb7ffe94b9396e6b518cccdc69d59f27=
4d709","src/unix/linux_like/linux/uclibc/x86_64/l4re.rs":"024eba5753e852dbd=
d212427351affe7e83f9916c1864bce414d7aa2618f192e","src/unix/linux_like/linux=
/uclibc/x86_64/mod.rs":"583349563b537104e2265be893f65e302e568a54f4022b8f14a=
2cf3200ac39ba","src/unix/linux_like/linux/uclibc/x86_64/other.rs":"42c3f71e=
58cabba373f6a55a623f3c31b85049eb64824c09c2b082b3b2d6a0a8","src/unix/linux_l=
ike/mod.rs":"dd4f7a1d66d8501b4a2c4e75e6e9305ed69f1002ae99e410596a6c63687859=
5a","src/unix/mod.rs":"22300f25d8f3adcdcd419222a2d5657e44c835eb4a0f90e05b69=
1c7bcc3a787e","src/unix/newlib/aarch64/mod.rs":"bb269c1468a9676442554600e87=
417079a787fe6220dfc23b3109639259e8710","src/unix/newlib/align.rs":"28aaf87f=
afbc6b312622719d472d8cf65f9e5467d15339df5f73e66d8502b28a","src/unix/newlib/=
arm/mod.rs":"c71be856bfd7f576b2db28af9f680211cbe6c1cac7d537bbc8020b39591af0=
7c","src/unix/newlib/espidf/mod.rs":"c198cb4beccdab483be61c102da74dc51ac80f=
766797e33021f3110394ed5a3d","src/unix/newlib/horizon/mod.rs":"95cb1e5f469a3=
d90ce27f03d8f70121c82edd26ab762db4aa373857b87e12d98","src/unix/newlib/mod.r=
s":"c33c46ad76627c24927b63953d9271e01bbc7f4967381675baf61442470a41cb","src/=
unix/newlib/no_align.rs":"e0743b2179495a9514bc3a4d1781e492878c4ec834ee0085d=
0891dd1712e82fb","src/unix/newlib/powerpc/mod.rs":"2d0f7af28b47f7a2a6c210eb=
d1c1f33ed8eac62e56b5af2b856de2ad3fdc5187","src/unix/no_align.rs":"c06e95373=
b9088266e0b14bba0954eef95f93fb2b01d951855e382d22de78e53","src/unix/redox/mo=
d.rs":"cc4794afa4fbed9d6612894ea476228f9d8533950162d6416fc4d16073e1dac4","s=
rc/unix/solarish/compat.rs":"b07a5bfac925eb012003a459ba6bddbd3bfa9c44b3394d=
a2ac5a602e54beae9c","src/unix/solarish/illumos.rs":"a092f6676a0d208e803819b=
f32f928714e93606fb9062cf55b5fb7a121d47481","src/unix/solarish/mod.rs":"01dc=
4208b5b0d901550dc9a6f060e7d446a303919287b328fda556d9dc569b34","src/unix/sol=
arish/solaris.rs":"65b005453aefa9b9d4fc860fe77cfec80d8c97a51342b15daf55fc3e=
808bb384","src/unix/solarish/x86_64.rs":"9d761573bdccbdd1ac61da571f7e96b537=
4df70241d9b72d45a069611f495085","src/vxworks/aarch64.rs":"98f0afdc511cd0255=
7e506c21fed6737585490a1dce7a9d4941d08c437762b99","src/vxworks/arm.rs":"acb7=
968ce99fe3f4abdf39d98f8133d21a4fba435b8ef7084777cb181d788e88","src/vxworks/=
mod.rs":"aea3da66f2140f2a82dfc9c58f6e6531d2dd9c15ea696e0f95a0d4a2a187b5b6",=
"src/vxworks/powerpc.rs":"acb7968ce99fe3f4abdf39d98f8133d21a4fba435b8ef7084=
777cb181d788e88","src/vxworks/powerpc64.rs":"98f0afdc511cd02557e506c21fed67=
37585490a1dce7a9d4941d08c437762b99","src/vxworks/x86.rs":"552f007f38317620b=
23889cb7c49d1d115841252439060122f52f434fbc6e5ba","src/vxworks/x86_64.rs":"0=
18d92be3ad628a129eff9f2f5dfbc0883d8b8e5f2fa917b900a7f98ed6b514a","src/wasi.=
rs":"817e7592e47f06ece5266fb35625c1aba0a23128e4015a9de2fbf94aba5f1312","src=
/windows/gnu/align.rs":"b2c13ec1b9f3b39a75c452c80c951dff9d0215e31d77e883b45=
02afb31794647","src/windows/gnu/mod.rs":"3c8c7edb7cdf5d0c44af936db2a9486958=
5c69dfabeef30571b4f4e38375767a","src/windows/mod.rs":"e3ad95ba54f76e74c3016=
11fe868d3d94f6b8939b03be672f568b06b10ae71c7","src/windows/msvc/mod.rs":"c06=
8271e00fca6b62bc4bf44bcf142cfc38caeded9b6c4e01d1ceef3ccf986f4","tests/const=
_fn.rs":"cb75a1f0864f926aebe79118fc34d51a0d1ade2c20a394e7774c7e545f21f1f4"}=
,"package":"565dbd88872dbe4cc8a46e527f26483c1d1f7afa6b884a3bd6cd893d4f98da7=
4"}
diff --git a/meta/recipes-devtools/rust/libstd-rs_1.60.0.bb b/meta/recipes-=
devtools/rust/libstd-rs_1.60.0.bb
deleted file mode 100644
index 0ff1fbd678..0000000000
--- a/meta/recipes-devtools/rust/libstd-rs_1.60.0.bb
+++ /dev/null
@@ -1,12 +0,0 @@
-require rust-source.inc
-require libstd-rs.inc
-
-# Check if libc crate is >=3D 0.2.17 before dropping this patch
-SRC_URI +=3D " \
-    file://0001-Add-400-series-syscalls-to-musl-riscv64-definitions.patch;=
patchdir=3D../../ \
-    file://0001-Update-checksums-for-modified-vendored-libc.patch;patchdir=
=3D../../ \
-"
-# libstd moved from src/libstd to library/std in 1.47+
-S =3D "${RUSTSRC}/library/std"
-
-BBCLASSEXTEND =3D "nativesdk"
\ No newline at end of file
diff --git a/meta/recipes-devtools/rust/libstd-rs_1.62.0.bb b/meta/recipes-=
devtools/rust/libstd-rs_1.62.0.bb
new file mode 100644
index 0000000000..eec0245ae1
--- /dev/null
+++ b/meta/recipes-devtools/rust/libstd-rs_1.62.0.bb
@@ -0,0 +1,7 @@
+require rust-source.inc
+require libstd-rs.inc
+
+# libstd moved from src/libstd to library/std in 1.47+
+S =3D "${RUSTSRC}/library/std"
+
+BBCLASSEXTEND =3D "nativesdk"
diff --git a/meta/recipes-devtools/rust/rust-cross-canadian_1.60.0.bb b/met=
a/recipes-devtools/rust/rust-cross-canadian_1.62.0.bb
similarity index 100%
rename from meta/recipes-devtools/rust/rust-cross-canadian_1.60.0.bb
rename to meta/recipes-devtools/rust/rust-cross-canadian_1.62.0.bb
diff --git a/meta/recipes-devtools/rust/rust-cross_1.60.0.bb b/meta/recipes=
-devtools/rust/rust-cross_1.62.0.bb
similarity index 100%
rename from meta/recipes-devtools/rust/rust-cross_1.60.0.bb
rename to meta/recipes-devtools/rust/rust-cross_1.62.0.bb
diff --git a/meta/recipes-devtools/rust/rust-crosssdk_1.60.0.bb b/meta/reci=
pes-devtools/rust/rust-crosssdk_1.62.0.bb
similarity index 100%
rename from meta/recipes-devtools/rust/rust-crosssdk_1.60.0.bb
rename to meta/recipes-devtools/rust/rust-crosssdk_1.62.0.bb
diff --git a/meta/recipes-devtools/rust/rust-llvm_1.60.0.bb b/meta/recipes-=
devtools/rust/rust-llvm_1.62.0.bb
similarity index 100%
rename from meta/recipes-devtools/rust/rust-llvm_1.60.0.bb
rename to meta/recipes-devtools/rust/rust-llvm_1.62.0.bb
diff --git a/meta/recipes-devtools/rust/rust-snapshot.inc b/meta/recipes-de=
vtools/rust/rust-snapshot.inc
index c69f34141b..3bd7b07cef 100644
--- a/meta/recipes-devtools/rust/rust-snapshot.inc
+++ b/meta/recipes-devtools/rust/rust-snapshot.inc
@@ -5,21 +5,21 @@
 ## The version is replicated here.
 ## TODO: find a way to add additional SRC_URIs based on the contents of an
 ##       earlier SRC_URI.
-RS_VERSION =3D "1.59.0"
-CARGO_VERSION =3D "1.59.0"
+RS_VERSION =3D "1.61.0"
+CARGO_VERSION =3D "1.61.0"
=20
 # TODO: Add hashes for other architecture toolchains as well. Make a scrip=
t?
-SRC_URI[rust-std-snapshot-x86_64.sha256sum] =3D "c854a9ee3dd8e5be9522c1581=
f75838c1cbae6dece3934b0004f138c4a5024a3"
-SRC_URI[rustc-snapshot-x86_64.sha256sum] =3D "838de1fef855ef7733a87862c257=
5e8da9f3fa11fd0a8ce05c293038ea92356e"
-SRC_URI[cargo-snapshot-x86_64.sha256sum] =3D "f56ebfb333ea46e4429377bf4b16=
a2ec889d61640a41c3093577cdd8f3c80b96"
+SRC_URI[rust-std-snapshot-x86_64.sha256sum] =3D "270b07aa5f2de52255a117e1e=
587138d77375ce0d09a1d7fead085f29b3977e9"
+SRC_URI[rustc-snapshot-x86_64.sha256sum] =3D "21c4613f389ed130fbaaf88f1e98=
4319f72b5fc10734569a5ba19e22ebb03abd"
+SRC_URI[cargo-snapshot-x86_64.sha256sum] =3D "9461727d754f865ef2a87479d40b=
be4c5176f80963b7c50b7797bc8940d7a0a0"
=20
-SRC_URI[rust-std-snapshot-aarch64.sha256sum] =3D "68e50dee4f6dddeab7330906=
e46022f57f2c004c847eae3f5b1bc82c59e43fc0"
-SRC_URI[rustc-snapshot-aarch64.sha256sum] =3D "d9789013ef6edd76eae3e7427b4=
8f420a036ab3ee2af883e60baa33a9e1c23d7"
-SRC_URI[cargo-snapshot-aarch64.sha256sum] =3D "11b8da4b90ff74c6c796a3d6c1f=
5150de23c411ed2546e10b301077b904191fd"
+SRC_URI[rust-std-snapshot-aarch64.sha256sum] =3D "57d60a519dbce12146849f7e=
72d55f3cffe9cdcbff8d58e90bb62d3c016bb5c0"
+SRC_URI[rustc-snapshot-aarch64.sha256sum] =3D "c996de6391e3ea94629fbc09b03=
bce186fcde345159f43ec95a82c500adb5e94"
+SRC_URI[cargo-snapshot-aarch64.sha256sum] =3D "a055e6cfd9b5f8938780db6179d=
2ef92990c714ce64278337d7edf3d29c8ab62"
=20
-SRC_URI[rust-std-snapshot-powerpc64le.sha256sum] =3D "15dee7705967e3351aff=
11c64ada30c4957b54066c7ee49b87be4b8155bd0a7d"
-SRC_URI[rustc-snapshot-powerpc64le.sha256sum] =3D "e5458f55e51f8baecab4ff1=
e43fae5c6e1c40d8171098ab633747ee0684b37bb"
-SRC_URI[cargo-snapshot-powerpc64le.sha256sum] =3D "fdab44481286db3ea8f4b6d=
409e648355009ef458188352d5e2c5799f7614fbd"
+SRC_URI[rust-std-snapshot-powerpc64le.sha256sum] =3D "36c0ccff14c804195075=
61db050f9533f0abd43fc50f3ddb859c10df74b1c351"
+SRC_URI[rustc-snapshot-powerpc64le.sha256sum] =3D "dc54893d747e4f3330515ca=
a75e404f78c6c5475a1216d1428f5e7ce1c2e9602"
+SRC_URI[cargo-snapshot-powerpc64le.sha256sum] =3D "09817011ff1ef4b7006387c=
7cabb6a059731792a9372533dec7d87e7f014444b"
=20
 SRC_URI +=3D " \
     https://static.rust-lang.org/dist/${RUST_STD_SNAPSHOT}.tar.xz;name=3Dr=
ust-std-snapshot-${RUST_BUILD_ARCH};subdir=3Drust-snapshot-components \
diff --git a/meta/recipes-devtools/rust/rust-source.inc b/meta/recipes-devt=
ools/rust/rust-source.inc
index f6f8b4bab5..fda26534e8 100644
--- a/meta/recipes-devtools/rust/rust-source.inc
+++ b/meta/recipes-devtools/rust/rust-source.inc
@@ -1,5 +1,5 @@
 SRC_URI +=3D "https://static.rust-lang.org/dist/rustc-${PV}-src.tar.xz;nam=
e=3Drust"
-SRC_URI[rust.sha256sum] =3D "a025876deccbcb3f288d8e02623ea321f94623f31305d=
3c5c6f17855bb9685db"
+SRC_URI[rust.sha256sum] =3D "6c00ef115c894c2645e60b5049a4f5dacf1dc0c993f30=
74f7ae4fdf4c755dd5e"
=20
 RUSTSRC =3D "${WORKDIR}/rustc-${PV}-src"
=20
diff --git a/meta/recipes-devtools/rust/rust-tools-cross-canadian_1.60.0.bb=
 b/meta/recipes-devtools/rust/rust-tools-cross-canadian_1.62.0.bb
similarity index 100%
rename from meta/recipes-devtools/rust/rust-tools-cross-canadian_1.60.0.bb
rename to meta/recipes-devtools/rust/rust-tools-cross-canadian_1.62.0.bb
diff --git a/meta/recipes-devtools/rust/rust.inc b/meta/recipes-devtools/ru=
st/rust.inc
index f39228e3c0..ea716d31f2 100644
--- a/meta/recipes-devtools/rust/rust.inc
+++ b/meta/recipes-devtools/rust/rust.inc
@@ -98,6 +98,10 @@ python do_configure() {
     config.set(target_section, "cxx", e(d.expand("${RUST_BUILD_CXX}")))
     config.set(target_section, "cc", e(d.expand("${RUST_BUILD_CC}")))
=20
+    # [llvm]
+    config.add_section("llvm")
+    config.set("llvm", "static-libstdcpp", e(False))
+
     # [rust]
     config.add_section("rust")
     config.set("rust", "rpath", e(True))
diff --git a/meta/recipes-devtools/rust/rust_1.60.0.bb b/meta/recipes-devto=
ols/rust/rust_1.62.0.bb
similarity index 100%
rename from meta/recipes-devtools/rust/rust_1.60.0.bb
rename to meta/recipes-devtools/rust/rust_1.62.0.bb
--=20
2.30.2


