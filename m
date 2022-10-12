Return-Path: <alex.kiernan@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 3C2F8C4332F
	for <webhook@archiver.kernel.org>; Wed, 12 Oct 2022 07:17:27 +0000 (UTC)
Received: from mail-ed1-f49.google.com (mail-ed1-f49.google.com [209.85.208.49])
 by mx.groups.io with SMTP id smtpd.web08.17335.1665559041600197204
 for <openembedded-core@lists.openembedded.org>;
 Wed, 12 Oct 2022 00:17:21 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20210112 header.b=UJa4bqRm;
 spf=pass (domain: gmail.com, ip: 209.85.208.49, mailfrom: alex.kiernan@gmail.com)
Received: by mail-ed1-f49.google.com with SMTP id a13so23291702edj.0
        for <openembedded-core@lists.openembedded.org>; Wed, 12 Oct 2022 00:17:21 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=oxrauMaSsR3c1C5lqDAG040d5e+7IxeVyDtqzOlTA/Y=;
        b=UJa4bqRmQmd8EfrJWbIDOGplW6L8DDe8/z+L5shyH/lUMcgG69Hr9QZxdIovcGkTRs
         QeUWqIryvxI0gggNiMsaeFdATqUkRNBl7XvMoEmtGIE6EkMrVU3YvetTSh9DQXHpIjTf
         0OELAJ1Q/oo+fV2jf1/6PnlixLqDhHmGNBZrN/pDAQ7X0mX9b3HY/snYLJUeb2MVxLQW
         9Y0uvrnrRGcZOJZQFfyyGmA28dO64GG4DrfH6H9XdJiAaVGgKCxdG+yz5iCayhl+9eHR
         ahGun0r3rCaHUE4KiGDYxrJfd48ioTZlT11jIcJ5FfzrPXcHnQtHqeGlGjcsjGlaNS4E
         1GKw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=oxrauMaSsR3c1C5lqDAG040d5e+7IxeVyDtqzOlTA/Y=;
        b=G+ZnuOBCwODWSerA0b2Du+GA+Q8gaemCYDRAJoKf+eIHh7TFgJWS0zDfE8oMwkvrI0
         NvnNq/lzrEHKfK/BLBDX12jUwC+2fDGeqjEIjydPWOI/ryTxsuxaDXlzuqqQMmzMi5Wb
         YQaN9V4ZQQzlzxBsk7yeQXf6pjxdnVKKjTa5JKcOYuCpADnysruePbrXD1/NEXrBYNJ8
         s14xkYblJ+Kz02zjXBAJo6v7qBfJSafTBPMhxpcOsvlNb6v/QzQ/QHQMAiXZzsfnuUqX
         X+rmpldwmWuSTy6kfeXNM9MN5lrGDfrFlAhyX9x1wNEdG/ZmQdvo3jBAknYasGeTMQAg
         PQZA==
X-Gm-Message-State: ACrzQf3aXGor2cgWmLgv/ki/1B/J8aaxB0s9+twFF2X5kG1z9i+t4zlJ
	Xg+zeJq6NfBLsZ5CF6sJbfpmEzohxA8=
X-Google-Smtp-Source: AMsMyM6ad0hP9PW2iiF53xgy4/UHheb7yg3+Q1LdO1HfYC3D5aJhNXEUUM5GkT+X7pFsf5SxJoZybw==
X-Received: by 2002:a05:6402:5193:b0:45b:f51e:f81e with SMTP id q19-20020a056402519300b0045bf51ef81emr16630977edd.343.1665559039574;
        Wed, 12 Oct 2022 00:17:19 -0700 (PDT)
Received: from localhost.localdomain (cust246-dsl91-135-6.idnet.net. [91.135.6.246])
        by smtp.gmail.com with ESMTPSA id i5-20020a170906114500b0073d6093ac93sm794554eja.16.2022.10.12.00.17.18
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 12 Oct 2022 00:17:19 -0700 (PDT)
From: Alex Kiernan <alex.kiernan@gmail.com>
To: openembedded-core@lists.openembedded.org
Cc: Alex Kiernan <alex.kiernan@gmail.com>
Subject: [OE-Core][PATCH] rust: update 1.63.0 -> 1.64.0
Date: Wed, 12 Oct 2022 08:17:14 +0100
Message-Id: <20221012071714.751-1-alex.kiernan@gmail.com>
X-Mailer: git-send-email 2.35.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Wed, 12 Oct 2022 07:17:27 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/171648

Release notes:
  https://blog.rust-lang.org/2022/09/22/Rust-1.64.0.html

Signed-off-by: Alex Kiernan <alex.kiernan@gmail.com>
---
 meta/conf/distro/include/tcmode-default.inc   |  2 +-
 .../{cargo_1.63.0.bb => cargo_1.64.0.bb}      |  0
 ...ibstd-rs_1.63.0.bb => libstd-rs_1.64.0.bb} |  0
 ....63.0.bb => rust-cross-canadian_1.64.0.bb} |  0
 ...ust-llvm_1.63.0.bb => rust-llvm_1.64.0.bb} |  0
 meta/recipes-devtools/rust/rust-snapshot.inc  | 22 +++++++++----------
 meta/recipes-devtools/rust/rust-source.inc    |  2 +-
 .../rust/{rust_1.63.0.bb => rust_1.64.0.bb}   |  0
 8 files changed, 13 insertions(+), 13 deletions(-)
 rename meta/recipes-devtools/cargo/{cargo_1.63.0.bb => cargo_1.64.0.bb} (100%)
 rename meta/recipes-devtools/rust/{libstd-rs_1.63.0.bb => libstd-rs_1.64.0.bb} (100%)
 rename meta/recipes-devtools/rust/{rust-cross-canadian_1.63.0.bb => rust-cross-canadian_1.64.0.bb} (100%)
 rename meta/recipes-devtools/rust/{rust-llvm_1.63.0.bb => rust-llvm_1.64.0.bb} (100%)
 rename meta/recipes-devtools/rust/{rust_1.63.0.bb => rust_1.64.0.bb} (100%)

diff --git a/meta/conf/distro/include/tcmode-default.inc b/meta/conf/distro/include/tcmode-default.inc
index 59b226e62fcd..6bba92ac9696 100644
--- a/meta/conf/distro/include/tcmode-default.inc
+++ b/meta/conf/distro/include/tcmode-default.inc
@@ -27,7 +27,7 @@ GOVERSION ?= "1.19%"
 # This can not use wildcards like 8.0.% since it is also used in mesa to denote
 # llvm version being used, so always bump it with llvm recipe version bump
 LLVMVERSION ?= "14.0.6"
-RUSTVERSION ?= "1.63%"
+RUSTVERSION ?= "1.64%"
 
 PREFERRED_VERSION_gcc ?= "${GCCVERSION}"
 PREFERRED_VERSION_gcc-cross-${TARGET_ARCH} ?= "${GCCVERSION}"
diff --git a/meta/recipes-devtools/cargo/cargo_1.63.0.bb b/meta/recipes-devtools/cargo/cargo_1.64.0.bb
similarity index 100%
rename from meta/recipes-devtools/cargo/cargo_1.63.0.bb
rename to meta/recipes-devtools/cargo/cargo_1.64.0.bb
diff --git a/meta/recipes-devtools/rust/libstd-rs_1.63.0.bb b/meta/recipes-devtools/rust/libstd-rs_1.64.0.bb
similarity index 100%
rename from meta/recipes-devtools/rust/libstd-rs_1.63.0.bb
rename to meta/recipes-devtools/rust/libstd-rs_1.64.0.bb
diff --git a/meta/recipes-devtools/rust/rust-cross-canadian_1.63.0.bb b/meta/recipes-devtools/rust/rust-cross-canadian_1.64.0.bb
similarity index 100%
rename from meta/recipes-devtools/rust/rust-cross-canadian_1.63.0.bb
rename to meta/recipes-devtools/rust/rust-cross-canadian_1.64.0.bb
diff --git a/meta/recipes-devtools/rust/rust-llvm_1.63.0.bb b/meta/recipes-devtools/rust/rust-llvm_1.64.0.bb
similarity index 100%
rename from meta/recipes-devtools/rust/rust-llvm_1.63.0.bb
rename to meta/recipes-devtools/rust/rust-llvm_1.64.0.bb
diff --git a/meta/recipes-devtools/rust/rust-snapshot.inc b/meta/recipes-devtools/rust/rust-snapshot.inc
index b9d7edd6720f..e790705aba0c 100644
--- a/meta/recipes-devtools/rust/rust-snapshot.inc
+++ b/meta/recipes-devtools/rust/rust-snapshot.inc
@@ -5,21 +5,21 @@
 ## The version is replicated here.
 ## TODO: find a way to add additional SRC_URIs based on the contents of an
 ##       earlier SRC_URI.
-RS_VERSION = "1.62.0"
-CARGO_VERSION = "1.62.0"
+RS_VERSION = "1.63.0"
+CARGO_VERSION = "1.63.0"
 
 # TODO: Add hashes for other architecture toolchains as well. Make a script?
-SRC_URI[rust-std-snapshot-x86_64.sha256sum] = "addfae87b6b1b521d98a50fdc5120990888a51bb397100062e9c558267c67c77"
-SRC_URI[rustc-snapshot-x86_64.sha256sum] = "e7f71f4ef09334ddc9ec8cbf2f958d654e36f580c95f8fec6d5c816ce256dbd6"
-SRC_URI[cargo-snapshot-x86_64.sha256sum] = "815c63119a9cf0282ff240c6444b6f867238763ee3dea182f10837ae7dbbb1d4"
+SRC_URI[rust-std-snapshot-x86_64.sha256sum] = "993c2c17bf76ac626bfb5b17bddce65fbdfc14f70d183f33773de0cd12df46d2"
+SRC_URI[rustc-snapshot-x86_64.sha256sum] = "bdab9d9afa5c329c40f9ba568364815237fab8426477c12bfabad35ffc484ab5"
+SRC_URI[cargo-snapshot-x86_64.sha256sum] = "f370d12e4c11f0c835becb738bcf00d363f29b76f8b424b4dcb005abcf15fc9a"
 
-SRC_URI[rust-std-snapshot-aarch64.sha256sum] = "dd5df8a92af3e5d49a1122b9561821ebd72a9317884a37ecddae041e652a7563"
-SRC_URI[rustc-snapshot-aarch64.sha256sum] = "0fa320a19d41dcfc592bc006f5e9eda8e3b972598a26c96ad64eedd868516df3"
-SRC_URI[cargo-snapshot-aarch64.sha256sum] = "475038ecacca9ff586cad2082d5d950544b0d581a2a287facc7d899aae488813"
+SRC_URI[rust-std-snapshot-aarch64.sha256sum] = "f1d93b3d48258f701687c63ef9b226c07329fb92c2c5559283258687f958e9d0"
+SRC_URI[rustc-snapshot-aarch64.sha256sum] = "d78799bb8f4177877f97b9051c9cba1fd85173f2e9cecab9486388fc6fa66259"
+SRC_URI[cargo-snapshot-aarch64.sha256sum] = "4313ab44dccba4faed20db4aacc16def405773d1676e79d3e65ced4b99d710d4"
 
-SRC_URI[rust-std-snapshot-powerpc64le.sha256sum] = "d6678b7c971f3adbe7f820adae669d03a314468441e2907747c76eca98e0be92"
-SRC_URI[rustc-snapshot-powerpc64le.sha256sum] = "b66d0bc6dbfdc0d4b826f787ec4e772dea8e3d2015cecbe2105632d468c28dcb"
-SRC_URI[cargo-snapshot-powerpc64le.sha256sum] = "016257f1641693008068bd086fec66d68550d1778f6aea9d06c9b263fca392d5"
+SRC_URI[rust-std-snapshot-powerpc64le.sha256sum] = "3ae0b74ba428c569fcecebbb09060ad0bd434a5f1fc9ffd1329b56941a897b6e"
+SRC_URI[rustc-snapshot-powerpc64le.sha256sum] = "b3dc2c082e76b5effe0b158aac3831830168a1a6980b39347c355e49be63fcca"
+SRC_URI[cargo-snapshot-powerpc64le.sha256sum] = "a4cdc00a42fd767bf5a296f7126d9db22a0a609cd956bbf0cb3eae882add1be7"
 
 SRC_URI += " \
     https://static.rust-lang.org/dist/${RUST_STD_SNAPSHOT}.tar.xz;name=rust-std-snapshot-${RUST_BUILD_ARCH};subdir=rust-snapshot-components \
diff --git a/meta/recipes-devtools/rust/rust-source.inc b/meta/recipes-devtools/rust/rust-source.inc
index ce6c983fc0b5..67f130d0ef4e 100644
--- a/meta/recipes-devtools/rust/rust-source.inc
+++ b/meta/recipes-devtools/rust/rust-source.inc
@@ -1,5 +1,5 @@
 SRC_URI += "https://static.rust-lang.org/dist/rustc-${PV}-src.tar.xz;name=rust"
-SRC_URI[rust.sha256sum] = "8f44af6dc44cc4146634a4dd5e4cc5470b3052a2337019b870c0e025e8987e0c"
+SRC_URI[rust.sha256sum] = "e8170d318fac9d2fc17d5c3e648e7068f56e8db8d233d864aeffbef7c6542eac"
 
 SRC_URI:append:class-target:pn-rust = " \
     file://hardcodepaths.patch \
diff --git a/meta/recipes-devtools/rust/rust_1.63.0.bb b/meta/recipes-devtools/rust/rust_1.64.0.bb
similarity index 100%
rename from meta/recipes-devtools/rust/rust_1.63.0.bb
rename to meta/recipes-devtools/rust/rust_1.64.0.bb
-- 
2.35.1


