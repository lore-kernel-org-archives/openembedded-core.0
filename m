Return-Path: <bruce.ashfield@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 7C356CD11DD
	for <webhook@archiver.kernel.org>; Tue, 19 Mar 2024 23:01:48 +0000 (UTC)
Received: from mail-oo1-f47.google.com (mail-oo1-f47.google.com [209.85.161.47])
 by mx.groups.io with SMTP id smtpd.web10.30633.1710889301746393780
 for <openembedded-core@lists.openembedded.org>;
 Tue, 19 Mar 2024 16:01:41 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20230601 header.b=Hzy8cmVj;
 spf=pass (domain: gmail.com, ip: 209.85.161.47, mailfrom: bruce.ashfield@gmail.com)
Received: by mail-oo1-f47.google.com with SMTP id 006d021491bc7-5a1fa3cf5eeso2728323eaf.3
        for <openembedded-core@lists.openembedded.org>; Tue, 19 Mar 2024 16:01:41 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1710889301; x=1711494101; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=Gy+PZoxPknIwS+EigABl/aeHb/6iMPFAjauzz7OrfG4=;
        b=Hzy8cmVj4AkmkYiTbunHAgMdBTT8nCZPrs8VxSdNrAotCu/EyOs9qpy652/2HXAsDI
         vI1mko9akF7Ou2XL7dqmNfzbN09Y93Eb63w1hk7NZBtj4iDiLt8/JBVHDfdivS18reS7
         8dAEJpCXXnU4NuSQwfBKQ99mEEAsoMb+yo1n4r3U8kitfKICs/kfaiZaypV0Rsv44vAa
         E+uLyhTvf1/bRgVtHDEyQG5S2FeIqT9usbMySRTxPXmtXN0YLTb87q9Zn0jnJ5OypGqR
         cFBixWCeIoFJniaCPe72ZWRcJzraiq/n1b7G0Q1v3v/VaQ6T8s0DSnsHfUiEUYbkT5GX
         M2jg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1710889301; x=1711494101;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=Gy+PZoxPknIwS+EigABl/aeHb/6iMPFAjauzz7OrfG4=;
        b=Jm1ExbLpAM0Gsb0CvRfVlYbSAhZtXNVclxfhbhBpuDK4y4FA217wP84Dklip5dq8ZW
         KmaYO/Ayl0SMtllHFnyoASL2BexCW1pvWyak7fklqCLFyu7ZPtA0xXUkcEX2XEazOFjm
         OG9nl45vNuipYTigdfnyv7qKHB0hhVZQ5NZSKH+i9yDnoBOUqeC0R9k9rMfL3w1DnBt6
         3Ga9cm1jPmqchCgn2cRTZKmO87BtX8awBEeWLRnIH0pITCP723Hc+1p/9CTRN1fGgTxt
         p8GTuocLOFxndUmo3Drwo8kck1SXLe4hvKQcGb93XkR6Yfi/AXYRsPgTpko1q61nhrv1
         oJow==
X-Gm-Message-State: AOJu0YzxesYZWXPTOha29lBWHG8PclELE3P/SSPWTf6IuRJC29AGhGwq
	8rR8R4v49K5j36Z2TWNxCUEhVOyYsbvb5J0P6Izc1KApFqEHQ7tMnKsMfPgs
X-Google-Smtp-Source: AGHT+IGA4kb1Z9wRXYPVj4wAkE0nL9i8X4ZCu+r3Cu4HlifChzu2Qx+egNaxCMwXBT2FvOMmSDXz5g==
X-Received: by 2002:a05:6870:b513:b0:221:9414:4519 with SMTP id v19-20020a056870b51300b0022194144519mr18774628oap.46.1710889300819;
        Tue, 19 Mar 2024 16:01:40 -0700 (PDT)
Received: from bruce-XPS-8940.localdomain ([174.112.62.108])
        by smtp.gmail.com with ESMTPSA id kc28-20020a056214411c00b00690bfb6aac7sm7047065qvb.51.2024.03.19.16.01.39
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 19 Mar 2024 16:01:39 -0700 (PDT)
From: bruce.ashfield@gmail.com
To: richard.purdie@linuxfoundation.org
Cc: openembedded-core@lists.openembedded.org
Subject: [PATCH 4/9] yocto-bsps: update to v6.6.21
Date: Tue, 19 Mar 2024 19:01:27 -0400
Message-Id: <4079b14e4fccdf64f52b60c878fb22def0eae836.1710888915.git.bruce.ashfield@gmail.com>
X-Mailer: git-send-email 2.39.2
In-Reply-To: <cover.1710888915.git.bruce.ashfield@gmail.com>
References: <cover.1710888915.git.bruce.ashfield@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Tue, 19 Mar 2024 23:01:48 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/197339

From: Bruce Ashfield <bruce.ashfield@gmail.com>

Updating linux-yocto/6.6 to the latest korg -stable release that comprises
the following commits:

    06644f0d7193 drm/tilcdc: Set preferred depth
    62e5ae5007ef Linux 6.6.21
    d6ac0ee5ff95 drm/nouveau: don't fini scheduler before entity flush
    ece1aaec7f7e selftests: mptcp: rm subflow with v4/v4mapped addr
    8e7f31bf1101 selftests: mptcp: add mptcp_lib_is_v6
    9d71f43afd89 selftests: mptcp: update userspace pm test helpers
    f9190d7995a7 selftests: mptcp: add chk_subflows_total helper
    ae1fa39da991 selftests: mptcp: add evts_get_info helper
    e81742f6e2eb KVM/VMX: Move VERW closer to VMentry for MDS mitigation
    ae46691220f7 KVM/VMX: Use BT+JNC, i.e. EFLAGS.CF to select VMRESUME vs. VMLAUNCH
    7a62647efcb2 x86/bugs: Use ALTERNATIVE() instead of mds_user_clear static key
    ca13d8cd8dac x86/entry_32: Add VERW just before userspace transition
    7caf330faf16 x86/entry_64: Add VERW just before userspace transition
    2664bb298cdf block: define bvec_iter as __packed __aligned(4)
    21bbe847686c gpio: fix resource unwinding order in error path
    9c7c16109b71 gpiolib: Fix the error path order in gpiochip_add_data_with_key()
    92515c4ef1b4 gpio: 74x164: Enable output pins after registers are reset
    6b6282d56b14 powerpc/rtas: use correct function name for resetting TCE tables
    d4d1e4b1513d powerpc/pseries/iommu: IOMMU table is not initialized for kdump over SR-IOV
    5e3022ea42e4 dmaengine: idxd: Ensure safe user copy of completion record
    4d6e793eacfb dmaengine: idxd: Remove shadow Event Log head stored in idxd
    981917766b59 phy: freescale: phy-fsl-imx8-mipi-dphy: Fix alias name to use dashes
    d24fe6d5a1cf dmaengine: dw-edma: eDMA: Add sync read before starting the DMA transfer in remote setup
    227ef58a9b0c dmaengine: dw-edma: HDMA: Add sync read before starting the DMA transfer in remote setup
    55501b7359ef dmaengine: dw-edma: Add HDMA remote interrupt configuration
    3fa3dfcabf3a dmaengine: dw-edma: HDMA_V0_REMOTEL_STOP_INT_EN typo fix
    8b5657ac34b7 dmaengine: dw-edma: Fix wrong interrupt bit set for HDMA
    3adea99aa756 dmaengine: dw-edma: Fix the ch_count hdma callback
    57e869be88d0 ASoC: cs35l56: fix reversed if statement in cs35l56_dspwait_asp1tx_put()
    e9eac260369d af_unix: Drop oob_skb ref before purging queue in GC.
    69e0f04460f4 af_unix: Fix task hung while purging oob_skb in GC.
    be8a177250b2 NFS: Fix data corruption caused by congestion.
    fa8c776f4c32 mptcp: fix possible deadlock in subflow diag
    ce0809ada38d mptcp: fix double-free on socket dismantle
    b609ecda2d76 mptcp: fix potential wake-up event loss
    ae5530ccd5ef mptcp: fix snd_wnd initialization for passive socket
    536a661bfdf4 selftests: mptcp: join: add ss mptcp support check
    48428b07de4f mptcp: push at DSS boundaries
    fca4e6ab0681 mptcp: avoid printing warning once on client side
    a49ecbe8d0f0 mptcp: map v4 address to v6 when destroying subflow
    dff60a5531b5 x86/cpu/intel: Detect TME keyid bits before setting MTRR mask registers
    c43b984f0b23 x86/e820: Don't reserve SETUP_RNG_SEED in e820
    d2a9510c0e39 mm/debug_vm_pgtable: fix BUG_ON with pud advanced test
    e9eeb0dddf61 pmdomain: qcom: rpmhpd: Fix enabled_corner aggregation
    71da10e633a9 efivarfs: Request at most 512 bytes for variable names
    f1fb745ee0a6 iommufd: Fix iopt_access_list_id overwrite bug
    8db4f87fa3e1 kbuild: Add -Wa,--fatal-warnings to as-instr invocation
    9537603a5436 riscv: add CALLER_ADDRx support
    0c8a3d3354cd RISC-V: Drop invalid test from CONFIG_AS_HAS_OPTION_ARCH
    aebd67a52edd mmc: sdhci-xenon: fix PHY init clock stability
    b4eacb32e066 mmc: sdhci-xenon: add timeout for PHY init complete
    4344444255a3 mmc: core: Fix eMMC initialization with 1-bit bus connection
    176e66269f0d mmc: mmci: stm32: fix DMA API overlapping mappings warning
    a69c8bbb9469 dmaengine: fsl-qdma: init irq after reg initialization
    91b001fb0b08 dmaengine: fsl-edma: correct calculation of 'nbytes' in multi-fifo scenario
    4e0fe154be7b dmaengine: ptdma: use consistent DMA masks
    1291d278b557 crypto: arm64/neonbs - fix out-of-bounds access on short input
    5b696e9c3882 dmaengine: fsl-qdma: fix SoC may hang on 16 byte unaligned read
    737d2e9300cd soc: qcom: pmic_glink: Fix boot when QRTR=m
    82dacc26e15c drm/amd/display: Add monitor patch for specific eDP
    5e476625fa8a drm/buddy: fix range bias
    baac292852c0 Revert "drm/amd/pm: resolve reboot exception for si oland"
    202e4f4bb858 btrfs: send: don't issue unnecessary zero writes for trailing hole
    b1690ced4d2d btrfs: dev-replace: properly validate device names
    eb3441093aad btrfs: fix double free of anonymous device after snapshot creation failure
    177d574be4b5 wifi: nl80211: reject iftype change with mesh ID change
    ad8ff8cff38d mtd: rawnand: marvell: fix layouts
    ba60fdf75e89 mm: cachestat: fix folio read-after-free in cache walk
    93dd420bc415 gtp: fix use-after-free and null-ptr-deref in gtp_newlink()
    f4906938bdd4 landlock: Fix asymmetric private inodes referring
    0be289ba41bb Bluetooth: hci_bcm4377: do not mark valid bd_addr as invalid
    a4904b3afed0 ALSA: hda/realtek: Add special fixup for Lenovo 14IRP8
    5cdf76fbbed9 ALSA: hda/realtek: fix mute/micmute LED For HP mt440
    46fb5e7ec337 ALSA: hda/realtek: Enable Mute LED on HP 840 G8 (MB 8AB8)
    d6ac6ffbdc39 ALSA: hda/realtek: tas2781: enable subwoofer volume control
    bb06ffbf3862 ALSA: ump: Fix the discard error code from snd_ump_legacy_open()
    22df6ff560c5 ALSA: firewire-lib: fix to check cycle continuity
    2caa60507948 tomoyo: fix UAF write bug in tomoyo_write_control()
    6f72b4458ead of: property: fw_devlink: Fix stupid bug in remote-endpoint parsing
    d43f8e58f10a btrfs: fix race between ordered extent completion and fiemap
    a278d5c60f21 riscv: Sparse-Memory/vmemmap out-of-bounds fix
    eb2571673cfc riscv: Fix pte_leaf_size() for NAPOT
    2b7ce74e19fc Revert "riscv: mm: support Svnapot in huge vmap"
    e0d17ee872cf drivers: perf: ctr_get_width function for legacy is not defined
    2f8c09478a2c drivers: perf: added capabilities for legacy PMU
    f67898867b6b afs: Fix endless loop in directory parsing
    73a6bd68a134 fbcon: always restore the old font data in fbcon_do_set_font()
    8e8c66afe27b drm/tegra: Remove existing framebuffer only if we support display
    274bf3cca13f RISC-V: Ignore V from the riscv,isa DT property on older T-Head CPUs
    fb3618f6bd49 ASoC: soc-card: Fix missing locking in snd_soc_card_get_kcontrol()
    4b5d89ace3ce ASoC: cs35l56: Fix deadlock in ASP1 mixer register initialization
    9f05fe599965 ASoC: cs35l56: Fix misuse of wm_adsp 'part' string for silicon revision
    c249f04f2bff ASoC: cs35l56: Fix for initializing ASP1 mixer registers
    044edc12fe01 ASoC: cs35l56: Don't add the same register patch multiple times
    a2f0a6846da8 ASoC: cs35l56: cs35l56_component_remove() must clean up wm_adsp
    93fc01f9b58d ASoC: cs35l56: cs35l56_component_remove() must clear cs35l56->component
    cc698db49b93 riscv: Fix build error if !CONFIG_ARCH_ENABLE_HUGEPAGE_MIGRATION
    99adc8b4d2f3 ASoC: qcom: Fix uninitialized pointer dmactl
    841361d88fae ASoC: qcom: convert not to use asoc_xxx()
    c92c96cda3e3 ASoC: soc.h: convert asoc_xxx() to snd_soc_xxx()
    ac549defb351 ALSA: Drop leftover snd-rtctimer stuff from Makefile
    4a7f5eff429b ASoC: cs35l56: Must clear HALO_STATE before issuing SYSTEM_RESET
    fbca8bae1ba7 power: supply: bq27xxx-i2c: Do not free non existing IRQ
    11aabd748785 efi/capsule-loader: fix incorrect allocation size
    81be85353b0f tls: fix use-after-free on failed backlog decryption
    dec5b6e7b211 tls: separate no-async decryption request handling from async
    11121c2ce571 tls: fix peeking with sync+async decryption
    c19fdb06d3d7 tls: decrement decrypt_pending if no async completion will be called
    9422350aea63 net: hsr: Use correct offset for HSR TLV values in supervisory HSR frames
    c88bf996e88b igb: extend PTP timestamp adjustments to i211
    167d8642daa6 rtnetlink: fix error logic of IFLA_BRIDGE_FLAGS writing back
    dbc81b032dd0 tools: ynl: fix handling of multiple mcast groups
    80cd0487f630 netfilter: bridge: confirm multicast packets before passing them up the stack
    98567dc7973f netfilter: nf_tables: allow NFPROTO_INET in nft_(match/target)_validate()
    39e39c34abb5 Bluetooth: qca: Fix triggering coredump implementation
    c50ce483c28a Bluetooth: hci_qca: Set BDA quirk bit if fwnode exists in DT
    fb3e827badce Bluetooth: qca: Fix wrong event type for patch config command
    dcd646f40a56 Bluetooth: Enforce validation on max value of connection interval
    fba268ac36ab Bluetooth: hci_event: Fix handling of HCI_EV_IO_CAPA_REQUEST
    4a9139678ede Bluetooth: hci_event: Fix wrongly recorded wakeup BD_ADDR
    6699d7ce263c Bluetooth: hci_sync: Fix accept_list when attempting to suspend
    2ab9a19d896f Bluetooth: Avoid potential use-after-free in hci_error_reset
    0a07fa1f61e4 Bluetooth: hci_sync: Check the correct flag before starting a scan
    699b103e48ce stmmac: Clear variable when destroying workqueue
    af6dfe9e9551 uapi: in6: replace temporary label with rfc9486
    2ae3d9d1d8da net: lan78xx: fix "softirq work is pending" error
    0ec3ea616a50 net: usb: dm9601: fix wrong return value in dm9601_mdio_read
    2d8003e55d12 veth: try harder when allocating queue memory
    288218b1dd26 lan78xx: enable auto speed configuration for LAN7850 if no EEPROM is detected
    44112bc5c74e ipv6: fix potential "struct net" leak in inet6_rtm_getaddr()
    16edf51f33f5 net: veth: clear GRO when clearing XDP even when down
    1a8682737600 cpufreq: intel_pstate: fix pstate limits enforcement for adjust_perf call back
    7322b217c6f0 tun: Fix xdp_rxq_info's queue_index when detaching
    fbccbb4215ae net: dpaa: fman_memac: accept phy-interface-type = "10gbase-r" in the device tree
    cbebc55ceace net: mctp: take ownership of skb in mctp_local_output
    a0a1db40b23e net: ip_tunnel: prevent perpetual headroom growth
    a2ab02815184 netlink: add nla be16/32 types to minlen array
    d3ada42e534a netlink: Fix kernel-infoleak-after-free in __skb_datagram_iter
    03f1573c9587 spi: cadence-qspi: fix pointer reference in runtime PM hooks
    c53b8d8f70c4 mtd: spinand: gigadevice: Fix the get ecc status issue
    8cb8ef0c79e3 ublk: move ublk_cancel_dev() out of ub->mutex
    2b5f1692a95b ksmbd: fix wrong allocation size update in smb2_open()
    05059601518e ASoC: cs35l34: Fix GPIO name and drop legacy include
    d3d782b5a5d3 ubifs: fix possible dereference after free
    ff7ae7b32324 crypto: jitter - add RCT/APT support for different OSRs
    50cd24ddb6f0 arm64: defconfig: remove CONFIG_IPQ_APSS_5018
    58e5c91d6701 x86/alternatives: Disable interrupts and sync when optimizing NOPs in place
    c878fd2d4c79 x86/alternatives: Sync core before enabling interrupts
    c2d64b9f52b6 qemux86: add configuration symbol to select values
    630c33229e6d sched/isolation: really align nohz_full with rcu_nocbs
    0e5e0f68e2e6 clear_warn_once: add a clear_warn_once= boot parameter
    46934791b902 clear_warn_once: bind a timer to written reset value
    cdee9e38ff32 clear_warn_once: expand debugfs to include read support
    82b562b81841 tools: Remove some options from CLANG_CROSS_FLAGS
    36dc380b776b libbpf: Fix build warning on ref_ctr_off
    9e3e1fe20982 perf: perf can not parser the backtrace of app in the 32bit system and 64bit kernel.
    e497a4a5da65 perf: x86-32: explicitly include <errno.h>
    7b57ddd89565 perf: mips64: Convert __u64 to unsigned long long
    1cfc19423dc7 perf: fix bench numa compilation
    98bc2815fade perf: add SLANG_INC for slang.h
    17209a70b9b3 perf: add sgidefs.h to for mips builds
    9cd4258d910a perf: change --root to --prefix for python install
    8110a4f26628 perf: add 'libperl not found' warning
    bc89d5e08f77 perf: force include of <stdbool.h>
    4f6c760cc876 fat: Replace prandom_u32() with get_random_u32()
    bc53117b12b2 fat: don't use obsolete random32 call in namei_vfat
    30b2236ab378 FAT: Added FAT_NO_83NAME
    cef98d22b4ed FAT: Add CONFIG_VFAT_NO_CREATE_WITH_LONGNAMES option
    0bbd7daba9e1 FAT: Add CONFIG_VFAT_FS_NO_DUALNAMES option
    5883fc340084 aufs6: adapt to v6.6 i_op->ctime changes
    c4342d979bf2 aufs6: fix magic.mk include path
    35266bc2dc81 aufs6: adapt to v6.6
    8edede4e98be aufs6: core
    712248233ebe aufs6: standalone
    3b71a8a848d8 aufs6: mmap
    3e2924871f37 aufs6: base
    7f4907a93101 aufs6: kbuild
    d2f7b03e4aa7 yaffs2: update VFS ctime operations to 6.6+
    bcd6cfcd1aa0 yaffs2: v6.5 fixups
    cc615704b5f5 yaffs2: Fix miscalculation of devname buffer length
    8ef2e22dcf91 yaffs2: convert user_namespace to mnt_idmap
    c9c749f9f7d3 yaffs2: replace bdevname call with sprintf
    395b01cdc39d yaffs2: convert read_page -> readfolio
    d98b07e43ba6 yaffs: replace IS_ERR with IS_ERR_OR_NULL to check both ERR and NULL
    613c6d50fdbe yaffs: fix -Wstringop-overread compile warning in yaffs_fix_null_name
    622c4648936f yaffs2: v5.12+ build fixups (not runtime tested)
    7562133d4090 yaffs: include blkdev.h
    dbd44252cd59 yaffs: fix misplaced variable declaration
    c223a10b1ac0 yaffs2: v5.6 build fixups
    90f6007cfbf4 yaffs2: fix memory leak when /proc/yaffs is read
    37ee169c5ea1 yaffs: add strict check when call yaffs_internal_read_super
    b6e007b8abb6 yaffs: repair yaffs_get_mtd_device
    fb98f65a466a yaffs: Fix build failure by handling inode i_version with proper atomic API
    51e0aac75ea2 yaffs2: fix memory leak in mount/umount
    2b74a0cae7b0 yaffs: Avoid setting any ACL releated xattr
    ff4130a9c376 Yaffs:check oob size before auto selecting Yaffs1
    ba95b409c67c fs: yaffs2: replace CURRENT_TIME by other appropriate apis
    8fa35eba9056 yaffs2: adjust to proper location of MS_RDONLY
    1eb5deaad8c4 yaffs2: import git revision b4ce1bb (jan, 2020)
    4dce67c1e8c8 initramfs: allow an optional wrapper script around initramfs generation
    2f603d83fcc4 pnmtologo: use relocatable file name
    664a6a0a484b tools: use basename to identify file in gen-mach-types
    9de64bc0c185 lib/build_OID_registry: fix reproducibility issues
    ae9b80797295 vt/conmakehash: improve reproducibility
    a972323151bd iwlwifi: select MAC80211_LEDS conditionally
    15d2adcc0198 net/dccp: make it depend on CONFIG_BROKEN (CVE-2020-16119)
    5556a6c04b19 arm64/perf: Fix wrong cast that may cause wrong truncation
    5552dc768ffc defconfigs: drop obselete options
    00fe4152df31 arm64/perf: fix backtrace for AAPCS with FP enabled
    3888d0652edf linux-yocto: Handle /bin/awk issues
    3d55d299f23a uvesafb: provide option to specify timeout for task completion
    23c068c080be uvesafb: print error message when task timeout occurs
    edbfc939266e compiler.h: Undef before redefining __attribute_const__
    c99ae7e2a19a vmware: include jiffies.h
    572d84d928c8 Resolve jiffies wrapping about arp
    fdcd47cac843 nfs: Allow default io size to be configured.
    927d48801098 check console device file on fs when booting
    57cc27f821dd mount_root: clarify error messages for when no rootfs found
    1b53d82a8152 mconf: fix output of cflags and libraries
    1811da09f42c menuconfig,mconf-cfg: Allow specification of ncurses location
    83c2e0c6eb1f modpost: mask trivial warnings
    6de673039484 kbuild: exclude meta directory from distclean processing
    6decd32815f5 powerpc: serialize image targets
    f6b683b38318 arm: serialize build targets
    e798b09ebf57 mtd_blkdevs: add mtd_table_mutex lock back to blktrans_{open, release} to avoid race condition
    dc8a1e5a88f8 x86_64_defconfig: Fix warnings
    68491e5f72b6 powerpc/ptrace: Disable array-bounds warning with gcc8
    d71ebfce3004 powerpc: Disable attribute-alias warnings from gcc8
    62f50884b8b1 powerpc: kexec fix for powerpc64
    da6871c62c37 powerpc: Add unwind information for SPE registers of E500 core
    f161c880c11d mips: make current_cpu_data preempt safe
    5e94a8247ce7 mips: vdso: fix 'jalr $t9' crash in vdso code
    19e36714b1c7 mips: Kconfig: add QEMUMIPS64 option
    e2e537db3cbd 4kc cache tlb hazard: tlbp cache coherency
    aee9870611e5 malta uhci quirks: make allowance for slow 4k(e)c
    881948cd1517 drm/fb-helper: move zeroing code to drm_fb_helper_fill_var
    98ec1963fcb7 arm64: defconfig: cleanup config options
    f1727c537ba8 vexpress: Pass LOADADDR to Makefile
    4474c32dc24a arm: ARM EABI socketcall
    75e31a2b70fd ARM: LPAE: Invalidate the TLB for module addresses during translation fault

Signed-off-by: Bruce Ashfield <bruce.ashfield@gmail.com>
---
 .../recipes-kernel/linux/linux-yocto_6.6.bbappend  | 14 +++++++-------
 1 file changed, 7 insertions(+), 7 deletions(-)

diff --git a/meta-yocto-bsp/recipes-kernel/linux/linux-yocto_6.6.bbappend b/meta-yocto-bsp/recipes-kernel/linux/linux-yocto_6.6.bbappend
index ca7b2b09df..bf88a57770 100644
--- a/meta-yocto-bsp/recipes-kernel/linux/linux-yocto_6.6.bbappend
+++ b/meta-yocto-bsp/recipes-kernel/linux/linux-yocto_6.6.bbappend
@@ -9,16 +9,16 @@ KMACHINE:genericx86-64 ?= "common-pc-64"
 KMACHINE:beaglebone-yocto ?= "beaglebone"
 
 SRCREV_machine:genericarm64 ?= "e064a7d658a30b027b999183e21cd37305caff2a"
-SRCREV_machine:genericx86 ?= "332d4668fcc32826907d4f3c4938845206006089"
-SRCREV_machine:genericx86-64 ?= "332d4668fcc32826907d4f3c4938845206006089"
-SRCREV_machine:beaglebone-yocto ?= "332d4668fcc32826907d4f3c4938845206006089"
+SRCREV_machine:genericx86 ?= "06644f0d7193d7ec39d7fe41939a21953e7a0c65"
+SRCREV_machine:genericx86-64 ?= "06644f0d7193d7ec39d7fe41939a21953e7a0c65"
+SRCREV_machine:beaglebone-yocto ?= "06644f0d7193d7ec39d7fe41939a21953e7a0c65"
 
 COMPATIBLE_MACHINE:genericarm64 = "genericarm64"
 COMPATIBLE_MACHINE:genericx86 = "genericx86"
 COMPATIBLE_MACHINE:genericx86-64 = "genericx86-64"
 COMPATIBLE_MACHINE:beaglebone-yocto = "beaglebone-yocto"
 
-LINUX_VERSION:genericarm64 = "6.6.18"
-LINUX_VERSION:genericx86 = "6.6.15"
-LINUX_VERSION:genericx86-64 = "6.6.15"
-LINUX_VERSION:beaglebone-yocto = "6.6.15"
+LINUX_VERSION:genericarm64 = "6.6.21-116-g06644f0d7193"
+LINUX_VERSION:genericx86 = "6.6.21-116-g06644f0d7193"
+LINUX_VERSION:genericx86-64 = "6.6.21-116-g06644f0d7193"
+LINUX_VERSION:beaglebone-yocto = "6.6.21-116-g06644f0d7193"
-- 
2.39.2


