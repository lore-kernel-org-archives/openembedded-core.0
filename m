Received: from mail-pf1-f194.google.com (mail-pf1-f194.google.com [209.85.210.194])
 by mx.groups.io with SMTP id smtpd.web10.6598.1601504136040285279
 for <openembedded-core@lists.openembedded.org>;
 Wed, 30 Sep 2020 15:15:36 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@sakoman-com.20150623.gappssmtp.com header.s=20150623 header.b=H3grhDNf;
 spf=softfail (domain: sakoman.com, ip: 209.85.210.194, mailfrom: steve@sakoman.com)
Received: by mail-pf1-f194.google.com with SMTP id n14so2347257pff.6
        for <openembedded-core@lists.openembedded.org>; Wed, 30 Sep 2020 15:15:36 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=sakoman-com.20150623.gappssmtp.com; s=20150623;
        h=from:to:subject:date:message-id:in-reply-to:references;
        bh=MeCcZuDkzcx/pOGWEJj2kXuvKP/k2Cuap8Gipreco7c=;
        b=H3grhDNfM5cwv4RgSH81qtJQ3XWNeGRdu1VxCixHEq3AkLORv7LwDElQAgfhDzgz7m
         MIQ2InF6gj8h7IXKQey4vDNKMZ+/bUMkpHh+6XkBxrv3JcZmrPKPamKKl9DZiJaA1qtg
         1i80JuHZJBCB2liO5hVd50QS1jFDB3zZg8lGKUETzocs/HXzpFTwrr/eEsYH19/vbe3x
         vaxNn9CP2BCoJ/63QpRmoo6aqEC4Qs1BJ84oYeuvUkGB8Rsw4bpK8FekGgeW/33r00zE
         /EA9f6NoJ6yqL+QXxNgljWybMuYm3Pua/2zCDPQ95wSO12EKClaJxeWiqF6oI7qne+7T
         O+Ng==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:subject:date:message-id:in-reply-to
         :references;
        bh=MeCcZuDkzcx/pOGWEJj2kXuvKP/k2Cuap8Gipreco7c=;
        b=URz2JY+ud3KBr3qkhcDjnPRImis3EBri2Ih8+lq+3mZWDp6SyiXpOuyqzB7v4AAOhQ
         nZet8d1ZjAlEF6RMdYlQDsBcvYRnes19bm1/lQUP04OJBvbx1OBx+CdLY8SMJ5/iD25Z
         ULfoGJR1LTTqZgK3MAXhMrFRZPd7G2tMh/l0UXJ9MMR3sPMPTiWxZqDYZSRBJ8t8gP9c
         a60iV4fWnlWpzIIJaLos4aeLhxjNFk3jIRUL69dn0lzVbKxQwtYtHRoYopQM2ORBwZyG
         cgdHbe0KWK0epq/O/IkN0ogEBHLP874mdOKrQHHVYZR57jfs9LDcYFSK/JvKz48p0b/3
         27AQ==
X-Gm-Message-State: AOAM5331b6z1BnoJ3ATCHx5iYsj++xupdEpyeylMXKH/ZH8by7hJZVZD
	izcW6PpW6Oc5/UE+uwapCcM68a1XwFz+s7qyLYQ=
X-Google-Smtp-Source: ABdhPJx4NCTpHCQYdIE0FZMfExQJacYrgJd0jbMzlm1sdN1pKHnt49BN50IRfvUGx42XHh6X7awQjg==
X-Received: by 2002:a17:902:c40a:b029:d2:564a:6128 with SMTP id k10-20020a170902c40ab02900d2564a6128mr4340246plk.49.1601504134142;
        Wed, 30 Sep 2020 15:15:34 -0700 (PDT)
Return-Path: <steve@sakoman.com>
Received: from octo.router0800d9.com (rrcs-66-91-142-162.west.biz.rr.com. [66.91.142.162])
        by smtp.gmail.com with ESMTPSA id k6sm3488799pfh.92.2020.09.30.15.15.32
        for <openembedded-core@lists.openembedded.org>
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 30 Sep 2020 15:15:33 -0700 (PDT)
From: "Steve Sakoman" <steve@sakoman.com>
To: openembedded-core@lists.openembedded.org
Subject: [OE-core][dunfell 36/41] linux-yocto/5.4: update to v5.4.65
Date: Wed, 30 Sep 2020 12:11:38 -1000
Message-Id: <d5b45e81adf16c8b15a981ca9ef79bfea3ffe2dd.1601502610.git.steve@sakoman.com>
X-Mailer: git-send-email 2.17.1
In-Reply-To: <cover.1601502610.git.steve@sakoman.com>
References: <cover.1601502610.git.steve@sakoman.com>

From: Bruce Ashfield <bruce.ashfield@gmail.com>

Updating linux-yocto/5.4 to the latest korg -stable release that comprises
the following commits:

    6c3d34dea2fc Linux 5.4.65
    ddb279d64b72 net: disable netpoll on fresh napis
    09c45065257b tipc: fix shutdown() of connectionless socket
    b95eb482c288 taprio: Fix using wrong queues in gate mask
    20f8c874789a sctp: not disable bh in the whole sctp_get_port_local()
    8b61bb0b2d57 net: usb: dm9601: Add USB ID of Keenetic Plus DSL
    346fefa82325 netlabel: fix problems with mapping removal
    3f73dbf94f8f ipv6: Fix sysctl max for fib_multipath_hash_policy
    263e463358d3 ipv4: Silence suspicious RCU usage warning

Signed-off-by: Bruce Ashfield <bruce.ashfield@gmail.com>
(cherry picked from commit e2cb6e8b433614a8512739ea5583914d9ef978fc)
Signed-off-by: Steve Sakoman <steve@sakoman.com>
---
 .../linux/linux-yocto-rt_5.4.bb               |  6 ++---
 .../linux/linux-yocto-tiny_5.4.bb             |  8 +++----
 meta/recipes-kernel/linux/linux-yocto_5.4.bb  | 22 +++++++++----------
 3 files changed, 18 insertions(+), 18 deletions(-)

diff --git a/meta/recipes-kernel/linux/linux-yocto-rt_5.4.bb b/meta/recipes-kernel/linux/linux-yocto-rt_5.4.bb
index 97cb7d934f..73876bb99e 100644
--- a/meta/recipes-kernel/linux/linux-yocto-rt_5.4.bb
+++ b/meta/recipes-kernel/linux/linux-yocto-rt_5.4.bb
@@ -11,13 +11,13 @@ python () {
         raise bb.parse.SkipRecipe("Set PREFERRED_PROVIDER_virtual/kernel to linux-yocto-rt to enable it")
 }
 
-SRCREV_machine ?= "b170a5953260ea7d7bdfcf223fb92d138eb7db67"
-SRCREV_meta ?= "34b6e8caf82c411655d33e0eeff6700a8de1f6fc"
+SRCREV_machine ?= "1d9e25c4f35155580cef313ff2a76de545124a1d"
+SRCREV_meta ?= "0d860e075788a92601dff3eb9b615ee41e465040"
 
 SRC_URI = "git://git.yoctoproject.org/linux-yocto.git;branch=${KBRANCH};name=machine \
            git://git.yoctoproject.org/yocto-kernel-cache;type=kmeta;name=meta;branch=yocto-5.4;destsuffix=${KMETA}"
 
-LINUX_VERSION ?= "5.4.64"
+LINUX_VERSION ?= "5.4.65"
 
 LIC_FILES_CHKSUM = "file://COPYING;md5=bbea815ee2795b2f4230826c0c6b8814"
 
diff --git a/meta/recipes-kernel/linux/linux-yocto-tiny_5.4.bb b/meta/recipes-kernel/linux/linux-yocto-tiny_5.4.bb
index 7d836593c9..853fc93694 100644
--- a/meta/recipes-kernel/linux/linux-yocto-tiny_5.4.bb
+++ b/meta/recipes-kernel/linux/linux-yocto-tiny_5.4.bb
@@ -6,7 +6,7 @@ KCONFIG_MODE = "--allnoconfig"
 
 require recipes-kernel/linux/linux-yocto.inc
 
-LINUX_VERSION ?= "5.4.64"
+LINUX_VERSION ?= "5.4.65"
 LIC_FILES_CHKSUM = "file://COPYING;md5=bbea815ee2795b2f4230826c0c6b8814"
 
 DEPENDS += "${@bb.utils.contains('ARCH', 'x86', 'elfutils-native', '', d)}"
@@ -15,9 +15,9 @@ DEPENDS += "openssl-native util-linux-native"
 KMETA = "kernel-meta"
 KCONF_BSP_AUDIT_LEVEL = "2"
 
-SRCREV_machine_qemuarm ?= "3bd01ef1ebb9b2a9bbae3c35eb9d640cd1ab9da7"
-SRCREV_machine ?= "86d9bf1c575ada30e515b9337a0ba3fe07986091"
-SRCREV_meta ?= "34b6e8caf82c411655d33e0eeff6700a8de1f6fc"
+SRCREV_machine_qemuarm ?= "bb77791bc00cfa70211dd238d312b4db950c0808"
+SRCREV_machine ?= "406008bf3232dfc9e63b6e7bf745ca883c45041e"
+SRCREV_meta ?= "0d860e075788a92601dff3eb9b615ee41e465040"
 
 PV = "${LINUX_VERSION}+git${SRCPV}"
 
diff --git a/meta/recipes-kernel/linux/linux-yocto_5.4.bb b/meta/recipes-kernel/linux/linux-yocto_5.4.bb
index f59126ce7f..88a582dd4e 100644
--- a/meta/recipes-kernel/linux/linux-yocto_5.4.bb
+++ b/meta/recipes-kernel/linux/linux-yocto_5.4.bb
@@ -12,16 +12,16 @@ KBRANCH_qemux86  ?= "v5.4/standard/base"
 KBRANCH_qemux86-64 ?= "v5.4/standard/base"
 KBRANCH_qemumips64 ?= "v5.4/standard/mti-malta64"
 
-SRCREV_machine_qemuarm ?= "33ab5549b39d7bbfc067f13527bfa817250c69a3"
-SRCREV_machine_qemuarm64 ?= "86d9bf1c575ada30e515b9337a0ba3fe07986091"
-SRCREV_machine_qemumips ?= "7954ad760bd317039a9ad44300a8bf1a34107fc8"
-SRCREV_machine_qemuppc ?= "86d9bf1c575ada30e515b9337a0ba3fe07986091"
-SRCREV_machine_qemuriscv64 ?= "86d9bf1c575ada30e515b9337a0ba3fe07986091"
-SRCREV_machine_qemux86 ?= "86d9bf1c575ada30e515b9337a0ba3fe07986091"
-SRCREV_machine_qemux86-64 ?= "86d9bf1c575ada30e515b9337a0ba3fe07986091"
-SRCREV_machine_qemumips64 ?= "91fb319534f5206619aa04556dbf32d49afa1080"
-SRCREV_machine ?= "86d9bf1c575ada30e515b9337a0ba3fe07986091"
-SRCREV_meta ?= "34b6e8caf82c411655d33e0eeff6700a8de1f6fc"
+SRCREV_machine_qemuarm ?= "894e63d3256613faa39931a6ae505cfd196df067"
+SRCREV_machine_qemuarm64 ?= "406008bf3232dfc9e63b6e7bf745ca883c45041e"
+SRCREV_machine_qemumips ?= "aa13fdb2c5f8c4e4e432bfee6df9c8f76ec8ac70"
+SRCREV_machine_qemuppc ?= "406008bf3232dfc9e63b6e7bf745ca883c45041e"
+SRCREV_machine_qemuriscv64 ?= "406008bf3232dfc9e63b6e7bf745ca883c45041e"
+SRCREV_machine_qemux86 ?= "406008bf3232dfc9e63b6e7bf745ca883c45041e"
+SRCREV_machine_qemux86-64 ?= "406008bf3232dfc9e63b6e7bf745ca883c45041e"
+SRCREV_machine_qemumips64 ?= "4fb21d604fc54db63221ea28ab90622c29d74202"
+SRCREV_machine ?= "406008bf3232dfc9e63b6e7bf745ca883c45041e"
+SRCREV_meta ?= "0d860e075788a92601dff3eb9b615ee41e465040"
 
 # remap qemuarm to qemuarma15 for the 5.4 kernel
 # KMACHINE_qemuarm ?= "qemuarma15"
@@ -30,7 +30,7 @@ SRC_URI = "git://git.yoctoproject.org/linux-yocto.git;name=machine;branch=${KBRA
            git://git.yoctoproject.org/yocto-kernel-cache;type=kmeta;name=meta;branch=yocto-5.4;destsuffix=${KMETA}"
 
 LIC_FILES_CHKSUM = "file://COPYING;md5=bbea815ee2795b2f4230826c0c6b8814"
-LINUX_VERSION ?= "5.4.64"
+LINUX_VERSION ?= "5.4.65"
 
 DEPENDS += "${@bb.utils.contains('ARCH', 'x86', 'elfutils-native', '', d)}"
 DEPENDS += "openssl-native util-linux-native"
-- 
2.17.1

