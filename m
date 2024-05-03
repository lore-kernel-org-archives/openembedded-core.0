Return-Path: <bruce.ashfield@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id A6991C04FFE
	for <webhook@archiver.kernel.org>; Fri,  3 May 2024 03:00:35 +0000 (UTC)
Received: from mail-qv1-f46.google.com (mail-qv1-f46.google.com [209.85.219.46])
 by mx.groups.io with SMTP id smtpd.web11.4333.1714705225352673970
 for <openembedded-core@lists.openembedded.org>;
 Thu, 02 May 2024 20:00:25 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20230601 header.b=WCWgt5ly;
 spf=pass (domain: gmail.com, ip: 209.85.219.46, mailfrom: bruce.ashfield@gmail.com)
Received: by mail-qv1-f46.google.com with SMTP id 6a1803df08f44-6a0b68733f5so42935526d6.1
        for <openembedded-core@lists.openembedded.org>; Thu, 02 May 2024 20:00:25 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1714705224; x=1715310024; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=ynLyrq8AvgJtB5t3cJy9C2HIp3dm16kPe8QvkPGjQ9k=;
        b=WCWgt5lyvB8EIKkTY4dCOJs+ueVxb5nAIs5IcXYpc0wPmrNsFFLa4nHUCkJHQhJS19
         JK+7KduTdVu2fgdvY2xgAP/2PMCvlWaKHtkKZ1G9cw24V8U+/GyS2Y17XbVenNQBup7w
         e30Ovy/mBXqSta9SLpFPJFTYi12FBpZMF1j94czyU9iIVsx+Fcw9NCqApDnbKLi6OgCh
         9KD3D/yoQT4/LunRm+mS9cbui+vXZWbpqjPUk3Ag3hKZM8xIF5b1ewyJPwFv/gkLhn4c
         aW0hWlXjL+hVu7sth33WJ7Q5aBQdS2JM0AmyFzw/h4UFZ3FsZHqWQwuiHJf5cn3ybbe8
         25TA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1714705224; x=1715310024;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=ynLyrq8AvgJtB5t3cJy9C2HIp3dm16kPe8QvkPGjQ9k=;
        b=AXcpbYH7cRxsj+wh+gWY81YH9OkymmLSvHWCaef2/1osG+cz2qR1qQUyOeviZwfNgZ
         V54TbhKazfLR6Wf4dYQyG1G8ZEZ2rCiwEgpuquVa3Qc3QrErpcvvpJRKXXo/OXiDAbLe
         I+PEuzcHaia+M4J6n1WyRvUaQnBwauAcwJjuZ5gv3fCnoqY1d9v/3R+FQMHxFYLmo3BX
         Ui5VS8EnVpNwcV7BTxyCT64mLGn8m6lp6MuY1LIAstOTxsPNPwsXdO9IrvpR1p9xqUuz
         kytyT7fFW4ygJBafCoIQFsTYpGgBOA7rCwWD69xKVzLnQce494GWRQVJZnbwV/Ltq/4d
         2eBA==
X-Gm-Message-State: AOJu0Ywyz9ecqBVfXUXeTvo8hfM/GWmMFzjE3OQagh4tGgocZix0N3RU
	+ZruY06MTrT8/pm5Ux1RdZKzMnOFlXWQleWTIRhi9VgX9oQiTjkreOibjw==
X-Google-Smtp-Source: AGHT+IFhlWUK769ETzr4fCiB2BbFYp/4txCHfyBccJmdux6BnT/MTYmAlPoBPApCYPuiy0QHEANgAA==
X-Received: by 2002:a05:6214:27e4:b0:6a0:af07:1089 with SMTP id jt4-20020a05621427e400b006a0af071089mr1527881qvb.55.1714705223739;
        Thu, 02 May 2024 20:00:23 -0700 (PDT)
Received: from bruce-XPS-8940.localdomain (pool-174-112-62-108.cpe.net.cable.rogers.com. [174.112.62.108])
        by smtp.gmail.com with ESMTPSA id mi5-20020a056214558500b006a0fa96013asm839357qvb.138.2024.05.02.20.00.22
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 02 May 2024 20:00:23 -0700 (PDT)
From: bruce.ashfield@gmail.com
To: steve@sakoman.com
Cc: openembedded-core@lists.openembedded.org
Subject: [OE-core][nanbield 07/10] linux-yocto/6.1: update to v6.1.86
Date: Thu,  2 May 2024 23:00:12 -0400
Message-Id: <20240503030015.374078-7-bruce.ashfield@gmail.com>
X-Mailer: git-send-email 2.39.2
In-Reply-To: <20240503030015.374078-1-bruce.ashfield@gmail.com>
References: <20240503030015.374078-1-bruce.ashfield@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Fri, 03 May 2024 03:00:35 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/198962

From: Bruce Ashfield <bruce.ashfield@gmail.com>

Updating linux-yocto/6.1 to the latest korg -stable release that comprises
the following commits:

    cd5d98c0556c Linux 6.1.86
    c5f9fe2c1e50 Revert "drm/amd/amdgpu: Fix potential ioremap() memory leaks in amdgpu_device_init()"
    eea65ed73898 VMCI: Fix possible memcpy() run-time warning in vmci_datagram_invoke_guest_handler()
    cea93dae3e25 net: mpls: error out if inner headers are not set
    21f5cfed1e7a Bluetooth: btintel: Fixe build regression
    00e34ff1ce81 platform/x86: intel-vbtn: Update tablet mode switch at end of probe
    e80b4980af26 randomize_kstack: Improve entropy diffusion
    649e5646362a virtio: reenable config if freezing device failed
    3a9c459091e3 scsi: sd: usb_storage: uas: Access media prior to querying device properties
    345b6b831980 Revert "scsi: core: Add struct for args to execution functions"
    f1465ff4c83c Revert "scsi: sd: usb_storage: uas: Access media prior to querying device properties"
    cf0650adb625 gcc-plugins/stackleak: Avoid .head.text section
    2b85977977cb tty: n_gsm: require CAP_NET_ADMIN to attach N_GSM0710 ldisc
    2aeb805a1bcd netfilter: nf_tables: discard table flag update with pending basechain deletion
    8d3a58af50e4 netfilter: nf_tables: release mutex after nft_gc_seq_end from abort path
    fcd1993a2937 netfilter: nf_tables: release batch on table validation from abort path
    664206ff8b01 fbmon: prevent division by zero in fb_videomode_from_videomode()
    30044c66bc1a drivers/nvme: Add quirks for device 126f:2262
    5245a6da27ef io_uring: clear opcode specific data for an early failure
    f8a7b7b085df fbdev: viafb: fix typo in hw_bitblt_1 and hw_bitblt_2
    8b849265dad8 ASoC: soc-core.c: Skip dummy codec when adding platforms
    103c0f946f9a thermal/of: Assume polling-delay(-passive) 0 when absent
    409289d0a151 usb: sl811-hcd: only defined function checkdone if QUIRK2 is defined
    57e6634e591b usb: typec: tcpci: add generic tcpci fallback compatible
    f692c547e3f2 thunderbolt: Keep the domain powered when USB4 port is in redrive mode
    893b2562613f usb: gadget: uvc: mark incomplete frames with UVC_STREAM_ERR
    7dbf082988d6 bus: mhi: host: Add MHI_PM_SYS_ERR_FAIL state
    63eaa43d5d5f tools: iio: replace seekdir() in iio_generic_buffer
    1e9f5619d908 ring-buffer: use READ_ONCE() to read cpu_buffer->commit_page in concurrent environment
    5e7da5bb2d34 ktest: force $buildonly = 1 for 'make_warnings_file' test type
    39da708cb201 perf/x86/amd/lbr: Discard erroneous branch entries
    44479c7fefc8 platform/x86: touchscreen_dmi: Add an extra entry for a variant of the Chuwi Vi8 tablet
    70310e55b529 Input: allocate keycode for Display refresh rate toggle
    055e406d7b0e Input: imagis - use FIELD_GET where applicable
    4097b1f10f04 RDMA/cm: add timeout to cm_destroy_id wait
    512a01da7134 block: prevent division by zero in blk_rq_stat_sum()
    c87e811cae7e input/touchscreen: imagis: Correct the maximum touch area value
    b7d153bfba62 libperf evlist: Avoid out-of-bounds access
    aaefa79c1532 Revert "ACPI: PM: Block ASUS B1400CEAE from suspend to idle by default"
    43be051f35f9 SUNRPC: increase size of rpc_wait_queue.qlen from unsigned short to unsigned int
    3a94feab045f drm/amd/amdgpu: Fix potential ioremap() memory leaks in amdgpu_device_init()
    354a5d7bb740 drm/amd/display: Fix nanosec stat overflow
    aba664845af3 ext4: forbid commit inconsistent quota data when errors=remount-ro
    baba35106855 ext4: add a hint for block bitmap corrupt state in mb_groups
    b75395ec4b7a ALSA: firewire-lib: handle quirk to calculate payload quadlets as data block counter
    84ed33a08218 media: sta2x11: fix irq handler cast
    2e2177f94c0e Julia Lawall reported this null pointer dereference, this should fix it.
    3f3c1e735d3e rcu-tasks: Repair RCU Tasks Trace quiescence check
    eae948ecd5f0 ASoC: Intel: common: DMI remap for rebranded Intel NUC M15 (LAPRC710) laptops
    13701b0f01b6 isofs: handle CDs with bad root inode but good Joliet root directory
    ee0b5f96b6d6 scsi: lpfc: Fix possible memory leak in lpfc_rcv_padisc()
    53cb1e52c9db sysv: don't call sb_bread() with pointers_lock held
    5238e1c2bd31 pinctrl: renesas: checker: Limit cfg reg enum checks to provided IDs
    c87dd159189a drm: panel-orientation-quirks: Add quirk for GPD Win Mini
    ac1e0f080a76 Input: synaptics-rmi4 - fail probing if memory allocation for "phys" fails
    48bfb4b03c5f drm/vc4: don't check if plane->state->fb == state->fb
    a83a7728e487 Bluetooth: btmtk: Add MODULE_FIRMWARE() for MT7922
    b19fe5eea619 Bluetooth: btintel: Fix null ptr deref in btintel_read_version
    d7ee3bf0caf5 net/smc: reduce rtnl pressure in smc_pnet_create_pnetids_list()
    5693dd6d3d01 ice: use relative VSI index for VFs instead of PF VSI number
    9ae356c627b4 btrfs: send: handle path ref underflow in header iterate_inode_ref()
    0f30f95b918e btrfs: export: handle invalid inode or root reference in btrfs_get_parent()
    36c2a2863bc3 btrfs: handle chunk tree lookup error in btrfs_relocate_sys_chunks()
    50bd749c60ce cpufreq: Don't unregister cpufreq cooling on CPU hotplug
    6597a6687af5 wifi: ath11k: decrease MHI channel buffer length to 8KB
    4e0cfb25d49d dma-direct: Leak pages on dma_set_decrypted() failure
    a3f6045ce3c9 net: pcs: xpcs: Return EINVAL in the internal methods
    51a9b20a047d tools/power x86_energy_perf_policy: Fix file leak in get_pkg_num()
    635594cca59f pstore/zone: Add a null pointer check to the psz_kmsg_read
    8ead0a04a7f3 wifi: brcmfmac: Add DMI nvram filename quirk for ACEPC W5 Pro
    161d6b803778 firmware: tegra: bpmp: Return directly after a failed kzalloc() in get_filename()
    8af60bb2b215 net: skbuff: add overflow debug check to pull/push helpers
    b8ca15861c88 ionic: set adminq irq affinity
    6925d11fbda2 arm64: dts: rockchip: fix rk3399 hdmi ports node
    a29204893476 arm64: dts: rockchip: fix rk3328 hdmi ports node
    b510fbe3a7bf cpuidle: Avoid potential overflow in integer multiplication
    94b016b28bdd panic: Flush kernel log buffer at the end
    8d80e092027a wifi: iwlwifi: pcie: Add the PCI device id for new hardware
    feacd430b42b VMCI: Fix memcpy() run-time warning in dg_dispatch_as_host()
    fd5fdacae93a wifi: rtw89: pci: enlarge RX DMA buffer to consider size of RX descriptor
    d6b0472d5fbd bnx2x: Fix firmware version string character counts
    7dd4831c3ecb wifi: ath9k: fix LNA selection in ath_ant_try_scan()
    e6768c6737f4 amdkfd: use calloc instead of kzalloc to avoid integer overflow
    bf1e3b1cb1e0 Linux 6.1.85
    e21838dfd084 x86: set SPECTRE_BHI_ON as default
    3e4283b77107 KVM: x86: Add BHI_NO
    43704e993ae5 x86/bhi: Mitigate KVM by default
    bb8384b6dfbc x86/bhi: Add BHI mitigation knob
    42196bdec082 x86/bhi: Enumerate Branch History Injection (BHI) bug
    29c50bb6fbe4 x86/bhi: Define SPEC_CTRL_BHI_DIS_S
    07dbb10f153f x86/bhi: Add support for clearing branch history at syscall entry
    74fcb181772e x86/syscall: Don't force use of indirect calls for system calls
    fd52c0397b53 x86/bugs: Change commas to semicolons in 'spectre_v2' sysfs file
    5e6898b8544d nvme: fix miss command type check
    9c2b4b657739 mm/secretmem: fix GUP-fast succeeding on secretmem folios
    a6dc534c073b selftests: mptcp: display simult in extra_msg
    d1fefedc1a0e mptcp: don't account accept() of non-MPC client as fallback to TCP
    08ef93ebc73c selftests: mptcp: join: fix dev in check_endpoint
    7e8360ac8774 smb: client: fix potential UAF in cifs_signal_cifsd_for_reconnect()
    f9414004798d smb: client: fix potential UAF in smb2_is_network_name_deleted()
    494c91e1e941 smb: client: fix potential UAF in is_valid_oplock_break()
    c868cabdf6fd smb: client: fix potential UAF in smb2_is_valid_lease_break()
    84488466b7a6 smb: client: fix potential UAF in smb2_is_valid_oplock_break()
    16b7d785775e smb: client: fix potential UAF in cifs_stats_proc_show()
    8fefd166fcb3 smb: client: fix potential UAF in cifs_stats_proc_write()
    229042314602 smb: client: fix potential UAF in cifs_debug_files_proc_show()
    8c99dfb49bdc smb3: retrying on failed server close
    f6583444d7e7 riscv: process: Fix kernel gp leakage
    c88f7a709512 riscv: Fix spurious errors from __get/put_kernel_nofault
    447d844a3e10 s390/entry: align system call table on 8 bytes
    22943e4fe4b3 x86/coco: Require seeding RNG with RDRAND on CoCo systems
    20a915154ccb x86/mce: Make sure to grab mce_sysfs_mutex in set_bank()
    97e93367e827 x86/mm/pat: fix VM_PAT handling in COW mappings
    7b6df050c45a of: dynamic: Synchronize of_changeset_destroy() with the devlink removals
    9406d598a13a driver core: Introduce device_link_wait_removal()
    f35d7ede62d9 ALSA: hda/realtek: Update Panasonic CF-SZ6 quirk to support headset with microphone
    2ff8f0655057 ALSA: hda/realtek - Fix inactive headset mic jack
    883e072e83f1 ksmbd: do not set SMB2_GLOBAL_CAP_ENCRYPTION for SMB 3.1.1
    51a6c2af9d20 ksmbd: validate payload size in ipc response
    2e5f8dc1dec8 ksmbd: don't send oplock break if rename fails
    7ef6a7f9b32f x86/retpoline: Add NOENDBR annotation to the SRSO dummy return thunk
    c19715ec258d nfsd: hold a lighter-weight client reference over CB_RECALL_ANY
    12059cf0487f ata: sata_mv: Fix PCI device ID table declaration compilation warning
    78942ac75499 cifs: Fix caching to try to do open O_WRONLY as rdwr on server
    9adcfd56703c scsi: sd: Unregister device if device_add_disk() failed in sd_probe()
    4b87c1bc2559 scsi: mylex: Fix sysfs buffer lengths
    7171d6aef1f1 ata: sata_sx4: fix pdc20621_get_from_dimm() on 64-bit
    7ff957cea8af ASoC: ops: Fix wraparound for mask in snd_soc_get_volsw
    4ff3d8ac6234 ASoC: rt711-sdw: fix locking sequence
    044c34fe3531 ASoC: rt711-sdca: fix locking sequence
    eb028d1ebd0b ASoC: rt5682-sdw: fix locking sequence
    392c47fea7aa drm/panfrost: fix power transition timeout warnings
    81f7c9da2bed drivers/perf: riscv: Disable PERF_SAMPLE_BRANCH_* while not supported
    d00c24ddec51 9p: Fix read/write debug statements to report server reply
    90a477dfda3b fs/pipe: Fix lockdep false-positive in watchqueue pipe_write()
    4af6d5b4d9f1 KVM: SVM: Add support for allowing zero SEV ASIDs
    2233bd583cb5 KVM: SVM: Use unsigned integers when dealing with ASIDs
    815c2a1c432b KVM: SVM: WARN, but continue, if misc_cg_set_capacity() fails
    2f7efda53a0a KVM: SVM: enhance info printk's in SEV init
    f089d4554a0b net: ravb: Always update error counters
    f9690dfa1814 net: ravb: Always process TX descriptor ring
    265a0fc55f13 net: ravb: Let IP-specific receive function to interrogate descriptors
    b3608fe28fab net: fec: Set mac_managed_pm during probe
    c1781222079c drivers: net: convert to boolean for the mac_managed_pm flag
    4eed9d0a4816 tcp: Fix bind() regression for v6-only wildcard and v4(-mapped-v6) non-wildcard addresses.
    77db987b47b7 r8169: prepare rtl_hw_aspm_clkreq_enable for usage in atomic context
    9109472e7102 r8169: use spinlock to protect access to registers Config2 and Config5
    a33b7cb18492 r8169: use spinlock to protect mac ocp register access
    095cfa2d9bde i40e: Enforce software interrupt during busy-poll exit
    2f6953617d1c i40e: Remove _t suffix from enum type names
    f3c2ceb84759 i40e: Store the irq number in i40e_q_vector
    810dd068ae3b drm/amd: Flush GFXOFF requests in prepare stage
    43df8e64dfb8 drm/amd: Add concept of running prepare_suspend() sequence for IP blocks
    2990d8eacd2c drm/amd: Evict resources during PM ops prepare() callback
    3e89846283f3 i40e: fix vf may be used uninitialized in this function warning
    fe74ea5b8b78 i40e: fix i40e_count_filters() to count only active/new filters
    d417e3c16dc5 octeontx2-af: Add array index check
    e7e7030f0ae2 octeontx2-pf: check negative error code in otx2_open()
    39efe5b6f611 octeontx2-af: Fix issue with loading coalesced KPU profiles
    940ff35ae8d1 udp: prevent local UDP tunnel packets from being GROed
    8c58d384050b udp: do not transition UDP GRO fraglist partial checksums to unnecessary
    d12245080cb2 udp: do not accept non-tunnel GSO skbs landing in a tunnel
    fd6692e9b5ed r8169: skip DASH fw status checks when DASH is disabled
    80247e0eca14 mlxbf_gige: stop interface during shutdown
    167d4b47a9bd ipv6: Fix infinite recursion in fib6_dump_done().
    2febb7eeb493 selftests: reuseaddr_conflict: add missing new line at the end of the output
    1db7fcb2b290 erspan: make sure erspan_base_hdr is present in skb->head
    1829b618ccc4 i40e: Fix VF MAC filter removal
    ed37bdaee64b x86/retpoline: Do the necessary fixup to the Zen3/4 srso return thunk for !SRSO
    23178ec5abbd x86/bugs: Fix the SRSO mitigation on Zen3/4
    2eeab8c47c3c gro: fix ownership transfer
    66cb6659008b selftests: net: gro fwd: update vxlan GRO test expectations
    10608161696c net: phy: micrel: Fix potential null pointer dereference
    77f5e52d7bee net: phy: micrel: lan8814: Fix when enabling/disabling 1-step timestamping
    e01835f3a1bd net: stmmac: fix rx queue priority assignment
    b7d1ce2cc719 net/sched: fix lockdep splat in qdisc_tree_reduce_backlog()
    55d3fe7b2b7b net/sched: act_skbmod: prevent kernel-infoleak
    a44770fed865 bpf, sockmap: Prevent lock inversion deadlock in map delete elem
    8a57544e9285 vboxsf: Avoid an spurious warning if load_nls_xxx() fails
    18aae2cb87e5 netfilter: validate user input for expected length
    9b5b7708ec2b netfilter: nf_tables: Fix potential data-race in __nft_flowtable_type_get()
    4e8447a9a3d3 netfilter: nf_tables: flush pending destroy work before exit_net release
    745cf6a84389 netfilter: nf_tables: reject new basechain after table flag update
    1c9e71ca615d Revert "x86/mm/ident_map: Use gbpages only where full GB page should be mapped."
    db388b8e12aa vsock/virtio: fix packet delivery to tap device
    fc77240f6316 net: usb: ax88179_178a: avoid the interface always configured as random address
    cbaac2e5488e net/rds: fix possible cp null dereference
    7c1250796b6c xen-netfront: Add missing skb_mark_for_recycle
    18e189442a58 Bluetooth: Fix TOCTOU in HCI debugfs implementation
    38e3eaa861bd Bluetooth: hci_event: set the conn encrypted before conn establishes
    3e773d04aef9 Bluetooth: add quirk for broken address properties
    a2812ff7ea40 Bluetooth: qca: fix device-address endianness
    298dc5dd38d2 arm64: dts: qcom: sc7180-trogdor: mark bluetooth address as broken
    9bf4acc80296 Revert "Bluetooth: hci_qca: Set BDA quirk bit if fwnode exists in DT"
    5d920886c382 x86/cpufeatures: Add CPUID_LNX_5 to track recently added Linux-defined word
    3d61f1704bdf r8169: fix issue caused by buggy BIOS on certain boards with RTL8168d
    923579201dec KVM: arm64: Fix host-programmed guest events in nVHE
    ad141b08d1ce perf/x86/amd/lbr: Use freeze based on availability
    8d029111b809 x86/cpufeatures: Add new word for scattered features
    58638e3b4879 dm integrity: fix out-of-range warning
    7d0567842b78 inet: inet_defrag: prevent sk release while still in use
    064267376533 Octeontx2-af: fix pause frame configuration in GMP mode
    2553bfaa19b4 net: lan743x: Add set RFE read fifo threshold for PCI1x1x chips
    852698c9fd5b cifs: Fix duplicate fscache cookie warnings
    98cdac206b11 bpf: Protect against int overflow for stack access size
    24444af5ddf7 mlxbf_gige: call request_irq() after NAPI initialized
    30fabe50a7ac tls: get psock ref after taking rxlock to avoid leak
    f52c8f1210da tls: adjust recv return with async crypto and failed copy to userspace
    efb4573feaa5 tls: recv: process_rx_list shouldn't use an offset with kvec
    0e111ce740fc net: hns3: mark unexcuted loopback test result as UNEXECUTED
    50b69054f455 net: hns3: fix kernel crash when devlink reload during pf initialization
    b8b533eeee5b net: hns3: fix index limit to support all queue stats
    ebabdae52f2a ACPICA: debugger: check status of acpi_evaluate_object() in acpi_db_walk_for_fields()
    beaf0e7996b7 net: wwan: t7xx: Split 64bit accesses to fix alignment issues
    91b243de910a tcp: properly terminate timers for kernel sockets
    16307e7bc112 s390/qeth: handle deferred cc1
    231b189fa1a1 ixgbe: avoid sleeping allocation in ixgbe_ipsec_vf_add_sa()
    99a75d750074 wifi: iwlwifi: mvm: rfi: fix potential response leaks
    57beec623ac5 mlxbf_gige: stop PHY during open() error paths
    b51ec7fc9f87 nfc: nci: Fix uninit-value in nci_dev_up and nci_ntf_packet
    0336995512cd dma-buf: Fix NULL pointer dereference in sanitycheck()
    8333aae9bba1 scripts/bpf_doc: Use silent mode when exec make cmd
    cc4860dd1375 Subject: [PATCH v6.1] powerpc: drop duplicate entry in Makefile for lib dir
    e083231c43f3 net: fix IPSTATS_MIB_OUTFORWDATAGRAMS increment after fragment check
    6ee7f29fed8c net: ipv4, ipv6: fix IPSTATS_MIB_OUTOCTETS increment duplicated
    a771780cdf4a net: fix IPSTATS_MIB_OUTPKGS increment in OutForwDatagrams.
    8a9f2d0717f0 riscv: Fix build with CONFIG_CC_OPTIMIZE_FOR_SIZE=y
    44fd0c7a5a79 tick/rcu: fix false positive "softirq work is pending" messages on RT
    786775632028 kernel/sched: Fix double free on invalid isolcpus/nohz_full params
    4675ec8d0b9a kernel/sched: Fix uninitialized read in nohz_full/isolcpus setup
    f46dc32a8617 bpf: btf: limit logging of ignored BTF mismatches
    4687b40201db Revert "Revert "tick/common: Align tick period with the HZ tick.""
    947f660bde07 Revert "tick/common: Align tick period with the HZ tick."
    dded404c66bb yaffs2: Fix miscalculation of devname buffer length
    30350f237490 mtd_blkdevs: add mtd_table_mutex lock back to blktrans_{open, release} to avoid race condition
    0ac32a83ca02 OF: DT-Overlay configfs interface (v8)
    0b07d2478b6b fat: Replace prandom_u32() with get_random_u32()
    927b66bfd641 aufs6: core
    2af5eb310b11 aufs6: standalone
    e6537c94f033 aufs6: mmap
    c51d7f19876f aufs6: base
    1785f762bbbb aufs6: kbuild
    8f625cf94585 qemux86: add configuration symbol to select values
    d81fac6e842a sched/isolation: really align nohz_full with rcu_nocbs
    07c526200cb3 clear_warn_once: add a clear_warn_once= boot parameter
    61e2c52ce198 clear_warn_once: bind a timer to written reset value
    de03f5a3e6c6 clear_warn_once: expand debugfs to include read support
    d3f9a25028d4 tools: Remove some options from CLANG_CROSS_FLAGS
    0fb98cd2429a libbpf: Fix build warning on ref_ctr_off
    e156ff56a19f perf python: Account for multiple words in CC
    f06b9c6ae59d perf: perf can not parser the backtrace of app in the 32bit system and 64bit kernel.
    1b099e82095d perf: x86-32: explicitly include <errno.h>
    5fec311e2fd2 perf: mips64: Convert __u64 to unsigned long long
    6cf30287aeaa perf: fix bench numa compilation
    bd8f67dcb8e4 perf: add SLANG_INC for slang.h
    0314b09bf6b9 perf: add sgidefs.h to for mips builds
    4a39cc37b957 perf: change --root to --prefix for python install
    3db4f4e91769 perf: add 'libperl not found' warning
    fa3d24bac29a perf: force include of <stdbool.h>
    deaadc523f8d fat: don't use obsolete random32 call in namei_vfat
    d3c72f5df9a3 FAT: Added FAT_NO_83NAME
    8f1eebeb519c FAT: Add CONFIG_VFAT_NO_CREATE_WITH_LONGNAMES option
    78b0423ccc14 FAT: Add CONFIG_VFAT_FS_NO_DUALNAMES option
    e998ad53fb68 yaffs2: replace bdevname call with sprintf
    1175db6bf4cb yaffs2: convert read_page -> readfolio
    beb275c683de yaffs: replace IS_ERR with IS_ERR_OR_NULL to check both ERR and NULL
    e807c9e420bd yaffs: fix -Wstringop-overread compile warning in yaffs_fix_null_name
    2fdd54282de3 yaffs2: v5.12+ build fixups (not runtime tested)
    869f41030ed8 yaffs: include blkdev.h
    e955b68f2b1f yaffs: fix misplaced variable declaration
    f089603aba1d yaffs2: v5.6 build fixups
    82da54859f0b yaffs2: fix memory leak when /proc/yaffs is read
    2c4cf6808649 yaffs: add strict check when call yaffs_internal_read_super
    e7dadb47ef11 yaffs: repair yaffs_get_mtd_device
    f2e29be130f7 yaffs: Fix build failure by handling inode i_version with proper atomic API
    8ea43ac7f3a3 yaffs2: fix memory leak in mount/umount
    56db60d0abd2 yaffs: Avoid setting any ACL releated xattr
    023baea095bc Yaffs:check oob size before auto selecting Yaffs1
    409d39918661 fs: yaffs2: replace CURRENT_TIME by other appropriate apis
    4bf42c774804 yaffs2: adjust to proper location of MS_RDONLY
    08696e21a84c yaffs2: import git revision b4ce1bb (jan, 2020)
    ca3d9f546a60 initramfs: allow an optional wrapper script around initramfs generation
    301742baace5 pnmtologo: use relocatable file name
    aba96ccce7d9 tools: use basename to identify file in gen-mach-types
    e195c32ca7c7 lib/build_OID_registry: fix reproducibility issues
    876e2f1f7726 vt/conmakehash: improve reproducibility
    28b7a366cfef iwlwifi: select MAC80211_LEDS conditionally
    69933d85f61e net/dccp: make it depend on CONFIG_BROKEN (CVE-2020-16119)
    5a308d8f142a arm64/perf: Fix wrong cast that may cause wrong truncation
    339523a797e9 defconfigs: drop obselete options
    3d751aeb9bcd arm64/perf: fix backtrace for AAPCS with FP enabled
    86fa47f362ae linux-yocto: Handle /bin/awk issues
    86f04668ef6e uvesafb: provide option to specify timeout for task completion
    0db5521a1b3c uvesafb: print error message when task timeout occurs
    710303c12e99 compiler.h: Undef before redefining __attribute_const__
    14a0ede85080 vmware: include jiffies.h
    e232e6ffe081 Resolve jiffies wrapping about arp
    c16abf2d705f nfs: Allow default io size to be configured.
    9e9e885f4a6c check console device file on fs when booting
    0ce0ce443d58 mount_root: clarify error messages for when no rootfs found
    32449db67de8 menuconfig,mconf-cfg: Allow specification of ncurses location
    c55f1054bdce modpost: mask trivial warnings
    30a45d4ee261 kbuild: exclude meta directory from distclean processing
    0890b10d8fb1 powerpc: serialize image targets
    6c0feb81c3ae arm: serialize build targets
    77fa1b70cdbd crtsavres: fixups for 5.4+
    cd107e4edd5f crtsavres: fixups for 5.4+
    8f763b35ae5b powerpc/ptrace: Disable array-bounds warning with gcc8
    fe6f93755196 powerpc: Disable attribute-alias warnings from gcc8
    9b7097364b87 powerpc: add crtsavres.o to archprepare for kbuild
    c106cd86a07b powerpc: kexec fix for powerpc64
    33b7738c61fc powerpc: Add unwind information for SPE registers of E500 core
    c04e26a9beda mips: vdso: fix 'jalr $t9' crash in vdso code
    4733368eab80 mips: Kconfig: add QEMUMIPS64 option
    ec2df6ae5ee5 4kc cache tlb hazard: tlbp cache coherency
    c8c511fae0f0 malta uhci quirks: make allowance for slow 4k(e)c
    b2bf1b6e971a arm64: defconfig: cleanup config options
    a40a34b02336 vexpress: Pass LOADADDR to Makefile
    7c51524611bb arm: ARM EABI socketcall
    1f6e77027c24 ARM: LPAE: Invalidate the TLB for module addresses during translation fault

Signed-off-by: Bruce Ashfield <bruce.ashfield@gmail.com>
---
 .../linux/linux-yocto-rt_6.1.bb               |  6 ++--
 .../linux/linux-yocto-tiny_6.1.bb             |  6 ++--
 meta/recipes-kernel/linux/linux-yocto_6.1.bb  | 28 +++++++++----------
 3 files changed, 20 insertions(+), 20 deletions(-)

diff --git a/meta/recipes-kernel/linux/linux-yocto-rt_6.1.bb b/meta/recipes-kernel/linux/linux-yocto-rt_6.1.bb
index d0173e3ee7..aac0e26210 100644
--- a/meta/recipes-kernel/linux/linux-yocto-rt_6.1.bb
+++ b/meta/recipes-kernel/linux/linux-yocto-rt_6.1.bb
@@ -14,13 +14,13 @@ python () {
         raise bb.parse.SkipRecipe("Set PREFERRED_PROVIDER_virtual/kernel to linux-yocto-rt to enable it")
 }
 
-SRCREV_machine ?= "4df82ffbb2b0f0b0efb545d1f67e61c987d051c1"
-SRCREV_meta ?= "8b555bd39017d9e6b19a0e2c98e563c5ebccef14"
+SRCREV_machine ?= "7a63ce6bf87492f09a8c685bf99e9a09af97c71b"
+SRCREV_meta ?= "3e8602affb44aa12dc7ea436c5ec8514fccb5870"
 
 SRC_URI = "git://git.yoctoproject.org/linux-yocto.git;branch=${KBRANCH};name=machine;protocol=https \
            git://git.yoctoproject.org/yocto-kernel-cache;type=kmeta;name=meta;branch=yocto-6.1;destsuffix=${KMETA};protocol=https"
 
-LINUX_VERSION ?= "6.1.84"
+LINUX_VERSION ?= "6.1.86"
 
 LIC_FILES_CHKSUM = "file://COPYING;md5=6bc538ed5bd9a7fc9398086aedcd7e46"
 
diff --git a/meta/recipes-kernel/linux/linux-yocto-tiny_6.1.bb b/meta/recipes-kernel/linux/linux-yocto-tiny_6.1.bb
index 1d438cb43c..486534f3cf 100644
--- a/meta/recipes-kernel/linux/linux-yocto-tiny_6.1.bb
+++ b/meta/recipes-kernel/linux/linux-yocto-tiny_6.1.bb
@@ -8,7 +8,7 @@ require recipes-kernel/linux/linux-yocto.inc
 # CVE exclusions
 include recipes-kernel/linux/cve-exclusion_6.1.inc
 
-LINUX_VERSION ?= "6.1.84"
+LINUX_VERSION ?= "6.1.86"
 LIC_FILES_CHKSUM = "file://COPYING;md5=6bc538ed5bd9a7fc9398086aedcd7e46"
 
 DEPENDS += "${@bb.utils.contains('ARCH', 'x86', 'elfutils-native', '', d)}"
@@ -17,8 +17,8 @@ DEPENDS += "openssl-native util-linux-native"
 KMETA = "kernel-meta"
 KCONF_BSP_AUDIT_LEVEL = "2"
 
-SRCREV_machine ?= "79fae610a03169f636ecf8a2c4a520af0c01ea58"
-SRCREV_meta ?= "8b555bd39017d9e6b19a0e2c98e563c5ebccef14"
+SRCREV_machine ?= "3726df7e9d76ef8836dcf3a34b8cae6ba0aaa594"
+SRCREV_meta ?= "3e8602affb44aa12dc7ea436c5ec8514fccb5870"
 
 PV = "${LINUX_VERSION}+git"
 
diff --git a/meta/recipes-kernel/linux/linux-yocto_6.1.bb b/meta/recipes-kernel/linux/linux-yocto_6.1.bb
index c4e8750e6b..0b417c471f 100644
--- a/meta/recipes-kernel/linux/linux-yocto_6.1.bb
+++ b/meta/recipes-kernel/linux/linux-yocto_6.1.bb
@@ -18,25 +18,25 @@ KBRANCH:qemux86-64 ?= "v6.1/standard/base"
 KBRANCH:qemuloongarch64  ?= "v6.1/standard/base"
 KBRANCH:qemumips64 ?= "v6.1/standard/mti-malta64"
 
-SRCREV_machine:qemuarm ?= "6c89adaf651c4599869544f1ccc532641e5e6e9c"
-SRCREV_machine:qemuarm64 ?= "79fae610a03169f636ecf8a2c4a520af0c01ea58"
-SRCREV_machine:qemuloongarch64 ?= "79fae610a03169f636ecf8a2c4a520af0c01ea58"
-SRCREV_machine:qemumips ?= "cef1886035a8438205634d51fdfc3c1481b668e8"
-SRCREV_machine:qemuppc ?= "42585bdd38e874d2c4b08364a160e5dad5cd683e"
-SRCREV_machine:qemuriscv64 ?= "79fae610a03169f636ecf8a2c4a520af0c01ea58"
-SRCREV_machine:qemuriscv32 ?= "79fae610a03169f636ecf8a2c4a520af0c01ea58"
-SRCREV_machine:qemux86 ?= "79fae610a03169f636ecf8a2c4a520af0c01ea58"
-SRCREV_machine:qemux86-64 ?= "79fae610a03169f636ecf8a2c4a520af0c01ea58"
-SRCREV_machine:qemumips64 ?= "a6c079ca05576d39ff871aad90050021aecaf3c7"
-SRCREV_machine ?= "79fae610a03169f636ecf8a2c4a520af0c01ea58"
-SRCREV_meta ?= "8b555bd39017d9e6b19a0e2c98e563c5ebccef14"
+SRCREV_machine:qemuarm ?= "a817e2cafd9a6f3bc48d9e88cc92330d748e0993"
+SRCREV_machine:qemuarm64 ?= "3726df7e9d76ef8836dcf3a34b8cae6ba0aaa594"
+SRCREV_machine:qemuloongarch64 ?= "3726df7e9d76ef8836dcf3a34b8cae6ba0aaa594"
+SRCREV_machine:qemumips ?= "70d990757526c642411d8a238be6f7a331dbff2c"
+SRCREV_machine:qemuppc ?= "ec55f0fb16cfa7335361c8532ccc0883d37d05f5"
+SRCREV_machine:qemuriscv64 ?= "3726df7e9d76ef8836dcf3a34b8cae6ba0aaa594"
+SRCREV_machine:qemuriscv32 ?= "3726df7e9d76ef8836dcf3a34b8cae6ba0aaa594"
+SRCREV_machine:qemux86 ?= "3726df7e9d76ef8836dcf3a34b8cae6ba0aaa594"
+SRCREV_machine:qemux86-64 ?= "3726df7e9d76ef8836dcf3a34b8cae6ba0aaa594"
+SRCREV_machine:qemumips64 ?= "219c6fc52eede3be9e7e3ae5b64bdb16f57b5dca"
+SRCREV_machine ?= "3726df7e9d76ef8836dcf3a34b8cae6ba0aaa594"
+SRCREV_meta ?= "3e8602affb44aa12dc7ea436c5ec8514fccb5870"
 
 # set your preferred provider of linux-yocto to 'linux-yocto-upstream', and you'll
 # get the <version>/base branch, which is pure upstream -stable, and the same
 # meta SRCREV as the linux-yocto-standard builds. Select your version using the
 # normal PREFERRED_VERSION settings.
 BBCLASSEXTEND = "devupstream:target"
-SRCREV_machine:class-devupstream ?= "347385861c50adc8d4801d4b899eded38a2f04cd"
+SRCREV_machine:class-devupstream ?= "cd5d98c0556cd790f78a3ba26afc9d2f896163e4"
 PN:class-devupstream = "linux-yocto-upstream"
 KBRANCH:class-devupstream = "v6.1/base"
 
@@ -45,7 +45,7 @@ SRC_URI = "git://git.yoctoproject.org/linux-yocto.git;name=machine;branch=${KBRA
 SRC_URI += "file://0001-perf-cpumap-Make-counter-as-unsigned-ints.patch"
 
 LIC_FILES_CHKSUM = "file://COPYING;md5=6bc538ed5bd9a7fc9398086aedcd7e46"
-LINUX_VERSION ?= "6.1.84"
+LINUX_VERSION ?= "6.1.86"
 
 PV = "${LINUX_VERSION}+git"
 
-- 
2.39.2


