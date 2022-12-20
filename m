Return-Path: <steve@sakoman.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id B273DC4167B
	for <webhook@archiver.kernel.org>; Tue, 20 Dec 2022 14:27:33 +0000 (UTC)
Received: from mail-ej1-f51.google.com (mail-ej1-f51.google.com [209.85.218.51])
 by mx.groups.io with SMTP id smtpd.web11.51410.1671546451347755190
 for <openembedded-core@lists.openembedded.org>;
 Tue, 20 Dec 2022 06:27:32 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@sakoman-com.20210112.gappssmtp.com header.s=20210112 header.b=W4JRJ0az;
 spf=softfail (domain: sakoman.com, ip: 209.85.218.51, mailfrom: steve@sakoman.com)
Received: by mail-ej1-f51.google.com with SMTP id u19so29582132ejm.8
        for <openembedded-core@lists.openembedded.org>; Tue, 20 Dec 2022 06:27:31 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=sakoman-com.20210112.gappssmtp.com; s=20210112;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:from:to:cc:subject:date:message-id:reply-to;
        bh=78/Nd/7Y0dMtEI3n++P1BUnnCcMW3dczgHQlKDG/FCo=;
        b=W4JRJ0azKsB/ExrV8NYaWto4JvuOilTmzFV+6CIa3U1wlgbHVMaigIdSW78nsgtcNN
         kgAmYpyVsfoIGw4wQMAWwaeK2Nvo2cpLtlANNhsamsLRa9G7Kkq9sg3Dkxw1Vx8YVa2t
         S98T5IH50hP2mxAsBqb50uhaQm8lIl9Hb5D4pdSokSsnSaASGEiveG4dSJGzgk5AaFpa
         NqdJrltIhJC2ho8wU6eAQwk7lu3R6P6jT/R8ZZ+MTfNtPZxuMLi981lkH9vQXaPwXW7E
         NJq+wxMSnnsaHXoyvW4KdAb9/GZl09+rSvVNenOepmhFilbh5vyz4eu0u3rqgPNCt9c2
         W0pA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=78/Nd/7Y0dMtEI3n++P1BUnnCcMW3dczgHQlKDG/FCo=;
        b=I1XH2PG22k+c0K3wk2/MDnfeyRFm/LA6NQ+ROKf9aiA49e9rjk//xoyDeswrWb0gPE
         Y5gjiOpgmwQYS+WN/q1eXPE58ftTwfUMdr4F3xmD4sbISZOBoTQ2l9EgC11BBhGUfFoK
         XNiMF9YTVPYXKjT/pd/2qUn6ikcI4bzKdILE3YJBkewlpQuDLviqN06bknB5qOg3MxEL
         HffVSPgWXU62zNh1MTg4Fnbq5S2OWSVDcDZDLe0dSaTkiQCti2fg1vmvlGmgYWHSxuZq
         +g2EWkOvexBptycAH5HlCELliHopQFznh0CpIINNT1xfyvYFMd30Uh3gR7Shz0iUYGGH
         k6kA==
X-Gm-Message-State: ANoB5pm/MCsFZb0oCS+WwbgAy+MaR+4dbuGvp3XZfkDnZ7VLHz8eugEY
	lsQ+nfNaPiARS8KmXCwoL4pP7Uj/ZEbe7M3FL6iKMw==
X-Google-Smtp-Source: AA0mqf5h3ipmRf8reDTVzPPP6hwHuuQihKX6Uo8Wjluh4WXcbwk25s/2Z9E8EI2Z4n/J6bClteUmvChhC35BmKNcw1w=
X-Received: by 2002:a17:906:99d1:b0:7c1:7808:c469 with SMTP id
 s17-20020a17090699d100b007c17808c469mr3486440ejn.584.1671546449413; Tue, 20
 Dec 2022 06:27:29 -0800 (PST)
MIME-Version: 1.0
References: <20221219174146.64696-1-bruce.ashfield@gmail.com> <20221219174146.64696-4-bruce.ashfield@gmail.com>
In-Reply-To: <20221219174146.64696-4-bruce.ashfield@gmail.com>
From: Steve Sakoman <steve@sakoman.com>
Date: Tue, 20 Dec 2022 04:27:18 -1000
Message-ID: <CAOSpxdbQ9SaCmMJddnFTyX3Z7p+seZO9vtGjYcDNUPSAWQOhzQ@mail.gmail.com>
Subject: Re: [PATCH 4/4][dunfell] linux-yocto/5.4: update to v5.4.228
To: bruce.ashfield@gmail.com
Cc: openembedded-core@lists.openembedded.org
Content-Type: text/plain; charset="UTF-8"
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Tue, 20 Dec 2022 14:27:33 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/174852

On Mon, Dec 19, 2022 at 7:41 AM <bruce.ashfield@gmail.com> wrote:
>
> From: Bruce Ashfield <bruce.ashfield@gmail.com>
>
> Updating  to the latest korg -stable release that comprises
> the following commits:
>
>     851c2b5fb793 Linux 5.4.228
>     ff484a9ba449 ASoC: ops: Correct bounds check for second channel on SX controls
>     7d4aa0929963 can: mcba_usb: Fix termination command argument
>     f843fdcac054 can: sja1000: fix size of OCR_MODE_MASK define
>     b439b12d1050 pinctrl: meditatek: Startup with the IRQs disabled
>     9796d07c7531 ASoC: ops: Check bounds for second channel in snd_soc_put_volsw_sx()
>     3c837460f920 nfp: fix use-after-free in area_cache_get()
>     a40c3c9ae58f block: unhash blkdev part inode when the part is deleted
>     176ba4c19d1b mm/hugetlb: fix races when looking up a CONT-PTE/PMD size hugetlb page
>     69d4f3baa694 x86/smpboot: Move rcu_cpu_starting() earlier
>     d1988bf2bba3 net: bpf: Allow TC programs to call BPF_FUNC_skb_change_head
>     66bb2e2b24ce Linux 5.4.227
>     898270ec11be can: esd_usb: Allow REC and TEC to return to zero
>     08bf219d62f5 net: mvneta: Fix an out of bounds check
>     6b6d3be3661b ipv6: avoid use-after-free in ip6_fragment()
>     f73eb3fc9b41 net: plip: don't call kfree_skb/dev_kfree_skb() under spin_lock_irq()
>     f0af234e2e55 xen/netback: fix build warning
>     99669d94ce14 ethernet: aeroflex: fix potential skb leak in greth_init_rings()
>     3295582cd7a5 ipv4: Fix incorrect route flushing when table ID 0 is used
>     2537b637eac0 ipv4: Fix incorrect route flushing when source address is deleted
>     36eedb9a05a7 tipc: Fix potential OOB in tipc_link_proto_rcv()
>     1b6360a093ab net: hisilicon: Fix potential use-after-free in hix5hd2_rx()
>     e71a46cc8c9a net: hisilicon: Fix potential use-after-free in hisi_femac_rx()
>     7081cf86e1f6 net: thunderx: Fix missing destroy_workqueue of nicvf_rx_mode_wq
>     bc06207b4c1c net: stmmac: fix "snps,axi-config" node property parsing
>     7fab7add08f5 nvme initialize core quirks before calling nvme_init_subsystem
>     677843470694 NFC: nci: Bounds check struct nfc_target arrays
>     e5292711b020 i40e: Disallow ip4 and ip6 l4_4_bytes
>     9337d87da417 i40e: Fix for VF MAC address 0
>     a1e295517b36 i40e: Fix not setting default xps_cpus after reset
>     eec1fc21edc2 net: mvneta: Prevent out of bounds read in mvneta_config_rss()
>     ed773dd798bf xen-netfront: Fix NULL sring after live migration
>     18e10a9e0e32 net: encx24j600: Fix invalid logic in reading of MISTAT register
>     1356c17758b8 net: encx24j600: Add parentheses to fix precedence
>     1831d4540406 mac802154: fix missing INIT_LIST_HEAD in ieee802154_if_add()
>     8fb4b50f5436 selftests: rtnetlink: correct xfrm policy rule in kci_test_ipsec_offload
>     0834d4b121e7 net: dsa: ksz: Check return value
>     2c6cf0afc385 Bluetooth: Fix not cleanup led when bt_init fails
>     07ea5d74fc12 Bluetooth: 6LoWPAN: add missing hci_dev_put() in get_l2cap_conn()
>     c66d78aee55d af_unix: Get user_ns from in_skb in unix_diag_get_exact().
>     9d2ee8abf160 igb: Allocate MSI-X vector when testing
>     cff8ba243f5f e1000e: Fix TX dispatch condition
>     48bd5d3801f6 gpio: amd8111: Fix PCI device reference count leak
>     d2be7ba2d47b drm/bridge: ti-sn65dsi86: Fix output polarity setting bug
>     e2e218177271 ca8210: Fix crash by zero initializing data
>     efbca8234aee ieee802154: cc2520: Fix error return code in cc2520_hw_init()
>     3982652957e8 can: af_can: fix NULL pointer dereference in can_rcv_filter
>     db1ed1b3fb4e HID: core: fix shift-out-of-bounds in hid_report_raw_event
>     60bce926a8f3 HID: hid-lg4ff: Add check for empty lbuf
>     625814b85f74 HID: usbhid: Add ALWAYS_POLL quirk for some mice
>     585a07b82005 drm/shmem-helper: Remove errant put in error path
>     b8419d16f47e KVM: s390: vsie: Fix the initialization of the epoch extension (epdx) field
>     04edfa3dc06e mm/gup: fix gup_pud_range() for dax
>     35963b318219 memcg: fix possible use-after-free in memcg_write_event_control()
>     4afc77068e36 media: v4l2-dv-timings.c: fix too strict blanking sanity checks
>     91516ba54a02 Revert "net: dsa: b53: Fix valid setting for MDB entries"
>     50e1ab7e638f xen/netback: don't call kfree_skb() with interrupts disabled
>     6b1d47f9c34b xen/netback: do some code cleanup
>     8fe1bf6f32cd xen/netback: Ensure protocol headers don't fall in the non-linear area
>     5ffc2a75534d mm/khugepaged: invoke MMU notifiers in shmem/file collapse paths
>     48b00ceb5472 mm/khugepaged: fix GUP-fast interaction by sending IPI
>     324abbd8b91c mm/khugepaged: take the right locks for page table retraction
>     b2963819d03b net: usb: qmi_wwan: add u-blox 0x1342 composition
>     e35c3ad0c208 9p/xen: check logical size for buffer size
>     9d5126b574c9 fbcon: Use kzalloc() in fbcon_prepare_logo()
>     102459222d41 regulator: twl6030: fix get status of twl6032 regulators
>     f2ba66d87385 ASoC: soc-pcm: Add NULL check in BE reparenting
>     3b2c064a8e11 btrfs: send: avoid unaligned encoded writes when attempting to clone range
>     63badfed2002 ALSA: seq: Fix function prototype mismatch in snd_seq_expand_var_event
>     8d16d3826ff2 regulator: slg51000: Wait after asserting CS pin
>     9327a9c624ee 9p/fd: Use P9_HDRSZ for header size
>     671f950d17d5 ARM: dts: rockchip: disable arm_global_timer on rk3066 and rk3188
>     2c2c5d1d10f7 ARM: 9266/1: mm: fix no-MMU ZERO_PAGE() implementation
>     29917e381e02 ARM: 9251/1: perf: Fix stacktraces for tracepoint events in THUMB2 kernels
>     3f39d53bc731 ARM: dts: rockchip: rk3188: fix lcdc1-rgb24 node name
>     135fcc458170 ARM: dts: rockchip: fix ir-receiver node names
>     368f2c2640be arm: dts: rockchip: fix node name for hym8563 rtc
>     4b346f07f064 arm64: dts: rockchip: keep I2S1 disabled for GPIO function on ROCK Pi 4 series
>     316cdfc48d4d Linux 5.4.226
>     3ab84e89135b ipc/sem: Fix dangling sem_array access in semtimedop race
>     210f96fb7ed5 v4l2: don't fall back to follow_pfn() if pin_user_pages_fast() fails
>     0390da0565ad proc: proc_skip_spaces() shouldn't think it is working on C strings
>     dd3124a051a1 proc: avoid integer type confusion in get_proc_long
>     1061bf5d018b mmc: sdhci: Fix voltage switch delay
>     9a5f49c0f532 mmc: sdhci: use FIELD_GET for preset value bit masks
>     d699373ac5f3 char: tpm: Protect tpm_pm_suspend with locks
>     9decec299337 Revert "clocksource/drivers/riscv: Events are stopped during CPU suspend"
>     e67e119adf3e x86/ioremap: Fix page aligned size calculation in __ioremap_caller()
>     0d87bb607036 Bluetooth: L2CAP: Fix accepting connection request for invalid SPSM
>     b5041a3daa7f x86/pm: Add enumeration check before spec MSRs save/restore setup
>     3b2859457688 x86/tsx: Add a feature bit for TSX control MSR support
>     99c59256ea00 nvme: ensure subsystem reset is single threaded
>     dc85ff0a5f32 nvme: restrict management ioctls to admin
>     c41a89af7b7a epoll: check for events when removing a timed out thread from the wait queue
>     b8e803cda58b epoll: call final ep_events_available() check under the lock
>     e65ac2bdda54 tracing/ring-buffer: Have polling block on watermark
>     899e148171c6 ipv4: Fix route deletion when nexthop info is not specified
>     cc3cd130ecfb ipv4: Handle attempt to delete multipath route when fib_info contains an nh reference
>     a14f1a9c5313 selftests: net: fix nexthop warning cleanup double ip typo
>     8aefb9329522 selftests: net: add delete nexthop route warning test
>     dd6d2d82f0be Kconfig.debug: provide a little extra FRAME_WARN leeway when KASAN is enabled
>     7da3a10f39c9 parisc: Increase FRAME_WARN to 2048 bytes on parisc
>     15568cdbe599 xtensa: increase size of gcc stack frame check
>     76f48511a1c8 parisc: Increase size of gcc stack frame check
>     cbdd83bd2fd6 iommu/vt-d: Fix PCI device refcount leak in dmar_dev_scope_init()
>     0090231df2cf pinctrl: single: Fix potential division by zero
>     73dce3c1d48c ASoC: ops: Fix bounds check for _sx controls
>     ced17a55a8e7 mm: Fix '.data.once' orphan section warning
>     c9ecc420941f arm64: errata: Fix KVM Spectre-v2 mitigation selection for Cortex-A57/A72
>     44ccd8c52fb7 arm64: Fix panic() when Spectre-v2 causes Spectre-BHB to re-allocate KVM vectors
>     1603feac154f tracing: Free buffers when a used dynamic event is removed
>     dcd1daad31ac mmc: sdhci-sprd: Fix no reset data and command after voltage switch
>     9e5581c772cf mmc: sdhci-esdhc-imx: correct CQHCI exit halt state check
>     bfdfe86d839f mmc: core: Fix ambiguous TRIM and DISCARD arg
>     040d08c99620 mmc: mmc_test: Fix removal of debugfs file
>     eb5001ecfb4f pinctrl: intel: Save and restore pins in "direct IRQ" mode
>     ae34a4f4a209 x86/bugs: Make sure MSR_SPEC_CTRL is updated properly upon resume from S3
>     9a130b72e6bd nilfs2: fix NULL pointer dereference in nilfs_palloc_commit_free_entry()
>     3ae3bb33c47e tools/vm/slabinfo-gnuplot: use "grep -E" instead of "egrep"
>     cf1c12bc5c8c error-injection: Add prompt for function error injection
>     2f6fd2de726d net/mlx5: DR, Fix uninitialized var warning
>     ea5844f946b1 hwmon: (coretemp) fix pci device refcount leak in nv1a_ram_new()
>     89eecabe6a47 hwmon: (coretemp) Check for null before removing sysfs attrs
>     0aacac75b8d6 net: ethernet: renesas: ravb: Fix promiscuous mode after system resumed
>     a7555681e50b sctp: fix memory leak in sctp_stream_outq_migrate()
>     168de4096b9c packet: do not set TP_STATUS_CSUM_VALID on CHECKSUM_COMPLETE
>     16c244bc65d1 net: tun: Fix use-after-free in tun_detach()
>     1c1d4830a960 afs: Fix fileserver probe RTT handling
>     53a62c5efe91 net: hsr: Fix potential use-after-free
>     ae633816ddf1 dsa: lan9303: Correct stat name
>     910c0264b64e net: ethernet: nixge: fix NULL dereference
>     2d24d91b9f44 net/9p: Fix a potential socket leak in p9_socket_open
>     4720725e22e1 net: net_netdev: Fix error handling in ntb_netdev_init_module()
>     3e21f85d87c8 net: phy: fix null-ptr-deref while probe() failed
>     f5c2ec288a86 wifi: cfg80211: fix buffer overflow in elem comparison
>     06785845e150 qlcnic: fix sleep-in-atomic-context bugs caused by msleep
>     78f8a34b375f can: cc770: cc770_isa_probe(): add missing free_cc770dev()
>     e4b474fa787c can: sja1000_isa: sja1000_isa_probe(): add missing free_sja1000dev()
>     0a2d73a77060 net/mlx5e: Fix use-after-free when reverting termination table
>     093ccc2f8450 net/mlx5: Fix uninitialized variable bug in outlen_write()
>     b10dd3bd14ec of: property: decrement node refcount in of_fwnode_get_reference_args()
>     7b2b67fe1339 hwmon: (ibmpex) Fix possible UAF when ibmpex_register_bmc() fails
>     45a643783435 hwmon: (i5500_temp) fix missing pci_disable_device()
>     dbcc3390015f scripts/faddr2line: Fix regression in name resolution on ppc64le
>     2b916ee1d37c iio: light: rpr0521: add missing Kconfig dependencies
>     3f566b626029 iio: health: afe4404: Fix oob read in afe4404_[read|write]_raw
>     2d6a437064ff iio: health: afe4403: Fix oob read in afe4403_read_raw
>     8eb912af5250 btrfs: qgroup: fix sleep from invalid context bug in btrfs_qgroup_inherit()
>     7e88a416ed43 drm/amdgpu: Partially revert "drm/amdgpu: update drm_display_info correctly when the edid is read"
>     41f0abeadc09 drm/amdgpu: update drm_display_info correctly when the edid is read
>     787138e4b9e1 btrfs: move QUOTA_ENABLED check to rescan_should_stop from btrfs_qgroup_rescan_worker
>     255289adce05 spi: spi-imx: Fix spi_bus_clk if requested clock is higher than input clock
>     83aae3204e5c btrfs: free btrfs_path before copying inodes to userspace
>     9fd11e2de746 fuse: lock inode unconditionally in fuse_fallocate()
>     3659e33c1e4f drm/i915: fix TLB invalidation for Gen12 video and compute engines
>     0d1cad597199 drm/amdgpu: always register an MMU notifier for userptr
>     d4e9bab771aa drm/amd/dc/dce120: Fix audio register mapping, stop triggering KASAN
>     a541f1f0ce90 btrfs: sysfs: normalize the error handling branch in btrfs_init_sysfs()
>     d037681515b6 btrfs: free btrfs_path before copying subvol info to userspace
>     69e2f1dd93c1 btrfs: free btrfs_path before copying fspath to userspace
>     3cde2bc70819 btrfs: free btrfs_path before copying root refs to userspace
>     4741b00cac23 binder: Gracefully handle BINDER_TYPE_FDA objects with num_fds=0
>     4e682ce5601a binder: Address corner cases in deferred copy and fixup
>     15e098ab1d3c binder: fix pointer cast warning
>     74e7f1828ab4 binder: defer copies of pre-patched txn data
>     7b31ab0d9efb binder: read pre-translated fds from sender buffer
>     c056a6ba35e0 binder: avoid potential data leakage when copying txn
>     f8fee36515f4 dm integrity: flush the journal on suspend
>     096e1bd659d8 net: usb: qmi_wwan: add Telit 0x103a composition
>     86136bf62387 tcp: configurable source port perturb table size
>     07da8fca307e platform/x86: hp-wmi: Ignore Smart Experience App event
>     82d758c9daf1 platform/x86: acer-wmi: Enable SW_TABLET_MODE on Switch V 10 (SW5-017)
>     846c0f9cd05b platform/x86: asus-wmi: add missing pci_dev_put() in asus_wmi_set_xusb2pr()
>     6579436fd1a6 xen/platform-pci: add missing free_irq() in error path
>     375e79c57155 serial: 8250: 8250_omap: Avoid RS485 RTS glitch on ->set_termios()
>     e3a2211fe17c ASoC: Intel: bytcht_es8316: Add quirk for the Nanote UMPC-01
>     3e2452cbc6f6 Input: synaptics - switch touchpad on HP Laptop 15-da3001TU to RMI mode
>     47b4949335cb gcov: clang: fix the buffer overflow issue
>     ecbde4222e6b nilfs2: fix nilfs_sufile_mark_dirty() not set segment usage as dirty
>     7d08b4eba1e1 firmware: coreboot: Register bus in module init
>     a2012335aa53 firmware: google: Release devices before unregistering the bus
>     cb7495fe9575 ceph: avoid putting the realm twice when decoding snaps fails
>     12a93545b2ed ceph: do not update snapshot context when there is no new snapshot
>     0528b19d5701 iio: pressure: ms5611: fixed value compensation bug
>     562f415bb378 iio: ms5611: Simplify IO callback parameters
>     def48fbbac1c nios2: add FORCE for vmlinuz.gz
>     da849abded31 init/Kconfig: fix CC_HAS_ASM_GOTO_TIED_OUTPUT test with dash
>     03949acb58f0 iio: core: Fix entry not deleted when iio_register_sw_trigger_type() fails
>     f8a76c28e957 iio: light: apds9960: fix wrong register for gesture gain
>     d3ad47426a58 arm64: dts: rockchip: lower rk3399-puma-haikou SD controller clock frequency
>     ae6bcb26984b usb: dwc3: exynos: Fix remove() function
>     15f8b52523ba lib/vdso: use "grep -E" instead of "egrep"
>     960cf3c7ff95 s390/crashdump: fix TOD programmable field size
>     fabd3ab6a19d net: thunderx: Fix the ACPI memory leak
>     1633e6d6aa82 nfc: st-nci: fix memory leaks in EVT_TRANSACTION
>     0e2a4560db77 nfc: st-nci: fix incorrect validating logic in EVT_TRANSACTION
>     420b21235d63 s390/dasd: fix no record found for raw_track_access
>     9d1264c914d3 dccp/tcp: Reset saddr on failure after inet6?_hash_connect().
>     08f25427d81a bnx2x: fix pci device refcount leak in bnx2x_vf_is_pcie_pending()
>     59612acf6b5e regulator: twl6030: re-add TWL6032_SUBCLASS
>     1c12909a7820 NFC: nci: fix memory leak in nci_rx_data_packet()
>     23b83a3c76b3 xfrm: Fix ignored return value in xfrm6_init()
>     23ba1997ebc0 tipc: check skb_linearize() return value in tipc_disc_rcv()
>     59f9aad22fd7 tipc: add an extra conn_get in tipc_conn_alloc
>     30f91687fa25 tipc: set con sock in tipc_conn_alloc
>     5c12136c00b5 net/mlx5: Fix FW tracer timestamp calculation
>     00492f823f30 Drivers: hv: vmbus: fix possible memory leak in vmbus_device_register()
>     e0d5becab1d0 Drivers: hv: vmbus: fix double free in the error path of vmbus_add_channel_work()
>     ec3d7202e99f nfp: add port from netdev validation for EEPROM access
>     9b8061a6dbd0 net: pch_gbe: fix pci device refcount leak while module exiting
>     9a39ea43f16a net/qla3xxx: fix potential memleak in ql3xxx_send()
>     a07149c10bae net/mlx4: Check retval of mlx4_bitmap_init
>     bbf6d1bc077f ARM: mxs: fix memory leak in mxs_machine_init()
>     3afa86449ee8 9p/fd: fix issue of list_del corruption in p9_fd_cancel()
>     bfadcbf5bac5 net: pch_gbe: fix potential memleak in pch_gbe_tx_queue()
>     e00b42cbec15 nfc/nci: fix race with opening and closing
>     04ffa53ab7ae net: liquidio: simplify if expression
>     79c55e66caa0 ARM: dts: at91: sam9g20ek: enable udc vbus gpio pinctrl
>     897f6a309138 tee: optee: fix possible memory leak in optee_register_device()
>     9c1fbac623cb bus: sunxi-rsb: Support atomic transfers
>     347875ff9ad4 regulator: core: fix UAF in destroy_regulator()
>     556121103170 regulator: core: fix kobject release warning and memory leak in regulator_register()
>     c06267652886 ASoC: sgtl5000: Reset the CHIP_CLK_CTRL reg on remove
>     168d59f7f72d ARM: dts: am335x-pcm-953: Define fixed regulators in root node
>     dd56c671ccca af_key: Fix send_acquire race with pfkey_register
>     9221a53bfcba MIPS: pic32: treat port as signed integer
>     dff9b25cb977 RISC-V: vdso: Do not add missing symbols to version section in linker script
>     b0e025dd87ab arm64/syscall: Include asm/ptrace.h in syscall_wrapper header.
>     0ba7c091f7f1 block, bfq: fix null pointer dereference in bfq_bio_bfqg()
>     b848811655db drm: panel-orientation-quirks: Add quirk for Acer Switch V 10 (SW5-017)
>     5dfbb54fe115 spi: stm32: fix stm32_spi_prepare_mbr() that halves spi clk for every run
>     9029aee8742e wifi: mac80211: Fix ack frame idr leak when mesh has no route
>     1f75f9c1af6a audit: fix undefined behavior in bit shift for AUDIT_BIT
>     3129cec05f3d wifi: mac80211_hwsim: fix debugfs attribute ps with rc table support
>     b4cb3dc11185 wifi: mac80211: fix memory free error when registering wiphy fail
>
> Signed-off-by: Bruce Ashfield <bruce.ashfield@gmail.com>
> ---
>  .../linux/linux-yocto-rt_5.4.bb               |  6 ++---
>  .../linux/linux-yocto-tiny_5.4.bb             |  8 +++----
>  meta/recipes-kernel/linux/linux-yocto_5.4.bb  | 22 +++++++++----------
>  3 files changed, 18 insertions(+), 18 deletions(-)
>
> diff --git a/meta/recipes-kernel/linux/linux-yocto-rt_5.4.bb b/meta/recipes-kernel/linux/linux-yocto-rt_5.4.bb
> index 5601c43b8e..e9abb46493 100644
> --- a/meta/recipes-kernel/linux/linux-yocto-rt_5.4.bb
> +++ b/meta/recipes-kernel/linux/linux-yocto-rt_5.4.bb
> @@ -11,13 +11,13 @@ python () {
>          raise bb.parse.SkipRecipe("Set PREFERRED_PROVIDER_virtual/kernel to linux-yocto-rt to enable it")
>  }
>
> -SRCREV_machine ?= "c06836b5ea27b0b97c04cd205959e21b2a60f32e"
> -SRCREV_meta ?= "3e7ca0fe77707fabb1beefd5d3cd322a4db1eb41"
> +SRCREV_machine ?= "acaf6e01f6ecd6d80ac02f552344c6c0de1c7fe1"
> +SRCREV_meta ?= "b00c12ce7affe7e5da43fa4285998866a51e6e79"
>
>  SRC_URI = "git://git.yoctoproject.org/linux-yocto.git;branch=${KBRANCH};name=machine \
>             git://git.yoctoproject.org/yocto-kernel-cache;type=kmeta;name=meta;branch=yocto-5.4;destsuffix=${KMETA}"
>
> -LINUX_VERSION ?= "5.4.225"
> +LINUX_VERSION ?= "5.4.228"
>
>  LIC_FILES_CHKSUM = "file://COPYING;md5=bbea815ee2795b2f4230826c0c6b8814"
>
> diff --git a/meta/recipes-kernel/linux/linux-yocto-tiny_5.4.bb b/meta/recipes-kernel/linux/linux-yocto-tiny_5.4.bb
> index 5916a42f34..a9f83f2835 100644
> --- a/meta/recipes-kernel/linux/linux-yocto-tiny_5.4.bb
> +++ b/meta/recipes-kernel/linux/linux-yocto-tiny_5.4.bb
> @@ -6,7 +6,7 @@ KCONFIG_MODE = "--allnoconfig"
>
>  require recipes-kernel/linux/linux-yocto.inc
>
> -LINUX_VERSION ?= "5.4.225"
> +LINUX_VERSION ?= "5.4.228"
>  LIC_FILES_CHKSUM = "file://COPYING;md5=bbea815ee2795b2f4230826c0c6b8814"
>
>  DEPENDS += "${@bb.utils.contains('ARCH', 'x86', 'elfutils-native', '', d)}"
> @@ -15,9 +15,9 @@ DEPENDS += "openssl-native util-linux-native"
>  KMETA = "kernel-meta"
>  KCONF_BSP_AUDIT_LEVEL = "2"
>
> -SRCREV_machine_qemuarm ?= "92964f40a4e096e1971b65ce0572ad909ab41e84"
> -SRCREV_machine ?= "00e9d6d6f5c09bd5fd47af67fd7d03881d74c608"
> -SRCREV_meta ?= "3e7ca0fe77707fabb1beefd5d3cd322a4db1eb41"
> +SRCREV_machine_qemuarm ?= "575c3de9d720c998b5b4ab0253893a4132b4423f"
> +SRCREV_machine ?= "b72387f2b7f2babf1b0ca6e4ced3b22538162474"
> +SRCREV_meta ?= "b00c12ce7affe7e5da43fa4285998866a51e6e79"
>
>  PV = "${LINUX_VERSION}+git${SRCPV}"
>
> diff --git a/meta/recipes-kernel/linux/linux-yocto_5.4.bb b/meta/recipes-kernel/linux/linux-yocto_5.4.bb
> index 5951668c57..d76ed47f03 100644
> --- a/meta/recipes-kernel/linux/linux-yocto_5.4.bb
> +++ b/meta/recipes-kernel/linux/linux-yocto_5.4.bb
> @@ -12,16 +12,16 @@ KBRANCH_qemux86  ?= "v5.4/standard/base"
>  KBRANCH_qemux86-64 ?= "v5.4/standard/base"
>  KBRANCH_qemumips64 ?= "v5.4/standard/mti-malta64"
>
> -SRCREV_machine_qemuarm ?= "13d88d2fc15f1edfa91378bc3a76aa4274969ed8"
> -SRCREV_machine_qemuarm64 ?= "14d0e6d0baf0c7b2308ff1270bd706f927c72df4"
> -SRCREV_machine_qemumips ?= "11472a4308590f1858d1ba7bb03bdc25cd2c9b3f"
> -SRCREV_machine_qemuppc ?= "daf1282f1c6fd653fcae25e8d1d49540a932baeb"
> -SRCREV_machine_qemuriscv64 ?= "15231fe2f4542b044e279e53269ee506bced9988"
> -SRCREV_machine_qemux86 ?= "15231fe2f4542b044e279e53269ee506bced9988"
> -SRCREV_machine_qemux86-64 ?= "15231fe2f4542b044e279e53269ee506bced9988"
> -SRCREV_machine_qemumips64 ?= "31f08b9f81298e80e00ea37886db6f88092a5cf6"
> -SRCREV_machine ?= "15231fe2f4542b044e279e53269ee506bced9988"
> -SRCREV_meta ?= "3e7ca0fe77707fabb1beefd5d3cd322a4db1eb41"
> +SRCREV_machine_qemuarm ?= "32654a547b05ba63c604503fc865d7052ae96992"
> +SRCREV_machine_qemuarm64 ?= "2bd8ca7c0973870753b103107513689a598383d7"
> +SRCREV_machine_qemumips ?= "84a8ba0ada556ba3307c33e2b5a0ca8f9e3df1dd"
> +SRCREV_machine_qemuppc ?= "20db90d7935c8760bfc68c0de4f7d7085cba7c14"
> +SRCREV_machine_qemuriscv64 ?= "921d9e22542506ba26c2e5e2f25ec00ff9bffa63"
> +SRCREV_machine_qemux86 ?= "921d9e22542506ba26c2e5e2f25ec00ff9bffa63"
> +SRCREV_machine_qemux86-64 ?= "921d9e22542506ba26c2e5e2f25ec00ff9bffa63"

I suspect you forgot to push this final change set to the linux-yocto repo!

stdio: ERROR: linux-yocto-5.4.228+gitAUTOINC+b00c12ce7a_921d9e2254-r0
do_fetch: Fetcher failure: Unable to find revision
921d9e22542506ba26c2e5e2f25ec00ff9bffa63 in branch v5.4/standard/base
even from upstream
stdio: ERROR: linux-yocto-5.4.228+gitAUTOINC+b00c12ce7a_921d9e2254-r0
do_fetch: Bitbake Fetcher Error: FetchError('Unable to fetch URL from
any source.', 'git://git.yoctoproject.org/linux-yocto.git;name=machine;branch=v5.4/standard/base;')
stdio: ERROR: Logfile of failure stored in:
/home/pokybuild/yocto-worker/a-full/build/build/tmp/work/qemux86-poky-linux/linux-yocto/5.4.228+gitAUTOINC+b00c12ce7a_921d9e2254-r0/temp/log.do_fetch.15480
stdio: ERROR: Task
(/home/pokybuild/yocto-worker/a-full/build/meta/recipes-kernel/linux/linux-yocto_5.4.bb:do_fetch)
failed with exit code '1'
stdio: ERROR: Command . ./oe-init-build-env; bitbake universe -c fetch
-k -k failed with exit code 1, see errors above. (1671503359.0: 966.9)

Thanks for the kernel version bumps :-)

Steve

> +SRCREV_machine_qemumips64 ?= "929fde255b362923e9bba63250005b09c3a50f45"
> +SRCREV_machine ?= "921d9e22542506ba26c2e5e2f25ec00ff9bffa63"
> +SRCREV_meta ?= "b00c12ce7affe7e5da43fa4285998866a51e6e79"
>
>  # remap qemuarm to qemuarma15 for the 5.4 kernel
>  # KMACHINE_qemuarm ?= "qemuarma15"
> @@ -30,7 +30,7 @@ SRC_URI = "git://git.yoctoproject.org/linux-yocto.git;name=machine;branch=${KBRA
>             git://git.yoctoproject.org/yocto-kernel-cache;type=kmeta;name=meta;branch=yocto-5.4;destsuffix=${KMETA}"
>
>  LIC_FILES_CHKSUM = "file://COPYING;md5=bbea815ee2795b2f4230826c0c6b8814"
> -LINUX_VERSION ?= "5.4.225"
> +LINUX_VERSION ?= "5.4.228"
>
>  DEPENDS += "${@bb.utils.contains('ARCH', 'x86', 'elfutils-native', '', d)}"
>  DEPENDS += "openssl-native util-linux-native"
> --
> 2.19.1
>

