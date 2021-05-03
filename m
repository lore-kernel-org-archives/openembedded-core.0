Received: from mail-qk1-f178.google.com (mail-qk1-f178.google.com [209.85.222.178])
 by mx.groups.io with SMTP id smtpd.web12.33046.1620046478828163228
 for <openembedded-core@lists.openembedded.org>;
 Mon, 03 May 2021 05:54:39 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20161025 header.b=ZF/Hu8vn;
 spf=pass (domain: gmail.com, ip: 209.85.222.178, mailfrom: bruce.ashfield@gmail.com)
Received: by mail-qk1-f178.google.com with SMTP id o27so4806789qkj.9
        for <openembedded-core@lists.openembedded.org>; Mon, 03 May 2021 05:54:38 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:content-transfer-encoding;
        bh=gxIGTnI+6zhTU7b9qy5N1vNtZ+aJM8JfMuwBHD9GfXc=;
        b=ZF/Hu8vngsofckXa7zrdqqS9a3BZVhFSyU75GvAbfcMTb6qNALkMk/e9/0okt0G3up
         NPPIOsZyLeeSUQhkQIx4mdg/4mqETDY6hdHsByGymUos+W/F0wryuVjy+lb3kyx5tmvR
         wbH2C3en8SWgBv5ZzWfv03x5xExmy2RRdobz2jiVyj2ynDsT4+rYLC6HOBdYsMcE4mgI
         wmzX18Wcp2AUy2fbpXUVvMhuNNrJi0bHCm8jqaCWFV4N1VCQv9vsKtvlWunVXU2oRUs2
         VxRXUgLqoCo+wTbGJMVW0pnw8IE9sdjS+I7xbpds2jqe7ERPkVYH2M6BBUxYHRO5WC7g
         2wJg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=gxIGTnI+6zhTU7b9qy5N1vNtZ+aJM8JfMuwBHD9GfXc=;
        b=JE4j6Mh46BWjAQ9z3lFgE76hbMA0gSY/Kans3NJAkRyCbKAgBOeaGGs2jjGROYwP2t
         3089rCgksOjO4y7nxKocPQnvgfxu/floNF23tNdInFCdMYsGAqVaDyhyeuaY0uDh+e4I
         7OYUvS2ygjnk6NaSdDU8drgRBQPUe3q4+rvym6TnBoNwkJbhtB1CmCvokJEvtLPSv+rV
         /bp23iZSlbmLLRhwK+oye/X+hUZUQzHNvtLZb7H8Z/zs+m47fc7gXJYlJstVy1X6LVZz
         M1pMVO7Z7eBv4433ro6WvM5ctx55D4PDfDDpHBf70kd6Vsn674/yv4Ub70IBhT5fcWay
         mNCg==
X-Gm-Message-State: AOAM530gx6xkBul5jdTV2jZt38K9sqUFOxgXWc7dq3QVTJNb9RRj5XMT
	2PYe3wWkZD2yoMG8gSMKy1N1t2pXd8c+Og==
X-Google-Smtp-Source: ABdhPJxbkgb1XC5p5YeaDbnG7wMTmhmo0rjaE2qF5FIBpVR/BQ14jyD/j3Z+pFrCn5V5yUFUP22tYg==
X-Received: by 2002:a37:317:: with SMTP id 23mr7252133qkd.66.1620046478001;
        Mon, 03 May 2021 05:54:38 -0700 (PDT)
Return-Path: <bruce.ashfield@gmail.com>
Received: from build.lan (cpe04d4c4975b80-cmf4c11490699b.cpe.net.cable.rogers.com. [174.112.159.151])
        by smtp.gmail.com with ESMTPSA id 19sm1940867qkn.111.2021.05.03.05.54.37
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 03 May 2021 05:54:37 -0700 (PDT)
From: "Bruce Ashfield" <bruce.ashfield@gmail.com>
To: richard.purdie@linuxfoundation.org
Cc: openembedded-core@lists.openembedded.org
Subject: [PATCH 2/7] linux-yocto/5.10: qemuriscv32.cfg: RV32 only supports 1G physical memory
Date: Mon,  3 May 2021 08:54:28 -0400
Message-Id: <30e466bfe52a72dde7316ba774a3075d5501151a.1620046297.git.bruce.ashfield@gmail.com>
X-Mailer: git-send-email 2.19.1
In-Reply-To: <cover.1620046297.git.bruce.ashfield@gmail.com>
References: <cover.1620046297.git.bruce.ashfield@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

From: Bruce Ashfield <bruce.ashfield@gmail.com>

Integrating the following commit(s) to linux-yocto/5.10:

    a19886b00ea qemuriscv32.cfg: RV32 only supports 1G physical memory

Signed-off-by: Khem Raj <raj.khem@gmail.com>
Signed-off-by: Bruce Ashfield <bruce.ashfield@gmail.com>
---
 meta/recipes-kernel/linux/linux-yocto-rt_5.10.bb   | 2 +-
 meta/recipes-kernel/linux/linux-yocto-tiny_5.10.bb | 2 +-
 meta/recipes-kernel/linux/linux-yocto_5.10.bb      | 2 +-
 3 files changed, 3 insertions(+), 3 deletions(-)

diff --git a/meta/recipes-kernel/linux/linux-yocto-rt_5.10.bb b/meta/recipes-kernel/linux/linux-yocto-rt_5.10.bb
index c491eed163..0902fe4fa1 100644
--- a/meta/recipes-kernel/linux/linux-yocto-rt_5.10.bb
+++ b/meta/recipes-kernel/linux/linux-yocto-rt_5.10.bb
@@ -12,7 +12,7 @@ python () {
 }
 
 SRCREV_machine ?= "196677064883beeaacb68de437512a0e4ee07050"
-SRCREV_meta ?= "8f16b5cfe0600f2a7ed1ce68633a88a1196b9776"
+SRCREV_meta ?= "a19886b00ea7d874fdd60d8e3435894bb16e6434"
 
 SRC_URI = "git://git.yoctoproject.org/linux-yocto.git;branch=${KBRANCH};name=machine \
            git://git.yoctoproject.org/yocto-kernel-cache;type=kmeta;name=meta;branch=yocto-5.10;destsuffix=${KMETA}"
diff --git a/meta/recipes-kernel/linux/linux-yocto-tiny_5.10.bb b/meta/recipes-kernel/linux/linux-yocto-tiny_5.10.bb
index 0e3771461b..079f4a215e 100644
--- a/meta/recipes-kernel/linux/linux-yocto-tiny_5.10.bb
+++ b/meta/recipes-kernel/linux/linux-yocto-tiny_5.10.bb
@@ -17,7 +17,7 @@ KCONF_BSP_AUDIT_LEVEL = "2"
 
 SRCREV_machine_qemuarm ?= "bcb76d132fb1e90f6db0a598b3c46b180a9b71ea"
 SRCREV_machine ?= "a8808e541750d4ed34105f615e295f6fbd9950fa"
-SRCREV_meta ?= "8f16b5cfe0600f2a7ed1ce68633a88a1196b9776"
+SRCREV_meta ?= "a19886b00ea7d874fdd60d8e3435894bb16e6434"
 
 PV = "${LINUX_VERSION}+git${SRCPV}"
 
diff --git a/meta/recipes-kernel/linux/linux-yocto_5.10.bb b/meta/recipes-kernel/linux/linux-yocto_5.10.bb
index 2221e99f3c..c8a2e3906f 100644
--- a/meta/recipes-kernel/linux/linux-yocto_5.10.bb
+++ b/meta/recipes-kernel/linux/linux-yocto_5.10.bb
@@ -23,7 +23,7 @@ SRCREV_machine_qemux86 ?= "a8808e541750d4ed34105f615e295f6fbd9950fa"
 SRCREV_machine_qemux86-64 ?= "a8808e541750d4ed34105f615e295f6fbd9950fa"
 SRCREV_machine_qemumips64 ?= "f89a64b85a068ac96ccd69f5170b2fbe957d4162"
 SRCREV_machine ?= "a8808e541750d4ed34105f615e295f6fbd9950fa"
-SRCREV_meta ?= "8f16b5cfe0600f2a7ed1ce68633a88a1196b9776"
+SRCREV_meta ?= "a19886b00ea7d874fdd60d8e3435894bb16e6434"
 
 # remap qemuarm to qemuarma15 for the 5.8 kernel
 # KMACHINE_qemuarm ?= "qemuarma15"
-- 
2.19.1

