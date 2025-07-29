Return-Path: <raj.khem@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 6D345C83F26
	for <webhook@archiver.kernel.org>; Tue, 29 Jul 2025 16:37:03 +0000 (UTC)
Received: from mail-pl1-f175.google.com (mail-pl1-f175.google.com [209.85.214.175])
 by mx.groups.io with SMTP id smtpd.web10.12689.1753807020991177358
 for <openembedded-core@lists.openembedded.org>;
 Tue, 29 Jul 2025 09:37:01 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20230601 header.b=jYG/KmgK;
 spf=pass (domain: gmail.com, ip: 209.85.214.175, mailfrom: raj.khem@gmail.com)
Received: by mail-pl1-f175.google.com with SMTP id d9443c01a7336-23c8f179e1bso66384865ad.1
        for <openembedded-core@lists.openembedded.org>; Tue, 29 Jul 2025 09:37:00 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1753807020; x=1754411820; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=5XHDa0Qb48+ODAzsN1xGkdAG2AV2RZ985EzawiI2qJY=;
        b=jYG/KmgKJ4ioUvx+/VF0CSTK7ThEjagg3+8rAR5RQ3uXHOWQnP5/s+o7/rWJBJGdjI
         5L+VBaQE430tEzd4cr0DwGEXUtLMzXeoxsgs5APiQ7hvPaHgipZ97/3WZCZeOHsmRoCW
         5pYsez2Ln6g4Lr+C2s9juai7p1ZtaUkL+ZoBOawTvCFwLuXeU/4ROciMgnj8uE6LwpOu
         YkNZJJQCiPsQgl9BOlaUD35TNeOFiocMNZKYwUFOn5oTMG6UZaLoo517DCBEmHy2nQLJ
         Zs/7XqHQIuyTF/0WU5aJgFV7BLBlSz2lW5chsiPd/ct/PQemK7rTMf8pxb+QgbODPUyL
         nb3g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1753807020; x=1754411820;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=5XHDa0Qb48+ODAzsN1xGkdAG2AV2RZ985EzawiI2qJY=;
        b=fVbUV6MOtZ20A5j49lPKpionqdd6f68BmLwCcgb24tSBgFi4BwLBt7/+m7AOJ78Fzw
         JT1Xo4ntBM1n5376dVP4uTjwLqxpQbgdrp7atpz7I53Ly4dyo751PX91sZbwdtEk0rXU
         sJFYOPtoUbxUISxQeLNAvPumtFmAT5KcB+SDsuMekLKVeMe2FAHG4NH8bEl7y9HkdrrN
         3s8qflxd4NzQhIDh+i+zfKPDimpMBwm+LAiVKlXJa4XhzYDwI7mKd4HATkUQeiBJzGv7
         WSvTny22Oux10fxXdTYAErUBq5hk12HQCJt2uhZieh6k7UTjY3aP4wVHuOtqoEvmWRE3
         Neqw==
X-Gm-Message-State: AOJu0YweIfqB0B5dHn62TeK2zLlLPQOonizAlUPV1yC8m5lEOw9JCIuE
	+1Mqv6q9vXLDPnk8R/FcreF+06fzy5qGeaA91zkEKAtVFY4Ne2ZUrLTKoWXGLotsZkU=
X-Gm-Gg: ASbGncsNBEc0lG6/ZQOGU0j91HvqK3aVen3k78SjArQwtasC+nPDU3H2Icze4L/1O+M
	EEEPx7JzVqyayII96wd4ijboKqxk7V1eca590hcGUhpUg6uuwXKh28EMTwsn8L23YE3SdqifV9y
	cVP6g2l5tYuIObQm4jjFaSP2MOozVLn5CM+rfNcgnw7MqD+mYaymZM29Dm8b0whVMPzh84ENCdp
	zmRM9BPnsCi7zwgsmEmneMndZucF2Z9Eji2wvSc+KmBe84qNA++pUFd6GXABDdZ/gex0opAjji2
	7rlda7I8R024NFotqtB2Vctz5NDzkn/LvxQyRAXsba4HpIt6jBc1EDPxS9cIqDzjnGkjszYIwTl
	UUmSer+CZ17ieig==
X-Google-Smtp-Source: AGHT+IHNA72F8ZavOUbPLQttxMnsv7kQsT9/m+U1yGOaUJ0n8mLBLqYeseTDOTL9I4/Tpg+ki1RGMw==
X-Received: by 2002:a17:903:2290:b0:240:7c39:9e25 with SMTP id d9443c01a7336-24096b4c484mr763575ad.27.1753807019011;
        Tue, 29 Jul 2025 09:36:59 -0700 (PDT)
Received: from apollo.localdomain ([2601:646:8201:fd20::33e9])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-2408fe58baasm4263125ad.189.2025.07.29.09.36.57
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 29 Jul 2025 09:36:57 -0700 (PDT)
From: Khem Raj <raj.khem@gmail.com>
To: openembedded-core@lists.openembedded.org
Cc: Khem Raj <raj.khem@gmail.com>
Subject: [PATCH] binutils: Upgrade to 2.45 release
Date: Tue, 29 Jul 2025 09:36:55 -0700
Message-ID: <20250729163655.3076122-1-raj.khem@gmail.com>
X-Mailer: git-send-email 2.50.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Tue, 29 Jul 2025 16:37:03 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/221083

Added support for SFrame stack tracing with ELF binaries on x86 and AArch64 architectures.
Support for various new RISC-V extensions
Support for most Armv9.6 extensions.

Detailed release notes are here [1]

[1] https://lists.gnu.org/archive/html/info-gnu/2025-07/msg00009.html

Signed-off-by: Khem Raj <raj.khem@gmail.com>
---
 .../{binutils-2.44.inc => binutils-2.45.inc}  |   18 +-
 ....44.bb => binutils-cross-canadian_2.45.bb} |    0
 ...s-cross_2.44.bb => binutils-cross_2.45.bb} |    0
 ...ssdk_2.44.bb => binutils-crosssdk_2.45.bb} |    0
 ...ite_2.44.bb => binutils-testsuite_2.45.bb} |    0
 ...s-crosssdk-Generate-relocatable-SDKs.patch |    2 +-
 ...o-not-generate-linker-script-directo.patch |    2 +-
 ...dk-Search-for-alternative-ld.so.conf.patch |    8 +-
 ...004-Point-scripts-location-to-libdir.patch |    2 +-
 ...stro-compiler-point-to-the-wrong-ins.patch |    6 +-
 ...-system-directories-when-cross-linki.patch |   68 +-
 ...ect-assembling-for-ppc-wait-mnemonic.patch |    8 +-
 .../binutils/0008-Use-libtool-2.4.patch       | 2383 ++++-------------
 ...h-in-libtool-when-sysroot-is-enabled.patch |    2 +-
 .../0010-sync-with-OE-libtool-changes.patch   |    2 +-
 ...or-clang-before-checking-gcc-version.patch |    2 +-
 ...-RPATH-entry-if-LD_RUN_PATH-is-not-e.patch |    6 +-
 ...sing-_Alignof-when-using-C11-or-newe.patch |    2 +-
 ...-pe-dll.o-entry-deom-targ_extra_ofil.patch |    2 +-
 .../binutils/0015-CVE-2025-1178.patch         |   33 -
 .../binutils/0016-CVE-2025-1181-1.patch       |  141 -
 .../binutils/0017-CVE-2025-1181-2.patch       |  337 ---
 .../binutils/0018-CVE-2025-5245.patch         |   38 -
 .../binutils/0019-CVE-2025-3198.patch         |   28 -
 .../binutils/0019-CVE-2025-5244.patch         |   25 -
 .../binutils/0020-CVE-2025-7545.patch         |   39 -
 .../binutils/0020-CVE-2025-7546.patch         |   58 -
 .../binutils/binutils/CVE-2025-1180.patch     |  165 --
 .../binutils/binutils/CVE-2025-1182.patch     |   36 -
 .../{binutils_2.44.bb => binutils_2.45.bb}    |    0
 30 files changed, 574 insertions(+), 2839 deletions(-)
 rename meta/recipes-devtools/binutils/{binutils-2.44.inc => binutils-2.45.inc} (77%)
 rename meta/recipes-devtools/binutils/{binutils-cross-canadian_2.44.bb => binutils-cross-canadian_2.45.bb} (100%)
 rename meta/recipes-devtools/binutils/{binutils-cross_2.44.bb => binutils-cross_2.45.bb} (100%)
 rename meta/recipes-devtools/binutils/{binutils-crosssdk_2.44.bb => binutils-crosssdk_2.45.bb} (100%)
 rename meta/recipes-devtools/binutils/{binutils-testsuite_2.44.bb => binutils-testsuite_2.45.bb} (100%)
 delete mode 100644 meta/recipes-devtools/binutils/binutils/0015-CVE-2025-1178.patch
 delete mode 100644 meta/recipes-devtools/binutils/binutils/0016-CVE-2025-1181-1.patch
 delete mode 100644 meta/recipes-devtools/binutils/binutils/0017-CVE-2025-1181-2.patch
 delete mode 100644 meta/recipes-devtools/binutils/binutils/0018-CVE-2025-5245.patch
 delete mode 100644 meta/recipes-devtools/binutils/binutils/0019-CVE-2025-3198.patch
 delete mode 100644 meta/recipes-devtools/binutils/binutils/0019-CVE-2025-5244.patch
 delete mode 100644 meta/recipes-devtools/binutils/binutils/0020-CVE-2025-7545.patch
 delete mode 100644 meta/recipes-devtools/binutils/binutils/0020-CVE-2025-7546.patch
 delete mode 100644 meta/recipes-devtools/binutils/binutils/CVE-2025-1180.patch
 delete mode 100644 meta/recipes-devtools/binutils/binutils/CVE-2025-1182.patch
 rename meta/recipes-devtools/binutils/{binutils_2.44.bb => binutils_2.45.bb} (100%)

diff --git a/meta/recipes-devtools/binutils/binutils-2.44.inc b/meta/recipes-devtools/binutils/binutils-2.45.inc
similarity index 77%
rename from meta/recipes-devtools/binutils/binutils-2.44.inc
rename to meta/recipes-devtools/binutils/binutils-2.45.inc
index 3313e011bfd..0a9b93f432b 100644
--- a/meta/recipes-devtools/binutils/binutils-2.44.inc
+++ b/meta/recipes-devtools/binutils/binutils-2.45.inc
@@ -12,15 +12,15 @@ LIC_FILES_CHKSUM = "\
 
 # When upgrading to next major release, ensure that there is no trailing .0, so
 # that upstream version check can work correctly.
-PV = "2.44"
-CVE_VERSION = "2.44"
-SRCBRANCH ?= "binutils-2_44-branch"
+PV = "2.45"
+CVE_VERSION = "2.45"
+SRCBRANCH ?= "binutils-2_45-branch"
 
 UPSTREAM_CHECK_GITTAGREGEX = "binutils-(?P<pver>\d+_(\d_?)*)"
 
 CVE_STATUS[CVE-2025-1153] = "cpe-stable-backport: fix available in used git hash"
 
-SRCREV ?= "8e98f97aecb0f0a1a1e2ef244e9aa235248ef8fa"
+SRCREV ?= "2bc7af1ff7732451b6a7b09462a815c3284f9613"
 BINUTILS_GIT_URI ?= "git://sourceware.org/git/binutils-gdb.git;branch=${SRCBRANCH};protocol=https"
 SRC_URI = "\
      ${BINUTILS_GIT_URI} \
@@ -35,14 +35,4 @@ SRC_URI = "\
      file://0012-Only-generate-an-RPATH-entry-if-LD_RUN_PATH-is-not-e.patch \
      file://0013-Define-alignof-using-_Alignof-when-using-C11-or-newe.patch \
      file://0014-Remove-duplicate-pe-dll.o-entry-deom-targ_extra_ofil.patch \
-     file://0015-CVE-2025-1178.patch \
-     file://CVE-2025-1180.patch \
-     file://CVE-2025-1182.patch \
-     file://0016-CVE-2025-1181-1.patch \
-     file://0017-CVE-2025-1181-2.patch \
-     file://0018-CVE-2025-5245.patch \
-     file://0019-CVE-2025-5244.patch \
-     file://0019-CVE-2025-3198.patch \
-     file://0020-CVE-2025-7546.patch \
-     file://0020-CVE-2025-7545.patch \
 "
diff --git a/meta/recipes-devtools/binutils/binutils-cross-canadian_2.44.bb b/meta/recipes-devtools/binutils/binutils-cross-canadian_2.45.bb
similarity index 100%
rename from meta/recipes-devtools/binutils/binutils-cross-canadian_2.44.bb
rename to meta/recipes-devtools/binutils/binutils-cross-canadian_2.45.bb
diff --git a/meta/recipes-devtools/binutils/binutils-cross_2.44.bb b/meta/recipes-devtools/binutils/binutils-cross_2.45.bb
similarity index 100%
rename from meta/recipes-devtools/binutils/binutils-cross_2.44.bb
rename to meta/recipes-devtools/binutils/binutils-cross_2.45.bb
diff --git a/meta/recipes-devtools/binutils/binutils-crosssdk_2.44.bb b/meta/recipes-devtools/binutils/binutils-crosssdk_2.45.bb
similarity index 100%
rename from meta/recipes-devtools/binutils/binutils-crosssdk_2.44.bb
rename to meta/recipes-devtools/binutils/binutils-crosssdk_2.45.bb
diff --git a/meta/recipes-devtools/binutils/binutils-testsuite_2.44.bb b/meta/recipes-devtools/binutils/binutils-testsuite_2.45.bb
similarity index 100%
rename from meta/recipes-devtools/binutils/binutils-testsuite_2.44.bb
rename to meta/recipes-devtools/binutils/binutils-testsuite_2.45.bb
diff --git a/meta/recipes-devtools/binutils/binutils/0001-binutils-crosssdk-Generate-relocatable-SDKs.patch b/meta/recipes-devtools/binutils/binutils/0001-binutils-crosssdk-Generate-relocatable-SDKs.patch
index 2443897cad1..ad0b5b9cc46 100644
--- a/meta/recipes-devtools/binutils/binutils/0001-binutils-crosssdk-Generate-relocatable-SDKs.patch
+++ b/meta/recipes-devtools/binutils/binutils/0001-binutils-crosssdk-Generate-relocatable-SDKs.patch
@@ -1,4 +1,4 @@
-From df3faaf0a09fd828330d3bac45782868a04f7bc0 Mon Sep 17 00:00:00 2001
+From 61cfb723b5fba70c823a9b486a9e4f30b28a8f53 Mon Sep 17 00:00:00 2001
 From: Khem Raj <raj.khem@gmail.com>
 Date: Mon, 2 Mar 2015 01:58:54 +0000
 Subject: [PATCH] binutils-crosssdk: Generate relocatable SDKs
diff --git a/meta/recipes-devtools/binutils/binutils/0002-binutils-cross-Do-not-generate-linker-script-directo.patch b/meta/recipes-devtools/binutils/binutils/0002-binutils-cross-Do-not-generate-linker-script-directo.patch
index 20459fce663..58ac2f721f7 100644
--- a/meta/recipes-devtools/binutils/binutils/0002-binutils-cross-Do-not-generate-linker-script-directo.patch
+++ b/meta/recipes-devtools/binutils/binutils/0002-binutils-cross-Do-not-generate-linker-script-directo.patch
@@ -1,4 +1,4 @@
-From 3105d7ecc3f16d66c19985a6557cd1e9becfab55 Mon Sep 17 00:00:00 2001
+From 82bbbee7c31f64e51e6221fbbd29760ac61b789f Mon Sep 17 00:00:00 2001
 From: Khem Raj <raj.khem@gmail.com>
 Date: Mon, 6 Mar 2017 23:37:05 -0800
 Subject: [PATCH] binutils-cross: Do not generate linker script directories
diff --git a/meta/recipes-devtools/binutils/binutils/0003-binutils-nativesdk-Search-for-alternative-ld.so.conf.patch b/meta/recipes-devtools/binutils/binutils/0003-binutils-nativesdk-Search-for-alternative-ld.so.conf.patch
index 374fbd6f413..4df386fe959 100644
--- a/meta/recipes-devtools/binutils/binutils/0003-binutils-nativesdk-Search-for-alternative-ld.so.conf.patch
+++ b/meta/recipes-devtools/binutils/binutils/0003-binutils-nativesdk-Search-for-alternative-ld.so.conf.patch
@@ -1,4 +1,4 @@
-From d718e17e1668880a85ff05993f0027d9c9ad6935 Mon Sep 17 00:00:00 2001
+From 96b52f92b2888e1954f619bffd17a3f55be2e27e Mon Sep 17 00:00:00 2001
 From: Richard Purdie <richard.purdie@linuxfoundation.org>
 Date: Wed, 19 Feb 2020 09:51:16 -0800
 Subject: [PATCH] binutils-nativesdk: Search for alternative ld.so.conf in SDK
@@ -57,7 +57,7 @@ index 3e24bd4deb2..23d4f1f3132 100644
  AM_CFLAGS = $(WARN_CFLAGS) $(ELF_CFLAGS) $(JANSSON_CFLAGS) $(ZSTD_CFLAGS)
  
 diff --git a/ld/ldelf.c b/ld/ldelf.c
-index 4a1aa044e70..f6f3ac11a76 100644
+index f4f27fc3873..a870c39bd81 100644
 --- a/ld/ldelf.c
 +++ b/ld/ldelf.c
 @@ -943,7 +943,7 @@ ldelf_check_ld_so_conf (const struct bfd_link_needed_list *l, int force,
@@ -70,10 +70,10 @@ index 4a1aa044e70..f6f3ac11a76 100644
        if (!ldelf_parse_ld_so_conf (&info, tmppath))
  	{
 diff --git a/ld/ldmain.c b/ld/ldmain.c
-index f1c5f7035c5..cce4991b25a 100644
+index 67c60c3f80d..7878bd3922f 100644
 --- a/ld/ldmain.c
 +++ b/ld/ldmain.c
-@@ -69,6 +69,7 @@ char *program_name;
+@@ -74,6 +74,7 @@ char *program_name;
  
  /* The prefix for system library directories.  */
  const char *ld_sysroot;
diff --git a/meta/recipes-devtools/binutils/binutils/0004-Point-scripts-location-to-libdir.patch b/meta/recipes-devtools/binutils/binutils/0004-Point-scripts-location-to-libdir.patch
index 8a24408f4ff..5ead477bb81 100644
--- a/meta/recipes-devtools/binutils/binutils/0004-Point-scripts-location-to-libdir.patch
+++ b/meta/recipes-devtools/binutils/binutils/0004-Point-scripts-location-to-libdir.patch
@@ -1,4 +1,4 @@
-From 0ff4f23d3521a45835eaa03731c0b3351a50d8ba Mon Sep 17 00:00:00 2001
+From 94c43a338e789b32a31e830c971ac52332c3fe5a Mon Sep 17 00:00:00 2001
 From: Khem Raj <raj.khem@gmail.com>
 Date: Mon, 2 Mar 2015 01:09:58 +0000
 Subject: [PATCH] Point scripts location to libdir
diff --git a/meta/recipes-devtools/binutils/binutils/0005-don-t-let-the-distro-compiler-point-to-the-wrong-ins.patch b/meta/recipes-devtools/binutils/binutils/0005-don-t-let-the-distro-compiler-point-to-the-wrong-ins.patch
index 4a1cd34f29d..74086b600cf 100644
--- a/meta/recipes-devtools/binutils/binutils/0005-don-t-let-the-distro-compiler-point-to-the-wrong-ins.patch
+++ b/meta/recipes-devtools/binutils/binutils/0005-don-t-let-the-distro-compiler-point-to-the-wrong-ins.patch
@@ -1,4 +1,4 @@
-From 340d2cf058b373ed4fbf6bcea4f6674eab23c73a Mon Sep 17 00:00:00 2001
+From 7e78955c1995a39c847013b909627f77c41ca232 Mon Sep 17 00:00:00 2001
 From: Khem Raj <raj.khem@gmail.com>
 Date: Mon, 2 Mar 2015 01:39:01 +0000
 Subject: [PATCH] don't let the distro compiler point to the wrong installation
@@ -17,10 +17,10 @@ Signed-off-by: Khem Raj <raj.khem@gmail.com>
  1 file changed, 2 insertions(+), 1 deletion(-)
 
 diff --git a/libiberty/Makefile.in b/libiberty/Makefile.in
-index b11df756b4b..f47269fdc0e 100644
+index d507f27a9ef..462d47b2eb1 100644
 --- a/libiberty/Makefile.in
 +++ b/libiberty/Makefile.in
-@@ -385,7 +385,8 @@ install-strip: install
+@@ -387,7 +387,8 @@ install-strip: install
  # multilib-specific flags, it's overridden by FLAGS_TO_PASS from the
  # default multilib, so we have to take CFLAGS into account as well,
  # since it will be passed the multilib flags.
diff --git a/meta/recipes-devtools/binutils/binutils/0006-warn-for-uses-of-system-directories-when-cross-linki.patch b/meta/recipes-devtools/binutils/binutils/0006-warn-for-uses-of-system-directories-when-cross-linki.patch
index e094c89d1a0..86ff7fdaa02 100644
--- a/meta/recipes-devtools/binutils/binutils/0006-warn-for-uses-of-system-directories-when-cross-linki.patch
+++ b/meta/recipes-devtools/binutils/binutils/0006-warn-for-uses-of-system-directories-when-cross-linki.patch
@@ -1,4 +1,4 @@
-From e9297b35595d7dd6c50ce6ff7282eee248b7e479 Mon Sep 17 00:00:00 2001
+From 05dcd732a4b91ecd77f37fabd8a1a14209467816 Mon Sep 17 00:00:00 2001
 From: Khem Raj <raj.khem@gmail.com>
 Date: Fri, 15 Jan 2016 06:31:09 +0000
 Subject: [PATCH] warn for uses of system directories when cross linking
@@ -52,7 +52,7 @@ Signed-off-by: Scott Garman <scott.a.garman@intel.com>
 Signed-off-by: Khem Raj <raj.khem@gmail.com>
 ---
  ld/config.in    |  3 +++
- ld/configure    | 16 ++++++++++++++++
+ ld/configure    | 20 ++++++++++++++++++--
  ld/configure.ac | 10 ++++++++++
  ld/ld.h         |  8 ++++++++
  ld/ld.texi      | 12 ++++++++++++
@@ -60,10 +60,10 @@ Signed-off-by: Khem Raj <raj.khem@gmail.com>
  ld/ldlex.h      |  2 ++
  ld/ldmain.c     |  6 ++++--
  ld/lexsup.c     | 15 +++++++++++++++
- 9 files changed, 87 insertions(+), 2 deletions(-)
+ 9 files changed, 89 insertions(+), 4 deletions(-)
 
 diff --git a/ld/config.in b/ld/config.in
-index 2d7b6406d2b..37cd12d20fa 100644
+index 37812241bd9..be89571196c 100644
 --- a/ld/config.in
 +++ b/ld/config.in
 @@ -78,6 +78,9 @@
@@ -77,27 +77,45 @@ index 2d7b6406d2b..37cd12d20fa 100644
  #undef EXTRA_SHLIB_EXTENSION
  
 diff --git a/ld/configure b/ld/configure
-index 597d110f57a..d537ec391d2 100755
+index 4afc58566fc..ca3d58ff618 100755
 --- a/ld/configure
 +++ b/ld/configure
-@@ -844,6 +844,7 @@ with_lib_path
+@@ -841,6 +841,7 @@ enable_checking
+ with_lib_path
  enable_targets
- enable_64_bit_bfd
  with_sysroot
 +enable_poison_system_directories
  enable_gold
  enable_got
  enable_compressed_debug_sections
-@@ -1537,6 +1538,8 @@ Optional Features:
+@@ -1533,6 +1534,8 @@ Optional Features:
+   --disable-largefile     omit support for large files
    --enable-checking       enable run-time checks
    --enable-targets        alternative target configurations
-   --enable-64-bit-bfd     64-bit support (on hosts with narrower word sizes)
 +  --enable-poison-system-directories
 +                          warn for use of native system library directories
    --enable-gold[=ARG]     build gold [ARG={default,yes,no}]
    --enable-got=<type>     GOT handling scheme (target, single, negative,
                            multigot)
-@@ -15571,6 +15574,19 @@ fi
+@@ -11514,7 +11517,7 @@ else
+   lt_dlunknown=0; lt_dlno_uscore=1; lt_dlneed_uscore=2
+   lt_status=$lt_dlunknown
+   cat > conftest.$ac_ext <<_LT_EOF
+-#line 11517 "configure"
++#line 11520 "configure"
+ #include "confdefs.h"
+ 
+ #if HAVE_DLFCN_H
+@@ -11620,7 +11623,7 @@ else
+   lt_dlunknown=0; lt_dlno_uscore=1; lt_dlneed_uscore=2
+   lt_status=$lt_dlunknown
+   cat > conftest.$ac_ext <<_LT_EOF
+-#line 11623 "configure"
++#line 11626 "configure"
+ #include "confdefs.h"
+ 
+ #if HAVE_DLFCN_H
+@@ -15367,6 +15370,19 @@ fi
  
  
  
@@ -118,10 +136,10 @@ index 597d110f57a..d537ec391d2 100755
  if test "${enable_gold+set}" = set; then :
    enableval=$enable_gold; case "${enableval}" in
 diff --git a/ld/configure.ac b/ld/configure.ac
-index 228f2ee4089..50a4b0f4db1 100644
+index 3ee84958b1c..99ea84513da 100644
 --- a/ld/configure.ac
 +++ b/ld/configure.ac
-@@ -102,6 +102,16 @@ AC_SUBST(use_sysroot)
+@@ -115,6 +115,16 @@ AC_SUBST(use_sysroot)
  AC_SUBST(TARGET_SYSTEM_ROOT)
  AC_SUBST(TARGET_SYSTEM_ROOT_DEFINE)
  
@@ -139,7 +157,7 @@ index 228f2ee4089..50a4b0f4db1 100644
  dnl "install_as_default" is set to false if gold is the default linker.
  dnl "installed_linker" is the installed BFD linker name.
 diff --git a/ld/ld.h b/ld/ld.h
-index 254f0a097bb..daf777c65c8 100644
+index c8688153bd4..0b16caf347a 100644
 --- a/ld/ld.h
 +++ b/ld/ld.h
 @@ -166,6 +166,14 @@ typedef struct
@@ -158,10 +176,10 @@ index 254f0a097bb..daf777c65c8 100644
    enum endian_enum endian;
  
 diff --git a/ld/ld.texi b/ld/ld.texi
-index f6384ad82dd..26479a6a232 100644
+index 413335ad765..7bea7fd7e1f 100644
 --- a/ld/ld.texi
 +++ b/ld/ld.texi
-@@ -3279,6 +3279,18 @@ creation of the metadata note, if one had been enabled by an earlier
+@@ -3350,6 +3350,18 @@ creation of the metadata note, if one had been enabled by an earlier
  occurrence of the --package-metadata option.
  If the linker has been built with libjansson, then the JSON string
  will be validated.
@@ -181,7 +199,7 @@ index f6384ad82dd..26479a6a232 100644
  
  @c man end
 diff --git a/ld/ldfile.c b/ld/ldfile.c
-index 12551504ae6..8bea4e7048f 100644
+index 75fd360d5e3..5a825c52bd3 100644
 --- a/ld/ldfile.c
 +++ b/ld/ldfile.c
 @@ -328,6 +328,23 @@ ldfile_add_library_path (const char *name, bool cmdline)
@@ -209,10 +227,10 @@ index 12551504ae6..8bea4e7048f 100644
  
  static void
 diff --git a/ld/ldlex.h b/ld/ldlex.h
-index b8b7d6b6829..a8faeb635c4 100644
+index 815da76a4c0..53fabed4ba2 100644
 --- a/ld/ldlex.h
 +++ b/ld/ldlex.h
-@@ -150,6 +150,8 @@ enum option_values
+@@ -151,6 +151,8 @@ enum option_values
    OPTION_PLUGIN_OPT,
    OPTION_PLUGIN_SAVE_TEMPS,
  #endif /* BFD_SUPPORTS_PLUGINS */
@@ -222,10 +240,10 @@ index b8b7d6b6829..a8faeb635c4 100644
    OPTION_PRINT_OUTPUT_FORMAT,
    OPTION_PRINT_SYSROOT,
 diff --git a/ld/ldmain.c b/ld/ldmain.c
-index cce4991b25a..1859465635d 100644
+index 7878bd3922f..c9293a3cf41 100644
 --- a/ld/ldmain.c
 +++ b/ld/ldmain.c
-@@ -352,6 +352,8 @@ main (int argc, char **argv)
+@@ -672,6 +672,8 @@ main (int argc, char **argv)
    command_line.warn_mismatch = true;
    command_line.warn_search_mismatch = true;
    command_line.check_section_addresses = -1;
@@ -234,7 +252,7 @@ index cce4991b25a..1859465635d 100644
  
    /* We initialize DEMANGLING based on the environment variable
       COLLECT_NO_DEMANGLE.  The gcc collect2 program will demangle the
-@@ -1500,7 +1502,7 @@ undefined_symbol (struct bfd_link_info *info,
+@@ -1876,7 +1878,7 @@ undefined_symbol (struct bfd_link_info *info,
        argv[1] = "undefined-symbol";
        argv[2] = (char *) name;
        argv[3] = NULL;
@@ -243,7 +261,7 @@ index cce4991b25a..1859465635d 100644
        if (verbose)
  	einfo (_("%P: About to run error handling script '%s' with arguments: '%s' '%s'\n"),
  	       argv[0], argv[1], argv[2]);
-@@ -1521,7 +1523,7 @@ undefined_symbol (struct bfd_link_info *info,
+@@ -1897,7 +1899,7 @@ undefined_symbol (struct bfd_link_info *info,
  	 carry on to issue the normal error message.  */
      }
  #endif /* SUPPORT_ERROR_HANDLING_SCRIPT */
@@ -253,10 +271,10 @@ index cce4991b25a..1859465635d 100644
      {
        if (error_count < MAX_ERRORS_IN_A_ROW)
 diff --git a/ld/lexsup.c b/ld/lexsup.c
-index 5399aa45b72..8f9a221bfba 100644
+index bde20465835..95ab1b7c200 100644
 --- a/ld/lexsup.c
 +++ b/ld/lexsup.c
-@@ -650,6 +650,14 @@ static const struct ld_option ld_options[] =
+@@ -652,6 +652,14 @@ static const struct ld_option ld_options[] =
  		   "                                <method> is: share-unconflicted (default),\n"
  		   "                                             share-duplicated"),
      TWO_DASHES },
@@ -271,7 +289,7 @@ index 5399aa45b72..8f9a221bfba 100644
  };
  
  #define OPTION_COUNT ARRAY_SIZE (ld_options)
-@@ -1838,6 +1846,13 @@ parse_args (unsigned argc, char **argv)
+@@ -1849,6 +1857,13 @@ parse_args (unsigned argc, char **argv)
  
  	case OPTION_PRINT_MAP_LOCALS:
  	  config.print_map_locals = true;
diff --git a/meta/recipes-devtools/binutils/binutils/0007-fix-the-incorrect-assembling-for-ppc-wait-mnemonic.patch b/meta/recipes-devtools/binutils/binutils/0007-fix-the-incorrect-assembling-for-ppc-wait-mnemonic.patch
index 7101219bf44..1f36df18dd3 100644
--- a/meta/recipes-devtools/binutils/binutils/0007-fix-the-incorrect-assembling-for-ppc-wait-mnemonic.patch
+++ b/meta/recipes-devtools/binutils/binutils/0007-fix-the-incorrect-assembling-for-ppc-wait-mnemonic.patch
@@ -1,4 +1,4 @@
-From de07998ce2189c329220a76feb073438c4ec88f5 Mon Sep 17 00:00:00 2001
+From c1def8b996df3f6cace833cf72116de93ed48195 Mon Sep 17 00:00:00 2001
 From: Zhenhua Luo <zhenhua.luo@nxp.com>
 Date: Sat, 11 Jun 2016 22:08:29 -0500
 Subject: [PATCH] fix the incorrect assembling for ppc wait mnemonic
@@ -14,10 +14,10 @@ Signed-off-by: Zhenhua Luo <zhenhua.luo@nxp.com>
  1 file changed, 1 insertion(+), 3 deletions(-)
 
 diff --git a/opcodes/ppc-opc.c b/opcodes/ppc-opc.c
-index aa4484ef9ab..81b6a4c2db9 100644
+index 712cd31d19e..a76fe73a10f 100644
 --- a/opcodes/ppc-opc.c
 +++ b/opcodes/ppc-opc.c
-@@ -7138,8 +7138,6 @@ const struct powerpc_opcode powerpc_opcodes[] = {
+@@ -7257,8 +7257,6 @@ const struct powerpc_opcode powerpc_opcodes[] = {
  {"waitasec",	X(31,30),      XRTRARB_MASK, POWER8,	POWER9,		{0}},
  {"waitrsv",	XWCPL(31,30,1,0),0xffffffff, POWER10,	EXT,		{0}},
  {"pause_short",	XWCPL(31,30,2,0),0xffffffff, POWER10,	EXT,		{0}},
@@ -26,7 +26,7 @@ index aa4484ef9ab..81b6a4c2db9 100644
  
  {"lwepx",	X(31,31),	X_MASK,	  E500MC|PPCA2, 0,		{RT, RA0, RB}},
  
-@@ -7193,7 +7191,7 @@ const struct powerpc_opcode powerpc_opcodes[] = {
+@@ -7312,7 +7310,7 @@ const struct powerpc_opcode powerpc_opcodes[] = {
  
  {"waitrsv",	X(31,62)|(1<<21), 0xffffffff, E500MC|PPCA2, EXT,	{0}},
  {"waitimpl",	X(31,62)|(2<<21), 0xffffffff, E500MC|PPCA2, EXT,	{0}},
diff --git a/meta/recipes-devtools/binutils/binutils/0008-Use-libtool-2.4.patch b/meta/recipes-devtools/binutils/binutils/0008-Use-libtool-2.4.patch
index f8dcbd5e4d7..dd26bc61076 100644
--- a/meta/recipes-devtools/binutils/binutils/0008-Use-libtool-2.4.patch
+++ b/meta/recipes-devtools/binutils/binutils/0008-Use-libtool-2.4.patch
@@ -1,4 +1,4 @@
-From dc3a330d6525c6276930c3175e5c878fe2cd9784 Mon Sep 17 00:00:00 2001
+From 488d157d26770ac8632d792888d4789deacbefd3 Mon Sep 17 00:00:00 2001
 From: Khem Raj <raj.khem@gmail.com>
 Date: Sun, 14 Feb 2016 17:04:07 +0000
 Subject: [PATCH] Use libtool 2.4
@@ -32,9 +32,8 @@ Signed-off-by: Khem Raj <raj.khem@gmail.com>
  libbacktrace/configure              | 1441 +++++++++----
  libctf/Makefile.in                  |    2 +
  libctf/configure                    | 1330 ++++++++----
- libsframe/Makefile.in               |  344 ++--
- libsframe/aclocal.m4                |  220 +-
- libsframe/configure                 | 1553 ++++++++++----
+ libsframe/Makefile.in               |    2 +
+ libsframe/configure                 | 1330 ++++++++----
  libtool.m4                          | 1085 ++++++----
  ltmain.sh                           | 2898 ++++++++++++++++++---------
  ltoptions.m4                        |    2 +-
@@ -44,13 +43,13 @@ Signed-off-by: Khem Raj <raj.khem@gmail.com>
  opcodes/configure                   | 1331 ++++++++----
  zlib/Makefile.in                    |    3 +
  zlib/configure                      | 1331 ++++++++----
- 35 files changed, 16078 insertions(+), 6097 deletions(-)
+ 34 files changed, 15653 insertions(+), 5737 deletions(-)
 
 diff --git a/bfd/Makefile.in b/bfd/Makefile.in
-index ee674a36c5b..130a50d80b0 100644
+index 8a670ad1d05..ec2850a97c0 100644
 --- a/bfd/Makefile.in
 +++ b/bfd/Makefile.in
-@@ -340,6 +340,7 @@ DATADIRNAME = @DATADIRNAME@
+@@ -339,6 +339,7 @@ DATADIRNAME = @DATADIRNAME@
  DEBUGDIR = @DEBUGDIR@
  DEFS = @DEFS@
  DEPDIR = @DEPDIR@
@@ -58,7 +57,7 @@ index ee674a36c5b..130a50d80b0 100644
  DSYMUTIL = @DSYMUTIL@
  DUMPBIN = @DUMPBIN@
  ECHO_C = @ECHO_C@
-@@ -379,6 +380,7 @@ LTLIBINTL = @LTLIBINTL@
+@@ -378,6 +379,7 @@ LTLIBINTL = @LTLIBINTL@
  LTLIBOBJS = @LTLIBOBJS@
  MAINT = @MAINT@
  MAKEINFO = @MAKEINFO@
@@ -66,7 +65,7 @@ index ee674a36c5b..130a50d80b0 100644
  MKDIR_P = @MKDIR_P@
  MKINSTALLDIRS = @MKINSTALLDIRS@
  MSGFMT = @MSGFMT@
-@@ -425,6 +427,7 @@ abs_builddir = @abs_builddir@
+@@ -424,6 +426,7 @@ abs_builddir = @abs_builddir@
  abs_srcdir = @abs_srcdir@
  abs_top_builddir = @abs_top_builddir@
  abs_top_srcdir = @abs_top_srcdir@
@@ -75,10 +74,10 @@ index ee674a36c5b..130a50d80b0 100644
  ac_ct_DUMPBIN = @ac_ct_DUMPBIN@
  all_backends = @all_backends@
 diff --git a/bfd/configure b/bfd/configure
-index b0f424dffc2..ba3fce10980 100755
+index 86561b30ac4..c5a7ed1ed36 100755
 --- a/bfd/configure
 +++ b/bfd/configure
-@@ -712,6 +712,9 @@ OTOOL
+@@ -710,6 +710,9 @@ OTOOL
  LIPO
  NMEDIT
  DSYMUTIL
@@ -88,7 +87,7 @@ index b0f424dffc2..ba3fce10980 100755
  OBJDUMP
  LN_S
  NM
-@@ -830,6 +833,7 @@ enable_static
+@@ -828,6 +831,7 @@ enable_static
  with_pic
  enable_fast_install
  with_gnu_ld
@@ -96,7 +95,7 @@ index b0f424dffc2..ba3fce10980 100755
  enable_libtool_lock
  enable_plugins
  enable_largefile
-@@ -1526,6 +1530,8 @@ Optional Packages:
+@@ -1524,6 +1528,8 @@ Optional Packages:
    --with-pic              try to use only PIC/non-PIC objects [default=use
                            both]
    --with-gnu-ld           assume the C compiler uses GNU ld [default=no]
@@ -105,7 +104,7 @@ index b0f424dffc2..ba3fce10980 100755
    --with-mmap             try using mmap for BFD input files if available
    --with-separate-debug-dir=DIR
                            Look for global separate debug info in DIR
-@@ -5061,8 +5067,8 @@ esac
+@@ -5059,8 +5065,8 @@ esac
  
  
  
@@ -116,7 +115,7 @@ index b0f424dffc2..ba3fce10980 100755
  
  
  
-@@ -5102,7 +5108,7 @@ ECHO=$ECHO$ECHO$ECHO$ECHO$ECHO$ECHO
+@@ -5100,7 +5106,7 @@ ECHO=$ECHO$ECHO$ECHO$ECHO$ECHO$ECHO
  { $as_echo "$as_me:${as_lineno-$LINENO}: checking how to print strings" >&5
  $as_echo_n "checking how to print strings... " >&6; }
  # Test print first, because it will be a builtin if present.
@@ -125,7 +124,7 @@ index b0f424dffc2..ba3fce10980 100755
     test "X`print -r -- $ECHO 2>/dev/null`" = "X$ECHO"; then
    ECHO='print -r --'
  elif test "X`printf %s $ECHO 2>/dev/null`" = "X$ECHO"; then
-@@ -5795,8 +5801,8 @@ $as_echo_n "checking whether the shell understands some XSI constructs... " >&6;
+@@ -5793,8 +5799,8 @@ $as_echo_n "checking whether the shell understands some XSI constructs... " >&6;
  # Try some XSI features
  xsi_shell=no
  ( _lt_dummy="a/b/c"
@@ -136,7 +135,7 @@ index b0f424dffc2..ba3fce10980 100755
      && eval 'test $(( 1 + 1 )) -eq 2 \
      && test "${#_lt_dummy}" -eq 5' ) >/dev/null 2>&1 \
    && xsi_shell=yes
-@@ -5845,6 +5851,80 @@ esac
+@@ -5843,6 +5849,80 @@ esac
  
  
  
@@ -217,7 +216,7 @@ index b0f424dffc2..ba3fce10980 100755
  { $as_echo "$as_me:${as_lineno-$LINENO}: checking for $LD option to reload object files" >&5
  $as_echo_n "checking for $LD option to reload object files... " >&6; }
  if ${lt_cv_ld_reload_flag+:} false; then :
-@@ -5861,6 +5941,11 @@ case $reload_flag in
+@@ -5859,6 +5939,11 @@ case $reload_flag in
  esac
  reload_cmds='$LD$reload_flag -o $output$reload_objs'
  case $host_os in
@@ -229,7 +228,7 @@ index b0f424dffc2..ba3fce10980 100755
    darwin*)
      if test "$GCC" = yes; then
        reload_cmds='$LTCC $LTCFLAGS -nostdlib ${wl}-r -o $output$reload_objs'
-@@ -6029,7 +6114,8 @@ mingw* | pw32*)
+@@ -6027,7 +6112,8 @@ mingw* | pw32*)
      lt_cv_deplibs_check_method='file_magic ^x86 archive import|^x86 DLL'
      lt_cv_file_magic_cmd='func_win32_libid'
    else
@@ -239,7 +238,7 @@ index b0f424dffc2..ba3fce10980 100755
      lt_cv_file_magic_cmd='$OBJDUMP -f'
    fi
    ;;
-@@ -6188,6 +6274,21 @@ esac
+@@ -6186,6 +6272,21 @@ esac
  fi
  { $as_echo "$as_me:${as_lineno-$LINENO}: result: $lt_cv_deplibs_check_method" >&5
  $as_echo "$lt_cv_deplibs_check_method" >&6; }
@@ -261,7 +260,7 @@ index b0f424dffc2..ba3fce10980 100755
  file_magic_cmd=$lt_cv_file_magic_cmd
  deplibs_check_method=$lt_cv_deplibs_check_method
  test -z "$deplibs_check_method" && deplibs_check_method=unknown
-@@ -6203,6 +6304,157 @@ test -z "$deplibs_check_method" && deplibs_check_method=unknown
+@@ -6201,6 +6302,157 @@ test -z "$deplibs_check_method" && deplibs_check_method=unknown
  
  
  
@@ -419,7 +418,7 @@ index b0f424dffc2..ba3fce10980 100755
  plugin_option=
  plugin_names="liblto_plugin.so liblto_plugin-0.dll cyglto_plugin-0.dll"
  for plugin in $plugin_names; do
-@@ -6217,8 +6469,10 @@ for plugin in $plugin_names; do
+@@ -6215,8 +6467,10 @@ for plugin in $plugin_names; do
  done
  
  if test -n "$ac_tool_prefix"; then
@@ -432,7 +431,7 @@ index b0f424dffc2..ba3fce10980 100755
  { $as_echo "$as_me:${as_lineno-$LINENO}: checking for $ac_word" >&5
  $as_echo_n "checking for $ac_word... " >&6; }
  if ${ac_cv_prog_AR+:} false; then :
-@@ -6234,7 +6488,7 @@ do
+@@ -6232,7 +6486,7 @@ do
    test -z "$as_dir" && as_dir=.
      for ac_exec_ext in '' $ac_executable_extensions; do
    if as_fn_executable_p "$as_dir/$ac_word$ac_exec_ext"; then
@@ -441,7 +440,7 @@ index b0f424dffc2..ba3fce10980 100755
      $as_echo "$as_me:${as_lineno-$LINENO}: found $as_dir/$ac_word$ac_exec_ext" >&5
      break 2
    fi
-@@ -6254,11 +6508,15 @@ $as_echo "no" >&6; }
+@@ -6252,11 +6506,15 @@ $as_echo "no" >&6; }
  fi
  
  
@@ -460,7 +459,7 @@ index b0f424dffc2..ba3fce10980 100755
  { $as_echo "$as_me:${as_lineno-$LINENO}: checking for $ac_word" >&5
  $as_echo_n "checking for $ac_word... " >&6; }
  if ${ac_cv_prog_ac_ct_AR+:} false; then :
-@@ -6274,7 +6532,7 @@ do
+@@ -6272,7 +6530,7 @@ do
    test -z "$as_dir" && as_dir=.
      for ac_exec_ext in '' $ac_executable_extensions; do
    if as_fn_executable_p "$as_dir/$ac_word$ac_exec_ext"; then
@@ -469,7 +468,7 @@ index b0f424dffc2..ba3fce10980 100755
      $as_echo "$as_me:${as_lineno-$LINENO}: found $as_dir/$ac_word$ac_exec_ext" >&5
      break 2
    fi
-@@ -6293,6 +6551,10 @@ else
+@@ -6291,6 +6549,10 @@ else
  $as_echo "no" >&6; }
  fi
  
@@ -480,7 +479,7 @@ index b0f424dffc2..ba3fce10980 100755
    if test "x$ac_ct_AR" = x; then
      AR="false"
    else
-@@ -6304,25 +6566,20 @@ ac_tool_warned=yes ;;
+@@ -6302,25 +6564,20 @@ ac_tool_warned=yes ;;
  esac
      AR=$ac_ct_AR
    fi
@@ -516,7 +515,7 @@ index b0f424dffc2..ba3fce10980 100755
  
  
  
-@@ -6333,6 +6590,63 @@ test -z "$AR_FLAGS" && AR_FLAGS=cru
+@@ -6331,6 +6588,63 @@ test -z "$AR_FLAGS" && AR_FLAGS=cru
  
  
  
@@ -580,7 +579,7 @@ index b0f424dffc2..ba3fce10980 100755
  
  if test -n "$ac_tool_prefix"; then
    # Extract the first word of "${ac_tool_prefix}strip", so it can be a program name with args.
-@@ -6673,8 +6987,8 @@ esac
+@@ -6671,8 +6985,8 @@ esac
  lt_cv_sys_global_symbol_to_cdecl="sed -n -e 's/^T .* \(.*\)$/extern int \1();/p' -e 's/^$symcode* .* \(.*\)$/extern char \1;/p'"
  
  # Transform an extracted symbol line into symbol name and symbol address
@@ -591,7 +590,7 @@ index b0f424dffc2..ba3fce10980 100755
  
  # Handle CRLF in mingw tool chain
  opt_cr=
-@@ -6710,6 +7024,7 @@ for ac_symprfx in "" "_"; do
+@@ -6708,6 +7022,7 @@ for ac_symprfx in "" "_"; do
    else
      lt_cv_sys_global_symbol_pipe="sed -n -e 's/^.*[	 ]\($symcode$symcode*\)[	 ][	 ]*$ac_symprfx$sympat$opt_cr$/$symxfrm/p'"
    fi
@@ -599,7 +598,7 @@ index b0f424dffc2..ba3fce10980 100755
  
    # Check to see that the pipe works correctly.
    pipe_works=no
-@@ -6751,6 +7066,18 @@ _LT_EOF
+@@ -6749,6 +7064,18 @@ _LT_EOF
        if $GREP ' nm_test_var$' "$nlist" >/dev/null; then
  	if $GREP ' nm_test_func$' "$nlist" >/dev/null; then
  	  cat <<_LT_EOF > conftest.$ac_ext
@@ -618,7 +617,7 @@ index b0f424dffc2..ba3fce10980 100755
  #ifdef __cplusplus
  extern "C" {
  #endif
-@@ -6762,7 +7089,7 @@ _LT_EOF
+@@ -6760,7 +7087,7 @@ _LT_EOF
  	  cat <<_LT_EOF >> conftest.$ac_ext
  
  /* The mapping between symbol names and symbols.  */
@@ -627,7 +626,7 @@ index b0f424dffc2..ba3fce10980 100755
    const char *name;
    void       *address;
  }
-@@ -6788,8 +7115,8 @@ static const void *lt_preloaded_setup() {
+@@ -6786,8 +7113,8 @@ static const void *lt_preloaded_setup() {
  _LT_EOF
  	  # Now try linking the two files.
  	  mv conftest.$ac_objext conftstm.$ac_objext
@@ -638,7 +637,7 @@ index b0f424dffc2..ba3fce10980 100755
  	  LIBS="conftstm.$ac_objext"
  	  CFLAGS="$CFLAGS$lt_prog_compiler_no_builtin_flag"
  	  if { { eval echo "\"\$as_me\":${as_lineno-$LINENO}: \"$ac_link\""; } >&5
-@@ -6799,8 +7126,8 @@ _LT_EOF
+@@ -6797,8 +7124,8 @@ _LT_EOF
    test $ac_status = 0; } && test -s conftest${ac_exeext}; then
  	    pipe_works=yes
  	  fi
@@ -649,7 +648,7 @@ index b0f424dffc2..ba3fce10980 100755
  	else
  	  echo "cannot find nm_test_func in $nlist" >&5
  	fi
-@@ -6837,6 +7164,14 @@ else
+@@ -6835,6 +7162,14 @@ else
  $as_echo "ok" >&6; }
  fi
  
@@ -664,7 +663,7 @@ index b0f424dffc2..ba3fce10980 100755
  
  
  
-@@ -6855,6 +7190,47 @@ fi
+@@ -6853,6 +7188,47 @@ fi
  
  
  
@@ -712,7 +711,7 @@ index b0f424dffc2..ba3fce10980 100755
  
  
  
-@@ -7064,6 +7440,123 @@ esac
+@@ -7062,6 +7438,123 @@ esac
  
  need_locks="$enable_libtool_lock"
  
@@ -836,7 +835,7 @@ index b0f424dffc2..ba3fce10980 100755
  
    case $host_os in
      rhapsody* | darwin*)
-@@ -7627,6 +8120,8 @@ _LT_EOF
+@@ -7625,6 +8118,8 @@ _LT_EOF
        $LTCC $LTCFLAGS -c -o conftest.o conftest.c 2>&5
        echo "$AR cru libconftest.a conftest.o" >&5
        $AR cru libconftest.a conftest.o 2>&5
@@ -845,7 +844,7 @@ index b0f424dffc2..ba3fce10980 100755
        cat > conftest.c << _LT_EOF
  int main() { return 0;}
  _LT_EOF
-@@ -8180,8 +8675,6 @@ fi
+@@ -8178,8 +8673,6 @@ fi
  lt_prog_compiler_pic=
  lt_prog_compiler_static=
  
@@ -854,7 +853,7 @@ index b0f424dffc2..ba3fce10980 100755
  
    if test "$GCC" = yes; then
      lt_prog_compiler_wl='-Wl,'
-@@ -8347,6 +8840,12 @@ $as_echo_n "checking for $compiler option to produce PIC... " >&6; }
+@@ -8345,6 +8838,12 @@ $as_echo_n "checking for $compiler option to produce PIC... " >&6; }
  	lt_prog_compiler_pic='--shared'
  	lt_prog_compiler_static='--static'
  	;;
@@ -867,7 +866,7 @@ index b0f424dffc2..ba3fce10980 100755
        pgcc* | pgf77* | pgf90* | pgf95* | pgfortran*)
          # Portland Group compilers (*not* the Pentium gcc compiler,
  	# which looks to be a dead project)
-@@ -8409,7 +8908,7 @@ $as_echo_n "checking for $compiler option to produce PIC... " >&6; }
+@@ -8407,7 +8906,7 @@ $as_echo_n "checking for $compiler option to produce PIC... " >&6; }
        lt_prog_compiler_pic='-KPIC'
        lt_prog_compiler_static='-Bstatic'
        case $cc_basename in
@@ -876,7 +875,7 @@ index b0f424dffc2..ba3fce10980 100755
  	lt_prog_compiler_wl='-Qoption ld ';;
        *)
  	lt_prog_compiler_wl='-Wl,';;
-@@ -8466,13 +8965,17 @@ case $host_os in
+@@ -8464,13 +8963,17 @@ case $host_os in
      lt_prog_compiler_pic="$lt_prog_compiler_pic -DPIC"
      ;;
  esac
@@ -900,7 +899,7 @@ index b0f424dffc2..ba3fce10980 100755
  
  #
  # Check to make sure the PIC flag actually works.
-@@ -8533,6 +9036,11 @@ fi
+@@ -8531,6 +9034,11 @@ fi
  
  
  
@@ -912,7 +911,7 @@ index b0f424dffc2..ba3fce10980 100755
  #
  # Check to make sure the static flag actually works.
  #
-@@ -8883,7 +9391,8 @@ _LT_EOF
+@@ -8881,7 +9389,8 @@ _LT_EOF
        allow_undefined_flag=unsupported
        always_export_symbols=no
        enable_shared_with_static_runtimes=yes
@@ -922,7 +921,7 @@ index b0f424dffc2..ba3fce10980 100755
  
        if $LD --help 2>&1 | $GREP 'auto-import' > /dev/null; then
          archive_cmds='$CC -shared $libobjs $deplibs $compiler_flags -o $output_objdir/$soname ${wl}--enable-auto-image-base -Xlinker --out-implib -Xlinker $lib'
-@@ -8982,12 +9491,12 @@ _LT_EOF
+@@ -8980,12 +9489,12 @@ _LT_EOF
  	  whole_archive_flag_spec='--whole-archive$convenience --no-whole-archive'
  	  hardcode_libdir_flag_spec=
  	  hardcode_libdir_flag_spec_ld='-rpath $libdir'
@@ -937,7 +936,7 @@ index b0f424dffc2..ba3fce10980 100755
  	  fi
  	  ;;
  	esac
-@@ -9001,8 +9510,8 @@ _LT_EOF
+@@ -8999,8 +9508,8 @@ _LT_EOF
  	archive_cmds='$LD -Bshareable $libobjs $deplibs $linker_flags -o $lib'
  	wlarc=
        else
@@ -948,7 +947,7 @@ index b0f424dffc2..ba3fce10980 100755
        fi
        ;;
  
-@@ -9020,8 +9529,8 @@ _LT_EOF
+@@ -9018,8 +9527,8 @@ _LT_EOF
  
  _LT_EOF
        elif $LD --help 2>&1 | $GREP ': supported targets:.* elf' > /dev/null; then
@@ -959,7 +958,7 @@ index b0f424dffc2..ba3fce10980 100755
        else
  	ld_shlibs=no
        fi
-@@ -9067,8 +9576,8 @@ _LT_EOF
+@@ -9065,8 +9574,8 @@ _LT_EOF
  
      *)
        if $LD --help 2>&1 | $GREP ': supported targets:.* elf' > /dev/null; then
@@ -970,7 +969,7 @@ index b0f424dffc2..ba3fce10980 100755
        else
  	ld_shlibs=no
        fi
-@@ -9198,7 +9707,13 @@ _LT_EOF
+@@ -9196,7 +9705,13 @@ _LT_EOF
  	allow_undefined_flag='-berok'
          # Determine the default libpath from the value encoded in an
          # empty executable.
@@ -985,7 +984,7 @@ index b0f424dffc2..ba3fce10980 100755
  /* end confdefs.h.  */
  
  int
-@@ -9211,22 +9726,29 @@ main ()
+@@ -9209,22 +9724,29 @@ main ()
  _ACEOF
  if ac_fn_c_try_link "$LINENO"; then :
  
@@ -1028,7 +1027,7 @@ index b0f424dffc2..ba3fce10980 100755
  
          hardcode_libdir_flag_spec='${wl}-blibpath:$libdir:'"$aix_libpath"
          archive_expsym_cmds='$CC -o $output_objdir/$soname $libobjs $deplibs '"\${wl}$no_entry_flag"' $compiler_flags `if test "x${allow_undefined_flag}" != "x"; then func_echo_all "${wl}${allow_undefined_flag}"; else :; fi` '"\${wl}$exp_sym_flag:\$export_symbols $shared_flag"
-@@ -9238,7 +9760,13 @@ if test -z "$aix_libpath"; then aix_libpath="/usr/lib:/lib"; fi
+@@ -9236,7 +9758,13 @@ if test -z "$aix_libpath"; then aix_libpath="/usr/lib:/lib"; fi
  	else
  	 # Determine the default libpath from the value encoded in an
  	 # empty executable.
@@ -1043,7 +1042,7 @@ index b0f424dffc2..ba3fce10980 100755
  /* end confdefs.h.  */
  
  int
-@@ -9251,22 +9779,29 @@ main ()
+@@ -9249,22 +9777,29 @@ main ()
  _ACEOF
  if ac_fn_c_try_link "$LINENO"; then :
  
@@ -1086,7 +1085,7 @@ index b0f424dffc2..ba3fce10980 100755
  
  	 hardcode_libdir_flag_spec='${wl}-blibpath:$libdir:'"$aix_libpath"
  	  # Warning - without using the other run time loading flags,
-@@ -9311,20 +9846,63 @@ if test -z "$aix_libpath"; then aix_libpath="/usr/lib:/lib"; fi
+@@ -9309,20 +9844,63 @@ if test -z "$aix_libpath"; then aix_libpath="/usr/lib:/lib"; fi
        # Microsoft Visual C++.
        # hardcode_libdir_flag_spec is actually meaningless, as there is
        # no search path for DLLs.
@@ -1164,7 +1163,7 @@ index b0f424dffc2..ba3fce10980 100755
        ;;
  
      darwin* | rhapsody*)
-@@ -9385,7 +9963,7 @@ if test -z "$aix_libpath"; then aix_libpath="/usr/lib:/lib"; fi
+@@ -9383,7 +9961,7 @@ if test -z "$aix_libpath"; then aix_libpath="/usr/lib:/lib"; fi
  
      # FreeBSD 3 and greater uses gcc -shared to do shared libraries.
      freebsd* | dragonfly*)
@@ -1173,7 +1172,7 @@ index b0f424dffc2..ba3fce10980 100755
        hardcode_libdir_flag_spec='-R$libdir'
        hardcode_direct=yes
        hardcode_shlibpath_var=no
-@@ -9393,7 +9971,7 @@ if test -z "$aix_libpath"; then aix_libpath="/usr/lib:/lib"; fi
+@@ -9391,7 +9969,7 @@ if test -z "$aix_libpath"; then aix_libpath="/usr/lib:/lib"; fi
  
      hpux9*)
        if test "$GCC" = yes; then
@@ -1182,7 +1181,7 @@ index b0f424dffc2..ba3fce10980 100755
        else
  	archive_cmds='$RM $output_objdir/$soname~$LD -b +b $install_libdir -o $output_objdir/$soname $libobjs $deplibs $linker_flags~test $output_objdir/$soname = $lib || mv $output_objdir/$soname $lib'
        fi
-@@ -9409,7 +9987,7 @@ if test -z "$aix_libpath"; then aix_libpath="/usr/lib:/lib"; fi
+@@ -9407,7 +9985,7 @@ if test -z "$aix_libpath"; then aix_libpath="/usr/lib:/lib"; fi
  
      hpux10*)
        if test "$GCC" = yes && test "$with_gnu_ld" = no; then
@@ -1191,7 +1190,7 @@ index b0f424dffc2..ba3fce10980 100755
        else
  	archive_cmds='$LD -b +h $soname +b $install_libdir -o $lib $libobjs $deplibs $linker_flags'
        fi
-@@ -9433,10 +10011,10 @@ if test -z "$aix_libpath"; then aix_libpath="/usr/lib:/lib"; fi
+@@ -9431,10 +10009,10 @@ if test -z "$aix_libpath"; then aix_libpath="/usr/lib:/lib"; fi
  	  archive_cmds='$CC -shared ${wl}+h ${wl}$soname ${wl}+nodefaultrpath -o $lib $libobjs $deplibs $compiler_flags'
  	  ;;
  	ia64*)
@@ -1204,7 +1203,7 @@ index b0f424dffc2..ba3fce10980 100755
  	  ;;
  	esac
        else
-@@ -9515,23 +10093,36 @@ fi
+@@ -9513,23 +10091,36 @@ fi
  
      irix5* | irix6* | nonstopux*)
        if test "$GCC" = yes; then
@@ -1249,7 +1248,7 @@ index b0f424dffc2..ba3fce10980 100755
        else
  	archive_cmds='$CC -shared $libobjs $deplibs $compiler_flags -soname $soname `test -n "$verstring" && func_echo_all "-set_version $verstring"` -update_registry ${output_objdir}/so_locations -o $lib'
  	archive_expsym_cmds='$CC -shared $libobjs $deplibs $compiler_flags -soname $soname `test -n "$verstring" && func_echo_all "-set_version $verstring"` -update_registry ${output_objdir}/so_locations -exports_file $export_symbols -o $lib'
-@@ -9616,7 +10207,7 @@ rm -f core conftest.err conftest.$ac_objext \
+@@ -9614,7 +10205,7 @@ rm -f core conftest.err conftest.$ac_objext \
      osf4* | osf5*)	# as osf3* with the addition of -msym flag
        if test "$GCC" = yes; then
  	allow_undefined_flag=' ${wl}-expect_unresolved ${wl}\*'
@@ -1258,7 +1257,7 @@ index b0f424dffc2..ba3fce10980 100755
  	hardcode_libdir_flag_spec='${wl}-rpath ${wl}$libdir'
        else
  	allow_undefined_flag=' -expect_unresolved \*'
-@@ -9635,9 +10226,9 @@ rm -f core conftest.err conftest.$ac_objext \
+@@ -9633,9 +10224,9 @@ rm -f core conftest.err conftest.$ac_objext \
        no_undefined_flag=' -z defs'
        if test "$GCC" = yes; then
  	wlarc='${wl}'
@@ -1270,7 +1269,7 @@ index b0f424dffc2..ba3fce10980 100755
        else
  	case `$CC -V 2>&1` in
  	*"Compilers 5.0"*)
-@@ -10213,8 +10804,9 @@ cygwin* | mingw* | pw32* | cegcc*)
+@@ -10211,8 +10802,9 @@ cygwin* | mingw* | pw32* | cegcc*)
    need_version=no
    need_lib_prefix=no
  
@@ -1282,7 +1281,7 @@ index b0f424dffc2..ba3fce10980 100755
      library_names_spec='$libname.dll.a'
      # DLL is installed to $(libdir)/../bin by postinstall_cmds
      postinstall_cmds='base_file=`basename \${file}`~
-@@ -10247,13 +10839,71 @@ cygwin* | mingw* | pw32* | cegcc*)
+@@ -10245,13 +10837,71 @@ cygwin* | mingw* | pw32* | cegcc*)
        library_names_spec='`echo ${libname} | sed -e 's/^lib/pw/'``echo ${release} | $SED -e 's/[.]/-/g'`${versuffix}${shared_ext}'
        ;;
      esac
@@ -1355,16 +1354,16 @@ index b0f424dffc2..ba3fce10980 100755
    # FIXME: first we should search . and the directory the executable is in
    shlibpath_var=PATH
    ;;
-@@ -11155,7 +11805,7 @@ else
+@@ -11153,7 +11803,7 @@ else
    lt_dlunknown=0; lt_dlno_uscore=1; lt_dlneed_uscore=2
    lt_status=$lt_dlunknown
    cat > conftest.$ac_ext <<_LT_EOF
--#line 11158 "configure"
+-#line 11156 "configure"
 +#line $LINENO "configure"
  #include "confdefs.h"
  
  #if HAVE_DLFCN_H
-@@ -11199,10 +11849,10 @@ else
+@@ -11197,10 +11847,10 @@ else
  /* When -fvisbility=hidden is used, assume the code has been annotated
     correspondingly for the symbols needed.  */
  #if defined(__GNUC__) && (((__GNUC__ == 3) && (__GNUC_MINOR__ >= 3)) || (__GNUC__ > 3))
@@ -1377,16 +1376,16 @@ index b0f424dffc2..ba3fce10980 100755
  int main ()
  {
    void *self = dlopen (0, LT_DLGLOBAL|LT_DLLAZY_OR_NOW);
-@@ -11261,7 +11911,7 @@ else
+@@ -11259,7 +11909,7 @@ else
    lt_dlunknown=0; lt_dlno_uscore=1; lt_dlneed_uscore=2
    lt_status=$lt_dlunknown
    cat > conftest.$ac_ext <<_LT_EOF
--#line 11264 "configure"
+-#line 11262 "configure"
 +#line $LINENO "configure"
  #include "confdefs.h"
  
  #if HAVE_DLFCN_H
-@@ -11305,10 +11955,10 @@ else
+@@ -11303,10 +11953,10 @@ else
  /* When -fvisbility=hidden is used, assume the code has been annotated
     correspondingly for the symbols needed.  */
  #if defined(__GNUC__) && (((__GNUC__ == 3) && (__GNUC_MINOR__ >= 3)) || (__GNUC__ > 3))
@@ -1399,7 +1398,7 @@ index b0f424dffc2..ba3fce10980 100755
  int main ()
  {
    void *self = dlopen (0, LT_DLGLOBAL|LT_DLLAZY_OR_NOW);
-@@ -15689,7 +16339,7 @@ SHARED_LDFLAGS=
+@@ -15356,7 +16006,7 @@ SHARED_LDFLAGS=
  if test "$enable_shared" = "yes"; then
    x=`sed -n -e 's/^[ 	]*PICFLAG[ 	]*=[ 	]*//p' < ../libiberty/Makefile | sed -n '$p'`
    if test -n "$x"; then
@@ -1408,7 +1407,7 @@ index b0f424dffc2..ba3fce10980 100755
    fi
  fi
  
-@@ -18314,13 +18964,20 @@ exeext='`$ECHO "$exeext" | $SED "$delay_single_quote_subst"`'
+@@ -17977,13 +18627,20 @@ exeext='`$ECHO "$exeext" | $SED "$delay_single_quote_subst"`'
  lt_unset='`$ECHO "$lt_unset" | $SED "$delay_single_quote_subst"`'
  lt_SP2NL='`$ECHO "$lt_SP2NL" | $SED "$delay_single_quote_subst"`'
  lt_NL2SP='`$ECHO "$lt_NL2SP" | $SED "$delay_single_quote_subst"`'
@@ -1429,7 +1428,7 @@ index b0f424dffc2..ba3fce10980 100755
  STRIP='`$ECHO "$STRIP" | $SED "$delay_single_quote_subst"`'
  RANLIB='`$ECHO "$RANLIB" | $SED "$delay_single_quote_subst"`'
  old_postinstall_cmds='`$ECHO "$old_postinstall_cmds" | $SED "$delay_single_quote_subst"`'
-@@ -18335,14 +18992,17 @@ lt_cv_sys_global_symbol_pipe='`$ECHO "$lt_cv_sys_global_symbol_pipe" | $SED "$de
+@@ -17998,14 +18655,17 @@ lt_cv_sys_global_symbol_pipe='`$ECHO "$lt_cv_sys_global_symbol_pipe" | $SED "$de
  lt_cv_sys_global_symbol_to_cdecl='`$ECHO "$lt_cv_sys_global_symbol_to_cdecl" | $SED "$delay_single_quote_subst"`'
  lt_cv_sys_global_symbol_to_c_name_address='`$ECHO "$lt_cv_sys_global_symbol_to_c_name_address" | $SED "$delay_single_quote_subst"`'
  lt_cv_sys_global_symbol_to_c_name_address_lib_prefix='`$ECHO "$lt_cv_sys_global_symbol_to_c_name_address_lib_prefix" | $SED "$delay_single_quote_subst"`'
@@ -1448,7 +1447,7 @@ index b0f424dffc2..ba3fce10980 100755
  DSYMUTIL='`$ECHO "$DSYMUTIL" | $SED "$delay_single_quote_subst"`'
  NMEDIT='`$ECHO "$NMEDIT" | $SED "$delay_single_quote_subst"`'
  LIPO='`$ECHO "$LIPO" | $SED "$delay_single_quote_subst"`'
-@@ -18375,12 +19035,12 @@ hardcode_shlibpath_var='`$ECHO "$hardcode_shlibpath_var" | $SED "$delay_single_q
+@@ -18038,12 +18698,12 @@ hardcode_shlibpath_var='`$ECHO "$hardcode_shlibpath_var" | $SED "$delay_single_q
  hardcode_automatic='`$ECHO "$hardcode_automatic" | $SED "$delay_single_quote_subst"`'
  inherit_rpath='`$ECHO "$inherit_rpath" | $SED "$delay_single_quote_subst"`'
  link_all_deplibs='`$ECHO "$link_all_deplibs" | $SED "$delay_single_quote_subst"`'
@@ -1462,7 +1461,7 @@ index b0f424dffc2..ba3fce10980 100755
  file_list_spec='`$ECHO "$file_list_spec" | $SED "$delay_single_quote_subst"`'
  variables_saved_for_relink='`$ECHO "$variables_saved_for_relink" | $SED "$delay_single_quote_subst"`'
  need_lib_prefix='`$ECHO "$need_lib_prefix" | $SED "$delay_single_quote_subst"`'
-@@ -18435,8 +19095,13 @@ reload_flag \
+@@ -18098,8 +18758,13 @@ reload_flag \
  OBJDUMP \
  deplibs_check_method \
  file_magic_cmd \
@@ -1476,7 +1475,7 @@ index b0f424dffc2..ba3fce10980 100755
  STRIP \
  RANLIB \
  CC \
-@@ -18446,12 +19111,14 @@ lt_cv_sys_global_symbol_pipe \
+@@ -18109,12 +18774,14 @@ lt_cv_sys_global_symbol_pipe \
  lt_cv_sys_global_symbol_to_cdecl \
  lt_cv_sys_global_symbol_to_c_name_address \
  lt_cv_sys_global_symbol_to_c_name_address_lib_prefix \
@@ -1492,7 +1491,7 @@ index b0f424dffc2..ba3fce10980 100755
  DSYMUTIL \
  NMEDIT \
  LIPO \
-@@ -18467,7 +19134,6 @@ no_undefined_flag \
+@@ -18130,7 +18797,6 @@ no_undefined_flag \
  hardcode_libdir_flag_spec \
  hardcode_libdir_flag_spec_ld \
  hardcode_libdir_separator \
@@ -1500,7 +1499,7 @@ index b0f424dffc2..ba3fce10980 100755
  exclude_expsyms \
  include_expsyms \
  file_list_spec \
-@@ -18503,6 +19169,7 @@ module_cmds \
+@@ -18166,6 +18832,7 @@ module_cmds \
  module_expsym_cmds \
  export_symbols_cmds \
  prelink_cmds \
@@ -1508,7 +1507,7 @@ index b0f424dffc2..ba3fce10980 100755
  postinstall_cmds \
  postuninstall_cmds \
  finish_cmds \
-@@ -19279,7 +19946,8 @@ $as_echo X"$file" |
+@@ -18934,7 +19601,8 @@ $as_echo X"$file" |
  # NOTE: Changes made to this file will be lost: look at ltmain.sh.
  #
  #   Copyright (C) 1996, 1997, 1998, 1999, 2000, 2001, 2003, 2004, 2005,
@@ -1518,7 +1517,7 @@ index b0f424dffc2..ba3fce10980 100755
  #   Written by Gordon Matzigkeit, 1996
  #
  #   This file is part of GNU Libtool.
-@@ -19382,19 +20050,42 @@ SP2NL=$lt_lt_SP2NL
+@@ -19037,19 +19705,42 @@ SP2NL=$lt_lt_SP2NL
  # turn newlines into spaces.
  NL2SP=$lt_lt_NL2SP
  
@@ -1562,7 +1561,7 @@ index b0f424dffc2..ba3fce10980 100755
  # A symbol stripping program.
  STRIP=$lt_STRIP
  
-@@ -19424,6 +20115,12 @@ global_symbol_to_c_name_address=$lt_lt_cv_sys_global_symbol_to_c_name_address
+@@ -19079,6 +19770,12 @@ global_symbol_to_c_name_address=$lt_lt_cv_sys_global_symbol_to_c_name_address
  # Transform the output of nm in a C name address pair when lib prefix is needed.
  global_symbol_to_c_name_address_lib_prefix=$lt_lt_cv_sys_global_symbol_to_c_name_address_lib_prefix
  
@@ -1575,7 +1574,7 @@ index b0f424dffc2..ba3fce10980 100755
  # The name of the directory that contains temporary libtool files.
  objdir=$objdir
  
-@@ -19433,6 +20130,9 @@ MAGIC_CMD=$MAGIC_CMD
+@@ -19088,6 +19785,9 @@ MAGIC_CMD=$MAGIC_CMD
  # Must we lock files when doing compilation?
  need_locks=$lt_need_locks
  
@@ -1585,7 +1584,7 @@ index b0f424dffc2..ba3fce10980 100755
  # Tool to manipulate archived DWARF debug symbol files on Mac OS X.
  DSYMUTIL=$lt_DSYMUTIL
  
-@@ -19547,12 +20247,12 @@ with_gcc=$GCC
+@@ -19202,12 +19902,12 @@ with_gcc=$GCC
  # Compiler flag to turn off builtin functions.
  no_builtin_flag=$lt_lt_prog_compiler_no_builtin_flag
  
@@ -1601,7 +1600,7 @@ index b0f424dffc2..ba3fce10980 100755
  # Compiler flag to prevent dynamic linking.
  link_static_flag=$lt_lt_prog_compiler_static
  
-@@ -19639,9 +20339,6 @@ inherit_rpath=$inherit_rpath
+@@ -19294,9 +19994,6 @@ inherit_rpath=$inherit_rpath
  # Whether libtool must link a program against all its dependency libraries.
  link_all_deplibs=$link_all_deplibs
  
@@ -1611,7 +1610,7 @@ index b0f424dffc2..ba3fce10980 100755
  # Set to "yes" if exported symbols are required.
  always_export_symbols=$always_export_symbols
  
-@@ -19657,6 +20354,9 @@ include_expsyms=$lt_include_expsyms
+@@ -19312,6 +20009,9 @@ include_expsyms=$lt_include_expsyms
  # Commands necessary for linking programs (against libraries) with templates.
  prelink_cmds=$lt_prelink_cmds
  
@@ -1621,7 +1620,7 @@ index b0f424dffc2..ba3fce10980 100755
  # Specify filename containing input files.
  file_list_spec=$lt_file_list_spec
  
-@@ -19689,210 +20389,169 @@ ltmain="$ac_aux_dir/ltmain.sh"
+@@ -19344,210 +20044,169 @@ ltmain="$ac_aux_dir/ltmain.sh"
    # if finds mixed CR/LF and LF-only lines.  Since sed operates in
    # text mode, it properly converts lines to CR/LF.  This bash problem
    # is reportedly fixed, but why not run on old versions too?
@@ -1996,10 +1995,10 @@ index b0f424dffc2..ba3fce10980 100755
    chmod +x "$ofile"
  
 diff --git a/bfd/configure.ac b/bfd/configure.ac
-index 90fad5417b3..1d57f289f18 100644
+index 5879a04785d..5ccc499d8d7 100644
 --- a/bfd/configure.ac
 +++ b/bfd/configure.ac
-@@ -275,7 +275,7 @@ changequote(,)dnl
+@@ -281,7 +281,7 @@ changequote(,)dnl
    x=`sed -n -e 's/^[ 	]*PICFLAG[ 	]*=[ 	]*//p' < ../libiberty/Makefile | sed -n '$p'`
  changequote([,])dnl
    if test -n "$x"; then
@@ -2009,7 +2008,7 @@ index 90fad5417b3..1d57f289f18 100644
  fi
  
 diff --git a/binutils/Makefile.in b/binutils/Makefile.in
-index 8029bc29d57..5b2b4b81426 100644
+index 549b5a361c8..e1487641218 100644
 --- a/binutils/Makefile.in
 +++ b/binutils/Makefile.in
 @@ -495,6 +495,7 @@ DEBUGINFOD_LIBS = @DEBUGINFOD_LIBS@
@@ -2037,7 +2036,7 @@ index 8029bc29d57..5b2b4b81426 100644
  ac_ct_DUMPBIN = @ac_ct_DUMPBIN@
  am__include = @am__include@
 diff --git a/binutils/configure b/binutils/configure
-index caa7c3679e9..5b5c7b38028 100755
+index 0ff4539f458..6dca572ea4b 100755
 --- a/binutils/configure
 +++ b/binutils/configure
 @@ -704,8 +704,11 @@ OTOOL
@@ -3363,7 +3362,7 @@ index caa7c3679e9..5b5c7b38028 100755
  int main ()
  {
    void *self = dlopen (0, LT_DLGLOBAL|LT_DLLAZY_OR_NOW);
-@@ -17383,13 +18033,20 @@ exeext='`$ECHO "$exeext" | $SED "$delay_single_quote_subst"`'
+@@ -17102,13 +17752,20 @@ exeext='`$ECHO "$exeext" | $SED "$delay_single_quote_subst"`'
  lt_unset='`$ECHO "$lt_unset" | $SED "$delay_single_quote_subst"`'
  lt_SP2NL='`$ECHO "$lt_SP2NL" | $SED "$delay_single_quote_subst"`'
  lt_NL2SP='`$ECHO "$lt_NL2SP" | $SED "$delay_single_quote_subst"`'
@@ -3384,7 +3383,7 @@ index caa7c3679e9..5b5c7b38028 100755
  STRIP='`$ECHO "$STRIP" | $SED "$delay_single_quote_subst"`'
  RANLIB='`$ECHO "$RANLIB" | $SED "$delay_single_quote_subst"`'
  old_postinstall_cmds='`$ECHO "$old_postinstall_cmds" | $SED "$delay_single_quote_subst"`'
-@@ -17404,14 +18061,17 @@ lt_cv_sys_global_symbol_pipe='`$ECHO "$lt_cv_sys_global_symbol_pipe" | $SED "$de
+@@ -17123,14 +17780,17 @@ lt_cv_sys_global_symbol_pipe='`$ECHO "$lt_cv_sys_global_symbol_pipe" | $SED "$de
  lt_cv_sys_global_symbol_to_cdecl='`$ECHO "$lt_cv_sys_global_symbol_to_cdecl" | $SED "$delay_single_quote_subst"`'
  lt_cv_sys_global_symbol_to_c_name_address='`$ECHO "$lt_cv_sys_global_symbol_to_c_name_address" | $SED "$delay_single_quote_subst"`'
  lt_cv_sys_global_symbol_to_c_name_address_lib_prefix='`$ECHO "$lt_cv_sys_global_symbol_to_c_name_address_lib_prefix" | $SED "$delay_single_quote_subst"`'
@@ -3403,7 +3402,7 @@ index caa7c3679e9..5b5c7b38028 100755
  DSYMUTIL='`$ECHO "$DSYMUTIL" | $SED "$delay_single_quote_subst"`'
  NMEDIT='`$ECHO "$NMEDIT" | $SED "$delay_single_quote_subst"`'
  LIPO='`$ECHO "$LIPO" | $SED "$delay_single_quote_subst"`'
-@@ -17444,12 +18104,12 @@ hardcode_shlibpath_var='`$ECHO "$hardcode_shlibpath_var" | $SED "$delay_single_q
+@@ -17163,12 +17823,12 @@ hardcode_shlibpath_var='`$ECHO "$hardcode_shlibpath_var" | $SED "$delay_single_q
  hardcode_automatic='`$ECHO "$hardcode_automatic" | $SED "$delay_single_quote_subst"`'
  inherit_rpath='`$ECHO "$inherit_rpath" | $SED "$delay_single_quote_subst"`'
  link_all_deplibs='`$ECHO "$link_all_deplibs" | $SED "$delay_single_quote_subst"`'
@@ -3417,7 +3416,7 @@ index caa7c3679e9..5b5c7b38028 100755
  file_list_spec='`$ECHO "$file_list_spec" | $SED "$delay_single_quote_subst"`'
  variables_saved_for_relink='`$ECHO "$variables_saved_for_relink" | $SED "$delay_single_quote_subst"`'
  need_lib_prefix='`$ECHO "$need_lib_prefix" | $SED "$delay_single_quote_subst"`'
-@@ -17504,8 +18164,13 @@ reload_flag \
+@@ -17223,8 +17883,13 @@ reload_flag \
  OBJDUMP \
  deplibs_check_method \
  file_magic_cmd \
@@ -3431,7 +3430,7 @@ index caa7c3679e9..5b5c7b38028 100755
  STRIP \
  RANLIB \
  CC \
-@@ -17515,12 +18180,14 @@ lt_cv_sys_global_symbol_pipe \
+@@ -17234,12 +17899,14 @@ lt_cv_sys_global_symbol_pipe \
  lt_cv_sys_global_symbol_to_cdecl \
  lt_cv_sys_global_symbol_to_c_name_address \
  lt_cv_sys_global_symbol_to_c_name_address_lib_prefix \
@@ -3447,7 +3446,7 @@ index caa7c3679e9..5b5c7b38028 100755
  DSYMUTIL \
  NMEDIT \
  LIPO \
-@@ -17536,7 +18203,6 @@ no_undefined_flag \
+@@ -17255,7 +17922,6 @@ no_undefined_flag \
  hardcode_libdir_flag_spec \
  hardcode_libdir_flag_spec_ld \
  hardcode_libdir_separator \
@@ -3455,7 +3454,7 @@ index caa7c3679e9..5b5c7b38028 100755
  exclude_expsyms \
  include_expsyms \
  file_list_spec \
-@@ -17572,6 +18238,7 @@ module_cmds \
+@@ -17291,6 +17957,7 @@ module_cmds \
  module_expsym_cmds \
  export_symbols_cmds \
  prelink_cmds \
@@ -3463,7 +3462,7 @@ index caa7c3679e9..5b5c7b38028 100755
  postinstall_cmds \
  postuninstall_cmds \
  finish_cmds \
-@@ -18345,7 +19012,8 @@ $as_echo X"$file" |
+@@ -18056,7 +18723,8 @@ $as_echo X"$file" |
  # NOTE: Changes made to this file will be lost: look at ltmain.sh.
  #
  #   Copyright (C) 1996, 1997, 1998, 1999, 2000, 2001, 2003, 2004, 2005,
@@ -3473,7 +3472,7 @@ index caa7c3679e9..5b5c7b38028 100755
  #   Written by Gordon Matzigkeit, 1996
  #
  #   This file is part of GNU Libtool.
-@@ -18448,19 +19116,42 @@ SP2NL=$lt_lt_SP2NL
+@@ -18159,19 +18827,42 @@ SP2NL=$lt_lt_SP2NL
  # turn newlines into spaces.
  NL2SP=$lt_lt_NL2SP
  
@@ -3517,7 +3516,7 @@ index caa7c3679e9..5b5c7b38028 100755
  # A symbol stripping program.
  STRIP=$lt_STRIP
  
-@@ -18490,6 +19181,12 @@ global_symbol_to_c_name_address=$lt_lt_cv_sys_global_symbol_to_c_name_address
+@@ -18201,6 +18892,12 @@ global_symbol_to_c_name_address=$lt_lt_cv_sys_global_symbol_to_c_name_address
  # Transform the output of nm in a C name address pair when lib prefix is needed.
  global_symbol_to_c_name_address_lib_prefix=$lt_lt_cv_sys_global_symbol_to_c_name_address_lib_prefix
  
@@ -3530,7 +3529,7 @@ index caa7c3679e9..5b5c7b38028 100755
  # The name of the directory that contains temporary libtool files.
  objdir=$objdir
  
-@@ -18499,6 +19196,9 @@ MAGIC_CMD=$MAGIC_CMD
+@@ -18210,6 +18907,9 @@ MAGIC_CMD=$MAGIC_CMD
  # Must we lock files when doing compilation?
  need_locks=$lt_need_locks
  
@@ -3540,7 +3539,7 @@ index caa7c3679e9..5b5c7b38028 100755
  # Tool to manipulate archived DWARF debug symbol files on Mac OS X.
  DSYMUTIL=$lt_DSYMUTIL
  
-@@ -18613,12 +19313,12 @@ with_gcc=$GCC
+@@ -18324,12 +19024,12 @@ with_gcc=$GCC
  # Compiler flag to turn off builtin functions.
  no_builtin_flag=$lt_lt_prog_compiler_no_builtin_flag
  
@@ -3556,7 +3555,7 @@ index caa7c3679e9..5b5c7b38028 100755
  # Compiler flag to prevent dynamic linking.
  link_static_flag=$lt_lt_prog_compiler_static
  
-@@ -18705,9 +19405,6 @@ inherit_rpath=$inherit_rpath
+@@ -18416,9 +19116,6 @@ inherit_rpath=$inherit_rpath
  # Whether libtool must link a program against all its dependency libraries.
  link_all_deplibs=$link_all_deplibs
  
@@ -3566,7 +3565,7 @@ index caa7c3679e9..5b5c7b38028 100755
  # Set to "yes" if exported symbols are required.
  always_export_symbols=$always_export_symbols
  
-@@ -18723,6 +19420,9 @@ include_expsyms=$lt_include_expsyms
+@@ -18434,6 +19131,9 @@ include_expsyms=$lt_include_expsyms
  # Commands necessary for linking programs (against libraries) with templates.
  prelink_cmds=$lt_prelink_cmds
  
@@ -3576,7 +3575,7 @@ index caa7c3679e9..5b5c7b38028 100755
  # Specify filename containing input files.
  file_list_spec=$lt_file_list_spec
  
-@@ -18755,210 +19455,169 @@ ltmain="$ac_aux_dir/ltmain.sh"
+@@ -18466,210 +19166,169 @@ ltmain="$ac_aux_dir/ltmain.sh"
    # if finds mixed CR/LF and LF-only lines.  Since sed operates in
    # text mode, it properly converts lines to CR/LF.  This bash problem
    # is reportedly fixed, but why not run on old versions too?
@@ -3979,7 +3978,7 @@ index 1f24d4a5bbc..0147b491612 100644
  ac_ct_DUMPBIN = @ac_ct_DUMPBIN@
  am__include = @am__include@
 diff --git a/gas/configure b/gas/configure
-index 085c87d564c..14b1dc0f121 100755
+index ca149e79195..ad4377e140a 100755
 --- a/gas/configure
 +++ b/gas/configure
 @@ -692,8 +692,11 @@ OTOOL
@@ -5302,7 +5301,7 @@ index 085c87d564c..14b1dc0f121 100755
  int main ()
  {
    void *self = dlopen (0, LT_DLGLOBAL|LT_DLLAZY_OR_NOW);
-@@ -17049,13 +17699,20 @@ exeext='`$ECHO "$exeext" | $SED "$delay_single_quote_subst"`'
+@@ -16771,13 +17421,20 @@ exeext='`$ECHO "$exeext" | $SED "$delay_single_quote_subst"`'
  lt_unset='`$ECHO "$lt_unset" | $SED "$delay_single_quote_subst"`'
  lt_SP2NL='`$ECHO "$lt_SP2NL" | $SED "$delay_single_quote_subst"`'
  lt_NL2SP='`$ECHO "$lt_NL2SP" | $SED "$delay_single_quote_subst"`'
@@ -5323,7 +5322,7 @@ index 085c87d564c..14b1dc0f121 100755
  STRIP='`$ECHO "$STRIP" | $SED "$delay_single_quote_subst"`'
  RANLIB='`$ECHO "$RANLIB" | $SED "$delay_single_quote_subst"`'
  old_postinstall_cmds='`$ECHO "$old_postinstall_cmds" | $SED "$delay_single_quote_subst"`'
-@@ -17070,14 +17727,17 @@ lt_cv_sys_global_symbol_pipe='`$ECHO "$lt_cv_sys_global_symbol_pipe" | $SED "$de
+@@ -16792,14 +17449,17 @@ lt_cv_sys_global_symbol_pipe='`$ECHO "$lt_cv_sys_global_symbol_pipe" | $SED "$de
  lt_cv_sys_global_symbol_to_cdecl='`$ECHO "$lt_cv_sys_global_symbol_to_cdecl" | $SED "$delay_single_quote_subst"`'
  lt_cv_sys_global_symbol_to_c_name_address='`$ECHO "$lt_cv_sys_global_symbol_to_c_name_address" | $SED "$delay_single_quote_subst"`'
  lt_cv_sys_global_symbol_to_c_name_address_lib_prefix='`$ECHO "$lt_cv_sys_global_symbol_to_c_name_address_lib_prefix" | $SED "$delay_single_quote_subst"`'
@@ -5342,7 +5341,7 @@ index 085c87d564c..14b1dc0f121 100755
  DSYMUTIL='`$ECHO "$DSYMUTIL" | $SED "$delay_single_quote_subst"`'
  NMEDIT='`$ECHO "$NMEDIT" | $SED "$delay_single_quote_subst"`'
  LIPO='`$ECHO "$LIPO" | $SED "$delay_single_quote_subst"`'
-@@ -17110,12 +17770,12 @@ hardcode_shlibpath_var='`$ECHO "$hardcode_shlibpath_var" | $SED "$delay_single_q
+@@ -16832,12 +17492,12 @@ hardcode_shlibpath_var='`$ECHO "$hardcode_shlibpath_var" | $SED "$delay_single_q
  hardcode_automatic='`$ECHO "$hardcode_automatic" | $SED "$delay_single_quote_subst"`'
  inherit_rpath='`$ECHO "$inherit_rpath" | $SED "$delay_single_quote_subst"`'
  link_all_deplibs='`$ECHO "$link_all_deplibs" | $SED "$delay_single_quote_subst"`'
@@ -5356,7 +5355,7 @@ index 085c87d564c..14b1dc0f121 100755
  file_list_spec='`$ECHO "$file_list_spec" | $SED "$delay_single_quote_subst"`'
  variables_saved_for_relink='`$ECHO "$variables_saved_for_relink" | $SED "$delay_single_quote_subst"`'
  need_lib_prefix='`$ECHO "$need_lib_prefix" | $SED "$delay_single_quote_subst"`'
-@@ -17170,8 +17830,13 @@ reload_flag \
+@@ -16892,8 +17552,13 @@ reload_flag \
  OBJDUMP \
  deplibs_check_method \
  file_magic_cmd \
@@ -5370,7 +5369,7 @@ index 085c87d564c..14b1dc0f121 100755
  STRIP \
  RANLIB \
  CC \
-@@ -17181,12 +17846,14 @@ lt_cv_sys_global_symbol_pipe \
+@@ -16903,12 +17568,14 @@ lt_cv_sys_global_symbol_pipe \
  lt_cv_sys_global_symbol_to_cdecl \
  lt_cv_sys_global_symbol_to_c_name_address \
  lt_cv_sys_global_symbol_to_c_name_address_lib_prefix \
@@ -5386,7 +5385,7 @@ index 085c87d564c..14b1dc0f121 100755
  DSYMUTIL \
  NMEDIT \
  LIPO \
-@@ -17202,7 +17869,6 @@ no_undefined_flag \
+@@ -16924,7 +17591,6 @@ no_undefined_flag \
  hardcode_libdir_flag_spec \
  hardcode_libdir_flag_spec_ld \
  hardcode_libdir_separator \
@@ -5394,7 +5393,7 @@ index 085c87d564c..14b1dc0f121 100755
  exclude_expsyms \
  include_expsyms \
  file_list_spec \
-@@ -17238,6 +17904,7 @@ module_cmds \
+@@ -16960,6 +17626,7 @@ module_cmds \
  module_expsym_cmds \
  export_symbols_cmds \
  prelink_cmds \
@@ -5402,7 +5401,7 @@ index 085c87d564c..14b1dc0f121 100755
  postinstall_cmds \
  postuninstall_cmds \
  finish_cmds \
-@@ -18018,7 +18685,8 @@ $as_echo X"$file" |
+@@ -17732,7 +18399,8 @@ $as_echo X"$file" |
  # NOTE: Changes made to this file will be lost: look at ltmain.sh.
  #
  #   Copyright (C) 1996, 1997, 1998, 1999, 2000, 2001, 2003, 2004, 2005,
@@ -5412,7 +5411,7 @@ index 085c87d564c..14b1dc0f121 100755
  #   Written by Gordon Matzigkeit, 1996
  #
  #   This file is part of GNU Libtool.
-@@ -18121,19 +18789,42 @@ SP2NL=$lt_lt_SP2NL
+@@ -17835,19 +18503,42 @@ SP2NL=$lt_lt_SP2NL
  # turn newlines into spaces.
  NL2SP=$lt_lt_NL2SP
  
@@ -5456,7 +5455,7 @@ index 085c87d564c..14b1dc0f121 100755
  # A symbol stripping program.
  STRIP=$lt_STRIP
  
-@@ -18163,6 +18854,12 @@ global_symbol_to_c_name_address=$lt_lt_cv_sys_global_symbol_to_c_name_address
+@@ -17877,6 +18568,12 @@ global_symbol_to_c_name_address=$lt_lt_cv_sys_global_symbol_to_c_name_address
  # Transform the output of nm in a C name address pair when lib prefix is needed.
  global_symbol_to_c_name_address_lib_prefix=$lt_lt_cv_sys_global_symbol_to_c_name_address_lib_prefix
  
@@ -5469,7 +5468,7 @@ index 085c87d564c..14b1dc0f121 100755
  # The name of the directory that contains temporary libtool files.
  objdir=$objdir
  
-@@ -18172,6 +18869,9 @@ MAGIC_CMD=$MAGIC_CMD
+@@ -17886,6 +18583,9 @@ MAGIC_CMD=$MAGIC_CMD
  # Must we lock files when doing compilation?
  need_locks=$lt_need_locks
  
@@ -5479,7 +5478,7 @@ index 085c87d564c..14b1dc0f121 100755
  # Tool to manipulate archived DWARF debug symbol files on Mac OS X.
  DSYMUTIL=$lt_DSYMUTIL
  
-@@ -18286,12 +18986,12 @@ with_gcc=$GCC
+@@ -18000,12 +18700,12 @@ with_gcc=$GCC
  # Compiler flag to turn off builtin functions.
  no_builtin_flag=$lt_lt_prog_compiler_no_builtin_flag
  
@@ -5495,7 +5494,7 @@ index 085c87d564c..14b1dc0f121 100755
  # Compiler flag to prevent dynamic linking.
  link_static_flag=$lt_lt_prog_compiler_static
  
-@@ -18378,9 +19078,6 @@ inherit_rpath=$inherit_rpath
+@@ -18092,9 +18792,6 @@ inherit_rpath=$inherit_rpath
  # Whether libtool must link a program against all its dependency libraries.
  link_all_deplibs=$link_all_deplibs
  
@@ -5505,7 +5504,7 @@ index 085c87d564c..14b1dc0f121 100755
  # Set to "yes" if exported symbols are required.
  always_export_symbols=$always_export_symbols
  
-@@ -18396,6 +19093,9 @@ include_expsyms=$lt_include_expsyms
+@@ -18110,6 +18807,9 @@ include_expsyms=$lt_include_expsyms
  # Commands necessary for linking programs (against libraries) with templates.
  prelink_cmds=$lt_prelink_cmds
  
@@ -5515,7 +5514,7 @@ index 085c87d564c..14b1dc0f121 100755
  # Specify filename containing input files.
  file_list_spec=$lt_file_list_spec
  
-@@ -18428,210 +19128,169 @@ ltmain="$ac_aux_dir/ltmain.sh"
+@@ -18142,210 +18842,169 @@ ltmain="$ac_aux_dir/ltmain.sh"
    # if finds mixed CR/LF and LF-only lines.  Since sed operates in
    # text mode, it properly converts lines to CR/LF.  This bash problem
    # is reportedly fixed, but why not run on old versions too?
@@ -5890,7 +5889,7 @@ index 085c87d564c..14b1dc0f121 100755
    chmod +x "$ofile"
  
 diff --git a/gprof/Makefile.in b/gprof/Makefile.in
-index 93fb378149a..6744cb1ff8c 100644
+index 719e1810bcd..037f9cd5834 100644
 --- a/gprof/Makefile.in
 +++ b/gprof/Makefile.in
 @@ -327,6 +327,7 @@ CYGPATH_W = @CYGPATH_W@
@@ -5918,10 +5917,10 @@ index 93fb378149a..6744cb1ff8c 100644
  ac_ct_DUMPBIN = @ac_ct_DUMPBIN@
  am__include = @am__include@
 diff --git a/gprof/configure b/gprof/configure
-index 47ed79d1df4..bfbf4c421f3 100755
+index e40de173a1e..82cd6d600b8 100755
 --- a/gprof/configure
 +++ b/gprof/configure
-@@ -669,8 +669,11 @@ OTOOL
+@@ -671,8 +671,11 @@ OTOOL
  LIPO
  NMEDIT
  DSYMUTIL
@@ -5933,7 +5932,7 @@ index 47ed79d1df4..bfbf4c421f3 100755
  OBJDUMP
  LN_S
  NM
-@@ -787,6 +790,7 @@ enable_static
+@@ -789,6 +792,7 @@ enable_static
  with_pic
  enable_fast_install
  with_gnu_ld
@@ -5941,7 +5940,7 @@ index 47ed79d1df4..bfbf4c421f3 100755
  enable_libtool_lock
  enable_plugins
  enable_largefile
-@@ -1462,6 +1466,8 @@ Optional Packages:
+@@ -1464,6 +1468,8 @@ Optional Packages:
    --with-libintl-prefix[=DIR]  search for libintl in DIR/include and DIR/lib
    --without-libintl-prefix     don't search for libintl in includedir and libdir
    --with-libintl-type=TYPE     type of library to search for (auto/static/shared)
@@ -5950,7 +5949,7 @@ index 47ed79d1df4..bfbf4c421f3 100755
  
  Some influential environment variables:
    CC          C compiler command
-@@ -4528,8 +4534,8 @@ esac
+@@ -4530,8 +4536,8 @@ esac
  
  
  
@@ -5961,7 +5960,7 @@ index 47ed79d1df4..bfbf4c421f3 100755
  
  
  
-@@ -4569,7 +4575,7 @@ ECHO=$ECHO$ECHO$ECHO$ECHO$ECHO$ECHO
+@@ -4571,7 +4577,7 @@ ECHO=$ECHO$ECHO$ECHO$ECHO$ECHO$ECHO
  { $as_echo "$as_me:${as_lineno-$LINENO}: checking how to print strings" >&5
  $as_echo_n "checking how to print strings... " >&6; }
  # Test print first, because it will be a builtin if present.
@@ -5970,7 +5969,7 @@ index 47ed79d1df4..bfbf4c421f3 100755
     test "X`print -r -- $ECHO 2>/dev/null`" = "X$ECHO"; then
    ECHO='print -r --'
  elif test "X`printf %s $ECHO 2>/dev/null`" = "X$ECHO"; then
-@@ -5262,8 +5268,8 @@ $as_echo_n "checking whether the shell understands some XSI constructs... " >&6;
+@@ -5264,8 +5270,8 @@ $as_echo_n "checking whether the shell understands some XSI constructs... " >&6;
  # Try some XSI features
  xsi_shell=no
  ( _lt_dummy="a/b/c"
@@ -5981,7 +5980,7 @@ index 47ed79d1df4..bfbf4c421f3 100755
      && eval 'test $(( 1 + 1 )) -eq 2 \
      && test "${#_lt_dummy}" -eq 5' ) >/dev/null 2>&1 \
    && xsi_shell=yes
-@@ -5312,6 +5318,80 @@ esac
+@@ -5314,6 +5320,80 @@ esac
  
  
  
@@ -6062,7 +6061,7 @@ index 47ed79d1df4..bfbf4c421f3 100755
  { $as_echo "$as_me:${as_lineno-$LINENO}: checking for $LD option to reload object files" >&5
  $as_echo_n "checking for $LD option to reload object files... " >&6; }
  if ${lt_cv_ld_reload_flag+:} false; then :
-@@ -5328,6 +5408,11 @@ case $reload_flag in
+@@ -5330,6 +5410,11 @@ case $reload_flag in
  esac
  reload_cmds='$LD$reload_flag -o $output$reload_objs'
  case $host_os in
@@ -6074,7 +6073,7 @@ index 47ed79d1df4..bfbf4c421f3 100755
    darwin*)
      if test "$GCC" = yes; then
        reload_cmds='$LTCC $LTCFLAGS -nostdlib ${wl}-r -o $output$reload_objs'
-@@ -5496,7 +5581,8 @@ mingw* | pw32*)
+@@ -5498,7 +5583,8 @@ mingw* | pw32*)
      lt_cv_deplibs_check_method='file_magic ^x86 archive import|^x86 DLL'
      lt_cv_file_magic_cmd='func_win32_libid'
    else
@@ -6084,7 +6083,7 @@ index 47ed79d1df4..bfbf4c421f3 100755
      lt_cv_file_magic_cmd='$OBJDUMP -f'
    fi
    ;;
-@@ -5655,6 +5741,21 @@ esac
+@@ -5657,6 +5743,21 @@ esac
  fi
  { $as_echo "$as_me:${as_lineno-$LINENO}: result: $lt_cv_deplibs_check_method" >&5
  $as_echo "$lt_cv_deplibs_check_method" >&6; }
@@ -6106,7 +6105,7 @@ index 47ed79d1df4..bfbf4c421f3 100755
  file_magic_cmd=$lt_cv_file_magic_cmd
  deplibs_check_method=$lt_cv_deplibs_check_method
  test -z "$deplibs_check_method" && deplibs_check_method=unknown
-@@ -5670,6 +5771,157 @@ test -z "$deplibs_check_method" && deplibs_check_method=unknown
+@@ -5672,6 +5773,157 @@ test -z "$deplibs_check_method" && deplibs_check_method=unknown
  
  
  
@@ -6264,7 +6263,7 @@ index 47ed79d1df4..bfbf4c421f3 100755
  plugin_option=
  plugin_names="liblto_plugin.so liblto_plugin-0.dll cyglto_plugin-0.dll"
  for plugin in $plugin_names; do
-@@ -5684,8 +5936,10 @@ for plugin in $plugin_names; do
+@@ -5686,8 +5938,10 @@ for plugin in $plugin_names; do
  done
  
  if test -n "$ac_tool_prefix"; then
@@ -6277,7 +6276,7 @@ index 47ed79d1df4..bfbf4c421f3 100755
  { $as_echo "$as_me:${as_lineno-$LINENO}: checking for $ac_word" >&5
  $as_echo_n "checking for $ac_word... " >&6; }
  if ${ac_cv_prog_AR+:} false; then :
-@@ -5701,7 +5955,7 @@ do
+@@ -5703,7 +5957,7 @@ do
    test -z "$as_dir" && as_dir=.
      for ac_exec_ext in '' $ac_executable_extensions; do
    if as_fn_executable_p "$as_dir/$ac_word$ac_exec_ext"; then
@@ -6286,7 +6285,7 @@ index 47ed79d1df4..bfbf4c421f3 100755
      $as_echo "$as_me:${as_lineno-$LINENO}: found $as_dir/$ac_word$ac_exec_ext" >&5
      break 2
    fi
-@@ -5721,11 +5975,15 @@ $as_echo "no" >&6; }
+@@ -5723,11 +5977,15 @@ $as_echo "no" >&6; }
  fi
  
  
@@ -6305,7 +6304,7 @@ index 47ed79d1df4..bfbf4c421f3 100755
  { $as_echo "$as_me:${as_lineno-$LINENO}: checking for $ac_word" >&5
  $as_echo_n "checking for $ac_word... " >&6; }
  if ${ac_cv_prog_ac_ct_AR+:} false; then :
-@@ -5741,7 +5999,7 @@ do
+@@ -5743,7 +6001,7 @@ do
    test -z "$as_dir" && as_dir=.
      for ac_exec_ext in '' $ac_executable_extensions; do
    if as_fn_executable_p "$as_dir/$ac_word$ac_exec_ext"; then
@@ -6314,7 +6313,7 @@ index 47ed79d1df4..bfbf4c421f3 100755
      $as_echo "$as_me:${as_lineno-$LINENO}: found $as_dir/$ac_word$ac_exec_ext" >&5
      break 2
    fi
-@@ -5760,6 +6018,10 @@ else
+@@ -5762,6 +6020,10 @@ else
  $as_echo "no" >&6; }
  fi
  
@@ -6325,7 +6324,7 @@ index 47ed79d1df4..bfbf4c421f3 100755
    if test "x$ac_ct_AR" = x; then
      AR="false"
    else
-@@ -5771,25 +6033,19 @@ ac_tool_warned=yes ;;
+@@ -5773,25 +6035,19 @@ ac_tool_warned=yes ;;
  esac
      AR=$ac_ct_AR
    fi
@@ -6360,7 +6359,7 @@ index 47ed79d1df4..bfbf4c421f3 100755
  
  
  
-@@ -5801,6 +6057,64 @@ test -z "$AR_FLAGS" && AR_FLAGS=cru
+@@ -5803,6 +6059,64 @@ test -z "$AR_FLAGS" && AR_FLAGS=cru
  
  
  
@@ -6425,7 +6424,7 @@ index 47ed79d1df4..bfbf4c421f3 100755
  if test -n "$ac_tool_prefix"; then
    # Extract the first word of "${ac_tool_prefix}strip", so it can be a program name with args.
  set dummy ${ac_tool_prefix}strip; ac_word=$2
-@@ -6140,8 +6454,8 @@ esac
+@@ -6142,8 +6456,8 @@ esac
  lt_cv_sys_global_symbol_to_cdecl="sed -n -e 's/^T .* \(.*\)$/extern int \1();/p' -e 's/^$symcode* .* \(.*\)$/extern char \1;/p'"
  
  # Transform an extracted symbol line into symbol name and symbol address
@@ -6436,7 +6435,7 @@ index 47ed79d1df4..bfbf4c421f3 100755
  
  # Handle CRLF in mingw tool chain
  opt_cr=
-@@ -6177,6 +6491,7 @@ for ac_symprfx in "" "_"; do
+@@ -6179,6 +6493,7 @@ for ac_symprfx in "" "_"; do
    else
      lt_cv_sys_global_symbol_pipe="sed -n -e 's/^.*[	 ]\($symcode$symcode*\)[	 ][	 ]*$ac_symprfx$sympat$opt_cr$/$symxfrm/p'"
    fi
@@ -6444,7 +6443,7 @@ index 47ed79d1df4..bfbf4c421f3 100755
  
    # Check to see that the pipe works correctly.
    pipe_works=no
-@@ -6218,6 +6533,18 @@ _LT_EOF
+@@ -6220,6 +6535,18 @@ _LT_EOF
        if $GREP ' nm_test_var$' "$nlist" >/dev/null; then
  	if $GREP ' nm_test_func$' "$nlist" >/dev/null; then
  	  cat <<_LT_EOF > conftest.$ac_ext
@@ -6463,7 +6462,7 @@ index 47ed79d1df4..bfbf4c421f3 100755
  #ifdef __cplusplus
  extern "C" {
  #endif
-@@ -6229,7 +6556,7 @@ _LT_EOF
+@@ -6231,7 +6558,7 @@ _LT_EOF
  	  cat <<_LT_EOF >> conftest.$ac_ext
  
  /* The mapping between symbol names and symbols.  */
@@ -6472,7 +6471,7 @@ index 47ed79d1df4..bfbf4c421f3 100755
    const char *name;
    void       *address;
  }
-@@ -6255,8 +6582,8 @@ static const void *lt_preloaded_setup() {
+@@ -6257,8 +6584,8 @@ static const void *lt_preloaded_setup() {
  _LT_EOF
  	  # Now try linking the two files.
  	  mv conftest.$ac_objext conftstm.$ac_objext
@@ -6483,7 +6482,7 @@ index 47ed79d1df4..bfbf4c421f3 100755
  	  LIBS="conftstm.$ac_objext"
  	  CFLAGS="$CFLAGS$lt_prog_compiler_no_builtin_flag"
  	  if { { eval echo "\"\$as_me\":${as_lineno-$LINENO}: \"$ac_link\""; } >&5
-@@ -6266,8 +6593,8 @@ _LT_EOF
+@@ -6268,8 +6595,8 @@ _LT_EOF
    test $ac_status = 0; } && test -s conftest${ac_exeext}; then
  	    pipe_works=yes
  	  fi
@@ -6494,7 +6493,7 @@ index 47ed79d1df4..bfbf4c421f3 100755
  	else
  	  echo "cannot find nm_test_func in $nlist" >&5
  	fi
-@@ -6304,6 +6631,18 @@ else
+@@ -6306,6 +6633,18 @@ else
  $as_echo "ok" >&6; }
  fi
  
@@ -6513,7 +6512,7 @@ index 47ed79d1df4..bfbf4c421f3 100755
  
  
  
-@@ -6320,6 +6659,43 @@ fi
+@@ -6322,6 +6661,43 @@ fi
  
  
  
@@ -6557,7 +6556,7 @@ index 47ed79d1df4..bfbf4c421f3 100755
  
  
  
-@@ -6531,6 +6907,123 @@ esac
+@@ -6533,6 +6909,123 @@ esac
  
  need_locks="$enable_libtool_lock"
  
@@ -6681,7 +6680,7 @@ index 47ed79d1df4..bfbf4c421f3 100755
  
    case $host_os in
      rhapsody* | darwin*)
-@@ -7094,6 +7587,8 @@ _LT_EOF
+@@ -7096,6 +7589,8 @@ _LT_EOF
        $LTCC $LTCFLAGS -c -o conftest.o conftest.c 2>&5
        echo "$AR cru libconftest.a conftest.o" >&5
        $AR cru libconftest.a conftest.o 2>&5
@@ -6690,7 +6689,7 @@ index 47ed79d1df4..bfbf4c421f3 100755
        cat > conftest.c << _LT_EOF
  int main() { return 0;}
  _LT_EOF
-@@ -7678,8 +8173,6 @@ fi
+@@ -7680,8 +8175,6 @@ fi
  lt_prog_compiler_pic=
  lt_prog_compiler_static=
  
@@ -6699,7 +6698,7 @@ index 47ed79d1df4..bfbf4c421f3 100755
  
    if test "$GCC" = yes; then
      lt_prog_compiler_wl='-Wl,'
-@@ -7845,6 +8338,12 @@ $as_echo_n "checking for $compiler option to produce PIC... " >&6; }
+@@ -7847,6 +8340,12 @@ $as_echo_n "checking for $compiler option to produce PIC... " >&6; }
  	lt_prog_compiler_pic='--shared'
  	lt_prog_compiler_static='--static'
  	;;
@@ -6712,7 +6711,7 @@ index 47ed79d1df4..bfbf4c421f3 100755
        pgcc* | pgf77* | pgf90* | pgf95* | pgfortran*)
          # Portland Group compilers (*not* the Pentium gcc compiler,
  	# which looks to be a dead project)
-@@ -7907,7 +8406,7 @@ $as_echo_n "checking for $compiler option to produce PIC... " >&6; }
+@@ -7909,7 +8408,7 @@ $as_echo_n "checking for $compiler option to produce PIC... " >&6; }
        lt_prog_compiler_pic='-KPIC'
        lt_prog_compiler_static='-Bstatic'
        case $cc_basename in
@@ -6721,7 +6720,7 @@ index 47ed79d1df4..bfbf4c421f3 100755
  	lt_prog_compiler_wl='-Qoption ld ';;
        *)
  	lt_prog_compiler_wl='-Wl,';;
-@@ -7964,13 +8463,17 @@ case $host_os in
+@@ -7966,13 +8465,17 @@ case $host_os in
      lt_prog_compiler_pic="$lt_prog_compiler_pic -DPIC"
      ;;
  esac
@@ -6745,7 +6744,7 @@ index 47ed79d1df4..bfbf4c421f3 100755
  
  #
  # Check to make sure the PIC flag actually works.
-@@ -8031,6 +8534,11 @@ fi
+@@ -8033,6 +8536,11 @@ fi
  
  
  
@@ -6757,7 +6756,7 @@ index 47ed79d1df4..bfbf4c421f3 100755
  #
  # Check to make sure the static flag actually works.
  #
-@@ -8381,7 +8889,8 @@ _LT_EOF
+@@ -8383,7 +8891,8 @@ _LT_EOF
        allow_undefined_flag=unsupported
        always_export_symbols=no
        enable_shared_with_static_runtimes=yes
@@ -6767,7 +6766,7 @@ index 47ed79d1df4..bfbf4c421f3 100755
  
        if $LD --help 2>&1 | $GREP 'auto-import' > /dev/null; then
          archive_cmds='$CC -shared $libobjs $deplibs $compiler_flags -o $output_objdir/$soname ${wl}--enable-auto-image-base -Xlinker --out-implib -Xlinker $lib'
-@@ -8480,12 +8989,12 @@ _LT_EOF
+@@ -8482,12 +8991,12 @@ _LT_EOF
  	  whole_archive_flag_spec='--whole-archive$convenience --no-whole-archive'
  	  hardcode_libdir_flag_spec=
  	  hardcode_libdir_flag_spec_ld='-rpath $libdir'
@@ -6782,7 +6781,7 @@ index 47ed79d1df4..bfbf4c421f3 100755
  	  fi
  	  ;;
  	esac
-@@ -8499,8 +9008,8 @@ _LT_EOF
+@@ -8501,8 +9010,8 @@ _LT_EOF
  	archive_cmds='$LD -Bshareable $libobjs $deplibs $linker_flags -o $lib'
  	wlarc=
        else
@@ -6793,7 +6792,7 @@ index 47ed79d1df4..bfbf4c421f3 100755
        fi
        ;;
  
-@@ -8518,8 +9027,8 @@ _LT_EOF
+@@ -8520,8 +9029,8 @@ _LT_EOF
  
  _LT_EOF
        elif $LD --help 2>&1 | $GREP ': supported targets:.* elf' > /dev/null; then
@@ -6804,7 +6803,7 @@ index 47ed79d1df4..bfbf4c421f3 100755
        else
  	ld_shlibs=no
        fi
-@@ -8565,8 +9074,8 @@ _LT_EOF
+@@ -8567,8 +9076,8 @@ _LT_EOF
  
      *)
        if $LD --help 2>&1 | $GREP ': supported targets:.* elf' > /dev/null; then
@@ -6815,7 +6814,7 @@ index 47ed79d1df4..bfbf4c421f3 100755
        else
  	ld_shlibs=no
        fi
-@@ -8696,7 +9205,13 @@ _LT_EOF
+@@ -8698,7 +9207,13 @@ _LT_EOF
  	allow_undefined_flag='-berok'
          # Determine the default libpath from the value encoded in an
          # empty executable.
@@ -6830,7 +6829,7 @@ index 47ed79d1df4..bfbf4c421f3 100755
  /* end confdefs.h.  */
  
  int
-@@ -8709,22 +9224,29 @@ main ()
+@@ -8711,22 +9226,29 @@ main ()
  _ACEOF
  if ac_fn_c_try_link "$LINENO"; then :
  
@@ -6873,7 +6872,7 @@ index 47ed79d1df4..bfbf4c421f3 100755
  
          hardcode_libdir_flag_spec='${wl}-blibpath:$libdir:'"$aix_libpath"
          archive_expsym_cmds='$CC -o $output_objdir/$soname $libobjs $deplibs '"\${wl}$no_entry_flag"' $compiler_flags `if test "x${allow_undefined_flag}" != "x"; then func_echo_all "${wl}${allow_undefined_flag}"; else :; fi` '"\${wl}$exp_sym_flag:\$export_symbols $shared_flag"
-@@ -8736,7 +9258,13 @@ if test -z "$aix_libpath"; then aix_libpath="/usr/lib:/lib"; fi
+@@ -8738,7 +9260,13 @@ if test -z "$aix_libpath"; then aix_libpath="/usr/lib:/lib"; fi
  	else
  	 # Determine the default libpath from the value encoded in an
  	 # empty executable.
@@ -6888,7 +6887,7 @@ index 47ed79d1df4..bfbf4c421f3 100755
  /* end confdefs.h.  */
  
  int
-@@ -8749,22 +9277,29 @@ main ()
+@@ -8751,22 +9279,29 @@ main ()
  _ACEOF
  if ac_fn_c_try_link "$LINENO"; then :
  
@@ -6931,7 +6930,7 @@ index 47ed79d1df4..bfbf4c421f3 100755
  
  	 hardcode_libdir_flag_spec='${wl}-blibpath:$libdir:'"$aix_libpath"
  	  # Warning - without using the other run time loading flags,
-@@ -8809,20 +9344,63 @@ if test -z "$aix_libpath"; then aix_libpath="/usr/lib:/lib"; fi
+@@ -8811,20 +9346,63 @@ if test -z "$aix_libpath"; then aix_libpath="/usr/lib:/lib"; fi
        # Microsoft Visual C++.
        # hardcode_libdir_flag_spec is actually meaningless, as there is
        # no search path for DLLs.
@@ -7009,7 +7008,7 @@ index 47ed79d1df4..bfbf4c421f3 100755
        ;;
  
      darwin* | rhapsody*)
-@@ -8883,7 +9461,7 @@ if test -z "$aix_libpath"; then aix_libpath="/usr/lib:/lib"; fi
+@@ -8885,7 +9463,7 @@ if test -z "$aix_libpath"; then aix_libpath="/usr/lib:/lib"; fi
  
      # FreeBSD 3 and greater uses gcc -shared to do shared libraries.
      freebsd* | dragonfly*)
@@ -7018,7 +7017,7 @@ index 47ed79d1df4..bfbf4c421f3 100755
        hardcode_libdir_flag_spec='-R$libdir'
        hardcode_direct=yes
        hardcode_shlibpath_var=no
-@@ -8891,7 +9469,7 @@ if test -z "$aix_libpath"; then aix_libpath="/usr/lib:/lib"; fi
+@@ -8893,7 +9471,7 @@ if test -z "$aix_libpath"; then aix_libpath="/usr/lib:/lib"; fi
  
      hpux9*)
        if test "$GCC" = yes; then
@@ -7027,7 +7026,7 @@ index 47ed79d1df4..bfbf4c421f3 100755
        else
  	archive_cmds='$RM $output_objdir/$soname~$LD -b +b $install_libdir -o $output_objdir/$soname $libobjs $deplibs $linker_flags~test $output_objdir/$soname = $lib || mv $output_objdir/$soname $lib'
        fi
-@@ -8907,7 +9485,7 @@ if test -z "$aix_libpath"; then aix_libpath="/usr/lib:/lib"; fi
+@@ -8909,7 +9487,7 @@ if test -z "$aix_libpath"; then aix_libpath="/usr/lib:/lib"; fi
  
      hpux10*)
        if test "$GCC" = yes && test "$with_gnu_ld" = no; then
@@ -7036,7 +7035,7 @@ index 47ed79d1df4..bfbf4c421f3 100755
        else
  	archive_cmds='$LD -b +h $soname +b $install_libdir -o $lib $libobjs $deplibs $linker_flags'
        fi
-@@ -8931,10 +9509,10 @@ if test -z "$aix_libpath"; then aix_libpath="/usr/lib:/lib"; fi
+@@ -8933,10 +9511,10 @@ if test -z "$aix_libpath"; then aix_libpath="/usr/lib:/lib"; fi
  	  archive_cmds='$CC -shared ${wl}+h ${wl}$soname ${wl}+nodefaultrpath -o $lib $libobjs $deplibs $compiler_flags'
  	  ;;
  	ia64*)
@@ -7049,7 +7048,7 @@ index 47ed79d1df4..bfbf4c421f3 100755
  	  ;;
  	esac
        else
-@@ -9013,23 +9591,36 @@ fi
+@@ -9015,23 +9593,36 @@ fi
  
      irix5* | irix6* | nonstopux*)
        if test "$GCC" = yes; then
@@ -7094,7 +7093,7 @@ index 47ed79d1df4..bfbf4c421f3 100755
        else
  	archive_cmds='$CC -shared $libobjs $deplibs $compiler_flags -soname $soname `test -n "$verstring" && func_echo_all "-set_version $verstring"` -update_registry ${output_objdir}/so_locations -o $lib'
  	archive_expsym_cmds='$CC -shared $libobjs $deplibs $compiler_flags -soname $soname `test -n "$verstring" && func_echo_all "-set_version $verstring"` -update_registry ${output_objdir}/so_locations -exports_file $export_symbols -o $lib'
-@@ -9114,7 +9705,7 @@ rm -f core conftest.err conftest.$ac_objext \
+@@ -9116,7 +9707,7 @@ rm -f core conftest.err conftest.$ac_objext \
      osf4* | osf5*)	# as osf3* with the addition of -msym flag
        if test "$GCC" = yes; then
  	allow_undefined_flag=' ${wl}-expect_unresolved ${wl}\*'
@@ -7103,7 +7102,7 @@ index 47ed79d1df4..bfbf4c421f3 100755
  	hardcode_libdir_flag_spec='${wl}-rpath ${wl}$libdir'
        else
  	allow_undefined_flag=' -expect_unresolved \*'
-@@ -9133,9 +9724,9 @@ rm -f core conftest.err conftest.$ac_objext \
+@@ -9135,9 +9726,9 @@ rm -f core conftest.err conftest.$ac_objext \
        no_undefined_flag=' -z defs'
        if test "$GCC" = yes; then
  	wlarc='${wl}'
@@ -7115,7 +7114,7 @@ index 47ed79d1df4..bfbf4c421f3 100755
        else
  	case `$CC -V 2>&1` in
  	*"Compilers 5.0"*)
-@@ -9711,8 +10302,9 @@ cygwin* | mingw* | pw32* | cegcc*)
+@@ -9713,8 +10304,9 @@ cygwin* | mingw* | pw32* | cegcc*)
    need_version=no
    need_lib_prefix=no
  
@@ -7127,7 +7126,7 @@ index 47ed79d1df4..bfbf4c421f3 100755
      library_names_spec='$libname.dll.a'
      # DLL is installed to $(libdir)/../bin by postinstall_cmds
      postinstall_cmds='base_file=`basename \${file}`~
-@@ -9745,13 +10337,71 @@ cygwin* | mingw* | pw32* | cegcc*)
+@@ -9747,13 +10339,71 @@ cygwin* | mingw* | pw32* | cegcc*)
        library_names_spec='`echo ${libname} | sed -e 's/^lib/pw/'``echo ${release} | $SED -e 's/[.]/-/g'`${versuffix}${shared_ext}'
        ;;
      esac
@@ -7200,16 +7199,16 @@ index 47ed79d1df4..bfbf4c421f3 100755
    # FIXME: first we should search . and the directory the executable is in
    shlibpath_var=PATH
    ;;
-@@ -10653,7 +11303,7 @@ else
+@@ -10655,7 +11305,7 @@ else
    lt_dlunknown=0; lt_dlno_uscore=1; lt_dlneed_uscore=2
    lt_status=$lt_dlunknown
    cat > conftest.$ac_ext <<_LT_EOF
--#line 10656 "configure"
+-#line 10658 "configure"
 +#line $LINENO "configure"
  #include "confdefs.h"
  
  #if HAVE_DLFCN_H
-@@ -10697,10 +11347,10 @@ else
+@@ -10699,10 +11349,10 @@ else
  /* When -fvisbility=hidden is used, assume the code has been annotated
     correspondingly for the symbols needed.  */
  #if defined(__GNUC__) && (((__GNUC__ == 3) && (__GNUC_MINOR__ >= 3)) || (__GNUC__ > 3))
@@ -7222,16 +7221,16 @@ index 47ed79d1df4..bfbf4c421f3 100755
  int main ()
  {
    void *self = dlopen (0, LT_DLGLOBAL|LT_DLLAZY_OR_NOW);
-@@ -10759,7 +11409,7 @@ else
+@@ -10761,7 +11411,7 @@ else
    lt_dlunknown=0; lt_dlno_uscore=1; lt_dlneed_uscore=2
    lt_status=$lt_dlunknown
    cat > conftest.$ac_ext <<_LT_EOF
--#line 10762 "configure"
+-#line 10764 "configure"
 +#line $LINENO "configure"
  #include "confdefs.h"
  
  #if HAVE_DLFCN_H
-@@ -10803,10 +11453,10 @@ else
+@@ -10805,10 +11455,10 @@ else
  /* When -fvisbility=hidden is used, assume the code has been annotated
     correspondingly for the symbols needed.  */
  #if defined(__GNUC__) && (((__GNUC__ == 3) && (__GNUC_MINOR__ >= 3)) || (__GNUC__ > 3))
@@ -7244,7 +7243,7 @@ index 47ed79d1df4..bfbf4c421f3 100755
  int main ()
  {
    void *self = dlopen (0, LT_DLGLOBAL|LT_DLLAZY_OR_NOW);
-@@ -14726,13 +15376,20 @@ exeext='`$ECHO "$exeext" | $SED "$delay_single_quote_subst"`'
+@@ -14478,13 +15128,20 @@ exeext='`$ECHO "$exeext" | $SED "$delay_single_quote_subst"`'
  lt_unset='`$ECHO "$lt_unset" | $SED "$delay_single_quote_subst"`'
  lt_SP2NL='`$ECHO "$lt_SP2NL" | $SED "$delay_single_quote_subst"`'
  lt_NL2SP='`$ECHO "$lt_NL2SP" | $SED "$delay_single_quote_subst"`'
@@ -7265,7 +7264,7 @@ index 47ed79d1df4..bfbf4c421f3 100755
  STRIP='`$ECHO "$STRIP" | $SED "$delay_single_quote_subst"`'
  RANLIB='`$ECHO "$RANLIB" | $SED "$delay_single_quote_subst"`'
  old_postinstall_cmds='`$ECHO "$old_postinstall_cmds" | $SED "$delay_single_quote_subst"`'
-@@ -14747,14 +15404,17 @@ lt_cv_sys_global_symbol_pipe='`$ECHO "$lt_cv_sys_global_symbol_pipe" | $SED "$de
+@@ -14499,14 +15156,17 @@ lt_cv_sys_global_symbol_pipe='`$ECHO "$lt_cv_sys_global_symbol_pipe" | $SED "$de
  lt_cv_sys_global_symbol_to_cdecl='`$ECHO "$lt_cv_sys_global_symbol_to_cdecl" | $SED "$delay_single_quote_subst"`'
  lt_cv_sys_global_symbol_to_c_name_address='`$ECHO "$lt_cv_sys_global_symbol_to_c_name_address" | $SED "$delay_single_quote_subst"`'
  lt_cv_sys_global_symbol_to_c_name_address_lib_prefix='`$ECHO "$lt_cv_sys_global_symbol_to_c_name_address_lib_prefix" | $SED "$delay_single_quote_subst"`'
@@ -7284,7 +7283,7 @@ index 47ed79d1df4..bfbf4c421f3 100755
  DSYMUTIL='`$ECHO "$DSYMUTIL" | $SED "$delay_single_quote_subst"`'
  NMEDIT='`$ECHO "$NMEDIT" | $SED "$delay_single_quote_subst"`'
  LIPO='`$ECHO "$LIPO" | $SED "$delay_single_quote_subst"`'
-@@ -14787,12 +15447,12 @@ hardcode_shlibpath_var='`$ECHO "$hardcode_shlibpath_var" | $SED "$delay_single_q
+@@ -14539,12 +15199,12 @@ hardcode_shlibpath_var='`$ECHO "$hardcode_shlibpath_var" | $SED "$delay_single_q
  hardcode_automatic='`$ECHO "$hardcode_automatic" | $SED "$delay_single_quote_subst"`'
  inherit_rpath='`$ECHO "$inherit_rpath" | $SED "$delay_single_quote_subst"`'
  link_all_deplibs='`$ECHO "$link_all_deplibs" | $SED "$delay_single_quote_subst"`'
@@ -7298,7 +7297,7 @@ index 47ed79d1df4..bfbf4c421f3 100755
  file_list_spec='`$ECHO "$file_list_spec" | $SED "$delay_single_quote_subst"`'
  variables_saved_for_relink='`$ECHO "$variables_saved_for_relink" | $SED "$delay_single_quote_subst"`'
  need_lib_prefix='`$ECHO "$need_lib_prefix" | $SED "$delay_single_quote_subst"`'
-@@ -14847,8 +15507,13 @@ reload_flag \
+@@ -14599,8 +15259,13 @@ reload_flag \
  OBJDUMP \
  deplibs_check_method \
  file_magic_cmd \
@@ -7312,7 +7311,7 @@ index 47ed79d1df4..bfbf4c421f3 100755
  STRIP \
  RANLIB \
  CC \
-@@ -14858,12 +15523,14 @@ lt_cv_sys_global_symbol_pipe \
+@@ -14610,12 +15275,14 @@ lt_cv_sys_global_symbol_pipe \
  lt_cv_sys_global_symbol_to_cdecl \
  lt_cv_sys_global_symbol_to_c_name_address \
  lt_cv_sys_global_symbol_to_c_name_address_lib_prefix \
@@ -7328,7 +7327,7 @@ index 47ed79d1df4..bfbf4c421f3 100755
  DSYMUTIL \
  NMEDIT \
  LIPO \
-@@ -14879,7 +15546,6 @@ no_undefined_flag \
+@@ -14631,7 +15298,6 @@ no_undefined_flag \
  hardcode_libdir_flag_spec \
  hardcode_libdir_flag_spec_ld \
  hardcode_libdir_separator \
@@ -7336,7 +7335,7 @@ index 47ed79d1df4..bfbf4c421f3 100755
  exclude_expsyms \
  include_expsyms \
  file_list_spec \
-@@ -14915,6 +15581,7 @@ module_cmds \
+@@ -14667,6 +15333,7 @@ module_cmds \
  module_expsym_cmds \
  export_symbols_cmds \
  prelink_cmds \
@@ -7344,7 +7343,7 @@ index 47ed79d1df4..bfbf4c421f3 100755
  postinstall_cmds \
  postuninstall_cmds \
  finish_cmds \
-@@ -15688,7 +16355,8 @@ $as_echo X"$file" |
+@@ -15433,7 +16100,8 @@ $as_echo X"$file" |
  # NOTE: Changes made to this file will be lost: look at ltmain.sh.
  #
  #   Copyright (C) 1996, 1997, 1998, 1999, 2000, 2001, 2003, 2004, 2005,
@@ -7354,7 +7353,7 @@ index 47ed79d1df4..bfbf4c421f3 100755
  #   Written by Gordon Matzigkeit, 1996
  #
  #   This file is part of GNU Libtool.
-@@ -15791,19 +16459,42 @@ SP2NL=$lt_lt_SP2NL
+@@ -15536,19 +16204,42 @@ SP2NL=$lt_lt_SP2NL
  # turn newlines into spaces.
  NL2SP=$lt_lt_NL2SP
  
@@ -7398,7 +7397,7 @@ index 47ed79d1df4..bfbf4c421f3 100755
  # A symbol stripping program.
  STRIP=$lt_STRIP
  
-@@ -15833,6 +16524,12 @@ global_symbol_to_c_name_address=$lt_lt_cv_sys_global_symbol_to_c_name_address
+@@ -15578,6 +16269,12 @@ global_symbol_to_c_name_address=$lt_lt_cv_sys_global_symbol_to_c_name_address
  # Transform the output of nm in a C name address pair when lib prefix is needed.
  global_symbol_to_c_name_address_lib_prefix=$lt_lt_cv_sys_global_symbol_to_c_name_address_lib_prefix
  
@@ -7411,7 +7410,7 @@ index 47ed79d1df4..bfbf4c421f3 100755
  # The name of the directory that contains temporary libtool files.
  objdir=$objdir
  
-@@ -15842,6 +16539,9 @@ MAGIC_CMD=$MAGIC_CMD
+@@ -15587,6 +16284,9 @@ MAGIC_CMD=$MAGIC_CMD
  # Must we lock files when doing compilation?
  need_locks=$lt_need_locks
  
@@ -7421,7 +7420,7 @@ index 47ed79d1df4..bfbf4c421f3 100755
  # Tool to manipulate archived DWARF debug symbol files on Mac OS X.
  DSYMUTIL=$lt_DSYMUTIL
  
-@@ -15956,12 +16656,12 @@ with_gcc=$GCC
+@@ -15701,12 +16401,12 @@ with_gcc=$GCC
  # Compiler flag to turn off builtin functions.
  no_builtin_flag=$lt_lt_prog_compiler_no_builtin_flag
  
@@ -7437,7 +7436,7 @@ index 47ed79d1df4..bfbf4c421f3 100755
  # Compiler flag to prevent dynamic linking.
  link_static_flag=$lt_lt_prog_compiler_static
  
-@@ -16048,9 +16748,6 @@ inherit_rpath=$inherit_rpath
+@@ -15793,9 +16493,6 @@ inherit_rpath=$inherit_rpath
  # Whether libtool must link a program against all its dependency libraries.
  link_all_deplibs=$link_all_deplibs
  
@@ -7447,7 +7446,7 @@ index 47ed79d1df4..bfbf4c421f3 100755
  # Set to "yes" if exported symbols are required.
  always_export_symbols=$always_export_symbols
  
-@@ -16066,6 +16763,9 @@ include_expsyms=$lt_include_expsyms
+@@ -15811,6 +16508,9 @@ include_expsyms=$lt_include_expsyms
  # Commands necessary for linking programs (against libraries) with templates.
  prelink_cmds=$lt_prelink_cmds
  
@@ -7457,7 +7456,7 @@ index 47ed79d1df4..bfbf4c421f3 100755
  # Specify filename containing input files.
  file_list_spec=$lt_file_list_spec
  
-@@ -16098,210 +16798,169 @@ ltmain="$ac_aux_dir/ltmain.sh"
+@@ -15843,210 +16543,169 @@ ltmain="$ac_aux_dir/ltmain.sh"
    # if finds mixed CR/LF and LF-only lines.  Since sed operates in
    # text mode, it properly converts lines to CR/LF.  This bash problem
    # is reportedly fixed, but why not run on old versions too?
@@ -7852,7 +7851,7 @@ index f770dac57c5..dbdfd96c5ff 100644
  NM = @NM@
  NMEDIT = @NMEDIT@
 diff --git a/gprofng/configure b/gprofng/configure
-index 524dbe737ec..6aaed114536 100755
+index 3fd5b61c9a7..c2178fc289f 100755
 --- a/gprofng/configure
 +++ b/gprofng/configure
 @@ -672,6 +672,8 @@ OTOOL
@@ -9752,7 +9751,7 @@ index 524dbe737ec..6aaed114536 100755
    LDCXX=$LD
    LD=$lt_save_LD
    GCC=$lt_save_GCC
-@@ -17785,13 +18615,20 @@ exeext='`$ECHO "$exeext" | $SED "$delay_single_quote_subst"`'
+@@ -18025,13 +18855,20 @@ exeext='`$ECHO "$exeext" | $SED "$delay_single_quote_subst"`'
  lt_unset='`$ECHO "$lt_unset" | $SED "$delay_single_quote_subst"`'
  lt_SP2NL='`$ECHO "$lt_SP2NL" | $SED "$delay_single_quote_subst"`'
  lt_NL2SP='`$ECHO "$lt_NL2SP" | $SED "$delay_single_quote_subst"`'
@@ -9773,7 +9772,7 @@ index 524dbe737ec..6aaed114536 100755
  STRIP='`$ECHO "$STRIP" | $SED "$delay_single_quote_subst"`'
  RANLIB='`$ECHO "$RANLIB" | $SED "$delay_single_quote_subst"`'
  old_postinstall_cmds='`$ECHO "$old_postinstall_cmds" | $SED "$delay_single_quote_subst"`'
-@@ -17806,14 +18643,17 @@ lt_cv_sys_global_symbol_pipe='`$ECHO "$lt_cv_sys_global_symbol_pipe" | $SED "$de
+@@ -18046,14 +18883,17 @@ lt_cv_sys_global_symbol_pipe='`$ECHO "$lt_cv_sys_global_symbol_pipe" | $SED "$de
  lt_cv_sys_global_symbol_to_cdecl='`$ECHO "$lt_cv_sys_global_symbol_to_cdecl" | $SED "$delay_single_quote_subst"`'
  lt_cv_sys_global_symbol_to_c_name_address='`$ECHO "$lt_cv_sys_global_symbol_to_c_name_address" | $SED "$delay_single_quote_subst"`'
  lt_cv_sys_global_symbol_to_c_name_address_lib_prefix='`$ECHO "$lt_cv_sys_global_symbol_to_c_name_address_lib_prefix" | $SED "$delay_single_quote_subst"`'
@@ -9792,7 +9791,7 @@ index 524dbe737ec..6aaed114536 100755
  DSYMUTIL='`$ECHO "$DSYMUTIL" | $SED "$delay_single_quote_subst"`'
  NMEDIT='`$ECHO "$NMEDIT" | $SED "$delay_single_quote_subst"`'
  LIPO='`$ECHO "$LIPO" | $SED "$delay_single_quote_subst"`'
-@@ -17846,12 +18686,12 @@ hardcode_shlibpath_var='`$ECHO "$hardcode_shlibpath_var" | $SED "$delay_single_q
+@@ -18086,12 +18926,12 @@ hardcode_shlibpath_var='`$ECHO "$hardcode_shlibpath_var" | $SED "$delay_single_q
  hardcode_automatic='`$ECHO "$hardcode_automatic" | $SED "$delay_single_quote_subst"`'
  inherit_rpath='`$ECHO "$inherit_rpath" | $SED "$delay_single_quote_subst"`'
  link_all_deplibs='`$ECHO "$link_all_deplibs" | $SED "$delay_single_quote_subst"`'
@@ -9806,7 +9805,7 @@ index 524dbe737ec..6aaed114536 100755
  file_list_spec='`$ECHO "$file_list_spec" | $SED "$delay_single_quote_subst"`'
  variables_saved_for_relink='`$ECHO "$variables_saved_for_relink" | $SED "$delay_single_quote_subst"`'
  need_lib_prefix='`$ECHO "$need_lib_prefix" | $SED "$delay_single_quote_subst"`'
-@@ -17890,8 +18730,8 @@ old_archive_cmds_CXX='`$ECHO "$old_archive_cmds_CXX" | $SED "$delay_single_quote
+@@ -18130,8 +18970,8 @@ old_archive_cmds_CXX='`$ECHO "$old_archive_cmds_CXX" | $SED "$delay_single_quote
  compiler_CXX='`$ECHO "$compiler_CXX" | $SED "$delay_single_quote_subst"`'
  GCC_CXX='`$ECHO "$GCC_CXX" | $SED "$delay_single_quote_subst"`'
  lt_prog_compiler_no_builtin_flag_CXX='`$ECHO "$lt_prog_compiler_no_builtin_flag_CXX" | $SED "$delay_single_quote_subst"`'
@@ -9816,7 +9815,7 @@ index 524dbe737ec..6aaed114536 100755
  lt_prog_compiler_static_CXX='`$ECHO "$lt_prog_compiler_static_CXX" | $SED "$delay_single_quote_subst"`'
  lt_cv_prog_compiler_c_o_CXX='`$ECHO "$lt_cv_prog_compiler_c_o_CXX" | $SED "$delay_single_quote_subst"`'
  archive_cmds_need_lc_CXX='`$ECHO "$archive_cmds_need_lc_CXX" | $SED "$delay_single_quote_subst"`'
-@@ -17918,12 +18758,12 @@ hardcode_shlibpath_var_CXX='`$ECHO "$hardcode_shlibpath_var_CXX" | $SED "$delay_
+@@ -18158,12 +18998,12 @@ hardcode_shlibpath_var_CXX='`$ECHO "$hardcode_shlibpath_var_CXX" | $SED "$delay_
  hardcode_automatic_CXX='`$ECHO "$hardcode_automatic_CXX" | $SED "$delay_single_quote_subst"`'
  inherit_rpath_CXX='`$ECHO "$inherit_rpath_CXX" | $SED "$delay_single_quote_subst"`'
  link_all_deplibs_CXX='`$ECHO "$link_all_deplibs_CXX" | $SED "$delay_single_quote_subst"`'
@@ -9830,7 +9829,7 @@ index 524dbe737ec..6aaed114536 100755
  file_list_spec_CXX='`$ECHO "$file_list_spec_CXX" | $SED "$delay_single_quote_subst"`'
  hardcode_action_CXX='`$ECHO "$hardcode_action_CXX" | $SED "$delay_single_quote_subst"`'
  compiler_lib_search_dirs_CXX='`$ECHO "$compiler_lib_search_dirs_CXX" | $SED "$delay_single_quote_subst"`'
-@@ -17961,8 +18801,13 @@ reload_flag \
+@@ -18201,8 +19041,13 @@ reload_flag \
  OBJDUMP \
  deplibs_check_method \
  file_magic_cmd \
@@ -9844,7 +9843,7 @@ index 524dbe737ec..6aaed114536 100755
  STRIP \
  RANLIB \
  CC \
-@@ -17972,12 +18817,14 @@ lt_cv_sys_global_symbol_pipe \
+@@ -18212,12 +19057,14 @@ lt_cv_sys_global_symbol_pipe \
  lt_cv_sys_global_symbol_to_cdecl \
  lt_cv_sys_global_symbol_to_c_name_address \
  lt_cv_sys_global_symbol_to_c_name_address_lib_prefix \
@@ -9860,7 +9859,7 @@ index 524dbe737ec..6aaed114536 100755
  DSYMUTIL \
  NMEDIT \
  LIPO \
-@@ -17993,7 +18840,6 @@ no_undefined_flag \
+@@ -18233,7 +19080,6 @@ no_undefined_flag \
  hardcode_libdir_flag_spec \
  hardcode_libdir_flag_spec_ld \
  hardcode_libdir_separator \
@@ -9868,7 +9867,7 @@ index 524dbe737ec..6aaed114536 100755
  exclude_expsyms \
  include_expsyms \
  file_list_spec \
-@@ -18015,8 +18861,8 @@ LD_CXX \
+@@ -18255,8 +19101,8 @@ LD_CXX \
  reload_flag_CXX \
  compiler_CXX \
  lt_prog_compiler_no_builtin_flag_CXX \
@@ -9878,7 +9877,7 @@ index 524dbe737ec..6aaed114536 100755
  lt_prog_compiler_static_CXX \
  lt_cv_prog_compiler_c_o_CXX \
  export_dynamic_flag_spec_CXX \
-@@ -18028,7 +18874,6 @@ no_undefined_flag_CXX \
+@@ -18268,7 +19114,6 @@ no_undefined_flag_CXX \
  hardcode_libdir_flag_spec_CXX \
  hardcode_libdir_flag_spec_ld_CXX \
  hardcode_libdir_separator_CXX \
@@ -9886,7 +9885,7 @@ index 524dbe737ec..6aaed114536 100755
  exclude_expsyms_CXX \
  include_expsyms_CXX \
  file_list_spec_CXX \
-@@ -18062,6 +18907,7 @@ module_cmds \
+@@ -18302,6 +19147,7 @@ module_cmds \
  module_expsym_cmds \
  export_symbols_cmds \
  prelink_cmds \
@@ -9894,7 +9893,7 @@ index 524dbe737ec..6aaed114536 100755
  postinstall_cmds \
  postuninstall_cmds \
  finish_cmds \
-@@ -18076,7 +18922,8 @@ archive_expsym_cmds_CXX \
+@@ -18316,7 +19162,8 @@ archive_expsym_cmds_CXX \
  module_cmds_CXX \
  module_expsym_cmds_CXX \
  export_symbols_cmds_CXX \
@@ -9904,7 +9903,7 @@ index 524dbe737ec..6aaed114536 100755
      case \`eval \\\\\$ECHO \\\\""\\\\\$\$var"\\\\"\` in
      *[\\\\\\\`\\"\\\$]*)
        eval "lt_\$var=\\\\\\"\\\`\\\$ECHO \\"\\\$\$var\\" | \\\$SED -e \\"\\\$double_quote_subst\\" -e \\"\\\$sed_quote_subst\\" -e \\"\\\$delay_variable_subst\\"\\\`\\\\\\""
-@@ -18833,7 +19680,8 @@ $as_echo X"$file" |
+@@ -19073,7 +19920,8 @@ $as_echo X"$file" |
  # NOTE: Changes made to this file will be lost: look at ltmain.sh.
  #
  #   Copyright (C) 1996, 1997, 1998, 1999, 2000, 2001, 2003, 2004, 2005,
@@ -9914,7 +9913,7 @@ index 524dbe737ec..6aaed114536 100755
  #   Written by Gordon Matzigkeit, 1996
  #
  #   This file is part of GNU Libtool.
-@@ -18936,19 +19784,42 @@ SP2NL=$lt_lt_SP2NL
+@@ -19176,19 +20024,42 @@ SP2NL=$lt_lt_SP2NL
  # turn newlines into spaces.
  NL2SP=$lt_lt_NL2SP
  
@@ -9958,7 +9957,7 @@ index 524dbe737ec..6aaed114536 100755
  # A symbol stripping program.
  STRIP=$lt_STRIP
  
-@@ -18978,6 +19849,12 @@ global_symbol_to_c_name_address=$lt_lt_cv_sys_global_symbol_to_c_name_address
+@@ -19218,6 +20089,12 @@ global_symbol_to_c_name_address=$lt_lt_cv_sys_global_symbol_to_c_name_address
  # Transform the output of nm in a C name address pair when lib prefix is needed.
  global_symbol_to_c_name_address_lib_prefix=$lt_lt_cv_sys_global_symbol_to_c_name_address_lib_prefix
  
@@ -9971,7 +9970,7 @@ index 524dbe737ec..6aaed114536 100755
  # The name of the directory that contains temporary libtool files.
  objdir=$objdir
  
-@@ -18987,6 +19864,9 @@ MAGIC_CMD=$MAGIC_CMD
+@@ -19227,6 +20104,9 @@ MAGIC_CMD=$MAGIC_CMD
  # Must we lock files when doing compilation?
  need_locks=$lt_need_locks
  
@@ -9981,7 +9980,7 @@ index 524dbe737ec..6aaed114536 100755
  # Tool to manipulate archived DWARF debug symbol files on Mac OS X.
  DSYMUTIL=$lt_DSYMUTIL
  
-@@ -19101,12 +19981,12 @@ with_gcc=$GCC
+@@ -19341,12 +20221,12 @@ with_gcc=$GCC
  # Compiler flag to turn off builtin functions.
  no_builtin_flag=$lt_lt_prog_compiler_no_builtin_flag
  
@@ -9997,7 +9996,7 @@ index 524dbe737ec..6aaed114536 100755
  # Compiler flag to prevent dynamic linking.
  link_static_flag=$lt_lt_prog_compiler_static
  
-@@ -19193,9 +20073,6 @@ inherit_rpath=$inherit_rpath
+@@ -19433,9 +20313,6 @@ inherit_rpath=$inherit_rpath
  # Whether libtool must link a program against all its dependency libraries.
  link_all_deplibs=$link_all_deplibs
  
@@ -10007,7 +10006,7 @@ index 524dbe737ec..6aaed114536 100755
  # Set to "yes" if exported symbols are required.
  always_export_symbols=$always_export_symbols
  
-@@ -19211,6 +20088,9 @@ include_expsyms=$lt_include_expsyms
+@@ -19451,6 +20328,9 @@ include_expsyms=$lt_include_expsyms
  # Commands necessary for linking programs (against libraries) with templates.
  prelink_cmds=$lt_prelink_cmds
  
@@ -10017,7 +10016,7 @@ index 524dbe737ec..6aaed114536 100755
  # Specify filename containing input files.
  file_list_spec=$lt_file_list_spec
  
-@@ -19257,210 +20137,169 @@ ltmain="$ac_aux_dir/ltmain.sh"
+@@ -19497,210 +20377,169 @@ ltmain="$ac_aux_dir/ltmain.sh"
    # if finds mixed CR/LF and LF-only lines.  Since sed operates in
    # text mode, it properly converts lines to CR/LF.  This bash problem
    # is reportedly fixed, but why not run on old versions too?
@@ -10391,7 +10390,7 @@ index 524dbe737ec..6aaed114536 100755
      (rm -f "$ofile" && cp "$cfgfile" "$ofile" && rm -f "$cfgfile")
    chmod +x "$ofile"
  
-@@ -19488,12 +20327,12 @@ with_gcc=$GCC_CXX
+@@ -19728,12 +20567,12 @@ with_gcc=$GCC_CXX
  # Compiler flag to turn off builtin functions.
  no_builtin_flag=$lt_lt_prog_compiler_no_builtin_flag_CXX
  
@@ -10407,7 +10406,7 @@ index 524dbe737ec..6aaed114536 100755
  # Compiler flag to prevent dynamic linking.
  link_static_flag=$lt_lt_prog_compiler_static_CXX
  
-@@ -19580,9 +20419,6 @@ inherit_rpath=$inherit_rpath_CXX
+@@ -19820,9 +20659,6 @@ inherit_rpath=$inherit_rpath_CXX
  # Whether libtool must link a program against all its dependency libraries.
  link_all_deplibs=$link_all_deplibs_CXX
  
@@ -10417,7 +10416,7 @@ index 524dbe737ec..6aaed114536 100755
  # Set to "yes" if exported symbols are required.
  always_export_symbols=$always_export_symbols_CXX
  
-@@ -19598,6 +20434,9 @@ include_expsyms=$lt_include_expsyms_CXX
+@@ -19838,6 +20674,9 @@ include_expsyms=$lt_include_expsyms_CXX
  # Commands necessary for linking programs (against libraries) with templates.
  prelink_cmds=$lt_prelink_cmds_CXX
  
@@ -10488,7 +10487,7 @@ index 4448745f17e..ff20f8f0715 100644
  NM = @NM@
  NMEDIT = @NMEDIT@
 diff --git a/gprofng/libcollector/configure b/gprofng/libcollector/configure
-index b1ba1edb35b..5a20f484c38 100755
+index afdf3966baf..877afeb7c01 100755
 --- a/gprofng/libcollector/configure
 +++ b/gprofng/libcollector/configure
 @@ -640,6 +640,8 @@ OTOOL
@@ -13064,7 +13063,7 @@ index b1ba1edb35b..5a20f484c38 100755
  file_list_spec=$lt_file_list_spec_CXX
  
 diff --git a/gprofng/src/Makefile.in b/gprofng/src/Makefile.in
-index d0dec12e244..cf2745db706 100644
+index 0cdd4443670..07fdb4cfc6f 100644
 --- a/gprofng/src/Makefile.in
 +++ b/gprofng/src/Makefile.in
 @@ -322,6 +322,7 @@ CXXFLAGS = @CXXFLAGS@
@@ -13112,10 +13111,10 @@ index c3d08edbef1..7ee6acd3e03 100644
  ac_ct_CXX = @ac_ct_CXX@
  ac_ct_DUMPBIN = @ac_ct_DUMPBIN@
 diff --git a/ld/configure b/ld/configure
-index d537ec391d2..de7b61bb612 100755
+index ca3d58ff618..3cbf90b055f 100755
 --- a/ld/configure
 +++ b/ld/configure
-@@ -705,8 +705,11 @@ OTOOL
+@@ -703,8 +703,11 @@ OTOOL
  LIPO
  NMEDIT
  DSYMUTIL
@@ -13127,7 +13126,7 @@ index d537ec391d2..de7b61bb612 100755
  OBJDUMP
  LN_S
  NM
-@@ -836,6 +839,7 @@ enable_static
+@@ -834,6 +837,7 @@ enable_static
  with_pic
  enable_fast_install
  with_gnu_ld
@@ -13135,7 +13134,7 @@ index d537ec391d2..de7b61bb612 100755
  enable_libtool_lock
  enable_plugins
  enable_largefile
-@@ -1586,6 +1590,8 @@ Optional Packages:
+@@ -1582,6 +1586,8 @@ Optional Packages:
    --with-pic              try to use only PIC/non-PIC objects [default=use
                            both]
    --with-gnu-ld           assume the C compiler uses GNU ld [default=no]
@@ -13144,7 +13143,7 @@ index d537ec391d2..de7b61bb612 100755
    --with-lib-path=dir1:dir2...  set default LIB_PATH
    --with-sysroot=DIR Search for usr/lib et al within DIR.
    --with-gnu-ld           assume the C compiler uses GNU ld default=no
-@@ -5565,8 +5571,8 @@ esac
+@@ -5391,8 +5397,8 @@ esac
  
  
  
@@ -13155,7 +13154,7 @@ index d537ec391d2..de7b61bb612 100755
  
  
  
-@@ -5606,7 +5612,7 @@ ECHO=$ECHO$ECHO$ECHO$ECHO$ECHO$ECHO
+@@ -5432,7 +5438,7 @@ ECHO=$ECHO$ECHO$ECHO$ECHO$ECHO$ECHO
  { $as_echo "$as_me:${as_lineno-$LINENO}: checking how to print strings" >&5
  $as_echo_n "checking how to print strings... " >&6; }
  # Test print first, because it will be a builtin if present.
@@ -13164,7 +13163,7 @@ index d537ec391d2..de7b61bb612 100755
     test "X`print -r -- $ECHO 2>/dev/null`" = "X$ECHO"; then
    ECHO='print -r --'
  elif test "X`printf %s $ECHO 2>/dev/null`" = "X$ECHO"; then
-@@ -6299,8 +6305,8 @@ $as_echo_n "checking whether the shell understands some XSI constructs... " >&6;
+@@ -6125,8 +6131,8 @@ $as_echo_n "checking whether the shell understands some XSI constructs... " >&6;
  # Try some XSI features
  xsi_shell=no
  ( _lt_dummy="a/b/c"
@@ -13175,7 +13174,7 @@ index d537ec391d2..de7b61bb612 100755
      && eval 'test $(( 1 + 1 )) -eq 2 \
      && test "${#_lt_dummy}" -eq 5' ) >/dev/null 2>&1 \
    && xsi_shell=yes
-@@ -6349,6 +6355,80 @@ esac
+@@ -6175,6 +6181,80 @@ esac
  
  
  
@@ -13256,7 +13255,7 @@ index d537ec391d2..de7b61bb612 100755
  { $as_echo "$as_me:${as_lineno-$LINENO}: checking for $LD option to reload object files" >&5
  $as_echo_n "checking for $LD option to reload object files... " >&6; }
  if ${lt_cv_ld_reload_flag+:} false; then :
-@@ -6365,6 +6445,11 @@ case $reload_flag in
+@@ -6191,6 +6271,11 @@ case $reload_flag in
  esac
  reload_cmds='$LD$reload_flag -o $output$reload_objs'
  case $host_os in
@@ -13268,7 +13267,7 @@ index d537ec391d2..de7b61bb612 100755
    darwin*)
      if test "$GCC" = yes; then
        reload_cmds='$LTCC $LTCFLAGS -nostdlib ${wl}-r -o $output$reload_objs'
-@@ -6533,7 +6618,8 @@ mingw* | pw32*)
+@@ -6359,7 +6444,8 @@ mingw* | pw32*)
      lt_cv_deplibs_check_method='file_magic ^x86 archive import|^x86 DLL'
      lt_cv_file_magic_cmd='func_win32_libid'
    else
@@ -13278,7 +13277,7 @@ index d537ec391d2..de7b61bb612 100755
      lt_cv_file_magic_cmd='$OBJDUMP -f'
    fi
    ;;
-@@ -6692,6 +6778,21 @@ esac
+@@ -6518,6 +6604,21 @@ esac
  fi
  { $as_echo "$as_me:${as_lineno-$LINENO}: result: $lt_cv_deplibs_check_method" >&5
  $as_echo "$lt_cv_deplibs_check_method" >&6; }
@@ -13300,7 +13299,7 @@ index d537ec391d2..de7b61bb612 100755
  file_magic_cmd=$lt_cv_file_magic_cmd
  deplibs_check_method=$lt_cv_deplibs_check_method
  test -z "$deplibs_check_method" && deplibs_check_method=unknown
-@@ -6707,6 +6808,157 @@ test -z "$deplibs_check_method" && deplibs_check_method=unknown
+@@ -6533,6 +6634,157 @@ test -z "$deplibs_check_method" && deplibs_check_method=unknown
  
  
  
@@ -13458,7 +13457,7 @@ index d537ec391d2..de7b61bb612 100755
  plugin_option=
  plugin_names="liblto_plugin.so liblto_plugin-0.dll cyglto_plugin-0.dll"
  for plugin in $plugin_names; do
-@@ -6721,8 +6973,10 @@ for plugin in $plugin_names; do
+@@ -6547,8 +6799,10 @@ for plugin in $plugin_names; do
  done
  
  if test -n "$ac_tool_prefix"; then
@@ -13471,7 +13470,7 @@ index d537ec391d2..de7b61bb612 100755
  { $as_echo "$as_me:${as_lineno-$LINENO}: checking for $ac_word" >&5
  $as_echo_n "checking for $ac_word... " >&6; }
  if ${ac_cv_prog_AR+:} false; then :
-@@ -6738,7 +6992,7 @@ do
+@@ -6564,7 +6818,7 @@ do
    test -z "$as_dir" && as_dir=.
      for ac_exec_ext in '' $ac_executable_extensions; do
    if as_fn_executable_p "$as_dir/$ac_word$ac_exec_ext"; then
@@ -13480,7 +13479,7 @@ index d537ec391d2..de7b61bb612 100755
      $as_echo "$as_me:${as_lineno-$LINENO}: found $as_dir/$ac_word$ac_exec_ext" >&5
      break 2
    fi
-@@ -6758,11 +7012,15 @@ $as_echo "no" >&6; }
+@@ -6584,11 +6838,15 @@ $as_echo "no" >&6; }
  fi
  
  
@@ -13499,7 +13498,7 @@ index d537ec391d2..de7b61bb612 100755
  { $as_echo "$as_me:${as_lineno-$LINENO}: checking for $ac_word" >&5
  $as_echo_n "checking for $ac_word... " >&6; }
  if ${ac_cv_prog_ac_ct_AR+:} false; then :
-@@ -6778,7 +7036,7 @@ do
+@@ -6604,7 +6862,7 @@ do
    test -z "$as_dir" && as_dir=.
      for ac_exec_ext in '' $ac_executable_extensions; do
    if as_fn_executable_p "$as_dir/$ac_word$ac_exec_ext"; then
@@ -13508,7 +13507,7 @@ index d537ec391d2..de7b61bb612 100755
      $as_echo "$as_me:${as_lineno-$LINENO}: found $as_dir/$ac_word$ac_exec_ext" >&5
      break 2
    fi
-@@ -6797,6 +7055,10 @@ else
+@@ -6623,6 +6881,10 @@ else
  $as_echo "no" >&6; }
  fi
  
@@ -13519,7 +13518,7 @@ index d537ec391d2..de7b61bb612 100755
    if test "x$ac_ct_AR" = x; then
      AR="false"
    else
-@@ -6808,29 +7070,81 @@ ac_tool_warned=yes ;;
+@@ -6634,29 +6896,81 @@ ac_tool_warned=yes ;;
  esac
      AR=$ac_ct_AR
    fi
@@ -13616,7 +13615,7 @@ index d537ec391d2..de7b61bb612 100755
  
  
  
-@@ -7177,8 +7491,8 @@ esac
+@@ -7003,8 +7317,8 @@ esac
  lt_cv_sys_global_symbol_to_cdecl="sed -n -e 's/^T .* \(.*\)$/extern int \1();/p' -e 's/^$symcode* .* \(.*\)$/extern char \1;/p'"
  
  # Transform an extracted symbol line into symbol name and symbol address
@@ -13627,7 +13626,7 @@ index d537ec391d2..de7b61bb612 100755
  
  # Handle CRLF in mingw tool chain
  opt_cr=
-@@ -7214,6 +7528,7 @@ for ac_symprfx in "" "_"; do
+@@ -7040,6 +7354,7 @@ for ac_symprfx in "" "_"; do
    else
      lt_cv_sys_global_symbol_pipe="sed -n -e 's/^.*[	 ]\($symcode$symcode*\)[	 ][	 ]*$ac_symprfx$sympat$opt_cr$/$symxfrm/p'"
    fi
@@ -13635,7 +13634,7 @@ index d537ec391d2..de7b61bb612 100755
  
    # Check to see that the pipe works correctly.
    pipe_works=no
-@@ -7255,6 +7570,18 @@ _LT_EOF
+@@ -7081,6 +7396,18 @@ _LT_EOF
        if $GREP ' nm_test_var$' "$nlist" >/dev/null; then
  	if $GREP ' nm_test_func$' "$nlist" >/dev/null; then
  	  cat <<_LT_EOF > conftest.$ac_ext
@@ -13654,7 +13653,7 @@ index d537ec391d2..de7b61bb612 100755
  #ifdef __cplusplus
  extern "C" {
  #endif
-@@ -7266,7 +7593,7 @@ _LT_EOF
+@@ -7092,7 +7419,7 @@ _LT_EOF
  	  cat <<_LT_EOF >> conftest.$ac_ext
  
  /* The mapping between symbol names and symbols.  */
@@ -13663,7 +13662,7 @@ index d537ec391d2..de7b61bb612 100755
    const char *name;
    void       *address;
  }
-@@ -7292,8 +7619,8 @@ static const void *lt_preloaded_setup() {
+@@ -7118,8 +7445,8 @@ static const void *lt_preloaded_setup() {
  _LT_EOF
  	  # Now try linking the two files.
  	  mv conftest.$ac_objext conftstm.$ac_objext
@@ -13674,7 +13673,7 @@ index d537ec391d2..de7b61bb612 100755
  	  LIBS="conftstm.$ac_objext"
  	  CFLAGS="$CFLAGS$lt_prog_compiler_no_builtin_flag"
  	  if { { eval echo "\"\$as_me\":${as_lineno-$LINENO}: \"$ac_link\""; } >&5
-@@ -7303,8 +7630,8 @@ _LT_EOF
+@@ -7129,8 +7456,8 @@ _LT_EOF
    test $ac_status = 0; } && test -s conftest${ac_exeext}; then
  	    pipe_works=yes
  	  fi
@@ -13685,7 +13684,7 @@ index d537ec391d2..de7b61bb612 100755
  	else
  	  echo "cannot find nm_test_func in $nlist" >&5
  	fi
-@@ -7341,6 +7668,27 @@ else
+@@ -7167,6 +7494,27 @@ else
  $as_echo "ok" >&6; }
  fi
  
@@ -13713,7 +13712,7 @@ index d537ec391d2..de7b61bb612 100755
  
  
  
-@@ -7353,10 +7701,38 @@ fi
+@@ -7179,10 +7527,38 @@ fi
  
  
  
@@ -13752,7 +13751,7 @@ index d537ec391d2..de7b61bb612 100755
  
  
  
-@@ -7568,6 +7944,123 @@ esac
+@@ -7394,6 +7770,123 @@ esac
  
  need_locks="$enable_libtool_lock"
  
@@ -13876,7 +13875,7 @@ index d537ec391d2..de7b61bb612 100755
  
    case $host_os in
      rhapsody* | darwin*)
-@@ -8131,6 +8624,8 @@ _LT_EOF
+@@ -7957,6 +8450,8 @@ _LT_EOF
        $LTCC $LTCFLAGS -c -o conftest.o conftest.c 2>&5
        echo "$AR cru libconftest.a conftest.o" >&5
        $AR cru libconftest.a conftest.o 2>&5
@@ -13885,7 +13884,7 @@ index d537ec391d2..de7b61bb612 100755
        cat > conftest.c << _LT_EOF
  int main() { return 0;}
  _LT_EOF
-@@ -8201,6 +8696,16 @@ done
+@@ -8027,6 +8522,16 @@ done
  
  
  
@@ -13902,7 +13901,7 @@ index d537ec391d2..de7b61bb612 100755
  
  
  # Set options
-@@ -8716,8 +9221,6 @@ fi
+@@ -8542,8 +9047,6 @@ fi
  lt_prog_compiler_pic=
  lt_prog_compiler_static=
  
@@ -13911,7 +13910,7 @@ index d537ec391d2..de7b61bb612 100755
  
    if test "$GCC" = yes; then
      lt_prog_compiler_wl='-Wl,'
-@@ -8883,6 +9386,12 @@ $as_echo_n "checking for $compiler option to produce PIC... " >&6; }
+@@ -8709,6 +9212,12 @@ $as_echo_n "checking for $compiler option to produce PIC... " >&6; }
  	lt_prog_compiler_pic='--shared'
  	lt_prog_compiler_static='--static'
  	;;
@@ -13924,7 +13923,7 @@ index d537ec391d2..de7b61bb612 100755
        pgcc* | pgf77* | pgf90* | pgf95* | pgfortran*)
          # Portland Group compilers (*not* the Pentium gcc compiler,
  	# which looks to be a dead project)
-@@ -8945,7 +9454,7 @@ $as_echo_n "checking for $compiler option to produce PIC... " >&6; }
+@@ -8771,7 +9280,7 @@ $as_echo_n "checking for $compiler option to produce PIC... " >&6; }
        lt_prog_compiler_pic='-KPIC'
        lt_prog_compiler_static='-Bstatic'
        case $cc_basename in
@@ -13933,7 +13932,7 @@ index d537ec391d2..de7b61bb612 100755
  	lt_prog_compiler_wl='-Qoption ld ';;
        *)
  	lt_prog_compiler_wl='-Wl,';;
-@@ -9002,13 +9511,17 @@ case $host_os in
+@@ -8828,13 +9337,17 @@ case $host_os in
      lt_prog_compiler_pic="$lt_prog_compiler_pic -DPIC"
      ;;
  esac
@@ -13957,7 +13956,7 @@ index d537ec391d2..de7b61bb612 100755
  
  #
  # Check to make sure the PIC flag actually works.
-@@ -9069,6 +9582,11 @@ fi
+@@ -8895,6 +9408,11 @@ fi
  
  
  
@@ -13969,7 +13968,7 @@ index d537ec391d2..de7b61bb612 100755
  #
  # Check to make sure the static flag actually works.
  #
-@@ -9419,7 +9937,8 @@ _LT_EOF
+@@ -9245,7 +9763,8 @@ _LT_EOF
        allow_undefined_flag=unsupported
        always_export_symbols=no
        enable_shared_with_static_runtimes=yes
@@ -13979,7 +13978,7 @@ index d537ec391d2..de7b61bb612 100755
  
        if $LD --help 2>&1 | $GREP 'auto-import' > /dev/null; then
          archive_cmds='$CC -shared $libobjs $deplibs $compiler_flags -o $output_objdir/$soname ${wl}--enable-auto-image-base -Xlinker --out-implib -Xlinker $lib'
-@@ -9518,12 +10037,12 @@ _LT_EOF
+@@ -9344,12 +9863,12 @@ _LT_EOF
  	  whole_archive_flag_spec='--whole-archive$convenience --no-whole-archive'
  	  hardcode_libdir_flag_spec=
  	  hardcode_libdir_flag_spec_ld='-rpath $libdir'
@@ -13994,7 +13993,7 @@ index d537ec391d2..de7b61bb612 100755
  	  fi
  	  ;;
  	esac
-@@ -9537,8 +10056,8 @@ _LT_EOF
+@@ -9363,8 +9882,8 @@ _LT_EOF
  	archive_cmds='$LD -Bshareable $libobjs $deplibs $linker_flags -o $lib'
  	wlarc=
        else
@@ -14005,7 +14004,7 @@ index d537ec391d2..de7b61bb612 100755
        fi
        ;;
  
-@@ -9556,8 +10075,8 @@ _LT_EOF
+@@ -9382,8 +9901,8 @@ _LT_EOF
  
  _LT_EOF
        elif $LD --help 2>&1 | $GREP ': supported targets:.* elf' > /dev/null; then
@@ -14016,7 +14015,7 @@ index d537ec391d2..de7b61bb612 100755
        else
  	ld_shlibs=no
        fi
-@@ -9603,8 +10122,8 @@ _LT_EOF
+@@ -9429,8 +9948,8 @@ _LT_EOF
  
      *)
        if $LD --help 2>&1 | $GREP ': supported targets:.* elf' > /dev/null; then
@@ -14027,7 +14026,7 @@ index d537ec391d2..de7b61bb612 100755
        else
  	ld_shlibs=no
        fi
-@@ -9734,7 +10253,13 @@ _LT_EOF
+@@ -9560,7 +10079,13 @@ _LT_EOF
  	allow_undefined_flag='-berok'
          # Determine the default libpath from the value encoded in an
          # empty executable.
@@ -14042,7 +14041,7 @@ index d537ec391d2..de7b61bb612 100755
  /* end confdefs.h.  */
  
  int
-@@ -9747,22 +10272,29 @@ main ()
+@@ -9573,22 +10098,29 @@ main ()
  _ACEOF
  if ac_fn_c_try_link "$LINENO"; then :
  
@@ -14085,7 +14084,7 @@ index d537ec391d2..de7b61bb612 100755
  
          hardcode_libdir_flag_spec='${wl}-blibpath:$libdir:'"$aix_libpath"
          archive_expsym_cmds='$CC -o $output_objdir/$soname $libobjs $deplibs '"\${wl}$no_entry_flag"' $compiler_flags `if test "x${allow_undefined_flag}" != "x"; then func_echo_all "${wl}${allow_undefined_flag}"; else :; fi` '"\${wl}$exp_sym_flag:\$export_symbols $shared_flag"
-@@ -9774,7 +10306,13 @@ if test -z "$aix_libpath"; then aix_libpath="/usr/lib:/lib"; fi
+@@ -9600,7 +10132,13 @@ if test -z "$aix_libpath"; then aix_libpath="/usr/lib:/lib"; fi
  	else
  	 # Determine the default libpath from the value encoded in an
  	 # empty executable.
@@ -14100,7 +14099,7 @@ index d537ec391d2..de7b61bb612 100755
  /* end confdefs.h.  */
  
  int
-@@ -9787,22 +10325,29 @@ main ()
+@@ -9613,22 +10151,29 @@ main ()
  _ACEOF
  if ac_fn_c_try_link "$LINENO"; then :
  
@@ -14143,7 +14142,7 @@ index d537ec391d2..de7b61bb612 100755
  
  	 hardcode_libdir_flag_spec='${wl}-blibpath:$libdir:'"$aix_libpath"
  	  # Warning - without using the other run time loading flags,
-@@ -9847,20 +10392,63 @@ if test -z "$aix_libpath"; then aix_libpath="/usr/lib:/lib"; fi
+@@ -9673,20 +10218,63 @@ if test -z "$aix_libpath"; then aix_libpath="/usr/lib:/lib"; fi
        # Microsoft Visual C++.
        # hardcode_libdir_flag_spec is actually meaningless, as there is
        # no search path for DLLs.
@@ -14221,7 +14220,7 @@ index d537ec391d2..de7b61bb612 100755
        ;;
  
      darwin* | rhapsody*)
-@@ -9921,7 +10509,7 @@ if test -z "$aix_libpath"; then aix_libpath="/usr/lib:/lib"; fi
+@@ -9747,7 +10335,7 @@ if test -z "$aix_libpath"; then aix_libpath="/usr/lib:/lib"; fi
  
      # FreeBSD 3 and greater uses gcc -shared to do shared libraries.
      freebsd* | dragonfly*)
@@ -14230,7 +14229,7 @@ index d537ec391d2..de7b61bb612 100755
        hardcode_libdir_flag_spec='-R$libdir'
        hardcode_direct=yes
        hardcode_shlibpath_var=no
-@@ -9929,7 +10517,7 @@ if test -z "$aix_libpath"; then aix_libpath="/usr/lib:/lib"; fi
+@@ -9755,7 +10343,7 @@ if test -z "$aix_libpath"; then aix_libpath="/usr/lib:/lib"; fi
  
      hpux9*)
        if test "$GCC" = yes; then
@@ -14239,7 +14238,7 @@ index d537ec391d2..de7b61bb612 100755
        else
  	archive_cmds='$RM $output_objdir/$soname~$LD -b +b $install_libdir -o $output_objdir/$soname $libobjs $deplibs $linker_flags~test $output_objdir/$soname = $lib || mv $output_objdir/$soname $lib'
        fi
-@@ -9945,7 +10533,7 @@ if test -z "$aix_libpath"; then aix_libpath="/usr/lib:/lib"; fi
+@@ -9771,7 +10359,7 @@ if test -z "$aix_libpath"; then aix_libpath="/usr/lib:/lib"; fi
  
      hpux10*)
        if test "$GCC" = yes && test "$with_gnu_ld" = no; then
@@ -14248,7 +14247,7 @@ index d537ec391d2..de7b61bb612 100755
        else
  	archive_cmds='$LD -b +h $soname +b $install_libdir -o $lib $libobjs $deplibs $linker_flags'
        fi
-@@ -9969,10 +10557,10 @@ if test -z "$aix_libpath"; then aix_libpath="/usr/lib:/lib"; fi
+@@ -9795,10 +10383,10 @@ if test -z "$aix_libpath"; then aix_libpath="/usr/lib:/lib"; fi
  	  archive_cmds='$CC -shared ${wl}+h ${wl}$soname ${wl}+nodefaultrpath -o $lib $libobjs $deplibs $compiler_flags'
  	  ;;
  	ia64*)
@@ -14261,7 +14260,7 @@ index d537ec391d2..de7b61bb612 100755
  	  ;;
  	esac
        else
-@@ -10051,23 +10639,36 @@ fi
+@@ -9877,23 +10465,36 @@ fi
  
      irix5* | irix6* | nonstopux*)
        if test "$GCC" = yes; then
@@ -14306,7 +14305,7 @@ index d537ec391d2..de7b61bb612 100755
        else
  	archive_cmds='$CC -shared $libobjs $deplibs $compiler_flags -soname $soname `test -n "$verstring" && func_echo_all "-set_version $verstring"` -update_registry ${output_objdir}/so_locations -o $lib'
  	archive_expsym_cmds='$CC -shared $libobjs $deplibs $compiler_flags -soname $soname `test -n "$verstring" && func_echo_all "-set_version $verstring"` -update_registry ${output_objdir}/so_locations -exports_file $export_symbols -o $lib'
-@@ -10152,7 +10753,7 @@ rm -f core conftest.err conftest.$ac_objext \
+@@ -9978,7 +10579,7 @@ rm -f core conftest.err conftest.$ac_objext \
      osf4* | osf5*)	# as osf3* with the addition of -msym flag
        if test "$GCC" = yes; then
  	allow_undefined_flag=' ${wl}-expect_unresolved ${wl}\*'
@@ -14315,7 +14314,7 @@ index d537ec391d2..de7b61bb612 100755
  	hardcode_libdir_flag_spec='${wl}-rpath ${wl}$libdir'
        else
  	allow_undefined_flag=' -expect_unresolved \*'
-@@ -10171,9 +10772,9 @@ rm -f core conftest.err conftest.$ac_objext \
+@@ -9997,9 +10598,9 @@ rm -f core conftest.err conftest.$ac_objext \
        no_undefined_flag=' -z defs'
        if test "$GCC" = yes; then
  	wlarc='${wl}'
@@ -14327,7 +14326,7 @@ index d537ec391d2..de7b61bb612 100755
        else
  	case `$CC -V 2>&1` in
  	*"Compilers 5.0"*)
-@@ -10749,8 +11350,9 @@ cygwin* | mingw* | pw32* | cegcc*)
+@@ -10575,8 +11176,9 @@ cygwin* | mingw* | pw32* | cegcc*)
    need_version=no
    need_lib_prefix=no
  
@@ -14339,7 +14338,7 @@ index d537ec391d2..de7b61bb612 100755
      library_names_spec='$libname.dll.a'
      # DLL is installed to $(libdir)/../bin by postinstall_cmds
      postinstall_cmds='base_file=`basename \${file}`~
-@@ -10783,13 +11385,71 @@ cygwin* | mingw* | pw32* | cegcc*)
+@@ -10609,13 +11211,71 @@ cygwin* | mingw* | pw32* | cegcc*)
        library_names_spec='`echo ${libname} | sed -e 's/^lib/pw/'``echo ${release} | $SED -e 's/[.]/-/g'`${versuffix}${shared_ext}'
        ;;
      esac
@@ -14412,16 +14411,16 @@ index d537ec391d2..de7b61bb612 100755
    # FIXME: first we should search . and the directory the executable is in
    shlibpath_var=PATH
    ;;
-@@ -11691,7 +12351,7 @@ else
+@@ -11517,7 +12177,7 @@ else
    lt_dlunknown=0; lt_dlno_uscore=1; lt_dlneed_uscore=2
    lt_status=$lt_dlunknown
    cat > conftest.$ac_ext <<_LT_EOF
--#line 11691 "configure"
+-#line 11520 "configure"
 +#line $LINENO "configure"
  #include "confdefs.h"
  
  #if HAVE_DLFCN_H
-@@ -11735,10 +12395,10 @@ else
+@@ -11561,10 +12221,10 @@ else
  /* When -fvisbility=hidden is used, assume the code has been annotated
     correspondingly for the symbols needed.  */
  #if defined(__GNUC__) && (((__GNUC__ == 3) && (__GNUC_MINOR__ >= 3)) || (__GNUC__ > 3))
@@ -14434,16 +14433,16 @@ index d537ec391d2..de7b61bb612 100755
  int main ()
  {
    void *self = dlopen (0, LT_DLGLOBAL|LT_DLLAZY_OR_NOW);
-@@ -11797,7 +12457,7 @@ else
+@@ -11623,7 +12283,7 @@ else
    lt_dlunknown=0; lt_dlno_uscore=1; lt_dlneed_uscore=2
    lt_status=$lt_dlunknown
    cat > conftest.$ac_ext <<_LT_EOF
--#line 11797 "configure"
+-#line 11626 "configure"
 +#line $LINENO "configure"
  #include "confdefs.h"
  
  #if HAVE_DLFCN_H
-@@ -11841,10 +12501,10 @@ else
+@@ -11667,10 +12327,10 @@ else
  /* When -fvisbility=hidden is used, assume the code has been annotated
     correspondingly for the symbols needed.  */
  #if defined(__GNUC__) && (((__GNUC__ == 3) && (__GNUC_MINOR__ >= 3)) || (__GNUC__ > 3))
@@ -14456,7 +14455,7 @@ index d537ec391d2..de7b61bb612 100755
  int main ()
  {
    void *self = dlopen (0, LT_DLGLOBAL|LT_DLLAZY_OR_NOW);
-@@ -12236,6 +12896,7 @@ $RM -r conftest*
+@@ -12062,6 +12722,7 @@ $RM -r conftest*
  
    # Allow CC to be a program name with arguments.
    lt_save_CC=$CC
@@ -14464,7 +14463,7 @@ index d537ec391d2..de7b61bb612 100755
    lt_save_LD=$LD
    lt_save_GCC=$GCC
    GCC=$GXX
-@@ -12253,6 +12914,7 @@ $RM -r conftest*
+@@ -12079,6 +12740,7 @@ $RM -r conftest*
    fi
    test -z "${LDCXX+set}" || LD=$LDCXX
    CC=${CXX-"c++"}
@@ -14472,7 +14471,7 @@ index d537ec391d2..de7b61bb612 100755
    compiler=$CC
    compiler_CXX=$CC
    for cc_temp in $compiler""; do
-@@ -12535,7 +13197,13 @@ $as_echo_n "checking whether the $compiler linker ($LD) supports shared librarie
+@@ -12361,7 +13023,13 @@ $as_echo_n "checking whether the $compiler linker ($LD) supports shared librarie
            allow_undefined_flag_CXX='-berok'
            # Determine the default libpath from the value encoded in an empty
            # executable.
@@ -14487,7 +14486,7 @@ index d537ec391d2..de7b61bb612 100755
  /* end confdefs.h.  */
  
  int
-@@ -12548,22 +13216,29 @@ main ()
+@@ -12374,22 +13042,29 @@ main ()
  _ACEOF
  if ac_fn_cxx_try_link "$LINENO"; then :
  
@@ -14530,7 +14529,7 @@ index d537ec391d2..de7b61bb612 100755
  
            hardcode_libdir_flag_spec_CXX='${wl}-blibpath:$libdir:'"$aix_libpath"
  
-@@ -12576,7 +13251,13 @@ if test -z "$aix_libpath"; then aix_libpath="/usr/lib:/lib"; fi
+@@ -12402,7 +13077,13 @@ if test -z "$aix_libpath"; then aix_libpath="/usr/lib:/lib"; fi
            else
  	    # Determine the default libpath from the value encoded in an
  	    # empty executable.
@@ -14545,7 +14544,7 @@ index d537ec391d2..de7b61bb612 100755
  /* end confdefs.h.  */
  
  int
-@@ -12589,22 +13270,29 @@ main ()
+@@ -12415,22 +13096,29 @@ main ()
  _ACEOF
  if ac_fn_cxx_try_link "$LINENO"; then :
  
@@ -14588,7 +14587,7 @@ index d537ec391d2..de7b61bb612 100755
  
  	    hardcode_libdir_flag_spec_CXX='${wl}-blibpath:$libdir:'"$aix_libpath"
  	    # Warning - without using the other run time loading flags,
-@@ -12647,29 +13335,75 @@ if test -z "$aix_libpath"; then aix_libpath="/usr/lib:/lib"; fi
+@@ -12473,29 +13161,75 @@ if test -z "$aix_libpath"; then aix_libpath="/usr/lib:/lib"; fi
          ;;
  
        cygwin* | mingw* | pw32* | cegcc*)
@@ -14687,7 +14686,7 @@ index d537ec391d2..de7b61bb612 100755
        darwin* | rhapsody*)
  
  
-@@ -12775,7 +13509,7 @@ if test -z "$aix_libpath"; then aix_libpath="/usr/lib:/lib"; fi
+@@ -12601,7 +13335,7 @@ if test -z "$aix_libpath"; then aix_libpath="/usr/lib:/lib"; fi
              ;;
            *)
              if test "$GXX" = yes; then
@@ -14696,7 +14695,7 @@ index d537ec391d2..de7b61bb612 100755
              else
                # FIXME: insert proper C++ library support
                ld_shlibs_CXX=no
-@@ -12846,10 +13580,10 @@ if test -z "$aix_libpath"; then aix_libpath="/usr/lib:/lib"; fi
+@@ -12672,10 +13406,10 @@ if test -z "$aix_libpath"; then aix_libpath="/usr/lib:/lib"; fi
  	            archive_cmds_CXX='$CC -shared -nostdlib -fPIC ${wl}+h ${wl}$soname ${wl}+nodefaultrpath -o $lib $predep_objects $libobjs $deplibs $postdep_objects $compiler_flags'
  	            ;;
  	          ia64*)
@@ -14709,7 +14708,7 @@ index d537ec391d2..de7b61bb612 100755
  	            ;;
  	        esac
  	      fi
-@@ -12890,9 +13624,9 @@ if test -z "$aix_libpath"; then aix_libpath="/usr/lib:/lib"; fi
+@@ -12716,9 +13450,9 @@ if test -z "$aix_libpath"; then aix_libpath="/usr/lib:/lib"; fi
            *)
  	    if test "$GXX" = yes; then
  	      if test "$with_gnu_ld" = no; then
@@ -14721,7 +14720,7 @@ index d537ec391d2..de7b61bb612 100755
  	      fi
  	    fi
  	    link_all_deplibs_CXX=yes
-@@ -13170,7 +13904,7 @@ if test -z "$aix_libpath"; then aix_libpath="/usr/lib:/lib"; fi
+@@ -12996,7 +13730,7 @@ if test -z "$aix_libpath"; then aix_libpath="/usr/lib:/lib"; fi
  	          archive_cmds_CXX='$CC -shared -nostdlib ${allow_undefined_flag} $predep_objects $libobjs $deplibs $postdep_objects $compiler_flags ${wl}-soname ${wl}$soname `test -n "$verstring" && func_echo_all "${wl}-set_version ${wl}$verstring"` ${wl}-update_registry ${wl}${output_objdir}/so_locations -o $lib'
  		  ;;
  	        *)
@@ -14730,7 +14729,7 @@ index d537ec391d2..de7b61bb612 100755
  		  ;;
  	      esac
  
-@@ -13216,7 +13950,7 @@ if test -z "$aix_libpath"; then aix_libpath="/usr/lib:/lib"; fi
+@@ -13042,7 +13776,7 @@ if test -z "$aix_libpath"; then aix_libpath="/usr/lib:/lib"; fi
  
        solaris*)
          case $cc_basename in
@@ -14739,7 +14738,7 @@ index d537ec391d2..de7b61bb612 100755
  	    # Sun C++ 4.2, 5.x and Centerline C++
              archive_cmds_need_lc_CXX=yes
  	    no_undefined_flag_CXX=' -zdefs'
-@@ -13257,9 +13991,9 @@ if test -z "$aix_libpath"; then aix_libpath="/usr/lib:/lib"; fi
+@@ -13083,9 +13817,9 @@ if test -z "$aix_libpath"; then aix_libpath="/usr/lib:/lib"; fi
  	    if test "$GXX" = yes && test "$with_gnu_ld" = no; then
  	      no_undefined_flag_CXX=' ${wl}-z ${wl}defs'
  	      if $CC --version | $GREP -v '^2\.7' > /dev/null; then
@@ -14751,7 +14750,7 @@ index d537ec391d2..de7b61bb612 100755
  
  	        # Commands to make compiler produce verbose output that lists
  	        # what "hidden" libraries, object files and flags are used when
-@@ -13395,6 +14129,13 @@ private:
+@@ -13221,6 +13955,13 @@ private:
  };
  _LT_EOF
  
@@ -14765,7 +14764,7 @@ index d537ec391d2..de7b61bb612 100755
  if { { eval echo "\"\$as_me\":${as_lineno-$LINENO}: \"$ac_compile\""; } >&5
    (eval $ac_compile) 2>&5
    ac_status=$?
-@@ -13408,7 +14149,7 @@ if { { eval echo "\"\$as_me\":${as_lineno-$LINENO}: \"$ac_compile\""; } >&5
+@@ -13234,7 +13975,7 @@ if { { eval echo "\"\$as_me\":${as_lineno-$LINENO}: \"$ac_compile\""; } >&5
    pre_test_object_deps_done=no
  
    for p in `eval "$output_verbose_link_cmd"`; do
@@ -14774,7 +14773,7 @@ index d537ec391d2..de7b61bb612 100755
  
      -L* | -R* | -l*)
         # Some compilers place space between "-{L,R}" and the path.
-@@ -13417,13 +14158,22 @@ if { { eval echo "\"\$as_me\":${as_lineno-$LINENO}: \"$ac_compile\""; } >&5
+@@ -13243,13 +13984,22 @@ if { { eval echo "\"\$as_me\":${as_lineno-$LINENO}: \"$ac_compile\""; } >&5
            test $p = "-R"; then
  	 prev=$p
  	 continue
@@ -14801,7 +14800,7 @@ index d537ec391d2..de7b61bb612 100755
  	   # Internal compiler library paths should come after those
  	   # provided the user.  The postdeps already come after the
  	   # user supplied libs so there is no need to process them.
-@@ -13443,8 +14193,10 @@ if { { eval echo "\"\$as_me\":${as_lineno-$LINENO}: \"$ac_compile\""; } >&5
+@@ -13269,8 +14019,10 @@ if { { eval echo "\"\$as_me\":${as_lineno-$LINENO}: \"$ac_compile\""; } >&5
  	   postdeps_CXX="${postdeps_CXX} ${prev}${p}"
  	 fi
         fi
@@ -14812,7 +14811,7 @@ index d537ec391d2..de7b61bb612 100755
      *.$objext)
         # This assumes that the test object file only shows up
         # once in the compiler output.
-@@ -13480,6 +14232,7 @@ else
+@@ -13306,6 +14058,7 @@ else
  fi
  
  $RM -f confest.$objext
@@ -14820,7 +14819,7 @@ index d537ec391d2..de7b61bb612 100755
  
  # PORTME: override above test on systems where it is broken
  case $host_os in
-@@ -13515,7 +14268,7 @@ linux*)
+@@ -13341,7 +14094,7 @@ linux*)
  
  solaris*)
    case $cc_basename in
@@ -14829,7 +14828,7 @@ index d537ec391d2..de7b61bb612 100755
      # The more standards-conforming stlport4 library is
      # incompatible with the Cstd library. Avoid specifying
      # it if it's in CXXFLAGS. Ignore libCrun as
-@@ -13580,8 +14333,6 @@ fi
+@@ -13406,8 +14159,6 @@ fi
  lt_prog_compiler_pic_CXX=
  lt_prog_compiler_static_CXX=
  
@@ -14838,7 +14837,7 @@ index d537ec391d2..de7b61bb612 100755
  
    # C++ specific cases for pic, static, wl, etc.
    if test "$GXX" = yes; then
-@@ -13686,6 +14437,11 @@ $as_echo_n "checking for $compiler option to produce PIC... " >&6; }
+@@ -13512,6 +14263,11 @@ $as_echo_n "checking for $compiler option to produce PIC... " >&6; }
  	  ;;
  	esac
  	;;
@@ -14850,7 +14849,7 @@ index d537ec391d2..de7b61bb612 100755
        dgux*)
  	case $cc_basename in
  	  ec++*)
-@@ -13838,7 +14594,7 @@ $as_echo_n "checking for $compiler option to produce PIC... " >&6; }
+@@ -13664,7 +14420,7 @@ $as_echo_n "checking for $compiler option to produce PIC... " >&6; }
  	;;
        solaris*)
  	case $cc_basename in
@@ -14859,7 +14858,7 @@ index d537ec391d2..de7b61bb612 100755
  	    # Sun C++ 4.2, 5.x and Centerline C++
  	    lt_prog_compiler_pic_CXX='-KPIC'
  	    lt_prog_compiler_static_CXX='-Bstatic'
-@@ -13903,10 +14659,17 @@ case $host_os in
+@@ -13729,10 +14485,17 @@ case $host_os in
      lt_prog_compiler_pic_CXX="$lt_prog_compiler_pic_CXX -DPIC"
      ;;
  esac
@@ -14880,7 +14879,7 @@ index d537ec391d2..de7b61bb612 100755
  
  #
  # Check to make sure the PIC flag actually works.
-@@ -13964,6 +14727,8 @@ fi
+@@ -13790,6 +14553,8 @@ fi
  
  
  
@@ -14889,7 +14888,7 @@ index d537ec391d2..de7b61bb612 100755
  #
  # Check to make sure the static flag actually works.
  #
-@@ -14141,6 +14906,7 @@ fi
+@@ -13967,6 +14732,7 @@ fi
  $as_echo_n "checking whether the $compiler linker ($LD) supports shared libraries... " >&6; }
  
    export_symbols_cmds_CXX='$NM $libobjs $convenience | $global_symbol_pipe | $SED '\''s/.* //'\'' | sort | uniq > $export_symbols'
@@ -14897,7 +14896,7 @@ index d537ec391d2..de7b61bb612 100755
    case $host_os in
    aix[4-9]*)
      # If we're using GNU nm, then we don't want the "-C" option.
-@@ -14155,15 +14921,20 @@ $as_echo_n "checking whether the $compiler linker ($LD) supports shared librarie
+@@ -13981,15 +14747,20 @@ $as_echo_n "checking whether the $compiler linker ($LD) supports shared librarie
      ;;
    pw32*)
      export_symbols_cmds_CXX="$ltdll_cmds"
@@ -14923,7 +14922,7 @@ index d537ec391d2..de7b61bb612 100755
  
  { $as_echo "$as_me:${as_lineno-$LINENO}: result: $ld_shlibs_CXX" >&5
  $as_echo "$ld_shlibs_CXX" >&6; }
-@@ -14426,8 +15197,9 @@ cygwin* | mingw* | pw32* | cegcc*)
+@@ -14252,8 +15023,9 @@ cygwin* | mingw* | pw32* | cegcc*)
    need_version=no
    need_lib_prefix=no
  
@@ -14935,7 +14934,7 @@ index d537ec391d2..de7b61bb612 100755
      library_names_spec='$libname.dll.a'
      # DLL is installed to $(libdir)/../bin by postinstall_cmds
      postinstall_cmds='base_file=`basename \${file}`~
-@@ -14459,13 +15231,71 @@ cygwin* | mingw* | pw32* | cegcc*)
+@@ -14285,13 +15057,71 @@ cygwin* | mingw* | pw32* | cegcc*)
        library_names_spec='`echo ${libname} | sed -e 's/^lib/pw/'``echo ${release} | $SED -e 's/[.]/-/g'`${versuffix}${shared_ext}'
        ;;
      esac
@@ -15008,7 +15007,7 @@ index d537ec391d2..de7b61bb612 100755
    # FIXME: first we should search . and the directory the executable is in
    shlibpath_var=PATH
    ;;
-@@ -15029,6 +15859,7 @@ fi
+@@ -14855,6 +15685,7 @@ fi
    fi # test -n "$compiler"
  
    CC=$lt_save_CC
@@ -15016,7 +15015,7 @@ index d537ec391d2..de7b61bb612 100755
    LDCXX=$LD
    LD=$lt_save_LD
    GCC=$lt_save_GCC
-@@ -20389,13 +21220,20 @@ exeext='`$ECHO "$exeext" | $SED "$delay_single_quote_subst"`'
+@@ -19900,13 +20731,20 @@ exeext='`$ECHO "$exeext" | $SED "$delay_single_quote_subst"`'
  lt_unset='`$ECHO "$lt_unset" | $SED "$delay_single_quote_subst"`'
  lt_SP2NL='`$ECHO "$lt_SP2NL" | $SED "$delay_single_quote_subst"`'
  lt_NL2SP='`$ECHO "$lt_NL2SP" | $SED "$delay_single_quote_subst"`'
@@ -15037,7 +15036,7 @@ index d537ec391d2..de7b61bb612 100755
  STRIP='`$ECHO "$STRIP" | $SED "$delay_single_quote_subst"`'
  RANLIB='`$ECHO "$RANLIB" | $SED "$delay_single_quote_subst"`'
  old_postinstall_cmds='`$ECHO "$old_postinstall_cmds" | $SED "$delay_single_quote_subst"`'
-@@ -20410,14 +21248,17 @@ lt_cv_sys_global_symbol_pipe='`$ECHO "$lt_cv_sys_global_symbol_pipe" | $SED "$de
+@@ -19921,14 +20759,17 @@ lt_cv_sys_global_symbol_pipe='`$ECHO "$lt_cv_sys_global_symbol_pipe" | $SED "$de
  lt_cv_sys_global_symbol_to_cdecl='`$ECHO "$lt_cv_sys_global_symbol_to_cdecl" | $SED "$delay_single_quote_subst"`'
  lt_cv_sys_global_symbol_to_c_name_address='`$ECHO "$lt_cv_sys_global_symbol_to_c_name_address" | $SED "$delay_single_quote_subst"`'
  lt_cv_sys_global_symbol_to_c_name_address_lib_prefix='`$ECHO "$lt_cv_sys_global_symbol_to_c_name_address_lib_prefix" | $SED "$delay_single_quote_subst"`'
@@ -15056,7 +15055,7 @@ index d537ec391d2..de7b61bb612 100755
  DSYMUTIL='`$ECHO "$DSYMUTIL" | $SED "$delay_single_quote_subst"`'
  NMEDIT='`$ECHO "$NMEDIT" | $SED "$delay_single_quote_subst"`'
  LIPO='`$ECHO "$LIPO" | $SED "$delay_single_quote_subst"`'
-@@ -20450,12 +21291,12 @@ hardcode_shlibpath_var='`$ECHO "$hardcode_shlibpath_var" | $SED "$delay_single_q
+@@ -19961,12 +20802,12 @@ hardcode_shlibpath_var='`$ECHO "$hardcode_shlibpath_var" | $SED "$delay_single_q
  hardcode_automatic='`$ECHO "$hardcode_automatic" | $SED "$delay_single_quote_subst"`'
  inherit_rpath='`$ECHO "$inherit_rpath" | $SED "$delay_single_quote_subst"`'
  link_all_deplibs='`$ECHO "$link_all_deplibs" | $SED "$delay_single_quote_subst"`'
@@ -15070,7 +15069,7 @@ index d537ec391d2..de7b61bb612 100755
  file_list_spec='`$ECHO "$file_list_spec" | $SED "$delay_single_quote_subst"`'
  variables_saved_for_relink='`$ECHO "$variables_saved_for_relink" | $SED "$delay_single_quote_subst"`'
  need_lib_prefix='`$ECHO "$need_lib_prefix" | $SED "$delay_single_quote_subst"`'
-@@ -20494,8 +21335,8 @@ old_archive_cmds_CXX='`$ECHO "$old_archive_cmds_CXX" | $SED "$delay_single_quote
+@@ -20005,8 +20846,8 @@ old_archive_cmds_CXX='`$ECHO "$old_archive_cmds_CXX" | $SED "$delay_single_quote
  compiler_CXX='`$ECHO "$compiler_CXX" | $SED "$delay_single_quote_subst"`'
  GCC_CXX='`$ECHO "$GCC_CXX" | $SED "$delay_single_quote_subst"`'
  lt_prog_compiler_no_builtin_flag_CXX='`$ECHO "$lt_prog_compiler_no_builtin_flag_CXX" | $SED "$delay_single_quote_subst"`'
@@ -15080,7 +15079,7 @@ index d537ec391d2..de7b61bb612 100755
  lt_prog_compiler_static_CXX='`$ECHO "$lt_prog_compiler_static_CXX" | $SED "$delay_single_quote_subst"`'
  lt_cv_prog_compiler_c_o_CXX='`$ECHO "$lt_cv_prog_compiler_c_o_CXX" | $SED "$delay_single_quote_subst"`'
  archive_cmds_need_lc_CXX='`$ECHO "$archive_cmds_need_lc_CXX" | $SED "$delay_single_quote_subst"`'
-@@ -20522,12 +21363,12 @@ hardcode_shlibpath_var_CXX='`$ECHO "$hardcode_shlibpath_var_CXX" | $SED "$delay_
+@@ -20033,12 +20874,12 @@ hardcode_shlibpath_var_CXX='`$ECHO "$hardcode_shlibpath_var_CXX" | $SED "$delay_
  hardcode_automatic_CXX='`$ECHO "$hardcode_automatic_CXX" | $SED "$delay_single_quote_subst"`'
  inherit_rpath_CXX='`$ECHO "$inherit_rpath_CXX" | $SED "$delay_single_quote_subst"`'
  link_all_deplibs_CXX='`$ECHO "$link_all_deplibs_CXX" | $SED "$delay_single_quote_subst"`'
@@ -15094,7 +15093,7 @@ index d537ec391d2..de7b61bb612 100755
  file_list_spec_CXX='`$ECHO "$file_list_spec_CXX" | $SED "$delay_single_quote_subst"`'
  hardcode_action_CXX='`$ECHO "$hardcode_action_CXX" | $SED "$delay_single_quote_subst"`'
  compiler_lib_search_dirs_CXX='`$ECHO "$compiler_lib_search_dirs_CXX" | $SED "$delay_single_quote_subst"`'
-@@ -20565,8 +21406,13 @@ reload_flag \
+@@ -20076,8 +20917,13 @@ reload_flag \
  OBJDUMP \
  deplibs_check_method \
  file_magic_cmd \
@@ -15108,7 +15107,7 @@ index d537ec391d2..de7b61bb612 100755
  STRIP \
  RANLIB \
  CC \
-@@ -20576,12 +21422,14 @@ lt_cv_sys_global_symbol_pipe \
+@@ -20087,12 +20933,14 @@ lt_cv_sys_global_symbol_pipe \
  lt_cv_sys_global_symbol_to_cdecl \
  lt_cv_sys_global_symbol_to_c_name_address \
  lt_cv_sys_global_symbol_to_c_name_address_lib_prefix \
@@ -15124,7 +15123,7 @@ index d537ec391d2..de7b61bb612 100755
  DSYMUTIL \
  NMEDIT \
  LIPO \
-@@ -20597,7 +21445,6 @@ no_undefined_flag \
+@@ -20108,7 +20956,6 @@ no_undefined_flag \
  hardcode_libdir_flag_spec \
  hardcode_libdir_flag_spec_ld \
  hardcode_libdir_separator \
@@ -15132,7 +15131,7 @@ index d537ec391d2..de7b61bb612 100755
  exclude_expsyms \
  include_expsyms \
  file_list_spec \
-@@ -20619,8 +21466,8 @@ LD_CXX \
+@@ -20130,8 +20977,8 @@ LD_CXX \
  reload_flag_CXX \
  compiler_CXX \
  lt_prog_compiler_no_builtin_flag_CXX \
@@ -15142,7 +15141,7 @@ index d537ec391d2..de7b61bb612 100755
  lt_prog_compiler_static_CXX \
  lt_cv_prog_compiler_c_o_CXX \
  export_dynamic_flag_spec_CXX \
-@@ -20632,7 +21479,6 @@ no_undefined_flag_CXX \
+@@ -20143,7 +20990,6 @@ no_undefined_flag_CXX \
  hardcode_libdir_flag_spec_CXX \
  hardcode_libdir_flag_spec_ld_CXX \
  hardcode_libdir_separator_CXX \
@@ -15150,7 +15149,7 @@ index d537ec391d2..de7b61bb612 100755
  exclude_expsyms_CXX \
  include_expsyms_CXX \
  file_list_spec_CXX \
-@@ -20666,6 +21512,7 @@ module_cmds \
+@@ -20177,6 +21023,7 @@ module_cmds \
  module_expsym_cmds \
  export_symbols_cmds \
  prelink_cmds \
@@ -15158,7 +15157,7 @@ index d537ec391d2..de7b61bb612 100755
  postinstall_cmds \
  postuninstall_cmds \
  finish_cmds \
-@@ -20680,7 +21527,8 @@ archive_expsym_cmds_CXX \
+@@ -20191,7 +21038,8 @@ archive_expsym_cmds_CXX \
  module_cmds_CXX \
  module_expsym_cmds_CXX \
  export_symbols_cmds_CXX \
@@ -15168,7 +15167,7 @@ index d537ec391d2..de7b61bb612 100755
      case \`eval \\\\\$ECHO \\\\""\\\\\$\$var"\\\\"\` in
      *[\\\\\\\`\\"\\\$]*)
        eval "lt_\$var=\\\\\\"\\\`\\\$ECHO \\"\\\$\$var\\" | \\\$SED -e \\"\\\$double_quote_subst\\" -e \\"\\\$sed_quote_subst\\" -e \\"\\\$delay_variable_subst\\"\\\`\\\\\\""
-@@ -21453,7 +22301,8 @@ $as_echo X"$file" |
+@@ -20956,7 +21804,8 @@ $as_echo X"$file" |
  # NOTE: Changes made to this file will be lost: look at ltmain.sh.
  #
  #   Copyright (C) 1996, 1997, 1998, 1999, 2000, 2001, 2003, 2004, 2005,
@@ -15178,7 +15177,7 @@ index d537ec391d2..de7b61bb612 100755
  #   Written by Gordon Matzigkeit, 1996
  #
  #   This file is part of GNU Libtool.
-@@ -21556,19 +22405,42 @@ SP2NL=$lt_lt_SP2NL
+@@ -21059,19 +21908,42 @@ SP2NL=$lt_lt_SP2NL
  # turn newlines into spaces.
  NL2SP=$lt_lt_NL2SP
  
@@ -15222,7 +15221,7 @@ index d537ec391d2..de7b61bb612 100755
  # A symbol stripping program.
  STRIP=$lt_STRIP
  
-@@ -21598,6 +22470,12 @@ global_symbol_to_c_name_address=$lt_lt_cv_sys_global_symbol_to_c_name_address
+@@ -21101,6 +21973,12 @@ global_symbol_to_c_name_address=$lt_lt_cv_sys_global_symbol_to_c_name_address
  # Transform the output of nm in a C name address pair when lib prefix is needed.
  global_symbol_to_c_name_address_lib_prefix=$lt_lt_cv_sys_global_symbol_to_c_name_address_lib_prefix
  
@@ -15235,7 +15234,7 @@ index d537ec391d2..de7b61bb612 100755
  # The name of the directory that contains temporary libtool files.
  objdir=$objdir
  
-@@ -21607,6 +22485,9 @@ MAGIC_CMD=$MAGIC_CMD
+@@ -21110,6 +21988,9 @@ MAGIC_CMD=$MAGIC_CMD
  # Must we lock files when doing compilation?
  need_locks=$lt_need_locks
  
@@ -15245,7 +15244,7 @@ index d537ec391d2..de7b61bb612 100755
  # Tool to manipulate archived DWARF debug symbol files on Mac OS X.
  DSYMUTIL=$lt_DSYMUTIL
  
-@@ -21721,12 +22602,12 @@ with_gcc=$GCC
+@@ -21224,12 +22105,12 @@ with_gcc=$GCC
  # Compiler flag to turn off builtin functions.
  no_builtin_flag=$lt_lt_prog_compiler_no_builtin_flag
  
@@ -15261,7 +15260,7 @@ index d537ec391d2..de7b61bb612 100755
  # Compiler flag to prevent dynamic linking.
  link_static_flag=$lt_lt_prog_compiler_static
  
-@@ -21813,9 +22694,6 @@ inherit_rpath=$inherit_rpath
+@@ -21316,9 +22197,6 @@ inherit_rpath=$inherit_rpath
  # Whether libtool must link a program against all its dependency libraries.
  link_all_deplibs=$link_all_deplibs
  
@@ -15271,7 +15270,7 @@ index d537ec391d2..de7b61bb612 100755
  # Set to "yes" if exported symbols are required.
  always_export_symbols=$always_export_symbols
  
-@@ -21831,6 +22709,9 @@ include_expsyms=$lt_include_expsyms
+@@ -21334,6 +22212,9 @@ include_expsyms=$lt_include_expsyms
  # Commands necessary for linking programs (against libraries) with templates.
  prelink_cmds=$lt_prelink_cmds
  
@@ -15281,7 +15280,7 @@ index d537ec391d2..de7b61bb612 100755
  # Specify filename containing input files.
  file_list_spec=$lt_file_list_spec
  
-@@ -21877,210 +22758,169 @@ ltmain="$ac_aux_dir/ltmain.sh"
+@@ -21380,210 +22261,169 @@ ltmain="$ac_aux_dir/ltmain.sh"
    # if finds mixed CR/LF and LF-only lines.  Since sed operates in
    # text mode, it properly converts lines to CR/LF.  This bash problem
    # is reportedly fixed, but why not run on old versions too?
@@ -15655,7 +15654,7 @@ index d537ec391d2..de7b61bb612 100755
      (rm -f "$ofile" && cp "$cfgfile" "$ofile" && rm -f "$cfgfile")
    chmod +x "$ofile"
  
-@@ -22108,12 +22948,12 @@ with_gcc=$GCC_CXX
+@@ -21611,12 +22451,12 @@ with_gcc=$GCC_CXX
  # Compiler flag to turn off builtin functions.
  no_builtin_flag=$lt_lt_prog_compiler_no_builtin_flag_CXX
  
@@ -15671,7 +15670,7 @@ index d537ec391d2..de7b61bb612 100755
  # Compiler flag to prevent dynamic linking.
  link_static_flag=$lt_lt_prog_compiler_static_CXX
  
-@@ -22200,9 +23040,6 @@ inherit_rpath=$inherit_rpath_CXX
+@@ -21703,9 +22543,6 @@ inherit_rpath=$inherit_rpath_CXX
  # Whether libtool must link a program against all its dependency libraries.
  link_all_deplibs=$link_all_deplibs_CXX
  
@@ -15681,7 +15680,7 @@ index d537ec391d2..de7b61bb612 100755
  # Set to "yes" if exported symbols are required.
  always_export_symbols=$always_export_symbols_CXX
  
-@@ -22218,6 +23055,9 @@ include_expsyms=$lt_include_expsyms_CXX
+@@ -21721,6 +22558,9 @@ include_expsyms=$lt_include_expsyms_CXX
  # Commands necessary for linking programs (against libraries) with templates.
  prelink_cmds=$lt_prelink_cmds_CXX
  
@@ -20179,147 +20178,10 @@ index 7466d56a18b..0325e438a47 100755
    chmod +x "$ofile"
  
 diff --git a/libsframe/Makefile.in b/libsframe/Makefile.in
-index 13f4c26e2f1..e6e05b80d0e 100644
+index fa705dd9f13..d6ab725f71d 100644
 --- a/libsframe/Makefile.in
 +++ b/libsframe/Makefile.in
-@@ -1,7 +1,7 @@
--# Makefile.in generated by automake 1.15.1 from Makefile.am.
-+# Makefile.in generated by automake 1.16.5 from Makefile.am.
- # @configure_input@
- 
--# Copyright (C) 1994-2017 Free Software Foundation, Inc.
-+# Copyright (C) 1994-2021 Free Software Foundation, Inc.
- 
- # This Makefile.in is free software; the Free Software Foundation
- # gives unlimited permission to copy and/or distribute it,
-@@ -144,6 +144,13 @@ mkinstalldirs = $(SHELL) $(top_srcdir)/../mkinstalldirs
- CONFIG_HEADER = config.h
- CONFIG_CLEAN_FILES =
- CONFIG_CLEAN_VPATH_FILES =
-+@HAVE_COMPAT_DEJAGNU_TRUE@am__EXEEXT_1 = testsuite/libsframe.decode/be-flipping$(EXEEXT) \
-+@HAVE_COMPAT_DEJAGNU_TRUE@	testsuite/libsframe.decode/frecnt-1$(EXEEXT) \
-+@HAVE_COMPAT_DEJAGNU_TRUE@	testsuite/libsframe.decode/frecnt-2$(EXEEXT) \
-+@HAVE_COMPAT_DEJAGNU_TRUE@	testsuite/libsframe.encode/encode-1$(EXEEXT) \
-+@HAVE_COMPAT_DEJAGNU_TRUE@	testsuite/libsframe.find/findfre-1$(EXEEXT) \
-+@HAVE_COMPAT_DEJAGNU_TRUE@	testsuite/libsframe.find/findfunc-1$(EXEEXT) \
-+@HAVE_COMPAT_DEJAGNU_TRUE@	testsuite/libsframe.find/plt-findfre-1$(EXEEXT)
- am__vpath_adj_setup = srcdirstrip=`echo "$(srcdir)" | sed 's|.|.|g'`;
- am__vpath_adj = case $$p in \
-     $(srcdir)/*) f=`echo "$$p" | sed "s|^$$srcdirstrip/||"`;; \
-@@ -187,45 +194,44 @@ libsframe_la_LINK = $(LIBTOOL) $(AM_V_lt) --tag=CC $(AM_LIBTOOLFLAGS) \
- 	$(libsframe_la_LDFLAGS) $(LDFLAGS) -o $@
- @INSTALL_LIBBFD_FALSE@am_libsframe_la_rpath =
- @INSTALL_LIBBFD_TRUE@am_libsframe_la_rpath = -rpath $(libdir)
--@HAVE_COMPAT_DEJAGNU_TRUE@am__EXEEXT_1 = testsuite/libsframe.decode/be-flipping$(EXEEXT) \
--@HAVE_COMPAT_DEJAGNU_TRUE@	testsuite/libsframe.decode/frecnt-1$(EXEEXT) \
--@HAVE_COMPAT_DEJAGNU_TRUE@	testsuite/libsframe.decode/frecnt-2$(EXEEXT) \
--@HAVE_COMPAT_DEJAGNU_TRUE@	testsuite/libsframe.encode/encode-1$(EXEEXT) \
--@HAVE_COMPAT_DEJAGNU_TRUE@	testsuite/libsframe.find/findfre-1$(EXEEXT) \
--@HAVE_COMPAT_DEJAGNU_TRUE@	testsuite/libsframe.find/findfunc-1$(EXEEXT) \
--@HAVE_COMPAT_DEJAGNU_TRUE@	testsuite/libsframe.find/plt-findfre-1$(EXEEXT)
- am__dirstamp = $(am__leading_dot)dirstamp
--am_testsuite_libsframe_decode_be_flipping_OBJECTS = testsuite/libsframe.decode/testsuite_libsframe_decode_be_flipping-be-flipping.$(OBJEXT)
-+am_testsuite_libsframe_decode_be_flipping_OBJECTS =  \
-+	testsuite/libsframe.decode/be_flipping-be-flipping.$(OBJEXT)
- testsuite_libsframe_decode_be_flipping_OBJECTS =  \
- 	$(am_testsuite_libsframe_decode_be_flipping_OBJECTS)
- testsuite_libsframe_decode_be_flipping_DEPENDENCIES =  \
- 	${top_builddir}/libsframe.la
--am_testsuite_libsframe_decode_frecnt_1_OBJECTS = testsuite/libsframe.decode/testsuite_libsframe_decode_frecnt_1-frecnt-1.$(OBJEXT)
-+am_testsuite_libsframe_decode_frecnt_1_OBJECTS =  \
-+	testsuite/libsframe.decode/frecnt_1-frecnt-1.$(OBJEXT)
- testsuite_libsframe_decode_frecnt_1_OBJECTS =  \
- 	$(am_testsuite_libsframe_decode_frecnt_1_OBJECTS)
- testsuite_libsframe_decode_frecnt_1_DEPENDENCIES =  \
- 	${top_builddir}/libsframe.la
--am_testsuite_libsframe_decode_frecnt_2_OBJECTS = testsuite/libsframe.decode/testsuite_libsframe_decode_frecnt_2-frecnt-2.$(OBJEXT)
-+am_testsuite_libsframe_decode_frecnt_2_OBJECTS =  \
-+	testsuite/libsframe.decode/frecnt_2-frecnt-2.$(OBJEXT)
- testsuite_libsframe_decode_frecnt_2_OBJECTS =  \
- 	$(am_testsuite_libsframe_decode_frecnt_2_OBJECTS)
- testsuite_libsframe_decode_frecnt_2_DEPENDENCIES =  \
- 	${top_builddir}/libsframe.la
--am_testsuite_libsframe_encode_encode_1_OBJECTS = testsuite/libsframe.encode/testsuite_libsframe_encode_encode_1-encode-1.$(OBJEXT)
-+am_testsuite_libsframe_encode_encode_1_OBJECTS =  \
-+	testsuite/libsframe.encode/encode_1-encode-1.$(OBJEXT)
- testsuite_libsframe_encode_encode_1_OBJECTS =  \
- 	$(am_testsuite_libsframe_encode_encode_1_OBJECTS)
- testsuite_libsframe_encode_encode_1_DEPENDENCIES =  \
- 	${top_builddir}/libsframe.la
--am_testsuite_libsframe_find_findfre_1_OBJECTS = testsuite/libsframe.find/testsuite_libsframe_find_findfre_1-findfre-1.$(OBJEXT)
-+am_testsuite_libsframe_find_findfre_1_OBJECTS =  \
-+	testsuite/libsframe.find/findfre_1-findfre-1.$(OBJEXT)
- testsuite_libsframe_find_findfre_1_OBJECTS =  \
- 	$(am_testsuite_libsframe_find_findfre_1_OBJECTS)
- testsuite_libsframe_find_findfre_1_DEPENDENCIES =  \
- 	${top_builddir}/libsframe.la
--am_testsuite_libsframe_find_findfunc_1_OBJECTS = testsuite/libsframe.find/testsuite_libsframe_find_findfunc_1-findfunc-1.$(OBJEXT)
-+am_testsuite_libsframe_find_findfunc_1_OBJECTS =  \
-+	testsuite/libsframe.find/findfunc_1-findfunc-1.$(OBJEXT)
- testsuite_libsframe_find_findfunc_1_OBJECTS =  \
- 	$(am_testsuite_libsframe_find_findfunc_1_OBJECTS)
- testsuite_libsframe_find_findfunc_1_DEPENDENCIES =  \
- 	${top_builddir}/libsframe.la
--am_testsuite_libsframe_find_plt_findfre_1_OBJECTS = testsuite/libsframe.find/testsuite_libsframe_find_plt_findfre_1-plt-findfre-1.$(OBJEXT)
-+am_testsuite_libsframe_find_plt_findfre_1_OBJECTS = testsuite/libsframe.find/plt_findfre_1-plt-findfre-1.$(OBJEXT)
- testsuite_libsframe_find_plt_findfre_1_OBJECTS =  \
- 	$(am_testsuite_libsframe_find_plt_findfre_1_OBJECTS)
- testsuite_libsframe_find_plt_findfre_1_DEPENDENCIES =  \
-@@ -244,7 +250,17 @@ am__v_at_0 = @
- am__v_at_1 = 
- DEFAULT_INCLUDES = -I.@am__isrc@
- depcomp = $(SHELL) $(top_srcdir)/../depcomp
--am__depfiles_maybe = depfiles
-+am__maybe_remake_depfiles = depfiles
-+am__depfiles_remade = ./$(DEPDIR)/libsframe_la-sframe-dump.Plo \
-+	./$(DEPDIR)/libsframe_la-sframe-error.Plo \
-+	./$(DEPDIR)/libsframe_la-sframe.Plo \
-+	testsuite/libsframe.decode/$(DEPDIR)/be_flipping-be-flipping.Po \
-+	testsuite/libsframe.decode/$(DEPDIR)/frecnt_1-frecnt-1.Po \
-+	testsuite/libsframe.decode/$(DEPDIR)/frecnt_2-frecnt-2.Po \
-+	testsuite/libsframe.encode/$(DEPDIR)/encode_1-encode-1.Po \
-+	testsuite/libsframe.find/$(DEPDIR)/findfre_1-findfre-1.Po \
-+	testsuite/libsframe.find/$(DEPDIR)/findfunc_1-findfunc-1.Po \
-+	testsuite/libsframe.find/$(DEPDIR)/plt_findfre_1-plt-findfre-1.Po
- am__mv = mv -f
- COMPILE = $(CC) $(DEFS) $(DEFAULT_INCLUDES) $(INCLUDES) $(AM_CPPFLAGS) \
- 	$(CPPFLAGS) $(AM_CFLAGS) $(CFLAGS)
-@@ -327,8 +343,8 @@ am__can_run_installinfo = \
-   esac
- am__include_HEADERS_DIST = $(INCDIR)/sframe.h $(INCDIR)/sframe-api.h
- HEADERS = $(include_HEADERS)
--am__tagged_files = $(HEADERS) $(SOURCES) $(TAGS_FILES) \
--	$(LISP)config.h.in
-+am__tagged_files = $(HEADERS) $(SOURCES) $(TAGS_FILES) $(LISP) \
-+	config.h.in
- # Read a list of newline-separated strings from the standard input,
- # and print each of them once, without duplicates.  Input order is
- # *not* preserved.
-@@ -345,9 +361,6 @@ am__define_uniq_tagged_files = \
-   unique=`for i in $$list; do \
-     if test -f "$$i"; then echo $$i; else echo $(srcdir)/$$i; fi; \
-   done | $(am__uniquify_input)`
--ETAGS = etags
--CTAGS = ctags
--CSCOPE = cscope
- AM_RECURSIVE_TARGETS = cscope
- DEJATOOL = $(PACKAGE)
- RUNTESTDEFAULTFLAGS = --tool $$tool --srcdir $$srcdir
-@@ -374,6 +387,8 @@ am__post_remove_distdir = $(am__remove_distdir)
- DIST_ARCHIVES = $(distdir).tar.gz
- GZIP_ENV = --best
- DIST_TARGETS = dist-gzip
-+# Exists only to be overridden by the user if desired.
-+AM_DISTCHECK_DVI_TARGET = dvi
- distuninstallcheck_listfiles = find . -type f -print
- am__distuninstallcheck_listfiles = $(distuninstallcheck_listfiles) \
-   | sed 's|^\./|$(prefix)/|' | grep -v '$(infodir)/dir$$'
-@@ -392,15 +407,19 @@ CFLAGS = @CFLAGS@
- COMPAT_DEJAGNU = @COMPAT_DEJAGNU@
- CPP = @CPP@
- CPPFLAGS = @CPPFLAGS@
-+CSCOPE = @CSCOPE@
-+CTAGS = @CTAGS@
+@@ -404,6 +404,7 @@ CPPFLAGS = @CPPFLAGS@
  CYGPATH_W = @CYGPATH_W@
  DEFS = @DEFS@
  DEPDIR = @DEPDIR@
@@ -20327,14 +20189,7 @@ index 13f4c26e2f1..e6e05b80d0e 100644
  DSYMUTIL = @DSYMUTIL@
  DUMPBIN = @DUMPBIN@
  ECHO_C = @ECHO_C@
- ECHO_N = @ECHO_N@
- ECHO_T = @ECHO_T@
- EGREP = @EGREP@
-+ETAGS = @ETAGS@
- EXEEXT = @EXEEXT@
- FGREP = @FGREP@
- GREP = @GREP@
-@@ -419,6 +438,7 @@ LN_S = @LN_S@
+@@ -428,6 +429,7 @@ LN_S = @LN_S@
  LTLIBOBJS = @LTLIBOBJS@
  MAINT = @MAINT@
  MAKEINFO = @MAKEINFO@
@@ -20342,909 +20197,8 @@ index 13f4c26e2f1..e6e05b80d0e 100644
  MKDIR_P = @MKDIR_P@
  NM = @NM@
  NMEDIT = @NMEDIT@
-@@ -595,8 +615,8 @@ Makefile: $(srcdir)/Makefile.in $(top_builddir)/config.status
- 	    echo ' $(SHELL) ./config.status'; \
- 	    $(SHELL) ./config.status;; \
- 	  *) \
--	    echo ' cd $(top_builddir) && $(SHELL) ./config.status $@ $(am__depfiles_maybe)'; \
--	    cd $(top_builddir) && $(SHELL) ./config.status $@ $(am__depfiles_maybe);; \
-+	    echo ' cd $(top_builddir) && $(SHELL) ./config.status $@ $(am__maybe_remake_depfiles)'; \
-+	    cd $(top_builddir) && $(SHELL) ./config.status $@ $(am__maybe_remake_depfiles);; \
- 	esac;
- $(srcdir)/doc/local.mk $(srcdir)/testsuite/local.mk $(srcdir)/testsuite/libsframe.decode/local.mk $(srcdir)/testsuite/libsframe.encode/local.mk $(srcdir)/testsuite/libsframe.find/local.mk $(am__empty):
- 
-@@ -624,6 +644,15 @@ $(srcdir)/config.h.in: @MAINTAINER_MODE_TRUE@ $(am__configure_deps)
- distclean-hdr:
- 	-rm -f config.h stamp-h1
- 
-+clean-checkPROGRAMS:
-+	@list='$(check_PROGRAMS)'; test -n "$$list" || exit 0; \
-+	echo " rm -f" $$list; \
-+	rm -f $$list || exit $$?; \
-+	test -n "$(EXEEXT)" || exit 0; \
-+	list=`for p in $$list; do echo "$$p"; done | sed 's/$(EXEEXT)$$//'`; \
-+	echo " rm -f" $$list; \
-+	rm -f $$list
-+
- install-libLTLIBRARIES: $(lib_LTLIBRARIES)
- 	@$(NORMAL_INSTALL)
- 	@list='$(lib_LTLIBRARIES)'; test -n "$(libdir)" || list=; \
-@@ -672,36 +701,27 @@ clean-noinstLTLIBRARIES:
- 
- libsframe.la: $(libsframe_la_OBJECTS) $(libsframe_la_DEPENDENCIES) $(EXTRA_libsframe_la_DEPENDENCIES) 
- 	$(AM_V_CCLD)$(libsframe_la_LINK) $(am_libsframe_la_rpath) $(libsframe_la_OBJECTS) $(libsframe_la_LIBADD) $(LIBS)
--
--clean-checkPROGRAMS:
--	@list='$(check_PROGRAMS)'; test -n "$$list" || exit 0; \
--	echo " rm -f" $$list; \
--	rm -f $$list || exit $$?; \
--	test -n "$(EXEEXT)" || exit 0; \
--	list=`for p in $$list; do echo "$$p"; done | sed 's/$(EXEEXT)$$//'`; \
--	echo " rm -f" $$list; \
--	rm -f $$list
- testsuite/libsframe.decode/$(am__dirstamp):
- 	@$(MKDIR_P) testsuite/libsframe.decode
- 	@: > testsuite/libsframe.decode/$(am__dirstamp)
- testsuite/libsframe.decode/$(DEPDIR)/$(am__dirstamp):
- 	@$(MKDIR_P) testsuite/libsframe.decode/$(DEPDIR)
- 	@: > testsuite/libsframe.decode/$(DEPDIR)/$(am__dirstamp)
--testsuite/libsframe.decode/testsuite_libsframe_decode_be_flipping-be-flipping.$(OBJEXT):  \
-+testsuite/libsframe.decode/be_flipping-be-flipping.$(OBJEXT):  \
- 	testsuite/libsframe.decode/$(am__dirstamp) \
- 	testsuite/libsframe.decode/$(DEPDIR)/$(am__dirstamp)
- 
- testsuite/libsframe.decode/be-flipping$(EXEEXT): $(testsuite_libsframe_decode_be_flipping_OBJECTS) $(testsuite_libsframe_decode_be_flipping_DEPENDENCIES) $(EXTRA_testsuite_libsframe_decode_be_flipping_DEPENDENCIES) testsuite/libsframe.decode/$(am__dirstamp)
- 	@rm -f testsuite/libsframe.decode/be-flipping$(EXEEXT)
- 	$(AM_V_CCLD)$(LINK) $(testsuite_libsframe_decode_be_flipping_OBJECTS) $(testsuite_libsframe_decode_be_flipping_LDADD) $(LIBS)
--testsuite/libsframe.decode/testsuite_libsframe_decode_frecnt_1-frecnt-1.$(OBJEXT):  \
-+testsuite/libsframe.decode/frecnt_1-frecnt-1.$(OBJEXT):  \
- 	testsuite/libsframe.decode/$(am__dirstamp) \
- 	testsuite/libsframe.decode/$(DEPDIR)/$(am__dirstamp)
- 
- testsuite/libsframe.decode/frecnt-1$(EXEEXT): $(testsuite_libsframe_decode_frecnt_1_OBJECTS) $(testsuite_libsframe_decode_frecnt_1_DEPENDENCIES) $(EXTRA_testsuite_libsframe_decode_frecnt_1_DEPENDENCIES) testsuite/libsframe.decode/$(am__dirstamp)
- 	@rm -f testsuite/libsframe.decode/frecnt-1$(EXEEXT)
- 	$(AM_V_CCLD)$(LINK) $(testsuite_libsframe_decode_frecnt_1_OBJECTS) $(testsuite_libsframe_decode_frecnt_1_LDADD) $(LIBS)
--testsuite/libsframe.decode/testsuite_libsframe_decode_frecnt_2-frecnt-2.$(OBJEXT):  \
-+testsuite/libsframe.decode/frecnt_2-frecnt-2.$(OBJEXT):  \
- 	testsuite/libsframe.decode/$(am__dirstamp) \
- 	testsuite/libsframe.decode/$(DEPDIR)/$(am__dirstamp)
- 
-@@ -714,7 +734,7 @@ testsuite/libsframe.encode/$(am__dirstamp):
- testsuite/libsframe.encode/$(DEPDIR)/$(am__dirstamp):
- 	@$(MKDIR_P) testsuite/libsframe.encode/$(DEPDIR)
- 	@: > testsuite/libsframe.encode/$(DEPDIR)/$(am__dirstamp)
--testsuite/libsframe.encode/testsuite_libsframe_encode_encode_1-encode-1.$(OBJEXT):  \
-+testsuite/libsframe.encode/encode_1-encode-1.$(OBJEXT):  \
- 	testsuite/libsframe.encode/$(am__dirstamp) \
- 	testsuite/libsframe.encode/$(DEPDIR)/$(am__dirstamp)
- 
-@@ -727,21 +747,21 @@ testsuite/libsframe.find/$(am__dirstamp):
- testsuite/libsframe.find/$(DEPDIR)/$(am__dirstamp):
- 	@$(MKDIR_P) testsuite/libsframe.find/$(DEPDIR)
- 	@: > testsuite/libsframe.find/$(DEPDIR)/$(am__dirstamp)
--testsuite/libsframe.find/testsuite_libsframe_find_findfre_1-findfre-1.$(OBJEXT):  \
-+testsuite/libsframe.find/findfre_1-findfre-1.$(OBJEXT):  \
- 	testsuite/libsframe.find/$(am__dirstamp) \
- 	testsuite/libsframe.find/$(DEPDIR)/$(am__dirstamp)
- 
- testsuite/libsframe.find/findfre-1$(EXEEXT): $(testsuite_libsframe_find_findfre_1_OBJECTS) $(testsuite_libsframe_find_findfre_1_DEPENDENCIES) $(EXTRA_testsuite_libsframe_find_findfre_1_DEPENDENCIES) testsuite/libsframe.find/$(am__dirstamp)
- 	@rm -f testsuite/libsframe.find/findfre-1$(EXEEXT)
- 	$(AM_V_CCLD)$(LINK) $(testsuite_libsframe_find_findfre_1_OBJECTS) $(testsuite_libsframe_find_findfre_1_LDADD) $(LIBS)
--testsuite/libsframe.find/testsuite_libsframe_find_findfunc_1-findfunc-1.$(OBJEXT):  \
-+testsuite/libsframe.find/findfunc_1-findfunc-1.$(OBJEXT):  \
- 	testsuite/libsframe.find/$(am__dirstamp) \
- 	testsuite/libsframe.find/$(DEPDIR)/$(am__dirstamp)
- 
- testsuite/libsframe.find/findfunc-1$(EXEEXT): $(testsuite_libsframe_find_findfunc_1_OBJECTS) $(testsuite_libsframe_find_findfunc_1_DEPENDENCIES) $(EXTRA_testsuite_libsframe_find_findfunc_1_DEPENDENCIES) testsuite/libsframe.find/$(am__dirstamp)
- 	@rm -f testsuite/libsframe.find/findfunc-1$(EXEEXT)
- 	$(AM_V_CCLD)$(LINK) $(testsuite_libsframe_find_findfunc_1_OBJECTS) $(testsuite_libsframe_find_findfunc_1_LDADD) $(LIBS)
--testsuite/libsframe.find/testsuite_libsframe_find_plt_findfre_1-plt-findfre-1.$(OBJEXT):  \
-+testsuite/libsframe.find/plt_findfre_1-plt-findfre-1.$(OBJEXT):  \
- 	testsuite/libsframe.find/$(am__dirstamp) \
- 	testsuite/libsframe.find/$(DEPDIR)/$(am__dirstamp)
- 
-@@ -758,16 +778,22 @@ mostlyclean-compile:
- distclean-compile:
- 	-rm -f *.tab.c
- 
--@AMDEP_TRUE@@am__include@ @am__quote@./$(DEPDIR)/libsframe_la-sframe-dump.Plo@am__quote@
--@AMDEP_TRUE@@am__include@ @am__quote@./$(DEPDIR)/libsframe_la-sframe-error.Plo@am__quote@
--@AMDEP_TRUE@@am__include@ @am__quote@./$(DEPDIR)/libsframe_la-sframe.Plo@am__quote@
--@AMDEP_TRUE@@am__include@ @am__quote@testsuite/libsframe.decode/$(DEPDIR)/testsuite_libsframe_decode_be_flipping-be-flipping.Po@am__quote@
--@AMDEP_TRUE@@am__include@ @am__quote@testsuite/libsframe.decode/$(DEPDIR)/testsuite_libsframe_decode_frecnt_1-frecnt-1.Po@am__quote@
--@AMDEP_TRUE@@am__include@ @am__quote@testsuite/libsframe.decode/$(DEPDIR)/testsuite_libsframe_decode_frecnt_2-frecnt-2.Po@am__quote@
--@AMDEP_TRUE@@am__include@ @am__quote@testsuite/libsframe.encode/$(DEPDIR)/testsuite_libsframe_encode_encode_1-encode-1.Po@am__quote@
--@AMDEP_TRUE@@am__include@ @am__quote@testsuite/libsframe.find/$(DEPDIR)/testsuite_libsframe_find_findfre_1-findfre-1.Po@am__quote@
--@AMDEP_TRUE@@am__include@ @am__quote@testsuite/libsframe.find/$(DEPDIR)/testsuite_libsframe_find_findfunc_1-findfunc-1.Po@am__quote@
--@AMDEP_TRUE@@am__include@ @am__quote@testsuite/libsframe.find/$(DEPDIR)/testsuite_libsframe_find_plt_findfre_1-plt-findfre-1.Po@am__quote@
-+@AMDEP_TRUE@@am__include@ @am__quote@./$(DEPDIR)/libsframe_la-sframe-dump.Plo@am__quote@ # am--include-marker
-+@AMDEP_TRUE@@am__include@ @am__quote@./$(DEPDIR)/libsframe_la-sframe-error.Plo@am__quote@ # am--include-marker
-+@AMDEP_TRUE@@am__include@ @am__quote@./$(DEPDIR)/libsframe_la-sframe.Plo@am__quote@ # am--include-marker
-+@AMDEP_TRUE@@am__include@ @am__quote@testsuite/libsframe.decode/$(DEPDIR)/be_flipping-be-flipping.Po@am__quote@ # am--include-marker
-+@AMDEP_TRUE@@am__include@ @am__quote@testsuite/libsframe.decode/$(DEPDIR)/frecnt_1-frecnt-1.Po@am__quote@ # am--include-marker
-+@AMDEP_TRUE@@am__include@ @am__quote@testsuite/libsframe.decode/$(DEPDIR)/frecnt_2-frecnt-2.Po@am__quote@ # am--include-marker
-+@AMDEP_TRUE@@am__include@ @am__quote@testsuite/libsframe.encode/$(DEPDIR)/encode_1-encode-1.Po@am__quote@ # am--include-marker
-+@AMDEP_TRUE@@am__include@ @am__quote@testsuite/libsframe.find/$(DEPDIR)/findfre_1-findfre-1.Po@am__quote@ # am--include-marker
-+@AMDEP_TRUE@@am__include@ @am__quote@testsuite/libsframe.find/$(DEPDIR)/findfunc_1-findfunc-1.Po@am__quote@ # am--include-marker
-+@AMDEP_TRUE@@am__include@ @am__quote@testsuite/libsframe.find/$(DEPDIR)/plt_findfre_1-plt-findfre-1.Po@am__quote@ # am--include-marker
-+
-+$(am__depfiles_remade):
-+	@$(MKDIR_P) $(@D)
-+	@echo '# dummy' >$@-t && $(am__mv) $@-t $@
-+
-+am--depfiles: $(am__depfiles_remade)
- 
- .c.o:
- @am__fastdepCC_TRUE@	$(AM_V_CC)depbase=`echo $@ | sed 's|[^/]*$$|$(DEPDIR)/&|;s|\.o$$||'`;\
-@@ -814,103 +840,103 @@ libsframe_la-sframe-error.lo: sframe-error.c
- @AMDEP_TRUE@@am__fastdepCC_FALSE@	DEPDIR=$(DEPDIR) $(CCDEPMODE) $(depcomp) @AMDEPBACKSLASH@
- @am__fastdepCC_FALSE@	$(AM_V_CC@am__nodep@)$(LIBTOOL) $(AM_V_lt) --tag=CC $(AM_LIBTOOLFLAGS) $(LIBTOOLFLAGS) --mode=compile $(CC) $(DEFS) $(DEFAULT_INCLUDES) $(INCLUDES) $(libsframe_la_CPPFLAGS) $(CPPFLAGS) $(AM_CFLAGS) $(CFLAGS) -c -o libsframe_la-sframe-error.lo `test -f 'sframe-error.c' || echo '$(srcdir)/'`sframe-error.c
- 
--testsuite/libsframe.decode/testsuite_libsframe_decode_be_flipping-be-flipping.o: testsuite/libsframe.decode/be-flipping.c
--@am__fastdepCC_TRUE@	$(AM_V_CC)$(CC) $(DEFS) $(DEFAULT_INCLUDES) $(INCLUDES) $(testsuite_libsframe_decode_be_flipping_CPPFLAGS) $(CPPFLAGS) $(AM_CFLAGS) $(CFLAGS) -MT testsuite/libsframe.decode/testsuite_libsframe_decode_be_flipping-be-flipping.o -MD -MP -MF testsuite/libsframe.decode/$(DEPDIR)/testsuite_libsframe_decode_be_flipping-be-flipping.Tpo -c -o testsuite/libsframe.decode/testsuite_libsframe_decode_be_flipping-be-flipping.o `test -f 'testsuite/libsframe.decode/be-flipping.c' || echo '$(srcdir)/'`testsuite/libsframe.decode/be-flipping.c
--@am__fastdepCC_TRUE@	$(AM_V_at)$(am__mv) testsuite/libsframe.decode/$(DEPDIR)/testsuite_libsframe_decode_be_flipping-be-flipping.Tpo testsuite/libsframe.decode/$(DEPDIR)/testsuite_libsframe_decode_be_flipping-be-flipping.Po
--@AMDEP_TRUE@@am__fastdepCC_FALSE@	$(AM_V_CC)source='testsuite/libsframe.decode/be-flipping.c' object='testsuite/libsframe.decode/testsuite_libsframe_decode_be_flipping-be-flipping.o' libtool=no @AMDEPBACKSLASH@
-+testsuite/libsframe.decode/be_flipping-be-flipping.o: testsuite/libsframe.decode/be-flipping.c
-+@am__fastdepCC_TRUE@	$(AM_V_CC)$(CC) $(DEFS) $(DEFAULT_INCLUDES) $(INCLUDES) $(testsuite_libsframe_decode_be_flipping_CPPFLAGS) $(CPPFLAGS) $(AM_CFLAGS) $(CFLAGS) -MT testsuite/libsframe.decode/be_flipping-be-flipping.o -MD -MP -MF testsuite/libsframe.decode/$(DEPDIR)/be_flipping-be-flipping.Tpo -c -o testsuite/libsframe.decode/be_flipping-be-flipping.o `test -f 'testsuite/libsframe.decode/be-flipping.c' || echo '$(srcdir)/'`testsuite/libsframe.decode/be-flipping.c
-+@am__fastdepCC_TRUE@	$(AM_V_at)$(am__mv) testsuite/libsframe.decode/$(DEPDIR)/be_flipping-be-flipping.Tpo testsuite/libsframe.decode/$(DEPDIR)/be_flipping-be-flipping.Po
-+@AMDEP_TRUE@@am__fastdepCC_FALSE@	$(AM_V_CC)source='testsuite/libsframe.decode/be-flipping.c' object='testsuite/libsframe.decode/be_flipping-be-flipping.o' libtool=no @AMDEPBACKSLASH@
- @AMDEP_TRUE@@am__fastdepCC_FALSE@	DEPDIR=$(DEPDIR) $(CCDEPMODE) $(depcomp) @AMDEPBACKSLASH@
--@am__fastdepCC_FALSE@	$(AM_V_CC@am__nodep@)$(CC) $(DEFS) $(DEFAULT_INCLUDES) $(INCLUDES) $(testsuite_libsframe_decode_be_flipping_CPPFLAGS) $(CPPFLAGS) $(AM_CFLAGS) $(CFLAGS) -c -o testsuite/libsframe.decode/testsuite_libsframe_decode_be_flipping-be-flipping.o `test -f 'testsuite/libsframe.decode/be-flipping.c' || echo '$(srcdir)/'`testsuite/libsframe.decode/be-flipping.c
-+@am__fastdepCC_FALSE@	$(AM_V_CC@am__nodep@)$(CC) $(DEFS) $(DEFAULT_INCLUDES) $(INCLUDES) $(testsuite_libsframe_decode_be_flipping_CPPFLAGS) $(CPPFLAGS) $(AM_CFLAGS) $(CFLAGS) -c -o testsuite/libsframe.decode/be_flipping-be-flipping.o `test -f 'testsuite/libsframe.decode/be-flipping.c' || echo '$(srcdir)/'`testsuite/libsframe.decode/be-flipping.c
- 
--testsuite/libsframe.decode/testsuite_libsframe_decode_be_flipping-be-flipping.obj: testsuite/libsframe.decode/be-flipping.c
--@am__fastdepCC_TRUE@	$(AM_V_CC)$(CC) $(DEFS) $(DEFAULT_INCLUDES) $(INCLUDES) $(testsuite_libsframe_decode_be_flipping_CPPFLAGS) $(CPPFLAGS) $(AM_CFLAGS) $(CFLAGS) -MT testsuite/libsframe.decode/testsuite_libsframe_decode_be_flipping-be-flipping.obj -MD -MP -MF testsuite/libsframe.decode/$(DEPDIR)/testsuite_libsframe_decode_be_flipping-be-flipping.Tpo -c -o testsuite/libsframe.decode/testsuite_libsframe_decode_be_flipping-be-flipping.obj `if test -f 'testsuite/libsframe.decode/be-flipping.c'; then $(CYGPATH_W) 'testsuite/libsframe.decode/be-flipping.c'; else $(CYGPATH_W) '$(srcdir)/testsuite/libsframe.decode/be-flipping.c'; fi`
--@am__fastdepCC_TRUE@	$(AM_V_at)$(am__mv) testsuite/libsframe.decode/$(DEPDIR)/testsuite_libsframe_decode_be_flipping-be-flipping.Tpo testsuite/libsframe.decode/$(DEPDIR)/testsuite_libsframe_decode_be_flipping-be-flipping.Po
--@AMDEP_TRUE@@am__fastdepCC_FALSE@	$(AM_V_CC)source='testsuite/libsframe.decode/be-flipping.c' object='testsuite/libsframe.decode/testsuite_libsframe_decode_be_flipping-be-flipping.obj' libtool=no @AMDEPBACKSLASH@
-+testsuite/libsframe.decode/be_flipping-be-flipping.obj: testsuite/libsframe.decode/be-flipping.c
-+@am__fastdepCC_TRUE@	$(AM_V_CC)$(CC) $(DEFS) $(DEFAULT_INCLUDES) $(INCLUDES) $(testsuite_libsframe_decode_be_flipping_CPPFLAGS) $(CPPFLAGS) $(AM_CFLAGS) $(CFLAGS) -MT testsuite/libsframe.decode/be_flipping-be-flipping.obj -MD -MP -MF testsuite/libsframe.decode/$(DEPDIR)/be_flipping-be-flipping.Tpo -c -o testsuite/libsframe.decode/be_flipping-be-flipping.obj `if test -f 'testsuite/libsframe.decode/be-flipping.c'; then $(CYGPATH_W) 'testsuite/libsframe.decode/be-flipping.c'; else $(CYGPATH_W) '$(srcdir)/testsuite/libsframe.decode/be-flipping.c'; fi`
-+@am__fastdepCC_TRUE@	$(AM_V_at)$(am__mv) testsuite/libsframe.decode/$(DEPDIR)/be_flipping-be-flipping.Tpo testsuite/libsframe.decode/$(DEPDIR)/be_flipping-be-flipping.Po
-+@AMDEP_TRUE@@am__fastdepCC_FALSE@	$(AM_V_CC)source='testsuite/libsframe.decode/be-flipping.c' object='testsuite/libsframe.decode/be_flipping-be-flipping.obj' libtool=no @AMDEPBACKSLASH@
- @AMDEP_TRUE@@am__fastdepCC_FALSE@	DEPDIR=$(DEPDIR) $(CCDEPMODE) $(depcomp) @AMDEPBACKSLASH@
--@am__fastdepCC_FALSE@	$(AM_V_CC@am__nodep@)$(CC) $(DEFS) $(DEFAULT_INCLUDES) $(INCLUDES) $(testsuite_libsframe_decode_be_flipping_CPPFLAGS) $(CPPFLAGS) $(AM_CFLAGS) $(CFLAGS) -c -o testsuite/libsframe.decode/testsuite_libsframe_decode_be_flipping-be-flipping.obj `if test -f 'testsuite/libsframe.decode/be-flipping.c'; then $(CYGPATH_W) 'testsuite/libsframe.decode/be-flipping.c'; else $(CYGPATH_W) '$(srcdir)/testsuite/libsframe.decode/be-flipping.c'; fi`
-+@am__fastdepCC_FALSE@	$(AM_V_CC@am__nodep@)$(CC) $(DEFS) $(DEFAULT_INCLUDES) $(INCLUDES) $(testsuite_libsframe_decode_be_flipping_CPPFLAGS) $(CPPFLAGS) $(AM_CFLAGS) $(CFLAGS) -c -o testsuite/libsframe.decode/be_flipping-be-flipping.obj `if test -f 'testsuite/libsframe.decode/be-flipping.c'; then $(CYGPATH_W) 'testsuite/libsframe.decode/be-flipping.c'; else $(CYGPATH_W) '$(srcdir)/testsuite/libsframe.decode/be-flipping.c'; fi`
- 
--testsuite/libsframe.decode/testsuite_libsframe_decode_frecnt_1-frecnt-1.o: testsuite/libsframe.decode/frecnt-1.c
--@am__fastdepCC_TRUE@	$(AM_V_CC)$(CC) $(DEFS) $(DEFAULT_INCLUDES) $(INCLUDES) $(testsuite_libsframe_decode_frecnt_1_CPPFLAGS) $(CPPFLAGS) $(AM_CFLAGS) $(CFLAGS) -MT testsuite/libsframe.decode/testsuite_libsframe_decode_frecnt_1-frecnt-1.o -MD -MP -MF testsuite/libsframe.decode/$(DEPDIR)/testsuite_libsframe_decode_frecnt_1-frecnt-1.Tpo -c -o testsuite/libsframe.decode/testsuite_libsframe_decode_frecnt_1-frecnt-1.o `test -f 'testsuite/libsframe.decode/frecnt-1.c' || echo '$(srcdir)/'`testsuite/libsframe.decode/frecnt-1.c
--@am__fastdepCC_TRUE@	$(AM_V_at)$(am__mv) testsuite/libsframe.decode/$(DEPDIR)/testsuite_libsframe_decode_frecnt_1-frecnt-1.Tpo testsuite/libsframe.decode/$(DEPDIR)/testsuite_libsframe_decode_frecnt_1-frecnt-1.Po
--@AMDEP_TRUE@@am__fastdepCC_FALSE@	$(AM_V_CC)source='testsuite/libsframe.decode/frecnt-1.c' object='testsuite/libsframe.decode/testsuite_libsframe_decode_frecnt_1-frecnt-1.o' libtool=no @AMDEPBACKSLASH@
-+testsuite/libsframe.decode/frecnt_1-frecnt-1.o: testsuite/libsframe.decode/frecnt-1.c
-+@am__fastdepCC_TRUE@	$(AM_V_CC)$(CC) $(DEFS) $(DEFAULT_INCLUDES) $(INCLUDES) $(testsuite_libsframe_decode_frecnt_1_CPPFLAGS) $(CPPFLAGS) $(AM_CFLAGS) $(CFLAGS) -MT testsuite/libsframe.decode/frecnt_1-frecnt-1.o -MD -MP -MF testsuite/libsframe.decode/$(DEPDIR)/frecnt_1-frecnt-1.Tpo -c -o testsuite/libsframe.decode/frecnt_1-frecnt-1.o `test -f 'testsuite/libsframe.decode/frecnt-1.c' || echo '$(srcdir)/'`testsuite/libsframe.decode/frecnt-1.c
-+@am__fastdepCC_TRUE@	$(AM_V_at)$(am__mv) testsuite/libsframe.decode/$(DEPDIR)/frecnt_1-frecnt-1.Tpo testsuite/libsframe.decode/$(DEPDIR)/frecnt_1-frecnt-1.Po
-+@AMDEP_TRUE@@am__fastdepCC_FALSE@	$(AM_V_CC)source='testsuite/libsframe.decode/frecnt-1.c' object='testsuite/libsframe.decode/frecnt_1-frecnt-1.o' libtool=no @AMDEPBACKSLASH@
- @AMDEP_TRUE@@am__fastdepCC_FALSE@	DEPDIR=$(DEPDIR) $(CCDEPMODE) $(depcomp) @AMDEPBACKSLASH@
--@am__fastdepCC_FALSE@	$(AM_V_CC@am__nodep@)$(CC) $(DEFS) $(DEFAULT_INCLUDES) $(INCLUDES) $(testsuite_libsframe_decode_frecnt_1_CPPFLAGS) $(CPPFLAGS) $(AM_CFLAGS) $(CFLAGS) -c -o testsuite/libsframe.decode/testsuite_libsframe_decode_frecnt_1-frecnt-1.o `test -f 'testsuite/libsframe.decode/frecnt-1.c' || echo '$(srcdir)/'`testsuite/libsframe.decode/frecnt-1.c
-+@am__fastdepCC_FALSE@	$(AM_V_CC@am__nodep@)$(CC) $(DEFS) $(DEFAULT_INCLUDES) $(INCLUDES) $(testsuite_libsframe_decode_frecnt_1_CPPFLAGS) $(CPPFLAGS) $(AM_CFLAGS) $(CFLAGS) -c -o testsuite/libsframe.decode/frecnt_1-frecnt-1.o `test -f 'testsuite/libsframe.decode/frecnt-1.c' || echo '$(srcdir)/'`testsuite/libsframe.decode/frecnt-1.c
- 
--testsuite/libsframe.decode/testsuite_libsframe_decode_frecnt_1-frecnt-1.obj: testsuite/libsframe.decode/frecnt-1.c
--@am__fastdepCC_TRUE@	$(AM_V_CC)$(CC) $(DEFS) $(DEFAULT_INCLUDES) $(INCLUDES) $(testsuite_libsframe_decode_frecnt_1_CPPFLAGS) $(CPPFLAGS) $(AM_CFLAGS) $(CFLAGS) -MT testsuite/libsframe.decode/testsuite_libsframe_decode_frecnt_1-frecnt-1.obj -MD -MP -MF testsuite/libsframe.decode/$(DEPDIR)/testsuite_libsframe_decode_frecnt_1-frecnt-1.Tpo -c -o testsuite/libsframe.decode/testsuite_libsframe_decode_frecnt_1-frecnt-1.obj `if test -f 'testsuite/libsframe.decode/frecnt-1.c'; then $(CYGPATH_W) 'testsuite/libsframe.decode/frecnt-1.c'; else $(CYGPATH_W) '$(srcdir)/testsuite/libsframe.decode/frecnt-1.c'; fi`
--@am__fastdepCC_TRUE@	$(AM_V_at)$(am__mv) testsuite/libsframe.decode/$(DEPDIR)/testsuite_libsframe_decode_frecnt_1-frecnt-1.Tpo testsuite/libsframe.decode/$(DEPDIR)/testsuite_libsframe_decode_frecnt_1-frecnt-1.Po
--@AMDEP_TRUE@@am__fastdepCC_FALSE@	$(AM_V_CC)source='testsuite/libsframe.decode/frecnt-1.c' object='testsuite/libsframe.decode/testsuite_libsframe_decode_frecnt_1-frecnt-1.obj' libtool=no @AMDEPBACKSLASH@
-+testsuite/libsframe.decode/frecnt_1-frecnt-1.obj: testsuite/libsframe.decode/frecnt-1.c
-+@am__fastdepCC_TRUE@	$(AM_V_CC)$(CC) $(DEFS) $(DEFAULT_INCLUDES) $(INCLUDES) $(testsuite_libsframe_decode_frecnt_1_CPPFLAGS) $(CPPFLAGS) $(AM_CFLAGS) $(CFLAGS) -MT testsuite/libsframe.decode/frecnt_1-frecnt-1.obj -MD -MP -MF testsuite/libsframe.decode/$(DEPDIR)/frecnt_1-frecnt-1.Tpo -c -o testsuite/libsframe.decode/frecnt_1-frecnt-1.obj `if test -f 'testsuite/libsframe.decode/frecnt-1.c'; then $(CYGPATH_W) 'testsuite/libsframe.decode/frecnt-1.c'; else $(CYGPATH_W) '$(srcdir)/testsuite/libsframe.decode/frecnt-1.c'; fi`
-+@am__fastdepCC_TRUE@	$(AM_V_at)$(am__mv) testsuite/libsframe.decode/$(DEPDIR)/frecnt_1-frecnt-1.Tpo testsuite/libsframe.decode/$(DEPDIR)/frecnt_1-frecnt-1.Po
-+@AMDEP_TRUE@@am__fastdepCC_FALSE@	$(AM_V_CC)source='testsuite/libsframe.decode/frecnt-1.c' object='testsuite/libsframe.decode/frecnt_1-frecnt-1.obj' libtool=no @AMDEPBACKSLASH@
- @AMDEP_TRUE@@am__fastdepCC_FALSE@	DEPDIR=$(DEPDIR) $(CCDEPMODE) $(depcomp) @AMDEPBACKSLASH@
--@am__fastdepCC_FALSE@	$(AM_V_CC@am__nodep@)$(CC) $(DEFS) $(DEFAULT_INCLUDES) $(INCLUDES) $(testsuite_libsframe_decode_frecnt_1_CPPFLAGS) $(CPPFLAGS) $(AM_CFLAGS) $(CFLAGS) -c -o testsuite/libsframe.decode/testsuite_libsframe_decode_frecnt_1-frecnt-1.obj `if test -f 'testsuite/libsframe.decode/frecnt-1.c'; then $(CYGPATH_W) 'testsuite/libsframe.decode/frecnt-1.c'; else $(CYGPATH_W) '$(srcdir)/testsuite/libsframe.decode/frecnt-1.c'; fi`
-+@am__fastdepCC_FALSE@	$(AM_V_CC@am__nodep@)$(CC) $(DEFS) $(DEFAULT_INCLUDES) $(INCLUDES) $(testsuite_libsframe_decode_frecnt_1_CPPFLAGS) $(CPPFLAGS) $(AM_CFLAGS) $(CFLAGS) -c -o testsuite/libsframe.decode/frecnt_1-frecnt-1.obj `if test -f 'testsuite/libsframe.decode/frecnt-1.c'; then $(CYGPATH_W) 'testsuite/libsframe.decode/frecnt-1.c'; else $(CYGPATH_W) '$(srcdir)/testsuite/libsframe.decode/frecnt-1.c'; fi`
- 
--testsuite/libsframe.decode/testsuite_libsframe_decode_frecnt_2-frecnt-2.o: testsuite/libsframe.decode/frecnt-2.c
--@am__fastdepCC_TRUE@	$(AM_V_CC)$(CC) $(DEFS) $(DEFAULT_INCLUDES) $(INCLUDES) $(testsuite_libsframe_decode_frecnt_2_CPPFLAGS) $(CPPFLAGS) $(AM_CFLAGS) $(CFLAGS) -MT testsuite/libsframe.decode/testsuite_libsframe_decode_frecnt_2-frecnt-2.o -MD -MP -MF testsuite/libsframe.decode/$(DEPDIR)/testsuite_libsframe_decode_frecnt_2-frecnt-2.Tpo -c -o testsuite/libsframe.decode/testsuite_libsframe_decode_frecnt_2-frecnt-2.o `test -f 'testsuite/libsframe.decode/frecnt-2.c' || echo '$(srcdir)/'`testsuite/libsframe.decode/frecnt-2.c
--@am__fastdepCC_TRUE@	$(AM_V_at)$(am__mv) testsuite/libsframe.decode/$(DEPDIR)/testsuite_libsframe_decode_frecnt_2-frecnt-2.Tpo testsuite/libsframe.decode/$(DEPDIR)/testsuite_libsframe_decode_frecnt_2-frecnt-2.Po
--@AMDEP_TRUE@@am__fastdepCC_FALSE@	$(AM_V_CC)source='testsuite/libsframe.decode/frecnt-2.c' object='testsuite/libsframe.decode/testsuite_libsframe_decode_frecnt_2-frecnt-2.o' libtool=no @AMDEPBACKSLASH@
-+testsuite/libsframe.decode/frecnt_2-frecnt-2.o: testsuite/libsframe.decode/frecnt-2.c
-+@am__fastdepCC_TRUE@	$(AM_V_CC)$(CC) $(DEFS) $(DEFAULT_INCLUDES) $(INCLUDES) $(testsuite_libsframe_decode_frecnt_2_CPPFLAGS) $(CPPFLAGS) $(AM_CFLAGS) $(CFLAGS) -MT testsuite/libsframe.decode/frecnt_2-frecnt-2.o -MD -MP -MF testsuite/libsframe.decode/$(DEPDIR)/frecnt_2-frecnt-2.Tpo -c -o testsuite/libsframe.decode/frecnt_2-frecnt-2.o `test -f 'testsuite/libsframe.decode/frecnt-2.c' || echo '$(srcdir)/'`testsuite/libsframe.decode/frecnt-2.c
-+@am__fastdepCC_TRUE@	$(AM_V_at)$(am__mv) testsuite/libsframe.decode/$(DEPDIR)/frecnt_2-frecnt-2.Tpo testsuite/libsframe.decode/$(DEPDIR)/frecnt_2-frecnt-2.Po
-+@AMDEP_TRUE@@am__fastdepCC_FALSE@	$(AM_V_CC)source='testsuite/libsframe.decode/frecnt-2.c' object='testsuite/libsframe.decode/frecnt_2-frecnt-2.o' libtool=no @AMDEPBACKSLASH@
- @AMDEP_TRUE@@am__fastdepCC_FALSE@	DEPDIR=$(DEPDIR) $(CCDEPMODE) $(depcomp) @AMDEPBACKSLASH@
--@am__fastdepCC_FALSE@	$(AM_V_CC@am__nodep@)$(CC) $(DEFS) $(DEFAULT_INCLUDES) $(INCLUDES) $(testsuite_libsframe_decode_frecnt_2_CPPFLAGS) $(CPPFLAGS) $(AM_CFLAGS) $(CFLAGS) -c -o testsuite/libsframe.decode/testsuite_libsframe_decode_frecnt_2-frecnt-2.o `test -f 'testsuite/libsframe.decode/frecnt-2.c' || echo '$(srcdir)/'`testsuite/libsframe.decode/frecnt-2.c
-+@am__fastdepCC_FALSE@	$(AM_V_CC@am__nodep@)$(CC) $(DEFS) $(DEFAULT_INCLUDES) $(INCLUDES) $(testsuite_libsframe_decode_frecnt_2_CPPFLAGS) $(CPPFLAGS) $(AM_CFLAGS) $(CFLAGS) -c -o testsuite/libsframe.decode/frecnt_2-frecnt-2.o `test -f 'testsuite/libsframe.decode/frecnt-2.c' || echo '$(srcdir)/'`testsuite/libsframe.decode/frecnt-2.c
- 
--testsuite/libsframe.decode/testsuite_libsframe_decode_frecnt_2-frecnt-2.obj: testsuite/libsframe.decode/frecnt-2.c
--@am__fastdepCC_TRUE@	$(AM_V_CC)$(CC) $(DEFS) $(DEFAULT_INCLUDES) $(INCLUDES) $(testsuite_libsframe_decode_frecnt_2_CPPFLAGS) $(CPPFLAGS) $(AM_CFLAGS) $(CFLAGS) -MT testsuite/libsframe.decode/testsuite_libsframe_decode_frecnt_2-frecnt-2.obj -MD -MP -MF testsuite/libsframe.decode/$(DEPDIR)/testsuite_libsframe_decode_frecnt_2-frecnt-2.Tpo -c -o testsuite/libsframe.decode/testsuite_libsframe_decode_frecnt_2-frecnt-2.obj `if test -f 'testsuite/libsframe.decode/frecnt-2.c'; then $(CYGPATH_W) 'testsuite/libsframe.decode/frecnt-2.c'; else $(CYGPATH_W) '$(srcdir)/testsuite/libsframe.decode/frecnt-2.c'; fi`
--@am__fastdepCC_TRUE@	$(AM_V_at)$(am__mv) testsuite/libsframe.decode/$(DEPDIR)/testsuite_libsframe_decode_frecnt_2-frecnt-2.Tpo testsuite/libsframe.decode/$(DEPDIR)/testsuite_libsframe_decode_frecnt_2-frecnt-2.Po
--@AMDEP_TRUE@@am__fastdepCC_FALSE@	$(AM_V_CC)source='testsuite/libsframe.decode/frecnt-2.c' object='testsuite/libsframe.decode/testsuite_libsframe_decode_frecnt_2-frecnt-2.obj' libtool=no @AMDEPBACKSLASH@
-+testsuite/libsframe.decode/frecnt_2-frecnt-2.obj: testsuite/libsframe.decode/frecnt-2.c
-+@am__fastdepCC_TRUE@	$(AM_V_CC)$(CC) $(DEFS) $(DEFAULT_INCLUDES) $(INCLUDES) $(testsuite_libsframe_decode_frecnt_2_CPPFLAGS) $(CPPFLAGS) $(AM_CFLAGS) $(CFLAGS) -MT testsuite/libsframe.decode/frecnt_2-frecnt-2.obj -MD -MP -MF testsuite/libsframe.decode/$(DEPDIR)/frecnt_2-frecnt-2.Tpo -c -o testsuite/libsframe.decode/frecnt_2-frecnt-2.obj `if test -f 'testsuite/libsframe.decode/frecnt-2.c'; then $(CYGPATH_W) 'testsuite/libsframe.decode/frecnt-2.c'; else $(CYGPATH_W) '$(srcdir)/testsuite/libsframe.decode/frecnt-2.c'; fi`
-+@am__fastdepCC_TRUE@	$(AM_V_at)$(am__mv) testsuite/libsframe.decode/$(DEPDIR)/frecnt_2-frecnt-2.Tpo testsuite/libsframe.decode/$(DEPDIR)/frecnt_2-frecnt-2.Po
-+@AMDEP_TRUE@@am__fastdepCC_FALSE@	$(AM_V_CC)source='testsuite/libsframe.decode/frecnt-2.c' object='testsuite/libsframe.decode/frecnt_2-frecnt-2.obj' libtool=no @AMDEPBACKSLASH@
- @AMDEP_TRUE@@am__fastdepCC_FALSE@	DEPDIR=$(DEPDIR) $(CCDEPMODE) $(depcomp) @AMDEPBACKSLASH@
--@am__fastdepCC_FALSE@	$(AM_V_CC@am__nodep@)$(CC) $(DEFS) $(DEFAULT_INCLUDES) $(INCLUDES) $(testsuite_libsframe_decode_frecnt_2_CPPFLAGS) $(CPPFLAGS) $(AM_CFLAGS) $(CFLAGS) -c -o testsuite/libsframe.decode/testsuite_libsframe_decode_frecnt_2-frecnt-2.obj `if test -f 'testsuite/libsframe.decode/frecnt-2.c'; then $(CYGPATH_W) 'testsuite/libsframe.decode/frecnt-2.c'; else $(CYGPATH_W) '$(srcdir)/testsuite/libsframe.decode/frecnt-2.c'; fi`
-+@am__fastdepCC_FALSE@	$(AM_V_CC@am__nodep@)$(CC) $(DEFS) $(DEFAULT_INCLUDES) $(INCLUDES) $(testsuite_libsframe_decode_frecnt_2_CPPFLAGS) $(CPPFLAGS) $(AM_CFLAGS) $(CFLAGS) -c -o testsuite/libsframe.decode/frecnt_2-frecnt-2.obj `if test -f 'testsuite/libsframe.decode/frecnt-2.c'; then $(CYGPATH_W) 'testsuite/libsframe.decode/frecnt-2.c'; else $(CYGPATH_W) '$(srcdir)/testsuite/libsframe.decode/frecnt-2.c'; fi`
- 
--testsuite/libsframe.encode/testsuite_libsframe_encode_encode_1-encode-1.o: testsuite/libsframe.encode/encode-1.c
--@am__fastdepCC_TRUE@	$(AM_V_CC)$(CC) $(DEFS) $(DEFAULT_INCLUDES) $(INCLUDES) $(testsuite_libsframe_encode_encode_1_CPPFLAGS) $(CPPFLAGS) $(AM_CFLAGS) $(CFLAGS) -MT testsuite/libsframe.encode/testsuite_libsframe_encode_encode_1-encode-1.o -MD -MP -MF testsuite/libsframe.encode/$(DEPDIR)/testsuite_libsframe_encode_encode_1-encode-1.Tpo -c -o testsuite/libsframe.encode/testsuite_libsframe_encode_encode_1-encode-1.o `test -f 'testsuite/libsframe.encode/encode-1.c' || echo '$(srcdir)/'`testsuite/libsframe.encode/encode-1.c
--@am__fastdepCC_TRUE@	$(AM_V_at)$(am__mv) testsuite/libsframe.encode/$(DEPDIR)/testsuite_libsframe_encode_encode_1-encode-1.Tpo testsuite/libsframe.encode/$(DEPDIR)/testsuite_libsframe_encode_encode_1-encode-1.Po
--@AMDEP_TRUE@@am__fastdepCC_FALSE@	$(AM_V_CC)source='testsuite/libsframe.encode/encode-1.c' object='testsuite/libsframe.encode/testsuite_libsframe_encode_encode_1-encode-1.o' libtool=no @AMDEPBACKSLASH@
-+testsuite/libsframe.encode/encode_1-encode-1.o: testsuite/libsframe.encode/encode-1.c
-+@am__fastdepCC_TRUE@	$(AM_V_CC)$(CC) $(DEFS) $(DEFAULT_INCLUDES) $(INCLUDES) $(testsuite_libsframe_encode_encode_1_CPPFLAGS) $(CPPFLAGS) $(AM_CFLAGS) $(CFLAGS) -MT testsuite/libsframe.encode/encode_1-encode-1.o -MD -MP -MF testsuite/libsframe.encode/$(DEPDIR)/encode_1-encode-1.Tpo -c -o testsuite/libsframe.encode/encode_1-encode-1.o `test -f 'testsuite/libsframe.encode/encode-1.c' || echo '$(srcdir)/'`testsuite/libsframe.encode/encode-1.c
-+@am__fastdepCC_TRUE@	$(AM_V_at)$(am__mv) testsuite/libsframe.encode/$(DEPDIR)/encode_1-encode-1.Tpo testsuite/libsframe.encode/$(DEPDIR)/encode_1-encode-1.Po
-+@AMDEP_TRUE@@am__fastdepCC_FALSE@	$(AM_V_CC)source='testsuite/libsframe.encode/encode-1.c' object='testsuite/libsframe.encode/encode_1-encode-1.o' libtool=no @AMDEPBACKSLASH@
- @AMDEP_TRUE@@am__fastdepCC_FALSE@	DEPDIR=$(DEPDIR) $(CCDEPMODE) $(depcomp) @AMDEPBACKSLASH@
--@am__fastdepCC_FALSE@	$(AM_V_CC@am__nodep@)$(CC) $(DEFS) $(DEFAULT_INCLUDES) $(INCLUDES) $(testsuite_libsframe_encode_encode_1_CPPFLAGS) $(CPPFLAGS) $(AM_CFLAGS) $(CFLAGS) -c -o testsuite/libsframe.encode/testsuite_libsframe_encode_encode_1-encode-1.o `test -f 'testsuite/libsframe.encode/encode-1.c' || echo '$(srcdir)/'`testsuite/libsframe.encode/encode-1.c
-+@am__fastdepCC_FALSE@	$(AM_V_CC@am__nodep@)$(CC) $(DEFS) $(DEFAULT_INCLUDES) $(INCLUDES) $(testsuite_libsframe_encode_encode_1_CPPFLAGS) $(CPPFLAGS) $(AM_CFLAGS) $(CFLAGS) -c -o testsuite/libsframe.encode/encode_1-encode-1.o `test -f 'testsuite/libsframe.encode/encode-1.c' || echo '$(srcdir)/'`testsuite/libsframe.encode/encode-1.c
- 
--testsuite/libsframe.encode/testsuite_libsframe_encode_encode_1-encode-1.obj: testsuite/libsframe.encode/encode-1.c
--@am__fastdepCC_TRUE@	$(AM_V_CC)$(CC) $(DEFS) $(DEFAULT_INCLUDES) $(INCLUDES) $(testsuite_libsframe_encode_encode_1_CPPFLAGS) $(CPPFLAGS) $(AM_CFLAGS) $(CFLAGS) -MT testsuite/libsframe.encode/testsuite_libsframe_encode_encode_1-encode-1.obj -MD -MP -MF testsuite/libsframe.encode/$(DEPDIR)/testsuite_libsframe_encode_encode_1-encode-1.Tpo -c -o testsuite/libsframe.encode/testsuite_libsframe_encode_encode_1-encode-1.obj `if test -f 'testsuite/libsframe.encode/encode-1.c'; then $(CYGPATH_W) 'testsuite/libsframe.encode/encode-1.c'; else $(CYGPATH_W) '$(srcdir)/testsuite/libsframe.encode/encode-1.c'; fi`
--@am__fastdepCC_TRUE@	$(AM_V_at)$(am__mv) testsuite/libsframe.encode/$(DEPDIR)/testsuite_libsframe_encode_encode_1-encode-1.Tpo testsuite/libsframe.encode/$(DEPDIR)/testsuite_libsframe_encode_encode_1-encode-1.Po
--@AMDEP_TRUE@@am__fastdepCC_FALSE@	$(AM_V_CC)source='testsuite/libsframe.encode/encode-1.c' object='testsuite/libsframe.encode/testsuite_libsframe_encode_encode_1-encode-1.obj' libtool=no @AMDEPBACKSLASH@
-+testsuite/libsframe.encode/encode_1-encode-1.obj: testsuite/libsframe.encode/encode-1.c
-+@am__fastdepCC_TRUE@	$(AM_V_CC)$(CC) $(DEFS) $(DEFAULT_INCLUDES) $(INCLUDES) $(testsuite_libsframe_encode_encode_1_CPPFLAGS) $(CPPFLAGS) $(AM_CFLAGS) $(CFLAGS) -MT testsuite/libsframe.encode/encode_1-encode-1.obj -MD -MP -MF testsuite/libsframe.encode/$(DEPDIR)/encode_1-encode-1.Tpo -c -o testsuite/libsframe.encode/encode_1-encode-1.obj `if test -f 'testsuite/libsframe.encode/encode-1.c'; then $(CYGPATH_W) 'testsuite/libsframe.encode/encode-1.c'; else $(CYGPATH_W) '$(srcdir)/testsuite/libsframe.encode/encode-1.c'; fi`
-+@am__fastdepCC_TRUE@	$(AM_V_at)$(am__mv) testsuite/libsframe.encode/$(DEPDIR)/encode_1-encode-1.Tpo testsuite/libsframe.encode/$(DEPDIR)/encode_1-encode-1.Po
-+@AMDEP_TRUE@@am__fastdepCC_FALSE@	$(AM_V_CC)source='testsuite/libsframe.encode/encode-1.c' object='testsuite/libsframe.encode/encode_1-encode-1.obj' libtool=no @AMDEPBACKSLASH@
- @AMDEP_TRUE@@am__fastdepCC_FALSE@	DEPDIR=$(DEPDIR) $(CCDEPMODE) $(depcomp) @AMDEPBACKSLASH@
--@am__fastdepCC_FALSE@	$(AM_V_CC@am__nodep@)$(CC) $(DEFS) $(DEFAULT_INCLUDES) $(INCLUDES) $(testsuite_libsframe_encode_encode_1_CPPFLAGS) $(CPPFLAGS) $(AM_CFLAGS) $(CFLAGS) -c -o testsuite/libsframe.encode/testsuite_libsframe_encode_encode_1-encode-1.obj `if test -f 'testsuite/libsframe.encode/encode-1.c'; then $(CYGPATH_W) 'testsuite/libsframe.encode/encode-1.c'; else $(CYGPATH_W) '$(srcdir)/testsuite/libsframe.encode/encode-1.c'; fi`
-+@am__fastdepCC_FALSE@	$(AM_V_CC@am__nodep@)$(CC) $(DEFS) $(DEFAULT_INCLUDES) $(INCLUDES) $(testsuite_libsframe_encode_encode_1_CPPFLAGS) $(CPPFLAGS) $(AM_CFLAGS) $(CFLAGS) -c -o testsuite/libsframe.encode/encode_1-encode-1.obj `if test -f 'testsuite/libsframe.encode/encode-1.c'; then $(CYGPATH_W) 'testsuite/libsframe.encode/encode-1.c'; else $(CYGPATH_W) '$(srcdir)/testsuite/libsframe.encode/encode-1.c'; fi`
- 
--testsuite/libsframe.find/testsuite_libsframe_find_findfre_1-findfre-1.o: testsuite/libsframe.find/findfre-1.c
--@am__fastdepCC_TRUE@	$(AM_V_CC)$(CC) $(DEFS) $(DEFAULT_INCLUDES) $(INCLUDES) $(testsuite_libsframe_find_findfre_1_CPPFLAGS) $(CPPFLAGS) $(AM_CFLAGS) $(CFLAGS) -MT testsuite/libsframe.find/testsuite_libsframe_find_findfre_1-findfre-1.o -MD -MP -MF testsuite/libsframe.find/$(DEPDIR)/testsuite_libsframe_find_findfre_1-findfre-1.Tpo -c -o testsuite/libsframe.find/testsuite_libsframe_find_findfre_1-findfre-1.o `test -f 'testsuite/libsframe.find/findfre-1.c' || echo '$(srcdir)/'`testsuite/libsframe.find/findfre-1.c
--@am__fastdepCC_TRUE@	$(AM_V_at)$(am__mv) testsuite/libsframe.find/$(DEPDIR)/testsuite_libsframe_find_findfre_1-findfre-1.Tpo testsuite/libsframe.find/$(DEPDIR)/testsuite_libsframe_find_findfre_1-findfre-1.Po
--@AMDEP_TRUE@@am__fastdepCC_FALSE@	$(AM_V_CC)source='testsuite/libsframe.find/findfre-1.c' object='testsuite/libsframe.find/testsuite_libsframe_find_findfre_1-findfre-1.o' libtool=no @AMDEPBACKSLASH@
-+testsuite/libsframe.find/findfre_1-findfre-1.o: testsuite/libsframe.find/findfre-1.c
-+@am__fastdepCC_TRUE@	$(AM_V_CC)$(CC) $(DEFS) $(DEFAULT_INCLUDES) $(INCLUDES) $(testsuite_libsframe_find_findfre_1_CPPFLAGS) $(CPPFLAGS) $(AM_CFLAGS) $(CFLAGS) -MT testsuite/libsframe.find/findfre_1-findfre-1.o -MD -MP -MF testsuite/libsframe.find/$(DEPDIR)/findfre_1-findfre-1.Tpo -c -o testsuite/libsframe.find/findfre_1-findfre-1.o `test -f 'testsuite/libsframe.find/findfre-1.c' || echo '$(srcdir)/'`testsuite/libsframe.find/findfre-1.c
-+@am__fastdepCC_TRUE@	$(AM_V_at)$(am__mv) testsuite/libsframe.find/$(DEPDIR)/findfre_1-findfre-1.Tpo testsuite/libsframe.find/$(DEPDIR)/findfre_1-findfre-1.Po
-+@AMDEP_TRUE@@am__fastdepCC_FALSE@	$(AM_V_CC)source='testsuite/libsframe.find/findfre-1.c' object='testsuite/libsframe.find/findfre_1-findfre-1.o' libtool=no @AMDEPBACKSLASH@
- @AMDEP_TRUE@@am__fastdepCC_FALSE@	DEPDIR=$(DEPDIR) $(CCDEPMODE) $(depcomp) @AMDEPBACKSLASH@
--@am__fastdepCC_FALSE@	$(AM_V_CC@am__nodep@)$(CC) $(DEFS) $(DEFAULT_INCLUDES) $(INCLUDES) $(testsuite_libsframe_find_findfre_1_CPPFLAGS) $(CPPFLAGS) $(AM_CFLAGS) $(CFLAGS) -c -o testsuite/libsframe.find/testsuite_libsframe_find_findfre_1-findfre-1.o `test -f 'testsuite/libsframe.find/findfre-1.c' || echo '$(srcdir)/'`testsuite/libsframe.find/findfre-1.c
-+@am__fastdepCC_FALSE@	$(AM_V_CC@am__nodep@)$(CC) $(DEFS) $(DEFAULT_INCLUDES) $(INCLUDES) $(testsuite_libsframe_find_findfre_1_CPPFLAGS) $(CPPFLAGS) $(AM_CFLAGS) $(CFLAGS) -c -o testsuite/libsframe.find/findfre_1-findfre-1.o `test -f 'testsuite/libsframe.find/findfre-1.c' || echo '$(srcdir)/'`testsuite/libsframe.find/findfre-1.c
- 
--testsuite/libsframe.find/testsuite_libsframe_find_findfre_1-findfre-1.obj: testsuite/libsframe.find/findfre-1.c
--@am__fastdepCC_TRUE@	$(AM_V_CC)$(CC) $(DEFS) $(DEFAULT_INCLUDES) $(INCLUDES) $(testsuite_libsframe_find_findfre_1_CPPFLAGS) $(CPPFLAGS) $(AM_CFLAGS) $(CFLAGS) -MT testsuite/libsframe.find/testsuite_libsframe_find_findfre_1-findfre-1.obj -MD -MP -MF testsuite/libsframe.find/$(DEPDIR)/testsuite_libsframe_find_findfre_1-findfre-1.Tpo -c -o testsuite/libsframe.find/testsuite_libsframe_find_findfre_1-findfre-1.obj `if test -f 'testsuite/libsframe.find/findfre-1.c'; then $(CYGPATH_W) 'testsuite/libsframe.find/findfre-1.c'; else $(CYGPATH_W) '$(srcdir)/testsuite/libsframe.find/findfre-1.c'; fi`
--@am__fastdepCC_TRUE@	$(AM_V_at)$(am__mv) testsuite/libsframe.find/$(DEPDIR)/testsuite_libsframe_find_findfre_1-findfre-1.Tpo testsuite/libsframe.find/$(DEPDIR)/testsuite_libsframe_find_findfre_1-findfre-1.Po
--@AMDEP_TRUE@@am__fastdepCC_FALSE@	$(AM_V_CC)source='testsuite/libsframe.find/findfre-1.c' object='testsuite/libsframe.find/testsuite_libsframe_find_findfre_1-findfre-1.obj' libtool=no @AMDEPBACKSLASH@
-+testsuite/libsframe.find/findfre_1-findfre-1.obj: testsuite/libsframe.find/findfre-1.c
-+@am__fastdepCC_TRUE@	$(AM_V_CC)$(CC) $(DEFS) $(DEFAULT_INCLUDES) $(INCLUDES) $(testsuite_libsframe_find_findfre_1_CPPFLAGS) $(CPPFLAGS) $(AM_CFLAGS) $(CFLAGS) -MT testsuite/libsframe.find/findfre_1-findfre-1.obj -MD -MP -MF testsuite/libsframe.find/$(DEPDIR)/findfre_1-findfre-1.Tpo -c -o testsuite/libsframe.find/findfre_1-findfre-1.obj `if test -f 'testsuite/libsframe.find/findfre-1.c'; then $(CYGPATH_W) 'testsuite/libsframe.find/findfre-1.c'; else $(CYGPATH_W) '$(srcdir)/testsuite/libsframe.find/findfre-1.c'; fi`
-+@am__fastdepCC_TRUE@	$(AM_V_at)$(am__mv) testsuite/libsframe.find/$(DEPDIR)/findfre_1-findfre-1.Tpo testsuite/libsframe.find/$(DEPDIR)/findfre_1-findfre-1.Po
-+@AMDEP_TRUE@@am__fastdepCC_FALSE@	$(AM_V_CC)source='testsuite/libsframe.find/findfre-1.c' object='testsuite/libsframe.find/findfre_1-findfre-1.obj' libtool=no @AMDEPBACKSLASH@
- @AMDEP_TRUE@@am__fastdepCC_FALSE@	DEPDIR=$(DEPDIR) $(CCDEPMODE) $(depcomp) @AMDEPBACKSLASH@
--@am__fastdepCC_FALSE@	$(AM_V_CC@am__nodep@)$(CC) $(DEFS) $(DEFAULT_INCLUDES) $(INCLUDES) $(testsuite_libsframe_find_findfre_1_CPPFLAGS) $(CPPFLAGS) $(AM_CFLAGS) $(CFLAGS) -c -o testsuite/libsframe.find/testsuite_libsframe_find_findfre_1-findfre-1.obj `if test -f 'testsuite/libsframe.find/findfre-1.c'; then $(CYGPATH_W) 'testsuite/libsframe.find/findfre-1.c'; else $(CYGPATH_W) '$(srcdir)/testsuite/libsframe.find/findfre-1.c'; fi`
-+@am__fastdepCC_FALSE@	$(AM_V_CC@am__nodep@)$(CC) $(DEFS) $(DEFAULT_INCLUDES) $(INCLUDES) $(testsuite_libsframe_find_findfre_1_CPPFLAGS) $(CPPFLAGS) $(AM_CFLAGS) $(CFLAGS) -c -o testsuite/libsframe.find/findfre_1-findfre-1.obj `if test -f 'testsuite/libsframe.find/findfre-1.c'; then $(CYGPATH_W) 'testsuite/libsframe.find/findfre-1.c'; else $(CYGPATH_W) '$(srcdir)/testsuite/libsframe.find/findfre-1.c'; fi`
- 
--testsuite/libsframe.find/testsuite_libsframe_find_findfunc_1-findfunc-1.o: testsuite/libsframe.find/findfunc-1.c
--@am__fastdepCC_TRUE@	$(AM_V_CC)$(CC) $(DEFS) $(DEFAULT_INCLUDES) $(INCLUDES) $(testsuite_libsframe_find_findfunc_1_CPPFLAGS) $(CPPFLAGS) $(AM_CFLAGS) $(CFLAGS) -MT testsuite/libsframe.find/testsuite_libsframe_find_findfunc_1-findfunc-1.o -MD -MP -MF testsuite/libsframe.find/$(DEPDIR)/testsuite_libsframe_find_findfunc_1-findfunc-1.Tpo -c -o testsuite/libsframe.find/testsuite_libsframe_find_findfunc_1-findfunc-1.o `test -f 'testsuite/libsframe.find/findfunc-1.c' || echo '$(srcdir)/'`testsuite/libsframe.find/findfunc-1.c
--@am__fastdepCC_TRUE@	$(AM_V_at)$(am__mv) testsuite/libsframe.find/$(DEPDIR)/testsuite_libsframe_find_findfunc_1-findfunc-1.Tpo testsuite/libsframe.find/$(DEPDIR)/testsuite_libsframe_find_findfunc_1-findfunc-1.Po
--@AMDEP_TRUE@@am__fastdepCC_FALSE@	$(AM_V_CC)source='testsuite/libsframe.find/findfunc-1.c' object='testsuite/libsframe.find/testsuite_libsframe_find_findfunc_1-findfunc-1.o' libtool=no @AMDEPBACKSLASH@
-+testsuite/libsframe.find/findfunc_1-findfunc-1.o: testsuite/libsframe.find/findfunc-1.c
-+@am__fastdepCC_TRUE@	$(AM_V_CC)$(CC) $(DEFS) $(DEFAULT_INCLUDES) $(INCLUDES) $(testsuite_libsframe_find_findfunc_1_CPPFLAGS) $(CPPFLAGS) $(AM_CFLAGS) $(CFLAGS) -MT testsuite/libsframe.find/findfunc_1-findfunc-1.o -MD -MP -MF testsuite/libsframe.find/$(DEPDIR)/findfunc_1-findfunc-1.Tpo -c -o testsuite/libsframe.find/findfunc_1-findfunc-1.o `test -f 'testsuite/libsframe.find/findfunc-1.c' || echo '$(srcdir)/'`testsuite/libsframe.find/findfunc-1.c
-+@am__fastdepCC_TRUE@	$(AM_V_at)$(am__mv) testsuite/libsframe.find/$(DEPDIR)/findfunc_1-findfunc-1.Tpo testsuite/libsframe.find/$(DEPDIR)/findfunc_1-findfunc-1.Po
-+@AMDEP_TRUE@@am__fastdepCC_FALSE@	$(AM_V_CC)source='testsuite/libsframe.find/findfunc-1.c' object='testsuite/libsframe.find/findfunc_1-findfunc-1.o' libtool=no @AMDEPBACKSLASH@
- @AMDEP_TRUE@@am__fastdepCC_FALSE@	DEPDIR=$(DEPDIR) $(CCDEPMODE) $(depcomp) @AMDEPBACKSLASH@
--@am__fastdepCC_FALSE@	$(AM_V_CC@am__nodep@)$(CC) $(DEFS) $(DEFAULT_INCLUDES) $(INCLUDES) $(testsuite_libsframe_find_findfunc_1_CPPFLAGS) $(CPPFLAGS) $(AM_CFLAGS) $(CFLAGS) -c -o testsuite/libsframe.find/testsuite_libsframe_find_findfunc_1-findfunc-1.o `test -f 'testsuite/libsframe.find/findfunc-1.c' || echo '$(srcdir)/'`testsuite/libsframe.find/findfunc-1.c
-+@am__fastdepCC_FALSE@	$(AM_V_CC@am__nodep@)$(CC) $(DEFS) $(DEFAULT_INCLUDES) $(INCLUDES) $(testsuite_libsframe_find_findfunc_1_CPPFLAGS) $(CPPFLAGS) $(AM_CFLAGS) $(CFLAGS) -c -o testsuite/libsframe.find/findfunc_1-findfunc-1.o `test -f 'testsuite/libsframe.find/findfunc-1.c' || echo '$(srcdir)/'`testsuite/libsframe.find/findfunc-1.c
- 
--testsuite/libsframe.find/testsuite_libsframe_find_findfunc_1-findfunc-1.obj: testsuite/libsframe.find/findfunc-1.c
--@am__fastdepCC_TRUE@	$(AM_V_CC)$(CC) $(DEFS) $(DEFAULT_INCLUDES) $(INCLUDES) $(testsuite_libsframe_find_findfunc_1_CPPFLAGS) $(CPPFLAGS) $(AM_CFLAGS) $(CFLAGS) -MT testsuite/libsframe.find/testsuite_libsframe_find_findfunc_1-findfunc-1.obj -MD -MP -MF testsuite/libsframe.find/$(DEPDIR)/testsuite_libsframe_find_findfunc_1-findfunc-1.Tpo -c -o testsuite/libsframe.find/testsuite_libsframe_find_findfunc_1-findfunc-1.obj `if test -f 'testsuite/libsframe.find/findfunc-1.c'; then $(CYGPATH_W) 'testsuite/libsframe.find/findfunc-1.c'; else $(CYGPATH_W) '$(srcdir)/testsuite/libsframe.find/findfunc-1.c'; fi`
--@am__fastdepCC_TRUE@	$(AM_V_at)$(am__mv) testsuite/libsframe.find/$(DEPDIR)/testsuite_libsframe_find_findfunc_1-findfunc-1.Tpo testsuite/libsframe.find/$(DEPDIR)/testsuite_libsframe_find_findfunc_1-findfunc-1.Po
--@AMDEP_TRUE@@am__fastdepCC_FALSE@	$(AM_V_CC)source='testsuite/libsframe.find/findfunc-1.c' object='testsuite/libsframe.find/testsuite_libsframe_find_findfunc_1-findfunc-1.obj' libtool=no @AMDEPBACKSLASH@
-+testsuite/libsframe.find/findfunc_1-findfunc-1.obj: testsuite/libsframe.find/findfunc-1.c
-+@am__fastdepCC_TRUE@	$(AM_V_CC)$(CC) $(DEFS) $(DEFAULT_INCLUDES) $(INCLUDES) $(testsuite_libsframe_find_findfunc_1_CPPFLAGS) $(CPPFLAGS) $(AM_CFLAGS) $(CFLAGS) -MT testsuite/libsframe.find/findfunc_1-findfunc-1.obj -MD -MP -MF testsuite/libsframe.find/$(DEPDIR)/findfunc_1-findfunc-1.Tpo -c -o testsuite/libsframe.find/findfunc_1-findfunc-1.obj `if test -f 'testsuite/libsframe.find/findfunc-1.c'; then $(CYGPATH_W) 'testsuite/libsframe.find/findfunc-1.c'; else $(CYGPATH_W) '$(srcdir)/testsuite/libsframe.find/findfunc-1.c'; fi`
-+@am__fastdepCC_TRUE@	$(AM_V_at)$(am__mv) testsuite/libsframe.find/$(DEPDIR)/findfunc_1-findfunc-1.Tpo testsuite/libsframe.find/$(DEPDIR)/findfunc_1-findfunc-1.Po
-+@AMDEP_TRUE@@am__fastdepCC_FALSE@	$(AM_V_CC)source='testsuite/libsframe.find/findfunc-1.c' object='testsuite/libsframe.find/findfunc_1-findfunc-1.obj' libtool=no @AMDEPBACKSLASH@
- @AMDEP_TRUE@@am__fastdepCC_FALSE@	DEPDIR=$(DEPDIR) $(CCDEPMODE) $(depcomp) @AMDEPBACKSLASH@
--@am__fastdepCC_FALSE@	$(AM_V_CC@am__nodep@)$(CC) $(DEFS) $(DEFAULT_INCLUDES) $(INCLUDES) $(testsuite_libsframe_find_findfunc_1_CPPFLAGS) $(CPPFLAGS) $(AM_CFLAGS) $(CFLAGS) -c -o testsuite/libsframe.find/testsuite_libsframe_find_findfunc_1-findfunc-1.obj `if test -f 'testsuite/libsframe.find/findfunc-1.c'; then $(CYGPATH_W) 'testsuite/libsframe.find/findfunc-1.c'; else $(CYGPATH_W) '$(srcdir)/testsuite/libsframe.find/findfunc-1.c'; fi`
-+@am__fastdepCC_FALSE@	$(AM_V_CC@am__nodep@)$(CC) $(DEFS) $(DEFAULT_INCLUDES) $(INCLUDES) $(testsuite_libsframe_find_findfunc_1_CPPFLAGS) $(CPPFLAGS) $(AM_CFLAGS) $(CFLAGS) -c -o testsuite/libsframe.find/findfunc_1-findfunc-1.obj `if test -f 'testsuite/libsframe.find/findfunc-1.c'; then $(CYGPATH_W) 'testsuite/libsframe.find/findfunc-1.c'; else $(CYGPATH_W) '$(srcdir)/testsuite/libsframe.find/findfunc-1.c'; fi`
- 
--testsuite/libsframe.find/testsuite_libsframe_find_plt_findfre_1-plt-findfre-1.o: testsuite/libsframe.find/plt-findfre-1.c
--@am__fastdepCC_TRUE@	$(AM_V_CC)$(CC) $(DEFS) $(DEFAULT_INCLUDES) $(INCLUDES) $(testsuite_libsframe_find_plt_findfre_1_CPPFLAGS) $(CPPFLAGS) $(AM_CFLAGS) $(CFLAGS) -MT testsuite/libsframe.find/testsuite_libsframe_find_plt_findfre_1-plt-findfre-1.o -MD -MP -MF testsuite/libsframe.find/$(DEPDIR)/testsuite_libsframe_find_plt_findfre_1-plt-findfre-1.Tpo -c -o testsuite/libsframe.find/testsuite_libsframe_find_plt_findfre_1-plt-findfre-1.o `test -f 'testsuite/libsframe.find/plt-findfre-1.c' || echo '$(srcdir)/'`testsuite/libsframe.find/plt-findfre-1.c
--@am__fastdepCC_TRUE@	$(AM_V_at)$(am__mv) testsuite/libsframe.find/$(DEPDIR)/testsuite_libsframe_find_plt_findfre_1-plt-findfre-1.Tpo testsuite/libsframe.find/$(DEPDIR)/testsuite_libsframe_find_plt_findfre_1-plt-findfre-1.Po
--@AMDEP_TRUE@@am__fastdepCC_FALSE@	$(AM_V_CC)source='testsuite/libsframe.find/plt-findfre-1.c' object='testsuite/libsframe.find/testsuite_libsframe_find_plt_findfre_1-plt-findfre-1.o' libtool=no @AMDEPBACKSLASH@
-+testsuite/libsframe.find/plt_findfre_1-plt-findfre-1.o: testsuite/libsframe.find/plt-findfre-1.c
-+@am__fastdepCC_TRUE@	$(AM_V_CC)$(CC) $(DEFS) $(DEFAULT_INCLUDES) $(INCLUDES) $(testsuite_libsframe_find_plt_findfre_1_CPPFLAGS) $(CPPFLAGS) $(AM_CFLAGS) $(CFLAGS) -MT testsuite/libsframe.find/plt_findfre_1-plt-findfre-1.o -MD -MP -MF testsuite/libsframe.find/$(DEPDIR)/plt_findfre_1-plt-findfre-1.Tpo -c -o testsuite/libsframe.find/plt_findfre_1-plt-findfre-1.o `test -f 'testsuite/libsframe.find/plt-findfre-1.c' || echo '$(srcdir)/'`testsuite/libsframe.find/plt-findfre-1.c
-+@am__fastdepCC_TRUE@	$(AM_V_at)$(am__mv) testsuite/libsframe.find/$(DEPDIR)/plt_findfre_1-plt-findfre-1.Tpo testsuite/libsframe.find/$(DEPDIR)/plt_findfre_1-plt-findfre-1.Po
-+@AMDEP_TRUE@@am__fastdepCC_FALSE@	$(AM_V_CC)source='testsuite/libsframe.find/plt-findfre-1.c' object='testsuite/libsframe.find/plt_findfre_1-plt-findfre-1.o' libtool=no @AMDEPBACKSLASH@
- @AMDEP_TRUE@@am__fastdepCC_FALSE@	DEPDIR=$(DEPDIR) $(CCDEPMODE) $(depcomp) @AMDEPBACKSLASH@
--@am__fastdepCC_FALSE@	$(AM_V_CC@am__nodep@)$(CC) $(DEFS) $(DEFAULT_INCLUDES) $(INCLUDES) $(testsuite_libsframe_find_plt_findfre_1_CPPFLAGS) $(CPPFLAGS) $(AM_CFLAGS) $(CFLAGS) -c -o testsuite/libsframe.find/testsuite_libsframe_find_plt_findfre_1-plt-findfre-1.o `test -f 'testsuite/libsframe.find/plt-findfre-1.c' || echo '$(srcdir)/'`testsuite/libsframe.find/plt-findfre-1.c
-+@am__fastdepCC_FALSE@	$(AM_V_CC@am__nodep@)$(CC) $(DEFS) $(DEFAULT_INCLUDES) $(INCLUDES) $(testsuite_libsframe_find_plt_findfre_1_CPPFLAGS) $(CPPFLAGS) $(AM_CFLAGS) $(CFLAGS) -c -o testsuite/libsframe.find/plt_findfre_1-plt-findfre-1.o `test -f 'testsuite/libsframe.find/plt-findfre-1.c' || echo '$(srcdir)/'`testsuite/libsframe.find/plt-findfre-1.c
- 
--testsuite/libsframe.find/testsuite_libsframe_find_plt_findfre_1-plt-findfre-1.obj: testsuite/libsframe.find/plt-findfre-1.c
--@am__fastdepCC_TRUE@	$(AM_V_CC)$(CC) $(DEFS) $(DEFAULT_INCLUDES) $(INCLUDES) $(testsuite_libsframe_find_plt_findfre_1_CPPFLAGS) $(CPPFLAGS) $(AM_CFLAGS) $(CFLAGS) -MT testsuite/libsframe.find/testsuite_libsframe_find_plt_findfre_1-plt-findfre-1.obj -MD -MP -MF testsuite/libsframe.find/$(DEPDIR)/testsuite_libsframe_find_plt_findfre_1-plt-findfre-1.Tpo -c -o testsuite/libsframe.find/testsuite_libsframe_find_plt_findfre_1-plt-findfre-1.obj `if test -f 'testsuite/libsframe.find/plt-findfre-1.c'; then $(CYGPATH_W) 'testsuite/libsframe.find/plt-findfre-1.c'; else $(CYGPATH_W) '$(srcdir)/testsuite/libsframe.find/plt-findfre-1.c'; fi`
--@am__fastdepCC_TRUE@	$(AM_V_at)$(am__mv) testsuite/libsframe.find/$(DEPDIR)/testsuite_libsframe_find_plt_findfre_1-plt-findfre-1.Tpo testsuite/libsframe.find/$(DEPDIR)/testsuite_libsframe_find_plt_findfre_1-plt-findfre-1.Po
--@AMDEP_TRUE@@am__fastdepCC_FALSE@	$(AM_V_CC)source='testsuite/libsframe.find/plt-findfre-1.c' object='testsuite/libsframe.find/testsuite_libsframe_find_plt_findfre_1-plt-findfre-1.obj' libtool=no @AMDEPBACKSLASH@
-+testsuite/libsframe.find/plt_findfre_1-plt-findfre-1.obj: testsuite/libsframe.find/plt-findfre-1.c
-+@am__fastdepCC_TRUE@	$(AM_V_CC)$(CC) $(DEFS) $(DEFAULT_INCLUDES) $(INCLUDES) $(testsuite_libsframe_find_plt_findfre_1_CPPFLAGS) $(CPPFLAGS) $(AM_CFLAGS) $(CFLAGS) -MT testsuite/libsframe.find/plt_findfre_1-plt-findfre-1.obj -MD -MP -MF testsuite/libsframe.find/$(DEPDIR)/plt_findfre_1-plt-findfre-1.Tpo -c -o testsuite/libsframe.find/plt_findfre_1-plt-findfre-1.obj `if test -f 'testsuite/libsframe.find/plt-findfre-1.c'; then $(CYGPATH_W) 'testsuite/libsframe.find/plt-findfre-1.c'; else $(CYGPATH_W) '$(srcdir)/testsuite/libsframe.find/plt-findfre-1.c'; fi`
-+@am__fastdepCC_TRUE@	$(AM_V_at)$(am__mv) testsuite/libsframe.find/$(DEPDIR)/plt_findfre_1-plt-findfre-1.Tpo testsuite/libsframe.find/$(DEPDIR)/plt_findfre_1-plt-findfre-1.Po
-+@AMDEP_TRUE@@am__fastdepCC_FALSE@	$(AM_V_CC)source='testsuite/libsframe.find/plt-findfre-1.c' object='testsuite/libsframe.find/plt_findfre_1-plt-findfre-1.obj' libtool=no @AMDEPBACKSLASH@
- @AMDEP_TRUE@@am__fastdepCC_FALSE@	DEPDIR=$(DEPDIR) $(CCDEPMODE) $(depcomp) @AMDEPBACKSLASH@
--@am__fastdepCC_FALSE@	$(AM_V_CC@am__nodep@)$(CC) $(DEFS) $(DEFAULT_INCLUDES) $(INCLUDES) $(testsuite_libsframe_find_plt_findfre_1_CPPFLAGS) $(CPPFLAGS) $(AM_CFLAGS) $(CFLAGS) -c -o testsuite/libsframe.find/testsuite_libsframe_find_plt_findfre_1-plt-findfre-1.obj `if test -f 'testsuite/libsframe.find/plt-findfre-1.c'; then $(CYGPATH_W) 'testsuite/libsframe.find/plt-findfre-1.c'; else $(CYGPATH_W) '$(srcdir)/testsuite/libsframe.find/plt-findfre-1.c'; fi`
-+@am__fastdepCC_FALSE@	$(AM_V_CC@am__nodep@)$(CC) $(DEFS) $(DEFAULT_INCLUDES) $(INCLUDES) $(testsuite_libsframe_find_plt_findfre_1_CPPFLAGS) $(CPPFLAGS) $(AM_CFLAGS) $(CFLAGS) -c -o testsuite/libsframe.find/plt_findfre_1-plt-findfre-1.obj `if test -f 'testsuite/libsframe.find/plt-findfre-1.c'; then $(CYGPATH_W) 'testsuite/libsframe.find/plt-findfre-1.c'; else $(CYGPATH_W) '$(srcdir)/testsuite/libsframe.find/plt-findfre-1.c'; fi`
- 
- mostlyclean-libtool:
- 	-rm -f *.lo
-@@ -1148,7 +1174,7 @@ site.exp: Makefile $(EXTRA_DEJAGNU_SITE_CONFIG)
- 	@echo '# Do not edit here.  If you wish to override these values' >>site.tmp
- 	@echo '# edit the last section' >>site.tmp
- 	@echo 'set srcdir "$(srcdir)"' >>site.tmp
--	@echo "set objdir `pwd`" >>site.tmp
-+	@echo "set objdir \"`pwd`\"" >>site.tmp
- 	@echo 'set build_alias "$(build_alias)"' >>site.tmp
- 	@echo 'set build_triplet $(build_triplet)' >>site.tmp
- 	@echo 'set host_alias "$(host_alias)"' >>site.tmp
-@@ -1174,8 +1200,10 @@ distclean-DEJAGNU:
- 	-l='$(DEJATOOL)'; for tool in $$l; do \
- 	  rm -f $$tool.sum $$tool.log; \
- 	done
-+distdir: $(BUILT_SOURCES)
-+	$(MAKE) $(AM_MAKEFLAGS) distdir-am
- 
--distdir: $(DISTFILES)
-+distdir-am: $(DISTFILES)
- 	$(am__remove_distdir)
- 	test -d "$(distdir)" || mkdir "$(distdir)"
- 	@srcdirstrip=`echo "$(srcdir)" | sed 's/[].[^$$\\*]/\\\\&/g'`; \
-@@ -1233,6 +1261,10 @@ dist-xz: distdir
- 	tardir=$(distdir) && $(am__tar) | XZ_OPT=$${XZ_OPT--e} xz -c >$(distdir).tar.xz
- 	$(am__post_remove_distdir)
- 
-+dist-zstd: distdir
-+	tardir=$(distdir) && $(am__tar) | zstd -c $${ZSTD_CLEVEL-$${ZSTD_OPT--19}} >$(distdir).tar.zst
-+	$(am__post_remove_distdir)
-+
- dist-tarZ: distdir
- 	@echo WARNING: "Support for distribution archives compressed with" \
- 		       "legacy program 'compress' is deprecated." >&2
-@@ -1275,6 +1307,8 @@ distcheck: dist
- 	  eval GZIP= gzip $(GZIP_ENV) -dc $(distdir).shar.gz | unshar ;;\
- 	*.zip*) \
- 	  unzip $(distdir).zip ;;\
-+	*.tar.zst*) \
-+	  zstd -dc $(distdir).tar.zst | $(am__untar) ;;\
- 	esac
- 	chmod -R a-w $(distdir)
- 	chmod u+w $(distdir)
-@@ -1290,7 +1324,7 @@ distcheck: dist
- 	    $(DISTCHECK_CONFIGURE_FLAGS) \
- 	    --srcdir=../.. --prefix="$$dc_install_base" \
- 	  && $(MAKE) $(AM_MAKEFLAGS) \
--	  && $(MAKE) $(AM_MAKEFLAGS) dvi \
-+	  && $(MAKE) $(AM_MAKEFLAGS) $(AM_DISTCHECK_DVI_TARGET) \
- 	  && $(MAKE) $(AM_MAKEFLAGS) check \
- 	  && $(MAKE) $(AM_MAKEFLAGS) install \
- 	  && $(MAKE) $(AM_MAKEFLAGS) installcheck \
-@@ -1346,6 +1380,8 @@ check-am: all-am
- 	$(MAKE) $(AM_MAKEFLAGS) check-DEJAGNU
- check: check-am
- all-am: Makefile $(INFO_DEPS) $(LTLIBRARIES) $(HEADERS) config.h
-+install-checkPROGRAMS: install-libLTLIBRARIES
-+
- installdirs:
- 	for dir in "$(DESTDIR)$(libdir)" "$(DESTDIR)$(infodir)" "$(DESTDIR)$(includedir)"; do \
- 	  test -z "$$dir" || $(MKDIR_P) "$$dir"; \
-@@ -1398,7 +1434,16 @@ clean-am: clean-aminfo clean-checkPROGRAMS clean-generic \
- 
- distclean: distclean-am
- 	-rm -f $(am__CONFIG_DISTCLEAN_FILES)
--	-rm -rf ./$(DEPDIR) testsuite/libsframe.decode/$(DEPDIR) testsuite/libsframe.encode/$(DEPDIR) testsuite/libsframe.find/$(DEPDIR)
-+		-rm -f ./$(DEPDIR)/libsframe_la-sframe-dump.Plo
-+	-rm -f ./$(DEPDIR)/libsframe_la-sframe-error.Plo
-+	-rm -f ./$(DEPDIR)/libsframe_la-sframe.Plo
-+	-rm -f testsuite/libsframe.decode/$(DEPDIR)/be_flipping-be-flipping.Po
-+	-rm -f testsuite/libsframe.decode/$(DEPDIR)/frecnt_1-frecnt-1.Po
-+	-rm -f testsuite/libsframe.decode/$(DEPDIR)/frecnt_2-frecnt-2.Po
-+	-rm -f testsuite/libsframe.encode/$(DEPDIR)/encode_1-encode-1.Po
-+	-rm -f testsuite/libsframe.find/$(DEPDIR)/findfre_1-findfre-1.Po
-+	-rm -f testsuite/libsframe.find/$(DEPDIR)/findfunc_1-findfunc-1.Po
-+	-rm -f testsuite/libsframe.find/$(DEPDIR)/plt_findfre_1-plt-findfre-1.Po
- 	-rm -f Makefile
- distclean-am: clean-am distclean-DEJAGNU distclean-compile \
- 	distclean-generic distclean-hdr distclean-libtool \
-@@ -1538,7 +1583,16 @@ installcheck-am:
- maintainer-clean: maintainer-clean-am
- 	-rm -f $(am__CONFIG_DISTCLEAN_FILES)
- 	-rm -rf $(top_srcdir)/autom4te.cache
--	-rm -rf ./$(DEPDIR) testsuite/libsframe.decode/$(DEPDIR) testsuite/libsframe.encode/$(DEPDIR) testsuite/libsframe.find/$(DEPDIR)
-+		-rm -f ./$(DEPDIR)/libsframe_la-sframe-dump.Plo
-+	-rm -f ./$(DEPDIR)/libsframe_la-sframe-error.Plo
-+	-rm -f ./$(DEPDIR)/libsframe_la-sframe.Plo
-+	-rm -f testsuite/libsframe.decode/$(DEPDIR)/be_flipping-be-flipping.Po
-+	-rm -f testsuite/libsframe.decode/$(DEPDIR)/frecnt_1-frecnt-1.Po
-+	-rm -f testsuite/libsframe.decode/$(DEPDIR)/frecnt_2-frecnt-2.Po
-+	-rm -f testsuite/libsframe.encode/$(DEPDIR)/encode_1-encode-1.Po
-+	-rm -f testsuite/libsframe.find/$(DEPDIR)/findfre_1-findfre-1.Po
-+	-rm -f testsuite/libsframe.find/$(DEPDIR)/findfunc_1-findfunc-1.Po
-+	-rm -f testsuite/libsframe.find/$(DEPDIR)/plt_findfre_1-plt-findfre-1.Po
- 	-rm -f Makefile
- maintainer-clean-am: distclean-am maintainer-clean-aminfo \
- 	maintainer-clean-generic
-@@ -1562,28 +1616,28 @@ uninstall-am: uninstall-dvi-am uninstall-html-am \
- 
- .MAKE: all check-am install-am install-strip
- 
--.PHONY: CTAGS GTAGS TAGS all all-am am--refresh check check-DEJAGNU \
--	check-am clean clean-aminfo clean-checkPROGRAMS clean-cscope \
--	clean-generic clean-libLTLIBRARIES clean-libtool \
-+.PHONY: CTAGS GTAGS TAGS all all-am am--depfiles am--refresh check \
-+	check-DEJAGNU check-am clean clean-aminfo clean-checkPROGRAMS \
-+	clean-cscope clean-generic clean-libLTLIBRARIES clean-libtool \
- 	clean-noinstLTLIBRARIES cscope cscopelist-am ctags ctags-am \
- 	dist dist-all dist-bzip2 dist-gzip dist-info dist-lzip \
--	dist-shar dist-tarZ dist-xz dist-zip distcheck distclean \
--	distclean-DEJAGNU distclean-compile distclean-generic \
--	distclean-hdr distclean-libtool distclean-tags distcleancheck \
--	distdir distuninstallcheck dvi dvi-am html html-am html-local \
--	info info-am install install-am install-data install-data-am \
--	install-dvi install-dvi-am install-exec install-exec-am \
--	install-html install-html-am install-includeHEADERS \
--	install-info install-info-am install-libLTLIBRARIES \
--	install-man install-pdf install-pdf-am install-ps \
--	install-ps-am install-strip installcheck installcheck-am \
--	installdirs maintainer-clean maintainer-clean-aminfo \
--	maintainer-clean-generic mostlyclean mostlyclean-aminfo \
--	mostlyclean-compile mostlyclean-generic mostlyclean-libtool \
--	pdf pdf-am ps ps-am tags tags-am uninstall uninstall-am \
--	uninstall-dvi-am uninstall-html-am uninstall-includeHEADERS \
--	uninstall-info-am uninstall-libLTLIBRARIES uninstall-pdf-am \
--	uninstall-ps-am
-+	dist-shar dist-tarZ dist-xz dist-zip dist-zstd distcheck \
-+	distclean distclean-DEJAGNU distclean-compile \
-+	distclean-generic distclean-hdr distclean-libtool \
-+	distclean-tags distcleancheck distdir distuninstallcheck dvi \
-+	dvi-am html html-am html-local info info-am install install-am \
-+	install-data install-data-am install-dvi install-dvi-am \
-+	install-exec install-exec-am install-html install-html-am \
-+	install-includeHEADERS install-info install-info-am \
-+	install-libLTLIBRARIES install-man install-pdf install-pdf-am \
-+	install-ps install-ps-am install-strip installcheck \
-+	installcheck-am installdirs maintainer-clean \
-+	maintainer-clean-aminfo maintainer-clean-generic mostlyclean \
-+	mostlyclean-aminfo mostlyclean-compile mostlyclean-generic \
-+	mostlyclean-libtool pdf pdf-am ps ps-am tags tags-am uninstall \
-+	uninstall-am uninstall-dvi-am uninstall-html-am \
-+	uninstall-includeHEADERS uninstall-info-am \
-+	uninstall-libLTLIBRARIES uninstall-pdf-am uninstall-ps-am
- 
- .PRECIOUS: Makefile
- 
-diff --git a/libsframe/aclocal.m4 b/libsframe/aclocal.m4
-index 8804d9fb42b..f4974423bd6 100644
---- a/libsframe/aclocal.m4
-+++ b/libsframe/aclocal.m4
-@@ -1,6 +1,6 @@
--# generated automatically by aclocal 1.15.1 -*- Autoconf -*-
-+# generated automatically by aclocal 1.16.5 -*- Autoconf -*-
- 
--# Copyright (C) 1996-2017 Free Software Foundation, Inc.
-+# Copyright (C) 1996-2021 Free Software Foundation, Inc.
- 
- # This file is free software; the Free Software Foundation
- # gives unlimited permission to copy and/or distribute it,
-@@ -20,7 +20,7 @@ You have another version of autoconf.  It may work, but is not guaranteed to.
- If you have problems, you may need to regenerate the build system entirely.
- To do so, use the procedure documented by the package, typically 'autoreconf'.])])
- 
--# Copyright (C) 2002-2017 Free Software Foundation, Inc.
-+# Copyright (C) 2002-2021 Free Software Foundation, Inc.
- #
- # This file is free software; the Free Software Foundation
- # gives unlimited permission to copy and/or distribute it,
-@@ -32,10 +32,10 @@ To do so, use the procedure documented by the package, typically 'autoreconf'.])
- # generated from the m4 files accompanying Automake X.Y.
- # (This private macro should not be called outside this file.)
- AC_DEFUN([AM_AUTOMAKE_VERSION],
--[am__api_version='1.15'
-+[am__api_version='1.16'
- dnl Some users find AM_AUTOMAKE_VERSION and mistake it for a way to
- dnl require some minimum version.  Point them to the right macro.
--m4_if([$1], [1.15.1], [],
-+m4_if([$1], [1.16.5], [],
-       [AC_FATAL([Do not call $0, use AM_INIT_AUTOMAKE([$1]).])])dnl
- ])
- 
-@@ -51,12 +51,12 @@ m4_define([_AM_AUTOCONF_VERSION], [])
- # Call AM_AUTOMAKE_VERSION and AM_AUTOMAKE_VERSION so they can be traced.
- # This function is AC_REQUIREd by AM_INIT_AUTOMAKE.
- AC_DEFUN([AM_SET_CURRENT_AUTOMAKE_VERSION],
--[AM_AUTOMAKE_VERSION([1.15.1])dnl
-+[AM_AUTOMAKE_VERSION([1.16.5])dnl
- m4_ifndef([AC_AUTOCONF_VERSION],
-   [m4_copy([m4_PACKAGE_VERSION], [AC_AUTOCONF_VERSION])])dnl
- _AM_AUTOCONF_VERSION(m4_defn([AC_AUTOCONF_VERSION]))])
- 
--# Copyright (C) 2011-2017 Free Software Foundation, Inc.
-+# Copyright (C) 2011-2021 Free Software Foundation, Inc.
- #
- # This file is free software; the Free Software Foundation
- # gives unlimited permission to copy and/or distribute it,
-@@ -118,7 +118,7 @@ AC_SUBST([AR])dnl
- 
- # AM_AUX_DIR_EXPAND                                         -*- Autoconf -*-
- 
--# Copyright (C) 2001-2017 Free Software Foundation, Inc.
-+# Copyright (C) 2001-2021 Free Software Foundation, Inc.
- #
- # This file is free software; the Free Software Foundation
- # gives unlimited permission to copy and/or distribute it,
-@@ -170,7 +170,7 @@ am_aux_dir=`cd "$ac_aux_dir" && pwd`
- 
- # AM_CONDITIONAL                                            -*- Autoconf -*-
- 
--# Copyright (C) 1997-2017 Free Software Foundation, Inc.
-+# Copyright (C) 1997-2021 Free Software Foundation, Inc.
- #
- # This file is free software; the Free Software Foundation
- # gives unlimited permission to copy and/or distribute it,
-@@ -201,7 +201,7 @@ AC_CONFIG_COMMANDS_PRE(
- Usually this means the macro was only invoked conditionally.]])
- fi])])
- 
--# Copyright (C) 1999-2017 Free Software Foundation, Inc.
-+# Copyright (C) 1999-2021 Free Software Foundation, Inc.
- #
- # This file is free software; the Free Software Foundation
- # gives unlimited permission to copy and/or distribute it,
-@@ -392,13 +392,12 @@ _AM_SUBST_NOTMAKE([am__nodep])dnl
- 
- # Generate code to set up dependency tracking.              -*- Autoconf -*-
- 
--# Copyright (C) 1999-2017 Free Software Foundation, Inc.
-+# Copyright (C) 1999-2021 Free Software Foundation, Inc.
- #
- # This file is free software; the Free Software Foundation
- # gives unlimited permission to copy and/or distribute it,
- # with or without modifications, as long as this notice is preserved.
- 
--
- # _AM_OUTPUT_DEPENDENCY_COMMANDS
- # ------------------------------
- AC_DEFUN([_AM_OUTPUT_DEPENDENCY_COMMANDS],
-@@ -406,49 +405,43 @@ AC_DEFUN([_AM_OUTPUT_DEPENDENCY_COMMANDS],
-   # Older Autoconf quotes --file arguments for eval, but not when files
-   # are listed without --file.  Let's play safe and only enable the eval
-   # if we detect the quoting.
--  case $CONFIG_FILES in
--  *\'*) eval set x "$CONFIG_FILES" ;;
--  *)   set x $CONFIG_FILES ;;
--  esac
-+  # TODO: see whether this extra hack can be removed once we start
-+  # requiring Autoconf 2.70 or later.
-+  AS_CASE([$CONFIG_FILES],
-+          [*\'*], [eval set x "$CONFIG_FILES"],
-+          [*], [set x $CONFIG_FILES])
-   shift
--  for mf
-+  # Used to flag and report bootstrapping failures.
-+  am_rc=0
-+  for am_mf
-   do
-     # Strip MF so we end up with the name of the file.
--    mf=`echo "$mf" | sed -e 's/:.*$//'`
--    # Check whether this is an Automake generated Makefile or not.
--    # We used to match only the files named 'Makefile.in', but
--    # some people rename them; so instead we look at the file content.
--    # Grep'ing the first line is not enough: some people post-process
--    # each Makefile.in and add a new line on top of each file to say so.
--    # Grep'ing the whole file is not good either: AIX grep has a line
-+    am_mf=`AS_ECHO(["$am_mf"]) | sed -e 's/:.*$//'`
-+    # Check whether this is an Automake generated Makefile which includes
-+    # dependency-tracking related rules and includes.
-+    # Grep'ing the whole file directly is not great: AIX grep has a line
-     # limit of 2048, but all sed's we know have understand at least 4000.
--    if sed -n 's,^#.*generated by automake.*,X,p' "$mf" | grep X >/dev/null 2>&1; then
--      dirpart=`AS_DIRNAME("$mf")`
--    else
--      continue
--    fi
--    # Extract the definition of DEPDIR, am__include, and am__quote
--    # from the Makefile without running 'make'.
--    DEPDIR=`sed -n 's/^DEPDIR = //p' < "$mf"`
--    test -z "$DEPDIR" && continue
--    am__include=`sed -n 's/^am__include = //p' < "$mf"`
--    test -z "$am__include" && continue
--    am__quote=`sed -n 's/^am__quote = //p' < "$mf"`
--    # Find all dependency output files, they are included files with
--    # $(DEPDIR) in their names.  We invoke sed twice because it is the
--    # simplest approach to changing $(DEPDIR) to its actual value in the
--    # expansion.
--    for file in `sed -n "
--      s/^$am__include $am__quote\(.*(DEPDIR).*\)$am__quote"'$/\1/p' <"$mf" | \
--	 sed -e 's/\$(DEPDIR)/'"$DEPDIR"'/g'`; do
--      # Make sure the directory exists.
--      test -f "$dirpart/$file" && continue
--      fdir=`AS_DIRNAME(["$file"])`
--      AS_MKDIR_P([$dirpart/$fdir])
--      # echo "creating $dirpart/$file"
--      echo '# dummy' > "$dirpart/$file"
--    done
-+    sed -n 's,^am--depfiles:.*,X,p' "$am_mf" | grep X >/dev/null 2>&1 \
-+      || continue
-+    am_dirpart=`AS_DIRNAME(["$am_mf"])`
-+    am_filepart=`AS_BASENAME(["$am_mf"])`
-+    AM_RUN_LOG([cd "$am_dirpart" \
-+      && sed -e '/# am--include-marker/d' "$am_filepart" \
-+        | $MAKE -f - am--depfiles]) || am_rc=$?
-   done
-+  if test $am_rc -ne 0; then
-+    AC_MSG_FAILURE([Something went wrong bootstrapping makefile fragments
-+    for automatic dependency tracking.  If GNU make was not used, consider
-+    re-running the configure script with MAKE="gmake" (or whatever is
-+    necessary).  You can also try re-running configure with the
-+    '--disable-dependency-tracking' option to at least be able to build
-+    the package (albeit without support for automatic dependency tracking).])
-+  fi
-+  AS_UNSET([am_dirpart])
-+  AS_UNSET([am_filepart])
-+  AS_UNSET([am_mf])
-+  AS_UNSET([am_rc])
-+  rm -f conftest-deps.mk
- }
- ])# _AM_OUTPUT_DEPENDENCY_COMMANDS
- 
-@@ -457,18 +450,17 @@ AC_DEFUN([_AM_OUTPUT_DEPENDENCY_COMMANDS],
- # -----------------------------
- # This macro should only be invoked once -- use via AC_REQUIRE.
- #
--# This code is only required when automatic dependency tracking
--# is enabled.  FIXME.  This creates each '.P' file that we will
--# need in order to bootstrap the dependency handling code.
-+# This code is only required when automatic dependency tracking is enabled.
-+# This creates each '.Po' and '.Plo' makefile fragment that we'll need in
-+# order to bootstrap the dependency handling code.
- AC_DEFUN([AM_OUTPUT_DEPENDENCY_COMMANDS],
- [AC_CONFIG_COMMANDS([depfiles],
-      [test x"$AMDEP_TRUE" != x"" || _AM_OUTPUT_DEPENDENCY_COMMANDS],
--     [AMDEP_TRUE="$AMDEP_TRUE" ac_aux_dir="$ac_aux_dir"])
--])
-+     [AMDEP_TRUE="$AMDEP_TRUE" MAKE="${MAKE-make}"])])
- 
- # Do all the work for Automake.                             -*- Autoconf -*-
- 
--# Copyright (C) 1996-2017 Free Software Foundation, Inc.
-+# Copyright (C) 1996-2021 Free Software Foundation, Inc.
- #
- # This file is free software; the Free Software Foundation
- # gives unlimited permission to copy and/or distribute it,
-@@ -496,6 +488,10 @@ m4_defn([AC_PROG_CC])
- # release and drop the old call support.
- AC_DEFUN([AM_INIT_AUTOMAKE],
- [AC_PREREQ([2.65])dnl
-+m4_ifdef([_$0_ALREADY_INIT],
-+  [m4_fatal([$0 expanded multiple times
-+]m4_defn([_$0_ALREADY_INIT]))],
-+  [m4_define([_$0_ALREADY_INIT], m4_expansion_stack)])dnl
- dnl Autoconf wants to disallow AM_ names.  We explicitly allow
- dnl the ones we care about.
- m4_pattern_allow([^AM_[A-Z]+FLAGS$])dnl
-@@ -532,7 +528,7 @@ m4_ifval([$3], [_AM_SET_OPTION([no-define])])dnl
- [_AM_SET_OPTIONS([$1])dnl
- dnl Diagnose old-style AC_INIT with new-style AM_AUTOMAKE_INIT.
- m4_if(
--  m4_ifdef([AC_PACKAGE_NAME], [ok]):m4_ifdef([AC_PACKAGE_VERSION], [ok]),
-+  m4_ifset([AC_PACKAGE_NAME], [ok]):m4_ifset([AC_PACKAGE_VERSION], [ok]),
-   [ok:ok],,
-   [m4_fatal([AC_INIT should be called with package and version arguments])])dnl
-  AC_SUBST([PACKAGE], ['AC_PACKAGE_TARNAME'])dnl
-@@ -555,8 +551,8 @@ AC_REQUIRE([AM_PROG_INSTALL_STRIP])dnl
- AC_REQUIRE([AC_PROG_MKDIR_P])dnl
- # For better backward compatibility.  To be removed once Automake 1.9.x
- # dies out for good.  For more background, see:
--# <http://lists.gnu.org/archive/html/automake/2012-07/msg00001.html>
--# <http://lists.gnu.org/archive/html/automake/2012-07/msg00014.html>
-+# <https://lists.gnu.org/archive/html/automake/2012-07/msg00001.html>
-+# <https://lists.gnu.org/archive/html/automake/2012-07/msg00014.html>
- AC_SUBST([mkdir_p], ['$(MKDIR_P)'])
- # We need awk for the "check" target (and possibly the TAP driver).  The
- # system "awk" is bad on some platforms.
-@@ -584,6 +580,20 @@ AC_PROVIDE_IFELSE([AC_PROG_OBJCXX],
- 		  [m4_define([AC_PROG_OBJCXX],
- 			     m4_defn([AC_PROG_OBJCXX])[_AM_DEPENDENCIES([OBJCXX])])])dnl
- ])
-+# Variables for tags utilities; see am/tags.am
-+if test -z "$CTAGS"; then
-+  CTAGS=ctags
-+fi
-+AC_SUBST([CTAGS])
-+if test -z "$ETAGS"; then
-+  ETAGS=etags
-+fi
-+AC_SUBST([ETAGS])
-+if test -z "$CSCOPE"; then
-+  CSCOPE=cscope
-+fi
-+AC_SUBST([CSCOPE])
-+
- AC_REQUIRE([AM_SILENT_RULES])dnl
- dnl The testsuite driver may need to know about EXEEXT, so add the
- dnl 'am__EXEEXT' conditional if _AM_COMPILER_EXEEXT was seen.  This
-@@ -623,7 +633,7 @@ END
- Aborting the configuration process, to ensure you take notice of the issue.
- 
- You can download and install GNU coreutils to get an 'rm' implementation
--that behaves properly: <http://www.gnu.org/software/coreutils/>.
-+that behaves properly: <https://www.gnu.org/software/coreutils/>.
- 
- If you want to complete the configuration process using your problematic
- 'rm' anyway, export the environment variable ACCEPT_INFERIOR_RM_PROGRAM
-@@ -665,7 +675,7 @@ for _am_header in $config_headers :; do
- done
- echo "timestamp for $_am_arg" >`AS_DIRNAME(["$_am_arg"])`/stamp-h[]$_am_stamp_count])
- 
--# Copyright (C) 2001-2017 Free Software Foundation, Inc.
-+# Copyright (C) 2001-2021 Free Software Foundation, Inc.
- #
- # This file is free software; the Free Software Foundation
- # gives unlimited permission to copy and/or distribute it,
-@@ -689,7 +699,7 @@ AC_SUBST([install_sh])])
- # Add --enable-maintainer-mode option to configure.         -*- Autoconf -*-
- # From Jim Meyering
- 
--# Copyright (C) 1996-2017 Free Software Foundation, Inc.
-+# Copyright (C) 1996-2021 Free Software Foundation, Inc.
- #
- # This file is free software; the Free Software Foundation
- # gives unlimited permission to copy and/or distribute it,
-@@ -724,7 +734,7 @@ AC_MSG_CHECKING([whether to enable maintainer-specific portions of Makefiles])
- 
- # Check to see how 'make' treats includes.	            -*- Autoconf -*-
- 
--# Copyright (C) 2001-2017 Free Software Foundation, Inc.
-+# Copyright (C) 2001-2021 Free Software Foundation, Inc.
- #
- # This file is free software; the Free Software Foundation
- # gives unlimited permission to copy and/or distribute it,
-@@ -732,49 +742,42 @@ AC_MSG_CHECKING([whether to enable maintainer-specific portions of Makefiles])
- 
- # AM_MAKE_INCLUDE()
- # -----------------
--# Check to see how make treats includes.
-+# Check whether make has an 'include' directive that can support all
-+# the idioms we need for our automatic dependency tracking code.
- AC_DEFUN([AM_MAKE_INCLUDE],
--[am_make=${MAKE-make}
--cat > confinc << 'END'
-+[AC_MSG_CHECKING([whether ${MAKE-make} supports the include directive])
-+cat > confinc.mk << 'END'
- am__doit:
--	@echo this is the am__doit target
-+	@echo this is the am__doit target >confinc.out
- .PHONY: am__doit
- END
--# If we don't find an include directive, just comment out the code.
--AC_MSG_CHECKING([for style of include used by $am_make])
- am__include="#"
- am__quote=
--_am_result=none
--# First try GNU make style include.
--echo "include confinc" > confmf
--# Ignore all kinds of additional output from 'make'.
--case `$am_make -s -f confmf 2> /dev/null` in #(
--*the\ am__doit\ target*)
--  am__include=include
--  am__quote=
--  _am_result=GNU
--  ;;
--esac
--# Now try BSD make style include.
--if test "$am__include" = "#"; then
--   echo '.include "confinc"' > confmf
--   case `$am_make -s -f confmf 2> /dev/null` in #(
--   *the\ am__doit\ target*)
--     am__include=.include
--     am__quote="\""
--     _am_result=BSD
--     ;;
--   esac
--fi
--AC_SUBST([am__include])
--AC_SUBST([am__quote])
--AC_MSG_RESULT([$_am_result])
--rm -f confinc confmf
--])
-+# BSD make does it like this.
-+echo '.include "confinc.mk" # ignored' > confmf.BSD
-+# Other make implementations (GNU, Solaris 10, AIX) do it like this.
-+echo 'include confinc.mk # ignored' > confmf.GNU
-+_am_result=no
-+for s in GNU BSD; do
-+  AM_RUN_LOG([${MAKE-make} -f confmf.$s && cat confinc.out])
-+  AS_CASE([$?:`cat confinc.out 2>/dev/null`],
-+      ['0:this is the am__doit target'],
-+      [AS_CASE([$s],
-+          [BSD], [am__include='.include' am__quote='"'],
-+          [am__include='include' am__quote=''])])
-+  if test "$am__include" != "#"; then
-+    _am_result="yes ($s style)"
-+    break
-+  fi
-+done
-+rm -f confinc.* confmf.*
-+AC_MSG_RESULT([${_am_result}])
-+AC_SUBST([am__include])])
-+AC_SUBST([am__quote])])
- 
- # Fake the existence of programs that GNU maintainers use.  -*- Autoconf -*-
- 
--# Copyright (C) 1997-2017 Free Software Foundation, Inc.
-+# Copyright (C) 1997-2021 Free Software Foundation, Inc.
- #
- # This file is free software; the Free Software Foundation
- # gives unlimited permission to copy and/or distribute it,
-@@ -795,12 +798,7 @@ AC_DEFUN([AM_MISSING_HAS_RUN],
- [AC_REQUIRE([AM_AUX_DIR_EXPAND])dnl
- AC_REQUIRE_AUX_FILE([missing])dnl
- if test x"${MISSING+set}" != xset; then
--  case $am_aux_dir in
--  *\ * | *\	*)
--    MISSING="\${SHELL} \"$am_aux_dir/missing\"" ;;
--  *)
--    MISSING="\${SHELL} $am_aux_dir/missing" ;;
--  esac
-+  MISSING="\${SHELL} '$am_aux_dir/missing'"
- fi
- # Use eval to expand $SHELL
- if eval "$MISSING --is-lightweight"; then
-@@ -813,7 +811,7 @@ fi
- 
- # Helper functions for option handling.                     -*- Autoconf -*-
- 
--# Copyright (C) 2001-2017 Free Software Foundation, Inc.
-+# Copyright (C) 2001-2021 Free Software Foundation, Inc.
- #
- # This file is free software; the Free Software Foundation
- # gives unlimited permission to copy and/or distribute it,
-@@ -842,7 +840,7 @@ AC_DEFUN([_AM_SET_OPTIONS],
- AC_DEFUN([_AM_IF_OPTION],
- [m4_ifset(_AM_MANGLE_OPTION([$1]), [$2], [$3])])
- 
--# Copyright (C) 1999-2017 Free Software Foundation, Inc.
-+# Copyright (C) 1999-2021 Free Software Foundation, Inc.
- #
- # This file is free software; the Free Software Foundation
- # gives unlimited permission to copy and/or distribute it,
-@@ -889,7 +887,7 @@ AC_LANG_POP([C])])
- # For backward compatibility.
- AC_DEFUN_ONCE([AM_PROG_CC_C_O], [AC_REQUIRE([AC_PROG_CC])])
- 
--# Copyright (C) 2001-2017 Free Software Foundation, Inc.
-+# Copyright (C) 2001-2021 Free Software Foundation, Inc.
- #
- # This file is free software; the Free Software Foundation
- # gives unlimited permission to copy and/or distribute it,
-@@ -908,7 +906,7 @@ AC_DEFUN([AM_RUN_LOG],
- 
- # Check to make sure that the build environment is sane.    -*- Autoconf -*-
- 
--# Copyright (C) 1996-2017 Free Software Foundation, Inc.
-+# Copyright (C) 1996-2021 Free Software Foundation, Inc.
- #
- # This file is free software; the Free Software Foundation
- # gives unlimited permission to copy and/or distribute it,
-@@ -989,7 +987,7 @@ AC_CONFIG_COMMANDS_PRE(
- rm -f conftest.file
- ])
- 
--# Copyright (C) 2009-2017 Free Software Foundation, Inc.
-+# Copyright (C) 2009-2021 Free Software Foundation, Inc.
- #
- # This file is free software; the Free Software Foundation
- # gives unlimited permission to copy and/or distribute it,
-@@ -1049,7 +1047,7 @@ AC_SUBST([AM_BACKSLASH])dnl
- _AM_SUBST_NOTMAKE([AM_BACKSLASH])dnl
- ])
- 
--# Copyright (C) 2001-2017 Free Software Foundation, Inc.
-+# Copyright (C) 2001-2021 Free Software Foundation, Inc.
- #
- # This file is free software; the Free Software Foundation
- # gives unlimited permission to copy and/or distribute it,
-@@ -1077,7 +1075,7 @@ fi
- INSTALL_STRIP_PROGRAM="\$(install_sh) -c -s"
- AC_SUBST([INSTALL_STRIP_PROGRAM])])
- 
--# Copyright (C) 2006-2017 Free Software Foundation, Inc.
-+# Copyright (C) 2006-2021 Free Software Foundation, Inc.
- #
- # This file is free software; the Free Software Foundation
- # gives unlimited permission to copy and/or distribute it,
-@@ -1096,7 +1094,7 @@ AC_DEFUN([AM_SUBST_NOTMAKE], [_AM_SUBST_NOTMAKE($@)])
- 
- # Check how to create a tarball.                            -*- Autoconf -*-
- 
--# Copyright (C) 2004-2017 Free Software Foundation, Inc.
-+# Copyright (C) 2004-2021 Free Software Foundation, Inc.
- #
- # This file is free software; the Free Software Foundation
- # gives unlimited permission to copy and/or distribute it,
 diff --git a/libsframe/configure b/libsframe/configure
-index 4727eff533a..ca3885ad105 100755
+index 4727eff533a..ff7a4ab5c7a 100755
 --- a/libsframe/configure
 +++ b/libsframe/configure
 @@ -658,6 +658,8 @@ OTOOL
@@ -21256,35 +20210,7 @@ index 4727eff533a..ca3885ad105 100755
  OBJDUMP
  LN_S
  NM
-@@ -674,6 +676,9 @@ AM_BACKSLASH
- AM_DEFAULT_VERBOSITY
- AM_DEFAULT_V
- AM_V
-+CSCOPE
-+ETAGS
-+CTAGS
- am__fastdepCC_FALSE
- am__fastdepCC_TRUE
- CCDEPMODE
-@@ -681,7 +686,6 @@ am__nodep
- AMDEPBACKSLASH
- AMDEP_FALSE
- AMDEP_TRUE
--am__quote
- am__include
- DEPDIR
- am__untar
-@@ -766,7 +770,8 @@ PACKAGE_VERSION
- PACKAGE_TARNAME
- PACKAGE_NAME
- PATH_SEPARATOR
--SHELL'
-+SHELL
-+am__quote'
- ac_subst_files=''
- ac_user_opts='
- enable_option_checking
-@@ -777,6 +782,7 @@ enable_static
+@@ -777,6 +779,7 @@ enable_static
  with_pic
  enable_fast_install
  with_gnu_ld
@@ -21292,7 +20218,7 @@ index 4727eff533a..ca3885ad105 100755
  enable_libtool_lock
  enable_largefile
  enable_maintainer_mode
-@@ -1433,6 +1439,8 @@ Optional Packages:
+@@ -1433,6 +1436,8 @@ Optional Packages:
    --with-pic              try to use only PIC/non-PIC objects [default=use
                            both]
    --with-gnu-ld           assume the C compiler uses GNU ld [default=no]
@@ -21301,150 +20227,7 @@ index 4727eff533a..ca3885ad105 100755
  
  Some influential environment variables:
    CC          C compiler command
-@@ -3727,7 +3735,7 @@ $as_echo "$ac_cv_safe_to_define___extensions__" >&6; }
-   $as_echo "#define _TANDEM_SOURCE 1" >>confdefs.h
- 
- 
--am__api_version='1.15'
-+am__api_version='1.16'
- 
- # Find a good install program.  We prefer a C program (faster),
- # so one script is as good as another.  But avoid the broken or
-@@ -3900,12 +3908,7 @@ ac_script='s/[\\$]/&&/g;s/;s,x,x,$//'
- program_transform_name=`$as_echo "$program_transform_name" | sed "$ac_script"`
- 
- if test x"${MISSING+set}" != xset; then
--  case $am_aux_dir in
--  *\ * | *\	*)
--    MISSING="\${SHELL} \"$am_aux_dir/missing\"" ;;
--  *)
--    MISSING="\${SHELL} $am_aux_dir/missing" ;;
--  esac
-+  MISSING="\${SHELL} '$am_aux_dir/missing'"
- fi
- # Use eval to expand $SHELL
- if eval "$MISSING --is-lightweight"; then
-@@ -4153,45 +4156,45 @@ DEPDIR="${am__leading_dot}deps"
- 
- ac_config_commands="$ac_config_commands depfiles"
- 
--
--am_make=${MAKE-make}
--cat > confinc << 'END'
-+{ $as_echo "$as_me:${as_lineno-$LINENO}: checking whether ${MAKE-make} supports the include directive" >&5
-+$as_echo_n "checking whether ${MAKE-make} supports the include directive... " >&6; }
-+cat > confinc.mk << 'END'
- am__doit:
--	@echo this is the am__doit target
-+	@echo this is the am__doit target >confinc.out
- .PHONY: am__doit
- END
--# If we don't find an include directive, just comment out the code.
--{ $as_echo "$as_me:${as_lineno-$LINENO}: checking for style of include used by $am_make" >&5
--$as_echo_n "checking for style of include used by $am_make... " >&6; }
- am__include="#"
- am__quote=
--_am_result=none
--# First try GNU make style include.
--echo "include confinc" > confmf
--# Ignore all kinds of additional output from 'make'.
--case `$am_make -s -f confmf 2> /dev/null` in #(
--*the\ am__doit\ target*)
--  am__include=include
--  am__quote=
--  _am_result=GNU
--  ;;
--esac
--# Now try BSD make style include.
--if test "$am__include" = "#"; then
--   echo '.include "confinc"' > confmf
--   case `$am_make -s -f confmf 2> /dev/null` in #(
--   *the\ am__doit\ target*)
--     am__include=.include
--     am__quote="\""
--     _am_result=BSD
-+# BSD make does it like this.
-+echo '.include "confinc.mk" # ignored' > confmf.BSD
-+# Other make implementations (GNU, Solaris 10, AIX) do it like this.
-+echo 'include confinc.mk # ignored' > confmf.GNU
-+_am_result=no
-+for s in GNU BSD; do
-+  { echo "$as_me:$LINENO: ${MAKE-make} -f confmf.$s && cat confinc.out" >&5
-+   (${MAKE-make} -f confmf.$s && cat confinc.out) >&5 2>&5
-+   ac_status=$?
-+   echo "$as_me:$LINENO: \$? = $ac_status" >&5
-+   (exit $ac_status); }
-+  case $?:`cat confinc.out 2>/dev/null` in #(
-+  '0:this is the am__doit target') :
-+    case $s in #(
-+  BSD) :
-+    am__include='.include' am__quote='"' ;; #(
-+  *) :
-+    am__include='include' am__quote='' ;;
-+esac ;; #(
-+  *) :
-      ;;
--   esac
--fi
--
--
--{ $as_echo "$as_me:${as_lineno-$LINENO}: result: $_am_result" >&5
--$as_echo "$_am_result" >&6; }
--rm -f confinc confmf
-+esac
-+  if test "$am__include" != "#"; then
-+    _am_result="yes ($s style)"
-+    break
-+  fi
-+done
-+rm -f confinc.* confmf.*
-+{ $as_echo "$as_me:${as_lineno-$LINENO}: result: ${_am_result}" >&5
-+$as_echo "${_am_result}" >&6; }
- 
- # Check whether --enable-dependency-tracking was given.
- if test "${enable_dependency_tracking+set}" = set; then :
-@@ -4303,8 +4306,8 @@ MAKEINFO=${MAKEINFO-"${am_missing_run}makeinfo"}
- 
- # For better backward compatibility.  To be removed once Automake 1.9.x
- # dies out for good.  For more background, see:
--# <http://lists.gnu.org/archive/html/automake/2012-07/msg00001.html>
--# <http://lists.gnu.org/archive/html/automake/2012-07/msg00014.html>
-+# <https://lists.gnu.org/archive/html/automake/2012-07/msg00001.html>
-+# <https://lists.gnu.org/archive/html/automake/2012-07/msg00014.html>
- mkdir_p='$(MKDIR_P)'
- 
- # We need awk for the "check" target (and possibly the TAP driver).  The
-@@ -4451,6 +4454,20 @@ else
- fi
- 
- 
-+# Variables for tags utilities; see am/tags.am
-+if test -z "$CTAGS"; then
-+  CTAGS=ctags
-+fi
-+
-+if test -z "$ETAGS"; then
-+  ETAGS=etags
-+fi
-+
-+if test -z "$CSCOPE"; then
-+  CSCOPE=cscope
-+fi
-+
-+
- 
- # POSIX will say in a future version that running "rm -f" with no argument
- # is OK; and we want to be able to make that assumption in our Makefile
-@@ -4483,7 +4500,7 @@ END
- Aborting the configuration process, to ensure you take notice of the issue.
- 
- You can download and install GNU coreutils to get an 'rm' implementation
--that behaves properly: <http://www.gnu.org/software/coreutils/>.
-+that behaves properly: <https://www.gnu.org/software/coreutils/>.
- 
- If you want to complete the configuration process using your problematic
- 'rm' anyway, export the environment variable ACCEPT_INFERIOR_RM_PROGRAM
-@@ -5468,8 +5485,8 @@ esac
+@@ -5468,8 +5473,8 @@ esac
  
  
  
@@ -21455,7 +20238,7 @@ index 4727eff533a..ca3885ad105 100755
  
  
  
-@@ -5509,7 +5526,7 @@ ECHO=$ECHO$ECHO$ECHO$ECHO$ECHO$ECHO
+@@ -5509,7 +5514,7 @@ ECHO=$ECHO$ECHO$ECHO$ECHO$ECHO$ECHO
  { $as_echo "$as_me:${as_lineno-$LINENO}: checking how to print strings" >&5
  $as_echo_n "checking how to print strings... " >&6; }
  # Test print first, because it will be a builtin if present.
@@ -21464,7 +20247,7 @@ index 4727eff533a..ca3885ad105 100755
     test "X`print -r -- $ECHO 2>/dev/null`" = "X$ECHO"; then
    ECHO='print -r --'
  elif test "X`printf %s $ECHO 2>/dev/null`" = "X$ECHO"; then
-@@ -6202,8 +6219,8 @@ $as_echo_n "checking whether the shell understands some XSI constructs... " >&6;
+@@ -6202,8 +6207,8 @@ $as_echo_n "checking whether the shell understands some XSI constructs... " >&6;
  # Try some XSI features
  xsi_shell=no
  ( _lt_dummy="a/b/c"
@@ -21475,7 +20258,7 @@ index 4727eff533a..ca3885ad105 100755
      && eval 'test $(( 1 + 1 )) -eq 2 \
      && test "${#_lt_dummy}" -eq 5' ) >/dev/null 2>&1 \
    && xsi_shell=yes
-@@ -6252,6 +6269,80 @@ esac
+@@ -6252,6 +6257,80 @@ esac
  
  
  
@@ -21556,7 +20339,7 @@ index 4727eff533a..ca3885ad105 100755
  { $as_echo "$as_me:${as_lineno-$LINENO}: checking for $LD option to reload object files" >&5
  $as_echo_n "checking for $LD option to reload object files... " >&6; }
  if ${lt_cv_ld_reload_flag+:} false; then :
-@@ -6268,6 +6359,11 @@ case $reload_flag in
+@@ -6268,6 +6347,11 @@ case $reload_flag in
  esac
  reload_cmds='$LD$reload_flag -o $output$reload_objs'
  case $host_os in
@@ -21568,7 +20351,7 @@ index 4727eff533a..ca3885ad105 100755
    darwin*)
      if test "$GCC" = yes; then
        reload_cmds='$LTCC $LTCFLAGS -nostdlib ${wl}-r -o $output$reload_objs'
-@@ -6436,7 +6532,8 @@ mingw* | pw32*)
+@@ -6436,7 +6520,8 @@ mingw* | pw32*)
      lt_cv_deplibs_check_method='file_magic ^x86 archive import|^x86 DLL'
      lt_cv_file_magic_cmd='func_win32_libid'
    else
@@ -21578,7 +20361,7 @@ index 4727eff533a..ca3885ad105 100755
      lt_cv_file_magic_cmd='$OBJDUMP -f'
    fi
    ;;
-@@ -6595,6 +6692,21 @@ esac
+@@ -6595,6 +6680,21 @@ esac
  fi
  { $as_echo "$as_me:${as_lineno-$LINENO}: result: $lt_cv_deplibs_check_method" >&5
  $as_echo "$lt_cv_deplibs_check_method" >&6; }
@@ -21600,7 +20383,7 @@ index 4727eff533a..ca3885ad105 100755
  file_magic_cmd=$lt_cv_file_magic_cmd
  deplibs_check_method=$lt_cv_deplibs_check_method
  test -z "$deplibs_check_method" && deplibs_check_method=unknown
-@@ -6610,6 +6722,157 @@ test -z "$deplibs_check_method" && deplibs_check_method=unknown
+@@ -6610,6 +6710,157 @@ test -z "$deplibs_check_method" && deplibs_check_method=unknown
  
  
  
@@ -21758,7 +20541,7 @@ index 4727eff533a..ca3885ad105 100755
  plugin_option=
  plugin_names="liblto_plugin.so liblto_plugin-0.dll cyglto_plugin-0.dll"
  for plugin in $plugin_names; do
-@@ -6624,8 +6887,10 @@ for plugin in $plugin_names; do
+@@ -6624,8 +6875,10 @@ for plugin in $plugin_names; do
  done
  
  if test -n "$ac_tool_prefix"; then
@@ -21771,7 +20554,7 @@ index 4727eff533a..ca3885ad105 100755
  { $as_echo "$as_me:${as_lineno-$LINENO}: checking for $ac_word" >&5
  $as_echo_n "checking for $ac_word... " >&6; }
  if ${ac_cv_prog_AR+:} false; then :
-@@ -6641,7 +6906,7 @@ do
+@@ -6641,7 +6894,7 @@ do
    test -z "$as_dir" && as_dir=.
      for ac_exec_ext in '' $ac_executable_extensions; do
    if as_fn_executable_p "$as_dir/$ac_word$ac_exec_ext"; then
@@ -21780,7 +20563,7 @@ index 4727eff533a..ca3885ad105 100755
      $as_echo "$as_me:${as_lineno-$LINENO}: found $as_dir/$ac_word$ac_exec_ext" >&5
      break 2
    fi
-@@ -6661,11 +6926,15 @@ $as_echo "no" >&6; }
+@@ -6661,11 +6914,15 @@ $as_echo "no" >&6; }
  fi
  
  
@@ -21799,7 +20582,7 @@ index 4727eff533a..ca3885ad105 100755
  { $as_echo "$as_me:${as_lineno-$LINENO}: checking for $ac_word" >&5
  $as_echo_n "checking for $ac_word... " >&6; }
  if ${ac_cv_prog_ac_ct_AR+:} false; then :
-@@ -6681,7 +6950,7 @@ do
+@@ -6681,7 +6938,7 @@ do
    test -z "$as_dir" && as_dir=.
      for ac_exec_ext in '' $ac_executable_extensions; do
    if as_fn_executable_p "$as_dir/$ac_word$ac_exec_ext"; then
@@ -21808,7 +20591,7 @@ index 4727eff533a..ca3885ad105 100755
      $as_echo "$as_me:${as_lineno-$LINENO}: found $as_dir/$ac_word$ac_exec_ext" >&5
      break 2
    fi
-@@ -6700,6 +6969,10 @@ else
+@@ -6700,6 +6957,10 @@ else
  $as_echo "no" >&6; }
  fi
  
@@ -21819,7 +20602,7 @@ index 4727eff533a..ca3885ad105 100755
    if test "x$ac_ct_AR" = x; then
      AR="false"
    else
-@@ -6711,29 +6984,81 @@ ac_tool_warned=yes ;;
+@@ -6711,25 +6972,19 @@ ac_tool_warned=yes ;;
  esac
      AR=$ac_ct_AR
    fi
@@ -21851,16 +20634,12 @@ index 4727eff533a..ca3885ad105 100755
 +  rm -f conftest.*
 +: ${AR=ar}
 +: ${AR_FLAGS=cru}
-+
-+
-+
-+
-+
-+
-+
  
  
  
+@@ -6741,6 +6996,64 @@ test -z "$AR_FLAGS" && AR_FLAGS=cru
+ 
+ 
  
 +{ $as_echo "$as_me:${as_lineno-$LINENO}: checking for archiver @FILE support" >&5
 +$as_echo_n "checking for archiver @FILE support... " >&6; }
@@ -21913,10 +20692,17 @@ index 4727eff533a..ca3885ad105 100755
 +else
 +  archiver_list_spec=$lt_cv_ar_at_file
 +fi
- 
- 
- 
-@@ -7080,8 +7405,8 @@ esac
++
++
++
++
++
++
++
+ if test -n "$ac_tool_prefix"; then
+   # Extract the first word of "${ac_tool_prefix}strip", so it can be a program name with args.
+ set dummy ${ac_tool_prefix}strip; ac_word=$2
+@@ -7080,8 +7393,8 @@ esac
  lt_cv_sys_global_symbol_to_cdecl="sed -n -e 's/^T .* \(.*\)$/extern int \1();/p' -e 's/^$symcode* .* \(.*\)$/extern char \1;/p'"
  
  # Transform an extracted symbol line into symbol name and symbol address
@@ -21927,7 +20713,7 @@ index 4727eff533a..ca3885ad105 100755
  
  # Handle CRLF in mingw tool chain
  opt_cr=
-@@ -7117,6 +7442,7 @@ for ac_symprfx in "" "_"; do
+@@ -7117,6 +7430,7 @@ for ac_symprfx in "" "_"; do
    else
      lt_cv_sys_global_symbol_pipe="sed -n -e 's/^.*[	 ]\($symcode$symcode*\)[	 ][	 ]*$ac_symprfx$sympat$opt_cr$/$symxfrm/p'"
    fi
@@ -21935,7 +20721,7 @@ index 4727eff533a..ca3885ad105 100755
  
    # Check to see that the pipe works correctly.
    pipe_works=no
-@@ -7158,6 +7484,18 @@ _LT_EOF
+@@ -7158,6 +7472,18 @@ _LT_EOF
        if $GREP ' nm_test_var$' "$nlist" >/dev/null; then
  	if $GREP ' nm_test_func$' "$nlist" >/dev/null; then
  	  cat <<_LT_EOF > conftest.$ac_ext
@@ -21954,7 +20740,7 @@ index 4727eff533a..ca3885ad105 100755
  #ifdef __cplusplus
  extern "C" {
  #endif
-@@ -7169,7 +7507,7 @@ _LT_EOF
+@@ -7169,7 +7495,7 @@ _LT_EOF
  	  cat <<_LT_EOF >> conftest.$ac_ext
  
  /* The mapping between symbol names and symbols.  */
@@ -21963,7 +20749,7 @@ index 4727eff533a..ca3885ad105 100755
    const char *name;
    void       *address;
  }
-@@ -7195,8 +7533,8 @@ static const void *lt_preloaded_setup() {
+@@ -7195,8 +7521,8 @@ static const void *lt_preloaded_setup() {
  _LT_EOF
  	  # Now try linking the two files.
  	  mv conftest.$ac_objext conftstm.$ac_objext
@@ -21974,7 +20760,7 @@ index 4727eff533a..ca3885ad105 100755
  	  LIBS="conftstm.$ac_objext"
  	  CFLAGS="$CFLAGS$lt_prog_compiler_no_builtin_flag"
  	  if { { eval echo "\"\$as_me\":${as_lineno-$LINENO}: \"$ac_link\""; } >&5
-@@ -7206,8 +7544,8 @@ _LT_EOF
+@@ -7206,8 +7532,8 @@ _LT_EOF
    test $ac_status = 0; } && test -s conftest${ac_exeext}; then
  	    pipe_works=yes
  	  fi
@@ -21985,7 +20771,7 @@ index 4727eff533a..ca3885ad105 100755
  	else
  	  echo "cannot find nm_test_func in $nlist" >&5
  	fi
-@@ -7244,6 +7582,16 @@ else
+@@ -7244,6 +7570,14 @@ else
  $as_echo "ok" >&6; }
  fi
  
@@ -21997,12 +20783,10 @@ index 4727eff533a..ca3885ad105 100755
 +fi
 +
 +
-+
-+
  
  
  
-@@ -7260,6 +7608,45 @@ fi
+@@ -7262,6 +7596,47 @@ fi
  
  
  
@@ -22045,21 +20829,15 @@ index 4727eff533a..ca3885ad105 100755
 +
 + { $as_echo "$as_me:${as_lineno-$LINENO}: result: ${lt_sysroot:-no}" >&5
 +$as_echo "${lt_sysroot:-no}" >&6; }
++
++
  
  
  
-@@ -7465,11 +7852,128 @@ sparc*-*solaris*)
-       ;;
-     esac
-   fi
--  rm -rf conftest*
--  ;;
-+  rm -rf conftest*
-+  ;;
-+esac
-+
-+need_locks="$enable_libtool_lock"
-+
+@@ -7471,6 +7846,123 @@ esac
+ 
+ need_locks="$enable_libtool_lock"
+ 
 +if test -n "$ac_tool_prefix"; then
 +  # Extract the first word of "${ac_tool_prefix}mt", so it can be a program name with args.
 +set dummy ${ac_tool_prefix}mt; ac_word=$2
@@ -22145,7 +20923,7 @@ index 4727eff533a..ca3885ad105 100755
 +{ $as_echo "$as_me:${as_lineno-$LINENO}: WARNING: using cross tools not prefixed with host triplet" >&5
 +$as_echo "$as_me: WARNING: using cross tools not prefixed with host triplet" >&2;}
 +ac_tool_warned=yes ;;
- esac
++esac
 +    MANIFEST_TOOL=$ac_ct_MANIFEST_TOOL
 +  fi
 +else
@@ -22175,12 +20953,12 @@ index 4727eff533a..ca3885ad105 100755
 +
 +
 +
- 
--need_locks="$enable_libtool_lock"
- 
++
++
  
    case $host_os in
-@@ -8034,6 +8538,8 @@ _LT_EOF
+     rhapsody* | darwin*)
+@@ -8034,6 +8526,8 @@ _LT_EOF
        $LTCC $LTCFLAGS -c -o conftest.o conftest.c 2>&5
        echo "$AR cru libconftest.a conftest.o" >&5
        $AR cru libconftest.a conftest.o 2>&5
@@ -22189,7 +20967,7 @@ index 4727eff533a..ca3885ad105 100755
        cat > conftest.c << _LT_EOF
  int main() { return 0;}
  _LT_EOF
-@@ -8588,8 +9094,6 @@ fi
+@@ -8588,8 +9082,6 @@ fi
  lt_prog_compiler_pic=
  lt_prog_compiler_static=
  
@@ -22198,7 +20976,7 @@ index 4727eff533a..ca3885ad105 100755
  
    if test "$GCC" = yes; then
      lt_prog_compiler_wl='-Wl,'
-@@ -8755,6 +9259,12 @@ $as_echo_n "checking for $compiler option to produce PIC... " >&6; }
+@@ -8755,6 +9247,12 @@ $as_echo_n "checking for $compiler option to produce PIC... " >&6; }
  	lt_prog_compiler_pic='--shared'
  	lt_prog_compiler_static='--static'
  	;;
@@ -22211,7 +20989,7 @@ index 4727eff533a..ca3885ad105 100755
        pgcc* | pgf77* | pgf90* | pgf95* | pgfortran*)
          # Portland Group compilers (*not* the Pentium gcc compiler,
  	# which looks to be a dead project)
-@@ -8817,7 +9327,7 @@ $as_echo_n "checking for $compiler option to produce PIC... " >&6; }
+@@ -8817,7 +9315,7 @@ $as_echo_n "checking for $compiler option to produce PIC... " >&6; }
        lt_prog_compiler_pic='-KPIC'
        lt_prog_compiler_static='-Bstatic'
        case $cc_basename in
@@ -22220,7 +20998,7 @@ index 4727eff533a..ca3885ad105 100755
  	lt_prog_compiler_wl='-Qoption ld ';;
        *)
  	lt_prog_compiler_wl='-Wl,';;
-@@ -8874,13 +9384,17 @@ case $host_os in
+@@ -8874,13 +9372,17 @@ case $host_os in
      lt_prog_compiler_pic="$lt_prog_compiler_pic -DPIC"
      ;;
  esac
@@ -22244,7 +21022,7 @@ index 4727eff533a..ca3885ad105 100755
  
  #
  # Check to make sure the PIC flag actually works.
-@@ -8941,6 +9455,11 @@ fi
+@@ -8941,6 +9443,11 @@ fi
  
  
  
@@ -22256,7 +21034,7 @@ index 4727eff533a..ca3885ad105 100755
  #
  # Check to make sure the static flag actually works.
  #
-@@ -9291,7 +9810,8 @@ _LT_EOF
+@@ -9291,7 +9798,8 @@ _LT_EOF
        allow_undefined_flag=unsupported
        always_export_symbols=no
        enable_shared_with_static_runtimes=yes
@@ -22266,7 +21044,7 @@ index 4727eff533a..ca3885ad105 100755
  
        if $LD --help 2>&1 | $GREP 'auto-import' > /dev/null; then
          archive_cmds='$CC -shared $libobjs $deplibs $compiler_flags -o $output_objdir/$soname ${wl}--enable-auto-image-base -Xlinker --out-implib -Xlinker $lib'
-@@ -9390,12 +9910,12 @@ _LT_EOF
+@@ -9390,12 +9898,12 @@ _LT_EOF
  	  whole_archive_flag_spec='--whole-archive$convenience --no-whole-archive'
  	  hardcode_libdir_flag_spec=
  	  hardcode_libdir_flag_spec_ld='-rpath $libdir'
@@ -22281,7 +21059,7 @@ index 4727eff533a..ca3885ad105 100755
  	  fi
  	  ;;
  	esac
-@@ -9409,8 +9929,8 @@ _LT_EOF
+@@ -9409,8 +9917,8 @@ _LT_EOF
  	archive_cmds='$LD -Bshareable $libobjs $deplibs $linker_flags -o $lib'
  	wlarc=
        else
@@ -22292,7 +21070,7 @@ index 4727eff533a..ca3885ad105 100755
        fi
        ;;
  
-@@ -9428,8 +9948,8 @@ _LT_EOF
+@@ -9428,8 +9936,8 @@ _LT_EOF
  
  _LT_EOF
        elif $LD --help 2>&1 | $GREP ': supported targets:.* elf' > /dev/null; then
@@ -22303,7 +21081,7 @@ index 4727eff533a..ca3885ad105 100755
        else
  	ld_shlibs=no
        fi
-@@ -9475,8 +9995,8 @@ _LT_EOF
+@@ -9475,8 +9983,8 @@ _LT_EOF
  
      *)
        if $LD --help 2>&1 | $GREP ': supported targets:.* elf' > /dev/null; then
@@ -22314,7 +21092,7 @@ index 4727eff533a..ca3885ad105 100755
        else
  	ld_shlibs=no
        fi
-@@ -9606,7 +10126,13 @@ _LT_EOF
+@@ -9606,7 +10114,13 @@ _LT_EOF
  	allow_undefined_flag='-berok'
          # Determine the default libpath from the value encoded in an
          # empty executable.
@@ -22329,7 +21107,7 @@ index 4727eff533a..ca3885ad105 100755
  /* end confdefs.h.  */
  
  int
-@@ -9619,22 +10145,29 @@ main ()
+@@ -9619,22 +10133,29 @@ main ()
  _ACEOF
  if ac_fn_c_try_link "$LINENO"; then :
  
@@ -22372,7 +21150,7 @@ index 4727eff533a..ca3885ad105 100755
  
          hardcode_libdir_flag_spec='${wl}-blibpath:$libdir:'"$aix_libpath"
          archive_expsym_cmds='$CC -o $output_objdir/$soname $libobjs $deplibs '"\${wl}$no_entry_flag"' $compiler_flags `if test "x${allow_undefined_flag}" != "x"; then func_echo_all "${wl}${allow_undefined_flag}"; else :; fi` '"\${wl}$exp_sym_flag:\$export_symbols $shared_flag"
-@@ -9646,7 +10179,13 @@ if test -z "$aix_libpath"; then aix_libpath="/usr/lib:/lib"; fi
+@@ -9646,7 +10167,13 @@ if test -z "$aix_libpath"; then aix_libpath="/usr/lib:/lib"; fi
  	else
  	 # Determine the default libpath from the value encoded in an
  	 # empty executable.
@@ -22387,7 +21165,7 @@ index 4727eff533a..ca3885ad105 100755
  /* end confdefs.h.  */
  
  int
-@@ -9659,22 +10198,29 @@ main ()
+@@ -9659,22 +10186,29 @@ main ()
  _ACEOF
  if ac_fn_c_try_link "$LINENO"; then :
  
@@ -22430,7 +21208,7 @@ index 4727eff533a..ca3885ad105 100755
  
  	 hardcode_libdir_flag_spec='${wl}-blibpath:$libdir:'"$aix_libpath"
  	  # Warning - without using the other run time loading flags,
-@@ -9719,20 +10265,63 @@ if test -z "$aix_libpath"; then aix_libpath="/usr/lib:/lib"; fi
+@@ -9719,20 +10253,63 @@ if test -z "$aix_libpath"; then aix_libpath="/usr/lib:/lib"; fi
        # Microsoft Visual C++.
        # hardcode_libdir_flag_spec is actually meaningless, as there is
        # no search path for DLLs.
@@ -22508,7 +21286,7 @@ index 4727eff533a..ca3885ad105 100755
        ;;
  
      darwin* | rhapsody*)
-@@ -9793,7 +10382,7 @@ if test -z "$aix_libpath"; then aix_libpath="/usr/lib:/lib"; fi
+@@ -9793,7 +10370,7 @@ if test -z "$aix_libpath"; then aix_libpath="/usr/lib:/lib"; fi
  
      # FreeBSD 3 and greater uses gcc -shared to do shared libraries.
      freebsd* | dragonfly*)
@@ -22517,7 +21295,7 @@ index 4727eff533a..ca3885ad105 100755
        hardcode_libdir_flag_spec='-R$libdir'
        hardcode_direct=yes
        hardcode_shlibpath_var=no
-@@ -9801,7 +10390,7 @@ if test -z "$aix_libpath"; then aix_libpath="/usr/lib:/lib"; fi
+@@ -9801,7 +10378,7 @@ if test -z "$aix_libpath"; then aix_libpath="/usr/lib:/lib"; fi
  
      hpux9*)
        if test "$GCC" = yes; then
@@ -22526,7 +21304,7 @@ index 4727eff533a..ca3885ad105 100755
        else
  	archive_cmds='$RM $output_objdir/$soname~$LD -b +b $install_libdir -o $output_objdir/$soname $libobjs $deplibs $linker_flags~test $output_objdir/$soname = $lib || mv $output_objdir/$soname $lib'
        fi
-@@ -9817,7 +10406,7 @@ if test -z "$aix_libpath"; then aix_libpath="/usr/lib:/lib"; fi
+@@ -9817,7 +10394,7 @@ if test -z "$aix_libpath"; then aix_libpath="/usr/lib:/lib"; fi
  
      hpux10*)
        if test "$GCC" = yes && test "$with_gnu_ld" = no; then
@@ -22535,7 +21313,7 @@ index 4727eff533a..ca3885ad105 100755
        else
  	archive_cmds='$LD -b +h $soname +b $install_libdir -o $lib $libobjs $deplibs $linker_flags'
        fi
-@@ -9841,10 +10430,10 @@ if test -z "$aix_libpath"; then aix_libpath="/usr/lib:/lib"; fi
+@@ -9841,10 +10418,10 @@ if test -z "$aix_libpath"; then aix_libpath="/usr/lib:/lib"; fi
  	  archive_cmds='$CC -shared ${wl}+h ${wl}$soname ${wl}+nodefaultrpath -o $lib $libobjs $deplibs $compiler_flags'
  	  ;;
  	ia64*)
@@ -22548,7 +21326,7 @@ index 4727eff533a..ca3885ad105 100755
  	  ;;
  	esac
        else
-@@ -9923,23 +10512,36 @@ fi
+@@ -9923,23 +10500,36 @@ fi
  
      irix5* | irix6* | nonstopux*)
        if test "$GCC" = yes; then
@@ -22593,7 +21371,7 @@ index 4727eff533a..ca3885ad105 100755
        else
  	archive_cmds='$CC -shared $libobjs $deplibs $compiler_flags -soname $soname `test -n "$verstring" && func_echo_all "-set_version $verstring"` -update_registry ${output_objdir}/so_locations -o $lib'
  	archive_expsym_cmds='$CC -shared $libobjs $deplibs $compiler_flags -soname $soname `test -n "$verstring" && func_echo_all "-set_version $verstring"` -update_registry ${output_objdir}/so_locations -exports_file $export_symbols -o $lib'
-@@ -10024,7 +10626,7 @@ rm -f core conftest.err conftest.$ac_objext \
+@@ -10024,7 +10614,7 @@ rm -f core conftest.err conftest.$ac_objext \
      osf4* | osf5*)	# as osf3* with the addition of -msym flag
        if test "$GCC" = yes; then
  	allow_undefined_flag=' ${wl}-expect_unresolved ${wl}\*'
@@ -22602,7 +21380,7 @@ index 4727eff533a..ca3885ad105 100755
  	hardcode_libdir_flag_spec='${wl}-rpath ${wl}$libdir'
        else
  	allow_undefined_flag=' -expect_unresolved \*'
-@@ -10043,9 +10645,9 @@ rm -f core conftest.err conftest.$ac_objext \
+@@ -10043,9 +10633,9 @@ rm -f core conftest.err conftest.$ac_objext \
        no_undefined_flag=' -z defs'
        if test "$GCC" = yes; then
  	wlarc='${wl}'
@@ -22614,7 +21392,7 @@ index 4727eff533a..ca3885ad105 100755
        else
  	case `$CC -V 2>&1` in
  	*"Compilers 5.0"*)
-@@ -10621,8 +11223,9 @@ cygwin* | mingw* | pw32* | cegcc*)
+@@ -10621,8 +11211,9 @@ cygwin* | mingw* | pw32* | cegcc*)
    need_version=no
    need_lib_prefix=no
  
@@ -22626,7 +21404,7 @@ index 4727eff533a..ca3885ad105 100755
      library_names_spec='$libname.dll.a'
      # DLL is installed to $(libdir)/../bin by postinstall_cmds
      postinstall_cmds='base_file=`basename \${file}`~
-@@ -10655,13 +11258,71 @@ cygwin* | mingw* | pw32* | cegcc*)
+@@ -10655,13 +11246,71 @@ cygwin* | mingw* | pw32* | cegcc*)
        library_names_spec='`echo ${libname} | sed -e 's/^lib/pw/'``echo ${release} | $SED -e 's/[.]/-/g'`${versuffix}${shared_ext}'
        ;;
      esac
@@ -22699,7 +21477,7 @@ index 4727eff533a..ca3885ad105 100755
    # FIXME: first we should search . and the directory the executable is in
    shlibpath_var=PATH
    ;;
-@@ -11563,7 +12224,7 @@ else
+@@ -11563,7 +12212,7 @@ else
    lt_dlunknown=0; lt_dlno_uscore=1; lt_dlneed_uscore=2
    lt_status=$lt_dlunknown
    cat > conftest.$ac_ext <<_LT_EOF
@@ -22708,7 +21486,7 @@ index 4727eff533a..ca3885ad105 100755
  #include "confdefs.h"
  
  #if HAVE_DLFCN_H
-@@ -11607,10 +12268,10 @@ else
+@@ -11607,10 +12256,10 @@ else
  /* When -fvisbility=hidden is used, assume the code has been annotated
     correspondingly for the symbols needed.  */
  #if defined(__GNUC__) && (((__GNUC__ == 3) && (__GNUC_MINOR__ >= 3)) || (__GNUC__ > 3))
@@ -22721,7 +21499,7 @@ index 4727eff533a..ca3885ad105 100755
  int main ()
  {
    void *self = dlopen (0, LT_DLGLOBAL|LT_DLLAZY_OR_NOW);
-@@ -11669,7 +12330,7 @@ else
+@@ -11669,7 +12318,7 @@ else
    lt_dlunknown=0; lt_dlno_uscore=1; lt_dlneed_uscore=2
    lt_status=$lt_dlunknown
    cat > conftest.$ac_ext <<_LT_EOF
@@ -22730,7 +21508,7 @@ index 4727eff533a..ca3885ad105 100755
  #include "confdefs.h"
  
  #if HAVE_DLFCN_H
-@@ -11713,10 +12374,10 @@ else
+@@ -11713,10 +12362,10 @@ else
  /* When -fvisbility=hidden is used, assume the code has been annotated
     correspondingly for the symbols needed.  */
  #if defined(__GNUC__) && (((__GNUC__ == 3) && (__GNUC_MINOR__ >= 3)) || (__GNUC__ > 3))
@@ -22743,16 +21521,7 @@ index 4727eff533a..ca3885ad105 100755
  int main ()
  {
    void *self = dlopen (0, LT_DLGLOBAL|LT_DLLAZY_OR_NOW);
-@@ -13541,7 +14202,7 @@ cat >>$CONFIG_STATUS <<_ACEOF || ac_write_fail=1
- #
- # INIT-COMMANDS
- #
--AMDEP_TRUE="$AMDEP_TRUE" ac_aux_dir="$ac_aux_dir"
-+AMDEP_TRUE="$AMDEP_TRUE" MAKE="${MAKE-make}"
- 
- 
- # The HP-UX ksh and POSIX shell print the target directory to stdout
-@@ -13579,13 +14240,20 @@ exeext='`$ECHO "$exeext" | $SED "$delay_single_quote_subst"`'
+@@ -13579,13 +14228,20 @@ exeext='`$ECHO "$exeext" | $SED "$delay_single_quote_subst"`'
  lt_unset='`$ECHO "$lt_unset" | $SED "$delay_single_quote_subst"`'
  lt_SP2NL='`$ECHO "$lt_SP2NL" | $SED "$delay_single_quote_subst"`'
  lt_NL2SP='`$ECHO "$lt_NL2SP" | $SED "$delay_single_quote_subst"`'
@@ -22773,7 +21542,7 @@ index 4727eff533a..ca3885ad105 100755
  STRIP='`$ECHO "$STRIP" | $SED "$delay_single_quote_subst"`'
  RANLIB='`$ECHO "$RANLIB" | $SED "$delay_single_quote_subst"`'
  old_postinstall_cmds='`$ECHO "$old_postinstall_cmds" | $SED "$delay_single_quote_subst"`'
-@@ -13600,14 +14268,17 @@ lt_cv_sys_global_symbol_pipe='`$ECHO "$lt_cv_sys_global_symbol_pipe" | $SED "$de
+@@ -13600,14 +14256,17 @@ lt_cv_sys_global_symbol_pipe='`$ECHO "$lt_cv_sys_global_symbol_pipe" | $SED "$de
  lt_cv_sys_global_symbol_to_cdecl='`$ECHO "$lt_cv_sys_global_symbol_to_cdecl" | $SED "$delay_single_quote_subst"`'
  lt_cv_sys_global_symbol_to_c_name_address='`$ECHO "$lt_cv_sys_global_symbol_to_c_name_address" | $SED "$delay_single_quote_subst"`'
  lt_cv_sys_global_symbol_to_c_name_address_lib_prefix='`$ECHO "$lt_cv_sys_global_symbol_to_c_name_address_lib_prefix" | $SED "$delay_single_quote_subst"`'
@@ -22792,7 +21561,7 @@ index 4727eff533a..ca3885ad105 100755
  DSYMUTIL='`$ECHO "$DSYMUTIL" | $SED "$delay_single_quote_subst"`'
  NMEDIT='`$ECHO "$NMEDIT" | $SED "$delay_single_quote_subst"`'
  LIPO='`$ECHO "$LIPO" | $SED "$delay_single_quote_subst"`'
-@@ -13640,12 +14311,12 @@ hardcode_shlibpath_var='`$ECHO "$hardcode_shlibpath_var" | $SED "$delay_single_q
+@@ -13640,12 +14299,12 @@ hardcode_shlibpath_var='`$ECHO "$hardcode_shlibpath_var" | $SED "$delay_single_q
  hardcode_automatic='`$ECHO "$hardcode_automatic" | $SED "$delay_single_quote_subst"`'
  inherit_rpath='`$ECHO "$inherit_rpath" | $SED "$delay_single_quote_subst"`'
  link_all_deplibs='`$ECHO "$link_all_deplibs" | $SED "$delay_single_quote_subst"`'
@@ -22806,7 +21575,7 @@ index 4727eff533a..ca3885ad105 100755
  file_list_spec='`$ECHO "$file_list_spec" | $SED "$delay_single_quote_subst"`'
  variables_saved_for_relink='`$ECHO "$variables_saved_for_relink" | $SED "$delay_single_quote_subst"`'
  need_lib_prefix='`$ECHO "$need_lib_prefix" | $SED "$delay_single_quote_subst"`'
-@@ -13700,8 +14371,13 @@ reload_flag \
+@@ -13700,8 +14359,13 @@ reload_flag \
  OBJDUMP \
  deplibs_check_method \
  file_magic_cmd \
@@ -22820,7 +21589,7 @@ index 4727eff533a..ca3885ad105 100755
  STRIP \
  RANLIB \
  CC \
-@@ -13711,12 +14387,14 @@ lt_cv_sys_global_symbol_pipe \
+@@ -13711,12 +14375,14 @@ lt_cv_sys_global_symbol_pipe \
  lt_cv_sys_global_symbol_to_cdecl \
  lt_cv_sys_global_symbol_to_c_name_address \
  lt_cv_sys_global_symbol_to_c_name_address_lib_prefix \
@@ -22836,7 +21605,7 @@ index 4727eff533a..ca3885ad105 100755
  DSYMUTIL \
  NMEDIT \
  LIPO \
-@@ -13732,7 +14410,6 @@ no_undefined_flag \
+@@ -13732,7 +14398,6 @@ no_undefined_flag \
  hardcode_libdir_flag_spec \
  hardcode_libdir_flag_spec_ld \
  hardcode_libdir_separator \
@@ -22844,7 +21613,7 @@ index 4727eff533a..ca3885ad105 100755
  exclude_expsyms \
  include_expsyms \
  file_list_spec \
-@@ -13768,6 +14445,7 @@ module_cmds \
+@@ -13768,6 +14433,7 @@ module_cmds \
  module_expsym_cmds \
  export_symbols_cmds \
  prelink_cmds \
@@ -22852,149 +21621,7 @@ index 4727eff533a..ca3885ad105 100755
  postinstall_cmds \
  postuninstall_cmds \
  finish_cmds \
-@@ -14414,29 +15092,35 @@ $as_echo "$as_me: executing $ac_file commands" >&6;}
-   # Older Autoconf quotes --file arguments for eval, but not when files
-   # are listed without --file.  Let's play safe and only enable the eval
-   # if we detect the quoting.
--  case $CONFIG_FILES in
--  *\'*) eval set x "$CONFIG_FILES" ;;
--  *)   set x $CONFIG_FILES ;;
--  esac
-+  # TODO: see whether this extra hack can be removed once we start
-+  # requiring Autoconf 2.70 or later.
-+  case $CONFIG_FILES in #(
-+  *\'*) :
-+    eval set x "$CONFIG_FILES" ;; #(
-+  *) :
-+    set x $CONFIG_FILES ;; #(
-+  *) :
-+     ;;
-+esac
-   shift
--  for mf
-+  # Used to flag and report bootstrapping failures.
-+  am_rc=0
-+  for am_mf
-   do
-     # Strip MF so we end up with the name of the file.
--    mf=`echo "$mf" | sed -e 's/:.*$//'`
--    # Check whether this is an Automake generated Makefile or not.
--    # We used to match only the files named 'Makefile.in', but
--    # some people rename them; so instead we look at the file content.
--    # Grep'ing the first line is not enough: some people post-process
--    # each Makefile.in and add a new line on top of each file to say so.
--    # Grep'ing the whole file is not good either: AIX grep has a line
-+    am_mf=`$as_echo "$am_mf" | sed -e 's/:.*$//'`
-+    # Check whether this is an Automake generated Makefile which includes
-+    # dependency-tracking related rules and includes.
-+    # Grep'ing the whole file directly is not great: AIX grep has a line
-     # limit of 2048, but all sed's we know have understand at least 4000.
--    if sed -n 's,^#.*generated by automake.*,X,p' "$mf" | grep X >/dev/null 2>&1; then
--      dirpart=`$as_dirname -- "$mf" ||
--$as_expr X"$mf" : 'X\(.*[^/]\)//*[^/][^/]*/*$' \| \
--	 X"$mf" : 'X\(//\)[^/]' \| \
--	 X"$mf" : 'X\(//\)$' \| \
--	 X"$mf" : 'X\(/\)' \| . 2>/dev/null ||
--$as_echo X"$mf" |
-+    sed -n 's,^am--depfiles:.*,X,p' "$am_mf" | grep X >/dev/null 2>&1 \
-+      || continue
-+    am_dirpart=`$as_dirname -- "$am_mf" ||
-+$as_expr X"$am_mf" : 'X\(.*[^/]\)//*[^/][^/]*/*$' \| \
-+	 X"$am_mf" : 'X\(//\)[^/]' \| \
-+	 X"$am_mf" : 'X\(//\)$' \| \
-+	 X"$am_mf" : 'X\(/\)' \| . 2>/dev/null ||
-+$as_echo X"$am_mf" |
-     sed '/^X\(.*[^/]\)\/\/*[^/][^/]*\/*$/{
- 	    s//\1/
- 	    q
-@@ -14454,53 +15138,50 @@ $as_echo X"$mf" |
- 	    q
- 	  }
- 	  s/.*/./; q'`
--    else
--      continue
--    fi
--    # Extract the definition of DEPDIR, am__include, and am__quote
--    # from the Makefile without running 'make'.
--    DEPDIR=`sed -n 's/^DEPDIR = //p' < "$mf"`
--    test -z "$DEPDIR" && continue
--    am__include=`sed -n 's/^am__include = //p' < "$mf"`
--    test -z "$am__include" && continue
--    am__quote=`sed -n 's/^am__quote = //p' < "$mf"`
--    # Find all dependency output files, they are included files with
--    # $(DEPDIR) in their names.  We invoke sed twice because it is the
--    # simplest approach to changing $(DEPDIR) to its actual value in the
--    # expansion.
--    for file in `sed -n "
--      s/^$am__include $am__quote\(.*(DEPDIR).*\)$am__quote"'$/\1/p' <"$mf" | \
--	 sed -e 's/\$(DEPDIR)/'"$DEPDIR"'/g'`; do
--      # Make sure the directory exists.
--      test -f "$dirpart/$file" && continue
--      fdir=`$as_dirname -- "$file" ||
--$as_expr X"$file" : 'X\(.*[^/]\)//*[^/][^/]*/*$' \| \
--	 X"$file" : 'X\(//\)[^/]' \| \
--	 X"$file" : 'X\(//\)$' \| \
--	 X"$file" : 'X\(/\)' \| . 2>/dev/null ||
--$as_echo X"$file" |
--    sed '/^X\(.*[^/]\)\/\/*[^/][^/]*\/*$/{
--	    s//\1/
--	    q
--	  }
--	  /^X\(\/\/\)[^/].*/{
-+    am_filepart=`$as_basename -- "$am_mf" ||
-+$as_expr X/"$am_mf" : '.*/\([^/][^/]*\)/*$' \| \
-+	 X"$am_mf" : 'X\(//\)$' \| \
-+	 X"$am_mf" : 'X\(/\)' \| . 2>/dev/null ||
-+$as_echo X/"$am_mf" |
-+    sed '/^.*\/\([^/][^/]*\)\/*$/{
- 	    s//\1/
- 	    q
- 	  }
--	  /^X\(\/\/\)$/{
-+	  /^X\/\(\/\/\)$/{
- 	    s//\1/
- 	    q
- 	  }
--	  /^X\(\/\).*/{
-+	  /^X\/\(\/\).*/{
- 	    s//\1/
- 	    q
- 	  }
- 	  s/.*/./; q'`
--      as_dir=$dirpart/$fdir; as_fn_mkdir_p
--      # echo "creating $dirpart/$file"
--      echo '# dummy' > "$dirpart/$file"
--    done
-+    { echo "$as_me:$LINENO: cd "$am_dirpart" \
-+      && sed -e '/# am--include-marker/d' "$am_filepart" \
-+        | $MAKE -f - am--depfiles" >&5
-+   (cd "$am_dirpart" \
-+      && sed -e '/# am--include-marker/d' "$am_filepart" \
-+        | $MAKE -f - am--depfiles) >&5 2>&5
-+   ac_status=$?
-+   echo "$as_me:$LINENO: \$? = $ac_status" >&5
-+   (exit $ac_status); } || am_rc=$?
-   done
-+  if test $am_rc -ne 0; then
-+    { { $as_echo "$as_me:${as_lineno-$LINENO}: error: in \`$ac_pwd':" >&5
-+$as_echo "$as_me: error: in \`$ac_pwd':" >&2;}
-+as_fn_error $? "Something went wrong bootstrapping makefile fragments
-+    for automatic dependency tracking.  If GNU make was not used, consider
-+    re-running the configure script with MAKE=\"gmake\" (or whatever is
-+    necessary).  You can also try re-running configure with the
-+    '--disable-dependency-tracking' option to at least be able to build
-+    the package (albeit without support for automatic dependency tracking).
-+See \`config.log' for more details" "$LINENO" 5; }
-+  fi
-+  { am_dirpart=; unset am_dirpart;}
-+  { am_filepart=; unset am_filepart;}
-+  { am_mf=; unset am_mf;}
-+  { am_rc=; unset am_rc;}
-+  rm -f conftest-deps.mk
- }
-  ;;
-     "libtool":C)
-@@ -14524,7 +15205,8 @@ $as_echo X"$file" |
+@@ -14524,7 +15190,8 @@ $as_echo X"$file" |
  # NOTE: Changes made to this file will be lost: look at ltmain.sh.
  #
  #   Copyright (C) 1996, 1997, 1998, 1999, 2000, 2001, 2003, 2004, 2005,
@@ -23004,7 +21631,7 @@ index 4727eff533a..ca3885ad105 100755
  #   Written by Gordon Matzigkeit, 1996
  #
  #   This file is part of GNU Libtool.
-@@ -14627,19 +15309,42 @@ SP2NL=$lt_lt_SP2NL
+@@ -14627,19 +15294,42 @@ SP2NL=$lt_lt_SP2NL
  # turn newlines into spaces.
  NL2SP=$lt_lt_NL2SP
  
@@ -23048,7 +21675,7 @@ index 4727eff533a..ca3885ad105 100755
  # A symbol stripping program.
  STRIP=$lt_STRIP
  
-@@ -14669,6 +15374,12 @@ global_symbol_to_c_name_address=$lt_lt_cv_sys_global_symbol_to_c_name_address
+@@ -14669,6 +15359,12 @@ global_symbol_to_c_name_address=$lt_lt_cv_sys_global_symbol_to_c_name_address
  # Transform the output of nm in a C name address pair when lib prefix is needed.
  global_symbol_to_c_name_address_lib_prefix=$lt_lt_cv_sys_global_symbol_to_c_name_address_lib_prefix
  
@@ -23061,7 +21688,7 @@ index 4727eff533a..ca3885ad105 100755
  # The name of the directory that contains temporary libtool files.
  objdir=$objdir
  
-@@ -14678,6 +15389,9 @@ MAGIC_CMD=$MAGIC_CMD
+@@ -14678,6 +15374,9 @@ MAGIC_CMD=$MAGIC_CMD
  # Must we lock files when doing compilation?
  need_locks=$lt_need_locks
  
@@ -23071,7 +21698,7 @@ index 4727eff533a..ca3885ad105 100755
  # Tool to manipulate archived DWARF debug symbol files on Mac OS X.
  DSYMUTIL=$lt_DSYMUTIL
  
-@@ -14792,12 +15506,12 @@ with_gcc=$GCC
+@@ -14792,12 +15491,12 @@ with_gcc=$GCC
  # Compiler flag to turn off builtin functions.
  no_builtin_flag=$lt_lt_prog_compiler_no_builtin_flag
  
@@ -23087,7 +21714,7 @@ index 4727eff533a..ca3885ad105 100755
  # Compiler flag to prevent dynamic linking.
  link_static_flag=$lt_lt_prog_compiler_static
  
-@@ -14884,9 +15598,6 @@ inherit_rpath=$inherit_rpath
+@@ -14884,9 +15583,6 @@ inherit_rpath=$inherit_rpath
  # Whether libtool must link a program against all its dependency libraries.
  link_all_deplibs=$link_all_deplibs
  
@@ -23097,7 +21724,7 @@ index 4727eff533a..ca3885ad105 100755
  # Set to "yes" if exported symbols are required.
  always_export_symbols=$always_export_symbols
  
-@@ -14902,6 +15613,9 @@ include_expsyms=$lt_include_expsyms
+@@ -14902,6 +15598,9 @@ include_expsyms=$lt_include_expsyms
  # Commands necessary for linking programs (against libraries) with templates.
  prelink_cmds=$lt_prelink_cmds
  
@@ -23107,7 +21734,7 @@ index 4727eff533a..ca3885ad105 100755
  # Specify filename containing input files.
  file_list_spec=$lt_file_list_spec
  
-@@ -14934,210 +15648,169 @@ ltmain="$ac_aux_dir/ltmain.sh"
+@@ -14934,210 +15633,169 @@ ltmain="$ac_aux_dir/ltmain.sh"
    # if finds mixed CR/LF and LF-only lines.  Since sed operates in
    # text mode, it properly converts lines to CR/LF.  This bash problem
    # is reportedly fixed, but why not run on old versions too?
@@ -30526,10 +29153,10 @@ index 4399354e5a9..4b1625febf3 100644
  ac_ct_DUMPBIN = @ac_ct_DUMPBIN@
  am__include = @am__include@
 diff --git a/opcodes/configure b/opcodes/configure
-index b326512ce3c..03f2b1bd64b 100755
+index 3dd6b692f89..64e9ba9b587 100755
 --- a/opcodes/configure
 +++ b/opcodes/configure
-@@ -688,6 +688,9 @@ OTOOL
+@@ -686,6 +686,9 @@ OTOOL
  LIPO
  NMEDIT
  DSYMUTIL
@@ -30539,7 +29166,7 @@ index b326512ce3c..03f2b1bd64b 100755
  OBJDUMP
  LN_S
  NM
-@@ -806,6 +809,7 @@ enable_static
+@@ -804,6 +807,7 @@ enable_static
  with_pic
  enable_fast_install
  with_gnu_ld
@@ -30547,16 +29174,16 @@ index b326512ce3c..03f2b1bd64b 100755
  enable_libtool_lock
  enable_checking
  enable_targets
-@@ -1487,6 +1491,8 @@ Optional Packages:
-   --with-libintl-prefix[=DIR]  search for libintl in DIR/include and DIR/lib
-   --without-libintl-prefix     don't search for libintl in includedir and libdir
-   --with-libintl-type=TYPE     type of library to search for (auto/static/shared)
+@@ -1476,6 +1480,8 @@ Optional Packages:
+   --with-pic              try to use only PIC/non-PIC objects [default=use
+                           both]
+   --with-gnu-ld           assume the C compiler uses GNU ld [default=no]
 +  --with-libtool-sysroot=DIR Search for dependent libraries within DIR
 +                        (or the compiler's sysroot if not specified).
- 
- Some influential environment variables:
-   CC          C compiler command
-@@ -4995,8 +5001,8 @@ esac
+   --with-gnu-ld           assume the C compiler uses GNU ld default=no
+   --with-libiconv-prefix[=DIR]  search for libiconv in DIR/include and DIR/lib
+   --without-libiconv-prefix     don't search for libiconv in includedir and libdir
+@@ -4808,8 +4814,8 @@ esac
  
  
  
@@ -30567,7 +29194,7 @@ index b326512ce3c..03f2b1bd64b 100755
  
  
  
-@@ -5036,7 +5042,7 @@ ECHO=$ECHO$ECHO$ECHO$ECHO$ECHO$ECHO
+@@ -4849,7 +4855,7 @@ ECHO=$ECHO$ECHO$ECHO$ECHO$ECHO$ECHO
  { $as_echo "$as_me:${as_lineno-$LINENO}: checking how to print strings" >&5
  $as_echo_n "checking how to print strings... " >&6; }
  # Test print first, because it will be a builtin if present.
@@ -30576,7 +29203,7 @@ index b326512ce3c..03f2b1bd64b 100755
     test "X`print -r -- $ECHO 2>/dev/null`" = "X$ECHO"; then
    ECHO='print -r --'
  elif test "X`printf %s $ECHO 2>/dev/null`" = "X$ECHO"; then
-@@ -5729,8 +5735,8 @@ $as_echo_n "checking whether the shell understands some XSI constructs... " >&6;
+@@ -5542,8 +5548,8 @@ $as_echo_n "checking whether the shell understands some XSI constructs... " >&6;
  # Try some XSI features
  xsi_shell=no
  ( _lt_dummy="a/b/c"
@@ -30587,7 +29214,7 @@ index b326512ce3c..03f2b1bd64b 100755
      && eval 'test $(( 1 + 1 )) -eq 2 \
      && test "${#_lt_dummy}" -eq 5' ) >/dev/null 2>&1 \
    && xsi_shell=yes
-@@ -5779,6 +5785,80 @@ esac
+@@ -5592,6 +5598,80 @@ esac
  
  
  
@@ -30668,7 +29295,7 @@ index b326512ce3c..03f2b1bd64b 100755
  { $as_echo "$as_me:${as_lineno-$LINENO}: checking for $LD option to reload object files" >&5
  $as_echo_n "checking for $LD option to reload object files... " >&6; }
  if ${lt_cv_ld_reload_flag+:} false; then :
-@@ -5795,6 +5875,11 @@ case $reload_flag in
+@@ -5608,6 +5688,11 @@ case $reload_flag in
  esac
  reload_cmds='$LD$reload_flag -o $output$reload_objs'
  case $host_os in
@@ -30680,7 +29307,7 @@ index b326512ce3c..03f2b1bd64b 100755
    darwin*)
      if test "$GCC" = yes; then
        reload_cmds='$LTCC $LTCFLAGS -nostdlib ${wl}-r -o $output$reload_objs'
-@@ -5963,7 +6048,8 @@ mingw* | pw32*)
+@@ -5776,7 +5861,8 @@ mingw* | pw32*)
      lt_cv_deplibs_check_method='file_magic ^x86 archive import|^x86 DLL'
      lt_cv_file_magic_cmd='func_win32_libid'
    else
@@ -30690,7 +29317,7 @@ index b326512ce3c..03f2b1bd64b 100755
      lt_cv_file_magic_cmd='$OBJDUMP -f'
    fi
    ;;
-@@ -6122,6 +6208,21 @@ esac
+@@ -5935,6 +6021,21 @@ esac
  fi
  { $as_echo "$as_me:${as_lineno-$LINENO}: result: $lt_cv_deplibs_check_method" >&5
  $as_echo "$lt_cv_deplibs_check_method" >&6; }
@@ -30712,7 +29339,7 @@ index b326512ce3c..03f2b1bd64b 100755
  file_magic_cmd=$lt_cv_file_magic_cmd
  deplibs_check_method=$lt_cv_deplibs_check_method
  test -z "$deplibs_check_method" && deplibs_check_method=unknown
-@@ -6137,6 +6238,157 @@ test -z "$deplibs_check_method" && deplibs_check_method=unknown
+@@ -5950,6 +6051,157 @@ test -z "$deplibs_check_method" && deplibs_check_method=unknown
  
  
  
@@ -30870,7 +29497,7 @@ index b326512ce3c..03f2b1bd64b 100755
  plugin_option=
  plugin_names="liblto_plugin.so liblto_plugin-0.dll cyglto_plugin-0.dll"
  for plugin in $plugin_names; do
-@@ -6151,8 +6403,10 @@ for plugin in $plugin_names; do
+@@ -5964,8 +6216,10 @@ for plugin in $plugin_names; do
  done
  
  if test -n "$ac_tool_prefix"; then
@@ -30883,7 +29510,7 @@ index b326512ce3c..03f2b1bd64b 100755
  { $as_echo "$as_me:${as_lineno-$LINENO}: checking for $ac_word" >&5
  $as_echo_n "checking for $ac_word... " >&6; }
  if ${ac_cv_prog_AR+:} false; then :
-@@ -6168,7 +6422,7 @@ do
+@@ -5981,7 +6235,7 @@ do
    test -z "$as_dir" && as_dir=.
      for ac_exec_ext in '' $ac_executable_extensions; do
    if as_fn_executable_p "$as_dir/$ac_word$ac_exec_ext"; then
@@ -30892,7 +29519,7 @@ index b326512ce3c..03f2b1bd64b 100755
      $as_echo "$as_me:${as_lineno-$LINENO}: found $as_dir/$ac_word$ac_exec_ext" >&5
      break 2
    fi
-@@ -6188,11 +6442,15 @@ $as_echo "no" >&6; }
+@@ -6001,11 +6255,15 @@ $as_echo "no" >&6; }
  fi
  
  
@@ -30911,7 +29538,7 @@ index b326512ce3c..03f2b1bd64b 100755
  { $as_echo "$as_me:${as_lineno-$LINENO}: checking for $ac_word" >&5
  $as_echo_n "checking for $ac_word... " >&6; }
  if ${ac_cv_prog_ac_ct_AR+:} false; then :
-@@ -6208,7 +6466,7 @@ do
+@@ -6021,7 +6279,7 @@ do
    test -z "$as_dir" && as_dir=.
      for ac_exec_ext in '' $ac_executable_extensions; do
    if as_fn_executable_p "$as_dir/$ac_word$ac_exec_ext"; then
@@ -30920,7 +29547,7 @@ index b326512ce3c..03f2b1bd64b 100755
      $as_echo "$as_me:${as_lineno-$LINENO}: found $as_dir/$ac_word$ac_exec_ext" >&5
      break 2
    fi
-@@ -6227,6 +6485,10 @@ else
+@@ -6040,6 +6298,10 @@ else
  $as_echo "no" >&6; }
  fi
  
@@ -30931,7 +29558,7 @@ index b326512ce3c..03f2b1bd64b 100755
    if test "x$ac_ct_AR" = x; then
      AR="false"
    else
-@@ -6238,25 +6500,20 @@ ac_tool_warned=yes ;;
+@@ -6051,25 +6313,20 @@ ac_tool_warned=yes ;;
  esac
      AR=$ac_ct_AR
    fi
@@ -30967,7 +29594,7 @@ index b326512ce3c..03f2b1bd64b 100755
  
  
  
-@@ -6267,6 +6524,63 @@ test -z "$AR_FLAGS" && AR_FLAGS=cru
+@@ -6080,6 +6337,63 @@ test -z "$AR_FLAGS" && AR_FLAGS=cru
  
  
  
@@ -31031,7 +29658,7 @@ index b326512ce3c..03f2b1bd64b 100755
  
  if test -n "$ac_tool_prefix"; then
    # Extract the first word of "${ac_tool_prefix}strip", so it can be a program name with args.
-@@ -6607,8 +6921,8 @@ esac
+@@ -6420,8 +6734,8 @@ esac
  lt_cv_sys_global_symbol_to_cdecl="sed -n -e 's/^T .* \(.*\)$/extern int \1();/p' -e 's/^$symcode* .* \(.*\)$/extern char \1;/p'"
  
  # Transform an extracted symbol line into symbol name and symbol address
@@ -31042,7 +29669,7 @@ index b326512ce3c..03f2b1bd64b 100755
  
  # Handle CRLF in mingw tool chain
  opt_cr=
-@@ -6644,6 +6958,7 @@ for ac_symprfx in "" "_"; do
+@@ -6457,6 +6771,7 @@ for ac_symprfx in "" "_"; do
    else
      lt_cv_sys_global_symbol_pipe="sed -n -e 's/^.*[	 ]\($symcode$symcode*\)[	 ][	 ]*$ac_symprfx$sympat$opt_cr$/$symxfrm/p'"
    fi
@@ -31050,7 +29677,7 @@ index b326512ce3c..03f2b1bd64b 100755
  
    # Check to see that the pipe works correctly.
    pipe_works=no
-@@ -6685,6 +7000,18 @@ _LT_EOF
+@@ -6498,6 +6813,18 @@ _LT_EOF
        if $GREP ' nm_test_var$' "$nlist" >/dev/null; then
  	if $GREP ' nm_test_func$' "$nlist" >/dev/null; then
  	  cat <<_LT_EOF > conftest.$ac_ext
@@ -31069,7 +29696,7 @@ index b326512ce3c..03f2b1bd64b 100755
  #ifdef __cplusplus
  extern "C" {
  #endif
-@@ -6696,7 +7023,7 @@ _LT_EOF
+@@ -6509,7 +6836,7 @@ _LT_EOF
  	  cat <<_LT_EOF >> conftest.$ac_ext
  
  /* The mapping between symbol names and symbols.  */
@@ -31078,7 +29705,7 @@ index b326512ce3c..03f2b1bd64b 100755
    const char *name;
    void       *address;
  }
-@@ -6722,8 +7049,8 @@ static const void *lt_preloaded_setup() {
+@@ -6535,8 +6862,8 @@ static const void *lt_preloaded_setup() {
  _LT_EOF
  	  # Now try linking the two files.
  	  mv conftest.$ac_objext conftstm.$ac_objext
@@ -31089,7 +29716,7 @@ index b326512ce3c..03f2b1bd64b 100755
  	  LIBS="conftstm.$ac_objext"
  	  CFLAGS="$CFLAGS$lt_prog_compiler_no_builtin_flag"
  	  if { { eval echo "\"\$as_me\":${as_lineno-$LINENO}: \"$ac_link\""; } >&5
-@@ -6733,8 +7060,8 @@ _LT_EOF
+@@ -6546,8 +6873,8 @@ _LT_EOF
    test $ac_status = 0; } && test -s conftest${ac_exeext}; then
  	    pipe_works=yes
  	  fi
@@ -31100,7 +29727,7 @@ index b326512ce3c..03f2b1bd64b 100755
  	else
  	  echo "cannot find nm_test_func in $nlist" >&5
  	fi
-@@ -6771,6 +7098,14 @@ else
+@@ -6584,6 +6911,14 @@ else
  $as_echo "ok" >&6; }
  fi
  
@@ -31115,7 +29742,7 @@ index b326512ce3c..03f2b1bd64b 100755
  
  
  
-@@ -6789,6 +7124,47 @@ fi
+@@ -6602,6 +6937,47 @@ fi
  
  
  
@@ -31163,7 +29790,7 @@ index b326512ce3c..03f2b1bd64b 100755
  
  
  
-@@ -6998,6 +7374,123 @@ esac
+@@ -6811,6 +7187,123 @@ esac
  
  need_locks="$enable_libtool_lock"
  
@@ -31287,7 +29914,7 @@ index b326512ce3c..03f2b1bd64b 100755
  
    case $host_os in
      rhapsody* | darwin*)
-@@ -7561,6 +8054,8 @@ _LT_EOF
+@@ -7374,6 +7867,8 @@ _LT_EOF
        $LTCC $LTCFLAGS -c -o conftest.o conftest.c 2>&5
        echo "$AR cru libconftest.a conftest.o" >&5
        $AR cru libconftest.a conftest.o 2>&5
@@ -31296,7 +29923,7 @@ index b326512ce3c..03f2b1bd64b 100755
        cat > conftest.c << _LT_EOF
  int main() { return 0;}
  _LT_EOF
-@@ -8115,8 +8610,6 @@ fi
+@@ -7928,8 +8423,6 @@ fi
  lt_prog_compiler_pic=
  lt_prog_compiler_static=
  
@@ -31305,7 +29932,7 @@ index b326512ce3c..03f2b1bd64b 100755
  
    if test "$GCC" = yes; then
      lt_prog_compiler_wl='-Wl,'
-@@ -8282,6 +8775,12 @@ $as_echo_n "checking for $compiler option to produce PIC... " >&6; }
+@@ -8095,6 +8588,12 @@ $as_echo_n "checking for $compiler option to produce PIC... " >&6; }
  	lt_prog_compiler_pic='--shared'
  	lt_prog_compiler_static='--static'
  	;;
@@ -31318,7 +29945,7 @@ index b326512ce3c..03f2b1bd64b 100755
        pgcc* | pgf77* | pgf90* | pgf95* | pgfortran*)
          # Portland Group compilers (*not* the Pentium gcc compiler,
  	# which looks to be a dead project)
-@@ -8344,7 +8843,7 @@ $as_echo_n "checking for $compiler option to produce PIC... " >&6; }
+@@ -8157,7 +8656,7 @@ $as_echo_n "checking for $compiler option to produce PIC... " >&6; }
        lt_prog_compiler_pic='-KPIC'
        lt_prog_compiler_static='-Bstatic'
        case $cc_basename in
@@ -31327,7 +29954,7 @@ index b326512ce3c..03f2b1bd64b 100755
  	lt_prog_compiler_wl='-Qoption ld ';;
        *)
  	lt_prog_compiler_wl='-Wl,';;
-@@ -8401,13 +8900,17 @@ case $host_os in
+@@ -8214,13 +8713,17 @@ case $host_os in
      lt_prog_compiler_pic="$lt_prog_compiler_pic -DPIC"
      ;;
  esac
@@ -31351,7 +29978,7 @@ index b326512ce3c..03f2b1bd64b 100755
  
  #
  # Check to make sure the PIC flag actually works.
-@@ -8468,6 +8971,11 @@ fi
+@@ -8281,6 +8784,11 @@ fi
  
  
  
@@ -31363,7 +29990,7 @@ index b326512ce3c..03f2b1bd64b 100755
  #
  # Check to make sure the static flag actually works.
  #
-@@ -8818,7 +9326,8 @@ _LT_EOF
+@@ -8631,7 +9139,8 @@ _LT_EOF
        allow_undefined_flag=unsupported
        always_export_symbols=no
        enable_shared_with_static_runtimes=yes
@@ -31373,7 +30000,7 @@ index b326512ce3c..03f2b1bd64b 100755
  
        if $LD --help 2>&1 | $GREP 'auto-import' > /dev/null; then
          archive_cmds='$CC -shared $libobjs $deplibs $compiler_flags -o $output_objdir/$soname ${wl}--enable-auto-image-base -Xlinker --out-implib -Xlinker $lib'
-@@ -8917,12 +9426,12 @@ _LT_EOF
+@@ -8730,12 +9239,12 @@ _LT_EOF
  	  whole_archive_flag_spec='--whole-archive$convenience --no-whole-archive'
  	  hardcode_libdir_flag_spec=
  	  hardcode_libdir_flag_spec_ld='-rpath $libdir'
@@ -31388,7 +30015,7 @@ index b326512ce3c..03f2b1bd64b 100755
  	  fi
  	  ;;
  	esac
-@@ -8936,8 +9445,8 @@ _LT_EOF
+@@ -8749,8 +9258,8 @@ _LT_EOF
  	archive_cmds='$LD -Bshareable $libobjs $deplibs $linker_flags -o $lib'
  	wlarc=
        else
@@ -31399,7 +30026,7 @@ index b326512ce3c..03f2b1bd64b 100755
        fi
        ;;
  
-@@ -8955,8 +9464,8 @@ _LT_EOF
+@@ -8768,8 +9277,8 @@ _LT_EOF
  
  _LT_EOF
        elif $LD --help 2>&1 | $GREP ': supported targets:.* elf' > /dev/null; then
@@ -31410,7 +30037,7 @@ index b326512ce3c..03f2b1bd64b 100755
        else
  	ld_shlibs=no
        fi
-@@ -9002,8 +9511,8 @@ _LT_EOF
+@@ -8815,8 +9324,8 @@ _LT_EOF
  
      *)
        if $LD --help 2>&1 | $GREP ': supported targets:.* elf' > /dev/null; then
@@ -31421,7 +30048,7 @@ index b326512ce3c..03f2b1bd64b 100755
        else
  	ld_shlibs=no
        fi
-@@ -9133,7 +9642,13 @@ _LT_EOF
+@@ -8946,7 +9455,13 @@ _LT_EOF
  	allow_undefined_flag='-berok'
          # Determine the default libpath from the value encoded in an
          # empty executable.
@@ -31436,7 +30063,7 @@ index b326512ce3c..03f2b1bd64b 100755
  /* end confdefs.h.  */
  
  int
-@@ -9146,22 +9661,29 @@ main ()
+@@ -8959,22 +9474,29 @@ main ()
  _ACEOF
  if ac_fn_c_try_link "$LINENO"; then :
  
@@ -31479,7 +30106,7 @@ index b326512ce3c..03f2b1bd64b 100755
  
          hardcode_libdir_flag_spec='${wl}-blibpath:$libdir:'"$aix_libpath"
          archive_expsym_cmds='$CC -o $output_objdir/$soname $libobjs $deplibs '"\${wl}$no_entry_flag"' $compiler_flags `if test "x${allow_undefined_flag}" != "x"; then func_echo_all "${wl}${allow_undefined_flag}"; else :; fi` '"\${wl}$exp_sym_flag:\$export_symbols $shared_flag"
-@@ -9173,7 +9695,13 @@ if test -z "$aix_libpath"; then aix_libpath="/usr/lib:/lib"; fi
+@@ -8986,7 +9508,13 @@ if test -z "$aix_libpath"; then aix_libpath="/usr/lib:/lib"; fi
  	else
  	 # Determine the default libpath from the value encoded in an
  	 # empty executable.
@@ -31494,7 +30121,7 @@ index b326512ce3c..03f2b1bd64b 100755
  /* end confdefs.h.  */
  
  int
-@@ -9186,22 +9714,29 @@ main ()
+@@ -8999,22 +9527,29 @@ main ()
  _ACEOF
  if ac_fn_c_try_link "$LINENO"; then :
  
@@ -31537,7 +30164,7 @@ index b326512ce3c..03f2b1bd64b 100755
  
  	 hardcode_libdir_flag_spec='${wl}-blibpath:$libdir:'"$aix_libpath"
  	  # Warning - without using the other run time loading flags,
-@@ -9246,20 +9781,63 @@ if test -z "$aix_libpath"; then aix_libpath="/usr/lib:/lib"; fi
+@@ -9059,20 +9594,63 @@ if test -z "$aix_libpath"; then aix_libpath="/usr/lib:/lib"; fi
        # Microsoft Visual C++.
        # hardcode_libdir_flag_spec is actually meaningless, as there is
        # no search path for DLLs.
@@ -31615,7 +30242,7 @@ index b326512ce3c..03f2b1bd64b 100755
        ;;
  
      darwin* | rhapsody*)
-@@ -9320,7 +9898,7 @@ if test -z "$aix_libpath"; then aix_libpath="/usr/lib:/lib"; fi
+@@ -9133,7 +9711,7 @@ if test -z "$aix_libpath"; then aix_libpath="/usr/lib:/lib"; fi
  
      # FreeBSD 3 and greater uses gcc -shared to do shared libraries.
      freebsd* | dragonfly*)
@@ -31624,7 +30251,7 @@ index b326512ce3c..03f2b1bd64b 100755
        hardcode_libdir_flag_spec='-R$libdir'
        hardcode_direct=yes
        hardcode_shlibpath_var=no
-@@ -9328,7 +9906,7 @@ if test -z "$aix_libpath"; then aix_libpath="/usr/lib:/lib"; fi
+@@ -9141,7 +9719,7 @@ if test -z "$aix_libpath"; then aix_libpath="/usr/lib:/lib"; fi
  
      hpux9*)
        if test "$GCC" = yes; then
@@ -31633,7 +30260,7 @@ index b326512ce3c..03f2b1bd64b 100755
        else
  	archive_cmds='$RM $output_objdir/$soname~$LD -b +b $install_libdir -o $output_objdir/$soname $libobjs $deplibs $linker_flags~test $output_objdir/$soname = $lib || mv $output_objdir/$soname $lib'
        fi
-@@ -9344,7 +9922,7 @@ if test -z "$aix_libpath"; then aix_libpath="/usr/lib:/lib"; fi
+@@ -9157,7 +9735,7 @@ if test -z "$aix_libpath"; then aix_libpath="/usr/lib:/lib"; fi
  
      hpux10*)
        if test "$GCC" = yes && test "$with_gnu_ld" = no; then
@@ -31642,7 +30269,7 @@ index b326512ce3c..03f2b1bd64b 100755
        else
  	archive_cmds='$LD -b +h $soname +b $install_libdir -o $lib $libobjs $deplibs $linker_flags'
        fi
-@@ -9368,10 +9946,10 @@ if test -z "$aix_libpath"; then aix_libpath="/usr/lib:/lib"; fi
+@@ -9181,10 +9759,10 @@ if test -z "$aix_libpath"; then aix_libpath="/usr/lib:/lib"; fi
  	  archive_cmds='$CC -shared ${wl}+h ${wl}$soname ${wl}+nodefaultrpath -o $lib $libobjs $deplibs $compiler_flags'
  	  ;;
  	ia64*)
@@ -31655,7 +30282,7 @@ index b326512ce3c..03f2b1bd64b 100755
  	  ;;
  	esac
        else
-@@ -9450,23 +10028,36 @@ fi
+@@ -9263,23 +9841,36 @@ fi
  
      irix5* | irix6* | nonstopux*)
        if test "$GCC" = yes; then
@@ -31700,7 +30327,7 @@ index b326512ce3c..03f2b1bd64b 100755
        else
  	archive_cmds='$CC -shared $libobjs $deplibs $compiler_flags -soname $soname `test -n "$verstring" && func_echo_all "-set_version $verstring"` -update_registry ${output_objdir}/so_locations -o $lib'
  	archive_expsym_cmds='$CC -shared $libobjs $deplibs $compiler_flags -soname $soname `test -n "$verstring" && func_echo_all "-set_version $verstring"` -update_registry ${output_objdir}/so_locations -exports_file $export_symbols -o $lib'
-@@ -9551,7 +10142,7 @@ rm -f core conftest.err conftest.$ac_objext \
+@@ -9364,7 +9955,7 @@ rm -f core conftest.err conftest.$ac_objext \
      osf4* | osf5*)	# as osf3* with the addition of -msym flag
        if test "$GCC" = yes; then
  	allow_undefined_flag=' ${wl}-expect_unresolved ${wl}\*'
@@ -31709,7 +30336,7 @@ index b326512ce3c..03f2b1bd64b 100755
  	hardcode_libdir_flag_spec='${wl}-rpath ${wl}$libdir'
        else
  	allow_undefined_flag=' -expect_unresolved \*'
-@@ -9570,9 +10161,9 @@ rm -f core conftest.err conftest.$ac_objext \
+@@ -9383,9 +9974,9 @@ rm -f core conftest.err conftest.$ac_objext \
        no_undefined_flag=' -z defs'
        if test "$GCC" = yes; then
  	wlarc='${wl}'
@@ -31721,7 +30348,7 @@ index b326512ce3c..03f2b1bd64b 100755
        else
  	case `$CC -V 2>&1` in
  	*"Compilers 5.0"*)
-@@ -10148,8 +10739,9 @@ cygwin* | mingw* | pw32* | cegcc*)
+@@ -9961,8 +10552,9 @@ cygwin* | mingw* | pw32* | cegcc*)
    need_version=no
    need_lib_prefix=no
  
@@ -31733,7 +30360,7 @@ index b326512ce3c..03f2b1bd64b 100755
      library_names_spec='$libname.dll.a'
      # DLL is installed to $(libdir)/../bin by postinstall_cmds
      postinstall_cmds='base_file=`basename \${file}`~
-@@ -10182,13 +10774,71 @@ cygwin* | mingw* | pw32* | cegcc*)
+@@ -9995,13 +10587,71 @@ cygwin* | mingw* | pw32* | cegcc*)
        library_names_spec='`echo ${libname} | sed -e 's/^lib/pw/'``echo ${release} | $SED -e 's/[.]/-/g'`${versuffix}${shared_ext}'
        ;;
      esac
@@ -31806,16 +30433,16 @@ index b326512ce3c..03f2b1bd64b 100755
    # FIXME: first we should search . and the directory the executable is in
    shlibpath_var=PATH
    ;;
-@@ -11090,7 +11740,7 @@ else
+@@ -10903,7 +11553,7 @@ else
    lt_dlunknown=0; lt_dlno_uscore=1; lt_dlneed_uscore=2
    lt_status=$lt_dlunknown
    cat > conftest.$ac_ext <<_LT_EOF
--#line 11093 "configure"
+-#line 10906 "configure"
 +#line $LINENO "configure"
  #include "confdefs.h"
  
  #if HAVE_DLFCN_H
-@@ -11134,10 +11784,10 @@ else
+@@ -10947,10 +11597,10 @@ else
  /* When -fvisbility=hidden is used, assume the code has been annotated
     correspondingly for the symbols needed.  */
  #if defined(__GNUC__) && (((__GNUC__ == 3) && (__GNUC_MINOR__ >= 3)) || (__GNUC__ > 3))
@@ -31828,16 +30455,16 @@ index b326512ce3c..03f2b1bd64b 100755
  int main ()
  {
    void *self = dlopen (0, LT_DLGLOBAL|LT_DLLAZY_OR_NOW);
-@@ -11196,7 +11846,7 @@ else
+@@ -11009,7 +11659,7 @@ else
    lt_dlunknown=0; lt_dlno_uscore=1; lt_dlneed_uscore=2
    lt_status=$lt_dlunknown
    cat > conftest.$ac_ext <<_LT_EOF
--#line 11199 "configure"
+-#line 11012 "configure"
 +#line $LINENO "configure"
  #include "confdefs.h"
  
  #if HAVE_DLFCN_H
-@@ -11240,10 +11890,10 @@ else
+@@ -11053,10 +11703,10 @@ else
  /* When -fvisbility=hidden is used, assume the code has been annotated
     correspondingly for the symbols needed.  */
  #if defined(__GNUC__) && (((__GNUC__ == 3) && (__GNUC_MINOR__ >= 3)) || (__GNUC__ > 3))
@@ -31850,7 +30477,7 @@ index b326512ce3c..03f2b1bd64b 100755
  int main ()
  {
    void *self = dlopen (0, LT_DLGLOBAL|LT_DLLAZY_OR_NOW);
-@@ -15348,13 +15998,20 @@ exeext='`$ECHO "$exeext" | $SED "$delay_single_quote_subst"`'
+@@ -14846,13 +15496,20 @@ exeext='`$ECHO "$exeext" | $SED "$delay_single_quote_subst"`'
  lt_unset='`$ECHO "$lt_unset" | $SED "$delay_single_quote_subst"`'
  lt_SP2NL='`$ECHO "$lt_SP2NL" | $SED "$delay_single_quote_subst"`'
  lt_NL2SP='`$ECHO "$lt_NL2SP" | $SED "$delay_single_quote_subst"`'
@@ -31871,7 +30498,7 @@ index b326512ce3c..03f2b1bd64b 100755
  STRIP='`$ECHO "$STRIP" | $SED "$delay_single_quote_subst"`'
  RANLIB='`$ECHO "$RANLIB" | $SED "$delay_single_quote_subst"`'
  old_postinstall_cmds='`$ECHO "$old_postinstall_cmds" | $SED "$delay_single_quote_subst"`'
-@@ -15369,14 +16026,17 @@ lt_cv_sys_global_symbol_pipe='`$ECHO "$lt_cv_sys_global_symbol_pipe" | $SED "$de
+@@ -14867,14 +15524,17 @@ lt_cv_sys_global_symbol_pipe='`$ECHO "$lt_cv_sys_global_symbol_pipe" | $SED "$de
  lt_cv_sys_global_symbol_to_cdecl='`$ECHO "$lt_cv_sys_global_symbol_to_cdecl" | $SED "$delay_single_quote_subst"`'
  lt_cv_sys_global_symbol_to_c_name_address='`$ECHO "$lt_cv_sys_global_symbol_to_c_name_address" | $SED "$delay_single_quote_subst"`'
  lt_cv_sys_global_symbol_to_c_name_address_lib_prefix='`$ECHO "$lt_cv_sys_global_symbol_to_c_name_address_lib_prefix" | $SED "$delay_single_quote_subst"`'
@@ -31890,7 +30517,7 @@ index b326512ce3c..03f2b1bd64b 100755
  DSYMUTIL='`$ECHO "$DSYMUTIL" | $SED "$delay_single_quote_subst"`'
  NMEDIT='`$ECHO "$NMEDIT" | $SED "$delay_single_quote_subst"`'
  LIPO='`$ECHO "$LIPO" | $SED "$delay_single_quote_subst"`'
-@@ -15409,12 +16069,12 @@ hardcode_shlibpath_var='`$ECHO "$hardcode_shlibpath_var" | $SED "$delay_single_q
+@@ -14907,12 +15567,12 @@ hardcode_shlibpath_var='`$ECHO "$hardcode_shlibpath_var" | $SED "$delay_single_q
  hardcode_automatic='`$ECHO "$hardcode_automatic" | $SED "$delay_single_quote_subst"`'
  inherit_rpath='`$ECHO "$inherit_rpath" | $SED "$delay_single_quote_subst"`'
  link_all_deplibs='`$ECHO "$link_all_deplibs" | $SED "$delay_single_quote_subst"`'
@@ -31904,7 +30531,7 @@ index b326512ce3c..03f2b1bd64b 100755
  file_list_spec='`$ECHO "$file_list_spec" | $SED "$delay_single_quote_subst"`'
  variables_saved_for_relink='`$ECHO "$variables_saved_for_relink" | $SED "$delay_single_quote_subst"`'
  need_lib_prefix='`$ECHO "$need_lib_prefix" | $SED "$delay_single_quote_subst"`'
-@@ -15469,8 +16129,13 @@ reload_flag \
+@@ -14967,8 +15627,13 @@ reload_flag \
  OBJDUMP \
  deplibs_check_method \
  file_magic_cmd \
@@ -31918,7 +30545,7 @@ index b326512ce3c..03f2b1bd64b 100755
  STRIP \
  RANLIB \
  CC \
-@@ -15480,12 +16145,14 @@ lt_cv_sys_global_symbol_pipe \
+@@ -14978,12 +15643,14 @@ lt_cv_sys_global_symbol_pipe \
  lt_cv_sys_global_symbol_to_cdecl \
  lt_cv_sys_global_symbol_to_c_name_address \
  lt_cv_sys_global_symbol_to_c_name_address_lib_prefix \
@@ -31934,7 +30561,7 @@ index b326512ce3c..03f2b1bd64b 100755
  DSYMUTIL \
  NMEDIT \
  LIPO \
-@@ -15501,7 +16168,6 @@ no_undefined_flag \
+@@ -14999,7 +15666,6 @@ no_undefined_flag \
  hardcode_libdir_flag_spec \
  hardcode_libdir_flag_spec_ld \
  hardcode_libdir_separator \
@@ -31942,7 +30569,7 @@ index b326512ce3c..03f2b1bd64b 100755
  exclude_expsyms \
  include_expsyms \
  file_list_spec \
-@@ -15537,6 +16203,7 @@ module_cmds \
+@@ -15035,6 +15701,7 @@ module_cmds \
  module_expsym_cmds \
  export_symbols_cmds \
  prelink_cmds \
@@ -31950,7 +30577,7 @@ index b326512ce3c..03f2b1bd64b 100755
  postinstall_cmds \
  postuninstall_cmds \
  finish_cmds \
-@@ -16310,7 +16977,8 @@ $as_echo X"$file" |
+@@ -15800,7 +16467,8 @@ $as_echo X"$file" |
  # NOTE: Changes made to this file will be lost: look at ltmain.sh.
  #
  #   Copyright (C) 1996, 1997, 1998, 1999, 2000, 2001, 2003, 2004, 2005,
@@ -31960,7 +30587,7 @@ index b326512ce3c..03f2b1bd64b 100755
  #   Written by Gordon Matzigkeit, 1996
  #
  #   This file is part of GNU Libtool.
-@@ -16413,19 +17081,42 @@ SP2NL=$lt_lt_SP2NL
+@@ -15903,19 +16571,42 @@ SP2NL=$lt_lt_SP2NL
  # turn newlines into spaces.
  NL2SP=$lt_lt_NL2SP
  
@@ -32004,7 +30631,7 @@ index b326512ce3c..03f2b1bd64b 100755
  # A symbol stripping program.
  STRIP=$lt_STRIP
  
-@@ -16455,6 +17146,12 @@ global_symbol_to_c_name_address=$lt_lt_cv_sys_global_symbol_to_c_name_address
+@@ -15945,6 +16636,12 @@ global_symbol_to_c_name_address=$lt_lt_cv_sys_global_symbol_to_c_name_address
  # Transform the output of nm in a C name address pair when lib prefix is needed.
  global_symbol_to_c_name_address_lib_prefix=$lt_lt_cv_sys_global_symbol_to_c_name_address_lib_prefix
  
@@ -32017,7 +30644,7 @@ index b326512ce3c..03f2b1bd64b 100755
  # The name of the directory that contains temporary libtool files.
  objdir=$objdir
  
-@@ -16464,6 +17161,9 @@ MAGIC_CMD=$MAGIC_CMD
+@@ -15954,6 +16651,9 @@ MAGIC_CMD=$MAGIC_CMD
  # Must we lock files when doing compilation?
  need_locks=$lt_need_locks
  
@@ -32027,7 +30654,7 @@ index b326512ce3c..03f2b1bd64b 100755
  # Tool to manipulate archived DWARF debug symbol files on Mac OS X.
  DSYMUTIL=$lt_DSYMUTIL
  
-@@ -16578,12 +17278,12 @@ with_gcc=$GCC
+@@ -16068,12 +16768,12 @@ with_gcc=$GCC
  # Compiler flag to turn off builtin functions.
  no_builtin_flag=$lt_lt_prog_compiler_no_builtin_flag
  
@@ -32043,7 +30670,7 @@ index b326512ce3c..03f2b1bd64b 100755
  # Compiler flag to prevent dynamic linking.
  link_static_flag=$lt_lt_prog_compiler_static
  
-@@ -16670,9 +17370,6 @@ inherit_rpath=$inherit_rpath
+@@ -16160,9 +16860,6 @@ inherit_rpath=$inherit_rpath
  # Whether libtool must link a program against all its dependency libraries.
  link_all_deplibs=$link_all_deplibs
  
@@ -32053,7 +30680,7 @@ index b326512ce3c..03f2b1bd64b 100755
  # Set to "yes" if exported symbols are required.
  always_export_symbols=$always_export_symbols
  
-@@ -16688,6 +17385,9 @@ include_expsyms=$lt_include_expsyms
+@@ -16178,6 +16875,9 @@ include_expsyms=$lt_include_expsyms
  # Commands necessary for linking programs (against libraries) with templates.
  prelink_cmds=$lt_prelink_cmds
  
@@ -32063,7 +30690,7 @@ index b326512ce3c..03f2b1bd64b 100755
  # Specify filename containing input files.
  file_list_spec=$lt_file_list_spec
  
-@@ -16720,210 +17420,169 @@ ltmain="$ac_aux_dir/ltmain.sh"
+@@ -16210,210 +16910,169 @@ ltmain="$ac_aux_dir/ltmain.sh"
    # if finds mixed CR/LF and LF-only lines.  Since sed operates in
    # text mode, it properly converts lines to CR/LF.  This bash problem
    # is reportedly fixed, but why not run on old versions too?
diff --git a/meta/recipes-devtools/binutils/binutils/0009-Fix-rpath-in-libtool-when-sysroot-is-enabled.patch b/meta/recipes-devtools/binutils/binutils/0009-Fix-rpath-in-libtool-when-sysroot-is-enabled.patch
index 18f1e90aade..c1e7b984fdc 100644
--- a/meta/recipes-devtools/binutils/binutils/0009-Fix-rpath-in-libtool-when-sysroot-is-enabled.patch
+++ b/meta/recipes-devtools/binutils/binutils/0009-Fix-rpath-in-libtool-when-sysroot-is-enabled.patch
@@ -1,4 +1,4 @@
-From 1967fbe2cbbb039e3b54666b55f6456325c58e91 Mon Sep 17 00:00:00 2001
+From da88907333b1c7d6227cd9a4a7e7469c07580c2d Mon Sep 17 00:00:00 2001
 From: Khem Raj <raj.khem@gmail.com>
 Date: Mon, 2 Mar 2015 01:42:38 +0000
 Subject: [PATCH] Fix rpath in libtool when sysroot is enabled
diff --git a/meta/recipes-devtools/binutils/binutils/0010-sync-with-OE-libtool-changes.patch b/meta/recipes-devtools/binutils/binutils/0010-sync-with-OE-libtool-changes.patch
index fb1463c4e21..20317474bd9 100644
--- a/meta/recipes-devtools/binutils/binutils/0010-sync-with-OE-libtool-changes.patch
+++ b/meta/recipes-devtools/binutils/binutils/0010-sync-with-OE-libtool-changes.patch
@@ -1,4 +1,4 @@
-From 6b37e476ee9f7feac837063cd0ca8e634fb76f90 Mon Sep 17 00:00:00 2001
+From a876af7b3e426b746890b8b8c0e7dcea4fcdc4b9 Mon Sep 17 00:00:00 2001
 From: Ross Burton <ross.burton@intel.com>
 Date: Mon, 6 Mar 2017 23:33:27 -0800
 Subject: [PATCH] sync with OE libtool changes
diff --git a/meta/recipes-devtools/binutils/binutils/0011-Check-for-clang-before-checking-gcc-version.patch b/meta/recipes-devtools/binutils/binutils/0011-Check-for-clang-before-checking-gcc-version.patch
index ddba0c33b63..1e35056c13a 100644
--- a/meta/recipes-devtools/binutils/binutils/0011-Check-for-clang-before-checking-gcc-version.patch
+++ b/meta/recipes-devtools/binutils/binutils/0011-Check-for-clang-before-checking-gcc-version.patch
@@ -1,4 +1,4 @@
-From 8942cfa25f5822d88f990c3a939c0a4f7832a0e2 Mon Sep 17 00:00:00 2001
+From 9bad9efbe713d72ca7ba01b19dcd5c34031ff6b1 Mon Sep 17 00:00:00 2001
 From: Khem Raj <raj.khem@gmail.com>
 Date: Wed, 15 Apr 2020 14:17:20 -0700
 Subject: [PATCH] Check for clang before checking gcc version
diff --git a/meta/recipes-devtools/binutils/binutils/0012-Only-generate-an-RPATH-entry-if-LD_RUN_PATH-is-not-e.patch b/meta/recipes-devtools/binutils/binutils/0012-Only-generate-an-RPATH-entry-if-LD_RUN_PATH-is-not-e.patch
index 9abd85538fb..a711917e903 100644
--- a/meta/recipes-devtools/binutils/binutils/0012-Only-generate-an-RPATH-entry-if-LD_RUN_PATH-is-not-e.patch
+++ b/meta/recipes-devtools/binutils/binutils/0012-Only-generate-an-RPATH-entry-if-LD_RUN_PATH-is-not-e.patch
@@ -1,4 +1,4 @@
-From fecc7af84b2735fad82da304fce37f373d2c0f53 Mon Sep 17 00:00:00 2001
+From 59998ac2c7ebc871587a4b02e003f654673b1629 Mon Sep 17 00:00:00 2001
 From: Khem Raj <raj.khem@gmail.com>
 Date: Thu, 10 Mar 2022 21:21:33 -0800
 Subject: [PATCH] Only generate an RPATH entry if LD_RUN_PATH is not empty
@@ -14,7 +14,7 @@ Signed-off-by: Khem Raj <raj.khem@gmail.com>
  1 file changed, 5 insertions(+)
 
 diff --git a/ld/ldelf.c b/ld/ldelf.c
-index f6f3ac11a76..77442fdc964 100644
+index a870c39bd81..82e41ff5785 100644
 --- a/ld/ldelf.c
 +++ b/ld/ldelf.c
 @@ -1134,6 +1134,9 @@ ldelf_handle_dt_needed (struct elf_link_hash_table *htab,
@@ -27,7 +27,7 @@ index f6f3ac11a76..77442fdc964 100644
  		  if (path
  		      && ldelf_search_needed (path, &n, force,
  					      is_linux, elfsize))
-@@ -1811,6 +1814,8 @@ ldelf_before_allocation (char *audit, char *depaudit,
+@@ -1808,6 +1811,8 @@ ldelf_before_allocation (char **audit, char **depaudit,
    rpath = command_line.rpath;
    if (rpath == NULL)
      rpath = (const char *) getenv ("LD_RUN_PATH");
diff --git a/meta/recipes-devtools/binutils/binutils/0013-Define-alignof-using-_Alignof-when-using-C11-or-newe.patch b/meta/recipes-devtools/binutils/binutils/0013-Define-alignof-using-_Alignof-when-using-C11-or-newe.patch
index b075d9c58ba..3e5747a1809 100644
--- a/meta/recipes-devtools/binutils/binutils/0013-Define-alignof-using-_Alignof-when-using-C11-or-newe.patch
+++ b/meta/recipes-devtools/binutils/binutils/0013-Define-alignof-using-_Alignof-when-using-C11-or-newe.patch
@@ -1,4 +1,4 @@
-From ea68b64a00dd236c6e062a9403bf8a4b2234aaa5 Mon Sep 17 00:00:00 2001
+From 4e9b1d2b54289068f36bd572e378662c720351d4 Mon Sep 17 00:00:00 2001
 From: Khem Raj <raj.khem@gmail.com>
 Date: Sun, 15 Jan 2023 00:16:25 -0800
 Subject: [PATCH] Define alignof using _Alignof when using C11 or newer
diff --git a/meta/recipes-devtools/binutils/binutils/0014-Remove-duplicate-pe-dll.o-entry-deom-targ_extra_ofil.patch b/meta/recipes-devtools/binutils/binutils/0014-Remove-duplicate-pe-dll.o-entry-deom-targ_extra_ofil.patch
index 411994b3427..1fa1e33ff3c 100644
--- a/meta/recipes-devtools/binutils/binutils/0014-Remove-duplicate-pe-dll.o-entry-deom-targ_extra_ofil.patch
+++ b/meta/recipes-devtools/binutils/binutils/0014-Remove-duplicate-pe-dll.o-entry-deom-targ_extra_ofil.patch
@@ -1,4 +1,4 @@
-From f40157cc203a8c8348fb9a39d9fd830d6b4b23f7 Mon Sep 17 00:00:00 2001
+From a17eacebc6a652a83577cbdf65b4ea3161090aac Mon Sep 17 00:00:00 2001
 From: Khem Raj <raj.khem@gmail.com>
 Date: Wed, 18 Jan 2023 19:35:07 -0800
 Subject: [PATCH] Remove duplicate pe-dll.o entry deom targ_extra_ofiles
diff --git a/meta/recipes-devtools/binutils/binutils/0015-CVE-2025-1178.patch b/meta/recipes-devtools/binutils/binutils/0015-CVE-2025-1178.patch
deleted file mode 100644
index c39f43fba47..00000000000
--- a/meta/recipes-devtools/binutils/binutils/0015-CVE-2025-1178.patch
+++ /dev/null
@@ -1,33 +0,0 @@
-From 75086e9de1707281172cc77f178e7949a4414ed0 Mon Sep 17 00:00:00 2001
-From: Nick Clifton <nickc@redhat.com>
-Date: Wed, 5 Feb 2025 13:26:51 +0000
-Subject: [PATCH] Prevent an abort in the bfd linker when attempting to
- generate dynamic relocs for a corrupt input file.
-
-PR 32638
-
-Upstream-Status: Backport [https://sourceware.org/git/?p=binutils-gdb.git;a=patch;h=75086e9de1707281172cc77f178e7949a4414ed0]
-CVE: CVE-2025-1178
-
-Signed-off-by: Deepesh Varatharajan <Deepesh.Varatharajan@windriver.com>
-
-diff --git a/bfd/elf64-x86-64.c b/bfd/elf64-x86-64.c
-index cb32732e..a08e9c97 100644
---- a/bfd/elf64-x86-64.c
-+++ b/bfd/elf64-x86-64.c
-@@ -5031,6 +5031,15 @@ elf_x86_64_finish_dynamic_symbol (bfd *output_bfd,
- 
-       if (generate_dynamic_reloc)
- 	{
-+	  /* If the relgot section has not been created, then
-+	     generate an error instead of a reloc.  cf PR 32638.  */
-+	  if (relgot == NULL || relgot->size == 0)
-+	    {
-+	      info->callbacks->einfo (_("%F%pB: Unable to generate dynamic relocs because a suitable section does not exist\n"),
-+					output_bfd);
-+	      return false;
-+	    }
-+	  
- 	  if (relative_reloc_name != NULL
- 	      && htab->params->report_relative_reloc)
- 	    _bfd_x86_elf_link_report_relative_reloc
diff --git a/meta/recipes-devtools/binutils/binutils/0016-CVE-2025-1181-1.patch b/meta/recipes-devtools/binutils/binutils/0016-CVE-2025-1181-1.patch
deleted file mode 100644
index d3709c7a4f6..00000000000
--- a/meta/recipes-devtools/binutils/binutils/0016-CVE-2025-1181-1.patch
+++ /dev/null
@@ -1,141 +0,0 @@
-From: Nick Clifton <nickc@redhat.com>
-Date: Wed, 5 Feb 2025 14:31:10 +0000
-
-Prevent illegal memory access when checking relocs in a corrupt ELF binary.
-
-PR 32641
-
-Upstream-Status: Backport [https://sourceware.org/git/?p=binutils-gdb.git;a=commitdiff;h=18cc11a2771d9e40180485da9a4fb660c03efac3]
-CVE: CVE-2025-1181
-
-Signed-off-by: Deepesh Varatharajan <Deepesh.Varatharajan@windriver.com>
-
-diff --git a/bfd/elf-bfd.h b/bfd/elf-bfd.h
-index 785a37dd7fd..d2bf8e5cbae 100644
---- a/bfd/elf-bfd.h
-+++ b/bfd/elf-bfd.h
-@@ -3150,6 +3150,9 @@ extern bool _bfd_elf_link_mmap_section_contents
- extern void _bfd_elf_link_munmap_section_contents
-   (asection *);
- 
-+extern struct elf_link_hash_entry * _bfd_elf_get_link_hash_entry
-+  (struct elf_link_hash_entry **, unsigned int, Elf_Internal_Shdr *);
-+
- /* Large common section.  */
- extern asection _bfd_elf_large_com_section;
- 
-diff --git a/bfd/elf64-x86-64.c b/bfd/elf64-x86-64.c
-index 32db254ba6c..2d82c6583c3 100644
---- a/bfd/elf64-x86-64.c
-+++ b/bfd/elf64-x86-64.c
-@@ -1744,7 +1744,7 @@ elf_x86_64_convert_load_reloc (bfd *abfd,
-   bool to_reloc_pc32;
-   bool abs_symbol;
-   bool local_ref;
--  asection *tsec;
-+  asection *tsec = NULL;
-   bfd_signed_vma raddend;
-   unsigned int opcode;
-   unsigned int modrm;
-@@ -1910,6 +1910,9 @@ elf_x86_64_convert_load_reloc (bfd *abfd,
- 	return true;
-     }
- 
-+  if (tsec == NULL)
-+    return false;
-+
-   /* Don't convert GOTPCREL relocation against large section.  */
-   if (elf_section_data (tsec) !=  NULL
-       && (elf_section_flags (tsec) & SHF_X86_64_LARGE) != 0)
-@@ -2206,10 +2209,7 @@ elf_x86_64_scan_relocs (bfd *abfd, struct bfd_link_info *info,
-       else
- 	{
- 	  isym = NULL;
--	  h = sym_hashes[r_symndx - symtab_hdr->sh_info];
--	  while (h->root.type == bfd_link_hash_indirect
--		 || h->root.type == bfd_link_hash_warning)
--	    h = (struct elf_link_hash_entry *) h->root.u.i.link;
-+	  h = _bfd_elf_get_link_hash_entry (sym_hashes, r_symndx, symtab_hdr);
- 	}
- 
-       /* Check invalid x32 relocations.  */
-diff --git a/bfd/elflink.c b/bfd/elflink.c
-index 1f1263007c0..eafbd133ff5 100644
---- a/bfd/elflink.c
-+++ b/bfd/elflink.c
-@@ -96,6 +96,27 @@ _bfd_elf_link_keep_memory (struct bfd_link_info *info)
-   return true;
- }
- 
-+struct elf_link_hash_entry *
-+_bfd_elf_get_link_hash_entry (struct elf_link_hash_entry **  sym_hashes,
-+			      unsigned int                   symndx,
-+			      Elf_Internal_Shdr *            symtab_hdr)
-+{
-+  if (symndx < symtab_hdr->sh_info)
-+    return NULL;
-+
-+  struct elf_link_hash_entry *h = sym_hashes[symndx - symtab_hdr->sh_info];
-+
-+  /* The hash might be empty.  See PR 32641 for an example of this.  */
-+  if (h == NULL)
-+    return NULL;
-+
-+  while (h->root.type == bfd_link_hash_indirect
-+	 || h->root.type == bfd_link_hash_warning)
-+    h = (struct elf_link_hash_entry *) h->root.u.i.link;
-+
-+  return h;
-+}
-+
- static struct elf_link_hash_entry *
- get_ext_sym_hash (struct elf_reloc_cookie *cookie, unsigned long r_symndx)
- {
-@@ -108,6 +129,9 @@ get_ext_sym_hash (struct elf_reloc_cookie *cookie, unsigned long r_symndx)
-     {
-       h = cookie->sym_hashes[r_symndx - cookie->extsymoff];
- 
-+      if (h == NULL)
-+	return NULL;
-+
-       while (h->root.type == bfd_link_hash_indirect
- 	     || h->root.type == bfd_link_hash_warning)
- 	h = (struct elf_link_hash_entry *) h->root.u.i.link;
-diff --git a/bfd/elfxx-x86.c b/bfd/elfxx-x86.c
-index 8e5a005fd36..832a5495eb1 100644
---- a/bfd/elfxx-x86.c
-+++ b/bfd/elfxx-x86.c
-@@ -973,15 +973,7 @@ _bfd_x86_elf_check_relocs (bfd *abfd,
- 	  goto error_return;
- 	}
- 
--      if (r_symndx < symtab_hdr->sh_info)
--	h = NULL;
--      else
--	{
--	  h = sym_hashes[r_symndx - symtab_hdr->sh_info];
--	  while (h->root.type == bfd_link_hash_indirect
--		 || h->root.type == bfd_link_hash_warning)
--	    h = (struct elf_link_hash_entry *) h->root.u.i.link;
--	}
-+      h = _bfd_elf_get_link_hash_entry (sym_hashes, r_symndx, symtab_hdr);
- 
-       if (X86_NEED_DYNAMIC_RELOC_TYPE_P (is_x86_64, r_type)
- 	  && NEED_DYNAMIC_RELOCATION_P (is_x86_64, info, true, h, sec,
-@@ -1209,10 +1201,12 @@ _bfd_x86_elf_link_relax_section (bfd *abfd ATTRIBUTE_UNUSED,
-       else
- 	{
- 	  /* Get H and SEC for GENERATE_DYNAMIC_RELOCATION_P below.  */
--	  h = sym_hashes[r_symndx - symtab_hdr->sh_info];
--	  while (h->root.type == bfd_link_hash_indirect
--		 || h->root.type == bfd_link_hash_warning)
--	    h = (struct elf_link_hash_entry *) h->root.u.i.link;
-+	  h = _bfd_elf_get_link_hash_entry (sym_hashes, r_symndx, symtab_hdr);
-+	  if (h == NULL)
-+	    {
-+	      /* FIXMEL: Issue an error message ?  */
-+	      continue;
-+	    }
- 
- 	  if (h->root.type == bfd_link_hash_defined
- 	      || h->root.type == bfd_link_hash_defweak)
diff --git a/meta/recipes-devtools/binutils/binutils/0017-CVE-2025-1181-2.patch b/meta/recipes-devtools/binutils/binutils/0017-CVE-2025-1181-2.patch
deleted file mode 100644
index 5af743582f7..00000000000
--- a/meta/recipes-devtools/binutils/binutils/0017-CVE-2025-1181-2.patch
+++ /dev/null
@@ -1,337 +0,0 @@
-From: Nick Clifton <nickc@redhat.com>
-Date: Wed, 5 Feb 2025 15:43:04 +0000
-
-Add even more checks for corrupt input when processing
-relocations for ELF files.
-
-PR 32643
-
-Upstream-Status: Backport [https://sourceware.org/git/?p=binutils-gdb.git;a=commitdiff;h=931494c9a89558acb36a03a340c01726545eef24]
-CVE: CVE-2025-1181
-
-Signed-off-by: Deepesh Varatharajan <Deepesh.Varatharajan@windriver.com>
-
-diff --git a/bfd/elflink.c b/bfd/elflink.c
-index fd423d61..91cd7c28 100644
---- a/bfd/elflink.c
-+++ b/bfd/elflink.c
-@@ -96,15 +96,17 @@
-   return true;
- }
- 
--struct elf_link_hash_entry *
--_bfd_elf_get_link_hash_entry (struct elf_link_hash_entry **  sym_hashes,
--			      unsigned int                   symndx,
--			      Elf_Internal_Shdr *            symtab_hdr)
-+static struct elf_link_hash_entry *
-+get_link_hash_entry (struct elf_link_hash_entry **  sym_hashes,
-+		     unsigned int                   symndx,
-+		     unsigned int                   ext_sym_start)
- {
--  if (symndx < symtab_hdr->sh_info)
-+  if (sym_hashes == NULL
-+      /* Guard against corrupt input.  See PR 32636 for an example.  */
-+      || symndx < ext_sym_start)
-     return NULL;
- 
--  struct elf_link_hash_entry *h = sym_hashes[symndx - symtab_hdr->sh_info];
-+  struct elf_link_hash_entry *h = sym_hashes[symndx - ext_sym_start];
- 
-   /* The hash might be empty.  See PR 32641 for an example of this.  */
-   if (h == NULL)
-@@ -117,27 +119,28 @@
-   return h;
- }
- 
--static struct elf_link_hash_entry *
--get_ext_sym_hash (struct elf_reloc_cookie *cookie, unsigned long r_symndx)
-+struct elf_link_hash_entry *
-+_bfd_elf_get_link_hash_entry (struct elf_link_hash_entry **  sym_hashes,
-+			      unsigned int                   symndx,
-+			      Elf_Internal_Shdr *            symtab_hdr)
- {
--  struct elf_link_hash_entry *h = NULL;
--
--  if ((r_symndx >= cookie->locsymcount
--       || ELF_ST_BIND (cookie->locsyms[r_symndx].st_info) != STB_LOCAL)
--      /* Guard against corrupt input.  See PR 32636 for an example.  */
--      && r_symndx >= cookie->extsymoff)
--    {
--      h = cookie->sym_hashes[r_symndx - cookie->extsymoff];
-+  if (symtab_hdr == NULL)
-+    return NULL;
- 
--      if (h == NULL)
--	return NULL;
-+  return get_link_hash_entry (sym_hashes, symndx, symtab_hdr->sh_info);
-+}
- 
--      while (h->root.type == bfd_link_hash_indirect
--	     || h->root.type == bfd_link_hash_warning)
--	h = (struct elf_link_hash_entry *) h->root.u.i.link;
--    }
-+static struct elf_link_hash_entry *
-+get_ext_sym_hash_from_cookie (struct elf_reloc_cookie *cookie, unsigned long r_symndx)
-+{
-+  if (cookie == NULL || cookie->sym_hashes == NULL)
-+    return NULL;
-+  
-+  if (r_symndx >= cookie->locsymcount
-+      || ELF_ST_BIND (cookie->locsyms[r_symndx].st_info) != STB_LOCAL)
-+    return get_link_hash_entry (cookie->sym_hashes, r_symndx, cookie->extsymoff);
- 
--  return h;
-+  return NULL;
- }
- 
- asection *
-@@ -147,7 +150,7 @@
- {
-   struct elf_link_hash_entry *h;
- 
--  h = get_ext_sym_hash (cookie, r_symndx);
-+  h = get_ext_sym_hash_from_cookie (cookie, r_symndx);
-   
-   if (h != NULL)
-     {
-@@ -9105,7 +9108,6 @@
- 		  size_t symidx,
- 		  bfd_vma val)
- {
--  struct elf_link_hash_entry **sym_hashes;
-   struct elf_link_hash_entry *h;
-   size_t extsymoff = locsymcount;
- 
-@@ -9128,12 +9130,12 @@
- 
-   /* It is a global symbol: set its link type
-      to "defined" and give it a value.  */
--
--  sym_hashes = elf_sym_hashes (bfd_with_globals);
--  h = sym_hashes [symidx - extsymoff];
--  while (h->root.type == bfd_link_hash_indirect
--	 || h->root.type == bfd_link_hash_warning)
--    h = (struct elf_link_hash_entry *) h->root.u.i.link;
-+  h = get_link_hash_entry (elf_sym_hashes (bfd_with_globals), symidx, extsymoff);
-+  if (h == NULL)
-+    {
-+      /* FIXMEL What should we do ?  */
-+      return;
-+    }
-   h->root.type = bfd_link_hash_defined;
-   h->root.u.def.value = val;
-   h->root.u.def.section = bfd_abs_section_ptr;
-@@ -11611,10 +11613,19 @@
- 	      || (elf_bad_symtab (input_bfd)
- 		  && flinfo->sections[symndx] == NULL))
- 	    {
--	      struct elf_link_hash_entry *h = sym_hashes[symndx - extsymoff];
--	      while (h->root.type == bfd_link_hash_indirect
--		     || h->root.type == bfd_link_hash_warning)
--		h = (struct elf_link_hash_entry *) h->root.u.i.link;
-+	      struct elf_link_hash_entry *h;
-+
-+	      h = get_link_hash_entry (sym_hashes, symndx, extsymoff);
-+	      if (h == NULL)
-+		{
-+		  _bfd_error_handler
-+		    /* xgettext:c-format */
-+		    (_("error: %pB: unable to create group section symbol"),
-+		     input_bfd);
-+		  bfd_set_error (bfd_error_bad_value);
-+		  return false;
-+		}	      
-+
- 	      /* Arrange for symbol to be output.  */
- 	      h->indx = -2;
- 	      elf_section_data (osec)->this_hdr.sh_info = -2;
-@@ -11749,7 +11760,7 @@
- 		  || (elf_bad_symtab (input_bfd)
- 		      && flinfo->sections[r_symndx] == NULL))
- 		{
--		  h = sym_hashes[r_symndx - extsymoff];
-+		  h = get_link_hash_entry (sym_hashes, r_symndx, extsymoff);
- 
- 		  /* Badly formatted input files can contain relocs that
- 		     reference non-existant symbols.  Check here so that
-@@ -11758,17 +11769,13 @@
- 		    {
- 		      _bfd_error_handler
- 			/* xgettext:c-format */
--			(_("error: %pB contains a reloc (%#" PRIx64 ") for section %pA "
-+			(_("error: %pB contains a reloc (%#" PRIx64 ") for section '%pA' "
- 			   "that references a non-existent global symbol"),
- 			 input_bfd, (uint64_t) rel->r_info, o);
- 		      bfd_set_error (bfd_error_bad_value);
- 		      return false;
- 		    }
- 
--		  while (h->root.type == bfd_link_hash_indirect
--			 || h->root.type == bfd_link_hash_warning)
--		    h = (struct elf_link_hash_entry *) h->root.u.i.link;
--
- 		  s_type = h->type;
- 
- 		  /* If a plugin symbol is referenced from a non-IR file,
-@@ -11984,7 +11991,6 @@
- 			  && flinfo->sections[r_symndx] == NULL))
- 		    {
- 		      struct elf_link_hash_entry *rh;
--		      unsigned long indx;
- 
- 		      /* This is a reloc against a global symbol.  We
- 			 have not yet output all the local symbols, so
-@@ -11993,15 +11999,16 @@
- 			 reloc to point to the global hash table entry
- 			 for this symbol.  The symbol index is then
- 			 set at the end of bfd_elf_final_link.  */
--		      indx = r_symndx - extsymoff;
--		      rh = elf_sym_hashes (input_bfd)[indx];
--		      while (rh->root.type == bfd_link_hash_indirect
--			     || rh->root.type == bfd_link_hash_warning)
--			rh = (struct elf_link_hash_entry *) rh->root.u.i.link;
--
--		      /* Setting the index to -2 tells
--			 elf_link_output_extsym that this symbol is
--			 used by a reloc.  */
-+		      rh = get_link_hash_entry (elf_sym_hashes (input_bfd),
-+						r_symndx, extsymoff);
-+		      if (rh == NULL)
-+			{
-+			  /* FIXME: Generate an error ?  */
-+			  continue;
-+			}
-+
-+		      /* Setting the index to -2 tells elf_link_output_extsym
-+			 that this symbol is used by a reloc.  */
- 		      BFD_ASSERT (rh->indx < 0);
- 		      rh->indx = -2;
- 		      *rel_hash = rh;
-@@ -13965,25 +13972,21 @@
- 		       struct elf_link_hash_entry *h,
- 		       Elf_Internal_Sym *sym)
- {
--  if (h != NULL)
-+  if (h == NULL)
-+    return bfd_section_from_elf_index (sec->owner, sym->st_shndx);
-+
-+  switch (h->root.type)
-     {
--      switch (h->root.type)
--	{
--	case bfd_link_hash_defined:
--	case bfd_link_hash_defweak:
--	  return h->root.u.def.section;
-+    case bfd_link_hash_defined:
-+    case bfd_link_hash_defweak:
-+      return h->root.u.def.section;
- 
--	case bfd_link_hash_common:
--	  return h->root.u.c.p->section;
-+    case bfd_link_hash_common:
-+      return h->root.u.c.p->section;
- 
--	default:
--	  break;
--	}
-+    default:
-+      return NULL;
-     }
--  else
--    return bfd_section_from_elf_index (sec->owner, sym->st_shndx);
--
--  return NULL;
- }
- 
- /* Return the debug definition section.  */
-@@ -14032,46 +14035,49 @@
-   if (r_symndx == STN_UNDEF)
-     return NULL;
- 
--  h = get_ext_sym_hash (cookie, r_symndx);
-+  h = get_ext_sym_hash_from_cookie (cookie, r_symndx);
-+  if (h == NULL)
-+    {
-+      /* A corrup tinput file can lead to a situation where the index
-+	 does not reference either a local or an external symbol.  */
-+      if (r_symndx >= cookie->locsymcount)
-+	return NULL;
- 
--  if (h != NULL)
-+      return (*gc_mark_hook) (sec, info, cookie->rel, NULL,
-+			      &cookie->locsyms[r_symndx]);
-+    }
-+
-+  bool was_marked = h->mark;
-+
-+  h->mark = 1;
-+  /* Keep all aliases of the symbol too.  If an object symbol
-+     needs to be copied into .dynbss then all of its aliases
-+     should be present as dynamic symbols, not just the one used
-+     on the copy relocation.  */
-+  hw = h;
-+  while (hw->is_weakalias)
-     {
--      bool was_marked;
-+      hw = hw->u.alias;
-+      hw->mark = 1;
-+    }
- 
--      was_marked = h->mark;
--      h->mark = 1;
--      /* Keep all aliases of the symbol too.  If an object symbol
--	 needs to be copied into .dynbss then all of its aliases
--	 should be present as dynamic symbols, not just the one used
--	 on the copy relocation.  */
--      hw = h;
--      while (hw->is_weakalias)
--	{
--	  hw = hw->u.alias;
--	  hw->mark = 1;
--	}
-+  if (!was_marked && h->start_stop && !h->root.ldscript_def)
-+    {
-+      if (info->start_stop_gc)
-+	return NULL;
- 
--      if (!was_marked && h->start_stop && !h->root.ldscript_def)
-+      /* To work around a glibc bug, mark XXX input sections
-+	 when there is a reference to __start_XXX or __stop_XXX
-+	 symbols.  */
-+      else if (start_stop != NULL)
- 	{
--	  if (info->start_stop_gc)
--	    return NULL;
--
--	  /* To work around a glibc bug, mark XXX input sections
--	     when there is a reference to __start_XXX or __stop_XXX
--	     symbols.  */
--	  else if (start_stop != NULL)
--	    {
--	      asection *s = h->u2.start_stop_section;
--	      *start_stop = true;
--	      return s;
--	    }
-+	  asection *s = h->u2.start_stop_section;
-+	  *start_stop = true;
-+	  return s;
- 	}
--
--      return (*gc_mark_hook) (sec, info, cookie->rel, h, NULL);
-     }
- 
--  return (*gc_mark_hook) (sec, info, cookie->rel, NULL,
--			  &cookie->locsyms[r_symndx]);
-+  return (*gc_mark_hook) (sec, info, cookie->rel, h, NULL);
- }
- 
- /* COOKIE->rel describes a relocation against section SEC, which is
-@@ -15094,7 +15100,7 @@
- 
-       struct elf_link_hash_entry *h;
- 
--      h = get_ext_sym_hash (rcookie, r_symndx);
-+      h = get_ext_sym_hash_from_cookie (rcookie, r_symndx);
- 
-       if (h != NULL)
- 	{
diff --git a/meta/recipes-devtools/binutils/binutils/0018-CVE-2025-5245.patch b/meta/recipes-devtools/binutils/binutils/0018-CVE-2025-5245.patch
deleted file mode 100644
index d4b7d559663..00000000000
--- a/meta/recipes-devtools/binutils/binutils/0018-CVE-2025-5245.patch
+++ /dev/null
@@ -1,38 +0,0 @@
-From: Alan Modra <amodra@gmail.com>
-Date: Tue, 1 Apr 2025 22:36:54 +1030
-
-PR32829, SEGV on objdump function debug_type_samep
-u.kenum is always non-NULL, see debug_make_enum_type.
-
-Upstream-Status: Backport [https://sourceware.org/git/?p=binutils-gdb.git;a=commitdiff;h=6c3458a8b7ee7d39f070c7b2350851cb2110c65a]
-CVE: CVE-2025-5245
-
-Signed-off-by: Deepesh Varatharajan <Deepesh.Varatharajan@windriver.com>
-
-diff --git a/binutils/debug.c b/binutils/debug.c
-index dcc8ccde..465b18e7 100644
---- a/binutils/debug.c
-+++ b/binutils/debug.c
-@@ -2554,9 +2554,6 @@ debug_write_type (struct debug_handle *info,
-     case DEBUG_KIND_UNION_CLASS:
-       return debug_write_class_type (info, fns, fhandle, type, tag);
-     case DEBUG_KIND_ENUM:
--      if (type->u.kenum == NULL)
--	return (*fns->enum_type) (fhandle, tag, (const char **) NULL,
--				  (bfd_signed_vma *) NULL);
-       return (*fns->enum_type) (fhandle, tag, type->u.kenum->names,
- 				type->u.kenum->values);
-     case DEBUG_KIND_POINTER:
-@@ -3097,9 +3094,9 @@ debug_type_samep (struct debug_handle *info, struct debug_type_s *t1,
-       break;
- 
-     case DEBUG_KIND_ENUM:
--      if (t1->u.kenum == NULL)
--	ret = t2->u.kenum == NULL;
--      else if (t2->u.kenum == NULL)
-+      if (t1->u.kenum->names == NULL)
-+	ret = t2->u.kenum->names == NULL;
-+      else if (t2->u.kenum->names == NULL)
- 	ret = false;
-       else
- 	{
diff --git a/meta/recipes-devtools/binutils/binutils/0019-CVE-2025-3198.patch b/meta/recipes-devtools/binutils/binutils/0019-CVE-2025-3198.patch
deleted file mode 100644
index 49d7c94b9f9..00000000000
--- a/meta/recipes-devtools/binutils/binutils/0019-CVE-2025-3198.patch
+++ /dev/null
@@ -1,28 +0,0 @@
-From ba6ad3a18cb26b79e0e3b84c39f707535bbc344d Mon Sep 17 00:00:00 2001
-From: Alan Modra <amodra@gmail.com>
-Date: Wed, 19 Feb 2025 07:58:54 +1030
-Subject: [PATCH] PR32716, objdump -i memory leak
-
-	PR binutils/32716
-	* bucomm.c (display_info): Free arg.info.
-
-Upstream-Status: Backport [https://sourceware.org/git/?p=binutils-gdb.git;a=patch;h=ba6ad3a18cb26b79e0e3b84c39f707535bbc344d]
-CVE: CVE-2025-3198
-
-Signed-off-by: Harish Sadineni <Harish.Sadineni@windriver.com>
----
- binutils/bucomm.c | 1 +
- 1 file changed, 1 insertion(+)
-
-diff --git a/binutils/bucomm.c b/binutils/bucomm.c
-index ccf54099154..d4554737db1 100644
---- a/binutils/bucomm.c
-+++ b/binutils/bucomm.c
-@@ -435,6 +435,7 @@ display_info (void)
-   if (!arg.error)
-     display_target_tables (&arg);
- 
-+  free (arg.info);
-   return arg.error;
- }
- 
diff --git a/meta/recipes-devtools/binutils/binutils/0019-CVE-2025-5244.patch b/meta/recipes-devtools/binutils/binutils/0019-CVE-2025-5244.patch
deleted file mode 100644
index e8855a4b4b6..00000000000
--- a/meta/recipes-devtools/binutils/binutils/0019-CVE-2025-5244.patch
+++ /dev/null
@@ -1,25 +0,0 @@
-From: Alan Modra <amodra@gmail.com>
-Date: Thu, 10 Apr 2025 19:41:49 +0930
-
-Upstream-Status: Backport [https://sourceware.org/git/?p=binutils-gdb.git;a=patch;h=d1458933830456e54223d9fc61f0d9b3a19256f5]
-CVE: CVE-2025-5244
-
-PR32858 ld segfault on fuzzed object
-We missed one place where it is necessary to check for empty groups.
-
-Signed-off-by: Deepesh Varatharajan <Deepesh.Varatharajan@windriver.com>
-
-diff --git a/bfd/elflink.c b/bfd/elflink.c
-index a76e8e38da7..549b7b7dd92 100644
---- a/bfd/elflink.c
-+++ b/bfd/elflink.c
-@@ -14408,7 +14408,8 @@ elf_gc_sweep (bfd *abfd, struct bfd_link_info *info)
- 	  if (o->flags & SEC_GROUP)
- 	    {
- 	      asection *first = elf_next_in_group (o);
--	      o->gc_mark = first->gc_mark;
-+	      if (first != NULL)
-+		o->gc_mark = first->gc_mark;
- 	    }
- 
- 	  if (o->gc_mark)
diff --git a/meta/recipes-devtools/binutils/binutils/0020-CVE-2025-7545.patch b/meta/recipes-devtools/binutils/binutils/0020-CVE-2025-7545.patch
deleted file mode 100644
index 062d6721b68..00000000000
--- a/meta/recipes-devtools/binutils/binutils/0020-CVE-2025-7545.patch
+++ /dev/null
@@ -1,39 +0,0 @@
-From: "H.J. Lu" <hjl.tools@gmail.com>
-Date: Sat, 21 Jun 2025 06:36:56 +0800
-
-Upstream-Status: Backport [https://sourceware.org/git/?p=binutils-gdb.git;a=patch;h08c3cbe5926e4d355b5cb70bbec2b1eeb40c2944]
-CVE: CVE-2025-7545
-
-Since the output section contents are copied from the input, don't
-extend the output section size beyond the input section size.
-
-	PR binutils/33049
-	* objcopy.c (copy_section): Don't extend the output section
-	size beyond the input section size.
-
-Signed-off-by: Deepesh Varatharajan <Deepesh.Varatharajan@windriver.com>
-
-diff --git a/binutils/objcopy.c b/binutils/objcopy.c
-index e2e6bd7e..3cbb3977 100644
---- a/binutils/objcopy.c
-+++ b/binutils/objcopy.c
-@@ -4634,6 +4634,7 @@ copy_section (bfd *ibfd, sec_ptr isection, bfd *obfd)
- 	  char *to = (char *) memhunk;
- 	  char *end = (char *) memhunk + size;
- 	  int i;
-+	  bfd_size_type memhunk_size = size;
- 
- 	  /* If the section address is not exactly divisible by the interleave,
- 	     then we must bias the from address.  If the copy_byte is less than
-@@ -4653,6 +4654,11 @@ copy_section (bfd *ibfd, sec_ptr isection, bfd *obfd)
- 	      }
- 
- 	  size = (size + interleave - 1 - copy_byte) / interleave * copy_width;
-+
-+          /* Don't extend the output section size.  */
-+          if (size > memhunk_size)
-+            size = memhunk_size;
-+	  
- 	  osection->lma /= interleave;
- 	  if (copy_byte < extra)
- 	    osection->lma++;
diff --git a/meta/recipes-devtools/binutils/binutils/0020-CVE-2025-7546.patch b/meta/recipes-devtools/binutils/binutils/0020-CVE-2025-7546.patch
deleted file mode 100644
index 23c38091a2a..00000000000
--- a/meta/recipes-devtools/binutils/binutils/0020-CVE-2025-7546.patch
+++ /dev/null
@@ -1,58 +0,0 @@
-From 41461010eb7c79fee7a9d5f6209accdaac66cc6b Mon Sep 17 00:00:00 2001
-From: "H.J. Lu" <hjl.tools@gmail.com>
-Date: Sat, 21 Jun 2025 06:52:00 +0800
-Subject: [PATCH] elf: Report corrupted group section
-
-Report corrupted group section instead of trying to recover.
-
-	PR binutils/33050
-	* elf.c (bfd_elf_set_group_contents): Report corrupted group
-	section.
-
-Upstream-Status: Backport [https://sourceware.org/git/gitweb.cgi?p=binutils-gdb.git;h=41461010eb7c79fee7a9d5f6209accdaac66cc6b]
-CVE: CVE-2025-7546
-
-Signed-off-by: H.J. Lu <hjl.tools@gmail.com>
-Signed-off-by: Yash Shinde <Yash.Shinde@windriver.com>
----
- bfd/elf.c | 23 ++++++++++-------------
- 1 file changed, 10 insertions(+), 13 deletions(-)
-
-diff --git a/bfd/elf.c b/bfd/elf.c
-index 14ce15c7254..ee894eb05f2 100644
---- a/bfd/elf.c
-+++ b/bfd/elf.c
-@@ -3971,20 +3971,17 @@ bfd_elf_set_group_contents (bfd *abfd, asection *sec, void *failedptrarg)
- 	break;
-     }
- 
--  /* We should always get here with loc == sec->contents + 4, but it is
--     possible to craft bogus SHT_GROUP sections that will cause segfaults
--     in objcopy without checking loc here and in the loop above.  */
--  if (loc == sec->contents)
--    BFD_ASSERT (0);
--  else
-+  /* We should always get here with loc == sec->contents + 4.  Return
-+     an error for bogus SHT_GROUP sections.  */
-+  loc -= 4;
-+  if (loc != sec->contents)
-     {
--      loc -= 4;
--      if (loc != sec->contents)
--	{
--	  BFD_ASSERT (0);
--	  memset (sec->contents + 4, 0, loc - sec->contents);
--	  loc = sec->contents;
--	}
-+      /* xgettext:c-format */
-+      _bfd_error_handler (_("%pB: corrupted group section: `%pA'"),
-+			  abfd, sec);
-+      bfd_set_error (bfd_error_bad_value);
-+      *failedptr = true;
-+      return;
-     }
- 
-   H_PUT_32 (abfd, sec->flags & SEC_LINK_ONCE ? GRP_COMDAT : 0, loc);
--- 
-2.43.5
-
diff --git a/meta/recipes-devtools/binutils/binutils/CVE-2025-1180.patch b/meta/recipes-devtools/binutils/binutils/CVE-2025-1180.patch
deleted file mode 100644
index 073361cf194..00000000000
--- a/meta/recipes-devtools/binutils/binutils/CVE-2025-1180.patch
+++ /dev/null
@@ -1,165 +0,0 @@
-From 509c5afcd71afd36cd6496f8c84733b11bd5e9e5 Mon Sep 17 00:00:00 2001
-From: Nick Clifton <nickc@redhat.com>
-Date: Thu, 22 May 2025 01:56:17 -0700
-Subject: [PATCH] Backport fix for PR 32642(CVE-2025-1180)
-
-Backporting the fix from PR 32636 to fix PR 32642 (ld SEGV (illegal read access)
-in _bfd_elf_write_section_eh_frame (bfd/elf-eh-frame.c:2234:29) with
- --gc-sections --gc-keep-exported option)
-
-https://nvd.nist.gov/vuln/detail/CVE-2025-1180 is associated with
-PR32642 which will get fixed with commit from PR 32636.
-
-(cherry picked from commit: f9978defb6fab0bd8583942d97c112b0932ac814)
-Upstream-Status: Submitted [https://sourceware.org/pipermail/binutils/2025-May/141351.html]
-CVE: CVE-2025-1180
-
-Signed-off-by: Harish Sadineni <Harish.Sadineni@windriver.com>
----
- bfd/elflink.c | 88 +++++++++++++++++++++++++--------------------------
- 1 file changed, 44 insertions(+), 44 deletions(-)
-
-diff --git a/bfd/elflink.c b/bfd/elflink.c
-index 6346d7e2b4b..d765b688801 100644
---- a/bfd/elflink.c
-+++ b/bfd/elflink.c
-@@ -96,22 +96,37 @@ _bfd_elf_link_keep_memory (struct bfd_link_info *info)
-   return true;
- }
- 
--asection *
--_bfd_elf_section_for_symbol (struct elf_reloc_cookie *cookie,
--			     unsigned long r_symndx,
--			     bool discard)
-+static struct elf_link_hash_entry *
-+get_ext_sym_hash (struct elf_reloc_cookie *cookie, unsigned long r_symndx)
- {
--  if (r_symndx >= cookie->locsymcount
--      || ELF_ST_BIND (cookie->locsyms[r_symndx].st_info) != STB_LOCAL)
--    {
--      struct elf_link_hash_entry *h;
-+  struct elf_link_hash_entry *h = NULL;
- 
-+  if ((r_symndx >= cookie->locsymcount
-+       || ELF_ST_BIND (cookie->locsyms[r_symndx].st_info) != STB_LOCAL)
-+      /* Guard against corrupt input.  See PR 32636 for an example.  */
-+      && r_symndx >= cookie->extsymoff)
-+    {
-       h = cookie->sym_hashes[r_symndx - cookie->extsymoff];
- 
-       while (h->root.type == bfd_link_hash_indirect
- 	     || h->root.type == bfd_link_hash_warning)
- 	h = (struct elf_link_hash_entry *) h->root.u.i.link;
-+    }
-+
-+  return h;
-+}
- 
-+asection *
-+_bfd_elf_section_for_symbol (struct elf_reloc_cookie *cookie,
-+			     unsigned long r_symndx,
-+			     bool discard)
-+{
-+  struct elf_link_hash_entry *h;
-+
-+  h = get_ext_sym_hash (cookie, r_symndx);
-+  
-+  if (h != NULL)
-+    {
-       if ((h->root.type == bfd_link_hash_defined
- 	   || h->root.type == bfd_link_hash_defweak)
- 	   && discarded_section (h->root.u.def.section))
-@@ -119,21 +134,20 @@ _bfd_elf_section_for_symbol (struct elf_reloc_cookie *cookie,
-       else
- 	return NULL;
-     }
--  else
--    {
--      /* It's not a relocation against a global symbol,
--	 but it could be a relocation against a local
--	 symbol for a discarded section.  */
--      asection *isec;
--      Elf_Internal_Sym *isym;
- 
--      /* Need to: get the symbol; get the section.  */
--      isym = &cookie->locsyms[r_symndx];
--      isec = bfd_section_from_elf_index (cookie->abfd, isym->st_shndx);
--      if (isec != NULL
--	  && discard ? discarded_section (isec) : 1)
--	return isec;
--     }
-+  /* It's not a relocation against a global symbol,
-+     but it could be a relocation against a local
-+     symbol for a discarded section.  */
-+  asection *isec;
-+  Elf_Internal_Sym *isym;
-+
-+  /* Need to: get the symbol; get the section.  */
-+  isym = &cookie->locsyms[r_symndx];
-+  isec = bfd_section_from_elf_index (cookie->abfd, isym->st_shndx);
-+  if (isec != NULL
-+      && discard ? discarded_section (isec) : 1)
-+    return isec;
-+
-   return NULL;
- }
- 
-@@ -13994,22 +14008,12 @@ _bfd_elf_gc_mark_rsec (struct bfd_link_info *info, asection *sec,
-   if (r_symndx == STN_UNDEF)
-     return NULL;
- 
--  if (r_symndx >= cookie->locsymcount
--      || ELF_ST_BIND (cookie->locsyms[r_symndx].st_info) != STB_LOCAL)
-+  h = get_ext_sym_hash (cookie, r_symndx);
-+
-+  if (h != NULL)
-     {
-       bool was_marked;
- 
--      h = cookie->sym_hashes[r_symndx - cookie->extsymoff];
--      if (h == NULL)
--	{
--	  info->callbacks->fatal (_("%F%P: corrupt input: %pB\n"),
--				  sec->owner);
--	  return NULL;
--	}
--      while (h->root.type == bfd_link_hash_indirect
--	     || h->root.type == bfd_link_hash_warning)
--	h = (struct elf_link_hash_entry *) h->root.u.i.link;
--
-       was_marked = h->mark;
-       h->mark = 1;
-       /* Keep all aliases of the symbol too.  If an object symbol
-@@ -15064,17 +15068,12 @@ bfd_elf_reloc_symbol_deleted_p (bfd_vma offset, void *cookie)
-       if (r_symndx == STN_UNDEF)
- 	return true;
- 
--      if (r_symndx >= rcookie->locsymcount
--	  || ELF_ST_BIND (rcookie->locsyms[r_symndx].st_info) != STB_LOCAL)
--	{
--	  struct elf_link_hash_entry *h;
--
--	  h = rcookie->sym_hashes[r_symndx - rcookie->extsymoff];
-+      struct elf_link_hash_entry *h;
- 
--	  while (h->root.type == bfd_link_hash_indirect
--		 || h->root.type == bfd_link_hash_warning)
--	    h = (struct elf_link_hash_entry *) h->root.u.i.link;
-+      h = get_ext_sym_hash (rcookie, r_symndx);
- 
-+      if (h != NULL)
-+	{
- 	  if ((h->root.type == bfd_link_hash_defined
- 	       || h->root.type == bfd_link_hash_defweak)
- 	      && (h->root.u.def.section->owner != rcookie->abfd
-@@ -15098,6 +15097,7 @@ bfd_elf_reloc_symbol_deleted_p (bfd_vma offset, void *cookie)
- 		  || discarded_section (isec)))
- 	    return true;
- 	}
-+      
-       return false;
-     }
-   return false;
--- 
-2.49.0
-
diff --git a/meta/recipes-devtools/binutils/binutils/CVE-2025-1182.patch b/meta/recipes-devtools/binutils/binutils/CVE-2025-1182.patch
deleted file mode 100644
index 4a3b6f072b2..00000000000
--- a/meta/recipes-devtools/binutils/binutils/CVE-2025-1182.patch
+++ /dev/null
@@ -1,36 +0,0 @@
-From 92bcd04fcd97f261ff40e9248e00a1dbebf3a536 Mon Sep 17 00:00:00 2001
-From: Nick Clifton <nickc@redhat.com>
-Date: Tue, 27 May 2025 03:37:50 -0700
-Subject: [PATCH] Backport fix for PR 32644(CVE-2025-1182)
-
-Fix another illegal memory access triggered by corrupt ELF input files.
-
-PR 32644
-
-(cherry picked from commit:b425859021d17adf62f06fb904797cf8642986ad)
-Upstream-Status: Submitted [https://sourceware.org/pipermail/binutils/2025-May/141415.html]
-CVE: CVE-2025-1182 
-
-Signed-off-by: Harish Sadineni <Harish.Sadineni@windriver.com>
----
- bfd/elflink.c | 4 ++++
- 1 file changed, 4 insertions(+)
-
-diff --git a/bfd/elflink.c b/bfd/elflink.c
-index 6346d7e2b4b..a0b237b2224 100644
---- a/bfd/elflink.c
-+++ b/bfd/elflink.c
-@@ -15084,6 +15084,10 @@ bfd_elf_reloc_symbol_deleted_p (bfd_vma offset, void *cookie)
- 	}
-       else
- 	{
-+	  if (r_symndx >= rcookie->locsymcount)
-+	    /* This can happen with corrupt input.  */
-+	    return false;
-+
- 	  /* It's not a relocation against a global symbol,
- 	     but it could be a relocation against a local
- 	     symbol for a discarded section.  */
--- 
-2.49.0
-
diff --git a/meta/recipes-devtools/binutils/binutils_2.44.bb b/meta/recipes-devtools/binutils/binutils_2.45.bb
similarity index 100%
rename from meta/recipes-devtools/binutils/binutils_2.44.bb
rename to meta/recipes-devtools/binutils/binutils_2.45.bb

