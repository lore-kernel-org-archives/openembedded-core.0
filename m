Received: from mail-oi1-f172.google.com (mail-oi1-f172.google.com [209.85.167.172])
 by mx.groups.io with SMTP id smtpd.web12.542.1625524570583774157
 for <openembedded-core@lists.openembedded.org>;
 Mon, 05 Jul 2021 15:36:10 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@sakoman-com.20150623.gappssmtp.com header.s=20150623 header.b=YDW8n6rt;
 spf=softfail (domain: sakoman.com, ip: 209.85.167.172, mailfrom: steve@sakoman.com)
Received: by mail-oi1-f172.google.com with SMTP id 10so7595986oiq.9
        for <openembedded-core@lists.openembedded.org>; Mon, 05 Jul 2021 15:36:10 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=sakoman-com.20150623.gappssmtp.com; s=20150623;
        h=from:to:subject:date:message-id:in-reply-to:references:mime-version
         :content-transfer-encoding;
        bh=OZLV0jOdSxeRbzQ5+46ogFFd8/xAHycgUMK11W92GJQ=;
        b=YDW8n6rt1B9t+kp5lWPD73Mv/89NeMZ7VzaGNYwy/tHYCwytfjIBmBhwWlG3dOLQ3u
         0Ue0NiSUugIx4zezNwQNIdIYYZc/fbUgC5HHC+b6SvztOhnYG89JLVwC0CjwLzazUVUB
         Rt59gCwv+gvHCiXqOcMVCd4YEGupBK7x3aUnA/uWpDC7m0xtc6vWV39BktsKc0zxQNjA
         PPcHInwIporrK8qVlRSJ5Vmg4kPwb6oUZse9AKoV/r3XMi8xMoIMNAdWt0EBceTEiduM
         qkQISpuy2SITJekQWhSz5AsxsfA5BMflrjmWmsx4LmGmmht1v0VpFeMzS5nIVdPfvg42
         Z97w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=OZLV0jOdSxeRbzQ5+46ogFFd8/xAHycgUMK11W92GJQ=;
        b=JcJUK08v0klyzp9Nx8EHHULj5+JIWSkEhzZMHEXWEC3epPliPs2ss9c3XaZMv9q58a
         OfqqVwJXnnz2CBXeSs8otjYfr2ioFSa7YPzSVH9btIFB7DnX/Vlxj/61HcIsZet+cZFh
         hR1dXNJ84iGlf91HC3SLg0TyK0fIYGJQ47hkaqtHqtRCD/B+qeGNY92EskxL2vZV6sT4
         Xb7bY2cVbMnzcqRqT/G+3M871Lchuv474aAzPR1IrxQS4u2Q5ygWnGI76WDxq1ConOH2
         thYX5jzIyizoKJH7H6/0QY0+xy+9snG6jpYNh0kfeQt5EGnfqyVOTdwslT8TTHSYxkzD
         9zjw==
X-Gm-Message-State: AOAM5332h337kvZSwg0+pUedXqEmaBURsSPlPEaFixXBXqELKlHtS11w
	cbU8VATVxeGwm+8BwdRefO3tF5uL0Vau8HpD
X-Google-Smtp-Source: ABdhPJx2dpEJOSa8FEH7RqG6OHSOZ4E1IXnP0UHnL/heanyldUQsBe9myx0QDaiGLqiBSxSPbrlfFA==
X-Received: by 2002:aca:ea82:: with SMTP id i124mr1078638oih.52.1625524569505;
        Mon, 05 Jul 2021 15:36:09 -0700 (PDT)
Return-Path: <steve@sakoman.com>
Received: from hexa.router0800d9.com ([172.243.4.16])
        by smtp.gmail.com with ESMTPSA id i16sm2870178otp.7.2021.07.05.15.36.05
        for <openembedded-core@lists.openembedded.org>
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 05 Jul 2021 15:36:09 -0700 (PDT)
From: "Steve Sakoman" <steve@sakoman.com>
To: openembedded-core@lists.openembedded.org
Subject: [OE-core][dunfell 08/19] linux-yocto/5.4: update to v5.4.129
Date: Mon,  5 Jul 2021 12:34:45 -1000
Message-Id: <bcbeef7c6fc55e60d4bb5351e25046705b3b68ea.1625511812.git.steve@sakoman.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <cover.1625511812.git.steve@sakoman.com>
References: <cover.1625511812.git.steve@sakoman.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

From: Bruce Ashfield <bruce.ashfield@gmail.com>

Updating linux-yocto/5.4 to the latest korg -stable release that comprises
the following commits:

    82ffbc138a1f Linux 5.4.129
    9011aaab90b8 certs: Move load_system_certificate_list to a common function
    e20b90e4f81b certs: Add EFI_CERT_X509_GUID support for dbx entries
    06ab9df09eb3 x86/efi: move common keyring handler functions to new file
    ac7d3f554472 certs: Add wrapper function to check blacklisted binary hash
    61168eafe024 mm, futex: fix shared futex pgoff on shmem huge page
    a33b70d62552 mm/thp: another PVMW_SYNC fix in page_vma_mapped_walk()
    e045e9e79d2a mm/thp: fix page_vma_mapped_walk() if THP mapped by ptes
    037a1d67d236 mm: page_vma_mapped_walk(): get vma_address_end() earlier
    fa89d536948a mm: page_vma_mapped_walk(): use goto instead of while (1)
    a499febd9935 mm: page_vma_mapped_walk(): add a level of indentation
    b1783bf8c8e4 mm: page_vma_mapped_walk(): crossing page table boundary
    80b2270a14b8 mm: page_vma_mapped_walk(): prettify PVMW_MIGRATION block
    ef161ccaca70 mm: page_vma_mapped_walk(): use pmde for *pvmw->pmd
    4961160272b7 mm: page_vma_mapped_walk(): settle PageHuge on entry
    52e2b20fb5e4 mm: page_vma_mapped_walk(): use page for pvmw->page
    82ee7326af7a mm: thp: replace DEBUG_VM BUG with VM_WARN when unmap fails for split
    bd4389215227 mm/thp: unmap_mapping_page() to fix THP truncate_cleanup_page()
    b767134ec30a mm/thp: fix page_address_in_vma() on file THP tails
    41432a8a6776 mm/thp: fix vma_address() if virtual address below file offset
    4b0a34e222e5 mm/thp: try_to_unmap() use TTU_SYNC for safe splitting
    bd092a0f1942 mm/thp: make is_huge_zero_pmd() safe and quicker
    4c37d7f269f8 mm/thp: fix __split_huge_pmd_locked() on shmem migration entry
    7ce4b73d349b mm, thp: use head page in __migration_entry_wait()
    68ce37ebe0f2 mm/rmap: use page_not_mapped in try_to_unmap()
    432b61863ac7 mm/rmap: remove unneeded semicolon in page_not_mapped()
    cfe575954ddd mm: add VM_WARN_ON_ONCE_PAGE() macro
    42f11f0fe977 kthread: prevent deadlock when kthread_mod_delayed_work() races with kthread_cancel_delayed_work_sync()
    06ab015d1849 kthread_worker: split code for canceling the delayed work timer
    d77c9c8537db i2c: robotfuzz-osif: fix control-request directions
    bb85717e3797 KVM: do not allow mapping valid but non-reference-counted pages
    d6f751ecccfb nilfs2: fix memory leak in nilfs_sysfs_delete_device_group
    702acfcbfa68 pinctrl: stm32: fix the reported number of GPIO lines per bank
    76c10e10ba7b net: ll_temac: Avoid ndo_start_xmit returning NETDEV_TX_BUSY
    aa00b9780482 net: ll_temac: Add memory-barriers for TX BD access
    d807b93f9bca PCI: Add AMD RS690 quirk to enable 64-bit DMA
    5830f2081d98 recordmcount: Correct st_shndx handling
    70866199220e net: qed: Fix memcpy() overflow of qed_dcbx_params()
    b7168ec176fd KVM: selftests: Fix kvm_check_cap() assertion
    58687d143515 r8169: Avoid memcpy() over-reading of ETH_SS_STATS
    cb4a2e4e224a sh_eth: Avoid memcpy() over-reading of ETH_SS_STATS
    97e0102e1824 r8152: Avoid memcpy() over-reading of ETH_SS_STATS
    f12a5b48bcc8 net/packet: annotate accesses to po->ifindex
    cdcedd3c8683 net/packet: annotate accesses to po->bind
    343406f9c198 net: caif: fix memory leak in ldisc_open
    8707ce86e927 net: phy: dp83867: perform soft reset and retain established link
    9f2d04dfb3c4 inet: annotate date races around sk->sk_txhash
    d40ff07a7b7d ping: Check return value of function 'ping_queue_rcv_skb'
    9df4f031536b net: ethtool: clear heap allocations for ethtool function
    62aed2df294a mac80211: drop multicast fragments
    eb2b1216bc8f net: ipv4: Remove unneed BUG() function
    e0c950d2fddb dmaengine: mediatek: use GFP_NOWAIT instead of GFP_ATOMIC in prep_dma
    f7b1926c7c5d dmaengine: mediatek: do not issue a new desc if one is still current
    3d995587c3ea dmaengine: mediatek: free the proper desc in desc_free handler
    c09af3877b53 dmaengine: rcar-dmac: Fix PM reference leak in rcar_dmac_probe()
    f2c027a7750f cfg80211: call cfg80211_leave_ocb when switching away from OCB
    78bf3c613148 mac80211_hwsim: drop pending frames on stop
    ae9de9444b54 mac80211: remove warning in ieee80211_get_sband()
    0e486713779a dmaengine: zynqmp_dma: Fix PM reference leak in zynqmp_dma_alloc_chan_resourc()
    456367b24190 Revert "PCI: PM: Do not read power state in pci_enable_device_flags()"
    1442186236ad spi: spi-nxp-fspi: move the register operation after the clock enable
    7bc73260c4b1 MIPS: generic: Update node names to avoid unit addresses
    0855fe6d8835 arm64: link with -z norelro for LLD or aarch64-elf
    3173390b8dbc kbuild: add CONFIG_LD_IS_LLD
    3450f5eb8c9e mmc: meson-gx: use memcpy_to/fromio for dram-access-quirk
    48a5449c0be1 ARM: 9081/1: fix gcc-10 thumb2-kernel regression
    4a8e89e0fd0b drm/radeon: wait for moving fence after pinning
    4577708b2a22 drm/nouveau: wait for moving fence after pinning v2
    c77c617e26e2 Revert "drm/amdgpu/gfx10: enlarge CP_MEC_DOORBELL_RANGE_UPPER to cover full doorbell."
    6bd0da6c9b12 Revert "drm/amdgpu/gfx9: fix the doorbell missing when in CGPG issue."
    e2dc07ca4e01 module: limit enabling module.sig_enforce

Signed-off-by: Bruce Ashfield <bruce.ashfield@gmail.com>
Signed-off-by: Alexandre Belloni <alexandre.belloni@bootlin.com>
Signed-off-by: Richard Purdie <richard.purdie@linuxfoundation.org>
(cherry picked from commit d621feee60e71bea68c853626e74669b9d953346)
Signed-off-by: Steve Sakoman <steve@sakoman.com>
---
 .../linux/linux-yocto-rt_5.4.bb               |  6 ++---
 .../linux/linux-yocto-tiny_5.4.bb             |  8 +++----
 meta/recipes-kernel/linux/linux-yocto_5.4.bb  | 22 +++++++++----------
 3 files changed, 18 insertions(+), 18 deletions(-)

diff --git a/meta/recipes-kernel/linux/linux-yocto-rt_5.4.bb b/meta/recipes-kernel/linux/linux-yocto-rt_5.4.bb
index a6232d8894..ba186a1868 100644
--- a/meta/recipes-kernel/linux/linux-yocto-rt_5.4.bb
+++ b/meta/recipes-kernel/linux/linux-yocto-rt_5.4.bb
@@ -11,13 +11,13 @@ python () {
         raise bb.parse.SkipRecipe("Set PREFERRED_PROVIDER_virtual/kernel to linux-yocto-rt to enable it")
 }
 
-SRCREV_machine ?= "f3ac47f313e4ce608b3567c006f61d1d8b820ae2"
-SRCREV_meta ?= "78949176d073f5cf04c9e0c4be699e39528f2880"
+SRCREV_machine ?= "c86c4081f4764f57bbb26df8a9202c01799c3771"
+SRCREV_meta ?= "c5e5dc4e13bd4882a8ed96b8026e6fd268b68f8a"
 
 SRC_URI = "git://git.yoctoproject.org/linux-yocto.git;branch=${KBRANCH};name=machine \
            git://git.yoctoproject.org/yocto-kernel-cache;type=kmeta;name=meta;branch=yocto-5.4;destsuffix=${KMETA}"
 
-LINUX_VERSION ?= "5.4.128"
+LINUX_VERSION ?= "5.4.129"
 
 LIC_FILES_CHKSUM = "file://COPYING;md5=bbea815ee2795b2f4230826c0c6b8814"
 
diff --git a/meta/recipes-kernel/linux/linux-yocto-tiny_5.4.bb b/meta/recipes-kernel/linux/linux-yocto-tiny_5.4.bb
index 2eb5ebdbbd..5d487ac23f 100644
--- a/meta/recipes-kernel/linux/linux-yocto-tiny_5.4.bb
+++ b/meta/recipes-kernel/linux/linux-yocto-tiny_5.4.bb
@@ -6,7 +6,7 @@ KCONFIG_MODE = "--allnoconfig"
 
 require recipes-kernel/linux/linux-yocto.inc
 
-LINUX_VERSION ?= "5.4.128"
+LINUX_VERSION ?= "5.4.129"
 LIC_FILES_CHKSUM = "file://COPYING;md5=bbea815ee2795b2f4230826c0c6b8814"
 
 DEPENDS += "${@bb.utils.contains('ARCH', 'x86', 'elfutils-native', '', d)}"
@@ -15,9 +15,9 @@ DEPENDS += "openssl-native util-linux-native"
 KMETA = "kernel-meta"
 KCONF_BSP_AUDIT_LEVEL = "2"
 
-SRCREV_machine_qemuarm ?= "987d6fd6c916297cde5cc7e988c28ef1e458f1cf"
-SRCREV_machine ?= "befa5fba9b9f972f68acc891f2ca143d6b3e4011"
-SRCREV_meta ?= "78949176d073f5cf04c9e0c4be699e39528f2880"
+SRCREV_machine_qemuarm ?= "ca636d1a2ccbb2626c4eacbdb0da2c30654b108c"
+SRCREV_machine ?= "d46f8ecb3f81bdba8131b90dc90174ecb36a1b78"
+SRCREV_meta ?= "c5e5dc4e13bd4882a8ed96b8026e6fd268b68f8a"
 
 PV = "${LINUX_VERSION}+git${SRCPV}"
 
diff --git a/meta/recipes-kernel/linux/linux-yocto_5.4.bb b/meta/recipes-kernel/linux/linux-yocto_5.4.bb
index a36ddc8d2d..ae09736df0 100644
--- a/meta/recipes-kernel/linux/linux-yocto_5.4.bb
+++ b/meta/recipes-kernel/linux/linux-yocto_5.4.bb
@@ -12,16 +12,16 @@ KBRANCH_qemux86  ?= "v5.4/standard/base"
 KBRANCH_qemux86-64 ?= "v5.4/standard/base"
 KBRANCH_qemumips64 ?= "v5.4/standard/mti-malta64"
 
-SRCREV_machine_qemuarm ?= "69874edb0838e4d26002a8d30e14a5e1b355e397"
-SRCREV_machine_qemuarm64 ?= "befa5fba9b9f972f68acc891f2ca143d6b3e4011"
-SRCREV_machine_qemumips ?= "1bfafb3ce048d4a30aca35e847168855980f5dbc"
-SRCREV_machine_qemuppc ?= "befa5fba9b9f972f68acc891f2ca143d6b3e4011"
-SRCREV_machine_qemuriscv64 ?= "befa5fba9b9f972f68acc891f2ca143d6b3e4011"
-SRCREV_machine_qemux86 ?= "befa5fba9b9f972f68acc891f2ca143d6b3e4011"
-SRCREV_machine_qemux86-64 ?= "befa5fba9b9f972f68acc891f2ca143d6b3e4011"
-SRCREV_machine_qemumips64 ?= "2a0ea1bced3f4b8ebebb19debc19b7930a4924a8"
-SRCREV_machine ?= "befa5fba9b9f972f68acc891f2ca143d6b3e4011"
-SRCREV_meta ?= "78949176d073f5cf04c9e0c4be699e39528f2880"
+SRCREV_machine_qemuarm ?= "dfb964733268c1e6f932900a384a793a0ca8de34"
+SRCREV_machine_qemuarm64 ?= "7d3eac73a6edc8fdcd701bbb0aa8c21030eb2027"
+SRCREV_machine_qemumips ?= "a40b68f2f4be601dfe020940ad29ac894cc31298"
+SRCREV_machine_qemuppc ?= "a3258c8b1690ecfa620eae9552a75cec9224ecd4"
+SRCREV_machine_qemuriscv64 ?= "e211c039dcd85ad2d4c1f1a70909d0eefef49778"
+SRCREV_machine_qemux86 ?= "e211c039dcd85ad2d4c1f1a70909d0eefef49778"
+SRCREV_machine_qemux86-64 ?= "e211c039dcd85ad2d4c1f1a70909d0eefef49778"
+SRCREV_machine_qemumips64 ?= "dded4f6e58cd90c7333b5257c9327e5e30f78e26"
+SRCREV_machine ?= "e211c039dcd85ad2d4c1f1a70909d0eefef49778"
+SRCREV_meta ?= "c5e5dc4e13bd4882a8ed96b8026e6fd268b68f8a"
 
 # remap qemuarm to qemuarma15 for the 5.4 kernel
 # KMACHINE_qemuarm ?= "qemuarma15"
@@ -30,7 +30,7 @@ SRC_URI = "git://git.yoctoproject.org/linux-yocto.git;name=machine;branch=${KBRA
            git://git.yoctoproject.org/yocto-kernel-cache;type=kmeta;name=meta;branch=yocto-5.4;destsuffix=${KMETA}"
 
 LIC_FILES_CHKSUM = "file://COPYING;md5=bbea815ee2795b2f4230826c0c6b8814"
-LINUX_VERSION ?= "5.4.128"
+LINUX_VERSION ?= "5.4.129"
 
 DEPENDS += "${@bb.utils.contains('ARCH', 'x86', 'elfutils-native', '', d)}"
 DEPENDS += "openssl-native util-linux-native"
-- 
2.25.1

