Return-Path: <anuj.mittal@intel.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 7CEF7C433FE
	for <webhook@archiver.kernel.org>; Wed, 27 Oct 2021 15:17:45 +0000 (UTC)
Received: from mga14.intel.com (mga14.intel.com [192.55.52.115])
 by mx.groups.io with SMTP id smtpd.web10.13304.1635347862317087601
 for <openembedded-core@lists.openembedded.org>;
 Wed, 27 Oct 2021 08:17:45 -0700
Authentication-Results: mx.groups.io;
 dkim=missing;
 spf=pass (domain: intel.com, ip: 192.55.52.115, mailfrom: anuj.mittal@intel.com)
X-IronPort-AV: E=McAfee;i="6200,9189,10150"; a="230456899"
X-IronPort-AV: E=Sophos;i="5.87,187,1631602800";
   d="scan'208";a="230456899"
Received: from fmsmga008.fm.intel.com ([10.253.24.58])
  by fmsmga103.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 27 Oct 2021 08:17:44 -0700
X-IronPort-AV: E=Sophos;i="5.87,187,1631602800";
   d="scan'208";a="537617263"
Received: from hchai4-mobl2.gar.corp.intel.com (HELO
 anmitta2-mobl1.gar.corp.intel.com) ([10.215.231.47])
  by fmsmga008-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 27 Oct 2021 08:17:42 -0700
From: Anuj Mittal <anuj.mittal@intel.com>
To: openembedded-core@lists.openembedded.org
Subject: [hardknott][PATCH 32/36] linux-yocto/5.10: update to v5.10.70
Date: Wed, 27 Oct 2021 23:16:40 +0800
Message-Id: 
 <fe13e284633ed191ab924af7b888b69e7663c38f.1635347406.git.anuj.mittal@intel.com>
X-Mailer: git-send-email 2.31.1
In-Reply-To: <cover.1635347406.git.anuj.mittal@intel.com>
References: <cover.1635347406.git.anuj.mittal@intel.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Wed, 27 Oct 2021 15:17:45 -0000
X-Groupsio-URL: 
 https://lists.openembedded.org/g/openembedded-core/message/157547

From: Bruce Ashfield <bruce.ashfield@gmail.com>

Updating linux-yocto/5.10 to the latest korg -stable release that comprises
the following commits:

    f93026b28e2a Linux 5.10.70
    59094296058d qnx4: work around gcc false positive warning bug
    35c0dfbbd344 xen/balloon: fix balloon kthread freezing
    8373d58c89be USB: serial: cp210x: fix dropped characters with CP2102
    67cdb51ab5e2 thermal/drivers/int340x: Do not set a wrong tcc offset on resume
    cc71740ee4d4 EDAC/dmc520: Assign the proper type to dimm->edac_mode
    9afad85a43f5 EDAC/synopsys: Fix wrong value type assignment for edac_mode
    db76cb05c046 spi: Fix tegra20 build with CONFIG_PM=n
    890e25c424ea net: 6pack: Fix tx timeout and slot time
    044513c1fada alpha: Declare virt_to_phys and virt_to_bus parameter as pointer to volatile
    0a511ba6d2a7 arm64: Mark __stack_chk_guard as __ro_after_init
    fec3bd622db0 parisc: Use absolute_pointer() to define PAGE0
    61454e7fd624 qnx4: avoid stringop-overread errors
    5520d27f02a1 sparc: avoid stringop-overread errors
    8d768beaf0ef net: i825xx: Use absolute_pointer for memcpy from fixed memory location
    e99f9032715e compiler.h: Introduce absolute_pointer macro
    f58d305887ad blk-cgroup: fix UAF by grabbing blkcg lock before destroying blkg pd
    1ef68b84bc11 block: flush the integrity workqueue in blk_integrity_unregister
    1963bdb7489c block: check if a profile is actually registered in blk_integrity_unregister
    526261c1b706 amd/display: downgrade validation failure log level
    54a4860c6257 sparc32: page align size in arch_dma_alloc
    ecf0dc5a9048 nvme-rdma: destroy cm id before destroy qp to avoid use after free
    2a08960577af nvme-multipath: fix ANA state updates when a namespace is not present
    372d3e6ea1e1 xen/balloon: use a kernel thread instead a workqueue
    6345a0bee801 bpf: Add oversize check before call kvcalloc()
    e567d33508a9 cpufreq: intel_pstate: Override parameters if HWP forced by BIOS
    9561bb98879e ipv6: delay fib6_sernum increase in fib6_add
    31df1d037cfd m68k: Double cast io functions to unsigned long
    cc3dd119d3cf blk-mq: avoid to iterate over stale request
    de7e03003367 net: stmmac: allow CSR clock of 300MHz
    7721221e87d2 net: macb: fix use after free on rmmod
    a632288053b7 net: phylink: Update SFP selected interface on advertising changes
    3815fe7371d2 blktrace: Fix uaf in blk_trace access after removing by sysfs
    ce092350b452 io_uring: put provided buffer meta data under memcg accounting
    7040b37a9630 x86/asm: Fix SETZ size enqcmds() build failure
    54e85b6c287c x86/asm: Add a missing __iomem annotation in enqcmds()
    b18ba3f477a2 md: fix a lock order reversal in md_alloc
    568662e37f92 irqchip/gic-v3-its: Fix potential VPE leak on error
    af7c9ffe2bee irqchip/goldfish-pic: Select GENERIC_IRQ_CHIP to fix build
    0595fc4794c3 scsi: lpfc: Use correct scnprintf() limit
    cb948b158a86 scsi: qla2xxx: Restore initiator in dual mode
    3d42ed6b7905 cifs: fix a sign extension bug
    8cba4c2698e2 thermal/core: Potential buffer overflow in thermal_build_list_of_policies()
    215df4349916 nvme: keep ctrl->namespaces ordered
    55e6f8b3c0f5 treewide: Change list_sort to use const pointers
    419fab1cb086 nvme-tcp: fix incorrect h2cdata pdu offset accounting
    c6ecdcba9da3 fpga: machxo2-spi: Fix missing error code in machxo2_write_complete()
    5c6bfde245d8 fpga: machxo2-spi: Return an error on failure
    4ea4925c70fd tty: synclink_gt: rename a conflicting function name
    56a8f0b18f46 tty: synclink_gt, drop unneeded forward declarations
    c64e6c307a76 scsi: target: Fix the pgr/alua_support_store functions
    2d0305425179 scsi: iscsi: Adjust iface sysfs attr detection
    0032f8b3cf2a atlantic: Fix issue in the pm resume flow.
    c2598bce4152 net/mlx4_en: Don't allow aRFS for encapsulated packets
    b4e54f5f4288 qed: rdma - don't wait for resources under hw error recovery flow
    1bba406c07b3 gpio: uniphier: Fix void functions to remove return value
    db94f89e1dad s390/qeth: fix NULL deref in qeth_clear_working_pool_list()
    3aa50241e1ed kselftest/arm64: signal: Skip tests if required features are missing
    91d4da33c367 kselftest/arm64: signal: Add SVE to the set of features we can check for
    2eaa39d83e30 net: dsa: realtek: register the MDIO bus under devres
    43c880b860c7 net: dsa: don't allocate the slave_mii_bus using devres
    b4561bd29e62 net/smc: fix 'workqueue leaked lock' in smc_conn_abort_work
    8a00c832ef88 net/smc: add missing error check in smc_clc_prfx_set()
    4e0fd1d79534 net: hns3: check queue id range before using
    ca435999bcaf net: hns3: fix change RSS 'hfunc' ineffective issue
    1365a0dc5596 bnxt_en: Fix TX timeout when TX ring size is set to the smallest
    d5afe3cf52e5 enetc: Fix uninitialized struct dim_sample field usage
    6c3f1b741c6c enetc: Fix illegal access when reading affinity_hint
    117661cb9d3a platform/x86/intel: punit_ipc: Drop wrong use of ACPI_PTR()
    22538c1bde27 afs: Fix updating of i_blocks on file/dir extension
    55352944b497 afs: Fix incorrect triggering of sillyrename on 3rd-party invalidation
    8d6a21e4cd6a comedi: Fix memory leak in compat_insnlist()
    43241a6c6e6c net: hso: fix muxed tty registration
    68d4fbe6220c drm/amd/pm: Update intermediate power state for SI
    7dc9225fcde0 scsi: sd_zbc: Ensure buffer size is aligned to SECTOR_SIZE
    3dfffcd26029 serial: mvebu-uart: fix driver's tx_empty callback
    640946fc56b8 serial: 8250: 8250_omap: Fix RX_LVL register offset
    0ea9ac731a31 xhci: Set HCD flag to defer primary roothub registration
    80af86c12290 btrfs: prevent __btrfs_dump_space_info() to underflow its free space
    8326be9e5121 erofs: fix up erofs_lookup tracepoint
    91e4ad05bf18 mcb: fix error handling in mcb_alloc_bus()
    2c28bb016bed USB: serial: option: add device id for Foxconn T99W265
    600b19610ad4 USB: serial: option: remove duplicate USB device ID
    0daf57973ff0 USB: serial: option: add Telit LN920 compositions
    dc131d3f1335 USB: serial: mos7840: remove duplicated 0xac24 device ID
    d58fc9e9c158 usb: core: hcd: Add support for deferring roothub registration
    996f7c4a1fcf usb: dwc3: core: balance phy init and exit
    a05ff800013e Re-enable UAS for LaCie Rugged USB3-FW with fk quirk
    b9e697e60ce9 staging: greybus: uart: fix tty use after free
    d5b0473707fa binder: make sure fd closes complete
    302e60e26ad5 Revert "USB: bcma: Add a check for devm_gpiod_get"
    b33b3db476e6 USB: cdc-acm: fix minor-number release
    0809b8576fa8 USB: serial: cp210x: add ID for GW Instek GDM-834x Digital Multimeter
    a34d6ef0c71a usb-storage: Add quirk for ScanLogic SL11R-IDE older than 2.6c
    f79282849187 xen/x86: fix PV trap handling on secondary processors
    93028da5e92d cifs: fix incorrect check for null pointer in header_assemble
    5940e22528df usb: musb: tusb6010: uninitialized data in tusb_fifo_write_unaligned()
    d071c7fd45dc usb: dwc2: gadget: Fix ISOC transfer complete handling for DDMA
    5f4bfac26173 usb: dwc2: gadget: Fix ISOC flow for BDMA and Slave
    1fbd7eb385c3 usb: gadget: r8a66597: fix a loop in set_feature()
    838297222b2b mm: fix uninitialized use in overcommit_policy_handler
    437be4d6faed ocfs2: drop acl cache for directories too
    31bd6cd06a18 PCI: aardvark: Increase polling delay to 1.5s while waiting for PIO response

Signed-off-by: Bruce Ashfield <bruce.ashfield@gmail.com>
Signed-off-by: Richard Purdie <richard.purdie@linuxfoundation.org>
(cherry picked from commit 3306240202254ba8ddcd2604f852a65888b4078a)
Signed-off-by: Anuj Mittal <anuj.mittal@intel.com>
---
 .../linux/linux-yocto-rt_5.10.bb              |  6 ++---
 .../linux/linux-yocto-tiny_5.10.bb            |  8 +++----
 meta/recipes-kernel/linux/linux-yocto_5.10.bb | 24 +++++++++----------
 3 files changed, 19 insertions(+), 19 deletions(-)

diff --git a/meta/recipes-kernel/linux/linux-yocto-rt_5.10.bb b/meta/recipes-kernel/linux/linux-yocto-rt_5.10.bb
index 9a1de7744b..7f3af89adb 100644
--- a/meta/recipes-kernel/linux/linux-yocto-rt_5.10.bb
+++ b/meta/recipes-kernel/linux/linux-yocto-rt_5.10.bb
@@ -11,13 +11,13 @@ python () {
         raise bb.parse.SkipRecipe("Set PREFERRED_PROVIDER_virtual/kernel to linux-yocto-rt to enable it")
 }
 
-SRCREV_machine ?= "eacfb1f85fa42b93fa7404db6e92f64755ab413b"
-SRCREV_meta ?= "917c420111475e33a26f46a9a2855b973ffffadb"
+SRCREV_machine ?= "42d1c4e85643d634bddd98e5c4d8a9bcc61b3e18"
+SRCREV_meta ?= "f8afd84b117f336477846b9e22178ebefb26c08d"
 
 SRC_URI = "git://git.yoctoproject.org/linux-yocto.git;branch=${KBRANCH};name=machine \
            git://git.yoctoproject.org/yocto-kernel-cache;type=kmeta;name=meta;branch=yocto-5.10;destsuffix=${KMETA}"
 
-LINUX_VERSION ?= "5.10.69"
+LINUX_VERSION ?= "5.10.70"
 
 LIC_FILES_CHKSUM = "file://COPYING;md5=6bc538ed5bd9a7fc9398086aedcd7e46"
 
diff --git a/meta/recipes-kernel/linux/linux-yocto-tiny_5.10.bb b/meta/recipes-kernel/linux/linux-yocto-tiny_5.10.bb
index a4b9d6812e..18787ca13b 100644
--- a/meta/recipes-kernel/linux/linux-yocto-tiny_5.10.bb
+++ b/meta/recipes-kernel/linux/linux-yocto-tiny_5.10.bb
@@ -6,7 +6,7 @@ KCONFIG_MODE = "--allnoconfig"
 
 require recipes-kernel/linux/linux-yocto.inc
 
-LINUX_VERSION ?= "5.10.69"
+LINUX_VERSION ?= "5.10.70"
 LIC_FILES_CHKSUM = "file://COPYING;md5=6bc538ed5bd9a7fc9398086aedcd7e46"
 
 DEPENDS += "${@bb.utils.contains('ARCH', 'x86', 'elfutils-native', '', d)}"
@@ -15,9 +15,9 @@ DEPENDS += "openssl-native util-linux-native"
 KMETA = "kernel-meta"
 KCONF_BSP_AUDIT_LEVEL = "2"
 
-SRCREV_machine_qemuarm ?= "b2766d667c5cad7ba4a9e9aeae3f5eefcb9ebd65"
-SRCREV_machine ?= "18ab4d1dd191b24702819546edf212e08c31a4bd"
-SRCREV_meta ?= "917c420111475e33a26f46a9a2855b973ffffadb"
+SRCREV_machine_qemuarm ?= "71ff272be9e9436f27088fbd494da2de613121ea"
+SRCREV_machine ?= "4d1eeccd06dd8d310b238d6350cb0f7d937f4427"
+SRCREV_meta ?= "f8afd84b117f336477846b9e22178ebefb26c08d"
 
 PV = "${LINUX_VERSION}+git${SRCPV}"
 
diff --git a/meta/recipes-kernel/linux/linux-yocto_5.10.bb b/meta/recipes-kernel/linux/linux-yocto_5.10.bb
index 85401c8908..98e1985cf3 100644
--- a/meta/recipes-kernel/linux/linux-yocto_5.10.bb
+++ b/meta/recipes-kernel/linux/linux-yocto_5.10.bb
@@ -13,17 +13,17 @@ KBRANCH_qemux86  ?= "v5.10/standard/base"
 KBRANCH_qemux86-64 ?= "v5.10/standard/base"
 KBRANCH_qemumips64 ?= "v5.10/standard/mti-malta64"
 
-SRCREV_machine_qemuarm ?= "f0a07ccc216dccb7f0848e9bea2c08477dd6ffd6"
-SRCREV_machine_qemuarm64 ?= "1c230985587271d78518e16b8ab96d3743987e83"
-SRCREV_machine_qemumips ?= "e610948faefc5eb3b4980cc7745fc84e1bb70990"
-SRCREV_machine_qemuppc ?= "6ea059e2da8dfa75043db8ff402a66947c1c9d83"
-SRCREV_machine_qemuriscv64 ?= "a46a7f753466a319b6e95dac76caefaba6358094"
-SRCREV_machine_qemuriscv32 ?= "a46a7f753466a319b6e95dac76caefaba6358094"
-SRCREV_machine_qemux86 ?= "a46a7f753466a319b6e95dac76caefaba6358094"
-SRCREV_machine_qemux86-64 ?= "a46a7f753466a319b6e95dac76caefaba6358094"
-SRCREV_machine_qemumips64 ?= "fd474c7b135e4f11af56a159ab8944610674eae8"
-SRCREV_machine ?= "a46a7f753466a319b6e95dac76caefaba6358094"
-SRCREV_meta ?= "917c420111475e33a26f46a9a2855b973ffffadb"
+SRCREV_machine_qemuarm ?= "011882741f10bd0c725139baa383eb5a4d833bca"
+SRCREV_machine_qemuarm64 ?= "098464b7c0c3d6f2a5b9226aab3245c3fcfb4797"
+SRCREV_machine_qemumips ?= "88494c005ab76864e706097056557b5616da65c6"
+SRCREV_machine_qemuppc ?= "a2b9c27f431a20ebfcd4146971c9422f4216aa90"
+SRCREV_machine_qemuriscv64 ?= "7dda2a9f69de7f80e572d38236896e97be79f39d"
+SRCREV_machine_qemuriscv32 ?= "7dda2a9f69de7f80e572d38236896e97be79f39d"
+SRCREV_machine_qemux86 ?= "7dda2a9f69de7f80e572d38236896e97be79f39d"
+SRCREV_machine_qemux86-64 ?= "7dda2a9f69de7f80e572d38236896e97be79f39d"
+SRCREV_machine_qemumips64 ?= "80da62cff32617711767cd6b01f64f1dc14f94d8"
+SRCREV_machine ?= "7dda2a9f69de7f80e572d38236896e97be79f39d"
+SRCREV_meta ?= "f8afd84b117f336477846b9e22178ebefb26c08d"
 
 # remap qemuarm to qemuarma15 for the 5.8 kernel
 # KMACHINE_qemuarm ?= "qemuarma15"
@@ -32,7 +32,7 @@ SRC_URI = "git://git.yoctoproject.org/linux-yocto.git;name=machine;branch=${KBRA
            git://git.yoctoproject.org/yocto-kernel-cache;type=kmeta;name=meta;branch=yocto-5.10;destsuffix=${KMETA}"
 
 LIC_FILES_CHKSUM = "file://COPYING;md5=6bc538ed5bd9a7fc9398086aedcd7e46"
-LINUX_VERSION ?= "5.10.69"
+LINUX_VERSION ?= "5.10.70"
 
 DEPENDS += "${@bb.utils.contains('ARCH', 'x86', 'elfutils-native', '', d)}"
 DEPENDS += "openssl-native util-linux-native"
-- 
2.31.1


