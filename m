Return-Path: <bruce.ashfield@gmail.com>
Received: from mail-qk1-f196.google.com (mail-qk1-f196.google.com
	[209.85.222.196])
	by mail.openembedded.org (Postfix) with ESMTP id 1A0D7616D8
	for <openembedded-core@lists.openembedded.org>;
	Fri, 21 Feb 2020 17:46:05 +0000 (UTC)
Received: by mail-qk1-f196.google.com with SMTP id c188so2595775qkg.4
	for <openembedded-core@lists.openembedded.org>;
	Fri, 21 Feb 2020 09:46:07 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=from:to:cc:subject:date:message-id:in-reply-to:references
	:mime-version:content-transfer-encoding;
	bh=V7dyF80r/NdnzwX63ItxTrIbePzYNnVjfDwvrTzvG5k=;
	b=TafR/JbvV0kAgNwgQEMLIqngjNLcXdghFGRWo3l7yHVMDZypM9vldLX3w9VW+c2OZp
	CTSG/0dRDvwXZLAyv1QATXc1LLd8wi8X5gZHZ899TOuOB6mn/0y+G3atlXLaJ/RRXBOq
	l71NPN1l/2vXNDrJMHL6douLLcZ2DMvxJHujsetBxIA7I6VOu4bgNt8/F2Lo++5r2kVU
	EiqMtvUfIj/Gt87j2TqVumHEr8cXAdMI/wVpS9hdUgP/UsrFY82XD1M7XRbFWdAzMAag
	XMD1zsOrq6EPBXDBglU1ZLlKFwvJA/v6hE8BxQpywCc9IClqNyhSkuZ03tcErrrX3Ifr
	ZOwA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
	:references:mime-version:content-transfer-encoding;
	bh=V7dyF80r/NdnzwX63ItxTrIbePzYNnVjfDwvrTzvG5k=;
	b=KCzu9erMbeifc5y4gJuywlo09HllU3MtcVl39ZzC2eCwGuaqleVxGpDwBzKhyx/35Q
	UACsKG8ZWHkeOhVzw6kVuec9/07YeTS4dqiNYLTtb6Nco139ji9m+KXoCrf+0Hg0+Sdi
	j5qYb2yXy56oU2LRzXw9881iNJLa2tckQhWkidn2LBHEaiP/tVGAEKlGMHeklqq3niAm
	NqBpJvkr23CsuLDzVoxXlgQlJJYsSHCmr2OI1BtEC1s7+QHDoai8w2DFlozvO8x4W0dQ
	xs2d3/YwbQWSM/wzAGefdZbkr3OOpCDV95Qs6NHp2ykxyChQw/O8VbO8U1Nfqxycdga3
	mX8Q==
X-Gm-Message-State: APjAAAV56FP32WicdWxjOsdfFw/a8rvAoYTQdciBwLK8WiuHawiJiJy1
	LbXrfAOhcCjDuD8DhqLp+eI=
X-Google-Smtp-Source: APXvYqzduzruWYfExFnp6OYy81sa7gNJ02xc9eA8iknhrHWNwzh5E/FlIcvE9hDi+XFQeeWh6LKViA==
X-Received: by 2002:ae9:ed41:: with SMTP id c62mr34102402qkg.403.1582307166362;
	Fri, 21 Feb 2020 09:46:06 -0800 (PST)
Received: from localhost.localdomain
	(CPEe8de27b71faa-CM64777d5e8820.cpe.net.cable.rogers.com.
	[174.113.11.95]) by smtp.gmail.com with ESMTPSA id
	g17sm1855153qtq.29.2020.02.21.09.46.05
	(version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
	Fri, 21 Feb 2020 09:46:05 -0800 (PST)
From: bruce.ashfield@gmail.com
To: richard.purdie@linuxfoundation.org
Date: Fri, 21 Feb 2020 12:45:54 -0500
Message-Id: <27db6ae5a9f4acf45ab191d8b713ee4226d177f1.1582306887.git.bruce.ashfield@gmail.com>
X-Mailer: git-send-email 2.19.1
In-Reply-To: <cover.1582306887.git.bruce.ashfield@gmail.com>
References: <cover.1582306887.git.bruce.ashfield@gmail.com>
MIME-Version: 1.0
Cc: openembedded-core@lists.openembedded.org
Subject: [PATCH 02/10] linux-yocto/5.4: update to v5.4.20
X-BeenThere: openembedded-core@lists.openembedded.org
X-Mailman-Version: 2.1.12
Precedence: list
List-Id: Patches and discussions about the oe-core layer
	<openembedded-core.lists.openembedded.org>
List-Unsubscribe: <http://lists.openembedded.org/mailman/options/openembedded-core>,
	<mailto:openembedded-core-request@lists.openembedded.org?subject=unsubscribe>
List-Archive: <http://lists.openembedded.org/pipermail/openembedded-core/>
List-Post: <mailto:openembedded-core@lists.openembedded.org>
List-Help: <mailto:openembedded-core-request@lists.openembedded.org?subject=help>
List-Subscribe: <http://lists.openembedded.org/mailman/listinfo/openembedded-core>,
	<mailto:openembedded-core-request@lists.openembedded.org?subject=subscribe>
X-List-Received-Date: Fri, 21 Feb 2020 17:46:06 -0000
Content-Transfer-Encoding: 8bit

From: Bruce Ashfield <bruce.ashfield@gmail.com>

Updating linux-yocto/5.4 to the latest korg -stable release that comprises
the following commits:

    27dfbcc2f53d Linux 5.4.20
    2d8fdc5744ff selinux: fall back to ref-walk if audit is required
    ae7f404d9227 libertas: make lbs_ibss_join_existing() return error code on rates overflow
    61087dce64a5 libertas: don't exit from lbs_ibss_join_existing() with RCU read lock held
    3c822e1f3118 mwifiex: Fix possible buffer overflows in mwifiex_cmd_append_vsie_tlv()
    c5b071e3f44d mwifiex: Fix possible buffer overflows in mwifiex_ret_wmm_get_status()
    2cf2b620af7b dmaengine: axi-dmac: add a check for devm_regmap_init_mmio
    eada328f7f9b clk: meson: g12a: fix missing uart2 in regmap table
    3cfb0b360b37 mfd: max77650: Select REGMAP_IRQ in Kconfig
    3b9586e82c90 regmap: fix writes to non incrementing registers
    4eb12ef7491d pinctrl: sh-pfc: r8a7778: Fix duplicate SDSELF_B and SD1_CLK_B
    7b07d15aa5b4 pinctrl: sh-pfc: r8a77965: Fix DU_DOTCLKIN3 drive/bias control
    875e01dd8a97 selinux: fix regression introduced by move_mount(2) syscall
    3b2e595dfe2b selinux: revert "stop passing MAY_NOT_BLOCK to the AVC upon follow_link"
    837c36e0451f bcache: avoid unnecessary btree nodes flushing in btree_flush_write()
    7c71d438e7e5 dt-bindings: iio: adc: ad7606: Fix wrong maxItems value
    d15a2930f6d7 media: i2c: adv748x: Fix unsafe macros
    30dd20c6d0e3 drivers: watchdog: stm32_iwdg: set WDOG_HW_RUNNING at probe
    8dfa11837606 crypto: caam/qi2 - fix typo in algorithm's driver name
    1f42c6de7b94 crypto: atmel-sha - fix error handling when setting hmac key
    fb42d3f4ec86 crypto: artpec6 - return correct error code for failed setkey()
    ee1c6b1aa9dc crypto: testmgr - don't try to decrypt uninitialized buffers
    771fd0b2e8bf mtd: sharpslpart: Fix unsigned comparison to zero
    1765aaef1753 mtd: onenand_base: Adjust indentation in onenand_read_ops_nolock
    7df80a021f66 arm64: nofpsmid: Handle TIF_FOREIGN_FPSTATE flag cleanly
    0ec337059d71 KVM: arm64: Treat emulated TVAL TimerValue as a signed 32-bit integer
    a17d21640453 KVM: arm64: pmu: Fix chained SW_INCR counters
    a6229d1b5c22 KVM: arm64: pmu: Don't increment SW_INCR if PMCR.E is unset
    93a509cf1182 KVM: arm: Make inject_abt32() inject an external abort instead
    9cce31930ad3 KVM: arm: Fix DFSR setting for non-LPAE aarch32 guests
    48f9ec2020b3 KVM: arm/arm64: Fix young bit from mmu notifier
    537493f1460a arm64: ptrace: nofpsimd: Fail FP/SIMD regset operations
    37014cee458c arm64: cpufeature: Set the FP/SIMD compat HWCAP bits properly
    1a2b07a2c3dd arm64: cpufeature: Fix the type of no FP/SIMD capability
    ba95651cefe1 sched/uclamp: Fix a bug in propagating uclamp value in new cgroups
    5d42957c9045 ARM: 8949/1: mm: mark free_memmap as __init
    199808393ef7 KVM: arm/arm64: vgic-its: Fix restoration of unmapped collections
    c406e5352155 ARM: at91: pm: use of_device_id array to find the proper shdwc node
    69f08f44b4c1 ARM: at91: pm: use SAM9X60 PMC's compatible
    451b91d88a1d iommu/arm-smmu-v3: Populate VMID field for CMDQ_OP_TLBI_NH_VA
    c4faf627c76e powerpc/pseries: Allow not having ibm, hypertas-functions::hcall-multi-tce for DDW
    cff30edec932 powerpc/pseries/vio: Fix iommu_table use-after-free refcount warning
    5ca556d5edfd powerpc/papr_scm: Fix leaking 'bus_desc.provider_name' in some paths
    05a23f436471 powerpc/ptdump: Only enable PPC_CHECK_WX with STRICT_KERNEL_RWX
    17f37249d7db powerpc/ptdump: Fix W+X verification call in mark_rodata_ro()
    6d7edac1469e Revert "powerpc/pseries/iommu: Don't use dma_iommu_ops on secure guests"
    45c764da005a soc: qcom: rpmhpd: Set 'active_only' for active only power domains
    0bf48acf4338 tools/power/acpi: fix compilation error
    5d3453a5660b ARM: dts: at91: sama5d3: define clock rate range for tcb1
    581a5fbf4f6d ARM: dts: at91: sama5d3: fix maximum peripheral clock rates
    8e8802c93509 ARM: dts: meson8b: use the actual frequency for the GPU's 364MHz OPP
    16665fffafee ARM: dts: meson8: use the actual frequency for the GPU's 182.1MHz OPP
    3d2d8cd29c1b arm64: dts: marvell: clearfog-gt-8k: fix switch cpu port node
    c44134c2a287 arm64: dts: renesas: r8a77990: ebisu: Remove clkout-lr-synchronous from sound
    6f9da85057c1 ARM: dts: am43xx: add support for clkout1 clock
    bd13285419b9 ARM: dts: at91: Reenable UART TX pull-ups
    d01521db86ac arm64: dts: uDPU: fix broken ethernet
    5ee40005f420 arm64: dts: qcom: msm8998: Fix tcsr syscon size
    bc684844e7e0 platform/x86: intel_mid_powerbtn: Take a copy of ddata
    b09e3d3e79cf ARC: [plat-axs10x]: Add missing multicast filter number to GMAC node
    2de1af2bcba0 watchdog: qcom: Use platform_get_irq_optional() for bark irq
    f599ae7529e6 rtc: cmos: Stop using shared IRQ
    7a3aa58c0e02 rtc: hym8563: Return -EINVAL if the time is known to be invalid
    ffad5982ce58 x86/boot: Handle malformed SRAT tables during early ACPI parsing
    f4818129947c NFSv4.0: nfs4_do_fsinfo() should not do implicit lease renewals
    cf360732f811 NFSv4: try lease recovery on NFS4ERR_EXPIRED
    5d0a6d77b69c NFSv4: pnfs_roc() must use cred_fscmp() to compare creds
    86065de0eb0a NFS: Fix fix of show_nfs_errors
    5d7030939d22 NFS/pnfs: Fix pnfs_generic_prepare_to_resend_writes()
    1ef47a06d2d4 NFS: Revalidate the file size on a fatal write error
    b7560b5b72a2 nfs: NFS_SWAP should depend on SWAP
    7842c7b30d75 bpf, sockmap: Check update requirements after locking
    45d7b0e316d9 bpf: Improve bucket_log calculation logic
    cb675fde4c44 selftests/bpf: Test freeing sockmap/sockhash with a socket in it
    1098f9696152 bpf, sockhash: Synchronize_rcu before free'ing map
    657a17ce530e bpf, sockmap: Don't sleep while holding RCU lock on tear-down
    1dfc34bd009a bpftool: Don't crash on missing xlated program instructions
    ec81471a70d1 iwlwifi: mvm: avoid use after free for pmsr request
    b706a4986382 PCI/AER: Initialize aer_fifo
    b51ac6e721d5 PCI: Don't disable bridge BARs when assigning bus resources
    67016624a0be PCI: tegra: Fix afi_pex2_ctrl reg offset for Tegra30
    df26f04f23bd PCI/switchtec: Fix vep_vector_number ioread width
    b72b8d0725b0 PCI/switchtec: Use dma_set_mask_and_coherent()
    15818c08ca79 ath10k: pci: Only dump ATH10K_MEM_REGION_TYPE_IOREG when safe
    4f0e6425a2da PCI/IOV: Fix memory leak in pci_iov_add_virtfn()
    da268240fb0a scsi: ufs: Fix ufshcd_probe_hba() reture value in case ufshcd_scsi_add_wlus() fails
    21702236f352 RDMA/umem: Fix ib_umem_find_best_pgsz()
    56b22525ab80 RDMA/cma: Fix unbalanced cm_id reference count during address resolve
    b73401025a14 RDMA/uverbs: Verify MR access flags
    78923675151e RDMA/core: Fix locking in ib_uverbs_event_read
    33daaea78a1f RDMA/i40iw: fix a potential NULL pointer dereference
    b1f90d263a3b RDMA/netlink: Do not always generate an ACK for some netlink operations
    839fb9e04cd7 IB/mlx4: Fix leak in id_map_find_del
    996dc3d50add IB/srp: Never use immediate data if it is disabled by a user
    56f5f41e80b3 IB/mlx4: Fix memory leak in add_gid error flow
    b96c27b1891b hv_sock: Remove the accept port restriction
    f7775193b643 ASoC: pcm: update FE/BE trigger order based on the command
    d6591ea2dd1a Linux 5.4.19
    866323ccc138 powerpc/kuap: Fix set direction in allow/prevent_user_access()
    3556d66be3f1 regulator fix for "regulator: core: Add regulator_is_equal() helper"
    0f51165c22e4 rxrpc: Fix service call disconnection
    743823969080 perf/core: Fix mlock accounting in perf_mmap()
    d1318034e9e9 clocksource: Prevent double add_timer_on() for watchdog_timer
    d15b033e9603 x86/apic/msi: Plug non-maskable MSI affinity race
    b64d7f7af8f9 cifs: fail i/o on soft mounts if sessionsetup errors out
    3e3e8551a5a2 KVM: Play nice with read-only memslots when querying host page size
    7426ddf01f16 KVM: Use vcpu-specific gva->hva translation when querying host page size
    09bd0033df05 KVM: nVMX: vmread should not set rflags to specify success in case of #PF
    1d6cfa003c21 KVM: x86: fix overlap between SPTE_MMIO_MASK and generation
    8a1cd01bee30 KVM: x86: Use gpa_t for cr2/gpa to fix TDP support on 32-bit KVM
    fc46f8a115e5 KVM: x86: use CPUID to locate host page table reserved bits
    f805ec37828b KVM: x86/mmu: Apply max PA check for MMIO sptes to 32-bit KVM
    59593aed7e9e drm/dp_mst: Remove VCPI while disabling topology mgr
    498742625716 btrfs: free block groups after free'ing fs trees
    26ca39ac5593 btrfs: use bool argument in free_root_pointers()
    d0d327fe37cc x86/timer: Don't skip PIT setup when APIC is disabled or in legacy mode
    8fbabd15bdbc mfd: bd70528: Fix hour register mask
    555b3025e8fa mfd: rn5t618: Mark ADC control register volatile
    3cf5733a2db7 mfd: da9062: Fix watchdog compatible string
    9af68afd832f ASoC: Intel: skl_hda_dsp_common: Fix global-out-of-bounds bug
    207014751cd1 net/mlx5: Deprecate usage of generic TLS HW capability bit
    70b68add8d65 net/mlx5: Fix deadlock in fs_core
    0fea83e06f12 drop_monitor: Do not cancel uninitialized work item
    2b2de489c823 qed: Fix timestamping issue for L2 unicast ptp packets.
    036ecba2eb99 ipv6/addrconf: fix potential NULL deref in inet6_set_link_af()
    7fd6c4da37d4 taprio: Fix dropping packets when using taprio + ETF offloading
    a5b959885c45 taprio: Use taprio_reset_tc() to reset Traffic Classes configuration
    ee6adcf2c318 taprio: Add missing policy validation for flags
    d544302521af taprio: Fix still allowing changing the flags during runtime
    47578c894979 taprio: Fix enabling offload with wrong number of traffic classes
    4c4153375b67 net: macb: Limit maximum GEM TX length in TSO
    96ad794892e7 net: macb: Remove unnecessary alignment check for TSO
    9211b26dcfee net/mlx5: IPsec, fix memory leak at mlx5_fpga_ipsec_delete_sa_ctx
    0be678f179e0 net/mlx5: IPsec, Fix esp modify function attribute
    74888191bb13 net: systemport: Avoid RBUF stuck in Wake-on-LAN mode
    8526c3b6e753 net: stmmac: fix a possible endless loop
    ebf9cdfbcd38 net_sched: fix a resource leak in tcindex_set_parms()
    6994d92ed59a net: mvneta: move rx_dropped and rx_errors in per-cpu stats
    76e828ceafee net: dsa: microchip: enable module autoprobe
    07d7fcb1dd29 net: dsa: bcm_sf2: Only 7278 supports 2Gb/sec IMP port
    84e4db766fc6 net: dsa: b53: Always use dev->vlan_enabled in b53_configure_vlan()
    fddb5a50801a dpaa_eth: support all modes with rate adapting PHYs
    3f90dce11916 devlink: report 0 after hitting end in region read
    6978e2935c74 bonding/alb: properly access headers in bond_alb_xmit()
    0a56a2e1624a ASoC: sgtl5000: Fix VDDA and VDDIO comparison
    67d5b7a1f971 regulator: core: Add regulator_is_equal() helper
    c533cf50fdf6 ubifs: Fix memory leak from c->sup_node
    fa70d4f7f8e0 ubi: Fix an error pointer dereference in error handling code
    6f362620793b ubi: fastmap: Fix inverted logic in seen selfcheck
    c6d07f6e50e4 virtio_balloon: Fix memory leaks on errors in virtballoon_probe()
    3ac13462f55a virtio-balloon: Fix memory leak when unloading while hinting is in progress
    7eece787ed82 nfsd: Return the correct number of bytes written to the file
    e94829641e69 nfsd: fix jiffies/time_t mixup in LRU list
    9f3fa8bea96d nfsd: fix delay timer on 32-bit architectures
    0d1dacfda0e5 IB/core: Fix ODP get user pages flow
    320a24fae280 IB/mlx5: Fix outstanding_pi index for GSI qps
    b4d104ce6dfe net: tulip: Adjust indentation in {dmfe, uli526x}_init_module
    9b14bd934ce3 net: smc911x: Adjust indentation in smc911x_phy_configure
    761b51409246 ppp: Adjust indentation into ppp_async_input
    bd1bac782d92 NFC: pn544: Adjust indentation in pn544_hci_check_presence
    da535ca18ef5 drm: msm: mdp4: Adjust indentation in mdp4_dsi_encoder_enable
    bf45386cef7e powerpc/44x: Adjust indentation in ibm4xx_denali_fixup_memsize
    0a7473b27eb9 ext2: Adjust indentation in ext2_fill_super
    421b77ae26f4 phy: qualcomm: Adjust indentation in read_poll_timeout
    55a268cf341f mtd: spi-nor: Split mt25qu512a (n25q512a) entry into two
    3c9edf55817a scsi: ufs: Recheck bkops level if bkops is disabled
    5f8c02d32223 scsi: qla4xxx: Adjust indentation in qla4xxx_mem_free
    bdc7651e6164 scsi: csiostor: Adjust indentation in csio_device_reset
    454db8d6163b scsi: qla2xxx: Fix the endianness of the qla82xx_get_fw_size() return type
    05dceb5a62ce ASoC: meson: axg-fifo: fix fifo threshold setup
    7c662f69fa05 percpu: Separate decrypted varaibles anytime encryption can be enabled
    59c458d51099 broken ping to ipv6 linklocal addresses on debian buster
    07fbef9a6e18 fix up iter on short count in fuse_direct_io()
    e0fc65ef8a60 virtio-pci: check name when counting MSI-X vectors
    f603b3714e4e virtio-balloon: initialize all vq callbacks
    fe84d084b2e9 drm/amd/dm/mst: Ignore payload update failures
    f4bda8b61e7c clk: tegra: Mark fuse clock as critical
    806cabd3117f mm/mmu_gather: invalidate TLB correctly on batch allocation failure and flush
    091c96151279 arm64: dts: qcom: qcs404-evb: Set vdd_apc regulator in high power mode
    ed53278ee834 mm/page_alloc.c: fix uninitialized memmaps on a partially populated last section
    03c03090c3aa ocfs2: fix oops when writing cloned file
    6e41b5499960 KVM: s390: do not clobber registers during guest reset/store status
    b1f9f9b84374 KVM: x86: Revert "KVM: X86: Fix fpu state crash in kvm guest"
    58e1e7514f06 KVM: x86: Ensure guest's FPU state is loaded when accessing for emulation
    a6ff6e0546d0 KVM: x86: Handle TIF_NEED_FPU_LOAD in kvm_{load,put}_guest_fpu()
    e3a37628c46d KVM: x86: Free wbinvd_dirty_mask if vCPU creation fails
    9d9933f7f3f4 KVM: x86: Don't let userspace set host-reserved cr4 bits
    715f9f9a0768 KVM: VMX: Add non-canonical check on writes to RTIT address MSRs
    2aebc6ed84ef x86/KVM: Clean up host's steal time structure
    f7c1a6c67ff3 x86/kvm: Cache gfn to pfn translation
    d71eef9fcc0b x86/KVM: Make sure KVM_VCPU_FLUSH_TLB flag is not missed
    a3db2949904b x86/kvm: Introduce kvm_(un)map_gfn()
    68460ceba319 x86/kvm: Be careful not to clear KVM_VCPU_FLUSH_TLB bit
    d0671151c2b9 kvm/svm: PKU not currently supported
    9213699efd1f KVM: PPC: Book3S PR: Free shared page if mmu initialization fails
    b2301deda8ce KVM: PPC: Book3S HV: Uninit vCPU if vcore creation fails
    0718e2d3dc54 KVM: x86: Fix potential put_fpu() w/o load_fpu() on MPX platform
    72324a1db6a1 KVM: x86: Protect MSR-based index computations in fixed_msr_to_seg_unit() from Spectre-v1/L1TF attacks
    2fb35312c070 KVM: x86: Protect x86_decode_insn from Spectre-v1/L1TF attacks
    f2a514318263 KVM: x86: Protect MSR-based index computations from Spectre-v1/L1TF attacks in x86.c
    a07fdd5fcb30 KVM: x86: Protect ioapic_read_indirect() from Spectre-v1/L1TF attacks
    c09be769b48d KVM: x86: Protect MSR-based index computations in pmu.h from Spectre-v1/L1TF attacks
    2f8a13754e05 KVM: x86: Protect ioapic_write_indirect() from Spectre-v1/L1TF attacks
    c8a6b5918942 KVM: x86: Protect kvm_hv_msr_[get|set]_crash_data() from Spectre-v1/L1TF attacks
    bf13472e5c05 KVM: x86: Protect kvm_lapic_reg_write() from Spectre-v1/L1TF attacks
    8b73ccf4b475 KVM: x86: Protect DR-based index computations from Spectre-v1/L1TF attacks
    c2b02d093a08 KVM: x86: Protect pmu_intel.c from Spectre-v1/L1TF attacks
    79777eb82c23 KVM: x86: Refactor prefix decoding to prevent Spectre-v1/L1TF attacks
    443fd0049dcf KVM: x86: Refactor picdev_write() to prevent Spectre-v1/L1TF attacks
    8dcbf26833cc aio: prevent potential eventfd recursion on poll
    844d2025b68d eventfd: track eventfd_signal() recursion depth
    d5d6b5887241 bcache: add readahead cache policy options via sysfs interface
    f158399c1fe9 watchdog: fix UAF in reboot notifier handling in watchdog core code
    c157da57304e xen/balloon: Support xend-based toolstack take two
    726599c63799 tools/kvm_stat: Fix kvm_exit filter name
    7a19bd6fe21b media: rc: ensure lirc is initialized before registering input device
    fd52d88c1dd8 media: iguanair: fix endpoint sanity check
    ae116f21b24a drm/rect: Avoid division by zero
    5b442859ab80 drm: atmel-hlcdc: prefer a lower pixel-clock than requested
    d065ae83dff8 drm: atmel-hlcdc: enable clock before configuring timing engine
    6421785d17e1 drm: atmel-hlcdc: use double rate for pixel clock only if supported
    ae35ac3c4b08 gfs2: fix O_SYNC write handling
    637348690865 gfs2: move setting current->backing_dev_info
    c61b93fae603 gfs2: fix gfs2_find_jhead that returns uninitialized jhead with seq 0
    65afa6958134 sunrpc: expiry_time should be seconds not timeval
    301763168c5f mwifiex: fix unbalanced locking in mwifiex_process_country_ie()
    535a755d6e6d iwlwifi: don't throw error when trying to remove IGTK
    cbe53807a14d ARM: tegra: Enable PLLP bypass during Tegra124 LP1
    9e78c0e74261 btrfs: Correctly handle empty trees in find_first_clear_extent_bit
    d82ff2d6406d btrfs: flush write bio if we loop in extent_write_cache_pages
    5e7a9ad78d56 Btrfs: fix race between adding and putting tree mod seq elements and nodes
    ce066845584a btrfs: drop log root for dropped roots
    7baf8f665b77 btrfs: set trans->drity in btrfs_commit_transaction
    78748f249199 Btrfs: fix infinite loop during fsync after rename operations
    79a29dee9024 Btrfs: make deduplication with range including the last block work
    ddb36ab79b11 Btrfs: fix missing hole after hole punching and fsync when using NO_HOLES
    f0edd3abee0d ext4: fix race conditions in ->d_compare() and ->d_hash()
    d44fa04f0864 ext4: fix deadlock allocating crypto bounce page from mempool
    b19f130269c0 jbd2_seq_info_next should increase position index
    6282102dbcbf nfsd: fix filecache lookup
    4544a6912416 NFS: Directory page cache pages need to be locked when read
    293cdcd89b6c NFS: Fix memory leaks and corruption in readdir
    8d313c04b425 scsi: qla2xxx: Fix unbound NVME response length
    246a54895ac6 powerpc/futex: Fix incorrect user access blocking
    eee7a67c0391 crypto: picoxcell - adjust the position of tasklet_init and fix missed tasklet_kill
    e057d64f86d4 crypto: api - Fix race condition in crypto_spawn_alg
    12a15e1c544e crypto: atmel-aes - Fix counter overflow in CTR mode
    2c4d8203ff0c crypto: pcrypt - Do not clear MAY_SLEEP flag in original request
    ded7c73a2b8c crypto: arm64/ghash-neon - bump priority to 150
    3a35871603a6 crypto: ccp - set max RSA modulus size for v3 platform devices as well
    58d8f2dec6ab crypto: hisilicon - Use the offset fields in sqe to avoid need to split scatterlists
    a791fc62a574 crypto: api - fix unexpectedly getting generic implementation
    1f5f3f65f956 selftests: bpf: Ignore FIN packets for reuseport tests
    44a522bf5edc selftests: bpf: Use a temporary file in test_sockmap
    da43712a7262 selftests/bpf: Skip perf hw events test if the setup disabled it
    49437ecf9f30 selftests/bpf: Fix test_attach_probe
    c0ada6ad3ec5 samples/bpf: Xdp_redirect_cpu fix missing tracepoint attach
    a69af866bd35 samples/bpf: Don't try to remove user's homedir on clean
    fbee8f61747f tc-testing: fix eBPF tests failure on linux fresh clones
    f7a2ccc00a36 libbpf: Fix realloc usage in bpf_core_find_cands
    ab48c14a444b bpf, devmap: Pass lockdep expression to RCU lists
    77bb53cb0948 selftests/bpf: Fix perf_buffer test on systems w/ offline CPUs
    5b0e9b563c01 riscv, bpf: Fix broken BPF tail calls
    f3107a3c9b84 btrfs: Handle another split brain scenario with metadata uuid feature
    dd9837259de0 btrfs: fix improper setting of scanned for range cyclic write cache pages
    b4c8ed0bf977 crypto: pcrypt - Avoid deadlock by using per-instance padata queues
    c8e9dafe668d ftrace: Protect ftrace_graph_hash with ftrace_sync
    6a652ed941aa ftrace: Add comment to why rcu_dereference_sched() is open coded
    c9dc142b39a8 tracing: Annotate ftrace_graph_notrace_hash pointer with __rcu
    024537c7548f tracing: Annotate ftrace_graph_hash pointer with __rcu
    df57920d6e18 ASoC: SOF: core: release resources on errors in probe_continue
    3145862d8f9e ASoC: SOF: Introduce state machine for FW boot
    0b84591fdd5e scsi: qla2xxx: Fix stuck login session using prli_pend_timer
    78cbd2c397bf dm: fix potential for q->make_request_fn NULL pointer
    1426201af047 dm thin metadata: use pool locking at end of dm_pool_metadata_close
    40d3d8d6eb64 dm crypt: fix benbi IV constructor crash if used in authenticated mode
    b805ec7d089f dm crypt: fix GFP flags passed to skcipher_request_alloc()
    1781fa54a4ea dm writecache: fix incorrect flush sequence when doing SSD mode commit
    a8d99d630117 dm space map common: fix to ensure new block isn't already in use
    188f9b710ff1 dm zoned: support zone sizes smaller than 128MiB
    ad7c38abe8ba ARM: dma-api: fix max_pfn off-by-one error in __dma_supported()
    bae74e7ac842 of: Add OF_DMA_DEFAULT_COHERENT & select it on powerpc
    f5f68d165dc0 cpufreq: Avoid creating excessively large stack frames
    7dce99d3182a PM: core: Fix handling of devices deleted during system-wide resume
    e9116299ffac f2fs: fix race conditions in ->d_compare() and ->d_hash()
    6d722cd2e387 f2fs: fix dcache lookup of !casefolded directories
    f4803553aae6 f2fs: code cleanup for f2fs_statfs_project()
    b1de9ec0e788 f2fs: fix miscounted block limit in f2fs_statfs_project()
    ae2cb41583a9 f2fs: choose hardlimit when softlimit is larger than hardlimit in f2fs_statfs_project()
    08846286bf28 ovl: fix lseek overflow on 32bit
    809e16a6eeb3 ovl: fix wrong WARN_ON() in ovl_cache_update_ino()
    03572189d61c power: supply: ltc2941-battery-gauge: fix use-after-free
    6f33d59ae165 power: supply: axp20x_ac_power: Fix reporting online status
    4eed5d3bb14a cpupower: Revert library ABI changes from commit ae2917093fb60bdc1ed3e
    2b27acfde9b2 scsi: qla2xxx: Fix mtcp dump collection failure
    edd15b154653 scsi: megaraid_sas: Do not initiate OCR if controller is not in ready state
    3728834fff19 erofs: fix out-of-bound read for shifted uncompressed block
    3ebbfdf41d26 scripts/find-unused-docs: Fix massive false positives
    a421f513779c fs: allow deduplication of eof block into the end of the destination file
    5fefc9b3e358 padata: Remove broken queue flushing
    5f63963669ec crypto: ccree - fix PM race condition
    5e33535cf13c crypto: ccree - fix FDE descriptor sequence
    d8760030e701 crypto: ccree - fix pm wrongful error reporting
    70439e8b7ccf crypto: ccree - fix AEAD decrypt auth fail
    80c660892c24 crypto: ccree - fix backlog memory leak
    d2b1dcd5430f crypto: api - Check spawn->alg under lock in crypto_drop_spawn
    0ed43162f578 nvmem: core: fix memory abort in cleanup path
    6bdd1a0ed111 mfd: axp20x: Mark AXP20X_VBUS_IPSOUT_MGMT as volatile
    385c61a41cf9 hv_balloon: Balloon up according to request page number
    570a29b1f75b ASoC: SOF: core: free trace on errors
    84c9efd2f855 mmc: sdhci-of-at91: fix memleak on clk_get failure
    65e6f63ebfb9 ubifs: Fix deadlock in concurrent bulk-read and writepage
    e3a561aa5376 ubifs: Fix FS_IOC_SETFLAGS unexpectedly clearing encrypt flag
    91f96a9cdd82 ubifs: Fix wrong memory allocation
    0119c617ebb6 ubifs: don't trigger assertion on invalid no-key filename
    9220bf17ae18 fscrypt: don't print name of busy file when removing key
    ad270734193e alarmtimer: Unregister wakeup source when module get fails
    05b147599f9d ACPI / battery: Deal better with neither design nor full capacity not being reported
    7b86d05d1b02 ACPI / battery: Use design-cap for capacity calculations if full-cap is not available
    93bba324c28a ACPI / battery: Deal with design or full capacity being reported as -1
    832d6f76f268 ACPI: video: Do not export a non working backlight interface on MSI MS-7721 boards
    44f6e43924f8 mmc: spi: Toggle SPI polarity, do not hardcode it
    47bdd025b921 PCI: keystone: Fix error handling when "num-viewport" DT property is not populated
    a8b56e222300 PCI: keystone: Fix link training retries initiation
    6700c0d9ae92 PCI: keystone: Fix outbound region mapping
    05d56da81d94 PCI: tegra: Fix return value check of pm_runtime_get_sync()
    38b67e60b6b5 tracing: Fix now invalid var_ref_vals assumption in trace action
    5b92f86c8492 powerpc/32s: Fix CPU wake-up from sleep mode
    4135a03fdf2e powerpc/32s: Fix bad_kuap_fault()
    1bd3b871af57 powerpc/pseries: Advance pfn if section is not present in lmb_is_removable()
    02c4699fb664 powerpc/xmon: don't access ASDR in VMs
    796085dbe323 powerpc/ptdump: Fix W+X verification
    2cabe61ab8ae powerpc/mmu_gather: enable RCU_TABLE_FREE even for !SMP case
    63098a93063a s390/mm: fix dynamic pagetable upgrade for hugetlbfs
    e25f00c69039 MIPS: boot: fix typo in 'vmlinux.lzma.its' target
    bd9abdfd68b2 MIPS: fix indentation of the 'RELOCS' message
    6b29d4a1f832 MIPS: syscalls: fix indentation of the 'SYSNR' message
    6cca9100db90 KVM: arm64: Only sign-extend MMIO up to register width
    4dd5c62d2e4c KVM: arm/arm64: Correct AArch32 SPSR on exception entry
    b0e01e9d2353 KVM: arm/arm64: Correct CPSR on exception entry
    cc7931dc766f KVM: arm64: Correct PSTATE on exception entry
    5222ded5c72c arm64: acpi: fix DAIF manipulation with pNMI
    79c56db06547 ALSA: hda: Add JasperLake PCI ID and codec vid
    3d938d9febd1 ALSA: hda: Add Clevo W65_67SB the power_save blacklist
    6cb7581f5702 ALSA: hda: Apply aligned MMIO access only conditionally
    68efc422c547 platform/x86: intel_scu_ipc: Fix interrupt support
    5bf25f3828a2 x86/cpu: Update cached HLE state on write to TSX_CTRL_CPUID_CLEAR
    146f086a409b irqdomain: Fix a memory leak in irq_domain_push_irq()
    db165906cad5 lib/test_kasan.c: fix memory leak in kmalloc_oob_krealloc_more()
    9cbcbfc67b25 media: v4l2-rect.h: fix v4l2_rect_map_inside() top/left adjustments
    965ccdedf1bf media: v4l2-core: compat: ignore native command codes
    d2db1cbc751f media/v4l2-core: set pages dirty upon releasing DMA buffers
    d364e9b37cc9 mm: move_pages: report the number of non-attempted pages
    95419e7ef266 mm: thp: don't need care deferred split queue in memcg charge move path
    aab4189dfdb1 mm/memory_hotplug: fix remove_memory() lockdep splat
    cb33e477a50b utimes: Clamp the timestamps in notify_change()
    73031a617ac3 mmc: sdhci-pci: Make function amd_sdhci_reset static
    af823232b018 mm/sparse.c: reset section's mem_map when fully deactivated
    c2c814fc9aee memcg: fix a crash in wb_workfn when a device disappears
    39fac95159b4 ALSA: dummy: Fix PCM format loop in proc output
    6edf790e9e51 ALSA: usb-audio: Annotate endianess in Scarlett gen2 quirk
    85dbab63b461 ALSA: usb-audio: Fix endianess in descriptor validation
    2068fbb20b9f usb: gadget: f_ecm: Use atomic_t to track in-flight request
    a7d00597e0b7 usb: gadget: f_ncm: Use atomic_t to track in-flight request
    683b53b5aa12 usb: gadget: legacy: set max_speed to super-speed
    063daad1412e usb: gadget: f_fs: set req->num_sgs as 0 for non-sg transfer
    47dbff795049 objtool: Silence build output
    72a533fc29e1 usb: typec: tcpci: mask event interrupts when remove driver
    91cfedb762bd usb: dwc3: gadget: Delay starting transfer
    1dc0d21fc1e6 usb: dwc3: gadget: Check END_TRANSFER completion
    4e5d1bf6e68f brcmfmac: Fix memory leak in brcmf_usbdev_qinit
    1c8c75275f97 Bluetooth: btusb: Disable runtime suspend on Realtek devices
    1bfecb50771d Bluetooth: btusb: fix memory leak on fw
    21780d1fd65b nvmet: Fix controller use after free
    6243cb9e32d2 nvmet: Fix error print message at nvmet_install_queue function
    6a4fea54ab46 rcu: Use READ_ONCE() for ->expmask in rcu_read_unlock_special()
    c71706a5ffff srcu: Apply *_ONCE() to ->srcu_last_gp_end
    dcad7270b2c7 rcu: Avoid data-race in rcu_gp_fqs_check_wake()
    a523031513b7 rcu: Use *_ONCE() to protect lockless ->expmask accesses
    d42b2370f28a tracing: Fix sched switch start/stop refcount racy updates
    e39351c52efb tracing/kprobes: Have uname use __get_str() in print_fmt
    59b2e64b16bb ipc/msg.c: consolidate all xxxctl_down() functions
    8ce07d95d67a netfilter: ipset: fix suspicious RCU usage in find_set_and_id
    7bad0dda8164 mfd: dln2: More sanity checking for endpoints
    6fcbff54ded1 media: uvcvideo: Avoid cyclic entity chains due to malformed USB descriptors
    9f5c4fac341c bnxt_en: Fix logic that disables Bus Master during firmware reset.
    fddd3f73ad08 netdevsim: fix stack-out-of-bounds in nsim_dev_debugfs_init()
    f146529c0049 MAINTAINERS: correct entries for ISDN/mISDN section
    096df4720ab6 ionic: fix rxq comp packet type mask
    b6a7ba0e8622 tcp: clear tp->segs_{in|out} in tcp_disconnect()
    31fceaf08597 tcp: clear tp->data_segs{in|out} in tcp_disconnect()
    2fc4773b6af7 tcp: clear tp->delivered in tcp_disconnect()
    c9b6c6d07e5c tcp: clear tp->total_retrans in tcp_disconnect()
    269a3c472a6f rxrpc: Fix NULL pointer deref due to call->conn being cleared on disconnect
    843e115de475 rxrpc: Fix missing active use pinning of rxrpc_local object
    524cba2f8de5 rxrpc: Fix insufficient receive notification generation
    62221a9b1c9a rxrpc: Fix use-after-free in rxrpc_put_local()
    5fa06c956821 bnxt_en: Fix TC queue mapping.
    8566221e46eb net: stmmac: Delete txtimer in suspend()
    dd8142a6fa52 net_sched: fix an OOB access in cls_tcindex
    919f13c56485 net: hsr: fix possible NULL deref in hsr_handle_frame()
    f3dea4cea67a l2tp: Allow duplicate session creation with UDP
    b080bc8481d9 gtp: use __GFP_NOWARN to avoid memalloc warning
    0f8f0429a299 cls_rsvp: fix rsvp_policy
    097ef8be69a3 bnxt_en: Move devlink_register before registering netdev
    aaf5369c72e9 sparc32: fix struct ipc64_perm type definition

Signed-off-by: Bruce Ashfield <bruce.ashfield@gmail.com>
---
 .../linux/linux-yocto-rt_5.4.bb               |  6 ++---
 .../linux/linux-yocto-tiny_5.4.bb             |  8 +++----
 meta/recipes-kernel/linux/linux-yocto_5.4.bb  | 22 +++++++++----------
 3 files changed, 18 insertions(+), 18 deletions(-)

diff --git a/meta/recipes-kernel/linux/linux-yocto-rt_5.4.bb b/meta/recipes-kernel/linux/linux-yocto-rt_5.4.bb
index 5901ba4c47..fc31dc869a 100644
--- a/meta/recipes-kernel/linux/linux-yocto-rt_5.4.bb
+++ b/meta/recipes-kernel/linux/linux-yocto-rt_5.4.bb
@@ -11,13 +11,13 @@ python () {
         raise bb.parse.SkipRecipe("Set PREFERRED_PROVIDER_virtual/kernel to linux-yocto-rt to enable it")
 }
 
-SRCREV_machine ?= "d8831a265698a000bb7305e0234dcaa302cf25a5"
-SRCREV_meta ?= "6c39661411aaa83f23b5a0b35da193ae819e7428"
+SRCREV_machine ?= "a9334277f632a96eca9d037e9bc077a855d0908d"
+SRCREV_meta ?= "c11911d4d1cf0d0b069dfd1922b41256f61442de"
 
 SRC_URI = "git://git.yoctoproject.org/linux-yocto.git;branch=${KBRANCH};name=machine \
            git://git.yoctoproject.org/yocto-kernel-cache;type=kmeta;name=meta;branch=yocto-5.4;destsuffix=${KMETA}"
 
-LINUX_VERSION ?= "5.4.18"
+LINUX_VERSION ?= "5.4.20"
 
 LIC_FILES_CHKSUM = "file://COPYING;md5=bbea815ee2795b2f4230826c0c6b8814"
 
diff --git a/meta/recipes-kernel/linux/linux-yocto-tiny_5.4.bb b/meta/recipes-kernel/linux/linux-yocto-tiny_5.4.bb
index 9a18c63c94..cfecf986fb 100644
--- a/meta/recipes-kernel/linux/linux-yocto-tiny_5.4.bb
+++ b/meta/recipes-kernel/linux/linux-yocto-tiny_5.4.bb
@@ -6,7 +6,7 @@ KCONFIG_MODE = "--allnoconfig"
 
 require recipes-kernel/linux/linux-yocto.inc
 
-LINUX_VERSION ?= "5.4.18"
+LINUX_VERSION ?= "5.4.20"
 LIC_FILES_CHKSUM = "file://COPYING;md5=bbea815ee2795b2f4230826c0c6b8814"
 
 DEPENDS += "${@bb.utils.contains('ARCH', 'x86', 'elfutils-native', '', d)}"
@@ -15,9 +15,9 @@ DEPENDS += "openssl-native util-linux-native"
 KMETA = "kernel-meta"
 KCONF_BSP_AUDIT_LEVEL = "2"
 
-SRCREV_machine_qemuarm ?= "e144b0946f1a159a8b5770f1fcedaebf8eadac84"
-SRCREV_machine ?= "2b9d420a9eef51b0f3bd7471b2a2cc442c367a12"
-SRCREV_meta ?= "6c39661411aaa83f23b5a0b35da193ae819e7428"
+SRCREV_machine_qemuarm ?= "3805e4f98313c4a4c64ffdb06b6401de8746fe45"
+SRCREV_machine ?= "2358d789229f8d80ebe4b3e35d3819c4f0e00926"
+SRCREV_meta ?= "c11911d4d1cf0d0b069dfd1922b41256f61442de"
 
 PV = "5.4.15"
 
diff --git a/meta/recipes-kernel/linux/linux-yocto_5.4.bb b/meta/recipes-kernel/linux/linux-yocto_5.4.bb
index eea4f2045b..aa17380d00 100644
--- a/meta/recipes-kernel/linux/linux-yocto_5.4.bb
+++ b/meta/recipes-kernel/linux/linux-yocto_5.4.bb
@@ -12,16 +12,16 @@ KBRANCH_qemux86  ?= "v5.4/standard/base"
 KBRANCH_qemux86-64 ?= "v5.4/standard/base"
 KBRANCH_qemumips64 ?= "v5.4/standard/mti-malta64"
 
-SRCREV_machine_qemuarm ?= "ab36b8853718cf0c92d6c37a62568d34424234e8"
-SRCREV_machine_qemuarm64 ?= "2b9d420a9eef51b0f3bd7471b2a2cc442c367a12"
-SRCREV_machine_qemumips ?= "f9d6dd093282ef21a11d170660bb06ec81908836"
-SRCREV_machine_qemuppc ?= "2b9d420a9eef51b0f3bd7471b2a2cc442c367a12"
-SRCREV_machine_qemuriscv64 ?= "2b9d420a9eef51b0f3bd7471b2a2cc442c367a12"
-SRCREV_machine_qemux86 ?= "2b9d420a9eef51b0f3bd7471b2a2cc442c367a12"
-SRCREV_machine_qemux86-64 ?= "2b9d420a9eef51b0f3bd7471b2a2cc442c367a12"
-SRCREV_machine_qemumips64 ?= "8b16e493669ee19054a6407d331da75a32ed45b2"
-SRCREV_machine ?= "2b9d420a9eef51b0f3bd7471b2a2cc442c367a12"
-SRCREV_meta ?= "6c39661411aaa83f23b5a0b35da193ae819e7428"
+SRCREV_machine_qemuarm ?= "0eb0f3620fc93699d1d8adafa2b07174733c7c98"
+SRCREV_machine_qemuarm64 ?= "2358d789229f8d80ebe4b3e35d3819c4f0e00926"
+SRCREV_machine_qemumips ?= "933d80248406c58efdfe32d130479f59d56727be"
+SRCREV_machine_qemuppc ?= "2358d789229f8d80ebe4b3e35d3819c4f0e00926"
+SRCREV_machine_qemuriscv64 ?= "2358d789229f8d80ebe4b3e35d3819c4f0e00926"
+SRCREV_machine_qemux86 ?= "2358d789229f8d80ebe4b3e35d3819c4f0e00926"
+SRCREV_machine_qemux86-64 ?= "2358d789229f8d80ebe4b3e35d3819c4f0e00926"
+SRCREV_machine_qemumips64 ?= "db201874e886742eb7a5adf450f5be1293fb83c2"
+SRCREV_machine ?= "2358d789229f8d80ebe4b3e35d3819c4f0e00926"
+SRCREV_meta ?= "c11911d4d1cf0d0b069dfd1922b41256f61442de"
 
 # remap qemuarm to qemuarma15 for the 5.4 kernel
 # KMACHINE_qemuarm ?= "qemuarma15"
@@ -30,7 +30,7 @@ SRC_URI = "git://git.yoctoproject.org/linux-yocto.git;name=machine;branch=${KBRA
            git://git.yoctoproject.org/yocto-kernel-cache;type=kmeta;name=meta;branch=yocto-5.4;destsuffix=${KMETA}"
 
 LIC_FILES_CHKSUM = "file://COPYING;md5=bbea815ee2795b2f4230826c0c6b8814"
-LINUX_VERSION ?= "5.4.18"
+LINUX_VERSION ?= "5.4.20"
 
 DEPENDS += "${@bb.utils.contains('ARCH', 'x86', 'elfutils-native', '', d)}"
 DEPENDS += "openssl-native util-linux-native"
-- 
2.19.1


