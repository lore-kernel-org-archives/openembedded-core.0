Return-Path: <steve@sakoman.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id E34C0C0502C
	for <webhook@archiver.kernel.org>; Mon, 29 Aug 2022 21:03:19 +0000 (UTC)
Received: from mail-pg1-f175.google.com (mail-pg1-f175.google.com
 [209.85.215.175])
 by mx.groups.io with SMTP id smtpd.web08.3692.1661806991654758714
 for <openembedded-core@lists.openembedded.org>;
 Mon, 29 Aug 2022 14:03:11 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@sakoman-com.20210112.gappssmtp.com header.s=20210112
 header.b=OS3VAmxu;
 spf=softfail (domain: sakoman.com, ip: 209.85.215.175,
 mailfrom: steve@sakoman.com)
Received: by mail-pg1-f175.google.com with SMTP id 73so451737pga.1
        for <openembedded-core@lists.openembedded.org>;
 Mon, 29 Aug 2022 14:03:11 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=sakoman-com.20210112.gappssmtp.com; s=20210112;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:from:to:cc;
        bh=jbYijZTFbQ+fa+8Xq5N3cYvMz2s62i5inAv0om/U/k4=;
        b=OS3VAmxuk1aIVHppuMBOQKJ7gYImzypNinJE+xEmJ2VkmWm/KIdrULLrftRXIlb6fU
         CYfS1Xtae5JDW8anWmpvyRrFUxTSpzNjtF558BWbYSYsEzPpEge4fZDr/RAqsAKc3Ej2
         JPo+e48usewg4K/uSqZKYv3+P2ZCicm5ujC3o8WvUfn+kZGrUNfSPxwqtoGX84qBHYME
         B94LWsja/7+3HTj3npr1T86B6jIdWS2wV0agYoEyV+DGT3fbKZShrY8HY0y/VUn1LFZU
         UeDDgMXByM61+GNht6VyU1NN/X8GbmXiqDlsvec92DUz5IwMm1+Xp/yM73Bu0xFIVv+n
         Z+cQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:x-gm-message-state:from:to:cc;
        bh=jbYijZTFbQ+fa+8Xq5N3cYvMz2s62i5inAv0om/U/k4=;
        b=q32UolRA+1nO4/M/TE6gUrJ07EnePz4x2IKSOaDYy3iqLvuNVqCPYrI/PhXrIv0HiA
         YscFApyjAiIU6nI+qs5Oiy5bS8RuwKx6bIjSGAghfTV+el3tRkqN7vpy6pk7CC1wZlOH
         JVNV/D5YWHldScb1f1hTrojPQmCbVV6NTABSCd44dwgq9rXGWOPgloZrrIfHrxLHVgSn
         iGtBTeAHzuP31aZOV49QCNF2BUZuZxDONzGLNXdVmjvG/Jd96LnGEoTW1PuVV6ojr9wh
         RDBvXDt31hBetGnS+Fpg30jumndS5PVFB+Z1l+I12Srx2QDmkDegL/c79SbknLSRQ6CJ
         0idQ==
X-Gm-Message-State: ACgBeo0Q8n9P2AmtVsnhvdDvTQlsZarKVSo96CVwZoduMwoBolUQ4SZI
	CjMHd5h6EVk7txGZ/cn3F8H6Xjnl9tVYhb7k
X-Google-Smtp-Source: 
 AA6agR5aMDZDRFUSrvhQ0iLD07JPlV4B5c7fTTVSYujUrarCXjnkX0gwxFYEFSzDyS9wfGa/U7qM5w==
X-Received: by 2002:a63:8bc9:0:b0:42b:2375:79b3 with SMTP id
 j192-20020a638bc9000000b0042b237579b3mr14999923pge.207.1661806990541;
        Mon, 29 Aug 2022 14:03:10 -0700 (PDT)
Received: from hexa.router0800d9.com (dhcp-72-253-6-214.hawaiiantel.net.
 [72.253.6.214])
        by smtp.gmail.com with ESMTPSA id
 q15-20020a17090311cf00b0016eede528b4sm8058957plh.61.2022.08.29.14.03.09
        for <openembedded-core@lists.openembedded.org>
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 29 Aug 2022 14:03:10 -0700 (PDT)
From: Steve Sakoman <steve@sakoman.com>
To: openembedded-core@lists.openembedded.org
Subject: [OE-core][dunfell 12/14] linux-yocto/5.4: update to v5.4.210
Date: Mon, 29 Aug 2022 11:02:31 -1000
Message-Id: 
 <2663435831c0ef953fb7fe6c883f42cf0c86ae43.1661806803.git.steve@sakoman.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <cover.1661806803.git.steve@sakoman.com>
References: <cover.1661806803.git.steve@sakoman.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Mon, 29 Aug 2022 21:03:19 -0000
X-Groupsio-URL: 
 https://lists.openembedded.org/g/openembedded-core/message/170037

From: Bruce Ashfield <bruce.ashfield@gmail.com>

Updating  to the latest korg -stable release that comprises
the following commits:

    de0cd3ea700d Linux 5.4.210
    b58882c69f66 x86/speculation: Add LFENCE to RSB fill sequence
    f2f41ef0352d x86/speculation: Add RSB VM Exit protections
    3a0ef79c6abe macintosh/adb: fix oob read in do_adb_query() function
    54e1abbe8560 media: v4l2-mem2mem: Apply DST_QUEUE_OFF_BASE on MMAP buffers across ioctls
    17c2356e467f selftests: KVM: Handle compiler optimizations in ucall
    170465715a60 KVM: Don't null dereference ops->destroy
    6098562ed9df selftests/bpf: Fix "dubious pointer arithmetic" test
    6a9b3f0f3bad selftests/bpf: Fix test_align verifier log patterns
    9d6f67365d9c bpf: Test_verifier, #70 error message updates for 32-bit right shift
    751f05bc6f95 selftests/bpf: Extend verifier and bpf_sock tests for dst_port loads
    7c1134c7da99 bpf: Verifer, adjust_scalar_min_max_vals to always call update_reg_bounds()
    a8ba72bbeda5 ACPI: APEI: Better fix to avoid spamming the console with old error logs
    fa829bd4af43 ACPI: video: Shortening quirk list by identifying Clevo by board_name only
    8ed6e5c5e23c ACPI: video: Force backlight native for some TongFang devices
    828f4c31684d thermal: Fix NULL pointer dereferences in of_thermal_ functions

Signed-off-by: Bruce Ashfield <bruce.ashfield@gmail.com>
Signed-off-by: Steve Sakoman <steve@sakoman.com>
---
 .../linux/linux-yocto-rt_5.4.bb               |  6 ++---
 .../linux/linux-yocto-tiny_5.4.bb             |  8 +++----
 meta/recipes-kernel/linux/linux-yocto_5.4.bb  | 22 +++++++++----------
 3 files changed, 18 insertions(+), 18 deletions(-)

diff --git a/meta/recipes-kernel/linux/linux-yocto-rt_5.4.bb b/meta/recipes-kernel/linux/linux-yocto-rt_5.4.bb
index 8e8fbb5b12..7f766090fb 100644
--- a/meta/recipes-kernel/linux/linux-yocto-rt_5.4.bb
+++ b/meta/recipes-kernel/linux/linux-yocto-rt_5.4.bb
@@ -11,13 +11,13 @@ python () {
         raise bb.parse.SkipRecipe("Set PREFERRED_PROVIDER_virtual/kernel to linux-yocto-rt to enable it")
 }
 
-SRCREV_machine ?= "f6c9d6db383201a730e8d638995eae82acd4d8e7"
-SRCREV_meta ?= "028688aaad2b64e353d771ba5505a8666cd01696"
+SRCREV_machine ?= "c3d41d0285529bdd90b4625dc5caaa9dcecf7c64"
+SRCREV_meta ?= "e1682f82a101d7b4561a9246010f1535fc6cf583"
 
 SRC_URI = "git://git.yoctoproject.org/linux-yocto.git;branch=${KBRANCH};name=machine \
            git://git.yoctoproject.org/yocto-kernel-cache;type=kmeta;name=meta;branch=yocto-5.4;destsuffix=${KMETA}"
 
-LINUX_VERSION ?= "5.4.209"
+LINUX_VERSION ?= "5.4.210"
 
 LIC_FILES_CHKSUM = "file://COPYING;md5=bbea815ee2795b2f4230826c0c6b8814"
 
diff --git a/meta/recipes-kernel/linux/linux-yocto-tiny_5.4.bb b/meta/recipes-kernel/linux/linux-yocto-tiny_5.4.bb
index cdccebeb1c..81e10b240c 100644
--- a/meta/recipes-kernel/linux/linux-yocto-tiny_5.4.bb
+++ b/meta/recipes-kernel/linux/linux-yocto-tiny_5.4.bb
@@ -6,7 +6,7 @@ KCONFIG_MODE = "--allnoconfig"
 
 require recipes-kernel/linux/linux-yocto.inc
 
-LINUX_VERSION ?= "5.4.209"
+LINUX_VERSION ?= "5.4.210"
 LIC_FILES_CHKSUM = "file://COPYING;md5=bbea815ee2795b2f4230826c0c6b8814"
 
 DEPENDS += "${@bb.utils.contains('ARCH', 'x86', 'elfutils-native', '', d)}"
@@ -15,9 +15,9 @@ DEPENDS += "openssl-native util-linux-native"
 KMETA = "kernel-meta"
 KCONF_BSP_AUDIT_LEVEL = "2"
 
-SRCREV_machine_qemuarm ?= "8f087017ff03465fa8d318c06a7e4e072c533daf"
-SRCREV_machine ?= "a4b7263158de8713dc85c5171aed99e3424a9f7c"
-SRCREV_meta ?= "028688aaad2b64e353d771ba5505a8666cd01696"
+SRCREV_machine_qemuarm ?= "caaa7fd55f05c104ef33d0d01d8fb64c72de3f9b"
+SRCREV_machine ?= "d9ba497c67cb9905a8947d92c8b4a469309b354e"
+SRCREV_meta ?= "e1682f82a101d7b4561a9246010f1535fc6cf583"
 
 PV = "${LINUX_VERSION}+git${SRCPV}"
 
diff --git a/meta/recipes-kernel/linux/linux-yocto_5.4.bb b/meta/recipes-kernel/linux/linux-yocto_5.4.bb
index 0f597fc3d6..876aa2f16d 100644
--- a/meta/recipes-kernel/linux/linux-yocto_5.4.bb
+++ b/meta/recipes-kernel/linux/linux-yocto_5.4.bb
@@ -12,16 +12,16 @@ KBRANCH_qemux86  ?= "v5.4/standard/base"
 KBRANCH_qemux86-64 ?= "v5.4/standard/base"
 KBRANCH_qemumips64 ?= "v5.4/standard/mti-malta64"
 
-SRCREV_machine_qemuarm ?= "4fefb5a57ecb9bc5c6aab38319f773b02c894e6b"
-SRCREV_machine_qemuarm64 ?= "407b5fa877ca8993a405542fa4c3d73584e8ea98"
-SRCREV_machine_qemumips ?= "1bfe5d39c9f954f0ac2480115f4750f39500d4f4"
-SRCREV_machine_qemuppc ?= "753def987b630ed41686223b5dc252436757e893"
-SRCREV_machine_qemuriscv64 ?= "90d5f03a7c79ccd5c02e0579049d22cf2686da9b"
-SRCREV_machine_qemux86 ?= "90d5f03a7c79ccd5c02e0579049d22cf2686da9b"
-SRCREV_machine_qemux86-64 ?= "90d5f03a7c79ccd5c02e0579049d22cf2686da9b"
-SRCREV_machine_qemumips64 ?= "b391bfc877fe8ae41e579ffd4bcd814b4ad438ea"
-SRCREV_machine ?= "90d5f03a7c79ccd5c02e0579049d22cf2686da9b"
-SRCREV_meta ?= "028688aaad2b64e353d771ba5505a8666cd01696"
+SRCREV_machine_qemuarm ?= "bccceefd95fc53e9b7c84f92401e5a660ded553c"
+SRCREV_machine_qemuarm64 ?= "4377f280ff917c050be6cf135fd3e371fdf5b2f2"
+SRCREV_machine_qemumips ?= "6ec4e71fdc85eab33422225750ad0eb3767e84a9"
+SRCREV_machine_qemuppc ?= "d03ef50c2e8d8508dc57369c7943bce6ddf1cfdf"
+SRCREV_machine_qemuriscv64 ?= "588ad034d1610fd31e575fff588e386cc672f972"
+SRCREV_machine_qemux86 ?= "588ad034d1610fd31e575fff588e386cc672f972"
+SRCREV_machine_qemux86-64 ?= "588ad034d1610fd31e575fff588e386cc672f972"
+SRCREV_machine_qemumips64 ?= "4a033c21edd6d4f5e1e9675cdde70e29f6346dbd"
+SRCREV_machine ?= "588ad034d1610fd31e575fff588e386cc672f972"
+SRCREV_meta ?= "e1682f82a101d7b4561a9246010f1535fc6cf583"
 
 # remap qemuarm to qemuarma15 for the 5.4 kernel
 # KMACHINE_qemuarm ?= "qemuarma15"
@@ -30,7 +30,7 @@ SRC_URI = "git://git.yoctoproject.org/linux-yocto.git;name=machine;branch=${KBRA
            git://git.yoctoproject.org/yocto-kernel-cache;type=kmeta;name=meta;branch=yocto-5.4;destsuffix=${KMETA}"
 
 LIC_FILES_CHKSUM = "file://COPYING;md5=bbea815ee2795b2f4230826c0c6b8814"
-LINUX_VERSION ?= "5.4.209"
+LINUX_VERSION ?= "5.4.210"
 
 DEPENDS += "${@bb.utils.contains('ARCH', 'x86', 'elfutils-native', '', d)}"
 DEPENDS += "openssl-native util-linux-native"
-- 
2.25.1


