Received: from mail-qt1-f194.google.com (mail-qt1-f194.google.com [209.85.160.194])
 by mx.groups.io with SMTP id smtpd.web09.9386.1605626686120073709
 for <openembedded-core@lists.openembedded.org>;
 Tue, 17 Nov 2020 07:24:46 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20161025 header.b=umJ7Ph6Z;
 spf=pass (domain: gmail.com, ip: 209.85.160.194, mailfrom: bruce.ashfield@gmail.com)
Received: by mail-qt1-f194.google.com with SMTP id g20so3996098qtu.4
        for <openembedded-core@lists.openembedded.org>; Tue, 17 Nov 2020 07:24:46 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:content-transfer-encoding;
        bh=kGyhJPpd6J4SjKZMndiJjVvguzCp6d9YLkQSrQL8Ccg=;
        b=umJ7Ph6Zwkf51+ErLzIO7pj21y5KQJUKIGWIkT/9tz0XbkjkLFPS29sedVDaBMjhzy
         A1M67KacYNSGBTG67hrIhAPHURRhN3zQDR6w83c/jG4SdlW9i0X6pWuCV/tlGi7HkPI+
         opAi3KqVxOsMmfHLfLUjkSBQ49rpbQ8rL7FGTKjAPWL4yEfj/dSI3rEWtDPGThiLOKzI
         G4cMNbOMyS3MteJXb3morrI5Tq5fUcxc5fx0cM9Z/UEc6l3AbNTC76tmOnKIJ0z3wKI2
         nQ+uGH6oiNMKKS2urMlxTgSWjaE3fxCzIeVvS/uDNcAnLopKV6Ln+eOqpRJwI31uWP7d
         ZR2g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=kGyhJPpd6J4SjKZMndiJjVvguzCp6d9YLkQSrQL8Ccg=;
        b=O8YnaHrqYGW1nmUfzAyHbIhqV4Cyl/G6azgsa9zEChX49pHEXmWvm/IWXP6eTizKAs
         /lUcl0IeeT9NTHsaCfdR9xWKzMC08XLOkpbdyhZlV594y4hT5ckIumJFw5w94DQ77GZ4
         HK/BlYq+ODInPzyajkXmdps2vzS+CPAmIGVNB3JT7WuV/sbmwbdZSiv5Vd1TeGnaEjMZ
         dIomD1kqnm4dgFhVIIWi1dcNMw3Ee4cn67D6z/4Zle04AA2qYt4FGhSAYr/QFYd0nLYI
         sdWEu4BNzoctoTUyAs01aezsSOyrwmtvD0LzzhVgcUOMliTKUI+zAqoW96OqJpgNls7X
         Og+g==
X-Gm-Message-State: AOAM5310NHEVJFkFL4Pn45etOpmXEZzAYoPs72xAzmDrOm/VAFvn0ST0
	HF03SfXIakIg7K/vY6EZ/bg=
X-Google-Smtp-Source: ABdhPJzcPGczCpj8v2cOVtg8Qu0I4H7SNZYnw5QRatyuJ6BJBRiROVrcDUP4j2CvyjeIpaTeRHFxpQ==
X-Received: by 2002:ac8:6799:: with SMTP id b25mr142544qtp.115.1605626685217;
        Tue, 17 Nov 2020 07:24:45 -0800 (PST)
Return-Path: <bruce.ashfield@gmail.com>
Received: from localhost.localdomain (cpe04d4c4975b80-cm64777d5e8820.cpe.net.cable.rogers.com. [174.112.165.127])
        by smtp.gmail.com with ESMTPSA id u24sm14537923qtb.33.2020.11.17.07.24.43
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 17 Nov 2020 07:24:44 -0800 (PST)
From: "Bruce Ashfield" <bruce.ashfield@gmail.com>
To: richard.purdie@linuxfoundation.org
Cc: openembedded-core@lists.openembedded.org
Subject: [PATCH 04/11] linux-yocto/5.4: update to v5.4.72
Date: Tue, 17 Nov 2020 10:24:30 -0500
Message-Id: <982912464263bf257f86ab3616f1449bc462c7b2.1605626488.git.bruce.ashfield@gmail.com>
X-Mailer: git-send-email 2.19.1
In-Reply-To: <cover.1605626488.git.bruce.ashfield@gmail.com>
References: <cover.1605626488.git.bruce.ashfield@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

From: Bruce Ashfield <bruce.ashfield@gmail.com>

Updating linux-yocto/5.4 to the latest korg -stable release that comprises
the following commits:

    52f6ded2a377 Linux 5.4.72
    865b015e8d41 crypto: qat - check cipher length for aead AES-CBC-HMAC-SHA
    aa1167908ac4 crypto: bcm - Verify GCM/CCM key length in setkey
    564312e08892 xen/events: don't use chip_data for legacy IRQs
    041445d0d577 reiserfs: Fix oops during mount
    046616898a57 reiserfs: Initialize inode keys properly
    22ab9ca024a0 USB: serial: ftdi_sio: add support for FreeCalypso JTAG+UART adapters
    bfb1438e8c15 USB: serial: pl2303: add device-id for HP GC device
    aecf3a1c11dc staging: comedi: check validity of wMaxPacketSize of usb endpoints found
    8aff87284be6 USB: serial: option: Add Telit FT980-KS composition
    3c3eb734ef1f USB: serial: option: add Cellient MPL200 card
    b970578274e9 media: usbtv: Fix refcounting mixup
    6ad2e647d91f Bluetooth: Disconnect if E0 is used for Level 4
    21d2051d1f1c Bluetooth: Fix update of connection state in `hci_encrypt_cfm`
    ed6c361e3229 Bluetooth: Consolidate encryption handling in hci_encrypt_cfm
    155bf3fd4e8c Bluetooth: MGMT: Fix not checking if BT_HS is enabled
    66a14350de9a Bluetooth: L2CAP: Fix calling sk_filter on non-socket based channel
    0d9e9b6e1a26 Bluetooth: A2MP: Fix not initializing all members
    54f8badb9bc9 ACPI: Always build evged in
    30ddaa4c0c95 ARM: 8939/1: kbuild: use correct nm executable
    1bf467fdfeae btrfs: take overcommit into account in inc_block_group_ro
    39c5eb1482b2 btrfs: don't pass system_chunk into can_overcommit
    bc79abf4afea perf cs-etm: Move definition of 'traceid_list' global variable from header file

Signed-off-by: Bruce Ashfield <bruce.ashfield@gmail.com>
---
 .../linux/linux-yocto-rt_5.4.bb               |  6 ++---
 .../linux/linux-yocto-tiny_5.4.bb             |  8 +++----
 meta/recipes-kernel/linux/linux-yocto_5.4.bb  | 22 +++++++++----------
 3 files changed, 18 insertions(+), 18 deletions(-)

diff --git a/meta/recipes-kernel/linux/linux-yocto-rt_5.4.bb b/meta/recipes-kernel/linux/linux-yocto-rt_5.4.bb
index 8a8a3a91c9..c8e93b427c 100644
--- a/meta/recipes-kernel/linux/linux-yocto-rt_5.4.bb
+++ b/meta/recipes-kernel/linux/linux-yocto-rt_5.4.bb
@@ -11,13 +11,13 @@ python () {
         raise bb.parse.SkipRecipe("Set PREFERRED_PROVIDER_virtual/kernel to linux-yocto-rt to enable it")
 }
 
-SRCREV_machine ?= "5488b835533bde7677d5c3f2e12470fe8eb1f946"
-SRCREV_meta ?= "bb39fa8ebe05b1a0663cb7e04b83c5708a43e168"
+SRCREV_machine ?= "a220745e2a874a1f56634152dba239070995a83b"
+SRCREV_meta ?= "a3bf06c1da96ff1a96ded5ae2e0a9d6b7825ab4b"
 
 SRC_URI = "git://git.yoctoproject.org/linux-yocto.git;branch=${KBRANCH};name=machine \
            git://git.yoctoproject.org/yocto-kernel-cache;type=kmeta;name=meta;branch=yocto-5.4;destsuffix=${KMETA}"
 
-LINUX_VERSION ?= "5.4.71"
+LINUX_VERSION ?= "5.4.72"
 
 LIC_FILES_CHKSUM = "file://COPYING;md5=bbea815ee2795b2f4230826c0c6b8814"
 
diff --git a/meta/recipes-kernel/linux/linux-yocto-tiny_5.4.bb b/meta/recipes-kernel/linux/linux-yocto-tiny_5.4.bb
index 9f27a0c47d..26c603dbfe 100644
--- a/meta/recipes-kernel/linux/linux-yocto-tiny_5.4.bb
+++ b/meta/recipes-kernel/linux/linux-yocto-tiny_5.4.bb
@@ -6,7 +6,7 @@ KCONFIG_MODE = "--allnoconfig"
 
 require recipes-kernel/linux/linux-yocto.inc
 
-LINUX_VERSION ?= "5.4.71"
+LINUX_VERSION ?= "5.4.72"
 LIC_FILES_CHKSUM = "file://COPYING;md5=bbea815ee2795b2f4230826c0c6b8814"
 
 DEPENDS += "${@bb.utils.contains('ARCH', 'x86', 'elfutils-native', '', d)}"
@@ -15,9 +15,9 @@ DEPENDS += "openssl-native util-linux-native"
 KMETA = "kernel-meta"
 KCONF_BSP_AUDIT_LEVEL = "2"
 
-SRCREV_machine_qemuarm ?= "3f21b080aecabda99b3ba488f7bb8835e03779f7"
-SRCREV_machine ?= "668108a47488da1a4e04ecff7ea5c34d7fb2719e"
-SRCREV_meta ?= "bb39fa8ebe05b1a0663cb7e04b83c5708a43e168"
+SRCREV_machine_qemuarm ?= "66a8c42b2503c35b2f309085b849edd4f214822b"
+SRCREV_machine ?= "f22b966f08d032f9b82a2c28a14ae5a0e12321f2"
+SRCREV_meta ?= "a3bf06c1da96ff1a96ded5ae2e0a9d6b7825ab4b"
 
 PV = "${LINUX_VERSION}+git${SRCPV}"
 
diff --git a/meta/recipes-kernel/linux/linux-yocto_5.4.bb b/meta/recipes-kernel/linux/linux-yocto_5.4.bb
index bffe595809..43b2789fdf 100644
--- a/meta/recipes-kernel/linux/linux-yocto_5.4.bb
+++ b/meta/recipes-kernel/linux/linux-yocto_5.4.bb
@@ -12,16 +12,16 @@ KBRANCH_qemux86  ?= "v5.4/standard/base"
 KBRANCH_qemux86-64 ?= "v5.4/standard/base"
 KBRANCH_qemumips64 ?= "v5.4/standard/mti-malta64"
 
-SRCREV_machine_qemuarm ?= "f14906a7f7547ce17fadb77a883a96471cb8efdf"
-SRCREV_machine_qemuarm64 ?= "668108a47488da1a4e04ecff7ea5c34d7fb2719e"
-SRCREV_machine_qemumips ?= "0a724c6a22022929cc8f952f9f2f22126b6965ed"
-SRCREV_machine_qemuppc ?= "668108a47488da1a4e04ecff7ea5c34d7fb2719e"
-SRCREV_machine_qemuriscv64 ?= "668108a47488da1a4e04ecff7ea5c34d7fb2719e"
-SRCREV_machine_qemux86 ?= "668108a47488da1a4e04ecff7ea5c34d7fb2719e"
-SRCREV_machine_qemux86-64 ?= "668108a47488da1a4e04ecff7ea5c34d7fb2719e"
-SRCREV_machine_qemumips64 ?= "c279484fbef538f67662c3b845b13407e467d610"
-SRCREV_machine ?= "668108a47488da1a4e04ecff7ea5c34d7fb2719e"
-SRCREV_meta ?= "bb39fa8ebe05b1a0663cb7e04b83c5708a43e168"
+SRCREV_machine_qemuarm ?= "938960a91a6e4e55f867722d43b7c0110113eebf"
+SRCREV_machine_qemuarm64 ?= "f22b966f08d032f9b82a2c28a14ae5a0e12321f2"
+SRCREV_machine_qemumips ?= "b8f39a8dad8c8a5ceaca8bd0ddfd4505dc219c0d"
+SRCREV_machine_qemuppc ?= "f22b966f08d032f9b82a2c28a14ae5a0e12321f2"
+SRCREV_machine_qemuriscv64 ?= "f22b966f08d032f9b82a2c28a14ae5a0e12321f2"
+SRCREV_machine_qemux86 ?= "f22b966f08d032f9b82a2c28a14ae5a0e12321f2"
+SRCREV_machine_qemux86-64 ?= "f22b966f08d032f9b82a2c28a14ae5a0e12321f2"
+SRCREV_machine_qemumips64 ?= "530c7d0e9e387aab458ede6dc80cd3903c09c0ba"
+SRCREV_machine ?= "f22b966f08d032f9b82a2c28a14ae5a0e12321f2"
+SRCREV_meta ?= "a3bf06c1da96ff1a96ded5ae2e0a9d6b7825ab4b"
 
 # remap qemuarm to qemuarma15 for the 5.4 kernel
 # KMACHINE_qemuarm ?= "qemuarma15"
@@ -30,7 +30,7 @@ SRC_URI = "git://git.yoctoproject.org/linux-yocto.git;name=machine;branch=${KBRA
            git://git.yoctoproject.org/yocto-kernel-cache;type=kmeta;name=meta;branch=yocto-5.4;destsuffix=${KMETA}"
 
 LIC_FILES_CHKSUM = "file://COPYING;md5=bbea815ee2795b2f4230826c0c6b8814"
-LINUX_VERSION ?= "5.4.71"
+LINUX_VERSION ?= "5.4.72"
 
 DEPENDS += "${@bb.utils.contains('ARCH', 'x86', 'elfutils-native', '', d)}"
 DEPENDS += "openssl-native util-linux-native"
-- 
2.19.1

