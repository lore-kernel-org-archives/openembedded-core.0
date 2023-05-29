Return-Path: <bruce.ashfield@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 0DA8BC7EE23
	for <webhook@archiver.kernel.org>; Mon, 29 May 2023 16:51:25 +0000 (UTC)
Received: from mail-qt1-f178.google.com (mail-qt1-f178.google.com [209.85.160.178])
 by mx.groups.io with SMTP id smtpd.web11.54070.1685379075473300884
 for <openembedded-core@lists.openembedded.org>;
 Mon, 29 May 2023 09:51:15 -0700
Authentication-Results: mx.groups.io;
 dkim=fail reason="signature has expired" header.i=@gmail.com header.s=20221208 header.b=ePIqGyn1;
 spf=pass (domain: gmail.com, ip: 209.85.160.178, mailfrom: bruce.ashfield@gmail.com)
Received: by mail-qt1-f178.google.com with SMTP id d75a77b69052e-3f6b24467deso17403331cf.1
        for <openembedded-core@lists.openembedded.org>; Mon, 29 May 2023 09:51:15 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20221208; t=1685379074; x=1687971074;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=qY1VvxMjIABmf1Mo/PPjt9HXtsM1zAeWJGAwqVPZTGM=;
        b=ePIqGyn1N7xqpcVnUkenH02F2oPQx/So6qb9T5a1i0+m4s/AfHXmRGgLyONze8QrLZ
         YAUzG6DyJjPKLzsRcoUc4mRbBYdZHUcHPKSirn1/PyVzCrs9dyi0hr3QzLUtU2g4BWcA
         YA9pzu1jd8KpH9JBqFP1pICA7Oty9OHiLIGbJD0uHKIQxO7Gnu4+iTYDrL0NGr+9xbYR
         smh1tOUXmI+lLHj6GdXovTPrkGXgZ1DSlnL0g5yrB2CyOrg42NVP30hDRTLo0JDG+9Fo
         DgV13NG7RX+syzsY7XJGJ34WK/PUfMS2pN40KRmWyPDaLnsuWhyD1r/7AECt0I7Eqgwf
         KqpQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1685379074; x=1687971074;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=qY1VvxMjIABmf1Mo/PPjt9HXtsM1zAeWJGAwqVPZTGM=;
        b=Dfdk8h+G0pxeAACGkklDaUXqigt9/+qmU8qpUkAMegnPWwpYsHgAXSla1AHJrGmsE8
         /OvrlfCWFTG4PcuhTchGNP56s4082g+5gxEtxgag+tY+gJbvjKoMCilhWMiITjJIvelV
         CK613U59lsJK1e44Gz9nKqNhX4ZXohDrnIzm4Kt+eEDZ921KFJjdZCKPRDM4cyjUStXe
         bHFMMsn2OKVem63tyEaaJpMoqz2y6Pxoynpx9Kt9R6nzIdnKI96kBwbXg4Adl2/8cDCI
         Y7hyGJ8XkWxuReY40YeoVFNqCRY0H6TJgzbknYuG1qvb5iN7yx6JGYYJtpO+9ZbXgLPm
         lnJw==
X-Gm-Message-State: AC+VfDxAH4yQGK/gNJPAheqZmnaXgPhh9k0BQC9k+c0kLPZzSMnYF8MI
	ouYIYJpOICxLDFwQ0u/k0UguVS/5AjzBcA==
X-Google-Smtp-Source: ACHHUZ4KcMdwLaipzu64PWUTUXLu44af0TVGwl33PUWbs4SJ6bwyLOVS08FqTEgoB9Iu24cWiJzm3g==
X-Received: by 2002:a05:6214:19c6:b0:626:272b:28e9 with SMTP id j6-20020a05621419c600b00626272b28e9mr3090497qvc.24.1685379074476;
        Mon, 29 May 2023 09:51:14 -0700 (PDT)
Received: from localhost.localdomain ([174.112.183.231])
        by smtp.gmail.com with ESMTPSA id q20-20020ad44354000000b0062596d5b6a0sm3897474qvs.54.2023.05.29.09.51.13
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 29 May 2023 09:51:13 -0700 (PDT)
From: bruce.ashfield@gmail.com
To: steve@sakoman.com
Cc: openembedded-core@lists.openembedded.org
Subject: [mickledore 3/6] linux-yocto/5.15: update to v5.15.110
Date: Mon, 29 May 2023 12:51:08 -0400
Message-Id: <20230529165111.3511561-3-bruce.ashfield@gmail.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20230529165111.3511561-1-bruce.ashfield@gmail.com>
References: <20230529165111.3511561-1-bruce.ashfield@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Mon, 29 May 2023 16:51:25 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/181888

From: Bruce Ashfield <bruce.ashfield@gmail.com>

Updating  to the latest korg -stable release that comprises
the following commits:

    8a7f2a5c5aa1 Linux 5.15.110
    cab0f985037b riscv: No need to relocate the dtb as it lies in the fixmap region
    1f09c9bab723 riscv: Do not set initial_boot_params to the linear address of the dtb
    bbf94b042155 riscv: Move early dtb mapping into the fixmap region
    ccb29694c2da selftests: mptcp: join: fix "invalid address, ADD_ADDR timeout"
    0994aa001fde driver core: Don't require dynamic_debug for initcall_debug probe timing
    3dcebcaa258c USB: serial: option: add UNISOC vendor and TOZED LT70C product
    f1e6a14d5ae8 bluetooth: Perform careful capability checks in hci_sock_ioctl()
    39c472809aab drm/fb-helper: set x/yres_virtual in drm_fb_helper_check_var
    936a23293bbb wifi: brcmfmac: slab-out-of-bounds read in brcmf_get_assoc_ies()
    2bd716c6e4d1 KVM: arm64: Fix buffer overflow in kvm_arm_set_fw_reg()
    00f74003edf5 KVM: arm64: Retry fault if vma_lookup() results become invalid
    c1da649699e1 selftests/kselftest/runner/run_one(): allow running non-executable files
    c88435054153 PCI/ASPM: Remove pcie_aspm_pm_state_change()

Signed-off-by: Bruce Ashfield <bruce.ashfield@gmail.com>
---
 .../linux/linux-yocto-rt_5.15.bb              |  4 ++--
 .../linux/linux-yocto-tiny_5.15.bb            |  4 ++--
 meta/recipes-kernel/linux/linux-yocto_5.15.bb | 24 +++++++++----------
 3 files changed, 16 insertions(+), 16 deletions(-)

diff --git a/meta/recipes-kernel/linux/linux-yocto-rt_5.15.bb b/meta/recipes-kernel/linux/linux-yocto-rt_5.15.bb
index c3c9ed8967..731a871e11 100644
--- a/meta/recipes-kernel/linux/linux-yocto-rt_5.15.bb
+++ b/meta/recipes-kernel/linux/linux-yocto-rt_5.15.bb
@@ -11,13 +11,13 @@ python () {
         raise bb.parse.SkipRecipe("Set PREFERRED_PROVIDER_virtual/kernel to linux-yocto-rt to enable it")
 }
 
-SRCREV_machine ?= "63a865cbbc8ab351f44582a4fcf2999c7681cfd8"
+SRCREV_machine ?= "91c85a978457d009bb57ec0a0867afe4ff7c8278"
 SRCREV_meta ?= "8ce5ee0184fb213962a82ca5ee8c74851452e260"
 
 SRC_URI = "git://git.yoctoproject.org/linux-yocto.git;branch=${KBRANCH};name=machine;protocol=https \
            git://git.yoctoproject.org/yocto-kernel-cache;type=kmeta;name=meta;branch=yocto-5.15;destsuffix=${KMETA};protocol=https"
 
-LINUX_VERSION ?= "5.15.109"
+LINUX_VERSION ?= "5.15.110"
 
 LIC_FILES_CHKSUM = "file://COPYING;md5=6bc538ed5bd9a7fc9398086aedcd7e46"
 
diff --git a/meta/recipes-kernel/linux/linux-yocto-tiny_5.15.bb b/meta/recipes-kernel/linux/linux-yocto-tiny_5.15.bb
index ae2604ab70..6ded419a02 100644
--- a/meta/recipes-kernel/linux/linux-yocto-tiny_5.15.bb
+++ b/meta/recipes-kernel/linux/linux-yocto-tiny_5.15.bb
@@ -5,7 +5,7 @@ KCONFIG_MODE = "--allnoconfig"
 
 require recipes-kernel/linux/linux-yocto.inc
 
-LINUX_VERSION ?= "5.15.109"
+LINUX_VERSION ?= "5.15.110"
 LIC_FILES_CHKSUM = "file://COPYING;md5=6bc538ed5bd9a7fc9398086aedcd7e46"
 
 DEPENDS += "${@bb.utils.contains('ARCH', 'x86', 'elfutils-native', '', d)}"
@@ -14,7 +14,7 @@ DEPENDS += "openssl-native util-linux-native"
 KMETA = "kernel-meta"
 KCONF_BSP_AUDIT_LEVEL = "2"
 
-SRCREV_machine ?= "7d734295a38a5fc03fb29fb90bb64e38708e2308"
+SRCREV_machine ?= "37cc630d5574860de0b48e67fca03d8cb7d2a260"
 SRCREV_meta ?= "8ce5ee0184fb213962a82ca5ee8c74851452e260"
 
 PV = "${LINUX_VERSION}+git${SRCPV}"
diff --git a/meta/recipes-kernel/linux/linux-yocto_5.15.bb b/meta/recipes-kernel/linux/linux-yocto_5.15.bb
index d30b12d557..e702fbcf71 100644
--- a/meta/recipes-kernel/linux/linux-yocto_5.15.bb
+++ b/meta/recipes-kernel/linux/linux-yocto_5.15.bb
@@ -13,16 +13,16 @@ KBRANCH:qemux86  ?= "v5.15/standard/base"
 KBRANCH:qemux86-64 ?= "v5.15/standard/base"
 KBRANCH:qemumips64 ?= "v5.15/standard/mti-malta64"
 
-SRCREV_machine:qemuarm ?= "8ac50c616d30bffb2540f2dd7bfe8ea66d737bfe"
-SRCREV_machine:qemuarm64 ?= "470798ad34773e9e60e08ba80a8b7e6c4cf65c94"
-SRCREV_machine:qemumips ?= "9dcb3aaf2e30172cfb33b13d50bae621cd449f5b"
-SRCREV_machine:qemuppc ?= "faaa6b1dd4c1bf3550efa07e788f6849729e9d7b"
-SRCREV_machine:qemuriscv64 ?= "b8a4501ad3a651d576df481df20bf20fd3e969df"
-SRCREV_machine:qemuriscv32 ?= "b8a4501ad3a651d576df481df20bf20fd3e969df"
-SRCREV_machine:qemux86 ?= "b8a4501ad3a651d576df481df20bf20fd3e969df"
-SRCREV_machine:qemux86-64 ?= "b8a4501ad3a651d576df481df20bf20fd3e969df"
-SRCREV_machine:qemumips64 ?= "a41a7b13730b656588ac38cf0f1af6f9f255e112"
-SRCREV_machine ?= "b8a4501ad3a651d576df481df20bf20fd3e969df"
+SRCREV_machine:qemuarm ?= "c9c4163f1d7a05a8a9e74f519ec7acc54259f53b"
+SRCREV_machine:qemuarm64 ?= "1cbfaca7888ffe8f6ce58987080a86b48161ce44"
+SRCREV_machine:qemumips ?= "9d83787163c68c2390136915fcfbf3e781d56874"
+SRCREV_machine:qemuppc ?= "a6d06d797ba2ae6c391898a42fced6c3eb71aad0"
+SRCREV_machine:qemuriscv64 ?= "4399f7dbd01bd141ad6033438eb818820322ef13"
+SRCREV_machine:qemuriscv32 ?= "4399f7dbd01bd141ad6033438eb818820322ef13"
+SRCREV_machine:qemux86 ?= "4399f7dbd01bd141ad6033438eb818820322ef13"
+SRCREV_machine:qemux86-64 ?= "4399f7dbd01bd141ad6033438eb818820322ef13"
+SRCREV_machine:qemumips64 ?= "577bbb0ffdafbe77c802b1ff6cd09beec4cf0302"
+SRCREV_machine ?= "4399f7dbd01bd141ad6033438eb818820322ef13"
 SRCREV_meta ?= "8ce5ee0184fb213962a82ca5ee8c74851452e260"
 
 # set your preferred provider of linux-yocto to 'linux-yocto-upstream', and you'll
@@ -30,7 +30,7 @@ SRCREV_meta ?= "8ce5ee0184fb213962a82ca5ee8c74851452e260"
 # meta SRCREV as the linux-yocto-standard builds. Select your version using the
 # normal PREFERRED_VERSION settings.
 BBCLASSEXTEND = "devupstream:target"
-SRCREV_machine:class-devupstream ?= "f48aeeaaa64c628519273f6007a745cf55b68d95"
+SRCREV_machine:class-devupstream ?= "8a7f2a5c5aa1648edb4f2029c6ec33870afb7a95"
 PN:class-devupstream = "linux-yocto-upstream"
 KBRANCH:class-devupstream = "v5.15/base"
 
@@ -38,7 +38,7 @@ SRC_URI = "git://git.yoctoproject.org/linux-yocto.git;name=machine;branch=${KBRA
            git://git.yoctoproject.org/yocto-kernel-cache;type=kmeta;name=meta;branch=yocto-5.15;destsuffix=${KMETA};protocol=https"
 
 LIC_FILES_CHKSUM = "file://COPYING;md5=6bc538ed5bd9a7fc9398086aedcd7e46"
-LINUX_VERSION ?= "5.15.109"
+LINUX_VERSION ?= "5.15.110"
 
 DEPENDS += "${@bb.utils.contains('ARCH', 'x86', 'elfutils-native', '', d)}"
 DEPENDS += "openssl-native util-linux-native"
-- 
2.34.1


