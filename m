Return-Path: <steve@sakoman.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id E042FC19F2D
	for <webhook@archiver.kernel.org>; Tue,  9 Aug 2022 21:28:15 +0000 (UTC)
Received: from mail-pj1-f41.google.com (mail-pj1-f41.google.com
 [209.85.216.41])
 by mx.groups.io with SMTP id smtpd.web09.376.1660080494066869275
 for <openembedded-core@lists.openembedded.org>;
 Tue, 09 Aug 2022 14:28:14 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@sakoman-com.20210112.gappssmtp.com header.s=20210112
 header.b=vRpr/D4X;
 spf=softfail (domain: sakoman.com, ip: 209.85.216.41,
 mailfrom: steve@sakoman.com)
Received: by mail-pj1-f41.google.com with SMTP id b4so12898659pji.4
        for <openembedded-core@lists.openembedded.org>;
 Tue, 09 Aug 2022 14:28:14 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=sakoman-com.20210112.gappssmtp.com; s=20210112;
        h=from:to:subject:date:message-id:in-reply-to:references:mime-version
         :content-transfer-encoding;
        bh=XyoarxwQGJSI97oFjj2IWuVcSSiIAHeHQpZ+ixcj5nA=;
        b=vRpr/D4XwXNDnLoFs7hbm/9ECaRNtOUmjC39tG7mhrMMOc/Wi187TnFoXSJgyRElP8
         Ll209Wux6xigNrwQrCmBUq1H91qc6r8FW2k+NT+xnVkkmkSGZP4SBAPOV2K5vUMW/htz
         uhUEnd5rrXOK6U2IOoYl1yL7bKvx83Q8awajjHHk1bZwPWdol/NutMYaoRcIjAJrc68O
         Syyvv9rTXD+DR6C93lmfbnRK/0egPVWBU1T8yJUR/YrxPOBpXnv1syYqoPyP0xGNQQwS
         MahdRTqEdE09lDOINYUlCuIpi6LBLg5uRYoo9JzDqS6y5C1Ms5r16xtU0ciiG0fbbjc1
         P74A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:from:to:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=XyoarxwQGJSI97oFjj2IWuVcSSiIAHeHQpZ+ixcj5nA=;
        b=LJ/3OXTp7kJAWFoik6na8ctqU4CoJX67ZKiiUEEIh80uTPI6mGC8vB0ISIPA9TgEl+
         U4uwsUSO+lrssW3gC5YDAMdS72Y9knQAD0OnuUXBjUlXBrzSl/anliqebjkPpsFqr6Wg
         hgSLz9JweS2bYC7kU+jZl9ONVQxdswtmNTUlsicwLGTtnyIFdgImmX8XzAZHvCm8WzcA
         oZOzFes5B+ZAXzpvO0Ns8R6L+Eo9LUUMC9AbYIkgQ9Ctlx8rg2LQ3hOJaH9dnQ4j77d+
         fIMCQ8gcOG5Cll0G2EO9Y4xMgnx8rsQEdRvUlJfryYx/Zwq5oc/wpJbvID8S0tL4R8ft
         OS3A==
X-Gm-Message-State: ACgBeo0oizbymb9MetAkN8uKioj96+lR1PU8Jf9itsVjo1h8W8ruVB4p
	clhKhLmE0Inus91BGv+zH3ve/7pNZspCk6eK
X-Google-Smtp-Source: 
 AA6agR5l86/s6FLuiqGWsWQUmXdhCD5PndZpFBlQzSjmE7MTpDjjo/FyhRsOo35Q5saFcOxXQm8yXQ==
X-Received: by 2002:a17:902:d50c:b0:16f:736:33a0 with SMTP id
 b12-20020a170902d50c00b0016f073633a0mr26067988plg.137.1660080492884;
        Tue, 09 Aug 2022 14:28:12 -0700 (PDT)
Received: from hexa.router0800d9.com (dhcp-72-253-6-214.hawaiiantel.net.
 [72.253.6.214])
        by smtp.gmail.com with ESMTPSA id
 g12-20020a17090a4b0c00b001f4d711e165sm62273pjh.11.2022.08.09.14.28.11
        for <openembedded-core@lists.openembedded.org>
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 09 Aug 2022 14:28:12 -0700 (PDT)
From: Steve Sakoman <steve@sakoman.com>
To: openembedded-core@lists.openembedded.org
Subject: [OE-core][kirkstone 5/8] linux-yocto/5.15: update to v5.15.59
Date: Tue,  9 Aug 2022 11:27:39 -1000
Message-Id: 
 <33d84b741b77e7a172e8f21c2bc6672ab2d08e89.1660080350.git.steve@sakoman.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <cover.1660080350.git.steve@sakoman.com>
References: <cover.1660080350.git.steve@sakoman.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Tue, 09 Aug 2022 21:28:15 -0000
X-Groupsio-URL: 
 https://lists.openembedded.org/g/openembedded-core/message/169168

From: Bruce Ashfield <bruce.ashfield@gmail.com>

Updating  to the latest korg -stable release that comprises
the following commits:

    d676d6149a2f Linux 5.15.59
    f0e42e43795d x86/bugs: Do not enable IBPB at firmware entry when IBPB is not available
    d10e819d13f7 locking/rwsem: Allow slowpath writer to ignore handoff bit if not set by first waiter
    66d31cef4806 docs/kernel-parameters: Update descriptions for "mitigations=" param with retbleed
    7bada8b0bdf1 EDAC/ghes: Set the DIMM label unconditionally
    30dc2effc74a ARM: 9216/1: Fix MAX_DMA_ADDRESS overflow
    86e83233dd01 page_alloc: fix invalid watermark check on a negative value
    51a772c34ea4 mm/hmm: fault non-owner device private entries
    350fcb5e7bbb ARM: crypto: comment out gcc warning that breaks clang builds
    e796e1fe20ec sctp: leave the err path free in sctp_stream_init to sctp_stream_free
    f7c2a9c5435a sfc: disable softirqs for ptp TX
    fe0e602f0502 perf symbol: Correct address for bss symbols
    871168abe6d8 virtio-net: fix the race between refill work and close
    91c11008aab0 netfilter: nf_queue: do not allow packet truncation below transport header offset
    be5cd347ba22 octeontx2-pf: cn10k: Fix egress ratelimit configuration
    3688939cd3e8 sctp: fix sleep in atomic context bug in timer handlers
    186fcdb68f42 i40e: Fix interface init with MSI interrupts (no MSI-X)
    4685f16b3a5d ipv4: Fix data-races around sysctl_fib_notify_on_flag_change.
    eaccca7a0bb8 tcp: Fix data-races around sysctl_tcp_reflect_tos.
    4cc070e0ef2d tcp: Fix a data-race around sysctl_tcp_comp_sack_nr.
    34c9977b4dca tcp: Fix a data-race around sysctl_tcp_comp_sack_slack_ns.
    6842c94de9d5 tcp: Fix a data-race around sysctl_tcp_comp_sack_delay_ns.
    618116a273b7 net: Fix data-races around sysctl_[rw]mem(_offset)?.
    a610feb170bf tcp: Fix data-races around sk_pacing_rate.
    b01b4f5b45ff net: mld: fix reference count leak in mld_{query | report}_work()
    5831ccf37a31 net: macsec: fix potential resource leak in macsec_add_rxsa() and macsec_add_txsa()
    2959a86a472f macsec: always read MACSEC_SA_ATTR_PN as a u64
    a706a40d42f4 macsec: limit replay window size with XPN
    6ad56d5c4f98 macsec: fix error message in macsec_add_rxsa and _txsa
    8991687d3bcf macsec: fix NULL deref in macsec_add_rxsa
    830582c16be1 Documentation: fix sctp_wmem in ip-sysctl.rst
    dac5644a823e tcp: Fix a data-race around sysctl_tcp_invalid_ratelimit.
    6f446677ebb3 tcp: Fix a data-race around sysctl_tcp_autocorking.
    bd07f2e70a4b tcp: Fix a data-race around sysctl_tcp_min_rtt_wlen.
    922ca9fd221b tcp: Fix a data-race around sysctl_tcp_min_tso_segs.
    777d18e65d09 net: sungem_phy: Add of_node_put() for reference returned by of_get_parent()
    40f4739bbd36 net: pcs: xpcs: propagate xpcs_read error to xpcs_get_state_c37_sgmii
    c721324afc58 igmp: Fix data-races around sysctl_igmp_qrv.
    ad6d6ae4a34c net/tls: Remove the context from the list in tls_device_down
    189e370b8250 ipv6/addrconf: fix a null-ptr-deref bug for ip6_ptr
    4845d3ef6445 net: ping6: Fix memleak in ipv6_renew_options().
    6a4a1c70e446 scsi: mpt3sas: Stop fw fault watchdog work item during system shutdown
    3d3e41069b65 scsi: core: Fix warning in scsi_alloc_sgtables()
    ff2932ac8ee1 tcp: Fix a data-race around sysctl_tcp_challenge_ack_limit.
    a88de75673e4 tcp: Fix a data-race around sysctl_tcp_limit_output_bytes.
    664a3311e671 tcp: Fix data-races around sysctl_tcp_moderate_rcvbuf.
    59e2332846d8 octeontx2-pf: Fix UDP/TCP src and dst port tc filters
    927c5cf0ba3e Revert "tcp: change pingpong threshold to 3"
    bdaf56e0df15 scsi: ufs: host: Hold reference returned by of_parse_phandle()
    7f0a36506809 ice: do not setup vlan for loopback VSI
    cef4c1d0fb48 ice: check (DD | EOF) bits on Rx descriptor rather than (EOP | RS)
    62e721dee8cc tcp: Fix data-races around sysctl_tcp_no_ssthresh_metrics_save.
    aa2ca5b5629d tcp: Fix a data-race around sysctl_tcp_nometrics_save.
    6e167ed68999 tcp: Fix a data-race around sysctl_tcp_frto.
    0d8fa3c2a442 tcp: Fix a data-race around sysctl_tcp_adv_win_scale.
    74753ec663d7 tcp: Fix a data-race around sysctl_tcp_app_win.
    807b028115eb tcp: Fix data-races around sysctl_tcp_dsack.
    c9c01dd38975 watch_queue: Fix missing locking in add_watch_to_object()
    093610f216d0 watch_queue: Fix missing rcu annotation
    11c1cc3f6e42 drm/simpledrm: Fix return type of simpledrm_simple_display_pipe_mode_valid()
    121c8993d4f3 nouveau/svm: Fix to migrate all requested pages
    8bd9747d3066 s390/archrandom: prevent CPACF trng invocations in interrupt context
    71f71150115a asm-generic: remove a broken and needless ifdef conditional
    dc124c849c72 hugetlb: fix memoryleak in hugetlb_mcopy_atomic_pte
    2722fb0f7028 mm: fix page leak with multiple threads mapping the same page
    70d0ce332d26 secretmem: fix unhandled fault in truncate
    3ef8040afce7 fs: sendfile handles O_NONBLOCK of out_fd
    518df26b5238 ntfs: fix use-after-free in ntfs_ucsncmp()
    46f6301fb4f1 Revert "ocfs2: mount shared volume without ha stack"
    f32d5615a78a Bluetooth: L2CAP: Fix use-after-free caused by l2cap_chan_put

Signed-off-by: Bruce Ashfield <bruce.ashfield@gmail.com>
Signed-off-by: Richard Purdie <richard.purdie@linuxfoundation.org>
(cherry picked from commit 16eb9cd4354cbdbcf216c2fbe268b9f9d57acb5c)
Signed-off-by: Steve Sakoman <steve@sakoman.com>
---
 .../linux/linux-yocto-rt_5.15.bb              |  6 ++---
 .../linux/linux-yocto-tiny_5.15.bb            |  6 ++---
 meta/recipes-kernel/linux/linux-yocto_5.15.bb | 26 +++++++++----------
 3 files changed, 19 insertions(+), 19 deletions(-)

diff --git a/meta/recipes-kernel/linux/linux-yocto-rt_5.15.bb b/meta/recipes-kernel/linux/linux-yocto-rt_5.15.bb
index 7560ce8241..a385042c95 100644
--- a/meta/recipes-kernel/linux/linux-yocto-rt_5.15.bb
+++ b/meta/recipes-kernel/linux/linux-yocto-rt_5.15.bb
@@ -11,13 +11,13 @@ python () {
         raise bb.parse.SkipRecipe("Set PREFERRED_PROVIDER_virtual/kernel to linux-yocto-rt to enable it")
 }
 
-SRCREV_machine ?= "6bc08dd702bb8993f84d81ad426fd9acad26cede"
-SRCREV_meta ?= "f45197776b360447cb4df7bc1e74dce6f8ad52b1"
+SRCREV_machine ?= "1bb4f634d786d708e2f078fca1ccc46c9c42f5f0"
+SRCREV_meta ?= "514a287a5b3adaeb58774fb86616fdfa2e751cf5"
 
 SRC_URI = "git://git.yoctoproject.org/linux-yocto.git;branch=${KBRANCH};name=machine \
            git://git.yoctoproject.org/yocto-kernel-cache;type=kmeta;name=meta;branch=yocto-5.15;destsuffix=${KMETA}"
 
-LINUX_VERSION ?= "5.15.58"
+LINUX_VERSION ?= "5.15.59"
 
 LIC_FILES_CHKSUM = "file://COPYING;md5=6bc538ed5bd9a7fc9398086aedcd7e46"
 
diff --git a/meta/recipes-kernel/linux/linux-yocto-tiny_5.15.bb b/meta/recipes-kernel/linux/linux-yocto-tiny_5.15.bb
index ab0151d1ab..b6473d740a 100644
--- a/meta/recipes-kernel/linux/linux-yocto-tiny_5.15.bb
+++ b/meta/recipes-kernel/linux/linux-yocto-tiny_5.15.bb
@@ -5,7 +5,7 @@ KCONFIG_MODE = "--allnoconfig"
 
 require recipes-kernel/linux/linux-yocto.inc
 
-LINUX_VERSION ?= "5.15.58"
+LINUX_VERSION ?= "5.15.59"
 LIC_FILES_CHKSUM = "file://COPYING;md5=6bc538ed5bd9a7fc9398086aedcd7e46"
 
 DEPENDS += "${@bb.utils.contains('ARCH', 'x86', 'elfutils-native', '', d)}"
@@ -14,8 +14,8 @@ DEPENDS += "openssl-native util-linux-native"
 KMETA = "kernel-meta"
 KCONF_BSP_AUDIT_LEVEL = "2"
 
-SRCREV_machine ?= "c944a56a2d84d3adbaef14be8a6afa30b0dace20"
-SRCREV_meta ?= "f45197776b360447cb4df7bc1e74dce6f8ad52b1"
+SRCREV_machine ?= "0aa6b57221bb524abcb34e8772ebff0f34a4a322"
+SRCREV_meta ?= "514a287a5b3adaeb58774fb86616fdfa2e751cf5"
 
 PV = "${LINUX_VERSION}+git${SRCPV}"
 
diff --git a/meta/recipes-kernel/linux/linux-yocto_5.15.bb b/meta/recipes-kernel/linux/linux-yocto_5.15.bb
index f7e576ba3d..bd4203c41a 100644
--- a/meta/recipes-kernel/linux/linux-yocto_5.15.bb
+++ b/meta/recipes-kernel/linux/linux-yocto_5.15.bb
@@ -13,24 +13,24 @@ KBRANCH:qemux86  ?= "v5.15/standard/base"
 KBRANCH:qemux86-64 ?= "v5.15/standard/base"
 KBRANCH:qemumips64 ?= "v5.15/standard/mti-malta64"
 
-SRCREV_machine:qemuarm ?= "294460c2e2f3e7d3c0ddff5d731568bf14fe3468"
-SRCREV_machine:qemuarm64 ?= "6887e4e7a7bbd8cba33a91d8309a1a16c466e025"
-SRCREV_machine:qemumips ?= "a372c36fe5260e6806b1a2211f2a944353e3cf42"
-SRCREV_machine:qemuppc ?= "e0bae0aa107d9587a249c66b8bebddd88053a4da"
-SRCREV_machine:qemuriscv64 ?= "231c3910df6c8320d4ded84a5b4776c4ff90750f"
-SRCREV_machine:qemuriscv32 ?= "231c3910df6c8320d4ded84a5b4776c4ff90750f"
-SRCREV_machine:qemux86 ?= "231c3910df6c8320d4ded84a5b4776c4ff90750f"
-SRCREV_machine:qemux86-64 ?= "231c3910df6c8320d4ded84a5b4776c4ff90750f"
-SRCREV_machine:qemumips64 ?= "c7a71a863f360ea1c54e35c03e8987c4212fbef1"
-SRCREV_machine ?= "231c3910df6c8320d4ded84a5b4776c4ff90750f"
-SRCREV_meta ?= "f45197776b360447cb4df7bc1e74dce6f8ad52b1"
+SRCREV_machine:qemuarm ?= "1dbb5e5eb62a52d71324867d1256fc0b2374d8c6"
+SRCREV_machine:qemuarm64 ?= "92f780cdfe537cc6fc339a55aa2d5ce649be51fa"
+SRCREV_machine:qemumips ?= "6eff04e888e27e79251ba7c1777b6483995d654d"
+SRCREV_machine:qemuppc ?= "03453f65f2427ec9b0f2a542089fd1df844d2f0e"
+SRCREV_machine:qemuriscv64 ?= "085e50e42da129c6f978ea6db83ff54a1e214cd0"
+SRCREV_machine:qemuriscv32 ?= "085e50e42da129c6f978ea6db83ff54a1e214cd0"
+SRCREV_machine:qemux86 ?= "085e50e42da129c6f978ea6db83ff54a1e214cd0"
+SRCREV_machine:qemux86-64 ?= "085e50e42da129c6f978ea6db83ff54a1e214cd0"
+SRCREV_machine:qemumips64 ?= "667b54b6cd20a8c5ffcc36603922b6d13fa3f2f0"
+SRCREV_machine ?= "085e50e42da129c6f978ea6db83ff54a1e214cd0"
+SRCREV_meta ?= "514a287a5b3adaeb58774fb86616fdfa2e751cf5"
 
 # set your preferred provider of linux-yocto to 'linux-yocto-upstream', and you'll
 # get the <version>/base branch, which is pure upstream -stable, and the same
 # meta SRCREV as the linux-yocto-standard builds. Select your version using the
 # normal PREFERRED_VERSION settings.
 BBCLASSEXTEND = "devupstream:target"
-SRCREV_machine:class-devupstream ?= "7d8048d4e064d4ef7719e9520f6c123c051fca99"
+SRCREV_machine:class-devupstream ?= "d676d6149a2f4b4d66b8ea0a1dfef30a54cf5750"
 PN:class-devupstream = "linux-yocto-upstream"
 KBRANCH:class-devupstream = "v5.15/base"
 
@@ -38,7 +38,7 @@ SRC_URI = "git://git.yoctoproject.org/linux-yocto.git;name=machine;branch=${KBRA
            git://git.yoctoproject.org/yocto-kernel-cache;type=kmeta;name=meta;branch=yocto-5.15;destsuffix=${KMETA}"
 
 LIC_FILES_CHKSUM = "file://COPYING;md5=6bc538ed5bd9a7fc9398086aedcd7e46"
-LINUX_VERSION ?= "5.15.58"
+LINUX_VERSION ?= "5.15.59"
 
 DEPENDS += "${@bb.utils.contains('ARCH', 'x86', 'elfutils-native', '', d)}"
 DEPENDS += "openssl-native util-linux-native"
-- 
2.25.1


