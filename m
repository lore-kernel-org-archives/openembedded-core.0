Received: from mail-qv1-f45.google.com (mail-qv1-f45.google.com [209.85.219.45])
 by mx.groups.io with SMTP id smtpd.web08.7599.1614916473808214199
 for <openembedded-core@lists.openembedded.org>;
 Thu, 04 Mar 2021 19:54:34 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20161025 header.b=J9xNgSS0;
 spf=pass (domain: gmail.com, ip: 209.85.219.45, mailfrom: bruce.ashfield@gmail.com)
Received: by mail-qv1-f45.google.com with SMTP id 15so344774qvp.13
        for <openembedded-core@lists.openembedded.org>; Thu, 04 Mar 2021 19:54:33 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:content-transfer-encoding;
        bh=7630+r8qsxCdj5vydgDPBw4y18m11d3vIzb5wQ5oXrk=;
        b=J9xNgSS0BHTJ5NSmyQD9zRmSE6GXX4miQSx91C/KgH754T8ZmIbRLtc4s1CAm40khh
         LqjuUOPbzoInJ5XTYG9H7vAf1eLJWjEQU4W0CgwQHEZUqSDQ37zOP+N2wC15ivtgADdw
         INZjUmmSo7CxR9ZqxL2MV23pQp7DcfYfGuEK2M5abxqQd88kwKWFWVtVtx6IfOX76m92
         oe6bXwtpBV/DglR2q6hyMgw44PYreRXtVTeANOZvN2knAA38+XC2kvUiFPwXePvne8zb
         sVlJUyhBs+7+XjYSIdelCEdT669WcqPPjS0Z/1swETQisV+gU/rX5rejEyTIBrZOlmTs
         NUHw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=7630+r8qsxCdj5vydgDPBw4y18m11d3vIzb5wQ5oXrk=;
        b=QahpCj3bxeniz74kc8NglAsTVJtN1MCmVD3CM7pBhM6euhB5l3vQKICOoUZNU+Lopk
         FTP4dgJw2ACgBeo6813nEe7Z05Qn7ofBOHjSmsimh2Z5L/KE0DS6WVONE4hNESurVuPW
         quK9/5rAYxyk4/EWPIfWtl+a/rmpqEKlKHDm7+tajmgf0eygNIu5ffLM3lp2wdThR7jA
         NBFNg4oumrnKqYX+uIsrmvD7d5T681IxrbqJkIM8pg7BWV9jh3z+wrN2AhoLcRy0xvqP
         GIhbYFUoU+jQ9o60W/mFEopBDNiQlra9LjeX6iLMPIdGiMxbKC+kKS1D3qCLzCSjBj2T
         a6tg==
X-Gm-Message-State: AOAM531Dv8g/NWv8DW4N0lmCr4HDuI7AXLYjhmwy2YYRWzlURJhZGSBT
	7aVsJ4TVNA9YXUUpeKiRH1Y=
X-Google-Smtp-Source: ABdhPJwrX4r+PoePWLaeuuH9Giw9fbV6gzjNR+meZ4FJEvB2fDU3MuSvYmUscfRc5UR9MTRwMIUHNg==
X-Received: by 2002:a0c:c585:: with SMTP id a5mr7057396qvj.60.1614916472822;
        Thu, 04 Mar 2021 19:54:32 -0800 (PST)
Return-Path: <bruce.ashfield@gmail.com>
Received: from build.lan (cpe04d4c4975b80-cmf4c11490699b.cpe.net.cable.rogers.com. [174.112.159.151])
        by smtp.gmail.com with ESMTPSA id 66sm997383qkk.18.2021.03.04.19.54.32
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 04 Mar 2021 19:54:32 -0800 (PST)
From: "Bruce Ashfield" <bruce.ashfield@gmail.com>
To: richard.purdie@linuxfoundation.org
Cc: openembedded-core@lists.openembedded.org
Subject: [PATCH 5/6] linux-yocto/5.10: update to v5.10.19
Date: Thu,  4 Mar 2021 22:54:25 -0500
Message-Id: <d8853e9a293b733f870183795d96ec3fc7596740.1614916283.git.bruce.ashfield@gmail.com>
X-Mailer: git-send-email 2.19.1
In-Reply-To: <cover.1614916283.git.bruce.ashfield@gmail.com>
References: <cover.1614916283.git.bruce.ashfield@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

From: Bruce Ashfield <bruce.ashfield@gmail.com>

Updating linux-yocto/5.10 to the latest korg -stable release that comprises
the following commits:

    7b43ec8a0cc6 Linux 5.10.19
    983f361bde5e scripts/recordmcount.pl: support big endian for ARCH sh
    6ca89ac39e48 kbuild: fix CONFIG_TRIM_UNUSED_KSYMS build for ppc64
    b8b65310e4b9 cifs: Set CIFS_MOUNT_USE_PREFIX_PATH flag on setting cifs_sb->prepath.
    ec6504c8a1fc cxgb4: Add new T6 PCI device id 0x6092
    b7e51e5ecf39 NET: usb: qmi_wwan: Adding support for Cinterion MV31
    1f683fd2c21f drm/xlnx: fix kmemleak by sending vblank_event in atomic_disable
    3320aa64c322 KVM: Use kvm_pfn_t for local PFN variable in hva_to_pfn_remapped()
    a42150f1c965 mm: provide a saner PTE walking API for modules
    83d42c25868d KVM: do not assume PTE is writable after follow_pfn
    6d9c9ec0d859 mm: simplify follow_pte{,pmd}
    f8d8fb7ae86c mm: unexport follow_pte_pmd
    d2cbae37c3d8 KVM: x86: Zap the oldest MMU pages, not the newest
    729fbb8cb276 hwmon: (dell-smm) Add XPS 15 L502X to fan control blacklist
    956690f5c607 arm64: tegra: Add power-domain for Tegra210 HDA
    d63699364fa3 Bluetooth: btusb: Some Qualcomm Bluetooth adapters stop working
    9f04a05fa1ed ntfs: check for valid standard information attribute
    3e81e1db8b50 ceph: downgrade warning from mdsmap decode to debug
    92c8c930caa0 usb: quirks: add quirk to start video capture on ELMO L-12F document camera reliable
    f8921ed4d330 USB: quirks: sort quirk entries
    95c0528c11b2 nvme-rdma: Use ibdev_to_node instead of dereferencing ->dma_device
    225d207da2e1 RDMA: Lift ibdev_to_node from rds to common code
    77344e18cf84 HID: make arrays usage and value to be the same
    3320bae8c115 bpf: Fix truncation handling for mod32 dst reg wrt zero
    63b9d2e001fd Linux 5.10.18
    c6152fd3ac2b media: pwc: Use correct device for DMA
    a6703c711534 btrfs: fix crash after non-aligned direct IO write with O_DSYNC
    aa0fd921d207 btrfs: fix backport of 2175bf57dc952 in 5.10.13
    df443aad518d Bluetooth: btusb: Always fallback to alt 1 for WBS
    ffec7ee21809 tty: protect tty_write from odd low-level tty disciplines
    00805af45a21 xen-blkback: fix error handling in xen_blkbk_map()
    9bea436fc3fc xen-scsiback: don't "handle" error by BUG()
    2814b3aa38a6 xen-netback: don't "handle" error by BUG()
    8f8ebd6b1cb5 xen-blkback: don't "handle" error by BUG()
    0462dbbe2cab xen/arm: don't ignore return errors from set_phys_to_machine
    be89a0300a58 Xen/gntdev: correct error checking in gntdev_map_grant_pages()
    1a5c2274349f Xen/gntdev: correct dev_bus_addr handling in gntdev_map_grant_pages()
    0c08037b56a7 Xen/x86: also check kernel mapping in set_foreign_p2m_mapping()
    740f4d9d0c34 Xen/x86: don't bail early from clear_foreign_p2m_mapping()
    06ab1e63ec5c net: fix proc_fs init handling in af_packet and tls
    ba2582cd7f20 net: bridge: Fix a warning when del bridge sysfs
    2bce178c254c net: openvswitch: fix TTL decrement exception action execution
    78b12034d4c3 net: sched: incorrect Kconfig dependencies on Netfilter modules
    f9d6533d18fd mt76: mt7615: fix rdd mcu cmd endianness
    977060d4ec5b mt76: mt7915: fix endian issues
    496ef46dbf6d net/sched: fix miss init the mru in qdisc_skb_cb
    40bf5450ba6f mptcp: skip to next candidate if subflow has unacked data
    36e4b9383890 net: qrtr: Fix port ID for control messages
    c313e91b97eb IB/isert: add module param to set sg_tablesize for IO cmd
    5840f8687fdf vdpa_sim: add get_config callback in vdpasim_dev_attr
    8faf3ea12225 vdpa_sim: make 'config' generic and usable for any device type
    0fb67eda6a9c vdpa_sim: store parsed MAC address in a buffer
    0ed8181561be vdpa_sim: add struct vdpasim_dev_attr for device attributes
    c721898723bc vdpa_sim: remove hard-coded virtq count

Signed-off-by: Bruce Ashfield <bruce.ashfield@gmail.com>
---
 .../linux/linux-yocto-rt_5.10.bb              |  6 ++---
 .../linux/linux-yocto-tiny_5.10.bb            |  8 +++----
 meta/recipes-kernel/linux/linux-yocto_5.10.bb | 22 +++++++++----------
 3 files changed, 18 insertions(+), 18 deletions(-)

diff --git a/meta/recipes-kernel/linux/linux-yocto-rt_5.10.bb b/meta/recipes-kernel/linux/linux-yocto-rt_5.10.bb
index be30a0fd21..fdd2b75e37 100644
--- a/meta/recipes-kernel/linux/linux-yocto-rt_5.10.bb
+++ b/meta/recipes-kernel/linux/linux-yocto-rt_5.10.bb
@@ -11,13 +11,13 @@ python () {
         raise bb.parse.SkipRecipe("Set PREFERRED_PROVIDER_virtual/kernel to linux-yocto-rt to enable it")
 }
 
-SRCREV_machine ?= "c5a939ea17c76efce58a5386d41ea15db946f628"
-SRCREV_meta ?= "f905c5cd14f64e51454cfe56d2e510ee7469a832"
+SRCREV_machine ?= "a5f867f5e3eb84a66082b5b1bf1f4a2bb10d035e"
+SRCREV_meta ?= "67e74d52f2aaa17ca7041032714368ea81bc8823"
 
 SRC_URI = "git://git.yoctoproject.org/linux-yocto.git;branch=${KBRANCH};name=machine \
            git://git.yoctoproject.org/yocto-kernel-cache;type=kmeta;name=meta;branch=yocto-5.10;destsuffix=${KMETA}"
 
-LINUX_VERSION ?= "5.10.17"
+LINUX_VERSION ?= "5.10.19"
 
 LIC_FILES_CHKSUM = "file://COPYING;md5=6bc538ed5bd9a7fc9398086aedcd7e46"
 
diff --git a/meta/recipes-kernel/linux/linux-yocto-tiny_5.10.bb b/meta/recipes-kernel/linux/linux-yocto-tiny_5.10.bb
index 01c468116f..482326968a 100644
--- a/meta/recipes-kernel/linux/linux-yocto-tiny_5.10.bb
+++ b/meta/recipes-kernel/linux/linux-yocto-tiny_5.10.bb
@@ -6,7 +6,7 @@ KCONFIG_MODE = "--allnoconfig"
 
 require recipes-kernel/linux/linux-yocto.inc
 
-LINUX_VERSION ?= "5.10.17"
+LINUX_VERSION ?= "5.10.19"
 LIC_FILES_CHKSUM = "file://COPYING;md5=6bc538ed5bd9a7fc9398086aedcd7e46"
 
 DEPENDS += "${@bb.utils.contains('ARCH', 'x86', 'elfutils-native', '', d)}"
@@ -15,9 +15,9 @@ DEPENDS += "openssl-native util-linux-native"
 KMETA = "kernel-meta"
 KCONF_BSP_AUDIT_LEVEL = "2"
 
-SRCREV_machine_qemuarm ?= "077233e3be7323f0a1f1bc488292bc3bcfe37f5a"
-SRCREV_machine ?= "0119f230267c87ad2cc77b9190035280f40b2cf4"
-SRCREV_meta ?= "f905c5cd14f64e51454cfe56d2e510ee7469a832"
+SRCREV_machine_qemuarm ?= "7e9d9495ff1531e9ffa8fc6161a1aa03a2b04966"
+SRCREV_machine ?= "5b86278250511c301540dc2ce5bf9561621b0bb4"
+SRCREV_meta ?= "67e74d52f2aaa17ca7041032714368ea81bc8823"
 
 PV = "${LINUX_VERSION}+git${SRCPV}"
 
diff --git a/meta/recipes-kernel/linux/linux-yocto_5.10.bb b/meta/recipes-kernel/linux/linux-yocto_5.10.bb
index 8cf0f60271..6c0bec76d7 100644
--- a/meta/recipes-kernel/linux/linux-yocto_5.10.bb
+++ b/meta/recipes-kernel/linux/linux-yocto_5.10.bb
@@ -12,16 +12,16 @@ KBRANCH_qemux86  ?= "v5.10/standard/base"
 KBRANCH_qemux86-64 ?= "v5.10/standard/base"
 KBRANCH_qemumips64 ?= "v5.10/standard/mti-malta64"
 
-SRCREV_machine_qemuarm ?= "b4db275e753768a68d72f270d441a8d77b008299"
-SRCREV_machine_qemuarm64 ?= "0119f230267c87ad2cc77b9190035280f40b2cf4"
-SRCREV_machine_qemumips ?= "a669b4f0c27ebd9689c8b6bd2c82fab7bbf4a537"
-SRCREV_machine_qemuppc ?= "0119f230267c87ad2cc77b9190035280f40b2cf4"
-SRCREV_machine_qemuriscv64 ?= "0119f230267c87ad2cc77b9190035280f40b2cf4"
-SRCREV_machine_qemux86 ?= "0119f230267c87ad2cc77b9190035280f40b2cf4"
-SRCREV_machine_qemux86-64 ?= "0119f230267c87ad2cc77b9190035280f40b2cf4"
-SRCREV_machine_qemumips64 ?= "fe5b8cb8b21fb42caae54bf031e2b41fa88616ff"
-SRCREV_machine ?= "0119f230267c87ad2cc77b9190035280f40b2cf4"
-SRCREV_meta ?= "f905c5cd14f64e51454cfe56d2e510ee7469a832"
+SRCREV_machine_qemuarm ?= "56020f462aa0d5373f3f0b683c6647f9dc8ffdc9"
+SRCREV_machine_qemuarm64 ?= "5b86278250511c301540dc2ce5bf9561621b0bb4"
+SRCREV_machine_qemumips ?= "d6e16284f4bd6e627ef6dc2f6aea7116ae871d3e"
+SRCREV_machine_qemuppc ?= "5b86278250511c301540dc2ce5bf9561621b0bb4"
+SRCREV_machine_qemuriscv64 ?= "5b86278250511c301540dc2ce5bf9561621b0bb4"
+SRCREV_machine_qemux86 ?= "5b86278250511c301540dc2ce5bf9561621b0bb4"
+SRCREV_machine_qemux86-64 ?= "5b86278250511c301540dc2ce5bf9561621b0bb4"
+SRCREV_machine_qemumips64 ?= "40975f4cdd7da46177e9b7817740a0aa22313897"
+SRCREV_machine ?= "5b86278250511c301540dc2ce5bf9561621b0bb4"
+SRCREV_meta ?= "67e74d52f2aaa17ca7041032714368ea81bc8823"
 
 # remap qemuarm to qemuarma15 for the 5.8 kernel
 # KMACHINE_qemuarm ?= "qemuarma15"
@@ -30,7 +30,7 @@ SRC_URI = "git://git.yoctoproject.org/linux-yocto.git;name=machine;branch=${KBRA
            git://git.yoctoproject.org/yocto-kernel-cache;type=kmeta;name=meta;branch=yocto-5.10;destsuffix=${KMETA}"
 
 LIC_FILES_CHKSUM = "file://COPYING;md5=6bc538ed5bd9a7fc9398086aedcd7e46"
-LINUX_VERSION ?= "5.10.17"
+LINUX_VERSION ?= "5.10.19"
 
 DEPENDS += "${@bb.utils.contains('ARCH', 'x86', 'elfutils-native', '', d)}"
 DEPENDS += "openssl-native util-linux-native"
-- 
2.19.1

