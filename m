Return-Path: <bruce.ashfield@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 561C1C6FD20
	for <webhook@archiver.kernel.org>; Fri, 24 Mar 2023 15:09:07 +0000 (UTC)
Received: from mail-qv1-f46.google.com (mail-qv1-f46.google.com [209.85.219.46])
 by mx.groups.io with SMTP id smtpd.web10.104397.1679670536821285823
 for <openembedded-core@lists.openembedded.org>;
 Fri, 24 Mar 2023 08:08:57 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20210112 header.b=TC+Ct127;
 spf=pass (domain: gmail.com, ip: 209.85.219.46, mailfrom: bruce.ashfield@gmail.com)
Received: by mail-qv1-f46.google.com with SMTP id oe8so1788431qvb.6
        for <openembedded-core@lists.openembedded.org>; Fri, 24 Mar 2023 08:08:56 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112; t=1679670536;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=2QTtzUyDvcQ6EtT1u1o6QkeANVj1BDg+lr8Vzo34h3U=;
        b=TC+Ct127k2hJ+EnhkxSMhParCIVSYCPPE9SKXcxMUDDPPhFnNXtrGKox/HmarMfWSa
         1hpVVmjWr+EVxrSd0KvjaZDG021Li2lU6bKd7gzyQcyb+x+kf5L/hII2mFue7yqwVXtA
         faCd4z2FQzggtH9QTX4BxhHllgjGFqJiVFA/II0ZurPBcCSQwJOXgtE6ntUo4EUB0o0I
         l5+S+YEIc8/4zfjDoss0O7BAHlSNdSmMxE1owPbYHKkHhlYLoU/YeRdqkvEFYh/CwlC+
         LGw3rwvhiF9Os0NOVEt0/pcGmQyzwYCaLgUc6Gu+2fD3jNG0UM9Bh9JVY0/KP/cNnW+S
         EWcw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112; t=1679670536;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=2QTtzUyDvcQ6EtT1u1o6QkeANVj1BDg+lr8Vzo34h3U=;
        b=bDuSKA4NL90eaMwr/LXCa+WXUjR+ZpKELpp5dVKVfKOpRBtof2ritdHWkilWIOTuzQ
         2E0uSIcBAWqdNUgEBXsWy6vGhumACovJZZ1z5+g5dfSp5IxELp0ST4Uv6HQLWQg85OQX
         khgidxXAXWlG17mloTyWYMC5/G2fxq/ej4P5ffpQMM51FNKZvp+CUJ6n9jnOWJ3a9iQg
         I5FSQ6GvgFcb2u2NhdMZ2jLh4TxjS1V6yO+GguzoCMWH56EJKwGhszTRj9If5BdIgNRa
         AKRpMgywwL79qX9FRlngu0IZW2MqtH1N9HYxcKNagfb3XLkeTlpjd4OLx2orvxk3sCpw
         Kp4A==
X-Gm-Message-State: AAQBX9cQuRaHxUUZLyhaR6Q38zSs5eXf0QXZMovSyoNU+bMEpl6p4Fp1
	Jv7OyyAMjf7eZgf+PxnIINSk9iFPOF3Jyw==
X-Google-Smtp-Source: AKy350aFGC+qOSJrP8oq7JLTb8i4FtvcyWio1I4PaHtHRXFPlpSzr5j1MwHNvc+xOX8bHuz7NwcoqA==
X-Received: by 2002:a05:6214:2028:b0:5a8:b66a:858 with SMTP id 8-20020a056214202800b005a8b66a0858mr6068465qvf.46.1679670535298;
        Fri, 24 Mar 2023 08:08:55 -0700 (PDT)
Received: from build.lan (cpe7c9a54441c1f-cm7c9a54441c1d.cpe.net.cable.rogers.com. [173.34.238.88])
        by smtp.gmail.com with ESMTPSA id mf10-20020a0562145d8a00b005dd8b9345e8sm746219qvb.128.2023.03.24.08.08.54
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 24 Mar 2023 08:08:54 -0700 (PDT)
From: bruce.ashfield@gmail.com
To: richard.purdie@linuxfoundation.org
Cc: openembedded-core@lists.openembedded.org
Subject: [PATCH 4/7] linux-yocto/5.15: update to v5.15.103
Date: Fri, 24 Mar 2023 11:08:45 -0400
Message-Id: <893b2b26cfcb4c463a4586d890fc1e99ef130987.1679670268.git.bruce.ashfield@gmail.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <cover.1679670268.git.bruce.ashfield@gmail.com>
References: <cover.1679670268.git.bruce.ashfield@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Fri, 24 Mar 2023 15:09:07 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/179045

From: Bruce Ashfield <bruce.ashfield@gmail.com>

Updating  to the latest korg -stable release that comprises
the following commits:

    8020ae3c051d Linux 5.15.103
    10a72c677bce Makefile: use -gdwarf-{4|5} for assembler for DEBUG_INFO_DWARF{4|5}
    6e7bc50f97c9 KVM: VMX: Fix crash due to uninitialized current_vmcs
    61e5087231f3 KVM: VMX: Introduce vmx_msr_bitmap_l01_changed() helper
    1f47cba9364f KVM: nVMX: Don't use Enlightened MSR Bitmap for L3
    2153dd644ce4 fs: hold writers when changing mount's idmapping
    8c3be6925a92 UML: define RUNTIME_DISCARD_EXIT
    f616fa79d536 xfs: remove xfs_setattr_time() declaration
    5588657f418c KVM: fix memoryleak in kvm_init()
    4441a9009193 tools bpftool: Fix compilation error with new binutils
    1c27fab24333 tools bpf_jit_disasm: Fix compilation error with new binutils
    97f005c0bdba tools perf: Fix compilation error with new binutils
    451c9d7b1616 tools include: add dis-asm-compat.h to handle version differences
    51b99dc38c1a tools build: Add feature test for init_disassemble_info API changes
    381492ef0c51 sh: define RUNTIME_DISCARD_EXIT
    1e49bb9ba912 s390: define RUNTIME_DISCARD_EXIT to fix link error with GNU ld < 2.36
    d517faf3db23 powerpc/vmlinux.lds: Don't discard .rela* for relocatable builds
    4e6708a0f36e powerpc/vmlinux.lds: Define RUNTIME_DISCARD_EXIT
    0bfde8c9bb27 arch: fix broken BuildID for arm64 and riscv
    560a2744cbbf ext4: block range must be validated before use in ext4_mb_clear_bb()
    270422f3e183 ext4: add strict range checks while freeing blocks
    2da16af37847 ext4: add ext4_sb_block_valid() refactored out of ext4_inode_block_valid()
    09546886a0ea ext4: refactor ext4_free_blocks() to pull out ext4_mb_clear_bb()
    48302ee67dd7 filelocks: use mount idmapping for setlease permission check
    513572bb89e8 media: rc: gpio-ir-recv: add remove function
    5f328c9d32b1 media: ov5640: Fix analogue gain control
    4cb302546556 scripts: handle BrokenPipeError for python scripts
    405ec99d1d25 PCI: Add SolidRun vendor ID
    2c75e258adb9 macintosh: windfarm: Use unsigned type for 1-bit bitfields
    6c6f956c9295 alpha: fix R_ALPHA_LITERAL reloc for large modules
    adb939031af3 powerpc/kcsan: Exclude udelay to prevent recursive instrumentation
    e3a62a35f903 powerpc/iommu: fix memory leak with using debugfs_lookup()
    93aa548a339c MIPS: Fix a compilation issue
    e69d841d143b fs: use consistent setgid checks in is_sxid()
    78eecf2e5cd4 attr: use consistent sgid stripping checks
    449badcf876d attr: add setattr_should_drop_sgid()
    7e8a9b53141e fs: move should_remove_suid()
    93395e1184ed attr: add in_group_or_capable()
    0123712492f6 fs: move S_ISGID stripping into the vfs_*() helpers
    9c3a620bbf0c fs: add mode_strip_sgid() helper
    79821ab3284a xfs: set prealloc flag in xfs_alloc_file_space()
    a881c1ef16f1 xfs: fallocate() should call file_modified()
    f8937e4d1d46 xfs: remove XFS_PREALLOC_SYNC
    95aab524e12e xfs: use setattr_copy to set vfs inode attributes
    2115c14c93ec tpm/eventlog: Don't abort tpm_read_log on faulty ACPI address
    b43cb0f08767 watch_queue: fix IOC_WATCH_QUEUE_SET_SIZE alloc error paths
    d15c9ae1c6d9 staging: rtl8723bs: Fix key-store index handling
    7fa3bb1bcabe staging: rtl8723bs: fix placement of braces
    962293f5443c Staging: rtl8723bs: Placing opening { braces in previous line
    890e24564c0a staging: rtl8723bs: clean up comparsions to NULL
    c513043e0afe iommu/amd: Add a length limitation for the ivrs_acpihid command-line parameter
    0fd72f1d1b94 iommu/amd: Fix ill-formed ivrs_ioapic, ivrs_hpet and ivrs_acpihid options
    2af17167804c iommu/amd: Add PCI segment support for ivrs_[ioapic/hpet/acpihid] commands
    ce4bbb2aa9d8 nbd: use the correct block_device in nbd_bdev_reset
    7889dfc19492 irqdomain: Fix mapping-creation race
    a2bc806e95bd ext4: Fix deadlock during directory rename
    07b0aba4adf0 RISC-V: Don't check text_mutex during stop_machine
    d1b47f735f60 s390/ftrace: remove dead code
    3a9418d2c93c riscv: Use READ_ONCE_NOCHECK in imprecise unwinding stack mode
    f3969427fb06 af_unix: fix struct pid leaks in OOB support
    a9f99eacf79f af_unix: Remove unnecessary brackets around CONFIG_AF_UNIX_OOB.
    6a29d71ab421 net: dsa: mt7530: permit port 5 to work without port 6 on MT7621 SoC
    ad7e40ee157b SUNRPC: Fix a server shutdown leak
    64d4eb412761 octeontx2-af: Unlock contexts in the queue context cache in case of fault detection
    03c1cc6f554d net/smc: fix fallback failed while sendmsg with fastopen
    dafde1072202 platform: x86: MLX_PLATFORM: select REGMAP instead of depending on it
    36bcbcaf01d8 netfilter: conntrack: adopt safer max chain length
    a316da050d80 scsi: megaraid_sas: Update max supported LD IDs to 240
    2adc29350a5b net: ethernet: mtk_eth_soc: fix RX data corruption issue
    fe8787c1e4f6 net: phy: smsc: fix link up detection in forced irq mode
    d83813f724ec net: phy: smsc: Cache interrupt mask
    18ab31b8cd37 btf: fix resolving BTF_KIND_VAR after ARRAY, STRUCT, UNION, PTR
    2662c5b1f0ef netfilter: tproxy: fix deadlock due to missing BH disable
    bef8cf77e21c netfilter: ctnetlink: revert to dumping mark regardless of event type
    20fd0607acbf bnxt_en: Avoid order-5 memory allocation for TPA data
    98fa707a52a3 net: phylib: get rid of unnecessary locking
    67431417617d net: stmmac: add to set device wake up flag when stmmac init phy
    af5c333c84e5 drm/msm/dpu: fix len of sc7180 ctl blocks
    4a476285f6d2 bpf, sockmap: Fix an infinite loop error when len is 0 in tcp_bpf_recvmsg_parser()
    c813f7a31614 ice: copy last block omitted in ice_get_module_eeprom()
    3f14457e1584 net: caif: Fix use-after-free in cfusbl_device_notify()
    c2c71922c5e9 net: lan78xx: fix accessing the LAN7800's internal phy specific registers from the MAC driver
    c026917887d1 perf stat: Fix counting when initial delay configured
    fdecfb2603d0 selftests: nft_nat: ensuring the listening side is up before starting the client
    91aceb3844d4 ila: do not generate empty messages in ila_xlat_nl_cmd_get_mapping()
    a5a7f6e6e126 powerpc: dts: t1040rdb: fix compatible string for Rev A boards
    4357bbb921fe nfc: fdp: add null check of devm_kmalloc_array in fdp_nci_i2c_read_device_properties
    04bfc5bcdfc0 bgmac: fix *initial* chip reset to support BCM5358
    60530bfdb647 drm/msm/a5xx: fix context faults during ring switch
    7f854b4803e5 drm/msm/a5xx: fix the emptyness check in the preempt code
    bf66e98285f7 drm/msm/a5xx: fix highest bank bit for a530
    2e8efe8c8dab drm/msm/a5xx: fix setting of the CP_PREEMPT_ENABLE_LOCAL register
    b77c764b4371 drm/msm: Fix potential invalid ptr free
    ced1f5dd6c1d drm/nouveau/kms/nv50: fix nv50_wndw_new_ prototype
    e974d8755578 drm/nouveau/kms/nv50-: remove unused functions
    c50fc503ee1b ext4: Fix possible corruption when moving a directory
    cfb89ceb22fd regulator: core: Use ktime_get_boottime() to determine how long a regulator was off
    e1a078cac3e9 regulator: core: Fix off-on-delay-us for always-on/boot-on regulators
    67a791df1457 regulator: Flag uncontrollable regulators as always_on
    e471e928de97 scsi: core: Remove the /proc/scsi/${proc_name} directory earlier
    463ae58d7c80 riscv: Add header include guards to insn.h
    4dd43ee784a1 riscv: Avoid enabling interrupts in die()
    5ab1d0528b04 RISC-V: Avoid dereferening NULL regs in die()
    6a72729ed6ac arm64: efi: Make efi_rt_lock a raw_spinlock
    14ddb4e6e9de brd: mark as nowait compatible
    5089247d6cf3 block/brd: add error handling support for add_disk()
    5c65f0971247 iommu/vt-d: Fix PASID directory pointer coherency
    8ff7db51d3ed irqdomain: Refactor __irq_domain_alloc_irqs()
    62e4ba36a3d7 ipmi:ssif: Add a timer between request retries
    2fb8b122ba8f ipmi:ssif: Increase the message retry time
    a6ef5a9d7263 f2fs: retry to update the inode page given data corruption
    a517c651f116 f2fs: do not bother checkpoint by f2fs_get_node_info
    e55332319825 f2fs: avoid down_write on nat_tree_lock during checkpoint
    31b5793ca2de udf: Fix off-by-one error when discarding preallocation
    30e29af746ee fs: dlm: start midcomms before scand
    9c9dd2b3ba83 fs: dlm: add midcomms init/start functions
    2e0415522835 fs: dlm: fix log of lowcomms vs midcomms
    c5a23d43c23a KVM: SVM: Process ICR on AVIC IPI delivery failure due to invalid target
    a78a355052ab KVM: SVM: Don't rewrite guest ICR on AVIC IPI virtualization failure
    45bcf4a4f2b1 KVM: Register /dev/kvm as the _very_ last thing during initialization
    0a0ecaf0988b KVM: Pre-allocate cpumasks for kvm_make_all_cpus_request_except()
    3e48a6349d29 KVM: Optimize kvm_make_vcpus_request_mask() a bit
    339e480baafc nfc: change order inside nfc_se_io error path
    01a821aacc64 ext4: zero i_disksize when initializing the bootloader inode
    ca500cf2eceb ext4: fix WARNING in ext4_update_inline_data
    d16576142fb9 ext4: move where set the MAY_INLINE_DATA flag is set
    c5d7c31e1722 ext4: fix another off-by-one fsmap error on 1k block filesystems
    df621af95e89 ext4: fix RENAME_WHITEOUT handling for inline directories
    7349cc5ab32e ext4: fix cgroup writeback accounting with fs-layer encryption
    fd7b8ebc1dd5 staging: rtl8723bs: Pass correct parameters to cfg80211_get_bss()
    0b22cbc05ce2 drm/connector: print max_requested_bpc in state debugfs
    5e0eed414156 drm/amdgpu: fix error checking in amdgpu_read_mm_registers for soc15
    328d069e9c35 x86/CPU/AMD: Disable XSAVES on AMD family 0x17
    92d1caad9f78 fork: allow CLONE_NEWTIME in clone3 flags
    7ba76b2ac187 perf inject: Fix --buildid-all not to eat up MMAP2
    2072e75b4942 btrfs: fix percent calculation for bg reclaim message
    f8cd8754a03a fs: prevent out-of-bounds array speculation when closing a file descriptor
    2ddbd0f967b3 Linux 5.15.102
    cbecbd884e81 staging: rtl8192e: Remove call_usermodehelper starting RadioPower.sh
    515017e952ea staging: rtl8192e: Remove function ..dm_check_ac_dc_power calling a script
    528dbd80ac21 wifi: cfg80211: Partial revert "wifi: cfg80211: Fix use after free for wext"
    bbf9f29bac04 Linux 5.15.101
    cba6bbf501be Revert "drm/i915: Don't use BAR mappings for ring buffers with LLC"
    d214f240b0f6 Linux 5.15.100
    acf252c1f5c3 usb: gadget: uvc: fix missing mutex_unlock() if kstrtou8() fails
    1c7988d5c79f malidp: Fix NULL vs IS_ERR() checking
    545d72ba4c2c scsi: mpt3sas: Remove usage of dma_get_required_mask() API
    953841f959e3 scsi: mpt3sas: re-do lost mpt3sas DMA mask fix
    de1afc58a905 scsi: mpt3sas: Don't change DMA mask while reallocating pools
    8e6612ff8b5d Revert "scsi: mpt3sas: Fix return value check of dma_get_required_mask()"
    72bf6d493c95 drm/virtio: Fix error code in virtio_gpu_object_shmem_init()
    8e62139840c0 media: uvcvideo: Fix race condition with usb_kill_urb
    a1ddee82de80 Bluetooth: hci_sock: purge socket queues in the destruct() callback
    22d021232657 drm/display/dp_mst: Fix down message handling after a packet reception error
    db35e49413a4 drm/display/dp_mst: Fix down/up message handling after sink disconnect
    e23fa593f1ab x86/resctl: fix scheduler confusion with 'current'
    be5d5d0637fd net: tls: avoid hanging tasks on the tx_lock
    e1a3cfdbf5b3 soundwire: cadence: Drain the RX FIFO after an IO timeout
    ecb33d7a5b58 soundwire: cadence: Remove wasted space in response_buf
    473efca280d4 phy: rockchip-typec: Fix unsigned comparison with less than zero
    ffcd94262e0e PCI: Add ACS quirk for Wangxun NICs
    19c4d6c7b049 PCI: loongson: Add more devices that need MRRS quirk
    bb99db06b8b6 kernel/fail_function: fix memory leak with using debugfs_lookup()
    7f1e53f88e8b drivers: base: dd: fix memory leak with using debugfs_lookup()
    09709a49283f drivers: base: component: fix memory leak with using debugfs_lookup()
    b94b39bf3d54 misc: vmw_balloon: fix memory leak with using debugfs_lookup()
    cf042964c2fa tty: pcn_uart: fix memory leak with using debugfs_lookup()
    49ae24f44713 PCI: Take other bus devices into account when distributing resources
    dba6280105e1 PCI: Align extra resources for hotplug bridges properly
    92d6e6bf9cf1 usb: gadget: uvc: Make bSourceID read/write
    14cbfd08551a usb: uvc: Enumerate valid values for color matching
    7e902b949600 USB: ene_usb6250: Allocate enough memory for full object
    95ee8cb26db5 usb: host: xhci: mvebu: Iterate over array indexes instead of using pointer math
    8da78a60f332 USB: gadget: pxa27x_udc: fix memory leak with using debugfs_lookup()
    6236a6d2cdfb USB: gadget: pxa25x_udc: fix memory leak with using debugfs_lookup()
    036ada6ca9ee USB: gadget: lpc32xx_udc: fix memory leak with using debugfs_lookup()
    b0a2663ecbe8 USB: gadget: bcm63xx_udc: fix memory leak with using debugfs_lookup()
    30f9ba2396a1 USB: gadget: gr_udc: fix memory leak with using debugfs_lookup()
    fb284bee1e21 USB: isp1362: fix memory leak with using debugfs_lookup()
    6f12097467ea USB: isp116x: fix memory leak with using debugfs_lookup()
    4a71b15744b8 USB: fotg210: fix memory leak with using debugfs_lookup()
    bb4d5eefb670 USB: sl811: fix memory leak with using debugfs_lookup()
    c6af1dbc99ad USB: uhci: fix memory leak with using debugfs_lookup()
    4322661af6d7 USB: chipidea: fix memory leak with using debugfs_lookup()
    cf52c320cf74 USB: dwc3: fix memory leak with using debugfs_lookup()
    baec889a81b8 PCI: loongson: Prevent LS7A MRRS increases
    19da678d38d2 soundwire: bus_type: Avoid lockdep assert in sdw_drv_probe()
    587b48b18a8a iio: accel: mma9551_core: Prevent uninitialized variable in mma9551_read_config_word()
    2b59fdcaaf24 iio: accel: mma9551_core: Prevent uninitialized variable in mma9551_read_status_word()
    9e58ebb12210 tools/iio/iio_utils:fix memory leak
    54179274476d mei: bus-fixup:upon error print return values of send and receive
    49b326ce8a68 serial: sc16is7xx: setup GPIO controller later in probe
    45083b86141e tty: serial: fsl_lpuart: disable the CTS when send break signal
    f9d9d25ad1f0 tty: fix out-of-bounds access in tty_driver_lookup_tty()
    4be3213e9d79 staging: emxx_udc: Add checks for dma_alloc_coherent()
    6683327b51a6 USB: fix memory leak with using debugfs_lookup()
    b32d922f86f3 media: uvcvideo: Silence memcpy() run-time false positive warnings
    c1343a879cce media: uvcvideo: Quirk for autosuspend in Logitech B910 and C910
    cdccb1c3fcd2 media: uvcvideo: Handle errors from calls to usb_string
    31a8d11d28b5 media: uvcvideo: Handle cameras with invalid descriptors
    57b0ff53f4de media: uvcvideo: Remove format descriptions
    1f11ed61d69d iommu/amd: Fix error handling for pdev_pri_ats_enable()
    77d567091ec3 IB/hfi1: Update RMT size calculation
    5a47bb71b1a9 mfd: arizona: Use pm_runtime_resume_and_get() to prevent refcnt leak
    1b46c2a76c21 bootconfig: Increase max nodes of bootconfig from 1024 to 8192 for DCC support
    0a65cd7379a2 firmware/efi sysfb_efi: Add quirk for Lenovo IdeaPad Duet 3
    2e07fa2e30d4 kernel/printk/index.c: fix memory leak with using debugfs_lookup()
    ba279dc7e47a tracing: Add NULL checks for buffer in ring_buffer_free_read_page()
    9c28c74fbd67 thermal: intel: BXT_PMIC: select REGMAP instead of depending on it
    5eaf55b38691 thermal: intel: quark_dts: fix error pointer dereference
    d11f9f030fd8 ASoC: mediatek: mt8195: add missing initialization
    488bc1b823c7 ASoC: zl38060 add gpiolib dependency
    69e997420cb9 ASoC: zl38060: Remove spurious gpiolib select
    35b855381898 ASoC: adau7118: don't disable regulators on device unbind
    3e7d0968203d loop: loop_set_status_from_info() check before assignment
    746d4e369e04 rtc: allow rtc_read_alarm without read_alarm callback
    6e47bb21b63b scsi: ipr: Work around fortify-string warning
    c775a5246151 genirq: Add and use an irq_data_update_affinity helper
    00340ccb5407 genirq: Refactor accessors to use irq_data_get_affinity_mask
    2163cf142272 rtc: sun6i: Always export the internal oscillator
    660e8f2eeafa vc_screen: modify vcs_size() handling in vcs_read()
    72db07cf0d6b tcp: tcp_check_req() can be called from process context
    ac7014af85aa ARM: dts: spear320-hmi: correct STMPE GPIO compatible
    dff967aee88a net/sched: act_sample: fix action bind logic
    850f914efe04 net/sched: act_mpls: fix action bind logic
    da4df0cbdf7c net/sched: act_pedit: fix action bind logic
    5654a12277b0 net/sched: transition act_pedit to rcu and percpu stats
    c494365432dc nfc: fix memory leak of se_io context in nfc_genl_se_io
    6398bd3c4a50 net/mlx5: Geneve, Fix handling of Geneve object id as error code
    48a8c76c7dc6 net/mlx5e: Verify flow_source cap before using it
    2721d966680a 9p/rdma: unmap receive dma buffer in rdma_request()/post_recv()
    8d3fc907d060 9p/xen: fix connection sequence
    fc772313f2da 9p/xen: fix version parsing
    df192270eb72 net: fix __dev_kfree_skb_any() vs drop monitor
    ada4f805c9e4 octeontx2-pf: Use correct struct reference in test condition
    bf5540cbd20e sctp: add a refcnt in sctp_stream_priorities to avoid a nested loop
    dcdddb5f4908 ipv6: Add lwtunnel encap size of all siblings in nexthop calculation
    e306dbee4c98 netfilter: x_tables: fix percpu counter block leak on error path when creating new netns
    dbb3cbbf03b3 netfilter: ebtables: fix table blob use-after-free
    af41b3cd9a92 netfilter: ctnetlink: fix possible refcount leak in ctnetlink_create_conntrack()
    041fdbe73de9 watchdog: sbsa_wdog: Make sure the timeout programming is within the limits
    3e765f7ff256 watchdog: pcwd_usb: Fix attempting to access uninitialized memory
    23cc41c3f19c watchdog: Fix kmemleak in watchdog_cdev_register
    dd7605dd48e5 watchdog: at91sam9_wdt: use devm_request_irq to avoid missing free_irq() in error path
    a27e95a6ff3f um: virt-pci: properly remove PCI device from bus
    6c738b8805c6 um: virtio_uml: move device breaking into workqueue
    b7d5712cf9f4 um: virtio_uml: mark device as unregistered when breaking it
    1b1ef45d48e1 um: virtio_uml: free command if adding to virtqueue failed
    8ba6b0fade97 x86: um: vdso: Add '%rcx' and '%r11' to the syscall clobber list
    ed1d288ec85d netfilter: nf_tables: allow to fetch set elements when table has an owner
    98db4a032244 ext4: use ext4_fc_tl_mem in fast-commit replay path
    aa4d726af72a f2fs: fix to avoid potential memory corruption in __update_iostat_latency()
    3afaaf6f5867 ubi: ubi_wl_put_peb: Fix infinite loop when wear-leveling work failed
    79548ccdd992 ubi: Fix UAF wear-leveling entry in eraseblk_count_seq_show()
    003bb9868a51 ubi: fastmap: Fix missed fm_anchor PEB in wear-leveling after disabling fastmap
    79db0e8323b5 ubifs: ubifs_writepage: Mark page dirty after writing inode failed
    10b6c359e374 ubifs: dirty_cow_znode: Fix memleak in error handling path
    aeb92507ea25 ubifs: Re-statistic cleaned znode count if commit failed
    5ec4c8aca5a2 ubi: Fix possible null-ptr-deref in ubi_free_volume()
    3e29634eb56e ubifs: Fix memory leak in alloc_wbufs()
    95a72417dd13 ubi: Fix unreferenced object reported by kmemleak in ubi_resize_volume()
    53818746e549 ubi: Fix use-after-free when volume resizing failed
    91bc31579e9f ubifs: Reserve one leb for each journal head while doing budget
    2b6d85db0e07 ubifs: do_rename: Fix wrong space budget when target inode's nlink > 1
    8e30559876d8 ubifs: Fix wrong dirty space budget for dirty inode
    8e166cc9b64b ubifs: Rectify space budget for ubifs_xrename()
    de6d6bf150b7 ubifs: Rectify space budget for ubifs_symlink() if symlink is encrypted
    8c3ebc5e3cd0 ubifs: Fix build errors as symbol undefined
    701bb3ed5a88 ubi: ensure that VID header offset + VID header size <= alloc, size
    276a7298af6a um: vector: Fix memory leak in vector_config
    354dfc05bd5f f2fs: allow set compression option of files without blocks
    add8515d59a1 fs: f2fs: initialize fsdata in pagecache_write()
    06fa1a839fae f2fs: use memcpy_{to,from}_page() where possible
    804817f02e2f pwm: stm32-lp: fix the check on arr and cmp registers update
    81ea09ae3040 pwm: sifive: Always let the first pwm_apply_state succeed
    852703ed6d81 pwm: sifive: Reduce time the controller lock is held
    3a75866a5cef objtool: Fix memory leak in create_static_call_sections()
    ea30508b7bb1 fs/jfs: fix shift exponent db_agl2size negative
    8311961a1724 auxdisplay: hd44780: Fix potential memory leak in hd44780_remove()
    7c183dc0af47 net/sched: Retire tcindex classifier
    abddfcf701a5 Linux 5.15.99
    d2fb2739e956 kbuild: Port silent mode detection to future gnu make.
    2da950a044ee wifi: ath9k: use proper statements in conditionals
    7e6eeb5fb3aa arm64: dts: qcom: ipq8074: fix Gen2 PCIe QMP PHY
    6ac2adcc2bff iommu/vt-d: Fix an unbalanced rcu_read_lock/rcu_read_unlock()
    26f8b1ef30f6 media: uvcvideo: Fix memory leak of object map on error exit path
    2137e7c83ed6 qede: avoid uninitialized entries in coal_entry array
    a8da5a8900fa perf intel-pt: pkt-decoder: Add CFE and EVD packets
    922bd6b37276 drm/edid: fix AVI infoframe aspect ratio handling
    4eb6789f9177 drm/i915: Don't use BAR mappings for ring buffers with LLC
    64bcaffa2d5c drm/radeon: Fix eDP for single-display iMac11,2
    6a5f31c3fbf3 drm/i915/quirks: Add inverted backlight quirk for HP 14-r206nv
    5f63c879ca95 vfio/type1: restore locked_vm
    7329ab7f0249 vfio/type1: track locked_vm per dma
    eafb81c50da8 vfio/type1: prevent underflow of locked_vm via exec()
    2fd6f6c8cb35 iommu/vt-d: Avoid superfluous IOTLB tracking in lazy mode
    77ffe5501e02 PCI: Avoid FLR for AMD FCH AHCI adapters
    99eefc2c62e0 PCI: hotplug: Allow marking devices as disconnected during bind/unbind
    2bb559f12e54 PCI/PM: Observe reset delay irrespective of bridge_d3
    b07ded08cd9c MIPS: DTS: CI20: fix otg power gpio
    71f81b6842af riscv: ftrace: Reduce the detour code size to half
    4accfc428fec riscv: ftrace: Remove wasted nops for !RISCV_ISA_C
    f6b5db68b256 riscv, mm: Perform BPF exhandler fixup on page fault
    043d1657cc51 riscv: jump_label: Fixup unaligned arch_static_branch function
    ac5ff022d916 riscv: mm: fix regression due to update_mmu_cache change
    59b83f7b057d RISC-V: add a spin_shadow_stack declaration
    0595cdb58772 scsi: ses: Fix slab-out-of-bounds in ses_intf_remove()
    584892fd29a4 scsi: ses: Fix possible desc_ptr out-of-bounds accesses
    384aa697d8f2 scsi: ses: Fix possible addl_desc_ptr out-of-bounds accesses
    2b28a7d261cb scsi: ses: Fix slab-out-of-bounds in ses_enclosure_data_process()
    6fce2307650a scsi: ses: Don't attach if enclosure has no components
    cb121c4137b2 scsi: qla2xxx: Remove increment of interface err cnt
    5f40ca617ef5 scsi: qla2xxx: Fix erroneous link down
    77a11df33c48 scsi: qla2xxx: Remove unintended flag clearing
    77302fb0e357 scsi: qla2xxx: Fix DMA-API call trace on NVMe LS requests
    476126f14dfe scsi: qla2xxx: Check if port is online before sending ELS
    c54e9311ee0b scsi: qla2xxx: Fix link failure in NPIV environment
    37a38ff7edf4 tools/bootconfig: fix single & used for logical condition
    d41db100bc38 ring-buffer: Handle race between rb_move_tail and rb_check_pages
    145999aed74f ktest.pl: Add RUN_TIMEOUT option with default unlimited
    aab7db9e1e08 ktest.pl: Fix missing "end_monitor" when machine check fails
    0c2f4a234bb2 ktest.pl: Give back console on Ctrt^C on monitor
    fe463fe6aa80 mm/thp: check and bail out if page in deferred queue already
    ef1fcad8548d mm: memcontrol: deprecate charge moving
    d0d794371bde docs: gdbmacros: print newest record
    a16bd95eeb2e remoteproc/mtk_scp: Move clk ops outside send_lock
    505627bebd45 media: ipu3-cio2: Fix PM runtime usage_count in driver unbind
    d15f73b01bce mips: fix syscall_get_nr
    34dbf5dd0711 dax/kmem: Fix leak of memory-hotplug resources
    7eb171ada303 alpha: fix FEN fault handling
    efa228b2e6a4 ceph: update the time stamps and try to drop the suid/sgid
    a73783e4e0c4 rbd: avoid use-after-free in do_rbd_add() when rbd_dev_create() fails
    c6cc86c6d847 fuse: add inode/permission checks to fileattr_get/fileattr_set
    cfa97a3b266a ARM: dts: exynos: correct TMU phandle in Odroid HC1
    70e18548311c ARM: dts: exynos: correct TMU phandle in Odroid XU
    816f83bd2868 ARM: dts: exynos: correct TMU phandle in Exynos5250
    269926de8454 ARM: dts: exynos: correct TMU phandle in Odroid XU3 family
    78a5fa65a5d7 ARM: dts: exynos: correct TMU phandle in Exynos4
    52739e0f7413 ARM: dts: exynos: correct TMU phandle in Exynos4210
    89e99f0b031f ARM: dts: qcom: sdx55: Add Qcom SMMU-500 as the fallback for IOMMU node
    0e22e0477479 dm flakey: fix a bug with 32-bit highmem systems
    ff60b2bb680e dm flakey: don't corrupt the zero page
    673ca7e7872f dm flakey: fix logic when corrupting a bio
    8cbbe0651971 thermal: intel: powerclamp: Fix cur_state for multi package system
    935ba268ac0b qede: fix interrupt coalescing configuration
    fd081afd21eb wifi: cfg80211: Fix use after free for wext
    60e49fe9b7e4 wifi: ath11k: allow system suspend to survive ath11k
    f592cd2f1390 wifi: rtl8xxxu: Use a longer retry limit of 48
    931dc7e232b2 dm: add cond_resched() to dm_wq_work()
    d71a0899e497 dm: send just one event on resize, not two
    61d44a4db2f5 mtd: spi-nor: Fix shift-out-of-bounds in spi_nor_set_erase_type
    afd61540ba77 mtd: spi-nor: spansion: Consider reserved bits in CFR5 register
    73a4cbf91e04 mtd: spi-nor: sfdp: Fix index value for SCCR dwords
    116008ada3d0 ext4: refuse to create ea block when umounted
    a6744e14ce70 ext4: optimize ea_inode block expansion
    c325350d0c54 jbd2: fix data missing when reusing bh which is ready to be checkpointed
    83c4e017fbfd ALSA: hda/realtek: Add quirk for HP EliteDesk 800 G6 Tower PC
    ff9657b1e845 ALSA: ice1712: Do not left ice->gpio_mutex locked in aureon_add_controls()
    345fb368e5f5 io_uring/poll: allow some retries for poll triggering spuriously
    7e8cd208e9c2 io_uring: remove MSG_NOSIGNAL from recvmsg
    dde0d0dfbde2 io_uring/rsrc: disallow multi-source reg buffers
    abd54d87daba io_uring: add a conditional reschedule to the IOPOLL cancelation loop
    337eb887c74d io_uring: mark task TASK_RUNNING before handling resume/task work
    54df6c5edf87 io_uring: handle TIF_NOTIFY_RESUME when checking for task_work
    7697139d5dfd crypto: qat - fix out-of-bounds read
    ffc9d001fed1 irqdomain: Fix domain registration race
    a2a46bd4f40c irqdomain: Drop bogus fwspec-mapping error handling
    27842d6884d7 irqdomain: Look for existing mapping only once
    562e332dd306 irqdomain: Fix disassociation race
    ee82369e29fb irqdomain: Fix association race
    1cb936fee7e7 ima: Align ima_file_mmap() parameters with mmap_file LSM hook
    cb104b880d78 brd: return 0/-error from brd_insert_page()
    113d4b0e12f4 Documentation/hw-vuln: Document the interaction between IBRS and STIBP
    e7f1ddebd9f5 x86/speculation: Allow enabling STIBP with legacy IBRS
    be2710deaed3 x86/microcode/AMD: Fix mixed steppings support
    5830ff467ab3 x86/microcode/AMD: Add a @cpu parameter to the reloading functions
    865af457dd89 x86/microcode/amd: Remove load_microcode_amd()'s bsp parameter
    e1d35d0d1830 x86/kprobes: Fix arch_check_optimized_kprobe check within optimized_kprobe range
    c5a2c2bf0b4f x86/kprobes: Fix __recover_optprobed_insn check optimizing logic
    f46a42130c03 x86/reboot: Disable SVM, not just VMX, when stopping CPUs
    5427c3cee789 x86/reboot: Disable virtualization in an emergency if SVM is supported
    1e3edbabf57a x86/crash: Disable virt in core NMI crash handler to avoid double shootdown
    83a27cd866dd x86/virt: Force GIF=1 prior to disabling SVM (for reboot flows)
    6e46d9ff3ed3 KVM: s390: disable migration mode when dirty tracking is disabled
    21c95b736058 KVM: SVM: hyper-v: placate modpost section mismatch error
    033a4c062124 KVM: SVM: Fix potential overflow in SEV's send|receive_update_data()
    11d4b35674c6 KVM: x86: Inject #GP if WRMSR sets reserved bits in APIC Self-IPI
    999439fd5da5 KVM: Destroy target device if coalesced MMIO unregistration fails
    ac791643e77b RDMA/siw: Fix user page pinning accounting
    a155ad9506f9 udf: Fix file corruption when appending just after end of preallocated extent
    37e74003d81e udf: Detect system inodes linked into directory hierarchy
    e6574337df78 udf: Preserve link count of system files
    c5787d77a5c2 udf: Do not update file length for failed writes to inline files
    9a8d602f0723 udf: Do not bother merging very long extents
    e43adce883e1 udf: Truncate added extents on failed expansion
    aa502e760c26 selftests/landlock: Test ptrace as much as possible with Yama
    6249f305cd34 selftests/landlock: Skip overlayfs tests when not supported
    597ecd95b1f2 ocfs2: fix non-auto defrag path not working issue
    33665d104266 ocfs2: fix defrag path triggering jbd2 ASSERT
    f901c39e670b f2fs: fix cgroup writeback accounting with fs-layer encryption
    117d4f6687b1 f2fs: fix information leak in f2fs_move_inline_dirents()
    936a8383a021 fs: dlm: send FIN ack back in right cases
    e9463d46af47 fs: dlm: move sending fin message into state change handling
    3ed92883b387 fs: dlm: don't set stop rx flag after node reset
    19e99109fb77 exfat: fix inode->i_blocks for non-512 byte sector size device
    9717df94d7d0 exfat: redefine DIR_DELETED as the bad cluster number
    c2c3d86bd4a9 exfat: fix unexpected EOF while reading dir
    0d3902cbcf80 exfat: fix reporting fs error when reading dir beyond EOF
    05103d88482d fs: hfsplus: fix UAF issue in hfsplus_put_super
    2cab8db14566 hfs: fix missing hfs_bnode_get() in __hfs_bnode_create
    6817d13c62db ARM: dts: exynos: correct HDMI phy compatible in Exynos4
    851c34f19c0a ksmbd: do not allow the actual frame length to be smaller than the rfc1002 length
    f9b816c55bea ksmbd: fix wrong data area length for smb2 lock request
    db1c5ec57611 locking/rwsem: Prevent non-first waiter from spinning in down_write() slowpath
    79a0583a31ae btrfs: hold block group refcount during async discard
    0eba9b4a86e8 cifs: Fix uninitialized memory read in smb3_qfs_tcon()
    2c00c08a081e s390/kprobes: fix current_kprobe never cleared after kprobes reenter
    f12874e6a169 s390/kprobes: fix irq mask clobbering on kprobe reenter from post_handler
    76c683864bea s390: discard .interp section
    61e64c322739 s390/extmem: return correct segment type in __segment_load()
    49be6b25acb7 ipmi_ssif: Rename idle state and check
    66db2b9a2dc5 ipmi:ssif: resend_msg() cannot fail
    db44fae4cb19 rtc: pm8xxx: fix set-alarm race
    8b44b4d81598 block: don't allow multiple bios for IOCB_NOWAIT issue
    ce3eb3c37b2c firmware: coreboot: framebuffer: Ignore reserved pixel color bits
    d44d34a22ff0 wifi: rtl8xxxu: fixing transmisison failure for rtl8192eu
    90ca3fa30fc4 drm/shmem-helper: Revert accidental non-GPL export
    bde7dcd77807 nfsd: zero out pointers after putting nfsd_files on COPY setup error
    8c5f6c699241 dm cache: add cond_resched() to various workqueue loops
    01663c215843 dm thin: add cond_resched() to various workqueue loops
    f0c8b85af2f6 drm: panel-orientation-quirks: Add quirk for Lenovo IdeaPad Duet 3 10IGL5
    fbc357c9ad67 HID: logitech-hidpp: Don't restart communication if not necessary
    5a46d8bdaf03 scsi: snic: Fix memory leak with using debugfs_lookup()
    73dbd0f325af pinctrl: at91: use devm_kasprintf() to avoid potential leaks
    52ea47a0ddfb hwmon: (coretemp) Simplify platform device handling
    c713ebf2fe3f gfs2: Improve gfs2_make_fs_rw error handling
    a4b3893e4183 regulator: s5m8767: Bounds check id indexing into arrays
    88001ac08e69 regulator: max77802: Bounds check regulator id against opmode
    4e8c955abc52 ASoC: kirkwood: Iterate over array indexes instead of using pointer math
    9576b7ccc203 ASoC: soc-compress: Reposition and add pcm_mutex
    204233695407 docs/scripts/gdb: add necessary make scripts_gdb step
    5dfe7a5386fd drm/msm/dsi: Add missing check for alloc_ordered_workqueue
    9ae15ebaefc4 drm: amd: display: Fix memory leakage
    a40b97acb817 Revert "fbcon: don't lose the console font across generic->chip driver switch"
    51ab4eb1a25e scsi: lpfc: Fix use-after-free KFENCE violation during sysfs firmware write
    cda2f7efbc2d drm/radeon: free iio for atombios when driver shutdown
    340d1cc503f6 drm/tiny: ili9486: Do not assume 8-bit only SPI controllers
    1f09c5321f03 HID: Add Mapping for System Microphone Mute
    fc4f90d6ebd0 drm/omap: dsi: Fix excessive stack usage
    bb9a5562beb9 drm/amd/display: Fix potential null-deref in dm_resume
    54ba1ec7ed34 drm/amd/display: Revert Reduce delay when sink device not able to ACK 00340h write
    93be5b2dda27 scm: add user copy checks to put_cmsg()
    ad01fa14f65c hv_netvsc: Check status in SEND_RNDIS_PKT completion message
    90c260fddc65 Bluetooth: btusb: Add VID:PID 13d3:3529 for Realtek RTL8821CE
    84e4d4885d0a PM: EM: fix memory leak with using debugfs_lookup()
    dddc132eb0dc PM: domains: fix memory leak with using debugfs_lookup()
    dc39fbd865a9 time/debug: Fix memory leak with using debugfs_lookup()
    49aa49952116 s390/idle: mark arch_cpu_idle() noinstr
    eb1fbdf985cc uaccess: Add minimum bounds check on kernel buffer size
    ce1fb07b7130 coda: Avoid partial allocation of sig_inputArgs
    dca8fd0f7d70 net/mlx5: fw_tracer: Fix debug print
    4d9d7e5e4c79 ACPI: video: Fix Lenovo Ideapad Z570 DMI match
    90fa009c6d51 wifi: mt76: dma: free rx_head in mt76_dma_rx_cleanup
    634986c94c57 tools/power/x86/intel-speed-select: Add Emerald Rapid quirk
    2493966c877f netfilter: nf_tables: NULL pointer dereference in nf_tables_updobj()
    fcf9fb5242d2 m68k: Check syscall_trace_enter() return code
    124ca24e0de9 net: bcmgenet: Add a check for oversized packets
    bcb03f2be982 crypto: hisilicon: Wipe entire pool on error
    f1e093291cd6 clocksource: Suspend the watchdog temporarily when high read latency detected
    e6900ee15d87 thermal: intel: intel_pch: Add support for Wellsburg PCH
    31f4c98ecd17 ACPI: Don't build ACPICA with '-Os'
    57bb8235ba8f ice: add missing checks for PF vsi type
    38f564996906 ice: restrict PTP HW clock freq adjustments to 100, 000, 000 PPB
    b279fa1ceadb inet: fix fast path in __inet_hash_connect()
    1a1f43059afa wifi: mt7601u: fix an integer underflow
    a0f0ce1c8ab9 wifi: brcmfmac: ensure CLM version is null-terminated to prevent stack-out-of-bounds
    f5df8d35b228 x86/bugs: Reset speculation control settings on init
    aa70d1e0f941 timers: Prevent union confusion from unexpected restart_syscall()
    599a9dcef8a7 thermal: intel: Fix unsigned comparison with less than zero
    208065148930 wifi: ath11k: debugfs: fix to work with multiple PCI devices
    4a84fcea596d rcu-tasks: Make rude RCU-Tasks work well with CPU hotplug
    0d9fc1397f71 rcu: Suppress smp_processor_id() complaint in synchronize_rcu_expedited_wait()
    6f2ce125c760 rcu: Make RCU_LOCKDEP_WARN() avoid early lockdep checks
    3a3a5e3f9406 wifi: brcmfmac: Fix potential stack-out-of-bounds in brcmf_c_preinit_dcmds()
    634a5471a6bd wifi: ath9k: Fix use-after-free in ath9k_hif_usb_disconnect()
    a2e4b48d6f9b trace/blktrace: fix memory leak with using debugfs_lookup()
    3538ade9d8c2 blk-iocost: fix divide by 0 error in calc_lcoefs()
    2e68a0f7bc57 ARM: dts: exynos: Use Exynos5420 compatible for the MIPI video phy
    1492fc9b50a4 udf: Define EFSCORRUPTED error code
    de23e98c1c34 rpmsg: glink: Avoid infinite loop on intent for missing channel
    6d24202b8d3d media: saa7134: Use video_unregister_device for radio_dev
    114f768e7314 media: usb: siano: Fix use after free bugs caused by do_submit_urb
    d2512e1c9073 media: i2c: ov7670: 0 instead of -EINVAL was returned
    29962c478e8b media: rc: Fix use-after-free bugs caused by ene_tx_irqsim()
    09fc82a6a7a8 media: imx-jpeg: Apply clk_bulk api instead of operating specific clk
    8f9722ffa432 media: v4l2-jpeg: ignore the unknown APP14 marker
    ecefc14dd1c9 media: v4l2-jpeg: correct the skip count in jpeg_parse_app14_data
    5ed8dde3aa5b media: i2c: imx219: Fix binning for RAW8 capture
    800bb32c7636 media: i2c: imx219: Split common registers from mode tables
    1da495101ef7 media: i2c: ov772x: Fix memleak in ov772x_probe()
    ba54908ae822 media: ov5675: Fix memleak in ov5675_init_controls()
    3969b2ebc660 media: ov2740: Fix memleak in ov2740_init_controls()
    5897fe3ebe82 media: max9286: Fix memleak in max9286_v4l2_register()
    956186b8e2c1 builddeb: clean generated package content
    edc6f486be31 s390/vdso: Drop '-shared' from KBUILD_CFLAGS_64
    4ecc0a347da7 s390/vdso: remove -nostdlib compiler flag
    a26436b90808 powerpc: Remove linker flag from KBUILD_AFLAGS
    60abe015c3b5 media: platform: ti: Add missing check for devm_regulator_get
    954f27086c07 media: ti: cal: fix possible memory leak in cal_ctx_create()
    d4f4aa9ec112 remoteproc: qcom_q6v5_mss: Use a carveout to authenticate modem headers
    bd57756a7e43 IB/hfi1: Fix sdma.h tx->num_descs off-by-one errors
    08210a63eb4f IB/hfi1: Fix math bugs in hfi1_can_pin_pages()
    a495b6a5d027 iommu/vt-d: Allow to use flush-queue when first level is default
    990c539e9c33 iommu/vt-d: Use second level for GPA->HPA translation
    727fb414fe9f iommu/vt-d: Check FL and SL capability sanity in scalable mode
    b0a2bf28af77 iommu/vt-d: Remove duplicate identity domain flag
    db05a58ed435 iommu/vt-d: Fix error handling in sva enable/disable paths
    0bb33c5fe4a0 dmaengine: dw-axi-dmac: Do not dereference NULL structure
    ad222c9af25e dmaengine: sf-pdma: pdma_desc memory leak fix
    f119ef452e2d iommu: Fix error unwind in iommu_group_alloc()
    76e0396313c7 iw_cxgb4: Fix potential NULL dereference in c4iw_fill_res_cm_id_entry()
    3df71bb7e8ad phy: rockchip-typec: fix tcphy_get_mode error case
    295ab6d49ee5 dmaengine: dw-edma: Fix readq_ch() return value truncation
    3d41d9b256ae tty: serial: imx: disable Ageing Timer interrupt request irq
    908e091e1b66 tty: serial: imx: Handle RS485 DE signal active high
    3fe888ce8152 serial: fsl_lpuart: fix RS485 RTS polariy inverse issue
    87674a359ad1 RDMA/irdma: Cap MSIX used to online CPUs + 1
    d9e1dae1e278 usb: max-3421: Fix setting of I/O pins
    9dca64042d85 RDMA/cxgb4: Fix potential null-ptr-deref in pass_establish()
    16603bced2d1 power: supply: remove faulty cooling logic
    c4f590e84a60 iommu/vt-d: Set No Execute Enable bit in PASID table entry
    7bd1d1305c89 usb: gadget: configfs: Restrict symlink creation is UDC already binded
    da589849cfdd usb: gadget: configfs: remove using list iterator after loop body as a ptr
    3d0127aca18f usb: gadget: configfs: use to_usb_function_instance() in cfg (un)link func
    c955f9cf75b7 usb: gadget: configfs: use to_config_usb_cfg() in os_desc_link()
    f12829e5130f usb: musb: mediatek: don't unregister something that wasn't registered
    2aff0632ac6b RDMA/cxgb4: add null-ptr-check after ip_dev_find()
    fcbbf34d7820 tty: serial: fsl_lpuart: Fix the wrong RXWATER setting for rx dma case
    e8fb0f13e45c usb: early: xhci-dbc: Fix a potential out-of-bound memory access
    49bf49312b30 dmaengine: dw-edma: Fix missing src/dst address of interleaved xfers
    834af318db66 fotg210-udc: Add missing completion handler
    b4fe158259fb firmware: dmi-sysfs: Fix null-ptr-deref in dmi_sysfs_register_handle
    ca39a7c65944 drivers: base: transport_class: fix resource leak when transport_add_device() fails
    817b415f481b drivers: base: transport_class: fix possible memory leak
    8d389e363075 driver core: fix resource leak in device_add()
    6cdcee7393d4 misc/mei/hdcp: Use correct macros to initialize uuid_le
    a3c89e8c69a5 VMCI: check context->notify_page after call to get_user_pages_fast() to avoid GPF
    b1cdf1113e21 firmware: stratix10-svc: add missing gen_pool_destroy() in stratix10_svc_drv_probe()
    7f9416f14e86 applicom: Fix PCI device refcount leak in applicom_init()
    4a77ce51f9a8 eeprom: idt_89hpesx: Fix error handling in idt_init()
    4143de03d397 Revert "char: pcmcia: cm4000_cs: Replace mdelay with usleep_range in set_protocol"
    c177d5f24723 serial: tegra: Add missing clk_disable_unprepare() in tegra_uart_hw_init()
    7159dced6ffb tty: serial: fsl_lpuart: clear LPUART Status Register in lpuart32_shutdown()
    d5dcc89c8df8 tty: serial: fsl_lpuart: disable Rx/Tx DMA in lpuart32_shutdown()
    707d954d9b5c PCI: switchtec: Return -EFAULT for copy_to_user() errors
    53b65fa40c01 PCI/IOV: Enlarge virtfn sysfs name buffer
    645384e26f20 usb: typec: intel_pmc_mux: Don't leak the ACPI device reference count
    2a023b47d9f5 usb: typec: intel_pmc_mux: Use the helper acpi_dev_get_memory_resources()
    2dc1dba1d8d3 ACPI: resource: Add helper function acpi_dev_get_memory_resources()
    950c6df6ec6e coresight: cti: Add PM runtime call in enable_store
    ec4808025406 coresight: cti: Prevent negative values of enable count
    4f125de654c4 coresight: etm4x: Fix accesses to TRCSEQRSTEVR and TRCSEQSTR
    4ff283009f55 media: uvcvideo: Check for INACTIVE in uvc_ctrl_is_accessible()
    5052fe8a95a4 media: uvcvideo: Check controls flags before accessing them
    bd3a78ace9bd media: uvcvideo: Use control names from framework
    5f0b4c77e70d media: uvcvideo: Add support for V4L2_CTRL_TYPE_CTRL_CLASS
    c7121f186c1c media: uvcvideo: refactor __uvc_ctrl_add_mapping
    d9eacd945f16 media: uvcvideo: Remove s_ctrl and g_ctrl
    07ab366a9aaf media: uvcvideo: Do not check for V4L2_CTRL_WHICH_DEF_VAL
    0305bf6af005 alpha/boot/tools/objstrip: fix the check for ELF header
    89a0079049f5 kobject: Fix slab-out-of-bounds in fill_kobj_path()
    e8bfba508cf3 kobject: modify kobject_get_path() to take a const *
    2c59650d078b driver core: fix potential null-ptr-deref in device_add()
    18f50b830408 soundwire: cadence: Don't overflow the command FIFOs
    83ce72f41464 i2c: designware: fix i2c_dw_clk_rate() return size to be u32
    d725bc59db96 usb: gadget: fusb300_udc: free irq on the error path in fusb300_probe()
    806d41135051 iio: light: tsl2563: Do not hardcode interrupt trigger type
    0d6282dc2bd3 dmaengine: HISI_DMA should depend on ARCH_HISI
    d901a7fb4069 dmaengine: idxd: Set traffic class values in GRPCFG on DSA 2.0
    6a8a02dcfae1 mfd: pcf50633-adc: Fix potential memleak in pcf50633_adc_async_read()
    413f8b1f8be6 mfd: cs5535: Don't build on UML
    41aed1bddcec objtool: add UACCESS exceptions for __tsan_volatile_read/write
    1ca4adf2e099 printf: fix errname.c list
    3927846a2a53 selftests/ftrace: Fix bash specific "==" operator
    b41a42d11df7 sparc: allow PM configs for sparc32 COMPILE_TEST
    1f3d6661f3f4 perf tools: Fix auto-complete on aarch64
    f9a35cd8f017 perf intel-pt: Do not try to queue auxtrace data on pipe
    bb0a6b5bcebf perf intel-pt: Add support for emulated ptwrite
    6d60fdc1e6a1 perf intel-pt: Add link to the perf wiki's Intel PT page
    ceecd014a8cc perf intel-pt: Add documentation for Event Trace and TNT disable
    b51f0131fd41 perf inject: Use perf_data__read() for auxtrace
    690efcb5827c leds: led-core: Fix refcount leak in of_led_get()
    1cdf973d2b3a perf llvm: Fix inadvertent file creation
    321b8b2b0b2b gfs2: jdata writepage fix
    7cbd5bdb5bd4 cifs: Fix warning and UAF when destroy the MR list
    46cd6c639cdd cifs: Fix lost destroy smbd connection when MR allocate failed
    22f55cbb0605 nfsd: fix race to check ls_layouts
    4abe8b100407 drm/shmem-helper: Fix locking for drm_gem_shmem_get_pages_sgt()
    350f0fc9052d hid: bigben_probe(): validate report count
    0fd999805292 HID: bigben: use spinlock to safely schedule workers
    be0b3f4a10bc HID: bigben_worker() remove unneeded check on report_field
    4dccaf1e45e1 HID: bigben: use spinlock to protect concurrent accesses
    547d18473a16 ASoC: soc-dapm.h: fixup warning struct snd_pcm_substream not declared
    78b4d1e54531 spi: synquacer: Fix timeout handling in synquacer_spi_transfer_one()
    91758289faad NFS: fix disabling of swap
    c78cfb19c9a2 nfs4trace: fix state manager flag printing
    ccbf841c73ef NFSv4: keep state manager thread active if swap is enabled
    24ff9c5cdea9 dm: remove flush_scheduled_work() during local_exit()
    6739473a05ba ASoC: tlv320adcx140: fix 'ti,gpio-config' DT property init
    75eef8cb9d07 hwmon: (mlxreg-fan) Return zero speed for broken fan
    528181646644 spi: bcm63xx-hsspi: Fix multi-bit mode setting
    caed289f95f2 ASoC: codecs: lpass: fix incorrect mclk rate
    110589ecae84 ASoC: codecs: tx-macro: move to individual clks from bulk
    b1c7f77e2831 ASoC: codecs: rx-macro: move to individual clks from bulk
    05fd63e7f640 ASoC: codecs: tx-macro: move clk provider to managed variants
    8ca893710c67 ASoC: codecs: rx-macro: move clk provider to managed variants
    bed34709711a ASoC: codecs: Change bulk clock voting to optional voting in digital codecs
    bf29fda763a9 HID: retain initial quirks set up when creating HID devices
    2098a330b2a6 HID: multitouch: Add quirks for flipped axes
    f6e9b77257c1 scsi: aic94xx: Add missing check for dma_map_single()
    378cc0eec4aa scsi: mpt3sas: Fix a memory leak
    2dc8d09c1e68 drm/amdgpu: fix enum odm_combine_mode mismatch
    8b9415aecb1f hwmon: (ltc2945) Handle error case in ltc2945_value_store
    9cd1a9b7de20 ASoC: dt-bindings: meson: fix gx-card codec node regex
    fecd236ef6be ASoC: mchp-spdifrx: Fix uninitialized use of mr in mchp_spdifrx_hw_params()
    2b346cc075ec ASoC: rsnd: fixup #endif position
    fa077baab8ea ASoC: mchp-spdifrx: disable all interrupts in mchp_spdifrx_dai_remove()
    667782d7ef5b ASoC: mchp-spdifrx: fix controls that works with completion mechanism
    12396e9300da ASoC: mchp-spdifrx: fix return value in case completion times out
    0c4e4d2ccb88 ASoC: mchp-spdifrx: fix controls which rely on rsr register
    e4d1c3ce2fe3 spi: dw_bt1: fix MUX_MMIO dependencies
    5f54a1d08e26 gpio: vf610: connect GPIO label to dev name
    0b64984dfbc4 ASoC: soc-compress.c: fixup private_data on snd_soc_new_compress()
    49cf87919dae drm/mediatek: Clean dangling pointer on bind error path
    62952905e195 drm/mediatek: mtk_drm_crtc: Add checks for devm_kcalloc
    cd98ea8fa15b drm/mediatek: Drop unbalanced obj unref
    088a31fe1edb drm/mediatek: Use NULL instead of 0 for NULL pointer
    2a83e2b5b121 drm/mediatek: dsi: Reduce the time of dsi from LP11 to sending cmd
    be30b05c4a33 drm/msm/dpu: set pdpu->is_rt_pipe early in dpu_plane_sspp_atomic_update()
    f50858d1b66a drm/tegra: firewall: Check for is_addr_reg existence in IMM check
    6f3614226430 gpu: host1x: Don't skip assigning syncpoints to channels
    11d6f70f07b0 pinctrl: mediatek: Initialize variable *buf to zero
    47a117028113 pinctrl: mediatek: Initialize variable pullen and pullup to zero
    b5b81fc1ac08 pinctrl: mediatek: fix coding style
    58151b609821 pinctrl: bcm2835: Remove of_node_put() in bcm2835_of_gpio_ranges_fallback()
    82943a0730e0 drm/msm/mdp5: Add check for kzalloc
    c7ee1772e3c3 drm/msm/dpu: Add check for pstates
    d4ba50614cb3 drm/msm/dpu: Add check for cstate
    f0e9f3e1d6c8 drm/msm: use strscpy instead of strncpy
    c9b6a75aae4d drm/msm/dsi: Allow 2 CTRLs on v2.5.0
    ce9fedc3099e drm: exynos: dsi: Fix MIPI_DSI*_NO_* mode flags
    3a40fd51e81e drm/mipi-dsi: Fix byte order of 16-bit DCS set/get brightness
    15edaafbff75 drm/bridge: lt9611: pass a pointer to the of node
    75b3c2777dbb drm/bridge: lt9611: fix clock calculation
    a2c196f05a30 drm/bridge: lt9611: fix programming of video modes
    24e51dea9885 drm/bridge: lt9611: fix polarity programming
    77ba2d294e16 drm/bridge: lt9611: fix HPD reenablement
    1b5adc8752b0 drm/bridge: lt9611: fix sleep mode setup
    bf661c5e3bc4 drm/msm/dpu: Disallow unallocated resources to be returned
    436fb91cadb8 drm/msm/gem: Add check for kmalloc
    525c43e67d47 ALSA: hda/ca0132: minor fix for allocation size
    399d01375659 drm/msm/adreno: Fix null ptr access in adreno_gpu_cleanup()
    e69f8e959b72 ASoC: fsl_sai: initialize is_dsp_mode flag
    6fd4144985fc ASoC: fsl_sai: Update to modern clocking terminology
    d58b45bbbea8 scsi: qla2xxx: Fix exchange oversubscription for management commands
    2232e689f9d9 scsi: qla2xxx: Fix exchange oversubscription
    9b2aab3da463 scsi: qla2xxx: edif: Fix I/O timeout due to over-subscription
    09af894bc3bd drm/msm: clean event_thread->worker in case of an error
    e76fbfdad503 drm/vc4: hdmi: Correct interlaced timings again
    55f2645e4e12 drm/vc4: hvs: Fix colour order for xRGB1555 on HVS5
    ae8b24e8289b drm/vc4: hvs: Set AXI panic modes
    0f735f232ff5 pinctrl: rockchip: Fix refcount leak in rockchip_pinctrl_parse_groups
    af54707c0cca pinctrl: stm32: Fix refcount leak in stm32_pctrl_get_irq_domain
    b31ad2ecc4f7 pinctrl: qcom: pinctrl-msm8976: Correct function names for wcss pins
    9a01ecc312e7 drm/msm/hdmi: Add missing check for alloc_ordered_workqueue
    1721badebfc8 hwmon: (ftsteutates) Fix scaling of measurements
    11226ab2f99f gpu: ipu-v3: common: Add of_node_put() for reference returned by of_graph_get_port_by_id()
    262f8e5940c6 drm: tidss: Fix pixel format definition
    d2991e6b3002 drm/vc4: dpi: Fix format mapping for RGB565
    8e04aaffb6de drm/vc4: dpi: Add option for inverting pixel clock and output enable
    1f9836f95271 drm/vkms: Fix null-ptr-deref in vkms_release()
    bad13de76488 drm/vkms: Fix memory leak in vkms_init()
    309e785bae07 drm/bridge: megachips: Fix error handling in i2c_register_driver()
    b02742255620 drm: mxsfb: DRM_MXSFB should depend on ARCH_MXS || ARCH_MXC
    da56b06f3828 drm/bridge: ti-sn65dsi83: Fix delay after reset deassert to match spec
    d72f8548a613 drm/fourcc: Add missing big-endian XRGB1555 and RGB565 formats
    d06e827a65a6 drm: Fix potential null-ptr-deref due to drmm_mode_config_init()
    50c75e7ce64c sefltests: netdevsim: wait for devlink instance after netns removal
    1a452b449a29 selftest: fib_tests: Always cleanup before exit
    96cf406dea06 net: bcmgenet: fix MoCA LED control
    f6df58aa15f7 l2tp: Avoid possible recursive deadlock in l2tp_tunnel_register()
    f7854541b02e selftests/net: Interpret UDP_GRO cmsg data as an int value
    75ee94229062 irqchip/irq-bcm7120-l2: Set IRQ_LEVEL for level triggered interrupts
    3a413b05c66e irqchip/irq-brcmstb-l2: Set IRQ_LEVEL for level triggered interrupts
    95ab0725c521 bpf: Fix global subprog context argument resolution logic
    bfc344d1e78c can: esd_usb: Move mislocated storage of SJA1000_ECC_SEG bits in case of a bus error
    f5aaf140ab1c thermal/drivers/hisi: Drop second sensor hi3660
    2d20f9b6dd81 wifi: mac80211: make rate u32 in sta_set_rate_info_rx()
    62ff301aa492 crypto: crypto4xx - Call dma_unmap_page when done
    74fe2bf6746e ACPI: resource: Do IRQ override on all TongFang GMxRGxx
    b577d0bde456 ACPI: resource: Add IRQ overrides for MAINGEAR Vector Pro 2 models
    e0ae2d90bc0c selftests/bpf: Fix out-of-srctree build
    15fe03e5dd05 wifi: mwifiex: fix loop iterator in mwifiex_update_ampdu_txwinsize()
    f15ef0ebcf56 wifi: iwl4965: Add missing check for create_singlethread_workqueue()
    505c74c4c0b1 wifi: iwl3945: Add missing check for create_singlethread_workqueue
    5ac2f1e3bbe6 RISC-V: time: initialize hrtimer based broadcast clock event device
    e97dd92c3611 m68k: /proc/hardware should depend on PROC_FS
    b677cb4f0b6b crypto: rsa-pkcs1pad - Use akcipher_request_complete
    99e8e6fd70a1 rds: rds_rm_zerocopy_callback() correct order for list_add_tail()
    d7bd166859fe libbpf: Fix alen calculation in libbpf_nla_dump_errormsg()
    b8f6c28ce1cf s390/ap: fix status returned by ap_qact()
    900a0c25a653 s390/ap: fix status returned by ap_aqic()
    0e872b4da7c6 Bluetooth: hci_qca: get wakeup status from serdev device handle
    31a288a4df7f Bluetooth: L2CAP: Fix potential user-after-free
    bf1b79d57e44 OPP: fix error checking in opp_migrate_dentry()
    db6efde0ab80 tap: tap_open(): correctly initialize socket uid
    67f9f02928a3 tun: tun_chr_open(): correctly initialize socket uid
    a8353cfb4eec net: add sock_init_data_uid()
    15a66714bf28 s390/vmem: fix empty page tables cleanup under KASAN
    6ce9a22fc021 s390/mem_detect: fix detect_memory() error handling
    856fc2195494 irqchip/ti-sci: Fix refcount leak in ti_sci_intr_irq_domain_probe
    88cb93d3a16f irqchip/irq-mvebu-gicp: Fix refcount leak in mvebu_gicp_probe
    d6c66c468897 irqchip/alpine-msi: Fix refcount leak in alpine_msix_init_domains
    4401b4858557 irqchip: Fix refcount leak in platform_irqchip_probe
    a7724a7c2236 net/mlx5: Enhance debug print in page allocation failure
    a25ff23ba2d7 mt76: mt7915: fix polling firmware-own status
    9af6aa18b4e8 bpftool: profile online CPUs instead of possible
    457139238f34 crypto: ccp - Flush the SEV-ES TMR memory before giving it to firmware
    68c1cfd01332 crypto: ccp - Refactor out sev_fw_alloc()
    13cb7851a5b1 leds: led-class: Add missing put_device() to led_put()
    912eb10b6564 crypto: xts - Handle EBUSY correctly
    55a7f88059c8 x86/microcode: Adjust late loading result reporting message
    36b6fc833437 x86/microcode: Check CPU capabilities after late microcode update correctly
    de6e20f3f33e x86/microcode: Add a parameter to microcode_check() to store CPU capabilities
    a9e76b276b10 x86/microcode: Print previous version of microcode after reload
    6d2b3a319144 x86/microcode: Default-disable late loading
    dce39c10d885 x86/microcode: Rip out the OLD_INTERFACE
    54aa76ad5f01 x86: Mark stop_this_cpu() __noreturn
    e4de2b98c4bd powercap: fix possible name leak in powercap_register_zone()
    36ec108b7bd7 crypto: seqiv - Handle EBUSY correctly
    840a1d3b77c1 crypto: essiv - Handle EBUSY correctly
    416eb7cc967d crypto: ccp - Failure on re-initialization due to duplicate sysfs filename
    3496c1b3f500 ACPI: battery: Fix missing NUL-termination with large strings
    ac75c78f8f76 wifi: cfg80211: Fix extended KCK key length check in nl80211_set_rekey_data()
    53c8a256e5d3 wifi: ath11k: Fix memory leak in ath11k_peer_rx_frag_setup
    1af7eacfad45 wifi: ath9k: Fix potential stack-out-of-bounds write in ath9k_wmi_rsp_callback()
    61490d271027 wifi: ath9k: hif_usb: clean up skbs if ath9k_hif_usb_rx_stream() fails
    f1cdbe94f728 ath9k: htc: clean up statistics macros
    4adfc9eb8a45 ath9k: hif_usb: simplify if-if to if-else
    c0c0614f143b wifi: ath9k: htc_hst: free skb in ath9k_htc_rx_msg() if there is no callback function
    88f6608c7ede wifi: orinoco: check return value of hermes_write_wordrec()
    35fb0e275af1 wifi: rtl8xxxu: Fix memory leaks with RTL8723BU, RTL8192EU
    ae17414de71b thermal/drivers/tsens: limit num_sensors to 9 for msm8939
    80726a391973 thermal/drivers/tsens: fix slope values for msm8939
    e991430d2375 thermal/drivers/tsens: Sort out msm8976 vs msm8956 data
    df56f5265e73 thermal/drivers/tsens: Add compat string for the qcom,msm8960
    21cb4e5700be thermal/drivers/tsens: Drop msm8976-specific defines
    801d10065b8a ACPICA: nsrepair: handle cases without a return value correctly
    0cf3af4de06a crypto: ccp - Avoid page allocation failure warning for SEV_GET_ID2
    9ae0f82aa70b lib/mpi: Fix buffer overrun when SG is too long
    d215e32fe18a rcu-tasks: Fix synchronize_rcu_tasks() VS zap_pid_ns_processes()
    f7dc606a47d3 rcu-tasks: Remove preemption disablement around srcu_read_[un]lock() calls
    a0818534fb64 rcu-tasks: Improve comments explaining tasks_rcu_exit_srcu purpose
    bcaa8b8fc1f1 genirq: Fix the return type of kstat_cpu_irqs_sum()
    4222cc9e7912 ACPICA: Drop port I/O validation for some regions
    2b56df9102a8 crypto: x86/ghash - fix unaligned access in ghash_setkey()
    4f47453c39f3 wifi: wl3501_cs: don't call kfree_skb() under spin_lock_irqsave()
    f19c9ed16294 wifi: libertas: cmdresp: don't call kfree_skb() under spin_lock_irqsave()
    b9294aedfb17 wifi: libertas: main: don't call kfree_skb() under spin_lock_irqsave()
    e9c889b0c458 wifi: libertas: if_usb: don't call kfree_skb() under spin_lock_irqsave()
    068e986f2ba8 wifi: libertas_tf: don't call kfree_skb() under spin_lock_irqsave()
    ddb864ea9ca2 wifi: brcmfmac: unmap dma buffer in brcmf_msgbuf_alloc_pktid()
    e8ef89e5b89e wifi: brcmfmac: fix potential memory leak in brcmf_netdev_start_xmit()
    5706d00fde3f wifi: wilc1000: fix potential memory leak in wilc_mac_xmit()
    9424ea9d557e wifi: ipw2200: fix memory leak in ipw_wdev_init()
    345692e96bb7 wifi: ipw2x00: don't call dev_kfree_skb() under spin_lock_irqsave()
    d78d85d84a44 libbpf: Fix btf__align_of() by taking into account field offsets
    0c962dcd6bf6 wifi: rtlwifi: Fix global-out-of-bounds bug in _rtl8812ae_phy_set_txpower_limit()
    507ad94346da wifi: rtl8xxxu: don't call dev_kfree_skb() under spin_lock_irqsave()
    037f84c0bfae wifi: libertas: fix memory leak in lbs_init_adapter()
    8722f96adece wifi: iwlegacy: common: don't call dev_kfree_skb() under spin_lock_irqsave()
    53aa5137560a wifi: rtlwifi: rtl8723be: don't call kfree_skb() under spin_lock_irqsave()
    993cd8cf5442 wifi: rtlwifi: rtl8188ee: don't call kfree_skb() under spin_lock_irqsave()
    7d2cb8abaad7 wifi: rtlwifi: rtl8821ae: don't call kfree_skb() under spin_lock_irqsave()
    b56e60b3b158 wifi: rsi: Fix memory leak in rsi_coex_attach()
    3d30678a59af block: bio-integrity: Copy flags when bio_integrity_payload is cloned
    cabad071ab17 arm64: dts: qcom: pmk8350: Use the correct PON compatible
    0e12d7725d58 arm64: dts: qcom: pmk8350: Specify PBS register for PON
    2936952fa626 KEYS: asymmetric: Fix ECDSA use via keyctl uapi
    a5fa5a41791c x86/perf/zhaoxin: Add stepping check for ZXC
    2c36c390a749 sched/rt: pick_next_rt_entity(): check list_entry
    3f191c2cc567 sched/deadline,rt: Remove unused parameter from pick_next_[rt|dl]_entity()
    544a552be086 s390/dasd: Fix potential memleak in dasd_eckd_init()
    a00cf3619f19 arm64: dts: qcom: msm8992-lg-bullhead: Correct memory overlaps with the SMEM and MPSS memory regions
    8173defc3635 blk-mq: correct stale comment of .get_budget
    7dd5f83c1149 blk-mq: remove stale comment for blk_mq_sched_mark_restart_hctx
    5eb99e7a80fc blk-mq: avoid sleep in blk_mq_alloc_request_hctx
    20b9d7b4e0e6 arm64: dts: mediatek: mt7622: Add missing pwm-cells to pwm node
    88022f659f63 arm64: dts: mt8192: Fix CPU map for single-cluster SoC
    770e769834e1 ARM: dts: imx7s: correct iomuxc gpr mux controller cells
    2fe22748d511 ARM: dts: sun8i: nanopi-duo2: Fix regulator GPIO reference
    762c821b97a7 arm64: dts: meson: bananapi-m5: switch VDDIO_C pin to OPEN_DRAIN
    e29709ba5847 arm64: dts: renesas: beacon-renesom: Fix gpio expander reference
    3f5ec3c335dd locking/rwsem: Disable preemption in all down_read*() and up_read() code paths
    ab4d47a343da locking/rwsem: Optimize down_read_trylock() under highly contended case
    ac0e5a181eff arm64: dts: amlogic: meson-sm1-odroid-hc4: fix active fan thermal trip
    f4891e5725a0 arm64: dts: amlogic: meson-gxbb-kii-pro: fix led node name
    665bdfabec52 arm64: dts: amlogic: meson-gxl-s905d-phicomm-n1: fix led node name
    f0b5101a6432 arm64: dts: amlogic: meson-sm1-bananapi-m5: fix adc keys node names
    ae03ae3b6b93 arm64: dts: amlogic: meson-gx-libretech-pc: fix update button name
    5be0df1849b6 arm64: dts: amlogic: meson-gxl: add missing unit address to eth-phy-mux node name
    7a5b8cd5622b arm64: dts: amlogic: meson-gx: add missing unit address to rng node name
    5c1ce648c6c3 arm64: dts: amlogic: meson-gxl-s905d-sml5442tw: drop invalid clock-names property
    d089142bcc73 arm64: dts: amlogic: meson-gx: add missing SCPI sensors compatible
    f562cc37f0f0 arm64: dts: amlogic: meson-axg: fix SCPI clock dvfs node name
    334bb3461204 arm64: dts: amlogic: meson-gx: fix SCPI clock dvfs node name
    88083a25d80a ARM: imx: Call ida_simple_remove() for ida_simple_get
    abfdfa339675 ARM: dts: exynos: correct wr-active property in Exynos3250 Rinato
    70aac3c6b14d arm64: dts: ti: k3-j7200: Fix wakeup pinmux range
    c42defea2db0 ARM: s3c: fix s3c64xx_set_timer_source prototype
    af48760133f1 ARM: bcm2835_defconfig: Enable the framebuffer
    37858e17e45e ARM: OMAP1: call platform_device_put() in error case in omap1_dm_timer_init()
    89895442387d arm64: dts: meson: remove CPU opps below 1GHz for G12A boards
    69c7a270357a arm64: dts: qcom: ipq8074: correct PCIe QMP PHY output clock names
    feb8c71f015d arm64: dts: qcom: ipq8074: fix Gen3 PCIe node
    1563af0f28af arm64: dts: qcom: ipq8074: correct Gen2 PCIe ranges
    e88204931d9a arm64: dts: qcom: ipq8074: fix Gen3 PCIe QMP PHY
    d9df682bcea5 arm64: dts: qcom: ipq8074: fix PCIe PHY serdes size
    a55a645aa303 arm64: dts: qcom: Fix IPQ8074 PCIe PHY nodes
    dd3d021ae547 arm64: dts: qcom: ipq8074: correct USB3 QMP PHY-s clock output names
    8a5d81afa6e1 arm64: dts: qcom: msm8992-bullhead: Disable dfps_data_mem
    76e794cfd137 arm64: dts: qcom: msm8992-bullhead: Fix cont_splash_mem size
    10c5fae6f99d arm64: dts: msm8992-bullhead: add memory hole region
    410028a170f3 arm64: dts: meson-gx: Fix the SCPI DVFS node name and unit address
    a240ab41b3bc arm64: dts: meson-g12a: Fix internal Ethernet PHY unit name
    472c333be2c2 arm64: dts: meson-gx: Fix Ethernet MAC address unit name
    b63bb187696c arm64: dts: qcom: sc7280: correct SPMI bus address cells
    9e4063237957 arm64: dts: qcom: sc7180: correct SPMI bus address cells
    6ca79943f5e3 arm64: dts: qcom: sdm845-db845c: fix audio codec interrupt pin name
    e192005e3f69 arm64: dts: mediatek: mt8183: Fix systimer 13 MHz clock description
    1cc12d10d13a ARM: zynq: Fix refcount leak in zynq_early_slcr_init
    a1d42650cf29 arm64: dts: imx8m: Align SoC unique ID node unit address
    61ecb2df6923 arm64: dts: qcom: sm6125: Reorder HSUSB PHY clocks to match bindings
    738a716d2de6 arm64: dts: qcom: sm8150-kumano: Panel framebuffer is 2.5k instead of 4k
    a7d6e757169f arm64: dts: qcom: msm8996-tone: Fix USB taking 6 minutes to wake up
    795a9a93ed8d arm64: dts: qcom: qcs404: use symbol names for PCIe resets
    10fcdad2b9f3 ARM: OMAP2+: Fix memory leak in realtime_counter_init()
    e2f62d8302bb powerpc/mm: Rearrange if-else block to avoid clang warning
    3959316f8ceb HID: asus: use spinlock to safely schedule workers
    d2ce7b6f3ae4 HID: asus: use spinlock to protect concurrent accesses

Signed-off-by: Bruce Ashfield <bruce.ashfield@gmail.com>
---
 .../linux/linux-yocto-rt_5.15.bb              |  6 ++---
 .../linux/linux-yocto-tiny_5.15.bb            |  6 ++---
 meta/recipes-kernel/linux/linux-yocto_5.15.bb | 26 +++++++++----------
 3 files changed, 19 insertions(+), 19 deletions(-)

diff --git a/meta/recipes-kernel/linux/linux-yocto-rt_5.15.bb b/meta/recipes-kernel/linux/linux-yocto-rt_5.15.bb
index e67dc38736..38daab6bbe 100644
--- a/meta/recipes-kernel/linux/linux-yocto-rt_5.15.bb
+++ b/meta/recipes-kernel/linux/linux-yocto-rt_5.15.bb
@@ -11,13 +11,13 @@ python () {
         raise bb.parse.SkipRecipe("Set PREFERRED_PROVIDER_virtual/kernel to linux-yocto-rt to enable it")
 }
 
-SRCREV_machine ?= "ce19518b87253279a0358d736d8e9a2cca908498"
-SRCREV_meta ?= "674b6bbdc9cb7cfdbec5a0642a3cbef0ba1f738c"
+SRCREV_machine ?= "e1ca9a177aff19013178aa30a8eccb4d7b2b67d7"
+SRCREV_meta ?= "441f5fe00073620cec471166cf6e94c4ef9c69b2"
 
 SRC_URI = "git://git.yoctoproject.org/linux-yocto.git;branch=${KBRANCH};name=machine \
            git://git.yoctoproject.org/yocto-kernel-cache;type=kmeta;name=meta;branch=yocto-5.15;destsuffix=${KMETA}"
 
-LINUX_VERSION ?= "5.15.98"
+LINUX_VERSION ?= "5.15.103"
 
 LIC_FILES_CHKSUM = "file://COPYING;md5=6bc538ed5bd9a7fc9398086aedcd7e46"
 
diff --git a/meta/recipes-kernel/linux/linux-yocto-tiny_5.15.bb b/meta/recipes-kernel/linux/linux-yocto-tiny_5.15.bb
index 8c0f149a35..eb6af62015 100644
--- a/meta/recipes-kernel/linux/linux-yocto-tiny_5.15.bb
+++ b/meta/recipes-kernel/linux/linux-yocto-tiny_5.15.bb
@@ -5,7 +5,7 @@ KCONFIG_MODE = "--allnoconfig"
 
 require recipes-kernel/linux/linux-yocto.inc
 
-LINUX_VERSION ?= "5.15.98"
+LINUX_VERSION ?= "5.15.103"
 LIC_FILES_CHKSUM = "file://COPYING;md5=6bc538ed5bd9a7fc9398086aedcd7e46"
 
 DEPENDS += "${@bb.utils.contains('ARCH', 'x86', 'elfutils-native', '', d)}"
@@ -14,8 +14,8 @@ DEPENDS += "openssl-native util-linux-native"
 KMETA = "kernel-meta"
 KCONF_BSP_AUDIT_LEVEL = "2"
 
-SRCREV_machine ?= "c5c318ab79b57628d2046185821db1d0eb89df20"
-SRCREV_meta ?= "674b6bbdc9cb7cfdbec5a0642a3cbef0ba1f738c"
+SRCREV_machine ?= "4ae6c9a73f4e6e356186a541e3fcbea4fa6a09f1"
+SRCREV_meta ?= "441f5fe00073620cec471166cf6e94c4ef9c69b2"
 
 PV = "${LINUX_VERSION}+git${SRCPV}"
 
diff --git a/meta/recipes-kernel/linux/linux-yocto_5.15.bb b/meta/recipes-kernel/linux/linux-yocto_5.15.bb
index 8c38db25f8..41f20c96dd 100644
--- a/meta/recipes-kernel/linux/linux-yocto_5.15.bb
+++ b/meta/recipes-kernel/linux/linux-yocto_5.15.bb
@@ -13,24 +13,24 @@ KBRANCH:qemux86  ?= "v5.15/standard/base"
 KBRANCH:qemux86-64 ?= "v5.15/standard/base"
 KBRANCH:qemumips64 ?= "v5.15/standard/mti-malta64"
 
-SRCREV_machine:qemuarm ?= "21e0bbe305e7dbcd73a3b8695084f0cc3334f4ee"
-SRCREV_machine:qemuarm64 ?= "574058afde6aba973ebe024686c2e609b9703bbb"
-SRCREV_machine:qemumips ?= "80b8c24fa8e87f562cb558662e0c9c8f036aa389"
-SRCREV_machine:qemuppc ?= "3263f7de77ed4245e3802e19e7aded24fe957f30"
-SRCREV_machine:qemuriscv64 ?= "99700bd79a36b1a0cea28fd65921b5973970fc88"
-SRCREV_machine:qemuriscv32 ?= "99700bd79a36b1a0cea28fd65921b5973970fc88"
-SRCREV_machine:qemux86 ?= "99700bd79a36b1a0cea28fd65921b5973970fc88"
-SRCREV_machine:qemux86-64 ?= "99700bd79a36b1a0cea28fd65921b5973970fc88"
-SRCREV_machine:qemumips64 ?= "ad9994f20f03947ef32a18e9cc86b13d37548010"
-SRCREV_machine ?= "99700bd79a36b1a0cea28fd65921b5973970fc88"
-SRCREV_meta ?= "674b6bbdc9cb7cfdbec5a0642a3cbef0ba1f738c"
+SRCREV_machine:qemuarm ?= "21687086c27bb112f19b0aac455d800961c0b830"
+SRCREV_machine:qemuarm64 ?= "7144f86a73fe2ffe4fe57c9e6cf28d8fc8db4b6a"
+SRCREV_machine:qemumips ?= "557c06060cb218ade536fccc66f8f3e755537f31"
+SRCREV_machine:qemuppc ?= "db19dbdcdf51b9d2a071dcf180ba9e20b8286e9b"
+SRCREV_machine:qemuriscv64 ?= "024d08fb706170a9723e9751e505681f9d4c7ab6"
+SRCREV_machine:qemuriscv32 ?= "024d08fb706170a9723e9751e505681f9d4c7ab6"
+SRCREV_machine:qemux86 ?= "024d08fb706170a9723e9751e505681f9d4c7ab6"
+SRCREV_machine:qemux86-64 ?= "024d08fb706170a9723e9751e505681f9d4c7ab6"
+SRCREV_machine:qemumips64 ?= "6f1dbe8c258d49f4dba59827124dfe9aa2c151db"
+SRCREV_machine ?= "024d08fb706170a9723e9751e505681f9d4c7ab6"
+SRCREV_meta ?= "441f5fe00073620cec471166cf6e94c4ef9c69b2"
 
 # set your preferred provider of linux-yocto to 'linux-yocto-upstream', and you'll
 # get the <version>/base branch, which is pure upstream -stable, and the same
 # meta SRCREV as the linux-yocto-standard builds. Select your version using the
 # normal PREFERRED_VERSION settings.
 BBCLASSEXTEND = "devupstream:target"
-SRCREV_machine:class-devupstream ?= "d9b4a0c83a2d405dd85bf32d672686146b9bedff"
+SRCREV_machine:class-devupstream ?= "8020ae3c051d1c9ec7b7a872e226f9720547649b"
 PN:class-devupstream = "linux-yocto-upstream"
 KBRANCH:class-devupstream = "v5.15/base"
 
@@ -38,7 +38,7 @@ SRC_URI = "git://git.yoctoproject.org/linux-yocto.git;name=machine;branch=${KBRA
            git://git.yoctoproject.org/yocto-kernel-cache;type=kmeta;name=meta;branch=yocto-5.15;destsuffix=${KMETA}"
 
 LIC_FILES_CHKSUM = "file://COPYING;md5=6bc538ed5bd9a7fc9398086aedcd7e46"
-LINUX_VERSION ?= "5.15.98"
+LINUX_VERSION ?= "5.15.103"
 
 DEPENDS += "${@bb.utils.contains('ARCH', 'x86', 'elfutils-native', '', d)}"
 DEPENDS += "openssl-native util-linux-native"
-- 
2.34.1


