Return-Path: <bruce.ashfield@gmail.com>
Received: from mail-it1-f181.google.com (mail-it1-f181.google.com
	[209.85.166.181])
	by mail.openembedded.org (Postfix) with ESMTP id 1B5847D72E
	for <openembedded-core@lists.openembedded.org>;
	Tue,  9 Apr 2019 15:38:03 +0000 (UTC)
Received: by mail-it1-f181.google.com with SMTP id x132so5640898itf.2
	for <openembedded-core@lists.openembedded.org>;
	Tue, 09 Apr 2019 08:38:05 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=from:to:cc:subject:date:message-id:in-reply-to:references
	:mime-version:content-transfer-encoding;
	bh=FTMKy/uJnDCzSrIm7jsCc7zinzt7i6a9fE4gyvHTrLg=;
	b=qngDRk+YAmd3aeRfwALMzdPyXNBEnMVKbWTEWUTHJzyhAERZRbf+7ydEy0yPRdWaOw
	Wy7s9dHkC+n2crKIaquIci7Uu7Jg8NcrYOM1eujdpgWkL0Iix69q0ULQBqYTN1KW+TK1
	LxSA+4w5EK8FMGyU+ILzZTWydlTSqSJYQ5t96bykYRj3NPjiDnscgzuMXEZdDMkS9PyL
	VOGbiVaMKW+M7i1+RejQcU0NcL80h5g4HQnjzzHjT7OFOXGqgjoQZxbEzq+IbdN1eyLY
	tn3VnrxkOaRS0dcqaWpYRNaQDJF2+KQCQo7z0/FlzN/Edp/E5JgmbBJzev1pYPnkNYvJ
	+SMA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
	:references:mime-version:content-transfer-encoding;
	bh=FTMKy/uJnDCzSrIm7jsCc7zinzt7i6a9fE4gyvHTrLg=;
	b=ftsWHlmy+nPFX2yqdv83ale8jQZJwgwGQVV+oT8k9I5i1rFI/0/Q7WB8GGq4uGgw1d
	NCA0V+NqM2o+lEqFIiJoS24Lbc7dIHN2X/JtcfkVisG/7vfVDQrWdi3HvLZ1H//Z4k1h
	fcR/BV/AenxPCUJmqq/ha2VrOGcibygozkrXzYP1Mhcb0wkba9x1BhMA3TpYvoNKq2ZK
	6RvZAZ5GexEviBkEc9VaeeeLrWLoEbeGubP/2u4lsYrEN3TTAsKjms3TYLpn2ECBB+P6
	U0Pvn04YQ/vfJnZx7/HepzLDpd+ru6Wwa9CDgdGD/YtKSTZjFXxi72XF/sljkDP7RjW5
	zC0A==
X-Gm-Message-State: APjAAAWuzPB5hk3eMXRh2hGdqjgfeKKX2xv1qnY/CtPc4nvnFz4j7ZEh
	eIXtBJ292v1cBuQLtCSM/rA=
X-Google-Smtp-Source: APXvYqyPIDoD1M5Wa69XccyG98TMnA2GFt7CIgNRoTks4fXwcWDkYd3zsz8lwJcz1LX4taK5JI7C5w==
X-Received: by 2002:a24:760a:: with SMTP id z10mr25042246itb.115.1554824284749;
	Tue, 09 Apr 2019 08:38:04 -0700 (PDT)
Received: from localhost.localdomain
	(CPEe8de27b71faa-CM64777d5e8820.cpe.net.cable.rogers.com.
	[174.112.251.208]) by smtp.gmail.com with ESMTPSA id
	y24sm12376510iol.8.2019.04.09.08.38.03
	(version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
	Tue, 09 Apr 2019 08:38:03 -0700 (PDT)
From: bruce.ashfield@gmail.com
To: richard.purdie@linuxfoundation.org
Date: Tue,  9 Apr 2019 11:37:54 -0400
Message-Id: <610bb6da590059bfaf346f038a5e0f69cb47434e.1554824014.git.bruce.ashfield@gmail.com>
X-Mailer: git-send-email 2.19.1
In-Reply-To: <cover.1554824014.git.bruce.ashfield@gmail.com>
References: <cover.1554824014.git.bruce.ashfield@gmail.com>
MIME-Version: 1.0
Cc: openembedded-core@lists.openembedded.org
Subject: [PATCH 4/7] linux-yocto/4.18: update to v4.18.33
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
X-List-Received-Date: Tue, 09 Apr 2019 15:38:04 -0000
Content-Transfer-Encoding: 8bit

From: Bruce Ashfield <bruce.ashfield@gmail.com>

Integrating Paul Gortmaker's -stable ports to 4.18 which comprise the
following commits:

   56f9fe35a4c5 Linux 4.18.33
   bf44ff79b855 net: hns: Fixes the missing put_device in positive leg for roce reset
   81614c514f4e mm: Use fixed constant in page_frag_alloc instead of size + 1
   035b5a7a3e3f ipvs: fix warning on unused variable
   58ab04e46d92 intel_th: gth: Fix an off-by-one in output unassigning
   8cb600d53c6c ARM: dts: exynos: Fix max voltage for buck8 regulator on Odroid XU3/XU4
   f11b815f39bf s390/setup: fix boot crash for machine without EDAT-1
   4059d23a36a6 KVM: nVMX: Ignore limit checks on VMX instructions using flat segments
   d94637dc73e5 KVM: nVMX: Apply addr size mask to effective address for VMX instructions
   ee356457f2a3 KVM: nVMX: Sign extend displacements of VMX instr's mem operands
   b4485d9eb039 KVM: x86/mmu: Do not cache MMIO accesses while memslots are in flux
   fe7d69927661 KVM: x86/mmu: Detect MMIO generation wrap in any address space
   c34cae89374b KVM: Call kvm_arch_memslots_updated() before updating memslots
   9fb8b858d552 drm/amd/display: don't call dm_pp_ function from an fpu block
   d4302b79ffbd drm/amd/powerplay: correct power reading on fiji
   5f8c51055244 drm/radeon/evergreen_cs: fix missing break in switch statement
   3fc39cdce701 media: imx: csi: Stop upstream before disabling IDMA channel
   5c008f7971b8 media: imx: csi: Disable CSI immediately after last EOF
   74a5ff7db3b2 media: uvcvideo: Avoid NULL pointer dereference at the end of streaming
   142a9bd66395 media: lgdt330x: fix lock status reporting
   465204a0c772 media: imx: prpencvf: Stop upstream before disabling IDMA channel
   42a2c1a40db0 rcu: Do RCU GP kthread self-wakeup from softirq and interrupt
   f9480ca4fb29 tpm: Unify the send callback behaviour
   5f28509f81ad tpm/tpm_crb: Avoid unaligned reads in crb_recv()
   ea37270d4c87 md: Fix failed allocation of md_register_thread
   bd77b69a20ba perf intel-pt: Fix divide by zero when TSC is not available
   c9a63c17458f perf/x86/intel/uncore: Fix client IMC events return huge result
   63a25bdd4227 perf intel-pt: Fix overlap calculation for padding
   66a57e3b95b5 perf auxtrace: Define auxtrace record alignment
   76650254e18e perf intel-pt: Fix CYC timestamp calculation after OVF
   274ef4840d79 x86/unwind/orc: Fix ORC unwind table alignment
   3928a903e185 vt: perform safe console erase in the right order
   645a7ca69855 stable-kernel-rules.rst: add link to networking patch queue
   1c14622adb15 bcache: never writeback a discard operation
   261aad0b3ea7 PM / wakeup: Rework wakeup source timer cancellation
   ee610ce938cd svcrpc: fix UDP on servers with lots of threads
   0530b66bfd53 NFSv4.1: Reinitialise sequence results before retransmitting a request
   9a1d7090b36e nfsd: fix wrong check in write_v4_end_grace()
   e7edb30fd6b7 nfsd: fix memory corruption caused by readdir
   672f2e600d21 nfsd: fix performance-limiting session calculation
   624865483faa NFS: Don't recoalesce on error in nfs_pageio_complete_mirror()
   2b5fef7c9927 NFS: Fix an I/O request leakage in nfs_do_recoalesce
   63adecfe53e9 NFS: Fix I/O request leakages
   0b0545dd7e6e cpcap-charger: generate events for userspace
   8f27f8570fa7 mfd: sm501: Fix potential NULL pointer dereference
   f964d308797d dm integrity: limit the rate of error messages
   1ed46c0c4f65 dm: fix to_sector() for 32bit
   ea77e999f649 ipmi_si: fix use-after-free of resource->name
   5a0bc68e9a0d arm64: KVM: Fix architecturally invalid reset value for FPEXC32_EL2
   9dc4a1a6447e arm64: debug: Ensure debug handlers check triggering exception level
   c33e96f8ddb2 arm64: Fix HCR.TGE status for NMI contexts
   bb7edb8a409a ARM: s3c24xx: Fix boolean expressions in osiris_dvs_notify
   e8d7edd36a92 powerpc/traps: Fix the message printed when stack overflows
   fbea0579063f powerpc/hugetlb: Don't do runtime allocation of 16G pages in LPAR configuration
   88d0042148f0 powerpc/ptrace: Simplify vr_get/set() to avoid GCC warning
   b0fc119506bf powerpc: Fix 32-bit KVM-PR lockup and host crash with MacOS guest
   6e975dad4a8e powerpc/powernv: Don't reprogram SLW image on every KVM guest entry/exit
   fcf2d15a0a32 powerpc/83xx: Also save/restore SPRG4-7 during suspend
   87481c65c805 powerpc/powernv: Make opal log only readable by root
   12319dcc9a80 powerpc/wii: properly disable use of BATs when requested.
   be851891b1c9 powerpc/32: Clear on-stack exception marker upon exception return
   24d0b4b51dd1 security/selinux: fix SECURITY_LSM_NATIVE_LABELS on reused superblock
   3ea70bdc892f selinux: add the missing walk_size + len check in selinux_sctp_bind_connect
   00d550a195f2 jbd2: fix compile warning when using JBUFFER_TRACE
   b18848cc624a jbd2: clear dirty flag when revoking a buffer from an older transaction
   108ba9f62780 serial: 8250_pci: Have ACCES cards that use the four port Pericom PI7C9X7954 chip use the pci_pericom_setup()
   a79bc3e5fb7c serial: 8250_pci: Fix number of ports for ACCES serial cards
   78e39f8bb56e serial: 8250_of: assume reg-shift of 2 for mrvl,mmp-uart
   04eb2755b4e9 serial: uartps: Fix stuck ISR if RX disabled with non-empty FIFO
   9007ccc01a91 bpf: only test gso type on gso packets
   ef5b4e1f5735 drm/i915: Relax mmap VMA check
   23ca68189393 can: flexcan: FLEXCAN_IFLAG_MB: add () around macro argument
   8529fecb481e gpio: pca953x: Fix dereference of irq data in shutdown
   31e04ac8a8ba media: i2c: ov5640: Fix post-reset delay
   1855d8c9e6c4 i2c: tegra: fix maximum transfer size
   8bc3433b216d parport_pc: fix find_superio io compare code, should use equal test.
   2c0542dbb267 intel_th: Don't reference unassigned outputs
   c64422307c34 device property: Fix the length used in PROPERTY_ENTRY_STRING()
   c88db9c0d127 kernel/sysctl.c: add missing range check in do_proc_dointvec_minmax_conv
   5374924c9332 mm/memory.c: do_fault: avoid usage of stale vm_area_struct
   db693b432779 mm/vmalloc: fix size check for remap_vmalloc_range_partial()
   1811478753e3 mm: hwpoison: fix thp split handing in soft_offline_in_use_page()
   492ea426ddce dmaengine: usb-dmac: Make DMAC system sleep callbacks explicit
   f1bb88d5cee1 usb: chipidea: tegra: Fix missed ci_hdrc_remove_device()
   9377917b523a clk: ingenic: Fix doc of ingenic_cgu_div_info
   f0412cfc06af clk: ingenic: Fix round_rate misbehaving with non-integer dividers
   b6b4011ce7d1 clk: samsung: exynos5: Fix kfree() of const memory on setting driver_override
   715fe29adfd1 clk: samsung: exynos5: Fix possible NULL pointer exception on platform_device_alloc() failure
   eb9aa4ebf835 clk: clk-twl6040: Fix imprecise external abort for pdmclk
   917fa829bbf5 clk: uniphier: Fix update register for CPU-gear
   80d526380136 ext2: Fix underflow in ext2_max_size()
   bbf30be02326 cxl: Wrap iterations over afu slices inside 'afu_list_lock'
   94f31d712f26 IB/hfi1: Close race condition on user context disable and close
   a80eceacf85c PCI: dwc: skip MSI init if MSIs have been explicitly disabled
   084005af4966 PCI/ASPM: Use LTR if already enabled by platform
   821934eb7e75 ext4: fix crash during online resizing
   01767d409537 ext4: add mask of ext4 flags to swap
   f21830e67d5d ext4: update quota information while swapping boot loader inode
   4de71f7481a7 ext4: cleanup pagecache before swap i_data
   4821bf3c61bb ext4: fix check of inode in swap_inode_boot_loader
   3cd2f1153739 cpufreq: pxa2xx: remove incorrect __init annotation
   dc4443928ee2 cpufreq: tegra124: add missing of_node_put()
   a0e15a764318 cpufreq: kryo: Release OPP tables on module removal
   d28564a8e60e x86/kprobes: Prohibit probing on optprobe template code
   56955276ba2e irqchip/brcmstb-l2: Use _irqsave locking variants in non-interrupt code
   14dda7949f82 irqchip/gic-v3-its: Avoid parsing _indirect_ twice for Device table
   3a8560230470 libertas_tf: don't set URB_ZERO_PACKET on IN USB transfer
   7e7e5728d161 Btrfs: fix corruption reading shared and compressed extents after hole punching
   be1ee0e2fd42 btrfs: ensure that a DUP or RAID1 block group has exactly two stripes
   cb292a678ee2 Btrfs: setup a nofs context for memory allocation at __btrfs_set_acl
   f1f0ee2859e6 Btrfs: setup a nofs context for memory allocation at btrfs_create_tree()
   0e6de290666f m68k: Add -ffreestanding to CFLAGS
   f78f0d35d43a splice: don't merge into linked buffers
   433cbc2d30f3 fs/devpts: always delete dcache dentry-s in dput()
   dbb3e594eecd scsi: target/iscsi: Avoid iscsit_release_commands_from_conn() deadlock
   528af139ff6b scsi: sd: Optimal I/O size should be a multiple of physical block size
   ee579fc4e875 scsi: aacraid: Fix performance issue on logical drives
   818838eea45d scsi: virtio_scsi: don't send sc payload with tmfs
   478bd6b7f170 s390/virtio: handle find on invalid queue gracefully
   47c6ea331f58 s390/setup: fix early warning messages
   69304bcf9021 clocksource/drivers/arch_timer: Workaround for Allwinner A64 timer instability
   947a053a6d47 clocksource/drivers/exynos_mct: Clear timer interrupt when shutdown
   084c1f5522f1 clocksource/drivers/exynos_mct: Move one-shot check from tick clear to ISR
   95d7c41e448f regulator: s2mpa01: Fix step values for some LDOs
   69913dbd2d55 regulator: max77620: Initialize values for DT properties
   060c4f4e5d0c regulator: s2mps11: Fix steps for buck7, buck8 and LDO35
   9a215e43276c spi: pxa2xx: Setup maximum supported DMA transfer length
   913cb6579c9a spi: ti-qspi: Fix mmap read when more than one CS in use
   bb427df35f34 netfilter: ipt_CLUSTERIP: fix warning unused variable cn
   8fb8fb9b67bb mmc:fix a bug when max_discard is 0
   85d7e5a8000a mmc: sdhci-esdhc-imx: fix HS400 timing issue
   882b6b31ea55 ACPI / device_sysfs: Avoid OF modalias creation for removed device
   b3a0dfcfdd64 tracing/perf: Use strndup_user() instead of buggy open-coded version
   054dec51d4e6 tracing: Do not free iter->trace in fail path of tracing_open_pipe()
   9031822970ed tracing: Use strncpy instead of memcpy for string keys in hist triggers
   9367b21da22c CIFS: Fix read after write for files with read caching
   db6a6106224d CIFS: Do not reset lease state to NONE on lease break
   aef1cf600f41 crypto: arm64/aes-ccm - fix bugs in non-NEON fallback routine
   134135d884be crypto: arm64/aes-ccm - fix logical bug in AAD MAC handling
   6779d6bdf611 crypto: x86/morus - fix handling chunked inputs and MAY_SLEEP
   2dc6214860a1 crypto: x86/aesni-gcm - fix crash on empty plaintext
   a6e83e8b0777 crypto: x86/aegis - fix handling chunked inputs and MAY_SLEEP
   f62b08c81429 crypto: testmgr - skip crc32c context test for ahash algorithms
   817cbacff744 crypto: skcipher - set CRYPTO_TFM_NEED_KEY if ->setkey() fails
   bc647ef1085e crypto: pcbc - remove bogus memcpy()s with src == dest
   9fb0d7b8f9c2 crypto: morus - fix handling chunked inputs
   76bc71692818 crypto: hash - set CRYPTO_TFM_NEED_KEY if ->setkey() fails
   67a69738546d crypto: arm64/crct10dif - revert to C code for short inputs
   e1369ad2e0fc crypto: arm64/aes-neonbs - fix returning final keystream block
   7807003aab85 crypto: arm/crct10dif - revert to C code for short inputs
   f54fbb0e595b crypto: aegis - fix handling chunked inputs
   1e1f858caf7d crypto: aead - set CRYPTO_TFM_NEED_KEY if ->setkey() fails
   c81bf050b880 fix cgroup_do_mount() handling of failure exits
   638f4fb4ec67 libnvdimm: Fix altmap reservation size calculation
   5ebf4aa4cf6b libnvdimm/pmem: Honor force_raw for legacy pmem regions
   8f42d7ac37af libnvdimm, pfn: Fix over-trim in trim_pfn_device()
   68ab49b299fb libnvdimm/label: Clear 'updating' flag after label-set update
   063d65ab9fdd nfit/ars: Attempt short-ARS even in the no_init_ars case
   387b9f01ac16 nfit/ars: Attempt a short-ARS whenever the ARS state is idle at boot
   b4a1581c801d acpi/nfit: Fix bus command validation
   0c27d62e5752 nfit: acpi_nfit_ctl(): Check out_obj->type in the right place
   fd8e9cd85f26 stm class: Prevent division by zero
   dd1250b50c61 tmpfs: fix uninitialized return value in shmem_link
   f4cadb1ec900 selftests: fib_tests: sleep after changing carrier. again.
   7d856eb21fd5 net: set static variable an initial value in atl2_probe()
   193e19cdf7a0 bnxt_en: Wait longer for the firmware message response to complete.
   36ca3daa9b6a bnxt_en: Fix typo in firmware message timeout logic.
   aae48df6d81b nfp: bpf: fix ALU32 high bits clearance bug
   9fbe31fda762 nfp: bpf: fix code-gen bug on BPF_ALU | BPF_XOR | BPF_K
   a58be12de08d net: thunderx: add nicvf_send_msg_to_pf result check for set_rx_mode_task
   76320607b755 net: thunderx: make CFG_DONE message to run through generic send-ack sequence
   6d0ebfc3fd3c bpf, lpm: fix lookup bug in map_delete_elem
   4e9c4ca54607 mac80211_hwsim: propagate genlmsg_reply return code
   ce8e30135705 phonet: fix building with clang
   92f628f3c945 ARCv2: don't assume core 0x54 has dual issue
   1faac2e0838b ARCv2: support manual regfile save on interrupts
   53fc181c111c ARC: uacces: remove lp_start, lp_end from clobber list
   515122c2d88a ARCv2: lib: memcpy: fix doing prefetchw outside of buffer
   b1ba6184493e ixgbe: fix older devices that do not support IXGBE_MRQC_L3L4TXSWEN
   a7bc4915f286 tmpfs: fix link accounting when a tmpfile is linked in
   5beffa8382a9 mm: handle lru_add_drain_all for UP properly
   7bd326b49004 net: marvell: mvneta: fix DMA debug warning
   70e79b53dd95 arm64: Relax GIC version check during early boot
   e3ca5da971e0 ARM: dts: armada-xp: fix Armada XP boards NAND description
   2ac1b780dae0 qed: Fix iWARP syn packet mac address validation.
   9e1395d75177 qed: Fix iWARP buffer size provided for syn packet processing.
   5db253fa68bf ASoC: topology: free created components in tplg load error
   31983c568574 mailbox: bcm-flexrm-mailbox: Fix FlexRM ring flush timeout issue
   98b9e4e542eb net: mv643xx_eth: disable clk on error path in mv643xx_eth_shared_probe()
   d19e6c11ca1f qmi_wwan: apply SET_DTR quirk to Sierra WP7607
   59e3fdbb9d45 pinctrl: meson: meson8b: fix the sdxc_a data 1..3 pins
   63c87ecf5134 net: dsa: bcm_sf2: Do not assume DSA master supports WoL
   a2e5d18914c1 net: systemport: Fix reception of BPDUs
   8d33e97da9c5 scsi: libiscsi: Fix race between iscsi_xmit_task and iscsi_complete_task
   1c976b2c9f19 keys: Fix dependency loop between construction record and auth key
   590d6228f163 assoc_array: Fix shortcut creation
   5aa6e4f891a2 af_key: unconditionally clone on broadcast
   8cae27e41068 bpf: fix lockdep false positive in stackmap
   c16b543d92ee bpf: only adjust gso_size on bytestream protocols
   908e6fda5d7d ARM: 8824/1: fix a migrating irq bug when hotplug cpu
   d6fb8e0d9e7d esp: Skip TX bytes accounting when sending from a request socket
   2dd0beec5a84 clk: sunxi: A31: Fix wrong AHB gate number
   48db12b60b5b kallsyms: Handle too long symbols in kallsyms.c
   882dbe3d5c03 clk: sunxi-ng: v3s: Fix TCON reset de-assert bit
   1ab0225d6786 Input: st-keyscan - fix potential zalloc NULL dereference
   8a6ef92721b7 auxdisplay: ht16k33: fix potential user-after-free on module unload
   53f4d6948b35 i2c: bcm2835: Clear current buffer pointers and counts after a transfer
   60bc9292260f i2c: cadence: Fix the hold bit setting
   e6e2c6c26a58 net: hns: Fix object reference leaks in hns_dsaf_roce_reset()
   bf6be978fece mm: page_alloc: fix ref bias in page_frag_alloc() for 1-byte allocs
   7f72a70062d7 x86/CPU: Add Icelake model number
   4342d099969c net: dsa: bcm_sf2: potential array overflow in bcm_sf2_sw_suspend()
   6093401c933b scsi: qla2xxx: Fix panic from use after free in qla2x00_async_tm_cmd
   09f4a1b6edf1 Revert "mm: use early_pfn_to_nid in page_ext_init"
   7b9dd6a4976b mm/gup: fix gup_pmd_range() for dax
   3cd584b00e50 NFS: Don't use page_file_mapping after removing the page
   7d8cf3eb1dc7 xprtrdma: Make sure Send CQ is allocated on an existing compvec
   5c64b19db5ce floppy: check_events callback should not return a negative number
   1cae395dd7c0 ipvs: fix dependency on nf_defrag_ipv6
   d05d4feda816 blk-mq: insert rq with DONTPREP to hctx dispatch list when requeue
   0af0889613a8 netfilter: compat: initialize all fields in xt_init
   f2883b8eb0a9 mac80211: Fix Tx aggregation session tear down with ITXQs
   665cb8ebf0f3 mac80211: call drv_ibss_join() on restart
   0a1d76449997 Input: matrix_keypad - use flush_delayed_work()
   375152e09de2 Input: ps2-gpio - flush TX work when closing port
   b15599627bd0 Input: cap11xx - switch to using set_brightness_blocking()
   a1e0fb446a4b ARM: OMAP2+: fix lack of timer interrupts on CPU1 after hotplug
   7a587d77b211 ASoC: samsung: Prevent clk_get_rate() calls in atomic context
   bf74076b7dd3 KVM: arm64: Forbid kprobing of the VHE world-switch code
   d74df61de605 arm/arm64: KVM: Don't panic on failure to properly reset system registers
   58d6ec80a286 arm/arm64: KVM: Allow a VCPU to fully reset itself
   c05c5a6e1f0e KVM: arm/arm64: Reset the VCPU without preemption and vcpu state loaded
   ba274486de32 ASoC: dapm: fix out-of-bounds accesses to DAPM lookup tables
   a3d8ea1f2555 ARM: OMAP2+: Variable "reg" in function omap4_dsi_mux_pads() could be uninitialized
   237e6c308062 Input: pwm-vibra - stop regulator after disabling pwm, not before
   6a48d09a77a1 Input: pwm-vibra - prevent unbalanced regulator
   fcae9decbc8f s390/dasd: fix using offset into zero size array error
   f98a25dc02b7 KVM: arm/arm64: vgic: Make vgic_dist->lpi_list_lock a raw_spinlock
   74b6b1e49d06 gpu: ipu-v3: Fix CSI offsets for imx53
   1c0723cba9a9 drm/imx: imx-ldb: add missing of_node_puts
   321e0fbdae09 gpu: ipu-v3: Fix i.MX51 CSI control registers offset
   f0e52962b9f2 drm/imx: ignore plane updates on disabled crtcs
   38fc637ca52e crypto: rockchip - update new iv to device in multiple operations
   5d89757429b3 crypto: rockchip - fix scatterlist nents error
   2365ae3a03c9 crypto: ahash - fix another early termination in hash walk
   512b0d76c2c9 crypto: cfb - remove bogus memcpy() with src == dest
   66b1348939de crypto: cfb - add missing 'chunksize' property
   40c76d76e11f crypto: ccree - don't copy zero size ciphertext
   2ff9501c582f crypto: ccree - fix free of unallocated mlli buffer
   ba3c72efd404 crypto: caam - fixed handling of sg list
   5d9cee322faf crypto: ccree - fix missing break in switch statement
   e0ea8deb72db stm class: Fix an endless loop in channel allocation
   95b10e2f6a61 mei: bus: move hw module get/put to probe/release
   1af8d0304685 iio: adc: exynos-adc: Fix NULL pointer exception on unbind
   513052a27dab ASoC: codecs: pcm186x: Fix energysense SLEEP bit
   d5f37b5d7009 ASoC: codecs: pcm186x: fix wrong usage of DECLARE_TLV_DB_SCALE()
   da21c5d9bacf ASoC: fsl_esai: fix register setting issue in RIGHT_J mode
   b3e4f70db4f3 9p/net: fix memory leak in p9_client_create
   4b84eeface08 9p: use inode->i_lock to protect i_size_write() under 32-bit
   4441736404a3 media: videobuf2-v4l2: drop WARN_ON in vb2_warn_zero_bytesused()
   3f7de80a22c6 perf/core: Fix impossible ring-buffer sizes warning

Signed-off-by: Bruce Ashfield <bruce.ashfield@gmail.com>
---
 .../linux/linux-yocto-rt_4.18.bb              |  6 +++---
 .../linux/linux-yocto-tiny_4.18.bb            |  8 ++++----
 meta/recipes-kernel/linux/linux-yocto_4.18.bb | 20 +++++++++----------
 3 files changed, 17 insertions(+), 17 deletions(-)

diff --git a/meta/recipes-kernel/linux/linux-yocto-rt_4.18.bb b/meta/recipes-kernel/linux/linux-yocto-rt_4.18.bb
index 9b8609b425..91bb5765d1 100644
--- a/meta/recipes-kernel/linux/linux-yocto-rt_4.18.bb
+++ b/meta/recipes-kernel/linux/linux-yocto-rt_4.18.bb
@@ -11,13 +11,13 @@ python () {
         raise bb.parse.SkipRecipe("Set PREFERRED_PROVIDER_virtual/kernel to linux-yocto-rt to enable it")
 }
 
-SRCREV_machine ?= "917ee880b11f569d7a1118dc3575fd24d8ff349b"
-SRCREV_meta ?= "9e348b6f9db185cb60a34d18fd14a18b5def2c31"
+SRCREV_machine ?= "60b23779def52cac86267bdef0da0f2750dce287"
+SRCREV_meta ?= "865683fc87deee7030cd168f295e8afd70894d6c"
 
 SRC_URI = "git://git.yoctoproject.org/linux-yocto.git;branch=${KBRANCH};name=machine \
            git://git.yoctoproject.org/yocto-kernel-cache;type=kmeta;name=meta;branch=yocto-4.18;destsuffix=${KMETA}"
 
-LINUX_VERSION ?= "4.18.27"
+LINUX_VERSION ?= "4.18.33"
 
 LIC_FILES_CHKSUM = "file://COPYING;md5=bbea815ee2795b2f4230826c0c6b8814"
 
diff --git a/meta/recipes-kernel/linux/linux-yocto-tiny_4.18.bb b/meta/recipes-kernel/linux/linux-yocto-tiny_4.18.bb
index f4bb49a60d..c986eb8bac 100644
--- a/meta/recipes-kernel/linux/linux-yocto-tiny_4.18.bb
+++ b/meta/recipes-kernel/linux/linux-yocto-tiny_4.18.bb
@@ -6,7 +6,7 @@ KCONFIG_MODE = "--allnoconfig"
 
 require recipes-kernel/linux/linux-yocto.inc
 
-LINUX_VERSION ?= "4.18.27"
+LINUX_VERSION ?= "4.18.33"
 LIC_FILES_CHKSUM = "file://COPYING;md5=bbea815ee2795b2f4230826c0c6b8814"
 
 DEPENDS += "${@bb.utils.contains('ARCH', 'x86', 'elfutils-native', '', d)}"
@@ -15,9 +15,9 @@ DEPENDS += "openssl-native util-linux-native"
 KMETA = "kernel-meta"
 KCONF_BSP_AUDIT_LEVEL = "2"
 
-SRCREV_machine_qemuarm ?= "8f59516428463985f2a636b024b6c3f1b2178855"
-SRCREV_machine ?= "62f0a3acffffd555f68ed97d5e4faade2b28f3c0"
-SRCREV_meta ?= "9e348b6f9db185cb60a34d18fd14a18b5def2c31"
+SRCREV_machine_qemuarm ?= "bc69d96021b7407a636cb7bc56334bf95a525e76"
+SRCREV_machine ?= "1a564c76f41cff5c9e9011c4dbb5ef8453836b5d"
+SRCREV_meta ?= "865683fc87deee7030cd168f295e8afd70894d6c"
 
 PV = "${LINUX_VERSION}+git${SRCPV}"
 
diff --git a/meta/recipes-kernel/linux/linux-yocto_4.18.bb b/meta/recipes-kernel/linux/linux-yocto_4.18.bb
index 4a9febc062..3be72a3a57 100644
--- a/meta/recipes-kernel/linux/linux-yocto_4.18.bb
+++ b/meta/recipes-kernel/linux/linux-yocto_4.18.bb
@@ -11,21 +11,21 @@ KBRANCH_qemux86  ?= "v4.18/standard/base"
 KBRANCH_qemux86-64 ?= "v4.18/standard/base"
 KBRANCH_qemumips64 ?= "v4.18/standard/mti-malta64"
 
-SRCREV_machine_qemuarm ?= "e66e05d38c1a0eda0db1f34090ecf7155226fa4c"
-SRCREV_machine_qemuarm64 ?= "62f0a3acffffd555f68ed97d5e4faade2b28f3c0"
-SRCREV_machine_qemumips ?= "5fb9275fdd72ccd5f61cbbce5fef842fbcf3c957"
-SRCREV_machine_qemuppc ?= "62f0a3acffffd555f68ed97d5e4faade2b28f3c0"
-SRCREV_machine_qemux86 ?= "62f0a3acffffd555f68ed97d5e4faade2b28f3c0"
-SRCREV_machine_qemux86-64 ?= "62f0a3acffffd555f68ed97d5e4faade2b28f3c0"
-SRCREV_machine_qemumips64 ?= "19cccc092a7fe2337153c65045bded55ae4d5e4b"
-SRCREV_machine ?= "62f0a3acffffd555f68ed97d5e4faade2b28f3c0"
-SRCREV_meta ?= "9e348b6f9db185cb60a34d18fd14a18b5def2c31"
+SRCREV_machine_qemuarm ?= "813d81df5defc4e552b7c3085673437eaba4eea7"
+SRCREV_machine_qemuarm64 ?= "1a564c76f41cff5c9e9011c4dbb5ef8453836b5d"
+SRCREV_machine_qemumips ?= "12620f16df220007dfda3b70cc5044ec2322142c"
+SRCREV_machine_qemuppc ?= "1a564c76f41cff5c9e9011c4dbb5ef8453836b5d"
+SRCREV_machine_qemux86 ?= "1a564c76f41cff5c9e9011c4dbb5ef8453836b5d"
+SRCREV_machine_qemux86-64 ?= "1a564c76f41cff5c9e9011c4dbb5ef8453836b5d"
+SRCREV_machine_qemumips64 ?= "104cdfbbf95981e31a32dfe3bdeaff3afb517ad4"
+SRCREV_machine ?= "1a564c76f41cff5c9e9011c4dbb5ef8453836b5d"
+SRCREV_meta ?= "865683fc87deee7030cd168f295e8afd70894d6c"
 
 SRC_URI = "git://git.yoctoproject.org/linux-yocto.git;name=machine;branch=${KBRANCH}; \
            git://git.yoctoproject.org/yocto-kernel-cache;type=kmeta;name=meta;branch=yocto-4.18;destsuffix=${KMETA}"
 
 LIC_FILES_CHKSUM = "file://COPYING;md5=bbea815ee2795b2f4230826c0c6b8814"
-LINUX_VERSION ?= "4.18.27"
+LINUX_VERSION ?= "4.18.33"
 
 DEPENDS += "${@bb.utils.contains('ARCH', 'x86', 'elfutils-native', '', d)}"
 DEPENDS += "openssl-native util-linux-native"
-- 
2.19.1


