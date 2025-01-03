Return-Path: <bruce.ashfield@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id E733FE7718F
	for <webhook@archiver.kernel.org>; Fri,  3 Jan 2025 14:17:16 +0000 (UTC)
Received: from mail-qt1-f182.google.com (mail-qt1-f182.google.com [209.85.160.182])
 by mx.groups.io with SMTP id smtpd.web11.31296.1735913833758413970
 for <openembedded-core@lists.openembedded.org>;
 Fri, 03 Jan 2025 06:17:14 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20230601 header.b=T3Xc+y2E;
 spf=pass (domain: gmail.com, ip: 209.85.160.182, mailfrom: bruce.ashfield@gmail.com)
Received: by mail-qt1-f182.google.com with SMTP id d75a77b69052e-467918c360aso142964681cf.0
        for <openembedded-core@lists.openembedded.org>; Fri, 03 Jan 2025 06:17:13 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1735913833; x=1736518633; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=elRZn8h4TwR7laIQHfT0EoblCb/nw6qWWRBnz71JmQ0=;
        b=T3Xc+y2Ekz5t65L3ATzRH19PXKL1PmHdJ7ffrPVh/K7x/HOFbBL221hCjSiSKvgLiT
         /f0fSVQr3+sxdRsTMz7XSDfZlB+yfbd6Bilqg4/Qo0uhM3mTYSFq6eir72bNGG/Wpmeo
         OZyi4xEzLacBPgczO/YeyRyzuqdVcjj/TSCaUmEUjK3SqZ5tr8xwQrqKQ05Ba4k701SQ
         eeozjQDaAw5cmW6EZFol0qt7Lt2Ui2hMrYRtuJX6fHLYRxdbfVwretKKOO++2AyQMSxE
         w/w4W0HL5yYQOtbbgTp9j1vSMDA/Qe3W1ysH9mG8Ny9nms8lYupmuqZUOJ5WXV03Css2
         hWmg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1735913833; x=1736518633;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=elRZn8h4TwR7laIQHfT0EoblCb/nw6qWWRBnz71JmQ0=;
        b=rLkAaLOOqDK6SLzIbbbIiEGqHaoU7jpBcegk4pV5En9SOBNYRNnbC936ICXFp18k78
         1eidnZJ81tQPVSYQryJlRoo0D+rQJlUeuMzjUTEek/shVUfsznwvG9tKgzV8KdLPsJsp
         SynCYj/ERNHSF9QMKddH2wYufmIv9PeTObtk7uWqiq3CXgO0yDcugB1pD2ytGfGs9jQU
         wtFb3nUi80MvPLF/QZuoGOEDjc525pXjoEZDvNGmFwH93jW69xIyUnr70Q+DcLdBGgaS
         LwpOcEk7veJbX94YCmoFn+3CpELWCSL/tL6CHXMqTT5NNnMPbjdDE0ItDh/X3+0lWzYk
         lfKQ==
X-Gm-Message-State: AOJu0YzDPrk+59Sm7zDTK/7bgsPbfz+ExYfwMSWfkjIhSlZ23qsoXBdc
	+waourOn8y0sP/6I3r1vReAngjEdcZYrh9oGaSyYFNDY7pMja+pO4r7UsuhzVQs=
X-Gm-Gg: ASbGncvtNsUIUwmiQOokIKjLfHdAVzDxbW4yXr3L3bqIGb7ujcXlWWK4I2CxUAWvCnh
	7g68fwO2nCY4hwqLO9CEOzQK44gDbi4mOv8GPVk4XoWtNFejLDSJ04U0A4tzwVeOvos8fSSuNec
	oiGVNFzaWEuBfudFxdbOuG1olyMOCuOADx1N1xqft1eFLNUxyu20hTyohWPfhQp8gtO2xX7dqWf
	Eo0XxestWSKAIehJfhEkUKZYs85usFho3U8vkvsq8J4/D3j2sHpUhyAqjuMu2/hBDpr+5kSu7iW
	e/QO7icfZYa53n+qFuryQRvljZ7fEm/W/jO7Rnm8ROMW1d5/dZyym+VlEw==
X-Google-Smtp-Source: AGHT+IGzW0t30G9evM9I36w/25/F6qEHL29vs095Lwc4pkayjXMsXOkD8NRShrQM7dxlzGUr+Old1Q==
X-Received: by 2002:a05:622a:1182:b0:467:6710:bbf5 with SMTP id d75a77b69052e-46a4a976c59mr786539961cf.41.1735913832477;
        Fri, 03 Jan 2025 06:17:12 -0800 (PST)
Received: from bruce-XPS-8940.localdomain (pool-174-112-62-108.cpe.net.cable.rogers.com. [174.112.62.108])
        by smtp.gmail.com with ESMTPSA id af79cd13be357-7b9ac4ef0f6sm1275015485a.123.2025.01.03.06.17.11
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 03 Jan 2025 06:17:11 -0800 (PST)
From: bruce.ashfield@gmail.com
To: steve@sakoman.com
Cc: openembedded-core@lists.openembedded.org
Subject: [OE-core][kirkstone 01/10] linux-yocto/5.15: update to v5.15.167
Date: Fri,  3 Jan 2025 09:17:00 -0500
Message-Id: <20250103141709.2848730-2-bruce.ashfield@gmail.com>
X-Mailer: git-send-email 2.39.2
In-Reply-To: <20250103141709.2848730-1-bruce.ashfield@gmail.com>
References: <20250103141709.2848730-1-bruce.ashfield@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Fri, 03 Jan 2025 14:17:16 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/209355

From: Bruce Ashfield <bruce.ashfield@gmail.com>

Updating linux-yocto/5.15 to the latest korg -stable release that comprises
the following commits:

    3a5928702e71 Linux 5.15.167
    d7037dc85112 udp: fix receiving fraglist GSO packets
    e6cc9ff2ac0b memcg: protect concurrent access to mem_cgroup_idr
    d116a0b0e02f btrfs: fix race between direct IO write and fsync when using same fd
    5d8254e01299 net, sunrpc: Remap EPERM in case of connection failure in xs_tcp_setup_socket
    ba2af6448fd1 x86/mm: Fix PTI for i386 some more
    413e785a89f8 net: drop bad gso csum_start and offset in virtio_net_hdr
    c60a555f4949 gso: fix dodgy bit handling for GSO_UDP_L4
    5c3e0ed81058 net: change maximum number of UDP segments to 128
    ed3f2af02268 net: more strict VIRTIO_NET_HDR_GSO_UDP_L4 validation
    fdc567c05fce gpio: rockchip: fix OF node leak in probe()
    ae9363987319 drm/i915/fence: Mark debug_fence_free() with __maybe_unused
    fb1104bb2ae3 drm/i915/fence: Mark debug_fence_init_onstack() with __maybe_unused
    6958e0df8c9c ASoC: sunxi: sun4i-i2s: fix LRCLK polarity in i2s mode
    91dad30c5607 nvmet-tcp: fix kernel crash if commands allocation fails
    945be49f4e83 arm64: acpi: Harden get_cpu_for_acpi_id() against missing CPU entry
    1f12c0e470c8 arm64: acpi: Move get_cpu_for_acpi_id() to a header
    f44c27d12485 ACPI: processor: Fix memory leaks in error paths of processor_add()
    b77a7a5ac6bc ACPI: processor: Return an error if acpi_processor_get_info() fails in processor_add()
    9d08fce64dd7 workqueue: Improve scalability of workqueue watchdog touch
    f67401f3857f workqueue: wq_watchdog_touch is always called with valid CPU
    b14e7260bb69 nilfs2: protect references to superblock parameters exposed in sysfs
    dbcc19de2d83 nilfs2: replace snprintf in show functions with sysfs_emit
    3fd8473d73fd ksmbd: Unlock on in ksmbd_tcp_set_interfaces()
    9914f1bd61d5 ksmbd: unset the binding mark of a reused connection
    52d13d224fdf perf/aux: Fix AUX buffer serialization
    9fadd335df31 uprobes: Use kzalloc to allocate xol area
    2c78dd75dd0a clocksource/drivers/timer-of: Remove percpu irq related code
    a5f2703f7550 clocksource/drivers/imx-tpm: Fix next event not taking effect sometime
    0746401d759a clocksource/drivers/imx-tpm: Fix return -ETIME when delta exceeds INT_MAX
    ef5f4d0c5ee2 VMCI: Fix use-after-free when removing resource in vmci_resource_remove()
    c36c826ad3e6 Drivers: hv: vmbus: Fix rescind handling in uio_hv_generic
    3005091cd537 uio_hv_generic: Fix kernel NULL pointer dereference in hv_uio_rescind
    7d1d48eb100a nvmem: Fix return type of devm_nvmem_device_get() in kerneldoc
    eef79854a04f binder: fix UAF caused by offsets overwrite
    9b9651f70856 usb: dwc3: core: update LC timer as per USB Spec V3.2
    0fd0ef7cf09b iio: adc: ad7124: fix chip ID mismatch
    4dcc19009b40 iio: adc: ad7124: fix config comparison
    3be69c24936f iio: fix scale application in iio_convert_raw_to_processed_unlocked
    3d2d5c74004e iio: buffer-dmaengine: fix releasing dma channel on error
    d8b09a5edc4a staging: iio: frequency: ad9834: Validate frequency parameter value
    d990692bea3d cifs: Check the lease context if we actually got a lease
    b5c7121ec14d NFSv4: Add missing rescheduling points in nfs_client_return_marked_delegations
    802c7eb7e52b ata: pata_macio: Use WARN instead of BUG
    e6cd871627ab MIPS: cevt-r4k: Don't call get_c0_compare_int if timer irq is installed
    ad5ee9feebc2 lib/generic-radix-tree.c: Fix rare race in __genradix_ptr_alloc()
    baaf26723bea of/irq: Prevent device address out-of-bounds read in interrupt map walk
    087f25b2d36a Squashfs: sanity check symbolic link size
    0914c26262f4 usbnet: ipheth: race between ipheth_close and error handling
    9719687398de Input: uinput - reject requests with unreasonable number of slots
    86b4f5cf91ca HID: amd_sfh: free driver_data after destroying hid device
    890dde6001b6 HID: cougar: fix slab-out-of-bounds Read in cougar_report_fixup
    945b12960fe6 s390/vmlinux.lds.S: Move ro_after_init section behind rodata section
    f1757142c50a btrfs: initialize location to fix -Wmaybe-uninitialized in btrfs_lookup_dentry()
    18e65173fe99 kselftests: dmabuf-heaps: Ensure the driver name is null-terminated
    cacb76df247a i3c: mipi-i3c-hci: Error out instead on BUG_ON() in IBI DMA setup
    289d0822be95 net: dpaa: avoid on-stack arrays of NR_CPUS elements
    04e85a3285b0 PCI: Add missing bridge lock to pci_bus_lock()
    197f7a2e24a5 riscv: set trap vector earlier
    b50857b96429 btrfs: replace BUG_ON() with error handling at update_ref_for_cow()
    728d4d045b62 btrfs: clean up our handling of refs == 0 in snapshot delete
    3cf21d00d3ee btrfs: replace BUG_ON with ASSERT in walk_down_proc()
    b7b1be372155 fs/ntfs3: Check more cases when directory is corrupted
    e8665ac40072 smp: Add missing destroy_work_on_stack() call in smp_call_on_cpu()
    cb67b2e51b75 wifi: mwifiex: Do not return unused priv in mwifiex_get_priv_by_id()
    68a04c30cb63 dma-mapping: benchmark: Don't starve others when doing the test
    4ac7b43e4e84 ext4: fix possible tid_t sequence overflows
    15101f16dec9 drm/amdgpu: Set no_hw_access when VF request full GPU fails
    bc152bd3c9c0 libbpf: Add NULL checks to bpf_object__{prev_map,next_map}
    cc4be794c8d8 hwmon: (w83627ehf) Fix underflows seen when writing limit attributes
    02bb3b4c7d56 hwmon: (nct6775-core) Fix underflows seen when writing limit attributes
    0fc27747633a hwmon: (lm95234) Fix underflows seen when writing limit attributes
    019ef2d39636 hwmon: (adc128d818) Fix underflows seen when writing limit attributes
    c0d8094dc740 pci/hotplug/pnv_php: Fix hotplug driver crash on Powernv
    0977a0a3ba65 devres: Initialize an uninitialized struct member
    43f782c27907 um: line: always fill *error_out in setup_one_line()
    f386359d1b32 cgroup: Protect css->cgroup write under css_set_lock
    df6e78ba22ed iommu/vt-d: Handle volatile descriptor status read
    8ab1d1fed7f0 dm init: Handle minors larger than 255
    2aa4bacbff44 ASoC: topology: Properly initialize soc_enum values
    ebe29eedb1b5 net: dsa: vsc73xx: fix possible subblocks range of CAPT block
    4e777199c057 net: bridge: br_fdb_external_learn_add(): always set EXT_LEARN
    4494bccb52ff fou: Fix null-ptr-deref in GRO.
    3bcdbf9002a8 gro: remove rcu_read_lock/rcu_read_unlock from gro_complete handlers
    8d84e1a87a32 gro: remove rcu_read_lock/rcu_read_unlock from gro_receive handlers
    5ccc2e5d074b bareudp: Fix device stats updates.
    f12886ff7b5d usbnet: modern method to get random MAC
    010038823be2 net: usb: don't write directly to netdev->dev_addr
    fa797f4e30b2 ice: check ICE_VSI_DOWN under rtnl_lock when preparing for reset
    84508c370337 igc: Unlock on error in igc_io_resume()
    78bb38d9c5a3 tcp_bpf: fix return value of tcp_bpf_sendmsg()
    cff3cbba73d5 platform/x86: dell-smbios: Fix error path in dell_smbios_init()
    a4792648475f igb: Fix not clearing TimeSync interrupts for 82580
    508b52aa958e can: m_can: Release irq on error in m_can_open
    10bfacbd5e8d can: bcm: Remove proc entry when dev is unregistered.
    51d57093340a drm/amdgpu: check for LINEAR_ALIGNED correctly in check_tiling_flags_gfx6
    8decfd84e67d pcmcia: Use resource_size function on resource object
    0e5a3d5fdff5 media: qcom: camss: Add check for v4l2_fwnode_endpoint_parse
    135843c351c0 PCI: keystone: Add workaround for Errata #i2037 (AM65x SR 1.0)
    a1659ed3f966 media: vivid: don't set HDMI TX controls if there are no HDMI outputs
    32fca3bb5fc1 drm/amd/display: Check HDCP returned status
    dc74386c67aa usb: uas: set host status byte on data completion error
    0186d0d1af80 wifi: brcmsmac: advertise MFP_CAPABLE to enable WPA3
    36e2bc79af36 leds: spi-byte: Call of_node_put() on error path
    5a884b46324e media: vivid: fix wrong sizeimage value for mplane
    2ddf83145135 udf: Avoid excessive partition lengths
    8d63b70d2f25 netfilter: nf_conncount: fix wrong variable type
    3e2ea7d682a0 iommu: sun50i: clear bypass register
    683c0b103934 af_unix: Remove put_pid()/put_cred() in copy_peercred().
    3f56c976b047 irqchip/armada-370-xp: Do not allow mapping IRQ 0 and 1
    09e89a5e1173 smack: unix sockets: fix accept()ed socket label
    22d3b037ddc5 ALSA: hda: Add input value sanity checks to HDMI channel map controls
    c6877abcdb25 mptcp: pm: send ACK on an active subflow
    fd5364b22fc1 mptcp: pr_debug: add missing \n at the end
    c743fd11891a mptcp: pm: skip connecting to already established sf
    058f8d980e4d mptcp: pm: do not remove already closed subflows
    592dd6f8b658 mptcp: pm: ADD_ADDR 0 is not a new address
    38cdf2f1b33e mptcp: close subflow when receiving TCP+FIN
    01264bdde5f7 mptcp: avoid duplicated SUB_CLOSED events
    f2c865e9e3ca mptcp: pm: avoid possible UaF when selecting endp
    8e73f8d6a455 mptcp: constify a bunch of of helpers
    aef351c58a9b mptcp: pm: fullmesh: select the right ID later
    4d4e3a29e701 mptcp: pm: check add_addr_accept_max before accepting new ADD_ADDR
    35b31f5549ed mptcp: pm: only decrement add_addr_accepted for MPJ req
    32ba711800a3 mptcp: pm: re-using ID of unused flushed subflows
    3e349d7191f0 nilfs2: fix state management in error path of log writing function
    8e2d1e9d93c4 nilfs2: fix missing cleanup on rollforward recovery error
    cde71a567797 sched: sch_cake: fix bulk flow accounting logic for host fairness
    bda4d84ac0d5 ila: call nf_unregister_net_hooks() sooner
    3816867d2fc4 tracing: Avoid possible softlockup in tracing_iter_reset()
    513c8fc189b5 can: mcp251x: fix deadlock if an interrupt occurs during mcp251x_open
    3172376d26e4 clk: qcom: clk-alpha-pll: Fix the trion pll postdiv set rate API
    5dd47383ceaf clk: qcom: clk-alpha-pll: Fix the pll post div mask
    e24c19c6e3c6 fuse: use unsigned type for getxattr/listxattr size truncation
    811016d5a390 fuse: update stats for pages in dropped aux writeback list
    c0f43b1f1f7d mmc: cqhci: Fix checking of CQHCI_HALT state
    e89943fc4cbe mmc: sdhci-of-aspeed: fix module autoloading
    9d715a234dd8 mmc: dw_mmc: Fix IDMAC operation with pages bigger than 4K
    57b6ead5719e Bluetooth: MGMT: Ignore keys being loaded with invalid type
    d98304eaacc6 Revert "Bluetooth: MGMT/SMP: Fix address type when using SMP over BREDR/LE"
    0bfa0fa207b4 nvme-pci: Add sleep quirk for Samsung 990 Evo
    93f44655472d rtmutex: Drop rt_mutex::wait_lock before scheduling
    b322a385c09a irqchip/gic-v2m: Fix refcount leak in gicv2m_of_init()
    9bbc71fa3d56 ata: libata: Fix memory leak for error path in ata_host_alloc()
    c03d9115c5ca ALSA: hda/realtek: Support mute LED on HP Laptop 14-dq2xxx
    326303f886a9 ALSA: hda/realtek: add patch for internal mic in Lenovo V145
    172359315301 ALSA: hda/conexant: Add pincfg quirk to enable top speakers on Sirius devices
    d1f7a12c2b2e KVM: SVM: Don't advertise Bus Lock Detect to guest if SVM support is missing
    e3e0cb027173 KVM: SVM: fix emulation of msr reads/writes of MSR_FS_BASE and MSR_GS_BASE
    3033ed903b4f ASoC: dapm: Fix UAF for snd_soc_pcm_runtime object
    14f91ab8d391 sch/netem: fix use after free in netem_dequeue
    366a1e578201 i2c: Use IS_REACHABLE() for substituting empty ACPI functions
    be1443518365 ext4: handle redirtying in ext4_bio_write_page()
    64022ce8e99d udf: Limit file size to 4TB
    1464cb82a489 ext4: reject casefold inode flag without casefold feature
    af7b560c88fb rcu-tasks: Fix show_rcu_tasks_trace_gp_kthread buffer overflow
    cc7340f18e45 virtio_net: Fix napi_skb_cache_put warning
    0fa11f9df962 drm/amd/pm: Fix the null pointer dereference for vega10_hwmgr
    68a772884b83 media: uvcvideo: Enforce alignment of frame and interval
    6d94c05a13fa drm/amd/display: Skip wbscl_set_scaler_filter if filter is null
    6980861e039d block: remove the blk_flush_integrity call in blk_integrity_unregister
    1339615aca2c wifi: cfg80211: make hash table duplicates more survivable
    adc5674c23b8 drm/bridge: tc358767: Check if fully initialized before signalling HPD event via IRQ
    c9431980407b drm/meson: plane: Add error handling
    0aea09e82eaf smack: tcp: ipv4, fix incorrect labeling
    f9a48bc3dd90 fsnotify: clear PARENT_WATCHED flags lazily
    3aa56313b0de usb: typec: ucsi: Fix null pointer dereference in trace
    e1c92f66f62d usbip: Don't submit special requests twice
    34255103ff75 rcu/nocb: Remove buggy bypass lock contention mitigation
    f8b96d4e8257 ionic: fix potential irq name truncation
    b8105982c286 RDMA/efa: Properly handle unexpected AQ completions
    2da121e397ba hwspinlock: Introduce hwspin_lock_bust()
    56af1b0f07e5 PCI: al: Check IORESOURCE_BUS existence during probe
    29f45f2588ed cpufreq: scmi: Avoid overflow of target_freq in fast switch
    ec4cb72a9b95 wifi: iwlwifi: remove fw_running op
    36a77159b43a drm/amdgpu: update type of buf size to u32 for eeprom functions
    2700dbd10aaa drm/amd/pm: check negtive return for table entries
    d04ded1e73f1 drm/amdgpu: the warning dereferencing obj for nbio_v7_4
    acff7a94720a drm/amd/pm: check specific index for aldebaran
    f20d1d5cbb39 drm/amdgpu: fix the waring dereferencing hive
    bda7de66a9de drm/amdgpu/pm: Check input value for CUSTOM profile mode setting on legacy SOCs
    e3c7d23f7a5c apparmor: fix possible NULL pointer dereference
    6cc5011865dd drm/amdkfd: Reconcile the definition and use of oem_id in struct kfd_topology_device
    345bd3ad387f drm/amdgpu: fix mc_data out-of-bounds read warning
    0bef65e069d8 drm/amdgpu: fix ucode out-of-bounds read warning
    45f7b02afc46 drm/amdgpu: Fix out-of-bounds read of df_v1_7_channel_number
    919f9bf9997b drm/amdgpu: Fix out-of-bounds write warning
    0fcc24121423 drm/amdgpu/pm: Fix uninitialized variable agc_btc_response
    80ce7edcd45d drm/amdgpu/pm: Fix uninitialized variable warning for smu10
    e55e3904ffea drm/amd/amdgpu: Check tbo resource pointer
    f37d6aa3df5f drm/amd/display: Fix Coverity INTEGER_OVERFLOW within dal_gpio_service_create
    fe63daf7b102 drm/amd/display: Check msg_id before processing transcation
    c4a7f7c0062f drm/amd/display: Check num_valid_sets before accessing reader_wm_sets[]
    0ee4387c5a4b drm/amd/display: Add array index check for hdcp ddc access
    21bbb39863f1 drm/amd/display: Stop amdgpu_dm initialize when stream nums greater than 6
    0184cca30cad drm/amd/display: Check gpio_id before used as array index
    0c445d98ef98 drm/amdgpu: avoid reading vf2pf info size from FB
    c5635fe6dca4 drm/amd/pm: fix uninitialized variable warnings for vega10_hwmgr
    f801292764be drm/amdgpu: fix uninitialized scalar variable warning
    3317966efcdc drm/amd/pm: fix the Out-of-bounds read warning
    bcd00d0dbf00 drm/amd/pm: fix warning using uninitialized value of max_vid_step
    6277aa2965de drm/amd/pm: fix uninitialized variable warning for smu8_hwmgr
    d16713773b65 drm/amdgpu/pm: Check the return value of smum_send_msg_to_smc
    54528b614398 drm/amdgpu: fix overflowed array index read warning
    4bd7710f2fec drm/amd/display: Assign linear_pitch_alignment even for VM
    a42ba93641bf drm/amdgpu: Fix uninitialized variable warning in amdgpu_afmt_acr
    3ea66eddf54d net: usb: qmi_wwan: add MeiG Smart SRM825L
    488702d1be32 dma-debug: avoid deadlock between dma debug vs printk and netconsole
    8da2de41e66d i2c: Fix conditional for substituting empty ACPI functions
    7abc0b4409aa ALSA: hda/conexant: Mute speakers at suspend / shutdown
    2fd3143b2588 ALSA: hda/generic: Add a helper to mute speakers at suspend/shutdown
    24a63d85bd49 drm: panel-orientation-quirks: Add quirk for OrangePi Neo
    6f0605db50e2 clk: imx: Add check for kcalloc
    5b837b9e1543 bpf: Fix the indention issue in grow_stack_state()
    42b62697634d cifs: Fix the calling of smb_version_operations::calc_smb_size()
    b14acf729e9d f2fs: Add inline to f2fs_build_fault_attr() stub
    7c317bec311f f2fs: check validation of fault attrs in f2fs_build_fault_attr()
    81c12119c23f bpf: Fix accesses to uninit stack slots [ Upstream commit 6b4a64bafd107e521c01eec3453ce94a3fb38529 ]
    c4fa05422d87 smb: client: fix potential OOB in smb2_dump_detail()
    299ef3b5b00b of: module: add buffer overflow check in of_modalias()
    b8086c3c1548 reiserfs: Avoid touching renamed directory if parent does not change
    ea091017ef62 ipv6: Fix data races around sk->sk_prot.
    ff8710da80ee ipv6: annotate some data-races around sk->sk_prot
    e8c2eafaaa6a tcp: Fix data races around icsk->icsk_af_ops.
    8d1bab770956 locking/rwsem: Disable preemption while trying for rwsem lock
    7c82dac02886 block, loop: support partitions without scanning
    45f504f301d4 bpftool: Fix pretty print dump for maps without BTF loaded
    1f24338cb789 jbd2: Drop the merge conflicted hunk
    e1d0e3c51bde tpm: tis_i2c: Limit write bursts to I2C_SMBUS_BLOCK_MAX (32) bytes
    1abe841fe331 tpm: tis_i2c: Limit read bursts to I2C_SMBUS_BLOCK_MAX (32) bytes
    6224acfc1d56 tpm: Add flag to use default cancellation policy
    1cd19d48fb90 tpm: tis_i2c: Fix sanity check interrupt enable mask
    a883da132fa8 tpm: Add tpm_tis_i2c backend for tpm_tis_core
    a742ac8a1c51 tpm: Add tpm_tis_verify_crc to the tpm_tis_phy_ops protocol layer
    ef495c5f45f2 tpm: Remove read16/read32/write32 calls from tpm_tis_phy_ops
    1f3be2e23aa6 gcc-plugins: Reorganize gimple includes for GCC 13
    24615a3b932a ata: ahci: fix enum constants for gcc-13
    5d6cb145541a net: stmmac: Enable mac_managed_pm phylink config
    fd93aabb4287 tools/resolve_btfids: Use pkg-config to locate libelf
    130f9da78406 tools/resolve_btfids: Build with host flags
    00f2f1a782f9 tools/resolve_btfids: Support cross-building the kernel with clang
    17776a4ba9c2 tools/resolve_btfids: Install libbpf headers when building
    7c9808380d70 libbpf: Make libbpf_version.h non-auto-generated
    37ae1ba791ac libbpf: Add LIBBPF_DEPRECATED_SINCE macro for scheduling API deprecations
    a2667e6d7314 drm/radeon: free iio for atombios when driver shutdown
    f100c753aa1f powerpc: Fix reschedule bug in KUAP-unlocked user copy
    da5513f30187 libbpf: Fix build warning on ref_ctr_off
    4c5a089621a8 perf python: Account for multiple words in CC
    1c5699ee85d4 fs: move S_ISGID stripping into the vfs_*() helpers
    838f5d0701d8 fs: add mode_strip_sgid() helper
    d97172683641 squashfs: provide backing_dev_info in order to disable read-ahead
    ed037d7be40c irq_work: use kasan_record_aux_stack_noalloc() record callstack
    1363bd7dbde3 ixgbevf: add disable link state
    e5601ae2bd24 ixgbe: add improvement for MDD response functionality
    caa57cd80575 ixgbe: add the ability for the PF to disable VF link state
    16a77bfcc7df Check /dev/console using init_stat()
    04574fd5579a tracing/arm: Have max stack tracer handle the case of return address after data
    0e51e5717018 gpiolib: cdev: Set lineevent_state::irq after IRQ register successfully
    1e6b7da6ddba drivers/base: Fix unsigned comparison to -1 in CPUMAP_FILE_MAX_BYTES
    493160901320 mtd_blkdevs: add mtd_table_mutex lock back to blktrans_{open, release} to avoid race condition
    04224f725aa3 irqchip/gic-v3-its: Skip HP notifier when no ITS is registered
    6f6c2996a81c irqchip/gic-v3-its: Postpone LPI pending table freeing and memreserve
    1fa94473423f irqchip/gic-v3-its: Give the percpu rdist struct its own flags field
    6013d1ae5feb cert host tools: Stop complaining about deprecated OpenSSL functions
    efe20512212b init/Kconfig: fix CC_HAS_ASM_GOTO_TIED_OUTPUT test with dash
    a40d2daf2795 pnmtologo: use relocatable file name
    3b40d5b41155 of: configfs: remove unused variable overlay_lock
    6c085baf1838 tools: use basename to identify file in gen-mach-types
    2fca0fd71981 lib/build_OID_registry: fix reproducibility issues
    0f586f4ee8ad vt/conmakehash: improve reproducibility
    a75774679f28 OF: DT-Overlay configfs interface (v8)
    d179c639b30b x86/boot: Wrap literal addresses in absolute_pointer()
    856ec356cf91 ACPI: thermal: drop an always true check
    7614af249993 xfs: Fix -Werror=dangling-pointer work-around for older GCC
    41470215f97e xfs: Work around GCC 12 -Werror=dangling-pointer for xfs_attr_remote.o
    44a445c1922d virtio-pci: Remove wrong address verification in vp_del_vqs()
    77aa9e489eaf bpf: Disallow unprivileged bpf by default
    ebfb1822e9f9 fs/aufs: fixup 5.15.36 fixups
    4eba9348d3e2 Revert "Revert "fbdev: Hot-unplug firmware fb devices on forced removal""
    5df6d1b00f95 jbd2: fix use-after-free of transaction_t race
    2d83e8196487 jbd2: refactor wait logic for transaction updates into a common function
    07a63f760793 netfilter: conntrack: avoid useless indirection during conntrack destruction
    4e7122625996 Revert "fbdev: Hot-unplug firmware fb devices on forced removal"
    7ba4cb36fd4f rcu: Avoid alloc_pages() when recording stack
    f78574dee71e kasan: test: silence intentional read overflow warnings
    d313cb89b6b1 kasan: arm64: fix pcpu_page_first_chunk crash with KASAN_VMALLOC
    5e279d5647cc arm64: support page mapping percpu first chunk allocator
    e5bf16752dca vmalloc: choose a better start address in vm_area_register_early()
    660b3d21b46f kasan: test: bypass __alloc_size checks
    00aa7573e53a kasan: test: add memcpy test that avoids out-of-bounds write
    67becf0b1bd4 kasan: fix tag for large allocations when using CONFIG_SLAB
    bedf1e033213 workqueue, kasan: avoid alloc_pages() when recording stack
    7195b67ce69b kasan: generic: introduce kasan_record_aux_stack_noalloc()
    bdff763f0e29 kasan: common: provide can_alloc in kasan_save_stack()
    51423ebb36ad lib/stackdepot: introduce __stack_depot_save()
    85373e66d847 lib/stackdepot: remove unused function argument
    5b6cc9b251f3 lib/stackdepot: include gfp.h
    c9f3902d8069 aufs: reduce overhead for "code present but disabled" use case.
    b98d189df02c aufs: bugfix, umount passes NULL to ->parse_monolithic()
    13b883cbbbd9 aufs standalone: cosmetic, missing copyright sentence
    21f8b0d81898 aufs: 5.15.5-20220117 ---> 5.15.5-20220221
    6199fd896645 aufs: tiny, headers after fs_context
    8ddb40e31c29 aufs: fs_context 7/7, finally remount
    69035f71c6fd aufs: fs_context 6/7, now mount
    bc841b970697 aufs: fs_context 5/7, parse all other mount options
    435188053da2 aufs: fs_context 4/7, parse xino options
    9af1f1825cbd aufs: fs_context 3/7, parse the branch-management options
    1c05eb767f8c aufs: fs_context 2/7, parse "br" mount option
    a8488f603134 aufs: fs_context 1/7, skelton of the new shceme
    8e32e0015564 aufs: pre fs_context, convert a static flag to a macro
    f90cb4144aec aufs: pre fs_context, support the incomplete sb and sbinfo case
    948762ef859c aufs: pre fs_context, convert the type of alloc_sbinfo()
    77151a08776b aufs: 5.15.5-20211129 ---> 5.15.5-20220117
    2539adbbbe1e aufs: 5.14-20211018 ---> 5.15.5-20211129
    7d32b25193c4 aufs: for v5.15-rc1, sync_inode() is gone
    66ec0c509225 aufs: for v5.15-rc1, new param 'rcu' for ->get_acl()
    69709dc518cd aufs: for v5.15-rc1, no mand-lock anymore
    ada8fe9543e5 aufs: 5.14-20210906  ---> 5.14-20211018
    b77f7f3f394a Revert "aufs: adjust to v5.15 fs changes"
    81bdce5b5876 tick/nohz: WARN_ON --> WARN_ON_ONCE to prevent console saturation
    97c963889222 sched/isolation: really align nohz_full with rcu_nocbs
    871f23ad3627 Revert "ARM: defconfig: Enable ax88796c driver for Exynos boards"
    ffad0783dd5b ARM: config: multi v7: Regenerate defconifg
    5c1e1a1ff2d3 ARM: config: multi v7: Add renamed symbols
    badaf96564fe ARM: config: multi v7: Clean up enabled by default options
    34996040fc9b ARM: config: multi v7: Drop unavailable options
    7f685244afb3 powerpc/mm: Switch obsolete dssall to .long
    20301aeb1a64 riscv: fix build with binutils 2.38
    9df58d070506 powerpc/lib/sstep: fix 'ptesync' build error
    720b61fc400b x86_64_defconfig: Fix warnings
    02bf23d26bc4 arm64: defconfig: cleanup config options
    05914e2c87e5 arm: defconfig: drop unused POWER_AVS option
    ffb532fa19b9 aufs5: fix build against v5.15.3+
    a4b3abf4d96d qemux86: add configuration symbol to select values
    fee94ee09154 clear_warn_once: add a clear_warn_once= boot parameter
    3d8762d900d9 clear_warn_once: bind a timer to written reset value
    95faacac47e8 clear_warn_once: expand debugfs to include read support
    de20c4240018 perf: perf can not parser the backtrace of app in the 32bit system and 64bit kernel.
    0e4aacead9c1 perf: x86-32: explicitly include <errno.h>
    9ad92c11468e perf: mips64: Convert __u64 to unsigned long long
    09e7efe3e68a perf: fix bench numa compilation
    e79becc44fa6 perf: add SLANG_INC for slang.h
    b1033b588681 perf: add sgidefs.h to for mips builds
    cf9db484ac0b perf: change --root to --prefix for python install
    7fd052c2c562 perf: add 'libperl not found' warning
    27a437cdd469 perf: force include of <stdbool.h>
    3b99d21bec2f fat: don't use obsolete random32 call in namei_vfat
    a7e9293b506b FAT: Added FAT_NO_83NAME
    6fd0e71d9e5c FAT: Add CONFIG_VFAT_NO_CREATE_WITH_LONGNAMES option
    c379b0d324ae FAT: Add CONFIG_VFAT_FS_NO_DUALNAMES option
    538be0fdb124 aufs: adjust to v5.15 fs changes
    f45da75c8759 aufs5: core
    047f57e07e01 aufs5: standalone
    029fc15574c8 aufs5: mmap
    610d0192ee94 aufs5: base
    d4e428d0ec5f aufs5: kbuild
    eb067eca251a yaffs: replace IS_ERR with IS_ERR_OR_NULL to check both ERR and NULL
    286af18d0875 yaffs: fix -Wstringop-overread compile warning in yaffs_fix_null_name
    24d59a4e26a6 yaffs2: v5.12+ build fixups (not runtime tested)
    22c73536d5d7 yaffs: include blkdev.h
    506b7251bfb8 yaffs: fix misplaced variable declaration
    a0e26ff364dc yaffs2: v5.6 build fixups
    b10b1b2d169e yaffs2: fix memory leak when /proc/yaffs is read
    ad9adccbb214 yaffs: add strict check when call yaffs_internal_read_super
    2e3c3aec8279 yaffs: repair yaffs_get_mtd_device
    d662538516a7 yaffs: Fix build failure by handling inode i_version with proper atomic API
    70a6113ee2c7 yaffs2: fix memory leak in mount/umount
    3378e4a9e404 yaffs: Avoid setting any ACL releated xattr
    ec2284edddef Yaffs:check oob size before auto selecting Yaffs1
    c2a49874051c fs: yaffs2: replace CURRENT_TIME by other appropriate apis
    e9a5105a3e73 yaffs2: adjust to proper location of MS_RDONLY
    608807406f13 yaffs2: import git revision b4ce1bb (jan, 2020)
    89e660ece42c initramfs: allow an optional wrapper script around initramfs generation
    b179dbc9aa10 iwlwifi: select MAC80211_LEDS conditionally
    3fd5ca3673d0 net/dccp: make it depend on CONFIG_BROKEN (CVE-2020-16119)
    d1f6edbf0188 arm64/perf: Fix wrong cast that may cause wrong truncation
    d202fb2caf33 defconfigs: drop obselete options
    9a27e3b5f4e7 arm64/perf: fix backtrace for AAPCS with FP enabled
    e20d8cf019b4 linux-yocto: Handle /bin/awk issues
    b6d2a3dbbd3a uvesafb: provide option to specify timeout for task completion
    adb40f1e6a1a uvesafb: print error message when task timeout occurs
    f280a1ed0962 compiler.h: Undef before redefining __attribute_const__
    4352732f268c vmware: include jiffies.h
    7954a677968d Resolve jiffies wrapping about arp
    5f28a1035d95 nfs: Allow default io size to be configured.
    0d7260ad7106 check console device file on fs when booting
    900a12e37e0a mount_root: clarify error messages for when no rootfs found
    7b878cbea726 menuconfig,mconf-cfg: Allow specification of ncurses location
    6604fc1763b3 modpost: mask trivial warnings
    0d294adb09cb kbuild: exclude meta directory from distclean processing
    a097cdd95a9e powerpc: serialize image targets
    5db6ec39a0a3 arm: serialize build targets
    cbabca27905e crtsavres: fixups for 5.4+
    7fc7656ed403 powerpc/ptrace: Disable array-bounds warning with gcc8
    a5faac5a19a2 powerpc: Disable attribute-alias warnings from gcc8
    186c54665b67 powerpc: add crtsavres.o to archprepare for kbuild
    d1ea862964ca powerpc: kexec fix for powerpc64
    2ac35b89a0f9 powerpc: Add unwind information for SPE registers of E500 core
    2e1c348a28bb mips: vdso: fix 'jalr $t9' crash in vdso code
    ec57870b303a mips: Kconfig: add QEMUMIPS64 option
    6a81b3c08107 4kc cache tlb hazard: tlbp cache coherency
    74e3b2a21e54 malta uhci quirks: make allowance for slow 4k(e)c
    22e65b63d3b4 arm/Makefile: Fix systemtap
    b7f1ab59f19e vexpress: Pass LOADADDR to Makefile
    ce2800c73bf7 arm: ARM EABI socketcall
    019d142fd956 ARM: LPAE: Invalidate the TLB for module addresses during translation fault

Signed-off-by: Bruce Ashfield <bruce.ashfield@gmail.com>
---
 .../linux/linux-yocto-rt_5.15.bb              |  6 ++---
 .../linux/linux-yocto-tiny_5.15.bb            |  6 ++---
 meta/recipes-kernel/linux/linux-yocto_5.15.bb | 26 +++++++++----------
 3 files changed, 19 insertions(+), 19 deletions(-)

diff --git a/meta/recipes-kernel/linux/linux-yocto-rt_5.15.bb b/meta/recipes-kernel/linux/linux-yocto-rt_5.15.bb
index 9a616c6580..ee39aabbac 100644
--- a/meta/recipes-kernel/linux/linux-yocto-rt_5.15.bb
+++ b/meta/recipes-kernel/linux/linux-yocto-rt_5.15.bb
@@ -11,13 +11,13 @@ python () {
         raise bb.parse.SkipRecipe("Set PREFERRED_PROVIDER_virtual/kernel to linux-yocto-rt to enable it")
 }
 
-SRCREV_machine ?= "66fb50de38a98582ec630efde6e48779cf1ad8a9"
-SRCREV_meta ?= "567f0adb9d6462279d2e024153d0a8c3a3ff0551"
+SRCREV_machine ?= "282f09eae637932615463274dd0c76a862a7c3d8"
+SRCREV_meta ?= "150b4c5d88b91e848d757c8cad9d841b91163b75"
 
 SRC_URI = "git://git.yoctoproject.org/linux-yocto.git;branch=${KBRANCH};name=machine \
            git://git.yoctoproject.org/yocto-kernel-cache;type=kmeta;name=meta;branch=yocto-5.15;destsuffix=${KMETA}"
 
-LINUX_VERSION ?= "5.15.166"
+LINUX_VERSION ?= "5.15.167"
 
 LIC_FILES_CHKSUM = "file://COPYING;md5=6bc538ed5bd9a7fc9398086aedcd7e46"
 
diff --git a/meta/recipes-kernel/linux/linux-yocto-tiny_5.15.bb b/meta/recipes-kernel/linux/linux-yocto-tiny_5.15.bb
index bb64fc455d..7d3a73d109 100644
--- a/meta/recipes-kernel/linux/linux-yocto-tiny_5.15.bb
+++ b/meta/recipes-kernel/linux/linux-yocto-tiny_5.15.bb
@@ -5,7 +5,7 @@ KCONFIG_MODE = "--allnoconfig"
 
 require recipes-kernel/linux/linux-yocto.inc
 
-LINUX_VERSION ?= "5.15.166"
+LINUX_VERSION ?= "5.15.167"
 LIC_FILES_CHKSUM = "file://COPYING;md5=6bc538ed5bd9a7fc9398086aedcd7e46"
 
 DEPENDS += "${@bb.utils.contains('ARCH', 'x86', 'elfutils-native', '', d)}"
@@ -14,8 +14,8 @@ DEPENDS += "openssl-native util-linux-native"
 KMETA = "kernel-meta"
 KCONF_BSP_AUDIT_LEVEL = "2"
 
-SRCREV_machine ?= "38da3ed27e665b67bab0063860ee41eb65d77a37"
-SRCREV_meta ?= "567f0adb9d6462279d2e024153d0a8c3a3ff0551"
+SRCREV_machine ?= "f280216b8c5a4795f402e24a31689a6d492d078e"
+SRCREV_meta ?= "150b4c5d88b91e848d757c8cad9d841b91163b75"
 
 PV = "${LINUX_VERSION}+git${SRCPV}"
 
diff --git a/meta/recipes-kernel/linux/linux-yocto_5.15.bb b/meta/recipes-kernel/linux/linux-yocto_5.15.bb
index 377ae22e80..9ac3e8368d 100644
--- a/meta/recipes-kernel/linux/linux-yocto_5.15.bb
+++ b/meta/recipes-kernel/linux/linux-yocto_5.15.bb
@@ -14,24 +14,24 @@ KBRANCH:qemux86  ?= "v5.15/standard/base"
 KBRANCH:qemux86-64 ?= "v5.15/standard/base"
 KBRANCH:qemumips64 ?= "v5.15/standard/mti-malta64"
 
-SRCREV_machine:qemuarm ?= "b289f21c7b9243734e00379101f3c95ebb141a5b"
-SRCREV_machine:qemuarm64 ?= "37bacb1a9110a39a0e993b74136209f78706a803"
-SRCREV_machine:qemumips ?= "c94b9753f5b0c765642d735b691247d2c1fb839d"
-SRCREV_machine:qemuppc ?= "c8834e0bad0de37a2d70a07fdc52e7460d685611"
-SRCREV_machine:qemuriscv64 ?= "a78a1043113066981d74825afce38bca3063664f"
-SRCREV_machine:qemuriscv32 ?= "a78a1043113066981d74825afce38bca3063664f"
-SRCREV_machine:qemux86 ?= "a78a1043113066981d74825afce38bca3063664f"
-SRCREV_machine:qemux86-64 ?= "a78a1043113066981d74825afce38bca3063664f"
-SRCREV_machine:qemumips64 ?= "28da2017909cb5a715a71c53654cc098e61821cd"
-SRCREV_machine ?= "a78a1043113066981d74825afce38bca3063664f"
-SRCREV_meta ?= "567f0adb9d6462279d2e024153d0a8c3a3ff0551"
+SRCREV_machine:qemuarm ?= "6eac800fa7a11f4de7a74b578efa0bba47360ded"
+SRCREV_machine:qemuarm64 ?= "866724b5bb6c32f16adb648e4b251227b711ea07"
+SRCREV_machine:qemumips ?= "bbb3f06bae8f8954e6725a75fd693512d91c5f29"
+SRCREV_machine:qemuppc ?= "3e7fae8f2bf9a92ae8c0f7036a070c1e6c5da47c"
+SRCREV_machine:qemuriscv64 ?= "52f5ff9f0af8d552aa6307143e74659e1e21fe6d"
+SRCREV_machine:qemuriscv32 ?= "52f5ff9f0af8d552aa6307143e74659e1e21fe6d"
+SRCREV_machine:qemux86 ?= "52f5ff9f0af8d552aa6307143e74659e1e21fe6d"
+SRCREV_machine:qemux86-64 ?= "52f5ff9f0af8d552aa6307143e74659e1e21fe6d"
+SRCREV_machine:qemumips64 ?= "b8b0a5ddb82108f0cf62676b91a757d233f6fec8"
+SRCREV_machine ?= "52f5ff9f0af8d552aa6307143e74659e1e21fe6d"
+SRCREV_meta ?= "150b4c5d88b91e848d757c8cad9d841b91163b75"
 
 # set your preferred provider of linux-yocto to 'linux-yocto-upstream', and you'll
 # get the <version>/base branch, which is pure upstream -stable, and the same
 # meta SRCREV as the linux-yocto-standard builds. Select your version using the
 # normal PREFERRED_VERSION settings.
 BBCLASSEXTEND = "devupstream:target"
-SRCREV_machine:class-devupstream ?= "14e468424d3edcf23167133d6ee2f3e3c6c5a022"
+SRCREV_machine:class-devupstream ?= "3a5928702e7120f83f703fd566082bfb59f1a57e"
 PN:class-devupstream = "linux-yocto-upstream"
 KBRANCH:class-devupstream = "v5.15/base"
 
@@ -39,7 +39,7 @@ SRC_URI = "git://git.yoctoproject.org/linux-yocto.git;name=machine;branch=${KBRA
            git://git.yoctoproject.org/yocto-kernel-cache;type=kmeta;name=meta;branch=yocto-5.15;destsuffix=${KMETA}"
 
 LIC_FILES_CHKSUM = "file://COPYING;md5=6bc538ed5bd9a7fc9398086aedcd7e46"
-LINUX_VERSION ?= "5.15.166"
+LINUX_VERSION ?= "5.15.167"
 
 DEPENDS += "${@bb.utils.contains('ARCH', 'x86', 'elfutils-native', '', d)}"
 DEPENDS += "openssl-native util-linux-native"
-- 
2.39.2


