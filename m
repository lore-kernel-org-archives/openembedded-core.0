Received: from mail-qk1-f169.google.com (mail-qk1-f169.google.com [209.85.222.169])
 by mx.groups.io with SMTP id smtpd.web09.224.1626377416939589667
 for <openembedded-core@lists.openembedded.org>;
 Thu, 15 Jul 2021 12:30:17 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20161025 header.b=bCRRJl/r;
 spf=pass (domain: gmail.com, ip: 209.85.222.169, mailfrom: bruce.ashfield@gmail.com)
Received: by mail-qk1-f169.google.com with SMTP id 23so6346616qke.0
        for <openembedded-core@lists.openembedded.org>; Thu, 15 Jul 2021 12:30:16 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:content-transfer-encoding;
        bh=tH/beTE3GEoYW5g7Zb/HEQLSjNDJDDivx/ept9cYhnw=;
        b=bCRRJl/rOcKXbxK0FJvl1gL8nykRE/5r1S+1UX/MTkFSJh1vvBBdSlBL/u3T16mf/+
         9rsrwk0eVbDpFYT2j+UUe6DhfxxIAwHD9xUQ5Pp0dEwd9FTwPRe9yMZ01Lih+9rfsofq
         s32sxBL0bgBzMLCSBB+qLGgLTKpeS7sMzVcm6L3s0+CLmAE3+tYSRvm5s79rq2yA7KLf
         UtnhKBT/I2Rc0S3HY/qnBNaba5Gnq72/53TrOp/aVFvEHsgiXiXAcngkeOt672etiZtM
         S3Isxl3FcgXqs6Qf/MgENd7FZ2wJELy4mYXvobjVCX263YcwEfUiO9XvMX4u6wv6EGpO
         HbYw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=tH/beTE3GEoYW5g7Zb/HEQLSjNDJDDivx/ept9cYhnw=;
        b=oK9Xs1SYxw7xq+nmL5MCJ+WUIDdBhByS9H1SrhgwBpzU7lD1OHKYNoYHUe2eVHVV7g
         VXmFZQ6i8zs+FDG0Ft2+k6KUTUGn5sKJarzJg+zJ+5RZIpREg16sfYOddKSCJjyck6Jh
         0K27WMFKTEjO6YMlxOrbg9bDGe/8YePPFVMIuFG+KwPiiZ/dKUYgIgK1oXkyuOSzYKpM
         JLI5NqS1j2kS1wU/Vyd8hUXXGch5sskCy+XH318uaSSrpKw0S7iTwGpGTTROapromi5R
         KRDlvP5iQ2h1faKmhFzN/zp7GBsluFLowiT+JQTZWk71gIFoY0eDs6KWe229+ZacPvyn
         D+Gw==
X-Gm-Message-State: AOAM530vX/EEO3zRP9ip49fdpm53lL0QAADKnZ//GfKJtvaHkzlNByn0
	XmTWXl3hhqyiK9frIaZcNP0=
X-Google-Smtp-Source: ABdhPJzWGDdVPm0nbTNg7s4gZDtF+dXd6VPP5uPKARSUWJrQlpZZwU+42DYU6yyAawlH+7Ikx5OTFA==
X-Received: by 2002:ae9:dfc7:: with SMTP id t190mr5480423qkf.293.1626377416082;
        Thu, 15 Jul 2021 12:30:16 -0700 (PDT)
Return-Path: <bruce.ashfield@gmail.com>
Received: from build.lan (cpe04d4c4975b80-cmf4c11490699b.cpe.net.cable.rogers.com. [174.112.63.222])
        by smtp.gmail.com with ESMTPSA id f36sm2340670qtb.40.2021.07.15.12.30.15
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 15 Jul 2021 12:30:15 -0700 (PDT)
From: "Bruce Ashfield" <bruce.ashfield@gmail.com>
To: richard.purdie@linuxfoundation.org
Cc: openembedded-core@lists.openembedded.org
Subject: [PATCH 2/8] linux-yocto-rt/5.13: integrate -rt1
Date: Thu, 15 Jul 2021 15:30:06 -0400
Message-Id: <c27aaab879ff0430db11f9d4cfe5aada807cbd8f.1626377295.git.bruce.ashfield@gmail.com>
X-Mailer: git-send-email 2.19.1
In-Reply-To: <cover.1626377295.git.bruce.ashfield@gmail.com>
References: <cover.1626377295.git.bruce.ashfield@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

From: Bruce Ashfield <bruce.ashfield@gmail.com>

-rt1 has been released for 5.13, we integrate those commits to our
preempt-rt/* branches.

Signed-off-by: Bruce Ashfield <bruce.ashfield@gmail.com>
---
 .../linux/linux-yocto-rt_5.13.bb              |  4 ++--
 .../linux/linux-yocto-tiny_5.13.bb            |  6 ++---
 meta/recipes-kernel/linux/linux-yocto_5.13.bb | 22 +++++++++----------
 3 files changed, 16 insertions(+), 16 deletions(-)

diff --git a/meta/recipes-kernel/linux/linux-yocto-rt_5.13.bb b/meta/recipes-kernel/linux/linux-yocto-rt_5.13.bb
index f87ab6bcfd..8dd6791b02 100644
--- a/meta/recipes-kernel/linux/linux-yocto-rt_5.13.bb
+++ b/meta/recipes-kernel/linux/linux-yocto-rt_5.13.bb
@@ -11,8 +11,8 @@ python () {
         raise bb.parse.SkipRecipe("Set PREFERRED_PROVIDER_virtual/kernel to linux-yocto-rt to enable it")
 }
 
-SRCREV_machine ?= "b1cead8d98582ca687f93e06438543b97144e5bf"
-SRCREV_meta ?= "ceb5fa598d08902fe2934c041875aa92d9a6fa19"
+SRCREV_machine ?= "e60f9507dee72c63193cbafe0a3c754210ff69fc"
+SRCREV_meta ?= "f80d46c2e088f4a33430442058aa881b1a31b95c"
 
 SRC_URI = "git://git.yoctoproject.org/linux-yocto.git;branch=${KBRANCH};name=machine \
            git://git.yoctoproject.org/yocto-kernel-cache;type=kmeta;name=meta;branch=yocto-5.13;destsuffix=${KMETA}"
diff --git a/meta/recipes-kernel/linux/linux-yocto-tiny_5.13.bb b/meta/recipes-kernel/linux/linux-yocto-tiny_5.13.bb
index f01133c761..83cfdba568 100644
--- a/meta/recipes-kernel/linux/linux-yocto-tiny_5.13.bb
+++ b/meta/recipes-kernel/linux/linux-yocto-tiny_5.13.bb
@@ -15,9 +15,9 @@ DEPENDS += "openssl-native util-linux-native"
 KMETA = "kernel-meta"
 KCONF_BSP_AUDIT_LEVEL = "2"
 
-SRCREV_machine_qemuarm ?= "84e5292c5adf2e715e842a9eb3985034941e0798"
-SRCREV_machine ?= "b1cead8d98582ca687f93e06438543b97144e5bf"
-SRCREV_meta ?= "ceb5fa598d08902fe2934c041875aa92d9a6fa19"
+SRCREV_machine_qemuarm ?= "51e261b235385efcee08c4b5489c544fb2935e2a"
+SRCREV_machine ?= "4fd6245b88c0700dfb7ffd951d5a7cd460935330"
+SRCREV_meta ?= "f80d46c2e088f4a33430442058aa881b1a31b95c"
 
 PV = "${LINUX_VERSION}+git${SRCPV}"
 
diff --git a/meta/recipes-kernel/linux/linux-yocto_5.13.bb b/meta/recipes-kernel/linux/linux-yocto_5.13.bb
index 74699d03ae..a96eab7fdb 100644
--- a/meta/recipes-kernel/linux/linux-yocto_5.13.bb
+++ b/meta/recipes-kernel/linux/linux-yocto_5.13.bb
@@ -13,17 +13,17 @@ KBRANCH_qemux86  ?= "v5.13/standard/base"
 KBRANCH_qemux86-64 ?= "v5.13/standard/base"
 KBRANCH_qemumips64 ?= "v5.13/standard/mti-malta64"
 
-SRCREV_machine_qemuarm ?= "9c2fd4b59ebf57f1900f82d49d6bf4fe074cf818"
-SRCREV_machine_qemuarm64 ?= "b1cead8d98582ca687f93e06438543b97144e5bf"
-SRCREV_machine_qemumips ?= "1ea414ef9e3a9744ec09f7ecebcc3b9aeffe39d0"
-SRCREV_machine_qemuppc ?= "b1cead8d98582ca687f93e06438543b97144e5bf"
-SRCREV_machine_qemuriscv64 ?= "b1cead8d98582ca687f93e06438543b97144e5bf"
-SRCREV_machine_qemuriscv32 ?= "b1cead8d98582ca687f93e06438543b97144e5bf"
-SRCREV_machine_qemux86 ?= "b1cead8d98582ca687f93e06438543b97144e5bf"
-SRCREV_machine_qemux86-64 ?= "b1cead8d98582ca687f93e06438543b97144e5bf"
-SRCREV_machine_qemumips64 ?= "b74fe3dcca0653609fcb75aad883b1db07619081"
-SRCREV_machine ?= "b1cead8d98582ca687f93e06438543b97144e5bf"
-SRCREV_meta ?= "ceb5fa598d08902fe2934c041875aa92d9a6fa19"
+SRCREV_machine_qemuarm ?= "60de9ae7ec5086c7aab26fef79c5ee22673e984b"
+SRCREV_machine_qemuarm64 ?= "4fd6245b88c0700dfb7ffd951d5a7cd460935330"
+SRCREV_machine_qemumips ?= "4ba021f55cd0f90d34d2432de21282e792e6ad06"
+SRCREV_machine_qemuppc ?= "4fd6245b88c0700dfb7ffd951d5a7cd460935330"
+SRCREV_machine_qemuriscv64 ?= "4fd6245b88c0700dfb7ffd951d5a7cd460935330"
+SRCREV_machine_qemuriscv32 ?= "4fd6245b88c0700dfb7ffd951d5a7cd460935330"
+SRCREV_machine_qemux86 ?= "4fd6245b88c0700dfb7ffd951d5a7cd460935330"
+SRCREV_machine_qemux86-64 ?= "4fd6245b88c0700dfb7ffd951d5a7cd460935330"
+SRCREV_machine_qemumips64 ?= "1fb4f7d7204bffe99a86e72b3cffe84c770be3ee"
+SRCREV_machine ?= "4fd6245b88c0700dfb7ffd951d5a7cd460935330"
+SRCREV_meta ?= "f80d46c2e088f4a33430442058aa881b1a31b95c"
 
 # set your preferred provider of linux-yocto to 'linux-yocto-upstream', and you'll
 # get the <version>/base branch, which is pure upstream -stable, and the same
-- 
2.19.1

