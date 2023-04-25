Return-Path: <steve@sakoman.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 9C097C6FD18
	for <webhook@archiver.kernel.org>; Tue, 25 Apr 2023 13:58:08 +0000 (UTC)
Received: from mail-pf1-f177.google.com (mail-pf1-f177.google.com [209.85.210.177])
 by mx.groups.io with SMTP id smtpd.web11.79757.1682431086863759881
 for <openembedded-core@lists.openembedded.org>;
 Tue, 25 Apr 2023 06:58:06 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@sakoman-com.20221208.gappssmtp.com header.s=20221208 header.b=a/xzE50w;
 spf=softfail (domain: sakoman.com, ip: 209.85.210.177, mailfrom: steve@sakoman.com)
Received: by mail-pf1-f177.google.com with SMTP id d2e1a72fcca58-63b67a26069so7647179b3a.0
        for <openembedded-core@lists.openembedded.org>; Tue, 25 Apr 2023 06:58:06 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=sakoman-com.20221208.gappssmtp.com; s=20221208; t=1682431086; x=1685023086;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=/uGLW7SaOo7Javx+WsBHV7SHg6uuHeTxmTyBu6Xba1U=;
        b=a/xzE50w9AF/g5c5WhUn1Ed+RJcGFEjf+a1ZUQI/5tF1N1bRcuLr0SyTQakfRpPC1f
         OnbMx4mUZjpd8ysoxCbD5qj1v5z9YQuslAbpqmX5gYTgSg5Kl0OycxogXmMomc2GxX1/
         Hqwf6qnjFzTpgi3JF3N9k7FfUu6cl0fKl9KtJNaGHA3jPVMmR5NiC3F9toU9WRNc1Vo5
         sskFI6LQj9kmPJ+FCbAyttaEDtU8W1l5UG1jmp/mOlc8MsXiCrm9cwnRPLzNKAv/tgEQ
         88/D4uIh4HpK4gwouUAc1eN60O3n0UhcqZ5xj58cZ87SnGZWjF1xIVLpgqhiuSwz+M60
         AT0A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1682431086; x=1685023086;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=/uGLW7SaOo7Javx+WsBHV7SHg6uuHeTxmTyBu6Xba1U=;
        b=KABwA9DZHkrtaBmlVui8ameHZezkeZImnd8V7reTDszA97cQYhIq+q6P2NB6YcL8YB
         btoZKBZPNB0dMYuMBTYGGTtv1HwspJ7nyJfimMymXR1UBWZueBuqdLYbzmNT0e2peZtg
         r04of5z3PBExNsSL8b6hj65NfeR/wy4EFA0e8N+Ft+V7dSQ3GzGts1isE9tVpz3OtGqg
         DNhNhTjYtyy19mG5TAOjkeL7RZabsMzxGXa/1Jfx0l8ug01gAedSyan27JLGe4jbBLW1
         qXgW/JoCyWy6cNjcQt2chYx4ACqI9ThcnqcybcN5+jNX9/ss33MLWckAfB7HUm8ZYkbW
         fMLQ==
X-Gm-Message-State: AAQBX9e96teqpMJsOnWp3HjVSDzxJ5QksbunwINUt8F2iic3Tatzmsso
	+tLrtkhG7Ir51qzpLKyZJjQ6kk+ZQLDjoQBs2OA=
X-Google-Smtp-Source: AKy350byKt8POaHItRs+3676t5bAG2srv1z31yZNtk7ePQXWARpch947lyXOp6PvDZCUYfR69JWimw==
X-Received: by 2002:a05:6a00:1341:b0:63e:6b8a:7975 with SMTP id k1-20020a056a00134100b0063e6b8a7975mr26338401pfu.9.1682431085727;
        Tue, 25 Apr 2023 06:58:05 -0700 (PDT)
Received: from hexa.lan (dhcp-72-253-4-112.hawaiiantel.net. [72.253.4.112])
        by smtp.gmail.com with ESMTPSA id s14-20020a65644e000000b0051b930b2b49sm8229117pgv.72.2023.04.25.06.58.04
        for <openembedded-core@lists.openembedded.org>
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 25 Apr 2023 06:58:05 -0700 (PDT)
From: Steve Sakoman <steve@sakoman.com>
To: openembedded-core@lists.openembedded.org
Subject: [OE-core][langdale 05/10] linux-yocto/5.15: update to v5.15.108
Date: Tue, 25 Apr 2023 03:57:37 -1000
Message-Id: <bbdea728c2e7f81660220ff0fd196c87886abacc.1682430831.git.steve@sakoman.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <cover.1682430831.git.steve@sakoman.com>
References: <cover.1682430831.git.steve@sakoman.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Tue, 25 Apr 2023 13:58:08 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/180381

From: Bruce Ashfield <bruce.ashfield@gmail.com>

Updating  to the latest korg -stable release that comprises
the following commits:

    3299fb36854f Linux 5.15.108
    adef0cebea85 nvme-pci: avoid the deepest sleep state on ZHITAI TiPro5000 SSDs
    c6897dfe2bb6 counter: Add the necessary colons and indents to the comments of counter_compi
    fa934784fb65 counter: fix docum. build problems after filename change
    0cf283340023 panic, kexec: make __crash_kexec() NMI safe
    9e1e511119b1 kexec: turn all kexec_mutex acquisitions into trylocks
    6fc7a53fcc4c nvme-pci: add NVME_QUIRK_BOGUS_NID for T-FORCE Z330 SSD
    fa43e0591900 nvme-pci: mark Lexar NM760 as IGNORE_DEV_SUBNQN
    a814fc9e6e59 nvme-pci: add NVME_QUIRK_BOGUS_NID for Lexar NM760
    972e06d09e86 nvme-pci: add NVME_QUIRK_BOGUS_NID for Lexar NM610
    cf773832139b nvme-pci: Crucial P2 has bogus namespace ids
    5a19b9a49aea nvme-pci: avoid the deepest sleep state on ZHITAI TiPro7000 SSDs
    65f5dc5dff29 nvme-pci: add NVME_QUIRK_BOGUS_NID for ADATA XPG GAMMIX S50
    3daaa5f7aae2 i2c: ocores: generate stop condition after timeout in polling mode
    0af686415ca2 x86/rtc: Remove __init for runtime functions
    b11ff3ef4d09 sched/fair: Fix imbalance overflow
    90e3dc510106 sched/fair: Move calculate of avg_load to a better location
    6d1353781bba powerpc/papr_scm: Update the NUMA distance table for the target node
    0b031f5983f8 ubi: Fix deadlock caused by recursively holding work_sem
    85d7a7044b75 ubi: Fix failure attaching when vid_hdr offset equals to (sub)page size
    f0b4a4086cf2 mptcp: stricter state check in mptcp_worker
    925e1a510a2e mptcp: use mptcp_schedule_work instead of open-coding it
    f4f2a1d491e9 cgroup/cpuset: Wake up cpuset_attach_wq tasks in cpuset_cancel_attach()
    19c7f9329bdb x86/PCI: Add quirk for AMD XHCI controller that loses MSI-X state in D3hot
    05143d90ac90 scsi: ses: Handle enclosure with just a primary component gracefully
    aaae6d303150 net: phy: nxp-c45-tja11xx: fix unsigned long multiplication overflow
    b1ca14361d49 net: phy: nxp-c45-tja11xx: add remove callback
    0359e505bcd7 net: sfp: initialize sfp->i2c_block_size at sfp allocation
    a42f565c0e96 riscv: add icache flush for nommu sigreturn trampoline
    6eeb1cba4c9d drm/i915: fix race condition UAF in i915_perf_add_config_ioctl
    9b344cf6aea0 i915/perf: Replace DRM_DEBUG with driver specific drm_dbg call
    6b337a13c144 tracing: Have tracing_snapshot_instance_cond() write errors to the appropriate instance
    1403518ed0d9 tracing: Add trace_array_puts() to write into instance
    670e54151b7a counter: 104-quad-8: Fix Synapse action reported for Index signals
    6e25d374cd95 counter: Internalize sysfs interface code
    c4153e662883 counter: stm32-timer-cnt: Provide defines for slave mode selection
    4c1010848b12 counter: stm32-lptimer-cnt: Provide defines for clock polarities
    189ada57e88c ACPI: resource: Add Medion S17413 to IRQ override quirk
    248a18a895e2 wifi: iwlwifi: mvm: fix mvmtxq->stopped handling
    0efd9ed92926 asymmetric_keys: log on fatal failures in PE/pkcs7
    ae2b44aeade1 verify_pefile: relax wrapper length check
    744f80ae0716 drm: panel-orientation-quirks: Add quirk for Lenovo Yoga Book X90F
    05a24344296e efi: sysfb_efi: Add quirk for Lenovo Yoga Book X91F/L
    0f9d2fc58824 i2c: hisi: Avoid redundant interrupts
    d21a46212009 i2c: imx-lpi2c: clean rx/tx buffers upon new message
    8451da304b4a wifi: mwifiex: mark OF related data as maybe unused
    9aeff275b7f7 power: supply: cros_usbpd: reclassify "default case!" as debug
    788f4a3d3987 ARM: 9290/1: uaccess: Fix KASAN false-positives
    53967ac8080b libbpf: Fix single-line struct definition output in btf_dump
    906a6689bb01 skbuff: Fix a race between coalescing and releasing SKBs
    7ccc58a1a756 net: macb: fix a memory corruption in extended buffer descriptor mode
    ed2ec39e46fe udp6: fix potential access to stale information
    e97ff11b396c RDMA/core: Fix GID entry ref leak when create_ah fails
    6109f5b13ce3 sctp: fix a potential overflow in sctp_ifwdtsn_skip
    c6a796ee5a63 net: qrtr: Fix an uninit variable access bug in qrtr_tx_resume()
    9b1ca43bcf3d qlcnic: check pci_reset_function result
    ffa4f32952e2 drm/armada: Fix a potential double free in an error handling path
    a94f5d35fdbb tcp: restrict net.ipv4.tcp_app_win
    a08ec4ed3b6e niu: Fix missing unwind goto in niu_alloc_channels()
    e35ae49bc198 9p/xen : Fix use after free bug in xen_9pfs_front_remove due to race condition
    b41da67451b0 bpf: tcp: Use sock_gen_put instead of sock_put in bpf_iter_tcp
    48e8e7851dc0 RDMA/cma: Allow UD qp_type to join multicast only
    1569a4cdb973 IB/mlx5: Add support for 400G_8X lane speed
    f6711bc5c016 RDMA/irdma: Add ipv4 check to irdma_find_listener()
    c8c7a7aee861 RDMA/irdma: Increase iWARP CM default rexmit count
    810250c9c661 RDMA/irdma: Fix memory leak of PBLE objects
    aa2607bae45f clk: sprd: set max_register according to mapping range
    0004a50c535f drm/i915/dsi: fix DSS CTL register offsets for TGL+
    1bb4a52c3caa KVM: arm64: PMU: Restore the guest's EL0 event counting after migration
    c7acce3a0eeb mtd: rawnand: stm32_fmc2: use timings.mode instead of checking tRC_min
    7233b5baba10 mtd: rawnand: stm32_fmc2: remove unsupported EDO mode
    5ded9b750f30 mtd: rawnand: meson: fix bitmask for length in command word
    0162836a51bb mtdblock: tolerate corrected bit-flips
    ad574345ce26 fbmem: Reject FB_ACTIVATE_KD_TEXT from userspace
    a55a95365e08 btrfs: fix fast csum implementation detection
    6da03c237d56 btrfs: print checksum type and implementation at mount time
    0efb276d5848 Bluetooth: Fix race condition in hidp_session_thread
    ac6725a634f7 Bluetooth: L2CAP: Fix use-after-free in l2cap_disconnect_{req,rsp}
    d98498ad5695 ALSA: hda/sigmatel: fix S/PDIF out on Intel D*45* motherboards
    c5797c87e74e ALSA: emu10k1: don't create old pass-through playback device on Audigy
    f1ef453157b4 ALSA: firewire-tascam: add missing unwind goto in snd_tscm_stream_start_duplex()
    7901d787e455 ALSA: i2c/cs8427: fix iec958 mixer control deactivation
    d8697aa12ae6 ALSA: hda/sigmatel: add pin overrides for Intel DP45SG motherboard
    34a0ada0a8b2 ALSA: emu10k1: fix capture interrupt handler unlinking
    55e4eef5545d Revert "pinctrl: amd: Disable and mask interrupts on resume"

Signed-off-by: Bruce Ashfield <bruce.ashfield@gmail.com>
Signed-off-by: Richard Purdie <richard.purdie@linuxfoundation.org>
(cherry picked from commit 5339d44b0b0b23f30cb0f8ab395da62e83733c40)
Signed-off-by: Steve Sakoman <steve@sakoman.com>
---
 .../linux/linux-yocto-rt_5.15.bb              |  6 ++---
 .../linux/linux-yocto-tiny_5.15.bb            |  6 ++---
 meta/recipes-kernel/linux/linux-yocto_5.15.bb | 26 +++++++++----------
 3 files changed, 19 insertions(+), 19 deletions(-)

diff --git a/meta/recipes-kernel/linux/linux-yocto-rt_5.15.bb b/meta/recipes-kernel/linux/linux-yocto-rt_5.15.bb
index e8b96a080d..2117e1ffb3 100644
--- a/meta/recipes-kernel/linux/linux-yocto-rt_5.15.bb
+++ b/meta/recipes-kernel/linux/linux-yocto-rt_5.15.bb
@@ -14,13 +14,13 @@ python () {
         raise bb.parse.SkipRecipe("Set PREFERRED_PROVIDER_virtual/kernel to linux-yocto-rt to enable it")
 }
 
-SRCREV_machine ?= "17de8839ffeb953a58b32a1d9ef13675864f4f00"
-SRCREV_meta ?= "c0c3836249b3a2fd02ad30ae54637a2bed54107b"
+SRCREV_machine ?= "8e0611e36c848a07f9cdd778903c9e51bb90b319"
+SRCREV_meta ?= "e4b95ec17228274acb38bf10061448224df3a312"
 
 SRC_URI = "git://git.yoctoproject.org/linux-yocto.git;branch=${KBRANCH};name=machine \
            git://git.yoctoproject.org/yocto-kernel-cache;type=kmeta;name=meta;branch=yocto-5.15;destsuffix=${KMETA}"
 
-LINUX_VERSION ?= "5.15.107"
+LINUX_VERSION ?= "5.15.108"
 
 LIC_FILES_CHKSUM = "file://COPYING;md5=6bc538ed5bd9a7fc9398086aedcd7e46"
 
diff --git a/meta/recipes-kernel/linux/linux-yocto-tiny_5.15.bb b/meta/recipes-kernel/linux/linux-yocto-tiny_5.15.bb
index 73dbfce914..277a6a6c0d 100644
--- a/meta/recipes-kernel/linux/linux-yocto-tiny_5.15.bb
+++ b/meta/recipes-kernel/linux/linux-yocto-tiny_5.15.bb
@@ -8,7 +8,7 @@ require recipes-kernel/linux/linux-yocto.inc
 # CVE exclusions
 include recipes-kernel/linux/cve-exclusion_5.15.inc
 
-LINUX_VERSION ?= "5.15.107"
+LINUX_VERSION ?= "5.15.108"
 LIC_FILES_CHKSUM = "file://COPYING;md5=6bc538ed5bd9a7fc9398086aedcd7e46"
 
 DEPENDS += "${@bb.utils.contains('ARCH', 'x86', 'elfutils-native', '', d)}"
@@ -17,8 +17,8 @@ DEPENDS += "openssl-native util-linux-native"
 KMETA = "kernel-meta"
 KCONF_BSP_AUDIT_LEVEL = "2"
 
-SRCREV_machine ?= "9f7b6a8032cef0df7e4c4b2e2d185d21924127c5"
-SRCREV_meta ?= "c0c3836249b3a2fd02ad30ae54637a2bed54107b"
+SRCREV_machine ?= "3d762b85647844790979dd1e17a762003aaa7476"
+SRCREV_meta ?= "e4b95ec17228274acb38bf10061448224df3a312"
 
 PV = "${LINUX_VERSION}+git${SRCPV}"
 
diff --git a/meta/recipes-kernel/linux/linux-yocto_5.15.bb b/meta/recipes-kernel/linux/linux-yocto_5.15.bb
index 7c54b8f590..b58ca03ddb 100644
--- a/meta/recipes-kernel/linux/linux-yocto_5.15.bb
+++ b/meta/recipes-kernel/linux/linux-yocto_5.15.bb
@@ -16,24 +16,24 @@ KBRANCH:qemux86  ?= "v5.15/standard/base"
 KBRANCH:qemux86-64 ?= "v5.15/standard/base"
 KBRANCH:qemumips64 ?= "v5.15/standard/mti-malta64"
 
-SRCREV_machine:qemuarm ?= "cafbf3840cb619fa324fa4222ceec63787409f77"
-SRCREV_machine:qemuarm64 ?= "3ec37a5997470f25ca0a443ad8afee62a3201edc"
-SRCREV_machine:qemumips ?= "e0561aff7c1b9e04452e02cd2e5786525b7ac03b"
-SRCREV_machine:qemuppc ?= "4f3c3cb71e1ac3b1ba29c2d0e5b62f5b8a78e720"
-SRCREV_machine:qemuriscv64 ?= "bbc363b82b92d99e0e29b0d5c9810d2636b54f9e"
-SRCREV_machine:qemuriscv32 ?= "bbc363b82b92d99e0e29b0d5c9810d2636b54f9e"
-SRCREV_machine:qemux86 ?= "bbc363b82b92d99e0e29b0d5c9810d2636b54f9e"
-SRCREV_machine:qemux86-64 ?= "bbc363b82b92d99e0e29b0d5c9810d2636b54f9e"
-SRCREV_machine:qemumips64 ?= "5eba919cd8b3ca2e7ca047e49adf98c344e9998e"
-SRCREV_machine ?= "bbc363b82b92d99e0e29b0d5c9810d2636b54f9e"
-SRCREV_meta ?= "c0c3836249b3a2fd02ad30ae54637a2bed54107b"
+SRCREV_machine:qemuarm ?= "80421c525a12141d31bf1592b0d8c176defe3010"
+SRCREV_machine:qemuarm64 ?= "9d140dbc3171bf272f51b524edeeb2f22783aca5"
+SRCREV_machine:qemumips ?= "b29a8fa62d88db512f1fa5d60e430a851d7e3aaf"
+SRCREV_machine:qemuppc ?= "7ee6b7fc4b57933114376cf012218c2ae3d23558"
+SRCREV_machine:qemuriscv64 ?= "e8c818cce43dd720c366d831aeb102c20c237652"
+SRCREV_machine:qemuriscv32 ?= "e8c818cce43dd720c366d831aeb102c20c237652"
+SRCREV_machine:qemux86 ?= "e8c818cce43dd720c366d831aeb102c20c237652"
+SRCREV_machine:qemux86-64 ?= "e8c818cce43dd720c366d831aeb102c20c237652"
+SRCREV_machine:qemumips64 ?= "5c900befc90365f6daa80989e8de0ccc546ff0f5"
+SRCREV_machine ?= "e8c818cce43dd720c366d831aeb102c20c237652"
+SRCREV_meta ?= "e4b95ec17228274acb38bf10061448224df3a312"
 
 # set your preferred provider of linux-yocto to 'linux-yocto-upstream', and you'll
 # get the <version>/base branch, which is pure upstream -stable, and the same
 # meta SRCREV as the linux-yocto-standard builds. Select your version using the
 # normal PREFERRED_VERSION settings.
 BBCLASSEXTEND = "devupstream:target"
-SRCREV_machine:class-devupstream ?= "4fdad925aa1a320c2f32bf956ed29100c7fdc464"
+SRCREV_machine:class-devupstream ?= "3299fb36854fdc288bddc2c4d265f8a2e5105944"
 PN:class-devupstream = "linux-yocto-upstream"
 KBRANCH:class-devupstream = "v5.15/base"
 
@@ -41,7 +41,7 @@ SRC_URI = "git://git.yoctoproject.org/linux-yocto.git;name=machine;branch=${KBRA
            git://git.yoctoproject.org/yocto-kernel-cache;type=kmeta;name=meta;branch=yocto-5.15;destsuffix=${KMETA}"
 
 LIC_FILES_CHKSUM = "file://COPYING;md5=6bc538ed5bd9a7fc9398086aedcd7e46"
-LINUX_VERSION ?= "5.15.107"
+LINUX_VERSION ?= "5.15.108"
 
 DEPENDS += "${@bb.utils.contains('ARCH', 'x86', 'elfutils-native', '', d)}"
 DEPENDS += "openssl-native util-linux-native"
-- 
2.34.1


