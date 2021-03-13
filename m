Received: from mail-ot1-f41.google.com (mail-ot1-f41.google.com [209.85.210.41])
 by mx.groups.io with SMTP id smtpd.web09.2555.1615661423603052469
 for <openembedded-core@lists.openembedded.org>;
 Sat, 13 Mar 2021 10:50:23 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@sakoman-com.20150623.gappssmtp.com header.s=20150623 header.b=aDvtWO/P;
 spf=softfail (domain: sakoman.com, ip: 209.85.210.41, mailfrom: steve@sakoman.com)
Received: by mail-ot1-f41.google.com with SMTP id 31-20020a9d00220000b02901b64b9b50b1so3136789ota.9
        for <openembedded-core@lists.openembedded.org>; Sat, 13 Mar 2021 10:50:23 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=sakoman-com.20150623.gappssmtp.com; s=20150623;
        h=from:to:subject:date:message-id:in-reply-to:references:mime-version
         :content-transfer-encoding;
        bh=NxUXWcDDZjN7EEGAFgXPRlE1P/YEwU7NqezCdFRQFTo=;
        b=aDvtWO/PJ2e+MUibu3ca/X0wwDQWTecuRzUY/ZItSig8rxFEYJWZ9m4UDT+bJEW09e
         cJCABNMc3H/Qz4mXFooGwQnspbYPPb08qjepPfCzjJvqLCee8i/srWvPcl+cUOwpxjV7
         rycSvxTgVRmFDx7oaU4Db3O+xy7pr3VtLyX3ktKIHb/4NSsiLpADSgn8A0TClO6GWiq0
         WuQ2gwnj+/rK3a2OQ6ZAQ6XRCWbkYsesiL3scUAu+/5WrTFzlFEI1zSb5JNgyo6idJdb
         iWMOUIiCOAs0s1e7DEpe5jcNVJhmpyo4ZNKTVYhckLwYLPPp6SVT+/eEDobtT552XfFd
         pGrQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=NxUXWcDDZjN7EEGAFgXPRlE1P/YEwU7NqezCdFRQFTo=;
        b=QoW1kYcChMYgV1oO1S3/INt1bcFjZTBdtTH+XtGEX01QKXsKO3bGP14QAjReN5xCtw
         wjPT0sN/H8xiaEGbcMZJjnecNTSE/j3aHBleaxMjJlNVWKOuWEkrMX+gjwJQr1Btdzis
         dOlabrrtDHGkL6pa0wI6cPyyDX5v1h35eobgaZ4fR7oWJzin7BLq172L83/OLcqhf8pQ
         MIgDttnrssSI1I3vq65cvwLde4s6Pk/+ok4q/vcfUza9hvkJgKNUG9gr4HnQeif+cOra
         Hu+0hFhK0oA+Iqi6jPL9dFZamRU/cUISo3VCtGofazA0mdpc2WT3T7k0LGA7P/UhPybb
         cFxg==
X-Gm-Message-State: AOAM530NmNIAJgj17RLNfCGib1/2NIe2czeyaZde97kUS01XW+pUzq0n
	7B+KVHuJfmcRfPNt8rXY2mbyHiLovcc10ZzQ
X-Google-Smtp-Source: ABdhPJyJRimBaTtkIRRTonsAE9KTw4TIOQsYtdsyvU33WH7lMXW/5lILkREeGb429BcL6veDXsxwHw==
X-Received: by 2002:a05:6830:1c26:: with SMTP id f6mr8001836ote.53.1615661422414;
        Sat, 13 Mar 2021 10:50:22 -0800 (PST)
Return-Path: <steve@sakoman.com>
Received: from localhost.localdomain ([72.173.249.164])
        by smtp.gmail.com with ESMTPSA id d1sm3765385oth.13.2021.03.13.10.50.19
        for <openembedded-core@lists.openembedded.org>
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 13 Mar 2021 10:50:22 -0800 (PST)
From: "Steve Sakoman" <steve@sakoman.com>
To: openembedded-core@lists.openembedded.org
Subject: [OE-core][dunfell 06/38] linux-yocto/5.4: update to v5.4.101
Date: Sat, 13 Mar 2021 08:48:55 -1000
Message-Id: <b6bb4c9dfd1455b069eb144b1ed58db5bb654f24.1615661221.git.steve@sakoman.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <cover.1615661221.git.steve@sakoman.com>
References: <cover.1615661221.git.steve@sakoman.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

From: Bruce Ashfield <bruce.ashfield@gmail.com>

Updating linux-yocto/5.4 to the latest korg -stable release that comprises
the following commits:

    ef1fcccf6e5f Linux 5.4.101
    fe257f47e2c3 scripts/recordmcount.pl: support big endian for ARCH sh
    a2c5e4a083a7 cifs: Set CIFS_MOUNT_USE_PREFIX_PATH flag on setting cifs_sb->prepath.
    e6f7bf29e32d cxgb4: Add new T6 PCI device id 0x6092
    aaf830ad624a NET: usb: qmi_wwan: Adding support for Cinterion MV31
    5f2093be3627 KVM: Use kvm_pfn_t for local PFN variable in hva_to_pfn_remapped()
    3f9fbe703164 mm: provide a saner PTE walking API for modules
    32f070ad274d KVM: do not assume PTE is writable after follow_pfn
    78c7b242573a mm: simplify follow_pte{,pmd}
    8aeef9c9ac7e mm: unexport follow_pte_pmd
    8f869895cf9d scripts: set proper OpenSSL include dir also for sign-file
    c7ed0a50f20a scripts: use pkg-config to locate libcrypto
    c8e3bcc6db7c arm64: tegra: Add power-domain for Tegra210 HDA
    74c8a6af692a ntfs: check for valid standard information attribute
    54a3c25368d9 usb: quirks: add quirk to start video capture on ELMO L-12F document camera reliable
    96ef50ec7266 USB: quirks: sort quirk entries
    fce3654c648d HID: make arrays usage and value to be the same
    185c2266c1df bpf: Fix truncation handling for mod32 dst reg wrt zero
    fc944ddc0b4a Linux 5.4.100
    38d777aaf2c3 btrfs: fix backport of 2175bf57dc952 in 5.4.95
    c6dd8545fe38 media: pwc: Use correct device for DMA
    524a77aa5d69 xen-blkback: fix error handling in xen_blkbk_map()
    be05138a9cdd xen-scsiback: don't "handle" error by BUG()
    52e8f43af540 xen-netback: don't "handle" error by BUG()
    7109f61d25ff xen-blkback: don't "handle" error by BUG()
    55ccf71c0985 xen/arm: don't ignore return errors from set_phys_to_machine
    feda880969a5 Xen/gntdev: correct error checking in gntdev_map_grant_pages()
    0e382682dda4 Xen/gntdev: correct dev_bus_addr handling in gntdev_map_grant_pages()
    da92e41f010e Xen/x86: also check kernel mapping in set_foreign_p2m_mapping()
    104eef952314 Xen/x86: don't bail early from clear_foreign_p2m_mapping()
    49de0a17e68f net: bridge: Fix a warning when del bridge sysfs
    c35ce3d38caa net: qrtr: Fix port ID for control messages
    f49731dfdb20 KVM: SEV: fix double locking due to incorrect backport

Signed-off-by: Bruce Ashfield <bruce.ashfield@gmail.com>
Signed-off-by: Richard Purdie <richard.purdie@linuxfoundation.org>
(cherry picked from commit e813c8d776679fc602b06959dd7e280959ffd1ee)
Signed-off-by: Steve Sakoman <steve@sakoman.com>
---
 .../linux/linux-yocto-rt_5.4.bb               |  6 ++---
 .../linux/linux-yocto-tiny_5.4.bb             |  8 +++----
 meta/recipes-kernel/linux/linux-yocto_5.4.bb  | 22 +++++++++----------
 3 files changed, 18 insertions(+), 18 deletions(-)

diff --git a/meta/recipes-kernel/linux/linux-yocto-rt_5.4.bb b/meta/recipes-kernel/linux/linux-yocto-rt_5.4.bb
index 1ec4d995c4..e8ddcaf2df 100644
--- a/meta/recipes-kernel/linux/linux-yocto-rt_5.4.bb
+++ b/meta/recipes-kernel/linux/linux-yocto-rt_5.4.bb
@@ -11,13 +11,13 @@ python () {
         raise bb.parse.SkipRecipe("Set PREFERRED_PROVIDER_virtual/kernel to linux-yocto-rt to enable it")
 }
 
-SRCREV_machine ?= "b2502919947df2b3d135c92e1749e13844312102"
-SRCREV_meta ?= "c69f1109d70d869c0b0560771f825b97fac5a7e0"
+SRCREV_machine ?= "207cc4c23780d4dd0b40960b1364c75a54437102"
+SRCREV_meta ?= "b11f59557b924d5d1db8c088848d40ef1a0b7da6"
 
 SRC_URI = "git://git.yoctoproject.org/linux-yocto.git;branch=${KBRANCH};name=machine \
            git://git.yoctoproject.org/yocto-kernel-cache;type=kmeta;name=meta;branch=yocto-5.4;destsuffix=${KMETA}"
 
-LINUX_VERSION ?= "5.4.99"
+LINUX_VERSION ?= "5.4.101"
 
 LIC_FILES_CHKSUM = "file://COPYING;md5=bbea815ee2795b2f4230826c0c6b8814"
 
diff --git a/meta/recipes-kernel/linux/linux-yocto-tiny_5.4.bb b/meta/recipes-kernel/linux/linux-yocto-tiny_5.4.bb
index a7dc3a3cbf..ac9517b894 100644
--- a/meta/recipes-kernel/linux/linux-yocto-tiny_5.4.bb
+++ b/meta/recipes-kernel/linux/linux-yocto-tiny_5.4.bb
@@ -6,7 +6,7 @@ KCONFIG_MODE = "--allnoconfig"
 
 require recipes-kernel/linux/linux-yocto.inc
 
-LINUX_VERSION ?= "5.4.99"
+LINUX_VERSION ?= "5.4.101"
 LIC_FILES_CHKSUM = "file://COPYING;md5=bbea815ee2795b2f4230826c0c6b8814"
 
 DEPENDS += "${@bb.utils.contains('ARCH', 'x86', 'elfutils-native', '', d)}"
@@ -15,9 +15,9 @@ DEPENDS += "openssl-native util-linux-native"
 KMETA = "kernel-meta"
 KCONF_BSP_AUDIT_LEVEL = "2"
 
-SRCREV_machine_qemuarm ?= "7d5c1d38ab787f5aefc81fc5dec49e620a26a749"
-SRCREV_machine ?= "517defa4ffb28867801c15f773fd3742fb22c4f5"
-SRCREV_meta ?= "c69f1109d70d869c0b0560771f825b97fac5a7e0"
+SRCREV_machine_qemuarm ?= "ca4fa7f9d562a9be1ca7d9d47fa7c2b70d9bb249"
+SRCREV_machine ?= "3a8744ea60ad663c53c582d519a636658e405994"
+SRCREV_meta ?= "b11f59557b924d5d1db8c088848d40ef1a0b7da6"
 
 PV = "${LINUX_VERSION}+git${SRCPV}"
 
diff --git a/meta/recipes-kernel/linux/linux-yocto_5.4.bb b/meta/recipes-kernel/linux/linux-yocto_5.4.bb
index e3a318f8c7..0cc6f8f212 100644
--- a/meta/recipes-kernel/linux/linux-yocto_5.4.bb
+++ b/meta/recipes-kernel/linux/linux-yocto_5.4.bb
@@ -12,16 +12,16 @@ KBRANCH_qemux86  ?= "v5.4/standard/base"
 KBRANCH_qemux86-64 ?= "v5.4/standard/base"
 KBRANCH_qemumips64 ?= "v5.4/standard/mti-malta64"
 
-SRCREV_machine_qemuarm ?= "a8aad3b73d3a70d40114968a35740605310c5242"
-SRCREV_machine_qemuarm64 ?= "517defa4ffb28867801c15f773fd3742fb22c4f5"
-SRCREV_machine_qemumips ?= "ab621e6177fe53efa5b5ec06dc68c1253ba1aa13"
-SRCREV_machine_qemuppc ?= "517defa4ffb28867801c15f773fd3742fb22c4f5"
-SRCREV_machine_qemuriscv64 ?= "517defa4ffb28867801c15f773fd3742fb22c4f5"
-SRCREV_machine_qemux86 ?= "517defa4ffb28867801c15f773fd3742fb22c4f5"
-SRCREV_machine_qemux86-64 ?= "517defa4ffb28867801c15f773fd3742fb22c4f5"
-SRCREV_machine_qemumips64 ?= "401e403397ee46c782ba1246ea04eb02fc20d0be"
-SRCREV_machine ?= "517defa4ffb28867801c15f773fd3742fb22c4f5"
-SRCREV_meta ?= "c69f1109d70d869c0b0560771f825b97fac5a7e0"
+SRCREV_machine_qemuarm ?= "fe56acd0cb4769b18e8dd778f74f8c64c8622f0c"
+SRCREV_machine_qemuarm64 ?= "3a8744ea60ad663c53c582d519a636658e405994"
+SRCREV_machine_qemumips ?= "4ddbef4e60bc7e13f2a33f57c3c6dc6ca71e0d81"
+SRCREV_machine_qemuppc ?= "3a8744ea60ad663c53c582d519a636658e405994"
+SRCREV_machine_qemuriscv64 ?= "3a8744ea60ad663c53c582d519a636658e405994"
+SRCREV_machine_qemux86 ?= "3a8744ea60ad663c53c582d519a636658e405994"
+SRCREV_machine_qemux86-64 ?= "3a8744ea60ad663c53c582d519a636658e405994"
+SRCREV_machine_qemumips64 ?= "44f1e579ba921196f7c3b36e47473b907e09870e"
+SRCREV_machine ?= "3a8744ea60ad663c53c582d519a636658e405994"
+SRCREV_meta ?= "b11f59557b924d5d1db8c088848d40ef1a0b7da6"
 
 # remap qemuarm to qemuarma15 for the 5.4 kernel
 # KMACHINE_qemuarm ?= "qemuarma15"
@@ -30,7 +30,7 @@ SRC_URI = "git://git.yoctoproject.org/linux-yocto.git;name=machine;branch=${KBRA
            git://git.yoctoproject.org/yocto-kernel-cache;type=kmeta;name=meta;branch=yocto-5.4;destsuffix=${KMETA}"
 
 LIC_FILES_CHKSUM = "file://COPYING;md5=bbea815ee2795b2f4230826c0c6b8814"
-LINUX_VERSION ?= "5.4.99"
+LINUX_VERSION ?= "5.4.101"
 
 DEPENDS += "${@bb.utils.contains('ARCH', 'x86', 'elfutils-native', '', d)}"
 DEPENDS += "openssl-native util-linux-native"
-- 
2.25.1

