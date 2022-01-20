Return-Path: <steve@sakoman.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 6EFD6C4332F
	for <webhook@archiver.kernel.org>; Thu, 20 Jan 2022 21:24:22 +0000 (UTC)
Received: from mail-pj1-f45.google.com (mail-pj1-f45.google.com
 [209.85.216.45])
 by mx.groups.io with SMTP id smtpd.web12.2649.1642713862004045257
 for <openembedded-core@lists.openembedded.org>;
 Thu, 20 Jan 2022 13:24:22 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@sakoman-com.20210112.gappssmtp.com header.s=20210112
 header.b=Q+fm8o1x;
 spf=softfail (domain: sakoman.com, ip: 209.85.216.45,
 mailfrom: steve@sakoman.com)
Received: by mail-pj1-f45.google.com with SMTP id h12so7292903pjq.3
        for <openembedded-core@lists.openembedded.org>;
 Thu, 20 Jan 2022 13:24:21 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=sakoman-com.20210112.gappssmtp.com; s=20210112;
        h=from:to:subject:date:message-id:in-reply-to:references:mime-version
         :content-transfer-encoding;
        bh=pARTmxUdtd+q/jdP0CRK1vvUDrRa7cD+TEfJy4twLzw=;
        b=Q+fm8o1xtUx5paHUssdWhj2Nd2WKUPRy3WFHpHwc+DSjHYSYlV4IKdnsKEFfG4oH5j
         qQWX15Z64ZOjZOGZ6JWZmDA7mg7rvu9fuVD1INc6VVshQ7bY37kc0EewwRbVIByNp/2u
         g3nTSA4Hs9Mpu3U58S4+pI9WRMdMyOs59GZN2LhCw+WNXmg1HtJ23+DjZCE64t3PJPmW
         A2BL++c9ptpVUe6+058bCrqkBsU4uUXOIEx20NSr+OV55Oy9t66RJE0yvTXPUO5YKY6p
         Nues4mG2ZFenYQplJse4WHFgPRrU/fypyQ0FLWuQbiqP7y/Jb/JXzISeTIbFufEVW90N
         v/kw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:from:to:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=pARTmxUdtd+q/jdP0CRK1vvUDrRa7cD+TEfJy4twLzw=;
        b=dgr60AQ/ri3mUMlkAI/MEIhQEIU2uQn2cMxqzXjXXf6xl1sYB9ZzYGQ4iu/ySsclF2
         mCK/2P01D+7cAW2c8rvIWIChypDq0CMqaxu6Jl6l8uiP9jg0Qht7DpY1tTgVI0ppyruZ
         bQyN1XI/I5QAd4rMV8phFVnqy59UcA0BY97oo1KnikBc2ZcJRluKpAsj1MLmaAbhyGY9
         a+ZFN8WPFiC3QBOawBwwbh4NJrrD2ZeS1dv9D89VvB8RgjySvodMLd6YYcTyaXwCehWJ
         DNfOkLLweplKaL/a5LxArH5ks/+iOvRjPWzRiar+rRsJtLVTaL8C5J1QVvE5/uVxUaQ6
         HKqg==
X-Gm-Message-State: AOAM533M9t54x3Csj79dM/dG54u/Q/T3Rk2fYu9kUFfad3De9U+BgLjA
	Jszmbj/zve7f0EF6HtAakSYhtxuMALGx9D5ekgA=
X-Google-Smtp-Source: 
 ABdhPJwhmMuaO+BMzYSy7M9AlVjf71q6ZkTQMx68mlFbUx8u6uTmkrMZMu7sj2urJgArQ6zUaqKBAA==
X-Received: by 2002:a17:902:c613:b0:14a:828d:fe51 with SMTP id
 r19-20020a170902c61300b0014a828dfe51mr612221plr.109.1642713860646;
        Thu, 20 Jan 2022 13:24:20 -0800 (PST)
Received: from hexa.router0800d9.com (rrcs-66-91-142-162.west.biz.rr.com.
 [66.91.142.162])
        by smtp.gmail.com with ESMTPSA id
 o5sm4029115pfk.172.2022.01.20.13.24.19
        for <openembedded-core@lists.openembedded.org>
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 20 Jan 2022 13:24:20 -0800 (PST)
From: Steve Sakoman <steve@sakoman.com>
To: openembedded-core@lists.openembedded.org
Subject: [OE-core][dunfell 06/11] linux-yocto/5.4: update to v5.4.170
Date: Thu, 20 Jan 2022 11:23:45 -1000
Message-Id: 
 <411adf3dbe122b42acc7810bc3034874fc36f473.1642693490.git.steve@sakoman.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <cover.1642693490.git.steve@sakoman.com>
References: <cover.1642693490.git.steve@sakoman.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Thu, 20 Jan 2022 21:24:22 -0000
X-Groupsio-URL: 
 https://lists.openembedded.org/g/openembedded-core/message/160796

From: Bruce Ashfield <bruce.ashfield@gmail.com>

Updating linux-yocto/5.4 to the latest korg -stable release that comprises
the following commits:

047dedaa38ce Linux 5.4.170
2c3920c58e03 perf script: Fix CPU filtering of a script's switch events
fe5838c22b98 net: fix use-after-free in tw_timer_handler
46556c4ecd63 Input: spaceball - fix parsing of movement data packets
975774ea7528 Input: appletouch - initialize work before device registration
436f6d0005d6 scsi: vmw_pvscsi: Set residual data length conditionally
103b16a8c51f binder: fix async_free_space accounting for empty parcels
98cde4dd5ec8 usb: mtu3: set interval of FS intr and isoc endpoint
585e2b244dda usb: mtu3: fix list_head check warning
50434eb6098f usb: mtu3: add memory barrier before set GPD's HWO
240fc586e83d usb: gadget: f_fs: Clear ffs_eventfd in ffs_data_clear.
20d80640fa61 xhci: Fresco FL1100 controller should not have BROKEN_MSI quirk set.
b364fcef9615 uapi: fix linux/nfc.h userspace compilation errors
245c5e43cd25 nfc: uapi: use kernel size_t to fix user-space builds
9e4a3f47eff4 i2c: validate user data in compat ioctl
a7d3a1c6d9d9 fsl/fman: Fix missing put_device() call in fman_port_probe
2dc95e936414 net/ncsi: check for error return from call to nla_put_u32
ef01d63140f5 selftests/net: udpgso_bench_tx: fix dst ip argument
20f6896787c5 net/mlx5e: Fix wrong features assignment in case of error
b85f87d30dba ionic: Initialize the 'lif->dbid_inuse' bitmap
1cd4063dbc91 NFC: st21nfca: Fix memory leak in device probe and remove
44cd64aa1c43 net: lantiq_xrx200: fix statistics of received bytes
3477f4b67ee4 net: usb: pegasus: Do not drop long Ethernet frames
831de271452b sctp: use call_rcu to free endpoint
3218d6bd6195 selftests: Calculate udpgso segment count without header adjustment
0a2e9f6a8f33 udp: using datalen to cap ipv6 udp max gso segments
db484d35a948 net/mlx5: DR, Fix NULL vs IS_ERR checking in dr_domain_init_resources
cc926b8f4d39 scsi: lpfc: Terminate string in lpfc_debugfs_nvmeio_trc_write()
44937652afdb selinux: initialize proto variable in selinux_ip_postroute_compat()
b536e357e73c recordmcount.pl: fix typo in s390 mcount regex
8d86b486e0de memblock: fix memblock_phys_alloc() section mismatch error
4606bfdaeb16 platform/x86: apple-gmux: use resource_size() with res
930d4986a432 tomoyo: Check exceeded quota early in tomoyo_domain_quota_is_ok().
7978ddae240b Input: i8042 - enable deferred probe quirk for ASUS UM325UA
f93d5dca7d84 Input: i8042 - add deferred probe support
940e68e57ab6 tee: handle lookup of shm with reference count 0
4b38b12092b4 HID: asus: Add depends on USB_HID to HID_ASUS Kconfig option

Signed-off-by: Bruce Ashfield <bruce.ashfield@gmail.com>
Signed-off-by: Steve Sakoman <steve@sakoman.com>
---
 .../linux/linux-yocto-rt_5.4.bb               |  6 ++---
 .../linux/linux-yocto-tiny_5.4.bb             |  8 +++----
 meta/recipes-kernel/linux/linux-yocto_5.4.bb  | 22 +++++++++----------
 3 files changed, 18 insertions(+), 18 deletions(-)

diff --git a/meta/recipes-kernel/linux/linux-yocto-rt_5.4.bb b/meta/recipes-kernel/linux/linux-yocto-rt_5.4.bb
index 7926ddc3c5..9832de5880 100644
--- a/meta/recipes-kernel/linux/linux-yocto-rt_5.4.bb
+++ b/meta/recipes-kernel/linux/linux-yocto-rt_5.4.bb
@@ -11,13 +11,13 @@ python () {
         raise bb.parse.SkipRecipe("Set PREFERRED_PROVIDER_virtual/kernel to linux-yocto-rt to enable it")
 }
 
-SRCREV_machine ?= "66f69e8b3cc56e22c8b78f3141fd736fc1c5859b"
-SRCREV_meta ?= "dcbd44e70b6bc80a04cc92b625b1a3eaa2f78fc0"
+SRCREV_machine ?= "693f365a839705814228d4d7a9fb362285af3542"
+SRCREV_meta ?= "3ff7377107711b2670620aac2be36b3edefe7f37"
 
 SRC_URI = "git://git.yoctoproject.org/linux-yocto.git;branch=${KBRANCH};name=machine \
            git://git.yoctoproject.org/yocto-kernel-cache;type=kmeta;name=meta;branch=yocto-5.4;destsuffix=${KMETA}"
 
-LINUX_VERSION ?= "5.4.169"
+LINUX_VERSION ?= "5.4.170"
 
 LIC_FILES_CHKSUM = "file://COPYING;md5=bbea815ee2795b2f4230826c0c6b8814"
 
diff --git a/meta/recipes-kernel/linux/linux-yocto-tiny_5.4.bb b/meta/recipes-kernel/linux/linux-yocto-tiny_5.4.bb
index 60f13669e1..c5e6e16357 100644
--- a/meta/recipes-kernel/linux/linux-yocto-tiny_5.4.bb
+++ b/meta/recipes-kernel/linux/linux-yocto-tiny_5.4.bb
@@ -6,7 +6,7 @@ KCONFIG_MODE = "--allnoconfig"
 
 require recipes-kernel/linux/linux-yocto.inc
 
-LINUX_VERSION ?= "5.4.169"
+LINUX_VERSION ?= "5.4.170"
 LIC_FILES_CHKSUM = "file://COPYING;md5=bbea815ee2795b2f4230826c0c6b8814"
 
 DEPENDS += "${@bb.utils.contains('ARCH', 'x86', 'elfutils-native', '', d)}"
@@ -15,9 +15,9 @@ DEPENDS += "openssl-native util-linux-native"
 KMETA = "kernel-meta"
 KCONF_BSP_AUDIT_LEVEL = "2"
 
-SRCREV_machine_qemuarm ?= "092520553603d101c48aafd95aac45f5f455882a"
-SRCREV_machine ?= "d44538a3be2f25dc1c768d0ed31d18af18cc2aee"
-SRCREV_meta ?= "dcbd44e70b6bc80a04cc92b625b1a3eaa2f78fc0"
+SRCREV_machine_qemuarm ?= "f0f037abc011fc633c51f9557471babb368668f3"
+SRCREV_machine ?= "0c76d34c0744a8f3d8b4a41860fc9f12624b082a"
+SRCREV_meta ?= "3ff7377107711b2670620aac2be36b3edefe7f37"
 
 PV = "${LINUX_VERSION}+git${SRCPV}"
 
diff --git a/meta/recipes-kernel/linux/linux-yocto_5.4.bb b/meta/recipes-kernel/linux/linux-yocto_5.4.bb
index 0e8fe724e3..d7af5fe1cb 100644
--- a/meta/recipes-kernel/linux/linux-yocto_5.4.bb
+++ b/meta/recipes-kernel/linux/linux-yocto_5.4.bb
@@ -12,16 +12,16 @@ KBRANCH_qemux86  ?= "v5.4/standard/base"
 KBRANCH_qemux86-64 ?= "v5.4/standard/base"
 KBRANCH_qemumips64 ?= "v5.4/standard/mti-malta64"
 
-SRCREV_machine_qemuarm ?= "69471f4c5c895fe6ccef696800c7ef2bda3ad2fd"
-SRCREV_machine_qemuarm64 ?= "e0b9164ac4b0d53e7bd42bf1d2322eb5ce462d68"
-SRCREV_machine_qemumips ?= "7bf5ddb8e9ae1284cb4e02bed7f9429bec0b39c4"
-SRCREV_machine_qemuppc ?= "b0054e5e7451561a7c6a6d6a401395fbd0395801"
-SRCREV_machine_qemuriscv64 ?= "01fe83c50f9aeb4da7c7c7d63a6c7afea83216ef"
-SRCREV_machine_qemux86 ?= "01fe83c50f9aeb4da7c7c7d63a6c7afea83216ef"
-SRCREV_machine_qemux86-64 ?= "01fe83c50f9aeb4da7c7c7d63a6c7afea83216ef"
-SRCREV_machine_qemumips64 ?= "e8483ea124a1715790eba584ee2ad8aac1e15edf"
-SRCREV_machine ?= "01fe83c50f9aeb4da7c7c7d63a6c7afea83216ef"
-SRCREV_meta ?= "dcbd44e70b6bc80a04cc92b625b1a3eaa2f78fc0"
+SRCREV_machine_qemuarm ?= "2ee0677973f1c676d52c6864c0a227b8d0a91a3d"
+SRCREV_machine_qemuarm64 ?= "205b919a1a53a5c46ff432cfc7292cbf688f34ce"
+SRCREV_machine_qemumips ?= "ff59072d3f2b8189e65f1006357d003ef68ec03b"
+SRCREV_machine_qemuppc ?= "bd68bc38761902dea6a823853f6044f6688751ca"
+SRCREV_machine_qemuriscv64 ?= "d4f5a7cecc479dcfff63bd7e92507521956fb8b8"
+SRCREV_machine_qemux86 ?= "d4f5a7cecc479dcfff63bd7e92507521956fb8b8"
+SRCREV_machine_qemux86-64 ?= "d4f5a7cecc479dcfff63bd7e92507521956fb8b8"
+SRCREV_machine_qemumips64 ?= "8aa05337ebd7798187b81f2561de15f2074a5eca"
+SRCREV_machine ?= "d4f5a7cecc479dcfff63bd7e92507521956fb8b8"
+SRCREV_meta ?= "3ff7377107711b2670620aac2be36b3edefe7f37"
 
 # remap qemuarm to qemuarma15 for the 5.4 kernel
 # KMACHINE_qemuarm ?= "qemuarma15"
@@ -30,7 +30,7 @@ SRC_URI = "git://git.yoctoproject.org/linux-yocto.git;name=machine;branch=${KBRA
            git://git.yoctoproject.org/yocto-kernel-cache;type=kmeta;name=meta;branch=yocto-5.4;destsuffix=${KMETA}"
 
 LIC_FILES_CHKSUM = "file://COPYING;md5=bbea815ee2795b2f4230826c0c6b8814"
-LINUX_VERSION ?= "5.4.169"
+LINUX_VERSION ?= "5.4.170"
 
 DEPENDS += "${@bb.utils.contains('ARCH', 'x86', 'elfutils-native', '', d)}"
 DEPENDS += "openssl-native util-linux-native"
-- 
2.25.1


