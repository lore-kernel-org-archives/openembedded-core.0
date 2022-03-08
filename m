Return-Path: <alex.kanavin@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 41DEFC433EF
	for <webhook@archiver.kernel.org>; Tue,  8 Mar 2022 09:32:32 +0000 (UTC)
Received: from mail-ed1-f51.google.com (mail-ed1-f51.google.com
 [209.85.208.51])
 by mx.groups.io with SMTP id smtpd.web11.6397.1646731950758017510
 for <openembedded-core@lists.openembedded.org>;
 Tue, 08 Mar 2022 01:32:31 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20210112 header.b=IMjTxdJu;
 spf=pass (domain: gmail.com, ip: 209.85.208.51,
 mailfrom: alex.kanavin@gmail.com)
Received: by mail-ed1-f51.google.com with SMTP id o1so22554764edc.3
        for <openembedded-core@lists.openembedded.org>;
 Tue, 08 Mar 2022 01:32:30 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:content-transfer-encoding;
        bh=0bmhKFnwYjST03dx/ks5VLIPykW4uTzhs+U4ZqYL2uU=;
        b=IMjTxdJuxPueCtkjdhEJSAZaiVhS5ZxWXZF47uIIcaqlWnAaDlE2xUhGf3kaT0Io2/
         gLhtB3IaK6MzGeDm8oVAHHuPjqsuiBbCfT7U2GsHbTmmMzbtXtzWy5RSqH4DUmMNIbXA
         84dOiViWRC+VzEQXhEl1ZJp/sVKC7xu7DCmJAJSTJeVLboxEt0UrI+WvoKtADB0x1xeW
         2qUuzx+2M6866dmCxQytn5Ff1gKoR4PH96gZ/ySurVurQit0OVDU6221IRV1dk+nnozc
         1pQCmTy+4snDO3+eTZfzTYbY1KaEZooqkyzeKyJGVoHmKYWSNNq7gSRR3fj7jNAuTIyu
         xxzQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=0bmhKFnwYjST03dx/ks5VLIPykW4uTzhs+U4ZqYL2uU=;
        b=f7l3QgSw/KFTEpExGFVWEUCgavN7dpA0zY6RlEWRKxtEdDybZxQChSlUya4Bog2vul
         4LvVU9bE7QqXmE/Y/K55DyBCulSt9ox2PdIdun4bf4dcBJDMPg6wakjqA5QKXc4YG4je
         5jFGJ3cxn3/kfQAMNmWbhKn/T/oCEkMCWHGY8zG+nx1NHZlNiYfKz5sHo1cpM72kvoy6
         OppFfePV5U0s97zhm9sFU+bOSam8HTR94o3LWPYFzC+f310BvddXzHfxObgncJDKL6s7
         v8tm4kuf5mnpbOnNptziOYre588mSi7//H1NYmUaFmAByoq54JJbyOmS8cOyNScRMd0a
         +L8A==
X-Gm-Message-State: AOAM530utXlqChxFtxY09+Gsp0ibS7/NjrmKwbliII5BZ4HNziYmlNFW
	Ji8slsG6DH8SoB3jJzv5GryxNchA/Xs=
X-Google-Smtp-Source: 
 ABdhPJxFYf+7hoJkBegODcYHvn20cthERCWQlfoGdE5mWsHvBkdIF/kS7JntFyapJ4kFiyEKd1UpNA==
X-Received: by 2002:aa7:d494:0:b0:415:a309:7815 with SMTP id
 b20-20020aa7d494000000b00415a3097815mr15055707edr.340.1646731949122;
        Tue, 08 Mar 2022 01:32:29 -0800 (PST)
Received: from Zen2.lab.linutronix.de.
 (ip-109-090-143-203.um36.pools.vodafone-ip.de. [109.90.143.203])
        by smtp.gmail.com with ESMTPSA id
 g22-20020a170906395600b006cec40b9cf0sm5640178eje.92.2022.03.08.01.32.28
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 08 Mar 2022 01:32:28 -0800 (PST)
From: Alexander Kanavin <alex.kanavin@gmail.com>
X-Google-Original-From: Alexander Kanavin <alex@linutronix.de>
To: openembedded-core@lists.openembedded.org
Cc: Alexander Kanavin <alex@linutronix.de>
Subject: [PATCH 02/16] librsvg: update 2.52.5 -> 2.52.6
Date: Tue,  8 Mar 2022 10:32:10 +0100
Message-Id: <20220308093224.3436483-2-alex@linutronix.de>
X-Mailer: git-send-email 2.30.2
In-Reply-To: <20220308093224.3436483-1-alex@linutronix.de>
References: <20220308093224.3436483-1-alex@linutronix.de>
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Tue, 08 Mar 2022 09:32:32 -0000
X-Groupsio-URL: 
 https://lists.openembedded.org/g/openembedded-core/message/162878

Signed-off-by: Alexander Kanavin <alex@linutronix.de>
---
 ...rc-lib.rs-do-not-probe-into-harcoded-li.patch | 16 +++++++---------
 .../{librsvg_2.52.5.bb =3D> librsvg_2.52.6.bb}     |  2 +-
 2 files changed, 8 insertions(+), 10 deletions(-)
 rename meta/recipes-gnome/librsvg/{librsvg_2.52.5.bb =3D> librsvg_2.52.6.b=
b} (96%)

diff --git a/meta/recipes-gnome/librsvg/librsvg/0001-system-deps-src-lib.rs=
-do-not-probe-into-harcoded-li.patch b/meta/recipes-gnome/librsvg/librsvg/0=
001-system-deps-src-lib.rs-do-not-probe-into-harcoded-li.patch
index 9c9ec80c19..992ff8dee7 100644
--- a/meta/recipes-gnome/librsvg/librsvg/0001-system-deps-src-lib.rs-do-not=
-probe-into-harcoded-li.patch
+++ b/meta/recipes-gnome/librsvg/librsvg/0001-system-deps-src-lib.rs-do-not=
-probe-into-harcoded-li.patch
@@ -1,4 +1,4 @@
-From c6d52d37c546ebaa5d794fd5bcfa1ca1fc249dc2 Mon Sep 17 00:00:00 2001
+From c0b0ef51b3c997a1c20ef9381ba2201ed477f609 Mon Sep 17 00:00:00 2001
 From: Alexander Kanavin <alex@linutronix.de>
 Date: Tue, 21 Sep 2021 16:54:23 +0200
 Subject: [PATCH] system-deps/src/lib.rs: do not probe into harcoded list of
@@ -8,24 +8,25 @@ Oe-core defines custom targets, and this probe fails.
=20
 Upstream-Status: Inappropriate [oe-core specific]
 Signed-off-by: Alexander Kanavin <alex@linutronix.de>
+
 ---
  vendor/system-deps/.cargo-checksum.json |  2 +-
  vendor/system-deps/src/lib.rs           | 16 +---------------
  2 files changed, 2 insertions(+), 16 deletions(-)
=20
 diff --git a/vendor/system-deps/.cargo-checksum.json b/vendor/system-deps/=
.cargo-checksum.json
-index 725ee53..c3b8fe5 100644
+index 862df8b..931748e 100644
 --- a/vendor/system-deps/.cargo-checksum.json
 +++ b/vendor/system-deps/.cargo-checksum.json
 @@ -1 +1 @@
--{"files":{"Cargo.toml":"3923d630403610a69f9943621bd13c1033944124acc96642e=
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
+-{"files":{"Cargo.toml":"927df7476ebf5f5983169cfd973f4c95b84da17caeb20d33c=
ccf50e326af5316","LICENSE-APACHE":"a60eea817514531668d7e00765731449fe14d059=
d3249e0bc93b36de45f759f2","LICENSE-MIT":"23f18e03dc49df91622fe2a76176497404=
e46ced8a715d9d2b67a7446571cca3","README.md":"3fe7396637bf9233908f41c6001cfc=
b00a379225e06e36e508c8b3d7264a8aae","src/lib.rs":"c38fd96ca3233ebee3bb7e37c=
a8f8a7a2685cdd7fcccf0210eaa879aa91dc684","src/metadata.rs":"657bc1b77e949e4=
800f9dd808790ffa535820e1658d412121a1da548e0cdd02c","src/test.rs":"9d5f8c1fb=
7a821352d6ba75cb005ead3e36b4f359e61feb605ab8a36d4fd31f8","src/tests/lib/lib=
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
f7d41fa"},"package":"a1a45a1c4c9015217e12347f2a411b57ce2c4fc543913b14b6fe40=
483328e709"}
 \ No newline at end of file
-+{"files":{"Cargo.toml":"3923d630403610a69f9943621bd13c1033944124acc96642e=
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
++{"files":{"Cargo.toml":"927df7476ebf5f5983169cfd973f4c95b84da17caeb20d33c=
ccf50e326af5316","LICENSE-APACHE":"a60eea817514531668d7e00765731449fe14d059=
d3249e0bc93b36de45f759f2","LICENSE-MIT":"23f18e03dc49df91622fe2a76176497404=
e46ced8a715d9d2b67a7446571cca3","README.md":"3fe7396637bf9233908f41c6001cfc=
b00a379225e06e36e508c8b3d7264a8aae","src/lib.rs":"534efc2f977d8c67d5be3a4c3=
e81093a6c00ab2de1102404166b1573ad96dbd2","src/metadata.rs":"657bc1b77e949e4=
800f9dd808790ffa535820e1658d412121a1da548e0cdd02c","src/test.rs":"9d5f8c1fb=
7a821352d6ba75cb005ead3e36b4f359e61feb605ab8a36d4fd31f8","src/tests/lib/lib=
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
f7d41fa"},"package":"a1a45a1c4c9015217e12347f2a411b57ce2c4fc543913b14b6fe40=
483328e709"}
 diff --git a/vendor/system-deps/src/lib.rs b/vendor/system-deps/src/lib.rs
-index be919e2..97536a3 100644
+index 45ab1ce..f87d1ec 100644
 --- a/vendor/system-deps/src/lib.rs
 +++ b/vendor/system-deps/src/lib.rs
-@@ -805,21 +805,7 @@ impl Config {
+@@ -800,21 +800,7 @@ impl Config {
      }
=20=20
      fn check_cfg(&self, cfg: &cfg_expr::Expression) -> Result<bool, Error=
> {
@@ -48,6 +49,3 @@ index be919e2..97536a3 100644
      }
  }
=20=20
---=20
-2.20.1
-
diff --git a/meta/recipes-gnome/librsvg/librsvg_2.52.5.bb b/meta/recipes-gn=
ome/librsvg/librsvg_2.52.6.bb
similarity index 96%
rename from meta/recipes-gnome/librsvg/librsvg_2.52.5.bb
rename to meta/recipes-gnome/librsvg/librsvg_2.52.6.bb
index 1279c663f7..85ecc10d00 100644
--- a/meta/recipes-gnome/librsvg/librsvg_2.52.5.bb
+++ b/meta/recipes-gnome/librsvg/librsvg_2.52.6.bb
@@ -20,7 +20,7 @@ SRC_URI +=3D "file://0001-Makefile.am-pass-rust-target-to=
-cargo-also-when-not-.pat
            file://0001-system-deps-src-lib.rs-do-not-probe-into-harcoded-l=
i.patch \
            "
=20
-SRC_URI[archive.sha256sum] =3D "407cbbab518137ea18a3f3220bea180fbee75f3e5b=
d6ba10a7a862c1a6f74d82"
+SRC_URI[archive.sha256sum] =3D "a3f939a1e6a3a60408244632d0323f8c3b20eb4b7b=
000536e2e5bd93b8effaad"
=20
 # librsvg is still autotools-based, but is calling cargo from its automake=
-driven makefiles
 # so we cannot use cargo class directly, but still need bits and pieces fr=
om it=20
--=20
2.30.2


