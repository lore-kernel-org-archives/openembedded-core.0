Received: from mail-qt1-f195.google.com (mail-qt1-f195.google.com [209.85.160.195])
 by mx.groups.io with SMTP id smtpd.web10.32757.1597618277449030427
 for <openembedded-core@lists.openembedded.org>;
 Sun, 16 Aug 2020 15:51:17 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20161025 header.b=kFxOWj6e;
 spf=pass (domain: gmail.com, ip: 209.85.160.195, mailfrom: bruce.ashfield@gmail.com)
Received: by mail-qt1-f195.google.com with SMTP id c12so11144084qtn.9
        for <openembedded-core@lists.openembedded.org>; Sun, 16 Aug 2020 15:51:17 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:content-transfer-encoding;
        bh=B5fG+qzFc/o012x4CMo/BDBPhQ99aGS+/8LDuC4xFHs=;
        b=kFxOWj6eP6IMMv8i2pUg/HMhuovt0pa5UnczIw4/jRaTRqTjQlvBRltR+EIelGU6ez
         BXDu7PjiWQe5/0uWVH+IkNn87nn/qc9tER3mP4Qoi7/Pi131454XqZCGcamf7og84tJr
         lysgs29gVdDn90bK3VVLzYb6tqSNNzLat1jo7mFke0JctAKMuilv3rHbothHN6LBbQyE
         cel8/sSTkqfKUHtjHDP1EqpJR+svNg1Os/OVYudO34W1oR9vpBXSAY2Vr43T4iq8sPbX
         aFvlci1VAAD3RymHG5lqG53KsuO5weE3ktgzp/jAYkAJpeN2vdOI7N5FZ/17teLyDR6F
         EvUg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=B5fG+qzFc/o012x4CMo/BDBPhQ99aGS+/8LDuC4xFHs=;
        b=U0R8FVlDLhdXAK7NrGYR4NB1wCYm57KwdHMxYGIv+NL8MBjJHEx004FLlAU9zUOJsj
         NodJfeJf3sTmkptd1OiJY2m5/tMsFnjl60BPNeXFkBQitriaok78wEuh/AqNNBHjOl16
         H82Hz94zFt9n+JrjUcVvD+lL3Qz8JlGQzW9KpoNkkroBVSD9QlCe5M37cO16+FTu+lWw
         Kx1tnITpogMIEp5thGDGvvhfkY2qf6ESi9j1AjBlb4gP11eOGrAaw8ZRvStPNloMWeJv
         l9BCnMB3nnj5k2F0Ao6y2k9JImdkwVnP7Y5nYeML054dYOZFU7OYnIaTTpB/nT9+8nR4
         e5KA==
X-Gm-Message-State: AOAM533JQJR0kXZ5kapYFePkL+8I/iI/eYePjktx1fGZtaylv8/baLw+
	blKjtJ70GX9KL4TxA/TKG8E=
X-Google-Smtp-Source: ABdhPJz7U3+cJbqWtAa2o8yuyYKqiMFT9adWajZZa3gkq/u9UHOJsWCLQ1XBC8z6GqFIkAEfSd4Zqg==
X-Received: by 2002:ac8:3fd3:: with SMTP id v19mr10988029qtk.58.1597618276568;
        Sun, 16 Aug 2020 15:51:16 -0700 (PDT)
Return-Path: <bruce.ashfield@gmail.com>
Received: from localhost.localdomain (CPE04d4c4975b80-CM64777d5e8820.cpe.net.cable.rogers.com. [174.112.240.214])
        by smtp.gmail.com with ESMTPSA id n128sm15576578qke.8.2020.08.16.15.51.15
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 16 Aug 2020 15:51:15 -0700 (PDT)
From: "Bruce Ashfield" <bruce.ashfield@gmail.com>
To: richard.purdie@linuxfoundation.org
Cc: openembedded-core@lists.openembedded.org
Subject: [PATCH 2/2] linux-yocto/5.4: perf cs-etm: Move definition of 'traceid_list' global variable from header file
Date: Sun, 16 Aug 2020 18:51:13 -0400
Message-Id: <20200816225113.6741-2-bruce.ashfield@gmail.com>
X-Mailer: git-send-email 2.19.1
In-Reply-To: <20200816225113.6741-1-bruce.ashfield@gmail.com>
References: <20200816225113.6741-1-bruce.ashfield@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

From: Bruce Ashfield <bruce.ashfield@gmail.com>

Integrating the following commit(s) to linux-yocto/5.4:

    706efec4c1e2 perf cs-etm: Move definition of 'traceid_list' global variable from header file

Signed-off-by: Bruce Ashfield <bruce.ashfield@gmail.com>
---
 .../recipes-kernel/linux/linux-yocto-rt_5.4.bb |  2 +-
 .../linux/linux-yocto-tiny_5.4.bb              |  4 ++--
 meta/recipes-kernel/linux/linux-yocto_5.4.bb   | 18 +++++++++---------
 3 files changed, 12 insertions(+), 12 deletions(-)

diff --git a/meta/recipes-kernel/linux/linux-yocto-rt_5.4.bb b/meta/recipes-kernel/linux/linux-yocto-rt_5.4.bb
index 2857dea130..cfe3277e83 100644
--- a/meta/recipes-kernel/linux/linux-yocto-rt_5.4.bb
+++ b/meta/recipes-kernel/linux/linux-yocto-rt_5.4.bb
@@ -11,7 +11,7 @@ python () {
         raise bb.parse.SkipRecipe("Set PREFERRED_PROVIDER_virtual/kernel to linux-yocto-rt to enable it")
 }
 
-SRCREV_machine ?= "550d18f9ff5749c779261b01d61a86c7e79b06b6"
+SRCREV_machine ?= "22664d170488313b5c2713b6d9c8df6563387728"
 SRCREV_meta ?= "83311f062f4aede9928eca82a34ddf73f264fe2a"
 
 SRC_URI = "git://git.yoctoproject.org/linux-yocto.git;branch=${KBRANCH};name=machine \
diff --git a/meta/recipes-kernel/linux/linux-yocto-tiny_5.4.bb b/meta/recipes-kernel/linux/linux-yocto-tiny_5.4.bb
index 78d57e1841..b90b1259a2 100644
--- a/meta/recipes-kernel/linux/linux-yocto-tiny_5.4.bb
+++ b/meta/recipes-kernel/linux/linux-yocto-tiny_5.4.bb
@@ -15,8 +15,8 @@ DEPENDS += "openssl-native util-linux-native"
 KMETA = "kernel-meta"
 KCONF_BSP_AUDIT_LEVEL = "2"
 
-SRCREV_machine_qemuarm ?= "919fb1aeb12bceab82f32139bec283c1bb5ebc1c"
-SRCREV_machine ?= "7e20784a1d13af858f83a2d5f582fe30329553ce"
+SRCREV_machine_qemuarm ?= "d192ae0b9995a7be2a33b12005a95348ec6aae94"
+SRCREV_machine ?= "706efec4c1e270ec5dda92275898cd465dfdc7dd"
 SRCREV_meta ?= "83311f062f4aede9928eca82a34ddf73f264fe2a"
 
 PV = "${LINUX_VERSION}+git${SRCPV}"
diff --git a/meta/recipes-kernel/linux/linux-yocto_5.4.bb b/meta/recipes-kernel/linux/linux-yocto_5.4.bb
index ba9c803947..f85e37d2c2 100644
--- a/meta/recipes-kernel/linux/linux-yocto_5.4.bb
+++ b/meta/recipes-kernel/linux/linux-yocto_5.4.bb
@@ -12,15 +12,15 @@ KBRANCH_qemux86  ?= "v5.4/standard/base"
 KBRANCH_qemux86-64 ?= "v5.4/standard/base"
 KBRANCH_qemumips64 ?= "v5.4/standard/mti-malta64"
 
-SRCREV_machine_qemuarm ?= "1f11670a455ce50f55597415afedfc5eaa3981bf"
-SRCREV_machine_qemuarm64 ?= "7e20784a1d13af858f83a2d5f582fe30329553ce"
-SRCREV_machine_qemumips ?= "50557f1a2b606139ef5d6ba4a2f46ad7b7b2e96d"
-SRCREV_machine_qemuppc ?= "7e20784a1d13af858f83a2d5f582fe30329553ce"
-SRCREV_machine_qemuriscv64 ?= "7e20784a1d13af858f83a2d5f582fe30329553ce"
-SRCREV_machine_qemux86 ?= "7e20784a1d13af858f83a2d5f582fe30329553ce"
-SRCREV_machine_qemux86-64 ?= "7e20784a1d13af858f83a2d5f582fe30329553ce"
-SRCREV_machine_qemumips64 ?= "52e277a90804bb7ccef6e51bcf739d88788b4a69"
-SRCREV_machine ?= "7e20784a1d13af858f83a2d5f582fe30329553ce"
+SRCREV_machine_qemuarm ?= "7bbd138602fda3d69d74674460e73bffdec73cd2"
+SRCREV_machine_qemuarm64 ?= "706efec4c1e270ec5dda92275898cd465dfdc7dd"
+SRCREV_machine_qemumips ?= "e43ed1586cd85a007b0fae3c63d6980d4f5cb336"
+SRCREV_machine_qemuppc ?= "706efec4c1e270ec5dda92275898cd465dfdc7dd"
+SRCREV_machine_qemuriscv64 ?= "706efec4c1e270ec5dda92275898cd465dfdc7dd"
+SRCREV_machine_qemux86 ?= "706efec4c1e270ec5dda92275898cd465dfdc7dd"
+SRCREV_machine_qemux86-64 ?= "706efec4c1e270ec5dda92275898cd465dfdc7dd"
+SRCREV_machine_qemumips64 ?= "d1ff96887c64f70de00add62eb91d4c36f1b181a"
+SRCREV_machine ?= "706efec4c1e270ec5dda92275898cd465dfdc7dd"
 SRCREV_meta ?= "83311f062f4aede9928eca82a34ddf73f264fe2a"
 
 # remap qemuarm to qemuarma15 for the 5.4 kernel
-- 
2.19.1

