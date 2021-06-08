Received: from mail-oi1-f181.google.com (mail-oi1-f181.google.com [209.85.167.181])
 by mx.groups.io with SMTP id smtpd.web09.13329.1623163458245670605
 for <openembedded-core@lists.openembedded.org>;
 Tue, 08 Jun 2021 07:44:18 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@sakoman-com.20150623.gappssmtp.com header.s=20150623 header.b=m3meT2q6;
 spf=softfail (domain: sakoman.com, ip: 209.85.167.181, mailfrom: steve@sakoman.com)
Received: by mail-oi1-f181.google.com with SMTP id m137so17852631oig.6
        for <openembedded-core@lists.openembedded.org>; Tue, 08 Jun 2021 07:44:18 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=sakoman-com.20150623.gappssmtp.com; s=20150623;
        h=from:to:subject:date:message-id:in-reply-to:references:mime-version
         :content-transfer-encoding;
        bh=Hs/l/2ZYZ4Ai9+x4+F9/xZmdqGXm6zClL/0CLgozSOg=;
        b=m3meT2q6trZvi8Smf6E3YuiWKgVyezYN/sILHHHORpYwE+JXu41vdOLuNfdPr22sJ9
         dVeX0Td0dvZZvTYmS64+thhx8qNgHJi7CGX/bn3jCCB0u8vjV9Kx9b+r2fthgrhJcPvr
         BmksiQsQv8Q07BbpTPuDE5z8rXyVllNMSPWrtVtv5f3JmTJ8BU9AwAOhkYAHtjVz7uJm
         8f5mROoYl2CTBrok1LGowQYi02eZGc3wbSrjOAtVbGMPDmLNXctjx/ESzWasPgyYFqo/
         PbN5UjVywkhZAVziFlyzgEzbGWA2gtpeBCpkuFBlDKPenA6/KtKGccOor/LymmyypSn2
         DTiQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=Hs/l/2ZYZ4Ai9+x4+F9/xZmdqGXm6zClL/0CLgozSOg=;
        b=oNCcvtkfyTZuXfxWhfBqL4l9Qjv6gMhmdf9Aek9Y5e6IfaDnMyqkY0VjokHp9F/Xr7
         sSIEPDxzmOsCPrgePY2AlxvfcqFfnSKrohqWtC2ovnPD1kQnykdjtjhs04lKQR75VW7y
         Oedr41izN5RDDvQTZc2yjwE+3YQapA3YOh1g4GleCgjeE7POWBgXAApoZ029G7mJLnAk
         d0TQ63v0DFCP7R1D2hAdCsTSSkBNt0XswsCTZY0Ss8liP7TniqfbHm/Tv+UxKzXgvQDZ
         oiP8lyl26h5EnVAZft6SMM7a19tRCxa0Dzu4eIHqIGjjG04QC2b+pxC+gdERUZ8TNfJp
         zRxg==
X-Gm-Message-State: AOAM533naJHGe3eHsIMTj0YDD5jSEziUCfVNu0cRPZIMWotI2/UsFnq3
	KCYe2jxs+ycBxuCj65ID/Ba7Tx1YmgVPDmuF2Ms=
X-Google-Smtp-Source: ABdhPJyPwN3PJduhYTrWCOivy+EJSXCC3tfGxDbgCxVbtf4uqAgIP11bxJsEu4WeI4DdKLS2hnL58Q==
X-Received: by 2002:aca:c60c:: with SMTP id w12mr3068923oif.59.1623163456924;
        Tue, 08 Jun 2021 07:44:16 -0700 (PDT)
Return-Path: <steve@sakoman.com>
Received: from localhost.localdomain ([172.243.4.16])
        by smtp.gmail.com with ESMTPSA id l10sm631979otj.17.2021.06.08.07.44.12
        for <openembedded-core@lists.openembedded.org>
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 08 Jun 2021 07:44:16 -0700 (PDT)
From: "Steve Sakoman" <steve@sakoman.com>
To: openembedded-core@lists.openembedded.org
Subject: [OE-core][dunfell 3/6] linux-yocto/5.4: update to v5.4.120
Date: Tue,  8 Jun 2021 04:42:32 -1000
Message-Id: <94187ff0e669df423209dde52b7aab5ca5063cd0.1623163071.git.steve@sakoman.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <cover.1623163071.git.steve@sakoman.com>
References: <cover.1623163071.git.steve@sakoman.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

From: Bruce Ashfield <bruce.ashfield@gmail.com>

Updating linux-yocto/5.4 to the latest korg -stable release that comprises
the following commits:

    e05d387ba736 Linux 5.4.120
    7f4ac21468b0 ASoC: rsnd: check all BUSIF status when error
    7f6a9044ff24 nvme: do not try to reconfigure APST when the controller is not live
    aa9d659856b1 clk: exynos7: Mark aclk_fsys1_200 as critical
    baea536cf51f netfilter: conntrack: Make global sysctls readonly in non-init netns
    fb80624f39d3 kobject_uevent: remove warning in init_uevent_argv()
    658e8982f0eb usb: typec: tcpm: Fix error while calculating PPS out values
    718f1c1fdf78 ARM: 9027/1: head.S: explicitly map DT even if it lives in the first physical section
    3c63b72ffba0 ARM: 9020/1: mm: use correct section size macro to describe the FDT virtual address
    b05a28f47582 ARM: 9012/1: move device tree mapping out of linear region
    69e44f71319b ARM: 9011/1: centralize phys-to-virt conversion of DT/ATAGS address
    bb4f8ead473a f2fs: fix error handling in f2fs_end_enable_verity()
    7a474350d8de thermal/core/fair share: Lock the thermal zone while looping over instances
    2c44110300b8 MIPS: Avoid handcoded DIVU in `__div64_32' altogether
    2759b770b53e MIPS: Avoid DIVU in `__div64_32' is result would be zero
    02b120493a9c MIPS: Reinstate platform `__div64_32' handler
    64508ebf9391 FDDI: defxx: Make MMIO the configuration default except for EISA
    ecdf893c5aef mm: fix struct page layout on 32-bit systems
    187598fd82cb KVM: x86: Cancel pvclock_gtod_work on module removal
    cdaae487e85b cdc-wdm: untangle a circular dependency between callback and softint
    b1de23dbeca7 iio: tsl2583: Fix division by a zero lux_val
    8229f1d40501 iio: gyro: mpu3050: Fix reported temperature value
    2496ead8b1b1 xhci: Add reset resume quirk for AMD xhci controller.
    de72d8769bcf xhci: Do not use GFP_KERNEL in (potentially) atomic context
    941328f7bda6 usb: dwc3: gadget: Return success always for kick transfer in ep queue
    7f15d999dd61 usb: core: hub: fix race condition about TRSMRCY of resume
    8f536512db87 usb: dwc2: Fix gadget DMA unmap direction
    36399169e6a0 usb: xhci: Increase timeout for HC halt
    68b5f65eaa6a usb: dwc3: pci: Enable usb2-gadget-lpm-disable for Intel Merrifield
    04904d90a71a usb: dwc3: omap: improve extcon initialization
    f78e2c36609b iomap: fix sub-page uptodate handling
    3c1db90ae0d0 blk-mq: Swap two calls in blk_mq_exit_queue()
    1c4962df9388 nbd: Fix NULL pointer in flush_workqueue
    0b6b4b90b74c kyber: fix out of bounds access when preempted
    dafd4c0b5e83 ACPI: scan: Fix a memory leak in an error handling path
    1648505d1353 hwmon: (occ) Fix poll rate limiting
    fa1547f6e4fb usb: fotg210-hcd: Fix an error message
    57f99e92e2f7 iio: proximity: pulsedlight: Fix rumtime PM imbalance on error
    2b94c23eaf5e drm/i915: Avoid div-by-zero on gen2
    a9b2ac3f6ad1 drm/radeon/dpm: Disable sclk switching on Oland when two 4K 60Hz monitors are connected
    f77aa56ad989 mm/hugetlb: fix F_SEAL_FUTURE_WRITE
    b3f1731c6d7f userfaultfd: release page in error path to avoid BUG_ON
    1b8d4206a48c squashfs: fix divide error in calculate_skip()
    c451a6bafb5f hfsplus: prevent corruption in shrinking truncate
    0b4eb172cc12 powerpc/64s: Fix crashes when toggling entry flush barrier
    379ea3a4e34b powerpc/64s: Fix crashes when toggling stf barrier
    9cca6cc73bb9 ARC: mm: PAE: use 40-bit physical page mask
    e242c138ae01 ARC: entry: fix off-by-one error in syscall number validation
    9c1d454726fc i40e: Fix PHY type identifiers for 2.5G and 5G adapters
    7e7b538a9af5 i40e: fix the restart auto-negotiation after FEC modified
    d718c15a2bf9 i40e: Fix use-after-free in i40e_client_subtask()
    c77e2ef18167 netfilter: nftables: avoid overflows in nft_hash_buckets()
    a8cfa7aff11d kernel: kexec_file: fix error return code of kexec_calculate_store_digests()
    043ebbccdde6 sched/fair: Fix unfairness caused by missing load decay
    687f523c134b sched: Fix out-of-bound access in uclamp
    51d3e462ea91 can: m_can: m_can_tx_work_queue(): fix tx_skb race condition
    c8e3c76cc8c5 netfilter: nfnetlink_osf: Fix a missing skb_header_pointer() NULL check
    ca74d0dbaffa smc: disallow TCP_ULP in smc_setsockopt()
    2f9f92e2ecec net: fix nla_strcmp to handle more then one trailing null character
    6aeba28d1213 ksm: fix potential missing rmap_item for stable_node
    dde73137ce9c mm/migrate.c: fix potential indeterminate pte entry in migrate_vma_insert_page()
    262943265d97 mm/hugeltb: handle the error case in hugetlb_fix_reserve_counts()
    3ddbd4beadfa khugepaged: fix wrong result value for trace_mm_collapse_huge_page_isolate()
    1816d1b3272a drm/radeon: Avoid power table parsing memory leaks
    8e0b76725c38 drm/radeon: Fix off-by-one power_state index heap overwrite
    9e3cbdc52318 netfilter: xt_SECMARK: add new revision to fix structure layout
    7a0a9f5cf8b5 sctp: fix a SCTP_MIB_CURRESTAB leak in sctp_sf_do_dupcook_b
    f7f6f0777409 ethernet:enic: Fix a use after free bug in enic_hard_start_xmit
    a04c2a398dc9 sunrpc: Fix misplaced barrier in call_decode
    b8168792c3fb RISC-V: Fix error code returned by riscv_hartid_to_cpuid()
    b1b31948c0af sctp: do asoc update earlier in sctp_sf_do_dupcook_a
    2e99f6871493 net: hns3: disable phy loopback setting in hclge_mac_start_phy
    954ea8a0cfe1 net: hns3: use netif_tx_disable to stop the transmit queue
    c073c2b27285 net: hns3: fix for vxlan gpe tx checksum bug
    56e680c09002 net: hns3: add check for HNS3_NIC_STATE_INITED in hns3_reset_notify_up_enet()
    282d8a6a5546 net: hns3: initialize the message content in hclge_get_link_mode()
    ccffcc9f3574 net: hns3: fix incorrect configuration for igu_egu_hw_err
    3dd2cd64466e rtc: ds1307: Fix wday settings for rx8130
    2ad8af2b70e9 ceph: fix inode leak on getattr error in __fh_to_dentry
    b37609ad2277 rtc: fsl-ftm-alarm: add MODULE_TABLE()
    7d1ada9e1096 NFSv4.2 fix handling of sr_eof in SEEK's reply
    89862bd77e9c pNFS/flexfiles: fix incorrect size check in decode_nfs_fh()
    ff4d21fb2261 PCI: endpoint: Fix missing destroy_workqueue()
    bdbee0d84520 NFS: Deal correctly with attribute generation counter overflow
    7e16709fc540 NFSv4.2: Always flush out writes in nfs42_proc_fallocate()
    20f9516b8372 rpmsg: qcom_glink_native: fix error return code of qcom_glink_rx_data()
    3ed8832aeaa9 ARM: 9064/1: hw_breakpoint: Do not directly check the event's overflow_handler hook
    0454a3dc8747 PCI: Release OF node in pci_scan_device()'s error path
    364e8bb8b425 PCI: iproc: Fix return value of iproc_msi_irq_domain_alloc()
    e150f825ca29 f2fs: fix a redundant call to f2fs_balance_fs if an error occurs
    f49f00dbe3d0 thermal: thermal_of: Fix error return code of thermal_of_populate_bind_params()
    f599960166a0 ASoC: rt286: Make RT286_SET_GPIO_* readable and writable
    44d96d2dc054 ia64: module: fix symbolizer crash on fdescr
    8b88f16d9d30 bnxt_en: Add PCI IDs for Hyper-V VF devices.
    98e1d0fe20ed net: ethernet: mtk_eth_soc: fix RX VLAN offload
    5da6affd9c7e iavf: remove duplicate free resources calls
    40d1cb16a578 powerpc/iommu: Annotate nested lock for lockdep
    d26436a3b913 qtnfmac: Fix possible buffer overflow in qtnf_event_handle_external_auth
    9184f2608e89 wl3501_cs: Fix out-of-bounds warnings in wl3501_mgmt_join
    78a004cdfd2d wl3501_cs: Fix out-of-bounds warnings in wl3501_send_pkt
    cd06b0786056 drm/amd/display: fixed divide by zero kernel crash during dsc enablement
    eed7287db3a9 powerpc/pseries: Stop calling printk in rtas_stop_self()
    63a42044b9a1 samples/bpf: Fix broken tracex1 due to kprobe argument change
    9f6e107aab14 net: sched: tapr: prevent cycle_time == 0 in parse_taprio_schedule
    3aa4e4d7ccf4 ethtool: ioctl: Fix out-of-bounds warning in store_link_ksettings_for_user()
    061868e90062 ASoC: rt286: Generalize support for ALC3263 codec
    56a6218e97db powerpc/smp: Set numa node before updating mask
    dfa2a8d2d8a7 flow_dissector: Fix out-of-bounds warning in __skb_flow_bpf_to_target()
    5f24807c3cba sctp: Fix out-of-bounds warning in sctp_process_asconf_param()
    9fc2c9579415 ALSA: hda/hdmi: fix race in handling acomp ELD notification at resume
    f59db26081c0 kconfig: nconf: stop endless search loops
    c262de1777e4 selftests: Set CC to clang in lib.mk if LLVM is set
    2b9ad1fd9dd2 drm/amd/display: Force vsync flip when reconfiguring MPCC
    10ed519fa825 iommu/amd: Remove performance counter pre-initialization test
    82f6753ac96b Revert "iommu/amd: Fix performance counter initialization"
    ae33b2f845fd ASoC: rsnd: call rsnd_ssi_master_clk_start() from rsnd_ssi_init()
    d61f2d938135 cuse: prevent clone
    7dac356a65db mt76: mt76x0: disable GTK offloading
    48be573a04f1 pinctrl: samsung: use 'int' for register masks in Exynos
    f88e0fbeff0f mac80211: clear the beacon's CRC after channel switch
    fadf3660a24f i2c: Add I2C_AQ_NO_REP_START adapter quirk
    7ffafbf2537d ASoC: Intel: bytcr_rt5640: Add quirk for the Chuwi Hi8 tablet
    98ebeb87b2cf ip6_vti: proper dev_{hold|put} in ndo_[un]init methods
    fae341909d6c Bluetooth: check for zapped sk before connecting
    29e498ff183a net: bridge: when suppression is enabled exclude RARP packets
    a3893726745f Bluetooth: initialize skb_queue_head at l2cap_chan_create()
    ca0dec6564e6 Bluetooth: Set CONF_NOT_COMPLETE as l2cap_chan default
    1ac09b2bdc99 ALSA: bebob: enable to deliver MIDI messages for multiple ports
    e2f577188581 ALSA: rme9652: don't disable if not enabled
    a6f2224be419 ALSA: hdspm: don't disable if not enabled
    4ea252600a7d ALSA: hdsp: don't disable if not enabled
    7900cdfbc1dd i2c: bail out early when RDWR parameters are wrong
    3c0432417fa3 ASoC: rsnd: core: Check convert rate in rsnd_hw_params
    e3564792359d net: stmmac: Set FIFO sizes for ipq806x
    ac740f06bf53 ASoC: Intel: bytcr_rt5640: Enable jack-detect support on Asus T100TAF
    aee46e847d19 tipc: convert dest node's address to network order
    ccef53a27a24 fs: dlm: fix debugfs dump
    6c799f6c7427 PM: runtime: Fix unpaired parent child_count for force_resume
    18cb19eab713 KVM: x86/mmu: Remove the defunct update_pte() paging hook
    e888d623a420 tpm, tpm_tis: Reserve locality in tpm_tis_resume()
    a0fd39a09e31 tpm, tpm_tis: Extend locality handling to TPM2 in tpm_tis_gen_interrupt()
    0a60d4be38f0 tpm: fix error return code in tpm2_get_cc_attrs_tbl()

Signed-off-by: Bruce Ashfield <bruce.ashfield@gmail.com>
Signed-off-by: Richard Purdie <richard.purdie@linuxfoundation.org>
(cherry picked from commit 6d5da1fa69df93d85b7eebbe8d60108eed4e4e6a)
Signed-off-by: Steve Sakoman <steve@sakoman.com>
---
 .../linux/linux-yocto-rt_5.4.bb               |  6 ++---
 .../linux/linux-yocto-tiny_5.4.bb             |  8 +++----
 meta/recipes-kernel/linux/linux-yocto_5.4.bb  | 22 +++++++++----------
 3 files changed, 18 insertions(+), 18 deletions(-)

diff --git a/meta/recipes-kernel/linux/linux-yocto-rt_5.4.bb b/meta/recipes-kernel/linux/linux-yocto-rt_5.4.bb
index 2d9a6f50ad..62124af43b 100644
--- a/meta/recipes-kernel/linux/linux-yocto-rt_5.4.bb
+++ b/meta/recipes-kernel/linux/linux-yocto-rt_5.4.bb
@@ -11,13 +11,13 @@ python () {
         raise bb.parse.SkipRecipe("Set PREFERRED_PROVIDER_virtual/kernel to linux-yocto-rt to enable it")
 }
 
-SRCREV_machine ?= "62f2f19316f63910f27760e24314d02814a8a90e"
-SRCREV_meta ?= "9e2546ab8d63f70ba458eb159d29ce6736ffd3e4"
+SRCREV_machine ?= "5c7a781b20543c57a49ffc6fabac59cb769bd895"
+SRCREV_meta ?= "76aa6f85d62f7fc05c4b3e371fafe74290fc2238"
 
 SRC_URI = "git://git.yoctoproject.org/linux-yocto.git;branch=${KBRANCH};name=machine \
            git://git.yoctoproject.org/yocto-kernel-cache;type=kmeta;name=meta;branch=yocto-5.4;destsuffix=${KMETA}"
 
-LINUX_VERSION ?= "5.4.119"
+LINUX_VERSION ?= "5.4.120"
 
 LIC_FILES_CHKSUM = "file://COPYING;md5=bbea815ee2795b2f4230826c0c6b8814"
 
diff --git a/meta/recipes-kernel/linux/linux-yocto-tiny_5.4.bb b/meta/recipes-kernel/linux/linux-yocto-tiny_5.4.bb
index 26a7da085a..9045dade6e 100644
--- a/meta/recipes-kernel/linux/linux-yocto-tiny_5.4.bb
+++ b/meta/recipes-kernel/linux/linux-yocto-tiny_5.4.bb
@@ -6,7 +6,7 @@ KCONFIG_MODE = "--allnoconfig"
 
 require recipes-kernel/linux/linux-yocto.inc
 
-LINUX_VERSION ?= "5.4.119"
+LINUX_VERSION ?= "5.4.120"
 LIC_FILES_CHKSUM = "file://COPYING;md5=bbea815ee2795b2f4230826c0c6b8814"
 
 DEPENDS += "${@bb.utils.contains('ARCH', 'x86', 'elfutils-native', '', d)}"
@@ -15,9 +15,9 @@ DEPENDS += "openssl-native util-linux-native"
 KMETA = "kernel-meta"
 KCONF_BSP_AUDIT_LEVEL = "2"
 
-SRCREV_machine_qemuarm ?= "de992e88dcfe547cc08bfc1a371b0fc0c0892a31"
-SRCREV_machine ?= "8997f663001be812a7670488ac8698eb916d9d50"
-SRCREV_meta ?= "9e2546ab8d63f70ba458eb159d29ce6736ffd3e4"
+SRCREV_machine_qemuarm ?= "0e1e637fa02afed13331ed27345233fb3969134b"
+SRCREV_machine ?= "0695891aff8c530c4a4ded7f17d6a262a15a0043"
+SRCREV_meta ?= "76aa6f85d62f7fc05c4b3e371fafe74290fc2238"
 
 PV = "${LINUX_VERSION}+git${SRCPV}"
 
diff --git a/meta/recipes-kernel/linux/linux-yocto_5.4.bb b/meta/recipes-kernel/linux/linux-yocto_5.4.bb
index 66a5a49b29..bf2e8944c6 100644
--- a/meta/recipes-kernel/linux/linux-yocto_5.4.bb
+++ b/meta/recipes-kernel/linux/linux-yocto_5.4.bb
@@ -12,16 +12,16 @@ KBRANCH_qemux86  ?= "v5.4/standard/base"
 KBRANCH_qemux86-64 ?= "v5.4/standard/base"
 KBRANCH_qemumips64 ?= "v5.4/standard/mti-malta64"
 
-SRCREV_machine_qemuarm ?= "715f9e60c9426156cb73904e65d39daea51288ca"
-SRCREV_machine_qemuarm64 ?= "8997f663001be812a7670488ac8698eb916d9d50"
-SRCREV_machine_qemumips ?= "bd95d2d0a38cf539f34d84740262c4d3aef1833f"
-SRCREV_machine_qemuppc ?= "8997f663001be812a7670488ac8698eb916d9d50"
-SRCREV_machine_qemuriscv64 ?= "8997f663001be812a7670488ac8698eb916d9d50"
-SRCREV_machine_qemux86 ?= "8997f663001be812a7670488ac8698eb916d9d50"
-SRCREV_machine_qemux86-64 ?= "8997f663001be812a7670488ac8698eb916d9d50"
-SRCREV_machine_qemumips64 ?= "45be3768458cb4186ee2761de2a414e323bd6fe0"
-SRCREV_machine ?= "8997f663001be812a7670488ac8698eb916d9d50"
-SRCREV_meta ?= "9e2546ab8d63f70ba458eb159d29ce6736ffd3e4"
+SRCREV_machine_qemuarm ?= "56b22a7df23bba68edae26b7edd742f298703f54"
+SRCREV_machine_qemuarm64 ?= "0695891aff8c530c4a4ded7f17d6a262a15a0043"
+SRCREV_machine_qemumips ?= "58a596a8a9547627afb002264cf2f2084c9856ac"
+SRCREV_machine_qemuppc ?= "0695891aff8c530c4a4ded7f17d6a262a15a0043"
+SRCREV_machine_qemuriscv64 ?= "0695891aff8c530c4a4ded7f17d6a262a15a0043"
+SRCREV_machine_qemux86 ?= "0695891aff8c530c4a4ded7f17d6a262a15a0043"
+SRCREV_machine_qemux86-64 ?= "0695891aff8c530c4a4ded7f17d6a262a15a0043"
+SRCREV_machine_qemumips64 ?= "f24f74364767d24f7b1a4967c162af693897ee51"
+SRCREV_machine ?= "0695891aff8c530c4a4ded7f17d6a262a15a0043"
+SRCREV_meta ?= "76aa6f85d62f7fc05c4b3e371fafe74290fc2238"
 
 # remap qemuarm to qemuarma15 for the 5.4 kernel
 # KMACHINE_qemuarm ?= "qemuarma15"
@@ -30,7 +30,7 @@ SRC_URI = "git://git.yoctoproject.org/linux-yocto.git;name=machine;branch=${KBRA
            git://git.yoctoproject.org/yocto-kernel-cache;type=kmeta;name=meta;branch=yocto-5.4;destsuffix=${KMETA}"
 
 LIC_FILES_CHKSUM = "file://COPYING;md5=bbea815ee2795b2f4230826c0c6b8814"
-LINUX_VERSION ?= "5.4.119"
+LINUX_VERSION ?= "5.4.120"
 
 DEPENDS += "${@bb.utils.contains('ARCH', 'x86', 'elfutils-native', '', d)}"
 DEPENDS += "openssl-native util-linux-native"
-- 
2.25.1

