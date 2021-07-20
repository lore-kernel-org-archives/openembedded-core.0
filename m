Received: from mail-pf1-f174.google.com (mail-pf1-f174.google.com [209.85.210.174])
 by mx.groups.io with SMTP id smtpd.web09.641.1626818251932929227
 for <openembedded-core@lists.openembedded.org>;
 Tue, 20 Jul 2021 14:57:32 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@sakoman-com.20150623.gappssmtp.com header.s=20150623 header.b=oPqAR8B6;
 spf=softfail (domain: sakoman.com, ip: 209.85.210.174, mailfrom: steve@sakoman.com)
Received: by mail-pf1-f174.google.com with SMTP id a127so657985pfa.10
        for <openembedded-core@lists.openembedded.org>; Tue, 20 Jul 2021 14:57:31 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=sakoman-com.20150623.gappssmtp.com; s=20150623;
        h=from:to:subject:date:message-id:in-reply-to:references:mime-version
         :content-transfer-encoding;
        bh=hGGmwHk7S6lKxzLkj82OOyE9xeVS7AyFEa05MFBZk1k=;
        b=oPqAR8B65slqnKq0IfVw0iasio/Kw624ezzty0S895T6BiOTWriwr/nm9iZG0RiWaB
         QwluX+jfxOqamev9+s+n+m/Tm0zd6yzdlJ048CG4Dh81AXn3ymN0z9a23xrlpS+KxmVa
         5QLP8/Tquj9GXBG/PNfcD3K4V8LysJv5E3MPoGn3MWmNGS0Vi6LYTr0es/CRPTGsWgRK
         oP7chx2O9HgoBldyHaIK+Pzg9uVIr7roe3Lqjwv1PxMM47Ye1j++lxdPEs95qdvk2+c7
         71joAKt8UdbjgQxD3/ri8f3JUnSvLSEDd77Gyc+UI90e8lkXCgbWTud7JvQX931QwoZ5
         zoGw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=hGGmwHk7S6lKxzLkj82OOyE9xeVS7AyFEa05MFBZk1k=;
        b=lRJ4ba1BnZ51vKad1O4EBSDlvjS+/4j6TYMppPY20/WW1t4LjJwUUmd4xYs2TjkDc+
         M/ZcDNzxmh/cu5Ubjzv/cY1wfES0KSR3M+4mceYu565ktkI9ndFBxoqeIXmZKCKfZt6D
         PMhhcjMrF8FLZXLXyjB/kKCamAe7pDCtG5SC3brML7j+tph81uHUQIHimoqg1RFpmpKi
         l1oTvx45rpanK7gc8x3XjTguJmuFQ+PoImzo+Wta+mz2FNLcEK7+wnWe9BsDoXP/WRrN
         zPH14esDMWwOopntn0GpmcPV9XkMdk/nS1AJpZqsiepczIjrbYLmafRFrm2Deg8SCeTs
         0xAA==
X-Gm-Message-State: AOAM531KEUPtonVRms2VEtYORN+d/SlokTgoD0ZGZwFnbnex72W/err0
	+/PCc0iBNZ69cARM77LvbFhA3CMXRfdbVbYZ
X-Google-Smtp-Source: ABdhPJzyF3H8OqKhBFP1KokyWcaj0F/7uZ1eE08TuSfa8sfmF7zaXLOZJLRhwl5u97FSb3SaeEk9rw==
X-Received: by 2002:aa7:8696:0:b029:32a:75ef:8f6c with SMTP id d22-20020aa786960000b029032a75ef8f6cmr33505631pfo.69.1626818251044;
        Tue, 20 Jul 2021 14:57:31 -0700 (PDT)
Return-Path: <steve@sakoman.com>
Received: from hexa.router0800d9.com (rrcs-66-91-142-162.west.biz.rr.com. [66.91.142.162])
        by smtp.gmail.com with ESMTPSA id r7sm3556874pjl.16.2021.07.20.14.57.29
        for <openembedded-core@lists.openembedded.org>
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 20 Jul 2021 14:57:30 -0700 (PDT)
From: "Steve Sakoman" <steve@sakoman.com>
To: openembedded-core@lists.openembedded.org
Subject: [OE-core][dunfell 1/3] linux-yocto/5.4: update to v5.4.131
Date: Tue, 20 Jul 2021 11:57:14 -1000
Message-Id: <8c3a582b00842baeea8fdaaa81d641b998fc78a4.1626818018.git.steve@sakoman.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <cover.1626818018.git.steve@sakoman.com>
References: <cover.1626818018.git.steve@sakoman.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

From: Bruce Ashfield <bruce.ashfield@gmail.com>

Updating linux-yocto/5.4 to the latest korg -stable release that comprises
the following commits:

    e8d9b740a550 Linux 5.4.131
    d2f8a8a07ee3 xen/events: reset active flag for lateeoi events later
    a05499b29a6e KVM: SVM: Call SEV Guest Decommission if ASID binding fails
    58356f448b61 s390/stack: fix possible register corruption with stack switch helper
    abbd42939db6 KVM: SVM: Periodically schedule when unregistering regions on destroy
    8b24c7edc2f2 Linux 5.4.130
    5e8519c4083b RDMA/mlx5: Block FDB rules when not in switchdev mode
    c5fb49e12f2c gpio: AMD8111 and TQMX86 require HAS_IOPORT_MAP
    cf5eb8209723 drm/nouveau: fix dma_address check for CPU/GPU sync
    3edfd34f1338 scsi: sr: Return appropriate error code when disk is ejected
    a6c85a8433e0 x86/efi: remove unused variables

Signed-off-by: Bruce Ashfield <bruce.ashfield@gmail.com>
Signed-off-by: Alexandre Belloni <alexandre.belloni@bootlin.com>
Signed-off-by: Richard Purdie <richard.purdie@linuxfoundation.org>
(cherry picked from commit edfd97ac5a11f46b9f3b905373abe3554f4b85db)
Signed-off-by: Steve Sakoman <steve@sakoman.com>
---
 .../linux/linux-yocto-rt_5.4.bb               |  6 ++---
 .../linux/linux-yocto-tiny_5.4.bb             |  8 +++----
 meta/recipes-kernel/linux/linux-yocto_5.4.bb  | 22 +++++++++----------
 3 files changed, 18 insertions(+), 18 deletions(-)

diff --git a/meta/recipes-kernel/linux/linux-yocto-rt_5.4.bb b/meta/recipes-kernel/linux/linux-yocto-rt_5.4.bb
index ba186a1868..5a299a8dc6 100644
--- a/meta/recipes-kernel/linux/linux-yocto-rt_5.4.bb
+++ b/meta/recipes-kernel/linux/linux-yocto-rt_5.4.bb
@@ -11,13 +11,13 @@ python () {
         raise bb.parse.SkipRecipe("Set PREFERRED_PROVIDER_virtual/kernel to linux-yocto-rt to enable it")
 }
 
-SRCREV_machine ?= "c86c4081f4764f57bbb26df8a9202c01799c3771"
-SRCREV_meta ?= "c5e5dc4e13bd4882a8ed96b8026e6fd268b68f8a"
+SRCREV_machine ?= "2bfba6ef5182dbebe73e576c6d8a629285148215"
+SRCREV_meta ?= "4a0bfc329c4d858e5259e05479716cbe34eeecd7"
 
 SRC_URI = "git://git.yoctoproject.org/linux-yocto.git;branch=${KBRANCH};name=machine \
            git://git.yoctoproject.org/yocto-kernel-cache;type=kmeta;name=meta;branch=yocto-5.4;destsuffix=${KMETA}"
 
-LINUX_VERSION ?= "5.4.129"
+LINUX_VERSION ?= "5.4.131"
 
 LIC_FILES_CHKSUM = "file://COPYING;md5=bbea815ee2795b2f4230826c0c6b8814"
 
diff --git a/meta/recipes-kernel/linux/linux-yocto-tiny_5.4.bb b/meta/recipes-kernel/linux/linux-yocto-tiny_5.4.bb
index 5d487ac23f..33d65466a1 100644
--- a/meta/recipes-kernel/linux/linux-yocto-tiny_5.4.bb
+++ b/meta/recipes-kernel/linux/linux-yocto-tiny_5.4.bb
@@ -6,7 +6,7 @@ KCONFIG_MODE = "--allnoconfig"
 
 require recipes-kernel/linux/linux-yocto.inc
 
-LINUX_VERSION ?= "5.4.129"
+LINUX_VERSION ?= "5.4.131"
 LIC_FILES_CHKSUM = "file://COPYING;md5=bbea815ee2795b2f4230826c0c6b8814"
 
 DEPENDS += "${@bb.utils.contains('ARCH', 'x86', 'elfutils-native', '', d)}"
@@ -15,9 +15,9 @@ DEPENDS += "openssl-native util-linux-native"
 KMETA = "kernel-meta"
 KCONF_BSP_AUDIT_LEVEL = "2"
 
-SRCREV_machine_qemuarm ?= "ca636d1a2ccbb2626c4eacbdb0da2c30654b108c"
-SRCREV_machine ?= "d46f8ecb3f81bdba8131b90dc90174ecb36a1b78"
-SRCREV_meta ?= "c5e5dc4e13bd4882a8ed96b8026e6fd268b68f8a"
+SRCREV_machine_qemuarm ?= "88ff7ffcdf2653941105106e5e26717f0a78d7a9"
+SRCREV_machine ?= "b9bcd1be30f8be9c00797a6368a1f8df7aa21916"
+SRCREV_meta ?= "4a0bfc329c4d858e5259e05479716cbe34eeecd7"
 
 PV = "${LINUX_VERSION}+git${SRCPV}"
 
diff --git a/meta/recipes-kernel/linux/linux-yocto_5.4.bb b/meta/recipes-kernel/linux/linux-yocto_5.4.bb
index ae09736df0..123ac2221f 100644
--- a/meta/recipes-kernel/linux/linux-yocto_5.4.bb
+++ b/meta/recipes-kernel/linux/linux-yocto_5.4.bb
@@ -12,16 +12,16 @@ KBRANCH_qemux86  ?= "v5.4/standard/base"
 KBRANCH_qemux86-64 ?= "v5.4/standard/base"
 KBRANCH_qemumips64 ?= "v5.4/standard/mti-malta64"
 
-SRCREV_machine_qemuarm ?= "dfb964733268c1e6f932900a384a793a0ca8de34"
-SRCREV_machine_qemuarm64 ?= "7d3eac73a6edc8fdcd701bbb0aa8c21030eb2027"
-SRCREV_machine_qemumips ?= "a40b68f2f4be601dfe020940ad29ac894cc31298"
-SRCREV_machine_qemuppc ?= "a3258c8b1690ecfa620eae9552a75cec9224ecd4"
-SRCREV_machine_qemuriscv64 ?= "e211c039dcd85ad2d4c1f1a70909d0eefef49778"
-SRCREV_machine_qemux86 ?= "e211c039dcd85ad2d4c1f1a70909d0eefef49778"
-SRCREV_machine_qemux86-64 ?= "e211c039dcd85ad2d4c1f1a70909d0eefef49778"
-SRCREV_machine_qemumips64 ?= "dded4f6e58cd90c7333b5257c9327e5e30f78e26"
-SRCREV_machine ?= "e211c039dcd85ad2d4c1f1a70909d0eefef49778"
-SRCREV_meta ?= "c5e5dc4e13bd4882a8ed96b8026e6fd268b68f8a"
+SRCREV_machine_qemuarm ?= "1fe32172ee9971daa7debf3fc8165b6ccb80fe85"
+SRCREV_machine_qemuarm64 ?= "087640d0be07b7160b8012ee0e0b08c21915a632"
+SRCREV_machine_qemumips ?= "2e6db18dd388f7b35f70727556e5e55556b5d0a4"
+SRCREV_machine_qemuppc ?= "672230448073e1342fb18137654abff89baacf5f"
+SRCREV_machine_qemuriscv64 ?= "c36ad648e4430819de715bba70fb735ac1f16878"
+SRCREV_machine_qemux86 ?= "c36ad648e4430819de715bba70fb735ac1f16878"
+SRCREV_machine_qemux86-64 ?= "c36ad648e4430819de715bba70fb735ac1f16878"
+SRCREV_machine_qemumips64 ?= "92e0699c1dfc9e9fe6b2dd0015f36a7fcc76092c"
+SRCREV_machine ?= "c36ad648e4430819de715bba70fb735ac1f16878"
+SRCREV_meta ?= "4a0bfc329c4d858e5259e05479716cbe34eeecd7"
 
 # remap qemuarm to qemuarma15 for the 5.4 kernel
 # KMACHINE_qemuarm ?= "qemuarma15"
@@ -30,7 +30,7 @@ SRC_URI = "git://git.yoctoproject.org/linux-yocto.git;name=machine;branch=${KBRA
            git://git.yoctoproject.org/yocto-kernel-cache;type=kmeta;name=meta;branch=yocto-5.4;destsuffix=${KMETA}"
 
 LIC_FILES_CHKSUM = "file://COPYING;md5=bbea815ee2795b2f4230826c0c6b8814"
-LINUX_VERSION ?= "5.4.129"
+LINUX_VERSION ?= "5.4.131"
 
 DEPENDS += "${@bb.utils.contains('ARCH', 'x86', 'elfutils-native', '', d)}"
 DEPENDS += "openssl-native util-linux-native"
-- 
2.25.1

