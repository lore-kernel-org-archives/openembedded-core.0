Return-Path: <martin.jansa@gmail.com>
Received: from mail-ed1-f65.google.com (mail-ed1-f65.google.com
	[209.85.208.65])
	by mail.openembedded.org (Postfix) with ESMTP id 1B2BA7D23C;
	Thu, 20 Jun 2019 19:19:44 +0000 (UTC)
Received: by mail-ed1-f65.google.com with SMTP id w13so6278391eds.4;
	Thu, 20 Jun 2019 12:19:46 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=mime-version:references:in-reply-to:from:date:message-id:subject:to
	:cc; bh=iTSZQ/U1CPeea7p/o6WKbj0o1fN2Y75RV7Ff2rpjqM4=;
	b=mZEdVbrWW11KiqJ/UXbvR5kY27AfNQ5VEpX3gidsoE2rDiqMpwFwMvt1GWpo0vo+Zx
	W+lxEYzE5ejLavbDQUqg1ZTBgnEJAUK7jQ5yrwtqMS/GK1FOrsMoDrHGFORmOr/aJoVs
	TAX9NGJa1Wnq8AanlMcC06Ne/zbSYqQHjJnndBsDqm0PbF0AfCUOa+d6hGmvAeN4xUd+
	7J8ywKx8SI3ZYEAWROfnIbyxHnpuewTPFJ3PDsnIv4+RJ94Jkt90c9JJRLUXXf+GZmQx
	oqvl6AIVTIX0htkg7dn6kmOFqsxMVMl4CQY3nN3/9oDLys5XhweFl4TfEwWcWcEuhZmm
	Uxrw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:mime-version:references:in-reply-to:from:date
	:message-id:subject:to:cc;
	bh=iTSZQ/U1CPeea7p/o6WKbj0o1fN2Y75RV7Ff2rpjqM4=;
	b=fF95TlbLpGMSFpGiXiBWmW4SNYeJe8yBFNzK/7lhA6/tXKHfPRp9vKgtuWmjMw2kRZ
	uO2HznoLr1+axTjjO2W4me443XJxQA7d54T+aavKePt6fuzEf1UkuSWJt7swT5J904sz
	9d1C6mkwgkoPjESRdWlZ9FQ9xFubmGrSD0jhydTaLF42z7WdaMU9+m1BQ+T5g3r5TqYG
	24b6lFD31CFN6nN5dNIoY5uDnUgQPKdPawQEkgJxrTuypCY8mMbZg6YUD8mqgFjAByW8
	/IBcJJoNrQ425iEGNuKM8VbIW8HqqSfyu416t/UMzoawH2dlWGH8MhzvK/XaZgD/et0E
	lE1w==
X-Gm-Message-State: APjAAAWezFzz2LsPKsIp+lYCu2Jq2hU6sFDOzmYkVgbXveca1Jau713D
	3UB1Yy5ESS5ZNHMZDXiJkU4ogaPNK6JowCBMOTM=
X-Google-Smtp-Source: APXvYqz8yTOiPGn9GhSF9vJYKYX/l0DRg47BMBMybG9lmVm5JYxrgNg14XqXc56cO2gP7sKL7h1qrWW4c2t1OIfjQBg=
X-Received: by 2002:a50:95d3:: with SMTP id x19mr96639398eda.98.1561058385532; 
	Thu, 20 Jun 2019 12:19:45 -0700 (PDT)
MIME-Version: 1.0
References: <156085389271.26327.12531071352385707940@git.openembedded.org>
	<20190618103133.9022A2342C2@git.openembedded.org>
In-Reply-To: <20190618103133.9022A2342C2@git.openembedded.org>
From: Martin Jansa <martin.jansa@gmail.com>
Date: Thu, 20 Jun 2019 21:19:44 +0200
Message-ID: <CA+chaQdFSThk4NPhTQt05V1pw8sd-uKZDCnePh9eBuNPL8EDJA@mail.gmail.com>
To: Bruce Ashfield <bruce.ashfield@gmail.com>, 
	Patches and discussions about the oe-core layer
	<openembedded-core@lists.openembedded.org>
Cc: openembedded-commits@lists.openembedded.org
Subject: Re: [oe-commits] [openembedded-core] 09/30: linux-yocto/5.0: update to v5.0.19
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
X-List-Received-Date: Thu, 20 Jun 2019 19:19:45 -0000
Content-Type: multipart/alternative; boundary="0000000000008b21bd058bc63a6e"

--0000000000008b21bd058bc63a6e
Content-Type: text/plain; charset="UTF-8"

Hi,


One of these recent updates is causing following WARNING:


---------- CONFIG_SCSI_DEBUG -----------------
Config: CONFIG_SCSI_DEBUG
From: work-shared/qemuarm/kernel-source/.kernel-meta/configs/v5.0/standard/features/scsi/scsi-debug.cfg
Requested value:  CONFIG_SCSI_DEBUG=m
Actual value:

No reference to SCSI_DEBUG found


On Tue, Jun 18, 2019 at 12:31 PM <git@git.openembedded.org> wrote:

> This is an automated email from the git hooks/post-receive script.
>
> rpurdie pushed a commit to branch warrior
> in repository openembedded-core.
>
> commit 02ee58ba18a0393ce372f4fe9d4860ccaaaa9486
> Author: Bruce Ashfield <bruce.ashfield@gmail.com>
> AuthorDate: Thu May 30 08:44:42 2019 -0400
>
>     linux-yocto/5.0: update to v5.0.19
>
>     Integrating the korg -stable updates that comprise the following
>     commits:
>
>        3f7c1cab1a61 Linux 5.0.19
>        64d314bd8cc8 fbdev: sm712fb: fix memory frequency by avoiding a
> switch/case fallthrough
>        e5c6d75b0f03 bpf, lru: avoid messing with eviction heuristics upon
> syscall lookup
>        b5f95aa7a88b bpf: add map_lookup_elem_sys_only for lookups from
> syscall side
>        d811930f74ac bpf: relax inode permission check for retrieving bpf
> program
>        ca7ef7e3ddfa driver core: Postpone DMA tear-down until after devres
> release for probe failure
>        bad4fbe76cfb md/raid: raid5 preserve the writeback action after the
> parity check
>        3770eb3721be Revert "Don't jump to compute_result state from
> check_result state"
>        07116a6548c8 perf/x86/intel: Fix race in intel_pmu_disable_event()
>        58d1e074c742 perf cs-etm: Always allocate memory for
> cs_etm_queue::prev_packet
>        cd448c27b08e perf bench numa: Add define for RUSAGE_THREAD if not
> present
>        7325696ce261 i2c: designware: ratelimit 'transfer when suspended'
> errors
>        8258661858d5 ufs: fix braino in ufs_get_inode_gid() for solaris UFS
> flavour
>        5b73764a5d2c KVM: selftests: make hyperv_cpuid test pass on AMD
>        fb654d0763c8 KVM: fix KVM_CLEAR_DIRTY_LOG for memory slots of
> unaligned size
>        497ce5c7f538 x86/mm/mem_encrypt: Disable all instrumentation for
> early SME setup
>        96f0be982c8a sched/cpufreq: Fix kobject memleak
>        2a9605f177f8 iwlwifi: mvm: check for length correctness in
> iwl_mvm_create_skb()
>        df5eba5f41be qmi_wwan: new Wistron, ZTE and D-Link devices
>        bd61ddd3e9fc bpf: Fix preempt_enable_no_resched() abuse
>        bd3713424a01 tools: bpftool: fix infinite loop in map create
>        1e61a219090f power: supply: sysfs: prevent endless uevent loop with
> CONFIG_POWER_SUPPLY_DEBUG
>        e6ae43922897 KVM: arm/arm64: Ensure vcpu target is unset on reset
> failure
>        5450811a02f5 net: ieee802154: fix missing checks for
> regmap_update_bits
>        15f64f420bae mac80211: Fix kernel panic due to use of txq after free
>        eff6d5429bd2 x86: kvm: hyper-v: deal with buggy TLB flush requests
> from WS2012
>        48be4d7ced2c PCI: Fix issue with "pci=disable_acs_redir" parameter
> being ignored
>        fa42fde1f8e6 apparmorfs: fix use-after-free on symlink traversal
>        cf0259f7662a securityfs: fix use-after-free on symlink traversal
>        04aa8a51e723 power: supply: cpcap-battery: Fix division by zero
>        38a725dd0be7 KVM: PPC: Book3S: Protect memslots while validating
> user address
>        eec0c746757b KVM: PPC: Book3S HV: Perserve PSSCR FAKE_SUSPEND bit
> on guest exit
>        f3adb80bb243 clk: sunxi-ng: nkmp: Avoid GENMASK(-1, 0)
>        791746a758e7 ARC: PAE40: don't panic and instead turn off hw ioc
>        30bd4585bf14 xfrm4: Fix uninitialized memory read in
> _decode_session4
>        79fad8fd2b76 xfrm: Honor original L3 slave device in xfrmi policy
> lookup
>        ff7fa2c801bc esp4: add length check for UDP encapsulation
>        4e8ce2680442 xfrm: clean up xfrm protocol checks
>        6c0db1cbf772 vti4: ipip tunnel deregistration fixes.
>        f8a427ca50d6 xfrm6_tunnel: Fix potential panic when unloading
> xfrm6_tunnel module
>        70a87327025a xfrm: Reset secpath in xfrm failure
>        9531aac1ee3e xfrm: policy: Fix out-of-bound array accesses in
> __xfrm_policy_unlink
>        07a573c046c0 fuse: Add FOPEN_STREAM to use stream_open()
>        560c6fd312c9 dm mpath: always free attached_handler_name in
> parse_path()
>        96ecf4c59f08 dm integrity: correctly calculate the size of metadata
> area
>        ecff1441aa15 dm crypt: move detailed message into debug level
>        862a78341ade dm delay: fix a crash when invalid device is specified
>        fab2e96c6be0 dm zoned: Fix zone report handling
>        ef3f84246954 dm cache metadata: Fix loading discard bitset
>        6c412dc3b757 PCI: Work around Pericom PCIe-to-PCI bridge Retrain
> Link erratum
>        d06a30b1a957 PCI: Factor out pcie_retrain_link() function
>        4f22ec9f0c28 PCI: rcar: Add the initialization of PCIe link in
> resume_noirq()
>        fbd9c6ef0dfc PCI/AER: Change pci_aer_init() stub to return void
>        be361ee757b8 PCI: Init PCIe feature bits for managed host bridge
> alloc
>        adb00a68d2dd PCI: Reset Lenovo ThinkPad P50 nvgpu at boot if
> necessary
>        2e4017e3ddfd PCI: Mark Atheros AR9462 to avoid bus reset
>        4ddfb43373ca PCI: Mark AMD Stoney Radeon R7 GPU ATS as broken
>        1fbec8aa02f3 fbdev: sm712fb: fix crashes and garbled display during
> DPMS modesetting
>        620a97786fd6 fbdev: sm712fb: use 1024x768 by default on non-MIPS,
> fix garbled display
>        b2adbace369e fbdev: sm712fb: fix support for 1024x768-16 mode
>        d119b4a43e53 fbdev: sm712fb: fix crashes during framebuffer writes
> by correctly mapping VRAM
>        39045ad5a808 fbdev: sm712fb: fix boot screen glitch when sm712fb
> replaces VGA
>        4badede3e74b fbdev: sm712fb: fix white screen of death on reboot,
> don't set CR3B-CR3F
>        62463c4661f1 fbdev: sm712fb: fix VRAM detection, don't set
> SR70/71/74/75
>        2a5d31230505 fbdev: sm712fb: fix brightness control on reboot,
> don't set SR30
>        cfe31930dac8 fbdev/efifb: Ignore framebuffer memmap entries that
> lack any memory types
>        a816dc52fe77 x86/mpx, mm/core: Fix recursive munmap() corruption
>        9d50a05607a7 objtool: Allow AR to be overridden with HOSTAR
>        93dbb5304b51 MIPS: perf: Fix build with CONFIG_CPU_BMIPS5000 enabled
>        822e8c43b08a perf intel-pt: Fix sample timestamp wrt non-taken
> branches
>        14f3460ed499 perf intel-pt: Fix improved sample timestamp
>        23abb1eed2ee perf intel-pt: Fix instructions sampling rate
>        c82da3e43ce1 memory: tegra: Fix integer overflow on tick value
> calculation
>        dda71c1663c8 tracing: probeevent: Fix to make the type of $comm
> string
>        95142e28042b tracing: Fix partial reading of trace event's id file
>        9dba717a8156 ftrace/x86_64: Emulate call function while updating in
> breakpoint handler
>        2a1069824a5c x86_64: Allow breakpoints to emulate call instructions
>        16e559791d6b x86_64: Add gap to int3 to allow for call emulation
>        69fc24195198 ceph: flush dirty inodes before proceeding with remount
>        43cc8d378ca0 iommu/tegra-smmu: Fix invalid ASID bits on Tegra30/114
>        d79e6a726acb gcc-plugins: arm_ssp_per_task_plugin: Fix for older
> GCC < 6
>        0e83f9e5ce46 ovl: fix missing upper fs freeze protection on copy up
> for ioctl
>        bf076fd44bd6 fuse: honor RLIMIT_FSIZE in fuse_file_fallocate
>        79d8f6321221 fuse: fix writepages on 32bit
>        12db517f8a3e udlfb: introduce a rendering mutex
>        0bd143ed4109 udlfb: fix sleeping inside spinlock
>        02851943751d udlfb: delete the unused parameter for
> dlfb_handle_damage
>        855e2af24ab5 clk: rockchip: fix wrong clock definitions for rk3328
>        317e574eaf6d clk: mediatek: Disable tuner_en before change PLL rate
>        b5f7027a6f79 clk: tegra: Fix PLLM programming on Tegra124+ when PMC
> overrides divider
>        87b083dbdd8f clk: hi3660: Mark clk_gate_ufs_subsys as critical
>        3c1f44469d83 PNFS fallback to MDS if no deviceid found
>        73e0d62f16ec NFS4: Fix v4.0 client state corruption when mount
>        1aa8f89cf5ad RDMA/ipoib: Allow user space differentiate between
> valid dev_port
>        90ebb540a7b1 RDMA/mlx5: Use get_zeroed_page() for clock_info
>        2132baff7e0f media: imx: Clear fwnode link struct for each endpoint
> iteration
>        7543aeaf9331 media: imx: csi: Allow unknown nearest upstream
> entities
>        8a6a542635fe media: ov6650: Fix sensor possibly not detected on
> probe
>        252f74c15935 phy: ti-pipe3: fix missing bit-wise or operator when
> assigning val
>        921bb3e9be5b cifs: fix strcat buffer overflow and reduce raciness
> in smb21_set_oplock_level()
>        6c65b5a9d829 brcmfmac: Add DMI nvram filename quirk for ACEPC T8
> and T11 mini PCs
>        e15c901c9b1f of: fix clang -Wunsequenced for be32_to_cpu()
>        a1243cd45745 p54: drop device reference count if fails to enable
> device
>        24cb69043d68 intel_th: msu: Fix single mode with IOMMU
>        86901d0a34ab dcache: sort the freeing-without-RCU-delay mess for
> good.
>        cb259d53313c md: add a missing endianness conversion in
> check_sb_changes
>        ceaae3df28ef md: add mddev->pers to avoid potential NULL pointer
> dereference
>        3d8c54fb4b8f md: batch flush requests.
>        dfbe4d1af4b3 Revert "MD: fix lock contention for flush bios"
>        be2bcbeda06b proc: prevent changes to overridden credentials
>        e2d95e6022f9 brd: re-enable __GFP_HIGHMEM in brd_insert_page()
>        019da3cf8d2d stm class: Fix channel bitmap on 32-bit systems
>        e52484d4b315 stm class: Fix channel free in stm output free path
>        7a76effe2dea parisc: Rename LEVEL to PA_ASM_LEVEL to avoid name
> clash with DRBD code
>        e2d87b36a59b parisc: Use PA_ASM_LEVEL in boot code
>        fac8648ec7ce parisc: Allow live-patching of __meminit functions
>        62c78938e3ee parisc: Add memory barrier to asm pdc and sync
> instructions
>        81641f9c6039 parisc: Skip registering LED when running in QEMU
>        f4a05c586c3a parisc: Add memory clobber to TLB purges
>        52b905433b0d parisc: Export running_on_qemu symbol for modules
>        5b3b51fe5bef regulator: core: fix error path for
> regulator_set_voltage_unlocked
>        97346dda2c99 blk-mq: free hw queue's resource in hctx's release
> handler
>        860dde8d0962 mm/gup: Remove the 'write' parameter from
> gup_fast_permitted()
>        b80fc1eed537 net/mlx5e: Fix ethtool rxfh commands when
> CONFIG_MLX5_EN_RXNFC is disabled
>        5125c4d4cfca net/mlx5: Imply MLXFW in mlx5_core
>        ac5465716ae6 net/mlx5e: Additional check for flow destination
> comparison
>        e3e09b07aab6 net/mlx5e: Add missing ethtool driver info for
> representors
>        5048d03fa137 vsock/virtio: Initialize core virtio vsock before
> registering the driver
>        ac01b87ed3ec tipc: fix modprobe tipc failed after switch order of
> device registration
>        51adb8ebe8c1 vsock/virtio: free packets during the socket release
>        3f48a2fa3d79 tipc: switch order of device registration to fix a
> crash
>        0501b80b158a rtnetlink: always put IFLA_LINK for links with a
> link-netnsid
>        4d4b20738489 ppp: deflate: Fix possible crash in deflate_init
>        ebf4338d96e9 nfp: flower: add rcu locks when accessing netdev for
> tunnels
>        d818a94975ed net: usb: qmi_wwan: add Telit 0x1260 and 0x1261
> compositions
>        18b3bb2503b4 net: test nouarg before dereferencing zerocopy pointers
>        4e6d54b16a89 net/mlx4_core: Change the error print to info print
>        708c22fedf0c net: avoid weird emergency message
>        145708e7d94c net: Always descend into dsa/
>        6c8566ebb5f1 ipv6: prevent possible fib6 leaks
>        aed9be48191f ipv6: fix src addr routing with the exception table
>        8614793dbb41 Linux 5.0.18
>        3dacabb35d7f ext4: don't update s_rev_level if not required
>        18f59db712ce ext4: fix compile error when using BUFFER_TRACE
>        593ddcbac4a4 s390/mm: convert to the generic get_user_pages_fast
> code
>        97249a2034b6 s390/mm: make the pxd_offset functions more robust
>        4999174b1a77 iov_iter: optimize page_copy_sane()
>        6e52e4b6cf50 libnvdimm/namespace: Fix label tracking error
>        63e54af2e570 xen/pvh: correctly setup the PV EFI interface for dom0
>        a1c5c7476db0 xen/pvh: set xen_domain_type to HVM in xen_pvh_init
>        9339434bdbb4 kbuild: turn auto.conf.cmd into a mandatory include
> file
>        d71c6a4b31db KVM: lapic: Busy wait for timer to expire when using
> hv_timer
>        fae3b156b196 KVM: x86: Skip EFER vs. guest CPUID checks for
> host-initiated writes
>        87e61d57ae37 KVM: Fix the bitmap range to copy during clear dirty
>        295a7bd172d2 jbd2: fix potential double free
>        a5f8b69097a3 ALSA: hda/realtek - Fix for Lenovo B50-70 inverted
> internal microphone bug
>        20f6e5999787 ALSA: hda/realtek - Fixup headphone noise via runtime
> suspend
>        5ddcddba1be6 ALSA: hda/realtek - Corrected fixup for System76
> Gazelle (gaze14)
>        ec9ff0dd9829 ext4: avoid panic during forced reboot due to aborted
> journal
>        297a39c6528c ext4: fix use-after-free in dx_release()
>        256e27da8b62 ext4: fix data corruption caused by overlapping
> unaligned and aligned IO
>        7f3b711cbf54 ext4: zero out the unused memory region in the extent
> tree block
>        bde5b8473bd3 tty: Don't force RISCV SBI console as preferred console
>        549b0b8a9479 fs/writeback.c: use rcu_barrier() to wait for inflight
> wb switches going into workqueue when umount
>        f7fea7c067fb crypto: ccm - fix incompatibility between "ccm" and
> "ccm_base"
>        638fffb11c93 ipmi:ssif: compare block number correctly for
> multi-part return messages
>        bfc6980ff235 bcache: never set KEY_PTRS of journal key to 0 in
> journal_reclaim()
>        5fa31fabc628 bcache: fix a race between cache register and cacheset
> unregister
>        0e56cc24df1a Btrfs: fix race between send and deduplication that
> lead to failures and crashes
>        0565f46b75e4 Btrfs: do not start a transaction at
> iterate_extent_inodes()
>        d48e71659e07 Btrfs: do not start a transaction during fiemap
>        e7fb540d6a06 Btrfs: send, flush dellaloc in order to avoid data loss
>        b9ee62718749 btrfs: Honour FITRIM range constraints during free
> space trim
>        4afdd2d2afbb btrfs: Correctly free extent buffer in case
> btree_read_extent_buffer_pages fails
>        1a6e5f745b57 btrfs: Check the first key and level for cached extent
> buffer
>        f325062756d0 ext4: fix ext4_show_options for file systems w/o
> journal
>        91bf9123ce86 ext4: actually request zeroing of inode table after
> grow
>        715f547a6299 ext4: fix use-after-free race with
> debug_want_extra_isize
>        310aea022196 ext4: avoid drop reference to iloc.bh twice
>        7db933229f64 ext4: ignore e_value_offs for xattrs with
> value-in-ea-inode
>        7dfca4b97693 ext4: make sanity check in mballoc more strict
>        39108bea309d jbd2: check superblock mapped prior to committing
>        033b15ff6b92 tty/vt: fix write/write race in ioctl(KDSKBSENT)
> handler
>        770e812bbc1d tty: vt.c: Fix TIOCL_BLANKSCREEN console blanking if
> blankinterval == 0
>        9537358c9452 mtd: maps: Allow MTD_PHYSMAP with MTD_RAM
>        969859b87f8b mtd: maps: physmap: Store gpio_values correctly
>        8a2c3433b51b mtd: spi-nor: intel-spi: Avoid crossing 4K address
> boundary on read/write
>        ed824ff290d3 mfd: max77620: Fix swapped FPS_PERIOD_MAX_US values
>        12061d7ce0ee mfd: da9063: Fix OTP control register names to match
> datasheets for DA9063/63L
>        966e7ae49bee ACPI: PM: Set enable_for_wake for wakeup GPEs during
> suspend-to-idle
>        09ceb529c4ac userfaultfd: use RCU to free the task struct when fork
> fails
>        3f26c01c4001 ocfs2: fix ocfs2 read inode data panic in ocfs2_iget
>        f989305d02a4 hugetlb: use same fault hash key for shared and
> private mappings
>        6720e0bc50e9 mm/hugetlb.c: don't put_page in lock of hugetlb_lock
>        ff191b1d827d mm/huge_memory: fix vmf_insert_pfn_{pmd, pud}() crash,
> handle unaligned addresses
>        535ca6f75ddb mm/mincore.c: make mincore() more conservative
>        b5b076649d2e crypto: ccree - handle tee fips error during power
> management resume
>        2380a8464ee1 crypto: ccree - add function to handle cryptocell tee
> fips error
>        22a44b51f2e0 crypto: ccree - HOST_POWER_DOWN_EN should be the last
> CC access during suspend
>        f1a7dc5d0e46 crypto: ccree - pm resume first enable the source clk
>        4a807bab1431 crypto: ccree - don't map AEAD key and IV on stack
>        a1cb31fd79be crypto: ccree - use correct internal state sizes for
> export
>        3ff036422024 crypto: ccree - don't map MAC key on stack
>        2e1679f6a1d0 crypto: ccree - fix mem leak on error path
>        23a072df0482 crypto: ccree - remove special handling of chained sg
>        8efcdb781463 bpf, arm64: remove prefetch insn in xadd mapping
>        fd049ce703c3 ASoC: codec: hdac_hdmi add device_link to card device
>        519511e47f79 ASoC: fsl_esai: Fix missing break in switch statement
>        94748513d811 ASoC: RT5677-SPI: Disable 16Bit SPI Transfers
>        dccbcc8060c8 ASoC: max98090: Fix restore of DAPM Muxes
>        b2c90ad71e00 ALSA: hdea/realtek - Headset fixup for System76
> Gazelle (gaze14)
>        0a1cf4fdc58b ALSA: hda/realtek - EAPD turn on later
>        98ffad31068d ALSA: hda/hdmi - Consider eld_valid when reporting
> jack event
>        787d1c606f1a ALSA: hda/hdmi - Read the pin sense from register when
> repolling
>        bc3c4c9e00b0 ALSA: usb-audio: Fix a memory leak bug
>        592b655a306b ALSA: line6: toneport: Fix broken usage of timer for
> delayed execution
>        978e70ead670 mmc: sdhci-pci: Fix BYT OCP setting
>        56f590e2e30a mmc: core: Fix tag set memory leak
>        1ea20c66648a mmc: tegra: fix ddr signaling for non-ddr modes
>        4ea5e92a20b9 crypto: arm64/aes-neonbs - don't access already-freed
> walk.iv
>        b51455e5493a crypto: arm/aes-neonbs - don't access already-freed
> walk.iv
>        86d478d06696 crypto: caam/qi2 - generate hash keys in-place
>        fd2830991e56 crypto: caam/qi2 - fix DMA mapping of stack memory
>        0eaed393b4ec crypto: caam/qi2 - fix zero-length buffer DMA mapping
>        86add9b56835 crypto: rockchip - update IV buffer to contain the
> next IV
>        8d9cdf34aaf9 crypto: gcm - fix incompatibility between "gcm" and
> "gcm_base"
>        246ef445e015 crypto: arm64/gcm-aes-ce - fix no-NEON fallback code
>        47a9de26eb06 crypto: x86/crct10dif-pcl - fix use via
> crypto_shash_digest()
>        8eb6266c8eb1 crypto: crct10dif-generic - fix use via
> crypto_shash_digest()
>        043e69dd7fef crypto: skcipher - don't WARN on unprocessed data
> after slow walk step
>        2c0f409ba69c crypto: vmx - fix copy-paste error in CTR mode
>        8d02b83b332b crypto: ccp - Do not free psp_master when
> PLATFORM_INIT fails
>        fdcd8b3b745e crypto: chacha20poly1305 - set cra_name correctly
>        d6d54c7c59c6 crypto: chacha-generic - fix use as arm64 no-NEON
> fallback
>        0a348941ad06 crypto: lrw - don't access already-freed walk.iv
>        25f1509c739f crypto: salsa20 - don't access already-freed walk.iv
>        fb7261b31a2c crypto: crypto4xx - fix cfb and ofb "overran dst
> buffer" issues
>        3149ac3ef4e6 crypto: crypto4xx - fix ctr-aes missing output IV
>        5404a6ff7458 x86/MCE/AMD: Don't report L1 BTB MCA errors on some
> family 17h models
>        ad09c6ef2dcb x86/MCE: Group AMD function prototypes in <asm/mce.h>
>        b05237350b4a x86/MCE/AMD: Carve out the MC4_MISC thresholding quirk
>        e6b8b66f965e x86/MCE/AMD: Turn off MC4_MISC thresholding on all
> family 0x15 models
>        993a6595b253 x86/MCE: Add an MCE-record filtering function
>        52176123f9cb sched/x86: Save [ER]FLAGS on context switch
>        d81b4ae57fe9 arm64: Save and restore OSDLR_EL1 across suspend/resume
>        bd254f9d1157 arm64: Clear OSDLR_EL1 on CPU boot
>        a184f8889306 arm64: compat: Reduce address limit
>        e57320e0177a arm64: arch_timer: Ensure counter register reads occur
> with seqlock held
>        32e802d947ca arm64: mmap: Ensure file offset is treated as unsigned
>        38a6f722c01a power: supply: axp288_fuel_gauge: Add ACEPC T8 and T11
> mini PCs to the blacklist
>        a4e41f047a3e power: supply: axp288_charger: Fix unchecked return
> value
>        fe3f22b7084d ARM: exynos: Fix a leaked reference by adding missing
> of_node_put
>        a6bc3bfb8206 mmc: sdhci-of-arasan: Add DTS property to disable
> DCMDs.
>        bf6cb21717f4 ARM: dts: exynos: Fix audio (microphone) routing on
> Odroid XU3
>        de42e519cbee ARM: dts: exynos: Fix interrupt for shared EINTs on
> Exynos5260
>        3ea393bb1ca4 ARM: dts: qcom: ipq4019: enlarge PCIe BAR range
>        5d6fa0370c51 arm64: dts: rockchip: Disable DCMDs on RK3399's eMMC
> controller.
>        5414a4761988 arm64: dts: rockchip: fix IO domain voltage setting of
> APIO5 on rockpro64
>        8c1134ff70df objtool: Fix function fallthrough detection
>        bc19bb7d8d10 x86/speculation/mds: Improve CPU buffer clear
> documentation
>        d2214ccfecb5 x86/speculation/mds: Revert CPU buffer clear on double
> fault exit
>        bfcac7872252 locking/rwsem: Prevent decrement of reader count
> before increment
>
>     Signed-off-by: Bruce Ashfield <bruce.ashfield@gmail.com>
>     Signed-off-by: Richard Purdie <richard.purdie@linuxfoundation.org>
>     Signed-off-by: Armin Kuster <akuster808@gmail.com>
> ---
>  meta/recipes-kernel/linux/linux-yocto-rt_5.0.bb   |  6 +++---
>  meta/recipes-kernel/linux/linux-yocto-tiny_5.0.bb |  8 ++++----
>  meta/recipes-kernel/linux/linux-yocto_5.0.bb      | 20
> ++++++++++----------
>  3 files changed, 17 insertions(+), 17 deletions(-)
>
> diff --git a/meta/recipes-kernel/linux/linux-yocto-rt_5.0.bb
> b/meta/recipes-kernel/linux/linux-yocto-rt_5.0.bb
> index 36db6b6..b8ca4a2 100644
> --- a/meta/recipes-kernel/linux/linux-yocto-rt_5.0.bb
> +++ b/meta/recipes-kernel/linux/linux-yocto-rt_5.0.bb
> @@ -11,13 +11,13 @@ python () {
>          raise bb.parse.SkipRecipe("Set PREFERRED_PROVIDER_virtual/kernel
> to linux-yocto-rt to enable it")
>  }
>
> -SRCREV_machine ?= "cc66f1b95af7b75d25b0155203df9db801273fd2"
> -SRCREV_meta ?= "2bc19ce252b1ce753056b32c55f55f515698b42a"
> +SRCREV_machine ?= "9376c193ebe7db89847195a749c2a200a1273c33"
> +SRCREV_meta ?= "9262e21627a82956fb85eef0024135ce5179c73b"
>
>  SRC_URI = "git://
> git.yoctoproject.org/linux-yocto.git;branch=${KBRANCH};name=machine
> <http://git.yoctoproject.org/linux-yocto.git;branch=$%7BKBRANCH%7D;name=machine>
> \
>             git://
> git.yoctoproject.org/yocto-kernel-cache;type=kmeta;name=meta;branch=yocto-5.0;destsuffix=${KMETA}
> <http://git.yoctoproject.org/yocto-kernel-cache;type=kmeta;name=meta;branch=yocto-5.0;destsuffix=$%7BKMETA%7D>
> "
>
> -LINUX_VERSION ?= "5.0.17"
> +LINUX_VERSION ?= "5.0.19"
>
>  LIC_FILES_CHKSUM = "file://COPYING;md5=bbea815ee2795b2f4230826c0c6b8814"
>
> diff --git a/meta/recipes-kernel/linux/linux-yocto-tiny_5.0.bb
> b/meta/recipes-kernel/linux/linux-yocto-tiny_5.0.bb
> index 9888a3f..b3bb1f4 100644
> --- a/meta/recipes-kernel/linux/linux-yocto-tiny_5.0.bb
> +++ b/meta/recipes-kernel/linux/linux-yocto-tiny_5.0.bb
> @@ -6,7 +6,7 @@ KCONFIG_MODE = "--allnoconfig"
>
>  require recipes-kernel/linux/linux-yocto.inc
>
> -LINUX_VERSION ?= "5.0.17"
> +LINUX_VERSION ?= "5.0.19"
>  LIC_FILES_CHKSUM = "file://COPYING;md5=bbea815ee2795b2f4230826c0c6b8814"
>
>  DEPENDS += "${@bb.utils.contains('ARCH', 'x86', 'elfutils-native', '',
> d)}"
> @@ -15,9 +15,9 @@ DEPENDS += "openssl-native util-linux-native"
>  KMETA = "kernel-meta"
>  KCONF_BSP_AUDIT_LEVEL = "2"
>
> -SRCREV_machine_qemuarm ?= "bb915f6be9a133fd702b152aa456cc31eea0936e"
> -SRCREV_machine ?= "fa6f061d0da0c15c8685e6fad5b8ccc96a2e212c"
> -SRCREV_meta ?= "2bc19ce252b1ce753056b32c55f55f515698b42a"
> +SRCREV_machine_qemuarm ?= "fabee455f397ba8054f35a3ad5f2250bbad93bef"
> +SRCREV_machine ?= "00638cdd8f92869a0f89ebe3289fdbd856ba9458"
> +SRCREV_meta ?= "9262e21627a82956fb85eef0024135ce5179c73b"
>
>  PV = "${LINUX_VERSION}+git${SRCPV}"
>
> diff --git a/meta/recipes-kernel/linux/linux-yocto_5.0.bb
> b/meta/recipes-kernel/linux/linux-yocto_5.0.bb
> index dfbe495..1b2224d 100644
> --- a/meta/recipes-kernel/linux/linux-yocto_5.0.bb
> +++ b/meta/recipes-kernel/linux/linux-yocto_5.0.bb
> @@ -11,15 +11,15 @@ KBRANCH_qemux86  ?= "v5.0/standard/base"
>  KBRANCH_qemux86-64 ?= "v5.0/standard/base"
>  KBRANCH_qemumips64 ?= "v5.0/standard/mti-malta64"
>
> -SRCREV_machine_qemuarm ?= "0cf286c38da5959520f6c01e606c722deb069fd1"
> -SRCREV_machine_qemuarm64 ?= "fa6f061d0da0c15c8685e6fad5b8ccc96a2e212c"
> -SRCREV_machine_qemumips ?= "577fd817ec6c9566277b341ac5911ea657ec5ba4"
> -SRCREV_machine_qemuppc ?= "fa6f061d0da0c15c8685e6fad5b8ccc96a2e212c"
> -SRCREV_machine_qemux86 ?= "fa6f061d0da0c15c8685e6fad5b8ccc96a2e212c"
> -SRCREV_machine_qemux86-64 ?= "fa6f061d0da0c15c8685e6fad5b8ccc96a2e212c"
> -SRCREV_machine_qemumips64 ?= "f9e63bc3f0ee65f03b3f9963a938668e6abf9425"
> -SRCREV_machine ?= "fa6f061d0da0c15c8685e6fad5b8ccc96a2e212c"
> -SRCREV_meta ?= "2bc19ce252b1ce753056b32c55f55f515698b42a"
> +SRCREV_machine_qemuarm ?= "9161b2fa2f1cec0ba02976c389c788445858e0de"
> +SRCREV_machine_qemuarm64 ?= "00638cdd8f92869a0f89ebe3289fdbd856ba9458"
> +SRCREV_machine_qemumips ?= "7de9b8f0db98e51a666477c8e2b64f1964b45410"
> +SRCREV_machine_qemuppc ?= "00638cdd8f92869a0f89ebe3289fdbd856ba9458"
> +SRCREV_machine_qemux86 ?= "00638cdd8f92869a0f89ebe3289fdbd856ba9458"
> +SRCREV_machine_qemux86-64 ?= "00638cdd8f92869a0f89ebe3289fdbd856ba9458"
> +SRCREV_machine_qemumips64 ?= "5a8b27bcc0b16077ab8edfcd3fb25c80dc2c652e"
> +SRCREV_machine ?= "00638cdd8f92869a0f89ebe3289fdbd856ba9458"
> +SRCREV_meta ?= "9262e21627a82956fb85eef0024135ce5179c73b"
>
>  # remap qemuarm to qemuarma15 for the 5.0 kernel
>  # KMACHINE_qemuarm ?= "qemuarma15"
> @@ -28,7 +28,7 @@ SRC_URI = "git://
> git.yoctoproject.org/linux-yocto.git;name=machine;branch=${KBRA
> <http://git.yoctoproject.org/linux-yocto.git;name=machine;branch=$%7BKBRA>
>             git://
> git.yoctoproject.org/yocto-kernel-cache;type=kmeta;name=meta;branch=yocto-5.0;destsuffix=${KMETA}
> <http://git.yoctoproject.org/yocto-kernel-cache;type=kmeta;name=meta;branch=yocto-5.0;destsuffix=$%7BKMETA%7D>
> "
>
>  LIC_FILES_CHKSUM = "file://COPYING;md5=bbea815ee2795b2f4230826c0c6b8814"
> -LINUX_VERSION ?= "5.0.17"
> +LINUX_VERSION ?= "5.0.19"
>
>  DEPENDS += "${@bb.utils.contains('ARCH', 'x86', 'elfutils-native', '',
> d)}"
>  DEPENDS += "openssl-native util-linux-native"
>
> --
> To stop receiving notification emails like this one, please contact
> the administrator of this repository.
> --
> _______________________________________________
> Openembedded-commits mailing list
> Openembedded-commits@lists.openembedded.org
> http://lists.openembedded.org/mailman/listinfo/openembedded-commits
>

--0000000000008b21bd058bc63a6e
Content-Type: text/html; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

<div dir=3D"ltr"><pre class=3D"gmail-console-output" style=3D"box-sizing:bo=
rder-box;white-space:pre-wrap;margin-top:0px;margin-bottom:0px;color:rgb(51=
,51,51);font-size:15px">Hi,</pre><pre class=3D"gmail-console-output" style=
=3D"box-sizing:border-box;white-space:pre-wrap;margin-top:0px;margin-bottom=
:0px;color:rgb(51,51,51);font-size:15px"><br></pre><pre class=3D"gmail-cons=
ole-output" style=3D"box-sizing:border-box;white-space:pre-wrap;margin-top:=
0px;margin-bottom:0px;color:rgb(51,51,51);font-size:15px">One of these rece=
nt updates is causing following WARNING:

</pre><pre class=3D"gmail-console-output" style=3D"box-sizing:border-box;wh=
ite-space:pre-wrap;margin-top:0px;margin-bottom:0px;color:rgb(51,51,51);fon=
t-size:15px">---------- CONFIG_SCSI_DEBUG -----------------
Config: CONFIG_SCSI_DEBUG
From: work-shared/qemuarm/kernel-source/.kernel-meta/configs/v5.0/standard/=
features/scsi/scsi-debug.cfg
Requested value:  CONFIG_SCSI_DEBUG=3Dm
Actual value:    =20

No reference to SCSI_DEBUG found</pre></div><br><div class=3D"gmail_quote">=
<div dir=3D"ltr" class=3D"gmail_attr">On Tue, Jun 18, 2019 at 12:31 PM &lt;=
<a href=3D"mailto:git@git.openembedded.org">git@git.openembedded.org</a>&gt=
; wrote:<br></div><blockquote class=3D"gmail_quote" style=3D"margin:0px 0px=
 0px 0.8ex;border-left:1px solid rgb(204,204,204);padding-left:1ex">This is=
 an automated email from the git hooks/post-receive script.<br>
<br>
rpurdie pushed a commit to branch warrior<br>
in repository openembedded-core.<br>
<br>
commit 02ee58ba18a0393ce372f4fe9d4860ccaaaa9486<br>
Author: Bruce Ashfield &lt;<a href=3D"mailto:bruce.ashfield@gmail.com" targ=
et=3D"_blank">bruce.ashfield@gmail.com</a>&gt;<br>
AuthorDate: Thu May 30 08:44:42 2019 -0400<br>
<br>
=C2=A0 =C2=A0 linux-yocto/5.0: update to v5.0.19<br>
<br>
=C2=A0 =C2=A0 Integrating the korg -stable updates that comprise the follow=
ing<br>
=C2=A0 =C2=A0 commits:<br>
<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A03f7c1cab1a61 Linux 5.0.19<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A064d314bd8cc8 fbdev: sm712fb: fix memory frequenc=
y by avoiding a switch/case fallthrough<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0e5c6d75b0f03 bpf, lru: avoid messing with evicti=
on heuristics upon syscall lookup<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0b5f95aa7a88b bpf: add map_lookup_elem_sys_only f=
or lookups from syscall side<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0d811930f74ac bpf: relax inode permission check f=
or retrieving bpf program<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0ca7ef7e3ddfa driver core: Postpone DMA tear-down=
 until after devres release for probe failure<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0bad4fbe76cfb md/raid: raid5 preserve the writeba=
ck action after the parity check<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A03770eb3721be Revert &quot;Don&#39;t jump to comp=
ute_result state from check_result state&quot;<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A007116a6548c8 perf/x86/intel: Fix race in intel_p=
mu_disable_event()<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A058d1e074c742 perf cs-etm: Always allocate memory=
 for cs_etm_queue::prev_packet<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0cd448c27b08e perf bench numa: Add define for RUS=
AGE_THREAD if not present<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A07325696ce261 i2c: designware: ratelimit &#39;tra=
nsfer when suspended&#39; errors<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A08258661858d5 ufs: fix braino in ufs_get_inode_gi=
d() for solaris UFS flavour<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A05b73764a5d2c KVM: selftests: make hyperv_cpuid t=
est pass on AMD<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0fb654d0763c8 KVM: fix KVM_CLEAR_DIRTY_LOG for me=
mory slots of unaligned size<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0497ce5c7f538 x86/mm/mem_encrypt: Disable all ins=
trumentation for early SME setup<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A096f0be982c8a sched/cpufreq: Fix kobject memleak<=
br>
=C2=A0 =C2=A0 =C2=A0 =C2=A02a9605f177f8 iwlwifi: mvm: check for length corr=
ectness in iwl_mvm_create_skb()<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0df5eba5f41be qmi_wwan: new Wistron, ZTE and D-Li=
nk devices<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0bd61ddd3e9fc bpf: Fix preempt_enable_no_resched(=
) abuse<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0bd3713424a01 tools: bpftool: fix infinite loop i=
n map create<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A01e61a219090f power: supply: sysfs: prevent endle=
ss uevent loop with CONFIG_POWER_SUPPLY_DEBUG<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0e6ae43922897 KVM: arm/arm64: Ensure vcpu target =
is unset on reset failure<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A05450811a02f5 net: ieee802154: fix missing checks=
 for regmap_update_bits<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A015f64f420bae mac80211: Fix kernel panic due to u=
se of txq after free<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0eff6d5429bd2 x86: kvm: hyper-v: deal with buggy =
TLB flush requests from WS2012<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A048be4d7ced2c PCI: Fix issue with &quot;pci=3Ddis=
able_acs_redir&quot; parameter being ignored<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0fa42fde1f8e6 apparmorfs: fix use-after-free on s=
ymlink traversal<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0cf0259f7662a securityfs: fix use-after-free on s=
ymlink traversal<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A004aa8a51e723 power: supply: cpcap-battery: Fix d=
ivision by zero<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A038a725dd0be7 KVM: PPC: Book3S: Protect memslots =
while validating user address<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0eec0c746757b KVM: PPC: Book3S HV: Perserve PSSCR=
 FAKE_SUSPEND bit on guest exit<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0f3adb80bb243 clk: sunxi-ng: nkmp: Avoid GENMASK(=
-1, 0)<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0791746a758e7 ARC: PAE40: don&#39;t panic and ins=
tead turn off hw ioc<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A030bd4585bf14 xfrm4: Fix uninitialized memory rea=
d in _decode_session4<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A079fad8fd2b76 xfrm: Honor original L3 slave devic=
e in xfrmi policy lookup<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0ff7fa2c801bc esp4: add length check for UDP enca=
psulation<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A04e8ce2680442 xfrm: clean up xfrm protocol checks=
<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A06c0db1cbf772 vti4: ipip tunnel deregistration fi=
xes.<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0f8a427ca50d6 xfrm6_tunnel: Fix potential panic w=
hen unloading xfrm6_tunnel module<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A070a87327025a xfrm: Reset secpath in xfrm failure=
<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A09531aac1ee3e xfrm: policy: Fix out-of-bound arra=
y accesses in __xfrm_policy_unlink<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A007a573c046c0 fuse: Add FOPEN_STREAM to use strea=
m_open()<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0560c6fd312c9 dm mpath: always free attached_hand=
ler_name in parse_path()<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A096ecf4c59f08 dm integrity: correctly calculate t=
he size of metadata area<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0ecff1441aa15 dm crypt: move detailed message int=
o debug level<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0862a78341ade dm delay: fix a crash when invalid =
device is specified<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0fab2e96c6be0 dm zoned: Fix zone report handling<=
br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0ef3f84246954 dm cache metadata: Fix loading disc=
ard bitset<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A06c412dc3b757 PCI: Work around Pericom PCIe-to-PC=
I bridge Retrain Link erratum<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0d06a30b1a957 PCI: Factor out pcie_retrain_link()=
 function<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A04f22ec9f0c28 PCI: rcar: Add the initialization o=
f PCIe link in resume_noirq()<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0fbd9c6ef0dfc PCI/AER: Change pci_aer_init() stub=
 to return void<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0be361ee757b8 PCI: Init PCIe feature bits for man=
aged host bridge alloc<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0adb00a68d2dd PCI: Reset Lenovo ThinkPad P50 nvgp=
u at boot if necessary<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A02e4017e3ddfd PCI: Mark Atheros AR9462 to avoid b=
us reset<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A04ddfb43373ca PCI: Mark AMD Stoney Radeon R7 GPU =
ATS as broken<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A01fbec8aa02f3 fbdev: sm712fb: fix crashes and gar=
bled display during DPMS modesetting<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0620a97786fd6 fbdev: sm712fb: use 1024x768 by def=
ault on non-MIPS, fix garbled display<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0b2adbace369e fbdev: sm712fb: fix support for 102=
4x768-16 mode<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0d119b4a43e53 fbdev: sm712fb: fix crashes during =
framebuffer writes by correctly mapping VRAM<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A039045ad5a808 fbdev: sm712fb: fix boot screen gli=
tch when sm712fb replaces VGA<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A04badede3e74b fbdev: sm712fb: fix white screen of=
 death on reboot, don&#39;t set CR3B-CR3F<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A062463c4661f1 fbdev: sm712fb: fix VRAM detection,=
 don&#39;t set SR70/71/74/75<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A02a5d31230505 fbdev: sm712fb: fix brightness cont=
rol on reboot, don&#39;t set SR30<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0cfe31930dac8 fbdev/efifb: Ignore framebuffer mem=
map entries that lack any memory types<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0a816dc52fe77 x86/mpx, mm/core: Fix recursive mun=
map() corruption<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A09d50a05607a7 objtool: Allow AR to be overridden =
with HOSTAR<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A093dbb5304b51 MIPS: perf: Fix build with CONFIG_C=
PU_BMIPS5000 enabled<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0822e8c43b08a perf intel-pt: Fix sample timestamp=
 wrt non-taken branches<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A014f3460ed499 perf intel-pt: Fix improved sample =
timestamp<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A023abb1eed2ee perf intel-pt: Fix instructions sam=
pling rate<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0c82da3e43ce1 memory: tegra: Fix integer overflow=
 on tick value calculation<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0dda71c1663c8 tracing: probeevent: Fix to make th=
e type of $comm string<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A095142e28042b tracing: Fix partial reading of tra=
ce event&#39;s id file<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A09dba717a8156 ftrace/x86_64: Emulate call functio=
n while updating in breakpoint handler<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A02a1069824a5c x86_64: Allow breakpoints to emulat=
e call instructions<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A016e559791d6b x86_64: Add gap to int3 to allow fo=
r call emulation<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A069fc24195198 ceph: flush dirty inodes before pro=
ceeding with remount<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A043cc8d378ca0 iommu/tegra-smmu: Fix invalid ASID =
bits on Tegra30/114<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0d79e6a726acb gcc-plugins: arm_ssp_per_task_plugi=
n: Fix for older GCC &lt; 6<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A00e83f9e5ce46 ovl: fix missing upper fs freeze pr=
otection on copy up for ioctl<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0bf076fd44bd6 fuse: honor RLIMIT_FSIZE in fuse_fi=
le_fallocate<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A079d8f6321221 fuse: fix writepages on 32bit<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A012db517f8a3e udlfb: introduce a rendering mutex<=
br>
=C2=A0 =C2=A0 =C2=A0 =C2=A00bd143ed4109 udlfb: fix sleeping inside spinlock=
<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A002851943751d udlfb: delete the unused parameter =
for dlfb_handle_damage<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0855e2af24ab5 clk: rockchip: fix wrong clock defi=
nitions for rk3328<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0317e574eaf6d clk: mediatek: Disable tuner_en bef=
ore change PLL rate<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0b5f7027a6f79 clk: tegra: Fix PLLM programming on=
 Tegra124+ when PMC overrides divider<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A087b083dbdd8f clk: hi3660: Mark clk_gate_ufs_subs=
ys as critical<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A03c1f44469d83 PNFS fallback to MDS if no deviceid=
 found<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A073e0d62f16ec NFS4: Fix v4.0 client state corrupt=
ion when mount<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A01aa8f89cf5ad RDMA/ipoib: Allow user space differ=
entiate between valid dev_port<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A090ebb540a7b1 RDMA/mlx5: Use get_zeroed_page() fo=
r clock_info<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A02132baff7e0f media: imx: Clear fwnode link struc=
t for each endpoint iteration<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A07543aeaf9331 media: imx: csi: Allow unknown near=
est upstream entities<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A08a6a542635fe media: ov6650: Fix sensor possibly =
not detected on probe<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0252f74c15935 phy: ti-pipe3: fix missing bit-wise=
 or operator when assigning val<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0921bb3e9be5b cifs: fix strcat buffer overflow an=
d reduce raciness in smb21_set_oplock_level()<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A06c65b5a9d829 brcmfmac: Add DMI nvram filename qu=
irk for ACEPC T8 and T11 mini PCs<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0e15c901c9b1f of: fix clang -Wunsequenced for be3=
2_to_cpu()<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0a1243cd45745 p54: drop device reference count if=
 fails to enable device<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A024cb69043d68 intel_th: msu: Fix single mode with=
 IOMMU<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A086901d0a34ab dcache: sort the freeing-without-RC=
U-delay mess for good.<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0cb259d53313c md: add a missing endianness conver=
sion in check_sb_changes<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0ceaae3df28ef md: add mddev-&gt;pers to avoid pot=
ential NULL pointer dereference<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A03d8c54fb4b8f md: batch flush requests.<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0dfbe4d1af4b3 Revert &quot;MD: fix lock contentio=
n for flush bios&quot;<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0be2bcbeda06b proc: prevent changes to overridden=
 credentials<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0e2d95e6022f9 brd: re-enable __GFP_HIGHMEM in brd=
_insert_page()<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0019da3cf8d2d stm class: Fix channel bitmap on 32=
-bit systems<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0e52484d4b315 stm class: Fix channel free in stm =
output free path<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A07a76effe2dea parisc: Rename LEVEL to PA_ASM_LEVE=
L to avoid name clash with DRBD code<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0e2d87b36a59b parisc: Use PA_ASM_LEVEL in boot co=
de<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0fac8648ec7ce parisc: Allow live-patching of __me=
minit functions<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A062c78938e3ee parisc: Add memory barrier to asm p=
dc and sync instructions<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A081641f9c6039 parisc: Skip registering LED when r=
unning in QEMU<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0f4a05c586c3a parisc: Add memory clobber to TLB p=
urges<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A052b905433b0d parisc: Export running_on_qemu symb=
ol for modules<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A05b3b51fe5bef regulator: core: fix error path for=
 regulator_set_voltage_unlocked<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A097346dda2c99 blk-mq: free hw queue&#39;s resourc=
e in hctx&#39;s release handler<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0860dde8d0962 mm/gup: Remove the &#39;write&#39; =
parameter from gup_fast_permitted()<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0b80fc1eed537 net/mlx5e: Fix ethtool rxfh command=
s when CONFIG_MLX5_EN_RXNFC is disabled<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A05125c4d4cfca net/mlx5: Imply MLXFW in mlx5_core<=
br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0ac5465716ae6 net/mlx5e: Additional check for flo=
w destination comparison<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0e3e09b07aab6 net/mlx5e: Add missing ethtool driv=
er info for representors<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A05048d03fa137 vsock/virtio: Initialize core virti=
o vsock before registering the driver<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0ac01b87ed3ec tipc: fix modprobe tipc failed afte=
r switch order of device registration<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A051adb8ebe8c1 vsock/virtio: free packets during t=
he socket release<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A03f48a2fa3d79 tipc: switch order of device regist=
ration to fix a crash<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A00501b80b158a rtnetlink: always put IFLA_LINK for=
 links with a link-netnsid<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A04d4b20738489 ppp: deflate: Fix possible crash in=
 deflate_init<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0ebf4338d96e9 nfp: flower: add rcu locks when acc=
essing netdev for tunnels<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0d818a94975ed net: usb: qmi_wwan: add Telit 0x126=
0 and 0x1261 compositions<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A018b3bb2503b4 net: test nouarg before dereferenci=
ng zerocopy pointers<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A04e6d54b16a89 net/mlx4_core: Change the error pri=
nt to info print<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0708c22fedf0c net: avoid weird emergency message<=
br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0145708e7d94c net: Always descend into dsa/<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A06c8566ebb5f1 ipv6: prevent possible fib6 leaks<b=
r>
=C2=A0 =C2=A0 =C2=A0 =C2=A0aed9be48191f ipv6: fix src addr routing with the=
 exception table<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A08614793dbb41 Linux 5.0.18<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A03dacabb35d7f ext4: don&#39;t update s_rev_level =
if not required<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A018f59db712ce ext4: fix compile error when using =
BUFFER_TRACE<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0593ddcbac4a4 s390/mm: convert to the generic get=
_user_pages_fast code<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A097249a2034b6 s390/mm: make the pxd_offset functi=
ons more robust<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A04999174b1a77 iov_iter: optimize page_copy_sane()=
<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A06e52e4b6cf50 libnvdimm/namespace: Fix label trac=
king error<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A063e54af2e570 xen/pvh: correctly setup the PV EFI=
 interface for dom0<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0a1c5c7476db0 xen/pvh: set xen_domain_type to HVM=
 in xen_pvh_init<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A09339434bdbb4 kbuild: turn auto.conf.cmd into a m=
andatory include file<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0d71c6a4b31db KVM: lapic: Busy wait for timer to =
expire when using hv_timer<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0fae3b156b196 KVM: x86: Skip EFER vs. guest CPUID=
 checks for host-initiated writes<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A087e61d57ae37 KVM: Fix the bitmap range to copy d=
uring clear dirty<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0295a7bd172d2 jbd2: fix potential double free<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0a5f8b69097a3 ALSA: hda/realtek - Fix for Lenovo =
B50-70 inverted internal microphone bug<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A020f6e5999787 ALSA: hda/realtek - Fixup headphone=
 noise via runtime suspend<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A05ddcddba1be6 ALSA: hda/realtek - Corrected fixup=
 for System76 Gazelle (gaze14)<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0ec9ff0dd9829 ext4: avoid panic during forced reb=
oot due to aborted journal<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0297a39c6528c ext4: fix use-after-free in dx_rele=
ase()<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0256e27da8b62 ext4: fix data corruption caused by=
 overlapping unaligned and aligned IO<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A07f3b711cbf54 ext4: zero out the unused memory re=
gion in the extent tree block<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0bde5b8473bd3 tty: Don&#39;t force RISCV SBI cons=
ole as preferred console<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0549b0b8a9479 fs/writeback.c: use rcu_barrier() t=
o wait for inflight wb switches going into workqueue when umount<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0f7fea7c067fb crypto: ccm - fix incompatibility b=
etween &quot;ccm&quot; and &quot;ccm_base&quot;<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0638fffb11c93 ipmi:ssif: compare block number cor=
rectly for multi-part return messages<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0bfc6980ff235 bcache: never set KEY_PTRS of journ=
al key to 0 in journal_reclaim()<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A05fa31fabc628 bcache: fix a race between cache re=
gister and cacheset unregister<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A00e56cc24df1a Btrfs: fix race between send and de=
duplication that lead to failures and crashes<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A00565f46b75e4 Btrfs: do not start a transaction a=
t iterate_extent_inodes()<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0d48e71659e07 Btrfs: do not start a transaction d=
uring fiemap<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0e7fb540d6a06 Btrfs: send, flush dellaloc in orde=
r to avoid data loss<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0b9ee62718749 btrfs: Honour FITRIM range constrai=
nts during free space trim<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A04afdd2d2afbb btrfs: Correctly free extent buffer=
 in case btree_read_extent_buffer_pages fails<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A01a6e5f745b57 btrfs: Check the first key and leve=
l for cached extent buffer<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0f325062756d0 ext4: fix ext4_show_options for fil=
e systems w/o journal<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A091bf9123ce86 ext4: actually request zeroing of i=
node table after grow<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0715f547a6299 ext4: fix use-after-free race with =
debug_want_extra_isize<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0310aea022196 ext4: avoid drop reference to <a hr=
ef=3D"http://iloc.bh" rel=3D"noreferrer" target=3D"_blank">iloc.bh</a> twic=
e<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A07db933229f64 ext4: ignore e_value_offs for xattr=
s with value-in-ea-inode<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A07dfca4b97693 ext4: make sanity check in mballoc =
more strict<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A039108bea309d jbd2: check superblock mapped prior=
 to committing<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0033b15ff6b92 tty/vt: fix write/write race in ioc=
tl(KDSKBSENT) handler<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0770e812bbc1d tty: vt.c: Fix TIOCL_BLANKSCREEN co=
nsole blanking if blankinterval =3D=3D 0<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A09537358c9452 mtd: maps: Allow MTD_PHYSMAP with M=
TD_RAM<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0969859b87f8b mtd: maps: physmap: Store gpio_valu=
es correctly<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A08a2c3433b51b mtd: spi-nor: intel-spi: Avoid cros=
sing 4K address boundary on read/write<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0ed824ff290d3 mfd: max77620: Fix swapped FPS_PERI=
OD_MAX_US values<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A012061d7ce0ee mfd: da9063: Fix OTP control regist=
er names to match datasheets for DA9063/63L<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0966e7ae49bee ACPI: PM: Set enable_for_wake for w=
akeup GPEs during suspend-to-idle<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A009ceb529c4ac userfaultfd: use RCU to free the ta=
sk struct when fork fails<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A03f26c01c4001 ocfs2: fix ocfs2 read inode data pa=
nic in ocfs2_iget<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0f989305d02a4 hugetlb: use same fault hash key fo=
r shared and private mappings<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A06720e0bc50e9 mm/hugetlb.c: don&#39;t put_page in=
 lock of hugetlb_lock<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0ff191b1d827d mm/huge_memory: fix vmf_insert_pfn_=
{pmd, pud}() crash, handle unaligned addresses<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0535ca6f75ddb mm/mincore.c: make mincore() more c=
onservative<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0b5b076649d2e crypto: ccree - handle tee fips err=
or during power management resume<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A02380a8464ee1 crypto: ccree - add function to han=
dle cryptocell tee fips error<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A022a44b51f2e0 crypto: ccree - HOST_POWER_DOWN_EN =
should be the last CC access during suspend<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0f1a7dc5d0e46 crypto: ccree - pm resume first ena=
ble the source clk<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A04a807bab1431 crypto: ccree - don&#39;t map AEAD =
key and IV on stack<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0a1cb31fd79be crypto: ccree - use correct interna=
l state sizes for export<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A03ff036422024 crypto: ccree - don&#39;t map MAC k=
ey on stack<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A02e1679f6a1d0 crypto: ccree - fix mem leak on err=
or path<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A023a072df0482 crypto: ccree - remove special hand=
ling of chained sg<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A08efcdb781463 bpf, arm64: remove prefetch insn in=
 xadd mapping<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0fd049ce703c3 ASoC: codec: hdac_hdmi add device_l=
ink to card device<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0519511e47f79 ASoC: fsl_esai: Fix missing break i=
n switch statement<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A094748513d811 ASoC: RT5677-SPI: Disable 16Bit SPI=
 Transfers<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0dccbcc8060c8 ASoC: max98090: Fix restore of DAPM=
 Muxes<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0b2c90ad71e00 ALSA: hdea/realtek - Headset fixup =
for System76 Gazelle (gaze14)<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A00a1cf4fdc58b ALSA: hda/realtek - EAPD turn on la=
ter<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A098ffad31068d ALSA: hda/hdmi - Consider eld_valid=
 when reporting jack event<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0787d1c606f1a ALSA: hda/hdmi - Read the pin sense=
 from register when repolling<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0bc3c4c9e00b0 ALSA: usb-audio: Fix a memory leak =
bug<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0592b655a306b ALSA: line6: toneport: Fix broken u=
sage of timer for delayed execution<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0978e70ead670 mmc: sdhci-pci: Fix BYT OCP setting=
<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A056f590e2e30a mmc: core: Fix tag set memory leak<=
br>
=C2=A0 =C2=A0 =C2=A0 =C2=A01ea20c66648a mmc: tegra: fix ddr signaling for n=
on-ddr modes<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A04ea5e92a20b9 crypto: arm64/aes-neonbs - don&#39;=
t access already-freed walk.iv<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0b51455e5493a crypto: arm/aes-neonbs - don&#39;t =
access already-freed walk.iv<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A086d478d06696 crypto: caam/qi2 - generate hash ke=
ys in-place<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0fd2830991e56 crypto: caam/qi2 - fix DMA mapping =
of stack memory<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A00eaed393b4ec crypto: caam/qi2 - fix zero-length =
buffer DMA mapping<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A086add9b56835 crypto: rockchip - update IV buffer=
 to contain the next IV<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A08d9cdf34aaf9 crypto: gcm - fix incompatibility b=
etween &quot;gcm&quot; and &quot;gcm_base&quot;<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0246ef445e015 crypto: arm64/gcm-aes-ce - fix no-N=
EON fallback code<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A047a9de26eb06 crypto: x86/crct10dif-pcl - fix use=
 via crypto_shash_digest()<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A08eb6266c8eb1 crypto: crct10dif-generic - fix use=
 via crypto_shash_digest()<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0043e69dd7fef crypto: skcipher - don&#39;t WARN o=
n unprocessed data after slow walk step<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A02c0f409ba69c crypto: vmx - fix copy-paste error =
in CTR mode<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A08d02b83b332b crypto: ccp - Do not free psp_maste=
r when PLATFORM_INIT fails<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0fdcd8b3b745e crypto: chacha20poly1305 - set cra_=
name correctly<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0d6d54c7c59c6 crypto: chacha-generic - fix use as=
 arm64 no-NEON fallback<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A00a348941ad06 crypto: lrw - don&#39;t access alre=
ady-freed walk.iv<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A025f1509c739f crypto: salsa20 - don&#39;t access =
already-freed walk.iv<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0fb7261b31a2c crypto: crypto4xx - fix cfb and ofb=
 &quot;overran dst buffer&quot; issues<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A03149ac3ef4e6 crypto: crypto4xx - fix ctr-aes mis=
sing output IV<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A05404a6ff7458 x86/MCE/AMD: Don&#39;t report L1 BT=
B MCA errors on some family 17h models<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0ad09c6ef2dcb x86/MCE: Group AMD function prototy=
pes in &lt;asm/mce.h&gt;<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0b05237350b4a x86/MCE/AMD: Carve out the MC4_MISC=
 thresholding quirk<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0e6b8b66f965e x86/MCE/AMD: Turn off MC4_MISC thre=
sholding on all family 0x15 models<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0993a6595b253 x86/MCE: Add an MCE-record filterin=
g function<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A052176123f9cb sched/x86: Save [ER]FLAGS on contex=
t switch<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0d81b4ae57fe9 arm64: Save and restore OSDLR_EL1 a=
cross suspend/resume<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0bd254f9d1157 arm64: Clear OSDLR_EL1 on CPU boot<=
br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0a184f8889306 arm64: compat: Reduce address limit=
<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0e57320e0177a arm64: arch_timer: Ensure counter r=
egister reads occur with seqlock held<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A032e802d947ca arm64: mmap: Ensure file offset is =
treated as unsigned<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A038a6f722c01a power: supply: axp288_fuel_gauge: A=
dd ACEPC T8 and T11 mini PCs to the blacklist<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0a4e41f047a3e power: supply: axp288_charger: Fix =
unchecked return value<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0fe3f22b7084d ARM: exynos: Fix a leaked reference=
 by adding missing of_node_put<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0a6bc3bfb8206 mmc: sdhci-of-arasan: Add DTS prope=
rty to disable DCMDs.<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0bf6cb21717f4 ARM: dts: exynos: Fix audio (microp=
hone) routing on Odroid XU3<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0de42e519cbee ARM: dts: exynos: Fix interrupt for=
 shared EINTs on Exynos5260<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A03ea393bb1ca4 ARM: dts: qcom: ipq4019: enlarge PC=
Ie BAR range<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A05d6fa0370c51 arm64: dts: rockchip: Disable DCMDs=
 on RK3399&#39;s eMMC controller.<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A05414a4761988 arm64: dts: rockchip: fix IO domain=
 voltage setting of APIO5 on rockpro64<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A08c1134ff70df objtool: Fix function fallthrough d=
etection<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0bc19bb7d8d10 x86/speculation/mds: Improve CPU bu=
ffer clear documentation<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0d2214ccfecb5 x86/speculation/mds: Revert CPU buf=
fer clear on double fault exit<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0bfcac7872252 locking/rwsem: Prevent decrement of=
 reader count before increment<br>
<br>
=C2=A0 =C2=A0 Signed-off-by: Bruce Ashfield &lt;<a href=3D"mailto:bruce.ash=
field@gmail.com" target=3D"_blank">bruce.ashfield@gmail.com</a>&gt;<br>
=C2=A0 =C2=A0 Signed-off-by: Richard Purdie &lt;<a href=3D"mailto:richard.p=
urdie@linuxfoundation.org" target=3D"_blank">richard.purdie@linuxfoundation=
.org</a>&gt;<br>
=C2=A0 =C2=A0 Signed-off-by: Armin Kuster &lt;<a href=3D"mailto:akuster808@=
gmail.com" target=3D"_blank">akuster808@gmail.com</a>&gt;<br>
---<br>
=C2=A0meta/recipes-kernel/linux/<a href=3D"http://linux-yocto-rt_5.0.bb" re=
l=3D"noreferrer" target=3D"_blank">linux-yocto-rt_5.0.bb</a>=C2=A0 =C2=A0|=
=C2=A0 6 +++---<br>
=C2=A0meta/recipes-kernel/linux/<a href=3D"http://linux-yocto-tiny_5.0.bb" =
rel=3D"noreferrer" target=3D"_blank">linux-yocto-tiny_5.0.bb</a> |=C2=A0 8 =
++++----<br>
=C2=A0meta/recipes-kernel/linux/<a href=3D"http://linux-yocto_5.0.bb" rel=
=3D"noreferrer" target=3D"_blank">linux-yocto_5.0.bb</a>=C2=A0 =C2=A0 =C2=
=A0 | 20 ++++++++++----------<br>
=C2=A03 files changed, 17 insertions(+), 17 deletions(-)<br>
<br>
diff --git a/meta/recipes-kernel/linux/<a href=3D"http://linux-yocto-rt_5.0=
.bb" rel=3D"noreferrer" target=3D"_blank">linux-yocto-rt_5.0.bb</a> b/meta/=
recipes-kernel/linux/<a href=3D"http://linux-yocto-rt_5.0.bb" rel=3D"norefe=
rrer" target=3D"_blank">linux-yocto-rt_5.0.bb</a><br>
index 36db6b6..b8ca4a2 100644<br>
--- a/meta/recipes-kernel/linux/<a href=3D"http://linux-yocto-rt_5.0.bb" re=
l=3D"noreferrer" target=3D"_blank">linux-yocto-rt_5.0.bb</a><br>
+++ b/meta/recipes-kernel/linux/<a href=3D"http://linux-yocto-rt_5.0.bb" re=
l=3D"noreferrer" target=3D"_blank">linux-yocto-rt_5.0.bb</a><br>
@@ -11,13 +11,13 @@ python () {<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0raise bb.parse.SkipRecipe(&quot;Set PREFE=
RRED_PROVIDER_virtual/kernel to linux-yocto-rt to enable it&quot;)<br>
=C2=A0}<br>
<br>
-SRCREV_machine ?=3D &quot;cc66f1b95af7b75d25b0155203df9db801273fd2&quot;<b=
r>
-SRCREV_meta ?=3D &quot;2bc19ce252b1ce753056b32c55f55f515698b42a&quot;<br>
+SRCREV_machine ?=3D &quot;9376c193ebe7db89847195a749c2a200a1273c33&quot;<b=
r>
+SRCREV_meta ?=3D &quot;9262e21627a82956fb85eef0024135ce5179c73b&quot;<br>
<br>
=C2=A0SRC_URI =3D &quot;git://<a href=3D"http://git.yoctoproject.org/linux-=
yocto.git;branch=3D$%7BKBRANCH%7D;name=3Dmachine" rel=3D"noreferrer" target=
=3D"_blank">git.yoctoproject.org/linux-yocto.git;branch=3D${KBRANCH};name=
=3Dmachine</a> \<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 git://<a href=3D"http://git.yocto=
project.org/yocto-kernel-cache;type=3Dkmeta;name=3Dmeta;branch=3Dyocto-5.0;=
destsuffix=3D$%7BKMETA%7D" rel=3D"noreferrer" target=3D"_blank">git.yoctopr=
oject.org/yocto-kernel-cache;type=3Dkmeta;name=3Dmeta;branch=3Dyocto-5.0;de=
stsuffix=3D${KMETA}</a>&quot;<br>
<br>
-LINUX_VERSION ?=3D &quot;5.0.17&quot;<br>
+LINUX_VERSION ?=3D &quot;5.0.19&quot;<br>
<br>
=C2=A0LIC_FILES_CHKSUM =3D &quot;file://COPYING;md5=3Dbbea815ee2795b2f42308=
26c0c6b8814&quot;<br>
<br>
diff --git a/meta/recipes-kernel/linux/<a href=3D"http://linux-yocto-tiny_5=
.0.bb" rel=3D"noreferrer" target=3D"_blank">linux-yocto-tiny_5.0.bb</a> b/m=
eta/recipes-kernel/linux/<a href=3D"http://linux-yocto-tiny_5.0.bb" rel=3D"=
noreferrer" target=3D"_blank">linux-yocto-tiny_5.0.bb</a><br>
index 9888a3f..b3bb1f4 100644<br>
--- a/meta/recipes-kernel/linux/<a href=3D"http://linux-yocto-tiny_5.0.bb" =
rel=3D"noreferrer" target=3D"_blank">linux-yocto-tiny_5.0.bb</a><br>
+++ b/meta/recipes-kernel/linux/<a href=3D"http://linux-yocto-tiny_5.0.bb" =
rel=3D"noreferrer" target=3D"_blank">linux-yocto-tiny_5.0.bb</a><br>
@@ -6,7 +6,7 @@ KCONFIG_MODE =3D &quot;--allnoconfig&quot;<br>
<br>
=C2=A0require recipes-kernel/linux/linux-yocto.inc<br>
<br>
-LINUX_VERSION ?=3D &quot;5.0.17&quot;<br>
+LINUX_VERSION ?=3D &quot;5.0.19&quot;<br>
=C2=A0LIC_FILES_CHKSUM =3D &quot;file://COPYING;md5=3Dbbea815ee2795b2f42308=
26c0c6b8814&quot;<br>
<br>
=C2=A0DEPENDS +=3D &quot;${@bb.utils.contains(&#39;ARCH&#39;, &#39;x86&#39;=
, &#39;elfutils-native&#39;, &#39;&#39;, d)}&quot;<br>
@@ -15,9 +15,9 @@ DEPENDS +=3D &quot;openssl-native util-linux-native&quot;=
<br>
=C2=A0KMETA =3D &quot;kernel-meta&quot;<br>
=C2=A0KCONF_BSP_AUDIT_LEVEL =3D &quot;2&quot;<br>
<br>
-SRCREV_machine_qemuarm ?=3D &quot;bb915f6be9a133fd702b152aa456cc31eea0936e=
&quot;<br>
-SRCREV_machine ?=3D &quot;fa6f061d0da0c15c8685e6fad5b8ccc96a2e212c&quot;<b=
r>
-SRCREV_meta ?=3D &quot;2bc19ce252b1ce753056b32c55f55f515698b42a&quot;<br>
+SRCREV_machine_qemuarm ?=3D &quot;fabee455f397ba8054f35a3ad5f2250bbad93bef=
&quot;<br>
+SRCREV_machine ?=3D &quot;00638cdd8f92869a0f89ebe3289fdbd856ba9458&quot;<b=
r>
+SRCREV_meta ?=3D &quot;9262e21627a82956fb85eef0024135ce5179c73b&quot;<br>
<br>
=C2=A0PV =3D &quot;${LINUX_VERSION}+git${SRCPV}&quot;<br>
<br>
diff --git a/meta/recipes-kernel/linux/<a href=3D"http://linux-yocto_5.0.bb=
" rel=3D"noreferrer" target=3D"_blank">linux-yocto_5.0.bb</a> b/meta/recipe=
s-kernel/linux/<a href=3D"http://linux-yocto_5.0.bb" rel=3D"noreferrer" tar=
get=3D"_blank">linux-yocto_5.0.bb</a><br>
index dfbe495..1b2224d 100644<br>
--- a/meta/recipes-kernel/linux/<a href=3D"http://linux-yocto_5.0.bb" rel=
=3D"noreferrer" target=3D"_blank">linux-yocto_5.0.bb</a><br>
+++ b/meta/recipes-kernel/linux/<a href=3D"http://linux-yocto_5.0.bb" rel=
=3D"noreferrer" target=3D"_blank">linux-yocto_5.0.bb</a><br>
@@ -11,15 +11,15 @@ KBRANCH_qemux86=C2=A0 ?=3D &quot;v5.0/standard/base&quo=
t;<br>
=C2=A0KBRANCH_qemux86-64 ?=3D &quot;v5.0/standard/base&quot;<br>
=C2=A0KBRANCH_qemumips64 ?=3D &quot;v5.0/standard/mti-malta64&quot;<br>
<br>
-SRCREV_machine_qemuarm ?=3D &quot;0cf286c38da5959520f6c01e606c722deb069fd1=
&quot;<br>
-SRCREV_machine_qemuarm64 ?=3D &quot;fa6f061d0da0c15c8685e6fad5b8ccc96a2e21=
2c&quot;<br>
-SRCREV_machine_qemumips ?=3D &quot;577fd817ec6c9566277b341ac5911ea657ec5ba=
4&quot;<br>
-SRCREV_machine_qemuppc ?=3D &quot;fa6f061d0da0c15c8685e6fad5b8ccc96a2e212c=
&quot;<br>
-SRCREV_machine_qemux86 ?=3D &quot;fa6f061d0da0c15c8685e6fad5b8ccc96a2e212c=
&quot;<br>
-SRCREV_machine_qemux86-64 ?=3D &quot;fa6f061d0da0c15c8685e6fad5b8ccc96a2e2=
12c&quot;<br>
-SRCREV_machine_qemumips64 ?=3D &quot;f9e63bc3f0ee65f03b3f9963a938668e6abf9=
425&quot;<br>
-SRCREV_machine ?=3D &quot;fa6f061d0da0c15c8685e6fad5b8ccc96a2e212c&quot;<b=
r>
-SRCREV_meta ?=3D &quot;2bc19ce252b1ce753056b32c55f55f515698b42a&quot;<br>
+SRCREV_machine_qemuarm ?=3D &quot;9161b2fa2f1cec0ba02976c389c788445858e0de=
&quot;<br>
+SRCREV_machine_qemuarm64 ?=3D &quot;00638cdd8f92869a0f89ebe3289fdbd856ba94=
58&quot;<br>
+SRCREV_machine_qemumips ?=3D &quot;7de9b8f0db98e51a666477c8e2b64f1964b4541=
0&quot;<br>
+SRCREV_machine_qemuppc ?=3D &quot;00638cdd8f92869a0f89ebe3289fdbd856ba9458=
&quot;<br>
+SRCREV_machine_qemux86 ?=3D &quot;00638cdd8f92869a0f89ebe3289fdbd856ba9458=
&quot;<br>
+SRCREV_machine_qemux86-64 ?=3D &quot;00638cdd8f92869a0f89ebe3289fdbd856ba9=
458&quot;<br>
+SRCREV_machine_qemumips64 ?=3D &quot;5a8b27bcc0b16077ab8edfcd3fb25c80dc2c6=
52e&quot;<br>
+SRCREV_machine ?=3D &quot;00638cdd8f92869a0f89ebe3289fdbd856ba9458&quot;<b=
r>
+SRCREV_meta ?=3D &quot;9262e21627a82956fb85eef0024135ce5179c73b&quot;<br>
<br>
=C2=A0# remap qemuarm to qemuarma15 for the 5.0 kernel<br>
=C2=A0# KMACHINE_qemuarm ?=3D &quot;qemuarma15&quot;<br>
@@ -28,7 +28,7 @@ SRC_URI =3D &quot;git://<a href=3D"http://git.yoctoprojec=
t.org/linux-yocto.git;name=3Dmachine;branch=3D$%7BKBRA" rel=3D"noreferrer" =
target=3D"_blank">git.yoctoproject.org/linux-yocto.git;name=3Dmachine;branc=
h=3D${KBRA</a><br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 git://<a href=3D"http://git.yocto=
project.org/yocto-kernel-cache;type=3Dkmeta;name=3Dmeta;branch=3Dyocto-5.0;=
destsuffix=3D$%7BKMETA%7D" rel=3D"noreferrer" target=3D"_blank">git.yoctopr=
oject.org/yocto-kernel-cache;type=3Dkmeta;name=3Dmeta;branch=3Dyocto-5.0;de=
stsuffix=3D${KMETA}</a>&quot;<br>
<br>
=C2=A0LIC_FILES_CHKSUM =3D &quot;file://COPYING;md5=3Dbbea815ee2795b2f42308=
26c0c6b8814&quot;<br>
-LINUX_VERSION ?=3D &quot;5.0.17&quot;<br>
+LINUX_VERSION ?=3D &quot;5.0.19&quot;<br>
<br>
=C2=A0DEPENDS +=3D &quot;${@bb.utils.contains(&#39;ARCH&#39;, &#39;x86&#39;=
, &#39;elfutils-native&#39;, &#39;&#39;, d)}&quot;<br>
=C2=A0DEPENDS +=3D &quot;openssl-native util-linux-native&quot;<br>
<br>
-- <br>
To stop receiving notification emails like this one, please contact<br>
the administrator of this repository.<br>
-- <br>
_______________________________________________<br>
Openembedded-commits mailing list<br>
<a href=3D"mailto:Openembedded-commits@lists.openembedded.org" target=3D"_b=
lank">Openembedded-commits@lists.openembedded.org</a><br>
<a href=3D"http://lists.openembedded.org/mailman/listinfo/openembedded-comm=
its" rel=3D"noreferrer" target=3D"_blank">http://lists.openembedded.org/mai=
lman/listinfo/openembedded-commits</a><br>
</blockquote></div>

--0000000000008b21bd058bc63a6e--
