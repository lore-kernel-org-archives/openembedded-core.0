Return-Path: <steve@sakoman.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 58FFEEB64DC
	for <webhook@archiver.kernel.org>; Thu, 22 Jun 2023 02:36:33 +0000 (UTC)
Received: from mail-pf1-f182.google.com (mail-pf1-f182.google.com [209.85.210.182])
 by mx.groups.io with SMTP id smtpd.web10.1216.1687401390844532143
 for <openembedded-core@lists.openembedded.org>;
 Wed, 21 Jun 2023 19:36:30 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@sakoman-com.20221208.gappssmtp.com header.s=20221208 header.b=InBBS0UD;
 spf=softfail (domain: sakoman.com, ip: 209.85.210.182, mailfrom: steve@sakoman.com)
Received: by mail-pf1-f182.google.com with SMTP id d2e1a72fcca58-66767d628e2so2757723b3a.2
        for <openembedded-core@lists.openembedded.org>; Wed, 21 Jun 2023 19:36:30 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=sakoman-com.20221208.gappssmtp.com; s=20221208; t=1687401390; x=1689993390;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=2+B7pIicpZ5ccrnPx+ex0M0kT/iMqfPAisgDn0eS8ow=;
        b=InBBS0UDNJ1/P4knqelk65lsgVAL1Zw1eeQSTuaht812HFU6TKuvltXGCZ0XDF3Xz8
         uUjY7HbvGEbUcUYCp3rg1iK/vvDF2tmiBOGtG3ipBhMSshqELyp/DwomZ4sQhGUnKWUf
         7cMxCTO8EC2iwnkjK2JCvcjEaEBGYDciHl0j8VfbrEpQAJiRgK8NdSYQcrvtXR8EOCH6
         3CnOVbumYQXt4BKboDBfCPgT5RqqmN99mnMNxG2Iwiiciy/rRdb1/BYi/yXb/lH2JAHP
         v4WY1LB0vx1jWsrFignWcgL7BAwVRr9wXbxheTgzTDWmOzoQhbRyH49vMnkZgngA+Ddq
         1w/A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1687401390; x=1689993390;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=2+B7pIicpZ5ccrnPx+ex0M0kT/iMqfPAisgDn0eS8ow=;
        b=VCPUwWj8xp03IPqF+9eQ3eeVj9t35Y6VaMitA830VIdAUOiSH0//YANhO0DeZ3Ikmu
         H2ZFnz5j8J7hth4oHQ/8Hlpc+zhRxkVeL9jvLSm/1wUYrnchsY9mmM4OrcgIqJWBMr/i
         /mbYmBa82dtz6HCvnU9AKpSw+hn+OCGmE0eKTCnuSkCi/UkdcUpeEeC+lnQeay0bDHxh
         /OAT2m05PXqawlQD5jxUN/1AuqirOfH+G3+kKXouFRBK1UQj9c4U+S/59ecMGRvZlAhJ
         zSUU+XkzQMxaRQwLqSdEAC+84wU5xLM8l9yS614Pe3f9koePllg+7IdXYswKFsgii1rP
         pwXQ==
X-Gm-Message-State: AC+VfDy02rxT6yGu5AcSC89m2jOWQ7n+Ly7hupj8TYwbaFbvb94lyRi1
	DALEL8jBYJAgcXbJmls/TcDkNerwXUa9JOYa964=
X-Google-Smtp-Source: ACHHUZ7Ix4wGcNxkLd2TLfJH97ZUOJXH7IS40aMKDmRNZ+t6WVF/hKS5ZahZ6Zsm9K5VUuBST/bQMQ==
X-Received: by 2002:a05:6a20:1610:b0:116:5321:63bf with SMTP id l16-20020a056a20161000b00116532163bfmr13027248pzj.41.1687401389841;
        Wed, 21 Jun 2023 19:36:29 -0700 (PDT)
Received: from hexa.router0800d9.com (dhcp-72-234-106-30.hawaiiantel.net. [72.234.106.30])
        by smtp.gmail.com with ESMTPSA id jn9-20020a170903050900b001b679ec20f2sm4143691plb.31.2023.06.21.19.36.28
        for <openembedded-core@lists.openembedded.org>
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 21 Jun 2023 19:36:29 -0700 (PDT)
From: Steve Sakoman <steve@sakoman.com>
To: openembedded-core@lists.openembedded.org
Subject: [OE-core][mickledore 13/23] linux-yocto/6.1: update to v6.1.27
Date: Wed, 21 Jun 2023 16:35:45 -1000
Message-Id: <13ee4adecfddb99c311959c6d92234f949b41b25.1687401182.git.steve@sakoman.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <cover.1687401182.git.steve@sakoman.com>
References: <cover.1687401182.git.steve@sakoman.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Thu, 22 Jun 2023 02:36:33 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/183213

From: Bruce Ashfield <bruce.ashfield@gmail.com>

Updating  to the latest korg -stable release that comprises
the following commits:

    ca48fc16c493 Linux 6.1.27
    0bbec73fdd9e riscv: No need to relocate the dtb as it lies in the fixmap region
    17509e73ac8b riscv: Do not set initial_boot_params to the linear address of the dtb
    ed96b3143540 riscv: Move early dtb mapping into the fixmap region
    7cb8c95c0a6d driver core: Don't require dynamic_debug for initcall_debug probe timing
    ce0555352a28 USB: serial: option: add UNISOC vendor and TOZED LT70C product
    17e5ce4d89ad btrfs: fix uninitialized variable warnings
    47e6893a5b0a bluetooth: Perform careful capability checks in hci_sock_ioctl()
    c4acbf376124 gpiolib: acpi: Add a ignore wakeup quirk for Clevo NL5xNU
    d27acf15c8fa drm/fb-helper: set x/yres_virtual in drm_fb_helper_check_var
    e29661611e6e wifi: brcmfmac: slab-out-of-bounds read in brcmf_get_assoc_ies()
    34cec5cd7abc mptcp: fix accept vs worker race
    b45d8f5375ed mptcp: stops worker on unaccepted sockets at listener close
    862ea63fad16 mm/mempolicy: fix use-after-free of VMA iterator
    e1562cc202c9 KVM: arm64: Retry fault if vma_lookup() results become invalid
    d70f63be626d phy: phy-brcm-usb: Utilize platform_get_irq_byname_optional()
    7d057bf201ca um: Only disable SSE on clang to work around old GCC bugs

Signed-off-by: Bruce Ashfield <bruce.ashfield@gmail.com>
Signed-off-by: Richard Purdie <richard.purdie@linuxfoundation.org>
(cherry picked from commit 80f045c03cde302e135af53a19276d6487fcdf66)
Signed-off-by: Steve Sakoman <steve@sakoman.com>
---
 .../linux/linux-yocto-rt_6.1.bb               |  6 ++--
 .../linux/linux-yocto-tiny_6.1.bb             |  6 ++--
 meta/recipes-kernel/linux/linux-yocto_6.1.bb  | 28 +++++++++----------
 3 files changed, 20 insertions(+), 20 deletions(-)

diff --git a/meta/recipes-kernel/linux/linux-yocto-rt_6.1.bb b/meta/recipes-kernel/linux/linux-yocto-rt_6.1.bb
index d2dc7e60f1..66550914c4 100644
--- a/meta/recipes-kernel/linux/linux-yocto-rt_6.1.bb
+++ b/meta/recipes-kernel/linux/linux-yocto-rt_6.1.bb
@@ -14,13 +14,13 @@ python () {
         raise bb.parse.SkipRecipe("Set PREFERRED_PROVIDER_virtual/kernel to linux-yocto-rt to enable it")
 }
 
-SRCREV_machine ?= "128a73d5e1339475618b41383121a0eef4bb29de"
-SRCREV_meta ?= "1bb0236be7c49344bd411c71f21769153ecd9695"
+SRCREV_machine ?= "573386d3cb8c102496deecf92ca867ff9d044ae1"
+SRCREV_meta ?= "b82e23405925b724cecf3deacc13739db6720ca2"
 
 SRC_URI = "git://git.yoctoproject.org/linux-yocto.git;branch=${KBRANCH};name=machine;protocol=https \
            git://git.yoctoproject.org/yocto-kernel-cache;type=kmeta;name=meta;branch=yocto-6.1;destsuffix=${KMETA};protocol=https"
 
-LINUX_VERSION ?= "6.1.26"
+LINUX_VERSION ?= "6.1.27"
 
 LIC_FILES_CHKSUM = "file://COPYING;md5=6bc538ed5bd9a7fc9398086aedcd7e46"
 
diff --git a/meta/recipes-kernel/linux/linux-yocto-tiny_6.1.bb b/meta/recipes-kernel/linux/linux-yocto-tiny_6.1.bb
index b2f6266018..7eec6e97aa 100644
--- a/meta/recipes-kernel/linux/linux-yocto-tiny_6.1.bb
+++ b/meta/recipes-kernel/linux/linux-yocto-tiny_6.1.bb
@@ -8,7 +8,7 @@ require recipes-kernel/linux/linux-yocto.inc
 # CVE exclusions
 include recipes-kernel/linux/cve-exclusion_6.1.inc
 
-LINUX_VERSION ?= "6.1.26"
+LINUX_VERSION ?= "6.1.27"
 LIC_FILES_CHKSUM = "file://COPYING;md5=6bc538ed5bd9a7fc9398086aedcd7e46"
 
 DEPENDS += "${@bb.utils.contains('ARCH', 'x86', 'elfutils-native', '', d)}"
@@ -17,8 +17,8 @@ DEPENDS += "openssl-native util-linux-native"
 KMETA = "kernel-meta"
 KCONF_BSP_AUDIT_LEVEL = "2"
 
-SRCREV_machine ?= "c35e45ea5f134aad3ef0ccd3f1b7b672c801e402"
-SRCREV_meta ?= "1bb0236be7c49344bd411c71f21769153ecd9695"
+SRCREV_machine ?= "5595b9b98df96b1ef27dc5879d19b9b512cc5c14"
+SRCREV_meta ?= "b82e23405925b724cecf3deacc13739db6720ca2"
 
 PV = "${LINUX_VERSION}+git${SRCPV}"
 
diff --git a/meta/recipes-kernel/linux/linux-yocto_6.1.bb b/meta/recipes-kernel/linux/linux-yocto_6.1.bb
index a7a5a82813..46ed1f8b30 100644
--- a/meta/recipes-kernel/linux/linux-yocto_6.1.bb
+++ b/meta/recipes-kernel/linux/linux-yocto_6.1.bb
@@ -17,25 +17,25 @@ KBRANCH:qemux86-64 ?= "v6.1/standard/base"
 KBRANCH:qemuloongarch64  ?= "v6.1/standard/base"
 KBRANCH:qemumips64 ?= "v6.1/standard/mti-malta64"
 
-SRCREV_machine:qemuarm ?= "171d448bfb9e531c7395deae260edf96305eab9c"
-SRCREV_machine:qemuarm64 ?= "c35e45ea5f134aad3ef0ccd3f1b7b672c801e402"
-SRCREV_machine:qemuloongarch64 ?= "c35e45ea5f134aad3ef0ccd3f1b7b672c801e402"
-SRCREV_machine:qemumips ?= "d637594e7e9c9037d7c609f9dfeef13a57a5aec4"
-SRCREV_machine:qemuppc ?= "c35e45ea5f134aad3ef0ccd3f1b7b672c801e402"
-SRCREV_machine:qemuriscv64 ?= "c35e45ea5f134aad3ef0ccd3f1b7b672c801e402"
-SRCREV_machine:qemuriscv32 ?= "c35e45ea5f134aad3ef0ccd3f1b7b672c801e402"
-SRCREV_machine:qemux86 ?= "c35e45ea5f134aad3ef0ccd3f1b7b672c801e402"
-SRCREV_machine:qemux86-64 ?= "c35e45ea5f134aad3ef0ccd3f1b7b672c801e402"
-SRCREV_machine:qemumips64 ?= "52e3ff0902681ac3d9128bcf037033e14ae20d68"
-SRCREV_machine ?= "c35e45ea5f134aad3ef0ccd3f1b7b672c801e402"
-SRCREV_meta ?= "1bb0236be7c49344bd411c71f21769153ecd9695"
+SRCREV_machine:qemuarm ?= "df2cfcb92e63bdbdd34667d5915a71b1441ec723"
+SRCREV_machine:qemuarm64 ?= "5595b9b98df96b1ef27dc5879d19b9b512cc5c14"
+SRCREV_machine:qemuloongarch64 ?= "5595b9b98df96b1ef27dc5879d19b9b512cc5c14"
+SRCREV_machine:qemumips ?= "9cf687bf5869c57781cb399038d455351e4517e9"
+SRCREV_machine:qemuppc ?= "5595b9b98df96b1ef27dc5879d19b9b512cc5c14"
+SRCREV_machine:qemuriscv64 ?= "5595b9b98df96b1ef27dc5879d19b9b512cc5c14"
+SRCREV_machine:qemuriscv32 ?= "5595b9b98df96b1ef27dc5879d19b9b512cc5c14"
+SRCREV_machine:qemux86 ?= "5595b9b98df96b1ef27dc5879d19b9b512cc5c14"
+SRCREV_machine:qemux86-64 ?= "5595b9b98df96b1ef27dc5879d19b9b512cc5c14"
+SRCREV_machine:qemumips64 ?= "6e551dbbbc3d447255314706f089a45670063901"
+SRCREV_machine ?= "5595b9b98df96b1ef27dc5879d19b9b512cc5c14"
+SRCREV_meta ?= "b82e23405925b724cecf3deacc13739db6720ca2"
 
 # set your preferred provider of linux-yocto to 'linux-yocto-upstream', and you'll
 # get the <version>/base branch, which is pure upstream -stable, and the same
 # meta SRCREV as the linux-yocto-standard builds. Select your version using the
 # normal PREFERRED_VERSION settings.
 BBCLASSEXTEND = "devupstream:target"
-SRCREV_machine:class-devupstream ?= "ca1c9012c941ab1520851938d5f695f5a4d23634"
+SRCREV_machine:class-devupstream ?= "ca48fc16c49388400eddd6c6614593ebf7c7726a"
 PN:class-devupstream = "linux-yocto-upstream"
 KBRANCH:class-devupstream = "v6.1/base"
 
@@ -43,7 +43,7 @@ SRC_URI = "git://git.yoctoproject.org/linux-yocto.git;name=machine;branch=${KBRA
            git://git.yoctoproject.org/yocto-kernel-cache;type=kmeta;name=meta;branch=yocto-6.1;destsuffix=${KMETA};protocol=https"
 
 LIC_FILES_CHKSUM = "file://COPYING;md5=6bc538ed5bd9a7fc9398086aedcd7e46"
-LINUX_VERSION ?= "6.1.26"
+LINUX_VERSION ?= "6.1.27"
 
 PV = "${LINUX_VERSION}+git${SRCPV}"
 
-- 
2.34.1


