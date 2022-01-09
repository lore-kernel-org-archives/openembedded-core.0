Return-Path: <alex.kanavin@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 0BBAEC4332F
	for <webhook@archiver.kernel.org>; Sun,  9 Jan 2022 22:28:00 +0000 (UTC)
Received: from mail-wm1-f50.google.com (mail-wm1-f50.google.com
 [209.85.128.50])
 by mx.groups.io with SMTP id smtpd.web11.24204.1641767278478380307
 for <openembedded-core@lists.openembedded.org>;
 Sun, 09 Jan 2022 14:27:59 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20210112 header.b=AI1hWoAn;
 spf=pass (domain: gmail.com, ip: 209.85.128.50,
 mailfrom: alex.kanavin@gmail.com)
Received: by mail-wm1-f50.google.com with SMTP id l4so7614059wmq.3
        for <openembedded-core@lists.openembedded.org>;
 Sun, 09 Jan 2022 14:27:58 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:content-transfer-encoding;
        bh=ZuYz/y6pg9Gfr5FEny2tFPINSBxwea1pl0+Zqnwejf0=;
        b=AI1hWoAn5wXmUQpp7dYwCp9H4uC3v4mGhbIcj/HhFta6z14pVWNxwhb0OUTlMPWGz3
         DTyhf00mnIys/IUW4D5v/Sxmz++kXQpGQ9fyrW6xVb0xrCXuYTFC62D0+TKzuk8oXpR4
         er8O1yCmgf8pbuTc5HVOF3KsfVWdxbiQVaySeBO6pn3tYi1W3uhsDHhFUaejS8PudR2I
         v8Nbfvs7ln6nYWRypjyKGLldYpBDSZy7si7uTryup0sPkdxZCFMRRfb8VkJnA1b8QdsY
         u7c7/2w1FEX65kzYIdw6dO7Btacv0u6FhRuLRtSt1WL33TkhIvDD3tYSBmAN/1gqIRA4
         BSVQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=ZuYz/y6pg9Gfr5FEny2tFPINSBxwea1pl0+Zqnwejf0=;
        b=pUpEMx9cJmnViYGpGznmjWF5Z15Udf1IGdzd9H2nO1KhG3/N28LJZNECThjRSG3cA9
         rKd65/4stvaMJNikqstoSWmeviKgIBTcSvEI/HrIJns3spr+DWlA+CYBPDtNn5ypsLga
         3dS9JKvmyFLSHIc3mxqnw1QCInScEgch9R2OZM2v8H8w9qv0dkbQowDS/OQIJwYAB7vm
         OwygpJGkgkJrWWNr358dUufG4zhEY4qNRJaRHWHZ4D1QXAQxd/8l5BLa2zaP+ng7NZL3
         AH3NMy6Q/EsezplooaiWtbAJ4aZW8wu2Pps+5VfA+Fl6DHY3vO/G4kA16s237QOk/kei
         SjuA==
X-Gm-Message-State: AOAM531muOtRXlv77/P7DQCP1sL4WSw/hnIVRLP02Z9N4i0RwThF2Rde
	p+XdICUEjq5MKExX2+gRVLrxhgv6kI8=
X-Google-Smtp-Source: 
 ABdhPJz+GLn6HeYQUIPa9fAgrqaPLfbvFg6uFTYfRVQXynZOINU4M3Gmwm4PqaJdAjvjjM5JmBNGYg==
X-Received: by 2002:a1c:6a08:: with SMTP id f8mr3141882wmc.2.1641767276429;
        Sun, 09 Jan 2022 14:27:56 -0800 (PST)
Received: from nereus.lab.linutronix.de. (b2b-109-90-143-203.unitymedia.biz.
 [109.90.143.203])
        by smtp.gmail.com with ESMTPSA id
 l6sm6804319wry.18.2022.01.09.14.27.55
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 09 Jan 2022 14:27:55 -0800 (PST)
From: Alexander Kanavin <alex.kanavin@gmail.com>
X-Google-Original-From: Alexander Kanavin <alex@linutronix.de>
To: openembedded-core@lists.openembedded.org
Cc: Alexander Kanavin <alex@linutronix.de>,
	Khem Raj <raj.khem@gmail.com>,
	Ralf Anton Beier <ralf_beier@me.com>
Subject: [PATCH 08/14] librsvg: update 2.52.4 -> 2.52.5
Date: Sun,  9 Jan 2022 23:27:26 +0100
Message-Id: <20220109222732.2252416-8-alex@linutronix.de>
X-Mailer: git-send-email 2.20.1
In-Reply-To: <20220109222732.2252416-1-alex@linutronix.de>
References: <20220109222732.2252416-1-alex@linutronix.de>
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Sun, 09 Jan 2022 22:28:00 -0000
X-Groupsio-URL: 
 https://lists.openembedded.org/g/openembedded-core/message/160312

Remove upstreamed patches.

Signed-off-by: Alexander Kanavin <alex@linutronix.de>
---
 ...hecksums-for-modified-files-for-libc.patch |  24 -
 ...lib.rs-do-not-probe-into-harcoded-li.patch |  12 +-
 ...ps-sort-dependencies-before-using-th.patch |  50 -
 ...nitions-for-riscv64-musl-libc-0.2.93.patch | 898 ------------------
 ...-mod.rs-add-riscv64-to-b64-set-libc-.patch |  27 -
 ...efinitions-to-match-musl-libc-0.2.93.patch | 737 --------------
 .../{librsvg_2.52.4.bb =3D> librsvg_2.52.5.bb}  |   7 +-
 7 files changed, 7 insertions(+), 1748 deletions(-)
 delete mode 100644 meta/recipes-gnome/librsvg/librsvg/0001-Update-checksum=
s-for-modified-files-for-libc.patch
 delete mode 100644 meta/recipes-gnome/librsvg/librsvg/0001-vendor-system-d=
eps-sort-dependencies-before-using-th.patch
 delete mode 100644 meta/recipes-gnome/librsvg/librsvg/0005-Add-base-defini=
tions-for-riscv64-musl-libc-0.2.93.patch
 delete mode 100644 meta/recipes-gnome/librsvg/librsvg/0006-FIXUP-linux-mus=
l-mod.rs-add-riscv64-to-b64-set-libc-.patch
 delete mode 100644 meta/recipes-gnome/librsvg/librsvg/0007-FIXUP-Correct-d=
efinitions-to-match-musl-libc-0.2.93.patch
 rename meta/recipes-gnome/librsvg/{librsvg_2.52.4.bb =3D> librsvg_2.52.5.b=
b} (85%)

diff --git a/meta/recipes-gnome/librsvg/librsvg/0001-Update-checksums-for-m=
odified-files-for-libc.patch b/meta/recipes-gnome/librsvg/librsvg/0001-Upda=
te-checksums-for-modified-files-for-libc.patch
deleted file mode 100644
index e6b0d3d960..0000000000
--- a/meta/recipes-gnome/librsvg/librsvg/0001-Update-checksums-for-modified=
-files-for-libc.patch
+++ /dev/null
@@ -1,24 +0,0 @@
-From 35cc5ce53a7c00d03dab9d58d37c2ec948082878 Mon Sep 17 00:00:00 2001
-From: Alexander Kanavin <alex@linutronix.de>
-Date: Sun, 31 Oct 2021 20:28:21 +0100
-Subject: [PATCH] Update checksums for modified files for libc
-
-Upstream-Status: Inappropriate [previous patches need to be upstreamed]
-Signed-off-by: Alexander Kanavin <alex@linutronix.de>
-
----
- vendor/libc/.cargo-checksum.json | 6 +++++-
- 1 file changed, 5 insertions(+), 1 deletion(-)
-
-diff --git a/vendor/libc/.cargo-checksum.json b/vendor/libc/.cargo-checksu=
m.json
-index 8cf4eba..ac7cc51 100644
---- a/vendor/libc/.cargo-checksum.json
-+++ b/vendor/libc/.cargo-checksum.json
-@@ -1 +1,5 @@
--{"files":{"CONTRIBUTING.md":"752eea5a703d11b485c6b5f195f51bd2c79aa5159b61=
9ce09555c779e1fb586b","Cargo.toml":"d6f6253f05d207b6c676e5647b31ad0ca3f05da=
3ac05db47f81d4ebd901ba22f","LICENSE-APACHE":"a60eea817514531668d7e007657314=
49fe14d059d3249e0bc93b36de45f759f2","LICENSE-MIT":"a8d47ff51ca256f56a8932db=
a07660672dbfe3004257ca8de708aac1415937a1","README.md":"8228847944f1332882fb=
b00275b6f30e4a8aad08a13569c25d52cac012cc2a47","build.rs":"a71b92db5077b33af=
4ee6f1de33574ac33c2b292840eddbe3f7cce37f1fb16b9","rustfmt.toml":"eaa2ea84fc=
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
f7431165ab1a37dc4667ae0b58e8306f4c539bfa110c","src/lib.rs":"e92c56b42f1bd1b=
9e66be2a9b73aca6ba29024b9bd17c16f327dfbe8831e3f86","src/macros.rs":"c1a299d=
5327ba033f079388f8ac8a44848f9aeff6a72e9be6dfa70f4769cc619","src/psp.rs":"dd=
31aabd46171d474ec5828372e28588935120e7355c90c105360d8fa9264c1c","src/sgx.rs=
":"16a95cdefc81c5ee00d8353a60db363c4cc3e0f75abcd5d0144723f2a306ed1b","src/s=
olid/aarch64.rs":"8cdae0cc37c43dabd4253a534e700bec6b6a57293c0c8e36c9ce16675=
d16799a","src/solid/arm.rs":"852b58a0837fde089cb9b5af131bf653daeb8c726f7540=
032756db8b7d4f8149","src/solid/mod.rs":"98dc29c3e5773318ba258a4a2b7407f25aa=
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
/mod.rs":"96f101bdab46a9f0a5249a8143d4a9def055284a0c2bd62bce15532a5bed428c"=
,"src/unix/bsd/freebsdlike/dragonfly/errno.rs":"8295b8bb0dfd38d2cdb4d9192cd=
eeb534cc6c3b208170e64615fa3e0edb3e578","src/unix/bsd/freebsdlike/dragonfly/=
mod.rs":"6ea4129eb5d6da5c09f8cf3692b5e7716f058b48d1e8c61115691709eda7ce51",=
"src/unix/bsd/freebsdlike/freebsd/aarch64.rs":"2a215bd6136b8617aacedf9be738=
ccee94da9d29b418e9a78101d6291c182352","src/unix/bsd/freebsdlike/freebsd/arm=
.rs":"59d6a670eea562fb87686e243e0a84603d29a2028a3d4b3f99ccc01bd04d2f47","sr=
c/unix/bsd/freebsdlike/freebsd/freebsd11/b64.rs":"9808d152c1196aa647f1b0f0c=
f84dac8c930da7d7f897a44975545e3d9d17681","src/unix/bsd/freebsdlike/freebsd/=
freebsd11/mod.rs":"bf0a994e2079b8aad9da5efd3a3b9a7194a53ae60887a25c57964fb6=
8499e847","src/unix/bsd/freebsdlike/freebsd/freebsd12/b64.rs":"61cbe45f8499=
bedb168106b686d4f8239472f25c7553b069eec2afe197ff2df6","src/unix/bsd/freebsd=
like/freebsd/freebsd12/mod.rs":"295b3e3b67394f731d4e88d169e3d3d1d80026b9989=
8745cd0d1d163f085ff61","src/unix/bsd/freebsdlike/freebsd/freebsd12/x86_64.r=
s":"2df36a7f122f6d6e5753cfb4d22e915cc80f6bc91c0161b3daae55a481bfd052","src/=
unix/bsd/freebsdlike/freebsd/freebsd13/b64.rs":"61cbe45f8499bedb168106b686d=
4f8239472f25c7553b069eec2afe197ff2df6","src/unix/bsd/freebsdlike/freebsd/fr=
eebsd13/mod.rs":"98f6af2021b434f9c3197094312b457774381220f31a22c3b15b1fe8a6=
0cb365","src/unix/bsd/freebsdlike/freebsd/freebsd13/x86_64.rs":"2df36a7f122=
f6d6e5753cfb4d22e915cc80f6bc91c0161b3daae55a481bfd052","src/unix/bsd/freebs=
dlike/freebsd/mod.rs":"6b825079ffe3f9aec6e78ea6b50acedcb91a4e1312d721105b7f=
8b1555f254df","src/unix/bsd/freebsdlike/freebsd/powerpc.rs":"9ca3f82f88974e=
6db5569f2d76a5a3749b248a31747a6c0da5820492bdfeca42","src/unix/bsd/freebsdli=
ke/freebsd/powerpc64.rs":"2dae3ecc87eac3b11657aa98915def55fc4b5c0de11fe26aa=
e23329a54628a9a","src/unix/bsd/freebsdlike/freebsd/x86.rs":"c5005e3249eb7c9=
3cfbac72a9e9272320d80ce7983da990ceb05a447f59a02c5","src/unix/bsd/freebsdlik=
e/freebsd/x86_64/align.rs":"0e1f69a88fca1c32874b1daf5db3d446fefbe518dca497f=
096cc9168c39dde70","src/unix/bsd/freebsdlike/freebsd/x86_64/mod.rs":"c3a011=
1252e201c172b99e7d9cbee4cf088d3dd47995110e819f04276bccd198","src/unix/bsd/f=
reebsdlike/mod.rs":"98d322b22050a80636841287d9ed12549a2004a9dbe151763e5b127=
0f5e73ea3","src/unix/bsd/mod.rs":"2fed08973739d7f6a7412b204724af64b1a915c71=
2689c250cf9a08263ba05ff","src/unix/bsd/netbsdlike/mod.rs":"4e9da54e541773c7=
ad4cca9dade1df00f28f2fdac3f8df5957f4c74b7e082344","src/unix/bsd/netbsdlike/=
netbsd/aarch64.rs":"65dcb58d11e8d8028401a9d07ca3eb4cb4f053e04249cc877353449=
d84ccc4cb","src/unix/bsd/netbsdlike/netbsd/arm.rs":"58cdbb70b0d6f536551f0f3=
bb3725d2d75c4690db12c26c034e7d6ec4a924452","src/unix/bsd/netbsdlike/netbsd/=
mod.rs":"f6de6981382af87518e4a5b6d26c2ea551ed74640dd7166107a824af30ced243",=
"src/unix/bsd/netbsdlike/netbsd/powerpc.rs":"ee7ff5d89d0ed22f531237b5059aa6=
69df93a3b5c489fa641465ace8d405bf41","src/unix/bsd/netbsdlike/netbsd/sparc64=
.rs":"9489f4b3e4566f43bb12dfb92238960613dac7f6a45cc13068a8d152b902d7d9","sr=
c/unix/bsd/netbsdlike/netbsd/x86.rs":"20692320e36bfe028d1a34d16fe12ca77aa90=
9cb02bda167376f98f1a09aefe7","src/unix/bsd/netbsdlike/netbsd/x86_64.rs":"1a=
fe5ef46b14397cdd68664b5b232e4f5b035b6db1d4cf411c899d51ebca9f30","src/unix/b=
sd/netbsdlike/openbsd/aarch64.rs":"dd91931d373b7ecaf6e2de25adadee10d16fa9b1=
2c2cbacdff3eb291e1ba36af","src/unix/bsd/netbsdlike/openbsd/mod.rs":"47aaab2=
bd8238e937112ff17e8262945c8e5865d5e696f218b11c1da59830808","src/unix/bsd/ne=
tbsdlike/openbsd/sparc64.rs":"d04fd287afbaa2c5df9d48c94e8374a532a3ba491b424=
ddf018270c7312f4085","src/unix/bsd/netbsdlike/openbsd/x86.rs":"6f7f5c4fde2a=
2259eb547890cbd86570cea04ef85347d7569e94e679448bec87","src/unix/bsd/netbsdl=
ike/openbsd/x86_64.rs":"d31db31630289c85af3339dbe357998a21ca584cbae31607448=
fe2cf7675a4e1","src/unix/haiku/b32.rs":"69ae47fc52c6880e85416b4744500d5655c=
9ec6131cb737f3b649fceaadce15a","src/unix/haiku/b64.rs":"73e64db09275a8da8d5=
0a13cce2cfa2b136036ddf3a930d2939f337fc995900b","src/unix/haiku/mod.rs":"80a=
6cfb58acbbc471dbd412dd76a41f372befc8f217fb1671ed4ce8d391dced0","src/unix/ha=
iku/native.rs":"44855f52906f607de137fc4baa8c6b1b9a26baaa666f25d5f7a7ec5e017=
c8be6","src/unix/haiku/x86_64.rs":"3ec3aeeb7ed208b8916f3e32d42bfd085ff5e169=
36a1a35d9a52789f043b7237","src/unix/hermit/aarch64.rs":"86048676e335944c37a=
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
3dd9f9fc","src/unix/linux_like/android/b64/mod.rs":"d7bbbadafdb2cb2ff8e9cde=
3d89a03b9facaabb6b2d45705225d3ece1c5cce37","src/unix/linux_like/android/b64=
/x86_64/align.rs":"7169d07a9fd4716f7512719aec9fda5d8bed306dc0720ffc1b21696c=
9951e3c6","src/unix/linux_like/android/b64/x86_64/mod.rs":"06b22dc184e85a98=
8ab969c75cadc52b9878faeab0eb9d21215878c95fe07c19","src/unix/linux_like/andr=
oid/mod.rs":"07cebaa8d953446b8df5cb7c5de3932ae85b04d9e9993e3a3a126ff8f15111=
a4","src/unix/linux_like/emscripten/align.rs":"86c95cbed7a7161b1f23ee06843e=
7b0e2340ad92b2cb86fe2a8ef3e0e8c36216","src/unix/linux_like/emscripten/mod.r=
s":"b71d37106750f57bc2dae4e9bcb473ff098ef48235827e41a1687a39825f0aa4","src/=
unix/linux_like/emscripten/no_align.rs":"0128e4aa721a9902754828b61b5ec7d8a8=
6619983ed1e0544a85d35b1051fad6","src/unix/linux_like/linux/align.rs":"213e7=
0ebed2703e14a9cf17666b21ecbf180b7bff7fa22fdbb36dbbd52df326d","src/unix/linu=
x_like/linux/arch/generic/mod.rs":"1618634d37348032f5ce1dc9df1aaa1f1681bca4=
a275f23d41f42098c4d3b423","src/unix/linux_like/linux/arch/mips/mod.rs":"dac=
02cd01dbd3b222286887c64d398c031afc08d38850c2b3ce2fe7158d888e0","src/unix/li=
nux_like/linux/arch/mod.rs":"466a29622e47c6c7f1500682b2eb17f5566dd81b322cd6=
348f0fdd355cec593a","src/unix/linux_like/linux/arch/powerpc/mod.rs":"1789eb=
5b41f75c29239795124a4a7cdcf7c8d213b88cf581b2f5bda08d7cf15b","src/unix/linux=
_like/linux/arch/sparc/mod.rs":"e7139d3bfb291a283c767e6201eac8bbb58c91839a3=
6fa56bfe500fcb3aa754a","src/unix/linux_like/linux/gnu/align.rs":"e4a3c27fe2=
0a57b8d612c34cb05bc70646edb5cec7251957315afa53a7b9f936","src/unix/linux_lik=
e/linux/gnu/b32/arm/align.rs":"3fed009dc9af3cc81be7087da9d2d7d1f39845e4497e=
290259c5cdbae25f039d","src/unix/linux_like/linux/gnu/b32/arm/mod.rs":"5e40c=
273b767c369a46c3315c7cfde97379944ed63c74735e98d4dae2c49d414","src/unix/linu=
x_like/linux/gnu/b32/mips/align.rs":"429fb5e005cb7143602d430098b6ebfb7d3606=
85b194f333dfd587472ae954ee","src/unix/linux_like/linux/gnu/b32/mips/mod.rs"=
:"20b4c897fb3f63e31a04849b348ec8e6e6405ce9463048d411114f8c9dbabd8a","src/un=
ix/linux_like/linux/gnu/b32/mod.rs":"794dbcbae7dae8fd6b0b814573243197ceb532=
b56ef0772ad86b4b401478fcd9","src/unix/linux_like/linux/gnu/b32/powerpc.rs":=
"0cd7348badb9c4f8a0db31a2503b30c456a2bfcc7a0e5919762b1e12f912c5ad","src/uni=
x/linux_like/linux/gnu/b32/riscv32/mod.rs":"ee5145a383386b716605a8d1ff3df21=
2d418aae1aa1f37d2307d4f9cd1a08e99","src/unix/linux_like/linux/gnu/b32/sparc=
/align.rs":"21adbed27df73e2d1ed934aaf733a643003d7baf2bde9c48ea440895bcca6d4=
1","src/unix/linux_like/linux/gnu/b32/sparc/mod.rs":"a2c4ae8f31a74e4843b8ff=
4b6507419f403b52713169fcee9b1b24eb2324162a","src/unix/linux_like/linux/gnu/=
b32/x86/align.rs":"e4bafdc4a519a7922a81b37a62bbfd1177a2f620890eef8f1fbc4716=
2e9eb413","src/unix/linux_like/linux/gnu/b32/x86/mod.rs":"525ee4917b54790ce=
fc1298ec1015cea6332d818d9c7475434e94d06afdd59c0","src/unix/linux_like/linux=
/gnu/b64/aarch64/align.rs":"2179c3b1608fa4bf68840482bfc2b2fa3ee2faf6fcae377=
0f9e505cddca35c7b","src/unix/linux_like/linux/gnu/b64/aarch64/ilp32.rs":"21=
a21503ef2e095f4371044915d4bfb07a8578011cb5c713cd9f45947b0b5730","src/unix/l=
inux_like/linux/gnu/b64/aarch64/lp64.rs":"e78c3cd197f44832338b414d1a9bc0d19=
4f44c74db77bd7bf830c1fff62b2690","src/unix/linux_like/linux/gnu/b64/aarch64=
/mod.rs":"d179cbb462c451ff8805029b2b922c4bf90e35f667e80d716d5064f563aebc52"=
,"src/unix/linux_like/linux/gnu/b64/mips64/align.rs":"7169d07a9fd4716f75127=
19aec9fda5d8bed306dc0720ffc1b21696c9951e3c6","src/unix/linux_like/linux/gnu=
/b64/mips64/mod.rs":"7d456da436017cb388b65b2c4b626c83b489cbb19a591673b9c627=
a608d53cfc","src/unix/linux_like/linux/gnu/b64/mod.rs":"6336065423c26b59681=
fd2ce77f1117ea36af13e163fdadaefd108bd8191e8c8","src/unix/linux_like/linux/g=
nu/b64/powerpc64/align.rs":"e29c4868bbecfa4a6cd8a2ad06193f3bbc78a468cc1dc9d=
f83f002f1268130d9","src/unix/linux_like/linux/gnu/b64/powerpc64/mod.rs":"db=
b8905e363ed4a2dfb984554ad9b6389d27f6a2d599ec2d80e38a6c7551a019","src/unix/l=
inux_like/linux/gnu/b64/riscv64/mod.rs":"5b982c41097f4f91adcb0968290afeccb2=
7dce1695a261c964d34ef85df87cf4","src/unix/linux_like/linux/gnu/b64/s390x.rs=
":"fce37140468f8914411eed0b25a882e60e1b54bcffcd33d6263a91b57d04f6c1","src/u=
nix/linux_like/linux/gnu/b64/sparc64/align.rs":"e29c4868bbecfa4a6cd8a2ad061=
93f3bbc78a468cc1dc9df83f002f1268130d9","src/unix/linux_like/linux/gnu/b64/s=
parc64/mod.rs":"518ef78da0d81fe74cec30be411145d763fdfd249de4d108602fd099578=
1f590","src/unix/linux_like/linux/gnu/b64/x86_64/align.rs":"7169d07a9fd4716=
f7512719aec9fda5d8bed306dc0720ffc1b21696c9951e3c6","src/unix/linux_like/lin=
ux/gnu/b64/x86_64/mod.rs":"76cba0a3f9456a968d2ae6ea587162b2ff04278dc5250cb1=
76395c936579771b","src/unix/linux_like/linux/gnu/b64/x86_64/not_x32.rs":"f7=
75ac2b754f90b63053fe22afe1d19d306b5404995568d6805baa9249fb617f","src/unix/l=
inux_like/linux/gnu/b64/x86_64/x32.rs":"4ba1b58468f55254717366f50fdfd3e4114=
fde6dc442a56681926c4d7e5b6b0d","src/unix/linux_like/linux/gnu/mod.rs":"af35=
90c392bd06394cb307ccb993e66f53de7e2a0211c689dbb1845220475445","src/unix/lin=
ux_like/linux/gnu/no_align.rs":"9cd223135de75315840ff9c3fd5441ba1cb632b96b5=
c85a76f8316c86653db25","src/unix/linux_like/linux/mod.rs":"88ce2c4105c07c12=
62495e0ff1bd53f3ceec99adba9c20c612439838b4dbfdd6","src/unix/linux_like/linu=
x/musl/b32/arm/align.rs":"3e8ac052c1043764776b54c93ba4260e061df998631737a89=
7d9d47d54f7b80c","src/unix/linux_like/linux/musl/b32/arm/mod.rs":"6255abe2e=
e04986832d12b7b2190589580f2a43e9bfb285b32b5747227f62727","src/unix/linux_li=
ke/linux/musl/b32/hexagon.rs":"10067cde5706e1173aa8e0a3a364cf44fe5b7a9f8b71=
cb086c653be71af00564","src/unix/linux_like/linux/musl/b32/mips/align.rs":"4=
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
c/unix/linux_like/linux/musl/mod.rs":"55ccd71342276ccb4c441a4bc2772aebfd163=
af299669b658c6c8c6add331ec3","src/unix/linux_like/linux/no_align.rs":"5ed04=
c53bf9d27da9b4d65ba7625c6ac53330162683d1b3df98950caafa3507b","src/unix/linu=
x_like/linux/uclibc/align.rs":"9ed16138d8e439bd90930845a65eafa7ebd67366e6bf=
633936d44014f6e4c959","src/unix/linux_like/linux/uclibc/arm/align.rs":"e4a3=
c27fe20a57b8d612c34cb05bc70646edb5cec7251957315afa53a7b9f936","src/unix/lin=
ux_like/linux/uclibc/arm/mod.rs":"1e3bf809508b5872949136859bf48ddf58b7d24ae=
9f0b663e79f0efd1aaeb6a6","src/unix/linux_like/linux/uclibc/arm/no_align.rs"=
:"9cd223135de75315840ff9c3fd5441ba1cb632b96b5c85a76f8316c86653db25","src/un=
ix/linux_like/linux/uclibc/mips/mips32/align.rs":"e4a3c27fe20a57b8d612c34cb=
05bc70646edb5cec7251957315afa53a7b9f936","src/unix/linux_like/linux/uclibc/=
mips/mips32/mod.rs":"fa4102d9a596d90de604ce2962b0e64f184dfbf10552a4c3ecf28f=
12d4704379","src/unix/linux_like/linux/uclibc/mips/mips32/no_align.rs":"9cd=
223135de75315840ff9c3fd5441ba1cb632b96b5c85a76f8316c86653db25","src/unix/li=
nux_like/linux/uclibc/mips/mips64/align.rs":"a7bdcb18a37a2d91e64d5fad83ea3e=
dc78f5412adb28f77ab077dbb26dd08b2d","src/unix/linux_like/linux/uclibc/mips/=
mips64/mod.rs":"e3085ba56cfbc528d7c3c55065880603238c333b6047ef51c58177508a4=
87fcd","src/unix/linux_like/linux/uclibc/mips/mips64/no_align.rs":"4a18e387=
5698c85229599225ac3401a2a40da87e77b2ad4ef47c6fcd5a24ed30","src/unix/linux_l=
ike/linux/uclibc/mips/mod.rs":"a2877679fef0f14f54a89ccbc41fb02f0c25bf6e536f=
9eb2cb2fa437e1d3f739","src/unix/linux_like/linux/uclibc/mod.rs":"82d504d3aa=
12cb0f7933980f81c4708fa6e070d4c57efdf407f2de05b71bc06d","src/unix/linux_lik=
e/linux/uclibc/no_align.rs":"3f28637046524618adaa1012e26cb7ffe94b9396e6b518=
cccdc69d59f274d709","src/unix/linux_like/linux/uclibc/x86_64/l4re.rs":"024e=
ba5753e852dbdd212427351affe7e83f9916c1864bce414d7aa2618f192e","src/unix/lin=
ux_like/linux/uclibc/x86_64/mod.rs":"66e8f5b7509a6e638b8b904906f89badbab0da=
8fb5b602d07ebd88649c4b961a","src/unix/linux_like/linux/uclibc/x86_64/other.=
rs":"42c3f71e58cabba373f6a55a623f3c31b85049eb64824c09c2b082b3b2d6a0a8","src=
/unix/linux_like/mod.rs":"ffce98bdd208fd9d335c65feafbf0d9742bea67c7eec1ee48=
657f292132ec3f0","src/unix/mod.rs":"b72f18e053cca0ade0f0606f1848a773fcf1885=
c72cbb31889275e8195f060bd","src/unix/newlib/aarch64/mod.rs":"bb269c1468a967=
6442554600e87417079a787fe6220dfc23b3109639259e8710","src/unix/newlib/align.=
rs":"28aaf87fafbc6b312622719d472d8cf65f9e5467d15339df5f73e66d8502b28a","src=
/unix/newlib/arm/mod.rs":"c71be856bfd7f576b2db28af9f680211cbe6c1cac7d537bbc=
8020b39591af07c","src/unix/newlib/espidf/mod.rs":"c198cb4beccdab483be61c102=
da74dc51ac80f766797e33021f3110394ed5a3d","src/unix/newlib/mod.rs":"d7271c13=
748be08305d36f9af6f41f6950a7a1d6d4382149194a35d5fe2090de","src/unix/newlib/=
no_align.rs":"e0743b2179495a9514bc3a4d1781e492878c4ec834ee0085d0891dd1712e8=
2fb","src/unix/newlib/powerpc/mod.rs":"2d0f7af28b47f7a2a6c210ebd1c1f33ed8ea=
c62e56b5af2b856de2ad3fdc5187","src/unix/no_align.rs":"c06e95373b9088266e0b1=
4bba0954eef95f93fb2b01d951855e382d22de78e53","src/unix/redox/mod.rs":"cc479=
4afa4fbed9d6612894ea476228f9d8533950162d6416fc4d16073e1dac4","src/unix/sola=
rish/compat.rs":"b07a5bfac925eb012003a459ba6bddbd3bfa9c44b3394da2ac5a602e54=
beae9c","src/unix/solarish/illumos.rs":"7d8f47fd37880715b449723688aaee56878=
5325a46f1c360a05bdca13252278e","src/unix/solarish/mod.rs":"ea9dd1c1d6892740=
8342762ee8998a9628838974c91089f620c867910c29adba","src/unix/solarish/solari=
s.rs":"65b005453aefa9b9d4fc860fe77cfec80d8c97a51342b15daf55fc3e808bb384","s=
rc/unix/solarish/x86_64.rs":"9d761573bdccbdd1ac61da571f7e96b5374df70241d9b7=
2d45a069611f495085","src/vxworks/aarch64.rs":"98f0afdc511cd02557e506c21fed6=
737585490a1dce7a9d4941d08c437762b99","src/vxworks/arm.rs":"acb7968ce99fe3f4=
abdf39d98f8133d21a4fba435b8ef7084777cb181d788e88","src/vxworks/mod.rs":"aea=
3da66f2140f2a82dfc9c58f6e6531d2dd9c15ea696e0f95a0d4a2a187b5b6","src/vxworks=
/powerpc.rs":"acb7968ce99fe3f4abdf39d98f8133d21a4fba435b8ef7084777cb181d788=
e88","src/vxworks/powerpc64.rs":"98f0afdc511cd02557e506c21fed6737585490a1dc=
e7a9d4941d08c437762b99","src/vxworks/x86.rs":"552f007f38317620b23889cb7c49d=
1d115841252439060122f52f434fbc6e5ba","src/vxworks/x86_64.rs":"018d92be3ad62=
8a129eff9f2f5dfbc0883d8b8e5f2fa917b900a7f98ed6b514a","src/wasi.rs":"44ce561=
83380d18aedea9b7bec2edc5819e8529302c913bfe5d01f760155b82a","src/windows/gnu=
/align.rs":"b2c13ec1b9f3b39a75c452c80c951dff9d0215e31d77e883b4502afb3179464=
7","src/windows/gnu/mod.rs":"3c8c7edb7cdf5d0c44af936db2a94869585c69dfabeef3=
0571b4f4e38375767a","src/windows/mod.rs":"1cd9223293255b994814487e28d9979fb=
8ebef4538a236c1aa47fdc166a149cc","src/windows/msvc/mod.rs":"c068271e00fca6b=
62bc4bf44bcf142cfc38caeded9b6c4e01d1ceef3ccf986f4","tests/const_fn.rs":"cb7=
5a1f0864f926aebe79118fc34d51a0d1ade2c20a394e7774c7e545f21f1f4"},"package":"=
fbe5e23404da5b4f555ef85ebed98fb4083e55a00c317800bc2a50ede9f3d219"}
-\ No newline at end of file
-+{"files":{"CONTRIBUTING.md":"752eea5a703d11b485c6b5f195f51bd2c79aa5159b61=
9ce09555c779e1fb586b","Cargo.toml":"d6f6253f05d207b6c676e5647b31ad0ca3f05da=
3ac05db47f81d4ebd901ba22f","LICENSE-APACHE":"a60eea817514531668d7e007657314=
49fe14d059d3249e0bc93b36de45f759f2","LICENSE-MIT":"a8d47ff51ca256f56a8932db=
a07660672dbfe3004257ca8de708aac1415937a1","README.md":"8228847944f1332882fb=
b00275b6f30e4a8aad08a13569c25d52cac012cc2a47","build.rs":"a71b92db5077b33af=
4ee6f1de33574ac33c2b292840eddbe3f7cce37f1fb16b9","rustfmt.toml":"eaa2ea84fc=
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
f7431165ab1a37dc4667ae0b58e8306f4c539bfa110c","src/lib.rs":"e92c56b42f1bd1b=
9e66be2a9b73aca6ba29024b9bd17c16f327dfbe8831e3f86","src/macros.rs":"c1a299d=
5327ba033f079388f8ac8a44848f9aeff6a72e9be6dfa70f4769cc619","src/psp.rs":"dd=
31aabd46171d474ec5828372e28588935120e7355c90c105360d8fa9264c1c","src/sgx.rs=
":"16a95cdefc81c5ee00d8353a60db363c4cc3e0f75abcd5d0144723f2a306ed1b","src/s=
olid/aarch64.rs":"8cdae0cc37c43dabd4253a534e700bec6b6a57293c0c8e36c9ce16675=
d16799a","src/solid/arm.rs":"852b58a0837fde089cb9b5af131bf653daeb8c726f7540=
032756db8b7d4f8149","src/solid/mod.rs":"98dc29c3e5773318ba258a4a2b7407f25aa=
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
/mod.rs":"96f101bdab46a9f0a5249a8143d4a9def055284a0c2bd62bce15532a5bed428c"=
,"src/unix/bsd/freebsdlike/dragonfly/errno.rs":"8295b8bb0dfd38d2cdb4d9192cd=
eeb534cc6c3b208170e64615fa3e0edb3e578","src/unix/bsd/freebsdlike/dragonfly/=
mod.rs":"6ea4129eb5d6da5c09f8cf3692b5e7716f058b48d1e8c61115691709eda7ce51",=
"src/unix/bsd/freebsdlike/freebsd/aarch64.rs":"2a215bd6136b8617aacedf9be738=
ccee94da9d29b418e9a78101d6291c182352","src/unix/bsd/freebsdlike/freebsd/arm=
.rs":"59d6a670eea562fb87686e243e0a84603d29a2028a3d4b3f99ccc01bd04d2f47","sr=
c/unix/bsd/freebsdlike/freebsd/freebsd11/b64.rs":"9808d152c1196aa647f1b0f0c=
f84dac8c930da7d7f897a44975545e3d9d17681","src/unix/bsd/freebsdlike/freebsd/=
freebsd11/mod.rs":"bf0a994e2079b8aad9da5efd3a3b9a7194a53ae60887a25c57964fb6=
8499e847","src/unix/bsd/freebsdlike/freebsd/freebsd12/b64.rs":"61cbe45f8499=
bedb168106b686d4f8239472f25c7553b069eec2afe197ff2df6","src/unix/bsd/freebsd=
like/freebsd/freebsd12/mod.rs":"295b3e3b67394f731d4e88d169e3d3d1d80026b9989=
8745cd0d1d163f085ff61","src/unix/bsd/freebsdlike/freebsd/freebsd12/x86_64.r=
s":"2df36a7f122f6d6e5753cfb4d22e915cc80f6bc91c0161b3daae55a481bfd052","src/=
unix/bsd/freebsdlike/freebsd/freebsd13/b64.rs":"61cbe45f8499bedb168106b686d=
4f8239472f25c7553b069eec2afe197ff2df6","src/unix/bsd/freebsdlike/freebsd/fr=
eebsd13/mod.rs":"98f6af2021b434f9c3197094312b457774381220f31a22c3b15b1fe8a6=
0cb365","src/unix/bsd/freebsdlike/freebsd/freebsd13/x86_64.rs":"2df36a7f122=
f6d6e5753cfb4d22e915cc80f6bc91c0161b3daae55a481bfd052","src/unix/bsd/freebs=
dlike/freebsd/mod.rs":"6b825079ffe3f9aec6e78ea6b50acedcb91a4e1312d721105b7f=
8b1555f254df","src/unix/bsd/freebsdlike/freebsd/powerpc.rs":"9ca3f82f88974e=
6db5569f2d76a5a3749b248a31747a6c0da5820492bdfeca42","src/unix/bsd/freebsdli=
ke/freebsd/powerpc64.rs":"2dae3ecc87eac3b11657aa98915def55fc4b5c0de11fe26aa=
e23329a54628a9a","src/unix/bsd/freebsdlike/freebsd/x86.rs":"c5005e3249eb7c9=
3cfbac72a9e9272320d80ce7983da990ceb05a447f59a02c5","src/unix/bsd/freebsdlik=
e/freebsd/x86_64/align.rs":"0e1f69a88fca1c32874b1daf5db3d446fefbe518dca497f=
096cc9168c39dde70","src/unix/bsd/freebsdlike/freebsd/x86_64/mod.rs":"c3a011=
1252e201c172b99e7d9cbee4cf088d3dd47995110e819f04276bccd198","src/unix/bsd/f=
reebsdlike/mod.rs":"98d322b22050a80636841287d9ed12549a2004a9dbe151763e5b127=
0f5e73ea3","src/unix/bsd/mod.rs":"2fed08973739d7f6a7412b204724af64b1a915c71=
2689c250cf9a08263ba05ff","src/unix/bsd/netbsdlike/mod.rs":"4e9da54e541773c7=
ad4cca9dade1df00f28f2fdac3f8df5957f4c74b7e082344","src/unix/bsd/netbsdlike/=
netbsd/aarch64.rs":"65dcb58d11e8d8028401a9d07ca3eb4cb4f053e04249cc877353449=
d84ccc4cb","src/unix/bsd/netbsdlike/netbsd/arm.rs":"58cdbb70b0d6f536551f0f3=
bb3725d2d75c4690db12c26c034e7d6ec4a924452","src/unix/bsd/netbsdlike/netbsd/=
mod.rs":"f6de6981382af87518e4a5b6d26c2ea551ed74640dd7166107a824af30ced243",=
"src/unix/bsd/netbsdlike/netbsd/powerpc.rs":"ee7ff5d89d0ed22f531237b5059aa6=
69df93a3b5c489fa641465ace8d405bf41","src/unix/bsd/netbsdlike/netbsd/sparc64=
.rs":"9489f4b3e4566f43bb12dfb92238960613dac7f6a45cc13068a8d152b902d7d9","sr=
c/unix/bsd/netbsdlike/netbsd/x86.rs":"20692320e36bfe028d1a34d16fe12ca77aa90=
9cb02bda167376f98f1a09aefe7","src/unix/bsd/netbsdlike/netbsd/x86_64.rs":"1a=
fe5ef46b14397cdd68664b5b232e4f5b035b6db1d4cf411c899d51ebca9f30","src/unix/b=
sd/netbsdlike/openbsd/aarch64.rs":"dd91931d373b7ecaf6e2de25adadee10d16fa9b1=
2c2cbacdff3eb291e1ba36af","src/unix/bsd/netbsdlike/openbsd/mod.rs":"47aaab2=
bd8238e937112ff17e8262945c8e5865d5e696f218b11c1da59830808","src/unix/bsd/ne=
tbsdlike/openbsd/sparc64.rs":"d04fd287afbaa2c5df9d48c94e8374a532a3ba491b424=
ddf018270c7312f4085","src/unix/bsd/netbsdlike/openbsd/x86.rs":"6f7f5c4fde2a=
2259eb547890cbd86570cea04ef85347d7569e94e679448bec87","src/unix/bsd/netbsdl=
ike/openbsd/x86_64.rs":"d31db31630289c85af3339dbe357998a21ca584cbae31607448=
fe2cf7675a4e1","src/unix/haiku/b32.rs":"69ae47fc52c6880e85416b4744500d5655c=
9ec6131cb737f3b649fceaadce15a","src/unix/haiku/b64.rs":"73e64db09275a8da8d5=
0a13cce2cfa2b136036ddf3a930d2939f337fc995900b","src/unix/haiku/mod.rs":"80a=
6cfb58acbbc471dbd412dd76a41f372befc8f217fb1671ed4ce8d391dced0","src/unix/ha=
iku/native.rs":"44855f52906f607de137fc4baa8c6b1b9a26baaa666f25d5f7a7ec5e017=
c8be6","src/unix/haiku/x86_64.rs":"3ec3aeeb7ed208b8916f3e32d42bfd085ff5e169=
36a1a35d9a52789f043b7237","src/unix/hermit/aarch64.rs":"86048676e335944c37a=
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
3dd9f9fc","src/unix/linux_like/android/b64/mod.rs":"d7bbbadafdb2cb2ff8e9cde=
3d89a03b9facaabb6b2d45705225d3ece1c5cce37","src/unix/linux_like/android/b64=
/x86_64/align.rs":"7169d07a9fd4716f7512719aec9fda5d8bed306dc0720ffc1b21696c=
9951e3c6","src/unix/linux_like/android/b64/x86_64/mod.rs":"06b22dc184e85a98=
8ab969c75cadc52b9878faeab0eb9d21215878c95fe07c19","src/unix/linux_like/andr=
oid/mod.rs":"07cebaa8d953446b8df5cb7c5de3932ae85b04d9e9993e3a3a126ff8f15111=
a4","src/unix/linux_like/emscripten/align.rs":"86c95cbed7a7161b1f23ee06843e=
7b0e2340ad92b2cb86fe2a8ef3e0e8c36216","src/unix/linux_like/emscripten/mod.r=
s":"b71d37106750f57bc2dae4e9bcb473ff098ef48235827e41a1687a39825f0aa4","src/=
unix/linux_like/emscripten/no_align.rs":"0128e4aa721a9902754828b61b5ec7d8a8=
6619983ed1e0544a85d35b1051fad6","src/unix/linux_like/linux/align.rs":"213e7=
0ebed2703e14a9cf17666b21ecbf180b7bff7fa22fdbb36dbbd52df326d","src/unix/linu=
x_like/linux/arch/generic/mod.rs":"1618634d37348032f5ce1dc9df1aaa1f1681bca4=
a275f23d41f42098c4d3b423","src/unix/linux_like/linux/arch/mips/mod.rs":"dac=
02cd01dbd3b222286887c64d398c031afc08d38850c2b3ce2fe7158d888e0","src/unix/li=
nux_like/linux/arch/mod.rs":"466a29622e47c6c7f1500682b2eb17f5566dd81b322cd6=
348f0fdd355cec593a","src/unix/linux_like/linux/arch/powerpc/mod.rs":"1789eb=
5b41f75c29239795124a4a7cdcf7c8d213b88cf581b2f5bda08d7cf15b","src/unix/linux=
_like/linux/arch/sparc/mod.rs":"e7139d3bfb291a283c767e6201eac8bbb58c91839a3=
6fa56bfe500fcb3aa754a","src/unix/linux_like/linux/gnu/align.rs":"e4a3c27fe2=
0a57b8d612c34cb05bc70646edb5cec7251957315afa53a7b9f936","src/unix/linux_lik=
e/linux/gnu/b32/arm/align.rs":"3fed009dc9af3cc81be7087da9d2d7d1f39845e4497e=
290259c5cdbae25f039d","src/unix/linux_like/linux/gnu/b32/arm/mod.rs":"5e40c=
273b767c369a46c3315c7cfde97379944ed63c74735e98d4dae2c49d414","src/unix/linu=
x_like/linux/gnu/b32/mips/align.rs":"429fb5e005cb7143602d430098b6ebfb7d3606=
85b194f333dfd587472ae954ee","src/unix/linux_like/linux/gnu/b32/mips/mod.rs"=
:"20b4c897fb3f63e31a04849b348ec8e6e6405ce9463048d411114f8c9dbabd8a","src/un=
ix/linux_like/linux/gnu/b32/mod.rs":"794dbcbae7dae8fd6b0b814573243197ceb532=
b56ef0772ad86b4b401478fcd9","src/unix/linux_like/linux/gnu/b32/powerpc.rs":=
"0cd7348badb9c4f8a0db31a2503b30c456a2bfcc7a0e5919762b1e12f912c5ad","src/uni=
x/linux_like/linux/gnu/b32/riscv32/mod.rs":"ee5145a383386b716605a8d1ff3df21=
2d418aae1aa1f37d2307d4f9cd1a08e99","src/unix/linux_like/linux/gnu/b32/sparc=
/align.rs":"21adbed27df73e2d1ed934aaf733a643003d7baf2bde9c48ea440895bcca6d4=
1","src/unix/linux_like/linux/gnu/b32/sparc/mod.rs":"a2c4ae8f31a74e4843b8ff=
4b6507419f403b52713169fcee9b1b24eb2324162a","src/unix/linux_like/linux/gnu/=
b32/x86/align.rs":"e4bafdc4a519a7922a81b37a62bbfd1177a2f620890eef8f1fbc4716=
2e9eb413","src/unix/linux_like/linux/gnu/b32/x86/mod.rs":"525ee4917b54790ce=
fc1298ec1015cea6332d818d9c7475434e94d06afdd59c0","src/unix/linux_like/linux=
/gnu/b64/aarch64/align.rs":"2179c3b1608fa4bf68840482bfc2b2fa3ee2faf6fcae377=
0f9e505cddca35c7b","src/unix/linux_like/linux/gnu/b64/aarch64/ilp32.rs":"21=
a21503ef2e095f4371044915d4bfb07a8578011cb5c713cd9f45947b0b5730","src/unix/l=
inux_like/linux/gnu/b64/aarch64/lp64.rs":"e78c3cd197f44832338b414d1a9bc0d19=
4f44c74db77bd7bf830c1fff62b2690","src/unix/linux_like/linux/gnu/b64/aarch64=
/mod.rs":"d179cbb462c451ff8805029b2b922c4bf90e35f667e80d716d5064f563aebc52"=
,"src/unix/linux_like/linux/gnu/b64/mips64/align.rs":"7169d07a9fd4716f75127=
19aec9fda5d8bed306dc0720ffc1b21696c9951e3c6","src/unix/linux_like/linux/gnu=
/b64/mips64/mod.rs":"7d456da436017cb388b65b2c4b626c83b489cbb19a591673b9c627=
a608d53cfc","src/unix/linux_like/linux/gnu/b64/mod.rs":"6336065423c26b59681=
fd2ce77f1117ea36af13e163fdadaefd108bd8191e8c8","src/unix/linux_like/linux/g=
nu/b64/powerpc64/align.rs":"e29c4868bbecfa4a6cd8a2ad06193f3bbc78a468cc1dc9d=
f83f002f1268130d9","src/unix/linux_like/linux/gnu/b64/powerpc64/mod.rs":"db=
b8905e363ed4a2dfb984554ad9b6389d27f6a2d599ec2d80e38a6c7551a019","src/unix/l=
inux_like/linux/gnu/b64/riscv64/mod.rs":"5b982c41097f4f91adcb0968290afeccb2=
7dce1695a261c964d34ef85df87cf4","src/unix/linux_like/linux/gnu/b64/s390x.rs=
":"fce37140468f8914411eed0b25a882e60e1b54bcffcd33d6263a91b57d04f6c1","src/u=
nix/linux_like/linux/gnu/b64/sparc64/align.rs":"e29c4868bbecfa4a6cd8a2ad061=
93f3bbc78a468cc1dc9df83f002f1268130d9","src/unix/linux_like/linux/gnu/b64/s=
parc64/mod.rs":"518ef78da0d81fe74cec30be411145d763fdfd249de4d108602fd099578=
1f590","src/unix/linux_like/linux/gnu/b64/x86_64/align.rs":"7169d07a9fd4716=
f7512719aec9fda5d8bed306dc0720ffc1b21696c9951e3c6","src/unix/linux_like/lin=
ux/gnu/b64/x86_64/mod.rs":"76cba0a3f9456a968d2ae6ea587162b2ff04278dc5250cb1=
76395c936579771b","src/unix/linux_like/linux/gnu/b64/x86_64/not_x32.rs":"f7=
75ac2b754f90b63053fe22afe1d19d306b5404995568d6805baa9249fb617f","src/unix/l=
inux_like/linux/gnu/b64/x86_64/x32.rs":"4ba1b58468f55254717366f50fdfd3e4114=
fde6dc442a56681926c4d7e5b6b0d","src/unix/linux_like/linux/gnu/mod.rs":"af35=
90c392bd06394cb307ccb993e66f53de7e2a0211c689dbb1845220475445","src/unix/lin=
ux_like/linux/gnu/no_align.rs":"9cd223135de75315840ff9c3fd5441ba1cb632b96b5=
c85a76f8316c86653db25","src/unix/linux_like/linux/mod.rs":"88ce2c4105c07c12=
62495e0ff1bd53f3ceec99adba9c20c612439838b4dbfdd6","src/unix/linux_like/linu=
x/musl/b32/arm/align.rs":"3e8ac052c1043764776b54c93ba4260e061df998631737a89=
7d9d47d54f7b80c","src/unix/linux_like/linux/musl/b32/arm/mod.rs":"6255abe2e=
e04986832d12b7b2190589580f2a43e9bfb285b32b5747227f62727","src/unix/linux_li=
ke/linux/musl/b32/hexagon.rs":"10067cde5706e1173aa8e0a3a364cf44fe5b7a9f8b71=
cb086c653be71af00564","src/unix/linux_like/linux/musl/b32/mips/align.rs":"4=
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
b7e9121c7fe28346",
-+"src/unix/linux_like/linux/musl/b64/mod.rs":"d847206d9f2d594c8febe780a938=
cdccf40d985dafc11e90f235947735a09bac",
-+"src/unix/linux_like/linux/musl/b64/powerpc64.rs":"e5a55525b42493923956d6=
68f978fb45e22d51deea00ce5edbfddf76ff19c741","src/unix/linux_like/linux/musl=
/b64/s390x.rs":"03dfec6794d93cb31a7c52b2d53a0973755168f91f8fa437cc5dbd54882=
c8ee7","src/unix/linux_like/linux/musl/b64/x86_64/align.rs":"7169d07a9fd471=
6f7512719aec9fda5d8bed306dc0720ffc1b21696c9951e3c6","src/unix/linux_like/li=
nux/musl/b64/x86_64/mod.rs":"0dd168f5a6881f32e5239fb312b23cf137b800d0ff3232=
86a92c8a2c382b5456",
-+"src/unix/linux_like/linux/musl/mod.rs":"ac08dd0891304a0e6f478a38bffa4fe8=
e6b27ad79094b2f7139c7a95082c3a18",
-+"src/unix/linux_like/linux/no_align.rs":"5ed04c53bf9d27da9b4d65ba7625c6ac=
53330162683d1b3df98950caafa3507b","src/unix/linux_like/linux/uclibc/align.r=
s":"9ed16138d8e439bd90930845a65eafa7ebd67366e6bf633936d44014f6e4c959","src/=
unix/linux_like/linux/uclibc/arm/align.rs":"e4a3c27fe20a57b8d612c34cb05bc70=
646edb5cec7251957315afa53a7b9f936","src/unix/linux_like/linux/uclibc/arm/mo=
d.rs":"1e3bf809508b5872949136859bf48ddf58b7d24ae9f0b663e79f0efd1aaeb6a6","s=
rc/unix/linux_like/linux/uclibc/arm/no_align.rs":"9cd223135de75315840ff9c3f=
d5441ba1cb632b96b5c85a76f8316c86653db25","src/unix/linux_like/linux/uclibc/=
mips/mips32/align.rs":"e4a3c27fe20a57b8d612c34cb05bc70646edb5cec7251957315a=
fa53a7b9f936","src/unix/linux_like/linux/uclibc/mips/mips32/mod.rs":"fa4102=
d9a596d90de604ce2962b0e64f184dfbf10552a4c3ecf28f12d4704379","src/unix/linux=
_like/linux/uclibc/mips/mips32/no_align.rs":"9cd223135de75315840ff9c3fd5441=
ba1cb632b96b5c85a76f8316c86653db25","src/unix/linux_like/linux/uclibc/mips/=
mips64/align.rs":"a7bdcb18a37a2d91e64d5fad83ea3edc78f5412adb28f77ab077dbb26=
dd08b2d","src/unix/linux_like/linux/uclibc/mips/mips64/mod.rs":"e3085ba56cf=
bc528d7c3c55065880603238c333b6047ef51c58177508a487fcd","src/unix/linux_like=
/linux/uclibc/mips/mips64/no_align.rs":"4a18e3875698c85229599225ac3401a2a40=
da87e77b2ad4ef47c6fcd5a24ed30","src/unix/linux_like/linux/uclibc/mips/mod.r=
s":"a2877679fef0f14f54a89ccbc41fb02f0c25bf6e536f9eb2cb2fa437e1d3f739","src/=
unix/linux_like/linux/uclibc/mod.rs":"82d504d3aa12cb0f7933980f81c4708fa6e07=
0d4c57efdf407f2de05b71bc06d","src/unix/linux_like/linux/uclibc/no_align.rs"=
:"3f28637046524618adaa1012e26cb7ffe94b9396e6b518cccdc69d59f274d709","src/un=
ix/linux_like/linux/uclibc/x86_64/l4re.rs":"024eba5753e852dbdd212427351affe=
7e83f9916c1864bce414d7aa2618f192e","src/unix/linux_like/linux/uclibc/x86_64=
/mod.rs":"66e8f5b7509a6e638b8b904906f89badbab0da8fb5b602d07ebd88649c4b961a"=
,"src/unix/linux_like/linux/uclibc/x86_64/other.rs":"42c3f71e58cabba373f6a5=
5a623f3c31b85049eb64824c09c2b082b3b2d6a0a8","src/unix/linux_like/mod.rs":"f=
fce98bdd208fd9d335c65feafbf0d9742bea67c7eec1ee48657f292132ec3f0","src/unix/=
mod.rs":"b72f18e053cca0ade0f0606f1848a773fcf1885c72cbb31889275e8195f060bd",=
"src/unix/newlib/aarch64/mod.rs":"bb269c1468a9676442554600e87417079a787fe62=
20dfc23b3109639259e8710","src/unix/newlib/align.rs":"28aaf87fafbc6b31262271=
9d472d8cf65f9e5467d15339df5f73e66d8502b28a","src/unix/newlib/arm/mod.rs":"c=
71be856bfd7f576b2db28af9f680211cbe6c1cac7d537bbc8020b39591af07c","src/unix/=
newlib/espidf/mod.rs":"c198cb4beccdab483be61c102da74dc51ac80f766797e33021f3=
110394ed5a3d","src/unix/newlib/mod.rs":"d7271c13748be08305d36f9af6f41f6950a=
7a1d6d4382149194a35d5fe2090de","src/unix/newlib/no_align.rs":"e0743b2179495=
a9514bc3a4d1781e492878c4ec834ee0085d0891dd1712e82fb","src/unix/newlib/power=
pc/mod.rs":"2d0f7af28b47f7a2a6c210ebd1c1f33ed8eac62e56b5af2b856de2ad3fdc518=
7","src/unix/no_align.rs":"c06e95373b9088266e0b14bba0954eef95f93fb2b01d9518=
55e382d22de78e53","src/unix/redox/mod.rs":"cc4794afa4fbed9d6612894ea476228f=
9d8533950162d6416fc4d16073e1dac4","src/unix/solarish/compat.rs":"b07a5bfac9=
25eb012003a459ba6bddbd3bfa9c44b3394da2ac5a602e54beae9c","src/unix/solarish/=
illumos.rs":"7d8f47fd37880715b449723688aaee568785325a46f1c360a05bdca1325227=
8e","src/unix/solarish/mod.rs":"ea9dd1c1d68927408342762ee8998a9628838974c91=
089f620c867910c29adba","src/unix/solarish/solaris.rs":"65b005453aefa9b9d4fc=
860fe77cfec80d8c97a51342b15daf55fc3e808bb384","src/unix/solarish/x86_64.rs"=
:"9d761573bdccbdd1ac61da571f7e96b5374df70241d9b72d45a069611f495085","src/vx=
works/aarch64.rs":"98f0afdc511cd02557e506c21fed6737585490a1dce7a9d4941d08c4=
37762b99","src/vxworks/arm.rs":"acb7968ce99fe3f4abdf39d98f8133d21a4fba435b8=
ef7084777cb181d788e88","src/vxworks/mod.rs":"aea3da66f2140f2a82dfc9c58f6e65=
31d2dd9c15ea696e0f95a0d4a2a187b5b6","src/vxworks/powerpc.rs":"acb7968ce99fe=
3f4abdf39d98f8133d21a4fba435b8ef7084777cb181d788e88","src/vxworks/powerpc64=
.rs":"98f0afdc511cd02557e506c21fed6737585490a1dce7a9d4941d08c437762b99","sr=
c/vxworks/x86.rs":"552f007f38317620b23889cb7c49d1d115841252439060122f52f434=
fbc6e5ba","src/vxworks/x86_64.rs":"018d92be3ad628a129eff9f2f5dfbc0883d8b8e5=
f2fa917b900a7f98ed6b514a","src/wasi.rs":"44ce56183380d18aedea9b7bec2edc5819=
e8529302c913bfe5d01f760155b82a","src/windows/gnu/align.rs":"b2c13ec1b9f3b39=
a75c452c80c951dff9d0215e31d77e883b4502afb31794647","src/windows/gnu/mod.rs"=
:"3c8c7edb7cdf5d0c44af936db2a94869585c69dfabeef30571b4f4e38375767a","src/wi=
ndows/mod.rs":"1cd9223293255b994814487e28d9979fb8ebef4538a236c1aa47fdc166a1=
49cc","src/windows/msvc/mod.rs":"c068271e00fca6b62bc4bf44bcf142cfc38caeded9=
b6c4e01d1ceef3ccf986f4","tests/const_fn.rs":"cb75a1f0864f926aebe79118fc34d5=
1a0d1ade2c20a394e7774c7e545f21f1f4"},"package":"fbe5e23404da5b4f555ef85ebed=
98fb4083e55a00c317800bc2a50ede9f3d219"}
diff --git a/meta/recipes-gnome/librsvg/librsvg/0001-system-deps-src-lib.rs=
-do-not-probe-into-harcoded-li.patch b/meta/recipes-gnome/librsvg/librsvg/0=
001-system-deps-src-lib.rs-do-not-probe-into-harcoded-li.patch
index 849dd98c5f..9c9ec80c19 100644
--- a/meta/recipes-gnome/librsvg/librsvg/0001-system-deps-src-lib.rs-do-not=
-probe-into-harcoded-li.patch
+++ b/meta/recipes-gnome/librsvg/librsvg/0001-system-deps-src-lib.rs-do-not=
-probe-into-harcoded-li.patch
@@ -1,4 +1,4 @@
-From 6d1f0740b111e86e99dcaf0222f3d1d67d3bf1e6 Mon Sep 17 00:00:00 2001
+From c6d52d37c546ebaa5d794fd5bcfa1ca1fc249dc2 Mon Sep 17 00:00:00 2001
 From: Alexander Kanavin <alex@linutronix.de>
 Date: Tue, 21 Sep 2021 16:54:23 +0200
 Subject: [PATCH] system-deps/src/lib.rs: do not probe into harcoded list of
@@ -14,18 +14,18 @@ Signed-off-by: Alexander Kanavin <alex@linutronix.de>
  2 files changed, 2 insertions(+), 16 deletions(-)
=20
 diff --git a/vendor/system-deps/.cargo-checksum.json b/vendor/system-deps/=
.cargo-checksum.json
-index ecebb94..30d594e 100644
+index 725ee53..c3b8fe5 100644
 --- a/vendor/system-deps/.cargo-checksum.json
 +++ b/vendor/system-deps/.cargo-checksum.json
 @@ -1 +1 @@
--{"files":{"Cargo.toml":"56ab5070dc9019b039c5e9904bb466b0879c33a7f69dd030b=
97abab321b7cc04","LICENSE-APACHE":"a60eea817514531668d7e00765731449fe14d059=
d3249e0bc93b36de45f759f2","LICENSE-MIT":"23f18e03dc49df91622fe2a76176497404=
e46ced8a715d9d2b67a7446571cca3","README.md":"3fe7396637bf9233908f41c6001cfc=
b00a379225e06e36e508c8b3d7264a8aae","src/lib.rs":"015518f4337d80249d12c7e6c=
55e9063705a0b8805ebf46a445c89253edc5de0","src/metadata.rs":"4c8d6ac2c88646a=
5b97ecb50ed44b65e5b2865cce6897add85b29ca2ae08c2bb","src/test.rs":"1ec48d1e4=
43a0a4ac8035a2b60ff0321543aa2fa998fee72cf7762a936bf5f8c","src/tests/testano=
therlib.pc":"bb4fd942324e6d49ce3becd827aa5c948d1924ca6681904a3695c19b1424eb=
3c","src/tests/testdata.pc":"43f481e989c03674fed5ef78c6420b3f8d36a2ce001928=
d86c418d1844acd5e7","src/tests/testlib-2.0.pc":"152eb0c70c14c3d948118408f3d=
1fd3bb7531b02aa792db85bd957f7db90b45b","src/tests/testlib-3.0.pc":"cd39c2ef=
88f6828c9291150cc4b624e769abef484674eaebaa4f67979501315f","src/tests/testli=
b.pc":"75c0d8a5345f65794f583c83e1cf0dbf3385af6e6abea1d61bb86eef707a52db","s=
rc/tests/toml-missing-file/no-cargo-toml-here":"6ab4da4b56f15315df6538610cf=
cd2ba3d0f9a7a8414678ff00ab5a78f7d41fa"},"package":"480c269f870722b3b08d2f13=
053ce0c2ab722839f472863c3e2d61ff3a1c2fa6"}
+-{"files":{"Cargo.toml":"3923d630403610a69f9943621bd13c1033944124acc96642e=
194064dc8b0554a","LICENSE-APACHE":"a60eea817514531668d7e00765731449fe14d059=
d3249e0bc93b36de45f759f2","LICENSE-MIT":"23f18e03dc49df91622fe2a76176497404=
e46ced8a715d9d2b67a7446571cca3","README.md":"3fe7396637bf9233908f41c6001cfc=
b00a379225e06e36e508c8b3d7264a8aae","src/lib.rs":"d5c73ae844b7b45704591676b=
c53699006bfbc51ca8e36f1ca346f40721469d4","src/metadata.rs":"657bc1b77e949e4=
800f9dd808790ffa535820e1658d412121a1da548e0cdd02c","src/test.rs":"d0684718d=
09789d6f74a21dd1ffaa169ddec7cd2d007ebb559cd1aba50d9301a","src/tests/lib/lib=
teststatic.a":"e3b0c44298fc1c149afbf4c8996fb92427ae41e4649b934ca495991b7852=
b855","src/tests/testanotherlib.pc":"bb4fd942324e6d49ce3becd827aa5c948d1924=
ca6681904a3695c19b1424eb3c","src/tests/testdata.pc":"43f481e989c03674fed5ef=
78c6420b3f8d36a2ce001928d86c418d1844acd5e7","src/tests/testlib-2.0.pc":"152=
eb0c70c14c3d948118408f3d1fd3bb7531b02aa792db85bd957f7db90b45b","src/tests/t=
estlib-3.0.pc":"cd39c2ef88f6828c9291150cc4b624e769abef484674eaebaa4f6797950=
1315f","src/tests/testlib.pc":"75c0d8a5345f65794f583c83e1cf0dbf3385af6e6abe=
a1d61bb86eef707a52db","src/tests/teststaticlib.pc":"77df23f6c7c1d47aff18453=
b47c87e53ec8a96017546e0a55c8c4d1e13b70134","src/tests/toml-missing-file/no-=
cargo-toml-here":"6ab4da4b56f15315df6538610cfcd2ba3d0f9a7a8414678ff00ab5a78=
f7d41fa"},"package":"7b1487aaddaacbc5d60a2a507ba1617c5ca66c57dd0dd07d0c5efd=
5b693841d4"}
 \ No newline at end of file
-+{"files":{"Cargo.toml":"56ab5070dc9019b039c5e9904bb466b0879c33a7f69dd030b=
97abab321b7cc04","LICENSE-APACHE":"a60eea817514531668d7e00765731449fe14d059=
d3249e0bc93b36de45f759f2","LICENSE-MIT":"23f18e03dc49df91622fe2a76176497404=
e46ced8a715d9d2b67a7446571cca3","README.md":"3fe7396637bf9233908f41c6001cfc=
b00a379225e06e36e508c8b3d7264a8aae","src/lib.rs":"594e5f14180590adc9ea0a8ba=
1cc35f9a8a260322d08de3037efac3ce1dc729b","src/metadata.rs":"4c8d6ac2c88646a=
5b97ecb50ed44b65e5b2865cce6897add85b29ca2ae08c2bb","src/test.rs":"1ec48d1e4=
43a0a4ac8035a2b60ff0321543aa2fa998fee72cf7762a936bf5f8c","src/tests/testano=
therlib.pc":"bb4fd942324e6d49ce3becd827aa5c948d1924ca6681904a3695c19b1424eb=
3c","src/tests/testdata.pc":"43f481e989c03674fed5ef78c6420b3f8d36a2ce001928=
d86c418d1844acd5e7","src/tests/testlib-2.0.pc":"152eb0c70c14c3d948118408f3d=
1fd3bb7531b02aa792db85bd957f7db90b45b","src/tests/testlib-3.0.pc":"cd39c2ef=
88f6828c9291150cc4b624e769abef484674eaebaa4f67979501315f","src/tests/testli=
b.pc":"75c0d8a5345f65794f583c83e1cf0dbf3385af6e6abea1d61bb86eef707a52db","s=
rc/tests/toml-missing-file/no-cargo-toml-here":"6ab4da4b56f15315df6538610cf=
cd2ba3d0f9a7a8414678ff00ab5a78f7d41fa"},"package":"480c269f870722b3b08d2f13=
053ce0c2ab722839f472863c3e2d61ff3a1c2fa6"}
++{"files":{"Cargo.toml":"3923d630403610a69f9943621bd13c1033944124acc96642e=
194064dc8b0554a","LICENSE-APACHE":"a60eea817514531668d7e00765731449fe14d059=
d3249e0bc93b36de45f759f2","LICENSE-MIT":"23f18e03dc49df91622fe2a76176497404=
e46ced8a715d9d2b67a7446571cca3","README.md":"3fe7396637bf9233908f41c6001cfc=
b00a379225e06e36e508c8b3d7264a8aae","src/lib.rs":"b822a9360e8f10930d48a27ce=
3ddb7e0ba3cbc5fb2054131ea9bdf55b1a45204","src/metadata.rs":"657bc1b77e949e4=
800f9dd808790ffa535820e1658d412121a1da548e0cdd02c","src/test.rs":"d0684718d=
09789d6f74a21dd1ffaa169ddec7cd2d007ebb559cd1aba50d9301a","src/tests/lib/lib=
teststatic.a":"e3b0c44298fc1c149afbf4c8996fb92427ae41e4649b934ca495991b7852=
b855","src/tests/testanotherlib.pc":"bb4fd942324e6d49ce3becd827aa5c948d1924=
ca6681904a3695c19b1424eb3c","src/tests/testdata.pc":"43f481e989c03674fed5ef=
78c6420b3f8d36a2ce001928d86c418d1844acd5e7","src/tests/testlib-2.0.pc":"152=
eb0c70c14c3d948118408f3d1fd3bb7531b02aa792db85bd957f7db90b45b","src/tests/t=
estlib-3.0.pc":"cd39c2ef88f6828c9291150cc4b624e769abef484674eaebaa4f6797950=
1315f","src/tests/testlib.pc":"75c0d8a5345f65794f583c83e1cf0dbf3385af6e6abe=
a1d61bb86eef707a52db","src/tests/teststaticlib.pc":"77df23f6c7c1d47aff18453=
b47c87e53ec8a96017546e0a55c8c4d1e13b70134","src/tests/toml-missing-file/no-=
cargo-toml-here":"6ab4da4b56f15315df6538610cfcd2ba3d0f9a7a8414678ff00ab5a78=
f7d41fa"},"package":"7b1487aaddaacbc5d60a2a507ba1617c5ca66c57dd0dd07d0c5efd=
5b693841d4"}
 diff --git a/vendor/system-deps/src/lib.rs b/vendor/system-deps/src/lib.rs
-index a0d4f00..a666817 100644
+index be919e2..97536a3 100644
 --- a/vendor/system-deps/src/lib.rs
 +++ b/vendor/system-deps/src/lib.rs
-@@ -725,21 +725,7 @@ impl Config {
+@@ -805,21 +805,7 @@ impl Config {
      }
=20=20
      fn check_cfg(&self, cfg: &cfg_expr::Expression) -> Result<bool, Error=
> {
diff --git a/meta/recipes-gnome/librsvg/librsvg/0001-vendor-system-deps-sor=
t-dependencies-before-using-th.patch b/meta/recipes-gnome/librsvg/librsvg/0=
001-vendor-system-deps-sort-dependencies-before-using-th.patch
deleted file mode 100644
index 21565c8faa..0000000000
--- a/meta/recipes-gnome/librsvg/librsvg/0001-vendor-system-deps-sort-depen=
dencies-before-using-th.patch
+++ /dev/null
@@ -1,50 +0,0 @@
-From 9c20757ef8055535579ca3b7e69834e6917200e2 Mon Sep 17 00:00:00 2001
-From: Alexander Kanavin <alex@linutronix.de>
-Date: Fri, 24 Sep 2021 16:20:40 +0200
-Subject: [PATCH] vendor/system-deps: sort dependencies before using them
-
-Otherwise they come out in non-reproducible order, leaking into
-target binaries.
-
-Upstream-Status: Submitted [https://github.com/gdesmott/system-deps/pull/5=
6]
-Signed-off-by: Alexander Kanavin <alex@linutronix.de>
----
- vendor/system-deps/.cargo-checksum.json | 3 ++-
- vendor/system-deps/src/lib.rs           | 6 +++---
- 2 files changed, 5 insertions(+), 4 deletions(-)
-
-diff --git a/vendor/system-deps/.cargo-checksum.json b/vendor/system-deps/=
.cargo-checksum.json
-index aae6cb9..73155dc 100644
---- a/vendor/system-deps/.cargo-checksum.json
-+++ b/vendor/system-deps/.cargo-checksum.json
-@@ -1 +1,2 @@
--{"files":{"Cargo.toml":"56ab5070dc9019b039c5e9904bb466b0879c33a7f69dd030b=
97abab321b7cc04","LICENSE-APACHE":"a60eea817514531668d7e00765731449fe14d059=
d3249e0bc93b36de45f759f2","LICENSE-MIT":"23f18e03dc49df91622fe2a76176497404=
e46ced8a715d9d2b67a7446571cca3","README.md":"3fe7396637bf9233908f41c6001cfc=
b00a379225e06e36e508c8b3d7264a8aae","src/lib.rs":"594e5f14180590adc9ea0a8ba=
1cc35f9a8a260322d08de3037efac3ce1dc729b","src/metadata.rs":"4c8d6ac2c88646a=
5b97ecb50ed44b65e5b2865cce6897add85b29ca2ae08c2bb","src/test.rs":"1ec48d1e4=
43a0a4ac8035a2b60ff0321543aa2fa998fee72cf7762a936bf5f8c","src/tests/testano=
therlib.pc":"bb4fd942324e6d49ce3becd827aa5c948d1924ca6681904a3695c19b1424eb=
3c","src/tests/testdata.pc":"43f481e989c03674fed5ef78c6420b3f8d36a2ce001928=
d86c418d1844acd5e7","src/tests/testlib-2.0.pc":"152eb0c70c14c3d948118408f3d=
1fd3bb7531b02aa792db85bd957f7db90b45b","src/tests/testlib-3.0.pc":"cd39c2ef=
88f6828c9291150cc4b624e769abef484674eaebaa4f67979501315f","src/tests/testli=
b.pc":"75c0d8a5345f65794f583c83e1cf0dbf3385af6e6abea1d61bb86eef707a52db","s=
rc/tests/toml-missing-file/no-cargo-toml-here":"6ab4da4b56f15315df6538610cf=
cd2ba3d0f9a7a8414678ff00ab5a78f7d41fa"},"package":"480c269f870722b3b08d2f13=
053ce0c2ab722839f472863c3e2d61ff3a1c2fa6"}
-+{"files":{"Cargo.toml":"56ab5070dc9019b039c5e9904bb466b0879c33a7f69dd030b=
97abab321b7cc04","LICENSE-APACHE":"a60eea817514531668d7e00765731449fe14d059=
d3249e0bc93b36de45f759f2","LICENSE-MIT":"23f18e03dc49df91622fe2a76176497404=
e46ced8a715d9d2b67a7446571cca3","README.md":"3fe7396637bf9233908f41c6001cfc=
b00a379225e06e36e508c8b3d7264a8aae",
-+"src/lib.rs":"d88593afdcb0cc3765bf427913ebb718ac6dcd9d62d1381d9afe44dddef=
3abbf","src/metadata.rs":"4c8d6ac2c88646a5b97ecb50ed44b65e5b2865cce6897add8=
5b29ca2ae08c2bb","src/test.rs":"1ec48d1e443a0a4ac8035a2b60ff0321543aa2fa998=
fee72cf7762a936bf5f8c","src/tests/testanotherlib.pc":"bb4fd942324e6d49ce3be=
cd827aa5c948d1924ca6681904a3695c19b1424eb3c","src/tests/testdata.pc":"43f48=
1e989c03674fed5ef78c6420b3f8d36a2ce001928d86c418d1844acd5e7","src/tests/tes=
tlib-2.0.pc":"152eb0c70c14c3d948118408f3d1fd3bb7531b02aa792db85bd957f7db90b=
45b","src/tests/testlib-3.0.pc":"cd39c2ef88f6828c9291150cc4b624e769abef4846=
74eaebaa4f67979501315f","src/tests/testlib.pc":"75c0d8a5345f65794f583c83e1c=
f0dbf3385af6e6abea1d61bb86eef707a52db","src/tests/toml-missing-file/no-carg=
o-toml-here":"6ab4da4b56f15315df6538610cfcd2ba3d0f9a7a8414678ff00ab5a78f7d4=
1fa"},"package":"480c269f870722b3b08d2f13053ce0c2ab722839f472863c3e2d61ff3a=
1c2fa6"}
-diff --git a/vendor/system-deps/src/lib.rs b/vendor/system-deps/src/lib.rs
-index af14348..5f0682e 100644
---- a/vendor/system-deps/src/lib.rs
-+++ b/vendor/system-deps/src/lib.rs
-@@ -242,11 +242,11 @@ impl Dependencies {
-         self.libs.get(name)
-     }
-=20
--    /// An iterator visiting all system dependencies in arbitrary order.
-+    /// An iterator visiting all system dependencies in sorted (for build=
 reproducibility) order.
-     /// The first element of the tuple is the name of the `toml` key defi=
ning the
-     /// dependency in `Cargo.toml`.
-     pub fn iter(&self) -> impl Iterator<Item =3D (&str, &Library)> {
--        self.libs.iter().map(|(k, v)| (k.as_str(), v))
-+        self.libs.iter().map(|(k, v)| (k.as_str(), v)).sorted_by_key(|x| =
x.0)
-     }
-=20
-     fn aggregate_str<F: Fn(&Library) -> &Vec<String>>(
-@@ -338,7 +338,7 @@ impl Dependencies {
-         let mut flags =3D BuildFlags::new();
-         let mut include_paths =3D Vec::new();
-=20
--        for (name, lib) in self.libs.iter() {
-+        for (name, lib) in self.libs.iter().sorted_by_key(|x| x.0) {
-             include_paths.extend(lib.include_paths.clone());
-=20
-             if lib.source =3D=3D Source::EnvVariables
diff --git a/meta/recipes-gnome/librsvg/librsvg/0005-Add-base-definitions-f=
or-riscv64-musl-libc-0.2.93.patch b/meta/recipes-gnome/librsvg/librsvg/0005=
-Add-base-definitions-for-riscv64-musl-libc-0.2.93.patch
deleted file mode 100644
index f47ebd586b..0000000000
--- a/meta/recipes-gnome/librsvg/librsvg/0005-Add-base-definitions-for-risc=
v64-musl-libc-0.2.93.patch
+++ /dev/null
@@ -1,898 +0,0 @@
-From 4e188d047dee33a19902113a3c90cdf1d8310a9e Mon Sep 17 00:00:00 2001
-From: Ralf Anton Beier <ralf_beier@me.com>
-Date: Sun, 8 Aug 2021 11:05:06 +0200
-Subject: [PATCH 5/8] Add base definitions for riscv64 + musl - libc-0.2.93
-
-https://github.com/rust-lang/libc/pull/1994/commits/030a07761f61f3293d5375=
2e60edbd330a9d718d
-
-Upstream-Status: Submitted [https://github.com/rust-lang/libc/pull/2537]
-Signed-off-by: Khem Raj <raj.khem@gmail.com>
-Signed-off-by: Ralf Anton Beier <ralf_beier@me.com>
----
- .../src/unix/linux_like/linux/musl/b64/mod.rs |   3 +
- .../linux_like/linux/musl/b64/riscv64/mod.rs  | 867 ++++++++++++++++++
- 2 files changed, 870 insertions(+)
- create mode 100644 vendor/libc-0.2.93/src/unix/linux_like/linux/musl/b64/=
riscv64/mod.rs
-
---- a/vendor/libc/src/unix/linux_like/linux/musl/b64/mod.rs
-+++ b/vendor/libc/src/unix/linux_like/linux/musl/b64/mod.rs
-@@ -163,6 +163,9 @@ cfg_if! {
-     } else if #[cfg(any(target_arch =3D "x86_64"))] {
-         mod x86_64;
-         pub use self::x86_64::*;
-+    } else if #[cfg(any(target_arch =3D "riscv64"))] {
-+        mod riscv64;
-+        pub use self::riscv64::*;
-     } else {
-         // Unknown target_arch
-     }
---- /dev/null
-+++ b/vendor/libc/src/unix/linux_like/linux/musl/b64/riscv64/mod.rs
-@@ -0,0 +1,867 @@
-+//! RISC-V-specific definitions for 64-bit linux-like values
-+
-+pub type c_char =3D u8;
-+pub type c_long =3D i64;
-+pub type c_ulong =3D u64;
-+pub type wchar_t =3D ::c_int;
-+
-+pub type nlink_t =3D ::c_uint;
-+pub type blksize_t =3D ::c_int;
-+pub type fsblkcnt64_t =3D ::c_ulong;
-+pub type fsfilcnt64_t =3D ::c_ulong;
-+pub type suseconds_t =3D i64;
-+pub type __u64 =3D ::c_ulonglong;
-+
-+s! {
-+    pub struct pthread_attr_t {
-+        __size: [::c_ulong; 7],
-+    }
-+
-+    pub struct stat {
-+        pub st_dev: ::dev_t,
-+        pub st_ino: ::ino_t,
-+        pub st_mode: ::mode_t,
-+        pub st_nlink: ::nlink_t,
-+        pub st_uid: ::uid_t,
-+        pub st_gid: ::gid_t,
-+        pub st_rdev: ::dev_t,
-+        pub __pad1: ::dev_t,
-+        pub st_size: ::off_t,
-+        pub st_blksize: ::blksize_t,
-+        pub __pad2: ::c_int,
-+        pub st_blocks: ::blkcnt_t,
-+        pub st_atime: ::time_t,
-+        pub st_atime_nsec: ::c_long,
-+        pub st_mtime: ::time_t,
-+        pub st_mtime_nsec: ::c_long,
-+        pub st_ctime: ::time_t,
-+        pub st_ctime_nsec: ::c_long,
-+        __unused: [::c_int; 2usize],
-+    }
-+
-+    pub struct stat64 {
-+        pub st_dev: ::dev_t,
-+        pub st_ino: ::ino64_t,
-+        pub st_mode: ::mode_t,
-+        pub st_nlink: ::nlink_t,
-+        pub st_uid: ::uid_t,
-+        pub st_gid: ::gid_t,
-+        pub st_rdev: ::dev_t,
-+        pub __pad1: ::dev_t,
-+        pub st_size: ::off64_t,
-+        pub st_blksize: ::blksize_t,
-+        pub __pad2: ::c_int,
-+        pub st_blocks: ::blkcnt_t,
-+        pub st_atime: ::time_t,
-+        pub st_atime_nsec: ::c_long,
-+        pub st_mtime: ::time_t,
-+        pub st_mtime_nsec: ::c_long,
-+        pub st_ctime: ::time_t,
-+        pub st_ctime_nsec: ::c_long,
-+        __unused: [::c_int; 2],
-+    }
-+
-+    pub struct statfs {
-+        pub f_type: ::c_long,
-+        pub f_bsize: ::c_long,
-+        pub f_blocks: ::fsblkcnt_t,
-+        pub f_bfree: ::fsblkcnt_t,
-+        pub f_bavail: ::fsblkcnt_t,
-+        pub f_files: ::fsfilcnt_t,
-+        pub f_ffree: ::fsfilcnt_t,
-+        pub f_fsid: ::fsid_t,
-+        pub f_namelen: ::c_long,
-+        pub f_frsize: ::c_long,
-+        pub f_flags: ::c_long,
-+        pub f_spare: [::c_long; 4],
-+    }
-+
-+    pub struct statfs64 {
-+        pub f_type: ::c_long,
-+        pub f_bsize: ::c_long,
-+        pub f_blocks: ::fsblkcnt64_t,
-+        pub f_bfree: ::fsblkcnt64_t,
-+        pub f_bavail: ::fsblkcnt64_t,
-+        pub f_files: ::fsfilcnt64_t,
-+        pub f_ffree: ::fsfilcnt64_t,
-+        pub f_fsid: ::fsid_t,
-+        pub f_namelen: ::c_long,
-+        pub f_frsize: ::c_long,
-+        pub f_flags: ::c_long,
-+        pub f_spare: [::c_long; 4],
-+    }
-+
-+    pub struct statvfs {
-+        pub f_bsize: ::c_ulong,
-+        pub f_frsize: ::c_ulong,
-+        pub f_blocks: ::fsblkcnt_t,
-+        pub f_bfree: ::fsblkcnt_t,
-+        pub f_bavail: ::fsblkcnt_t,
-+        pub f_files: ::fsfilcnt_t,
-+        pub f_ffree: ::fsfilcnt_t,
-+        pub f_favail: ::fsfilcnt_t,
-+        pub f_fsid: ::c_ulong,
-+        pub f_flag: ::c_ulong,
-+        pub f_namemax: ::c_ulong,
-+        pub __f_spare: [::c_int; 6],
-+    }
-+
-+    pub struct statvfs64 {
-+        pub f_bsize: ::c_ulong,
-+        pub f_frsize: ::c_ulong,
-+        pub f_blocks: ::fsblkcnt64_t,
-+        pub f_bfree: ::fsblkcnt64_t,
-+        pub f_bavail: ::fsblkcnt64_t,
-+        pub f_files: ::fsfilcnt64_t,
-+        pub f_ffree: ::fsfilcnt64_t,
-+        pub f_favail: ::fsfilcnt64_t,
-+        pub f_fsid: ::c_ulong,
-+        pub f_flag: ::c_ulong,
-+        pub f_namemax: ::c_ulong,
-+        pub __f_spare: [::c_int; 6],
-+    }
-+
-+    pub struct siginfo_t {
-+        pub si_signo: ::c_int,
-+        pub si_errno: ::c_int,
-+        pub si_code: ::c_int,
-+        #[doc(hidden)]
-+        #[deprecated(
-+            since=3D"0.2.54",
-+            note=3D"Please leave a comment on \
-+                  https://github.com/rust-lang/libc/pull/1316 if you're u=
sing \
-+                  this field"
-+        )]
-+        pub _pad: [::c_int; 29],
-+        _align: [u64; 0],
-+    }
-+
-+    pub struct stack_t {
-+        pub ss_sp: *mut ::c_void,
-+        pub ss_flags: ::c_int,
-+        pub ss_size: ::size_t,
-+    }
-+
-+    pub struct sigaction {
-+        pub sa_sigaction: ::sighandler_t,
-+        pub sa_mask: ::sigset_t,
-+        pub sa_flags: ::c_int,
-+        pub sa_restorer: ::Option<unsafe extern "C" fn()>,
-+    }
-+
-+    pub struct ipc_perm {
-+        pub __key: ::key_t,
-+        pub uid: ::uid_t,
-+        pub gid: ::gid_t,
-+        pub cuid: ::uid_t,
-+        pub cgid: ::gid_t,
-+        pub mode: ::c_ushort,
-+        __pad1: ::c_ushort,
-+        pub __seq: ::c_ushort,
-+        __pad2: ::c_ushort,
-+        __unused1: ::c_ulong,
-+        __unused2: ::c_ulong,
-+    }
-+
-+    pub struct shmid_ds {
-+        pub shm_perm: ::ipc_perm,
-+        pub shm_segsz: ::size_t,
-+        pub shm_atime: ::time_t,
-+        pub shm_dtime: ::time_t,
-+        pub shm_ctime: ::time_t,
-+        pub shm_cpid: ::pid_t,
-+        pub shm_lpid: ::pid_t,
-+        pub shm_nattch: ::shmatt_t,
-+        __unused5: ::c_ulong,
-+        __unused6: ::c_ulong,
-+    }
-+
-+    pub struct flock {
-+        pub l_type: ::c_short,
-+        pub l_whence: ::c_short,
-+        pub l_start: ::off_t,
-+        pub l_len: ::off_t,
-+        pub l_pid: ::pid_t,
-+    }
-+
-+    pub struct flock64 {
-+        pub l_type: ::c_short,
-+        pub l_whence: ::c_short,
-+        pub l_start: ::off64_t,
-+        pub l_len: ::off64_t,
-+        pub l_pid: ::pid_t,
-+    }
-+
-+    pub struct ip_mreqn {
-+        pub imr_multiaddr: ::in_addr,
-+        pub imr_address: ::in_addr,
-+        pub imr_ifindex: ::c_int,
-+    }
-+}
-+
-+pub const POSIX_FADV_DONTNEED: ::c_int =3D 4;
-+pub const POSIX_FADV_NOREUSE: ::c_int =3D 5;
-+pub const VEOF: usize =3D 4;
-+pub const RTLD_DEEPBIND: ::c_int =3D 0x8;
-+pub const RTLD_GLOBAL: ::c_int =3D 0x100;
-+pub const RTLD_NOLOAD: ::c_int =3D 0x4;
-+pub const TIOCGSOFTCAR: ::c_ulong =3D 21529;
-+pub const TIOCSSOFTCAR: ::c_ulong =3D 21530;
-+pub const TIOCGRS485: ::c_int =3D 21550;
-+pub const TIOCSRS485: ::c_int =3D 21551;
-+pub const RLIMIT_RSS: ::__rlimit_resource_t =3D 5;
-+pub const RLIMIT_AS: ::__rlimit_resource_t =3D 9;
-+pub const RLIMIT_MEMLOCK: ::__rlimit_resource_t =3D 8;
-+pub const RLIMIT_NOFILE: ::__rlimit_resource_t =3D 7;
-+pub const RLIMIT_NPROC: ::__rlimit_resource_t =3D 6;
-+pub const O_APPEND: ::c_int =3D 1024;
-+pub const O_CREAT: ::c_int =3D 64;
-+pub const O_EXCL: ::c_int =3D 128;
-+pub const O_NOCTTY: ::c_int =3D 256;
-+pub const O_NONBLOCK: ::c_int =3D 2048;
-+pub const O_SYNC: ::c_int =3D 1052672;
-+pub const O_RSYNC: ::c_int =3D 1052672;
-+pub const O_DSYNC: ::c_int =3D 4096;
-+pub const O_FSYNC: ::c_int =3D 1052672;
-+pub const O_NOATIME: ::c_int =3D 262144;
-+pub const O_PATH: ::c_int =3D 2097152;
-+pub const O_TMPFILE: ::c_int =3D 4259840;
-+pub const MAP_GROWSDOWN: ::c_int =3D 256;
-+pub const EDEADLK: ::c_int =3D 35;
-+pub const ENAMETOOLONG: ::c_int =3D 36;
-+pub const ENOLCK: ::c_int =3D 37;
-+pub const ENOSYS: ::c_int =3D 38;
-+pub const ENOTEMPTY: ::c_int =3D 39;
-+pub const ELOOP: ::c_int =3D 40;
-+pub const ENOMSG: ::c_int =3D 42;
-+pub const EIDRM: ::c_int =3D 43;
-+pub const ECHRNG: ::c_int =3D 44;
-+pub const EL2NSYNC: ::c_int =3D 45;
-+pub const EL3HLT: ::c_int =3D 46;
-+pub const EL3RST: ::c_int =3D 47;
-+pub const ELNRNG: ::c_int =3D 48;
-+pub const EUNATCH: ::c_int =3D 49;
-+pub const ENOCSI: ::c_int =3D 50;
-+pub const EL2HLT: ::c_int =3D 51;
-+pub const EBADE: ::c_int =3D 52;
-+pub const EBADR: ::c_int =3D 53;
-+pub const EXFULL: ::c_int =3D 54;
-+pub const ENOANO: ::c_int =3D 55;
-+pub const EBADRQC: ::c_int =3D 56;
-+pub const EBADSLT: ::c_int =3D 57;
-+pub const EMULTIHOP: ::c_int =3D 72;
-+pub const EOVERFLOW: ::c_int =3D 75;
-+pub const ENOTUNIQ: ::c_int =3D 76;
-+pub const EBADFD: ::c_int =3D 77;
-+pub const EBADMSG: ::c_int =3D 74;
-+pub const EREMCHG: ::c_int =3D 78;
-+pub const ELIBACC: ::c_int =3D 79;
-+pub const ELIBBAD: ::c_int =3D 80;
-+pub const ELIBSCN: ::c_int =3D 81;
-+pub const ELIBMAX: ::c_int =3D 82;
-+pub const ELIBEXEC: ::c_int =3D 83;
-+pub const EILSEQ: ::c_int =3D 84;
-+pub const ERESTART: ::c_int =3D 85;
-+pub const ESTRPIPE: ::c_int =3D 86;
-+pub const EUSERS: ::c_int =3D 87;
-+pub const ENOTSOCK: ::c_int =3D 88;
-+pub const EDESTADDRREQ: ::c_int =3D 89;
-+pub const EMSGSIZE: ::c_int =3D 90;
-+pub const EPROTOTYPE: ::c_int =3D 91;
-+pub const ENOPROTOOPT: ::c_int =3D 92;
-+pub const EPROTONOSUPPORT: ::c_int =3D 93;
-+pub const ESOCKTNOSUPPORT: ::c_int =3D 94;
-+pub const EOPNOTSUPP: ::c_int =3D 95;
-+pub const EPFNOSUPPORT: ::c_int =3D 96;
-+pub const EAFNOSUPPORT: ::c_int =3D 97;
-+pub const EADDRINUSE: ::c_int =3D 98;
-+pub const EADDRNOTAVAIL: ::c_int =3D 99;
-+pub const ENETDOWN: ::c_int =3D 100;
-+pub const ENETUNREACH: ::c_int =3D 101;
-+pub const ENETRESET: ::c_int =3D 102;
-+pub const ECONNABORTED: ::c_int =3D 103;
-+pub const ECONNRESET: ::c_int =3D 104;
-+pub const ENOBUFS: ::c_int =3D 105;
-+pub const EISCONN: ::c_int =3D 106;
-+pub const ENOTCONN: ::c_int =3D 107;
-+pub const ESHUTDOWN: ::c_int =3D 108;
-+pub const ETOOMANYREFS: ::c_int =3D 109;
-+pub const ETIMEDOUT: ::c_int =3D 110;
-+pub const ECONNREFUSED: ::c_int =3D 111;
-+pub const EHOSTDOWN: ::c_int =3D 112;
-+pub const EHOSTUNREACH: ::c_int =3D 113;
-+pub const EALREADY: ::c_int =3D 114;
-+pub const EINPROGRESS: ::c_int =3D 115;
-+pub const ESTALE: ::c_int =3D 116;
-+pub const EDQUOT: ::c_int =3D 122;
-+pub const ENOMEDIUM: ::c_int =3D 123;
-+pub const EMEDIUMTYPE: ::c_int =3D 124;
-+pub const ECANCELED: ::c_int =3D 125;
-+pub const ENOKEY: ::c_int =3D 126;
-+pub const EKEYEXPIRED: ::c_int =3D 127;
-+pub const EKEYREVOKED: ::c_int =3D 128;
-+pub const EKEYREJECTED: ::c_int =3D 129;
-+pub const EOWNERDEAD: ::c_int =3D 130;
-+pub const ENOTRECOVERABLE: ::c_int =3D 131;
-+pub const EHWPOISON: ::c_int =3D 133;
-+pub const ERFKILL: ::c_int =3D 132;
-+pub const SOL_SOCKET: ::c_int =3D 1;
-+pub const SO_REUSEADDR: ::c_int =3D 2;
-+pub const SO_TYPE: ::c_int =3D 3;
-+pub const SO_ERROR: ::c_int =3D 4;
-+pub const SO_DONTROUTE: ::c_int =3D 5;
-+pub const SO_BROADCAST: ::c_int =3D 6;
-+pub const SO_SNDBUF: ::c_int =3D 7;
-+pub const SO_RCVBUF: ::c_int =3D 8;
-+pub const SO_SNDBUFFORCE: ::c_int =3D 32;
-+pub const SO_RCVBUFFORCE: ::c_int =3D 33;
-+pub const SO_KEEPALIVE: ::c_int =3D 9;
-+pub const SO_OOBINLINE: ::c_int =3D 10;
-+pub const SO_NO_CHECK: ::c_int =3D 11;
-+pub const SO_PRIORITY: ::c_int =3D 12;
-+pub const SO_LINGER: ::c_int =3D 13;
-+pub const SO_BSDCOMPAT: ::c_int =3D 14;
-+pub const SO_REUSEPORT: ::c_int =3D 15;
-+pub const SO_PASSCRED: ::c_int =3D 16;
-+pub const SO_PEERCRED: ::c_int =3D 17;
-+pub const SO_RCVLOWAT: ::c_int =3D 18;
-+pub const SO_SNDLOWAT: ::c_int =3D 19;
-+pub const SO_RCVTIMEO: ::c_int =3D 20;
-+pub const SO_SNDTIMEO: ::c_int =3D 21;
-+pub const SO_SECURITY_AUTHENTICATION: ::c_int =3D 22;
-+pub const SO_SECURITY_ENCRYPTION_TRANSPORT: ::c_int =3D 23;
-+pub const SO_SECURITY_ENCRYPTION_NETWORK: ::c_int =3D 24;
-+pub const SO_BINDTODEVICE: ::c_int =3D 25;
-+pub const SO_ATTACH_FILTER: ::c_int =3D 26;
-+pub const SO_DETACH_FILTER: ::c_int =3D 27;
-+pub const SO_GET_FILTER: ::c_int =3D 26;
-+pub const SO_PEERNAME: ::c_int =3D 28;
-+pub const SO_TIMESTAMP: ::c_int =3D 29;
-+pub const SO_ACCEPTCONN: ::c_int =3D 30;
-+pub const SO_PEERSEC: ::c_int =3D 31;
-+pub const SO_PASSSEC: ::c_int =3D 34;
-+pub const SO_TIMESTAMPNS: ::c_int =3D 35;
-+pub const SCM_TIMESTAMPNS: ::c_int =3D 35;
-+pub const SO_MARK: ::c_int =3D 36;
-+pub const SO_PROTOCOL: ::c_int =3D 38;
-+pub const SO_DOMAIN: ::c_int =3D 39;
-+pub const SO_RXQ_OVFL: ::c_int =3D 40;
-+pub const SO_WIFI_STATUS: ::c_int =3D 41;
-+pub const SCM_WIFI_STATUS: ::c_int =3D 41;
-+pub const SO_PEEK_OFF: ::c_int =3D 42;
-+pub const SO_NOFCS: ::c_int =3D 43;
-+pub const SO_LOCK_FILTER: ::c_int =3D 44;
-+pub const SO_SELECT_ERR_QUEUE: ::c_int =3D 45;
-+pub const SO_BUSY_POLL: ::c_int =3D 46;
-+pub const SO_MAX_PACING_RATE: ::c_int =3D 47;
-+pub const SO_BPF_EXTENSIONS: ::c_int =3D 48;
-+pub const SO_INCOMING_CPU: ::c_int =3D 49;
-+pub const SO_ATTACH_BPF: ::c_int =3D 50;
-+pub const SO_DETACH_BPF: ::c_int =3D 27;
-+pub const SOCK_STREAM: ::c_int =3D 1;
-+pub const SOCK_DGRAM: ::c_int =3D 2;
-+pub const SA_ONSTACK: ::c_int =3D 134217728;
-+pub const SA_SIGINFO: ::c_int =3D 4;
-+pub const SA_NOCLDWAIT: ::c_int =3D 2;
-+pub const SIGTTIN: ::c_int =3D 21;
-+pub const SIGTTOU: ::c_int =3D 22;
-+pub const SIGXCPU: ::c_int =3D 24;
-+pub const SIGXFSZ: ::c_int =3D 25;
-+pub const SIGVTALRM: ::c_int =3D 26;
-+pub const SIGPROF: ::c_int =3D 27;
-+pub const SIGWINCH: ::c_int =3D 28;
-+pub const SIGCHLD: ::c_int =3D 17;
-+pub const SIGBUS: ::c_int =3D 7;
-+pub const SIGUSR1: ::c_int =3D 10;
-+pub const SIGUSR2: ::c_int =3D 12;
-+pub const SIGCONT: ::c_int =3D 18;
-+pub const SIGSTOP: ::c_int =3D 19;
-+pub const SIGTSTP: ::c_int =3D 20;
-+pub const SIGURG: ::c_int =3D 23;
-+pub const SIGIO: ::c_int =3D 29;
-+pub const SIGSYS: ::c_int =3D 31;
-+pub const SIGSTKFLT: ::c_int =3D 16;
-+pub const SIGPOLL: ::c_int =3D 29;
-+pub const SIGPWR: ::c_int =3D 30;
-+pub const SIG_SETMASK: ::c_int =3D 2;
-+pub const SIG_BLOCK: ::c_int =3D 0;
-+pub const SIG_UNBLOCK: ::c_int =3D 1;
-+pub const POLLWRNORM: ::c_short =3D 256;
-+pub const POLLWRBAND: ::c_short =3D 512;
-+pub const O_ASYNC: ::c_int =3D 8192;
-+pub const O_NDELAY: ::c_int =3D 2048;
-+pub const PTRACE_DETACH: ::c_uint =3D 17;
-+pub const EFD_NONBLOCK: ::c_int =3D 2048;
-+pub const F_GETLK: ::c_int =3D 5;
-+pub const F_GETOWN: ::c_int =3D 9;
-+pub const F_SETOWN: ::c_int =3D 8;
-+pub const F_SETLK: ::c_int =3D 6;
-+pub const F_SETLKW: ::c_int =3D 7;
-+pub const F_RDLCK: ::c_int =3D 0;
-+pub const F_WRLCK: ::c_int =3D 1;
-+pub const F_UNLCK: ::c_int =3D 2;
-+pub const F_OFD_GETLK: ::c_int =3D 36;
-+pub const F_OFD_SETLK: ::c_int =3D 37;
-+pub const F_OFD_SETLKW: ::c_int =3D 38;
-+pub const SFD_NONBLOCK: ::c_int =3D 2048;
-+pub const TCSANOW: ::c_int =3D 0;
-+pub const TCSADRAIN: ::c_int =3D 1;
-+pub const TCSAFLUSH: ::c_int =3D 2;
-+pub const TIOCLINUX: ::c_ulong =3D 21532;
-+pub const TIOCGSERIAL: ::c_ulong =3D 21534;
-+pub const TIOCEXCL: ::c_ulong =3D 21516;
-+pub const TIOCNXCL: ::c_ulong =3D 21517;
-+pub const TIOCSCTTY: ::c_ulong =3D 21518;
-+pub const TIOCSTI: ::c_ulong =3D 21522;
-+pub const TIOCMGET: ::c_ulong =3D 21525;
-+pub const TIOCMBIS: ::c_ulong =3D 21526;
-+pub const TIOCMBIC: ::c_ulong =3D 21527;
-+pub const TIOCMSET: ::c_ulong =3D 21528;
-+pub const TIOCCONS: ::c_ulong =3D 21533;
-+pub const TIOCM_ST: ::c_int =3D 8;
-+pub const TIOCM_SR: ::c_int =3D 16;
-+pub const TIOCM_CTS: ::c_int =3D 32;
-+pub const TIOCM_CAR: ::c_int =3D 64;
-+pub const TIOCM_RNG: ::c_int =3D 128;
-+pub const TIOCM_DSR: ::c_int =3D 256;
-+pub const SFD_CLOEXEC: ::c_int =3D 524288;
-+pub const NCCS: usize =3D 32;
-+pub const O_TRUNC: ::c_int =3D 512;
-+pub const O_CLOEXEC: ::c_int =3D 524288;
-+pub const EBFONT: ::c_int =3D 59;
-+pub const ENOSTR: ::c_int =3D 60;
-+pub const ENODATA: ::c_int =3D 61;
-+pub const ETIME: ::c_int =3D 62;
-+pub const ENOSR: ::c_int =3D 63;
-+pub const ENONET: ::c_int =3D 64;
-+pub const ENOPKG: ::c_int =3D 65;
-+pub const EREMOTE: ::c_int =3D 66;
-+pub const ENOLINK: ::c_int =3D 67;
-+pub const EADV: ::c_int =3D 68;
-+pub const ESRMNT: ::c_int =3D 69;
-+pub const ECOMM: ::c_int =3D 70;
-+pub const EPROTO: ::c_int =3D 71;
-+pub const EDOTDOT: ::c_int =3D 73;
-+pub const SA_NODEFER: ::c_int =3D 1073741824;
-+pub const SA_RESETHAND: ::c_int =3D -2147483648;
-+pub const SA_RESTART: ::c_int =3D 268435456;
-+pub const SA_NOCLDSTOP: ::c_int =3D 1;
-+pub const EPOLL_CLOEXEC: ::c_int =3D 524288;
-+pub const EFD_CLOEXEC: ::c_int =3D 524288;
-+pub const __SIZEOF_PTHREAD_CONDATTR_T: usize =3D 4;
-+pub const __SIZEOF_PTHREAD_MUTEXATTR_T: usize =3D 4;
-+pub const O_DIRECT: ::c_int =3D 16384;
-+pub const O_DIRECTORY: ::c_int =3D 65536;
-+pub const O_NOFOLLOW: ::c_int =3D 131072;
-+pub const MAP_HUGETLB: ::c_int =3D 262144;
-+pub const MAP_LOCKED: ::c_int =3D 8192;
-+pub const MAP_NORESERVE: ::c_int =3D 16384;
-+pub const MAP_ANON: ::c_int =3D 32;
-+pub const MAP_ANONYMOUS: ::c_int =3D 32;
-+pub const MAP_DENYWRITE: ::c_int =3D 2048;
-+pub const MAP_EXECUTABLE: ::c_int =3D 4096;
-+pub const MAP_POPULATE: ::c_int =3D 32768;
-+pub const MAP_NONBLOCK: ::c_int =3D 65536;
-+pub const MAP_STACK: ::c_int =3D 131072;
-+pub const MAP_SYNC : ::c_int =3D 0x080000;
-+pub const EDEADLOCK: ::c_int =3D 35;
-+pub const EUCLEAN: ::c_int =3D 117;
-+pub const ENOTNAM: ::c_int =3D 118;
-+pub const ENAVAIL: ::c_int =3D 119;
-+pub const EISNAM: ::c_int =3D 120;
-+pub const EREMOTEIO: ::c_int =3D 121;
-+pub const FIOCLEX: ::c_ulong =3D 21585;
-+pub const FIONCLEX: ::c_ulong =3D 21584;
-+pub const FIONBIO: ::c_ulong =3D 21537;
-+pub const MCL_CURRENT: ::c_int =3D 1;
-+pub const MCL_FUTURE: ::c_int =3D 2;
-+pub const SIGSTKSZ: ::size_t =3D 8192;
-+pub const MINSIGSTKSZ: ::size_t =3D 2048;
-+pub const CBAUD: ::tcflag_t =3D 4111;
-+pub const TAB1: ::tcflag_t =3D 2048;
-+pub const TAB2: ::tcflag_t =3D 4096;
-+pub const TAB3: ::tcflag_t =3D 6144;
-+pub const CR1: ::tcflag_t =3D 512;
-+pub const CR2: ::tcflag_t =3D 1024;
-+pub const CR3: ::tcflag_t =3D 1536;
-+pub const FF1: ::tcflag_t =3D 32768;
-+pub const BS1: ::tcflag_t =3D 8192;
-+pub const VT1: ::tcflag_t =3D 16384;
-+pub const VWERASE: usize =3D 14;
-+pub const VREPRINT: usize =3D 12;
-+pub const VSUSP: usize =3D 10;
-+pub const VSTART: usize =3D 8;
-+pub const VSTOP: usize =3D 9;
-+pub const VDISCARD: usize =3D 13;
-+pub const VTIME: usize =3D 5;
-+pub const IXON: ::tcflag_t =3D 1024;
-+pub const IXOFF: ::tcflag_t =3D 4096;
-+pub const ONLCR: ::tcflag_t =3D 4;
-+pub const CSIZE: ::tcflag_t =3D 48;
-+pub const CS6: ::tcflag_t =3D 16;
-+pub const CS7: ::tcflag_t =3D 32;
-+pub const CS8: ::tcflag_t =3D 48;
-+pub const CSTOPB: ::tcflag_t =3D 64;
-+pub const CREAD: ::tcflag_t =3D 128;
-+pub const PARENB: ::tcflag_t =3D 256;
-+pub const PARODD: ::tcflag_t =3D 512;
-+pub const HUPCL: ::tcflag_t =3D 1024;
-+pub const CLOCAL: ::tcflag_t =3D 2048;
-+pub const ECHOKE: ::tcflag_t =3D 2048;
-+pub const ECHOE: ::tcflag_t =3D 16;
-+pub const ECHOK: ::tcflag_t =3D 32;
-+pub const ECHONL: ::tcflag_t =3D 64;
-+pub const ECHOPRT: ::tcflag_t =3D 1024;
-+pub const ECHOCTL: ::tcflag_t =3D 512;
-+pub const ISIG: ::tcflag_t =3D 1;
-+pub const ICANON: ::tcflag_t =3D 2;
-+pub const PENDIN: ::tcflag_t =3D 16384;
-+pub const NOFLSH: ::tcflag_t =3D 128;
-+pub const CIBAUD: ::tcflag_t =3D 269418496;
-+pub const CBAUDEX: ::tcflag_t =3D 4096;
-+pub const VSWTC: usize =3D 7;
-+pub const OLCUC: ::tcflag_t =3D 2;
-+pub const NLDLY: ::tcflag_t =3D 256;
-+pub const CRDLY: ::tcflag_t =3D 1536;
-+pub const TABDLY: ::tcflag_t =3D 6144;
-+pub const BSDLY: ::tcflag_t =3D 8192;
-+pub const FFDLY: ::tcflag_t =3D 32768;
-+pub const VTDLY: ::tcflag_t =3D 16384;
-+pub const XTABS: ::tcflag_t =3D 6144;
-+pub const B0: ::speed_t =3D 0;
-+pub const B50: ::speed_t =3D 1;
-+pub const B75: ::speed_t =3D 2;
-+pub const B110: ::speed_t =3D 3;
-+pub const B134: ::speed_t =3D 4;
-+pub const B150: ::speed_t =3D 5;
-+pub const B200: ::speed_t =3D 6;
-+pub const B300: ::speed_t =3D 7;
-+pub const B600: ::speed_t =3D 8;
-+pub const B1200: ::speed_t =3D 9;
-+pub const B1800: ::speed_t =3D 10;
-+pub const B2400: ::speed_t =3D 11;
-+pub const B4800: ::speed_t =3D 12;
-+pub const B9600: ::speed_t =3D 13;
-+pub const B19200: ::speed_t =3D 14;
-+pub const B38400: ::speed_t =3D 15;
-+pub const EXTA: ::speed_t =3D 14;
-+pub const EXTB: ::speed_t =3D 15;
-+pub const B57600: ::speed_t =3D 4097;
-+pub const B115200: ::speed_t =3D 4098;
-+pub const B230400: ::speed_t =3D 4099;
-+pub const B460800: ::speed_t =3D 4100;
-+pub const B500000: ::speed_t =3D 4101;
-+pub const B576000: ::speed_t =3D 4102;
-+pub const B921600: ::speed_t =3D 4103;
-+pub const B1000000: ::speed_t =3D 4104;
-+pub const B1152000: ::speed_t =3D 4105;
-+pub const B1500000: ::speed_t =3D 4106;
-+pub const B2000000: ::speed_t =3D 4107;
-+pub const B2500000: ::speed_t =3D 4108;
-+pub const B3000000: ::speed_t =3D 4109;
-+pub const B3500000: ::speed_t =3D 4110;
-+pub const B4000000: ::speed_t =3D 4111;
-+pub const VEOL: usize =3D 11;
-+pub const VEOL2: usize =3D 16;
-+pub const VMIN: usize =3D 6;
-+pub const IEXTEN: ::tcflag_t =3D 32768;
-+pub const TOSTOP: ::tcflag_t =3D 256;
-+pub const FLUSHO: ::tcflag_t =3D 4096;
-+pub const EXTPROC: ::tcflag_t =3D 65536;
-+pub const TCGETS: ::c_ulong =3D 21505;
-+pub const TCSETS: ::c_ulong =3D 21506;
-+pub const TCSETSW: ::c_ulong =3D 21507;
-+pub const TCSETSF: ::c_ulong =3D 21508;
-+pub const TCGETA: ::c_ulong =3D 21509;
-+pub const TCSETA: ::c_ulong =3D 21510;
-+pub const TCSETAW: ::c_ulong =3D 21511;
-+pub const TCSETAF: ::c_ulong =3D 21512;
-+pub const TCSBRK: ::c_ulong =3D 21513;
-+pub const TCXONC: ::c_ulong =3D 21514;
-+pub const TCFLSH: ::c_ulong =3D 21515;
-+pub const TIOCINQ: ::c_ulong =3D 21531;
-+pub const TIOCGPGRP: ::c_ulong =3D 21519;
-+pub const TIOCSPGRP: ::c_ulong =3D 21520;
-+pub const TIOCOUTQ: ::c_ulong =3D 21521;
-+pub const TIOCGWINSZ: ::c_ulong =3D 21523;
-+pub const TIOCSWINSZ: ::c_ulong =3D 21524;
-+pub const FIONREAD: ::c_ulong =3D 21531;
-+pub const __SIZEOF_PTHREAD_MUTEX_T: usize =3D 40;
-+pub const __SIZEOF_PTHREAD_RWLOCK_T: usize =3D 56;
-+pub const SYS_read: ::c_long =3D 63;
-+pub const SYS_write: ::c_long =3D 64;
-+pub const SYS_close: ::c_long =3D 57;
-+pub const SYS_fstat: ::c_long =3D 80;
-+pub const SYS_lseek: ::c_long =3D 62;
-+pub const SYS_mmap: ::c_long =3D 222;
-+pub const SYS_mprotect: ::c_long =3D 226;
-+pub const SYS_munmap: ::c_long =3D 215;
-+pub const SYS_brk: ::c_long =3D 214;
-+pub const SYS_rt_sigaction: ::c_long =3D 134;
-+pub const SYS_rt_sigprocmask: ::c_long =3D 135;
-+pub const SYS_rt_sigreturn: ::c_long =3D 139;
-+pub const SYS_ioctl: ::c_long =3D 29;
-+pub const SYS_pread64: ::c_long =3D 67;
-+pub const SYS_pwrite64: ::c_long =3D 68;
-+pub const SYS_readv: ::c_long =3D 65;
-+pub const SYS_writev: ::c_long =3D 66;
-+pub const SYS_sched_yield: ::c_long =3D 124;
-+pub const SYS_mremap: ::c_long =3D 216;
-+pub const SYS_msync: ::c_long =3D 227;
-+pub const SYS_mincore: ::c_long =3D 232;
-+pub const SYS_madvise: ::c_long =3D 233;
-+pub const SYS_shmget: ::c_long =3D 194;
-+pub const SYS_shmat: ::c_long =3D 196;
-+pub const SYS_shmctl: ::c_long =3D 195;
-+pub const SYS_dup: ::c_long =3D 23;
-+pub const SYS_nanosleep: ::c_long =3D 101;
-+pub const SYS_getitimer: ::c_long =3D 102;
-+pub const SYS_setitimer: ::c_long =3D 103;
-+pub const SYS_getpid: ::c_long =3D 172;
-+pub const SYS_sendfile: ::c_long =3D 71;
-+pub const SYS_socket: ::c_long =3D 198;
-+pub const SYS_connect: ::c_long =3D 203;
-+pub const SYS_accept: ::c_long =3D 202;
-+pub const SYS_sendto: ::c_long =3D 206;
-+pub const SYS_recvfrom: ::c_long =3D 207;
-+pub const SYS_sendmsg: ::c_long =3D 211;
-+pub const SYS_recvmsg: ::c_long =3D 212;
-+pub const SYS_shutdown: ::c_long =3D 210;
-+pub const SYS_bind: ::c_long =3D 200;
-+pub const SYS_listen: ::c_long =3D 201;
-+pub const SYS_getsockname: ::c_long =3D 204;
-+pub const SYS_getpeername: ::c_long =3D 205;
-+pub const SYS_socketpair: ::c_long =3D 199;
-+pub const SYS_setsockopt: ::c_long =3D 208;
-+pub const SYS_getsockopt: ::c_long =3D 209;
-+pub const SYS_clone: ::c_long =3D 220;
-+pub const SYS_execve: ::c_long =3D 221;
-+pub const SYS_exit: ::c_long =3D 93;
-+pub const SYS_wait4: ::c_long =3D 260;
-+pub const SYS_kill: ::c_long =3D 129;
-+pub const SYS_uname: ::c_long =3D 160;
-+pub const SYS_semget: ::c_long =3D 190;
-+pub const SYS_semop: ::c_long =3D 193;
-+pub const SYS_semctl: ::c_long =3D 191;
-+pub const SYS_shmdt: ::c_long =3D 197;
-+pub const SYS_msgget: ::c_long =3D 186;
-+pub const SYS_msgsnd: ::c_long =3D 189;
-+pub const SYS_msgrcv: ::c_long =3D 188;
-+pub const SYS_msgctl: ::c_long =3D 187;
-+pub const SYS_fcntl: ::c_long =3D 25;
-+pub const SYS_flock: ::c_long =3D 32;
-+pub const SYS_fsync: ::c_long =3D 82;
-+pub const SYS_fdatasync: ::c_long =3D 83;
-+pub const SYS_truncate: ::c_long =3D 45;
-+pub const SYS_ftruncate: ::c_long =3D 46;
-+pub const SYS_getcwd: ::c_long =3D 17;
-+pub const SYS_chdir: ::c_long =3D 49;
-+pub const SYS_fchdir: ::c_long =3D 50;
-+pub const SYS_fchmod: ::c_long =3D 52;
-+pub const SYS_fchown: ::c_long =3D 55;
-+pub const SYS_umask: ::c_long =3D 166;
-+pub const SYS_gettimeofday: ::c_long =3D 169;
-+pub const SYS_getrlimit: ::c_long =3D 163;
-+pub const SYS_getrusage: ::c_long =3D 165;
-+pub const SYS_sysinfo: ::c_long =3D 179;
-+pub const SYS_times: ::c_long =3D 153;
-+pub const SYS_ptrace: ::c_long =3D 117;
-+pub const SYS_getuid: ::c_long =3D 174;
-+pub const SYS_syslog: ::c_long =3D 116;
-+pub const SYS_getgid: ::c_long =3D 176;
-+pub const SYS_setuid: ::c_long =3D 146;
-+pub const SYS_setgid: ::c_long =3D 144;
-+pub const SYS_geteuid: ::c_long =3D 175;
-+pub const SYS_getegid: ::c_long =3D 177;
-+pub const SYS_setpgid: ::c_long =3D 154;
-+pub const SYS_getppid: ::c_long =3D 173;
-+pub const SYS_setsid: ::c_long =3D 157;
-+pub const SYS_setreuid: ::c_long =3D 145;
-+pub const SYS_setregid: ::c_long =3D 143;
-+pub const SYS_getgroups: ::c_long =3D 158;
-+pub const SYS_setgroups: ::c_long =3D 159;
-+pub const SYS_setresuid: ::c_long =3D 147;
-+pub const SYS_getresuid: ::c_long =3D 148;
-+pub const SYS_setresgid: ::c_long =3D 149;
-+pub const SYS_getresgid: ::c_long =3D 150;
-+pub const SYS_getpgid: ::c_long =3D 155;
-+pub const SYS_setfsuid: ::c_long =3D 151;
-+pub const SYS_setfsgid: ::c_long =3D 152;
-+pub const SYS_getsid: ::c_long =3D 156;
-+pub const SYS_capget: ::c_long =3D 90;
-+pub const SYS_capset: ::c_long =3D 91;
-+pub const SYS_rt_sigpending: ::c_long =3D 136;
-+pub const SYS_rt_sigtimedwait: ::c_long =3D 137;
-+pub const SYS_rt_sigqueueinfo: ::c_long =3D 138;
-+pub const SYS_rt_sigsuspend: ::c_long =3D 133;
-+pub const SYS_sigaltstack: ::c_long =3D 132;
-+pub const SYS_personality: ::c_long =3D 92;
-+pub const SYS_statfs: ::c_long =3D 43;
-+pub const SYS_fstatfs: ::c_long =3D 44;
-+pub const SYS_getpriority: ::c_long =3D 141;
-+pub const SYS_setpriority: ::c_long =3D 140;
-+pub const SYS_sched_setparam: ::c_long =3D 118;
-+pub const SYS_sched_getparam: ::c_long =3D 121;
-+pub const SYS_sched_setscheduler: ::c_long =3D 119;
-+pub const SYS_sched_getscheduler: ::c_long =3D 120;
-+pub const SYS_sched_get_priority_max: ::c_long =3D 125;
-+pub const SYS_sched_get_priority_min: ::c_long =3D 126;
-+pub const SYS_sched_rr_get_interval: ::c_long =3D 127;
-+pub const SYS_mlock: ::c_long =3D 228;
-+pub const SYS_munlock: ::c_long =3D 229;
-+pub const SYS_mlockall: ::c_long =3D 230;
-+pub const SYS_munlockall: ::c_long =3D 231;
-+pub const SYS_vhangup: ::c_long =3D 58;
-+pub const SYS_pivot_root: ::c_long =3D 41;
-+pub const SYS_prctl: ::c_long =3D 167;
-+pub const SYS_adjtimex: ::c_long =3D 171;
-+pub const SYS_setrlimit: ::c_long =3D 164;
-+pub const SYS_chroot: ::c_long =3D 51;
-+pub const SYS_sync: ::c_long =3D 81;
-+pub const SYS_acct: ::c_long =3D 89;
-+pub const SYS_settimeofday: ::c_long =3D 170;
-+pub const SYS_mount: ::c_long =3D 40;
-+pub const SYS_umount2: ::c_long =3D 39;
-+pub const SYS_swapon: ::c_long =3D 224;
-+pub const SYS_swapoff: ::c_long =3D 225;
-+pub const SYS_reboot: ::c_long =3D 142;
-+pub const SYS_sethostname: ::c_long =3D 161;
-+pub const SYS_setdomainname: ::c_long =3D 162;
-+pub const SYS_init_module: ::c_long =3D 105;
-+pub const SYS_delete_module: ::c_long =3D 106;
-+pub const SYS_quotactl: ::c_long =3D 60;
-+pub const SYS_nfsservctl: ::c_long =3D 42;
-+pub const SYS_gettid: ::c_long =3D 178;
-+pub const SYS_readahead: ::c_long =3D 213;
-+pub const SYS_setxattr: ::c_long =3D 5;
-+pub const SYS_lsetxattr: ::c_long =3D 6;
-+pub const SYS_fsetxattr: ::c_long =3D 7;
-+pub const SYS_getxattr: ::c_long =3D 8;
-+pub const SYS_lgetxattr: ::c_long =3D 9;
-+pub const SYS_fgetxattr: ::c_long =3D 10;
-+pub const SYS_listxattr: ::c_long =3D 11;
-+pub const SYS_llistxattr: ::c_long =3D 12;
-+pub const SYS_flistxattr: ::c_long =3D 13;
-+pub const SYS_removexattr: ::c_long =3D 14;
-+pub const SYS_lremovexattr: ::c_long =3D 15;
-+pub const SYS_fremovexattr: ::c_long =3D 16;
-+pub const SYS_tkill: ::c_long =3D 130;
-+pub const SYS_futex: ::c_long =3D 98;
-+pub const SYS_sched_setaffinity: ::c_long =3D 122;
-+pub const SYS_sched_getaffinity: ::c_long =3D 123;
-+pub const SYS_io_setup: ::c_long =3D 0;
-+pub const SYS_io_destroy: ::c_long =3D 1;
-+pub const SYS_io_getevents: ::c_long =3D 4;
-+pub const SYS_io_submit: ::c_long =3D 2;
-+pub const SYS_io_cancel: ::c_long =3D 3;
-+pub const SYS_lookup_dcookie: ::c_long =3D 18;
-+pub const SYS_remap_file_pages: ::c_long =3D 234;
-+pub const SYS_getdents64: ::c_long =3D 61;
-+pub const SYS_set_tid_address: ::c_long =3D 96;
-+pub const SYS_restart_syscall: ::c_long =3D 128;
-+pub const SYS_semtimedop: ::c_long =3D 192;
-+pub const SYS_fadvise64: ::c_long =3D 223;
-+pub const SYS_timer_create: ::c_long =3D 107;
-+pub const SYS_timer_settime: ::c_long =3D 110;
-+pub const SYS_timer_gettime: ::c_long =3D 108;
-+pub const SYS_timer_getoverrun: ::c_long =3D 109;
-+pub const SYS_timer_delete: ::c_long =3D 111;
-+pub const SYS_clock_settime: ::c_long =3D 112;
-+pub const SYS_clock_gettime: ::c_long =3D 113;
-+pub const SYS_clock_getres: ::c_long =3D 114;
-+pub const SYS_clock_nanosleep: ::c_long =3D 115;
-+pub const SYS_exit_group: ::c_long =3D 94;
-+pub const SYS_epoll_ctl: ::c_long =3D 21;
-+pub const SYS_tgkill: ::c_long =3D 131;
-+pub const SYS_mbind: ::c_long =3D 235;
-+pub const SYS_set_mempolicy: ::c_long =3D 237;
-+pub const SYS_get_mempolicy: ::c_long =3D 236;
-+pub const SYS_mq_open: ::c_long =3D 180;
-+pub const SYS_mq_unlink: ::c_long =3D 181;
-+pub const SYS_mq_timedsend: ::c_long =3D 182;
-+pub const SYS_mq_timedreceive: ::c_long =3D 183;
-+pub const SYS_mq_notify: ::c_long =3D 184;
-+pub const SYS_mq_getsetattr: ::c_long =3D 185;
-+pub const SYS_kexec_load: ::c_long =3D 104;
-+pub const SYS_waitid: ::c_long =3D 95;
-+pub const SYS_add_key: ::c_long =3D 217;
-+pub const SYS_request_key: ::c_long =3D 218;
-+pub const SYS_keyctl: ::c_long =3D 219;
-+pub const SYS_ioprio_set: ::c_long =3D 30;
-+pub const SYS_ioprio_get: ::c_long =3D 31;
-+pub const SYS_inotify_add_watch: ::c_long =3D 27;
-+pub const SYS_inotify_rm_watch: ::c_long =3D 28;
-+pub const SYS_migrate_pages: ::c_long =3D 238;
-+pub const SYS_openat: ::c_long =3D 56;
-+pub const SYS_mkdirat: ::c_long =3D 34;
-+pub const SYS_mknodat: ::c_long =3D 33;
-+pub const SYS_fchownat: ::c_long =3D 54;
-+pub const SYS_newfstatat: ::c_long =3D 79;
-+pub const SYS_unlinkat: ::c_long =3D 35;
-+pub const SYS_linkat: ::c_long =3D 37;
-+pub const SYS_symlinkat: ::c_long =3D 36;
-+pub const SYS_readlinkat: ::c_long =3D 78;
-+pub const SYS_fchmodat: ::c_long =3D 53;
-+pub const SYS_faccessat: ::c_long =3D 48;
-+pub const SYS_pselect6: ::c_long =3D 72;
-+pub const SYS_ppoll: ::c_long =3D 73;
-+pub const SYS_unshare: ::c_long =3D 97;
-+pub const SYS_set_robust_list: ::c_long =3D 99;
-+pub const SYS_get_robust_list: ::c_long =3D 100;
-+pub const SYS_splice: ::c_long =3D 76;
-+pub const SYS_tee: ::c_long =3D 77;
-+pub const SYS_sync_file_range: ::c_long =3D 84;
-+pub const SYS_vmsplice: ::c_long =3D 75;
-+pub const SYS_move_pages: ::c_long =3D 239;
-+pub const SYS_utimensat: ::c_long =3D 88;
-+pub const SYS_epoll_pwait: ::c_long =3D 22;
-+pub const SYS_timerfd_create: ::c_long =3D 85;
-+pub const SYS_fallocate: ::c_long =3D 47;
-+pub const SYS_timerfd_settime: ::c_long =3D 86;
-+pub const SYS_timerfd_gettime: ::c_long =3D 87;
-+pub const SYS_accept4: ::c_long =3D 242;
-+pub const SYS_signalfd4: ::c_long =3D 74;
-+pub const SYS_eventfd2: ::c_long =3D 19;
-+pub const SYS_epoll_create1: ::c_long =3D 20;
-+pub const SYS_dup3: ::c_long =3D 24;
-+pub const SYS_pipe2: ::c_long =3D 59;
-+pub const SYS_inotify_init1: ::c_long =3D 26;
-+pub const SYS_preadv: ::c_long =3D 69;
-+pub const SYS_pwritev: ::c_long =3D 70;
-+pub const SYS_rt_tgsigqueueinfo: ::c_long =3D 240;
-+pub const SYS_perf_event_open: ::c_long =3D 241;
-+pub const SYS_recvmmsg: ::c_long =3D 243;
-+pub const SYS_fanotify_init: ::c_long =3D 262;
-+pub const SYS_fanotify_mark: ::c_long =3D 263;
-+pub const SYS_prlimit64: ::c_long =3D 261;
-+pub const SYS_name_to_handle_at: ::c_long =3D 264;
-+pub const SYS_open_by_handle_at: ::c_long =3D 265;
-+pub const SYS_clock_adjtime: ::c_long =3D 266;
-+pub const SYS_syncfs: ::c_long =3D 267;
-+pub const SYS_sendmmsg: ::c_long =3D 269;
-+pub const SYS_setns: ::c_long =3D 268;
-+pub const SYS_getcpu: ::c_long =3D 168;
-+pub const SYS_process_vm_readv: ::c_long =3D 270;
-+pub const SYS_process_vm_writev: ::c_long =3D 271;
-+pub const SYS_kcmp: ::c_long =3D 272;
-+pub const SYS_finit_module: ::c_long =3D 273;
-+pub const SYS_sched_setattr: ::c_long =3D 274;
-+pub const SYS_sched_getattr: ::c_long =3D 275;
-+pub const SYS_renameat2: ::c_long =3D 276;
-+pub const SYS_seccomp: ::c_long =3D 277;
-+pub const SYS_getrandom: ::c_long =3D 278;
-+pub const SYS_memfd_create: ::c_long =3D 279;
-+pub const SYS_bpf: ::c_long =3D 280;
-+pub const SYS_execveat: ::c_long =3D 281;
-+pub const SYS_userfaultfd: ::c_long =3D 282;
-+pub const SYS_membarrier: ::c_long =3D 283;
-+pub const SYS_mlock2: ::c_long =3D 284;
-+pub const SYS_copy_file_range: ::c_long =3D 285;
-+pub const SYS_preadv2: ::c_long =3D 286;
-+pub const SYS_pwritev2: ::c_long =3D 287;
-+pub const SYS_pkey_mprotect: ::c_long =3D 288;
-+pub const SYS_pkey_alloc: ::c_long =3D 289;
-+pub const SYS_pkey_free: ::c_long =3D 290;
-+pub const SYS_statx: ::c_long =3D 291;
-+pub const SYS_pidfd_open: ::c_long =3D 434;
-+pub const SYS_clone3: ::c_long =3D 435;
diff --git a/meta/recipes-gnome/librsvg/librsvg/0006-FIXUP-linux-musl-mod.r=
s-add-riscv64-to-b64-set-libc-.patch b/meta/recipes-gnome/librsvg/librsvg/0=
006-FIXUP-linux-musl-mod.rs-add-riscv64-to-b64-set-libc-.patch
deleted file mode 100644
index ee995286e3..0000000000
--- a/meta/recipes-gnome/librsvg/librsvg/0006-FIXUP-linux-musl-mod.rs-add-r=
iscv64-to-b64-set-libc-.patch
+++ /dev/null
@@ -1,27 +0,0 @@
-From 4319893ebb7fca8bbd2bffc4bddb8d3ecdc08cc2 Mon Sep 17 00:00:00 2001
-From: Ralf Anton Beier <ralf_beier@me.com>
-Date: Sun, 8 Aug 2021 11:07:21 +0200
-Subject: [PATCH 6/8] FIXUP: linux/musl/mod.rs: add riscv64 to b64 set -
- libc-0.2.93
-
-https://github.com/rust-lang/libc/pull/1994/commits/30070c822be2ef399b2ba3=
8cdc1d72ac694d65a3
-
-Upstream-Status: Submitted [https://github.com/rust-lang/libc/pull/2537]
-Signed-off-by: Khem Raj <raj.khem@gmail.com>
-Signed-off-by: Ralf Anton Beier <ralf_beier@me.com>
----
- vendor/libc-0.2.93/src/unix/linux_like/linux/musl/mod.rs | 3 ++-
- 1 file changed, 2 insertions(+), 1 deletion(-)
-
---- a/vendor/libc/src/unix/linux_like/linux/musl/mod.rs
-+++ b/vendor/libc/src/unix/linux_like/linux/musl/mod.rs
-@@ -800,7 +800,8 @@ cfg_if! {
-                  target_arch =3D "aarch64",
-                  target_arch =3D "mips64",
-                  target_arch =3D "powerpc64",
--                 target_arch =3D "s390x"))] {
-+                 target_arch =3D "s390x",
-+                 target_arch =3D "riscv64"))] {
-         mod b64;
-         pub use self::b64::*;
-     } else if #[cfg(any(target_arch =3D "x86",
diff --git a/meta/recipes-gnome/librsvg/librsvg/0007-FIXUP-Correct-definiti=
ons-to-match-musl-libc-0.2.93.patch b/meta/recipes-gnome/librsvg/librsvg/00=
07-FIXUP-Correct-definitions-to-match-musl-libc-0.2.93.patch
deleted file mode 100644
index e23aaa790e..0000000000
--- a/meta/recipes-gnome/librsvg/librsvg/0007-FIXUP-Correct-definitions-to-=
match-musl-libc-0.2.93.patch
+++ /dev/null
@@ -1,737 +0,0 @@
-From 9d240d05c6e6620f36e4ddbcbcb5862fb3269d9f Mon Sep 17 00:00:00 2001
-From: Ralf Anton Beier <ralf_beier@me.com>
-Date: Sun, 8 Aug 2021 11:09:17 +0200
-Subject: [PATCH 7/8] FIXUP Correct definitions to match musl - libc-0.2.93
-
-https://github.com/rust-lang/libc/pull/1994/commits/5f6a4d9745c79c81be63c7=
08515ab116786554a3
-
-Upstream-Status: Submitted [https://github.com/rust-lang/libc/pull/2537]
-Signed-off-by: Khem Raj <raj.khem@gmail.com>
-Signed-off-by: Ralf Anton Beier <ralf_beier@me.com>
----
- .../linux_like/linux/musl/b64/riscv64/mod.rs  | 708 ++++++++----------
- 1 file changed, 311 insertions(+), 397 deletions(-)
-
---- a/vendor/libc/src/unix/linux_like/linux/musl/b64/riscv64/mod.rs
-+++ b/vendor/libc/src/unix/linux_like/linux/musl/b64/riscv64/mod.rs
-@@ -191,403 +191,8 @@ s! {
-         pub l_len: ::off64_t,
-         pub l_pid: ::pid_t,
-     }
--
--    pub struct ip_mreqn {
--        pub imr_multiaddr: ::in_addr,
--        pub imr_address: ::in_addr,
--        pub imr_ifindex: ::c_int,
--    }
- }
-=20
--pub const POSIX_FADV_DONTNEED: ::c_int =3D 4;
--pub const POSIX_FADV_NOREUSE: ::c_int =3D 5;
--pub const VEOF: usize =3D 4;
--pub const RTLD_DEEPBIND: ::c_int =3D 0x8;
--pub const RTLD_GLOBAL: ::c_int =3D 0x100;
--pub const RTLD_NOLOAD: ::c_int =3D 0x4;
--pub const TIOCGSOFTCAR: ::c_ulong =3D 21529;
--pub const TIOCSSOFTCAR: ::c_ulong =3D 21530;
--pub const TIOCGRS485: ::c_int =3D 21550;
--pub const TIOCSRS485: ::c_int =3D 21551;
--pub const RLIMIT_RSS: ::__rlimit_resource_t =3D 5;
--pub const RLIMIT_AS: ::__rlimit_resource_t =3D 9;
--pub const RLIMIT_MEMLOCK: ::__rlimit_resource_t =3D 8;
--pub const RLIMIT_NOFILE: ::__rlimit_resource_t =3D 7;
--pub const RLIMIT_NPROC: ::__rlimit_resource_t =3D 6;
--pub const O_APPEND: ::c_int =3D 1024;
--pub const O_CREAT: ::c_int =3D 64;
--pub const O_EXCL: ::c_int =3D 128;
--pub const O_NOCTTY: ::c_int =3D 256;
--pub const O_NONBLOCK: ::c_int =3D 2048;
--pub const O_SYNC: ::c_int =3D 1052672;
--pub const O_RSYNC: ::c_int =3D 1052672;
--pub const O_DSYNC: ::c_int =3D 4096;
--pub const O_FSYNC: ::c_int =3D 1052672;
--pub const O_NOATIME: ::c_int =3D 262144;
--pub const O_PATH: ::c_int =3D 2097152;
--pub const O_TMPFILE: ::c_int =3D 4259840;
--pub const MAP_GROWSDOWN: ::c_int =3D 256;
--pub const EDEADLK: ::c_int =3D 35;
--pub const ENAMETOOLONG: ::c_int =3D 36;
--pub const ENOLCK: ::c_int =3D 37;
--pub const ENOSYS: ::c_int =3D 38;
--pub const ENOTEMPTY: ::c_int =3D 39;
--pub const ELOOP: ::c_int =3D 40;
--pub const ENOMSG: ::c_int =3D 42;
--pub const EIDRM: ::c_int =3D 43;
--pub const ECHRNG: ::c_int =3D 44;
--pub const EL2NSYNC: ::c_int =3D 45;
--pub const EL3HLT: ::c_int =3D 46;
--pub const EL3RST: ::c_int =3D 47;
--pub const ELNRNG: ::c_int =3D 48;
--pub const EUNATCH: ::c_int =3D 49;
--pub const ENOCSI: ::c_int =3D 50;
--pub const EL2HLT: ::c_int =3D 51;
--pub const EBADE: ::c_int =3D 52;
--pub const EBADR: ::c_int =3D 53;
--pub const EXFULL: ::c_int =3D 54;
--pub const ENOANO: ::c_int =3D 55;
--pub const EBADRQC: ::c_int =3D 56;
--pub const EBADSLT: ::c_int =3D 57;
--pub const EMULTIHOP: ::c_int =3D 72;
--pub const EOVERFLOW: ::c_int =3D 75;
--pub const ENOTUNIQ: ::c_int =3D 76;
--pub const EBADFD: ::c_int =3D 77;
--pub const EBADMSG: ::c_int =3D 74;
--pub const EREMCHG: ::c_int =3D 78;
--pub const ELIBACC: ::c_int =3D 79;
--pub const ELIBBAD: ::c_int =3D 80;
--pub const ELIBSCN: ::c_int =3D 81;
--pub const ELIBMAX: ::c_int =3D 82;
--pub const ELIBEXEC: ::c_int =3D 83;
--pub const EILSEQ: ::c_int =3D 84;
--pub const ERESTART: ::c_int =3D 85;
--pub const ESTRPIPE: ::c_int =3D 86;
--pub const EUSERS: ::c_int =3D 87;
--pub const ENOTSOCK: ::c_int =3D 88;
--pub const EDESTADDRREQ: ::c_int =3D 89;
--pub const EMSGSIZE: ::c_int =3D 90;
--pub const EPROTOTYPE: ::c_int =3D 91;
--pub const ENOPROTOOPT: ::c_int =3D 92;
--pub const EPROTONOSUPPORT: ::c_int =3D 93;
--pub const ESOCKTNOSUPPORT: ::c_int =3D 94;
--pub const EOPNOTSUPP: ::c_int =3D 95;
--pub const EPFNOSUPPORT: ::c_int =3D 96;
--pub const EAFNOSUPPORT: ::c_int =3D 97;
--pub const EADDRINUSE: ::c_int =3D 98;
--pub const EADDRNOTAVAIL: ::c_int =3D 99;
--pub const ENETDOWN: ::c_int =3D 100;
--pub const ENETUNREACH: ::c_int =3D 101;
--pub const ENETRESET: ::c_int =3D 102;
--pub const ECONNABORTED: ::c_int =3D 103;
--pub const ECONNRESET: ::c_int =3D 104;
--pub const ENOBUFS: ::c_int =3D 105;
--pub const EISCONN: ::c_int =3D 106;
--pub const ENOTCONN: ::c_int =3D 107;
--pub const ESHUTDOWN: ::c_int =3D 108;
--pub const ETOOMANYREFS: ::c_int =3D 109;
--pub const ETIMEDOUT: ::c_int =3D 110;
--pub const ECONNREFUSED: ::c_int =3D 111;
--pub const EHOSTDOWN: ::c_int =3D 112;
--pub const EHOSTUNREACH: ::c_int =3D 113;
--pub const EALREADY: ::c_int =3D 114;
--pub const EINPROGRESS: ::c_int =3D 115;
--pub const ESTALE: ::c_int =3D 116;
--pub const EDQUOT: ::c_int =3D 122;
--pub const ENOMEDIUM: ::c_int =3D 123;
--pub const EMEDIUMTYPE: ::c_int =3D 124;
--pub const ECANCELED: ::c_int =3D 125;
--pub const ENOKEY: ::c_int =3D 126;
--pub const EKEYEXPIRED: ::c_int =3D 127;
--pub const EKEYREVOKED: ::c_int =3D 128;
--pub const EKEYREJECTED: ::c_int =3D 129;
--pub const EOWNERDEAD: ::c_int =3D 130;
--pub const ENOTRECOVERABLE: ::c_int =3D 131;
--pub const EHWPOISON: ::c_int =3D 133;
--pub const ERFKILL: ::c_int =3D 132;
--pub const SOL_SOCKET: ::c_int =3D 1;
--pub const SO_REUSEADDR: ::c_int =3D 2;
--pub const SO_TYPE: ::c_int =3D 3;
--pub const SO_ERROR: ::c_int =3D 4;
--pub const SO_DONTROUTE: ::c_int =3D 5;
--pub const SO_BROADCAST: ::c_int =3D 6;
--pub const SO_SNDBUF: ::c_int =3D 7;
--pub const SO_RCVBUF: ::c_int =3D 8;
--pub const SO_SNDBUFFORCE: ::c_int =3D 32;
--pub const SO_RCVBUFFORCE: ::c_int =3D 33;
--pub const SO_KEEPALIVE: ::c_int =3D 9;
--pub const SO_OOBINLINE: ::c_int =3D 10;
--pub const SO_NO_CHECK: ::c_int =3D 11;
--pub const SO_PRIORITY: ::c_int =3D 12;
--pub const SO_LINGER: ::c_int =3D 13;
--pub const SO_BSDCOMPAT: ::c_int =3D 14;
--pub const SO_REUSEPORT: ::c_int =3D 15;
--pub const SO_PASSCRED: ::c_int =3D 16;
--pub const SO_PEERCRED: ::c_int =3D 17;
--pub const SO_RCVLOWAT: ::c_int =3D 18;
--pub const SO_SNDLOWAT: ::c_int =3D 19;
--pub const SO_RCVTIMEO: ::c_int =3D 20;
--pub const SO_SNDTIMEO: ::c_int =3D 21;
--pub const SO_SECURITY_AUTHENTICATION: ::c_int =3D 22;
--pub const SO_SECURITY_ENCRYPTION_TRANSPORT: ::c_int =3D 23;
--pub const SO_SECURITY_ENCRYPTION_NETWORK: ::c_int =3D 24;
--pub const SO_BINDTODEVICE: ::c_int =3D 25;
--pub const SO_ATTACH_FILTER: ::c_int =3D 26;
--pub const SO_DETACH_FILTER: ::c_int =3D 27;
--pub const SO_GET_FILTER: ::c_int =3D 26;
--pub const SO_PEERNAME: ::c_int =3D 28;
--pub const SO_TIMESTAMP: ::c_int =3D 29;
--pub const SO_ACCEPTCONN: ::c_int =3D 30;
--pub const SO_PEERSEC: ::c_int =3D 31;
--pub const SO_PASSSEC: ::c_int =3D 34;
--pub const SO_TIMESTAMPNS: ::c_int =3D 35;
--pub const SCM_TIMESTAMPNS: ::c_int =3D 35;
--pub const SO_MARK: ::c_int =3D 36;
--pub const SO_PROTOCOL: ::c_int =3D 38;
--pub const SO_DOMAIN: ::c_int =3D 39;
--pub const SO_RXQ_OVFL: ::c_int =3D 40;
--pub const SO_WIFI_STATUS: ::c_int =3D 41;
--pub const SCM_WIFI_STATUS: ::c_int =3D 41;
--pub const SO_PEEK_OFF: ::c_int =3D 42;
--pub const SO_NOFCS: ::c_int =3D 43;
--pub const SO_LOCK_FILTER: ::c_int =3D 44;
--pub const SO_SELECT_ERR_QUEUE: ::c_int =3D 45;
--pub const SO_BUSY_POLL: ::c_int =3D 46;
--pub const SO_MAX_PACING_RATE: ::c_int =3D 47;
--pub const SO_BPF_EXTENSIONS: ::c_int =3D 48;
--pub const SO_INCOMING_CPU: ::c_int =3D 49;
--pub const SO_ATTACH_BPF: ::c_int =3D 50;
--pub const SO_DETACH_BPF: ::c_int =3D 27;
--pub const SOCK_STREAM: ::c_int =3D 1;
--pub const SOCK_DGRAM: ::c_int =3D 2;
--pub const SA_ONSTACK: ::c_int =3D 134217728;
--pub const SA_SIGINFO: ::c_int =3D 4;
--pub const SA_NOCLDWAIT: ::c_int =3D 2;
--pub const SIGTTIN: ::c_int =3D 21;
--pub const SIGTTOU: ::c_int =3D 22;
--pub const SIGXCPU: ::c_int =3D 24;
--pub const SIGXFSZ: ::c_int =3D 25;
--pub const SIGVTALRM: ::c_int =3D 26;
--pub const SIGPROF: ::c_int =3D 27;
--pub const SIGWINCH: ::c_int =3D 28;
--pub const SIGCHLD: ::c_int =3D 17;
--pub const SIGBUS: ::c_int =3D 7;
--pub const SIGUSR1: ::c_int =3D 10;
--pub const SIGUSR2: ::c_int =3D 12;
--pub const SIGCONT: ::c_int =3D 18;
--pub const SIGSTOP: ::c_int =3D 19;
--pub const SIGTSTP: ::c_int =3D 20;
--pub const SIGURG: ::c_int =3D 23;
--pub const SIGIO: ::c_int =3D 29;
--pub const SIGSYS: ::c_int =3D 31;
--pub const SIGSTKFLT: ::c_int =3D 16;
--pub const SIGPOLL: ::c_int =3D 29;
--pub const SIGPWR: ::c_int =3D 30;
--pub const SIG_SETMASK: ::c_int =3D 2;
--pub const SIG_BLOCK: ::c_int =3D 0;
--pub const SIG_UNBLOCK: ::c_int =3D 1;
--pub const POLLWRNORM: ::c_short =3D 256;
--pub const POLLWRBAND: ::c_short =3D 512;
--pub const O_ASYNC: ::c_int =3D 8192;
--pub const O_NDELAY: ::c_int =3D 2048;
--pub const PTRACE_DETACH: ::c_uint =3D 17;
--pub const EFD_NONBLOCK: ::c_int =3D 2048;
--pub const F_GETLK: ::c_int =3D 5;
--pub const F_GETOWN: ::c_int =3D 9;
--pub const F_SETOWN: ::c_int =3D 8;
--pub const F_SETLK: ::c_int =3D 6;
--pub const F_SETLKW: ::c_int =3D 7;
--pub const F_RDLCK: ::c_int =3D 0;
--pub const F_WRLCK: ::c_int =3D 1;
--pub const F_UNLCK: ::c_int =3D 2;
--pub const F_OFD_GETLK: ::c_int =3D 36;
--pub const F_OFD_SETLK: ::c_int =3D 37;
--pub const F_OFD_SETLKW: ::c_int =3D 38;
--pub const SFD_NONBLOCK: ::c_int =3D 2048;
--pub const TCSANOW: ::c_int =3D 0;
--pub const TCSADRAIN: ::c_int =3D 1;
--pub const TCSAFLUSH: ::c_int =3D 2;
--pub const TIOCLINUX: ::c_ulong =3D 21532;
--pub const TIOCGSERIAL: ::c_ulong =3D 21534;
--pub const TIOCEXCL: ::c_ulong =3D 21516;
--pub const TIOCNXCL: ::c_ulong =3D 21517;
--pub const TIOCSCTTY: ::c_ulong =3D 21518;
--pub const TIOCSTI: ::c_ulong =3D 21522;
--pub const TIOCMGET: ::c_ulong =3D 21525;
--pub const TIOCMBIS: ::c_ulong =3D 21526;
--pub const TIOCMBIC: ::c_ulong =3D 21527;
--pub const TIOCMSET: ::c_ulong =3D 21528;
--pub const TIOCCONS: ::c_ulong =3D 21533;
--pub const TIOCM_ST: ::c_int =3D 8;
--pub const TIOCM_SR: ::c_int =3D 16;
--pub const TIOCM_CTS: ::c_int =3D 32;
--pub const TIOCM_CAR: ::c_int =3D 64;
--pub const TIOCM_RNG: ::c_int =3D 128;
--pub const TIOCM_DSR: ::c_int =3D 256;
--pub const SFD_CLOEXEC: ::c_int =3D 524288;
--pub const NCCS: usize =3D 32;
--pub const O_TRUNC: ::c_int =3D 512;
--pub const O_CLOEXEC: ::c_int =3D 524288;
--pub const EBFONT: ::c_int =3D 59;
--pub const ENOSTR: ::c_int =3D 60;
--pub const ENODATA: ::c_int =3D 61;
--pub const ETIME: ::c_int =3D 62;
--pub const ENOSR: ::c_int =3D 63;
--pub const ENONET: ::c_int =3D 64;
--pub const ENOPKG: ::c_int =3D 65;
--pub const EREMOTE: ::c_int =3D 66;
--pub const ENOLINK: ::c_int =3D 67;
--pub const EADV: ::c_int =3D 68;
--pub const ESRMNT: ::c_int =3D 69;
--pub const ECOMM: ::c_int =3D 70;
--pub const EPROTO: ::c_int =3D 71;
--pub const EDOTDOT: ::c_int =3D 73;
--pub const SA_NODEFER: ::c_int =3D 1073741824;
--pub const SA_RESETHAND: ::c_int =3D -2147483648;
--pub const SA_RESTART: ::c_int =3D 268435456;
--pub const SA_NOCLDSTOP: ::c_int =3D 1;
--pub const EPOLL_CLOEXEC: ::c_int =3D 524288;
--pub const EFD_CLOEXEC: ::c_int =3D 524288;
--pub const __SIZEOF_PTHREAD_CONDATTR_T: usize =3D 4;
--pub const __SIZEOF_PTHREAD_MUTEXATTR_T: usize =3D 4;
--pub const O_DIRECT: ::c_int =3D 16384;
--pub const O_DIRECTORY: ::c_int =3D 65536;
--pub const O_NOFOLLOW: ::c_int =3D 131072;
--pub const MAP_HUGETLB: ::c_int =3D 262144;
--pub const MAP_LOCKED: ::c_int =3D 8192;
--pub const MAP_NORESERVE: ::c_int =3D 16384;
--pub const MAP_ANON: ::c_int =3D 32;
--pub const MAP_ANONYMOUS: ::c_int =3D 32;
--pub const MAP_DENYWRITE: ::c_int =3D 2048;
--pub const MAP_EXECUTABLE: ::c_int =3D 4096;
--pub const MAP_POPULATE: ::c_int =3D 32768;
--pub const MAP_NONBLOCK: ::c_int =3D 65536;
--pub const MAP_STACK: ::c_int =3D 131072;
--pub const MAP_SYNC : ::c_int =3D 0x080000;
--pub const EDEADLOCK: ::c_int =3D 35;
--pub const EUCLEAN: ::c_int =3D 117;
--pub const ENOTNAM: ::c_int =3D 118;
--pub const ENAVAIL: ::c_int =3D 119;
--pub const EISNAM: ::c_int =3D 120;
--pub const EREMOTEIO: ::c_int =3D 121;
--pub const FIOCLEX: ::c_ulong =3D 21585;
--pub const FIONCLEX: ::c_ulong =3D 21584;
--pub const FIONBIO: ::c_ulong =3D 21537;
--pub const MCL_CURRENT: ::c_int =3D 1;
--pub const MCL_FUTURE: ::c_int =3D 2;
--pub const SIGSTKSZ: ::size_t =3D 8192;
--pub const MINSIGSTKSZ: ::size_t =3D 2048;
--pub const CBAUD: ::tcflag_t =3D 4111;
--pub const TAB1: ::tcflag_t =3D 2048;
--pub const TAB2: ::tcflag_t =3D 4096;
--pub const TAB3: ::tcflag_t =3D 6144;
--pub const CR1: ::tcflag_t =3D 512;
--pub const CR2: ::tcflag_t =3D 1024;
--pub const CR3: ::tcflag_t =3D 1536;
--pub const FF1: ::tcflag_t =3D 32768;
--pub const BS1: ::tcflag_t =3D 8192;
--pub const VT1: ::tcflag_t =3D 16384;
--pub const VWERASE: usize =3D 14;
--pub const VREPRINT: usize =3D 12;
--pub const VSUSP: usize =3D 10;
--pub const VSTART: usize =3D 8;
--pub const VSTOP: usize =3D 9;
--pub const VDISCARD: usize =3D 13;
--pub const VTIME: usize =3D 5;
--pub const IXON: ::tcflag_t =3D 1024;
--pub const IXOFF: ::tcflag_t =3D 4096;
--pub const ONLCR: ::tcflag_t =3D 4;
--pub const CSIZE: ::tcflag_t =3D 48;
--pub const CS6: ::tcflag_t =3D 16;
--pub const CS7: ::tcflag_t =3D 32;
--pub const CS8: ::tcflag_t =3D 48;
--pub const CSTOPB: ::tcflag_t =3D 64;
--pub const CREAD: ::tcflag_t =3D 128;
--pub const PARENB: ::tcflag_t =3D 256;
--pub const PARODD: ::tcflag_t =3D 512;
--pub const HUPCL: ::tcflag_t =3D 1024;
--pub const CLOCAL: ::tcflag_t =3D 2048;
--pub const ECHOKE: ::tcflag_t =3D 2048;
--pub const ECHOE: ::tcflag_t =3D 16;
--pub const ECHOK: ::tcflag_t =3D 32;
--pub const ECHONL: ::tcflag_t =3D 64;
--pub const ECHOPRT: ::tcflag_t =3D 1024;
--pub const ECHOCTL: ::tcflag_t =3D 512;
--pub const ISIG: ::tcflag_t =3D 1;
--pub const ICANON: ::tcflag_t =3D 2;
--pub const PENDIN: ::tcflag_t =3D 16384;
--pub const NOFLSH: ::tcflag_t =3D 128;
--pub const CIBAUD: ::tcflag_t =3D 269418496;
--pub const CBAUDEX: ::tcflag_t =3D 4096;
--pub const VSWTC: usize =3D 7;
--pub const OLCUC: ::tcflag_t =3D 2;
--pub const NLDLY: ::tcflag_t =3D 256;
--pub const CRDLY: ::tcflag_t =3D 1536;
--pub const TABDLY: ::tcflag_t =3D 6144;
--pub const BSDLY: ::tcflag_t =3D 8192;
--pub const FFDLY: ::tcflag_t =3D 32768;
--pub const VTDLY: ::tcflag_t =3D 16384;
--pub const XTABS: ::tcflag_t =3D 6144;
--pub const B0: ::speed_t =3D 0;
--pub const B50: ::speed_t =3D 1;
--pub const B75: ::speed_t =3D 2;
--pub const B110: ::speed_t =3D 3;
--pub const B134: ::speed_t =3D 4;
--pub const B150: ::speed_t =3D 5;
--pub const B200: ::speed_t =3D 6;
--pub const B300: ::speed_t =3D 7;
--pub const B600: ::speed_t =3D 8;
--pub const B1200: ::speed_t =3D 9;
--pub const B1800: ::speed_t =3D 10;
--pub const B2400: ::speed_t =3D 11;
--pub const B4800: ::speed_t =3D 12;
--pub const B9600: ::speed_t =3D 13;
--pub const B19200: ::speed_t =3D 14;
--pub const B38400: ::speed_t =3D 15;
--pub const EXTA: ::speed_t =3D 14;
--pub const EXTB: ::speed_t =3D 15;
--pub const B57600: ::speed_t =3D 4097;
--pub const B115200: ::speed_t =3D 4098;
--pub const B230400: ::speed_t =3D 4099;
--pub const B460800: ::speed_t =3D 4100;
--pub const B500000: ::speed_t =3D 4101;
--pub const B576000: ::speed_t =3D 4102;
--pub const B921600: ::speed_t =3D 4103;
--pub const B1000000: ::speed_t =3D 4104;
--pub const B1152000: ::speed_t =3D 4105;
--pub const B1500000: ::speed_t =3D 4106;
--pub const B2000000: ::speed_t =3D 4107;
--pub const B2500000: ::speed_t =3D 4108;
--pub const B3000000: ::speed_t =3D 4109;
--pub const B3500000: ::speed_t =3D 4110;
--pub const B4000000: ::speed_t =3D 4111;
--pub const VEOL: usize =3D 11;
--pub const VEOL2: usize =3D 16;
--pub const VMIN: usize =3D 6;
--pub const IEXTEN: ::tcflag_t =3D 32768;
--pub const TOSTOP: ::tcflag_t =3D 256;
--pub const FLUSHO: ::tcflag_t =3D 4096;
--pub const EXTPROC: ::tcflag_t =3D 65536;
--pub const TCGETS: ::c_ulong =3D 21505;
--pub const TCSETS: ::c_ulong =3D 21506;
--pub const TCSETSW: ::c_ulong =3D 21507;
--pub const TCSETSF: ::c_ulong =3D 21508;
--pub const TCGETA: ::c_ulong =3D 21509;
--pub const TCSETA: ::c_ulong =3D 21510;
--pub const TCSETAW: ::c_ulong =3D 21511;
--pub const TCSETAF: ::c_ulong =3D 21512;
--pub const TCSBRK: ::c_ulong =3D 21513;
--pub const TCXONC: ::c_ulong =3D 21514;
--pub const TCFLSH: ::c_ulong =3D 21515;
--pub const TIOCINQ: ::c_ulong =3D 21531;
--pub const TIOCGPGRP: ::c_ulong =3D 21519;
--pub const TIOCSPGRP: ::c_ulong =3D 21520;
--pub const TIOCOUTQ: ::c_ulong =3D 21521;
--pub const TIOCGWINSZ: ::c_ulong =3D 21523;
--pub const TIOCSWINSZ: ::c_ulong =3D 21524;
--pub const FIONREAD: ::c_ulong =3D 21531;
--pub const __SIZEOF_PTHREAD_MUTEX_T: usize =3D 40;
--pub const __SIZEOF_PTHREAD_RWLOCK_T: usize =3D 56;
- pub const SYS_read: ::c_long =3D 63;
- pub const SYS_write: ::c_long =3D 64;
- pub const SYS_close: ::c_long =3D 57;
-@@ -863,5 +468,314 @@ pub const SYS_pkey_mprotect: ::c_long =3D
- pub const SYS_pkey_alloc: ::c_long =3D 289;
- pub const SYS_pkey_free: ::c_long =3D 290;
- pub const SYS_statx: ::c_long =3D 291;
--pub const SYS_pidfd_open: ::c_long =3D 434;
--pub const SYS_clone3: ::c_long =3D 435;
-+
-+pub const O_APPEND: ::c_int =3D 1024;
-+pub const O_DIRECT: ::c_int =3D 0x4000;
-+pub const O_DIRECTORY: ::c_int =3D 0x10000;
-+pub const O_LARGEFILE: ::c_int =3D 0;
-+pub const O_NOFOLLOW: ::c_int =3D 0x20000;
-+pub const O_CREAT: ::c_int =3D 64;
-+pub const O_EXCL: ::c_int =3D 128;
-+pub const O_NOCTTY: ::c_int =3D 256;
-+pub const O_NONBLOCK: ::c_int =3D 2048;
-+pub const O_SYNC: ::c_int =3D 1052672;
-+pub const O_RSYNC: ::c_int =3D 1052672;
-+pub const O_DSYNC: ::c_int =3D 4096;
-+pub const O_ASYNC: ::c_int =3D 0x2000;
-+
-+pub const TIOCGRS485: ::c_int =3D 0x542E;
-+pub const TIOCSRS485: ::c_int =3D 0x542F;
-+
-+pub const SIGSTKSZ: ::size_t =3D 8192;
-+pub const MINSIGSTKSZ: ::size_t =3D 2048;
-+
-+pub const ENAMETOOLONG: ::c_int =3D 36;
-+pub const ENOLCK: ::c_int =3D 37;
-+pub const ENOSYS: ::c_int =3D 38;
-+pub const ENOTEMPTY: ::c_int =3D 39;
-+pub const ELOOP: ::c_int =3D 40;
-+pub const ENOMSG: ::c_int =3D 42;
-+pub const EIDRM: ::c_int =3D 43;
-+pub const ECHRNG: ::c_int =3D 44;
-+pub const EL2NSYNC: ::c_int =3D 45;
-+pub const EL3HLT: ::c_int =3D 46;
-+pub const EL3RST: ::c_int =3D 47;
-+pub const ELNRNG: ::c_int =3D 48;
-+pub const EUNATCH: ::c_int =3D 49;
-+pub const ENOCSI: ::c_int =3D 50;
-+pub const EL2HLT: ::c_int =3D 51;
-+pub const EBADE: ::c_int =3D 52;
-+pub const EBADR: ::c_int =3D 53;
-+pub const EXFULL: ::c_int =3D 54;
-+pub const ENOANO: ::c_int =3D 55;
-+pub const EBADRQC: ::c_int =3D 56;
-+pub const EBADSLT: ::c_int =3D 57;
-+pub const EMULTIHOP: ::c_int =3D 72;
-+pub const EOVERFLOW: ::c_int =3D 75;
-+pub const ENOTUNIQ: ::c_int =3D 76;
-+pub const EBADFD: ::c_int =3D 77;
-+pub const EBADMSG: ::c_int =3D 74;
-+pub const EREMCHG: ::c_int =3D 78;
-+pub const ELIBACC: ::c_int =3D 79;
-+pub const ELIBBAD: ::c_int =3D 80;
-+pub const ELIBSCN: ::c_int =3D 81;
-+pub const ELIBMAX: ::c_int =3D 82;
-+pub const ELIBEXEC: ::c_int =3D 83;
-+pub const EILSEQ: ::c_int =3D 84;
-+pub const ERESTART: ::c_int =3D 85;
-+pub const ESTRPIPE: ::c_int =3D 86;
-+pub const EUSERS: ::c_int =3D 87;
-+pub const ENOTSOCK: ::c_int =3D 88;
-+pub const EDESTADDRREQ: ::c_int =3D 89;
-+pub const EMSGSIZE: ::c_int =3D 90;
-+pub const EPROTOTYPE: ::c_int =3D 91;
-+pub const ENOPROTOOPT: ::c_int =3D 92;
-+pub const EPROTONOSUPPORT: ::c_int =3D 93;
-+pub const ESOCKTNOSUPPORT: ::c_int =3D 94;
-+pub const EOPNOTSUPP: ::c_int =3D 95;
-+pub const EPFNOSUPPORT: ::c_int =3D 96;
-+pub const EAFNOSUPPORT: ::c_int =3D 97;
-+pub const EADDRINUSE: ::c_int =3D 98;
-+pub const EADDRNOTAVAIL: ::c_int =3D 99;
-+pub const ENETDOWN: ::c_int =3D 100;
-+pub const ENETUNREACH: ::c_int =3D 101;
-+pub const ENETRESET: ::c_int =3D 102;
-+pub const ECONNABORTED: ::c_int =3D 103;
-+pub const ECONNRESET: ::c_int =3D 104;
-+pub const ENOBUFS: ::c_int =3D 105;
-+pub const EISCONN: ::c_int =3D 106;
-+pub const ENOTCONN: ::c_int =3D 107;
-+pub const ESHUTDOWN: ::c_int =3D 108;
-+pub const ETOOMANYREFS: ::c_int =3D 109;
-+pub const ETIMEDOUT: ::c_int =3D 110;
-+pub const ECONNREFUSED: ::c_int =3D 111;
-+pub const EHOSTDOWN: ::c_int =3D 112;
-+pub const EHOSTUNREACH: ::c_int =3D 113;
-+pub const EALREADY: ::c_int =3D 114;
-+pub const EINPROGRESS: ::c_int =3D 115;
-+pub const ESTALE: ::c_int =3D 116;
-+pub const EDQUOT: ::c_int =3D 122;
-+pub const ENOMEDIUM: ::c_int =3D 123;
-+pub const EMEDIUMTYPE: ::c_int =3D 124;
-+pub const ECANCELED: ::c_int =3D 125;
-+pub const ENOKEY: ::c_int =3D 126;
-+pub const EKEYEXPIRED: ::c_int =3D 127;
-+pub const EKEYREVOKED: ::c_int =3D 128;
-+pub const EKEYREJECTED: ::c_int =3D 129;
-+pub const EOWNERDEAD: ::c_int =3D 130;
-+pub const ENOTRECOVERABLE: ::c_int =3D 131;
-+pub const EHWPOISON: ::c_int =3D 133;
-+pub const ERFKILL: ::c_int =3D 132;
-+
-+pub const SA_ONSTACK: ::c_int =3D 0x08000000;
-+pub const SA_SIGINFO: ::c_int =3D 0x00000004;
-+pub const SA_NOCLDWAIT: ::c_int =3D 0x00000002;
-+
-+pub const SIGCHLD: ::c_int =3D 17;
-+pub const SIGBUS: ::c_int =3D 7;
-+pub const SIGTTIN: ::c_int =3D 21;
-+pub const SIGTTOU: ::c_int =3D 22;
-+pub const SIGXCPU: ::c_int =3D 24;
-+pub const SIGXFSZ: ::c_int =3D 25;
-+pub const SIGVTALRM: ::c_int =3D 26;
-+pub const SIGPROF: ::c_int =3D 27;
-+pub const SIGWINCH: ::c_int =3D 28;
-+pub const SIGUSR1: ::c_int =3D 10;
-+pub const SIGUSR2: ::c_int =3D 12;
-+pub const SIGCONT: ::c_int =3D 18;
-+pub const SIGSTOP: ::c_int =3D 19;
-+pub const SIGTSTP: ::c_int =3D 20;
-+pub const SIGURG: ::c_int =3D 23;
-+pub const SIGIO: ::c_int =3D 29;
-+pub const SIGSYS: ::c_int =3D 31;
-+pub const SIGSTKFLT: ::c_int =3D 16;
-+pub const SIGPOLL: ::c_int =3D 29;
-+pub const SIGPWR: ::c_int =3D 30;
-+pub const SIG_SETMASK: ::c_int =3D 2;
-+pub const SIG_BLOCK: ::c_int =3D 0x000000;
-+pub const SIG_UNBLOCK: ::c_int =3D 0x01;
-+
-+pub const F_GETLK: ::c_int =3D 5;
-+pub const F_GETOWN: ::c_int =3D 9;
-+pub const F_SETLK: ::c_int =3D 6;
-+pub const F_SETLKW: ::c_int =3D 7;
-+pub const F_SETOWN: ::c_int =3D 8;
-+pub const F_OFD_GETLK: ::c_int =3D 36;
-+pub const F_OFD_SETLK: ::c_int =3D 37;
-+pub const F_OFD_SETLKW: ::c_int =3D 38;
-+
-+pub const VEOF: usize =3D 4;
-+
-+pub const POLLWRNORM: ::c_short =3D 0x100;
-+pub const POLLWRBAND: ::c_short =3D 0x200;
-+
-+pub const SOCK_STREAM: ::c_int =3D 1;
-+pub const SOCK_DGRAM: ::c_int =3D 2;
-+pub const SOL_SOCKET: ::c_int =3D 1;
-+pub const SO_REUSEADDR: ::c_int =3D 2;
-+pub const SO_TYPE: ::c_int =3D 3;
-+pub const SO_ERROR: ::c_int =3D 4;
-+pub const SO_DONTROUTE: ::c_int =3D 5;
-+pub const SO_BROADCAST: ::c_int =3D 6;
-+pub const SO_SNDBUF: ::c_int =3D 7;
-+pub const SO_RCVBUF: ::c_int =3D 8;
-+pub const SO_KEEPALIVE: ::c_int =3D 9;
-+pub const SO_OOBINLINE: ::c_int =3D 10;
-+pub const SO_NO_CHECK: ::c_int =3D 11;
-+pub const SO_PRIORITY: ::c_int =3D 12;
-+pub const SO_LINGER: ::c_int =3D 13;
-+pub const SO_BSDCOMPAT: ::c_int =3D 14;
-+pub const SO_REUSEPORT: ::c_int =3D 15;
-+pub const SO_ACCEPTCONN: ::c_int =3D 30;
-+pub const SO_SNDBUFFORCE: ::c_int =3D 32;
-+pub const SO_RCVBUFFORCE: ::c_int =3D 33;
-+pub const SO_PROTOCOL: ::c_int =3D 38;
-+pub const SO_DOMAIN: ::c_int =3D 39;
-+
-+pub const MAP_ANON: ::c_int =3D 0x0020;
-+pub const MAP_GROWSDOWN: ::c_int =3D 0x0100;
-+pub const MAP_DENYWRITE: ::c_int =3D 0x0800;
-+pub const MAP_EXECUTABLE: ::c_int =3D 0x01000;
-+pub const MAP_LOCKED: ::c_int =3D 0x02000;
-+pub const MAP_NORESERVE: ::c_int =3D 0x04000;
-+pub const MAP_POPULATE: ::c_int =3D 0x08000;
-+pub const MAP_NONBLOCK: ::c_int =3D 0x010000;
-+pub const MAP_STACK: ::c_int =3D 0x020000;
-+pub const MAP_HUGETLB: ::c_int =3D 0x040000;
-+pub const MAP_SYNC : ::c_int =3D 0x080000;
-+
-+pub const RLIMIT_NLIMITS: ::c_int =3D 15;
-+pub const TIOCINQ: ::c_int =3D ::FIONREAD;
-+pub const MCL_CURRENT: ::c_int =3D 0x0001;
-+pub const MCL_FUTURE: ::c_int =3D 0x0002;
-+pub const CBAUD: ::tcflag_t =3D 0o0010017;
-+pub const TAB1: ::c_int =3D 0x00000800;
-+pub const TAB2: ::c_int =3D 0x00001000;
-+pub const TAB3: ::c_int =3D 0x00001800;
-+pub const CR1: ::c_int =3D 0x00000200;
-+pub const CR2: ::c_int =3D 0x00000400;
-+pub const CR3: ::c_int =3D 0x00000600;
-+pub const FF1: ::c_int =3D 0x00008000;
-+pub const BS1: ::c_int =3D 0x00002000;
-+pub const VT1: ::c_int =3D 0x00004000;
-+pub const VWERASE: usize =3D 14;
-+pub const VREPRINT: usize =3D 12;
-+pub const VSUSP: usize =3D 10;
-+pub const VSTART: usize =3D 8;
-+pub const VSTOP: usize =3D 9;
-+pub const VDISCARD: usize =3D 13;
-+pub const VTIME: usize =3D 5;
-+pub const IXON: ::tcflag_t =3D 0x00000400;
-+pub const IXOFF: ::tcflag_t =3D 0x00001000;
-+pub const ONLCR: ::tcflag_t =3D 0x4;
-+pub const CSIZE: ::tcflag_t =3D 0x00000030;
-+pub const CS6: ::tcflag_t =3D 0x00000010;
-+pub const CS7: ::tcflag_t =3D 0x00000020;
-+pub const CS8: ::tcflag_t =3D 0x00000030;
-+pub const CSTOPB: ::tcflag_t =3D 0x00000040;
-+pub const CREAD: ::tcflag_t =3D 0x00000080;
-+pub const PARENB: ::tcflag_t =3D 0x00000100;
-+pub const PARODD: ::tcflag_t =3D 0x00000200;
-+pub const HUPCL: ::tcflag_t =3D 0x00000400;
-+pub const CLOCAL: ::tcflag_t =3D 0x00000800;
-+pub const ECHOKE: ::tcflag_t =3D 0x00000800;
-+pub const ECHOE: ::tcflag_t =3D 0x00000010;
-+pub const ECHOK: ::tcflag_t =3D 0x00000020;
-+pub const ECHONL: ::tcflag_t =3D 0x00000040;
-+pub const ECHOPRT: ::tcflag_t =3D 0x00000400;
-+pub const ECHOCTL: ::tcflag_t =3D 0x00000200;
-+pub const ISIG: ::tcflag_t =3D 0x00000001;
-+pub const ICANON: ::tcflag_t =3D 0x00000002;
-+pub const PENDIN: ::tcflag_t =3D 0x00004000;
-+pub const NOFLSH: ::tcflag_t =3D 0x00000080;
-+pub const CIBAUD: ::tcflag_t =3D 0o02003600000;
-+pub const CBAUDEX: ::tcflag_t =3D 0o010000;
-+pub const VSWTC: usize =3D 7;
-+pub const OLCUC: ::tcflag_t =3D 0o000002;
-+pub const NLDLY: ::tcflag_t =3D 0o000400;
-+pub const CRDLY: ::tcflag_t =3D 0o003000;
-+pub const TABDLY: ::tcflag_t =3D 0o014000;
-+pub const BSDLY: ::tcflag_t =3D 0o020000;
-+pub const FFDLY: ::tcflag_t =3D 0o100000;
-+pub const VTDLY: ::tcflag_t =3D 0o040000;
-+pub const XTABS: ::tcflag_t =3D 0o014000;
-+pub const B57600: ::speed_t =3D 0o010001;
-+pub const B115200: ::speed_t =3D 0o010002;
-+pub const B230400: ::speed_t =3D 0o010003;
-+pub const B460800: ::speed_t =3D 0o010004;
-+pub const B500000: ::speed_t =3D 0o010005;
-+pub const B576000: ::speed_t =3D 0o010006;
-+pub const B921600: ::speed_t =3D 0o010007;
-+pub const B1000000: ::speed_t =3D 0o010010;
-+pub const B1152000: ::speed_t =3D 0o010011;
-+pub const B1500000: ::speed_t =3D 0o010012;
-+pub const B2000000: ::speed_t =3D 0o010013;
-+pub const B2500000: ::speed_t =3D 0o010014;
-+pub const B3000000: ::speed_t =3D 0o010015;
-+pub const B3500000: ::speed_t =3D 0o010016;
-+pub const B4000000: ::speed_t =3D 0o010017;
-+
-+pub const FIOCLEX: ::c_int =3D 0x5451;
-+pub const FIONCLEX: ::c_int =3D 0x5450;
-+pub const FIONBIO: ::c_int =3D 0x5421;
-+pub const EDEADLK: ::c_int =3D 35;
-+pub const EDEADLOCK: ::c_int =3D EDEADLK;
-+pub const SO_PASSCRED: ::c_int =3D 16;
-+pub const SO_PEERCRED: ::c_int =3D 17;
-+pub const SO_RCVLOWAT: ::c_int =3D 18;
-+pub const SO_SNDLOWAT: ::c_int =3D 19;
-+pub const SO_RCVTIMEO: ::c_int =3D 20;
-+pub const SO_SNDTIMEO: ::c_int =3D 21;
-+pub const EXTPROC: ::tcflag_t =3D 0x00010000;
-+pub const VEOL: usize =3D 11;
-+pub const VEOL2: usize =3D 16;
-+pub const VMIN: usize =3D 6;
-+pub const IEXTEN: ::tcflag_t =3D 0x00008000;
-+pub const TOSTOP: ::tcflag_t =3D 0x00000100;
-+pub const FLUSHO: ::tcflag_t =3D 0x00001000;
-+pub const TCGETS: ::c_int =3D 0x5401;
-+pub const TCSETS: ::c_int =3D 0x5402;
-+pub const TCSETSW: ::c_int =3D 0x5403;
-+pub const TCSETSF: ::c_int =3D 0x5404;
-+pub const TCGETA: ::c_int =3D 0x5405;
-+pub const TCSETA: ::c_int =3D 0x5406;
-+pub const TCSETAW: ::c_int =3D 0x5407;
-+pub const TCSETAF: ::c_int =3D 0x5408;
-+pub const TCSBRK: ::c_int =3D 0x5409;
-+pub const TCXONC: ::c_int =3D 0x540A;
-+pub const TCFLSH: ::c_int =3D 0x540B;
-+pub const TIOCGSOFTCAR: ::c_int =3D 0x5419;
-+pub const TIOCSSOFTCAR: ::c_int =3D 0x541A;
-+pub const TIOCLINUX: ::c_int =3D 0x541C;
-+pub const TIOCGSERIAL: ::c_int =3D 0x541E;
-+pub const TIOCEXCL: ::c_int =3D 0x540C;
-+pub const TIOCNXCL: ::c_int =3D 0x540D;
-+pub const TIOCSCTTY: ::c_int =3D 0x540E;
-+pub const TIOCGPGRP: ::c_int =3D 0x540F;
-+pub const TIOCSPGRP: ::c_int =3D 0x5410;
-+pub const TIOCOUTQ: ::c_int =3D 0x5411;
-+pub const TIOCSTI: ::c_int =3D 0x5412;
-+pub const TIOCGWINSZ: ::c_int =3D 0x5413;
-+pub const TIOCSWINSZ: ::c_int =3D 0x5414;
-+pub const TIOCMGET: ::c_int =3D 0x5415;
-+pub const TIOCMBIS: ::c_int =3D 0x5416;
-+pub const TIOCMBIC: ::c_int =3D 0x5417;
-+pub const TIOCMSET: ::c_int =3D 0x5418;
-+pub const FIONREAD: ::c_int =3D 0x541B;
-+pub const TIOCCONS: ::c_int =3D 0x541D;
-+
-+pub const TIOCM_LE: ::c_int =3D 0x001;
-+pub const TIOCM_DTR: ::c_int =3D 0x002;
-+pub const TIOCM_RTS: ::c_int =3D 0x004;
-+pub const TIOCM_ST: ::c_int =3D 0x008;
-+pub const TIOCM_SR: ::c_int =3D 0x010;
-+pub const TIOCM_CTS: ::c_int =3D 0x020;
-+pub const TIOCM_CAR: ::c_int =3D 0x040;
-+pub const TIOCM_RNG: ::c_int =3D 0x080;
-+pub const TIOCM_DSR: ::c_int =3D 0x100;
-+pub const TIOCM_CD: ::c_int =3D TIOCM_CAR;
-+pub const TIOCM_RI: ::c_int =3D TIOCM_RNG;
-+
-+extern "C" {
-+    pub fn ioctl(fd: ::c_int, request: ::c_int, ...) -> ::c_int;
-+}
diff --git a/meta/recipes-gnome/librsvg/librsvg_2.52.4.bb b/meta/recipes-gn=
ome/librsvg/librsvg_2.52.5.bb
similarity index 85%
rename from meta/recipes-gnome/librsvg/librsvg_2.52.4.bb
rename to meta/recipes-gnome/librsvg/librsvg_2.52.5.bb
index bbaaefcd23..5a764d86ed 100644
--- a/meta/recipes-gnome/librsvg/librsvg_2.52.4.bb
+++ b/meta/recipes-gnome/librsvg/librsvg_2.52.5.bb
@@ -18,14 +18,9 @@ inherit gnomebase gtk-doc pixbufcache upstream-version-i=
s-even gobject-introspec
=20
 SRC_URI +=3D "file://0001-Makefile.am-pass-rust-target-to-cargo-also-when-=
not-.patch \
            file://0001-system-deps-src-lib.rs-do-not-probe-into-harcoded-l=
i.patch \
-           file://0001-vendor-system-deps-sort-dependencies-before-using-t=
h.patch \
-           file://0005-Add-base-definitions-for-riscv64-musl-libc-0.2.93.p=
atch \
-           file://0006-FIXUP-linux-musl-mod.rs-add-riscv64-to-b64-set-libc=
-.patch \
-           file://0007-FIXUP-Correct-definitions-to-match-musl-libc-0.2.93=
.patch \
-           file://0001-Update-checksums-for-modified-files-for-libc.patch \
            "
=20
-SRC_URI[archive.sha256sum] =3D "660ec8836a3a91587bc9384920132d4c38d1d1718c=
67fe160c5213fe4dec2928"
+SRC_URI[archive.sha256sum] =3D "407cbbab518137ea18a3f3220bea180fbee75f3e5b=
d6ba10a7a862c1a6f74d82"
=20
 # librsvg is still autotools-based, but is calling cargo from its automake=
-driven makefiles
 # so we cannot use cargo class directly, but still need bits and pieces fr=
om it=20
--=20
2.20.1


