Return-Path: <steve@sakoman.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 5CAC6CCA47C
	for <webhook@archiver.kernel.org>; Mon, 13 Jun 2022 14:22:27 +0000 (UTC)
Received: from mail-pj1-f45.google.com (mail-pj1-f45.google.com
 [209.85.216.45])
 by mx.groups.io with SMTP id smtpd.web09.6462.1655130146728978487
 for <openembedded-core@lists.openembedded.org>;
 Mon, 13 Jun 2022 07:22:26 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@sakoman-com.20210112.gappssmtp.com header.s=20210112
 header.b=gCk4ylDw;
 spf=softfail (domain: sakoman.com, ip: 209.85.216.45,
 mailfrom: steve@sakoman.com)
Received: by mail-pj1-f45.google.com with SMTP id e9so5759570pju.5
        for <openembedded-core@lists.openembedded.org>;
 Mon, 13 Jun 2022 07:22:26 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=sakoman-com.20210112.gappssmtp.com; s=20210112;
        h=from:to:subject:date:message-id:in-reply-to:references:mime-version
         :content-transfer-encoding;
        bh=2589qaSou/WqT49ULu2fqW7buoSBugjE2uyTWYFZX9U=;
        b=gCk4ylDwEKkptOIJeg9ypS+TjUciqNflEAbc49Jl7Lh3igmxY/6suZe9jzif/ZpxzJ
         FNODzW/vNF4ZSlC/ta+WzOCrpOG0Qem1xERa/Mmj5ZcHK5ARIkN0bJPOw+ZOtol6v2Fm
         kYDlg40uGpjRk+tQrog2QpD/om+EaoSI6IYc6EEFL+OgK114gYwoGLFSgOr6SJ5BhsHl
         sswiT64twVTp50ZLGoFPOI7Fw7wLI2UtoQdJ8jBZbJdB/fLXRrAz2Tebf8pdxULXR9Gx
         fvmv4IfVYVEipjb38gMpIiCJ8zvB+qZ4rUggqH9d+ozgXMI4mHv87+ZvYscr0kizUk4k
         kJ1g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:from:to:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=2589qaSou/WqT49ULu2fqW7buoSBugjE2uyTWYFZX9U=;
        b=ilHfQVW+KvVbL1Yav4aOoo+xT/TCzdHIKlvnp7yCQFIfCecmxYl6ecJikPDOMX4Al2
         kIq/7U0+iZo+X0e/p1bsvqxdhoyv4nc6F0ITDrGLl9KUfp6i+ZAXHTIDwhgfTUWHuzrZ
         ARmg8+4d65dLlvPiczjknZZBH1aeU93abIyXfIp033Swmw3XYkkYjegNU7/dMi7HbzF5
         DAdtxwRoAkVPIyu4d7kz++QWlPOk/Y+f0G/ry+xWXRs/q42Gi2Sdym4wWm8jxLvlnbmA
         O5r5tCz8EBwkSfulfZ83rhUjC6FmFW/Yd0Sxd0J+n5bvdddbfTT8c0ZxlryUWK1F7W8W
         jfaw==
X-Gm-Message-State: AJIora+B8OfWTek/+NHf4S3+lpKXI8quE1n6MLqDtYb+7H9SLFvlx0y8
	MqcNlDftz962YzqOyWAWe/CDeyCJ+tHerHso
X-Google-Smtp-Source: 
 AGRyM1tT+A/qlEzQpFE7BkpM7lXyfC3p0Jfz9wiIp/DslF7T90v+h++qbFOf2JjdMAYzoszJhkHKNQ==
X-Received: by 2002:a17:902:9889:b0:168:e0b6:2829 with SMTP id
 s9-20020a170902988900b00168e0b62829mr77448plp.76.1655130145228;
        Mon, 13 Jun 2022 07:22:25 -0700 (PDT)
Received: from hexa.router0800d9.com (dhcp-72-253-6-214.hawaiiantel.net.
 [72.253.6.214])
        by smtp.gmail.com with ESMTPSA id
 iz19-20020a170902ef9300b001636c0b98a7sm5159401plb.226.2022.06.13.07.22.23
        for <openembedded-core@lists.openembedded.org>
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 13 Jun 2022 07:22:24 -0700 (PDT)
From: Steve Sakoman <steve@sakoman.com>
To: openembedded-core@lists.openembedded.org
Subject: [OE-core][kirkstone 09/20] linux-yocto/5.15: update to v5.15.43
Date: Mon, 13 Jun 2022 04:21:41 -1000
Message-Id: 
 <3fb0fd6630316ad82063b72fb577f35202dd1a17.1655129917.git.steve@sakoman.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <cover.1655129917.git.steve@sakoman.com>
References: <cover.1655129917.git.steve@sakoman.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Mon, 13 Jun 2022 14:22:27 -0000
X-Groupsio-URL: 
 https://lists.openembedded.org/g/openembedded-core/message/166854

From: Bruce Ashfield <bruce.ashfield@gmail.com>

Updating  to the latest korg -stable release that comprises
the following commits:

    0e5bb338bf47 Linux 5.15.43
    d12cd0bf5d26 mptcp: Do TCP fallback on early DSS checksum failure
    c5871dddc145 Linux 5.15.42
    94bf8bfb009f afs: Fix afs_getattr() to refetch file status if callback break occurred
    e7647ddf0ac5 i2c: mt7621: fix missing clk_disable_unprepare() on error in mtk_i2c_probe()
    69c5d307dce1 lockdown: also lock down previous kgdb use
    649178c0493e mt76: mt7921e: fix possible probe failure after reboot
    a2797b550755 dt-bindings: pinctrl: aspeed-g6: remove FWQSPID group
    331c57431f7a Input: ili210x - fix reset timing
    149a25b82ca9 arm64: Enable repeat tlbi workaround on KRYO4XX gold CPUs
    47840af397be net: atlantic: verify hw_head_ lies within TX buffer ring
    948ddbdc5663 net: atlantic: add check for MAX_SKB_FRAGS
    2d1b336ffb77 net: atlantic: reduce scope of is_rsc_complete
    d955f45d1a56 net: atlantic: fix "frag[0] not initialized"
    fd721da2df7a net: stmmac: fix missing pci_disable_device() on error in stmmac_pci_probe()
    b076fa169465 ethernet: tulip: fix missing pci_disable_device() on error in tulip_init_one()
    dc5c5b74075f nl80211: fix locking in nl80211_set_tx_bitrate_mask()
    7140149849d2 net: fix wrong network header length
    4f631f9f9d08 fbdev: Prevent possible use-after-free in fb_release()
    92dc6278dec9 Revert "fbdev: Make fb_release() return -ENODEV if fbdev was unregistered"
    9e87c228be71 selftests: add ping test with ping_group_range tuned
    020fb19eae9c nl80211: validate S1G channel width
    4bcc2ab96fce mac80211: fix rx reordering with non explicit / psmp ack policy
    e2c54b945864 scsi: qla2xxx: Fix missed DMA unmap for aborted commands
    d711a211844a scsi: scsi_dh_alua: Properly handle the ALUA transitioning state
    0b56244bda16 perf bench numa: Address compiler error on s390
    dff5463bc750 perf regs x86: Fix arch__intr_reg_mask() for the hybrid platform
    d883b2e9afb1 gpio: mvebu/pwm: Refuse requests with inverted polarity
    e7c6ac3cc2b9 gpio: gpio-vf610: do not touch other bits when set the target bit
    86eac8d76101 perf build: Fix check for btf__load_from_kernel_by_id() in libbpf
    e80793223252 scsi: ufs: core: Fix referencing invalid rsp field
    d0116a3f25e2 riscv: dts: sifive: fu540-c000: align dma node name with dtschema
    11ad6bab26c8 net: bridge: Clear offload_fwd_mark when passing frame up bridge interface.
    88b937673b35 netfilter: flowtable: move dst_check to packet path
    c1e170b11276 netfilter: flowtable: pass flowtable to nf_flow_table_iterate()
    b8835ba8c029 netfilter: flowtable: fix TCP flow teardown
    e723f67cf0c7 igb: skip phy status check where unavailable
    bf6800a39494 mptcp: fix checksum byte order
    f67eeb03fea6 mptcp: reuse __mptcp_make_csum in validate_data_csum
    6e66d31618a9 mptcp: change the parameter of __mptcp_make_csum
    37bb8ea1542b ARM: 9197/1: spectre-bhb: fix loop8 sequence for Thumb2
    b88e30dcdf64 ARM: 9196/1: spectre-bhb: enable for Cortex-A15
    ad54e63b832d net: af_key: add check for pfkey_broadcast in function pfkey_process
    404877831816 net/mlx5e: Properly block LRO when XDP is enabled
    9cec84ed7ca7 net/mlx5: DR, Fix missing flow_source when creating multi-destination FW table
    2372405955f9 NFC: nci: fix sleep in atomic context bugs caused by nci_skb_alloc
    1b0c87de277e net/qla3xxx: Fix a test in ql_reset_work()
    212ca7bb55d3 clk: at91: generated: consider range when calculating best rate
    2b037a3bedf8 ice: Fix interrupt moderation settings getting cleared
    a2fd0fb3baaf ice: move ice_container_type onto ice_ring_container
    737fbf0c3263 ice: fix possible under reporting of ethtool Tx and Rx statistics
    12fd5b112117 ice: fix crash when writing timestamp on RX rings
    e35387a91318 net: vmxnet3: fix possible NULL pointer dereference in vmxnet3_rq_cleanup()
    4ad09fdef55b net: vmxnet3: fix possible use-after-free bugs in vmxnet3_rq_alloc_rx_buf()
    2c560e90086f net: systemport: Fix an error handling path in bcm_sysport_probe()
    eb0ebbd4b0d4 Revert "PCI: aardvark: Rewrite IRQ code to chained IRQ handler"
    b329889974ae netfilter: nft_flow_offload: fix offload with pppoe + vlan
    f96b2e067212 net: fix dev_fill_forward_path with pppoe + bridge
    7613dcaceee2 netfilter: nft_flow_offload: skip dst neigh lookup for ppp devices
    5f4197a020c0 netfilter: flowtable: fix excessive hw offload attempts after failure
    c22ee3a0674c net/sched: act_pedit: sanitize shift argument before usage
    952c24649638 xfrm: fix "disable_policy" flag use when arriving from different devices
    36d8cca5b46f xfrm: rework default policy structure
    ad7491e92b71 net: macb: Increment rx bd head after allocating skb and buffer
    999ee216c65e net: ipa: record proper RX transaction count
    636184fd1bd4 ALSA: hda - fix unused Realtek function when PM is not enabled
    84b6e3d58955 pinctrl: mediatek: mt8365: fix IES control pins
    53bac31c8d8a ARM: dts: aspeed: Add video engine to g6
    ed978be2afb5 ARM: dts: aspeed: Add secure boot controller node
    794f7da40d65 ARM: dts: aspeed: Add ADC for AST2600 and enable for Rainier and Everest
    75e9562bb4bf ARM: dts: aspeed-g6: fix SPI1/SPI2 quad pin group
    f234feed77d2 pinctrl: pinctrl-aspeed-g6: remove FWQSPID group in pinctrl
    b29774c208a3 ARM: dts: aspeed-g6: remove FWQSPID group in pinctrl dtsi
    250f71a57559 dma-buf: ensure unique directory name for dmabuf stats
    6a4c06e265ea dma-buf: fix use of DMA_BUF_SET_NAME_{A,B} in userspace
    deec86168170 drm/dp/mst: fix a possible memory leak in fetch_monitor_name()
    aaf0f01d074d drm/i915/dmc: Add MMIO range restrictions
    9d3ec4e5bf03 drm/amd: Don't reset dGPUs if the system is going to s2idle
    24501d51c6b4 libceph: fix potential use-after-free on linger ping and resends
    8a06f25f5941 crypto: qcom-rng - fix infinite loop on requests not multiple of WORD_SZ
    c42f9a5a3aae arm64: mte: Ensure the cleared tags are visible before setting the PTE
    e9ea44dc030d arm64: paravirt: Use RCU read locks to guard stolen_time
    a3c0ba7870b9 KVM: x86/mmu: Update number of zapped pages even if page list is stable
    9f8f09d92ab6 Revert "can: m_can: pci: use custom bit timings for Elkhart Lake"
    f5012bad435d PCI/PM: Avoid putting Elo i2 PCIe Ports in D3cold
    42d8a6dc45fc Fix double fget() in vhost_net_set_backend()
    0f71433eb705 selinux: fix bad cleanup on error in hashtab_duplicate()
    e085354dde25 perf: Fix sys_perf_event_open() race against self
    f380aba42199 ALSA: hda/realtek: Add quirk for TongFang devices with pop noise
    48550a90e408 ALSA: wavefront: Proper check of get_user() error
    74f64e7d18bb ALSA: usb-audio: Restore Rane SL-1 quirk
    e156805ae285 nilfs2: fix lockdep warnings during disk space reclamation
    d05cc5395e36 nilfs2: fix lockdep warnings in page operations for btree nodes
    2a8b2f6a91d1 ARM: 9191/1: arm/stacktrace, kasan: Silence KASAN warnings in unwind_frame()
    6d32c58b267a platform/chrome: cros_ec_debugfs: detach log reader wq from devm
    1848108927ce drbd: remove usage of list iterator variable after loop
    98e0a2e96a78 MIPS: lantiq: check the return value of kzalloc()
    9a865748658b fs: fix an infinite loop in iomap_fiemap
    258a7a7fb568 rtc: mc146818-lib: Fix the AltCentury for AMD platforms
    9690e989d263 nvme-multipath: fix hang when disk goes live over reconnect
    d44ff3b100b9 nvmet: use a private workqueue instead of the system workqueue
    b6f7efb9221b tools/virtio: compile with -pthread
    87c54a0b6475 vhost_vdpa: don't setup irq offloading when irq_num < 0
    4e32c4c7016e s390/pci: improve zpci_dev reference counting
    2d5f611add95 s390/traps: improve panic message for translation-specification exception
    3e3f28529a52 ALSA: hda/realtek: Enable headset mic on Lenovo P360
    4e640d4a9d14 crypto: x86/chacha20 - Avoid spurious jumps to other functions
    625ff6f49789 crypto: stm32 - fix reference leak in stm32_crc_remove
    0a482fc4290b rtc: sun6i: Fix time overflow handling
    8b2ea9a3a159 gfs2: Disable page faults during lockless buffered reads
    3fbccc4082c1 nvme-pci: add quirks for Samsung X5 SSDs
    a6ae0d0b7b6b Input: stmfts - fix reference leak in stmfts_input_open
    021138310983 Input: add bounds checking to input_set_capability()
    3ec283635457 um: Cleanup syscall_handler_t definition/cast, fix warning
    fe9f2f3a68fc rtc: pcf2127: fix bug when reading alarm registers
    25ddeb6be3d9 rtc: fix use-after-free on device removal
    11e6a90ffd62 Revert "drm/i915/opregion: check port number bounds for SWSCI display power state"
    a12252908221 mm/kfence: reset PG_slab and memcg_data before freeing __kfence_pool
    486bcceeed04 Watchdog: sp5100_tco: Enable Family 17h+ CPUs
    b4c0f1600df4 Watchdog: sp5100_tco: Add initialization using EFCH MMIO
    3bb1b58c53b0 Watchdog: sp5100_tco: Refactor MMIO base address initialization
    8ed3e7523df3 Watchdog: sp5100_tco: Move timer initialization into function
    5996d3601e77 i2c: piix4: Enable EFCH MMIO for Family 17h+
    d46b4ff3bb0b i2c: piix4: Add EFCH MMIO support for SMBus port select
    c4194b266bf7 i2c: piix4: Add EFCH MMIO support to SMBus base address detect
    4b965566ca26 i2c: piix4: Add EFCH MMIO support to region request and release
    08bc26f28bcb i2c: piix4: Move SMBus port selection into function
    9a8119ddc3c5 i2c: piix4: Move SMBus controller base address detect into function
    bdf9bed734c3 i2c: piix4: Move port I/O region request/release code into functions
    5166f933da0e i2c: piix4: Replace hardcoded memory map size with a #define
    879e811a41f8 kernel/resource: Introduce request_mem_region_muxed()
    fc2bee93e31b floppy: use a statically allocated error counter
    5655455a06b8 io_uring: arm poll for non-nowait files
    d9bae32c6a32 usb: gadget: fix race when gadget driver register via ioctl
    9f43e3ac7e66 Linux 5.15.41
    4962e5a2f301 usb: gadget: uvc: allow for application to cleanly shutdown
    9c76663f73f1 usb: gadget: uvc: rename function to be more consistent
    6a060190f247 ping: fix address binding wrt vrf
    54f6834b283d SUNRPC: Ensure we flush any closed sockets before xs_xprt_free()
    cc57b2e4a737 mm/hwpoison: use pr_err() instead of dump_page() in get_any_page()
    789891632901 dma-buf: call dma_buf_stats_setup after dmabuf is in valid list
    0fad10b263a3 Revert "drm/amd/pm: keep the BACO feature enabled for suspend"
    86ea55e80ddc drm/vmwgfx: Initialize drm_mode_fb_cmd2
    e05949240b4d SUNRPC: Ensure that the gssproxy client can start in a connected state
    962686f619ae net: phy: micrel: Pass .probe for KS8737
    bfec9d6a909f net: phy: micrel: Do not use kszphy_suspend/resume for KSZ8061
    3539241b5936 arm[64]/memremap: don't abuse pfn_valid() to ensure presence of linear map
    8e1716993ba0 cgroup/cpuset: Remove cpus_allowed/mems_allowed setup in cpuset_init_smp()
    80b6fb3d181d writeback: Avoid skipping inode writeback
    1bd91049e378 net: phy: Fix race condition on link status change
    890a5c6d1981 net: atlantic: always deep reset on pm op, fixing up my null deref regression
    8d2cc06d653a i40e: i40e_main: fix a missing check on list iterator
    73ad9e6023a4 drm/nouveau/tegra: Stop using iommu_present()
    7d8b5d344a41 drm/vmwgfx: Disable command buffers on svga3 without gbobjects
    f8f836100fff mm/huge_memory: do not overkill when splitting huge_zero_page
    0e89d770dca5 Revert "mm/memory-failure.c: skip huge_zero_page in memory_failure()"
    8c09cb115e9f ceph: fix setting of xattrs on async created inodes
    73e12d4d33bc serial: 8250_mtk: Fix register address for XON/XOFF character
    d01eb92f8b42 serial: 8250_mtk: Fix UART_EFR register address
    7ef67d38b294 fsl_lpuart: Don't enable interrupts too early
    7207e12d244b slimbus: qcom: Fix IRQ check in qcom_slim_probe
    113ac16e51bc USB: serial: option: add Fibocom MA510 modem
    f2ab0c604b1a USB: serial: option: add Fibocom L610 modem
    84cd0f9b2608 USB: serial: qcserial: add support for Sierra Wireless EM7590
    34669b1c7398 USB: serial: pl2303: add device id for HP LM930 Display
    cb59b3092ab7 usb: typec: tcpci_mt6360: Update for BMC PHY setting
    f5c774bdc1d6 usb: typec: tcpci: Don't skip cleanup in .remove() on error
    92764e5bedf2 usb: cdc-wdm: fix reading stuck on device close
    643760ff0fcf tty: n_gsm: fix mux activation issues in gsm_config()
    e68de92d2f39 tty: n_gsm: fix buffer over-read in gsm_dlci_data()
    99fbf2653836 tty/serial: digicolor: fix possible null-ptr-deref in digicolor_uart_probe()
    04d5b08e6697 x86/mm: Fix marking of unused sub-pmd ranges
    5399686de11e usb: xhci-mtk: fix fs isoc's transfer error
    0912e07d4f3c KVM: PPC: Book3S PR: Enable MSR_DR for switch_mmu_context()
    12ff11142100 firmware_loader: use kernel credentials when reading firmware
    4e6a74c8b444 interconnect: Restore sync state by ignoring ipa-virt in provider count
    f26c6f9404e1 tcp: drop the hash_32() part from the index calculation
    952a238d779e tcp: increase source port perturb table to 2^16
    4a3eefa399e6 tcp: dynamically allocate the perturb table used by source ports
    b763fce193b4 tcp: add small random increments to the source port
    f41f6336bfc4 tcp: resalt the secret every 10 seconds
    ff01554d8755 tcp: use different parts of the port_offset for index and offset
    1a8ee547da2b secure_seq: use the 64 bits of the siphash for port offset calculation
    99858114a3b2 net: sfp: Add tx-fault workaround for Huawei MA5671A SFP ONT
    39740a06ca7a net: emaclite: Don't advertise 1000BASE-T and do auto negotiation
    4bf5bc44ea9e ASoC: SOF: Fix NULL pointer exception in sof_pci_probe callback
    46125e40a917 s390: disable -Warray-bounds
    e9cd31881e5c ASoC: ops: Validate input values in snd_soc_put_volsw_range()
    7758a40d8608 ASoC: max98090: Generate notifications on changes for custom control
    081188d82e5b ASoC: max98090: Reject invalid values in custom control put()
    e1d387eead8b iommu: arm-smmu: disable large page mappings for Nvidia arm-smmu
    2f6b75c03c7f RDMA/irdma: Fix deadlock in irdma_cleanup_cm_core()
    f21579e443f6 hwmon: (f71882fg) Fix negative temperature
    41d5ad959670 gfs2: Fix filesystem block deallocation for short writes
    cf2589a6679c drm/vmwgfx: Fix fencing on SVGAv3
    70098cc9569f tls: Fix context leak on tls_device_down
    280a93745c92 net: sfc: ef10: fix memory leak in efx_ef10_mtd_probe()
    8d75d66ff177 net/smc: non blocking recvmsg() return -EAGAIN when no data and signal_pending
    e3e02d681d12 net: dsa: bcm_sf2: Fix Wake-on-LAN with mac_link_down()
    18f03c3343d2 drm/vc4: hdmi: Fix build error for implicit function declaration
    6e4c10cbbb3e net: bcmgenet: Check for Wake-on-LAN interrupt probe deferral
    598483f1fe08 net: ethernet: mediatek: ppe: fix wrong size passed to memset()
    b773640d5bb9 net/sched: act_pedit: really ensure the skb is writable
    3a518561a3c3 s390/lcs: fix variable dereferenced before check
    2bd57101c3ec s390/ctcm: fix potential memory leak
    21bb0246af42 s390/ctcm: fix variable dereferenced before check
    79e87cfc82e6 virtio: fix virtio transitional ids
    4147d2e1a0ac arm64: vdso: fix makefile dependency on vdso.so
    00782d1dddea selftests: vm: Makefile: rename TARGETS to VMTARGETS
    62cbb09899f7 procfs: prevent unprivileged processes accessing fdinfo dir
    844c31a4534e hwmon: (ltq-cputemp) restrict it to SOC_XWAY
    5f71bc9a6b14 dim: initialize all struct fields
    53a55a3124a8 ionic: fix missing pci_release_regions() on error in ionic_probe()
    1a2e139e68bb nfs: fix broken handling of the softreval mount option
    8bf4039e3e19 mac80211_hwsim: call ieee80211_tx_prepare_skb under RCU protection
    7b2fa7ad6bf2 net: sfc: fix memory leak due to ptp channel
    fc4615a8e9f5 sfc: Use swap() instead of open coding it
    ef090cd44dd9 fbdev: efifb: Fix a use-after-free due early fb_info cleanup
    42125c81ca25 net: chelsio: cxgb4: Avoid potential negative array offset
    fa189827f00c netlink: do not reset transport header in netlink_recvmsg()
    57d6374f5c1c drm/nouveau: Fix a potential theorical leak in nouveau_get_backlight_name()
    337530058e17 ipv4: drop dst in multicast routing path
    04b199e47050 ice: fix PTP stale Tx timestamps cleanup
    4a5c4713ff1e ice: Fix race during aux device (un)plugging
    50bf9411372e platform/surface: aggregator: Fix initialization order when compiling as builtin module
    f94aa46efaa0 fbdev: vesafb: Cleanup fb_info in .fb_destroy rather than .remove
    cd3c8abbdc4e fbdev: efifb: Cleanup fb_info in .fb_destroy rather than .remove
    02eef429bf4a fbdev: simplefb: Cleanup fb_info in .fb_destroy rather than .remove
    4ebbf76dcbe5 net: mscc: ocelot: avoid corrupting hardware counters when moving VCAP filters
    e4a3386221d2 net: mscc: ocelot: restrict tc-trap actions to VCAP IS2 lookup 0
    ceffde8c6e1d net: mscc: ocelot: fix VCAP IS2 filters matching on both lookups
    d242b66a3140 net: mscc: ocelot: fix last VCAP IS1/IS2 filter persisting in hardware when deleted
    cc22bb201d77 net: Fix features skip in for_each_netdev_feature()
    afc080e42f8a mac80211: Reset MBSSID parameters upon connection
    e346e603625a hwmon: (tmp401) Add OF device ID table
    e29b71fc793e iwlwifi: iwl-dbg: Use del_timer_sync() before freeing
    8f37aad74f46 batman-adv: Don't skb_split skbuffs with frag_list
    ae766496dbd4 Linux 5.15.40
    5f0023211221 mm: fix invalid page pointer returned with FOLL_PIN gups
    954c78ed8c84 mm/mlock: fix potential imbalanced rlimit ucounts adjustment
    acf3e6843a85 mm/hwpoison: fix error page recovered but reported "not recovered"
    13d75c31a8ad mm: userfaultfd: fix missing cache flush in mcopy_atomic_pte() and __mcopy_atomic()
    72dd0487237d mm: shmem: fix missing cache flush in shmem_mfill_atomic_pte()
    e36b476a829c mm: hugetlb: fix missing cache flush in copy_huge_page_from_user()
    97a9f80290aa mm: fix missing cache flush for all tail pages of compound page
    9e951f2d85c9 udf: Avoid using stale lengthOfImpUse
    3d9c1d39237e rfkill: uapi: fix RFKILL_IOCTL_MAX_SIZE ioctl request definition
    b063e8cbec3c Bluetooth: Fix the creation of hdev->name
    01986c7dbf9d objtool: Fix SLS validation for kcov tail-call replacement
    41b6878eedf8 crypto: x86/poly1305 - Fixup SLS
    f277e36addad kvm/emulate: Fix SETcc emulation function offsets with SLS
    80c8ac8eca77 tools arch: Update arch/x86/lib/mem{cpy,set}_64.S copies used in 'perf bench mem memcpy'
    370d33da35e3 x86: Add straight-line-speculation mitigation
    d11f96d0c0c3 kbuild: move objtool_args back to scripts/Makefile.build
    f835241fdb0f x86/alternative: Relax text_poke_bp() constraint
    ee4724cc045f objtool: Add straight-line-speculation validation
    a467f694a46d x86: Prepare inline-asm for straight-line-speculation
    14b476e07fab x86: Prepare asm files for straight-line-speculation
    89837223d00d x86/lib/atomic64_386_32: Rename things
    c9e18547cc55 Linux 5.15.39
    4b4f9f172af4 PCI: aardvark: Update comment about link going down after link-up
    0dde2c7e6afb PCI: aardvark: Drop __maybe_unused from advk_pcie_disable_phy()
    c29d876c202c PCI: aardvark: Don't mask irq when mapping
    f0a2ee95dfeb PCI: aardvark: Remove irq_mask_ack() callback for INTx interrupts
    03da50b8e42e PCI: aardvark: Use separate INTA interrupt for emulated root bridge
    038c1516178c PCI: aardvark: Fix support for PME requester on emulated bridge
    cf7ef0e3029e PCI: aardvark: Add support for PME interrupts
    4da95b9fdad3 PCI: aardvark: Optimize writing PCI_EXP_RTCTL_PMEIE and PCI_EXP_RTSTA_PME on emulated bridge
    2aa9f36c3931 PCI: aardvark: Add support for ERR interrupt on emulated bridge
    d8efde346003 PCI: aardvark: Enable MSI-X support
    0993795b2f7a PCI: aardvark: Fix setting MSI address
    6e80e16149b9 PCI: aardvark: Add support for masking MSI interrupts
    d4bd61f99d13 PCI: aardvark: Refactor unmasking summary MSI interrupt
    b904c90a4624 PCI: aardvark: Use dev_fwnode() instead of of_node_to_fwnode(dev->of_node)
    0a5d0a9808ef PCI: aardvark: Make msi_domain_info structure a static driver structure
    d951cbef2e46 PCI: aardvark: Make MSI irq_chip structures static driver structures
    9e475a95c59b PCI: aardvark: Check return value of generic_handle_domain_irq() when processing INTx IRQ
    95bd4e10877c PCI: aardvark: Rewrite IRQ code to chained IRQ handler
    c1e237cd6463 PCI: aardvark: Replace custom PCIE_CORE_INT_* macros with PCI_INTERRUPT_*
    ac76c36aa417 PCI: aardvark: Disable common PHY when unbinding driver
    a346d08ca45e PCI: aardvark: Disable link training when unbinding driver
    246a36b66377 PCI: aardvark: Assert PERST# when unbinding driver
    af27f54e6224 PCI: aardvark: Fix memory leak in driver unbind
    55e38c42051d PCI: aardvark: Mask all interrupts when unbinding driver
    5c9fc7a028da PCI: aardvark: Disable bus mastering when unbinding driver
    6ee10ccca811 PCI: aardvark: Comment actions in driver remove method
    2855fb2b6340 PCI: aardvark: Clear all MSIs at setup
    5ea7bcb084ae PCI: aardvark: Add support for DEVCAP2, DEVCTL2, LNKCAP2 and LNKCTL2 registers on emulated bridge
    739c052b9b26 PCI: pci-bridge-emul: Add definitions for missing capabilities registers
    b3ca84e3c66a PCI: pci-bridge-emul: Add description for class_revision field
    0060c7bd9e33 rcu: Apply callbacks processing time limit only on softirq
    2c5029d652f3 rcu: Fix callbacks processing time limit retaining cond_resched()
    38b9770741ae Revert "parisc: Mark sched_clock unstable only if clocks are not syncronized"
    e3c465defa0f mmc: rtsx: add 74 Clocks in power on flow
    0b4e16093e08 selftest/vm: verify remap destination address in mremap_test
    e8b9989597da selftest/vm: verify mmap addr in mremap_test
    680e982ae89b KVM: LAPIC: Enable timer posted-interrupt only when mwait/hlt is advertised
    8e10a00b1876 KVM: x86/mmu: avoid NULL-pointer dereference on page freeing bugs
    6b68f26a6556 KVM: x86: Do not change ICR on write to APIC_SELF_IPI
    ddba1a4aadd4 x86/kvm: Preserve BSP MSR_KVM_POLL_CONTROL across suspend/resume
    067f2fbe4ac9 KVM: selftests: Silence compiler warning in the kvm_page_table_test
    119a65a465f5 kvm: selftests: do not use bitfields larger than 32-bits for PTEs
    aa9993f8f984 iommu/dart: Add missing module owner to ops structure
    7f95fdff56e9 net/mlx5e: Lag, Don't skip fib events on current dst
    7fc51e7e7b6b net/mlx5e: Lag, Fix fib_info pointer assignment
    197bd9738a97 net/mlx5e: Lag, Fix use-after-free in fib event handler
    bc8e74239fb8 net/mlx5: Fix slab-out-of-bounds while reading resource dump menu
    161568b7494a fbdev: Make fb_release() return -ENODEV if fbdev was unregistered
    11f5f236dbd6 kvm: x86/cpuid: Only provide CPUID leaf 0xA if host has architectural PMU
    3e56e9a7f2cc gpio: mvebu: drop pwm base assignment
    94ca25aed123 drm/amdgpu: Ensure HDA function is suspended before ASIC reset
    060102fbd92d drm/amdgpu: don't set s3 and s0ix at the same time
    22b80bff1726 drm/amdgpu: explicitly check for s0ix when evicting resources
    90253ae21c6b drm/amdgpu: unify BO evicting method in amdgpu_ttm
    3d0e7373b291 btrfs: always log symlinks in full mode
    e42a8545487e btrfs: force v2 space cache usage for subpage mount
    1222440c4a1a smsc911x: allow using IRQ0
    e447338d51b0 selftests: ocelot: tc_flower_chains: specify conform-exceed action for policer
    45967729f2a5 bnxt_en: Fix unnecessary dropping of RX packets
    cb0c054accc5 bnxt_en: Fix possible bnxt_open() failure caused by wrong RFS flag
    814d91a84ac3 selftests: mirror_gre_bridge_1q: Avoid changing PVID while interface is operational
    01b7fe62cbf5 rxrpc: Enable IPv6 checksums on transport socket
    9bcb779ba80b mld: respect RCU rules in ip6_mc_source() and ip6_mc_msfilter()
    299c189f4778 hinic: fix bug of wq out of bound access
    74b9abc46862 btrfs: do not BUG_ON() on failure to update inode when setting xattr
    b79815c35416 drm/msm/dp: remove fail safe mode related code
    e325bef5f67d selftests/net: so_txtime: usage(): fix documentation of default clock
    ba5ece30153c selftests/net: so_txtime: fix parsing of start time stamp on 32 bit systems
    da07b2e273b3 net: emaclite: Add error handling for of_address_to_resource()
    8010fdba29e4 net: igmp: respect RCU rules in ip_mc_source() and ip_mc_msfilter()
    8fa3b32dfa28 net: cpsw: add missing of_node_put() in cpsw_probe_dt()
    1dfbeb85a4c9 net: mdio: Fix ENOMEM return value in BCM6368 mux bus controller
    1043a3c44641 net: stmmac: dwmac-sun8i: add missing of_node_put() in sun8i_dwmac_register_mdio_mux()
    8c703731e7d5 net: dsa: mt7530: add missing of_node_put() in mt7530_setup()
    bd7e519ff79a net: ethernet: mediatek: add missing of_node_put() in mtk_sgmii_init()
    d34f9bbc1d19 NFSv4: Don't invalidate inode attributes on delegation return
    a61a55823711 RDMA/irdma: Fix possible crash due to NULL netdev in notifier
    22d872b7adce RDMA/irdma: Reduce iWARP QP destroy time
    62e9930ff8ca RDMA/irdma: Flush iWARP QP if modified to ERR from RTR state
    546c957f313a RDMA/siw: Fix a condition race issue in MPA request processing
    53b33d43fc45 SUNRPC release the transport of a relocated task with an assigned transport
    6352ecab8a3f selftests/seccomp: Don't call read() on TTY from background pgrp
    642e0de286af net/mlx5: Fix deadlock in sync reset flow
    e967439d76e0 net/mlx5: Avoid double clear or set of sync reset requested
    9d6d76f5f190 net/mlx5e: Fix the calling of update_buffer_lossy() API
    d9b4965d2401 net/mlx5e: CT: Fix queued up restore put() executing after relevant ft release
    32d9ad28dcda net/mlx5e: Don't match double-vlan packets if cvlan is not set
    ec26ba1f202a net/mlx5e: Fix trust state reset in reload
    504d9b86745e iommu/dart: check return value after calling platform_get_resource()
    af89d886edfc iommu/vt-d: Drop stop marker messages
    48c37e5ab679 ASoC: soc-ops: fix error handling
    ad06826f6130 ASoC: dmaengine: Restore NULL prepare_slave_config() callback
    051a2cede6c7 hwmon: (pmbus) disable PEC if not enabled
    64e5dd91d128 hwmon: (adt7470) Fix warning on module removal
    e75dd874e02a gpio: pca953x: fix irq_stat not updated when irq is disabled (irq_mask not set)
    8ec1096a09f1 gpio: visconti: Fix fwnode of GPIO IRQ
    7bd81a05d489 NFC: netlink: fix sleep in atomic bug when firmware download timeout
    b8f2b836e7d0 nfc: nfcmrvl: main: reorder destructive operations in nfcmrvl_nci_unregister_dev to avoid bugs
    a2168fb3128a nfc: replace improper check device_is_registered() in netlink related functions
    56a5ff94807d can: grcan: only use the NAPI poll budget for RX
    ab5adbcead00 can: grcan: grcan_probe(): fix broken system id check for errata workaround needs
    142305ab00e9 can: grcan: use ofdev->dev when allocating DMA memory
    30a63e7ef37f can: isotp: remove re-binding of bound socket
    b266f564c553 can: grcan: grcan_close(): fix deadlock
    392aeeceb9b6 s390/dasd: Fix read inconsistency for ESE DASD devices
    12b022a9f5c6 s390/dasd: Fix read for ESE with blksize < 4k
    cdf348236343 s390/dasd: prevent double format of tracks for ESE devices
    99bb425d7226 s390/dasd: fix data corruption for ESE devices
    7011cc9a2188 ASoC: meson: Fix event generation for AUI CODEC mux
    61c45cece50b ASoC: meson: Fix event generation for G12A tohdmi mux
    c7c0ceb7141d ASoC: meson: Fix event generation for AUI ACODEC mux
    66e5f6d561c7 ASoC: wm8958: Fix change notifications for DSP controls
    a5581587bbee ASoC: da7219: Fix change notifications for tone generator frequency
    61808e408952 genirq: Synchronize interrupt thread startup
    41eebbf90dfb net: stmmac: disable Split Header (SPH) for Intel platforms
    282eab6e3826 firewire: core: extend card->lock in fw_core_handle_bus_reset
    95726e666093 firewire: remove check of list iterator against head past the loop body
    e259ba5c08d3 firewire: fix potential uaf in outbound_phy_packet_callback()
    07adb6954548 timekeeping: Mark NMI safe time accessors as notrace
    09e7e3aee713 Revert "SUNRPC: attempt AF_LOCAL connect on setup"
    148faea97855 RISC-V: relocate DTB if it's outside memory region
    1a78d8fe6606 drm/amdgpu: do not use passthrough mode in Xen dom0
    c10bab89a1be drm/amd/display: Avoid reading audio pattern past AUDIO_CHANNELS_COUNT
    2c14dda7a4df iommu/arm-smmu-v3: Fix size calculation in arm_smmu_mm_invalidate_range()
    d503958eea81 iommu/vt-d: Calculate mask for non-aligned flushes
    91a97c86a8f0 KVM: x86/svm: Account for family 17h event renumberings in amd_pmc_perf_hw_id
    2e4d4123c861 x86/fpu: Prevent FPU state corruption
    d46f64fd9172 gpiolib: of: fix bounds check for 'gpio-reserved-ranges'
    a06979edcc47 mmc: core: Set HS clock speed before sending HS CMD13
    56bba3ad290d mmc: sunxi-mmc: Fix DMA descriptors allocated above 32 bits
    3c0a0a2710c8 mmc: sdhci-msm: Reset GCC_SDCC_BCR register for SDHC
    d95bad91b419 ALSA: fireworks: fix wrong return count shorter than expected by 4 bytes
    9561b7ddcb78 ALSA: hda/realtek: Add quirk for Yoga Duet 7 13ITL6 speakers
    a49454368934 parisc: Merge model and model name into one line in /proc/cpuinfo
    f9a1dbc8b848 MIPS: Fix CP0 counter erratum detection for R4k CPUs

Signed-off-by: Bruce Ashfield <bruce.ashfield@gmail.com>
Signed-off-by: Richard Purdie <richard.purdie@linuxfoundation.org>
(cherry picked from commit c587bacddfc5d217638c8f97ac665d7baae60e4d)
Signed-off-by: Steve Sakoman <steve@sakoman.com>
---
 .../linux/linux-yocto-rt_5.15.bb              |  6 ++---
 .../linux/linux-yocto-tiny_5.15.bb            |  6 ++---
 meta/recipes-kernel/linux/linux-yocto_5.15.bb | 26 +++++++++----------
 3 files changed, 19 insertions(+), 19 deletions(-)

diff --git a/meta/recipes-kernel/linux/linux-yocto-rt_5.15.bb b/meta/recipes-kernel/linux/linux-yocto-rt_5.15.bb
index 5f58eece6f..d4da4de1f9 100644
--- a/meta/recipes-kernel/linux/linux-yocto-rt_5.15.bb
+++ b/meta/recipes-kernel/linux/linux-yocto-rt_5.15.bb
@@ -11,13 +11,13 @@ python () {
         raise bb.parse.SkipRecipe("Set PREFERRED_PROVIDER_virtual/kernel to linux-yocto-rt to enable it")
 }
 
-SRCREV_machine ?= "3cc07a80d507ab4fd25ad3adafe07d83bdcef401"
-SRCREV_meta ?= "eddfd0e846eee9307c95c40d706725afbedab285"
+SRCREV_machine ?= "7541f629ed38a02cdcd17251ce03f742b3b37ffd"
+SRCREV_meta ?= "d3948d57e924d1a28e3d9b7f0854dd8cdb525c9f"
 
 SRC_URI = "git://git.yoctoproject.org/linux-yocto.git;branch=${KBRANCH};name=machine \
            git://git.yoctoproject.org/yocto-kernel-cache;type=kmeta;name=meta;branch=yocto-5.15;destsuffix=${KMETA}"
 
-LINUX_VERSION ?= "5.15.38"
+LINUX_VERSION ?= "5.15.43"
 
 LIC_FILES_CHKSUM = "file://COPYING;md5=6bc538ed5bd9a7fc9398086aedcd7e46"
 
diff --git a/meta/recipes-kernel/linux/linux-yocto-tiny_5.15.bb b/meta/recipes-kernel/linux/linux-yocto-tiny_5.15.bb
index 144c20e271..ce7d6ca8dc 100644
--- a/meta/recipes-kernel/linux/linux-yocto-tiny_5.15.bb
+++ b/meta/recipes-kernel/linux/linux-yocto-tiny_5.15.bb
@@ -5,7 +5,7 @@ KCONFIG_MODE = "--allnoconfig"
 
 require recipes-kernel/linux/linux-yocto.inc
 
-LINUX_VERSION ?= "5.15.38"
+LINUX_VERSION ?= "5.15.43"
 LIC_FILES_CHKSUM = "file://COPYING;md5=6bc538ed5bd9a7fc9398086aedcd7e46"
 
 DEPENDS += "${@bb.utils.contains('ARCH', 'x86', 'elfutils-native', '', d)}"
@@ -14,8 +14,8 @@ DEPENDS += "openssl-native util-linux-native"
 KMETA = "kernel-meta"
 KCONF_BSP_AUDIT_LEVEL = "2"
 
-SRCREV_machine ?= "8037a6211ac7e61fae9eb3a33a54d72b373edee8"
-SRCREV_meta ?= "eddfd0e846eee9307c95c40d706725afbedab285"
+SRCREV_machine ?= "bb5851d13d957e796c8a27ff3047d28495b3389f"
+SRCREV_meta ?= "d3948d57e924d1a28e3d9b7f0854dd8cdb525c9f"
 
 PV = "${LINUX_VERSION}+git${SRCPV}"
 
diff --git a/meta/recipes-kernel/linux/linux-yocto_5.15.bb b/meta/recipes-kernel/linux/linux-yocto_5.15.bb
index 1666b8cc13..443c5f2e05 100644
--- a/meta/recipes-kernel/linux/linux-yocto_5.15.bb
+++ b/meta/recipes-kernel/linux/linux-yocto_5.15.bb
@@ -13,24 +13,24 @@ KBRANCH:qemux86  ?= "v5.15/standard/base"
 KBRANCH:qemux86-64 ?= "v5.15/standard/base"
 KBRANCH:qemumips64 ?= "v5.15/standard/mti-malta64"
 
-SRCREV_machine:qemuarm ?= "149e76317b407ceac4da56d9df79e6e58e2a4dd6"
-SRCREV_machine:qemuarm64 ?= "1bf709cb1641eb13a64d0bd4145e61e56805af6b"
-SRCREV_machine:qemumips ?= "8cc914d3021787d6c48fd1b25f15feb32c5be2cd"
-SRCREV_machine:qemuppc ?= "59e013f100ad1887cf28cd51912df011ae95ae92"
-SRCREV_machine:qemuriscv64 ?= "77aa9e489eafdd700df399b2e47a0ff313a91870"
-SRCREV_machine:qemuriscv32 ?= "77aa9e489eafdd700df399b2e47a0ff313a91870"
-SRCREV_machine:qemux86 ?= "77aa9e489eafdd700df399b2e47a0ff313a91870"
-SRCREV_machine:qemux86-64 ?= "77aa9e489eafdd700df399b2e47a0ff313a91870"
-SRCREV_machine:qemumips64 ?= "a0ae7ea1f60a75210784c684fb577b26a172f7db"
-SRCREV_machine ?= "77aa9e489eafdd700df399b2e47a0ff313a91870"
-SRCREV_meta ?= "eddfd0e846eee9307c95c40d706725afbedab285"
+SRCREV_machine:qemuarm ?= "a94c65101ab835b5f307cb4451b8da8f61b33fd6"
+SRCREV_machine:qemuarm64 ?= "2210f319d3e8efaa7c9bcaa4fe20ed2c3b22b7cb"
+SRCREV_machine:qemumips ?= "8d742e6f21ec98a53be9d41d449f1eef3262f522"
+SRCREV_machine:qemuppc ?= "eb8a6e8105ae65410761c3e77513222f8a4890f7"
+SRCREV_machine:qemuriscv64 ?= "74fd35c0e02bc154153378f96e777f29cdda3189"
+SRCREV_machine:qemuriscv32 ?= "74fd35c0e02bc154153378f96e777f29cdda3189"
+SRCREV_machine:qemux86 ?= "74fd35c0e02bc154153378f96e777f29cdda3189"
+SRCREV_machine:qemux86-64 ?= "74fd35c0e02bc154153378f96e777f29cdda3189"
+SRCREV_machine:qemumips64 ?= "481cf33f381449847e08ed322abb79c500f46efa"
+SRCREV_machine ?= "74fd35c0e02bc154153378f96e777f29cdda3189"
+SRCREV_meta ?= "d3948d57e924d1a28e3d9b7f0854dd8cdb525c9f"
 
 # set your preferred provider of linux-yocto to 'linux-yocto-upstream', and you'll
 # get the <version>/base branch, which is pure upstream -stable, and the same
 # meta SRCREV as the linux-yocto-standard builds. Select your version using the
 # normal PREFERRED_VERSION settings.
 BBCLASSEXTEND = "devupstream:target"
-SRCREV_machine:class-devupstream ?= "3fbf24b73f4a5bc8fd39a6b7a29145451c1039ce"
+SRCREV_machine:class-devupstream ?= "0e5bb338bf471ec46924f744c4301751bab8793a"
 PN:class-devupstream = "linux-yocto-upstream"
 KBRANCH:class-devupstream = "v5.15/base"
 
@@ -38,7 +38,7 @@ SRC_URI = "git://git.yoctoproject.org/linux-yocto.git;name=machine;branch=${KBRA
            git://git.yoctoproject.org/yocto-kernel-cache;type=kmeta;name=meta;branch=yocto-5.15;destsuffix=${KMETA}"
 
 LIC_FILES_CHKSUM = "file://COPYING;md5=6bc538ed5bd9a7fc9398086aedcd7e46"
-LINUX_VERSION ?= "5.15.38"
+LINUX_VERSION ?= "5.15.43"
 
 DEPENDS += "${@bb.utils.contains('ARCH', 'x86', 'elfutils-native', '', d)}"
 DEPENDS += "openssl-native util-linux-native"
-- 
2.25.1


