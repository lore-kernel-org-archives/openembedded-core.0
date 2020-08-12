Received: from mail-qk1-f194.google.com (mail-qk1-f194.google.com [209.85.222.194])
 by mx.groups.io with SMTP id smtpd.web12.19238.1597251816705348730
 for <openembedded-core@lists.openembedded.org>;
 Wed, 12 Aug 2020 10:03:36 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20161025 header.b=UPm8m1Xf;
 spf=pass (domain: gmail.com, ip: 209.85.222.194, mailfrom: bruce.ashfield@gmail.com)
Received: by mail-qk1-f194.google.com with SMTP id x69so2728282qkb.1
        for <openembedded-core@lists.openembedded.org>; Wed, 12 Aug 2020 10:03:36 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:content-transfer-encoding;
        bh=FcDr5uT7an/9zzWqdC55wEQ2LPDcrHDh3Tn76hO0ETw=;
        b=UPm8m1XfNCqsil8tfF/ShtQz4/8qn8ZVSsvSOVV33K+czhImXT63282f4PoxbvRCZH
         BaZ/6fkGMEKSJNWRADGPa4y3Obp2xzOkHQD9kB/u6lwTv8KFWSPBo8fDciiBGXki4ZJW
         QMoB+nOwCV9aOCX8jxpD59XaK9Nmxg6FvWYH2+2mhE2NrAflzKUSj3tswmdnh25FIyjN
         24rb0E85IuvIdYl0I5YIaZZo5CmR6ICsH2Kzswcu3yAdzAB7SabMIMMy5YowgQY2fspb
         7x45S+ghowW+UuymDNtD8qi2LYDWJD09XQTtH7Du1kAcbTCWIKKlzSMcNcu35CRqq6F3
         QW5A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=FcDr5uT7an/9zzWqdC55wEQ2LPDcrHDh3Tn76hO0ETw=;
        b=FIZo2Q92x7dKjT6IpHYtWddvfRlh+hF7clAVHTYrPIwiyK2MQhsaxY6eHUKtlM6+gq
         SJqKBPhRepdsl/wz9a9htAUTl829WiGGMNCMvyTKW4LOTWHv6oRIO2jz5j2dMDh27jSW
         g06W7VIElfM9ENkPJfL/5vWALSpbLk1eG/av0zGfivbZydwFCckq3OGJ8TYz3HAUdzb/
         xOx/2ddOW90zr0sqQvnaBLzqqp27f+vyZNuCyN75/OiKvzflBgxsituI8P8vlJkI7+mw
         cJA/HlAOraDSwdJSneuDNllYBRXOqUxSvXgnS2zCvSGdDlylyFz9T/UaNtgzjKtbKD/H
         FTkQ==
X-Gm-Message-State: AOAM533FgIzVdiHQX4t4+FoUNuDsORGSohRsz6XtX33pkd64ZKKnMpwV
	Bf2/tI4WtIV0f1OTBUX9Qqo=
X-Google-Smtp-Source: ABdhPJzeA96tux+eZs+n+ddVOp5oaOWbZYg/teb4UKirOpQhkNgWy/zrBBCGGg9j0B9/IanrLjaKEw==
X-Received: by 2002:a37:a387:: with SMTP id m129mr894478qke.254.1597251815686;
        Wed, 12 Aug 2020 10:03:35 -0700 (PDT)
Return-Path: <bruce.ashfield@gmail.com>
Received: from localhost.localdomain (CPE04d4c4975b80-CM64777d5e8820.cpe.net.cable.rogers.com. [174.112.240.214])
        by smtp.gmail.com with ESMTPSA id k24sm3249977qtb.26.2020.08.12.10.03.34
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 12 Aug 2020 10:03:34 -0700 (PDT)
From: "Bruce Ashfield" <bruce.ashfield@gmail.com>
To: richard.purdie@linuxfoundation.org
Cc: openembedded-core@lists.openembedded.org
Subject: [PATCH 01/10] linux-yocto-rt/5.4: update to rt32
Date: Wed, 12 Aug 2020 13:03:22 -0400
Message-Id: <8ca393593dad26ece3f455c33979797f15d07665.1597203921.git.bruce.ashfield@gmail.com>
X-Mailer: git-send-email 2.19.1
In-Reply-To: <cover.1597203921.git.bruce.ashfield@gmail.com>
References: <cover.1597203921.git.bruce.ashfield@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

From: Bruce Ashfield <bruce.ashfield@gmail.com>

Integrating the following commit(s) to linux-yocto/5.4:

    2739bdb0bfa0 Linux 5.4.54-rt32
    0124e412ea96 Linux 5.4.52-rt31
    d85676a72421 Linux 5.4.49-rt30
    72bbd8083a44 Linux 5.4.48-rt29

Signed-off-by: Bruce Ashfield <bruce.ashfield@gmail.com>
---
 meta/recipes-kernel/linux/linux-yocto-rt_5.4.bb   | 4 ++--
 meta/recipes-kernel/linux/linux-yocto-tiny_5.4.bb | 2 +-
 meta/recipes-kernel/linux/linux-yocto_5.4.bb      | 2 +-
 3 files changed, 4 insertions(+), 4 deletions(-)

diff --git a/meta/recipes-kernel/linux/linux-yocto-rt_5.4.bb b/meta/recipes-kernel/linux/linux-yocto-rt_5.4.bb
index ec0beeba76..6d3adb5dbd 100644
--- a/meta/recipes-kernel/linux/linux-yocto-rt_5.4.bb
+++ b/meta/recipes-kernel/linux/linux-yocto-rt_5.4.bb
@@ -11,8 +11,8 @@ python () {
         raise bb.parse.SkipRecipe("Set PREFERRED_PROVIDER_virtual/kernel to linux-yocto-rt to enable it")
 }
 
-SRCREV_machine ?= "37478f8c6f336b271b26e783c14bcaf7fa8ca9a6"
-SRCREV_meta ?= "96883b38c16febfa10668d16fe08a5cdc3419872"
+SRCREV_machine ?= "2739bdb0bfa0d9b423ffa940150e539c80bc0bfd"
+SRCREV_meta ?= "ab5ecb9b0e0afbc0ba3502405f4e3d4e7d170fac"
 
 SRC_URI = "git://git.yoctoproject.org/linux-yocto.git;branch=${KBRANCH};name=machine \
            git://git.yoctoproject.org/yocto-kernel-cache;type=kmeta;name=meta;branch=yocto-5.4;destsuffix=${KMETA}"
diff --git a/meta/recipes-kernel/linux/linux-yocto-tiny_5.4.bb b/meta/recipes-kernel/linux/linux-yocto-tiny_5.4.bb
index 9881b09a9f..3cc8537973 100644
--- a/meta/recipes-kernel/linux/linux-yocto-tiny_5.4.bb
+++ b/meta/recipes-kernel/linux/linux-yocto-tiny_5.4.bb
@@ -17,7 +17,7 @@ KCONF_BSP_AUDIT_LEVEL = "2"
 
 SRCREV_machine_qemuarm ?= "58d322d637edd20fe24aadfdc0d621f63700c009"
 SRCREV_machine ?= "9fc2fb2e73466a520ee9a3c48b3ca2f5b21415dc"
-SRCREV_meta ?= "96883b38c16febfa10668d16fe08a5cdc3419872"
+SRCREV_meta ?= "ab5ecb9b0e0afbc0ba3502405f4e3d4e7d170fac"
 
 PV = "${LINUX_VERSION}+git${SRCPV}"
 
diff --git a/meta/recipes-kernel/linux/linux-yocto_5.4.bb b/meta/recipes-kernel/linux/linux-yocto_5.4.bb
index 556eaa6b89..3f9e6aa480 100644
--- a/meta/recipes-kernel/linux/linux-yocto_5.4.bb
+++ b/meta/recipes-kernel/linux/linux-yocto_5.4.bb
@@ -21,7 +21,7 @@ SRCREV_machine_qemux86 ?= "9fc2fb2e73466a520ee9a3c48b3ca2f5b21415dc"
 SRCREV_machine_qemux86-64 ?= "9fc2fb2e73466a520ee9a3c48b3ca2f5b21415dc"
 SRCREV_machine_qemumips64 ?= "3a515b583c3efc896cafa4f7f1e784456a360f8f"
 SRCREV_machine ?= "9fc2fb2e73466a520ee9a3c48b3ca2f5b21415dc"
-SRCREV_meta ?= "96883b38c16febfa10668d16fe08a5cdc3419872"
+SRCREV_meta ?= "ab5ecb9b0e0afbc0ba3502405f4e3d4e7d170fac"
 
 # remap qemuarm to qemuarma15 for the 5.4 kernel
 # KMACHINE_qemuarm ?= "qemuarma15"
-- 
2.19.1

