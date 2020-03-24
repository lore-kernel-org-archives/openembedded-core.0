Received: from mail-qv1-f65.google.com (mail-qv1-f65.google.com [209.85.219.65])
 by mx.groups.io with SMTP id smtpd.web12.578.1585091110881487238
 for <openembedded-core@lists.openembedded.org>;
 Tue, 24 Mar 2020 16:05:11 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20161025 header.b=YMUxGnLg;
 spf=pass (domain: gmail.com, ip: 209.85.219.65, mailfrom: bruce.ashfield@gmail.com)
Received: by mail-qv1-f65.google.com with SMTP id ca9so19098qvb.9
        for <openembedded-core@lists.openembedded.org>; Tue, 24 Mar 2020 16:05:10 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:content-transfer-encoding;
        bh=r3vf+gc5l3rzC5q3hoHiCzWMcKRHcKMgksl8e/ZM/GQ=;
        b=YMUxGnLgXu2SiUYjNh41ENxN/DVIZW5MRos2hgU31nrOUW1aiAIVKA59ZUYwYq6Tll
         yAJ1FtkJR8rPb/OvVqRc4etPwrtYa2WEem1y3hTXIRSdw+o6jAFJemha/+w06jGj4bN8
         B5jjWHtniHPwuzpZhWmY3fs7OLD/MumBFXELTI6ej+3FzqgqeSOPxZ2soYJwSjghUVNZ
         43P37fHKYi7y+a0muBzv5PPpq9pP7cusr6gaXc9KxH54O2/cRj9KSWa4ytTfXAJizhu+
         Ge8fhFGlLOl2oG3xrDLq3qUdjmaQi2TyLdwe3wx/CqGgjtHXVJrNagQq/HgggVDbnGau
         xMbg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=r3vf+gc5l3rzC5q3hoHiCzWMcKRHcKMgksl8e/ZM/GQ=;
        b=aXGJn937ggc7nOPE97WqePOR8c86f2xgUBuB01Q7emQgoVP/hij1uiH/VNdnSDJ4AK
         CU6TQ4Qy/dOZL1CDXo3OhyYfnvqalnfb+mKMuJqLhxMg5fYjmUITeMniZ5bfA5yvj1vc
         0dMzvBxXOn5bSE+FVWULu1/N9b+PNZ/73ipXi1fnAGe5uMiefFZyqOkr92PrlLsYHwAf
         SGjOfmCbP/WF4x1AUDi9qRS22uQ5ng9S++mzt989Jqa/8Eh8toMGPvB3ZME91zjKNiAw
         8r0bYqBaUIFfo7pEa98lqXi+1XrlzhAw2nwzeuPSSz+uRwfFBaMRBOZEoR+kdd+4TE2m
         NkSQ==
X-Gm-Message-State: ANhLgQ1cjTGPNwd4crFF44XCTllMvJKx4Ds6KKZQrOOga8tKqHjGAP5M
	EA88f5UFWRvinm6h6bMAFVY=
X-Google-Smtp-Source: ADFU+vsV+twcxA3z4G0xcXdBDxGULVWpEvusybmkSjsqiOJGn0XDnSYJk98X84DeXi2N3qQ1G9FgdA==
X-Received: by 2002:ad4:58b3:: with SMTP id ea19mr588529qvb.8.1585091110008;
        Tue, 24 Mar 2020 16:05:10 -0700 (PDT)
Return-Path: <bruce.ashfield@gmail.com>
Received: from localhost.localdomain (CPE04d4c4975b80-CM64777d5e8820.cpe.net.cable.rogers.com. [174.112.240.214])
        by smtp.gmail.com with ESMTPSA id l22sm15153655qkj.120.2020.03.24.16.05.09
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 24 Mar 2020 16:05:09 -0700 (PDT)
From: "Bruce Ashfield" <bruce.ashfield@gmail.com>
To: richard.purdie@linuxfoundation.org
Cc: openembedded-core@lists.openembedded.org
Subject: [PATCH 4/5] linux-yocto/5.4: ARM: 8918/2: only build return_address() if needed
Date: Tue, 24 Mar 2020 19:05:02 -0400
Message-Id: <96460eaf3890958a2fb4256704fe79304d6f800b.1585090958.git.bruce.ashfield@gmail.com>
X-Mailer: git-send-email 2.19.1
In-Reply-To: <cover.1585090957.git.bruce.ashfield@gmail.com>
References: <cover.1585090957.git.bruce.ashfield@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

From: Bruce Ashfield <bruce.ashfield@gmail.com>

Integrating the following commit(s) to linux-yocto/5.4:

    03142acba06e ARM: 8918/2: only build return_address() if needed

Signed-off-by: Bruce Ashfield <bruce.ashfield@gmail.com>
---
 .../recipes-kernel/linux/linux-yocto-rt_5.4.bb |  2 +-
 .../linux/linux-yocto-tiny_5.4.bb              |  4 ++--
 meta/recipes-kernel/linux/linux-yocto_5.4.bb   | 18 +++++++++---------
 3 files changed, 12 insertions(+), 12 deletions(-)

diff --git a/meta/recipes-kernel/linux/linux-yocto-rt_5.4.bb b/meta/recipes-kernel/linux/linux-yocto-rt_5.4.bb
index 2eb1e846e8..7037d980d2 100644
--- a/meta/recipes-kernel/linux/linux-yocto-rt_5.4.bb
+++ b/meta/recipes-kernel/linux/linux-yocto-rt_5.4.bb
@@ -11,7 +11,7 @@ python () {
         raise bb.parse.SkipRecipe("Set PREFERRED_PROVIDER_virtual/kernel to linux-yocto-rt to enable it")
 }
 
-SRCREV_machine ?= "87d86ed4bfc78baee66933982c2962309fca4ffe"
+SRCREV_machine ?= "79037ae58e6b0dfd0c63d4a0e131f1bd5efe7e53"
 SRCREV_meta ?= "d40bf6ad14acc6d84d5c9a8e2c794ce37ffa16ff"
 
 SRC_URI = "git://git.yoctoproject.org/linux-yocto.git;branch=${KBRANCH};name=machine \
diff --git a/meta/recipes-kernel/linux/linux-yocto-tiny_5.4.bb b/meta/recipes-kernel/linux/linux-yocto-tiny_5.4.bb
index 18ff195af3..2a621622eb 100644
--- a/meta/recipes-kernel/linux/linux-yocto-tiny_5.4.bb
+++ b/meta/recipes-kernel/linux/linux-yocto-tiny_5.4.bb
@@ -15,8 +15,8 @@ DEPENDS += "openssl-native util-linux-native"
 KMETA = "kernel-meta"
 KCONF_BSP_AUDIT_LEVEL = "2"
 
-SRCREV_machine_qemuarm ?= "b6bb0cf2d13aca397c216c2323985c87ac98919a"
-SRCREV_machine ?= "9065d188f87410b7c862e44ff3143648c1ad2295"
+SRCREV_machine_qemuarm ?= "5c2d35eeb4be0e8bae4cf5ee0733e41ff1262ff3"
+SRCREV_machine ?= "03142acba06e8b33888410a518358a626dceb720"
 SRCREV_meta ?= "d40bf6ad14acc6d84d5c9a8e2c794ce37ffa16ff"
 
 PV = "${LINUX_VERSION}+git${SRCPV}"
diff --git a/meta/recipes-kernel/linux/linux-yocto_5.4.bb b/meta/recipes-kernel/linux/linux-yocto_5.4.bb
index 8db3d1c974..0f1cd07945 100644
--- a/meta/recipes-kernel/linux/linux-yocto_5.4.bb
+++ b/meta/recipes-kernel/linux/linux-yocto_5.4.bb
@@ -12,15 +12,15 @@ KBRANCH_qemux86  ?= "v5.4/standard/base"
 KBRANCH_qemux86-64 ?= "v5.4/standard/base"
 KBRANCH_qemumips64 ?= "v5.4/standard/mti-malta64"
 
-SRCREV_machine_qemuarm ?= "9f04047a4f31450342960f04571194122e890461"
-SRCREV_machine_qemuarm64 ?= "9065d188f87410b7c862e44ff3143648c1ad2295"
-SRCREV_machine_qemumips ?= "f6f24e8e404d1debf07cb5793a183ba8e759d09b"
-SRCREV_machine_qemuppc ?= "9065d188f87410b7c862e44ff3143648c1ad2295"
-SRCREV_machine_qemuriscv64 ?= "9065d188f87410b7c862e44ff3143648c1ad2295"
-SRCREV_machine_qemux86 ?= "9065d188f87410b7c862e44ff3143648c1ad2295"
-SRCREV_machine_qemux86-64 ?= "9065d188f87410b7c862e44ff3143648c1ad2295"
-SRCREV_machine_qemumips64 ?= "6f93582af92ab433d43c2a67a7ed871e5c229e55"
-SRCREV_machine ?= "9065d188f87410b7c862e44ff3143648c1ad2295"
+SRCREV_machine_qemuarm ?= "ab849248b45403c7d6f1fb8e8f57840cc2880618"
+SRCREV_machine_qemuarm64 ?= "03142acba06e8b33888410a518358a626dceb720"
+SRCREV_machine_qemumips ?= "967a1708cbbfe1b524dc28f04fa5e0d79a270bf5"
+SRCREV_machine_qemuppc ?= "03142acba06e8b33888410a518358a626dceb720"
+SRCREV_machine_qemuriscv64 ?= "03142acba06e8b33888410a518358a626dceb720"
+SRCREV_machine_qemux86 ?= "03142acba06e8b33888410a518358a626dceb720"
+SRCREV_machine_qemux86-64 ?= "03142acba06e8b33888410a518358a626dceb720"
+SRCREV_machine_qemumips64 ?= "d3e850da830241c424d557a6a072527e09e784ab"
+SRCREV_machine ?= "03142acba06e8b33888410a518358a626dceb720"
 SRCREV_meta ?= "d40bf6ad14acc6d84d5c9a8e2c794ce37ffa16ff"
 
 # remap qemuarm to qemuarma15 for the 5.4 kernel
-- 
2.19.1

