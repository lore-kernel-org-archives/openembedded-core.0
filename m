Received: from mail-qv1-f44.google.com (mail-qv1-f44.google.com [209.85.219.44])
 by mx.groups.io with SMTP id smtpd.web10.11950.1629040147435628170
 for <openembedded-core@lists.openembedded.org>;
 Sun, 15 Aug 2021 08:09:07 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20161025 header.b=mB+Qu4fz;
 spf=pass (domain: gmail.com, ip: 209.85.219.44, mailfrom: bruce.ashfield@gmail.com)
Received: by mail-qv1-f44.google.com with SMTP id eh1so321846qvb.11
        for <openembedded-core@lists.openembedded.org>; Sun, 15 Aug 2021 08:09:07 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:content-transfer-encoding;
        bh=OqoluY2rN8/mloyyAv3rKu+leKYfZLwMGoPBrmQ5QWM=;
        b=mB+Qu4fzik59toLvqwW6b/xxnIi44J2ZVYXU5ATKFJgipeRpGf6LW/1vFRdFHHCPjS
         2BEtpGC6+Rnrh7lVOD+q4c+BpAaziXocVEKolvnJGEQME2/6qHkYb2cetkbZRsMxhvcL
         ADhWbs+SE2xHIBvuKC9HPK5ZQ0LCSH+agpTTf5y3bHz4BK36ydEDFgfCNDtaJKqA7uQm
         5XHBilyIM/ujEcNma9avVvf+iuFAq+VDUaftDrOKHLmCxFWz/dI/PTFSnobTXsCT6dbZ
         DuQvHw8iljjg+b8WZOqV761SqhKftD+kit4zKq7pxUvNge0K5S3YPBqSn6r+XvX+3K5E
         tvEg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=OqoluY2rN8/mloyyAv3rKu+leKYfZLwMGoPBrmQ5QWM=;
        b=kPJdz1CAyhia3kOTQelYghAvU/BC22Yp7PAx0Fc5NH3anoWnNs/BsOYjbUpqVJhExy
         umPhY+txdqRmPLzidmPCG2XF2lSUKWDlNVesc5l+M26pFU7nNiZAyKJn/8Pb7rEsi9jl
         ntPNWObmaDcnbpNDpomU2+qIyDtSiDCCPKwy2Ig9CRymb6lWuLv6YTeqDLZ1ujAo7Tpg
         nH30QewI0ySkXDVmMEiPh2lqVg5xkmLHfmIZCUPhrOawF8b3dxu7zDLryF3F5pR2F/k0
         lgIu2StOvG7G2ocRFcZoC0xMQp0b0llVnSBjqTdCMFn+Q4g+PQz8K71fwowBHF0usVBr
         Qiww==
X-Gm-Message-State: AOAM532KjaMo4uWMeVUWoDZ4VgZhe7EhvOYYcJxmGPuBNy1l9yPgoGIT
	/HJYcxhXNOVTbCjH9hQdNGuciB7jwh0FXw==
X-Google-Smtp-Source: ABdhPJzED6bA686uh0rx8HyeydGk4Hu429Ojqr7KghCMlJrOEUV5ieVPcff+dpE6c1jl06HD/KfHEg==
X-Received: by 2002:a0c:ead1:: with SMTP id y17mr12239870qvp.12.1629040146447;
        Sun, 15 Aug 2021 08:09:06 -0700 (PDT)
Return-Path: <bruce.ashfield@gmail.com>
Received: from build.lan (cpe04d4c4975b80-cmf4c11490699b.cpe.net.cable.rogers.com. [174.112.63.222])
        by smtp.gmail.com with ESMTPSA id n124sm4690466qkf.119.2021.08.15.08.09.05
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 15 Aug 2021 08:09:06 -0700 (PDT)
From: "Bruce Ashfield" <bruce.ashfield@gmail.com>
To: richard.purdie@linuxfoundation.org
Cc: openembedded-core@lists.openembedded.org
Subject: [PATCH 6/8] linux-yocto/5.13: update to v5.13.9
Date: Sun, 15 Aug 2021 11:08:56 -0400
Message-Id: <b99aaaa2e26f8a002abf4ead0012308f44c26e59.1629039837.git.bruce.ashfield@gmail.com>
X-Mailer: git-send-email 2.19.1
In-Reply-To: <cover.1629039837.git.bruce.ashfield@gmail.com>
References: <cover.1629039837.git.bruce.ashfield@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

From: Bruce Ashfield <bruce.ashfield@gmail.com>

Updating linux-yocto/5.13 to the latest korg -stable release that comprises
the following commits:

    f259ee2f0379 Linux 5.13.9
    4288f43d9e0e spi: mediatek: Fix fifo transfer
    fad0494f626f drm/amd/display: Fix ASSR regression on embedded panels
    02db470b866f Revert "watchdog: iTCO_wdt: Account for rebooting on second timeout"
    c268b30ff4e0 Revert "Bluetooth: Shutdown controller after workqueues are flushed or cancelled"
    989b27104a97 io_uring: explicitly catch any illegal async queue attempt
    f7be9c72d1de io_uring: never attempt iopoll reissue from release path
    eb9b9c610f25 drm/amd/display: Fix max vstartup calculation for modes with borders
    9cc57c6cdd24 drm/amd/display: Fix comparison error in dcn21 DML
    b3b7be424610 nvme: fix nvme_setup_command metadata trace event
    d26ac2d83b02 efi/mokvar: Reserve the table only if it is in boot services data
    dbdf7e3d5684 ASoC: ti: j721e-evm: Check for not initialized parent_clk_id
    f248077aef20 ASoC: ti: j721e-evm: Fix unbalanced domain activity tracking during startup
    a35d559db687 net: Fix zero-copy head len calculation.
    4bf6168d0b6a ASoC: rt5682: Fix the issue of garbled recording after powerd_dbus_suspend
    3cadaeae64dc qed: fix possible unpaired spin_{un}lock_bh in _qed_mcp_cmd_and_union()
    a6b2ef5b5ffb r8152: Fix a deadlock by doubly PM resume
    5feeb2da23e5 r8152: Fix potential PM refcount imbalance
    bf7dd85e9e02 regulator: mtk-dvfsrc: Fix wrong dev pointer for devm_regulator_register
    ee37879e24c4 ASoC: tlv320aic31xx: fix reversed bclk/wclk master bits
    c2fdcb148e33 spi: stm32h7: fix full duplex irq handler handling
    64d62c4e4ccb regulator: rt5033: Fix n_voltages settings for BUCK and LDO
    2e4e8df287c1 regulator: rtmv20: Fix wrong mask for strobe-polarity-high
    1c5b8c4e4cb5 ASoC: Intel: boards: fix xrun issue on platform with max98373
    497a0258df14 ASoC: Intel: boards: create sof-maxim-common module
    301f2270d3ac ASoC: Intel: boards: handle hda-dsp-common as a module
    c348419f365b net: dsa: sja1105: fix address learning getting disabled on the CPU port
    5ee064ade19a net: dsa: sja1105: parameterize the number of ports
    1ce09f0ae455 cifs: add missing parsing of backupuid
    cf5663d06bc3 cifs: use helpers when parsing uid/gid mount options and validate them
    2abe7e0f1983 bpf, sockmap: On cleanup we additionally need to remove cached skb
    96b1d399a4f2 skmsg: Pass source psock to sk_psock_skb_redirect()
    b82ffbf55977 skmsg: Increase sk->sk_drops when dropping packets
    af8884055780 power: supply: ab8500: Call battery population once
    5a40048e60b2 Revert "drm/i915: Propagate errors on awaiting already signaled fences"
    15c8463df133 drm/i915: Revert "drm/i915/gem: Asynchronous cmdparser"
    3cfdd7252e00 Linux 5.13.8
    d92d15c28841 octeontx2-af: Remove unnecessary devm_kfree
    187463c4a262 perf pmu: Fix alias matching
    5e1fc537c1be can: j1939: j1939_session_deactivate(): clarify lifetime of session object
    f27deb33bbdb i40e: Add additional info to PHY type error
    e95d994d2f8f io_uring: fix race in unified task_work running
    ee6d50cb1c23 Revert "perf map: Fix dso->nsinfo refcounting"
    9755a447ec42 powerpc/pseries: Fix regression while building external modules
    c73256979654 powerpc/vdso: Don't use r30 to avoid breaking Go lang
    52e9158959d2 SMB3: fix readpage for large swap cache
    19f60bf08ee3 bpf: Fix pointer arithmetic mask tightening under state pruning
    8595837e9df5 bpf: verifier: Allocate idmap scratch in verifier env
    738ab7d5e554 bpf: Remove superfluous aux sanitation on subprog rejection
    0b27bdf02c40 bpf: Fix leakage due to insufficient speculative store bypass mitigation
    ddab060f996e bpf: Introduce BPF nospec instruction for mitigating Spectre v4
    9ec54436991f can: hi311x: fix a signedness bug in hi3110_cmd()
    dda5c13325f1 sis900: Fix missing pci_disable_device() in probe and remove
    6cbc642e6f82 tulip: windbond-840: Fix missing pci_disable_device() in probe and remove
    c7d5458d5589 sctp: fix return value check in __sctp_rcv_asconf_lookup
    fc553003e361 block: delay freeing the gendisk
    926fa6598cdd net/mlx5: Fix mlx5_vport_tbl_attr chain from u16 to u32
    601c356d1e0a net/mlx5e: Fix nullptr in mlx5e_hairpin_get_mdev()
    6b35ae3f6b42 net/mlx5: Unload device upon firmware fatal error
    9bf4345430b4 net/mlx5e: Fix page allocation failure for ptp-RQ over SF
    09f2d23a618e net/mlx5e: Fix page allocation failure for trap-RQ over SF
    e6eaea0980ee net/mlx5e: Add NETIF_F_HW_TC to hw_features when HTB offload is available
    b0ba8a145d8d net/mlx5e: RX, Avoid possible data corruption when relaxed ordering and LRO combined
    4d253ea99fba net/mlx5: E-Switch, handle devcom events only for ports on the same device
    0b26a4e2d5dd net/mlx5: E-Switch, Set destination vport vhca id only when merged eswitch is supported
    1dc7f1219c13 net/mlx5e: Disable Rx ntuple offload for uplink representor
    644c3c58ec77 net/mlx5: Fix flow table chaining
    951e41ddd214 bpf, sockmap: Zap ingress queues after stopping strparser
    0664f9acc5bf KVM: selftests: Fix missing break in dirty_log_perf_test arg parsing
    9e27f578a403 drm/msm/dp: Initialize the INTF_CONFIG register
    c122e9371bd6 drm/msm/dp: use dp_ctrl_off_link_stream during PHY compliance test run
    58389fac95fb drm/msm/dpu: Fix sm8250_mdp register length
    5e8c20b001e8 net: llc: fix skb_over_panic
    40e79954edce KVM: x86: Check the right feature bit for MSR_KVM_ASYNC_PF_ACK access
    9eb2c41471e6 drm/i915/bios: Fix ports mask
    4689d61012a6 drm/panel: panel-simple: Fix proper bpc for ytc700tlag_05_201c
    7d93d6111d0e mlx4: Fix missing error code in mlx4_load_one()
    58b30f9e1a48 net: phy: broadcom: re-add check for PHY_BRCM_DIS_TXCRXC_NOENRGY on the BCM54811 PHY
    0379d6b0118a octeontx2-pf: Dont enable backpressure on LBK links
    4182c0d66639 octeontx2-pf: Fix interface down flag on error
    b8a071889fb3 tipc: do not write skb_shinfo frags when doing decrytion
    0e99b794c0bc can: mcp251xfd: mcp251xfd_irq(): stop timestamping worker in case error in IRQ
    d6892195dfbe ionic: count csum_none when offload enabled
    70da7c504236 ionic: fix up dim accounting for tx and rx
    e8927398faa1 ionic: remove intr coalesce update from napi
    b367a9a2cebe ionic: catch no ptp support earlier
    12e88273896d ionic: make all rx_mode work threadsafe
    2e618cf6db69 net: qrtr: fix memory leaks
    56a5e590b31e loop: reintroduce global lock for safe loop_validate_file() traversal
    fcc99d41954f net: dsa: mv88e6xxx: silently accept the deletion of VID 0 too
    a6964b4c65c7 net: Set true network header for ECN decapsulation
    7b3f85278d90 tipc: fix sleeping in tipc accept routine
    a73d03806166 tipc: fix implicit-connect for SYN+
    457202b9132f i40e: Fix log TC creation failure when max num of queues is exceeded
    a7ce70625f44 i40e: Fix queue-to-TC mapping on Tx
    644575296661 i40e: Fix firmware LLDP agent related warning
    79c71f5168c5 i40e: Fix logic of disabling queues
    367bec7665d1 netfilter: nft_nat: allow to specify layer 4 protocol NAT only
    62659ab3563a netfilter: conntrack: adjust stop timestamp to real expiry value
    525e6eb9258c mac80211: fix enabling 4-address mode on a sta vif after assoc
    13b8ab2f6f84 bpf: Fix OOB read when printing XDP link fdinfo
    467c905bb613 netfilter: nf_tables: fix audit memory leak in nf_tables_commit
    f7046443c8ac RDMA/rxe: Fix memory leak in error path code
    1544d2b86fa7 platform/x86: amd-pmc: Fix missing unlock on error in amd_pmc_send_cmd()
    d23677f3da7a platform/x86: amd-pmc: Fix SMU firmware reporting mechanism
    91f5c8fb6d8e platform/x86: amd-pmc: Fix command completion code
    7113367b2229 RDMA/bnxt_re: Fix stats counters
    d68acf353765 cfg80211: Fix possible memory leak in function cfg80211_bss_update
    a8d4169f924a io_uring: fix poll requests leaking second poll entries
    5db0ca0fbebf io_uring: don't block level reissue off completion path
    5bb49c88472f io_uring: fix io_prep_async_link locking
    ca324a215bf9 nfc: nfcsim: fix use after free during module unload
    caed0df2e52d blk-iocost: fix operation ordering in iocg_wake_fn()
    749abc8d274f drm/amdgpu: Fix resource leak on probe error path
    070f46bcf6b4 drm/amdgpu: Avoid printing of stack contents on firmware load error
    4e7961b3d5fd drm/amdgpu: Check pmops for desired suspend state
    0652b1eade53 drm/amd/display: ensure dentist display clock update finished in DCN20
    9c2cae70e3a0 NIU: fix incorrect error return, missed in previous revert
    633799ddcff4 net: stmmac: add est_irq_status callback function for GMAC 4.10 and 5.10
    fa1c5eff378f HID: wacom: Re-enable touch by default for Cintiq 24HDT / 27QHDT
    892ced352e05 alpha: register early reserved memory in memblock
    a63d311c966c can: esd_usb2: fix memory leak
    d23e7c014cc4 can: ems_usb: fix memory leak
    62365842aed3 can: usb_8dev: fix memory leak
    78673a83947b can: mcba_usb_start(): add missing urb->transfer_dma initialization
    87d268fe1bdb can: peak_usb: pcan_usb_handle_bus_evt(): fix reading rxerr/txerr values
    aec236c7147a can: raw: raw_setsockopt(): fix raw_rcv panic for sock UAF
    ea9e6fc2bc5d can: j1939: j1939_xtp_rx_dat_one(): fix rxtimer value between consecutive TP.DT to 750ms
    9293727af539 mm/memcg: fix NULL pointer dereference in memcg_slab_free_hook()
    87370a9d413a mm: memcontrol: fix blocking rstat function called from atomic cgroup1 thresholding code
    3df2bd9978b1 ocfs2: issue zeroout to EOF blocks
    c9302ab319ed ocfs2: fix zero out valid data
    a9f2d0884d70 KVM: add missing compat KVM_CLEAR_DIRTY_LOG
    a80e3243e924 x86/kvm: fix vcpu-id indexed array sizes
    3c82e27986af ACPI: DPTF: Fix reading of attributes
    cf90e1c4ad57 Revert "ACPI: resources: Add checks for ACPI IRQ override"
    1d381aca0d9c btrfs: mark compressed range uptodate only if all bio succeed
    c543bced163b btrfs: fix rw device counting in __btrfs_free_extra_devids
    9e4417af187e btrfs: fix lost inode on log replay after mix of fsync, rename and inode eviction
    89e34995bdd7 fs/ext2: Avoid page_address on pages returned by ext2_get_page
    f0aa1bc37e9a pipe: make pipe writes always wake up readers
    5a5aaf4177da selftest: fix build error in tools/testing/selftests/vm/userfaultfd.c

Signed-off-by: Bruce Ashfield <bruce.ashfield@gmail.com>
---
 .../linux/linux-yocto-rt_5.13.bb              |  6 ++---
 .../linux/linux-yocto-tiny_5.13.bb            |  8 +++---
 meta/recipes-kernel/linux/linux-yocto_5.13.bb | 26 +++++++++----------
 3 files changed, 20 insertions(+), 20 deletions(-)

diff --git a/meta/recipes-kernel/linux/linux-yocto-rt_5.13.bb b/meta/recipes-kernel/linux/linux-yocto-rt_5.13.bb
index 7c64be9839..23e1607e6d 100644
--- a/meta/recipes-kernel/linux/linux-yocto-rt_5.13.bb
+++ b/meta/recipes-kernel/linux/linux-yocto-rt_5.13.bb
@@ -11,13 +11,13 @@ python () {
         raise bb.parse.SkipRecipe("Set PREFERRED_PROVIDER_virtual/kernel to linux-yocto-rt to enable it")
 }
 
-SRCREV_machine ?= "9d25766975f6a5f7970538037ec053739dfe2917"
-SRCREV_meta ?= "ace78a314c1fcbf7bd34791f4b0d014c83bb9b2e"
+SRCREV_machine ?= "18b765d01fcd510ccc87d25c62090c3c0b993afe"
+SRCREV_meta ?= "2b89265a0bf39358c674a8e0f38552f6adec6ad8"
 
 SRC_URI = "git://git.yoctoproject.org/linux-yocto.git;branch=${KBRANCH};name=machine \
            git://git.yoctoproject.org/yocto-kernel-cache;type=kmeta;name=meta;branch=yocto-5.13;destsuffix=${KMETA}"
 
-LINUX_VERSION ?= "5.13.7"
+LINUX_VERSION ?= "5.13.9"
 
 LIC_FILES_CHKSUM = "file://COPYING;md5=6bc538ed5bd9a7fc9398086aedcd7e46"
 
diff --git a/meta/recipes-kernel/linux/linux-yocto-tiny_5.13.bb b/meta/recipes-kernel/linux/linux-yocto-tiny_5.13.bb
index 6314ca7d49..81fdd5302f 100644
--- a/meta/recipes-kernel/linux/linux-yocto-tiny_5.13.bb
+++ b/meta/recipes-kernel/linux/linux-yocto-tiny_5.13.bb
@@ -6,7 +6,7 @@ KCONFIG_MODE = "--allnoconfig"
 
 require recipes-kernel/linux/linux-yocto.inc
 
-LINUX_VERSION ?= "5.13.7"
+LINUX_VERSION ?= "5.13.9"
 LIC_FILES_CHKSUM = "file://COPYING;md5=6bc538ed5bd9a7fc9398086aedcd7e46"
 
 DEPENDS += "${@bb.utils.contains('ARCH', 'x86', 'elfutils-native', '', d)}"
@@ -15,9 +15,9 @@ DEPENDS += "openssl-native util-linux-native"
 KMETA = "kernel-meta"
 KCONF_BSP_AUDIT_LEVEL = "2"
 
-SRCREV_machine:qemuarm ?= "b20abcb92e2131d0307bcc2fc71619449c0a7313"
-SRCREV_machine ?= "463cfa7f09e18123185a5c04f6bd874baed76ccb"
-SRCREV_meta ?= "ace78a314c1fcbf7bd34791f4b0d014c83bb9b2e"
+SRCREV_machine:qemuarm ?= "900da50ce87ab003fecea205f1e1a8c0cdb1ff04"
+SRCREV_machine ?= "3401b8f14370ed2d667c7aa8415c2fcfe50bb414"
+SRCREV_meta ?= "2b89265a0bf39358c674a8e0f38552f6adec6ad8"
 
 PV = "${LINUX_VERSION}+git${SRCPV}"
 
diff --git a/meta/recipes-kernel/linux/linux-yocto_5.13.bb b/meta/recipes-kernel/linux/linux-yocto_5.13.bb
index ad879c121d..cde00b56a5 100644
--- a/meta/recipes-kernel/linux/linux-yocto_5.13.bb
+++ b/meta/recipes-kernel/linux/linux-yocto_5.13.bb
@@ -13,17 +13,17 @@ KBRANCH:qemux86  ?= "v5.13/standard/base"
 KBRANCH:qemux86-64 ?= "v5.13/standard/base"
 KBRANCH:qemumips64 ?= "v5.13/standard/mti-malta64"
 
-SRCREV_machine:qemuarm ?= "e60a114de1d12cc9cc522744442c0e212992b480"
-SRCREV_machine:qemuarm64 ?= "0b6fb68102f301774228315b13aa9f5027f1bf3b"
-SRCREV_machine:qemumips ?= "05f785b4ea88d196349c9fd07e09e867d9ce04cb"
-SRCREV_machine:qemuppc ?= "ac41bcb4f779c128c43175f81c376a8b7a68e8d6"
-SRCREV_machine:qemuriscv64 ?= "c1eb1eaf6fd3f1302b89194f629eafb9368a326a"
-SRCREV_machine:qemuriscv32 ?= "c1eb1eaf6fd3f1302b89194f629eafb9368a326a"
-SRCREV_machine:qemux86 ?= "c1eb1eaf6fd3f1302b89194f629eafb9368a326a"
-SRCREV_machine:qemux86-64 ?= "c1eb1eaf6fd3f1302b89194f629eafb9368a326a"
-SRCREV_machine:qemumips64 ?= "f775f677e4f8e1a57e39b85ac74f3052477cef6d"
-SRCREV_machine ?= "c1eb1eaf6fd3f1302b89194f629eafb9368a326a"
-SRCREV_meta ?= "ace78a314c1fcbf7bd34791f4b0d014c83bb9b2e"
+SRCREV_machine:qemuarm ?= "e85bc7dd9373a476d7a190b31aed1b95811a82ee"
+SRCREV_machine:qemuarm64 ?= "a88c6ef395d5fb8e0b6d8df3e1099b7e5b584968"
+SRCREV_machine:qemumips ?= "c040b29d5eda76464d67b59373977f289d3646df"
+SRCREV_machine:qemuppc ?= "5c6982e564b80ec80f77d728186f7b29ff62898f"
+SRCREV_machine:qemuriscv64 ?= "609a8a548c0931b07afb0f8b92068ec10e306aa5"
+SRCREV_machine:qemuriscv32 ?= "609a8a548c0931b07afb0f8b92068ec10e306aa5"
+SRCREV_machine:qemux86 ?= "609a8a548c0931b07afb0f8b92068ec10e306aa5"
+SRCREV_machine:qemux86-64 ?= "609a8a548c0931b07afb0f8b92068ec10e306aa5"
+SRCREV_machine:qemumips64 ?= "583c978f97f6e1b779f2210e74907d0c1c3da9a2"
+SRCREV_machine ?= "609a8a548c0931b07afb0f8b92068ec10e306aa5"
+SRCREV_meta ?= "2b89265a0bf39358c674a8e0f38552f6adec6ad8"
 
 # set your preferred provider of linux-yocto to 'linux-yocto-upstream', and you'll
 # get the <version>/base branch, which is pure upstream -stable, and the same
@@ -31,7 +31,7 @@ SRCREV_meta ?= "ace78a314c1fcbf7bd34791f4b0d014c83bb9b2e"
 # normal PREFERRED_VERSION settings.
 BBCLASSEXTEND = "devupstream:target"
 DEFAULT_PREFERENCE:class-devupstream = "-1"
-SRCREV_machine:class-devupstream ?= "f17352f54186bbf084d147e15efb5340430aacae"
+SRCREV_machine:class-devupstream ?= "f259ee2f037925eaf3d0c53f7d7aa2d3fae4ea13"
 PN:class-devupstream = "linux-yocto-upstream"
 KBRANCH:class-devupstream = "v5.13/base"
 
@@ -42,7 +42,7 @@ SRC_URI = "git://git.yoctoproject.org/linux-yocto.git;name=machine;branch=${KBRA
            git://git.yoctoproject.org/yocto-kernel-cache;type=kmeta;name=meta;branch=yocto-5.13;destsuffix=${KMETA}"
 
 LIC_FILES_CHKSUM = "file://COPYING;md5=6bc538ed5bd9a7fc9398086aedcd7e46"
-LINUX_VERSION ?= "5.13.7"
+LINUX_VERSION ?= "5.13.9"
 
 DEPENDS += "${@bb.utils.contains('ARCH', 'x86', 'elfutils-native', '', d)}"
 DEPENDS += "openssl-native util-linux-native"
-- 
2.19.1

