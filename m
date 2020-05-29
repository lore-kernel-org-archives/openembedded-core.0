Received: from mail-qv1-f67.google.com (mail-qv1-f67.google.com [209.85.219.67])
 by mx.groups.io with SMTP id smtpd.web10.26556.1590715764625146605
 for <openembedded-core@lists.openembedded.org>;
 Thu, 28 May 2020 18:29:24 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20161025 header.b=jESp4myI;
 spf=pass (domain: gmail.com, ip: 209.85.219.67, mailfrom: bruce.ashfield@gmail.com)
Received: by mail-qv1-f67.google.com with SMTP id fb16so360141qvb.5
        for <openembedded-core@lists.openembedded.org>; Thu, 28 May 2020 18:29:24 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:content-transfer-encoding;
        bh=sbmWp55yE8+FvCG2o/YA8mtliixuZ68cc+O3Ipktz80=;
        b=jESp4myIIGju2ndVk7SdHqV+TGcxinCgXj0PlwXHN1IrSVoydw0Rxn/p4w/pcoFKDs
         FjB+WPbORJaRmZ7/r2FqSq3BixA5jdhv/ouXVYZPI4/HmJDmEyopbCV9+PukJ0uYwvBf
         bsr/h/sIYwP7P2D2KzvDF24iVyGEzudz97Zob5cNb0BNWdAVdsjMf3HlNCQ8oO7dcPOP
         3TPSovjIQDyL/h9iyPpnmipj1ys0uJ+WLvjeRvxNycag5G3QtMeErIEiWjAdUTQCH0aW
         IuCTFmhZ1IRer37/8l3RkRWeXKlQYB6UuqbZQvVg1o4PJ4Efu9alh6oTteXvvFiVIXhq
         /gog==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=sbmWp55yE8+FvCG2o/YA8mtliixuZ68cc+O3Ipktz80=;
        b=QO2im/VFxrmcVadgnMA+XoM8qfxTzsSI6pjZtwsgEipXb6Osg+Z07GJInjbGuoGsF0
         JgJdmMnrJctP7kFTV5lTc+P78KcvPH1Wy+55KpM2HFov9F/eoAxAoJEGtATfEqpNZ9OE
         Xjjk0+h2AQwEIt5knAXxpqf0hi53/gFCnbbfUxs2XKymG68EVzp1udGgp9XILc8/FanK
         HcmxCAiwtEYOm72Qiz8mLdV7U7OrAPitmAgyxO6ncLp42Tsy5X83AEA11jylN5XFu9Ky
         SGH59WxU6oEYipI3asW49ZtbL9S9Pv2kAyK+qyzhqEtqMcjqEjgVJdLQM2WURCMrTZnB
         fLZw==
X-Gm-Message-State: AOAM530o52zrCwg2T+LkWmaTnGCwt1uDfboSyCKw8zma8tT+ofJrb5yv
	6gd9/D3kyedvOlIj0Gf9jz3rWZF6PWU=
X-Google-Smtp-Source: ABdhPJx+x1Xp9bscsuDIzkHw8yvfUbDdfjyGRqi95lWJDHmhtrlBss5dgwfWEstahLZj/DShObUMvQ==
X-Received: by 2002:ad4:4d03:: with SMTP id l3mr6207064qvl.158.1590715763436;
        Thu, 28 May 2020 18:29:23 -0700 (PDT)
Return-Path: <bruce.ashfield@gmail.com>
Received: from localhost.localdomain (CPE04d4c4975b80-CM64777d5e8820.cpe.net.cable.rogers.com. [174.112.240.214])
        by smtp.gmail.com with ESMTPSA id c16sm4101292qko.100.2020.05.28.18.29.22
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 28 May 2020 18:29:22 -0700 (PDT)
From: "Bruce Ashfield" <bruce.ashfield@gmail.com>
To: richard.purdie@linuxfoundation.org
Cc: openembedded-core@lists.openembedded.org
Subject: [PATCH 1/5] linux-yocto/5.4: update to v5.4.42
Date: Thu, 28 May 2020 21:29:15 -0400
Message-Id: <18167ae4d30e5ea03c8d31aa7819e1351cca3cc4.1590715483.git.bruce.ashfield@gmail.com>
X-Mailer: git-send-email 2.19.1
In-Reply-To: <cover.1590715483.git.bruce.ashfield@gmail.com>
References: <cover.1590715483.git.bruce.ashfield@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

From: Bruce Ashfield <bruce.ashfield@gmail.com>

Updating linux-yocto/5.4 to the latest korg -stable release that comprises
the following commits:

    1cdaf895c99d Linux 5.4.42
    ecb3f529a554 bpf: Test_progs, fix test_get_stack_rawtp_err.c build
    aee43146cc10 selftest/bpf: fix backported test_select_reuseport selftest changes
    35d9107ad30b libbpf: Extract and generalize CPU mask parsing logic
    10cfaa7456d7 Makefile: disallow data races on gcc-10 as well
    9972e851b9f4 KVM: x86: Fix off-by-one error in kvm_vcpu_ioctl_x86_setup_mce
    9d2487643b4f bpf: Fix sk_psock refcnt leak when receiving message
    d41689a34a9d SUNRPC: Revert 241b1f419f0e ("SUNRPC: Remove xdr_buf_trim()")
    3a8efe589bb6 ARM: dts: r8a7740: Add missing extal2 to CPG node
    cd8ae9b73258 arm64: dts: renesas: r8a77980: Fix IPMMU VIP[01] nodes
    c580f2fe3270 ARM: dts: r8a73a4: Add missing CMT1 interrupts
    8972721aea41 arm64: dts: imx8mn: Change SDMA1 ahb clock for imx8mn
    764715615178 arm64: dts: rockchip: Rename dwc3 device nodes on rk3399 to make dtc happy
    64ad7ef3a6e5 arm64: dts: rockchip: Replace RK805 PMIC node name with "pmic" on rk3328 boards
    af518b5b77fd arm64: dts: meson-g12-common: fix dwc2 clock names
    9b9c52752a11 arm64: dts: meson-g12b-khadas-vim3: add missing frddr_a status property
    01febb33cb6e clk: Unlink clock if failed to prepare or enable
    e2084a8d5fee Revert "ALSA: hda/realtek: Fix pop noise on ALC225"
    5e553801462b usb: gadget: legacy: fix error return code in cdc_bind()
    7e5c1db8ad15 usb: gadget: legacy: fix error return code in gncm_bind()
    8228b6736964 usb: gadget: audio: Fix a missing error return value in audio_bind()
    8ef452001769 usb: gadget: net2272: Fix a memory leak in an error handling path in 'net2272_plat_probe()'
    9f65d776756e fanotify: fix merging marks masks with FAN_ONDIR
    20a6d2455cde dwc3: Remove check for HWO flag in dwc3_gadget_ep_reclaim_trb_sg()
    4f6815e429a8 clk: rockchip: fix incorrect configuration of rk3228 aclk_gpu* clocks
    553a2cbca7c3 exec: Move would_dump into flush_old_exec
    136353c5066c x86/unwind/orc: Fix error handling in __unwind_start()
    91b9ce04ff1f x86: Fix early boot crash on gcc-10, third try
    f8e370ccab35 cifs: fix leaked reference on requeued write
    4e06196336a1 powerpc/32s: Fix build failure with CONFIG_PPC_KUAP_DEBUG
    57aa19acfc22 drm/amd/display: add basic atomic check for cursor plane
    97e43314763d ARM: dts: imx6dl-yapp4: Fix Ursa board Ethernet connection
    215589310fa2 ARM: dts: imx27-phytec-phycard-s-rdk: Fix the I2C1 pinctrl entries
    e1409dc95410 ARM: dts: dra7: Fix bus_dma_limit for PCIe
    da55eeb3245a Make the "Reducing compressed framebufer size" message be DRM_INFO_ONCE()
    c6a1ce81b43e usb: xhci: Fix NULL pointer dereference when enqueuing trbs from urb sg list
    6bb054f006c3 USB: gadget: fix illegal array access in binding with UDC
    e6be4400ac34 usb: cdns3: gadget: prev_req->trb is NULL for ep0
    f1a9bed7969a usb: host: xhci-plat: keep runtime active when removing host
    b96a62f506ee usb: core: hub: limit HUB_QUIRK_DISABLE_AUTOSUSPEND to USB5534B
    93dda4f0e2ff ALSA: usb-audio: Add control message quirk delay for Kingston HyperX headset
    3fa58fc9f8c4 ALSA: rawmidi: Fix racy buffer resize under concurrent accesses
    04ccdf6b031d ALSA: hda/realtek - Add COEF workaround for ASUS ZenBook UX431DA
    c9709800eeeb ALSA: hda/realtek - Limit int mic boost for Thinkpad T530
    c737b7533596 USB: usbfs: fix mmap dma mismatch
    0432f7632a24 usb: usbfs: correct kernel->user page attribute mismatch
    dca0ae3900b3 gcc-10: avoid shadowing standard library 'free()' in crypto
    6cbb91bdd3a2 gcc-10: mark more functions __init to avoid section mismatch warnings
    7955081a3a65 gcc-10 warnings: fix low-hanging fruit
    dff2ce17934c gcc-10: disable 'restrict' warning for now
    b8e7b93333db gcc-10: disable 'stringop-overflow' warning for now
    9ba07a72fc5e gcc-10: disable 'array-bounds' warning for now
    a740b68fd169 gcc-10: disable 'zero-length-bounds' warning for now
    8f6a84167e86 Stop the ad-hoc games with -Wno-maybe-initialized
    ab638a49a9f3 net/rds: Use ERR_PTR for rds_message_alloc_sgs()
    b597815ce1e8 pnp: Use list_for_each_entry() instead of open coding
    d4e58131829f NFSv3: fix rpc receive buffer size for MOUNT call
    e26e2a3febcb mm, memcg: fix inconsistent oom event behavior
    46a22f3ea146 s390/ism: fix error return code in ism_probe()
    e1608af17030 hwmon: (da9052) Synchronize access with mfd
    6e7253dc4562 RDMA/iw_cxgb4: Fix incorrect function parameters
    08f187dbd223 RDMA/core: Fix double put of resource
    ee7ce7d7e7c7 IB/core: Fix potential NULL pointer dereference in pkey cache
    b491aeec55fe IB/mlx4: Test return value of calls to ib_get_cached_pkey
    eaad00390ff9 RDMA/rxe: Always return ERR_PTR from rxe_create_mmap_info()
    da532ce587c7 netfilter: nft_set_rbtree: Add missing expired checks
    1c235d0eb1f0 netfilter: nft_set_rbtree: Introduce and use nft_rbtree_interval_start()
    6259b1c1bca5 SUNRPC: Signalled ASYNC tasks need to exit
    d1538d8d6325 nfs: fix NULL deference in nfs4_get_valid_delegation
    ea7c4d9e542f arm64: fix the flush_icache_range arguments in machine_kexec
    1222b257654b drm/i915/gvt: Fix kernel oops for 3-level ppgtt guest
    a308d6e6861d netfilter: conntrack: avoid gcc-10 zero-length-bounds warning
    b526c01b38ae NFSv4: Fix fscache cookie aux_data to ensure change_attr is included
    021f5799de53 nfs: fscache: use timespec64 in inode auxdata
    ef8195ee1618 NFS: Fix fscache super_cookie index_key from changing after umount
    32b9de3e935d drm/amdgpu: force fbdev into vram
    e1b2b93243ca fork: prevent accidental access to clone3 features
    f256dea07774 gfs2: More gfs2_find_jhead fixes
    18541e49f70b mmc: block: Fix request completion in the CQE timeout path
    e8eb122b9f43 mmc: core: Fix recursive locking issue in CQE recovery path
    fdf547a591f5 mmc: core: Check request type before completing the request
    3a8bc2ae2f79 mmc: sdhci-pci-gli: Fix can not access GL9750 after reboot from Windows 10
    e0830bb37734 mmc: alcor: Fix a resource leak in the error path for ->probe()
    62f217e0a9c8 bpf, sockmap: bpf_tcp_ingress needs to subtract bytes from sg.size
    ce3193bf8964 bpf, sockmap: msg_pop_data can incorrecty set an sge length
    af1f11fe6667 drm/i915: Don't enable WaIncreaseLatencyIPCEnabled when IPC is disabled
    0d9bc7986366 i40iw: Fix error handling in i40iw_manage_arp_cache()
    95827ac65244 ALSA: firewire-lib: fix 'function sizeof not defined' error of tracepoints format
    5d47b3d6b4d2 bpf: Fix error return code in map_lookup_and_delete_elem()
    5b96668b63c0 pinctrl: cherryview: Add missing spinlock usage in chv_gpio_irq_handler
    aec927836c7d pinctrl: qcom: fix wrong write in update_dual_edge
    604ad1bb8aae pinctrl: baytrail: Enable pin configuration setting for GPIO chip
    960d609dd4dd pinctrl: sunrisepoint: Fix PAD lock register offset for SPT-H
    e529b8db9684 ACPI: EC: PM: Avoid premature returns from acpi_s2idle_wake()
    9e54afec08f7 IB/hfi1: Fix another case where pq is left on waitlist
    d942a6a18463 mmc: sdhci-pci-gli: Fix no irq handler from suspend
    171bf6ef038b gfs2: Another gfs2_walk_metadata fix
    87954aacd585 ALSA: hda/realtek - Fix S3 pop noise on Dell Wyse
    05aae468d31a ipc/util.c: sysvipc_find_ipc() incorrectly updates position index
    3c3ade92b62a drm/amdgpu: invalidate L2 before SDMA IBs (v2)
    938489ef2902 drm/amdgpu: simplify padding calculations (v2)
    eefe5e0bb7b7 drm/qxl: lost qxl_bo_kunmap_atomic_page in qxl_image_init_helper()
    94cce94badf7 drm/amd/display: Update downspread percent to match spreadsheet for DCN2.1
    f4164b29dc08 drm/amd/display: check if REFCLK_CNTL register is present
    65f3108cbb1d drm/amd/powerplay: avoid using pm_en before it is initialized revised
    8c5f11093ef4 ALSA: hda/hdmi: fix race in monitor detection during probe
    4d1a83cb5afe cpufreq: intel_pstate: Only mention the BIOS disabling turbo mode once
    d12d7bf92b08 selftests/ftrace: Check the first record for kprobe_args_type.tc
    2b313699e7a9 dmaengine: mmp_tdma: Reset channel error on release
    6c414ddee7f0 dmaengine: mmp_tdma: Do not ignore slave config validation errors
    de76c0d4a03c dmaengine: pch_dma.c: Avoid data race between probe and irq handler
    c096a8645e3f riscv: fix vdso build with lld
    2fffdf4dded1 umh: fix memory leak on execve failure
    44ee727013d5 r8169: re-establish support for RTL8401 chip version
    e03d3510f45c nfp: abm: fix error return code in nfp_abm_vnic_alloc()
    2fbd6eca3711 net: tcp: fix rx timestamp behavior for tcp_recvmsg
    fc800ec491c3 netprio_cgroup: Fix unlimited memory leak of v2 cgroups
    cab607a627cf net: ipv4: really enforce backoff for redirects
    d375d99f8902 net: dsa: loop: Add module soft dependency
    b2e8946250c3 hinic: fix a bug of ndo_stop
    d07987924a04 dpaa2-eth: prevent array underflow in update_cls_rule()
    84916465b0f0 virtio_net: fix lockdep warning on 32 bit
    23300d6a39d7 tcp: fix SO_RCVLOWAT hangs with fat skbs
    cb4f78986065 tcp: fix error recovery in tcp_zerocopy_receive()
    f152793058b5 Revert "ipv6: add mtu lock check in __ip6_rt_update_pmtu"
    5f93b45fa58c pppoe: only process PADT targeted at local interfaces
    ecb8356aafba net: stmmac: fix num_por initialization
    4300e210b005 net: phy: fix aneg restart in phy_ethtool_set_eee
    debcbc56fdfc netlabel: cope with NULL catmap
    60a4f2ce0596 net: fix a potential recursive NETDEV_FEAT_CHANGE
    97e860545e24 dpaa2-eth: properly handle buffer size restrictions
    425853cc1160 mmc: sdhci-acpi: Add SDHCI_QUIRK2_BROKEN_64_BIT_DMA for AMDI0040
    a761f65879e8 selftests/bpf: fix goto cleanup label not defined
    2d6d0ce4de03 scsi: sg: add sg_remove_request in sg_write
    7d8da6d7d90c net_sched: fix tcm_parent in tc filter dump
    e2824505a813 sun6i: dsi: fix gcc-4.8
    645b44b6b3b3 virtio-blk: handle block_device_operations callbacks after hot unplug
    fbe2c2c50914 drop_monitor: work around gcc-10 stringop-overflow warning
    23a0a0914a1e ftrace/selftests: workaround cgroup RT scheduling issues
    dbd667a322ac net: moxa: Fix a potential double 'free_irq()'
    2bcd4df42d5d net/sonic: Fix a resource leak in an error handling path in 'jazz_sonic_probe()'
    e15d3d42900a SUNRPC: Fix GSS privacy computation of auth->au_ralign
    3bf0794e7309 SUNRPC: Add "@len" parameter to gss_unwrap()
    3c605abef3ee gpio: pca953x: Fix pca953x_gpio_set_config
    163b48932571 KVM: arm: vgic: Synchronize the whole guest on GIC{D,R}_I{S,C}ACTIVER read
    7abefa3f9a4b net: phy: microchip_t1: add lan87xx_phy_init to initialize the lan87xx phy.
    a12f3ad8d952 shmem: fix possible deadlocks on shmlock_user_lock
    723090ae8ea6 net: dsa: Do not make user port errors fatal
    cbaf23699561 Linux 5.4.41
    9bd5a84ceba3 fanotify: merge duplicate events on parent and child
    4638e0ff0fa4 fsnotify: replace inode pointer with an object id
    03447528a390 bdi: add a ->dev_name field to struct backing_dev_info
    25390a31983c bdi: move bdi_dev_name out of line
    c1af2c13a4ac mm, memcg: fix error return value of mem_cgroup_css_alloc()
    1642f114ce2d scripts/decodecode: fix trapping instruction formatting
    2e86e3841c3c iommu/virtio: Reverse arguments to list_add
    1a31c4456af9 objtool: Fix stack offset tracking for indirect CFAs
    30a38059cdd4 netfilter: nf_osf: avoid passing pointer to local var
    4ccbd9c859dd netfilter: nat: never update the UDP checksum when it's 0
    634c950c624d arch/x86/kvm/svm/sev.c: change flag passed to GUP fast in sev_pin_memory()
    4cbb69b45cad KVM: x86: Fixes posted interrupt check for IRQs delivery modes
    db00b1d9d71a x86/unwind/orc: Fix premature unwind stoppage due to IRET frames
    c9473a0260b2 x86/unwind/orc: Fix error path for bad ORC entry type
    1b4bd44645ac x86/unwind/orc: Prevent unwinding before ORC initialization
    511261578b8b x86/unwind/orc: Don't skip the first frame for inactive tasks
    162e9f141d96 x86/entry/64: Fix unwind hints in rewind_stack_do_exit()
    16aace664b27 x86/entry/64: Fix unwind hints in kernel exit path
    07c4cd680c0b x86/entry/64: Fix unwind hints in register clearing code
    d8eb5a1cde35 batman-adv: Fix refcnt leak in batadv_v_ogm_process
    13f968c8b762 batman-adv: Fix refcnt leak in batadv_store_throughput_override
    b71348105899 batman-adv: Fix refcnt leak in batadv_show_throughput_override
    bee7e9da58ba batman-adv: fix batadv_nc_random_weight_tq
    34ca080088e2 iocost: protect iocg->abs_vdebt with iocg->waitq.lock
    d8c7f015d1a9 riscv: set max_pfn to the PFN of the last page
    480534e03061 coredump: fix crash when umh is disabled
    b8fe132bae66 staging: gasket: Check the return value of gasket_get_bar_index()
    53f453031a20 ceph: demote quotarealm lookup warning to a debug message
    3fd9f902c08a ceph: fix endianness bug when handling MDS session feature bits
    e991f7ded4e1 mm: limit boost_watermark on small zones
    4b49a9660d26 mm/page_alloc: fix watchdog soft lockups during set_zone_contiguous()
    ee922a2f6be9 eventpoll: fix missing wakeup for ovflist in ep_poll_callback
    5d77631de15a epoll: atomically remove wait entry on wake up
    1f3aa3e028c5 ipc/mqueue.c: change __do_notify() to bypass check_kill_permission()
    65f96f4b797e drm: ingenic-drm: add MODULE_DEVICE_TABLE
    0eae1647f145 arm64: hugetlb: avoid potential NULL dereference
    e983c6064a0a KVM: arm64: Fix 32bit PC wrap-around
    3ae9279d725a KVM: arm: vgic: Fix limit condition when writing to GICD_I[CS]ACTIVER
    152d97d0b26f KVM: VMX: Explicitly clear RFLAGS.CF and RFLAGS.ZF in VM-Exit RSB path
    3f23f781290b KVM: s390: Remove false WARN_ON_ONCE for the PQAP instruction
    eb0373fc3871 crypto: arch/nhpoly1305 - process in explicit 4k chunks
    8b166a6f6286 tracing: Add a vmalloc_sync_mappings() for safe measure
    72886ae16a75 USB: serial: garmin_gps: add sanity checking for data length
    4f4dc27c09cd usb: chipidea: msm: Ensure proper controller reset using role switch API
    2419a955172c USB: uas: add quirk for LaCie 2Big Quadra
    b60a086ec733 HID: wacom: Report 2nd-gen Intuos Pro S center button status over BT
    613045bfc63d HID: usbhid: Fix race between usbhid_close() and usbhid_stop()
    1017955fab5b Revert "HID: wacom: generic: read the number of expected touches on a per collection basis"
    a204d577be70 sctp: Fix bundling of SHUTDOWN with COOKIE-ACK
    3fc16b5b1947 HID: wacom: Read HID_DG_CONTACTMAX directly for non-generic devices
    0aeae7ad9450 net: mvpp2: cls: Prevent buffer overflow in mvpp2_ethtool_cls_rule_del()
    b2930c86ee2b net: mvpp2: prevent buffer overflow in mvpp22_rss_ctx()
    d595dd5ba909 net/mlx5: Fix command entry leak in Internal Error State
    11dd1d0ebfdd net/mlx5: Fix forced completion access non initialized command entry
    18cfbcdf1f41 net/mlx5: DR, On creation set CQ's arm_db member to right value
    6ab4dd433b61 bnxt_en: Fix VLAN acceleration handling in bnxt_fix_features().
    cf07e0ccffde bnxt_en: Return error when allocating zero size context memory.
    76737d877fab bnxt_en: Improve AER slot reset.
    ab1c944361b4 bnxt_en: Reduce BNXT_MSIX_VEC_MAX value to supported CQs per PF.
    2be3a9e71ce4 bnxt_en: Fix VF anti-spoof filter setup.
    a882d44e5bad tunnel: Propagate ECT(1) when decapsulating as recommended by RFC6040
    e9edd5a0f5f5 tipc: fix partial topology connection closure
    f2d581951775 sch_sfq: validate silly quantum values
    017242e3bdb3 sch_choke: avoid potential panic in choke_reset()
    66f7e30273ef nfp: abm: fix a memory leak bug
    8fc441d16183 net: usb: qmi_wwan: add support for DW5816e
    4107cd9a869f net/tls: Fix sk_psock refcnt leak when in tls_data_ready()
    a15ccc88e516 net/tls: Fix sk_psock refcnt leak in bpf_exec_tx_verdict()
    4124b1317f26 net: tc35815: Fix phydev supported/advertising mask
    7bbf73e918be net: stricter validation of untrusted gso packets
    b51b394f4ab1 net_sched: sch_skbprio: add message validation to skbprio_change()
    c78c166748e9 net/mlx4_core: Fix use of ENOSPC around mlx4_counter_alloc()
    57f6c4340aad net: macsec: preserve ingress frame ordering
    301d6eb32d81 net: macb: fix an issue about leak related system resources
    5ffd49c52bad net: dsa: Do not leave DSA master with NULL netdev_ops
    e781af2fdc2e neigh: send protocol value in neighbor create notification
    89469cf72fae mlxsw: spectrum_acl_tcam: Position vchunk in a vregion list properly
    5d7e1e23efb6 ipv6: Use global sernum for dst validation with nexthop objects
    45b6af95aae7 fq_codel: fix TCA_FQ_CODEL_DROP_BATCH_SIZE sanity checks
    429a89625693 dp83640: reverse arguments to list_add_tail
    6ee2fdf2ba4d devlink: fix return value after hitting end in region read
    b586a95e2606 tty: xilinx_uartps: Fix missing id assignment to the console
    8ca4302bc663 vt: fix unicode console freeing with a common interface
    f4d20b01eaf6 drm/amdgpu: drop redundant cg/pg ungate on runpm enter
    c973b108912a drm/amdgpu: move kfd suspend after ip_suspend_phase1
    8e16ede5b7a1 net: macb: Fix runtime PM refcounting
    eb6f88cd81ac tracing/kprobes: Fix a double initialization typo
    56fc76893f87 nvme: fix possible hang when ns scanning fails during error recovery
    fb1b41128c70 nvme: refactor nvme_identify_ns_descs error handling
    a5d53ad84eb5 USB: serial: qcserial: Add DW5816e support

Signed-off-by: Bruce Ashfield <bruce.ashfield@gmail.com>
---
 .../linux/linux-yocto-rt_5.4.bb               |  6 ++---
 .../linux/linux-yocto-tiny_5.4.bb             |  8 +++----
 meta/recipes-kernel/linux/linux-yocto_5.4.bb  | 22 +++++++++----------
 3 files changed, 18 insertions(+), 18 deletions(-)

diff --git a/meta/recipes-kernel/linux/linux-yocto-rt_5.4.bb b/meta/recipes-kernel/linux/linux-yocto-rt_5.4.bb
index f6acb291fe..ba72377596 100644
--- a/meta/recipes-kernel/linux/linux-yocto-rt_5.4.bb
+++ b/meta/recipes-kernel/linux/linux-yocto-rt_5.4.bb
@@ -11,13 +11,13 @@ python () {
         raise bb.parse.SkipRecipe("Set PREFERRED_PROVIDER_virtual/kernel to linux-yocto-rt to enable it")
 }
 
-SRCREV_machine ?= "5db46f8cf9b485f320287147ce593789ee0b5447"
-SRCREV_meta ?= "4ed477131e6e508d335d70c070eb84a5c3d673e5"
+SRCREV_machine ?= "3d6fc5e71f0a3a21dacd90094f04d57a4fd59e60"
+SRCREV_meta ?= "2647d22ea8ac2d3af6fe3b0d635cf84ee06f95e3"
 
 SRC_URI = "git://git.yoctoproject.org/linux-yocto.git;branch=${KBRANCH};name=machine \
            git://git.yoctoproject.org/yocto-kernel-cache;type=kmeta;name=meta;branch=yocto-5.4;destsuffix=${KMETA}"
 
-LINUX_VERSION ?= "5.4.40"
+LINUX_VERSION ?= "5.4.42"
 
 LIC_FILES_CHKSUM = "file://COPYING;md5=bbea815ee2795b2f4230826c0c6b8814"
 
diff --git a/meta/recipes-kernel/linux/linux-yocto-tiny_5.4.bb b/meta/recipes-kernel/linux/linux-yocto-tiny_5.4.bb
index f797aa1df5..1645906034 100644
--- a/meta/recipes-kernel/linux/linux-yocto-tiny_5.4.bb
+++ b/meta/recipes-kernel/linux/linux-yocto-tiny_5.4.bb
@@ -6,7 +6,7 @@ KCONFIG_MODE = "--allnoconfig"
 
 require recipes-kernel/linux/linux-yocto.inc
 
-LINUX_VERSION ?= "5.4.40"
+LINUX_VERSION ?= "5.4.42"
 LIC_FILES_CHKSUM = "file://COPYING;md5=bbea815ee2795b2f4230826c0c6b8814"
 
 DEPENDS += "${@bb.utils.contains('ARCH', 'x86', 'elfutils-native', '', d)}"
@@ -15,9 +15,9 @@ DEPENDS += "openssl-native util-linux-native"
 KMETA = "kernel-meta"
 KCONF_BSP_AUDIT_LEVEL = "2"
 
-SRCREV_machine_qemuarm ?= "b84f9483ed29096cd9bb6b1922666e8a275dd496"
-SRCREV_machine ?= "29f44c85c379c38f15e544828e7e77b3c008f378"
-SRCREV_meta ?= "4ed477131e6e508d335d70c070eb84a5c3d673e5"
+SRCREV_machine_qemuarm ?= "80606f0432a35225e7bff188a890b836018bae61"
+SRCREV_machine ?= "1ef0d05b4662a4e5a075db47e7e368e9a12c4877"
+SRCREV_meta ?= "2647d22ea8ac2d3af6fe3b0d635cf84ee06f95e3"
 
 PV = "${LINUX_VERSION}+git${SRCPV}"
 
diff --git a/meta/recipes-kernel/linux/linux-yocto_5.4.bb b/meta/recipes-kernel/linux/linux-yocto_5.4.bb
index 65afdc32fa..068cebca2c 100644
--- a/meta/recipes-kernel/linux/linux-yocto_5.4.bb
+++ b/meta/recipes-kernel/linux/linux-yocto_5.4.bb
@@ -12,16 +12,16 @@ KBRANCH_qemux86  ?= "v5.4/standard/base"
 KBRANCH_qemux86-64 ?= "v5.4/standard/base"
 KBRANCH_qemumips64 ?= "v5.4/standard/mti-malta64"
 
-SRCREV_machine_qemuarm ?= "cbe84f8dbb7fe4a67a337795d81cca735346f4c8"
-SRCREV_machine_qemuarm64 ?= "29f44c85c379c38f15e544828e7e77b3c008f378"
-SRCREV_machine_qemumips ?= "b0ad6cf1238ec97860a9e26a6da1aa431c5b96fb"
-SRCREV_machine_qemuppc ?= "29f44c85c379c38f15e544828e7e77b3c008f378"
-SRCREV_machine_qemuriscv64 ?= "29f44c85c379c38f15e544828e7e77b3c008f378"
-SRCREV_machine_qemux86 ?= "29f44c85c379c38f15e544828e7e77b3c008f378"
-SRCREV_machine_qemux86-64 ?= "29f44c85c379c38f15e544828e7e77b3c008f378"
-SRCREV_machine_qemumips64 ?= "5247564ab2b897a678ed0cd8fb2905c918fc64df"
-SRCREV_machine ?= "29f44c85c379c38f15e544828e7e77b3c008f378"
-SRCREV_meta ?= "4ed477131e6e508d335d70c070eb84a5c3d673e5"
+SRCREV_machine_qemuarm ?= "a076e375d8ad4e5fdfa2de876e760868bfb56362"
+SRCREV_machine_qemuarm64 ?= "1ef0d05b4662a4e5a075db47e7e368e9a12c4877"
+SRCREV_machine_qemumips ?= "fd673ca3d8d41867ffc9869cba2fa407e7be1b2a"
+SRCREV_machine_qemuppc ?= "1ef0d05b4662a4e5a075db47e7e368e9a12c4877"
+SRCREV_machine_qemuriscv64 ?= "1ef0d05b4662a4e5a075db47e7e368e9a12c4877"
+SRCREV_machine_qemux86 ?= "1ef0d05b4662a4e5a075db47e7e368e9a12c4877"
+SRCREV_machine_qemux86-64 ?= "1ef0d05b4662a4e5a075db47e7e368e9a12c4877"
+SRCREV_machine_qemumips64 ?= "2da40cf3f065512eea3729172f8e3f0cf1857160"
+SRCREV_machine ?= "1ef0d05b4662a4e5a075db47e7e368e9a12c4877"
+SRCREV_meta ?= "2647d22ea8ac2d3af6fe3b0d635cf84ee06f95e3"
 
 # remap qemuarm to qemuarma15 for the 5.4 kernel
 # KMACHINE_qemuarm ?= "qemuarma15"
@@ -30,7 +30,7 @@ SRC_URI = "git://git.yoctoproject.org/linux-yocto.git;name=machine;branch=${KBRA
            git://git.yoctoproject.org/yocto-kernel-cache;type=kmeta;name=meta;branch=yocto-5.4;destsuffix=${KMETA}"
 
 LIC_FILES_CHKSUM = "file://COPYING;md5=bbea815ee2795b2f4230826c0c6b8814"
-LINUX_VERSION ?= "5.4.40"
+LINUX_VERSION ?= "5.4.42"
 
 DEPENDS += "${@bb.utils.contains('ARCH', 'x86', 'elfutils-native', '', d)}"
 DEPENDS += "openssl-native util-linux-native"
-- 
2.19.1

