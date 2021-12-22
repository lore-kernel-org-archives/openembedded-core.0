Return-Path: <steve@sakoman.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 92A3FC433F5
	for <webhook@archiver.kernel.org>; Wed, 22 Dec 2021 14:13:06 +0000 (UTC)
Received: from mail-pj1-f44.google.com (mail-pj1-f44.google.com
 [209.85.216.44])
 by mx.groups.io with SMTP id smtpd.web12.19608.1640182386115761577
 for <openembedded-core@lists.openembedded.org>;
 Wed, 22 Dec 2021 06:13:06 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@sakoman-com.20210112.gappssmtp.com header.s=20210112
 header.b=EG6WdUrT;
 spf=softfail (domain: sakoman.com, ip: 209.85.216.44,
 mailfrom: steve@sakoman.com)
Received: by mail-pj1-f44.google.com with SMTP id
 rj2-20020a17090b3e8200b001b1944bad25so2709359pjb.5
        for <openembedded-core@lists.openembedded.org>;
 Wed, 22 Dec 2021 06:13:06 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=sakoman-com.20210112.gappssmtp.com; s=20210112;
        h=from:to:subject:date:message-id:in-reply-to:references:mime-version
         :content-transfer-encoding;
        bh=zw0wHivDLtnfCXbEW37o83WTsxcJws+y1kPJ96biP/I=;
        b=EG6WdUrTWtSAixnsHNhawnwsMgSa/S/l0IkHizqTzxsnEcBYwmmFmvlro7GQU0X8/d
         u42UzoA7K2GcYSL/yrGjK1K5elsWwKITXQ2Ad1TWXP7kXgeaRiqb+87hHK8DBicxxCxX
         pV00nuCnCnsCXIwz9v5NYqLItJvSuVhj3sFNvJyMIijCcmOU+2DWKRN2UXajUzgtDzHU
         P/jYGcKttLJUaiOF8wYNQ5RGeLLl/LuudMOeDQYSlrllRomNYQVN/eCfTnrJ86F+1xE4
         nIhXM7mtjmhA6xZy4MiPlM6lnDfG12+9HKroq21+WRyGFZZy42Z/nOWkbMzN6UjQClQz
         UU2w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:from:to:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=zw0wHivDLtnfCXbEW37o83WTsxcJws+y1kPJ96biP/I=;
        b=xgl2C9/7fNvHSkXEinxQQLwrg3tDuEyFOa9GP9PdC3ls08AzSY0uF0q7L+DSgu1wg8
         vH/p/IuqrAlhPfw8bXLiXSM5Q/P82GkS2d6tNzf0S5AskZo05uGyQ+pF3L2wnt4xNSw+
         PnsGKbLltlhP1/O/NWl7axRCmYxP1+pvwJMl3Wfx19crxuWEqHkhyqYiHQMPxrZkgism
         +d7Tok719sNXTYK/fjoxVwASaxk5bZKLhDeV/bhiIdDDWtWkY9nRVf8owQJywg/F3B7p
         Gmz6GqlxcanbE/4mWf/I8N9ukM6tBcz0swOFn6wpkZegburw24/E7xwzrOH0AvI/kzoe
         3elg==
X-Gm-Message-State: AOAM531O73u/P1Wklm8XhrmyvEVTtCExUcW3Tg7GmfWU647cA+L8cHYi
	5tIK0Bk16i3/kNUz+Xk6NiO65RgEi+1h7PC1
X-Google-Smtp-Source: 
 ABdhPJypmgeSPQF5ro0YacVdnHWHhBwVqWyrdGKezALprPZjB1aIuagMOFTU+gvSaieLH9mxER6FIQ==
X-Received: by 2002:a17:902:b411:b0:148:b9f5:79fa with SMTP id
 x17-20020a170902b41100b00148b9f579famr2818488plr.35.1640182384971;
        Wed, 22 Dec 2021 06:13:04 -0800 (PST)
Received: from hexa.router0800d9.com (rrcs-66-91-142-162.west.biz.rr.com.
 [66.91.142.162])
        by smtp.gmail.com with ESMTPSA id l6sm902849pfu.63.2021.12.22.06.13.03
        for <openembedded-core@lists.openembedded.org>
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 22 Dec 2021 06:13:04 -0800 (PST)
From: Steve Sakoman <steve@sakoman.com>
To: openembedded-core@lists.openembedded.org
Subject: [OE-core][dunfell 10/14] linux-yocto/5.4: update to v5.4.163
Date: Wed, 22 Dec 2021 04:12:23 -1000
Message-Id: 
 <94264cb2b1355a9b91bbbe701da858866cccb370.1640181998.git.steve@sakoman.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <cover.1640181998.git.steve@sakoman.com>
References: <cover.1640181998.git.steve@sakoman.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Wed, 22 Dec 2021 14:13:06 -0000
X-Groupsio-URL: 
 https://lists.openembedded.org/g/openembedded-core/message/159955

From: Bruce Ashfield <bruce.ashfield@gmail.com>

Updating linux-yocto/5.4 to the latest korg -stable release that comprises
the following commits:

57899c4e26bf Linux 5.4.163
6c728efe164f tty: hvc: replace BUG_ON() with negative return value
c3024e1945fe xen/netfront: don't trust the backend response data blindly
828b1d3861a1 xen/netfront: disentangle tx_skb_freelist
5b757077dacd xen/netfront: don't read data from request on the ring page
5c374d830e1b xen/netfront: read response from backend only once
3456a07614b1 xen/blkfront: don't trust the backend response data blindly
6392f51a9d2e xen/blkfront: don't take local copy of a request from the ring page
ce011335cb42 xen/blkfront: read response from backend only once
61826a7884cb xen: sync include/xen/interface/io/ring.h with Xen's newest version
54f682cd4849 fuse: release pipe buf after last use
eff32973ecc3 NFC: add NCI_UNREG flag to eliminate the race
43788453983e shm: extend forced shm destroy to support objects from several IPC nses
b23c0c4c9e0a s390/mm: validate VMA in PGSTE manipulation functions
3c9a213e0edb tracing: Check pid filtering when creating events
dda227cccf14 vhost/vsock: fix incorrect used length reported to the guest
2eacc0acf6ea smb3: do not error on fsync when readonly
51be334da375 f2fs: set SBI_NEED_FSCK flag when inconsistent node block found
3ceecea047c2 net: mscc: ocelot: correctly report the timestamping RX filters in ethtool
ee4e3f9d3dd7 net: mscc: ocelot: don't downgrade timestamping RX filters in SIOCSHWTSTAMP
0ea2e5497b8c net: hns3: fix VF RSS failed problem after PF enable multi-TCs
3b961640399b net/smc: Don't call clcsock shutdown twice when smc shutdown
5e44178864b3 net: vlan: fix underflow for the real_dev refcnt
296139e1de16 MIPS: use 3-level pgtable for 64KB page size on MIPS_VA_BITS_48
9f5838471aed igb: fix netpoll exit with traffic
25980820c4f0 nvmet: use IOCB_NOWAIT only if the filesystem supports it
d54662a91faa tcp_cubic: fix spurious Hystart ACK train detections for not-cwnd-limited flows
562fe6a6d2c5 PM: hibernate: use correct mode for swsusp_close()
2654e6cfc483 net/ncsi : Add payload to be 32-bit aligned to fix dropped packets
080f6b694ef1 nvmet-tcp: fix incomplete data digest send
6c0ab2caa8d1 net/smc: Ensure the active closing peer first closes clcsock
7854de57be29 scsi: core: sysfs: Fix setting device state to SDEV_RUNNING
67a6f64a0c84 net: nexthop: release IPv6 per-cpu dsts when replacing a nexthop group
cca61bb17042 net: ipv6: add fib6_nh_release_dsts stub
ddd0518c1e09 nfp: checking parameter process for rx-usecs/tx-usecs is invalid
b638eb32c64d ipv6: fix typos in __ip6_finish_output()
8029ced6d775 iavf: Prevent changing static ITR values if adaptive moderation is on
4374e414fcbf drm/vc4: fix error code in vc4_create_object()
7e324f734a91 scsi: mpt3sas: Fix kernel panic during drive powercycle test
dc9eb93d5a0a ARM: socfpga: Fix crash with CONFIG_FORTIRY_SOURCE
a078967dd34b NFSv42: Don't fail clone() unless the OP_CLONE operation failed
ce50e97a06bd firmware: arm_scmi: pm: Propagate return value to caller
7360abf31ce0 net: ieee802154: handle iftypes as u32
4421a196fdaf ASoC: topology: Add missing rwsem around snd_ctl_remove() calls
76867d0cb83f ASoC: qdsp6: q6routing: Conditionally reset FrontEnd Mixer
a848a22e9434 ARM: dts: BCM5301X: Add interrupt properties to GPIO node
03f7379e2c69 ARM: dts: BCM5301X: Fix I2C controller interrupt
17a763eab714 netfilter: ipvs: Fix reuse connection if RS weight is 0
fd7974c547ab proc/vmcore: fix clearing user buffer by properly using clear_user()
66d6eacba7a6 arm64: dts: marvell: armada-37xx: Set pcie_reset_pin to gpio function
3a4baf070c6a pinctrl: armada-37xx: Correct PWM pins definitions
086226048bcd PCI: aardvark: Fix support for PCI_BRIDGE_CTL_BUS_RESET on emulated bridge
7c517d7b8898 PCI: aardvark: Set PCI Bridge Class Code to PCI Bridge
44b2776a9307 PCI: aardvark: Fix support for bus mastering and PCI_COMMAND on emulated bridge
bbc6201152fb PCI: aardvark: Fix link training
3d770a20950b PCI: aardvark: Simplify initialization of rootcap on virtual bridge
a06ace0d317d PCI: aardvark: Implement re-issuing config requests on CRS response
75faadcc3a0e PCI: aardvark: Fix PCIe Max Payload Size setting
c697885a1281 PCI: aardvark: Configure PCIe resources from 'ranges' DT property
e3c51ac70aae PCI: pci-bridge-emul: Fix array overruns, improve safety
ea6eef03dafb PCI: aardvark: Update comment about disabling link training
fe8a8c3a408e PCI: aardvark: Move PCIe reset card code to advk_pcie_train_link()
14311e77c93e PCI: aardvark: Fix compilation on s390
93491c5d26f7 PCI: aardvark: Don't touch PCIe registers if no card connected
8b0f7b8b7839 PCI: aardvark: Replace custom macros by standard linux/pci_regs.h macros
e090b2e2708e PCI: aardvark: Issue PERST via GPIO
0ad291db2d01 PCI: aardvark: Improve link training
063a98c00528 PCI: aardvark: Train link immediately after enabling training
bbe213fd12fb PCI: aardvark: Fix big endian support
5551081d845e PCI: aardvark: Wait for endpoint to be ready before training link
65d962199b7f PCI: aardvark: Deduplicate code in advk_pcie_rd_conf()
57c7d46e8b1d mdio: aspeed: Fix "Link is Down" issue
e466278662be mmc: sdhci: Fix ADMA for PAGE_SIZE >= 64KiB
e09e868c6341 tracing: Fix pid filtering when triggers are attached
f5bbebfd7ca1 tracing/uprobe: Fix uprobe_perf_open probes iteration
5c895828f421 KVM: PPC: Book3S HV: Prevent POWER7/8 TLB flush flushing SLB
4f1adc3f572a xen: detect uninitialized xenbus in xenbus_init
173fe1aedf67 xen: don't continue xenstore initialization in case of errors
2e1ec01af2c7 staging: rtl8192e: Fix use after free in _rtl92e_pci_disconnect()
e72e981d16fc staging/fbtft: Fix backlight
9b406e39e539 HID: wacom: Use "Confidence" flag to prevent reporting invalid contacts
c03ad97293d2 Revert "parisc: Fix backtrace to always include init funtion names"
4a6f918a92b0 media: cec: copy sequence field for the reply
8d0b9ea19174 ALSA: ctxfi: Fix out-of-range access
aaa83768ba39 binder: fix test regression due to sender_euid change
d797fde8644a usb: hub: Fix locking issues with address0_mutex
4b354aeea431 usb: hub: Fix usb enumeration issue due to address0 race
d00bf013aed2 usb: typec: fusb302: Fix masking of comparator and bc_lvl interrupts
7b6f44856da5 net: nexthop: fix null pointer dereference when IPv6 is not enabled
9ad421aedc55 usb: dwc2: hcd_queue: Fix use of floating point literal
e44a934f9e04 usb: dwc2: gadget: Fix ISOC flow for elapsed frames
c2e05c4ed8a3 USB: serial: option: add Fibocom FM101-GL variants
ee034eae9d9b USB: serial: option: add Telit LE910S1 0x9200 composition

Signed-off-by: Bruce Ashfield <bruce.ashfield@gmail.com>
Signed-off-by: Steve Sakoman <steve@sakoman.com>
---
 .../linux/linux-yocto-rt_5.4.bb               |  6 ++---
 .../linux/linux-yocto-tiny_5.4.bb             |  8 +++----
 meta/recipes-kernel/linux/linux-yocto_5.4.bb  | 22 +++++++++----------
 3 files changed, 18 insertions(+), 18 deletions(-)

diff --git a/meta/recipes-kernel/linux/linux-yocto-rt_5.4.bb b/meta/recipes-kernel/linux/linux-yocto-rt_5.4.bb
index 3d0b248b3a..7d4361e6e3 100644
--- a/meta/recipes-kernel/linux/linux-yocto-rt_5.4.bb
+++ b/meta/recipes-kernel/linux/linux-yocto-rt_5.4.bb
@@ -11,13 +11,13 @@ python () {
         raise bb.parse.SkipRecipe("Set PREFERRED_PROVIDER_virtual/kernel to linux-yocto-rt to enable it")
 }
 
-SRCREV_machine ?= "17e5e7a7f94d3d11d9d22fb6de614492596c0a8d"
-SRCREV_meta ?= "51f40ce1f17bfdb31fb7bf4dd81f3b53bfd49fcc"
+SRCREV_machine ?= "edc3786860d52e6116ac35299e7b3ffb5fa2c541"
+SRCREV_meta ?= "c8cf16c4be0513bc1e4c4349ff447737d850d222"
 
 SRC_URI = "git://git.yoctoproject.org/linux-yocto.git;branch=${KBRANCH};name=machine \
            git://git.yoctoproject.org/yocto-kernel-cache;type=kmeta;name=meta;branch=yocto-5.4;destsuffix=${KMETA}"
 
-LINUX_VERSION ?= "5.4.162"
+LINUX_VERSION ?= "5.4.163"
 
 LIC_FILES_CHKSUM = "file://COPYING;md5=bbea815ee2795b2f4230826c0c6b8814"
 
diff --git a/meta/recipes-kernel/linux/linux-yocto-tiny_5.4.bb b/meta/recipes-kernel/linux/linux-yocto-tiny_5.4.bb
index 024ab77d08..22983cc9ff 100644
--- a/meta/recipes-kernel/linux/linux-yocto-tiny_5.4.bb
+++ b/meta/recipes-kernel/linux/linux-yocto-tiny_5.4.bb
@@ -6,7 +6,7 @@ KCONFIG_MODE = "--allnoconfig"
 
 require recipes-kernel/linux/linux-yocto.inc
 
-LINUX_VERSION ?= "5.4.162"
+LINUX_VERSION ?= "5.4.163"
 LIC_FILES_CHKSUM = "file://COPYING;md5=bbea815ee2795b2f4230826c0c6b8814"
 
 DEPENDS += "${@bb.utils.contains('ARCH', 'x86', 'elfutils-native', '', d)}"
@@ -15,9 +15,9 @@ DEPENDS += "openssl-native util-linux-native"
 KMETA = "kernel-meta"
 KCONF_BSP_AUDIT_LEVEL = "2"
 
-SRCREV_machine_qemuarm ?= "e3cbc4448222038ed98186783b61b099e35ef08d"
-SRCREV_machine ?= "0c97af59c367809671cf25eed595e3fef21eb493"
-SRCREV_meta ?= "51f40ce1f17bfdb31fb7bf4dd81f3b53bfd49fcc"
+SRCREV_machine_qemuarm ?= "71d15eb7c150cf6101ba19177fc3b8d9dea3c81a"
+SRCREV_machine ?= "3ecd5d9389679dcd6b5924990795a7a1800ccb8c"
+SRCREV_meta ?= "c8cf16c4be0513bc1e4c4349ff447737d850d222"
 
 PV = "${LINUX_VERSION}+git${SRCPV}"
 
diff --git a/meta/recipes-kernel/linux/linux-yocto_5.4.bb b/meta/recipes-kernel/linux/linux-yocto_5.4.bb
index e81bb00b87..28fb30efa6 100644
--- a/meta/recipes-kernel/linux/linux-yocto_5.4.bb
+++ b/meta/recipes-kernel/linux/linux-yocto_5.4.bb
@@ -12,16 +12,16 @@ KBRANCH_qemux86  ?= "v5.4/standard/base"
 KBRANCH_qemux86-64 ?= "v5.4/standard/base"
 KBRANCH_qemumips64 ?= "v5.4/standard/mti-malta64"
 
-SRCREV_machine_qemuarm ?= "d787585d276bc42eb17f3b04ed8e1c36d51b3258"
-SRCREV_machine_qemuarm64 ?= "87892857e00d1cdb6802abaea19cf65bee71da55"
-SRCREV_machine_qemumips ?= "4f84fe187ca152aab43fa6008989a5d00cca6bdb"
-SRCREV_machine_qemuppc ?= "4936240e37cfc88fe728add8ff3d9bd548c400ef"
-SRCREV_machine_qemuriscv64 ?= "439da70d7184793365a45e83ec1b816fd0ec0afe"
-SRCREV_machine_qemux86 ?= "439da70d7184793365a45e83ec1b816fd0ec0afe"
-SRCREV_machine_qemux86-64 ?= "439da70d7184793365a45e83ec1b816fd0ec0afe"
-SRCREV_machine_qemumips64 ?= "cef4f9fba704dba2cca97111ead9e579fde115c4"
-SRCREV_machine ?= "439da70d7184793365a45e83ec1b816fd0ec0afe"
-SRCREV_meta ?= "51f40ce1f17bfdb31fb7bf4dd81f3b53bfd49fcc"
+SRCREV_machine_qemuarm ?= "510b022c947de1f73032233cb779797c47a5f20d"
+SRCREV_machine_qemuarm64 ?= "f16453629ea08136e0f55450a27c8e9b6ab3d812"
+SRCREV_machine_qemumips ?= "2dfc09d7dfe1d44f8e6782a6b00859b4be2eab1d"
+SRCREV_machine_qemuppc ?= "4a1091334ce7caf51953bbaee9efe0874a06037b"
+SRCREV_machine_qemuriscv64 ?= "ccec7b885902fcb1628b33ed2b35d5a68b287f93"
+SRCREV_machine_qemux86 ?= "ccec7b885902fcb1628b33ed2b35d5a68b287f93"
+SRCREV_machine_qemux86-64 ?= "ccec7b885902fcb1628b33ed2b35d5a68b287f93"
+SRCREV_machine_qemumips64 ?= "50a3d639d9147f947ea1987b9679b465936a7f71"
+SRCREV_machine ?= "ccec7b885902fcb1628b33ed2b35d5a68b287f93"
+SRCREV_meta ?= "c8cf16c4be0513bc1e4c4349ff447737d850d222"
 
 # remap qemuarm to qemuarma15 for the 5.4 kernel
 # KMACHINE_qemuarm ?= "qemuarma15"
@@ -30,7 +30,7 @@ SRC_URI = "git://git.yoctoproject.org/linux-yocto.git;name=machine;branch=${KBRA
            git://git.yoctoproject.org/yocto-kernel-cache;type=kmeta;name=meta;branch=yocto-5.4;destsuffix=${KMETA}"
 
 LIC_FILES_CHKSUM = "file://COPYING;md5=bbea815ee2795b2f4230826c0c6b8814"
-LINUX_VERSION ?= "5.4.162"
+LINUX_VERSION ?= "5.4.163"
 
 DEPENDS += "${@bb.utils.contains('ARCH', 'x86', 'elfutils-native', '', d)}"
 DEPENDS += "openssl-native util-linux-native"
-- 
2.25.1


