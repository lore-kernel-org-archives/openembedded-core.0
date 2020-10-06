Received: from mail-qk1-f195.google.com (mail-qk1-f195.google.com [209.85.222.195])
 by mx.groups.io with SMTP id smtpd.web11.1795.1602011083211603956
 for <openembedded-core@lists.openembedded.org>;
 Tue, 06 Oct 2020 12:04:43 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20161025 header.b=GcCU5Wcw;
 spf=pass (domain: gmail.com, ip: 209.85.222.195, mailfrom: bruce.ashfield@gmail.com)
Received: by mail-qk1-f195.google.com with SMTP id b69so11268585qkg.8
        for <openembedded-core@lists.openembedded.org>; Tue, 06 Oct 2020 12:04:43 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:content-transfer-encoding;
        bh=dKsxtkuXQw4Z8DduvUa+7QgUAQKbw5//jmZmNfc1kQY=;
        b=GcCU5WcwO6XsWNvPSgnpey457/8VFac480wR1pmt2QI+c/9LL2WnUFKzuGu8lbl37B
         wXAPdFJl2myAXwzJki9pd6GyiZ3L75OF6zS8JjSuz23uWdm6Y7DNzcVslpjig6WhhbPi
         y/E7oiVyPgbVRlxkwQ4qDmASs/jw4kXE+dcfJiD4sByfIC9SWQBkuM3KYLqV6m6hKYlr
         SLu0lGqlUSmC/vcHCBqZTVk8AtQ1uty4jiM1F0UlJwZVV9JW1ssV+CyQ7Ty3txMouA4H
         IOA9yAOaBNBx+Xhuve83aclKFm2CfhaTOR+Vy1rOFHd//LckOxl4xXR32ImjZpQTuIye
         cR4g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=dKsxtkuXQw4Z8DduvUa+7QgUAQKbw5//jmZmNfc1kQY=;
        b=VI9q7O2sQOljwNAbEQDTmVTJn3KU30790Ng+jtOCJdmNJDswsBVFUhaq+Wc2w8qjTk
         tMf45E5pMAHrgIzMHXBg0tnxdCOnG7XQC5IZ+4U0qXneshi7KdNLI6VexBrbpkyVscUp
         4173ykuDPWA6F3U5u97/FLTPHNDzrllaaXPr2sd5P9MfY/G82I6moF1hcR7g36Ykh4RK
         DGjcjeDE1+UGsVtJ0erw/xv6WTx4vWA3F1hOvukII4vASzZ9EIQkDQjAuFnyUNCtkRW7
         xTvRpsh2c/TI/OF9Rr5TbCs23HscpjSEoY6Ban6be6wKvS2TioF1WeSbiGfga6iZtFqU
         D2VQ==
X-Gm-Message-State: AOAM530ToHw/MMjKmtT8oAgRVLYsYPHdOO80VRMFI+PRnAm0g2Yf2na3
	6Nagpk7GqPDzFVHI9jMVTeA=
X-Google-Smtp-Source: ABdhPJxEW429/S3lH1+TM/ecs9vip7VGiCaNipByrh6Wx8QoerON+d6XcAiELtE1cUou1In1yQybbA==
X-Received: by 2002:a37:c51:: with SMTP id 78mr10044qkm.30.1602011082222;
        Tue, 06 Oct 2020 12:04:42 -0700 (PDT)
Return-Path: <bruce.ashfield@gmail.com>
Received: from localhost.localdomain (CPE04d4c4975b80-CM64777d5e8820.cpe.net.cable.rogers.com. [174.112.240.214])
        by smtp.gmail.com with ESMTPSA id q19sm606604qtj.72.2020.10.06.12.04.41
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 06 Oct 2020 12:04:41 -0700 (PDT)
From: "Bruce Ashfield" <bruce.ashfield@gmail.com>
To: richard.purdie@linuxfoundation.org
Cc: openembedded-core@lists.openembedded.org
Subject: [PATCH 4/7] linux-yocto/5.4: update to v5.4.68
Date: Tue,  6 Oct 2020 15:04:31 -0400
Message-Id: <16ef5042fa655520bf3204d8eff40fda93394481.1602010969.git.bruce.ashfield@gmail.com>
X-Mailer: git-send-email 2.19.1
In-Reply-To: <cover.1602010968.git.bruce.ashfield@gmail.com>
References: <cover.1602010968.git.bruce.ashfield@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

From: Bruce Ashfield <bruce.ashfield@gmail.com>

Updating linux-yocto/5.4 to the latest korg -stable release that comprises
the following commits:

    5d087e3578cf Linux 5.4.68
    071f42defada iommu/amd: Use cmpxchg_double() when updating 128-bit IRTE
    a5bc1c7a9a6d mm: memcg: fix memcg reclaim soft lockup
    7f23aa7cabdd net: add __must_check to skb_put_padto()
    0d5a7af160bd net: qrtr: check skb_put_padto() return value
    e78590497f96 net: phy: Do not warn in phy_stop() on PHY_DOWN
    94f2dc7ad055 net: phy: Avoid NPD upon phy_detach() when driver is unbound
    8b6279822080 net: lantiq: Disable IRQs only if NAPI gets scheduled
    4c304ed93ad3 net: lantiq: Use napi_complete_done()
    9efed2a32a86 net: lantiq: use netif_tx_napi_add() for TX NAPI
    19dd093aa5b4 net: lantiq: Wake TX queue again
    743fead4d958 bnxt_en: Protect bnxt_set_eee() and bnxt_set_pauseparam() with mutex.
    e238cb110123 bnxt_en: return proper error codes in bnxt_show_temp
    1ee92ea9a1fb net/mlx5e: TLS, Do not expose FPGA TLS counter if not supported
    5b609d8e5beb net/mlx5e: Enable adding peer miss rules only if merged eswitch is supported
    825fc3167cf5 tipc: use skb_unshare() instead in tipc_buf_append()
    5efc178ebd12 tipc: fix shutdown() of connection oriented socket
    586b14ec481c tipc: Fix memory leak in tipc_group_create_member()
    83bd58952b2b taprio: Fix allowing too small intervals
    f705d35a0e93 nfp: use correct define to return NONE fec
    875f6478655b net: sctp: Fix IPv6 ancestor_size calc in sctp_copy_descendant
    884414196692 net: sch_generic: aviod concurrent reset and enqueue op for lockless qdisc
    891828a79bbc net/mlx5: Fix FTE cleanup
    242e12aecdd3 net: ipv6: fix kconfig dependency warning for IPV6_SEG6_HMAC
    d3c2188ee6e6 net: Fix bridge enslavement failure
    acd04a157b33 net: dsa: rtl8366: Properly clear member config
    9139f13e01a3 net: DCB: Validate DCB_ATTR_DCB_BUFFER argument
    450c0c00a5b0 net: bridge: br_vlan_get_pvid_rcu() should dereference the VLAN group under RCU
    d0b05f019f84 ipv6: avoid lockdep issue in fib6_del()
    860e2cc78c69 ipv4: Update exception handling for multipath routes via same device
    583ff79349f9 ipv4: Initialize flowi4_multipath_hash in data path
    f28bc7ea6978 ip: fix tos reflection in ack and reset packets
    c3de9daa6626 hdlc_ppp: add range checks in ppp_cp_parse_cr()
    745c24fd1d79 geneve: add transport ports in route lookup for geneve
    79cd5858ac05 cxgb4: Fix offset when clearing filter byte counters
    2583159735e4 cxgb4: fix memory leak during module unload
    6743a9b020fd bnxt_en: Fix NULL ptr dereference crash in bnxt_fw_reset_task()
    c7275d7a11ab bnxt_en: Avoid sending firmware messages when AER error is detected.
    61fd38db76ad act_ife: load meta modules before tcf_idr_check_alloc()
    263445256cd8 mm/thp: fix __split_huge_pmd_locked() for migration PMD
    e7b219bc7b59 kprobes: fix kill kprobe which has been marked as gone
    2906c6acda15 ibmvnic: add missing parenthesis in do_reset()
    c5ea71579254 ibmvnic fix NULL tx_pools and rx_tools issue at do_reset
    a769bff2333a af_key: pfkey_dump needs parameter validation

Signed-off-by: Bruce Ashfield <bruce.ashfield@gmail.com>
---
 .../linux/linux-yocto-rt_5.4.bb               |  6 ++---
 .../linux/linux-yocto-tiny_5.4.bb             |  8 +++----
 meta/recipes-kernel/linux/linux-yocto_5.4.bb  | 22 +++++++++----------
 3 files changed, 18 insertions(+), 18 deletions(-)

diff --git a/meta/recipes-kernel/linux/linux-yocto-rt_5.4.bb b/meta/recipes-kernel/linux/linux-yocto-rt_5.4.bb
index d549099520..96bf49ce88 100644
--- a/meta/recipes-kernel/linux/linux-yocto-rt_5.4.bb
+++ b/meta/recipes-kernel/linux/linux-yocto-rt_5.4.bb
@@ -11,13 +11,13 @@ python () {
         raise bb.parse.SkipRecipe("Set PREFERRED_PROVIDER_virtual/kernel to linux-yocto-rt to enable it")
 }
 
-SRCREV_machine ?= "c0b26698464b75654e2fd1a1fd9231d2cbb0fa88"
-SRCREV_meta ?= "60baed909b5629b59c42cdc7013765c753143e04"
+SRCREV_machine ?= "e38963298cea681462c0940c3b9dee0851e7ab85"
+SRCREV_meta ?= "5e9303083d0f115e021e4c73ee6a6f074c01fbca"
 
 SRC_URI = "git://git.yoctoproject.org/linux-yocto.git;branch=${KBRANCH};name=machine \
            git://git.yoctoproject.org/yocto-kernel-cache;type=kmeta;name=meta;branch=yocto-5.4;destsuffix=${KMETA}"
 
-LINUX_VERSION ?= "5.4.67"
+LINUX_VERSION ?= "5.4.68"
 
 LIC_FILES_CHKSUM = "file://COPYING;md5=bbea815ee2795b2f4230826c0c6b8814"
 
diff --git a/meta/recipes-kernel/linux/linux-yocto-tiny_5.4.bb b/meta/recipes-kernel/linux/linux-yocto-tiny_5.4.bb
index 989fff1354..f37e134c3f 100644
--- a/meta/recipes-kernel/linux/linux-yocto-tiny_5.4.bb
+++ b/meta/recipes-kernel/linux/linux-yocto-tiny_5.4.bb
@@ -6,7 +6,7 @@ KCONFIG_MODE = "--allnoconfig"
 
 require recipes-kernel/linux/linux-yocto.inc
 
-LINUX_VERSION ?= "5.4.67"
+LINUX_VERSION ?= "5.4.68"
 LIC_FILES_CHKSUM = "file://COPYING;md5=bbea815ee2795b2f4230826c0c6b8814"
 
 DEPENDS += "${@bb.utils.contains('ARCH', 'x86', 'elfutils-native', '', d)}"
@@ -15,9 +15,9 @@ DEPENDS += "openssl-native util-linux-native"
 KMETA = "kernel-meta"
 KCONF_BSP_AUDIT_LEVEL = "2"
 
-SRCREV_machine_qemuarm ?= "d4dc6b3d3702783af555accd4a4b04b791ec4650"
-SRCREV_machine ?= "308146497f82fcea7a9d7a721fcef7c35f3cb4af"
-SRCREV_meta ?= "60baed909b5629b59c42cdc7013765c753143e04"
+SRCREV_machine_qemuarm ?= "2744a3e76566b0e9b369c5af54651545ecbdfa19"
+SRCREV_machine ?= "abbdc58eb898303e2a268d3fabe5f49ccb12b89b"
+SRCREV_meta ?= "5e9303083d0f115e021e4c73ee6a6f074c01fbca"
 
 PV = "${LINUX_VERSION}+git${SRCPV}"
 
diff --git a/meta/recipes-kernel/linux/linux-yocto_5.4.bb b/meta/recipes-kernel/linux/linux-yocto_5.4.bb
index 266d6c159c..9b4d77a8aa 100644
--- a/meta/recipes-kernel/linux/linux-yocto_5.4.bb
+++ b/meta/recipes-kernel/linux/linux-yocto_5.4.bb
@@ -12,16 +12,16 @@ KBRANCH_qemux86  ?= "v5.4/standard/base"
 KBRANCH_qemux86-64 ?= "v5.4/standard/base"
 KBRANCH_qemumips64 ?= "v5.4/standard/mti-malta64"
 
-SRCREV_machine_qemuarm ?= "1cacaf327a609eac95b810a47b5178ef508a6984"
-SRCREV_machine_qemuarm64 ?= "308146497f82fcea7a9d7a721fcef7c35f3cb4af"
-SRCREV_machine_qemumips ?= "463a664b0d3b215fb4a083561a2420b26ef6be2e"
-SRCREV_machine_qemuppc ?= "308146497f82fcea7a9d7a721fcef7c35f3cb4af"
-SRCREV_machine_qemuriscv64 ?= "308146497f82fcea7a9d7a721fcef7c35f3cb4af"
-SRCREV_machine_qemux86 ?= "308146497f82fcea7a9d7a721fcef7c35f3cb4af"
-SRCREV_machine_qemux86-64 ?= "308146497f82fcea7a9d7a721fcef7c35f3cb4af"
-SRCREV_machine_qemumips64 ?= "2bbd27680546f778a06d45cc13ebc26c219bd5bd"
-SRCREV_machine ?= "308146497f82fcea7a9d7a721fcef7c35f3cb4af"
-SRCREV_meta ?= "60baed909b5629b59c42cdc7013765c753143e04"
+SRCREV_machine_qemuarm ?= "317c8079734e0cc7d473737677864edcacbabb06"
+SRCREV_machine_qemuarm64 ?= "abbdc58eb898303e2a268d3fabe5f49ccb12b89b"
+SRCREV_machine_qemumips ?= "5dbc5fdaa4ca0411cd4deae6c383335c0d35c178"
+SRCREV_machine_qemuppc ?= "abbdc58eb898303e2a268d3fabe5f49ccb12b89b"
+SRCREV_machine_qemuriscv64 ?= "abbdc58eb898303e2a268d3fabe5f49ccb12b89b"
+SRCREV_machine_qemux86 ?= "abbdc58eb898303e2a268d3fabe5f49ccb12b89b"
+SRCREV_machine_qemux86-64 ?= "abbdc58eb898303e2a268d3fabe5f49ccb12b89b"
+SRCREV_machine_qemumips64 ?= "a2c444c711717fe8296e875fe2e0961e6ff3627c"
+SRCREV_machine ?= "abbdc58eb898303e2a268d3fabe5f49ccb12b89b"
+SRCREV_meta ?= "5e9303083d0f115e021e4c73ee6a6f074c01fbca"
 
 # remap qemuarm to qemuarma15 for the 5.4 kernel
 # KMACHINE_qemuarm ?= "qemuarma15"
@@ -30,7 +30,7 @@ SRC_URI = "git://git.yoctoproject.org/linux-yocto.git;name=machine;branch=${KBRA
            git://git.yoctoproject.org/yocto-kernel-cache;type=kmeta;name=meta;branch=yocto-5.4;destsuffix=${KMETA}"
 
 LIC_FILES_CHKSUM = "file://COPYING;md5=bbea815ee2795b2f4230826c0c6b8814"
-LINUX_VERSION ?= "5.4.67"
+LINUX_VERSION ?= "5.4.68"
 
 DEPENDS += "${@bb.utils.contains('ARCH', 'x86', 'elfutils-native', '', d)}"
 DEPENDS += "openssl-native util-linux-native"
-- 
2.19.1

