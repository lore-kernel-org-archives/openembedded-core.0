Return-Path: <bruce.ashfield@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 7F0F4C64E67
	for <webhook@archiver.kernel.org>; Thu, 21 Apr 2022 16:46:09 +0000 (UTC)
Received: from mail-qk1-f175.google.com (mail-qk1-f175.google.com
 [209.85.222.175])
 by mx.groups.io with SMTP id smtpd.web12.9897.1650471893603251349
 for <openembedded-core@lists.openembedded.org>;
 Wed, 20 Apr 2022 09:24:53 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20210112 header.b=c0XlKcaZ;
 spf=pass (domain: gmail.com, ip: 209.85.222.175,
 mailfrom: bruce.ashfield@gmail.com)
Received: by mail-qk1-f175.google.com with SMTP id e128so1593303qkd.7
        for <openembedded-core@lists.openembedded.org>;
 Wed, 20 Apr 2022 09:24:53 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:content-transfer-encoding;
        bh=FTbGx5OJlglcu4dTtXoiqH0QDhR6K8ViU14MZuHZ88o=;
        b=c0XlKcaZ0FCa1aioOBsb5+i0XHIrgU7nE84pgjaRPxNwIiE/j70lzuXNTfgFx7R3Eq
         f/X87ObMTPgqaUvWFv60ez/P8eogyXa4KNY8BrxOxBn6MgI9bs/fIK5yOM0kIx5griyB
         8xi7BFXi0Dd5EiS6/lLEhdpqFU7s+4u83XQ+fEmsBB87iH0L4PyETnu/yOs9BVC1G5Xp
         cpA4nrF3PKsMEz/qqtmx8P7MERY3s1Fs1E+qEDSzAUGLZ2JQUjaWvE//oF2I95Gis/uO
         tiWgv0KHKkXPoKhjdLMrOc4TpSJsBth6AFatjnkHgeED+iQHZgYNla7JzD07Ly75cPbF
         ZHMw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=FTbGx5OJlglcu4dTtXoiqH0QDhR6K8ViU14MZuHZ88o=;
        b=ONd8TiWjKf3VRTOzWASdBYejnWsfukXwfpl+Hewkza+MoGle1R4+9wPEwoWSHzPQWL
         UgtRN8H8sytHNNuvdTXbwf4CP4ss7qSiIaIiwtT9+gPJkyorHp12KybXZND8RTj+rjZp
         09rhufFTHZD2QVl9dp2TQ+O4nqA8PMH7HKVcVNuBr2dBmMbMHisQngTh6tCxuZflA7Al
         RTSJ0Hty/skeUZnsY0EAlJodBs8HbueYCkh8aJv01KDTKjYKnFNCuc1odjXxzM6Dsdlk
         yufkHJEYjZKF+rc2ob2jtBN1tM9fqkUP5hsO4auQKKb2buCSOwsJ1V+ZgSYUBHRFYZ1V
         P+qA==
X-Gm-Message-State: AOAM531z6pLENxEnur1DXgGkIHCENmTTu4wLFZoYueaaLgaf8y3ADj0Z
	QV1cWszlQ4EI7UkD+gGxlVWOVqq7IE26Iw==
X-Google-Smtp-Source: 
 ABdhPJyJ8hqjciwl3fKz72FIPZddwCmAmuPQqy7Kn3Ip7EZGi9GtWdM2jt/LnQBjlcZcUUZkQa33cw==
X-Received: by 2002:a05:620a:2699:b0:47d:753c:b8ff with SMTP id
 c25-20020a05620a269900b0047d753cb8ffmr13205275qkp.763.1650471892377;
        Wed, 20 Apr 2022 09:24:52 -0700 (PDT)
Received: from build.lan ([173.34.88.218])
        by smtp.gmail.com with ESMTPSA id
 l19-20020a37f513000000b0069c5807ff10sm1657236qkk.27.2022.04.20.09.24.51
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 20 Apr 2022 09:24:51 -0700 (PDT)
From: bruce.ashfield@gmail.com
To: steve@sakoman.com,
	richard.purdie@linuxfoundation.org
Cc: openembedded-core@lists.openembedded.org
Subject: [PATCH 5/5][dunfell] linux-yocto/5.4: update to v5.4.190
Date: Wed, 20 Apr 2022 12:24:45 -0400
Message-Id: <20220420162445.56096-5-bruce.ashfield@gmail.com>
X-Mailer: git-send-email 2.19.1
In-Reply-To: <20220420162445.56096-1-bruce.ashfield@gmail.com>
References: <20220420162445.56096-1-bruce.ashfield@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Thu, 21 Apr 2022 16:46:09 -0000
X-Groupsio-URL: 
 https://lists.openembedded.org/g/openembedded-core/message/164715

From: Bruce Ashfield <bruce.ashfield@gmail.com>

Updating linux-yocto/5.4 to the latest korg -stable release that comprises
the following commits:

    dc213ac85601 Linux 5.4.190
    a83a18c4c903 ax25: Fix UAF bugs in ax25 timers
    40cb8b3b19c0 ax25: Fix NULL pointer dereferences in ax25 timers
    d2be5b563ef3 ax25: fix NPD bug in ax25_disconnect
    eaa7eb23fa76 ax25: fix UAF bug in ax25_send_control()
    9e1e088a57c2 ax25: Fix refcount leaks caused by ax25_cb_del()
    7528d0f2210c ax25: fix UAF bugs of net_device caused by rebinding operation
    1db0b2c55c93 ax25: fix reference count leaks of ax25_dev
    418993bbaafb ax25: add refcount in ax25_dev to avoid UAF bugs
    4459946e867a dma-direct: avoid redundant memory sync for swiotlb
    7efb8e49f659 i2c: pasemi: Wait for write xfers to finish
    659855c62c34 smp: Fix offline cpu check in flush_smp_call_function_queue()
    7f84c9372229 dm integrity: fix memory corruption when tag_size is less than digest size
    89931d476257 ARM: davinci: da850-evm: Avoid NULL pointer dereference
    28956e530b11 tick/nohz: Use WARN_ON_ONCE() to prevent console saturation
    f4fb50ee2594 genirq/affinity: Consider that CPUs on nodes can be unbalanced
    f616ecec0fae drm/amd/display: don't ignore alpha property on pre-multiplied mode
    ab2f5afb7af5 ipv6: fix panic when forwarding a pkt with no in6 dev
    377a80ca6590 ALSA: pcm: Test for "silence" field in struct "pcm_format_data"
    5f77b1c0e673 ALSA: hda/realtek: Add quirk for Clevo PD50PNT
    358e7b451a5a btrfs: mark resumed async balance as writing
    d5b0b11c064e btrfs: remove unused variable in btrfs_{start,write}_dirty_block_groups()
    0aad67337ff7 ath9k: Fix usage of driver-private space in tx_info
    7fb98e4f5b2e ath9k: Properly clear TX status area before reporting to mac80211
    7a9e1327ccb2 gcc-plugins: latent_entropy: use /dev/urandom
    534d0aebe164 mm: kmemleak: take a full lowmem check in kmemleak_*_phys()
    b56d305274b6 mm, page_alloc: fix build_zonerefs_node()
    e07a70ca831e perf/imx_ddr: Fix undefined behavior due to shift overflowing the constant
    d05cd68ed846 drivers: net: slip: fix NPD bug in sl_tx_timeout()
    6d41134f3037 scsi: megaraid_sas: Target with invalid LUN ID is deleted during scan
    3ecd43dcdac4 scsi: mvsas: Add PCI ID of RocketRaid 2640
    deab81144d5a powerpc: Fix virt_addr_valid() for 64-bit Book3E & 32-bit
    dd9b4b435a56 drm/amd/display: Fix allocate_mst_payload assert on resume
    404998a137bc net: usb: aqc111: Fix out-of-bounds accesses in RX fixup
    4a244167964a tlb: hugetlb: Add more sizes to tlb_remove_huge_tlb_entry
    29c2910c5060 arm64: alternatives: mark patch_alternative() as `noinstr`
    8c4db601ac8c regulator: wm8994: Add an off-on delay for WM8994 variant
    066180758fd0 gpu: ipu-v3: Fix dev_dbg frequency output
    b4ef44c7c27b ata: libata-core: Disable READ LOG DMA EXT for Samsung 840 EVOs
    4cd3c9e070d6 net: micrel: fix KS8851_MLL Kconfig
    6117facb44a1 scsi: ibmvscsis: Increase INITIAL_SRP_LIMIT to 1024
    fb7a5115422f scsi: target: tcmu: Fix possible page UAF
    70b97c1546f9 Drivers: hv: vmbus: Prevent load re-ordering when reading ring buffer
    c7a268b33882 drm/amdkfd: Check for potential null return of kmalloc_array()
    2f3e1f38631f drm/amdkfd: Fix Incorrect VMIDs passed to HWS
    46ca8233f12d drm/amd/display: Update VTEM Infopacket definition
    74090c44c1f2 drm/amd/display: fix audio format not updated after edid updated
    0b3c2222d73a drm/amd: Add USBC connector ID
    22d658c6c5af cifs: potential buffer overflow in handling symlinks
    5c63ad2b0a26 nfc: nci: add flush_workqueue to prevent uaf
    1407cc68aaa8 testing/selftests/mqueue: Fix mq_perf_tests to free the allocated cpu set
    37e54d151eab sctp: Initialize daddr on peeled off socket
    a05f5e26cb8b net/smc: Fix NULL pointer dereference in smc_pnet_find_ib()
    1ac7c6d75ede drm/msm/dsi: Use connector directly in msm_dsi_manager_connector_init()
    02ee10d2a4a0 cfg80211: hold bss_lock while updating nontrans_list
    99a435c3789c net/sched: taprio: Check if socket flags are valid
    7e59fdf9547c net: ethernet: stmmac: fix altr_tse_pcs function when using a fixed-link
    94541468c11a net/sched: fix initialization order when updating chain 0 head
    4f83ba16a1b8 mlxsw: i2c: Fix initialization error flow
    8cefae8c40df gpiolib: acpi: use correct format characters
    2fd90b86dff4 veth: Ensure eth header is in skb's linear part
    5f2e54391893 net/sched: flower: fix parsing of ethertype following VLAN header
    9250186785f4 memory: atmel-ebi: Fix missing of_node_put in atmel_ebi_probe
    e7f5213d755b Linux 5.4.189
    b15feb09a32e ACPI: processor idle: Check for architectural support for LPI
    60b6aae07249 cpuidle: PSCI: Move the `has_lpi` check to the beginning of the function
    598a22a077a8 selftests: cgroup: Test open-time cgroup namespace usage for migration checks
    a3f6c5949f66 selftests: cgroup: Test open-time credential usage for migration checks
    48848242d378 selftests: cgroup: Make cg_create() use 0755 for permission instead of 0644
    8a887060af61 cgroup: Use open-time cgroup namespace for process migration perm checks
    9bd1ced6466e cgroup: Allocate cgroup_file_ctx for kernfs_open_file->priv
    691a0fd625e0 cgroup: Use open-time credentials for process migraton perm checks
    1a623d361ffe io_uring: fix fs->users overflow
    33fcb359a642 drm/amdkfd: Fix -Wstrict-prototypes from amdgpu_amdkfd_gfx_10_0_get_functions()
    1549bc8cc165 drm/amdkfd: add missing void argument to function kgd2kfd_init
    fdfb9ae26161 mm/sparsemem: fix 'mem_section' will never be NULL gcc 12 warning
    a0c0867f06b9 arm64: module: remove (NOLOAD) from linker script
    2bd5b0d56d7b mm: don't skip swap entry even if zap_details specified
    dfa87d9a5db3 mmc: mmci: stm32: correctly check all elements of sg list
    c645de49e971 mmc: mmci_sdmmc: Replace sg_dma_xxx macros
    0d99cce85e34 dmaengine: Revert "dmaengine: shdma: Fix runtime PM imbalance on error"
    9e6980c68cbf tools build: Use $(shell ) instead of `` to get embedded libperl's ccopts
    f0752ee5efdc tools build: Filter out options and warnings not supported by clang
    3c07cc242baf irqchip/gic-v3: Fix GICR_CTLR.RWP polling
    e44d6af17b15 perf: qcom_l2_pmu: fix an incorrect NULL check on list iterator
    55e1465ba795 ata: sata_dwc_460ex: Fix crash due to OOB write
    b0c4b3fc01ae arm64: patch_text: Fixup last cpu should be master
    44277c50fdba btrfs: fix qgroup reserve overflow the qgroup limit
    17f3e31c8603 x86/speculation: Restore speculation related MSRs during S3 resume
    0b8043e0fcea x86/pm: Save the MSR validity status at context setup
    25f506273b6a mm/mempolicy: fix mpol_new leak in shared_policy_replace
    c19d8de4e682 mmmremap.c: avoid pointless invalidate_range_start/end on mremap(old_size=0)
    73953dfa9d50 lz4: fix LZ4_decompress_safe_partial read out of bound
    3b3514388895 mmc: renesas_sdhi: don't overwrite TAP settings when HS400 tuning is complete
    0869cb9f6235 Revert "mmc: sdhci-xenon: fix annoying 1.8V regulator warning"
    c79c1846bdd7 perf session: Remap buf if there is no space for event
    9b6894db7c46 perf tools: Fix perf's libperf_print callback
    4ecef6f28aa1 SUNRPC: Handle low memory situations in call_status()
    9a0da98a36b4 SUNRPC: Handle ENOMEM in call_transmit_status()
    b6a4055036ee drbd: Fix five use after free bugs in get_initial_state
    a581b089216d bpf: Support dual-stack sockets in bpf_tcp_check_syncookie
    eb175e060699 spi: bcm-qspi: fix MSPI only access with bcm_qspi_exec_mem_op()
    034a92c6a810 qede: confirm skb is allocated before using
    7ee84d29f22d rxrpc: fix a race in rxrpc_exit_net()
    fee500c33534 net: openvswitch: don't send internal clone attribute to the userspace.
    c154cf184b2c ipv6: Fix stats accounting in ip6_pkt_drop
    fbe5f4c0dd34 dpaa2-ptp: Fix refcount leak in dpaa2_ptp_probe
    8a50937227c3 IB/rdmavt: add lock to call to rvt_error_qp to prevent a race condition
    1ef586a864df bnxt_en: reserve space inside receive page for skb_shared_info
    c539a6a5896e drm/imx: Fix memory leak in imx_pd_connector_get_modes
    cc9c2f51cd48 net: stmmac: Fix unset max_speed difference between DT and non-DT platforms
    f5064531c23a net: ipv4: fix route with nexthop object delete warning
    2b7d14c105dd net/tls: fix slab-out-of-bounds bug in decrypt_internal
    34a47f7ddb4f scsi: zorro7xx: Fix a resource leak in zorro7xx_remove_one()
    2133c422a103 Drivers: hv: vmbus: Fix potential crash on module unload
    c5e12c3a47db drm/amdgpu: fix off by one in amdgpu_gfx_kiq_acquire()
    00914290958d KVM: arm64: Check arm64_get_bp_hardening_data() didn't return NULL
    18e0097daf8c mm: fix race between MADV_FREE reclaim and blkdev direct IO read
    abb1f310e7f0 parisc: Fix patch code locking and flushing
    bab8e3b4f68a parisc: Fix CPU affinity for Lasi, WAX and Dino chips
    1b8a6d1bdac5 SUNRPC: Fix socket waits for write buffer space
    e19c3149a80e jfs: prevent NULL deref in diFree
    3504b0a17720 virtio_console: eliminate anonymous module_init & module_exit
    60ade478c965 serial: samsung_tty: do not unlock port->lock for uart_write_wakeup()
    14e6bab37373 NFS: swap-out must always use STABLE writes.
    66cf5de08460 NFS: swap IO handling is slightly different for O_DIRECT IO
    fa47286c010a SUNRPC/call_alloc: async tasks mustn't block waiting for memory
    e427cd0ad559 clk: Enforce that disjoints limits are invalid
    8a7462b5211c xen: delay xen_hvm_init_time_ops() if kdump is boot on vcpu>=32
    3f8f3a1c10e2 NFSv4: Protect the state recovery thread against direct reclaim
    96cdf2fdbe89 w1: w1_therm: fixes w1_seq for ds28ea00 sensors
    823f0364d4a4 clk: si5341: fix reported clk_rate when output divider is 2
    f4e16d12bc7c minix: fix bug when opening a file with O_DIRECT
    a95bbfea8f70 init/main.c: return 1 from handled __setup() functions
    b4be80aa4bda netlabel: fix out-of-bounds memory accesses
    3803d896ddd9 Bluetooth: Fix use after free in hci_send_acl
    8beb760f634e xtensa: fix DTC warning unit_address_format
    d41bdccb3c29 usb: dwc3: omap: fix "unbalanced disables for smps10_out1" on omap5evm
    5cf2ce8967b0 scsi: libfc: Fix use after free in fc_exch_abts_resp()
    0aeaadc52b05 MIPS: fix fortify panic when copying asm exception handlers
    c871b8374896 bnxt_en: Eliminate unintended link toggle during FW reset
    1166f5c139d5 tuntap: add sanity checks about msg_controllen in sendmsg
    c68dd44fb896 macvtap: advertise link netns via netlink
    060a485df4ec mips: ralink: fix a refcount leak in ill_acc_of_setup()
    1dd7569b8c70 net/smc: correct settings of RMB window update limit
    2fda284a3acb scsi: aha152x: Fix aha152x_setup() __setup handler return value
    a0ef536256c9 scsi: pm8001: Fix pm8001_mpi_task_abort_resp()
    a45af7e34091 drm/amdkfd: make CRAT table missing message informational only
    0320bac5801b dm ioctl: prevent potential spectre v1 gadget
    73dd98ac192d ipv4: Invalidate neighbour for broadcast address upon address addition
    f5e4f728d5c9 power: supply: axp288-charger: Set Vhold to 4.4V
    6e2dff272cb4 PCI: pciehp: Add Qualcomm quirk for Command Completed erratum
    4225947957f8 usb: ehci: add pci device support for Aspeed platforms
    ea057ac8c942 iommu/arm-smmu-v3: fix event handling soft lockup
    4e85f5ab589d PCI: aardvark: Fix support for MSI interrupts
    c0e9d868a1e0 drm/amdgpu: Fix recursive locking warning
    cee00fd8004f powerpc: Set crashkernel offset to mid of RMA region
    fbb7b033209c ipv6: make mc_forwarding atomic
    9f24efe239df power: supply: axp20x_battery: properly report current when discharging
    3575fa75da6c scsi: bfa: Replace snprintf() with sysfs_emit()
    9cd46ee37456 scsi: mvsas: Replace snprintf() with sysfs_emit()
    ca5da71a5838 bpf: Make dst_port field in struct bpf_sock 16-bit wide
    90dbc4c6649f powerpc: dts: t104xrdb: fix phy type for FMAN 4/5
    9388d8760997 ptp: replace snprintf with sysfs_emit
    4009f104b02b drm/amd/amdgpu/amdgpu_cs: fix refcount leak of a dma_fence obj
    c4e2f577271e ath5k: fix OOB in ath5k_eeprom_read_pcal_info_5111
    61ffe2183351 drm: Add orientation quirk for GPD Win Max
    01f700bae439 KVM: x86/svm: Clear reserved bits written to PerfEvtSeln MSRs
    a5476f8d359f ARM: 9187/1: JIVE: fix return value of __setup handler
    63efb9003069 riscv module: remove (NOLOAD)
    68a7bb69486e rtc: wm8350: Handle error for wm8350_register_irq
    d95e0367fdc5 ubifs: Rectify space amount budget for mkdir/tmpfile operations
    9e24d03dd4fe KVM: x86: Forbid VMM to set SYNIC/STIMER MSRs when SynIC wasn't activated
    1553126eccf4 KVM: x86/mmu: do compare-and-exchange of gPTE via the user address
    eb05ef70b621 openvswitch: Fixed nd target mask field in the flow dump.
    ce8043771fcd um: Fix uml_mconsole stop/go
    337eb9557035 ARM: dts: spear13xx: Update SPI dma properties
    4e48a6662356 ARM: dts: spear1340: Update serial node properties
    7f19400e5957 ASoC: topology: Allow TLV control to be either read or write
    32a76a557494 ubi: fastmap: Return error code if memory allocation fails in add_aeb()
    0c1a26c3d325 dt-bindings: spi: mxic: The interrupt property is not mandatory
    97ba943e9940 dt-bindings: mtd: nand-controller: Fix a comment in the examples
    a42ab650d33b dt-bindings: mtd: nand-controller: Fix the reg property description
    7d418a0a5626 bpf: Fix comment for helper bpf_current_task_under_cgroup()
    a075e95614f0 mm/usercopy: return 1 from hardened_usercopy __setup() handler
    abc0b4ea02f6 mm/memcontrol: return 1 from cgroup.memory __setup() handler
    2e16f48838fc mm/mmap: return 1 from stack_guard_gap __setup() handler
    d650ed0617e0 ASoC: soc-compress: Change the check for codec_dai
    7f19245c3647 powerpc/kasan: Fix early region not updated correctly
    cb249f8c00f4 ACPI: CPPC: Avoid out of bounds access when parsing _CPC data
    7d4a3c930d1d ARM: iop32x: offset IRQ numbers by 1
    d727fd32cbd1 ubi: Fix race condition between ctrl_cdev_ioctl and ubi_cdev_ioctl
    4f9a59cf842a ASoC: mediatek: mt6358: add missing EXPORT_SYMBOLs
    230987c2bbc5 pinctrl: nuvoton: npcm7xx: Use %zu printk format for ARRAY_SIZE()
    18455cc74e95 pinctrl: nuvoton: npcm7xx: Rename DS() macro to DSTR()
    9611d8ef6829 pinctrl: pinconf-generic: Print arguments for bias-pull-*
    b0c0f4057020 net: hns3: fix software vlan talbe of vlan 0 inconsistent with hardware
    2a548fbf09f3 gfs2: Make sure FITRIM minlen is rounded up to fs block size
    8d67f67361c0 rtc: check if __rtc_read_time was successful
    9a8835902eb6 XArray: Update the LRU list in xas_split()
    cbd110b8dd7a can: mcba_usb: properly check endpoint type
    2dfe9422d528 can: mcba_usb: mcba_usb_start_xmit(): fix double dev_kfree_skb in error path
    3e2852eda19e XArray: Fix xas_create_range() when multi-order entry present
    a840286f13df ubifs: rename_whiteout: correct old_dir size computing
    b80ccbec0e48 ubifs: Fix read out-of-bounds in ubifs_wbuf_write_nolock()
    1afe219e4a66 ubifs: setflags: Make dirtied_ino_d 8 bytes aligned
    786013ecbaed ubifs: Add missing iput if do_tmpfile() failed in rename whiteout
    37bdf1ad5925 ubifs: Fix deadlock in concurrent rename whiteout and inode writeback
    14276d38c89a ubifs: rename_whiteout: Fix double free for whiteout_ui->data
    01df5f7627f1 ASoC: SOF: Intel: Fix NULL ptr dereference when ENOMEM
    4c277c846a21 KVM: x86: fix sending PV IPI
    a1c03f11cc3c KVM: Prevent module exit until all VMs are freed
    8f608ee87ebf scsi: qla2xxx: Use correct feature type field during RFF_ID processing
    af744ef8f18e scsi: qla2xxx: Reduce false trigger to login
    7f9ce17a1d1b scsi: qla2xxx: Fix N2N inconsistent PLOGI
    2d087c7e55db scsi: qla2xxx: Fix missed DMA unmap for NVMe ls requests
    4a0a3c66a58e scsi: qla2xxx: Fix hang due to session stuck
    9d1651c8a40d scsi: qla2xxx: Fix incorrect reporting of task management failure
    2eb127417609 scsi: qla2xxx: Fix disk failure to rediscover
    8077a7162bc3 scsi: qla2xxx: Suppress a kernel complaint in qla_create_qpair()
    c478b2cde9b5 scsi: qla2xxx: Check for firmware dump already collected
    96391480abfe scsi: qla2xxx: Add devids and conditionals for 28xx
    08d04784ccc5 scsi: qla2xxx: Fix device reconnect in loop topology
    167debaeaaca scsi: qla2xxx: Fix warning for missing error code
    e67e9620a09c scsi: qla2xxx: Fix wrong FDMI data for 64G adapter
    8e561cbb7863 scsi: qla2xxx: Fix stuck session in gpdb
    f196d94cc7c2 powerpc: Fix build errors with newer binutils
    71ca99a50960 powerpc/lib/sstep: Fix build errors with newer binutils
    d42b045e92c2 powerpc/lib/sstep: Fix 'sthcx' instruction
    0af21531f5ed ALSA: hda/realtek: Add alc256-samsung-headphone fixup
    95d65bca6eb9 mmc: host: Return an error when ->enable_sdio_irq() ops is missing
    813553e4a91f media: hdpvr: initialize dev->worker at hdpvr_register_videodev
    236311be0976 media: Revert "media: em28xx: add missing em28xx_close_extension"
    3b36c05f68ba video: fbdev: sm712fb: Fix crash in smtcfb_write()
    11186875ba8f ARM: mmp: Fix failure to remove sram device
    dc958cd4c88c ARM: tegra: tamonten: Fix I2C3 pad setting
    691b0c0cb6df media: cx88-mpeg: clear interrupt status register before streaming video
    b239e9d52dbe ASoC: soc-core: skip zero num_dai component in searching dai name
    7d0afbc41b89 video: fbdev: udlfb: replace snprintf in show functions with sysfs_emit
    efe9631a76e6 video: fbdev: omapfb: panel-tpo-td043mtea1: Use sysfs_emit() instead of snprintf()
    ee7ce43367f3 video: fbdev: omapfb: panel-dsi-cm: Use sysfs_emit() instead of snprintf()
    046d9fd86bd8 ASoC: madera: Add dependencies on MFD
    46ac0e768dc7 ARM: dts: bcm2837: Add the missing L1/L2 cache information
    bf27f5dfcf82 ARM: dts: qcom: fix gic_irq_domain_translate warnings for msm8960
    3856562e940c video: fbdev: omapfb: acx565akm: replace snprintf with sysfs_emit
    53a2088a396c video: fbdev: cirrusfb: check pixclock to avoid divide by zero
    b19c7df304f5 video: fbdev: w100fb: Reset global state
    055cdd2e7b99 video: fbdev: nvidiafb: Use strscpy() to prevent buffer overflow
    fe41ad8be036 ntfs: add sanity check on allocation size
    5a016c053f42 ext4: don't BUG if someone dirty pages without asking ext4 first
    07150842fac9 spi: tegra20: Use of_device_get_match_data()
    0cccf9d4fb45 PM: core: keep irq flags in device_pm_check_callbacks()
    f24e2362d667 ACPI/APEI: Limit printable size of BERT table data
    931aff627469 Revert "Revert "block, bfq: honor already-setup queue merges""
    7a7b11d694ed lib/raid6/test/Makefile: Use $(pound) instead of \# for Make 4.3
    c7f6ae51b1b4 ACPICA: Avoid walking the ACPI Namespace if it is not there
    5117c9ff4c2e bfq: fix use-after-free in bfq_dispatch_request
    e464aafd3537 irqchip/nvic: Release nvic_base upon failure
    c159eb634e52 irqchip/qcom-pdc: Fix broken locking
    c345724f2b79 Fix incorrect type in assignment of ipv6 port for audit
    927649f3f379 loop: use sysfs_emit() in the sysfs xxx show()
    799f22279e11 selinux: use correct type for context length
    c4f5a678add5 block, bfq: don't move oom_bfqq
    f409e9d1780b pinctrl: npcm: Fix broken references to chip->parent_device
    f36dd10d1b95 gcc-plugins/stackleak: Exactly match strings instead of prefixes
    ddcdda888e14 LSM: general protection fault in legacy_parse_param
    1f316b42a8e3 lib/test: use after free in register_test_dev_kmod()
    7a2ba24cee9a net: dsa: bcm_sf2_cfp: fix an incorrect NULL check on list iterator
    910a98e5c1e5 NFSv4/pNFS: Fix another issue with a list iterator pointing to the head
    9acf05b4e7b5 net/x25: Fix null-ptr-deref caused by x25_disconnect
    d15a70fcda7b qlcnic: dcb: default to returning -EOPNOTSUPP
    8ba93ab509ec selftests: test_vxlan_under_vrf: Fix broken test case
    ae713d7d9987 net: phy: broadcom: Fix brcm_fet_config_init()
    ab2c789d1c0a xen: fix is_xen_pmu()
    d85841e4b2ff clk: Initialize orphan req_rate
    025c75ba3811 clk: qcom: gcc-msm8994: Fix gpll4 width
    f6f1c9a51e28 NFSv4.1: don't retry BIND_CONN_TO_SESSION on session error
    806ef544cf1a netfilter: nf_conntrack_tcp: preserve liberal flag in tcp options
    cec71a718ce1 jfs: fix divide error in dbNextAG
    b3ac1e01963d driver core: dd: fix return value of __setup handler
    1bb231de81fc firmware: google: Properly state IOMEM dependency
    e9f2a8c6428d kgdbts: fix return value of __setup handler
    16fe77f86aa5 kgdboc: fix return value of __setup handler
    7c617cb38c19 tty: hvc: fix return value of __setup handler
    0615a444c5dd pinctrl/rockchip: Add missing of_node_put() in rockchip_pinctrl_probe
    bc1e29a35147 pinctrl: nomadik: Add missing of_node_put() in nmk_pinctrl_probe
    27681f9e02e7 pinctrl: mediatek: paris: Fix pingroup pin config state readback
    e9eacc8952ea pinctrl: mediatek: paris: Fix "argument" argument type for mtk_pinconf_get()
    b348618c175e pinctrl: mediatek: Fix missing of_node_put() in mtk_pctrl_init
    6e0d69618863 staging: mt7621-dts: fix LEDs and pinctrl on GB-PC1 devicetree
    efc605469e47 NFS: remove unneeded check in decode_devicenotify_args()
    110c038779cc clk: tegra: tegra124-emc: Fix missing put_device() call in emc_ensure_emc_driver
    2b5e68095c43 clk: clps711x: Terminate clk_div_table with sentinel element
    166c0185f32f clk: loongson1: Terminate clk_div_table with sentinel element
    1d04467bbbd0 clk: actions: Terminate clk_div_table with sentinel element
    50b48ba439bc remoteproc: qcom_wcnss: Add missing of_node_put() in wcnss_alloc_memory_region
    b5625e7a16e3 remoteproc: qcom: Fix missing of_node_put in adsp_alloc_memory_region
    16ad029942bd clk: qcom: clk-rcg2: Update the frac table for pixel clock
    52592f9afbfe clk: qcom: clk-rcg2: Update logic to calculate D value for RCG
    b576488fa3b5 clk: imx7d: Remove audio_mclk_root_clk
    79467b956333 dma-debug: fix return value of __setup handlers
    fe334765e4bb NFS: Return valid errors from nfs2/3_decode_dirent()
    546604de8acc iio: adc: Add check for devm_request_threaded_irq
    1da082f728c7 serial: 8250: Fix race condition in RTS-after-send handling
    617d9c0b9806 serial: 8250_mid: Balance reference count for PCI DMA device
    61d3fdef61b9 phy: dphy: Correct lpx parameter and its derivatives(ta_{get,go,sure})
    84ee0c81dd28 clk: qcom: ipq8074: Use floor ops for SDCC1 clock
    dd719fca42e4 pinctrl: renesas: r8a77470: Reduce size for narrow VIN1 channel
    b82465c1ff4a staging:iio:adc:ad7280a: Fix handing of device address bit reversing.
    3ba0143128ee misc: alcor_pci: Fix an error handling path
    af1fdbbb7b22 pwm: lpc18xx-sct: Initialize driver data and hardware before pwmchip_add()
    996291d06851 mxser: fix xmit_buf leak in activate when LSR == 0xff
    58200dedbd10 mfd: asic3: Add missing iounmap() on error asic3_mfd_probe
    043b19701332 tipc: fix the timer expires after interval 100ms
    6e2e80b2e9be openvswitch: always update flow key after nat
    7a970dbb7d16 tcp: ensure PMTU updates are processed during fastopen
    b4725ad1e459 selftests/bpf/test_lirc_mode2.sh: Exit with proper code
    1c7b252a6053 i2c: mux: demux-pinctrl: do not deactivate a master that is not active
    41249fff5073 af_netlink: Fix shift out of bounds in group mask calculation
    874eca93966a Bluetooth: btmtksdio: Fix kernel oops in btmtksdio_interrupt
    2fe415601b2d USB: storage: ums-realtek: fix error code in rts51x_read_mem()
    94c6ac22abcd bpf, sockmap: Fix double uncharge the mem of sk_msg
    244ce90c8d0b bpf, sockmap: Fix more uncharged while msg has more_data
    6d03722c34d9 bpf, sockmap: Fix memleak in tcp_bpf_sendmsg while sk msg is full
    0174a89663a5 RDMA/mlx5: Fix memory leak in error flow for subscribe event routine
    9b08d211db4c mtd: rawnand: atmel: fix refcount issue in atmel_nand_controller_init
    443121c9948d MIPS: RB532: fix return value of __setup handler
    9a9a62846c15 vxcan: enable local echo for sent CAN frames
    6f259b1a4ab0 powerpc: 8xx: fix a return value error in mpc8xx_pic_init
    d87803ba6be8 selftests/bpf: Make test_lwt_ip_encap more stable and faster
    ac6edd6fcbf5 mfd: mc13xxx: Add check for mc13xxx_irq_request
    d2577dc2b3c3 powerpc/sysdev: fix incorrect use to determine if list is empty
    7192df97a018 mips: DEC: honor CONFIG_MIPS_FP_SUPPORT=n
    10705a430557 PCI: Reduce warnings on possible RW1C corruption
    90bec38f6a4c power: supply: wm8350-power: Add missing free in free_charger_irq
    a16d8f4191a7 power: supply: wm8350-power: Handle error for wm8350_register_irq
    c7032923159c i2c: xiic: Make bus names unique
    6f41e4a69ba3 hv_balloon: rate-limit "Unhandled message" warning
    c00a91aca237 KVM: x86/emulator: Defer not-present segment check in __load_segment_descriptor()
    5f43ec383eba KVM: x86: Fix emulation in writing cr8
    e91ba23f55cf powerpc/Makefile: Don't pass -mcpu=powerpc64 when building 32-bit
    3c660fa0f905 libbpf: Skip forward declaration when counting duplicated type names
    b62e615a619d bpf, arm64: Feed byte-offset into bpf line info
    8f3192a241d1 bpf, arm64: Call build_prologue() first in first JIT pass
    54bc98a0ab2b drm/bridge: cdns-dsi: Make sure to to create proper aliases for dt
    30c5cf4bf219 scsi: hisi_sas: Change permission of parameter prot_mask
    e2cd206815a6 power: supply: bq24190_charger: Fix bq24190_vbus_is_enabled() wrong false return
    a72507070188 drm/tegra: Fix reference leak in tegra_dsi_ganged_probe
    cc16d0bc1c69 ext2: correct max file size computing
    b689622cc42a TOMOYO: fix __setup handlers return values
    aa7981012a98 drm/amd/display: Remove vupdate_int_entry definition
    765674e3b301 scsi: pm8001: Fix abort all task initialization
    442685f95296 scsi: pm8001: Fix payload initialization in pm80xx_set_thermal_config()
    e7336d47759d scsi: pm8001: Fix command initialization in pm8001_chip_ssp_tm_req()
    898c73387e8f scsi: pm8001: Fix command initialization in pm80XX_send_read_log()
    5e3359ed0944 dm crypt: fix get_key_size compiler warning if !CONFIG_KEYS
    37e847b674f1 iwlwifi: mvm: Fix an error code in iwl_mvm_up()
    4ad7d29ee42c iwlwifi: Fix -EIO error code that is never returned
    770d42fff12d dax: make sure inodes are flushed before destroy cache
    c10980c522d8 IB/cma: Allow XRC INI QPs to set their local ACK timeout
    2eaa9d86e007 drm/amd/display: Add affected crtcs to atomic state for dsc mst unplug
    8ae97a595b84 iommu/ipmmu-vmsa: Check for error num after setting mask
    a29ce9592cf6 HID: i2c-hid: fix GET/SET_REPORT for unnumbered reports
    41ed61364285 power: supply: ab8500: Fix memory leak in ab8500_fg_sysfs_init
    af5ad6e8370b PCI: aardvark: Fix reading PCI_EXP_RTSTA_PME bit on emulated bridge
    93b47d22d6a9 net: dsa: mv88e6xxx: Enable port policy support on 6097
    b03c06171b6e mt76: mt7615: check sta_rates pointer in mt7615_sta_rate_tbl_update
    eb5932160e37 mt76: mt7603: check sta_rates pointer in mt7603_sta_rate_tbl_update
    d2ee8da9f72d powerpc/perf: Don't use perf_hw_context for trace IMC PMU
    135eb4e2bed1 ray_cs: Check ioremap return value
    3be1bb175f2c power: reset: gemini-poweroff: Fix IRQ check in gemini_poweroff_probe
    9a0e270c40ae i40e: don't reserve excessive XDP_PACKET_HEADROOM on XSK Rx to skb
    5607badbb145 KVM: PPC: Fix vmx/vsx mixup in mmio emulation
    4d244b731188 ath9k_htc: fix uninit value bugs
    57f4ad5e286f drm/amd/display: Fix a NULL pointer dereference in amdgpu_dm_connector_add_common_modes()
    1feb6ff89d7f drm/edid: Don't clear formats if using deep color
    0d0ee651e72c mtd: rawnand: gpmi: fix controller timings setting
    750d2dc19f25 mtd: onenand: Check for error irq
    d58d281d6a3f Bluetooth: hci_serdev: call init_rwsem() before p->open()
    5d50f851dd30 udmabuf: validate ubuf->pagecount
    2cf7d537d330 ath10k: fix memory overwrite of the WoWLAN wakeup packet pattern
    820e469a2f37 drm/bridge: Add missing pm_runtime_disable() in __dw_mipi_dsi_probe
    e7a0c8546f74 drm/bridge: Fix free wrong object in sii8620_init_rcp_input_dev
    f419751373a5 ASoC: msm8916-wcd-analog: Fix error handling in pm8916_wcd_analog_spmi_probe
    1f31073b7772 mmc: davinci_mmc: Handle error for clk_enable
    93476f9f8277 ASoC: msm8916-wcd-digital: Fix missing clk_disable_unprepare() in msm8916_wcd_digital_probe
    9e1fdf18fecb ASoC: imx-es8328: Fix error return code in imx_es8328_probe()
    67e12f1cb2f9 ASoC: mxs: Fix error handling in mxs_sgtl5000_probe
    ed41d104be54 ASoC: dmaengine: do not use a NULL prepare_slave_config() callback
    29e91a49b6fb ivtv: fix incorrect device_caps for ivtvfb
    0342da635054 video: fbdev: omapfb: Add missing of_node_put() in dvic_probe_of
    58e42ee4a022 ASoC: fsi: Add check for clk_enable
    ea9adaa598ec ASoC: wm8350: Handle error for wm8350_register_irq
    0325193cf40d ASoC: atmel: Add missing of_node_put() in at91sam9g20ek_audio_probe
    3cc050df73e3 media: stk1160: If start stream fails, return buffers with VB2_BUF_STATE_QUEUED
    97398470c9b6 arm64: dts: rockchip: Fix SDIO regulator supply properties on rk3399-firefly
    7025f40690a2 ALSA: firewire-lib: fix uninitialized flag for AV/C deferred transaction
    fd5dda439e1c memory: emif: check the pointer temp in get_device_details()
    0ead05f7218f memory: emif: Add check for setup_interrupts
    68a69ad8df95 ASoC: soc-compress: prevent the potentially use of null pointer
    af6e1d11f758 ASoC: atmel_ssc_dai: Handle errors for clk_enable
    fd0c4082fd14 ASoC: mxs-saif: Handle errors for clk_enable
    5847873140e6 printk: fix return value of printk.devkmsg __setup handler
    38bc92ae39b1 arm64: dts: broadcom: Fix sata nodename
    9873232fde53 arm64: dts: ns2: Fix spi-cpol and spi-cpha property
    c6475df1e7bf ALSA: spi: Add check for clk_enable()
    e0cfb41d4635 ASoC: ti: davinci-i2s: Add check for clk_enable()
    3905742f93b4 ASoC: rt5663: check the return value of devm_kzalloc() in rt5663_parse_dp()
    a975000e7aa3 uaccess: fix nios2 and microblaze get_user_8()
    14cd5a8e61c6 media: usb: go7007: s2250-board: fix leak in probe()
    92f84aa82dfa media: em28xx: initialize refcount before kref_get
    c6f0999461e6 media: video/hdmi: handle short reads of hdmi info frame.
    a9d0bb298880 ARM: dts: imx: Add missing LVDS decoder on M53Menlo
    cac1473d83e4 soc: ti: wkup_m3_ipc: Fix IRQ check in wkup_m3_ipc_probe
    fb7f2eabfe18 arm64: dts: qcom: sm8150: Correct TCS configuration for apps rsc
    583fcb66ab17 soc: qcom: aoss: remove spurious IRQF_ONESHOT flags
    755dbc3d7378 soc: qcom: rpmpd: Check for null return of devm_kcalloc
    12081a152046 ARM: dts: qcom: ipq4019: fix sleep clock
    547d36fa4100 video: fbdev: fbcvt.c: fix printing in fb_cvt_print_name()
    125d10f0bef8 video: fbdev: atmel_lcdfb: fix an error code in atmel_lcdfb_probe()
    da8b269cc0a2 video: fbdev: smscufx: Fix null-ptr-deref in ufx_usb_probe()
    4d847e455d0b media: aspeed: Correct value for h-total-pixels
    bd342c7bef23 media: hantro: Fix overfill bottom register field name
    db1b3b99d610 media: coda: Fix missing put_device() call in coda_get_vdoa_data
    b0f6b41490a7 media: bttv: fix WARNING regression on tunerless devices
    0478ccdc8ea0 f2fs: fix to avoid potential deadlock
    005f9cdab70c f2fs: fix missing free nid in f2fs_handle_failed_inode
    a2e534c6a06f perf/x86/intel/pt: Fix address filter config for 32-bit kernel
    015d31165da3 perf/core: Fix address filter parser for multiple filters
    841f5b235d69 sched/debug: Remove mpol_get/put and task_lock/unlock from sched_show_numa
    715a34317255 clocksource: acpi_pm: fix return value of __setup handler
    4c0173521db1 hwmon: (pmbus) Add Vin unit off handling
    acba28618203 crypto: ccp - ccp_dmaengine_unregister release dma channels
    39a521faf426 ACPI: APEI: fix return value of __setup handlers
    8dc887ae33d2 clocksource/drivers/timer-of: Check return value of of_iomap in timer_of_base_init()
    b305975a6625 crypto: vmx - add missing dependencies
    b7f3e230ca45 hwrng: atmel - disable trng on failure path
    63266a148888 PM: suspend: fix return value of __setup handler
    6c4c026c3d91 PM: hibernate: fix __setup handler error handling
    84fe3ca6e791 block: don't delete queue kobject before its children
    b68d1742f420 hwmon: (sch56xx-common) Replace WDOG_ACTIVE with WDOG_HW_RUNNING
    bf78aca8e41d hwmon: (pmbus) Add mutex to regulator ops
    00d67f54b830 spi: pxa2xx-pci: Balance reference count for PCI DMA device
    40e6d5d1de06 crypto: ccree - don't attempt 0 len DMA mappings
    c3a5acf91cb9 audit: log AUDIT_TIME_* records only from rules
    152ebc0ee9b4 selftests/x86: Add validity check and allow field splitting
    f8a3de8d7c2f spi: tegra114: Add missing IRQ check in tegra_spi_probe
    e5e748a6ff11 crypto: mxs-dcp - Fix scatterlist processing
    30d3f45bcfa7 crypto: authenc - Fix sleep in atomic context in decrypt_tail
    9b19022137e8 regulator: qcom_smd: fix for_each_child.cocci warnings
    accf175d0c54 PCI: pciehp: Clear cmd_busy bit in polling mode
    a92f72055486 brcmfmac: pcie: Fix crashes due to early IRQs
    51fffd722ef0 brcmfmac: pcie: Replace brcmf_pcie_copy_mem_todev with memcpy_toio
    d0ab87f8dcdf brcmfmac: pcie: Release firmwares in the brcmf_pcie_setup error path
    2c894b12b206 brcmfmac: firmware: Allocate space for default boardrev in nvram
    34a57be0f9f0 xtensa: fix xtensa_wsr always writing 0
    54c9fb17bef1 xtensa: fix stop_machine_cpuslocked call in patch_text
    4df9d88a9c54 media: davinci: vpif: fix unbalanced runtime PM get
    28859c3a7782 DEC: Limit PMAX memory probing to R3k systems
    baa4aa800d32 crypto: rsa-pkcs1pad - fix buffer overread in pkcs1pad_verify_complete()
    058b2e59dbf5 crypto: rsa-pkcs1pad - restore signature length check
    7973dc9118ba crypto: rsa-pkcs1pad - correctly get hash from source scatterlist
    002288800e10 lib/raid6/test: fix multiple definition linking error
    e73efa5ad5d2 thermal: int340x: Increase bitmap size
    5d553ed5c5d4 carl9170: fix missing bit-wise or operator for tx_params
    55f078dc6620 ARM: dts: exynos: add missing HDMI supplies on SMDK5420
    0e0d9bd6be8d ARM: dts: exynos: add missing HDMI supplies on SMDK5250
    a77dd759bd71 ARM: dts: exynos: fix UART3 pins configuration in Exynos5250
    2fafe8b57c0d ARM: dts: at91: sama5d2: Fix PMERRLOC resource size
    51186190c4e8 video: fbdev: atari: Atari 2 bpp (STe) palette bugfix
    478154be3a8c video: fbdev: sm712fb: Fix crash in smtcfb_read()
    67643b89fbe5 drm/edid: check basic audio support on CEA extension block
    3f91687e6e5d block: don't merge across cgroup boundaries if blkcg is enabled
    8d3a7b206458 mailbox: tegra-hsp: Flush whole channel
    28c8fd84bea1 drivers: hamradio: 6pack: fix UAF bug caused by mod_timer()
    5217ae080efd ACPI: properties: Consistently return -ENOENT if there are no more references
    f3ec0c9db5d3 udp: call udp_encap_enable for v6 sockets when enabling encap
    11dc8286f9f6 powerpc/kvm: Fix kvm_use_magic_page
    ded627763026 drbd: fix potential silent data corruption
    35b72d8e2c8e mm/kmemleak: reset tag when compare object pointer
    d102fcacfcf3 mm,hwpoison: unmap poisoned page before invalidation
    099553a1a87f ALSA: hda/realtek: Fix audio regression on Mi Notebook Pro 2020
    a86bde89304a ALSA: cs4236: fix an incorrect NULL check on list iterator
    848977412065 Revert "Input: clear BTN_RIGHT/MIDDLE on buttonpads"
    097479aeb214 riscv: Fix fill_callchain return value
    c82cbbefc6e6 qed: validate and restrict untrusted VFs vlan promisc mode
    5081cbfb62d2 qed: display VF trust config
    930a3ed5d8d0 scsi: libsas: Fix sas_ata_qc_issue() handling of NCQ NON DATA commands
    ae2a271ed562 mempolicy: mbind_range() set_policy() after vma_merge()
    d1313f5e8fe5 mm: invalidate hwpoison page cache page in fault path
    2efe956a74dc mm/pages_alloc.c: don't create ZONE_MOVABLE beyond the end of a node
    455f4a23490b jffs2: fix memory leak in jffs2_scan_medium
    0978e9af4559 jffs2: fix memory leak in jffs2_do_mount_fs
    30bf7244acf3 jffs2: fix use-after-free in jffs2_clear_xattr_subsystem
    e27caad38b59 can: ems_usb: ems_usb_start_xmit(): fix double dev_kfree_skb() in error path
    00a856fa6976 spi: mxic: Fix the transmit path
    e05221d20153 pinctrl: samsung: drop pin banks references on error paths
    0996eaaddfe4 f2fs: fix to do sanity check on .cp_pack_total_block_count
    f1d5946d47c0 f2fs: quota: fix loop condition at f2fs_quota_sync()
    947ca26390d2 f2fs: fix to unlock page correctly in error path of is_alive()
    ce1aa09cc14e NFSD: prevent integer overflow on 32 bit systems
    85259340fc9b NFSD: prevent underflow in nfssvc_decode_writeargs()
    1cfeeeee8cf0 SUNRPC: avoid race between mod_timer() and del_timer_sync()
    1a1e73e9add7 HID: intel-ish-hid: Use dma_alloc_coherent for firmware update
    beb7d969063a Documentation: update stable tree link
    20de1038e245 Documentation: add link to stable release candidate tree
    d312c0035eb4 KEYS: fix length validation in keyctl_pkey_params_get_2()
    2458ecd21f29 ptrace: Check PTRACE_O_SUSPEND_SECCOMP permission on PTRACE_SEIZE
    8a609c88fe3c clk: uniphier: Fix fixed-rate initialization
    9d97610e74e4 greybus: svc: fix an error handling bug in gb_svc_hello()
    468757502e2f iio: inkern: make a best effort on offset calculation
    be2b89a909b3 iio: inkern: apply consumer scale when no channel scale is available
    5be8a07b9574 iio: inkern: apply consumer scale on IIO_VAL_INT cases
    c459b2794597 iio: afe: rescale: use s64 for temporary scale calculations
    576a1ce64c62 coresight: Fix TRCCONFIGR.QE sysfs interface
    d8f98a23b4ad xhci: fix uninitialized string returned by xhci_decode_ctrl_ctx()
    b310e82e779f xhci: make xhci_handshake timeout for xhci_reset() adjustable
    a771cc784a9c xhci: fix runtime PM imbalance in USB2 resume
    b5a7ab0e1a66 USB: usb-storage: Fix use of bitfields for hardware data in ene_ub6250.c
    212765c94fc9 virtio-blk: Use blk_validate_block_size() to validate block size
    40f282870d6c block: Add a helper to validate the block size
    a27ed2f3695b tpm: fix reference counting for struct tpm_chip
    631bb18e8371 iommu/iova: Improve 32-bit free space estimate
    2e2dee5e226b net: dsa: microchip: add spi_device_id tables
    ef388db2fe35 af_key: add __GFP_ZERO flag for compose_sadb_supported in function pfkey_register
    0cdb512da072 spi: Fix erroneous sgs value with min_t()
    ab951c9c23a3 net:mcf8390: Use platform_get_irq() to get the interrupt
    e62e6c2d7aa8 spi: Fix invalid sgs value
    96f9c386fec2 ethernet: sun: Free the coherent when failing in probing
    aa3c3746e781 virtio_console: break out of buf poll on remove
    291efbad3d6e xfrm: fix tunnel model fragmentation behavior
    a83df90a3b61 HID: logitech-dj: add new lightspeed receiver id
    5c727ba42ca3 netdevice: add the case if dev is NULL
    7e9c9e3f626a USB: serial: simple: add Nokia phone driver
    80e5bf89a895 USB: serial: pl2303: add IBM device IDs
    6bfc5377a210 swiotlb: fix info leak with DMA_FROM_DEVICE

Signed-off-by: Bruce Ashfield <bruce.ashfield@gmail.com>
---
 .../linux/linux-yocto-rt_5.4.bb               |  6 ++---
 .../linux/linux-yocto-tiny_5.4.bb             |  8 +++----
 meta/recipes-kernel/linux/linux-yocto_5.4.bb  | 22 +++++++++----------
 3 files changed, 18 insertions(+), 18 deletions(-)

diff --git a/meta/recipes-kernel/linux/linux-yocto-rt_5.4.bb b/meta/recipes-kernel/linux/linux-yocto-rt_5.4.bb
index 7a446830b4..764a875699 100644
--- a/meta/recipes-kernel/linux/linux-yocto-rt_5.4.bb
+++ b/meta/recipes-kernel/linux/linux-yocto-rt_5.4.bb
@@ -11,13 +11,13 @@ python () {
         raise bb.parse.SkipRecipe("Set PREFERRED_PROVIDER_virtual/kernel to linux-yocto-rt to enable it")
 }
 
-SRCREV_machine ?= "670b48317a932c46ef12c470cfbcb13d1c6c8665"
-SRCREV_meta ?= "649c66422555d396ba322d260418691ff40243cd"
+SRCREV_machine ?= "5b157591793811a9d226866d9f8acde817339fe9"
+SRCREV_meta ?= "6a12bea7312868626062fe8206ce3c5bcb7c9101"
 
 SRC_URI = "git://git.yoctoproject.org/linux-yocto.git;branch=${KBRANCH};name=machine \
            git://git.yoctoproject.org/yocto-kernel-cache;type=kmeta;name=meta;branch=yocto-5.4;destsuffix=${KMETA}"
 
-LINUX_VERSION ?= "5.4.188"
+LINUX_VERSION ?= "5.4.190"
 
 LIC_FILES_CHKSUM = "file://COPYING;md5=bbea815ee2795b2f4230826c0c6b8814"
 
diff --git a/meta/recipes-kernel/linux/linux-yocto-tiny_5.4.bb b/meta/recipes-kernel/linux/linux-yocto-tiny_5.4.bb
index aeaaafface..7be0f31eb0 100644
--- a/meta/recipes-kernel/linux/linux-yocto-tiny_5.4.bb
+++ b/meta/recipes-kernel/linux/linux-yocto-tiny_5.4.bb
@@ -6,7 +6,7 @@ KCONFIG_MODE = "--allnoconfig"
 
 require recipes-kernel/linux/linux-yocto.inc
 
-LINUX_VERSION ?= "5.4.188"
+LINUX_VERSION ?= "5.4.190"
 LIC_FILES_CHKSUM = "file://COPYING;md5=bbea815ee2795b2f4230826c0c6b8814"
 
 DEPENDS += "${@bb.utils.contains('ARCH', 'x86', 'elfutils-native', '', d)}"
@@ -15,9 +15,9 @@ DEPENDS += "openssl-native util-linux-native"
 KMETA = "kernel-meta"
 KCONF_BSP_AUDIT_LEVEL = "2"
 
-SRCREV_machine_qemuarm ?= "57715fdff2a2f4ed0e6a62ebea57b154773659b8"
-SRCREV_machine ?= "793f9b84d0d31e370719bdb15572de0cd09db67c"
-SRCREV_meta ?= "649c66422555d396ba322d260418691ff40243cd"
+SRCREV_machine_qemuarm ?= "25567bdff9816844f3b9e09cdb490d7c7bfb4edb"
+SRCREV_machine ?= "36a8131ee4418c5f8883ff165833776746e61e84"
+SRCREV_meta ?= "6a12bea7312868626062fe8206ce3c5bcb7c9101"
 
 PV = "${LINUX_VERSION}+git${SRCPV}"
 
diff --git a/meta/recipes-kernel/linux/linux-yocto_5.4.bb b/meta/recipes-kernel/linux/linux-yocto_5.4.bb
index c590ef0108..23a5abb2c6 100644
--- a/meta/recipes-kernel/linux/linux-yocto_5.4.bb
+++ b/meta/recipes-kernel/linux/linux-yocto_5.4.bb
@@ -12,16 +12,16 @@ KBRANCH_qemux86  ?= "v5.4/standard/base"
 KBRANCH_qemux86-64 ?= "v5.4/standard/base"
 KBRANCH_qemumips64 ?= "v5.4/standard/mti-malta64"
 
-SRCREV_machine_qemuarm ?= "883e57c5912406d47b5b6ca1c11338656014b37c"
-SRCREV_machine_qemuarm64 ?= "59d9b7fabfec76f02a45f5e0e066a4e01bc8933a"
-SRCREV_machine_qemumips ?= "27beb64f8b5e8e3ff55912e0f1bfdade981fcf8b"
-SRCREV_machine_qemuppc ?= "0625f7dbae45fec70f37afae4b1eb6a23f2c9ed3"
-SRCREV_machine_qemuriscv64 ?= "d47303abd67e589778c28f3ccc688a0e12ba5692"
-SRCREV_machine_qemux86 ?= "d47303abd67e589778c28f3ccc688a0e12ba5692"
-SRCREV_machine_qemux86-64 ?= "d47303abd67e589778c28f3ccc688a0e12ba5692"
-SRCREV_machine_qemumips64 ?= "263f292c32e84da67fe48d92013b8a97eafff310"
-SRCREV_machine ?= "d47303abd67e589778c28f3ccc688a0e12ba5692"
-SRCREV_meta ?= "649c66422555d396ba322d260418691ff40243cd"
+SRCREV_machine_qemuarm ?= "c4efc0b0650c3d2a7a321a6ba5fe612b7d14bd3f"
+SRCREV_machine_qemuarm64 ?= "c5b5ccb7df29d44c4e3d71d0e2ccf3e8a462a7f0"
+SRCREV_machine_qemumips ?= "addad5fd9e5c386a4b06938ae73de42292d552be"
+SRCREV_machine_qemuppc ?= "ee0f3e8a7de91b0520da532f87f8deeb91a92e27"
+SRCREV_machine_qemuriscv64 ?= "d9d6c6e0d0a9a52f9acd488036a5ed6409352f44"
+SRCREV_machine_qemux86 ?= "d9d6c6e0d0a9a52f9acd488036a5ed6409352f44"
+SRCREV_machine_qemux86-64 ?= "d9d6c6e0d0a9a52f9acd488036a5ed6409352f44"
+SRCREV_machine_qemumips64 ?= "971edcacc688c0deb078f4643125c5c5372010c5"
+SRCREV_machine ?= "d9d6c6e0d0a9a52f9acd488036a5ed6409352f44"
+SRCREV_meta ?= "6a12bea7312868626062fe8206ce3c5bcb7c9101"
 
 # remap qemuarm to qemuarma15 for the 5.4 kernel
 # KMACHINE_qemuarm ?= "qemuarma15"
@@ -30,7 +30,7 @@ SRC_URI = "git://git.yoctoproject.org/linux-yocto.git;name=machine;branch=${KBRA
            git://git.yoctoproject.org/yocto-kernel-cache;type=kmeta;name=meta;branch=yocto-5.4;destsuffix=${KMETA}"
 
 LIC_FILES_CHKSUM = "file://COPYING;md5=bbea815ee2795b2f4230826c0c6b8814"
-LINUX_VERSION ?= "5.4.188"
+LINUX_VERSION ?= "5.4.190"
 
 DEPENDS += "${@bb.utils.contains('ARCH', 'x86', 'elfutils-native', '', d)}"
 DEPENDS += "openssl-native util-linux-native"
-- 
2.19.1


