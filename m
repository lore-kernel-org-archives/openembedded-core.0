Received: from mail-qt1-f178.google.com (mail-qt1-f178.google.com [209.85.160.178])
 by mx.groups.io with SMTP id smtpd.web09.12006.1608647316270880586
 for <openembedded-core@lists.openembedded.org>;
 Tue, 22 Dec 2020 06:28:36 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20161025 header.b=cK/GCLtt;
 spf=pass (domain: gmail.com, ip: 209.85.160.178, mailfrom: bruce.ashfield@gmail.com)
Received: by mail-qt1-f178.google.com with SMTP id y15so9021018qtv.5
        for <openembedded-core@lists.openembedded.org>; Tue, 22 Dec 2020 06:28:36 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:content-transfer-encoding;
        bh=mdW4b25vtbybWdo256Vz7OoCUr4HhVoDiLr0N5E8FbY=;
        b=cK/GCLttahP7xNpDKtsHB3CK1Fzx8nGsl0Dnn4glxUF1GimDWizd+yp4tvT22m6tKF
         DVo0WHNRAFRGrYM6u7S7QiAWZSSHVT8hAdYWKHxWTb70214HlpcQwU7g3uiQPV0Uegrt
         PmjoQuCptQx16L1bkwgPSIYst/v7SxXkWqZ7dSA/OK2JWBAAKl+NO6Y/dS3+7G9oYxum
         LFVAZ4v+Lyzb5UC/c2x9FvPAEUChC+TrmwgNKjBkXWrTuYT2ZsHpr0bd61p7qVF8hTLD
         eh0qkqNRO0kqZVQL3cOEjBjDFY7bL9xF4zQ2HjA+D6H2QmYvYFzohZw14h6CZ/HEQygr
         2azA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=mdW4b25vtbybWdo256Vz7OoCUr4HhVoDiLr0N5E8FbY=;
        b=fBf4rHfO4sAHwlG+tVH8NFdsw9M4zWakBKCeq4a2zLV0IU0D4W9KYIeipyRMrF7FIx
         fUBTaCYCuBcV9HzGMBYUDKSrJT4bylLEtaWJwaBxQVROtAKnSQOZFybn/UmBoiu0AHb3
         jxVhVC1WDkkUDT4lqXexG7Ar2Wc3w7pqRYtCcX9ZMolt9K5dD/UHC6oDY8mfKfKwE49D
         DUB6I90bzG7J6CucxjnCIFwclu9wWIpzGw9qFofWg0AY6YOtAbg81fmg36GDXDhAIxw/
         y/z8FShSRWHaeYqW03ILSJ+IGKjncqM3bPaF0FcI3EufGIfEMIvcgC8RzpC7Nh7xOHQt
         3E3w==
X-Gm-Message-State: AOAM531JxK9EYHTwLD/HxWfjlR3dUSWuuP4VqRnzDuaREAMQYWKD8bhB
	6hzczT5E5b2UTssCT94tSQk=
X-Google-Smtp-Source: ABdhPJzXwoWRSYCQK0lShDR2iCItIUcoJuZXYjWmGXPIP1W6MoCsChkujnvirXHISdkjRcNWdbBzWA==
X-Received: by 2002:aed:3c12:: with SMTP id t18mr21267121qte.348.1608647315439;
        Tue, 22 Dec 2020 06:28:35 -0800 (PST)
Return-Path: <bruce.ashfield@gmail.com>
Received: from localhost.localdomain (cpe04d4c4975b80-cm64777d5e8820.cpe.net.cable.rogers.com. [174.112.165.127])
        by smtp.gmail.com with ESMTPSA id u65sm13169866qkb.58.2020.12.22.06.28.34
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 22 Dec 2020 06:28:34 -0800 (PST)
From: "Bruce Ashfield" <bruce.ashfield@gmail.com>
To: richard.purdie@linuxfoundation.org
Cc: openembedded-core@lists.openembedded.org
Subject: [PATCH 6/9] linux-yocto/5.8/cfg: fix -tiny warnings
Date: Tue, 22 Dec 2020 09:28:23 -0500
Message-Id: <74ae5e39471634007a421dfd0233c3a388e88b4c.1608646697.git.bruce.ashfield@gmail.com>
X-Mailer: git-send-email 2.19.1
In-Reply-To: <cover.1608646697.git.bruce.ashfield@gmail.com>
References: <cover.1608646697.git.bruce.ashfield@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

From: Bruce Ashfield <bruce.ashfield@gmail.com>

Integrating the following commit(s) for configuration tweaks:

    b976de4f41d drm: change CONFIG_DRM_KMS_HELPER to =m
    669f5aa3795 tiny: enable CONFIG_FW_LOADER on a per-BSP basis
    d94b2d9f137 i915: adust helper to 'm'

Signed-off-by: Bruce Ashfield <bruce.ashfield@gmail.com>
---
 meta/recipes-kernel/linux/linux-yocto-rt_5.8.bb   | 2 +-
 meta/recipes-kernel/linux/linux-yocto-tiny_5.8.bb | 2 +-
 meta/recipes-kernel/linux/linux-yocto_5.8.bb      | 2 +-
 3 files changed, 3 insertions(+), 3 deletions(-)

diff --git a/meta/recipes-kernel/linux/linux-yocto-rt_5.8.bb b/meta/recipes-kernel/linux/linux-yocto-rt_5.8.bb
index fae984cd4e..d20b8b10ab 100644
--- a/meta/recipes-kernel/linux/linux-yocto-rt_5.8.bb
+++ b/meta/recipes-kernel/linux/linux-yocto-rt_5.8.bb
@@ -12,7 +12,7 @@ python () {
 }
 
 SRCREV_machine ?= "3c5d210805d61bea8f8a8081e0e3a89ea8a61f3f"
-SRCREV_meta ?= "25b672aa4759b6ceb48777eb586033a186091692"
+SRCREV_meta ?= "b976de4f41df1a50dc84839b64fb0ce2c6f9fb21"
 
 SRC_URI = "git://git.yoctoproject.org/linux-yocto.git;branch=${KBRANCH};name=machine \
            git://git.yoctoproject.org/yocto-kernel-cache;type=kmeta;name=meta;branch=yocto-5.8;destsuffix=${KMETA}"
diff --git a/meta/recipes-kernel/linux/linux-yocto-tiny_5.8.bb b/meta/recipes-kernel/linux/linux-yocto-tiny_5.8.bb
index b98d99a81f..a5135155d5 100644
--- a/meta/recipes-kernel/linux/linux-yocto-tiny_5.8.bb
+++ b/meta/recipes-kernel/linux/linux-yocto-tiny_5.8.bb
@@ -17,7 +17,7 @@ KCONF_BSP_AUDIT_LEVEL = "2"
 
 SRCREV_machine_qemuarm ?= "9509db6e3ed6a23b1f7495b53248d1cbfe22710b"
 SRCREV_machine ?= "3c5d210805d61bea8f8a8081e0e3a89ea8a61f3f"
-SRCREV_meta ?= "25b672aa4759b6ceb48777eb586033a186091692"
+SRCREV_meta ?= "b976de4f41df1a50dc84839b64fb0ce2c6f9fb21"
 
 PV = "${LINUX_VERSION}+git${SRCPV}"
 
diff --git a/meta/recipes-kernel/linux/linux-yocto_5.8.bb b/meta/recipes-kernel/linux/linux-yocto_5.8.bb
index a2dacb2676..f6ebefbf1b 100644
--- a/meta/recipes-kernel/linux/linux-yocto_5.8.bb
+++ b/meta/recipes-kernel/linux/linux-yocto_5.8.bb
@@ -21,7 +21,7 @@ SRCREV_machine_qemux86 ?= "3c5d210805d61bea8f8a8081e0e3a89ea8a61f3f"
 SRCREV_machine_qemux86-64 ?= "3c5d210805d61bea8f8a8081e0e3a89ea8a61f3f"
 SRCREV_machine_qemumips64 ?= "01a02b058f9a8941032b298b8d25c673526152f4"
 SRCREV_machine ?= "3c5d210805d61bea8f8a8081e0e3a89ea8a61f3f"
-SRCREV_meta ?= "25b672aa4759b6ceb48777eb586033a186091692"
+SRCREV_meta ?= "b976de4f41df1a50dc84839b64fb0ce2c6f9fb21"
 
 # remap qemuarm to qemuarma15 for the 5.8 kernel
 # KMACHINE_qemuarm ?= "qemuarma15"
-- 
2.19.1

