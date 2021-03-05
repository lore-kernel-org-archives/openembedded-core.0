Received: from mail-qt1-f172.google.com (mail-qt1-f172.google.com [209.85.160.172])
 by mx.groups.io with SMTP id smtpd.web09.7451.1614916472989189412
 for <openembedded-core@lists.openembedded.org>;
 Thu, 04 Mar 2021 19:54:33 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20161025 header.b=u6b/6b5T;
 spf=pass (domain: gmail.com, ip: 209.85.160.172, mailfrom: bruce.ashfield@gmail.com)
Received: by mail-qt1-f172.google.com with SMTP id w1so786846qto.2
        for <openembedded-core@lists.openembedded.org>; Thu, 04 Mar 2021 19:54:32 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:content-transfer-encoding;
        bh=6M6vORwow+32Qw3xal/QB+yR4eZBlSCMPFl37JJv2fE=;
        b=u6b/6b5Tb+TC0r2bdeE+OKEhYgVbysPvfIgmC40FTaGVbSaWI1Us1VXFqlBrr8PfXU
         OiU8SJXC3OVYjBPvrPQ0JV4baG0SEb2YcWjq+wWs3d1oCllWIBUZ/NQFR2fuHkoT2uD+
         WA+NaVNsEX5D95qKLKH6drGzXVJCsXXLyuIuYbzV0tJGItSUc8BAjQs8VHsp45uN7ZOl
         6uONzfHlpCBe0bwwgvbZL8fUWzYPSBGJuF2znp8Q22UFI3io2kX3iY0183QUh7OoU5sH
         FD/E/PqA1xuFH8Jdq4xQ8r33VLTYjd9yYe2WfeiS0tqJw8ggT9u6mAWn7DLUm89ooslS
         83kA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=6M6vORwow+32Qw3xal/QB+yR4eZBlSCMPFl37JJv2fE=;
        b=oc0jxzC9+EVWbZmg0neJ/k0tpvS8+s9TPPIGmSCU3oQRnEx94pJJ49SD85XNk4a+Ne
         k9+gm4YY7flsuhXqr73810BumqwuUKy30o177Z+zZc1mBWJJvb0MouZ9v6IjdEBON2xZ
         qHpYYmPT72x4fkSlFDMFPfB2FD+zZI/IGCewvbwfHJVj1pvBfIyePWF5nad1qSd56HBd
         4JwtkDFpvnbUXgD3jbLUl4Bmuoz+M6Qc4Eip19h9Q6C55BL/uhZCjLOSLLLM7N2hDEJx
         nTajC5aow0RDIxROj0+wVfwwhQof7TsBFvhk/j93PckONQvQHWJp5NTTDAtWMoTffjw6
         nv1A==
X-Gm-Message-State: AOAM532q/aewJ9sOu0YO1MoKGBP/wcwC4509IGuQv6emqXjg8DMA4jxe
	64zNXhySoaqjk543ZhzsW7YjoYa++SJj4woL
X-Google-Smtp-Source: ABdhPJyLJs11Qze2BMwVHPx/gV+UWicqYi2+wFcMnG3lzGuEHRuityLtQdMHoYzkZ73D7KW7WrMvRQ==
X-Received: by 2002:aed:314f:: with SMTP id 73mr7202597qtg.95.1614916471998;
        Thu, 04 Mar 2021 19:54:31 -0800 (PST)
Return-Path: <bruce.ashfield@gmail.com>
Received: from build.lan (cpe04d4c4975b80-cmf4c11490699b.cpe.net.cable.rogers.com. [174.112.159.151])
        by smtp.gmail.com with ESMTPSA id 66sm997383qkk.18.2021.03.04.19.54.31
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 04 Mar 2021 19:54:31 -0800 (PST)
From: "Bruce Ashfield" <bruce.ashfield@gmail.com>
To: richard.purdie@linuxfoundation.org
Cc: openembedded-core@lists.openembedded.org
Subject: [PATCH 4/6] linux-yocto/5.4: update to v5.4.99
Date: Thu,  4 Mar 2021 22:54:24 -0500
Message-Id: <1babe06473103355fff1cab42aafbb7cde2dc409.1614916283.git.bruce.ashfield@gmail.com>
X-Mailer: git-send-email 2.19.1
In-Reply-To: <cover.1614916283.git.bruce.ashfield@gmail.com>
References: <cover.1614916283.git.bruce.ashfield@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

From: Bruce Ashfield <bruce.ashfield@gmail.com>

Updating linux-yocto/5.4 to the latest korg -stable release that comprises
the following commits:

    850e6a95deb5 Linux 5.4.99
    e8ffaca0fe27 ovl: expand warning in ovl_d_real()
    b55528a18e40 net/qrtr: restrict user-controlled length in qrtr_tun_write_iter()
    99996cd558ba net/rds: restrict iovecs length for RDS_CMSG_RDMA_ARGS
    ac79b1d94a88 vsock: fix locking in vsock_shutdown()
    c025081b57df vsock/virtio: update credit only if socket is not closed
    2545c5bd8316 net: watchdog: hold device global xmit lock during tx disable
    a5f0b6f7b1c0 net/vmw_vsock: improve locking in vsock_connect_timeout()
    611d93fbea54 net: fix iteration for sctp transport seq_files
    2085d886630a net: gro: do not keep too many GRO packets in napi->rx_list
    5c53956a8da0 net: dsa: call teardown method on probe failure
    0b42ab078369 udp: fix skb_copy_and_csum_datagram with odd segment sizes
    73bc75fda669 rxrpc: Fix clearance of Tx/Rx ring when releasing a call
    b90e8d5d28d1 usb: dwc3: ulpi: Replace CPU-based busyloop with Protocol-based one
    35834bf0b210 usb: dwc3: ulpi: fix checkpatch warning
    0b49b82eeea2 h8300: fix PREEMPTION build, TI_PRE_COUNT undefined
    1019015a5dca i2c: stm32f7: fix configuration of the digital filter
    546d92a43c94 clk: sunxi-ng: mp: fix parent rate change flag check
    b02db23d2647 drm/sun4i: dw-hdmi: Fix max. frequency for H6
    40db7dba50fe drm/sun4i: Fix H6 HDMI PHY configuration
    3063b80b4bdf drm/sun4i: tcon: set sync polarity for tcon1 channel
    107cf5eede74 firmware_loader: align .builtin_fw to 8
    beb85f4927e8 net: hns3: add a check for queue_id in hclge_reset_vf_queue()
    a045956a3b41 x86/build: Disable CET instrumentation in the kernel for 32-bit too
    da1a5442ad2c netfilter: conntrack: skip identical origin tuple in same zone only
    0142b957866f ibmvnic: Clear failover_pending if unable to schedule
    3f8954cc624c net: stmmac: set TxQ mode back to DCB after disabling CBS
    c0daa74b8ed7 selftests: txtimestamp: fix compilation issue
    6107338c2fa2 net: enetc: initialize the RFS and RSS memories
    71d2bd7921db xen/netback: avoid race in xenvif_rx_ring_slots_available()
    ff758e8a77f3 netfilter: flowtable: fix tcp and udp header checksum update
    b110391d1e80 netfilter: nftables: fix possible UAF over chains from packet path in netns
    35c279e02b7e netfilter: xt_recent: Fix attempt to update deleted entry
    7e3a6b820535 bpf: Check for integer overflow when using roundup_pow_of_two()
    e29126678f65 drm/vc4: hvs: Fix buffer overflow with the dlist handling
    69beec4a8b36 mt76: dma: fix a possible memory leak in mt76_add_fragment()
    8a5991c8214b lkdtm: don't move ctors to .rodata
    4f5416710e13 vmlinux.lds.h: Create section for protection against instrumentation
    b7f41a7ad444 ARM: kexec: fix oops after TLB are invalidated
    f49bff85b6db ARM: ensure the signal page contains defined contents
    06350c7f7923 ARM: dts: lpc32xx: Revert set default clock rate of HCLK PLL
    e60577e29deb bfq-iosched: Revert "bfq: Fix computation of shallow depth"
    91d604ab2a99 riscv: virt_addr_valid must check the address belongs to linear mapping
    0db8d192ee57 drm/amd/display: Decrement refcount of dc_sink before reassignment
    5c8f63266255 drm/amd/display: Free atomic state after drm_atomic_commit
    f35da70b516f drm/amd/display: Fix dc_sink kref count in emulated_link_detect
    76979956a8af drm/amd/display: Add more Clock Sources to DCN2.1
    4516a0a2c087 nvme-pci: ignore the subsysem NQN on Phison E16
    335a285aa0f0 ovl: skip getxattr of security labels
    43e3cf46afb1 cap: fix conversions on getxattr
    df094aa0aab0 ovl: perform vfs_getxattr() with mounter creds
    cc512646b2e7 platform/x86: hp-wmi: Disable tablet-mode reporting by default
    2bb22cd4dae4 ARM: OMAP2+: Fix suspcious RCU usage splats for omap_enter_idle_coupled
    2cb208ba0fd1 arm64: dts: qcom: sdm845: Reserve LPASS clocks in gcc
    92c40ed0abcb arm64: dts: rockchip: Fix PCIe DT properties on rk3399
    2407794f2298 cgroup: fix psi monitor for root cgroup
    18d691d837b3 arm/xen: Don't probe xenbus as part of an early initcall
    a0997a86f5c0 tracing: Check length before giving out the filter buffer
    74c7bafdd303 tracing: Do not count ftrace events in top level enable output
    4851d7b340e9 gpio: ep93xx: Fix single irqchip with multi gpiochips
    2c5abe0f8e9c gpio: ep93xx: fix BUG_ON port F usage

Signed-off-by: Bruce Ashfield <bruce.ashfield@gmail.com>
---
 .../linux/linux-yocto-rt_5.4.bb               |  6 ++---
 .../linux/linux-yocto-tiny_5.4.bb             |  8 +++----
 meta/recipes-kernel/linux/linux-yocto_5.4.bb  | 22 +++++++++----------
 3 files changed, 18 insertions(+), 18 deletions(-)

diff --git a/meta/recipes-kernel/linux/linux-yocto-rt_5.4.bb b/meta/recipes-kernel/linux/linux-yocto-rt_5.4.bb
index 2508b9ba07..093ddb4742 100644
--- a/meta/recipes-kernel/linux/linux-yocto-rt_5.4.bb
+++ b/meta/recipes-kernel/linux/linux-yocto-rt_5.4.bb
@@ -11,13 +11,13 @@ python () {
         raise bb.parse.SkipRecipe("Set PREFERRED_PROVIDER_virtual/kernel to linux-yocto-rt to enable it")
 }
 
-SRCREV_machine ?= "0406e600800a40015d02b16ee6a4a46c6673c66f"
-SRCREV_meta ?= "4f6d6c23cc8ca5d9c39b1efc2619b1dfec1ef2bc"
+SRCREV_machine ?= "b2502919947df2b3d135c92e1749e13844312102"
+SRCREV_meta ?= "c69f1109d70d869c0b0560771f825b97fac5a7e0"
 
 SRC_URI = "git://git.yoctoproject.org/linux-yocto.git;branch=${KBRANCH};name=machine \
            git://git.yoctoproject.org/yocto-kernel-cache;type=kmeta;name=meta;branch=yocto-5.4;destsuffix=${KMETA}"
 
-LINUX_VERSION ?= "5.4.98"
+LINUX_VERSION ?= "5.4.99"
 
 LIC_FILES_CHKSUM = "file://COPYING;md5=bbea815ee2795b2f4230826c0c6b8814"
 
diff --git a/meta/recipes-kernel/linux/linux-yocto-tiny_5.4.bb b/meta/recipes-kernel/linux/linux-yocto-tiny_5.4.bb
index ff03fd4197..a7dc3a3cbf 100644
--- a/meta/recipes-kernel/linux/linux-yocto-tiny_5.4.bb
+++ b/meta/recipes-kernel/linux/linux-yocto-tiny_5.4.bb
@@ -6,7 +6,7 @@ KCONFIG_MODE = "--allnoconfig"
 
 require recipes-kernel/linux/linux-yocto.inc
 
-LINUX_VERSION ?= "5.4.98"
+LINUX_VERSION ?= "5.4.99"
 LIC_FILES_CHKSUM = "file://COPYING;md5=bbea815ee2795b2f4230826c0c6b8814"
 
 DEPENDS += "${@bb.utils.contains('ARCH', 'x86', 'elfutils-native', '', d)}"
@@ -15,9 +15,9 @@ DEPENDS += "openssl-native util-linux-native"
 KMETA = "kernel-meta"
 KCONF_BSP_AUDIT_LEVEL = "2"
 
-SRCREV_machine_qemuarm ?= "fc95a485415d22eb772359b8d350c03b85c0cd1b"
-SRCREV_machine ?= "2d0a4ea86fe97f13a4bc2a92a097e4edb51d737d"
-SRCREV_meta ?= "4f6d6c23cc8ca5d9c39b1efc2619b1dfec1ef2bc"
+SRCREV_machine_qemuarm ?= "7d5c1d38ab787f5aefc81fc5dec49e620a26a749"
+SRCREV_machine ?= "517defa4ffb28867801c15f773fd3742fb22c4f5"
+SRCREV_meta ?= "c69f1109d70d869c0b0560771f825b97fac5a7e0"
 
 PV = "${LINUX_VERSION}+git${SRCPV}"
 
diff --git a/meta/recipes-kernel/linux/linux-yocto_5.4.bb b/meta/recipes-kernel/linux/linux-yocto_5.4.bb
index 8d0f4b82c0..ba6b26a10e 100644
--- a/meta/recipes-kernel/linux/linux-yocto_5.4.bb
+++ b/meta/recipes-kernel/linux/linux-yocto_5.4.bb
@@ -12,16 +12,16 @@ KBRANCH_qemux86  ?= "v5.4/standard/base"
 KBRANCH_qemux86-64 ?= "v5.4/standard/base"
 KBRANCH_qemumips64 ?= "v5.4/standard/mti-malta64"
 
-SRCREV_machine_qemuarm ?= "28bc6b294bb1e49da671b2848234f9011efcad88"
-SRCREV_machine_qemuarm64 ?= "2d0a4ea86fe97f13a4bc2a92a097e4edb51d737d"
-SRCREV_machine_qemumips ?= "105568d1696f86625cf7bc30d8c5c921732de2f4"
-SRCREV_machine_qemuppc ?= "2d0a4ea86fe97f13a4bc2a92a097e4edb51d737d"
-SRCREV_machine_qemuriscv64 ?= "2d0a4ea86fe97f13a4bc2a92a097e4edb51d737d"
-SRCREV_machine_qemux86 ?= "2d0a4ea86fe97f13a4bc2a92a097e4edb51d737d"
-SRCREV_machine_qemux86-64 ?= "2d0a4ea86fe97f13a4bc2a92a097e4edb51d737d"
-SRCREV_machine_qemumips64 ?= "c76ba20ee1b1de859736f85f0210459c2104b8df"
-SRCREV_machine ?= "2d0a4ea86fe97f13a4bc2a92a097e4edb51d737d"
-SRCREV_meta ?= "4f6d6c23cc8ca5d9c39b1efc2619b1dfec1ef2bc"
+SRCREV_machine_qemuarm ?= "a8aad3b73d3a70d40114968a35740605310c5242"
+SRCREV_machine_qemuarm64 ?= "517defa4ffb28867801c15f773fd3742fb22c4f5"
+SRCREV_machine_qemumips ?= "ab621e6177fe53efa5b5ec06dc68c1253ba1aa13"
+SRCREV_machine_qemuppc ?= "517defa4ffb28867801c15f773fd3742fb22c4f5"
+SRCREV_machine_qemuriscv64 ?= "517defa4ffb28867801c15f773fd3742fb22c4f5"
+SRCREV_machine_qemux86 ?= "517defa4ffb28867801c15f773fd3742fb22c4f5"
+SRCREV_machine_qemux86-64 ?= "517defa4ffb28867801c15f773fd3742fb22c4f5"
+SRCREV_machine_qemumips64 ?= "401e403397ee46c782ba1246ea04eb02fc20d0be"
+SRCREV_machine ?= "517defa4ffb28867801c15f773fd3742fb22c4f5"
+SRCREV_meta ?= "c69f1109d70d869c0b0560771f825b97fac5a7e0"
 
 # remap qemuarm to qemuarma15 for the 5.4 kernel
 # KMACHINE_qemuarm ?= "qemuarma15"
@@ -30,7 +30,7 @@ SRC_URI = "git://git.yoctoproject.org/linux-yocto.git;name=machine;branch=${KBRA
            git://git.yoctoproject.org/yocto-kernel-cache;type=kmeta;name=meta;branch=yocto-5.4;destsuffix=${KMETA}"
 
 LIC_FILES_CHKSUM = "file://COPYING;md5=bbea815ee2795b2f4230826c0c6b8814"
-LINUX_VERSION ?= "5.4.98"
+LINUX_VERSION ?= "5.4.99"
 
 DEPENDS += "${@bb.utils.contains('ARCH', 'x86', 'elfutils-native', '', d)}"
 DEPENDS += "openssl-native util-linux-native"
-- 
2.19.1

