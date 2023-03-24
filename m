Return-Path: <bruce.ashfield@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 7E8D5C77B61
	for <webhook@archiver.kernel.org>; Fri, 24 Mar 2023 15:08:57 +0000 (UTC)
Received: from mail-qv1-f46.google.com (mail-qv1-f46.google.com [209.85.219.46])
 by mx.groups.io with SMTP id smtpd.web10.104393.1679670533210239767
 for <openembedded-core@lists.openembedded.org>;
 Fri, 24 Mar 2023 08:08:56 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20210112 header.b=HBfTMa+k;
 spf=pass (domain: gmail.com, ip: 209.85.219.46, mailfrom: bruce.ashfield@gmail.com)
Received: by mail-qv1-f46.google.com with SMTP id qh28so1777883qvb.7
        for <openembedded-core@lists.openembedded.org>; Fri, 24 Mar 2023 08:08:55 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112; t=1679670535;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=vITTIznkXuSJlqYU68FAUSd7BTDCpKRJSErgDK3AeHA=;
        b=HBfTMa+kD9JIXPyKdEPiXHQFOtwvyRojhqr6ZQThtspX3RaOA5vHzx9XjrzC1ZJgt9
         +hiaO5s5L3wUqLjuPmmib7Cn0Zn3SJXZYAfE4rtS5rs92FnOJNHZnek0IKdgkNfL0XwL
         BLHZ54BJee4Ecb5ScxS3qdDVydAoiWTn/XH1vB5MegUdVKaph91uT+7THWxgHfdIyV/T
         bXvqzneV/fGLy2bNXAzl/fF2OouxXTRwjbsHwphfjjZRcNAQ1Gs8QYNgCYd3vZWPPUyL
         O8QKdukvR2dQFNLHKlgELu5jormKmTKFAi+f6q/ieF3c1ke1+03VHpwmT+tIZoA0xHvX
         14EQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112; t=1679670535;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=vITTIznkXuSJlqYU68FAUSd7BTDCpKRJSErgDK3AeHA=;
        b=cu7WL763wRkMEHJabv/nMmbGmluNrRa8g7sWGqYtdfD1EkVTsiGlNtoXP/wqC3a/3R
         5rvgfeSFFDJUSndJ96IICVq51Hllw8MYij5wJMrLe30t37bIr1ghB1LUciaPryZs1Ww5
         8PB6v33a0NbzUY2hk+NQS5aNwmlaMHNIVjqvvUI9xgEj9eF96xHfCSlsXMsRH4OwFb+/
         YQsYkX51itLTC+grslfA8z8SaAZAtqGOiRyD1JatU23xrB0BDnI+AzV6GnZMSr5pNXgP
         Y7Wn0FO69g3sdetpGsFtziaBNOwGRVRXxMhQu85PSRc1IrPHIwPEWC1jUM9tddO9YMt6
         v1vA==
X-Gm-Message-State: AAQBX9fuV9I883UhZJKTWHOzYG6RGEGDx0krUTnNF0y8VD7Jn6kvegIf
	7md9RToCOxbd07taEDEzWqQX60sWGibaeQ==
X-Google-Smtp-Source: AKy350bIR7tiQ+0N6UVdGhWfry+Zhc5Yq9iedgCGDPke3j7udqIGj2fL5tvC76u/31c0y2e6lKB+Ng==
X-Received: by 2002:ad4:5aaa:0:b0:56b:f28e:628a with SMTP id u10-20020ad45aaa000000b0056bf28e628amr5434137qvg.6.1679670534368;
        Fri, 24 Mar 2023 08:08:54 -0700 (PDT)
Received: from build.lan (cpe7c9a54441c1f-cm7c9a54441c1d.cpe.net.cable.rogers.com. [173.34.238.88])
        by smtp.gmail.com with ESMTPSA id mf10-20020a0562145d8a00b005dd8b9345e8sm746219qvb.128.2023.03.24.08.08.53
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 24 Mar 2023 08:08:53 -0700 (PDT)
From: bruce.ashfield@gmail.com
To: richard.purdie@linuxfoundation.org
Cc: openembedded-core@lists.openembedded.org
Subject: [PATCH 3/7] linux-yocto/6.1: update to v6.1.20
Date: Fri, 24 Mar 2023 11:08:44 -0400
Message-Id: <a45ded759a9585a09a50799537b1f1f0a29b9eb7.1679670268.git.bruce.ashfield@gmail.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <cover.1679670268.git.bruce.ashfield@gmail.com>
References: <cover.1679670268.git.bruce.ashfield@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Fri, 24 Mar 2023 15:08:57 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/179044

From: Bruce Ashfield <bruce.ashfield@gmail.com>

Updating  to the latest korg -stable release that comprises
the following commits:

    7eaef76fbc46 Linux 6.1.20
    05650b267e67 UML: define RUNTIME_DISCARD_EXIT
    bf899a4b1220 Revert "bpf, test_run: fix &xdp_frame misplacement for LIVE_FRAMES"
    d663e13ca866 filelocks: use mount idmapping for setlease permission check
    38327b6cb1fa drm/amd/display: adjust MALL size available for DCN32 and DCN321
    02c8fa11f545 drm/amd/display: Allow subvp on vactive pipes that are 2560x1440@60
    00e81f191bc0 media: rc: gpio-ir-recv: add remove function
    39111cedd7ba media: ov5640: Fix analogue gain control
    42d9fb70770f scripts: handle BrokenPipeError for python scripts
    9ba7b769cee0 PCI: Add SolidRun vendor ID
    b655ba93b51f macintosh: windfarm: Use unsigned type for 1-bit bitfields
    69c74104b0e9 alpha: fix R_ALPHA_LITERAL reloc for large modules
    f69bbc0bd6d2 powerpc/kcsan: Exclude udelay to prevent recursive instrumentation
    07a5f4e69761 powerpc/64: Move paca allocation to early_setup()
    be2e726fa03a powerpc/64: Fix task_cpu in early boot when booting non-zero cpuid
    5b5fab270f4d powerpc/bpf/32: Only set a stack frame when necessary
    71e9501458aa clk: renesas: rcar-gen3: Disable R-Car H3 ES1.*
    24c1bd1cd0d1 powerpc/iommu: fix memory leak with using debugfs_lookup()
    ac872bb004c3 powerpc/64: Don't recurse irq replay
    5759afd5e584 MIPS: Fix a compilation issue
    e1f5c4c877af tpm/eventlog: Don't abort tpm_read_log on faulty ACPI address
    587a6fda90f3 watch_queue: fix IOC_WATCH_QUEUE_SET_SIZE alloc error paths
    09fa1a6b0cdd drm/msm/adreno: fix runtime PM imbalance at unbind
    d1a3ca3ad486 adreno: Shutdown the GPU properly
    70f12dee2254 drm/amdgpu/soc21: Add video cap query support for VCN_4_0_4
    69a56ace8bc2 drm/amdgpu/soc21: don't expose AV1 if VCN0 is harvested
    2ef7f829214f ext4: Fix deadlock during directory rename
    dc7d4b1a6568 drm/amdgpu: fix return value check in kfd
    0a6321657eb8 RISC-V: Don't check text_mutex during stop_machine
    324912d6c0c4 riscv: Use READ_ONCE_NOCHECK in imprecise unwinding stack mode
    99e9188f9c55 erofs: Revert "erofs: fix kvcalloc() misuse with __GFP_NOFAIL"
    ac1968ac3992 af_unix: fix struct pid leaks in OOB support
    056b022cfc01 net: dsa: mt7530: permit port 5 to work without port 6 on MT7621 SoC
    7a3720361068 SUNRPC: Fix a server shutdown leak
    b93ed36b31c3 octeontx2-af: Unlock contexts in the queue context cache in case of fault detection
    4de04f8f633c net/smc: fix fallback failed while sendmsg with fastopen
    1bd92191773d ethernet: ice: avoid gcc-9 integer overflow warning
    accd7904318a ice: Fix DSCP PFC TLV creation
    ad7760898469 NFSD: Protect against filesystem freezing
    e5febcfbae93 block: fix wrong mode for blkdev_put() from disk_scan_partitions()
    49bfd991410b platform: x86: MLX_PLATFORM: select REGMAP instead of depending on it
    d391a49ba1b2 platform: mellanox: select REGMAP instead of depending on it
    5b5b69e3185f netfilter: conntrack: adopt safer max chain length
    b26b85b18469 scsi: sd: Fix wrong zone_write_granularity value during revalidate
    8f45d2f32c34 scsi: megaraid_sas: Update max supported LD IDs to 240
    715396cca2ce net: tls: fix device-offloaded sendpage straddling records
    0ce686fcab32 net: ethernet: mtk_eth_soc: fix RX data corruption issue
    324361de111d net: phy: smsc: fix link up detection in forced irq mode
    f0c8306c1aa2 btf: fix resolving BTF_KIND_VAR after ARRAY, STRUCT, UNION, PTR
    17d0f2e8daa8 bpf, test_run: fix &xdp_frame misplacement for LIVE_FRAMES
    6a9379eba19b btrfs: fix extent map logging bit not cleared for split maps after dropping range
    ceb089e2337f m68k: mm: Move initrd phys_to_virt handling after paging_init()
    079d37e1624c netfilter: tproxy: fix deadlock due to missing BH disable
    03b5128543d3 netfilter: ctnetlink: revert to dumping mark regardless of event type
    fcae40e65802 bnxt_en: Avoid order-5 memory allocation for TPA data
    796ae31ca256 net: phylib: get rid of unnecessary locking
    b734a6f300d5 net: stmmac: add to set device wake up flag when stmmac init phy
    0592b05c5085 drm/msm/dpu: clear DSPP reservations in rm release
    5ade9afa5c65 drm/msm/dpu: fix clocks settings for msm8998 SSPP blocks
    f8049342f829 drm/msm/dpu: drop DPU_DIM_LAYER from MIXER_MSM8998_MASK
    1ef5491ca2a4 drm/msm/dpu: fix len of sc7180 ctl blocks
    f45cf3ae3068 bpf, sockmap: Fix an infinite loop error when len is 0 in tcp_bpf_recvmsg_parser()
    90b40ab29298 ice: copy last block omitted in ice_get_module_eeprom()
    287027d8a567 net: caif: Fix use-after-free in cfusbl_device_notify()
    34f099b34b42 net: lan78xx: fix accessing the LAN7800's internal phy specific registers from the MAC driver
    0b30a06b20e9 perf stat: Fix counting when initial delay configured
    e8d7615d8f6f net: use indirect calls helpers for sk_exit_memory_pressure()
    14c17c673e1b net: tls: fix possible race condition between do_tls_getsockopt_conf() and do_tls_setsockopt_conf()
    34869f8e713e netfilter: nft_quota: copy content when cloning expression
    227a7266fcd1 netfilter: nft_last: copy content when cloning expression
    5d241eb8a124 selftests: nft_nat: ensuring the listening side is up before starting the client
    6fac771473ca net: lan966x: Fix port police support using tc-matchall
    25b54f247ea0 ila: do not generate empty messages in ila_xlat_nl_cmd_get_mapping()
    78891a3c1e87 drm/msm/dpu: disable features unsupported by QCM2290
    a3a087edd049 tls: rx: fix return value for async crypto
    a7e0439c25f9 powerpc: dts: t1040rdb: fix compatible string for Rev A boards
    ce93f1afc059 nfc: fdp: add null check of devm_kmalloc_array in fdp_nci_i2c_read_device_properties
    3ee0c9fb7f46 bgmac: fix *initial* chip reset to support BCM5358
    56d67b9788da drm/msm/a5xx: fix context faults during ring switch
    ac3af300a2f8 drm/msm/a5xx: fix the emptyness check in the preempt code
    84053e7dc47b drm/msm/a5xx: fix highest bank bit for a530
    d334248d199f drm/msm/a5xx: fix setting of the CP_PREEMPT_ENABLE_LOCAL register
    fa73f67ac0f1 drm/msm: Fix potential invalid ptr free
    5dca696143bf drm/nouveau/kms/nv50: fix nv50_wndw_new_ prototype
    512aa2fd8c9f cifs: improve checking of DFS links over STATUS_OBJECT_NAME_INVALID
    b0bb13612292 ext4: Fix possible corruption when moving a directory
    17e98a5ede81 scsi: core: Remove the /proc/scsi/${proc_name} directory earlier
    0d14555f536a riscv: Add header include guards to insn.h
    82f713e8b881 block: fix scan partition for exclusively open device again
    573e58f5e7e1 block: Revert "block: Do not reread partition table on exclusively open device"
    783c225e910f drm/i915: Populate encoder->devdata for DSI on icl+
    bd61a84b5eee drm/i915: Do panel VBT init early if the VBT declares an explicit panel type
    e340197a4539 drm/i915: Introduce intel_panel_init_alloc()
    87228e1c18dc spi: intel: Check number of chip selects after reading the descriptor
    9858e0fb32b6 ipmi:ssif: Add a timer between request retries
    8a676b6eb2d5 ipmi:ssif: Increase the message retry time
    f12869ff7643 ipmi:ssif: Remove rtc_us_timer
    526a177ac635 Input: exc3000 - properly stop timer on shutdown
    86e9eb69c0e7 bus: mhi: ep: Change state_lock to mutex
    b6dc68ac967a bus: mhi: ep: Power up/down MHI stack during MHI RESET
    9ee18ff099b0 udf: Fix off-by-one error when discarding preallocation
    a926daa8b13c fs: dlm: fix race setting stop tx flag
    3c1bc8ded4e4 fs: dlm: be sure to call dlm_send_queue_flush()
    29682b8a3dba fs: dlm: use WARN_ON_ONCE() instead of WARN_ON()
    a3b0e9ac3c24 fs: dlm: fix use after free in midcomms commit
    387c30389494 fd: dlm: trace send/recv of dlm message and rcom
    8885e12aa107 fs: dlm: use packet in dlm_mhandle
    cb2849caad02 fs: dlm: remove send repeat remove handling
    14c5a584cbf2 fs: dlm: start midcomms before scand
    f78892061075 fs: dlm: add midcomms init/start functions
    e7935f5af426 fs: dlm: fix log of lowcomms vs midcomms
    e136e969d268 KVM: VMX: Do _all_ initialization before exposing /dev/kvm to userspace
    adc0dd8b0439 KVM: x86: Move guts of kvm_arch_init() to standalone helper
    5daa32be8c02 KVM: VMX: Don't bother disabling eVMCS static key on module exit
    afb26bfc01db KVM: VMX: Reset eVMCS controls in VP assist page during hardware disabling
    4d72cdd63909 nfc: change order inside nfc_se_io error path
    4cd8ffa48800 HID: uhid: Over-ride the default maximum data buffer value with our own
    5a144cfe35d8 HID: core: Provide new max_buffer_size attribute to over-ride the default
    9cb27b1e76f0 ext4: zero i_disksize when initializing the bootloader inode
    35161cec7677 ext4: fix WARNING in ext4_update_inline_data
    50a70036ac3a ext4: move where set the MAY_INLINE_DATA flag is set
    eb3a695aa71a ext4: fix another off-by-one fsmap error on 1k block filesystems
    f3b8cc218bd1 ext4: fix RENAME_WHITEOUT handling for inline directories
    f327490e0500 ext4: fix cgroup writeback accounting with fs-layer encryption
    f0417bf138af staging: rtl8723bs: Pass correct parameters to cfg80211_get_bss()
    4a6d23b76c12 staging: rtl8723bs: Fix key-store index handling
    8d2ca666a7b4 drm/connector: print max_requested_bpc in state debugfs
    9f6f6f42b9ef drm/display: Don't block HDR_OUTPUT_METADATA on unknown EOTF
    d07d152d762d drm/amdgpu: fix error checking in amdgpu_read_mm_registers for nv
    a11e210dc595 drm/amdgpu: fix error checking in amdgpu_read_mm_registers for soc21
    39190482e5d0 drm/amdgpu: fix error checking in amdgpu_read_mm_registers for soc15
    cc4dd679912d x86/CPU/AMD: Disable XSAVES on AMD family 0x17
    1c39d126b51b RISC-V: Stop emitting attributes
    120f7a928719 fork: allow CLONE_NEWTIME in clone3 flags
    a36f845f57a9 perf inject: Fix --buildid-all not to eat up MMAP2
    fa4056781ac0 erofs: fix wrong kunmap when using LZMA on HIGHMEM platforms
    da8fab32a712 io_uring/uring_cmd: ensure that device supports IOPOLL
    fceed91ea1ba btrfs: fix percent calculation for bg reclaim message
    99d232798c06 btrfs: fix unnecessary increment of read error stat on write error
    cec08b7d1ebc fs: prevent out-of-bounds array speculation when closing a file descriptor
    6449a0ba6843 Linux 6.1.19
    49393a43c63a staging: rtl8192e: Remove call_usermodehelper starting RadioPower.sh
    83d76e3d8b91 staging: rtl8192e: Remove function ..dm_check_ac_dc_power calling a script
    7b3eac1950e7 wifi: cfg80211: Partial revert "wifi: cfg80211: Fix use after free for wext"
    dc64dc4c80ae tpm: disable hwrng for fTPM on some AMD designs
    1cc3fcf63192 Linux 6.1.18
    cc4b55a48f4a usb: gadget: uvc: fix missing mutex_unlock() if kstrtou8() fails
    58b656177d17 arm64: Reset KASAN tag in copy_highpage with HW tags only
    96122e776fe7 arm64: mte: Fix/clarify the PG_mte_tagged semantics
    8b38969fa016 arm64: efi: Make efi_rt_lock a raw_spinlock
    c6b9c79c3df9 io_uring/poll: allow some retries for poll triggering spuriously
    3453b1b0439b io_uring: fix two assignments in if conditions
    4ca25c0b74dd media: uvcvideo: Fix race condition with usb_kill_urb
    27b5871abd5c drm/i915: Fix system suspend without fbdev being initialized
    fb5f2b42650f drm/i915/dp_mst: Add the MST topology state for modesetted CRTCs
    6e48e7901e62 drm/display/dp_mst: Fix payload addition on a disconnected sink
    efe5ce019a9b drm/display/dp_mst: Fix down message handling after a packet reception error
    b30fcedeba64 drm/display/dp_mst: Fix down/up message handling after sink disconnect
    6130b22fb677 drm/display/dp_mst: Add drm_atomic_get_old_mst_topology_state()
    beb15de99ae8 vDPA/ifcvf: allocate the adapter in dev_add()
    dd5d2d8821b2 vDPA/ifcvf: manage ifcvf_hw in the mgmt_dev
    6ddb3b805827 vDPA/ifcvf: ifcvf_request_irq works on ifcvf_hw
    154c0aea566d vDPA/ifcvf: decouple config/dev IRQ requester and vectors allocator from the adapter
    e35beaa142d7 vDPA/ifcvf: decouple vq irq requester from the adapter
    c0fca7704f5e vDPA/ifcvf: decouple config IRQ releaser from the adapter
    62fb450c4dd2 vDPA/ifcvf: decouple vq IRQ releasers from the adapter
    aa2af9353aeb vDPA/ifcvf: alloc the mgmt_dev before the adapter
    50da55ec0f04 vDPA/ifcvf: decouple config space ops from the adapter
    447d1c9abc84 vDPA/ifcvf: decouple hw features manipulators from the adapter
    7ec0076b424e x86/resctl: fix scheduler confusion with 'current'
    1f800f6aae57 net: tls: avoid hanging tasks on the tx_lock
    f5a21755ee55 soundwire: cadence: Drain the RX FIFO after an IO timeout
    51eb90be9fd8 soundwire: cadence: Remove wasted space in response_buf
    425cd1b47124 iommu: Attach device group to old domain in error path
    4e11ac106f69 RDMA/cma: Distinguish between sockaddr_in and sockaddr_in6 by size
    a577aac0dac6 phy: rockchip-typec: Fix unsigned comparison with less than zero
    52ec1cae5277 PCI: pciehp: Add Qualcomm quirk for Command Completed erratum
    455ed25b5945 PCI: Add ACS quirk for Wangxun NICs
    2d07ad44e741 PCI: loongson: Add more devices that need MRRS quirk
    29d53c4c5a6f kernel/fail_function: fix memory leak with using debugfs_lookup()
    5a7a9efdb193 drivers: base: dd: fix memory leak with using debugfs_lookup()
    79ac2b01e033 drivers: base: component: fix memory leak with using debugfs_lookup()
    d1c545e44c1e misc: vmw_balloon: fix memory leak with using debugfs_lookup()
    4459d1e7bd04 tty: pcn_uart: fix memory leak with using debugfs_lookup()
    d1589b73519e PCI: Distribute available resources for root buses, too
    bf1ab09d2c45 PCI: Take other bus devices into account when distributing resources
    a39f741e6021 PCI: Align extra resources for hotplug bridges properly
    8dd58d3c1385 usb: gadget: uvc: Make bSourceID read/write
    7a7de5957b8f usb: uvc: Enumerate valid values for color matching
    ff542083b105 USB: ene_usb6250: Allocate enough memory for full object
    cbf54771bc21 usb: host: xhci: mvebu: Iterate over array indexes instead of using pointer math
    b14d188d0d0b USB: gadget: pxa27x_udc: fix memory leak with using debugfs_lookup()
    78d9586d8e72 USB: gadget: pxa25x_udc: fix memory leak with using debugfs_lookup()
    7a5fdd866017 USB: gadget: lpc32xx_udc: fix memory leak with using debugfs_lookup()
    31de0b70ae56 USB: gadget: bcm63xx_udc: fix memory leak with using debugfs_lookup()
    be21a66e17ee USB: gadget: gr_udc: fix memory leak with using debugfs_lookup()
    b0a8195a84a7 USB: isp1362: fix memory leak with using debugfs_lookup()
    542a99cd6ead USB: isp116x: fix memory leak with using debugfs_lookup()
    7d2d3bef6d70 USB: fotg210: fix memory leak with using debugfs_lookup()
    54166af8941d USB: sl811: fix memory leak with using debugfs_lookup()
    e529aeb771ae USB: uhci: fix memory leak with using debugfs_lookup()
    dcbe69f4f743 USB: ULPI: fix memory leak with using debugfs_lookup()
    610373dd354f USB: chipidea: fix memory leak with using debugfs_lookup()
    ce234af49d10 USB: dwc3: fix memory leak with using debugfs_lookup()
    04f3cda40e9f staging: pi433: fix memory leak with using debugfs_lookup()
    d8c911d3d879 PCI: loongson: Prevent LS7A MRRS increases
    bace2a37de7c soundwire: bus_type: Avoid lockdep assert in sdw_drv_probe()
    638eeb0e8ade media: uvcvideo: Add GUID for BGRA/X 8:8:8:8
    f5a2a15da3bc iio: accel: mma9551_core: Prevent uninitialized variable in mma9551_read_config_word()
    be0c84d90807 iio: accel: mma9551_core: Prevent uninitialized variable in mma9551_read_status_word()
    2d1716aba462 bus: mhi: ep: Fix the debug message for MHI_PKT_TYPE_RESET_CHAN_CMD cmd
    945877c145dd tools/iio/iio_utils:fix memory leak
    947530c84044 mei: bus-fixup:upon error print return values of send and receive
    f57c2164d082 serial: sc16is7xx: setup GPIO controller later in probe
    59aba0393275 tty: serial: fsl_lpuart: disable the CTS when send break signal
    765566110eb0 tty: fix out-of-bounds access in tty_driver_lookup_tty()
    3c8dce696a66 staging: emxx_udc: Add checks for dma_alloc_coherent()
    2f588d0345d6 cacheinfo: Fix shared_cpu_map to handle shared caches at different levels
    c68ece7baf2a USB: fix memory leak with using debugfs_lookup()
    15aed90f3e05 media: uvcvideo: Silence memcpy() run-time false positive warnings
    3c4a3bbe025c media: uvcvideo: Quirk for autosuspend in Logitech B910 and C910
    acfed4676a59 media: uvcvideo: Handle errors from calls to usb_string
    11196ee3916e media: uvcvideo: Handle cameras with invalid descriptors
    2c8ea08b86a5 media: uvcvideo: Remove format descriptions
    7b41160db120 PCI/ACPI: Account for _S0W of the target bridge in acpi_pci_bridge_d3()
    60ac0a6de6b0 iommu/amd: Fix error handling for pdev_pri_ats_enable()
    2ec4d5ef0800 IB/hfi1: Update RMT size calculation
    9893771097b2 mfd: arizona: Use pm_runtime_resume_and_get() to prevent refcnt leak
    8caa60c20ae1 bootconfig: Increase max nodes of bootconfig from 1024 to 8192 for DCC support
    a6426afbca51 firmware/efi sysfb_efi: Add quirk for Lenovo IdeaPad Duet 3
    c578a68ffcdc kernel/printk/index.c: fix memory leak with using debugfs_lookup()
    2072332c04df tracing: Add NULL checks for buffer in ring_buffer_free_read_page()
    92271fc1cc5d thermal: intel: BXT_PMIC: select REGMAP instead of depending on it
    69e49f1b5360 thermal: intel: quark_dts: fix error pointer dereference
    ada41093fb1b ASoC: mediatek: mt8195: add missing initialization
    bb12470672e7 ASoC: zl38060 add gpiolib dependency
    daf8c1062d13 nvme-fabrics: show well known discovery name
    fe2d9e54165d nvme-tcp: don't access released socket during error recovery
    117dc3f6b641 nvme: bring back auto-removal of deleted namespaces during sequential scan
    124fee6c62b2 ASoC: apple: mca: Improve handling of unavailable DMA channels
    0c398c1c19ff ASoC: apple: mca: Fix SERDES reset sequence
    c664c3835519 ASoC: apple: mca: Fix final status read on SERDES reset
    f558edac8f6c ASoC: adau7118: don't disable regulators on device unbind
    4be26d553a3f loop: loop_set_status_from_info() check before assignment
    b0498e95cae7 io_uring: fix size calculation when registering buf ring
    1e276e8acb8e rtc: allow rtc_read_alarm without read_alarm callback
    6a675a6d57d3 scsi: mpi3mr: Use number of bits to manage bitmap sizes
    abfe73c16b29 scsi: mpi3mr: Fix an issue found by KASAN
    66050599b980 scsi: ipr: Work around fortify-string warning
    926aef60ea64 genirq/ipi: Fix NULL pointer deref in irq_data_get_affinity_mask()
    9425d1ee2c0c rtc: sun6i: Always export the internal oscillator
    aa7dc954e809 spi: tegra210-quad: Fix iterator outside loop
    d6e15f8de5b5 vc_screen: modify vcs_size() handling in vcs_read()
    95c131b41f00 tcp: tcp_check_req() can be called from process context
    fb987e7a9bd0 ARM: dts: spear320-hmi: correct STMPE GPIO compatible
    df2dac168c74 net: dsa: felix: fix internal MDIO controller resource length
    9df677d78130 net: dsa: seville: ignore mscc-miim read errors from Lynx PCS
    113d2d158f24 net/sched: act_sample: fix action bind logic
    af8bfc1add67 net/sched: act_mpls: fix action bind logic
    2cabfa2c404d net/sched: act_pedit: fix action bind logic
    d3ad82430e9b net/sched: transition act_pedit to rcu and percpu stats
    b2036a252381 nfc: fix memory leak of se_io context in nfc_genl_se_io
    f19d8f93682a ext4: fix incorrect options show of original mount_opt and extend mount_opt2
    2b7cf1bcd447 net/mlx5: Geneve, Fix handling of Geneve object id as error code
    a383f5fcc891 net/mlx5e: Verify flow_source cap before using it
    2a0b214ab49f net/mlx5: ECPF, wait for VF pages only after disabling host PFs
    52e6e7a0bc04 mlx5: fix possible ptp queue fifo use-after-free
    234cffda95e1 mlx5: fix skb leak while fifo resync and push
    f6c0536b41e6 spi: tegra210-quad: Fix validate combined sequence
    7dd49d434d2e 9p/rdma: unmap receive dma buffer in rdma_request()/post_recv()
    4f0e9244770f 9p/xen: fix connection sequence
    db886cb3ecc6 9p/xen: fix version parsing
    896f014a1761 net: fix __dev_kfree_skb_any() vs drop monitor
    8dba9e7073a0 octeontx2-pf: Use correct struct reference in test condition
    03c3a5584a0a sctp: add a refcnt in sctp_stream_priorities to avoid a nested loop
    d28467230dd9 net: sunhme: Fix region request
    e3aa5d1bb1b2 octeontx2-pf: Recalculate UDP checksum for ptp 1-step sync packet
    e11e4d524eba ipv6: Add lwtunnel encap size of all siblings in nexthop calculation
    b232d4e840ed drm/i915: move a Kconfig symbol to unbreak the menu presentation
    f94becae90b0 ptp: vclock: use mutex to fix "sleep on atomic" bug
    512b6c4b83c9 netfilter: x_tables: fix percpu counter block leak on error path when creating new netns
    ffba2d579026 netfilter: ctnetlink: make event listener tracking global
    f2ccb36b8f76 netfilter: xt_length: use skb len to match in length_mt6
    3dd6ac973351 netfilter: ebtables: fix table blob use-after-free
    8291cfdfa6cd netfilter: ip6t_rpfilter: Fix regression with VRF interfaces
    1fd3c69f6511 netfilter: conntrack: fix rmmod double-free race
    4f25d1dff805 netfilter: ctnetlink: fix possible refcount leak in ctnetlink_create_conntrack()
    12a91ade681b watchdog: sbsa_wdog: Make sure the timeout programming is within the limits
    ce64f72e988b watchdog: pcwd_usb: Fix attempting to access uninitialized memory
    ac099d94e048 watchdog: Fix kmemleak in watchdog_cdev_register
    89c682e9d04c watchdog: at91sam9_wdt: use devm_request_irq to avoid missing free_irq() in error path
    1bcf3a9846e8 watchdog: rzg2l_wdt: Handle TYPE-B reset for RZ/V2M
    edaed0cd7695 watchdog: rzg2l_wdt: Issue a reset before we put the PM clocks
    102b82708c15 f2fs: synchronize atomic write aborts
    a02a91057652 um: virt-pci: properly remove PCI device from bus
    e38d2adf110c um: virtio_uml: move device breaking into workqueue
    1954d3cd49d3 um: virtio_uml: mark device as unregistered when breaking it
    4e774bf6ea50 um: virtio_uml: free command if adding to virtqueue failed
    28ebc1164a45 x86: um: vdso: Add '%rcx' and '%r11' to the syscall clobber list
    44b713a24251 netfilter: nf_tables: allow to fetch set elements when table has an owner
    13a6366bbfa2 ext4: don't show commit interval if it is zero
    aa936286e71a ext4: use ext4_fc_tl_mem in fast-commit replay path
    0bf3672946a3 soc: qcom: stats: Populate all subsystem debugfs files
    22ddbbff116e f2fs: fix to avoid potential memory corruption in __update_iostat_latency()
    cc4bc532acda ubi: ubi_wl_put_peb: Fix infinite loop when wear-leveling work failed
    84253f3c2dad ubi: Fix UAF wear-leveling entry in eraseblk_count_seq_show()
    c670b05127d3 ubi: fastmap: Fix missed fm_anchor PEB in wear-leveling after disabling fastmap
    7750be5d3e18 ubifs: ubifs_releasepage: Remove ubifs_assert(0) to valid this process
    824452d5e90f ubifs: ubifs_writepage: Mark page dirty after writing inode failed
    76c488e8a0e2 ubifs: dirty_cow_znode: Fix memleak in error handling path
    0b8beac8a3c5 ubifs: Re-statistic cleaned znode count if commit failed
    2ea7195b1950 ubi: Fix possible null-ptr-deref in ubi_free_volume()
    26ec45f1c504 ubifs: Fix memory leak in alloc_wbufs()
    27b760b81951 ubi: Fix unreferenced object reported by kmemleak in ubi_resize_volume()
    b0c951742348 ubi: Fix use-after-free when volume resizing failed
    c17e1ae20f6b ubifs: Reserve one leb for each journal head while doing budget
    31282bc47fcd ubifs: do_rename: Fix wrong space budget when target inode's nlink > 1
    b08071c68b58 ubifs: Fix wrong dirty space budget for dirty inode
    f8bd27b6252a ubifs: Rectify space budget for ubifs_xrename()
    f9e074845367 ubifs: Rectify space budget for ubifs_symlink() if symlink is encrypted
    1c5fdf2d4647 ubifs: Fix memory leak in ubifs_sysfs_init()
    7508453ede98 ubifs: Fix build errors as symbol undefined
    61aeba0e4b41 ubi: ensure that VID header offset + VID header size <= alloc, size
    c8583b4655aa um: vector: Fix memory leak in vector_config
    14e8bd4cfae3 f2fs: fix to abort atomic write only during do_exist()
    e11707d5f86f f2fs: allow set compression option of files without blocks
    05006a1521d8 fs: f2fs: initialize fsdata in pagecache_write()
    125f89809501 soc: mediatek: mtk-svs: Use pm_runtime_resume_and_get() in svs_init01()
    8fc4291f8de2 soc: mediatek: mtk-svs: reset svs when svs_resume() fail
    e05aa300fb69 soc: mediatek: mtk-svs: restore default voltages when svs_init02() fail
    0b65ff13f943 f2fs: clear atomic_write_task in f2fs_abort_atomic_write()
    4bc488c5ca0e f2fs: correct i_size change for atomic writes
    9ad51915f4b3 f2fs: introduce trace_f2fs_replace_atomic_write_block
    9a0af7cb1c0b pwm: stm32-lp: fix the check on arr and cmp registers update
    094ffaf50bb9 pwm: sifive: Always let the first pwm_apply_state succeed
    6b99ebd30d65 soc: mediatek: mtk-svs: Enable the IRQ later
    2c82bf3f1762 memory: renesas-rpc-if: Move resource acquisition to .probe()
    fbb7c9096342 memory: renesas-rpc-if: Split-off private data from struct rpcif
    e59c4d34f8ec soc: mediatek: mtk-pm-domains: Allow mt8186 ADSP default power on
    a8f63d747bf7 objtool: Fix memory leak in create_static_call_sections()
    4a229379a72e f2fs: fix to avoid potential deadlock
    14b3742f34b1 f2fs: don't rely on F2FS_MAP_* in f2fs_iomap_begin
    d35290addcba driver: soc: xilinx: fix memory leak in xlnx_add_cb_for_notify_event()
    1f4a325933f8 fs/jfs: fix shift exponent db_agl2size negative
    6cd37f8232f5 auxdisplay: hd44780: Fix potential memory leak in hd44780_remove()
    3abebc503a51 net/sched: Retire tcindex classifier
    11585e2f8b9d Linux 6.1.17
    deef2947d5f6 Revert "blk-cgroup: dropping parent refcount after pd_free_fn() is done"
    b5dae1cd0d83 Revert "blk-cgroup: synchronize pd_free_fn() from blkg_free_workfn() and blkcg_deactivate_policy()"
    8a923980a190 Linux 6.1.16
    7c7570791b15 net: avoid double iput when sock_alloc_file fails
    5355a120e428 kbuild: Port silent mode detection to future gnu make.
    ff9571a4dee9 sbitmap: Try each queue to wake up at least one waiter
    d710b1e91bc0 wait: Return number of exclusive waiters awaken
    12815a7d8f82 sbitmap: Advance the queue index before waking up a queue
    7ebde70510a1 brd: use radix_tree_maybe_preload instead of radix_tree_preload
    48d46319bedc qede: avoid uninitialized entries in coal_entry array
    f0f427f3858f drm/edid: fix parsing of 3D modes from HDMI VSDB
    26cbe4c63d1e drm/edid: fix AVI infoframe aspect ratio handling
    832f861a4603 drm/gud: Fix UBSAN warning
    be11d0d9c4eb drm/i915: Don't use BAR mappings for ring buffers with LLC
    d805c28e11fc drm/i915: Don't use stolen memory for ring buffers with LLC
    8551ddbff0c3 drm/radeon: Fix eDP for single-display iMac11,2
    c63e43906ba6 drm/i915/quirks: Add inverted backlight quirk for HP 14-r206nv
    749b249d1ba9 drm/amd: Fix initialization for nbio 7.5.1
    bf119a3c9c9f vfio/type1: restore locked_vm
    9f0fd4f8ec0c vfio/type1: track locked_vm per dma
    a6b2aabe6640 vfio/type1: prevent underflow of locked_vm via exec()
    e8c21b19c2d0 vfio/type1: exclude mdevs from VFIO_UPDATE_VADDR
    2bed9455db7c iommu/vt-d: Fix PASID directory pointer coherency
    fd045119e1ab iommu/vt-d: Avoid superfluous IOTLB tracking in lazy mode
    01836e56fdd2 bus: mhi: ep: Save channel state locally during suspend and resume
    69cc38576293 bus: mhi: ep: Move chan->lock to the start of processing queued ch ring
    353aea15d6ed bus: mhi: ep: Only send -ENOTCONN status if client driver is available
    189f856e76f5 PCI/DPC: Await readiness of secondary bus after reset
    358dbd575101 PCI: Avoid FLR for AMD FCH AHCI adapters
    6ea16c1e6853 PCI: hotplug: Allow marking devices as disconnected during bind/unbind
    24400824053f PCI: Unify delay handling for reset and resume
    ef56d0e0b779 PCI/PM: Observe reset delay irrespective of bridge_d3
    d7608b85661b MIPS: DTS: CI20: fix otg power gpio
    676465bf756b riscv: ftrace: Reduce the detour code size to half
    8d4084ccdfce riscv: ftrace: Remove wasted nops for !RISCV_ISA_C
    6e433ccb6844 riscv, mm: Perform BPF exhandler fixup on page fault
    49064b50704b riscv: jump_label: Fixup unaligned arch_static_branch function
    4c71ccae1d28 riscv: mm: fix regression due to update_mmu_cache change
    3e92e7fa24ac riscv: Avoid enabling interrupts in die()
    a1f8e6981488 RISC-V: add a spin_shadow_stack declaration
    82143faf01dd scsi: ses: Fix slab-out-of-bounds in ses_intf_remove()
    414418abc19f scsi: ses: Fix possible desc_ptr out-of-bounds accesses
    27067c672980 scsi: ses: Fix possible addl_desc_ptr out-of-bounds accesses
    0dfe68394cbe scsi: ses: Fix slab-out-of-bounds in ses_enclosure_data_process()
    5ca5470b33e5 scsi: ses: Don't attach if enclosure has no components
    7fa1203a1e6f scsi: qla2xxx: Remove increment of interface err cnt
    d5da42d99c70 scsi: qla2xxx: Fix erroneous link down
    98ee35fb6ffe scsi: qla2xxx: Remove unintended flag clearing
    3ee4f1991c54 scsi: qla2xxx: Fix DMA-API call trace on NVMe LS requests
    494074747091 scsi: qla2xxx: Check if port is online before sending ELS
    54bf124b960d scsi: qla2xxx: Fix link failure in NPIV environment
    86bdf3ffff8d scsi: aacraid: Allocate cmd_priv with scsicmd
    be8301e2d5a8 iommu/amd: Improve page fault error reporting
    2ae19ac3ea82 iommu/amd: Add a length limitation for the ivrs_acpihid command-line parameter
    4aa738940016 tracing/eprobe: Fix to add filter on eprobe description in README file
    b1e96ca73cf9 tools/bootconfig: fix single & used for logical condition
    9674390ac540 ring-buffer: Handle race between rb_move_tail and rb_check_pages
    313b18c77466 memory tier: release the new_memtier in find_create_memory_tier()
    e10a97f68480 ktest.pl: Add RUN_TIMEOUT option with default unlimited
    81dca9177d01 ktest.pl: Fix missing "end_monitor" when machine check fails
    a467e3e04de6 kprobes: Fix to handle forcibly unoptimized kprobes on freeing_list
    76c2ecaf570a ktest.pl: Give back console on Ctrt^C on monitor
    71946389a765 mm/thp: check and bail out if page in deferred queue already
    f65d6ee1d1c4 mm: memcontrol: deprecate charge moving
    58c02890a32c docs: gdbmacros: print newest record
    4509a11ec3bc remoteproc/mtk_scp: Move clk ops outside send_lock
    9b15b558cdb8 media: ipu3-cio2: Fix PM runtime usage_count in driver unbind
    e39c25b0c115 mips: fix syscall_get_nr
    6b60250d8a82 dax/kmem: Fix leak of memory-hotplug resources
    37d1b326c95c alpha: fix FEN fault handling
    deab8114fb67 mm/hwpoison: convert TTU_IGNORE_HWPOISON to TTU_HWPOISON
    e6737d97722a panic: fix the panic_print NMI backtrace setting
    c61df79a4ed4 regulator: core: Use ktime_get_boottime() to determine how long a regulator was off
    d15bc167c6a2 ceph: update the time stamps and try to drop the suid/sgid
    faa7b683e436 rbd: avoid use-after-free in do_rbd_add() when rbd_dev_create() fails
    bea92c2d45a5 fuse: add inode/permission checks to fileattr_get/fileattr_set
    5a66e59e1fd9 arm64: mm: hugetlb: Disable HUGETLB_PAGE_OPTIMIZE_VMEMMAP
    17a7cd7bdb68 ARM: dts: exynos: correct TMU phandle in Odroid HC1
    dcfb64e88941 ARM: dts: exynos: correct TMU phandle in Odroid XU
    7d633d11724f ARM: dts: exynos: correct TMU phandle in Exynos5250
    635d07cff6de ARM: dts: exynos: correct TMU phandle in Odroid XU3 family
    2b957333aaaf ARM: dts: exynos: correct TMU phandle in Exynos4
    3a5c8e52f32d ARM: dts: exynos: correct TMU phandle in Exynos4210
    f8187b3faf97 ARM: dts: qcom: sdx55: Add Qcom SMMU-500 as the fallback for IOMMU node
    75862e6fe659 ARM: dts: qcom: sdx65: Add Qcom SMMU-500 as the fallback for IOMMU node
    688ae6ce05be hwmon: (nct6775) Fix incorrect parenthesization in nct6775_write_fan_div()
    57c07e552e0d hwmon: (peci/cputemp) Fix off-by-one in coretemp_label allocation
    70a135c6d1e0 dm flakey: fix a bug with 32-bit highmem systems
    be360c83f2d8 dm flakey: don't corrupt the zero page
    673a3af21d5e dm cache: free background tracker's queued work in btracker_destroy
    ea603083f9d7 dm flakey: fix logic when corrupting a bio
    b57ba4e95250 thermal: intel: powerclamp: Fix cur_state for multi package system
    6f2bce88c134 qede: fix interrupt coalescing configuration
    6bfdc8194245 cpuidle: add ARCH_SUSPEND_POSSIBLE dependencies
    dd43f8f90206 wifi: cfg80211: Set SSID if it is not already set
    22dfb21bf1cd wifi: cfg80211: Fix use after free for wext
    b18188e87f1c wifi: ath11k: allow system suspend to survive ath11k
    3182ece59779 wifi: rtl8xxxu: Use a longer retry limit of 48
    19fcf5d50c5a wifi: rtw88: use RTW_FLAG_POWERON flag to prevent to power on/off twice
    2b3c953226cb dm: add cond_resched() to dm_wq_requeue_work()
    7f093695b49a dm: add cond_resched() to dm_wq_work()
    bc0734f689f8 dm: send just one event on resize, not two
    53b2916ebde7 mtd: spi-nor: Fix shift-out-of-bounds in spi_nor_set_erase_type
    10aed92f7f6b mtd: spi-nor: spansion: Consider reserved bits in CFR5 register
    bd74e1e3dc77 mtd: spi-nor: sfdp: Fix index value for SCCR dwords
    a371788d4f4a cxl/pmem: Fix nvdimm registration races
    05cbf6ddd984 ext4: refuse to create ea block when umounted
    8b6d06b3be76 ext4: optimize ea_inode block expansion
    45b99c35f812 jbd2: fix data missing when reusing bh which is ready to be checkpointed
    2439ccfa5da2 ALSA: hda/realtek: Add quirk for HP EliteDesk 800 G6 Tower PC
    98606a002d71 ALSA: ice1712: Do not left ice->gpio_mutex locked in aureon_add_controls()
    daa5a586e43a mm/damon/paddr: fix missing folio_put()
    dc3809f39035 crypto: qat - fix out-of-bounds read
    d2bea5788847 irqdomain: Fix domain registration race
    b89b0c737d1c irqdomain: Fix mapping-creation race
    1c89f39e754f irqdomain: Refactor __irq_domain_alloc_irqs()
    1b4aa065ea46 irqdomain: Drop bogus fwspec-mapping error handling
    b6655a4910a6 irqdomain: Look for existing mapping only once
    deb243ca052b irqdomain: Fix disassociation race
    33bf92b1d00a irqdomain: Fix association race
    82f3b18daef7 selftests: seccomp: Fix incorrect kernel headers search path
    5bed9f821f2a selftests: vm: Fix incorrect kernel headers search path
    0545d5d25c9e selftests: dmabuf-heaps: Fix incorrect kernel headers search path
    88c2276087e3 selftests: drivers: Fix incorrect kernel headers search path
    fe2ff9d2af85 selftests: futex: Fix incorrect kernel headers search path
    f3b63b7fae23 selftests: ipc: Fix incorrect kernel headers search path
    ce31cc0d43fc selftests: perf_events: Fix incorrect kernel headers search path
    f7007a7a7723 selftests: mount_setattr: Fix incorrect kernel headers search path
    238d9471a70c selftests: move_mount_set_group: Fix incorrect kernel headers search path
    33adb9b047be selftests: rseq: Fix incorrect kernel headers search path
    d804597155ec selftests: sync: Fix incorrect kernel headers search path
    5baeb2a2a247 selftests: ptp: Fix incorrect kernel headers search path
    cdc9cfaa0ba0 selftests: user_events: Fix incorrect kernel headers search path
    f12ec4e7a80c selftests: filesystems: Fix incorrect kernel headers search path
    38fe9e0cbd0f selftests: gpio: Fix incorrect kernel headers search path
    277ec3b556b3 selftests: media_tests: Fix incorrect kernel headers search path
    2b6933dd5707 selftests: kcmp: Fix incorrect kernel headers search path
    1af311d9104c selftests: membarrier: Fix incorrect kernel headers search path
    c1017c80fa82 selftests: pidfd: Fix incorrect kernel headers search path
    a9588d80b7b0 selftests: clone3: Fix incorrect kernel headers search path
    ef3d77238925 selftests: arm64: Fix incorrect kernel headers search path
    c490a85e7dac selftests: pid_namespace: Fix incorrect kernel headers search path
    168f19fffa65 selftests: core: Fix incorrect kernel headers search path
    3005b2695175 selftests: sched: Fix incorrect kernel headers search path
    db66ebfba234 selftests/ftrace: Fix eprobe syntax test case to check filter support
    991ec754899e selftests/powerpc: Fix incorrect kernel headers search path
    3b3016f874fc ima: Align ima_file_mmap() parameters with mmap_file LSM hook
    7327b30a0084 ima: fix error handling logic when file measurement failed
    1beb41094bbf brd: check for REQ_NOWAIT and set correct page allocation mask
    f832bd2ee4c4 brd: return 0/-error from brd_insert_page()
    95bb37e077db brd: mark as nowait compatible
    3adf063bac2f virt/sev-guest: Return -EIO if certificate buffer is not large enough
    38834acf5917 Documentation/hw-vuln: Document the interaction between IBRS and STIBP
    08d87c87d646 x86/speculation: Allow enabling STIBP with legacy IBRS
    d576547f489c x86/microcode/AMD: Fix mixed steppings support
    88d3d95e75f2 x86/microcode/AMD: Add a @cpu parameter to the reloading functions
    05749fd36631 x86/microcode/amd: Remove load_microcode_amd()'s bsp parameter
    57d9df918745 x86/kprobes: Fix arch_check_optimized_kprobe check within optimized_kprobe range
    1a3439f548e2 x86/kprobes: Fix __recover_optprobed_insn check optimizing logic
    e9d033963606 x86/reboot: Disable SVM, not just VMX, when stopping CPUs
    4f555b03a02b x86/reboot: Disable virtualization in an emergency if SVM is supported
    77ace6654355 x86/crash: Disable virt in core NMI crash handler to avoid double shootdown
    c4765c973c1d x86/virt: Force GIF=1 prior to disabling SVM (for reboot flows)
    b261024d7ea8 selftests: x86: Fix incorrect kernel headers search path
    32f87ee52113 KVM: SVM: hyper-v: placate modpost section mismatch error
    a92d045f3706 KVM: SVM: Fix potential overflow in SEV's send|receive_update_data()
    d639b16492fa KVM: x86: Inject #GP on x2APIC WRMSR that sets reserved bits 63:32
    14f36160c7d1 KVM: x86: Inject #GP if WRMSR sets reserved bits in APIC Self-IPI
    97b2c22ec819 KVM: SVM: Don't put/load AVIC when setting virtual APIC mode
    1ccd12324abd KVM: SVM: Process ICR on AVIC IPI delivery failure due to invalid target
    dbc2e9451559 KVM: SVM: Flush the "current" TLB when activating AVIC
    59038be57a4a KVM: x86: Don't inhibit APICv/AVIC if xAPIC ID mismatch is due to 32-bit ID
    b9e428136129 KVM: x86: Don't inhibit APICv/AVIC on xAPIC ID "change" if APIC is disabled
    084a6deb86ab KVM: x86: Blindly get current x2APIC reg value on "nodecode write" traps
    688e3a1bf3e4 KVM: x86: Purge "highest ISR" cache when updating APICv state
    59320074afa4 KVM: Register /dev/kvm as the _very_ last thing during initialization
    b2de2b4d4e00 KVM: VMX: Fix crash due to uninitialized current_vmcs
    ccf6a7fb1aed KVM: Destroy target device if coalesced MMIO unregistration fails
    5e2d29b58c2c RDMA/siw: Fix user page pinning accounting
    42991f51d283 md: don't update recovery_cp when curr_resync is ACTIVE
    12d461e224ef udf: Fix file corruption when appending just after end of preallocated extent
    1f328751b65c udf: Detect system inodes linked into directory hierarchy
    65f64fb9c2ab udf: Preserve link count of system files
    6837910aeb2c udf: Do not update file length for failed writes to inline files
    adac9ac6d2e0 udf: Do not bother merging very long extents
    0e7d8e2991e5 udf: Truncate added extents on failed expansion
    21477427ecb4 selftests/landlock: Test ptrace as much as possible with Yama
    6c51c0702815 selftests/landlock: Skip overlayfs tests when not supported
    fa7e18233f4f fs/cramfs/inode.c: initialize file_ra_state
    85cdc9d2c865 ocfs2: fix non-auto defrag path not working issue
    8163ea90d89b ocfs2: fix defrag path triggering jbd2 ASSERT
    83dbb9a1bd5e f2fs: fix kernel crash due to null io->bio
    de33f129253e f2fs: fix cgroup writeback accounting with fs-layer encryption
    85e128901583 f2fs: retry to update the inode page given data corruption
    f07a8d61b6ea f2fs: fix information leak in f2fs_move_inline_dirents()
    9f955165d8d7 fs: dlm: send FIN ack back in right cases
    e3df326f8cc2 fs: dlm: move sending fin message into state change handling
    83c8cb2ba0ad fs: dlm: don't set stop rx flag after node reset
    375009e22bd2 exfat: fix inode->i_blocks for non-512 byte sector size device
    0fb929e7553d exfat: redefine DIR_DELETED as the bad cluster number
    88384ae34a41 exfat: fix unexpected EOF while reading dir
    569a77e5b882 exfat: fix reporting fs error when reading dir beyond EOF
    0c80bef0b7d2 fs: hfsplus: fix UAF issue in hfsplus_put_super
    8140cdc57bc5 hfs: fix missing hfs_bnode_get() in __hfs_bnode_create
    55c9ddf6c656 io_uring: mark task TASK_RUNNING before handling resume/task work
    f2e0fd28328f ARM: dts: exynos: correct HDMI phy compatible in Exynos4
    77837a24bc54 torture: Fix hang during kthread shutdown phase
    6bf555ed8938 ksmbd: fix possible memory leak in smb2_lock()
    df6c263a31a4 ksmbd: do not allow the actual frame length to be smaller than the rfc1002 length
    2254e82d2018 ksmbd: fix wrong data area length for smb2 lock request
    35ab0cadbcc2 locking/rwsem: Prevent non-first waiter from spinning in down_write() slowpath
    9b59fb27d4c5 btrfs: hold block group refcount during async discard
    155ca832cfa3 scsi: mpi3mr: Remove unnecessary memcpy() to alltgt_info->dmi
    8ba997b22f2c scsi: mpi3mr: Fix issues in mpi3mr_get_all_tgt_info()
    4e0dfdb48a82 scsi: mpi3mr: Fix missing mrioc->evtack_cmds initialization
    f5a6d69857eb cifs: return a single-use cfid if we did not get a lease
    c992b699b9cb cifs: Check the lease context if we actually got a lease
    f1d84943289e cifs: don't try to use rdma offload on encrypted connections
    edf38e9f4269 cifs: split out smb3_use_rdma_offload() helper
    363d67103f20 cifs: introduce cifs_io_parms in smb2_async_writev()
    e49a6d569d7c cifs: fix mount on old smb servers
    8db5028479f8 cifs: Fix uninitialized memory reads for oparms.mode
    ab7a12c0efc1 cifs: Fix uninitialized memory read in smb3_qfs_tcon()
    12bda36df57b KVM: s390: disable migration mode when dirty tracking is disabled
    f9a38f5ecf90 s390/kprobes: fix current_kprobe never cleared after kprobes reenter
    70afa77327e0 s390/kprobes: fix irq mask clobbering on kprobe reenter from post_handler
    a829c5f7c3c6 s390: discard .interp section
    24e2c6cfe82e s390/extmem: return correct segment type in __segment_load()
    75a499fc9d66 io_uring: fix fget leak when fs don't support nowait buffered read
    bfdd27a1eb8e io_uring: remove MSG_NOSIGNAL from recvmsg
    68f703ad0355 io_uring/rsrc: disallow multi-source reg buffers
    d9399e543062 io_uring: add reschedule point to handle_tw_list()
    42fe280e267a io_uring: add a conditional reschedule to the IOPOLL cancelation loop
    4c13c6a080ec io_uring: handle TIF_NOTIFY_RESUME when checking for task_work
    c981a035dff0 io_uring: use user visible tail in io_uring_poll()
    f09fb7ff2ab2 io_uring: Replace 0-length array with flexible array
    fe0d40baa4ed ipmi_ssif: Rename idle state and check
    605f607f0735 ipmi:ssif: resend_msg() cannot fail
    0ad52040d1a9 ipmi: ipmb: Fix the MODULE_PARM_DESC associated to 'retry_time_ms'
    9bb9941a9ce4 rtc: pm8xxx: fix set-alarm race
    1af0bdca03f3 block: be a bit more careful in checking for NULL bdev while polling
    398d8745262d block: clear bio->bi_bdev when putting a bio back in the cache
    1796bc1e4499 block: don't allow multiple bios for IOCB_NOWAIT issue
    0407aeed3501 firmware: coreboot: framebuffer: Ignore reserved pixel color bits
    4ed8dca3d583 scsi: mpt3sas: Remove usage of dma_get_required_mask() API
    0d4967202d69 wifi: rtl8xxxu: fixing transmisison failure for rtl8192eu
    11d93294b7c3 driver core: fw_devlink: Avoid spurious error message
    29bc917b68a6 drm/shmem-helper: Revert accidental non-GPL export
    cb26818c8b0d cifs: prevent data race in smb2_reconnect()
    07db1151e015 nfsd: don't hand out delegation on setuid files being opened for write
    c085476ad346 nfsd: zero out pointers after putting nfsd_files on COPY setup error
    3033f2e3cf84 dm cache: add cond_resched() to various workqueue loops
    e2c4490d4031 dm thin: add cond_resched() to various workqueue loops
    bea13417361a drm/amd/display: Disable HUBP/DPP PG on DCN314 for now
    2435156aa768 drm: panel-orientation-quirks: Add quirk for Lenovo IdeaPad Duet 3 10IGL5
    42bbbd6594f7 drm/amd/display: Enable P-state validation checks for DCN314
    337c3624bcb0 HID: logitech-hidpp: Don't restart communication if not necessary
    cf4549343270 scsi: ufs: core: Fix device management cmd timeout flow
    3dec769caf33 scsi: snic: Fix memory leak with using debugfs_lookup()
    d919f493bb7d drm/amd/display: Do not commit pipe when updating DRR
    8e8cff444ec2 pinctrl: at91: use devm_kasprintf() to avoid potential leaks
    388bcec9aa91 hwmon: (nct6775) B650/B660/X670 ASUS boards support
    49f865f3d7e5 hwmon: (nct6775) Directly call ASUS ACPI WMI method
    8fcdbc4bc013 hwmon: (coretemp) Simplify platform device handling
    c2191e507147 gfs2: Improve gfs2_make_fs_rw error handling
    4bdfa48d7464 drm/amd/display: fix FCLK pstate change underflow
    804bdc5fe05d Revert "drm/amdgpu: TA unload messages are not actually sent to psp when amdgpu is uninstalled"
    6f5f8d677c7f regulator: s5m8767: Bounds check id indexing into arrays
    5e210046e3bd regulator: max77802: Bounds check regulator id against opmode
    734350a83b14 ASoC: kirkwood: Iterate over array indexes instead of using pointer math
    9a9942cbdb7c ASoC: soc-compress: Reposition and add pcm_mutex
    9def1adcd667 drm/msm/dpu: Add DSC hardware blocks to register snapshot
    d39202b201d0 docs/scripts/gdb: add necessary make scripts_gdb step
    fa4c8baa6bf0 habanalabs: fix bug in timestamps registration code
    60be72808501 habanalabs: extend fatal messages to contain PCI info
    8f720a79bc66 drm/amd/display: Set hvm_enabled flag for S/G mode
    214cdbe17923 drm/drm_print: correct format problem
    d50cd50f612a drm: rcar-du: Fix setting a reserved bit in DPLLCR
    afc9da1352cd drm: rcar-du: Add quirk for H3 ES1.x pclk workaround
    25a6499b1a53 drm/msm/dsi: Add missing check for alloc_ordered_workqueue
    2ee8ec2c12cb HID: uclogic: Add support for XP-PEN Deco Pro MW
    26ac66039aa7 HID: uclogic: Add support for XP-PEN Deco Pro SW
    f415a64eabad HID: uclogic: Add battery quirk
    ac3d719de1d9 HID: uclogic: Add frame type quirk
    8ce8a443ddd9 drm/amd/display: fix mapping to non-allocated address
    83ace0dd67ee drm: amd: display: Fix memory leakage
    a0f406db3ede drm/amd: Avoid ASSERT for some message failures
    17d649967006 Revert "fbcon: don't lose the console font across generic->chip driver switch"
    8dfefa8f424a scsi: lpfc: Fix use-after-free KFENCE violation during sysfs firmware write
    82a6debd4e4b drm/amdkfd: Page aligned memory reserve size
    12003ad0f35c drm/amd: Avoid BUG() for case of SRIOV missing IP version
    107b8b542bb9 drm/radeon: free iio for atombios when driver shutdown
    efb332a2037b drm/amd/display: Defer DIG FIFO disable after VID stream enable
    dbe9140ed6bf drm/tiny: ili9486: Do not assume 8-bit only SPI controllers
    b1c760073925 HID: Add Mapping for System Microphone Mute
    457a969bc6f3 drm/omap: dsi: Fix excessive stack usage
    8e365f1bd672 drm/amd/display: Fix potential null-deref in dm_resume
    223e365ac60a drm/amd/display: Revert Reduce delay when sink device not able to ACK 00340h write
    8e25eaae471d drm/amd/display: Reduce expected sdp bandwidth for dcn321
    d5b286daecb4 drm: panel-orientation-quirks: Add quirk for DynaBook K50
    260bdc633d5e drm: panel-orientation-quirks: Add quirk for Lenovo Yoga Tab 3 X90F
    fa66c02e4c11 scm: add user copy checks to put_cmsg()
    eb726a791087 devlink: Fix TP_STRUCT_entry in trace of devlink health report
    3c106b7eb1b6 s390/kfence: fix page fault reporting
    c91cca8e39d4 hv_netvsc: Check status in SEND_RNDIS_PKT completion message
    20a89a4442d1 wifi: rtw89: debug: avoid invalid access on RTW89_DBG_SEL_MAC_30
    7dbb8ceea188 Bluetooth: btusb: Add VID:PID 13d3:3529 for Realtek RTL8821CE
    8917270ace46 Bluetooth: btusb: Add new PID/VID 0489:e0f2 for MT7921
    25ea81801072 Bluetooth: Fix issue with Actions Semi ATS2851 based devices
    5100c4efc306 PM: EM: fix memory leak with using debugfs_lookup()
    cde67cb7d2d1 PM: domains: fix memory leak with using debugfs_lookup()
    15cffd01ed80 time/debug: Fix memory leak with using debugfs_lookup()
    611c39021710 s390/idle: mark arch_cpu_idle() noinstr
    ab28522da564 uaccess: Add minimum bounds check on kernel buffer size
    7d10fc49d8fa coda: Avoid partial allocation of sig_inputArgs
    b79c51d0c085 net/mlx5: fw_tracer: Fix debug print
    f4c1138d37c3 ACPI: video: Fix Lenovo Ideapad Z570 DMI match
    c09feaa46a51 wifi: mt76: dma: free rx_head in mt76_dma_rx_cleanup
    331918f22a1d tools/power/x86/intel-speed-select: Add Emerald Rapid quirk
    ad04399765e3 gcc-plugins: drop -std=gnu++11 to fix GCC 13 build
    9427584c2f15 can: isotp: check CAN address family in isotp_bind()
    3b26e45ce1e1 netfilter: nf_tables: NULL pointer dereference in nf_tables_updobj()
    531570a18761 s390/mm,ptdump: avoid Kasan vs Memcpy Real markers swapping
    ab5fd43a8abc m68k: Check syscall_trace_enter() return code
    5f56767fb5f2 net: bcmgenet: Add a check for oversized packets
    94b28dc12f40 crypto: hisilicon: Wipe entire pool on error
    856dbac0a82e clocksource: Suspend the watchdog temporarily when high read latency detected
    e52bddc469d9 thermal: intel: intel_pch: Add support for Wellsburg PCH
    7e4edf9ab030 bpf, docs: Fix modulo zero, division by zero, overflow, and underflow
    05841af18d4b ACPI: Don't build ACPICA with '-Os'
    2aa469e6cd10 ice: add missing checks for PF vsi type
    f0cf125056ac ice: restrict PTP HW clock freq adjustments to 100, 000, 000 PPB
    6965c92ef421 inet: fix fast path in __inet_hash_connect()
    61d0163e2be7 wifi: mt7601u: fix an integer underflow
    ecb980dc7970 wifi: brcmfmac: ensure CLM version is null-terminated to prevent stack-out-of-bounds
    d29e44273980 bpftool: Always disable stack protection for BPF objects
    2135dd1be685 x86/bugs: Reset speculation control settings on init
    3a43a366ecaa timers: Prevent union confusion from unexpected restart_syscall()
    c115d466bed2 thermal: intel: Fix unsigned comparison with less than zero
    982a936329d2 wifi: ath11k: debugfs: fix to work with multiple PCI devices
    5a2153b83c8e rcu-tasks: Handle queue-shrink/callback-enqueue race condition
    94ed8ac1bb1a rcu-tasks: Make rude RCU-Tasks work well with CPU hotplug
    2c4d26dad76e srcu: Delegate work to the boot cpu if using SRCU_SIZE_SMALL
    05737bd85c10 rcu: Suppress smp_processor_id() complaint in synchronize_rcu_expedited_wait()
    4a501b4ef881 rcu: Make RCU_LOCKDEP_WARN() avoid early lockdep checks
    881f50d76c38 wifi: brcmfmac: Fix potential stack-out-of-bounds in brcmf_c_preinit_dcmds()
    d6ea1ca1d456 wifi: ath11k: fix monitor mode bringup crash
    1f137c634a8c wifi: ath9k: Fix use-after-free in ath9k_hif_usb_disconnect()
    8ea364aba332 perf/x86/intel/uncore: Add Meteor Lake support
    b78434f6eee0 cpuidle: lib/bug: Disable rcu_is_watching() during WARN/BUG
    463ef209628e cpuidle: drivers: firmware: psci: Dont instrument suspend code
    909eb5116ee5 x86/fpu: Don't set TIF_NEED_FPU_LOAD for PF_IO_WORKER threads
    a3a54e6a021c cpuidle, intel_idle: Fix CPUIDLE_FLAG_INIT_XSTATE
    cc5541f8cca3 arm64: zynqmp: Enable hs termination flag for USB dwc3 controller
    063c7d86ee89 btrfs: scrub: improve tree block error reporting
    3036f5f5ae52 trace/blktrace: fix memory leak with using debugfs_lookup()
    81c1188905f8 blk-cgroup: synchronize pd_free_fn() from blkg_free_workfn() and blkcg_deactivate_policy()
    029f1f1efa84 blk-cgroup: dropping parent refcount after pd_free_fn() is done
    bf8eb1fd6110 blk-iocost: fix divide by 0 error in calc_lcoefs()
    377f7d85bd27 fs: Use CHECK_DATA_CORRUPTION() when kernel bugs are detected
    f2a6198f5ed7 ARM: dts: exynos: Use Exynos5420 compatible for the MIPI video phy
    711bd1b55329 exit: Detect and fix irq disabled state in oops
    982f8ef8ec7e context_tracking: Fix noinstr vs KASAN
    0f688febd5d2 udf: Define EFSCORRUPTED error code
    938b99be5219 arm64: dts: qcom: msm8996: Add additional A2NoC clocks
    1d9452ae3bdb ARM: OMAP2+: omap4-common: Fix refcount leak bug
    4a46f52ae8f0 rpmsg: glink: Release driver_override
    09699f0e5b69 rpmsg: glink: Avoid infinite loop on intent for missing channel
    5df521e0b2cb media: saa7134: Use video_unregister_device for radio_dev
    479796534a45 media: usb: siano: Fix use after free bugs caused by do_submit_urb
    69a9a301a5d8 media: i2c: ov7670: 0 instead of -EINVAL was returned
    5259b92dc466 media: atomisp: Only set default_run_mode on first open of a stream/asd
    029c1410e345 media: rc: Fix use-after-free bugs caused by ene_tx_irqsim()
    ece8818968a8 media: drivers/media/v4l2-core/v4l2-h264 : add detection of null pointers
    80f98dc3ebf1 media: amphion: correct the unspecified color space
    e66571729a5f media: imx-jpeg: Apply clk_bulk api instead of operating specific clk
    756901c49ee8 media: hantro: Fix JPEG encoder ENUM_FRMSIZE on RK3399
    3fca02c42689 media: v4l2-jpeg: ignore the unknown APP14 marker
    1cfbe44e0c7d media: v4l2-jpeg: correct the skip count in jpeg_parse_app14_data
    972bd67c2c7b media: platform: mtk-mdp3: fix Kconfig dependencies
    689bd2b43d46 media: platform: mtk-mdp3: remove unused VIDEO_MEDIATEK_VPU config
    ebec3d44b874 media: camss: csiphy-3ph: avoid undefined behavior
    e68b43980a90 media: platform: mtk-mdp3: Fix return value check in mdp_probe()
    9ffaf55e126c media: i2c: imx219: Fix binning for RAW8 capture
    248fdc5dd225 media: i2c: imx219: Split common registers from mode tables
    ac93f8ac66e6 media: i2c: ov772x: Fix memleak in ov772x_probe()
    f5a4e595bce5 media: mc: Get media_device directly from pad
    a40d94f0b314 media: ov5640: Handle delays when no reset_gpio set
    8064bbb75481 media: ov5640: Fix soft reset sequence and timings
    49b849824b98 media: ov5675: Fix memleak in ov5675_init_controls()
    fc33380ae06f media: ov2740: Fix memleak in ov2740_init_controls()
    724039e013b3 media: max9286: Fix memleak in max9286_v4l2_register()
    9753f5ce9ce7 builddeb: clean generated package content
    8570655c0f9b s390/vdso: Drop '-shared' from KBUILD_CFLAGS_64
    8630e8b10250 powerpc: Remove linker flag from KBUILD_AFLAGS
    4bc6977fb45c media: imx: imx7-media-csi: fix missing clk_disable_unprepare() in imx7_csi_init()
    bc8681485312 media: platform: ti: Add missing check for devm_regulator_get
    8a316112fd97 media: ti: cal: fix possible memory leak in cal_ctx_create()
    dc5887dcc538 remoteproc: qcom_q6v5_mss: Use a carveout to authenticate modem headers
    0e27e6598201 Revert "remoteproc: qcom_q6v5_mss: map/unmap metadata region before/after use"
    eeaf35f4e3b3 IB/hfi1: Fix sdma.h tx->num_descs off-by-one errors
    db5f82e3a78b IB/hfi1: Fix math bugs in hfi1_can_pin_pages()
    b7967f175e79 RDMA/rxe: Fix missing memory barriers in rxe_queue.h
    0f2a0ebb89a7 RDMA/rxe: cleanup some error handling in rxe_verbs.c
    f56c87aee1f8 iommu/vt-d: Allow to use flush-queue when first level is default
    2d93a340ae31 iommu/vt-d: Fix error handling in sva enable/disable paths
    8ae211370261 dmaengine: ptdma: check for null desc before calling pt_cmd_callback
    c387ee97aebe dmaengine: dw-axi-dmac: Do not dereference NULL structure
    03fece43fa10 dmaengine: sf-pdma: pdma_desc memory leak fix
    1bfe5bce1baa iommu/amd: Do not identity map v2 capable device when snp is enabled
    4c23124b45ee iommu: Fix error unwind in iommu_group_alloc()
    24278dc380aa iw_cxgb4: Fix potential NULL dereference in c4iw_fill_res_cm_id_entry()
    f139c15c6cc6 PCI: qcom: Fix host-init error handling
    fe5955b11f6e phy: rockchip-typec: fix tcphy_get_mode error case
    fe6a1fbe83f5 PCI: Fix dropping valid root bus resources with .end = zero
    6bce9ec9e0fa dmaengine: dw-edma: Fix readq_ch() return value truncation
    9f53d9d8bc81 usb: host: fsl-mph-dr-of: reuse device_set_of_node_from_dev
    775f970ec978 mtd: mtdpart: Don't create platform device that'll never probe
    3dd596616d10 driver core: fw_devlink: Make cycle detection more robust
    a3c171751512 driver core: fw_devlink: Improve check for fwnode with no device/driver
    7a8ce4d2fbbc driver core: fw_devlink: Consolidate device link flag computation
    16aa2487cf15 driver core: fw_devlink: Allow marking a fwnode link as being part of a cycle
    eaf9b5612a47 driver core: fw_devlink: Don't purge child fwnode's consumer links
    2455b81afe68 driver core: fw_devlink: Add DL_FLAG_CYCLE support to device links
    9795ece3a85b tty: serial: imx: disable Ageing Timer interrupt request irq
    efe4bd88ab2c tty: serial: imx: Handle RS485 DE signal active high
    a65192fc80a6 serial: fsl_lpuart: fix RS485 RTS polariy inverse issue
    b3bd44bf20cb RDMA/irdma: Cap MSIX used to online CPUs + 1
    59b040cf3339 usb: max-3421: Fix setting of I/O pins
    2cfc00e974d7 RDMA/cxgb4: Fix potential null-ptr-deref in pass_establish()
    bc6405bca868 power: supply: remove faulty cooling logic
    c1abca193874 iommu/vt-d: Set No Execute Enable bit in PASID table entry
    bbbeb5414a9c iommu/dart: Fix apple_dart_device_group for PCI groups
    78b291ba2906 iommu: dart: Support >64 stream IDs
    1ad8b31653e2 iommu: dart: Add suspend/resume support
    c7bd4bfd4b8e PCI: mt7621: Delay phy ports initialization
    26bd2b5b18e1 phy: mediatek: remove temporary variable @mask_
    dca51010f772 usb: gadget: configfs: Restrict symlink creation is UDC already binded
    8c2059513e54 usb: musb: mediatek: don't unregister something that wasn't registered
    a661cccff059 RDMA/cxgb4: add null-ptr-check after ip_dev_find()
    fe9dd008b186 tty: serial: fsl_lpuart: Fix the wrong RXWATER setting for rx dma case
    351c8d8650d1 usb: early: xhci-dbc: Fix a potential out-of-bound memory access
    c169890b5f7b fpga: microchip-spi: rewrite status polling in a time measurable way
    e9ed12b8c7f7 fpga: microchip-spi: move SPI I/O buffers out of stack
    d937ab794b8d dmaengine: dw-edma: Fix missing src/dst address of interleaved xfers
    bdefbe1b0fd5 fotg210-udc: Add missing completion handler
    e851996b3226 firmware: dmi-sysfs: Fix null-ptr-deref in dmi_sysfs_register_handle
    29274780dda0 drivers: base: transport_class: fix resource leak when transport_add_device() fails
    e77745640f8f drivers: base: transport_class: fix possible memory leak
    8fe72b8f59f6 driver core: location: Free struct acpi_pld_info *pld before return false
    d1dbff10c6cd driver core: fix resource leak in device_add()
    a68a09cc4b0f misc: fastrpc: Fix an error handling path in fastrpc_rpmsg_probe()
    942c1239ff2e misc/mei/hdcp: Use correct macros to initialize uuid_le
    023bf26fde38 mei: pxp: Use correct macros to initialize uuid_le
    055891397f53 VMCI: check context->notify_page after call to get_user_pages_fast() to avoid GPF
    77968ae69d4f firmware: stratix10-svc: fix error handle while alloc/add device failed
    6fcedeadb3ef firmware: stratix10-svc: add missing gen_pool_destroy() in stratix10_svc_drv_probe()
    959dd00ed4d8 applicom: Fix PCI device refcount leak in applicom_init()
    23b534e82dbd eeprom: idt_89hpesx: Fix error handling in idt_init()
    1b00494c8f92 Revert "char: pcmcia: cm4000_cs: Replace mdelay with usleep_range in set_protocol"
    d9b85a205d95 serial: tegra: Add missing clk_disable_unprepare() in tegra_uart_hw_init()
    64096d3b8d11 tty: serial: fsl_lpuart: clear LPUART Status Register in lpuart32_shutdown()
    dc8ca4fb36af tty: serial: fsl_lpuart: disable Rx/Tx DMA in lpuart32_shutdown()
    7f8d2f78ae62 hwtracing: hisi_ptt: Only add the supported devices to the filters list
    6bb43ee46310 PCI: endpoint: pci-epf-vntb: Add epf_ntb_mw_bar_clear() num_mws kernel-doc
    16c06d34e27c PCI: endpoint: pci-epf-vntb: Clean up kernel_doc warning
    86c1988d2695 PCI: switchtec: Return -EFAULT for copy_to_user() errors
    41e9ad787fab PCI/IOV: Enlarge virtfn sysfs name buffer
    c13e1a90fbf5 usb: typec: intel_pmc_mux: Don't leak the ACPI device reference count
    1a31f1c5062d coresight: cti: Add PM runtime call in enable_store
    431d8b2d1457 coresight: cti: Prevent negative values of enable count
    b0081745f6e6 coresight: etm4x: Fix accesses to TRCSEQRSTEVR and TRCSEQSTR
    5029464da930 media: uvcvideo: Refactor power_line_frequency_controls_limited
    54858223a925 media: uvcvideo: Refactor uvc_ctrl_mappings_uvcXX
    367703c3ec4f media: uvcvideo: Implement mask for V4L2_CTRL_TYPE_MENU
    aeab0c3644d3 media: uvcvideo: Check for INACTIVE in uvc_ctrl_is_accessible()
    9b1f0df64946 alpha/boot/tools/objstrip: fix the check for ELF header
    fe4dd80d58ec kobject: Fix slab-out-of-bounds in fill_kobj_path()
    f3ffd86915ed kobject: modify kobject_get_path() to take a const *
    7cf515bf9e8c driver core: fix potential null-ptr-deref in device_add()
    65e07272b6c0 soundwire: cadence: Don't overflow the command FIFOs
    bb2b4edaff38 i2c: designware: fix i2c_dw_clk_rate() return size to be u32
    061609b555d4 usb: gadget: fusb300_udc: free irq on the error path in fusb300_probe()
    4f3dea31bfa1 iio: light: tsl2563: Do not hardcode interrupt trigger type
    fa87cf2e756e RDMA/hns: Fix refcount leak in hns_roce_mmap
    59d54a65151d dmaengine: HISI_DMA should depend on ARCH_HISI
    8372207b009d RDMA/erdma: Fix refcount leak in erdma_mmap
    bd93358f11d8 dmaengine: idxd: Set traffic class values in GRPCFG on DSA 2.0
    9cca3a4933ca mfd: pcf50633-adc: Fix potential memleak in pcf50633_adc_async_read()
    bcb57fd95534 mfd: cs5535: Don't build on UML
    a52a2817d2aa objtool: add UACCESS exceptions for __tsan_volatile_read/write
    2267c88f0499 perf tests stat_all_metrics: Change true workload to sleep workload for system wide check
    adb2cfd3f2f4 printf: fix errname.c list
    17f9131ef7c3 perf record: Fix segfault with --overwrite and --max-size
    718eaef01e5a selftests: use printf instead of echo -ne
    947de2882d42 selftests/ftrace: Fix bash specific "==" operator
    96acb09a34ac selftests: find echo binary to use -ne options
    13b56886c165 sparc: allow PM configs for sparc32 COMPILE_TEST
    25fc1a80010b perf tools: Fix auto-complete on aarch64
    cf21aaac3b0e perf test bpf: Skip test if kernel-debuginfo is not present
    c795162b15ff perf intel-pt: Do not try to queue auxtrace data on pipe
    67f1f53cfc97 perf inject: Use perf_data__read() for auxtrace
    f86d50bf1969 tools/tracing/rtla: osnoise_hist: use total duration for average calculation
    0cd7777c7476 leds: simatic-ipc-leds-gpio: Make sure we have the GPIO providing driver
    d5a8fe4c3ff3 leds: is31fl319x: Wrap mutex_destroy() for devm_add_action_or_rest()
    d880981b8222 leds: led-core: Fix refcount leak in of_led_get()
    062547cbcd05 perf llvm: Fix inadvertent file creation
    4750fc5f50bb gfs2: jdata writepage fix
    212c79117f8c cifs: use tcon allocation functions even for dummy tcon
    41832c62a75d cifs: Fix warning and UAF when destroy the MR list
    c51ae01104b3 cifs: Fix lost destroy smbd connection when MR allocate failed
    349eb7df6607 NFSD: copy the whole verifier in nfsd_copy_write_verifier
    6851b4203e76 nfsd: don't fsync nfsd_files on last close
    521b6116151b nfsd: fix courtesy client with deny mode handling in nfs4_upgrade_open
    598e2d5d911d NFSD: fix problems with cleanup on errors in nfsd4_copy
    75b8c681c563 nfsd: clean up potential nfsd_file refcount leaks in COPY codepath
    17f2a1a3cdea nfsd: fix race to check ls_layouts
    9f0df37520a2 NFSD: fix leaked reference count of nfsd4_ssc_umount_item
    c8b346b79a70 NFSD: enhance inter-server copy cleanup
    659d4c4ca537 drm/shmem-helper: Fix locking for drm_gem_shmem_get_pages_sgt()
    7c3a7f3aa134 ALSA: hda/hdmi: Register with vga_switcheroo on Dual GPU Macbooks
    ac55ee431c03 hid: bigben_probe(): validate report count
    f2bf592ebd50 HID: bigben: use spinlock to safely schedule workers
    cc0f24739d90 HID: bigben_worker() remove unneeded check on report_field
    d829fae53dae HID: bigben: use spinlock to protect concurrent accesses
    1c3609ee824e ASoC: soc-dapm.h: fixup warning struct snd_pcm_substream not declared
    d217a3b66bf2 spi: synquacer: Fix timeout handling in synquacer_spi_transfer_one()
    f859788868c4 NFS: fix disabling of swap
    087245878d51 nfs4trace: fix state manager flag printing
    5b8cd07aba15 dm: remove flush_scheduled_work() during local_exit()
    0924b13f218e ASoC: tlv320adcx140: fix 'ti,gpio-config' DT property init
    007374a1b4fb hwmon: (mlxreg-fan) Return zero speed for broken fan
    e4aac4fb1dfe spi: bcm63xx-hsspi: Fix multi-bit mode setting
    3e2e193d5d8a HID: logitech-hidpp: Hard-code HID++ 1.0 fast scroll support
    062024bf77e9 drm/amd/display: don't call dc_interrupt_set() for disabled crtcs
    7839422bed58 ASoC: codecs: lpass: fix incorrect mclk rate
    7b642273438c ASoC: codecs: lpass: register mclk after runtime pm
    adcc7c98ce4c ASoC: qcom: q6apm-dai: Add SNDRV_PCM_INFO_BATCH flag
    cd57b2898a81 ASoC: qcom: q6apm-dai: fix race condition while updating the position pointer
    91b7ce0cfff7 ASoC: qcom: q6apm-lpass-dai: unprepare stream if its already prepared
    c95f4de66352 HID: retain initial quirks set up when creating HID devices
    f380b1060ab0 HID: multitouch: Add quirks for flipped axes
    be2876e01ad6 scsi: aic94xx: Add missing check for dma_map_single()
    847cdbdcd5a2 scsi: mpt3sas: Fix a memory leak
    099bd0a7b363 drm/amdgpu: fix enum odm_combine_mode mismatch
    f716ca292a7d ALSA: hda: Fix the control element identification for multiple codecs
    355d109fb6b7 hwmon: (ltc2945) Handle error case in ltc2945_value_store
    c710243ed668 hwmon: (asus-ec-sensors) add missing mutex path
    7b56f11cde26 regulator: tps65219: use generic set_bypass()
    265fdccd77d4 ASoC: dt-bindings: meson: fix gx-card codec node regex
    9eecb446fab0 ASoC: mchp-spdifrx: Fix uninitialized use of mr in mchp_spdifrx_hw_params()
    c3acfb79bde7 ASoC: rsnd: fixup #endif position
    93bc34805393 regmap: apply reg_base and reg_downshift for single register ops
    8a722ac86b7e dm: improve shrinker debug names
    53b7166927b0 ASoC: mchp-spdifrx: disable all interrupts in mchp_spdifrx_dai_remove()
    bbded1ed4c44 ASoC: mchp-spdifrx: fix controls that works with completion mechanism
    9e72142dcc06 ASoC: mchp-spdifrx: fix return value in case completion times out
    2967cc9cf38f ASoC: mchp-spdifrx: fix controls which rely on rsr register
    4eeeccf07dd9 spi: dw_bt1: fix MUX_MMIO dependencies
    eee97569465a ASoC: topology: Properly access value coming from topology file
    1f874b9cd790 gpio: vf610: connect GPIO label to dev name
    9a576e668411 dt-bindings: display: mediatek: Fix the fallback for mediatek,mt8186-disp-ccorr
    5ee1bce74c5f ASoC: soc-compress.c: fixup private_data on snd_soc_new_compress()
    7b551a501fa7 drm/mediatek: Clean dangling pointer on bind error path
    67ea657c7891 drm/mediatek: mtk_drm_crtc: Add checks for devm_kcalloc
    c21de3b3bcd1 drm/mediatek: Drop unbalanced obj unref
    407f40df3b60 drm/mediatek: Use NULL instead of 0 for NULL pointer
    6a46566628b1 drm/mediatek: dsi: Reduce the time of dsi from LP11 to sending cmd
    dd5e3d8300e2 drm/msm/dpu: set pdpu->is_rt_pipe early in dpu_plane_sspp_atomic_update()
    a52c45560053 pinctrl: renesas: rzg2l: Fix configuring the GPIO pins as interrupts
    fbb286284da7 drm/tegra: firewall: Check for is_addr_reg existence in IMM check
    7009b78bb995 gpu: host1x: Don't skip assigning syncpoints to channels
    0906026ac285 gpu: host1x: Fix mask for syncpoint increment register
    b15b3e9499cb pinctrl: mediatek: Initialize variable *buf to zero
    fa592fa1eeee pinctrl: mediatek: Initialize variable pullen and pullup to zero
    6f16121d2205 pinctrl: bcm2835: Remove of_node_put() in bcm2835_of_gpio_ranges_fallback()
    deb9379af500 habanalabs: bugs fixes in timestamps buff alloc
    bc579a2ee8b2 drm/msm/mdp5: Add check for kzalloc
    dd49cef313e6 drm/msm/dpu: Add check for pstates
    42442d42c57b drm/msm/dpu: Add check for cstate
    17f092f4c03a drm/msm: use strscpy instead of strncpy
    2ef3ea75c4be drm/msm/dpu: sc7180: add missing WB2 clock control
    473cc5169994 scsi: ufs: exynos: Fix DMA alignment for PAGE_SIZE != 4096
    243a79c3dfd9 drm/msm/dsi: Allow 2 CTRLs on v2.5.0
    af28abee67ac drm: exynos: dsi: Fix MIPI_DSI*_NO_* mode flags
    a64eb25a2919 drm/mipi-dsi: Fix byte order of 16-bit DCS set/get brightness
    533d94954412 regulator: tps65219: use IS_ERR() to detect an error pointer
    72e330373241 drm/bridge: lt9611: pass a pointer to the of node
    30ef50ccdab3 drm/bridge: lt9611: fix clock calculation
    59646dabe92d drm/bridge: lt9611: fix programming of video modes
    01c42582facf drm/bridge: lt9611: fix polarity programming
    d15f67aed9c5 drm/bridge: lt9611: fix HPD reenablement
    74131c671fe5 drm/bridge: lt9611: fix sleep mode setup
    9e1e236acdc4 drm/msm/dpu: Disallow unallocated resources to be returned
    31c4251a20fd drm/msm/gem: Add check for kmalloc
    208680ccf7bf drm/amdgpu: Use the sched from entity for amdgpu_cs trace
    a8fa33759563 ALSA: hda/ca0132: minor fix for allocation size
    7af606b9eb11 drm/msm/adreno: Fix null ptr access in adreno_gpu_cleanup()
    462a8af60ff4 drm/bridge: tc358767: Set default CLRSIPO count
    94589fc6df3e ASoC: fsl_sai: initialize is_dsp_mode flag
    7fe652f0f53e scsi: qla2xxx: edif: Fix clang warning
    6626b7494a01 scsi: qla2xxx: Fix exchange oversubscription for management commands
    3d5376ae518b scsi: qla2xxx: Fix exchange oversubscription
    ee8d6231ad07 drm/panel-edp: fix name for IVO product id 854b
    c83d0321d89c drm/msm: clean event_thread->worker in case of an error
    15e78c7f2ddd drm/vc4: hdmi: Correct interlaced timings again
    a9cce4831017 drm/vc4: hvs: Fix colour order for xRGB1555 on HVS5
    cc6b67e90717 drm/vc4: hvs: Correct interrupt masking bit assignment for HVS5
    22134a4f02d2 drm/vc4: hvs: SCALER_DISPBKGND_AUTOHS is only valid on HVS4
    d4bbf52e299d drm/vc4: hvs: Set AXI panic modes
    dbef00ef4b9b pinctrl: rockchip: Fix refcount leak in rockchip_pinctrl_parse_groups
    601be03fa8b8 pinctrl: stm32: Fix refcount leak in stm32_pctrl_get_irq_domain
    1d0190c62850 pinctrl: qcom: pinctrl-msm8976: Correct function names for wcss pins
    e55f93d67431 drm/msm/hdmi: Add missing check for alloc_ordered_workqueue
    3723c4dbcd14 drm/msm/dpu: check for null return of devm_kzalloc() in dpu_writeback_init()
    9aba03fb5146 hwmon: (ftsteutates) Fix scaling of measurements
    41286a53e7f5 drm/vc4: drop all currently held locks if deadlock happens
    1a6e6d4996c7 gpu: ipu-v3: common: Add of_node_put() for reference returned by of_graph_get_port_by_id()
    df29e4edee96 drm: tidss: Fix pixel format definition
    29e9bb28ca0b drm/vc4: dpi: Fix format mapping for RGB565
    596f1ba3987e drm/vkms: Fix null-ptr-deref in vkms_release()
    bebd60ec3bf2 drm/vkms: Fix memory leak in vkms_init()
    d446af74046e drm/bridge: megachips: Fix error handling in i2c_register_driver()
    50b43490b028 drm: mxsfb: DRM_MXSFB should depend on ARCH_MXS || ARCH_MXC
    1e9d46c765cb drm: mxsfb: DRM_IMX_LCDIF should depend on ARCH_MXC
    c9ab539bf930 drm/bridge: ti-sn65dsi83: Fix delay after reset deassert to match spec
    0de7fc4d9c01 drm/fourcc: Add missing big-endian XRGB1555 and RGB565 formats
    b14147464251 drm: Fix potential null-ptr-deref due to drmm_mode_config_init()
    92e832252ec4 sefltests: netdevsim: wait for devlink instance after netns removal
    672039408784 selftest: fib_tests: Always cleanup before exit
    2edd8c192fd2 net/mlx4_en: Introduce flexible array to silence overflow warning
    209a8a5d57f9 net: lan966x: Fix possible deadlock inside PTP
    2e0b1754dd82 net: bcmgenet: fix MoCA LED control
    4bb736b40475 l2tp: Avoid possible recursive deadlock in l2tp_tunnel_register()
    5982e3f4886e selftests/net: Interpret UDP_GRO cmsg data as an int value
    13457741d4ae net/smc: fix application data exception
    f2f46de98c11 net/smc: fix potential panic dues to unprotected smc_llc_srv_add_link()
    3d0e30ca57a4 irqchip/irq-bcm7120-l2: Set IRQ_LEVEL for level triggered interrupts
    bf12b493caac irqchip/irq-brcmstb-l2: Set IRQ_LEVEL for level triggered interrupts
    bb1cc7fc3e1d bpf: Fix global subprog context argument resolution logic
    30651cff1e21 LoongArch, bpf: Use 4 instructions for function address in JIT
    cecc68559cd5 xsk: check IFF_UP earlier in Tx path
    ccf81ec1f1ed can: esd_usb: Make use of can_change_state() and relocate checking skb for NULL
    08d2f6779535 can: esd_usb: Move mislocated storage of SJA1000_ECC_SEG bits in case of a bus error
    026ba2f7760e selftests/bpf: Fix xdp_do_redirect on s390x
    678ea18d6240 bpf: Zeroing allocated object from slab in bpf memory allocator
    8c4615742602 wifi: mac80211: pass 'sta' to ieee80211_rx_data_set_sta()
    ec2c00f84678 selftests/bpf: Fix map_kptr test.
    9f6756cd0988 thermal/drivers/hisi: Drop second sensor hi3660
    2de283088766 tools/lib/thermal: Fix thermal_sampling_exit()
    558496d79b8c wifi: mac80211: fix off-by-one link setting
    2a0200daeccf wifi: mac80211: avoid u32_encode_bits() warning
    1ee0a1d7fb3b wifi: mac80211: Don't translate MLD addresses for multicast
    1d7e57d794b5 wifi: mac80211: fix non-MLO station association
    acb20912ff3b wifi: mac80211: make rate u32 in sta_set_rate_info_rx()
    451fcf6e73e3 wifi: mac80211: move color collision detection report in a delayed work
    dfcce7e6948e crypto: crypto4xx - Call dma_unmap_page when done
    5f14842b64e0 crypto: octeontx2 - Fix objects shared between several modules
    9dadb003e309 ACPI: resource: Do IRQ override on all TongFang GMxRGxx
    35ed2f552b0b ACPI: resource: Add IRQ overrides for MAINGEAR Vector Pro 2 models
    332213a34e0a selftests/bpf: Fix out-of-srctree build
    225e75dc744f wifi: mwifiex: fix loop iterator in mwifiex_update_ampdu_txwinsize()
    2f85c768bea2 wifi: iwl4965: Add missing check for create_singlethread_workqueue()
    34f611204ae5 wifi: iwl3945: Add missing check for create_singlethread_workqueue
    05a94ebbaed8 clocksource/drivers/riscv: Patch riscv_clock_next_event() jump before first use
    c984ddfdf67f RISC-V: time: initialize hrtimer based broadcast clock event device
    cfbdf8869fe8 m68k: /proc/hardware should depend on PROC_FS
    cf7cf7d1d4c7 crypto: rsa-pkcs1pad - Use akcipher_request_complete
    b8dd6200fa8d rds: rds_rm_zerocopy_callback() correct order for list_add_tail()
    cd9dff330e89 xen/grant-dma-iommu: Implement a dummy probe_device() callback
    fbbe6ddb6062 libbpf: Fix alen calculation in libbpf_nla_dump_errormsg()
    fb7f9c3b4461 s390/ap: fix status returned by ap_qact()
    673b533fb5b0 s390/ap: fix status returned by ap_aqic()
    19e29653c832 s390: vfio-ap: tighten the NIB validity check
    8f36f6e5770e net: ipa: generic command param fix
    720b2d5621ae Bluetooth: hci_qca: get wakeup status from serdev device handle
    64e28ecf44e4 Bluetooth: L2CAP: Fix potential user-after-free
    1913ff10fcea Bluetooth: hci_conn: Refactor hci_bind_bis() since it always succeeds
    a5f024d0e6f9 cpufreq: davinci: Fix clk use after free
    02c90e03e64f OPP: fix error checking in opp_migrate_dentry()
    035a80733ec4 tap: tap_open(): correctly initialize socket uid
    b4ada752eaf1 tun: tun_chr_open(): correctly initialize socket uid
    ee01753c5d45 net: add sock_init_data_uid()
    1a71a9eaf32d s390/boot: fix mem_detect extended area allocation
    f458b7f354ff s390/mem_detect: rely on diag260() if sclp_early_get_memsize() fails
    a5178cd3a802 s390/boot: cleanup decompressor header files
    76b53cd95d2b s390/vmem: fix empty page tables cleanup under KASAN
    9e1e58525d6c s390/mem_detect: fix detect_memory() error handling
    a0d91a48e1a0 irqchip/ti-sci: Fix refcount leak in ti_sci_intr_irq_domain_probe
    bb755e020abc irqchip/irq-mvebu-gicp: Fix refcount leak in mvebu_gicp_probe
    65e30bd1310d irqchip/alpine-msi: Fix refcount leak in alpine_msix_init_domains
    ea54b608d85b irqchip: Fix refcount leak in platform_irqchip_probe
    dcb8c33561f6 net/mlx5: Enhance debug print in page allocation failure
    2a9a5f88e0da wifi: mt76: mt7921: fix error code of return in mt7921_acpi_read
    eadd65fc5603 wifi: mt76: add memory barrier to SDIO queue kick
    f8baf3e6c389 wifi: mt76: mt7915: fix WED TxS reporting
    4cbb876153b6 wifi: mt76: mt7915: fix memory leak in mt7915_mcu_exit
    32e1e8b25dbf wifi: mt76: mt7915: call mt7915_mcu_set_thermal_throttling() only after init_work
    9d786d1a1ccb bpftool: profile online CPUs instead of possible
    daeef81825bf crypto: ccp - Flush the SEV-ES TMR memory before giving it to firmware
    d0105ef2f05e selftests/bpf: Initialize tc in xdp_synproxy
    71c83b54be42 can: rcar_canfd: Fix R-Car V3U GAFLCFG field accesses
    d5ed96a1f8d4 kselftest/arm64: Fix enumeration of systems without 128 bit SME
    33222abfe48b wifi: iwlwifi: mei: fix compilation errors in rfkill()
    24f105f90ad3 s390/bpf: Add expoline to tail calls
    bddd22cf5cc2 leds: led-class: Add missing put_device() to led_put()
    57c3e1d63b63 crypto: xts - Handle EBUSY correctly
    baffb1a112f7 selftests/bpf: Fix vmtest static compilation error
    6d1b85adad6f selftests/bpf: Use consistent build-id type for liburandom_read.so
    f82708c7965e x86/microcode: Adjust late loading result reporting message
    252bb13e2f38 x86/microcode: Check CPU capabilities after late microcode update correctly
    45c505d04976 x86/microcode: Add a parameter to microcode_check() to store CPU capabilities
    7d8914c998d6 powercap: fix possible name leak in powercap_register_zone()
    4d497e8b200a crypto: seqiv - Handle EBUSY correctly
    a006aa3eedb8 crypto: essiv - Handle EBUSY correctly
    dcdd2198bbff crypto: ccp - Failure on re-initialization due to duplicate sysfs filename
    ccf60fee67f4 selftests/bpf: Fix build errors if CONFIG_NF_CONNTRACK=m
    b49ff3a2c472 ACPI: battery: Fix missing NUL-termination with large strings
    4bb071d9c2db wifi: cfg80211: Fix extended KCK key length check in nl80211_set_rekey_data()
    e596b36e15a7 wifi: ath11k: Fix memory leak in ath11k_peer_rx_frag_setup
    8f28513d9520 wifi: ath9k: Fix potential stack-out-of-bounds write in ath9k_wmi_rsp_callback()
    9acdec72787a wifi: ath9k: hif_usb: clean up skbs if ath9k_hif_usb_rx_stream() fails
    5a84e51f7258 wifi: ath9k: htc_hst: free skb in ath9k_htc_rx_msg() if there is no callback function
    d9fedfdf2d0c thermal/drivers/imx_sc_thermal: Fix the loop condition
    bb8db9ac0ea2 thermal/drivers/imx_sc_thermal: Drop empty platform remove function
    7fe711014e5f wifi: orinoco: check return value of hermes_write_wordrec()
    93c3f34ec02f wifi: rtl8xxxu: Fix memory leaks with RTL8723BU, RTL8192EU
    e09eadf1976a wifi: rtw89: Add missing check for alloc_workqueue
    1e336d6bab68 wifi: rtw89: fix potential leak in rtw89_append_probe_req_ie()
    de92beb63a4b thermal/drivers/tsens: limit num_sensors to 9 for msm8939
    eec28ff90f5f thermal/drivers/tsens: fix slope values for msm8939
    1983e2a94c54 thermal/drivers/tsens: Sort out msm8976 vs msm8956 data
    574b125bb802 thermal/drivers/tsens: Drop msm8976-specific defines
    d7e2be5da9a9 x86/signal: Fix the value returned by strict_sas_size()
    f61744f7b45d s390/vfio-ap: fix an error handling path in vfio_ap_mdev_probe_queue()
    ec75af7e811d s390/early: fix sclp_early_sccb variable lifetime
    0903111d67ef workqueue: Protects wq_unbound_cpumask with wq_pool_attach_mutex
    3bfadfd8b62b kselftest/arm64: Fix syscall-abi for systems without 128 bit SME
    c5721ba0f25e arm64/cpufeature: Fix field sign for DIT hwcap detection
    b20197ece1ff selftests/xsk: print correct error codes when exiting
    af76543a8448 selftests/xsk: print correct payload for packet dump
    550802b8ed58 ACPICA: nsrepair: handle cases without a return value correctly
    8ffe7de184cb platform/chrome: cros_ec_typec: Update port DP VDO
    c65b76f6f3e5 crypto: ccp - Avoid page allocation failure warning for SEV_GET_ID2
    553d8b25cc5e lib/mpi: Fix buffer overrun when SG is too long
    62030a49158d rcu-tasks: Fix synchronize_rcu_tasks() VS zap_pid_ns_processes()
    24f259ce3a7c rcu-tasks: Remove preemption disablement around srcu_read_[un]lock() calls
    a2b0cda452b7 rcu-tasks: Improve comments explaining tasks_rcu_exit_srcu purpose
    e9ab0e81bc42 genirq: Fix the return type of kstat_cpu_irqs_sum()
    c8a85ad1d8fc ACPICA: Drop port I/O validation for some regions
    476dadca0b98 crypto: x86/ghash - fix unaligned access in ghash_setkey()
    700aec11cbfc libbpf: Fix invalid return address register in s390
    014a1f62706a wifi: wl3501_cs: don't call kfree_skb() under spin_lock_irqsave()
    cb96e0164858 wifi: libertas: cmdresp: don't call kfree_skb() under spin_lock_irqsave()
    ec1679db9a16 wifi: libertas: main: don't call kfree_skb() under spin_lock_irqsave()
    492228fc0b44 wifi: libertas: if_usb: don't call kfree_skb() under spin_lock_irqsave()
    9ce142fdb97e wifi: libertas_tf: don't call kfree_skb() under spin_lock_irqsave()
    4da483f714b6 wifi: brcmfmac: unmap dma buffer in brcmf_msgbuf_alloc_pktid()
    7f159116d620 wifi: brcmfmac: fix potential memory leak in brcmf_netdev_start_xmit()
    a1bdecedc7ad wifi: wilc1000: add missing unregister_netdev() in wilc_netdev_ifc_init()
    07dcd756e28f wifi: wilc1000: fix potential memory leak in wilc_mac_xmit()
    62ec7e8bf42f wifi: ipw2200: fix memory leak in ipw_wdev_init()
    b7a05cdce2cc wifi: ipw2x00: don't call dev_kfree_skb() under spin_lock_irqsave()
    9e93b377dccf libbpf: Fix btf__align_of() by taking into account field offsets
    f1fe40120de6 wifi: rtlwifi: Fix global-out-of-bounds bug in _rtl8812ae_phy_set_txpower_limit()
    c7a97f6c73e0 wifi: rtw89: 8852c: rfk: correct DPK settings
    6cc41f946aa2 wifi: rtw89: 8852c: rfk: correct DACK setting
    afa42dbbb1f2 wifi: rtl8xxxu: don't call dev_kfree_skb() under spin_lock_irqsave()
    653d13a73e49 wifi: libertas: fix memory leak in lbs_init_adapter()
    e81114f49b67 wifi: iwlegacy: common: don't call dev_kfree_skb() under spin_lock_irqsave()
    5366c223c0c6 wifi: rtlwifi: rtl8723be: don't call kfree_skb() under spin_lock_irqsave()
    3e3962d52ffa wifi: rtlwifi: rtl8188ee: don't call kfree_skb() under spin_lock_irqsave()
    231385c75937 wifi: rtlwifi: rtl8821ae: don't call kfree_skb() under spin_lock_irqsave()
    c4f1ded67a90 wifi: rsi: Fix memory leak in rsi_coex_attach()
    408a8295c896 wifi: mt76: fix coverity uninit_use_in_call in mt76_connac2_reverse_frag0_hdr_trans()
    494ceb253aaf wifi: mt76: mt7915: fix unintended sign extension of mt7915_hw_queue_read()
    c31759baecfd wifi: mt76: mt7915: drop always true condition of __mt7915_reg_addr()
    8dd61e810fa4 wifi: mt76: mt7915: check return value before accessing free_block_num
    8b5174a7f25d wifi: mt76: mt7921s: fix slab-out-of-bounds access in sdio host
    4469ddf7d5ec wifi: mt76: mt7915: add missing of_node_put()
    fba23dfd6f27 block: use proper return value from bio_failfast()
    a07836bc0a32 block: bio-integrity: Copy flags when bio_integrity_payload is cloned
    3c5059e24a20 block: Fix io statistics for cgroup in throttle path
    cbe695b83845 block: sync mixed merged request's failfast with 1st bio's
    afc983189496 erofs: relinquish volume with mutex held
    1cae3dd88e50 arm64: dts: qcom: pmk8350: Use the correct PON compatible
    669b26eb87f6 arm64: dts: qcom: pmk8350: Specify PBS register for PON
    066de07e02a9 block: ublk: check IO buffer based on flag need_get_data
    c77d664ab8e3 KEYS: asymmetric: Fix ECDSA use via keyctl uapi
    2fb6b7006d23 x86/perf/zhaoxin: Add stepping check for ZXC
    28057ce72204 perf/x86/intel/ds: Fix the conversion from TSC to perf time
    6b4fcc4e8a30 sched/rt: pick_next_rt_entity(): check list_entry
    ef3a7ffc0a6f s390/dasd: Fix potential memleak in dasd_eckd_init()
    3f82ad843898 arm64: dts: qcom: msm8992-lg-bullhead: Enable regulators
    8f21aa36f767 arm64: dts: qcom: msm8992-*: Fix up comments
    9fee3bfc9026 arm64: dts: qcom: msm8953: correct TLMM gpio-ranges
    b55c3db4ebf8 arm64: dts: qcom: msm8992-lg-bullhead: Correct memory overlaps with the SMEM and MPSS memory regions
    16b6a0e91fd3 arm64: dts: qcom: sm8450: drop incorrect cells from serial
    c051e3c59b45 arm64: dts: qcom: sm8350: drop incorrect cells from serial
    d5f4a0f4ebd7 arm64: dts: qcom: msm8996 switch from RPM_SMD_BB_CLK1 to RPM_SMD_XO_CLK_SRC
    02b40796f387 arm64: dts: qcom: msm8996: support using GPLL0 as kryocc input
    800141f9b534 blk-mq: correct stale comment of .get_budget
    c9cf2f38cb18 blk-mq: Fix potential io hung for shared sbitmap per tagset
    b1f6feff7c6a blk-mq: wait on correct sbitmap_queue in blk_mq_mark_tag_wait
    ad756d8cae3b blk-mq: remove stale comment for blk_mq_sched_mark_restart_hctx
    14cea6cc8ad3 blk-mq: avoid sleep in blk_mq_alloc_request_hctx
    76e64c9a0a82 ARM: dts: stm32: Update part number NVMEM description on stm32mp131
    722ea8e50de8 arm64: dts: mediatek: mt7986: Fix watchdog compatible
    d53255b6e005 arm64: dts: mediatek: mt8195: Fix watchdog compatible
    2e5186b452e3 arm64: dts: mediatek: mt8186: Fix watchdog compatible
    78b3831c4d98 arm64: dts: mediatek: mt7622: Add missing pwm-cells to pwm node
    335d89880d2d arm64: dts: mt8186: Fix CPU map for single-cluster SoC
    d7219172bfa6 arm64: dts: mt8192: Fix CPU map for single-cluster SoC
    f870eb010ee0 arm64: dts: mt8195: Fix CPU map for single-cluster SoC
    3e5ddf2b8438 sbitmap: correct wake_batch recalculation to avoid potential IO hung
    0f312961c799 sbitmap: Use single per-bitmap counting to wake up queued tags
    b2fbd1c9bd30 sbitmap: remove redundant check in __sbitmap_queue_get_batch
    ffdc6932437b ARM: dts: imx7s: correct iomuxc gpr mux controller cells
    e6829910b93f ublk_drv: don't probe partitions if the ubq daemon isn't trusted
    23e79f75e61b ublk_drv: remove nr_aborted_queues from ublk_device
    0f58469c7864 ARM: dts: sun8i: nanopi-duo2: Fix regulator GPIO reference
    58dccc65221c arm64: dts: meson: bananapi-m5: switch VDDIO_C pin to OPEN_DRAIN
    b556778f76f9 arm64: dts: meson: radxa-zero: allow usb otg mode
    5379f4aa230d arm64: dts: renesas: beacon-renesom: Fix gpio expander reference
    fd38b56f3a6a locking/rwsem: Disable preemption in all down_read*() and up_read() code paths
    1c68c6006478 arm64: dts: amlogic: meson-sm1-odroid-hc4: fix active fan thermal trip
    084f14099af9 arm64: dts: amlogic: meson-gxbb-kii-pro: fix led node name
    16b3b00360f4 arm64: dts: amlogic: meson-gxl-s905d-phicomm-n1: fix led node name
    e35feeb3fdbe arm64: dts: amlogic: meson-sm1-bananapi-m5: fix adc keys node names
    5c88975800f2 arm64: dts: amlogic: meson-gx-libretech-pc: fix update button name
    b362379ddf11 arm64: dts: amlogic: meson-gxl: add missing unit address to eth-phy-mux node name
    b7f839bc2e5c arm64: dts: amlogic: meson-axg-jethome-jethub-j1xx: fix invalid rtc node name
    65d5ffb9639b arm64: dts: amlogic: meson-gxl-s905w-jethome-jethub-j80: fix invalid rtc node name
    ce047a265a69 arm64: dts: amlogic: meson-gx: add missing unit address to rng node name
    54b3c863762f arm64: dts: amlogic: meson-gxl-s905d-sml5442tw: drop invalid clock-names property
    c727f9bb9e42 arm64: dts: amlogic: meson-axg-jethome-jethub-j1xx: fix supply name of USB controller node
    79bf95227649 arm64: dts: amlogic: meson-gx: add missing SCPI sensors compatible
    8edbf0894ba8 arm64: dts: amlogic: meson-axg: fix SCPI clock dvfs node name
    0c38c2e2169d arm64: dts: amlogic: meson-gx: fix SCPI clock dvfs node name
    1e0a7b41f503 ARM: imx: Call ida_simple_remove() for ida_simple_get
    7f02f32ee66e ARM: dts: exynos: correct wr-active property in Exynos3250 Rinato
    a0726e992dbc arm64: dts: ti: k3-j7200: Fix wakeup pinmux range
    e1bfd8784cb5 ARM: s3c: fix s3c64xx_set_timer_source prototype
    ed4400210105 ARM: bcm2835_defconfig: Enable the framebuffer
    addbe278d723 arm64: dts: mediatek: mt8192: Mark scp_adsp clock as broken
    ab5968aa3d7b ARM: OMAP1: call platform_device_put() in error case in omap1_dm_timer_init()
    a8cc5a1e5005 arm64: dts: meson: remove CPU opps below 1GHz for G12A boards
    3eb8dd85321f arm64: dts: qcom: ipq8074: correct PCIe QMP PHY output clock names
    130d06c40cea arm64: dts: qcom: ipq8074: fix Gen3 PCIe node
    8591695cb68e arm64: dts: qcom: ipq8074: correct Gen2 PCIe ranges
    3cf94d7fdee7 arm64: dts: qcom: ipq8074: fix Gen3 PCIe QMP PHY
    8c9554012be6 arm64: dts: qcom: ipq8074: fix Gen2 PCIe QMP PHY
    03b414e181d2 arm64: dts: qcom: ipq8074: correct USB3 QMP PHY-s clock output names
    d98ab7b969f6 arm64: dts: qcom: msm8992-bullhead: Disable dfps_data_mem
    91475aa72e21 arm64: dts: qcom: msm8992-bullhead: Fix cont_splash_mem size
    2dd983e1dd54 arm64: dts: msm8992-bullhead: add memory hole region
    3de06621abee arm64: tegra: Fix duplicate regulator on Jetson TX1
    3fd1439e7b7d arm64: dts: ti: k3-am62-main: Fix clocks for McSPI
    5453ea5d8865 arm64: dts: ti: k3-am62: Enable SPI nodes at the board level
    07fc78d8f0c9 cpuidle, intel_idle: Fix CPUIDLE_FLAG_IRQ_ENABLE *again*
    4259d9af7ef6 arm64: dts: meson-gx: Fix the SCPI DVFS node name and unit address
    d314f2947aad arm64: dts: meson-g12a: Fix internal Ethernet PHY unit name
    c91352826f3c arm64: dts: meson-gx: Fix Ethernet MAC address unit name
    e9cbef47ae0c arm64: dts: meson-axg: jethub-j1xx: Fix MAC address node names
    2b9ed2d4d6d1 arm64: dts: meson-gxl: jethub-j80: Fix Bluetooth MAC node name
    6194b4422467 arm64: dts: meson-gxl: jethub-j80: Fix WiFi MAC address node
    6c8d10d05884 arm64: dts: qcom: sc8280xp: Vote for CX in USB controllers
    32785fada583 arm64: dts: qcom: sc8280xp: correct SPMI bus address cells
    14af148bcf77 arm64: dts: qcom: sc7280: correct SPMI bus address cells
    65e0c74501bc arm64: dts: qcom: sc7180: correct SPMI bus address cells
    ce7d894bed1a x86/acpi/boot: Do not register processors that cannot be onlined for x2APIC
    681964878331 arm64: dts: qcom: sdm845-db845c: fix audio codec interrupt pin name
    57991c89c9b8 arm64: dts: mediatek: mt8186: Fix systimer 13 MHz clock description
    ba20e0b2c6d3 arm64: dts: mediatek: mt8195: Fix systimer 13 MHz clock description
    242196166ca6 arm64: dts: mediatek: mt8192: Fix systimer 13 MHz clock description
    8770843a00af arm64: dts: mediatek: mt8183: Fix systimer 13 MHz clock description
    850fd7deb574 arm64: dts: mediatek: mt8195: Add power domain to U3PHY1 T-PHY
    e43a06c73be4 ARM: zynq: Fix refcount leak in zynq_early_slcr_init
    45df2f9562fb arm64: dts: imx8m: Align SoC unique ID node unit address
    a4598dbf8079 arm64: dts: qcom: sm6125-seine: Clean up gpio-keys (volume down)
    ca4dfd29ac90 arm64: dts: qcom: sm6125: Reorder HSUSB PHY clocks to match bindings
    f4996d63e721 arm64: dts: qcom: sm6350: Fix up the ramoops node
    69283bfc0a7b arm64: dts: qcom: sm8150-kumano: Panel framebuffer is 2.5k instead of 4k
    53866b5a2ed2 arm64: dts: qcom: msm8996-tone: Fix USB taking 6 minutes to wake up
    5cace2e34bd9 arm64: dts: qcom: qcs404: use symbol names for PCIe resets
    98df4bdf3b01 ARM: OMAP2+: Fix memory leak in realtime_counter_init()
    10949d708742 ata: ahci: Revert "ata: ahci: Add Tiger Lake UP{3,4} AHCI controller"
    57edc43c1569 powerpc/mm: Rearrange if-else block to avoid clang warning
    ee907829b369 HID: asus: use spinlock to safely schedule workers
    7fd279b82157 HID: asus: use spinlock to protect concurrent accesses

Signed-off-by: Bruce Ashfield <bruce.ashfield@gmail.com>
---
 .../linux/linux-yocto-rt_6.1.bb               |  6 ++--
 .../linux/linux-yocto-tiny_6.1.bb             |  6 ++--
 meta/recipes-kernel/linux/linux-yocto_6.1.bb  | 28 +++++++++----------
 3 files changed, 20 insertions(+), 20 deletions(-)

diff --git a/meta/recipes-kernel/linux/linux-yocto-rt_6.1.bb b/meta/recipes-kernel/linux/linux-yocto-rt_6.1.bb
index 6598b423ad..5f79bc617b 100644
--- a/meta/recipes-kernel/linux/linux-yocto-rt_6.1.bb
+++ b/meta/recipes-kernel/linux/linux-yocto-rt_6.1.bb
@@ -11,13 +11,13 @@ python () {
         raise bb.parse.SkipRecipe("Set PREFERRED_PROVIDER_virtual/kernel to linux-yocto-rt to enable it")
 }
 
-SRCREV_machine ?= "8e1d6bb01a46293b6b60b203b2efc941b5fa8f6e"
-SRCREV_meta ?= "00f113337ea3685e66890d581a954b86e60d23d4"
+SRCREV_machine ?= "8d55a90b757757f76ec124508fd2bcace5d276b5"
+SRCREV_meta ?= "1a97a82e62ebf4ef3787768a1f5937e2d2f280ce"
 
 SRC_URI = "git://git.yoctoproject.org/linux-yocto.git;branch=${KBRANCH};name=machine \
            git://git.yoctoproject.org/yocto-kernel-cache;type=kmeta;name=meta;branch=yocto-6.1;destsuffix=${KMETA}"
 
-LINUX_VERSION ?= "6.1.15"
+LINUX_VERSION ?= "6.1.20"
 
 LIC_FILES_CHKSUM = "file://COPYING;md5=6bc538ed5bd9a7fc9398086aedcd7e46"
 
diff --git a/meta/recipes-kernel/linux/linux-yocto-tiny_6.1.bb b/meta/recipes-kernel/linux/linux-yocto-tiny_6.1.bb
index 14be758f6f..58357d00c7 100644
--- a/meta/recipes-kernel/linux/linux-yocto-tiny_6.1.bb
+++ b/meta/recipes-kernel/linux/linux-yocto-tiny_6.1.bb
@@ -5,7 +5,7 @@ KCONFIG_MODE = "--allnoconfig"
 
 require recipes-kernel/linux/linux-yocto.inc
 
-LINUX_VERSION ?= "6.1.15"
+LINUX_VERSION ?= "6.1.20"
 LIC_FILES_CHKSUM = "file://COPYING;md5=6bc538ed5bd9a7fc9398086aedcd7e46"
 
 DEPENDS += "${@bb.utils.contains('ARCH', 'x86', 'elfutils-native', '', d)}"
@@ -14,8 +14,8 @@ DEPENDS += "openssl-native util-linux-native"
 KMETA = "kernel-meta"
 KCONF_BSP_AUDIT_LEVEL = "2"
 
-SRCREV_machine ?= "32302b50ec3b3ab3e74680abe8139a34fe39d09f"
-SRCREV_meta ?= "00f113337ea3685e66890d581a954b86e60d23d4"
+SRCREV_machine ?= "423e1996694b61fbfc8ec3bf062fc6461d64fde1"
+SRCREV_meta ?= "1a97a82e62ebf4ef3787768a1f5937e2d2f280ce"
 
 PV = "${LINUX_VERSION}+git${SRCPV}"
 
diff --git a/meta/recipes-kernel/linux/linux-yocto_6.1.bb b/meta/recipes-kernel/linux/linux-yocto_6.1.bb
index 876c141506..6f33032c00 100644
--- a/meta/recipes-kernel/linux/linux-yocto_6.1.bb
+++ b/meta/recipes-kernel/linux/linux-yocto_6.1.bb
@@ -14,25 +14,25 @@ KBRANCH:qemux86-64 ?= "v6.1/standard/base"
 KBRANCH:qemuloongarch64  ?= "v6.1/standard/base"
 KBRANCH:qemumips64 ?= "v6.1/standard/mti-malta64"
 
-SRCREV_machine:qemuarm ?= "9aa65d42312580ec8b118252765ce1e121838206"
-SRCREV_machine:qemuarm64 ?= "32302b50ec3b3ab3e74680abe8139a34fe39d09f"
-SRCREV_machine:qemuloongarch64 ?= "1caf99d56881e1510afca553cd4a057f80479973"
-SRCREV_machine:qemumips ?= "9842d12e2a958990b434e65cd0e60cd4a403103a"
-SRCREV_machine:qemuppc ?= "32302b50ec3b3ab3e74680abe8139a34fe39d09f"
-SRCREV_machine:qemuriscv64 ?= "32302b50ec3b3ab3e74680abe8139a34fe39d09f"
-SRCREV_machine:qemuriscv32 ?= "32302b50ec3b3ab3e74680abe8139a34fe39d09f"
-SRCREV_machine:qemux86 ?= "32302b50ec3b3ab3e74680abe8139a34fe39d09f"
-SRCREV_machine:qemux86-64 ?= "32302b50ec3b3ab3e74680abe8139a34fe39d09f"
-SRCREV_machine:qemumips64 ?= "9c8388933caf687ce8562000b8b964eb6d136b83"
-SRCREV_machine ?= "32302b50ec3b3ab3e74680abe8139a34fe39d09f"
-SRCREV_meta ?= "00f113337ea3685e66890d581a954b86e60d23d4"
+SRCREV_machine:qemuarm ?= "fad8850ff15dfbf8fb2e7d71583fc54b809d10ef"
+SRCREV_machine:qemuarm64 ?= "423e1996694b61fbfc8ec3bf062fc6461d64fde1"
+SRCREV_machine:qemuloongarch64 ?= "423e1996694b61fbfc8ec3bf062fc6461d64fde1"
+SRCREV_machine:qemumips ?= "dd663b72efce61f63f0b38403254eb52e6ad9a59"
+SRCREV_machine:qemuppc ?= "423e1996694b61fbfc8ec3bf062fc6461d64fde1"
+SRCREV_machine:qemuriscv64 ?= "423e1996694b61fbfc8ec3bf062fc6461d64fde1"
+SRCREV_machine:qemuriscv32 ?= "423e1996694b61fbfc8ec3bf062fc6461d64fde1"
+SRCREV_machine:qemux86 ?= "423e1996694b61fbfc8ec3bf062fc6461d64fde1"
+SRCREV_machine:qemux86-64 ?= "423e1996694b61fbfc8ec3bf062fc6461d64fde1"
+SRCREV_machine:qemumips64 ?= "587a945baf13cdca2421e280b7b07dead6ad2a77"
+SRCREV_machine ?= "423e1996694b61fbfc8ec3bf062fc6461d64fde1"
+SRCREV_meta ?= "a8881762b53231bb914329cac3c2cf8db8b6779b"
 
 # set your preferred provider of linux-yocto to 'linux-yocto-upstream', and you'll
 # get the <version>/base branch, which is pure upstream -stable, and the same
 # meta SRCREV as the linux-yocto-standard builds. Select your version using the
 # normal PREFERRED_VERSION settings.
 BBCLASSEXTEND = "devupstream:target"
-SRCREV_machine:class-devupstream ?= "42616e0f09fb4e9a6c59892a227f7bdefbd2d6d3"
+SRCREV_machine:class-devupstream ?= "7eaef76fbc4621ced374c85dbc000dd80dc681d7"
 PN:class-devupstream = "linux-yocto-upstream"
 KBRANCH:class-devupstream = "v6.1/base"
 
@@ -40,7 +40,7 @@ SRC_URI = "git://git.yoctoproject.org/linux-yocto.git;name=machine;branch=${KBRA
            git://git.yoctoproject.org/yocto-kernel-cache;type=kmeta;name=meta;branch=yocto-6.1;destsuffix=${KMETA}"
 
 LIC_FILES_CHKSUM = "file://COPYING;md5=6bc538ed5bd9a7fc9398086aedcd7e46"
-LINUX_VERSION ?= "6.1.15"
+LINUX_VERSION ?= "6.1.20"
 
 DEPENDS += "${@bb.utils.contains('ARCH', 'x86', 'elfutils-native', '', d)}"
 DEPENDS += "openssl-native util-linux-native"
-- 
2.34.1


