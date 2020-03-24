Received: from mail-qt1-f194.google.com (mail-qt1-f194.google.com [209.85.160.194])
 by mx.groups.io with SMTP id smtpd.web12.581.1585091111956049161
 for <openembedded-core@lists.openembedded.org>;
 Tue, 24 Mar 2020 16:05:12 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20161025 header.b=VzNyFqxS;
 spf=pass (domain: gmail.com, ip: 209.85.160.194, mailfrom: bruce.ashfield@gmail.com)
Received: by mail-qt1-f194.google.com with SMTP id d12so562004qtj.4
        for <openembedded-core@lists.openembedded.org>; Tue, 24 Mar 2020 16:05:11 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:content-transfer-encoding;
        bh=Jq3vPpdSrwd//NlhHOv6nZT4878ba/SBAIigPF6zBl8=;
        b=VzNyFqxS22FyP/dDwMNidKn8eN9LqB9YL10vK6ws5+CHb+cxRQ0AXxXgZ4jNvJHaKT
         /H0WK5lRI1nTCxDjDDShImAeX+TEEFz92ibxugTeTZOTGemv3Pb1DEX0zitq4qIZsaQp
         1+VzaxeA9JsCV8PuGhWQQbwE1WGdBTRjNkNpNI7nfYwaJk+wHG0yj87wAkAfOLxL5/7t
         pzYZ3lmhyLHos98r3n8tkmBedcaJZE9AqTKN/vyXeT4+DLiVqIawmfBRVIdyB3yrNfOY
         acV6PJcqMpSkBdOQ0nOJpEviDmSC0ESiBQz38Wyxj+OzogAm771NiFEQtf/uXR2vwVcc
         6QGg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=Jq3vPpdSrwd//NlhHOv6nZT4878ba/SBAIigPF6zBl8=;
        b=EFSYWIF4m2Pu9qjT2qDfG8o03JJQw6Nm81vDj5DeYnYx8Y+/bwIgRPOF3+f+UB/dG2
         +ue6CLf1wmF5h/Nm2CWyiXrm9kJ+okvIzJ37PD/WQxKNCf6+qpIeJacJ9mw3Szg7pLCM
         anRmgRFThG9WLg/T9OMZdAn/APQDnkZnrQstovhhxZykXyjhzxmiBfK5vrr5ZlyQduiS
         0s726mdNvXRU4yt7Fb2c7XeseFCxh/XBRhE7PWUTpz6Fw6nbsbkUpzsclcED5+BB5NV1
         TG4U81Mfho3cmsd3Rb8MLJTb4ZSFOa32CUO4+NspCIxI1VUtgo6482WH7/OSj4I4wZdI
         8XFg==
X-Gm-Message-State: ANhLgQ3TRRz68wypuapMxpEenQUMDxs/86O9AxxDFuwKZXRt76ImNZwq
	VauO8PeIdi7V8dgMlc1UkcoMtrijF6lZpw==
X-Google-Smtp-Source: ADFU+vtLrZdHDyXaJDj4utqqg0IMFqK2rrY2yYPSuDGwZrCI55ES99gmtRAayyBRTV0K4KpBWKlM6Q==
X-Received: by 2002:aed:3981:: with SMTP id m1mr264978qte.35.1585091111033;
        Tue, 24 Mar 2020 16:05:11 -0700 (PDT)
Return-Path: <bruce.ashfield@gmail.com>
Received: from localhost.localdomain (CPE04d4c4975b80-CM64777d5e8820.cpe.net.cable.rogers.com. [174.112.240.214])
        by smtp.gmail.com with ESMTPSA id l22sm15153655qkj.120.2020.03.24.16.05.10
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 24 Mar 2020 16:05:10 -0700 (PDT)
From: "Bruce Ashfield" <bruce.ashfield@gmail.com>
To: richard.purdie@linuxfoundation.org
Cc: openembedded-core@lists.openembedded.org
Subject: [PATCH 5/5] linux-yocto/5.4: configuration tweaks
Date: Tue, 24 Mar 2020 19:05:03 -0400
Message-Id: <bd19012b5d37d1b797cb33da9381ef1be10ec5e2.1585090958.git.bruce.ashfield@gmail.com>
X-Mailer: git-send-email 2.19.1
In-Reply-To: <cover.1585090957.git.bruce.ashfield@gmail.com>
References: <cover.1585090957.git.bruce.ashfield@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

From: Bruce Ashfield <bruce.ashfield@gmail.com>

Integrating the following configuration fixes:

   bee554e595e bsp/ti-am65x: remove duplicate config option CONFIG_NETDEVICES
   32405486b46 bsp/ti-am335x: drop PRUSS invalid cfg option
   d40bf6ad14a xilinx-zynqmp: add cpuidle support for zcu102
   533cfd5af00 bsp: delete obsolete kernel option CONFIG_MTD_M25P80

Signed-off-by: Bruce Ashfield <bruce.ashfield@gmail.com>
---
 meta/recipes-kernel/linux/linux-yocto-rt_5.4.bb   | 2 +-
 meta/recipes-kernel/linux/linux-yocto-tiny_5.4.bb | 2 +-
 meta/recipes-kernel/linux/linux-yocto_5.4.bb      | 2 +-
 3 files changed, 3 insertions(+), 3 deletions(-)

diff --git a/meta/recipes-kernel/linux/linux-yocto-rt_5.4.bb b/meta/recipes-kernel/linux/linux-yocto-rt_5.4.bb
index 7037d980d2..9e74ec17af 100644
--- a/meta/recipes-kernel/linux/linux-yocto-rt_5.4.bb
+++ b/meta/recipes-kernel/linux/linux-yocto-rt_5.4.bb
@@ -12,7 +12,7 @@ python () {
 }
 
 SRCREV_machine ?= "79037ae58e6b0dfd0c63d4a0e131f1bd5efe7e53"
-SRCREV_meta ?= "d40bf6ad14acc6d84d5c9a8e2c794ce37ffa16ff"
+SRCREV_meta ?= "bee554e595e49c963900d1c78c01ab2d041382e7"
 
 SRC_URI = "git://git.yoctoproject.org/linux-yocto.git;branch=${KBRANCH};name=machine \
            git://git.yoctoproject.org/yocto-kernel-cache;type=kmeta;name=meta;branch=yocto-5.4;destsuffix=${KMETA}"
diff --git a/meta/recipes-kernel/linux/linux-yocto-tiny_5.4.bb b/meta/recipes-kernel/linux/linux-yocto-tiny_5.4.bb
index 2a621622eb..ba5e668d73 100644
--- a/meta/recipes-kernel/linux/linux-yocto-tiny_5.4.bb
+++ b/meta/recipes-kernel/linux/linux-yocto-tiny_5.4.bb
@@ -17,7 +17,7 @@ KCONF_BSP_AUDIT_LEVEL = "2"
 
 SRCREV_machine_qemuarm ?= "5c2d35eeb4be0e8bae4cf5ee0733e41ff1262ff3"
 SRCREV_machine ?= "03142acba06e8b33888410a518358a626dceb720"
-SRCREV_meta ?= "d40bf6ad14acc6d84d5c9a8e2c794ce37ffa16ff"
+SRCREV_meta ?= "bee554e595e49c963900d1c78c01ab2d041382e7"
 
 PV = "${LINUX_VERSION}+git${SRCPV}"
 
diff --git a/meta/recipes-kernel/linux/linux-yocto_5.4.bb b/meta/recipes-kernel/linux/linux-yocto_5.4.bb
index 0f1cd07945..25e933d683 100644
--- a/meta/recipes-kernel/linux/linux-yocto_5.4.bb
+++ b/meta/recipes-kernel/linux/linux-yocto_5.4.bb
@@ -21,7 +21,7 @@ SRCREV_machine_qemux86 ?= "03142acba06e8b33888410a518358a626dceb720"
 SRCREV_machine_qemux86-64 ?= "03142acba06e8b33888410a518358a626dceb720"
 SRCREV_machine_qemumips64 ?= "d3e850da830241c424d557a6a072527e09e784ab"
 SRCREV_machine ?= "03142acba06e8b33888410a518358a626dceb720"
-SRCREV_meta ?= "d40bf6ad14acc6d84d5c9a8e2c794ce37ffa16ff"
+SRCREV_meta ?= "bee554e595e49c963900d1c78c01ab2d041382e7"
 
 # remap qemuarm to qemuarma15 for the 5.4 kernel
 # KMACHINE_qemuarm ?= "qemuarma15"
-- 
2.19.1

