Return-Path: <steve@sakoman.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 80199C001DF
	for <webhook@archiver.kernel.org>; Fri, 20 Oct 2023 15:51:59 +0000 (UTC)
Received: from mail-pl1-f172.google.com (mail-pl1-f172.google.com [209.85.214.172])
 by mx.groups.io with SMTP id smtpd.web11.58033.1697817110073101001
 for <openembedded-core@lists.openembedded.org>;
 Fri, 20 Oct 2023 08:51:50 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@sakoman-com.20230601.gappssmtp.com header.s=20230601 header.b=gu8tnTUV;
 spf=softfail (domain: sakoman.com, ip: 209.85.214.172, mailfrom: steve@sakoman.com)
Received: by mail-pl1-f172.google.com with SMTP id d9443c01a7336-1cacde97002so3806325ad.2
        for <openembedded-core@lists.openembedded.org>; Fri, 20 Oct 2023 08:51:49 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=sakoman-com.20230601.gappssmtp.com; s=20230601; t=1697817109; x=1698421909; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=+SSUnvDQ1KoT8DV3XaTadYUR+8rEXBbHTPCAJLxiWVA=;
        b=gu8tnTUVCLEL44zBu38JQjsAnC9h5OUCGE4qq4hXy687b3CA95LbJkzdmZ1Qeq5R6z
         JGcEPZOrOFTH/6aoeJX5+PIpENDc5w7ieLrp8nY1v6ZRmeanGlI3Zd/ndRRIEUXucB5S
         RtObYqAzrBfGyBX4z8uL/r5rj6qAfomS8syTe1hywA6IBXuDjiQGUbuHVvWD1iHx8vNN
         4DWfnElgO57OHyc7t313ncskwJhaeM/su+fscGaycb8QtLYVeeGvoNw9FBRwoMaL9FrS
         YC60DD332sRC2by3AtocpjyV1DJIrlzVHlKHvt7yC/lfPH58UJfPGNWxJTKj4MUt8c/W
         M7yw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1697817109; x=1698421909;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=+SSUnvDQ1KoT8DV3XaTadYUR+8rEXBbHTPCAJLxiWVA=;
        b=J9Rapf0uIfMknNao+NQ+FhncJPfeW/OHqoq/XVkn+4qygmYhCBSMjENa4F3oIMrll3
         84uVA80ppVE/7C5CCVEE6TC+61eWN8hkyFGJS/8hYwNettdIHj7EsavhyQRc/g76Ke9x
         VghW9wjbYSl7LOKMYBpn30nZQC9BDFeIhD+jLLixptE2CatU4EjJ/5myayWPslNzreQB
         uDGAUYYcDwDUG4nnqyD8Q5h0YG57Ef66x1qD7hL0HfCzpKs6lUHdOzGMMUvYer46jhLg
         b/rQNjPxwMU6LxyFIuMbiDojd0XRtXjGzua84DWWFdWZp1Y8Ffi72wZmI+POIAwWDcXK
         HgNQ==
X-Gm-Message-State: AOJu0YyhzSg2BgC/wmJMQ0kWuv9v7zME8iMO0Q1bGZSK10B6lbpxpvjb
	hJ5dpeX3UoVLC13ZKkCQSOlmI4UneOMn/Y9tUVY=
X-Google-Smtp-Source: AGHT+IH1pKmtrx6C/7ZJgVla/lKKiexLRPfAFuVnmVqssdBFRYVp7WxpzgnvVQthcGx1URnRzxZLTA==
X-Received: by 2002:a17:902:f7cd:b0:1ca:86a9:cace with SMTP id h13-20020a170902f7cd00b001ca86a9cacemr2263381plw.2.1697817108803;
        Fri, 20 Oct 2023 08:51:48 -0700 (PDT)
Received: from hexa.router0800d9.com (dhcp-72-234-106-30.hawaiiantel.net. [72.234.106.30])
        by smtp.gmail.com with ESMTPSA id q12-20020a170902dacc00b001c71ec1866fsm1679244plx.258.2023.10.20.08.51.47
        for <openembedded-core@lists.openembedded.org>
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 20 Oct 2023 08:51:48 -0700 (PDT)
From: Steve Sakoman <steve@sakoman.com>
To: openembedded-core@lists.openembedded.org
Subject: [OE-core][mickledore 09/24] linux-yocto/6.1: update to v6.1.56
Date: Fri, 20 Oct 2023 05:51:11 -1000
Message-Id: <c7fa56add3c55d17f1b2242602d9833461e14b7c.1697816789.git.steve@sakoman.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <cover.1697816789.git.steve@sakoman.com>
References: <cover.1697816789.git.steve@sakoman.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Fri, 20 Oct 2023 15:51:59 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/189554

From: Bruce Ashfield <bruce.ashfield@gmail.com>

Updating  to the latest korg -stable release that comprises
the following commits:

    ecda77b46871 Linux 6.1.56
    8c515d4f2d66 ASoC: amd: yc: Fix a non-functional mic on Lenovo 82TL
    a3c1da448353 mm, memcg: reconsider kmem.limit_in_bytes deprecation
    b8901b6c2e9b memcg: drop kmem.limit_in_bytes
    ee335e0094ad drm/meson: fix memory leak on ->hpd_notify callback
    b60028c81e46 drm/amdkfd: Use gpu_offset for user queue's wptr
    48a22f13fb1b fs: binfmt_elf_efpic: fix personality for ELF-FDPIC
    69e61ee8ea8a power: supply: ab8500: Set typing and props
    c038ebffbb48 power: supply: rk817: Add missing module alias
    69dd84470b4d drm/i915/gt: Fix reservation address in ggtt_reserve_guc_top
    60d2e06ad6e3 ata: libata-sata: increase PMP SRST timeout to 10s
    886f387db1e6 ata: libata-core: Do not register PM operations for SAS ports
    5cfbe6da8354 ata: libata-core: Fix port and device removal
    0b7aaf2058ba ata: libata-core: Fix ata_port_request_pm() locking
    f555a508087a fs/smb/client: Reset password pointer to NULL
    1983fd78701a net: thunderbolt: Fix TCPv6 GSO checksum calculation
    4fb56e82d939 bpf: Fix BTF_ID symbol generation collision in tools/
    4f1e3e02777b bpf: Fix BTF_ID symbol generation collision
    b1041cab4726 bpf: Add override check to kprobe multi link attach
    09635bf4cdd4 media: uvcvideo: Fix OOB read
    d6a749e4cab2 btrfs: properly report 0 avail for very full file systems
    f3ad8874541d ring-buffer: Update "shortest_full" in polling
    6bacdb914a99 mm: memcontrol: fix GFP_NOFS recursion in memory.high enforcement
    a5569bb18752 mm/slab_common: fix slab_caches list corruption after kmem_cache_destroy()
    9a4fe81a8644 mm/damon/vaddr-test: fix memory leak in damon_do_test_apply_three_regions()
    68a63a077e02 arm64: defconfig: remove CONFIG_COMMON_CLK_NPCM8XX=y
    b29756aefe03 drm/tests: Fix incorrect argument in drm_test_mm_insert_range
    a90eafbf165f timers: Tag (hr)timer softirq as hotplug safe
    f32340c70eb9 Revert "SUNRPC dont update timeout value on connection reset"
    1e4c03d530d8 netfilter: nf_tables: fix kdoc warnings after gc rework
    49903f70d728 sched/rt: Fix live lock between select_fallback_rq() and RT push
    787256ec9b44 kernel/sched: Modify initial boot task idle setup
    afa2bbd682c7 ASoC: amd: yc: Fix non-functional mic on Lenovo 82QF and 82UG
    829ff08be566 i2c: i801: unregister tco_pdev in i801_probe() error path
    75c307d9f2fb io_uring/fs: remove sqe->rw_flags checking from LINKAT
    06fba8a8dea2 ata: libata-scsi: ignore reserved bits for REPORT SUPPORTED OPERATION CODES
    476fd029e700 ata: libata-scsi: link ata port and scsi device
    490f3b805ee3 LoongArch: numa: Fix high_memory calculation
    7bc8585aa071 LoongArch: Define relocation types for ABI v2.10
    f04ded9ae268 ALSA: hda: Disable power save for solving pop issue on Lenovo ThinkCentre M70q
    9af8bb2afea3 netfilter: nf_tables: disallow rule removal from chain binding
    980663f1d189 nilfs2: fix potential use after free in nilfs_gccache_submit_read_data()
    e14f68a48fd4 serial: 8250_port: Check IRQ data before use
    c61d0b87a702 Revert "tty: n_gsm: fix UAF in gsm_cleanup_mux"
    37435ddfadc6 misc: rtsx: Fix some platforms can not boot and move the l1ss judgment to probe
    5d6613ed2b7d mptcp: fix bogus receive window shrinkage with multiple subflows
    00c27bffdba6 KVM: x86/mmu: Do not filter address spaces in for_each_tdp_mmu_root_yield_safe()
    cd41db6cb285 KVM: x86/mmu: Open code leaf invalidation from mmu_notifier
    733d7a5451fc KVM: SVM: Fix TSC_AUX virtualization setup
    e86a3a622633 KVM: SVM: INTERCEPT_RDTSCP is never intercepted anyway
    6ce2f297a716 x86/srso: Add SRSO mitigation for Hygon processors
    811ba2ef0cb6 x86/sgx: Resolves SECS reclaim vs. page fault for EAUG race
    f90f4c562003 iommu/arm-smmu-v3: Fix soft lockup triggered by arm_smmu_mm_invalidate_range
    a09446ac0414 smack: Retrieve transmuting information in smack_inode_getsecurity()
    cbb16d0f4996 smack: Record transmuting in smk_transmuted
    4b8ef68e39d2 nvme-pci: always return an ERR_PTR from nvme_pci_alloc_dev
    1d7bc76b5849 scsi: qla2xxx: Fix NULL pointer dereference in target mode
    1a51d35ba729 wifi: ath11k: Don't drop tx_status when peer cannot be found
    a60768c05b58 nvme-pci: do not set the NUMA node of device if it has none
    6b2165cae403 nvme-pci: factor out a nvme_pci_alloc_dev helper
    69bc295d0e0b nvme-pci: factor the iod mempool creation into a helper
    9ebee88a8911 perf build: Define YYNOMEM as YYNOABORT for bison < 3.81
    8e85af2c682e fbdev/sh7760fb: Depend on FB=y
    f105e893a8ed LoongArch: Set all reserved memblocks on Node#0 at initialization
    146ba159f5a6 tsnep: Fix NAPI polling with budget 0
    78ac1e7dec24 tsnep: Fix NAPI scheduling
    b09c1359e4f0 net: hsr: Add __packed to struct hsr_sup_tlv.
    97788f0757bd ncsi: Propagate carrier gain/loss events to the NCSI controller
    c93aa8cfaec4 powerpc/watchpoints: Annotate atomic context in more places
    3632e9fd82d0 powerpc/watchpoint: Disable pagefaults when getting user instruction
    16722418cbe3 powerpc/watchpoints: Disable preemption in thread_change_pc()
    ee8bbb2a31d3 ASoC: SOF: Intel: MTL: Reduce the DSP init timeout
    3608be186ae5 NFSv4.1: fix zero value filehandle in post open getattr
    e9f05ae6f636 media: vb2: frame_vector.c: replace WARN_ONCE with a comment
    28c369324922 ASoC: imx-rpmsg: Set ignore_pmdown_time for dai_link
    1c88886587d3 memblock tests: fix warning ‘struct seq_file’ declared inside parameter list
    729757fe9718 memblock tests: fix warning: "__ALIGN_KERNEL" redefined
    53618d56bfe4 firmware: cirrus: cs_dsp: Only log list of algorithms in debug build
    110e6f575028 ASoC: cs42l42: Don't rely on GPIOD_OUT_LOW to set RESET initially low
    cbc43ddd5ce2 ASoC: cs42l42: Ensure a reset pulse meets minimum pulse width.
    019f01f81887 ALSA: hda: intel-sdw-acpi: Use u8 type for link index
    92f24f98d5ff bpf: Clarify error expectations from bpf_clone_redirect
    60446b5e7486 spi: intel-pci: Add support for Granite Rapids SPI serial flash
    12716449289e ASoC: fsl: imx-pcm-rpmsg: Add SNDRV_PCM_INFO_BATCH flag
    85ca138f922c spi: stm32: add a delay before SPI disable
    84592ec591be spi: nxp-fspi: reset the FLSHxCR1 registers
    d5ae9d9f0c41 ata: libata-eh: do not clear ATA_PFLAG_EH_PENDING in ata_eh_reset()
    2132ea3f9f5a smb3: correct places where ENOTSUPP is used instead of preferred EOPNOTSUPP
    2259e1901b2d scsi: pm80xx: Avoid leaking tags when processing OPC_INB_SET_CONTROLLER_CONFIG command
    82f575a7e811 scsi: pm80xx: Use phy-specific SAS address when sending PHY_START command
    6e392ff88476 riscv: errata: fix T-Head dcache.cva encoding
    91b6845ef387 drm/amdgpu: Handle null atom context in VBIOS info ioctl
    ad3c37f90bae drm/amdgpu/nbio4.3: set proper rmmio_remap.reg_offset for SR-IOV
    cca15a827907 drm/amdgpu/soc21: don't remap HDP registers for SR-IOV
    b9971393d4c9 drm/amd/display: Don't check registers, if using AUX BL control
    49bdfc83c74a thermal/of: add missing of_node_put()
    d6a68f163246 platform/x86: asus-wmi: Support 2023 ROG X16 tablet mode
    d1f916c6eb0c platform/mellanox: mlxbf-bootctl: add NET dependency into Kconfig
    dfbcef80dda9 ata: sata_mv: Fix incorrect string length computation in mv_dump_mem()
    797d75bd575c net/smc: bugfix for smcr v2 server connect success statistic
    b08a4938229d ring-buffer: Do not attempt to read past "commit"
    baa1634bc936 selftests: fix dependency checker script
    45ad79c9cb50 btrfs: assert delayed node locked when removing delayed item
    11054f0b889f ring-buffer: Avoid softlockup in ring_buffer_resize()
    a687e817d814 selftests/ftrace: Correctly enable event in instance-event.tc
    5fb322df090e scsi: ufs: core: Poll HCS.UCRDY before issuing a UIC command
    81a6cdfcfd23 scsi: ufs: core: Move __ufshcd_send_uic_cmd() outside host_lock
    843348f9e4aa scsi: qedf: Add synchronization between I/O completions and abort
    655e9d209c06 parisc: irq: Make irq_stack_union static to avoid sparse warning
    8a2c2630e18d parisc: drivers: Fix sparse warning
    60caeaf090d5 parisc: iosapic.c: Fix sparse warnings
    632e0fcf409b parisc: sba: Fix compile warning wrt list of SBA devices
    be90c9e29dd5 nvme-fc: Prevent null pointer dereference in nvme_fc_io_getuuid()
    36b29974a7ad spi: sun6i: fix race between DMA RX transfer completion and RX FIFO drain
    e15bb292b246 spi: sun6i: reduce DMA RX transfer width to single byte
    5685f8a6fae1 bpf: Annotate bpf_long_memcpy with data_race
    be8f49029eca dma-debug: don't call __dma_entry_alloc_check_leak() under free_entries_lock
    89744b649144 ceph: drop messages from MDS when unmounting
    1375d9600c38 x86/reboot: VMCLEAR active VMCSes before emergency reboot
    85fafa7ef0ac i2c: npcm7xx: Fix callback completion ordering
    0d6c2f0942c3 gpio: pmic-eic-sprd: Add can_sleep flag for PMIC EIC chip
    e578a26084eb firmware: arm_ffa: Don't set the memory region attributes for MEM_LEND
    099cfc6e5d1b arm64: dts: imx: Add imx8mm-prt8mm.dtb to build
    328efccc7847 soc: imx8m: Enable OCOTP clock for imx8mm before reading registers
    aab681bcb13a selftests/powerpc: Fix emit_tests to work with run_kselftest.sh
    763f029f8c0f selftests/powerpc: Pass make context to children
    b9dc3d6b761d selftests/powerpc: Use CLEAN macro to fix make warning
    fe6406238d5a power: supply: rk817: Fix node refcount leak
    1005010b732b xtensa: boot/lib: fix function prototypes
    6438653ad1f2 xtensa: umulsidi3: fix conditional expression
    45661247d117 xtensa: boot: don't add include-dirs
    fca1b09645e5 xtensa: iss/network: make functions static
    b4e666fa38fd xtensa: add default definition for XCHAL_HAVE_DIV32
    7cad56459964 firmware: imx-dsp: Fix an error handling path in imx_dsp_setup_channels()
    33ed60d8b961 power: supply: ucs1002: fix error code in ucs1002_get_property()
    1ec48a9fac7d bus: ti-sysc: Fix SYSC_QUIRK_SWSUP_SIDLE_ACT handling for uart wake-up
    dd19672aaac4 ARM: dts: ti: omap: motorola-mapphone: Fix abe_clkctrl warning on boot
    fe1379c0f61d ARM: dts: Unify pinctrl-single pin group nodes for omap4
    16455bed4f86 ARM: dts: Unify pwm-omap-dmtimer node names
    4ccb05618b4d ARM: dts: ti: omap: Fix bandgap thermal cells addressing for omap3/4
    fe4da07a7f1b ARM: dts: omap: correct indentation
    ea4efaf54685 clk: tegra: fix error return case for recalc_rate
    efad31b6c062 clk: sprd: Fix thm_parents incorrect configuration
    1ea6975aa68a power: supply: mt6370: Fix missing error code in mt6370_chg_toggle_cfo()
    64adb41644fc firmware: arm_scmi: Fixup perf power-cost/microwatt support
    a135c8813815 firmware: arm_scmi: Harden perf domain info access
    3a21635aed62 bus: ti-sysc: Fix missing AM35xx SoC matching
    771eb7c3f3fb bus: ti-sysc: Use fsleep() instead of usleep_range() in sysc_reset()
    e6389d61b720 drm/bridge: ti-sn65dsi83: Do not generate HFP/HBP/HSA and EOT packet
    404b8bc41872 spi: spi-gxp: BUG: Correct spi write return value
    d3dc8acb60f8 MIPS: Alchemy: only build mmc support helpers if au1xmmc is enabled
    c01b2e0ee22e vfio/mdev: Fix a null-ptr-deref bug for mdev_unregister_parent()
    cca10592ffd5 btrfs: reset destination buffer when read_extent_buffer() gets invalid range
    cdfcaa4e8043 drm/amdkfd: Insert missing TLB flush on GFX10 and later
    9becfff9f91e drm/amdkfd: Flush TLB after unmapping for GFX v9.4.3
    52c7b41ad6ee scsi: qla2xxx: Use raw_smp_processor_id() instead of smp_processor_id()
    35c02a333d52 scsi: qla2xxx: Select qpair depending on which CPU post_cmd() gets called
    3a8ac77a70cc wifi: ath11k: Cleanup mac80211 references on failure during tx_complete
    1cccd28aa591 wifi: ath11k: fix tx status reporting in encap offload mode
    dc1ab6577475 arm64: dts: qcom: sdm845-db845c: Mark cont splash memory region as reserved
    03b808058a88 s390/pkey: fix PKEY_TYPE_EP11_AES handling in PKEY_CLR2SECK2 IOCTL
    a84ac8995ac7 f2fs: get out of a repeat loop when getting a locked data page
    8b3b859bf8be f2fs: optimize iteration over sparse directories
    3134156e3421 ARM: dts: qcom: msm8974pro-castor: correct touchscreen syna,nosleep-mode
    064f57151dff ARM: dts: qcom: msm8974pro-castor: correct touchscreen function names
    21e5e3c3f71c ARM: dts: qcom: msm8974pro-castor: correct inverted X of touchscreen
    05951f5c26b4 ARM: dts: samsung: exynos4210-i9100: Fix LCD screen's physical size
    226590fbd967 ARM: dts: BCM5301X: Extend RAM to full 256MB for Linksys EA6500 V2
    70a1df9e0b44 i2c: xiic: Correct return value check for xiic_reinit()
    fb9cfb28bdde i2c: mux: gpio: Add missing fwnode_handle_put()
    976c8c1c4073 i2c: mux: demux-pinctrl: check the return value of devm_kstrdup()
    50a096aab61f gpio: tb10x: Fix an error handling path in tb10x_gpio_probe()
    908b3b5e97d2 cifs: Fix UAF in cifs_demultiplex_thread()
    7e4f49cd2bd7 proc: nommu: fix empty /proc/<pid>/maps
    1d45e6d9951d proc: nommu: /proc/<pid>/maps: release mmap read lock
    c5c9ee388723 igc: Expose tx-usecs coalesce setting to user
    cae59ae73106 octeontx2-pf: Do xdp_do_flush() after redirects.
    98ebbdefe490 bnxt_en: Flush XDP for bnxt_poll_nitroa0()'s NAPI
    26f1829c8538 net: ena: Flush XDP packets on error.
    d64e738adc5c locking/seqlock: Do the lockdep annotation before locking in do_write_seqcount_begin_nested()
    987a7f5311ba i915/pmu: Move execlist stats initialization to execlist specific setup
    ea5a61d58886 netfilter: ipset: Fix race between IPSET_CMD_CREATE and IPSET_CMD_SWAP
    c4b0facd5c20 netfilter: nf_tables: disable toggling dormant table state more than once
    51fa66024a5e net: rds: Fix possible NULL-pointer dereference
    2f0acb0736ec team: fix null-ptr-deref when team device type is changed
    89f9f20b1cbd net: bridge: use DEV_STATS_INC()
    69d7eef31ee1 net: hns3: add 5ms delay before clear firmware reset irq source
    b1b85b3d767e net: hns3: fix fail to delete tc flower rules during reset issue
    d3f7af41de52 net: hns3: only enable unicast promisc when mac table full
    ed6a0b21b6ac net: hns3: fix GRE checksum offload issue
    430f18eed1c1 net: hns3: add cmdq check for vf periodic service task
    adbcec23c842 x86/srso: Fix SBPB enablement for spec_rstack_overflow=off
    755195b2d2df x86/srso: Fix srso_show_state() side effect
    7f301aa243b9 platform/x86: intel_scu_ipc: Fail IPC send if still busy
    b34121a8fec1 platform/x86: intel_scu_ipc: Don't override scu in intel_scu_ipc_dev_simple_command()
    962444595841 platform/x86: intel_scu_ipc: Check status upon timeout in ipc_wait_for_interrupt()
    98a5a7f344fa platform/x86: intel_scu_ipc: Check status after timeout in busy_loop()
    8ef5cc6b4ef0 net: hsr: Properly parse HSRv1 supervisor frames.
    eef16bfdb212 x86/mm, kexec, ima: Use memblock_free_late() from ima_free_kexec_buffer()
    73be49248a04 dccp: fix dccp_v4_err()/dccp_v6_err() again
    c2019f0a6816 powerpc/perf/hv-24x7: Update domain value check
    5734d22c9ea0 scsi: iscsi_tcp: restrict to TCP sockets
    2712545e535d ipv4: fix null-deref in ipv4_link_failure
    54228157fb57 igc: Fix infinite initialization loop with early XDP redirect
    40b5032c9951 ionic: fix 16bit math issue when PAGE_SIZE >= 64KB
    f2c6e5945da5 netfilter, bpf: Adjust timeouts of non-confirmed CTs in bpf_ct_insert_entry()
    d98bad2998fd i40e: Fix VF VLAN offloading when port VLAN is configured
    0546cd573404 iavf: schedule a request immediately after add/delete vlan
    00bbedbd7c5a iavf: add iavf_schedule_aq_request() helper
    16fd3c37d1ca ASoC: SOF: core: Only call sof_ops_free() on remove if the probe was successful
    211aac2ef6ff iavf: do not process adminq tasks when __IAVF_IN_REMOVE_TASK is set
    65976385d49f octeon_ep: fix tx dma unmap len values in SG
    66823a9025bc ASoC: imx-audmix: Fix return error with devm_clk_get()
    ee79256b1615 ASoC: hdaudio.c: Add missing check for devm_kstrdup
    488ea2a3e266 net/core: Fix ETH_P_1588 flow dissector
    bf560c8a83ca selftests: tls: swap the TX and RX sockets in some tests
    f5a75b3d31d3 netfilter: conntrack: fix extension size table
    09424e88126e ALSA: hda/realtek: Splitting the UX3402 into two separate models
    1698854b03a5 ASoC: rt5640: Fix IRQ not being free-ed for HDA jack detect mode
    293e4920f715 ASoC: rt5640: Revert "Fix sleep in atomic context"
    e388671635ac bpf: Avoid deadlock when using queue and stack maps from NMI
    1e01b127685f netfilter: nf_tables: disallow element removal on anonymous sets
    7a7fd891022a ASoC: meson: spdifin: start hw on dai probe
    7e5d732e6902 netfilter: nf_tables: fix memleak when more than 255 elements expired
    be4fbbbcd2f2 netfilter: nft_set_hash: try later when GC hits EAGAIN on iteration
    973288e9d988 netfilter: nft_set_pipapo: stop GC iteration if GC transaction allocation fails
    8c643a8e040d netfilter: nft_set_pipapo: call nft_trans_gc_queue_sync() in catchall GC
    92b4b4bde940 netfilter: nft_set_rbtree: use read spinlock to avoid datapath contention
    9a8c544158f6 netfilter: nft_set_rbtree: skip sync GC for new elements in this transaction
    a42ac74c9666 netfilter: nf_tables: defer gc run if previous batch is still pending
    620e594be334 netfilter: nf_tables: use correct lock to protect gc_list
    5d319f7a8143 netfilter: nf_tables: GC transaction race with abort path
    afa584c35065 netfilter: nf_tables: GC transaction race with netns dismantle
    41113aa5698a netfilter: nf_tables: fix GC transaction races with netns and netlink event exit path
    59ee68c437c5 netfilter: nf_tables: don't fail inserts if duplicate has expired
    0b9af4860a61 netfilter: nf_tables: remove busy mark and gc batch API
    4ead4f74b3a9 netfilter: nft_set_hash: mark set element as dead when deleting from packet path
    df650d6a4bf4 netfilter: nf_tables: adapt set backend to use GC transaction API
    ea3eb9f2192e netfilter: nf_tables: GC transaction API to avoid race with control plane
    59dab3bf0b8f netfilter: nf_tables: don't skip expired elements during walk
    6bb88a0344c0 ext4: do not let fstrim block system suspend
    b4d5db1c77fa ext4: move setting of trimmed bit into ext4_try_to_trim_range()
    1e3c25df7d40 ext4: replace the traditional ternary conditional operator with with max()/min()
    39c4a9522db0 btrfs: remove BUG() after failure to insert delayed dir index item
    0d1a761dec22 btrfs: improve error message after failure to add delayed dir index item
    dbf1a7198505 dm: fix a race condition in retrieve_deps
    df9950d37df1 netfs: Only call folio_start_fscache() one time for each folio
    2d9757480b43 media: via: Use correct dependency for camera sensor drivers
    ae68541d5285 media: v4l: Use correct dependency for camera sensor drivers
    a997d583571b NFSv4.1: fix pnfs MDS=DS session trunking
    f86a2c2ea085 NFSv4.1: use EXCHGID4_FLAG_USE_PNFS_DS for DS server
    839e07de9a0a SUNRPC: Mark the cred for revalidation if the server rejects it
    13acbca81eee NFS/pNFS: Report EINVAL errors from connect() to the server
    edd1f0614510 NFS: More fixes for nfs_direct_write_reschedule_io()
    d4729af1c73c NFS: Use the correct commit info in nfs_join_page_group()
    1f49386d6779 NFS: More O_DIRECT accounting fixes for error paths
    4d98038e5bd9 NFS: Fix O_DIRECT locking issues
    f16fd0b11f0f NFS: Fix error handling for O_DIRECT write scheduling

Signed-off-by: Bruce Ashfield <bruce.ashfield@gmail.com>
Signed-off-by: Richard Purdie <richard.purdie@linuxfoundation.org>
(cherry picked from commit 5d66067b39e7f9d442d44d8025fe20a0fa7efba7)
Signed-off-by: Steve Sakoman <steve@sakoman.com>
---
 meta/recipes-kernel/linux/linux-yocto-rt_6.1.bb  |  4 ++--
 .../recipes-kernel/linux/linux-yocto-tiny_6.1.bb |  4 ++--
 meta/recipes-kernel/linux/linux-yocto_6.1.bb     | 16 ++++++++--------
 3 files changed, 12 insertions(+), 12 deletions(-)

diff --git a/meta/recipes-kernel/linux/linux-yocto-rt_6.1.bb b/meta/recipes-kernel/linux/linux-yocto-rt_6.1.bb
index a56addd4d5..ab6dbdb52d 100644
--- a/meta/recipes-kernel/linux/linux-yocto-rt_6.1.bb
+++ b/meta/recipes-kernel/linux/linux-yocto-rt_6.1.bb
@@ -15,12 +15,12 @@ python () {
 }
 
 SRCREV_machine ?= "4b3040c1dc13aaac356ad4ef45a8926118c732d0"
-SRCREV_meta ?= "943c6fe5dac329c7e1c30d602788f409e692b3a8"
+SRCREV_meta ?= "3b4113ce39d722191d1eb0e159976d653de4d2b2"
 
 SRC_URI = "git://git.yoctoproject.org/linux-yocto.git;branch=${KBRANCH};name=machine;protocol=https \
            git://git.yoctoproject.org/yocto-kernel-cache;type=kmeta;name=meta;branch=yocto-6.1;destsuffix=${KMETA};protocol=https"
 
-LINUX_VERSION ?= "6.1.55"
+LINUX_VERSION ?= "6.1.56"
 
 LIC_FILES_CHKSUM = "file://COPYING;md5=6bc538ed5bd9a7fc9398086aedcd7e46"
 
diff --git a/meta/recipes-kernel/linux/linux-yocto-tiny_6.1.bb b/meta/recipes-kernel/linux/linux-yocto-tiny_6.1.bb
index cb94d2d28e..29459fabed 100644
--- a/meta/recipes-kernel/linux/linux-yocto-tiny_6.1.bb
+++ b/meta/recipes-kernel/linux/linux-yocto-tiny_6.1.bb
@@ -8,7 +8,7 @@ require recipes-kernel/linux/linux-yocto.inc
 # CVE exclusions
 include recipes-kernel/linux/cve-exclusion_6.1.inc
 
-LINUX_VERSION ?= "6.1.55"
+LINUX_VERSION ?= "6.1.56"
 LIC_FILES_CHKSUM = "file://COPYING;md5=6bc538ed5bd9a7fc9398086aedcd7e46"
 
 DEPENDS += "${@bb.utils.contains('ARCH', 'x86', 'elfutils-native', '', d)}"
@@ -18,7 +18,7 @@ KMETA = "kernel-meta"
 KCONF_BSP_AUDIT_LEVEL = "2"
 
 SRCREV_machine ?= "644e73fa089ade30c0db7bd54be960be92546ba2"
-SRCREV_meta ?= "943c6fe5dac329c7e1c30d602788f409e692b3a8"
+SRCREV_meta ?= "3b4113ce39d722191d1eb0e159976d653de4d2b2"
 
 PV = "${LINUX_VERSION}+git${SRCPV}"
 
diff --git a/meta/recipes-kernel/linux/linux-yocto_6.1.bb b/meta/recipes-kernel/linux/linux-yocto_6.1.bb
index ef451efea5..21e22c887e 100644
--- a/meta/recipes-kernel/linux/linux-yocto_6.1.bb
+++ b/meta/recipes-kernel/linux/linux-yocto_6.1.bb
@@ -19,16 +19,16 @@ KBRANCH:qemumips64 ?= "v6.1/standard/mti-malta64"
 
 SRCREV_machine:qemuarm ?= "cf771f6d6bc0344e048bdbf7d23d3aacbe3556d0"
 SRCREV_machine:qemuarm64 ?= "644e73fa089ade30c0db7bd54be960be92546ba2"
-SRCREV_machine:qemuloongarch64 ?= "644e73fa089ade30c0db7bd54be960be92546ba2"
+SRCREV_machine:qemuloongarch64 ?= "f21f9d92e463bcfa7e64887f14676225144ed8d1"
 SRCREV_machine:qemumips ?= "4be1dcc270e6ddeea513af01d91ea3b48ec82470"
 SRCREV_machine:qemuppc ?= "644e73fa089ade30c0db7bd54be960be92546ba2"
-SRCREV_machine:qemuriscv64 ?= "644e73fa089ade30c0db7bd54be960be92546ba2"
-SRCREV_machine:qemuriscv32 ?= "644e73fa089ade30c0db7bd54be960be92546ba2"
-SRCREV_machine:qemux86 ?= "644e73fa089ade30c0db7bd54be960be92546ba2"
-SRCREV_machine:qemux86-64 ?= "644e73fa089ade30c0db7bd54be960be92546ba2"
+SRCREV_machine:qemuriscv64 ?= "f21f9d92e463bcfa7e64887f14676225144ed8d1"
+SRCREV_machine:qemuriscv32 ?= "f21f9d92e463bcfa7e64887f14676225144ed8d1"
+SRCREV_machine:qemux86 ?= "f21f9d92e463bcfa7e64887f14676225144ed8d1"
+SRCREV_machine:qemux86-64 ?= "f21f9d92e463bcfa7e64887f14676225144ed8d1"
 SRCREV_machine:qemumips64 ?= "aa0e978c979b84d620ad21132cfdbbf857be3878"
-SRCREV_machine ?= "644e73fa089ade30c0db7bd54be960be92546ba2"
-SRCREV_meta ?= "943c6fe5dac329c7e1c30d602788f409e692b3a8"
+SRCREV_machine ?= "f21f9d92e463bcfa7e64887f14676225144ed8d1"
+SRCREV_meta ?= "3b4113ce39d722191d1eb0e159976d653de4d2b2"
 
 # set your preferred provider of linux-yocto to 'linux-yocto-upstream', and you'll
 # get the <version>/base branch, which is pure upstream -stable, and the same
@@ -43,7 +43,7 @@ SRC_URI = "git://git.yoctoproject.org/linux-yocto.git;name=machine;branch=${KBRA
            git://git.yoctoproject.org/yocto-kernel-cache;type=kmeta;name=meta;branch=yocto-6.1;destsuffix=${KMETA};protocol=https"
 
 LIC_FILES_CHKSUM = "file://COPYING;md5=6bc538ed5bd9a7fc9398086aedcd7e46"
-LINUX_VERSION ?= "6.1.55"
+LINUX_VERSION ?= "6.1.56"
 
 PV = "${LINUX_VERSION}+git${SRCPV}"
 
-- 
2.34.1


