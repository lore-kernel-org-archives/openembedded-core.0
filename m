Received: from mail-pg1-f169.google.com (mail-pg1-f169.google.com [209.85.215.169])
 by mx.groups.io with SMTP id smtpd.web10.6702.1607350377162589739
 for <openembedded-core@lists.openembedded.org>;
 Mon, 07 Dec 2020 06:12:57 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@sakoman-com.20150623.gappssmtp.com header.s=20150623 header.b=A6FWQ/v0;
 spf=softfail (domain: sakoman.com, ip: 209.85.215.169, mailfrom: steve@sakoman.com)
Received: by mail-pg1-f169.google.com with SMTP id w16so8955380pga.9
        for <openembedded-core@lists.openembedded.org>; Mon, 07 Dec 2020 06:12:57 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=sakoman-com.20150623.gappssmtp.com; s=20150623;
        h=from:to:subject:date:message-id:in-reply-to:references;
        bh=XgXEHR/uGv+9fw6XpnES0UrSAYgGeBEvRL0xSPmlsFc=;
        b=A6FWQ/v0ocjnKY6EebELwMFPnAafNG4fDFBcflQ290yjFHeH6xPb27ni/vvpLP/DTv
         T3AtEd9C92MWRpwOqYRZx7MA5kSayXecmXqy0mQzfmR1gij/iAkQOX/w4e2wWkx7QmmK
         og/np+/7XwtPbfGhbAp2dUgO4g0hYOcvGiNPSBr0ZoeIJruXS47Lot5/VwQCEwIjexsC
         xJpfyyJ+ine6/lG684fIssKfNUv60ibPyzSyIzfmT1PFpTE2/4SwWHa7znImH7wXTeWg
         qZl+97bV4yNRdOWapbkcjcENV9rk45cgLaKkxwQDNRcPQnMU57PZgevV04k+HtbaQmBE
         Uohg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:subject:date:message-id:in-reply-to
         :references;
        bh=XgXEHR/uGv+9fw6XpnES0UrSAYgGeBEvRL0xSPmlsFc=;
        b=qkfbVQz7IGNBFzZgivr0CisAkWGQH/fj4ZB366PyFQlLncS5eEWa27HFL01vSsfnFB
         KHTyQ1WDuO2tZsqbsSScNpjJ5E769iqJNt/2BK/Fmtn1C8ON6vepcXwM943OXVk9oVMB
         PtFMpVFgi8pZi7O2UmHVuTitmo44wfFvN325abH08lL4tByUf0AilyavOSthNbvic7uH
         8TZ9651q8u5iZRNLBVHfYftD+GlsxpEsD++Qc7egeArOtFdDowByTyiayv5ZXbnwDFTL
         IM++MNXGxDndZ2zxBsyB2ZStdVXLnet2Td4GQFi+7iXVlZGukHzmMaU9yGWLf2j5HjJN
         cGvQ==
X-Gm-Message-State: AOAM531VtFwyXP0Ui2As/pcSOKX1nIItjN04qHVSZa0WImnEWGxACZ8i
	0LZFxdiivoQp8ZeaEhIsXTcWVaWFm5srYh6S
X-Google-Smtp-Source: ABdhPJyjpl6MPD76C+xCjMifEizCcBn12bos1EatfxBgkVErt9quQ7SWzdDqsTjcRjFnagKaNeDP6A==
X-Received: by 2002:aa7:80c9:0:b029:197:6775:4a5b with SMTP id a9-20020aa780c90000b029019767754a5bmr16209643pfn.36.1607350376155;
        Mon, 07 Dec 2020 06:12:56 -0800 (PST)
Return-Path: <steve@sakoman.com>
Received: from octo.router0800d9.com (rrcs-66-91-142-162.west.biz.rr.com. [66.91.142.162])
        by smtp.gmail.com with ESMTPSA id u3sm14848093pfu.47.2020.12.07.06.12.54
        for <openembedded-core@lists.openembedded.org>
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 07 Dec 2020 06:12:55 -0800 (PST)
From: "Steve Sakoman" <steve@sakoman.com>
To: openembedded-core@lists.openembedded.org
Subject: [OE-core][dunfell 2/9] linux-yocto/5.4: update to v5.4.72
Date: Mon,  7 Dec 2020 04:12:19 -1000
Message-Id: <557ba35a9704f7cba8a2ff1cf4d3791e8bbe8538.1607350153.git.steve@sakoman.com>
X-Mailer: git-send-email 2.17.1
In-Reply-To: <cover.1607350153.git.steve@sakoman.com>
References: <cover.1607350153.git.steve@sakoman.com>

From: Bruce Ashfield <bruce.ashfield@gmail.com>

Updating linux-yocto/5.4 to the latest korg -stable release that comprises
the following commits:

    52f6ded2a377 Linux 5.4.72
    865b015e8d41 crypto: qat - check cipher length for aead AES-CBC-HMAC-SHA
    aa1167908ac4 crypto: bcm - Verify GCM/CCM key length in setkey
    564312e08892 xen/events: don't use chip_data for legacy IRQs
    041445d0d577 reiserfs: Fix oops during mount
    046616898a57 reiserfs: Initialize inode keys properly
    22ab9ca024a0 USB: serial: ftdi_sio: add support for FreeCalypso JTAG+UART adapters
    bfb1438e8c15 USB: serial: pl2303: add device-id for HP GC device
    aecf3a1c11dc staging: comedi: check validity of wMaxPacketSize of usb endpoints found
    8aff87284be6 USB: serial: option: Add Telit FT980-KS composition
    3c3eb734ef1f USB: serial: option: add Cellient MPL200 card
    b970578274e9 media: usbtv: Fix refcounting mixup
    6ad2e647d91f Bluetooth: Disconnect if E0 is used for Level 4
    21d2051d1f1c Bluetooth: Fix update of connection state in `hci_encrypt_cfm`
    ed6c361e3229 Bluetooth: Consolidate encryption handling in hci_encrypt_cfm
    155bf3fd4e8c Bluetooth: MGMT: Fix not checking if BT_HS is enabled
    66a14350de9a Bluetooth: L2CAP: Fix calling sk_filter on non-socket based channel
    0d9e9b6e1a26 Bluetooth: A2MP: Fix not initializing all members
    54f8badb9bc9 ACPI: Always build evged in
    30ddaa4c0c95 ARM: 8939/1: kbuild: use correct nm executable
    1bf467fdfeae btrfs: take overcommit into account in inc_block_group_ro
    39c5eb1482b2 btrfs: don't pass system_chunk into can_overcommit
    bc79abf4afea perf cs-etm: Move definition of 'traceid_list' global variable from header file

Signed-off-by: Bruce Ashfield <bruce.ashfield@gmail.com>
Signed-off-by: Richard Purdie <richard.purdie@linuxfoundation.org>
(cherry picked from commit 5da55c543cf38ca1082bc160fd571b3c7c6a40ba)
Signed-off-by: Steve Sakoman <steve@sakoman.com>
---
 .../linux/linux-yocto-rt_5.4.bb               |  6 ++---
 .../linux/linux-yocto-tiny_5.4.bb             |  8 +++----
 meta/recipes-kernel/linux/linux-yocto_5.4.bb  | 22 +++++++++----------
 3 files changed, 18 insertions(+), 18 deletions(-)

diff --git a/meta/recipes-kernel/linux/linux-yocto-rt_5.4.bb b/meta/recipes-kernel/linux/linux-yocto-rt_5.4.bb
index 92f6a30c34..827160b0f8 100644
--- a/meta/recipes-kernel/linux/linux-yocto-rt_5.4.bb
+++ b/meta/recipes-kernel/linux/linux-yocto-rt_5.4.bb
@@ -11,13 +11,13 @@ python () {
         raise bb.parse.SkipRecipe("Set PREFERRED_PROVIDER_virtual/kernel to linux-yocto-rt to enable it")
 }
 
-SRCREV_machine ?= "5488b835533bde7677d5c3f2e12470fe8eb1f946"
-SRCREV_meta ?= "bb39fa8ebe05b1a0663cb7e04b83c5708a43e168"
+SRCREV_machine ?= "a220745e2a874a1f56634152dba239070995a83b"
+SRCREV_meta ?= "a3bf06c1da96ff1a96ded5ae2e0a9d6b7825ab4b"
 
 SRC_URI = "git://git.yoctoproject.org/linux-yocto.git;branch=${KBRANCH};name=machine \
            git://git.yoctoproject.org/yocto-kernel-cache;type=kmeta;name=meta;branch=yocto-5.4;destsuffix=${KMETA}"
 
-LINUX_VERSION ?= "5.4.71"
+LINUX_VERSION ?= "5.4.72"
 
 LIC_FILES_CHKSUM = "file://COPYING;md5=bbea815ee2795b2f4230826c0c6b8814"
 
diff --git a/meta/recipes-kernel/linux/linux-yocto-tiny_5.4.bb b/meta/recipes-kernel/linux/linux-yocto-tiny_5.4.bb
index 9f27a0c47d..26c603dbfe 100644
--- a/meta/recipes-kernel/linux/linux-yocto-tiny_5.4.bb
+++ b/meta/recipes-kernel/linux/linux-yocto-tiny_5.4.bb
@@ -6,7 +6,7 @@ KCONFIG_MODE = "--allnoconfig"
 
 require recipes-kernel/linux/linux-yocto.inc
 
-LINUX_VERSION ?= "5.4.71"
+LINUX_VERSION ?= "5.4.72"
 LIC_FILES_CHKSUM = "file://COPYING;md5=bbea815ee2795b2f4230826c0c6b8814"
 
 DEPENDS += "${@bb.utils.contains('ARCH', 'x86', 'elfutils-native', '', d)}"
@@ -15,9 +15,9 @@ DEPENDS += "openssl-native util-linux-native"
 KMETA = "kernel-meta"
 KCONF_BSP_AUDIT_LEVEL = "2"
 
-SRCREV_machine_qemuarm ?= "3f21b080aecabda99b3ba488f7bb8835e03779f7"
-SRCREV_machine ?= "668108a47488da1a4e04ecff7ea5c34d7fb2719e"
-SRCREV_meta ?= "bb39fa8ebe05b1a0663cb7e04b83c5708a43e168"
+SRCREV_machine_qemuarm ?= "66a8c42b2503c35b2f309085b849edd4f214822b"
+SRCREV_machine ?= "f22b966f08d032f9b82a2c28a14ae5a0e12321f2"
+SRCREV_meta ?= "a3bf06c1da96ff1a96ded5ae2e0a9d6b7825ab4b"
 
 PV = "${LINUX_VERSION}+git${SRCPV}"
 
diff --git a/meta/recipes-kernel/linux/linux-yocto_5.4.bb b/meta/recipes-kernel/linux/linux-yocto_5.4.bb
index b341bf4a04..436c16e0e1 100644
--- a/meta/recipes-kernel/linux/linux-yocto_5.4.bb
+++ b/meta/recipes-kernel/linux/linux-yocto_5.4.bb
@@ -12,16 +12,16 @@ KBRANCH_qemux86  ?= "v5.4/standard/base"
 KBRANCH_qemux86-64 ?= "v5.4/standard/base"
 KBRANCH_qemumips64 ?= "v5.4/standard/mti-malta64"
 
-SRCREV_machine_qemuarm ?= "f14906a7f7547ce17fadb77a883a96471cb8efdf"
-SRCREV_machine_qemuarm64 ?= "668108a47488da1a4e04ecff7ea5c34d7fb2719e"
-SRCREV_machine_qemumips ?= "0a724c6a22022929cc8f952f9f2f22126b6965ed"
-SRCREV_machine_qemuppc ?= "668108a47488da1a4e04ecff7ea5c34d7fb2719e"
-SRCREV_machine_qemuriscv64 ?= "668108a47488da1a4e04ecff7ea5c34d7fb2719e"
-SRCREV_machine_qemux86 ?= "668108a47488da1a4e04ecff7ea5c34d7fb2719e"
-SRCREV_machine_qemux86-64 ?= "668108a47488da1a4e04ecff7ea5c34d7fb2719e"
-SRCREV_machine_qemumips64 ?= "c279484fbef538f67662c3b845b13407e467d610"
-SRCREV_machine ?= "668108a47488da1a4e04ecff7ea5c34d7fb2719e"
-SRCREV_meta ?= "bb39fa8ebe05b1a0663cb7e04b83c5708a43e168"
+SRCREV_machine_qemuarm ?= "938960a91a6e4e55f867722d43b7c0110113eebf"
+SRCREV_machine_qemuarm64 ?= "f22b966f08d032f9b82a2c28a14ae5a0e12321f2"
+SRCREV_machine_qemumips ?= "b8f39a8dad8c8a5ceaca8bd0ddfd4505dc219c0d"
+SRCREV_machine_qemuppc ?= "f22b966f08d032f9b82a2c28a14ae5a0e12321f2"
+SRCREV_machine_qemuriscv64 ?= "f22b966f08d032f9b82a2c28a14ae5a0e12321f2"
+SRCREV_machine_qemux86 ?= "f22b966f08d032f9b82a2c28a14ae5a0e12321f2"
+SRCREV_machine_qemux86-64 ?= "f22b966f08d032f9b82a2c28a14ae5a0e12321f2"
+SRCREV_machine_qemumips64 ?= "530c7d0e9e387aab458ede6dc80cd3903c09c0ba"
+SRCREV_machine ?= "f22b966f08d032f9b82a2c28a14ae5a0e12321f2"
+SRCREV_meta ?= "a3bf06c1da96ff1a96ded5ae2e0a9d6b7825ab4b"
 
 # remap qemuarm to qemuarma15 for the 5.4 kernel
 # KMACHINE_qemuarm ?= "qemuarma15"
@@ -30,7 +30,7 @@ SRC_URI = "git://git.yoctoproject.org/linux-yocto.git;name=machine;branch=${KBRA
            git://git.yoctoproject.org/yocto-kernel-cache;type=kmeta;name=meta;branch=yocto-5.4;destsuffix=${KMETA}"
 
 LIC_FILES_CHKSUM = "file://COPYING;md5=bbea815ee2795b2f4230826c0c6b8814"
-LINUX_VERSION ?= "5.4.71"
+LINUX_VERSION ?= "5.4.72"
 
 DEPENDS += "${@bb.utils.contains('ARCH', 'x86', 'elfutils-native', '', d)}"
 DEPENDS += "openssl-native util-linux-native"
-- 
2.17.1

