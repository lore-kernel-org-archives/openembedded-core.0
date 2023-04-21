Return-Path: <bruce.ashfield@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 45D5EC77B7F
	for <webhook@archiver.kernel.org>; Fri, 21 Apr 2023 16:42:03 +0000 (UTC)
Received: from mail-qk1-f170.google.com (mail-qk1-f170.google.com [209.85.222.170])
 by mx.groups.io with SMTP id smtpd.web10.17767.1682095317169238857
 for <openembedded-core@lists.openembedded.org>;
 Fri, 21 Apr 2023 09:41:57 -0700
Authentication-Results: mx.groups.io;
 dkim=fail reason="signature has expired" header.i=@gmail.com header.s=20221208 header.b=qxRmJw6o;
 spf=pass (domain: gmail.com, ip: 209.85.222.170, mailfrom: bruce.ashfield@gmail.com)
Received: by mail-qk1-f170.google.com with SMTP id af79cd13be357-74dd7f52f18so655637085a.0
        for <openembedded-core@lists.openembedded.org>; Fri, 21 Apr 2023 09:41:57 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20221208; t=1682095316; x=1684687316;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=PB389fR/wUt4oCs1xRWrKVahhK+i5trnKUBqE9pW5wo=;
        b=qxRmJw6oEjNkelEDxcuCPrHxJBtL5H/tQwrB7ryBNEaUB24MaSN0VxBNUsuNy0px+o
         7i//ReZqPDJQocELnbpOdzwoODHkuqkA4TNU+Ma7anNEvYCFIE5IQL7KrOqmAW+XsVHk
         IE6tNkw0yLUsoGN1yYBq9iQjKRcPHsBgk7R+wFNzLOuP0B287q4TzQrmLt0GeT9W0GOG
         SPMJNfZuPYuSpE5wzyCJcmkRNaJfuTIgKRu5jiSjh91Ei1nRSoADDnEX3QazjV+9U9TN
         /QtW2OnhswgpIWjNFjEXxmgODUw5y/uGPKOK9oztTU19+uWz9JlPmGnGDlRyCs6DttKJ
         dPVA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1682095316; x=1684687316;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=PB389fR/wUt4oCs1xRWrKVahhK+i5trnKUBqE9pW5wo=;
        b=BtyBZnpAdJzdsKvogVgCt19GzuUr+31u5iiQfk75jXuBAcyuhmk7owzkFP6f5lwnFX
         f3yJxETnWykfBX6jHNgUat92xvzZC20mAQrIPtTMVAl+zpursMmLetPjlVqFg/DxESF+
         DrVca4zwYi8cJcepq3U5iub0sbuyV9Y3YVliZeS4SfHjv3x5b7vx0JaOELZXa32NDNUD
         awqyEZVssacyz2BKC1t6SCWiU1j1C1hTI8EO/JzuT2Gd4PY16IWUVmipgC5ignY6vhj6
         RMbEYie2Gp8nKTEbVDX/2qRNdMN93KKKLFkz8teVJWyGw1cSo8Z/s8n5hCMX53ooRASZ
         ve9g==
X-Gm-Message-State: AAQBX9eu5lmUxaX+xPi4DRCckLGa+8OkljG5a9XAmd5OI6x3s8B5ms4/
	1Whj70PI9UeQ9gZE3tUo9KQAH96EHiKlyw==
X-Google-Smtp-Source: AKy350Y/2RwtGrweLeqyTQp5zrKVaZxyWkmgK3NP4xswnndWVxE/DAL40+jUQhNl5dyuPaLs1CorxQ==
X-Received: by 2002:a05:622a:1aa2:b0:3ef:5acf:6c2c with SMTP id s34-20020a05622a1aa200b003ef5acf6c2cmr6003300qtc.28.1682095315977;
        Fri, 21 Apr 2023 09:41:55 -0700 (PDT)
Received: from localhost.localdomain ([174.112.183.231])
        by smtp.gmail.com with ESMTPSA id 9-20020ac85909000000b003ef573e24cfsm1131245qty.12.2023.04.21.09.41.55
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 21 Apr 2023 09:41:55 -0700 (PDT)
From: bruce.ashfield@gmail.com
To: richard.purdie@linuxfoundation.org
Cc: openembedded-core@lists.openembedded.org
Subject: [PATCH 3/6] linux-yocto/6.1: update to v6.1.24
Date: Fri, 21 Apr 2023 12:41:47 -0400
Message-Id: <f754a2bb4b333f89a6f04f0db0ba64ce31019bd9.1682095127.git.bruce.ashfield@gmail.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <cover.1682095127.git.bruce.ashfield@gmail.com>
References: <cover.1682095127.git.bruce.ashfield@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Fri, 21 Apr 2023 16:42:03 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/180292

From: Bruce Ashfield <bruce.ashfield@gmail.com>

Updating  to the latest korg -stable release that comprises
the following commits:

    0102425ac76b Linux 6.1.24
    77e41187a387 bpftool: Print newline before '}' for struct with padding only fields
    1c87a6f82a4e mm: enable maple tree RCU mode by default.
    9b6627bc36aa maple_tree: add RCU lock checking to rcu callback functions
    a29025a1b61c maple_tree: add smp_rmb() to dead node detection
    d3af5f8a50dd maple_tree: remove extra smp_wmb() from mas_dead_leaves()
    cc2f2507f3f0 maple_tree: fix freeing of nodes in rcu mode
    5f7c59126498 maple_tree: detect dead nodes in mas_start()
    3825e4495bcc maple_tree: refine ma_state init from mas_start()
    64cb480523b4 maple_tree: be more cautious about dead nodes
    0a0372d1d234 maple_tree: fix mas_prev() and mas_find() state handling
    19d8f782e380 maple_tree: fix handle of invalidated state in mas_wr_store_setup()
    2c9bc4903b96 maple_tree: reduce user error potential
    f41e9e69277b maple_tree: fix potential rcu issue
    edc5a4e880fa maple_tree: remove GFP_ZERO from kmem_cache_alloc() and kmem_cache_alloc_bulk()
    0b73b8ac30c3 mm: take a page reference when removing device exclusive entries
    726825297dd6 drm/i915: Split icl_color_commit_noarm() from skl_color_commit_noarm()
    64244a900ddf drm/i915: Use _MMIO_PIPE() for SKL_BOTTOM_COLOR
    0a3e21976517 drm/bridge: lt9611: Fix PLL being unable to lock
    1297278ce239 drm/i915/dp_mst: Fix payload removal during output disabling
    0c64d72fd3f2 drm/display/dp_mst: Handle old/new payload states in drm_dp_remove_payload()
    62de38c8201d drm/amdgpu: skip psp suspend for IMU enabled ASICs mode2 reset
    73ca74fc7ab6 drm/amdgpu: for S0ix, skip SDMA 5.x+ suspend/resume
    245525543f48 drm/amd/display: Clear MST topology if it fails to resume
    414207ff47d1 blk-throttle: Fix that bps of child could exceed bps limited in parent
    240bb94f3510 maple_tree: fix a potential concurrency bug in RCU mode
    4f5760757fa2 maple_tree: fix get wrong data_end in mtree_lookup_walk()
    f042ee354c82 mm/hugetlb: fix uffd wr-protection for CoW optimization path
    85cc118ce6f1 mm/swap: fix swap_info_struct race between swapoff and get_swap_pages()
    3663f5d5bb1f ring-buffer: Fix race while reader and writer are on the same page
    240b15027088 drm/i915: fix race condition UAF in i915_perf_add_config_ioctl
    4e29fb89f771 drm/i915: Fix context runtime accounting
    e53d28a6df0e drm/nouveau/disp: Support more modes by checking with lower bpc
    3c260efd82f5 drm/panfrost: Fix the panfrost_mmu_map_fault_addr() error path
    b4b37727bc78 ublk: read any SQE values upfront
    94dd3a274bf5 wifi: mt76: ignore key disable commands
    ef6bd8f64ce0 mm: vmalloc: avoid warn_alloc noise caused by fatal signal
    0d33aa43516a zsmalloc: document freeable stats
    dc48648699c7 tracing/synthetic: Make lastcmd_mutex static
    14d34eb9b076 ASoC: hdac_hdmi: use set_stream() instead of set_tdm_slots()
    c0cf0f55be04 tracing: Free error logs of tracing instances
    1ea5f8d1facd tracing/osnoise: Fix notify new tracing_max_latency
    162e6e6ff25f tracing/timerlat: Notify new max thread latency
    9fe183f659a2 tracing/synthetic: Fix races on freeing last_cmd
    101e8e6bbae5 net: stmmac: Add queue reset into stmmac_xdp_open() function
    106e64a2e6a5 ACPI: video: Add acpi_backlight=video quirk for Lenovo ThinkPad W530
    1c2842a7fdac ACPI: video: Add acpi_backlight=video quirk for Apple iMac14,1 and iMac14,2
    9610adf8b2c8 ACPI: video: Make acpi_backlight=video work independent from GPU driver
    be12e390c246 ACPI: video: Add auto_detect arg to __acpi_video_get_backlight_type()
    b14abd688714 can: isotp: isotp_recvmsg(): use sock_recv_cmsgs() to get SOCK_RXQ_OVFL infos
    f0bfe06c5569 can: isotp: isotp_ops: fix poll() to not report false EPOLLOUT events
    db3f6340a7eb can: isotp: fix race between isotp_sendsmg() and isotp_release()
    4c3fb22a6ec6 can: j1939: j1939_tp_tx_dat_new(): fix out-of-bounds memory access
    ddca03d97daa fs: drop peer group ids under namespace lock
    3caa69378107 ftrace: Fix issue that 'direct->addr' not restored in modify_ftrace_direct()
    68973c84ea23 ftrace: Mark get_lock_parent_ip() __always_inline
    023036e38923 perf/core: Fix the same task check in perf_event_set_output
    a2eb778aacea block: don't set GD_NEED_PART_SCAN if scan partition failed
    231a49460ac0 block: ublk: make sure that block size is set correctly
    fb9ec305e764 cifs: sanitize paths in cifs_update_super_prepath.
    012c045d6128 nvme: fix discard support without oncs
    6e06a68fbbfc scsi: iscsi_tcp: Check that sock is valid before iscsi_set_param()
    44374911ac63 scsi: qla2xxx: Fix memory leak in qla2x00_probe_one()
    ac48787f58d1 io_uring: fix memory leak when removing provided buffers
    bd4081fa1cd9 io_uring: fix return value when removing provided buffers
    9f03d09b090c iio: adc: ad7791: fix IRQ flags
    9c8fb43419a9 blk-mq: directly poll requests
    5a62d771e514 counter: 104-quad-8: Fix Synapse action reported for Index signals
    6284b686c276 counter: 104-quad-8: Fix race condition between FLAG and CNTR reads
    e3d2f71fbf09 coresight-etm4: Fix for() loop drvdata->nr_addr_cmp range bug
    13ec3c238f4b coresight: etm4x: Do not access TRCIDR1 for identification
    54df8e39ce25 mm: kfence: fix handling discontiguous page
    476699a8a739 mm: kfence: fix PG_slab and memcg_data clearing
    dc54e4ea3190 KVM: nVMX: Do not report error code when synthesizing VM-Exit from Real Mode
    5f35a72fcc8b KVM: x86: Clear "has_error_code", not "error_code", for RM exception injection
    da429cddabe0 x86/ACPI/boot: Use FADT version to check support for online capable
    29e8d76446e8 x86/acpi/boot: Correct acpi_is_processor_usable() check
    cc53c92b7c96 ALSA: hda/realtek: fix mute/micmute LEDs for a HP ProBook
    f66a18f8915c ALSA: hda/realtek: Add quirk for Clevo X370SNW
    a8334a0c535d ksmbd: fix slab-out-of-bounds in init_smb2_rsp_hdr
    c1f461ed5d24 ksmbd: do not call kvmalloc() with __GFP_NORETRY | __GFP_NO_WARN
    e736180eaf03 serial: 8250: Prevent starting up DMA Rx on THRI interrupt
    4230a94cbe37 dt-bindings: serial: renesas,scif: Fix 4th IRQ for 4-IRQ SCIFs
    1942ccb7d95f nilfs2: fix sysfs interface lifetime
    bae009a2f1b7 nilfs2: fix potential UAF of struct nilfs_sc_info in nilfs_segctor_thread()
    b347d5474225 tty: serial: fsl_lpuart: avoid checking for transfer complete when UARTCTRL_SBK is asserted in lpuart32_tx_empty
    0fd57dd7a79d tty: serial: sh-sci: Fix Rx on RZ/G2L SCI
    2a6dd54da5de tty: serial: sh-sci: Fix transmit end interrupt handler
    85c3acbeef41 iio: light: cm32181: Unregister second I2C client if present
    9ba3466e6336 iio: buffer: make sure O_NONBLOCK is respected
    1658d973b2f8 iio: buffer: correctly return bytes written in output buffers
    59d667d7ae46 iio: dac: cio-dac: Fix max DAC write value check for 12-bit
    c723a410a497 iio: adc: ti-ads7950: Set `can_sleep` flag for GPIO chip
    a09eb53a18f9 iio: adc: qcom-spmi-adc5: Fix the channel name
    a876adf4ad6d iio: adis16480: select CONFIG_CRC32
    b3ea2426cc22 drivers: iio: adc: ltc2497: fix LSB shift
    2fc866050751 USB: serial: option: add Quectel RM500U-CN modem
    f91b9490a72c USB: serial: option: add Telit FE990 compositions
    9339f4b67417 usb: typec: altmodes/displayport: Fix configure initial pin assignment
    f2dc47de2874 USB: serial: cp210x: add Silicon Labs IFS-USB-DATACABLE IDs
    0105bcb9e555 usb: dwc3: pci: add support for the Intel Meteor Lake-S
    095eb65bba30 usb: cdnsp: Fixes error: uninitialized symbol 'len'
    167c05646f67 xhci: also avoid the XHCI_ZERO_64B_REGS quirk with a passthrough iommu
    745dbe21daf7 xhci: Free the command allocated for setting LPM if we return early
    130c61c516cd usb: xhci: tegra: fix sleep in atomic call
    2a0e0f4773fe PCI/DOE: Fix memory leak with CONFIG_DEBUG_OBJECTS=y
    87f2d92fc892 PCI/DOE: Silence WARN splat with CONFIG_DEBUG_OBJECTS=y
    5f625160b67f cxl/pci: Handle excessive CDAT length
    0d8dc8993a8d cxl/pci: Handle truncated CDAT entries
    ff7edd1ac643 cxl/pci: Handle truncated CDAT header
    021544721f49 cxl/pci: Fix CDAT retrieval on big endian
    435a319e3cc1 net: stmmac: check fwnode for phy device before scanning for phy
    70f1913824fd arm64: compat: Work around uninitialized variable warning
    332e7f93f112 gve: Secure enough bytes in the first TX desc for all TCP pkts
    e3bcf2a77060 netlink: annotate lockless accesses to nlk->max_recvmsg_len
    23a4bc3a2cec ethtool: reset #lanes when lanes is omitted
    5a08a32e6249 ping: Fix potentail NULL deref for /proc/net/icmp.
    b34056bedf04 raw: Fix NULL deref in raw_get_next().
    53a0031217c9 raw: use net_hash_mix() in hash function
    73b99db789ef ice: Reset FDIR counter in FDIR init stage
    aad3b871efe2 ice: fix wrong fallback logic for FDIR
    6460fee86abf NFSD: callback request does not use correct credential for AUTH_SYS
    94ef35dd2ea1 sunrpc: only free unix grouplist after RCU settles
    710392fd6546 net: stmmac: fix up RX flow hash indirection table when setting channels
    b29e7b24de18 net: ethernet: ti: am65-cpsw: Fix mdio cleanup in probe
    c35f0a48fbd0 gpio: davinci: Add irq chip flag to skip set wake
    8309ca6f09b2 gpio: davinci: Do not clear the bank intr enable bit in save_context
    73e863aa2505 platform/x86: think-lmi: Clean up display of current_value on Thinkstation
    081da7b1c881 platform/x86: think-lmi: Fix memory leaks when parsing ThinkStation WMI strings
    9071525bfcb1 platform/x86: think-lmi: Fix memory leak when showing current settings
    2c9cefc142c1 ipv6: Fix an uninit variable access bug in __ip6_make_skb()
    ef5fa4de4cac net: qrtr: Do not do DEL_SERVER broadcast after DEL_CLIENT
    d2128636b303 sctp: check send stream number after wait_for_sndbuf
    90c29c00b156 net: dsa: mv88e6xxx: Reset mv88e6393x force WD event bit
    e48e6a4652c5 net: don't let netpoll invoke NAPI if in xmit context
    8354db058092 ALSA: hda/hdmi: Preserve the previous PCM device upon re-enablement
    0185e87c69af icmp: guard against too small mtu
    b623a8e5d38a nfsd: call op_release, even when op_func returns an error
    ffcbcf087581 NFSD: Avoid calling OPDESC() with ops->opnum == OP_ILLEGAL
    0d2a6a508b9f wifi: brcmfmac: Fix SDIO suspend/resume regression
    0f638a3d1b61 l2tp: generate correct module alias strings
    c951c392a9d8 net: stmmac: remove redundant fixup to support fixed-link mode
    1aca718e1a84 net: stmmac: check if MAC needs to attach to a PHY
    2b15feabc95b net: phylink: add phylink_expects_phy() method
    aa95efa187b4 net: qrtr: Fix a refcount bug in qrtr_recvmsg()
    022c8320d9eb wifi: mac80211: fix invalid drv_sta_pre_rcu_remove calls for non-uploaded sta
    c46239e6295c wifi: mac80211: fix the size calculation of ieee80211_ie_len_eht_cap()
    1d797b152ca3 KVM: s390: pv: fix external interruption loop not always detected
    84f940586845 ASoC: codecs: lpass: fix the order or clks turn off during suspend
    6f62d2d396f1 pwm: meson: Explicitly set .polarity in .get_state()
    c6af1a3ae767 pwm: sprd: Explicitly set .polarity in .get_state()
    116a17f97764 pwm: iqs620a: Explicitly set .polarity in .get_state()
    8a3a6a0aca8c pwm: cros-ec: Explicitly set .polarity in .get_state()
    98ba763cc91c pwm: hibvt: Explicitly set .polarity in .get_state()
    547cc8dae247 pwm: Make .get_state() callback return an error code
    eafd3967b9e7 ASoC: SOF: ipc4: Ensure DSP is in D0I0 during sof_ipc4_set_get_data()
    8c3f0ae5435f Drivers: vmbus: Check for channel allocation before looking up relids
    8df93c8da532 gpio: GPIO_REGMAP: select REGMAP instead of depending on it
    74347b99d4eb KVM: arm64: PMU: Don't save PMCR_EL0.{C,P} for the vCPU
    3d8c8a9ad53e KVM: arm64: PMU: Sanitise PMCR_EL0.LP on first vcpu run
    508d71a67708 KVM: arm64: PMU: Distinguish between 64bit counter and 64bit overflow
    eb3df961021b KVM: arm64: PMU: Align chained counter implementation with architecture pseudocode
    5d70c2e2f973 dm: fix improper splitting for abnormal bios
    83ee6b272942 dm: change "unsigned" to "unsigned int"
    32bde86816aa dm integrity: Remove bi_sector that's only used by commented debug code
    6b1af0115f41 dm cache: Add some documentation to dm-cache-background-tracker.h

Signed-off-by: Bruce Ashfield <bruce.ashfield@gmail.com>
---
 .../linux/linux-yocto-rt_6.1.bb               |  6 ++--
 .../linux/linux-yocto-tiny_6.1.bb             |  6 ++--
 meta/recipes-kernel/linux/linux-yocto_6.1.bb  | 28 +++++++++----------
 3 files changed, 20 insertions(+), 20 deletions(-)

diff --git a/meta/recipes-kernel/linux/linux-yocto-rt_6.1.bb b/meta/recipes-kernel/linux/linux-yocto-rt_6.1.bb
index 99d89a5b4a..61b94df6d0 100644
--- a/meta/recipes-kernel/linux/linux-yocto-rt_6.1.bb
+++ b/meta/recipes-kernel/linux/linux-yocto-rt_6.1.bb
@@ -14,13 +14,13 @@ python () {
         raise bb.parse.SkipRecipe("Set PREFERRED_PROVIDER_virtual/kernel to linux-yocto-rt to enable it")
 }
 
-SRCREV_machine ?= "6a4ee2488620a26c6ef9083ae896f342906264ec"
-SRCREV_meta ?= "9a82ca088b3bacb994837bd55ab8fb7f1ff7fb0d"
+SRCREV_machine ?= "bd422393ccbc5b9c459d3107371a5afe2ed2f064"
+SRCREV_meta ?= "a6064d99509dcaec2e56ad3e7afb3c4d5245887f"
 
 SRC_URI = "git://git.yoctoproject.org/linux-yocto.git;branch=${KBRANCH};name=machine \
            git://git.yoctoproject.org/yocto-kernel-cache;type=kmeta;name=meta;branch=yocto-6.1;destsuffix=${KMETA}"
 
-LINUX_VERSION ?= "6.1.23"
+LINUX_VERSION ?= "6.1.24"
 
 LIC_FILES_CHKSUM = "file://COPYING;md5=6bc538ed5bd9a7fc9398086aedcd7e46"
 
diff --git a/meta/recipes-kernel/linux/linux-yocto-tiny_6.1.bb b/meta/recipes-kernel/linux/linux-yocto-tiny_6.1.bb
index 7a78369297..7ef661b19b 100644
--- a/meta/recipes-kernel/linux/linux-yocto-tiny_6.1.bb
+++ b/meta/recipes-kernel/linux/linux-yocto-tiny_6.1.bb
@@ -8,7 +8,7 @@ require recipes-kernel/linux/linux-yocto.inc
 # CVE exclusions
 include recipes-kernel/linux/cve-exclusion_6.1.inc
 
-LINUX_VERSION ?= "6.1.23"
+LINUX_VERSION ?= "6.1.24"
 LIC_FILES_CHKSUM = "file://COPYING;md5=6bc538ed5bd9a7fc9398086aedcd7e46"
 
 DEPENDS += "${@bb.utils.contains('ARCH', 'x86', 'elfutils-native', '', d)}"
@@ -17,8 +17,8 @@ DEPENDS += "openssl-native util-linux-native"
 KMETA = "kernel-meta"
 KCONF_BSP_AUDIT_LEVEL = "2"
 
-SRCREV_machine ?= "467317c61bcae6f23fab17fa54301a265e41725b"
-SRCREV_meta ?= "9a82ca088b3bacb994837bd55ab8fb7f1ff7fb0d"
+SRCREV_machine ?= "524858820f19306f914334e1cdea753002e5c2b4"
+SRCREV_meta ?= "a6064d99509dcaec2e56ad3e7afb3c4d5245887f"
 
 PV = "${LINUX_VERSION}+git${SRCPV}"
 
diff --git a/meta/recipes-kernel/linux/linux-yocto_6.1.bb b/meta/recipes-kernel/linux/linux-yocto_6.1.bb
index 36d2ac6b0a..68428eff97 100644
--- a/meta/recipes-kernel/linux/linux-yocto_6.1.bb
+++ b/meta/recipes-kernel/linux/linux-yocto_6.1.bb
@@ -17,25 +17,25 @@ KBRANCH:qemux86-64 ?= "v6.1/standard/base"
 KBRANCH:qemuloongarch64  ?= "v6.1/standard/base"
 KBRANCH:qemumips64 ?= "v6.1/standard/mti-malta64"
 
-SRCREV_machine:qemuarm ?= "cd6a9dfb3868f58ad820b714857f46794711fa60"
-SRCREV_machine:qemuarm64 ?= "467317c61bcae6f23fab17fa54301a265e41725b"
-SRCREV_machine:qemuloongarch64 ?= "467317c61bcae6f23fab17fa54301a265e41725b"
-SRCREV_machine:qemumips ?= "4403b4323a1e87d824411b5ecae8531ef7876ef5"
-SRCREV_machine:qemuppc ?= "467317c61bcae6f23fab17fa54301a265e41725b"
-SRCREV_machine:qemuriscv64 ?= "467317c61bcae6f23fab17fa54301a265e41725b"
-SRCREV_machine:qemuriscv32 ?= "467317c61bcae6f23fab17fa54301a265e41725b"
-SRCREV_machine:qemux86 ?= "467317c61bcae6f23fab17fa54301a265e41725b"
-SRCREV_machine:qemux86-64 ?= "467317c61bcae6f23fab17fa54301a265e41725b"
-SRCREV_machine:qemumips64 ?= "b1990cb332cb78304bc1b5529f8d8c22ecee73d1"
-SRCREV_machine ?= "467317c61bcae6f23fab17fa54301a265e41725b"
-SRCREV_meta ?= "9a82ca088b3bacb994837bd55ab8fb7f1ff7fb0d"
+SRCREV_machine:qemuarm ?= "5bd9ec17d8659b89458036b275b3d26531c3555c"
+SRCREV_machine:qemuarm64 ?= "524858820f19306f914334e1cdea753002e5c2b4"
+SRCREV_machine:qemuloongarch64 ?= "524858820f19306f914334e1cdea753002e5c2b4"
+SRCREV_machine:qemumips ?= "d0064731549602247de4a5d905c23349287c5536"
+SRCREV_machine:qemuppc ?= "524858820f19306f914334e1cdea753002e5c2b4"
+SRCREV_machine:qemuriscv64 ?= "524858820f19306f914334e1cdea753002e5c2b4"
+SRCREV_machine:qemuriscv32 ?= "524858820f19306f914334e1cdea753002e5c2b4"
+SRCREV_machine:qemux86 ?= "524858820f19306f914334e1cdea753002e5c2b4"
+SRCREV_machine:qemux86-64 ?= "524858820f19306f914334e1cdea753002e5c2b4"
+SRCREV_machine:qemumips64 ?= "b40d894e5124d337a6bc6dfcfe3875467090f572"
+SRCREV_machine ?= "524858820f19306f914334e1cdea753002e5c2b4"
+SRCREV_meta ?= "a6064d99509dcaec2e56ad3e7afb3c4d5245887f"
 
 # set your preferred provider of linux-yocto to 'linux-yocto-upstream', and you'll
 # get the <version>/base branch, which is pure upstream -stable, and the same
 # meta SRCREV as the linux-yocto-standard builds. Select your version using the
 # normal PREFERRED_VERSION settings.
 BBCLASSEXTEND = "devupstream:target"
-SRCREV_machine:class-devupstream ?= "543aff194ab6286af7791c5a138978ee7da4c93f"
+SRCREV_machine:class-devupstream ?= "0102425ac76bd184704c698cab7cb4fe37997556"
 PN:class-devupstream = "linux-yocto-upstream"
 KBRANCH:class-devupstream = "v6.1/base"
 
@@ -43,7 +43,7 @@ SRC_URI = "git://git.yoctoproject.org/linux-yocto.git;name=machine;branch=${KBRA
            git://git.yoctoproject.org/yocto-kernel-cache;type=kmeta;name=meta;branch=yocto-6.1;destsuffix=${KMETA}"
 
 LIC_FILES_CHKSUM = "file://COPYING;md5=6bc538ed5bd9a7fc9398086aedcd7e46"
-LINUX_VERSION ?= "6.1.23"
+LINUX_VERSION ?= "6.1.24"
 
 DEPENDS += "${@bb.utils.contains('ARCH', 'x86', 'elfutils-native', '', d)}"
 DEPENDS += "openssl-native util-linux-native"
-- 
2.34.1


