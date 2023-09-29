Return-Path: <bruce.ashfield@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 67CBAE728E6
	for <webhook@archiver.kernel.org>; Fri, 29 Sep 2023 20:05:05 +0000 (UTC)
Received: from mail-vs1-f49.google.com (mail-vs1-f49.google.com [209.85.217.49])
 by mx.groups.io with SMTP id smtpd.web11.27702.1696017899112251574
 for <openembedded-core@lists.openembedded.org>;
 Fri, 29 Sep 2023 13:04:59 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20230601 header.b=KQpyvV7f;
 spf=pass (domain: gmail.com, ip: 209.85.217.49, mailfrom: bruce.ashfield@gmail.com)
Received: by mail-vs1-f49.google.com with SMTP id ada2fe7eead31-4526a936dcaso6511320137.2
        for <openembedded-core@lists.openembedded.org>; Fri, 29 Sep 2023 13:04:59 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1696017898; x=1696622698; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=JrH2UWVU+TRPTxFwlw1m+LzdO844SXp/q/8j9PTMyL8=;
        b=KQpyvV7fmH6rYW2FCCYhfJLen8uzcHUo7w8TW59R8jmV9DK5JHx5eb6ZINY4WkHOQn
         KFn/flTbparaCFhGQtfmCXnMVeoUi+OtABJdWb/nHCi6jAMEVT1JISQ7WA9sKpIJI4kh
         AfgGzL+jpXa2nl3CDeaJiBxesRfdM2HTHSC109zy2xr8SZAZDSpzSfvXKv3tzVwhfoij
         S0jH6q+//WUzSBsKXG83oD4T6/qD3Bwemza6lg91Ds9QUE7xrdjWfBmbufE0NmaGc+Ak
         H3w10aeTQRcAA7z8IQXnzGeHX6IWiZf15LkxugoiNSSixuYB5EfSeYWQJgdTj8Ok7Sgv
         Uruw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1696017898; x=1696622698;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=JrH2UWVU+TRPTxFwlw1m+LzdO844SXp/q/8j9PTMyL8=;
        b=xCT1ciCQYQ0tcRGOb1p8laDbBjWsrOz9K2c6XrRF3d2yF0D87p/0crbns9vJZzSVj3
         OY5b7vehsfGIN1omtLBS8rCgKZUAKBbS6MYvgp9fXrSf1TED4LaSKcDnObQbcQme+mCd
         sqROTa2s5kBKp7v4uydjTG0YIMdkoHCyR0pSITi4h/MdbzeSTMI89A6qDstvndhX6Nre
         ZKHWw3/SqQINyoUrKnLoeTiYgLe2GWJnqmY2H3DlFEJ5dCVb1p+AANc4Zk99I+NJNXbA
         +vO8wUZLAWt4gk1VtFyqfvRxaPPRtBUu6cj6Wtb49P9vOqazaI7bf8W2FqSvEOBrWFqg
         lnFQ==
X-Gm-Message-State: AOJu0YypB3S6Uid9x5DegP+7jgKGDSiqDCjklNKOHhkv05V+ADNSW+Nq
	01tgZGxZqYYtUvYl2venkEoCHn009qy6qg==
X-Google-Smtp-Source: AGHT+IG0jm1AU3AY47Tsa/c7NCkwhW6zDVbRItDqFKghMrJf8hIjHpdVTCR1w4R51ft8GDHziYHEFA==
X-Received: by 2002:a67:f50a:0:b0:454:6faf:204d with SMTP id u10-20020a67f50a000000b004546faf204dmr6092138vsn.2.1696017897819;
        Fri, 29 Sep 2023 13:04:57 -0700 (PDT)
Received: from build.lan ([174.112.183.231])
        by smtp.gmail.com with ESMTPSA id t28-20020a0cb39c000000b0065cffe12ae9sm2115848qve.36.2023.09.29.13.04.56
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 29 Sep 2023 13:04:56 -0700 (PDT)
From: bruce.ashfield@gmail.com
To: richard.purdie@linuxfoundation.org
Cc: openembedded-core@lists.openembedded.org
Subject: [PATCH 01/10] linux-yocto/6.4: update to v6.4.15
Date: Fri, 29 Sep 2023 16:04:45 -0400
Message-Id: <f07fe5241cc272ce5a035b9ccfae5864f9ff7b20.1696017123.git.bruce.ashfield@gmail.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <cover.1696017123.git.bruce.ashfield@gmail.com>
References: <cover.1696017123.git.bruce.ashfield@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Fri, 29 Sep 2023 20:05:05 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/188420

From: Bruce Ashfield <bruce.ashfield@gmail.com>

Updating  to the latest korg -stable release that comprises
the following commits:

    f60d5fd5e950 Linux 6.4.15
    12ac1448ab77 pinctrl: amd: Don't show `Invalid config param` errors
    120e477de917 usb: typec: tcpci: clear the fault status bit
    46c11be2dca2 nilfs2: fix WARNING in mark_buffer_dirty due to discarded buffer reuse
    d53a0a737639 dt-bindings: sc16is7xx: Add property to change GPIO function
    f75a9a53327b tcpm: Avoid soft reset when partner does not support get_status
    c95605d5ed23 fsi: master-ast-cf: Add MODULE_FIRMWARE macro
    4c0dc67881c6 firmware: stratix10-svc: Fix an NULL vs IS_ERR() bug in probe
    43b5cedc3564 serial: sc16is7xx: fix bug when first setting GPIO direction
    e534d3e986fc serial: sc16is7xx: fix broken port 0 uart init
    e02214399ef4 serial: qcom-geni: fix opp vote on shutdown
    2f2b1f63a760 wifi: ath11k: Cleanup mac80211 references on failure during tx_complete
    f6909803263c wifi: ath11k: Don't drop tx_status when peer cannot be found
    c32e118debe9 wifi: rtw88: usb: kill and free rx urbs on probe failure
    e74778e91fed wifi: mt76: mt7921: fix skb leak by txs missing in AMSDU
    046378bdf9de wifi: mt76: mt7921: do not support one stream on secondary antenna only
    18a9d16f2fbe staging: rtl8712: fix race condition
    5db7c0f7fb51 HID: wacom: remove the battery when the EKR is off
    ae3f94d539a3 usb: chipidea: imx: improve logic if samsung,picophy-* parameter is 0
    ce06713e64e3 usb: dwc3: meson-g12a: do post init to fix broken usb after resumption
    596b16ee3f9a ALSA: usb-audio: Fix init call orders for UAC1
    c72b4c1c2407 USB: serial: option: add FOXCONN T99W368/T99W373 product
    7114ed5e53b0 USB: serial: option: add Quectel EM05G variant (0x030e)
    784a1fd76b74 modules: only allow symbol_get of EXPORT_SYMBOL_GPL modules
    f2114d34d6bb rtc: ds1685: use EXPORT_SYMBOL_GPL for ds1685_rtc_poweroff
    68a2c15de311 net: enetc: use EXPORT_SYMBOL_GPL for enetc_phc_index
    95dca60f39a6 mmc: au1xmmc: force non-modular build and remove symbol_get usage
    245bc3e5329e ARM: pxa: remove use of symbol_get()
    1c660940f525 ksmbd: reduce descriptor size if remaining bytes is less than request size
    1a13ecb96230 ksmbd: replace one-element array with flex-array member in struct smb2_ea_info
    7f1d6cb0eb6a ksmbd: fix slub overflow in ksmbd_decode_ntlmssp_auth_blob()
    a43bf41344d0 ksmbd: fix wrong DataOffset validation of create context
    9535cd211933 erofs: ensure that the post-EOF tails are all zeroed

Signed-off-by: Bruce Ashfield <bruce.ashfield@gmail.com>
---
 .../linux/cve-exclusion_6.4.inc               |  4 +--
 .../linux/linux-yocto-rt_6.4.bb               |  6 ++--
 .../linux/linux-yocto-tiny_6.4.bb             |  6 ++--
 meta/recipes-kernel/linux/linux-yocto_6.4.bb  | 28 +++++++++----------
 4 files changed, 22 insertions(+), 22 deletions(-)

diff --git a/meta/recipes-kernel/linux/cve-exclusion_6.4.inc b/meta/recipes-kernel/linux/cve-exclusion_6.4.inc
index 5a5eb9a755..fa3a4aed44 100644
--- a/meta/recipes-kernel/linux/cve-exclusion_6.4.inc
+++ b/meta/recipes-kernel/linux/cve-exclusion_6.4.inc
@@ -1,9 +1,9 @@
 
 # Auto-generated CVE metadata, DO NOT EDIT BY HAND.
-# Generated at 2023-09-07 15:30:03.897686+00:00 for version 6.4.14
+# Generated at 2023-09-08 09:02:15.787032 for version 6.4.15
 
 python check_kernel_cve_status_version() {
-    this_version = "6.4.14"
+    this_version = "6.4.15"
     kernel_version = d.getVar("LINUX_VERSION")
     if kernel_version != this_version:
         bb.warn("Kernel CVE status needs updating: generated for %s but kernel is %s" % (this_version, kernel_version))
diff --git a/meta/recipes-kernel/linux/linux-yocto-rt_6.4.bb b/meta/recipes-kernel/linux/linux-yocto-rt_6.4.bb
index aacbea40c0..07e852d584 100644
--- a/meta/recipes-kernel/linux/linux-yocto-rt_6.4.bb
+++ b/meta/recipes-kernel/linux/linux-yocto-rt_6.4.bb
@@ -14,13 +14,13 @@ python () {
         raise bb.parse.SkipRecipe("Set PREFERRED_PROVIDER_virtual/kernel to linux-yocto-rt to enable it")
 }
 
-SRCREV_machine ?= "06b99074bdc85095a2b3411dcade4a64a8e8f7c0"
-SRCREV_meta ?= "f12230a4c8a427af642be8196828a23f4562bc86"
+SRCREV_machine ?= "40f6eb23017e1bb31c63e980b6d11bc8e917824b"
+SRCREV_meta ?= "b1e8a40393e0ac784e05a45ee90b6680e3b53263"
 
 SRC_URI = "git://git.yoctoproject.org/linux-yocto.git;branch=${KBRANCH};name=machine;protocol=https \
            git://git.yoctoproject.org/yocto-kernel-cache;type=kmeta;name=meta;branch=yocto-6.4;destsuffix=${KMETA};protocol=https"
 
-LINUX_VERSION ?= "6.4.14"
+LINUX_VERSION ?= "6.4.15"
 
 LIC_FILES_CHKSUM = "file://COPYING;md5=6bc538ed5bd9a7fc9398086aedcd7e46"
 
diff --git a/meta/recipes-kernel/linux/linux-yocto-tiny_6.4.bb b/meta/recipes-kernel/linux/linux-yocto-tiny_6.4.bb
index c3a7a16342..74b830afb4 100644
--- a/meta/recipes-kernel/linux/linux-yocto-tiny_6.4.bb
+++ b/meta/recipes-kernel/linux/linux-yocto-tiny_6.4.bb
@@ -8,7 +8,7 @@ require recipes-kernel/linux/linux-yocto.inc
 # CVE exclusions
 include recipes-kernel/linux/cve-exclusion_6.4.inc
 
-LINUX_VERSION ?= "6.4.14"
+LINUX_VERSION ?= "6.4.15"
 LIC_FILES_CHKSUM = "file://COPYING;md5=6bc538ed5bd9a7fc9398086aedcd7e46"
 
 DEPENDS += "${@bb.utils.contains('ARCH', 'x86', 'elfutils-native', '', d)}"
@@ -17,8 +17,8 @@ DEPENDS += "openssl-native util-linux-native"
 KMETA = "kernel-meta"
 KCONF_BSP_AUDIT_LEVEL = "2"
 
-SRCREV_machine ?= "800df81fa2a8bacd6487a19115b3f89f34620249"
-SRCREV_meta ?= "f12230a4c8a427af642be8196828a23f4562bc86"
+SRCREV_machine ?= "3f60b22a4257993a1e389d46d1204a0f580fc99e"
+SRCREV_meta ?= "b1e8a40393e0ac784e05a45ee90b6680e3b53263"
 
 PV = "${LINUX_VERSION}+git"
 
diff --git a/meta/recipes-kernel/linux/linux-yocto_6.4.bb b/meta/recipes-kernel/linux/linux-yocto_6.4.bb
index e959b2a88f..d17f05eba4 100644
--- a/meta/recipes-kernel/linux/linux-yocto_6.4.bb
+++ b/meta/recipes-kernel/linux/linux-yocto_6.4.bb
@@ -18,25 +18,25 @@ KBRANCH:qemux86-64 ?= "v6.4/standard/base"
 KBRANCH:qemuloongarch64  ?= "v6.4/standard/base"
 KBRANCH:qemumips64 ?= "v6.4/standard/mti-malta64"
 
-SRCREV_machine:qemuarm ?= "0194f88dc4ac51536f9bb2bf751d256bc5fe5d69"
-SRCREV_machine:qemuarm64 ?= "800df81fa2a8bacd6487a19115b3f89f34620249"
-SRCREV_machine:qemuloongarch64 ?= "800df81fa2a8bacd6487a19115b3f89f34620249"
-SRCREV_machine:qemumips ?= "179200623f949dde2afeca75943700a2cd0684ab"
-SRCREV_machine:qemuppc ?= "800df81fa2a8bacd6487a19115b3f89f34620249"
-SRCREV_machine:qemuriscv64 ?= "800df81fa2a8bacd6487a19115b3f89f34620249"
-SRCREV_machine:qemuriscv32 ?= "800df81fa2a8bacd6487a19115b3f89f34620249"
-SRCREV_machine:qemux86 ?= "800df81fa2a8bacd6487a19115b3f89f34620249"
-SRCREV_machine:qemux86-64 ?= "800df81fa2a8bacd6487a19115b3f89f34620249"
-SRCREV_machine:qemumips64 ?= "4ce1ab0a4fce437802b0f7305289b036ffb4ccae"
-SRCREV_machine ?= "800df81fa2a8bacd6487a19115b3f89f34620249"
-SRCREV_meta ?= "f12230a4c8a427af642be8196828a23f4562bc86"
+SRCREV_machine:qemuarm ?= "47cff83414374714b911719ba588aa6e2816956b"
+SRCREV_machine:qemuarm64 ?= "3f60b22a4257993a1e389d46d1204a0f580fc99e"
+SRCREV_machine:qemuloongarch64 ?= "3f60b22a4257993a1e389d46d1204a0f580fc99e"
+SRCREV_machine:qemumips ?= "d3a6c87612629a4c1f722b7d93e9a04aec7b22a4"
+SRCREV_machine:qemuppc ?= "3f60b22a4257993a1e389d46d1204a0f580fc99e"
+SRCREV_machine:qemuriscv64 ?= "3f60b22a4257993a1e389d46d1204a0f580fc99e"
+SRCREV_machine:qemuriscv32 ?= "3f60b22a4257993a1e389d46d1204a0f580fc99e"
+SRCREV_machine:qemux86 ?= "3f60b22a4257993a1e389d46d1204a0f580fc99e"
+SRCREV_machine:qemux86-64 ?= "3f60b22a4257993a1e389d46d1204a0f580fc99e"
+SRCREV_machine:qemumips64 ?= "da59fe1c279b1be0b6b51dc503fe6500fdf84671"
+SRCREV_machine ?= "3f60b22a4257993a1e389d46d1204a0f580fc99e"
+SRCREV_meta ?= "b1e8a40393e0ac784e05a45ee90b6680e3b53263"
 
 # set your preferred provider of linux-yocto to 'linux-yocto-upstream', and you'll
 # get the <version>/base branch, which is pure upstream -stable, and the same
 # meta SRCREV as the linux-yocto-standard builds. Select your version using the
 # normal PREFERRED_VERSION settings.
 BBCLASSEXTEND = "devupstream:target"
-SRCREV_machine:class-devupstream ?= "babc8be398c3a0701e52582f93bfba946e9e5f8e"
+SRCREV_machine:class-devupstream ?= "f60d5fd5e950c89a38578ae6f25877de511bb031"
 PN:class-devupstream = "linux-yocto-upstream"
 KBRANCH:class-devupstream = "v6.4/base"
 
@@ -44,7 +44,7 @@ SRC_URI = "git://git.yoctoproject.org/linux-yocto.git;name=machine;branch=${KBRA
            git://git.yoctoproject.org/yocto-kernel-cache;type=kmeta;name=meta;branch=yocto-6.4;destsuffix=${KMETA};protocol=https"
 
 LIC_FILES_CHKSUM = "file://COPYING;md5=6bc538ed5bd9a7fc9398086aedcd7e46"
-LINUX_VERSION ?= "6.4.14"
+LINUX_VERSION ?= "6.4.15"
 
 PV = "${LINUX_VERSION}+git"
 
-- 
2.34.1


