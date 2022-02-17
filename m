Return-Path: <anuj.mittal@intel.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id A8DF7C433FE
	for <webhook@archiver.kernel.org>; Thu, 17 Feb 2022 14:18:41 +0000 (UTC)
Received: from mga09.intel.com (mga09.intel.com [134.134.136.24])
 by mx.groups.io with SMTP id smtpd.web09.318.1645107508890252839
 for <openembedded-core@lists.openembedded.org>;
 Thu, 17 Feb 2022 06:18:41 -0800
Authentication-Results: mx.groups.io;
 dkim=fail reason="unable to parse pub key" header.i=@intel.com header.s=intel
 header.b=lqzEsbKP;
 spf=pass (domain: intel.com, ip: 134.134.136.24,
 mailfrom: anuj.mittal@intel.com)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1645107521; x=1676643521;
  h=from:to:subject:date:message-id:in-reply-to:references:
   mime-version:content-transfer-encoding;
  bh=pDUO4wMhJNQMeMhm9BQOXR4Shhu0huBh8w+9rxQNh+I=;
  b=lqzEsbKPXY/aT4Knaewaxhjlh0YeB8Vc0RV9ABU0h+FTxL7MyBPKAmxE
   7s3WCZ2tJ4OYzcOWTEcfWgPVm+8XxUqGsFtgWB5CxVgZztec7UXs4HR89
   atTONgEgMKq2fDM4pN9cO6wsoVBzEkOse3azQktEJaWeKfOJok6Xnsk/o
   0I1qBMlvZHAJja00s+lpqcJUdImY5Dgw7cMm0ZAwoj3pwdwIq2G2/tHIo
   79kTZK8j7GLkVDyOCMwR5soCjg4XErMM2uNlURz4mfAe3ynUUhGMq5ihe
   PDb5VI1rj+c0TeKATKs3Z/UZrerasZUhDrYAHdvCelEfbOhTJanL+RRkV
   w==;
X-IronPort-AV: E=McAfee;i="6200,9189,10260"; a="250618014"
X-IronPort-AV: E=Sophos;i="5.88,376,1635231600";
   d="scan'208";a="250618014"
Received: from orsmga007.jf.intel.com ([10.7.209.58])
  by orsmga102.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 17 Feb 2022 06:18:40 -0800
X-IronPort-AV: E=Sophos;i="5.88,376,1635231600";
   d="scan'208";a="530249298"
Received: from kkoay3-mobl.gar.corp.intel.com (HELO anmitta2-mobl3.intel.com)
 ([10.213.130.102])
  by orsmga007-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 17 Feb 2022 06:18:39 -0800
From: Anuj Mittal <anuj.mittal@intel.com>
To: openembedded-core@lists.openembedded.org
Subject: [hardknott][PATCH 08/14] linux-yocto/5.10: update to v5.10.99
Date: Thu, 17 Feb 2022 22:18:17 +0800
Message-Id: 
 <b8f68a73d0782b4bc6c1e953cc28fb408245f4cb.1645106980.git.anuj.mittal@intel.com>
X-Mailer: git-send-email 2.35.1
In-Reply-To: <cover.1645106980.git.anuj.mittal@intel.com>
References: <cover.1645106980.git.anuj.mittal@intel.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Thu, 17 Feb 2022 14:18:41 -0000
X-Groupsio-URL: 
 https://lists.openembedded.org/g/openembedded-core/message/161808

From: Bruce Ashfield <bruce.ashfield@gmail.com>

Updating linux-yocto/5.10 to the latest korg -stable release that comprises
the following commits:

    fb063a6465f9 Linux 5.10.99
    4889d6ee9e48 selftests: nft_concat_range: add test for reload with no element add/del
    557727313534 cgroup/cpuset: Fix "suspicious RCU usage" lockdep warning
    f1f7d1a22fd7 net: dsa: mt7530: make NET_DSA_MT7530 select MEDIATEK_GE_PHY
    84b76a509cc3 ext4: fix incorrect type issue during replay_del_range
    62e46e0ffc02 ext4: fix error handling in ext4_fc_record_modified_inode()
    764793b4a5d0 ext4: fix error handling in ext4_restore_inline_data()
    6c5bd55e36d3 ext4: modify the logic of ext4_mb_new_blocks_simple
    8d71fc23fcb8 ext4: prevent used blocks from being allocated during fast commit replay
    ef2053afd71e EDAC/xgene: Fix deferred probing
    2a12faf55bae EDAC/altera: Fix deferred probing
    dd274cf85269 x86/perf: Default set FREEZE_ON_SMI for all
    456f041e0359 perf/x86/intel/pt: Fix crash with stop filters in single-range mode
    8c0e6a8a630e perf stat: Fix display of grouped aliased events
    57e8859acc60 fbcon: Add option to enable legacy hardware acceleration
    460f6b1a238d Revert "fbcon: Disable accelerated scrolling"
    460aa9d87340 rtc: cmos: Evaluate century appropriate
    2324f5fcdf9d tools/resolve_btfids: Do not print any commands when building silently
    1536fafa23ac selftests: futex: Use variable MAKE instead of make
    8f0fff8b5968 selftests/exec: Remove pipe from TEST_GEN_FILES
    6304a613a97d bpf: Use VM_MAP instead of VM_ALLOC for ringbuf
    f744a064041c gve: fix the wrong AdminQ buffer queue index check
    51e88e892273 nfsd: nfsd4_setclientid_confirm mistakenly expires confirmed client.
    ec4334152dae scsi: bnx2fc: Make bnx2fc_recv_frame() mp safe
    fd482f2d63db pinctrl: bcm2835: Fix a few error paths
    752d9eafc64e pinctrl: intel: fix unexpected interrupt
    14bc9978b486 pinctrl: intel: Fix a glitch when updating IRQ flags on a preconfigured line
    5a45448ac95b ASoC: max9759: fix underflow in speaker_gain_control_put()
    02f459719832 ASoC: cpcap: Check for NULL pointer after calling of_get_child_by_name
    cb5f1fbd1f22 ASoC: xilinx: xlnx_formatter_pcm: Make buffer bytes multiple of period bytes
    56e0747d59ac ASoC: fsl: Add missing error handling in pcm030_fabric_probe
    3e698375517d drm/i915/overlay: Prevent divide by zero bugs in scaling
    9ea018536111 net: stmmac: ensure PTP time register reads are consistent
    41df2da2c1f3 net: stmmac: dump gmac4 DMA registers correctly
    114bf9350413 net: macsec: Verify that send_sci is on when setting Tx sci explicitly
    2e7f5b6ee1a7 net: macsec: Fix offload support for NETDEV_UNREGISTER event
    87b1c9fab6fe net: ieee802154: Return meaningful error codes from the netlink helpers
    78b3f20c17cb net: ieee802154: ca8210: Stop leaking skb's
    0bfe50dc5d91 net: ieee802154: mcr20a: Fix lifs/sifs periods
    75bbda318987 net: ieee802154: hwsim: Ensure proper channel selection at probe time
    e895e067d73e spi: uniphier: fix reference count leak in uniphier_spi_probe()
    ec942d08e070 spi: meson-spicc: add IRQ check in meson_spicc_probe
    c2cf65e1008b spi: mediatek: Avoid NULL pointer crash in interrupt
    30e05c98b99d spi: bcm-qspi: check for valid cs before applying chip select
    6d226e8afe88 iommu/amd: Fix loop timeout issue in iommu_ga_log_enable()
    9d9995b0371e iommu/vt-d: Fix potential memory leak in intel_setup_irq_remapping()
    b3958d315163 RDMA/mlx4: Don't continue event handler after memory allocation failure
    d3f8b927df2f RDMA/siw: Fix broken RDMA Read Fence/Resume logic.
    c7db20f5be73 IB/rdmavt: Validate remote_addr during loopback atomic tests
    75c610212b9f RDMA/ucma: Protect mc during concurrent multicast leaves
    371979069a57 RDMA/cma: Use correct address when leaving multicast group
    aa4ecd995f59 memcg: charge fs_context and legacy_fs_context
    080f371d984e Revert "ASoC: mediatek: Check for error clk pointer"
    4a9bd1e6780f IB/hfi1: Fix AIP early init panic
    5d40f1bdad3d dma-buf: heaps: Fix potential spectre v1 gadget
    30de3bc09978 block: bio-integrity: Advance seed correctly for larger interval sizes
    352715593e81 mm/kmemleak: avoid scanning potential huge holes
    7053188ddba3 mm/pgtable: define pte_index so that preprocessor could recognize it
    bce7f5d74d74 mm/debug_vm_pgtable: remove pte entry from the page table
    2d83a7463d75 nvme-fabrics: fix state check in nvmf_ctlr_matches_baseopts()
    a0c73dbdd197 drm/amd/display: Force link_rate as LINK_RATE_RBR2 for 2018 15" Apple Retina panels
    f071d9fa8575 drm/nouveau: fix off by one in BIOS boundary checking
    32747e01436a btrfs: fix deadlock between quota disable and qgroup rescan worker
    aa5d406153c5 ALSA: hda/realtek: Fix silent output on Gigabyte X570 Aorus Xtreme after reboot from Windows
    d4aa3a98596f ALSA: hda/realtek: Fix silent output on Gigabyte X570S Aorus Master (newer chipset)
    3a8a8072e32b ALSA: hda/realtek: Add missing fixup-model entry for Gigabyte X570 ALC1220 quirks
    532cde962f5f ALSA: hda/realtek: Add quirk for ASUS GU603
    410f231fd70c ALSA: hda: realtek: Fix race at concurrent COEF updates
    a7de1002135c ALSA: hda: Fix UAF of leds class devs at unbinding
    470bbb9cbd8f ALSA: usb-audio: Correct quirk for VF0770
    6877f87579ed ASoC: ops: Reject out of bounds values in snd_soc_put_xr_sx()
    038f8b7caa74 ASoC: ops: Reject out of bounds values in snd_soc_put_volsw_sx()
    a9394f21fba0 ASoC: ops: Reject out of bounds values in snd_soc_put_volsw()
    0ff6b8050695 audit: improve audit queue handling when "audit=1" on cmdline
    f446089a268c selinux: fix double free of cond_list on error paths
    12a0a56cbae3 Linux 5.10.98
    97a47e25559e Revert "drm/vc4: hdmi: Make sure the device is powered with CEC" again
    e27042060f81 Revert "drm/vc4: hdmi: Make sure the device is powered with CEC"
    c8ed22bd97d4 Linux 5.10.97
    176356550ced tcp: add missing tcp_skb_can_collapse() test in tcp_shift_skb_data()
    32e179971085 af_packet: fix data-race in packet_setsockopt / packet_setsockopt
    aa9e96db3121 cpuset: Fix the bug that subpart_cpus updated wrongly in update_cpumask()
    3bbe2019dd12 rtnetlink: make sure to refresh master_dev/m_ops in __rtnl_newlink()
    e7be56926397 net: sched: fix use-after-free in tc_new_tfilter()
    7b4741644cf7 fanotify: Fix stale file descriptor in copy_event_to_user()
    4d3fcfe84648 net: amd-xgbe: Fix skb data length underflow
    cadfa7dce526 net: amd-xgbe: ensure to reset the tx_timer_active flag
    77534b114f24 ipheth: fix EOVERFLOW in ipheth_rcvbulk_callback
    b4ced7a46d9f net/mlx5: E-Switch, Fix uninitialized variable modact
    502c37b033fa net/mlx5: Use del_timer_sync in fw reset flow of halting poll
    a01ee1b8165f net/mlx5e: Fix handling of wrong devices during bond netevent
    1fc3444cda9a cgroup-v1: Require capabilities to set release_agent
    ac4ba79bb028 drm/vc4: hdmi: Make sure the device is powered with CEC
    46f919c6bdc5 x86/cpu: Add Xeon Icelake-D to list of CPUs that support PPIN
    fbdbf6743f77 x86/mce: Add Xeon Sapphire Rapids to list of CPUs that support PPIN
    d4e4e61d4a5b psi: Fix uaf issue when psi trigger is destroyed while being polled
    080dbe7e9b86 KVM: x86: Forcibly leave nested virt when SMM state is toggled
    063029a8820e Revert "drivers: bus: simple-pm-bus: Add support for probing simple bus only devices"
    42fdbf8b7dab net: ipa: prevent concurrent replenish
    ad81380d3a48 net: ipa: use a bitmap for endpoint replenish_enabled
    2ed912e3e057 net: ipa: fix atomic update in ipa_endpoint_replenish()
    3b4c966fb156 PCI: pciehp: Fix infinite loop in IRQ handler upon power fault

Signed-off-by: Bruce Ashfield <bruce.ashfield@gmail.com>
Signed-off-by: Richard Purdie <richard.purdie@linuxfoundation.org>
(cherry picked from commit 1da72913333948e8c63d39033d38f19d9cdd322e)
Signed-off-by: Anuj Mittal <anuj.mittal@intel.com>
---
 .../linux/linux-yocto-rt_5.10.bb              |  6 ++---
 .../linux/linux-yocto-tiny_5.10.bb            |  8 +++----
 meta/recipes-kernel/linux/linux-yocto_5.10.bb | 24 +++++++++----------
 3 files changed, 19 insertions(+), 19 deletions(-)

diff --git a/meta/recipes-kernel/linux/linux-yocto-rt_5.10.bb b/meta/recipes-kernel/linux/linux-yocto-rt_5.10.bb
index 4ee93cdd8b..f142da66ab 100644
--- a/meta/recipes-kernel/linux/linux-yocto-rt_5.10.bb
+++ b/meta/recipes-kernel/linux/linux-yocto-rt_5.10.bb
@@ -11,13 +11,13 @@ python () {
         raise bb.parse.SkipRecipe("Set PREFERRED_PROVIDER_virtual/kernel to linux-yocto-rt to enable it")
 }
 
-SRCREV_machine ?= "8aebbbd41d16fc564ff99709d4f01a116d07e7a4"
-SRCREV_meta ?= "0db3f511b2a553a5ea31ac45249a42f084fc287c"
+SRCREV_machine ?= "53a27dc510c8d9152ffa4d2d95b888db7d3d97b6"
+SRCREV_meta ?= "a58f4e7cca3973e04d3f9a40356ef9c2c0bb10a5"
 
 SRC_URI = "git://git.yoctoproject.org/linux-yocto.git;branch=${KBRANCH};name=machine \
            git://git.yoctoproject.org/yocto-kernel-cache;type=kmeta;name=meta;branch=yocto-5.10;destsuffix=${KMETA}"
 
-LINUX_VERSION ?= "5.10.96"
+LINUX_VERSION ?= "5.10.99"
 
 LIC_FILES_CHKSUM = "file://COPYING;md5=6bc538ed5bd9a7fc9398086aedcd7e46"
 
diff --git a/meta/recipes-kernel/linux/linux-yocto-tiny_5.10.bb b/meta/recipes-kernel/linux/linux-yocto-tiny_5.10.bb
index 0bde6e5c7f..8e33e703f7 100644
--- a/meta/recipes-kernel/linux/linux-yocto-tiny_5.10.bb
+++ b/meta/recipes-kernel/linux/linux-yocto-tiny_5.10.bb
@@ -6,7 +6,7 @@ KCONFIG_MODE = "--allnoconfig"
 
 require recipes-kernel/linux/linux-yocto.inc
 
-LINUX_VERSION ?= "5.10.96"
+LINUX_VERSION ?= "5.10.99"
 LIC_FILES_CHKSUM = "file://COPYING;md5=6bc538ed5bd9a7fc9398086aedcd7e46"
 
 DEPENDS += "${@bb.utils.contains('ARCH', 'x86', 'elfutils-native', '', d)}"
@@ -15,9 +15,9 @@ DEPENDS += "openssl-native util-linux-native"
 KMETA = "kernel-meta"
 KCONF_BSP_AUDIT_LEVEL = "2"
 
-SRCREV_machine_qemuarm ?= "ca361e2633ab577333303359eb2f7b0040647e5e"
-SRCREV_machine ?= "36f032fc87112de000ca01b6e8a41313d418dcd9"
-SRCREV_meta ?= "0db3f511b2a553a5ea31ac45249a42f084fc287c"
+SRCREV_machine_qemuarm ?= "b7823b6ac25671f8dc5ee2c4cf74af3be88207cf"
+SRCREV_machine ?= "7558a33fc5b60d4327b683c3376c5352cba11ed1"
+SRCREV_meta ?= "a58f4e7cca3973e04d3f9a40356ef9c2c0bb10a5"
 
 PV = "${LINUX_VERSION}+git${SRCPV}"
 
diff --git a/meta/recipes-kernel/linux/linux-yocto_5.10.bb b/meta/recipes-kernel/linux/linux-yocto_5.10.bb
index 64b4ab5879..9c6ba1cb5e 100644
--- a/meta/recipes-kernel/linux/linux-yocto_5.10.bb
+++ b/meta/recipes-kernel/linux/linux-yocto_5.10.bb
@@ -13,17 +13,17 @@ KBRANCH_qemux86  ?= "v5.10/standard/base"
 KBRANCH_qemux86-64 ?= "v5.10/standard/base"
 KBRANCH_qemumips64 ?= "v5.10/standard/mti-malta64"
 
-SRCREV_machine_qemuarm ?= "7ad48434f8e0e848f7fe4891ee7ba670700c36fc"
-SRCREV_machine_qemuarm64 ?= "932cd0e7a66273eba2da54b4ac67e3c6e384e614"
-SRCREV_machine_qemumips ?= "27d7f99a1211d8eca210a84c88a9058772a751a5"
-SRCREV_machine_qemuppc ?= "914396443522268b332c8efe83b3b0306befd1cb"
-SRCREV_machine_qemuriscv64 ?= "74244dd30b3a2415a785d2228ab5abdef4536f03"
-SRCREV_machine_qemuriscv32 ?= "74244dd30b3a2415a785d2228ab5abdef4536f03"
-SRCREV_machine_qemux86 ?= "74244dd30b3a2415a785d2228ab5abdef4536f03"
-SRCREV_machine_qemux86-64 ?= "74244dd30b3a2415a785d2228ab5abdef4536f03"
-SRCREV_machine_qemumips64 ?= "ba30b538c1750a9fe5db275260862c99a5ed356a"
-SRCREV_machine ?= "74244dd30b3a2415a785d2228ab5abdef4536f03"
-SRCREV_meta ?= "0db3f511b2a553a5ea31ac45249a42f084fc287c"
+SRCREV_machine_qemuarm ?= "c3a59bad41cefbe15d6bcde0ec2fe5c7ea28ba2b"
+SRCREV_machine_qemuarm64 ?= "07ca3e3c85445f2c31bd081b27741c9680536168"
+SRCREV_machine_qemumips ?= "10ae40d47f14b3c05dd6506c70576383c5474670"
+SRCREV_machine_qemuppc ?= "bc2a7c884103143e0a4360518247fe01bf2c13d3"
+SRCREV_machine_qemuriscv64 ?= "84f6a75f64961e59d61bf3d70ab17e8bb430386b"
+SRCREV_machine_qemuriscv32 ?= "84f6a75f64961e59d61bf3d70ab17e8bb430386b"
+SRCREV_machine_qemux86 ?= "84f6a75f64961e59d61bf3d70ab17e8bb430386b"
+SRCREV_machine_qemux86-64 ?= "84f6a75f64961e59d61bf3d70ab17e8bb430386b"
+SRCREV_machine_qemumips64 ?= "13998bd0244737548a21a17d1969ca65af0712b1"
+SRCREV_machine ?= "84f6a75f64961e59d61bf3d70ab17e8bb430386b"
+SRCREV_meta ?= "a58f4e7cca3973e04d3f9a40356ef9c2c0bb10a5"
 
 # remap qemuarm to qemuarma15 for the 5.8 kernel
 # KMACHINE_qemuarm ?= "qemuarma15"
@@ -32,7 +32,7 @@ SRC_URI = "git://git.yoctoproject.org/linux-yocto.git;name=machine;branch=${KBRA
            git://git.yoctoproject.org/yocto-kernel-cache;type=kmeta;name=meta;branch=yocto-5.10;destsuffix=${KMETA}"
 
 LIC_FILES_CHKSUM = "file://COPYING;md5=6bc538ed5bd9a7fc9398086aedcd7e46"
-LINUX_VERSION ?= "5.10.96"
+LINUX_VERSION ?= "5.10.99"
 
 DEPENDS += "${@bb.utils.contains('ARCH', 'x86', 'elfutils-native', '', d)}"
 DEPENDS += "openssl-native util-linux-native"
-- 
2.35.1


