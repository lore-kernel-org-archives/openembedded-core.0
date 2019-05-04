Return-Path: <akuster808@gmail.com>
Received: from mail-pl1-f182.google.com (mail-pl1-f182.google.com
	[209.85.214.182])
	by mail.openembedded.org (Postfix) with ESMTP id 228167D7A0
	for <openembedded-core@lists.openembedded.org>;
	Sat,  4 May 2019 15:27:30 +0000 (UTC)
Received: by mail-pl1-f182.google.com with SMTP id o5so4147628pls.12
	for <openembedded-core@lists.openembedded.org>;
	Sat, 04 May 2019 08:27:31 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=from:to:subject:date:message-id:in-reply-to:references;
	bh=Ll5IEDgZn1QANYfw9ydcovZwuZAHJk9k5QwiPG/tt5c=;
	b=DtneXW6aDQ0gNR70+v1eE+ShXqHMjWtZxlybXOObq8e2Qcb8ElNBXp5Ose2WuoSt8y
	jfHOxu2+tQuvEz2wW96CK8pHDpHLEeS7XaeNoM2ss1Fq97lZ0P81zF2gKD5yCnyelsCD
	qteG+LiSZzFX1nz03xHVesIsgeBxyTirFBNXl82iy0g0gqcnDIwUwhHAnxKTD0wNrnVv
	EHB/5aYQyuXtsfw0zG4FITf1Bpz/9GJzpYEcZQuKnMg6T7uwkgkKRKXK3QoM8KaSfxh1
	/OiX4OJLI1POnsegHAjb3O0dh6RWu9iNimPBWITLrllWEIM71RW8v6t4XHiGDIC8iWJb
	VTxA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:from:to:subject:date:message-id:in-reply-to
	:references;
	bh=Ll5IEDgZn1QANYfw9ydcovZwuZAHJk9k5QwiPG/tt5c=;
	b=htDtvxeWvK0KhxQ25venuq0mWR8nqAjKcpCaHP+aTk11V8lfy25fIFcqXwO1WoVgdZ
	OKLdeu3pzZJ+58iUmd3AMriysUVtexrh76JG+hqaEOO3/HN010kCvbiuC6Dlq3HZW4/k
	bBJUoyMn16ClzSXHxKVAVqDJEXdq8J2gW8B43mvGzD7PaLZ+EPlfZ7VbFPQyK3u8U/H+
	P7OVQXHTnGlLAzZI6Gc25th1rV6YK9PaNcKpUKm6sXQg7U3+FLDrNozjrJBPdjxLPM9t
	s5ulnAz4PJUVdk1batIut/wx29iech13/9/B87/MbajQFFxwZPNCIK5NjSUw5ZZIsGsj
	Vl9w==
X-Gm-Message-State: APjAAAWHDGHHmC8Y0BqtUHFclAz3mB6U65wQ2+G9y3zAqL0HPMSzwb5i
	jS3GkT43Ipo3umFr1ailnBs6KAm/
X-Google-Smtp-Source: APXvYqzOe4r8PivDC26QM2On5STQNJxbCX8HqPuCnLT1KotfzJQ0JEJczWafNgXW5NJVvat+5TK8Og==
X-Received: by 2002:a17:902:6bc5:: with SMTP id
	m5mr19765763plt.180.1556983650728; 
	Sat, 04 May 2019 08:27:30 -0700 (PDT)
Received: from akuster-ThinkPad-T460s.hsd1.ca.comcast.net
	([2601:202:4180:c33:e5bb:fdcb:954:875c])
	by smtp.gmail.com with ESMTPSA id
	k12sm6394214pfk.86.2019.05.04.08.27.29
	for <openembedded-core@lists.openembedded.org>
	(version=TLS1_2 cipher=ECDHE-RSA-AES128-SHA bits=128/128);
	Sat, 04 May 2019 08:27:30 -0700 (PDT)
From: Armin Kuster <akuster808@gmail.com>
To: openembedded-core@lists.openembedded.org
Date: Sat,  4 May 2019 08:26:41 -0700
Message-Id: <2bebb5ca0e52944560c6d4b89ce06fc0512f97b5.1556983501.git.akuster808@gmail.com>
X-Mailer: git-send-email 2.7.4
In-Reply-To: <cover.1556983501.git.akuster808@gmail.com>
References: <cover.1556983501.git.akuster808@gmail.com>
Subject: [PATCH 05/43] linux-yocto/5.0: update to v5.0.5
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
X-List-Received-Date: Sat, 04 May 2019 15:27:30 -0000

From: Bruce Ashfield <bruce.ashfield@gmail.com>

Integrating the latest korg -stable releases which comprise the
following commits:

   1f6f316a537d Linux 5.0.5
   a57af6d07512 ALSA: hda - Enforces runtime_resume after S3 and S4 for each codec
   6c77789fb46e ALSA: hda - Record the current power state before suspend/resume calls
   8bc3816d6566 locking/lockdep: Add debug_locks check in __lock_downgrade()
   0830cf62f529 x86/unwind: Add hardcoded ORC entry for NULL
   0312f3032e35 x86/unwind: Handle NULL pointer calls better in frame unwinder
   1e641e63fe0c loop: access lo_backing_file only when the loop device is Lo_bound
   da75d3775401 netfilter: ebtables: remove BUGPRINT messages
   a179695eddd9 aio: simplify - and fix - fget/fput for io_submit()
   1c0fc5e9cb40 f2fs: fix to avoid deadlock of atomic file operations
   648562c0a958 RDMA/cma: Rollback source IP address if failing to acquire device
   244594c5f5c8 drm/vkms: Fix flush_work() without INIT_WORK().
   35228ce61a81 Bluetooth: hci_ldisc: Postpone HCI_UART_PROTO_READY bit set in hci_uart_set_proto()
   c8d311117c3e Bluetooth: hci_ldisc: Initialize hci_dev before open()
   4d18023ade55 Bluetooth: Fix decrementing reference count twice in releasing socket
   572ae5c7646b Bluetooth: hci_uart: Check if socket buffer is ERR_PTR in h4_recv_buf()
   c35a32eb2339 media: v4l2-ctrls.c/uvc: zero v4l2_event
   c29313c07f2d ext4: brelse all indirect buffer in ext4_ind_remove_space()
   f1902fd02d56 ext4: fix data corruption caused by unaligned direct AIO
   635218fee409 ext4: fix NULL pointer dereference while journal is aborted
   5b099547f29d ALSA: ac97: Fix of-node refcount unbalance
   1fa1bfef5f4c ALSA: hda - Don't trigger jackpoll_work in azx_resume
   2b1cf1a17a41 SMB3: Fix SMB3.1.1 guest mounts to Samba
   809ecabb6d41 clocksource/drivers/riscv: Fix clocksource mask
   70c1b15faf8b irqchip/gic-v3-its: Fix comparison logic in lpi_range_cmp
   dfa011546d27 objtool: Move objtool_file struct off the stack
   198092b82db3 perf probe: Fix getting the kernel map
   3bff3aabd586 cifs: allow guest mounts to work for smb3.11
   8dfb1e702caa futex: Ensure that futex address is aligned in handle_futex_death()
   72b8c5492f48 scsi: ibmvscsi: Fix empty event pool access during host removal
   bc1bf16d7def scsi: ibmvscsi: Protect ibmvscsi_head from concurrent modificaiton
   e109bf21f4c6 scsi: qla2xxx: Fix FC-AL connection target discovery
   abe481cfe983 scsi: core: Avoid that a kernel warning appears during system resume
   e846d79bc1ba net/mlx5: Fix DCT creation bad flow
   62362ccdd45c powerpc/security: Fix spectre_v2 reporting
   7f5ffb4c7a71 powerpc/vdso64: Fix CLOCK_MONOTONIC inconsistencies across Y2038
   9e063d979422 MIPS: Fix kernel crash for R6 in jump label branch function
   de21552cc848 MIPS: Ensure ELF appended dtb is relocated
   63703e8fd2af mips: loongson64: lemote-2f: Add IRQF_NO_SUSPEND to "cascade" irqaction.
   e88f693e6e8d udf: Fix crash on IO error during truncate
   48cce130d485 libceph: wait for latest osdmap in ceph_monc_blacklist_add()
   027584c8ef01 iommu/iova: Fix tracking of recently failed iova address
   98e2c51c1ac3 iommu/amd: fix sg->dma_address for sg->offset bigger than PAGE_SIZE
   0c113ec08d71 drm/vmwgfx: Return 0 when gmrid::get_node runs out of ID's
   5618b16763ce drm/vmwgfx: Don't double-free the mode stored in par->set_mode
   109f5f9dff14 drm/amdgpu: fix invalid use of change_bit
   cdb57f82a4bc mmc: renesas_sdhi: limit block count to 16 bit for old revisions
   1494408bf863 mmc: mxcmmc: "Revert mmc: mxcmmc: handle highmem pages"
   7e682a01b111 mmc: alcor: fix DMA reads
   cc8cd197411b mmc: pxamci: fix enum type confusion
   ae833c3eefaf ALSA: firewire-motu: use 'version' field of unit directory to identify model
   3c09233b5dee ALSA: hda - add Lenovo IdeaCentre B550 to the power_save_blacklist
   239cc2c5a3c8 Linux 5.0.4
   87e728e85559 SUNRPC: Respect RPC call timeouts when retrying transmission
   f6716abfd12b SUNRPC: Fix up RPC back channel transmission
   aed54941cf9e SUNRPC: Prevent thundering herd when the socket is not connected
   1b2f5d715bbc s390/setup: fix boot crash for machine without EDAT-1
   09bfb45ed842 net: dsa: lantiq_gswip: fix OF child-node lookups
   8d244127d25f net: dsa: lantiq_gswip: fix use-after-free on failed probe
   4e126cbd4f06 KVM: nVMX: Check a single byte for VMCS "launched" in nested early checks
   5de7f6cd6aeb KVM: nVMX: Ignore limit checks on VMX instructions using flat segments
   f88f29f81d59 KVM: nVMX: Apply addr size mask to effective address for VMX instructions
   64d259a70642 KVM: nVMX: Sign extend displacements of VMX instr's mem operands
   1e42327adb8d KVM: x86/mmu: Do not cache MMIO accesses while memslots are in flux
   c173d5417a11 KVM: x86/mmu: Detect MMIO generation wrap in any address space
   5221117cd414 KVM: VMX: Zero out *all* general purpose registers after VM-Exit
   cf8d03a4fe59 KVM: VMX: Compare only a single byte for VMCS' "launched" in vCPU-run
   e1bdcf061b48 KVM: Call kvm_arch_memslots_updated() before updating memslots
   c61d88f39491 drm/amd/display: don't call dm_pp_ function from an fpu block
   ea7da9ef23a0 drm/amd/powerplay: correct power reading on fiji
   3bc65d729765 drm/radeon/evergreen_cs: fix missing break in switch statement
   b78ee0965f86 drm/fb-helper: generic: Fix drm_fbdev_client_restore()
   c7a35a9877b8 media: imx: csi: Stop upstream before disabling IDMA channel
   145cab144d75 media: imx: csi: Disable CSI immediately after last EOF
   e7a06193c52c media: imx-csi: Input connections to CSI should be optional
   e7ae48ae4722 media: vimc: Add vimc-streamer for stream control
   6932b9b4e677 media: uvcvideo: Avoid NULL pointer dereference at the end of streaming
   202ed62dea70 media: sun6i: Fix CSI regmap's max_register
   1d433d48516e media: lgdt330x: fix lock status reporting
   f55d0cb10f5b media: imx: prpencvf: Stop upstream before disabling IDMA channel
   9d032911a36c rcu: Do RCU GP kthread self-wakeup from softirq and interrupt
   5d6f031fa782 tpm: Unify the send callback behaviour
   65a2af7599c6 tpm/tpm_crb: Avoid unaligned reads in crb_recv()
   f484e220df15 x86/ftrace: Fix warning and considate ftrace_jmp_replace() and ftrace_call_replace()
   384dada74d37 x86/kvmclock: set offset for kvm unstable clock
   9b236e3f79d9 md: Fix failed allocation of md_register_thread
   99e5abb7b895 perf intel-pt: Fix divide by zero when TSC is not available
   85c9f1fb8a81 perf/x86/intel/uncore: Fix client IMC events return huge result
   6228a6e3516f perf intel-pt: Fix overlap calculation for padding
   2354deae355b perf auxtrace: Define auxtrace record alignment
   0f43fd4bdb74 perf tools: Fix split_kallsyms_for_kcore() for trampoline symbols
   99c7a8ec4387 perf intel-pt: Fix CYC timestamp calculation after OVF
   a0203d4e717e x86/unwind/orc: Fix ORC unwind table alignment
   194f1ecd4906 vt: perform safe console erase in the right order
   c8d3a581742f stable-kernel-rules.rst: add link to networking patch queue
   0b60b354b33a bcache: use (REQ_META|REQ_PRIO) to indicate bio for metadata
   dddd539dc325 bcache: treat stale && dirty keys as bad keys
   97cf758e172c bcache: never writeback a discard operation
   a8ce88427a9b PM / OPP: Update performance state when freq == old_freq
   c9c0e5f01245 PM / wakeup: Rework wakeup source timer cancellation
   f03f5295caf0 svcrpc: fix UDP on servers with lots of threads
   1363f37fbd24 NFSv4.1: Reinitialise sequence results before retransmitting a request
   867ae74fb190 nfsd: fix wrong check in write_v4_end_grace()
   f5bed084b482 nfsd: fix memory corruption caused by readdir
   2ececa64d67a nfsd: fix performance-limiting session calculation
   88f786a8e78a NFS: Don't recoalesce on error in nfs_pageio_complete_mirror()
   4fe2a7fda78a NFS: Fix an I/O request leakage in nfs_do_recoalesce
   e83b6ac7deed NFS: Fix I/O request leakages
   b41991d86722 cpuidle: governor: Add new governors to cpuidle_governors again
   6eea03f8c368 cpcap-charger: generate events for userspace
   9cc42d068f57 mfd: sm501: Fix potential NULL pointer dereference
   83df21c731e6 media: cx25840: mark pad sig_types to fix cx231xx init
   b6246ffae5a0 dm integrity: limit the rate of error messages
   dca22c59e47e dm: fix to_sector() for 32bit
   a8964a63780c ipmi_si: fix use-after-free of resource->name
   d3432e5d0831 ipmi_si: Fix crash when using hard-coded device
   98ab3b877400 Revert "KVM/MMU: Flush tlb directly in the kvm_zap_gfn_range()"
   bf5615991a91 arm64: KVM: Fix architecturally invalid reset value for FPEXC32_EL2
   4b6d75b38664 arm64: debug: Ensure debug handlers check triggering exception level
   4f771d8acc74 arm64: debug: Don't propagate UNKNOWN FAR into si_code for debug signals
   9afab3b6b9c5 arm64: Fix HCR.TGE status for NMI contexts
   8f67dd8570ac ARM: s3c24xx: Fix boolean expressions in osiris_dvs_notify
   6a4c3ab2d53e powerpc/traps: Fix the message printed when stack overflows
   24bf608e7438 powerpc/traps: fix recoverability of machine check handling on book3s/32
   71bb4d024416 powerpc/smp: Fix NMI IPI xmon timeout
   850a95bf2a46 powerpc/smp: Fix NMI IPI timeout
   fcf1ca937f59 powerpc/hugetlb: Don't do runtime allocation of 16G pages in LPAR configuration
   4ca936a49360 powerpc/ptrace: Simplify vr_get/set() to avoid GCC warning
   55b852a06fe1 powerpc: Fix 32-bit KVM-PR lockup and host crash with MacOS guest
   651db1461793 powerpc/64s/hash: Fix assert_slb_presence() use of the slbfee. instruction
   702c1ab420ab powerpc/powernv: Don't reprogram SLW image on every KVM guest entry/exit
   f7d68a102ad4 powerpc/kvm: Save and restore host AMR/IAMR/UAMOR
   3b218d244482 powerpc/83xx: Also save/restore SPRG4-7 during suspend
   16ee62368aaa powerpc/powernv: Make opal log only readable by root
   8d2cc8c1c4fe powerpc/wii: properly disable use of BATs when requested.
   d0d33e87d143 powerpc/32: Clear on-stack exception marker upon exception return
   232aa30f16b9 security/selinux: fix SECURITY_LSM_NATIVE_LABELS on reused superblock
   7e30471146d2 selinux: add the missing walk_size + len check in selinux_sctp_bind_connect
   f9897a30deb7 jbd2: fix compile warning when using JBUFFER_TRACE
   8c343062c8fa jbd2: clear dirty flag when revoking a buffer from an older transaction
   bb47633ab15e serial: 8250_pci: Have ACCES cards that use the four port Pericom PI7C9X7954 chip use the pci_pericom_setup()
   7271438208b6 serial: 8250_pci: Fix number of ports for ACCES serial cards
   c7388ba10902 serial: 8250_of: assume reg-shift of 2 for mrvl,mmp-uart
   fa4d0361304f serial: uartps: Fix stuck ISR if RX disabled with non-empty FIFO
   37fe1d56aa2c dmaengine: usb-dmac: Make DMAC system sleep callbacks explicit
   39367147f046 usb: typec: tps6598x: handle block writes separately with plain-I2C adapters
   07e326fd07d7 usb: chipidea: tegra: Fix missed ci_hdrc_remove_device()
   f11fa22a7a5f clk: ingenic: Fix doc of ingenic_cgu_div_info
   7d4966247a99 clk: ingenic: Fix round_rate misbehaving with non-integer dividers
   1a29715073a1 clk: samsung: exynos5: Fix kfree() of const memory on setting driver_override
   7da58ad824b1 clk: samsung: exynos5: Fix possible NULL pointer exception on platform_device_alloc() failure
   d9d7760c1e45 clk: clk-twl6040: Fix imprecise external abort for pdmclk
   a712a38100b5 clk: uniphier: Fix update register for CPU-gear
   e1ac00773456 ext2: Fix underflow in ext2_max_size()
   96728f35572e cxl: Wrap iterations over afu slices inside 'afu_list_lock'
   25636de95557 IB/rdmavt: Fix concurrency panics in QP post_send and modify to error
   ada60723d7cd IB/rdmavt: Fix loopback send with invalidate ordering
   c8a23dfeb2d6 IB/hfi1: Close race condition on user context disable and close
   2b9ef0bedaac PCI: pci-bridge-emul: Extend pci_bridge_emul_init() with flags
   d011c7871d16 PCI: pci-bridge-emul: Create per-bridge copy of register behavior
   ee0bf8d6e7fc PCI: pciehp: Disable Data Link Layer State Changed event on suspend
   0d5bc50f524a PCI: dwc: skip MSI init if MSIs have been explicitly disabled
   63a9e7ce6624 PCI: qcom: Don't deassert reset GPIO during probe
   eafa704de27b PCI/DPC: Fix print AER status in DPC event handling
   bae1cf68370d PCI/ASPM: Use LTR if already enabled by platform
   4e9f8e86d6c7 swiotlb: Add is_swiotlb_active() function
   a4eeaa9cc9da swiotlb: Introduce swiotlb_max_mapping_size()
   38c3a86a8226 dma: Introduce dma_max_mapping_size()
   db8913b46d74 ext4: fix crash during online resizing
   edc0bf6532ba ext4: add mask of ext4 flags to swap
   7c2cfdf99ae9 ext4: update quota information while swapping boot loader inode
   ef2dfe6f8c82 gpio: pca953x: Fix dereference of irq data in shutdown
   13cef9edc45b media: i2c: ov5640: Fix post-reset delay
   8b82d499df87 i2c: tegra: update maximum transfer size
   986d964baaaa i2c: tegra: fix maximum transfer size
   775bd984147e parport_pc: fix find_superio io compare code, should use equal test.
   d91315e99c55 intel_th: Don't reference unassigned outputs
   1a1d6860c539 device property: Fix the length used in PROPERTY_ENTRY_STRING()
   9a638bb82ff5 nvmem: core: don't check the return value of notifier chain call
   d09e7041330b kernel/sysctl.c: add missing range check in do_proc_dointvec_minmax_conv
   9a842b43e4b8 mm/memory.c: do_fault: avoid usage of stale vm_area_struct
   8df6ab770e20 mm/vmalloc: fix size check for remap_vmalloc_range_partial()
   84fe80428739 mm: hwpoison: fix thp split handing in soft_offline_in_use_page()
   7a34997043f1 ext4: cleanup pagecache before swap i_data
   a0f6f657ac44 ext4: fix check of inode in swap_inode_boot_loader
   f9308e46e02b cpufreq: pxa2xx: remove incorrect __init annotation
   272b28097c30 cpufreq: tegra124: add missing of_node_put()
   144c3557b1e1 cpufreq: kryo: Release OPP tables on module removal
   737f4ead9606 x86/kprobes: Prohibit probing on optprobe template code
   dbbb26db8938 irqchip/brcmstb-l2: Use _irqsave locking variants in non-interrupt code
   830d66c95e02 irqchip/gic-v3-its: Avoid parsing _indirect_ twice for Device table
   bd05a30753eb libertas_tf: don't set URB_ZERO_PACKET on IN USB transfer
   028cbca07ab5 soc: qcom: rpmh: Avoid accessing freed memory from batch API
   1098803b8cb7 Btrfs: fix deadlock between clone/dedupe and rename
   3486142a68e3 Btrfs: fix corruption reading shared and compressed extents after hole punching
   ebbb48419e8a btrfs: init csum_list before possible free
   88e610ae4c3a btrfs: ensure that a DUP or RAID1 block group has exactly two stripes
   9c58f2ada4fa btrfs: drop the lock on error in btrfs_dev_replace_cancel
   fb9c36acfab1 btrfs: scrub: fix circular locking dependency warning
   9d7b327affb8 Btrfs: setup a nofs context for memory allocation at __btrfs_set_acl
   80dcd07c27df Btrfs: setup a nofs context for memory allocation at btrfs_create_tree()
   98bb142aaff2 m68k: Add -ffreestanding to CFLAGS
   3381b362f74c ovl: Do not lose security.capability xattr over metadata file copy-up
   0fa6688a2882 ovl: During copy up, first copy up data and then xattrs
   ef02f9fe5148 splice: don't merge into linked buffers
   61d06e123502 fs/devpts: always delete dcache dentry-s in dput()
   a15cf4d9a622 scsi: qla2xxx: Use complete switch scan for RSCN events
   f54e2394acf7 scsi: qla2xxx: Avoid PCI IRQ affinity mapping when multiqueue is not supported
   54e834ee7a6e scsi: qla2xxx: Fix LUN discovery if loop id is not assigned yet by firmware
   7d6d14a119c8 scsi: target/iscsi: Avoid iscsit_release_commands_from_conn() deadlock
   6c922faf889a scsi: sd: Optimal I/O size should be a multiple of physical block size
   1ba35e5a3c5c scsi: aacraid: Fix performance issue on logical drives
   bd1558978695 scsi: virtio_scsi: don't send sc payload with tmfs
   ffd4a428a54e s390/virtio: handle find on invalid queue gracefully
   39fdc16138b7 s390/setup: fix early warning messages
   2aa8ab08c82c s390: vfio_ap: link the vfio_ap devices to the vfio_ap bus subsystem
   4b280a0bfc6d clocksource/drivers/arch_timer: Workaround for Allwinner A64 timer instability
   773b445425d6 clocksource/drivers/exynos_mct: Clear timer interrupt when shutdown
   de90b88a20de clocksource/drivers/exynos_mct: Move one-shot check from tick clear to ISR
   9d67c5e995da mt76: fix corrupted software generated tx CCMP PN
   6b65a01d2dcc regulator: s2mpa01: Fix step values for some LDOs
   60cb8b444fbf regulator: max77620: Initialize values for DT properties
   4527a24a8f51 regulator: s2mps11: Fix steps for buck7, buck8 and LDO35
   a34758ac6ad4 spi: spi-gpio: fix SPI_CS_HIGH capability
   618491014846 spi: omap2-mcspi: Fix DMA and FIFO event trigger size mismatch
   7406a055c507 spi: pxa2xx: Setup maximum supported DMA transfer length
   5d919139baf9 spi: ti-qspi: Fix mmap read when more than one CS in use
   4a9932c94626 mmc:fix a bug when max_discard is 0
   aaf1e755f8f9 mmc: renesas_sdhi: Fix card initialization failure in high speed mode
   351062f08fc1 mmc: sdhci-esdhc-imx: fix HS400 timing issue
   cb1c7a9d2897 ACPI / device_sysfs: Avoid OF modalias creation for removed device
   050b87cb66c6 xen: fix dom0 boot on huge systems
   c0b8e1d95cbf vmw_balloon: release lock on error in vmballoon_reset()
   020c90c694dc tracing/perf: Use strndup_user() instead of buggy open-coded version
   aca126f4a451 tracing: Do not free iter->trace in fail path of tracing_open_pipe()
   e5cde571ee5f tracing: Use strncpy instead of memcpy for string keys in hist triggers
   c892f4ee3db2 smb3: make default i/o size for smb3 mounts larger
   3eb2412dd9da CIFS: Fix read after write for files with read caching
   c73a769b63fb CIFS: Do not skip SMB2 message IDs on send failures
   a992916a9c89 CIFS: Do not reset lease state to NONE on lease break
   75bbb83e80c7 CIFS: Fix leaking locked VFS cache pages in writeback retry
   afaf9d664b0f crypto: arm64/aes-ccm - fix bugs in non-NEON fallback routine
   741ae3caa62f crypto: arm64/aes-ccm - fix logical bug in AAD MAC handling
   d78c34dfc288 crypto: x86/morus - fix handling chunked inputs and MAY_SLEEP
   814ec1461901 crypto: x86/aesni-gcm - fix crash on empty plaintext
   2e0e52c3d618 crypto: x86/aegis - fix handling chunked inputs and MAY_SLEEP
   c9e34c3c34b9 crypto: testmgr - skip crc32c context test for ahash algorithms
   c58580801420 crypto: skcipher - set CRYPTO_TFM_NEED_KEY if ->setkey() fails
   0173f7ca0e22 crypto: pcbc - remove bogus memcpy()s with src == dest
   9cbfb0a8d1af crypto: morus - fix handling chunked inputs
   c850ff289c4e crypto: hash - set CRYPTO_TFM_NEED_KEY if ->setkey() fails
   7007b2645f6e crypto: arm64/crct10dif - revert to C code for short inputs
   d78abd635e6c crypto: arm64/aes-neonbs - fix returning final keystream block
   844351fc03b0 crypto: arm/crct10dif - revert to C code for short inputs
   e414d9bc86a7 crypto: aegis - fix handling chunked inputs
   650b7246d460 crypto: aead - set CRYPTO_TFM_NEED_KEY if ->setkey() fails
   781bcac5b199 fix cgroup_do_mount() handling of failure exits
   2ac714d69197 libnvdimm: Fix altmap reservation size calculation
   fefd9f16efc3 libnvdimm/pmem: Honor force_raw for legacy pmem regions
   4b9d1f8b61e8 libnvdimm, pfn: Fix over-trim in trim_pfn_device()
   dd40489f6751 libnvdimm/label: Clear 'updating' flag after label-set update
   5fa9cb709adc nfit/ars: Attempt short-ARS even in the no_init_ars case
   b3971c932d0d nfit/ars: Attempt a short-ARS whenever the ARS state is idle at boot
   0c7979447489 acpi/nfit: Fix bus command validation
   a2690301c976 nfit: acpi_nfit_ctl(): Check out_obj->type in the right place
   59a0e57f0cd3 nfit: Fix nfit_intel_shutdown_status() command submission
   9cd805133b84 dax: Flush partial PMDs correctly
   c2ca8161971a crypto: rockchip - update new iv to device in multiple operations
   e400988e1dae crypto: rockchip - fix scatterlist nents error
   20af3634022b crypto: ahash - fix another early termination in hash walk
   b03aa2833d56 crypto: ofb - fix handling partial blocks and make thread-safe
   5d894501d423 crypto: cfb - remove bogus memcpy() with src == dest
   64ae3c3d0c16 crypto: cfb - add missing 'chunksize' property
   ded8d6308ffd crypto: ccree - don't copy zero size ciphertext
   4fc9f0e1c9ff crypto: ccree - unmap buffer before copying IV
   37ff06fd9cb5 crypto: ccree - fix free of unallocated mlli buffer
   6e905e258c50 crypto: caam - fix DMA mapping of stack memory
   e86dc780320e crypto: caam - fixed handling of sg list
   4a18213573b8 crypto: ccree - fix missing break in switch statement
   fce3d391401a crypto: caam - fix hash context DMA unmap size
   9b2fdbdce1fb stm class: Fix an endless loop in channel allocation
   2adb36ff325d stm class: Prevent division by zero
   1cfec5613090 mei: bus: move hw module get/put to probe/release
   55ced4559dbf mei: hbm: clean the feature flags on link reset
   f644d56fe1d7 iio: adc: exynos-adc: Use proper number of channels for Exynos4x12
   a52251155bab iio: adc: exynos-adc: Fix NULL pointer exception on unbind
   61328520e0b6 ASoC: codecs: pcm186x: Fix energysense SLEEP bit
   5bd4f972e594 ASoC: codecs: pcm186x: fix wrong usage of DECLARE_TLV_DB_SCALE()
   a7abca8506b5 ASoC: fsl_esai: fix register setting issue in RIGHT_J mode
   5ababa4e34db 9p/net: fix memory leak in p9_client_create
   3cccba9a38d5 9p: use inode->i_lock to protect i_size_write() under 32-bit

Signed-off-by: Bruce Ashfield <bruce.ashfield@gmail.com>
Signed-off-by: Richard Purdie <richard.purdie@linuxfoundation.org>
Signed-off-by: Armin Kuster <akuster808@gmail.com>
---
 meta/recipes-kernel/linux/linux-yocto-tiny_5.0.bb |  8 ++++----
 meta/recipes-kernel/linux/linux-yocto_5.0.bb      | 20 ++++++++++----------
 2 files changed, 14 insertions(+), 14 deletions(-)

diff --git a/meta/recipes-kernel/linux/linux-yocto-tiny_5.0.bb b/meta/recipes-kernel/linux/linux-yocto-tiny_5.0.bb
index 49c69c4..6b07401 100644
--- a/meta/recipes-kernel/linux/linux-yocto-tiny_5.0.bb
+++ b/meta/recipes-kernel/linux/linux-yocto-tiny_5.0.bb
@@ -6,7 +6,7 @@ KCONFIG_MODE = "--allnoconfig"
 
 require recipes-kernel/linux/linux-yocto.inc
 
-LINUX_VERSION ?= "5.0.3"
+LINUX_VERSION ?= "5.0.5"
 LIC_FILES_CHKSUM = "file://COPYING;md5=bbea815ee2795b2f4230826c0c6b8814"
 
 DEPENDS += "${@bb.utils.contains('ARCH', 'x86', 'elfutils-native', '', d)}"
@@ -15,9 +15,9 @@ DEPENDS += "openssl-native util-linux-native"
 KMETA = "kernel-meta"
 KCONF_BSP_AUDIT_LEVEL = "2"
 
-SRCREV_machine_qemuarm ?= "b0477279877bb2b5cca6ec49c64e931901ff2022"
-SRCREV_machine ?= "3df4aae6074e94e794e27fe7f17451d9353cdf3d"
-SRCREV_meta ?= "f0b575cda6d03540ff8da2f70421f13a08f34a5e"
+SRCREV_machine_qemuarm ?= "42d601740a3ab5d777a1709bf39500a8a4af4afe"
+SRCREV_machine ?= "8d265b9329ff84b3bfd70813ba18168016302d4f"
+SRCREV_meta ?= "2070c41a1d0542e41cac5f0ea04a108e46cac427"
 
 PV = "${LINUX_VERSION}+git${SRCPV}"
 
diff --git a/meta/recipes-kernel/linux/linux-yocto_5.0.bb b/meta/recipes-kernel/linux/linux-yocto_5.0.bb
index 82bbbd6..f53089a 100644
--- a/meta/recipes-kernel/linux/linux-yocto_5.0.bb
+++ b/meta/recipes-kernel/linux/linux-yocto_5.0.bb
@@ -11,15 +11,15 @@ KBRANCH_qemux86  ?= "v5.0/standard/base"
 KBRANCH_qemux86-64 ?= "v5.0/standard/base"
 KBRANCH_qemumips64 ?= "v5.0/standard/mti-malta64"
 
-SRCREV_machine_qemuarm ?= "18a5ffa0e90184c8503ff1df45e4e5e501b1bab3"
-SRCREV_machine_qemuarm64 ?= "3df4aae6074e94e794e27fe7f17451d9353cdf3d"
-SRCREV_machine_qemumips ?= "c4d3cd6437329407e2cc7e3e4615769452d426b1"
-SRCREV_machine_qemuppc ?= "3df4aae6074e94e794e27fe7f17451d9353cdf3d"
-SRCREV_machine_qemux86 ?= "3df4aae6074e94e794e27fe7f17451d9353cdf3d"
-SRCREV_machine_qemux86-64 ?= "3df4aae6074e94e794e27fe7f17451d9353cdf3d"
-SRCREV_machine_qemumips64 ?= "2468c20c15477ebe5ecd73c0e0162d7432149318"
-SRCREV_machine ?= "3df4aae6074e94e794e27fe7f17451d9353cdf3d"
-SRCREV_meta ?= "f0b575cda6d03540ff8da2f70421f13a08f34a5e"
+SRCREV_machine_qemuarm ?= "a27450baa8f52faaf82535411bb4e32b0c16199d"
+SRCREV_machine_qemuarm64 ?= "8d265b9329ff84b3bfd70813ba18168016302d4f"
+SRCREV_machine_qemumips ?= "ea747ff485eca3175472c474184fe49a9200e36f"
+SRCREV_machine_qemuppc ?= "8d265b9329ff84b3bfd70813ba18168016302d4f"
+SRCREV_machine_qemux86 ?= "8d265b9329ff84b3bfd70813ba18168016302d4f"
+SRCREV_machine_qemux86-64 ?= "8d265b9329ff84b3bfd70813ba18168016302d4f"
+SRCREV_machine_qemumips64 ?= "e1112ce34e86354c4d9ac713ebdfbfc4b950a547"
+SRCREV_machine ?= "8d265b9329ff84b3bfd70813ba18168016302d4f"
+SRCREV_meta ?= "2070c41a1d0542e41cac5f0ea04a108e46cac427"
 
 # remap qemuarm to qemuarma15 for the 5.0 kernel
 # KMACHINE_qemuarm ?= "qemuarma15"
@@ -28,7 +28,7 @@ SRC_URI = "git://git.yoctoproject.org/linux-yocto.git;name=machine;branch=${KBRA
            git://git.yoctoproject.org/yocto-kernel-cache;type=kmeta;name=meta;branch=yocto-5.0;destsuffix=${KMETA}"
 
 LIC_FILES_CHKSUM = "file://COPYING;md5=bbea815ee2795b2f4230826c0c6b8814"
-LINUX_VERSION ?= "5.0.3"
+LINUX_VERSION ?= "5.0.5"
 
 DEPENDS += "${@bb.utils.contains('ARCH', 'x86', 'elfutils-native', '', d)}"
 DEPENDS += "openssl-native util-linux-native"
-- 
2.7.4


