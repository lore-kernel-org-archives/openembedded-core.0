Return-Path: <bruce.ashfield@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id A980FC10F04
	for <webhook@archiver.kernel.org>; Tue,  5 Dec 2023 04:43:07 +0000 (UTC)
Received: from mail-qv1-f47.google.com (mail-qv1-f47.google.com [209.85.219.47])
 by mx.groups.io with SMTP id smtpd.web11.92315.1701751379813807818
 for <openembedded-core@lists.openembedded.org>;
 Mon, 04 Dec 2023 20:42:59 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20230601 header.b=T5h6NjrK;
 spf=pass (domain: gmail.com, ip: 209.85.219.47, mailfrom: bruce.ashfield@gmail.com)
Received: by mail-qv1-f47.google.com with SMTP id 6a1803df08f44-67ab19339b4so19937856d6.0
        for <openembedded-core@lists.openembedded.org>; Mon, 04 Dec 2023 20:42:59 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1701751379; x=1702356179; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=Y/ODdHifUAsWx4GxFIgtw8i34YdkrM6b98IoKOiTEt4=;
        b=T5h6NjrKVTiqfNdG/tCeKlw7Y3V0gWnN4aINi5ZvPFKIFIcqmT/wJu5dpTONqBzuky
         QycO0fDycKOd5u7jEev++tYyvK9UmWZKWP0GsS775FPiFxYXnFMSBtKKzNs2OuI3m6Gz
         mToFNen2XTb9BYmqIPySm8sZ9+8IkRjbC639Ke+A1f4X82P21S6a/W4TnoDWGb5SsmNo
         WcYcf6QbsqigCfbpUFg6p0xel7dLFIBuRAiB/SpRkhNYKgjNCMQMNwQ+8EzHsZES5nvu
         cOUGvO5y+lqDOHQQLBtS0MJB52VZfGgNje999pGoO4pIAkDRNpuIC+oIc8jwfND8JJ0n
         UFRQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1701751379; x=1702356179;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=Y/ODdHifUAsWx4GxFIgtw8i34YdkrM6b98IoKOiTEt4=;
        b=rsYGnS5g4VIvMl+pWzo8J7tZm8UFiL4jnNOcs1V+omCDSNflfJa7mxSDtHSbFTspcK
         uP1W32E2rrokVv1It/6z5356QLYHF7mi8useZcoxGDvcjVbAWBqbN+dZBWjxCkec5SM2
         p7my2l98Kw5h1qJp6t7f5XnCjknEJIDrrlSmL6xUhusvqd29hI2Rb8xxqcfiXg+OJk+3
         jJwxW9H7yAF6Ncy1BU+dOXvifTr2ORU8Rr55WbjYfuKGiwK5kyBCg7EWX2bWwy9NOwEE
         NP7yZYeZqzTFlAM+ic31r2bLE9cNgv3+qUCoIibKTAH9lOk8h7PaTHEUkTpHg4XiN+1D
         eoHw==
X-Gm-Message-State: AOJu0YzLEYCj1haUIbRmiawo7PdGy0ARPq7LjhzdogqHu2MAf+L3vA7k
	w2Aj4fyYHerjxeOWmNxtPaZ//Q0gJpU=
X-Google-Smtp-Source: AGHT+IGcnf1j8pgAhgAqL5g6ZKHpH7T03Y3iGx1ANdop0o4Dw2jXC2SOofobQdEtKWxdTFbBEll5mQ==
X-Received: by 2002:ad4:57d1:0:b0:67a:a721:d787 with SMTP id y17-20020ad457d1000000b0067aa721d787mr670858qvx.109.1701751378652;
        Mon, 04 Dec 2023 20:42:58 -0800 (PST)
Received: from bruce-XPS-8940.. ([174.112.183.231])
        by smtp.gmail.com with ESMTPSA id i8-20020a05620a27c800b0077d73fde842sm4766267qkp.56.2023.12.04.20.42.58
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 04 Dec 2023 20:42:58 -0800 (PST)
From: bruce.ashfield@gmail.com
To: steve@sakoman.com
Cc: openembedded-core@lists.openembedded.org
Subject: [OE-core][dunfell 1/3] linux-yocto/5.4: update to v5.4.258
Date: Mon,  4 Dec 2023 23:42:55 -0500
Message-Id: <20231205044257.4163850-1-bruce.ashfield@gmail.com>
X-Mailer: git-send-email 2.39.2
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Tue, 05 Dec 2023 04:43:07 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/191790

From: Bruce Ashfield <bruce.ashfield@gmail.com>

Updating  to the latest korg -stable release that comprises
the following commits:

    02f78c59a0ed Linux 5.4.258
    f70c285cf02c xen/events: replace evtchn_rwlock with RCU
    e2614ab16a7e ima: rework CONFIG_IMA dependency block
    b5c3bc4b8104 NFS: Fix a race in __nfs_list_for_each_server()
    f0ea421fa2f7 parisc: Restore __ldcw_align for PA-RISC 2.0 processors
    14e5d94d5c86 RDMA/mlx5: Fix NULL string error
    6e26812e289b RDMA/siw: Fix connection failure handling
    8ab1fb16dce0 RDMA/uverbs: Fix typo of sizeof argument
    26d48f7090b8 RDMA/cma: Fix truncation compilation warning in make_cma_ports
    f102dd8a1795 gpio: pxa: disable pinctrl calls for MMP_GPIO
    e38aceeadb4b gpio: aspeed: fix the GPIO number passed to pinctrl_gpio_set_config()
    8584ee20a56c IB/mlx4: Fix the size of a buffer in add_port_entries()
    35b689ee4b57 RDMA/core: Require admin capabilities to set system parameters
    1047ca5bae20 cpupower: add Makefile dependencies for install targets
    3c2f536c3d32 sctp: update hb timer immediately after users change hb_interval
    caf0c61f14e7 sctp: update transport state when processing a dupcook packet
    14fc22c92937 tcp: fix delayed ACKs for MSS boundary condition
    2791d64e6607 tcp: fix quick-ack counting to count actual ACKs of new data
    7fbce1e46b41 net: stmmac: dwmac-stm32: fix resume on STM32 MCU
    f110aa377ddc netfilter: handle the connecting collision properly in nf_conntrack_proto_sctp
    191d87a19cf1 net: nfc: llcp: Add lock when modifying device list
    310f1c92f65a net: usb: smsc75xx: Fix uninit-value access in __smsc75xx_read_reg
    899205521005 net: dsa: mv88e6xxx: Avoid EEPROM timeout when EEPROM is absent
    1fc793d68d50 ipv4, ipv6: Fix handling of transhdrlen in __ip{,6}_append_data()
    95eabb075a59 net: fix possible store tearing in neigh_periodic_work()
    10a301c83a3d modpost: add missing else to the "of" check
    5e1c1bf53e5f NFSv4: Fix a nfs4_state_manager() race
    f90821f66727 NFS: Add a helper nfs_client_for_each_server()
    e2d4fc53e9f7 NFS4: Trace state recovery operation
    c87f66c43c1b scsi: target: core: Fix deadlock due to recursive locking
    8a1fa738b491 ima: Finish deprecation of IMA_TRUSTED_KEYRING Kconfig
    442e50393a29 regmap: rbtree: Fix wrong register marked as in-cache when creating new node
    52008a5e22ac wifi: mt76: mt76x02: fix MT76x0 external LNA gain handling
    31b27776905a drivers/net: process the result of hdlc_open() and add call of hdlc_close() in uhdlc_close()
    b8e260654a29 wifi: mwifiex: Fix oob check condition in mwifiex_process_rx_packet
    1b67be400a96 wifi: iwlwifi: dbg_ini: fix structure packing
    c6d358387632 ubi: Refuse attaching if mtd's erasesize is 0
    b4ec10b962f7 net: prevent rewrite of msg_name in sock_sendmsg()
    53b700b41a06 net: replace calls to sock->ops->connect() with kernel_connect()
    3c4bfa7a56c8 wifi: mwifiex: Fix tlv_buf_left calculation
    2e608cede0ae qed/red_ll2: Fix undefined behavior bug in struct qed_ll2_info
    810248a12999 scsi: zfcp: Fix a double put in zfcp_port_enqueue()
    e60272ab021c Revert "PCI: qcom: Disable write access to read only registers for IP v2.3.3"
    6e37de4a1407 rbd: take header_rwsem in rbd_dev_refresh() only when updating
    bc2a3044015f rbd: decouple parent info read-in from updating rbd_dev
    2e0114edeb47 rbd: decouple header read-in from updating rbd_dev->header
    32a59639c551 rbd: move rbd_dev_refresh() definition
    ff10b1fad581 fs: binfmt_elf_efpic: fix personality for ELF-FDPIC
    43e5dc1ee2ea ata: libata-sata: increase PMP SRST timeout to 10s
    ac1aebd4e3b8 ata: libata-core: Do not register PM operations for SAS ports
    9313aab5f649 ata: libata-core: Fix port and device removal
    9207666f166c ata: libata-core: Fix ata_port_request_pm() locking
    d9483f5aecf4 net: thunderbolt: Fix TCPv6 GSO checksum calculation
    47062af85961 btrfs: properly report 0 avail for very full file systems
    cf221a7880ea ring-buffer: Update "shortest_full" in polling
    ec7b2e7b365c i2c: i801: unregister tco_pdev in i801_probe() error path
    a4ecd8562c0e ata: libata-scsi: ignore reserved bits for REPORT SUPPORTED OPERATION CODES
    ec1df5d37d59 ALSA: hda: Disable power save for solving pop issue on Lenovo ThinkCentre M70q
    193b5a1c6c67 nilfs2: fix potential use after free in nilfs_gccache_submit_read_data()
    bf3c728e3692 serial: 8250_port: Check IRQ data before use
    76ffbd900b6a Smack:- Use overlay inode label in smack_inode_copy_up()
    957a9916db5b smack: Retrieve transmuting information in smack_inode_getsecurity()
    c9ce9bab2301 smack: Record transmuting in smk_transmuted
    d037d8964fb8 i40e: fix return of uninitialized aq_ret in i40e_set_vsi_promisc
    2d78e2d3e31f i40e: always propagate error value in i40e_set_vsi_promisc()
    8ed4b5d710b0 i40e: improve locking of mac_filter_hash
    30055e020ab2 watchdog: iTCO_wdt: Set NO_REBOOT if the watchdog is not already running
    c54a392fc79e watchdog: iTCO_wdt: No need to stop the timer in probe
    d68c61092c3d nvme-pci: do not set the NUMA node of device if it has none
    283f24df8303 fbdev/sh7760fb: Depend on FB=y
    ee1f5c63e919 ncsi: Propagate carrier gain/loss events to the NCSI controller
    b42eac146247 powerpc/watchpoints: Annotate atomic context in more places
    723904ce853e bpf: Clarify error expectations from bpf_clone_redirect
    db4afbc6c1a1 spi: nxp-fspi: reset the FLSHxCR1 registers
    3502dd803138 ata: libata-eh: do not clear ATA_PFLAG_EH_PENDING in ata_eh_reset()
    05264d6551e1 ring-buffer: Avoid softlockup in ring_buffer_resize()
    1d28224d49f3 selftests/ftrace: Correctly enable event in instance-event.tc
    ded3551163fc parisc: irq: Make irq_stack_union static to avoid sparse warning
    a721e5788aca parisc: drivers: Fix sparse warning
    2569e0ceff8a parisc: iosapic.c: Fix sparse warnings
    f1a0dd9243f0 parisc: sba: Fix compile warning wrt list of SBA devices
    6db9cdfdc3c5 gpio: pmic-eic-sprd: Add can_sleep flag for PMIC EIC chip
    4a62d23eba66 xtensa: boot/lib: fix function prototypes
    e11fa78a3722 xtensa: boot: don't add include-dirs
    5ed83a0a3953 xtensa: iss/network: make functions static
    b821e6a8b2f5 xtensa: add default definition for XCHAL_HAVE_DIV32
    49dc6fcd4b6a bus: ti-sysc: Fix SYSC_QUIRK_SWSUP_SIDLE_ACT handling for uart wake-up
    841733189b2e ARM: dts: ti: omap: motorola-mapphone: Fix abe_clkctrl warning on boot
    3468fa39d898 clk: tegra: fix error return case for recalc_rate
    6938a6cbe651 MIPS: Alchemy: only build mmc support helpers if au1xmmc is enabled
    5b0d13e2d9f6 ata: libata: disallow dev-initiated LPM transitions to unsupported states
    617a89ff55e3 drm/amd/display: prevent potential division by zero errors
    07b63a3dcfef drm/amd/display: Fix LFC multiplier changing erratically
    11e3f781f6e3 drm/amd/display: Reinstate LFC optimization
    a4628a5b98e4 scsi: qla2xxx: Fix deletion race condition
    0a51c838c58f scsi: qla2xxx: Fix update_fcport for current_topology
    ecdf4c658b6e Input: i8042 - add quirk for TUXEDO Gemini 17 Gen1/Clevo PD70PN
    0926a2b7cb60 i2c: mux: demux-pinctrl: check the return value of devm_kstrdup()
    e09db461f258 gpio: tb10x: Fix an error handling path in tb10x_gpio_probe()
    02a233986c9e netfilter: ipset: Fix race between IPSET_CMD_CREATE and IPSET_CMD_SWAP
    812da2a08dc5 net: rds: Fix possible NULL-pointer dereference
    c5f6478686bb team: fix null-ptr-deref when team device type is changed
    ad8d39c7b437 net: bridge: use DEV_STATS_INC()
    121a7c474ce0 net: hns3: add 5ms delay before clear firmware reset irq source
    a6f4d582e25d dccp: fix dccp_v4_err()/dccp_v6_err() again
    16b88d7a1436 powerpc/perf/hv-24x7: Update domain value check
    810fd23d9715 ipv4: fix null-deref in ipv4_link_failure
    8f228c326d68 i40e: Fix VF VLAN offloading when port VLAN is configured
    8b835db2793a i40e: Fix warning message and call stack during rmmod i40e driver
    9cbec71a5721 i40e: Remove scheduling while atomic possibility
    0988fc499f67 i40e: Fix for persistent lldp support
    09475d647670 ASoC: imx-audmix: Fix return error with devm_clk_get()
    ca1d4e3c4dba selftests: tls: swap the TX and RX sockets in some tests
    b9eb384fd4fd selftests/tls: Add {} to avoid static checker warning
    40e34ea01748 bpf: Avoid deadlock when using queue and stack maps from NMI
    eec981349b03 netfilter: nf_tables: disallow element removal on anonymous sets
    d2a6844be5bd ASoC: meson: spdifin: start hw on dai probe
    0c908e159588 ext4: do not let fstrim block system suspend
    4db34feaf297 ext4: move setting of trimmed bit into ext4_try_to_trim_range()
    767a50bef2aa ext4: replace the traditional ternary conditional operator with with max()/min()
    2fd502f53bf4 ext4: mark group as trimmed only if it was fully scanned
    635901bdbd7e ext4: change s_last_trim_minblks type to unsigned long
    2d874151584d ext4: scope ret locally in ext4_try_to_trim_range()
    c71cb46affe9 ext4: add new helper interface ext4_try_to_trim_range()
    b0dcbd4bb957 ext4: remove the 'group' parameter of ext4_trim_extent
    bf0660756510 ata: libahci: clear pending interrupt status
    e6807c873d87 tracing: Increase trace array ref count on enable and filter files
    7d3f6612e90b SUNRPC: Mark the cred for revalidation if the server rejects it
    321c75b01cc8 NFS/pNFS: Report EINVAL errors from connect() to the server

Signed-off-by: Bruce Ashfield <bruce.ashfield@gmail.com>
---
 .../linux/linux-yocto-rt_5.4.bb               |  6 ++---
 .../linux/linux-yocto-tiny_5.4.bb             |  8 +++----
 meta/recipes-kernel/linux/linux-yocto_5.4.bb  | 22 +++++++++----------
 3 files changed, 18 insertions(+), 18 deletions(-)

diff --git a/meta/recipes-kernel/linux/linux-yocto-rt_5.4.bb b/meta/recipes-kernel/linux/linux-yocto-rt_5.4.bb
index 148712b6f3c..db63b822895 100644
--- a/meta/recipes-kernel/linux/linux-yocto-rt_5.4.bb
+++ b/meta/recipes-kernel/linux/linux-yocto-rt_5.4.bb
@@ -11,13 +11,13 @@ python () {
         raise bb.parse.SkipRecipe("Set PREFERRED_PROVIDER_virtual/kernel to linux-yocto-rt to enable it")
 }
 
-SRCREV_machine ?= "85315779726690bf22e615a8f5e2ab9f3ea8e580"
-SRCREV_meta ?= "3f4db4c1957e98a3da50908339aaee426e58fd13"
+SRCREV_machine ?= "5889ebdd98c208dba446c554bb4b0fadba04dde7"
+SRCREV_meta ?= "0bc097b782b9f41b41b31074cdbd86b8e7393209"
 
 SRC_URI = "git://git.yoctoproject.org/linux-yocto.git;branch=${KBRANCH};name=machine \
            git://git.yoctoproject.org/yocto-kernel-cache;type=kmeta;name=meta;branch=yocto-5.4;destsuffix=${KMETA}"
 
-LINUX_VERSION ?= "5.4.257"
+LINUX_VERSION ?= "5.4.258"
 
 LIC_FILES_CHKSUM = "file://COPYING;md5=bbea815ee2795b2f4230826c0c6b8814"
 
diff --git a/meta/recipes-kernel/linux/linux-yocto-tiny_5.4.bb b/meta/recipes-kernel/linux/linux-yocto-tiny_5.4.bb
index 89fda1c71b2..d418011bb53 100644
--- a/meta/recipes-kernel/linux/linux-yocto-tiny_5.4.bb
+++ b/meta/recipes-kernel/linux/linux-yocto-tiny_5.4.bb
@@ -6,7 +6,7 @@ KCONFIG_MODE = "--allnoconfig"
 
 require recipes-kernel/linux/linux-yocto.inc
 
-LINUX_VERSION ?= "5.4.257"
+LINUX_VERSION ?= "5.4.258"
 LIC_FILES_CHKSUM = "file://COPYING;md5=bbea815ee2795b2f4230826c0c6b8814"
 
 DEPENDS += "${@bb.utils.contains('ARCH', 'x86', 'elfutils-native', '', d)}"
@@ -15,9 +15,9 @@ DEPENDS += "openssl-native util-linux-native"
 KMETA = "kernel-meta"
 KCONF_BSP_AUDIT_LEVEL = "2"
 
-SRCREV_machine_qemuarm ?= "dd581fe8efd97479b60c1169c77d2e9e37fdbd42"
-SRCREV_machine ?= "739b4ff36fdf4203e60448f252dd4afcd8871046"
-SRCREV_meta ?= "3f4db4c1957e98a3da50908339aaee426e58fd13"
+SRCREV_machine_qemuarm ?= "192f2b5c9064965f7b4cb56f6b779616674121e3"
+SRCREV_machine ?= "6a6a13be0a1d89370e5af25c9b8150e88dbc9c5e"
+SRCREV_meta ?= "0bc097b782b9f41b41b31074cdbd86b8e7393209"
 
 PV = "${LINUX_VERSION}+git${SRCPV}"
 
diff --git a/meta/recipes-kernel/linux/linux-yocto_5.4.bb b/meta/recipes-kernel/linux/linux-yocto_5.4.bb
index e10e542663d..751a5bd47f9 100644
--- a/meta/recipes-kernel/linux/linux-yocto_5.4.bb
+++ b/meta/recipes-kernel/linux/linux-yocto_5.4.bb
@@ -13,16 +13,16 @@ KBRANCH_qemux86  ?= "v5.4/standard/base"
 KBRANCH_qemux86-64 ?= "v5.4/standard/base"
 KBRANCH_qemumips64 ?= "v5.4/standard/mti-malta64"
 
-SRCREV_machine_qemuarm ?= "af8795f548930f376f648b3c38c96ea9adeca302"
-SRCREV_machine_qemuarm64 ?= "08b2d42ab0000a6f12d816c0828632c162f5173a"
-SRCREV_machine_qemumips ?= "37c8da56986328d9030015e1a80beaa90babab30"
-SRCREV_machine_qemuppc ?= "3cd238f6056560888f7f717c569ca4a1fe16ccc9"
-SRCREV_machine_qemuriscv64 ?= "aee8802f6fec35ea9b393707cc2adb4d433d93c8"
-SRCREV_machine_qemux86 ?= "aee8802f6fec35ea9b393707cc2adb4d433d93c8"
-SRCREV_machine_qemux86-64 ?= "aee8802f6fec35ea9b393707cc2adb4d433d93c8"
-SRCREV_machine_qemumips64 ?= "44fbd145164885c2ba73a8ddcb09fd6f3ab0d59c"
-SRCREV_machine ?= "aee8802f6fec35ea9b393707cc2adb4d433d93c8"
-SRCREV_meta ?= "3f4db4c1957e98a3da50908339aaee426e58fd13"
+SRCREV_machine_qemuarm ?= "02d0d86cd3148f12cccb7af027fb41d41b03c726"
+SRCREV_machine_qemuarm64 ?= "5880452e43a9cf56108492a627b85196ea10190b"
+SRCREV_machine_qemumips ?= "9754f47861b4a29b4c4577ce14b7fb44c81c521e"
+SRCREV_machine_qemuppc ?= "3e5d9bf09fb23b0acefe73c644de0028dd51fe42"
+SRCREV_machine_qemuriscv64 ?= "d55e21e23f5d099d7c8ad58d5c2b6302c02ef9f0"
+SRCREV_machine_qemux86 ?= "d55e21e23f5d099d7c8ad58d5c2b6302c02ef9f0"
+SRCREV_machine_qemux86-64 ?= "d55e21e23f5d099d7c8ad58d5c2b6302c02ef9f0"
+SRCREV_machine_qemumips64 ?= "98065f598767e0f92ed86f880795603df7a3a9d2"
+SRCREV_machine ?= "d55e21e23f5d099d7c8ad58d5c2b6302c02ef9f0"
+SRCREV_meta ?= "0bc097b782b9f41b41b31074cdbd86b8e7393209"
 
 # remap qemuarm to qemuarma15 for the 5.4 kernel
 # KMACHINE_qemuarm ?= "qemuarma15"
@@ -31,7 +31,7 @@ SRC_URI = "git://git.yoctoproject.org/linux-yocto.git;name=machine;branch=${KBRA
            git://git.yoctoproject.org/yocto-kernel-cache;type=kmeta;name=meta;branch=yocto-5.4;destsuffix=${KMETA}"
 
 LIC_FILES_CHKSUM = "file://COPYING;md5=bbea815ee2795b2f4230826c0c6b8814"
-LINUX_VERSION ?= "5.4.257"
+LINUX_VERSION ?= "5.4.258"
 
 DEPENDS += "${@bb.utils.contains('ARCH', 'x86', 'elfutils-native', '', d)}"
 DEPENDS += "openssl-native util-linux-native"
-- 
2.39.2


