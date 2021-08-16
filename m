Received: from mail-qt1-f175.google.com (mail-qt1-f175.google.com [209.85.160.175])
 by mx.groups.io with SMTP id smtpd.web12.31429.1629151307313103642
 for <openembedded-core@lists.openembedded.org>;
 Mon, 16 Aug 2021 15:01:47 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@kudzu-us.20150623.gappssmtp.com header.s=20150623 header.b=W1p6euQa;
 spf=none, err=permanent DNS error (domain: kudzu.us, ip: 209.85.160.175, mailfrom: jdmason@kudzu.us)
Received: by mail-qt1-f175.google.com with SMTP id a12so15519978qtb.2
        for <openembedded-core@lists.openembedded.org>; Mon, 16 Aug 2021 15:01:47 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=kudzu-us.20150623.gappssmtp.com; s=20150623;
        h=from:to:subject:date:message-id:in-reply-to:references:mime-version
         :content-transfer-encoding;
        bh=+DMA/rSfyV/kOTg/1OkDs+Mo2Hz4KJ3AQis0vnigqTQ=;
        b=W1p6euQaEzfyl37MGfERFsRaGW8W7HoXh28C3pqkj5JuXf+pQM9mqoZJpm2+0ulWoR
         YL4ERJQbCXd8ZKIObCEA2sGeJlUIMXt36r016EyCurEwGntedetYhVYHTFRsWqKuJBXp
         ORWeCZGl+7Zngbv2y1Zv0qICCqcaD8+Is9RYU2YMj8Kr6loWB6vInIt5OrpU7WUg960j
         ka9Knt57B0oU3B8JQRLd1mt3/SdSkHIeMh3iaJV7VeoIMVK97NLiusTBZ06lq/Ui7AQm
         2opaoJaAS4PXrGdgptzGDeV5Na4KJK+LJpjt22TILN5vPa6W113UrvXfOrkNPjoOxPUE
         m+cw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=+DMA/rSfyV/kOTg/1OkDs+Mo2Hz4KJ3AQis0vnigqTQ=;
        b=mYAZTG70bYnRkuedseMLH1y85GTI4G/ZMlt23wKwbhjYi+yKshbWWNom55W7mqnoFR
         BN72UhfAaKutLpGqmDBMuoGQdsmcJ4n+o26/kVfT6NP1sfepyQ+oDrjH+oznGLrqx85z
         mWTMIJxLDCuPS70iZ/cTy62ozbsuj9uJZbqxDOvuFH8yfisb82ckz56eBb542rNzpVfz
         mTxIvgZvqRn0Xzx+nEKJxJPEI0Wo8jQOz2XoOZIMOneg1uKtj5sEJXqvjCWR2A2Pb1nz
         aFvA4V0fnrmi5XW9FwwaCi7s8fm9YDgeUA+oInMMVN7URQ0NiDDERfviqfPtNaoOUakX
         e2wQ==
X-Gm-Message-State: AOAM532DmJculrrFxNacW2V12G0KeHmp9wFFwGkwqBEJOYcnDJJ6cyNo
	TNliUieXRo/yESYc6NeI3pk+UJEEtxMqUQ==
X-Google-Smtp-Source: ABdhPJw7RQbNik+RqKxuZXQE3t1UtQdY10xyNxPvNs6DGQkj/mAwU/koSPo+TGbKBVCRNYGmopXqeA==
X-Received: by 2002:ac8:7444:: with SMTP id h4mr133821qtr.337.1629151305878;
        Mon, 16 Aug 2021 15:01:45 -0700 (PDT)
Return-Path: <jdmason@kudzu.us>
Received: from localhost ([2605:a601:a632:4e00:f177:a44a:469d:7e14])
        by smtp.gmail.com with ESMTPSA id o25sm104564qkj.113.2021.08.16.15.01.45
        for <openembedded-core@lists.openembedded.org>
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 16 Aug 2021 15:01:45 -0700 (PDT)
From: "Jon Mason" <jdmason@kudzu.us>
To: openembedded-core@lists.openembedded.org
Subject: [PATCH v2 1/3] conf/machine: move tune files to architecture directories
Date: Mon, 16 Aug 2021 18:01:42 -0400
Message-Id: <20210816220144.26018-2-jdmason@kudzu.us>
X-Mailer: git-send-email 2.20.1
In-Reply-To: <20210816220144.26018-1-jdmason@kudzu.us>
References: <20210816220144.26018-1-jdmason@kudzu.us>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Move all of the tune files found in conf/machine/include into their
respective architecture directories in that same location.  All
references to these will need to be updated.  So, change the relevant
ones for this tree in this commit as well.

For the ARM tunes, nest them one further into armv8a, armv8m, etc. and
rename some to make them uniform with the rest of the tunes.

Signed-off-by: Jon Mason <jdmason@kudzu.us>
---
 meta/conf/machine/include/{ => arm/armv4}/tune-arm920t.inc    | 0
 meta/conf/machine/include/{ => arm/armv4}/tune-arm9tdmi.inc   | 0
 meta/conf/machine/include/{ => arm/armv4}/tune-ep9312.inc     | 0
 .../machine/include/{ => arm/armv4}/tune-strongarm1100.inc    | 0
 meta/conf/machine/include/{ => arm/armv5}/tune-arm926ejs.inc  | 0
 meta/conf/machine/include/{ => arm/armv5}/tune-iwmmxt.inc     | 0
 meta/conf/machine/include/{ => arm/armv5}/tune-xscale.inc     | 0
 .../conf/machine/include/{ => arm/armv6}/tune-arm1136jf-s.inc | 0
 .../conf/machine/include/{ => arm/armv6}/tune-arm1176jz-s.inc | 0
 .../{tune-cortex-m0.inc => arm/armv6m/tune-cortexm0.inc}      | 0
 .../armv6m/tune-cortexm0plus.inc}                             | 0
 meta/conf/machine/include/{ => arm/armv6m}/tune-cortexm1.inc  | 0
 meta/conf/machine/include/{ => arm/armv7a}/tune-cortexa15.inc | 0
 meta/conf/machine/include/{ => arm/armv7a}/tune-cortexa17.inc | 0
 meta/conf/machine/include/{ => arm/armv7a}/tune-cortexa5.inc  | 0
 meta/conf/machine/include/{ => arm/armv7a}/tune-cortexa7.inc  | 0
 meta/conf/machine/include/{ => arm/armv7a}/tune-cortexa8.inc  | 0
 meta/conf/machine/include/{ => arm/armv7a}/tune-cortexa9.inc  | 0
 meta/conf/machine/include/{ => arm/armv7m}/tune-cortexm3.inc  | 0
 meta/conf/machine/include/{ => arm/armv7m}/tune-cortexm4.inc  | 0
 meta/conf/machine/include/{ => arm/armv7m}/tune-cortexm7.inc  | 0
 .../machine/include/{ => arm/armv8-2a}/tune-cortexa55.inc     | 0
 meta/conf/machine/include/{ => arm/armv8a}/tune-cortexa32.inc | 0
 meta/conf/machine/include/{ => arm/armv8a}/tune-cortexa35.inc | 0
 meta/conf/machine/include/{ => arm/armv8a}/tune-cortexa53.inc | 0
 .../include/{ => arm/armv8a}/tune-cortexa57-cortexa53.inc     | 0
 meta/conf/machine/include/{ => arm/armv8a}/tune-cortexa57.inc | 0
 .../include/{ => arm/armv8a}/tune-cortexa72-cortexa53.inc     | 0
 meta/conf/machine/include/{ => arm/armv8a}/tune-cortexa72.inc | 0
 .../include/{ => arm/armv8a}/tune-cortexa73-cortexa53.inc     | 0
 meta/conf/machine/include/{ => arm/armv8a}/tune-thunderx.inc  | 0
 meta/conf/machine/include/{ => m68k}/tune-mcf5441x.inc        | 0
 .../conf/machine/include/{ => microblaze}/tune-microblaze.inc | 0
 meta/conf/machine/include/{ => mips}/qemuboot-mips.inc        | 0
 meta/conf/machine/include/mips/tune-mips-24k.inc              | 2 +-
 meta/conf/machine/include/mips/tune-mips-74k.inc              | 2 +-
 meta/conf/machine/include/{ => mips}/tune-mips32.inc          | 0
 meta/conf/machine/include/{ => mips}/tune-mips32r2.inc        | 2 +-
 meta/conf/machine/include/{ => mips}/tune-mips32r6.inc        | 0
 meta/conf/machine/include/mips/tune-mips64.inc                | 3 +++
 meta/conf/machine/include/{ => mips}/tune-mips64r2.inc        | 2 +-
 meta/conf/machine/include/{ => mips}/tune-mips64r6.inc        | 0
 meta/conf/machine/include/{ => mips}/tune-octeon.inc          | 2 +-
 meta/conf/machine/include/{ => powerpc}/tune-power5.inc       | 0
 meta/conf/machine/include/{ => powerpc}/tune-power6.inc       | 0
 meta/conf/machine/include/{ => powerpc}/tune-power7.inc       | 0
 meta/conf/machine/include/{ => powerpc}/tune-power9.inc       | 0
 meta/conf/machine/include/{ => powerpc}/tune-ppc476.inc       | 0
 meta/conf/machine/include/{ => powerpc}/tune-ppc603e.inc      | 0
 meta/conf/machine/include/{ => powerpc}/tune-ppc7400.inc      | 0
 meta/conf/machine/include/{ => powerpc}/tune-ppce300c2.inc    | 0
 meta/conf/machine/include/{ => powerpc}/tune-ppce300c3.inc    | 0
 meta/conf/machine/include/{ => powerpc}/tune-ppce500.inc      | 0
 meta/conf/machine/include/{ => powerpc}/tune-ppce500mc.inc    | 0
 meta/conf/machine/include/{ => powerpc}/tune-ppce500v2.inc    | 0
 meta/conf/machine/include/{ => powerpc}/tune-ppce5500.inc     | 0
 meta/conf/machine/include/{ => powerpc}/tune-ppce6500.inc     | 0
 meta/conf/machine/include/{ => sh}/tune-sh3.inc               | 0
 meta/conf/machine/include/{ => sh}/tune-sh4.inc               | 2 +-
 meta/conf/machine/include/tune-mips64.inc                     | 3 ---
 meta/conf/machine/include/{ => x86}/qemuboot-x86.inc          | 0
 meta/conf/machine/include/{ => x86}/tune-atom.inc             | 2 +-
 meta/conf/machine/include/{ => x86}/tune-c3.inc               | 0
 meta/conf/machine/include/{ => x86}/tune-core2.inc            | 2 +-
 meta/conf/machine/include/{ => x86}/tune-corei7.inc           | 2 +-
 meta/conf/machine/include/{ => x86}/tune-i586-nlp.inc         | 0
 meta/conf/machine/include/{ => x86}/tune-i586.inc             | 0
 meta/conf/machine/include/{ => x86}/tune-i686.inc             | 2 +-
 meta/conf/machine/include/{ => x86}/x86-base.inc              | 0
 meta/conf/machine/qemuarm.conf                                | 2 +-
 meta/conf/machine/qemuarm64.conf                              | 2 +-
 meta/conf/machine/qemuarmv5.conf                              | 2 +-
 meta/conf/machine/qemumips.conf                               | 4 ++--
 meta/conf/machine/qemumips64.conf                             | 4 ++--
 meta/conf/machine/qemuppc.conf                                | 2 +-
 meta/conf/machine/qemuppc64.conf                              | 2 +-
 meta/conf/machine/qemux86-64.conf                             | 4 ++--
 meta/conf/machine/qemux86.conf                                | 4 ++--
 78 files changed, 26 insertions(+), 26 deletions(-)
 rename meta/conf/machine/include/{ => arm/armv4}/tune-arm920t.inc (100%)
 rename meta/conf/machine/include/{ => arm/armv4}/tune-arm9tdmi.inc (100%)
 rename meta/conf/machine/include/{ => arm/armv4}/tune-ep9312.inc (100%)
 rename meta/conf/machine/include/{ => arm/armv4}/tune-strongarm1100.inc (100%)
 rename meta/conf/machine/include/{ => arm/armv5}/tune-arm926ejs.inc (100%)
 rename meta/conf/machine/include/{ => arm/armv5}/tune-iwmmxt.inc (100%)
 rename meta/conf/machine/include/{ => arm/armv5}/tune-xscale.inc (100%)
 rename meta/conf/machine/include/{ => arm/armv6}/tune-arm1136jf-s.inc (100%)
 rename meta/conf/machine/include/{ => arm/armv6}/tune-arm1176jz-s.inc (100%)
 rename meta/conf/machine/include/{tune-cortex-m0.inc => arm/armv6m/tune-cortexm0.inc} (100%)
 rename meta/conf/machine/include/{tune-cortex-m0plus.inc => arm/armv6m/tune-cortexm0plus.inc} (100%)
 rename meta/conf/machine/include/{ => arm/armv6m}/tune-cortexm1.inc (100%)
 rename meta/conf/machine/include/{ => arm/armv7a}/tune-cortexa15.inc (100%)
 rename meta/conf/machine/include/{ => arm/armv7a}/tune-cortexa17.inc (100%)
 rename meta/conf/machine/include/{ => arm/armv7a}/tune-cortexa5.inc (100%)
 rename meta/conf/machine/include/{ => arm/armv7a}/tune-cortexa7.inc (100%)
 rename meta/conf/machine/include/{ => arm/armv7a}/tune-cortexa8.inc (100%)
 rename meta/conf/machine/include/{ => arm/armv7a}/tune-cortexa9.inc (100%)
 rename meta/conf/machine/include/{ => arm/armv7m}/tune-cortexm3.inc (100%)
 rename meta/conf/machine/include/{ => arm/armv7m}/tune-cortexm4.inc (100%)
 rename meta/conf/machine/include/{ => arm/armv7m}/tune-cortexm7.inc (100%)
 rename meta/conf/machine/include/{ => arm/armv8-2a}/tune-cortexa55.inc (100%)
 rename meta/conf/machine/include/{ => arm/armv8a}/tune-cortexa32.inc (100%)
 rename meta/conf/machine/include/{ => arm/armv8a}/tune-cortexa35.inc (100%)
 rename meta/conf/machine/include/{ => arm/armv8a}/tune-cortexa53.inc (100%)
 rename meta/conf/machine/include/{ => arm/armv8a}/tune-cortexa57-cortexa53.inc (100%)
 rename meta/conf/machine/include/{ => arm/armv8a}/tune-cortexa57.inc (100%)
 rename meta/conf/machine/include/{ => arm/armv8a}/tune-cortexa72-cortexa53.inc (100%)
 rename meta/conf/machine/include/{ => arm/armv8a}/tune-cortexa72.inc (100%)
 rename meta/conf/machine/include/{ => arm/armv8a}/tune-cortexa73-cortexa53.inc (100%)
 rename meta/conf/machine/include/{ => arm/armv8a}/tune-thunderx.inc (100%)
 rename meta/conf/machine/include/{ => m68k}/tune-mcf5441x.inc (100%)
 rename meta/conf/machine/include/{ => microblaze}/tune-microblaze.inc (100%)
 rename meta/conf/machine/include/{ => mips}/qemuboot-mips.inc (100%)
 rename meta/conf/machine/include/{ => mips}/tune-mips32.inc (100%)
 rename meta/conf/machine/include/{ => mips}/tune-mips32r2.inc (95%)
 rename meta/conf/machine/include/{ => mips}/tune-mips32r6.inc (100%)
 create mode 100644 meta/conf/machine/include/mips/tune-mips64.inc
 rename meta/conf/machine/include/{ => mips}/tune-mips64r2.inc (98%)
 rename meta/conf/machine/include/{ => mips}/tune-mips64r6.inc (100%)
 rename meta/conf/machine/include/{ => mips}/tune-octeon.inc (96%)
 rename meta/conf/machine/include/{ => powerpc}/tune-power5.inc (100%)
 rename meta/conf/machine/include/{ => powerpc}/tune-power6.inc (100%)
 rename meta/conf/machine/include/{ => powerpc}/tune-power7.inc (100%)
 rename meta/conf/machine/include/{ => powerpc}/tune-power9.inc (100%)
 rename meta/conf/machine/include/{ => powerpc}/tune-ppc476.inc (100%)
 rename meta/conf/machine/include/{ => powerpc}/tune-ppc603e.inc (100%)
 rename meta/conf/machine/include/{ => powerpc}/tune-ppc7400.inc (100%)
 rename meta/conf/machine/include/{ => powerpc}/tune-ppce300c2.inc (100%)
 rename meta/conf/machine/include/{ => powerpc}/tune-ppce300c3.inc (100%)
 rename meta/conf/machine/include/{ => powerpc}/tune-ppce500.inc (100%)
 rename meta/conf/machine/include/{ => powerpc}/tune-ppce500mc.inc (100%)
 rename meta/conf/machine/include/{ => powerpc}/tune-ppce500v2.inc (100%)
 rename meta/conf/machine/include/{ => powerpc}/tune-ppce5500.inc (100%)
 rename meta/conf/machine/include/{ => powerpc}/tune-ppce6500.inc (100%)
 rename meta/conf/machine/include/{ => sh}/tune-sh3.inc (100%)
 rename meta/conf/machine/include/{ => sh}/tune-sh4.inc (93%)
 delete mode 100644 meta/conf/machine/include/tune-mips64.inc
 rename meta/conf/machine/include/{ => x86}/qemuboot-x86.inc (100%)
 rename meta/conf/machine/include/{ => x86}/tune-atom.inc (50%)
 rename meta/conf/machine/include/{ => x86}/tune-c3.inc (100%)
 rename meta/conf/machine/include/{ => x86}/tune-core2.inc (97%)
 rename meta/conf/machine/include/{ => x86}/tune-corei7.inc (97%)
 rename meta/conf/machine/include/{ => x86}/tune-i586-nlp.inc (100%)
 rename meta/conf/machine/include/{ => x86}/tune-i586.inc (100%)
 rename meta/conf/machine/include/{ => x86}/tune-i686.inc (94%)
 rename meta/conf/machine/include/{ => x86}/x86-base.inc (100%)

diff --git a/meta/conf/machine/include/tune-arm920t.inc b/meta/conf/machine/include/arm/armv4/tune-arm920t.inc
similarity index 100%
rename from meta/conf/machine/include/tune-arm920t.inc
rename to meta/conf/machine/include/arm/armv4/tune-arm920t.inc
diff --git a/meta/conf/machine/include/tune-arm9tdmi.inc b/meta/conf/machine/include/arm/armv4/tune-arm9tdmi.inc
similarity index 100%
rename from meta/conf/machine/include/tune-arm9tdmi.inc
rename to meta/conf/machine/include/arm/armv4/tune-arm9tdmi.inc
diff --git a/meta/conf/machine/include/tune-ep9312.inc b/meta/conf/machine/include/arm/armv4/tune-ep9312.inc
similarity index 100%
rename from meta/conf/machine/include/tune-ep9312.inc
rename to meta/conf/machine/include/arm/armv4/tune-ep9312.inc
diff --git a/meta/conf/machine/include/tune-strongarm1100.inc b/meta/conf/machine/include/arm/armv4/tune-strongarm1100.inc
similarity index 100%
rename from meta/conf/machine/include/tune-strongarm1100.inc
rename to meta/conf/machine/include/arm/armv4/tune-strongarm1100.inc
diff --git a/meta/conf/machine/include/tune-arm926ejs.inc b/meta/conf/machine/include/arm/armv5/tune-arm926ejs.inc
similarity index 100%
rename from meta/conf/machine/include/tune-arm926ejs.inc
rename to meta/conf/machine/include/arm/armv5/tune-arm926ejs.inc
diff --git a/meta/conf/machine/include/tune-iwmmxt.inc b/meta/conf/machine/include/arm/armv5/tune-iwmmxt.inc
similarity index 100%
rename from meta/conf/machine/include/tune-iwmmxt.inc
rename to meta/conf/machine/include/arm/armv5/tune-iwmmxt.inc
diff --git a/meta/conf/machine/include/tune-xscale.inc b/meta/conf/machine/include/arm/armv5/tune-xscale.inc
similarity index 100%
rename from meta/conf/machine/include/tune-xscale.inc
rename to meta/conf/machine/include/arm/armv5/tune-xscale.inc
diff --git a/meta/conf/machine/include/tune-arm1136jf-s.inc b/meta/conf/machine/include/arm/armv6/tune-arm1136jf-s.inc
similarity index 100%
rename from meta/conf/machine/include/tune-arm1136jf-s.inc
rename to meta/conf/machine/include/arm/armv6/tune-arm1136jf-s.inc
diff --git a/meta/conf/machine/include/tune-arm1176jz-s.inc b/meta/conf/machine/include/arm/armv6/tune-arm1176jz-s.inc
similarity index 100%
rename from meta/conf/machine/include/tune-arm1176jz-s.inc
rename to meta/conf/machine/include/arm/armv6/tune-arm1176jz-s.inc
diff --git a/meta/conf/machine/include/tune-cortex-m0.inc b/meta/conf/machine/include/arm/armv6m/tune-cortexm0.inc
similarity index 100%
rename from meta/conf/machine/include/tune-cortex-m0.inc
rename to meta/conf/machine/include/arm/armv6m/tune-cortexm0.inc
diff --git a/meta/conf/machine/include/tune-cortex-m0plus.inc b/meta/conf/machine/include/arm/armv6m/tune-cortexm0plus.inc
similarity index 100%
rename from meta/conf/machine/include/tune-cortex-m0plus.inc
rename to meta/conf/machine/include/arm/armv6m/tune-cortexm0plus.inc
diff --git a/meta/conf/machine/include/tune-cortexm1.inc b/meta/conf/machine/include/arm/armv6m/tune-cortexm1.inc
similarity index 100%
rename from meta/conf/machine/include/tune-cortexm1.inc
rename to meta/conf/machine/include/arm/armv6m/tune-cortexm1.inc
diff --git a/meta/conf/machine/include/tune-cortexa15.inc b/meta/conf/machine/include/arm/armv7a/tune-cortexa15.inc
similarity index 100%
rename from meta/conf/machine/include/tune-cortexa15.inc
rename to meta/conf/machine/include/arm/armv7a/tune-cortexa15.inc
diff --git a/meta/conf/machine/include/tune-cortexa17.inc b/meta/conf/machine/include/arm/armv7a/tune-cortexa17.inc
similarity index 100%
rename from meta/conf/machine/include/tune-cortexa17.inc
rename to meta/conf/machine/include/arm/armv7a/tune-cortexa17.inc
diff --git a/meta/conf/machine/include/tune-cortexa5.inc b/meta/conf/machine/include/arm/armv7a/tune-cortexa5.inc
similarity index 100%
rename from meta/conf/machine/include/tune-cortexa5.inc
rename to meta/conf/machine/include/arm/armv7a/tune-cortexa5.inc
diff --git a/meta/conf/machine/include/tune-cortexa7.inc b/meta/conf/machine/include/arm/armv7a/tune-cortexa7.inc
similarity index 100%
rename from meta/conf/machine/include/tune-cortexa7.inc
rename to meta/conf/machine/include/arm/armv7a/tune-cortexa7.inc
diff --git a/meta/conf/machine/include/tune-cortexa8.inc b/meta/conf/machine/include/arm/armv7a/tune-cortexa8.inc
similarity index 100%
rename from meta/conf/machine/include/tune-cortexa8.inc
rename to meta/conf/machine/include/arm/armv7a/tune-cortexa8.inc
diff --git a/meta/conf/machine/include/tune-cortexa9.inc b/meta/conf/machine/include/arm/armv7a/tune-cortexa9.inc
similarity index 100%
rename from meta/conf/machine/include/tune-cortexa9.inc
rename to meta/conf/machine/include/arm/armv7a/tune-cortexa9.inc
diff --git a/meta/conf/machine/include/tune-cortexm3.inc b/meta/conf/machine/include/arm/armv7m/tune-cortexm3.inc
similarity index 100%
rename from meta/conf/machine/include/tune-cortexm3.inc
rename to meta/conf/machine/include/arm/armv7m/tune-cortexm3.inc
diff --git a/meta/conf/machine/include/tune-cortexm4.inc b/meta/conf/machine/include/arm/armv7m/tune-cortexm4.inc
similarity index 100%
rename from meta/conf/machine/include/tune-cortexm4.inc
rename to meta/conf/machine/include/arm/armv7m/tune-cortexm4.inc
diff --git a/meta/conf/machine/include/tune-cortexm7.inc b/meta/conf/machine/include/arm/armv7m/tune-cortexm7.inc
similarity index 100%
rename from meta/conf/machine/include/tune-cortexm7.inc
rename to meta/conf/machine/include/arm/armv7m/tune-cortexm7.inc
diff --git a/meta/conf/machine/include/tune-cortexa55.inc b/meta/conf/machine/include/arm/armv8-2a/tune-cortexa55.inc
similarity index 100%
rename from meta/conf/machine/include/tune-cortexa55.inc
rename to meta/conf/machine/include/arm/armv8-2a/tune-cortexa55.inc
diff --git a/meta/conf/machine/include/tune-cortexa32.inc b/meta/conf/machine/include/arm/armv8a/tune-cortexa32.inc
similarity index 100%
rename from meta/conf/machine/include/tune-cortexa32.inc
rename to meta/conf/machine/include/arm/armv8a/tune-cortexa32.inc
diff --git a/meta/conf/machine/include/tune-cortexa35.inc b/meta/conf/machine/include/arm/armv8a/tune-cortexa35.inc
similarity index 100%
rename from meta/conf/machine/include/tune-cortexa35.inc
rename to meta/conf/machine/include/arm/armv8a/tune-cortexa35.inc
diff --git a/meta/conf/machine/include/tune-cortexa53.inc b/meta/conf/machine/include/arm/armv8a/tune-cortexa53.inc
similarity index 100%
rename from meta/conf/machine/include/tune-cortexa53.inc
rename to meta/conf/machine/include/arm/armv8a/tune-cortexa53.inc
diff --git a/meta/conf/machine/include/tune-cortexa57-cortexa53.inc b/meta/conf/machine/include/arm/armv8a/tune-cortexa57-cortexa53.inc
similarity index 100%
rename from meta/conf/machine/include/tune-cortexa57-cortexa53.inc
rename to meta/conf/machine/include/arm/armv8a/tune-cortexa57-cortexa53.inc
diff --git a/meta/conf/machine/include/tune-cortexa57.inc b/meta/conf/machine/include/arm/armv8a/tune-cortexa57.inc
similarity index 100%
rename from meta/conf/machine/include/tune-cortexa57.inc
rename to meta/conf/machine/include/arm/armv8a/tune-cortexa57.inc
diff --git a/meta/conf/machine/include/tune-cortexa72-cortexa53.inc b/meta/conf/machine/include/arm/armv8a/tune-cortexa72-cortexa53.inc
similarity index 100%
rename from meta/conf/machine/include/tune-cortexa72-cortexa53.inc
rename to meta/conf/machine/include/arm/armv8a/tune-cortexa72-cortexa53.inc
diff --git a/meta/conf/machine/include/tune-cortexa72.inc b/meta/conf/machine/include/arm/armv8a/tune-cortexa72.inc
similarity index 100%
rename from meta/conf/machine/include/tune-cortexa72.inc
rename to meta/conf/machine/include/arm/armv8a/tune-cortexa72.inc
diff --git a/meta/conf/machine/include/tune-cortexa73-cortexa53.inc b/meta/conf/machine/include/arm/armv8a/tune-cortexa73-cortexa53.inc
similarity index 100%
rename from meta/conf/machine/include/tune-cortexa73-cortexa53.inc
rename to meta/conf/machine/include/arm/armv8a/tune-cortexa73-cortexa53.inc
diff --git a/meta/conf/machine/include/tune-thunderx.inc b/meta/conf/machine/include/arm/armv8a/tune-thunderx.inc
similarity index 100%
rename from meta/conf/machine/include/tune-thunderx.inc
rename to meta/conf/machine/include/arm/armv8a/tune-thunderx.inc
diff --git a/meta/conf/machine/include/tune-mcf5441x.inc b/meta/conf/machine/include/m68k/tune-mcf5441x.inc
similarity index 100%
rename from meta/conf/machine/include/tune-mcf5441x.inc
rename to meta/conf/machine/include/m68k/tune-mcf5441x.inc
diff --git a/meta/conf/machine/include/tune-microblaze.inc b/meta/conf/machine/include/microblaze/tune-microblaze.inc
similarity index 100%
rename from meta/conf/machine/include/tune-microblaze.inc
rename to meta/conf/machine/include/microblaze/tune-microblaze.inc
diff --git a/meta/conf/machine/include/qemuboot-mips.inc b/meta/conf/machine/include/mips/qemuboot-mips.inc
similarity index 100%
rename from meta/conf/machine/include/qemuboot-mips.inc
rename to meta/conf/machine/include/mips/qemuboot-mips.inc
diff --git a/meta/conf/machine/include/mips/tune-mips-24k.inc b/meta/conf/machine/include/mips/tune-mips-24k.inc
index ed6566587d69..106ff62fbb50 100644
--- a/meta/conf/machine/include/mips/tune-mips-24k.inc
+++ b/meta/conf/machine/include/mips/tune-mips-24k.inc
@@ -2,7 +2,7 @@ DEFAULTTUNE ?= "mips32r2-24kc"
 
 MIPSPKGSFX_MIPS16E ??= ""
 
-require conf/machine/include/tune-mips32r2.inc
+require conf/machine/include/mips/tune-mips32r2.inc
 require conf/machine/include/mips/feature-mips-mips16e.inc
 
 
diff --git a/meta/conf/machine/include/mips/tune-mips-74k.inc b/meta/conf/machine/include/mips/tune-mips-74k.inc
index 988cfaef6e92..e4927a1ce007 100644
--- a/meta/conf/machine/include/mips/tune-mips-74k.inc
+++ b/meta/conf/machine/include/mips/tune-mips-74k.inc
@@ -2,7 +2,7 @@ DEFAULTTUNE ?= "mips32r2-74kc"
 
 MIPSPKGSFX_MIPS16E ??= ""
 
-require conf/machine/include/tune-mips32r2.inc
+require conf/machine/include/mips/tune-mips32r2.inc
 require conf/machine/include/mips/feature-mips-mips16e.inc
 
 
diff --git a/meta/conf/machine/include/tune-mips32.inc b/meta/conf/machine/include/mips/tune-mips32.inc
similarity index 100%
rename from meta/conf/machine/include/tune-mips32.inc
rename to meta/conf/machine/include/mips/tune-mips32.inc
diff --git a/meta/conf/machine/include/tune-mips32r2.inc b/meta/conf/machine/include/mips/tune-mips32r2.inc
similarity index 95%
rename from meta/conf/machine/include/tune-mips32r2.inc
rename to meta/conf/machine/include/mips/tune-mips32r2.inc
index e7f6753d3d18..c868e925e90a 100644
--- a/meta/conf/machine/include/tune-mips32r2.inc
+++ b/meta/conf/machine/include/mips/tune-mips32r2.inc
@@ -1,6 +1,6 @@
 DEFAULTTUNE ?= "mips32r2"
 
-require conf/machine/include/tune-mips32.inc
+require conf/machine/include/mips/tune-mips32.inc
 
 TUNEVALID[mips32r2] = "Enable mips32r2 specific processor optimizations"
 TUNECONFLICTS[mips32r2] = "n64 n32"
diff --git a/meta/conf/machine/include/tune-mips32r6.inc b/meta/conf/machine/include/mips/tune-mips32r6.inc
similarity index 100%
rename from meta/conf/machine/include/tune-mips32r6.inc
rename to meta/conf/machine/include/mips/tune-mips32r6.inc
diff --git a/meta/conf/machine/include/mips/tune-mips64.inc b/meta/conf/machine/include/mips/tune-mips64.inc
new file mode 100644
index 000000000000..a9080159fca7
--- /dev/null
+++ b/meta/conf/machine/include/mips/tune-mips64.inc
@@ -0,0 +1,3 @@
+DEFAULTTUNE ?= "mips64"
+
+require conf/machine/include/mips/tune-mips32r2.inc
diff --git a/meta/conf/machine/include/tune-mips64r2.inc b/meta/conf/machine/include/mips/tune-mips64r2.inc
similarity index 98%
rename from meta/conf/machine/include/tune-mips64r2.inc
rename to meta/conf/machine/include/mips/tune-mips64r2.inc
index 6337abb09f1d..c644f409187b 100644
--- a/meta/conf/machine/include/tune-mips64r2.inc
+++ b/meta/conf/machine/include/mips/tune-mips64r2.inc
@@ -1,6 +1,6 @@
 DEFAULTTUNE ?= "mips64r2"
 
-require conf/machine/include/tune-mips64.inc
+require conf/machine/include/mips/tune-mips64.inc
 
 TUNEVALID[mips64r2] = "Enable mips64r2 specific processor optimizations"
 TUNE_CCARGS .= "${@bb.utils.contains('TUNE_FEATURES', 'mips64r2', ' -march=mips64r2', '', d)}"
diff --git a/meta/conf/machine/include/tune-mips64r6.inc b/meta/conf/machine/include/mips/tune-mips64r6.inc
similarity index 100%
rename from meta/conf/machine/include/tune-mips64r6.inc
rename to meta/conf/machine/include/mips/tune-mips64r6.inc
diff --git a/meta/conf/machine/include/tune-octeon.inc b/meta/conf/machine/include/mips/tune-octeon.inc
similarity index 96%
rename from meta/conf/machine/include/tune-octeon.inc
rename to meta/conf/machine/include/mips/tune-octeon.inc
index 455c6a2f334e..d4670e3259dd 100644
--- a/meta/conf/machine/include/tune-octeon.inc
+++ b/meta/conf/machine/include/mips/tune-octeon.inc
@@ -1,6 +1,6 @@
 DEFAULTTUNE ?="octeon2"
 
-require conf/machine/include/tune-mips64.inc
+require conf/machine/include/mips/tune-mips64.inc
 
 AVAILTUNES += "octeon2 octeon2_64 octeon3 octeon3_64"
 
diff --git a/meta/conf/machine/include/tune-power5.inc b/meta/conf/machine/include/powerpc/tune-power5.inc
similarity index 100%
rename from meta/conf/machine/include/tune-power5.inc
rename to meta/conf/machine/include/powerpc/tune-power5.inc
diff --git a/meta/conf/machine/include/tune-power6.inc b/meta/conf/machine/include/powerpc/tune-power6.inc
similarity index 100%
rename from meta/conf/machine/include/tune-power6.inc
rename to meta/conf/machine/include/powerpc/tune-power6.inc
diff --git a/meta/conf/machine/include/tune-power7.inc b/meta/conf/machine/include/powerpc/tune-power7.inc
similarity index 100%
rename from meta/conf/machine/include/tune-power7.inc
rename to meta/conf/machine/include/powerpc/tune-power7.inc
diff --git a/meta/conf/machine/include/tune-power9.inc b/meta/conf/machine/include/powerpc/tune-power9.inc
similarity index 100%
rename from meta/conf/machine/include/tune-power9.inc
rename to meta/conf/machine/include/powerpc/tune-power9.inc
diff --git a/meta/conf/machine/include/tune-ppc476.inc b/meta/conf/machine/include/powerpc/tune-ppc476.inc
similarity index 100%
rename from meta/conf/machine/include/tune-ppc476.inc
rename to meta/conf/machine/include/powerpc/tune-ppc476.inc
diff --git a/meta/conf/machine/include/tune-ppc603e.inc b/meta/conf/machine/include/powerpc/tune-ppc603e.inc
similarity index 100%
rename from meta/conf/machine/include/tune-ppc603e.inc
rename to meta/conf/machine/include/powerpc/tune-ppc603e.inc
diff --git a/meta/conf/machine/include/tune-ppc7400.inc b/meta/conf/machine/include/powerpc/tune-ppc7400.inc
similarity index 100%
rename from meta/conf/machine/include/tune-ppc7400.inc
rename to meta/conf/machine/include/powerpc/tune-ppc7400.inc
diff --git a/meta/conf/machine/include/tune-ppce300c2.inc b/meta/conf/machine/include/powerpc/tune-ppce300c2.inc
similarity index 100%
rename from meta/conf/machine/include/tune-ppce300c2.inc
rename to meta/conf/machine/include/powerpc/tune-ppce300c2.inc
diff --git a/meta/conf/machine/include/tune-ppce300c3.inc b/meta/conf/machine/include/powerpc/tune-ppce300c3.inc
similarity index 100%
rename from meta/conf/machine/include/tune-ppce300c3.inc
rename to meta/conf/machine/include/powerpc/tune-ppce300c3.inc
diff --git a/meta/conf/machine/include/tune-ppce500.inc b/meta/conf/machine/include/powerpc/tune-ppce500.inc
similarity index 100%
rename from meta/conf/machine/include/tune-ppce500.inc
rename to meta/conf/machine/include/powerpc/tune-ppce500.inc
diff --git a/meta/conf/machine/include/tune-ppce500mc.inc b/meta/conf/machine/include/powerpc/tune-ppce500mc.inc
similarity index 100%
rename from meta/conf/machine/include/tune-ppce500mc.inc
rename to meta/conf/machine/include/powerpc/tune-ppce500mc.inc
diff --git a/meta/conf/machine/include/tune-ppce500v2.inc b/meta/conf/machine/include/powerpc/tune-ppce500v2.inc
similarity index 100%
rename from meta/conf/machine/include/tune-ppce500v2.inc
rename to meta/conf/machine/include/powerpc/tune-ppce500v2.inc
diff --git a/meta/conf/machine/include/tune-ppce5500.inc b/meta/conf/machine/include/powerpc/tune-ppce5500.inc
similarity index 100%
rename from meta/conf/machine/include/tune-ppce5500.inc
rename to meta/conf/machine/include/powerpc/tune-ppce5500.inc
diff --git a/meta/conf/machine/include/tune-ppce6500.inc b/meta/conf/machine/include/powerpc/tune-ppce6500.inc
similarity index 100%
rename from meta/conf/machine/include/tune-ppce6500.inc
rename to meta/conf/machine/include/powerpc/tune-ppce6500.inc
diff --git a/meta/conf/machine/include/tune-sh3.inc b/meta/conf/machine/include/sh/tune-sh3.inc
similarity index 100%
rename from meta/conf/machine/include/tune-sh3.inc
rename to meta/conf/machine/include/sh/tune-sh3.inc
diff --git a/meta/conf/machine/include/tune-sh4.inc b/meta/conf/machine/include/sh/tune-sh4.inc
similarity index 93%
rename from meta/conf/machine/include/tune-sh4.inc
rename to meta/conf/machine/include/sh/tune-sh4.inc
index e21ede36c4ba..b4893a47486e 100644
--- a/meta/conf/machine/include/tune-sh4.inc
+++ b/meta/conf/machine/include/sh/tune-sh4.inc
@@ -6,7 +6,7 @@ require conf/machine/include/sh/arch-sh.inc
 TUNEVALID[sh4] = "Enable SH4 optimizations"
 TUNE_CCARGS .= "${@bb.utils.contains('TUNE_FEATURES', 'sh4', ' -m4', '', d)}"
 
-# NOTE: If you want to optimize to sh4a, conf/machine/include/tune-sh4a.inc.
+# NOTE: If you want to optimize to sh4a, conf/machine/include/sh/tune-sh4a.inc.
 # But it is not compatible for sh4.
 # The binary optimized by m4a doesn't operate on sh4. It works on sh4a only.
 TUNEVALID[sh4a] = "Enable SH4a optimizations"
diff --git a/meta/conf/machine/include/tune-mips64.inc b/meta/conf/machine/include/tune-mips64.inc
deleted file mode 100644
index 9be0e0f8d937..000000000000
--- a/meta/conf/machine/include/tune-mips64.inc
+++ /dev/null
@@ -1,3 +0,0 @@
-DEFAULTTUNE ?= "mips64"
-
-require conf/machine/include/tune-mips32r2.inc
diff --git a/meta/conf/machine/include/qemuboot-x86.inc b/meta/conf/machine/include/x86/qemuboot-x86.inc
similarity index 100%
rename from meta/conf/machine/include/qemuboot-x86.inc
rename to meta/conf/machine/include/x86/qemuboot-x86.inc
diff --git a/meta/conf/machine/include/tune-atom.inc b/meta/conf/machine/include/x86/tune-atom.inc
similarity index 50%
rename from meta/conf/machine/include/tune-atom.inc
rename to meta/conf/machine/include/x86/tune-atom.inc
index 5e1bb74c6cd2..6b84fffc3ff4 100644
--- a/meta/conf/machine/include/tune-atom.inc
+++ b/meta/conf/machine/include/x86/tune-atom.inc
@@ -1,2 +1,2 @@
 # Atom tunings are the same as core2 for now...
-require conf/machine/include/tune-core2.inc
+require conf/machine/include/x86/tune-core2.inc
diff --git a/meta/conf/machine/include/tune-c3.inc b/meta/conf/machine/include/x86/tune-c3.inc
similarity index 100%
rename from meta/conf/machine/include/tune-c3.inc
rename to meta/conf/machine/include/x86/tune-c3.inc
diff --git a/meta/conf/machine/include/tune-core2.inc b/meta/conf/machine/include/x86/tune-core2.inc
similarity index 97%
rename from meta/conf/machine/include/tune-core2.inc
rename to meta/conf/machine/include/x86/tune-core2.inc
index a551cad4d567..97b7c1b1889b 100644
--- a/meta/conf/machine/include/tune-core2.inc
+++ b/meta/conf/machine/include/x86/tune-core2.inc
@@ -9,7 +9,7 @@
 DEFAULTTUNE ?= "core2-32"
 
 # Include the previous tune to pull in PACKAGE_EXTRA_ARCHS
-require conf/machine/include/tune-i686.inc
+require conf/machine/include/x86/tune-i686.inc
 
 # Extra tune features
 TUNEVALID[core2] = "Enable core2 specific processor optimizations"
diff --git a/meta/conf/machine/include/tune-corei7.inc b/meta/conf/machine/include/x86/tune-corei7.inc
similarity index 97%
rename from meta/conf/machine/include/tune-corei7.inc
rename to meta/conf/machine/include/x86/tune-corei7.inc
index bf1ac7a93b33..7798288a74b2 100644
--- a/meta/conf/machine/include/tune-corei7.inc
+++ b/meta/conf/machine/include/x86/tune-corei7.inc
@@ -9,7 +9,7 @@
 DEFAULTTUNE ?= "corei7-64"
 
 # Include the previous tune to pull in PACKAGE_EXTRA_ARCHS
-require conf/machine/include/tune-core2.inc
+require conf/machine/include/x86/tune-core2.inc
 
 # Extra tune features
 TUNEVALID[corei7] = "Enable corei7 specific processor optimizations"
diff --git a/meta/conf/machine/include/tune-i586-nlp.inc b/meta/conf/machine/include/x86/tune-i586-nlp.inc
similarity index 100%
rename from meta/conf/machine/include/tune-i586-nlp.inc
rename to meta/conf/machine/include/x86/tune-i586-nlp.inc
diff --git a/meta/conf/machine/include/tune-i586.inc b/meta/conf/machine/include/x86/tune-i586.inc
similarity index 100%
rename from meta/conf/machine/include/tune-i586.inc
rename to meta/conf/machine/include/x86/tune-i586.inc
diff --git a/meta/conf/machine/include/tune-i686.inc b/meta/conf/machine/include/x86/tune-i686.inc
similarity index 94%
rename from meta/conf/machine/include/tune-i686.inc
rename to meta/conf/machine/include/x86/tune-i686.inc
index 3feb4df8ba2f..293d81e6c540 100644
--- a/meta/conf/machine/include/tune-i686.inc
+++ b/meta/conf/machine/include/x86/tune-i686.inc
@@ -13,7 +13,7 @@ DEFAULTTUNE ?= "i686"
 X86ARCH32 ?= "i686"
 
 # Include the previous tune to pull in PACKAGE_EXTRA_ARCHS
-require conf/machine/include/tune-i586.inc
+require conf/machine/include/x86/tune-i586.inc
 
 # Extra tune features
 TUNEVALID[i686] = "Enable i686 specific processor optimizations"
diff --git a/meta/conf/machine/include/x86-base.inc b/meta/conf/machine/include/x86/x86-base.inc
similarity index 100%
rename from meta/conf/machine/include/x86-base.inc
rename to meta/conf/machine/include/x86/x86-base.inc
diff --git a/meta/conf/machine/qemuarm.conf b/meta/conf/machine/qemuarm.conf
index f893f1a76a0e..93d855b6e1e2 100644
--- a/meta/conf/machine/qemuarm.conf
+++ b/meta/conf/machine/qemuarm.conf
@@ -2,7 +2,7 @@
 #@NAME: QEMU Arm Cortex-A15 machine
 #@DESCRIPTION: Machine configuration for running an ARMv7 system on QEMU
 
-require conf/machine/include/tune-cortexa15.inc
+require conf/machine/include/arm/armv7a/tune-cortexa15.inc
 require conf/machine/include/qemu.inc
 
 KERNEL_IMAGETYPE = "zImage"
diff --git a/meta/conf/machine/qemuarm64.conf b/meta/conf/machine/qemuarm64.conf
index 3dcb0d1b1ef1..ea7fae2722a0 100644
--- a/meta/conf/machine/qemuarm64.conf
+++ b/meta/conf/machine/qemuarm64.conf
@@ -2,7 +2,7 @@
 #@NAME: QEMU ARMv8 machine
 #@DESCRIPTION: Machine configuration for running an ARMv8 system on QEMU
 
-require conf/machine/include/tune-cortexa57.inc
+require conf/machine/include/arm/armv8a/tune-cortexa57.inc
 require conf/machine/include/qemu.inc
 
 KERNEL_IMAGETYPE = "Image"
diff --git a/meta/conf/machine/qemuarmv5.conf b/meta/conf/machine/qemuarmv5.conf
index 7650c2f4a2c2..277dd08ed78d 100644
--- a/meta/conf/machine/qemuarmv5.conf
+++ b/meta/conf/machine/qemuarmv5.conf
@@ -3,7 +3,7 @@
 #@DESCRIPTION: Machine configuration for running an ARMv5 system on QEMU
 
 require conf/machine/include/qemu.inc
-require conf/machine/include/tune-arm926ejs.inc
+require conf/machine/include/arm/armv5/tune-arm926ejs.inc
 
 KERNEL_IMAGETYPE = "zImage"
 
diff --git a/meta/conf/machine/qemumips.conf b/meta/conf/machine/qemumips.conf
index 9b602fcd1f36..1cf21b92fe6a 100644
--- a/meta/conf/machine/qemumips.conf
+++ b/meta/conf/machine/qemumips.conf
@@ -3,8 +3,8 @@
 #@DESCRIPTION: Machine configuration for running a MIPS system on QEMU
 
 require conf/machine/include/qemu.inc
-require conf/machine/include/tune-mips32r2.inc
-require conf/machine/include/qemuboot-mips.inc
+require conf/machine/include/mips/tune-mips32r2.inc
+require conf/machine/include/mips/qemuboot-mips.inc
 
 KERNEL_IMAGETYPE = "vmlinux"
 KERNEL_ALT_IMAGETYPE = "vmlinux.bin"
diff --git a/meta/conf/machine/qemumips64.conf b/meta/conf/machine/qemumips64.conf
index b37d78989b26..32351f993e92 100644
--- a/meta/conf/machine/qemumips64.conf
+++ b/meta/conf/machine/qemumips64.conf
@@ -3,8 +3,8 @@
 #@DESCRIPTION: Machine configuration for running a MIPS64 system on QEMU
 
 require conf/machine/include/qemu.inc
-require conf/machine/include/tune-mips64r2.inc
-require conf/machine/include/qemuboot-mips.inc
+require conf/machine/include/mips/tune-mips64r2.inc
+require conf/machine/include/mips/qemuboot-mips.inc
 
 QB_CPU = "-cpu MIPS64R2-generic"
 
diff --git a/meta/conf/machine/qemuppc.conf b/meta/conf/machine/qemuppc.conf
index a84594f335f3..bab06e292e58 100644
--- a/meta/conf/machine/qemuppc.conf
+++ b/meta/conf/machine/qemuppc.conf
@@ -3,7 +3,7 @@
 #@DESCRIPTION: Machine configuration for running a PPC system on QEMU
 
 require conf/machine/include/qemu.inc
-require conf/machine/include/tune-ppc7400.inc
+require conf/machine/include/powerpc/tune-ppc7400.inc
 
 TARGET_CC_KERNEL_ARCH = "-mno-spe"
 
diff --git a/meta/conf/machine/qemuppc64.conf b/meta/conf/machine/qemuppc64.conf
index a5270e98edb7..2902d541ad6e 100644
--- a/meta/conf/machine/qemuppc64.conf
+++ b/meta/conf/machine/qemuppc64.conf
@@ -3,7 +3,7 @@
 #@DESCRIPTION: Machine configuration for running a PPC system on QEMU
 
 require conf/machine/include/qemu.inc
-require conf/machine/include/tune-power9.inc
+require conf/machine/include/powerpc/tune-power9.inc
 
 KERNEL_IMAGETYPE = "vmlinux"
 
diff --git a/meta/conf/machine/qemux86-64.conf b/meta/conf/machine/qemux86-64.conf
index db9004ee3278..978334d5bbad 100644
--- a/meta/conf/machine/qemux86-64.conf
+++ b/meta/conf/machine/qemux86-64.conf
@@ -9,8 +9,8 @@ PREFERRED_PROVIDER_virtual/libgles2 ?= "mesa"
 
 require conf/machine/include/qemu.inc
 DEFAULTTUNE ?= "core2-64"
-require conf/machine/include/tune-core2.inc
-require conf/machine/include/qemuboot-x86.inc
+require conf/machine/include/x86/tune-core2.inc
+require conf/machine/include/x86/qemuboot-x86.inc
 
 UBOOT_MACHINE ?= "qemu-x86_64_defconfig"
 
diff --git a/meta/conf/machine/qemux86.conf b/meta/conf/machine/qemux86.conf
index 7e6723b880a2..ad7f6e0ee482 100644
--- a/meta/conf/machine/qemux86.conf
+++ b/meta/conf/machine/qemux86.conf
@@ -9,8 +9,8 @@ PREFERRED_PROVIDER_virtual/libgles2 ?= "mesa"
 
 require conf/machine/include/qemu.inc
 DEFAULTTUNE ?= "core2-32"
-require conf/machine/include/tune-corei7.inc
-require conf/machine/include/qemuboot-x86.inc
+require conf/machine/include/x86/tune-corei7.inc
+require conf/machine/include/x86/qemuboot-x86.inc
 
 UBOOT_MACHINE ?= "qemu-x86_defconfig"
 
-- 
2.20.1

