Received: from mail-qt1-f195.google.com (mail-qt1-f195.google.com [209.85.160.195])
 by mx.groups.io with SMTP id smtpd.web12.14213.1605813478970347728
 for <openembedded-core@lists.openembedded.org>;
 Thu, 19 Nov 2020 11:17:59 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20161025 header.b=sn2oqj/D;
 spf=pass (domain: gmail.com, ip: 209.85.160.195, mailfrom: bruce.ashfield@gmail.com)
Received: by mail-qt1-f195.google.com with SMTP id m65so5204259qte.11
        for <openembedded-core@lists.openembedded.org>; Thu, 19 Nov 2020 11:17:58 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:content-transfer-encoding;
        bh=sDCmITWt0D1FHd/43BPPcDrVQaPN7ohkw1d+KLGxtKI=;
        b=sn2oqj/DFzGvA+CTn5VrvIipjJt3FAU2TBLVj/XygYSUyX2C7il8V2kGt//7ac2wQk
         NQ65qwyL7PW0Ou4oXc5q+YMS/nxFAU/+nBWDFSqszLa+trfG4GHqgkkYvs/GcHN9P5Dr
         0naRhpY9rcD+R4cIWCLmBv9F5SieR2Bk07eudZxHiMTi5MZp27rjiM2UNxE3oSVaLlfE
         mviJoVF97zKArA7RiMeVH1wyQW8ChP9MhHewwF3EsSiTJnvrLaYAcR0nlRKC8fThjDwk
         tkHdGQwBUrciqCpUpwHstmG+P3fAm5tp0uD/s9EEzyWqqFlUOYqmcMDcnrKUvr0tvEmN
         zOkQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=sDCmITWt0D1FHd/43BPPcDrVQaPN7ohkw1d+KLGxtKI=;
        b=ci3lvohUKRcO1elt3jcIbIynCKhXlNWYhUzhnpbHSZzhkep3s6+iQHU2PqdwR1HUej
         e+hrtT7rkVRcn6lqBthtMMyhgOTOGCAygJaneY7D25XHy2yseSS9ySu2oDITKKWzyMN0
         iRDtzY6rHidU9U1pxVVj9aTE2nP/pC9r3R4+wZomFSH9+lwvj2ubBEYIH4Byur+hg+2i
         fYyYLFy2ZN9AWSS5gkuGxB9iJDbL6kCqji8lctBaO8YK59avM3AyF3cNJvU3zNVSjeM0
         i4/IV35s1IFPp9DW7Io9sZ0U3TVZZY2KgOPwCt4C4Yja++xcatjE6//rrIKF8Lr8YWGj
         J7rg==
X-Gm-Message-State: AOAM531fvJj0isC9VyoCcMUM1QqWmT/9fp7lOOFL69NYmpqWQKRv629o
	IjMqXwHktgUzI1RDbO9bJYYqFlc+m7wbaZT3
X-Google-Smtp-Source: ABdhPJyW+gWTYQO6EjzaXzgrMclo41UbQVhhyr2O5psf5nyMpLhZfsBDXiTYN6RNWdUD6STdyjPgdw==
X-Received: by 2002:ac8:71d9:: with SMTP id i25mr11913361qtp.218.1605813478075;
        Thu, 19 Nov 2020 11:17:58 -0800 (PST)
Return-Path: <bruce.ashfield@gmail.com>
Received: from localhost.localdomain (cpe04d4c4975b80-cm64777d5e8820.cpe.net.cable.rogers.com. [174.112.165.127])
        by smtp.gmail.com with ESMTPSA id l22sm478684qke.118.2020.11.19.11.17.57
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 19 Nov 2020 11:17:57 -0800 (PST)
From: "Bruce Ashfield" <bruce.ashfield@gmail.com>
To: richard.purdie@linuxfoundation.org
Cc: openembedded-core@lists.openembedded.org
Subject: [PATCH 3/5] linux-yocto/5.8: perf: Alias SYS_futex with SYS_futex_time64 on 32-bit arches with 64bit time_t
Date: Thu, 19 Nov 2020 14:17:50 -0500
Message-Id: <0721fd9c4fc0373bfcec65cac9c54a96cd89c046.1605813340.git.bruce.ashfield@gmail.com>
X-Mailer: git-send-email 2.19.1
In-Reply-To: <cover.1605813340.git.bruce.ashfield@gmail.com>
References: <cover.1605813340.git.bruce.ashfield@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

From: Bruce Ashfield <bruce.ashfield@gmail.com>

Integrating the following commit(s) to linux-yocto/5.8:

    52b840afae05 perf: Alias SYS_futex with SYS_futex_time64 on 32-bit arches with 64bit time_t

Signed-off-by: Bruce Ashfield <bruce.ashfield@gmail.com>
---
 .../recipes-kernel/linux/linux-yocto-rt_5.8.bb |  2 +-
 .../linux/linux-yocto-tiny_5.8.bb              |  4 ++--
 meta/recipes-kernel/linux/linux-yocto_5.8.bb   | 18 +++++++++---------
 3 files changed, 12 insertions(+), 12 deletions(-)

diff --git a/meta/recipes-kernel/linux/linux-yocto-rt_5.8.bb b/meta/recipes-kernel/linux/linux-yocto-rt_5.8.bb
index 203ddf6684..c2d627acb7 100644
--- a/meta/recipes-kernel/linux/linux-yocto-rt_5.8.bb
+++ b/meta/recipes-kernel/linux/linux-yocto-rt_5.8.bb
@@ -11,7 +11,7 @@ python () {
         raise bb.parse.SkipRecipe("Set PREFERRED_PROVIDER_virtual/kernel to linux-yocto-rt to enable it")
 }
 
-SRCREV_machine ?= "64fd51cbe98ae4a0e05e59ed9abd9135f1b4cf64"
+SRCREV_machine ?= "52b840afae058fb20ce69ff5af811f8582b3bb5a"
 SRCREV_meta ?= "7883b60d324029d26020c0b3f826b35c52fd9674"
 
 SRC_URI = "git://git.yoctoproject.org/linux-yocto.git;branch=${KBRANCH};name=machine \
diff --git a/meta/recipes-kernel/linux/linux-yocto-tiny_5.8.bb b/meta/recipes-kernel/linux/linux-yocto-tiny_5.8.bb
index f37f525cc3..31a84f3972 100644
--- a/meta/recipes-kernel/linux/linux-yocto-tiny_5.8.bb
+++ b/meta/recipes-kernel/linux/linux-yocto-tiny_5.8.bb
@@ -15,8 +15,8 @@ DEPENDS += "openssl-native util-linux-native"
 KMETA = "kernel-meta"
 KCONF_BSP_AUDIT_LEVEL = "2"
 
-SRCREV_machine_qemuarm ?= "aa614dcf182db126013b255968ab125afd96eb88"
-SRCREV_machine ?= "64fd51cbe98ae4a0e05e59ed9abd9135f1b4cf64"
+SRCREV_machine_qemuarm ?= "3e9aa72b02cf7d04096e367c99d503cd1d26cc6c"
+SRCREV_machine ?= "52b840afae058fb20ce69ff5af811f8582b3bb5a"
 SRCREV_meta ?= "7883b60d324029d26020c0b3f826b35c52fd9674"
 
 PV = "${LINUX_VERSION}+git${SRCPV}"
diff --git a/meta/recipes-kernel/linux/linux-yocto_5.8.bb b/meta/recipes-kernel/linux/linux-yocto_5.8.bb
index c0cdffce73..c6fb9e9f86 100644
--- a/meta/recipes-kernel/linux/linux-yocto_5.8.bb
+++ b/meta/recipes-kernel/linux/linux-yocto_5.8.bb
@@ -12,15 +12,15 @@ KBRANCH_qemux86  ?= "v5.8/standard/base"
 KBRANCH_qemux86-64 ?= "v5.8/standard/base"
 KBRANCH_qemumips64 ?= "v5.8/standard/mti-malta64"
 
-SRCREV_machine_qemuarm ?= "cd6c8c74317d2f9504c25e28e37f4140deec2d19"
-SRCREV_machine_qemuarm64 ?= "64fd51cbe98ae4a0e05e59ed9abd9135f1b4cf64"
-SRCREV_machine_qemumips ?= "c610a204d0821f5abc253e72894fd32b41b92db3"
-SRCREV_machine_qemuppc ?= "64fd51cbe98ae4a0e05e59ed9abd9135f1b4cf64"
-SRCREV_machine_qemuriscv64 ?= "64fd51cbe98ae4a0e05e59ed9abd9135f1b4cf64"
-SRCREV_machine_qemux86 ?= "64fd51cbe98ae4a0e05e59ed9abd9135f1b4cf64"
-SRCREV_machine_qemux86-64 ?= "64fd51cbe98ae4a0e05e59ed9abd9135f1b4cf64"
-SRCREV_machine_qemumips64 ?= "86cc0d9a3f6751ada12fa4630b3e3c23221d6da7"
-SRCREV_machine ?= "64fd51cbe98ae4a0e05e59ed9abd9135f1b4cf64"
+SRCREV_machine_qemuarm ?= "0c6d276c75233f9b8d05103ff652676a2c271868"
+SRCREV_machine_qemuarm64 ?= "52b840afae058fb20ce69ff5af811f8582b3bb5a"
+SRCREV_machine_qemumips ?= "4c07d59936f8e28eadecab8f56ef14726f77ccb8"
+SRCREV_machine_qemuppc ?= "52b840afae058fb20ce69ff5af811f8582b3bb5a"
+SRCREV_machine_qemuriscv64 ?= "52b840afae058fb20ce69ff5af811f8582b3bb5a"
+SRCREV_machine_qemux86 ?= "52b840afae058fb20ce69ff5af811f8582b3bb5a"
+SRCREV_machine_qemux86-64 ?= "52b840afae058fb20ce69ff5af811f8582b3bb5a"
+SRCREV_machine_qemumips64 ?= "2224bf83cf372bb729583dfb93ad28abba9905fd"
+SRCREV_machine ?= "52b840afae058fb20ce69ff5af811f8582b3bb5a"
 SRCREV_meta ?= "7883b60d324029d26020c0b3f826b35c52fd9674"
 
 # remap qemuarm to qemuarma15 for the 5.8 kernel
-- 
2.19.1

