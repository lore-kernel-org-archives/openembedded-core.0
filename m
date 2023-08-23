Return-Path: <steve@sakoman.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 5E837EE49A0
	for <webhook@archiver.kernel.org>; Wed, 23 Aug 2023 14:36:57 +0000 (UTC)
Received: from mail-pf1-f176.google.com (mail-pf1-f176.google.com [209.85.210.176])
 by mx.groups.io with SMTP id smtpd.web11.13069.1692801408420932506
 for <openembedded-core@lists.openembedded.org>;
 Wed, 23 Aug 2023 07:36:48 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@sakoman-com.20221208.gappssmtp.com header.s=20221208 header.b=HQW77cMm;
 spf=softfail (domain: sakoman.com, ip: 209.85.210.176, mailfrom: steve@sakoman.com)
Received: by mail-pf1-f176.google.com with SMTP id d2e1a72fcca58-68a42d06d02so2510138b3a.0
        for <openembedded-core@lists.openembedded.org>; Wed, 23 Aug 2023 07:36:48 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=sakoman-com.20221208.gappssmtp.com; s=20221208; t=1692801407; x=1693406207;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=E2ULWxMQTotvzIDiuFyCgMMP+m/XaSBczOjw+Bx/cyk=;
        b=HQW77cMmV7dchH2ysJFkt81nwfPpaelN3tH0FQ1/Alsu39sElp/AOKjXdZM8YYf3+Y
         cX2Eo9da5/2Pt6XgDPuPItmgJWbRRKx0wC6kgBz0bceJ3eEt5DPraWDe0c8GcJeTL88e
         P5OrEU1UdR+JFOLIGjNIo1lwyhq413LSHSgxId7X5zOUqf9nXPpj4pmnXeVo0st22DDz
         b7nNJwgSsb9n/J1+PfUFue3itCXP+UGPQWZlbVOaFBFpT/Fi1Npnrk+f9bh6vXIoCNe2
         my8li6MvQnhesrgf0YNJNeqK0jUcoxHlSP+uGebmE4yQrCrllHLnMKlds0A3bh9YKyN5
         Xb4w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1692801407; x=1693406207;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=E2ULWxMQTotvzIDiuFyCgMMP+m/XaSBczOjw+Bx/cyk=;
        b=Tc9HW4KILfBxOHMSrXR8JcZnldue/EcA4We2QmeY5NGMsMtF2G4vPsAmq/Ff4AQhFF
         1Emslaod7UGJUNotkiVhh42lRADXsCoIMmUAZnINrDf61Zacxb9muVkg/B7zzov2m6kY
         HzIoVn0h6T+1GCB4W5+qvemP9AbYRmaEgE9K8r+X02zyT/zq4a2e9qj4IhAuAXlo+LcP
         CQ3YmowBU+ShvWIJeyo6EUyJ6JDVRdnQrAyOjTP6q1KbFYHdg+KvrrPnUsF1pUomCygT
         GbTMsRC3iCK/0MF0aVKoVSSnv9XWzm35gQSoE03zDnuvR1+uMgsLrwwfnkjAlKXr62zF
         rA5w==
X-Gm-Message-State: AOJu0YyyDzOJun1VtVwgUs86+JyEfeL/2pcj4P215Ptyp70P+iY9wxQF
	6SOLYEv8W37vjjO4pdr6pFgwZ4f4+gVzE2b6m4E=
X-Google-Smtp-Source: AGHT+IFp4Kz+68Vk1Yg09Js204JWOC3IputCScf6HMCT9BLfVpUyChNE1cgdw1QiuisAUOlN/vp3nA==
X-Received: by 2002:a05:6a20:6a05:b0:134:d4d3:f0a8 with SMTP id p5-20020a056a206a0500b00134d4d3f0a8mr12362126pzk.3.1692801407389;
        Wed, 23 Aug 2023 07:36:47 -0700 (PDT)
Received: from xps13.router0800d9.com (dhcp-72-234-106-30.hawaiiantel.net. [72.234.106.30])
        by smtp.gmail.com with ESMTPSA id 2-20020a170902e9c200b001bb750189desm11062478plk.255.2023.08.23.07.36.46
        for <openembedded-core@lists.openembedded.org>
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 23 Aug 2023 07:36:46 -0700 (PDT)
From: Steve Sakoman <steve@sakoman.com>
To: openembedded-core@lists.openembedded.org
Subject: [OE-core][kirkstone 13/36] linux-yocto/5.15: update to v5.15.123
Date: Wed, 23 Aug 2023 04:35:43 -1000
Message-Id: <873c6253c029ceb303a849ced14bf5125856b368.1692799745.git.steve@sakoman.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <cover.1692799745.git.steve@sakoman.com>
References: <cover.1692799745.git.steve@sakoman.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Wed, 23 Aug 2023 14:36:57 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/186594

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
Signed-off-by: Steve Sakoman <steve@sakoman.com>
(cherry picked from commit df81fdbc619c5a3a76ad3bdea2bf7d761e612656)
Signed-off-by: Steve Sakoman <steve@sakoman.com>
---
 .../linux/linux-yocto-rt_5.15.bb              |  6 ++---
 .../linux/linux-yocto-tiny_5.15.bb            |  6 ++---
 meta/recipes-kernel/linux/linux-yocto_5.15.bb | 26 +++++++++----------
 3 files changed, 19 insertions(+), 19 deletions(-)

diff --git a/meta/recipes-kernel/linux/linux-yocto-rt_5.15.bb b/meta/recipes-kernel/linux/linux-yocto-rt_5.15.bb
index a44cfa042f..76c98336f9 100644
--- a/meta/recipes-kernel/linux/linux-yocto-rt_5.15.bb
+++ b/meta/recipes-kernel/linux/linux-yocto-rt_5.15.bb
@@ -11,13 +11,13 @@ python () {
         raise bb.parse.SkipRecipe("Set PREFERRED_PROVIDER_virtual/kernel to linux-yocto-rt to enable it")
 }
 
-SRCREV_machine ?= "116b31284aee597f71b1e608b4c0fd33fae483a8"
-SRCREV_meta ?= "ad208ba7d8166bc7cfd260650d481ba8e95dc1b9"
+SRCREV_machine ?= "59fd8ada21b5e298f66a7b22b8e90a16f5a30142"
+SRCREV_meta ?= "cae7ce34613cda607d089452f19e8b20143afcf6"
 
 SRC_URI = "git://git.yoctoproject.org/linux-yocto.git;branch=${KBRANCH};name=machine \
            git://git.yoctoproject.org/yocto-kernel-cache;type=kmeta;name=meta;branch=yocto-5.15;destsuffix=${KMETA}"
 
-LINUX_VERSION ?= "5.15.122"
+LINUX_VERSION ?= "5.15.123"
 
 LIC_FILES_CHKSUM = "file://COPYING;md5=6bc538ed5bd9a7fc9398086aedcd7e46"
 
diff --git a/meta/recipes-kernel/linux/linux-yocto-tiny_5.15.bb b/meta/recipes-kernel/linux/linux-yocto-tiny_5.15.bb
index 502d6cc679..c340702712 100644
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
index babd72dce9..06b381b362 100644
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
            git://git.yoctoproject.org/yocto-kernel-cache;type=kmeta;name=meta;branch=yocto-5.15;destsuffix=${KMETA}"
 
 LIC_FILES_CHKSUM = "file://COPYING;md5=6bc538ed5bd9a7fc9398086aedcd7e46"
-LINUX_VERSION ?= "5.15.122"
+LINUX_VERSION ?= "5.15.123"
 
 DEPENDS += "${@bb.utils.contains('ARCH', 'x86', 'elfutils-native', '', d)}"
 DEPENDS += "openssl-native util-linux-native"
-- 
2.34.1


