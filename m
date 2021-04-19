Received: from mail-qk1-f169.google.com (mail-qk1-f169.google.com [209.85.222.169])
 by mx.groups.io with SMTP id smtpd.web09.1623.1618790799400963976
 for <openembedded-core@lists.openembedded.org>;
 Sun, 18 Apr 2021 17:06:39 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20161025 header.b=cZdXvDhX;
 spf=pass (domain: gmail.com, ip: 209.85.222.169, mailfrom: bruce.ashfield@gmail.com)
Received: by mail-qk1-f169.google.com with SMTP id e13so24464185qkl.6
        for <openembedded-core@lists.openembedded.org>; Sun, 18 Apr 2021 17:06:39 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:content-transfer-encoding;
        bh=dbHGCxIcCYI0ZXh/xaJalyu9RcRHFVhvw5icagG6FTQ=;
        b=cZdXvDhXdlTQb8Wcvwi36ceJlIijjARlhQUrt45rhZy6f03Nwyerc90qWJZXKQKbVl
         38/pgm66YKzVGrWNQbcfbXemmyAjuW497eakJP1/fqOkDgTUgt/OvcjfCzwFFOKzoX92
         k3ZQXBrhnIVmg4x/cMwsYC74wcaBkJcsCSJxDrXjQaRJ7L8Hmi4T5L1jlNbElSI4CT1u
         Vyz887nJprTjP/VIcXikgcf7kzANdh9gVBbXwC5Ihb5WEFGXDg64QuwSj7MrZWt82J5O
         l2+TO5GhU+K+3W7ClwLWluzOzf/v1tRelADGbJw4x+MdBzqLDU7+P/kWLDThEEkr1Okh
         RJsw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=dbHGCxIcCYI0ZXh/xaJalyu9RcRHFVhvw5icagG6FTQ=;
        b=qVCZ9R5NIbbWEyVWXEFzCnFVHZZY0j3NT9EWpquZ5mfhbVwd/LHu7Y9zdF8k0uhoj+
         Nj2ToOBM6AAaijpbWzjPLTDRfpOxMyy5qVJqoxoE6wWx/Zm7s+9fasfhKPDnAVUUZgIC
         ZX1FwIuJlgvzUH6JnFdFluJ5uHQM19627BgtMaN2u+QfyCN7uEescB0gi/9vaKx6xL2r
         0KWl0GKaGiVh38FdaVpJgG4pLgJ98ky1MK7/WNCi13KW35Ohmli0BF1wPvi3hXgqB4Jr
         WDKVgFn8zB8xS1QIwEr+NNmaQ+B2/pYwTaVt/S4fJVIM4Ezw7B8vAvM6fIvyYBWKPdOD
         ZYTg==
X-Gm-Message-State: AOAM530iUbZ3CDeLRrrRd9fmM026GQ7ZjVUFSMtjaEcEzH5PVqGU3JUS
	GgX6DR4LeEpA4hxTQ2YBx9s=
X-Google-Smtp-Source: ABdhPJzBgtrSn6IY2rKej9ZaKMtcDS0iPmkww3+Utj7IggFATXITG0Gh+QOjI1ba9kgxobvuSxfirg==
X-Received: by 2002:a37:9b46:: with SMTP id d67mr2922789qke.227.1618790798596;
        Sun, 18 Apr 2021 17:06:38 -0700 (PDT)
Return-Path: <bruce.ashfield@gmail.com>
Received: from build.lan (cpe04d4c4975b80-cmf4c11490699b.cpe.net.cable.rogers.com. [174.112.159.151])
        by smtp.gmail.com with ESMTPSA id n136sm8641759qka.133.2021.04.18.17.06.37
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 18 Apr 2021 17:06:38 -0700 (PDT)
From: "Bruce Ashfield" <bruce.ashfield@gmail.com>
To: richard.purdie@linuxfoundation.org
Cc: openembedded-core@lists.openembedded.org
Subject: [PATCH 05/10] linux-yocto-dev: add features/scsi/scsi-debug.scc features/gpio/mockup.scc to KERNEL_FEATURES
Date: Sun, 18 Apr 2021 20:06:27 -0400
Message-Id: <3d1ef130f657b62fa09c58cde630e0ca731b9843.1618790681.git.bruce.ashfield@gmail.com>
X-Mailer: git-send-email 2.19.1
In-Reply-To: <cover.1618790681.git.bruce.ashfield@gmail.com>
References: <cover.1618790681.git.bruce.ashfield@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

From: He Zhe <zhe.he@windriver.com>

Add features/scsi/scsi-debug.scc and features/gpio/mockup.scc to
KERNEL_FEATURES to meet ptest requirement as what we did for other
linux-yocto*.

Signed-off-by: He Zhe <zhe.he@windriver.com>
Signed-off-by: Bruce Ashfield <bruce.ashfield@gmail.com>
---
 meta/recipes-kernel/linux/linux-yocto-dev.bb | 2 ++
 1 file changed, 2 insertions(+)

diff --git a/meta/recipes-kernel/linux/linux-yocto-dev.bb b/meta/recipes-kernel/linux/linux-yocto-dev.bb
index 8725473d1c..ee41d612fd 100644
--- a/meta/recipes-kernel/linux/linux-yocto-dev.bb
+++ b/meta/recipes-kernel/linux/linux-yocto-dev.bb
@@ -50,5 +50,7 @@ KERNEL_FEATURES_append_qemuall=" cfg/virtio.scc features/drm-bochs/drm-bochs.scc
 KERNEL_FEATURES_append_qemux86=" cfg/sound.scc cfg/paravirt_kvm.scc"
 KERNEL_FEATURES_append_qemux86-64=" cfg/sound.scc cfg/paravirt_kvm.scc"
 KERNEL_FEATURES_append = " ${@bb.utils.contains("TUNE_FEATURES", "mx32", " cfg/x32.scc", "", d)}"
+KERNEL_FEATURES_append = " ${@bb.utils.contains("DISTRO_FEATURES", "ptest", " features/scsi/scsi-debug.scc", "", d)}"
+KERNEL_FEATURES_append = " ${@bb.utils.contains("DISTRO_FEATURES", "ptest", " features/gpio/mockup.scc", "", d)}"
 
 KERNEL_VERSION_SANITY_SKIP = "1"
-- 
2.19.1

