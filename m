Received: from mail-qk1-f179.google.com (mail-qk1-f179.google.com [209.85.222.179])
 by mx.groups.io with SMTP id smtpd.web10.12121.1608647311794884101
 for <openembedded-core@lists.openembedded.org>;
 Tue, 22 Dec 2020 06:28:31 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20161025 header.b=nUz2ZpuK;
 spf=pass (domain: gmail.com, ip: 209.85.222.179, mailfrom: bruce.ashfield@gmail.com)
Received: by mail-qk1-f179.google.com with SMTP id z11so11957883qkj.7
        for <openembedded-core@lists.openembedded.org>; Tue, 22 Dec 2020 06:28:31 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:content-transfer-encoding;
        bh=fdR4SbxLsnSMB1L1ui/Vj5RSY4sNOfEHKwQGRl5V6W0=;
        b=nUz2ZpuKAtVitl0m5NerQeVYyph+verOm1v5+tUIXgvI+En9uOvQreMyQrtvplKNbg
         38tUwqwFfUPbe9w4kdPnjy+2GvSHd62PXIW4HsgksGdrPmQrqTOTzdBXiVvMmU3Wvrrq
         8roMELHSvoXON1CwpIfawoNFxcJK+n4d+D4KMpQz5V9MTwoUJLQ87LGZfMRLGjGEXVrE
         kZQO+Jxl4Wg97EmXVcx5xUPVzT7AV8ZmpfP3i1rbcuCogOJ9BMNfEywHzwRjdfuLOjkq
         xHsrqK+HV8m11QBsBnkymMG8Eq8JPUz3rOhlUVxcRwC8r3ifEWCZhGX/4BAJA/M8FBwG
         wstA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=fdR4SbxLsnSMB1L1ui/Vj5RSY4sNOfEHKwQGRl5V6W0=;
        b=d9t/Oa7UQT0NV3d1Q+NYUGU3z4L1CNT2P/s268aSzYRzKH955av02//n07CsbSn+F/
         RFHiDiVMib/iZpunnvfQyWF8LdGZt3+dmyk4yHpYqEs4qw11UTTJzkCG7Zz6At2oY75X
         cIR7OV2iaRol+30qot+0v+3RcEiQ8HVx41oFqodzNrga8KvBbiO/uUlDUgeBz/+3pkho
         xSkAdKoLx2C7YLqgvWSNj3ONcBNO+REB558hCi9KR6lWxabCdMM+fWM1gEf1Hshqj9B1
         3V/+2zil9PwEsaZXu1jbH9eP64dONySGFSMvmHwE4NZXOUqm+Spj50eFS3vn0cEjq2NX
         hyZA==
X-Gm-Message-State: AOAM530CrcXu3gn+lFlz9X6z/i1CNleMrnjkYLzVn3HOGyvozmiBzvGy
	nxME7x5pBMnACEXZUAA9/f4I7KqqTZQaeg==
X-Google-Smtp-Source: ABdhPJyH6J4hN5Dvst8FfEcMegeqpOThp7pGnwTYuYFTXXlmsc3mt7GB405na1X1FC8n4p8Yrr2Xag==
X-Received: by 2002:a37:6541:: with SMTP id z62mr22012416qkb.270.1608647310966;
        Tue, 22 Dec 2020 06:28:30 -0800 (PST)
Return-Path: <bruce.ashfield@gmail.com>
Received: from localhost.localdomain (cpe04d4c4975b80-cm64777d5e8820.cpe.net.cable.rogers.com. [174.112.165.127])
        by smtp.gmail.com with ESMTPSA id u65sm13169866qkb.58.2020.12.22.06.28.29
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 22 Dec 2020 06:28:30 -0800 (PST)
From: "Bruce Ashfield" <bruce.ashfield@gmail.com>
To: richard.purdie@linuxfoundation.org
Cc: openembedded-core@lists.openembedded.org
Subject: [PATCH 2/9] linux-yocto/cfg: qemuppc: set CONFIG_SCSI to '=y'
Date: Tue, 22 Dec 2020 09:28:19 -0500
Message-Id: <dc87d7fa7cb4fb8870daf5277aa9b993e371f9d6.1608646697.git.bruce.ashfield@gmail.com>
X-Mailer: git-send-email 2.19.1
In-Reply-To: <cover.1608646697.git.bruce.ashfield@gmail.com>
References: <cover.1608646697.git.bruce.ashfield@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

From: Bruce Ashfield <bruce.ashfield@gmail.com>

Integrating the following configuration commit(s):

    72a1fe336d7 qemuppc: configure the CONFIG_SCSI to '=y'

Signed-off-by: Bruce Ashfield <bruce.ashfield@gmail.com>
---
 meta/recipes-kernel/linux/linux-yocto-rt_5.4.bb   | 2 +-
 meta/recipes-kernel/linux/linux-yocto-rt_5.8.bb   | 2 +-
 meta/recipes-kernel/linux/linux-yocto-tiny_5.4.bb | 2 +-
 meta/recipes-kernel/linux/linux-yocto-tiny_5.8.bb | 2 +-
 meta/recipes-kernel/linux/linux-yocto_5.4.bb      | 2 +-
 meta/recipes-kernel/linux/linux-yocto_5.8.bb      | 2 +-
 6 files changed, 6 insertions(+), 6 deletions(-)

diff --git a/meta/recipes-kernel/linux/linux-yocto-rt_5.4.bb b/meta/recipes-kernel/linux/linux-yocto-rt_5.4.bb
index d415c3c63a..8bc93bf438 100644
--- a/meta/recipes-kernel/linux/linux-yocto-rt_5.4.bb
+++ b/meta/recipes-kernel/linux/linux-yocto-rt_5.4.bb
@@ -12,7 +12,7 @@ python () {
 }
 
 SRCREV_machine ?= "1ab0814d41526c27888888188d884884c8b4a52d"
-SRCREV_meta ?= "dfb689e49ce2b6a1790d0747d6041a961b812db5"
+SRCREV_meta ?= "72a1fe336d7a8cead351b894c266a205f23f213c"
 
 SRC_URI = "git://git.yoctoproject.org/linux-yocto.git;branch=${KBRANCH};name=machine \
            git://git.yoctoproject.org/yocto-kernel-cache;type=kmeta;name=meta;branch=yocto-5.4;destsuffix=${KMETA}"
diff --git a/meta/recipes-kernel/linux/linux-yocto-rt_5.8.bb b/meta/recipes-kernel/linux/linux-yocto-rt_5.8.bb
index 033dfc76a2..f5f7c87a31 100644
--- a/meta/recipes-kernel/linux/linux-yocto-rt_5.8.bb
+++ b/meta/recipes-kernel/linux/linux-yocto-rt_5.8.bb
@@ -12,7 +12,7 @@ python () {
 }
 
 SRCREV_machine ?= "3c5d210805d61bea8f8a8081e0e3a89ea8a61f3f"
-SRCREV_meta ?= "7883b60d324029d26020c0b3f826b35c52fd9674"
+SRCREV_meta ?= "7329d33cf8f25f433ce8ca95787e1743344f7c5d"
 
 SRC_URI = "git://git.yoctoproject.org/linux-yocto.git;branch=${KBRANCH};name=machine \
            git://git.yoctoproject.org/yocto-kernel-cache;type=kmeta;name=meta;branch=yocto-5.8;destsuffix=${KMETA}"
diff --git a/meta/recipes-kernel/linux/linux-yocto-tiny_5.4.bb b/meta/recipes-kernel/linux/linux-yocto-tiny_5.4.bb
index 33ca5856a3..3b462d5872 100644
--- a/meta/recipes-kernel/linux/linux-yocto-tiny_5.4.bb
+++ b/meta/recipes-kernel/linux/linux-yocto-tiny_5.4.bb
@@ -17,7 +17,7 @@ KCONF_BSP_AUDIT_LEVEL = "2"
 
 SRCREV_machine_qemuarm ?= "9a4d015ce467549f5f587a5001cd333ea7182aa2"
 SRCREV_machine ?= "6f1adec8376dc0bbf423afa02d7d9fa12b73d5b5"
-SRCREV_meta ?= "dfb689e49ce2b6a1790d0747d6041a961b812db5"
+SRCREV_meta ?= "72a1fe336d7a8cead351b894c266a205f23f213c"
 
 PV = "${LINUX_VERSION}+git${SRCPV}"
 
diff --git a/meta/recipes-kernel/linux/linux-yocto-tiny_5.8.bb b/meta/recipes-kernel/linux/linux-yocto-tiny_5.8.bb
index 50cee07620..4afddae092 100644
--- a/meta/recipes-kernel/linux/linux-yocto-tiny_5.8.bb
+++ b/meta/recipes-kernel/linux/linux-yocto-tiny_5.8.bb
@@ -17,7 +17,7 @@ KCONF_BSP_AUDIT_LEVEL = "2"
 
 SRCREV_machine_qemuarm ?= "9509db6e3ed6a23b1f7495b53248d1cbfe22710b"
 SRCREV_machine ?= "3c5d210805d61bea8f8a8081e0e3a89ea8a61f3f"
-SRCREV_meta ?= "7883b60d324029d26020c0b3f826b35c52fd9674"
+SRCREV_meta ?= "7329d33cf8f25f433ce8ca95787e1743344f7c5d"
 
 PV = "${LINUX_VERSION}+git${SRCPV}"
 
diff --git a/meta/recipes-kernel/linux/linux-yocto_5.4.bb b/meta/recipes-kernel/linux/linux-yocto_5.4.bb
index 1a14c8bdb5..456875a7b5 100644
--- a/meta/recipes-kernel/linux/linux-yocto_5.4.bb
+++ b/meta/recipes-kernel/linux/linux-yocto_5.4.bb
@@ -21,7 +21,7 @@ SRCREV_machine_qemux86 ?= "6f1adec8376dc0bbf423afa02d7d9fa12b73d5b5"
 SRCREV_machine_qemux86-64 ?= "6f1adec8376dc0bbf423afa02d7d9fa12b73d5b5"
 SRCREV_machine_qemumips64 ?= "f8d0d215cf1a02a1e2915b8d57fb8f9f29e5dc49"
 SRCREV_machine ?= "6f1adec8376dc0bbf423afa02d7d9fa12b73d5b5"
-SRCREV_meta ?= "dfb689e49ce2b6a1790d0747d6041a961b812db5"
+SRCREV_meta ?= "72a1fe336d7a8cead351b894c266a205f23f213c"
 
 # remap qemuarm to qemuarma15 for the 5.4 kernel
 # KMACHINE_qemuarm ?= "qemuarma15"
diff --git a/meta/recipes-kernel/linux/linux-yocto_5.8.bb b/meta/recipes-kernel/linux/linux-yocto_5.8.bb
index af576891e2..3f94d22654 100644
--- a/meta/recipes-kernel/linux/linux-yocto_5.8.bb
+++ b/meta/recipes-kernel/linux/linux-yocto_5.8.bb
@@ -21,7 +21,7 @@ SRCREV_machine_qemux86 ?= "3c5d210805d61bea8f8a8081e0e3a89ea8a61f3f"
 SRCREV_machine_qemux86-64 ?= "3c5d210805d61bea8f8a8081e0e3a89ea8a61f3f"
 SRCREV_machine_qemumips64 ?= "01a02b058f9a8941032b298b8d25c673526152f4"
 SRCREV_machine ?= "3c5d210805d61bea8f8a8081e0e3a89ea8a61f3f"
-SRCREV_meta ?= "7883b60d324029d26020c0b3f826b35c52fd9674"
+SRCREV_meta ?= "7329d33cf8f25f433ce8ca95787e1743344f7c5d"
 
 # remap qemuarm to qemuarma15 for the 5.8 kernel
 # KMACHINE_qemuarm ?= "qemuarma15"
-- 
2.19.1

