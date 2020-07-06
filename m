Received: from mail-pl1-f193.google.com (mail-pl1-f193.google.com [209.85.214.193])
 by mx.groups.io with SMTP id smtpd.web10.61200.1594051877259002779
 for <openembedded-core@lists.openembedded.org>;
 Mon, 06 Jul 2020 09:11:17 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@sakoman-com.20150623.gappssmtp.com header.s=20150623 header.b=k/0rW0Kd;
 spf=softfail (domain: sakoman.com, ip: 209.85.214.193, mailfrom: steve@sakoman.com)
Received: by mail-pl1-f193.google.com with SMTP id o1so8941442plk.1
        for <openembedded-core@lists.openembedded.org>; Mon, 06 Jul 2020 09:11:17 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=sakoman-com.20150623.gappssmtp.com; s=20150623;
        h=from:to:subject:date:message-id:in-reply-to:references;
        bh=q7WDWCNhij/uqwET2vXeQND/HPdKf3nissaFgvt6KQs=;
        b=k/0rW0KdpaXKAmSBfgQPnZlTYK8PHe8TepWYSoBbcNlYXPo8k+c5o2pbQnYrTXCdp4
         NY2cHENJjpyAb+9QhXxWJm5U3OhoRdaoFl9bADAAqmMWEWEDstRsu/Nrx+wp/x2dQwd3
         zEHZzoN2TwxrHH+tfEVncrDHynaGvTp8q/pSOF6+Egt5t4U16By9qmcau8Om43pHneIM
         6N/qNCVSx798xhXwSS4PWJ6iRbYuT5TVFo84u/YXf/H7Sa/jI2P7wWXxeb07zwTXkQ+3
         IkaTWU9mhcUNfcqRVhz9Di1lHucJ9FmuXDsMKWLmHnebgDAg13qha2FQU/4TKc/9z1FZ
         wm7g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:subject:date:message-id:in-reply-to
         :references;
        bh=q7WDWCNhij/uqwET2vXeQND/HPdKf3nissaFgvt6KQs=;
        b=TmgtXdFqfqowSX74NNWfNQPIbWQJezd7n6Ahg+1v4d61ZuamYkSLN5WIzKl8KboX1L
         9p9gx7vTXNKkykwzxOIm+SfnpqP0HH+j+f71CT7bd67CfKqxjhz2+J8vYbGfQ9uAzIFJ
         TEraneCyd1KglZ2y6kLg95sFzz/Vhvz8ofzBi3I2jvZdXODDcKObszFLVKLkxY3FqBY9
         deUm1YOY6q8nZpi3OqmQ7GUnMNRjY7b9gGtT/DW/b+YSHI03PAznQeMuabW1qTLXClIV
         Ve2kdAo8uNZ8hXG45ot4PAZV6jmfFGPWan0HROkQrfGg3oMof5M10YHW5hCm74bl8QQ5
         kl2g==
X-Gm-Message-State: AOAM531kM3fMjFek5LU5Y5PAqtIvttzht4AxO73+OCpJ8pgPIG7+rWGz
	mHi/g5TAXG9aPj1FhV1ToGpIIx8TpFn6xA==
X-Google-Smtp-Source: ABdhPJwiVx3npMVnQIU5DYHZYE9HM6qFyDovRjY1x6lvtuiZbOHW8q188NzorCy3L6x+3c1kPzNXsg==
X-Received: by 2002:a17:90a:cc:: with SMTP id v12mr7877pjd.96.1594051875826;
        Mon, 06 Jul 2020 09:11:15 -0700 (PDT)
Return-Path: <steve@sakoman.com>
Received: from octo.router0800d9.com (rrcs-66-91-142-162.west.biz.rr.com. [66.91.142.162])
        by smtp.gmail.com with ESMTPSA id i67sm18225811pfg.13.2020.07.06.09.11.14
        for <openembedded-core@lists.openembedded.org>
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 06 Jul 2020 09:11:15 -0700 (PDT)
From: "Steve Sakoman" <steve@sakoman.com>
To: openembedded-core@lists.openembedded.org
Subject: [OE-core][dunfell 05/25] linux-yocto/5.4: update to v5.4.45
Date: Mon,  6 Jul 2020 06:10:07 -1000
Message-Id: <25b576bd9aab92f522800802b45c81fed0394c3e.1594050175.git.steve@sakoman.com>
X-Mailer: git-send-email 2.17.1
In-Reply-To: <cover.1594050175.git.steve@sakoman.com>
References: <cover.1594050175.git.steve@sakoman.com>

From: Bruce Ashfield <bruce.ashfield@gmail.com>

Updating linux-yocto/5.4 to the latest korg -stable release that comprises
the following commits:

    3604bc07c035 Linux 5.4.45
    40caf1bfd32c net: smsc911x: Fix runtime PM imbalance on error
    252801505e04 selftests: mlxsw: qos_mc_aware: Specify arping timeout as an integer
    aea1423a6334 net: ethernet: stmmac: Enable interface clocks on probe for IPQ806x
    6992c8995c84 net/ethernet/freescale: rework quiesce/activate for ucc_geth
    6a904892d84f null_blk: return error for invalid zone size
    b5cb7fe92059 s390/mm: fix set_huge_pte_at() for empty ptes
    c0063f3919ae drm/edid: Add Oculus Rift S to non-desktop list
    c90e773c21fb net: bmac: Fix read of MAC address from ROM
    92c09e88c188 x86/mmiotrace: Use cpumask_available() for cpumask_var_t variables
    ba550153177a io_uring: initialize ctx->sqo_wait earlier
    f1c582154e43 i2c: altera: Fix race between xfer_msg and isr thread
    1857d7d77659 scsi: pm: Balance pm_only counter of request queue during system resume
    1610cd913f5a evm: Fix RCU list related warnings
    31ca6427f64d ARC: [plat-eznps]: Restrict to CONFIG_ISA_ARCOMPACT
    935ba01e80d4 ARC: Fix ICCM & DCCM runtime size checks
    8a69220b659c RDMA/qedr: Fix synchronization methods and memory leaks in qedr
    49e92679341d RDMA/qedr: Fix qpids xarray api used
    0377fda07b5e s390/ftrace: save traced function caller
    0734b58f84a9 ASoC: intel - fix the card names
    6106585fc4c4 spi: dw: use "smp_mb()" to avoid sending spi data error
    99c63ba21d2e powerpc/xmon: Restrict when kernel is locked down
    f2adfe126bdb powerpc/powernv: Avoid re-registration of imc debugfs directory
    a293045d38c1 scsi: hisi_sas: Check sas_port before using it
    cfd5ac76ba30 drm/i915: fix port checks for MST support on gen >= 11
    74028c9c22fd airo: Fix read overflows sending packets
    63ad3fb06834 net: dsa: mt7530: set CPU port to fallback mode
    d628f7a59e1c scsi: ufs: Release clock if DMA map fails
    95ffc2a5cea7 media: staging: ipu3-imgu: Move alignment attribute to field
    5b6e152341b0 media: Revert "staging: imgu: Address a compiler warning on alignment"
    a122eef40fd2 mmc: fix compilation of user API
    1c44e6e09dc8 kernel/relay.c: handle alloc_percpu returning NULL in relay_open
    91e863ab82c8 mt76: mt76x02u: Add support for newer versions of the XBox One wifi adapter
    8a6744ebdbb5 p54usb: add AirVasT USB stick device-id
    ac09eae4b734 HID: i2c-hid: add Schneider SCL142ALM to descriptor override
    3e8410cbef27 HID: multitouch: enable multi-input as a quirk for some devices
    aa0dd0e2252b HID: sony: Fix for broken buttons on DS3 USB dongles
    df4988aa1c96 mm: Fix mremap not considering huge pmd devmap
    3209e3e812dd Revert "cgroup: Add memory barriers to plug cgroup_rstat_updated() race window"
    55852b3fd146 Linux 5.4.44
    f2a9b00a68c5 perf: Make perf able to build with latest libbfd
    3f57fa847e27 netfilter: nf_conntrack_pptp: fix compilation warning with W=1 build
    7a075390b732 netfilter: conntrack: Pass value of ctinfo to __nf_conntrack_update
    987de40bff33 netfilter: conntrack: comparison of unsigned in cthelper confirmation
    a4547f63e05f bonding: Fix reference count leak in bond_sysfs_slave_add.
    b668b392cc2c net: dsa: declare lockless TX feature for slave ports
    35c0a6e7ef55 ipv4: nexthop version of fib_info_nh_uses_dev
    568c159356d1 nexthop: Expand nexthop_is_multipath in a few places
    88e81db5509b nexthops: don't modify published nexthop groups
    8398275f7aed nexthops: Move code from remove_nexthop_from_groups to remove_nh_grp_entry
    2b043affcaea crypto: chelsio/chtls: properly set tp->lsndtime
    a369e8378b48 qlcnic: fix missing release in qlcnic_83xx_interrupt_test.
    1c38cfc259a7 xsk: Add overflow check for u64 division, stored into u32
    73c05545fbb5 ieee80211: Fix incorrect mask for default PE duration
    2e91cd11bafc bnxt_en: Fix accumulation of bp->net_stats_prev.
    dda9d0eb7a96 esp6: get the right proto for transport mode in esp6_gso_encap
    9f57771d09f4 netfilter: nf_conntrack_pptp: prevent buffer overflows in debug code
    b16287f99d31 netfilter: nfnetlink_cthelper: unbreak userspace helper support
    7140b6280230 netfilter: conntrack: make conntrack userspace helpers work again
    17021d1b899d netfilter: ipset: Fix subcounter update skip
    25f629a70680 netfilter: nft_reject_bridge: enable reject with bridge vlan
    26e28c10e72c ip_vti: receive ipip packet by calling ip_tunnel_rcv
    0de9bed087a2 xfrm: fix error in comment
    f5dc87e0e389 xfrm: fix a NULL-ptr deref in xfrm_local_error
    25613580a5bc xfrm: fix a warning in xfrm_policy_insert_list
    d9710d69b89f xfrm interface: fix oops when deleting a x-netns interface
    de4a187389fa xfrm: call xfrm_output_gso when inner_protocol is set in xfrm_output
    edd79cf0cfdf xfrm: remove the xfrm_state_put call becofe going to out_reset
    cd7031ef9683 xfrm: do pskb_pull properly in __xfrm_transport_prep
    14a1c1dc5695 xfrm: allow to accept packets with ipv6 NEXTHDR_HOP in xfrm_input
    47dc81ce7d84 copy_xstate_to_kernel(): don't leave parts of destination uninitialized
    94690ca1ae4c x86/dma: Fix max PFN arithmetic overflow on 32 bit systems
    e980f9cb2f2d mac80211: mesh: fix discovery timer re-arming issue / crash
    2f0851690a0e x86/syscalls: Revert "x86/syscalls: Make __X32_SYSCALL_BIT be unsigned long"
    8c1bfa73353a cfg80211: fix debugfs rename crash
    f9cd0c831806 parisc: Fix kernel panic in mem_init()
    ca788fd797a7 iommu: Fix reference count leak in iommu_group_alloc.
    b298c314b9d9 gpio: fix locking open drain IRQ lines
    bba91cdba612 Revert "block: end bio with BLK_STS_AGAIN in case of non-mq devs and REQ_NOWAIT"
    31f0b78bb478 include/asm-generic/topology.h: guard cpumask_of_node() macro argument
    a02c130efbbc fs/binfmt_elf.c: allocate initialized memory in fill_thread_core_info()
    de482c445b0f mm: remove VM_BUG_ON(PageSlab()) from page_mapcount()
    a7ba9f24737b mm,thp: stop leaking unreleased file pages
    21358b3e77af IB/ipoib: Fix double free of skb in case of multicast traffic in CM mode
    5a1bd1704272 drm/amd/display: drop cursor position check in atomic test
    b5d326a77b73 RDMA/core: Fix double destruction of uobject
    6b292d7806a1 ceph: flush release queue when handling caps for unknown inode
    4d145e482374 libceph: ignore pool overlay and cache logic on redirects
    d162b9e1b1a9 ALSA: hda/realtek - Add new codec supported for ALC287
    c33bf209deae ALSA: usb-audio: Quirks for Gigabyte TRX40 Aorus Master onboard audio
    8fc8674092b2 clk: qcom: gcc: Fix parent for gpll0_out_even
    68fe063327af exec: Always set cap_ambient in cap_bprm_set_creds
    4adcf889e66b ALSA: usb-audio: mixer: volume quirk for ESS Technology Asus USB DAC
    8c71b0bd64df ALSA: hda/realtek - Add a model for Thinkpad T570 without DAC workaround
    84b0a4f42584 ALSA: hwdep: fix a left shifting 1 by 31 UB bug
    a003e1f653d6 RDMA/pvrdma: Fix missing pci disable in pvrdma_pci_probe()
    b191e3ea6dfc gpio: bcm-kona: Fix return value of bcm_kona_gpio_probe()
    d6d07089dee3 gpio: pxa: Fix return value of pxa_gpio_probe()
    a971f71e91fb mmc: block: Fix use-after-free issue for rpmb
    2de6df8df9bd ARM: dts: bcm: HR2: Fix PPI interrupt types
    f8b161c3f3ac ARM: dts: bcm2835-rpi-zero-w: Fix led polarity
    485bd944e0c6 ARM: dts/imx6q-bx50v3: Set display interface clock parents
    a38a75c22b9f IB/qib: Call kobject_put() when kobject_init_and_add() fails
    820be34d0137 gpu/drm: Ingenic: Fix opaque pointer casted to wrong type
    707f5075021f soc: mediatek: cmdq: return send msg error code
    56e7873ed267 arm64: dts: mt8173: fix vcodec-enc clock
    750f47a6586b gpio: exar: Fix bad handling for ida_simple_get error path
    5242e3850b1c ARM: uaccess: fix DACR mismatch with nested exceptions
    d9c318f0eda3 ARM: uaccess: integrate uaccess_save and uaccess_restore
    96e2df4c753b ARM: uaccess: consolidate uaccess asm to asm/uaccess-asm.h
    f175897a960e ARM: 8970/1: decompressor: increase tag size
    4aa75ce40b1d Input: synaptics-rmi4 - fix error return code in rmi_driver_probe()
    176dbb9eeba0 Input: synaptics-rmi4 - really fix attn_data use-after-free
    7016d241ca64 Input: i8042 - add ThinkPad S230u to i8042 reset list
    a63a679e1ec7 Input: dlink-dir685-touchkeys - fix a typo in driver name
    d9d50cbccc79 Input: xpad - add custom init packet for Xbox One S controllers
    9abf0403a709 Input: evdev - call input_flush_device() on release(), not flush()
    5a273fa56229 Input: usbtouchscreen - add support for BonXeon TP
    b66de2d961a6 drivers: net: hamradio: Fix suspicious RCU usage warning in bpqether.c
    dfe417b45634 samples: bpf: Fix build error
    70bf0fd60f2f csky: Fixup raw_copy_from_user()
    2fa8032fa78a cifs: Fix null pointer check in cifs_read
    ce1ef281e786 hwmon: (nct7904) Fix incorrect range of temperature limit registers
    68d72327999a csky: Fixup remove duplicate irq_disable
    99bd434f8893 csky: Fixup perf callchain unwind
    f3f23f4c6413 csky: Fixup msa highest 3 bits mask
    e104bd855454 clk: ti: am33xx: fix RTC clock parent
    6b8c281e9a48 riscv: stacktrace: Fix undefined reference to `walk_stackframe'
    b84952e88336 IB/i40iw: Remove bogus call to netdev_master_upper_dev_get()
    706fee65d95c net: freescale: select CONFIG_FIXED_PHY where needed
    74037ef26835 usb: gadget: legacy: fix redundant initialization warnings
    e8a03e73cd14 usb: phy: twl6030-usb: Fix a resource leak in an error handling path in 'twl6030_usb_probe()'
    e02fe520c11b usb: dwc3: pci: Enable extcon driver for Intel Merrifield
    e1dfa986fda6 cachefiles: Fix race between read_waiter and read_copier involving op->to_do
    336292c44f62 drm/amdgpu: Use GEM obj reference for KFD BOs
    2dd33d3175ef drm/amd/powerplay: perform PG ungate prior to CG ungate
    4552f27f9d64 drm/amdgpu: drop unnecessary cancel_delayed_work_sync on PG ungate
    49388448eda0 gfs2: Grab glock reference sooner in gfs2_add_revoke
    fd5516ea8239 gfs2: move privileged user check to gfs2_quota_lock_check
    02a76cd6bda6 net: microchip: encx24j600: add missed kthread_stop
    2578135aa8f0 ALSA: usb-audio: add mapping for ASRock TRX40 Creator
    3e4e413c93f0 gpio: tegra: mask GPIO IRQs during IRQ shutdown
    6ff411af068c ARM: dts: rockchip: fix pinctrl sub nodename for spi in rk322x.dtsi
    881dc2e22fb9 ARM: dts: rockchip: swap clock-names of gpu nodes
    96e88e683165 arm64: dts: rockchip: swap interrupts interrupt-names rk3399 gpu node
    9dc2e51ea7c1 arm64: dts: rockchip: fix status for &gmac2phy in rk3328-evb.dts
    dd35a809c158 ARM: dts: rockchip: fix phy nodename for rk3229-xms6
    203a45eb258c ARM: dts: rockchip: fix phy nodename for rk3228-evb
    c5b2233ad5f4 mlxsw: spectrum: Fix use-after-free of split/unsplit/type_set in case reload fails
    9aeacb829cad net/mlx4_core: fix a memory leak bug.
    fcb4d5869e98 net: sun: fix missing release regions in cas_init_one().
    d12fc818b0d8 net/tls: free record only on encryption error
    cff9e73a34a2 net/tls: fix encryption error checking
    3f4f034a8676 net/mlx5: Annotate mutex destroy for root ns
    f493398fe0f7 net/mlx5: Fix error flow in case of function_setup failure
    9fe88c940828 net/mlx5e: Update netdev txq on completions during closure
    02c97e838597 net/mlx5: Fix memory leak in mlx5_events_init
    e23f88f7e730 net/mlx5e: Fix inner tirs handling
    f9e2700f34ec net/mlx5e: kTLS, Destroy key object after destroying the TIS
    8c9df6ced1f9 tipc: block BH before using dst_cache
    5398c7ff2347 sctp: Start shutdown on association restart if in SHUTDOWN-SENT state and socket is closed
    70989e501fbc sctp: Don't add the shutdown timer if its already been added
    34036769c84b r8152: support additional Microsoft Surface Ethernet Adapter variant
    983fa2e7740f nexthop: Fix attribute checking for groups
    cf4cc95a15f5 net/tls: fix race condition causing kernel panic
    587e13469cfd net sched: fix reporting the first-time use timestamp
    f12398120522 net: revert "net: get rid of an signed integer overflow in ip_idents_reserve()"
    83588bf1dd55 net: qrtr: Fix passing invalid reference to qrtr_local_enqueue()
    7e0e066df34a net: nlmsg_cancel() if put fails for nhmsg
    84e91312ad9a net: mvpp2: fix RX hashing for non-10G ports
    212bcf1039a9 net/mlx5: Add command entry handling completion
    a9595d1c60a7 net: ipip: fix wrong address family in init error path
    4d827edb8f4e net: inet_csk: Fix so_reuseport bind-address cache in tb->fast*
    b51eb49d9a5d __netif_receive_skb_core: pass skb by reference
    53cf25df80c7 net: ethernet: ti: cpsw: fix ASSERT_RTNL() warning during suspend
    557045f771e2 net: dsa: mt7530: fix roaming from DSA user ports
    b853a13bb224 net: don't return invalid table id error when we fall back to PF_UNSPEC
    40a904b1c2e5 dpaa_eth: fix usage as DSA master, try 3
    d9ce4b67dd9f ax25: fix setsockopt(SO_BINDTODEVICE)

Signed-off-by: Bruce Ashfield <bruce.ashfield@gmail.com>
Signed-off-by: Richard Purdie <richard.purdie@linuxfoundation.org>
(cherry picked from commit 71ab00d335d1d7f5d0827651397b8109091108d0)
Signed-off-by: Steve Sakoman <steve@sakoman.com>
---
 .../linux/linux-yocto-rt_5.4.bb               |  6 ++---
 .../linux/linux-yocto-tiny_5.4.bb             |  8 +++----
 meta/recipes-kernel/linux/linux-yocto_5.4.bb  | 22 +++++++++----------
 3 files changed, 18 insertions(+), 18 deletions(-)

diff --git a/meta/recipes-kernel/linux/linux-yocto-rt_5.4.bb b/meta/recipes-kernel/linux/linux-yocto-rt_5.4.bb
index a9213c2439..c88a045dfc 100644
--- a/meta/recipes-kernel/linux/linux-yocto-rt_5.4.bb
+++ b/meta/recipes-kernel/linux/linux-yocto-rt_5.4.bb
@@ -11,13 +11,13 @@ python () {
         raise bb.parse.SkipRecipe("Set PREFERRED_PROVIDER_virtual/kernel to linux-yocto-rt to enable it")
 }
 
-SRCREV_machine ?= "1afad41c91e13f957bbe61fa7fdc05a77e84d489"
-SRCREV_meta ?= "aafb8f095e97013d6e55b09ed150369cbe0c6476"
+SRCREV_machine ?= "3401d0c3e51b083016c4c5177de686fb9606f304"
+SRCREV_meta ?= "87313d46d577412854ab491d524a94fa82af4536"
 
 SRC_URI = "git://git.yoctoproject.org/linux-yocto.git;branch=${KBRANCH};name=machine \
            git://git.yoctoproject.org/yocto-kernel-cache;type=kmeta;name=meta;branch=yocto-5.4;destsuffix=${KMETA}"
 
-LINUX_VERSION ?= "5.4.43"
+LINUX_VERSION ?= "5.4.45"
 
 LIC_FILES_CHKSUM = "file://COPYING;md5=bbea815ee2795b2f4230826c0c6b8814"
 
diff --git a/meta/recipes-kernel/linux/linux-yocto-tiny_5.4.bb b/meta/recipes-kernel/linux/linux-yocto-tiny_5.4.bb
index aab53bed6a..b9ac34396a 100644
--- a/meta/recipes-kernel/linux/linux-yocto-tiny_5.4.bb
+++ b/meta/recipes-kernel/linux/linux-yocto-tiny_5.4.bb
@@ -6,7 +6,7 @@ KCONFIG_MODE = "--allnoconfig"
 
 require recipes-kernel/linux/linux-yocto.inc
 
-LINUX_VERSION ?= "5.4.43"
+LINUX_VERSION ?= "5.4.45"
 LIC_FILES_CHKSUM = "file://COPYING;md5=bbea815ee2795b2f4230826c0c6b8814"
 
 DEPENDS += "${@bb.utils.contains('ARCH', 'x86', 'elfutils-native', '', d)}"
@@ -15,9 +15,9 @@ DEPENDS += "openssl-native util-linux-native"
 KMETA = "kernel-meta"
 KCONF_BSP_AUDIT_LEVEL = "2"
 
-SRCREV_machine_qemuarm ?= "c3864bf2906c5075305bf675c27788505ea93047"
-SRCREV_machine ?= "9e1b13d7f9d84f691fb9988c5f53c5ab62b8a5e9"
-SRCREV_meta ?= "aafb8f095e97013d6e55b09ed150369cbe0c6476"
+SRCREV_machine_qemuarm ?= "c2765f98de328de8ac03bbc112d274c093949ad0"
+SRCREV_machine ?= "85c9ccdd443fe3a59511c1921b3ebc0fc396f417"
+SRCREV_meta ?= "87313d46d577412854ab491d524a94fa82af4536"
 
 PV = "${LINUX_VERSION}+git${SRCPV}"
 
diff --git a/meta/recipes-kernel/linux/linux-yocto_5.4.bb b/meta/recipes-kernel/linux/linux-yocto_5.4.bb
index 01795e6166..ae952e0771 100644
--- a/meta/recipes-kernel/linux/linux-yocto_5.4.bb
+++ b/meta/recipes-kernel/linux/linux-yocto_5.4.bb
@@ -12,16 +12,16 @@ KBRANCH_qemux86  ?= "v5.4/standard/base"
 KBRANCH_qemux86-64 ?= "v5.4/standard/base"
 KBRANCH_qemumips64 ?= "v5.4/standard/mti-malta64"
 
-SRCREV_machine_qemuarm ?= "6c628db39bf48f7dd6cd95ae826bcaa18a56df1d"
-SRCREV_machine_qemuarm64 ?= "9e1b13d7f9d84f691fb9988c5f53c5ab62b8a5e9"
-SRCREV_machine_qemumips ?= "c0cd2937ae195344ece04663b30b2049427b3c57"
-SRCREV_machine_qemuppc ?= "9e1b13d7f9d84f691fb9988c5f53c5ab62b8a5e9"
-SRCREV_machine_qemuriscv64 ?= "9e1b13d7f9d84f691fb9988c5f53c5ab62b8a5e9"
-SRCREV_machine_qemux86 ?= "9e1b13d7f9d84f691fb9988c5f53c5ab62b8a5e9"
-SRCREV_machine_qemux86-64 ?= "9e1b13d7f9d84f691fb9988c5f53c5ab62b8a5e9"
-SRCREV_machine_qemumips64 ?= "6254ff1d776b75bc3d9c2c66c083fbc622091cd4"
-SRCREV_machine ?= "9e1b13d7f9d84f691fb9988c5f53c5ab62b8a5e9"
-SRCREV_meta ?= "aafb8f095e97013d6e55b09ed150369cbe0c6476"
+SRCREV_machine_qemuarm ?= "25484a4f9ba2682d45c3f3bbf5497f6d7d75817d"
+SRCREV_machine_qemuarm64 ?= "85c9ccdd443fe3a59511c1921b3ebc0fc396f417"
+SRCREV_machine_qemumips ?= "48bd1e848614da3ce48d52a1b2a15241d2a2f909"
+SRCREV_machine_qemuppc ?= "85c9ccdd443fe3a59511c1921b3ebc0fc396f417"
+SRCREV_machine_qemuriscv64 ?= "85c9ccdd443fe3a59511c1921b3ebc0fc396f417"
+SRCREV_machine_qemux86 ?= "85c9ccdd443fe3a59511c1921b3ebc0fc396f417"
+SRCREV_machine_qemux86-64 ?= "85c9ccdd443fe3a59511c1921b3ebc0fc396f417"
+SRCREV_machine_qemumips64 ?= "0e18185e09beb99a7b6408e9650ad5f31e8f759d"
+SRCREV_machine ?= "85c9ccdd443fe3a59511c1921b3ebc0fc396f417"
+SRCREV_meta ?= "87313d46d577412854ab491d524a94fa82af4536"
 
 # remap qemuarm to qemuarma15 for the 5.4 kernel
 # KMACHINE_qemuarm ?= "qemuarma15"
@@ -30,7 +30,7 @@ SRC_URI = "git://git.yoctoproject.org/linux-yocto.git;name=machine;branch=${KBRA
            git://git.yoctoproject.org/yocto-kernel-cache;type=kmeta;name=meta;branch=yocto-5.4;destsuffix=${KMETA}"
 
 LIC_FILES_CHKSUM = "file://COPYING;md5=bbea815ee2795b2f4230826c0c6b8814"
-LINUX_VERSION ?= "5.4.43"
+LINUX_VERSION ?= "5.4.45"
 
 DEPENDS += "${@bb.utils.contains('ARCH', 'x86', 'elfutils-native', '', d)}"
 DEPENDS += "openssl-native util-linux-native"
-- 
2.17.1

