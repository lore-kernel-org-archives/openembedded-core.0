Return-Path: <steve@sakoman.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 3F5E6C04FE1
	for <webhook@archiver.kernel.org>; Thu, 10 Aug 2023 16:05:17 +0000 (UTC)
Received: from mail-pf1-f176.google.com (mail-pf1-f176.google.com [209.85.210.176])
 by mx.groups.io with SMTP id smtpd.web11.21278.1691683511956685373
 for <openembedded-core@lists.openembedded.org>;
 Thu, 10 Aug 2023 09:05:12 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@sakoman-com.20221208.gappssmtp.com header.s=20221208 header.b=pobr9t/f;
 spf=softfail (domain: sakoman.com, ip: 209.85.210.176, mailfrom: steve@sakoman.com)
Received: by mail-pf1-f176.google.com with SMTP id d2e1a72fcca58-686b643df5dso802891b3a.1
        for <openembedded-core@lists.openembedded.org>; Thu, 10 Aug 2023 09:05:11 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=sakoman-com.20221208.gappssmtp.com; s=20221208; t=1691683511; x=1692288311;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=27WaHD/2zdLqGa94VPgdoYNztYMaC5V+iHaEjxJ+1nQ=;
        b=pobr9t/fE9dcytU7tYCAB1ojAPP8vYoiVu/k/7iM28RiJKSeoUrUypANdFIoVk4dFL
         YkqW8yWYwX0OmHTWDZvGuYQpllAeoYqaWtGDg6moUy4aCSQgQ/NwzkRfvpv+GSZHfkBf
         bsz3xdiKH3+7+dM4eGCewwWZ8W2yWhp3iwNPLmLAIN5Q4oinclE7dA5Z/C/bj4KI9xIU
         J6A5q24fe2Mm1BH8yadnhzBHI2jXnMU4P8ZlAkjRoPWhshiRFJd0mOjbuUQ2Bi/9DgXK
         bWBCBO3URUyAKziGJ4HvJ/N/Mpd9SKwm4znEjjH50wBObzkaHMkCmvtp+fVdxuvga3SW
         qX7g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1691683511; x=1692288311;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=27WaHD/2zdLqGa94VPgdoYNztYMaC5V+iHaEjxJ+1nQ=;
        b=M4a1brvIy4sPo1t4Z0Cq3m2eCArohw0vrlC6c1WWiuViWqel/fquW5OOFxoPPWQaI2
         KC7ZwN6OjPKLdi1VcPXTuVkrSuN5T8mlnH5ZrWRC42rrVKP5Xxb3Kj6KPmrcI/PUwchx
         j6cO+9i2OaesNREjkKZsB0VgUzCAl2kldz2xf8zgiXUmIzTBwfBnmxflLxZuuxnCeX8q
         NLUR9fMP7WmqpwCf9TL+gusuWg5ePqsrh+q17UQjIVgFIUu1yRZXzaZeQwLWnXgt1Ead
         A6iOtcVtS8zsJmRQpacJBkB+YYNYaJxOsWjK+OtSSDZwjxN2Ic6hH0iOhUUab2uUMgRx
         OloQ==
X-Gm-Message-State: AOJu0YwwxNJeAyw/X2s/fvMCU5isv/9tdMoN/TyG3PGgZTTteg1OgUhi
	XgDsTWjFQJ8uPLtX8LNwBKj60ZNhWWcK9zyhWBc=
X-Google-Smtp-Source: AGHT+IH2CdU6zuuCOXvWrmYyrjAp33zmaRNvEqI5dG6LMJ424XNOcp3H9vVQqZtL8YpVWDacMMMQVQ==
X-Received: by 2002:a05:6a21:78a9:b0:140:56b6:4137 with SMTP id bf41-20020a056a2178a900b0014056b64137mr3148598pzc.52.1691683510718;
        Thu, 10 Aug 2023 09:05:10 -0700 (PDT)
Received: from hexa.lan (dhcp-72-234-106-30.hawaiiantel.net. [72.234.106.30])
        by smtp.gmail.com with ESMTPSA id o29-20020a63731d000000b0054fe6bae952sm1715525pgc.4.2023.08.10.09.05.08
        for <openembedded-core@lists.openembedded.org>
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 10 Aug 2023 09:05:09 -0700 (PDT)
From: Steve Sakoman <steve@sakoman.com>
To: openembedded-core@lists.openembedded.org
Subject: [OE-core][mickledore 12/37] linux-yocto/5.15: update to v5.15.124
Date: Thu, 10 Aug 2023 06:04:11 -1000
Message-Id: <f7ffd2eba4d5c731b7841690e24ca4c5752dfce8.1691683295.git.steve@sakoman.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <cover.1691683295.git.steve@sakoman.com>
References: <cover.1691683295.git.steve@sakoman.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Thu, 10 Aug 2023 16:05:17 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/185774

From: Bruce Ashfield <bruce.ashfield@gmail.com>

Updating  to the latest korg -stable release that comprises
the following commits:

    38d4ca22a528 Linux 5.15.124
    78001ffa9bc4 selftests: mptcp: join: only check for ip6tables if needed
    66cf5f394abe ASoC: cs42l51: fix driver to properly autoload with automatic module loading
    3359fdf49de4 io_uring: treat -EAGAIN for REQ_F_NOWAIT as final for io-wq
    374edda0db70 selftests: mptcp: sockopt: use 'iptables-legacy' if available
    43bbe1a091e0 cpufreq: intel_pstate: Drop ACPI _PSS states table patching
    73b4cbed9176 ACPI: processor: perflib: Avoid updating frequency QoS unnecessarily
    cd031669682e ACPI: processor: perflib: Use the "no limit" frequency QoS
    e8e93e2f017e tracing: Fix trace_event_raw_event_synth() if else statement
    f3b6e63004f6 rbd: retrieve and check lock owner twice before blocklisting
    bb25c5c0e4ae rbd: harden get_lock_owner_info() a bit
    b223e9ffb64d rbd: make get_lock_owner_info() return a single locker or NULL
    098d0b9ba03c dm cache policy smq: ensure IO doesn't prevent cleaner policy progress
    7c9b8cca4917 ceph: never send metrics if disable_send_metrics is set
    e443b3a508b0 ASoC: wm8904: Fill the cache for WM8904_ADC_TEST_0 register
    585355a76e05 s390/dasd: fix hanging device after quiesce/resume
    0061453d6ea1 virtio-net: fix race between set queues and probe
    427d42838c16 KVM: x86: Disallow KVM_SET_SREGS{2} if incoming CR0 is invalid
    4ed1549129f9 locking/rtmutex: Fix task->pi_waiters integrity
    c579caef7c46 irqchip/gic-v4.1: Properly lock VPEs when doing a directLPI invalidation
    6cb3c511afcb irq-bcm6345-l1: Do not assume a fixed block to cpu mapping
    354e8bd5f532 tpm_tis: Explicitly check for error code
    8130c32b4ac1 nfsd: Remove incorrect check in nfsd4_validate_stateid
    9b8a31a23152 file: always lock position for FMODE_ATOMIC_POS
    1f5ea62a0f42 btrfs: check for commit error at btrfs_attach_transaction_barrier()
    883c3ed9a16a btrfs: check if the transaction was aborted at btrfs_wait_for_commit()
    a7abb1690fe1 hwmon: (nct7802) Fix for temp6 (PECI1) processed even if PECI1 disabled
    3f3cdca84432 hwmon: (k10temp) Enable AMD3255 Proc to show negative temperature
    a676ddc4ca96 ALSA: hda/relatek: Enable Mute LED on HP 250 G8
    dd125fcd580a Revert "xhci: add quirk for host controllers that don't update endpoint DCS"
    5138c228311a tty: n_gsm: fix UAF in gsm_cleanup_mux
    baf420e30364 staging: ks7010: potential buffer overflow in ks_wlan_set_encode_ext()
    acacdbe0f740 staging: r8712: Fix memory leak in _r8712_init_xmit_priv()
    ba2975efe979 Documentation: security-bugs.rst: clarify CVE handling
    28ae486f8e36 Documentation: security-bugs.rst: update preferences when dealing with the linux-distros group
    98a118840b71 Revert "usb: xhci: tegra: Fix error check"
    2eaa43508a0e usb: xhci-mtk: set the dma max_seg_size
    cd2d96c4bc6f usb: cdns3: fix incorrect calculation of ep_buf_size when more than one config
    3af06a8502ee USB: quirks: add quirk for Focusrite Scarlett
    8fb5a01196df usb: ohci-at91: Fix the unhandle interrupt when resume
    6366b1178545 usb: dwc3: don't reset device side if dwc3 was configured as host-only
    6f126e026307 usb: dwc3: pci: skip BYT GPIO lookup table for hardwired phy
    a2d2fa661293 Revert "usb: dwc3: core: Enable AutoRetry feature in the controller"
    97620ed1bcab can: gs_usb: gs_can_close(): add missing set of CAN state to CAN_STATE_STOPPED
    0ac13ef00209 USB: serial: simple: sort driver entries
    378e03623741 USB: serial: simple: add Kaufmann RKS+CAN VCP
    5b9a5cf1bf4a USB: serial: option: add Quectel EC200A module support
    399091399777 USB: serial: option: support Quectel EM060K_128
    b800c0d5576e serial: sifive: Fix sifive_serial_console_setup() section
    8fa462ad0f9b serial: 8250_dw: Preserve original value of DLF register
    dc4f6c537f37 serial: qcom-geni: drop bogus runtime pm state update
    41c487de4cf5 KVM: VMX: Don't fudge CR0 and CR4 for restricted L2 guest
    5883a4e8478d KVM: Grab a reference to KVM for VM and vCPU stats file descriptors
    0f7a2b567197 USB: gadget: Fix the memory leak in raw_gadget driver
    2f9bfccced04 usb: gadget: call usb_gadget_check_config() to verify UDC capability
    a49884561a8c Revert "usb: gadget: tegra-xudc: Fix error check in tegra_xudc_powerdomain_init()"
    813cede7b2f5 tracing: Fix warning in trace_buffered_event_disable()
    23e8a65f9a93 ring-buffer: Fix wrong stat of cpu_buffer->read
    ae5b8b1c2eac ata: pata_ns87415: mark ns87560_tf_read static
    6bbbe1b2161e RDMA/irdma: Report correct WC error
    bd79de8bd371 drm/amd: Fix an error handling mistake in psp_sw_init()
    4e1c1d742970 dm raid: protect md_stop() with 'reconfig_mutex'
    0c4db5a04d4f dm raid: clean up four equivalent goto tags in raid_ctr()
    2e321ee96f88 dm raid: fix missing reconfig_mutex unlock in raid_ctr() error paths
    4b9f3ef1f3eb block: Fix a source code comment in include/uapi/linux/blkzoned.h
    2861b33820f9 ASoC: fsl_spdif: Silence output on stop
    5ec0e4deee5b drm/msm: Fix IS_ERR_OR_NULL() vs NULL check in a5xx_submit_in_rb()
    b79a0e71d6e8 RDMA/bnxt_re: Prevent handling any completions after qp destroy
    3ad5f655eb8a RDMA/mthca: Fix crash when polling CQ for shared QPs
    c5b5dbcbf91f RDMA/irdma: Fix data race on CQP request done
    bf0f9f65b7fe RDMA/irdma: Fix data race on CQP completion stats
    fd6e50ec2c38 RDMA/irdma: Add missing read barriers
    5fbb5068d2bd drm/msm/adreno: Fix snapshot BINDLESS_DATA size
    4e9d4a21616b drm/msm/dpu: drop enum dpu_core_perf_data_bus_id
    6ab756a55e46 RDMA/mlx4: Make check for invalid flags stricter
    9dde876a4dc8 tipc: stop tipc crypto on failure in tipc_node_create
    df019bc1241e tipc: check return value of pskb_trim()
    42afa7ef6629 benet: fix return value check in be_lancer_xmit_workarounds()
    95cf4fa31b0c net/sched: mqprio: Add length check for TCA_MQPRIO_{MAX/MIN}_RATE64
    98f6bbdfc0ce net/sched: mqprio: add extack to mqprio_parse_nlattr()
    b1e85c9d28dd net/sched: mqprio: refactor nlattr parsing to a separate function
    5bee91121cce netfilter: nf_tables: disallow rule addition to bound chain via NFTA_RULE_CHAIN_ID
    98bcfcaecc76 netfilter: nf_tables: skip immediate deactivate in _PREPARE_ERROR
    50cbb9d195c1 netfilter: nft_set_rbtree: fix overlap expiration walk
    feba294c454a igc: Fix Kernel Panic during ndo_tx_timeout callback
    8412fe36863b platform/x86: msi-laptop: Fix rfkill out-of-sync on MSI Wind U100
    238420a24d6b net: stmmac: Apply redundant write work around on 4.xx too
    9be8ec5a0cfe team: reset team's flags when down link is P2P device
    bf2d7b63e2b5 bonding: reset bond's flags when down link is P2P device
    c28b39387634 ice: Fix memory management in ice_ethtool_fdir.c
    ecb741a17cb2 tcp: Reduce chance of collisions in inet6_hashfn().
    dd48780a7bbb ipv6 addrconf: fix bug where deleting a mngtmpaddr can create a new temporary address
    46e40297355e ethernet: atheros: fix return value check in atl1e_tso_csum()
    6d8a71e4c3a2 phy: hisilicon: Fix an out of bounds check in hisi_inno_phy_probe()
    49f5b3c9499b vxlan: calculate correct header length for GPE
    77396fa9096a vxlan: move to its own directory
    96dbc68b7f86 net: hns3: fix wrong bw weight of disabled tc issue
    9755714d238c net: hns3: fix wrong tc bandwidth weight data issue
    01460ac6ff95 net: phy: marvell10g: fix 88x3310 power up
    57743a86cce1 iavf: check for removal state before IAVF_FLAG_PF_COMMS_FAILED
    1542e399a12a iavf: fix potential deadlock on allocation failure
    5a4048355725 i40e: Fix an NULL vs IS_ERR() bug for debugfs_create_dir()
    c9b936984d89 media: staging: atomisp: select V4L2_FWNODE
    6aa7cb3bb5c9 soundwire: qcom: update status correctly with mask
    3f28ec4a4002 phy: qcom-snps-femto-v2: properly enable ref clock
    ac3fe4c2a708 phy: qcom-snps-femto-v2: keep cfg_ahb_clk enabled during runtime suspend
    e7c0c5af517f phy: qcom-snps: correct struct qcom_snps_hsphy kerneldoc
    450ef59bef9a phy: qcom-snps: Use dev_err_probe() to simplify code
    d6f92582816c drm/amdgpu/vkms: relax timer deactivation by hrtimer_try_to_cancel
    fc399b0fdf2d drm/amdgpu: fix vkms crtc settings
    aa56bcff46a1 scsi: qla2xxx: Fix hang in task management
    58daf4e8709d scsi: qla2xxx: Add debug prints in the device remove path
    f90d44e5bbbe scsi: qla2xxx: Fix task management cmd fail due to unavailable resource
    01366f0b656a scsi: qla2xxx: Fix task management cmd failure
    25cea82ea25d scsi: qla2xxx: Multi-que support for TMF
    2e18fd3f61be scsi: qla2xxx: Remove unused declarations for qla2xxx
    ace6bed42464 tracing/probes: Fix to record 0-length data_loc in fetch_store_string*() if fails
    30c8ba1da373 Revert "tracing: Add "(fault)" name injection to kernel probes"
    5f52389bdd9e tracing: Allow synthetic events to pass around stacktraces
    e7b4d24fa090 tracing/probes: Fix to avoid double count of the string length on the array
    3a1a229712ef tracing/probes: Add symstr type for dynamic events
    7ac170d93bec pwm: meson: fix handling of period/duty if greater than UINT_MAX
    bae3c43a9d25 pwm: meson: Simplify duplicated per-channel tracking
    5cb0349cfcde cifs: if deferred close is disabled then close files immediately
    c600e23fbc40 ksmbd: remove internal.h include
    c8117ac42303 cifs: use fs_context for automounts
    5076cc8bc162 cifs: missing directory in MAINTAINERS file
    da60170558b9 drm/ttm: never consider pinned BOs for eviction&swap
    c556573e4bb1 tty: fix hang on tty device with no_room set
    d262770b95c7 n_tty: Rename tail to old_tail in n_tty_read()
    7738335d73d0 drm/ttm: Don't leak a resource on eviction error
    4400b96587fd drm/ttm: Don't print error message if eviction was interrupted
    354cdda79a77 fs: dlm: interrupt posix locks only when process is killed
    97e7a0f8dea2 dlm: rearrange async condition return
    75ce95abc65b dlm: cleanup plock_op vs plock_xop
    b409d8df9bea PCI: rockchip: Don't advertise MSI-X in PCIe capabilities
    cbd1494e51fd PCI: rockchip: Fix window mapping and address translation for endpoint
    eb39c4c051dc PCI: rockchip: Remove writes to unused registers
    05f13e85fbdd PCI/ASPM: Avoid link retraining race
    52d274956a8f PCI/ASPM: Factor out pcie_wait_for_retrain()
    cf8c18150030 PCI/ASPM: Return 0 or -ETIMEDOUT from pcie_retrain_link()
    8b9249d74ca5 i2c: nomadik: Remove a useless call in the remove function
    f07d8d345bd2 i2c: nomadik: Use devm_clk_get_enabled()
    4954c8705339 i2c: nomadik: Remove unnecessary goto label
    24562f0a46ad i2c: Improve size determinations
    9845744e57fe i2c: Delete error messages for failed memory allocations
    89eae1f0aaeb btrfs: fix race between quota disable and relocation
    b19e90521286 gpio: mvebu: fix irq domain leak
    a999660042af gpio: mvebu: Make use of devm_pwmchip_add
    34fe5fbc208f pwm: Add a stub for devm_pwmchip_add()
    f3d2344811fd gpio: tps68470: Make tps68470_gpio_output() always set the initial value
    21d063d27bf3 io_uring: don't audit the capability check in io_uring_create()
    49a2686addde KVM: s390: pv: fix index value of replaced ASCE
    fee1e6a73557 jbd2: Fix wrongly judgement for buffer head removing while doing checkpoint

Signed-off-by: Bruce Ashfield <bruce.ashfield@gmail.com>
Signed-off-by: Steve Sakoman <steve@sakoman.com>
---
 .../linux/linux-yocto-rt_5.15.bb              |  6 ++---
 .../linux/linux-yocto-tiny_5.15.bb            |  6 ++---
 meta/recipes-kernel/linux/linux-yocto_5.15.bb | 26 +++++++++----------
 3 files changed, 19 insertions(+), 19 deletions(-)

diff --git a/meta/recipes-kernel/linux/linux-yocto-rt_5.15.bb b/meta/recipes-kernel/linux/linux-yocto-rt_5.15.bb
index 572f8a17bc..be5dd5efec 100644
--- a/meta/recipes-kernel/linux/linux-yocto-rt_5.15.bb
+++ b/meta/recipes-kernel/linux/linux-yocto-rt_5.15.bb
@@ -11,13 +11,13 @@ python () {
         raise bb.parse.SkipRecipe("Set PREFERRED_PROVIDER_virtual/kernel to linux-yocto-rt to enable it")
 }
 
-SRCREV_machine ?= "59fd8ada21b5e298f66a7b22b8e90a16f5a30142"
-SRCREV_meta ?= "cae7ce34613cda607d089452f19e8b20143afcf6"
+SRCREV_machine ?= "0ac91942af8fec31671ffe62e9518aaf15f110b3"
+SRCREV_meta ?= "f484a7f175b4f3c4f7d2b553cde232bd41f757d8"
 
 SRC_URI = "git://git.yoctoproject.org/linux-yocto.git;branch=${KBRANCH};name=machine;protocol=https \
            git://git.yoctoproject.org/yocto-kernel-cache;type=kmeta;name=meta;branch=yocto-5.15;destsuffix=${KMETA};protocol=https"
 
-LINUX_VERSION ?= "5.15.123"
+LINUX_VERSION ?= "5.15.124"
 
 LIC_FILES_CHKSUM = "file://COPYING;md5=6bc538ed5bd9a7fc9398086aedcd7e46"
 
diff --git a/meta/recipes-kernel/linux/linux-yocto-tiny_5.15.bb b/meta/recipes-kernel/linux/linux-yocto-tiny_5.15.bb
index 88faa7b055..b8f3d71a72 100644
--- a/meta/recipes-kernel/linux/linux-yocto-tiny_5.15.bb
+++ b/meta/recipes-kernel/linux/linux-yocto-tiny_5.15.bb
@@ -5,7 +5,7 @@ KCONFIG_MODE = "--allnoconfig"
 
 require recipes-kernel/linux/linux-yocto.inc
 
-LINUX_VERSION ?= "5.15.123"
+LINUX_VERSION ?= "5.15.124"
 LIC_FILES_CHKSUM = "file://COPYING;md5=6bc538ed5bd9a7fc9398086aedcd7e46"
 
 DEPENDS += "${@bb.utils.contains('ARCH', 'x86', 'elfutils-native', '', d)}"
@@ -14,8 +14,8 @@ DEPENDS += "openssl-native util-linux-native"
 KMETA = "kernel-meta"
 KCONF_BSP_AUDIT_LEVEL = "2"
 
-SRCREV_machine ?= "5aa57f90df9951ba3d98a8ff083a43b62f97e7cc"
-SRCREV_meta ?= "cae7ce34613cda607d089452f19e8b20143afcf6"
+SRCREV_machine ?= "cdb289c798fe1fc9f259a08c32e2dd9516ccb7a4"
+SRCREV_meta ?= "f484a7f175b4f3c4f7d2b553cde232bd41f757d8"
 
 PV = "${LINUX_VERSION}+git${SRCPV}"
 
diff --git a/meta/recipes-kernel/linux/linux-yocto_5.15.bb b/meta/recipes-kernel/linux/linux-yocto_5.15.bb
index 74b6b53158..a15284fb4b 100644
--- a/meta/recipes-kernel/linux/linux-yocto_5.15.bb
+++ b/meta/recipes-kernel/linux/linux-yocto_5.15.bb
@@ -13,24 +13,24 @@ KBRANCH:qemux86  ?= "v5.15/standard/base"
 KBRANCH:qemux86-64 ?= "v5.15/standard/base"
 KBRANCH:qemumips64 ?= "v5.15/standard/mti-malta64"
 
-SRCREV_machine:qemuarm ?= "ef2785ed640623ce9ae395a2abc49d22cdc6250b"
-SRCREV_machine:qemuarm64 ?= "c68f102984771a06e462d8a8f6ded44c3acee4bf"
-SRCREV_machine:qemumips ?= "f5dcc525b57cf14c8a3d287ff3da9c2bf2b76bee"
-SRCREV_machine:qemuppc ?= "4372656a5a7ea05a29ca1758468e41f1ceae5a1a"
-SRCREV_machine:qemuriscv64 ?= "20f53f58b8ce5cade2786e8e31cfdb714fa4c420"
-SRCREV_machine:qemuriscv32 ?= "20f53f58b8ce5cade2786e8e31cfdb714fa4c420"
-SRCREV_machine:qemux86 ?= "20f53f58b8ce5cade2786e8e31cfdb714fa4c420"
-SRCREV_machine:qemux86-64 ?= "20f53f58b8ce5cade2786e8e31cfdb714fa4c420"
-SRCREV_machine:qemumips64 ?= "bd546f292ae1ce89104a3556b0245e8cd908615d"
-SRCREV_machine ?= "20f53f58b8ce5cade2786e8e31cfdb714fa4c420"
-SRCREV_meta ?= "cae7ce34613cda607d089452f19e8b20143afcf6"
+SRCREV_machine:qemuarm ?= "676a22c65ec0f8bb5dc7e13d130f6e3764959d75"
+SRCREV_machine:qemuarm64 ?= "f0e7afd5948f71be062cd9194b56cd03de94b7cb"
+SRCREV_machine:qemumips ?= "0f1ceb9008f182cd7f21420bbec6f21a67da8397"
+SRCREV_machine:qemuppc ?= "4ec9fc13283ce01627ef8c32617a1eb71e127c62"
+SRCREV_machine:qemuriscv64 ?= "1c09be01f4b87f60ea64136459167d73502a118f"
+SRCREV_machine:qemuriscv32 ?= "1c09be01f4b87f60ea64136459167d73502a118f"
+SRCREV_machine:qemux86 ?= "1c09be01f4b87f60ea64136459167d73502a118f"
+SRCREV_machine:qemux86-64 ?= "1c09be01f4b87f60ea64136459167d73502a118f"
+SRCREV_machine:qemumips64 ?= "fad09cc6acf2175aa6b5979ef48cd5f05afc3da0"
+SRCREV_machine ?= "1c09be01f4b87f60ea64136459167d73502a118f"
+SRCREV_meta ?= "f484a7f175b4f3c4f7d2b553cde232bd41f757d8"
 
 # set your preferred provider of linux-yocto to 'linux-yocto-upstream', and you'll
 # get the <version>/base branch, which is pure upstream -stable, and the same
 # meta SRCREV as the linux-yocto-standard builds. Select your version using the
 # normal PREFERRED_VERSION settings.
 BBCLASSEXTEND = "devupstream:target"
-SRCREV_machine:class-devupstream ?= "09996673e3139a6d86fc3d95c852b3a020e2fe5f"
+SRCREV_machine:class-devupstream ?= "38d4ca22a5288c4bae7e6d62a1728b0718d51866"
 PN:class-devupstream = "linux-yocto-upstream"
 KBRANCH:class-devupstream = "v5.15/base"
 
@@ -38,7 +38,7 @@ SRC_URI = "git://git.yoctoproject.org/linux-yocto.git;name=machine;branch=${KBRA
            git://git.yoctoproject.org/yocto-kernel-cache;type=kmeta;name=meta;branch=yocto-5.15;destsuffix=${KMETA};protocol=https"
 
 LIC_FILES_CHKSUM = "file://COPYING;md5=6bc538ed5bd9a7fc9398086aedcd7e46"
-LINUX_VERSION ?= "5.15.123"
+LINUX_VERSION ?= "5.15.124"
 
 DEPENDS += "${@bb.utils.contains('ARCH', 'x86', 'elfutils-native', '', d)}"
 DEPENDS += "openssl-native util-linux-native"
-- 
2.34.1


