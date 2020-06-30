Received: from mail-qv1-f67.google.com (mail-qv1-f67.google.com [209.85.219.67])
 by mx.groups.io with SMTP id smtpd.web11.9140.1593494334206409389
 for <openembedded-core@lists.openembedded.org>;
 Mon, 29 Jun 2020 22:18:54 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20161025 header.b=feJ3sRon;
 spf=pass (domain: gmail.com, ip: 209.85.219.67, mailfrom: bruce.ashfield@gmail.com)
Received: by mail-qv1-f67.google.com with SMTP id d12so8765756qvn.0
        for <openembedded-core@lists.openembedded.org>; Mon, 29 Jun 2020 22:18:54 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:content-transfer-encoding;
        bh=qZum+0EZSFjQpUzSNjrzOPeItuT1JcW481Zhm+MPzXo=;
        b=feJ3sRonZL45KaCfhMYkA+xwUwrYeaP/Pr/4E4xnXVyYG1cgWKA2xyh6U3/6fFtGSE
         PT7G/v8bKXxn+as7c62BPoMTLwocUErdK27qgWWHiwPa5DEssjKcechJokPetyOpWDLw
         Q2KAlf8DSdZcvW0SzQxT2vwwuGN/a+ZcBKBjzsJRQNvOzkONMmtstZerW0e1FPu4AC91
         tEK41m60Xd00424lXgEqQx6ynw//3ehS6CNX6bAVh+YHtJaFSQuqcxcVS+yHiCosk8ph
         0P2DE0C+mikyZJAOR/3gXc3OcY0I5j4/jDGF+jRY3E16k98Jt+cNL7TJd7B8zAyoON4n
         lL0w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=qZum+0EZSFjQpUzSNjrzOPeItuT1JcW481Zhm+MPzXo=;
        b=p3S5yfl779bFfMASeufxZ0t6czb/vaRy6S/Bx/bWmguDv2HoS0mTDjAdX2MDYyEK0a
         +UsCevTXmtTcIdBs9oddBFSh607EdzcQW/BUh25NmOoiQAD0LR5Fx9Pt1nQ50QB2u/oz
         ecCQzUgl9SHBqr5PIEXfzRS81peSwMfuUPUagTlto8cUti691qThoN4WgzL5QBnJ3lGS
         4g4+kP+X6OelUNKLPbG871BR/SYgfzhcZoRFJoyKt7tTYHS8Cn+fCwPU277lQlKb1V8t
         969eX4OOfAWmJLdFddP4Fv0cqLOM6vRiptpJsG8plKwS9+PzUq3YNaBh6HOdmrB+RqPE
         2rrQ==
X-Gm-Message-State: AOAM532t/pQd/Hpj5Vie+bTpAN/SHfjlwd4QDg/MrYxlOmZAdRfp1JFB
	V03Nap3dE/SnPV6ql/vKRxRBGTaGjOk5Ag==
X-Google-Smtp-Source: ABdhPJxDirtMjtQ+iy6ZZAOcIHs47or/XFYP/ZeH0n8eugYC2kn2DJ6GgBlPHj7GRMMl+ZVOqI7QGg==
X-Received: by 2002:a0c:83c4:: with SMTP id k62mr4536764qva.19.1593494333270;
        Mon, 29 Jun 2020 22:18:53 -0700 (PDT)
Return-Path: <bruce.ashfield@gmail.com>
Received: from localhost.localdomain (CPE04d4c4975b80-CM64777d5e8820.cpe.net.cable.rogers.com. [174.112.240.214])
        by smtp.gmail.com with ESMTPSA id o10sm2163403qtq.71.2020.06.29.22.18.52
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 29 Jun 2020 22:18:52 -0700 (PDT)
From: "Bruce Ashfield" <bruce.ashfield@gmail.com>
To: richard.purdie@linuxfoundation.org
Cc: openembedded-core@lists.openembedded.org
Subject: [PATCH 4/6] linux-yocto/5.4: update to v5.4.46
Date: Tue, 30 Jun 2020 01:18:44 -0400
Message-Id: <ca2842660d630ff5218b7d66221dcb77c54b4f10.1593494109.git.bruce.ashfield@gmail.com>
X-Mailer: git-send-email 2.19.1
In-Reply-To: <cover.1593494109.git.bruce.ashfield@gmail.com>
References: <cover.1593494109.git.bruce.ashfield@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

From: Bruce Ashfield <bruce.ashfield@gmail.com>

Updating linux-yocto/5.4 to the latest korg -stable release that comprises
the following commits:

    5e3c51153922 Linux 5.4.46
    9504466c9038 Revert "net/mlx5: Annotate mutex destroy for root ns"
    c06c03bba03f uprobes: ensure that uprobe->offset and ->ref_ctr_offset are properly aligned
    590459086bc9 x86/speculation: Add Ivy Bridge to affected list
    faf187abda94 x86/speculation: Add SRBDS vulnerability and mitigation documentation
    b0f61a0503ad x86/speculation: Add Special Register Buffer Data Sampling (SRBDS) mitigation
    dab0161b8a0b x86/cpu: Add 'table' argument to cpu_matches()
    749ec6b48a9a x86/cpu: Add a steppings field to struct x86_cpu_id
    e4e57f7bca44 x86/speculation/spectre_v2: Exclude Zhaoxin CPUs from SPECTRE_V2
    c2baba26ac5e nvmem: qfprom: remove incorrect write support
    b3e3f4cb8c6b CDC-ACM: heed quirk also in error handling
    4992c7618818 staging: rtl8712: Fix IEEE80211_ADDBA_PARAM_BUF_SIZE_MASK
    784ac0e82920 tty: hvc_console, fix crashes on parallel open/close
    9619c2f746f7 vt: keyboard: avoid signed integer overflow in k_ascii
    2d0c87d34dab usb: musb: Fix runtime PM imbalance on error
    e8f57f50e31b usb: musb: start session in resume for host port
    8d130bf2fcab iio: adc: stm32-adc: fix a wrong error message when probing interrupts
    e98b0548b2f8 iio:chemical:pms7003: Fix timestamp alignment and prevent data leak.
    9b0e734fde6d iio: vcnl4000: Fix i2c swapped word reading.
    940530f60c60 iio:chemical:sps30: Fix timestamp alignment
    0fac736dbac6 USB: serial: ch341: add basis for quirk detection
    9060d48b4206 USB: serial: option: add Telit LE910C1-EUX compositions
    5555c8f569fa USB: serial: usb_wwan: do not resubmit rx urb on fatal errors
    f366d3a21f12 USB: serial: qcserial: add DW5816e QDL support
    b3ebd9830c60 net: be more gentle about silly gso requests coming from user
    a93417dfc1b0 net: check untrusted gso_size at kernel entry
    a02203349750 vsock: fix timeout in vsock_accept()
    646345a15350 nfp: flower: fix used time of merge flow statistics
    165508e456b1 NFC: st21nfca: add missed kfree_skb() in an error path
    87adb76710d0 net: usb: qmi_wwan: add Telit LE910C1-EUX composition
    de8f81077be2 net: stmmac: enable timestamp snapshot for required PTP packets in dwmac v5.10a
    fb915f061e9e net/mlx5: Fix crash upon suspend/resume
    5fc8f9a34800 l2tp: do not use inet_hash()/inet_unhash()
    1b7693c09252 l2tp: add sk_family checks to l2tp_validate_socket
    449c72324085 devinet: fix memleak in inetdev_init()

Signed-off-by: Bruce Ashfield <bruce.ashfield@gmail.com>
---
 .../linux/linux-yocto-rt_5.4.bb               |  6 ++---
 .../linux/linux-yocto-tiny_5.4.bb             |  8 +++----
 meta/recipes-kernel/linux/linux-yocto_5.4.bb  | 22 +++++++++----------
 3 files changed, 18 insertions(+), 18 deletions(-)

diff --git a/meta/recipes-kernel/linux/linux-yocto-rt_5.4.bb b/meta/recipes-kernel/linux/linux-yocto-rt_5.4.bb
index d4d95204f6..4f7b84613e 100644
--- a/meta/recipes-kernel/linux/linux-yocto-rt_5.4.bb
+++ b/meta/recipes-kernel/linux/linux-yocto-rt_5.4.bb
@@ -11,13 +11,13 @@ python () {
         raise bb.parse.SkipRecipe("Set PREFERRED_PROVIDER_virtual/kernel to linux-yocto-rt to enable it")
 }
 
-SRCREV_machine ?= "46d685b7b96320ec6e8b2e1a1126ce02cae35865"
-SRCREV_meta ?= "87313d46d577412854ab491d524a94fa82af4536"
+SRCREV_machine ?= "29bff27700d5eaeee119c91b3a8b3540f9eff4e6"
+SRCREV_meta ?= "627191aa87d971e153f95beac4d9e45aea0e9b65"
 
 SRC_URI = "git://git.yoctoproject.org/linux-yocto.git;branch=${KBRANCH};name=machine \
            git://git.yoctoproject.org/yocto-kernel-cache;type=kmeta;name=meta;branch=yocto-5.4;destsuffix=${KMETA}"
 
-LINUX_VERSION ?= "5.4.45"
+LINUX_VERSION ?= "5.4.46"
 
 LIC_FILES_CHKSUM = "file://COPYING;md5=bbea815ee2795b2f4230826c0c6b8814"
 
diff --git a/meta/recipes-kernel/linux/linux-yocto-tiny_5.4.bb b/meta/recipes-kernel/linux/linux-yocto-tiny_5.4.bb
index b9ac34396a..0859d35ced 100644
--- a/meta/recipes-kernel/linux/linux-yocto-tiny_5.4.bb
+++ b/meta/recipes-kernel/linux/linux-yocto-tiny_5.4.bb
@@ -6,7 +6,7 @@ KCONFIG_MODE = "--allnoconfig"
 
 require recipes-kernel/linux/linux-yocto.inc
 
-LINUX_VERSION ?= "5.4.45"
+LINUX_VERSION ?= "5.4.46"
 LIC_FILES_CHKSUM = "file://COPYING;md5=bbea815ee2795b2f4230826c0c6b8814"
 
 DEPENDS += "${@bb.utils.contains('ARCH', 'x86', 'elfutils-native', '', d)}"
@@ -15,9 +15,9 @@ DEPENDS += "openssl-native util-linux-native"
 KMETA = "kernel-meta"
 KCONF_BSP_AUDIT_LEVEL = "2"
 
-SRCREV_machine_qemuarm ?= "c2765f98de328de8ac03bbc112d274c093949ad0"
-SRCREV_machine ?= "85c9ccdd443fe3a59511c1921b3ebc0fc396f417"
-SRCREV_meta ?= "87313d46d577412854ab491d524a94fa82af4536"
+SRCREV_machine_qemuarm ?= "ef392a1fda8e56dd3f811488771d233a7374ee46"
+SRCREV_machine ?= "37a68a90035cd2ac28005ed4136a4d376359bd17"
+SRCREV_meta ?= "627191aa87d971e153f95beac4d9e45aea0e9b65"
 
 PV = "${LINUX_VERSION}+git${SRCPV}"
 
diff --git a/meta/recipes-kernel/linux/linux-yocto_5.4.bb b/meta/recipes-kernel/linux/linux-yocto_5.4.bb
index ae952e0771..862ec48d82 100644
--- a/meta/recipes-kernel/linux/linux-yocto_5.4.bb
+++ b/meta/recipes-kernel/linux/linux-yocto_5.4.bb
@@ -12,16 +12,16 @@ KBRANCH_qemux86  ?= "v5.4/standard/base"
 KBRANCH_qemux86-64 ?= "v5.4/standard/base"
 KBRANCH_qemumips64 ?= "v5.4/standard/mti-malta64"
 
-SRCREV_machine_qemuarm ?= "25484a4f9ba2682d45c3f3bbf5497f6d7d75817d"
-SRCREV_machine_qemuarm64 ?= "85c9ccdd443fe3a59511c1921b3ebc0fc396f417"
-SRCREV_machine_qemumips ?= "48bd1e848614da3ce48d52a1b2a15241d2a2f909"
-SRCREV_machine_qemuppc ?= "85c9ccdd443fe3a59511c1921b3ebc0fc396f417"
-SRCREV_machine_qemuriscv64 ?= "85c9ccdd443fe3a59511c1921b3ebc0fc396f417"
-SRCREV_machine_qemux86 ?= "85c9ccdd443fe3a59511c1921b3ebc0fc396f417"
-SRCREV_machine_qemux86-64 ?= "85c9ccdd443fe3a59511c1921b3ebc0fc396f417"
-SRCREV_machine_qemumips64 ?= "0e18185e09beb99a7b6408e9650ad5f31e8f759d"
-SRCREV_machine ?= "85c9ccdd443fe3a59511c1921b3ebc0fc396f417"
-SRCREV_meta ?= "87313d46d577412854ab491d524a94fa82af4536"
+SRCREV_machine_qemuarm ?= "db71dcd861b5d9d2c5b1a98b0cf0c67979ae8790"
+SRCREV_machine_qemuarm64 ?= "37a68a90035cd2ac28005ed4136a4d376359bd17"
+SRCREV_machine_qemumips ?= "90471d7fcb21e5955bac724d9b1cf2aa6d2e5444"
+SRCREV_machine_qemuppc ?= "37a68a90035cd2ac28005ed4136a4d376359bd17"
+SRCREV_machine_qemuriscv64 ?= "37a68a90035cd2ac28005ed4136a4d376359bd17"
+SRCREV_machine_qemux86 ?= "37a68a90035cd2ac28005ed4136a4d376359bd17"
+SRCREV_machine_qemux86-64 ?= "37a68a90035cd2ac28005ed4136a4d376359bd17"
+SRCREV_machine_qemumips64 ?= "1b81c8b0c3a73120966d633485233382bb8f7517"
+SRCREV_machine ?= "37a68a90035cd2ac28005ed4136a4d376359bd17"
+SRCREV_meta ?= "627191aa87d971e153f95beac4d9e45aea0e9b65"
 
 # remap qemuarm to qemuarma15 for the 5.4 kernel
 # KMACHINE_qemuarm ?= "qemuarma15"
@@ -30,7 +30,7 @@ SRC_URI = "git://git.yoctoproject.org/linux-yocto.git;name=machine;branch=${KBRA
            git://git.yoctoproject.org/yocto-kernel-cache;type=kmeta;name=meta;branch=yocto-5.4;destsuffix=${KMETA}"
 
 LIC_FILES_CHKSUM = "file://COPYING;md5=bbea815ee2795b2f4230826c0c6b8814"
-LINUX_VERSION ?= "5.4.45"
+LINUX_VERSION ?= "5.4.46"
 
 DEPENDS += "${@bb.utils.contains('ARCH', 'x86', 'elfutils-native', '', d)}"
 DEPENDS += "openssl-native util-linux-native"
-- 
2.19.1

