Return-Path: <bruce.ashfield@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id DEBE4C0502E
	for <webhook@archiver.kernel.org>; Mon, 29 Aug 2022 01:53:02 +0000 (UTC)
Received: from mail-qt1-f171.google.com (mail-qt1-f171.google.com
 [209.85.160.171])
 by mx.groups.io with SMTP id smtpd.web09.65887.1661737980490443403
 for <openembedded-core@lists.openembedded.org>;
 Sun, 28 Aug 2022 18:53:00 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20210112 header.b=iSaX6Ffa;
 spf=pass (domain: gmail.com, ip: 209.85.160.171,
 mailfrom: bruce.ashfield@gmail.com)
Received: by mail-qt1-f171.google.com with SMTP id a22so2515199qtw.10
        for <openembedded-core@lists.openembedded.org>;
 Sun, 28 Aug 2022 18:53:00 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc;
        bh=qcBCJNRxbtsMniNy/EKrSG1ISkWmoBr4FgFwfdhb/B4=;
        b=iSaX6Ffa0hBG9d80WXNXlGHzzgmzHbC+CErvtUObCr1IW9Dbw96LwI3+2rJINpKKht
         QzHxQOyNqPVQj7YN/6z3KeZ64kqTa6kyJkfZSfL0D6K9a9P4fQTX1GlXkgQ4LOTixNFm
         GQpRlB9gM8f8jgM2RXL79TJ/1RmURojEenLhebM13+YQwi5b7Nzlkq/8SZ/dQl21XltV
         avStuWKgaLE8L57/hbed1DFAKzSXD9esfar3qcKjKmePmTtXOQqn3SuHLcVCVteZ3riD
         UvJwlSLiUYZZzS0re4IPshTpChfIP9AzR2O1nMhDhmO+mG/6t6KJE04byT0PGFF+YWYP
         B1zg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc;
        bh=qcBCJNRxbtsMniNy/EKrSG1ISkWmoBr4FgFwfdhb/B4=;
        b=opRLcavAFACOWX9ZkNmun4IR9j/gnhWMrZhzR/FacoxaE8qahNK0sbdAOn+Ydgmu9E
         nnWdjRBoFhfqhFbRV2XbSuwv1qbpmKY6Eu7oL2xCVwC8qn3Loa2Uxd0pKAQiF+d+r2su
         OSigAemF3tXVG3xYR5+EAf150PuHT1byWmCYFgq/b/HouOeGn/JOee5pYSOapz0XKJWF
         rfpZfGyZhnYcMHKWyehsql9ROFkYYjs0cBOV5vJRUMtTshL7fip0TWMvApKFDd3lV3WU
         ZnMBuYU4R1M/Q11GhetFb9UwZK+vusYScKu34GK4UOnKZv/5Yf4IUs9nisflW0yGjh8T
         ivJw==
X-Gm-Message-State: ACgBeo0KL8YZtIwxtP7zoPuo49aCjzNYpruvdUkwNTyqpFehT7gxhCoY
	LxTfAXJav0KS37GG9L2BIxQv3IMpnQI=
X-Google-Smtp-Source: 
 AA6agR7viKe0coUIuSvfQl/YBUjWpHSxHzHzKcBkMezAzmin73C0T6HZsreloJOuZS3C2psUJIba2g==
X-Received: by 2002:ac8:7d0c:0:b0:344:6104:eab5 with SMTP id
 g12-20020ac87d0c000000b003446104eab5mr8657672qtb.272.1661737979412;
        Sun, 28 Aug 2022 18:52:59 -0700 (PDT)
Received: from build.lan ([173.34.88.218])
        by smtp.gmail.com with ESMTPSA id
 h8-20020ac85488000000b00342f8d4d0basm2671166qtq.43.2022.08.28.18.52.58
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 28 Aug 2022 18:52:58 -0700 (PDT)
From: bruce.ashfield@gmail.com
To: steve@sakoman.com
Cc: openembedded-core@lists.openembedded.org
Subject: [PATCH][dunfell] linux-yocto/5.4: update to v5.4.210
Date: Sun, 28 Aug 2022 21:52:57 -0400
Message-Id: <20220829015257.63344-1-bruce.ashfield@gmail.com>
X-Mailer: git-send-email 2.19.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Mon, 29 Aug 2022 01:53:02 -0000
X-Groupsio-URL: 
 https://lists.openembedded.org/g/openembedded-core/message/170002

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
2.19.1


