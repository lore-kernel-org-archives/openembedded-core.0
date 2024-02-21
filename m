Return-Path: <bruce.ashfield@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id B83DBC54787
	for <webhook@archiver.kernel.org>; Wed, 21 Feb 2024 02:18:43 +0000 (UTC)
Received: from mail-qv1-f45.google.com (mail-qv1-f45.google.com [209.85.219.45])
 by mx.groups.io with SMTP id smtpd.web11.4187.1708481920534801995
 for <openembedded-core@lists.openembedded.org>;
 Tue, 20 Feb 2024 18:18:40 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20230601 header.b=heHa9dpo;
 spf=pass (domain: gmail.com, ip: 209.85.219.45, mailfrom: bruce.ashfield@gmail.com)
Received: by mail-qv1-f45.google.com with SMTP id 6a1803df08f44-68ee2c0a237so39855516d6.1
        for <openembedded-core@lists.openembedded.org>; Tue, 20 Feb 2024 18:18:40 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1708481919; x=1709086719; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=Ah2cShhn5973FibSlaOaJn9veVnzaEUIuCoh8xh5Ycw=;
        b=heHa9dpoBJ8j6MrsQy4/G+cgkKD2i6dnnFx7mzfnBhRjKmXPFM4RbELMQ0yAANr89P
         3a7v5NwDTeSKn52DmMpwVf1Khz5cHTaJD+sFR/7PEI8TJbwiV0FNPfyJj/rXIwq5qWgS
         xBOgxj1AAdUtxwTr3zAEh3dlBjrGzBLHbUVjUeSEfxcGhHHCd3cLtFPtWdiBjOKhPXS8
         II2yA+AVK5mOgMPDHQVUzbfFkI9P53imhFbhWjA811ucDyDFOOZuNXRV2NwrXXXFbGNE
         xp7NZXinZsUW00uYGcxa9Pjc7TkNAvi6fF7P7fLMbF6ggiipqlpGYm6GNqe9eWR60XbM
         TKkw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1708481919; x=1709086719;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=Ah2cShhn5973FibSlaOaJn9veVnzaEUIuCoh8xh5Ycw=;
        b=Hd26Sq6GJ4cpz1jG8cgLSp7Cfpk2cY/zilijOVUr8Z9+XUJGEe+0uOjS4oj5xLyQhS
         OKqazPMr8Q7UxPcJkRAx7qx/8DZr1skduAr8tauwkPXBKV306SJ+FdWBD0ux62VphGm/
         3JNbbAOjXCwji/MmqtUFvxV2esBqK5hCoD4XsH9PUuqNBs7PD6DdCM/oNeoL9aFL7Yfa
         Ol42Oj06HmMsOuuNEvDvMDPGQoKYYvZGw6I9jCPbMHZ32ooOYF1kV2y1ljZ8gZfU7OQp
         GTT/UQOrfi7EXV67tu+63TvKhddllGCRrD2lVOIoQuMPcPMbQ3l2mrUF2Acx35HrZbR1
         sVAg==
X-Gm-Message-State: AOJu0YxDw1Wem7lMgYKNvbNBXwDOGqB1KWpCpXfKPXUY2FSmgcNs72Eq
	/hCzo7VmiAARySJnEKhvovjtJnDM717bJtKVWHgMF6kzhs6ngFy2Co6OKbN7
X-Google-Smtp-Source: AGHT+IEomJQFfWKDBS9zBncLnolJ7af9skqqn0VT3mqjH6onDep+ESf48sjdk3IHlc97e7z2mYXpkA==
X-Received: by 2002:a0c:ab13:0:b0:68f:98dd:b5e8 with SMTP id h19-20020a0cab13000000b0068f98ddb5e8mr3743102qvb.8.1708481919300;
        Tue, 20 Feb 2024 18:18:39 -0800 (PST)
Received: from bruce-XPS-8940.localdomain ([174.112.62.108])
        by smtp.gmail.com with ESMTPSA id kf10-20020a056214524a00b0068f8d38135fsm1470360qvb.133.2024.02.20.18.18.38
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 20 Feb 2024 18:18:38 -0800 (PST)
From: bruce.ashfield@gmail.com
To: richard.purdie@linuxfoundation.org
Cc: openembedded-core@lists.openembedded.org
Subject: [PATCH 1/2] linux-yocto/6.6: update to v6.6.17
Date: Tue, 20 Feb 2024 21:18:36 -0500
Message-Id: <20240221021837.3233387-1-bruce.ashfield@gmail.com>
X-Mailer: git-send-email 2.39.2
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Wed, 21 Feb 2024 02:18:43 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/195934

From: Bruce Ashfield <bruce.ashfield@gmail.com>

Updating linux-yocto/6.6 to the latest korg -stable release that comprises
the following commits:

    b2c9bf06474e Linux 6.6.17
    b734f7a47aeb netfilter: nft_set_rbtree: skip end interval element from gc
    d850a1f8dbbe net: stmmac: xgmac: fix a typo of register name in DPP safety handling
    2fbdc116640f ALSA: usb-audio: Sort quirk table entries
    460951a8e502 net: stmmac: xgmac: use #define for string constants
    22ccf61c336e io_uring/net: limit inline multishot retries
    7cbd3aa59db5 io_uring/poll: add requeue return code from poll multishot handling
    eac52bfe2333 io_uring/net: un-indent mshot retry path in io_recv_finish()
    0848bf7e539a io_uring/poll: move poll execution helpers higher up
    0ceb7a9230d6 io_uring/net: fix sr->len for IORING_OP_RECV with MSG_WAITALL and buffers
    7a62d444a252 media: solo6x10: replace max(a, min(b, c)) by clamp(b, a, c)
    d41ba25cb8b6 Revert "ASoC: amd: Add new dmi entries for acp5x platform"
    ac589a37bc0c Input: atkbd - skip ATKBD_CMD_SETLEDS when skipping ATKBD_CMD_GETID
    38d4dfeb0a8d Input: i8042 - fix strange behavior of touchpad on Clevo NS70PU
    4abccba26f63 hrtimer: Report offline hrtimer enqueue
    f0b1398669a3 usb: dwc3: pci: add support for the Intel Arrow Lake-H
    f5e7ffa9269a xhci: handle isoc Babble and Buffer Overrun events properly
    b5595a07ce1b xhci: process isoc TD properly when there was a transaction error mid TD.
    a78f36f39a76 usb: host: xhci-plat: Add support for XHCI_SG_TRB_CACHE_SIZE_QUIRK
    b3e8e687d2db usb: dwc3: host: Set XHCI_SG_TRB_CACHE_SIZE_QUIRK
    2aed1b6c33af x86/lib: Revert to _ASM_EXTABLE_UA() for {get,put}_user() fixups
    7add0db9543e Revert "usb: typec: tcpm: fix cc role at port reset"
    2d744a0cf852 USB: serial: cp210x: add ID for IMST iM871A-USB
    4d53c5124b82 USB: serial: option: add Fibocom FM101-GL variant
    1f2c1cf43e88 USB: serial: qcserial: add new usb-id for Dell Wireless DW5826e
    dbeb9bf62c95 ALSA: usb-audio: add quirk for RODE NT-USB+
    49ab71ba24b3 ALSA: usb-audio: Add a quirk for Yamaha YIT-W12TX transmitter
    790053c73394 ALSA: usb-audio: Add delay quirk for MOTU M Series 2nd revision
    27b216130e64 blk-iocost: Fix an UBSAN shift-out-of-bounds warning
    89b00dc3d6bb riscv: declare overflow_stack as exported from traps.c
    bc401f796061 riscv: Fix arch_hugetlb_migration_supported() for NAPOT
    da9c33a70f09 libceph: just wait for more data to be available on the socket
    90731f99f8c1 libceph: rename read_sparse_msg_*() to read_partial_sparse_msg_*()
    f4b69db0efca riscv: Flush the tlb when a page directory is freed
    aceb4ab9689b scsi: core: Move scsi_host_busy() out of host lock if it is for per-command
    d0d1f9a9b937 riscv: Fix hugetlb_mask_last_page() when NAPOT is enabled
    21dba4e4f071 riscv: Fix set_huge_pte_at() for NAPOT mapping
    d37708448b13 riscv: mm: execute local TLB flush after populating vmemmap
    c4a05cf0ed78 mm: Introduce flush_cache_vmap_early()
    9bf829def8cf riscv: Improve flush_tlb_kernel_range()
    53a38f8f75ec riscv: Make __flush_tlb_range() loop over pte instead of flushing the whole tlb
    72afe05d6265 riscv: Improve tlb_flush()
    fb7bcd1722bc fs/ntfs3: Fix an NULL dereference bug
    bab2fb9d6b67 netfilter: nft_set_pipapo: remove scratch_aligned pointer
    9af9079ca1fd netfilter: nft_set_pipapo: add helper to release pcpu scratch area
    e96795240aec netfilter: nft_set_pipapo: store index in scratch maps
    28c5407cd2e4 netfilter: nft_ct: reject direction for ct id
    cd9bd10c59e3 drm/amd/display: Implement bounds check for stream encoder creation in DCN301
    3f3c237a7065 drm/amd/display: Add NULL test for 'timing generator' in 'dcn21_set_pipe()'
    2e150ccea131 drm/amd/display: Fix 'panel_cntl' could be null in 'dcn21_set_backlight_level()'
    a600c1ebc464 netfilter: nft_compat: restrict match/target protocol to u16
    b3f2e143eb30 netfilter: nft_compat: reject unused compat flag
    6a64b8293506 netfilter: nft_compat: narrow down revision to unsigned 8-bits
    84bfcb7774b6 selftests: cmsg_ipv6: repeat the exact packet
    7e5ef4967076 ppp_async: limit MRU to 64K
    b74aa9ce13d0 af_unix: Call kfree_skb() for dead unix_(sk)->oob_skb in GC.
    888e3524be87 tipc: Check the bearer type before calling tipc_udp_nl_bearer_add()
    94cac7da5889 selftests: net: let big_tcp test cope with slow env
    024b25117511 rxrpc: Fix counting of new acks and nacks
    2868b8e45a89 rxrpc: Fix response to PING RESPONSE ACKs to a dead call
    200cb50b9e15 rxrpc: Fix delayed ACKs to not set the reference serial number
    2c9dc472e66f rxrpc: Fix generation of serial numbers to skip zero
    41d5340cb01e drm/i915/gvt: Fix uninitialized variable in handle_mmio()
    4a5e31bdd3c1 inet: read sk->sk_family once in inet_recv_error()
    2109eb2d6aaa hwmon: (coretemp) Fix bogus core_id to attr name mapping
    853a6503c586 hwmon: (coretemp) Fix out-of-bounds memory access
    c9b0d253f1ab hwmon: (aspeed-pwm-tacho) mutex for tach reading
    76ce07eb215d octeontx2-pf: Fix a memleak otx2_sq_init
    f9d5410d8f1b atm: idt77252: fix a memleak in open_card_ubr0
    510c869ffa40 tunnels: fix out of bounds access when building IPv6 PMTU error
    10db3a7e54e2 tsnep: Fix mapping for zero copy XDP_TX action
    9ecd0d78ead2 selftests: net: avoid just another constant wait
    4bd05772c7dc selftests: net: fix tcp listener handling in pmtu.sh
    1000bd0afca1 selftests/net: change shebang to bash to support "source"
    9cf2d6d71bee selftests/net: convert pmtu.sh to run it in unique namespace
    7be281a41111 selftests/net: convert unicast_extensions.sh to run it in unique namespace
    104ab0e82134 selftests: net: cut more slack for gro fwd tests.
    004fe5b7f592 net: atlantic: Fix DMA mapping for PTP hwts ring
    6eecddd9c3c8 netdevsim: avoid potential loop in nsim_dev_trap_report_work()
    4571767d66d6 wifi: brcmfmac: Adjust n_channels usage for __counted_by
    3da5fdb61ae9 wifi: iwlwifi: exit eSR only after the FW does
    733031cd485c wifi: mac80211: fix waiting for beacons logic
    fc3432ae8232 wifi: mac80211: fix RCU use in TDLS fast-xmit
    7e0ff50131e9 net: stmmac: xgmac: fix handling of DPP safety error for DMA channels
    0e7ca435c574 x86/efistub: Avoid placing the kernel below LOAD_PHYSICAL_ADDR
    c756fd5d460b x86/efistub: Give up if memory attribute protocol returns an error
    79592a6e7bdc drm/msm/dpu: check for valid hw_pp in dpu_encoder_helper_phys_cleanup
    1449c75720e8 drm/msm/dp: return correct Colorimetry for DP_TEST_DYNAMIC_RANGE_CEA case
    1506145c2cd5 drm/msms/dp: fixed link clock divider bits be over written in BPC unknown case
    05955a703b75 xfs: respect the stable writes flag on the RT device
    d7d5ed65364c xfs: clean up FS_XFLAG_REALTIME handling in xfs_ioctl_setattr_xflags
    3581868f51a2 xfs: dquot recovery does not validate the recovered dquot
    d744e578802a xfs: clean up dqblk extraction
    b28b234276a8 xfs: inode recovery does not validate the recovered inode
    5411625f8dde xfs: fix again select in kconfig XFS_ONLINE_SCRUB_STATS
    0838177b012b xfs: fix internal error from AGFL exhaustion
    c86562e6918a xfs: up(ic_sema) if flushing data device fails
    767a94d81616 xfs: only remap the written blocks in xfs_reflink_end_cow_extent
    005be6684225 xfs: abort intent items when recovery intents fail
    23f3d79fc983 xfs: factor out xfs_defer_pending_abort
    d7d84772c3f0 xfs: allow read IO and FICLONE to run concurrently
    d4eba134c509 xfs: handle nimaps=0 from xfs_bmapi_write in xfs_alloc_file_space
    47b07e51d0c2 xfs: introduce protection for drop nlink
    0fbbfe5fbfbe xfs: make sure maxlen is still congruent with prod when rounding down
    e3aca4536b6b xfs: fix units conversion error in xfs_bmap_del_extent_delay
    fe327b8234d4 xfs: rt stubs should return negative errnos when rt disabled
    6a6bb41b31df xfs: prevent rt growfs when quota is enabled
    e820b13ba866 xfs: hoist freeing of rt data fork extent mappings
    195f22386e19 xfs: bump max fsgeom struct version
    c778631b4abc MAINTAINERS: add Catherine as xfs maintainer for 6.6.y
    73596f5ab35f rust: upgrade to Rust 1.73.0
    aacae44644fb rust: print: use explicit link in documentation
    e8e7a528220a rust: task: remove redundant explicit link
    9b33bb254d1b rust: upgrade to Rust 1.72.1
    31a254f6920a rust: arc: add explicit `drop()` around `Box::from_raw()`
    cff97d683a08 cifs: failure to add channel on iface should bump up weight
    fb708025b1f1 cifs: avoid redundant calls to disable multichannel
    14ef61594a5a phy: ti: phy-omap-usb2: Fix NULL pointer dereference for SRP
    9851389b1c39 dmaengine: fix is_slave_direction() return false when DMA_DEV_TO_DEV
    f7799ecf30be perf evlist: Fix evlist__new_default() for > 1 core PMU
    6f67140cf7e1 phy: renesas: rcar-gen3-usb2: Fix returning wrong error code
    5cd8a51517ce dmaengine: fsl-qdma: Fix a memory leak related to the queue command DMA
    df6a1dc71c1d dmaengine: fsl-qdma: Fix a memory leak related to the status queue DMA
    43ad9840c123 dmaengine: ti: k3-udma: Report short packet errors
    f24ba6f9f741 dmaengine: fsl-dpaa2-qdma: Fix the size of dma pools
    ea42d6cffb0d ext4: regenerate buddy after block freeing failed if under fc replay

Signed-off-by: Bruce Ashfield <bruce.ashfield@gmail.com>
---
 .../linux/linux-yocto-rt_6.6.bb               |  6 ++--
 .../linux/linux-yocto-tiny_6.6.bb             |  6 ++--
 meta/recipes-kernel/linux/linux-yocto_6.6.bb  | 28 +++++++++----------
 3 files changed, 20 insertions(+), 20 deletions(-)

diff --git a/meta/recipes-kernel/linux/linux-yocto-rt_6.6.bb b/meta/recipes-kernel/linux/linux-yocto-rt_6.6.bb
index a516404d88..11f8b0ac21 100644
--- a/meta/recipes-kernel/linux/linux-yocto-rt_6.6.bb
+++ b/meta/recipes-kernel/linux/linux-yocto-rt_6.6.bb
@@ -14,13 +14,13 @@ python () {
         raise bb.parse.SkipRecipe("Set PREFERRED_PROVIDER_virtual/kernel to linux-yocto-rt to enable it")
 }
 
-SRCREV_machine ?= "4076926df2ff94dd0b990acba799e95de5fb1c53"
-SRCREV_meta ?= "301db0019eb67dd500919a201eaf49a6690b9c55"
+SRCREV_machine ?= "f0a5daf40acf2b457445f9b4f97f9eb2a3d1508a"
+SRCREV_meta ?= "86a5aa3e0d1c850b0cff608fcbfbddac77ab3299"
 
 SRC_URI = "git://git.yoctoproject.org/linux-yocto.git;branch=${KBRANCH};name=machine;protocol=https \
            git://git.yoctoproject.org/yocto-kernel-cache;type=kmeta;name=meta;branch=yocto-6.6;destsuffix=${KMETA};protocol=https"
 
-LINUX_VERSION ?= "6.6.16"
+LINUX_VERSION ?= "6.6.17"
 
 LIC_FILES_CHKSUM = "file://COPYING;md5=6bc538ed5bd9a7fc9398086aedcd7e46"
 
diff --git a/meta/recipes-kernel/linux/linux-yocto-tiny_6.6.bb b/meta/recipes-kernel/linux/linux-yocto-tiny_6.6.bb
index 2073a4b036..597ee8eeb5 100644
--- a/meta/recipes-kernel/linux/linux-yocto-tiny_6.6.bb
+++ b/meta/recipes-kernel/linux/linux-yocto-tiny_6.6.bb
@@ -8,7 +8,7 @@ require recipes-kernel/linux/linux-yocto.inc
 # CVE exclusions
 include recipes-kernel/linux/cve-exclusion_6.6.inc
 
-LINUX_VERSION ?= "6.6.16"
+LINUX_VERSION ?= "6.6.17"
 LIC_FILES_CHKSUM = "file://COPYING;md5=6bc538ed5bd9a7fc9398086aedcd7e46"
 
 DEPENDS += "${@bb.utils.contains('ARCH', 'x86', 'elfutils-native', '', d)}"
@@ -17,8 +17,8 @@ DEPENDS += "openssl-native util-linux-native"
 KMETA = "kernel-meta"
 KCONF_BSP_AUDIT_LEVEL = "2"
 
-SRCREV_machine ?= "fe5ec7bef162341ff0fbcef6996df5090a07aee1"
-SRCREV_meta ?= "301db0019eb67dd500919a201eaf49a6690b9c55"
+SRCREV_machine ?= "cdd0ebde3e0d20f0524b1328b9ea2d23e82dc629"
+SRCREV_meta ?= "86a5aa3e0d1c850b0cff608fcbfbddac77ab3299"
 
 PV = "${LINUX_VERSION}+git"
 
diff --git a/meta/recipes-kernel/linux/linux-yocto_6.6.bb b/meta/recipes-kernel/linux/linux-yocto_6.6.bb
index 4fa6eca8aa..0dc95ba754 100644
--- a/meta/recipes-kernel/linux/linux-yocto_6.6.bb
+++ b/meta/recipes-kernel/linux/linux-yocto_6.6.bb
@@ -18,25 +18,25 @@ KBRANCH:qemux86-64 ?= "v6.6/standard/base"
 KBRANCH:qemuloongarch64  ?= "v6.6/standard/base"
 KBRANCH:qemumips64 ?= "v6.6/standard/mti-malta64"
 
-SRCREV_machine:qemuarm ?= "daff911123b820eb23e9a0ee0b4e6b3c9820bfa4"
-SRCREV_machine:qemuarm64 ?= "fe5ec7bef162341ff0fbcef6996df5090a07aee1"
-SRCREV_machine:qemuloongarch64 ?= "fe5ec7bef162341ff0fbcef6996df5090a07aee1"
-SRCREV_machine:qemumips ?= "1de311a1699bb7351d826029b34a8dd087241fe6"
-SRCREV_machine:qemuppc ?= "fe5ec7bef162341ff0fbcef6996df5090a07aee1"
-SRCREV_machine:qemuriscv64 ?= "fe5ec7bef162341ff0fbcef6996df5090a07aee1"
-SRCREV_machine:qemuriscv32 ?= "fe5ec7bef162341ff0fbcef6996df5090a07aee1"
-SRCREV_machine:qemux86 ?= "fe5ec7bef162341ff0fbcef6996df5090a07aee1"
-SRCREV_machine:qemux86-64 ?= "fe5ec7bef162341ff0fbcef6996df5090a07aee1"
-SRCREV_machine:qemumips64 ?= "d764bf0df085f9901e4466eec99442b5c48aa814"
-SRCREV_machine ?= "fe5ec7bef162341ff0fbcef6996df5090a07aee1"
-SRCREV_meta ?= "301db0019eb67dd500919a201eaf49a6690b9c55"
+SRCREV_machine:qemuarm ?= "6e5be8c946e8577bcc1ab052ec174ff930590c29"
+SRCREV_machine:qemuarm64 ?= "cdd0ebde3e0d20f0524b1328b9ea2d23e82dc629"
+SRCREV_machine:qemuloongarch64 ?= "cdd0ebde3e0d20f0524b1328b9ea2d23e82dc629"
+SRCREV_machine:qemumips ?= "898347dbb9a2538f0140e56871fc22509ba1126c"
+SRCREV_machine:qemuppc ?= "cdd0ebde3e0d20f0524b1328b9ea2d23e82dc629"
+SRCREV_machine:qemuriscv64 ?= "cdd0ebde3e0d20f0524b1328b9ea2d23e82dc629"
+SRCREV_machine:qemuriscv32 ?= "cdd0ebde3e0d20f0524b1328b9ea2d23e82dc629"
+SRCREV_machine:qemux86 ?= "cdd0ebde3e0d20f0524b1328b9ea2d23e82dc629"
+SRCREV_machine:qemux86-64 ?= "cdd0ebde3e0d20f0524b1328b9ea2d23e82dc629"
+SRCREV_machine:qemumips64 ?= "7c478488b642339d97ac55fd8b1acfd086e95c5c"
+SRCREV_machine ?= "cdd0ebde3e0d20f0524b1328b9ea2d23e82dc629"
+SRCREV_meta ?= "86a5aa3e0d1c850b0cff608fcbfbddac77ab3299"
 
 # set your preferred provider of linux-yocto to 'linux-yocto-upstream', and you'll
 # get the <version>/base branch, which is pure upstream -stable, and the same
 # meta SRCREV as the linux-yocto-standard builds. Select your version using the
 # normal PREFERRED_VERSION settings.
 BBCLASSEXTEND = "devupstream:target"
-SRCREV_machine:class-devupstream ?= "eb3e299184cc4f40d4bd84fda269b3a20ddcff80"
+SRCREV_machine:class-devupstream ?= "b2c9bf06474ea12eaca7d5f007e9280e057e960b"
 PN:class-devupstream = "linux-yocto-upstream"
 KBRANCH:class-devupstream = "v6.6/base"
 
@@ -44,7 +44,7 @@ SRC_URI = "git://git.yoctoproject.org/linux-yocto.git;name=machine;branch=${KBRA
            git://git.yoctoproject.org/yocto-kernel-cache;type=kmeta;name=meta;branch=yocto-6.6;destsuffix=${KMETA};protocol=https"
 
 LIC_FILES_CHKSUM = "file://COPYING;md5=6bc538ed5bd9a7fc9398086aedcd7e46"
-LINUX_VERSION ?= "6.6.16"
+LINUX_VERSION ?= "6.6.17"
 
 PV = "${LINUX_VERSION}+git"
 
-- 
2.39.2


