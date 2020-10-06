Received: from mail-qv1-f68.google.com (mail-qv1-f68.google.com [209.85.219.68])
 by mx.groups.io with SMTP id smtpd.web10.1849.1602011084781850571
 for <openembedded-core@lists.openembedded.org>;
 Tue, 06 Oct 2020 12:04:45 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20161025 header.b=XiOGeCp7;
 spf=pass (domain: gmail.com, ip: 209.85.219.68, mailfrom: bruce.ashfield@gmail.com)
Received: by mail-qv1-f68.google.com with SMTP id de3so4040984qvb.5
        for <openembedded-core@lists.openembedded.org>; Tue, 06 Oct 2020 12:04:44 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:content-transfer-encoding;
        bh=mRnb03ZRv3VbHNL3H0tCgq5XIm2BUEgyUryS1HOS5y0=;
        b=XiOGeCp7pR9cDXecvqdQZOPLWHf2coe6zkWHfo+RuX4gh7/1r2NL+0e7a3AsuoKlxf
         RSaKxklF0o12Tubl5fMIbqMJdco3XVZnf5u9HPketm/92x/iAO4+OXExjvOBwD2JrEdg
         FEwrub1llNmeALTFylyKbIQ3+uq4RBqyC3zGt92jd5Kg6VE5B6kWEshGz23ooLJKHPyt
         8Jc0QXDUeawphhIdnSb/pubLgltH5TeBTgg3IAzxXZxeeptSAd+ufKQSW2NIHhS8jaQd
         L8FbPi7z6c6smS5W67Xn4/tk0cSN07iWKRBumj0Wv+MVKOtolVZEFVvFA8zYg8AKvGWo
         tasg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=mRnb03ZRv3VbHNL3H0tCgq5XIm2BUEgyUryS1HOS5y0=;
        b=Z3L8Y5NBSYzLV318pDvqoBfxfulxDgDPoaes/zYafUNCkh1NFCZNbtOTHdFvpccpXJ
         EpkJ2YaCp051T//mklw10oPhTH8rmvO2Iux8BjiIBlgmsnSVyRMSuOaXg3iGD4bXpdS7
         RZLq4w3MUFgH+xL23DWPR6did/cEqf9tg3KRRIbaMyCxcTEFuvbbgk6G70i8aleOB8VY
         O+Ta5URxc7AI/7tPD9rtKsjek7NfgAsOnySfLuVWbHM4fEiV5fU81ZIEGqUJhK2YCc5e
         augsM7mg490nV4WOJFDwbr9E+93I76RDXwSqcGsToZz8aPt8eDssGy39lJ29YEYVriHs
         j58w==
X-Gm-Message-State: AOAM530lHTa4x3d4/KZmb4iMyPZnvHsmN2kT3phJa/fkASvE9ozBNocj
	IyYLuhHScKEyKrIz/2cO6Xw=
X-Google-Smtp-Source: ABdhPJx1HqE90fIw+lVAjW9uwH0YL35dSNBTCfwl3RrdntP7J3Keq0M7BAE5X2xTRqrGL3PQeGX/xA==
X-Received: by 2002:a0c:edb0:: with SMTP id h16mr6413190qvr.49.1602011083806;
        Tue, 06 Oct 2020 12:04:43 -0700 (PDT)
Return-Path: <bruce.ashfield@gmail.com>
Received: from localhost.localdomain (CPE04d4c4975b80-CM64777d5e8820.cpe.net.cable.rogers.com. [174.112.240.214])
        by smtp.gmail.com with ESMTPSA id q19sm606604qtj.72.2020.10.06.12.04.42
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 06 Oct 2020 12:04:42 -0700 (PDT)
From: "Bruce Ashfield" <bruce.ashfield@gmail.com>
To: richard.purdie@linuxfoundation.org
Cc: openembedded-core@lists.openembedded.org
Subject: [PATCH 5/7] linux-yocto/5.8: update to v5.8.12
Date: Tue,  6 Oct 2020 15:04:32 -0400
Message-Id: <5fa43505c8083c6d1baae1f9e7e2d130e78279b9.1602010969.git.bruce.ashfield@gmail.com>
X-Mailer: git-send-email 2.19.1
In-Reply-To: <cover.1602010968.git.bruce.ashfield@gmail.com>
References: <cover.1602010968.git.bruce.ashfield@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

From: Bruce Ashfield <bruce.ashfield@gmail.com>

Updating linux-yocto/5.8 to the latest korg -stable release that comprises
the following commits:

    0c52d2a4d9e9 Linux 5.8.12
    973f3e32fefe net/mlx5e: Fix endianness when calculating pedit mask first bit
    1fa560ecd2ca net/mlx5e: Use synchronize_rcu to sync with NAPI
    cb02cd23a450 net/mlx5e: Use RCU to protect rq->xdp_prog
    bb67766834c8 Revert "netns: don't disable BHs when locking "nsid_lock""
    e1338ca16300 net: macb: fix for pause frame receive enable bit
    d8c79a8b0671 net: dsa: microchip: ksz8795: really set the correct number of ports
    86ae8bdee923 net: dsa: link interfaces with the DSA master to get rid of lockdep warnings
    150feba39d80 hv_netvsc: Fix hibernation for mlx5 VF driver
    5b569fc51689 hinic: fix rewaking txq after netif_tx_disable
    3a3aab5bd46f net/mlx5e: Fix memory leak of tunnel info when rule under multipath not ready
    e77ae86a2830 net: ipa: fix u32_replace_bits by u32p_xxx version
    f41a9b68b2e5 wireguard: peerlookup: take lock before checking hash in replace operation
    1aa173b4181a wireguard: noise: take lock when removing handshake entry from table
    9346c24848d6 net: ethernet: ti: cpsw_new: fix suspend/resume
    b42148e2270e net: add __must_check to skb_put_padto()
    9cb51c5f22f1 net: qrtr: check skb_put_padto() return value
    410c186dc45e net: phy: Do not warn in phy_stop() on PHY_DOWN
    3fa1f8461a5d net: phy: Avoid NPD upon phy_detach() when driver is unbound
    318d2408a81d net: lantiq: Disable IRQs only if NAPI gets scheduled
    c36c06305afe net: lantiq: Use napi_complete_done()
    5e0c1c65c7da net: lantiq: use netif_tx_napi_add() for TX NAPI
    345fa127e965 net: lantiq: Wake TX queue again
    786c627c377f bnxt_en: Protect bnxt_set_eee() and bnxt_set_pauseparam() with mutex.
    138ded90a311 bnxt_en: return proper error codes in bnxt_show_temp
    693ba8c81ca3 bnxt_en: Use memcpy to copy VPD field info.
    6229623f54cb net/mlx5e: TLS, Do not expose FPGA TLS counter if not supported
    46ef5581c432 net/mlx5e: Enable adding peer miss rules only if merged eswitch is supported
    41f2b0bd1713 tipc: use skb_unshare() instead in tipc_buf_append()
    d8e7be19d2bd tipc: fix shutdown() of connection oriented socket
    7ada162ea056 tipc: Fix memory leak in tipc_group_create_member()
    817ff50796c5 taprio: Fix allowing too small intervals
    b193ee2ad417 nfp: use correct define to return NONE fec
    5bda4b3ec1c9 net: sctp: Fix IPv6 ancestor_size calc in sctp_copy_descendant
    bd6df0266e31 net: sch_generic: aviod concurrent reset and enqueue op for lockless qdisc
    abdd468785e1 net: sched: initialize with 0 before setting erspan md->u
    9286233285ba net: phy: call phy_disable_interrupts() in phy_attach_direct() instead
    e9fd16fc0c7d net/mlx5: Fix FTE cleanup
    320df8ef04c6 net: ipv6: fix kconfig dependency warning for IPV6_SEG6_HMAC
    894514e17856 net: Fix bridge enslavement failure
    4979e51c318c net: dsa: rtl8366: Properly clear member config
    7e9939f0fef8 net: DCB: Validate DCB_ATTR_DCB_BUFFER argument
    0b9c3f8de6ab net: bridge: br_vlan_get_pvid_rcu() should dereference the VLAN group under RCU
    176b2e5140af ipv6: avoid lockdep issue in fib6_del()
    2b1be6c925cd ipv4: Update exception handling for multipath routes via same device
    a8faee58f55a ipv4: Initialize flowi4_multipath_hash in data path
    f49e5618fd54 ip: fix tos reflection in ack and reset packets
    584ff7bb14a6 hinic: bump up the timeout of SET_FUNC_STATE cmd
    6070a0f58d95 hdlc_ppp: add range checks in ppp_cp_parse_cr()
    e76c0f41d7b1 geneve: add transport ports in route lookup for geneve
    732a8eb73c51 cxgb4: Fix offset when clearing filter byte counters
    a01b4105d2f0 cxgb4: fix memory leak during module unload
    0d7002517f9b bnxt_en: Fix NULL ptr dereference crash in bnxt_fw_reset_task()
    67eb902e0335 bnxt_en: Avoid sending firmware messages when AER error is detected.
    946fc6d84768 act_ife: load meta modules before tcf_idr_check_alloc()
    9215385638b7 ibmvnic: add missing parenthesis in do_reset()
    68c7abb8302a ibmvnic fix NULL tx_pools and rx_tools issue at do_reset

Signed-off-by: Bruce Ashfield <bruce.ashfield@gmail.com>
---
 .../linux/linux-yocto-rt_5.8.bb               |  6 ++---
 .../linux/linux-yocto-tiny_5.8.bb             |  8 +++----
 meta/recipes-kernel/linux/linux-yocto_5.8.bb  | 22 +++++++++----------
 3 files changed, 18 insertions(+), 18 deletions(-)

diff --git a/meta/recipes-kernel/linux/linux-yocto-rt_5.8.bb b/meta/recipes-kernel/linux/linux-yocto-rt_5.8.bb
index 288ed9c550..9f05701c83 100644
--- a/meta/recipes-kernel/linux/linux-yocto-rt_5.8.bb
+++ b/meta/recipes-kernel/linux/linux-yocto-rt_5.8.bb
@@ -11,13 +11,13 @@ python () {
         raise bb.parse.SkipRecipe("Set PREFERRED_PROVIDER_virtual/kernel to linux-yocto-rt to enable it")
 }
 
-SRCREV_machine ?= "94ede549db68577a8280fa71a860ce39b9ac1ce9"
-SRCREV_meta ?= "0d5d371264746111cefd98867a03abe51ffa6098"
+SRCREV_machine ?= "24e4d6489a5e552339cf9318bcaa06a546bdfde1"
+SRCREV_meta ?= "1e2680147ee76ca61b252f6d72060322a7bd0564"
 
 SRC_URI = "git://git.yoctoproject.org/linux-yocto.git;branch=${KBRANCH};name=machine \
            git://git.yoctoproject.org/yocto-kernel-cache;type=kmeta;name=meta;branch=yocto-5.8;destsuffix=${KMETA}"
 
-LINUX_VERSION ?= "5.8.11"
+LINUX_VERSION ?= "5.8.12"
 
 LIC_FILES_CHKSUM = "file://COPYING;md5=6bc538ed5bd9a7fc9398086aedcd7e46"
 
diff --git a/meta/recipes-kernel/linux/linux-yocto-tiny_5.8.bb b/meta/recipes-kernel/linux/linux-yocto-tiny_5.8.bb
index 7d56c9b439..4376cfeea0 100644
--- a/meta/recipes-kernel/linux/linux-yocto-tiny_5.8.bb
+++ b/meta/recipes-kernel/linux/linux-yocto-tiny_5.8.bb
@@ -6,7 +6,7 @@ KCONFIG_MODE = "--allnoconfig"
 
 require recipes-kernel/linux/linux-yocto.inc
 
-LINUX_VERSION ?= "5.8.11"
+LINUX_VERSION ?= "5.8.12"
 LIC_FILES_CHKSUM = "file://COPYING;md5=6bc538ed5bd9a7fc9398086aedcd7e46"
 
 DEPENDS += "${@bb.utils.contains('ARCH', 'x86', 'elfutils-native', '', d)}"
@@ -15,9 +15,9 @@ DEPENDS += "openssl-native util-linux-native"
 KMETA = "kernel-meta"
 KCONF_BSP_AUDIT_LEVEL = "2"
 
-SRCREV_machine_qemuarm ?= "4c507a6e4005502b57ffc3ac076bee40b459ea76"
-SRCREV_machine ?= "94ede549db68577a8280fa71a860ce39b9ac1ce9"
-SRCREV_meta ?= "0d5d371264746111cefd98867a03abe51ffa6098"
+SRCREV_machine_qemuarm ?= "a8bcb5d14b88693c25688993de78421bbd36ae93"
+SRCREV_machine ?= "24e4d6489a5e552339cf9318bcaa06a546bdfde1"
+SRCREV_meta ?= "1e2680147ee76ca61b252f6d72060322a7bd0564"
 
 PV = "${LINUX_VERSION}+git${SRCPV}"
 
diff --git a/meta/recipes-kernel/linux/linux-yocto_5.8.bb b/meta/recipes-kernel/linux/linux-yocto_5.8.bb
index 39c6dd41ab..51506ffa49 100644
--- a/meta/recipes-kernel/linux/linux-yocto_5.8.bb
+++ b/meta/recipes-kernel/linux/linux-yocto_5.8.bb
@@ -12,16 +12,16 @@ KBRANCH_qemux86  ?= "v5.8/standard/base"
 KBRANCH_qemux86-64 ?= "v5.8/standard/base"
 KBRANCH_qemumips64 ?= "v5.8/standard/mti-malta64"
 
-SRCREV_machine_qemuarm ?= "db7658ec31b561834ed533fdf3c496a3690ccb94"
-SRCREV_machine_qemuarm64 ?= "94ede549db68577a8280fa71a860ce39b9ac1ce9"
-SRCREV_machine_qemumips ?= "1e34c536c7d51e384e6da88c100205971c620df4"
-SRCREV_machine_qemuppc ?= "94ede549db68577a8280fa71a860ce39b9ac1ce9"
-SRCREV_machine_qemuriscv64 ?= "94ede549db68577a8280fa71a860ce39b9ac1ce9"
-SRCREV_machine_qemux86 ?= "94ede549db68577a8280fa71a860ce39b9ac1ce9"
-SRCREV_machine_qemux86-64 ?= "94ede549db68577a8280fa71a860ce39b9ac1ce9"
-SRCREV_machine_qemumips64 ?= "862ad20fc118e3c0d9276b8c47f09dcde1736251"
-SRCREV_machine ?= "94ede549db68577a8280fa71a860ce39b9ac1ce9"
-SRCREV_meta ?= "0d5d371264746111cefd98867a03abe51ffa6098"
+SRCREV_machine_qemuarm ?= "ff081e4197575b15a59e24695c306fca8cbdee19"
+SRCREV_machine_qemuarm64 ?= "24e4d6489a5e552339cf9318bcaa06a546bdfde1"
+SRCREV_machine_qemumips ?= "c20c585e0dafe9346e32c528d31151b14e352753"
+SRCREV_machine_qemuppc ?= "24e4d6489a5e552339cf9318bcaa06a546bdfde1"
+SRCREV_machine_qemuriscv64 ?= "24e4d6489a5e552339cf9318bcaa06a546bdfde1"
+SRCREV_machine_qemux86 ?= "24e4d6489a5e552339cf9318bcaa06a546bdfde1"
+SRCREV_machine_qemux86-64 ?= "24e4d6489a5e552339cf9318bcaa06a546bdfde1"
+SRCREV_machine_qemumips64 ?= "23d67f72236c159d4a0d36bedac900883690005e"
+SRCREV_machine ?= "24e4d6489a5e552339cf9318bcaa06a546bdfde1"
+SRCREV_meta ?= "1e2680147ee76ca61b252f6d72060322a7bd0564"
 
 # remap qemuarm to qemuarma15 for the 5.8 kernel
 # KMACHINE_qemuarm ?= "qemuarma15"
@@ -30,7 +30,7 @@ SRC_URI = "git://git.yoctoproject.org/linux-yocto.git;name=machine;branch=${KBRA
            git://git.yoctoproject.org/yocto-kernel-cache;type=kmeta;name=meta;branch=yocto-5.8;destsuffix=${KMETA}"
 
 LIC_FILES_CHKSUM = "file://COPYING;md5=6bc538ed5bd9a7fc9398086aedcd7e46"
-LINUX_VERSION ?= "5.8.11"
+LINUX_VERSION ?= "5.8.12"
 
 DEPENDS += "${@bb.utils.contains('ARCH', 'x86', 'elfutils-native', '', d)}"
 DEPENDS += "openssl-native util-linux-native"
-- 
2.19.1

