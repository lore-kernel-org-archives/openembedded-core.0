Received: from mail-pj1-f68.google.com (mail-pj1-f68.google.com [209.85.216.68])
 by mx.groups.io with SMTP id smtpd.web12.45030.1597677146359452381
 for <openembedded-core@lists.openembedded.org>;
 Mon, 17 Aug 2020 08:12:26 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@sakoman-com.20150623.gappssmtp.com header.s=20150623 header.b=HM7s67Lx;
 spf=softfail (domain: sakoman.com, ip: 209.85.216.68, mailfrom: steve@sakoman.com)
Received: by mail-pj1-f68.google.com with SMTP id l60so7969041pjb.3
        for <openembedded-core@lists.openembedded.org>; Mon, 17 Aug 2020 08:12:26 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=sakoman-com.20150623.gappssmtp.com; s=20150623;
        h=from:to:subject:date:message-id:in-reply-to:references;
        bh=uaFRp2Oa2GfiP65Jj1Mt3ICgax8E8HI8HK5vM5DcYrw=;
        b=HM7s67LxxR3j2B/TraD7mLrhSzBlCTorSlJF7AlUyYmN0rWkHj9ybwCw1Naan1ZM9S
         wv1BmSZjuiaX/pD7l2PsMhBtrQDVZQXXssb4Y0K/08Oplulek/McKlyotyyq0+P1XJ7P
         ObVsXzrCYvminK6bxhdQ3rn1z6H6m3Gm8GEgjfXBcOPMMl1mqA9PfN6ur9vsm9aIoCZu
         CidXcpOxN9ux5S12WAyNRHRVkmlwh9jGTcZ1itdFVv5rzsmr8vWJDttzX4ZdoE48UcWG
         29Ss0qBZtRV+Li5YAVyRKu9k+9SLyHKZNRnQDtO233+8qRgubWH7MWBlbSgtUtb5r8ob
         bfvA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:subject:date:message-id:in-reply-to
         :references;
        bh=uaFRp2Oa2GfiP65Jj1Mt3ICgax8E8HI8HK5vM5DcYrw=;
        b=ZrdGehcm72FRxsl24RH/1Ffvxdv194M/VrmR2N9xE9LaMUfNvrL+ut11RV0iNYSYsQ
         1PMnJo0kLISob7rnBUH0pguSeD//KSpIy5AbksrDtafrdk9+E0ZwWW4opTd3nYtxdFGB
         pk084SOUO7XlyUgBww4qBbK7iLgr2vGupAQTDgQzpoeTr0gv/rcfW1/M3sBlUU7aByp5
         fL2MrR5h4QzI9UcDg9nkfYnQCBikbp4b0tavY+/61AKirhdYy1KoAPC2w1AOk1PAnYyF
         9rQYlIL0aDBWLWBXsa7pjufwOJyyKHgcWOH0UxcjHN/gbWxIeF2JQF6ebT/bLh3NMSvL
         iNHg==
X-Gm-Message-State: AOAM531aghKMJxRvRPWqmBlZsAcMpJE6r4i4nCcm0neoYHyjU7nVxh2M
	l2eMhuJXKpcr/UmathUsgE5EG99FB3oXAz2G2/4=
X-Google-Smtp-Source: ABdhPJxRFo260XnPS7WBoIEZAxWEXEY/CeE1EZdSMC+pqkv9wfLei+QNMtxTpkkEXzB2ATqHnrSf9w==
X-Received: by 2002:a17:90a:c201:: with SMTP id e1mr12738045pjt.142.1597677145312;
        Mon, 17 Aug 2020 08:12:25 -0700 (PDT)
Return-Path: <steve@sakoman.com>
Received: from octo.router0800d9.com (rrcs-66-91-142-162.west.biz.rr.com. [66.91.142.162])
        by smtp.gmail.com with ESMTPSA id w15sm19547363pjk.13.2020.08.17.08.12.24
        for <openembedded-core@lists.openembedded.org>
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 17 Aug 2020 08:12:24 -0700 (PDT)
From: "Steve Sakoman" <steve@sakoman.com>
To: openembedded-core@lists.openembedded.org
Subject: [OE-core][dunfell 7/7] linux-yocto/5.4: update to v5.4.57
Date: Mon, 17 Aug 2020 05:11:51 -1000
Message-Id: <553a96644957ca6ad0f13b75a6e3a596357d1d52.1597676744.git.steve@sakoman.com>
X-Mailer: git-send-email 2.17.1
In-Reply-To: <cover.1597676744.git.steve@sakoman.com>
References: <cover.1597676744.git.steve@sakoman.com>

From: Bruce Ashfield <bruce.ashfield@gmail.com>

Updating linux-yocto/5.4 to the latest korg -stable release that comprises
the following commits:

    d9939285fc81 Linux 5.4.57
    ca7ace8fd26d bpf: sockmap: Require attach_bpf_fd when detaching a program
    9fe975acb53f selftests: bpf: Fix detach from sockmap tests
    c77610435355 ext4: fix direct I/O read error
    6330b0cb2ace arm64: Workaround circular dependency in pointer_auth.h
    f06d60ff794a random32: move the pseudo-random 32-bit definitions to prandom.h
    c131009987f2 random32: remove net_rand_state from the latent entropy gcc plugin
    7471f3228e7a random: fix circular include dependency on arm64 after addition of percpu.h
    50bf89625bba ARM: percpu.h: fix build error
    c15a77bdda2c random32: update the net random state on interrupt and activity

Signed-off-by: Bruce Ashfield <bruce.ashfield@gmail.com>
Signed-off-by: Richard Purdie <richard.purdie@linuxfoundation.org>
(cherry picked from commit 00ea26a7e535c70998a5b9228185403e3f440042)
Signed-off-by: Steve Sakoman <steve@sakoman.com>
---
 .../linux/linux-yocto-rt_5.4.bb               |  6 ++---
 .../linux/linux-yocto-tiny_5.4.bb             |  8 +++----
 meta/recipes-kernel/linux/linux-yocto_5.4.bb  | 22 +++++++++----------
 3 files changed, 18 insertions(+), 18 deletions(-)

diff --git a/meta/recipes-kernel/linux/linux-yocto-rt_5.4.bb b/meta/recipes-kernel/linux/linux-yocto-rt_5.4.bb
index 56f6c2462a..24cc5353e3 100644
--- a/meta/recipes-kernel/linux/linux-yocto-rt_5.4.bb
+++ b/meta/recipes-kernel/linux/linux-yocto-rt_5.4.bb
@@ -11,13 +11,13 @@ python () {
         raise bb.parse.SkipRecipe("Set PREFERRED_PROVIDER_virtual/kernel to linux-yocto-rt to enable it")
 }
 
-SRCREV_machine ?= "de6b368e4875392d9dc0342a0991f74285e4955d"
-SRCREV_meta ?= "33bd5e8ac6fa46d5d7891b6e850603159f095b1a"
+SRCREV_machine ?= "9b7e1eef068382c132768964ccac22d35ac05d7b"
+SRCREV_meta ?= "4aeda12f7f7eb84613ae1fe6e22cd9cd9790c20b"
 
 SRC_URI = "git://git.yoctoproject.org/linux-yocto.git;branch=${KBRANCH};name=machine \
            git://git.yoctoproject.org/yocto-kernel-cache;type=kmeta;name=meta;branch=yocto-5.4;destsuffix=${KMETA}"
 
-LINUX_VERSION ?= "5.4.56"
+LINUX_VERSION ?= "5.4.57"
 
 LIC_FILES_CHKSUM = "file://COPYING;md5=bbea815ee2795b2f4230826c0c6b8814"
 
diff --git a/meta/recipes-kernel/linux/linux-yocto-tiny_5.4.bb b/meta/recipes-kernel/linux/linux-yocto-tiny_5.4.bb
index 4aeb560f2a..c4bdfd61b1 100644
--- a/meta/recipes-kernel/linux/linux-yocto-tiny_5.4.bb
+++ b/meta/recipes-kernel/linux/linux-yocto-tiny_5.4.bb
@@ -6,7 +6,7 @@ KCONFIG_MODE = "--allnoconfig"
 
 require recipes-kernel/linux/linux-yocto.inc
 
-LINUX_VERSION ?= "5.4.56"
+LINUX_VERSION ?= "5.4.57"
 LIC_FILES_CHKSUM = "file://COPYING;md5=bbea815ee2795b2f4230826c0c6b8814"
 
 DEPENDS += "${@bb.utils.contains('ARCH', 'x86', 'elfutils-native', '', d)}"
@@ -15,9 +15,9 @@ DEPENDS += "openssl-native util-linux-native"
 KMETA = "kernel-meta"
 KCONF_BSP_AUDIT_LEVEL = "2"
 
-SRCREV_machine_qemuarm ?= "0f2bcc4968dd118d71c06c59f3159b8fd0eafbe9"
-SRCREV_machine ?= "eaeb8b7e17aaf93a3b727a51731b1c9a3916009f"
-SRCREV_meta ?= "33bd5e8ac6fa46d5d7891b6e850603159f095b1a"
+SRCREV_machine_qemuarm ?= "afcbe2154b65d2ab1da70eaf38388b3c64366f8f"
+SRCREV_machine ?= "d3100abbe1a46aeefdf62d6a31fed31e94b9537d"
+SRCREV_meta ?= "4aeda12f7f7eb84613ae1fe6e22cd9cd9790c20b"
 
 PV = "${LINUX_VERSION}+git${SRCPV}"
 
diff --git a/meta/recipes-kernel/linux/linux-yocto_5.4.bb b/meta/recipes-kernel/linux/linux-yocto_5.4.bb
index 8874c40623..8014d2ec29 100644
--- a/meta/recipes-kernel/linux/linux-yocto_5.4.bb
+++ b/meta/recipes-kernel/linux/linux-yocto_5.4.bb
@@ -12,16 +12,16 @@ KBRANCH_qemux86  ?= "v5.4/standard/base"
 KBRANCH_qemux86-64 ?= "v5.4/standard/base"
 KBRANCH_qemumips64 ?= "v5.4/standard/mti-malta64"
 
-SRCREV_machine_qemuarm ?= "078735bf2317d85576c7d144b867c13c02dfc317"
-SRCREV_machine_qemuarm64 ?= "eaeb8b7e17aaf93a3b727a51731b1c9a3916009f"
-SRCREV_machine_qemumips ?= "7db7c284d5a9fb3a19d3c0ee1218be340cd48506"
-SRCREV_machine_qemuppc ?= "eaeb8b7e17aaf93a3b727a51731b1c9a3916009f"
-SRCREV_machine_qemuriscv64 ?= "eaeb8b7e17aaf93a3b727a51731b1c9a3916009f"
-SRCREV_machine_qemux86 ?= "eaeb8b7e17aaf93a3b727a51731b1c9a3916009f"
-SRCREV_machine_qemux86-64 ?= "eaeb8b7e17aaf93a3b727a51731b1c9a3916009f"
-SRCREV_machine_qemumips64 ?= "dce45211b696761c4cef078eb682f278ea38a72b"
-SRCREV_machine ?= "eaeb8b7e17aaf93a3b727a51731b1c9a3916009f"
-SRCREV_meta ?= "33bd5e8ac6fa46d5d7891b6e850603159f095b1a"
+SRCREV_machine_qemuarm ?= "69c2cb15ed433d0c54548167b771aa86edf731b0"
+SRCREV_machine_qemuarm64 ?= "d3100abbe1a46aeefdf62d6a31fed31e94b9537d"
+SRCREV_machine_qemumips ?= "f0d91ff7f58bb7b6e6676abce3b2e56d8031c7a5"
+SRCREV_machine_qemuppc ?= "d3100abbe1a46aeefdf62d6a31fed31e94b9537d"
+SRCREV_machine_qemuriscv64 ?= "d3100abbe1a46aeefdf62d6a31fed31e94b9537d"
+SRCREV_machine_qemux86 ?= "d3100abbe1a46aeefdf62d6a31fed31e94b9537d"
+SRCREV_machine_qemux86-64 ?= "d3100abbe1a46aeefdf62d6a31fed31e94b9537d"
+SRCREV_machine_qemumips64 ?= "053475d8f61a47f2aa66f2be0ca6c668a73ff784"
+SRCREV_machine ?= "d3100abbe1a46aeefdf62d6a31fed31e94b9537d"
+SRCREV_meta ?= "4aeda12f7f7eb84613ae1fe6e22cd9cd9790c20b"
 
 # remap qemuarm to qemuarma15 for the 5.4 kernel
 # KMACHINE_qemuarm ?= "qemuarma15"
@@ -30,7 +30,7 @@ SRC_URI = "git://git.yoctoproject.org/linux-yocto.git;name=machine;branch=${KBRA
            git://git.yoctoproject.org/yocto-kernel-cache;type=kmeta;name=meta;branch=yocto-5.4;destsuffix=${KMETA}"
 
 LIC_FILES_CHKSUM = "file://COPYING;md5=bbea815ee2795b2f4230826c0c6b8814"
-LINUX_VERSION ?= "5.4.56"
+LINUX_VERSION ?= "5.4.57"
 
 DEPENDS += "${@bb.utils.contains('ARCH', 'x86', 'elfutils-native', '', d)}"
 DEPENDS += "openssl-native util-linux-native"
-- 
2.17.1

