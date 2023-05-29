Return-Path: <bruce.ashfield@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 57F1AC7EE2F
	for <webhook@archiver.kernel.org>; Mon, 29 May 2023 16:49:45 +0000 (UTC)
Received: from mail-qv1-f41.google.com (mail-qv1-f41.google.com [209.85.219.41])
 by mx.groups.io with SMTP id smtpd.web10.53990.1685378980388814793
 for <openembedded-core@lists.openembedded.org>;
 Mon, 29 May 2023 09:49:40 -0700
Authentication-Results: mx.groups.io;
 dkim=fail reason="signature has expired" header.i=@gmail.com header.s=20221208 header.b=Q8UgPaPy;
 spf=pass (domain: gmail.com, ip: 209.85.219.41, mailfrom: bruce.ashfield@gmail.com)
Received: by mail-qv1-f41.google.com with SMTP id 6a1803df08f44-62606e67c0dso26753796d6.2
        for <openembedded-core@lists.openembedded.org>; Mon, 29 May 2023 09:49:40 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20221208; t=1685378979; x=1687970979;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=M9xje3jnToBkXzhQCwmY3vYuWJTkn5TqeZyx+mEpCrg=;
        b=Q8UgPaPyCbruFbmhmSVmE7snxNGvAEq8PwUUQl50/Ja/PjmHuT5s3NPmGdsiXN5v6w
         Q7vuxgkRPLKWTTIhPgbyzMCNwTPbNq7yu2PiUPgs5BiAiM24T9Qd56/dvSyt5U91Ebk9
         tkvlWby5pMYfWjdYM6jXNK7joDafbNVQoEn29k7HYeofmdYo8/9kmdR+b5e9y/5Yq1Vo
         K08b0RMHCWfaiTv20TNKsqL6ksaioRX5SAEvu7LF/MQaFsQKzRwmPkkAcnDDA+rC9Uml
         PBJhARMjNhMLp8GSYrwut4Gd+LAVBNFWbE1nw9SG+S1ue/MN7sXg7CGKuCjfqSl4MXRF
         fepg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1685378979; x=1687970979;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=M9xje3jnToBkXzhQCwmY3vYuWJTkn5TqeZyx+mEpCrg=;
        b=CyN8QbXzzR5GrEhYMJdRHmWZC1GgwUo7pPZibpmsPcSjBeGYd6O2A6rLjMC+9wXNkk
         VtzGt47iKDlfsefl5gmBe+8CxXY25hPAgdlHHutykXA9wNQyUH9OdoqkVNey9a2OAzup
         D1PFjbuQ7IlL91pWXQ3TOeTO3TCmeyma558cn9YiClsg+h2VpVx42L8QxDR5jY5MGtvY
         6N7pxY8qNA/AJiGj2ktoUu0DH2mQi8tCbnAXqYWvh+Qdk6wrzewEcFPAf6iswp+RqIkL
         E9uFQI907/78fN1Qyu4zWNdrNQcs+cYqy23zUo3PO8jr4MaSIRw6+1PhQjzOKp+HeER9
         u4dw==
X-Gm-Message-State: AC+VfDx+4xTEESqM23TW47pHe0uVuOQ35CJ4yIE/jZa6kS2Rit7IbGd7
	+UTe2Amqr7QyCaR982jxGTdeQorqFjhtgQ==
X-Google-Smtp-Source: ACHHUZ7tMjmtIYvKhCQVAwcCapgY5DxL9nBDYI86nSf5HvbR+iF8V99dY7hnvVwVm6MFCKQ/zoGb6Q==
X-Received: by 2002:a05:6214:20ec:b0:621:331b:f55d with SMTP id 12-20020a05621420ec00b00621331bf55dmr10345993qvk.19.1685378979251;
        Mon, 29 May 2023 09:49:39 -0700 (PDT)
Received: from localhost.localdomain ([174.112.183.231])
        by smtp.gmail.com with ESMTPSA id qf2-20020a0562144b8200b0062621e3b511sm1159219qvb.74.2023.05.29.09.49.38
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 29 May 2023 09:49:38 -0700 (PDT)
From: bruce.ashfield@gmail.com
To: steve@sakoman.com
Cc: openembedded-core@lists.openembedded.org
Subject: [kirkstone 3/5] linux-yocto/5.10: update to v5.10.178
Date: Mon, 29 May 2023 12:49:33 -0400
Message-Id: <20230529164935.3511435-3-bruce.ashfield@gmail.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20230529164935.3511435-1-bruce.ashfield@gmail.com>
References: <20230529164935.3511435-1-bruce.ashfield@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Mon, 29 May 2023 16:49:45 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/181883

From: Bruce Ashfield <bruce.ashfield@gmail.com>

Updating  to the latest korg -stable release that comprises
the following commits:

    791a854ae5a5 Linux 5.10.178
    f177b382c339 sysctl: Fix data-races in proc_dou8vec_minmax().
    56314b90fd43 panic, kexec: make __crash_kexec() NMI safe
    d425f348211f kexec: turn all kexec_mutex acquisitions into trylocks
    784b6ba15eb2 kexec: move locking into do_kexec_load
    0b077b22ea9f riscv: Handle zicsr/zifencei issues between clang and binutils
    c36a25101179 kbuild: check CONFIG_AS_IS_LLVM instead of LLVM_IAS
    d5f67f6d4ec4 kbuild: Switch to 'f' variants of integrated assembler flag
    83f55e6f298e kbuild: check the minimum assembler version in Kconfig
    6facabb4d069 coresight-etm4: Fix for() loop drvdata->nr_addr_cmp range bug
    7b78445bce52 watchdog: sbsa_wdog: Make sure the timeout programming is within the limits
    10b7a33c5de3 i2c: ocores: generate stop condition after timeout in polling mode
    b4210b10dc7e x86/rtc: Remove __init for runtime functions
    ba4a2f6d99fc sched/fair: Fix imbalance overflow
    68387ae3b63e sched/fair: Move calculate of avg_load to a better location
    ccbec01cc99c powerpc/papr_scm: Update the NUMA distance table for the target node
    453b3188be89 powerpc/pseries: Add support for FORM2 associativity
    498618e0a1e7 powerpc/pseries: Add a helper for form1 cpu distance
    18ce785effd9 powerpc/pseries: Consolidate different NUMA distance update code paths
    f2ae0eb96bfb powerpc/pseries: Rename TYPE1_AFFINITY to FORM1_AFFINITY
    f6d8a3a2eaab powerpc/pseries: rename min_common_depth to primary_domain_index
    5abf8af8df97 ubi: Fix deadlock caused by recursively holding work_sem
    33611d4a8181 mtd: ubi: wl: Fix a couple of kernel-doc issues
    0279e82e1484 ubi: Fix failure attaching when vid_hdr offset equals to (sub)page size
    37a3cf4abc5a cgroup/cpuset: Wake up cpuset_attach_wq tasks in cpuset_cancel_attach()
    10bda0ec3160 x86/PCI: Add quirk for AMD XHCI controller that loses MSI-X state in D3hot
    176d7345b89c scsi: ses: Handle enclosure with just a primary component gracefully
    cf22c98bcbf8 net: sfp: initialize sfp->i2c_block_size at sfp allocation
    2a4835b8ede0 riscv: add icache flush for nommu sigreturn trampoline
    c76e79e526cd asymmetric_keys: log on fatal failures in PE/pkcs7
    5de2e1f5e26f verify_pefile: relax wrapper length check
    e4b9f0bf91a3 drm: panel-orientation-quirks: Add quirk for Lenovo Yoga Book X90F
    9f0ee9ed54e1 efi: sysfb_efi: Add quirk for Lenovo Yoga Book X91F/L
    e1f80b4dfad9 i2c: imx-lpi2c: clean rx/tx buffers upon new message
    81c30f89b9c3 wifi: mwifiex: mark OF related data as maybe unused
    ab39582f3081 power: supply: cros_usbpd: reclassify "default case!" as debug
    6de0d0699f5c libbpf: Fix single-line struct definition output in btf_dump
    1bec9da233f7 net: macb: fix a memory corruption in extended buffer descriptor mode
    7d8c844b337d udp6: fix potential access to stale information
    d1b9b3191697 RDMA/core: Fix GID entry ref leak when create_ah fails
    79b28f42214a sctp: fix a potential overflow in sctp_ifwdtsn_skip
    3814d211ff13 net: qrtr: Fix an uninit variable access bug in qrtr_tx_resume()
    dad92d8ada07 qlcnic: check pci_reset_function result
    4a519731ece8 drm/armada: Fix a potential double free in an error handling path
    a069d4d98cd2 tcp: restrict net.ipv4.tcp_app_win
    cc9f9a49f5b3 tcp: convert elligible sysctls to u8
    f662a0786dfd ipv4: shrink netns_ipv4 with sysctl conversions
    389dab6142d7 sysctl: add proc_dou8vec_minmax()
    8a1fdb35459d niu: Fix missing unwind goto in niu_alloc_channels()
    9266e939d762 9p/xen : Fix use after free bug in xen_9pfs_front_remove due to race condition
    ae1149885142 RDMA/cma: Allow UD qp_type to join multicast only
    5e567fd29611 IB/mlx5: Add support for 400G_8X lane speed
    a1d2fb5d13c9 IB/mlx5: Add support for NDR link speed
    8a886f01b85d clk: sprd: set max_register according to mapping range
    6e2845284b12 mtd: rawnand: stm32_fmc2: use timings.mode instead of checking tRC_min
    9e946e4e8c3d mtd: rawnand: stm32_fmc2: remove unsupported EDO mode
    6b0e71919264 mtd: rawnand: meson: fix bitmask for length in command word
    441e57ff87c2 mtdblock: tolerate corrected bit-flips
    0d07ea8d385c fbmem: Reject FB_ACTIVATE_KD_TEXT from userspace
    5635e6940656 btrfs: fix fast csum implementation detection
    3576e08f19dc btrfs: print checksum type and implementation at mount time
    f7ec5ca433ce Bluetooth: Fix race condition in hidp_session_thread
    d9ba36c22a7b Bluetooth: L2CAP: Fix use-after-free in l2cap_disconnect_{req,rsp}
    8533fe864574 ALSA: hda/sigmatel: fix S/PDIF out on Intel D*45* motherboards
    8f6a20a4f4ce ALSA: firewire-tascam: add missing unwind goto in snd_tscm_stream_start_duplex()
    69108a8a45c6 ALSA: i2c/cs8427: fix iec958 mixer control deactivation
    e63a515d11de ALSA: hda/sigmatel: add pin overrides for Intel DP45SG motherboard
    df4af0ddf7f0 ALSA: emu10k1: fix capture interrupt handler unlinking
    14e90335bc73 Revert "pinctrl: amd: Disable and mask interrupts on resume"
    59dc9767cefb bpftool: Print newline before '}' for struct with padding only fields
    2765aca63776 ocfs2: fix freeing uninitialized resource on ocfs2_dlm_shutdown
    a412ba6b6cc6 Revert "media: ti: cal: fix possible memory leak in cal_ctx_create()"
    2d96c8dca946 drm/bridge: lt9611: Fix PLL being unable to lock
    a2773afc81fc selftests: intel_pstate: ftime() is deprecated
    ea8c42b3b6d9 mm/swap: fix swap_info_struct race between swapoff and get_swap_pages()
    5a74837809cc ring-buffer: Fix race while reader and writer are on the same page
    c1bbe926a1c7 drm/nouveau/disp: Support more modes by checking with lower bpc
    8250f7f7ae21 drm/panfrost: Fix the panfrost_mmu_map_fault_addr() error path
    acbbfdba9ca6 ASoC: hdac_hdmi: use set_stream() instead of set_tdm_slots()
    6e36373aa5ff tracing: Free error logs of tracing instances
    9c5df2f14ee3 can: isotp: isotp_ops: fix poll() to not report false EPOLLOUT events
    70caa596d158 can: j1939: j1939_tp_tx_dat_new(): fix out-of-bounds memory access
    f018ef34c44b ftrace: Fix issue that 'direct->addr' not restored in modify_ftrace_direct()
    eadcad0a47bf ftrace: Mark get_lock_parent_ip() __always_inline
    9470fc63ab42 perf/core: Fix the same task check in perf_event_set_output
    499757ad3332 scsi: iscsi_tcp: Check that sock is valid before iscsi_set_param()
    4bfdead17443 iio: adc: ad7791: fix IRQ flags
    14f9ff7857e7 ALSA: hda/realtek: Add quirk for Clevo X370SNW
    1f3b8c3b047a dt-bindings: serial: renesas,scif: Fix 4th IRQ for 4-IRQ SCIFs
    3dbee84bf9e3 nilfs2: fix sysfs interface lifetime
    f32297dba338 nilfs2: fix potential UAF of struct nilfs_sc_info in nilfs_segctor_thread()
    a17bed82c0d3 tty: serial: fsl_lpuart: avoid checking for transfer complete when UARTCTRL_SBK is asserted in lpuart32_tx_empty
    25eff5e7f743 tty: serial: sh-sci: Fix Rx on RZ/G2L SCI
    72a3e4fa882d tty: serial: sh-sci: Fix transmit end interrupt handler
    741d73fc573c iio: light: cm32181: Unregister second I2C client if present
    58bf30479a2e iio: dac: cio-dac: Fix max DAC write value check for 12-bit
    f47659f1e942 iio: adc: ti-ads7950: Set `can_sleep` flag for GPIO chip
    52a003870ee2 USB: serial: option: add Quectel RM500U-CN modem
    e6655d483766 USB: serial: option: add Telit FE990 compositions
    9d1f2a6b8d9a usb: typec: altmodes/displayport: Fix configure initial pin assignment
    4be2b71e9d36 USB: serial: cp210x: add Silicon Labs IFS-USB-DATACABLE IDs
    ec20260950af xhci: also avoid the XHCI_ZERO_64B_REGS quirk with a passthrough iommu
    b4b4f17aa46c usb: xhci: tegra: fix sleep in atomic call
    07216da8fb1d NFSD: callback request does not use correct credential for AUTH_SYS
    a3c4aa48e5f2 sunrpc: only free unix grouplist after RCU settles
    890517a4a255 net: stmmac: fix up RX flow hash indirection table when setting channels
    bdbbd3fa58f8 net: ethernet: ti: am65-cpsw: Fix mdio cleanup in probe
    d8c8476c1433 gpio: davinci: Add irq chip flag to skip set wake
    605b056d6330 ipv6: Fix an uninit variable access bug in __ip6_make_skb()
    ff2565fb8f19 net: qrtr: Do not do DEL_SERVER broadcast after DEL_CLIENT
    b4b6dfad41aa sctp: check send stream number after wait_for_sndbuf
    efda95cebfdd net: don't let netpoll invoke NAPI if in xmit context
    ec81049f0957 icmp: guard against too small mtu
    98a9cd82c541 net: qrtr: Fix a refcount bug in qrtr_recvmsg()
    94c53d294944 net: qrtr: combine nameservice into main module
    3fe20515449a wifi: mac80211: fix invalid drv_sta_pre_rcu_remove calls for non-uploaded sta
    2951229ee7d0 KVM: s390: pv: fix external interruption loop not always detected
    b43a8939f1e1 pwm: sprd: Explicitly set .polarity in .get_state()
    d59b83494d1b pwm: cros-ec: Explicitly set .polarity in .get_state()
    176c6b488919 Drivers: vmbus: Check for channel allocation before looking up relids
    c51b336bd951 gpio: GPIO_REGMAP: select REGMAP instead of depending on it

Signed-off-by: Bruce Ashfield <bruce.ashfield@gmail.com>
---
 .../linux/linux-yocto-rt_5.10.bb              |  6 ++---
 .../linux/linux-yocto-tiny_5.10.bb            |  8 +++----
 meta/recipes-kernel/linux/linux-yocto_5.10.bb | 24 +++++++++----------
 3 files changed, 19 insertions(+), 19 deletions(-)

diff --git a/meta/recipes-kernel/linux/linux-yocto-rt_5.10.bb b/meta/recipes-kernel/linux/linux-yocto-rt_5.10.bb
index e087add2bf..ccc123d036 100644
--- a/meta/recipes-kernel/linux/linux-yocto-rt_5.10.bb
+++ b/meta/recipes-kernel/linux/linux-yocto-rt_5.10.bb
@@ -11,13 +11,13 @@ python () {
         raise bb.parse.SkipRecipe("Set PREFERRED_PROVIDER_virtual/kernel to linux-yocto-rt to enable it")
 }
 
-SRCREV_machine ?= "f6146935c0b2cb2d342d8d188e7779c8244883a3"
-SRCREV_meta ?= "1ba4a1bc51cdb8831392fd4c4fca13e85aa6a344"
+SRCREV_machine ?= "c3918acd783cc421a852e580a8430d00d5e4cd5a"
+SRCREV_meta ?= "290ffeb6d028a31fe9c6e146b9ef618d50e36a04"
 
 SRC_URI = "git://git.yoctoproject.org/linux-yocto.git;branch=${KBRANCH};name=machine \
            git://git.yoctoproject.org/yocto-kernel-cache;type=kmeta;name=meta;branch=yocto-5.10;destsuffix=${KMETA}"
 
-LINUX_VERSION ?= "5.10.177"
+LINUX_VERSION ?= "5.10.178"
 
 LIC_FILES_CHKSUM = "file://COPYING;md5=6bc538ed5bd9a7fc9398086aedcd7e46"
 
diff --git a/meta/recipes-kernel/linux/linux-yocto-tiny_5.10.bb b/meta/recipes-kernel/linux/linux-yocto-tiny_5.10.bb
index 37eab2d7ab..41389e4fb9 100644
--- a/meta/recipes-kernel/linux/linux-yocto-tiny_5.10.bb
+++ b/meta/recipes-kernel/linux/linux-yocto-tiny_5.10.bb
@@ -6,7 +6,7 @@ KCONFIG_MODE = "--allnoconfig"
 
 require recipes-kernel/linux/linux-yocto.inc
 
-LINUX_VERSION ?= "5.10.177"
+LINUX_VERSION ?= "5.10.178"
 LIC_FILES_CHKSUM = "file://COPYING;md5=6bc538ed5bd9a7fc9398086aedcd7e46"
 
 DEPENDS += "${@bb.utils.contains('ARCH', 'x86', 'elfutils-native', '', d)}"
@@ -15,9 +15,9 @@ DEPENDS += "openssl-native util-linux-native"
 KMETA = "kernel-meta"
 KCONF_BSP_AUDIT_LEVEL = "2"
 
-SRCREV_machine:qemuarm ?= "deb2d09b4882f73a460887572816b3408845a5cf"
-SRCREV_machine ?= "63eb02cd1aa6c4f3e75ac2c69944a82979850c79"
-SRCREV_meta ?= "1ba4a1bc51cdb8831392fd4c4fca13e85aa6a344"
+SRCREV_machine:qemuarm ?= "4b892f65338376fcd1e18df926c06f190b539bd2"
+SRCREV_machine ?= "dc18514b51d27ae5446c8a5d068b3f996a42338a"
+SRCREV_meta ?= "290ffeb6d028a31fe9c6e146b9ef618d50e36a04"
 
 PV = "${LINUX_VERSION}+git${SRCPV}"
 
diff --git a/meta/recipes-kernel/linux/linux-yocto_5.10.bb b/meta/recipes-kernel/linux/linux-yocto_5.10.bb
index ef9a581be4..a20381c7fb 100644
--- a/meta/recipes-kernel/linux/linux-yocto_5.10.bb
+++ b/meta/recipes-kernel/linux/linux-yocto_5.10.bb
@@ -13,23 +13,23 @@ KBRANCH:qemux86  ?= "v5.10/standard/base"
 KBRANCH:qemux86-64 ?= "v5.10/standard/base"
 KBRANCH:qemumips64 ?= "v5.10/standard/mti-malta64"
 
-SRCREV_machine:qemuarm ?= "98332f8182ad39dbf2a864fdb8a813f03e3c6381"
-SRCREV_machine:qemuarm64 ?= "c8dff1b7b60ce1afbd0b6d5cb25ac335594e0ddc"
-SRCREV_machine:qemumips ?= "ff6ab2848e9bb9342bb128728ac8137f12acf4ae"
-SRCREV_machine:qemuppc ?= "f77b04b2253f1f4466dd7ed67846acdf173dc014"
-SRCREV_machine:qemuriscv64 ?= "cf160f367e3ceb54cde11392a80413b152ca4e15"
-SRCREV_machine:qemuriscv32 ?= "cf160f367e3ceb54cde11392a80413b152ca4e15"
-SRCREV_machine:qemux86 ?= "cf160f367e3ceb54cde11392a80413b152ca4e15"
-SRCREV_machine:qemux86-64 ?= "cf160f367e3ceb54cde11392a80413b152ca4e15"
-SRCREV_machine:qemumips64 ?= "c1189cd9d1c5149306b2740322b849acf0349b3c"
-SRCREV_machine ?= "cf160f367e3ceb54cde11392a80413b152ca4e15"
-SRCREV_meta ?= "1ba4a1bc51cdb8831392fd4c4fca13e85aa6a344"
+SRCREV_machine:qemuarm ?= "8f307a1c5b41dda1afe514cdd5427bb3320489a9"
+SRCREV_machine:qemuarm64 ?= "3539c6a469c2cd6e2beffcdbbbbc94603e00b048"
+SRCREV_machine:qemumips ?= "c501f357b5e8ccb10b25377c1a0c0ddd0f75c5e2"
+SRCREV_machine:qemuppc ?= "86717b18bbfa608b68bec3f8d5b463ea0dfd4802"
+SRCREV_machine:qemuriscv64 ?= "6f03475538a6d4f1f762ea6e1652499eeb2fb347"
+SRCREV_machine:qemuriscv32 ?= "6f03475538a6d4f1f762ea6e1652499eeb2fb347"
+SRCREV_machine:qemux86 ?= "6f03475538a6d4f1f762ea6e1652499eeb2fb347"
+SRCREV_machine:qemux86-64 ?= "6f03475538a6d4f1f762ea6e1652499eeb2fb347"
+SRCREV_machine:qemumips64 ?= "56b2142b8f2f4697145676de1a98230c74e82b41"
+SRCREV_machine ?= "6f03475538a6d4f1f762ea6e1652499eeb2fb347"
+SRCREV_meta ?= "290ffeb6d028a31fe9c6e146b9ef618d50e36a04"
 
 SRC_URI = "git://git.yoctoproject.org/linux-yocto.git;name=machine;branch=${KBRANCH}; \
            git://git.yoctoproject.org/yocto-kernel-cache;type=kmeta;name=meta;branch=yocto-5.10;destsuffix=${KMETA}"
 
 LIC_FILES_CHKSUM = "file://COPYING;md5=6bc538ed5bd9a7fc9398086aedcd7e46"
-LINUX_VERSION ?= "5.10.177"
+LINUX_VERSION ?= "5.10.178"
 
 DEPENDS += "${@bb.utils.contains('ARCH', 'x86', 'elfutils-native', '', d)}"
 DEPENDS += "openssl-native util-linux-native"
-- 
2.34.1


