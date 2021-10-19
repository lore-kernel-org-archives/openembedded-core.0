Return-Path: <bruce.ashfield@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id ACDEBC433EF
	for <webhook@archiver.kernel.org>; Tue, 19 Oct 2021 02:46:24 +0000 (UTC)
Received: from mail-qv1-f42.google.com (mail-qv1-f42.google.com
 [209.85.219.42])
 by mx.groups.io with SMTP id smtpd.web11.4498.1634611583339141252
 for <openembedded-core@lists.openembedded.org>;
 Mon, 18 Oct 2021 19:46:23 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20210112 header.b=pybW5CrE;
 spf=pass (domain: gmail.com, ip: 209.85.219.42,
 mailfrom: bruce.ashfield@gmail.com)
Received: by mail-qv1-f42.google.com with SMTP id a16so11447710qvm.2
        for <openembedded-core@lists.openembedded.org>;
 Mon, 18 Oct 2021 19:46:23 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:content-transfer-encoding;
        bh=w80o51+yoydwF+RDY1PO4lrLUjHyOzgL97CrphaTNl8=;
        b=pybW5CrEc5a5jloqxTMMnD5wOlH4OrUAFLaH9rUyQDT8s+tkrKiWKLOtpPT9jnmyT7
         s6MDX92wO2DlX5up9djyhFvsaU6bW2dhNd9Sjn/lTShpKRxq2abZshoG/VZaR80HR6wj
         5NjSz9qQRm7kWFSIHtYK1TVuo3EnDLstWjElRMm8wCOnZ70iZabIBgx1Dnoy7YCM7dGR
         +DbbJjWguE61adA4obQB7+gcO+FhNDn0wiR74yfE4AvIOI8o7lWw8LjMw3PY85ur6lbb
         h+8VR5lIcRE894h4x2MwxzbH6iAAn+oxOuK6VYS713mjhH0BJVt1Q43p1zmrtoEQ+zYE
         s4WA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=w80o51+yoydwF+RDY1PO4lrLUjHyOzgL97CrphaTNl8=;
        b=sC160MmVGYbydjIrd2l4BoHaFyx7loC4i2FjNfJXyYtCQt27dkNrXVLPrO5SLiDJSg
         cqcz6FsyOiIYb+NEfjqOgagxvK0XTJIXukptghjPnFW6U1HiZQxNUCL8BbbCiIc+2ADO
         2fQS52rFAKZ/30nM6kW/fWkkDexCe1zEhcX4R5FnuQpv9+KhGROkSV8hrQ1FxqSRvKf4
         83h3SfOgXvPNu48cIDRK5bOHsVeu/bYiKMTApTLXzsJerFaS+568WxZRZmD6wv9R6UEp
         Hb6sx65/uo13okaVFac1yDU9ZbJzz8d/MovxzTZaYkq9PNXx8f3XxZqiK3dTVXHLchH5
         8G6g==
X-Gm-Message-State: AOAM530r9m2bJgE2X5lANox17+7QypYqERXVIhChGVreHKSfTcwWcHkE
	Pfino+NeDt3bi/f/QcIcyXCpn/S/eQEPhw==
X-Google-Smtp-Source: 
 ABdhPJy5qyGc4FpTTMSvVwkc64ZmEL5rkpVdzJFsqNqTE9gkxTngGSOlEFmpkQVXJoynj66dOzys7Q==
X-Received: by 2002:a05:6214:13ce:: with SMTP id
 cg14mr29270852qvb.51.1634611582476;
        Mon, 18 Oct 2021 19:46:22 -0700 (PDT)
Received: from build.lan
 (cpe04d4c4975b80-cmf4c11490699b.cpe.net.cable.rogers.com. [174.112.63.222])
        by smtp.gmail.com with ESMTPSA id
 x9sm7069060qtw.84.2021.10.18.19.46.21
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 18 Oct 2021 19:46:22 -0700 (PDT)
From: bruce.ashfield@gmail.com
To: steve@sakoman.com
Cc: openembedded-core@lists.openembedded.org
Subject: [PATCH 3/3][dunfell] linux-yocto/5.4: update to v5.4.153
Date: Mon, 18 Oct 2021 22:46:18 -0400
Message-Id: <20211019024618.62100-3-bruce.ashfield@gmail.com>
X-Mailer: git-send-email 2.19.1
In-Reply-To: <20211019024618.62100-1-bruce.ashfield@gmail.com>
References: <20211019024618.62100-1-bruce.ashfield@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Tue, 19 Oct 2021 02:46:24 -0000
X-Groupsio-URL: 
 https://lists.openembedded.org/g/openembedded-core/message/157102

From: Bruce Ashfield <bruce.ashfield@gmail.com>

Updating linux-yocto/5.4 to the latest korg -stable release that comprises
the following commits:

    940a14a7d844 Linux 5.4.153
    6a89b1e0c250 x86/Kconfig: Correct reference to MWINCHIP3D
    5b3b400741a5 x86/hpet: Use another crystalball to evaluate HPET usability
    367f643191b3 x86/platform/olpc: Correct ifdef symbol to intended CONFIG_OLPC_XO15_SCI
    9e2a9da532e0 RISC-V: Include clone3() on rv32
    a326f9c01cfb bpf, s390: Fix potential memory leak about jit_data
    60bacf259e8c i2c: acpi: fix resource leak in reconfiguration device addition
    b723b34a9831 net: prefer socket bound to interface when not in VRF
    17063cac4088 i40e: Fix freeing of uninitialized misc IRQ vector
    0a1fcc981dec i40e: fix endless loop under rtnl
    d6c066811921 gve: fix gve_get_stats()
    d83787c26d21 rtnetlink: fix if_nlmsg_stats_size() under estimation
    0311d9775390 gve: Correct available tx qpl check
    11cd944bb87d drm/nouveau/debugfs: fix file release memory leak
    cb7e65187983 video: fbdev: gbefb: Only instantiate device when built for IP32
    04f981251e20 bus: ti-sysc: Use CLKDM_NOAUTO for dra7 dcan1 for errata i893
    809aa82ac64f netlink: annotate data races around nlk->bound
    fd73c2e64b43 net: sfp: Fix typo in state machine debug string
    c951c08a5996 net/sched: sch_taprio: properly cancel timer from taprio_destroy()
    c2c45102ae19 net: bridge: use nla_total_size_64bit() in br_get_linkxstats_size()
    8af0c7d3fb55 ARM: imx6: disable the GIC CPU interface before calling stby-poweroff sequence
    ebe58e1c1a7f arm64: dts: ls1028a: add missing CAN nodes
    1b9f0d242ab6 arm64: dts: freescale: Fix SP805 clock-names
    27e53e23a3ce ptp_pch: Load module automatically if ID matches
    a7b441a2e209 powerpc/fsl/dts: Fix phy-connection-type for fm1mac3
    c951a3be5e88 net_sched: fix NULL deref in fifo_set_limit()
    414bb4ead136 phy: mdio: fix memory leak
    b14f28126c51 bpf: Fix integer overflow in prealloc_elems_and_freelist()
    a3d68a42457a bpf, arm: Fix register clobbering in div/mod implementation
    e0c6e864d28d xtensa: call irqchip_init only when CONFIG_USE_OF is selected
    d10a2a8f8853 xtensa: use CONFIG_USE_OF instead of CONFIG_OF
    73711563f5b5 xtensa: move XCHAL_KIO_* definitions to kmem_layout.h
    c82cffe17124 arm64: dts: qcom: pm8150: use qcom,pm8998-pon binding
    14c9c75d4809 ARM: dts: imx: Fix USB host power regulator polarity on M53Menlo
    720a4dceee22 ARM: dts: imx: Add missing pinctrl-names for panel on M53Menlo
    6b2855ac7ef7 soc: qcom: mdt_loader: Drop PT_LOAD check on hash segment
    1179cd690a76 ARM: dts: qcom: apq8064: Use 27MHz PXO clock as DSI PLL reference
    bdc189d6b69f soc: qcom: socinfo: Fixed argument passed to platform_set_data()
    1a0fe45501a2 bpf, mips: Validate conditional branch offsets
    7ed040244595 MIPS: BPF: Restore MIPS32 cBPF JIT
    4239cd380afd ARM: dts: qcom: apq8064: use compatible which contains chipid
    30d68bf74d52 ARM: dts: omap3430-sdp: Fix NAND device node
    2abb4077fa1b xen/balloon: fix cancelled balloon action
    42fbcbaa8a99 nfsd4: Handle the NFSv4 READDIR 'dircount' hint being zero
    f88420197a04 nfsd: fix error handling of register_pernet_subsys() in init_nfsd()
    fab338f33c25 ovl: fix missing negative dentry check in ovl_rename()
    4920aae61bd9 mmc: meson-gx: do not use memcpy_to/fromio for dram-access-quirk
    47f7bb3dc2a3 xen/privcmd: fix error handling in mmap-resource processing
    9d93cfdaf8d4 usb: typec: tcpm: handle SRC_STARTUP state if cc changes
    b53aa224ada2 USB: cdc-acm: fix break reporting
    3135935b7f9a USB: cdc-acm: fix racy tty buffer accesses
    7c2392f03f3b Partially revert "usb: Kconfig: using select for USB_COMMON dependency"
    faaca480fd5c Linux 5.4.152
    caff281e2073 libata: Add ATA_HORKAGE_NO_NCQ_ON_ATI for Samsung 860 and 870 SSD.
    fecbe957ef4d silence nfscache allocation warnings with kvzalloc
    5546e3987dd1 perf/x86: Reset destroy callback on event init failure
    2787cde6cb5b kvm: x86: Add AMD PMU MSRs to msrs_to_save_all[]
    ba58770c14e0 KVM: do not shrink halt_poll_ns below grow_start
    d67e01e5e095 tools/vm/page-types: remove dependency on opt_file for idle page tracking
    65c7e3c97378 scsi: ses: Retry failed Send/Receive Diagnostic commands
    e4e756054d1a selftests:kvm: fix get_warnings_count() ignoring fscanf() return warn
    1f830ab34585 selftests: be sure to make khdr before other targets
    8b9c1c33e51d usb: dwc2: check return value after calling platform_get_resource()
    5d124ee0d2d6 usb: testusb: Fix for showing the connection speed
    350d048cc506 scsi: sd: Free scsi_disk device via put_device()
    4f194b57696a ext2: fix sleeping in atomic bugs on error
    2d8eb456742e sparc64: fix pci_iounmap() when CONFIG_PCI is not set
    61504f62bb04 xen-netback: correct success/error reporting for the SKB-with-fraglist case
    2ecca3b282c3 net: mdio: introduce a shutdown method to mdio device drivers
    31cdcb6d430f Linux 5.4.151
    965147067fa1 HID: usbhid: free raw_report buffers in usbhid_stop
    6f2f68640b84 netfilter: ipset: Fix oversized kvmalloc() calls
    fe9bb925e709 HID: betop: fix slab-out-of-bounds Write in betop_probe
    24f3d2609114 crypto: ccp - fix resource leaks in ccp_run_aes_gcm_cmd()
    62c5cacb0986 usb: hso: remove the bailout parameter
    fe57d53dd91d usb: hso: fix error handling code of hso_create_net_device
    d29c7a1a322d hso: fix bailout in error case of probe
    1f2b324e82c4 libnvdimm/pmem: Fix crash triggered when I/O in-flight during unbind
    dd336267d848 PCI: Fix pci_host_bridge struct device release/free handling
    e81f3b7e7112 net: stmmac: don't attach interface until resume finishes
    f8ffde0bb96d net: udp: annotate data race around udp_sk(sk)->corkflag
    9dbf7e343b69 HID: u2fzero: ignore incomplete packets without data
    d518ea03145c ext4: fix potential infinite loop in ext4_dx_readdir()
    59c19fdcde79 ext4: fix reserved space counter leakage
    c4b8db2b4755 ext4: fix loff_t overflow in ext4_max_bitmap_size()
    3253c87e1e5b ipack: ipoctal: fix module reference leak
    9c802a05749a ipack: ipoctal: fix missing allocation-failure check
    3fd682d461ab ipack: ipoctal: fix tty-registration error handling
    e6a71c173eda ipack: ipoctal: fix tty registration race
    8657158a3b68 ipack: ipoctal: fix stack information leak
    91d5de0b710b debugfs: debugfs_create_file_size(): use IS_ERR to check for error
    98574c91e373 elf: don't use MAP_FIXED_NOREPLACE for elf interpreter mappings
    9356e4dcebd8 perf/x86/intel: Update event constraints for ICX
    0fcfaa8ed9d1 af_unix: fix races in sk_peer_pid and sk_peer_cred accesses
    694b0cee7f85 net: sched: flower: protect fl_walk() with rcu
    5a31d4e73ada net: hns3: do not allow call hns3_nic_net_open repeatedly
    87de237b0b5c scsi: csiostor: Add module softdep on cxgb4
    1b6ccfcec681 Revert "block, bfq: honor already-setup queue merges"
    753096c38aa9 selftests, bpf: test_lwt_ip_encap: Really disable rp_filter
    897d1401d1d6 e100: fix buffer overrun in e100_get_regs
    93372e02f969 e100: fix length calculation in e100_get_regs_len
    a2624e0934f0 net: ipv4: Fix rtnexthop len when RTA_FLOW is present
    c37d3287e7a2 hwmon: (tmp421) fix rounding for negative values
    8a07d5aba34b hwmon: (tmp421) report /PVLD condition as fault
    ec018021cf44 sctp: break out if skb_header_pointer returns NULL in sctp_rcv_ootb
    9bee85de2c81 mac80211-hwsim: fix late beacon hrtimer handling
    21c3a844939c mac80211: mesh: fix potentially unaligned access
    ab85997465b9 mac80211: limit injected vht mcs/nss in ieee80211_parse_tx_radiotap
    87e06c44280d mac80211: Fix ieee80211_amsdu_aggregate frag_tail bug
    a6c42ae1530f hwmon: (mlxreg-fan) Return non-zero value when fan current state is enforced from sysfs
    2c30592255c6 ipvs: check that ip_vs_conn_tab_bits is between 8 and 20
    9a571d83acb5 drm/amd/display: Pass PCI deviceid into DC
    3443eb443f3a x86/kvmclock: Move this_cpu_pvti into kvmclock.h
    50149e0866a8 mac80211: fix use-after-free in CCMP/GCMP RX
    956bc3ee3197 scsi: ufs: Fix illegal offset in UPIU event trace
    44d3c480e4e2 hwmon: (w83791d) Fix NULL pointer dereference by removing unnecessary structure field
    200ced5ba724 hwmon: (w83792d) Fix NULL pointer dereference by removing unnecessary structure field
    6cb01fe630ea hwmon: (w83793) Fix NULL pointer dereference by removing unnecessary structure field
    504cf969d585 fs-verity: fix signed integer overflow with i_size near S64_MAX
    b2fb6ce06c0f usb: cdns3: fix race condition before setting doorbell
    e2370e193519 cpufreq: schedutil: Destroy mutex before kobject_put() frees the memory
    67c98e023135 cpufreq: schedutil: Use kobject release() method to free sugov_tunables
    883f7897a25e tty: Fix out-of-bound vmalloc access in imageblit

Signed-off-by: Bruce Ashfield <bruce.ashfield@gmail.com>
---
 .../linux/linux-yocto-rt_5.4.bb               |  6 ++---
 .../linux/linux-yocto-tiny_5.4.bb             |  8 +++----
 meta/recipes-kernel/linux/linux-yocto_5.4.bb  | 22 +++++++++----------
 3 files changed, 18 insertions(+), 18 deletions(-)

diff --git a/meta/recipes-kernel/linux/linux-yocto-rt_5.4.bb b/meta/recipes-kernel/linux/linux-yocto-rt_5.4.bb
index 506ef6931f..13512ea6a4 100644
--- a/meta/recipes-kernel/linux/linux-yocto-rt_5.4.bb
+++ b/meta/recipes-kernel/linux/linux-yocto-rt_5.4.bb
@@ -11,13 +11,13 @@ python () {
         raise bb.parse.SkipRecipe("Set PREFERRED_PROVIDER_virtual/kernel to linux-yocto-rt to enable it")
 }
 
-SRCREV_machine ?= "f3196d5b7c9ed7e02530a1e421520e851753c6b7"
-SRCREV_meta ?= "e14d587eec888fba8693da2a072f729219acfb41"
+SRCREV_machine ?= "88b78bac3bf83e6b3ef08d77f895bba5128cc1cd"
+SRCREV_meta ?= "9e3ab4e615b651c1b63d4f0cce71da79a3e89763"
 
 SRC_URI = "git://git.yoctoproject.org/linux-yocto.git;branch=${KBRANCH};name=machine \
            git://git.yoctoproject.org/yocto-kernel-cache;type=kmeta;name=meta;branch=yocto-5.4;destsuffix=${KMETA}"
 
-LINUX_VERSION ?= "5.4.150"
+LINUX_VERSION ?= "5.4.153"
 
 LIC_FILES_CHKSUM = "file://COPYING;md5=bbea815ee2795b2f4230826c0c6b8814"
 
diff --git a/meta/recipes-kernel/linux/linux-yocto-tiny_5.4.bb b/meta/recipes-kernel/linux/linux-yocto-tiny_5.4.bb
index 8165c58266..e6e0ee73b2 100644
--- a/meta/recipes-kernel/linux/linux-yocto-tiny_5.4.bb
+++ b/meta/recipes-kernel/linux/linux-yocto-tiny_5.4.bb
@@ -6,7 +6,7 @@ KCONFIG_MODE = "--allnoconfig"
 
 require recipes-kernel/linux/linux-yocto.inc
 
-LINUX_VERSION ?= "5.4.150"
+LINUX_VERSION ?= "5.4.153"
 LIC_FILES_CHKSUM = "file://COPYING;md5=bbea815ee2795b2f4230826c0c6b8814"
 
 DEPENDS += "${@bb.utils.contains('ARCH', 'x86', 'elfutils-native', '', d)}"
@@ -15,9 +15,9 @@ DEPENDS += "openssl-native util-linux-native"
 KMETA = "kernel-meta"
 KCONF_BSP_AUDIT_LEVEL = "2"
 
-SRCREV_machine_qemuarm ?= "16773ce7bb039749a7ec8228128e184d9de4ccf6"
-SRCREV_machine ?= "cf292e8551f71965ea892fbb8bf1d1faecfaccb4"
-SRCREV_meta ?= "e14d587eec888fba8693da2a072f729219acfb41"
+SRCREV_machine_qemuarm ?= "fed16a9b9cb56ce639eeddeedd756ad5207fa89e"
+SRCREV_machine ?= "942b0cc9a1ff13a66016167d4437f7694e96d04e"
+SRCREV_meta ?= "9e3ab4e615b651c1b63d4f0cce71da79a3e89763"
 
 PV = "${LINUX_VERSION}+git${SRCPV}"
 
diff --git a/meta/recipes-kernel/linux/linux-yocto_5.4.bb b/meta/recipes-kernel/linux/linux-yocto_5.4.bb
index fecf7c2b02..6c69878d03 100644
--- a/meta/recipes-kernel/linux/linux-yocto_5.4.bb
+++ b/meta/recipes-kernel/linux/linux-yocto_5.4.bb
@@ -12,16 +12,16 @@ KBRANCH_qemux86  ?= "v5.4/standard/base"
 KBRANCH_qemux86-64 ?= "v5.4/standard/base"
 KBRANCH_qemumips64 ?= "v5.4/standard/mti-malta64"
 
-SRCREV_machine_qemuarm ?= "c1b3bf44c81e3c46ad58289bb2448864367163ac"
-SRCREV_machine_qemuarm64 ?= "25136e7cd245182ff8287426c459e5b7b1c0939b"
-SRCREV_machine_qemumips ?= "2d5c012de1588897338ef93e259fe5266876018d"
-SRCREV_machine_qemuppc ?= "9c41d8b3be3976d1b752b29bfdfb01013ef72783"
-SRCREV_machine_qemuriscv64 ?= "6e15bad091dbe72ae0ec9cf65a1110afb5e45a5e"
-SRCREV_machine_qemux86 ?= "6e15bad091dbe72ae0ec9cf65a1110afb5e45a5e"
-SRCREV_machine_qemux86-64 ?= "6e15bad091dbe72ae0ec9cf65a1110afb5e45a5e"
-SRCREV_machine_qemumips64 ?= "18bfd88fbfbc9de8a2ae219fabd724d633459ab8"
-SRCREV_machine ?= "6e15bad091dbe72ae0ec9cf65a1110afb5e45a5e"
-SRCREV_meta ?= "e14d587eec888fba8693da2a072f729219acfb41"
+SRCREV_machine_qemuarm ?= "7a9ca83b483c096e6bd5e1b99cca7fe2fb79fd1a"
+SRCREV_machine_qemuarm64 ?= "d2ea3664c5872b3046a2aa970035de51e359922f"
+SRCREV_machine_qemumips ?= "118685bb5211a7740de6bd419c68eb34728f8770"
+SRCREV_machine_qemuppc ?= "7e8785640416d3c6382f91a3f88e0eca14f0a8b5"
+SRCREV_machine_qemuriscv64 ?= "d54d61f9e363806a987c9ab01df0e66a31d4ead5"
+SRCREV_machine_qemux86 ?= "d54d61f9e363806a987c9ab01df0e66a31d4ead5"
+SRCREV_machine_qemux86-64 ?= "d54d61f9e363806a987c9ab01df0e66a31d4ead5"
+SRCREV_machine_qemumips64 ?= "bd5e23a14522aa81e0f0ee37f976edd108669eb5"
+SRCREV_machine ?= "d54d61f9e363806a987c9ab01df0e66a31d4ead5"
+SRCREV_meta ?= "9e3ab4e615b651c1b63d4f0cce71da79a3e89763"
 
 # remap qemuarm to qemuarma15 for the 5.4 kernel
 # KMACHINE_qemuarm ?= "qemuarma15"
@@ -30,7 +30,7 @@ SRC_URI = "git://git.yoctoproject.org/linux-yocto.git;name=machine;branch=${KBRA
            git://git.yoctoproject.org/yocto-kernel-cache;type=kmeta;name=meta;branch=yocto-5.4;destsuffix=${KMETA}"
 
 LIC_FILES_CHKSUM = "file://COPYING;md5=bbea815ee2795b2f4230826c0c6b8814"
-LINUX_VERSION ?= "5.4.150"
+LINUX_VERSION ?= "5.4.153"
 
 DEPENDS += "${@bb.utils.contains('ARCH', 'x86', 'elfutils-native', '', d)}"
 DEPENDS += "openssl-native util-linux-native"
-- 
2.19.1


