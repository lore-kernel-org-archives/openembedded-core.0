Return-Path: <bruce.ashfield@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 95C8EC25B10
	for <webhook@archiver.kernel.org>; Fri,  3 May 2024 03:00:25 +0000 (UTC)
Received: from mail-vs1-f51.google.com (mail-vs1-f51.google.com [209.85.217.51])
 by mx.groups.io with SMTP id smtpd.web11.4327.1714705220406099508
 for <openembedded-core@lists.openembedded.org>;
 Thu, 02 May 2024 20:00:20 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20230601 header.b=dpe+DKlo;
 spf=pass (domain: gmail.com, ip: 209.85.217.51, mailfrom: bruce.ashfield@gmail.com)
Received: by mail-vs1-f51.google.com with SMTP id ada2fe7eead31-479c39b78dbso2929432137.2
        for <openembedded-core@lists.openembedded.org>; Thu, 02 May 2024 20:00:20 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1714705219; x=1715310019; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=8+1u+SMk2nNyuRLAAkq/UIY6yj+ekDA0ph4XeeYQY+w=;
        b=dpe+DKloA7RYd2wm5B+kuVbR+/M34Er5y8kVmnr8RmflLuRdNCgKSp0ERjuYRQxGIA
         lZA7rj+9tpJcOL4t+OVVAJWr82xWcC9MRT2ikDE2VdBXMceLB4f6OzCoiXKJEH1SF5nq
         Pm2Vp0lBMOERAddwVxCRUH7lDyLRmMaQskfVhhz430s84DiFUCMprunTlAIe1o4g7E5H
         Q6gDCHBOO9BFCMl6dMRuYqiRK9s74bIA1VJ9I3a/g05GzvtkVm1gwFY9gNhS7j3/AKUc
         UFm8Qx7VKoaJ542EgkqFODkaoiAaXPwSEp+ZoFmgb0zrdgpYfbZ73AKNFvioWDy+tENp
         xQVQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1714705219; x=1715310019;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=8+1u+SMk2nNyuRLAAkq/UIY6yj+ekDA0ph4XeeYQY+w=;
        b=UNzgWJvB8r2jPoc4tjGp7rziwdqx1sV3AmEgi9m7FaqFUA2z6KwwKyLWo2gzMt5JoU
         R3iQV2jjc18zdDCNFbdYPT1QhGZW7SOjpQyHE7HMuuRHchamZqlSXfFfLi7X7xnuKq0n
         8wgc1OfthuTMkASONlUKRTQC0yyuUSRnyW4BDluadRbKbSMkewg2LgWvDG/eLjSE0AU7
         YJKGjMrCaXE8vyNvV8KvGwcz4keAqE3fqlgBr2cy+1lSwtgaImsONdSgWMpCZbhBNk0k
         qxsvmax8dd9UYPV5XxISIowovJOhGrw4VWzCJyg1YS5xIJnyvtF4wuoJuULSzlQkATPh
         9pJA==
X-Gm-Message-State: AOJu0YwpZerGJJdZwO76YRbPtzheLqkFw9c3uNNovsdcygExB0s9kptn
	aeNQEf0Rrnv/S8BULqH/tXAPTDf2mvYsrCu360MKM5qZjYE6Swv+Tlsdkg==
X-Google-Smtp-Source: AGHT+IGjw8/1Qt/4+Mr9EeY7GrdsBDyrPqQhl+aiETLC+rRMaXH9q5vpjidBvk+uIpz+ukLU21OqMw==
X-Received: by 2002:a67:b648:0:b0:47e:f86b:39e6 with SMTP id e8-20020a67b648000000b0047ef86b39e6mr1755005vsm.21.1714705219190;
        Thu, 02 May 2024 20:00:19 -0700 (PDT)
Received: from bruce-XPS-8940.localdomain (pool-174-112-62-108.cpe.net.cable.rogers.com. [174.112.62.108])
        by smtp.gmail.com with ESMTPSA id mi5-20020a056214558500b006a0fa96013asm839357qvb.138.2024.05.02.20.00.18
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 02 May 2024 20:00:18 -0700 (PDT)
From: bruce.ashfield@gmail.com
To: steve@sakoman.com
Cc: openembedded-core@lists.openembedded.org
Subject: [OE-core][nanbield 03/10] linux-yocto/6.1: update to v6.1.81
Date: Thu,  2 May 2024 23:00:08 -0400
Message-Id: <20240503030015.374078-3-bruce.ashfield@gmail.com>
X-Mailer: git-send-email 2.39.2
In-Reply-To: <20240503030015.374078-1-bruce.ashfield@gmail.com>
References: <20240503030015.374078-1-bruce.ashfield@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Fri, 03 May 2024 03:00:25 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/198958

From: Bruce Ashfield <bruce.ashfield@gmail.com>

Updating linux-yocto/6.1 to the latest korg -stable release that comprises
the following commits:

    61adba85cc40 Linux 6.1.81
    585a344af6bc xen/events: close evtchn after mapping cleanup
    8866334e3510 x86/efistub: Give up if memory attribute protocol returns an error
    2d7ebcb5d878 bpf: Derive source IP addr via bpf_*_fib_lookup()
    5fafd8254add bpf: Add table ID to bpf_fib_lookup BPF helper
    da67116b74e6 KVM/VMX: Move VERW closer to VMentry for MDS mitigation
    edfaad334a11 KVM/VMX: Use BT+JNC, i.e. EFLAGS.CF to select VMRESUME vs. VMLAUNCH
    07946d956b55 x86/bugs: Use ALTERNATIVE() instead of mds_user_clear static key
    2e3087505ddb x86/entry_32: Add VERW just before userspace transition
    22444d079b4c x86/entry_64: Add VERW just before userspace transition
    29d3e02fb448 x86/bugs: Add asm helpers for executing VERW
    559035e04e44 Revert "interconnect: Teach lockdep about icc_bw_lock order"
    19ec82b3cad1 Revert "interconnect: Fix locking for runpm vs reclaim"
    0e351d1aa2e4 block: define bvec_iter as __packed __aligned(4)
    c6ff5fb6b157 gpio: fix resource unwinding order in error path
    17acece41de3 gpiolib: Fix the error path order in gpiochip_add_data_with_key()
    a3d369aeb332 gpio: 74x164: Enable output pins after registers are reset
    7eb95e0af5c9 powerpc/pseries/iommu: IOMMU table is not initialized for kdump over SR-IOV
    2c96f66cd0cc phy: freescale: phy-fsl-imx8-mipi-dphy: Fix alias name to use dashes
    c4c795b21dd2 af_unix: Drop oob_skb ref before purging queue in GC.
    2402392bed4e efi/x86: Fix the missing KASLR_FLAG bit in boot_params->hdr.loadflags
    3a396c409a39 x86/boot: efistub: Assign global boot_params variable
    8f05493706ff x86/boot: Rename conflicting 'boot_params' pointer to 'boot_params_ptr'
    86c909d2275b x86/efistub: Avoid placing the kernel below LOAD_PHYSICAL_ADDR
    1b5406257679 efi/x86: Avoid physical KASLR on older Dell systems
    2dfaeac3f38e x86/efistub: Avoid legacy decompressor when doing EFI boot
    fff7614f576f x86/efistub: Perform SNP feature test while running in the firmware
    77330c123d7c x86/efistub: Prefer EFI memory attributes protocol over DXE services
    5a664585a71c x86/decompressor: Factor out kernel decompression and relocation
    350265a753d8 x86/efistub: Perform 4/5 level paging switch from the stub
    476a48cd37c9 efi/libstub: Add limit argument to efi_random_alloc()
    8ff6d88c0443 efi/libstub: Add memory attribute protocol definitions
    34378d7ad273 x86/efistub: Clear BSS in EFI handover protocol entrypoint
    1f3fd81bff03 x86/decompressor: Avoid magic offsets for EFI handover entrypoint
    f0acafd6f79f x86/efistub: Simplify and clean up handover entry code
    33d064aecd89 efi: efivars: prevent double registration
    e58f2862e9fe arm64: efi: Limit allocations to 48-bit addressable physical region
    56587affe21c nfsd: don't destroy global nfs4_file table in per-net shutdown
    f3ea5ec83d1a NFSD: replace delayed_work with work_struct for nfsd_client_shrinker
    c479755cb80a NFSD: register/unregister of nfsd-client shrinker at nfsd startup/shutdown time
    ce606d5334c2 NFSD: Use set_bit(RQ_DROPME)
    5c6c2fb3c12f NFSD: Avoid clashing function prototypes
    eb7373312430 NFSD: Use only RQ_DROPME to signal the need to drop a reply
    7b2b8a6c75f0 NFSD: add CB_RECALL_ANY tracepoints
    f28dae54632c NFSD: add delegation reaper to react to low memory condition
    f30f07ba5789 NFSD: add support for sending CB_RECALL_ANY
    4481d72a4b63 NFSD: refactoring courtesy_client_reaper to a generic low memory shrinker
    371e1c1b326b trace: Relocate event helper files
    0920deeec6dd lockd: fix file selection in nlmsvc_cancel_blocked
    ccbf6efab8d3 lockd: ensure we use the correct file descriptor when unlocking
    8973a8f9b72d lockd: set missing fl_flags field when retrieving args
    12e63680a76c NFSD: Use struct_size() helper in alloc_session()
    8b7be6ef588e nfsd: fix up the filecache laundrette scheduling
    e017486dadf9 nfsd: use locks_inode_context helper
    c66f9f22e6e5 lockd: use locks_inode_context helper
    1f76cb66ff22 filelock: add a new locks_inode_context accessor function
    6b12589f610a NFSD: Fix licensing header in filecache.c
    5a1f61516f80 NFSD: Use rhashtable for managing nfs4_file objects
    49e8d9f46500 NFSD: Refactor find_file()
    0d4150f5eb20 NFSD: Clean up find_or_add_file()
    5aa0c564c017 NFSD: Add a nfsd4_file_hash_remove() helper
    c8d8876aae34 NFSD: Clean up nfsd4_init_file()
    6ee5c4e269a9 NFSD: Update file_hashtbl() helpers
    255ac53d78d5 NFSD: Use const pointers as parameters to fh_ helpers
    fae3f8b554fa NFSD: Trace delegation revocations
    9fbef7dcd8aa NFSD: Trace stateids returned via DELEGRETURN
    519a80ea5a17 NFSD: Clean up nfs4_preprocess_stateid_op() call sites
    e62d8c128166 NFSD: Flesh out a documenting comment for filecache.c
    137d20da8ea0 exportfs: use pr_debug for unreachable debug statements
    f82865e2a026 nfsd: allow disabling NFSv2 at compile time
    850333a25aab nfsd: move nfserrno() to vfs.c
    bfef0cfab41c nfsd: ignore requests to disable unsupported versions
    0a49efb94888 NFSD: Remove redundant assignment to variable host_err
    d03a9855cbe6 NFSD: Simplify READ_PLUS
    831e9e63cc3b NFS: Fix data corruption caused by congestion.
    04dd4403ff37 drm/amd/display: Increase frame warning limit with KASAN or KCSAN in dml
    bf0ca988e250 decompress: Use 8 byte alignment
    5c4feadb0011 x86/decompressor: Move global symbol references to C code
    463b51e90c57 x86/decompressor: Merge trampoline cleanup with switching code
    df3dec320b7c x86/decompressor: Pass pgtable address to trampoline directly
    e2fa53a04cc7 x86/decompressor: Only call the trampoline when changing paging levels
    364d7745974f x86/decompressor: Call trampoline directly from C code
    1523291591de x86/decompressor: Avoid the need for a stack in the 32-bit trampoline
    6083b4c5908e x86/decompressor: Use standard calling convention for trampoline
    640f27fc2e7b x86/decompressor: Call trampoline as a normal function
    99a20f58913a x86/decompressor: Assign paging related global variables earlier
    2cca5f519e3a x86/decompressor: Store boot_params pointer in callee save register
    51a0710218ce x86/efistub: Branch straight to kernel entry point from C code
    4f3077c3eae7 x86/boot: Robustify calling startup_{32,64}() from the decompressor code
    7bc9533e077e x86/efi: Make the deprecated EFI handover protocol optional
    a8901f331b8b efi: verify that variable services are supported
    71c43b714fd6 x86/boot/compressed: Only build mem_encrypt.S if AMD_MEM_ENCRYPT=y
    cac22c9a5e66 x86/boot/compressed: Adhere to calling convention in get_sev_encryption_bit()
    0912dce9ed4e x86/boot/compressed: Move startup32_check_sev_cbit() out of head_64.S
    e840ae3dc277 x86/boot/compressed: Move startup32_check_sev_cbit() into .text
    801873f1750a x86/boot/compressed: Move startup32_load_idt() out of head_64.S
    2e47116315a0 x86/boot/compressed: Move startup32_load_idt() into .text section
    29134968f72d x86/boot/compressed: Pull global variable reference into startup32_load_idt()
    530a4271b7ba x86/boot/compressed: Avoid touching ECX in startup32_set_idt_entry()
    88035744b91a x86/boot/compressed: Simplify IDT/GDT preserve/restore in the EFI thunk
    ef12d049fa7b x86/boot/compressed, efi: Merge multiple definitions of image_offset into one
    beeeb4655db9 x86/boot/compressed: Move efi32_pe_entry() out of head_64.S
    469b84516cc4 x86/boot/compressed: Move efi32_entry out of head_64.S
    c577208f81c9 x86/boot/compressed: Move efi32_pe_entry into .text section
    d8950e8e20e0 x86/boot/compressed: Move bootargs parsing out of 32-bit startup code
    3bad8dc0ae8d x86/boot/compressed: Move 32-bit entrypoint code into .text section
    bad6e66d0701 x86/boot/compressed: Rename efi_thunk_64.S to efi-mixed.S
    e7945d93fece efi: libstub: use EFI_LOADER_CODE region when moving the kernel in memory
    2d9b3e1ae1be RDMA/core: Update CMA destination address on rdma_resolve_addr
    88067197e97a RDMA/core: Refactor rdma_bind_addr
    f27d319df055 mptcp: fix possible deadlock in subflow diag
    d93fd40c6239 mptcp: fix double-free on socket dismantle
    a8722cece375 mptcp: fix snd_wnd initialization for passive socket
    03ad085eb14d selftests: mptcp: join: add ss mptcp support check
    84a3c10a0c79 mptcp: push at DSS boundaries
    fb7be5e5ec26 mptcp: map v4 address to v6 when destroying subflow
    53e3f2ee8a0c mptcp: continue marking the first subflow as UNCONNECTED
    fbccc5eb1652 mptcp: fix duplicate subflow creation
    e64148635509 mptcp: fix data races on remote_id
    e6e04845c2e8 mptcp: fix data races on local_id
    65742f4bb1f9 x86/cpu/intel: Detect TME keyid bits before setting MTRR mask registers
    c9fa51d4c434 x86/e820: Don't reserve SETUP_RNG_SEED in e820
    396a4120011d pmdomain: qcom: rpmhpd: Fix enabled_corner aggregation
    249d6ca4ff00 efivarfs: Request at most 512 bytes for variable names
    76109a226a39 riscv: add CALLER_ADDRx support
    4974d928d5e3 mmc: sdhci-xenon: fix PHY init clock stability
    c65c47556085 mmc: sdhci-xenon: add timeout for PHY init complete
    bc9f87a41d18 mmc: core: Fix eMMC initialization with 1-bit bus connection
    70af82bb9c89 mmc: mmci: stm32: fix DMA API overlapping mappings warning
    474d521da890 dmaengine: fsl-qdma: init irq after reg initialization
    300111cd9042 dmaengine: ptdma: use consistent DMA masks
    034e2d70b5c7 crypto: arm64/neonbs - fix out-of-bounds access on short input
    237ecf1afe6c dmaengine: fsl-qdma: fix SoC may hang on 16 byte unaligned read
    8dafc066c546 drm/buddy: fix range bias
    2e443ed55fe3 Revert "drm/amd/pm: resolve reboot exception for si oland"
    444d70889d19 btrfs: send: don't issue unnecessary zero writes for trailing hole
    f590040ce2b7 btrfs: dev-replace: properly validate device names
    c34adc20b91a btrfs: fix double free of anonymous device after snapshot creation failure
    930e826962d9 wifi: nl80211: reject iftype change with mesh ID change
    abd32d7f5c02 gtp: fix use-after-free and null-ptr-deref in gtp_newlink()
    59ed284c7bff landlock: Fix asymmetric private inodes referring
    fd3289ab8ed1 ALSA: hda/realtek: fix mute/micmute LED For HP mt440
    4cbbc2f0dbe2 ALSA: hda/realtek: Enable Mute LED on HP 840 G8 (MB 8AB8)
    8cec41a35065 ALSA: firewire-lib: fix to check cycle continuity
    3bfe04c1273d tomoyo: fix UAF write bug in tomoyo_write_control()
    8f626221e5fa of: property: fw_devlink: Fix stupid bug in remote-endpoint parsing
    8310080799b4 riscv: Sparse-Memory/vmemmap out-of-bounds fix
    058ed71e0f7a afs: Fix endless loop in directory parsing
    2f91a96b892f fbcon: always restore the old font data in fbcon_do_set_font()
    d36b9a1b4e52 drm/tegra: Remove existing framebuffer only if we support display
    7f8644b6a86d ALSA: Drop leftover snd-rtctimer stuff from Makefile
    cefe18e9ec84 power: supply: bq27xxx-i2c: Do not free non existing IRQ
    ddc547dd05a4 efi/capsule-loader: fix incorrect allocation size
    08562ca971ff tls: fix peeking with sync+async decryption
    40f0f326cfe6 tls: decrement decrypt_pending if no async completion will be called
    7d4121b40149 net: hsr: Use correct offset for HSR TLV values in supervisory HSR frames
    a0222b481757 igb: extend PTP timestamp adjustments to i211
    f2261eb994aa rtnetlink: fix error logic of IFLA_BRIDGE_FLAGS writing back
    2b1414d5e94e netfilter: bridge: confirm multicast packets before passing them up the stack
    b8afc22a1160 netfilter: let reset rules clean out conntrack entries
    ddf6ee3df30b netfilter: nf_tables: allow NFPROTO_INET in nft_(match/target)_validate()
    92b8a3273f38 Bluetooth: hci_qca: Set BDA quirk bit if fwnode exists in DT
    67ffc334b92a Bluetooth: qca: add support for WCN7850
    fc47ed389a88 Bluetooth: qca: use switch case for soc type behavior
    940963613275 Bluetooth: btqca: Add WCN3988 support
    29059d0f3bc2 Bluetooth: btqca: use le32_to_cpu for ver.soc_id
    e5383662fd02 Bluetooth: hci_qca: Add support for QTI Bluetooth chip wcn6855
    eb7b5777d3c7 Bluetooth: hci_qca: mark OF related data as maybe unused
    7b410226d9ef Bluetooth: qca: Fix wrong event type for patch config command
    2dc94c160ef0 Bluetooth: Enforce validation on max value of connection interval
    30a5e812f78e Bluetooth: hci_event: Fix handling of HCI_EV_IO_CAPA_REQUEST
    0b056a52b3ad Bluetooth: hci_event: Fix wrongly recorded wakeup BD_ADDR
    926405765f25 Bluetooth: hci_sync: Fix accept_list when attempting to suspend
    45085686b955 Bluetooth: Avoid potential use-after-free in hci_error_reset
    cad078914b62 Bluetooth: hci_sync: Check the correct flag before starting a scan
    17ccd9798fe0 stmmac: Clear variable when destroying workqueue
    aa5897232682 uapi: in6: replace temporary label with rfc9486
    1b4223e807fa net: lan78xx: fix "softirq work is pending" error
    d77ab053fb2f net: usb: dm9601: fix wrong return value in dm9601_mdio_read
    548ab6673084 veth: try harder when allocating queue memory
    c41548fede3d lan78xx: enable auto speed configuration for LAN7850 if no EEPROM is detected
    1b0998fdd857 ipv6: fix potential "struct net" leak in inet6_rtm_getaddr()
    7985d73961bb net: veth: clear GRO when clearing XDP even when down
    e85b3c15398f cpufreq: intel_pstate: fix pstate limits enforcement for adjust_perf call back
    29360fd3288f tun: Fix xdp_rxq_info's queue_index when detaching
    a3c8fa54e904 net: mctp: take ownership of skb in mctp_local_output
    ab63de24ebea net: ip_tunnel: prevent perpetual headroom growth
    0ac219c4c3ab netlink: add nla be16/32 types to minlen array
    0b27bf4c494d netlink: Fix kernel-infoleak-after-free in __skb_datagram_iter
    65a389ef979b mtd: spinand: gigadevice: Fix the get ecc status issue
    87632bc9ecff mm: huge_memory: don't force huge page alignment on 32 bit
    afbf1a5cef46 RDMA/core: Fix multiple -Warray-bounds warnings
    e5f488993bc1 iommu/arm-smmu-qcom: Limit the SMR groups to 128
    329fc4d3f73d fs/ntfs3: Fix NULL pointer dereference in 'ni_write_inode'
    b3152afc0eb8 fs/ntfs3: Fix NULL dereference in ni_write_inode
    0d04e45c65f0 fs/ntfs3: Add length check in indx_get_root
    976126f2def4 clk: tegra20: fix gcc-7 constant overflow warning
    39c631200957 fs/ntfs3: Fix a possible null-pointer dereference in ni_clear()
    e89c84422f35 iommu/arm-smmu-v3: Acknowledge pri/event queue overflow if any
    8745f3592ee4 iommu/sprd: Release dma buffer to avoid memory leak
    f8faa536370e Input: xpad - add constants for GIP interface numbers
    ed9fdc82cafb usb: gadget: Properly configure the device for remote wakeup
    49e734926a4b ARM: dts: imx7s: Drop dma-apb interrupt-names
    0cea0c330a11 ARM: dts: imx: Adjust dma-apbh node name
    507eeaad4d32 PCI: layerscape: Add workaround for lost link capabilities during reset
    e30f82597bf6 PCI: layerscape: Add the endpoint linkup notifier support
    5dbedec7e5cf mlxsw: spectrum_acl_tcam: Add missing mutex_destroy()
    174ac6b53a20 mlxsw: spectrum_acl_tcam: Make fini symmetric to init
    00459ae532d6 net: restore alpha order to Ethernet devices in config
    a76072bc73c7 of: overlay: Reorder struct fragment fields kerneldoc
    2a3d40b4025f af_unix: Fix task hung while purging oob_skb in GC.
    b73dd5f99972 scsi: sd: usb_storage: uas: Access media prior to querying device properties
    cf33e6ca12d8 scsi: core: Add struct for args to execution functions
    7d34b1078665 drm/meson: Don't remove bridges which are created by other drivers
    ae5f10ed9539 drm/meson: fix unbind path if HDMI fails to bind
    b7be6c737a17 netfilter: nf_tables: disallow timeout for anonymous sets

Signed-off-by: Bruce Ashfield <bruce.ashfield@gmail.com>
---
 .../linux/linux-yocto-rt_6.1.bb               |  6 ++--
 .../linux/linux-yocto-tiny_6.1.bb             |  6 ++--
 meta/recipes-kernel/linux/linux-yocto_6.1.bb  | 28 +++++++++----------
 3 files changed, 20 insertions(+), 20 deletions(-)

diff --git a/meta/recipes-kernel/linux/linux-yocto-rt_6.1.bb b/meta/recipes-kernel/linux/linux-yocto-rt_6.1.bb
index 69d6b4bea9..cd9deafb8d 100644
--- a/meta/recipes-kernel/linux/linux-yocto-rt_6.1.bb
+++ b/meta/recipes-kernel/linux/linux-yocto-rt_6.1.bb
@@ -14,13 +14,13 @@ python () {
         raise bb.parse.SkipRecipe("Set PREFERRED_PROVIDER_virtual/kernel to linux-yocto-rt to enable it")
 }
 
-SRCREV_machine ?= "6c4acb22266e16b25cc391f6c14d25358bdaeb9b"
-SRCREV_meta ?= "4b4e682a21aa2796eb9ac95363cfd3849690f550"
+SRCREV_machine ?= "5c94f8a3f0df3075a8b7883ef7675a3ac9bf5e58"
+SRCREV_meta ?= "b508a9d9a5ca890a54488d93773a2a86c0e329e7"
 
 SRC_URI = "git://git.yoctoproject.org/linux-yocto.git;branch=${KBRANCH};name=machine;protocol=https \
            git://git.yoctoproject.org/yocto-kernel-cache;type=kmeta;name=meta;branch=yocto-6.1;destsuffix=${KMETA};protocol=https"
 
-LINUX_VERSION ?= "6.1.80"
+LINUX_VERSION ?= "6.1.81"
 
 LIC_FILES_CHKSUM = "file://COPYING;md5=6bc538ed5bd9a7fc9398086aedcd7e46"
 
diff --git a/meta/recipes-kernel/linux/linux-yocto-tiny_6.1.bb b/meta/recipes-kernel/linux/linux-yocto-tiny_6.1.bb
index 8f75e145e4..faf26e56e8 100644
--- a/meta/recipes-kernel/linux/linux-yocto-tiny_6.1.bb
+++ b/meta/recipes-kernel/linux/linux-yocto-tiny_6.1.bb
@@ -8,7 +8,7 @@ require recipes-kernel/linux/linux-yocto.inc
 # CVE exclusions
 include recipes-kernel/linux/cve-exclusion_6.1.inc
 
-LINUX_VERSION ?= "6.1.80"
+LINUX_VERSION ?= "6.1.81"
 LIC_FILES_CHKSUM = "file://COPYING;md5=6bc538ed5bd9a7fc9398086aedcd7e46"
 
 DEPENDS += "${@bb.utils.contains('ARCH', 'x86', 'elfutils-native', '', d)}"
@@ -17,8 +17,8 @@ DEPENDS += "openssl-native util-linux-native"
 KMETA = "kernel-meta"
 KCONF_BSP_AUDIT_LEVEL = "2"
 
-SRCREV_machine ?= "878c7bd1da5733d94302744caeffd6952fb21946"
-SRCREV_meta ?= "4b4e682a21aa2796eb9ac95363cfd3849690f550"
+SRCREV_machine ?= "3405bbdc5cfb59d25351b6f7409c1e47cb51fba8"
+SRCREV_meta ?= "b508a9d9a5ca890a54488d93773a2a86c0e329e7"
 
 PV = "${LINUX_VERSION}+git"
 
diff --git a/meta/recipes-kernel/linux/linux-yocto_6.1.bb b/meta/recipes-kernel/linux/linux-yocto_6.1.bb
index 9e9f796980..36d9d2041e 100644
--- a/meta/recipes-kernel/linux/linux-yocto_6.1.bb
+++ b/meta/recipes-kernel/linux/linux-yocto_6.1.bb
@@ -18,25 +18,25 @@ KBRANCH:qemux86-64 ?= "v6.1/standard/base"
 KBRANCH:qemuloongarch64  ?= "v6.1/standard/base"
 KBRANCH:qemumips64 ?= "v6.1/standard/mti-malta64"
 
-SRCREV_machine:qemuarm ?= "d46a9061129185398c5550d2d37ad9e628a488d3"
-SRCREV_machine:qemuarm64 ?= "878c7bd1da5733d94302744caeffd6952fb21946"
-SRCREV_machine:qemuloongarch64 ?= "878c7bd1da5733d94302744caeffd6952fb21946"
-SRCREV_machine:qemumips ?= "c511f69211cb6dc994a92478449aa022a0fc367a"
-SRCREV_machine:qemuppc ?= "fc16624451c0d2d7b7a34addf4c5f4f96950614e"
-SRCREV_machine:qemuriscv64 ?= "878c7bd1da5733d94302744caeffd6952fb21946"
-SRCREV_machine:qemuriscv32 ?= "878c7bd1da5733d94302744caeffd6952fb21946"
-SRCREV_machine:qemux86 ?= "878c7bd1da5733d94302744caeffd6952fb21946"
-SRCREV_machine:qemux86-64 ?= "878c7bd1da5733d94302744caeffd6952fb21946"
-SRCREV_machine:qemumips64 ?= "0c7a9b0639caf832c1b82edc0334880a4a093cda"
-SRCREV_machine ?= "878c7bd1da5733d94302744caeffd6952fb21946"
-SRCREV_meta ?= "4b4e682a21aa2796eb9ac95363cfd3849690f550"
+SRCREV_machine:qemuarm ?= "fd979501e96642c64fa1cc9c81713f4ec098a5c7"
+SRCREV_machine:qemuarm64 ?= "3405bbdc5cfb59d25351b6f7409c1e47cb51fba8"
+SRCREV_machine:qemuloongarch64 ?= "3405bbdc5cfb59d25351b6f7409c1e47cb51fba8"
+SRCREV_machine:qemumips ?= "217690aa1afe0b40d10f05cc96826a264fa5f0ac"
+SRCREV_machine:qemuppc ?= "df23dc9de645adb30b9df6d7c26f3245aa6a1716"
+SRCREV_machine:qemuriscv64 ?= "3405bbdc5cfb59d25351b6f7409c1e47cb51fba8"
+SRCREV_machine:qemuriscv32 ?= "3405bbdc5cfb59d25351b6f7409c1e47cb51fba8"
+SRCREV_machine:qemux86 ?= "3405bbdc5cfb59d25351b6f7409c1e47cb51fba8"
+SRCREV_machine:qemux86-64 ?= "3405bbdc5cfb59d25351b6f7409c1e47cb51fba8"
+SRCREV_machine:qemumips64 ?= "7c8d52cdd913121fc0b5f1c9393b49ef680931de"
+SRCREV_machine ?= "3405bbdc5cfb59d25351b6f7409c1e47cb51fba8"
+SRCREV_meta ?= "b508a9d9a5ca890a54488d93773a2a86c0e329e7"
 
 # set your preferred provider of linux-yocto to 'linux-yocto-upstream', and you'll
 # get the <version>/base branch, which is pure upstream -stable, and the same
 # meta SRCREV as the linux-yocto-standard builds. Select your version using the
 # normal PREFERRED_VERSION settings.
 BBCLASSEXTEND = "devupstream:target"
-SRCREV_machine:class-devupstream ?= "a3eb3a74aa8c94e6c8130b55f3b031f29162868c"
+SRCREV_machine:class-devupstream ?= "61adba85cc40287232a539e607164f273260e0fe"
 PN:class-devupstream = "linux-yocto-upstream"
 KBRANCH:class-devupstream = "v6.1/base"
 
@@ -45,7 +45,7 @@ SRC_URI = "git://git.yoctoproject.org/linux-yocto.git;name=machine;branch=${KBRA
 SRC_URI += "file://0001-perf-cpumap-Make-counter-as-unsigned-ints.patch"
 
 LIC_FILES_CHKSUM = "file://COPYING;md5=6bc538ed5bd9a7fc9398086aedcd7e46"
-LINUX_VERSION ?= "6.1.80"
+LINUX_VERSION ?= "6.1.81"
 
 PV = "${LINUX_VERSION}+git"
 
-- 
2.39.2


