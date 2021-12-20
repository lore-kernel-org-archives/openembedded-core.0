Return-Path: <bruce.ashfield@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id E271CC4332F
	for <webhook@archiver.kernel.org>; Mon, 20 Dec 2021 15:17:52 +0000 (UTC)
Received: from mail-qt1-f172.google.com (mail-qt1-f172.google.com
 [209.85.160.172])
 by mx.groups.io with SMTP id smtpd.web09.6585.1640013471727077387
 for <openembedded-core@lists.openembedded.org>;
 Mon, 20 Dec 2021 07:17:51 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20210112 header.b=J0YLzvKf;
 spf=pass (domain: gmail.com, ip: 209.85.160.172,
 mailfrom: bruce.ashfield@gmail.com)
Received: by mail-qt1-f172.google.com with SMTP id n15so10100827qta.0
        for <openembedded-core@lists.openembedded.org>;
 Mon, 20 Dec 2021 07:17:51 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:content-transfer-encoding;
        bh=FtQgBdbozgw3JwuzCmKy7NDQS783lNis+IvI6sI5DaE=;
        b=J0YLzvKfzKAoGHE4d8Fa2s6zT+xQFfKTSrqXNZ45QwPeWvlL+ieieeT+PInqurqIGi
         fWyVv4sq5FXLG4pROx8ztmSMxgrE9u5NTrsFXodzzBOiKcFsVAJ2qTEp4muC1Ek0KLlv
         hQxtKXUxzgsEKb3YAtf94rBfdw7gpzawWuzzDypnkIM4yYWNIE1WDpleqP5+AeujNx9g
         wCpx7CVSKiAa3finYknPf9XiLLE5XGUunwYKkFHhpdpFcAaN8gK2Fhzp9yqsHubwqjFm
         yRz/O7J2WRFo/aV5ofWVUm1Qr2AA77GB5NRIMhHhXTPPYtUBT6KR4M9F0YPTiplvCiNr
         WfCQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=FtQgBdbozgw3JwuzCmKy7NDQS783lNis+IvI6sI5DaE=;
        b=1rdyT1Xuvg6PTN2i3TYhCfvMPircQRYpASt2ld4CtZQQ1hrQy95yCTGottoGXVljmt
         YGSTVieDkjgE/drxiQetQ5FDB4ocl/eowzklclk3EXAPKJR9IpDY81gbOuYJQU1nl0bf
         LOcLgIZ6rNNp65RIp2gcv7E0jOSK34fh25sN63j5z/miibUviui4ZgnR65Z0Ok6Xsmza
         7wHYaOprsQLlUrzepu6dNrtY4csTRVFQYKHauyFQwa48sjdjCJE7NitYunKaTERZywb0
         R2yqBUB9Bo5rYOZaUdJ3iP4H0WgSE89wLKkf89T+yM0NuI2Fm2aYa9SqsG+vZ3119G2H
         v9ew==
X-Gm-Message-State: AOAM530UG8X/K9vbAhJuYof98nnNqiNqIhXETpNFo1LxV3r2n6+G7HKs
	QYL8rkbjiiBMJxHadWr1FUjcln+kasU=
X-Google-Smtp-Source: 
 ABdhPJxjl4k5di32TBaaRWk6t8rMK5oAcBCQPi+RvT7IFvS0fzpkyAUJXPp7lx3qFrt5N6V1vSED6A==
X-Received: by 2002:ac8:7f89:: with SMTP id z9mr12867458qtj.15.1640013470570;
        Mon, 20 Dec 2021 07:17:50 -0800 (PST)
Received: from build.lan
 (cpe04d4c4975b80-cmf4c11490699b.cpe.net.cable.rogers.com. [174.112.63.222])
        by smtp.gmail.com with ESMTPSA id
 i7sm11338634qkn.0.2021.12.20.07.17.49
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 20 Dec 2021 07:17:49 -0800 (PST)
From: bruce.ashfield@gmail.com
To: richard.purdie@linuxfoundation.org
Cc: openembedded-core@lists.openembedded.org
Subject: [PATCH 3/6] linux-yocto/5.15: update to v5.15.8
Date: Mon, 20 Dec 2021 10:17:43 -0500
Message-Id: 
 <3717807504fe6a90d834c95f31a40f575365b59b.1640013267.git.bruce.ashfield@gmail.com>
X-Mailer: git-send-email 2.19.1
In-Reply-To: <cover.1640013267.git.bruce.ashfield@gmail.com>
References: <cover.1640013267.git.bruce.ashfield@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Mon, 20 Dec 2021 15:17:52 -0000
X-Groupsio-URL: 
 https://lists.openembedded.org/g/openembedded-core/message/159886

From: Bruce Ashfield <bruce.ashfield@gmail.com>

Updating linux-yocto/5.15 to the latest korg -stable release that comprises
the following commits:

43e577d7a2cb Linux 5.15.8
c2bd1add2c3e bpf: Add selftests to cover packet access corner cases
5475fcf0a1c4 clocksource/drivers/dw_apb_timer_of: Fix probe failure
ee6104661b46 misc: fastrpc: fix improper packet size calculation
62a8ee0502d8 irqchip: nvic: Fix offset for Interrupt Priority Offsets
2d34992ebe9c irqchip/irq-gic-v3-its.c: Force synchronisation when issuing INVALL
4a7c65506473 aio: Fix incorrect usage of eventfd_signal_allowed()
d99d861ce3ef irqchip/armada-370-xp: Fix support for Multi-MSI interrupts
97912b97fd83 irqchip/armada-370-xp: Fix return value of armada_370_xp_msi_alloc()
f2675399eb2a irqchip/aspeed-scu: Replace update_bits with write_bits.
e18f3e046ccd csky: fix typo of fpu config macro
47b355f25b55 bus: mhi: core: Add support for forced PM resume
7f4b37c7a692 bus: mhi: pci_generic: Fix device recovery failed issue
5bff8dff8e21 nvmem: eeprom: at25: fix FRAM byte_len
990bbe357841 misc: rtsx: Avoid mangling IRQ during runtime PM
14508fe13b1c iio: accel: kxcjk-1013: Fix possible memory leak in probe and remove
2906867da4ca iio: ad7768-1: Call iio_trigger_notify_done() on error
b3a4c57a9613 iio: adc: axp20x_adc: fix charging current reporting on AXP22x
41d241ad3e55 iio: adc: stm32: fix a current leak by resetting pcsel before disabling vdda
4071943a533c iio: at91-sama5d2: Fix incorrect sign extension
a862c731f7bc iio: dln2: Check return value of devm_iio_trigger_register()
9b4e3b804c41 iio: dln2-adc: Fix lockdep complaint
363e1286cf81 iio: itg3200: Call iio_trigger_notify_done() on error
e4b600ac98ca iio: kxsd9: Don't return error code in trigger handler
5df9c2c0e4b4 iio: ltr501: Don't return error code in trigger handler
c43517071dfc iio: mma8452: Fix trigger reference couting
00d3c14338b5 iio: stk3310: Don't return error code in interrupt handler
111d5b61fbd7 iio: trigger: stm32-timer: fix MODULE_ALIAS
2db8ad169cc8 iio: trigger: Fix reference counting
7d2a35d99700 iio: gyro: adxrs290: fix data signedness
02d5a2a48bb4 xhci: avoid race between disable slot command and host runtime suspend
d861bc26fe68 usb: core: config: using bit mask instead of individual bits
47c14aceb290 xhci: Remove CONFIG_USB_DEFAULT_PERSIST to prevent xHCI from runtime suspending
0141f85b78a5 usb: core: config: fix validation of wMaxPacketValue entries
f5230fb9bf8e Revert "usb: dwc3: dwc3-qcom: Enable tx-fifo-resize property by default"
6eea4ace62fa USB: gadget: zero allocate endpoint 0 buffers
36dfdf11af49 USB: gadget: detect too-big endpoint 0 requests
ef472b023b85 selftests/fib_tests: Rework fib_rp_filter_test()
a72723e89f4d net/qla3xxx: fix an error code in ql_adapter_up()
0c9f1ab29e7f net, neigh: clear whole pneigh_entry at alloc time
48135149c089 net: fec: only clear interrupt of handling queue in fec_enet_rx_queue()
089bd0b0bf1e net: altera: set a couple error code in probe()
37493d4eb2e5 net: cdc_ncm: Allow for dwNtbOutMaxSize to be unset or zero
8ca1ca40977b tools build: Remove needless libpython-version feature check that breaks test-all fast path
9c2407afbcd0 dt-bindings: net: Reintroduce PHY no lane swap binding
2e837d90ec09 Documentation/locking/locktypes: Update migrate_disable() bits.
395022a71b6c perf tools: Fix SMT detection fast read path
f1131d3f1b50 drm/amd/display: Fix DPIA outbox timeout after S3/S4/reset
99bc19898375 Revert "PCI: aardvark: Fix support for PCI_ROM_ADDRESS1 on emulated bridge"
16431e442db2 i40e: Fix NULL pointer dereference in i40e_dbg_dump_desc
f8358589b31b bpf, sockmap: Re-evaluate proto ops when psock is removed from sockmap
a4953e7b6f6a mtd: rawnand: fsmc: Fix timing computation
ebc8909feecd mtd: rawnand: fsmc: Take instruction delay into account
fabfb7c18c8e i40e: Fix pre-set max number of queues for VF
2132643b956f i40e: Fix failed opcode appearing if handling messages from VF
06ece58874c3 clk: qcom: clk-alpha-pll: Don't reconfigure running Trion
d259ae526fd9 clk: imx: use module_platform_driver
1d044701bdbe hwmon: (dell-smm) Fix warning on /proc/i8k creation error
be7c5d58108b RDMA/hns: Do not destroy QP resources in the hw resetting phase
207f5ea62a9f RDMA/hns: Do not halt commands during reset until later
9b6bf6fca018 ASoC: codecs: wcd934x: return correct value from mixer put
339ffb5b5600 ASoC: codecs: wcd934x: handle channel mappping list correctly
71272640d459 ASoC: codecs: wsa881x: fix return values from kcontrol put
e1e22179376f ASoC: qdsp6: q6routing: Fix return value from msm_routing_put_audio_mixer
cdb5a0d0e007 ASoC: rt5682: Fix crash due to out of scope stack vars
e9362a21147a PM: runtime: Fix pm_runtime_active() kerneldoc comment
a3f0e9b1d6cd qede: validate non LSO skb length
069a849819b3 ALSA: usb-audio: Reorder snd_djm_devices[] entries
ebacb44cb204 scsi: scsi_debug: Fix buffer size of REPORT ZONES command
f8dccc1bdea7 scsi: pm80xx: Do not call scsi_remove_host() in pm8001_alloc()
d429b302c184 block: fix ioprio_get(IOPRIO_WHO_PGRP) vs setuid(2)
e3098ce15fec i2c: mpc: Use atomic read and fix break condition
23a5f9797d6c tracefs: Set all files to the same group ownership as the mount option
60d311f9e638 aio: fix use-after-free due to missing POLLFREE handling
924f51534d42 aio: keep poll requests on waitqueue until completed
8d6760fd5d16 signalfd: use wake_up_pollfree()
f12d997683a7 binder: use wake_up_pollfree()
1ebb6cd8c754 wait: add wake_up_pollfree()
8e12976c0c19 io_uring: ensure task_work gets run as part of cancelations
eb313c47b276 libata: add horkage for ASMedia 1092
b0034d4b71f1 drm/syncobj: Deal with signalled fences in drm_syncobj_find_fence.
021ae1e11dfc thermal: int340x: Fix VCoRefLow MMIO bit offset for TGL
0138d396ffce clk: qcom: regmap-mux: fix parent clock lookup
dfb7285a82fa mmc: renesas_sdhi: initialize variable properly when tuning
62c613419543 hwmon: (pwm-fan) Ensure the fan going on in .probe()
a85d27b2eff4 selftests: KVM: avoid failures due to reserved HyperTransport region
041aae47b000 tracefs: Have new files inherit the ownership of their parent
8bf902fee589 nfsd: Fix nsfd startup race (again)
148c816f10fd nfsd: fix use-after-free due to delegation race
50dacb2289e5 md: fix update super 1.0 on rdev size change
00cd8a99885c perf intel-pt: Fix error timestamp setting on the decoder error path
4fbb83c1bf25 perf intel-pt: Fix missing 'instruction' events with 'q' option
22e5fb70f725 perf intel-pt: Fix next 'err' value, walking trace
f747cc563afd perf intel-pt: Fix state setting when receiving overflow (OVF) packet
e39dd2e60039 perf intel-pt: Fix intel_pt_fup_event() assumptions about setting state type
d9c838b927cd perf intel-pt: Fix sync state when a PSB (synchronization) packet is found
c816dcf69ae4 perf intel-pt: Fix some PGE (packet generation enable/control flow packets) usage
ca06c5cb1b6d btrfs: free exchange changeset on failures
32d4054cb3e8 btrfs: replace the BUG_ON in btrfs_del_root_ref with proper error handling
477675049ca8 btrfs: fix re-dirty process of tree-log nodes
0338e448b905 btrfs: clear extent buffer uptodate when we fail to write it
48fc373d9d54 scsi: qla2xxx: Format log strings only if needed
d14bad8c11cc cifs: Fix crash on unload of cifs_arc4.ko
1fd702980994 ALSA: pcm: oss: Handle missing errors in snd_pcm_oss_change_params*()
35a3e5110321 ALSA: pcm: oss: Limit the period size to 16MB
00a860678098 ALSA: pcm: oss: Fix negative period/buffer sizes
c94a0d734c7b ALSA: hda/realtek: Fix quirk for TongFang PHxTxX1
220aaee85f0e ALSA: hda/realtek - Add headset Mic support for Lenovo ALC897 platform
da171216ac2d ALSA: ctl: Fix copy of updated id with element read/write
f987b61daa98 mm: bdi: initialize bdi_min_ratio when bdi is unregistered
dd902bcec34f mm/slub: fix endianness bug for alloc/free_traces attributes
7d7e02563bcd mm/damon/core: fix fake load reports due to uninterruptible sleeps
5a960e533c2a timers: implement usleep_idle_range()
64d320dcf1f1 KVM: x86: Wait for IPIs to be delivered when handling Hyper-V TLB flush hypercall
21cc93f6df63 KVM: x86: Ignore sparse banks size for an "all CPUs", non-sparse IPI req
eea80da3472b KVM: x86: Don't WARN if userspace mucks with RCX during string I/O exit
d6c37e679631 net: mvpp2: fix XDP rx queues registering
d86216dfda7c net/sched: fq_pie: prevent dismantle issue
973a0373e88c net: dsa: felix: Fix memory leak in felix_setup_mmio_filtering
bfc017140aa7 net: dsa: mv88e6xxx: error handling for serdes_power functions
76e414aa2a24 net: bcm4908: Handle dma_set_coherent_mask error codes
fe30b70ca84d devlink: fix netns refcount leak in devlink_nl_cmd_reload()
f9a22d3ed855 IB/hfi1: Correct guard on eager buffer deallocation
20791287eda1 iavf: Fix reporting when setting descriptor count
d0ed80e3ca88 iavf: restore MSI state on reset
be2b5a78a0c1 netfilter: conntrack: annotate data-races around ct->timeout
d2cd7c7f8f83 netfilter: nft_exthdr: break evaluation if setting TCP option fails
e6182c63d827 udp: using datalen to cap max gso segments
98adb2bbfa40 seg6: fix the iif in the IPv6 socket control block
f707820c0923 nfp: Fix memory leak in nfp_cpp_area_cache_add()
6dada2646a0a bonding: make tx_rebalance_counter an atomic
cfd719f04267 ethtool: do not perform operations on net devices being unregistered
9a7e323edb86 ice: ignore dropped packets during init
b4fb67fd1adf bpf: Fix the off-by-two error in range markings
e76da2e8a09a bpf: Make sure bpf_disable_instrumentation() is safe vs preemption.
9c983fd7cf97 bpf, sockmap: Attach map progs to psock early for feature probes
c817dcb2a65b bpf, x86: Fix "no previous prototype" warning
e8193cebf753 vrf: don't run conntrack on vrf with !dflt qdisc
cffab968e94e selftests: netfilter: add a vrf+conntrack testcase
fae9705d2810 nfc: fix potential NULL pointer deref in nfc_genl_dump_ses_done
0159c7b26683 platform/x86: amd-pmc: Fix s2idle failures on certain AMD laptops
b964ecdb71d9 x86/sme: Explicitly map new EFI memmap table as encrypted
bbf22d47bb3e net: dsa: mv88e6xxx: allow use of PHYs on CPU and DSA ports
f4b8f987a748 net: dsa: mv88e6xxx: fix "don't use PHY_DETECT on internal PHY's"
5c960ae2c22a can: m_can: Disable and ignore ELO interrupt
081816acad36 can: m_can: pci: fix iomap_read_fifo() and iomap_write_fifo()
f4848384c17e can: m_can: pci: fix incorrect reference clock rate
75a422165477 can: m_can: m_can_read_fifo: fix memory leak in error branch
6c73fc931658 can: pch_can: pch_can_rx_normal: fix use after free
474f9a8534f5 can: sja1000: fix use after free in ems_pcmcia_add_card()
c9b5472da3a8 can: kvaser_pciefd: kvaser_pciefd_rx_error_frame(): increase correct stats->{rx,tx}_errors counter
a8b513b824e4 can: kvaser_usb: get CAN clock frequency from device
834d0fb97864 IB/hfi1: Fix leak of rcvhdrtail_dummy_kvaddr
27bbf30f928a IB/hfi1: Fix early init panic
b9e1cc3b95e8 IB/hfi1: Insure use of smp_processor_id() is preempt disabled
33bee1ebfc83 nft_set_pipapo: Fix bucket load in AVX2 lookup routine for six 8-bit groups
20d1064ac956 platform/x86/intel: hid: add quirk to support Surface Go 3
6281306bdc99 HID: Ignore battery for Elan touchscreen on Asus UX550VE
719d5fb2789a HID: sony: fix error path in probe
e537e7ef5e8c mmc: spi: Add device-tree SPI IDs
59146a86b4aa mtd: dataflash: Add device-tree SPI IDs
a579510a64ed HID: check for valid USB device for many HID drivers
05ca95256aba HID: wacom: fix problems when device is not a valid USB device
58f15f5ae778 HID: bigbenff: prevent null pointer dereference
30d3150d9094 HID: add USB_HID dependancy on some USB HID drivers
8c765cf5f1bc HID: add USB_HID dependancy to hid-chicony
10b05037d7a8 HID: add USB_HID dependancy to hid-prodikeys
e1e21632a4c4 HID: add hid_is_usb() function to make it simpler for USB detection
6892f8e27d6e HID: intel-ish-hid: ipc: only enable IRQ wakeup when requested
d38f90239254 HID: google: add eel USB id
c7b9eca23ea2 HID: quirks: Add quirk for the Microsoft Surface 3 type-cover
5131cc731c67 usb: gadget: uvc: fix multiple opens

Signed-off-by: Bruce Ashfield <bruce.ashfield@gmail.com>
---
 .../linux/linux-yocto-rt_5.15.bb              |  6 ++---
 .../linux/linux-yocto-tiny_5.15.bb            |  8 +++---
 meta/recipes-kernel/linux/linux-yocto_5.15.bb | 26 +++++++++----------
 3 files changed, 20 insertions(+), 20 deletions(-)

diff --git a/meta/recipes-kernel/linux/linux-yocto-rt_5.15.bb b/meta/recipes-kernel/linux/linux-yocto-rt_5.15.bb
index 4047648ecd..9f5b70b6f0 100644
--- a/meta/recipes-kernel/linux/linux-yocto-rt_5.15.bb
+++ b/meta/recipes-kernel/linux/linux-yocto-rt_5.15.bb
@@ -11,13 +11,13 @@ python () {
         raise bb.parse.SkipRecipe("Set PREFERRED_PROVIDER_virtual/kernel to linux-yocto-rt to enable it")
 }
 
-SRCREV_machine ?= "f6d02f13253de53534cd0d5d449fe9f21ca943f0"
-SRCREV_meta ?= "2cfaf2c0b58d9507b0f5d62d0a514ca6cb688eda"
+SRCREV_machine ?= "5f2c8fb6daa2fe1767e122da9edff3d8357ff426"
+SRCREV_meta ?= "22f3af23297303c8f884a89b603729eb6fb07eda"
 
 SRC_URI = "git://git.yoctoproject.org/linux-yocto.git;branch=${KBRANCH};name=machine \
            git://git.yoctoproject.org/yocto-kernel-cache;type=kmeta;name=meta;branch=yocto-5.15;destsuffix=${KMETA}"
 
-LINUX_VERSION ?= "5.15.7"
+LINUX_VERSION ?= "5.15.8"
 
 LIC_FILES_CHKSUM = "file://COPYING;md5=6bc538ed5bd9a7fc9398086aedcd7e46"
 
diff --git a/meta/recipes-kernel/linux/linux-yocto-tiny_5.15.bb b/meta/recipes-kernel/linux/linux-yocto-tiny_5.15.bb
index be432628e6..68157066a4 100644
--- a/meta/recipes-kernel/linux/linux-yocto-tiny_5.15.bb
+++ b/meta/recipes-kernel/linux/linux-yocto-tiny_5.15.bb
@@ -6,7 +6,7 @@ KCONFIG_MODE = "--allnoconfig"
 
 require recipes-kernel/linux/linux-yocto.inc
 
-LINUX_VERSION ?= "5.15.7"
+LINUX_VERSION ?= "5.15.8"
 LIC_FILES_CHKSUM = "file://COPYING;md5=6bc538ed5bd9a7fc9398086aedcd7e46"
 
 DEPENDS += "${@bb.utils.contains('ARCH', 'x86', 'elfutils-native', '', d)}"
@@ -15,9 +15,9 @@ DEPENDS += "openssl-native util-linux-native"
 KMETA = "kernel-meta"
 KCONF_BSP_AUDIT_LEVEL = "2"
 
-SRCREV_machine:qemuarm ?= "410e941717cfa38fa13d6ab885d0149dfc6029c0"
-SRCREV_machine ?= "f82433b2add15e6f0d19f3f200c24cc9c9f85bb0"
-SRCREV_meta ?= "2cfaf2c0b58d9507b0f5d62d0a514ca6cb688eda"
+SRCREV_machine:qemuarm ?= "a58830deb1794e589f486dea29685284e6fc5eae"
+SRCREV_machine ?= "4f73a85f62b6eea738417a1d86697ca9fb512a9e"
+SRCREV_meta ?= "22f3af23297303c8f884a89b603729eb6fb07eda"
 
 PV = "${LINUX_VERSION}+git${SRCPV}"
 
diff --git a/meta/recipes-kernel/linux/linux-yocto_5.15.bb b/meta/recipes-kernel/linux/linux-yocto_5.15.bb
index 99e2ff14ff..00c0b69cd4 100644
--- a/meta/recipes-kernel/linux/linux-yocto_5.15.bb
+++ b/meta/recipes-kernel/linux/linux-yocto_5.15.bb
@@ -13,17 +13,17 @@ KBRANCH:qemux86  ?= "v5.15/standard/base"
 KBRANCH:qemux86-64 ?= "v5.15/standard/base"
 KBRANCH:qemumips64 ?= "v5.15/standard/mti-malta64"
 
-SRCREV_machine:qemuarm ?= "68220d3c864ae61309a39bbd31d56982199f1738"
-SRCREV_machine:qemuarm64 ?= "f82433b2add15e6f0d19f3f200c24cc9c9f85bb0"
-SRCREV_machine:qemumips ?= "176481738feda5bc490b5f293d012b4a8597b458"
-SRCREV_machine:qemuppc ?= "f82433b2add15e6f0d19f3f200c24cc9c9f85bb0"
-SRCREV_machine:qemuriscv64 ?= "f82433b2add15e6f0d19f3f200c24cc9c9f85bb0"
-SRCREV_machine:qemuriscv32 ?= "f82433b2add15e6f0d19f3f200c24cc9c9f85bb0"
-SRCREV_machine:qemux86 ?= "f82433b2add15e6f0d19f3f200c24cc9c9f85bb0"
-SRCREV_machine:qemux86-64 ?= "f82433b2add15e6f0d19f3f200c24cc9c9f85bb0"
-SRCREV_machine:qemumips64 ?= "92a4a55fc14c4ef2a8b216489a4847719aa1505d"
-SRCREV_machine ?= "f82433b2add15e6f0d19f3f200c24cc9c9f85bb0"
-SRCREV_meta ?= "2cfaf2c0b58d9507b0f5d62d0a514ca6cb688eda"
+SRCREV_machine:qemuarm ?= "1888cd436f8d611d40eda420857ada862d3c2ad1"
+SRCREV_machine:qemuarm64 ?= "4f73a85f62b6eea738417a1d86697ca9fb512a9e"
+SRCREV_machine:qemumips ?= "9611887d3cc04f5e6f5e6bb27dfef053ea31e9d4"
+SRCREV_machine:qemuppc ?= "4f73a85f62b6eea738417a1d86697ca9fb512a9e"
+SRCREV_machine:qemuriscv64 ?= "4f73a85f62b6eea738417a1d86697ca9fb512a9e"
+SRCREV_machine:qemuriscv32 ?= "4f73a85f62b6eea738417a1d86697ca9fb512a9e"
+SRCREV_machine:qemux86 ?= "4f73a85f62b6eea738417a1d86697ca9fb512a9e"
+SRCREV_machine:qemux86-64 ?= "4f73a85f62b6eea738417a1d86697ca9fb512a9e"
+SRCREV_machine:qemumips64 ?= "fcfeb52a0bd9255b6be241dc0370767dec8e2df1"
+SRCREV_machine ?= "4f73a85f62b6eea738417a1d86697ca9fb512a9e"
+SRCREV_meta ?= "22f3af23297303c8f884a89b603729eb6fb07eda"
 
 # set your preferred provider of linux-yocto to 'linux-yocto-upstream', and you'll
 # get the <version>/base branch, which is pure upstream -stable, and the same
@@ -31,7 +31,7 @@ SRCREV_meta ?= "2cfaf2c0b58d9507b0f5d62d0a514ca6cb688eda"
 # normal PREFERRED_VERSION settings.
 BBCLASSEXTEND = "devupstream:target"
 DEFAULT_PREFERENCE:class-devupstream = "-1"
-SRCREV_machine:class-devupstream ?= "4e8c680af6d51ba9315e31bd4f7599e080561a2d"
+SRCREV_machine:class-devupstream ?= "43e577d7a2cb60ad478387155c9de352f152101e"
 PN:class-devupstream = "linux-yocto-upstream"
 KBRANCH:class-devupstream = "v5.15/base"
 
@@ -42,7 +42,7 @@ SRC_URI = "git://git.yoctoproject.org/linux-yocto.git;name=machine;branch=${KBRA
            git://git.yoctoproject.org/yocto-kernel-cache;type=kmeta;name=meta;branch=yocto-5.15;destsuffix=${KMETA}"
 
 LIC_FILES_CHKSUM = "file://COPYING;md5=6bc538ed5bd9a7fc9398086aedcd7e46"
-LINUX_VERSION ?= "5.15.7"
+LINUX_VERSION ?= "5.15.8"
 
 DEPENDS += "${@bb.utils.contains('ARCH', 'x86', 'elfutils-native', '', d)}"
 DEPENDS += "openssl-native util-linux-native"
-- 
2.19.1


