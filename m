Received: from mail-qv1-f67.google.com (mail-qv1-f67.google.com [209.85.219.67])
 by mx.groups.io with SMTP id smtpd.web10.25045.1588520678051788903
 for <openembedded-core@lists.openembedded.org>;
 Sun, 03 May 2020 08:44:38 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20161025 header.b=vCdnldzQ;
 spf=pass (domain: gmail.com, ip: 209.85.219.67, mailfrom: bruce.ashfield@gmail.com)
Received: by mail-qv1-f67.google.com with SMTP id z7so448631qvl.1
        for <openembedded-core@lists.openembedded.org>; Sun, 03 May 2020 08:44:37 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:content-transfer-encoding;
        bh=ONU3wCGmUfc7hDzP7+D12zVVNqLi36qIyfRodej/D6c=;
        b=vCdnldzQJV7Zgsr4MZwbb8RT+P3bANUYX3SFQLlfO1Kla8sslLEKIWmcfT+mD+ICls
         y/6LGFadWQMInKcWgyKGVd7oIgnd/AhHvg2XdXS+ivTABT2P2aWD7ep6vye6uRDUCVs9
         t12ylOGD9PCaV7L0AEc0ll1vS3a4MnSJNlLvqem171ioYOMYLC1jK/bw/aAOxiLx8XDg
         rxd6+VA8nGm0i+wkXLBzcC2er7t3EVbjRP/quTBTHKwBpABQFIgnbGSFaBE5wxAwtPrP
         KTYUvc4LCN+LhNVlL/U3Z6x9tGSwa+t7QJsyPdOd2b4vKr1f23j2xYRzuseboOzMEPy3
         QLTg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=ONU3wCGmUfc7hDzP7+D12zVVNqLi36qIyfRodej/D6c=;
        b=C110m4uTkezm8eBYPFZYoZwvwmSOXgI1yCgQoWh+h0c+ubZuV8Bicy2LlZoL3GEMAr
         t6qTw0jt6476D6CJDD9Z64QOGbNsNQaMGPqwnAQnUY6ufpRNXqAN7M98S/wS6/F6c128
         iSXGauTxur6zlIWx7NJVnBnQ50HZ5UjjfzzD32VzIxsPmliRhILLa5/PNDyFDCojkOZk
         FRoDtmOmz3NsL7DvRKG6y0NROdXv8PPdmFQcjulemauhA556fdN7kVrfv3b/SOpirI3A
         Fv8NP77lNi/R/hrpjjOLlnjVILByaZR6P7nn2FqhdPbkUFxWNx5cwFQEd28cha/GbAFW
         O3MA==
X-Gm-Message-State: AGi0PuaQvQvqMJrQt6MCNf7ZqCPM4BcU/8kfNYxh83FBXMTPzlhZFld+
	GdC/TU/XS4SHKsgOugcBz20=
X-Google-Smtp-Source: APiQypLGcvyL6vFlZfhwfptbI+mO9U9bS5ijPPHJ3H6lJqdCHE0cQtyYjMvMBpkVi7MCLavQ/8sNdw==
X-Received: by 2002:a0c:ac41:: with SMTP id m1mr12912509qvb.71.1588520676784;
        Sun, 03 May 2020 08:44:36 -0700 (PDT)
Return-Path: <bruce.ashfield@gmail.com>
Received: from localhost.localdomain (CPE04d4c4975b80-CM64777d5e8820.cpe.net.cable.rogers.com. [174.112.240.214])
        by smtp.gmail.com with ESMTPSA id p4sm7771506qkg.48.2020.05.03.08.44.35
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 03 May 2020 08:44:36 -0700 (PDT)
From: "Bruce Ashfield" <bruce.ashfield@gmail.com>
To: richard.purdie@linuxfoundation.org
Cc: openembedded-core@lists.openembedded.org,
	steve@sakoman.com
Subject: [PATCH 3/5] linux-yocto/5.4: update to v5.4.34
Date: Sun,  3 May 2020 11:44:28 -0400
Message-Id: <d26dd34e420456d2e8f5d6aed562e6b9dff96c0f.1588520452.git.bruce.ashfield@gmail.com>
X-Mailer: git-send-email 2.19.1
In-Reply-To: <cover.1588520452.git.bruce.ashfield@gmail.com>
References: <cover.1588520452.git.bruce.ashfield@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

From: Bruce Ashfield <bruce.ashfield@gmail.com>

Updating linux-yocto/5.4 to the latest korg -stable release that comprises
the following commits:

    6ccc74c083c0 Linux 5.4.34
    b538aacc9400 x86/microcode/AMD: Increase microcode PATCH_MAX_SIZE
    856a74fd7e61 scsi: target: fix hang when multiple threads try to destroy the same iscsi session
    992e469b4c44 scsi: target: remove boilerplate code
    4b3380e007b2 x86/resctrl: Fix invalid attempt at removing the default resource group
    3652782e3a87 x86/resctrl: Preserve CDP enable over CPU hotplug
    6b5e8e7cbe24 irqchip/ti-sci-inta: Fix processing of masked irqs
    9d2759006e29 ext4: do not zeroout extents beyond i_disksize
    653b42530952 i2c: designware: platdrv: Remove DPM_FLAG_SMART_SUSPEND flag on BYT and CHT
    e2b80bf26956 drm/amdgpu: fix the hw hang during perform system reboot and reset
    251f13126e23 drm/amd/powerplay: force the trim of the mclk dpm_levels if OD is enabled
    eecd70c77ff3 net/mlx5e: Use preactivate hook to set the indirection table
    57f578bce415 net/mlx5e: Rename hw_modify to preactivate
    67284c11399f net/mlx5e: Encapsulate updating netdev queues into a function
    cae385538886 mac80211_hwsim: Use kstrndup() in place of kasprintf()
    a8ce3412e8a2 mac80211: fix race in ieee80211_register_hw()
    21350f28b226 nl80211: fix NL80211_ATTR_FTM_RESPONDER policy
    aa5b11bb333c btrfs: check commit root generation in should_ignore_root
    0026e356e51a tracing: Fix the race between registering 'snapshot' event trigger and triggering 'snapshot' operation
    a0aaafe7ce4b keys: Fix proc_keys_next to increase position index
    f32a339e0321 arm64: vdso: don't free unallocated pages
    5209e5f05bf2 ALSA: usb-audio: Check mapping at creating connector controls, too
    250db0305392 ALSA: usb-audio: Don't create jack controls for PCM terminals
    aae6e154680f ALSA: usb-audio: Don't override ignore_ctl_error value from the map
    9acfd1ac016a ALSA: usb-audio: Filter error from connector kctl ops, too
    0eb7bcf3ad32 ALSA: hda/realtek - Enable the headset mic on Asus FX505DT
    549a48900d8e ASoC: Intel: mrfld: return error codes when an error occurs
    86ec55651fd2 ASoC: Intel: mrfld: fix incorrect check on p->sink
    538b623fed6d usb: dwc3: gadget: Don't clear flags before transfer ended
    3bffb20603cd arm64: dts: librem5-devkit: add a vbus supply to usb0
    3a8dc1e91561 ARM: dts: imx7-colibri: fix muxing of usbc_det pin
    c2c5d07090d4 clk: at91: usb: use proper usbs_mask
    90c1f740ddf8 clk: at91: sam9x60: fix usb clock parents
    c874d9d116d8 ext4: fix incorrect inodes per group in error message
    dd7b410c9b01 ext4: fix incorrect group count in ext4_fill_super error message
    44c70ed66c93 net/bpfilter: remove superfluous testing message
    229563dc6b04 pwm: pca9685: Fix PWM/GPIO inter-operation
    0a4c06f0db06 perf report: Fix no branch type statistics report issue
    4542e583e2b8 acpi/nfit: improve bounds checking for 'func'
    5815a5d70def jbd2: improve comments about freeing data buffers whose page mapping is NULL
    8078d3af4af7 platform/chrome: cros_ec_rpmsg: Fix race with host event
    777c8c9f11a8 scsi: ufs: Fix ufshcd_hold() caused scheduling while atomic
    66458aa271b0 ovl: fix value of i_ino for lower hardlink corner case
    c85a7109f905 Revert "ACPI: EC: Do not clear boot_ec_is_ecdt in acpi_ec_add()"
    4f2fb2a1990a net: stmmac: dwmac-sunxi: Provide TX and RX fifo sizes
    a06a51d59292 net/mlx5e: Fix pfnum in devlink port attribute
    e25122586403 net/mlx5e: Fix nest_level for vlan pop action
    cb8892f52ec9 net/mlx5e: Add missing release firmware call
    34310505d404 net/mlx5: Fix frequent ioread PCI access during recovery
    1ff0732cf805 net: ethernet: mediatek: move mt7623 settings out off the mt7530
    f749a8bfdd38 net: dsa: mt7530: move mt7623 settings out off the mt7530
    bb54dcca3fb5 net: tun: record RX queue in skb before do_xdp_generic()
    f6b264f2a04c net: revert default NAPI poll timeout to 2 jiffies
    61260486790e net: qrtr: send msgs from local of same id as broadcast
    81dc4e9bff98 net: phy: micrel: use genphy_read_status for KSZ9131
    a9a851f0ec67 net: ipv6: do not consider routes via gateways for anycast address check
    22e56cb2f951 net: ipv4: devinet: Fix crash when add/del multicast IP with autojoin
    3ca854743110 net: dsa: mt7530: fix tagged frames pass-through in VLAN-unaware mode
    016e3531d5c1 l2tp: Allow management of tunnels and session in user namespace
    22ea267a9cd6 hsr: check protocol version in hsr_newlink()
    ced57064a085 amd-xgbe: Use __napi_schedule() in BH context
    dc4059d21d87 Linux 5.4.33
    484cc15ad00f scsi: lpfc: fix inlining of lpfc_sli4_cleanup_poll_list()
    8dead2c275e4 ASoC: stm32: sai: Add missing cleanup
    aed5ee6befcc efi/x86: Fix the deletion of variables in mixed mode
    0c839eee166a mfd: dln2: Fix sanity checking for endpoints
    b70eb420e96d bpf: Fix tnum constraints for 32-bit comparisons
    26711cc7e064 mmc: sdhci: Refactor sdhci_set_timeout()
    56a296657e4b mmc: sdhci: Convert sdhci_set_timeout_irq() to non-static
    c1f3e1d8d7e6 powerpc/kasan: Fix kasan_remap_early_shadow_ro()
    36b0b1f63994 drm/i915/icl+: Don't enable DDI IO power on a TypeC port in TBT mode
    bdac1d76a310 drm/amdgpu: fix gfx hang during suspend with video playback (v2)
    d1bbdf003c05 drm/dp_mst: Fix clearing payload state on topology disable
    7676e69c67e3 Revert "drm/dp_mst: Remove VCPI while disabling topology mgr"
    ba74ab0c29fc scsi: lpfc: Fix broken Credit Recovery after driver load
    33ebae4f3ba6 scsi: lpfc: Fix configuration of BB credit recovery in service parameters
    037b0b5521a4 scsi: lpfc: Fix Fabric hostname registration if system hostname changes
    f48e7593523e scsi: lpfc: Add registration for CPU Offline/Online events
    33344a7661a1 dm clone: Add missing casts to prevent overflows and data corruption
    2d7eb7ee36a3 dm clone: Fix handling of partial region discards
    dcf2f00b0869 dm clone: replace spin_lock_irqsave with spin_lock_irq
    fddfa591da8e dm zoned: remove duplicate nr_rnd_zones increase in dmz_init_zone()
    1ba26c2aedb4 arm64: Always force a branch protection mode when the compiler has one
    ba7581be850b powerpc: Make setjmp/longjmp signature standard
    3457b2232eaf scsi: mpt3sas: Fix kernel panic observed on soft HBA unplug
    e294f8a5ad31 powerpc/64: Prevent stack protection in early boot
    fc8755dc01d1 powerpc/kprobes: Ignore traps that happened in real mode
    ed6f6b2b39af powerpc/xive: Fix xmon support on the PowerNV platform
    1ab730b65946 powerpc/64: Setup a paca before parsing device tree etc.
    9240f83aa9c7 powerpc/xive: Use XIVE_BAD_IRQ instead of zero to catch non configured IPIs
    bd0fa144737c powerpc/hash64/devmap: Use H_PAGE_THP_HUGE when setting up huge devmap PTE entries
    81b9336ab20e powerpc/fsl_booke: Avoid creating duplicate tlb1 entry
    38aa7f32dfd8 powerpc/64/tm: Don't let userspace set regs->trap via sigreturn
    0abc07d23c51 xen/blkfront: fix memory allocation flags in blkfront_setup_indirect()
    5fdf01181cb8 ipmi: fix hung processes in __get_guid()
    d0b9bd4804a7 libata: Return correct status in sata_pmp_eh_recover_pm() when ATA_DFLAG_DETACH is set
    ec2c054e87a5 hfsplus: fix crash and filesystem corruption when deleting files
    af80e6f70f72 cpufreq: powernv: Fix use-after-free
    9cc4f52d34a2 kmod: make request_module() return an error when autoloading is disabled
    bf4fcd52742e clk: ingenic/TCU: Fix round_rate returning error
    9e8388fdf4de clk: ingenic/jz4770: Exit with error if CGU init failed
    7bcca67bdee8 ftrace/kprobe: Show the maxactive number on kprobe_events
    7dad5beb8dfd Input: i8042 - add Acer Aspire 5738z to nomux list
    efb9e9f723f5 s390/diag: fix display of diagnose call statistics
    453fb8b20db4 perf tools: Support Python 3.8+ in Makefile
    beb3ef51cfd8 ocfs2: no need try to truncate file beyond i_size
    47199f4b87eb fs/filesystems.c: downgrade user-reachable WARN_ONCE() to pr_warn_once()
    6772387e8201 ext4: fix a data race at inode->i_blocks
    699d2c4d667e NFS: Fix a page leak in nfs_destroy_unlinked_subrequests()
    6b64cbd05807 NFS: Fix use-after-free issues in nfs_pageio_add_request()
    98a817eda5bc nfsd: fsnotify on rmdir under nfsd/clients/
    27993365c009 powerpc/pseries: Avoid NULL pointer dereference when drmem is unavailable
    4e4c6760fe03 drm/amdgpu: unify fw_write_wait for new gfx9 asics
    45bc323b8102 drm/amdgpu/powerplay: using the FCLK DPM table to set the MCLK
    fe0ec6f90e4d drm: Remove PageReserved manipulation from drm_pci_alloc
    b716a5f5ec65 drm/etnaviv: rework perfmon query infrastructure
    463a2dddb4f9 drm/i915/gem: Flush all the reloc_gpu batch
    cda1eda28f1d vfio: platform: Switch to platform_get_irq_optional()
    b5eec37a3b85 selftests/powerpc: Add tlbie_test in .gitignore
    e1ec78f93042 selftests/vm: fix map_hugetlb length used for testing read and write
    336b96a68170 selftests: vm: drop dependencies on page flags from mlock2 tests
    20a62e9073f3 arm64: armv8_deprecated: Fix undef_hook mask for thumb setend
    3d66a67f7310 arm64: dts: ti: k3-am65: Add clocks to dwc3 nodes
    9d971b0059a2 ARM: dts: exynos: Fix polarity of the LCD SPI bus on UniversalC210 board
    e5b9c1027ee8 scsi: lpfc: Fix lpfc_io_buf resource leak in lpfc_get_scsi_buf_s4 error path
    73a122c2636d scsi: ufs: fix Auto-Hibern8 error detection
    0ad68e6212ad scsi: zfcp: fix missing erp_lock in port recovery trigger for point-to-point
    8179a260313e crypto: ccree - dec auth tag size from cryptlen map
    9135cd1b0f64 crypto: ccree - only try to map auth tag if needed
    a86744642789 crypto: ccree - protect against empty or NULL scatterlists
    f3f13f979448 crypto: caam - update xts sector size for large input length
    bc8413b626dd crypto: caam/qi2 - fix chacha20 data size error
    07378b099139 xarray: Fix early termination of xas_for_each_marked
    8f4c8e92bdac XArray: Fix xas_pause for large multi-index entries
    a1ffc47f22a8 dm clone metadata: Fix return type of dm_clone_nr_of_hydrated_regions()
    996f8f1ba72a dm clone: Add overflow check for number of regions
    2e703059348d dm verity fec: fix memory leak in verity_fec_dtr
    833309f3fb51 dm integrity: fix a crash with unusually large tag size
    bef0d2f5fdcb dm writecache: add cond_resched to avoid CPU hangs
    5c84ab9c96d7 mm, memcg: do not high throttle allocators based on wraparound
    935e87b20c56 arm64: dts: allwinner: h5: Fix PMU compatible
    1dbfae009525 sched/core: Remove duplicate assignment in sched_tick_remote()
    8b068046321f arm64: dts: allwinner: h6: Fix PMU compatible
    27dbb3633809 net: qualcomm: rmnet: Allow configuration updates to existing devices
    add09c86cd3e tools: gpio: Fix out-of-tree build regression
    a0f079ac13be powerpc/pseries: Drop pointless static qualifier in vpa_debugfs_init()
    e0ae9da3fb2f mmc: sdhci-of-esdhc: fix esdhc_reset() for different controller versions
    7661469ef56e io_uring: honor original task RLIMIT_FSIZE
    a181a74610e6 erofs: correct the remaining shrink objects
    433868b19ce0 crypto: mxs-dcp - fix scatterlist linearization for hash
    248414f50596 crypto: rng - Fix a refcounting bug in crypto_rng_reset()
    6b936b1872ba remoteproc: Fix NULL pointer dereference in rproc_virtio_notify
    5b677eddc547 remoteproc: qcom_q6v5_mss: Reload the mba region on coredump
    241f681d19e1 remoteproc: qcom_q6v5_mss: Don't reassign mpss region on shutdown
    87a9058d5552 btrfs: use nofs allocations for running delayed items
    0425813c2279 btrfs: fix missing semaphore unlock in btrfs_sync_file
    08e69ab983da btrfs: unset reloc control if we fail to recover
    098d3da1ad30 btrfs: fix missing file extent item for hole after ranged fsync
    b436fbff6fca btrfs: drop block from cache on error in relocation
    dd68ba0d7355 btrfs: set update the uuid generation as soon as possible
    441b83a84208 btrfs: reloc: clean dirty subvols if we fail to start a transaction
    1bd44cada415 Btrfs: fix crash during unmount due to race with delayed inode workers
    941dabde6c1a btrfs: Don't submit any btree write bio if the fs has errors
    0297b7f9842e mtd: spinand: Do not erase the block before writing a bad block marker
    4da7c98c3081 mtd: spinand: Stop using spinand->oobbuf for buffering bad block markers
    c138ad0741fc CIFS: Fix bug which the return value by asynchronous read is error
    9b35348318d1 smb3: fix performance regression with setting mtime
    40888c31aca3 KVM: VMX: fix crash cleanup when KVM wasn't used
    93a2b7368862 KVM: VMX: Add a trampoline to fix VMREAD error handling
    771b9374a529 KVM: x86: Gracefully handle __vmalloc() failure during VM allocation
    455f37affe13 KVM: VMX: Always VMCLEAR in-use VMCSes during crash with kexec support
    bcd1d7462aba KVM: x86: Allocate new rmap and large page tracking when moving memslot
    0c7fb8c91c0f KVM: s390: vsie: Fix delivery of addressing exceptions
    654b70e84710 KVM: s390: vsie: Fix region 1 ASCE sanity shadow address checks
    2c5bfcda8791 KVM: nVMX: Properly handle userspace interrupt window request
    99a890ed7009 platform/x86: asus-wmi: Support laptops where the first battery is named BATT
    bd90b96e3486 x86/entry/32: Add missing ASM_CLAC to general_protection entry
    3dc06261a41f x86/tsc_msr: Make MSR derived TSC frequency more accurate
    41a7f842e312 x86/tsc_msr: Fix MSR_FSB_FREQ mask for Cherry Trail devices
    6c63cf15d066 x86/tsc_msr: Use named struct initializers
    5f2d04139aa5 signal: Extend exec_id to 64bits
    0a993df8d609 ath9k: Handle txpower changes even when TPC is disabled
    d941b33bdc68 PM: sleep: wakeup: Skip wakeup_source_sysfs_remove() if device is not there
    4fcbc35fab57 PM / Domains: Allow no domain-idle-states DT property in genpd when parsing
    5bd5307cd264 MIPS: OCTEON: irq: Fix potential NULL pointer dereference
    ed374eee8ce6 MIPS/tlbex: Fix LDDIR usage in setup_pw() for Loongson-3
    4acbbe98e06a pstore: pstore_ftrace_seq_next should increase position index
    38119a689766 io_uring: remove bogus RLIMIT_NOFILE check in file registration
    6124e10dbc4f irqchip/versatile-fpga: Apply clear-mask earlier
    3f3700c4697b genirq/debugfs: Add missing sanity checks to interrupt injection
    6ecc37daf64e cpu/hotplug: Ignore pm_wakeup_pending() for disable_nonboot_cpus()
    4b67e5afc2a0 KEYS: reaching the keys quotas correctly
    f7384f90ecc7 tpm: tpm2_bios_measurements_next should increase position index
    27544e1bdcc6 tpm: tpm1_bios_measurements_next should increase position index
    96e05bb57b40 tpm: Don't make log failures fatal
    524089fa70ef sched/fair: Fix enqueue_task_fair warning
    8b6f8619fc96 PCI: endpoint: Fix for concurrent memory allocation in OB address region
    96843346b201 PCI: qcom: Fix the fixup of PCI_VENDOR_ID_QCOM
    55b61a08bf86 PCI: Add boot interrupt quirk mechanism for Xeon chipsets
    72d52a779e99 PCI/ASPM: Clear the correct bits when enabling L1 substates
    463181e64f5f PCI: pciehp: Fix indefinite wait on sysfs requests
    c755ca32c8cd efi/x86: Add TPM related EFI tables to unencrypted mapping checks
    91bed1f1fb97 nvme-fc: Revert "add module to ops template to allow module references"
    0eb4d8b985be nvmet-tcp: fix maxh2cdata icresp parameter
    b3c7227ad4c6 thermal: devfreq_cooling: inline all stubs for CONFIG_DEVFREQ_THERMAL=n
    e7251a88d387 ACPI: PM: s2idle: Refine active GPEs check
    dd993e283bc3 ACPICA: Allow acpi_any_gpe_status_set() to skip one GPE
    1efd20ea57d4 acpi/x86: ignore unspecified bit positions in the ACPI global lock field
    52e6985f2c91 seccomp: Add missing compat_ioctl for notify
    15ae94fe2211 media: ti-vpe: cal: fix a kernel oops when unloading module
    3a59d985ceb1 media: ti-vpe: cal: fix disable_irqs to only the intended target
    46b0e2900ee2 media: hantro: Read be32 words starting at every fourth byte
    7ac962c5b730 media: venus: firmware: Ignore secure call error on first resume
    be9956bac91a ALSA: hda/realtek - Add quirk for MSI GL63
    09e7b678f3e0 ALSA: hda/realtek - Add quirk for Lenovo Carbon X1 8th gen
    f5462668ad94 ALSA: hda/realtek - Remove now-unnecessary XPS 13 headphone noise fixups
    a92931dea6b1 ALSA: hda/realtek - Set principled PC Beep configuration for ALC256
    0f18192b6924 ALSA: doc: Document PC Beep Hidden Register on Realtek ALC256
    3e7167475236 ALSA: hda/realtek - a fake key event is triggered by running shutup
    faea94956333 ALSA: hda/realtek: Enable mute LED on an HP system
    1dfcd70d1fcc ALSA: pcm: oss: Fix regression by buffer overflow fix
    e3ab9c5540e3 ALSA: ice1724: Fix invalid access for enumerated ctl items
    6a9ba565b41f ALSA: hda: Fix potential access overflow in beep helper
    f4f0a1f017e0 ALSA: hda: Add driver blacklist
    1ee0023c340e ALSA: usb-audio: Add mixer workaround for TRX40 and co
    78a92756fc2c usb: gadget: composite: Inform controller driver of self-powered
    a385ebdaa4dc usb: gadget: f_fs: Fix use after free issue as part of queue failure
    9a8b1ba9d41f ASoC: topology: use name_prefix for new kcontrol
    f467e054c03f ASoC: dpcm: allow start or stop during pause for backend
    af0b76f9f632 ASoC: dapm: connect virtual mux with default value
    803db8a07868 ASoC: fix regwmask
    acec0e9a916a btrfs: track reloc roots based on their commit root bytenr
    9632851a5326 btrfs: restart relocate_tree_blocks properly
    ddc25a38ab36 btrfs: remove a BUG_ON() from merge_reloc_roots()
    679885143c04 btrfs: qgroup: ensure qgroup_rescan_running is only set when the worker is at least queued
    b37de1b1e882 block, bfq: fix use-after-free in bfq_idle_slice_timer_body
    bd9afea9bde7 locking/lockdep: Avoid recursion in lockdep_count_{for,back}ward_deps()
    b9da72cb7019 spi: spi-fsl-dspi: Replace interruptible wait queue with a simple completion
    64a97384d4f4 firmware: fix a double abort case with fw_load_sysfs_fallback
    2d29a61a14fa md: check arrays is suspended in mddev_detach before call quiesce operations
    6420b2e5fa66 irqchip/gic-v4: Provide irq_retrigger to avoid circular locking dependency
    80e85ab88b3f usb: dwc3: core: add support for disabling SS instances in park mode
    b6257832dd45 media: i2c: ov5695: Fix power on and off sequences
    510b4e069508 block: Fix use-after-free issue accessing struct io_cq
    b9d5ced37ac7 genirq/irqdomain: Check pointer in irq_domain_alloc_irqs_hierarchy()
    bceda1dd4716 efi/x86: Ignore the memory attributes table on i386
    fc427b7a0266 x86/boot: Use unsigned comparison for addresses
    f6bb3ea812f0 cpufreq: imx6q: fix error handling
    c5bcaacd0640 gfs2: Don't demote a glock until its revokes are written
    46bbc5526dd7 gfs2: Do log_flush in gfs2_ail_empty_gl even if ail list is empty
    aa547b9dc20f pstore/platform: fix potential mem leak if pstore_init_fs failed
    347f091094ab libata: Remove extra scsi_host_put() in ata_scsi_add_hosts()
    288761c9f0a2 media: i2c: video-i2c: fix build errors due to 'imply hwmon'
    fb80a18584a4 block, bfq: move forward the getting of an extra ref in bfq_bfqq_move
    d1d846fb02a8 PCI/switchtec: Fix init_completion race condition with poll_wait()
    75434bcc6593 selftests/x86/ptrace_syscall_32: Fix no-vDSO segfault
    dd39eadc71d4 sched: Avoid scale real weight down to zero
    f7557078e16e media: allegro: fix type of gop_length in channel_create message
    2902207377f8 time/sched_clock: Expire timer in hardirq context
    3f755f5233a2 irqchip/versatile-fpga: Handle chained IRQs properly
    c8b81c33c5cb debugfs: Check module state before warning in {full/open}_proxy_open()
    fd66df97dce9 block: keep bdi->io_pages in sync with max_sectors_kb for stacked devices
    e88ee287fd82 dma-mapping: Fix dma_pgprot() for unencrypted coherent pages
    aa04e8d359d7 x86: Don't let pgprot_modify() change the page encryption bit
    ce7a61a0d57d ACPI: EC: Do not clear boot_ec_is_ecdt in acpi_ec_add()
    99e20a79d215 xhci: bail out early if driver can't accress host in resume
    61ed3dcad80c media: imx: imx7-media-csi: Fix video field handling
    dd051f1af594 media: imx: imx7_mipi_csis: Power off the source when stopping streaming
    502b83e73e35 null_blk: fix spurious IO errors after failed past-wp access
    38c1299f8c5c null_blk: Handle null_add_dev() failures properly
    becd9a906657 null_blk: Fix the null_add_dev() error path
    f9ee512dd913 firmware: arm_sdei: fix double-lock on hibernate with shared events
    7bf2c31ba0bb media: venus: hfi_parser: Ignore HEVC encoding for V1
    0d3d868b34af staging: wilc1000: avoid double unlocking of 'wilc->hif_cs' mutex
    d5bc44e6b0d4 cpufreq: imx6q: Fixes unwanted cpu overclocking on i.MX6ULL
    33dbe5867c39 media: rc: add keymap for Videostrong KII Pro
    a5ef462303e0 i2c: pca-platform: Use platform_irq_get_optional
    54d09aab81aa i2c: st: fix missing struct parameter description
    28f5b6ee1c2f qlcnic: Fix bad kzalloc null test
    d7f6f2b0be09 cfg80211: Do not warn on same channel at the end of CSA
    068168461e68 drm/scheduler: fix rare NULL ptr race
    f5429ec64f4f cxgb4/ptp: pass the sign of offset delta in FW CMD
    d2037f68ae03 selftests/net: add definition for SOL_DCCP to fix compilation errors for old libc
    9a3f55fc0f46 hinic: fix wrong value of MIN_SKB_LEN
    a8f9fe793001 hinic: fix wrong para of wait_for_completion_timeout
    243ebc24e01c hinic: fix out-of-order excution in arm cpu
    5edd115ba09e hinic: fix the bug of clearing event queue
    d63fac896335 hinic: fix a bug of waitting for IO stopped
    ad4ad8253f89 net: vxge: fix wrong __VA_ARGS__ usage
    b9c961998565 net: stmmac: platform: Fix misleading interrupt error msg
    f96f2c885eda rxrpc: Fix call interruptibility handling
    f8da7f442861 rxrpc: Abstract out the calculation of whether there's Tx space
    96860db5c09f soc: fsl: dpio: register dpio irq handlers after dpio create
    10e15e1b9297 Input: tm2-touchkey - add support for Coreriver TC360 variant
    ed1c4d2ca9da iwlwifi: mvm: Fix rate scale NSS configuration
    fd29a0242f86 bpf: Fix deadlock with rq_lock in bpf_send_signal()
    5c234312e805 ARM: dts: Fix dm814x Ethernet by changing to use rgmii-id mode
    d04ffa50f901 bus: sunxi-rsb: Return correct data when mixing 16-bit and 8-bit reads
    7092cc4590c0 ARM: dts: sun8i-a83t-tbs-a711: HM5065 doesn't like such a high voltage

Signed-off-by: Bruce Ashfield <bruce.ashfield@gmail.com>
---
 .../linux/linux-yocto-rt_5.4.bb               |  6 ++---
 .../linux/linux-yocto-tiny_5.4.bb             |  8 +++----
 meta/recipes-kernel/linux/linux-yocto_5.4.bb  | 22 +++++++++----------
 3 files changed, 18 insertions(+), 18 deletions(-)

diff --git a/meta/recipes-kernel/linux/linux-yocto-rt_5.4.bb b/meta/recipes-kernel/linux/linux-yocto-rt_5.4.bb
index 42e4bca574..d550bf5371 100644
--- a/meta/recipes-kernel/linux/linux-yocto-rt_5.4.bb
+++ b/meta/recipes-kernel/linux/linux-yocto-rt_5.4.bb
@@ -11,13 +11,13 @@ python () {
         raise bb.parse.SkipRecipe("Set PREFERRED_PROVIDER_virtual/kernel to linux-yocto-rt to enable it")
 }
 
-SRCREV_machine ?= "2348504c2c1035e1d7227d25224c9345f7b129d3"
-SRCREV_meta ?= "fa59277b2013ec395f3beb3656becb48fdf4b555"
+SRCREV_machine ?= "c7609ad17612bd59c1cadb53faf23be8fd7250ef"
+SRCREV_meta ?= "054d410d1a73e4729f1fe7540db058de69fe8cfe"
 
 SRC_URI = "git://git.yoctoproject.org/linux-yocto.git;branch=${KBRANCH};name=machine \
            git://git.yoctoproject.org/yocto-kernel-cache;type=kmeta;name=meta;branch=yocto-5.4;destsuffix=${KMETA}"
 
-LINUX_VERSION ?= "5.4.32"
+LINUX_VERSION ?= "5.4.34"
 
 LIC_FILES_CHKSUM = "file://COPYING;md5=bbea815ee2795b2f4230826c0c6b8814"
 
diff --git a/meta/recipes-kernel/linux/linux-yocto-tiny_5.4.bb b/meta/recipes-kernel/linux/linux-yocto-tiny_5.4.bb
index ec4e7679f1..078a15cec0 100644
--- a/meta/recipes-kernel/linux/linux-yocto-tiny_5.4.bb
+++ b/meta/recipes-kernel/linux/linux-yocto-tiny_5.4.bb
@@ -6,7 +6,7 @@ KCONFIG_MODE = "--allnoconfig"
 
 require recipes-kernel/linux/linux-yocto.inc
 
-LINUX_VERSION ?= "5.4.32"
+LINUX_VERSION ?= "5.4.34"
 LIC_FILES_CHKSUM = "file://COPYING;md5=bbea815ee2795b2f4230826c0c6b8814"
 
 DEPENDS += "${@bb.utils.contains('ARCH', 'x86', 'elfutils-native', '', d)}"
@@ -15,9 +15,9 @@ DEPENDS += "openssl-native util-linux-native"
 KMETA = "kernel-meta"
 KCONF_BSP_AUDIT_LEVEL = "2"
 
-SRCREV_machine_qemuarm ?= "63425cc3498f7f10b1571b38718ed47234d5ade7"
-SRCREV_machine ?= "d66ed1ee791577746d30b29baef734fbb9297431"
-SRCREV_meta ?= "fa59277b2013ec395f3beb3656becb48fdf4b555"
+SRCREV_machine_qemuarm ?= "ba0b1e26460cb764005af5758334fc1777760dfd"
+SRCREV_machine ?= "e378a5626133c1f46c7ee4ede3785dbb805dc5ab"
+SRCREV_meta ?= "054d410d1a73e4729f1fe7540db058de69fe8cfe"
 
 PV = "${LINUX_VERSION}+git${SRCPV}"
 
diff --git a/meta/recipes-kernel/linux/linux-yocto_5.4.bb b/meta/recipes-kernel/linux/linux-yocto_5.4.bb
index 485928bd88..e225094698 100644
--- a/meta/recipes-kernel/linux/linux-yocto_5.4.bb
+++ b/meta/recipes-kernel/linux/linux-yocto_5.4.bb
@@ -12,16 +12,16 @@ KBRANCH_qemux86  ?= "v5.4/standard/base"
 KBRANCH_qemux86-64 ?= "v5.4/standard/base"
 KBRANCH_qemumips64 ?= "v5.4/standard/mti-malta64"
 
-SRCREV_machine_qemuarm ?= "bee6048166651d8c69327a0b0ff4f4b87d961d5c"
-SRCREV_machine_qemuarm64 ?= "d66ed1ee791577746d30b29baef734fbb9297431"
-SRCREV_machine_qemumips ?= "2180ef2ea5645cf63a1aa738f15e72c240c313ea"
-SRCREV_machine_qemuppc ?= "d66ed1ee791577746d30b29baef734fbb9297431"
-SRCREV_machine_qemuriscv64 ?= "d66ed1ee791577746d30b29baef734fbb9297431"
-SRCREV_machine_qemux86 ?= "d66ed1ee791577746d30b29baef734fbb9297431"
-SRCREV_machine_qemux86-64 ?= "d66ed1ee791577746d30b29baef734fbb9297431"
-SRCREV_machine_qemumips64 ?= "6afe026b32fd5ac553420f68052a665e3fcacd53"
-SRCREV_machine ?= "d66ed1ee791577746d30b29baef734fbb9297431"
-SRCREV_meta ?= "fa59277b2013ec395f3beb3656becb48fdf4b555"
+SRCREV_machine_qemuarm ?= "440e41f2f471ba2bb5e3c801ffc140523bdd59b1"
+SRCREV_machine_qemuarm64 ?= "e378a5626133c1f46c7ee4ede3785dbb805dc5ab"
+SRCREV_machine_qemumips ?= "941c329c8810e946840bd2f4ab983a94651e563f"
+SRCREV_machine_qemuppc ?= "e378a5626133c1f46c7ee4ede3785dbb805dc5ab"
+SRCREV_machine_qemuriscv64 ?= "e378a5626133c1f46c7ee4ede3785dbb805dc5ab"
+SRCREV_machine_qemux86 ?= "e378a5626133c1f46c7ee4ede3785dbb805dc5ab"
+SRCREV_machine_qemux86-64 ?= "e378a5626133c1f46c7ee4ede3785dbb805dc5ab"
+SRCREV_machine_qemumips64 ?= "b73834a11da2d4327cc3cb9f33fa3540f24d56aa"
+SRCREV_machine ?= "e378a5626133c1f46c7ee4ede3785dbb805dc5ab"
+SRCREV_meta ?= "054d410d1a73e4729f1fe7540db058de69fe8cfe"
 
 # remap qemuarm to qemuarma15 for the 5.4 kernel
 # KMACHINE_qemuarm ?= "qemuarma15"
@@ -30,7 +30,7 @@ SRC_URI = "git://git.yoctoproject.org/linux-yocto.git;name=machine;branch=${KBRA
            git://git.yoctoproject.org/yocto-kernel-cache;type=kmeta;name=meta;branch=yocto-5.4;destsuffix=${KMETA}"
 
 LIC_FILES_CHKSUM = "file://COPYING;md5=bbea815ee2795b2f4230826c0c6b8814"
-LINUX_VERSION ?= "5.4.32"
+LINUX_VERSION ?= "5.4.34"
 
 DEPENDS += "${@bb.utils.contains('ARCH', 'x86', 'elfutils-native', '', d)}"
 DEPENDS += "openssl-native util-linux-native"
-- 
2.19.1

