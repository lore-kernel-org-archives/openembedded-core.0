Received: from mail-qv1-f67.google.com (mail-qv1-f67.google.com [209.85.219.67])
 by mx.groups.io with SMTP id smtpd.web10.88148.1597843490871213909
 for <openembedded-core@lists.openembedded.org>;
 Wed, 19 Aug 2020 06:24:51 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20161025 header.b=i6l/J+VV;
 spf=pass (domain: gmail.com, ip: 209.85.219.67, mailfrom: bruce.ashfield@gmail.com)
Received: by mail-qv1-f67.google.com with SMTP id t6so11234647qvw.1
        for <openembedded-core@lists.openembedded.org>; Wed, 19 Aug 2020 06:24:50 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:content-transfer-encoding;
        bh=EJ/UlBZPE5mybqA7un+RygRiP405HbR3jGTAve2333k=;
        b=i6l/J+VVO+qSnBXlZoVMvXz/eJlQUTUgaKuV4TpSsjzsOvOcLHtgRV63E/2F3m+10V
         NhOYjawUEukMFhKyNgWtFbJECn78B9v0Qz95C0oyZDGA7j3KHIMM5fHal0b4onJJq0p1
         NBBu2+jTzNxHFwS56ypNzBwKj8dLU14SV02xZnAACyrLEwmoFJRUqYFkVffj+at7ZZcy
         xVDFlGH/HDE28ce6jgi2TuC1pj4m/st6CybhcirjjgOeZGXwbGkApq2Xk7+WO8rddn8d
         Q1oO+5h5YpXFBidS2Sum0yPEMgs7oMoJOO2MrnbLOmyDgd5KFGHYCjTW+a7/nGZvQY+O
         uRcg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=EJ/UlBZPE5mybqA7un+RygRiP405HbR3jGTAve2333k=;
        b=YJx/huEuxQkFAkh5s/kI/CAZ3Pbsd/nvmM0uDuwbSoz+3scIJK7E3BC2x1fbfNKiSu
         6OGOYZAB5KmEnfEVaYLSYgslJPsp3pdg5EJ5x1DGTU+O82tmjaQ7thIzofZ2mx6CUDPC
         O7HD5rT4xGHKEEoaiU27f2L8LSV12AGSgxafKdvdvbMSnLL1sgS7gyV5GnFiRvpRlF7t
         kevnnlbrwXbpaCeZY6V2J9segVjMhJjzhN8JSoj+nX1Q+mLmGkzsuvfz6eK7guiLFI46
         ph5HSYsOJ5pIHlJEVb3ayxE3XHksZTgeZDzKaDZBpHPHG4TWzzbCYL4vejTVLYNtkDev
         /JsA==
X-Gm-Message-State: AOAM532rKbZfEQRghAAAMclHuyOUxZkRFoA9Cw7WZ4vvI59dv8AAWlpf
	27MrGq4xPNOlbTpxEsJme/CJa1o+jRQOX0OE
X-Google-Smtp-Source: ABdhPJwfBQqZqMkuHqDQkaB402DP0/qG0P3Tv6Z7VkioQvHeg48OWcjZvNdpVWFVo1QrYQfKRdt3YQ==
X-Received: by 2002:a0c:ca86:: with SMTP id a6mr23201070qvk.209.1597843489897;
        Wed, 19 Aug 2020 06:24:49 -0700 (PDT)
Return-Path: <bruce.ashfield@gmail.com>
Received: from localhost.localdomain (CPE04d4c4975b80-CM64777d5e8820.cpe.net.cable.rogers.com. [174.112.240.214])
        by smtp.gmail.com with ESMTPSA id t93sm26873088qtd.97.2020.08.19.06.24.48
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 19 Aug 2020 06:24:49 -0700 (PDT)
From: "Bruce Ashfield" <bruce.ashfield@gmail.com>
To: richard.purdie@linuxfoundation.org
Cc: openembedded-core@lists.openembedded.org
Subject: [PATCH 4/4] linux-yocto/5.8: update to v5.8.1
Date: Wed, 19 Aug 2020 09:24:42 -0400
Message-Id: <947caac2b97845f065e86b7c293d4924e7167ac5.1597843173.git.bruce.ashfield@gmail.com>
X-Mailer: git-send-email 2.19.1
In-Reply-To: <cover.1597843173.git.bruce.ashfield@gmail.com>
References: <cover.1597843173.git.bruce.ashfield@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

From: Bruce Ashfield <bruce.ashfield@gmail.com>

Updating linux-yocto/5.8 to the latest korg -stable release that comprises
the following commits:

    5f49ff2540e2 Linux 5.8.1
    b08bdb1dfc66 arm64: kaslr: Use standard early random function
    cdb665888c69 random: random.h should include archrandom.h, not the other way around
    6ccec4279301 random32: move the pseudo-random 32-bit definitions to prandom.h
    37b9e5781ba9 ima: move APPRAISE_BOOTPARAM dependency on ARCH_POLICY to runtime
    f9e3fa895314 PCI: tegra: Revert tegra124 raw_violation_fixup
    6f5f284ac0a1 powerpc/kasan: Fix shadow pages allocation failure
    4fed32566a03 Revert "powerpc/kasan: Fix shadow pages allocation failure"
    ff35fac0d075 xattr: break delegations in {set,remove}xattr
    325811793d34 gpio: max77620: Fix missing release of interrupt
    344c69a06049 leds: 88pm860x: fix use-after-free on unbind
    6796fca30e0a leds: lm3533: fix use-after-free on unbind
    6e99065db5b9 leds: da903x: fix use-after-free on unbind
    405c0f560437 leds: lm36274: fix use-after-free on unbind
    2cbb6111b385 leds: wm831x-status: fix use-after-free on unbind
    eb3d82abc335 mtd: properly check all write ioctls for permissions
    0ca4ebe9d635 vgacon: Fix for missing check in scrollback handling
    b8eb3d95c2d4 lkdtm/heap: Avoid edge and middle of slabs
    3266873640b7 scripts: add dummy report mode to add_namespace.cocci
    5ec142a2e9e6 Smack: fix use-after-free in smk_write_relabel_self()
    382c0fa38c0e binder: Prevent context manager from incrementing ref 0
    3a75ed41c7ab omapfb: dss: Fix max fclk divider for omap36xx
    be1c835747f9 Bluetooth: Prevent out-of-bounds read in hci_inquiry_result_with_rssi_evt()
    f00e01212d78 Bluetooth: Prevent out-of-bounds read in hci_inquiry_result_evt()
    cc09a53b7252 Bluetooth: Fix slab-out-of-bounds read in hci_extended_inquiry_result_evt()
    51af3c373643 Staging: rtl8188eu: rtw_mlme: Fix uninitialized variable authmode
    22e041f720e6 staging: rtl8712: handle firmware load failure
    7fa3a6e9061c staging: android: ashmem: Fix lockdep warning for write operation
    98228ec8440f ALSA: seq: oss: Serialize ioctls
    f990beaaff08 ALSA: hda/ca0132 - Fix AE-5 microphone selection commands.
    e0b12b2ba9ed ALSA: hda/ca0132 - Fix ZxR Headphone gain control get value.
    b743b82bdfa8 ALSA: hda/ca0132 - Add new quirk ID for Recon3D.
    ea441daae389 ALSA: hda/realtek: Add alc269/alc662 pin-tables for Loongson-3 laptops
    88f484351d8f Revert "ALSA: hda: call runtime_allow() for all hda controllers"
    a7e7da440092 usb: xhci: Fix ASMedia ASM1142 DMA addressing
    2ef10b5be9a5 usb: xhci: define IDs for various ASMedia host controllers
    3d73faca68fa USB: iowarrior: fix up report size handling for some devices
    a7ee4b448513 USB: serial: qcserial: add EM7305 QDL product ID
    e912cdc8d225 scsi: ufs: Fix and simplify setup_xfer_req variant operation

Signed-off-by: Bruce Ashfield <bruce.ashfield@gmail.com>
---
 .../linux/linux-yocto-rt_5.8.bb               |  6 ++---
 .../linux/linux-yocto-tiny_5.8.bb             |  8 +++----
 meta/recipes-kernel/linux/linux-yocto_5.8.bb  | 22 +++++++++----------
 3 files changed, 18 insertions(+), 18 deletions(-)

diff --git a/meta/recipes-kernel/linux/linux-yocto-rt_5.8.bb b/meta/recipes-kernel/linux/linux-yocto-rt_5.8.bb
index 11bd4579f8..e23e7dcfb1 100644
--- a/meta/recipes-kernel/linux/linux-yocto-rt_5.8.bb
+++ b/meta/recipes-kernel/linux/linux-yocto-rt_5.8.bb
@@ -11,13 +11,13 @@ python () {
         raise bb.parse.SkipRecipe("Set PREFERRED_PROVIDER_virtual/kernel to linux-yocto-rt to enable it")
 }
 
-SRCREV_machine ?= "581a55ca5571041bc5885febe8415c5751c489d9"
-SRCREV_meta ?= "4c62a6f4fa227abacf87f1593faa1ac6e6616156"
+SRCREV_machine ?= "d3c69e89ee5b5d4c3c19b8614bdcdc3f5dc7a8b3"
+SRCREV_meta ?= "a3138cb23c3b7409c516d5d2115da9534c120a0c"
 
 SRC_URI = "git://git.yoctoproject.org/linux-yocto.git;branch=${KBRANCH};name=machine \
            git://git.yoctoproject.org/yocto-kernel-cache;type=kmeta;name=meta;branch=yocto-5.8;destsuffix=${KMETA}"
 
-LINUX_VERSION ?= "5.8"
+LINUX_VERSION ?= "5.8.1"
 
 LIC_FILES_CHKSUM = "file://COPYING;md5=6bc538ed5bd9a7fc9398086aedcd7e46"
 
diff --git a/meta/recipes-kernel/linux/linux-yocto-tiny_5.8.bb b/meta/recipes-kernel/linux/linux-yocto-tiny_5.8.bb
index 1d52bfeeba..36a8ae4577 100644
--- a/meta/recipes-kernel/linux/linux-yocto-tiny_5.8.bb
+++ b/meta/recipes-kernel/linux/linux-yocto-tiny_5.8.bb
@@ -6,7 +6,7 @@ KCONFIG_MODE = "--allnoconfig"
 
 require recipes-kernel/linux/linux-yocto.inc
 
-LINUX_VERSION ?= "5.8"
+LINUX_VERSION ?= "5.8.1"
 LIC_FILES_CHKSUM = "file://COPYING;md5=6bc538ed5bd9a7fc9398086aedcd7e46"
 
 DEPENDS += "${@bb.utils.contains('ARCH', 'x86', 'elfutils-native', '', d)}"
@@ -15,9 +15,9 @@ DEPENDS += "openssl-native util-linux-native"
 KMETA = "kernel-meta"
 KCONF_BSP_AUDIT_LEVEL = "2"
 
-SRCREV_machine_qemuarm ?= "8c6b76ac37ee5c0f09ffff816a6519f3f8ea6582"
-SRCREV_machine ?= "581a55ca5571041bc5885febe8415c5751c489d9"
-SRCREV_meta ?= "4c62a6f4fa227abacf87f1593faa1ac6e6616156"
+SRCREV_machine_qemuarm ?= "566e869df9400258b6f162bf34933f5b6dcd0115"
+SRCREV_machine ?= "d3c69e89ee5b5d4c3c19b8614bdcdc3f5dc7a8b3"
+SRCREV_meta ?= "a3138cb23c3b7409c516d5d2115da9534c120a0c"
 
 PV = "${LINUX_VERSION}+git${SRCPV}"
 
diff --git a/meta/recipes-kernel/linux/linux-yocto_5.8.bb b/meta/recipes-kernel/linux/linux-yocto_5.8.bb
index 27345beca9..aad689590c 100644
--- a/meta/recipes-kernel/linux/linux-yocto_5.8.bb
+++ b/meta/recipes-kernel/linux/linux-yocto_5.8.bb
@@ -12,16 +12,16 @@ KBRANCH_qemux86  ?= "v5.8/standard/base"
 KBRANCH_qemux86-64 ?= "v5.8/standard/base"
 KBRANCH_qemumips64 ?= "v5.8/standard/mti-malta64"
 
-SRCREV_machine_qemuarm ?= "e6215284f772360ed2110b2f9b5ab5cfbeb60550"
-SRCREV_machine_qemuarm64 ?= "581a55ca5571041bc5885febe8415c5751c489d9"
-SRCREV_machine_qemumips ?= "421057004e4e9847219dc966ecebe3174bf9c670"
-SRCREV_machine_qemuppc ?= "581a55ca5571041bc5885febe8415c5751c489d9"
-SRCREV_machine_qemuriscv64 ?= "581a55ca5571041bc5885febe8415c5751c489d9"
-SRCREV_machine_qemux86 ?= "581a55ca5571041bc5885febe8415c5751c489d9"
-SRCREV_machine_qemux86-64 ?= "581a55ca5571041bc5885febe8415c5751c489d9"
-SRCREV_machine_qemumips64 ?= "b3f4fce505798c95cdce90a9551cbf68de7bd811"
-SRCREV_machine ?= "581a55ca5571041bc5885febe8415c5751c489d9"
-SRCREV_meta ?= "4c62a6f4fa227abacf87f1593faa1ac6e6616156"
+SRCREV_machine_qemuarm ?= "097417e785af04be0cbe757bc6e24456a3f701fd"
+SRCREV_machine_qemuarm64 ?= "d3c69e89ee5b5d4c3c19b8614bdcdc3f5dc7a8b3"
+SRCREV_machine_qemumips ?= "1fc5490bef8322680d73f6ab2c7b666eccc3bce1"
+SRCREV_machine_qemuppc ?= "d3c69e89ee5b5d4c3c19b8614bdcdc3f5dc7a8b3"
+SRCREV_machine_qemuriscv64 ?= "d3c69e89ee5b5d4c3c19b8614bdcdc3f5dc7a8b3"
+SRCREV_machine_qemux86 ?= "d3c69e89ee5b5d4c3c19b8614bdcdc3f5dc7a8b3"
+SRCREV_machine_qemux86-64 ?= "d3c69e89ee5b5d4c3c19b8614bdcdc3f5dc7a8b3"
+SRCREV_machine_qemumips64 ?= "e61fc06792254eed92c6908a9b35790ed54b0ace"
+SRCREV_machine ?= "d3c69e89ee5b5d4c3c19b8614bdcdc3f5dc7a8b3"
+SRCREV_meta ?= "a3138cb23c3b7409c516d5d2115da9534c120a0c"
 
 # remap qemuarm to qemuarma15 for the 5.8 kernel
 # KMACHINE_qemuarm ?= "qemuarma15"
@@ -30,7 +30,7 @@ SRC_URI = "git://git.yoctoproject.org/linux-yocto.git;name=machine;branch=${KBRA
            git://git.yoctoproject.org/yocto-kernel-cache;type=kmeta;name=meta;branch=yocto-5.8;destsuffix=${KMETA}"
 
 LIC_FILES_CHKSUM = "file://COPYING;md5=6bc538ed5bd9a7fc9398086aedcd7e46"
-LINUX_VERSION ?= "5.8"
+LINUX_VERSION ?= "5.8.1"
 
 DEPENDS += "${@bb.utils.contains('ARCH', 'x86', 'elfutils-native', '', d)}"
 DEPENDS += "openssl-native util-linux-native"
-- 
2.19.1

