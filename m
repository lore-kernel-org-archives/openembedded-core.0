Received: from mail-qt1-f193.google.com (mail-qt1-f193.google.com [209.85.160.193])
 by mx.groups.io with SMTP id smtpd.web09.14291.1605813479972091073
 for <openembedded-core@lists.openembedded.org>;
 Thu, 19 Nov 2020 11:18:00 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20161025 header.b=L/ecObpN;
 spf=pass (domain: gmail.com, ip: 209.85.160.193, mailfrom: bruce.ashfield@gmail.com)
Received: by mail-qt1-f193.google.com with SMTP id f15so1748038qto.13
        for <openembedded-core@lists.openembedded.org>; Thu, 19 Nov 2020 11:17:59 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:content-transfer-encoding;
        bh=n4//rZ4BVuIGYpt6/GdDTFqBff4QghaJJLDoF+YiMT4=;
        b=L/ecObpNEx+DQHpRkzV1pG1Yn+tkCzVbkEfZ99VeWuG/7R7JJT+GFMUFBhHJN62pZw
         smv+GSzJ6B5PiILgr7Y2hK/yQ8BHCexGowzmf65aenvW5RhCSozZJtEpbMBKR6IzSs6/
         OS22NbbDSTG3yMoazTWtzXTGttIEcR0PYLmREWInpLeFrnaMhQ3Ri1348b+Dxd2ukKov
         eLJkWedkxlYv0x3ku5OojWu37ObSo8QG1pM1lbhu4RPAw8VfT6+wTnUe2A8Owfet82tl
         aQ5SdkUEKYxQ4S7GbtYph18u/61u7C4hTsITc3V7znzvEK1y4JsMP+dXx0vZgagC/zqf
         QJyQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=n4//rZ4BVuIGYpt6/GdDTFqBff4QghaJJLDoF+YiMT4=;
        b=p4+soEgeheNipbecEYkl0c8f0y9O7aNI4ZnuGeLccfXzlsQN3eG06oSZCb0znJI/6m
         pf6Ax2aORapVe8AaKVvTgT3hxlTUNhT1EZNHET9eui0EDDFkmmUAYxtkVcjb/vJdPSNR
         hCCsFgt4QhFPtPNQOJUoCey6n1rl8l9ux+DJPgnDCuACmes7vGbDVgRLyjG4hxbJbrks
         z2x268VAylHpeU8vguExCxMpcutMr9uCrUYRaKGlb/lVBsoIG+KA4FuiGWo1iuTOJEIr
         Nftjz4SSBrWEDgGD6gdmAjpXWXKt4D+aNmTY9hp95puBDcNk6WwKtE47UYtk8uzUOwAU
         gxpw==
X-Gm-Message-State: AOAM5325tAJxFtIkmICR+pqE3HH20I/WXInZbAWrxMVnR3O8Mcrgpby1
	/DhZ3rdqDmSLkxksUK71vjjmM0FiQg5Y0b9Z
X-Google-Smtp-Source: ABdhPJw4X7pT7gbst/Hc/qG5cbV03ARn75OeW4q9WGbx2XhofZQWKkge4SnDkSH7ycbjQRua2nTheg==
X-Received: by 2002:ac8:6c2a:: with SMTP id k10mr11606144qtu.89.1605813479087;
        Thu, 19 Nov 2020 11:17:59 -0800 (PST)
Return-Path: <bruce.ashfield@gmail.com>
Received: from localhost.localdomain (cpe04d4c4975b80-cm64777d5e8820.cpe.net.cable.rogers.com. [174.112.165.127])
        by smtp.gmail.com with ESMTPSA id l22sm478684qke.118.2020.11.19.11.17.58
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 19 Nov 2020 11:17:58 -0800 (PST)
From: "Bruce Ashfield" <bruce.ashfield@gmail.com>
To: richard.purdie@linuxfoundation.org
Cc: openembedded-core@lists.openembedded.org
Subject: [PATCH 4/5] linux-yocto/5.8: ext4/tipc warning fixups
Date: Thu, 19 Nov 2020 14:17:51 -0500
Message-Id: <fee6eb12eae38ba4ca58f0ef5219cb14c2540825.1605813340.git.bruce.ashfield@gmail.com>
X-Mailer: git-send-email 2.19.1
In-Reply-To: <cover.1605813340.git.bruce.ashfield@gmail.com>
References: <cover.1605813340.git.bruce.ashfield@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

From: Bruce Ashfield <bruce.ashfield@gmail.com>

Integrating the following commit(s) to linux-yocto/5.8:

    3c5d210805d6 tipc: fix -Wstringop-truncation warnings
    cc89fd77c248 ext4: fix -Wstringop-truncation warnings

Signed-off-by: Bruce Ashfield <bruce.ashfield@gmail.com>
---
 .../recipes-kernel/linux/linux-yocto-rt_5.8.bb |  2 +-
 .../linux/linux-yocto-tiny_5.8.bb              |  4 ++--
 meta/recipes-kernel/linux/linux-yocto_5.8.bb   | 18 +++++++++---------
 3 files changed, 12 insertions(+), 12 deletions(-)

diff --git a/meta/recipes-kernel/linux/linux-yocto-rt_5.8.bb b/meta/recipes-kernel/linux/linux-yocto-rt_5.8.bb
index c2d627acb7..033dfc76a2 100644
--- a/meta/recipes-kernel/linux/linux-yocto-rt_5.8.bb
+++ b/meta/recipes-kernel/linux/linux-yocto-rt_5.8.bb
@@ -11,7 +11,7 @@ python () {
         raise bb.parse.SkipRecipe("Set PREFERRED_PROVIDER_virtual/kernel to linux-yocto-rt to enable it")
 }
 
-SRCREV_machine ?= "52b840afae058fb20ce69ff5af811f8582b3bb5a"
+SRCREV_machine ?= "3c5d210805d61bea8f8a8081e0e3a89ea8a61f3f"
 SRCREV_meta ?= "7883b60d324029d26020c0b3f826b35c52fd9674"
 
 SRC_URI = "git://git.yoctoproject.org/linux-yocto.git;branch=${KBRANCH};name=machine \
diff --git a/meta/recipes-kernel/linux/linux-yocto-tiny_5.8.bb b/meta/recipes-kernel/linux/linux-yocto-tiny_5.8.bb
index 31a84f3972..50cee07620 100644
--- a/meta/recipes-kernel/linux/linux-yocto-tiny_5.8.bb
+++ b/meta/recipes-kernel/linux/linux-yocto-tiny_5.8.bb
@@ -15,8 +15,8 @@ DEPENDS += "openssl-native util-linux-native"
 KMETA = "kernel-meta"
 KCONF_BSP_AUDIT_LEVEL = "2"
 
-SRCREV_machine_qemuarm ?= "3e9aa72b02cf7d04096e367c99d503cd1d26cc6c"
-SRCREV_machine ?= "52b840afae058fb20ce69ff5af811f8582b3bb5a"
+SRCREV_machine_qemuarm ?= "9509db6e3ed6a23b1f7495b53248d1cbfe22710b"
+SRCREV_machine ?= "3c5d210805d61bea8f8a8081e0e3a89ea8a61f3f"
 SRCREV_meta ?= "7883b60d324029d26020c0b3f826b35c52fd9674"
 
 PV = "${LINUX_VERSION}+git${SRCPV}"
diff --git a/meta/recipes-kernel/linux/linux-yocto_5.8.bb b/meta/recipes-kernel/linux/linux-yocto_5.8.bb
index c6fb9e9f86..af576891e2 100644
--- a/meta/recipes-kernel/linux/linux-yocto_5.8.bb
+++ b/meta/recipes-kernel/linux/linux-yocto_5.8.bb
@@ -12,15 +12,15 @@ KBRANCH_qemux86  ?= "v5.8/standard/base"
 KBRANCH_qemux86-64 ?= "v5.8/standard/base"
 KBRANCH_qemumips64 ?= "v5.8/standard/mti-malta64"
 
-SRCREV_machine_qemuarm ?= "0c6d276c75233f9b8d05103ff652676a2c271868"
-SRCREV_machine_qemuarm64 ?= "52b840afae058fb20ce69ff5af811f8582b3bb5a"
-SRCREV_machine_qemumips ?= "4c07d59936f8e28eadecab8f56ef14726f77ccb8"
-SRCREV_machine_qemuppc ?= "52b840afae058fb20ce69ff5af811f8582b3bb5a"
-SRCREV_machine_qemuriscv64 ?= "52b840afae058fb20ce69ff5af811f8582b3bb5a"
-SRCREV_machine_qemux86 ?= "52b840afae058fb20ce69ff5af811f8582b3bb5a"
-SRCREV_machine_qemux86-64 ?= "52b840afae058fb20ce69ff5af811f8582b3bb5a"
-SRCREV_machine_qemumips64 ?= "2224bf83cf372bb729583dfb93ad28abba9905fd"
-SRCREV_machine ?= "52b840afae058fb20ce69ff5af811f8582b3bb5a"
+SRCREV_machine_qemuarm ?= "14b463d0e5c1e2ff354244420f9bbc7f0ab80533"
+SRCREV_machine_qemuarm64 ?= "3c5d210805d61bea8f8a8081e0e3a89ea8a61f3f"
+SRCREV_machine_qemumips ?= "8d8d9afb396f154f366f32948fdff3cf4e269841"
+SRCREV_machine_qemuppc ?= "3c5d210805d61bea8f8a8081e0e3a89ea8a61f3f"
+SRCREV_machine_qemuriscv64 ?= "3c5d210805d61bea8f8a8081e0e3a89ea8a61f3f"
+SRCREV_machine_qemux86 ?= "3c5d210805d61bea8f8a8081e0e3a89ea8a61f3f"
+SRCREV_machine_qemux86-64 ?= "3c5d210805d61bea8f8a8081e0e3a89ea8a61f3f"
+SRCREV_machine_qemumips64 ?= "01a02b058f9a8941032b298b8d25c673526152f4"
+SRCREV_machine ?= "3c5d210805d61bea8f8a8081e0e3a89ea8a61f3f"
 SRCREV_meta ?= "7883b60d324029d26020c0b3f826b35c52fd9674"
 
 # remap qemuarm to qemuarma15 for the 5.8 kernel
-- 
2.19.1

