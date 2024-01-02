Return-Path: <bruce.ashfield@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 8C852C47073
	for <webhook@archiver.kernel.org>; Tue,  2 Jan 2024 04:31:24 +0000 (UTC)
Received: from mail-qk1-f170.google.com (mail-qk1-f170.google.com [209.85.222.170])
 by mx.groups.io with SMTP id smtpd.web10.22855.1704169878898523056
 for <openembedded-core@lists.openembedded.org>;
 Mon, 01 Jan 2024 20:31:19 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20230601 header.b=jkT0/bD/;
 spf=pass (domain: gmail.com, ip: 209.85.222.170, mailfrom: bruce.ashfield@gmail.com)
Received: by mail-qk1-f170.google.com with SMTP id af79cd13be357-781706de787so380061285a.0
        for <openembedded-core@lists.openembedded.org>; Mon, 01 Jan 2024 20:31:18 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1704169878; x=1704774678; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=+D0TDGu6DoNZDe4xNzOjA3WOlyEWKCegKTzeeljpFFI=;
        b=jkT0/bD/NSTfwf943Ox/coa+9EyHEGlyYUVkVYAlsRjn+HYlYAhL4YDFEApG/MS8Z7
         hSORsUwzXvQ4erOwcQmR3GT8v9B6/SEr1+GkkrW+D7w5vKdaIrYwcLwQXoMMctDpSFIS
         GhRZmHfUmo5BJmgHDF1zIvGQvg05DTMfwrG5IMe1vOjuSVe2bsUMk3Hb3/5RzMK02/kI
         He4a1Ti59cyOuyWscJewL/0GeE2b9I4sEHK/LXEuN6YX0raGJz11gM/BB3BRL62tgF0j
         +U/3ERDkb1vFkpAsj2MS0UZu/+YFNYaLZ+R8Uy7le/tQJKEXXIiBmaONVB8SyY3KxXiQ
         42wA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1704169878; x=1704774678;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=+D0TDGu6DoNZDe4xNzOjA3WOlyEWKCegKTzeeljpFFI=;
        b=U6qPywC8P1c2R0dkfxs8GJxC97kpv02VSm4bsAwqhS/tsYB7pitzkTMP4Y29N0D8UA
         r3ChVy/RSEyJJ9iYRy45b1Ux+fRIGJKQoEl6oGG8TCSRueizfQXrEOt6tjhFBqd511jP
         uzi8IcdOGYrYa8cwSbOhyOdk1sYgZbxYypLRHjQf0DSokUSWU9ybNKKXnW99PDRSjgEt
         NlF+Kn0UAVEEOVunVRxARqCmz4MgiuvlM1jEtbjmNZvSiGSs8dGeSgVEH6//EjbVg+xc
         PSkyfzmK2SQmBfA2lft8XON4TcRgZrEtJ7Mc6oInnPQGCG6FG3ARme5Yfa+E8elPNR7S
         c1rQ==
X-Gm-Message-State: AOJu0YzavNSeBxTbl+rot2LybH6FIiTMiPXsJXexKd4LTumLRI2qn+7r
	E4BIVQ3EJGW4yG+1peucwi4FU7rK291usVG0nNU=
X-Google-Smtp-Source: AGHT+IFLT+zl7vN8QDolbJWH677ukTyhy8dw5K0EKmLU2zDp4kCY30jJgs3SiS8/AyxS7OD+TaQx2g==
X-Received: by 2002:a05:620a:21c2:b0:781:5844:a6a1 with SMTP id h2-20020a05620a21c200b007815844a6a1mr12677016qka.38.1704169877679;
        Mon, 01 Jan 2024 20:31:17 -0800 (PST)
Received: from bruce-XPS-8940.. ([174.112.183.231])
        by smtp.gmail.com with ESMTPSA id t1-20020a05620a004100b00781df3924f3sm39045qkt.129.2024.01.01.20.31.16
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 01 Jan 2024 20:31:17 -0800 (PST)
From: bruce.ashfield@gmail.com
To: richard.purdie@linuxfoundation.org
Cc: openembedded-core@lists.openembedded.org
Subject: [PATCH 6/7] linux-yocto/6.6: update to v6.6.8
Date: Mon,  1 Jan 2024 23:31:08 -0500
Message-Id: <29b2182e9f31a0d780e42ef72c173ad600e34470.1704169585.git.bruce.ashfield@gmail.com>
X-Mailer: git-send-email 2.39.2
In-Reply-To: <cover.1704169585.git.bruce.ashfield@gmail.com>
References: <cover.1704169585.git.bruce.ashfield@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Tue, 02 Jan 2024 04:31:24 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/193202

From: Bruce Ashfield <bruce.ashfield@gmail.com>

Updating  to the latest korg -stable release that comprises
the following commits:

    4c9646a796d6 Linux 6.6.8
    885faf3c7e5f RDMA/mlx5: Change the key being sent for MPV device affiliation
    06f61af80254 x86/speculation, objtool: Use absolute relocations for annotations
    3432f9686a37 ring-buffer: Have rb_time_cmpxchg() set the msb counter too
    b3778a2fa4a2 ring-buffer: Do not try to put back write_stamp
    bc17bc964328 ring-buffer: Fix a race in rb_time_cmpxchg() for 32 bit archs
    ae76d9bdf100 ring-buffer: Fix writing to the buffer with max_data_size
    307ed139d7af ring-buffer: Have saved event hold the entire event
    5e584836779b ring-buffer: Do not update before stamp when switching sub-buffers
    5062b8c5ae2f tracing: Update snapshot buffer on resize if it is allocated
    b02bf0d952ad ring-buffer: Fix memory leak of free page
    e72ed491bc6e smb: client: fix OOB in smb2_query_reparse_point()
    ef748d4a62a7 smb: client: fix NULL deref in asn1_ber_decoder()
    17a0f64cc02d smb: client: fix potential OOBs in smb2_parse_contexts()
    534733397da2 smb: client: fix OOB in receive_encrypted_standard()
    4029b025beda drm/i915: Fix remapped stride with CCS on ADL+
    a9d951b00790 drm/i915: Fix intel_atomic_setup_scalers() plane_state handling
    b6295a167fa5 drm/i915: Fix ADL+ tiled plane stride when the POT stride is smaller than the original
    a8f922ad2f76 drm/amd/display: Disable PSR-SU on Parade 0803 TCON again
    c7f6e836e675 drm/amd/display: Restore guard against default backlight value < 1 nit
    a511e851d49e drm/edid: also call add modes in EDID connector update fallback
    d50670681d8a drm/amdgpu: fix tear down order in amdgpu_vm_pt_free
    d3cf024353e2 btrfs: don't clear qgroup reserved bit in release_folio
    1823491513e3 btrfs: fix qgroup_free_reserved_data int overflow
    14570dfa170e btrfs: free qgroup reserve when ORDERED_IOERR is set
    37b561d55936 kexec: drop dependency on ARCH_SUPPORTS_KEXEC from CRASH_DUMP
    7a4ae7acd208 mm/shmem: fix race in shmem_undo_range w/THP
    a107d6a132cb mm/mglru: reclaim offlined memcgs harder
    6b131c2a2875 mm/mglru: respect min_ttl_ms with memcgs
    c5f67b7e8474 mm/mglru: try to stop at high watermarks
    b2ce691b452f mm/mglru: fix underprotected page cache
    ed50e07d6a8e dmaengine: fsl-edma: fix DMA channel leak in eDMAv4
    9127515bf9cd dmaengine: stm32-dma: avoid bitfield overflow assertion
    03e63e497a40 drm/mediatek: Fix access violation in mtk_drm_crtc_dma_dev_get
    3aae4ef4d799 drm/amdgpu/sdma5.2: add begin/end_use ring callbacks
    28b36426b83e team: Fix use-after-free when an option instance allocation fails
    2c8a21a124ca arm64: mm: Always make sw-dirty PTEs hw-dirty in pte_modify
    d228e98dfacb Revert "selftests: error out if kernel header files are not yet built"
    4f18d187fb2a ext4: prevent the normalized size from exceeding EXT_MAX_BLOCKS
    40abc387459a soundwire: stream: fix NULL pointer dereference for multi_link
    c1d2d084751d cxl/hdm: Fix dpa translation locking
    654461744af8 btrfs: do not allow non subvolume root targets for snapshot
    545d55a3e0c8 perf: Fix perf_event_validate_size() lockdep splat
    5ce0fb87311d HID: hid-asus: add const to read-only outgoing usb buffer
    610610da58af arm64: add dependency between vmlinuz.efi and Image
    df32e887d32b smb: client: set correct file type from NFS reparse points
    4d07e5df1387 smb: client: introduce ->parse_reparse_point()
    d5c959a1dba6 smb: client: implement ->query_reparse_point() for SMB1
    e25ee0c2459a net: usb: qmi_wwan: claim interface 4 for ZTE MF290
    6abb8c223ce1 eventfs: Do not allow NULL parent to eventfs_start_creating()
    a739ceb74745 asm-generic: qspinlock: fix queued_spin_value_unlocked() implementation
    97774998f8e1 scripts/checkstack.pl: match all stack sizes for s390
    1f75542ce7c4 nfc: virtual_ncidev: Add variable to check if ndev is running
    c9d25e4639c1 HID: multitouch: Add quirk for HONOR GLO-GXXX touchpad
    9fc2827c0242 HID: hid-asus: reset the backlight brightness level on resume
    b3ebe19c197b nbd: pass nbd_sock to nbd_read_reply() instead of index
    af48c4099bd8 HID: add ALWAYS_POLL quirk for Apple kb
    c38f7b0f554f HID: glorious: fix Glorious Model I HID report
    6b3507b8ea55 HID: apple: add Jamesdonkey and A3R to non-apple keyboards list
    d4b50ac06ea6 HID: mcp2221: Allow IO to start during probe
    2afe67cfe8f1 HID: mcp2221: Set driver data before I2C adapter add
    086f91f3ce3b platform/x86: intel_telemetry: Fix kernel doc descriptions
    f61771aec676 LoongArch: Implement constant timer shutdown interface
    c28fec461df3 LoongArch: Mark {dmw,tlb}_virt_to_page() exports as non-GPL
    71d8348cca92 LoongArch: Silence the boot warning about 'nokaslr'
    ab3f30052469 LoongArch: Record pc instead of offset in la_abs relocation
    03372601f5f1 LoongArch: Add dependency between vmlinuz.efi and vmlinux.efi
    0ade0b82faf7 selftests/bpf: fix bpf_loop_bench for new callback verification scheme
    9514925a9abc nvme: catch errors from nvme_configure_metadata()
    89fc9028e86e nvme-auth: set explanation code for failure2 msgs
    c34fa2d16e98 nbd: fix null-ptr-dereference while accessing 'nbd->config'
    8c1517344116 nbd: factor out a helper to get nbd_config without holding 'config_lock'
    4087936a97b8 nbd: fold nbd config initialization into nbd_alloc_config()
    4a4bba9f0470 bcache: avoid NULL checking to c->root in run_cache_set()
    286918928ed7 bcache: add code comments for bch_btree_node_get() and __bch_btree_node_alloc()
    665341724499 bcache: remove redundant assignment to variable cur_idx
    09bdafb89a56 bcache: avoid oversize memory allocation by small stripe_size
    0730b1e32a0b blk-cgroup: bypass blkcg_deactivate_policy after destroying
    5aba47ce61b7 blk-throttle: fix lockdep warning of "cgroup_mutex or RCU read lock required!"
    462f1111d945 rxrpc: Fix some minor issues with bundle tracing
    c40c0b89bf1d stmmac: dwmac-loongson: Add architecture dependency
    2ebf775f0541 usb: aqc111: check packet for fixup for true limit
    54d8c1d3261d x86/hyperv: Fix the detection of E820_TYPE_PRAM in a Gen2 VM
    ca3ebcf2c448 selftests/mm: cow: print ksft header before printing anything else
    cd378c371ba0 drm/i915: Use internal class when counting engine resets
    54d08313a34f drm/i915/selftests: Fix engine reset count storage for multi-tile
    83a42d791ba2 accel/ivpu/37xx: Fix interrupt_clear_with_0 WA initialization
    0afcc6291024 accel/ivpu: Print information about used workarounds
    7d6e9cb7b951 drm/mediatek: Add spinlock for setting vblank event in atomic_begin
    8964524158ac drm/mediatek: fix kernel oops if no crtc is found
    98bd0b4ad5d4 PCI: vmd: Fix potential deadlock when enabling ASPM
    f94c44342f0a ksmbd: fix wrong name of SMB2_CREATE_ALLOCATION_SIZE
    1e1f461ea574 PCI/ASPM: Add pci_enable_link_state_locked()
    4fb5358c574e PCI: loongson: Limit MRRS to 256
    5cc8d88a1b94 Revert "PCI: acpiphp: Reassign resources on bridge if necessary"
    56e22123449c ALSA: hda/tas2781: reset the amp before component_add
    d94fad04a64b ALSA: hda/tas2781: call cleanup functions only once
    795e91c599c2 ALSA: hda/tas2781: handle missing EFI calibration data
    7fc8bfdb7007 ALSA: hda/tas2781: leave hda_component in usable state
    ffd1fe12d4c9 ALSA: hda/realtek: Apply mute LED quirk for HP15-db
    7ec57c10b018 ALSA: hda/hdmi: add force-connect quirks for ASUSTeK Z170 variants
    c52ebaf74273 ALSA: hda/hdmi: add force-connect quirk for NUC5CPYB
    9566ef570cc4 io_uring/cmd: fix breakage in SOCKET_URING_OP_SIOC* implementation
    ce5a6df21a00 fuse: dax: set fc->dax to NULL in fuse_dax_conn_free()
    fbcddc741062 fuse: disable FOPEN_PARALLEL_DIRECT_WRITES with FUSE_DIRECT_IO_ALLOW_MMAP
    2939dd306b1f fuse: share lookup state between submount and its parent
    9f36c1c5132f fuse: Rename DIRECT_IO_RELAX to DIRECT_IO_ALLOW_MMAP
    6e5782b1e18b HID: Add quirk for Labtec/ODDOR/aikeec handbrake
    fea8562f51b0 HID: i2c-hid: Add IDEA5002 to i2c_hid_acpi_blacklist[]
    207f135d8193 cred: get rid of CONFIG_DEBUG_CREDENTIALS
    f6a7ce5ae416 cred: switch to using atomic_long_t
    3b5daf20c426 net: atlantic: fix double free in ring reinit logic
    e15ded324a39 appletalk: Fix Use-After-Free in atalk_ioctl
    58c556661641 net: stmmac: Handle disabled MDIO busses from devicetree
    ad531dfcc648 net: stmmac: dwmac-qcom-ethqos: Fix drops in 10M SGMII RX
    da8732cb38ea dpaa2-switch: do not ask for MDB, VLAN and FDB replay
    77e566c88130 dpaa2-switch: fix size of the dma_unmap
    fa634779ffcc vsock/virtio: Fix unsigned integer wrap around in virtio_transport_has_space()
    f18ac4bae15e sign-file: Fix incorrect return values check
    e0069c26c552 stmmac: dwmac-loongson: Make sure MDIO is initialized before use
    2cc8ffc3ad31 net: ena: Fix XDP redirection error
    0116e02cee5a net: ena: Fix DMA syncing in XDP path when SWIOTLB is on
    0cb2021b968e net: ena: Fix xdp drops handling due to multibuf packets
    c22877fafd6b net: ena: Destroy correct number of xdp queues upon failure
    d6bef0049870 net: Remove acked SYN flag from packet in the transmit queue correctly
    7106a15b96d7 qed: Fix a potential use-after-free in qed_cxt_tables_alloc
    54f59a242bcf iavf: Fix iavf_shutdown to call iavf_remove instead iavf_close
    e768a04908de iavf: Handle ntuple on/off based on new state machines for flow director
    3beb9d66e442 iavf: Introduce new state machines for flow director
    63caa51833e8 net/rose: Fix Use-After-Free in rose_ioctl
    531fd46f9289 atm: Fix Use-After-Free in do_vcc_ioctl
    f115b31d7e96 octeontx2-af: Fix pause frame configuration
    6b5de31e372c octeontx2-af: Update RSS algorithm index
    5295d2ad9103 octeontx2-pf: Fix promisc mcam entry action
    6047060105e4 octeon_ep: explicitly test for firmware ready value
    15f300ed1d5e net/sched: act_ct: Take per-cb reference to tcf_ct_flow_table
    dd75adfdc286 octeontx2-af: fix a use-after-free in rvu_nix_register_reporters
    4317fba45ff3 net: fec: correct queue selection
    82102501e08e atm: solos-pci: Fix potential deadlock on &tx_queue_lock
    4faf39c4252a atm: solos-pci: Fix potential deadlock on &cli_queue_lock
    9542105eb4ff bnxt_en: Fix HWTSTAMP_FILTER_ALL packet timestamp logic
    909f5a48bf23 bnxt_en: Fix wrong return value check in bnxt_close_nic()
    d8ea6b0d549b bnxt_en: Fix skb recycling logic in bnxt_deliver_skb()
    bf9ceb163362 bnxt_en: Clear resource reservation during resume
    f7dac967e170 qca_spi: Fix reset behavior
    02296b1d8449 qca_debug: Fix ethtool -G iface tx behavior
    21b9dc814d3f qca_debug: Prevent crash on TX ring changes
    92d813f73f64 net: ipv6: support reporting otherwise unknown prefix flags in RTM_NEWPREFIX
    6cb39c79bca9 net/mlx5: Fix a NULL vs IS_ERR() check
    ef3b2d5f2152 net/mlx5e: Check netdev pointer before checking its net ns
    a4839771d7b9 net/mlx5: Nack sync reset request when HotPlug is enabled
    b766f8b8d4d1 net/mlx5e: TC, Don't offload post action rule if not supported
    8ce3d969348a net/mlx5e: Fix possible deadlock on mlx5e_tx_timeout_work
    7e46db5e2a31 net/mlx5e: Disable IPsec offload support if not FW steering
    fdd350fe5e1a RDMA/mlx5: Send events from IB driver about device affiliation state
    4a95f412b7ee net/mlx5e: Check the number of elements before walk TC rhashtable
    594a306461de net/mlx5e: Reduce eswitch mode_lock protection context
    1a0d0e97a750 net/mlx5e: Tidy up IPsec NAT-T SA discovery
    20af7afcd8b8 net/mlx5e: Unify esw and normal IPsec status table creation/destruction
    80299a1c685f net/mlx5e: Ensure that IPsec sequence packet number starts from 1
    17e600e438c6 net/mlx5e: Honor user choice of IPsec replay window size
    b89b7c763570 HID: lenovo: Restrict detection of patched firmware only to USB cptkbd
    8715fe2fc1e8 afs: Fix refcount underflow from error handling race
    800f84d8f0de efi/x86: Avoid physical KASLR on older Dell systems
    809d50d36e71 ksmbd: fix memory leak in smb2_lock()
    73dddf9858ff ext4: fix warning in ext4_dio_write_end_io()
    da94fb0217e5 r8152: add vendor/device ID pair for ASUS USB-C2500
    ac25535242ac Linux 6.6.7
    71a1ffe22d33 drm/amdgpu: Restrict extended wait to PSP v13.0.6
    9f29fe9b6184 drm/amdgpu: update retry times for psp BL wait
    bebe0c07b806 drm/amdgpu: Fix refclk reporting for SMU v13.0.6
    48411bc4c3fb riscv: Kconfig: Add select ARM_AMBA to SOC_STARFIVE
    b79210fa10db gcc-plugins: randstruct: Update code comment in relayout_struct()
    ba6e4b997181 ASoC: qcom: sc8280xp: Limit speaker digital volumes
    c66d39f18e0e netfilter: nft_set_pipapo: skip inactive elements during set walk
    1eed445d5364 MIPS: Loongson64: Enable DMA noncoherent support
    264927e35381 MIPS: Loongson64: Handle more memory types passed from firmware
    ae07e7d338c4 MIPS: Loongson64: Reserve vgabios memory on boot
    114d0e5b9937 perf metrics: Avoid segv if default metricgroup isn't set
    1f4d4d2cd6b5 perf list: Fix JSON segfault by setting the used skip_duplicate_pmus callback
    dea8cfe773b9 KVM: SVM: Update EFER software model on CR0 trap for SEV-ES
    bb356cc6615c KVM: s390/mm: Properly reset no-dat
    6d9cbae4c032 MIPS: kernel: Clear FPU states when setting up kernel threads
    43801359c897 cifs: Fix flushing, invalidation and file size with FICLONE
    63c80f574a8e cifs: Fix flushing, invalidation and file size with copy_file_range()
    9a3e02063016 USB: gadget: core: adjust uevent timing on gadget unbind
    fd728449807e powerpc/ftrace: Fix stack teardown in ftrace_no_trace
    903a1a1949c6 x86/CPU/AMD: Check vendor in the AMD microcode callback
    7d831c68bb92 devcoredump: Send uevent once devcd is ready
    22fdcaaf7d9d serial: 8250_omap: Add earlycon support for the AM654 UART controller
    a2c0b05a8c00 serial: 8250: 8250_omap: Do not start RX DMA on THRI interrupt
    70dc9a482fbb serial: 8250: 8250_omap: Clear UART_HAS_RHR_IT_DIS bit
    98b0ca904c80 serial: sc16is7xx: address RX timeout interrupt errata
    c865b77eb3b5 ARM: PL011: Fix DMA support
    2214c3f4e718 usb: typec: class: fix typec_altmode_put_partner to put plugs
    5ac34ba42e9a smb: client: fix potential NULL deref in parse_dfs_referrals()
    05668be6020c Revert "xhci: Loosen RPM as default policy to cover for AMD xHC 1.1"
    1bcb08e39d84 cifs: Fix non-availability of dedup breaking generic/304
    67f45db9f275 parport: Add support for Brainboxes IX/UC/PX parallel cards
    c88a91ca26b1 serial: ma35d1: Validate console index before assignment
    977a60f0639f serial: 8250_dw: Add ACPI ID for Granite Rapids-D UART
    a05c646d3c7d nvmem: Do not expect fixed layouts to grab a layout driver
    d9828961e5d7 usb: gadget: f_hid: fix report descriptor allocation
    95a4c959b99f kprobes: consistent rcu api usage for kretprobe holder
    395e52b7a1ad ASoC: ops: add correct range check for limiting volume
    6df51c525a2d gpiolib: sysfs: Fix error handling on failed export
    73bbca129864 x86/sev: Fix kernel crash due to late update to read-only ghcb_version
    cfe9295db093 perf: Fix perf_event_validate_size()
    c66c479480f6 drm/amdgpu: disable MCBP by default
    3798c665fe7d arm64: dts: mt8183: kukui: Fix underscores in node names
    b6c47d915578 arm64: dts: mediatek: add missing space before {
    5bdd0ced1f9c parisc: Fix asm operand number out of range build error in bug table
    164960641e6c parisc: Reduce size of the bug_table on 64-bit kernel by half
    4b117370d1d1 LoongArch: BPF: Don't sign extend function return value
    3275410b13b6 LoongArch: BPF: Don't sign extend memory load operand
    0fdd1b884821 perf vendor events arm64: AmpereOne: Add missing DefaultMetricgroupName fields
    f78fff4648bb misc: mei: client.c: fix problem of return '-EOVERFLOW' in mei_cl_write
    e2365ead012a misc: mei: client.c: return negative error code in mei_cl_write
    c541d0edd827 coresight: ultrasoc-smb: Fix uninitialized before use buf_hw_base
    ab5091e1ccb0 coresight: ultrasoc-smb: Config SMB buffer before register sink
    ace850bd8600 coresight: ultrasoc-smb: Fix sleep while close preempt in enable_smb
    359d3fbcbc09 hwtracing: hisi_ptt: Add dummy callback pmu::read()
    2f6b1527db82 coresight: Fix crash when Perf and sysfs modes are used concurrently
    1b5d156c2428 coresight: etm4x: Remove bogous __exit annotation for some functions
    b9cc170842d8 arm64: dts: mediatek: mt8186: Change gpu speedbin nvmem cell name
    b6eccbcb1bcc arm64: dts: mediatek: mt8186: fix clock names for power domains
    2e465268df4c arm64: dts: mediatek: mt8183-evb: Fix unit_address_vs_reg warning on ntc
    bfff27fb5d2d arm64: dts: mediatek: mt8183: Move thermal-zones to the root node
    d97373c3b159 arm64: dts: mediatek: mt8183: Fix unit address for scp reserved memory
    9c4ae4801f81 arm64: dts: mediatek: mt8195: Fix PM suspend/resume with venc clocks
    12530266947a arm64: dts: mediatek: mt8173-evb: Fix regulator-fixed node names
    ac9a2f55bfcc arm64: dts: mediatek: cherry: Fix interrupt cells for MT6360 on I2C7
    d7646d79ea19 arm64: dts: mediatek: mt8183-kukui-jacuzzi: fix dsi unnecessary cells properties
    6a6df679ac22 arm64: dts: mediatek: mt7622: fix memory node warning check
    90dc20c8c51d arm64: dts: mt7986: fix emmc hs400 mode without uboot initialization
    287b1c41decb arm64: dts: mt7986: define 3W max power to both SFP on BPI-R3
    5012eb028032 arm64: dts: mt7986: change cooling trips
    8e1e489cdb5b drm/i915: Skip some timing checks on BXT/GLK DSI transcoders
    a0396af35ca2 drm/i915/mst: Reject modes that require the bigjoiner
    654748c6fc6a drm/i915/mst: Fix .mode_valid_ctx() return values
    02650b3b98cf drm/atomic-helpers: Invoke end_fb_access while owning plane state
    4ce431c29755 md/raid6: use valid sector values to determine if an I/O should wait on the reshape
    aa581b37dae9 powercap: DTPM: Fix missing cpufreq_cpu_put() calls
    9e5d3096742d mm/memory_hotplug: fix error handling in add_memory_resource()
    799f90c385cd mm: fix oops when filemap_map_pmd() without prealloc_pte
    e0270ffad426 mm/memory_hotplug: add missing mem_hotplug_lock
    83dd18e0b76f drivers/base/cpu: crash data showing should depends on KEXEC_CORE
    512b420aaf78 hugetlb: fix null-ptr-deref in hugetlb_vma_lock_write
    b2c562a7a88b workqueue: Make sure that wq_unbound_cpumask is never empty
    7409c28cab78 platform/surface: aggregator: fix recv_buf() return value
    78c8fc333253 regmap: fix bogus error on regcache_sync success
    2e04cfdd3edb r8169: fix rtl8125b PAUSE frames blasting when suspended
    865b71579d01 packet: Move reference count in packet_sock to atomic_long_t
    9a89aad0865f nfp: flower: fix for take a mutex lock in soft irq context and rcu lock
    3c0adff939a6 leds: trigger: netdev: fix RTNL handling to prevent potential deadlock
    7d97646474b9 tracing: Fix a possible race when disabling buffered events
    fc9fa702dbaa tracing: Fix incomplete locking when disabling buffered events
    0486a1f9d9cc tracing: Disable snapshot buffer when stopping instance tracers
    12c48e88e5c7 tracing: Stop current tracer when resizing buffer
    1741e17c3939 tracing: Always update snapshot buffer size
    f8f32f912603 checkstack: fix printed address
    9ec2d9267304 cgroup_freezer: cgroup_freezing: Check if not frozen
    39f603a26286 lib/group_cpus.c: avoid acquiring cpu hotplug lock in group_cpus_evenly
    0b14276bcb85 nilfs2: prevent WARNING in nilfs_sufile_set_segment_usage()
    ce58f14113a8 nilfs2: fix missing error check for sb_set_blocksize call
    1cdc934c82bb highmem: fix a memory copy problem in memcpy_from_folio
    56a334310fa9 ring-buffer: Force absolute timestamp on discard of event
    d251b9818302 ring-buffer: Test last update in 32bit version of __rb_time_read()
    73249ef76c2d ALSA: hda/realtek: Add quirk for Lenovo Yoga Pro 7
    5f1c1e8de568 ALSA: hda/realtek: Add Framework laptop 16 to quirks
    70a6885542b1 ALSA: hda/realtek: add new Framework laptop to quirks
    65a7a5b2d531 ALSA: hda/realtek: Enable headset on Lenovo M90 Gen5
    b3f1d9230457 ALSA: hda/realtek: fix speakers on XPS 9530 (2023)
    6e25980d046f ALSA: hda/realtek: Apply quirk for ASUS UM3504DA
    8e6ac8c6bae1 ALSA: pcm: fix out-of-bounds in snd_pcm_state_names
    5ae225bbf358 ALSA: usb-audio: Add Pioneer DJM-450 mixer controls
    30df2901c4ac io_uring: fix mutex_unlock with unreferenced ctx
    dd864f6ee04e nvme-pci: Add sleep quirk for Kingston drives
    5a33d385eb36 io_uring/af_unix: disable sending io_uring over sockets
    127fcf79662d ASoC: amd: yc: Fix non-functional mic on ASUS E1504FA
    29b9ebc89106 rethook: Use __rcu pointer for rethook::handler
    af448bb2eaba scripts/gdb: fix lx-device-list-bus and lx-device-list-class
    2d16a9f778f7 kernel/Kconfig.kexec: drop select of KEXEC for CRASH_DUMP
    49b79af00d24 md: don't leave 'MD_RECOVERY_FROZEN' in error path of md_set_readonly()
    7442310ee4f0 riscv: errata: andes: Probe for IOCP only once in boot stage
    b12ccda0d469 riscv: fix misaligned access handling of C.SWSP and C.SDSP
    92f095553ae5 arm64: dts: rockchip: Fix eMMC Data Strobe PD on rk3588
    15eb6859de68 ARM: dts: imx28-xea: Pass the 'model' property
    5af668cd9ee5 ARM: dts: imx7: Declare timers compatible with fsl,imx6dl-gpt
    ee007123af6d arm64: dts: imx8-apalis: set wifi regulator to always-on
    12deaef0c867 ARM: imx: Check return value of devm_kasprintf in imx_mmdc_perf_init
    3836f1f246e2 arm64: dts: imx93: correct mediamix power
    8b2c35e5e678 arm64: dts: freescale: imx8-ss-lsio: Fix #pwm-cells
    d338395bc5af arm64: dts: imx8-ss-lsio: Add PWM interrupts
    ddc5ad21da0a scsi: be2iscsi: Fix a memleak in beiscsi_init_wrb_handle()
    6eec904d95a5 tracing: Fix a warning when allocating buffered events fails
    7e6621b99d20 io_uring/kbuf: check for buffer list readiness after NULL check
    b2173a8b6450 io_uring/kbuf: Fix an NULL vs IS_ERR() bug in io_alloc_pbuf_ring()
    fe145559a91f ARM: dts: imx6ul-pico: Describe the Ethernet PHY clock
    c6a952d44a41 arm64: dts: imx8mp: imx8mq: Add parkmode-disable-ss-quirk on DWC3
    584bdbca913e drm/bridge: tc358768: select CONFIG_VIDEOMODE_HELPERS
    fc054130cdfb RDMA/irdma: Avoid free the non-cqp_request scratch
    926c1c7a8f2e RDMA/irdma: Fix support for 64k pages
    12a77574f090 RDMA/irdma: Ensure iWarp QP queue memory is OS paged aligned
    d103c131ef3b RDMA/core: Fix umem iterator when PAGE_SIZE is greater then HCA pgsz
    b8668fe7a5e8 ASoC: wm_adsp: fix memleak in wm_adsp_buffer_populate
    0ca497a90ef3 firmware: arm_scmi: Fix possible frequency truncation when using level indexing mode
    489358880655 firmware: arm_scmi: Simplify error path in scmi_dvfs_device_opps_add()
    1ea9f8abe364 firmware: arm_scmi: Fix frequency truncation by promoting multiplier type
    c3af26f53616 firmware: arm_scmi: Extend perf protocol ops to get information of a domain
    9c78a21a5a52 firmware: arm_scmi: Extend perf protocol ops to get number of domains
    7cd68b364f83 hwmon: (nzxt-kraken2) Fix error handling path in kraken2_probe()
    8d73500fcf86 ASoC: codecs: lpass-tx-macro: set active_decimator correct default value
    8ebf05908f0e hwmon: (acpi_power_meter) Fix 4.29 MW bug
    2e594ee138c9 ARM: dts: bcm2711-rpi-400: Fix delete-node of led_act
    a7fb9f15fedc ARM: dts: rockchip: Fix sdmmc_pwren's pinmux setting for RK3128
    03766ae3467d ARM: dts: imx6q: skov: fix ethernet clock regression
    231ab2ff6039 arm64: dt: imx93: tqma9352-mba93xxla: Fix LPUART2 pad config
    55b6b95737e3 RDMA/irdma: Fix UAF in irdma_sc_ccq_get_cqe_info()
    cfaede20f5a5 RDMA/bnxt_re: Correct module description string
    ca19116cca9d RDMA/rtrs-clt: Remove the warnings for req in_use check
    4b13d47c9018 RDMA/rtrs-clt: Fix the max_send_wr setting
    5aafdb5e9324 RDMA/rtrs-srv: Destroy path files after making sure no IOs in-flight
    7bb1941e7f71 RDMA/rtrs-srv: Free srv_mr iu only when always_invalidate is true
    dfb398fdcb7f RDMA/rtrs-srv: Check return values while processing info request
    30614ed295bc RDMA/rtrs-clt: Start hb after path_up
    b659d48fc426 RDMA/rtrs-srv: Do not unconditionally enable irq
    e1e4a5cbb0a1 ASoC: fsl_sai: Fix no frame sync clock issue on i.MX8MP
    bdcedad6b951 arm64: dts: rockchip: Expand reg size of vdec node for RK3399
    4192a26f673a arm64: dts: rockchip: Expand reg size of vdec node for RK3328
    9b1b8ab2bd73 RDMA/irdma: Add wait for suspend on SQD
    951c6d336ebe RDMA/irdma: Do not modify to SQD on error
    38772f667233 RDMA/hns: Fix unnecessary err return when using invalid congest control algorithm
    24436fe77efe RDMA/core: Fix uninit-value access in ib_get_eth_speed()
    d3c4786b01aa tee: optee: Fix supplicant based device enumeration
    577209e844bf mm/damon/sysfs: eliminate potential uninitialized variable warning
    45d72eadf21a drm/amdkfd: get doorbell's absolute offset based on the db_size
    ffc642551262 drm/amd/amdgpu/amdgpu_doorbell_mgr: Correct misdocumented param 'doorbell_index'
    f9eef2563234 net/smc: fix missing byte order conversion in CLC handshake
    b03b2ddf0e90 net: dsa: microchip: provide a list of valid protocols for xmit handler
    e036a325a977 drop_monitor: Require 'CAP_SYS_ADMIN' when joining "events" group
    580c80b6f881 psample: Require 'CAP_NET_ADMIN' when joining "packets" group
    94e81d1a4bd9 bpf: sockmap, updating the sg structure should also update curr
    eb30a025982f net: tls, update curr on splice as well
    29561ef098a0 net: dsa: mv88e6xxx: Restore USXGMII support for 6393X
    2087d53a66e9 tcp: do not accept ACK of bytes we never sent
    1417b7198546 netfilter: xt_owner: Fix for unsafe access of sk->sk_socket
    fa72b6e62fa5 netfilter: nf_tables: validate family when identifying table via handle
    5eeba00a89c5 netfilter: nf_tables: bail out on mismatching dynset and set expressions
    0392d322b45b netfilter: nf_tables: fix 'exist' matching on bigendian arches
    83e9863785f4 netfilter: bpf: fix bad registration on nf_defrag
    a365250a4a65 dt-bindings: interrupt-controller: Allow #power-domain-cells
    b710b35ef66e octeontx2-af: Update Tx link register range
    cd1045acc228 octeontx2-af: Add missing mcs flr handler call
    82b2c5e0b4f4 octeontx2-af: Fix mcs stats register address
    b783ee126c01 octeontx2-af: Fix mcs sa cam entries size
    00efd99e36b4 octeontx2-af: Adjust Tx credits when MCS external bypass is disabled
    2daea952199e net: hns: fix fake link up on xge port
    613b5db4c55f net: hns: fix wrong head when modify the tx feature when sending packets
    e30ad4729c57 net: atlantic: Fix NULL dereference of skb pointer in
    08e3e3da6c39 ipv4: ip_gre: Avoid skb_pull() failure in ipgre_xmit()
    77c02d10c407 ionic: Fix dim work handling in split interrupt mode
    4dacbf99cebf ionic: fix snprintf format length warning
    e4a2a4328c85 tcp: fix mid stream window clamp.
    dc903ddc826f net: bnxt: fix a potential use-after-free in bnxt_init_tc
    d88c7cf589de iavf: validate tx_coalesce_usecs even if rx_coalesce_usecs is zero
    ab3a730feab9 i40e: Fix unexpected MFS warning message
    2442e9cbb79c ice: Restore fix disabling RX VLAN filtering
    33755da7ae2b octeontx2-af: fix a use-after-free in rvu_npa_register_reporters
    d7666bfd7884 xsk: Skip polling event check for unbound socket
    e1fbdef91b1c net: stmmac: fix FPE events losing
    9cc9fbe5c028 octeontx2-pf: consider both Rx and Tx packet stats for adaptive interrupt coalescing
    5106d7adb74b arcnet: restoring support for multiple Sohard Arcnet cards
    15e1490022e7 platform/mellanox: Check devm_hwmon_device_register_with_groups() return value
    8b2688f9c589 platform/mellanox: Add null pointer checks for devm_kasprintf()
    76914ea593bb mlxbf-bootctl: correctly identify secure boot with development keys
    9b4a88385435 r8152: Add RTL8152_INACCESSIBLE to r8153_aldps_en()
    4bc63784d642 r8152: Add RTL8152_INACCESSIBLE to r8153_pre_firmware_1()
    9bda33e87114 r8152: Add RTL8152_INACCESSIBLE to r8156b_wait_loading_flash()
    b7416e0a4d48 r8152: Add RTL8152_INACCESSIBLE checks to more loops
    8defe1643dd3 r8152: Hold the rtnl_lock for all of reset
    b47e71da4776 hv_netvsc: rndis_filter needs to select NLS
    28b8ed4a02fa bpf: Fix a verifier bug due to incorrect branch offset comparison with cpu=v4
    c3287140282b octeontx2-af: Check return value of nix_get_nixlf before using nixlf
    6ddf005fd6cc octeontx2-pf: Add missing mutex lock in otx2_get_pauseparam
    a08768110a65 ipv6: fix potential NULL deref in fib6_add()
    6e33e81b785f platform/x86: wmi: Skip blocks with zero instances
    30460e7e27da of: dynamic: Fix of_reconfig_get_state_change() return value documentation
    cb6b8919ebf8 platform/x86: asus-wmi: Move i8042 filter install to shared asus-wmi code
    7cb7001ecd0f dt: dt-extract-compatibles: Don't follow symlinks when walking tree
    c35bcede4ffa dt: dt-extract-compatibles: Handle cfile arguments in generator function
    239bff0171a8 x86/tdx: Allow 32-bit emulation by default
    22ca647c8f88 x86/entry: Do not allow external 0x80 interrupts
    4591766ff655 x86/entry: Convert INT 0x80 emulation to IDTENTRY
    34c686e5be2f x86/coco: Disable 32-bit emulation by default on TDX and SEV
    f259af26ee04 x86: Introduce ia32_enabled()
    dfa1898cef4c dm-crypt: start allocating with MAX_ORDER
    915864d18641 drm/amdgpu: correct chunk_ptr to a pointer to chunk.
    a8f5cd042305 drm/amdgpu: finalizing mem_partitions at the end of GMC v9 sw_fini
    3a56e61b5779 drm/amdgpu: Do not program VF copy regs in mmhub v1.8 under SRIOV (v2)
    b97debd07a8d kconfig: fix memory leak from range properties
    b1205cc72b47 modpost: fix section mismatch message for RELA
    9a07b662e54e tg3: Increment tx_dropped in tg3_tso_bug()
    763a1b3177d9 tg3: Move the [rt]x_dropped counters to tg3_napi
    90ed718d6a8e zstd: Fix array-index-out-of-bounds UBSAN warning
    f5fb5ac7cee2 nouveau: use an rwlock for the event lock.
    23c31036f862 netfilter: ipset: fix race condition between swap/destroy and kernel side add/del/test
    22a59e51ded2 i2c: ocores: Move system PM hooks to the NOIRQ phase
    f5d10651396c i2c: designware: Fix corrupted memory seen in the ISR
    53f408cad05b hrtimers: Push pending hrtimers away from outgoing CPU earlier
    c94c44685d80 scsi: sd: Fix sshdr use in sd_suspend_common()
    dd3438abfb85 vdpa/mlx5: preserve CVQ vringh index

Signed-off-by: Bruce Ashfield <bruce.ashfield@gmail.com>
---
 .../linux/linux-yocto-rt_6.6.bb               |  6 ++--
 .../linux/linux-yocto-tiny_6.6.bb             |  6 ++--
 meta/recipes-kernel/linux/linux-yocto_6.6.bb  | 28 +++++++++----------
 3 files changed, 20 insertions(+), 20 deletions(-)

diff --git a/meta/recipes-kernel/linux/linux-yocto-rt_6.6.bb b/meta/recipes-kernel/linux/linux-yocto-rt_6.6.bb
index a8a8f15d59..13f95be5d0 100644
--- a/meta/recipes-kernel/linux/linux-yocto-rt_6.6.bb
+++ b/meta/recipes-kernel/linux/linux-yocto-rt_6.6.bb
@@ -14,13 +14,13 @@ python () {
         raise bb.parse.SkipRecipe("Set PREFERRED_PROVIDER_virtual/kernel to linux-yocto-rt to enable it")
 }
 
-SRCREV_machine ?= "3364e561d527a5dcca1803dcf5a7e2a7aa3a398e"
-SRCREV_meta ?= "8ab17895c185426442d80a60829619270f9ac51d"
+SRCREV_machine ?= "19bf0c91c0377d50583db84dd27387ee7daccebd"
+SRCREV_meta ?= "cb87ac0a436d23cd349e42273a222f9f267e8e98"
 
 SRC_URI = "git://git.yoctoproject.org/linux-yocto.git;branch=${KBRANCH};name=machine;protocol=https \
            git://git.yoctoproject.org/yocto-kernel-cache;type=kmeta;name=meta;branch=yocto-6.5;destsuffix=${KMETA};protocol=https"
 
-LINUX_VERSION ?= "6.6.6"
+LINUX_VERSION ?= "6.6.8"
 
 LIC_FILES_CHKSUM = "file://COPYING;md5=6bc538ed5bd9a7fc9398086aedcd7e46"
 
diff --git a/meta/recipes-kernel/linux/linux-yocto-tiny_6.6.bb b/meta/recipes-kernel/linux/linux-yocto-tiny_6.6.bb
index 547b5ee922..e6aa3cbf8f 100644
--- a/meta/recipes-kernel/linux/linux-yocto-tiny_6.6.bb
+++ b/meta/recipes-kernel/linux/linux-yocto-tiny_6.6.bb
@@ -8,7 +8,7 @@ require recipes-kernel/linux/linux-yocto.inc
 # CVE exclusions
 include recipes-kernel/linux/cve-exclusion_6.6.inc
 
-LINUX_VERSION ?= "6.6.6"
+LINUX_VERSION ?= "6.6.8"
 LIC_FILES_CHKSUM = "file://COPYING;md5=6bc538ed5bd9a7fc9398086aedcd7e46"
 
 DEPENDS += "${@bb.utils.contains('ARCH', 'x86', 'elfutils-native', '', d)}"
@@ -17,8 +17,8 @@ DEPENDS += "openssl-native util-linux-native"
 KMETA = "kernel-meta"
 KCONF_BSP_AUDIT_LEVEL = "2"
 
-SRCREV_machine ?= "58e5c91d6701f62e0f72b1f10c2e9f14b2eb4480"
-SRCREV_meta ?= "8ab17895c185426442d80a60829619270f9ac51d"
+SRCREV_machine ?= "44274a28ac73e22543a79b0345b546d128db83e2"
+SRCREV_meta ?= "cb87ac0a436d23cd349e42273a222f9f267e8e98"
 
 PV = "${LINUX_VERSION}+git"
 
diff --git a/meta/recipes-kernel/linux/linux-yocto_6.6.bb b/meta/recipes-kernel/linux/linux-yocto_6.6.bb
index 57a394d171..394a51cf52 100644
--- a/meta/recipes-kernel/linux/linux-yocto_6.6.bb
+++ b/meta/recipes-kernel/linux/linux-yocto_6.6.bb
@@ -18,25 +18,25 @@ KBRANCH:qemux86-64 ?= "v6.6/standard/base"
 KBRANCH:qemuloongarch64  ?= "v6.6/standard/base"
 KBRANCH:qemumips64 ?= "v6.6/standard/mti-malta64"
 
-SRCREV_machine:qemuarm ?= "ff8331e10427c145659bf6a5f87b9109011159cf"
-SRCREV_machine:qemuarm64 ?= "58e5c91d6701f62e0f72b1f10c2e9f14b2eb4480"
-SRCREV_machine:qemuloongarch64 ?= "58e5c91d6701f62e0f72b1f10c2e9f14b2eb4480"
-SRCREV_machine:qemumips ?= "afa3730deded0bc56f1470b59f65d86f20dfb256"
-SRCREV_machine:qemuppc ?= "58e5c91d6701f62e0f72b1f10c2e9f14b2eb4480"
-SRCREV_machine:qemuriscv64 ?= "58e5c91d6701f62e0f72b1f10c2e9f14b2eb4480"
-SRCREV_machine:qemuriscv32 ?= "58e5c91d6701f62e0f72b1f10c2e9f14b2eb4480"
-SRCREV_machine:qemux86 ?= "58e5c91d6701f62e0f72b1f10c2e9f14b2eb4480"
-SRCREV_machine:qemux86-64 ?= "58e5c91d6701f62e0f72b1f10c2e9f14b2eb4480"
-SRCREV_machine:qemumips64 ?= "a93ff794461d9ba7ec5b02d482b60d9ca582e97f"
-SRCREV_machine ?= "58e5c91d6701f62e0f72b1f10c2e9f14b2eb4480"
-SRCREV_meta ?= "8ab17895c185426442d80a60829619270f9ac51d"
+SRCREV_machine:qemuarm ?= "a3f284c274eb9b9bf61f20ff73a565770788b73e"
+SRCREV_machine:qemuarm64 ?= "44274a28ac73e22543a79b0345b546d128db83e2"
+SRCREV_machine:qemuloongarch64 ?= "44274a28ac73e22543a79b0345b546d128db83e2"
+SRCREV_machine:qemumips ?= "28adf9e4a1b7daa397fa3f1d544155f29bef994a"
+SRCREV_machine:qemuppc ?= "44274a28ac73e22543a79b0345b546d128db83e2"
+SRCREV_machine:qemuriscv64 ?= "44274a28ac73e22543a79b0345b546d128db83e2"
+SRCREV_machine:qemuriscv32 ?= "44274a28ac73e22543a79b0345b546d128db83e2"
+SRCREV_machine:qemux86 ?= "44274a28ac73e22543a79b0345b546d128db83e2"
+SRCREV_machine:qemux86-64 ?= "44274a28ac73e22543a79b0345b546d128db83e2"
+SRCREV_machine:qemumips64 ?= "ae2263938f07037ded23e01f56297eb62aeaeb6a"
+SRCREV_machine ?= "44274a28ac73e22543a79b0345b546d128db83e2"
+SRCREV_meta ?= "cb87ac0a436d23cd349e42273a222f9f267e8e98"
 
 # set your preferred provider of linux-yocto to 'linux-yocto-upstream', and you'll
 # get the <version>/base branch, which is pure upstream -stable, and the same
 # meta SRCREV as the linux-yocto-standard builds. Select your version using the
 # normal PREFERRED_VERSION settings.
 BBCLASSEXTEND = "devupstream:target"
-SRCREV_machine:class-devupstream ?= "a06ca85b22f6c7f4e6dd1447ca50ded6f54ebb5e"
+SRCREV_machine:class-devupstream ?= "4c9646a796d66a2d81871a694e88e19a38b115a7"
 PN:class-devupstream = "linux-yocto-upstream"
 KBRANCH:class-devupstream = "v6.6/base"
 
@@ -44,7 +44,7 @@ SRC_URI = "git://git.yoctoproject.org/linux-yocto.git;name=machine;branch=${KBRA
            git://git.yoctoproject.org/yocto-kernel-cache;type=kmeta;name=meta;branch=yocto-6.6;destsuffix=${KMETA};protocol=https"
 
 LIC_FILES_CHKSUM = "file://COPYING;md5=6bc538ed5bd9a7fc9398086aedcd7e46"
-LINUX_VERSION ?= "6.6.6"
+LINUX_VERSION ?= "6.6.8"
 
 PV = "${LINUX_VERSION}+git"
 
-- 
2.39.2


