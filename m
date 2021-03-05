Received: from mail-qt1-f180.google.com (mail-qt1-f180.google.com [209.85.160.180])
 by mx.groups.io with SMTP id smtpd.web10.7565.1614916472102384900
 for <openembedded-core@lists.openembedded.org>;
 Thu, 04 Mar 2021 19:54:32 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20161025 header.b=oaeDT7H/;
 spf=pass (domain: gmail.com, ip: 209.85.160.180, mailfrom: bruce.ashfield@gmail.com)
Received: by mail-qt1-f180.google.com with SMTP id w6so763183qti.6
        for <openembedded-core@lists.openembedded.org>; Thu, 04 Mar 2021 19:54:31 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:content-transfer-encoding;
        bh=+L8T3c+Ow//9bwiQUSgC/l/clqq/ElTManB5KENLbFg=;
        b=oaeDT7H/AVvW9/7qIXU3epcJwVctCTPLUCVs+DkIhyI6KtSU32SEDaS3/lBfdzbYXI
         yaB+VUI5B10xyDOFRgWQ1rKXtLUouUpStlLY/PAjh1qK7Y3zHOhBePzv8Acc8DCwpobt
         OOwfmnD1ufBXyqXLg9PzxP9zx8mqscj23+/F2GxNtGvF1bvRnISDjSLFwSL53p3rpsJA
         pn/uaANRIoZ2OqVXrb5utkGZAErMfMtjaiUBe9RyGndmxHcahkG+PvbKBr+e5yFs5s7d
         Ze37Lpr1CpfHaxbC5xet8e4vPmRSBfv6nG8rqDSODuO2KMpaBw51jerpmY5FZjl3YBIu
         2Svg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=+L8T3c+Ow//9bwiQUSgC/l/clqq/ElTManB5KENLbFg=;
        b=gLXlxGqR6JEL60SAmBYyXxWOJTApEqyrOKqEQGRL/KCaHbhPMz7BCWFSoeIX3Ym2Qs
         aqLsNQjiVRPE1V+Msfvbgq2lps/RI4fBaxSxGsIo2nUMxDpao6eNl4ebYIZrHFDDEqS4
         ry3AirX+Mx+r47MsuvSJTko+bM0//MaSBEMzwlww+C6BWWh9U1tJR0WwNyfEZ8nvIOoM
         fioPCXNZTerQKba70zYOZpl+cITIeq3RCKBuCIhvc542adaBib29zJ22HAEcIljUri6j
         3fz4endsF5UXjU65SL+Fdx7eqjb3owoAsFyiyndM4qqoeHQiQkSEsmBhOfLwwwV+fwn5
         uEUg==
X-Gm-Message-State: AOAM530BLkRxCCqoPXJ5Xe5XDT/j+wbolst3HdRUpNFvcHY3yjGe84Wv
	HmWph2qoN+XiAb8vPXaXsIE=
X-Google-Smtp-Source: ABdhPJxUEu+qbFdjh4dQwXrxaf4t1laRxFHCiY1vjJDj6CH7FAtNMpgoiMRgVGPp6WlUa3u78pwTrw==
X-Received: by 2002:ac8:678c:: with SMTP id b12mr7262208qtp.160.1614916471174;
        Thu, 04 Mar 2021 19:54:31 -0800 (PST)
Return-Path: <bruce.ashfield@gmail.com>
Received: from build.lan (cpe04d4c4975b80-cmf4c11490699b.cpe.net.cable.rogers.com. [174.112.159.151])
        by smtp.gmail.com with ESMTPSA id 66sm997383qkk.18.2021.03.04.19.54.30
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 04 Mar 2021 19:54:30 -0800 (PST)
From: "Bruce Ashfield" <bruce.ashfield@gmail.com>
To: richard.purdie@linuxfoundation.org
Cc: openembedded-core@lists.openembedded.org
Subject: [PATCH 3/6] linux-yocto/5.10: update to v5.10.17 and -rt31
Date: Thu,  4 Mar 2021 22:54:23 -0500
Message-Id: <73fd8e15100d3e7661eaab8d61b5f0a7040c9fcc.1614916283.git.bruce.ashfield@gmail.com>
X-Mailer: git-send-email 2.19.1
In-Reply-To: <cover.1614916283.git.bruce.ashfield@gmail.com>
References: <cover.1614916283.git.bruce.ashfield@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

From: Bruce Ashfield <bruce.ashfield@gmail.com>

Updating linux-yocto/5.10 to the latest korg -stable release that comprises
the following commits:

    13b6016e96f6 Linux 5.10.17
    90ac1981acfa kcov, usb: only collect coverage from __usb_hcd_giveback_urb in softirq
    e5c376c41a57 ovl: expand warning in ovl_d_real()
    57068800258f net/qrtr: restrict user-controlled length in qrtr_tun_write_iter()
    862d1c0edd21 net/rds: restrict iovecs length for RDS_CMSG_RDMA_ARGS
    69e9fd9de17e vsock: fix locking in vsock_shutdown()
    afe31701609b vsock/virtio: update credit only if socket is not closed
    ba3bcb35d783 switchdev: mrp: Remove SWITCHDEV_ATTR_ID_MRP_PORT_STAT
    55ad30cb7f73 bridge: mrp: Fix the usage of br_mrp_port_switchdev_set_state
    e22b963d3ec9 net: watchdog: hold device global xmit lock during tx disable
    bc21a88465c2 net/vmw_vsock: improve locking in vsock_connect_timeout()
    fcee53dc03c5 net/vmw_vsock: fix NULL pointer dereference
    c9013813413e net: fix iteration for sctp transport seq_files
    9e6ce473e96b net: gro: do not keep too many GRO packets in napi->rx_list
    18193e09834c cpufreq: ACPI: Update arch scale-invariance max perf ratio if CPPC is not there
    8a3fc32b322c cpufreq: ACPI: Extend frequency tables to cover boost frequencies
    c930943a3683 net: dsa: call teardown method on probe failure
    46a831d1cc25 udp: fix skb_copy_and_csum_datagram with odd segment sizes
    24f5544f76d3 rxrpc: Fix clearance of Tx/Rx ring when releasing a call
    975a2396e37c arm64: mte: Allow PTRACE_PEEKMTETAGS access to the zero page
    3ed6cc9c2dd0 x86/pci: Create PCI/MSI irqdomain after x86_init.pci.arch_init()
    902c6dcbb146 scripts: set proper OpenSSL include dir also for sign-file
    4761b1aabcfd h8300: fix PREEMPTION build, TI_PRE_COUNT undefined
    f6b5e671c6a7 i2c: stm32f7: fix configuration of the digital filter
    0c0ddf0dd692 clk: sunxi-ng: mp: fix parent rate change flag check
    664b66e3552c drm/sun4i: dw-hdmi: Fix max. frequency for H6
    962168c2bc15 drm/sun4i: Fix H6 HDMI PHY configuration
    e639cb199b8e drm/sun4i: dw-hdmi: always set clock rate
    7596c85a8962 drm/sun4i: tcon: set sync polarity for tcon1 channel
    39e855fa959e firmware_loader: align .builtin_fw to 8
    5ff69431b763 net: hns3: add a check for index in hclge_get_rss_key()
    2c0e46258eab net: hns3: add a check for tqp_index in hclge_get_ring_chain_from_mbx()
    40389ba14d0e net: hns3: add a check for queue_id in hclge_reset_vf_queue()
    6bbc1d5ee0eb net: dsa: felix: implement port flushing on .phylink_mac_link_down
    03bf0f163df2 x86/build: Disable CET instrumentation in the kernel for 32-bit too
    880b1c2164d1 scsi: scsi_debug: Fix a memory leak
    d519197b48c1 netfilter: conntrack: skip identical origin tuple in same zone only
    4067ace5f119 ibmvnic: Clear failover_pending if unable to schedule
    284abe15c17e net: stmmac: set TxQ mode back to DCB after disabling CBS
    25c312214d9f selftests: txtimestamp: fix compilation issue
    5ed60a17d466 net: enetc: initialize the RFS and RSS memories
    8eb3e56fd180 hv_netvsc: Reset the RSC count if NVSP_STAT_FAIL in netvsc_receive()
    23b2eac8b76a net: ipa: set error code in gsi_channel_setup()
    a4595395a915 net: hdlc_x25: Return meaningful error code in x25_open
    50ad6fc36aed xen/netback: avoid race in xenvif_rx_ring_slots_available()
    bbb8c391486b netfilter: flowtable: fix tcp and udp header checksum update
    0a0e5d47670b netfilter: nftables: fix possible UAF over chains from packet path in netns
    ef8f281a6530 selftests: netfilter: fix current year
    f035e97f331e netfilter: xt_recent: Fix attempt to update deleted entry
    8032bf2af9ce bpf: Check for integer overflow when using roundup_pow_of_two()
    52d29b478326 bpf: Unbreak BPF_PROG_TYPE_KPROBE when kprobe is called via do_int3
    40e3b5c12864 dmaengine: idxd: check device state before issue command
    143b87907788 drm/vc4: hvs: Fix buffer overflow with the dlist handling
    1d7c14566924 mt76: dma: fix a possible memory leak in mt76_add_fragment()
    3ade81db49bd ath9k: fix build error with LEDS_CLASS=m
    c39cdf559d26 dmaengine: idxd: fix misc interrupt completion
    3e53d64e9a4d cgroup-v1: add disabled controller check in cgroup1_parse_param()
    2aba53830f5d KVM: x86: cleanup CR3 reserved bits checks
    e624efe36eb6 lkdtm: don't move ctors to .rodata
    d070ccc7ad17 x86/efi: Remove EFI PGD build time checks
    486c1525eba3 Revert "lib: Restrict cpumask_local_spread to houskeeping CPUs"
    cf1cab6edb06 ubsan: implement __ubsan_handle_alignment_assumption
    249735b01123 ARM: kexec: fix oops after TLB are invalidated
    7913ec05fc02 ARM: ensure the signal page contains defined contents
    3dc2ba465001 kallsyms: fix nonconverging kallsyms table with lld
    11648f26b074 ARM: dts: lpc32xx: Revert set default clock rate of HCLK PLL
    d93178df8f75 bfq-iosched: Revert "bfq: Fix computation of shallow depth"
    4fccb50ec95b riscv: virt_addr_valid must check the address belongs to linear mapping
    cd0604db18d2 drm/amd/display: Decrement refcount of dc_sink before reassignment
    8466a0c6bc13 drm/amd/display: Free atomic state after drm_atomic_commit
    1898affc717e drm/amd/display: Fix dc_sink kref count in emulated_link_detect
    b8dc6255bb2d drm/amd/display: Release DSC before acquiring
    4d9a5224d507 drm/amd/display: Add more Clock Sources to DCN2.1
    7963f3ff8edd drm/amd/display: Fix DPCD translation for LTTPR AUX_RD_INTERVAL
    07c8c581d2be nvme-pci: ignore the subsysem NQN on Phison E16
    3895bcd96a9e x86/split_lock: Enable the split lock feature on another Alder Lake CPU
    020680e36d97 scsi: lpfc: Fix EEH encountering oops with NVMe traffic
    116826d615c1 ovl: skip getxattr of security labels
    02dee03d4831 cap: fix conversions on getxattr
    cbb9404a5052 ovl: perform vfs_getxattr() with mounter creds
    f66fa5ec47e0 arm64: dts: rockchip: Disable display for NanoPi R2S
    2a2e911469b5 platform/x86: hp-wmi: Disable tablet-mode reporting by default
    d33b28e01e5c arm64: dts: rockchip: remove interrupt-names property from rk3399 vdec node
    697091f92727 ARM: OMAP2+: Fix suspcious RCU usage splats for omap_enter_idle_coupled
    6c152ac1b687 arm64: dts: qcom: sdm845: Reserve LPASS clocks in gcc
    413a2353be6b arm64: dts: rockchip: Fix PCIe DT properties on rk3399
    8e25e1eef8b9 soc: ti: omap-prm: Fix boot time errors for rst_map_012 bits 0 and 1
    8c5864d21e01 tmpfs: disallow CONFIG_TMPFS_INODE64 on alpha
    b03a0d5cc26d tmpfs: disallow CONFIG_TMPFS_INODE64 on s390
    285b57595d40 dmaengine: move channel device_node deletion to driver
    deae1e6365cd drm/dp_mst: Don't report ports connected if nothing is attached to them
    5a36371f8bb5 drm/i915/tgl+: Make sure TypeC FIA is powered up when initializing it
    e11345ed78b9 Revert "drm/amd/display: Update NV1x SR latency values"
    e72a65802a3e cgroup: fix psi monitor for root cgroup
    89b0c20d80a1 arm/xen: Don't probe xenbus as part of an early initcall
    bef1f148812d drm/i915: Fix overlay frontbuffer tracking
    7c93d8cff582 tracing: Check length before giving out the filter buffer
    a38c1ee16623 tracing: Do not count ftrace events in top level enable output
    d9b7ea4c818c gpio: ep93xx: Fix single irqchip with multi gpiochips
    10538b869a64 gpio: ep93xx: fix BUG_ON port F usage
    e072d454faa4 gpio: mxs: GPIO_MXS should not default to y unconditionally
    039e0f627397 Revert "dts: phy: add GPIO number and active state used for phy reset"
    2b02985bf83e objtool: Fix seg fault with Clang non-section symbols

Signed-off-by: Bruce Ashfield <bruce.ashfield@gmail.com>
---
 .../linux/linux-yocto-rt_5.10.bb              |  6 ++---
 .../linux/linux-yocto-tiny_5.10.bb            |  8 +++----
 meta/recipes-kernel/linux/linux-yocto_5.10.bb | 22 +++++++++----------
 3 files changed, 18 insertions(+), 18 deletions(-)

diff --git a/meta/recipes-kernel/linux/linux-yocto-rt_5.10.bb b/meta/recipes-kernel/linux/linux-yocto-rt_5.10.bb
index 26772a1acf..be30a0fd21 100644
--- a/meta/recipes-kernel/linux/linux-yocto-rt_5.10.bb
+++ b/meta/recipes-kernel/linux/linux-yocto-rt_5.10.bb
@@ -11,13 +11,13 @@ python () {
         raise bb.parse.SkipRecipe("Set PREFERRED_PROVIDER_virtual/kernel to linux-yocto-rt to enable it")
 }
 
-SRCREV_machine ?= "8dffd4d97d49439dae98e38b915729bca285f0cc"
-SRCREV_meta ?= "513e9332a0092795b3b29eec0030b462ae4c8b6e"
+SRCREV_machine ?= "c5a939ea17c76efce58a5386d41ea15db946f628"
+SRCREV_meta ?= "f905c5cd14f64e51454cfe56d2e510ee7469a832"
 
 SRC_URI = "git://git.yoctoproject.org/linux-yocto.git;branch=${KBRANCH};name=machine \
            git://git.yoctoproject.org/yocto-kernel-cache;type=kmeta;name=meta;branch=yocto-5.10;destsuffix=${KMETA}"
 
-LINUX_VERSION ?= "5.10.16"
+LINUX_VERSION ?= "5.10.17"
 
 LIC_FILES_CHKSUM = "file://COPYING;md5=6bc538ed5bd9a7fc9398086aedcd7e46"
 
diff --git a/meta/recipes-kernel/linux/linux-yocto-tiny_5.10.bb b/meta/recipes-kernel/linux/linux-yocto-tiny_5.10.bb
index 7388e6ecda..01c468116f 100644
--- a/meta/recipes-kernel/linux/linux-yocto-tiny_5.10.bb
+++ b/meta/recipes-kernel/linux/linux-yocto-tiny_5.10.bb
@@ -6,7 +6,7 @@ KCONFIG_MODE = "--allnoconfig"
 
 require recipes-kernel/linux/linux-yocto.inc
 
-LINUX_VERSION ?= "5.10.16"
+LINUX_VERSION ?= "5.10.17"
 LIC_FILES_CHKSUM = "file://COPYING;md5=6bc538ed5bd9a7fc9398086aedcd7e46"
 
 DEPENDS += "${@bb.utils.contains('ARCH', 'x86', 'elfutils-native', '', d)}"
@@ -15,9 +15,9 @@ DEPENDS += "openssl-native util-linux-native"
 KMETA = "kernel-meta"
 KCONF_BSP_AUDIT_LEVEL = "2"
 
-SRCREV_machine_qemuarm ?= "55ff861a7f7be737c26b6c61f9cd170580dd3ccd"
-SRCREV_machine ?= "34523d7c8476942eb062d4f0201f9410605afc6d"
-SRCREV_meta ?= "513e9332a0092795b3b29eec0030b462ae4c8b6e"
+SRCREV_machine_qemuarm ?= "077233e3be7323f0a1f1bc488292bc3bcfe37f5a"
+SRCREV_machine ?= "0119f230267c87ad2cc77b9190035280f40b2cf4"
+SRCREV_meta ?= "f905c5cd14f64e51454cfe56d2e510ee7469a832"
 
 PV = "${LINUX_VERSION}+git${SRCPV}"
 
diff --git a/meta/recipes-kernel/linux/linux-yocto_5.10.bb b/meta/recipes-kernel/linux/linux-yocto_5.10.bb
index e17cd28601..8cf0f60271 100644
--- a/meta/recipes-kernel/linux/linux-yocto_5.10.bb
+++ b/meta/recipes-kernel/linux/linux-yocto_5.10.bb
@@ -12,16 +12,16 @@ KBRANCH_qemux86  ?= "v5.10/standard/base"
 KBRANCH_qemux86-64 ?= "v5.10/standard/base"
 KBRANCH_qemumips64 ?= "v5.10/standard/mti-malta64"
 
-SRCREV_machine_qemuarm ?= "b6e61f33c5ac14fde7fc4fd479fb6dba7c04797b"
-SRCREV_machine_qemuarm64 ?= "34523d7c8476942eb062d4f0201f9410605afc6d"
-SRCREV_machine_qemumips ?= "4adb195168d3830786d82f29ccbb78664fd20cf9"
-SRCREV_machine_qemuppc ?= "34523d7c8476942eb062d4f0201f9410605afc6d"
-SRCREV_machine_qemuriscv64 ?= "34523d7c8476942eb062d4f0201f9410605afc6d"
-SRCREV_machine_qemux86 ?= "34523d7c8476942eb062d4f0201f9410605afc6d"
-SRCREV_machine_qemux86-64 ?= "34523d7c8476942eb062d4f0201f9410605afc6d"
-SRCREV_machine_qemumips64 ?= "36e98aa424aa3ceff3d446ee2cb3f44ddcae8c31"
-SRCREV_machine ?= "34523d7c8476942eb062d4f0201f9410605afc6d"
-SRCREV_meta ?= "513e9332a0092795b3b29eec0030b462ae4c8b6e"
+SRCREV_machine_qemuarm ?= "b4db275e753768a68d72f270d441a8d77b008299"
+SRCREV_machine_qemuarm64 ?= "0119f230267c87ad2cc77b9190035280f40b2cf4"
+SRCREV_machine_qemumips ?= "a669b4f0c27ebd9689c8b6bd2c82fab7bbf4a537"
+SRCREV_machine_qemuppc ?= "0119f230267c87ad2cc77b9190035280f40b2cf4"
+SRCREV_machine_qemuriscv64 ?= "0119f230267c87ad2cc77b9190035280f40b2cf4"
+SRCREV_machine_qemux86 ?= "0119f230267c87ad2cc77b9190035280f40b2cf4"
+SRCREV_machine_qemux86-64 ?= "0119f230267c87ad2cc77b9190035280f40b2cf4"
+SRCREV_machine_qemumips64 ?= "fe5b8cb8b21fb42caae54bf031e2b41fa88616ff"
+SRCREV_machine ?= "0119f230267c87ad2cc77b9190035280f40b2cf4"
+SRCREV_meta ?= "f905c5cd14f64e51454cfe56d2e510ee7469a832"
 
 # remap qemuarm to qemuarma15 for the 5.8 kernel
 # KMACHINE_qemuarm ?= "qemuarma15"
@@ -30,7 +30,7 @@ SRC_URI = "git://git.yoctoproject.org/linux-yocto.git;name=machine;branch=${KBRA
            git://git.yoctoproject.org/yocto-kernel-cache;type=kmeta;name=meta;branch=yocto-5.10;destsuffix=${KMETA}"
 
 LIC_FILES_CHKSUM = "file://COPYING;md5=6bc538ed5bd9a7fc9398086aedcd7e46"
-LINUX_VERSION ?= "5.10.16"
+LINUX_VERSION ?= "5.10.17"
 
 DEPENDS += "${@bb.utils.contains('ARCH', 'x86', 'elfutils-native', '', d)}"
 DEPENDS += "openssl-native util-linux-native"
-- 
2.19.1

