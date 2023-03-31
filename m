Return-Path: <alex.kanavin@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 35CF0C77B60
	for <webhook@archiver.kernel.org>; Fri, 31 Mar 2023 05:26:56 +0000 (UTC)
Received: from mail-wr1-f44.google.com (mail-wr1-f44.google.com [209.85.221.44])
 by mx.groups.io with SMTP id smtpd.web10.47932.1680240405941744333
 for <openembedded-core@lists.openembedded.org>;
 Thu, 30 Mar 2023 22:26:46 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20210112 header.b=XwrBo5D/;
 spf=pass (domain: gmail.com, ip: 209.85.221.44, mailfrom: alex.kanavin@gmail.com)
Received: by mail-wr1-f44.google.com with SMTP id j24so21229881wrd.0
        for <openembedded-core@lists.openembedded.org>; Thu, 30 Mar 2023 22:26:45 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112; t=1680240404;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=L6O+1MDiKeXFr9uXZyNUxGH0BHYtFaIRHtEaMS5QirE=;
        b=XwrBo5D/sQ2KoI9Kgj2yYqgdam/FS1csu0vD+nw51sFMMQfP8a/yvt3BzwcEfk105B
         l8pEEuJ7LZzIYFFCgKmvja8LwNaLHIJmyjCZuPvxhwL6qk0ji1SBsRIC26ikG8qPiukq
         Yknj7asuMGP7W9A7fybd/NaLYwqCPgNFabCASrBRTFvL5EfGKlpj6QeD77rM4hdBZ/pS
         Kes9sAHmtaDF7SkF+HMAq+2nQHoDkxAG0025cVHgHEbhtG4usp5ue9BcSMZEqKn0tRi4
         8Jdje1Ne1FCHT37BRxLqRhAyr86feSAd7BLaZH5qoH6JdyO70KJxeXlslRhienHMqBCJ
         Wtxg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112; t=1680240404;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=L6O+1MDiKeXFr9uXZyNUxGH0BHYtFaIRHtEaMS5QirE=;
        b=RBmz1ELcl203XvA8idjtp8NndF37d6KQdQaU+iJk61goJpWf1qkHCDIym9b1HrShCM
         m/PKJBjpZNCY6+AxoQjzjdu9VXHC+h0waHRIht6OrTESEKfx0PxB60d0ENY2flESJZu6
         wPB52vXiAy8TlTWnihnieHTIDKg6Wo4ziEofLwNvTFWXpF9iFW8LogGDCZbVwOf7CvvY
         BHSyUJQwPLe9PtJL+MqkKwc0+UErJqy1YESCpxLIc1x8mSaBf2iaxitjRbcj1o5bOXqe
         lDhqUC7YRuz6Lxnt1f+snW3j4S6r3G9rxYUOfBdoll5tBZ2AkNV+RLqLh37D8Ngl+Gj/
         WtGg==
X-Gm-Message-State: AAQBX9dFVzXbfYCxhAiG8oU3Ws1esX1n/N8wQLLjOBHQlUYLTkrd4Urk
	tJGyi89IALODaPTDx+PmHDLIS+AIHgA=
X-Google-Smtp-Source: AKy350YZNbEMfoFY0zs3UxDxsQmA2uPH/OjEW/lFXbF4EqRvBAVYrAz7FoGaQmN+AKNnBsOPF/kcIg==
X-Received: by 2002:a5d:4dcb:0:b0:2ca:8da1:db96 with SMTP id f11-20020a5d4dcb000000b002ca8da1db96mr18147436wru.50.1680240403802;
        Thu, 30 Mar 2023 22:26:43 -0700 (PDT)
Received: from Zen2.lab.linutronix.de. (drugstore.linutronix.de. [80.153.143.164])
        by smtp.gmail.com with ESMTPSA id l5-20020a5d5265000000b002e55cc69169sm1146902wrc.38.2023.03.30.22.26.43
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 30 Mar 2023 22:26:43 -0700 (PDT)
From: Alexander Kanavin <alex.kanavin@gmail.com>
X-Google-Original-From: Alexander Kanavin <alex@linutronix.de>
To: openembedded-core@lists.openembedded.org
Cc: Alexander Kanavin <alex@linutronix.de>
Subject: [PATCH 4/7] rust: update 1.67.1 -> 1.68.1
Date: Fri, 31 Mar 2023 07:26:33 +0200
Message-Id: <20230331052636.978578-4-alex@linutronix.de>
X-Mailer: git-send-email 2.30.2
In-Reply-To: <20230331052636.978578-1-alex@linutronix.de>
References: <20230331052636.978578-1-alex@linutronix.de>
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Fri, 31 Mar 2023 05:26:56 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/179388

Rebase patches; one of the vendored crossbeam versions
has been removed upstream, and so crossbeam_atomic.patch
is adjusted accordingly.

Replace getrandom-open64.patch with a backport.

Signed-off-by: Alexander Kanavin <alex@linutronix.de>
---
 meta/conf/distro/include/tcmode-default.inc   |  2 +-
 .../rust/{cargo_1.67.1.bb =3D> cargo_1.68.1.bb} |  0
 .../rust/files/crossbeam_atomic.patch         | 31 ---------
 .../rust/files/getrandom-open64.patch         | 43 ++++++++----
 ...ibstd-rs_1.67.1.bb =3D> libstd-rs_1.68.1.bb} |  0
 ....67.1.bb =3D> rust-cross-canadian_1.68.1.bb} |  0
 ...ust-llvm_1.67.1.bb =3D> rust-llvm_1.68.1.bb} |  0
 meta/recipes-devtools/rust/rust-snapshot.inc  | 66 +++++++++----------
 meta/recipes-devtools/rust/rust-source.inc    |  2 +-
 .../rust/{rust_1.67.1.bb =3D> rust_1.68.1.bb}   |  0
 10 files changed, 65 insertions(+), 79 deletions(-)
 rename meta/recipes-devtools/rust/{cargo_1.67.1.bb =3D> cargo_1.68.1.bb} (=
100%)
 rename meta/recipes-devtools/rust/{libstd-rs_1.67.1.bb =3D> libstd-rs_1.68=
.1.bb} (100%)
 rename meta/recipes-devtools/rust/{rust-cross-canadian_1.67.1.bb =3D> rust=
-cross-canadian_1.68.1.bb} (100%)
 rename meta/recipes-devtools/rust/{rust-llvm_1.67.1.bb =3D> rust-llvm_1.68=
.1.bb} (100%)
 rename meta/recipes-devtools/rust/{rust_1.67.1.bb =3D> rust_1.68.1.bb} (10=
0%)

diff --git a/meta/conf/distro/include/tcmode-default.inc b/meta/conf/distro=
/include/tcmode-default.inc
index ef61377491c..f9e88ca4269 100644
--- a/meta/conf/distro/include/tcmode-default.inc
+++ b/meta/conf/distro/include/tcmode-default.inc
@@ -25,7 +25,7 @@ LINUXLIBCVERSION ?=3D "6.1%"
 QEMUVERSION ?=3D "7.2%"
 GOVERSION ?=3D "1.20%"
 LLVMVERSION ?=3D "15.%"
-RUSTVERSION ?=3D "1.67%"
+RUSTVERSION ?=3D "1.68%"
=20
 PREFERRED_VERSION_gcc ?=3D "${GCCVERSION}"
 PREFERRED_VERSION_gcc-cross-${TARGET_ARCH} ?=3D "${GCCVERSION}"
diff --git a/meta/recipes-devtools/rust/cargo_1.67.1.bb b/meta/recipes-devt=
ools/rust/cargo_1.68.1.bb
similarity index 100%
rename from meta/recipes-devtools/rust/cargo_1.67.1.bb
rename to meta/recipes-devtools/rust/cargo_1.68.1.bb
diff --git a/meta/recipes-devtools/rust/files/crossbeam_atomic.patch b/meta=
/recipes-devtools/rust/files/crossbeam_atomic.patch
index 51dd3c5f65a..0a2910391e2 100644
--- a/meta/recipes-devtools/rust/files/crossbeam_atomic.patch
+++ b/meta/recipes-devtools/rust/files/crossbeam_atomic.patch
@@ -48,34 +48,3 @@ Index: rustc-1.66.0-src/vendor/crossbeam-utils-0.8.12/.c=
argo-checksum.json
 \ No newline at end of file
 +{"files":{"CHANGELOG.md":"65d3e11edf9498bdbc930c8c3878b7d3a90c1a0b1698597=
dc4a396a547fa0948","Cargo.toml":"1e4259a5a47271e8ae040b91e17652b5a4e0e7e45c=
3f22de5008db276f3a50bf","LICENSE-APACHE":"a60eea817514531668d7e00765731449f=
e14d059d3249e0bc93b36de45f759f2","LICENSE-MIT":"5734ed989dfca1f625b40281ee9=
f4530f91b2411ec01cb748223e7eb87e201ab","README.md":"2a19af38a52dd965c2d66bb=
39f90a85b430b51ee9ccb29e9e1978ee7091e5087","benches/atomic_cell.rs":"c927eb=
3cd1e5ecc4b91adbc3bde98af15ffab4086190792ba64d5cde0e24df3d","build.rs":"108=
ba75398e3169c35b0e9754782391e4e4a9f9bf0ae2b216b55d836c4ac9ba8","no_atomic.r=
s":"f58085b9d0666ccf62e0ae17fb5dae937c0a86fcc55dc0ae04ad8659e696a49c","src/=
atomic/atomic_cell.rs":"0fc99463e633144c5d59d39c35b5477da1f1b90f5448cadc374=
54b7f4b97707e","src/atomic/consume.rs":"7a7736fcd64f6473dfea7653559ffc5e1a2=
a234df43835f8aa8734862145ac15","src/atomic/mod.rs":"94193895fa03cece415e8d7=
be700b73a9a8a7015774ca821253438607f9b0736","src/atomic/seq_lock.rs":"27182e=
6b87a9db73c5f6831759f8625f9fcdec3c2828204c444aef04f427735a","src/atomic/seq=
_lock_wide.rs":"9888dd03116bb89ca36d4ab8d5a0b5032107a2983a7eb8024454263b090=
80088","src/backoff.rs":"8fd5e3dcccc05860680e49c8498de8096bee9140bcfee8723d=
97117106a020d0","src/cache_padded.rs":"8bb8925e2df44224ffa29f31a2f9c08d88d8=
bd3df6c1ce47003598225055fdb5","src/lib.rs":"6f1bcf157abe06ad8458a53e865bf8e=
fab9fad4a9424790147cee8fefb3795d8","src/sync/mod.rs":"eca73c04f821859b8434d=
2b93db87d160dc6a3f65498ca201cd40d732ca4c134","src/sync/once_lock.rs":"c03dc=
9c05a817e087dccf8b682f7307501542805533551da3c2bab442bc40743","src/sync/park=
er.rs":"91f3a7d4ee8d9e06b6558d180e8a0df08ff5c6cef612b4ce4790f9f75cb34f84","=
src/sync/sharded_lock.rs":"6391b3b99b194b8e0888446c2dec340e4fb095753bcf0c1a=
80bc654f9c8be0e3","src/sync/wait_group.rs":"3e339aab014f50e214fea535c841755=
113ea058153378ed54e50a4acb403c937","src/thread.rs":"21cf9b3e965529e5c0a6ff8=
fc1ec846bfe0006c41deb238a149be8d07384e955","tests/atomic_cell.rs":"bf8bc869=
c922a1cbf929c3b741bae0cae98f2157f572b5a4eb2873d20a407c22","tests/cache_padd=
ed.rs":"1bfaff8354c8184e1ee1f902881ca9400b60effb273b0d3f752801a483d2b66d","=
tests/parker.rs":"6def4721287d9d70b1cfd63ebb34e1c83fbb3376edbad2bc8aac6ef69=
dd99d20","tests/sharded_lock.rs":"314adeb8a651a28935f7a49c9a261b8fa1fd82bf6=
a16c865a5aced6216d7e40b","tests/thread.rs":"9a7d7d3028c552fd834c68598b04a1c=
c252a816bc20ab62cec060d6cd09cab10","tests/wait_group.rs":"02661c2a820a5abe8=
b0c8fe15a6650aead707b57cdda0610d1b09a2680ed6969"},"package":"edbafec5fa1f19=
6ca66527c1b12c2ec4745ca14b50f1ad8f9f6f720b55d11fac"}
 \ No newline at end of file
-Index: rustc-1.66.0-src/vendor/crossbeam-utils-0.8.8/.cargo-checksum.json
-=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D
---- rustc-1.66.0-src.orig/vendor/crossbeam-utils-0.8.8/.cargo-checksum.json
-+++ rustc-1.66.0-src/vendor/crossbeam-utils-0.8.8/.cargo-checksum.json
-@@ -1 +1 @@
--{"files":{"CHANGELOG.md":"665a9f2c5fd37c98bef7c1b6eda753b58bb925d87e5b42d=
7298df973d7590631","Cargo.toml":"fe22292acd6a868e65baf225f90d56786789716428=
14d2d8e92a03954b8bdb40","LICENSE-APACHE":"a60eea817514531668d7e00765731449f=
e14d059d3249e0bc93b36de45f759f2","LICENSE-MIT":"5734ed989dfca1f625b40281ee9=
f4530f91b2411ec01cb748223e7eb87e201ab","README.md":"dfa9fbed47c344c134a63c8=
4b7c0e4651baeac1554b7b3266d0e38643743fc33","benches/atomic_cell.rs":"c927eb=
3cd1e5ecc4b91adbc3bde98af15ffab4086190792ba64d5cde0e24df3d","build.rs":"7e7=
4dc72343ff57e83d0a84a9fbdd9ff1645894165909999b4c3d2fba94bc96c","no_atomic.r=
s":"71b5f78fd701ce604aa766dd3d825fa5bed774282aae4d6c31d7acb01b1b242f","src/=
atomic/atomic_cell.rs":"01185588e0e16ba81425677966d0c11887dedc4ac0d4a65991a=
34057c418adc4","src/atomic/consume.rs":"7a7736fcd64f6473dfea7653559ffc5e1a2=
a234df43835f8aa8734862145ac15","src/atomic/mod.rs":"94193895fa03cece415e8d7=
be700b73a9a8a7015774ca821253438607f9b0736","src/atomic/seq_lock.rs":"27182e=
6b87a9db73c5f6831759f8625f9fcdec3c2828204c444aef04f427735a","src/atomic/seq=
_lock_wide.rs":"9888dd03116bb89ca36d4ab8d5a0b5032107a2983a7eb8024454263b090=
80088","src/backoff.rs":"7cc7754e15f69b52e92a70d4f49d1bc274693455a0933a2d7e=
b0605806566af3","src/cache_padded.rs":"6a512698115ad0d5a5b163dbd7a83247e1f1=
c146c4a30f3fc74b952e3b767b59","src/lib.rs":"6f1bcf157abe06ad8458a53e865bf8e=
fab9fad4a9424790147cee8fefb3795d8","src/sync/mod.rs":"59986f559a8f170a4b324=
7ab2eea2460b09809d87c8110ed88e4e7103d3519dc","src/sync/parker.rs":"3f997f5b=
41fec286ccedcf3d36f801d741387badb574820b8e3456117ecd9154","src/sync/sharded=
_lock.rs":"14be659744918d0b27db24c56b41c618b0f0484b6761da46561023d96c4c120f=
","src/sync/wait_group.rs":"32e946a7581c55f8aa9904527b92b177c538fa0cf7cbcfa=
1d1f25990582cb6ea","src/thread.rs":"6a7676fd4e50af63aec6f655121a10cd6e8c704=
f4677125388186ba58dc5842d","tests/atomic_cell.rs":"d64faa1ca889637346830803=
1220940d988aa3a1679ea25d2291a7a7d22bc51a","tests/cache_padded.rs":"1bfaff83=
54c8184e1ee1f902881ca9400b60effb273b0d3f752801a483d2b66d","tests/parker.rs"=
:"6def4721287d9d70b1cfd63ebb34e1c83fbb3376edbad2bc8aac6ef69dd99d20","tests/=
sharded_lock.rs":"eb6c5b59f007e0d290dd0f58758e8ccb5cacd38af34e3341368ced815=
f0c41be","tests/thread.rs":"9a7d7d3028c552fd834c68598b04a1cc252a816bc20ab62=
cec060d6cd09cab10","tests/wait_group.rs":"ad8f0cdfed31f9594a2e0737234d418f8=
b924d784a4db8d7e469deab8c95f5f8"},"package":"0bf124c720b7686e3c2663cf54062a=
b0f68a88af2fb6a030e87e30bf721fcb38"}
-\ No newline at end of file
-+{"files":{"CHANGELOG.md":"665a9f2c5fd37c98bef7c1b6eda753b58bb925d87e5b42d=
7298df973d7590631","Cargo.toml":"fe22292acd6a868e65baf225f90d56786789716428=
14d2d8e92a03954b8bdb40","LICENSE-APACHE":"a60eea817514531668d7e00765731449f=
e14d059d3249e0bc93b36de45f759f2","LICENSE-MIT":"5734ed989dfca1f625b40281ee9=
f4530f91b2411ec01cb748223e7eb87e201ab","README.md":"dfa9fbed47c344c134a63c8=
4b7c0e4651baeac1554b7b3266d0e38643743fc33","benches/atomic_cell.rs":"c927eb=
3cd1e5ecc4b91adbc3bde98af15ffab4086190792ba64d5cde0e24df3d","build.rs":"d98=
3d511c89607ce89473779d1ee195e3eb509cc4d3043b9efe6aa2f94c98158","no_atomic.r=
s":"71b5f78fd701ce604aa766dd3d825fa5bed774282aae4d6c31d7acb01b1b242f","src/=
atomic/atomic_cell.rs":"01185588e0e16ba81425677966d0c11887dedc4ac0d4a65991a=
34057c418adc4","src/atomic/consume.rs":"7a7736fcd64f6473dfea7653559ffc5e1a2=
a234df43835f8aa8734862145ac15","src/atomic/mod.rs":"94193895fa03cece415e8d7=
be700b73a9a8a7015774ca821253438607f9b0736","src/atomic/seq_lock.rs":"27182e=
6b87a9db73c5f6831759f8625f9fcdec3c2828204c444aef04f427735a","src/atomic/seq=
_lock_wide.rs":"9888dd03116bb89ca36d4ab8d5a0b5032107a2983a7eb8024454263b090=
80088","src/backoff.rs":"7cc7754e15f69b52e92a70d4f49d1bc274693455a0933a2d7e=
b0605806566af3","src/cache_padded.rs":"6a512698115ad0d5a5b163dbd7a83247e1f1=
c146c4a30f3fc74b952e3b767b59","src/lib.rs":"6f1bcf157abe06ad8458a53e865bf8e=
fab9fad4a9424790147cee8fefb3795d8","src/sync/mod.rs":"59986f559a8f170a4b324=
7ab2eea2460b09809d87c8110ed88e4e7103d3519dc","src/sync/parker.rs":"3f997f5b=
41fec286ccedcf3d36f801d741387badb574820b8e3456117ecd9154","src/sync/sharded=
_lock.rs":"14be659744918d0b27db24c56b41c618b0f0484b6761da46561023d96c4c120f=
","src/sync/wait_group.rs":"32e946a7581c55f8aa9904527b92b177c538fa0cf7cbcfa=
1d1f25990582cb6ea","src/thread.rs":"6a7676fd4e50af63aec6f655121a10cd6e8c704=
f4677125388186ba58dc5842d","tests/atomic_cell.rs":"d64faa1ca889637346830803=
1220940d988aa3a1679ea25d2291a7a7d22bc51a","tests/cache_padded.rs":"1bfaff83=
54c8184e1ee1f902881ca9400b60effb273b0d3f752801a483d2b66d","tests/parker.rs"=
:"6def4721287d9d70b1cfd63ebb34e1c83fbb3376edbad2bc8aac6ef69dd99d20","tests/=
sharded_lock.rs":"eb6c5b59f007e0d290dd0f58758e8ccb5cacd38af34e3341368ced815=
f0c41be","tests/thread.rs":"9a7d7d3028c552fd834c68598b04a1cc252a816bc20ab62=
cec060d6cd09cab10","tests/wait_group.rs":"ad8f0cdfed31f9594a2e0737234d418f8=
b924d784a4db8d7e469deab8c95f5f8"},"package":"0bf124c720b7686e3c2663cf54062a=
b0f68a88af2fb6a030e87e30bf721fcb38"}
-\ No newline at end of file
-Index: rustc-1.66.0-src/vendor/crossbeam-utils-0.8.8/build.rs
-=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D
---- rustc-1.66.0-src.orig/vendor/crossbeam-utils-0.8.8/build.rs
-+++ rustc-1.66.0-src/vendor/crossbeam-utils-0.8.8/build.rs
-@@ -29,7 +29,7 @@ use std::env;
- include!("no_atomic.rs");
-=20
- fn main() {
--    let target =3D match env::var("TARGET") {
-+    let mut target =3D match env::var("TARGET") {
-         Ok(target) =3D> target,
-         Err(e) =3D> {
-             println!(
-@@ -40,6 +40,8 @@ fn main() {
-             return;
-         }
-     };
-+    let vendor =3D env::var("TARGET_VENDOR").unwrap();
-+    target =3D target.replace(&vendor, "-unknown");
-=20
-     // Note that this is `no_*`, not `has_*`. This allows treating
-     // `cfg(target_has_atomic =3D "ptr")` as true when the build script d=
oesn't
diff --git a/meta/recipes-devtools/rust/files/getrandom-open64.patch b/meta=
/recipes-devtools/rust/files/getrandom-open64.patch
index 6fc981e2aa6..b35195e837e 100644
--- a/meta/recipes-devtools/rust/files/getrandom-open64.patch
+++ b/meta/recipes-devtools/rust/files/getrandom-open64.patch
@@ -6,24 +6,41 @@ therefore check for target env along when target OS is li=
nux before
 using open64, this is more available. Latest Musl has made these
 namespace changes [1]
=20
+There is no need for using LFS64 open explicitly as we are only using it
+for opening device files and not real files
+
 [1] https://git.musl-libc.org/cgit/musl/commit/?id=3D246f1c811448f37a44b41=
cd8df8d0ef9736d95f4
=20
-Upstream-Status: Submitted [https://github.com/rust-random/getrandom/pull/=
326]
+Upstream-Status: Backport [https://github.com/rust-random/getrandom/commit=
/7f73e3ccc1f53bfc419e4ddcfd343766aa5837b6]
 Signed-off-by: Khem Raj <raj.khem@gmail.com>
---- a/vendor/getrandom-0.2.0/.cargo-checksum.json
-+++ b/vendor/getrandom-0.2.0/.cargo-checksum.json
+Signed-off-by: Alex Kiernan <alex.kiernan@gmail.com>
+--- a/vendor/getrandom/.cargo-checksum.json
++++ b/vendor/getrandom/.cargo-checksum.json
 @@ -1 +1 @@
--{"files":{"CHANGELOG.md":"4a5b61c82668507beffc7ad33f602257013263d7847cf17=
a246ef1128ba27950","Cargo.toml":"b59322815506cf16acd6e0cbe2634dec1be0886e68=
6b51fa5cdf5a5ac9fdcf32","LICENSE-APACHE":"aaff376532ea30a0cd5330b9502ad4a4c=
8bf769c539c87ffe78819d188a18ebf","LICENSE-MIT":"209fbbe0ad52d9235e37badf9ca=
dfe4dbdc87203179c0899e738b39ade42177b","README.md":"e0bacefbe4310c23578c659=
26bda6e4318750f6718bb6b97ff9a4fa9056af6a6","benches/mod.rs":"5495735ff210a5=
0cab23c2cc84191ed910af7c30395a3d9d6095b722765b3864","build.rs":"90355b5e76d=
edd97d604cd83b4a0a5ab074bbd4dde9632ee2b56c87c175b1e14","src/bsd_arandom.rs"=
:"d2ee195acd80c7d1364a369ad0d2dad46f5f9f973f9d3960367413fd87acfcd6","src/cl=
oudabi.rs":"9201af65a607587aa8615ec92cfab9d176f4199f6799dad9ca743c51d175028=
b","src/custom.rs":"f75ef80ec024fe3c97c7faff79de9f7d457993ed3c5f69f21593e14=
0c8b62790","src/error.rs":"f40aa6cb36bc024285dc2e40349fdd3754db949a307ec738=
31ec253549d2b0a3","src/error_impls.rs":"733ed75ab89a9d0d5a7cc7abd85f31a23d7=
72ea9c1e7c10def1477207d19fd8b","src/fuchsia.rs":"470d8509deb5b06fa6417f294c=
0a49e0e35a580249a5d8944c3be5aa746f64ea","src/ios.rs":"cc46ee9c48ab746d2af34=
2a242e383b8de840045d3f52fd77ee337161367a1a1","src/lib.rs":"6aff4b429e4b1a07=
aad2ab7148d7cc9d0987b230597649af42041508320592e0","src/linux_android.rs":"3=
9cb80999c8534145240a350976d261b8924436bf9a4563960c7bd8c2c83c773","src/macos=
.rs":"b692f2fcc2319a5195f47751d5bd7dd87c7c24a61d14fa4e3dbc992ae66212b7","sr=
c/openbsd.rs":"066b2dd395c190444a658bb0b52a052eabbd68ea5a534fb729c7e5373abc=
0a6a","src/rdrand.rs":"79d23183b1905d61bd9df9729dc798505a2ed750d3339e342ab1=
44e1709827e4","src/solaris_illumos.rs":"9c7004446fabe5a7a21c73d5a65d7e2115b=
5bd1d1dbb735c984cab3dba239785","src/stdweb.rs":"f140081e47cfbb61937212e7840=
391bce5adf7829039d732d62b82a19e567dfa","src/test_common.rs":"895d71c06722e3=
a6f365999d29430f37f571aeb1eb4a525777b760005c9818be","src/test_rdrand.rs":"8=
c8df6de836463a41808396016428bf0a2a69c715ae96e7e0e7598fcea61ace8","src/use_f=
ile.rs":"c9fe635a83614be6f303e40f98b8e678c36ac6d9724b024430d3ea1ad1510add",=
"src/util.rs":"da6964dc1523f1cb8d26365fa6a8ece46360587e6974931624b271f0c72c=
da8b","src/util_libc.rs":"d851394bc9c43dc09afde1e03401aa6c207858ec58fdffbc5=
131911b116418c7","src/vxworks.rs":"a5aa0e40f890e0f35626458bb656a3340b8af311=
1e4bacd2e12505a8d50a3505","src/wasi.rs":"3413e5a391b156f5d05600f4651f7f8eb4=
df2c8984fca7766ca50c0cfe0b2e9c","src/wasm-bindgen.rs":"0648388724c46697a9b3=
c654b8d931b2bf187a3193ca1888221d4529f764e376","src/windows.rs":"39dfae2814d=
958993619c3654bb39745de897971aea7a414fa32f90770850ce2","src/windows_uwp.rs"=
:"672f41a0fac79a71bfaaecad59826c948b8538f69a0133ab1c09a1865ecd6114"},"packa=
ge":"ee8025cf36f917e6a52cce185b7c7177689b838b7ec138364e50cc2277a56cf4"}
+-{"files":{"CHANGELOG.md":"cb054908f44d0e7f229dcc4580bcc4f2c3e2da198c84292=
710f730b33cc3d5f6","Cargo.toml":"708a5d9c89443b937aa50260e26a01f9ebfdd50a7a=
e312956795834e3187baf3","LICENSE-APACHE":"aaff376532ea30a0cd5330b9502ad4a4c=
8bf769c539c87ffe78819d188a18ebf","LICENSE-MIT":"209fbbe0ad52d9235e37badf9ca=
dfe4dbdc87203179c0899e738b39ade42177b","README.md":"7ae74633326a22fd6298d7f=
209fb14884277bd98049795f444945acbb2b0dfbd","benches/mod.rs":"c01b05c6d690a4=
b8937d25252f1385a6bff378517318ce832ea520036aabd571","src/3ds.rs":"0f48fc15f=
89b518fb92e06aaa4838b62dc073598e8f288df56ad1e5a9251af1e","src/bsd_arandom.r=
s":"d90c419d4def20f83e7535cd3f5ec07035045011a50c3652951d196a120c5d3e","src/=
custom.rs":"ce4640776d36872dbbd5e194bf29f6bcda3ef4549ca04fe59f5aeab1dea1d82=
1","src/dragonfly.rs":"47f933eac189f6ea48ecf021efd0747ebce1b43d1bece6bbf72a=
951bab705987","src/error.rs":"ff09a7e02d7aff3e45eca6bbef6c686cc46f3c2371a08=
97a856e4dec4b942e46","src/error_impls.rs":"9c34832ebb99cd5e31bc5c8ffc5beb5b=
3fa6f7ff0226aaa1cdf8e10e6d64b324","src/espidf.rs":"19f101486584fde6dad962f4=
d9792de168658047312106641a5caf6866a5bbcf","src/fuchsia.rs":"470d8509deb5b06=
fa6417f294c0a49e0e35a580249a5d8944c3be5aa746f64ea","src/ios.rs":"4bad4f5c09=
6a50338b86aeac91a937c18bc55b9555e6f34806ad13732e64523d","src/js.rs":"370610=
a19045012c87c986279aad6b150cd728a44015dcc5779256e4a2e6629b","src/lib.rs":"8=
e5c2c8edcbdbf2cee46b86d96d951cc6d5c00f7c11cfc9c27de27e756b5c4cc","src/linux=
_android.rs":"ec24575aa4ae71b6991290dadfdea931b05397c3faababf24bd794f1a9624=
835","src/macos.rs":"6c09827ad5292cd022e063efa79523bfdb50ed08b9867ebaa007cd=
321b8d218e","src/openbsd.rs":"450a23ead462d4a840fee4aa0bfdab1e3d88c8f48e4bb=
608d457429ddeca69c0","src/rdrand.rs":"79d23183b1905d61bd9df9729dc798505a2ed=
750d3339e342ab144e1709827e4","src/solaris_illumos.rs":"d52fee9dd7d661f960c0=
1894edd563c1ff8a512c111f7803092d9aa2ff98718e","src/solid.rs":"997035d54c976=
2d22a5a14f54e7fbed4dd266cdeacbdf6aab7d8aee05537e8ba","src/use_file.rs":"16e=
42eb0a56e375c330c1ca8eb58c444e82ef3ad35230b961fdba96a02a68804","src/util.rs=
":"da6964dc1523f1cb8d26365fa6a8ece46360587e6974931624b271f0c72cda8b","src/u=
til_libc.rs":"2a63ac0e6dab16b85c4728b79a16e0640301e8b876f151b0a1db0b4394fa2=
19f","src/vxworks.rs":"a5aa0e40f890e0f35626458bb656a3340b8af3111e4bacd2e125=
05a8d50a3505","src/wasi.rs":"dfdd0a870581948bd03abe64d49ca4295d9cfa26e09b97=
a526fd5e17148ad9ca","src/windows.rs":"d0b4f2afd1959660aa9abcd9477764bd7dc0b=
7d7048aee748804b37963c77c6f","tests/common/mod.rs":"b6beee8f535d2d094a65711=
fe0af91a6fc220aa09729ed7269fe33cafdc9177f","tests/custom.rs":"9f2c0193193f6=
bcf641116ca0b3653b33d2015e0e98ce107ee1d1f60c5eeae3a","tests/normal.rs":"9e1=
c4b1e468a09ed0225370dfb6608f8b8135e0fabb09bbc1a718105164aade6","tests/rdran=
d.rs":"4474ccebf9d33c89288862a7e367018405968dddc55c7c6f97e21b5fe2264601"},"=
package":"c05aeb6a22b8f62540c194aac980f2115af067bfe15a0734d7277a768d396b31"}
+\ No newline at end of file
++{"files":{"CHANGELOG.md":"cb054908f44d0e7f229dcc4580bcc4f2c3e2da198c84292=
710f730b33cc3d5f6","Cargo.toml":"708a5d9c89443b937aa50260e26a01f9ebfdd50a7a=
e312956795834e3187baf3","LICENSE-APACHE":"aaff376532ea30a0cd5330b9502ad4a4c=
8bf769c539c87ffe78819d188a18ebf","LICENSE-MIT":"209fbbe0ad52d9235e37badf9ca=
dfe4dbdc87203179c0899e738b39ade42177b","README.md":"7ae74633326a22fd6298d7f=
209fb14884277bd98049795f444945acbb2b0dfbd","benches/mod.rs":"c01b05c6d690a4=
b8937d25252f1385a6bff378517318ce832ea520036aabd571","src/3ds.rs":"0f48fc15f=
89b518fb92e06aaa4838b62dc073598e8f288df56ad1e5a9251af1e","src/bsd_arandom.r=
s":"d90c419d4def20f83e7535cd3f5ec07035045011a50c3652951d196a120c5d3e","src/=
custom.rs":"ce4640776d36872dbbd5e194bf29f6bcda3ef4549ca04fe59f5aeab1dea1d82=
1","src/dragonfly.rs":"47f933eac189f6ea48ecf021efd0747ebce1b43d1bece6bbf72a=
951bab705987","src/error.rs":"ff09a7e02d7aff3e45eca6bbef6c686cc46f3c2371a08=
97a856e4dec4b942e46","src/error_impls.rs":"9c34832ebb99cd5e31bc5c8ffc5beb5b=
3fa6f7ff0226aaa1cdf8e10e6d64b324","src/espidf.rs":"19f101486584fde6dad962f4=
d9792de168658047312106641a5caf6866a5bbcf","src/fuchsia.rs":"470d8509deb5b06=
fa6417f294c0a49e0e35a580249a5d8944c3be5aa746f64ea","src/ios.rs":"4bad4f5c09=
6a50338b86aeac91a937c18bc55b9555e6f34806ad13732e64523d","src/js.rs":"370610=
a19045012c87c986279aad6b150cd728a44015dcc5779256e4a2e6629b","src/lib.rs":"8=
e5c2c8edcbdbf2cee46b86d96d951cc6d5c00f7c11cfc9c27de27e756b5c4cc","src/linux=
_android.rs":"ec24575aa4ae71b6991290dadfdea931b05397c3faababf24bd794f1a9624=
835","src/macos.rs":"6c09827ad5292cd022e063efa79523bfdb50ed08b9867ebaa007cd=
321b8d218e","src/openbsd.rs":"450a23ead462d4a840fee4aa0bfdab1e3d88c8f48e4bb=
608d457429ddeca69c0","src/rdrand.rs":"79d23183b1905d61bd9df9729dc798505a2ed=
750d3339e342ab144e1709827e4","src/solaris_illumos.rs":"d52fee9dd7d661f960c0=
1894edd563c1ff8a512c111f7803092d9aa2ff98718e","src/solid.rs":"997035d54c976=
2d22a5a14f54e7fbed4dd266cdeacbdf6aab7d8aee05537e8ba","src/use_file.rs":"16e=
42eb0a56e375c330c1ca8eb58c444e82ef3ad35230b961fdba96a02a68804","src/util.rs=
":"da6964dc1523f1cb8d26365fa6a8ece46360587e6974931624b271f0c72cda8b","src/u=
til_libc.rs":"a47b20e73637fed248405650f56358f3339e511b217b7ba80e32011d8ee2c=
a22","src/vxworks.rs":"a5aa0e40f890e0f35626458bb656a3340b8af3111e4bacd2e125=
05a8d50a3505","src/wasi.rs":"dfdd0a870581948bd03abe64d49ca4295d9cfa26e09b97=
a526fd5e17148ad9ca","src/windows.rs":"d0b4f2afd1959660aa9abcd9477764bd7dc0b=
7d7048aee748804b37963c77c6f","tests/common/mod.rs":"b6beee8f535d2d094a65711=
fe0af91a6fc220aa09729ed7269fe33cafdc9177f","tests/custom.rs":"9f2c0193193f6=
bcf641116ca0b3653b33d2015e0e98ce107ee1d1f60c5eeae3a","tests/normal.rs":"9e1=
c4b1e468a09ed0225370dfb6608f8b8135e0fabb09bbc1a718105164aade6","tests/rdran=
d.rs":"4474ccebf9d33c89288862a7e367018405968dddc55c7c6f97e21b5fe2264601"},"=
package":"c05aeb6a22b8f62540c194aac980f2115af067bfe15a0734d7277a768d396b31"}
 \ No newline at end of file
-+{"files":{"CHANGELOG.md":"4a5b61c82668507beffc7ad33f602257013263d7847cf17=
a246ef1128ba27950","Cargo.toml":"b59322815506cf16acd6e0cbe2634dec1be0886e68=
6b51fa5cdf5a5ac9fdcf32","LICENSE-APACHE":"aaff376532ea30a0cd5330b9502ad4a4c=
8bf769c539c87ffe78819d188a18ebf","LICENSE-MIT":"209fbbe0ad52d9235e37badf9ca=
dfe4dbdc87203179c0899e738b39ade42177b","README.md":"e0bacefbe4310c23578c659=
26bda6e4318750f6718bb6b97ff9a4fa9056af6a6","benches/mod.rs":"5495735ff210a5=
0cab23c2cc84191ed910af7c30395a3d9d6095b722765b3864","build.rs":"90355b5e76d=
edd97d604cd83b4a0a5ab074bbd4dde9632ee2b56c87c175b1e14","src/bsd_arandom.rs"=
:"d2ee195acd80c7d1364a369ad0d2dad46f5f9f973f9d3960367413fd87acfcd6","src/cl=
oudabi.rs":"9201af65a607587aa8615ec92cfab9d176f4199f6799dad9ca743c51d175028=
b","src/custom.rs":"f75ef80ec024fe3c97c7faff79de9f7d457993ed3c5f69f21593e14=
0c8b62790","src/error.rs":"f40aa6cb36bc024285dc2e40349fdd3754db949a307ec738=
31ec253549d2b0a3","src/error_impls.rs":"733ed75ab89a9d0d5a7cc7abd85f31a23d7=
72ea9c1e7c10def1477207d19fd8b","src/fuchsia.rs":"470d8509deb5b06fa6417f294c=
0a49e0e35a580249a5d8944c3be5aa746f64ea","src/ios.rs":"cc46ee9c48ab746d2af34=
2a242e383b8de840045d3f52fd77ee337161367a1a1","src/lib.rs":"6aff4b429e4b1a07=
aad2ab7148d7cc9d0987b230597649af42041508320592e0","src/linux_android.rs":"3=
9cb80999c8534145240a350976d261b8924436bf9a4563960c7bd8c2c83c773","src/macos=
.rs":"b692f2fcc2319a5195f47751d5bd7dd87c7c24a61d14fa4e3dbc992ae66212b7","sr=
c/openbsd.rs":"066b2dd395c190444a658bb0b52a052eabbd68ea5a534fb729c7e5373abc=
0a6a","src/rdrand.rs":"79d23183b1905d61bd9df9729dc798505a2ed750d3339e342ab1=
44e1709827e4","src/solaris_illumos.rs":"9c7004446fabe5a7a21c73d5a65d7e2115b=
5bd1d1dbb735c984cab3dba239785","src/stdweb.rs":"f140081e47cfbb61937212e7840=
391bce5adf7829039d732d62b82a19e567dfa","src/test_common.rs":"895d71c06722e3=
a6f365999d29430f37f571aeb1eb4a525777b760005c9818be","src/test_rdrand.rs":"8=
c8df6de836463a41808396016428bf0a2a69c715ae96e7e0e7598fcea61ace8","src/use_f=
ile.rs":"c9fe635a83614be6f303e40f98b8e678c36ac6d9724b024430d3ea1ad1510add",=
"src/util.rs":"da6964dc1523f1cb8d26365fa6a8ece46360587e6974931624b271f0c72c=
da8b","src/util_libc.rs":"c602b47e2958fa94443b3690faddf52a8c545689d18579c86=
dd8a07927c145b1","src/vxworks.rs":"a5aa0e40f890e0f35626458bb656a3340b8af311=
1e4bacd2e12505a8d50a3505","src/wasi.rs":"3413e5a391b156f5d05600f4651f7f8eb4=
df2c8984fca7766ca50c0cfe0b2e9c","src/wasm-bindgen.rs":"0648388724c46697a9b3=
c654b8d931b2bf187a3193ca1888221d4529f764e376","src/windows.rs":"39dfae2814d=
958993619c3654bb39745de897971aea7a414fa32f90770850ce2","src/windows_uwp.rs"=
:"672f41a0fac79a71bfaaecad59826c948b8538f69a0133ab1c09a1865ecd6114"},"packa=
ge":"ee8025cf36f917e6a52cce185b7c7177689b838b7ec138364e50cc2277a56cf4"}
---- a/vendor/getrandom-0.2.0/src/util_libc.rs
-+++ b/vendor/getrandom-0.2.0/src/util_libc.rs
-@@ -97,7 +97,7 @@ impl Weak {
+--- a/vendor/getrandom/src/util_libc.rs
++++ b/vendor/getrandom/src/util_libc.rs
+@@ -135,19 +135,11 @@ impl Weak {
+     }
  }
=20=20
- cfg_if! {
+-cfg_if! {
 -    if #[cfg(any(target_os =3D "linux", target_os =3D "emscripten"))] {
-+    if #[cfg(any(all(target_os =3D "linux", not(target_env =3D "musl")), =
target_os =3D "emscripten"))] {
-         use libc::open64 as open;
-     } else {
-         use libc::open;
+-        use libc::open64 as open;
+-    } else {
+-        use libc::open;
+-    }
+-}
+-
+ // SAFETY: path must be null terminated, FD must be manually closed.
+ pub unsafe fn open_readonly(path: &str) -> Result<libc::c_int, Error> {
+     debug_assert_eq!(path.as_bytes().last(), Some(&0));
+     loop {
+-        let fd =3D open(path.as_ptr() as *const _, libc::O_RDONLY | libc:=
:O_CLOEXEC);
++        let fd =3D libc::open(path.as_ptr() as *const _, libc::O_RDONLY |=
 libc::O_CLOEXEC);
+         if fd >=3D 0 {
+             return Ok(fd);
+         }
diff --git a/meta/recipes-devtools/rust/libstd-rs_1.67.1.bb b/meta/recipes-=
devtools/rust/libstd-rs_1.68.1.bb
similarity index 100%
rename from meta/recipes-devtools/rust/libstd-rs_1.67.1.bb
rename to meta/recipes-devtools/rust/libstd-rs_1.68.1.bb
diff --git a/meta/recipes-devtools/rust/rust-cross-canadian_1.67.1.bb b/met=
a/recipes-devtools/rust/rust-cross-canadian_1.68.1.bb
similarity index 100%
rename from meta/recipes-devtools/rust/rust-cross-canadian_1.67.1.bb
rename to meta/recipes-devtools/rust/rust-cross-canadian_1.68.1.bb
diff --git a/meta/recipes-devtools/rust/rust-llvm_1.67.1.bb b/meta/recipes-=
devtools/rust/rust-llvm_1.68.1.bb
similarity index 100%
rename from meta/recipes-devtools/rust/rust-llvm_1.67.1.bb
rename to meta/recipes-devtools/rust/rust-llvm_1.68.1.bb
diff --git a/meta/recipes-devtools/rust/rust-snapshot.inc b/meta/recipes-de=
vtools/rust/rust-snapshot.inc
index d5317279db6..cb49d8e7c3e 100644
--- a/meta/recipes-devtools/rust/rust-snapshot.inc
+++ b/meta/recipes-devtools/rust/rust-snapshot.inc
@@ -4,51 +4,51 @@
 ## The exact (previous) version that has been used is specified in the sou=
rce tarball.
 ## The version is replicated here.
=20
-SNAPSHOT_VERSION =3D "1.66.1"
+SNAPSHOT_VERSION =3D "1.67.1"
=20
-SRC_URI[cargo-snapshot-aarch64.sha256sum] =3D "61736a6ec61a4eaa9a7b3f219d9=
f8166ae97c1acd54b5e904c15fb8caff06250"
-SRC_URI[rust-std-snapshot-aarch64.sha256sum] =3D "9d96ba6a5a255339cd04af07=
9d906753d56c85503c727279c227d24bd4987e24"
-SRC_URI[rustc-snapshot-aarch64.sha256sum] =3D "b4d842594ba11a84712c2d1bbf7=
f7945cfcc2485c72861a23b488fefba5c6a45"
+SRC_URI[cargo-snapshot-aarch64.sha256sum] =3D "b04e33d9beb3cd97501399c17ca=
297f0adc12a7c0ea16351b8821fc9228de477"
+SRC_URI[rust-std-snapshot-aarch64.sha256sum] =3D "35027409400faaaa38ea2855=
b92dea6b553b2e656dff735da730f67ac02e57e6"
+SRC_URI[rustc-snapshot-aarch64.sha256sum] =3D "053ccc4ab81ea9c16906205c2b6=
53a93b5b44fe4f67f9e45153a2687b7efb65a"
=20
-SRC_URI[cargo-snapshot-i686.sha256sum] =3D "fb0c1aa922c4e41fead9d350907693=
09cb45648d6f77ccbe8d2ba125a75cc2af"
-SRC_URI[rust-std-snapshot-i686.sha256sum] =3D "b32cbbb9002f8a20b302823a2ff=
122a91f077b5e1a7bc1340de690ded86bf10b"
-SRC_URI[rustc-snapshot-i686.sha256sum] =3D "e2ab464f43d6319ddb9796cbfacd44=
4dc40f3d0e7503d672c23ecbe0daf11e1c"
+SRC_URI[cargo-snapshot-i686.sha256sum] =3D "36db46e19e8573ea113c38d88f66de=
f5fad848721b3c6dd69361f197b7a02f80"
+SRC_URI[rust-std-snapshot-i686.sha256sum] =3D "aab2d7aa76793e78c9c8810e93e=
d8978f6422843b1277e9c60337b0f943a4409"
+SRC_URI[rustc-snapshot-i686.sha256sum] =3D "0c77fde6daa80825f8cb81a5525c99=
db238a3ab4f0b226470964062e74603dd6"
=20
-SRC_URI[cargo-snapshot-mips.sha256sum] =3D "0f03d6d35b6044dc81a4d5eb9bd42c=
9d1e8c0e85363f960ff921ebe46294ae45"
-SRC_URI[rust-std-snapshot-mips.sha256sum] =3D "e6029b4cec5d6c06c34a0dbec61=
4fa252fdc8cf31013d6e561112cf90f742568"
-SRC_URI[rustc-snapshot-mips.sha256sum] =3D "64ad92525ae1f018e08c055d7892e0=
fc613437bde8cf614b1c2a8986488290e7"
+SRC_URI[cargo-snapshot-mips.sha256sum] =3D "06778d8aedd8e7850f0175483efa01=
5cc2eeb69e6027e3d94352d89d2a510fc5"
+SRC_URI[rust-std-snapshot-mips.sha256sum] =3D "048b3da190212b742f7a052618b=
57683dc96ee2b6c25fc7f5ae751143cb79bad"
+SRC_URI[rustc-snapshot-mips.sha256sum] =3D "d3b7501acdfda6e4e9d8ee64d9de71=
6579791d567c66f1273e601a55c2e23ca8"
=20
-SRC_URI[cargo-snapshot-mipsel.sha256sum] =3D "74d757a456d2fbb418c253db203c=
0bb3f71d797e4ab3e2804b6c594a18e0f199"
-SRC_URI[rust-std-snapshot-mipsel.sha256sum] =3D "8bfa3d6079c6df049978fe61b=
1ccaf992aecd006e23df2439ecfc883bd8bc31b"
-SRC_URI[rustc-snapshot-mipsel.sha256sum] =3D "f2674d60ce52c49048e9823af57a=
ae24bb6722e8998783819ec884222caeccf3"
+SRC_URI[cargo-snapshot-mipsel.sha256sum] =3D "7bf800ddd0ee6b69bb66fb7cdf12=
ae045db025fdb866e00c62b63a1eb99f7d64"
+SRC_URI[rust-std-snapshot-mipsel.sha256sum] =3D "94410897626546dde806a1142=
99c3c32abb6b4b294af5daea5c4d136751fe063"
+SRC_URI[rustc-snapshot-mipsel.sha256sum] =3D "eb34b5d901807e1e47fb6ac68657=
1f21b2a80ad831583485872c9e9c59291776"
=20
-SRC_URI[cargo-snapshot-powerpc.sha256sum] =3D "f771fa4294c8e0d5d0e58129fe9=
d4e0913566dd43523b6f0af19a08004004df8"
-SRC_URI[rust-std-snapshot-powerpc.sha256sum] =3D "417b12a9bf090d694514937c=
d8c321ed625f155248f63c0de8207b17fa4b35b1"
-SRC_URI[rustc-snapshot-powerpc.sha256sum] =3D "ff16d02c100086175b9fbcfff4d=
3705fb4f5b58a6506ec7667dc86c56b8bb3c7"
+SRC_URI[cargo-snapshot-powerpc.sha256sum] =3D "b134c63817805f59821024d3771=
96f2821ae53f88d0a4a2ebdbd8152433984b0"
+SRC_URI[rust-std-snapshot-powerpc.sha256sum] =3D "26efe78c09ed36da34964c0d=
023cf9aa404766ab790a94d9becd373b8879cb5a"
+SRC_URI[rustc-snapshot-powerpc.sha256sum] =3D "8f6212756d152f6876a6456f4d3=
f93ef8b4b7e5c93b96fe515cb8183c0612d7b"
=20
-SRC_URI[cargo-snapshot-powerpc64.sha256sum] =3D "9a933d39e6b028e73db9cc095=
9af84128824e0b11554e3a0171cad7635a343c7"
-SRC_URI[rust-std-snapshot-powerpc64.sha256sum] =3D "7074c4ea9fcc683ceb0adc=
ca6ba07544a1d91f0e5d2a4cf14c81eb14316ebf35"
-SRC_URI[rustc-snapshot-powerpc64.sha256sum] =3D "f5bff79d517e2f72183946288=
1331bdc1b8323a434f4ebe0529f93213adb2a24"
+SRC_URI[cargo-snapshot-powerpc64.sha256sum] =3D "2cd84deb15ed16fc4a1d8a9de=
45577ba4d9f245de4f7efb3dc6611eec437eef3"
+SRC_URI[rust-std-snapshot-powerpc64.sha256sum] =3D "135f5e6ab6d8f077a14521=
d387d3f31831abdb840ca4e6a15b6f0d0d5b7dbc81"
+SRC_URI[rustc-snapshot-powerpc64.sha256sum] =3D "bdb08b549df5d7a421637efb0=
be00211b5ca9cf1e4214d66eb762b92e0f9b3fe"
=20
-SRC_URI[cargo-snapshot-powerpc64le.sha256sum] =3D "29fa2e003f4bf3e37a3fb50=
6d5b7ab19eb6412b5966d865e082b354637d5d84a"
-SRC_URI[rust-std-snapshot-powerpc64le.sha256sum] =3D "4c64a09be872b5832b50=
d681fbe29691b6a5d3e23ee5535020fa22b8b453c770"
-SRC_URI[rustc-snapshot-powerpc64le.sha256sum] =3D "3b4322b519b0f7fbcf88511=
b2061be1499921517d810d7696be58a16467d4589"
+SRC_URI[cargo-snapshot-powerpc64le.sha256sum] =3D "fbad853a30437653f09001d=
0de797823dfa32d537163841bec1792c3267f5eab"
+SRC_URI[rust-std-snapshot-powerpc64le.sha256sum] =3D "364c47ed22e4268edf23=
8d221c40007d7d8792a66ca325d3937596a9c911ea48"
+SRC_URI[rustc-snapshot-powerpc64le.sha256sum] =3D "4a2368996acd1741200d720=
674101323fa951dfa580b64c8b2e9fdc09bb22534"
=20
-SRC_URI[cargo-snapshot-riscv64gc.sha256sum] =3D "f362cf575fde92f988d5b1fe1=
9fd463a1905d8d2a3844168034df49b1dffb10b"
-SRC_URI[rust-std-snapshot-riscv64gc.sha256sum] =3D "776eff6f451845e8822471=
4ee6da7819e34f01b7625bf927394c2b91e5c8243c"
-SRC_URI[rustc-snapshot-riscv64gc.sha256sum] =3D "84bea70d3acb6af04ae4c0f49=
f904bba4e2644b92c5996aacbafd7610dd0e147"
+SRC_URI[cargo-snapshot-riscv64gc.sha256sum] =3D "3381af9ba39068b9c5e625361=
25a3abb582aef15932f63cd4f90df0cccb05ac7"
+SRC_URI[rust-std-snapshot-riscv64gc.sha256sum] =3D "63a7e6a6c889a3d01bb3c6=
6a3def3e41963511ea52e13906669da5b29b2fd9da"
+SRC_URI[rustc-snapshot-riscv64gc.sha256sum] =3D "916d204d727f485abbadeef91=
4ee881cf61fa3c167741a9ed29c9f4042c99e25"
=20
-SRC_URI[cargo-snapshot-s390x.sha256sum] =3D "f69ea091fa1ee4871a46cb9fa1da5=
b81fa2980687f3bedbc4677a4a82f8da0c0"
-SRC_URI[rust-std-snapshot-s390x.sha256sum] =3D "51d1567e1d28e43c2165886f5a=
4955dcdaa41aa5ddcec5fb08200491fd1f6062"
-SRC_URI[rustc-snapshot-s390x.sha256sum] =3D "25a047db8ec0627bb7054eafe6edc=
a6ce4c473b30d6766b30cbff1c536d0673b"
+SRC_URI[cargo-snapshot-s390x.sha256sum] =3D "78d7c2714015ecb7283b417cb265d=
4d604379d0720aab5f611ca1c113987c283"
+SRC_URI[rust-std-snapshot-s390x.sha256sum] =3D "04573298d9e815c1e8c47a2f95=
48ea55d4a2afc538eceaa6a704d44a5e1f7e3e"
+SRC_URI[rustc-snapshot-s390x.sha256sum] =3D "e786d34e10069dc00774fe53bca09=
2e537e96db6c9d5258a8b0221e4fa5a2caf"
=20
-SRC_URI[cargo-snapshot-x86_64.sha256sum] =3D "a636f83eb2327a66f484b9592ab3=
05c6642df16fc80d0d1cb727e766a60da904"
-SRC_URI[rust-std-snapshot-x86_64.sha256sum] =3D "c5e2c9b160bd8d99514f13cfb=
c0e42a722fd9ca14e6aaca4b9b77731a7a48377"
-SRC_URI[rustc-snapshot-x86_64.sha256sum] =3D "242855e2626860aede6957dc5648=
1cc02acf8cad12fa5bbbcbd93f9c51f0b3ad"
+SRC_URI[cargo-snapshot-x86_64.sha256sum] =3D "e744dad75de8419e7fea530c29bd=
56cf931b4d4de62eb4bd442bfac7b54e61ed"
+SRC_URI[rust-std-snapshot-x86_64.sha256sum] =3D "f4dc8468dfc1dbd86f865b10f=
06e0e4b4e76f5a3a1cc27317a520ab1660844e9"
+SRC_URI[rustc-snapshot-x86_64.sha256sum] =3D "e27ec0c6d1a2b2b38e5258904c37=
41ddb246bff5715aa95e595f818aa77f7bee"
=20
-SRC_URI[rust-std-snapshot-i586.sha256sum] =3D "90eb8e2490283930e682b79842d=
664d4867414563353d53dafc47eccf44aea17"
+SRC_URI[rust-std-snapshot-i586.sha256sum] =3D "22cbbf0b22d9b0894cfbd6e1dd6=
b95b71c7ad02cee4e477d375dcf81af8d1337"
=20
-SRC_URI[rust-std-snapshot-sparc64.sha256sum] =3D "3aee03fa61c28bb242023efb=
09a22e38a76b075cc72bcad9894560be8b28a927"
+SRC_URI[rust-std-snapshot-sparc64.sha256sum] =3D "addf0b0beb1966787e599f32=
849f18c28d5cb65515272b7d9608d4a1dddee2e7"
=20
 SRC_URI +=3D " \
     ${RUST_DIST_SERVER}/dist/${RUST_STD_SNAPSHOT}.tar.xz;name=3Drust-std-s=
napshot-${RUST_BUILD_ARCH};subdir=3Drust-snapshot-components \
diff --git a/meta/recipes-devtools/rust/rust-source.inc b/meta/recipes-devt=
ools/rust/rust-source.inc
index 942978e6bf6..c8f5a5a9c4c 100644
--- a/meta/recipes-devtools/rust/rust-source.inc
+++ b/meta/recipes-devtools/rust/rust-source.inc
@@ -7,7 +7,7 @@ SRC_URI +=3D "https://static.rust-lang.org/dist/rustc-${RUS=
T_VERSION}-src.tar.xz;n
             file://0001-Do-not-use-LFS64-on-linux-with-musl.patch;patchdir=
=3D${RUSTSRC} \
             file://zlib-off64_t.patch;patchdir=3D${RUSTSRC} \
 "
-SRC_URI[rust.sha256sum] =3D "77e0615011f887d9533d5374bf9c15c590c3caf32bbb0=
35b392d1c2ae502a682"
+SRC_URI[rust.sha256sum] =3D "5b8ea94085b65e75c1fa6310e2f90bd706fa80bfcb354=
4fe26f4037b911d9fb2"
=20
 RUSTSRC =3D "${WORKDIR}/rustc-${RUST_VERSION}-src"
=20
diff --git a/meta/recipes-devtools/rust/rust_1.67.1.bb b/meta/recipes-devto=
ols/rust/rust_1.68.1.bb
similarity index 100%
rename from meta/recipes-devtools/rust/rust_1.67.1.bb
rename to meta/recipes-devtools/rust/rust_1.68.1.bb
--=20
2.30.2


