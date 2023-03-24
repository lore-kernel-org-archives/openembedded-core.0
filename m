Return-Path: <bruce.ashfield@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 8A432C77B62
	for <webhook@archiver.kernel.org>; Fri, 24 Mar 2023 15:20:07 +0000 (UTC)
Received: from mail-qt1-f181.google.com (mail-qt1-f181.google.com [209.85.160.181])
 by mx.groups.io with SMTP id smtpd.web11.104116.1679671205414512340
 for <openembedded-core@lists.openembedded.org>;
 Fri, 24 Mar 2023 08:20:05 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20210112 header.b=kRF9sCxR;
 spf=pass (domain: gmail.com, ip: 209.85.160.181, mailfrom: bruce.ashfield@gmail.com)
Received: by mail-qt1-f181.google.com with SMTP id bz27so1774073qtb.1
        for <openembedded-core@lists.openembedded.org>; Fri, 24 Mar 2023 08:20:05 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112; t=1679671204;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=6nyK2/JyzdPb6KKDPjBer3aON6/npkjOqaQE0NTB0rI=;
        b=kRF9sCxRl56dA32f0gOEKgJXCM9ymq5AIMBlmI7n49QOvdGwg6arPMCT91qSvA0aVl
         iwM34cQAW+HCoMnddUbHxVL+PijRrDyoXhTb9mRXqCPcuST2rXpx/jV2sZBOdeUSrXZH
         BSOgZ8pLs9J4JLxsN5DXdPI6xTATEUwUTFM0JHdUcARSd2CaH2N2knjIfzHPMR7hMPLz
         pvSGZht3Zc6kFEsJ6sZMwDtfGzVR7Y6tVWPzBE5+8ikM124we9vz/Jc2pDvAwT1EkgFy
         FEGPyO8Z8Tv5S+3q/lW/AQrkJo3OTEx90Hnr3VQwGgxdyD8C7u8z0QN5ks6bmOD5YflO
         9hLw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112; t=1679671204;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=6nyK2/JyzdPb6KKDPjBer3aON6/npkjOqaQE0NTB0rI=;
        b=tO7gNdn3Rdq4nBPV6McDaNQKvFdHJLl7A51nSJdn+36lwUQCgDWKhw8zlh9F5QQ6t0
         xMwZHl7yrelMLIVuFKbB6vw9b+9fdv6uzisvv18LZbMUq3nAJJ1kzuuGB8TVVqVhmRRG
         c0bNfRcMJgcjIYPiKIQw11zZ1S+jjmEq2jKeBHM+989nJr6HDonL+QdiX24UCOQ7RnPh
         oUYMQYk9Zy5vr/UYqWaEZfpoAtAa+wQrQKo/cScQo34jWhMjMYEHElvuqEirQXLVgO7X
         ihtDmuJIw29uxqxFExno2lBjNvLs3Wdo9OiYmktEVLenIFYB8ll5DjfJnNe9HpCJjFkU
         XDpQ==
X-Gm-Message-State: AO0yUKVIlmoBmOcqrEqW4hcY1fy9ua1FD7VdxXcRSZBAhogL6tDNKx09
	CLTSepJCMuPfc4wf/stxvICRrD9wnRHGzA==
X-Google-Smtp-Source: AK7set/dT13jcntTKjEDuBTQay0HNUFbv/ofaV3Q5248kCmZmkIjRXA3XbtlR/0DCV+UpZrbm0TDaw==
X-Received: by 2002:a05:622a:199d:b0:3d3:33bd:a29 with SMTP id u29-20020a05622a199d00b003d333bd0a29mr14928502qtc.16.1679671204079;
        Fri, 24 Mar 2023 08:20:04 -0700 (PDT)
Received: from build.lan (cpe7c9a54441c1f-cm7c9a54441c1d.cpe.net.cable.rogers.com. [173.34.238.88])
        by smtp.gmail.com with ESMTPSA id w8-20020a05620a148800b0073bb0ef3a8esm14316752qkj.21.2023.03.24.08.20.03
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 24 Mar 2023 08:20:03 -0700 (PDT)
From: bruce.ashfield@gmail.com
To: steve@sakoman.com
Cc: openembedded-core@lists.openembedded.org
Subject: [[PATCH][kirkstone] 7/7] linux-yocto/5.10: update to v5.10.175
Date: Fri, 24 Mar 2023 11:19:56 -0400
Message-Id: <20230324151956.1349749-7-bruce.ashfield@gmail.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20230324151956.1349749-1-bruce.ashfield@gmail.com>
References: <20230324151956.1349749-1-bruce.ashfield@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Fri, 24 Mar 2023 15:20:07 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/179059

From: Bruce Ashfield <bruce.ashfield@gmail.com>

Updating  to the latest korg -stable release that comprises
the following commits:

    de26e1b2103b Linux 5.10.175
    aa8579bc0846 s390/dasd: add missing discipline function
    6baebcecf09a KVM: VMX: Fix crash due to uninitialized current_vmcs
    685ed0a277f1 KVM: VMX: Introduce vmx_msr_bitmap_l01_changed() helper
    0ef55bafabb9 KVM: nVMX: Don't use Enlightened MSR Bitmap for L3
    9da269bee7ea UML: define RUNTIME_DISCARD_EXIT
    5c425eb9da8a sh: define RUNTIME_DISCARD_EXIT
    bfef72d2fc62 s390: define RUNTIME_DISCARD_EXIT to fix link error with GNU ld < 2.36
    6af633e7782c powerpc/vmlinux.lds: Don't discard .rela* for relocatable builds
    af560685bad5 powerpc/vmlinux.lds: Define RUNTIME_DISCARD_EXIT
    d367c5ebe943 arch: fix broken BuildID for arm64 and riscv
    7550aade9783 ext4: block range must be validated before use in ext4_mb_clear_bb()
    c3fd717b58f0 ext4: add strict range checks while freeing blocks
    65061f49a50f ext4: add ext4_sb_block_valid() refactored out of ext4_inode_block_valid()
    9cd21f5babb5 ext4: refactor ext4_free_blocks() to pull out ext4_mb_clear_bb()
    b5005605013d drm/i915: Don't use BAR mappings for ring buffers with LLC
    c53d50d8081a skbuff: Fix nfct leak on napi stolen
    a4932a2c5446 ipmi:watchdog: Set panic count to proper value on a panic
    7aa5a495cbf8 ipmi/watchdog: replace atomic_add() and atomic_sub()
    a5c140d88a69 media: rc: gpio-ir-recv: add remove function
    13b04efb5bd0 media: ov5640: Fix analogue gain control
    42bb1e6b7fe8 scripts: handle BrokenPipeError for python scripts
    be658aa43a47 PCI: Add SolidRun vendor ID
    d47d364f6671 macintosh: windfarm: Use unsigned type for 1-bit bitfields
    9cff3f106a4c alpha: fix R_ALPHA_LITERAL reloc for large modules
    9a61a3a6ec66 powerpc/kcsan: Exclude udelay to prevent recursive instrumentation
    5ddcb0a34819 MIPS: Fix a compilation issue
    7f77f3dab506 block, bfq: fix uaf for bfqq in bic_set_bfqq()
    6291281f15e1 block, bfq: replace 0/1 with false/true in bic apis
    e6f03decf5b7 block/bfq-iosched.c: use "false" rather than "BLK_RW_ASYNC"
    1425f1bb5df5 block, bfq: fix uaf for bfqq in bfq_exit_icq_bfqq
    5533742c7cb1 block, bfq: fix possible uaf for 'bfqq->bic'
    c660e024bc68 tpm/eventlog: Don't abort tpm_read_log on faulty ACPI address
    b1fddddf58ac watch_queue: fix IOC_WATCH_QUEUE_SET_SIZE alloc error paths
    f2a5ec7f7b28 iommu/amd: Add a length limitation for the ivrs_acpihid command-line parameter
    b113f9020447 ext4: Fix deadlock during directory rename
    ab89b8a67fbb RISC-V: Don't check text_mutex during stop_machine
    3de277af481a riscv: Use READ_ONCE_NOCHECK in imprecise unwinding stack mode
    ce7dd61e0040 SUNRPC: Fix a server shutdown leak
    e1b8342a8528 net/smc: fix fallback failed while sendmsg with fastopen
    93367126f68c platform: x86: MLX_PLATFORM: select REGMAP instead of depending on it
    0fe672336d69 scsi: megaraid_sas: Update max supported LD IDs to 240
    f4eae84f5754 net: ethernet: mtk_eth_soc: fix RX data corruption issue
    01a1e9810905 btf: fix resolving BTF_KIND_VAR after ARRAY, STRUCT, UNION, PTR
    065c1ed5c4ce netfilter: tproxy: fix deadlock due to missing BH disable
    26fa059cc924 netfilter: ctnetlink: revert to dumping mark regardless of event type
    d16701a385b5 bnxt_en: Avoid order-5 memory allocation for TPA data
    c0df4e5c247d net: phylib: get rid of unnecessary locking
    d2a5a9cdc5d6 net: stmmac: add to set device wake up flag when stmmac init phy
    c3aaec463a63 net: caif: Fix use-after-free in cfusbl_device_notify()
    db16d6567402 net: lan78xx: fix accessing the LAN7800's internal phy specific registers from the MAC driver
    d5e8f7edc2ac net: usb: lan78xx: Remove lots of set but unused 'ret' variables
    374cbffe7d6f selftests: nft_nat: ensuring the listening side is up before starting the client
    42d9ed4e5dc5 ila: do not generate empty messages in ila_xlat_nl_cmd_get_mapping()
    6f0cc879c889 powerpc: dts: t1040rdb: fix compatible string for Rev A boards
    80be62358fa5 nfc: fdp: add null check of devm_kmalloc_array in fdp_nci_i2c_read_device_properties
    cbf11ff3708f bgmac: fix *initial* chip reset to support BCM5358
    4c43a0291f87 drm/msm/a5xx: fix context faults during ring switch
    34e71ca0a006 drm/msm/a5xx: fix the emptyness check in the preempt code
    8dde1d9d6f06 drm/msm: Document and rename preempt_lock
    00c2020b8bb8 drm/msm/a5xx: fix setting of the CP_PREEMPT_ENABLE_LOCAL register
    08c0b54bef78 drm/msm: Fix potential invalid ptr free
    8b4a6dd15717 drm/nouveau/kms/nv50: fix nv50_wndw_new_ prototype
    9ca74e5e75ea drm/nouveau/kms/nv50-: remove unused functions
    0c440f14558b ext4: Fix possible corruption when moving a directory
    6b223e32d66c scsi: core: Remove the /proc/scsi/${proc_name} directory earlier
    e993e3ea9550 riscv: Add header include guards to insn.h
    713c335e5a8f riscv: Avoid enabling interrupts in die()
    f9fdb3e7b075 RISC-V: Avoid dereferening NULL regs in die()
    030b1c4217a4 arm64: efi: Make efi_rt_lock a raw_spinlock
    7e00b52c8cdd iommu/vt-d: Fix PASID directory pointer coherency
    c424b1819120 iommu/vt-d: Fix lockdep splat in intel_pasid_get_entry()
    aeab1f1a60ae irqdomain: Fix domain registration race
    bb7597777c13 irqdomain: Change the type of 'size' in __irq_domain_add() to be consistent
    4ab311d51cd9 irqdomain: Fix mapping-creation race
    8617599c646f irqdomain: Refactor __irq_domain_alloc_irqs()
    ff762cdbf0c8 irqdomain: Look for existing mapping only once
    6414597815d5 irq: Fix typos in comments
    fe80a53eabdb udf: Fix off-by-one error when discarding preallocation
    7786bfd8f7ab nfc: change order inside nfc_se_io error path
    3f00c476da8f ext4: zero i_disksize when initializing the bootloader inode
    a9bd94f67b27 ext4: fix WARNING in ext4_update_inline_data
    d72a6c31393d ext4: move where set the MAY_INLINE_DATA flag is set
    1d2366624b4c ext4: fix another off-by-one fsmap error on 1k block filesystems
    8706c972fcfa ext4: fix RENAME_WHITEOUT handling for inline directories
    d0632ff49bd1 ext4: fix cgroup writeback accounting with fs-layer encryption
    3106cb47cded drm/connector: print max_requested_bpc in state debugfs
    4279e87da6c8 drm/amdgpu: fix error checking in amdgpu_read_mm_registers for soc15
    5462843dc40f x86/CPU/AMD: Disable XSAVES on AMD family 0x17
    a1eb8bf1e35f fork: allow CLONE_NEWTIME in clone3 flags
    a759905de9cd fs: prevent out-of-bounds array speculation when closing a file descriptor
    955623617f2f Linux 5.10.174
    c036dae03678 staging: rtl8192e: Remove call_usermodehelper starting RadioPower.sh
    1afff6203a73 staging: rtl8192e: Remove function ..dm_check_ac_dc_power calling a script
    decf73066f7e wifi: cfg80211: Partial revert "wifi: cfg80211: Fix use after free for wext"
    e5f315b55f8e Linux 5.10.173
    8ecd5dabddc0 usb: gadget: uvc: fix missing mutex_unlock() if kstrtou8() fails
    a5bbea50d622 malidp: Fix NULL vs IS_ERR() checking
    1dfc0a52f768 scsi: mpt3sas: Remove usage of dma_get_required_mask() API
    747652f9c503 scsi: mpt3sas: re-do lost mpt3sas DMA mask fix
    2392303df240 scsi: mpt3sas: Don't change DMA mask while reallocating pools
    f73bbfb47ff1 Revert "scsi: mpt3sas: Fix return value check of dma_get_required_mask()"
    331c18e8ac81 media: uvcvideo: Fix race condition with usb_kill_urb
    9d83b69e934d media: uvcvideo: Provide sync and async uvc_ctrl_status_event
    c5fe3fba1b7b drm/virtio: Fix error code in virtio_gpu_object_shmem_init()
    0a1d0c79eaec tcp: Fix listen() regression in 5.10.163
    7474be26b032 Bluetooth: hci_sock: purge socket queues in the destruct() callback
    d90967f850b1 drm/display/dp_mst: Fix down message handling after a packet reception error
    ee4a4282d78d drm/display/dp_mst: Fix down/up message handling after sink disconnect
    411b8ad505f7 x86/resctl: fix scheduler confusion with 'current'
    9554af98018c x86/resctrl: Apply READ_ONCE/WRITE_ONCE to task_struct.{rmid,closid}
    7123a4337bf7 net: tls: avoid hanging tasks on the tx_lock
    a6549336f574 soundwire: cadence: Drain the RX FIFO after an IO timeout
    e5ca5b71363a soundwire: cadence: Remove wasted space in response_buf
    4d2423f15b36 phy: rockchip-typec: Fix unsigned comparison with less than zero
    01923e3196ee PCI: Add ACS quirk for Wangxun NICs
    faa050d2ff88 PCI: loongson: Add more devices that need MRRS quirk
    dd9981a11d74 kernel/fail_function: fix memory leak with using debugfs_lookup()
    b2301851e7e3 PCI: Take other bus devices into account when distributing resources
    fdca189e5228 PCI: Align extra resources for hotplug bridges properly
    877aacda1469 usb: gadget: uvc: Make bSourceID read/write
    56495e8d3cb4 usb: uvc: Enumerate valid values for color matching
    961f93d63da7 USB: ene_usb6250: Allocate enough memory for full object
    426cbe9a0a68 usb: host: xhci: mvebu: Iterate over array indexes instead of using pointer math
    654ae539254d PCI: loongson: Prevent LS7A MRRS increases
    09ca779ac04c iio: accel: mma9551_core: Prevent uninitialized variable in mma9551_read_config_word()
    3357e90d3c36 iio: accel: mma9551_core: Prevent uninitialized variable in mma9551_read_status_word()
    8db64cea4788 tools/iio/iio_utils:fix memory leak
    160494b66fe0 mei: bus-fixup:upon error print return values of send and receive
    17b96b5c19be serial: sc16is7xx: setup GPIO controller later in probe
    0cb1f78d886b tty: serial: fsl_lpuart: disable the CTS when send break signal
    84ea44dc3e4e tty: fix out-of-bounds access in tty_driver_lookup_tty()
    e8a5efd5aefc staging: emxx_udc: Add checks for dma_alloc_coherent()
    c4d96503d67b media: uvcvideo: Silence memcpy() run-time false positive warnings
    78b1fdc47e4e media: uvcvideo: Quirk for autosuspend in Logitech B910 and C910
    23f9bead358d media: uvcvideo: Handle errors from calls to usb_string
    d8aa2e1ae642 media: uvcvideo: Handle cameras with invalid descriptors
    76752888edcc IB/hfi1: Update RMT size calculation
    754e81ff4406 mfd: arizona: Use pm_runtime_resume_and_get() to prevent refcnt leak
    903b91cea77a bootconfig: Increase max nodes of bootconfig from 1024 to 8192 for DCC support
    07fb5653366c firmware/efi sysfb_efi: Add quirk for Lenovo IdeaPad Duet 3
    25c9fba724bd tracing: Add NULL checks for buffer in ring_buffer_free_read_page()
    e30b26e74617 thermal: intel: BXT_PMIC: select REGMAP instead of depending on it
    f73134231fa2 thermal: intel: quark_dts: fix error pointer dereference
    01829cb87089 ASoC: zl38060 add gpiolib dependency
    2bc1f260ede1 ASoC: zl38060: Remove spurious gpiolib select
    c8e7c0ec458c ASoC: adau7118: don't disable regulators on device unbind
    c79a924ed6af loop: loop_set_status_from_info() check before assignment
    af5f9a476147 scsi: ipr: Work around fortify-string warning
    555f315832ec rtc: sun6i: Always export the internal oscillator
    3e734e694181 vc_screen: modify vcs_size() handling in vcs_read()
    ac73d8f6a64a tcp: tcp_check_req() can be called from process context
    4d08ed4651a1 ARM: dts: spear320-hmi: correct STMPE GPIO compatible
    2f935409cd82 net/sched: act_sample: fix action bind logic
    8978315cb4bf nfc: fix memory leak of se_io context in nfc_genl_se_io
    8817602cffe0 net/mlx5: Geneve, Fix handling of Geneve object id as error code
    0ac65fab2b3f 9p/rdma: unmap receive dma buffer in rdma_request()/post_recv()
    3e0359f151ac 9p/xen: fix connection sequence
    c959a53b62a6 9p/xen: fix version parsing
    82a0c1fe1fe0 net: fix __dev_kfree_skb_any() vs drop monitor
    8ee401f89cdb sctp: add a refcnt in sctp_stream_priorities to avoid a nested loop
    da26369377f0 ipv6: Add lwtunnel encap size of all siblings in nexthop calculation
    9060abce3305 netfilter: ebtables: fix table blob use-after-free
    1ff0b87df98b netfilter: ctnetlink: fix possible refcount leak in ctnetlink_create_conntrack()
    9f7abdd50026 watchdog: pcwd_usb: Fix attempting to access uninitialized memory
    c5a21a550150 watchdog: Fix kmemleak in watchdog_cdev_register
    273559f58f71 watchdog: at91sam9_wdt: use devm_request_irq to avoid missing free_irq() in error path
    7cb46fa16b96 x86: um: vdso: Add '%rcx' and '%r11' to the syscall clobber list
    8a18856e0744 ubi: ubi_wl_put_peb: Fix infinite loop when wear-leveling work failed
    9d448dd6bcb6 ubi: Fix UAF wear-leveling entry in eraseblk_count_seq_show()
    0aa0253f6c99 ubi: fastmap: Fix missed fm_anchor PEB in wear-leveling after disabling fastmap
    f09a84548c37 ubifs: ubifs_writepage: Mark page dirty after writing inode failed
    9d4768523b09 ubifs: dirty_cow_znode: Fix memleak in error handling path
    343d273d5fd0 ubifs: Re-statistic cleaned znode count if commit failed
    fcbc795abe78 ubi: Fix possible null-ptr-deref in ubi_free_volume()
    bf50229494f0 ubifs: Fix memory leak in alloc_wbufs()
    31d60afe2cc2 ubi: Fix unreferenced object reported by kmemleak in ubi_resize_volume()
    35f8d4064e54 ubi: Fix use-after-free when volume resizing failed
    38fd7acdc1d2 ubifs: Reserve one leb for each journal head while doing budget
    38a097dce184 ubifs: do_rename: Fix wrong space budget when target inode's nlink > 1
    495ea59a24a3 ubifs: Fix wrong dirty space budget for dirty inode
    9e07ee28c20d ubifs: Rectify space budget for ubifs_xrename()
    ffebd804c7ab ubifs: Rectify space budget for ubifs_symlink() if symlink is encrypted
    93e748ba5174 ubifs: Fix build errors as symbol undefined
    846bfba34175 ubi: ensure that VID header offset + VID header size <= alloc, size
    f2b9c4544e3b um: vector: Fix memory leak in vector_config
    6be349d7388f fs: f2fs: initialize fsdata in pagecache_write()
    33909b1a646d f2fs: use memcpy_{to,from}_page() where possible
    9d4a4a9ee95e pwm: stm32-lp: fix the check on arr and cmp registers update
    c2677c49b766 pwm: sifive: Always let the first pwm_apply_state succeed
    8b98e7a45e63 pwm: sifive: Reduce time the controller lock is held
    a1368eaea058 objtool: Fix memory leak in create_static_call_sections()
    5d03a19ac7e8 fs/jfs: fix shift exponent db_agl2size negative
    18c3fa7a7fdb net/sched: Retire tcindex classifier
    322df540ba05 kbuild: Port silent mode detection to future gnu make.
    f8ac5467e1f3 pinctrl: rockchip: fix reading pull type on rk3568
    50afcd5316f2 pinctrl: rockchip: fix mux route data for rk3568
    844da3901304 wifi: ath9k: use proper statements in conditionals
    a2a1e3f4ed5b arm64: dts: qcom: ipq8074: fix Gen2 PCIe QMP PHY
    64a99c0ac6f8 drm/edid: fix AVI infoframe aspect ratio handling
    1f064aaa81af drm/radeon: Fix eDP for single-display iMac11,2
    266864c1e0ed drm/i915/quirks: Add inverted backlight quirk for HP 14-r206nv
    5a2712427168 vfio/type1: prevent underflow of locked_vm via exec()
    691a8e26de78 PCI: Avoid FLR for AMD FCH AHCI adapters
    88b51c6a6d57 PCI: hotplug: Allow marking devices as disconnected during bind/unbind
    d219b19e1f26 PCI/PM: Observe reset delay irrespective of bridge_d3
    285d8390d98e riscv: jump_label: Fixup unaligned arch_static_branch function
    8f9542cad6c2 scsi: ses: Fix slab-out-of-bounds in ses_intf_remove()
    c315560e3ef7 scsi: ses: Fix possible desc_ptr out-of-bounds accesses
    2ecd344173a5 scsi: ses: Fix possible addl_desc_ptr out-of-bounds accesses
    e4dd25da784b scsi: ses: Fix slab-out-of-bounds in ses_enclosure_data_process()
    d68937dfc73e scsi: ses: Don't attach if enclosure has no components
    0d14ace68dd5 scsi: qla2xxx: Fix erroneous link down
    e596253113b6 scsi: qla2xxx: Fix DMA-API call trace on NVMe LS requests
    40bedbf10d56 scsi: qla2xxx: Fix link failure in NPIV environment
    6e02a43acd06 ring-buffer: Handle race between rb_move_tail and rb_check_pages
    1693f3bc1f25 ktest.pl: Add RUN_TIMEOUT option with default unlimited
    39255e4788fb ktest.pl: Fix missing "end_monitor" when machine check fails
    0dfb3f4588bc ktest.pl: Give back console on Ctrt^C on monitor
    ed77831e69ee mm/thp: check and bail out if page in deferred queue already
    e6d20325f422 mm: memcontrol: deprecate charge moving
    f1f6c87d8224 docs: gdbmacros: print newest record
    6814e8e4202f remoteproc/mtk_scp: Move clk ops outside send_lock
    3b78c2482bbe media: ipu3-cio2: Fix PM runtime usage_count in driver unbind
    6c96c0b2e326 mips: fix syscall_get_nr
    cd4d3eab2310 dax/kmem: Fix leak of memory-hotplug resources
    241e893df474 alpha: fix FEN fault handling
    ae16346078b1 rbd: avoid use-after-free in do_rbd_add() when rbd_dev_create() fails
    0f2fd21b5b54 ARM: dts: exynos: correct TMU phandle in Odroid HC1
    7dd9de2e2f7b ARM: dts: exynos: correct TMU phandle in Odroid XU
    d1887cca6526 ARM: dts: exynos: correct TMU phandle in Exynos5250
    136d6f3c5dc9 ARM: dts: exynos: correct TMU phandle in Odroid XU3 family
    135e968d6a86 ARM: dts: exynos: correct TMU phandle in Exynos4
    aaa2d2249c90 ARM: dts: exynos: correct TMU phandle in Exynos4210
    f2b478228bfd dm flakey: don't corrupt the zero page
    07e375c18af0 dm flakey: fix logic when corrupting a bio
    17f81b127712 thermal: intel: powerclamp: Fix cur_state for multi package system
    2cfe78619b0d wifi: cfg80211: Fix use after free for wext
    73090cebe3f3 wifi: rtl8xxxu: Use a longer retry limit of 48
    3383f79d6b0a dm: add cond_resched() to dm_wq_work()
    e6409208c13f mtd: spi-nor: Fix shift-out-of-bounds in spi_nor_set_erase_type
    0dc0fa313bb4 ext4: refuse to create ea block when umounted
    d738789ae9ec ext4: optimize ea_inode block expansion
    ab22799f11e3 jbd2: fix data missing when reusing bh which is ready to be checkpointed
    a9cd89463ea4 ALSA: hda/realtek: Add quirk for HP EliteDesk 800 G6 Tower PC
    ae2340769ed3 ALSA: ice1712: Do not left ice->gpio_mutex locked in aureon_add_controls()
    246f26664b2e io_uring/poll: allow some retries for poll triggering spuriously
    7f3d13241574 io_uring: remove MSG_NOSIGNAL from recvmsg
    72783d2af89b io_uring/rsrc: disallow multi-source reg buffers
    a442f12e47aa io_uring: add a conditional reschedule to the IOPOLL cancelation loop
    3d1f9533a39d io_uring: mark task TASK_RUNNING before handling resume/task work
    3f32f8492e10 io_uring: handle TIF_NOTIFY_RESUME when checking for task_work
    306c8b49b566 irqdomain: Drop bogus fwspec-mapping error handling
    e0538aa7e099 irqdomain: Fix disassociation race
    6b24bd85ae5c irqdomain: Fix association race
    8c64acd24aed ima: Align ima_file_mmap() parameters with mmap_file LSM hook
    c1aa96927b24 brd: return 0/-error from brd_insert_page()
    3326ef84cdbe Documentation/hw-vuln: Document the interaction between IBRS and STIBP
    abfed855f058 x86/speculation: Allow enabling STIBP with legacy IBRS
    44a44b57e88f x86/microcode/AMD: Fix mixed steppings support
    87cf9bc78c43 x86/microcode/AMD: Add a @cpu parameter to the reloading functions
    0a89768b85f0 x86/microcode/amd: Remove load_microcode_amd()'s bsp parameter
    5255fd8dfbd2 x86/kprobes: Fix arch_check_optimized_kprobe check within optimized_kprobe range
    c16e4610d5e5 x86/kprobes: Fix __recover_optprobed_insn check optimizing logic
    f75ee95196ce x86/reboot: Disable SVM, not just VMX, when stopping CPUs
    051f991c571b x86/reboot: Disable virtualization in an emergency if SVM is supported
    8ff2cc2f8775 x86/crash: Disable virt in core NMI crash handler to avoid double shootdown
    537be939a86a x86/virt: Force GIF=1 prior to disabling SVM (for reboot flows)
    edd7f5bc6f97 KVM: s390: disable migration mode when dirty tracking is disabled
    018798c6fbef KVM: x86: Inject #GP if WRMSR sets reserved bits in APIC Self-IPI
    76a9886e1b61 KVM: Destroy target device if coalesced MMIO unregistration fails
    bacfce056ea6 udf: Fix file corruption when appending just after end of preallocated extent
    a44ec34b9044 udf: Detect system inodes linked into directory hierarchy
    63478c3ce24b udf: Preserve link count of system files
    eb2133900cac udf: Do not update file length for failed writes to inline files
    965982feb333 udf: Do not bother merging very long extents
    9c792a59e078 udf: Truncate added extents on failed expansion
    6bf9caa58526 ocfs2: fix non-auto defrag path not working issue
    2c559b3ba8e0 ocfs2: fix defrag path triggering jbd2 ASSERT
    e9f20138b5fb f2fs: fix cgroup writeback accounting with fs-layer encryption
    00b558732662 f2fs: fix information leak in f2fs_move_inline_dirents()
    f9dbc35ecb94 exfat: fix inode->i_blocks for non-512 byte sector size device
    4017209e08d2 exfat: redefine DIR_DELETED as the bad cluster number
    c2d1997074ce exfat: fix unexpected EOF while reading dir
    34b05883414c exfat: fix reporting fs error when reading dir beyond EOF
    ef7d71d7bd57 fs: hfsplus: fix UAF issue in hfsplus_put_super
    dc9f78b6d254 hfs: fix missing hfs_bnode_get() in __hfs_bnode_create
    300b6404e601 ARM: dts: exynos: correct HDMI phy compatible in Exynos4
    69493675fdfb cifs: Fix uninitialized memory read in smb3_qfs_tcon()
    59102ded7480 s390/kprobes: fix current_kprobe never cleared after kprobes reenter
    d8724dc0ce76 s390/kprobes: fix irq mask clobbering on kprobe reenter from post_handler
    d43abcf91c5e s390: discard .interp section
    6cf48403c46a s390/extmem: return correct segment type in __segment_load()
    be2dad7bc932 ipmi_ssif: Rename idle state and check
    66b40f8756d2 rtc: pm8xxx: fix set-alarm race
    e5b643645a9a firmware: coreboot: framebuffer: Ignore reserved pixel color bits
    bf990eebeaa7 wifi: rtl8xxxu: fixing transmisison failure for rtl8192eu
    759f6a72bc5a nfsd: zero out pointers after putting nfsd_files on COPY setup error
    9b8047b21000 dm cache: add cond_resched() to various workqueue loops
    52206dd1c77f dm thin: add cond_resched() to various workqueue loops
    861229a52bac drm: panel-orientation-quirks: Add quirk for Lenovo IdeaPad Duet 3 10IGL5
    7df5da8e6bcf HID: logitech-hidpp: Don't restart communication if not necessary
    ca64ebcb4501 pinctrl: at91: use devm_kasprintf() to avoid potential leaks
    5735878a7b7d hwmon: (coretemp) Simplify platform device handling
    2f8623377f3e gfs2: Improve gfs2_make_fs_rw error handling
    bfa4ffd81591 regulator: s5m8767: Bounds check id indexing into arrays
    b4ff71c6f029 regulator: max77802: Bounds check regulator id against opmode
    0adacf6d6b12 ASoC: kirkwood: Iterate over array indexes instead of using pointer math
    fcfc7740228d docs/scripts/gdb: add necessary make scripts_gdb step
    540c66180afd drm/msm/dsi: Add missing check for alloc_ordered_workqueue
    d473c55ce197 drm: amd: display: Fix memory leakage
    ce9e9d3dcbb0 drm/radeon: free iio for atombios when driver shutdown
    819d8dba030d drm/tiny: ili9486: Do not assume 8-bit only SPI controllers
    bc919c866dd5 HID: Add Mapping for System Microphone Mute
    f4cb42525208 drm/omap: dsi: Fix excessive stack usage
    9f73793b8163 drm/amd/display: Fix potential null-deref in dm_resume
    348cc9ab3380 Bluetooth: btusb: Add VID:PID 13d3:3529 for Realtek RTL8821CE
    e974e8f1e37d PM: EM: fix memory leak with using debugfs_lookup()
    0c2b778edd8a uaccess: Add minimum bounds check on kernel buffer size
    d80f947bb303 coda: Avoid partial allocation of sig_inputArgs
    206c511e4214 net/mlx5: fw_tracer: Fix debug print
    1ef724fed392 ACPI: video: Fix Lenovo Ideapad Z570 DMI match
    46ce77b07cd8 wifi: mt76: dma: free rx_head in mt76_dma_rx_cleanup
    7873def499df m68k: Check syscall_trace_enter() return code
    841881320562 net: bcmgenet: Add a check for oversized packets
    1fc9760afd8a crypto: hisilicon: Wipe entire pool on error
    2fc7748d4823 clocksource: Suspend the watchdog temporarily when high read latency detected
    94933dab75d5 ACPI: Don't build ACPICA with '-Os'
    9f1865ebfa7a ice: add missing checks for PF vsi type
    b33091fc2896 inet: fix fast path in __inet_hash_connect()
    47dc1f425af5 wifi: mt7601u: fix an integer underflow
    0ca2efea4f11 wifi: brcmfmac: ensure CLM version is null-terminated to prevent stack-out-of-bounds
    4707c94f7f89 x86/bugs: Reset speculation control settings on init
    6ef02cdb5a30 timers: Prevent union confusion from unexpected restart_syscall()
    781bff0a532f thermal: intel: Fix unsigned comparison with less than zero
    744e538dcf27 wifi: ath11k: debugfs: fix to work with multiple PCI devices
    d99d194e2f8c rcu-tasks: Make rude RCU-Tasks work well with CPU hotplug
    2bf501f1bc78 rcu: Suppress smp_processor_id() complaint in synchronize_rcu_expedited_wait()
    f5657f330603 rcu: Make RCU_LOCKDEP_WARN() avoid early lockdep checks
    d6ef66194bb4 wifi: brcmfmac: Fix potential stack-out-of-bounds in brcmf_c_preinit_dcmds()
    99ff971b62e5 wifi: ath9k: Fix use-after-free in ath9k_hif_usb_disconnect()
    6e291810fe83 blk-iocost: fix divide by 0 error in calc_lcoefs()
    199624f3144d ARM: dts: exynos: Use Exynos5420 compatible for the MIPI video phy
    f34cc701ea0a udf: Define EFSCORRUPTED error code
    91f9d708716d rpmsg: glink: Avoid infinite loop on intent for missing channel
    2b72ceef1740 media: saa7134: Use video_unregister_device for radio_dev
    42f8ba835568 media: usb: siano: Fix use after free bugs caused by do_submit_urb
    cc2f9c8eb1ee media: i2c: ov7670: 0 instead of -EINVAL was returned
    78da5a378bda media: rc: Fix use-after-free bugs caused by ene_tx_irqsim()
    c6c3b4ae3166 media: i2c: imx219: Fix binning for RAW8 capture
    a34288e3a116 media: i2c: imx219: Split common registers from mode tables
    09a0410886aa media: i2c: imx219: remove redundant writes
    dfaafeb8e953 media: i2c: ov772x: Fix memleak in ov772x_probe()
    bcae9115a163 media: ov5675: Fix memleak in ov5675_init_controls()
    a163ee11345d media: ov2740: Fix memleak in ov2740_init_controls()
    505ff3a0c595 media: max9286: Fix memleak in max9286_v4l2_register()
    f3e10a3437dc builddeb: clean generated package content
    55f3bca25d3f powerpc: Remove linker flag from KBUILD_AFLAGS
    b74aaa314f6a media: platform: ti: Add missing check for devm_regulator_get
    c7a218cbf67f media: ti: cal: fix possible memory leak in cal_ctx_create()
    0a2e2674f720 remoteproc: qcom_q6v5_mss: Use a carveout to authenticate modem headers
    7e5bc675eb7b Input: iqs269a - do not poll during ATI
    65e39fdce1fc Input: iqs269a - do not poll during suspend or resume
    b0b84fd32cb4 alpha/boot/tools/objstrip: fix the check for ELF header
    4cab7debf3e0 vdpa/mlx5: Don't clear mr struct on destroy MR
    bccccd43a06d MIPS: vpe-mt: drop physical_memsize
    132203ce40d0 MIPS: SMP-CPS: fix build error when HOTPLUG_CPU not set
    6fc6d29be811 powerpc/eeh: Set channel state after notifying the drivers
    dfc41e385915 powerpc/eeh: Small refactor of eeh_handle_normal_event()
    386cc2af90e9 powerpc/rtas: ensure 4KB alignment for rtas_data_buf
    c9a299f2f465 powerpc/rtas: make all exports GPL
    7afd768784bd powerpc/pseries/lparcfg: add missing RTAS retry status handling
    df995aef6400 powerpc/pseries/lpar: add missing RTAS retry status handling
    9626f83a6ec7 powerpc/perf/hv-24x7: add missing RTAS retry status handling
    831a2d8de1d6 clk: Honor CLK_OPS_PARENT_ENABLE in clk_core_is_enabled()
    4f060379aaf2 powerpc/powernv/ioda: Skip unallocated resources when mapping to PE
    15fed9258b84 clk: qcom: gpucc-sdm845: fix clk_dis_wait being programmed for CX GDSC
    241048adcb40 clk: qcom: gpucc-sc7180: fix clk_dis_wait being programmed for CX GDSC
    1957c5b5ec4b Input: ads7846 - don't check penirq immediately for 7845
    8d9b9e56c2b6 Input: ads7846 - always set last command to PWRDOWN
    d247f3527b31 Input: ads7846 - convert to one message
    a6c43844462e Input: ads7846 - convert to full duplex
    7f2034b9b061 Input: ads7846 - don't report pressure for ads7845
    092effd9f992 clk: imx: avoid memory leak
    092f17eca84b clk: renesas: cpg-mssr: Remove superfluous check in resume code
    7beb9b4538e7 clk: renesas: cpg-mssr: Fix use after free if cpg_mssr_common_init() failed
    44a2a912c750 linux/kconfig.h: replace IF_ENABLED() with PTR_IF() in <linux/kernel.h>
    9a6dca86cfae Input: iqs269a - configure device with a single block write
    b7afc359f6e5 Input: iqs269a - increase interrupt handler return delay
    a6a70ab2bbe2 Input: iqs269a - drop unused device node references
    b7fb5b5d2c8c mtd: rawnand: sunxi: Fix the size of the last OOB region
    c90fa32bd4d2 RISC-V: fix funct4 definition for c.jalr in parse_asm.h
    c7950aa87280 clk: qcom: gcc-qcs404: fix names of the DSI clocks used as parents
    7fd6fd898b64 clk: qcom: gcc-qcs404: disable gpll[04]_out_aux parents
    3ee13bdf0d25 mfd: pcf50633-adc: Fix potential memleak in pcf50633_adc_async_read()
    8a041377a458 objtool: add UACCESS exceptions for __tsan_volatile_read/write
    455cf05161be printf: fix errname.c list
    b18946a9cee2 selftests/ftrace: Fix bash specific "==" operator
    b8dc9f6fde19 sparc: allow PM configs for sparc32 COMPILE_TEST
    93925ab9dd74 perf tools: Fix auto-complete on aarch64
    1d6101d9222e leds: led-core: Fix refcount leak in of_led_get()
    071b7f572051 perf llvm: Fix inadvertent file creation
    deece7bd60b0 gfs2: jdata writepage fix
    cfd85a0922c4 cifs: Fix warning and UAF when destroy the MR list
    caac205e0d5b cifs: Fix lost destroy smbd connection when MR allocate failed
    9e8ccaf4ff2c nfsd: fix race to check ls_layouts
    e73640184cb6 hid: bigben_probe(): validate report count
    fddde36316da HID: bigben: use spinlock to safely schedule workers
    ec8b79668ebf HID: bigben_worker() remove unneeded check on report_field
    2ca8ae5cf61e HID: bigben: use spinlock to protect concurrent accesses
    f69065e1bd90 ASoC: soc-dapm.h: fixup warning struct snd_pcm_substream not declared
    c785a87d9a77 spi: synquacer: Fix timeout handling in synquacer_spi_transfer_one()
    ac3a513d4fa8 NFS: fix disabling of swap
    242df51a8291 nfs4trace: fix state manager flag printing
    6d434b4c49f0 NFSv4: keep state manager thread active if swap is enabled
    d601f782824e NFS: Fix up handling of outstanding layoutcommit in nfs_update_inode()
    c550f65a54a0 dm: remove flush_scheduled_work() during local_exit()
    f23a4b9bf895 ASoC: tlv320adcx140: fix 'ti,gpio-config' DT property init
    4c6d18ea71d8 hwmon: (mlxreg-fan) Return zero speed for broken fan
    a79f1e71e7b5 spi: bcm63xx-hsspi: Fix multi-bit mode setting
    59b0ce292a09 spi: bcm63xx-hsspi: fix pm_runtime
    ca769960cb57 scsi: aic94xx: Add missing check for dma_map_single()
    30c7c72b6cf9 scsi: mpt3sas: Fix a memory leak
    0cb8a92a880d drm/amdgpu: fix enum odm_combine_mode mismatch
    859bdc96ba89 hwmon: (ltc2945) Handle error case in ltc2945_value_store
    d9bcf67b8bb3 ASoC: dt-bindings: meson: fix gx-card codec node regex
    b4d74716da00 ASoC: mchp-spdifrx: Fix uninitialized use of mr in mchp_spdifrx_hw_params()
    ce07bbe038ae ASoC: mchp-spdifrx: disable all interrupts in mchp_spdifrx_dai_remove()
    d8f5539b5e7f ASoC: mchp-spdifrx: fix controls that works with completion mechanism
    45956f1764ca ASoC: mchp-spdifrx: fix return value in case completion times out
    426423ed55de ASoC: atmel: fix spelling mistakes
    1983a70778eb ASoC: mchp-spdifrx: fix controls which rely on rsr register
    b33ca7b7bb66 spi: dw_bt1: fix MUX_MMIO dependencies
    33033f392d81 gpio: vf610: connect GPIO label to dev name
    f2f6e683d9e7 ASoC: soc-compress.c: fixup private_data on snd_soc_new_compress()
    6a89ddee1686 drm/mediatek: Clean dangling pointer on bind error path
    b64b6dff15a3 drm/mediatek: mtk_drm_crtc: Add checks for devm_kcalloc
    3a50d86696f6 drm/mediatek: Drop unbalanced obj unref
    55bc7babc094 drm/mediatek: Use NULL instead of 0 for NULL pointer
    da5fd5399933 drm/mediatek: dsi: Reduce the time of dsi from LP11 to sending cmd
    cfd710a7e5a5 gpu: host1x: Don't skip assigning syncpoints to channels
    53f98ffcd89b pinctrl: mediatek: Initialize variable *buf to zero
    d2eb2e712514 pinctrl: mediatek: Initialize variable pullen and pullup to zero
    a46d29437b0a pinctrl: bcm2835: Remove of_node_put() in bcm2835_of_gpio_ranges_fallback()
    49907c887382 drm/msm/mdp5: Add check for kzalloc
    e9743b3052e1 drm/msm/dpu: Add check for pstates
    31f2f8de0ea7 drm/msm/dpu: Add check for cstate
    70bc4db1fb7b drm/msm: use strscpy instead of strncpy
    23770064a339 drm/mipi-dsi: Fix byte order of 16-bit DCS set/get brightness
    10c58ca62a54 drm/bridge: lt9611: pass a pointer to the of node
    ffd4cbd7eabd drm/bridge: lt9611: fix clock calculation
    aa37ec52c1a9 drm/bridge: lt9611: fix programming of video modes
    bffd0078026f drm/bridge: lt9611: fix polarity programming
    3c865a014623 drm/bridge: lt9611: fix HPD reenablement
    88618e800acf drm/bridge: lt9611: fix sleep mode setup
    8dbd54d679e3 drm/msm/dpu: Disallow unallocated resources to be returned
    42fdae9f59b1 ALSA: hda/ca0132: minor fix for allocation size
    b26bd7791f3c drm/msm/adreno: Fix null ptr access in adreno_gpu_cleanup()
    a3bf72eab8c8 ASoC: fsl_sai: initialize is_dsp_mode flag
    d4438cbd9c04 drm/vc4: hdmi: Correct interlaced timings again
    15a6be1011c2 drm/vc4: hvs: Fix colour order for xRGB1555 on HVS5
    bc65127ba4c0 drm/vc4: hvs: Set AXI panic modes
    d562054a3a2e pinctrl: rockchip: Fix refcount leak in rockchip_pinctrl_parse_groups
    3dd6f159385d pinctrl: rockchip: do coding style for mux route struct
    6da121152ada pinctrl: rockchip: add support for rk3568
    8ab860dd8717 pinctrl: stm32: Fix refcount leak in stm32_pctrl_get_irq_domain
    86704e50ffb5 pinctrl: qcom: pinctrl-msm8976: Correct function names for wcss pins
    1bab31a0969c drm/msm/hdmi: Add missing check for alloc_ordered_workqueue
    8eb74bd9c972 gpu: ipu-v3: common: Add of_node_put() for reference returned by of_graph_get_port_by_id()
    fdcacfd11015 drm: tidss: Fix pixel format definition
    2adbcf94ebfc drm/vc4: dpi: Fix format mapping for RGB565
    09c6e21d6a1e drm/vc4: dpi: Add option for inverting pixel clock and output enable
    0b8f390e2251 drm/vkms: Fix null-ptr-deref in vkms_release()
    5b9bcb33cf3f drm/bridge: megachips: Fix error handling in i2c_register_driver()
    181fb5efb649 drm: mxsfb: DRM_MXSFB should depend on ARCH_MXS || ARCH_MXC
    a86bd12bd974 drm/fourcc: Add missing big-endian XRGB1555 and RGB565 formats
    5ae70041a6d7 drm: Fix potential null-ptr-deref due to drmm_mode_config_init()
    8f06907f9f58 sefltests: netdevsim: wait for devlink instance after netns removal
    6038e458798d selftest: fib_tests: Always cleanup before exit
    e1c848d9ddd5 net: bcmgenet: fix MoCA LED control
    4a413d360959 l2tp: Avoid possible recursive deadlock in l2tp_tunnel_register()
    5663df20622d selftests/net: Interpret UDP_GRO cmsg data as an int value
    7cefa692224a irqchip/irq-bcm7120-l2: Set IRQ_LEVEL for level triggered interrupts
    27a601623dde irqchip/irq-brcmstb-l2: Set IRQ_LEVEL for level triggered interrupts
    9f487d888ee5 bpf: Fix global subprog context argument resolution logic
    3e8733949f81 can: esd_usb: Move mislocated storage of SJA1000_ECC_SEG bits in case of a bus error
    e02bc492883a thermal/drivers/hisi: Drop second sensor hi3660
    3856f7559722 wifi: mac80211: make rate u32 in sta_set_rate_info_rx()
    f333346001f9 crypto: crypto4xx - Call dma_unmap_page when done
    b10827bce739 selftests/bpf: Fix out-of-srctree build
    d7c5ecbc4915 wifi: mwifiex: fix loop iterator in mwifiex_update_ampdu_txwinsize()
    3185d6cfc592 wifi: iwl4965: Add missing check for create_singlethread_workqueue()
    2f80b3ff9251 wifi: iwl3945: Add missing check for create_singlethread_workqueue
    5da95a7eb9e3 RISC-V: time: initialize hrtimer based broadcast clock event device
    dabc22a30d83 m68k: /proc/hardware should depend on PROC_FS
    c9c87142260c crypto: rsa-pkcs1pad - Use akcipher_request_complete
    eb209a35d362 rds: rds_rm_zerocopy_callback() correct order for list_add_tail()
    b7aa7fbc1693 libbpf: Fix alen calculation in libbpf_nla_dump_errormsg()
    b8ed41cc04fb Bluetooth: L2CAP: Fix potential user-after-free
    4f4c970a05a2 OPP: fix error checking in opp_migrate_dentry()
    4a9272a864cb tap: tap_open(): correctly initialize socket uid
    9a31af61f397 tun: tun_chr_open(): correctly initialize socket uid
    2416abd6bad2 net: add sock_init_data_uid()
    4a614a68d9f8 s390/vmem: fix empty page tables cleanup under KASAN
    df8d3536b660 irqchip/ti-sci: Fix refcount leak in ti_sci_intr_irq_domain_probe
    cee12e8be8e2 irqchip/irq-mvebu-gicp: Fix refcount leak in mvebu_gicp_probe
    c9aaf4efe1f0 irqchip/alpine-msi: Fix refcount leak in alpine_msix_init_domains
    b00baffcc256 irqchip: Fix refcount leak in platform_irqchip_probe
    9cc2a41c5804 net/mlx5: Enhance debug print in page allocation failure
    94c4eafbbde3 bpftool: profile online CPUs instead of possible
    627e140a5b7d crypto: ccp - Flush the SEV-ES TMR memory before giving it to firmware
    959bd9d42a83 crypto: ccp - Refactor out sev_fw_alloc()
    6952629bed36 leds: led-class: Add missing put_device() to led_put()
    92a07ba4f0af crypto: xts - Handle EBUSY correctly
    119848416480 net: ethernet: ti: add missing of_node_put before return
    80c81aafc998 net: ethernet: ti: am65-cpsw: handle deferred probe with dev_err_probe()
    37f0ca73fe81 net: ethernet: ti: am65-cpsw: fix tx csum offload for multi mac mode
    8e83e1619fac x86/microcode: Adjust late loading result reporting message
    511e27e5fdd6 x86/microcode: Check CPU capabilities after late microcode update correctly
    89e848bb4aa1 x86/microcode: Add a parameter to microcode_check() to store CPU capabilities
    f5e78fa916aa x86/microcode: Print previous version of microcode after reload
    e6230806681f x86/microcode: Default-disable late loading
    9e56938f2072 x86/microcode: Rip out the OLD_INTERFACE
    8078a170baab x86: Mark stop_this_cpu() __noreturn
    3900b7de1df7 x86/microcode: Replace deprecated CPU-hotplug functions.
    2e3bd75f64d2 x86/cpu: Init AP exception handling from cpu_init_secondary()
    0e7a569929ac powercap: fix possible name leak in powercap_register_zone()
    ae849d2f4801 crypto: seqiv - Handle EBUSY correctly
    796e02cca30a crypto: essiv - Handle EBUSY correctly
    62d428c9fe1b crypto: ccp - Failure on re-initialization due to duplicate sysfs filename
    6fb7dead798c ACPI: battery: Fix missing NUL-termination with large strings
    45a1ca6f3ae7 wifi: cfg80211: Fix extended KCK key length check in nl80211_set_rekey_data()
    137963e3b957 wifi: ath11k: Fix memory leak in ath11k_peer_rx_frag_setup
    78b56b0a613a wifi: ath9k: Fix potential stack-out-of-bounds write in ath9k_wmi_rsp_callback()
    f26dd69f61ef wifi: ath9k: hif_usb: clean up skbs if ath9k_hif_usb_rx_stream() fails
    5668e63e2673 ath9k: htc: clean up statistics macros
    221f9bd5ec56 ath9k: hif_usb: simplify if-if to if-else
    ec246dfe006b wifi: ath9k: htc_hst: free skb in ath9k_htc_rx_msg() if there is no callback function
    b44178e71810 wifi: orinoco: check return value of hermes_write_wordrec()
    430f9f9bec53 wifi: rtl8xxxu: Fix memory leaks with RTL8723BU, RTL8192EU
    695f1d9431ff thermal/drivers/tsens: Sort out msm8976 vs msm8956 data
    40f62ff0d7ed thermal/drivers/tsens: Add compat string for the qcom,msm8960
    a9f2002484ec thermal/drivers/qcom/tsens_v1: Enable sensor 3 on MSM8976
    e6ec7fa688d9 thermal/drivers/tsens: Drop msm8976-specific defines
    5419cd28c8f2 ACPICA: nsrepair: handle cases without a return value correctly
    4c33e01fe1d2 crypto: ccp - Avoid page allocation failure warning for SEV_GET_ID2
    4c5300f6f5e1 crypto: ccp - Use kzalloc for sev ioctl interfaces to prevent kernel memory leak
    daaec051cd19 crypto: ccp: Use the stack and common buffer for status commands
    c997b509fd01 crypto: ccp: Use the stack for small SEV command buffers
    318dd6f5b7b4 lib/mpi: Fix buffer overrun when SG is too long
    1c37e86a78c2 rcu-tasks: Fix synchronize_rcu_tasks() VS zap_pid_ns_processes()
    ad410f64f7ab rcu-tasks: Remove preemption disablement around srcu_read_[un]lock() calls
    b02b6bb83c68 rcu-tasks: Improve comments explaining tasks_rcu_exit_srcu purpose
    a4935bb73444 genirq: Fix the return type of kstat_cpu_irqs_sum()
    5562585c4aa2 ACPICA: Drop port I/O validation for some regions
    6e43b2d9d166 crypto: x86/ghash - fix unaligned access in ghash_setkey()
    f6e429cde9ea wifi: wl3501_cs: don't call kfree_skb() under spin_lock_irqsave()
    93b8809be5ba wifi: libertas: cmdresp: don't call kfree_skb() under spin_lock_irqsave()
    2ddb1820bdac wifi: libertas: main: don't call kfree_skb() under spin_lock_irqsave()
    647230e71e1c wifi: libertas: if_usb: don't call kfree_skb() under spin_lock_irqsave()
    0258757caab5 wifi: libertas_tf: don't call kfree_skb() under spin_lock_irqsave()
    b4b4447481db wifi: brcmfmac: unmap dma buffer in brcmf_msgbuf_alloc_pktid()
    e08e6812efb6 wifi: brcmfmac: fix potential memory leak in brcmf_netdev_start_xmit()
    a1e94fb4d09d wifi: wilc1000: fix potential memory leak in wilc_mac_xmit()
    8a2eb9d9d0c1 wifi: ipw2200: fix memory leak in ipw_wdev_init()
    841ae9b924f4 wifi: ipw2x00: don't call dev_kfree_skb() under spin_lock_irqsave()
    3938f01405d6 libbpf: Fix btf__align_of() by taking into account field offsets
    1e950b9a841b wifi: rtlwifi: Fix global-out-of-bounds bug in _rtl8812ae_phy_set_txpower_limit()
    d4fddfd7282f rtlwifi: fix -Wpointer-sign warning
    75f4eed70a51 wifi: rtl8xxxu: don't call dev_kfree_skb() under spin_lock_irqsave()
    9c8f50c7433b wifi: libertas: fix memory leak in lbs_init_adapter()
    e9ef5631dd43 wifi: iwlegacy: common: don't call dev_kfree_skb() under spin_lock_irqsave()
    0e5b782c1c72 wifi: rtlwifi: rtl8723be: don't call kfree_skb() under spin_lock_irqsave()
    97018e737bd0 wifi: rtlwifi: rtl8188ee: don't call kfree_skb() under spin_lock_irqsave()
    d85d0b1a6135 wifi: rtlwifi: rtl8821ae: don't call kfree_skb() under spin_lock_irqsave()
    efc8df970561 wifi: rsi: Fix memory leak in rsi_coex_attach()
    0a82c1e0573b block: bio-integrity: Copy flags when bio_integrity_payload is cloned
    895cb50196ab x86/perf/zhaoxin: Add stepping check for ZXC
    80a1751730b3 sched/rt: pick_next_rt_entity(): check list_entry
    53dbbe36340d sched/deadline,rt: Remove unused parameter from pick_next_[rt|dl]_entity()
    a50e28d433ac s390/dasd: Fix potential memleak in dasd_eckd_init()
    72aebdac390b s390/dasd: Prepare for additional path event handling
    a33c33593b66 blk-mq: correct stale comment of .get_budget
    2c58012d9656 blk-mq: remove stale comment for blk_mq_sched_mark_restart_hctx
    12bcc4ec5496 blk-mq: avoid sleep in blk_mq_alloc_request_hctx
    d7cf3864d781 arm64: dts: mediatek: mt7622: Add missing pwm-cells to pwm node
    e874629c5fb7 ARM: dts: imx7s: correct iomuxc gpr mux controller cells
    bbddc7c70870 ARM: dts: sun8i: nanopi-duo2: Fix regulator GPIO reference
    a451c1377aa8 arm64: dts: renesas: beacon-renesom: Fix gpio expander reference
    4c37a37743a6 arm64: dts: amlogic: meson-gxbb-kii-pro: fix led node name
    c39c3ed4a3b9 arm64: dts: amlogic: meson-gxl-s905d-phicomm-n1: fix led node name
    269fd2fb043e arm64: dts: amlogic: meson-gx-libretech-pc: fix update button name
    373bb505ffe6 arm64: dts: amlogic: meson-gxl: add missing unit address to eth-phy-mux node name
    1c30db46dd1d arm64: dts: amlogic: meson-gx: add missing unit address to rng node name
    436060c1b668 arm64: dts: amlogic: meson-gxl-s905d-sml5442tw: drop invalid clock-names property
    6a46320f2ae7 arm64: dts: amlogic: meson-gx: add missing SCPI sensors compatible
    eb5f2c565779 arm64: dts: amlogic: meson-axg: fix SCPI clock dvfs node name
    a7163b258ae8 arm64: dts: amlogic: meson-gx: fix SCPI clock dvfs node name
    14736f2eaec5 ARM: imx: Call ida_simple_remove() for ida_simple_get
    23134f7a5429 ARM: dts: exynos: correct wr-active property in Exynos3250 Rinato
    5325b8a1208c arm64: dts: ti: k3-j7200: Fix wakeup pinmux range
    4811cfd28622 ARM: s3c: fix s3c64xx_set_timer_source prototype
    66315db914aa ARM: OMAP1: call platform_device_put() in error case in omap1_dm_timer_init()
    1fa673af0af8 arm64: dts: meson: remove CPU opps below 1GHz for G12A boards
    c56595b948ad arm64: dts: qcom: ipq8074: correct PCIe QMP PHY output clock names
    192cb335d89b arm64: dts: qcom: ipq8074: fix Gen3 PCIe node
    e839d027d71a arm64: dts: qcom: ipq8074: correct Gen2 PCIe ranges
    77970cf38954 arm64: dts: qcom: ipq8074: fix Gen3 PCIe QMP PHY
    9b5b1652e330 arm64: dts: qcom: ipq8074: fix PCIe PHY serdes size
    8f1cb871f948 arm64: dts: qcom: Fix IPQ8074 PCIe PHY nodes
    7ee2ca51e357 arm64: dts: qcom: ipq8074: correct USB3 QMP PHY-s clock output names
    5633e86cce6a arm64: dts: meson-gx: Fix the SCPI DVFS node name and unit address
    bd55aa16bf34 arm64: dts: meson-g12a: Fix internal Ethernet PHY unit name
    8303a34fce2a arm64: dts: meson-gx: Fix Ethernet MAC address unit name
    2df155a11447 arm64: dts: qcom: sc7180: correct SPMI bus address cells
    64b69cb420c5 arm64: dts: qcom: sdm845-db845c: fix audio codec interrupt pin name
    717aa3984652 arm64: dts: mediatek: mt8183: Fix systimer 13 MHz clock description
    227f8c1c5c4b ARM: zynq: Fix refcount leak in zynq_early_slcr_init
    644688a92162 arm64: dts: qcom: qcs404: use symbol names for PCIe resets
    4862c41d5f3b ARM: OMAP2+: Fix memory leak in realtime_counter_init()
    e1bb97947cac powerpc/mm: Rearrange if-else block to avoid clang warning
    21a2eec4a440 HID: asus: use spinlock to safely schedule workers
    6a63a3334aca HID: asus: use spinlock to protect concurrent accesses
    cb8382c37145 HID: asus: Remove check for same LED brightness on set

Signed-off-by: Bruce Ashfield <bruce.ashfield@gmail.com>
---
 .../linux/linux-yocto-rt_5.10.bb              |  6 ++---
 .../linux/linux-yocto-tiny_5.10.bb            |  8 +++----
 meta/recipes-kernel/linux/linux-yocto_5.10.bb | 24 +++++++++----------
 3 files changed, 19 insertions(+), 19 deletions(-)

diff --git a/meta/recipes-kernel/linux/linux-yocto-rt_5.10.bb b/meta/recipes-kernel/linux/linux-yocto-rt_5.10.bb
index 90ebacb79f..f25745194a 100644
--- a/meta/recipes-kernel/linux/linux-yocto-rt_5.10.bb
+++ b/meta/recipes-kernel/linux/linux-yocto-rt_5.10.bb
@@ -11,13 +11,13 @@ python () {
         raise bb.parse.SkipRecipe("Set PREFERRED_PROVIDER_virtual/kernel to linux-yocto-rt to enable it")
 }
 
-SRCREV_machine ?= "906ed2510448296f6ae7fd7eec4a16323a122d56"
-SRCREV_meta ?= "e0258879d18c06e18d245ea2fbe5363abe204f1d"
+SRCREV_machine ?= "6462fa707bd003b62bee6042c20e8ab1f391df96"
+SRCREV_meta ?= "8ea689ac1980b5c09cd049a3403f72e75a8739da"
 
 SRC_URI = "git://git.yoctoproject.org/linux-yocto.git;branch=${KBRANCH};name=machine \
            git://git.yoctoproject.org/yocto-kernel-cache;type=kmeta;name=meta;branch=yocto-5.10;destsuffix=${KMETA}"
 
-LINUX_VERSION ?= "5.10.172"
+LINUX_VERSION ?= "5.10.175"
 
 LIC_FILES_CHKSUM = "file://COPYING;md5=6bc538ed5bd9a7fc9398086aedcd7e46"
 
diff --git a/meta/recipes-kernel/linux/linux-yocto-tiny_5.10.bb b/meta/recipes-kernel/linux/linux-yocto-tiny_5.10.bb
index 90918e9075..798fb84565 100644
--- a/meta/recipes-kernel/linux/linux-yocto-tiny_5.10.bb
+++ b/meta/recipes-kernel/linux/linux-yocto-tiny_5.10.bb
@@ -6,7 +6,7 @@ KCONFIG_MODE = "--allnoconfig"
 
 require recipes-kernel/linux/linux-yocto.inc
 
-LINUX_VERSION ?= "5.10.172"
+LINUX_VERSION ?= "5.10.175"
 LIC_FILES_CHKSUM = "file://COPYING;md5=6bc538ed5bd9a7fc9398086aedcd7e46"
 
 DEPENDS += "${@bb.utils.contains('ARCH', 'x86', 'elfutils-native', '', d)}"
@@ -15,9 +15,9 @@ DEPENDS += "openssl-native util-linux-native"
 KMETA = "kernel-meta"
 KCONF_BSP_AUDIT_LEVEL = "2"
 
-SRCREV_machine:qemuarm ?= "06797bb6770cf02dac8549965cadcfaf9662648b"
-SRCREV_machine ?= "81be5bada3aaefe33470fe564cf775a7101d2753"
-SRCREV_meta ?= "e0258879d18c06e18d245ea2fbe5363abe204f1d"
+SRCREV_machine:qemuarm ?= "d90caed79c490df9aab86920b33698bc29899d45"
+SRCREV_machine ?= "878a6b6459feacfa733cf27a14b9f70b9922ba65"
+SRCREV_meta ?= "8ea689ac1980b5c09cd049a3403f72e75a8739da"
 
 PV = "${LINUX_VERSION}+git${SRCPV}"
 
diff --git a/meta/recipes-kernel/linux/linux-yocto_5.10.bb b/meta/recipes-kernel/linux/linux-yocto_5.10.bb
index 6b95cd6c15..92666e4865 100644
--- a/meta/recipes-kernel/linux/linux-yocto_5.10.bb
+++ b/meta/recipes-kernel/linux/linux-yocto_5.10.bb
@@ -13,23 +13,23 @@ KBRANCH:qemux86  ?= "v5.10/standard/base"
 KBRANCH:qemux86-64 ?= "v5.10/standard/base"
 KBRANCH:qemumips64 ?= "v5.10/standard/mti-malta64"
 
-SRCREV_machine:qemuarm ?= "c98a46648630fcd991c14d5681a8ffac871a375d"
-SRCREV_machine:qemuarm64 ?= "5af3730831ade6e681e9c5171b201af7044b6f14"
-SRCREV_machine:qemumips ?= "ee066941c9388615026bd61bcfdb87cc090a708b"
-SRCREV_machine:qemuppc ?= "79adfb34b779d73f9b270968de317bbed5ed99ac"
-SRCREV_machine:qemuriscv64 ?= "64bb62787e5dbc958d29ed9b001312f1f49b61f9"
-SRCREV_machine:qemuriscv32 ?= "64bb62787e5dbc958d29ed9b001312f1f49b61f9"
-SRCREV_machine:qemux86 ?= "64bb62787e5dbc958d29ed9b001312f1f49b61f9"
-SRCREV_machine:qemux86-64 ?= "64bb62787e5dbc958d29ed9b001312f1f49b61f9"
-SRCREV_machine:qemumips64 ?= "2c5facc36b895eba9cc75357e924e9e3b313cf68"
-SRCREV_machine ?= "64bb62787e5dbc958d29ed9b001312f1f49b61f9"
-SRCREV_meta ?= "e0258879d18c06e18d245ea2fbe5363abe204f1d"
+SRCREV_machine:qemuarm ?= "1784e127b2ebee50ade30dc697d9f2c9ccda64d6"
+SRCREV_machine:qemuarm64 ?= "3189034276f25e203dae9df3df5fd33849a63ddb"
+SRCREV_machine:qemumips ?= "ed305aee0a2d924dd532eea364036736a43b008e"
+SRCREV_machine:qemuppc ?= "43e2751f24c4c35341b877429f5c62f57cc23616"
+SRCREV_machine:qemuriscv64 ?= "96f3a7ef51f544080250e995b21e66004fdbb2bb"
+SRCREV_machine:qemuriscv32 ?= "96f3a7ef51f544080250e995b21e66004fdbb2bb"
+SRCREV_machine:qemux86 ?= "96f3a7ef51f544080250e995b21e66004fdbb2bb"
+SRCREV_machine:qemux86-64 ?= "96f3a7ef51f544080250e995b21e66004fdbb2bb"
+SRCREV_machine:qemumips64 ?= "82870b2da104e88b79174aece820f233e0c4bd72"
+SRCREV_machine ?= "96f3a7ef51f544080250e995b21e66004fdbb2bb"
+SRCREV_meta ?= "8ea689ac1980b5c09cd049a3403f72e75a8739da"
 
 SRC_URI = "git://git.yoctoproject.org/linux-yocto.git;name=machine;branch=${KBRANCH}; \
            git://git.yoctoproject.org/yocto-kernel-cache;type=kmeta;name=meta;branch=yocto-5.10;destsuffix=${KMETA}"
 
 LIC_FILES_CHKSUM = "file://COPYING;md5=6bc538ed5bd9a7fc9398086aedcd7e46"
-LINUX_VERSION ?= "5.10.172"
+LINUX_VERSION ?= "5.10.175"
 
 DEPENDS += "${@bb.utils.contains('ARCH', 'x86', 'elfutils-native', '', d)}"
 DEPENDS += "openssl-native util-linux-native"
-- 
2.34.1


