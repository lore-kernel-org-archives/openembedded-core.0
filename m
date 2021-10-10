Return-Path: <alex.kanavin@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id A6969C433F5
	for <webhook@archiver.kernel.org>; Sun, 10 Oct 2021 19:10:13 +0000 (UTC)
Received: from mail-wr1-f44.google.com (mail-wr1-f44.google.com
 [209.85.221.44])
 by mx.groups.io with SMTP id smtpd.web09.2149.1633893012882641297
 for <openembedded-core@lists.openembedded.org>;
 Sun, 10 Oct 2021 12:10:13 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20210112 header.b=J65fVr8C;
 spf=pass (domain: gmail.com, ip: 209.85.221.44,
 mailfrom: alex.kanavin@gmail.com)
Received: by mail-wr1-f44.google.com with SMTP id v17so48513758wrv.9
        for <openembedded-core@lists.openembedded.org>;
 Sun, 10 Oct 2021 12:10:12 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:content-transfer-encoding;
        bh=GvhelrjXJZ+450lBnA5rJavbSURft7Zm1Wq386QCkRo=;
        b=J65fVr8C46UpbEAMMBSOzM0Rm2NBDidHcI583BoglzxeLJ3QcO0N2kHm/RdAn9STF4
         oWMS72B1+SCGYenlbM/E/WTeHLThbrNz+5fkLN/FKBSEPkO6gojM/hE/R7UPei3XvzFr
         vFTFeMf8h9kW7PmQ1u4/mkc0AJgSLXqMUnG0HAmGxl2QXm0j1xIJth2on3oJQwc5/6fv
         ssOkSURF4AEUbw3euhIfCmorAY0SY51+QGmmxfrQP4Hn48Rnjvthz0VMQDBNPM1jANh8
         MrCgeFmCOrIjqw34X5Qb10kT4mRVW8zEWBTPlSLGO2YbqebSSPY7ahcjbFXgV/h4ozUY
         reBQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=GvhelrjXJZ+450lBnA5rJavbSURft7Zm1Wq386QCkRo=;
        b=lKqnR6C71jnysgZEp3lOF1nKSwJOjUnKY0gO9atRPlBArIuaXT5l4jIzaoDzcJUDgU
         oKFDEd9c33Q0TszT2FCO5Gae0n0S+LtaNUR1diHjAr6j0lJIQ5mchk2vxx3WbBGFfVea
         wm0Y3Tv3soW/ffnrQRt6IOLe7pktDzY3TA1V7JWgjvjJvIGPrJ2U06scUZTl0yTzAygT
         Hnfa0d6PoAtJvcFMjpro2qVC6f87JxuxSwUmIp700mp+zsWXBLtqWpf6kdg01kDZtvl1
         6r9OnRsqqwpPwrdav1DUjbrQjcOYssFHFNctRTCIX57XrvxU1M7dhNY0nlrQQySGQtoj
         5JNw==
X-Gm-Message-State: AOAM533V3fFHgtwFy3IcsPEmNs1+BmgMaZCFq02d7JKq34tCWQdjOB7G
	pmDyMbxj/0UtAf2sZvLiA11cmKodQAk=
X-Google-Smtp-Source: 
 ABdhPJwmUUMpx8k78l1sc5GENncYBCqnZTimJTWxyJeWobu4ImG7+SSkjOgSYQfxmmxf4xUSejhfIg==
X-Received: by 2002:a1c:a747:: with SMTP id
 q68mr17122191wme.139.1633893011491;
        Sun, 10 Oct 2021 12:10:11 -0700 (PDT)
Received: from nereus.lab.linutronix.de. (b2b-109-90-143-203.unitymedia.biz.
 [109.90.143.203])
        by smtp.gmail.com with ESMTPSA id z6sm7962025wmp.1.2021.10.10.12.10.10
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 10 Oct 2021 12:10:11 -0700 (PDT)
From: Alexander Kanavin <alex.kanavin@gmail.com>
X-Google-Original-From: Alexander Kanavin <alex@linutronix.de>
To: openembedded-core@lists.openembedded.org
Cc: Alexander Kanavin <alex@linutronix.de>
Subject: [PATCH 02/13] rust: update 1.54.0 -> 1.55.0
Date: Sun, 10 Oct 2021 21:09:57 +0200
Message-Id: <20211010191008.4122049-2-alex@linutronix.de>
X-Mailer: git-send-email 2.20.1
In-Reply-To: <20211010191008.4122049-1-alex@linutronix.de>
References: <20211010191008.4122049-1-alex@linutronix.de>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Sun, 10 Oct 2021 19:10:13 -0000
X-Groupsio-URL: 
 https://lists.openembedded.org/g/openembedded-core/message/156795

Signed-off-by: Alexander Kanavin <alex@linutronix.de>
---
 meta/conf/distro/include/tcmode-default.inc      |  2 +-
 ..._1.54.0.bb => cargo-cross-canadian_1.55.0.bb} |  0
 .../cargo/{cargo_1.54.0.bb => cargo_1.55.0.bb}   |  0
 .../{libstd-rs_1.54.0.bb => libstd-rs_1.55.0.bb} |  0
 ...n_1.54.0.bb => rust-cross-canadian_1.55.0.bb} |  0
 ...rust-cross_1.54.0.bb => rust-cross_1.55.0.bb} |  0
 .../{rust-llvm_1.54.0.bb => rust-llvm_1.55.0.bb} |  0
 meta/recipes-devtools/rust/rust-snapshot.inc     | 16 ++++++++--------
 meta/recipes-devtools/rust/rust-source.inc       |  2 +-
 ....0.bb => rust-tools-cross-canadian_1.55.0.bb} |  0
 .../rust/{rust_1.54.0.bb => rust_1.55.0.bb}      |  0
 11 files changed, 10 insertions(+), 10 deletions(-)
 rename meta/recipes-devtools/cargo/{cargo-cross-canadian_1.54.0.bb => cargo-cross-canadian_1.55.0.bb} (100%)
 rename meta/recipes-devtools/cargo/{cargo_1.54.0.bb => cargo_1.55.0.bb} (100%)
 rename meta/recipes-devtools/rust/{libstd-rs_1.54.0.bb => libstd-rs_1.55.0.bb} (100%)
 rename meta/recipes-devtools/rust/{rust-cross-canadian_1.54.0.bb => rust-cross-canadian_1.55.0.bb} (100%)
 rename meta/recipes-devtools/rust/{rust-cross_1.54.0.bb => rust-cross_1.55.0.bb} (100%)
 rename meta/recipes-devtools/rust/{rust-llvm_1.54.0.bb => rust-llvm_1.55.0.bb} (100%)
 rename meta/recipes-devtools/rust/{rust-tools-cross-canadian_1.54.0.bb => rust-tools-cross-canadian_1.55.0.bb} (100%)
 rename meta/recipes-devtools/rust/{rust_1.54.0.bb => rust_1.55.0.bb} (100%)

diff --git a/meta/conf/distro/include/tcmode-default.inc b/meta/conf/distro/include/tcmode-default.inc
index 1ed18b0ee41..168bda2fd16 100644
--- a/meta/conf/distro/include/tcmode-default.inc
+++ b/meta/conf/distro/include/tcmode-default.inc
@@ -27,7 +27,7 @@ GOVERSION ?= "1.16%"
 # This can not use wildcards like 8.0.% since it is also used in mesa to denote
 # llvm version being used, so always bump it with llvm recipe version bump
 LLVMVERSION ?= "12.0.1"
-RUSTVERSION ?= "1.54.0"
+RUSTVERSION ?= "1.55.0"
 
 PREFERRED_VERSION_gcc ?= "${GCCVERSION}"
 PREFERRED_VERSION_gcc-cross-${TARGET_ARCH} ?= "${GCCVERSION}"
diff --git a/meta/recipes-devtools/cargo/cargo-cross-canadian_1.54.0.bb b/meta/recipes-devtools/cargo/cargo-cross-canadian_1.55.0.bb
similarity index 100%
rename from meta/recipes-devtools/cargo/cargo-cross-canadian_1.54.0.bb
rename to meta/recipes-devtools/cargo/cargo-cross-canadian_1.55.0.bb
diff --git a/meta/recipes-devtools/cargo/cargo_1.54.0.bb b/meta/recipes-devtools/cargo/cargo_1.55.0.bb
similarity index 100%
rename from meta/recipes-devtools/cargo/cargo_1.54.0.bb
rename to meta/recipes-devtools/cargo/cargo_1.55.0.bb
diff --git a/meta/recipes-devtools/rust/libstd-rs_1.54.0.bb b/meta/recipes-devtools/rust/libstd-rs_1.55.0.bb
similarity index 100%
rename from meta/recipes-devtools/rust/libstd-rs_1.54.0.bb
rename to meta/recipes-devtools/rust/libstd-rs_1.55.0.bb
diff --git a/meta/recipes-devtools/rust/rust-cross-canadian_1.54.0.bb b/meta/recipes-devtools/rust/rust-cross-canadian_1.55.0.bb
similarity index 100%
rename from meta/recipes-devtools/rust/rust-cross-canadian_1.54.0.bb
rename to meta/recipes-devtools/rust/rust-cross-canadian_1.55.0.bb
diff --git a/meta/recipes-devtools/rust/rust-cross_1.54.0.bb b/meta/recipes-devtools/rust/rust-cross_1.55.0.bb
similarity index 100%
rename from meta/recipes-devtools/rust/rust-cross_1.54.0.bb
rename to meta/recipes-devtools/rust/rust-cross_1.55.0.bb
diff --git a/meta/recipes-devtools/rust/rust-llvm_1.54.0.bb b/meta/recipes-devtools/rust/rust-llvm_1.55.0.bb
similarity index 100%
rename from meta/recipes-devtools/rust/rust-llvm_1.54.0.bb
rename to meta/recipes-devtools/rust/rust-llvm_1.55.0.bb
diff --git a/meta/recipes-devtools/rust/rust-snapshot.inc b/meta/recipes-devtools/rust/rust-snapshot.inc
index d448ffc7af1..71ac1024449 100644
--- a/meta/recipes-devtools/rust/rust-snapshot.inc
+++ b/meta/recipes-devtools/rust/rust-snapshot.inc
@@ -2,17 +2,17 @@
 ## snapshot info is taken from rust/src/stage0.txt
 ## TODO: find a way to add additional SRC_URIs based on the contents of an
 ##       earlier SRC_URI.
-RS_VERSION = "1.53.0"
-CARGO_VERSION = "1.53.0"
+RS_VERSION = "1.54.0"
+CARGO_VERSION = "1.54.0"
 
 # TODO: Add hashes for other architecture toolchains as well. Make a script?
-SRC_URI[rust-std-snapshot-x86_64.sha256sum] = "66d5257bbd194db08e67ca63a74cc80cdc4a36eaa30bf7dfe65861d9deaff7f7"
-SRC_URI[rustc-snapshot-x86_64.sha256sum] = "9c2f0443a546dd18f1f020c7711a7b9864432545ceb812e79315c1e76508b193"
-SRC_URI[cargo-snapshot-x86_64.sha256sum] = "e4437f6c83574fc60e183f4df439190f7610e4a669476802795645da66fbb83b"
+SRC_URI[rust-std-snapshot-x86_64.sha256sum] = "a22e19859b3c5032daac1633637546a986c51bdfa3ad0db6e394e6cc461f466b"
+SRC_URI[rustc-snapshot-x86_64.sha256sum] = "eafc06aba7128ee8592c16d7e3ae7b877e82c5d9779c9d07099558ed7e286296"
+SRC_URI[cargo-snapshot-x86_64.sha256sum] = "8a9c80b7dc5d47e6eafe173b81ad96244522c97d74214ba7da57a502d49b231c"
 
-SRC_URI[rust-std-snapshot-aarch64.sha256sum] = "fc261d0ff057c58b36057c30217bad1a29a9a3f257c70f5df88ad3f1d982386e"
-SRC_URI[rustc-snapshot-aarch64.sha256sum] = "a857e5c615f6b5b3afc6b707ae007b3b4624585b0b2ba9b38b553114db37f8d5"
-SRC_URI[cargo-snapshot-aarch64.sha256sum] = "4fa425a2d4633aeca67fa42695b3b9100f8b988dd1c21e60d6b2aa1164e55c0c"
+SRC_URI[rust-std-snapshot-aarch64.sha256sum] = "a1a77737d218087eb7d3613adcde2c9e383d758cdf128646a0ee63396145270b"
+SRC_URI[rustc-snapshot-aarch64.sha256sum] = "0e771c06435b6fa3087ce054c7f2f94b8ee36717997f32f97e2e3425739ac2b4"
+SRC_URI[cargo-snapshot-aarch64.sha256sum] = "b3b6e5358bf1ecd5d8d7e258a5632dac7d923b2aa8ab1c8c0f6aad62d9307b37"
 
 SRC_URI += " \
     https://static.rust-lang.org/dist/${RUST_STD_SNAPSHOT}.tar.xz;name=rust-std-snapshot-${BUILD_ARCH};subdir=rust-snapshot-components \
diff --git a/meta/recipes-devtools/rust/rust-source.inc b/meta/recipes-devtools/rust/rust-source.inc
index a1042d5f87a..b3feb6072ec 100644
--- a/meta/recipes-devtools/rust/rust-source.inc
+++ b/meta/recipes-devtools/rust/rust-source.inc
@@ -1,4 +1,4 @@
-SRC_URI[rust.sha256sum] = "a2934f85f76a35a3796c0fefd31e91f5b6dd8377cd8c3769c1c10e7ce7a495f4"
+SRC_URI[rust.sha256sum] = "aec85a7c1f40b7a40818a58ae13632f8a12cfaa4d3e2a10957d0e9d16dfdd556"
 SRC_URI += "https://static.rust-lang.org/dist/rustc-${PV}-src.tar.xz;name=rust"
 
 RUSTSRC = "${WORKDIR}/rustc-${PV}-src"
diff --git a/meta/recipes-devtools/rust/rust-tools-cross-canadian_1.54.0.bb b/meta/recipes-devtools/rust/rust-tools-cross-canadian_1.55.0.bb
similarity index 100%
rename from meta/recipes-devtools/rust/rust-tools-cross-canadian_1.54.0.bb
rename to meta/recipes-devtools/rust/rust-tools-cross-canadian_1.55.0.bb
diff --git a/meta/recipes-devtools/rust/rust_1.54.0.bb b/meta/recipes-devtools/rust/rust_1.55.0.bb
similarity index 100%
rename from meta/recipes-devtools/rust/rust_1.54.0.bb
rename to meta/recipes-devtools/rust/rust_1.55.0.bb
-- 
2.20.1


