Received: from mail-qv1-f49.google.com (mail-qv1-f49.google.com [209.85.219.49])
 by mx.groups.io with SMTP id smtpd.web10.9508.1631719962794112762
 for <openembedded-core@lists.openembedded.org>;
 Wed, 15 Sep 2021 08:32:43 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20210112 header.b=VV+9fqhc;
 spf=pass (domain: gmail.com, ip: 209.85.219.49, mailfrom: bruce.ashfield@gmail.com)
Received: by mail-qv1-f49.google.com with SMTP id di6so2129097qvb.1
        for <openembedded-core@lists.openembedded.org>; Wed, 15 Sep 2021 08:32:42 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:content-transfer-encoding;
        bh=YUB2eIjgY09U4EDi9J2QlPvpwqLiYtmmXhF4w0P64gA=;
        b=VV+9fqhcNYotdiIkdj3adHAlupAcukjVkw3VMpUh5vhxQkK4m1X7aziWDAH/T7VdIZ
         EICSKjWXgArWuWx+HRW0NVNp/pHYcKrt1XVx4ou7R8cszSJPHs5K0/YEujBmh3Xiuwmi
         Kq7xkizL4OO/rMQZUo4OZA1WlFeRkaR+rElZRkX4VftidYWAtvPyTGcmKylC7KvWLm0k
         GUSWgxfQo6Lj3WLWUv7gvMAozvBph0zfGXBWnfNAAEyLC0kwmFJ0udqC88E6PJn/gq6t
         mYCi9ZDLpqKZ9yMpUuj85b3w0TWmK/v/Zl3MwX1ulhKwcrrg4hGT7ncaahO+ArAK37jp
         4jmw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=YUB2eIjgY09U4EDi9J2QlPvpwqLiYtmmXhF4w0P64gA=;
        b=pdIHkiKWeEW4aR9i1nt5jOwyIFlJ+NOAOS0cwrajO4eNVnDdi2qqqJUlqIgJruuO3j
         87HGfMoYkwmYK5DlZAMS3U8A3Fx74ny+y5cMfMP8LD0RbNEZS3KP2gnP+duwGTzbXQyJ
         /k7S/txMFc0RNlQ3F+QfCF5/8RSQGdeczx2rzUhxkIMyZI62MSNM1haHUxBrgsyKtlpx
         08IxEs6MCoJd0Wz9uweJGdHGOyoQTbd/W712VYfte55sK+h5vJYwfgfXVSFMsflbS7bZ
         Xm2mzpVClW/O4ZVHj58hShMI9b1snjd8xQZpw2e0xQmp3BR0eK9rTXH8t4T0FrvMncAb
         4rGQ==
X-Gm-Message-State: AOAM530yUJ3RMsk2BwQfkN0YYMsHqfyOD3k/CG25aajpOcVwCKS2Ct1L
	lpIbQcm1Ben2RsF4Qgd8j918ulcXzYSlzg==
X-Google-Smtp-Source: ABdhPJwEth9jAOH8y1NSC/w4EHTYueJb8u6oo2Hd/FU8RJ0DOfOp0N+GPvUaro9IGZIu2Md76rEVhQ==
X-Received: by 2002:a05:6214:146d:: with SMTP id c13mr476780qvy.46.1631719961831;
        Wed, 15 Sep 2021 08:32:41 -0700 (PDT)
Return-Path: <bruce.ashfield@gmail.com>
Received: from build.lan (cpe04d4c4975b80-cmf4c11490699b.cpe.net.cable.rogers.com. [174.112.63.222])
        by smtp.gmail.com with ESMTPSA id t194sm228181qka.72.2021.09.15.08.32.41
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 15 Sep 2021 08:32:41 -0700 (PDT)
From: "Bruce Ashfield" <bruce.ashfield@gmail.com>
To: steve@sakoman.com
Cc: openembedded-core@lists.openembedded.org
Subject: [PATCH 2/2] linux-yocto/5.4: update to v5.4.144
Date: Wed, 15 Sep 2021 11:32:38 -0400
Message-Id: <20210915153238.20946-2-bruce.ashfield@gmail.com>
X-Mailer: git-send-email 2.19.1
In-Reply-To: <20210915153238.20946-1-bruce.ashfield@gmail.com>
References: <20210915153238.20946-1-bruce.ashfield@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

From: Bruce Ashfield <bruce.ashfield@gmail.com>

Updating linux-yocto/5.4 to the latest korg -stable release that comprises
the following commits:

    c6bf0ed9d1a7 Linux 5.4.144
    0634c0f91995 audit: move put_tree() to avoid trim_trees refcount underflow and UAF
    cab0003311a0 net: don't unconditionally copy_from_user a struct ifreq for socket ioctls
    6752b3b0628e Revert "parisc: Add assembly implementations for memset, strlen, strcpy, strncpy and strcat"
    67871ada3a53 Revert "floppy: reintroduce O_NDELAY fix"
    d7f7eca72ecc btrfs: fix NULL pointer dereference when deleting device by invalid id
    e644da7ace0f arm64: dts: qcom: msm8994-angler: Fix gpio-reserved-ranges 85-88
    4f76285f6df8 KVM: x86/mmu: Treat NX as used (not reserved) for all !TDP shadow MMUs
    620681d7201a net: dsa: mt7530: fix VLAN traffic leaks again
    38adbf21f37e bpf: Fix cast to pointer from integer of different size warning
    812ee47ad76e bpf: Track contents of read-only maps as scalars
    f4418015201b vt_kdsetmode: extend console locking
    8a19e0045086 btrfs: fix race between marking inode needs to be logged and log syncing
    f3a1ac258ebc net/rds: dma_map_sg is entitled to merge entries
    ad6a2bc7588a drm/nouveau/disp: power down unused DP links during init
    689179c462d8 drm: Copy drm_wait_vblank to user before returning
    18ceb99f8483 qed: Fix null-pointer dereference in qed_rdma_create_qp()
    f1a0db49abd5 qed: qed ll2 race condition fixes
    73ba9e4ece4b vringh: Use wiov->used to check for read/write desc order
    ee52acae6fb5 virtio_pci: Support surprise removal of virtio pci device
    be9b79e84154 virtio: Improve vq->broken access to avoid any compiler optimization
    0d4ba693db48 opp: remove WARN when no valid OPPs remain
    baf56a1d8199 perf/x86/intel/uncore: Fix integer overflow on 23 bit left shift of a u32
    0ad96094ab90 usb: gadget: u_audio: fix race condition on endpoint stop
    c5c2b4ca5035 drm/i915: Fix syncmap memory leak
    2f3cefa6abf0 net: hns3: fix get wrong pfc_en when query PFC configuration
    6f0c0b35e277 net: hns3: fix duplicate node in VLAN list
    951805c23dff net: hns3: clear hardware resource when loading driver
    08162f65642c rtnetlink: Return correct error on changing device netns
    f58e42d1928c net: marvell: fix MVNETA_TX_IN_PRGRS bit number
    45454400a647 xgene-v2: Fix a resource leak in the error handling path of 'xge_probe()'
    53b480e68c1c ip_gre: add validation for csum_start
    bb8ca7e2e67e RDMA/efa: Free IRQ vectors on error flow
    e29565b4515e e1000e: Fix the max snoop/no-snoop latency for 10M
    8a21e84334ec IB/hfi1: Fix possible null-pointer dereference in _extend_sdma_tx_descs()
    944a50f56f1b RDMA/bnxt_re: Add missing spin lock initialization
    28b189541027 scsi: core: Fix hang of freezing queue between blocking and running device
    628c582854d3 usb: dwc3: gadget: Stop EP0 transfers during pullup disable
    d9da281c8f9e usb: dwc3: gadget: Fix dwc3_calc_trbs_left()
    21880abf19ba USB: serial: option: add new VID/PID to support Fibocom FG150
    2e098e91eeec Revert "USB: serial: ch341: fix character loss at high transfer rates"
    16b281a70a10 can: usb: esd_usb2: esd_usb2_rx_event(): fix the interchange of the CAN RX and TX error counters
    765437d1f078 mm, oom: make the calculation of oom badness more accurate
    1cccf5c03077 mmc: sdhci-msm: Update the software timeout value for sdhc
    aec1e470d906 ovl: fix uninitialized pointer read in ovl_lookup_real_one()
    57bd5b59f1ce once: Fix panic when module unload
    5892f910f401 netfilter: conntrack: collect all entries in one cycle
    7c95c89b6929 ARC: Fix CONFIG_STACKDEPOT
    a6b049aeefa8 net: qrtr: fix another OOB Read in qrtr_endpoint_post

Signed-off-by: Bruce Ashfield <bruce.ashfield@gmail.com>
---
 .../linux/linux-yocto-rt_5.4.bb               |  6 ++---
 .../linux/linux-yocto-tiny_5.4.bb             |  8 +++----
 meta/recipes-kernel/linux/linux-yocto_5.4.bb  | 22 +++++++++----------
 3 files changed, 18 insertions(+), 18 deletions(-)

diff --git a/meta/recipes-kernel/linux/linux-yocto-rt_5.4.bb b/meta/recipes-kernel/linux/linux-yocto-rt_5.4.bb
index d4add9b262..b6c84d0f1c 100644
--- a/meta/recipes-kernel/linux/linux-yocto-rt_5.4.bb
+++ b/meta/recipes-kernel/linux/linux-yocto-rt_5.4.bb
@@ -11,13 +11,13 @@ python () {
         raise bb.parse.SkipRecipe("Set PREFERRED_PROVIDER_virtual/kernel to linux-yocto-rt to enable it")
 }
 
-SRCREV_machine ?= "f4f6c136157b70468cf54389034aeaa41bbc5538"
-SRCREV_meta ?= "70b2480497528245c948ec259c734d74ea4fa3f1"
+SRCREV_machine ?= "7f67141bca949eff8953f965c26475286d1a20cf"
+SRCREV_meta ?= "e4ccb53f204f722583178a9249fbf5d745f0d56a"
 
 SRC_URI = "git://git.yoctoproject.org/linux-yocto.git;branch=${KBRANCH};name=machine \
            git://git.yoctoproject.org/yocto-kernel-cache;type=kmeta;name=meta;branch=yocto-5.4;destsuffix=${KMETA}"
 
-LINUX_VERSION ?= "5.4.143"
+LINUX_VERSION ?= "5.4.144"
 
 LIC_FILES_CHKSUM = "file://COPYING;md5=bbea815ee2795b2f4230826c0c6b8814"
 
diff --git a/meta/recipes-kernel/linux/linux-yocto-tiny_5.4.bb b/meta/recipes-kernel/linux/linux-yocto-tiny_5.4.bb
index a2f212e2ef..5ee1d359b2 100644
--- a/meta/recipes-kernel/linux/linux-yocto-tiny_5.4.bb
+++ b/meta/recipes-kernel/linux/linux-yocto-tiny_5.4.bb
@@ -6,7 +6,7 @@ KCONFIG_MODE = "--allnoconfig"
 
 require recipes-kernel/linux/linux-yocto.inc
 
-LINUX_VERSION ?= "5.4.143"
+LINUX_VERSION ?= "5.4.144"
 LIC_FILES_CHKSUM = "file://COPYING;md5=bbea815ee2795b2f4230826c0c6b8814"
 
 DEPENDS += "${@bb.utils.contains('ARCH', 'x86', 'elfutils-native', '', d)}"
@@ -15,9 +15,9 @@ DEPENDS += "openssl-native util-linux-native"
 KMETA = "kernel-meta"
 KCONF_BSP_AUDIT_LEVEL = "2"
 
-SRCREV_machine_qemuarm ?= "83b75c59c277ba3f87759cf558f9f230c1ed3bf7"
-SRCREV_machine ?= "1f981e60c9f6162337d2a65c891f2e29d8e1c862"
-SRCREV_meta ?= "70b2480497528245c948ec259c734d74ea4fa3f1"
+SRCREV_machine_qemuarm ?= "08336ce8b4ebc2b21c28488c85098c6816f3d99f"
+SRCREV_machine ?= "8220749d3e8643091b118d93a857333e2c91a1eb"
+SRCREV_meta ?= "e4ccb53f204f722583178a9249fbf5d745f0d56a"
 
 PV = "${LINUX_VERSION}+git${SRCPV}"
 
diff --git a/meta/recipes-kernel/linux/linux-yocto_5.4.bb b/meta/recipes-kernel/linux/linux-yocto_5.4.bb
index 93cf312954..ac0a72605d 100644
--- a/meta/recipes-kernel/linux/linux-yocto_5.4.bb
+++ b/meta/recipes-kernel/linux/linux-yocto_5.4.bb
@@ -12,16 +12,16 @@ KBRANCH_qemux86  ?= "v5.4/standard/base"
 KBRANCH_qemux86-64 ?= "v5.4/standard/base"
 KBRANCH_qemumips64 ?= "v5.4/standard/mti-malta64"
 
-SRCREV_machine_qemuarm ?= "a5fb40d66dcf9b95e82a06724fe8b33a03295af4"
-SRCREV_machine_qemuarm64 ?= "bffde671f5262afb5139ef58b10be043de1d368a"
-SRCREV_machine_qemumips ?= "ac8adae0a4a582e9593b527a14f3a7e407a22e6e"
-SRCREV_machine_qemuppc ?= "022718ee2b3805d465613f05813fd6313cbb988f"
-SRCREV_machine_qemuriscv64 ?= "484eb3a36ef32d910da9a38a3f67ff2b2d1f7aa2"
-SRCREV_machine_qemux86 ?= "484eb3a36ef32d910da9a38a3f67ff2b2d1f7aa2"
-SRCREV_machine_qemux86-64 ?= "484eb3a36ef32d910da9a38a3f67ff2b2d1f7aa2"
-SRCREV_machine_qemumips64 ?= "46871b96c7f3f1658f4b9875d6645ff7996e98f1"
-SRCREV_machine ?= "484eb3a36ef32d910da9a38a3f67ff2b2d1f7aa2"
-SRCREV_meta ?= "70b2480497528245c948ec259c734d74ea4fa3f1"
+SRCREV_machine_qemuarm ?= "78a2f9d323a755a34cdc96af4bcf61ffd32a3db0"
+SRCREV_machine_qemuarm64 ?= "aa6ec6934e35c8b0948f6b7c9bdbdef45d72be35"
+SRCREV_machine_qemumips ?= "a892524441b30e5e8c491e22e36e3473fc6a0fe0"
+SRCREV_machine_qemuppc ?= "784ca7c7837811123b5bd97cde964e45fbf5179b"
+SRCREV_machine_qemuriscv64 ?= "e3134debcf01f0aa20103e22fe2ef5fc7c201120"
+SRCREV_machine_qemux86 ?= "e3134debcf01f0aa20103e22fe2ef5fc7c201120"
+SRCREV_machine_qemux86-64 ?= "e3134debcf01f0aa20103e22fe2ef5fc7c201120"
+SRCREV_machine_qemumips64 ?= "d765ea7455bf978a9a86e8e90e032336b0baf887"
+SRCREV_machine ?= "e3134debcf01f0aa20103e22fe2ef5fc7c201120"
+SRCREV_meta ?= "e4ccb53f204f722583178a9249fbf5d745f0d56a"
 
 # remap qemuarm to qemuarma15 for the 5.4 kernel
 # KMACHINE_qemuarm ?= "qemuarma15"
@@ -30,7 +30,7 @@ SRC_URI = "git://git.yoctoproject.org/linux-yocto.git;name=machine;branch=${KBRA
            git://git.yoctoproject.org/yocto-kernel-cache;type=kmeta;name=meta;branch=yocto-5.4;destsuffix=${KMETA}"
 
 LIC_FILES_CHKSUM = "file://COPYING;md5=bbea815ee2795b2f4230826c0c6b8814"
-LINUX_VERSION ?= "5.4.143"
+LINUX_VERSION ?= "5.4.144"
 
 DEPENDS += "${@bb.utils.contains('ARCH', 'x86', 'elfutils-native', '', d)}"
 DEPENDS += "openssl-native util-linux-native"
-- 
2.19.1

