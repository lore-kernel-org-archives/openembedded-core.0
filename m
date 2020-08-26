Received: from mail-qk1-f194.google.com (mail-qk1-f194.google.com [209.85.222.194])
 by mx.groups.io with SMTP id smtpd.web11.12993.1598450261047302548
 for <openembedded-core@lists.openembedded.org>;
 Wed, 26 Aug 2020 06:57:41 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20161025 header.b=Tie11GJU;
 spf=pass (domain: gmail.com, ip: 209.85.222.194, mailfrom: bruce.ashfield@gmail.com)
Received: by mail-qk1-f194.google.com with SMTP id z3so1888633qkz.7
        for <openembedded-core@lists.openembedded.org>; Wed, 26 Aug 2020 06:57:40 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:content-transfer-encoding;
        bh=RycifukV5oyNhuz64zelfvruoYQunUEyEAtz8zhHUKE=;
        b=Tie11GJU9bG6tun+R/arsuqyU7Y72VNwhvdepsr6SPoHumci8d/Le5KRyh8/oGJOjn
         2xPBOpNY8ivfQywRQMc0NB8GwtmSuqB+1hhgw5E3pllo+9LjERmw5/P+yiGStj7fxata
         n+MCzBXMtAt87Z73m88M5KeTfsZqj0nNrQ/pjgwH9QhYMnS6MjHk3T9qC3eEGtTtyQnj
         eQZ00n+Anm9WUJjTPGtnKrwEBXykukqI4n5X4R98JL2evdVSEqEcMlirRA5VlE93i9LU
         vl4jo7mCzJb1BABb62lPhTvOivR7vbzXz4UF4eyR5zdA2Xt+7zCKuE1Nof670fGkSEvC
         nM2Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=RycifukV5oyNhuz64zelfvruoYQunUEyEAtz8zhHUKE=;
        b=VdBe0bYMIhS29i6a9X8z7c1wSQieeJ3rDN1+MxAUFxWwi8mOLgHHGXIACm/Cry+Ut/
         bsOHuPCybYjKEg4fTsSSWoOZ5ordvZHWxp+mHmNWTEhQVETPMDnUT/t7CeXwhC560DCw
         61zfGHojP8v6VbiBnhLg5bH24okijYvnnuPrMUgoM4ZpjlphE3GhmYpPu2e8GtEnFHc+
         fuONb7prPZ65mogTQv1j5DRCCYTY837jr5odpreNBbIvjr/WWteWS4rh78iPwBP5P5tr
         jh5pqWiOwPRce/v8LJNQiJjipz6tJNlz120dSm91cOD5CHzOvyKVFdZ/ntAuo7qoYHHL
         rQUw==
X-Gm-Message-State: AOAM530jFmV67YWZ94UYG6jHwDxYFy7DacsFsrkPotHeFtgDGCQSK3Jo
	d6/k0eqKHiPPq72/R6FvbwUqWxVdXmC1EiEU
X-Google-Smtp-Source: ABdhPJxWsLbF+DtFDj3oIjOqsYBKSz2Rjp93WWb7yibBi/tXwy2Y+oY/gso0pjLjgLq7C26xQmhSRw==
X-Received: by 2002:a37:64c8:: with SMTP id y191mr14625758qkb.231.1598450260127;
        Wed, 26 Aug 2020 06:57:40 -0700 (PDT)
Return-Path: <bruce.ashfield@gmail.com>
Received: from localhost.localdomain (CPE04d4c4975b80-CM64777d5e8820.cpe.net.cable.rogers.com. [174.112.240.214])
        by smtp.gmail.com with ESMTPSA id a52sm1371737qtc.22.2020.08.26.06.57.37
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 26 Aug 2020 06:57:38 -0700 (PDT)
From: "Bruce Ashfield" <bruce.ashfield@gmail.com>
To: richard.purdie@linuxfoundation.org
Cc: openembedded-core@lists.openembedded.org
Subject: [PATCH 3/3] kernel: config cleanups for 5.8+
Date: Wed, 26 Aug 2020 09:57:31 -0400
Message-Id: <292c77c77a27643ef17364375547975be842c8cc.1598450136.git.bruce.ashfield@gmail.com>
X-Mailer: git-send-email 2.19.1
In-Reply-To: <cover.1598450136.git.bruce.ashfield@gmail.com>
References: <cover.1598450136.git.bruce.ashfield@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

From: Bruce Ashfield <bruce.ashfield@gmail.com>

Integrating the following configuration tweaks to fixup warnings and
remove obselete configs for 5.8+:

   84377c2c723 features: rename INTEL_PMC_IPC to MFD_INTEL_PMC_BXT
   89b30487d09 features/inline: remove
   0d357ccb3f3 intel-tco: switch ITCO_WDT to loadable module
   0baed75c082 bsp: Drop the stale USB_MUSB_AM335X_CHILD

Signed-off-by: Bruce Ashfield <bruce.ashfield@gmail.com>
---
 meta/recipes-kernel/linux/linux-yocto-rt_5.8.bb   | 2 +-
 meta/recipes-kernel/linux/linux-yocto-tiny_5.8.bb | 2 +-
 meta/recipes-kernel/linux/linux-yocto_5.8.bb      | 2 +-
 3 files changed, 3 insertions(+), 3 deletions(-)

diff --git a/meta/recipes-kernel/linux/linux-yocto-rt_5.8.bb b/meta/recipes-kernel/linux/linux-yocto-rt_5.8.bb
index 8397567996..363b771967 100644
--- a/meta/recipes-kernel/linux/linux-yocto-rt_5.8.bb
+++ b/meta/recipes-kernel/linux/linux-yocto-rt_5.8.bb
@@ -12,7 +12,7 @@ python () {
 }
 
 SRCREV_machine ?= "34702049e3c1a4bb927e5f8d1cbe5f134afb4036"
-SRCREV_meta ?= "da09024fed6c2d350ad69d400d4faaf4f2b623de"
+SRCREV_meta ?= "84377c2c723fe121d041f8fcfc99b8c244dcd6b0"
 
 SRC_URI = "git://git.yoctoproject.org/linux-yocto.git;branch=${KBRANCH};name=machine \
            git://git.yoctoproject.org/yocto-kernel-cache;type=kmeta;name=meta;branch=yocto-5.8;destsuffix=${KMETA}"
diff --git a/meta/recipes-kernel/linux/linux-yocto-tiny_5.8.bb b/meta/recipes-kernel/linux/linux-yocto-tiny_5.8.bb
index 8d95d5f589..6c18a6178f 100644
--- a/meta/recipes-kernel/linux/linux-yocto-tiny_5.8.bb
+++ b/meta/recipes-kernel/linux/linux-yocto-tiny_5.8.bb
@@ -17,7 +17,7 @@ KCONF_BSP_AUDIT_LEVEL = "2"
 
 SRCREV_machine_qemuarm ?= "e5992f87f18d3e99f7448111f99bb1769dc718c7"
 SRCREV_machine ?= "34702049e3c1a4bb927e5f8d1cbe5f134afb4036"
-SRCREV_meta ?= "da09024fed6c2d350ad69d400d4faaf4f2b623de"
+SRCREV_meta ?= "84377c2c723fe121d041f8fcfc99b8c244dcd6b0"
 
 PV = "${LINUX_VERSION}+git${SRCPV}"
 
diff --git a/meta/recipes-kernel/linux/linux-yocto_5.8.bb b/meta/recipes-kernel/linux/linux-yocto_5.8.bb
index 4e2043baef..283c74694d 100644
--- a/meta/recipes-kernel/linux/linux-yocto_5.8.bb
+++ b/meta/recipes-kernel/linux/linux-yocto_5.8.bb
@@ -21,7 +21,7 @@ SRCREV_machine_qemux86 ?= "34702049e3c1a4bb927e5f8d1cbe5f134afb4036"
 SRCREV_machine_qemux86-64 ?= "34702049e3c1a4bb927e5f8d1cbe5f134afb4036"
 SRCREV_machine_qemumips64 ?= "f8266b2a44053579c3bb0bde59552b30091ddb83"
 SRCREV_machine ?= "34702049e3c1a4bb927e5f8d1cbe5f134afb4036"
-SRCREV_meta ?= "da09024fed6c2d350ad69d400d4faaf4f2b623de"
+SRCREV_meta ?= "84377c2c723fe121d041f8fcfc99b8c244dcd6b0"
 
 # remap qemuarm to qemuarma15 for the 5.8 kernel
 # KMACHINE_qemuarm ?= "qemuarma15"
-- 
2.19.1

