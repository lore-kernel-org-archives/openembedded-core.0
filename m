Return-Path: <bruce.ashfield@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 101F9C433FE
	for <webhook@archiver.kernel.org>; Tue,  7 Dec 2021 16:52:17 +0000 (UTC)
Received: from mail-qv1-f50.google.com (mail-qv1-f50.google.com
 [209.85.219.50])
 by mx.groups.io with SMTP id smtpd.web08.591.1638895935894042431
 for <openembedded-core@lists.openembedded.org>;
 Tue, 07 Dec 2021 08:52:16 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20210112 header.b=oPfEIk66;
 spf=pass (domain: gmail.com, ip: 209.85.219.50,
 mailfrom: bruce.ashfield@gmail.com)
Received: by mail-qv1-f50.google.com with SMTP id u16so13654909qvk.4
        for <openembedded-core@lists.openembedded.org>;
 Tue, 07 Dec 2021 08:52:15 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:content-transfer-encoding;
        bh=ay/XCnFmUa342Wm7yKOIx/jy0zcPcnlpi6FNRH6UB98=;
        b=oPfEIk66DHKQXhy68GqE0IiKSj5S/9Lwg317r2ueuC+RVJSn41ZM+tVWlRRA/iuO1+
         eJKkqJTpyANP4x9IybN2CDrRpbYkb0ITlUdzxvNP9IP2ZUJD7hT7FwkqYW68Kl3PCXbE
         5afH56tB6SJmscRvhtmneKZIGvfmOBmJPMbJoRD40cq3AMT/LrWKw8/umiy5pT/iaoqW
         4frmUdIoi9YbBM3B8J4Ddi5mSqI8i2jl5oAxOHX1Pp3M5SlWPPQDYc45DWPbi1aBuqeQ
         6YZDshaUtigu6TwgBm1AkCCo3ue47ts1vIvJhv/Txg3LA36Wyz5IatQ0wgtI2JoPqDC0
         Gn5g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=ay/XCnFmUa342Wm7yKOIx/jy0zcPcnlpi6FNRH6UB98=;
        b=R+BbnPcDTE6juKf34tVneKZhpC0Sf5XKB4WKZrYfJHg+77kJnxrkHu8akbZuyEQYqr
         L/sfuNJOcQytBfZbV3TsEPHS56zNIxLgKzWj1hwWchzlTHqfcSF6tmNMeZN6iBYjQ8fD
         QeX3t6Fn+yOBlUxnf5QpPg9emWxwh4xTZW1ppTsnilsmYO48UvfZXckd5jZ+okqO6ZMw
         zZ1iJMOtR//QmD+ufM/5tW5VV3qOnr3sjpAfbuUeekwqzH+EtZOW2nk62LwDLUuq3Cth
         cA6Rn6j+IfMujrhBLNsTA5IkpMTlkllpOBDRRe5Gv+awcXry2e/ixwI8g9pIwChfPtiC
         KFfg==
X-Gm-Message-State: AOAM533sg9fti5SVGGl2qVzMRzFqknb/EllsftwWSJuQdVuOCpEbNYZs
	RwAe2/jgHbTkNZE3au4p9tLPKATirC0lUQ==
X-Google-Smtp-Source: 
 ABdhPJzEgzOGATBCzZo4+hxVs8yesDPMAIwC4qa6d1oKkRKfQDQhRTItEPbf4PhZkgSK0sqFzIBLWQ==
X-Received: by 2002:a05:6214:410e:: with SMTP id
 kc14mr348841qvb.73.1638895934886;
        Tue, 07 Dec 2021 08:52:14 -0800 (PST)
Received: from build.lan
 (cpe04d4c4975b80-cmf4c11490699b.cpe.net.cable.rogers.com. [174.112.63.222])
        by smtp.gmail.com with ESMTPSA id v9sm57536qkf.90.2021.12.07.08.52.14
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 07 Dec 2021 08:52:14 -0800 (PST)
From: bruce.ashfield@gmail.com
To: richard.purdie@linuxfoundation.org
Cc: openembedded-core@lists.openembedded.org
Subject: [PATCH 4/7] linux-yocto/5.15: update to v5.15.6
Date: Tue,  7 Dec 2021 11:52:05 -0500
Message-Id: 
 <d8782c1358afeec00fb13ec6f103e3f563027db6.1638895732.git.bruce.ashfield@gmail.com>
X-Mailer: git-send-email 2.19.1
In-Reply-To: <cover.1638895732.git.bruce.ashfield@gmail.com>
References: <cover.1638895732.git.bruce.ashfield@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Tue, 07 Dec 2021 16:52:17 -0000
X-Groupsio-URL: 
 https://lists.openembedded.org/g/openembedded-core/message/159320

From: Bruce Ashfield <bruce.ashfield@gmail.com>

Updating linux-yocto/5.15 to the latest korg -stable release that comprises
the following commits:

a2547651bc89 Linux 5.15.6
4268e8325d63 drm/amdgpu/gfx9: switch to golden tsc registers for renoir+
8c501d9cf122 drm/amdgpu/gfx10: add wraparound gpu counter check for APUs as well
db8ed1e61b49 block: avoid to quiesce queue in elevator_init_mq
e03513f58919 blk-mq: cancel blk-mq dispatch work in both blk_cleanup_queue and disk_release()
d9262cc886e2 docs: accounting: update delay-accounting.rst reference
ec8848ab5ebc firmware: arm_scmi: Fix type error in sensor protocol
4cbe2531efeb firmware: arm_scmi: Fix type error assignment in voltage protocol
2d447d318b76 io_uring: fix soft lockup when call __io_remove_buffers
d841c6720fb2 cifs: nosharesock should be set on new server
c9c8c054a01c tracing: Check pid filtering when creating events
6e56e87f43e2 ksmbd: Fix an error handling path in 'smb2_sess_setup()'
278f72e8eb57 vhost/vsock: fix incorrect used length reported to the guest
e4d58ac67e63 vdpa_sim: avoid putting an uninitialized iova_domain
e2c8ed0de4ab iommu/amd: Clarify AMD IOMMUv2 initialization messages
68883f17798c ceph: properly handle statfs on multifs setups
a96c6f0bbba6 cifs: nosharesock should not share socket with future sessions
98805da98d93 riscv: dts: microchip: drop duplicated MMC/SDHC node
fda0d131c0a4 riscv: dts: microchip: fix board compatible
8984bba3b4c0 f2fs: set SBI_NEED_FSCK flag when inconsistent node block found
fb89bcbfbf37 f2fs: quota: fix potential deadlock
724ee060d0ab iommu/vt-d: Fix unmap_pages support
88fc40a33ff3 iommu/rockchip: Fix PAGE_DESC_HI_MASKs for RK3568
229c555260cb sched/scs: Reset task stack state in bringup_cpu()
5f8c2755f850 perf: Ignore sigtrap for tracepoints destined for other tasks
76723ed1fb89 locking/rwsem: Make handoff bit handling more consistent
7b9237a8ef19 net: mscc: ocelot: correctly report the timestamping RX filters in ethtool
93945f2c10bc net: mscc: ocelot: don't downgrade timestamping RX filters in SIOCSHWTSTAMP
d1e71d7d2282 net: hns3: fix incorrect components info of ethtool --reset command
41f967a247bf net: hns3: fix VF RSS failed problem after PF enable multi-TCs
724c50cac0d5 net/smc: Don't call clcsock shutdown twice when smc shutdown
f7fc72a508cf net: vlan: fix underflow for the real_dev refcnt
abfdd9e2f0f9 ethtool: ioctl: fix potential NULL deref in ethtool_set_coalesce()
e25bdbc7e951 net/sched: sch_ets: don't peek at classes beyond 'nbands'
a92f0eebb8dc net: stmmac: Disable Tx queues when reconfiguring the interface
b3c37092378b tls: fix replacing proto_ops
6a012337bc70 tls: splice_read: fix accessing pre-processed records
befe4e291594 tls: splice_read: fix record type check
a6a75b537a4f MIPS: use 3-level pgtable for 64KB page size on MIPS_VA_BITS_48
ea3c7588e16f MIPS: loongson64: fix FTLB configuration
1685d6669a84 igb: fix netpoll exit with traffic
5585036815e5 nvmet: use IOCB_NOWAIT only if the filesystem supports it
a93af38c9f47 net/smc: Fix loop in smc_listen
bb851d0fb025 net/smc: Fix NULL pointer dereferencing in smc_vlan_by_tcpsk()
e85d50c4d85e net: phylink: Force retrigger in case of latched link-fail indicator
d6525de28dfe net: phylink: Force link down and retrigger resolve on interface change
cc1645427a0f lan743x: fix deadlock in lan743x_phy_link_status_change()
8165a96f6b71 tcp_cubic: fix spurious Hystart ACK train detections for not-cwnd-limited flows
7b904ba3568d drm/amd/display: Set plane update flags for all planes in reset
4da564004a73 drm/amd/display: Fix DPIA outbox timeout after GPU reset
c83f27576c46 PM: hibernate: use correct mode for swsusp_close()
fd49f1f5945a net/ncsi : Add payload to be 32-bit aligned to fix dropped packets
ff1a30740f7a arm64: uaccess: avoid blocking within critical sections
85851d9ff790 drm/hyperv: Fix device removal on Gen1 VMs
63a68f377182 nvmet-tcp: fix incomplete data digest send
d10ecfd9518e cpufreq: intel_pstate: Add Ice Lake server to out-of-band IDs
57e91396455e net: marvell: mvpp2: increase MTU limit when XDP enabled
d815f7ca8bd7 net: ipa: kill ipa_cmd_pipeline_clear()
740c461a7340 net: ipa: separate disabling setup from modem stop
f38aa5cfadf1 net: ipa: directly disable ipa-setup-ready interrupt
da4d70199e5d mlxsw: spectrum: Protect driver from buggy firmware
12dea26c05cd net/smc: Ensure the active closing peer first closes clcsock
cc432b0727ce i2c: virtio: disable timeout handling
4339cd082594 erofs: fix deadlock when shrink erofs slab
8b3b9aaada48 scsi: scsi_debug: Zero clear zones at reset write pointer
a67c045b5558 scsi: core: sysfs: Fix setting device state to SDEV_RUNNING
1f10b09ccc83 ice: avoid bpf_prog refcount underflow
992ba40a6763 ice: fix vsi->txq_map sizing
6652101175c5 net: nexthop: release IPv6 per-cpu dsts when replacing a nexthop group
e085ae661afe net: ipv6: add fib6_nh_release_dsts stub
8d196fa5a901 net: stmmac: retain PTP clock time during SIOCSHWTSTAMP ioctls
f6cd57685567 nfp: checking parameter process for rx-usecs/tx-usecs is invalid
f1f243c06675 ipv6: fix typos in __ip6_finish_output()
88f6b5f10fd1 firmware: smccc: Fix check for ARCH_SOC_ID not implemented
80d709875d92 af_unix: fix regression in read after shutdown
97e5d85030c5 mptcp: use delegate action to schedule 3rd ack retrans
10ef3a1c9377 mptcp: fix delack timer
26c3603a2a88 ALSA: intel-dsp-config: add quirk for JSL devices based on ES8336 codec
c6db0b15ced0 xen/pvh: add missing prototype to header
7c7cfc9da026 x86/pvh: add prototype for xen_pvh_init()
229e70bf02d5 iavf: Fix VLAN feature flags after VFR
8d4b4e0f0114 iavf: Fix refreshing iavf adapter stats on ethtool request
e4031c048f48 iavf: Prevent changing static ITR values if adaptive moderation is on
25bbaa3ae179 HID: magicmouse: prevent division by 0 on scroll
6341c9ccb29a HID: input: set usage type to key on keycode remap
740dd84229a5 HID: input: Fix parsing of HID_CP_CONSUMER_CONTROL fields
03e5203d2161 net: marvell: prestera: fix double free issue on err path
8599e15e508e net: marvell: prestera: fix brige port operation
94850e2dda99 drm/aspeed: Fix vga_pw sysfs output
555721765bd6 drm/vc4: fix error code in vc4_create_object()
b28df766a3fc scsi: mpt3sas: Fix incorrect system timestamp
8f13c5eddf50 scsi: mpt3sas: Fix system going into read-only mode
8485649a7655 scsi: mpt3sas: Fix kernel panic during drive powercycle test
032cf0ad6873 scsi: qla2xxx: edif: Fix off by one bug in qla_edif_app_getfcinfo()
8f98d6449b09 drm/nouveau/acr: fix a couple NULL vs IS_ERR() checks
20a09c8b25a2 ARM: socfpga: Fix crash with CONFIG_FORTIRY_SOURCE
c76a5e594920 NFSv42: Don't fail clone() unless the OP_CLONE operation failed
63073a015730 ASoC: stm32: i2s: fix 32 bits channel length without mclk
008fb838e226 firmware: arm_scmi: pm: Propagate return value to caller
7382bcaf30cb firmware: arm_scmi: Fix base agent discover response
6335d90df8af net: ieee802154: handle iftypes as u32
4739705254a7 ASoC: codecs: lpass-rx-macro: fix HPHR setting CLSH mask
b1b33a14298a ASoC: codecs: wcd934x: return error code correctly from hw_params
de178246c303 ASoC: codecs: wcd938x: fix volatile register range
49475a2b29b3 ASoC: topology: Add missing rwsem around snd_ctl_remove() calls
f4c465bf918a ASoC: qdsp6: q6asm: fix q6asm_dai_prepare error handling
f61e5332fe24 ASoC: qdsp6: q6routing: Conditionally reset FrontEnd Mixer
322eebada5e3 ARM: dts: bcm2711: Fix PCIe interrupts
6012bea74344 ARM: dts: BCM5301X: Add interrupt properties to GPIO node
b14b8cf0d1c6 ARM: dts: BCM5301X: Fix I2C controller interrupt
03339d10253e firmware: arm_scmi: Fix null de-reference on error path
75fa2dadb7c2 media: v4l2-core: fix VIDIOC_DQEVENT handling on non-x86
ed741b849ade netfilter: flowtable: fix IPv6 tunnel addr match
e76228cbecc2 netfilter: ipvs: Fix reuse connection if RS weight is 0
49f878330758 netfilter: ctnetlink: do not erase error code with EINVAL
59a0088fde86 netfilter: ctnetlink: fix filtering with CTA_TUPLE_REPLY
37c8d485cb72 ASoC: SOF: Intel: hda: fix hotplug when only codec is suspended
7b3a34f08d11 proc/vmcore: fix clearing user buffer by properly using clear_user()
de6231fc7f2b drm/amd/display: Fix OLED brightness control on eDP
edd145cd0902 PCI: aardvark: Fix link training
cc890665eaa1 PCI: aardvark: Simplify initialization of rootcap on virtual bridge
70b131ff35bd PCI: aardvark: Implement re-issuing config requests on CRS response
c37f8369fa03 PCI: aardvark: Deduplicate code in advk_pcie_rd_conf()
a0a7875c0305 NFSv42: Fix pagecache invalidation after COPY/CLONE
55d2254fd9a0 iomap: Fix inline extent handling in iomap_readpage
c4e3ff8b8b1d powerpc/32: Fix hardlockup on vmap stack overflow
671fbc2e8dea cpufreq: intel_pstate: Fix active mode offline/online EPP handling
7dd74096dd28 arm64: mm: Fix VM_BUG_ON(mm != &init_mm) for trans_pgd
9ed3dc3968ad mdio: aspeed: Fix "Link is Down" issue
4332ead29990 mmc: sdhci: Fix ADMA for PAGE_SIZE >= 64KiB
4721b9ee049a mmc: sdhci-esdhc-imx: disable CMDQ support
55bc4437762a tracing: Fix pid filtering when triggers are attached
a3e90db5180f tracing/uprobe: Fix uprobe_perf_open probes iteration
83247fdb9417 KVM: PPC: Book3S HV: Prevent POWER7/8 TLB flush flushing SLB
11e659827c3a ksmbd: fix memleak in get_file_stream_info()
522cd5c6554a ksmbd: contain default data stream even if xattr is empty
b05576526e84 ksmbd: downgrade addition info error msg to debug in smb2_get_info_sec()
a70414d820f7 drm/nouveau: recognise GA106
832c006eec0d drm/amdgpu/pm: fix powerplay OD interface
2def7fdf5c82 drm/amdgpu: IH process reset count when restart
1c939a53b26b io_uring: fix link traversal locking
3d2a1e68fd99 io_uring: fail cancellation for EXITING tasks
09eb40f6776c io_uring: correct link-list traversal locking
c673d72d2f61 xen: detect uninitialized xenbus in xenbus_init
6660b61a4182 xen: don't continue xenstore initialization in case of errors
695438d30896 fuse: release pipe buf after last use
c8d3775745ad staging: r8188eu: fix a memory leak in rtw_wx_read32()
788fa64fa8de staging: r8188eu: use GFP_ATOMIC under spinlock
b0d61266f56a staging: r8188eu: Fix breakage introduced when 5G code was removed
51bdb198872c staging: r8188eu: Use kzalloc() with GFP_ATOMIC in atomic context
e27ee2f607fe staging: rtl8192e: Fix use after free in _rtl92e_pci_disconnect()
f0340bea8302 staging: greybus: Add missing rwsem around snd_ctl_remove() calls
d58ec6e81803 staging/fbtft: Fix backlight
d048d3eb3ca7 HID: wacom: Use "Confidence" flag to prevent reporting invalid contacts
28849ab40bac Revert "parisc: Fix backtrace to always include init funtion names"
02130f5e7ca3 media: cec: copy sequence field for the reply
238c04518ff1 ALSA: hda/realtek: Fix LED on HP ProBook 435 G7
4e6ef0940048 ALSA: hda/realtek: Add quirk for ASRock NUC Box 1100
25aa8e9f1031 ALSA: ctxfi: Fix out-of-range access
849d86e85951 binder: fix test regression due to sender_euid change
816904fd873b usb: hub: Fix locking issues with address0_mutex
55197c24c6f1 usb: hub: Fix usb enumeration issue due to address0 race
631a7e0afebd usb: xhci: tegra: Check padctrl interrupt presence in device tree
907f68f03f4f usb: typec: fusb302: Fix masking of comparator and bc_lvl interrupts
a815c169c8c4 usb: chipidea: ci_hdrc_imx: fix potential error pointer dereference in probe
39509d76a9a3 net: nexthop: fix null pointer dereference when IPv6 is not enabled
54619c356f6c net: usb: Correct PHY handling of smsc95xx
70ba56d4f464 usb: dwc3: gadget: Fix null pointer exception
ecba9bc9946b usb: dwc3: gadget: Check for L1/L2/U3 for Start Transfer
d92d8b589366 usb: dwc3: gadget: Ignore NoStream after End Transfer
949fac2e09dd usb: dwc3: core: Revise GHWPARAMS9 offset
a6cc2445103e usb: dwc3: leave default DMA for PCI devices
a5e1211d4451 usb: dwc2: hcd_queue: Fix use of floating point literal
581f42756d29 usb: dwc2: gadget: Fix ISOC flow for elapsed frames
8228d7b0281c USB: serial: option: add Fibocom FM101-GL variants
616dc7809103 USB: serial: option: add Telit LE910S1 0x9200 composition
ea773394a003 USB: serial: pl2303: fix GC type detection
e0b8e1ae8306 ACPI: CPPC: Add NULL pointer check to cppc_get_perf()
dbd961095ed4 ACPI: Get acpi_device's parent from the parent field
c82cd4eed128 scsi: sd: Fix sd_do_mode_sense() buffer length handling

Signed-off-by: Bruce Ashfield <bruce.ashfield@gmail.com>
---
 .../linux/linux-yocto-rt_5.15.bb              |  6 ++---
 .../linux/linux-yocto-tiny_5.15.bb            |  8 +++---
 meta/recipes-kernel/linux/linux-yocto_5.15.bb | 26 +++++++++----------
 3 files changed, 20 insertions(+), 20 deletions(-)

diff --git a/meta/recipes-kernel/linux/linux-yocto-rt_5.15.bb b/meta/recipes-kernel/linux/linux-yocto-rt_5.15.bb
index 44258b5a2d..9f5d4447d3 100644
--- a/meta/recipes-kernel/linux/linux-yocto-rt_5.15.bb
+++ b/meta/recipes-kernel/linux/linux-yocto-rt_5.15.bb
@@ -11,13 +11,13 @@ python () {
         raise bb.parse.SkipRecipe("Set PREFERRED_PROVIDER_virtual/kernel to linux-yocto-rt to enable it")
 }
 
-SRCREV_machine ?= "bbc84107a92f0ac6e4eb0ba4f00598d0e826626e"
-SRCREV_meta ?= "f4c2f109264fef1c8ccc87bef6e3b4c666a91b93"
+SRCREV_machine ?= "7e69ef480edfe25ec8e0237b54815138a5a10695"
+SRCREV_meta ?= "df57bc53f6ca3fb3b2d3a9e5331ceff533d6f508"
 
 SRC_URI = "git://git.yoctoproject.org/linux-yocto.git;branch=${KBRANCH};name=machine \
            git://git.yoctoproject.org/yocto-kernel-cache;type=kmeta;name=meta;branch=yocto-5.15;destsuffix=${KMETA}"
 
-LINUX_VERSION ?= "5.15.5"
+LINUX_VERSION ?= "5.15.6"
 
 LIC_FILES_CHKSUM = "file://COPYING;md5=6bc538ed5bd9a7fc9398086aedcd7e46"
 
diff --git a/meta/recipes-kernel/linux/linux-yocto-tiny_5.15.bb b/meta/recipes-kernel/linux/linux-yocto-tiny_5.15.bb
index c8575eb51a..6bb09e28a8 100644
--- a/meta/recipes-kernel/linux/linux-yocto-tiny_5.15.bb
+++ b/meta/recipes-kernel/linux/linux-yocto-tiny_5.15.bb
@@ -6,7 +6,7 @@ KCONFIG_MODE = "--allnoconfig"
 
 require recipes-kernel/linux/linux-yocto.inc
 
-LINUX_VERSION ?= "5.15.5"
+LINUX_VERSION ?= "5.15.6"
 LIC_FILES_CHKSUM = "file://COPYING;md5=6bc538ed5bd9a7fc9398086aedcd7e46"
 
 DEPENDS += "${@bb.utils.contains('ARCH', 'x86', 'elfutils-native', '', d)}"
@@ -15,9 +15,9 @@ DEPENDS += "openssl-native util-linux-native"
 KMETA = "kernel-meta"
 KCONF_BSP_AUDIT_LEVEL = "2"
 
-SRCREV_machine:qemuarm ?= "9e5e6538682b203a78dfb488b406721b0ade6696"
-SRCREV_machine ?= "53325c5c9b1c7e94b83e049f69f258fd34a8eac5"
-SRCREV_meta ?= "f4c2f109264fef1c8ccc87bef6e3b4c666a91b93"
+SRCREV_machine:qemuarm ?= "d3f6afd8b86ba551b9b866c98ee6470d7ee3b99f"
+SRCREV_machine ?= "17da35e5c5cafd55f8a10d43d8765397eb733399"
+SRCREV_meta ?= "df57bc53f6ca3fb3b2d3a9e5331ceff533d6f508"
 
 PV = "${LINUX_VERSION}+git${SRCPV}"
 
diff --git a/meta/recipes-kernel/linux/linux-yocto_5.15.bb b/meta/recipes-kernel/linux/linux-yocto_5.15.bb
index 78cd45fc20..a67771eb1b 100644
--- a/meta/recipes-kernel/linux/linux-yocto_5.15.bb
+++ b/meta/recipes-kernel/linux/linux-yocto_5.15.bb
@@ -13,17 +13,17 @@ KBRANCH:qemux86  ?= "v5.15/standard/base"
 KBRANCH:qemux86-64 ?= "v5.15/standard/base"
 KBRANCH:qemumips64 ?= "v5.15/standard/mti-malta64"
 
-SRCREV_machine:qemuarm ?= "f26f14bca6435aace2b2415724d2169864adc35d"
-SRCREV_machine:qemuarm64 ?= "53325c5c9b1c7e94b83e049f69f258fd34a8eac5"
-SRCREV_machine:qemumips ?= "63867040ed5f6e51e1fbf380ff5cfce253672fc4"
-SRCREV_machine:qemuppc ?= "53325c5c9b1c7e94b83e049f69f258fd34a8eac5"
-SRCREV_machine:qemuriscv64 ?= "53325c5c9b1c7e94b83e049f69f258fd34a8eac5"
-SRCREV_machine:qemuriscv32 ?= "53325c5c9b1c7e94b83e049f69f258fd34a8eac5"
-SRCREV_machine:qemux86 ?= "53325c5c9b1c7e94b83e049f69f258fd34a8eac5"
-SRCREV_machine:qemux86-64 ?= "53325c5c9b1c7e94b83e049f69f258fd34a8eac5"
-SRCREV_machine:qemumips64 ?= "0872b063d6908a38ae8bc5a5be1f2ab9177b32b5"
-SRCREV_machine ?= "53325c5c9b1c7e94b83e049f69f258fd34a8eac5"
-SRCREV_meta ?= "f4c2f109264fef1c8ccc87bef6e3b4c666a91b93"
+SRCREV_machine:qemuarm ?= "8935caacf2a94b558bb610594d6afd044aa26be3"
+SRCREV_machine:qemuarm64 ?= "17da35e5c5cafd55f8a10d43d8765397eb733399"
+SRCREV_machine:qemumips ?= "71955d634950e6477e594645b8159445e48a875d"
+SRCREV_machine:qemuppc ?= "17da35e5c5cafd55f8a10d43d8765397eb733399"
+SRCREV_machine:qemuriscv64 ?= "17da35e5c5cafd55f8a10d43d8765397eb733399"
+SRCREV_machine:qemuriscv32 ?= "17da35e5c5cafd55f8a10d43d8765397eb733399"
+SRCREV_machine:qemux86 ?= "17da35e5c5cafd55f8a10d43d8765397eb733399"
+SRCREV_machine:qemux86-64 ?= "17da35e5c5cafd55f8a10d43d8765397eb733399"
+SRCREV_machine:qemumips64 ?= "84a301c888e6dda95617c3009a7aace5c31c5048"
+SRCREV_machine ?= "17da35e5c5cafd55f8a10d43d8765397eb733399"
+SRCREV_meta ?= "df57bc53f6ca3fb3b2d3a9e5331ceff533d6f508"
 
 # set your preferred provider of linux-yocto to 'linux-yocto-upstream', and you'll
 # get the <version>/base branch, which is pure upstream -stable, and the same
@@ -31,7 +31,7 @@ SRCREV_meta ?= "f4c2f109264fef1c8ccc87bef6e3b4c666a91b93"
 # normal PREFERRED_VERSION settings.
 BBCLASSEXTEND = "devupstream:target"
 DEFAULT_PREFERENCE:class-devupstream = "-1"
-SRCREV_machine:class-devupstream ?= "f00712e27083550be3031099b7697925533a6e01"
+SRCREV_machine:class-devupstream ?= "a2547651bc896f95a3680a6a0a27401e7c7a1080"
 PN:class-devupstream = "linux-yocto-upstream"
 KBRANCH:class-devupstream = "v5.15/base"
 
@@ -42,7 +42,7 @@ SRC_URI = "git://git.yoctoproject.org/linux-yocto.git;name=machine;branch=${KBRA
            git://git.yoctoproject.org/yocto-kernel-cache;type=kmeta;name=meta;branch=yocto-5.15;destsuffix=${KMETA}"
 
 LIC_FILES_CHKSUM = "file://COPYING;md5=6bc538ed5bd9a7fc9398086aedcd7e46"
-LINUX_VERSION ?= "5.15.5"
+LINUX_VERSION ?= "5.15.6"
 
 DEPENDS += "${@bb.utils.contains('ARCH', 'x86', 'elfutils-native', '', d)}"
 DEPENDS += "openssl-native util-linux-native"
-- 
2.19.1


