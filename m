Return-Path: <bruce.ashfield@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id BF726CDB46E
	for <webhook@archiver.kernel.org>; Thu, 12 Oct 2023 17:39:23 +0000 (UTC)
Received: from mail-qt1-f181.google.com (mail-qt1-f181.google.com [209.85.160.181])
 by mx.groups.io with SMTP id smtpd.web10.18843.1697132353827021320
 for <openembedded-core@lists.openembedded.org>;
 Thu, 12 Oct 2023 10:39:14 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20230601 header.b=FB1FAURs;
 spf=pass (domain: gmail.com, ip: 209.85.160.181, mailfrom: bruce.ashfield@gmail.com)
Received: by mail-qt1-f181.google.com with SMTP id d75a77b69052e-41b2bf4e9edso20236171cf.1
        for <openembedded-core@lists.openembedded.org>; Thu, 12 Oct 2023 10:39:13 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1697132353; x=1697737153; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=lDlphx13tLoI0Eqq2gwSL/Ww4fBSNowPo6URRAMF850=;
        b=FB1FAURsBIeOwakCkjMBXOnOTbwNM/Iy0DBTCK+OPn2WrRCZ9HIjWxEb+AAEJlmaHC
         oZisL0msxVYvJHukH7txQGuzkq5ZURiHXEClJmjCURYml/uIgbeAH/K70waDbgyi46LK
         +3IuNJZMLkdJ/MUNtZc8Uc0r+mWPTIXeXprqe7vYq7QPyeHYg84FrF8+WdT9+A7RX/53
         cqgeuwmw32YL6LsR1TPOwRmWNMVC/7P63BLODj9kyDeoHJYmDULQLTK7rnz7UaoTbC6G
         x1Untti8Qmh+nAsDu31rBo3Ua5ZAwf30x5yF/vcbPKuHSEd1OWLGKcvoNZTJ7dIy+qa6
         msgw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1697132353; x=1697737153;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=lDlphx13tLoI0Eqq2gwSL/Ww4fBSNowPo6URRAMF850=;
        b=tTQIU2+AvPHKwvPWmgZATqzF0UWTF9+W6e01sAfZkdCmGhrvrEG76fAaMKQOIpT9Lk
         gG/Jx/qDu6+IuEoL844JLmx/n8Y7uLA4Ht0OGg739IvaUaRsLV1JtCP5hfMkAiniKamp
         tQK53TJ9MPVGjV9K1nbPjoSyDRXQM4MCGT13cJ/qjL1Y3gEuPvo1YcRnnW4P2rOpX6FL
         ea6ptdcOfaHQ5eWvbgTfBESJQb4ABvfaROFjh/e8DF/oRGvvojRoHi1P3WLHThfRYbG+
         yArBsf0as/q+i6w4CB/gAiNWkzxRY46iRzazo2LppFlferlWpXny6nC2ha+tfF/PYGqR
         LRiQ==
X-Gm-Message-State: AOJu0YxlKNcZbTFvHASFxkqGQQVFnc+H5njf4UEpS+PWHWPh6iXDUmWI
	9hhujazpwXTQ9b+ZsQRTCUVAfqd5AHblCZzG
X-Google-Smtp-Source: AGHT+IFPNHrtk5OgDSgJpd0cFWR7YsZDuNBWFLHXkNO3SSsY5GlaZFT5BtOG82g9yL8z2JwL7Fjg1g==
X-Received: by 2002:a05:622a:18a0:b0:412:c81:efe2 with SMTP id v32-20020a05622a18a000b004120c81efe2mr29885873qtc.31.1697132352734;
        Thu, 12 Oct 2023 10:39:12 -0700 (PDT)
Received: from build.lan ([174.112.183.231])
        by smtp.gmail.com with ESMTPSA id hb11-20020a05622a2b4b00b0041969bc2e4csm6385283qtb.32.2023.10.12.10.39.12
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 12 Oct 2023 10:39:12 -0700 (PDT)
From: bruce.ashfield@gmail.com
To: richard.purdie@linuxfoundation.org
Cc: openembedded-core@lists.openembedded.org
Subject: [PATCH 7/7] linux-yocto/6.1: update to v6.1.57
Date: Thu, 12 Oct 2023 13:39:02 -0400
Message-Id: <283d827a3c223e3ff5e16993d9cce768519cff92.1697132218.git.bruce.ashfield@gmail.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <cover.1697132218.git.bruce.ashfield@gmail.com>
References: <cover.1697132218.git.bruce.ashfield@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Thu, 12 Oct 2023 17:39:23 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/189018

From: Bruce Ashfield <bruce.ashfield@gmail.com>

Updating  to the latest korg -stable release that comprises
the following commits:

    082280fe94a0 Linux 6.1.57
    a4cc925e2e12 xen/events: replace evtchn_rwlock with RCU
    a4fcf8a242c6 ipv6: remove one read_lock()/read_unlock() pair in rt6_check_neigh()
    6e4c40aa270b btrfs: file_remove_privs needs an exclusive lock in direct io write
    ff81d1c77d08 netlink: remove the flex array from struct nlmsghdr
    6cd57f5c7795 btrfs: fix fscrypt name leak after failure to join log transaction
    6d05a1a7a484 btrfs: fix an error handling path in btrfs_rename()
    5aaa45025f9f vrf: Fix lockdep splat in output path
    fd32f1eee6c0 ipv6: remove nexthop_fib6_nh_bh()
    edeccce85cbe parisc: Restore __ldcw_align for PA-RISC 2.0 processors
    8226ffc759ea ksmbd: fix uaf in smb20_oplock_break_ack
    a2ca5fd3dbcc ksmbd: fix race condition between session lookup and expire
    64301a935462 x86/sev: Use the GHCB protocol when available for SNP CPUID requests
    76b6a980e85f RDMA/mlx5: Fix NULL string error
    26eb1307c704 RDMA/mlx5: Fix mutex unlocking on error flow for steering anchor creation
    5cf38e638e5d RDMA/siw: Fix connection failure handling
    2b298f918158 RDMA/srp: Do not call scsi_done() from srp_abort()
    c54204d7960f RDMA/uverbs: Fix typo of sizeof argument
    233229fa577a RDMA/cma: Fix truncation compilation warning in make_cma_ports
    39f701870114 RDMA/cma: Initialize ib_sa_multicast structure to 0 when join
    52b0bb7139c9 gpio: pxa: disable pinctrl calls for MMP_GPIO
    d09e467491b2 gpio: aspeed: fix the GPIO number passed to pinctrl_gpio_set_config()
    7e47a8419da6 IB/mlx4: Fix the size of a buffer in add_port_entries()
    315ae630502c of: dynamic: Fix potential memory leak in of_changeset_action()
    9c480fb41aa4 RDMA/core: Require admin capabilities to set system parameters
    f60287b2d240 dm zoned: free dmz->ddev array in dmz_put_zoned_devices
    485f0bac83a6 parisc: Fix crash with nr_cpus=1 option
    c9c110ce3754 smb: use kernel_connect() and kernel_bind()
    ec02b892237d intel_idle: add Emerald Rapids Xeon support
    cdcc04e844a2 HID: intel-ish-hid: ipc: Disable and reenable ACPI GPE bit
    07c6338acb15 HID: sony: remove duplicate NULL check before calling usb_free_urb()
    40d609b6ad90 netlink: annotate data-races around sk->sk_err
    0915de8c6083 netlink: Fix potential skb memleak in netlink_ack
    1a6e2da05f37 netlink: split up copies in the ack construction
    220f0f866d69 sctp: update hb timer immediately after users change hb_interval
    63cb52e75fd1 sctp: update transport state when processing a dupcook packet
    419b2c5766fa tcp: fix delayed ACKs for MSS boundary condition
    4acf07bafb58 tcp: fix quick-ack counting to count actual ACKs of new data
    143e72757a90 tipc: fix a potential deadlock on &tx->lock
    f2697457ab73 net: stmmac: dwmac-stm32: fix resume on STM32 MCU
    da7fa17bd9ac ipv4: Set offload_failed flag in fibmatch results
    56a6ea76dd9b netfilter: nf_tables: nft_set_rbtree: fix spurious insertion failure
    7ff9a9857b8b netfilter: nf_tables: Deduplicate nft_register_obj audit logs
    e1bbe4afe1a3 selftests: netfilter: Extend nft_audit.sh
    82273f15e3db selftests: netfilter: Test nf_tables audit logging
    00d35e6b1672 netfilter: handle the connecting collision properly in nf_conntrack_proto_sctp
    6e1dbbf29031 ibmveth: Remove condition to recompute TCP header checksum.
    2428c557cd62 net: ethernet: ti: am65-cpsw: Fix error code in am65_cpsw_nuss_init_tx_chns()
    7562780e32b8 net: nfc: llcp: Add lock when modifying device list
    9ffc5018020f net: usb: smsc75xx: Fix uninit-value access in __smsc75xx_read_reg
    7f042041360e ipv6: tcp: add a missing nf_reset_ct() in 3WHS handling
    a003d4994088 net: dsa: mv88e6xxx: Avoid EEPROM timeout when EEPROM is absent
    6a91ec7cfd0e ptp: ocp: Fix error handling in ptp_ocp_device_init
    f6a7182179c0 ipv4, ipv6: Fix handling of transhdrlen in __ip{,6}_append_data()
    a8ed1b2e1674 neighbour: fix data-races around n->output
    2b76aad68b30 neighbour: switch to standard rcu, instead of rcu_bh
    0526933c1005 neighbour: annotate lockless accesses to n->nud_state
    8904d8848b31 bpf: Add BPF_FIB_LOOKUP_SKIP_NEIGH for bpf_fib_lookup
    f82aac816287 net: fix possible store tearing in neigh_periodic_work()
    8ef7f9acbe8e modpost: add missing else to the "of" check
    b8f97e47b6fb bpf, sockmap: Reject sk_msg egress redirects to non-TCP sockets
    c024db960301 bpf, sockmap: Do not inc copied_seq when PEEK flag set
    46052a98854a bpf: tcp_read_skb needs to pop skb regardless of seq
    99fe9a120729 NFSv4: Fix a nfs4_state_manager() race
    23acd1784eb5 ima: rework CONFIG_IMA dependency block
    6c5d7f541693 scsi: target: core: Fix deadlock due to recursive locking
    f23c35f0686c ima: Finish deprecation of IMA_TRUSTED_KEYRING Kconfig
    937ec4434e0a regulator/core: regulator_register: set device->class earlier
    fbac416e25ef iommu/mediatek: Fix share pgtable for iova over 4GB
    183e0f9da6af perf/x86/amd: Do not WARN() on every IRQ
    2f4e16e39e4f wifi: mac80211: fix potential key use-after-free
    89192c6cbe0f regmap: rbtree: Fix wrong register marked as in-cache when creating new node
    e485a69d9b44 perf/x86/amd/core: Fix overflow reset on hotplug
    6150d4596861 wifi: mt76: mt76x02: fix MT76x0 external LNA gain handling
    b9eded289bea drivers/net: process the result of hdlc_open() and add call of hdlc_close() in uhdlc_close()
    6bfc4c7043c8 Bluetooth: ISO: Fix handling of listen for unicast
    c201d944bc38 Bluetooth: Delete unused hci_req_prepare_suspend() declaration
    b46384a681a8 regulator: mt6358: split ops for buck and linear range LDO regulators
    a01576f58b19 regulator: mt6358: Use linear voltage helpers for single range regulators
    c6ac402567e4 regulator: mt6358: Drop *_SSHUB regulators
    163042a01544 bpf: Fix tr dereferencing
    c14c7214fc68 leds: Drop BUG_ON check for LED_COLOR_ID_MULTI
    6b706286473d wifi: mwifiex: Fix oob check condition in mwifiex_process_rx_packet
    42970d32fe1e wifi: cfg80211: add missing kernel-doc for cqm_rssi_work
    c797498e860e wifi: cfg80211: fix cqm_config access race
    3fcc6d7d5f40 wifi: cfg80211: add a work abstraction with special semantics
    2ae4585f740a wifi: cfg80211: move wowlan disable under locks
    fb195ff4183a wifi: cfg80211: hold wiphy lock in auto-disconnect
    6b3223449c95 wifi: iwlwifi: mvm: Fix a memory corruption issue
    78b5c62edeea wifi: iwlwifi: dbg_ini: fix structure packing
    6a5a8f0a9740 erofs: fix memory leak of LZMA global compressed deduplication
    91aeb418b917 ubi: Refuse attaching if mtd's erasesize is 0
    f237b17611fa HID: sony: Fix a potential memory leak in sony_probe()
    6e3ae2927b43 arm64: errata: Add Cortex-A520 speculative unprivileged load workaround
    0a4ae2634801 arm64: Add Cortex-A520 CPU part definition
    d2894c4f473a drm/amd: Fix logic error in sienna_cichlid_update_pcie_parameters()
    c8bd3e12b329 drm/amd: Fix detection of _PR3 on the PCIe root port
    fc8d9630c80b net: prevent rewrite of msg_name in sock_sendmsg()
    34f9370ae444 net: replace calls to sock->ops->connect() with kernel_connect()
    2dfb5f324d79 PCI: qcom: Fix IPQ8074 enumeration
    ebf2d9a7822b md/raid5: release batch_last before waiting for another stripe_head
    c404d39e7749 wifi: mwifiex: Fix tlv_buf_left calculation
    794ae3a9f8fe Bluetooth: hci_sync: Fix handling of HCI_QUIRK_STRICT_DUPLICATE_FILTER
    626535077ba9 Bluetooth: hci_codec: Fix leaking content of local_codecs
    01afbfb39585 qed/red_ll2: Fix undefined behavior bug in struct qed_ll2_info
    454bb54b8fe8 mptcp: userspace pm allow creating id 0 subflow
    4674e9626beb net: ethernet: mediatek: disable irq before schedule napi
    3a72decd6b49 vringh: don't use vringh_kiov_advance() in vringh_iov_xfer()
    c12ef025add7 iommu/vt-d: Avoid memory allocation in iommu_suspend()
    cdf18e75850f scsi: zfcp: Fix a double put in zfcp_port_enqueue()
    ef167cc1882f i40e: fix the wrong PTP frequency calculation
    a0829d9cf22e hwmon: (nzxt-smart2) add another USB ID
    6ddb9e6b9b6a hwmon: (nzxt-smart2) Add device id
    752ec2d93e75 block: fix use-after-free of q->q_usage_counter
    77d0e7e8e582 rbd: take header_rwsem in rbd_dev_refresh() only when updating
    698039a461a3 rbd: decouple parent info read-in from updating rbd_dev
    377d26174e1d rbd: decouple header read-in from updating rbd_dev->header
    33ecf5f5a876 rbd: move rbd_dev_refresh() definition
    ff09fa5f23aa iommu/arm-smmu-v3: Avoid constructing invalid range commands
    357ba59b9d3b iommu/arm-smmu-v3: Set TTL invalidation hint better
    71472872932b drm/amd/display: Adjust the MST resume flow
    b0fe37867455 arm64: cpufeature: Fix CLRBHB and BC detection
    b6912642746d net: release reference to inet6_dev pointer
    bad004c384b7 net: change accept_ra_min_rtr_lft to affect all RA lifetimes
    ec4162bb7018 net: add sysctl accept_ra_min_rtr_lft
    9d91134c165f arm64: Avoid repeated AA64MMFR1_EL1 register read on pagefault path
    dd8c8369305d Revert "NFSv4: Retry LOCK on OLD_STATEID during delegation return"
    ef54db5b5df7 btrfs: use struct fscrypt_str instead of struct qstr
    68ad364ec8dd btrfs: setup qstr from dentrys using fscrypt helper
    1cf474cd474b btrfs: use struct qstr instead of name and namelen pairs
    87efd87d3624 ring-buffer: Fix bytes info in per_cpu buffer stats
    62eed43e0390 ring-buffer: remove obsolete comment for free_buffer_page()
    836adaddc60c mm: page_alloc: fix CMA and HIGHATOMIC landing on the wrong buddy list
    d1da921452b3 mm/page_alloc: leave IRQs enabled for per-cpu page allocations
    570786ac6f04 mm/page_alloc: always remove pages from temporary list
    939189aedfac mm: mempolicy: keep VMA walk if both MPOL_MF_STRICT and MPOL_MF_MOVE are specified
    ce9f3441fc6a mm/mempolicy: convert migrate_page_add() to migrate_folio_add()
    dc0a8466cd11 mm/mempolicy: convert queue_pages_pte_range() to queue_folios_pte_range()
    6c2c728d299f mm/mempolicy: convert queue_pages_pmd() to queue_folios_pmd()
    6d6635749d4c mm/memory: add vm_normal_folio()
    89f2ace6d016 NFSv4: Fix a state manager thread deadlock regression
    80ba4fd1ac33 NFS: rename nfs_client_kset to nfs_kset
    15ff58702361 NFS: Cleanup unused rpc_clnt variable
    2f09a09d73cb ata: libata-scsi: Fix delayed scsi_rescan_device() execution
    f2b359e3a4f3 scsi: Do not attempt to rescan suspended devices
    5d3b0fcb3ca6 scsi: core: Improve type safety of scsi_rescan_device()
    deacabef6834 scsi: sd: Do not issue commands to suspended disks on shutdown
    8de6d8449ae9 scsi: sd: Differentiate system and runtime start/stop management
    dc3354c961ba ata,scsi: do not issue START STOP UNIT on resume
    078651647064 mptcp: process pending subflow error on close
    fc8917b79069 mptcp: move __mptcp_error_report in protocol.c
    c1432ece79e6 mptcp: annotate lockless accesses to sk->sk_err
    09b6fdf7a12e mptcp: fix dangling connection hang-up
    7544918e48e6 mptcp: rename timer related helper to less confusing names
    bbdfef76096d ASoC: tegra: Fix redundant PLLA and PLLA_OUT0 updates
    5f9d73761553 ASoC: soc-utils: Export snd_soc_dai_is_dummy() symbol
    1031f68108ea spi: zynqmp-gqspi: fix clock imbalance on probe failure

Signed-off-by: Bruce Ashfield <bruce.ashfield@gmail.com>
---
 .../linux/linux-yocto-rt_6.1.bb               |  6 ++--
 .../linux/linux-yocto-tiny_6.1.bb             |  6 ++--
 meta/recipes-kernel/linux/linux-yocto_6.1.bb  | 28 +++++++++----------
 3 files changed, 20 insertions(+), 20 deletions(-)

diff --git a/meta/recipes-kernel/linux/linux-yocto-rt_6.1.bb b/meta/recipes-kernel/linux/linux-yocto-rt_6.1.bb
index a958ade392..0272a8a59e 100644
--- a/meta/recipes-kernel/linux/linux-yocto-rt_6.1.bb
+++ b/meta/recipes-kernel/linux/linux-yocto-rt_6.1.bb
@@ -14,13 +14,13 @@ python () {
         raise bb.parse.SkipRecipe("Set PREFERRED_PROVIDER_virtual/kernel to linux-yocto-rt to enable it")
 }
 
-SRCREV_machine ?= "4b3040c1dc13aaac356ad4ef45a8926118c732d0"
-SRCREV_meta ?= "0816d0a6984e2abbbc5aef9db16391a97b7c9850"
+SRCREV_machine ?= "a3ae026c0673c043e1fd3374e488a78b29249534"
+SRCREV_meta ?= "8aa5efbc5e5361efc8b11c5aec9b967085613a0b"
 
 SRC_URI = "git://git.yoctoproject.org/linux-yocto.git;branch=${KBRANCH};name=machine;protocol=https \
            git://git.yoctoproject.org/yocto-kernel-cache;type=kmeta;name=meta;branch=yocto-6.1;destsuffix=${KMETA};protocol=https"
 
-LINUX_VERSION ?= "6.1.56"
+LINUX_VERSION ?= "6.1.57"
 
 LIC_FILES_CHKSUM = "file://COPYING;md5=6bc538ed5bd9a7fc9398086aedcd7e46"
 
diff --git a/meta/recipes-kernel/linux/linux-yocto-tiny_6.1.bb b/meta/recipes-kernel/linux/linux-yocto-tiny_6.1.bb
index fd69408873..b05f3107af 100644
--- a/meta/recipes-kernel/linux/linux-yocto-tiny_6.1.bb
+++ b/meta/recipes-kernel/linux/linux-yocto-tiny_6.1.bb
@@ -8,7 +8,7 @@ require recipes-kernel/linux/linux-yocto.inc
 # CVE exclusions
 include recipes-kernel/linux/cve-exclusion_6.1.inc
 
-LINUX_VERSION ?= "6.1.56"
+LINUX_VERSION ?= "6.1.57"
 LIC_FILES_CHKSUM = "file://COPYING;md5=6bc538ed5bd9a7fc9398086aedcd7e46"
 
 DEPENDS += "${@bb.utils.contains('ARCH', 'x86', 'elfutils-native', '', d)}"
@@ -17,8 +17,8 @@ DEPENDS += "openssl-native util-linux-native"
 KMETA = "kernel-meta"
 KCONF_BSP_AUDIT_LEVEL = "2"
 
-SRCREV_machine ?= "644e73fa089ade30c0db7bd54be960be92546ba2"
-SRCREV_meta ?= "0816d0a6984e2abbbc5aef9db16391a97b7c9850"
+SRCREV_machine ?= "8a449d3428e673be0bdb504dadb666b4ad7208e3"
+SRCREV_meta ?= "8aa5efbc5e5361efc8b11c5aec9b967085613a0b"
 
 PV = "${LINUX_VERSION}+git"
 
diff --git a/meta/recipes-kernel/linux/linux-yocto_6.1.bb b/meta/recipes-kernel/linux/linux-yocto_6.1.bb
index 9c9b960f97..062fde84a4 100644
--- a/meta/recipes-kernel/linux/linux-yocto_6.1.bb
+++ b/meta/recipes-kernel/linux/linux-yocto_6.1.bb
@@ -18,25 +18,25 @@ KBRANCH:qemux86-64 ?= "v6.1/standard/base"
 KBRANCH:qemuloongarch64  ?= "v6.1/standard/base"
 KBRANCH:qemumips64 ?= "v6.1/standard/mti-malta64"
 
-SRCREV_machine:qemuarm ?= "cf771f6d6bc0344e048bdbf7d23d3aacbe3556d0"
-SRCREV_machine:qemuarm64 ?= "644e73fa089ade30c0db7bd54be960be92546ba2"
-SRCREV_machine:qemuloongarch64 ?= "f21f9d92e463bcfa7e64887f14676225144ed8d1"
-SRCREV_machine:qemumips ?= "4be1dcc270e6ddeea513af01d91ea3b48ec82470"
-SRCREV_machine:qemuppc ?= "644e73fa089ade30c0db7bd54be960be92546ba2"
-SRCREV_machine:qemuriscv64 ?= "f21f9d92e463bcfa7e64887f14676225144ed8d1"
-SRCREV_machine:qemuriscv32 ?= "f21f9d92e463bcfa7e64887f14676225144ed8d1"
-SRCREV_machine:qemux86 ?= "f21f9d92e463bcfa7e64887f14676225144ed8d1"
-SRCREV_machine:qemux86-64 ?= "f21f9d92e463bcfa7e64887f14676225144ed8d1"
-SRCREV_machine:qemumips64 ?= "aa0e978c979b84d620ad21132cfdbbf857be3878"
-SRCREV_machine ?= "f21f9d92e463bcfa7e64887f14676225144ed8d1"
-SRCREV_meta ?= "0816d0a6984e2abbbc5aef9db16391a97b7c9850"
+SRCREV_machine:qemuarm ?= "0ef61a389975a4019142c5f1e6608e6cc0a0df29"
+SRCREV_machine:qemuarm64 ?= "8a449d3428e673be0bdb504dadb666b4ad7208e3"
+SRCREV_machine:qemuloongarch64 ?= "8a449d3428e673be0bdb504dadb666b4ad7208e3"
+SRCREV_machine:qemumips ?= "d15ee28355bed16d59dd7d56259d2132e5c1c4ad"
+SRCREV_machine:qemuppc ?= "8a449d3428e673be0bdb504dadb666b4ad7208e3"
+SRCREV_machine:qemuriscv64 ?= "8a449d3428e673be0bdb504dadb666b4ad7208e3"
+SRCREV_machine:qemuriscv32 ?= "8a449d3428e673be0bdb504dadb666b4ad7208e3"
+SRCREV_machine:qemux86 ?= "8a449d3428e673be0bdb504dadb666b4ad7208e3"
+SRCREV_machine:qemux86-64 ?= "8a449d3428e673be0bdb504dadb666b4ad7208e3"
+SRCREV_machine:qemumips64 ?= "e740b68e38e55ca342ab3b70fa2f965c5a86758b"
+SRCREV_machine ?= "8a449d3428e673be0bdb504dadb666b4ad7208e3"
+SRCREV_meta ?= "8aa5efbc5e5361efc8b11c5aec9b967085613a0b"
 
 # set your preferred provider of linux-yocto to 'linux-yocto-upstream', and you'll
 # get the <version>/base branch, which is pure upstream -stable, and the same
 # meta SRCREV as the linux-yocto-standard builds. Select your version using the
 # normal PREFERRED_VERSION settings.
 BBCLASSEXTEND = "devupstream:target"
-SRCREV_machine:class-devupstream ?= "d23900f974e0fb995b36ef47283a5aa74ca25f51"
+SRCREV_machine:class-devupstream ?= "082280fe94a09462c727fb6e7b0c982efb36dede"
 PN:class-devupstream = "linux-yocto-upstream"
 KBRANCH:class-devupstream = "v6.1/base"
 
@@ -45,7 +45,7 @@ SRC_URI = "git://git.yoctoproject.org/linux-yocto.git;name=machine;branch=${KBRA
 SRC_URI += "file://0001-perf-cpumap-Make-counter-as-unsigned-ints.patch"
 
 LIC_FILES_CHKSUM = "file://COPYING;md5=6bc538ed5bd9a7fc9398086aedcd7e46"
-LINUX_VERSION ?= "6.1.56"
+LINUX_VERSION ?= "6.1.57"
 
 PV = "${LINUX_VERSION}+git"
 
-- 
2.34.1


