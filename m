Return-Path: <raj.khem@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id A3853C369D3
	for <webhook@archiver.kernel.org>; Mon, 21 Apr 2025 17:29:28 +0000 (UTC)
Received: from mail-pg1-f172.google.com (mail-pg1-f172.google.com [209.85.215.172])
 by mx.groups.io with SMTP id smtpd.web10.20595.1745256559869234928
 for <openembedded-core@lists.openembedded.org>;
 Mon, 21 Apr 2025 10:29:19 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20230601 header.b=R0k1prIG;
 spf=pass (domain: gmail.com, ip: 209.85.215.172, mailfrom: raj.khem@gmail.com)
Received: by mail-pg1-f172.google.com with SMTP id 41be03b00d2f7-aee79a0f192so2662652a12.3
        for <openembedded-core@lists.openembedded.org>; Mon, 21 Apr 2025 10:29:19 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1745256559; x=1745861359; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=58ZSLQ95JZEBiCcDhMvn/uSz0pbOEFdUjOld1GjJWwU=;
        b=R0k1prIGVNIe7s+E50+t30ZqSQRN7py8cr75ENRxVZr2kK/5sUUyivEolo4I2ZTqw+
         XUYnYpdtMk7L+rJoR4VLzFVTSEwDdGeaMmkecbgmttHIBnYNpv78/fbfUkdd/223a4kz
         Tdwc96voK67ynIhc9IjtQQYHXb3fqcBDH7TLSdRsD7WHt8/kXbOv0QgG6p+De1rvidBJ
         6HpvTVTpCUW7UAE/sop9E/S/igLl7taaHC2eGOmG5Knh41dc0jcbm7LcBs3B5ytLk9eH
         Zd2asbIdJ3MgcfHWimjj38GlqvBNMhOq7zuftr60Lu+mSCh9qZF6+xRfIBYLvJJBVF74
         ncqA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1745256559; x=1745861359;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=58ZSLQ95JZEBiCcDhMvn/uSz0pbOEFdUjOld1GjJWwU=;
        b=S+y+xF79KWUCLfykVUVKaEZRDeAseUIDF1cAsKIiUmlB7OGEd1rh7VbL1teEgDtYec
         0yYjPfkqKR9wV5KOUX6UZZasebBorKWChtxkIY9h+OqmuSYWJ1fGQsnCM7m1p2C1nRTL
         z+N8Qm8poknAz8/fQ8MA+tKy0++kpOHh4Uzak9yM9zz9E10y+wD3u4FquDwu2p95kn+n
         m6ML+Q+21jg2NOOq90OBuPLebIT7irMHNx26KYmwAxzr/mGxIMb6wkevUn+m4cwL9tCd
         GkrCGlR/nMsG3CIoW/HOH1hmqXkNr6y8mZBZdMv6bRACV+43ufbwjdWZ/2fOupDC6EMu
         J+3A==
X-Gm-Message-State: AOJu0Yyvc1UOiMDlthqGfx9kzN93FDH2oJbaC1QWfPEjngJF3ZyjnMxY
	u4+ZvCUvlEdxwHE0jqiBUUHeW+VBWbROJIyLcNcOcPw6oVds5NidqDXPaJI7
X-Gm-Gg: ASbGncs7XXdxQepItHSYnSNBKJwJqmWI+/HldSMK/pBymLUgU7WX0ZWNcE9Z7qhwAFk
	aRYsFQN6/3h9dpRtnxKcXnde6G75fXxOmbD/YpPZ8mnD8lHvYKwDAY2A3fICVJHEFpU05yMGL3N
	YoPmYsEjVjxvvQqpQDu9MEaxGHhtFHj1iZKU6KdPRtapfFipm+i+CAPN35xO44tSE3GJG1lNTy4
	AYmfAwmWuP4w0zRlLLWca/yId9XfkXlWuZN3dlUqrOGUkjNLtFaL6iUFX8PcAgNpbhMle/sIxle
	nhHzhoTQr1hMFMDxfUxacv97JXiT1beEki5Pm//viNo=
X-Google-Smtp-Source: AGHT+IEr6hjRjbnjUH/rdt+kNrAVwgvvhpyulhQnw07Yf+elC7m+u0dX6OknOdQaSXIjuxVXOEx+sg==
X-Received: by 2002:a05:6a21:3417:b0:1f5:7fcb:397d with SMTP id adf61e73a8af0-203cbc52403mr17692200637.16.1745256558925;
        Mon, 21 Apr 2025 10:29:18 -0700 (PDT)
Received: from apollo.localdomain ([2601:646:8201:fd20::a1f1])
        by smtp.gmail.com with ESMTPSA id 41be03b00d2f7-b0db13c5f8bsm5873027a12.35.2025.04.21.10.29.18
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 21 Apr 2025 10:29:18 -0700 (PDT)
From: Khem Raj <raj.khem@gmail.com>
To: openembedded-core@lists.openembedded.org
Cc: Khem Raj <raj.khem@gmail.com>,
	Jacob Kroon <jacob.kroon@gmail.com>,
	Martin Jansa <Martin.Jansa@gmail.com>
Subject: [PATCH v3 2/2] bitbake.conf: Switch prefix mapping to use -ffile-prefix-map
Date: Mon, 21 Apr 2025 10:29:15 -0700
Message-ID: <20250421172915.1651803-2-raj.khem@gmail.com>
X-Mailer: git-send-email 2.49.0
In-Reply-To: <20250421172915.1651803-1-raj.khem@gmail.com>
References: <20250421172915.1651803-1-raj.khem@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Mon, 21 Apr 2025 17:29:28 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/215180

-ffile-prefix map is more comprehensive when it comes to reproducible
builds and its superset of all prefix-mapping options in compilers

This makes is cleaner and workable across gcc and clang, clang does not
support -fcanon-prefix-map and it has to be explicitly omitted when using
clang.

There are lambdas generated in templates by clang which still get the
absolute paths despite -fdebug-prefix-map, this helps with that as well.

nasm is an outlier and we have fixed it by adding -fdebug-prefix-map option
luckily we do not pass DEBUG_PREFIX_MAP to nasm, in all recipes which use
nasm either pass -fdebug-prefix-map explicitly to nasm or they rewrite it
to use nasm flags syntax.

We have discussed this in past [1]

[1] https://patchwork.yoctoproject.org/project/oe-core/patch/20230428032030.2047920-1-raj.khem@gmail.com/#10281

Signed-off-by: Khem Raj <raj.khem@gmail.com>
Cc: Jacob Kroon <jacob.kroon@gmail.com>
Cc: Martin Jansa <Martin.Jansa@gmail.com>
---
v2: Drop using --ffile-prefix in go
v3: Fix copydebugsources to use --file-prefix-map instead of -fdebug-prefix-map
    and few more places

 meta/classes-recipe/kernel-arch.bbclass            |  6 ++----
 meta/conf/bitbake.conf                             | 14 +++++---------
 meta/lib/oe/package.py                             |  2 +-
 meta/recipes-devtools/gcc/libgfortran.inc          |  2 +-
 .../python/python3-maturin_1.8.3.bb                |  2 +-
 meta/recipes-devtools/rust/cargo_1.85.1.bb         |  2 +-
 6 files changed, 11 insertions(+), 17 deletions(-)

diff --git a/meta/classes-recipe/kernel-arch.bbclass b/meta/classes-recipe/kernel-arch.bbclass
index 968551267f9..7aea9cd3e8e 100644
--- a/meta/classes-recipe/kernel-arch.bbclass
+++ b/meta/classes-recipe/kernel-arch.bbclass
@@ -73,10 +73,8 @@ HOST_OBJCOPY_KERNEL_ARCH ?= "${TARGET_OBJCOPY_KERNEL_ARCH}"
 
 KERNEL_CC = "${CCACHE}${HOST_PREFIX}gcc ${HOST_CC_KERNEL_ARCH} \
  -fuse-ld=bfd ${DEBUG_PREFIX_MAP} \
- -fdebug-prefix-map=${STAGING_KERNEL_DIR}=${KERNEL_SRC_PATH} \
- -fmacro-prefix-map=${STAGING_KERNEL_DIR}=${KERNEL_SRC_PATH} \
- -fdebug-prefix-map=${STAGING_KERNEL_BUILDDIR}=${KERNEL_SRC_PATH} \
- -fmacro-prefix-map=${STAGING_KERNEL_BUILDDIR}=${KERNEL_SRC_PATH} \
+ -ffile-prefix-map=${STAGING_KERNEL_DIR}=${KERNEL_SRC_PATH} \
+ -ffile-prefix-map=${STAGING_KERNEL_BUILDDIR}=${KERNEL_SRC_PATH} \
 "
 KERNEL_LD = "${HOST_PREFIX}ld.bfd ${HOST_LD_KERNEL_ARCH}"
 KERNEL_AR = "${HOST_PREFIX}ar ${HOST_AR_KERNEL_ARCH}"
diff --git a/meta/conf/bitbake.conf b/meta/conf/bitbake.conf
index 8f90026f7c2..b4e1964f77d 100644
--- a/meta/conf/bitbake.conf
+++ b/meta/conf/bitbake.conf
@@ -652,15 +652,11 @@ EXTRA_OEMAKE:prepend:task-install = "${PARALLEL_MAKEINST} "
 ##################################################################
 TARGET_DBGSRC_DIR ?= "/usr/src/debug/${PN}/${PV}"
 # Beware: applied last to first
-DEBUG_PREFIX_MAP ?= "-fcanon-prefix-map \
- -fmacro-prefix-map=${S}=${TARGET_DBGSRC_DIR} \
- -fdebug-prefix-map=${S}=${TARGET_DBGSRC_DIR} \
- -fmacro-prefix-map=${B}=${TARGET_DBGSRC_DIR} \
- -fdebug-prefix-map=${B}=${TARGET_DBGSRC_DIR} \
- -fdebug-prefix-map=${STAGING_DIR_HOST}= \
- -fmacro-prefix-map=${STAGING_DIR_HOST}= \
- -fdebug-prefix-map=${STAGING_DIR_NATIVE}= \
- -fmacro-prefix-map=${STAGING_DIR_NATIVE}= \
+DEBUG_PREFIX_MAP ?= "\
+ -ffile-prefix-map=${S}=${TARGET_DBGSRC_DIR} \
+ -ffile-prefix-map=${B}=${TARGET_DBGSRC_DIR} \
+ -ffile-prefix-map=${STAGING_DIR_HOST}= \
+ -ffile-prefix-map=${STAGING_DIR_NATIVE}= \
 "
 DEBUG_LEVELFLAG ?= "-g"
 
diff --git a/meta/lib/oe/package.py b/meta/lib/oe/package.py
index 0db14f21642..0bcc04ea54a 100644
--- a/meta/lib/oe/package.py
+++ b/meta/lib/oe/package.py
@@ -991,7 +991,7 @@ def copydebugsources(debugsrcdir, sources, d):
 
         prefixmap = {}
         for flag in cflags.split():
-            if not flag.startswith("-fdebug-prefix-map"):
+            if not flag.startswith("-ffile-prefix-map"):
                 continue
             if "recipe-sysroot" in flag:
                 continue
diff --git a/meta/recipes-devtools/gcc/libgfortran.inc b/meta/recipes-devtools/gcc/libgfortran.inc
index 4560421ed1f..fa6aecaaa30 100644
--- a/meta/recipes-devtools/gcc/libgfortran.inc
+++ b/meta/recipes-devtools/gcc/libgfortran.inc
@@ -8,7 +8,7 @@ EXTRA_OECONF_PATHS = "\
 # An arm hard float target like raspberrypi4 won't build
 # as CFLAGS don't make it to the fortran compiler otherwise
 # (the configure script sets FC to $GFORTRAN unconditionally)
-export GFORTRAN = "${FC} -fcanon-prefix-map -fdebug-prefix-map=${S}=${TARGET_DBGSRC_DIR} -fdebug-prefix-map=${B}=${TARGET_DBGSRC_DIR} -gno-record-gcc-switches"
+export GFORTRAN = "${FC} -ffile-prefix-map=${S}=${TARGET_DBGSRC_DIR} -ffile-prefix-map=${B}=${TARGET_DBGSRC_DIR} -gno-record-gcc-switches"
 
 do_configure () {
 	for target in libbacktrace libgfortran
diff --git a/meta/recipes-devtools/python/python3-maturin_1.8.3.bb b/meta/recipes-devtools/python/python3-maturin_1.8.3.bb
index 3ec4d0c103b..08975e177f0 100644
--- a/meta/recipes-devtools/python/python3-maturin_1.8.3.bb
+++ b/meta/recipes-devtools/python/python3-maturin_1.8.3.bb
@@ -10,7 +10,7 @@ SRC_URI[sha256sum] = "304762f86fd53a8031b1bf006d12572a2aa0a5235485031113195cc015
 
 S = "${WORKDIR}/maturin-${PV}"
 
-CFLAGS += "-fdebug-prefix-map=${CARGO_HOME}=${TARGET_DBGSRC_DIR}/cargo_home"
+CFLAGS += "-ffile-prefix-map=${CARGO_HOME}=${TARGET_DBGSRC_DIR}/cargo_home"
 
 DEPENDS += "\
     python3-setuptools-rust-native \
diff --git a/meta/recipes-devtools/rust/cargo_1.85.1.bb b/meta/recipes-devtools/rust/cargo_1.85.1.bb
index db18ecfda9a..150c2d2b801 100644
--- a/meta/recipes-devtools/rust/cargo_1.85.1.bb
+++ b/meta/recipes-devtools/rust/cargo_1.85.1.bb
@@ -19,7 +19,7 @@ CARGO_VENDORING_DIRECTORY = "${RUSTSRC}/vendor"
 
 inherit cargo pkgconfig
 
-DEBUG_PREFIX_MAP += "-fdebug-prefix-map=${RUSTSRC}/vendor=${TARGET_DBGSRC_DIR}"
+DEBUG_PREFIX_MAP += "-ffile-prefix-map=${RUSTSRC}/vendor=${TARGET_DBGSRC_DIR}"
 
 do_cargo_setup_snapshot () {
 	${UNPACKDIR}/rust-snapshot-components/${CARGO_SNAPSHOT}/install.sh --prefix="${WORKDIR}/${CARGO_SNAPSHOT}" --disable-ldconfig

