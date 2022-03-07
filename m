Return-Path: <anuj.mittal@intel.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 11226C433EF
	for <webhook@archiver.kernel.org>; Mon,  7 Mar 2022 14:14:10 +0000 (UTC)
Received: from mga06.intel.com (mga06.intel.com [134.134.136.31])
 by mx.groups.io with SMTP id smtpd.web10.26624.1646662445881657083
 for <openembedded-core@lists.openembedded.org>;
 Mon, 07 Mar 2022 06:14:08 -0800
Authentication-Results: mx.groups.io;
 dkim=fail reason="unable to parse pub key" header.i=@intel.com header.s=intel
 header.b=DMpIBprq;
 spf=pass (domain: intel.com, ip: 134.134.136.31,
 mailfrom: anuj.mittal@intel.com)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1646662448; x=1678198448;
  h=from:to:subject:date:message-id:in-reply-to:references:
   mime-version:content-transfer-encoding;
  bh=Nh8cko4F0iaxg04uErxU+ZNtUmSbrJOSg3iFB70UsVo=;
  b=DMpIBprqJGopAHHo8IMqhB7/RBeSSjnsb9dqB2BCbjOyCOzLjk/vRQEa
   x8I2bEUiIoOLFXIVb1sZ6IV3WwU2VimiXv38tKhJpYw7FwLqkezqa8GUB
   O1PWea3H94oXD3MtL5Y2BdTByMSvy42WfBJ58t315+Jp/ViCB1pzh3yA+
   3EZ2QaeMBVBinP3c2yKDx0Q/ndVBhI1vSYuTEYTJz97TgTrlvrSWxhOXo
   5iAqIQlmqhCyp488tVPw9o1ioQYKP80RhPNlh82PeSMfoUGe1ksCVtFl7
   LomsnyvTiET01Vjkgv8GRJ0iPu/K7tVOURIovtbz8rRweOZWRR55xP1mn
   w==;
X-IronPort-AV: E=McAfee;i="6200,9189,10278"; a="315112594"
X-IronPort-AV: E=Sophos;i="5.90,162,1643702400";
   d="scan'208";a="315112594"
Received: from orsmga003.jf.intel.com ([10.7.209.27])
  by orsmga104.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 07 Mar 2022 06:10:41 -0800
X-IronPort-AV: E=Sophos;i="5.90,162,1643702400";
   d="scan'208";a="495070936"
Received: from hmohdnox-mobl.gar.corp.intel.com (HELO
 anmitta2-mobl3.intel.com) ([10.215.227.91])
  by orsmga003-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 07 Mar 2022 06:10:40 -0800
From: Anuj Mittal <anuj.mittal@intel.com>
To: openembedded-core@lists.openembedded.org
Subject: [honister][PATCH 22/25] linux-yocto/5.10: update to v5.10.101
Date: Mon,  7 Mar 2022 22:09:58 +0800
Message-Id: 
 <e55a5910221ec8d7f6257bd5f15dbb326d9685ea.1646661615.git.anuj.mittal@intel.com>
X-Mailer: git-send-email 2.35.1
In-Reply-To: <cover.1646661615.git.anuj.mittal@intel.com>
References: <cover.1646661615.git.anuj.mittal@intel.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Mon, 07 Mar 2022 14:14:10 -0000
X-Groupsio-URL: 
 https://lists.openembedded.org/g/openembedded-core/message/162843

From: Bruce Ashfield <bruce.ashfield@gmail.com>

Updating linux-yocto/5.10 to the latest korg -stable release that comprises
the following commits:

    3969aba589d6 Linux 5.10.101
    cb86e511e78e iommu: Fix potential use-after-free during probe
    f6b5d51976fc perf: Fix list corruption in perf_cgroup_switch()
    ce3ca12c632a arm64: dts: imx8mq: fix lcdif port node
    759aeacdfe70 scsi: lpfc: Reduce log messages seen after firmware download
    57c5d7d42076 scsi: lpfc: Remove NVMe support if kernel has NVME_FC disabled
    199dab00f043 can: isotp: fix error path in isotp_sendmsg() to unlock wait queue
    3b10ebeb95d7 Makefile.extrawarn: Move -Wunaligned-access to W=1
    ad53060bdfc3 hwmon: (dell-smm) Speed up setting of fan speed
    3c75d1017cb3 phy: ti: Fix missing sentinel for clk_div_table
    6eabe53492c2 speakup-dectlk: Restore pitch setting
    3836a5ff4bb7 USB: serial: cp210x: add CPI Bulk Coin Recycler id
    51b03a9bcd99 USB: serial: cp210x: add NCR Retail IO box id
    a21e6b2e0864 USB: serial: ch341: add support for GW Instek USB2.0-Serial devices
    7113440a36c7 USB: serial: option: add ZTE MF286D modem
    b7ed2f9619cc USB: serial: ftdi_sio: add support for Brainboxes US-159/235/320
    e07dde31acc9 usb: raw-gadget: fix handling of dual-direction-capable endpoints
    e9f9b877eb0e usb: gadget: f_uac2: Define specific wTerminalType
    fb4ff0f96de3 usb: gadget: rndis: check size of RNDIS_MSG_SET command
    22ec10047285 USB: gadget: validate interface OS descriptor requests
    351159167cd8 usb: gadget: udc: renesas_usb3: Fix host to USB_ROLE_NONE transition
    3bfca3891480 usb: dwc3: gadget: Prevent core from processing stale TRBs
    2a17bd9f5210 usb: ulpi: Call of_node_put correctly
    8b89a6916681 usb: ulpi: Move of_node_put to ulpi_dev_release
    758290defe93 net: usb: ax88179_178a: Fix out-of-bounds accesses in RX fixup
    a66a2b17b8c8 Revert "usb: dwc2: drd: fix soft connect when gadget is unconfigured"
    73961057e9dc usb: dwc2: drd: fix soft connect when gadget is unconfigured
    a37960df7eac eeprom: ee1004: limit i2c reads to I2C_SMBUS_BLOCK_MAX
    1b99fe34e26d n_tty: wake up poll(POLLRDNORM) on receiving data
    f1b25737156c vt_ioctl: add array_index_nospec to VT_ACTIVATE
    778302ca0949 vt_ioctl: fix array_index_nospec in vt_setactivate
    22249886dc5b net: dsa: mv88e6xxx: fix use-after-free in mv88e6xxx_mdios_unregister
    3a3c65c487a4 net: mscc: ocelot: fix mutex lock error during ethtool stats read
    809f030745b2 ice: fix IPIP and SIT TSO offload
    cf11949b9163 ice: fix an error code in ice_cfg_phy_fec()
    f8edc6feab4d dpaa2-eth: unregister the netdev before disconnecting from the PHY
    ff6c9e0fcee5 net: amd-xgbe: disable interrupts during pci removal
    657aea782887 tipc: rate limit warning for received illegal binding update
    ef5cdae8bc00 net: mdio: aspeed: Add missing MODULE_DEVICE_TABLE
    bf99c144360d veth: fix races around rq->rx_notify_masked
    00e6d6c3bc14 net: fix a memleak when uncloning an skb dst and its metadata
    2e9fd2d0f69e net: do not keep the dst cache when uncloning an skb dst and its metadata
    0bae953d7ab5 nfp: flower: fix ida_idx not being released
    09ac0fcb0a82 ipmr,ip6mr: acquire RTNL before calling ip[6]mr_free_table() on failure path
    e177d2e85ebc net: dsa: lantiq_gswip: don't use devres for mdiobus
    95e5402f9430 net: dsa: felix: don't use devres for mdiobus
    2770b795294e net: dsa: bcm_sf2: don't use devres for mdiobus
    475ce5dcf2d8 net: dsa: ar9331: register the mdiobus under devres
    8ccebe77df6e net: dsa: mv88e6xxx: don't use devres for mdiobus
    4a384c1e4058 bonding: pair enable_port with slave_arr_updates
    1ba45dd32667 gpio: sifive: use the correct register to read output values
    48e413087de1 ACPI: PM: s2idle: Cancel wakeup before dispatching EC GPE
    3b72d3f0205e drm/panel: simple: Assign data from panel_dpi_probe() correctly
    bf35639192ed ixgbevf: Require large buffers for build_skb on 82599VF
    e5a64f548a45 arm64: dts: meson-g12b-odroid-n2: fix typo 'dio2133'
    04fe6569a7cf netfilter: ctnetlink: disable helper autoassign
    a5ce7ee5fcc0 misc: fastrpc: avoid double fput() on failed usercopy
    21c890ca8eae drm/vc4: hdmi: Allow DBLCLK modes even if horz timing is odd.
    70ea005626a9 gpio: aggregator: Fix calling into sleeping GPIO controllers
    0042178a69eb usb: f_fs: Fix use-after-free for epfile
    5a37fd9fdcce ARM: dts: imx7ulp: Fix 'assigned-clocks-parents' typo
    39bf132a6ed5 phy: xilinx: zynqmp: Fix bus width setting for SGMII
    108868dae2ee ARM: dts: imx6qdl-udoo: Properly describe the SD card detect
    0a7b5e8d8c1e staging: fbtft: Fix error path in fbtft_driver_module_init()
    74cd5cb2190f ARM: dts: meson8b: Fix the UART device-tree schema validation
    566b558e9429 ARM: dts: meson8: Fix the UART device-tree schema validation
    210d70f08100 ARM: dts: meson: Fix the UART compatible strings
    88f0e61354f4 ARM: dts: Fix timer regression for beagleboard revision c
    c943a297ec3c drm/rockchip: vop: Correct RK3399 VOP register fields
    a941384fba3f PM: s2idle: ACPI: Fix wakeup interrupts handling
    fcbac51a64d3 ACPI/IORT: Check node revision for PMCG resources
    57ede0ce6500 nvme-tcp: fix bogus request completion when failing to send AER
    3a669d77e5b3 ARM: socfpga: fix missing RESET_CONTROLLER
    435e62d5666a ARM: dts: Fix boot regression on Skomer
    b217b89e607c ARM: dts: imx23-evk: Remove MX23_PAD_SSP1_DETECT from hog group
    3f9843f2f65e riscv: fix build with binutils 2.38
    3aa5c8657292 KVM: VMX: Set vmcs.PENDING_DBG.BS on #DB in STI/MOVSS blocking shadow
    bd39fe29bbbb KVM: SVM: Don't kill SEV guest if SMAP erratum triggers in usermode
    9efad4cb0365 KVM: nVMX: Also filter MSR_IA32_VMX_TRUE_PINBASED_CTLS when eVMCS
    db58a3d978b4 KVM: nVMX: eVMCS: Filter out VM_EXIT_SAVE_VMX_PREEMPTION_TIMER
    dc129275a7f7 KVM: eventfd: Fix false positive RCU usage warning
    87bbd78a2cd1 net: stmmac: dwmac-sun8i: use return val of readl_poll_timeout()
    c9b8cc1046f0 nvme-pci: add the IGNORE_DEV_SUBNQN quirk for Intel P4500/P4600 SSDs
    d0774cf73056 perf: Always wake the parent event
    a117e986e9cc usb: dwc2: gadget: don't try to disable ep0 in dwc2_hsotg_suspend
    4607218fde84 PM: hibernate: Remove register_nosave_region_late()
    0e42c4a3d732 scsi: myrs: Fix crash in error case
    3bc5b128b9a2 scsi: ufs: Treat link loss as fatal error
    12cf1208035d scsi: pm8001: Fix bogus FW crash for maxcpus=1
    87f187e5265b scsi: qedf: Fix refcount issue when LOGO is received during TMF
    aa7352aa155e scsi: qedf: Add stag_work to all the vports
    150d448c663d scsi: ufs: ufshcd-pltfrm: Check the return value of devm_kstrdup()
    7dbda616fc64 scsi: target: iscsi: Make sure the np under each tpg is unique
    67baac10dd5a powerpc/fixmap: Fix VM debug warning on unmap
    3d0eafd459b2 net: sched: Clarify error message when qdisc kind is unknown
    9b569faabd22 drm: panel-orientation-quirks: Add quirk for the 1Netbook OneXPlayer
    0d6b9d15ecb4 x86/perf: Avoid warning for Arch LBR without XSAVE
    b37dd03f2fc6 NFSv4 handle port presence in fs_location server string
    6f2974b52b15 NFSv4 expose nfs_parse_server_name function
    5a9c613a29e7 NFSv4 remove zero number of fs_locations entries error check
    1c79aad1186b NFSv4.1: Fix uninitialised variable in devicenotify
    c5619c510f04 nfs: nfs4clinet: check the return value of kstrdup()
    db053bdece3a NFSv4 only print the label when its queried
    e2b4435fd340 NFS: change nfs_access_get_cached to only report the mask
    b4e0c9bcf142 tracing: Propagate is_signed to expression
    5234de6c7975 drm/amdgpu: Set a suitable dev_info.gart_page_size
    6215fb455893 NFSD: Fix offset type in I/O trace points
    3a6a2d43e32a NFSD: Clamp WRITE offsets
    c72f7c2ec3d4 NFS: Fix initialisation of nfs_client cl_flags field
    f47ee3a35ffb net: phy: marvell: Fix MDI-x polarity setting in 88e1118-compatible PHYs
    6a33aa711327 net: phy: marvell: Fix RGMII Tx/Rx delays setting in 88e1121-compatible PHYs
    7b53d2204ce7 can: isotp: fix potential CAN frame reception race in isotp_rcv()
    c9cc027c55bb mmc: sdhci-of-esdhc: Check for error num after setting mask
    8027ba480c00 ima: Do not print policy rule with inactive LSM labels
    8171c8a99fea ima: Allow template selection with ima_template[_fmt]= after ima_hash=
    0795b7100d25 ima: Remove ima_policy file before directory
    7fea2e520003 integrity: check the return value of audit_log_start()
    d4f7d322a4ad Linux 5.10.100
    3c7e59435535 tipc: improve size validations for received domain records
    2951d2168976 crypto: api - Move cryptomgr soft dependency into algapi
    b62267b8b06e KVM: s390: Return error on SIDA memop on normal guest
    be93028d306d moxart: fix potential use-after-free on remove path

Signed-off-by: Bruce Ashfield <bruce.ashfield@gmail.com>
Signed-off-by: Richard Purdie <richard.purdie@linuxfoundation.org>
(cherry picked from commit d67621e8f8b4f37e1357f19fc7da2de12de4bee5)
Signed-off-by: Anuj Mittal <anuj.mittal@intel.com>
---
 .../linux/linux-yocto-rt_5.10.bb              |  6 ++---
 .../linux/linux-yocto-tiny_5.10.bb            |  8 +++----
 meta/recipes-kernel/linux/linux-yocto_5.10.bb | 24 +++++++++----------
 3 files changed, 19 insertions(+), 19 deletions(-)

diff --git a/meta/recipes-kernel/linux/linux-yocto-rt_5.10.bb b/meta/recipes-kernel/linux/linux-yocto-rt_5.10.bb
index 5f512016b2..ec4dea033c 100644
--- a/meta/recipes-kernel/linux/linux-yocto-rt_5.10.bb
+++ b/meta/recipes-kernel/linux/linux-yocto-rt_5.10.bb
@@ -11,13 +11,13 @@ python () {
         raise bb.parse.SkipRecipe("Set PREFERRED_PROVIDER_virtual/kernel to linux-yocto-rt to enable it")
 }
 
-SRCREV_machine ?= "e5b266bc6b15dc8852649b7d2a31395195dc7b3a"
-SRCREV_meta ?= "7a012dfacdc82bce2279c26af29cf40b5fdbeed2"
+SRCREV_machine ?= "5c627c3d0740ef68beef456aaf7ef104315a8f7f"
+SRCREV_meta ?= "ff60a2ddb31e54be0f8ac63a28247e58f9c8cd23"
 
 SRC_URI = "git://git.yoctoproject.org/linux-yocto.git;branch=${KBRANCH};name=machine \
            git://git.yoctoproject.org/yocto-kernel-cache;type=kmeta;name=meta;branch=yocto-5.10;destsuffix=${KMETA}"
 
-LINUX_VERSION ?= "5.10.99"
+LINUX_VERSION ?= "5.10.101"
 
 LIC_FILES_CHKSUM = "file://COPYING;md5=6bc538ed5bd9a7fc9398086aedcd7e46"
 
diff --git a/meta/recipes-kernel/linux/linux-yocto-tiny_5.10.bb b/meta/recipes-kernel/linux/linux-yocto-tiny_5.10.bb
index 7a7a13e031..3414c55740 100644
--- a/meta/recipes-kernel/linux/linux-yocto-tiny_5.10.bb
+++ b/meta/recipes-kernel/linux/linux-yocto-tiny_5.10.bb
@@ -6,7 +6,7 @@ KCONFIG_MODE = "--allnoconfig"
 
 require recipes-kernel/linux/linux-yocto.inc
 
-LINUX_VERSION ?= "5.10.99"
+LINUX_VERSION ?= "5.10.101"
 LIC_FILES_CHKSUM = "file://COPYING;md5=6bc538ed5bd9a7fc9398086aedcd7e46"
 
 DEPENDS += "${@bb.utils.contains('ARCH', 'x86', 'elfutils-native', '', d)}"
@@ -15,9 +15,9 @@ DEPENDS += "openssl-native util-linux-native"
 KMETA = "kernel-meta"
 KCONF_BSP_AUDIT_LEVEL = "2"
 
-SRCREV_machine:qemuarm ?= "9a8497a8761a22b3086cab63d18698024a69a410"
-SRCREV_machine ?= "317635e1feaecfd8aa29bc94d8d03ba873190414"
-SRCREV_meta ?= "7a012dfacdc82bce2279c26af29cf40b5fdbeed2"
+SRCREV_machine:qemuarm ?= "ce4e423e88244adab0deef2f9d021b2bf6d492ba"
+SRCREV_machine ?= "cc09c000260f49e35e85a96853dd01404e6aa80a"
+SRCREV_meta ?= "ff60a2ddb31e54be0f8ac63a28247e58f9c8cd23"
 
 PV = "${LINUX_VERSION}+git${SRCPV}"
 
diff --git a/meta/recipes-kernel/linux/linux-yocto_5.10.bb b/meta/recipes-kernel/linux/linux-yocto_5.10.bb
index 130e3286ce..0437274009 100644
--- a/meta/recipes-kernel/linux/linux-yocto_5.10.bb
+++ b/meta/recipes-kernel/linux/linux-yocto_5.10.bb
@@ -13,17 +13,17 @@ KBRANCH:qemux86  ?= "v5.10/standard/base"
 KBRANCH:qemux86-64 ?= "v5.10/standard/base"
 KBRANCH:qemumips64 ?= "v5.10/standard/mti-malta64"
 
-SRCREV_machine:qemuarm ?= "5c9de82973348b40bfdcecc0623f488d9443038e"
-SRCREV_machine:qemuarm64 ?= "8c841836837414c6d07fa08ef8482162760fc27a"
-SRCREV_machine:qemumips ?= "d8287fdfbe460acdd62cf57e351411c992101514"
-SRCREV_machine:qemuppc ?= "f436ec6dd3942a87331abf39805e791460e499ef"
-SRCREV_machine:qemuriscv64 ?= "c0b313d988a16b25c1ee730bfe7393c462ee8a5c"
-SRCREV_machine:qemuriscv32 ?= "c0b313d988a16b25c1ee730bfe7393c462ee8a5c"
-SRCREV_machine:qemux86 ?= "c0b313d988a16b25c1ee730bfe7393c462ee8a5c"
-SRCREV_machine:qemux86-64 ?= "c0b313d988a16b25c1ee730bfe7393c462ee8a5c"
-SRCREV_machine:qemumips64 ?= "ae7887fe8d4da06d2d0d0a5071d09155899de26c"
-SRCREV_machine ?= "c0b313d988a16b25c1ee730bfe7393c462ee8a5c"
-SRCREV_meta ?= "7a012dfacdc82bce2279c26af29cf40b5fdbeed2"
+SRCREV_machine:qemuarm ?= "54d10cbfb44b9449f3962d962c6ec0d2e31017e8"
+SRCREV_machine:qemuarm64 ?= "1048394a0538b9b282c1f36f4de7e4ab814c90bf"
+SRCREV_machine:qemumips ?= "0214a416a56f01fed65e4b7818470139dc2b1286"
+SRCREV_machine:qemuppc ?= "b678c6d8d47e6e67aefa985fea85fe3026f2c809"
+SRCREV_machine:qemuriscv64 ?= "bbec956b3ad71d142c590caf5a2c94cc34d224b6"
+SRCREV_machine:qemuriscv32 ?= "bbec956b3ad71d142c590caf5a2c94cc34d224b6"
+SRCREV_machine:qemux86 ?= "bbec956b3ad71d142c590caf5a2c94cc34d224b6"
+SRCREV_machine:qemux86-64 ?= "bbec956b3ad71d142c590caf5a2c94cc34d224b6"
+SRCREV_machine:qemumips64 ?= "8d571427e05d1a8c7f7b0d32f291941429865ada"
+SRCREV_machine ?= "bbec956b3ad71d142c590caf5a2c94cc34d224b6"
+SRCREV_meta ?= "ff60a2ddb31e54be0f8ac63a28247e58f9c8cd23"
 
 # remap qemuarm to qemuarma15 for the 5.8 kernel
 # KMACHINE:qemuarm ?= "qemuarma15"
@@ -32,7 +32,7 @@ SRC_URI = "git://git.yoctoproject.org/linux-yocto.git;name=machine;branch=${KBRA
            git://git.yoctoproject.org/yocto-kernel-cache;type=kmeta;name=meta;branch=yocto-5.10;destsuffix=${KMETA}"
 
 LIC_FILES_CHKSUM = "file://COPYING;md5=6bc538ed5bd9a7fc9398086aedcd7e46"
-LINUX_VERSION ?= "5.10.99"
+LINUX_VERSION ?= "5.10.101"
 
 DEPENDS += "${@bb.utils.contains('ARCH', 'x86', 'elfutils-native', '', d)}"
 DEPENDS += "openssl-native util-linux-native"
-- 
2.35.1


