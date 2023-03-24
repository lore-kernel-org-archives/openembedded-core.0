Return-Path: <bruce.ashfield@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 62E4FC6FD1C
	for <webhook@archiver.kernel.org>; Fri, 24 Mar 2023 15:15:27 +0000 (UTC)
Received: from mail-qv1-f51.google.com (mail-qv1-f51.google.com [209.85.219.51])
 by mx.groups.io with SMTP id smtpd.web11.103962.1679670925787703858
 for <openembedded-core@lists.openembedded.org>;
 Fri, 24 Mar 2023 08:15:25 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20210112 header.b=cWlZRpbi;
 spf=pass (domain: gmail.com, ip: 209.85.219.51, mailfrom: bruce.ashfield@gmail.com)
Received: by mail-qv1-f51.google.com with SMTP id l7so1815381qvh.5
        for <openembedded-core@lists.openembedded.org>; Fri, 24 Mar 2023 08:15:25 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112; t=1679670925;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=YrBN3sNSH7Xsiaf5lSc5iO20BBfnie0COm/B+KwBxJI=;
        b=cWlZRpbitSa8BBChTfShRIIboqmY0NBn3179zFNhiW3plfRB0QoHOBFaULQvGOzkJj
         fkZlc8JsaP1NxpUcBxvpBdYDX3+E4E2pts80N4IujPayIj0CRUBWjF0lEs5b2HepboAj
         GQ6T26aDdXCwk+zop1zOosRawjdjcc9Mp5SzHjRotL3JyLBj7dzWUJVAKZzNA/MhuASR
         P6TNH8OA1hLUNevy5tGKK/ZGa9zY5w1RKZDCzNC+sXBpONy764pQOGXQMFSWG5XFE64R
         JN6sEuojHkV96PgeFT6iycpjjkWf209PTUKG6Fu37cHdI6oMImC5SlIHdzptoOkF8kR7
         zXsg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112; t=1679670925;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=YrBN3sNSH7Xsiaf5lSc5iO20BBfnie0COm/B+KwBxJI=;
        b=TlajKVroJ3BBgHVqpuVJasDmQMSeq0P/+RfIAc3bgoorgQppSAIuJwr2wrZ8oaN5Ei
         CgHSsPW5o7dOZA3h1cMcjp0esN0joFhWFNrIedMkF9g+iqX2gEpQ7ZwDBQ8x5WkvTR28
         cFbQOXRLBVJY8laLV5EnV0rI/HcMGwyRS1ZS49G0Ozoj6BwTw4a2B8oUTSVhNpEC5B5B
         +nBhTdh0ooGTfpqs8mJp91qj15PCaBK1uzIaFIqR3NQtNwTYO5iWKf7biU1pPT0sbiJE
         wj5QovD9QMUFOVmnYY0FPsOblG43YsfVFz2ixlsWtaUpZA6hQck0e54dFH78nFq5hdMK
         3l8g==
X-Gm-Message-State: AAQBX9eklaPhGu0efV8dCKTwRnFpoqsERNrxCcunSJ5pVnUpyi4phajI
	L454nFT5/mJgd+mNEdhzn+tMOQubk2fruQ==
X-Google-Smtp-Source: AKy350b+qINbHattooh+kCrRKXcFS33RGAIrKbZ1s5LV3URg6/gArEEdIJO7Pi5FuHKs0cw3vEJYgw==
X-Received: by 2002:a05:6214:27c6:b0:56e:a9d4:429b with SMTP id ge6-20020a05621427c600b0056ea9d4429bmr4792525qvb.1.1679670924461;
        Fri, 24 Mar 2023 08:15:24 -0700 (PDT)
Received: from build.lan (cpe7c9a54441c1f-cm7c9a54441c1d.cpe.net.cable.rogers.com. [173.34.238.88])
        by smtp.gmail.com with ESMTPSA id ek5-20020ad45985000000b005dd8b93459fsm748200qvb.55.2023.03.24.08.15.23
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 24 Mar 2023 08:15:23 -0700 (PDT)
From: bruce.ashfield@gmail.com
To: steve@sakoman.com
Cc: openembedded-core@lists.openembedded.org
Subject: [PATCH 3/4][dunfell] linux-yocto/5.4: update to v5.4.234
Date: Fri, 24 Mar 2023 11:15:19 -0400
Message-Id: <20230324151520.1349287-3-bruce.ashfield@gmail.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20230324151520.1349287-1-bruce.ashfield@gmail.com>
References: <20230324151520.1349287-1-bruce.ashfield@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Fri, 24 Mar 2023 15:15:27 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/179051

From: Bruce Ashfield <bruce.ashfield@gmail.com>

Updating  to the latest korg -stable release that comprises
the following commits:

    a103859aaa71 Linux 5.4.234
    a1e89c8b29d0 USB: core: Don't hold device lock while reading the "descriptors" sysfs file
    96d380d2ae98 USB: serial: option: add support for VW/Skoda "Carstick LTE"
    91c877d4311f dmaengine: sh: rcar-dmac: Check for error num after dma_set_max_seg_size
    465ce31a2bcc vc_screen: don't clobber return value in vcs_read
    ee8cd3abe722 net: Remove WARN_ON_ONCE(sk->sk_forward_alloc) from sk_stream_kill_queues().
    db25b41eb531 bpf: bpf_fib_lookup should not return neigh in NUD_FAILED state
    23affaed760b HID: core: Fix deadloop in hid_apply_multiplier.
    93b17c7e1e1c neigh: make sure used and confirmed times are valid
    bc4601ad979a IB/hfi1: Assign npages earlier
    98e626c115f8 btrfs: send: limit number of clones and allocated memory size
    ae03fa7ad343 ACPI: NFIT: fix a potential deadlock during NFIT teardown
    785bde845991 ARM: dts: rockchip: add power-domains property to dp node on rk3288
    da2bba879eca arm64: dts: rockchip: drop unused LED mode property from rk3328-roc-cc

Signed-off-by: Bruce Ashfield <bruce.ashfield@gmail.com>
---
 .../linux/linux-yocto-rt_5.4.bb               |  6 ++---
 .../linux/linux-yocto-tiny_5.4.bb             |  8 +++----
 meta/recipes-kernel/linux/linux-yocto_5.4.bb  | 22 +++++++++----------
 3 files changed, 18 insertions(+), 18 deletions(-)

diff --git a/meta/recipes-kernel/linux/linux-yocto-rt_5.4.bb b/meta/recipes-kernel/linux/linux-yocto-rt_5.4.bb
index 133d9484db..84969d43fe 100644
--- a/meta/recipes-kernel/linux/linux-yocto-rt_5.4.bb
+++ b/meta/recipes-kernel/linux/linux-yocto-rt_5.4.bb
@@ -11,13 +11,13 @@ python () {
         raise bb.parse.SkipRecipe("Set PREFERRED_PROVIDER_virtual/kernel to linux-yocto-rt to enable it")
 }
 
-SRCREV_machine ?= "e68dd38ef88dbe506472a8df31a7b454505908f3"
-SRCREV_meta ?= "04a8941a1c8ce5c21e2ec10231f61c96d918bd6d"
+SRCREV_machine ?= "187d5fab513b96abf3e2f14fa8dc93b1fc46b30a"
+SRCREV_meta ?= "14a6c591781abff4dfde8b92fe889ac7b7c25487"
 
 SRC_URI = "git://git.yoctoproject.org/linux-yocto.git;branch=${KBRANCH};name=machine \
            git://git.yoctoproject.org/yocto-kernel-cache;type=kmeta;name=meta;branch=yocto-5.4;destsuffix=${KMETA}"
 
-LINUX_VERSION ?= "5.4.233"
+LINUX_VERSION ?= "5.4.234"
 
 LIC_FILES_CHKSUM = "file://COPYING;md5=bbea815ee2795b2f4230826c0c6b8814"
 
diff --git a/meta/recipes-kernel/linux/linux-yocto-tiny_5.4.bb b/meta/recipes-kernel/linux/linux-yocto-tiny_5.4.bb
index 0e144c1acf..23ee693f0f 100644
--- a/meta/recipes-kernel/linux/linux-yocto-tiny_5.4.bb
+++ b/meta/recipes-kernel/linux/linux-yocto-tiny_5.4.bb
@@ -6,7 +6,7 @@ KCONFIG_MODE = "--allnoconfig"
 
 require recipes-kernel/linux/linux-yocto.inc
 
-LINUX_VERSION ?= "5.4.233"
+LINUX_VERSION ?= "5.4.234"
 LIC_FILES_CHKSUM = "file://COPYING;md5=bbea815ee2795b2f4230826c0c6b8814"
 
 DEPENDS += "${@bb.utils.contains('ARCH', 'x86', 'elfutils-native', '', d)}"
@@ -15,9 +15,9 @@ DEPENDS += "openssl-native util-linux-native"
 KMETA = "kernel-meta"
 KCONF_BSP_AUDIT_LEVEL = "2"
 
-SRCREV_machine_qemuarm ?= "9f2a124e75fe91216e730fc6b055b793737a8a66"
-SRCREV_machine ?= "bfe78e26b6c27a1f83abc5ef9b93fcc39199824d"
-SRCREV_meta ?= "04a8941a1c8ce5c21e2ec10231f61c96d918bd6d"
+SRCREV_machine_qemuarm ?= "9c10968641ca9017c2f0dd6f7b74f5f59396a573"
+SRCREV_machine ?= "a11f7767b574820390370e80f5c5084830f3ef17"
+SRCREV_meta ?= "14a6c591781abff4dfde8b92fe889ac7b7c25487"
 
 PV = "${LINUX_VERSION}+git${SRCPV}"
 
diff --git a/meta/recipes-kernel/linux/linux-yocto_5.4.bb b/meta/recipes-kernel/linux/linux-yocto_5.4.bb
index 1468f9acf5..b053912072 100644
--- a/meta/recipes-kernel/linux/linux-yocto_5.4.bb
+++ b/meta/recipes-kernel/linux/linux-yocto_5.4.bb
@@ -12,16 +12,16 @@ KBRANCH_qemux86  ?= "v5.4/standard/base"
 KBRANCH_qemux86-64 ?= "v5.4/standard/base"
 KBRANCH_qemumips64 ?= "v5.4/standard/mti-malta64"
 
-SRCREV_machine_qemuarm ?= "40299a1e34d11f3dc7d17fe9dbb83d7e99ad88d8"
-SRCREV_machine_qemuarm64 ?= "d317fa78733b175da112b551eae780d7e6cecc5f"
-SRCREV_machine_qemumips ?= "34bf249db02c8548e86c8d8294a5c153d60f3b74"
-SRCREV_machine_qemuppc ?= "144970fe07e46df90ad69b896def4f35cb1245e5"
-SRCREV_machine_qemuriscv64 ?= "3738f9fc3662b6f6e131c7c9844da1000f37ffc2"
-SRCREV_machine_qemux86 ?= "3738f9fc3662b6f6e131c7c9844da1000f37ffc2"
-SRCREV_machine_qemux86-64 ?= "3738f9fc3662b6f6e131c7c9844da1000f37ffc2"
-SRCREV_machine_qemumips64 ?= "70dd62b13f29ef10e41c288047cc59c0f4d24d06"
-SRCREV_machine ?= "3738f9fc3662b6f6e131c7c9844da1000f37ffc2"
-SRCREV_meta ?= "04a8941a1c8ce5c21e2ec10231f61c96d918bd6d"
+SRCREV_machine_qemuarm ?= "1eae19a4e0b117b32f0080c46eb40c563e71d184"
+SRCREV_machine_qemuarm64 ?= "923c7f7cb375e1e5e0db94f5c0bddad4322ed527"
+SRCREV_machine_qemumips ?= "f9eaa41aa8584963e8322b6b2511b23520b71763"
+SRCREV_machine_qemuppc ?= "1fd537c9f8e58d0af31e5584703266e32f7b3f92"
+SRCREV_machine_qemuriscv64 ?= "0241de2e2ba31e07ee854baa8be0c1e1ad424ac1"
+SRCREV_machine_qemux86 ?= "0241de2e2ba31e07ee854baa8be0c1e1ad424ac1"
+SRCREV_machine_qemux86-64 ?= "0241de2e2ba31e07ee854baa8be0c1e1ad424ac1"
+SRCREV_machine_qemumips64 ?= "964dd71b16c99235ab10cede1727f50ebc27eaad"
+SRCREV_machine ?= "0241de2e2ba31e07ee854baa8be0c1e1ad424ac1"
+SRCREV_meta ?= "14a6c591781abff4dfde8b92fe889ac7b7c25487"
 
 # remap qemuarm to qemuarma15 for the 5.4 kernel
 # KMACHINE_qemuarm ?= "qemuarma15"
@@ -30,7 +30,7 @@ SRC_URI = "git://git.yoctoproject.org/linux-yocto.git;name=machine;branch=${KBRA
            git://git.yoctoproject.org/yocto-kernel-cache;type=kmeta;name=meta;branch=yocto-5.4;destsuffix=${KMETA}"
 
 LIC_FILES_CHKSUM = "file://COPYING;md5=bbea815ee2795b2f4230826c0c6b8814"
-LINUX_VERSION ?= "5.4.233"
+LINUX_VERSION ?= "5.4.234"
 
 DEPENDS += "${@bb.utils.contains('ARCH', 'x86', 'elfutils-native', '', d)}"
 DEPENDS += "openssl-native util-linux-native"
-- 
2.34.1


