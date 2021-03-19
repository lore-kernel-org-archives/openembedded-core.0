Received: from mail-qt1-f176.google.com (mail-qt1-f176.google.com [209.85.160.176])
 by mx.groups.io with SMTP id smtpd.web09.1703.1616180320949971538
 for <openembedded-core@lists.openembedded.org>;
 Fri, 19 Mar 2021 11:58:41 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20161025 header.b=t0gBcXZO;
 spf=pass (domain: gmail.com, ip: 209.85.160.176, mailfrom: bruce.ashfield@gmail.com)
Received: by mail-qt1-f176.google.com with SMTP id x9so7563502qto.8
        for <openembedded-core@lists.openembedded.org>; Fri, 19 Mar 2021 11:58:40 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:content-transfer-encoding;
        bh=yBs1rxyWe+ye+oQrnKm1P3Ey3tNVZADWXtsOng3787g=;
        b=t0gBcXZOg1lsbHyPB6ACsXqmqt1RnZ6hKXByn+xbYOyLQPgzlMXXubSmNQiDn8AIpR
         TjLVqr9+cemLbCVuqGG6XGm5M6q6833sgmzxJ9OZqDKm/AfGjPjZLRN9sm271RIcFLQH
         G7IKUbGgYfIAVpCOc41MdDaIcWuWK1bdD4TMjoDRSEDQe+7ITBrK37ZTUsTBYTukXfjh
         tqF4DIb6mHoFcOs/BZ94RziW6GCfHGnNIpu5EY0VbnhX59tO1/NouRBQ5qY1IYHCjk0F
         kH+9Tuj2B2af1OVrstTxWCy8d3IrKf36a8+aVg7u7GcTWpoHMYsTvJ8UT4nVblE5ilwJ
         NGaQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=yBs1rxyWe+ye+oQrnKm1P3Ey3tNVZADWXtsOng3787g=;
        b=MMkBJLkZroFR2r5vAY1mPZAntEiFoZEuwf73hGvSfgIHcyxUqliHQM1jydq4nVItsq
         TOg6TltdF6PQKGwOrNeEk1cAOqi+wJrikCRycVAK27PSaEwbLBb5gjqfrtdlQ9xylbzA
         NKaCjf/sXXJOfQWozQ1Wq63evkL4dlkGic63BRkbntW1KsvLbrnHAPsUgDnsf1R5sdlx
         diFcQh2kmQvEZzAh0F/R9bfoRe0MgKtfE3rjsc4Tt8D/M2ANqMDP6O6o1+XQqyq4Sep1
         GexE9MzSoGWLoG8M7hYQyY6caFnG/ALNghvtvCix2c6dy8qFgAeqC5i3HXqEA9IC2UBA
         o2/w==
X-Gm-Message-State: AOAM531XWI+rbqShihBI4yN2v8m4pDdflCk/WIXWvzWwpmgzhkhgPB2l
	tocIgm1rR/CBGATXSbrl75GeomYPsUDQKqHl
X-Google-Smtp-Source: ABdhPJxB2xBaKycZez1npoWb1tsvGCoEP9W3FNzIqZBN61KkKXzwaz3MZecO9Q2gyIlOUXjCanpNbw==
X-Received: by 2002:ac8:dc3:: with SMTP id t3mr21328qti.221.1616180320133;
        Fri, 19 Mar 2021 11:58:40 -0700 (PDT)
Return-Path: <bruce.ashfield@gmail.com>
Received: from build.lan (cpe04d4c4975b80-cmf4c11490699b.cpe.net.cable.rogers.com. [174.112.159.151])
        by smtp.gmail.com with ESMTPSA id j1sm4402191qti.55.2021.03.19.11.58.39
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 19 Mar 2021 11:58:39 -0700 (PDT)
From: "Bruce Ashfield" <bruce.ashfield@gmail.com>
To: richard.purdie@linuxfoundation.org
Cc: openembedded-core@lists.openembedded.org
Subject: [PATCH 1/8] linux-yocto/5.10: fix SERIAL_OF_PLATFORM warning
Date: Fri, 19 Mar 2021 14:58:30 -0400
Message-Id: <cae0d7eb12bd1350892d5ec5df96b1b7ce0cbed4.1616180065.git.bruce.ashfield@gmail.com>
X-Mailer: git-send-email 2.19.1
In-Reply-To: <cover.1616180065.git.bruce.ashfield@gmail.com>
References: <cover.1616180065.git.bruce.ashfield@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

From: Bruce Ashfield <bruce.ashfield@gmail.com>

Integrating the following commit(s) to linux-yocto.:

    a0249ac3bae cfg: classify CONFIG_SERIAL_OF_PLATFORM as non-hardware

By declaring the option non-hardware, we make it optional and hence
fix the warning on non OF platforms.

Signed-off-by: Bruce Ashfield <bruce.ashfield@gmail.com>
---
 meta/recipes-kernel/linux/linux-yocto-rt_5.10.bb   | 2 +-
 meta/recipes-kernel/linux/linux-yocto-tiny_5.10.bb | 2 +-
 meta/recipes-kernel/linux/linux-yocto_5.10.bb      | 2 +-
 3 files changed, 3 insertions(+), 3 deletions(-)

diff --git a/meta/recipes-kernel/linux/linux-yocto-rt_5.10.bb b/meta/recipes-kernel/linux/linux-yocto-rt_5.10.bb
index 4a4aa2b9d4..7375537654 100644
--- a/meta/recipes-kernel/linux/linux-yocto-rt_5.10.bb
+++ b/meta/recipes-kernel/linux/linux-yocto-rt_5.10.bb
@@ -12,7 +12,7 @@ python () {
 }
 
 SRCREV_machine ?= "36889a571fe57fe3561cc23f842b92e4ea9ca264"
-SRCREV_meta ?= "8c8f6a791bed6e8f675236946e805a7fc489e382"
+SRCREV_meta ?= "7d652f104151052fe4c0cf48d7bc0d7e0c0a7dad"
 
 SRC_URI = "git://git.yoctoproject.org/linux-yocto.git;branch=${KBRANCH};name=machine \
            git://git.yoctoproject.org/yocto-kernel-cache;type=kmeta;name=meta;branch=yocto-5.10;destsuffix=${KMETA}"
diff --git a/meta/recipes-kernel/linux/linux-yocto-tiny_5.10.bb b/meta/recipes-kernel/linux/linux-yocto-tiny_5.10.bb
index 8bb1037476..934c1c99b1 100644
--- a/meta/recipes-kernel/linux/linux-yocto-tiny_5.10.bb
+++ b/meta/recipes-kernel/linux/linux-yocto-tiny_5.10.bb
@@ -17,7 +17,7 @@ KCONF_BSP_AUDIT_LEVEL = "2"
 
 SRCREV_machine_qemuarm ?= "9d6d37cfe365ebd5b530f9c43c1ace924343bb15"
 SRCREV_machine ?= "8c516ced69f41563404ada0bea315a55bcf1df6f"
-SRCREV_meta ?= "8c8f6a791bed6e8f675236946e805a7fc489e382"
+SRCREV_meta ?= "7d652f104151052fe4c0cf48d7bc0d7e0c0a7dad"
 
 PV = "${LINUX_VERSION}+git${SRCPV}"
 
diff --git a/meta/recipes-kernel/linux/linux-yocto_5.10.bb b/meta/recipes-kernel/linux/linux-yocto_5.10.bb
index 03d7c6a3de..f867a125a4 100644
--- a/meta/recipes-kernel/linux/linux-yocto_5.10.bb
+++ b/meta/recipes-kernel/linux/linux-yocto_5.10.bb
@@ -23,7 +23,7 @@ SRCREV_machine_qemux86 ?= "8c516ced69f41563404ada0bea315a55bcf1df6f"
 SRCREV_machine_qemux86-64 ?= "8c516ced69f41563404ada0bea315a55bcf1df6f"
 SRCREV_machine_qemumips64 ?= "f1c01716513524065f0f231c6e6502cd9a3ecb53"
 SRCREV_machine ?= "8c516ced69f41563404ada0bea315a55bcf1df6f"
-SRCREV_meta ?= "8c8f6a791bed6e8f675236946e805a7fc489e382"
+SRCREV_meta ?= "7d652f104151052fe4c0cf48d7bc0d7e0c0a7dad"
 
 # remap qemuarm to qemuarma15 for the 5.8 kernel
 # KMACHINE_qemuarm ?= "qemuarma15"
-- 
2.19.1

