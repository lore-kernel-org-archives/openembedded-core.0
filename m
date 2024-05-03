Return-Path: <bruce.ashfield@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id C3F04C25B77
	for <webhook@archiver.kernel.org>; Fri,  3 May 2024 02:40:54 +0000 (UTC)
Received: from mail-qk1-f176.google.com (mail-qk1-f176.google.com [209.85.222.176])
 by mx.groups.io with SMTP id smtpd.web11.4000.1714704052024359895
 for <openembedded-core@lists.openembedded.org>;
 Thu, 02 May 2024 19:40:52 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20230601 header.b=mLT0hEBy;
 spf=pass (domain: gmail.com, ip: 209.85.222.176, mailfrom: bruce.ashfield@gmail.com)
Received: by mail-qk1-f176.google.com with SMTP id af79cd13be357-78edc3ad5fdso204546485a.0
        for <openembedded-core@lists.openembedded.org>; Thu, 02 May 2024 19:40:51 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1714704051; x=1715308851; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=DwpVvTjDuSKGZfaSXWUlqlJ/ImK0pdV04iXw/Rm0mOw=;
        b=mLT0hEByE7gJ+QMTLkx4aabf28X4k54bpRW6Zf73zsszgmq42KucHfRb5q3VgPYdx1
         Z4gxCG8oensDix3/0j/TXJ/TH9JZK6toT3evZkwwjrO3toFk8KFwNQPjcP9C9pfRZ5F2
         1FHzxQVyulEe69rkcO333K8Y7D+o3WsafKHFBLNvGicR2smytOvAJCO1ocCZm55iqwy4
         HPLjfFkkkoc7J2HfRj0sj5lNCCaB4gUPAnKy1fSOwF1L350ZaH57Gt0ENdRoAQd0Fx9Y
         +RaIvSY+ako1mybwLkDi3gQbsLMmvvBE/o80mPxQqAPo4JKZb/G5cBGo9T2dqL5fAjRR
         M1uQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1714704051; x=1715308851;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=DwpVvTjDuSKGZfaSXWUlqlJ/ImK0pdV04iXw/Rm0mOw=;
        b=PU7T8NARP8s+/p7y6alAOW8nON4By4ue1dQKny9kEzhuXB9zyVG5JM8GVxzot4pNjW
         tD4ZxLtsGP6qVGokXmxDTabxxKearXH73T+H/t1v5u9pb0LvfpdKlbD/n3Umw+Iv0fzK
         CzaiZbZUYQVG+qku+4ni/lmcOEsaRiGtTG4HPARxUf8H6tX9CqbWDVpw9qax95Il0c1+
         wIFqn+HUjByTgy+2ZRr3x3Fw69leQNZHDYH3bfnxmOY4+SzJO3+i6C6E+QcncoDjKsrA
         O7Di3IYB1/R6ozq9jhdUbbN5TboBMT7baGDsWixn5mcR4eWh8NY1j7ZwiWZD6P4ITW+r
         YfNQ==
X-Gm-Message-State: AOJu0YyQ5I52j3jpY2+svRSixBUAa0qLa776TPQT9/cpRj9+pAqOQ9Ib
	cgFor+XDiXSZ18TOH3g9X8QRE8v3dpxr10FzHlod0sabMgNPXhLR
X-Google-Smtp-Source: AGHT+IEFPHrKWLllfcIqJQsZt7TDa2zKH9oIRI0pFOf/BRPtBLbLDQ1aFBwisTuREYUpOu3E64v9wQ==
X-Received: by 2002:a05:620a:24c8:b0:790:a960:28f4 with SMTP id m8-20020a05620a24c800b00790a96028f4mr8189679qkn.25.1714704050637;
        Thu, 02 May 2024 19:40:50 -0700 (PDT)
Received: from bruce-XPS-8940.localdomain (pool-174-112-62-108.cpe.net.cable.rogers.com. [174.112.62.108])
        by smtp.gmail.com with ESMTPSA id bm34-20020a05620a19a200b0078ec3aa9cc7sm856163qkb.25.2024.05.02.19.40.49
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 02 May 2024 19:40:49 -0700 (PDT)
From: bruce.ashfield@gmail.com
To: richard.purdie@linuxfoundation.org
Cc: openembedded-core@lists.openembedded.org
Subject: [PATCH 06/12] linux-yocto/6.6: update to v6.6.27
Date: Thu,  2 May 2024 22:40:34 -0400
Message-Id: <10b6e46281bacfb106a1a387b2815db74548bdca.1714703667.git.bruce.ashfield@gmail.com>
X-Mailer: git-send-email 2.39.2
In-Reply-To: <cover.1714703667.git.bruce.ashfield@gmail.com>
References: <cover.1714703667.git.bruce.ashfield@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Fri, 03 May 2024 02:40:54 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/198937

From: Bruce Ashfield <bruce.ashfield@gmail.com>

Updating linux-yocto/6.6 to the latest korg -stable release that comprises
the following commits:

    5e828009c8b3 Linux 6.6.27
    5c1dc516f52a drm: Check polling initialized before enabling in drm_helper_probe_single_connector_modes
    14ac934db851 Revert "drm/amd/amdgpu: Fix potential ioremap() memory leaks in amdgpu_device_init()"
    91fb03cea0d5 VMCI: Fix possible memcpy() run-time warning in vmci_datagram_invoke_guest_handler()
    b456cb98cbad net: mpls: error out if inner headers are not set
    83890a450378 Bluetooth: btintel: Fixe build regression
    ce64c26ba842 platform/x86: intel-vbtn: Update tablet mode switch at end of probe
    300a2b9c2b28 randomize_kstack: Improve entropy diffusion
    41671f0c0182 media: mediatek: vcodec: adding lock to protect encoder context list
    0a2dc707aa42 media: mediatek: vcodec: adding lock to protect decoder context list
    ec25fc3c2c1e media: mediatek: vcodec: Fix oops when HEVC init fails
    a445eb1f630f selftests: mptcp: display simult in extra_msg
    9dff96b8b3a4 gcc-plugins/stackleak: Avoid .head.text section
    7365444cbd8f ALSA: hda/realtek: Add quirks for some Clevo laptops
    3d4b909704bf fbmon: prevent division by zero in fb_videomode_from_videomode()
    5e11bacff08b drivers/nvme: Add quirks for device 126f:2262
    19e525ebbb88 modpost: fix null pointer dereference
    21162ad2de74 io_uring: clear opcode specific data for an early failure
    89f0cf6ac620 fbdev: viafb: fix typo in hw_bitblt_1 and hw_bitblt_2
    4cd44fd34545 x86/xen: attempt to inflate the memory balloon on PVH
    9afc9fde538b ASoC: soc-core.c: Skip dummy codec when adding platforms
    d009236a37ae thermal/of: Assume polling-delay(-passive) 0 when absent
    6712b758698b ASoC: amd: yc: Fix non-functional mic on ASUS M7600RE
    fa5c8f2c88a9 usb: sl811-hcd: only defined function checkdone if QUIRK2 is defined
    55b724b8f7ee usb: typec: tcpci: add generic tcpci fallback compatible
    d8518f05ee82 thunderbolt: Keep the domain powered when USB4 port is in redrive mode
    266f403ec475 usb: typec: ucsi: Limit read size on v1.2
    0d52e1853bc1 usb: gadget: uvc: mark incomplete frames with UVC_STREAM_ERR
    4b1f991bad56 kernfs: RCU protect kernfs_nodes and avoid kernfs_idr_lock in kernfs_find_and_get_node_by_id()
    ac191bcb0fe0 bus: mhi: host: Add MHI_PM_SYS_ERR_FAIL state
    bb72eb818d07 tools: iio: replace seekdir() in iio_generic_buffer
    fb8579acacd0 ring-buffer: use READ_ONCE() to read cpu_buffer->commit_page in concurrent environment
    80f175d0f352 Input: xpad - add support for Snakebyte GAMEPADs
    fd067c8b3f86 ktest: force $buildonly = 1 for 'make_warnings_file' test type
    60668872cca8 ALSA: hda/realtek: Add quirk for Lenovo Yoga 9 14IMH9
    08aba129f542 perf/x86/amd/lbr: Discard erroneous branch entries
    a9852cf5d7a1 platform/x86: touchscreen_dmi: Add an extra entry for a variant of the Chuwi Vi8 tablet
    ed2f8b713a45 Input: allocate keycode for Display refresh rate toggle
    dddc9f40ac8e Input: imagis - use FIELD_GET where applicable
    2e90774fbbe0 RDMA/cm: add timeout to cm_destroy_id wait
    5f7fd6aa4c48 block: prevent division by zero in blk_rq_stat_sum()
    0662deae8bb8 drivers/perf: hisi: Enable HiSilicon Erratum 162700402 quirk for HIP09
    44723bd493cd input/touchscreen: imagis: Correct the maximum touch area value
    d0e2f7ae04bb libperf evlist: Avoid out-of-bounds access
    a822f30afada Revert "ACPI: PM: Block ASUS B1400CEAE from suspend to idle by default"
    846611299931 PCI: Disable D3cold on Asus B1400 PCI-NVMe bridge
    73bdf8d41cb5 SUNRPC: increase size of rpc_wait_queue.qlen from unsigned short to unsigned int
    3d1b47e3a935 drm: Check output polling initialized before disabling
    09d4600b9e99 drm/amd/amdgpu: Fix potential ioremap() memory leaks in amdgpu_device_init()
    0f09e89e667e HID: input: avoid polling stylus battery on Chromebook Pompom
    30930f0f4674 i2c: designware: Fix RX FIFO depth define on Wangxun 10Gb NIC
    cd0a1835bf84 accel/habanalabs: increase HL_MAX_STR to 64 bytes to avoid warnings
    953fee8160f1 drm/amd/display: Fix nanosec stat overflow
    a5e76867714b ext4: forbid commit inconsistent quota data when errors=remount-ro
    58546b2aa263 ext4: add a hint for block bitmap corrupt state in mb_groups
    bd6b1c418bd6 ASoC: Intel: avs: Populate board selection with new I2S entries
    f4a345e0aaf4 ALSA: firewire-lib: handle quirk to calculate payload quadlets as data block counter
    cb9420142e50 media: sta2x11: fix irq handler cast
    214a6c4a28c1 Julia Lawall reported this null pointer dereference, this should fix it.
    24e5e1eff8ba rcu-tasks: Repair RCU Tasks Trace quiescence check
    4d58c9fb45c7 rcu/nocb: Fix WARN_ON_ONCE() in the rcu_nocb_bypass_lock()
    f4b6caeb3cfe ASoC: Intel: common: DMI remap for rebranded Intel NUC M15 (LAPRC710) laptops
    d43a90294afe isofs: handle CDs with bad root inode but good Joliet root directory
    07a2aa674fca scsi: lpfc: Fix possible memory leak in lpfc_rcv_padisc()
    89e8524135a3 sysv: don't call sb_bread() with pointers_lock held
    56f5e36dace6 pinctrl: renesas: checker: Limit cfg reg enum checks to provided IDs
    852ad6a4f55c drm/ttm: return ENOSPC from ttm_bo_mem_space v3
    02a3b0d58217 ASoC: SOF: amd: Optimize quirk for Valve Galileo
    f19ad40352a8 drm: panel-orientation-quirks: Add quirk for GPD Win Mini
    eafaec40d00f Input: synaptics-rmi4 - fail probing if memory allocation for "phys" fails
    d6b2fe2db1d0 drm/vc4: don't check if plane->state->fb == state->fb
    8677a14a8821 Bluetooth: Add new quirk for broken read key length on ATS2851
    6d0950cf4313 Bluetooth: btmtk: Add MODULE_FIRMWARE() for MT7922
    ffdca0a62aba Bluetooth: btintel: Fix null ptr deref in btintel_read_version
    a2e6bffc0388 net/smc: reduce rtnl pressure in smc_pnet_create_pnetids_list()
    c926393dc344 ice: use relative VSI index for VFs instead of PF VSI number
    c1363ed8867b btrfs: send: handle path ref underflow in header iterate_inode_ref()
    30237d6764fe btrfs: export: handle invalid inode or root reference in btrfs_get_parent()
    0d23b34c68c4 btrfs: handle chunk tree lookup error in btrfs_relocate_sys_chunks()
    5d7a8585fbb3 wifi: cfg80211: check A-MSDU format more carefully
    95eec168c288 wifi: iwlwifi: Add missing MODULE_FIRMWARE() for *.pnvm
    2618ab102c80 overflow: Allow non-type arg to type_max() and type_min()
    3ba4aceb68f0 cpufreq: Don't unregister cpufreq cooling on CPU hotplug
    138fdeac75fb wifi: ath11k: decrease MHI channel buffer length to 8KB
    4031b72ca747 dma-direct: Leak pages on dma_set_decrypted() failure
    9470114dfaf4 net: pcs: xpcs: Return EINVAL in the internal methods
    cf21eb6a9fc2 tools/power x86_energy_perf_policy: Fix file leak in get_pkg_num()
    ec7256887d07 pstore/zone: Add a null pointer check to the psz_kmsg_read
    a217b6135dab ACPI: x86: Move acpi_quirk_skip_serdev_enumeration() out of CONFIG_X86_ANDROID_TABLETS
    1feb6fcfbac3 wifi: mt76: mt7996: add locking for accessing mapped registers
    1152c2cd38e4 wifi: mt76: mt7996: disable AMSDU for non-data frames
    891fd07da87b wifi: mt76: mt7915: add locking for accessing mapped registers
    c39e75fae05c wifi: brcmfmac: Add DMI nvram filename quirk for ACEPC W5 Pro
    5dc5f8c705c3 firmware: tegra: bpmp: Return directly after a failed kzalloc() in get_filename()
    1b2b26595bb0 net: skbuff: add overflow debug check to pull/push helpers
    b8dccb25c5dc ionic: set adminq irq affinity
    9d3f959b4266 pmdomain: imx8mp-blk-ctrl: imx8mp_blk: Add fdcc clock to hdmimix domain
    ce666cecc09c pmdomain: ti: Add a null pointer check to the omap_prm_domain_init
    a7b862abe484 net: add netdev_lockdep_set_classes() to virtual drivers
    fc1d1ca46d01 arm64: dts: rockchip: fix rk3399 hdmi ports node
    5c014f039544 arm64: dts: rockchip: fix rk3328 hdmi ports node
    bb8ca341f889 ARM: dts: rockchip: fix rk322x hdmi ports node
    c795042eea78 ARM: dts: rockchip: fix rk3288 hdmi ports node
    3f0a74728170 cpuidle: Avoid potential overflow in integer multiplication
    750d44684a95 panic: Flush kernel log buffer at the end
    a2e14cc2da40 printk: For @suppress_panic_printk check for other CPU in panic
    dbd3c05d71e1 wifi: iwlwifi: pcie: Add the PCI device id for new hardware
    dae70a575656 VMCI: Fix memcpy() run-time warning in dg_dispatch_as_host()
    0a6def05767c wifi: rtw89: pci: enlarge RX DMA buffer to consider size of RX descriptor
    7a71f61ebf95 net: phy: phy_device: Prevent nullptr exceptions on ISR
    2485beea14b3 net: stmmac: dwmac-starfive: Add support for JH7100 SoC
    3dac6ab4d977 bnx2x: Fix firmware version string character counts
    b34d64e9aa55 wifi: rtw89: fix null pointer access when abort scan
    15df1981f0ed wifi: ath9k: fix LNA selection in ath_ant_try_scan()
    315eb3c2df7e amdkfd: use calloc instead of kzalloc to avoid integer overflow
    0ccfb8e07e79 Linux 6.6.26
    6d9ef0c36980 x86: set SPECTRE_BHI_ON as default
    cb238e95ee72 KVM: x86: Add BHI_NO
    1c42ff893a8f x86/bhi: Mitigate KVM by default
    d414b401f953 x86/bhi: Add BHI mitigation knob
    118794d0a572 x86/bhi: Enumerate Branch History Injection (BHI) bug
    c6e3d590d051 x86/bhi: Define SPEC_CTRL_BHI_DIS_S
    eb36b0dce213 x86/bhi: Add support for clearing branch history at syscall entry
    eb0f175b3428 x86/syscall: Don't force use of indirect calls for system calls
    108feca9e47d x86/bugs: Change commas to semicolons in 'spectre_v2' sysfs file
    046545314c79 x86/boot: Move mem_encrypt= parsing to the decompressor
    ccde70aa54c4 x86/efistub: Remap kernel text read-only before dropping NX attribute
    56408ed92903 x86/sev: Move early startup code into .head.text section
    af90ced75242 x86/sme: Move early SME kernel encryption handling into .head.text
    dc4cbf9e2df4 efi/libstub: Add generic support for parsing mem_encrypt=
    5447cb97e9b2 x86/head/64: Move the __head definition to <asm/init.h>
    876941f533e7 bpf: support deferring bpf_link dealloc to after RCU grace period
    771690b7c31d bpf: put uprobe link's path and task in release callback
    43eca11b7c73 mptcp: don't account accept() of non-MPC client as fallback to TCP
    12f353fac65d mptcp: don't overwrite sock_ops in mptcp_is_tcpsk()
    5b5ff82491a1 selftests: mptcp: connect: fix shellcheck warnings
    e4a449368a2c of: module: prevent NULL pointer dereference in vsnprintf()
    37b81aed6468 Revert "x86/mpparse: Register APIC address only once"
    a7ff84a6fe5a drm/i915/gt: Enable only one CCS for compute workload
    726ff623869d drm/i915/gt: Do not generate the command streamer for all the CCS
    c1f7ce2a11a9 drm/i915/gt: Disable HW load balancing for CCS
    2cfff2173213 smb: client: fix potential UAF in cifs_signal_cifsd_for_reconnect()
    aa582b33f944 smb: client: fix potential UAF in smb2_is_network_name_deleted()
    0a15ba88a32f smb: client: fix potential UAF in is_valid_oplock_break()
    f92739fdd452 smb: client: fix potential UAF in smb2_is_valid_lease_break()
    21fed37d2bdc smb: client: fix potential UAF in smb2_is_valid_oplock_break()
    10e17ca4000e smb: client: fix potential UAF in cifs_dump_full_key()
    c3cf8b74c579 smb: client: fix potential UAF in cifs_stats_proc_show()
    cf03020c56d3 smb: client: fix potential UAF in cifs_stats_proc_write()
    a65f2b56334b smb: client: fix potential UAF in cifs_debug_files_proc_show()
    6f17163b9339 smb3: retrying on failed server close
    ba55f8a995f6 smb: client: serialise cifs_construct_tcon() with cifs_mount_mutex
    9b2ee27e8de5 smb: client: handle DFS tcons in cifs_construct_tcon()
    00effef72c98 riscv: process: Fix kernel gp leakage
    7a82963245eb riscv: Fix spurious errors from __get/put_kernel_nofault
    3dcb2223b973 s390/entry: align system call table on 8 bytes
    782baf52e7cb selftests/mm: include strings.h for ffsl
    43fad1d0284d mm/secretmem: fix GUP-fast succeeding on secretmem folios
    8a44119ca445 arm64/ptrace: Use saved floating point state type to determine SVE layout
    92f32f108693 perf/x86/intel/ds: Don't clear ->pebs_data_cfg for the last PEBS event
    453b5f2dec27 x86/coco: Require seeding RNG with RDRAND on CoCo systems
    5a02df3e9247 x86/mce: Make sure to grab mce_sysfs_mutex in set_bank()
    51b7841f3fe8 x86/mm/pat: fix VM_PAT handling in COW mappings
    801c8b8ec5bf of: dynamic: Synchronize of_changeset_destroy() with the devlink removals
    dfa655727688 driver core: Introduce device_link_wait_removal()
    65938e81df21 io_uring/kbuf: hold io_buffer_list reference over mmap
    6b9d49bcd97b io_uring: use private workqueue for exit work
    b392402d29ab io_uring/kbuf: protect io_buffer_list teardown with a reference
    4c0a5da0e70e io_uring/kbuf: get rid of bl->is_ready
    d6e03f6d8bcc io_uring/kbuf: get rid of lower BGID lists
    781477d729be ALSA: hda/realtek: Update Panasonic CF-SZ6 quirk to support headset with microphone
    04d78aa05ae4 ALSA: hda/realtek - Fix inactive headset mic jack
    67c477f3201c ksmbd: do not set SMB2_GLOBAL_CAP_ENCRYPTION for SMB 3.1.1
    a637fabac554 ksmbd: validate payload size in ipc response
    a06562fd4ce2 ksmbd: don't send oplock break if rename fails
    2f0262ac3a8c gpio: cdev: fix missed label sanitizing in debounce_setup()
    d9f0804ab0b8 gpio: cdev: check for NULL labels when sanitizing them for irqs
    63bd08629aee x86/retpoline: Add NOENDBR annotation to the SRSO dummy return thunk
    ac522af8db5c ice: fix typo in assignment
    9d60e8ec996f nfsd: hold a lighter-weight client reference over CB_RECALL_ANY
    6e307a6d9eb4 riscv: Disable preemption when using patch_map()
    1ba1291172f9 SUNRPC: Fix a slow server-side memory leak with RPC-over-TCP
    e12149dd9ba2 ASoC: SOF: amd: fix for false dsp interrupts
    cbd080c30834 ata: sata_mv: Fix PCI device ID table declaration compilation warning
    4b31a226097c spi: mchp-pci1xxx: Fix a possible null pointer dereference in pci1xxx_spi_probe
    0fdada1ef5b1 cifs: Fix caching to try to do open O_WRONLY as rdwr on server
    0f28afed9f9d Revert "ALSA: emu10k1: fix synthesizer sample playback position and caching"
    f3e692c8c24a scsi: sd: Unregister device if device_add_disk() failed in sd_probe()
    56de23eac65f scsi: mylex: Fix sysfs buffer lengths
    4cad40d93665 ata: sata_sx4: fix pdc20621_get_from_dimm() on 64-bit
    fce7a547b9c8 regmap: maple: Fix uninitialized symbol 'ret' warnings
    04b52388c46d ASoC: amd: acp: fix for acp_init function error handling
    3d3e148c7576 spi: s3c64xx: Use DMA mode from fifo size
    5448a99c8096 spi: s3c64xx: determine the fifo depth only once
    f8a6edd44903 spi: s3c64xx: allow full FIFO masks
    6f9d907bee2a spi: s3c64xx: define a magic value
    3fa0085f1052 spi: s3c64xx: remove else after return
    56aeaed8c822 spi: s3c64xx: explicitly include <linux/bits.h>
    0df4616ef533 spi: s3c64xx: sort headers alphabetically
    bb3ee5fddac1 spi: s3c64xx: Extract FIFO depth calculation to a dedicated macro
    80ca762f1bdd ASoC: ops: Fix wraparound for mask in snd_soc_get_volsw
    229c761b198e ASoC: rt722-sdca-sdw: fix locking sequence
    1064108334bb ASoC: rt712-sdca-sdw: fix locking sequence
    3bfbc530a658 ASoC: rt711-sdw: fix locking sequence
    53c8045621c1 ASoC: rt711-sdca: fix locking sequence
    8eea5ae23bab ASoC: rt5682-sdw: fix locking sequence
    cc4d9f0597ee drm/prime: Unbreak virtgpu dma-buf export
    692a51bebf45 nouveau/uvmm: fix addr/range calcs for remap operations
    9e3941c90e46 drm/panfrost: fix power transition timeout warnings
    4930d7a414c1 ALSA: hda: cs35l56: Add ACPI device match tables
    3af6c5ac72dc regmap: maple: Fix cache corruption in regcache_maple_drop()
    4e73748d5954 RISC-V: Update AT_VECTOR_SIZE_ARCH for new AT_MINSIGSTKSZ
    b2ddeb7fb322 drivers/perf: riscv: Disable PERF_SAMPLE_BRANCH_* while not supported
    3e1a29fb81c2 ASoC: wm_adsp: Fix missing mutex_lock in wm_adsp_write_ctl()
    40613ea1d5ea 9p: Fix read/write debug statements to report server reply
    f4a192cd7b25 fs/pipe: Fix lockdep false-positive in watchqueue pipe_write()
    ab7a6fe9c1b5 KVM: SVM: Add support for allowing zero SEV ASIDs
    79b79ea2b3bf KVM: SVM: Use unsigned integers when dealing with ASIDs
    0a583b7ebb6f net: ravb: Always update error counters
    1dd9204143d1 net: ravb: Always process TX descriptor ring
    a9fb2f7463cd net: ravb: Let IP-specific receive function to interrogate descriptors
    199a1314ef78 e1000e: move force SMBUS from enable ulp function to avoid PHY loss issue
    eb96a5c02553 e1000e: Minor flow correction in e1000_shutdown function
    1d16cd91cd31 e1000e: Workaround for sporadic MDI error on Meteor Lake systems
    d5752c7bb1b2 intel: legacy: field get conversion
    e383353b7992 intel: add bit macro includes where needed
    e77220eec3ee i40e: Remove circular header dependencies and fix headers
    59a9de1a9430 i40e: Split i40e_osdep.h
    2ee5326d32c5 i40e: Move memory allocation structures to i40e_alloc.h
    0ed115020ac4 i40e: Simplify memory allocation functions
    0c52a50aec50 virtchnl: Add header dependencies
    45116a7c2138 i40e: Refactor I40E_MDIO_CLAUSE* macros
    f629cf15dcde i40e: Remove back pointer from i40e_hw structure
    66ca011a5df5 i40e: Enforce software interrupt during busy-poll exit
    e6d25dbd9243 i40e: Remove _t suffix from enum type names
    3da10e91ecd2 drm/amd: Flush GFXOFF requests in prepare stage
    da67a1139f05 drm/amd: Add concept of running prepare_suspend() sequence for IP blocks
    8b5f720486ca drm/amd: Evict resources during PM ops prepare() callback
    4356a2c3f296 drm/amd/display: Prevent crash when disable stream
    8dc9a27589a9 drm/amd/display: Fix DPSTREAM CLK on and off sequence
    113b12e16488 usb: typec: ucsi: Fix race between typec_switch and role_switch
    0dcf573f9977 i40e: fix vf may be used uninitialized in this function warning
    89e29416cf6b i40e: fix i40e_count_filters() to count only active/new filters
    76c39cf84cd2 octeontx2-af: Add array index check
    43b69da260af octeontx2-pf: check negative error code in otx2_open()
    b08b0c7a66c9 octeontx2-af: Fix issue with loading coalesced KPU profiles
    03b6f3692bae udp: prevent local UDP tunnel packets from being GROed
    2a1b61d0cb9b udp: do not transition UDP GRO fraglist partial checksums to unnecessary
    3001e7aa43d6 udp: do not accept non-tunnel GSO skbs landing in a tunnel
    a5eae74f39c0 r8169: skip DASH fw status checks when DASH is disabled
    36a1cb0371aa mlxbf_gige: stop interface during shutdown
    f2dd75e57285 ipv6: Fix infinite recursion in fib6_dump_done().
    74204bf9050f ax25: fix use-after-free bugs caused by ax25_ds_del_timer
    8b88752d2b12 tcp: Fix bind() regression for v6-only wildcard and v4(-mapped-v6) non-wildcard addresses.
    690e877ca2b6 selftests: reuseaddr_conflict: add missing new line at the end of the output
    4e3fdeecec57 erspan: make sure erspan_base_hdr is present in skb->head
    a03e138da771 i40e: Fix VF MAC filter removal
    b9bd1498cdce ice: fix enabling RX VLAN filtering
    fc126c1d51e9 gro: fix ownership transfer
    39864092cff3 selftests: net: gro fwd: update vxlan GRO test expectations
    23e1c6866e22 net: dsa: mv88e6xxx: fix usable ports on 88e6020
    95c1016a2d92 net: phy: micrel: Fix potential null pointer dereference
    f996e5ecf07f net: fec: Set mac_managed_pm during probe
    22a44eeef781 net: txgbe: fix i2c dev name cannot match clkdev
    1e304328d9c3 net: phy: micrel: lan8814: Fix when enabling/disabling 1-step timestamping
    784a65669720 net: stmmac: fix rx queue priority assignment
    c040b99461a5 net/sched: fix lockdep splat in qdisc_tree_reduce_backlog()
    f4d1fa512b2a net: dsa: sja1105: Fix parameters order in sja1110_pcs_mdio_write_c45()
    729ad2ac2a2c net/sched: act_skbmod: prevent kernel-infoleak
    3dcaf25993a2 KVM: arm64: Ensure target address is granule-aligned for range TLBI
    3ec21104c881 x86/retpoline: Do the necessary fixup to the Zen3/4 srso return thunk for !SRSO
    668b3074aa14 bpf, sockmap: Prevent lock inversion deadlock in map delete elem
    55fabde8d9f4 vboxsf: Avoid an spurious warning if load_nls_xxx() fails
    81d51b9b7c95 netfilter: validate user input for expected length
    9627fd0c6ea1 netfilter: nf_tables: discard table flag update with pending basechain deletion
    8b891153b2e4 netfilter: nf_tables: Fix potential data-race in __nft_flowtable_type_get()
    333b5085522c netfilter: nf_tables: flush pending destroy work before exit_net release
    420132bee3d0 netfilter: nf_tables: reject new basechain after table flag update
    e40f32f17642 x86/bugs: Fix the SRSO mitigation on Zen3/4
    93eae88e34f6 x86/nospec: Refactor UNTRAIN_RET[_*]
    820a3626f3d7 x86/srso: Disentangle rethunk-dependent options
    6b10edf91640 x86/srso: Improve i-cache locality for alias mitigation
    065012bb7777 vsock/virtio: fix packet delivery to tap device
    ca58927b0038 net: mana: Fix Rx DMA datasize and skb_over_panic
    426366d577e9 net: usb: ax88179_178a: avoid the interface always configured as random address
    92309bed3c5f net/rds: fix possible cp null dereference
    27aa3e4b3088 xen-netfront: Add missing skb_mark_for_recycle
    117eed2997bc selftests: mptcp: join: fix dev in check_endpoint
    8038ee3c3e5b netfilter: nf_tables: release mutex after nft_gc_seq_end from abort path
    b0b36dcbe0f2 netfilter: nf_tables: release batch on table validation from abort path
    d75632d0db3c Bluetooth: Fix TOCTOU in HCI debugfs implementation
    4a32840119d0 Bluetooth: hci_event: set the conn encrypted before conn establishes
    57e089d33b96 Bluetooth: add quirk for broken address properties
    1622e563b819 Bluetooth: qca: fix device-address endianness
    b99d0617b698 arm64: dts: qcom: sc7180-trogdor: mark bluetooth address as broken
    417c6cc9ef8c Revert "Bluetooth: hci_qca: Set BDA quirk bit if fwnode exists in DT"
    3f9d57c77165 x86/bpf: Fix IP after emitting call depth accounting
    4d47169ab691 x86/cpufeatures: Add CPUID_LNX_5 to track recently added Linux-defined word
    b9906101f894 r8169: fix issue caused by buggy BIOS on certain boards with RTL8168d
    477ed6789eb9 selinux: avoid dereference of garbage after mount failure
    9e2af26c29c6 KVM: arm64: Fix host-programmed guest events in nVHE
    651bf5b1d070 RISC-V: KVM: Fix APLIC in_clrip[x] read emulation
    200cc2c71841 RISC-V: KVM: Fix APLIC setipnum_le/be write emulation
    21bc9b158983 gpio: cdev: sanitize the label before requesting the interrupt
    a2671601fa02 modpost: do not make find_tosym() return NULL
    2bc92c61c541 modpost: Optimize symbol search from linear to binary search
    55ed6c477872 perf/x86/amd/lbr: Use freeze based on availability
    56e7373f9a67 x86/cpufeatures: Add new word for scattered features
    69fe5f177ad3 perf/x86/amd/core: Update and fix stalled-cycles-* events for Zen 2 and later
    d2be2f872fe7 x86/CPU/AMD: Add X86_FEATURE_ZEN1
    54273025be0c x86/CPU/AMD: Get rid of amd_erratum_1054[]
    824549816609 x86/CPU/AMD: Move the DIV0 bug detection to the Zen1 init function
    702a65272da6 x86/CPU/AMD: Move Zenbleed check to the Zen2 init function
    2577e2a7cae0 x86/CPU/AMD: Move erratum 1076 fix into the Zen1 init function
    eae590201d4a x86/CPU/AMD: Carve out the erratum 1386 fix
    936e59cb56ea x86/CPU/AMD: Add ZenX generations flags
    49d640d2946c btrfs: fix race when detecting delalloc ranges during fiemap
    8cc484e85e0c btrfs: ensure fiemap doesn't race with writes when FIEMAP_FLAG_SYNC is given
    fbc0a833c055 Revert "x86/mm/ident_map: Use gbpages only where full GB page should be mapped."
    907835e6dee6 mm/treewide: replace pud_large() with pud_leaf()
    7cd73d90856d dm integrity: fix out-of-range warning
    2564623ee0da drm/i915/mtl: Update workaround 14018575942
    798781b43194 drm/i915/xelpg: Extend some workarounds/tuning to gfx version 12.74
    338db8193cb2 drm/i915/mtl: Update workaround 14016712196
    ec84b2a44b05 drm/i915: Replace several IS_METEORLAKE with proper IP version checks
    b3749611a5e5 drm/i915: Eliminate IS_MTL_GRAPHICS_STEP
    18e77951e14a drm/i915/xelpg: Call Xe_LPG workaround functions based on IP version
    67f7fba8a086 drm/i915: Consolidate condition for Wa_22011802037
    6b25099eea4b drm/i915: Tidy workaround definitions
    0a9901fdb7bb drm/i915/dg2: Drop pre-production GT workarounds
    f4877225313d inet: inet_defrag: prevent sk release while still in use
    54720f68c4ad Octeontx2-af: fix pause frame configuration in GMP mode
    74a78a00db8f net: lan743x: Add set RFE read fifo threshold for PCI1x1x chips
    4bb7ad116be7 net: bcmasp: Bring up unimac after PHY link up
    cf893953633d netfilter: nf_tables: skip netdev hook unregistration if table is dormant
    2d0d1abe119a netfilter: nf_tables: reject table flag and netdev basechain updates
    cddd0480a682 netfilter: nf_tables: reject destroy command to remove basechain hooks
    614bc8c71ed5 cifs: Fix duplicate fscache cookie warnings
    3f0784b2f1eb bpf: Protect against int overflow for stack access size
    867a2f598af6 mlxbf_gige: call request_irq() after NAPI initialized
    f1b7f14130d7 tls: get psock ref after taking rxlock to avoid leak
    f19e995b4813 tls: adjust recv return with async crypto and failed copy to userspace
    dc4bce20fa9e tls: recv: process_rx_list shouldn't use an offset with kvec
    872f574f8860 net: hns3: mark unexcuted loopback test result as UNEXECUTED
    1b550dae5590 net: hns3: fix kernel crash when devlink reload during pf initialization
    b033da1461c1 net: hns3: fix index limit to support all queue stats
    77ffc72b497e ACPICA: debugger: check status of acpi_evaluate_object() in acpi_db_walk_for_fields()
    7fb8b3de7f22 selftests: vxlan_mdb: Fix failures with old libnet
    2e22c9cb6187 net: wwan: t7xx: Split 64bit accesses to fix alignment issues
    c1ae4d1e76ea tcp: properly terminate timers for kernel sockets
    984c3d962c9e net: hsr: hsr_slave: Fix the promiscuous mode in offload mode
    21dea1475fd4 s390/qeth: handle deferred cc1
    1b1c0f6ce790 igc: Remove stale comment about Tx timestamping
    4465b15ae5c5 ixgbe: avoid sleeping allocation in ixgbe_ipsec_vf_add_sa()
    e40a02f06ceb ice: fix memory corruption bug with suspend and rebuild
    feddf6c09c44 ice: realloc VSI stats arrays
    493b29930f66 ice: Refactor FW data type and fix bitmap casting issue
    0172edc572b0 ALSA: hda: cs35l56: Set the init_done flag before component_add()
    dc1ec9c5efec wifi: iwlwifi: mvm: include link ID when releasing frames
    13fd96c97596 wifi: iwlwifi: disable multi rx queue for 9000
    c0a40f2f8eba wifi: iwlwifi: mvm: rfi: fix potential response leaks
    84d30c56786a mlxbf_gige: stop PHY during open() error paths
    5c05bdd95f0e tools: ynl: fix setting presence bits in simple nests
    a946ebee45b0 nfc: nci: Fix uninit-value in nci_dev_up and nci_ntf_packet
    087dc50d8baf arm64: bpf: fix 32bit unconditional bswap
    156c226cbbdc dma-buf: Fix NULL pointer dereference in sanitycheck()
    aeecb678ec36 bpf, arm64: fix bug in BPF_LDX_MEMSX
    c3062bdb859b s390/bpf: Fix bpf_plt pointer arithmetic
    54d38a5ca0f7 scripts/bpf_doc: Use silent mode when exec make cmd
    cc696ce93089 drm/i915: Pre-populate the cursor physical dma address
    2c07e2437a3e drm/i915/display: Use i915_gem_object_get_dma_address to get dma address
    06644f0d7193 drm/tilcdc: Set preferred depth
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
 .../linux/linux-yocto-rt_6.6.bb               |  6 ++--
 .../linux/linux-yocto-tiny_6.6.bb             |  6 ++--
 meta/recipes-kernel/linux/linux-yocto_6.6.bb  | 28 +++++++++----------
 3 files changed, 20 insertions(+), 20 deletions(-)

diff --git a/meta/recipes-kernel/linux/linux-yocto-rt_6.6.bb b/meta/recipes-kernel/linux/linux-yocto-rt_6.6.bb
index be60bbee78..91dbbf55ca 100644
--- a/meta/recipes-kernel/linux/linux-yocto-rt_6.6.bb
+++ b/meta/recipes-kernel/linux/linux-yocto-rt_6.6.bb
@@ -14,13 +14,13 @@ python () {
         raise bb.parse.SkipRecipe("Set PREFERRED_PROVIDER_virtual/kernel to linux-yocto-rt to enable it")
 }
 
-SRCREV_machine ?= "9f39c8adfc6025293e5ff131f7bb4f728edd0c99"
-SRCREV_meta ?= "00aab388b73211bf49b352e7475595aa2e5fbc44"
+SRCREV_machine ?= "5272561b019836f2ee2f175b23029649431d6fca"
+SRCREV_meta ?= "3bf5e5e5a7323795af0955da818c6e93215fd119"
 
 SRC_URI = "git://git.yoctoproject.org/linux-yocto.git;branch=${KBRANCH};name=machine;protocol=https \
            git://git.yoctoproject.org/yocto-kernel-cache;type=kmeta;name=meta;branch=yocto-6.6;destsuffix=${KMETA};protocol=https"
 
-LINUX_VERSION ?= "6.6.25"
+LINUX_VERSION ?= "6.6.27"
 
 LIC_FILES_CHKSUM = "file://COPYING;md5=6bc538ed5bd9a7fc9398086aedcd7e46"
 
diff --git a/meta/recipes-kernel/linux/linux-yocto-tiny_6.6.bb b/meta/recipes-kernel/linux/linux-yocto-tiny_6.6.bb
index 559ca3563a..fba19c97df 100644
--- a/meta/recipes-kernel/linux/linux-yocto-tiny_6.6.bb
+++ b/meta/recipes-kernel/linux/linux-yocto-tiny_6.6.bb
@@ -8,7 +8,7 @@ require recipes-kernel/linux/linux-yocto.inc
 # CVE exclusions
 include recipes-kernel/linux/cve-exclusion_6.6.inc
 
-LINUX_VERSION ?= "6.6.25"
+LINUX_VERSION ?= "6.6.27"
 LIC_FILES_CHKSUM = "file://COPYING;md5=6bc538ed5bd9a7fc9398086aedcd7e46"
 
 DEPENDS += "${@bb.utils.contains('ARCH', 'x86', 'elfutils-native', '', d)}"
@@ -17,8 +17,8 @@ DEPENDS += "openssl-native util-linux-native"
 KMETA = "kernel-meta"
 KCONF_BSP_AUDIT_LEVEL = "2"
 
-SRCREV_machine ?= "5ac0c93287792fba862b1f78e513dbaf10696a09"
-SRCREV_meta ?= "00aab388b73211bf49b352e7475595aa2e5fbc44"
+SRCREV_machine ?= "4f3a41583a21c529bc7fc3a6c4a33bdffb16fa24"
+SRCREV_meta ?= "3bf5e5e5a7323795af0955da818c6e93215fd119"
 
 PV = "${LINUX_VERSION}+git"
 
diff --git a/meta/recipes-kernel/linux/linux-yocto_6.6.bb b/meta/recipes-kernel/linux/linux-yocto_6.6.bb
index b0674348e8..f887e293b7 100644
--- a/meta/recipes-kernel/linux/linux-yocto_6.6.bb
+++ b/meta/recipes-kernel/linux/linux-yocto_6.6.bb
@@ -18,25 +18,25 @@ KBRANCH:qemux86-64 ?= "v6.6/standard/base"
 KBRANCH:qemuloongarch64  ?= "v6.6/standard/base"
 KBRANCH:qemumips64 ?= "v6.6/standard/mti-malta64"
 
-SRCREV_machine:qemuarm ?= "e76632ff3899f47234405672a658156bb0079d52"
-SRCREV_machine:qemuarm64 ?= "5ac0c93287792fba862b1f78e513dbaf10696a09"
-SRCREV_machine:qemuloongarch64 ?= "5ac0c93287792fba862b1f78e513dbaf10696a09"
-SRCREV_machine:qemumips ?= "744b6e2f70062732f48de0918ca8c56f5de408dd"
-SRCREV_machine:qemuppc ?= "5ac0c93287792fba862b1f78e513dbaf10696a09"
-SRCREV_machine:qemuriscv64 ?= "5ac0c93287792fba862b1f78e513dbaf10696a09"
-SRCREV_machine:qemuriscv32 ?= "5ac0c93287792fba862b1f78e513dbaf10696a09"
-SRCREV_machine:qemux86 ?= "5ac0c93287792fba862b1f78e513dbaf10696a09"
-SRCREV_machine:qemux86-64 ?= "5ac0c93287792fba862b1f78e513dbaf10696a09"
-SRCREV_machine:qemumips64 ?= "936a9ceb126dfb2cc4b38229cab68636263ecfab"
-SRCREV_machine ?= "5ac0c93287792fba862b1f78e513dbaf10696a09"
-SRCREV_meta ?= "00aab388b73211bf49b352e7475595aa2e5fbc44"
+SRCREV_machine:qemuarm ?= "51c07ec56f85fbbfa9ea6944a4b14eee7e715566"
+SRCREV_machine:qemuarm64 ?= "4f3a41583a21c529bc7fc3a6c4a33bdffb16fa24"
+SRCREV_machine:qemuloongarch64 ?= "4f3a41583a21c529bc7fc3a6c4a33bdffb16fa24"
+SRCREV_machine:qemumips ?= "4bf661a8afc7323030a6af73fc5640ef4dabe01f"
+SRCREV_machine:qemuppc ?= "4f3a41583a21c529bc7fc3a6c4a33bdffb16fa24"
+SRCREV_machine:qemuriscv64 ?= "4f3a41583a21c529bc7fc3a6c4a33bdffb16fa24"
+SRCREV_machine:qemuriscv32 ?= "4f3a41583a21c529bc7fc3a6c4a33bdffb16fa24"
+SRCREV_machine:qemux86 ?= "4f3a41583a21c529bc7fc3a6c4a33bdffb16fa24"
+SRCREV_machine:qemux86-64 ?= "4f3a41583a21c529bc7fc3a6c4a33bdffb16fa24"
+SRCREV_machine:qemumips64 ?= "d3abfe3c736d5869cb26f24c653b7e6eeafac715"
+SRCREV_machine ?= "4f3a41583a21c529bc7fc3a6c4a33bdffb16fa24"
+SRCREV_meta ?= "3bf5e5e5a7323795af0955da818c6e93215fd119"
 
 # set your preferred provider of linux-yocto to 'linux-yocto-upstream', and you'll
 # get the <version>/base branch, which is pure upstream -stable, and the same
 # meta SRCREV as the linux-yocto-standard builds. Select your version using the
 # normal PREFERRED_VERSION settings.
 BBCLASSEXTEND = "devupstream:target"
-SRCREV_machine:class-devupstream ?= "e475741af1ebe2c92ee4a3f49e55749a84770a12"
+SRCREV_machine:class-devupstream ?= "5e828009c8b380739e13da92be847f10461c38b1"
 PN:class-devupstream = "linux-yocto-upstream"
 KBRANCH:class-devupstream = "v6.6/base"
 
@@ -44,7 +44,7 @@ SRC_URI = "git://git.yoctoproject.org/linux-yocto.git;name=machine;branch=${KBRA
            git://git.yoctoproject.org/yocto-kernel-cache;type=kmeta;name=meta;branch=yocto-6.6;destsuffix=${KMETA};protocol=https"
 
 LIC_FILES_CHKSUM = "file://COPYING;md5=6bc538ed5bd9a7fc9398086aedcd7e46"
-LINUX_VERSION ?= "6.6.25"
+LINUX_VERSION ?= "6.6.27"
 
 PV = "${LINUX_VERSION}+git"
 
-- 
2.39.2


