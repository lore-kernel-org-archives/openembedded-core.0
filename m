Return-Path: <steve@sakoman.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 71B56C6FD1C
	for <webhook@archiver.kernel.org>; Thu,  9 Mar 2023 22:58:25 +0000 (UTC)
Received: from mail-pl1-f174.google.com (mail-pl1-f174.google.com [209.85.214.174])
 by mx.groups.io with SMTP id smtpd.web11.5722.1678402705090102212
 for <openembedded-core@lists.openembedded.org>;
 Thu, 09 Mar 2023 14:58:25 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@sakoman-com.20210112.gappssmtp.com header.s=20210112 header.b=FdizllDe;
 spf=softfail (domain: sakoman.com, ip: 209.85.214.174, mailfrom: steve@sakoman.com)
Received: by mail-pl1-f174.google.com with SMTP id a2so3681414plm.4
        for <openembedded-core@lists.openembedded.org>; Thu, 09 Mar 2023 14:58:25 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=sakoman-com.20210112.gappssmtp.com; s=20210112; t=1678402704;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=Rv7BmTTOwn8zMRnnKP2aixyEI951H0ZrkIWedGnTrzU=;
        b=FdizllDeYy63VBoCoI91eTSmDkUR7ugtm+89dcrl07yzgnrhM/8Y+mTMxvDgzV3qS+
         fbupVq0LDsZ0umUZU+joYtmXpGO1HxbMSemGSg2wovR402Q8Y8M1nAvOt9pyKrs935iu
         VE285Sg5AZiXPCSjQ6n2x5qDSFzkHx2VY8TtzEVnarxNhyHQgP/pxCjAnZM+Y3GmrnYE
         znRAQLSEPHR/jD8tIFN9mpieAvVD3Dr2v3++SmTua0Tf1o6UxYKM/01OYjblFx/lL8Km
         fLEfT1lg3LolE4FNhw+yBoNi3M4Gnmr9NfXJa5UcGlFFgSBMPkDgd7Lu7NevNRnw+kEi
         AWlQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112; t=1678402704;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=Rv7BmTTOwn8zMRnnKP2aixyEI951H0ZrkIWedGnTrzU=;
        b=ZAOVvDYqXnREiOmnVOg6H7LW1xyrBIEfuWtrpuZaxOslqA66qtWvvILPjtWIx0xpbU
         kx2ZkfB5vHKfLbTERVfBYfzuxKhvyral+hVjNuWsXqFg1Y0QGpSHCKNnt7akEe8Pa6c/
         lDIRN55vxayxevgTHhAO4dKCImnPIvrJWSxg0Zk2bBAPfhiyq0nbxD2K4lREvZCTY8J+
         KCDYQ5uQs85N6ysVcoKLsqQ/7Hno/QrZFAg5UWGz65VYAZ904BE1Z+QeWIvJNIRarsD8
         7/zWBErSXsXBQr2MwaUushiSu6zMfImHHVN6VchfMFX/x+eNuZbxajYv20af73G9hMxh
         TDfw==
X-Gm-Message-State: AO0yUKXE+B0eNN3v60AT394CCQi463WOK/fEzblAW9ZsPzl2yNZ4OY97
	ZSXoCvjpMUtFRVnXx8t9va9Wb9c3lWmx/5BETqw=
X-Google-Smtp-Source: AK7set+VL98yfmfQq73KspSFVQXLeK5K1L212VHBr0EWb3R32ePF55GNpOhgf6Xjd9mhGCXwH2lzDA==
X-Received: by 2002:a05:6a20:12c5:b0:cd:9654:d97d with SMTP id v5-20020a056a2012c500b000cd9654d97dmr24787061pzg.57.1678402703887;
        Thu, 09 Mar 2023 14:58:23 -0800 (PST)
Received: from hexa.router0800d9.com (dhcp-72-253-4-112.hawaiiantel.net. [72.253.4.112])
        by smtp.gmail.com with ESMTPSA id j9-20020aa79289000000b0058db8f8bce8sm89717pfa.166.2023.03.09.14.58.23
        for <openembedded-core@lists.openembedded.org>
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 09 Mar 2023 14:58:23 -0800 (PST)
From: Steve Sakoman <steve@sakoman.com>
To: openembedded-core@lists.openembedded.org
Subject: [OE-core][langdale 07/27] linux-yocto/5.15: update to v5.15.94
Date: Thu,  9 Mar 2023 12:57:42 -1000
Message-Id: <a8ff2a34fb901ceac325667882ca29f9c0c0d1ba.1678401759.git.steve@sakoman.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <cover.1678401759.git.steve@sakoman.com>
References: <cover.1678401759.git.steve@sakoman.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Thu, 09 Mar 2023 22:58:25 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/178280

From: Bruce Ashfield <bruce.ashfield@gmail.com>

Updating  to the latest korg -stable release that comprises
the following commits:

    e2c1a934fd8e Linux 5.15.94
    17170acdc7c8 Documentation/hw-vuln: Add documentation for Cross-Thread Return Predictions
    5122e0e44363 KVM: x86: Mitigate the cross-thread return address predictions bug
    8f12dcab90e8 x86/speculation: Identify processors vulnerable to SMT RSB predictions
    e63c434de8b6 drm/i915: Fix VBT DSI DVO port handling
    fc88c6838183 drm/i915: Initialize the obj flags for shmem objects
    2e557c8ca2c5 drm/amdgpu/fence: Fix oops due to non-matching drm_sched init/fini
    3af734f3eac6 Fix page corruption caused by racy check in __free_pages
    c94ce5ea68dc arm64: dts: meson-axg: Make mmc host controller interrupts level-sensitive
    b796c02df37e arm64: dts: meson-g12-common: Make mmc host controller interrupts level-sensitive
    5d9b771f53c1 arm64: dts: meson-gx: Make mmc host controller interrupts level-sensitive
    ac39dce11912 rtmutex: Ensure that the top waiter is always woken up
    86f7e4239336 powerpc/64s/interrupt: Fix interrupt exit race with security mitigation switch
    2907cf3f2ec7 riscv: Fixup race condition on PG_dcache_clean in flush_icache_pte
    beb1cefa3ccd ceph: flush cap releases when the session is flushed
    86733ab23933 clk: ingenic: jz4760: Update M/N/OD calculation algorithm
    239e927eb2ea usb: typec: altmodes/displayport: Fix probe pin assign check
    48aecce116e4 usb: core: add quirk for Alcor Link AK9563 smartcard reader
    a8178bb1c776 btrfs: free device in btrfs_close_devices for a single device filesystem
    8d13f2c3e2ba mptcp: be careful on subflow status propagation on errors
    25141fb41191 net: USB: Fix wrong-direction WARNING in plusb.c
    d1fba1e096ff cifs: Fix use-after-free in rdata->read_into_pages()
    1b83e7e174d8 pinctrl: intel: Restore the pins that used to be in Direct IRQ mode
    f5f025b703e2 spi: dw: Fix wrong FIFO level setting for long xfers
    71668706fbe7 pinctrl: single: fix potential NULL dereference
    a2a1065739e9 pinctrl: aspeed: Fix confusing types in return value
    99450163bcf6 pinctrl: mediatek: Fix the drive register definition of some Pins
    9f0d2c268488 ASoC: topology: Return -ENOMEM on memory allocation failure
    1a52ef89e369 riscv: stacktrace: Fix missing the first frame
    5fb815433450 ALSA: pci: lx6464es: fix a debug loop
    105ea562f6cf selftests: forwarding: lib: quote the sysctl values
    528e3f3a4b53 rds: rds_rm_zerocopy_callback() use list_first_entry()
    48d6d8f2f609 igc: Add ndo_tx_timeout support
    62ff7dd961ab net/mlx5: Serialize module cleanup with reload and remove
    95d2394f84f1 net/mlx5: fw_tracer, Zero consumer index when reloading the tracer
    ab7f3f6a9d9b net/mlx5: fw_tracer, Clear load bit when freeing string DBs buffers
    193528646ed2 net/mlx5e: IPoIB, Show unknown speed instead of error
    7c6e8eb617c1 net/mlx5: Bridge, fix ageing of peer FDB entries
    49ece61a078f net/mlx5e: Update rx ring hw mtu upon each rx-fcs flag change
    31172267bab0 net/mlx5e: Introduce the mlx5e_flush_rq function
    e4e4e93d31b3 net/mlx5e: Move repeating clear_bit in mlx5e_rx_reporter_err_rq_cqe_recover
    3f18b9ed8c83 net: mscc: ocelot: fix VCAP filters not matching on MAC with "protocol 802.1Q"
    6acb5d853b41 net: dsa: mt7530: don't change PVC_EG_TAG when CPU port becomes VLAN-aware
    ca834a017851 ice: Do not use WQ_MEM_RECLAIM flag for workqueue
    70d48c7992ca uapi: add missing ip/ipv6 header dependencies for linux/stddef.h
    3cec44036f48 ionic: clean interrupt before enabling queue to avoid credit race
    fad12afe877a net: phy: meson-gxl: use MMD access dummy stubs for GXL, internal PHY
    d23385a200e6 bonding: fix error checking in bond_debug_reregister()
    11006d9d083f net: phylink: move phy_device_free() to correctly release phy device
    fb022d7b1c79 xfrm: fix bug with DSCP copy to v6 from v4 tunnel
    6fe1ad42afa8 RDMA/usnic: use iommu_map_atomic() under spin_lock()
    8f5fe1cd8e6a RDMA/irdma: Fix potential NULL-ptr-dereference
    1b4ef90cbcfa IB/IPoIB: Fix legacy IPoIB due to wrong number of queues
    5dc688fae6b7 xfrm/compat: prevent potential spectre v1 gadget in xfrm_xlate32_attr()
    9bae58d58b6b IB/hfi1: Restore allocated resources on failed copyout
    558b1fa01cdc xfrm: compat: change expression for switch in xfrm_xlate64
    238b38e89fff can: j1939: do not wait 250 ms if the same addr was already claimed
    d859184b60d4 of/address: Return an error when no valid dma-ranges are found
    70f37b3118de tracing: Fix poll() and select() do not work on per_cpu trace_pipe and trace_pipe_raw
    df017495039a ALSA: hda/realtek: Enable mute/micmute LEDs on HP Elitebook, 645 G9
    ca9d54220345 ALSA: hda/realtek: Fix the speaker output on Samsung Galaxy Book2 Pro 360
    706b6d86a6f8 ALSA: emux: Avoid potential array out-of-bound in snd_emux_xg_control()
    731fc29de6a2 ALSA: hda/realtek: Add Positivo N14KP6-TG
    b93805980714 btrfs: zlib: zero-initialize zlib workspace
    e65faa7e39a2 btrfs: limit device extents to the device size
    2e4dd07fda7a migrate: hugetlb: check for hugetlb shared PMD in node migration
    072e7412e857 mm/migration: return errno when isolate_huge_page failed
    85d7786c66b6 Linux 5.15.93
    6e2fac197de2 bpf: Skip invalid kfunc call in backtrack_insn
    46c9088cabd4 gfs2: Always check inode size of inline inodes
    8eb2e58a92e0 gfs2: Cosmetic gfs2_dinode_{in,out} cleanup
    e4991910f150 wifi: brcmfmac: Check the count value of channel spec to prevent out-of-bounds reads
    97ccfffcc061 f2fs: fix to do sanity check on i_extra_isize in is_alive()
    64fa364ad324 fbdev: smscufx: fix error handling code in ufx_usb_probe
    a77141a06367 ovl: Use "buf" flexible array for memcpy() destination
    1692fedd0f66 fs/ntfs3: Validate attribute data and valid sizes
    a5b9cb72769b powerpc/imc-pmu: Revert nest_init_lock to being a mutex
    3691f43a0959 iio:adc:twl6030: Enable measurement of VAC
    8c84f50390b2 bpf: Do not reject when the stack read size is different from the tracked scalar size
    14b6198abbd5 bpf: Fix incorrect state pruning for <8B spill/fill
    575a9f6fefd9 phy: qcom-qmp-combo: fix runtime suspend
    e58df87394be phy: qcom-qmp-combo: fix broken power on
    368ea32e0ad0 phy: qcom-qmp-usb: fix memleak on probe deferral
    2f27d3811a41 phy: qcom-qmp-combo: fix memleak on probe deferral
    0cb10ddab7df phy: qcom-qmp-combo: disable runtime PM on unbind
    0ef5ffe11682 serial: 8250_dma: Fix DMA Rx rearm race
    e30328f599b9 serial: 8250_dma: Fix DMA Rx completion race
    a5a171f61a04 nvmem: core: fix cell removal on error
    6d9fa3ff6548 nvmem: core: remove nvmem_config wp_gpio
    adf80e072c95 nvmem: core: initialise nvmem->id early
    e3ebc3e23bd9 drm/i915: Fix potential bit_17 double-free
    997bed0f3cde Squashfs: fix handling and sanity checking of xattr_ids count
    7a0cfaf9d457 highmem: round down the address passed to kunmap_flush_on_unmap()
    5dbe1ebd5647 mm/swapfile: add cond_resched() in get_swap_pages()
    daf82418045f fpga: stratix10-soc: Fix return value check in s10_ops_write_init()
    afd32b683154 x86/debug: Fix stack recursion caused by wrongly ordered DR7 accesses
    066ecbf1a53e kernel/irq/irqdomain.c: fix memory leak with using debugfs_lookup()
    481bf49f58bb usb: gadget: f_uac2: Fix incorrect increment of bNumEndpoints
    fdf40e582442 mm: hugetlb: proc: check for hugetlb shared PMD in /proc/PID/smaps
    6c300351c55d riscv: disable generation of unwind tables
    a5c275add96b parisc: Wire up PTRACE_GETREGS/PTRACE_SETREGS for compat case
    a964decd1307 parisc: Fix return code of pdc_iodc_print()
    488eaf0625d9 nvmem: qcom-spmi-sdam: fix module autoloading
    8569beb66fe6 iio: imu: fxos8700: fix MAGN sensor scale and unit
    8aa5cdcfaf6a iio: imu: fxos8700: remove definition FXOS8700_CTRL_ODR_MIN
    4112ba1ad5ca iio: imu: fxos8700: fix failed initialization ODR mode assignment
    abf7b2ba51f5 iio: imu: fxos8700: fix incorrect ODR mode readback
    412757741c22 iio: imu: fxos8700: fix swapped ACCEL and MAGN channels readback
    34909532b12e iio: imu: fxos8700: fix map label of channel type to MAGN sensor
    8346eb4987e5 iio: imu: fxos8700: fix IMU data bits returned to user space
    7567cdf3ce21 iio: imu: fxos8700: fix incomplete ACCEL and MAGN channels readback
    6969852220af iio: imu: fxos8700: fix ACCEL measurement range selection
    cdacfb220556 iio:adc:twl6030: Enable measurements of VUSB, VBAT and others
    9988063dcefd iio: adc: berlin2-adc: Add missing of_node_put() in error path
    c691a5c0fd03 iio: hid: fix the retval in gyro_3d_capture_sample
    ef80a34699cd iio: hid: fix the retval in accel_3d_capture_sample
    c4eae85c73be efi: Accept version 2 of memory attributes table
    710db8206351 ALSA: hda/realtek: Add Acer Predator PH315-54
    3fbddf86d924 watchdog: diag288_wdt: fix __diag288() inline assembly
    700dd5bc72d3 watchdog: diag288_wdt: do not use stack buffers for hardware data
    21bc51e29e66 net: qrtr: free memory on error path in radix_tree_insert()
    dccbd062d716 fbcon: Check font dimension limits
    5d7500d99164 Input: i8042 - add Clevo PCX0DX to i8042 quirk table
    fc9e27f3ba08 vc_screen: move load of struct vc_data pointer in vcs_read() to avoid UAF
    9ba1188a719a usb: gadget: f_fs: Fix unbalanced spinlock in __ffs_ep0_queue_wait
    fe86480e903f usb: dwc3: qcom: enable vbus override when in OTG dr-mode
    a412fe7baf40 iio: adc: stm32-dfsdm: fill module aliases
    994465939830 drm/amd/display: Fix timing not changning when freesync video is enabled
    a3967128bc65 net/x25: Fix to not accept on connected socket
    396ea318e7fa platform/x86: gigabyte-wmi: add support for B450M DS3H WIFI-CF
    1577524633c7 platform/x86: dell-wmi: Add a keymap for KEY_MUTE in type 0x0010 table
    540cea9f9b6d i2c: rk3x: fix a bunch of kernel-doc warnings
    0aaabdb900c7 scsi: iscsi_tcp: Fix UAF during login when accessing the shost ipaddress
    17b738590b97 scsi: iscsi_tcp: Fix UAF during logout when accessing the shost ipaddress
    8cd0499f9c33 perf/x86/intel: Add Emerald Rapids
    709351537096 scsi: target: core: Fix warning on RT kernels
    b7960f54362b i2c: mxs: suppress probe-deferral error message
    b9b87fc34b7f i2c: designware-pci: Add new PCI IDs for AMD NAVI GPU
    d8fc0b5fb3e8 efi: fix potential NULL deref in efi_mem_reserve_persistent
    f423c2efd51d net: openvswitch: fix flow memory leak in ovs_flow_cmd_new
    798502864789 virtio-net: Keep stop() to follow mirror sequence of open()
    5d884f9e80ff selftests: net: udpgso_bench_tx: Cater for pending datagrams zerocopy benchmarking
    63aa63af3a1e selftests: net: udpgso_bench: Fix racing bug between the rx/tx programs
    d41a3f9cc242 selftests: net: udpgso_bench_rx/tx: Stop when wrong CLI args are provided
    5af98283e554 selftests: net: udpgso_bench_rx: Fix 'used uninitialized' compiler warning
    89e0701e03c5 ata: libata: Fix sata_down_spd_limit() when no link speed is reported
    9ab896775f98 can: j1939: fix errant WARN_ON_ONCE in j1939_session_deactivate
    02d77d98e020 igc: return an error if the mac type is unknown in igc_ptp_systim_to_hwtstamp()
    04a735582095 riscv: kprobe: Fixup kernel panic when probing an illegal position
    206c367b6a2e ip/ip6_gre: Fix non-point-to-point tunnel not generating IPv6 link local address
    90178bc0f28f ip/ip6_gre: Fix changing addr gen mode not generating IPv6 link local address
    dfe2f0ea3851 net: phy: meson-gxl: Add generic dummy stubs for MMD register access
    b7398efe24a9 squashfs: harden sanity check in squashfs_read_xattr_id_table
    89a69216f170 netfilter: br_netfilter: disable sabotage_in hook after first suppression
    cdb444e73fdc drm/i915/adlp: Fix typo for reference clock
    960f20d8582e drm/i915/guc: Fix locking when searching for a hung request
    c27e0eac568a netrom: Fix use-after-free caused by accept on already connected socket
    511c922c5bf6 block, bfq: fix uaf for bfqq in bic_set_bfqq()
    a62c129dcbfa block, bfq: replace 0/1 with false/true in bic apis
    37a744a068c9 block/bfq-iosched.c: use "false" rather than "BLK_RW_ASYNC"
    2cd1e9c013ec net: phy: dp83822: Fix null pointer access on DP83825/DP83826 devices
    18c18c2110ea sfc: correctly advertise tunneled IPv6 segmentation
    878b06f60a08 dpaa2-eth: execute xdp_do_flush() before napi_complete_done()
    3b5774cd6b94 dpaa_eth: execute xdp_do_flush() before napi_complete_done()
    5a7040a649c8 virtio-net: execute xdp_do_flush() before napi_complete_done()
    94add5b27290 qede: execute xdp_do_flush() before napi_complete_done()
    a273f8e3ab90 ice: Prevent set_channel from changing queues while RDMA active
    b432e183c26e fix "direction" argument of iov_iter_kvec()
    d8b8306e963e fix iov_iter_bvec() "direction" argument
    389c7c0ef9cc READ is "data destination", not source...
    7a3649bf5bef WRITE is "data source", not destination...
    83cc6a7bb75c vhost/net: Clear the pending messages when the backend is removed
    7c7d344bc386 scsi: Revert "scsi: core: map PQ=1, PDT=other values to SCSI_SCAN_TARGET_PRESENT"
    4b199dc09416 drm/vc4: hdmi: make CEC adapter name unique
    dc1f8ab25a17 arm64: dts: imx8mm: Fix pad control for UART1_DTE_RX
    c681d7a4ed3d bpf, sockmap: Check for any of tcp_bpf_prots when cloning a listener
    34ad5d8885f5 bpf: Fix to preserve reg parent/live fields when copying range info
    7b86f9ab5692 bpf: Support <8-byte scalar spill and refill
    1b9256c96220 ALSA: hda/via: Avoid potential array out-of-bound in add_secret_dac_path()
    b7abeb691637 bpf: Fix a possible task gone issue with bpf_send_signal[_thread]() helpers
    cfcc2390dbc5 ASoC: Intel: bytcr_wm5102: Drop reference count of ACPI device after use
    b4b204565a45 ASoC: Intel: bytcr_rt5640: Drop reference count of ACPI device after use
    1f1e7635c54d ASoC: Intel: bytcr_rt5651: Drop reference count of ACPI device after use
    41d323c352ac ASoC: Intel: bytcht_es8316: Drop reference count of ACPI device after use
    6a9990e1d92b ASoC: Intel: bytcht_es8316: move comment to the right place
    ffcdf354555b ASoC: Intel: boards: fix spelling in comments
    bd0b17ab1b76 bus: sunxi-rsb: Fix error handling in sunxi_rsb_init()
    5f4543c9382a firewire: fix memory leak for payload of request subaction to IEC 61883-1 FCP region
    e515b9902f5f Linux 5.15.92
    c7caf669b89d net: mctp: purge receive queues on sk destruction
    046de74f9af9 net: fix NULL pointer in skb_segment_list
    7ab3376703ce selftests: Provide local define of __cpuid_count()
    e92e311ced6f selftests/vm: remove ARRAY_SIZE define from individual tests
    c9e52db90031 tools: fix ARRAY_SIZE defines in tools and selftests hdrs
    c1aa0dd52db4 Bluetooth: fix null ptr deref on hci_sync_conn_complete_evt
    02e61196c578 ACPI: processor idle: Practically limit "Dummy wait" workaround to old Intel systems
    79dd676b445f extcon: usbc-tusb320: fix kernel-doc warning
    c2bd60ef20de ext4: fix bad checksum after online resize
    4cd1e18bc04a cifs: fix return of uninitialized rc in dfs_cache_update_tgthint()
    43acd767bd90 dmaengine: imx-sdma: Fix a possible memory leak in sdma_transfer_init
    a54c5ad007ea HID: playstation: sanity check DualSense calibration data.
    6d7686cc11b7 blk-cgroup: fix missing pd_online_fn() while activating policy
    2144859229c1 erofs/zmap.c: Fix incorrect offset calculation
    0dfef5031335 bpf: Skip task with pid=1 in send_signal_common()
    e8bb772f745e firmware: arm_scmi: Clear stale xfer->hdr.status
    80cb9f1a76aa arm64: dts: imx8mq-thor96: fix no-mmc property for SDHCI
    162fad24d2e1 arm64: dts: freescale: Fix pca954x i2c-mux node names
    82ad105e1a55 ARM: dts: vf610: Fix pca9548 i2c-mux node names
    5aee5f33e03a ARM: dts: imx: Fix pca9547 i2c-mux node name

Signed-off-by: Bruce Ashfield <bruce.ashfield@gmail.com>
Signed-off-by: Alexandre Belloni <alexandre.belloni@bootlin.com>
(cherry picked from commit f5deb914ba17c131c4880da8d9a1184c2d2a3ef6)
Signed-off-by: Steve Sakoman <steve@sakoman.com>
---
 .../linux/linux-yocto-rt_5.15.bb              |  6 ++---
 .../linux/linux-yocto-tiny_5.15.bb            |  6 ++---
 meta/recipes-kernel/linux/linux-yocto_5.15.bb | 26 +++++++++----------
 3 files changed, 19 insertions(+), 19 deletions(-)

diff --git a/meta/recipes-kernel/linux/linux-yocto-rt_5.15.bb b/meta/recipes-kernel/linux/linux-yocto-rt_5.15.bb
index 8d299ca059..62cf6c2023 100644
--- a/meta/recipes-kernel/linux/linux-yocto-rt_5.15.bb
+++ b/meta/recipes-kernel/linux/linux-yocto-rt_5.15.bb
@@ -11,13 +11,13 @@ python () {
         raise bb.parse.SkipRecipe("Set PREFERRED_PROVIDER_virtual/kernel to linux-yocto-rt to enable it")
 }
 
-SRCREV_machine ?= "0567deb52d2f2c3cd3046f56ca3fb97a151cf6ec"
-SRCREV_meta ?= "8df0d345ef202197eef82942933161213d4d1846"
+SRCREV_machine ?= "0e479ee9b51bb384ce793fe55b05e8c2c3d3041a"
+SRCREV_meta ?= "3dd458be964635c8e682a1fb6f9a3368a747f92b"
 
 SRC_URI = "git://git.yoctoproject.org/linux-yocto.git;branch=${KBRANCH};name=machine \
            git://git.yoctoproject.org/yocto-kernel-cache;type=kmeta;name=meta;branch=yocto-5.15;destsuffix=${KMETA}"
 
-LINUX_VERSION ?= "5.15.91"
+LINUX_VERSION ?= "5.15.94"
 
 LIC_FILES_CHKSUM = "file://COPYING;md5=6bc538ed5bd9a7fc9398086aedcd7e46"
 
diff --git a/meta/recipes-kernel/linux/linux-yocto-tiny_5.15.bb b/meta/recipes-kernel/linux/linux-yocto-tiny_5.15.bb
index 400ef75cc2..d91dc0bea8 100644
--- a/meta/recipes-kernel/linux/linux-yocto-tiny_5.15.bb
+++ b/meta/recipes-kernel/linux/linux-yocto-tiny_5.15.bb
@@ -5,7 +5,7 @@ KCONFIG_MODE = "--allnoconfig"
 
 require recipes-kernel/linux/linux-yocto.inc
 
-LINUX_VERSION ?= "5.15.91"
+LINUX_VERSION ?= "5.15.94"
 LIC_FILES_CHKSUM = "file://COPYING;md5=6bc538ed5bd9a7fc9398086aedcd7e46"
 
 DEPENDS += "${@bb.utils.contains('ARCH', 'x86', 'elfutils-native', '', d)}"
@@ -14,8 +14,8 @@ DEPENDS += "openssl-native util-linux-native"
 KMETA = "kernel-meta"
 KCONF_BSP_AUDIT_LEVEL = "2"
 
-SRCREV_machine ?= "01c387906b52214892aaea0664b3b4ead35fe484"
-SRCREV_meta ?= "8df0d345ef202197eef82942933161213d4d1846"
+SRCREV_machine ?= "8c906f7637d74bde62e074f6d8be8e6bd180cd47"
+SRCREV_meta ?= "3dd458be964635c8e682a1fb6f9a3368a747f92b"
 
 PV = "${LINUX_VERSION}+git${SRCPV}"
 
diff --git a/meta/recipes-kernel/linux/linux-yocto_5.15.bb b/meta/recipes-kernel/linux/linux-yocto_5.15.bb
index 60c088b9fe..033e7b0e24 100644
--- a/meta/recipes-kernel/linux/linux-yocto_5.15.bb
+++ b/meta/recipes-kernel/linux/linux-yocto_5.15.bb
@@ -13,24 +13,24 @@ KBRANCH:qemux86  ?= "v5.15/standard/base"
 KBRANCH:qemux86-64 ?= "v5.15/standard/base"
 KBRANCH:qemumips64 ?= "v5.15/standard/mti-malta64"
 
-SRCREV_machine:qemuarm ?= "9c525056e4d5c3852fff6058bd7f6a648a3b645e"
-SRCREV_machine:qemuarm64 ?= "30e3bff02675a3d10bd04c51f52f4a6b17b94d01"
-SRCREV_machine:qemumips ?= "0dda96ab67034ee0f1db18c04fed33d2a4e2fec1"
-SRCREV_machine:qemuppc ?= "43c8d401cf8092c19e47935c5667dacf754885d4"
-SRCREV_machine:qemuriscv64 ?= "531238ba91af58291b5f306c237e6bc1b8b6633a"
-SRCREV_machine:qemuriscv32 ?= "531238ba91af58291b5f306c237e6bc1b8b6633a"
-SRCREV_machine:qemux86 ?= "531238ba91af58291b5f306c237e6bc1b8b6633a"
-SRCREV_machine:qemux86-64 ?= "531238ba91af58291b5f306c237e6bc1b8b6633a"
-SRCREV_machine:qemumips64 ?= "26e3543c62c04852896adc70584b1eaa59f15fad"
-SRCREV_machine ?= "531238ba91af58291b5f306c237e6bc1b8b6633a"
-SRCREV_meta ?= "8df0d345ef202197eef82942933161213d4d1846"
+SRCREV_machine:qemuarm ?= "56893626121030f0602bc416f300ca54e1135d8e"
+SRCREV_machine:qemuarm64 ?= "c5b37eefe0c4c0956d87d8469556ca295b55cab4"
+SRCREV_machine:qemumips ?= "1d8fd6769259a16d49aaf8d9c3eecd970343249e"
+SRCREV_machine:qemuppc ?= "6e2e7b94716f4547f6e5cfd47dc430f84f4b70a7"
+SRCREV_machine:qemuriscv64 ?= "abe44015db49980ca7a2e6125321c3e3666a0278"
+SRCREV_machine:qemuriscv32 ?= "abe44015db49980ca7a2e6125321c3e3666a0278"
+SRCREV_machine:qemux86 ?= "abe44015db49980ca7a2e6125321c3e3666a0278"
+SRCREV_machine:qemux86-64 ?= "abe44015db49980ca7a2e6125321c3e3666a0278"
+SRCREV_machine:qemumips64 ?= "27458775da7568a4844f438c7f1cd9fbf20a55f6"
+SRCREV_machine ?= "abe44015db49980ca7a2e6125321c3e3666a0278"
+SRCREV_meta ?= "3dd458be964635c8e682a1fb6f9a3368a747f92b"
 
 # set your preferred provider of linux-yocto to 'linux-yocto-upstream', and you'll
 # get the <version>/base branch, which is pure upstream -stable, and the same
 # meta SRCREV as the linux-yocto-standard builds. Select your version using the
 # normal PREFERRED_VERSION settings.
 BBCLASSEXTEND = "devupstream:target"
-SRCREV_machine:class-devupstream ?= "9cf4111cdf9420fa99792ae16c8de23242bb2e0b"
+SRCREV_machine:class-devupstream ?= "e2c1a934fd8e4288e7a32f4088ceaccf469eb74c"
 PN:class-devupstream = "linux-yocto-upstream"
 KBRANCH:class-devupstream = "v5.15/base"
 
@@ -38,7 +38,7 @@ SRC_URI = "git://git.yoctoproject.org/linux-yocto.git;name=machine;branch=${KBRA
            git://git.yoctoproject.org/yocto-kernel-cache;type=kmeta;name=meta;branch=yocto-5.15;destsuffix=${KMETA}"
 
 LIC_FILES_CHKSUM = "file://COPYING;md5=6bc538ed5bd9a7fc9398086aedcd7e46"
-LINUX_VERSION ?= "5.15.91"
+LINUX_VERSION ?= "5.15.94"
 
 DEPENDS += "${@bb.utils.contains('ARCH', 'x86', 'elfutils-native', '', d)}"
 DEPENDS += "openssl-native util-linux-native"
-- 
2.34.1


