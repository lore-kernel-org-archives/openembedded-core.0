Return-Path: <steve@sakoman.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 5574EE748F5
	for <webhook@archiver.kernel.org>; Sun,  1 Oct 2023 16:00:35 +0000 (UTC)
Received: from mail-pl1-f172.google.com (mail-pl1-f172.google.com [209.85.214.172])
 by mx.groups.io with SMTP id smtpd.web11.62142.1696176031184333577
 for <openembedded-core@lists.openembedded.org>;
 Sun, 01 Oct 2023 09:00:31 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@sakoman-com.20230601.gappssmtp.com header.s=20230601 header.b=QaY+P8d3;
 spf=softfail (domain: sakoman.com, ip: 209.85.214.172, mailfrom: steve@sakoman.com)
Received: by mail-pl1-f172.google.com with SMTP id d9443c01a7336-1c5ff5f858dso91439705ad.2
        for <openembedded-core@lists.openembedded.org>; Sun, 01 Oct 2023 09:00:31 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=sakoman-com.20230601.gappssmtp.com; s=20230601; t=1696176030; x=1696780830; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=xwXTe6hD3eirnSwnJEDYsojAhfPcZDDvKbSfuhafzMA=;
        b=QaY+P8d3atQPmCsp72j+Gw9Ic/qH+H2l6nVV3Dbb16AyLaPi10jLD5koZlTdAx8duT
         x84K+r5sI61gwvFbYDcWCiC+CzzVcV29QTuDwPC4MyaBacqCetTQUiyl/4bgL7QVBO+r
         zSRIjlcvRnpreJMatJgFFLJHVjY5PzPjPnuEqg9kZqOdVGjzD3jC9WVrsNbiqRXWeCI+
         qwWWKqYypdo6ueNyOi6rVxWH378+xJ4L0v+1RY4au0HgpbNYvb2wYoLm4cSF7GuNv2Ry
         +apNmsDq5kNEIItVrvVqActCgK4QBAd6StRiftt9fczGR4R1t+WeLUgvDIItRyonOAkj
         j++w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1696176030; x=1696780830;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=xwXTe6hD3eirnSwnJEDYsojAhfPcZDDvKbSfuhafzMA=;
        b=EQZ85UdwXpu+AW7sm8932st9PH6MT3dgSuuxTBr4MgjZk5Jv87eytAvRSXsHrvZv8B
         xZAIPiCjGwgwyd6gk+1whSlZHHbXC7kN0SCxxxlvU3hAuayI5cX8yty1IJXf2yZGKdbM
         opUR9tQJQ/C1jnAjqaJXFMuCkdhSnhCDlYoqE4N01/24MHf9mgdGNCZcLWARcpqINtUn
         pY4pm29V2k5s4w0fTmoG7Ll8Ezry1rYN7x9MjWIBYRlOsxKXvZG3jHR4+4i2d/yZCwNM
         dz1g3HppbM9SC+PLzJoAiCod/XOMKHpWPQqEYWp61KJWoii9Q95freTt3u0dq5NCLGT0
         IV5w==
X-Gm-Message-State: AOJu0YxgCO/Z5buOZyvbR9LDTOppG/30l7oSQromnKrUhGEgpGys7LHd
	VwwfgGCD0ZO4KzzK+wJxIaOTUOvP/d1XZtEo3cE4zA==
X-Google-Smtp-Source: AGHT+IFrRW/qP4OZkytqnYx6vEU9tW0NoDijPzz3cYlRRf7MsFkFBP7eOJnJm7UPN3nbX0vnRuU2RQ==
X-Received: by 2002:a17:902:c409:b0:1c4:4a4d:cda with SMTP id k9-20020a170902c40900b001c44a4d0cdamr9181948plk.15.1696176028596;
        Sun, 01 Oct 2023 09:00:28 -0700 (PDT)
Received: from hexa.lan (dhcp-72-234-106-30.hawaiiantel.net. [72.234.106.30])
        by smtp.gmail.com with ESMTPSA id jk4-20020a170903330400b001c5900c9e8fsm15416967plb.81.2023.10.01.09.00.27
        for <openembedded-core@lists.openembedded.org>
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 01 Oct 2023 09:00:28 -0700 (PDT)
From: Steve Sakoman <steve@sakoman.com>
To: openembedded-core@lists.openembedded.org
Subject: [OE-core][mickledore 06/23] linux-yocto/5.15: update to v5.15.127
Date: Sun,  1 Oct 2023 05:59:53 -1000
Message-Id: <b0dc6cea72d2c61babef286effbc2019b39dc3ea.1696175813.git.steve@sakoman.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <cover.1696175813.git.steve@sakoman.com>
References: <cover.1696175813.git.steve@sakoman.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Sun, 01 Oct 2023 16:00:35 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/188495

From: Bruce Ashfield <bruce.ashfield@gmail.com>

Updating  to the latest korg -stable release that comprises
the following commits:

    f6f7927ac664 Linux 5.15.127
    c597d8cb0d33 timers/nohz: Last resort update jiffies on nohz_full IRQ entry
    b4d36e6c5dc4 timers/nohz: Switch to ONESHOT_STOPPED in the low-res handler when the tick is stopped
    c3b954a51b64 tick: Detect and fix jiffies update stall
    af99918f0e39 sch_netem: fix issues in netem_change() vs get_dist_table()
    5d094d4e7b99 alpha: remove __init annotation from exported page_is_ram()
    f8d6d25756ea scsi: qedf: Fix firmware halt over suspend and resume
    85db1cd1744e scsi: qedi: Fix firmware halt over suspend and resume
    e70469c28953 scsi: fnic: Replace return codes in fnic_clean_pending_aborts()
    6bc7f4c8c27d scsi: core: Fix possible memory leak if device_add() fails
    461f8ac666fa scsi: snic: Fix possible memory leak if device_add() fails
    171e117cdc0a scsi: 53c700: Check that command slot is not NULL
    7a792b3d888a scsi: storvsc: Fix handling of virtual Fibre Channel timeouts
    0f52d7b78251 scsi: core: Fix legacy /proc parsing buffer overflow
    b757ef99df39 netfilter: nf_tables: report use refcount overflow
    9bdbbcf9d148 nvme-rdma: fix potential unbalanced freeze & unfreeze
    d68f8ef6ef70 nvme-tcp: fix potential unbalanced freeze & unfreeze
    ae6e21f8bb2a btrfs: set cache_block_group_error if we find an error
    314135b7bae9 btrfs: reject invalid reloc tree root keys with stack dump
    69dd147de419 btrfs: exit gracefully if reloc roots don't match
    c40d4b60c58d btrfs: don't stop integrity writeback too early
    555e126dd30b ibmvnic: Handle DMA unmapping of login buffs in release functions
    34fcc823823a ibmvnic: Unmap DMA login rsp buffer on send login fail
    cee62753cf2e ibmvnic: Enforce stronger sanity checks on login response
    27e8db8380eb net/mlx5: Skip clock update work when device is in error state
    f638fc2f7377 net/mlx5: Allow 0 for total host VFs
    086a80eb6213 dmaengine: mcf-edma: Fix a potential un-allocated memory access
    7e1dc94b2d50 nexthop: Fix infinite nexthop bucket dump when using maximum nexthop ID
    608a4327c257 nexthop: Make nexthop bucket dump more efficient
    4457300cfd84 nexthop: Fix infinite nexthop dump when using maximum nexthop ID
    91307347d632 net: hns3: add wait until mac link down
    094310eb2b93 net: hns3: refactor hclge_mac_link_status_wait for interface reuse
    1ae9703c2e32 net: phy: at803x: remove set/get wol callbacks for AR8032
    7d496cd83a9d RDMA/umem: Set iova in ODP flow
    f78a4238a873 wifi: cfg80211: fix sband iftype data lookup for AP_VLAN
    26a27dd76054 drm/rockchip: Don't spam logs in atomic check
    918c1e6843b7 IB/hfi1: Fix possible panic during hotplug remove
    df21468bfdc8 iavf: fix potential races for FDIR filters
    b1f985cf1c52 drivers: net: prevent tun_build_skb() to exceed the packet size limit
    f239c9e1d98b dccp: fix data-race around dp->dccps_mss_cache
    49a1fee22fae bonding: Fix incorrect deletion of ETH_P_8021AD protocol vid from slaves
    789fcd94c9ca xsk: fix refcount underflow in error path
    e95808121953 tunnels: fix kasan splat when generating ipv4 pmtu error
    7903311b2cec net/packet: annotate data-races around tp->status
    f4614e379bf9 mISDN: Update parameter type of dsp_cmx_send()
    3961761af392 bpf, sockmap: Fix bug that strp_done cannot be called
    20d53895d5c0 bpf, sockmap: Fix map type error in sock_map_del_link
    a09c258cfa77 net: core: remove unnecessary frame_sz check in bpf_xdp_adjust_tail()
    85af0b226c0b selftests: forwarding: tc_flower: Relax success criterion
    7b3fa99526f9 selftests: forwarding: Switch off timeout
    e410f85ebca9 selftests: forwarding: Skip test when no interfaces are specified
    4a4499452620 selftests: forwarding: ethtool_extended_state: Skip when using veth pairs
    b8d216e9c607 selftests: forwarding: ethtool: Skip when using veth pairs
    b9dfb80d9fb2 selftests: forwarding: Add a helper to skip test when using veth pairs
    b973eb76dff3 selftests/rseq: Fix build with undefined __weak
    b8b8db5857d4 drm/nouveau/disp: Revert a NULL check inside nouveau_connector_get_modes
    4c6767c8bf5e x86: Move gds_ucode_mitigated() declaration to header
    f919cbc90441 x86/speculation: Add cpu_show_gds() prototype
    9290ef14c96b x86/mm: Fix VDSO and VVAR placement on 5-level paging machines
    829409510d00 x86/cpu/amd: Enable Zenbleed fix for AMD Custom APU 0405
    c41a22b93d7c x86/srso: Fix build breakage with the LLVM linker
    c2372b1559d4 usb: typec: tcpm: Fix response to vsafe0V event
    f776b94ccdf0 usb: common: usb-conn-gpio: Prevent bailing out if initial role is none
    00cc14b52d6f usb: dwc3: Properly handle processing of pending events
    7a11d1e2625b usb-storage: alauda: Fix uninit-value in alauda_check_media()
    945e1b3c361b misc: rtsx: judge ASPM Mode to set PETXCFG Reg
    03eebad96233 binder: fix memory leak in binder_init()
    a8e2ae6296d5 iio: adc: ina2xx: avoid NULL pointer dereference on OF device match
    2df8ae1e42b8 iio: cros_ec: Fix the allocation size for cros_ec_command
    a7cedc2b7612 io_uring: correct check for O_TMPFILE
    697bc234632c selftests/bpf: Fix sk_assign on s390x
    127277262110 selftests/bpf: Workaround verification failure for fexit_bpf2bpf/func_replace_return_code
    ee701208f4cc selftests/bpf: make test_align selftest more robust
    683d2969a082 bpf: aggressively forget precise markings during state checkpointing
    2516deeb872a bpf: stop setting precise in current state
    c47d0178ad86 bpf: allow precision tracking for programs with subprogs
    3645510cf926 nilfs2: fix use-after-free of nilfs_root in dirtying inodes via iput
    36a3b560c78d radix tree test suite: fix incorrect allocation size for pthreads
    8d10284243b7 hwmon: (pmbus/bel-pfe) Enable PMBUS_SKIP_STATUS_CHECK for pfe1100
    3ad4ba2b6112 drm/amd/display: check attr flag before set cursor degamma on DCN3+
    621204fca047 drm/shmem-helper: Reset vma->vm_ops before calling dma_buf_mmap()
    64e6253f6489 drm/nouveau/gr: enable memory loads on helper invocation on all channels
    bcd9eeb3a309 riscv,mmio: Fix readX()-to-delay() ordering
    57772ae9b339 dmaengine: pl330: Return DMA_PAUSED when transaction is paused
    3ca8f5c733c4 ipv6: adjust ndisc_is_useropt() to also return true for PIO
    6cde60777675 mmc: moxart: read scr register without changing byte order
    3f00757ab416 wireguard: allowedips: expand maximum node depth
    aeb974907642 ksmbd: fix wrong next length validation of ea buffer in smb2_set_ea()
    595679098bdc ksmbd: validate command request size

Signed-off-by: Bruce Ashfield <bruce.ashfield@gmail.com>
Signed-off-by: Steve Sakoman <steve@sakoman.com>
---
 .../linux/linux-yocto-rt_5.15.bb              |  6 ++---
 .../linux/linux-yocto-tiny_5.15.bb            |  6 ++---
 meta/recipes-kernel/linux/linux-yocto_5.15.bb | 26 +++++++++----------
 3 files changed, 19 insertions(+), 19 deletions(-)

diff --git a/meta/recipes-kernel/linux/linux-yocto-rt_5.15.bb b/meta/recipes-kernel/linux/linux-yocto-rt_5.15.bb
index a883fe090c..293b2f75a8 100644
--- a/meta/recipes-kernel/linux/linux-yocto-rt_5.15.bb
+++ b/meta/recipes-kernel/linux/linux-yocto-rt_5.15.bb
@@ -11,13 +11,13 @@ python () {
         raise bb.parse.SkipRecipe("Set PREFERRED_PROVIDER_virtual/kernel to linux-yocto-rt to enable it")
 }
 
-SRCREV_machine ?= "7f5083ab7cf0b34b46a1e08716163438cfe113fa"
-SRCREV_meta ?= "d63dc98bfc78b2d086cc3565c5a12da1ed2c033a"
+SRCREV_machine ?= "cd3c15788f1201a674f47d50fcdb91f9d65cd05d"
+SRCREV_meta ?= "8616f066cc7ad4e305c11cdad0aa9a1a8a1f6c8c"
 
 SRC_URI = "git://git.yoctoproject.org/linux-yocto.git;branch=${KBRANCH};name=machine;protocol=https \
            git://git.yoctoproject.org/yocto-kernel-cache;type=kmeta;name=meta;branch=yocto-5.15;destsuffix=${KMETA};protocol=https"
 
-LINUX_VERSION ?= "5.15.126"
+LINUX_VERSION ?= "5.15.127"
 
 LIC_FILES_CHKSUM = "file://COPYING;md5=6bc538ed5bd9a7fc9398086aedcd7e46"
 
diff --git a/meta/recipes-kernel/linux/linux-yocto-tiny_5.15.bb b/meta/recipes-kernel/linux/linux-yocto-tiny_5.15.bb
index f7970e9281..0a9d97159d 100644
--- a/meta/recipes-kernel/linux/linux-yocto-tiny_5.15.bb
+++ b/meta/recipes-kernel/linux/linux-yocto-tiny_5.15.bb
@@ -5,7 +5,7 @@ KCONFIG_MODE = "--allnoconfig"
 
 require recipes-kernel/linux/linux-yocto.inc
 
-LINUX_VERSION ?= "5.15.126"
+LINUX_VERSION ?= "5.15.127"
 LIC_FILES_CHKSUM = "file://COPYING;md5=6bc538ed5bd9a7fc9398086aedcd7e46"
 
 DEPENDS += "${@bb.utils.contains('ARCH', 'x86', 'elfutils-native', '', d)}"
@@ -14,8 +14,8 @@ DEPENDS += "openssl-native util-linux-native"
 KMETA = "kernel-meta"
 KCONF_BSP_AUDIT_LEVEL = "2"
 
-SRCREV_machine ?= "f949bdbc869e8d89cc338a74a014f6a5d3962da4"
-SRCREV_meta ?= "d63dc98bfc78b2d086cc3565c5a12da1ed2c033a"
+SRCREV_machine ?= "6329aba667477365f72d896b53c492bfba1b1609"
+SRCREV_meta ?= "8616f066cc7ad4e305c11cdad0aa9a1a8a1f6c8c"
 
 PV = "${LINUX_VERSION}+git${SRCPV}"
 
diff --git a/meta/recipes-kernel/linux/linux-yocto_5.15.bb b/meta/recipes-kernel/linux/linux-yocto_5.15.bb
index 9926cb8f73..f1ce090e22 100644
--- a/meta/recipes-kernel/linux/linux-yocto_5.15.bb
+++ b/meta/recipes-kernel/linux/linux-yocto_5.15.bb
@@ -13,24 +13,24 @@ KBRANCH:qemux86  ?= "v5.15/standard/base"
 KBRANCH:qemux86-64 ?= "v5.15/standard/base"
 KBRANCH:qemumips64 ?= "v5.15/standard/mti-malta64"
 
-SRCREV_machine:qemuarm ?= "63f9c653ac8bca862d71352211d0d191813936ae"
-SRCREV_machine:qemuarm64 ?= "97eddfe9caf2200f3d964bbea7c472b46418e61b"
-SRCREV_machine:qemumips ?= "8c0497f3d412b7a1b40254eae9628e810d365dc9"
-SRCREV_machine:qemuppc ?= "722612ff2e5ce49c89874a8b5d8fd5e80e15ede2"
-SRCREV_machine:qemuriscv64 ?= "027401d57727e10a0eaf0c0aec9e6451acf3b397"
-SRCREV_machine:qemuriscv32 ?= "027401d57727e10a0eaf0c0aec9e6451acf3b397"
-SRCREV_machine:qemux86 ?= "027401d57727e10a0eaf0c0aec9e6451acf3b397"
-SRCREV_machine:qemux86-64 ?= "027401d57727e10a0eaf0c0aec9e6451acf3b397"
-SRCREV_machine:qemumips64 ?= "907f084725f90e192f2a30045f12b49fc12be95e"
-SRCREV_machine ?= "027401d57727e10a0eaf0c0aec9e6451acf3b397"
-SRCREV_meta ?= "d63dc98bfc78b2d086cc3565c5a12da1ed2c033a"
+SRCREV_machine:qemuarm ?= "64a535013a41c2b18d6b7a6dd675ecd3d69d57bb"
+SRCREV_machine:qemuarm64 ?= "27a44fe9e1e971534af059b04af8846034d3a5e6"
+SRCREV_machine:qemumips ?= "a0ae788ca9ce2f9b26f12fb99b1f5835a7544a4e"
+SRCREV_machine:qemuppc ?= "61253ef36689575bfcd9423cb1df3b565a59ef37"
+SRCREV_machine:qemuriscv64 ?= "211e091f3737d6c0850b218f9b3f26816be7e321"
+SRCREV_machine:qemuriscv32 ?= "211e091f3737d6c0850b218f9b3f26816be7e321"
+SRCREV_machine:qemux86 ?= "211e091f3737d6c0850b218f9b3f26816be7e321"
+SRCREV_machine:qemux86-64 ?= "211e091f3737d6c0850b218f9b3f26816be7e321"
+SRCREV_machine:qemumips64 ?= "7b2aad0f77dbb1ffb558bc7215bd9d3856ab0f75"
+SRCREV_machine ?= "211e091f3737d6c0850b218f9b3f26816be7e321"
+SRCREV_meta ?= "8616f066cc7ad4e305c11cdad0aa9a1a8a1f6c8c"
 
 # set your preferred provider of linux-yocto to 'linux-yocto-upstream', and you'll
 # get the <version>/base branch, which is pure upstream -stable, and the same
 # meta SRCREV as the linux-yocto-standard builds. Select your version using the
 # normal PREFERRED_VERSION settings.
 BBCLASSEXTEND = "devupstream:target"
-SRCREV_machine:class-devupstream ?= "24c4de4069cbce796a1c71166240807d617cd652"
+SRCREV_machine:class-devupstream ?= "f6f7927ac664ba23447f8dd3c3dfe2f4ee39272f"
 PN:class-devupstream = "linux-yocto-upstream"
 KBRANCH:class-devupstream = "v5.15/base"
 
@@ -38,7 +38,7 @@ SRC_URI = "git://git.yoctoproject.org/linux-yocto.git;name=machine;branch=${KBRA
            git://git.yoctoproject.org/yocto-kernel-cache;type=kmeta;name=meta;branch=yocto-5.15;destsuffix=${KMETA};protocol=https"
 
 LIC_FILES_CHKSUM = "file://COPYING;md5=6bc538ed5bd9a7fc9398086aedcd7e46"
-LINUX_VERSION ?= "5.15.126"
+LINUX_VERSION ?= "5.15.127"
 
 DEPENDS += "${@bb.utils.contains('ARCH', 'x86', 'elfutils-native', '', d)}"
 DEPENDS += "openssl-native util-linux-native"
-- 
2.34.1


