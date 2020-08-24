Received: from mail-pl1-f170.google.com (mail-pl1-f170.google.com [209.85.214.170])
 by mx.groups.io with SMTP id smtpd.web10.197583.1598282132611924270
 for <openembedded-core@lists.openembedded.org>;
 Mon, 24 Aug 2020 08:15:32 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@sakoman-com.20150623.gappssmtp.com header.s=20150623 header.b=L1ybnpF1;
 spf=softfail (domain: sakoman.com, ip: 209.85.214.170, mailfrom: steve@sakoman.com)
Received: by mail-pl1-f170.google.com with SMTP id p15so821995pli.6
        for <openembedded-core@lists.openembedded.org>; Mon, 24 Aug 2020 08:15:32 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=sakoman-com.20150623.gappssmtp.com; s=20150623;
        h=from:to:subject:date:message-id:in-reply-to:references;
        bh=vYE+5EEbNa24oXjmRDVhVNc/bJEKP9FP6iwhsRHXZ5c=;
        b=L1ybnpF18CKGO+3SEFdHZMAWvajDcY61wvTbZd3RIA2MV1dv+PRItcYF9bUEgKTPph
         DRoMhonsj62u1KOSrlhogCY1X7vQUQNYJEzXPdt8oj4ByZB19OPpfrOCFa83X1+Qt+cL
         8SGxl3cTrE6qO2ijygyZ15RErkWxCJYSB/9mcWjHpl3e94UDpEQpskrVEttNNZOTYDq1
         OLb//fJ/Ns1pnHOurBDMgOGX/3YALFYZRLIuuuK61f4MD5EQX3ZtRBEhyUsrciwo5D+e
         1+HcSdK9uZyEzw0UWPnf+JlPwA9ZUYlqvvbMFAJm9oB6FSu4Y3dMMVSGAgIsoX3H40GK
         kCrw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:subject:date:message-id:in-reply-to
         :references;
        bh=vYE+5EEbNa24oXjmRDVhVNc/bJEKP9FP6iwhsRHXZ5c=;
        b=YnBq9xmVz7erM6Ppa8DacehYt2Bfu2uq9YjfSbDLbf98S7SnarDvBZwiPLu3c+zcN7
         y2q35GiXpJSCJ4IIpdClEj/tm/yEmQwPo27XIj36g1NSo/2ogjSbEUss6/ttYFEvLd4q
         r8gg1jJk75upIqZc7hGmYBwzerrGNWLa5GsFKjAOMGCGbOUA6Eqx/A9B4FbrlbtTFGot
         OSfE5PfSxjb+W2PRFBd8d5KS6/Jc8NVgHDH+mwf2Zo43wxv2vGw4ACNcUxzF30aUfkwD
         /iatxuTEjB4jo+Gp4wCpnG9pq/32cMz6Q+BD6jimAoTkk3FXjyosYxaiKc7eEDegNX40
         FTkA==
X-Gm-Message-State: AOAM533xfLcA8G1fgRNhLj5OOs6tkl3Z6M1cJf+ULgQvsh1QCtrxAUCE
	FdQHC+dYcgPM/vvqGZeZm69vEsZLm7EfgP0aGjY=
X-Google-Smtp-Source: ABdhPJyAuJA1PSpOgASWS91FXFvcb49ocuKrtwftjUY30XQEavBiAtK+LPnWwqUquCt9UZJrcH2wgg==
X-Received: by 2002:a17:902:e78d:: with SMTP id cp13mr4179297plb.105.1598282131555;
        Mon, 24 Aug 2020 08:15:31 -0700 (PDT)
Return-Path: <steve@sakoman.com>
Received: from octo.router0800d9.com (rrcs-66-91-142-162.west.biz.rr.com. [66.91.142.162])
        by smtp.gmail.com with ESMTPSA id a13sm11530382pfo.49.2020.08.24.08.15.29
        for <openembedded-core@lists.openembedded.org>
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 24 Aug 2020 08:15:30 -0700 (PDT)
From: "Steve Sakoman" <steve@sakoman.com>
To: openembedded-core@lists.openembedded.org
Subject: [OE-core][dunfell 04/12] linux-yocto/5.4: update to v5.4.58
Date: Mon, 24 Aug 2020 05:14:53 -1000
Message-Id: <c4c7de54d0e914ec2385cb0f88c2e6f391f0eb0f.1598281931.git.steve@sakoman.com>
X-Mailer: git-send-email 2.17.1
In-Reply-To: <cover.1598281931.git.steve@sakoman.com>
References: <cover.1598281931.git.steve@sakoman.com>

From: Bruce Ashfield <bruce.ashfield@gmail.com>

Updating linux-yocto/5.4 to the latest korg -stable release that comprises
the following commits:

    cad17feaf0d0 Linux 5.4.58
    512570b17807 nfsd: Fix NFSv4 READ on RDMA when using readv
    df6aeb5235e9 ima: move APPRAISE_BOOTPARAM dependency on ARCH_POLICY to runtime
    fb264505b395 tcp: apply a floor of 1 for RTT samples from TCP timestamps
    848e15a8c8f6 selftests/net: relax cpu affinity requirement in msg_zerocopy test
    b8f2d34f6bb5 Revert "vxlan: fix tos value before xmit"
    daff7f09f341 openvswitch: Prevent kernel-infoleak in ovs_ct_put_key()
    ba729a97ae54 net: thunderx: use spin_lock_bh in nicvf_set_rx_mode_task()
    786a9368be8c net: gre: recompute gre csum for sctp over gre tunnels
    5d791d36a49b hv_netvsc: do not use VF device if link is down
    3a82f4bfd20a dpaa2-eth: Fix passing zero to 'PTR_ERR' warning
    5a963aa72107 appletalk: Fix atalk_proc_init() return path
    3787b5a3ac67 net: lan78xx: replace bogus endpoint lookup
    31489ed8c20c vxlan: Ensure FDB dump is performed under RCU
    106b415d5139 rxrpc: Fix race between recvmsg and sendmsg on immediate call failure
    6f9354702ca5 net: ethernet: mtk_eth_soc: fix MTU warnings
    bd68177f26e4 ipv6: Fix nexthop refcnt leak when creating ipv6 route info
    89c12bc36262 ipv6: fix memory leaks on IPV6_ADDRFORM path
    9b37a7bcdd8a ipv4: Silence suspicious RCU usage warning
    4913f71e64ab PCI: tegra: Revert tegra124 raw_violation_fixup
    ceff42e6c1fc Revert "powerpc/kasan: Fix shadow pages allocation failure"
    11e64146dc69 xattr: break delegations in {set,remove}xattr
    6059000e145f Drivers: hv: vmbus: Ignore CHANNELMSG_TL_CONNECT_RESULT(23)
    3429579045f1 tools lib traceevent: Fix memory leak in process_dynamic_array_len
    414f10532c14 atm: fix atm_dev refcnt leaks in atmtcp_remove_persistent
    5414f27048e5 igb: reinit_locked() should be called with rtnl_lock
    7c8a863ba3cb cfg80211: check vendor command doit pointer before use
    83ea63708a29 firmware: Fix a reference count leak.
    01fdcb848611 ALSA: hda: fix NULL pointer dereference during suspend
    eb96e4f71f59 net: ethernet: mtk_eth_soc: Always call mtk_gmac0_rgmii_adjust() for mt7623
    fd601f38f59d usb: hso: check for return value in hso_serial_common_create()
    871b5a5a3be9 i2c: slave: add sanity check when unregistering
    fa0195d83a49 i2c: slave: improve sanity check when registering
    4bba72b72c36 drm/drm_fb_helper: fix fbdev with sparc64
    8e6af828a332 nvme-pci: prevent SK hynix PC400 from using Write Zeroes command
    802df1e3f40c drm/nouveau/fbcon: zero-initialise the mode_cmd2 structure
    5955ccb5a46d drm/nouveau/fbcon: fix module unload when fbcon init has failed for some reason
    e0c47a51fc62 net/9p: validate fds in p9_fd_open
    fe6402e0e66c leds: 88pm860x: fix use-after-free on unbind
    3564cddefb5b leds: lm3533: fix use-after-free on unbind
    385c1ae9ddb9 leds: da903x: fix use-after-free on unbind
    bde8f23c030c leds: lm36274: fix use-after-free on unbind
    635f8fcc2ee3 leds: wm831x-status: fix use-after-free on unbind
    9a53e8bd59d9 mtd: properly check all write ioctls for permissions
    8c3215a0426c vgacon: Fix for missing check in scrollback handling
    1ae21e97d5d3 scripts: add dummy report mode to add_namespace.cocci
    5f5fb7cea828 Smack: fix use-after-free in smk_write_relabel_self()
    c5665cafbedd binder: Prevent context manager from incrementing ref 0
    da47eae4e165 omapfb: dss: Fix max fclk divider for omap36xx
    b78763e0a247 Bluetooth: Prevent out-of-bounds read in hci_inquiry_result_with_rssi_evt()
    70d1e884edc4 Bluetooth: Prevent out-of-bounds read in hci_inquiry_result_evt()
    c26eaaf547b7 Bluetooth: Fix slab-out-of-bounds read in hci_extended_inquiry_result_evt()
    a8b8b535c588 Staging: rtl8188eu: rtw_mlme: Fix uninitialized variable authmode
    af707d9d7f44 staging: rtl8712: handle firmware load failure
    6a7626c4798d staging: android: ashmem: Fix lockdep warning for write operation
    4d81a7bdd3b2 ALSA: seq: oss: Serialize ioctls
    3ebdc7b61906 ALSA: hda/ca0132 - Fix AE-5 microphone selection commands.
    b8ce0756b312 ALSA: hda/ca0132 - Fix ZxR Headphone gain control get value.
    87775770635a ALSA: hda/ca0132 - Add new quirk ID for Recon3D.
    1d05ad79e1dd ALSA: hda/realtek: Add alc269/alc662 pin-tables for Loongson-3 laptops
    864468a7a63b Revert "ALSA: hda: call runtime_allow() for all hda controllers"
    e8053c68337e io_uring: Fix use-after-free in io_sq_wq_submit_work()
    a4d61e66ee4a io_uring: prevent re-read of sqe->opcode
    67afa25456d0 usb: xhci: Fix ASMedia ASM1142 DMA addressing
    e7ad225ba4ef usb: xhci: define IDs for various ASMedia host controllers
    7173ac5c07bb USB: iowarrior: fix up report size handling for some devices
    68a2350376b1 perf/core: Fix endless multiplex timer
    aabba1b10075 USB: serial: qcserial: add EM7305 QDL product ID

Signed-off-by: Bruce Ashfield <bruce.ashfield@gmail.com>
Signed-off-by: Richard Purdie <richard.purdie@linuxfoundation.org>
(cherry picked from commit 62acf5a876875bf734d53bd526b11b19e7bfcf45)
Signed-off-by: Steve Sakoman <steve@sakoman.com>
---
 .../linux/linux-yocto-rt_5.4.bb               |  6 ++---
 .../linux/linux-yocto-tiny_5.4.bb             |  8 +++----
 meta/recipes-kernel/linux/linux-yocto_5.4.bb  | 22 +++++++++----------
 3 files changed, 18 insertions(+), 18 deletions(-)

diff --git a/meta/recipes-kernel/linux/linux-yocto-rt_5.4.bb b/meta/recipes-kernel/linux/linux-yocto-rt_5.4.bb
index 24cc5353e3..2857dea130 100644
--- a/meta/recipes-kernel/linux/linux-yocto-rt_5.4.bb
+++ b/meta/recipes-kernel/linux/linux-yocto-rt_5.4.bb
@@ -11,13 +11,13 @@ python () {
         raise bb.parse.SkipRecipe("Set PREFERRED_PROVIDER_virtual/kernel to linux-yocto-rt to enable it")
 }
 
-SRCREV_machine ?= "9b7e1eef068382c132768964ccac22d35ac05d7b"
-SRCREV_meta ?= "4aeda12f7f7eb84613ae1fe6e22cd9cd9790c20b"
+SRCREV_machine ?= "550d18f9ff5749c779261b01d61a86c7e79b06b6"
+SRCREV_meta ?= "83311f062f4aede9928eca82a34ddf73f264fe2a"
 
 SRC_URI = "git://git.yoctoproject.org/linux-yocto.git;branch=${KBRANCH};name=machine \
            git://git.yoctoproject.org/yocto-kernel-cache;type=kmeta;name=meta;branch=yocto-5.4;destsuffix=${KMETA}"
 
-LINUX_VERSION ?= "5.4.57"
+LINUX_VERSION ?= "5.4.58"
 
 LIC_FILES_CHKSUM = "file://COPYING;md5=bbea815ee2795b2f4230826c0c6b8814"
 
diff --git a/meta/recipes-kernel/linux/linux-yocto-tiny_5.4.bb b/meta/recipes-kernel/linux/linux-yocto-tiny_5.4.bb
index c4bdfd61b1..78d57e1841 100644
--- a/meta/recipes-kernel/linux/linux-yocto-tiny_5.4.bb
+++ b/meta/recipes-kernel/linux/linux-yocto-tiny_5.4.bb
@@ -6,7 +6,7 @@ KCONFIG_MODE = "--allnoconfig"
 
 require recipes-kernel/linux/linux-yocto.inc
 
-LINUX_VERSION ?= "5.4.57"
+LINUX_VERSION ?= "5.4.58"
 LIC_FILES_CHKSUM = "file://COPYING;md5=bbea815ee2795b2f4230826c0c6b8814"
 
 DEPENDS += "${@bb.utils.contains('ARCH', 'x86', 'elfutils-native', '', d)}"
@@ -15,9 +15,9 @@ DEPENDS += "openssl-native util-linux-native"
 KMETA = "kernel-meta"
 KCONF_BSP_AUDIT_LEVEL = "2"
 
-SRCREV_machine_qemuarm ?= "afcbe2154b65d2ab1da70eaf38388b3c64366f8f"
-SRCREV_machine ?= "d3100abbe1a46aeefdf62d6a31fed31e94b9537d"
-SRCREV_meta ?= "4aeda12f7f7eb84613ae1fe6e22cd9cd9790c20b"
+SRCREV_machine_qemuarm ?= "919fb1aeb12bceab82f32139bec283c1bb5ebc1c"
+SRCREV_machine ?= "7e20784a1d13af858f83a2d5f582fe30329553ce"
+SRCREV_meta ?= "83311f062f4aede9928eca82a34ddf73f264fe2a"
 
 PV = "${LINUX_VERSION}+git${SRCPV}"
 
diff --git a/meta/recipes-kernel/linux/linux-yocto_5.4.bb b/meta/recipes-kernel/linux/linux-yocto_5.4.bb
index 8014d2ec29..bfba14f455 100644
--- a/meta/recipes-kernel/linux/linux-yocto_5.4.bb
+++ b/meta/recipes-kernel/linux/linux-yocto_5.4.bb
@@ -12,16 +12,16 @@ KBRANCH_qemux86  ?= "v5.4/standard/base"
 KBRANCH_qemux86-64 ?= "v5.4/standard/base"
 KBRANCH_qemumips64 ?= "v5.4/standard/mti-malta64"
 
-SRCREV_machine_qemuarm ?= "69c2cb15ed433d0c54548167b771aa86edf731b0"
-SRCREV_machine_qemuarm64 ?= "d3100abbe1a46aeefdf62d6a31fed31e94b9537d"
-SRCREV_machine_qemumips ?= "f0d91ff7f58bb7b6e6676abce3b2e56d8031c7a5"
-SRCREV_machine_qemuppc ?= "d3100abbe1a46aeefdf62d6a31fed31e94b9537d"
-SRCREV_machine_qemuriscv64 ?= "d3100abbe1a46aeefdf62d6a31fed31e94b9537d"
-SRCREV_machine_qemux86 ?= "d3100abbe1a46aeefdf62d6a31fed31e94b9537d"
-SRCREV_machine_qemux86-64 ?= "d3100abbe1a46aeefdf62d6a31fed31e94b9537d"
-SRCREV_machine_qemumips64 ?= "053475d8f61a47f2aa66f2be0ca6c668a73ff784"
-SRCREV_machine ?= "d3100abbe1a46aeefdf62d6a31fed31e94b9537d"
-SRCREV_meta ?= "4aeda12f7f7eb84613ae1fe6e22cd9cd9790c20b"
+SRCREV_machine_qemuarm ?= "1f11670a455ce50f55597415afedfc5eaa3981bf"
+SRCREV_machine_qemuarm64 ?= "7e20784a1d13af858f83a2d5f582fe30329553ce"
+SRCREV_machine_qemumips ?= "50557f1a2b606139ef5d6ba4a2f46ad7b7b2e96d"
+SRCREV_machine_qemuppc ?= "7e20784a1d13af858f83a2d5f582fe30329553ce"
+SRCREV_machine_qemuriscv64 ?= "7e20784a1d13af858f83a2d5f582fe30329553ce"
+SRCREV_machine_qemux86 ?= "7e20784a1d13af858f83a2d5f582fe30329553ce"
+SRCREV_machine_qemux86-64 ?= "7e20784a1d13af858f83a2d5f582fe30329553ce"
+SRCREV_machine_qemumips64 ?= "52e277a90804bb7ccef6e51bcf739d88788b4a69"
+SRCREV_machine ?= "7e20784a1d13af858f83a2d5f582fe30329553ce"
+SRCREV_meta ?= "83311f062f4aede9928eca82a34ddf73f264fe2a"
 
 # remap qemuarm to qemuarma15 for the 5.4 kernel
 # KMACHINE_qemuarm ?= "qemuarma15"
@@ -30,7 +30,7 @@ SRC_URI = "git://git.yoctoproject.org/linux-yocto.git;name=machine;branch=${KBRA
            git://git.yoctoproject.org/yocto-kernel-cache;type=kmeta;name=meta;branch=yocto-5.4;destsuffix=${KMETA}"
 
 LIC_FILES_CHKSUM = "file://COPYING;md5=bbea815ee2795b2f4230826c0c6b8814"
-LINUX_VERSION ?= "5.4.57"
+LINUX_VERSION ?= "5.4.58"
 
 DEPENDS += "${@bb.utils.contains('ARCH', 'x86', 'elfutils-native', '', d)}"
 DEPENDS += "openssl-native util-linux-native"
-- 
2.17.1

