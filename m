Return-Path: <bruce.ashfield@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 04256C43217
	for <webhook@archiver.kernel.org>; Wed,  6 Oct 2021 00:12:56 +0000 (UTC)
Received: from mail-qt1-f170.google.com (mail-qt1-f170.google.com
 [209.85.160.170])
 by mx.groups.io with SMTP id smtpd.web12.5013.1633479174784602467
 for <openembedded-core@lists.openembedded.org>;
 Tue, 05 Oct 2021 17:12:55 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20210112 header.b=F7C7dTUy;
 spf=pass (domain: gmail.com, ip: 209.85.160.170,
 mailfrom: bruce.ashfield@gmail.com)
Received: by mail-qt1-f170.google.com with SMTP id e16so876966qts.4
        for <openembedded-core@lists.openembedded.org>;
 Tue, 05 Oct 2021 17:12:54 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:content-transfer-encoding;
        bh=S4MMA5OhMsvn5QWl74V0axGjOu1KmYu/T5XrD4lMJwM=;
        b=F7C7dTUyaE1HtcuSMEi443xKmvb7PrOJmZSC0Jt6E/DDxCGomg4PXrblo1cIC9HYL/
         iw+BiGmjdvZr4zb4tpcUCaoTKfHpMYS5x+3z8vBPosR/mBT5Yy41jsIOD4fvv6TXlrCy
         iQSKcO1LfAfvoZxF7tXyEMqz7hdqb3Ov34e6D0no/thuF/Cdd+OoT9ZuPjqbud1aPjt0
         ZJNneKthlrh2YKe+njBF+OnZI/Qg8/91Vu3PxlkxHyVGfhbAx6VPQZfsMfPKtrpACzUO
         cQqc6/T6teAjLWnSpJGdxvt7l7amtogJNqCrE/kWR9TTx/vtuK+NY9cQELb6XTvfNNhq
         86Nw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=S4MMA5OhMsvn5QWl74V0axGjOu1KmYu/T5XrD4lMJwM=;
        b=pjtK95XCG3nzotdj4PrnrwnmxgvtC+PIsZcOsjI2kDOkM13kLL+yRjy9Bm56NrqQJU
         qanoaUGaMUrfF7dk5rTK7incTxpg/EeqPTa7KC2CYAhYCUkzaXnA2fiUVwbotywZzb0t
         SrzZ35sIcNLu3P51nQoKydjCDnhwi9y3MIvdTOy+bxSe6I9xcE70JPMZ4zNnM+1Q/MUr
         pKhh9L77VmRCkivdq1Ofsh/R0UH/Wq1WU2Pd8Nz4tCOOpdK9Q1piNu4ZXiJvCHXdRtRp
         oygafxmUqA3FD86zcLt0LOcLdPmAO2aFcAvig4DbyVvsm9qnjtVQB3cYgeT7G/n0L2qQ
         nQ7w==
X-Gm-Message-State: AOAM531wBU7OKkTpJ8VtI4/FBpyWSt23ex4MFkuL8ERuIk/6cDz7DS66
	d7bvc+CLAeoKQr3koD3fGiTmEpXbV82C2w==
X-Google-Smtp-Source: 
 ABdhPJxsV3uZDcB7qPR5tpOC41NJQvQlYIdsgAS2oIixGVP02kyLOJUGS3djhc2+Ib42orLmHa7FEg==
X-Received: by 2002:ac8:4357:: with SMTP id a23mr4162973qtn.254.1633479173784;
        Tue, 05 Oct 2021 17:12:53 -0700 (PDT)
Received: from build.lan
 (cpe04d4c4975b80-cmf4c11490699b.cpe.net.cable.rogers.com. [174.112.63.222])
        by smtp.gmail.com with ESMTPSA id
 bk20sm11275922qkb.13.2021.10.05.17.12.52
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 05 Oct 2021 17:12:53 -0700 (PDT)
From: bruce.ashfield@gmail.com
To: richard.purdie@linuxfoundation.org
Cc: openembedded-core@lists.openembedded.org
Subject: [PATCH 6/7] linux-yocto/5.14: update to v5.14.9
Date: Tue,  5 Oct 2021 20:12:45 -0400
Message-Id: 
 <f326acc2b786e29d76960cfe96f58a76b1855e54.1633478971.git.bruce.ashfield@gmail.com>
X-Mailer: git-send-email 2.19.1
In-Reply-To: <cover.1633478971.git.bruce.ashfield@gmail.com>
References: <cover.1633478971.git.bruce.ashfield@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Wed, 06 Oct 2021 00:12:56 -0000
X-Groupsio-URL: 
 https://lists.openembedded.org/g/openembedded-core/message/156666

From: Bruce Ashfield <bruce.ashfield@gmail.com>

Updating linux-yocto/5.14 to the latest korg -stable release that comprises
the following commits:

    70248e7b378b Linux 5.14.9
    f6fceb4e9ce6 usb: gadget: f_uac2: Populate SS descriptors' wBytesPerInterval
    007574d6ac26 usb: gadget: f_uac2: Add missing companion descriptor for feedback EP
    d401d7d2f5c8 nvmet: fix a width vs precision bug in nvmet_subsys_attr_serial_show()
    958c616efce3 qnx4: work around gcc false positive warning bug
    f67f85ec19fa xen/balloon: fix balloon kthread freezing
    8ea750370cd6 software node: balance refcount for managed software nodes
    62a27861b4ea USB: serial: cp210x: fix dropped characters with CP2102
    7b389ef53115 arm64: add MTE supported check to thread switching and syscall entry/exit
    338db6ec41ca irqchip/armada-370-xp: Fix ack/eoi breakage
    8467f200fd38 thermal/drivers/int340x: Do not set a wrong tcc offset on resume
    fe5eaf1cdf9c x86/setup: Call early_reserve_memory() earlier
    5111b05125bd EDAC/dmc520: Assign the proper type to dimm->edac_mode
    845350d4e34b EDAC/synopsys: Fix wrong value type assignment for edac_mode
    ef8eac0c61d7 Revert drm/vc4 hdmi runtime PM changes
    8aef50b390c4 libperf evsel: Make use of FD robust.
    5f35f78ead51 spi: Fix tegra20 build with CONFIG_PM=n
    9367a8fbd9d9 net: 6pack: Fix tx timeout and slot time
    501b0fa2f7f2 alpha: Declare virt_to_phys and virt_to_bus parameter as pointer to volatile
    95d6bf1d19fd arm64: Mark __stack_chk_guard as __ro_after_init
    28f2eee9fc03 amd/display: enable panel orientation quirks
    fca67e1c4b8c drm/amd/display: Link training retry fix for abort case
    76438685048a drm/amd/display: Fix unstable HPCP compliance on Chrome Barcelo
    b58ffd21ec45 drm/amdkfd: make needs_pcie_atomics FW-version dependent
    47c6e796abe4 parisc: Use absolute_pointer() to define PAGE0
    01452e3c727e qnx4: avoid stringop-overread errors
    dd24b4ba2d8d sparc: avoid stringop-overread errors
    32f93161620a net: i825xx: Use absolute_pointer for memcpy from fixed memory location
    eb136917b022 compiler.h: Introduce absolute_pointer macro
    7c2c69e01043 blk-cgroup: fix UAF by grabbing blkcg lock before destroying blkg pd
    a5067abc52ef block: flush the integrity workqueue in blk_integrity_unregister
    282aed19c590 block: check if a profile is actually registered in blk_integrity_unregister
    e7f8b507fe58 drm/ttm: fix type mismatch error on sparc64
    2b60676ac850 amd/display: downgrade validation failure log level
    5780971d7dbd sparc32: page align size in arch_dma_alloc
    d268a182c56e nvme-rdma: destroy cm id before destroy qp to avoid use after free
    e0b9644a4903 nvme-multipath: fix ANA state updates when a namespace is not present
    922fd5b6bb13 xen/balloon: use a kernel thread instead a workqueue
    b5fe7cdfee59 bpf: Add oversize check before call kvcalloc()
    ded7d5c44d8a cpufreq: intel_pstate: Override parameters if HWP forced by BIOS
    de4afec2d294 dma-debug: prevent an error message from causing runtime problems
    4a23ae2c6a60 ipv6: delay fib6_sernum increase in fib6_add
    88ad6f3803ca m68k: Double cast io functions to unsigned long
    5cee359945e0 blk-mq: avoid to iterate over stale request
    cde9ad77f20b net: stmmac: allow CSR clock of 300MHz
    4ad6f2d23b0f net: macb: fix use after free on rmmod
    b7646fadde06 net: phylink: Update SFP selected interface on advertising changes
    a5f8e8619261 blktrace: Fix uaf in blk_trace access after removing by sysfs
    2f6caa538735 io_uring: don't punt files update to io-wq unconditionally
    05ac8e4c8aec io_uring: put provided buffer meta data under memcg accounting
    24d38dcce407 io_uring: fix missing set of EPOLLONESHOT for CQ ring overflow
    4e81f12cc00c io_uring: fix race between poll completion and cancel_hash insertion
    6724710fd8d4 x86/asm: Fix SETZ size enqcmds() build failure
    a46d5e3603bd md: fix a lock order reversal in md_alloc
    e0c1c2e5da19 irqchip/gic-v3-its: Fix potential VPE leak on error
    546886700105 irqchip/goldfish-pic: Select GENERIC_IRQ_CHIP to fix build
    329cb72b3241 scsi: lpfc: Use correct scnprintf() limit
    f56250ae28af scsi: qla2xxx: Restore initiator in dual mode
    e607120e15b0 scsi: ufs: core: Unbreak the reset handler
    1d65bff00936 scsi: ufs: Retry aborted SCSI commands instead of completing these successfully
    4368d7a1aa0f scsi: ufs: Revert "Utilize Transfer Request List Completion Notification Register"
    1fc9119eda5b scsi: sd_zbc: Support disks with more than 2**32 logical blocks
    309c4b00c687 cifs: fix a sign extension bug
    a5024c719888 thermal/core: Potential buffer overflow in thermal_build_list_of_policies()
    ed1e0252111b nvme: keep ctrl->namespaces ordered
    08a14a654f4f nvme-tcp: fix incorrect h2cdata pdu offset accounting
    8cd1ae341b22 x86/fault: Fix wrong signal when vsyscall fails with pkey
    bfacc1de136d fpga: machxo2-spi: Fix missing error code in machxo2_write_complete()
    674fd6adbfbf fpga: machxo2-spi: Return an error on failure
    0ee0fbc2a3c0 tty: synclink_gt: rename a conflicting function name
    8cbf9ac9941f scsi: target: Fix the pgr/alua_support_store functions
    0c1b2c0d1c1e scsi: iscsi: Adjust iface sysfs attr detection
    c7da1781a6ad drm/amdkfd: fix dma mapping leaking warning
    bb8078d3a778 drm/amdkfd: map SVM range with correct access permission
    80ec71bd37d4 atlantic: Fix issue in the pm resume flow.
    d0a3a062c91f net/mlx4_en: Don't allow aRFS for encapsulated packets
    6909a55ce459 net: mscc: ocelot: fix forwarding from BLOCKING ports remaining enabled
    6081c82c2ff8 net: ethernet: mtk_eth_soc: avoid creating duplicate offload entries
    339440b11728 nfc: st-nci: Add SPI ID matching DT compatible
    741760fa6252 nexthop: Fix memory leaks in nexthop notification chain listeners
    f8ff625a8082 mptcp: ensure tx skbs always have the MPTCP ext
    3d6374d5c386 qed: rdma - don't wait for resources under hw error recovery flow
    18eab899f43f gpio: uniphier: Fix void functions to remove return value
    26c204fbdbc5 gpiolib: acpi: Make set-debounce-timeout failures non fatal
    9b00fb12cdc9 s390/qeth: fix NULL deref in qeth_clear_working_pool_list()
    b9fc4ed7520a spi: Revert modalias changes
    9839bb2b0e83 kselftest/arm64: signal: Skip tests if required features are missing
    6407eb6692fe kselftest/arm64: signal: Add SVE to the set of features we can check for
    d12feda3daf7 platform/x86: dell: fix DELL_WMI_PRIVACY dependencies & build error
    5e95328ad0cd net: dsa: realtek: register the MDIO bus under devres
    880ee7cf0f02 net: dsa: don't allocate the slave_mii_bus using devres
    e15b7001ce5e net: dsa: fix dsa_tree_setup error path
    79816b227dab net/smc: fix 'workqueue leaked lock' in smc_conn_abort_work
    edb96e602d84 net/smc: add missing error check in smc_clc_prfx_set()
    1791e8eef88a net: hns3: fix a return value error in hclge_get_reset_status()
    18d1e07be773 net: hns3: check vlan id before using it
    3d4b460aeb83 net: hns3: check queue id range before using
    fa6126e4eda4 net: hns3: fix misuse vf id and vport id in some logs
    faf83d55e293 net: hns3: fix inconsistent vf id print
    6a627ccb2ce9 net: hns3: fix change RSS 'hfunc' ineffective issue
    fab9a160ef76 bnxt_en: Fix TX timeout when TX ring size is set to the smallest
    ce6c8a9246ad napi: fix race inside napi_enable
    d9448073ee71 net: bgmac-bcma: handle deferred probe error due to mac-address
    1e3d85f911f8 net: dsa: tear down devlink port regions when tearing down the devlink port on error
    135c541dee18 enetc: Fix uninitialized struct dim_sample field usage
    6f329d9da2a5 enetc: Fix illegal access when reading affinity_hint
    f020bb63b5d2 virtio-net: fix pages leaking when building skb in big mode
    9a5ba85e8dce NLM: Fix svcxdr_encode_owner()
    2f95dd831be0 regulator: max14577: Revert "regulator: max14577: Add proper module aliases strings"
    50cb50a99fae platform/x86/intel: punit_ipc: Drop wrong use of ACPI_PTR()
    fa3aac2b4386 afs: Fix updating of i_blocks on file/dir extension
    e66fc460d6dc afs: Fix corruption in reads at fpos 2G-4G from an OpenAFS server
    95671c6c6374 afs: Fix incorrect triggering of sillyrename on 3rd-party invalidation
    d130b5fdd422 afs: Fix page leak
    7f797c79fccd regulator: qcom-rpmh-regulator: fix pm8009-1 ldo7 resource name
    f217b6c1e28e comedi: Fix memory leak in compat_insnlist()
    b032354df6ed arm64: Mitigate MTE issues with str{n}cmp()
    0375ec7559ba arm64: Restore forced disabling of KPTI on ThunderX
    eda7a025a580 platform/x86: amd-pmc: Increase the response register timeout
    449d6043c81d net: hso: fix muxed tty registration
    06a18e64256f drm/amd/pm: Update intermediate power state for SI
    d7ee7ccdc786 scsi: sd_zbc: Ensure buffer size is aligned to SECTOR_SIZE
    21907692fbf3 serial: mvebu-uart: fix driver's tx_empty callback
    590e6c408e30 serial: 8250: 8250_omap: Fix RX_LVL register offset
    807ac762afee xhci: Set HCD flag to defer primary roothub registration
    f8f91342dc0e btrfs: prevent __btrfs_dump_space_info() to underflow its free space
    e9d32ec26e7f nexthop: Fix division by zero while replacing a resilient group
    e1854b6cad5f erofs: fix up erofs_lookup tracepoint
    336dabf99386 KVM: rseq: Update rseq when processing NOTIFY_RESUME on xfer to KVM guest
    9fc198f415de mcb: fix error handling in mcb_alloc_bus()
    9dfda47040e1 misc: genwqe: Fixes DMA mask setting
    3e9a41195afe misc: bcm-vk: fix tty registration race
    e50c102f362e USB: serial: option: add device id for Foxconn T99W265
    924956f203db USB: serial: option: remove duplicate USB device ID
    4bb92efc9bd5 USB: serial: option: add Telit LN920 compositions
    8db009cb6655 USB: serial: mos7840: remove duplicated 0xac24 device ID
    e9ce1992a338 usb: core: hcd: Add support for deferring roothub registration
    0fff3d5cd436 usb: cdns3: fix race condition before setting doorbell
    41d5aff380c0 usb: dwc3: core: balance phy init and exit
    c9f0252e4508 Re-enable UAS for LaCie Rugged USB3-FW with fk quirk
    b55704091500 usb: isp1760: do not sleep in field register poll
    9872ff6fdce8 staging: greybus: uart: fix tty use after free
    b0e001ae6060 binder: fix freeze race
    b95483d8d94b binder: make sure fd closes complete
    63239b0336b1 Revert "USB: bcma: Add a check for devm_gpiod_get"
    af5947c5157d USB: cdc-acm: fix minor-number release
    166f843bb68c USB: serial: cp210x: add ID for GW Instek GDM-834x Digital Multimeter
    5a377e1d7ac9 usb-storage: Add quirk for ScanLogic SL11R-IDE older than 2.6c
    842f8bde1ed9 xen/x86: fix PV trap handling on secondary processors
    9b73af491ffe cifs: fix incorrect check for null pointer in header_assemble
    9f6c7aff21f8 cifs: Fix soft lockup during fsstress
    6344bc6cd2b4 cifs: Not to defer close on file when lock is set
    14582e4d65dc usb: musb: tusb6010: uninitialized data in tusb_fifo_write_unaligned()
    11453ccd21b1 usb: dwc2: gadget: Fix ISOC transfer complete handling for DDMA
    eba598563d06 usb: dwc2: gadget: Fix ISOC flow for BDMA and Slave
    40fe83550d86 usb: gadget: u_audio: EP-OUT bInterval in fback frequency
    29517795c4fe usb: gadget: r8a66597: fix a loop in set_feature()
    9c93c402c467 mm: fix uninitialized use in overcommit_policy_handler
    a7032c95c6e8 mm/debug: sync up MR_CONTIG_RANGE and MR_LONGTERM_PIN
    9ad0f5ca9ccd ocfs2: drop acl cache for directories too
    0414a521d1ea mm, hwpoison: add is_free_buddy_page() in HWPoisonHandlable()

Signed-off-by: Bruce Ashfield <bruce.ashfield@gmail.com>
---
 .../linux/linux-yocto-rt_5.14.bb              |  6 ++---
 .../linux/linux-yocto-tiny_5.14.bb            |  8 +++---
 meta/recipes-kernel/linux/linux-yocto_5.14.bb | 26 +++++++++----------
 3 files changed, 20 insertions(+), 20 deletions(-)

diff --git a/meta/recipes-kernel/linux/linux-yocto-rt_5.14.bb b/meta/recipes-kernel/linux/linux-yocto-rt_5.14.bb
index a16612eb31..3088254265 100644
--- a/meta/recipes-kernel/linux/linux-yocto-rt_5.14.bb
+++ b/meta/recipes-kernel/linux/linux-yocto-rt_5.14.bb
@@ -11,13 +11,13 @@ python () {
         raise bb.parse.SkipRecipe("Set PREFERRED_PROVIDER_virtual/kernel to linux-yocto-rt to enable it")
 }
 
-SRCREV_machine ?= "61d40facfa18554ae6c57cd4d3cab9be8272e177"
-SRCREV_meta ?= "bb52c5cfd4b600d9fb4413ff1a668b47f1937057"
+SRCREV_machine ?= "37f05fcf24a295b1e786e20b16304e5a2592ec99"
+SRCREV_meta ?= "884dfea956ec6b166d1f99a295c47338573a974c"
 
 SRC_URI = "git://git.yoctoproject.org/linux-yocto.git;branch=${KBRANCH};name=machine \
            git://git.yoctoproject.org/yocto-kernel-cache;type=kmeta;name=meta;branch=yocto-5.14;destsuffix=${KMETA}"
 
-LINUX_VERSION ?= "5.14.8"
+LINUX_VERSION ?= "5.14.9"
 
 LIC_FILES_CHKSUM = "file://COPYING;md5=6bc538ed5bd9a7fc9398086aedcd7e46"
 
diff --git a/meta/recipes-kernel/linux/linux-yocto-tiny_5.14.bb b/meta/recipes-kernel/linux/linux-yocto-tiny_5.14.bb
index 89696fbec2..e262722c5b 100644
--- a/meta/recipes-kernel/linux/linux-yocto-tiny_5.14.bb
+++ b/meta/recipes-kernel/linux/linux-yocto-tiny_5.14.bb
@@ -6,7 +6,7 @@ KCONFIG_MODE = "--allnoconfig"
 
 require recipes-kernel/linux/linux-yocto.inc
 
-LINUX_VERSION ?= "5.14.8"
+LINUX_VERSION ?= "5.14.9"
 LIC_FILES_CHKSUM = "file://COPYING;md5=6bc538ed5bd9a7fc9398086aedcd7e46"
 
 DEPENDS += "${@bb.utils.contains('ARCH', 'x86', 'elfutils-native', '', d)}"
@@ -15,9 +15,9 @@ DEPENDS += "openssl-native util-linux-native"
 KMETA = "kernel-meta"
 KCONF_BSP_AUDIT_LEVEL = "2"
 
-SRCREV_machine:qemuarm ?= "372ed9b008af35e56e5dacc906522203a4dd897b"
-SRCREV_machine ?= "b6850b99071366f57df504f6deefbd0276189554"
-SRCREV_meta ?= "bb52c5cfd4b600d9fb4413ff1a668b47f1937057"
+SRCREV_machine:qemuarm ?= "c78d0c7211350419b9262cb2c8b905dcb896c881"
+SRCREV_machine ?= "ab6331a06844991fb4451b329f9f863fd89dfbf8"
+SRCREV_meta ?= "884dfea956ec6b166d1f99a295c47338573a974c"
 
 PV = "${LINUX_VERSION}+git${SRCPV}"
 
diff --git a/meta/recipes-kernel/linux/linux-yocto_5.14.bb b/meta/recipes-kernel/linux/linux-yocto_5.14.bb
index 47ada6e184..866c2b6d61 100644
--- a/meta/recipes-kernel/linux/linux-yocto_5.14.bb
+++ b/meta/recipes-kernel/linux/linux-yocto_5.14.bb
@@ -13,17 +13,17 @@ KBRANCH:qemux86  ?= "v5.14/standard/base"
 KBRANCH:qemux86-64 ?= "v5.14/standard/base"
 KBRANCH:qemumips64 ?= "v5.14/standard/mti-malta64"
 
-SRCREV_machine:qemuarm ?= "98cb84843e33c3f2c89de648358433bdea144f4d"
-SRCREV_machine:qemuarm64 ?= "b6850b99071366f57df504f6deefbd0276189554"
-SRCREV_machine:qemumips ?= "4a595a4eabcf88f9dcf3e2881f027634897e6ad0"
-SRCREV_machine:qemuppc ?= "b6850b99071366f57df504f6deefbd0276189554"
-SRCREV_machine:qemuriscv64 ?= "b6850b99071366f57df504f6deefbd0276189554"
-SRCREV_machine:qemuriscv32 ?= "b6850b99071366f57df504f6deefbd0276189554"
-SRCREV_machine:qemux86 ?= "b6850b99071366f57df504f6deefbd0276189554"
-SRCREV_machine:qemux86-64 ?= "b6850b99071366f57df504f6deefbd0276189554"
-SRCREV_machine:qemumips64 ?= "d333b4641aa536e004174d65a3e91f0018eedf43"
-SRCREV_machine ?= "b6850b99071366f57df504f6deefbd0276189554"
-SRCREV_meta ?= "bb52c5cfd4b600d9fb4413ff1a668b47f1937057"
+SRCREV_machine:qemuarm ?= "df81c53a3a7120e2be6600b5f6e14af4cbb99979"
+SRCREV_machine:qemuarm64 ?= "ab6331a06844991fb4451b329f9f863fd89dfbf8"
+SRCREV_machine:qemumips ?= "d656d555d9237f41b1d8ccdbc994b41c6b4ae3b4"
+SRCREV_machine:qemuppc ?= "ab6331a06844991fb4451b329f9f863fd89dfbf8"
+SRCREV_machine:qemuriscv64 ?= "ab6331a06844991fb4451b329f9f863fd89dfbf8"
+SRCREV_machine:qemuriscv32 ?= "ab6331a06844991fb4451b329f9f863fd89dfbf8"
+SRCREV_machine:qemux86 ?= "ab6331a06844991fb4451b329f9f863fd89dfbf8"
+SRCREV_machine:qemux86-64 ?= "ab6331a06844991fb4451b329f9f863fd89dfbf8"
+SRCREV_machine:qemumips64 ?= "56c290d3292823510eded4e3064b11fb1ea3e0ac"
+SRCREV_machine ?= "ab6331a06844991fb4451b329f9f863fd89dfbf8"
+SRCREV_meta ?= "884dfea956ec6b166d1f99a295c47338573a974c"
 
 # set your preferred provider of linux-yocto to 'linux-yocto-upstream', and you'll
 # get the <version>/base branch, which is pure upstream -stable, and the same
@@ -31,7 +31,7 @@ SRCREV_meta ?= "bb52c5cfd4b600d9fb4413ff1a668b47f1937057"
 # normal PREFERRED_VERSION settings.
 BBCLASSEXTEND = "devupstream:target"
 DEFAULT_PREFERENCE:class-devupstream = "-1"
-SRCREV_machine:class-devupstream ?= "c34892e1995da8ca0dfbdcb115d6156f15000435"
+SRCREV_machine:class-devupstream ?= "70248e7b378b96f208d5544ee25b808a8ef2ddc2"
 PN:class-devupstream = "linux-yocto-upstream"
 KBRANCH:class-devupstream = "v5.14/base"
 
@@ -42,7 +42,7 @@ SRC_URI = "git://git.yoctoproject.org/linux-yocto.git;name=machine;branch=${KBRA
            git://git.yoctoproject.org/yocto-kernel-cache;type=kmeta;name=meta;branch=yocto-5.14;destsuffix=${KMETA}"
 
 LIC_FILES_CHKSUM = "file://COPYING;md5=6bc538ed5bd9a7fc9398086aedcd7e46"
-LINUX_VERSION ?= "5.14.8"
+LINUX_VERSION ?= "5.14.9"
 
 DEPENDS += "${@bb.utils.contains('ARCH', 'x86', 'elfutils-native', '', d)}"
 DEPENDS += "openssl-native util-linux-native"
-- 
2.19.1


