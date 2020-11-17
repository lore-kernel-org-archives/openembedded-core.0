Received: from mail-qt1-f196.google.com (mail-qt1-f196.google.com [209.85.160.196])
 by mx.groups.io with SMTP id smtpd.web12.9366.1605626684557735417
 for <openembedded-core@lists.openembedded.org>;
 Tue, 17 Nov 2020 07:24:44 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20161025 header.b=K/dkqcE7;
 spf=pass (domain: gmail.com, ip: 209.85.160.196, mailfrom: bruce.ashfield@gmail.com)
Received: by mail-qt1-f196.google.com with SMTP id m65so15778366qte.11
        for <openembedded-core@lists.openembedded.org>; Tue, 17 Nov 2020 07:24:44 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:content-transfer-encoding;
        bh=ovamVv7UM7dhhlYK5qYsZ18Ude+Svbty3av3TWTtmbA=;
        b=K/dkqcE7Bih6rNlmqi1MHulzGJekWW+k8epLtnAGA88kMzbPx6Rn/IJtmmP0Qr4RjV
         yVzgn5cyDiNUFXgkIK+rEmexABNfMH/xv0cNjqu8DyvMRkKx1AG6D26ZzjFLd6rxLlHX
         l0pqrvKxTYndCHswDncFpxwg1ItNzGFZy3h9KsseN4bpEEiqNFwc50iVlayRDI6J92Ma
         vkeY7c+XqhwZ/o2Szx6phlhLx6oQq36wwyF5bGBKarAGJtxBhIVdNot4q/R9O+3D55TX
         udwm3/GtzGnaYcVnylwGf011ta8xQL/sA0Xd7n+7iCYweI+4wijHNW1bqp5qsK7QMqJW
         Dqwg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=ovamVv7UM7dhhlYK5qYsZ18Ude+Svbty3av3TWTtmbA=;
        b=NQKTzp3TcMzyeSY2bKNXtaLIx7S/vZYJEv7BQxuueaARieQOlkZeo8JNad2t45rYDh
         sBbqz58CFNnyYcqc5mZeIFq+m40JKU5JWvFDZPk2DMU0Amq8gGX+vFElV9/JvSS4I27D
         HG+Wn1+qL5mvw/RIewzyNb+SLZw9o3k4ufqlJ9bQPb0SzNfFaU+QnocOJpijuH/x79el
         nYotzsJd4SEDP1zpZsAy+hiFY/rZsTrziidmRfxhjxMFs1Vsk/+k3gMdQJnpxlGmIjtN
         enYQIy2biTdQ0EzhuLAAfELKP1lKBKqnlzo4nx4AEPLBMgVEAQ11Qys33DcO5QVIpgkA
         9ftA==
X-Gm-Message-State: AOAM533vOTetpEgupOhKb0a0MtoCxqzT397ZEbpOk5cZBqs+A1VNjP4Z
	gglq/yoPm6+BCOLeGAmKRDnlnXoO4u+RX5qe
X-Google-Smtp-Source: ABdhPJxT6FNN5KaXB0vZc8q+fGLxbzzCC/AGGWGT7ZBgUi/UE5DwIdJkuHTEw15/2MaNCPehoTMBzA==
X-Received: by 2002:ac8:7593:: with SMTP id s19mr121533qtq.243.1605626683718;
        Tue, 17 Nov 2020 07:24:43 -0800 (PST)
Return-Path: <bruce.ashfield@gmail.com>
Received: from localhost.localdomain (cpe04d4c4975b80-cm64777d5e8820.cpe.net.cable.rogers.com. [174.112.165.127])
        by smtp.gmail.com with ESMTPSA id u24sm14537923qtb.33.2020.11.17.07.24.42
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 17 Nov 2020 07:24:42 -0800 (PST)
From: "Bruce Ashfield" <bruce.ashfield@gmail.com>
To: richard.purdie@linuxfoundation.org
Cc: openembedded-core@lists.openembedded.org
Subject: [PATCH 03/11] linux-yocto/5.8: update to v5.8.16
Date: Tue, 17 Nov 2020 10:24:29 -0500
Message-Id: <8885bbe50427fb28859a7a5d86e2303c1bd965dc.1605626488.git.bruce.ashfield@gmail.com>
X-Mailer: git-send-email 2.19.1
In-Reply-To: <cover.1605626488.git.bruce.ashfield@gmail.com>
References: <cover.1605626488.git.bruce.ashfield@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

From: Bruce Ashfield <bruce.ashfield@gmail.com>

Updating linux-yocto/5.8 to the latest korg -stable release that comprises
the following commits:

    c5464f4be19b Linux 5.8.16
    4cadc0dd5ce2 reiserfs: Fix oops during mount
    492f415bb105 reiserfs: Initialize inode keys properly
    27319196d104 USB: serial: ftdi_sio: add support for FreeCalypso JTAG+UART adapters
    56eff3982215 USB: serial: pl2303: add device-id for HP GC device
    e95645fd1e28 staging: comedi: check validity of wMaxPacketSize of usb endpoints found
    75ea7049c9c6 USB: serial: option: Add Telit FT980-KS composition
    a7f0e37b29f4 USB: serial: option: add Cellient MPL200 card
    d6efa7525a59 media: usbtv: Fix refcounting mixup
    1b7150e1c95e Bluetooth: Disconnect if E0 is used for Level 4
    9e473bae14f3 Bluetooth: MGMT: Fix not checking if BT_HS is enabled
    ffddc73458e8 Bluetooth: L2CAP: Fix calling sk_filter on non-socket based channel
    a350bfd9a93f Bluetooth: A2MP: Fix not initializing all members
    8fae48c4bf67 crypto: qat - check cipher length for aead AES-CBC-HMAC-SHA
    c4ab0a2944b8 crypto: bcm - Verify GCM/CCM key length in setkey

Signed-off-by: Bruce Ashfield <bruce.ashfield@gmail.com>
---
 .../linux/linux-yocto-rt_5.8.bb               |  6 ++---
 .../linux/linux-yocto-tiny_5.8.bb             |  8 +++----
 meta/recipes-kernel/linux/linux-yocto_5.8.bb  | 22 +++++++++----------
 3 files changed, 18 insertions(+), 18 deletions(-)

diff --git a/meta/recipes-kernel/linux/linux-yocto-rt_5.8.bb b/meta/recipes-kernel/linux/linux-yocto-rt_5.8.bb
index ad93121661..6dd8df6c3b 100644
--- a/meta/recipes-kernel/linux/linux-yocto-rt_5.8.bb
+++ b/meta/recipes-kernel/linux/linux-yocto-rt_5.8.bb
@@ -11,13 +11,13 @@ python () {
         raise bb.parse.SkipRecipe("Set PREFERRED_PROVIDER_virtual/kernel to linux-yocto-rt to enable it")
 }
 
-SRCREV_machine ?= "c6df484eedc229ed894702fd3cef10c936ffc5f7"
-SRCREV_meta ?= "fcb4c6f2fdb1a67e4995e0282b3424ce02515f71"
+SRCREV_machine ?= "4e5f265cee903c1fe0f558656b23ca5dcaf92b43"
+SRCREV_meta ?= "7b9ba93dfc39efa90056eed0b572e86909127aaa"
 
 SRC_URI = "git://git.yoctoproject.org/linux-yocto.git;branch=${KBRANCH};name=machine \
            git://git.yoctoproject.org/yocto-kernel-cache;type=kmeta;name=meta;branch=yocto-5.8;destsuffix=${KMETA}"
 
-LINUX_VERSION ?= "5.8.15"
+LINUX_VERSION ?= "5.8.16"
 
 LIC_FILES_CHKSUM = "file://COPYING;md5=6bc538ed5bd9a7fc9398086aedcd7e46"
 
diff --git a/meta/recipes-kernel/linux/linux-yocto-tiny_5.8.bb b/meta/recipes-kernel/linux/linux-yocto-tiny_5.8.bb
index bee0cebcfa..69c292f275 100644
--- a/meta/recipes-kernel/linux/linux-yocto-tiny_5.8.bb
+++ b/meta/recipes-kernel/linux/linux-yocto-tiny_5.8.bb
@@ -6,7 +6,7 @@ KCONFIG_MODE = "--allnoconfig"
 
 require recipes-kernel/linux/linux-yocto.inc
 
-LINUX_VERSION ?= "5.8.15"
+LINUX_VERSION ?= "5.8.16"
 LIC_FILES_CHKSUM = "file://COPYING;md5=6bc538ed5bd9a7fc9398086aedcd7e46"
 
 DEPENDS += "${@bb.utils.contains('ARCH', 'x86', 'elfutils-native', '', d)}"
@@ -15,9 +15,9 @@ DEPENDS += "openssl-native util-linux-native"
 KMETA = "kernel-meta"
 KCONF_BSP_AUDIT_LEVEL = "2"
 
-SRCREV_machine_qemuarm ?= "29bb8494265c9b2b4c6263cd182d9698803bca70"
-SRCREV_machine ?= "c6df484eedc229ed894702fd3cef10c936ffc5f7"
-SRCREV_meta ?= "fcb4c6f2fdb1a67e4995e0282b3424ce02515f71"
+SRCREV_machine_qemuarm ?= "be316733dd181e972379b0c3b69e930c7e3637c5"
+SRCREV_machine ?= "4e5f265cee903c1fe0f558656b23ca5dcaf92b43"
+SRCREV_meta ?= "7b9ba93dfc39efa90056eed0b572e86909127aaa"
 
 PV = "${LINUX_VERSION}+git${SRCPV}"
 
diff --git a/meta/recipes-kernel/linux/linux-yocto_5.8.bb b/meta/recipes-kernel/linux/linux-yocto_5.8.bb
index b70319d8d6..8b70ee9283 100644
--- a/meta/recipes-kernel/linux/linux-yocto_5.8.bb
+++ b/meta/recipes-kernel/linux/linux-yocto_5.8.bb
@@ -12,16 +12,16 @@ KBRANCH_qemux86  ?= "v5.8/standard/base"
 KBRANCH_qemux86-64 ?= "v5.8/standard/base"
 KBRANCH_qemumips64 ?= "v5.8/standard/mti-malta64"
 
-SRCREV_machine_qemuarm ?= "3a57eada4ccbc6c770cf1352b60e74b845f01ee8"
-SRCREV_machine_qemuarm64 ?= "c6df484eedc229ed894702fd3cef10c936ffc5f7"
-SRCREV_machine_qemumips ?= "c2b7ecc61b0e3dbe394eabc90f7ac681a5a7bfaa"
-SRCREV_machine_qemuppc ?= "c6df484eedc229ed894702fd3cef10c936ffc5f7"
-SRCREV_machine_qemuriscv64 ?= "c6df484eedc229ed894702fd3cef10c936ffc5f7"
-SRCREV_machine_qemux86 ?= "c6df484eedc229ed894702fd3cef10c936ffc5f7"
-SRCREV_machine_qemux86-64 ?= "c6df484eedc229ed894702fd3cef10c936ffc5f7"
-SRCREV_machine_qemumips64 ?= "71dc25ebfb9b5860d2d2340a5372958c707a831a"
-SRCREV_machine ?= "c6df484eedc229ed894702fd3cef10c936ffc5f7"
-SRCREV_meta ?= "fcb4c6f2fdb1a67e4995e0282b3424ce02515f71"
+SRCREV_machine_qemuarm ?= "483273f898cbdd3fa344f1d2f67ac52c991f1cb0"
+SRCREV_machine_qemuarm64 ?= "4e5f265cee903c1fe0f558656b23ca5dcaf92b43"
+SRCREV_machine_qemumips ?= "a87cd0744b74ada1d5f83cccae63c06d5a6e3eec"
+SRCREV_machine_qemuppc ?= "4e5f265cee903c1fe0f558656b23ca5dcaf92b43"
+SRCREV_machine_qemuriscv64 ?= "4e5f265cee903c1fe0f558656b23ca5dcaf92b43"
+SRCREV_machine_qemux86 ?= "4e5f265cee903c1fe0f558656b23ca5dcaf92b43"
+SRCREV_machine_qemux86-64 ?= "4e5f265cee903c1fe0f558656b23ca5dcaf92b43"
+SRCREV_machine_qemumips64 ?= "8cbec349bbcf94a5b37f44a43168db0bbec20af1"
+SRCREV_machine ?= "4e5f265cee903c1fe0f558656b23ca5dcaf92b43"
+SRCREV_meta ?= "7b9ba93dfc39efa90056eed0b572e86909127aaa"
 
 # remap qemuarm to qemuarma15 for the 5.8 kernel
 # KMACHINE_qemuarm ?= "qemuarma15"
@@ -30,7 +30,7 @@ SRC_URI = "git://git.yoctoproject.org/linux-yocto.git;name=machine;branch=${KBRA
            git://git.yoctoproject.org/yocto-kernel-cache;type=kmeta;name=meta;branch=yocto-5.8;destsuffix=${KMETA}"
 
 LIC_FILES_CHKSUM = "file://COPYING;md5=6bc538ed5bd9a7fc9398086aedcd7e46"
-LINUX_VERSION ?= "5.8.15"
+LINUX_VERSION ?= "5.8.16"
 
 DEPENDS += "${@bb.utils.contains('ARCH', 'x86', 'elfutils-native', '', d)}"
 DEPENDS += "openssl-native util-linux-native"
-- 
2.19.1

