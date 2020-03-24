Received: from mail-qv1-f68.google.com (mail-qv1-f68.google.com [209.85.219.68])
 by mx.groups.io with SMTP id smtpd.web12.576.1585091107886735302
 for <openembedded-core@lists.openembedded.org>;
 Tue, 24 Mar 2020 16:05:08 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20161025 header.b=a3Dlg52B;
 spf=pass (domain: gmail.com, ip: 209.85.219.68, mailfrom: bruce.ashfield@gmail.com)
Received: by mail-qv1-f68.google.com with SMTP id v38so28011qvf.6
        for <openembedded-core@lists.openembedded.org>; Tue, 24 Mar 2020 16:05:07 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:content-transfer-encoding;
        bh=YYhcFfrx9CBL5gfIXJz6BtbyM+mFxFr2vFvymnCHJNk=;
        b=a3Dlg52Boa2t0AIdaYU4Y9avP+Nof0Ofhv0kcn3d/m0UHdKF+Mg6By4cZzP0FbeWmy
         MuIE58oTfFRRQY8sssqCdFn9qviILaL8rYbJjGNui6HU7kjyQX7yUeX9yCCWk32A2fJ9
         d7BiN0bDxDFjz3EKQS3q1dA2XrhZCbwcTMgSHNGPCzFis+cMBAxNgQMHe/vSVxTl4BNn
         fLqQGjza1sGZ/Adm5tkgHbn5EfER4As5nhQwGAdBLoa0AxeRLP5fjDdpM3g085eWnDfg
         JLQgJPvYu+4GVtnmmkuPKyaVBDyIF0JmnUTxjlKF+oLAUPU3erCybX4RMypgA4i8Bht/
         70rQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=YYhcFfrx9CBL5gfIXJz6BtbyM+mFxFr2vFvymnCHJNk=;
        b=fagOBrAe/uB3IXDhFWLo+tRSBSc34doJXKXwOXA+dU8/AQ78wIllEg6f9pU7ets/3n
         ogPSHSxv30402OAS6IfbZZjvxBuSAnxwGXBOyX/Mgd9mhbo46R3XfleiXlOdWKiCc6pb
         zjQj3tPo8VGK0nqJ789rD2h4iXk+1NI8yfadojW2+t3GHqtpPQNYQ0bu+HxZ+xf9RsJE
         4beSlV7O3PkCG12B4MuZlqtrjlyR0J5WRC/u00VF3v2rflaeBRaejggY7gASgM6T2XS3
         Qlecwq3nznwTM3dh7g0nY8RzBXcMZp8NHbPdv8v8eNcfQQB9hbM8BLUYgh1J86LSf+Zk
         uQSQ==
X-Gm-Message-State: ANhLgQ3GROuFxIyPIiQESVzo0b8vY42MeJaL3DJTXLjBeE/Zm4QbPlub
	dYubIvKk9+pQ06Z9eMxT19UdS2CJuClq0g==
X-Google-Smtp-Source: ADFU+vuBT659z8wu4pCQDVpF+uCMo4IidnOmnncXtz8/LAbhdC4G7HnzlGa9taJHiPHs9TgYD0NIeg==
X-Received: by 2002:ad4:5429:: with SMTP id g9mr540657qvt.134.1585091106979;
        Tue, 24 Mar 2020 16:05:06 -0700 (PDT)
Return-Path: <bruce.ashfield@gmail.com>
Received: from localhost.localdomain (CPE04d4c4975b80-CM64777d5e8820.cpe.net.cable.rogers.com. [174.112.240.214])
        by smtp.gmail.com with ESMTPSA id l22sm15153655qkj.120.2020.03.24.16.05.05
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 24 Mar 2020 16:05:06 -0700 (PDT)
From: "Bruce Ashfield" <bruce.ashfield@gmail.com>
To: richard.purdie@linuxfoundation.org
Cc: openembedded-core@lists.openembedded.org
Subject: [PATCH 1/5] linux-yocto/5.4: Revert "platform/x86: wmi: Destroy on cleanup rather than unregister"
Date: Tue, 24 Mar 2020 19:04:59 -0400
Message-Id: <4e919e52aba5d6b783312d253b2aceae8a5206ce.1585090957.git.bruce.ashfield@gmail.com>
X-Mailer: git-send-email 2.19.1
In-Reply-To: <cover.1585090957.git.bruce.ashfield@gmail.com>
References: <cover.1585090957.git.bruce.ashfield@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

From: Bruce Ashfield <bruce.ashfield@gmail.com>

We had reverted this commit in v5.2, and it is still required in 5.4.

The following config commit is also included in this change:

  bsp/ti-am335x: drop some invalid cfg options

Signed-off-by: Bruce Ashfield <bruce.ashfield@gmail.com>
---
 .../linux/linux-yocto-rt_5.4.bb               |  4 ++--
 .../linux/linux-yocto-tiny_5.4.bb             |  6 +++---
 meta/recipes-kernel/linux/linux-yocto_5.4.bb  | 20 +++++++++----------
 3 files changed, 15 insertions(+), 15 deletions(-)

diff --git a/meta/recipes-kernel/linux/linux-yocto-rt_5.4.bb b/meta/recipes-kernel/linux/linux-yocto-rt_5.4.bb
index 446eae2be6..5bdd2f629a 100644
--- a/meta/recipes-kernel/linux/linux-yocto-rt_5.4.bb
+++ b/meta/recipes-kernel/linux/linux-yocto-rt_5.4.bb
@@ -11,8 +11,8 @@ python () {
         raise bb.parse.SkipRecipe("Set PREFERRED_PROVIDER_virtual/kernel to linux-yocto-rt to enable it")
 }
 
-SRCREV_machine ?= "2659f7a7212cd80e2b69b2e5e8ceec8bcffec6aa"
-SRCREV_meta ?= "9fe365b9395a05831177ec309e9857962b2496a9"
+SRCREV_machine ?= "b6eb513c50e6de3746287c4f17058a81d1be613c"
+SRCREV_meta ?= "ccf845f650255696bcd41c4004abf8adba212d5d"
 
 SRC_URI = "git://git.yoctoproject.org/linux-yocto.git;branch=${KBRANCH};name=machine \
            git://git.yoctoproject.org/yocto-kernel-cache;type=kmeta;name=meta;branch=yocto-5.4;destsuffix=${KMETA}"
diff --git a/meta/recipes-kernel/linux/linux-yocto-tiny_5.4.bb b/meta/recipes-kernel/linux/linux-yocto-tiny_5.4.bb
index 653f33f9cb..0850725383 100644
--- a/meta/recipes-kernel/linux/linux-yocto-tiny_5.4.bb
+++ b/meta/recipes-kernel/linux/linux-yocto-tiny_5.4.bb
@@ -15,9 +15,9 @@ DEPENDS += "openssl-native util-linux-native"
 KMETA = "kernel-meta"
 KCONF_BSP_AUDIT_LEVEL = "2"
 
-SRCREV_machine_qemuarm ?= "c90bb8009bf65f13d120f8e4989763f85133762e"
-SRCREV_machine ?= "20eb96b378204dcc435b193c5d692bdf561beff0"
-SRCREV_meta ?= "9fe365b9395a05831177ec309e9857962b2496a9"
+SRCREV_machine_qemuarm ?= "8f0a54b42e11bee3bf552ae6a04f7ec2267f4dd3"
+SRCREV_machine ?= "45760a7e1301894b3ffd4d1bd76684c99fbff6f7"
+SRCREV_meta ?= "ccf845f650255696bcd41c4004abf8adba212d5d"
 
 PV = "${LINUX_VERSION}+git${SRCPV}"
 
diff --git a/meta/recipes-kernel/linux/linux-yocto_5.4.bb b/meta/recipes-kernel/linux/linux-yocto_5.4.bb
index d3fed81c56..98e4accc74 100644
--- a/meta/recipes-kernel/linux/linux-yocto_5.4.bb
+++ b/meta/recipes-kernel/linux/linux-yocto_5.4.bb
@@ -12,16 +12,16 @@ KBRANCH_qemux86  ?= "v5.4/standard/base"
 KBRANCH_qemux86-64 ?= "v5.4/standard/base"
 KBRANCH_qemumips64 ?= "v5.4/standard/mti-malta64"
 
-SRCREV_machine_qemuarm ?= "e28b25e558cdc53d13f67df8b249bb770f3dcfba"
-SRCREV_machine_qemuarm64 ?= "20eb96b378204dcc435b193c5d692bdf561beff0"
-SRCREV_machine_qemumips ?= "0e1fe5b6bb2a34ed05dcc69fadec6581cbb0f9f5"
-SRCREV_machine_qemuppc ?= "20eb96b378204dcc435b193c5d692bdf561beff0"
-SRCREV_machine_qemuriscv64 ?= "20eb96b378204dcc435b193c5d692bdf561beff0"
-SRCREV_machine_qemux86 ?= "20eb96b378204dcc435b193c5d692bdf561beff0"
-SRCREV_machine_qemux86-64 ?= "20eb96b378204dcc435b193c5d692bdf561beff0"
-SRCREV_machine_qemumips64 ?= "ac5e243548907567d8285492c9fa0cbcf7d35d8a"
-SRCREV_machine ?= "20eb96b378204dcc435b193c5d692bdf561beff0"
-SRCREV_meta ?= "9fe365b9395a05831177ec309e9857962b2496a9"
+SRCREV_machine_qemuarm ?= "e0b9db4dd28cfccc6b0cffd2da6cde7c8d760bdd"
+SRCREV_machine_qemuarm64 ?= "45760a7e1301894b3ffd4d1bd76684c99fbff6f7"
+SRCREV_machine_qemumips ?= "84c43062449817e61dd8e331f49821c65aa23967"
+SRCREV_machine_qemuppc ?= "45760a7e1301894b3ffd4d1bd76684c99fbff6f7"
+SRCREV_machine_qemuriscv64 ?= "45760a7e1301894b3ffd4d1bd76684c99fbff6f7"
+SRCREV_machine_qemux86 ?= "45760a7e1301894b3ffd4d1bd76684c99fbff6f7"
+SRCREV_machine_qemux86-64 ?= "45760a7e1301894b3ffd4d1bd76684c99fbff6f7"
+SRCREV_machine_qemumips64 ?= "08ac7d212e539ed2d17c6714d97b019e48e1fe1c"
+SRCREV_machine ?= "45760a7e1301894b3ffd4d1bd76684c99fbff6f7"
+SRCREV_meta ?= "ccf845f650255696bcd41c4004abf8adba212d5d"
 
 # remap qemuarm to qemuarma15 for the 5.4 kernel
 # KMACHINE_qemuarm ?= "qemuarma15"
-- 
2.19.1

