Received: from mail-qk1-f171.google.com (mail-qk1-f171.google.com [209.85.222.171])
 by mx.groups.io with SMTP id smtpd.web08.40680.1629214056336506388
 for <openembedded-core@lists.openembedded.org>;
 Tue, 17 Aug 2021 08:27:36 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20161025 header.b=Mfb56eIL;
 spf=pass (domain: gmail.com, ip: 209.85.222.171, mailfrom: bruce.ashfield@gmail.com)
Received: by mail-qk1-f171.google.com with SMTP id p22so22268771qki.10
        for <openembedded-core@lists.openembedded.org>; Tue, 17 Aug 2021 08:27:36 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:content-transfer-encoding;
        bh=jgbHdZIKPf4tlNHnCULggaUA0Aa8xqlqjk8mePHOVIM=;
        b=Mfb56eILDdiDBgBQvWanOemm0Z0U/npe6FAs1PhMkhFLtzZmAbv8L+VXioGn7mO+lW
         188WrZsHa9K5yl+vv71iT6w6JrlrXTCEVVzjlldSQ/knbHZZFqWxTzOfHc3lTWNJ6mJ7
         RNopt1cOdLRljA2BUzIZgtzte/CakyDvlcRxU+g8eeVqbnVuWo7MzKKZNGAi7y2vnenH
         Ia83pWIiN9kqwmYusN/KgXildR+Aq/J1DMOyXIvdDRP5zZE7jYe2IAcysFCkYoD7CHd8
         7gbvGSsBt1ig6injwrz/O3iH5rAI8afoaNGKjIeWe8lOVMNMfxti8wffoep6To8Yd2rz
         8kaQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=jgbHdZIKPf4tlNHnCULggaUA0Aa8xqlqjk8mePHOVIM=;
        b=eZ9igO6CM92P9ltkGxibR1+0hVflj4AMsjhpf+vU2tGJVHwUFTFUtPpFBulPEGdE/+
         u6jrrdYdVCvOifQ7k1ufXQEOVTdpl+EytBdvKHohU1YBH2gYyt85jwqU/MeErwhbgVRW
         11bBr07RBRxTvq5oqwnxq0FaCUORGvDyCAe30iKIcOV6VtRqpXcXoM94h3Bnfn1SKJ8h
         ogJyk/AM6Z317rIyDWGm/K2ng/hR/UsPbe7wxMZogZArxLHHCk1ylW/VDZN6ZzbELt1R
         ZTjHxM7DG3XyoIOp2Kp68Q2oPKtZPvAClQ2fOnJEg8p0c1EjKAyJzM2ew9N23iyMu2tX
         NbpA==
X-Gm-Message-State: AOAM531ax00OGBTcqwnkQIYwy/2xrS0asP5cl4iCYGAZESq17JSOqJmq
	/s1LLkGyiiYtx57efcHZCY4=
X-Google-Smtp-Source: ABdhPJz0PHHQnVAbP9e04RoGhsg6g64WVzJnhd2BcZ6lpA9EFuvx601S6GNDiItzjllT0+7K1LgWaw==
X-Received: by 2002:a37:aa97:: with SMTP id t145mr4337100qke.145.1629214055506;
        Tue, 17 Aug 2021 08:27:35 -0700 (PDT)
Return-Path: <bruce.ashfield@gmail.com>
Received: from build.lan (cpe04d4c4975b80-cmf4c11490699b.cpe.net.cable.rogers.com. [174.112.63.222])
        by smtp.gmail.com with ESMTPSA id h6sm1175744qtb.44.2021.08.17.08.27.34
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 17 Aug 2021 08:27:35 -0700 (PDT)
From: "Bruce Ashfield" <bruce.ashfield@gmail.com>
To: richard.purdie@linuxfoundation.org
Cc: openembedded-core@lists.openembedded.org
Subject: [PATCH 1/4] linux-yocto-dev: bump to v5.14+
Date: Tue, 17 Aug 2021 11:27:29 -0400
Message-Id: <8687265ed93fff180c6432f118bdee1bcd8477de.1629213685.git.bruce.ashfield@gmail.com>
X-Mailer: git-send-email 2.19.1
In-Reply-To: <cover.1629213685.git.bruce.ashfield@gmail.com>
References: <cover.1629213685.git.bruce.ashfield@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

From: Bruce Ashfield <bruce.ashfield@gmail.com>

Signed-off-by: Bruce Ashfield <bruce.ashfield@gmail.com>
---
 meta/recipes-kernel/linux/linux-yocto-dev.bb | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/meta/recipes-kernel/linux/linux-yocto-dev.bb b/meta/recipes-kernel/linux/linux-yocto-dev.bb
index 28a255a0c0..0911787009 100644
--- a/meta/recipes-kernel/linux/linux-yocto-dev.bb
+++ b/meta/recipes-kernel/linux/linux-yocto-dev.bb
@@ -30,7 +30,7 @@ SRC_URI = "git://git.yoctoproject.org/linux-yocto-dev.git;branch=${KBRANCH};name
 SRCREV_machine ?= '${@oe.utils.conditional("PREFERRED_PROVIDER_virtual/kernel", "linux-yocto-dev", "${AUTOREV}", "29594404d7fe73cd80eaa4ee8c43dcc53970c60e", d)}'
 SRCREV_meta ?= '${@oe.utils.conditional("PREFERRED_PROVIDER_virtual/kernel", "linux-yocto-dev", "${AUTOREV}", "29594404d7fe73cd80eaa4ee8c43dcc53970c60e", d)}'
 
-LINUX_VERSION ?= "5.13+"
+LINUX_VERSION ?= "5.14+"
 LINUX_VERSION_EXTENSION ?= "-yoctodev-${LINUX_KERNEL_TYPE}"
 PV = "${LINUX_VERSION}+git${SRCPV}"
 
-- 
2.19.1

