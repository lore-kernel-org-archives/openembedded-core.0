Return-Path: <bruce.ashfield@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 172F3C05027
	for <webhook@archiver.kernel.org>; Wed,  1 Feb 2023 16:28:33 +0000 (UTC)
Received: from mail-qt1-f180.google.com (mail-qt1-f180.google.com [209.85.160.180])
 by mx.groups.io with SMTP id smtpd.web11.28232.1675268908788065245
 for <openembedded-core@lists.openembedded.org>;
 Wed, 01 Feb 2023 08:28:29 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20210112 header.b=HPn5ffqW;
 spf=pass (domain: gmail.com, ip: 209.85.160.180, mailfrom: bruce.ashfield@gmail.com)
Received: by mail-qt1-f180.google.com with SMTP id s4so17501168qtx.6
        for <openembedded-core@lists.openembedded.org>; Wed, 01 Feb 2023 08:28:28 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=NEogUXXOQw02dlMepX/5C5DJcPIA/Gqjtq0je3b07pk=;
        b=HPn5ffqWw1SBEwplD39qCVJtg/txJQt0kTcTZiD13J4wS4h66nk4FFVexcFjFSndT/
         2D0i1mRMuIJYq/ZcIb4cHlkVmcfTHbOn/OTtIijipF+oBEqr5NEKAGwv2SZLMlxOshH3
         nRiD0tgixnbdQTfLvR/gjsz51b2ygDNGIT/okQ4mWwKR0Prcvl1uoq3CEtnWTnT89jzh
         13+JYh6aI3P6fMVhRxlBBA57XGRgSo5tdoWx6g4qcOUPbqzgGNfcjaMzVa2Xzw66n9IA
         AXyvlmTR38ZCxyDKJBHSJuF1QEl+AtAUOTfe0Vhyc8QX973Dz5ESupPxhckZsfkf9xhI
         R4lA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=NEogUXXOQw02dlMepX/5C5DJcPIA/Gqjtq0je3b07pk=;
        b=tDyRfAwTsZXUoWH8zn3xL2MMp9+a5KzvdPJA1vPm7GG2OJKA5B4Q8Eg0dBsmvZNb5f
         B775Iaa/rYJ9EvYgrylJh35xCTt0Zoc4V29EZfTkRQu0Bs4AIiNHI5GtMQ3YZGTpKtRv
         7D+6L1T6O/+icdaoRJkSsDqO9pDJS/ZwXzESViLnigpaYEquv0LowlZrUZXvBinZ9/vw
         NRPmSeSCPi5cfnb0VjG2u2NIfs0MGWIQi+AOynsJ544H5pWMj4BsfWcin27gomqUDi2m
         Z3PCLAvncun3LOVqVZJ3lExHcrZR8beAbqBUbw0hR/trzwhr0zwgHEsoKVF9qYocpqIK
         NONw==
X-Gm-Message-State: AO0yUKV+zFBJdyjv0B8CI9VqXiTP0wJZaFwu13CLvpM6JgJHeIQd19/l
	sbkzCHX4RhQChrIb5JxCBO59rBw34RS+9g==
X-Google-Smtp-Source: AK7set8Vs98D0NJaHgdgzpnnlI4XYaK/a0/AcdnbEgvaw6u5k9RwfFoPtg3ThsrClJhIL+mTh5ODkA==
X-Received: by 2002:a05:622a:178e:b0:3b6:377b:e060 with SMTP id s14-20020a05622a178e00b003b6377be060mr5043116qtk.7.1675268907617;
        Wed, 01 Feb 2023 08:28:27 -0800 (PST)
Received: from build.lan (cpe7c9a54441c1f-cm7c9a54441c1d.cpe.net.cable.rogers.com. [173.34.238.88])
        by smtp.gmail.com with ESMTPSA id d29-20020ac8615d000000b003b856b73e8bsm7528157qtm.16.2023.02.01.08.28.26
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 01 Feb 2023 08:28:27 -0800 (PST)
From: bruce.ashfield@gmail.com
To: richard.purdie@linuxfoundation.org
Cc: openembedded-core@lists.openembedded.org
Subject: [PATCH 1/5] linux-yocto/6.1: update to v6.1.7
Date: Wed,  1 Feb 2023 11:28:20 -0500
Message-Id: <791ae1efb3c91b5d4076d45e661a5ea5563e5f0a.1675268720.git.bruce.ashfield@gmail.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <cover.1675268720.git.bruce.ashfield@gmail.com>
References: <cover.1675268720.git.bruce.ashfield@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Wed, 01 Feb 2023 16:28:33 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/176560

From: Bruce Ashfield <bruce.ashfield@gmail.com>

Updating  to the latest korg -stable release that comprises
the following commits:

    21e996306a6a Linux 6.1.7
    046c9972dd40 pinctrl: amd: Add dynamic debugging for active GPIOs
    86cd9d9ebda6 Revert "usb: ulpi: defer ulpi_register on ulpi_read_id timeout"
    73a630b359c8 block: handle bio_split_to_limits() NULL return
    e62e6258ab14 io_uring/io-wq: only free worker if it was allocated for creation
    0a14c3ded80c io_uring/io-wq: free worker if task_work creation is canceled
    3925336af00f drm/i915: Fix CFI violations in gt_sysfs
    c06015ebc436 io_uring/poll: attempt request issue after racy poll wakeup
    7fc3990dad04 io_uring: lock overflowing for IOPOLL
    adc96d30f650 efi: fix NULL-deref in init error path
    a474d4ad59cd ALSA: usb-audio: Fix possible NULL pointer dereference in snd_usb_pcm_has_fixed_rate()
    394416282129 platform/x86/amd: Fix refcount leak in amd_pmc_probe
    50b3cdf8239b platform/surface: aggregator: Add missing call to ssam_request_sync_free()
    de76fc134f74 bnxt: make sure we return pages to the pool
    4fe577ad7b29 net: hns3: fix wrong use of rss size during VF rss config
    c2258d55935c net: lan966x: check for ptp to be enabled in lan966x_ptp_deinit()
    bbc17e883cba igc: Fix PPS delta between two synchronized end-points
    8c3dc300617c perf kmem: Support field "node" in evsel__process_alloc_event() coping with recent tracepoint restructuring
    4e81a8a47dc6 perf kmem: Support legacy tracepoints
    d4bc9f017f31 perf build: Properly guard libbpf includes
    c8ca0ad10df0 octeontx2-pf: Fix resource leakage in VF driver unbind
    0daf5f4a1eef selftests/net: l2_tos_ttl_inherit.sh: Ensure environment cleanup on failure.
    2440f74a9967 selftests/net: l2_tos_ttl_inherit.sh: Run tests in their own netns.
    1621f9a53948 selftests/net: l2_tos_ttl_inherit.sh: Set IPv6 addresses with "nodad".
    514d9c6a3921 net/mlx5e: Fix macsec possible null dereference when updating MAC security entity (SecY)
    9be4e25bdc1f net/mlx5e: Fix macsec ssci attribute handling in offload path
    e02190787f11 net/mlx5e: Don't support encap rules with gbp option
    f594f740c352 net/mlx5: Fix ptp max frequency adjustment range
    0fa15a13670d net/mlx5e: IPoIB, Fix child PKEY interface stats on rx path
    5844a46f09f7 net/mlx5e: IPoIB, Block PKEY interfaces with less rx queues than parent
    b5f108e202b7 net/mlx5e: IPoIB, Block queue count configuration when sub interfaces are present
    798604a1bd6e net/mlx5e: Verify dev is present for fix features ndo
    ddf458641a51 net/mlx5: Fix command stats access after free
    1f232fb61913 net/mlx5e: TC, Keep mod hdr actions after mod hdr alloc
    39124c14af45 net/mlx5: check attr pointer validity before dereferencing it
    7697de4ad708 Revert "r8169: disable detection of chip version 36"
    8a97b544b98e net/sched: act_mpls: Fix warning during failed attribute validation
    7ac9578e45b2 drm/vmwgfx: Remove rcu locks from user resources
    a3be7e2afc43 drm/vmwgfx: Remove vmwgfx_hashtab
    7f3d691dedfe drm/vmwgfx: Refactor ttm reference object hashtable to use linux/hashtable.
    e98d62090b6d drm/vmwgfx: Refactor resource validation hashtable to use linux/hashtable implementation.
    c00e42f1c9f1 drm/vmwgfx: Remove ttm object hashtable
    8557e0e42e02 drm/vmwgfx: Refactor resource manager's hashtable to use linux/hashtable implementation.
    2f3313c55544 drm/vmwgfx: Write the driver id registers
    96a987318855 ice: Add check for kzalloc
    500ca1da9d08 ice: Fix potential memory leak in ice_gnss_tty_write()
    f2faf0699af7 drm/amdgpu: Fix potential NULL dereference
    cd57d5e5e28e tools/nolibc: fix the O_* fcntl/open macro definitions for riscv
    91fa2bd35280 tools/nolibc: restore mips branch ordering in the _start block
    c878ac66db42 ASoC: qcom: Fix building APQ8016 machine driver without SOUNDWIRE
    31a997c40a8a af_unix: selftest: Fix the size of the parameter to connect()
    0b1605e45c36 gro: take care of DODGY packets
    df9cddce8f99 gro: avoid checking for a failed search
    8998db5021a2 nfc: pn533: Wait for out_urb's completion in pn533_usb_send_frame()
    7bed0d49ca35 hvc/xen: lock console list traversal
    92b0051217f2 sched/core: Fix arch_scale_freq_tick() on tickless systems
    d995fadd7f09 octeontx2-af: Fix LMAC config in cgx_lmac_rx_tx_enable
    973acfdfe90c nfsd: fix handling of cached open files in nfsd4_open codepath
    0aba4dd7f269 nfsd: rework refcounting in filecache
    65469b10522f NFSD: Add an nfsd_file_fsync tracepoint
    4ec7a0f277d0 nfsd: reorganize filecache.c
    d7a6c190012a nfsd: remove the pages_flushed statistic from filecache
    1c36dc563e1c NFSD: Add an NFSD_FILE_GC flag to enable nfsd_file garbage collection
    7e4d3d500458 NFSD: Revert "NFSD: NFSv4 CLOSE should release an nfsd_file immediately"
    90d5095b76f4 NFSD: Pass the target nfsd_file to nfsd_commit()
    5ac01865a2b9 tipc: fix unexpected link reset due to discovery messages
    34aed3646e82 stmmac: dwmac-mediatek: remove the dwmac_fix_mac_speed
    0d81b8e86e75 ALSA: usb-audio: Relax hw constraints for implicit fb sync
    254328ba4cd3 ALSA: usb-audio: Make sure to stop endpoints before closing EPs
    fc78cb85abd0 mtd: cfi: allow building spi-intel standalone
    6e4131245240 mtd: parsers: scpart: fix __udivdi3 undefined on mips
    c5d032482c23 ASoC: wm8904: fix wrong outputs volume after power reactivation
    c6fa1de83fd8 drm/msm/dpu: Fix memory leak in msm_mdss_parse_data_bus_icc_path
    7928737dd149 drm/msm/dpu: Fix some kernel-doc comments
    fba1b23befd8 ASoC: Intel: sof-nau8825: fix module alias overflow
    bc9b113d3c88 ASoC: Intel: sof_nau8825: support rt1015p speaker amplifier
    c8eb7ac95a1e ASoC: Intel: fix sof-nau8825 link failure
    bf5838132d1e scsi: ufs: core: WLUN suspend SSU/enter hibern8 fail recovery
    9bfa3a615037 scsi: mpi3mr: Refer CONFIG_SCSI_MPI3MR in Makefile
    87c71e88f6a6 scsi: storvsc: Fix swiotlb bounce buffer leak in confidential VM
    ad1336274f73 regulator: da9211: Use irq handler when ready
    07ac5db2d840 x86/resctrl: Fix event counts regression in reused RMIDs
    d01c6557478b x86/resctrl: Fix task CLOSID/RMID update race
    c1c59538337a x86/pat: Fix pat_x_mtrr_type() for MTRR disabled case
    1dc8c5574cc2 EDAC/device: Fix period calculation in edac_device_reset_delay_period()
    b43d52eeca7d x86/boot: Avoid using Intel mnemonics in AT&T syntax asm
    424bcb570cb3 powerpc/imc-pmu: Fix use of mutex in IRQs disabled section
    213b22abdf8f selftests: netfilter: fix transaction test script timeout handling
    e88865876d47 netfilter: ipset: Fix overflow before widen in the bitmap_ip_create() function.
    7b5cc7fd1789 sched/core: Fix use-after-free bug in dup_user_cpus_ptr()
    bad1a2194485 iommu/arm-smmu: Report IOMMU_CAP_CACHE_COHERENCY even betterer
    a1b9c7b1978a iommu/arm-smmu: Don't unregister on shutdown
    abebd865a896 iommu/mediatek-v1: Fix an error handling path in mtk_iommu_v1_probe()
    ead3e6c79479 iommu/arm-smmu-v3: Don't unregister on shutdown
    61cbf790e732 iommu/iova: Fix alloc iova overflows issue
    68a6f7dbf8a4 mm: Always release pages to the buddy allocator in memblock_free_late().
    309278736f35 drm/amdgpu: enable VCN DPG for GC IP v11.0.4
    e30be0ada6e2 drm/amdgpu: Enable pg/cg flags on GC11_0_4 for VCN
    6ef4543f1f3b drm/amdgpu: add soc21 common ip block support for GC 11.0.4
    d90de26bdc97 drm/amd/pm: enable GPO dynamic control support for SMU13.0.7
    d167ce6c47db drm/amd/pm: enable GPO dynamic control support for SMU13.0.0
    5e594dbf6e76 drm/amd/pm: Enable bad memory page/channel recording support for smu v13_0_0
    e59d46eed1d9 drm/amd/pm: enable mode1 reset on smu_v13_0_10
    9bd180b6f9d0 usb: ulpi: defer ulpi_register on ulpi_read_id timeout
    5c855bcc7306 drm/i915/gt: Cleanup partial engine discovery failures
    5e4194d89ffe iavf/iavf_main: actually log ->src mask when talking about it
    0afa5f073658 ipv6: raw: Deduct extension header length in rawv6_push_pending_frames
    c49996c6aa03 ixgbe: fix pci device refcount leak
    fb8534b7960f platform/x86: sony-laptop: Don't turn off 0x153 keyboard backlight during probe
    0f21e225ff48 dt-bindings: msm/dsi: Don't require vcca-supply on 14nm PHY
    3c0d5bb904a2 dt-bindings: msm/dsi: Don't require vdds-supply on 10nm PHY
    b7dcbca46db3 drm/msm/dp: do not complete dp_aux_cmd_fifo_tx() if irq is not for aux transfer
    4b5d9c95b437 platform/x86: ideapad-laptop: Add Legion 5 15ARH05 DMI id to set_fn_lock_led_list[]
    21e5eca0ac90 arm64/mm: fix incorrect file_map_count for invalid pmd
    06f8be16be51 arm64: ptrace: Use ARM64_SME to guard the SME register enumerations
    a9a6715272a7 dt-bindings: msm: dsi-phy-28nm: Add missing qcom, dsi-phy-regulator-ldo-mode
    a006aaffd78f arm64/mm: add pud_user_exec() check in pud_user_accessible_page()
    05458ee3ff82 arm64/signal: Always accept SVE signal frames on SME only systems
    4b855673cf3d dt-bindings: msm: dsi-controller-main: Fix description of core clock
    b5affe7e0b3a dt-bindings: msm: dsi-controller-main: Fix power-domain constraint
    4fa6b43ba44b arm64/signal: Always allocate SVE signal frames on SME only systems
    b72bd13bc500 drm/msm/adreno: Make adreno quirks not overwrite each other
    d0f52562b891 firmware/psci: Don't register with debugfs if PSCI isn't available
    a30aafcfba8f firmware/psci: Fix MEM_PROTECT_RANGE function numbers
    b107b08c41b3 drm/msm: another fix for the headless Adreno GPU
    96ec2f82aea0 dt-bindings: msm: dsi-controller-main: Fix operating-points-v2 constraint
    dfa4ff480fe6 platform/x86: dell-privacy: Fix SW_CAMERA_LENS_COVER reporting
    0e082105895c platform/x86: asus-wmi: Don't load fan curves without fan
    127bf1d6bfe3 platform/x86: thinkpad_acpi: Fix profile mode display in AMT mode
    c7acfd933d96 platform/x86: int3472/discrete: Ensure the clk/power enable pins are in output mode
    7221c2a7be64 platform/surface: aggregator: Ignore command messages not intended for us
    3a79bad87616 platform/x86: dell-privacy: Only register SW_CAMERA_LENS_COVER if present
    1f4a9408024e ACPI: video: Allow selecting NVidia-WMI-EC or Apple GMUX backlight from the cmdline
    462ed8a2beba ASoC: rt9120: Make dev PM runtime bind AsoC component PM
    617401df4605 io_uring/fdinfo: include locked hash table in fdinfo output
    f0f326dc9794 cifs: fix double free on failed kerberos auth
    888c060bc327 cifs: do not query ifaces on smb1 mounts
    d54a3ef8b8bd cifs: fix file info setting in cifs_open_file()
    5a574327d1c5 cifs: fix file info setting in cifs_query_path_info()
    d4b7ff9edebc cifs: Fix uninitialized memory read for smb311 posix symlink create
    f905e03c8ff6 Revert "drm/amdgpu: Revert "drm/amdgpu: getting fan speed pwm for vega10 properly""
    69a75087cd1f drm/amd/display: move remaining FPU code to dml folder
    363781f72d46 drm/amd/pm: add the missing mapping for PPT feature on SMU13.0.0 and 13.0.7
    b435f68e415c drm/amd/pm: correct the reference clock for fan speed(rpm) calculation
    9196eb7c52e5 drm/amdgpu: Fixed bug on error when unloading amdgpu
    dcfeba477b3e drm/amd: Delay removal of the firmware framebuffer
    b696c627b3f5 drm/i915: Fix potential context UAFs
    8874730ecefe drm/i915: Reserve enough fence slot for i915_vma_unbind_async
    4009502c091c drm/i915/gt: Reset twice
    42526442fe3e drm: Optimize drm buddy top-down allocation method
    b8e6fc445990 drm/amd/pm/smu13: BACO is supported when it's in BACO state
    adc48e5e408a drm/virtio: Fix GEM handle creation UAF
    b6ac9ded42ae s390/percpu: add READ_ONCE() to arch_this_cpu_to_op_simple()
    45a584f139e8 s390/cpum_sf: add READ_ONCE() semantics to compare and swap loops
    ba518c5b6429 cpufreq: amd-pstate: fix kernel hang issue while amd-pstate unregistering
    80a82f6eb3b7 elfcore: Add a cprm parameter to elf_core_extra_{phdrs,data_size}
    5fc5cdee8ef2 ASoC: qcom: lpass-cpu: Fix fallback SD line index handling
    20fa7855af45 brcmfmac: Prefer DT board type over DMI board type
    ab4b5a2154bc s390/kexec: fix ipl report address for kdump
    90e585b6ab23 perf auxtrace: Fix address filter duplicate symbol selection
    2da1ba6f56f6 net: stmmac: add aux timestamps fifo clearance wait
    0bb6742bf81a ACPI: Fix selecting wrong ACPI fwnode for the iGPU on some Dell laptops
    8f282a84f31c arm64: cmpxchg_double*: hazard against entire exchange variable
    f5731a792486 arm64: mte: Avoid the racy walk of the vma list during core dump
    87b3a402bbc5 arm64: mte: Fix double-freeing of the temporary tag storage during coredump
    4ad6c0635416 io_uring/poll: add hash if ready poll request can't complete inline
    78c8b66a697a docs: Fix the docs build with Sphinx 6.0
    e2cee489f24f efi: tpm: Avoid READ_ONCE() for accessing the event log
    5b66b27b9dee efi: fix userspace infinite retry read efivars after EFI runtime services page fault
    9a1195c58432 KVM: arm64: Fix S1PTW handling on RO memslots
    d778e68faa6a KVM: x86: Do not return host topology information from KVM_GET_SUPPORTED_CPUID
    82972d60f46f ALSA: hda/realtek: Enable mute/micmute LEDs on HP Spectre x360 13-aw0xxx
    779c7c7ea8e0 ALSA: hda/realtek - Turn on power early
    e1e0a181aea3 ALSA: usb-audio: Always initialize fixed_rate in snd_usb_find_implicit_fb_sync_format()
    e59e115d67d6 ALSA: control-led: use strscpy in set_led_id()
    303a04b6562e Revert "ALSA: usb-audio: Drop superfluous interface setup at parsing"
    76ef74d4a379 netfilter: nft_payload: incorrect arithmetics when fetching VLAN header bits
    38f3ee12661f Linux 6.1.6
    cb9b3951d636 ALSA: hda: cs35l41: Check runtime suspend capability at runtime_idle
    a6d58eff4f83 ALSA: hda - Enable headset mic on another Dell laptop with ALC3254
    8107550bfe11 ALSA: hda: cs35l41: Don't return -EINVAL from system suspend/resume
    57f6bea5218c ALSA: hda/realtek: fix mute/micmute LEDs don't work for a HP platform
    0e19738afc84 ALSA: hda/hdmi: Add a HP device 0x8715 to force connect list
    d6ad4bd1d896 ALSA: pcm: Move rwsem lock inside snd_ctl_elem_read to prevent UAF
    e8988e878af6 net: sched: disallow noqueue for qdisc classes
    cd2e80a3ac70 gcc: disable -Warray-bounds for gcc-11 too
    8cc0e63ba86c Revert "SUNRPC: Use RMW bitops in single-threaded hot paths"
    29fbaa434c22 selftests/vm/pkeys: Add a regression test for setting PKRU through ptrace
    d2602da3da87 x86/fpu: Emulate XRSTOR's behavior if the xfeatures PKRU bit is not set
    587478470b0a x86/fpu: Allow PKRU to be (once again) written by ptrace.
    bfa72faf69e8 x86/fpu: Add a pkru argument to copy_uabi_to_xstate()
    a442736b704d x86/fpu: Add a pkru argument to copy_uabi_from_kernel_to_xstate().
    f28418b06f6b x86/fpu: Take task_struct* in copy_sigframe_from_user_to_xstate()
    763b92568726 parisc: Align parisc MADV_XXX constants with all other architectures

Signed-off-by: Bruce Ashfield <bruce.ashfield@gmail.com>
---
 .../linux/linux-yocto-rt_6.1.bb               |  6 ++---
 .../linux/linux-yocto-tiny_6.1.bb             |  6 ++---
 meta/recipes-kernel/linux/linux-yocto_6.1.bb  | 26 +++++++++----------
 3 files changed, 19 insertions(+), 19 deletions(-)

diff --git a/meta/recipes-kernel/linux/linux-yocto-rt_6.1.bb b/meta/recipes-kernel/linux/linux-yocto-rt_6.1.bb
index cced203781..71ffdd6a90 100644
--- a/meta/recipes-kernel/linux/linux-yocto-rt_6.1.bb
+++ b/meta/recipes-kernel/linux/linux-yocto-rt_6.1.bb
@@ -11,13 +11,13 @@ python () {
         raise bb.parse.SkipRecipe("Set PREFERRED_PROVIDER_virtual/kernel to linux-yocto-rt to enable it")
 }
 
-SRCREV_machine ?= "2da2dd7ee0de35291a179566ce8e5b85d6982762"
-SRCREV_meta ?= "142fcf0b8fcf1643d80e39e2c2f9c4a3bb528fcc"
+SRCREV_machine ?= "8605b6101efcfdd8dd779db4fd5aafb94727e990"
+SRCREV_meta ?= "fdad265d2bff2ddb937b3eebdabe344d1f450cf4"
 
 SRC_URI = "git://git.yoctoproject.org/linux-yocto.git;branch=${KBRANCH};name=machine \
            git://git.yoctoproject.org/yocto-kernel-cache;type=kmeta;name=meta;branch=yocto-6.1;destsuffix=${KMETA}"
 
-LINUX_VERSION ?= "6.1.5"
+LINUX_VERSION ?= "6.1.7"
 
 LIC_FILES_CHKSUM = "file://COPYING;md5=6bc538ed5bd9a7fc9398086aedcd7e46"
 
diff --git a/meta/recipes-kernel/linux/linux-yocto-tiny_6.1.bb b/meta/recipes-kernel/linux/linux-yocto-tiny_6.1.bb
index 15ee6abdbc..7cc2920bd7 100644
--- a/meta/recipes-kernel/linux/linux-yocto-tiny_6.1.bb
+++ b/meta/recipes-kernel/linux/linux-yocto-tiny_6.1.bb
@@ -5,7 +5,7 @@ KCONFIG_MODE = "--allnoconfig"
 
 require recipes-kernel/linux/linux-yocto.inc
 
-LINUX_VERSION ?= "6.1.5"
+LINUX_VERSION ?= "6.1.7"
 LIC_FILES_CHKSUM = "file://COPYING;md5=6bc538ed5bd9a7fc9398086aedcd7e46"
 
 DEPENDS += "${@bb.utils.contains('ARCH', 'x86', 'elfutils-native', '', d)}"
@@ -14,8 +14,8 @@ DEPENDS += "openssl-native util-linux-native"
 KMETA = "kernel-meta"
 KCONF_BSP_AUDIT_LEVEL = "2"
 
-SRCREV_machine ?= "404168c1ce77179a34bb9959a18b594a9f7105d3"
-SRCREV_meta ?= "142fcf0b8fcf1643d80e39e2c2f9c4a3bb528fcc"
+SRCREV_machine ?= "f1bd1a02a3f480a0b0a234effd548068374d4299"
+SRCREV_meta ?= "fdad265d2bff2ddb937b3eebdabe344d1f450cf4"
 
 PV = "${LINUX_VERSION}+git${SRCPV}"
 
diff --git a/meta/recipes-kernel/linux/linux-yocto_6.1.bb b/meta/recipes-kernel/linux/linux-yocto_6.1.bb
index f543240cd8..437a98b364 100644
--- a/meta/recipes-kernel/linux/linux-yocto_6.1.bb
+++ b/meta/recipes-kernel/linux/linux-yocto_6.1.bb
@@ -13,24 +13,24 @@ KBRANCH:qemux86  ?= "v6.1/standard/base"
 KBRANCH:qemux86-64 ?= "v6.1/standard/base"
 KBRANCH:qemumips64 ?= "v6.1/standard/mti-malta64"
 
-SRCREV_machine:qemuarm ?= "45f7cca5081d3cb4ad4fae8e158cd58ea4db6c1f"
-SRCREV_machine:qemuarm64 ?= "404168c1ce77179a34bb9959a18b594a9f7105d3"
-SRCREV_machine:qemumips ?= "eb204027dbb98317d002250cc594de30ecc62b90"
-SRCREV_machine:qemuppc ?= "404168c1ce77179a34bb9959a18b594a9f7105d3"
-SRCREV_machine:qemuriscv64 ?= "404168c1ce77179a34bb9959a18b594a9f7105d3"
-SRCREV_machine:qemuriscv32 ?= "404168c1ce77179a34bb9959a18b594a9f7105d3"
-SRCREV_machine:qemux86 ?= "404168c1ce77179a34bb9959a18b594a9f7105d3"
-SRCREV_machine:qemux86-64 ?= "404168c1ce77179a34bb9959a18b594a9f7105d3"
-SRCREV_machine:qemumips64 ?= "2b51d6b44e4dc0e5a87f820d8ebc5cc49feea14a"
-SRCREV_machine ?= "404168c1ce77179a34bb9959a18b594a9f7105d3"
-SRCREV_meta ?= "142fcf0b8fcf1643d80e39e2c2f9c4a3bb528fcc"
+SRCREV_machine:qemuarm ?= "26bcae01ecdaf3481d4a62e1e626af7f5ef965bb"
+SRCREV_machine:qemuarm64 ?= "f1bd1a02a3f480a0b0a234effd548068374d4299"
+SRCREV_machine:qemumips ?= "42f627bfa37b3da569968b435423da339f9614da"
+SRCREV_machine:qemuppc ?= "f1bd1a02a3f480a0b0a234effd548068374d4299"
+SRCREV_machine:qemuriscv64 ?= "f1bd1a02a3f480a0b0a234effd548068374d4299"
+SRCREV_machine:qemuriscv32 ?= "f1bd1a02a3f480a0b0a234effd548068374d4299"
+SRCREV_machine:qemux86 ?= "f1bd1a02a3f480a0b0a234effd548068374d4299"
+SRCREV_machine:qemux86-64 ?= "f1bd1a02a3f480a0b0a234effd548068374d4299"
+SRCREV_machine:qemumips64 ?= "4bfa434ee5da72a5a8b2cb8ec799603883f5d532"
+SRCREV_machine ?= "f1bd1a02a3f480a0b0a234effd548068374d4299"
+SRCREV_meta ?= "fdad265d2bff2ddb937b3eebdabe344d1f450cf4"
 
 # set your preferred provider of linux-yocto to 'linux-yocto-upstream', and you'll
 # get the <version>/base branch, which is pure upstream -stable, and the same
 # meta SRCREV as the linux-yocto-standard builds. Select your version using the
 # normal PREFERRED_VERSION settings.
 BBCLASSEXTEND = "devupstream:target"
-SRCREV_machine:class-devupstream ?= "90ca7a874a9093e500cc6147cecd85ad2e6a2852"
+SRCREV_machine:class-devupstream ?= "21e996306a6afaae88295858de0ffb8955173a15"
 PN:class-devupstream = "linux-yocto-upstream"
 KBRANCH:class-devupstream = "v6.1/base"
 
@@ -38,7 +38,7 @@ SRC_URI = "git://git.yoctoproject.org/linux-yocto.git;name=machine;branch=${KBRA
            git://git.yoctoproject.org/yocto-kernel-cache;type=kmeta;name=meta;branch=yocto-6.1;destsuffix=${KMETA}"
 
 LIC_FILES_CHKSUM = "file://COPYING;md5=6bc538ed5bd9a7fc9398086aedcd7e46"
-LINUX_VERSION ?= "6.1.5"
+LINUX_VERSION ?= "6.1.7"
 
 DEPENDS += "${@bb.utils.contains('ARCH', 'x86', 'elfutils-native', '', d)}"
 DEPENDS += "openssl-native util-linux-native"
-- 
2.34.1


