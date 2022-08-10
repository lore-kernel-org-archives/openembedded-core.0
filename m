Return-Path: <steve@sakoman.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 698CEC00140
	for <webhook@archiver.kernel.org>; Wed, 10 Aug 2022 22:32:41 +0000 (UTC)
Received: from mail-pf1-f172.google.com (mail-pf1-f172.google.com
 [209.85.210.172])
 by mx.groups.io with SMTP id smtpd.web11.988.1660170751791283059
 for <openembedded-core@lists.openembedded.org>;
 Wed, 10 Aug 2022 15:32:31 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@sakoman-com.20210112.gappssmtp.com header.s=20210112
 header.b=s023j7HO;
 spf=softfail (domain: sakoman.com, ip: 209.85.210.172,
 mailfrom: steve@sakoman.com)
Received: by mail-pf1-f172.google.com with SMTP id d20so14959705pfq.5
        for <openembedded-core@lists.openembedded.org>;
 Wed, 10 Aug 2022 15:32:31 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=sakoman-com.20210112.gappssmtp.com; s=20210112;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:from:to:cc;
        bh=6qPqJFVtnC/105Iz0z4I/J6VXdz2roFn1RBLZ2tRH+g=;
        b=s023j7HOwffX/+D9EPCb7VAB53VwQmmqlHe65V44BxyUiNTQznhuIdPlo1MA4KEu/i
         o1Ag8sSJL/kwgkKZscC+4gjLoCbhFKagLUoqRIKFKz5P+ktva2W5IrObY01uU7ueTfH4
         x3eGaDmhcsHZb3KLzEmwePVXUBoPpLSU+6WXoRdnM8/eHt9+coBkh/fm5HkwIUxmy11c
         a9IhDspY/lC2G4QlHFh8b+OK/Zd4KiMzfXDvt6t0ZbYettpPyJKyCVcnOTkl/mdfl16X
         PPuNOYFKnjfdNNL5v/+r8RvPIjGtWW2+KYX/2DFWR7WRfslZ17E939JNEaJyyZB7cL4m
         p7Bw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:x-gm-message-state:from:to:cc;
        bh=6qPqJFVtnC/105Iz0z4I/J6VXdz2roFn1RBLZ2tRH+g=;
        b=QvRyCNkVYvH52kquR8UG0Vr0PH3aa6LTHBF4EndBLq/wzigi+ZUyIKbNuwQSGIBHr4
         82mWmq6ifrJgQV5Zi3C0sndNHBK5mLyXyft3eVs+fGpUyH3fjgeAYvhgcL6TfW8gp/eE
         M2bVby6mVncdisWwv/oDiRIFRubsuPz/+lsysNKBhlPJMTE6v/gGvx8EcV65228HBk1N
         u/YIH8ZxFrCHrwi5AbRczYuFzV9Chs9Soa68dfdE9znkzwG6K+lBUmtkKDO1t7GdDI+8
         CTPtfmZEAxeRq3DNsON6s1dhIFt5Z+qAr+05EpSZobeILeewkKosBCy0CyXMeg3BtI8H
         ewrQ==
X-Gm-Message-State: ACgBeo2pGnJ67Qpa88+8GVEZlsjUqX3UsVv2xb9azNZuCqyxrrkyhhZt
	a1cStFT2DVGLrcxs2bRcYT1fIg5PYlaORn7k
X-Google-Smtp-Source: 
 AA6agR4+/gaYEtLD+ZYUVdo2Su6q0JQxRDP8C8kryvVEEIi4PFzWBS6w+RfaOpRHuSwmJYgVJ13hcg==
X-Received: by 2002:a05:6a00:1252:b0:52f:755c:a384 with SMTP id
 u18-20020a056a00125200b0052f755ca384mr13185643pfi.2.1660170750638;
        Wed, 10 Aug 2022 15:32:30 -0700 (PDT)
Received: from hexa.router0800d9.com (dhcp-72-253-6-214.hawaiiantel.net.
 [72.253.6.214])
        by smtp.gmail.com with ESMTPSA id
 x14-20020aa79ace000000b0052d7606d144sm2532513pfp.74.2022.08.10.15.32.29
        for <openembedded-core@lists.openembedded.org>
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 10 Aug 2022 15:32:30 -0700 (PDT)
From: Steve Sakoman <steve@sakoman.com>
To: openembedded-core@lists.openembedded.org
Subject: [OE-core][dunfell 04/11] linux-yocto/5.4: update to v5.4.208
Date: Wed, 10 Aug 2022 12:32:02 -1000
Message-Id: 
 <b98028117b82aab650affb0538e77bb69fb5fdf8.1660170592.git.steve@sakoman.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <cover.1660170592.git.steve@sakoman.com>
References: <cover.1660170592.git.steve@sakoman.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Wed, 10 Aug 2022 22:32:41 -0000
X-Groupsio-URL: 
 https://lists.openembedded.org/g/openembedded-core/message/169217

From: Bruce Ashfield <bruce.ashfield@gmail.com>

Updating  to the latest korg -stable release that comprises
the following commits:

    77ba2b9b46f8 Linux 5.4.208
    ca5762c5896e x86: drop bogus "cc" clobber from __try_cmpxchg_user_asm()
    f88d8c188229 net: usb: ax88179_178a needs FLAG_SEND_ZLP
    f7785092cb7f tty: use new tty_insert_flip_string_and_push_buffer() in pty_write()
    815d936e92f9 tty: extract tty_flip_buffer_commit() from tty_flip_buffer_push()
    2ea77b0b6d22 tty: drop tty_schedule_flip()
    f20912215c9c tty: the rest, stop using tty_schedule_flip()
    aa60c0cce8b4 tty: drivers/tty/, stop using tty_schedule_flip()
    126137a53d7e Bluetooth: Fix bt_skb_sendmmsg not allocating partial chunks
    836b47e6436b Bluetooth: SCO: Fix sco_send_frame returning skb->len
    aa2d34cab3e6 Bluetooth: Fix passing NULL to PTR_ERR
    10bacb891722 Bluetooth: RFCOMM: Replace use of memcpy_from_msg with bt_skb_sendmmsg
    bf46574d4655 Bluetooth: SCO: Replace use of memcpy_from_msg with bt_skb_sendmsg
    f00b06003b11 Bluetooth: Add bt_skb_sendmmsg helper
    55bf99849be0 Bluetooth: Add bt_skb_sendmsg helper
    015af30d373d ALSA: memalloc: Align buffer allocations in page size
    352affc31e26 bitfield.h: Fix "type of reg too small for mask" test
    0a0fbbd6cb65 x86/mce: Deduplicate exception handling
    b524137fa1d8 mmap locking API: initial implementation as rwsem wrappers
    592a1c6066dd x86/uaccess: Implement macros for CMPXCHG on user addresses
    1d778b54a5c0 x86: get rid of small constant size cases in raw_copy_{to,from}_user()
    d0d583484d2e locking/refcount: Consolidate implementations of refcount_t
    dab787c73f6e locking/refcount: Consolidate REFCOUNT_{MAX,SATURATED} definitions
    0d3182fbe689 locking/refcount: Move saturation warnings out of line
    809554147d60 locking/refcount: Improve performance of generic REFCOUNT_FULL code
    9c9269977f03 locking/refcount: Move the bulk of the REFCOUNT_FULL implementation into the <linux/refcount.h> header
    04bff7d7b808 locking/refcount: Remove unused refcount_*_checked() variants
    513b19a43bec locking/refcount: Ensure integer operands are treated as signed
    68b4ee68e8c8 locking/refcount: Define constants for saturation and max refcount values
    3f71d0e292eb ima: remove the IMA_TEMPLATE Kconfig option
    bc7581e36d40 dlm: fix pending remove if msg allocation fails
    4f1d21c77b15 bpf: Make sure mac_header was set before using it
    a1f8765f68bc mm/mempolicy: fix uninit-value in mpol_rebind_policy()
    76668d2a2f36 spi: bcm2835: bcm2835_spi_handle_err(): fix NULL pointer deref for non DMA transfers
    50a1d3d09750 tcp: Fix data-races around sysctl_tcp_max_reordering.
    c64b99819de4 tcp: Fix a data-race around sysctl_tcp_rfc1337.
    6cc566df6806 tcp: Fix a data-race around sysctl_tcp_stdurg.
    7f68bed16c7b tcp: Fix a data-race around sysctl_tcp_retrans_collapse.
    369d99c2b89f tcp: Fix data-races around sysctl_tcp_slow_start_after_idle.
    492f3713b282 tcp: Fix a data-race around sysctl_tcp_thin_linear_timeouts.
    92c35113c633 tcp: Fix data-races around sysctl_tcp_recovery.
    83767fe800a3 tcp: Fix a data-race around sysctl_tcp_early_retrans.
    795aee11fda4 tcp: Fix data-races around sysctl knobs related to SYN option.
    f39b03bd727a udp: Fix a data-race around sysctl_udp_l3mdev_accept.
    6727f39e99e0 ipv4: Fix a data-race around sysctl_fib_multipath_use_neigh.
    a8569f76df7e be2net: Fix buffer overflow in be_get_module_eeprom
    91d6aa19dd72 gpio: pca953x: only use single read/write for No AI mode
    031af9e617a6 ixgbe: Add locking to prevent panic when setting sriov_numvfs to zero
    55a2a28b3285 i40e: Fix erroneous adapter reinitialization during recovery process
    d88d59faf4e6 iavf: Fix handling of dummy receive descriptors
    25d53d858a6c tcp: Fix data-races around sysctl_tcp_fastopen.
    78420d8e46df tcp: Fix data-races around sysctl_max_syn_backlog.
    dc58e68d1e26 tcp: Fix a data-race around sysctl_tcp_tw_reuse.
    e9362a993886 tcp: Fix a data-race around sysctl_tcp_notsent_lowat.
    b0d9f04c870e tcp: Fix data-races around some timeout sysctl knobs.
    ea309c467dac tcp: Fix data-races around sysctl_tcp_reordering.
    b222de2560ab tcp: Fix data-races around sysctl_tcp_syncookies.
    ff55c025e647 igmp: Fix a data-race around sysctl_igmp_max_memberships.
    1656ecaddf90 igmp: Fix data-races around sysctl_igmp_llm_reports.
    2aad2c5745ec net/tls: Fix race in TLS device down flow
    573768dede0e net: stmmac: fix dma queue left shift overflow issue
    911b81fca2d7 i2c: cadence: Change large transfer count reset logic to be unconditional
    73a11588751a tcp: Fix a data-race around sysctl_tcp_probe_interval.
    b04817c94fbd tcp: Fix a data-race around sysctl_tcp_probe_threshold.
    033963b22063 tcp: Fix a data-race around sysctl_tcp_mtu_probe_floor.
    fdb96b69f590 tcp: Fix data-races around sysctl_tcp_min_snd_mss.
    30b73edc1d24 tcp: Fix data-races around sysctl_tcp_base_mss.
    f966773e13cd tcp: Fix data-races around sysctl_tcp_mtu_probing.
    a7386602a2fe tcp/dccp: Fix a data-race around sysctl_tcp_fwmark_accept.
    25a635a67c83 ip: Fix a data-race around sysctl_fwmark_reflect.
    281de3719986 ip: Fix data-races around sysctl_ip_nonlocal_bind.
    7828309df0f8 ip: Fix data-races around sysctl_ip_fwd_use_pmtu.
    5af6d9226376 ip: Fix data-races around sysctl_ip_no_pmtu_disc.
    16cb6717f4f4 igc: Reinstate IGC_REMOVED logic and implement it properly
    98c3c8fd0d4c perf/core: Fix data race between perf_event_set_output() and perf_mmap_close()
    6194c021496a pinctrl: ralink: Check for null return of devm_kcalloc
    78bdf732cf5d power/reset: arm-versatile: Fix refcount leak in versatile_reboot_probe
    f4248bdb7d5c xfrm: xfrm_policy: fix a possible double xfrm_pols_put() in xfrm_bundle_lookup()
    c68f6e2e4fda serial: mvebu-uart: correctly report configured baudrate value
    2230428fb866 PCI: hv: Fix interrupt mapping for multi-MSI
    7121d7120fd4 PCI: hv: Reuse existing IRTE allocation in compose_msi_msg()
    584c9d41800b PCI: hv: Fix hv_arch_irq_unmask() for multi-MSI
    8e94cc883011 PCI: hv: Fix multi-MSI to allow more than one MSI vector
    3048666143be xen/gntdev: Ignore failure to unmap INVALID_GRANT_HANDLE
    ed3fea55066b lockdown: Fix kexec lockdown bypass with ima policy
    c3856fe718ad mlxsw: spectrum_router: Fix IPv4 nexthop gateway indication
    c3dc75118445 riscv: add as-options for modules with assembly compontents
    e5a6b05d0c68 pinctrl: stm32: fix optional IRQ support to gpios
    002c3bbb4713 Linux 5.4.207
    08d90846e438 can: m_can: m_can_tx_handler(): fix use after free of skb
    579c8a2e6361 serial: pl011: UPSTAT_AUTORTS requires .throttle/unthrottle
    0c8649a49788 serial: stm32: Clear prev values before setting RTS delays
    f4c7f5028b48 serial: 8250: fix return error code in serial8250_request_std_resource()
    07379bd79d86 tty: serial: samsung_tty: set dma burst_size to 1
    edcb2612218d usb: dwc3: gadget: Fix event pending check
    40034fe6b8a7 usb: typec: add missing uevent when partner support PD
    42373b717a3f USB: serial: ftdi_sio: add Belimo device ids
    cbc98dcc38e2 signal handling: don't use BUG_ON() for debugging
    172cd32ada70 ARM: dts: stm32: use the correct clock source for CEC on stm32mp151
    c7d4b3ec6306 soc: ixp4xx/npe: Fix unused match warning
    a3c7c1a726a4 x86: Clear .brk area at early boot
    549f70b29953 irqchip: or1k-pic: Undefine mask_ack for level triggered hardware
    b0f41db50084 ASoC: madera: Fix event generation for rate controls
    79067a663247 ASoC: madera: Fix event generation for OUT1 demux
    0e7e515a6733 ASoC: cs47l15: Fix event generation for low power mux control
    20b921f22a8b ASoC: wm5110: Fix DRE control
    f298d2e4c60c ASoC: ops: Fix off by one in range control validation
    ede990cfc427 net: sfp: fix memory leak in sfp_probe()
    555cee1bc40b nvme: fix regression when disconnect a recovering ctrl
    08082a642aaa NFC: nxp-nci: don't print header length mismatch on i2c error
    4919d82f7041 net: tipc: fix possible refcount leak in tipc_sk_create()
    70d8aee1de6e platform/x86: hp-wmi: Ignore Sanitization Mode event
    8dda30f81c75 cpufreq: pmac32-cpufreq: Fix refcount leak bug
    b749af1b8f11 netfilter: br_netfilter: do not skip all hooks with 0 priority
    0c9203e75dae virtio_mmio: Restore guest page size on resume
    569f1ee032c9 virtio_mmio: Add missing PM calls to freeze/restore
    70433d9ea6ff mm: sysctl: fix missing numa_stat when !CONFIG_HUGETLB_PAGE
    da346adcf557 sfc: fix kernel panic when creating VF
    ba60ca0ed12e seg6: bpf: fix skb checksum in bpf_push_seg6_encap()
    de7849d9de1d seg6: fix skb checksum in SRv6 End.B6 and End.B6.Encaps behaviors
    487f0f77f1cd seg6: fix skb checksum evaluation in SRH encapsulation/insertion
    bcad880865bf sfc: fix use after free when disabling sriov
    b8d77f2396d5 net: ftgmac100: Hold reference returned by of_get_child_by_name()
    9b61d3f6df1b ipv4: Fix data-races around sysctl_ip_dynaddr.
    cc9540ba5b36 raw: Fix a data-race around sysctl_raw_l3mdev_accept.
    df691b991043 icmp: Fix a data-race around sysctl_icmp_ratemask.
    8bc1f6871490 icmp: Fix a data-race around sysctl_icmp_ratelimit.
    3093a6fe3170 drm/i915/gt: Serialize TLB invalidates with GT resets
    40d58aad2f66 ARM: dts: sunxi: Fix SPI NOR campatible on Orange Pi Zero
    bf676c940865 ARM: dts: at91: sama5d2: Fix typo in i2s1 node
    7c1acd98fb22 ipv4: Fix a data-race around sysctl_fib_sync_mem.
    0cba7ca667ce icmp: Fix data-races around sysctl.
    0e41a0f73ccb cipso: Fix data-races around sysctl.
    861f1852af6d net: Fix data-races around sysctl_mem.
    8d2daf565f61 inetpeer: Fix data-races around sysctl.
    2968830c9b47 net: stmmac: dwc-qos: Disable split header for Tegra194
    1273fd5153e8 ASoC: sgtl5000: Fix noise on shutdown/remove
    388f3df7c3c8 ima: Fix a potential integer overflow in ima_appraise_measurement
    72f231b9a88a drm/i915: fix a possible refcount leak in intel_dp_add_mst_connector()
    0f02e7c02bb0 ARM: 9210/1: Mark the FDT_FIXED sections as shareable
    41ea241fb3c2 ARM: 9209/1: Spectre-BHB: avoid pr_info() every time a CPU comes out of idle
    851730a1989f ARM: dts: imx6qdl-ts7970: Fix ngpio typo and count
    18881d7e5171 ext4: fix race condition between ext4_write and ext4_convert_inline_data
    423f2695007d sched/rt: Disable RT_RUNTIME_SHARE by default
    31e99fa969fd Revert "evm: Fix memleak in init_desc"
    d85d19f3b664 nilfs2: fix incorrect masking of permission flags for symlinks
    393594aad551 drm/panfrost: Fix shrinker list corruption by madvise IOCTL
    ad44e05f3e01 cgroup: Use separate src/dst nodes when preloading css_sets for migration
    444be5a02b77 wifi: mac80211: fix queue selection for mesh/OCB interfaces
    dba548476909 ARM: 9214/1: alignment: advance IT state after emulating Thumb instruction
    b4d99aa5ae90 ARM: 9213/1: Print message about disabled Spectre workarounds only once
    2c1cc40fb2a1 ip: fix dflt addr selection for connected nexthop
    fb5a7f1548d6 net: sock: tracing: Fix sock_exceed_buf_limit not to dereference stale pointer
    ecc6dec12c33 tracing/histograms: Fix memory leak problem
    7425479d20f9 xen/netback: avoid entering xenvif_rx_next_skb() with an empty rx queue
    9026b280eb7f ALSA: hda/realtek - Enable the headset-mic on a Xiaomi's laptop
    bbb82d4d9b3d ALSA: hda/realtek - Fix headset mic problem for a HP machine with alc221
    7e2fbf2d9b61 ALSA: hda/realtek - Fix headset mic problem for a HP machine with alc671
    33d33a66e31c ALSA: hda/conexant: Apply quirk for another HP ProDesk 600 G3 model
    5e7cc47ab923 ALSA: hda - Add fixup for Dell Latitidue E5430
    658410791556 Linux 5.4.206
    15a3adfe7593 Revert "mtd: rawnand: gpmi: Fix setting busy timeout setting"

Signed-off-by: Bruce Ashfield <bruce.ashfield@gmail.com>
Signed-off-by: Steve Sakoman <steve@sakoman.com>
---
 .../linux/linux-yocto-rt_5.4.bb               |  6 ++---
 .../linux/linux-yocto-tiny_5.4.bb             |  8 +++----
 meta/recipes-kernel/linux/linux-yocto_5.4.bb  | 22 +++++++++----------
 3 files changed, 18 insertions(+), 18 deletions(-)

diff --git a/meta/recipes-kernel/linux/linux-yocto-rt_5.4.bb b/meta/recipes-kernel/linux/linux-yocto-rt_5.4.bb
index fe75aee4da..91cb68dc8d 100644
--- a/meta/recipes-kernel/linux/linux-yocto-rt_5.4.bb
+++ b/meta/recipes-kernel/linux/linux-yocto-rt_5.4.bb
@@ -11,13 +11,13 @@ python () {
         raise bb.parse.SkipRecipe("Set PREFERRED_PROVIDER_virtual/kernel to linux-yocto-rt to enable it")
 }
 
-SRCREV_machine ?= "cc478e363cc35064b58a871a4cc535aa973c5891"
-SRCREV_meta ?= "aaaf9f090dfb3160154b24fbc2f9a6e669babc87"
+SRCREV_machine ?= "0bba5a75ccbb78703197b5c16499733079979425"
+SRCREV_meta ?= "028688aaad2b64e353d771ba5505a8666cd01696"
 
 SRC_URI = "git://git.yoctoproject.org/linux-yocto.git;branch=${KBRANCH};name=machine \
            git://git.yoctoproject.org/yocto-kernel-cache;type=kmeta;name=meta;branch=yocto-5.4;destsuffix=${KMETA}"
 
-LINUX_VERSION ?= "5.4.205"
+LINUX_VERSION ?= "5.4.208"
 
 LIC_FILES_CHKSUM = "file://COPYING;md5=bbea815ee2795b2f4230826c0c6b8814"
 
diff --git a/meta/recipes-kernel/linux/linux-yocto-tiny_5.4.bb b/meta/recipes-kernel/linux/linux-yocto-tiny_5.4.bb
index 769743856f..e369770d4b 100644
--- a/meta/recipes-kernel/linux/linux-yocto-tiny_5.4.bb
+++ b/meta/recipes-kernel/linux/linux-yocto-tiny_5.4.bb
@@ -6,7 +6,7 @@ KCONFIG_MODE = "--allnoconfig"
 
 require recipes-kernel/linux/linux-yocto.inc
 
-LINUX_VERSION ?= "5.4.205"
+LINUX_VERSION ?= "5.4.208"
 LIC_FILES_CHKSUM = "file://COPYING;md5=bbea815ee2795b2f4230826c0c6b8814"
 
 DEPENDS += "${@bb.utils.contains('ARCH', 'x86', 'elfutils-native', '', d)}"
@@ -15,9 +15,9 @@ DEPENDS += "openssl-native util-linux-native"
 KMETA = "kernel-meta"
 KCONF_BSP_AUDIT_LEVEL = "2"
 
-SRCREV_machine_qemuarm ?= "6a3e65256e24a2ff0e4e9fcd877987fb8afd12f2"
-SRCREV_machine ?= "d730b865a7cb7ff89efcf8ac725ca247283f3eeb"
-SRCREV_meta ?= "aaaf9f090dfb3160154b24fbc2f9a6e669babc87"
+SRCREV_machine_qemuarm ?= "d38a6d65eb92e50dfd0152af4a79978d8df19c50"
+SRCREV_machine ?= "550ae0d8908f5f7176b54afd6730b614c1a28ee8"
+SRCREV_meta ?= "028688aaad2b64e353d771ba5505a8666cd01696"
 
 PV = "${LINUX_VERSION}+git${SRCPV}"
 
diff --git a/meta/recipes-kernel/linux/linux-yocto_5.4.bb b/meta/recipes-kernel/linux/linux-yocto_5.4.bb
index 1043da7208..3b9481af4b 100644
--- a/meta/recipes-kernel/linux/linux-yocto_5.4.bb
+++ b/meta/recipes-kernel/linux/linux-yocto_5.4.bb
@@ -12,16 +12,16 @@ KBRANCH_qemux86  ?= "v5.4/standard/base"
 KBRANCH_qemux86-64 ?= "v5.4/standard/base"
 KBRANCH_qemumips64 ?= "v5.4/standard/mti-malta64"
 
-SRCREV_machine_qemuarm ?= "943e7e1f32e61dc7dd7a7029062e789219d81b14"
-SRCREV_machine_qemuarm64 ?= "24d18667d92b460ee33480942306a0d9c80c491b"
-SRCREV_machine_qemumips ?= "2d469a0343033962ecea678491852aa9457b8ff6"
-SRCREV_machine_qemuppc ?= "85932dee050f49fa824fd9b49af7b8159fe28a8e"
-SRCREV_machine_qemuriscv64 ?= "8a59dfded81659402005acfb06fbb00b71c8ce86"
-SRCREV_machine_qemux86 ?= "8a59dfded81659402005acfb06fbb00b71c8ce86"
-SRCREV_machine_qemux86-64 ?= "8a59dfded81659402005acfb06fbb00b71c8ce86"
-SRCREV_machine_qemumips64 ?= "0edbd472c7f0b51994d20d07bb26ead379dc10ed"
-SRCREV_machine ?= "8a59dfded81659402005acfb06fbb00b71c8ce86"
-SRCREV_meta ?= "aaaf9f090dfb3160154b24fbc2f9a6e669babc87"
+SRCREV_machine_qemuarm ?= "a182bd07250f86a80f2eae38a404532f1dfc72e6"
+SRCREV_machine_qemuarm64 ?= "e9742104ea2f0af13d5bffb7455759eb648bc615"
+SRCREV_machine_qemumips ?= "28fb757496c273f1405ca7fea85ef5b94a5dd7be"
+SRCREV_machine_qemuppc ?= "6ec7e0cd9f39bef1aa7c00be4fe91fedc96e64a4"
+SRCREV_machine_qemuriscv64 ?= "2abc3740e7891a58015cbfa8f9283785cd498cad"
+SRCREV_machine_qemux86 ?= "2abc3740e7891a58015cbfa8f9283785cd498cad"
+SRCREV_machine_qemux86-64 ?= "2abc3740e7891a58015cbfa8f9283785cd498cad"
+SRCREV_machine_qemumips64 ?= "df50d1958e0eac5cc60a2548e6bfa94e9bc91b9b"
+SRCREV_machine ?= "2abc3740e7891a58015cbfa8f9283785cd498cad"
+SRCREV_meta ?= "028688aaad2b64e353d771ba5505a8666cd01696"
 
 # remap qemuarm to qemuarma15 for the 5.4 kernel
 # KMACHINE_qemuarm ?= "qemuarma15"
@@ -30,7 +30,7 @@ SRC_URI = "git://git.yoctoproject.org/linux-yocto.git;name=machine;branch=${KBRA
            git://git.yoctoproject.org/yocto-kernel-cache;type=kmeta;name=meta;branch=yocto-5.4;destsuffix=${KMETA}"
 
 LIC_FILES_CHKSUM = "file://COPYING;md5=bbea815ee2795b2f4230826c0c6b8814"
-LINUX_VERSION ?= "5.4.205"
+LINUX_VERSION ?= "5.4.208"
 
 DEPENDS += "${@bb.utils.contains('ARCH', 'x86', 'elfutils-native', '', d)}"
 DEPENDS += "openssl-native util-linux-native"
-- 
2.25.1


