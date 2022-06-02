Return-Path: <steve@sakoman.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 0508ECCA47D
	for <webhook@archiver.kernel.org>; Thu,  2 Jun 2022 16:52:44 +0000 (UTC)
Received: from mail-pj1-f45.google.com (mail-pj1-f45.google.com
 [209.85.216.45])
 by mx.groups.io with SMTP id smtpd.web12.1567.1654188758615807642
 for <openembedded-core@lists.openembedded.org>;
 Thu, 02 Jun 2022 09:52:38 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@sakoman-com.20210112.gappssmtp.com header.s=20210112
 header.b=IZFNab3y;
 spf=softfail (domain: sakoman.com, ip: 209.85.216.45,
 mailfrom: steve@sakoman.com)
Received: by mail-pj1-f45.google.com with SMTP id
 d12-20020a17090abf8c00b001e2eb431ce4so5324408pjs.1
        for <openembedded-core@lists.openembedded.org>;
 Thu, 02 Jun 2022 09:52:38 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=sakoman-com.20210112.gappssmtp.com; s=20210112;
        h=from:to:subject:date:message-id:in-reply-to:references:mime-version
         :content-transfer-encoding;
        bh=SR1foBUDI2g0Z/MaKVIv/uPKOpcTDw4Ety4O4EH57F8=;
        b=IZFNab3ykdqdXHPp5dl7gHPTXpQnQdzKWanFcYVWBnz3mWfS5HHeCz4+++B8qRcQwC
         fmCU0Khdq5ywiM4YXx1H0PXqhqVNuvdv5ysEYImmmOtucuEBpoZGh9EoMqC9NFd+ykeO
         AQgExgh7AFIbqhCJjPyP29HO4mXdT7LbTv5/au2hEfY8i1r8/eif9it0pOlDE/2aun1n
         CIBZo+81eiUytChMrYKQgLMJC6gBpf91etpsPINXeMfwAC6M1jsbrLd+RlK0B6ZNQP0a
         PchrnT4GBuiDXY67/yiBXAtc4TAXbRzK7N8YmtJTs/1TjcAwUaIA1G3tO2C/sLz0JVmP
         rLLg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:from:to:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=SR1foBUDI2g0Z/MaKVIv/uPKOpcTDw4Ety4O4EH57F8=;
        b=IfQWU8/P3XlDkBVvCfppweaXTdMoExXvKmGn2k5VLOyInEQPnsskrWYI3Pa6xDoTbM
         oFIoPNjogVjSQSMWwze+Dj4Kyv9ZQV0VvuIQfL1fTQlbYjPt98yGiBdMSRtLe8HzNrE2
         xl84HA3cni37KzllgMhDj+DlFgy2uOFkt9LyYCEWm0cWfrUHA5feTK1XMjaBLtMqr2DP
         AT/DxQkBLIV8Z69Xx6jdbr11Pb6yDk8DZzIhQL2ryildo3bwfz4FHB7uxxFl3eb0r4p8
         L2DdJjb6onPSzI8JWxYxPiI9x+Cfd/oEnl92B1iq2bYiaRfWrwrXbAavxNmOfTAVB8z7
         QZJg==
X-Gm-Message-State: AOAM5317eOTtYY5Sh/E7zeFODXrcpOFzhQ+c9ghILrfIbzMsV6WDDQJq
	XtZbI7exryTJHTg6AtUci7vbNIp2z8kpH2ka
X-Google-Smtp-Source: 
 ABdhPJzXTbiFTLMPkh9ho61crdxX8s8kuMNlmSFGRHzVlw0l62ref2Cy/sROuS6ViUsNUHr6VWVOlw==
X-Received: by 2002:a17:902:e806:b0:164:164c:5a63 with SMTP id
 u6-20020a170902e80600b00164164c5a63mr5820914plg.102.1654188757101;
        Thu, 02 Jun 2022 09:52:37 -0700 (PDT)
Received: from hexa.router0800d9.com (dhcp-72-253-6-214.hawaiiantel.net.
 [72.253.6.214])
        by smtp.gmail.com with ESMTPSA id
 i188-20020a626dc5000000b0050dc762815asm3782233pfc.52.2022.06.02.09.52.35
        for <openembedded-core@lists.openembedded.org>
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 02 Jun 2022 09:52:36 -0700 (PDT)
From: Steve Sakoman <steve@sakoman.com>
To: openembedded-core@lists.openembedded.org
Subject: [OE-core][kirkstone 11/26] linux-yocto/5.15: update to v5.15.38
Date: Thu,  2 Jun 2022 06:51:43 -1000
Message-Id: 
 <7d734c95baef7cb6dfbedfbad21edd86754d3ba1.1654188574.git.steve@sakoman.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <cover.1654188574.git.steve@sakoman.com>
References: <cover.1654188574.git.steve@sakoman.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Thu, 02 Jun 2022 16:52:43 -0000
X-Groupsio-URL: 
 https://lists.openembedded.org/g/openembedded-core/message/166488

From: Bruce Ashfield <bruce.ashfield@gmail.com>

Updating  to the latest korg -stable release that comprises
the following commits:

    3fbf24b73f4a Linux 5.15.38
    151322c24e87 powerpc/64: Add UADDR64 relocation support
    ec1bb681eee2 objtool: Fix type of reloc::addend
    19ffee7d6231 objtool: Fix code relocs vs weak symbols
    80c71d76e88a eeprom: at25: Use DMA safe buffers
    7d0010f62840 perf symbol: Remove arch__symbols__fixup_end()
    ea47db3bac7a tty: n_gsm: fix software flow control handling
    ab49c23668ea tty: n_gsm: fix incorrect UA handling
    e0a84ae1c662 tty: n_gsm: fix reset fifo race condition
    f92783b7568e tty: n_gsm: fix missing tty wakeup in convergence layer type 2
    aeacc7e81c71 tty: n_gsm: fix wrong signal octets encoding in MSC
    ef2f08ee00b0 tty: n_gsm: fix wrong command frame length field encoding
    e51f35470383 tty: n_gsm: fix wrong command retry handling
    73defa00a7bc tty: n_gsm: fix missing explicit ldisc flush
    2484787cde3d tty: n_gsm: fix wrong DLCI release order
    0a7fe1a47ca5 tty: n_gsm: fix insufficient txframe size
    87e1b4f90703 netfilter: nft_socket: only do sk lookups when indev is available
    a93d2d3189e8 tty: n_gsm: fix malformed counter for out of frame data
    0d6289c4a0e1 tty: n_gsm: fix wrong signal octet encoding in convergence layer type 2
    4e1beef38c35 tty: n_gsm: fix mux cleanup after unregister tty device
    8b19dfb3e817 tty: n_gsm: fix decoupled mux resource
    7f71387d9f3b tty: n_gsm: fix restart handling via CLD command
    a87a36badd94 perf symbol: Update symbols__fixup_end()
    cf7bf78f10bd perf symbol: Pass is_kallsyms to symbols__fixup_end()
    f858bd6536e1 x86/cpu: Load microcode during restore_processor_state()
    2333d2a72ba1 ARM: dts: imx8mm-venice-gw{71xx,72xx,73xx}: fix OTG controller OC mode
    0dc5cad09e32 ARM: dts: at91: sama7g5ek: enable pull-up on flexcom3 console lines
    cf12ce1bd71d btrfs: fix leaked plug after failure syncing log on zoned filesystems
    65b785cdb397 thermal: int340x: Fix attr.show callback prototype
    f3106b0b0113 ACPI: processor: idle: Avoid falling back to C3 type C-states
    d2bc6fc51e58 net: ethernet: stmmac: fix write to sgmii_adapter_base
    4e308b21bc16 drm/i915: Fix SEL_FETCH_PLANE_*(PIPE_B+) register addresses
    67434e132b8c drm/i915: Check EDID for HDR static metadata when choosing blc
    891883c426b8 netfilter: Update ip6_route_me_harder to consider L3 domain
    c63fbe063ffb mtd: rawnand: qcom: fix memory corruption that causes panic
    30083f049204 kasan: prevent cpu_quarantine corruption when CPU offline and cache shrink occur at same time
    051e78dc1f97 zonefs: Clear inode information flags on inode creation
    534c3f29acdd zonefs: Fix management of open zones
    746140625a0f Revert "ACPI: processor: idle: fix lockup regression on 32-bit ThinkPad T40"
    2688d967ec65 selftest/vm: verify remap destination address in mremap_test
    a17404fcbfd0 selftest/vm: verify mmap addr in mremap_test
    c18b69393b4f powerpc/perf: Fix 32bit compile
    9a90c13f72e7 drivers: net: hippi: Fix deadlock in rr_close()
    3bb73c4cc265 cifs: destage any unwritten data to the server before calling copychunk_write
    4640802e1cd4 x86: __memcpy_flushcache: fix wrong alignment if size > 2^32
    5bf8eda3815a bonding: do not discard lowest hash bit for non layer3+4 hashing
    d276bcc5f72e ksmbd: set fixed sector size to FS_SECTOR_SIZE_INFORMATION
    df30cbfd3d8a ksmbd: increment reference count of parent fp
    50f79a2abb65 arch: xtensa: platforms: Fix deadlock in rs_close()
    52c3a04f9ec2 ext4: fix bug_on in start_this_handle during umount filesystem
    dd2f7fcb2a43 ASoC: wm8731: Disable the regulator when probing fails
    2c5ca9bde710 ASoC: Intel: soc-acpi: correct device endpoints for max98373
    27e724bf7c51 tcp: fix F-RTO may not work correctly when receiving DSACK
    8de15dad3c77 Revert "ibmvnic: Add ethtool private flag for driver-defined queue limits"
    881c48b61fbb ixgbe: ensure IPsec VF<->PF compatibility
    3bc7a1f85d5b perf arm-spe: Fix addresses of synthesized SPE events
    3591293c19df gfs2: No short reads or writes upon glock contention
    b5afb477d2f8 gfs2: Make sure not to return short direct writes
    fe24959a79c9 gfs2: Minor retry logic cleanup
    e4ea3286b1aa gfs2: Prevent endless loops in gfs2_file_buffered_write
    a83ee2d81b34 net: fec: add missing of_node_put() in fec_enet_init_stop_mode()
    925ebcac26e4 bnx2x: fix napi API usage sequence
    87fe5a392d27 tls: Skip tls_append_frag on zero copy size
    815b847af99d drm/amd/display: Fix memory leak in dcn21_clock_source_create
    ce9be3baec9b drm/amdkfd: Fix GWS queue count
    54e0b949bf59 netfilter: conntrack: fix udp offload timeout sysctl
    37811e46a232 io_uring: check reserved fields for recv/recvmsg
    79c10cb18815 io_uring: check reserved fields for send/sendmsg
    ee6d708520b7 net: dsa: lantiq_gswip: Don't set GSWIP_MII_CFG_RMII_CLK
    8a991ba5ddde drm/sun4i: Remove obsolete references to PHYS_OFFSET
    ede22fc0bf7e net: dsa: mv88e6xxx: Fix port_hidden_wait to account for port_base_addr
    9b649f4c5672 net: phy: marvell10g: fix return value on error
    21bf1dc99db4 net: bcmgenet: hide status block before TX timestamping
    abff341ac2f9 cpufreq: qcom-cpufreq-hw: Clear dcvs interrupts
    7356c1f0ae47 clk: sunxi: sun9i-mmc: check return value after calling platform_get_resource()
    409789e2cec5 bus: sunxi-rsb: Fix the return value of sunxi_rsb_device_create()
    45b7fca32bbc tcp: make sure treq->af_specific is initialized
    6c4d4334e573 tcp: fix potential xmit stalls caused by TCP_NOTSENT_LOWAT
    6b59df7d4d0a ip_gre, ip6_gre: Fix race condition on o_seqno in collect_md mode
    e5e985dd99d8 ip6_gre: Make o_seqno start from 0 in native mode
    2dec240fb161 ip_gre: Make o_seqno start from 0 in native mode
    479dc5d15316 net/smc: sync err code when tcp connection was refused
    8c59a61ffb11 net: hns3: add return value for mailbox handling in PF
    fc480b465ab6 net: hns3: add validity check for message data length
    cfedc70d3c63 net: hns3: modify the return code of hclge_get_ring_chain_from_mbx
    88c39408187c net: hns3: clear inited state and stop client after failed to register netdev
    ac01adfa7d6d cpufreq: fix memory leak in sun50i_cpufreq_nvmem_probe
    cdc350a76925 pinctrl: pistachio: fix use of irq_of_parse_and_map()
    111827dfea31 arm64: dts: imx8mn-ddr4-evk: Describe the 32.768 kHz PMIC clock
    a621f6ce1fb3 ARM: dts: imx6ull-colibri: fix vqmmc regulator
    5a4da2e23351 sctp: check asoc strreset_chunk in sctp_generate_reconf_event
    37a04788c573 wireguard: device: check for metadata_dst with skb_valid_dst()
    d632cba7dee7 tcp: ensure to use the most recently sent skb when filling the rate sample
    e9b1a51c3297 pinctrl: stm32: Keep pinctrl block clock enabled when LEVEL IRQ requested
    eb90a4269c20 tcp: md5: incorrect tcp_header_len for incoming connections
    eea166561f7c pinctrl: rockchip: fix RK3308 pinmux bits
    86d8076e5971 bpf, lwt: Fix crash when using bpf_skb_set_tunnel_key() from bpf_xmit lwt hook
    c2a69ac00b42 netfilter: nft_set_rbtree: overlap detection with element re-addition after deletion
    9cc897ca03df net: dsa: Add missing of_node_put() in dsa_port_link_register_of
    72e7940b00b5 memory: renesas-rpc-if: Fix HF/OSPI data transfer in Manual Mode
    2075f6f8e627 pinctrl: stm32: Do not call stm32_gpio_get() for edge triggered IRQs in EOI
    291ee6787b35 mtd: fix 'part' field data corruption in mtd_info
    6465a2120b23 mtd: rawnand: Fix return value check of wait_for_completion_timeout
    102775603cd9 pinctrl: mediatek: moore: Fix build error
    d3dfa4954e35 phy: amlogic: fix error path in phy_g12a_usb3_pcie_probe()
    b347b850a49f ipvs: correctly print the memory size of ip_vs_conn_tab
    12d3fd4d8c49 ARM: dts: logicpd-som-lv: Fix wrong pinmuxing on OMAP35
    6b4928990b14 ARM: dts: am3517-evm: Fix misc pinmuxing
    6476c49e8e31 ARM: dts: Fix mmc order for omap3-gta04
    4e81598e2122 interconnect: qcom: sdx55: Drop IP0 interconnects
    344558d201bb phy: ti: Add missing pm_runtime_disable() in serdes_am654_probe
    cf6f119f8244 phy: mapphone-mdm6600: Fix PM error handling in phy_mdm6600_probe
    49c7d87f19d4 ARM: dts: at91: fix pinctrl phandles
    7ecb2639eb8a ARM: dts: at91: sama5d4_xplained: fix pinctrl phandle name
    1e68040245ad ARM: dts: at91: Map MCLK for wm8731 on at91sam9g20ek
    555bcbb7d0ff phy: ti: omap-usb2: Fix error handling in omap_usb2_enable_clocks
    d60abf246aa5 ARM: dts: dra7: Fix suspend warning for vpe powerdomain
    127295f86f70 bus: ti-sysc: Make omap3 gpt12 quirk handling SoC specific
    033cac39d0b7 ARM: OMAP2+: Fix refcount leak in omap_gic_of_init
    a933ee691dbd phy: samsung: exynos5250-sata: fix missing device put in probe error paths
    3c8a02347f84 phy: samsung: Fix missing of_node_put() in exynos_sata_phy_probe
    bb0f3522cf42 arm64: dts: meson-sm1-bananapi-m5: fix wrong GPIO pin labeling for CON1
    0f8e303faf88 arm64: dts: imx8mn: Fix SAI nodes
    f1266c4eba8a ARM: dts: imx6qdl-apalis: Fix sgtl5000 detection issue
    7596c4576a0e USB: Fix xhci event ring dequeue pointer ERDP update issue
    11baa5edf37d arm64: dts: imx8qm: Correct SCU clock controller's compatible property
    d84f8327af13 xsk: Fix l2fwd for copy mode + busy poll combo
    3ec920d755ae mtd: rawnand: fix ecc parameters for mt7622
    9e4dedb8ec72 iio:imu:bmi160: disable regulator in error path
    d583cd6afc3b arm64: dts: meson: remove CPU opps below 1GHz for SM1 boards
    9f878775fceb arm64: dts: meson: remove CPU opps below 1GHz for G12B boards
    4df1584738f1 video: fbdev: udlfb: properly check endpoint type
    1ad0832e8712 cpufreq: qcom-cpufreq-hw: Fix throttle frequency value on EPSS platforms
    38ac9ca93252 cpufreq: qcom-hw: fix the race between LMH worker and cpuhp
    08b036bac865 virtio_net: fix wrong buf address calculation when using xdp
    10f24144ca48 iocost: don't reset the inuse weight of under-weighted debtors
    559d4f45958b x86/pci/xen: Disable PCI/MSI[-X] masking for XEN_HVM guests
    95ad6bef5bf1 riscv: patch_text: Fixup last cpu should be master
    3437091fcc2f hex2bin: fix access beyond string end
    4541645b5881 hex2bin: make the function hex_to_bin constant-time
    41dee1832617 pinctrl: samsung: fix missing GPIOLIB on ARM64 Exynos config
    8f2dac58b39e arm64: dts: imx8mm-venice: fix spi2 pin configuration
    34b5d2aa355a bus: mhi: host: pci_generic: Flush recovery worker during freeze
    b3d21deabcbe bus: mhi: host: pci_generic: Add missing poweroff() PM callback
    732f861dd480 ceph: fix possible NULL pointer dereference for req->r_session
    2b008197a06b arch_topology: Do not set llc_sibling if llc_id is invalid
    03cab849da1a serial: 8250: Correct the clock for EndRun PTP/1588 PCIe device
    9445505273a5 serial: 8250: Also set sticky MCR bits in console restoration
    ac55cac5dcd4 serial: amba-pl011: do not time out prematurely when draining tx fifo
    858d93280e83 serial: imx: fix overrun interrupts in DMA mode
    c0ea202fbc85 usb: phy: generic: Get the vbus supply
    dd2af3ad968f usb: cdns3: Fix issue for clear halt endpoint
    455285db8717 usb: dwc3: pci: add support for the Intel Meteor Lake-P
    0d1c407b1a74 usb: dwc3: gadget: Return proper request status
    7d14c96bff09 usb: dwc3: core: Only handle soft-reset in DCTL
    5d8299ead7c5 usb: dwc3: core: Fix tx/rx threshold settings
    b81be940eaca usb: dwc3: Try usb-role-switch first in dwc3_drd_init
    9f051e510cd2 usb: gadget: configfs: clear deactivation flag in configfs_composite_unbind()
    f9b2660d9c10 usb: gadget: uvc: Fix crash when encoding data for usb request
    e5e7d6c4b305 usb: typec: ucsi: Fix role swapping
    3e5dd4cf30fe usb: typec: ucsi: Fix reuse of completion structure
    6bf55f6b0ebf usb: core: Don't hold the device lock while sleeping in do_proc_control()
    949d422949ee usb: misc: fix improper handling of refcount in uss720_probe()
    a590353a9506 iio: imu: inv_icm42600: Fix I2C init possible nack
    7619f3c498a2 iio: magnetometer: ak8975: Fix the error handling in ak8975_power_on()
    28e1f974e3e7 iio: dac: ad5446: Fix read_raw not returning set value
    cd266c38aaa4 iio: dac: ad5592r: Fix the missing return value.
    48bc03979f30 xhci: increase usb U3 -> U0 link resume timeout from 100ms to 500ms
    9faa311f65b0 xhci: stop polling roothubs after shutdown
    10e0d30f99f4 xhci: Enable runtime PM on second Alderlake controller
    576b40690e91 usb: xhci: tegra:Fix PM usage reference leak of tegra_xusb_unpowergate_partitions
    4ebf2982db15 USB: serial: option: add Telit 0x1057, 0x1058, 0x1075 compositions
    be94d697baab USB: serial: option: add support for Cinterion MV32-WA/MV32-WB
    bb73ae98f086 USB: serial: cp210x: add PIDs for Kamstrup USB Meter Reader
    f183708e8ecc USB: serial: whiteheat: fix heap overflow in WHITEHEAT_GET_DTR_RTS
    7f8fc606893c USB: quirks: add STRING quirk for VCOM device
    96a5999e1f62 USB: quirks: add a Realtek card reader
    0da0ac894129 usb: mtu3: fix USB 3.0 dual-role-switch from device to host

Signed-off-by: Bruce Ashfield <bruce.ashfield@gmail.com>
Signed-off-by: Richard Purdie <richard.purdie@linuxfoundation.org>
(cherry picked from commit 8017b8b05ad8c071f7fb56bfd8e983d9361b8c46)
Signed-off-by: Steve Sakoman <steve@sakoman.com>
---
 .../linux/linux-yocto-rt_5.15.bb              |  6 ++---
 .../linux/linux-yocto-tiny_5.15.bb            |  6 ++---
 meta/recipes-kernel/linux/linux-yocto_5.15.bb | 26 +++++++++----------
 3 files changed, 19 insertions(+), 19 deletions(-)

diff --git a/meta/recipes-kernel/linux/linux-yocto-rt_5.15.bb b/meta/recipes-kernel/linux/linux-yocto-rt_5.15.bb
index 5bc02623e9..6bfb8deb1e 100644
--- a/meta/recipes-kernel/linux/linux-yocto-rt_5.15.bb
+++ b/meta/recipes-kernel/linux/linux-yocto-rt_5.15.bb
@@ -11,13 +11,13 @@ python () {
         raise bb.parse.SkipRecipe("Set PREFERRED_PROVIDER_virtual/kernel to linux-yocto-rt to enable it")
 }
 
-SRCREV_machine ?= "0098c71753fab42ea29a58b8c39ae8852a0819b8"
-SRCREV_meta ?= "b37a7198339ac27d27aec07ec5e952cc74c137f4"
+SRCREV_machine ?= "b028c4baada43d48014d4350dd66debe7e4cf362"
+SRCREV_meta ?= "37891dc371e83a3451781dd81a8a85cccd60084b"
 
 SRC_URI = "git://git.yoctoproject.org/linux-yocto.git;branch=${KBRANCH};name=machine \
            git://git.yoctoproject.org/yocto-kernel-cache;type=kmeta;name=meta;branch=yocto-5.15;destsuffix=${KMETA}"
 
-LINUX_VERSION ?= "5.15.37"
+LINUX_VERSION ?= "5.15.38"
 
 LIC_FILES_CHKSUM = "file://COPYING;md5=6bc538ed5bd9a7fc9398086aedcd7e46"
 
diff --git a/meta/recipes-kernel/linux/linux-yocto-tiny_5.15.bb b/meta/recipes-kernel/linux/linux-yocto-tiny_5.15.bb
index 4d2e9facda..0cf2d68d56 100644
--- a/meta/recipes-kernel/linux/linux-yocto-tiny_5.15.bb
+++ b/meta/recipes-kernel/linux/linux-yocto-tiny_5.15.bb
@@ -5,7 +5,7 @@ KCONFIG_MODE = "--allnoconfig"
 
 require recipes-kernel/linux/linux-yocto.inc
 
-LINUX_VERSION ?= "5.15.37"
+LINUX_VERSION ?= "5.15.38"
 LIC_FILES_CHKSUM = "file://COPYING;md5=6bc538ed5bd9a7fc9398086aedcd7e46"
 
 DEPENDS += "${@bb.utils.contains('ARCH', 'x86', 'elfutils-native', '', d)}"
@@ -14,8 +14,8 @@ DEPENDS += "openssl-native util-linux-native"
 KMETA = "kernel-meta"
 KCONF_BSP_AUDIT_LEVEL = "2"
 
-SRCREV_machine ?= "73e5fcde1e4d7b3ef0f122e309bf6feda2214133"
-SRCREV_meta ?= "b37a7198339ac27d27aec07ec5e952cc74c137f4"
+SRCREV_machine ?= "7b1fe61102fd6efc26373305417cd683687eb7a0"
+SRCREV_meta ?= "37891dc371e83a3451781dd81a8a85cccd60084b"
 
 PV = "${LINUX_VERSION}+git${SRCPV}"
 
diff --git a/meta/recipes-kernel/linux/linux-yocto_5.15.bb b/meta/recipes-kernel/linux/linux-yocto_5.15.bb
index a0af1f93cf..206cc0692d 100644
--- a/meta/recipes-kernel/linux/linux-yocto_5.15.bb
+++ b/meta/recipes-kernel/linux/linux-yocto_5.15.bb
@@ -13,24 +13,24 @@ KBRANCH:qemux86  ?= "v5.15/standard/base"
 KBRANCH:qemux86-64 ?= "v5.15/standard/base"
 KBRANCH:qemumips64 ?= "v5.15/standard/mti-malta64"
 
-SRCREV_machine:qemuarm ?= "487f0d10355bc4ea900c6cbfb6ba156541449263"
-SRCREV_machine:qemuarm64 ?= "623ef2010028407442669ed9d3a50a86ad4031aa"
-SRCREV_machine:qemumips ?= "d07fd1d207673b466616e5f806d97e2834ef35b2"
-SRCREV_machine:qemuppc ?= "cbe3228711c2f3df43ffb3d865ef09dd91fb7100"
-SRCREV_machine:qemuriscv64 ?= "82ab1e179a347e02ef77ad7c5fa1493461e58520"
-SRCREV_machine:qemuriscv32 ?= "82ab1e179a347e02ef77ad7c5fa1493461e58520"
-SRCREV_machine:qemux86 ?= "82ab1e179a347e02ef77ad7c5fa1493461e58520"
-SRCREV_machine:qemux86-64 ?= "82ab1e179a347e02ef77ad7c5fa1493461e58520"
-SRCREV_machine:qemumips64 ?= "08d20206727ae27296a3acf27a4fc6c9bdb874da"
-SRCREV_machine ?= "82ab1e179a347e02ef77ad7c5fa1493461e58520"
-SRCREV_meta ?= "b37a7198339ac27d27aec07ec5e952cc74c137f4"
+SRCREV_machine:qemuarm ?= "5a68f2d15d17f0f3c397e7f8c83f3f664f7037e5"
+SRCREV_machine:qemuarm64 ?= "00e666e6154fcdf52268f2a5a612b96afad073b0"
+SRCREV_machine:qemumips ?= "fb9e75076deade31754b7ad644952d63137e616b"
+SRCREV_machine:qemuppc ?= "49f6567f3b85a843e8b6042a79c58aab0bdbd0c9"
+SRCREV_machine:qemuriscv64 ?= "cc9695f5fd3b520464eb2ded66950734f308525c"
+SRCREV_machine:qemuriscv32 ?= "cc9695f5fd3b520464eb2ded66950734f308525c"
+SRCREV_machine:qemux86 ?= "cc9695f5fd3b520464eb2ded66950734f308525c"
+SRCREV_machine:qemux86-64 ?= "cc9695f5fd3b520464eb2ded66950734f308525c"
+SRCREV_machine:qemumips64 ?= "1ad01ab47ec056d4126798f6d57a33b65b2be49c"
+SRCREV_machine ?= "cc9695f5fd3b520464eb2ded66950734f308525c"
+SRCREV_meta ?= "37891dc371e83a3451781dd81a8a85cccd60084b"
 
 # set your preferred provider of linux-yocto to 'linux-yocto-upstream', and you'll
 # get the <version>/base branch, which is pure upstream -stable, and the same
 # meta SRCREV as the linux-yocto-standard builds. Select your version using the
 # normal PREFERRED_VERSION settings.
 BBCLASSEXTEND = "devupstream:target"
-SRCREV_machine:class-devupstream ?= "4bf7f350c1638def0caa1835ad92948c15853916"
+SRCREV_machine:class-devupstream ?= "3fbf24b73f4a5bc8fd39a6b7a29145451c1039ce"
 PN:class-devupstream = "linux-yocto-upstream"
 KBRANCH:class-devupstream = "v5.15/base"
 
@@ -38,7 +38,7 @@ SRC_URI = "git://git.yoctoproject.org/linux-yocto.git;name=machine;branch=${KBRA
            git://git.yoctoproject.org/yocto-kernel-cache;type=kmeta;name=meta;branch=yocto-5.15;destsuffix=${KMETA}"
 
 LIC_FILES_CHKSUM = "file://COPYING;md5=6bc538ed5bd9a7fc9398086aedcd7e46"
-LINUX_VERSION ?= "5.15.37"
+LINUX_VERSION ?= "5.15.38"
 
 DEPENDS += "${@bb.utils.contains('ARCH', 'x86', 'elfutils-native', '', d)}"
 DEPENDS += "openssl-native util-linux-native"
-- 
2.25.1


