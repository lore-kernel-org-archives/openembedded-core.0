Return-Path: <bruce.ashfield@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 8B3D8C41513
	for <webhook@archiver.kernel.org>; Tue,  8 Aug 2023 03:59:57 +0000 (UTC)
Received: from mail-qk1-f179.google.com (mail-qk1-f179.google.com [209.85.222.179])
 by mx.groups.io with SMTP id smtpd.web10.54426.1691467193408109064
 for <openembedded-core@lists.openembedded.org>;
 Mon, 07 Aug 2023 20:59:53 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20221208 header.b=k/cb8PJt;
 spf=pass (domain: gmail.com, ip: 209.85.222.179, mailfrom: bruce.ashfield@gmail.com)
Received: by mail-qk1-f179.google.com with SMTP id af79cd13be357-76cc4d495deso238057585a.0
        for <openembedded-core@lists.openembedded.org>; Mon, 07 Aug 2023 20:59:53 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20221208; t=1691467192; x=1692071992;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=92rzLta2pc9QI0I1RtbreJSLX0D1tkswnpPPlfMi00Q=;
        b=k/cb8PJtuqF2vX51AA834PBr0scFNtT5gqO23weBSMipRyYP33IKET/5cGX56gO07S
         Eow5HlpJrtrlv87ODsyUYIw07jUY05/xNo2PNkh46L9vyLDrNfZJyc9uMx/BabQTp6bc
         HwGL1I5Xveoeg/Z/B99hrXUHD7s1+CE4V68DzShOVrzmmvnME/nRdFeYnlR6DjSzQvVe
         YwSt912NVMED4VCMVJ1Th5HJ/jZTFfA5PChCXJNcApjrjnKVfy2ORL8wq7c1TCbOJWT6
         +HOfuiUs5VujwfkKh4ytbwaii38pdB7A6e2TMYndFv2DBHnY/JczS8LRtCSIEr96zrF9
         0QEQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1691467192; x=1692071992;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=92rzLta2pc9QI0I1RtbreJSLX0D1tkswnpPPlfMi00Q=;
        b=fK3s21mBRVij6KZYLGfS7fQm8B1zsRJkwRos5dDvs3gEaVFPfk14gShPVoBeKBYRp6
         wvAD6FwdPhKElhoZwsAmCkSb5dWmYbZ4sm5oEergr7Lulo9E/XLoMuheyX0e7bj3eDAO
         uzbIiMtr1zc7f/LBIz/Nh35xMh1KQnti0xfzz9GfeG/ZuS9FRJfMYHzw0raAbMYjF1ME
         m8EHvjZUqoyYiONzuO1r7NWmYzm0z6Tw8J12SftgAbjtD3swGuqrKAHNqw55yKFHi99R
         dY8lXEptOfzDheI+6dv+9V20WnNuxU3VzLd95pxGraWwrykEa6Bco6/xhQDyrtHdZx1r
         5tXQ==
X-Gm-Message-State: AOJu0YzLjADSFP8aitWAWxiMtUOPEzYtcOK4lM8TktjLVAXZv0wLIW0/
	TlHhCLBVekSDgMgPyKpBVsbioKMXnIg+Xw==
X-Google-Smtp-Source: AGHT+IHlD0v2jpuJP27QyQKcxvQ9/vP9s8t6HmDAwbgGYkUC8ubWqWm3EYKszqQXMzoJ1rcXX90JFw==
X-Received: by 2002:a05:620a:1990:b0:76c:b7f0:2bc9 with SMTP id bm16-20020a05620a199000b0076cb7f02bc9mr9477212qkb.16.1691467192339;
        Mon, 07 Aug 2023 20:59:52 -0700 (PDT)
Received: from build.lan ([174.112.183.231])
        by smtp.gmail.com with ESMTPSA id s3-20020a05620a030300b0076c9cc1e107sm3013729qkm.54.2023.08.07.20.59.51
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 07 Aug 2023 20:59:52 -0700 (PDT)
From: bruce.ashfield@gmail.com
To: steve@sakoman.com
Cc: openembedded-core@lists.openembedded.org
Subject: [OE-core][mickledore 2/3] linux-yocto/5.15: update to v5.15.123
Date: Mon,  7 Aug 2023 23:59:49 -0400
Message-Id: <20230808035950.3231155-2-bruce.ashfield@gmail.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20230808035950.3231155-1-bruce.ashfield@gmail.com>
References: <20230808035950.3231155-1-bruce.ashfield@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Tue, 08 Aug 2023 03:59:57 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/185642

From: Bruce Ashfield <bruce.ashfield@gmail.com>

Updating  to the latest korg -stable release that comprises
the following commits:

    09996673e313 Linux 5.15.123
    e6c2f1ce413c Revert "drm/amd/display: edp do not add non-edid timings"
    68eafe294786 nixge: fix mac address error handling again
    22f4093a4213 tracing/histograms: Return an error if we fail to add histogram to hist_vars list
    78471c3ad36f jbd2: recheck chechpointing non-dirty buffer
    0ae6b6d21701 net: phy: prevent stale pointer dereference in phy_init()
    b7168d2906fd tcp: annotate data-races around fastopenq.max_qlen
    accb138c10ff tcp: annotate data-races around icsk->icsk_user_timeout
    6b88371f000f tcp: annotate data-races around tp->notsent_lowat
    4f0a31f73258 tcp: annotate data-races around rskq_defer_accept
    ff0fedfc7540 tcp: annotate data-races around tp->linger2
    e187d88f3ba3 tcp: annotate data-races around icsk->icsk_syn_retries
    d5617eeb546e tcp: annotate data-races around tp->keepalive_probes
    9b2296a2ad23 tcp: annotate data-races around tp->keepalive_intvl
    f70ebecdf3c2 tcp: annotate data-races around tp->keepalive_time
    0bcee9325268 tcp: annotate data-races around tp->tcp_tx_delay
    10013f764ad2 netfilter: nf_tables: skip bound chain on rule flush
    dbe1a82d46ed netfilter: nf_tables: skip bound chain in netns release path
    706ce3c81b5c netfilter: nft_set_pipapo: fix improper element removal
    62615b895ab4 netfilter: nf_tables: fix spurious set element insertion failure
    c17b4ec9cc38 llc: Don't drop packet from non-root netns.
    2400ae8fd86d fbdev: au1200fb: Fix missing IRQ check in au1200fb_drv_probe
    40276640bed8 Revert "tcp: avoid the lookup process failing to get sk in ehash table"
    b04ab5243e84 net:ipv6: check return value of pskb_trim()
    b87a7e3a330c net: ipv4: Use kfree_sensitive instead of kfree
    5dd4d1ff8ba1 tcp: annotate data-races around tcp_rsk(req)->ts_recent
    fa941f53a2c2 igc: Prevent garbled TX queue with XDP ZEROCOPY
    e35dc107a172 bpf: Fix subprog idx logic in check_max_stack_depth
    4e87eb224896 octeontx2-pf: Dont allocate BPIDs for LBK interfaces
    87fc9616d606 security: keys: Modify mismatched function name
    0fb37ce6c01e iavf: Fix out-of-bounds when setting channels on remove
    345c44e18cc1 iavf: Fix use-after-free in free_netdev
    52ed16146349 net: sched: cls_bpf: Undo tcf_bind_filter in case of an error
    5ed16ecae5bf net: ethernet: mtk_eth_soc: handle probe deferral
    39479093a472 ethernet: use of_get_ethdev_address()
    cb1e666ec077 of: net: add a helper for loading netdev->dev_addr
    43da399e509e ethernet: use eth_hw_addr_set() instead of ether_addr_copy()
    3fb402bd20e2 bridge: Add extack warning when enabling STP in netns.
    ec4ac15eced0 net: ethernet: ti: cpsw_ale: Fix cpsw_ale_get_field()/cpsw_ale_set_field()
    6a5d6096ae5c pinctrl: amd: Use amd_pinconf_set() for all config options
    4727cece2994 perf build: Fix library not found error when using CSLIBS
    29fb046ec031 fbdev: imxfb: warn about invalid left/right margin
    5d191467534b spi: bcm63xx: fix max prepend length
    2febd5f81e4b FS: JFS: Check for read-only mounted filesystem in txBegin
    3e94d0d378d2 FS: JFS: Fix null-ptr-deref Read in txBegin
    13ae3f2fd2be MIPS: dec: prom: Address -Warray-bounds warning
    39f6292d7595 fs: jfs: Fix UBSAN: array-index-out-of-bounds in dbAllocDmapLev
    985f96666989 udf: Fix uninitialized array access for some pathnames
    579d814de87c quota: fix warning in dqgrab()
    32c2f51fffec quota: Properly disable quotas when add_dquot_ref() fails
    d363075066cc ALSA: emu10k1: roll up loops in DSP setup code for Audigy
    c0d7dbc6b7a6 drm/radeon: Fix integer overflow in radeon_cs_parser_init
    bca9fb7a5a86 ext4: correct inline offset when handling xattrs in inode body
    87336783d054 ASoC: codecs: wcd938x: fix soundwire initialisation race
    a14527c394d0 ASoC: codecs: wcd938x: fix codec initialisation race
    4ca000456ea6 ASoC: codecs: wcd934x: fix resource leaks on component remove
    5a34d252052b ASoC: codecs: wcd938x: fix missing mbhc init error handling
    aa44782a0293 ASoC: codecs: wcd938x: fix resource leaks on component remove
    90ab6446eb52 ASoC: codecs: wcd-mbhc-v2: fix resource leaks on component remove
    a05a277a8d23 ASoC: codecs: wcd938x: fix missing clsh ctrl error handling
    574ffa6fdf30 ASoC: fsl_sai: Disable bit clock with transmitter
    925bbcdbc4d0 drm/amd/display: Keep PHY active for DP displays on DCN31
    742340371b01 drm/amd/display: Disable MPC split by default on special asic
    1369d0c586ad drm/client: Fix memory leak in drm_client_modeset_probe
    a85e23a1ef63 drm/client: Fix memory leak in drm_client_target_cloned
    82690148ff19 selftests: tc: add ConnTrack procfs kconfig
    3c3941bb1eb5 can: bcm: Fix UAF in bcm_proc_show()
    148453787636 regmap: Account for register length in SMBus I/O limits
    6ce258d0c622 regmap: Drop initial version of maximum transfer length fixes
    d3ee089a16a3 selftests: tc: add 'ct' action kconfig dep
    4a888b22cc07 selftests: tc: set timeout to 15 minutes
    62ee5840326b fuse: ioctl: translate ENOSYS in outarg
    ab80a901f8da btrfs: zoned: fix memory leak after finding block group with super blocks
    6ba7ac692a25 fuse: revalidate: don't invalidate if interrupted
    c9060caab413 btrfs: fix warning when putting transaction with qgroups enabled after abort
    232a104e38fe perf probe: Add test for regression introduced by switch to die_get_decl_file()
    9aecfebea24f keys: Fix linking a duplicate key to a keyring's assoc_array
    0b24b5e187bd ALSA: hda/realtek: Enable Mute LED on HP Laptop 15s-eq2xxx
    2d04042a9fce ALSA: hda/realtek: Add quirk for Clevo NS70AU
    a5de09b7f9fe ALSA: hda/realtek - remove 3k pull low procedure

Signed-off-by: Bruce Ashfield <bruce.ashfield@gmail.com>
---
 .../linux/linux-yocto-rt_5.15.bb              |  6 ++---
 .../linux/linux-yocto-tiny_5.15.bb            |  6 ++---
 meta/recipes-kernel/linux/linux-yocto_5.15.bb | 26 +++++++++----------
 3 files changed, 19 insertions(+), 19 deletions(-)

diff --git a/meta/recipes-kernel/linux/linux-yocto-rt_5.15.bb b/meta/recipes-kernel/linux/linux-yocto-rt_5.15.bb
index bc0ced06c5..572f8a17bc 100644
--- a/meta/recipes-kernel/linux/linux-yocto-rt_5.15.bb
+++ b/meta/recipes-kernel/linux/linux-yocto-rt_5.15.bb
@@ -11,13 +11,13 @@ python () {
         raise bb.parse.SkipRecipe("Set PREFERRED_PROVIDER_virtual/kernel to linux-yocto-rt to enable it")
 }
 
-SRCREV_machine ?= "116b31284aee597f71b1e608b4c0fd33fae483a8"
-SRCREV_meta ?= "ad208ba7d8166bc7cfd260650d481ba8e95dc1b9"
+SRCREV_machine ?= "59fd8ada21b5e298f66a7b22b8e90a16f5a30142"
+SRCREV_meta ?= "cae7ce34613cda607d089452f19e8b20143afcf6"
 
 SRC_URI = "git://git.yoctoproject.org/linux-yocto.git;branch=${KBRANCH};name=machine;protocol=https \
            git://git.yoctoproject.org/yocto-kernel-cache;type=kmeta;name=meta;branch=yocto-5.15;destsuffix=${KMETA};protocol=https"
 
-LINUX_VERSION ?= "5.15.122"
+LINUX_VERSION ?= "5.15.123"
 
 LIC_FILES_CHKSUM = "file://COPYING;md5=6bc538ed5bd9a7fc9398086aedcd7e46"
 
diff --git a/meta/recipes-kernel/linux/linux-yocto-tiny_5.15.bb b/meta/recipes-kernel/linux/linux-yocto-tiny_5.15.bb
index 218d81653d..88faa7b055 100644
--- a/meta/recipes-kernel/linux/linux-yocto-tiny_5.15.bb
+++ b/meta/recipes-kernel/linux/linux-yocto-tiny_5.15.bb
@@ -5,7 +5,7 @@ KCONFIG_MODE = "--allnoconfig"
 
 require recipes-kernel/linux/linux-yocto.inc
 
-LINUX_VERSION ?= "5.15.122"
+LINUX_VERSION ?= "5.15.123"
 LIC_FILES_CHKSUM = "file://COPYING;md5=6bc538ed5bd9a7fc9398086aedcd7e46"
 
 DEPENDS += "${@bb.utils.contains('ARCH', 'x86', 'elfutils-native', '', d)}"
@@ -14,8 +14,8 @@ DEPENDS += "openssl-native util-linux-native"
 KMETA = "kernel-meta"
 KCONF_BSP_AUDIT_LEVEL = "2"
 
-SRCREV_machine ?= "ba5a5a74beb8160940ac4a7bae7b3ba4bb2ae8a4"
-SRCREV_meta ?= "ad208ba7d8166bc7cfd260650d481ba8e95dc1b9"
+SRCREV_machine ?= "5aa57f90df9951ba3d98a8ff083a43b62f97e7cc"
+SRCREV_meta ?= "cae7ce34613cda607d089452f19e8b20143afcf6"
 
 PV = "${LINUX_VERSION}+git${SRCPV}"
 
diff --git a/meta/recipes-kernel/linux/linux-yocto_5.15.bb b/meta/recipes-kernel/linux/linux-yocto_5.15.bb
index f7b843d0b4..74b6b53158 100644
--- a/meta/recipes-kernel/linux/linux-yocto_5.15.bb
+++ b/meta/recipes-kernel/linux/linux-yocto_5.15.bb
@@ -13,24 +13,24 @@ KBRANCH:qemux86  ?= "v5.15/standard/base"
 KBRANCH:qemux86-64 ?= "v5.15/standard/base"
 KBRANCH:qemumips64 ?= "v5.15/standard/mti-malta64"
 
-SRCREV_machine:qemuarm ?= "359aed9e8617e74cc294c5ed7ab1ba545f3c64da"
-SRCREV_machine:qemuarm64 ?= "97e944b9f7bcc62d6dbd5457a73da3e8324efde7"
-SRCREV_machine:qemumips ?= "a8df61307d1b0dc24568183c680eacb3ec16f80c"
-SRCREV_machine:qemuppc ?= "2db940bee2b844eee8e29dc1f9b7ecae118a2455"
-SRCREV_machine:qemuriscv64 ?= "295703c7e73cf6be6c7977b2c00130764a8cb400"
-SRCREV_machine:qemuriscv32 ?= "295703c7e73cf6be6c7977b2c00130764a8cb400"
-SRCREV_machine:qemux86 ?= "295703c7e73cf6be6c7977b2c00130764a8cb400"
-SRCREV_machine:qemux86-64 ?= "295703c7e73cf6be6c7977b2c00130764a8cb400"
-SRCREV_machine:qemumips64 ?= "28984d668cee9c13a6e7d107d65f4923f3c7db7a"
-SRCREV_machine ?= "295703c7e73cf6be6c7977b2c00130764a8cb400"
-SRCREV_meta ?= "ad208ba7d8166bc7cfd260650d481ba8e95dc1b9"
+SRCREV_machine:qemuarm ?= "ef2785ed640623ce9ae395a2abc49d22cdc6250b"
+SRCREV_machine:qemuarm64 ?= "c68f102984771a06e462d8a8f6ded44c3acee4bf"
+SRCREV_machine:qemumips ?= "f5dcc525b57cf14c8a3d287ff3da9c2bf2b76bee"
+SRCREV_machine:qemuppc ?= "4372656a5a7ea05a29ca1758468e41f1ceae5a1a"
+SRCREV_machine:qemuriscv64 ?= "20f53f58b8ce5cade2786e8e31cfdb714fa4c420"
+SRCREV_machine:qemuriscv32 ?= "20f53f58b8ce5cade2786e8e31cfdb714fa4c420"
+SRCREV_machine:qemux86 ?= "20f53f58b8ce5cade2786e8e31cfdb714fa4c420"
+SRCREV_machine:qemux86-64 ?= "20f53f58b8ce5cade2786e8e31cfdb714fa4c420"
+SRCREV_machine:qemumips64 ?= "bd546f292ae1ce89104a3556b0245e8cd908615d"
+SRCREV_machine ?= "20f53f58b8ce5cade2786e8e31cfdb714fa4c420"
+SRCREV_meta ?= "cae7ce34613cda607d089452f19e8b20143afcf6"
 
 # set your preferred provider of linux-yocto to 'linux-yocto-upstream', and you'll
 # get the <version>/base branch, which is pure upstream -stable, and the same
 # meta SRCREV as the linux-yocto-standard builds. Select your version using the
 # normal PREFERRED_VERSION settings.
 BBCLASSEXTEND = "devupstream:target"
-SRCREV_machine:class-devupstream ?= "5c6a716301d915055c7bd6d935f7a4fccec2649c"
+SRCREV_machine:class-devupstream ?= "09996673e3139a6d86fc3d95c852b3a020e2fe5f"
 PN:class-devupstream = "linux-yocto-upstream"
 KBRANCH:class-devupstream = "v5.15/base"
 
@@ -38,7 +38,7 @@ SRC_URI = "git://git.yoctoproject.org/linux-yocto.git;name=machine;branch=${KBRA
            git://git.yoctoproject.org/yocto-kernel-cache;type=kmeta;name=meta;branch=yocto-5.15;destsuffix=${KMETA};protocol=https"
 
 LIC_FILES_CHKSUM = "file://COPYING;md5=6bc538ed5bd9a7fc9398086aedcd7e46"
-LINUX_VERSION ?= "5.15.122"
+LINUX_VERSION ?= "5.15.123"
 
 DEPENDS += "${@bb.utils.contains('ARCH', 'x86', 'elfutils-native', '', d)}"
 DEPENDS += "openssl-native util-linux-native"
-- 
2.34.1


