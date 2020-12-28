Received: from mail-pj1-f43.google.com (mail-pj1-f43.google.com [209.85.216.43])
 by mx.groups.io with SMTP id smtpd.web10.4052.1609193784995550803
 for <openembedded-core@lists.openembedded.org>;
 Mon, 28 Dec 2020 14:16:25 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@sakoman-com.20150623.gappssmtp.com header.s=20150623 header.b=gDfw5mL1;
 spf=softfail (domain: sakoman.com, ip: 209.85.216.43, mailfrom: steve@sakoman.com)
Received: by mail-pj1-f43.google.com with SMTP id iq13so361291pjb.3
        for <openembedded-core@lists.openembedded.org>; Mon, 28 Dec 2020 14:16:24 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=sakoman-com.20150623.gappssmtp.com; s=20150623;
        h=from:to:subject:date:message-id:in-reply-to:references;
        bh=HHJJK8yVq2kUVXGgAh3O2uA3bbNDCxV4XiAs0RdeDB4=;
        b=gDfw5mL13rGx16+bnVuLtXNgA3/srnhcHrDQe0WvUt4zhBKfqvbZUuQIhmK4FIgAYH
         wIkDPNDidDQGzqHCaKNl3RK9WxpqIAmzoFJhlbqxgsvA9HMLwA4q1fj+CGZ9zRkdXL3d
         Rgej93WNqlETZ81IBbi92RbrLqC8bh61E0PJvMnN6oPxVFuocQ4S7T+MhV4lI5B7nPB5
         l3qzVc8gso/UtX2QGGroR+T9enD6oppXCQBn9WKQYX1LVxUXfVaKYUAA8xadJwxLjIAU
         gfE/MYXqJ6vx5fQ85oAoLY97hl8VzCvGFj4RbE1+rr+O7fFJj9m/0KKx/8JdyNLgXaiI
         PMjQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:subject:date:message-id:in-reply-to
         :references;
        bh=HHJJK8yVq2kUVXGgAh3O2uA3bbNDCxV4XiAs0RdeDB4=;
        b=sJQf9kdiJgOYUcSOg+X4mU3AseBGPAwBGdRkuFaQbYow+u8cQbqPkuBKqq9l9QLNtp
         pX5KVfFWkMCHWE7WN4kCOs9VaaORUnyX00wWbWNnVCPTiyGsYQHn5oCdh9g9a27ZCuV9
         SjK+J19n1+g81WKLrJWX0NZaE6jovVIWiZ5dREF0iAdUP5wGWptuz2vY+Ejrmt5po0R1
         KNSzZIDG366jYUA32esjvh43jjF+r0DslG68Ya8gYPA2+1CTIlXBhHwH7OXt3wqHRar1
         x6zVAjHiLWrBZcvKnJni43uphRQT53wqSLNY0YYgIGlKc/Ru2IAZyXWt7/FrT92PZi1+
         mXYw==
X-Gm-Message-State: AOAM53111sONKx2DJmhFH5vvg36A/kucsrCufEsPQo+M0NLuzxxkpVkA
	BPexKHz9GTkcitwIajy+vQAXV4waiO8MzUHlGSQ=
X-Google-Smtp-Source: ABdhPJz0+6guPEBcvR1sPci5bqFQO0FMGQt4FNJMN2HvzCR/rE5uItngRBFdvxGJRlGhb5r7x9ryGA==
X-Received: by 2002:a17:902:6b87:b029:dc:3402:18af with SMTP id p7-20020a1709026b87b02900dc340218afmr21402879plk.29.1609193784128;
        Mon, 28 Dec 2020 14:16:24 -0800 (PST)
Return-Path: <steve@sakoman.com>
Received: from octo.router0800d9.com (rrcs-66-91-142-162.west.biz.rr.com. [66.91.142.162])
        by smtp.gmail.com with ESMTPSA id o32sm41425455pgm.10.2020.12.28.14.16.22
        for <openembedded-core@lists.openembedded.org>
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 28 Dec 2020 14:16:23 -0800 (PST)
From: "Steve Sakoman" <steve@sakoman.com>
To: openembedded-core@lists.openembedded.org
Subject: [OE-core][dunfell 06/17] linux-yocto/5.4: update to v5.4.83
Date: Mon, 28 Dec 2020 12:15:43 -1000
Message-Id: <cae43bcc485eb358d95f0f2308f6cbed95585099.1609193554.git.steve@sakoman.com>
X-Mailer: git-send-email 2.17.1
In-Reply-To: <cover.1609193554.git.steve@sakoman.com>
References: <cover.1609193554.git.steve@sakoman.com>

From: Bruce Ashfield <bruce.ashfield@gmail.com>

Updating linux-yocto/5.4 to the latest korg -stable release that comprises
the following commits:

    2bff021f53b2 Linux 5.4.83
    66a08d1d3bd8 Revert "geneve: pull IP header before ECN decapsulation"
    ed58971beb47 x86/insn-eval: Use new for_each_insn_prefix() macro to loop over prefixes bytes
    423e1b08ce5c netfilter: nftables_offload: set address type in control dissector
    13995410b616 netfilter: nf_tables: avoid false-postive lockdep splat
    f25fa580f99e Input: i8042 - fix error return code in i8042_setup_aux()
    b9df537e5fcd dm writecache: remove BUG() and fail gracefully instead
    8e2c50315f00 i2c: qup: Fix error return code in qup_i2c_bam_schedule_desc()
    1015eefe10e2 rtw88: debug: Fix uninitialized memory in debugfs code
    af699e99efdc ASoC: wm_adsp: fix error return code in wm_adsp_load()
    fdc1416c2199 tipc: fix a deadlock when flushing scheduled work
    6410c7f53698 netfilter: ipset: prevent uninit-value in hash_ip6_add
    cd928d387b0b gfs2: check for empty rgrp tree in gfs2_ri_update
    c358e7e99dda can: af_can: can_rx_unregister(): remove WARN() statement from list operation sanity check
    867fbf2bb739 lib/syscall: fix syscall registers retrieval on 32-bit platforms
    f68f5bdfefd9 tracing: Fix userstacktrace option for instances
    dbbf6cdab503 iommu/amd: Set DTE[IntTabLen] to represent 512 IRTEs
    d863a4ad3cc5 spi: bcm2835: Release the DMA channel if probe fails after dma_init
    83d5121c3b0f i2c: imx: Check for I2SR_IAL after every byte
    83366a7b2d34 i2c: imx: Fix reset of I2SR_IAL flag
    b0d4fa10bfcc speakup: Reject setting the speakup line discipline outside of speakup
    a2a163f70bdf mm/swapfile: do not sleep with a spin lock held
    4870004d30e3 mm: list_lru: set shrinker map bit when child nr_items is not zero
    42ccf9d14ede coredump: fix core_pattern parse error
    579c977253b6 x86/uprobes: Do not use prefixes.nbytes when looping over prefixes.bytes
    002d2c4a3f66 dm: remove invalid sparse __acquires and __releases annotations
    3b02d67064ff dm: fix bug with RCU locking in dm_blk_report_zones
    7eb514087cdd powerpc/pseries: Pass MSI affinity to irq_create_mapping()
    1f72986fc9df genirq/irqdomain: Add an irq_create_mapping_affinity() function
    6466119452a8 powerpc/64s/powernv: Fix memory corruption when saving SLB entries on MCE
    8a758e97b707 dm writecache: fix the maximum number of arguments
    3f680c5996f9 scsi: mpt3sas: Fix ioctl timeout
    812dff6a5250 drm/i915/gt: Program mocs:63 for cache eviction on gen9
    b92738c4f9d3 thunderbolt: Fix use-after-free in remove_unplugged_switch()
    ed201cb54d6f i2c: imx: Don't generate STOP condition if arbitration has been lost
    73948ab9f2df cifs: fix potential use-after-free in cifs_echo_request()
    a0ca8cb2f707 cifs: allow syscalls to be restarted in __smb_send_rqst()
    205740ca4a4d ftrace: Fix updating FTRACE_FL_TRAMP
    d18379bbb856 ALSA: hda/generic: Add option to enforce preferred_dacs pairs
    f28666e00a44 ALSA: hda/realtek - Add new codec supported for ALC897
    c57556f1798b ALSA: hda/realtek: Enable headset of ASUS UX482EG & B9400CEA with ALC294
    f3fc36614438 ALSA: hda/realtek: Add mute LED quirk to yet another HP x360 model
    de41002d2e0e ALSA: hda/realtek: Fix bass speaker DAC assignment on Asus Zephyrus G14
    35ee9ac51328 tty: Fix ->session locking
    c536ecd48560 tty: Fix ->pgrp locking in tiocspgrp()
    013d2d046532 USB: serial: option: fix Quectel BG96 matching
    3cf949422734 USB: serial: option: add support for Thales Cinterion EXS82
    0f8af69bec41 USB: serial: option: add Fibocom NL668 variants
    250930f60c33 USB: serial: ch341: sort device-id entries
    25b90f887dd4 USB: serial: ch341: add new Product ID for CH341A
    f0990c21af7d USB: serial: kl5kusb105: fix memleak on open
    8954745718e7 usb: gadget: f_fs: Use local copy of descriptors for userspace copy
    4a77729b25d6 Partially revert bpf: Zero-fill re-used per-cpu map element
    512b18eec5c2 pinctrl: baytrail: Fix pin being driven low for a while on gpiod_get(..., GPIOD_OUT_HIGH)
    e90d11d0be10 pinctrl: baytrail: Replace WARN with dev_info_once when setting direct-irq pin to output

Signed-off-by: Bruce Ashfield <bruce.ashfield@gmail.com>
Signed-off-by: Richard Purdie <richard.purdie@linuxfoundation.org>
(cherry picked from commit 87c3841a7b4b9a440bd9aea91dea2a7161ab22be)
Signed-off-by: Steve Sakoman <steve@sakoman.com>
---
 .../linux/linux-yocto-rt_5.4.bb               |  6 ++---
 .../linux/linux-yocto-tiny_5.4.bb             |  8 +++----
 meta/recipes-kernel/linux/linux-yocto_5.4.bb  | 22 +++++++++----------
 3 files changed, 18 insertions(+), 18 deletions(-)

diff --git a/meta/recipes-kernel/linux/linux-yocto-rt_5.4.bb b/meta/recipes-kernel/linux/linux-yocto-rt_5.4.bb
index fb5bff2371..758ab8bfb5 100644
--- a/meta/recipes-kernel/linux/linux-yocto-rt_5.4.bb
+++ b/meta/recipes-kernel/linux/linux-yocto-rt_5.4.bb
@@ -11,13 +11,13 @@ python () {
         raise bb.parse.SkipRecipe("Set PREFERRED_PROVIDER_virtual/kernel to linux-yocto-rt to enable it")
 }
 
-SRCREV_machine ?= "65a53ac9134b9736ae67afc5fb02049f4908d8e3"
-SRCREV_meta ?= "104cf3e89371ac8971fef69f55a6c788c46ec65a"
+SRCREV_machine ?= "7bc8ae3fc04fdc06192d39d725cb18d4c0b78d9f"
+SRCREV_meta ?= "cd9826707f887241a661ea886cfa19f8d282438c"
 
 SRC_URI = "git://git.yoctoproject.org/linux-yocto.git;branch=${KBRANCH};name=machine \
            git://git.yoctoproject.org/yocto-kernel-cache;type=kmeta;name=meta;branch=yocto-5.4;destsuffix=${KMETA}"
 
-LINUX_VERSION ?= "5.4.82"
+LINUX_VERSION ?= "5.4.83"
 
 LIC_FILES_CHKSUM = "file://COPYING;md5=bbea815ee2795b2f4230826c0c6b8814"
 
diff --git a/meta/recipes-kernel/linux/linux-yocto-tiny_5.4.bb b/meta/recipes-kernel/linux/linux-yocto-tiny_5.4.bb
index 01de087128..b06db10f9f 100644
--- a/meta/recipes-kernel/linux/linux-yocto-tiny_5.4.bb
+++ b/meta/recipes-kernel/linux/linux-yocto-tiny_5.4.bb
@@ -6,7 +6,7 @@ KCONFIG_MODE = "--allnoconfig"
 
 require recipes-kernel/linux/linux-yocto.inc
 
-LINUX_VERSION ?= "5.4.82"
+LINUX_VERSION ?= "5.4.83"
 LIC_FILES_CHKSUM = "file://COPYING;md5=bbea815ee2795b2f4230826c0c6b8814"
 
 DEPENDS += "${@bb.utils.contains('ARCH', 'x86', 'elfutils-native', '', d)}"
@@ -15,9 +15,9 @@ DEPENDS += "openssl-native util-linux-native"
 KMETA = "kernel-meta"
 KCONF_BSP_AUDIT_LEVEL = "2"
 
-SRCREV_machine_qemuarm ?= "0c335c490cfe932664f2e40c791efa387f769df5"
-SRCREV_machine ?= "53e9ea9bf3868442be0b1aef4e7624ec8143f10b"
-SRCREV_meta ?= "104cf3e89371ac8971fef69f55a6c788c46ec65a"
+SRCREV_machine_qemuarm ?= "2b6db4fbe53a1986c0249bc663d8ce7d99cbf19c"
+SRCREV_machine ?= "21f1b92bddf5f6678f2c28da8d1a8a8160e39cf1"
+SRCREV_meta ?= "cd9826707f887241a661ea886cfa19f8d282438c"
 
 PV = "${LINUX_VERSION}+git${SRCPV}"
 
diff --git a/meta/recipes-kernel/linux/linux-yocto_5.4.bb b/meta/recipes-kernel/linux/linux-yocto_5.4.bb
index b8aa937ca5..880d9c9b99 100644
--- a/meta/recipes-kernel/linux/linux-yocto_5.4.bb
+++ b/meta/recipes-kernel/linux/linux-yocto_5.4.bb
@@ -12,16 +12,16 @@ KBRANCH_qemux86  ?= "v5.4/standard/base"
 KBRANCH_qemux86-64 ?= "v5.4/standard/base"
 KBRANCH_qemumips64 ?= "v5.4/standard/mti-malta64"
 
-SRCREV_machine_qemuarm ?= "844ffab23aca849f9f4cf89866229e079fc7aa11"
-SRCREV_machine_qemuarm64 ?= "53e9ea9bf3868442be0b1aef4e7624ec8143f10b"
-SRCREV_machine_qemumips ?= "7937b24594ecce307971a3b2871fc1286055d0c4"
-SRCREV_machine_qemuppc ?= "53e9ea9bf3868442be0b1aef4e7624ec8143f10b"
-SRCREV_machine_qemuriscv64 ?= "53e9ea9bf3868442be0b1aef4e7624ec8143f10b"
-SRCREV_machine_qemux86 ?= "53e9ea9bf3868442be0b1aef4e7624ec8143f10b"
-SRCREV_machine_qemux86-64 ?= "53e9ea9bf3868442be0b1aef4e7624ec8143f10b"
-SRCREV_machine_qemumips64 ?= "0ba329b53891de44e4ef8d2ca8a948e1c6a5866c"
-SRCREV_machine ?= "53e9ea9bf3868442be0b1aef4e7624ec8143f10b"
-SRCREV_meta ?= "104cf3e89371ac8971fef69f55a6c788c46ec65a"
+SRCREV_machine_qemuarm ?= "78231a4abb434782470d272690b7792b7dc1c1c6"
+SRCREV_machine_qemuarm64 ?= "21f1b92bddf5f6678f2c28da8d1a8a8160e39cf1"
+SRCREV_machine_qemumips ?= "adca343488d22623848ba206071cc0fa67b79b6a"
+SRCREV_machine_qemuppc ?= "21f1b92bddf5f6678f2c28da8d1a8a8160e39cf1"
+SRCREV_machine_qemuriscv64 ?= "21f1b92bddf5f6678f2c28da8d1a8a8160e39cf1"
+SRCREV_machine_qemux86 ?= "21f1b92bddf5f6678f2c28da8d1a8a8160e39cf1"
+SRCREV_machine_qemux86-64 ?= "21f1b92bddf5f6678f2c28da8d1a8a8160e39cf1"
+SRCREV_machine_qemumips64 ?= "75c7340de480587c3a6650b46be7b1a2f71501a9"
+SRCREV_machine ?= "21f1b92bddf5f6678f2c28da8d1a8a8160e39cf1"
+SRCREV_meta ?= "cd9826707f887241a661ea886cfa19f8d282438c"
 
 # remap qemuarm to qemuarma15 for the 5.4 kernel
 # KMACHINE_qemuarm ?= "qemuarma15"
@@ -30,7 +30,7 @@ SRC_URI = "git://git.yoctoproject.org/linux-yocto.git;name=machine;branch=${KBRA
            git://git.yoctoproject.org/yocto-kernel-cache;type=kmeta;name=meta;branch=yocto-5.4;destsuffix=${KMETA}"
 
 LIC_FILES_CHKSUM = "file://COPYING;md5=bbea815ee2795b2f4230826c0c6b8814"
-LINUX_VERSION ?= "5.4.82"
+LINUX_VERSION ?= "5.4.83"
 
 DEPENDS += "${@bb.utils.contains('ARCH', 'x86', 'elfutils-native', '', d)}"
 DEPENDS += "openssl-native util-linux-native"
-- 
2.17.1

