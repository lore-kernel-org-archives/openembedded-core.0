Return-Path: <steve@sakoman.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 92A7DC433FE
	for <webhook@archiver.kernel.org>; Wed, 22 Dec 2021 14:13:08 +0000 (UTC)
Received: from mail-pl1-f181.google.com (mail-pl1-f181.google.com
 [209.85.214.181])
 by mx.groups.io with SMTP id smtpd.web10.19583.1640182388283491877
 for <openembedded-core@lists.openembedded.org>;
 Wed, 22 Dec 2021 06:13:08 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@sakoman-com.20210112.gappssmtp.com header.s=20210112
 header.b=o1BQcN1D;
 spf=softfail (domain: sakoman.com, ip: 209.85.214.181,
 mailfrom: steve@sakoman.com)
Received: by mail-pl1-f181.google.com with SMTP id w7so1444564plp.13
        for <openembedded-core@lists.openembedded.org>;
 Wed, 22 Dec 2021 06:13:08 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=sakoman-com.20210112.gappssmtp.com; s=20210112;
        h=from:to:subject:date:message-id:in-reply-to:references:mime-version
         :content-transfer-encoding;
        bh=c2qb0avSg9dzxPz0q++Oyi7GZ7H5LB6tERbxL9hzFL0=;
        b=o1BQcN1DoZAaeQgLJjQxH34eZhfFh/5OlmWiVIFxBnueIgv0ybwNQVPbmp7qMvsjrV
         EF3Kdt6dAomW5mIYuzMh8p1kyyGBqhegDpKID6G1YEYYS7wuF9SPm5/4bbWkepCNvBkf
         3leVe029vAqBXDkfQGNZPMxNr9XxcbpYpFVOlx+/nMVsfqAgEFmXtmYpr7tVSvO2qXzu
         Y6OJyftir6+fjDlmIRWROWDt5ChmlQX08yJaGOVzpifvKoHKUs16xlrloSnyUgBKngsg
         fU7LbvfG9n/rR+FZA0j4BqqFxBG7Oi6qpEduaHxyWsLiCfpulhgiHQUNCgXn8cvyFD/F
         2hjg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:from:to:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=c2qb0avSg9dzxPz0q++Oyi7GZ7H5LB6tERbxL9hzFL0=;
        b=pg/VxKGr3P9zfk2OmGgkF2nm/a5etJYUSLfGmbKc3w6yi9S4v9t6vtu4t1tTOPL6CP
         l6NIcYqkjXyUpwl1spWT2uIul9Ij0Gtlnd4p52SUDJLO7w4T/Sfj+JpuXONyGddawwbh
         o8/8lK/d6Fv1L5B5vq+gpaIHQoBa4eukf/RdTZNBy82NwJH8SxT/Pn5jKAH/4vqUr7f2
         RXICg12hxNlas3yYmj4X0B+PravHDCn7iBpHHotK9hhzzzyHPn4bmZhRTSE+8RIFTHMQ
         VryZNFFtz4WDp+DFJMwXyLq+NzRPFQxiWOgqbgOcJQbUXfJfD6Oz9LcdZYuDFOCiD273
         eI7g==
X-Gm-Message-State: AOAM531i2LBcKYajEewzzNATU9VaeIVLiphnkFdQPdlSySJJuMU8N7UY
	9t1nquUAq/ccChTWCZApZXSRSLQ7IOUgFepU
X-Google-Smtp-Source: 
 ABdhPJwyxbcP4elS3aEnodrQuoxZpU30GpoYu1aOZlbmIaf5GJ2nKqdlufyJnU97arHRAqq6OOJgqA==
X-Received: by 2002:a17:902:9a02:b0:148:b37a:a780 with SMTP id
 v2-20020a1709029a0200b00148b37aa780mr2900439plp.90.1640182387135;
        Wed, 22 Dec 2021 06:13:07 -0800 (PST)
Received: from hexa.router0800d9.com (rrcs-66-91-142-162.west.biz.rr.com.
 [66.91.142.162])
        by smtp.gmail.com with ESMTPSA id l6sm902849pfu.63.2021.12.22.06.13.05
        for <openembedded-core@lists.openembedded.org>
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 22 Dec 2021 06:13:06 -0800 (PST)
From: Steve Sakoman <steve@sakoman.com>
To: openembedded-core@lists.openembedded.org
Subject: [OE-core][dunfell 11/14] linux-yocto/5.4: update to v5.4.165
Date: Wed, 22 Dec 2021 04:12:24 -1000
Message-Id: 
 <2784863606e27715ee5e7f582bb6c4df67879c95.1640181998.git.steve@sakoman.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <cover.1640181998.git.steve@sakoman.com>
References: <cover.1640181998.git.steve@sakoman.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Wed, 22 Dec 2021 14:13:08 -0000
X-Groupsio-URL: 
 https://lists.openembedded.org/g/openembedded-core/message/159956

From: Bruce Ashfield <bruce.ashfield@gmail.com>

Updating linux-yocto/5.4 to the latest korg -stable release that comprises
the following commits:

7f70428f0109 Linux 5.4.165
3a99b4baff3c bpf: Add selftests to cover packet access corner cases
b8a2c49aa956 misc: fastrpc: fix improper packet size calculation
8f9a25e452f8 irqchip: nvic: Fix offset for Interrupt Priority Offsets
61981e5fee6d irqchip/irq-gic-v3-its.c: Force synchronisation when issuing INVALL
fc20091b3f97 irqchip/armada-370-xp: Fix support for Multi-MSI interrupts
a3689e694b39 irqchip/armada-370-xp: Fix return value of armada_370_xp_msi_alloc()
8c163a142771 iio: accel: kxcjk-1013: Fix possible memory leak in probe and remove
20f0fb418b6c iio: ad7768-1: Call iio_trigger_notify_done() on error
b68f44829b73 iio: adc: axp20x_adc: fix charging current reporting on AXP22x
e79d86de1e96 iio: at91-sama5d2: Fix incorrect sign extension
5f3d932f91cb iio: dln2: Check return value of devm_iio_trigger_register()
7447f0450825 iio: dln2-adc: Fix lockdep complaint
4c0fa7ed5a3a iio: itg3200: Call iio_trigger_notify_done() on error
e67d60c5ebb0 iio: kxsd9: Don't return error code in trigger handler
f143cfdccfc9 iio: ltr501: Don't return error code in trigger handler
acf0088ac073 iio: mma8452: Fix trigger reference couting
02553e971255 iio: stk3310: Don't return error code in interrupt handler
1374297ccf61 iio: trigger: stm32-timer: fix MODULE_ALIAS
1dadba28a829 iio: trigger: Fix reference counting
ec0cddcc2454 xhci: avoid race between disable slot command and host runtime suspend
8d45969ca31a usb: core: config: using bit mask instead of individual bits
d1eee0a3936f xhci: Remove CONFIG_USB_DEFAULT_PERSIST to prevent xHCI from runtime suspending
d2f242d7a9ce usb: core: config: fix validation of wMaxPacketValue entries
9978777c5409 USB: gadget: zero allocate endpoint 0 buffers
fd6de5a0cd42 USB: gadget: detect too-big endpoint 0 requests
46d3477cdef3 selftests/fib_tests: Rework fib_rp_filter_test()
caff29d1129c net/qla3xxx: fix an error code in ql_adapter_up()
4aa28ac9373c net, neigh: clear whole pneigh_entry at alloc time
f23f60e81af2 net: fec: only clear interrupt of handling queue in fec_enet_rx_queue()
05bc4d266eaf net: altera: set a couple error code in probe()
84a890d6959e net: cdc_ncm: Allow for dwNtbOutMaxSize to be unset or zero
e9ca63a07dd3 tools build: Remove needless libpython-version feature check that breaks test-all fast path
49e59d514408 dt-bindings: net: Reintroduce PHY no lane swap binding
b78a27fa58cc mtd: rawnand: fsmc: Fix timing computation
7596d0deec7f mtd: rawnand: fsmc: Take instruction delay into account
9f88ca269c41 i40e: Fix pre-set max number of queues for VF
171527da8414 i40e: Fix failed opcode appearing if handling messages from VF
ee8bfa62bf79 ASoC: qdsp6: q6routing: Fix return value from msm_routing_put_audio_mixer
43dcb79c1d9b qede: validate non LSO skb length
727858a98ac9 block: fix ioprio_get(IOPRIO_WHO_PGRP) vs setuid(2)
9ba5635cfad7 tracefs: Set all files to the same group ownership as the mount option
4105e6a128e8 aio: fix use-after-free due to missing POLLFREE handling
380185111fa8 aio: keep poll requests on waitqueue until completed
aac8151624b6 signalfd: use wake_up_pollfree()
1a478a0522e5 binder: use wake_up_pollfree()
e0c03d15cd03 wait: add wake_up_pollfree()
6db0db1657cb libata: add horkage for ASMedia 1092
050ac9da6768 x86/sme: Explicitly map new EFI memmap table as encrypted
9f5b334ee654 can: m_can: Disable and ignore ELO interrupt
abb4eff3dcd2 can: pch_can: pch_can_rx_normal: fix use after free
291a164ac1f3 drm/syncobj: Deal with signalled fences in drm_syncobj_find_fence.
f53b73953ff8 clk: qcom: regmap-mux: fix parent clock lookup
e871f89ebfe2 tracefs: Have new files inherit the ownership of their parent
f5734b1714ca nfsd: Fix nsfd startup race (again)
412498e9e54b btrfs: replace the BUG_ON in btrfs_del_root_ref with proper error handling
aa4740bc8595 btrfs: clear extent buffer uptodate when we fail to write it
434927e938ce ALSA: pcm: oss: Handle missing errors in snd_pcm_oss_change_params*()
76f19e4cbb54 ALSA: pcm: oss: Limit the period size to 16MB
f12c8a7515f6 ALSA: pcm: oss: Fix negative period/buffer sizes
5b06fa0cd2be ALSA: hda/realtek - Add headset Mic support for Lenovo ALC897 platform
caaea6bd3e18 ALSA: ctl: Fix copy of updated id with element read/write
a7ea5c099ad4 mm: bdi: initialize bdi_min_ratio when bdi is unregistered
b8a79804056b IB/hfi1: Correct guard on eager buffer deallocation
ab1be91cf1ec iavf: Fix reporting when setting descriptor count
c21bb711d0fb iavf: restore MSI state on reset
c8ae8c812e16 udp: using datalen to cap max gso segments
ef8804e47c0a seg6: fix the iif in the IPv6 socket control block
2e0e072e62fd nfp: Fix memory leak in nfp_cpp_area_cache_add()
3db6482523ea bonding: make tx_rebalance_counter an atomic
143ceb9b6736 ice: ignore dropped packets during init
4174bd4221c2 bpf: Fix the off-by-two error in range markings
15f987473d33 vrf: don't run conntrack on vrf with !dflt qdisc
8d3563ecbca3 selftests: netfilter: add a vrf+conntrack testcase
48fcd08fdbe0 nfc: fix potential NULL pointer deref in nfc_genl_dump_ses_done
1a295fea90e1 can: sja1000: fix use after free in ems_pcmcia_add_card()
fbcb12bc9dbf can: kvaser_pciefd: kvaser_pciefd_rx_error_frame(): increase correct stats->{rx,tx}_errors counter
68daa476f499 can: kvaser_usb: get CAN clock frequency from device
a7944962ee1f HID: check for valid USB device for many HID drivers
e9114b9dc8ea HID: wacom: fix problems when device is not a valid USB device
8e0ceff632f4 HID: bigbenff: prevent null pointer dereference
31520ec149d2 HID: add USB_HID dependancy on some USB HID drivers
f8a6538587b4 HID: add USB_HID dependancy to hid-chicony
ee8477d1dbce HID: add USB_HID dependancy to hid-prodikeys
6e1e0a014258 HID: add hid_is_usb() function to make it simpler for USB detection
1e8db541c2be HID: google: add eel USB id
cb7b13c98218 HID: quirks: Add quirk for the Microsoft Surface 3 type-cover
f99b2013793f ntfs: fix ntfs_test_inode and ntfs_init_locked_inode function type
eb246f58e1fc serial: tegra: Change lower tolerance baud rate limit for tegra20 and tegra30
e3c95128def1 Linux 5.4.164
5df7d6a012fc ipmi: msghandler: Make symbol 'remove_work_wq' static
5d1e83fffbc9 net/tls: Fix authentication failure in CCM mode
cffd7583c92e parisc: Mark cr16 CPU clocksource unstable on all SMP machines
23b40edec832 iwlwifi: mvm: retry init flow if failed
8d6e4b422d0c serial: 8250_pci: rewrite pericom_do_set_divisor()
181cf7622ce2 serial: 8250_pci: Fix ACCES entries in pci_serial_quirks array
c5da8aa44105 serial: core: fix transmit-buffer reset and memleak
7ed4a98a174c serial: pl011: Add ACPI SBSA UART match id
9e16682c94ec tty: serial: msm_serial: Deactivate RX DMA for polling support
b5dd5a467ec6 x86/64/mm: Map all kernel memory into trampoline_pgd
72736a3b90ef x86/tsc: Disable clocksource watchdog for TSC on qualified platorms
fe3cd48420cd x86/tsc: Add a timer to make sure TSC_adjust is always checked
957a203fe1b7 usb: typec: tcpm: Wait in SNK_DEBOUNCED until disconnect
7fbde744374e USB: NO_LPM quirk Lenovo Powered USB-C Travel Hub
095a39a2cc27 xhci: Fix commad ring abort, write all 64 bits to CRCR register.
caedb12c7737 vgacon: Propagate console boot parameters before calling `vc_resize'
a42944686249 parisc: Fix "make install" on newer debian releases
fbe7eacab7eb parisc: Fix KBUILD_IMAGE for self-extracting kernel
c6a9060be53f sched/uclamp: Fix rq->uclamp_max not set on first enqueue
8ae8ccd2402f KVM: x86/pmu: Fix reserved bits for AMD PerfEvtSeln register
ee38eb8cf9a7 ipv6: fix memory leak in fib6_rule_suppress
9d1596282644 drm/msm: Do hw_init() before capturing GPU state
10bad5a1977f net/smc: Keep smc_close_final rc during active close
3f2a23fd13ff net/rds: correct socket tunable error in rds_tcp_tune()
01c60b3f477b ipv4: convert fib_num_tclassid_users to atomic_t
efb073981756 net: annotate data-races on txq->xmit_lock_owner
bfec04c689af net: marvell: mvpp2: Fix the computation of shared CPUs
d4034bb9b532 net: usb: lan78xx: lan78xx_phy_init(): use PHY_POLL instead of "0" if no IRQ is available
3e70e3a72d80 rxrpc: Fix rxrpc_local leak in rxrpc_lookup_peer()
ae8a253f3fe6 selftests: net: Correct case name
e461a9816a1a net/mlx4_en: Fix an use-after-free bug in mlx4_en_try_alloc_resources()
af120fcffd64 siphash: use _unaligned version by default
f70c6281eafb net: mpls: Fix notifications when deleting a device
bbeb0325a746 net: qlogic: qlcnic: Fix a NULL pointer dereference in qlcnic_83xx_add_rings()
49ab33623107 natsemi: xtensa: fix section mismatch warnings
063d2233623a i2c: cbus-gpio: set atomic transfer callback
f5d7bd03f888 i2c: stm32f7: stop dma transfer in case of NACK
9fce2ead76f4 i2c: stm32f7: recover the bus on access timeout
bc0215cbd162 i2c: stm32f7: flush TX FIFO upon transfer errors
742a5ae18c5f sata_fsl: fix warning in remove_proc_entry when rmmod sata_fsl
77393806c76b sata_fsl: fix UAF in sata_fsl_port_stop when rmmod sata_fsl
03d4462ba3bc fget: check that the fd still exists after getting a ref to it
a78b607e1b43 s390/pci: move pseudo-MMIO to prevent MIO overlap
006edd736dc8 cpufreq: Fix get_cpu_device() failure in add_cpu_dev_symlink()
648813c26d64 ipmi: Move remove_work to dedicated workqueue
3f8f7eef8c32 rt2x00: do not mark device gone on EPROTO errors during start
c2e2ccaac3d9 kprobes: Limit max data_size of the kretprobe instances
03ee5e8c63c3 vrf: Reset IPCB/IP6CB when processing outbound pkts in vrf dev xmit
f82013d1d68f net/smc: Avoid warning of possible recursive locking
df5990db088d perf report: Fix memory leaks around perf_tip()
b380d09e44e8 perf hist: Fix memory leak of a perf_hpp_fmt
57247f703539 net: ethernet: dec: tulip: de4x5: fix possible array overflows in type3_infoblock()
77ff16690945 net: tulip: de4x5: fix the problem that the array 'lp->phy[8]' may be out of bound
99bb25cb6753 ethernet: hisilicon: hns: hns_dsaf_misc: fix a possible array overflow in hns_dsaf_ge_srst_by_port()
0f89c59e75ac ata: ahci: Add Green Sardine vendor ID as board_ahci_mobile
36c8f686956d scsi: iscsi: Unblock session then wake up error handler
dbbc8aeaf7a1 thermal: core: Reset previous low and high trip during thermal zone init
ebc8aed3b9eb btrfs: check-integrity: fix a warning on write caching disabled disk
5db28ea9f1a4 s390/setup: avoid using memblock_enforce_memory_limit
5d93fc221c5d platform/x86: thinkpad_acpi: Fix WWAN device disabled issue after S3 deep
96274948989c net: return correct error code
89d15a2e40d7 atlantic: Fix OOB read and write in hw_atl_utils_fw_rpc_wait
d6e981ec9491 net/smc: Transfer remaining wait queue entries during fallback
a1671b224bc0 mac80211: do not access the IV when it was stripped
3200cf7b9b7e drm/sun4i: fix unmet dependency on RESET_CONTROLLER for PHY_SUN6I_MIPI_DPHY
7ef990365059 gfs2: Fix length of holes reported at end-of-file
fe915dbd0f83 can: j1939: j1939_tp_cmd_recv(): check the dst address of TP.CM_BAM
fb158a26544c arm64: dts: mcbin: support 2W SFP modules
39b3b131d10d of: clk: Make <linux/of_clk.h> self-contained
aad716bd144a NFSv42: Fix pagecache invalidation after COPY/CLONE

Signed-off-by: Bruce Ashfield <bruce.ashfield@gmail.com>
Signed-off-by: Steve Sakoman <steve@sakoman.com>
---
 .../linux/linux-yocto-rt_5.4.bb               |  6 ++---
 .../linux/linux-yocto-tiny_5.4.bb             |  8 +++----
 meta/recipes-kernel/linux/linux-yocto_5.4.bb  | 22 +++++++++----------
 3 files changed, 18 insertions(+), 18 deletions(-)

diff --git a/meta/recipes-kernel/linux/linux-yocto-rt_5.4.bb b/meta/recipes-kernel/linux/linux-yocto-rt_5.4.bb
index 7d4361e6e3..beea153b52 100644
--- a/meta/recipes-kernel/linux/linux-yocto-rt_5.4.bb
+++ b/meta/recipes-kernel/linux/linux-yocto-rt_5.4.bb
@@ -11,13 +11,13 @@ python () {
         raise bb.parse.SkipRecipe("Set PREFERRED_PROVIDER_virtual/kernel to linux-yocto-rt to enable it")
 }
 
-SRCREV_machine ?= "edc3786860d52e6116ac35299e7b3ffb5fa2c541"
-SRCREV_meta ?= "c8cf16c4be0513bc1e4c4349ff447737d850d222"
+SRCREV_machine ?= "6a419217887717ae815e47990c4f50540e4486f0"
+SRCREV_meta ?= "c9027edfa2919e0148ba12d56afa7c5a797aad10"
 
 SRC_URI = "git://git.yoctoproject.org/linux-yocto.git;branch=${KBRANCH};name=machine \
            git://git.yoctoproject.org/yocto-kernel-cache;type=kmeta;name=meta;branch=yocto-5.4;destsuffix=${KMETA}"
 
-LINUX_VERSION ?= "5.4.163"
+LINUX_VERSION ?= "5.4.165"
 
 LIC_FILES_CHKSUM = "file://COPYING;md5=bbea815ee2795b2f4230826c0c6b8814"
 
diff --git a/meta/recipes-kernel/linux/linux-yocto-tiny_5.4.bb b/meta/recipes-kernel/linux/linux-yocto-tiny_5.4.bb
index 22983cc9ff..0f97913ebf 100644
--- a/meta/recipes-kernel/linux/linux-yocto-tiny_5.4.bb
+++ b/meta/recipes-kernel/linux/linux-yocto-tiny_5.4.bb
@@ -6,7 +6,7 @@ KCONFIG_MODE = "--allnoconfig"
 
 require recipes-kernel/linux/linux-yocto.inc
 
-LINUX_VERSION ?= "5.4.163"
+LINUX_VERSION ?= "5.4.165"
 LIC_FILES_CHKSUM = "file://COPYING;md5=bbea815ee2795b2f4230826c0c6b8814"
 
 DEPENDS += "${@bb.utils.contains('ARCH', 'x86', 'elfutils-native', '', d)}"
@@ -15,9 +15,9 @@ DEPENDS += "openssl-native util-linux-native"
 KMETA = "kernel-meta"
 KCONF_BSP_AUDIT_LEVEL = "2"
 
-SRCREV_machine_qemuarm ?= "71d15eb7c150cf6101ba19177fc3b8d9dea3c81a"
-SRCREV_machine ?= "3ecd5d9389679dcd6b5924990795a7a1800ccb8c"
-SRCREV_meta ?= "c8cf16c4be0513bc1e4c4349ff447737d850d222"
+SRCREV_machine_qemuarm ?= "de76f2a485fb6c73e3978b0138f756afb22e4db4"
+SRCREV_machine ?= "74fb33c678e2cf4cfbf9c6aa3e1fe6b019d10a5e"
+SRCREV_meta ?= "c9027edfa2919e0148ba12d56afa7c5a797aad10"
 
 PV = "${LINUX_VERSION}+git${SRCPV}"
 
diff --git a/meta/recipes-kernel/linux/linux-yocto_5.4.bb b/meta/recipes-kernel/linux/linux-yocto_5.4.bb
index 28fb30efa6..c37006cc04 100644
--- a/meta/recipes-kernel/linux/linux-yocto_5.4.bb
+++ b/meta/recipes-kernel/linux/linux-yocto_5.4.bb
@@ -12,16 +12,16 @@ KBRANCH_qemux86  ?= "v5.4/standard/base"
 KBRANCH_qemux86-64 ?= "v5.4/standard/base"
 KBRANCH_qemumips64 ?= "v5.4/standard/mti-malta64"
 
-SRCREV_machine_qemuarm ?= "510b022c947de1f73032233cb779797c47a5f20d"
-SRCREV_machine_qemuarm64 ?= "f16453629ea08136e0f55450a27c8e9b6ab3d812"
-SRCREV_machine_qemumips ?= "2dfc09d7dfe1d44f8e6782a6b00859b4be2eab1d"
-SRCREV_machine_qemuppc ?= "4a1091334ce7caf51953bbaee9efe0874a06037b"
-SRCREV_machine_qemuriscv64 ?= "ccec7b885902fcb1628b33ed2b35d5a68b287f93"
-SRCREV_machine_qemux86 ?= "ccec7b885902fcb1628b33ed2b35d5a68b287f93"
-SRCREV_machine_qemux86-64 ?= "ccec7b885902fcb1628b33ed2b35d5a68b287f93"
-SRCREV_machine_qemumips64 ?= "50a3d639d9147f947ea1987b9679b465936a7f71"
-SRCREV_machine ?= "ccec7b885902fcb1628b33ed2b35d5a68b287f93"
-SRCREV_meta ?= "c8cf16c4be0513bc1e4c4349ff447737d850d222"
+SRCREV_machine_qemuarm ?= "abbd99315753c7f8bde10fb6ac5b31d5ab7cdcd6"
+SRCREV_machine_qemuarm64 ?= "ab4c88e094069467cdb4e7d7bbac303e5039bc9f"
+SRCREV_machine_qemumips ?= "b52f600f9157b8107e5318d61f43007efb99c02c"
+SRCREV_machine_qemuppc ?= "5b3b062a7c87b3265274da81dcf675596b90d65b"
+SRCREV_machine_qemuriscv64 ?= "c232ad04fa15d324714799b90b9c4810a5dbe1bc"
+SRCREV_machine_qemux86 ?= "c232ad04fa15d324714799b90b9c4810a5dbe1bc"
+SRCREV_machine_qemux86-64 ?= "c232ad04fa15d324714799b90b9c4810a5dbe1bc"
+SRCREV_machine_qemumips64 ?= "b0057ef25af45fda6ae3ae9274cab8c248b4a70b"
+SRCREV_machine ?= "c232ad04fa15d324714799b90b9c4810a5dbe1bc"
+SRCREV_meta ?= "c9027edfa2919e0148ba12d56afa7c5a797aad10"
 
 # remap qemuarm to qemuarma15 for the 5.4 kernel
 # KMACHINE_qemuarm ?= "qemuarma15"
@@ -30,7 +30,7 @@ SRC_URI = "git://git.yoctoproject.org/linux-yocto.git;name=machine;branch=${KBRA
            git://git.yoctoproject.org/yocto-kernel-cache;type=kmeta;name=meta;branch=yocto-5.4;destsuffix=${KMETA}"
 
 LIC_FILES_CHKSUM = "file://COPYING;md5=bbea815ee2795b2f4230826c0c6b8814"
-LINUX_VERSION ?= "5.4.163"
+LINUX_VERSION ?= "5.4.165"
 
 DEPENDS += "${@bb.utils.contains('ARCH', 'x86', 'elfutils-native', '', d)}"
 DEPENDS += "openssl-native util-linux-native"
-- 
2.25.1


