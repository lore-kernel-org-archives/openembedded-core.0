Return-Path: <bruce.ashfield@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id CA128CDB484
	for <webhook@archiver.kernel.org>; Thu, 12 Oct 2023 17:39:13 +0000 (UTC)
Received: from mail-vk1-f177.google.com (mail-vk1-f177.google.com [209.85.221.177])
 by mx.groups.io with SMTP id smtpd.web11.18925.1697132353211485743
 for <openembedded-core@lists.openembedded.org>;
 Thu, 12 Oct 2023 10:39:13 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20230601 header.b=fScvGzaZ;
 spf=pass (domain: gmail.com, ip: 209.85.221.177, mailfrom: bruce.ashfield@gmail.com)
Received: by mail-vk1-f177.google.com with SMTP id 71dfb90a1353d-4a4021adbc7so494589e0c.2
        for <openembedded-core@lists.openembedded.org>; Thu, 12 Oct 2023 10:39:13 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1697132352; x=1697737152; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=IA1lhvOFWXma1z6+jSf/kWhoIFodlR6H3w4FrI0TJz8=;
        b=fScvGzaZNmHE7RH0V+LBj/y6vv7lpK4jM4uuw44HccSDpCR7hxFXDWqKUUUIpHn9CB
         wsi9jxaU0uP5Xe3iZXqDrMZRphx7QeNGAsTQe/JaqPCJKJqkSIxyToeobN6AgiZbpWLp
         eJOPM0WeGrIlEp5z2OSb/oi6sAAx4sGPuQRHl/5wJzm3nm/41o3QtDR3g/r46cn20QH0
         3QSsqsLDTx0qoLmEyLmBx4JHtTFkH+6CyzDna9WbY9BAbafqX5Co3wntaetBmoHWdIr5
         rIPbEuA4PqOyHaVF0QFAmHo1QpQ5t4StSK3sj5xJrd7BkPUa0X9TuFGAKHBqDopMCW+3
         eZHQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1697132352; x=1697737152;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=IA1lhvOFWXma1z6+jSf/kWhoIFodlR6H3w4FrI0TJz8=;
        b=H004bzrqc5MYsPoFGtvnOElgxcokVegRds2LHj61//thzAP09NgWE5izPb1y/L1Uay
         8wJxMJPr0CqeGAAqOi93XKrHhNxMlHL51KAQjEO243vldAQvekTazZF8ac4b62Abc3hL
         gc3I8LxhO1UsaOwlgpMKpJN/ODlIzNlq4PNA1amhPP6L2SiZoGxhpMjvDaOn91YF1YYr
         IfCzeKNinpoJpUpvfB0vPzUJ0BUh5x15GIQ+xqy9nvd8vhA5WqCoGyvZh7bRWrw+Rg1p
         cp1jYYZC5VqB50oMrUohDXXu37apJp8hkOD0r4dmKoGteGh4XWX/GU0Zpc+MJlOSTnUc
         YBeQ==
X-Gm-Message-State: AOJu0YyRlnG0GfpAiP7IBDxEqhrMKy75HB5Ka0IDXV7euVSdZqQMjsao
	S0nAnR3Q56xSHgSf3T+0pcvw2QqXRRNJhosL
X-Google-Smtp-Source: AGHT+IG1M30QmMOhldMWFQMVbW8AExQEwhCgpvYhTvyl+1YsD08V+EuVxam3U/2WQfyuUMTk7MNC3g==
X-Received: by 2002:a1f:ca83:0:b0:49d:8fc1:3fce with SMTP id a125-20020a1fca83000000b0049d8fc13fcemr20953857vkg.0.1697132352010;
        Thu, 12 Oct 2023 10:39:12 -0700 (PDT)
Received: from build.lan ([174.112.183.231])
        by smtp.gmail.com with ESMTPSA id hb11-20020a05622a2b4b00b0041969bc2e4csm6385283qtb.32.2023.10.12.10.39.11
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 12 Oct 2023 10:39:11 -0700 (PDT)
From: bruce.ashfield@gmail.com
To: richard.purdie@linuxfoundation.org
Cc: openembedded-core@lists.openembedded.org
Subject: [PATCH 6/7] linux-yocto/6.5: update to v6.5.7
Date: Thu, 12 Oct 2023 13:39:01 -0400
Message-Id: <d4cfe53698b548a9f3c10f17a215a443d0003377.1697132218.git.bruce.ashfield@gmail.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <cover.1697132218.git.bruce.ashfield@gmail.com>
References: <cover.1697132218.git.bruce.ashfield@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Thu, 12 Oct 2023 17:39:13 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/189017

From: Bruce Ashfield <bruce.ashfield@gmail.com>

Updating  to the latest korg -stable release that comprises
the following commits:

    121c6addffd7 Linux 6.5.7
    76b33722e2d2 xen/events: replace evtchn_rwlock with RCU
    2c5d952fd638 RDMA/mlx5: Remove not-used cache disable flag
    4e2d581535c3 ksmbd: fix race condition from parallel smb2 lock requests
    d5b0e9d3563e ksmbd: fix uaf in smb20_oplock_break_ack
    18ced78b0ebc ksmbd: fix race condition between session lookup and expire
    f35c0756029f x86/sev: Use the GHCB protocol when available for SNP CPUID requests
    225d28de3fc3 x86/sev: Change npages to unsigned long in snp_accept_memory()
    783142da9733 RDMA/mlx5: Fix NULL string error
    aa727bb7bd5b RDMA/mlx5: Fix mutex unlocking on error flow for steering anchor creation
    6dd42618ffdd RDMA/mlx5: Fix assigning access flags to cache mkeys
    42ec848172ef RDMA/mlx5: Fix mkey cache possible deadlock on cleanup
    eeafc50a77f6 RDMA/siw: Fix connection failure handling
    05a10b316ada RDMA/srp: Do not call scsi_done() from srp_abort()
    e2399007f48d RDMA/uverbs: Fix typo of sizeof argument
    56c479ba38d8 RDMA/bnxt_re: Fix the handling of control path response data
    13ac926cd4b8 RDMA/cma: Fix truncation compilation warning in make_cma_ports
    3769e0a2eb68 RDMA/cma: Initialize ib_sa_multicast structure to 0 when join
    4d7d35bead51 gpio: pxa: disable pinctrl calls for MMP_GPIO
    82c3535932b6 gpio: aspeed: fix the GPIO number passed to pinctrl_gpio_set_config()
    a6c281be4e90 IB/mlx4: Fix the size of a buffer in add_port_entries()
    641c751ff120 of: dynamic: Fix potential memory leak in of_changeset_action()
    d419280f5930 RDMA/core: Require admin capabilities to set system parameters
    f4a0655253e5 dm zoned: free dmz->ddev array in dmz_put_zoned_devices
    161fa3dfd5d7 parisc: Fix crash with nr_cpus=1 option
    c9969a3d310d smb: use kernel_connect() and kernel_bind()
    0779db586333 parisc: Restore __ldcw_align for PA-RISC 2.0 processors
    1c31067bbe60 net: lan743x: also select PHYLIB
    60fb3f054c99 HID: intel-ish-hid: ipc: Disable and reenable ACPI GPE bit
    77a4f974594d HID: sony: remove duplicate NULL check before calling usb_free_urb()
    e0ae4814bf7d HID: nvidia-shield: Fix a missing led_classdev_unregister() in the probe error handling path
    eba44cd30948 net: mana: Fix oversized sge0 for GSO packets
    5a98b9dd9981 net: mana: Fix the tso_bytes calculation
    d0a4acf3d4e6 netlink: annotate data-races around sk->sk_err
    cd94c38d0356 sctp: update hb timer immediately after users change hb_interval
    3af9df4a7157 sctp: update transport state when processing a dupcook packet
    e86ed5217950 tcp: fix delayed ACKs for MSS boundary condition
    155cfe05b93b tcp: fix quick-ack counting to count actual ACKs of new data
    aa1a21681b94 tipc: fix a potential deadlock on &tx->lock
    e593dfa68217 net: stmmac: dwmac-stm32: fix resume on STM32 MCU
    8a81cc801fb5 ipv4: Set offload_failed flag in fibmatch results
    ef27753052ef netfilter: nf_tables: nft_set_rbtree: fix spurious insertion failure
    5cf82197d989 netfilter: nf_tables: Deduplicate nft_register_obj audit logs
    eb8c0e75dac6 selftests: netfilter: Extend nft_audit.sh
    598f66b0324e selftests: netfilter: Test nf_tables audit logging
    f3c7e620b2af netfilter: handle the connecting collision properly in nf_conntrack_proto_sctp
    3f6a5636a966 netfilter: nft_payload: rebuild vlan header on h_proto access
    ea7594eb2d73 ibmveth: Remove condition to recompute TCP header checksum.
    4e2eb2cdfbff net: ethernet: ti: am65-cpsw: Fix error code in am65_cpsw_nuss_init_tx_chns()
    32b9e35b8857 rswitch: Fix PHY station management clock setting
    19b076e8b946 net: renesas: rswitch: Add spin lock protection for irq {un}mask
    29c16c2bf586 net: nfc: llcp: Add lock when modifying device list
    ac2c5dea3dd5 ethtool: plca: fix plca enable data type while parsing the value
    4931e80da946 net: usb: smsc75xx: Fix uninit-value access in __smsc75xx_read_reg
    ebee8434080c ipv6: tcp: add a missing nf_reset_ct() in 3WHS handling
    c7f31ffe3479 ovl: fetch inode once in ovl_dentry_revalidate_common()
    9f5f1de1a6b5 ovl: move freeing ovl_entry past rcu delay
    ee049d5e2eb6 net: dsa: mv88e6xxx: Avoid EEPROM timeout when EEPROM is absent
    7a378171fdd6 ptp: ocp: Fix error handling in ptp_ocp_device_init
    fe80658c08e3 ipv4, ipv6: Fix handling of transhdrlen in __ip{,6}_append_data()
    33b4b5b04005 neighbour: fix data-races around n->output
    a75152d23337 net: fix possible store tearing in neigh_periodic_work()
    135042be7bec net: stmmac: platform: fix the incorrect parameter
    fa5ffd507fe8 modpost: add missing else to the "of" check
    ded6e448028f bpf, sockmap: Reject sk_msg egress redirects to non-TCP sockets
    f4b72d69213b bpf, sockmap: Do not inc copied_seq when PEEK flag set
    fc5c5d7e07b2 bpf: tcp_read_skb needs to pop skb regardless of seq
    576b8329390b ice: always add legacy 32byte RXDID in supported_rxdids
    b60b508f14df NFSv4: Fix a nfs4_state_manager() race
    98bd9c02c2b5 ima: rework CONFIG_IMA dependency block
    5a44dd7b0930 scsi: target: core: Fix deadlock due to recursive locking
    3c0a2419e8be wifi: iwlwifi: mvm: Fix incorrect usage of scan API
    acf11f64c29f ima: Finish deprecation of IMA_TRUSTED_KEYRING Kconfig
    dfce40151dcf regulator/core: regulator_register: set device->class earlier
    9a7786e4aea6 wifi: mac80211: Create resources for disabled links
    cda3dc63d845 iommu/mediatek: Fix share pgtable for iova over 4GB
    c9525513cab1 perf/x86/amd: Do not WARN() on every IRQ
    65c72a720170 wifi: mac80211: fix potential key use-after-free
    bdd83fc0a5a9 regmap: rbtree: Fix wrong register marked as in-cache when creating new node
    319bee0595df rtla/timerlat: Do not stop user-space if a cpu is offline
    33699a00b89d perf/x86/amd/core: Fix overflow reset on hotplug
    0e656b05ca2b wifi: mt76: mt76x02: fix MT76x0 external LNA gain handling
    fcc632935e4f drivers/net: process the result of hdlc_open() and add call of hdlc_close() in uhdlc_close()
    7fb2ea6e0676 Bluetooth: ISO: Fix handling of listen for unicast
    d619794c30d2 Bluetooth: Fix hci_link_tx_to RCU lock usage
    377a6f42d816 Bluetooth: Delete unused hci_req_prepare_suspend() declaration
    6e1e9a9a0f44 regulator: mt6358: split ops for buck and linear range LDO regulators
    cb17c99357c7 bpf: unconditionally reset backtrack_state masks on global func exit
    d71dc1b530c4 bpf: Fix tr dereferencing
    a2235cde5599 leds: Drop BUG_ON check for LED_COLOR_ID_MULTI
    0aa14ce3cc91 s390/bpf: Let arch_prepare_bpf_trampoline return program size
    56c212bb4ede erofs: allow empty device tags in flatdev mode
    7a2ad4a8a54e HID: nvidia-shield: add LEDS_CLASS dependency
    be2ff39b1504 wifi: mwifiex: Fix oob check condition in mwifiex_process_rx_packet
    1e2c796fd992 wifi: mac80211: fix mesh id corruption on 32 bit systems
    e851875c3722 wifi: cfg80211: add missing kernel-doc for cqm_rssi_work
    0f4c9dc8c56f rtla/timerlat_aa: Fix previous IRQ delay for IRQs that happens after thread sample
    fc11bc42d0a6 rtla/timerlat_aa: Fix negative IRQ delay
    d0a2cab40448 rtla/timerlat_aa: Zero thread sum after every sample analysis
    32fb9b7d98c3 wifi: cfg80211: fix cqm_config access race
    f06cdd8d4ba5 wifi: iwlwifi: mvm: Fix a memory corruption issue
    1fb9204d193b wifi: iwlwifi: dbg_ini: fix structure packing
    2cb1b8ed662c iwlwifi: mvm: handle PS changes in vif_cfg_changed
    b57a9f34723a wifi: cfg80211/mac80211: hold link BSSes when assoc fails for MLO connection
    c955751cbf86 erofs: fix memory leak of LZMA global compressed deduplication
    87b9858e4040 ubi: Refuse attaching if mtd's erasesize is 0
    09316923e1a2 wifi: mt76: fix lock dependency problem for wed_lock
    f566efa7de1e HID: sony: Fix a potential memory leak in sony_probe()
    32b0a4ffcaea arm64: errata: Add Cortex-A520 speculative unprivileged load workaround
    58f88d8f13a9 arm64: Add Cortex-A520 CPU part definition
    4ce883abd15c drm/amd: Fix logic error in sienna_cichlid_update_pcie_parameters()
    12c92dd1d1d1 drm/amd: Fix detection of _PR3 on the PCIe root port
    2f92524f5a7f drm/i915: Don't set PIPE_CONTROL_FLUSH_L3 for aux inval
    b704bba4f720 net: prevent rewrite of msg_name in sock_sendmsg()
    750bdf036a79 btrfs: always print transaction aborted messages with an error level
    79a487128c50 io_uring: ensure io_lockdep_assert_cq_locked() handles disabled rings
    fa6a7e0d8b1d io_uring/kbuf: don't allow registered buffer rings on highmem pages
    b0d74112f533 net: replace calls to sock->ops->connect() with kernel_connect()
    044262cf6cf9 platform/x86/intel/ifs: release cpus_read_lock()
    a93a2c72167c PCI: qcom: Fix IPQ8074 enumeration
    709ec9e4dc5c PCI/PM: Mark devices disconnected if upstream PCIe link is down on resume
    bb39b7c7869d md/raid5: release batch_last before waiting for another stripe_head
    3f3164ce6396 io_uring: don't allow IORING_SETUP_NO_MMAP rings on highmem pages
    62aba312578c wifi: mwifiex: Fix tlv_buf_left calculation
    9a32009321e9 wifi: rtw88: rtw8723d: Fix MAC address offset in EEPROM
    2618f005c49a Bluetooth: hci_sync: Fix handling of HCI_QUIRK_STRICT_DUPLICATE_FILTER
    9a9c17c7c554 wifi: brcmfmac: Replace 1-element arrays with flexible arrays
    eea5a8f0c3b7 Bluetooth: hci_codec: Fix leaking content of local_codecs
    074218073f29 qed/red_ll2: Fix undefined behavior bug in struct qed_ll2_info
    0193c5360e5a mptcp: userspace pm allow creating id 0 subflow
    970ca742335d mptcp: fix delegated action races
    fc979719ed4a net: ethernet: mediatek: disable irq before schedule napi
    0bf2b9c2f354 vringh: don't use vringh_kiov_advance() in vringh_iov_xfer()
    a910e0f63047 net: mana: Fix TX CQE error handling
    496c591f0b38 iommu/vt-d: Avoid memory allocation in iommu_suspend()
    8ea106a7f311 scsi: zfcp: Fix a double put in zfcp_port_enqueue()
    577d9e66d20f iommu/apple-dart: Handle DMA_FQ domains in attach_dev()
    0477354fd24d maple_tree: add MAS_UNDERFLOW and MAS_OVERFLOW states
    807e9ed2c6b7 maple_tree: reduce resets during store setup
    9067f1271ae7 iommu/arm-smmu-v3: Avoid constructing invalid range commands
    18c940fbc7c0 net: release reference to inet6_dev pointer
    c59c9d539a44 net: change accept_ra_min_rtr_lft to affect all RA lifetimes
    b2b10fd6d417 net: add sysctl accept_ra_min_rtr_lft
    0b37467cbd2d arm64: cpufeature: Fix CLRBHB and BC detection
    a39c82f6d9cb arm64: add HWCAP for FEAT_HBC (hinted conditional branches)
    ce74aad206ea btrfs: don't clear uptodate on write errors
    1617032af6c4 btrfs: remove end_extent_writepage
    b6075e5c7d74 btrfs: remove btrfs_writepage_endio_finish_ordered
    ea07f51f62c1 ata: libata-scsi: Fix delayed scsi_rescan_device() execution
    96373a5496c1 scsi: Do not attempt to rescan suspended devices
    755b88188022 scsi: core: Improve type safety of scsi_rescan_device()
    6a38c802c17c mptcp: fix dangling connection hang-up
    23a6868ff40b mptcp: rename timer related helper to less confusing names
    84c617b8ce2a mptcp: Remove unnecessary test for __mptcp_init_sock()
    5bba01d9fa78 maple_tree: add mas_is_active() to detect in-tree walks
    457fbd6eb4e4 ASoC: tegra: Fix redundant PLLA and PLLA_OUT0 updates
    cab7a48935cf ASoC: soc-utils: Export snd_soc_dai_is_dummy() symbol

Signed-off-by: Bruce Ashfield <bruce.ashfield@gmail.com>
---
 .../linux/linux-yocto-rt_6.5.bb               |  6 ++--
 .../linux/linux-yocto-tiny_6.5.bb             |  6 ++--
 meta/recipes-kernel/linux/linux-yocto_6.5.bb  | 28 +++++++++----------
 3 files changed, 20 insertions(+), 20 deletions(-)

diff --git a/meta/recipes-kernel/linux/linux-yocto-rt_6.5.bb b/meta/recipes-kernel/linux/linux-yocto-rt_6.5.bb
index 6104caf017..a52115e9d0 100644
--- a/meta/recipes-kernel/linux/linux-yocto-rt_6.5.bb
+++ b/meta/recipes-kernel/linux/linux-yocto-rt_6.5.bb
@@ -14,13 +14,13 @@ python () {
         raise bb.parse.SkipRecipe("Set PREFERRED_PROVIDER_virtual/kernel to linux-yocto-rt to enable it")
 }
 
-SRCREV_machine ?= "ce1898ae324b07c07206c71cd7dd41d03ddc1348"
-SRCREV_meta ?= "b8c36f31e96bed0b017f07ef3285123f81d0faa0"
+SRCREV_machine ?= "a97a5e39ecfb8213e1a8f3065f81de1c1027eb4b"
+SRCREV_meta ?= "560dad4d406f3134cc55788513be5cecea54a03f"
 
 SRC_URI = "git://git.yoctoproject.org/linux-yocto.git;branch=${KBRANCH};name=machine;protocol=https \
            git://git.yoctoproject.org/yocto-kernel-cache;type=kmeta;name=meta;branch=yocto-6.5;destsuffix=${KMETA};protocol=https"
 
-LINUX_VERSION ?= "6.5.6"
+LINUX_VERSION ?= "6.5.7"
 
 LIC_FILES_CHKSUM = "file://COPYING;md5=6bc538ed5bd9a7fc9398086aedcd7e46"
 
diff --git a/meta/recipes-kernel/linux/linux-yocto-tiny_6.5.bb b/meta/recipes-kernel/linux/linux-yocto-tiny_6.5.bb
index 4ade5062fd..c41e9211a1 100644
--- a/meta/recipes-kernel/linux/linux-yocto-tiny_6.5.bb
+++ b/meta/recipes-kernel/linux/linux-yocto-tiny_6.5.bb
@@ -8,7 +8,7 @@ require recipes-kernel/linux/linux-yocto.inc
 # CVE exclusions
 include recipes-kernel/linux/cve-exclusion_6.5.inc
 
-LINUX_VERSION ?= "6.5.6"
+LINUX_VERSION ?= "6.5.7"
 LIC_FILES_CHKSUM = "file://COPYING;md5=6bc538ed5bd9a7fc9398086aedcd7e46"
 
 DEPENDS += "${@bb.utils.contains('ARCH', 'x86', 'elfutils-native', '', d)}"
@@ -17,8 +17,8 @@ DEPENDS += "openssl-native util-linux-native"
 KMETA = "kernel-meta"
 KCONF_BSP_AUDIT_LEVEL = "2"
 
-SRCREV_machine ?= "a923d8834d771a66938eafbb306ba1ba27fe3b17"
-SRCREV_meta ?= "b8c36f31e96bed0b017f07ef3285123f81d0faa0"
+SRCREV_machine ?= "d04f80df11f7aabc7fc7eb35215731c8027b8c36"
+SRCREV_meta ?= "560dad4d406f3134cc55788513be5cecea54a03f"
 
 PV = "${LINUX_VERSION}+git"
 
diff --git a/meta/recipes-kernel/linux/linux-yocto_6.5.bb b/meta/recipes-kernel/linux/linux-yocto_6.5.bb
index e8bacf0dbe..0203965a5f 100644
--- a/meta/recipes-kernel/linux/linux-yocto_6.5.bb
+++ b/meta/recipes-kernel/linux/linux-yocto_6.5.bb
@@ -18,25 +18,25 @@ KBRANCH:qemux86-64 ?= "v6.5/standard/base"
 KBRANCH:qemuloongarch64  ?= "v6.5/standard/base"
 KBRANCH:qemumips64 ?= "v6.5/standard/mti-malta64"
 
-SRCREV_machine:qemuarm ?= "4de408a1596ac4035a54580aa639715f1e79e6a4"
-SRCREV_machine:qemuarm64 ?= "a923d8834d771a66938eafbb306ba1ba27fe3b17"
-SRCREV_machine:qemuloongarch64 ?= "a923d8834d771a66938eafbb306ba1ba27fe3b17"
-SRCREV_machine:qemumips ?= "7c93410587a81d4867c606454133b1be4d6376a8"
-SRCREV_machine:qemuppc ?= "a923d8834d771a66938eafbb306ba1ba27fe3b17"
-SRCREV_machine:qemuriscv64 ?= "a923d8834d771a66938eafbb306ba1ba27fe3b17"
-SRCREV_machine:qemuriscv32 ?= "a923d8834d771a66938eafbb306ba1ba27fe3b17"
-SRCREV_machine:qemux86 ?= "a923d8834d771a66938eafbb306ba1ba27fe3b17"
-SRCREV_machine:qemux86-64 ?= "a923d8834d771a66938eafbb306ba1ba27fe3b17"
-SRCREV_machine:qemumips64 ?= "a47a17e0dc4753b39804de29aedbc67db90d8a3a"
-SRCREV_machine ?= "a923d8834d771a66938eafbb306ba1ba27fe3b17"
-SRCREV_meta ?= "b8c36f31e96bed0b017f07ef3285123f81d0faa0"
+SRCREV_machine:qemuarm ?= "ba4066c2d3b04b28a9e97bc069ae10cd900ad314"
+SRCREV_machine:qemuarm64 ?= "d04f80df11f7aabc7fc7eb35215731c8027b8c36"
+SRCREV_machine:qemuloongarch64 ?= "d04f80df11f7aabc7fc7eb35215731c8027b8c36"
+SRCREV_machine:qemumips ?= "fbf038597ca02cf012ba540506fc66c91ffe9df9"
+SRCREV_machine:qemuppc ?= "d04f80df11f7aabc7fc7eb35215731c8027b8c36"
+SRCREV_machine:qemuriscv64 ?= "d04f80df11f7aabc7fc7eb35215731c8027b8c36"
+SRCREV_machine:qemuriscv32 ?= "d04f80df11f7aabc7fc7eb35215731c8027b8c36"
+SRCREV_machine:qemux86 ?= "d04f80df11f7aabc7fc7eb35215731c8027b8c36"
+SRCREV_machine:qemux86-64 ?= "d04f80df11f7aabc7fc7eb35215731c8027b8c36"
+SRCREV_machine:qemumips64 ?= "b21628ab2abaa55e3fcc086fb8b253fac10477ff"
+SRCREV_machine ?= "d04f80df11f7aabc7fc7eb35215731c8027b8c36"
+SRCREV_meta ?= "560dad4d406f3134cc55788513be5cecea54a03f"
 
 # set your preferred provider of linux-yocto to 'linux-yocto-upstream', and you'll
 # get the <version>/base branch, which is pure upstream -stable, and the same
 # meta SRCREV as the linux-yocto-standard builds. Select your version using the
 # normal PREFERRED_VERSION settings.
 BBCLASSEXTEND = "devupstream:target"
-SRCREV_machine:class-devupstream ?= "0c3f363d1c150050b2ecec2af04f3c96fa2c66de"
+SRCREV_machine:class-devupstream ?= "121c6addffd71815cbd333baf409be682e2e148f"
 PN:class-devupstream = "linux-yocto-upstream"
 KBRANCH:class-devupstream = "v6.5/base"
 
@@ -44,7 +44,7 @@ SRC_URI = "git://git.yoctoproject.org/linux-yocto.git;name=machine;branch=${KBRA
            git://git.yoctoproject.org/yocto-kernel-cache;type=kmeta;name=meta;branch=yocto-6.5;destsuffix=${KMETA};protocol=https"
 
 LIC_FILES_CHKSUM = "file://COPYING;md5=6bc538ed5bd9a7fc9398086aedcd7e46"
-LINUX_VERSION ?= "6.5.6"
+LINUX_VERSION ?= "6.5.7"
 
 PV = "${LINUX_VERSION}+git"
 
-- 
2.34.1


