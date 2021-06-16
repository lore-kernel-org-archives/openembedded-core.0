Received: from mail-qk1-f182.google.com (mail-qk1-f182.google.com [209.85.222.182])
 by mx.groups.io with SMTP id smtpd.web12.15.1623876540629588551
 for <openembedded-core@lists.openembedded.org>;
 Wed, 16 Jun 2021 13:49:00 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20161025 header.b=edBz7ZaZ;
 spf=pass (domain: gmail.com, ip: 209.85.222.182, mailfrom: bruce.ashfield@gmail.com)
Received: by mail-qk1-f182.google.com with SMTP id f70so856741qke.13
        for <openembedded-core@lists.openembedded.org>; Wed, 16 Jun 2021 13:49:00 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:content-transfer-encoding;
        bh=PhFoIYH1kGxRIiKym8J/U2/izbaFeyP2hRPh3lrzyF8=;
        b=edBz7ZaZ3HK1OsekU9xs2RwF4oaqoWwAus907B1inqZxcYgvdLeDLd+FtQ/sQb8lM2
         iZ5F7ifb88j2/aKi/Qg1qNmZmcC7X5XLYR+mgvSAtywm+Ev49OMIJ5SXvD0y/pAHNFW3
         eLZengaq+32vPIgQOqHrK15CsAAH/yRLvHZUcQBwLI6CXezVNyD79ThLNcZ94YcElQhD
         jFkMxRC8cWeHdnpw5/qXa7/WiuGHUa5rMq+7Ju08FWDoNBa2LdXl2KqPTiSe7GRc2gDL
         Q310poISB4wFsNgA6sV+ZVKfWWupXLFzEr/wFsLshbBQYjVZEorTCq9g2khTGe7cSefB
         +TIw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=PhFoIYH1kGxRIiKym8J/U2/izbaFeyP2hRPh3lrzyF8=;
        b=qhD6CO/LbS0961kqBDY2/5je/Oa6EGHLo7GpoOcxUumBaglG/Uf7LZch1q0nKSUBSE
         mLiyXI3N75ne1KHIfeOkZ81qQfgjnd11MFxa/ewBUWnmMcTmZNEG9KcrBQOhyIyZXnHM
         i1mskcG+M9V6VlJixGRlfcwWqTzH5FyM98iow1bzCMSrvrYXegnN98TW6F4BipV0KlpR
         7VOZ81i0elhyGtUDMU+uD/h0Jia8tiwh2yOGp4Rl2x9r94xLy4tTRBBF8pDqOypQmmwb
         0QUlVwMXkBL7v/JIoz2JqKsTroivdrmINrd90KAtVDal3V6Buf5XP4zQYIGn1OsmTyHO
         zyzA==
X-Gm-Message-State: AOAM531/X8YseWnMLgJwf4qQsTsqbZAcCpJbd21yKnAskYnYCUHhbchG
	iwGVxKk33MWrsZr21usPGKvuJfGTVT0EgAtU
X-Google-Smtp-Source: ABdhPJyfwb+LwVCCYr2EvcAJHa3BIRg52M7bFPKNn3+QW2qLD7OAd2YhTWgviF/QnGZV8h9t3mytxQ==
X-Received: by 2002:a05:620a:883:: with SMTP id b3mr228230qka.433.1623876539796;
        Wed, 16 Jun 2021 13:48:59 -0700 (PDT)
Return-Path: <bruce.ashfield@gmail.com>
Received: from build.lan (cpe04d4c4975b80-cmf4c11490699b.cpe.net.cable.rogers.com. [174.112.159.151])
        by smtp.gmail.com with ESMTPSA id d10sm300237qko.73.2021.06.16.13.48.58
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 16 Jun 2021 13:48:59 -0700 (PDT)
From: "Bruce Ashfield" <bruce.ashfield@gmail.com>
To: richard.purdie@linuxfoundation.org
Cc: openembedded-core@lists.openembedded.org
Subject: [PATCH 3/6] linux-yocto/5.10: restore aufs
Date: Wed, 16 Jun 2021 16:48:51 -0400
Message-Id: <812354be02c2daace76898454bba5d33fec621c2.1623876372.git.bruce.ashfield@gmail.com>
X-Mailer: git-send-email 2.19.1
In-Reply-To: <cover.1623876372.git.bruce.ashfield@gmail.com>
References: <cover.1623876372.git.bruce.ashfield@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

From: Bruce Ashfield <bruce.ashfield@gmail.com>

Integrating the following commit(s) to linux-yocto/5.10:

    bdda1b6cf99b aufs5: aufs-core
    2fa276071d07 aufs5: aufs-standalone
    06ed4d532456 aufs5: aufs-mmap
    372857834999 aufs5: aufs-kbuild
    fd68c9840693 aufs5: aufs-base

Signed-off-by: Bruce Ashfield <bruce.ashfield@gmail.com>
---
 .../linux/linux-yocto-rt_5.10.bb              |  2 +-
 .../linux/linux-yocto-tiny_5.10.bb            |  4 ++--
 meta/recipes-kernel/linux/linux-yocto_5.10.bb | 20 +++++++++----------
 3 files changed, 13 insertions(+), 13 deletions(-)

diff --git a/meta/recipes-kernel/linux/linux-yocto-rt_5.10.bb b/meta/recipes-kernel/linux/linux-yocto-rt_5.10.bb
index c34ce4d0f2..1a581455c6 100644
--- a/meta/recipes-kernel/linux/linux-yocto-rt_5.10.bb
+++ b/meta/recipes-kernel/linux/linux-yocto-rt_5.10.bb
@@ -11,7 +11,7 @@ python () {
         raise bb.parse.SkipRecipe("Set PREFERRED_PROVIDER_virtual/kernel to linux-yocto-rt to enable it")
 }
 
-SRCREV_machine ?= "556236b4fc94b6655e3bd3018f17c3265e033f9e"
+SRCREV_machine ?= "49f039aa59a182fb1451407616a6fcc1ec278537"
 SRCREV_meta ?= "422f8a09a856800f027bbae98dbab24cf3ae0f25"
 
 SRC_URI = "git://git.yoctoproject.org/linux-yocto.git;branch=${KBRANCH};name=machine \
diff --git a/meta/recipes-kernel/linux/linux-yocto-tiny_5.10.bb b/meta/recipes-kernel/linux/linux-yocto-tiny_5.10.bb
index 774461a2c1..53050dd225 100644
--- a/meta/recipes-kernel/linux/linux-yocto-tiny_5.10.bb
+++ b/meta/recipes-kernel/linux/linux-yocto-tiny_5.10.bb
@@ -15,8 +15,8 @@ DEPENDS += "openssl-native util-linux-native"
 KMETA = "kernel-meta"
 KCONF_BSP_AUDIT_LEVEL = "2"
 
-SRCREV_machine_qemuarm ?= "2940c362208b0f18baa6e2f455bd1c88b7c2eeca"
-SRCREV_machine ?= "a673c127156c156a4a490ef66e0194d239cfbfa1"
+SRCREV_machine_qemuarm ?= "03d62322242437d30f537fa01024730ddcaa4cde"
+SRCREV_machine ?= "bdda1b6cf99b44871409d218426a28102a5c554b"
 SRCREV_meta ?= "422f8a09a856800f027bbae98dbab24cf3ae0f25"
 
 PV = "${LINUX_VERSION}+git${SRCPV}"
diff --git a/meta/recipes-kernel/linux/linux-yocto_5.10.bb b/meta/recipes-kernel/linux/linux-yocto_5.10.bb
index b808a8ad3f..c18a79f912 100644
--- a/meta/recipes-kernel/linux/linux-yocto_5.10.bb
+++ b/meta/recipes-kernel/linux/linux-yocto_5.10.bb
@@ -13,16 +13,16 @@ KBRANCH_qemux86  ?= "v5.10/standard/base"
 KBRANCH_qemux86-64 ?= "v5.10/standard/base"
 KBRANCH_qemumips64 ?= "v5.10/standard/mti-malta64"
 
-SRCREV_machine_qemuarm ?= "af93f3c5ef33dfb378d78b455f7193602ae732a7"
-SRCREV_machine_qemuarm64 ?= "a673c127156c156a4a490ef66e0194d239cfbfa1"
-SRCREV_machine_qemumips ?= "158d19e8753b47a10cf28b27d8b9fe9d0a583c9e"
-SRCREV_machine_qemuppc ?= "a673c127156c156a4a490ef66e0194d239cfbfa1"
-SRCREV_machine_qemuriscv64 ?= "a673c127156c156a4a490ef66e0194d239cfbfa1"
-SRCREV_machine_qemuriscv32 ?= "a673c127156c156a4a490ef66e0194d239cfbfa1"
-SRCREV_machine_qemux86 ?= "a673c127156c156a4a490ef66e0194d239cfbfa1"
-SRCREV_machine_qemux86-64 ?= "a673c127156c156a4a490ef66e0194d239cfbfa1"
-SRCREV_machine_qemumips64 ?= "462641551c0563b755781845b5a315da205e6356"
-SRCREV_machine ?= "a673c127156c156a4a490ef66e0194d239cfbfa1"
+SRCREV_machine_qemuarm ?= "e62fcf364564354b6950338e09599c8c0ae9027d"
+SRCREV_machine_qemuarm64 ?= "bdda1b6cf99b44871409d218426a28102a5c554b"
+SRCREV_machine_qemumips ?= "3560351f3dc225aabbdd2aa44cd3d4e0f6971020"
+SRCREV_machine_qemuppc ?= "bdda1b6cf99b44871409d218426a28102a5c554b"
+SRCREV_machine_qemuriscv64 ?= "bdda1b6cf99b44871409d218426a28102a5c554b"
+SRCREV_machine_qemuriscv32 ?= "bdda1b6cf99b44871409d218426a28102a5c554b"
+SRCREV_machine_qemux86 ?= "bdda1b6cf99b44871409d218426a28102a5c554b"
+SRCREV_machine_qemux86-64 ?= "bdda1b6cf99b44871409d218426a28102a5c554b"
+SRCREV_machine_qemumips64 ?= "1bfe413ad99b88b366ff1451b69e0fc4b84188ea"
+SRCREV_machine ?= "bdda1b6cf99b44871409d218426a28102a5c554b"
 SRCREV_meta ?= "422f8a09a856800f027bbae98dbab24cf3ae0f25"
 
 # remap qemuarm to qemuarma15 for the 5.8 kernel
-- 
2.19.1

