Received: from mail-qk1-f193.google.com (mail-qk1-f193.google.com [209.85.222.193])
 by mx.groups.io with SMTP id smtpd.web12.19240.1597251819350794402
 for <openembedded-core@lists.openembedded.org>;
 Wed, 12 Aug 2020 10:03:39 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20161025 header.b=XwM86BPF;
 spf=pass (domain: gmail.com, ip: 209.85.222.193, mailfrom: bruce.ashfield@gmail.com)
Received: by mail-qk1-f193.google.com with SMTP id p25so2719737qkp.2
        for <openembedded-core@lists.openembedded.org>; Wed, 12 Aug 2020 10:03:39 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:content-transfer-encoding;
        bh=DaAhV53lzgOcvA2ZBl2gPJnx/yEf3JfKnAK4bKKfsh8=;
        b=XwM86BPFGC5IAdV6Ilu8auvmhfNT95zZa/+Hl4lWNdVXyZL48jqya3zEvqAfh6RqCG
         V5Y8S/pzX9Y96k+ya/palnN3G+xtts6ZlW6+iV93tcNo3AnfF5tIrGwKrggEFzcY8Oh5
         9vTx+kkSBH0GrflQqhUFaA+PL/4fwfQL6Iq6CrGbHjOlXYfNQqRYFohyz8w8SjVnCauk
         XQv0mhHczxesZiLth+H8qSqhq/YTpCZhwJsmFL0GBiHVP41TFZsF9ZzclCYfe3XEbW/R
         NFKfzUyzVCpe7n+9D0O5OZOhUagiF/p/nqOjg9NEsdKltJI41huQ0CmbwLMZcJsB5q7k
         31VQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=DaAhV53lzgOcvA2ZBl2gPJnx/yEf3JfKnAK4bKKfsh8=;
        b=HNjAr0pojBbmIlCE9BfnKU4w17tCCt/GZIwSRL9Sceg5f+wX15GD93Q70XC0l5few5
         EPEtFlfiGQ2jaqG3YdfqSEdaLpwolB1eyB9nZuH9iSTBs5+wU0fdsRBFasKaTWuMJGzh
         hpkHPaK4Bag5OzG1xjDP/1hyEh0eR/7uRufP0HbyZuL7N5lT2vyuzOdfIEUt7iDeNQJB
         tz/t57SehbmXxE9TNGW6GzOY2mNMcYruABsl+bHRWZzV6jDsmIn2rpdL5hyY6njodjjK
         /GoiSoE3vhFS+XozT1xpT8+JamylFZl0OYtb4jTXIE+j+B5CyGs2ob8flLAR0bKw0wU1
         FV5w==
X-Gm-Message-State: AOAM533Ui/9Ha+pP8IGG6RmNp7RTnhoT4PTkTthXu+c2/KVM6FuQdTVw
	3qNgzS8Tn4eYe4qdmrGt/DiptGUf0TGDLQ==
X-Google-Smtp-Source: ABdhPJw0ol1D0b/wEC6q7JcwWYsK+pj4i3+3y2ElASO8AhfiGwYUPUlXFl9fvxg0b3gXHr2L34VqcA==
X-Received: by 2002:a05:620a:150f:: with SMTP id i15mr923846qkk.152.1597251818472;
        Wed, 12 Aug 2020 10:03:38 -0700 (PDT)
Return-Path: <bruce.ashfield@gmail.com>
Received: from localhost.localdomain (CPE04d4c4975b80-CM64777d5e8820.cpe.net.cable.rogers.com. [174.112.240.214])
        by smtp.gmail.com with ESMTPSA id k24sm3249977qtb.26.2020.08.12.10.03.37
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 12 Aug 2020 10:03:37 -0700 (PDT)
From: "Bruce Ashfield" <bruce.ashfield@gmail.com>
To: richard.purdie@linuxfoundation.org
Cc: openembedded-core@lists.openembedded.org
Subject: [PATCH 03/10] linux-yocto/5.4: update to v5.4.57
Date: Wed, 12 Aug 2020 13:03:24 -0400
Message-Id: <b9a2bd910d4e7d0dcfb519b52ffad22f52aecae6.1597203921.git.bruce.ashfield@gmail.com>
X-Mailer: git-send-email 2.19.1
In-Reply-To: <cover.1597203921.git.bruce.ashfield@gmail.com>
References: <cover.1597203921.git.bruce.ashfield@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

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
index 271490afc3..76cd3b3ea7 100644
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
2.19.1

