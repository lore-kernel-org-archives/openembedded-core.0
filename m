Return-Path: <bruce.ashfield@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 6A329E728DE
	for <webhook@archiver.kernel.org>; Fri, 29 Sep 2023 20:05:05 +0000 (UTC)
Received: from mail-qv1-f54.google.com (mail-qv1-f54.google.com [209.85.219.54])
 by mx.groups.io with SMTP id smtpd.web11.27703.1696017899885664893
 for <openembedded-core@lists.openembedded.org>;
 Fri, 29 Sep 2023 13:05:00 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20230601 header.b=m+7+vn18;
 spf=pass (domain: gmail.com, ip: 209.85.219.54, mailfrom: bruce.ashfield@gmail.com)
Received: by mail-qv1-f54.google.com with SMTP id 6a1803df08f44-65af75a0209so61966676d6.3
        for <openembedded-core@lists.openembedded.org>; Fri, 29 Sep 2023 13:04:59 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1696017899; x=1696622699; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=AyZCmujrGrl9x9tYCDYXqOM+edpnCtyzofDE+IqCLIg=;
        b=m+7+vn18G1N4KSwia4rv8SinzgNgiWeOrlbCvjnUgagXgI+njyj/t1/q+4xWXC4DPx
         ChVgLeMO2dsssHVevCyXeqMyqJTEFgZSBgBnIh/TO9bVrOYfPhhmKygzXXPKCMf2Ew9z
         ty9PpeYhEGn2gZtItiA2s701TWH4yKyyYZcvn5goFbYb3PJwrBsn6kDkrpeIY9s2YM17
         tcQlstL1Zh4d6O/qrDWtTYoOpDXHyyEaeWXI+rXvCXOsLQ4Dsxt/yPYocXUBg7FKve6U
         cxaawkFniB13tgBx5kaukxSDI0pcJgO0D+PH6ole3MhngvmYBm7907RPfVOfshkj9NjY
         KD+A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1696017899; x=1696622699;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=AyZCmujrGrl9x9tYCDYXqOM+edpnCtyzofDE+IqCLIg=;
        b=FvKhTuSPuvb/GBQ5LNrSrOSb6aSRrFVNmuUoSyLJWqB+/zECTS9YZY/SWualR0mP9C
         Svz4n9GIug/0yskVbtfu1yLtVnQSFO3IequADxXdQeM1wmac/Hil9t8McPkfTI7sPx70
         Jin2vOO+p1Hcm8alK4ei33obz4pKkHPxySZTeTo2LvFeLOkL4aCjeMjSctiqz21HnMUi
         t71RHjJaIxr+SXRS4PFDzad+i84fDS2iiJGMtXpZ5Cr6VWDqpqwreZxqc9x6KksV2m/p
         ab8cdydoG2JtdzjbtJNe6ftXBe+x60Dg4gJWvYUUf+HHtq7WHJpYsGTMQZ220pHURHLQ
         IU7g==
X-Gm-Message-State: AOJu0YxjX6Drl2byvtxTC4HOJubU7/DXnrSQ8LNBp5G6mJsUdyqWbuME
	V2mbSzS7bWlskNBKLL9Q9FGtamjt2R/HIg==
X-Google-Smtp-Source: AGHT+IEiE8ShPXAp0R/BMDUUkRgBHhWF5EzD2SmQlS8qs11ygoJxtOjPLIltKuxzIiwNhRqK4pVidA==
X-Received: by 2002:a05:6214:310e:b0:65b:9514:ba8 with SMTP id ks14-20020a056214310e00b0065b95140ba8mr4940901qvb.11.1696017898657;
        Fri, 29 Sep 2023 13:04:58 -0700 (PDT)
Received: from build.lan ([174.112.183.231])
        by smtp.gmail.com with ESMTPSA id t28-20020a0cb39c000000b0065cffe12ae9sm2115848qve.36.2023.09.29.13.04.57
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 29 Sep 2023 13:04:58 -0700 (PDT)
From: bruce.ashfield@gmail.com
To: richard.purdie@linuxfoundation.org
Cc: openembedded-core@lists.openembedded.org
Subject: [PATCH 02/10] linux-yocto/6.1: update to v6.1.52
Date: Fri, 29 Sep 2023 16:04:46 -0400
Message-Id: <7826d6b6dbc5e262e6dac69a3b1f1a6a293fc04e.1696017123.git.bruce.ashfield@gmail.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <cover.1696017123.git.bruce.ashfield@gmail.com>
References: <cover.1696017123.git.bruce.ashfield@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Fri, 29 Sep 2023 20:05:05 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/188421

From: Bruce Ashfield <bruce.ashfield@gmail.com>

Updating  to the latest korg -stable release that comprises
the following commits:

    59b13c2b647e Linux 6.1.52
    4a6284a2fc63 pinctrl: amd: Don't show `Invalid config param` errors
    7bec12fa9813 usb: typec: tcpci: clear the fault status bit
    4da07e958bfd nilfs2: fix WARNING in mark_buffer_dirty due to discarded buffer reuse
    fdbfc54d5399 nilfs2: fix general protection fault in nilfs_lookup_dirty_data_buffers()
    689561db6869 dt-bindings: sc16is7xx: Add property to change GPIO function
    dca7c9965141 tcpm: Avoid soft reset when partner does not support get_status
    a1fc0096921c fsi: master-ast-cf: Add MODULE_FIRMWARE macro
    b5c7bc370e03 firmware: stratix10-svc: Fix an NULL vs IS_ERR() bug in probe
    b7366429626e serial: sc16is7xx: fix bug when first setting GPIO direction
    682f9b944374 serial: sc16is7xx: fix broken port 0 uart init
    4b3de7d2f869 serial: qcom-geni: fix opp vote on shutdown
    1cd102aaedb2 wifi: mt76: mt7921: fix skb leak by txs missing in AMSDU
    74ceef6e6925 wifi: mt76: mt7921: do not support one stream on secondary antenna only
    179c65828593 Bluetooth: btsdio: fix use after free bug in btsdio_remove due to race condition
    86b818e2495d staging: rtl8712: fix race condition
    bd69537c1a2c HID: wacom: remove the battery when the EKR is off
    48729a1d2a7a usb: chipidea: imx: improve logic if samsung,picophy-* parameter is 0
    c564d4f91a0c usb: dwc3: meson-g12a: do post init to fix broken usb after resumption
    bfc4ccc0bcae ALSA: usb-audio: Fix init call orders for UAC1
    69d9330f2eff USB: serial: option: add FOXCONN T99W368/T99W373 product
    34f396f7abd0 USB: serial: option: add Quectel EM05G variant (0x030e)
    5d0fe30be4e2 modules: only allow symbol_get of EXPORT_SYMBOL_GPL modules
    36231e2c4ebd rtc: ds1685: use EXPORT_SYMBOL_GPL for ds1685_rtc_poweroff
    915219699da1 net: enetc: use EXPORT_SYMBOL_GPL for enetc_phc_index
    4dab89cccd8c mmc: au1xmmc: force non-modular build and remove symbol_get usage
    ac6fa0e04be0 ARM: pxa: remove use of symbol_get()
    cf859267e639 ksmbd: reduce descriptor size if remaining bytes is less than request size
    d070c4dd2a5b ksmbd: replace one-element array with flex-array member in struct smb2_ea_info
    30fd6521b2fb ksmbd: fix slub overflow in ksmbd_decode_ntlmssp_auth_blob()
    7d8855fd849d ksmbd: fix wrong DataOffset validation of create context
    1ce9ebc96eda erofs: ensure that the post-EOF tails are all zeroed

Signed-off-by: Bruce Ashfield <bruce.ashfield@gmail.com>
---
 .../linux/cve-exclusion_6.1.inc               |  4 +--
 .../linux/linux-yocto-rt_6.1.bb               |  6 ++--
 .../linux/linux-yocto-tiny_6.1.bb             |  6 ++--
 meta/recipes-kernel/linux/linux-yocto_6.1.bb  | 28 +++++++++----------
 4 files changed, 22 insertions(+), 22 deletions(-)

diff --git a/meta/recipes-kernel/linux/cve-exclusion_6.1.inc b/meta/recipes-kernel/linux/cve-exclusion_6.1.inc
index 41ee8bcad5..52523c6709 100644
--- a/meta/recipes-kernel/linux/cve-exclusion_6.1.inc
+++ b/meta/recipes-kernel/linux/cve-exclusion_6.1.inc
@@ -1,9 +1,9 @@
 
 # Auto-generated CVE metadata, DO NOT EDIT BY HAND.
-# Generated at 2023-09-07 15:29:54.983415+00:00 for version 6.1.51
+# Generated at 2023-09-08 09:54:36.039631 for version 6.1.52
 
 python check_kernel_cve_status_version() {
-    this_version = "6.1.51"
+    this_version = "6.1.52"
     kernel_version = d.getVar("LINUX_VERSION")
     if kernel_version != this_version:
         bb.warn("Kernel CVE status needs updating: generated for %s but kernel is %s" % (this_version, kernel_version))
diff --git a/meta/recipes-kernel/linux/linux-yocto-rt_6.1.bb b/meta/recipes-kernel/linux/linux-yocto-rt_6.1.bb
index 5a42da2019..05e0b69331 100644
--- a/meta/recipes-kernel/linux/linux-yocto-rt_6.1.bb
+++ b/meta/recipes-kernel/linux/linux-yocto-rt_6.1.bb
@@ -14,13 +14,13 @@ python () {
         raise bb.parse.SkipRecipe("Set PREFERRED_PROVIDER_virtual/kernel to linux-yocto-rt to enable it")
 }
 
-SRCREV_machine ?= "ad7c05a03b8d70ee30ecce783a861cb96ea258cf"
-SRCREV_meta ?= "f845a7f37d7114230d6609e2bd630070f2f6cd9b"
+SRCREV_machine ?= "7327e7ab3b5508182380405a51f2657f5bf669b4"
+SRCREV_meta ?= "9e389e7f44a22bc637328f15e106f6d60631780e"
 
 SRC_URI = "git://git.yoctoproject.org/linux-yocto.git;branch=${KBRANCH};name=machine;protocol=https \
            git://git.yoctoproject.org/yocto-kernel-cache;type=kmeta;name=meta;branch=yocto-6.1;destsuffix=${KMETA};protocol=https"
 
-LINUX_VERSION ?= "6.1.51"
+LINUX_VERSION ?= "6.1.52"
 
 LIC_FILES_CHKSUM = "file://COPYING;md5=6bc538ed5bd9a7fc9398086aedcd7e46"
 
diff --git a/meta/recipes-kernel/linux/linux-yocto-tiny_6.1.bb b/meta/recipes-kernel/linux/linux-yocto-tiny_6.1.bb
index 3fd9a0e2a9..942aa48c02 100644
--- a/meta/recipes-kernel/linux/linux-yocto-tiny_6.1.bb
+++ b/meta/recipes-kernel/linux/linux-yocto-tiny_6.1.bb
@@ -8,7 +8,7 @@ require recipes-kernel/linux/linux-yocto.inc
 # CVE exclusions
 include recipes-kernel/linux/cve-exclusion_6.1.inc
 
-LINUX_VERSION ?= "6.1.51"
+LINUX_VERSION ?= "6.1.52"
 LIC_FILES_CHKSUM = "file://COPYING;md5=6bc538ed5bd9a7fc9398086aedcd7e46"
 
 DEPENDS += "${@bb.utils.contains('ARCH', 'x86', 'elfutils-native', '', d)}"
@@ -17,8 +17,8 @@ DEPENDS += "openssl-native util-linux-native"
 KMETA = "kernel-meta"
 KCONF_BSP_AUDIT_LEVEL = "2"
 
-SRCREV_machine ?= "526b5bf2f74f881356bce8b44840dc86785fb7bf"
-SRCREV_meta ?= "f845a7f37d7114230d6609e2bd630070f2f6cd9b"
+SRCREV_machine ?= "b3879adf00e338e66e92431a434fa2549ac88b83"
+SRCREV_meta ?= "9e389e7f44a22bc637328f15e106f6d60631780e"
 
 PV = "${LINUX_VERSION}+git"
 
diff --git a/meta/recipes-kernel/linux/linux-yocto_6.1.bb b/meta/recipes-kernel/linux/linux-yocto_6.1.bb
index 3798ae3db9..000317379f 100644
--- a/meta/recipes-kernel/linux/linux-yocto_6.1.bb
+++ b/meta/recipes-kernel/linux/linux-yocto_6.1.bb
@@ -18,25 +18,25 @@ KBRANCH:qemux86-64 ?= "v6.1/standard/base"
 KBRANCH:qemuloongarch64  ?= "v6.1/standard/base"
 KBRANCH:qemumips64 ?= "v6.1/standard/mti-malta64"
 
-SRCREV_machine:qemuarm ?= "8c81de99a4b9f69345873b06077f9d4e1321298e"
-SRCREV_machine:qemuarm64 ?= "526b5bf2f74f881356bce8b44840dc86785fb7bf"
-SRCREV_machine:qemuloongarch64 ?= "526b5bf2f74f881356bce8b44840dc86785fb7bf"
-SRCREV_machine:qemumips ?= "733cb5842aeac106f5606df4da7c64a180f0c500"
-SRCREV_machine:qemuppc ?= "526b5bf2f74f881356bce8b44840dc86785fb7bf"
-SRCREV_machine:qemuriscv64 ?= "526b5bf2f74f881356bce8b44840dc86785fb7bf"
-SRCREV_machine:qemuriscv32 ?= "526b5bf2f74f881356bce8b44840dc86785fb7bf"
-SRCREV_machine:qemux86 ?= "526b5bf2f74f881356bce8b44840dc86785fb7bf"
-SRCREV_machine:qemux86-64 ?= "526b5bf2f74f881356bce8b44840dc86785fb7bf"
-SRCREV_machine:qemumips64 ?= "1c11fe963667e9380725bef0650aeaea8544ea8b"
-SRCREV_machine ?= "526b5bf2f74f881356bce8b44840dc86785fb7bf"
-SRCREV_meta ?= "f845a7f37d7114230d6609e2bd630070f2f6cd9b"
+SRCREV_machine:qemuarm ?= "3028542fe5ece9dd32c8e3b9b14b2c9f4c9cafac"
+SRCREV_machine:qemuarm64 ?= "b3879adf00e338e66e92431a434fa2549ac88b83"
+SRCREV_machine:qemuloongarch64 ?= "b3879adf00e338e66e92431a434fa2549ac88b83"
+SRCREV_machine:qemumips ?= "33c0b5a0c1af6abb4dee11ffa5ece66ffd01d3c8"
+SRCREV_machine:qemuppc ?= "b3879adf00e338e66e92431a434fa2549ac88b83"
+SRCREV_machine:qemuriscv64 ?= "b3879adf00e338e66e92431a434fa2549ac88b83"
+SRCREV_machine:qemuriscv32 ?= "b3879adf00e338e66e92431a434fa2549ac88b83"
+SRCREV_machine:qemux86 ?= "b3879adf00e338e66e92431a434fa2549ac88b83"
+SRCREV_machine:qemux86-64 ?= "b3879adf00e338e66e92431a434fa2549ac88b83"
+SRCREV_machine:qemumips64 ?= "ee418f38dbc9794b7976ad11fd74f5a3490c7c5e"
+SRCREV_machine ?= "b3879adf00e338e66e92431a434fa2549ac88b83"
+SRCREV_meta ?= "9e389e7f44a22bc637328f15e106f6d60631780e"
 
 # set your preferred provider of linux-yocto to 'linux-yocto-upstream', and you'll
 # get the <version>/base branch, which is pure upstream -stable, and the same
 # meta SRCREV as the linux-yocto-standard builds. Select your version using the
 # normal PREFERRED_VERSION settings.
 BBCLASSEXTEND = "devupstream:target"
-SRCREV_machine:class-devupstream ?= "c2cbfe5f51227dfe6ef7be013f0d56a32c040faa"
+SRCREV_machine:class-devupstream ?= "59b13c2b647e464dd85622c89d7f16c15d681e96"
 PN:class-devupstream = "linux-yocto-upstream"
 KBRANCH:class-devupstream = "v6.1/base"
 
@@ -45,7 +45,7 @@ SRC_URI = "git://git.yoctoproject.org/linux-yocto.git;name=machine;branch=${KBRA
 SRC_URI += "file://0001-perf-cpumap-Make-counter-as-unsigned-ints.patch"
 
 LIC_FILES_CHKSUM = "file://COPYING;md5=6bc538ed5bd9a7fc9398086aedcd7e46"
-LINUX_VERSION ?= "6.1.51"
+LINUX_VERSION ?= "6.1.52"
 
 PV = "${LINUX_VERSION}+git"
 
-- 
2.34.1


