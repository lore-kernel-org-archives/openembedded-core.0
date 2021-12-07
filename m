Return-Path: <alex.kanavin@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 8F123C433F5
	for <webhook@archiver.kernel.org>; Tue,  7 Dec 2021 13:07:17 +0000 (UTC)
Received: from mail-wr1-f44.google.com (mail-wr1-f44.google.com
 [209.85.221.44])
 by mx.groups.io with SMTP id smtpd.web12.66653.1638882436292033666
 for <openembedded-core@lists.openembedded.org>;
 Tue, 07 Dec 2021 05:07:16 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20210112 header.b=mDhSdEgK;
 spf=pass (domain: gmail.com, ip: 209.85.221.44,
 mailfrom: alex.kanavin@gmail.com)
Received: by mail-wr1-f44.google.com with SMTP id d9so29365589wrw.4
        for <openembedded-core@lists.openembedded.org>;
 Tue, 07 Dec 2021 05:07:16 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:content-transfer-encoding;
        bh=ZIwrP2WTvaGhmJ0MiF4JZf0qsrhJpnsE4LZfdyqg9aY=;
        b=mDhSdEgK/F4/TQasCbSp+ElmJ5b70TjVG08UwyG9ZGnw8Jnei43illYP6NoukeZZrH
         HDLIKGmUv+lZ5IZ8xotaCP+HJMuemg5Q6m9Fxnfy76vh+XS4FfYeYxraeYLoDGBMZ64U
         weWRpa+JKkTZwokYeGi8C8QIKbueWeXfCCuWnto0BiLQOIpKCCOVzCDwqSnyHkPh2tYo
         +bHuVoGi1hKIvXPP2iW6BRWN0bFKZXwcB4H4iqBcxIg6ZESOf0r3BBoEgaAeTGg7eVgB
         PpaLsD1KbAUTKClUuynuR25YtgH8wwSC1/md9ic3jc2M5vtzjII2Cco+U3jVwj9GAotT
         EnEQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=ZIwrP2WTvaGhmJ0MiF4JZf0qsrhJpnsE4LZfdyqg9aY=;
        b=tyBFvHlh3nDMvs0khssZVjyI+xLF14HSpbDaGHYNQqRZeq8yFcxoprN7xGFH0/HlIp
         49b1epM16qPx2gg2kEubVum2qyMlHheM0MsChgxCfMO0AOPvdxR4Gd8v1jC872R4Q0ST
         qBpg/hpmntMtnNiCCm+V2cLap8kJ1l3p20MVeLTEZ3ule10tKQfr6vUuUZUSXdifhej4
         eEK9C/srb7lqRgEyP9yVnab+B5aCx+ENkpV3vNkZG27ckEN2BxsUe9BHm+XZg4KA41gG
         fpNE+2viLLhq5bDQX78k3kaakGPLb1ecrGiiB1/T6GabGbzmFQwxfZA4MIsIOX1xVs9x
         iDGg==
X-Gm-Message-State: AOAM5332AZSyV6RdU9bLwY7xtZmaT7WssA9xm2A6sBMosguWoXCFMQJ2
	ANJ2esB1dQ2HJRMgxsb9WIlXb5eYsQ/+9A==
X-Google-Smtp-Source: 
 ABdhPJwfAj7uY8lfQCrtdHajRrrOfluIGk0mlsV7RilhlcMgz07iOrOf+wXPJYHhR4Y0DurpC+AOzQ==
X-Received: by 2002:a5d:5983:: with SMTP id n3mr49001973wri.372.1638882433999;
        Tue, 07 Dec 2021 05:07:13 -0800 (PST)
Received: from nereus.lab.linutronix.de. (b2b-109-90-143-203.unitymedia.biz.
 [109.90.143.203])
        by smtp.gmail.com with ESMTPSA id
 n4sm16592468wri.41.2021.12.07.05.07.13
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 07 Dec 2021 05:07:13 -0800 (PST)
From: Alexander Kanavin <alex.kanavin@gmail.com>
X-Google-Original-From: Alexander Kanavin <alex@linutronix.de>
To: openembedded-core@lists.openembedded.org
Cc: Alexander Kanavin <alex@linutronix.de>
Subject: [PATCH 08/16] rust: update 1.56.1 -> 1.57.0
Date: Tue,  7 Dec 2021 14:06:55 +0100
Message-Id: <20211207130703.3196805-8-alex@linutronix.de>
X-Mailer: git-send-email 2.20.1
In-Reply-To: <20211207130703.3196805-1-alex@linutronix.de>
References: <20211207130703.3196805-1-alex@linutronix.de>
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Tue, 07 Dec 2021 13:07:17 -0000
X-Groupsio-URL: 
 https://lists.openembedded.org/g/openembedded-core/message/159295

Signed-off-by: Alexander Kanavin <alex@linutronix.de>
---
 meta/conf/distro/include/tcmode-default.inc       |  2 +-
 ...n_1.56.1.bb =3D> cargo-cross-canadian_1.57.0.bb} |  0
 .../cargo/{cargo_1.56.1.bb =3D> cargo_1.57.0.bb}    |  0
 ...te-checksums-for-modified-files-for-rust.patch | 15 ++++++++++-----
 .../{libstd-rs_1.56.1.bb =3D> libstd-rs_1.57.0.bb}  |  0
 ...an_1.56.1.bb =3D> rust-cross-canadian_1.57.0.bb} |  0
 ...{rust-cross_1.56.1.bb =3D> rust-cross_1.57.0.bb} |  0
 .../{rust-llvm_1.56.1.bb =3D> rust-llvm_1.57.0.bb}  |  0
 meta/recipes-devtools/rust/rust-source.inc        |  2 +-
 ...6.1.bb =3D> rust-tools-cross-canadian_1.57.0.bb} |  0
 .../rust/{rust_1.56.1.bb =3D> rust_1.57.0.bb}       |  1 +
 11 files changed, 13 insertions(+), 7 deletions(-)
 rename meta/recipes-devtools/cargo/{cargo-cross-canadian_1.56.1.bb =3D> ca=
rgo-cross-canadian_1.57.0.bb} (100%)
 rename meta/recipes-devtools/cargo/{cargo_1.56.1.bb =3D> cargo_1.57.0.bb} =
(100%)
 rename meta/recipes-devtools/rust/{libstd-rs_1.56.1.bb =3D> libstd-rs_1.57=
.0.bb} (100%)
 rename meta/recipes-devtools/rust/{rust-cross-canadian_1.56.1.bb =3D> rust=
-cross-canadian_1.57.0.bb} (100%)
 rename meta/recipes-devtools/rust/{rust-cross_1.56.1.bb =3D> rust-cross_1.=
57.0.bb} (100%)
 rename meta/recipes-devtools/rust/{rust-llvm_1.56.1.bb =3D> rust-llvm_1.57=
.0.bb} (100%)
 rename meta/recipes-devtools/rust/{rust-tools-cross-canadian_1.56.1.bb =3D=
> rust-tools-cross-canadian_1.57.0.bb} (100%)
 rename meta/recipes-devtools/rust/{rust_1.56.1.bb =3D> rust_1.57.0.bb} (99=
%)

diff --git a/meta/conf/distro/include/tcmode-default.inc b/meta/conf/distro=
/include/tcmode-default.inc
index 946dec74b6..d858869bbd 100644
--- a/meta/conf/distro/include/tcmode-default.inc
+++ b/meta/conf/distro/include/tcmode-default.inc
@@ -27,7 +27,7 @@ GOVERSION ?=3D "1.17%"
 # This can not use wildcards like 8.0.% since it is also used in mesa to d=
enote
 # llvm version being used, so always bump it with llvm recipe version bump
 LLVMVERSION ?=3D "12.0.1"
-RUSTVERSION ?=3D "1.56.1"
+RUSTVERSION ?=3D "1.57.0"
=20
 PREFERRED_VERSION_gcc ?=3D "${GCCVERSION}"
 PREFERRED_VERSION_gcc-cross-${TARGET_ARCH} ?=3D "${GCCVERSION}"
diff --git a/meta/recipes-devtools/cargo/cargo-cross-canadian_1.56.1.bb b/m=
eta/recipes-devtools/cargo/cargo-cross-canadian_1.57.0.bb
similarity index 100%
rename from meta/recipes-devtools/cargo/cargo-cross-canadian_1.56.1.bb
rename to meta/recipes-devtools/cargo/cargo-cross-canadian_1.57.0.bb
diff --git a/meta/recipes-devtools/cargo/cargo_1.56.1.bb b/meta/recipes-dev=
tools/cargo/cargo_1.57.0.bb
similarity index 100%
rename from meta/recipes-devtools/cargo/cargo_1.56.1.bb
rename to meta/recipes-devtools/cargo/cargo_1.57.0.bb
diff --git a/meta/recipes-devtools/rust/libstd-rs/0008-Update-checksums-for=
-modified-files-for-rust.patch b/meta/recipes-devtools/rust/libstd-rs/0008-=
Update-checksums-for-modified-files-for-rust.patch
index d513e9063a..2a5f3e3422 100644
--- a/meta/recipes-devtools/rust/libstd-rs/0008-Update-checksums-for-modifi=
ed-files-for-rust.patch
+++ b/meta/recipes-devtools/rust/libstd-rs/0008-Update-checksums-for-modifi=
ed-files-for-rust.patch
@@ -1,17 +1,22 @@
-From 2b1c373f9a3341e8926d6be8d7cdcedc1fc6fca3 Mon Sep 17 00:00:00 2001
+From 9bed5cee7388931fc706c2a1e6b8e3285d6807a4 Mon Sep 17 00:00:00 2001
 From: Ralf Anton Beier <ralf_beier@me.com>
 Date: Sun, 8 Aug 2021 11:19:24 +0200
-Subject: [PATCH 8/8] Update checksums for modified files for rust
+Subject: [PATCH] Update checksums for modified files for rust
=20
 Upstream-Status: Inappropriate [previous patches need to be upstreamed]
 Signed-off-by: Ralf Anton Beier <ralf_beier@me.com>
 ---
- vendor/libc-0.2.93/.cargo-checksum.json | 2 +-
+ vendor/libc/.cargo-checksum.json | 2 +-
  1 file changed, 1 insertion(+), 1 deletion(-)
=20
+diff --git a/vendor/libc/.cargo-checksum.json b/vendor/libc/.cargo-checksu=
m.json
+index 38ea3c65d..e373c3cb2 100644
 --- a/vendor/libc/.cargo-checksum.json
 +++ b/vendor/libc/.cargo-checksum.json
 @@ -1 +1 @@
--{"files":{"CONTRIBUTING.md":"752eea5a703d11b485c6b5f195f51bd2c79aa5159b61=
9ce09555c779e1fb586b","Cargo.toml":"9d8cd25bb60fc4bb42c4b034bfa26ba45a691fd=
7cae155dab8f8b5819fe12647","LICENSE-APACHE":"a60eea817514531668d7e007657314=
49fe14d059d3249e0bc93b36de45f759f2","LICENSE-MIT":"a8d47ff51ca256f56a8932db=
a07660672dbfe3004257ca8de708aac1415937a1","README.md":"8228847944f1332882fb=
b00275b6f30e4a8aad08a13569c25d52cac012cc2a47","build.rs":"8e0e8d33cc9e7c25c=
de75c2b502420f943266a681024169f94084774b422681d","rustfmt.toml":"eaa2ea84fc=
1ba0359b77680804903e07bb38d257ab11986b95b158e460f787b2","src/fixed_width_in=
ts.rs":"34c60f12ec5eeb90f13ec3b954427532111c2446e69617616a97aefc1086a9f1","=
src/fuchsia/aarch64.rs":"378776a9e40766154a54c94c2a7b4675b5c302a38e6e42da99=
e67bfbaee60e56","src/fuchsia/align.rs":"ae1cf8f011a99737eabeb14ffff768e60f1=
3b13363d7646744dbb0f443dab3d6","src/fuchsia/mod.rs":"975b86cbe0335d64082ca8=
8bb24f0e3402371f6f5b33e940c4e12ce4342bb658","src/fuchsia/no_align.rs":"303f=
3f1b255e0088b5715094353cf00476131d8e94e6aebb3f469557771c8b8a","src/fuchsia/=
x86_64.rs":"93a3632b5cf67d2a6bcb7dc0a558605252d5fe689e0f38d8aa2ec5852255ac8=
7","src/hermit/aarch64.rs":"86048676e335944c37a63d0083d0f368ae10ceccefeed9d=
ebb3bbe08777fc682","src/hermit/mod.rs":"d3bfce41e4463d4be8020a2d063c9bfa8b6=
65f45f1cc6cbf3163f5d01e7cb21f","src/hermit/x86_64.rs":"ab832b7524e5fb15c49f=
f7431165ab1a37dc4667ae0b58e8306f4c539bfa110c","src/lib.rs":"d4f7452c0fe720f=
3a961b918b74ec86d19cef33e6b4aac08efbbad6f6d818e09","src/macros.rs":"7844312=
c233a6889fa15395fe3106f6a8f6229211104a92f33ea3c9536eef763","src/psp.rs":"dd=
31aabd46171d474ec5828372e28588935120e7355c90c105360d8fa9264c1c","src/sgx.rs=
":"16a95cdefc81c5ee00d8353a60db363c4cc3e0f75abcd5d0144723f2a306ed1b","src/s=
witch.rs":"9da3dd39b3de45a7928789926e8572d00e1e11a39e6f7289a1349aadce90edba=
","src/unix/align.rs":"2cdc7c826ef7ae61f5171c5ae8c445a743d86f1a7f2d9d7e4cee=
ec56d6874f65","src/unix/bsd/apple/b32/align.rs":"ec833a747866fe19ca2d9b4d3c=
9ff0385faba5edf4bd0d15fa68884c40b0e26c","src/unix/bsd/apple/b32/mod.rs":"6a=
4ce300da0d2b0db04b18548286603ffe4b47d679a41cf60f1902895894aa1f","src/unix/b=
sd/apple/b64/aarch64/align.rs":"f0c321265dd7671f16106b84951ac7dd77ed2e65c66=
23cbf2d29e76531984770","src/unix/bsd/apple/b64/aarch64/mod.rs":"46d5d061c7a=
74cbc09cbdfb3bee9a600867bf4e04c0e4d0ca6c817e6033b32e1","src/unix/bsd/apple/=
b64/align.rs":"ec833a747866fe19ca2d9b4d3c9ff0385faba5edf4bd0d15fa68884c40b0=
e26c","src/unix/bsd/apple/b64/mod.rs":"f5e278a1af7fb358891d1c9be4eb7e815aac=
a0c5cb738d0c3604ba2208a856f7","src/unix/bsd/apple/b64/x86_64/align.rs":"ec8=
33a747866fe19ca2d9b4d3c9ff0385faba5edf4bd0d15fa68884c40b0e26c","src/unix/bs=
d/apple/b64/x86_64/mod.rs":"cc6878dd130c3f255418e4da74992ae9ba6a3cdb0530772=
de76c518077d3b12a","src/unix/bsd/apple/mod.rs":"55e2ddba00f002fac0e3ed1c439=
32423ea6682aaff95491542dce9562c81e217","src/unix/bsd/freebsdlike/dragonfly/=
errno.rs":"8295b8bb0dfd38d2cdb4d9192cdeeb534cc6c3b208170e64615fa3e0edb3e578=
","src/unix/bsd/freebsdlike/dragonfly/mod.rs":"efdfed8f750d6a6233a3a753be80=
bdb6e06ec9ccdfa5b9246f09aa1d39d3cffe","src/unix/bsd/freebsdlike/freebsd/aar=
ch64.rs":"14f0bd6693967d4fedec904f7042bd51f2138cb843ec4df18c911b357417cdd2"=
,"src/unix/bsd/freebsdlike/freebsd/arm.rs":"59d6a670eea562fb87686e243e0a846=
03d29a2028a3d4b3f99ccc01bd04d2f47","src/unix/bsd/freebsdlike/freebsd/freebs=
d11/b64.rs":"9808d152c1196aa647f1b0f0cf84dac8c930da7d7f897a44975545e3d9d176=
81","src/unix/bsd/freebsdlike/freebsd/freebsd11/mod.rs":"6523af60c0e4937ad3=
74003c1653e9e721f5b6f11572c747732f76522d07d034","src/unix/bsd/freebsdlike/f=
reebsd/freebsd12/b64.rs":"61cbe45f8499bedb168106b686d4f8239472f25c7553b069e=
ec2afe197ff2df6","src/unix/bsd/freebsdlike/freebsd/freebsd12/mod.rs":"b449a=
5914d3175e0a390bad616370f28fe59efaee3b81c38fb6e556507c2711a","src/unix/bsd/=
freebsdlike/freebsd/freebsd13/b64.rs":"61cbe45f8499bedb168106b686d4f8239472=
f25c7553b069eec2afe197ff2df6","src/unix/bsd/freebsdlike/freebsd/freebsd13/m=
od.rs":"ce31af8c04d1a1b384f55f80db14b5f74c59d02c94b3b30288411c9bca5eba04","=
src/unix/bsd/freebsdlike/freebsd/mod.rs":"a4fc19429762fac85106180e87c4d10a6=
1b4c07563f4e844771fcde71c14fc51","src/unix/bsd/freebsdlike/freebsd/powerpc.=
rs":"9ca3f82f88974e6db5569f2d76a5a3749b248a31747a6c0da5820492bdfeca42","src=
/unix/bsd/freebsdlike/freebsd/powerpc64.rs":"2dae3ecc87eac3b11657aa98915def=
55fc4b5c0de11fe26aae23329a54628a9a","src/unix/bsd/freebsdlike/freebsd/x86.r=
s":"c5005e3249eb7c93cfbac72a9e9272320d80ce7983da990ceb05a447f59a02c5","src/=
unix/bsd/freebsdlike/freebsd/x86_64/align.rs":"0e1f69a88fca1c32874b1daf5db3=
d446fefbe518dca497f096cc9168c39dde70","src/unix/bsd/freebsdlike/freebsd/x86=
_64/mod.rs":"6132aa0973454379674ea6cbc77e6eace1e1032dd9f38182071388a036f1bc=
08","src/unix/bsd/freebsdlike/mod.rs":"9dbe0fcf66f13ba27f163d9f4362c25036ff=
1973a3b67244bcb3e8f39c3efbfd","src/unix/bsd/mod.rs":"67e0932ebcd1605045744c=
3f15286204cc547019b0a2696419da1c14c61393f5","src/unix/bsd/netbsdlike/mod.rs=
":"ceaec69f85bbe5beaf0b2dd73e0fd2b7fa49c0ea9727dcf51415f99bd2bc4b9c","src/u=
nix/bsd/netbsdlike/netbsd/aarch64.rs":"b38fc046f9a40fea28bd26328b96629f4d5d=
63d7524936bd6af1865d401a8716","src/unix/bsd/netbsdlike/netbsd/arm.rs":"58cd=
bb70b0d6f536551f0f3bb3725d2d75c4690db12c26c034e7d6ec4a924452","src/unix/bsd=
/netbsdlike/netbsd/mod.rs":"6b30cadcf243eb6098cad6ec869f4739570df0f356aefd8=
26ef1c347c146685c","src/unix/bsd/netbsdlike/netbsd/powerpc.rs":"ee7ff5d89d0=
ed22f531237b5059aa669df93a3b5c489fa641465ace8d405bf41","src/unix/bsd/netbsd=
like/netbsd/sparc64.rs":"9489f4b3e4566f43bb12dfb92238960613dac7f6a45cc13068=
a8d152b902d7d9","src/unix/bsd/netbsdlike/netbsd/x86.rs":"20692320e36bfe028d=
1a34d16fe12ca77aa909cb02bda167376f98f1a09aefe7","src/unix/bsd/netbsdlike/ne=
tbsd/x86_64.rs":"1afe5ef46b14397cdd68664b5b232e4f5b035b6db1d4cf411c899d51eb=
ca9f30","src/unix/bsd/netbsdlike/openbsd/aarch64.rs":"1dd5449dd1fd3d51e30ff=
deeaece91d0aaf05c710e0ac699fecc5461cfa2c28e","src/unix/bsd/netbsdlike/openb=
sd/mod.rs":"ac6fff797511b00659849242b997de4d9f948698b5677de928375fc84d2ac1f=
3","src/unix/bsd/netbsdlike/openbsd/sparc64.rs":"d04fd287afbaa2c5df9d48c94e=
8374a532a3ba491b424ddf018270c7312f4085","src/unix/bsd/netbsdlike/openbsd/x8=
6.rs":"6f7f5c4fde2a2259eb547890cbd86570cea04ef85347d7569e94e679448bec87","s=
rc/unix/bsd/netbsdlike/openbsd/x86_64.rs":"e59b7fd65f68f8e857eec39e0c03bac1=
d3af6ddc26c9ba58494336b83659bb9b","src/unix/haiku/b32.rs":"69ae47fc52c6880e=
85416b4744500d5655c9ec6131cb737f3b649fceaadce15a","src/unix/haiku/b64.rs":"=
73e64db09275a8da8d50a13cce2cfa2b136036ddf3a930d2939f337fc995900b","src/unix=
/haiku/mod.rs":"cb829d468fecc8dacf3f03f5808f0c265a62dc82e34a208a025a8b90302=
7a121","src/unix/haiku/native.rs":"fd34e56a7b27591d83a980c92afefc543df9a2d4=
fe64c732d2b7d6aea31ac0a3","src/unix/hermit/aarch64.rs":"86048676e335944c37a=
63d0083d0f368ae10ceccefeed9debb3bbe08777fc682","src/unix/hermit/mod.rs":"85=
9814f5df89e28fd4b345db399d181e11e7ed413841b6ff703a1fcbdbf013ae","src/unix/h=
ermit/x86_64.rs":"ab832b7524e5fb15c49ff7431165ab1a37dc4667ae0b58e8306f4c539=
bfa110c","src/unix/linux_like/android/b32/arm.rs":"433c1530f602cc5ed26610c5=
8055dde0c4ceea5e00150063b24ddc60768332a4","src/unix/linux_like/android/b32/=
mod.rs":"d971b98530a96f5892f98e1edc3133cf278d1b3939d77ab0a27a6323e0961715",=
"src/unix/linux_like/android/b32/x86/align.rs":"812914e4241df82e32b12375ca3=
374615dc3a4bdd4cf31f0423c5815320c0dab","src/unix/linux_like/android/b32/x86=
/mod.rs":"8388bd3a0fcb5636bf965eee6dc95ae6860b85a2b555b387c868aa4d4e01ec89"=
,"src/unix/linux_like/android/b64/aarch64/align.rs":"2179c3b1608fa4bf688404=
82bfc2b2fa3ee2faf6fcae3770f9e505cddca35c7b","src/unix/linux_like/android/b6=
4/aarch64/mod.rs":"8fe667d2b14abc5ac8aad32e16c3da24350471d8156eaea9ab4989f7=
3dd9f9fc","src/unix/linux_like/android/b64/mod.rs":"5d94d05d8c10a748f0b1f67=
a4abaf4dd8415351e14e3bc6c84f6a46c8e18874c","src/unix/linux_like/android/b64=
/x86_64/align.rs":"7169d07a9fd4716f7512719aec9fda5d8bed306dc0720ffc1b21696c=
9951e3c6","src/unix/linux_like/android/b64/x86_64/mod.rs":"06b22dc184e85a98=
8ab969c75cadc52b9878faeab0eb9d21215878c95fe07c19","src/unix/linux_like/andr=
oid/mod.rs":"9e79edebb5c7b1b62f0e253570d02338a50f06fdb2fd4b27488e0ae50871a8=
36","src/unix/linux_like/emscripten/align.rs":"86c95cbed7a7161b1f23ee06843e=
7b0e2340ad92b2cb86fe2a8ef3e0e8c36216","src/unix/linux_like/emscripten/mod.r=
s":"6ef97140ca6fb24125fdd0aacb986ef785aa21993229660d7f703f8875ebfe49","src/=
unix/linux_like/emscripten/no_align.rs":"0128e4aa721a9902754828b61b5ec7d8a8=
6619983ed1e0544a85d35b1051fad6","src/unix/linux_like/linux/align.rs":"213e7=
0ebed2703e14a9cf17666b21ecbf180b7bff7fa22fdbb36dbbd52df326d","src/unix/linu=
x_like/linux/arch/generic/mod.rs":"ff1fe8fad4ea15d9bec3db25efcfcb4939190c51=
89f86cfa4d05825aa8c10956","src/unix/linux_like/linux/arch/mips/mod.rs":"e4a=
980b002105aaa057eb6568e1e2c6168ade5c00e13a31ef67e316ddffdb900","src/unix/li=
nux_like/linux/arch/mod.rs":"466a29622e47c6c7f1500682b2eb17f5566dd81b322cd6=
348f0fdd355cec593a","src/unix/linux_like/linux/arch/powerpc/mod.rs":"1789eb=
5b41f75c29239795124a4a7cdcf7c8d213b88cf581b2f5bda08d7cf15b","src/unix/linux=
_like/linux/arch/sparc/mod.rs":"ded708124ee610267d011dee31fb02d1ec697c334aa=
822776ec95a7ddf6fc541","src/unix/linux_like/linux/gnu/align.rs":"e4a3c27fe2=
0a57b8d612c34cb05bc70646edb5cec7251957315afa53a7b9f936","src/unix/linux_lik=
e/linux/gnu/b32/arm/align.rs":"3fed009dc9af3cc81be7087da9d2d7d1f39845e4497e=
290259c5cdbae25f039d","src/unix/linux_like/linux/gnu/b32/arm/mod.rs":"07adf=
9f4b96854062db518aaf08521fde0ad4a21a5c049efccba437bd97b2b5a","src/unix/linu=
x_like/linux/gnu/b32/mips/align.rs":"429fb5e005cb7143602d430098b6ebfb7d3606=
85b194f333dfd587472ae954ee","src/unix/linux_like/linux/gnu/b32/mips/mod.rs"=
:"1cb5c0c9df3af2bbe131a91593583259fac9118931744c8435e197a394eb0462","src/un=
ix/linux_like/linux/gnu/b32/mod.rs":"794dbcbae7dae8fd6b0b814573243197ceb532=
b56ef0772ad86b4b401478fcd9","src/unix/linux_like/linux/gnu/b32/powerpc.rs":=
"0cd7348badb9c4f8a0db31a2503b30c456a2bfcc7a0e5919762b1e12f912c5ad","src/uni=
x/linux_like/linux/gnu/b32/riscv32/mod.rs":"9c628cd97806181dc4d34b072f63fe1=
eb42f08108712002e0628ffe27f2fa93f","src/unix/linux_like/linux/gnu/b32/sparc=
/align.rs":"21adbed27df73e2d1ed934aaf733a643003d7baf2bde9c48ea440895bcca6d4=
1","src/unix/linux_like/linux/gnu/b32/sparc/mod.rs":"1bcec269a8416ccc48a384=
ca5765eaaa23f30f39f32311f50008ef4eeadafb2f","src/unix/linux_like/linux/gnu/=
b32/x86/align.rs":"e4bafdc4a519a7922a81b37a62bbfd1177a2f620890eef8f1fbc4716=
2e9eb413","src/unix/linux_like/linux/gnu/b32/x86/mod.rs":"5317dbf2323577b89=
370bbee3894882b89d8333176db4f7b271ddc2f036ef43c","src/unix/linux_like/linux=
/gnu/b64/aarch64/align.rs":"2179c3b1608fa4bf68840482bfc2b2fa3ee2faf6fcae377=
0f9e505cddca35c7b","src/unix/linux_like/linux/gnu/b64/aarch64/ilp32.rs":"21=
a21503ef2e095f4371044915d4bfb07a8578011cb5c713cd9f45947b0b5730","src/unix/l=
inux_like/linux/gnu/b64/aarch64/lp64.rs":"e78c3cd197f44832338b414d1a9bc0d19=
4f44c74db77bd7bf830c1fff62b2690","src/unix/linux_like/linux/gnu/b64/aarch64=
/mod.rs":"c3730792dabcc166d8fd22929ef2633d49bc626875382dfcd401e8e125fb7a84"=
,"src/unix/linux_like/linux/gnu/b64/mips64/align.rs":"7169d07a9fd4716f75127=
19aec9fda5d8bed306dc0720ffc1b21696c9951e3c6","src/unix/linux_like/linux/gnu=
/b64/mips64/mod.rs":"68bcb71bbfccb4e8648948e494366d94767ce96f36daab9c132937=
5cdd32a459","src/unix/linux_like/linux/gnu/b64/mod.rs":"6336065423c26b59681=
fd2ce77f1117ea36af13e163fdadaefd108bd8191e8c8","src/unix/linux_like/linux/g=
nu/b64/powerpc64/align.rs":"e29c4868bbecfa4a6cd8a2ad06193f3bbc78a468cc1dc9d=
f83f002f1268130d9","src/unix/linux_like/linux/gnu/b64/powerpc64/mod.rs":"db=
b8905e363ed4a2dfb984554ad9b6389d27f6a2d599ec2d80e38a6c7551a019","src/unix/l=
inux_like/linux/gnu/b64/riscv64/mod.rs":"18edaa89c9746125863ff53182e0ef32cb=
1e1612e1ed9a2672558a9de85440e9","src/unix/linux_like/linux/gnu/b64/s390x.rs=
":"d9bb4e524e70d6fef49e0f77d89a92f478fd95d9a1aea32f4dc845275a7465d4","src/u=
nix/linux_like/linux/gnu/b64/sparc64/align.rs":"e29c4868bbecfa4a6cd8a2ad061=
93f3bbc78a468cc1dc9df83f002f1268130d9","src/unix/linux_like/linux/gnu/b64/s=
parc64/mod.rs":"26fda11bdce99372c2c246e60866b56d98beb9fb49a2f6b69347ecfd03d=
18255","src/unix/linux_like/linux/gnu/b64/x86_64/align.rs":"7169d07a9fd4716=
f7512719aec9fda5d8bed306dc0720ffc1b21696c9951e3c6","src/unix/linux_like/lin=
ux/gnu/b64/x86_64/mod.rs":"5a5ce7c5c92f60d8900dce63d363a38f3126aaf5be981710=
e172bec96ef95ac6","src/unix/linux_like/linux/gnu/b64/x86_64/not_x32.rs":"f7=
75ac2b754f90b63053fe22afe1d19d306b5404995568d6805baa9249fb617f","src/unix/l=
inux_like/linux/gnu/b64/x86_64/x32.rs":"4ba1b58468f55254717366f50fdfd3e4114=
fde6dc442a56681926c4d7e5b6b0d","src/unix/linux_like/linux/gnu/mod.rs":"5597=
b67f1cfc4e2012540a8cebf17ff139363c0835834ca8f308952ffe6e99c9","src/unix/lin=
ux_like/linux/gnu/no_align.rs":"9cd223135de75315840ff9c3fd5441ba1cb632b96b5=
c85a76f8316c86653db25","src/unix/linux_like/linux/mod.rs":"d6f8e72a6d67e0af=
6d1f7a09420f92906a52ae226a66f43268064249ce7019df","src/unix/linux_like/linu=
x/musl/b32/arm/align.rs":"3e8ac052c1043764776b54c93ba4260e061df998631737a89=
7d9d47d54f7b80c","src/unix/linux_like/linux/musl/b32/arm/mod.rs":"6255abe2e=
e04986832d12b7b2190589580f2a43e9bfb285b32b5747227f62727","src/unix/linux_li=
ke/linux/musl/b32/hexagon.rs":"a8811791809672be8338e6e27d1c4fcf383c2f26585b=
e8bf9ab2923b219de032","src/unix/linux_like/linux/musl/b32/mips/align.rs":"4=
29fb5e005cb7143602d430098b6ebfb7d360685b194f333dfd587472ae954ee","src/unix/=
linux_like/linux/musl/b32/mips/mod.rs":"b9e9ff42363ebbb884ddf6445129ec41644=
71df45846874fc08f5f458e659254","src/unix/linux_like/linux/musl/b32/mod.rs":=
"8ede3985e6243882814ce91e8ce543e7edbafc0cee5932816072b6f14207a671","src/uni=
x/linux_like/linux/musl/b32/powerpc.rs":"4592dc5f1f2fe888dfef85fa862d42d168=
e73a2c6f4fc052b58287d0f4d4ffcd","src/unix/linux_like/linux/musl/b32/x86/ali=
gn.rs":"08e77fbd7435d7dec2ff56932433bece3f02e47ce810f89004a275a86d39cbe1","=
src/unix/linux_like/linux/musl/b32/x86/mod.rs":"a19a8decfab185af3cebd34aae4=
b15082e7552be573904b8c1a3f0c0e493ef34","src/unix/linux_like/linux/musl/b64/=
aarch64/align.rs":"798a9229d70ce235394f2dd625f6c4c1e10519a94382dc5b091952b6=
38ae2928","src/unix/linux_like/linux/musl/b64/aarch64/mod.rs":"a73035c6d9b7=
76f13b839008e15c04c2c53455571efd06664affcb047e457112","src/unix/linux_like/=
linux/musl/b64/mips64.rs":"2744895451f3a777fbe54f7f2695be53310b965fd62084c9=
b7e9121c7fe28346","src/unix/linux_like/linux/musl/b64/mod.rs":"d18abc0aeba2=
e26342bf3416a4dba0836db2bb0ee013b0a39629475cf8640289","src/unix/linux_like/=
linux/musl/b64/powerpc64.rs":"e5a55525b42493923956d668f978fb45e22d51deea00c=
e5edbfddf76ff19c741","src/unix/linux_like/linux/musl/b64/s390x.rs":"03dfec6=
794d93cb31a7c52b2d53a0973755168f91f8fa437cc5dbd54882c8ee7","src/unix/linux_=
like/linux/musl/b64/x86_64/align.rs":"7169d07a9fd4716f7512719aec9fda5d8bed3=
06dc0720ffc1b21696c9951e3c6","src/unix/linux_like/linux/musl/b64/x86_64/mod=
.rs":"0dd168f5a6881f32e5239fb312b23cf137b800d0ff323286a92c8a2c382b5456","sr=
c/unix/linux_like/linux/musl/mod.rs":"0602b1ee75b70eea30ad64234c9c6e772b6a7=
3262ce886971781a2bcf923f9b4","src/unix/linux_like/linux/no_align.rs":"5ed04=
c53bf9d27da9b4d65ba7625c6ac53330162683d1b3df98950caafa3507b","src/unix/linu=
x_like/linux/uclibc/align.rs":"9ed16138d8e439bd90930845a65eafa7ebd67366e6bf=
633936d44014f6e4c959","src/unix/linux_like/linux/uclibc/arm/align.rs":"e4a3=
c27fe20a57b8d612c34cb05bc70646edb5cec7251957315afa53a7b9f936","src/unix/lin=
ux_like/linux/uclibc/arm/mod.rs":"9b691eeec0a9bf7b2abb87e09062d2c148d18e11c=
96ecad0edd0b74d1d0509fd","src/unix/linux_like/linux/uclibc/arm/no_align.rs"=
:"9cd223135de75315840ff9c3fd5441ba1cb632b96b5c85a76f8316c86653db25","src/un=
ix/linux_like/linux/uclibc/mips/mips32/align.rs":"e4a3c27fe20a57b8d612c34cb=
05bc70646edb5cec7251957315afa53a7b9f936","src/unix/linux_like/linux/uclibc/=
mips/mips32/mod.rs":"18753a99b820d69e062e3ba22a63fa86577b6dcc42f740479c7be1=
a4c658e1be","src/unix/linux_like/linux/uclibc/mips/mips32/no_align.rs":"9cd=
223135de75315840ff9c3fd5441ba1cb632b96b5c85a76f8316c86653db25","src/unix/li=
nux_like/linux/uclibc/mips/mips64/align.rs":"a7bdcb18a37a2d91e64d5fad83ea3e=
dc78f5412adb28f77ab077dbb26dd08b2d","src/unix/linux_like/linux/uclibc/mips/=
mips64/mod.rs":"e3085ba56cfbc528d7c3c55065880603238c333b6047ef51c58177508a4=
87fcd","src/unix/linux_like/linux/uclibc/mips/mips64/no_align.rs":"4a18e387=
5698c85229599225ac3401a2a40da87e77b2ad4ef47c6fcd5a24ed30","src/unix/linux_l=
ike/linux/uclibc/mips/mod.rs":"656fbf5157ab6d06fc365a8353b138818ad5b8429ea5=
628ff35a3972c63a1a7c","src/unix/linux_like/linux/uclibc/mod.rs":"22f712c3e0=
8fd8cb37e274718de1bac09966a4cd4b0f018f28737bc30940b8af","src/unix/linux_lik=
e/linux/uclibc/no_align.rs":"3f28637046524618adaa1012e26cb7ffe94b9396e6b518=
cccdc69d59f274d709","src/unix/linux_like/linux/uclibc/x86_64/l4re.rs":"bb31=
053d6403091e11f95ac2203982f279f8b984a19adf30796878c45fdd8c25","src/unix/lin=
ux_like/linux/uclibc/x86_64/mod.rs":"02e21c0550a423a3f6db0a0af6a0f37cf5937f=
eb2562a490e0ad0e09a8d9fc77","src/unix/linux_like/linux/uclibc/x86_64/other.=
rs":"42c3f71e58cabba373f6a55a623f3c31b85049eb64824c09c2b082b3b2d6a0a8","src=
/unix/linux_like/mod.rs":"9f6eadebed153e31777482932dae2f3fd3471d5b5465099f9=
8f1e2a9429922fe","src/unix/mod.rs":"0550f5ed6a8292e62781cdfcca54b0f2652dd27=
9314d1b73db555fccfb059499","src/unix/newlib/aarch64/mod.rs":"bb269c1468a967=
6442554600e87417079a787fe6220dfc23b3109639259e8710","src/unix/newlib/align.=
rs":"28aaf87fafbc6b312622719d472d8cf65f9e5467d15339df5f73e66d8502b28a","src=
/unix/newlib/arm/mod.rs":"c71be856bfd7f576b2db28af9f680211cbe6c1cac7d537bbc=
8020b39591af07c","src/unix/newlib/espidf/mod.rs":"c198cb4beccdab483be61c102=
da74dc51ac80f766797e33021f3110394ed5a3d","src/unix/newlib/mod.rs":"07c282da=
3fedf04d061c70ab918b561ba44e5d67670e0b04664505afc9c5979f","src/unix/newlib/=
no_align.rs":"e0743b2179495a9514bc3a4d1781e492878c4ec834ee0085d0891dd1712e8=
2fb","src/unix/newlib/powerpc/mod.rs":"2d0f7af28b47f7a2a6c210ebd1c1f33ed8ea=
c62e56b5af2b856de2ad3fdc5187","src/unix/no_align.rs":"c06e95373b9088266e0b1=
4bba0954eef95f93fb2b01d951855e382d22de78e53","src/unix/redox/mod.rs":"251ad=
e5cbe9d648ba7186f58dfe7d4fd8e08be1ab9d0d51bba13e0bf3a0207d0","src/unix/sola=
rish/compat.rs":"b07a5bfac925eb012003a459ba6bddbd3bfa9c44b3394da2ac5a602e54=
beae9c","src/unix/solarish/illumos.rs":"be7cf5334fc8f2c6bc1b856288e53af7f90=
a92bd64793eb19b60b660383e508c","src/unix/solarish/mod.rs":"a5e87e2197011cea=
e4d6aa1bc8a16d2e01dd39583448e6809f32ba58143baee9","src/unix/solarish/solari=
s.rs":"65b005453aefa9b9d4fc860fe77cfec80d8c97a51342b15daf55fc3e808bb384","s=
rc/vxworks/aarch64.rs":"98f0afdc511cd02557e506c21fed6737585490a1dce7a9d4941=
d08c437762b99","src/vxworks/arm.rs":"acb7968ce99fe3f4abdf39d98f8133d21a4fba=
435b8ef7084777cb181d788e88","src/vxworks/mod.rs":"2689e3cad6461682892fcae8a=
23c0c51600e4750c147dd8d7538c6c6c876b7ec","src/vxworks/powerpc.rs":"acb7968c=
e99fe3f4abdf39d98f8133d21a4fba435b8ef7084777cb181d788e88","src/vxworks/powe=
rpc64.rs":"98f0afdc511cd02557e506c21fed6737585490a1dce7a9d4941d08c437762b99=
","src/vxworks/x86.rs":"552f007f38317620b23889cb7c49d1d115841252439060122f5=
2f434fbc6e5ba","src/vxworks/x86_64.rs":"018d92be3ad628a129eff9f2f5dfbc0883d=
8b8e5f2fa917b900a7f98ed6b514a","src/wasi.rs":"3800e710a40322fe0229f7665b185=
42dc066680c4d151e3c4f29f82202a1c294","src/windows/gnu/align.rs":"b2c13ec1b9=
f3b39a75c452c80c951dff9d0215e31d77e883b4502afb31794647","src/windows/gnu/mo=
d.rs":"3c8c7edb7cdf5d0c44af936db2a94869585c69dfabeef30571b4f4e38375767a","s=
rc/windows/mod.rs":"2b960d585c2fc0c82659cc4caeaa3268e67a8de0a0390d084629eef=
d39a14c8d","src/windows/msvc.rs":"ea6d87a6a9cd668261b1c043e7c36cf599e80b5d0=
9f6e4502e85daa4797c7927","tests/const_fn.rs":"cb75a1f0864f926aebe79118fc34d=
51a0d1ade2c20a394e7774c7e545f21f1f4"},"package":"a7f823d141fe0a24df1e23b4af=
4e3c7ba9e5966ec514ea068c93024aa7deb765"}
+-{"files":{"CONTRIBUTING.md":"752eea5a703d11b485c6b5f195f51bd2c79aa5159b61=
9ce09555c779e1fb586b","Cargo.toml":"aad61c58f04e78be520769d8927ab4c121a6536=
f532b159be1b706550fcd0234","LICENSE-APACHE":"a60eea817514531668d7e007657314=
49fe14d059d3249e0bc93b36de45f759f2","LICENSE-MIT":"a8d47ff51ca256f56a8932db=
a07660672dbfe3004257ca8de708aac1415937a1","README.md":"8228847944f1332882fb=
b00275b6f30e4a8aad08a13569c25d52cac012cc2a47","build.rs":"8e0e8d33cc9e7c25c=
de75c2b502420f943266a681024169f94084774b422681d","rustfmt.toml":"eaa2ea84fc=
1ba0359b77680804903e07bb38d257ab11986b95b158e460f787b2","src/fixed_width_in=
ts.rs":"34c60f12ec5eeb90f13ec3b954427532111c2446e69617616a97aefc1086a9f1","=
src/fuchsia/aarch64.rs":"378776a9e40766154a54c94c2a7b4675b5c302a38e6e42da99=
e67bfbaee60e56","src/fuchsia/align.rs":"ae1cf8f011a99737eabeb14ffff768e60f1=
3b13363d7646744dbb0f443dab3d6","src/fuchsia/mod.rs":"520300ff260d377930f2f4=
56135ec9a3ac7740a949ce7bf5269c0dc60d56c0df","src/fuchsia/no_align.rs":"303f=
3f1b255e0088b5715094353cf00476131d8e94e6aebb3f469557771c8b8a","src/fuchsia/=
x86_64.rs":"93a3632b5cf67d2a6bcb7dc0a558605252d5fe689e0f38d8aa2ec5852255ac8=
7","src/hermit/aarch64.rs":"86048676e335944c37a63d0083d0f368ae10ceccefeed9d=
ebb3bbe08777fc682","src/hermit/mod.rs":"d3bfce41e4463d4be8020a2d063c9bfa8b6=
65f45f1cc6cbf3163f5d01e7cb21f","src/hermit/x86_64.rs":"ab832b7524e5fb15c49f=
f7431165ab1a37dc4667ae0b58e8306f4c539bfa110c","src/lib.rs":"d4f7452c0fe720f=
3a961b918b74ec86d19cef33e6b4aac08efbbad6f6d818e09","src/macros.rs":"7844312=
c233a6889fa15395fe3106f6a8f6229211104a92f33ea3c9536eef763","src/psp.rs":"dd=
31aabd46171d474ec5828372e28588935120e7355c90c105360d8fa9264c1c","src/sgx.rs=
":"16a95cdefc81c5ee00d8353a60db363c4cc3e0f75abcd5d0144723f2a306ed1b","src/s=
witch.rs":"9da3dd39b3de45a7928789926e8572d00e1e11a39e6f7289a1349aadce90edba=
","src/unix/align.rs":"2cdc7c826ef7ae61f5171c5ae8c445a743d86f1a7f2d9d7e4cee=
ec56d6874f65","src/unix/bsd/apple/b32/align.rs":"ec833a747866fe19ca2d9b4d3c=
9ff0385faba5edf4bd0d15fa68884c40b0e26c","src/unix/bsd/apple/b32/mod.rs":"6a=
4ce300da0d2b0db04b18548286603ffe4b47d679a41cf60f1902895894aa1f","src/unix/b=
sd/apple/b64/aarch64/align.rs":"f0c321265dd7671f16106b84951ac7dd77ed2e65c66=
23cbf2d29e76531984770","src/unix/bsd/apple/b64/aarch64/mod.rs":"46d5d061c7a=
74cbc09cbdfb3bee9a600867bf4e04c0e4d0ca6c817e6033b32e1","src/unix/bsd/apple/=
b64/align.rs":"ec833a747866fe19ca2d9b4d3c9ff0385faba5edf4bd0d15fa68884c40b0=
e26c","src/unix/bsd/apple/b64/mod.rs":"f5e278a1af7fb358891d1c9be4eb7e815aac=
a0c5cb738d0c3604ba2208a856f7","src/unix/bsd/apple/b64/x86_64/align.rs":"ec8=
33a747866fe19ca2d9b4d3c9ff0385faba5edf4bd0d15fa68884c40b0e26c","src/unix/bs=
d/apple/b64/x86_64/mod.rs":"cc6878dd130c3f255418e4da74992ae9ba6a3cdb0530772=
de76c518077d3b12a","src/unix/bsd/apple/mod.rs":"e0ebe1040b8ff87c52d581f9623=
4291a6380ebe3af3088c4f6ff748fbd7d2a7a","src/unix/bsd/freebsdlike/dragonfly/=
errno.rs":"8295b8bb0dfd38d2cdb4d9192cdeeb534cc6c3b208170e64615fa3e0edb3e578=
","src/unix/bsd/freebsdlike/dragonfly/mod.rs":"1466715589ed18b66789d60904e8=
258b20d7783a6f3bf72f775617bc0d9373d8","src/unix/bsd/freebsdlike/freebsd/aar=
ch64.rs":"2a215bd6136b8617aacedf9be738ccee94da9d29b418e9a78101d6291c182352"=
,"src/unix/bsd/freebsdlike/freebsd/arm.rs":"59d6a670eea562fb87686e243e0a846=
03d29a2028a3d4b3f99ccc01bd04d2f47","src/unix/bsd/freebsdlike/freebsd/freebs=
d11/b64.rs":"9808d152c1196aa647f1b0f0cf84dac8c930da7d7f897a44975545e3d9d176=
81","src/unix/bsd/freebsdlike/freebsd/freebsd11/mod.rs":"6523af60c0e4937ad3=
74003c1653e9e721f5b6f11572c747732f76522d07d034","src/unix/bsd/freebsdlike/f=
reebsd/freebsd12/b64.rs":"61cbe45f8499bedb168106b686d4f8239472f25c7553b069e=
ec2afe197ff2df6","src/unix/bsd/freebsdlike/freebsd/freebsd12/mod.rs":"08215=
43bf2073cb3dc46157e47140caa30704e062b23099d52bf80cb56e25321","src/unix/bsd/=
freebsdlike/freebsd/freebsd12/x86_64.rs":"2df36a7f122f6d6e5753cfb4d22e915cc=
80f6bc91c0161b3daae55a481bfd052","src/unix/bsd/freebsdlike/freebsd/freebsd1=
3/b64.rs":"61cbe45f8499bedb168106b686d4f8239472f25c7553b069eec2afe197ff2df6=
","src/unix/bsd/freebsdlike/freebsd/freebsd13/mod.rs":"21416cad3e76f53d10d0=
c73840469290aa80c2d92c773307a1ca92485d3c0e13","src/unix/bsd/freebsdlike/fre=
ebsd/freebsd13/x86_64.rs":"2df36a7f122f6d6e5753cfb4d22e915cc80f6bc91c0161b3=
daae55a481bfd052","src/unix/bsd/freebsdlike/freebsd/mod.rs":"0ee5530ddde569=
0cdc6f91acca86ce74c37ec06886418c34b201c154fd2c9e41","src/unix/bsd/freebsdli=
ke/freebsd/powerpc.rs":"9ca3f82f88974e6db5569f2d76a5a3749b248a31747a6c0da58=
20492bdfeca42","src/unix/bsd/freebsdlike/freebsd/powerpc64.rs":"2dae3ecc87e=
ac3b11657aa98915def55fc4b5c0de11fe26aae23329a54628a9a","src/unix/bsd/freebs=
dlike/freebsd/x86.rs":"c5005e3249eb7c93cfbac72a9e9272320d80ce7983da990ceb05=
a447f59a02c5","src/unix/bsd/freebsdlike/freebsd/x86_64/align.rs":"0e1f69a88=
fca1c32874b1daf5db3d446fefbe518dca497f096cc9168c39dde70","src/unix/bsd/free=
bsdlike/freebsd/x86_64/mod.rs":"c3a0111252e201c172b99e7d9cbee4cf088d3dd4799=
5110e819f04276bccd198","src/unix/bsd/freebsdlike/mod.rs":"77763a8dfe2d31c78=
ee7c3e64001ceee6d4ba34cc77b7fd4fdde153e5abbbeb8","src/unix/bsd/mod.rs":"2fe=
d08973739d7f6a7412b204724af64b1a915c712689c250cf9a08263ba05ff","src/unix/bs=
d/netbsdlike/mod.rs":"4e9da54e541773c7ad4cca9dade1df00f28f2fdac3f8df5957f4c=
74b7e082344","src/unix/bsd/netbsdlike/netbsd/aarch64.rs":"65dcb58d11e8d8028=
401a9d07ca3eb4cb4f053e04249cc877353449d84ccc4cb","src/unix/bsd/netbsdlike/n=
etbsd/arm.rs":"58cdbb70b0d6f536551f0f3bb3725d2d75c4690db12c26c034e7d6ec4a92=
4452","src/unix/bsd/netbsdlike/netbsd/mod.rs":"96edbcf448b89c991c9254c19423=
2322dce69fb8050bab9f9741f5aecb2104ea","src/unix/bsd/netbsdlike/netbsd/power=
pc.rs":"ee7ff5d89d0ed22f531237b5059aa669df93a3b5c489fa641465ace8d405bf41","=
src/unix/bsd/netbsdlike/netbsd/sparc64.rs":"9489f4b3e4566f43bb12dfb92238960=
613dac7f6a45cc13068a8d152b902d7d9","src/unix/bsd/netbsdlike/netbsd/x86.rs":=
"20692320e36bfe028d1a34d16fe12ca77aa909cb02bda167376f98f1a09aefe7","src/uni=
x/bsd/netbsdlike/netbsd/x86_64.rs":"1afe5ef46b14397cdd68664b5b232e4f5b035b6=
db1d4cf411c899d51ebca9f30","src/unix/bsd/netbsdlike/openbsd/aarch64.rs":"dd=
91931d373b7ecaf6e2de25adadee10d16fa9b12c2cbacdff3eb291e1ba36af","src/unix/b=
sd/netbsdlike/openbsd/mod.rs":"9a9878e70ee8765d95cb1b010e39d74004278ca6da58=
fb82354f69752a84c926","src/unix/bsd/netbsdlike/openbsd/sparc64.rs":"d04fd28=
7afbaa2c5df9d48c94e8374a532a3ba491b424ddf018270c7312f4085","src/unix/bsd/ne=
tbsdlike/openbsd/x86.rs":"6f7f5c4fde2a2259eb547890cbd86570cea04ef85347d7569=
e94e679448bec87","src/unix/bsd/netbsdlike/openbsd/x86_64.rs":"d31db31630289=
c85af3339dbe357998a21ca584cbae31607448fe2cf7675a4e1","src/unix/haiku/b32.rs=
":"69ae47fc52c6880e85416b4744500d5655c9ec6131cb737f3b649fceaadce15a","src/u=
nix/haiku/b64.rs":"73e64db09275a8da8d50a13cce2cfa2b136036ddf3a930d2939f337f=
c995900b","src/unix/haiku/mod.rs":"912969bc1d59a6cec74de3140982b7f0b69e74d4=
4936646587f1c8820be7c0fe","src/unix/haiku/native.rs":"44855f52906f607de137f=
c4baa8c6b1b9a26baaa666f25d5f7a7ec5e017c8be6","src/unix/haiku/x86_64.rs":"3e=
c3aeeb7ed208b8916f3e32d42bfd085ff5e16936a1a35d9a52789f043b7237","src/unix/h=
ermit/aarch64.rs":"86048676e335944c37a63d0083d0f368ae10ceccefeed9debb3bbe08=
777fc682","src/unix/hermit/mod.rs":"859814f5df89e28fd4b345db399d181e11e7ed4=
13841b6ff703a1fcbdbf013ae","src/unix/hermit/x86_64.rs":"ab832b7524e5fb15c49=
ff7431165ab1a37dc4667ae0b58e8306f4c539bfa110c","src/unix/linux_like/android=
/b32/arm.rs":"433c1530f602cc5ed26610c58055dde0c4ceea5e00150063b24ddc6076833=
2a4","src/unix/linux_like/android/b32/mod.rs":"d971b98530a96f5892f98e1edc31=
33cf278d1b3939d77ab0a27a6323e0961715","src/unix/linux_like/android/b32/x86/=
align.rs":"812914e4241df82e32b12375ca3374615dc3a4bdd4cf31f0423c5815320c0dab=
","src/unix/linux_like/android/b32/x86/mod.rs":"8388bd3a0fcb5636bf965eee6dc=
95ae6860b85a2b555b387c868aa4d4e01ec89","src/unix/linux_like/android/b64/aar=
ch64/align.rs":"2179c3b1608fa4bf68840482bfc2b2fa3ee2faf6fcae3770f9e505cddca=
35c7b","src/unix/linux_like/android/b64/aarch64/mod.rs":"8fe667d2b14abc5ac8=
aad32e16c3da24350471d8156eaea9ab4989f73dd9f9fc","src/unix/linux_like/androi=
d/b64/mod.rs":"d7bbbadafdb2cb2ff8e9cde3d89a03b9facaabb6b2d45705225d3ece1c5c=
ce37","src/unix/linux_like/android/b64/x86_64/align.rs":"7169d07a9fd4716f75=
12719aec9fda5d8bed306dc0720ffc1b21696c9951e3c6","src/unix/linux_like/androi=
d/b64/x86_64/mod.rs":"06b22dc184e85a988ab969c75cadc52b9878faeab0eb9d2121587=
8c95fe07c19","src/unix/linux_like/android/mod.rs":"8688204b3236db28b66ff0f1=
de5320f47ec5c1ef5395dddcc9df025a8d78630a","src/unix/linux_like/emscripten/a=
lign.rs":"86c95cbed7a7161b1f23ee06843e7b0e2340ad92b2cb86fe2a8ef3e0e8c36216"=
,"src/unix/linux_like/emscripten/mod.rs":"6ef97140ca6fb24125fdd0aacb986ef78=
5aa21993229660d7f703f8875ebfe49","src/unix/linux_like/emscripten/no_align.r=
s":"0128e4aa721a9902754828b61b5ec7d8a86619983ed1e0544a85d35b1051fad6","src/=
unix/linux_like/linux/align.rs":"213e70ebed2703e14a9cf17666b21ecbf180b7bff7=
fa22fdbb36dbbd52df326d","src/unix/linux_like/linux/arch/generic/mod.rs":"ff=
1fe8fad4ea15d9bec3db25efcfcb4939190c5189f86cfa4d05825aa8c10956","src/unix/l=
inux_like/linux/arch/mips/mod.rs":"e4a980b002105aaa057eb6568e1e2c6168ade5c0=
0e13a31ef67e316ddffdb900","src/unix/linux_like/linux/arch/mod.rs":"466a2962=
2e47c6c7f1500682b2eb17f5566dd81b322cd6348f0fdd355cec593a","src/unix/linux_l=
ike/linux/arch/powerpc/mod.rs":"1789eb5b41f75c29239795124a4a7cdcf7c8d213b88=
cf581b2f5bda08d7cf15b","src/unix/linux_like/linux/arch/sparc/mod.rs":"ded70=
8124ee610267d011dee31fb02d1ec697c334aa822776ec95a7ddf6fc541","src/unix/linu=
x_like/linux/gnu/align.rs":"e4a3c27fe20a57b8d612c34cb05bc70646edb5cec725195=
7315afa53a7b9f936","src/unix/linux_like/linux/gnu/b32/arm/align.rs":"3fed00=
9dc9af3cc81be7087da9d2d7d1f39845e4497e290259c5cdbae25f039d","src/unix/linux=
_like/linux/gnu/b32/arm/mod.rs":"07adf9f4b96854062db518aaf08521fde0ad4a21a5=
c049efccba437bd97b2b5a","src/unix/linux_like/linux/gnu/b32/mips/align.rs":"=
429fb5e005cb7143602d430098b6ebfb7d360685b194f333dfd587472ae954ee","src/unix=
/linux_like/linux/gnu/b32/mips/mod.rs":"1cb5c0c9df3af2bbe131a91593583259fac=
9118931744c8435e197a394eb0462","src/unix/linux_like/linux/gnu/b32/mod.rs":"=
794dbcbae7dae8fd6b0b814573243197ceb532b56ef0772ad86b4b401478fcd9","src/unix=
/linux_like/linux/gnu/b32/powerpc.rs":"0cd7348badb9c4f8a0db31a2503b30c456a2=
bfcc7a0e5919762b1e12f912c5ad","src/unix/linux_like/linux/gnu/b32/riscv32/mo=
d.rs":"ee5145a383386b716605a8d1ff3df212d418aae1aa1f37d2307d4f9cd1a08e99","s=
rc/unix/linux_like/linux/gnu/b32/sparc/align.rs":"21adbed27df73e2d1ed934aaf=
733a643003d7baf2bde9c48ea440895bcca6d41","src/unix/linux_like/linux/gnu/b32=
/sparc/mod.rs":"1bcec269a8416ccc48a384ca5765eaaa23f30f39f32311f50008ef4eead=
afb2f","src/unix/linux_like/linux/gnu/b32/x86/align.rs":"e4bafdc4a519a7922a=
81b37a62bbfd1177a2f620890eef8f1fbc47162e9eb413","src/unix/linux_like/linux/=
gnu/b32/x86/mod.rs":"5317dbf2323577b89370bbee3894882b89d8333176db4f7b271ddc=
2f036ef43c","src/unix/linux_like/linux/gnu/b64/aarch64/align.rs":"2179c3b16=
08fa4bf68840482bfc2b2fa3ee2faf6fcae3770f9e505cddca35c7b","src/unix/linux_li=
ke/linux/gnu/b64/aarch64/ilp32.rs":"21a21503ef2e095f4371044915d4bfb07a85780=
11cb5c713cd9f45947b0b5730","src/unix/linux_like/linux/gnu/b64/aarch64/lp64.=
rs":"e78c3cd197f44832338b414d1a9bc0d194f44c74db77bd7bf830c1fff62b2690","src=
/unix/linux_like/linux/gnu/b64/aarch64/mod.rs":"c3730792dabcc166d8fd22929ef=
2633d49bc626875382dfcd401e8e125fb7a84","src/unix/linux_like/linux/gnu/b64/m=
ips64/align.rs":"7169d07a9fd4716f7512719aec9fda5d8bed306dc0720ffc1b21696c99=
51e3c6","src/unix/linux_like/linux/gnu/b64/mips64/mod.rs":"68bcb71bbfccb4e8=
648948e494366d94767ce96f36daab9c1329375cdd32a459","src/unix/linux_like/linu=
x/gnu/b64/mod.rs":"6336065423c26b59681fd2ce77f1117ea36af13e163fdadaefd108bd=
8191e8c8","src/unix/linux_like/linux/gnu/b64/powerpc64/align.rs":"e29c4868b=
becfa4a6cd8a2ad06193f3bbc78a468cc1dc9df83f002f1268130d9","src/unix/linux_li=
ke/linux/gnu/b64/powerpc64/mod.rs":"dbb8905e363ed4a2dfb984554ad9b6389d27f6a=
2d599ec2d80e38a6c7551a019","src/unix/linux_like/linux/gnu/b64/riscv64/mod.r=
s":"5b982c41097f4f91adcb0968290afeccb27dce1695a261c964d34ef85df87cf4","src/=
unix/linux_like/linux/gnu/b64/s390x.rs":"a9484dfd3c7ca1174537957bef997c3ba7=
ea41989cdf61ede22b1bbc45a667bf","src/unix/linux_like/linux/gnu/b64/sparc64/=
align.rs":"e29c4868bbecfa4a6cd8a2ad06193f3bbc78a468cc1dc9df83f002f1268130d9=
","src/unix/linux_like/linux/gnu/b64/sparc64/mod.rs":"26fda11bdce99372c2c24=
6e60866b56d98beb9fb49a2f6b69347ecfd03d18255","src/unix/linux_like/linux/gnu=
/b64/x86_64/align.rs":"7169d07a9fd4716f7512719aec9fda5d8bed306dc0720ffc1b21=
696c9951e3c6","src/unix/linux_like/linux/gnu/b64/x86_64/mod.rs":"5a5ce7c5c9=
2f60d8900dce63d363a38f3126aaf5be981710e172bec96ef95ac6","src/unix/linux_lik=
e/linux/gnu/b64/x86_64/not_x32.rs":"f775ac2b754f90b63053fe22afe1d19d306b540=
4995568d6805baa9249fb617f","src/unix/linux_like/linux/gnu/b64/x86_64/x32.rs=
":"4ba1b58468f55254717366f50fdfd3e4114fde6dc442a56681926c4d7e5b6b0d","src/u=
nix/linux_like/linux/gnu/mod.rs":"a040250bc2b4b2831ae2cad6f1abf3dc73e6015c4=
f570abf21350e220e898338","src/unix/linux_like/linux/gnu/no_align.rs":"9cd22=
3135de75315840ff9c3fd5441ba1cb632b96b5c85a76f8316c86653db25","src/unix/linu=
x_like/linux/mod.rs":"8f282fe98fe7fcdae158aad41b2a9e6130c130c7a041fe1391935=
7bf7b548057","src/unix/linux_like/linux/musl/b32/arm/align.rs":"3e8ac052c10=
43764776b54c93ba4260e061df998631737a897d9d47d54f7b80c","src/unix/linux_like=
/linux/musl/b32/arm/mod.rs":"6255abe2ee04986832d12b7b2190589580f2a43e9bfb28=
5b32b5747227f62727","src/unix/linux_like/linux/musl/b32/hexagon.rs":"a88117=
91809672be8338e6e27d1c4fcf383c2f26585be8bf9ab2923b219de032","src/unix/linux=
_like/linux/musl/b32/mips/align.rs":"429fb5e005cb7143602d430098b6ebfb7d3606=
85b194f333dfd587472ae954ee","src/unix/linux_like/linux/musl/b32/mips/mod.rs=
":"b9e9ff42363ebbb884ddf6445129ec4164471df45846874fc08f5f458e659254","src/u=
nix/linux_like/linux/musl/b32/mod.rs":"8ede3985e6243882814ce91e8ce543e7edba=
fc0cee5932816072b6f14207a671","src/unix/linux_like/linux/musl/b32/powerpc.r=
s":"4592dc5f1f2fe888dfef85fa862d42d168e73a2c6f4fc052b58287d0f4d4ffcd","src/=
unix/linux_like/linux/musl/b32/x86/align.rs":"08e77fbd7435d7dec2ff56932433b=
ece3f02e47ce810f89004a275a86d39cbe1","src/unix/linux_like/linux/musl/b32/x8=
6/mod.rs":"a19a8decfab185af3cebd34aae4b15082e7552be573904b8c1a3f0c0e493ef34=
","src/unix/linux_like/linux/musl/b64/aarch64/align.rs":"798a9229d70ce23539=
4f2dd625f6c4c1e10519a94382dc5b091952b638ae2928","src/unix/linux_like/linux/=
musl/b64/aarch64/mod.rs":"a73035c6d9b776f13b839008e15c04c2c53455571efd06664=
affcb047e457112","src/unix/linux_like/linux/musl/b64/mips64.rs":"2744895451=
f3a777fbe54f7f2695be53310b965fd62084c9b7e9121c7fe28346","src/unix/linux_lik=
e/linux/musl/b64/mod.rs":"d18abc0aeba2e26342bf3416a4dba0836db2bb0ee013b0a39=
629475cf8640289","src/unix/linux_like/linux/musl/b64/powerpc64.rs":"e5a5552=
5b42493923956d668f978fb45e22d51deea00ce5edbfddf76ff19c741","src/unix/linux_=
like/linux/musl/b64/s390x.rs":"03dfec6794d93cb31a7c52b2d53a0973755168f91f8f=
a437cc5dbd54882c8ee7","src/unix/linux_like/linux/musl/b64/x86_64/align.rs":=
"7169d07a9fd4716f7512719aec9fda5d8bed306dc0720ffc1b21696c9951e3c6","src/uni=
x/linux_like/linux/musl/b64/x86_64/mod.rs":"0dd168f5a6881f32e5239fb312b23cf=
137b800d0ff323286a92c8a2c382b5456","src/unix/linux_like/linux/musl/mod.rs":=
"55ccd71342276ccb4c441a4bc2772aebfd163af299669b658c6c8c6add331ec3","src/uni=
x/linux_like/linux/no_align.rs":"5ed04c53bf9d27da9b4d65ba7625c6ac5333016268=
3d1b3df98950caafa3507b","src/unix/linux_like/linux/uclibc/align.rs":"9ed161=
38d8e439bd90930845a65eafa7ebd67366e6bf633936d44014f6e4c959","src/unix/linux=
_like/linux/uclibc/arm/align.rs":"e4a3c27fe20a57b8d612c34cb05bc70646edb5cec=
7251957315afa53a7b9f936","src/unix/linux_like/linux/uclibc/arm/mod.rs":"1e3=
bf809508b5872949136859bf48ddf58b7d24ae9f0b663e79f0efd1aaeb6a6","src/unix/li=
nux_like/linux/uclibc/arm/no_align.rs":"9cd223135de75315840ff9c3fd5441ba1cb=
632b96b5c85a76f8316c86653db25","src/unix/linux_like/linux/uclibc/mips/mips3=
2/align.rs":"e4a3c27fe20a57b8d612c34cb05bc70646edb5cec7251957315afa53a7b9f9=
36","src/unix/linux_like/linux/uclibc/mips/mips32/mod.rs":"fa4102d9a596d90d=
e604ce2962b0e64f184dfbf10552a4c3ecf28f12d4704379","src/unix/linux_like/linu=
x/uclibc/mips/mips32/no_align.rs":"9cd223135de75315840ff9c3fd5441ba1cb632b9=
6b5c85a76f8316c86653db25","src/unix/linux_like/linux/uclibc/mips/mips64/ali=
gn.rs":"a7bdcb18a37a2d91e64d5fad83ea3edc78f5412adb28f77ab077dbb26dd08b2d","=
src/unix/linux_like/linux/uclibc/mips/mips64/mod.rs":"e3085ba56cfbc528d7c3c=
55065880603238c333b6047ef51c58177508a487fcd","src/unix/linux_like/linux/ucl=
ibc/mips/mips64/no_align.rs":"4a18e3875698c85229599225ac3401a2a40da87e77b2a=
d4ef47c6fcd5a24ed30","src/unix/linux_like/linux/uclibc/mips/mod.rs":"a28776=
79fef0f14f54a89ccbc41fb02f0c25bf6e536f9eb2cb2fa437e1d3f739","src/unix/linux=
_like/linux/uclibc/mod.rs":"82d504d3aa12cb0f7933980f81c4708fa6e070d4c57efdf=
407f2de05b71bc06d","src/unix/linux_like/linux/uclibc/no_align.rs":"3f286370=
46524618adaa1012e26cb7ffe94b9396e6b518cccdc69d59f274d709","src/unix/linux_l=
ike/linux/uclibc/x86_64/l4re.rs":"024eba5753e852dbdd212427351affe7e83f9916c=
1864bce414d7aa2618f192e","src/unix/linux_like/linux/uclibc/x86_64/mod.rs":"=
02e21c0550a423a3f6db0a0af6a0f37cf5937feb2562a490e0ad0e09a8d9fc77","src/unix=
/linux_like/linux/uclibc/x86_64/other.rs":"42c3f71e58cabba373f6a55a623f3c31=
b85049eb64824c09c2b082b3b2d6a0a8","src/unix/linux_like/mod.rs":"0a97d43fdce=
7f9bd57a0b47d770867f4e234eba602adc9ef993ed02a182276f2","src/unix/mod.rs":"6=
b2b57833e37cd3231944696c8216eb587a2a68069346150cf321153eaf04d03","src/unix/=
newlib/aarch64/mod.rs":"bb269c1468a9676442554600e87417079a787fe6220dfc23b31=
09639259e8710","src/unix/newlib/align.rs":"28aaf87fafbc6b312622719d472d8cf6=
5f9e5467d15339df5f73e66d8502b28a","src/unix/newlib/arm/mod.rs":"c71be856bfd=
7f576b2db28af9f680211cbe6c1cac7d537bbc8020b39591af07c","src/unix/newlib/esp=
idf/mod.rs":"c198cb4beccdab483be61c102da74dc51ac80f766797e33021f3110394ed5a=
3d","src/unix/newlib/mod.rs":"d7271c13748be08305d36f9af6f41f6950a7a1d6d4382=
149194a35d5fe2090de","src/unix/newlib/no_align.rs":"e0743b2179495a9514bc3a4=
d1781e492878c4ec834ee0085d0891dd1712e82fb","src/unix/newlib/powerpc/mod.rs"=
:"2d0f7af28b47f7a2a6c210ebd1c1f33ed8eac62e56b5af2b856de2ad3fdc5187","src/un=
ix/no_align.rs":"c06e95373b9088266e0b14bba0954eef95f93fb2b01d951855e382d22d=
e78e53","src/unix/redox/mod.rs":"267a413e63dbdcaed6e758f9a5c10bd00178ed76c7=
b3527e8e984341f617d3a5","src/unix/solarish/compat.rs":"b07a5bfac925eb012003=
a459ba6bddbd3bfa9c44b3394da2ac5a602e54beae9c","src/unix/solarish/illumos.rs=
":"7d8f47fd37880715b449723688aaee568785325a46f1c360a05bdca13252278e","src/u=
nix/solarish/mod.rs":"080e0cf03b50874ba9d5082b314eabb0d253532dc4b13d8af095a=
0c78e0fba84","src/unix/solarish/solaris.rs":"65b005453aefa9b9d4fc860fe77cfe=
c80d8c97a51342b15daf55fc3e808bb384","src/unix/solarish/x86_64.rs":"9d761573=
bdccbdd1ac61da571f7e96b5374df70241d9b72d45a069611f495085","src/vxworks/aarc=
h64.rs":"98f0afdc511cd02557e506c21fed6737585490a1dce7a9d4941d08c437762b99",=
"src/vxworks/arm.rs":"acb7968ce99fe3f4abdf39d98f8133d21a4fba435b8ef7084777c=
b181d788e88","src/vxworks/mod.rs":"aea3da66f2140f2a82dfc9c58f6e6531d2dd9c15=
ea696e0f95a0d4a2a187b5b6","src/vxworks/powerpc.rs":"acb7968ce99fe3f4abdf39d=
98f8133d21a4fba435b8ef7084777cb181d788e88","src/vxworks/powerpc64.rs":"98f0=
afdc511cd02557e506c21fed6737585490a1dce7a9d4941d08c437762b99","src/vxworks/=
x86.rs":"552f007f38317620b23889cb7c49d1d115841252439060122f52f434fbc6e5ba",=
"src/vxworks/x86_64.rs":"018d92be3ad628a129eff9f2f5dfbc0883d8b8e5f2fa917b90=
0a7f98ed6b514a","src/wasi.rs":"2c945bce3ddd26bf20ff03fb4192c9c3f625f1308a47=
9c5cb4bd4510a892629a","src/windows/gnu/align.rs":"b2c13ec1b9f3b39a75c452c80=
c951dff9d0215e31d77e883b4502afb31794647","src/windows/gnu/mod.rs":"3c8c7edb=
7cdf5d0c44af936db2a94869585c69dfabeef30571b4f4e38375767a","src/windows/mod.=
rs":"1cd9223293255b994814487e28d9979fb8ebef4538a236c1aa47fdc166a149cc","src=
/windows/msvc/mod.rs":"860dc98245039bc3aa5782ef2b5798d009ea6655bd27a63f244b=
e2206d2cb47f","src/windows/msvc/x86_64.rs":"25d35a5ba8e19569a5bed573dcf8c82=
f7ce53da7c91941f9ceda6fe86cab1088","tests/const_fn.rs":"cb75a1f0864f926aebe=
79118fc34d51a0d1ade2c20a394e7774c7e545f21f1f4"},"package":"dd8f7255a17a6273=
54f321ef0055d63b898c6fb27eff628af4d1b66b7331edf6"}
 \ No newline at end of file
-+{"files":{"CONTRIBUTING.md":"752eea5a703d11b485c6b5f195f51bd2c79aa5159b61=
9ce09555c779e1fb586b","Cargo.toml":"9d8cd25bb60fc4bb42c4b034bfa26ba45a691fd=
7cae155dab8f8b5819fe12647","LICENSE-APACHE":"a60eea817514531668d7e007657314=
49fe14d059d3249e0bc93b36de45f759f2","LICENSE-MIT":"a8d47ff51ca256f56a8932db=
a07660672dbfe3004257ca8de708aac1415937a1","README.md":"8228847944f1332882fb=
b00275b6f30e4a8aad08a13569c25d52cac012cc2a47","build.rs":"8e0e8d33cc9e7c25c=
de75c2b502420f943266a681024169f94084774b422681d","rustfmt.toml":"eaa2ea84fc=
1ba0359b77680804903e07bb38d257ab11986b95b158e460f787b2","src/fixed_width_in=
ts.rs":"34c60f12ec5eeb90f13ec3b954427532111c2446e69617616a97aefc1086a9f1","=
src/fuchsia/aarch64.rs":"378776a9e40766154a54c94c2a7b4675b5c302a38e6e42da99=
e67bfbaee60e56","src/fuchsia/align.rs":"ae1cf8f011a99737eabeb14ffff768e60f1=
3b13363d7646744dbb0f443dab3d6","src/fuchsia/mod.rs":"975b86cbe0335d64082ca8=
8bb24f0e3402371f6f5b33e940c4e12ce4342bb658","src/fuchsia/no_align.rs":"303f=
3f1b255e0088b5715094353cf00476131d8e94e6aebb3f469557771c8b8a","src/fuchsia/=
x86_64.rs":"93a3632b5cf67d2a6bcb7dc0a558605252d5fe689e0f38d8aa2ec5852255ac8=
7","src/hermit/aarch64.rs":"86048676e335944c37a63d0083d0f368ae10ceccefeed9d=
ebb3bbe08777fc682","src/hermit/mod.rs":"d3bfce41e4463d4be8020a2d063c9bfa8b6=
65f45f1cc6cbf3163f5d01e7cb21f","src/hermit/x86_64.rs":"ab832b7524e5fb15c49f=
f7431165ab1a37dc4667ae0b58e8306f4c539bfa110c","src/lib.rs":"d4f7452c0fe720f=
3a961b918b74ec86d19cef33e6b4aac08efbbad6f6d818e09","src/macros.rs":"7844312=
c233a6889fa15395fe3106f6a8f6229211104a92f33ea3c9536eef763","src/psp.rs":"dd=
31aabd46171d474ec5828372e28588935120e7355c90c105360d8fa9264c1c","src/sgx.rs=
":"16a95cdefc81c5ee00d8353a60db363c4cc3e0f75abcd5d0144723f2a306ed1b","src/s=
witch.rs":"9da3dd39b3de45a7928789926e8572d00e1e11a39e6f7289a1349aadce90edba=
","src/unix/align.rs":"2cdc7c826ef7ae61f5171c5ae8c445a743d86f1a7f2d9d7e4cee=
ec56d6874f65","src/unix/bsd/apple/b32/align.rs":"ec833a747866fe19ca2d9b4d3c=
9ff0385faba5edf4bd0d15fa68884c40b0e26c","src/unix/bsd/apple/b32/mod.rs":"6a=
4ce300da0d2b0db04b18548286603ffe4b47d679a41cf60f1902895894aa1f","src/unix/b=
sd/apple/b64/aarch64/align.rs":"f0c321265dd7671f16106b84951ac7dd77ed2e65c66=
23cbf2d29e76531984770","src/unix/bsd/apple/b64/aarch64/mod.rs":"46d5d061c7a=
74cbc09cbdfb3bee9a600867bf4e04c0e4d0ca6c817e6033b32e1","src/unix/bsd/apple/=
b64/align.rs":"ec833a747866fe19ca2d9b4d3c9ff0385faba5edf4bd0d15fa68884c40b0=
e26c","src/unix/bsd/apple/b64/mod.rs":"f5e278a1af7fb358891d1c9be4eb7e815aac=
a0c5cb738d0c3604ba2208a856f7","src/unix/bsd/apple/b64/x86_64/align.rs":"ec8=
33a747866fe19ca2d9b4d3c9ff0385faba5edf4bd0d15fa68884c40b0e26c","src/unix/bs=
d/apple/b64/x86_64/mod.rs":"cc6878dd130c3f255418e4da74992ae9ba6a3cdb0530772=
de76c518077d3b12a","src/unix/bsd/apple/mod.rs":"55e2ddba00f002fac0e3ed1c439=
32423ea6682aaff95491542dce9562c81e217","src/unix/bsd/freebsdlike/dragonfly/=
errno.rs":"8295b8bb0dfd38d2cdb4d9192cdeeb534cc6c3b208170e64615fa3e0edb3e578=
","src/unix/bsd/freebsdlike/dragonfly/mod.rs":"efdfed8f750d6a6233a3a753be80=
bdb6e06ec9ccdfa5b9246f09aa1d39d3cffe","src/unix/bsd/freebsdlike/freebsd/aar=
ch64.rs":"14f0bd6693967d4fedec904f7042bd51f2138cb843ec4df18c911b357417cdd2"=
,"src/unix/bsd/freebsdlike/freebsd/arm.rs":"59d6a670eea562fb87686e243e0a846=
03d29a2028a3d4b3f99ccc01bd04d2f47","src/unix/bsd/freebsdlike/freebsd/freebs=
d11/b64.rs":"9808d152c1196aa647f1b0f0cf84dac8c930da7d7f897a44975545e3d9d176=
81","src/unix/bsd/freebsdlike/freebsd/freebsd11/mod.rs":"6523af60c0e4937ad3=
74003c1653e9e721f5b6f11572c747732f76522d07d034","src/unix/bsd/freebsdlike/f=
reebsd/freebsd12/b64.rs":"61cbe45f8499bedb168106b686d4f8239472f25c7553b069e=
ec2afe197ff2df6","src/unix/bsd/freebsdlike/freebsd/freebsd12/mod.rs":"b449a=
5914d3175e0a390bad616370f28fe59efaee3b81c38fb6e556507c2711a","src/unix/bsd/=
freebsdlike/freebsd/freebsd13/b64.rs":"61cbe45f8499bedb168106b686d4f8239472=
f25c7553b069eec2afe197ff2df6","src/unix/bsd/freebsdlike/freebsd/freebsd13/m=
od.rs":"ce31af8c04d1a1b384f55f80db14b5f74c59d02c94b3b30288411c9bca5eba04","=
src/unix/bsd/freebsdlike/freebsd/mod.rs":"a4fc19429762fac85106180e87c4d10a6=
1b4c07563f4e844771fcde71c14fc51","src/unix/bsd/freebsdlike/freebsd/powerpc.=
rs":"9ca3f82f88974e6db5569f2d76a5a3749b248a31747a6c0da5820492bdfeca42","src=
/unix/bsd/freebsdlike/freebsd/powerpc64.rs":"2dae3ecc87eac3b11657aa98915def=
55fc4b5c0de11fe26aae23329a54628a9a","src/unix/bsd/freebsdlike/freebsd/x86.r=
s":"c5005e3249eb7c93cfbac72a9e9272320d80ce7983da990ceb05a447f59a02c5","src/=
unix/bsd/freebsdlike/freebsd/x86_64/align.rs":"0e1f69a88fca1c32874b1daf5db3=
d446fefbe518dca497f096cc9168c39dde70","src/unix/bsd/freebsdlike/freebsd/x86=
_64/mod.rs":"6132aa0973454379674ea6cbc77e6eace1e1032dd9f38182071388a036f1bc=
08","src/unix/bsd/freebsdlike/mod.rs":"9dbe0fcf66f13ba27f163d9f4362c25036ff=
1973a3b67244bcb3e8f39c3efbfd","src/unix/bsd/mod.rs":"67e0932ebcd1605045744c=
3f15286204cc547019b0a2696419da1c14c61393f5","src/unix/bsd/netbsdlike/mod.rs=
":"ceaec69f85bbe5beaf0b2dd73e0fd2b7fa49c0ea9727dcf51415f99bd2bc4b9c","src/u=
nix/bsd/netbsdlike/netbsd/aarch64.rs":"b38fc046f9a40fea28bd26328b96629f4d5d=
63d7524936bd6af1865d401a8716","src/unix/bsd/netbsdlike/netbsd/arm.rs":"58cd=
bb70b0d6f536551f0f3bb3725d2d75c4690db12c26c034e7d6ec4a924452","src/unix/bsd=
/netbsdlike/netbsd/mod.rs":"6b30cadcf243eb6098cad6ec869f4739570df0f356aefd8=
26ef1c347c146685c","src/unix/bsd/netbsdlike/netbsd/powerpc.rs":"ee7ff5d89d0=
ed22f531237b5059aa669df93a3b5c489fa641465ace8d405bf41","src/unix/bsd/netbsd=
like/netbsd/sparc64.rs":"9489f4b3e4566f43bb12dfb92238960613dac7f6a45cc13068=
a8d152b902d7d9","src/unix/bsd/netbsdlike/netbsd/x86.rs":"20692320e36bfe028d=
1a34d16fe12ca77aa909cb02bda167376f98f1a09aefe7","src/unix/bsd/netbsdlike/ne=
tbsd/x86_64.rs":"1afe5ef46b14397cdd68664b5b232e4f5b035b6db1d4cf411c899d51eb=
ca9f30","src/unix/bsd/netbsdlike/openbsd/aarch64.rs":"1dd5449dd1fd3d51e30ff=
deeaece91d0aaf05c710e0ac699fecc5461cfa2c28e","src/unix/bsd/netbsdlike/openb=
sd/mod.rs":"ac6fff797511b00659849242b997de4d9f948698b5677de928375fc84d2ac1f=
3","src/unix/bsd/netbsdlike/openbsd/sparc64.rs":"d04fd287afbaa2c5df9d48c94e=
8374a532a3ba491b424ddf018270c7312f4085","src/unix/bsd/netbsdlike/openbsd/x8=
6.rs":"6f7f5c4fde2a2259eb547890cbd86570cea04ef85347d7569e94e679448bec87","s=
rc/unix/bsd/netbsdlike/openbsd/x86_64.rs":"e59b7fd65f68f8e857eec39e0c03bac1=
d3af6ddc26c9ba58494336b83659bb9b","src/unix/haiku/b32.rs":"69ae47fc52c6880e=
85416b4744500d5655c9ec6131cb737f3b649fceaadce15a","src/unix/haiku/b64.rs":"=
73e64db09275a8da8d50a13cce2cfa2b136036ddf3a930d2939f337fc995900b","src/unix=
/haiku/mod.rs":"cb829d468fecc8dacf3f03f5808f0c265a62dc82e34a208a025a8b90302=
7a121","src/unix/haiku/native.rs":"fd34e56a7b27591d83a980c92afefc543df9a2d4=
fe64c732d2b7d6aea31ac0a3","src/unix/hermit/aarch64.rs":"86048676e335944c37a=
63d0083d0f368ae10ceccefeed9debb3bbe08777fc682","src/unix/hermit/mod.rs":"85=
9814f5df89e28fd4b345db399d181e11e7ed413841b6ff703a1fcbdbf013ae","src/unix/h=
ermit/x86_64.rs":"ab832b7524e5fb15c49ff7431165ab1a37dc4667ae0b58e8306f4c539=
bfa110c","src/unix/linux_like/android/b32/arm.rs":"433c1530f602cc5ed26610c5=
8055dde0c4ceea5e00150063b24ddc60768332a4","src/unix/linux_like/android/b32/=
mod.rs":"d971b98530a96f5892f98e1edc3133cf278d1b3939d77ab0a27a6323e0961715",=
"src/unix/linux_like/android/b32/x86/align.rs":"812914e4241df82e32b12375ca3=
374615dc3a4bdd4cf31f0423c5815320c0dab","src/unix/linux_like/android/b32/x86=
/mod.rs":"8388bd3a0fcb5636bf965eee6dc95ae6860b85a2b555b387c868aa4d4e01ec89"=
,"src/unix/linux_like/android/b64/aarch64/align.rs":"2179c3b1608fa4bf688404=
82bfc2b2fa3ee2faf6fcae3770f9e505cddca35c7b","src/unix/linux_like/android/b6=
4/aarch64/mod.rs":"8fe667d2b14abc5ac8aad32e16c3da24350471d8156eaea9ab4989f7=
3dd9f9fc","src/unix/linux_like/android/b64/mod.rs":"5d94d05d8c10a748f0b1f67=
a4abaf4dd8415351e14e3bc6c84f6a46c8e18874c","src/unix/linux_like/android/b64=
/x86_64/align.rs":"7169d07a9fd4716f7512719aec9fda5d8bed306dc0720ffc1b21696c=
9951e3c6","src/unix/linux_like/android/b64/x86_64/mod.rs":"06b22dc184e85a98=
8ab969c75cadc52b9878faeab0eb9d21215878c95fe07c19","src/unix/linux_like/andr=
oid/mod.rs":"9e79edebb5c7b1b62f0e253570d02338a50f06fdb2fd4b27488e0ae50871a8=
36","src/unix/linux_like/emscripten/align.rs":"86c95cbed7a7161b1f23ee06843e=
7b0e2340ad92b2cb86fe2a8ef3e0e8c36216","src/unix/linux_like/emscripten/mod.r=
s":"6ef97140ca6fb24125fdd0aacb986ef785aa21993229660d7f703f8875ebfe49","src/=
unix/linux_like/emscripten/no_align.rs":"0128e4aa721a9902754828b61b5ec7d8a8=
6619983ed1e0544a85d35b1051fad6","src/unix/linux_like/linux/align.rs":"213e7=
0ebed2703e14a9cf17666b21ecbf180b7bff7fa22fdbb36dbbd52df326d","src/unix/linu=
x_like/linux/arch/generic/mod.rs":"ff1fe8fad4ea15d9bec3db25efcfcb4939190c51=
89f86cfa4d05825aa8c10956","src/unix/linux_like/linux/arch/mips/mod.rs":"e4a=
980b002105aaa057eb6568e1e2c6168ade5c00e13a31ef67e316ddffdb900","src/unix/li=
nux_like/linux/arch/mod.rs":"466a29622e47c6c7f1500682b2eb17f5566dd81b322cd6=
348f0fdd355cec593a","src/unix/linux_like/linux/arch/powerpc/mod.rs":"1789eb=
5b41f75c29239795124a4a7cdcf7c8d213b88cf581b2f5bda08d7cf15b","src/unix/linux=
_like/linux/arch/sparc/mod.rs":"ded708124ee610267d011dee31fb02d1ec697c334aa=
822776ec95a7ddf6fc541","src/unix/linux_like/linux/gnu/align.rs":"e4a3c27fe2=
0a57b8d612c34cb05bc70646edb5cec7251957315afa53a7b9f936","src/unix/linux_lik=
e/linux/gnu/b32/arm/align.rs":"3fed009dc9af3cc81be7087da9d2d7d1f39845e4497e=
290259c5cdbae25f039d","src/unix/linux_like/linux/gnu/b32/arm/mod.rs":"07adf=
9f4b96854062db518aaf08521fde0ad4a21a5c049efccba437bd97b2b5a","src/unix/linu=
x_like/linux/gnu/b32/mips/align.rs":"429fb5e005cb7143602d430098b6ebfb7d3606=
85b194f333dfd587472ae954ee","src/unix/linux_like/linux/gnu/b32/mips/mod.rs"=
:"1cb5c0c9df3af2bbe131a91593583259fac9118931744c8435e197a394eb0462","src/un=
ix/linux_like/linux/gnu/b32/mod.rs":"794dbcbae7dae8fd6b0b814573243197ceb532=
b56ef0772ad86b4b401478fcd9","src/unix/linux_like/linux/gnu/b32/powerpc.rs":=
"0cd7348badb9c4f8a0db31a2503b30c456a2bfcc7a0e5919762b1e12f912c5ad","src/uni=
x/linux_like/linux/gnu/b32/riscv32/mod.rs":"9c628cd97806181dc4d34b072f63fe1=
eb42f08108712002e0628ffe27f2fa93f","src/unix/linux_like/linux/gnu/b32/sparc=
/align.rs":"21adbed27df73e2d1ed934aaf733a643003d7baf2bde9c48ea440895bcca6d4=
1","src/unix/linux_like/linux/gnu/b32/sparc/mod.rs":"1bcec269a8416ccc48a384=
ca5765eaaa23f30f39f32311f50008ef4eeadafb2f","src/unix/linux_like/linux/gnu/=
b32/x86/align.rs":"e4bafdc4a519a7922a81b37a62bbfd1177a2f620890eef8f1fbc4716=
2e9eb413","src/unix/linux_like/linux/gnu/b32/x86/mod.rs":"5317dbf2323577b89=
370bbee3894882b89d8333176db4f7b271ddc2f036ef43c","src/unix/linux_like/linux=
/gnu/b64/aarch64/align.rs":"2179c3b1608fa4bf68840482bfc2b2fa3ee2faf6fcae377=
0f9e505cddca35c7b","src/unix/linux_like/linux/gnu/b64/aarch64/ilp32.rs":"21=
a21503ef2e095f4371044915d4bfb07a8578011cb5c713cd9f45947b0b5730","src/unix/l=
inux_like/linux/gnu/b64/aarch64/lp64.rs":"e78c3cd197f44832338b414d1a9bc0d19=
4f44c74db77bd7bf830c1fff62b2690","src/unix/linux_like/linux/gnu/b64/aarch64=
/mod.rs":"c3730792dabcc166d8fd22929ef2633d49bc626875382dfcd401e8e125fb7a84"=
,"src/unix/linux_like/linux/gnu/b64/mips64/align.rs":"7169d07a9fd4716f75127=
19aec9fda5d8bed306dc0720ffc1b21696c9951e3c6","src/unix/linux_like/linux/gnu=
/b64/mips64/mod.rs":"68bcb71bbfccb4e8648948e494366d94767ce96f36daab9c132937=
5cdd32a459","src/unix/linux_like/linux/gnu/b64/mod.rs":"6336065423c26b59681=
fd2ce77f1117ea36af13e163fdadaefd108bd8191e8c8","src/unix/linux_like/linux/g=
nu/b64/powerpc64/align.rs":"e29c4868bbecfa4a6cd8a2ad06193f3bbc78a468cc1dc9d=
f83f002f1268130d9","src/unix/linux_like/linux/gnu/b64/powerpc64/mod.rs":"db=
b8905e363ed4a2dfb984554ad9b6389d27f6a2d599ec2d80e38a6c7551a019","src/unix/l=
inux_like/linux/gnu/b64/riscv64/mod.rs":"18edaa89c9746125863ff53182e0ef32cb=
1e1612e1ed9a2672558a9de85440e9","src/unix/linux_like/linux/gnu/b64/s390x.rs=
":"d9bb4e524e70d6fef49e0f77d89a92f478fd95d9a1aea32f4dc845275a7465d4","src/u=
nix/linux_like/linux/gnu/b64/sparc64/align.rs":"e29c4868bbecfa4a6cd8a2ad061=
93f3bbc78a468cc1dc9df83f002f1268130d9","src/unix/linux_like/linux/gnu/b64/s=
parc64/mod.rs":"26fda11bdce99372c2c246e60866b56d98beb9fb49a2f6b69347ecfd03d=
18255","src/unix/linux_like/linux/gnu/b64/x86_64/align.rs":"7169d07a9fd4716=
f7512719aec9fda5d8bed306dc0720ffc1b21696c9951e3c6","src/unix/linux_like/lin=
ux/gnu/b64/x86_64/mod.rs":"5a5ce7c5c92f60d8900dce63d363a38f3126aaf5be981710=
e172bec96ef95ac6","src/unix/linux_like/linux/gnu/b64/x86_64/not_x32.rs":"f7=
75ac2b754f90b63053fe22afe1d19d306b5404995568d6805baa9249fb617f","src/unix/l=
inux_like/linux/gnu/b64/x86_64/x32.rs":"4ba1b58468f55254717366f50fdfd3e4114=
fde6dc442a56681926c4d7e5b6b0d","src/unix/linux_like/linux/gnu/mod.rs":"5597=
b67f1cfc4e2012540a8cebf17ff139363c0835834ca8f308952ffe6e99c9","src/unix/lin=
ux_like/linux/gnu/no_align.rs":"9cd223135de75315840ff9c3fd5441ba1cb632b96b5=
c85a76f8316c86653db25","src/unix/linux_like/linux/mod.rs":"d6f8e72a6d67e0af=
6d1f7a09420f92906a52ae226a66f43268064249ce7019df","src/unix/linux_like/linu=
x/musl/b32/arm/align.rs":"3e8ac052c1043764776b54c93ba4260e061df998631737a89=
7d9d47d54f7b80c","src/unix/linux_like/linux/musl/b32/arm/mod.rs":"6255abe2e=
e04986832d12b7b2190589580f2a43e9bfb285b32b5747227f62727","src/unix/linux_li=
ke/linux/musl/b32/hexagon.rs":"a8811791809672be8338e6e27d1c4fcf383c2f26585b=
e8bf9ab2923b219de032","src/unix/linux_like/linux/musl/b32/mips/align.rs":"4=
29fb5e005cb7143602d430098b6ebfb7d360685b194f333dfd587472ae954ee","src/unix/=
linux_like/linux/musl/b32/mips/mod.rs":"b9e9ff42363ebbb884ddf6445129ec41644=
71df45846874fc08f5f458e659254","src/unix/linux_like/linux/musl/b32/mod.rs":=
"8ede3985e6243882814ce91e8ce543e7edbafc0cee5932816072b6f14207a671","src/uni=
x/linux_like/linux/musl/b32/powerpc.rs":"4592dc5f1f2fe888dfef85fa862d42d168=
e73a2c6f4fc052b58287d0f4d4ffcd","src/unix/linux_like/linux/musl/b32/x86/ali=
gn.rs":"08e77fbd7435d7dec2ff56932433bece3f02e47ce810f89004a275a86d39cbe1","=
src/unix/linux_like/linux/musl/b32/x86/mod.rs":"a19a8decfab185af3cebd34aae4=
b15082e7552be573904b8c1a3f0c0e493ef34","src/unix/linux_like/linux/musl/b64/=
aarch64/align.rs":"798a9229d70ce235394f2dd625f6c4c1e10519a94382dc5b091952b6=
38ae2928","src/unix/linux_like/linux/musl/b64/aarch64/mod.rs":"a73035c6d9b7=
76f13b839008e15c04c2c53455571efd06664affcb047e457112","src/unix/linux_like/=
linux/musl/b64/mips64.rs":"2744895451f3a777fbe54f7f2695be53310b965fd62084c9=
b7e9121c7fe28346","src/unix/linux_like/linux/musl/b64/mod.rs":"d847206d9f2d=
594c8febe780a938cdccf40d985dafc11e90f235947735a09bac","src/unix/linux_like/=
linux/musl/b64/powerpc64.rs":"e5a55525b42493923956d668f978fb45e22d51deea00c=
e5edbfddf76ff19c741","src/unix/linux_like/linux/musl/b64/s390x.rs":"03dfec6=
794d93cb31a7c52b2d53a0973755168f91f8fa437cc5dbd54882c8ee7","src/unix/linux_=
like/linux/musl/b64/x86_64/align.rs":"7169d07a9fd4716f7512719aec9fda5d8bed3=
06dc0720ffc1b21696c9951e3c6","src/unix/linux_like/linux/musl/b64/x86_64/mod=
.rs":"0dd168f5a6881f32e5239fb312b23cf137b800d0ff323286a92c8a2c382b5456","sr=
c/unix/linux_like/linux/musl/mod.rs":"b69394bbcab5c452d3d3c04541a35702b9394=
f52cf63628449a5a2b61059517a","src/unix/linux_like/linux/no_align.rs":"5ed04=
c53bf9d27da9b4d65ba7625c6ac53330162683d1b3df98950caafa3507b","src/unix/linu=
x_like/linux/uclibc/align.rs":"9ed16138d8e439bd90930845a65eafa7ebd67366e6bf=
633936d44014f6e4c959","src/unix/linux_like/linux/uclibc/arm/align.rs":"e4a3=
c27fe20a57b8d612c34cb05bc70646edb5cec7251957315afa53a7b9f936","src/unix/lin=
ux_like/linux/uclibc/arm/mod.rs":"9b691eeec0a9bf7b2abb87e09062d2c148d18e11c=
96ecad0edd0b74d1d0509fd","src/unix/linux_like/linux/uclibc/arm/no_align.rs"=
:"9cd223135de75315840ff9c3fd5441ba1cb632b96b5c85a76f8316c86653db25","src/un=
ix/linux_like/linux/uclibc/mips/mips32/align.rs":"e4a3c27fe20a57b8d612c34cb=
05bc70646edb5cec7251957315afa53a7b9f936","src/unix/linux_like/linux/uclibc/=
mips/mips32/mod.rs":"18753a99b820d69e062e3ba22a63fa86577b6dcc42f740479c7be1=
a4c658e1be","src/unix/linux_like/linux/uclibc/mips/mips32/no_align.rs":"9cd=
223135de75315840ff9c3fd5441ba1cb632b96b5c85a76f8316c86653db25","src/unix/li=
nux_like/linux/uclibc/mips/mips64/align.rs":"a7bdcb18a37a2d91e64d5fad83ea3e=
dc78f5412adb28f77ab077dbb26dd08b2d","src/unix/linux_like/linux/uclibc/mips/=
mips64/mod.rs":"e3085ba56cfbc528d7c3c55065880603238c333b6047ef51c58177508a4=
87fcd","src/unix/linux_like/linux/uclibc/mips/mips64/no_align.rs":"4a18e387=
5698c85229599225ac3401a2a40da87e77b2ad4ef47c6fcd5a24ed30","src/unix/linux_l=
ike/linux/uclibc/mips/mod.rs":"656fbf5157ab6d06fc365a8353b138818ad5b8429ea5=
628ff35a3972c63a1a7c","src/unix/linux_like/linux/uclibc/mod.rs":"22f712c3e0=
8fd8cb37e274718de1bac09966a4cd4b0f018f28737bc30940b8af","src/unix/linux_lik=
e/linux/uclibc/no_align.rs":"3f28637046524618adaa1012e26cb7ffe94b9396e6b518=
cccdc69d59f274d709","src/unix/linux_like/linux/uclibc/x86_64/l4re.rs":"bb31=
053d6403091e11f95ac2203982f279f8b984a19adf30796878c45fdd8c25","src/unix/lin=
ux_like/linux/uclibc/x86_64/mod.rs":"02e21c0550a423a3f6db0a0af6a0f37cf5937f=
eb2562a490e0ad0e09a8d9fc77","src/unix/linux_like/linux/uclibc/x86_64/other.=
rs":"42c3f71e58cabba373f6a55a623f3c31b85049eb64824c09c2b082b3b2d6a0a8","src=
/unix/linux_like/mod.rs":"9f6eadebed153e31777482932dae2f3fd3471d5b5465099f9=
8f1e2a9429922fe","src/unix/mod.rs":"0550f5ed6a8292e62781cdfcca54b0f2652dd27=
9314d1b73db555fccfb059499","src/unix/newlib/aarch64/mod.rs":"bb269c1468a967=
6442554600e87417079a787fe6220dfc23b3109639259e8710","src/unix/newlib/align.=
rs":"28aaf87fafbc6b312622719d472d8cf65f9e5467d15339df5f73e66d8502b28a","src=
/unix/newlib/arm/mod.rs":"c71be856bfd7f576b2db28af9f680211cbe6c1cac7d537bbc=
8020b39591af07c","src/unix/newlib/espidf/mod.rs":"c198cb4beccdab483be61c102=
da74dc51ac80f766797e33021f3110394ed5a3d","src/unix/newlib/mod.rs":"07c282da=
3fedf04d061c70ab918b561ba44e5d67670e0b04664505afc9c5979f","src/unix/newlib/=
no_align.rs":"e0743b2179495a9514bc3a4d1781e492878c4ec834ee0085d0891dd1712e8=
2fb","src/unix/newlib/powerpc/mod.rs":"2d0f7af28b47f7a2a6c210ebd1c1f33ed8ea=
c62e56b5af2b856de2ad3fdc5187","src/unix/no_align.rs":"c06e95373b9088266e0b1=
4bba0954eef95f93fb2b01d951855e382d22de78e53","src/unix/redox/mod.rs":"251ad=
e5cbe9d648ba7186f58dfe7d4fd8e08be1ab9d0d51bba13e0bf3a0207d0","src/unix/sola=
rish/compat.rs":"b07a5bfac925eb012003a459ba6bddbd3bfa9c44b3394da2ac5a602e54=
beae9c","src/unix/solarish/illumos.rs":"be7cf5334fc8f2c6bc1b856288e53af7f90=
a92bd64793eb19b60b660383e508c","src/unix/solarish/mod.rs":"a5e87e2197011cea=
e4d6aa1bc8a16d2e01dd39583448e6809f32ba58143baee9","src/unix/solarish/solari=
s.rs":"65b005453aefa9b9d4fc860fe77cfec80d8c97a51342b15daf55fc3e808bb384","s=
rc/vxworks/aarch64.rs":"98f0afdc511cd02557e506c21fed6737585490a1dce7a9d4941=
d08c437762b99","src/vxworks/arm.rs":"acb7968ce99fe3f4abdf39d98f8133d21a4fba=
435b8ef7084777cb181d788e88","src/vxworks/mod.rs":"2689e3cad6461682892fcae8a=
23c0c51600e4750c147dd8d7538c6c6c876b7ec","src/vxworks/powerpc.rs":"acb7968c=
e99fe3f4abdf39d98f8133d21a4fba435b8ef7084777cb181d788e88","src/vxworks/powe=
rpc64.rs":"98f0afdc511cd02557e506c21fed6737585490a1dce7a9d4941d08c437762b99=
","src/vxworks/x86.rs":"552f007f38317620b23889cb7c49d1d115841252439060122f5=
2f434fbc6e5ba","src/vxworks/x86_64.rs":"018d92be3ad628a129eff9f2f5dfbc0883d=
8b8e5f2fa917b900a7f98ed6b514a","src/wasi.rs":"3800e710a40322fe0229f7665b185=
42dc066680c4d151e3c4f29f82202a1c294","src/windows/gnu/align.rs":"b2c13ec1b9=
f3b39a75c452c80c951dff9d0215e31d77e883b4502afb31794647","src/windows/gnu/mo=
d.rs":"3c8c7edb7cdf5d0c44af936db2a94869585c69dfabeef30571b4f4e38375767a","s=
rc/windows/mod.rs":"2b960d585c2fc0c82659cc4caeaa3268e67a8de0a0390d084629eef=
d39a14c8d","src/windows/msvc.rs":"ea6d87a6a9cd668261b1c043e7c36cf599e80b5d0=
9f6e4502e85daa4797c7927","tests/const_fn.rs":"cb75a1f0864f926aebe79118fc34d=
51a0d1ade2c20a394e7774c7e545f21f1f4"},"package":"a7f823d141fe0a24df1e23b4af=
4e3c7ba9e5966ec514ea068c93024aa7deb765"}
++{"files":{"CONTRIBUTING.md":"752eea5a703d11b485c6b5f195f51bd2c79aa5159b61=
9ce09555c779e1fb586b","Cargo.toml":"aad61c58f04e78be520769d8927ab4c121a6536=
f532b159be1b706550fcd0234","LICENSE-APACHE":"a60eea817514531668d7e007657314=
49fe14d059d3249e0bc93b36de45f759f2","LICENSE-MIT":"a8d47ff51ca256f56a8932db=
a07660672dbfe3004257ca8de708aac1415937a1","README.md":"8228847944f1332882fb=
b00275b6f30e4a8aad08a13569c25d52cac012cc2a47","build.rs":"8e0e8d33cc9e7c25c=
de75c2b502420f943266a681024169f94084774b422681d","rustfmt.toml":"eaa2ea84fc=
1ba0359b77680804903e07bb38d257ab11986b95b158e460f787b2","src/fixed_width_in=
ts.rs":"34c60f12ec5eeb90f13ec3b954427532111c2446e69617616a97aefc1086a9f1","=
src/fuchsia/aarch64.rs":"378776a9e40766154a54c94c2a7b4675b5c302a38e6e42da99=
e67bfbaee60e56","src/fuchsia/align.rs":"ae1cf8f011a99737eabeb14ffff768e60f1=
3b13363d7646744dbb0f443dab3d6","src/fuchsia/mod.rs":"520300ff260d377930f2f4=
56135ec9a3ac7740a949ce7bf5269c0dc60d56c0df","src/fuchsia/no_align.rs":"303f=
3f1b255e0088b5715094353cf00476131d8e94e6aebb3f469557771c8b8a","src/fuchsia/=
x86_64.rs":"93a3632b5cf67d2a6bcb7dc0a558605252d5fe689e0f38d8aa2ec5852255ac8=
7","src/hermit/aarch64.rs":"86048676e335944c37a63d0083d0f368ae10ceccefeed9d=
ebb3bbe08777fc682","src/hermit/mod.rs":"d3bfce41e4463d4be8020a2d063c9bfa8b6=
65f45f1cc6cbf3163f5d01e7cb21f","src/hermit/x86_64.rs":"ab832b7524e5fb15c49f=
f7431165ab1a37dc4667ae0b58e8306f4c539bfa110c","src/lib.rs":"d4f7452c0fe720f=
3a961b918b74ec86d19cef33e6b4aac08efbbad6f6d818e09","src/macros.rs":"7844312=
c233a6889fa15395fe3106f6a8f6229211104a92f33ea3c9536eef763","src/psp.rs":"dd=
31aabd46171d474ec5828372e28588935120e7355c90c105360d8fa9264c1c","src/sgx.rs=
":"16a95cdefc81c5ee00d8353a60db363c4cc3e0f75abcd5d0144723f2a306ed1b","src/s=
witch.rs":"9da3dd39b3de45a7928789926e8572d00e1e11a39e6f7289a1349aadce90edba=
","src/unix/align.rs":"2cdc7c826ef7ae61f5171c5ae8c445a743d86f1a7f2d9d7e4cee=
ec56d6874f65","src/unix/bsd/apple/b32/align.rs":"ec833a747866fe19ca2d9b4d3c=
9ff0385faba5edf4bd0d15fa68884c40b0e26c","src/unix/bsd/apple/b32/mod.rs":"6a=
4ce300da0d2b0db04b18548286603ffe4b47d679a41cf60f1902895894aa1f","src/unix/b=
sd/apple/b64/aarch64/align.rs":"f0c321265dd7671f16106b84951ac7dd77ed2e65c66=
23cbf2d29e76531984770","src/unix/bsd/apple/b64/aarch64/mod.rs":"46d5d061c7a=
74cbc09cbdfb3bee9a600867bf4e04c0e4d0ca6c817e6033b32e1","src/unix/bsd/apple/=
b64/align.rs":"ec833a747866fe19ca2d9b4d3c9ff0385faba5edf4bd0d15fa68884c40b0=
e26c","src/unix/bsd/apple/b64/mod.rs":"f5e278a1af7fb358891d1c9be4eb7e815aac=
a0c5cb738d0c3604ba2208a856f7","src/unix/bsd/apple/b64/x86_64/align.rs":"ec8=
33a747866fe19ca2d9b4d3c9ff0385faba5edf4bd0d15fa68884c40b0e26c","src/unix/bs=
d/apple/b64/x86_64/mod.rs":"cc6878dd130c3f255418e4da74992ae9ba6a3cdb0530772=
de76c518077d3b12a","src/unix/bsd/apple/mod.rs":"e0ebe1040b8ff87c52d581f9623=
4291a6380ebe3af3088c4f6ff748fbd7d2a7a","src/unix/bsd/freebsdlike/dragonfly/=
errno.rs":"8295b8bb0dfd38d2cdb4d9192cdeeb534cc6c3b208170e64615fa3e0edb3e578=
","src/unix/bsd/freebsdlike/dragonfly/mod.rs":"1466715589ed18b66789d60904e8=
258b20d7783a6f3bf72f775617bc0d9373d8","src/unix/bsd/freebsdlike/freebsd/aar=
ch64.rs":"2a215bd6136b8617aacedf9be738ccee94da9d29b418e9a78101d6291c182352"=
,"src/unix/bsd/freebsdlike/freebsd/arm.rs":"59d6a670eea562fb87686e243e0a846=
03d29a2028a3d4b3f99ccc01bd04d2f47","src/unix/bsd/freebsdlike/freebsd/freebs=
d11/b64.rs":"9808d152c1196aa647f1b0f0cf84dac8c930da7d7f897a44975545e3d9d176=
81","src/unix/bsd/freebsdlike/freebsd/freebsd11/mod.rs":"6523af60c0e4937ad3=
74003c1653e9e721f5b6f11572c747732f76522d07d034","src/unix/bsd/freebsdlike/f=
reebsd/freebsd12/b64.rs":"61cbe45f8499bedb168106b686d4f8239472f25c7553b069e=
ec2afe197ff2df6","src/unix/bsd/freebsdlike/freebsd/freebsd12/mod.rs":"08215=
43bf2073cb3dc46157e47140caa30704e062b23099d52bf80cb56e25321","src/unix/bsd/=
freebsdlike/freebsd/freebsd12/x86_64.rs":"2df36a7f122f6d6e5753cfb4d22e915cc=
80f6bc91c0161b3daae55a481bfd052","src/unix/bsd/freebsdlike/freebsd/freebsd1=
3/b64.rs":"61cbe45f8499bedb168106b686d4f8239472f25c7553b069eec2afe197ff2df6=
","src/unix/bsd/freebsdlike/freebsd/freebsd13/mod.rs":"21416cad3e76f53d10d0=
c73840469290aa80c2d92c773307a1ca92485d3c0e13","src/unix/bsd/freebsdlike/fre=
ebsd/freebsd13/x86_64.rs":"2df36a7f122f6d6e5753cfb4d22e915cc80f6bc91c0161b3=
daae55a481bfd052","src/unix/bsd/freebsdlike/freebsd/mod.rs":"0ee5530ddde569=
0cdc6f91acca86ce74c37ec06886418c34b201c154fd2c9e41","src/unix/bsd/freebsdli=
ke/freebsd/powerpc.rs":"9ca3f82f88974e6db5569f2d76a5a3749b248a31747a6c0da58=
20492bdfeca42","src/unix/bsd/freebsdlike/freebsd/powerpc64.rs":"2dae3ecc87e=
ac3b11657aa98915def55fc4b5c0de11fe26aae23329a54628a9a","src/unix/bsd/freebs=
dlike/freebsd/x86.rs":"c5005e3249eb7c93cfbac72a9e9272320d80ce7983da990ceb05=
a447f59a02c5","src/unix/bsd/freebsdlike/freebsd/x86_64/align.rs":"0e1f69a88=
fca1c32874b1daf5db3d446fefbe518dca497f096cc9168c39dde70","src/unix/bsd/free=
bsdlike/freebsd/x86_64/mod.rs":"c3a0111252e201c172b99e7d9cbee4cf088d3dd4799=
5110e819f04276bccd198","src/unix/bsd/freebsdlike/mod.rs":"77763a8dfe2d31c78=
ee7c3e64001ceee6d4ba34cc77b7fd4fdde153e5abbbeb8","src/unix/bsd/mod.rs":"2fe=
d08973739d7f6a7412b204724af64b1a915c712689c250cf9a08263ba05ff","src/unix/bs=
d/netbsdlike/mod.rs":"4e9da54e541773c7ad4cca9dade1df00f28f2fdac3f8df5957f4c=
74b7e082344","src/unix/bsd/netbsdlike/netbsd/aarch64.rs":"65dcb58d11e8d8028=
401a9d07ca3eb4cb4f053e04249cc877353449d84ccc4cb","src/unix/bsd/netbsdlike/n=
etbsd/arm.rs":"58cdbb70b0d6f536551f0f3bb3725d2d75c4690db12c26c034e7d6ec4a92=
4452","src/unix/bsd/netbsdlike/netbsd/mod.rs":"96edbcf448b89c991c9254c19423=
2322dce69fb8050bab9f9741f5aecb2104ea","src/unix/bsd/netbsdlike/netbsd/power=
pc.rs":"ee7ff5d89d0ed22f531237b5059aa669df93a3b5c489fa641465ace8d405bf41","=
src/unix/bsd/netbsdlike/netbsd/sparc64.rs":"9489f4b3e4566f43bb12dfb92238960=
613dac7f6a45cc13068a8d152b902d7d9","src/unix/bsd/netbsdlike/netbsd/x86.rs":=
"20692320e36bfe028d1a34d16fe12ca77aa909cb02bda167376f98f1a09aefe7","src/uni=
x/bsd/netbsdlike/netbsd/x86_64.rs":"1afe5ef46b14397cdd68664b5b232e4f5b035b6=
db1d4cf411c899d51ebca9f30","src/unix/bsd/netbsdlike/openbsd/aarch64.rs":"dd=
91931d373b7ecaf6e2de25adadee10d16fa9b12c2cbacdff3eb291e1ba36af","src/unix/b=
sd/netbsdlike/openbsd/mod.rs":"9a9878e70ee8765d95cb1b010e39d74004278ca6da58=
fb82354f69752a84c926","src/unix/bsd/netbsdlike/openbsd/sparc64.rs":"d04fd28=
7afbaa2c5df9d48c94e8374a532a3ba491b424ddf018270c7312f4085","src/unix/bsd/ne=
tbsdlike/openbsd/x86.rs":"6f7f5c4fde2a2259eb547890cbd86570cea04ef85347d7569=
e94e679448bec87","src/unix/bsd/netbsdlike/openbsd/x86_64.rs":"d31db31630289=
c85af3339dbe357998a21ca584cbae31607448fe2cf7675a4e1","src/unix/haiku/b32.rs=
":"69ae47fc52c6880e85416b4744500d5655c9ec6131cb737f3b649fceaadce15a","src/u=
nix/haiku/b64.rs":"73e64db09275a8da8d50a13cce2cfa2b136036ddf3a930d2939f337f=
c995900b","src/unix/haiku/mod.rs":"912969bc1d59a6cec74de3140982b7f0b69e74d4=
4936646587f1c8820be7c0fe","src/unix/haiku/native.rs":"44855f52906f607de137f=
c4baa8c6b1b9a26baaa666f25d5f7a7ec5e017c8be6","src/unix/haiku/x86_64.rs":"3e=
c3aeeb7ed208b8916f3e32d42bfd085ff5e16936a1a35d9a52789f043b7237","src/unix/h=
ermit/aarch64.rs":"86048676e335944c37a63d0083d0f368ae10ceccefeed9debb3bbe08=
777fc682","src/unix/hermit/mod.rs":"859814f5df89e28fd4b345db399d181e11e7ed4=
13841b6ff703a1fcbdbf013ae","src/unix/hermit/x86_64.rs":"ab832b7524e5fb15c49=
ff7431165ab1a37dc4667ae0b58e8306f4c539bfa110c","src/unix/linux_like/android=
/b32/arm.rs":"433c1530f602cc5ed26610c58055dde0c4ceea5e00150063b24ddc6076833=
2a4","src/unix/linux_like/android/b32/mod.rs":"d971b98530a96f5892f98e1edc31=
33cf278d1b3939d77ab0a27a6323e0961715","src/unix/linux_like/android/b32/x86/=
align.rs":"812914e4241df82e32b12375ca3374615dc3a4bdd4cf31f0423c5815320c0dab=
","src/unix/linux_like/android/b32/x86/mod.rs":"8388bd3a0fcb5636bf965eee6dc=
95ae6860b85a2b555b387c868aa4d4e01ec89","src/unix/linux_like/android/b64/aar=
ch64/align.rs":"2179c3b1608fa4bf68840482bfc2b2fa3ee2faf6fcae3770f9e505cddca=
35c7b","src/unix/linux_like/android/b64/aarch64/mod.rs":"8fe667d2b14abc5ac8=
aad32e16c3da24350471d8156eaea9ab4989f73dd9f9fc","src/unix/linux_like/androi=
d/b64/mod.rs":"d7bbbadafdb2cb2ff8e9cde3d89a03b9facaabb6b2d45705225d3ece1c5c=
ce37","src/unix/linux_like/android/b64/x86_64/align.rs":"7169d07a9fd4716f75=
12719aec9fda5d8bed306dc0720ffc1b21696c9951e3c6","src/unix/linux_like/androi=
d/b64/x86_64/mod.rs":"06b22dc184e85a988ab969c75cadc52b9878faeab0eb9d2121587=
8c95fe07c19","src/unix/linux_like/android/mod.rs":"8688204b3236db28b66ff0f1=
de5320f47ec5c1ef5395dddcc9df025a8d78630a","src/unix/linux_like/emscripten/a=
lign.rs":"86c95cbed7a7161b1f23ee06843e7b0e2340ad92b2cb86fe2a8ef3e0e8c36216"=
,"src/unix/linux_like/emscripten/mod.rs":"6ef97140ca6fb24125fdd0aacb986ef78=
5aa21993229660d7f703f8875ebfe49","src/unix/linux_like/emscripten/no_align.r=
s":"0128e4aa721a9902754828b61b5ec7d8a86619983ed1e0544a85d35b1051fad6","src/=
unix/linux_like/linux/align.rs":"213e70ebed2703e14a9cf17666b21ecbf180b7bff7=
fa22fdbb36dbbd52df326d","src/unix/linux_like/linux/arch/generic/mod.rs":"ff=
1fe8fad4ea15d9bec3db25efcfcb4939190c5189f86cfa4d05825aa8c10956","src/unix/l=
inux_like/linux/arch/mips/mod.rs":"e4a980b002105aaa057eb6568e1e2c6168ade5c0=
0e13a31ef67e316ddffdb900","src/unix/linux_like/linux/arch/mod.rs":"466a2962=
2e47c6c7f1500682b2eb17f5566dd81b322cd6348f0fdd355cec593a","src/unix/linux_l=
ike/linux/arch/powerpc/mod.rs":"1789eb5b41f75c29239795124a4a7cdcf7c8d213b88=
cf581b2f5bda08d7cf15b","src/unix/linux_like/linux/arch/sparc/mod.rs":"ded70=
8124ee610267d011dee31fb02d1ec697c334aa822776ec95a7ddf6fc541","src/unix/linu=
x_like/linux/gnu/align.rs":"e4a3c27fe20a57b8d612c34cb05bc70646edb5cec725195=
7315afa53a7b9f936","src/unix/linux_like/linux/gnu/b32/arm/align.rs":"3fed00=
9dc9af3cc81be7087da9d2d7d1f39845e4497e290259c5cdbae25f039d","src/unix/linux=
_like/linux/gnu/b32/arm/mod.rs":"07adf9f4b96854062db518aaf08521fde0ad4a21a5=
c049efccba437bd97b2b5a","src/unix/linux_like/linux/gnu/b32/mips/align.rs":"=
429fb5e005cb7143602d430098b6ebfb7d360685b194f333dfd587472ae954ee","src/unix=
/linux_like/linux/gnu/b32/mips/mod.rs":"1cb5c0c9df3af2bbe131a91593583259fac=
9118931744c8435e197a394eb0462","src/unix/linux_like/linux/gnu/b32/mod.rs":"=
794dbcbae7dae8fd6b0b814573243197ceb532b56ef0772ad86b4b401478fcd9","src/unix=
/linux_like/linux/gnu/b32/powerpc.rs":"0cd7348badb9c4f8a0db31a2503b30c456a2=
bfcc7a0e5919762b1e12f912c5ad","src/unix/linux_like/linux/gnu/b32/riscv32/mo=
d.rs":"ee5145a383386b716605a8d1ff3df212d418aae1aa1f37d2307d4f9cd1a08e99","s=
rc/unix/linux_like/linux/gnu/b32/sparc/align.rs":"21adbed27df73e2d1ed934aaf=
733a643003d7baf2bde9c48ea440895bcca6d41","src/unix/linux_like/linux/gnu/b32=
/sparc/mod.rs":"1bcec269a8416ccc48a384ca5765eaaa23f30f39f32311f50008ef4eead=
afb2f","src/unix/linux_like/linux/gnu/b32/x86/align.rs":"e4bafdc4a519a7922a=
81b37a62bbfd1177a2f620890eef8f1fbc47162e9eb413","src/unix/linux_like/linux/=
gnu/b32/x86/mod.rs":"5317dbf2323577b89370bbee3894882b89d8333176db4f7b271ddc=
2f036ef43c","src/unix/linux_like/linux/gnu/b64/aarch64/align.rs":"2179c3b16=
08fa4bf68840482bfc2b2fa3ee2faf6fcae3770f9e505cddca35c7b","src/unix/linux_li=
ke/linux/gnu/b64/aarch64/ilp32.rs":"21a21503ef2e095f4371044915d4bfb07a85780=
11cb5c713cd9f45947b0b5730","src/unix/linux_like/linux/gnu/b64/aarch64/lp64.=
rs":"e78c3cd197f44832338b414d1a9bc0d194f44c74db77bd7bf830c1fff62b2690","src=
/unix/linux_like/linux/gnu/b64/aarch64/mod.rs":"c3730792dabcc166d8fd22929ef=
2633d49bc626875382dfcd401e8e125fb7a84","src/unix/linux_like/linux/gnu/b64/m=
ips64/align.rs":"7169d07a9fd4716f7512719aec9fda5d8bed306dc0720ffc1b21696c99=
51e3c6","src/unix/linux_like/linux/gnu/b64/mips64/mod.rs":"68bcb71bbfccb4e8=
648948e494366d94767ce96f36daab9c1329375cdd32a459","src/unix/linux_like/linu=
x/gnu/b64/mod.rs":"6336065423c26b59681fd2ce77f1117ea36af13e163fdadaefd108bd=
8191e8c8","src/unix/linux_like/linux/gnu/b64/powerpc64/align.rs":"e29c4868b=
becfa4a6cd8a2ad06193f3bbc78a468cc1dc9df83f002f1268130d9","src/unix/linux_li=
ke/linux/gnu/b64/powerpc64/mod.rs":"dbb8905e363ed4a2dfb984554ad9b6389d27f6a=
2d599ec2d80e38a6c7551a019","src/unix/linux_like/linux/gnu/b64/riscv64/mod.r=
s":"5b982c41097f4f91adcb0968290afeccb27dce1695a261c964d34ef85df87cf4","src/=
unix/linux_like/linux/gnu/b64/s390x.rs":"a9484dfd3c7ca1174537957bef997c3ba7=
ea41989cdf61ede22b1bbc45a667bf","src/unix/linux_like/linux/gnu/b64/sparc64/=
align.rs":"e29c4868bbecfa4a6cd8a2ad06193f3bbc78a468cc1dc9df83f002f1268130d9=
","src/unix/linux_like/linux/gnu/b64/sparc64/mod.rs":"26fda11bdce99372c2c24=
6e60866b56d98beb9fb49a2f6b69347ecfd03d18255","src/unix/linux_like/linux/gnu=
/b64/x86_64/align.rs":"7169d07a9fd4716f7512719aec9fda5d8bed306dc0720ffc1b21=
696c9951e3c6","src/unix/linux_like/linux/gnu/b64/x86_64/mod.rs":"5a5ce7c5c9=
2f60d8900dce63d363a38f3126aaf5be981710e172bec96ef95ac6","src/unix/linux_lik=
e/linux/gnu/b64/x86_64/not_x32.rs":"f775ac2b754f90b63053fe22afe1d19d306b540=
4995568d6805baa9249fb617f","src/unix/linux_like/linux/gnu/b64/x86_64/x32.rs=
":"4ba1b58468f55254717366f50fdfd3e4114fde6dc442a56681926c4d7e5b6b0d","src/u=
nix/linux_like/linux/gnu/mod.rs":"a040250bc2b4b2831ae2cad6f1abf3dc73e6015c4=
f570abf21350e220e898338","src/unix/linux_like/linux/gnu/no_align.rs":"9cd22=
3135de75315840ff9c3fd5441ba1cb632b96b5c85a76f8316c86653db25","src/unix/linu=
x_like/linux/mod.rs":"8f282fe98fe7fcdae158aad41b2a9e6130c130c7a041fe1391935=
7bf7b548057","src/unix/linux_like/linux/musl/b32/arm/align.rs":"3e8ac052c10=
43764776b54c93ba4260e061df998631737a897d9d47d54f7b80c","src/unix/linux_like=
/linux/musl/b32/arm/mod.rs":"6255abe2ee04986832d12b7b2190589580f2a43e9bfb28=
5b32b5747227f62727","src/unix/linux_like/linux/musl/b32/hexagon.rs":"a88117=
91809672be8338e6e27d1c4fcf383c2f26585be8bf9ab2923b219de032","src/unix/linux=
_like/linux/musl/b32/mips/align.rs":"429fb5e005cb7143602d430098b6ebfb7d3606=
85b194f333dfd587472ae954ee","src/unix/linux_like/linux/musl/b32/mips/mod.rs=
":"b9e9ff42363ebbb884ddf6445129ec4164471df45846874fc08f5f458e659254","src/u=
nix/linux_like/linux/musl/b32/mod.rs":"8ede3985e6243882814ce91e8ce543e7edba=
fc0cee5932816072b6f14207a671","src/unix/linux_like/linux/musl/b32/powerpc.r=
s":"4592dc5f1f2fe888dfef85fa862d42d168e73a2c6f4fc052b58287d0f4d4ffcd","src/=
unix/linux_like/linux/musl/b32/x86/align.rs":"08e77fbd7435d7dec2ff56932433b=
ece3f02e47ce810f89004a275a86d39cbe1","src/unix/linux_like/linux/musl/b32/x8=
6/mod.rs":"a19a8decfab185af3cebd34aae4b15082e7552be573904b8c1a3f0c0e493ef34=
","src/unix/linux_like/linux/musl/b64/aarch64/align.rs":"798a9229d70ce23539=
4f2dd625f6c4c1e10519a94382dc5b091952b638ae2928","src/unix/linux_like/linux/=
musl/b64/aarch64/mod.rs":"a73035c6d9b776f13b839008e15c04c2c53455571efd06664=
affcb047e457112","src/unix/linux_like/linux/musl/b64/mips64.rs":"2744895451=
f3a777fbe54f7f2695be53310b965fd62084c9b7e9121c7fe28346","src/unix/linux_lik=
e/linux/musl/b64/mod.rs":"d847206d9f2d594c8febe780a938cdccf40d985dafc11e90f=
235947735a09bac","src/unix/linux_like/linux/musl/b64/powerpc64.rs":"e5a5552=
5b42493923956d668f978fb45e22d51deea00ce5edbfddf76ff19c741","src/unix/linux_=
like/linux/musl/b64/s390x.rs":"03dfec6794d93cb31a7c52b2d53a0973755168f91f8f=
a437cc5dbd54882c8ee7","src/unix/linux_like/linux/musl/b64/x86_64/align.rs":=
"7169d07a9fd4716f7512719aec9fda5d8bed306dc0720ffc1b21696c9951e3c6","src/uni=
x/linux_like/linux/musl/b64/x86_64/mod.rs":"0dd168f5a6881f32e5239fb312b23cf=
137b800d0ff323286a92c8a2c382b5456","src/unix/linux_like/linux/musl/mod.rs":=
"ac08dd0891304a0e6f478a38bffa4fe8e6b27ad79094b2f7139c7a95082c3a18","src/uni=
x/linux_like/linux/no_align.rs":"5ed04c53bf9d27da9b4d65ba7625c6ac5333016268=
3d1b3df98950caafa3507b","src/unix/linux_like/linux/uclibc/align.rs":"9ed161=
38d8e439bd90930845a65eafa7ebd67366e6bf633936d44014f6e4c959","src/unix/linux=
_like/linux/uclibc/arm/align.rs":"e4a3c27fe20a57b8d612c34cb05bc70646edb5cec=
7251957315afa53a7b9f936","src/unix/linux_like/linux/uclibc/arm/mod.rs":"1e3=
bf809508b5872949136859bf48ddf58b7d24ae9f0b663e79f0efd1aaeb6a6","src/unix/li=
nux_like/linux/uclibc/arm/no_align.rs":"9cd223135de75315840ff9c3fd5441ba1cb=
632b96b5c85a76f8316c86653db25","src/unix/linux_like/linux/uclibc/mips/mips3=
2/align.rs":"e4a3c27fe20a57b8d612c34cb05bc70646edb5cec7251957315afa53a7b9f9=
36","src/unix/linux_like/linux/uclibc/mips/mips32/mod.rs":"fa4102d9a596d90d=
e604ce2962b0e64f184dfbf10552a4c3ecf28f12d4704379","src/unix/linux_like/linu=
x/uclibc/mips/mips32/no_align.rs":"9cd223135de75315840ff9c3fd5441ba1cb632b9=
6b5c85a76f8316c86653db25","src/unix/linux_like/linux/uclibc/mips/mips64/ali=
gn.rs":"a7bdcb18a37a2d91e64d5fad83ea3edc78f5412adb28f77ab077dbb26dd08b2d","=
src/unix/linux_like/linux/uclibc/mips/mips64/mod.rs":"e3085ba56cfbc528d7c3c=
55065880603238c333b6047ef51c58177508a487fcd","src/unix/linux_like/linux/ucl=
ibc/mips/mips64/no_align.rs":"4a18e3875698c85229599225ac3401a2a40da87e77b2a=
d4ef47c6fcd5a24ed30","src/unix/linux_like/linux/uclibc/mips/mod.rs":"a28776=
79fef0f14f54a89ccbc41fb02f0c25bf6e536f9eb2cb2fa437e1d3f739","src/unix/linux=
_like/linux/uclibc/mod.rs":"82d504d3aa12cb0f7933980f81c4708fa6e070d4c57efdf=
407f2de05b71bc06d","src/unix/linux_like/linux/uclibc/no_align.rs":"3f286370=
46524618adaa1012e26cb7ffe94b9396e6b518cccdc69d59f274d709","src/unix/linux_l=
ike/linux/uclibc/x86_64/l4re.rs":"024eba5753e852dbdd212427351affe7e83f9916c=
1864bce414d7aa2618f192e","src/unix/linux_like/linux/uclibc/x86_64/mod.rs":"=
02e21c0550a423a3f6db0a0af6a0f37cf5937feb2562a490e0ad0e09a8d9fc77","src/unix=
/linux_like/linux/uclibc/x86_64/other.rs":"42c3f71e58cabba373f6a55a623f3c31=
b85049eb64824c09c2b082b3b2d6a0a8","src/unix/linux_like/mod.rs":"0a97d43fdce=
7f9bd57a0b47d770867f4e234eba602adc9ef993ed02a182276f2","src/unix/mod.rs":"6=
b2b57833e37cd3231944696c8216eb587a2a68069346150cf321153eaf04d03","src/unix/=
newlib/aarch64/mod.rs":"bb269c1468a9676442554600e87417079a787fe6220dfc23b31=
09639259e8710","src/unix/newlib/align.rs":"28aaf87fafbc6b312622719d472d8cf6=
5f9e5467d15339df5f73e66d8502b28a","src/unix/newlib/arm/mod.rs":"c71be856bfd=
7f576b2db28af9f680211cbe6c1cac7d537bbc8020b39591af07c","src/unix/newlib/esp=
idf/mod.rs":"c198cb4beccdab483be61c102da74dc51ac80f766797e33021f3110394ed5a=
3d","src/unix/newlib/mod.rs":"d7271c13748be08305d36f9af6f41f6950a7a1d6d4382=
149194a35d5fe2090de","src/unix/newlib/no_align.rs":"e0743b2179495a9514bc3a4=
d1781e492878c4ec834ee0085d0891dd1712e82fb","src/unix/newlib/powerpc/mod.rs"=
:"2d0f7af28b47f7a2a6c210ebd1c1f33ed8eac62e56b5af2b856de2ad3fdc5187","src/un=
ix/no_align.rs":"c06e95373b9088266e0b14bba0954eef95f93fb2b01d951855e382d22d=
e78e53","src/unix/redox/mod.rs":"267a413e63dbdcaed6e758f9a5c10bd00178ed76c7=
b3527e8e984341f617d3a5","src/unix/solarish/compat.rs":"b07a5bfac925eb012003=
a459ba6bddbd3bfa9c44b3394da2ac5a602e54beae9c","src/unix/solarish/illumos.rs=
":"7d8f47fd37880715b449723688aaee568785325a46f1c360a05bdca13252278e","src/u=
nix/solarish/mod.rs":"080e0cf03b50874ba9d5082b314eabb0d253532dc4b13d8af095a=
0c78e0fba84","src/unix/solarish/solaris.rs":"65b005453aefa9b9d4fc860fe77cfe=
c80d8c97a51342b15daf55fc3e808bb384","src/unix/solarish/x86_64.rs":"9d761573=
bdccbdd1ac61da571f7e96b5374df70241d9b72d45a069611f495085","src/vxworks/aarc=
h64.rs":"98f0afdc511cd02557e506c21fed6737585490a1dce7a9d4941d08c437762b99",=
"src/vxworks/arm.rs":"acb7968ce99fe3f4abdf39d98f8133d21a4fba435b8ef7084777c=
b181d788e88","src/vxworks/mod.rs":"aea3da66f2140f2a82dfc9c58f6e6531d2dd9c15=
ea696e0f95a0d4a2a187b5b6","src/vxworks/powerpc.rs":"acb7968ce99fe3f4abdf39d=
98f8133d21a4fba435b8ef7084777cb181d788e88","src/vxworks/powerpc64.rs":"98f0=
afdc511cd02557e506c21fed6737585490a1dce7a9d4941d08c437762b99","src/vxworks/=
x86.rs":"552f007f38317620b23889cb7c49d1d115841252439060122f52f434fbc6e5ba",=
"src/vxworks/x86_64.rs":"018d92be3ad628a129eff9f2f5dfbc0883d8b8e5f2fa917b90=
0a7f98ed6b514a","src/wasi.rs":"2c945bce3ddd26bf20ff03fb4192c9c3f625f1308a47=
9c5cb4bd4510a892629a","src/windows/gnu/align.rs":"b2c13ec1b9f3b39a75c452c80=
c951dff9d0215e31d77e883b4502afb31794647","src/windows/gnu/mod.rs":"3c8c7edb=
7cdf5d0c44af936db2a94869585c69dfabeef30571b4f4e38375767a","src/windows/mod.=
rs":"1cd9223293255b994814487e28d9979fb8ebef4538a236c1aa47fdc166a149cc","src=
/windows/msvc/mod.rs":"860dc98245039bc3aa5782ef2b5798d009ea6655bd27a63f244b=
e2206d2cb47f","src/windows/msvc/x86_64.rs":"25d35a5ba8e19569a5bed573dcf8c82=
f7ce53da7c91941f9ceda6fe86cab1088","tests/const_fn.rs":"cb75a1f0864f926aebe=
79118fc34d51a0d1ade2c20a394e7774c7e545f21f1f4"},"package":"dd8f7255a17a6273=
54f321ef0055d63b898c6fb27eff628af4d1b66b7331edf6"}
+--=20
+2.20.1
+
diff --git a/meta/recipes-devtools/rust/libstd-rs_1.56.1.bb b/meta/recipes-=
devtools/rust/libstd-rs_1.57.0.bb
similarity index 100%
rename from meta/recipes-devtools/rust/libstd-rs_1.56.1.bb
rename to meta/recipes-devtools/rust/libstd-rs_1.57.0.bb
diff --git a/meta/recipes-devtools/rust/rust-cross-canadian_1.56.1.bb b/met=
a/recipes-devtools/rust/rust-cross-canadian_1.57.0.bb
similarity index 100%
rename from meta/recipes-devtools/rust/rust-cross-canadian_1.56.1.bb
rename to meta/recipes-devtools/rust/rust-cross-canadian_1.57.0.bb
diff --git a/meta/recipes-devtools/rust/rust-cross_1.56.1.bb b/meta/recipes=
-devtools/rust/rust-cross_1.57.0.bb
similarity index 100%
rename from meta/recipes-devtools/rust/rust-cross_1.56.1.bb
rename to meta/recipes-devtools/rust/rust-cross_1.57.0.bb
diff --git a/meta/recipes-devtools/rust/rust-llvm_1.56.1.bb b/meta/recipes-=
devtools/rust/rust-llvm_1.57.0.bb
similarity index 100%
rename from meta/recipes-devtools/rust/rust-llvm_1.56.1.bb
rename to meta/recipes-devtools/rust/rust-llvm_1.57.0.bb
diff --git a/meta/recipes-devtools/rust/rust-source.inc b/meta/recipes-devt=
ools/rust/rust-source.inc
index e197604716..dbbfa14913 100644
--- a/meta/recipes-devtools/rust/rust-source.inc
+++ b/meta/recipes-devtools/rust/rust-source.inc
@@ -1,5 +1,5 @@
 SRC_URI +=3D "https://static.rust-lang.org/dist/rustc-${PV}-src.tar.xz;nam=
e=3Drust"
-SRC_URI[rust.sha256sum] =3D "61fdcc8bc2530ee18f91318347e09b7cc07e9ca04b1c6=
27c135ecc8dcb8f2ac5"
+SRC_URI[rust.sha256sum] =3D "fad07ea1daf9c6195c32e6e9c43ece4565c5f2f1de3c3=
771574790d6abbc9704"
=20
 RUSTSRC =3D "${WORKDIR}/rustc-${PV}-src"
=20
diff --git a/meta/recipes-devtools/rust/rust-tools-cross-canadian_1.56.1.bb=
 b/meta/recipes-devtools/rust/rust-tools-cross-canadian_1.57.0.bb
similarity index 100%
rename from meta/recipes-devtools/rust/rust-tools-cross-canadian_1.56.1.bb
rename to meta/recipes-devtools/rust/rust-tools-cross-canadian_1.57.0.bb
diff --git a/meta/recipes-devtools/rust/rust_1.56.1.bb b/meta/recipes-devto=
ols/rust/rust_1.57.0.bb
similarity index 99%
rename from meta/recipes-devtools/rust/rust_1.56.1.bb
rename to meta/recipes-devtools/rust/rust_1.57.0.bb
index 036fb43334..b505ad46ca 100644
--- a/meta/recipes-devtools/rust/rust_1.56.1.bb
+++ b/meta/recipes-devtools/rust/rust_1.57.0.bb
@@ -18,3 +18,4 @@ python () {
     if not pn.endswith("-native"):
         raise bb.parse.SkipRecipe("Rust recipe doesn't work for target bui=
lds at this time. Fixes welcome.")
 }
+
--=20
2.20.1


