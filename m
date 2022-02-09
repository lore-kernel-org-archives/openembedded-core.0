Return-Path: <bruce.ashfield@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id DB199C433EF
	for <webhook@archiver.kernel.org>; Wed,  9 Feb 2022 23:03:55 +0000 (UTC)
Received: from mail-vk1-f174.google.com (mail-vk1-f174.google.com
 [209.85.221.174])
 by mx.groups.io with SMTP id smtpd.web11.2808.1644447835300620779
 for <openembedded-core@lists.openembedded.org>;
 Wed, 09 Feb 2022 15:03:55 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20210112 header.b=Yq1jr7sr;
 spf=pass (domain: gmail.com, ip: 209.85.221.174,
 mailfrom: bruce.ashfield@gmail.com)
Received: by mail-vk1-f174.google.com with SMTP id u82so2049629vkb.11
        for <openembedded-core@lists.openembedded.org>;
 Wed, 09 Feb 2022 15:03:55 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=tbQn26o391UtXFaNwRl/EpTsGeQ2zUIfJm6Ggn5Sok0=;
        b=Yq1jr7sr1LszYbwOSi6bZFuJsdZDZ/qO8R+4/Qzqi+pnVHf2QXA4CIruekVm9opMwc
         1Moztown2+i7giyZVnVVX3McBT7fCf2l37uKPJCQFbPdaaSc+ee3cNhvwVef6Y2nvIwi
         eNMWRjXiti+sh7BLSAXt7yh2Cy3S5YssOa2FoB5HHKcU2xSgLYKiI0Il5kQbMSFzWIDQ
         ovquYRgs8ZrcboWV0RFfjYi9fm3p3CTP2FjqXSGxIa6S72zwk8eVCg3UYzGIc6F7b181
         iysE7g0f4s6slsGV9AfzLQrkzhsivZvuruQkRIdBNJOPwEnpCEUsKiZsNsGitCSGDfPy
         jt1w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=tbQn26o391UtXFaNwRl/EpTsGeQ2zUIfJm6Ggn5Sok0=;
        b=D/oWzKOJgWhUfA7eSjlqMzgr2R4NvX1yNLLIQLfx641dPdaFtCfHyRpMnJej2YkY1i
         upgXRaqVxffAnkHsuNd1/LBSg/m8u9dBt5q/Y67EcwoDaQGnjUImF5QUjKF36q6SASlv
         R13bmt6NokNNFg2G9b+3DAs2H4ArowuzlgziZO5apR4xQ/FmCJGNgAHPbSQHxFO4j1Kf
         2wpuuwp/4DUsFVWC6YUmPBnLX0VU/nFGa+SJUWw4OrkZN4OjvNYoXBwz13omMyMpzRvA
         NpvUoIWQngbDfQ/i4MKOr22P04c4H2XDdnMnmpH8hzvxTLYRwMG4byQ/8Nnn06MFRXTQ
         1VTg==
X-Gm-Message-State: AOAM532Sj050qh/EpL5aa0i2Bvt1ZrjfOA2NY2CLEUHpR2kSl6ZdI+nS
	mzewZrZi6/1x2Bb1eDHuCP8=
X-Google-Smtp-Source: 
 ABdhPJwYhABwIybTdgOWF9tDc7RKPIo56p07I7LqRR3KPeAl+aRRkQp11lOA3NMxPZjgCo5nqiMG2w==
X-Received: by 2002:a05:6122:1692:: with SMTP id
 18mr1737737vkl.25.1644447834393;
        Wed, 09 Feb 2022 15:03:54 -0800 (PST)
Received: from build.lan
 (cpe04d4c4975b80-cmf4c11490699b.cpe.net.cable.rogers.com. [174.112.63.222])
        by smtp.gmail.com with ESMTPSA id
 29sm3511994vki.25.2022.02.09.15.03.53
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 09 Feb 2022 15:03:53 -0800 (PST)
From: bruce.ashfield@gmail.com
To: steve@sakoman.com,
	richard.purdie@linuxfoundation.org
Cc: openembedded-core@lists.openembedded.org
Subject: [PATCH 1/3] linux-yocto/5.4: update to v5.4.173
Date: Wed,  9 Feb 2022 18:03:50 -0500
Message-Id: <20220209230352.28324-1-bruce.ashfield@gmail.com>
X-Mailer: git-send-email 2.19.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Wed, 09 Feb 2022 23:03:55 -0000
X-Groupsio-URL: 
 https://lists.openembedded.org/g/openembedded-core/message/161592

From: Bruce Ashfield <bruce.ashfield@gmail.com>

Updating linux-yocto/5.4 to the latest korg -stable release that comprises
the following commits:

    4aa2e7393e14 Linux 5.4.173
    e245aaefef39 ARM: 9025/1: Kconfig: CPU_BIG_ENDIAN depends on !LD_IS_LLD
    d40f6eeaf513 mtd: fixup CFI on ixp4xx
    1451deb164e1 ALSA: hda/realtek - Fix silent output on Gigabyte X570 Aorus Master after reboot from Windows
    7b98f61b8388 KVM: x86: remove PMU FIXED_CTR3 from msrs_to_save_all
    5c69ba9e80f0 firmware: qemu_fw_cfg: fix kobject leak in probe error path
    1cc36ed56138 firmware: qemu_fw_cfg: fix NULL-pointer deref on duplicate entries
    b543e4141570 firmware: qemu_fw_cfg: fix sysfs information leak
    b25e9ef29d8f rtlwifi: rtl8192cu: Fix WARNING when calling local_irq_restore() with interrupts enabled
    8716657b1b4b media: uvcvideo: fix division by zero at stream start
    70ae85ca124e KVM: s390: Clarify SIGP orders versus STOP/RESTART
    9b45f2007ea3 perf: Protect perf_guest_cbs with RCU
    bd2aed0464ae vfs: fs_context: fix up param length parsing in legacy_parse_param
    c2f067d4ad4a orangefs: Fix the size of a memory allocation in orangefs_bufmap_alloc()
    5d6af67307e8 devtmpfs regression fix: reconfigure on each mount
    c117b116e6b3 kbuild: Add $(KBUILD_HOSTLDFLAGS) to 'has_libelf' test

Signed-off-by: Bruce Ashfield <bruce.ashfield@gmail.com>
---
 .../linux/linux-yocto-rt_5.4.bb               |  6 ++---
 .../linux/linux-yocto-tiny_5.4.bb             |  8 +++----
 meta/recipes-kernel/linux/linux-yocto_5.4.bb  | 22 +++++++++----------
 3 files changed, 18 insertions(+), 18 deletions(-)

diff --git a/meta/recipes-kernel/linux/linux-yocto-rt_5.4.bb b/meta/recipes-kernel/linux/linux-yocto-rt_5.4.bb
index 9e8281c7a1..8e5a0ae5e0 100644
--- a/meta/recipes-kernel/linux/linux-yocto-rt_5.4.bb
+++ b/meta/recipes-kernel/linux/linux-yocto-rt_5.4.bb
@@ -11,13 +11,13 @@ python () {
         raise bb.parse.SkipRecipe("Set PREFERRED_PROVIDER_virtual/kernel to linux-yocto-rt to enable it")
 }
 
-SRCREV_machine ?= "e92d76afe6d8592917c0e7b948912c085e661df2"
-SRCREV_meta ?= "98cce1c95fcc9a26965cbc5f038fd71d53c387c8"
+SRCREV_machine ?= "04f6e2728373decb06b2c159cdf599c8813a7ea2"
+SRCREV_meta ?= "9e6e627445612ea0b6cc514bcdb879de3999f175"
 
 SRC_URI = "git://git.yoctoproject.org/linux-yocto.git;branch=${KBRANCH};name=machine \
            git://git.yoctoproject.org/yocto-kernel-cache;type=kmeta;name=meta;branch=yocto-5.4;destsuffix=${KMETA}"
 
-LINUX_VERSION ?= "5.4.172"
+LINUX_VERSION ?= "5.4.173"
 
 LIC_FILES_CHKSUM = "file://COPYING;md5=bbea815ee2795b2f4230826c0c6b8814"
 
diff --git a/meta/recipes-kernel/linux/linux-yocto-tiny_5.4.bb b/meta/recipes-kernel/linux/linux-yocto-tiny_5.4.bb
index a75570df93..53f85c8cd4 100644
--- a/meta/recipes-kernel/linux/linux-yocto-tiny_5.4.bb
+++ b/meta/recipes-kernel/linux/linux-yocto-tiny_5.4.bb
@@ -6,7 +6,7 @@ KCONFIG_MODE = "--allnoconfig"
 
 require recipes-kernel/linux/linux-yocto.inc
 
-LINUX_VERSION ?= "5.4.172"
+LINUX_VERSION ?= "5.4.173"
 LIC_FILES_CHKSUM = "file://COPYING;md5=bbea815ee2795b2f4230826c0c6b8814"
 
 DEPENDS += "${@bb.utils.contains('ARCH', 'x86', 'elfutils-native', '', d)}"
@@ -15,9 +15,9 @@ DEPENDS += "openssl-native util-linux-native"
 KMETA = "kernel-meta"
 KCONF_BSP_AUDIT_LEVEL = "2"
 
-SRCREV_machine_qemuarm ?= "10b4756eee78aa43ff9ed64da700ec6e8d97ff22"
-SRCREV_machine ?= "6ab93fdc53b64e146e4f16363375c1beb37b82e4"
-SRCREV_meta ?= "98cce1c95fcc9a26965cbc5f038fd71d53c387c8"
+SRCREV_machine_qemuarm ?= "dd1d37cf1243bb0194f63992294c386b91b883ee"
+SRCREV_machine ?= "149a477216fedee100a2a7c749d7876a5af18c3d"
+SRCREV_meta ?= "9e6e627445612ea0b6cc514bcdb879de3999f175"
 
 PV = "${LINUX_VERSION}+git${SRCPV}"
 
diff --git a/meta/recipes-kernel/linux/linux-yocto_5.4.bb b/meta/recipes-kernel/linux/linux-yocto_5.4.bb
index 2d7f7559e5..ad22072ddf 100644
--- a/meta/recipes-kernel/linux/linux-yocto_5.4.bb
+++ b/meta/recipes-kernel/linux/linux-yocto_5.4.bb
@@ -12,16 +12,16 @@ KBRANCH_qemux86  ?= "v5.4/standard/base"
 KBRANCH_qemux86-64 ?= "v5.4/standard/base"
 KBRANCH_qemumips64 ?= "v5.4/standard/mti-malta64"
 
-SRCREV_machine_qemuarm ?= "8de1da3dc354dedef2e435e694eec6d6e72c9822"
-SRCREV_machine_qemuarm64 ?= "eed7c0a64f3a7a91a130bc2e507304dc8b446a31"
-SRCREV_machine_qemumips ?= "996a9660e4fab70db5cecec9c831141cd03c3d36"
-SRCREV_machine_qemuppc ?= "0197cf5754b1bd4eb035c342af9cc27e8c3339ca"
-SRCREV_machine_qemuriscv64 ?= "c6b015510134942076c0e111e56357656acf3dd5"
-SRCREV_machine_qemux86 ?= "c6b015510134942076c0e111e56357656acf3dd5"
-SRCREV_machine_qemux86-64 ?= "c6b015510134942076c0e111e56357656acf3dd5"
-SRCREV_machine_qemumips64 ?= "fe2769a7c268ed224ec70fd2aaab850e4eef70dc"
-SRCREV_machine ?= "c6b015510134942076c0e111e56357656acf3dd5"
-SRCREV_meta ?= "98cce1c95fcc9a26965cbc5f038fd71d53c387c8"
+SRCREV_machine_qemuarm ?= "7d8ca1d1b0891c023c74d79ea39e045d1a794077"
+SRCREV_machine_qemuarm64 ?= "79e8b8d059d36f1c2e7e20e38f883ea8c7381ffa"
+SRCREV_machine_qemumips ?= "bed90b69d8120029e8b362166c11437a257b9fdc"
+SRCREV_machine_qemuppc ?= "e886407de7b10259c99c61f9538af43181f2fec3"
+SRCREV_machine_qemuriscv64 ?= "9d1d023f9d659fd8678f020f3e98d735b27896fb"
+SRCREV_machine_qemux86 ?= "9d1d023f9d659fd8678f020f3e98d735b27896fb"
+SRCREV_machine_qemux86-64 ?= "9d1d023f9d659fd8678f020f3e98d735b27896fb"
+SRCREV_machine_qemumips64 ?= "20b16bf3c848f34be5b747f27c4cfc1237bcefbd"
+SRCREV_machine ?= "9d1d023f9d659fd8678f020f3e98d735b27896fb"
+SRCREV_meta ?= "9e6e627445612ea0b6cc514bcdb879de3999f175"
 
 # remap qemuarm to qemuarma15 for the 5.4 kernel
 # KMACHINE_qemuarm ?= "qemuarma15"
@@ -30,7 +30,7 @@ SRC_URI = "git://git.yoctoproject.org/linux-yocto.git;name=machine;branch=${KBRA
            git://git.yoctoproject.org/yocto-kernel-cache;type=kmeta;name=meta;branch=yocto-5.4;destsuffix=${KMETA}"
 
 LIC_FILES_CHKSUM = "file://COPYING;md5=bbea815ee2795b2f4230826c0c6b8814"
-LINUX_VERSION ?= "5.4.172"
+LINUX_VERSION ?= "5.4.173"
 
 DEPENDS += "${@bb.utils.contains('ARCH', 'x86', 'elfutils-native', '', d)}"
 DEPENDS += "openssl-native util-linux-native"
-- 
2.19.1


