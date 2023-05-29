Return-Path: <bruce.ashfield@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 3F7D5C7EE2C
	for <webhook@archiver.kernel.org>; Mon, 29 May 2023 16:47:25 +0000 (UTC)
Received: from mail-qk1-f178.google.com (mail-qk1-f178.google.com [209.85.222.178])
 by mx.groups.io with SMTP id smtpd.web10.53943.1685378839461115632
 for <openembedded-core@lists.openembedded.org>;
 Mon, 29 May 2023 09:47:19 -0700
Authentication-Results: mx.groups.io;
 dkim=fail reason="signature has expired" header.i=@gmail.com header.s=20221208 header.b=Aobp8UAf;
 spf=pass (domain: gmail.com, ip: 209.85.222.178, mailfrom: bruce.ashfield@gmail.com)
Received: by mail-qk1-f178.google.com with SMTP id af79cd13be357-75b076babc3so198990585a.3
        for <openembedded-core@lists.openembedded.org>; Mon, 29 May 2023 09:47:19 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20221208; t=1685378838; x=1687970838;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=R515opWcjRGqGujEa5ZlDvP/5jD4MW+MfG4PLTbHVTQ=;
        b=Aobp8UAfatJIuliQ7962qX4Xh59RqJIsk9SFacURHJOXj7k8ckZTFQElPguWasyZOC
         esINgLZo/gQoD1m67mEfa/goeoS11C1xM73G1Ee9intA5s5aeDIOypFD6gLfsz4STJJl
         +Ie68QzMrRm5l/jS629eTYC83Bb5CENnkuYd6+srRpU6HDzKZWXCY52BZ6HNgsbV7DQM
         W9qaHJ1hZhb7iAItn1TBTop8tghCYeTXgR8cTVK55k4LvcH1XZET4pNwbx0I6Pp3BUYb
         uTSP+IlcBW1U8QTAYb+WDcRilNm8ElzPz/OE4tmbAi5S4P8PNhy2PDp78aCiDqQyxzbK
         DN9A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1685378838; x=1687970838;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=R515opWcjRGqGujEa5ZlDvP/5jD4MW+MfG4PLTbHVTQ=;
        b=TGMG79sg2iYzPDgzi/gpb4qZn76wOiIAUZchpP6A476c2bJ5NnYrPlU/V8a/M2szTi
         UpBBqTYi8sonfBQ8flHIg2G53C75Qc92kY9Jk9bvRhk6yk3V+CRIZzGC04ZE6iMkx/kJ
         /OnjFPXWGHUe1nchF+F2iUzt3BQ0oT6HLfEUpd87sQzGRafcRPyKctsv+XN3szUY17VH
         VhtK05bgxKrl8DEtYeW1/ztYoWsQO/cbR80V8UsG1KqZbQ6QXgnFiZhkv84YTESdRm8w
         n2ydWdMt+9IoPnc4y1aB2XiNHsdvOh9u8CbPZISimP3HRRSP1l7Mfy6JWY+0p9vxqhOe
         9PdQ==
X-Gm-Message-State: AC+VfDwyAHfCeQHhDPpU2UYI4YBAK6LkxQ1KEsRuFFoaFVjv+VrdY+fj
	w78Xi7IpVIhG/a7I3ZlCn3kTqx0/EgyWIQ==
X-Google-Smtp-Source: ACHHUZ6wJO2g9G/wLDAH7laNQXKDz0n2aFOVpYQcyDyAIkNMBfJDgMfK98l58Kx1r8juLqlLKKpkzA==
X-Received: by 2002:a05:620a:2787:b0:75b:23a1:3673 with SMTP id g7-20020a05620a278700b0075b23a13673mr8084889qkp.52.1685378838259;
        Mon, 29 May 2023 09:47:18 -0700 (PDT)
Received: from localhost.localdomain ([174.112.183.231])
        by smtp.gmail.com with ESMTPSA id o15-20020ae9f50f000000b0074a6c29df4dsm3461394qkg.119.2023.05.29.09.47.17
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 29 May 2023 09:47:17 -0700 (PDT)
From: bruce.ashfield@gmail.com
To: steve@sakoman.com
Cc: openembedded-core@lists.openembedded.org
Subject: [dunfell 2/5] linux-yocto/5.4: update to v5.4.240
Date: Mon, 29 May 2023 12:47:11 -0400
Message-Id: <20230529164715.3511175-2-bruce.ashfield@gmail.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20230529164715.3511175-1-bruce.ashfield@gmail.com>
References: <20230529164715.3511175-1-bruce.ashfield@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Mon, 29 May 2023 16:47:25 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/181877

From: Bruce Ashfield <bruce.ashfield@gmail.com>

Updating  to the latest korg -stable release that comprises
the following commits:

    32bea3bac5ca Linux 5.4.240
    4d4cb7663613 gfs2: Always check inode size of inline inodes
    928240c36891 firmware: arm_scmi: Fix device node validation for mailbox transport
    0f5c0e0a4c0b net: sched: fix race condition in qdisc_graft()
    22d95b544924 net_sched: add __rcu annotation to netdev->qdisc
    14b6ad56df25 ext4: fix kernel BUG in 'ext4_write_inline_data_end()'
    9b189af3577e btrfs: scan device in non-exclusive mode
    45a9877d6cc3 s390/uaccess: add missing earlyclobber annotations to __clear_user()
    0c6df5364798 drm/etnaviv: fix reference leak when mmaping imported buffer
    37958ac31fe2 ALSA: usb-audio: Fix regression on detection of Roland VS-100
    6dabafd82968 ALSA: hda/conexant: Partial revert of a quirk for Lenovo
    f3a67268784c NFSv4: Fix hangs when recovering open state after a server reboot
    c81e2965a9e0 pinctrl: at91-pio4: fix domain name assignment
    82c25ac3a258 xen/netback: don't do grant copy across page boundary
    99c8ba920fc2 Input: goodix - add Lenovo Yoga Book X90F to nine_bytes_report DMI table
    657d7c215ca9 cifs: fix DFS traversal oops without CONFIG_CIFS_DFS_UPCALL
    03af69bd674d cifs: prevent infinite recursion in CIFSGetDFSRefer()
    51d657371106 Input: focaltech - use explicitly signed char type
    f0f85f5e402b Input: alps - fix compatibility with -funsigned-char
    7e71d4d190df pinctrl: ocelot: Fix alt mode for ocelot
    70728d639efb net: mvneta: make tx buffer array agnostic
    704e06b97920 net: dsa: mv88e6xxx: Enable IGMP snooping on user ports only
    fd7cff506614 bnxt_en: Fix typo in PCI id to device description string mapping
    58279cea0b10 i40e: fix registers dump after run ethtool adapter self test
    5195de1d5f66 s390/vfio-ap: fix memory leak in vfio_ap device driver
    78bc7f0ab994 can: bcm: bcm_tx_setup(): fix KMSAN uninit-value in vfs_write
    105cc2683282 net/net_failover: fix txq exceeding warning
    e633fd26abfd regulator: Handle deferred clk
    be7b622cd63f regulator: fix spelling mistake "Cant" -> "Can't"
    46c4993a1514 ptp_qoriq: fix memory leak in probe()
    c122daa0fa4c scsi: megaraid_sas: Fix crash after a double completion
    317c07d382b1 mtd: rawnand: meson: invalidate cache on polling ECC bit
    d65de5ee8b72 mips: bmips: BCM6358: disable RAC flush for TP1
    9690e34f2247 dma-mapping: drop the dev argument to arch_sync_dma_for_*
    f6e2d76aa362 ca8210: Fix unsigned mac_len comparison with zero in ca8210_skb_tx()
    856fb74f601a fbdev: au1200fb: Fix potential divide by zero
    deef33c08104 fbdev: lxfb: Fix potential divide by zero
    4f5cc5ffa8c5 fbdev: intelfb: Fix potential divide by zero
    868f247e47ef fbdev: nvidia: Fix potential divide by zero
    f3359f5fc9b7 sched_getaffinity: don't assume 'cpumask_size()' is fully initialized
    521877bf2651 fbdev: tgafb: Fix potential divide by zero
    7f12f99b8017 ALSA: hda/ca0132: fixup buffer overrun at tuning_ctl_set()
    9155a5958ed0 ALSA: asihpi: check pao in control_message()
    88a3c63a9635 md: avoid signed overflow in slot_store()
    9966fc59d3a0 bus: imx-weim: fix branch condition evaluates to a garbage value
    d121f7883a17 fsverity: don't drop pagecache at end of FS_IOC_ENABLE_VERITY
    4c24eb49ab44 ocfs2: fix data corruption after failed write
    0c0e566f0387 tun: avoid double free in tun_free_netdev
    d253120a580a sched/fair: Sanitize vruntime of entity being migrated
    c23928c70bc8 sched/fair: sanitize vruntime of entity being placed
    885c28ceae7d dm crypt: add cond_resched() to dmcrypt_write()
    4a32a9a818a8 dm stats: check for and propagate alloc_percpu failure
    f8cbad984b16 i2c: xgene-slimpro: Fix out-of-bounds bug in xgene_slimpro_i2c_xfer()
    8f5cbf6a8c0e nilfs2: fix kernel-infoleak in nilfs_ioctl_wrap_copy()
    4ae966a7f6a7 wifi: mac80211: fix qos on mesh interfaces
    f558789a886c usb: chipidea: core: fix possible concurrent when switch role
    6b3287b14739 usb: chipdea: core: fix return -EINVAL if request role is the same with current role
    0b2a56fe4659 usb: cdns3: Fix issue with using incorrect PCI device function
    e9e93fdfcefb dm thin: fix deadlock when swapping to thin device
    cd1e320ac095 igb: revert rtnl_lock() that causes deadlock
    123698a5c619 fsverity: Remove WQ_UNBOUND from fsverity read workqueue
    0eda2004f38d usb: gadget: u_audio: don't let userspace block driver unbind
    44f080d7d75a scsi: core: Add BLIST_SKIP_VPD_PAGES for SKhynix H28U74301AMR
    223274d5c310 cifs: empty interface list when server doesn't support query interfaces
    299a309b98df sh: sanitize the flags on sigreturn
    f4c610f6ca13 net: usb: qmi_wwan: add Telit 0x1080 composition
    e6b1fa6d0626 net: usb: cdc_mbim: avoid altsetting toggling for Telit FE990
    04f4a1aa9410 scsi: lpfc: Avoid usage of list iterator variable after loop
    11cdced6a03d scsi: ufs: core: Add soft dependency on governor_simpleondemand
    54ec697e3ca8 scsi: target: iscsi: Fix an error message in iscsi_check_key()
    97115221912c selftests/bpf: check that modifier resolves after pointer
    2100e374251a m68k: Only force 030 bus error if PC not in exception table
    d2b3bd0d4cad ca8210: fix mac_len negative array access
    9e7723b684c0 riscv: Bump COMMAND_LINE_SIZE value to 1024
    32518cd0fcc0 thunderbolt: Use const qualifier for `ring_interrupt_index`
    b40fe2e1f91b uas: Add US_FL_NO_REPORT_OPCODES for JMicron JMS583Gen 2
    9189f20b4c53 scsi: qla2xxx: Perform lockless command completion in abort path
    da0383f0e86c hwmon (it87): Fix voltage scaling for chips with 10.9mV ADCs
    13493ad6a220 platform/chrome: cros_ec_chardev: fix kernel data leak from ioctl
    a18fb433ceb5 Bluetooth: btsdio: fix use after free bug in btsdio_remove due to unfinished work
    b517808795d3 Bluetooth: btqcomsmd: Fix command timeout after setting BD address
    dcd4d3646221 net: mdio: thunder: Add missing fwnode_handle_put()
    707335918f73 hvc/xen: prevent concurrent accesses to the shared ring
    83e442eba39b nvme-tcp: fix nvme_tcp_term_pdu to match spec
    d673ae18406e net/sonic: use dma_mapping_error() for error check
    b72f453e886a erspan: do not use skb_mac_header() in ndo_start_xmit()
    82e07cc5a6ca atm: idt77252: fix kmemleak when rmmod idt77252
    fd6f643dea07 net/mlx5: Read the TC mapping of all priorities on ETS query
    d69c2ded95b1 bpf: Adjust insufficient default bpf_jit_limit
    97674f4cd05e keys: Do not cache key in task struct if key is requested from kernel thread
    f8ee2c8b0d0c net/ps3_gelic_net: Use dma_mapping_error
    6d7e18b1d00a net/ps3_gelic_net: Fix RX sk_buff length
    0e5c7d00ec4f net: qcom/emac: Fix use after free bug in emac_remove due to race condition
    a07ec453e86a xirc2ps_cs: Fix use after free bug in xirc2ps_detach
    42d72c6d1edc qed/qed_sriov: guard against NULL derefs from qed_iov_get_vf_info
    f2111c791d88 net: usb: smsc95xx: Limit packet length to skb->len
    5c4d71424df3 scsi: scsi_dh_alua: Fix memleak for 'qdata' in alua_activate()
    283fdc5cfbeb i2c: imx-lpi2c: check only for enabled interrupt flags
    90116b8289fd igbvf: Regard vf reset nack as success
    584771762c3e intel/igbvf: free irq on the error path in igbvf_request_msix()
    6999f854184e iavf: fix non-tunneled IPv6 UDP packet type and hashing
    4e752d2baea3 iavf: fix inverted Rx hash condition leading to disabled hash
    6fe078c2864b power: supply: da9150: Fix use after free bug in da9150_charger_remove due to race condition
    754838aa0205 net: tls: fix possible race condition between do_tls_getsockopt_conf() and do_tls_setsockopt_conf()
    09b1a76e7879 Linux 5.4.239
    f0c95f229a67 selftests: Fix the executable permissions for fib_tests.sh

Signed-off-by: Bruce Ashfield <bruce.ashfield@gmail.com>
---
 .../linux/linux-yocto-rt_5.4.bb               |  6 ++---
 .../linux/linux-yocto-tiny_5.4.bb             |  8 +++----
 meta/recipes-kernel/linux/linux-yocto_5.4.bb  | 22 +++++++++----------
 3 files changed, 18 insertions(+), 18 deletions(-)

diff --git a/meta/recipes-kernel/linux/linux-yocto-rt_5.4.bb b/meta/recipes-kernel/linux/linux-yocto-rt_5.4.bb
index 46a1d77778..a20525abb9 100644
--- a/meta/recipes-kernel/linux/linux-yocto-rt_5.4.bb
+++ b/meta/recipes-kernel/linux/linux-yocto-rt_5.4.bb
@@ -11,13 +11,13 @@ python () {
         raise bb.parse.SkipRecipe("Set PREFERRED_PROVIDER_virtual/kernel to linux-yocto-rt to enable it")
 }
 
-SRCREV_machine ?= "bdf5848b4aedd93895b490c65b52edc488c383b2"
-SRCREV_meta ?= "8a7a83b45c543cd7b05fce9ff09abe21ea92f193"
+SRCREV_machine ?= "304e411fa33ff303ec73d29376dd975c0d5f9cea"
+SRCREV_meta ?= "aaa00d56c80ea2cbb07f7a018b80b89dc59f28e0"
 
 SRC_URI = "git://git.yoctoproject.org/linux-yocto.git;branch=${KBRANCH};name=machine \
            git://git.yoctoproject.org/yocto-kernel-cache;type=kmeta;name=meta;branch=yocto-5.4;destsuffix=${KMETA}"
 
-LINUX_VERSION ?= "5.4.238"
+LINUX_VERSION ?= "5.4.240"
 
 LIC_FILES_CHKSUM = "file://COPYING;md5=bbea815ee2795b2f4230826c0c6b8814"
 
diff --git a/meta/recipes-kernel/linux/linux-yocto-tiny_5.4.bb b/meta/recipes-kernel/linux/linux-yocto-tiny_5.4.bb
index 64c81e7f4f..19b6e2fa66 100644
--- a/meta/recipes-kernel/linux/linux-yocto-tiny_5.4.bb
+++ b/meta/recipes-kernel/linux/linux-yocto-tiny_5.4.bb
@@ -6,7 +6,7 @@ KCONFIG_MODE = "--allnoconfig"
 
 require recipes-kernel/linux/linux-yocto.inc
 
-LINUX_VERSION ?= "5.4.238"
+LINUX_VERSION ?= "5.4.240"
 LIC_FILES_CHKSUM = "file://COPYING;md5=bbea815ee2795b2f4230826c0c6b8814"
 
 DEPENDS += "${@bb.utils.contains('ARCH', 'x86', 'elfutils-native', '', d)}"
@@ -15,9 +15,9 @@ DEPENDS += "openssl-native util-linux-native"
 KMETA = "kernel-meta"
 KCONF_BSP_AUDIT_LEVEL = "2"
 
-SRCREV_machine_qemuarm ?= "63e8209e8066ca7d6b3075af199875d77c4596d0"
-SRCREV_machine ?= "2a1e69d2aa0fabdecb015972c5824590a70b8225"
-SRCREV_meta ?= "8a7a83b45c543cd7b05fce9ff09abe21ea92f193"
+SRCREV_machine_qemuarm ?= "718954ab9a87d4414eb24c502a4a9a772c7020f8"
+SRCREV_machine ?= "e5560b6cd3de039d68422b61746dcf3343ec73e2"
+SRCREV_meta ?= "aaa00d56c80ea2cbb07f7a018b80b89dc59f28e0"
 
 PV = "${LINUX_VERSION}+git${SRCPV}"
 
diff --git a/meta/recipes-kernel/linux/linux-yocto_5.4.bb b/meta/recipes-kernel/linux/linux-yocto_5.4.bb
index 42fc71f7b2..989d3a2049 100644
--- a/meta/recipes-kernel/linux/linux-yocto_5.4.bb
+++ b/meta/recipes-kernel/linux/linux-yocto_5.4.bb
@@ -12,16 +12,16 @@ KBRANCH_qemux86  ?= "v5.4/standard/base"
 KBRANCH_qemux86-64 ?= "v5.4/standard/base"
 KBRANCH_qemumips64 ?= "v5.4/standard/mti-malta64"
 
-SRCREV_machine_qemuarm ?= "db8e7ac090eb96b687edbb988c3fb7d9a9d83973"
-SRCREV_machine_qemuarm64 ?= "01fe45561dc40cc40b057ee40d722388174733ed"
-SRCREV_machine_qemumips ?= "9bf85e111f1a77b41b39fa1b45a8439fa66e8c4d"
-SRCREV_machine_qemuppc ?= "5743a4eef97e79e05c6780714ffc559fbedea0bb"
-SRCREV_machine_qemuriscv64 ?= "f2e879840d91250606ae3c2fd177c310df11fde0"
-SRCREV_machine_qemux86 ?= "f2e879840d91250606ae3c2fd177c310df11fde0"
-SRCREV_machine_qemux86-64 ?= "f2e879840d91250606ae3c2fd177c310df11fde0"
-SRCREV_machine_qemumips64 ?= "41ecd49609ac6164d8022065e5028984fa5c84ce"
-SRCREV_machine ?= "f2e879840d91250606ae3c2fd177c310df11fde0"
-SRCREV_meta ?= "8a7a83b45c543cd7b05fce9ff09abe21ea92f193"
+SRCREV_machine_qemuarm ?= "a17398a736969b170c742324a65c885203234b8e"
+SRCREV_machine_qemuarm64 ?= "c3ae9d7cd0727680ec16b97ba6f92b82d35a9cfb"
+SRCREV_machine_qemumips ?= "bfd98dba6758a2f47aad79e09e3509dfb99b6886"
+SRCREV_machine_qemuppc ?= "6030458f53886df464fe9fbf3e52c4f91a6ad3ec"
+SRCREV_machine_qemuriscv64 ?= "b1db2f47a35d8a71c038a3438779f4d50807e5e5"
+SRCREV_machine_qemux86 ?= "b1db2f47a35d8a71c038a3438779f4d50807e5e5"
+SRCREV_machine_qemux86-64 ?= "b1db2f47a35d8a71c038a3438779f4d50807e5e5"
+SRCREV_machine_qemumips64 ?= "53a370f9356803b7d5b93369439c97572916bcad"
+SRCREV_machine ?= "b1db2f47a35d8a71c038a3438779f4d50807e5e5"
+SRCREV_meta ?= "aaa00d56c80ea2cbb07f7a018b80b89dc59f28e0"
 
 # remap qemuarm to qemuarma15 for the 5.4 kernel
 # KMACHINE_qemuarm ?= "qemuarma15"
@@ -30,7 +30,7 @@ SRC_URI = "git://git.yoctoproject.org/linux-yocto.git;name=machine;branch=${KBRA
            git://git.yoctoproject.org/yocto-kernel-cache;type=kmeta;name=meta;branch=yocto-5.4;destsuffix=${KMETA}"
 
 LIC_FILES_CHKSUM = "file://COPYING;md5=bbea815ee2795b2f4230826c0c6b8814"
-LINUX_VERSION ?= "5.4.238"
+LINUX_VERSION ?= "5.4.240"
 
 DEPENDS += "${@bb.utils.contains('ARCH', 'x86', 'elfutils-native', '', d)}"
 DEPENDS += "openssl-native util-linux-native"
-- 
2.34.1


