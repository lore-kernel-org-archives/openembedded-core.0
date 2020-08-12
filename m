Received: from mail-qk1-f195.google.com (mail-qk1-f195.google.com [209.85.222.195])
 by mx.groups.io with SMTP id smtpd.web12.19237.1597251816197814158
 for <openembedded-core@lists.openembedded.org>;
 Wed, 12 Aug 2020 10:03:36 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20161025 header.b=LrHPxmIT;
 spf=pass (domain: gmail.com, ip: 209.85.222.195, mailfrom: bruce.ashfield@gmail.com)
Received: by mail-qk1-f195.google.com with SMTP id b79so2674963qkg.9
        for <openembedded-core@lists.openembedded.org>; Wed, 12 Aug 2020 10:03:36 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=MNkHI2CcWYEUPJeKIiz/ryx3GT37EyXdbQxfv1Sm/fA=;
        b=LrHPxmITi7UMfbP5swQdu8kreoc7FpgNjEGuGJJ6zoQ3YgQ04PktDpqrHVNxTWMGU3
         BgNeJDHCrKAS7K1SV2Py4n0dRdhRvW8z7giU/TejT/J9XN6+G3tKgAdq5ddS7WIgABzH
         TEI8j5fzqbPHK1iV5MqPeQ3LwMGsDJJkTXuEMF6r4nx8tTGQU2DVquYS/zEKHWWcdFyt
         fgl5LlcbDQtAauBpK8c2BQeB/ar0pr51fTMqMyzAVqq6gSPYZpzDmnkY4wN4D/VnujZF
         D+ZDyo3YyVz36WtAe82bz9hEkhwU92QHZIKIydGCO/FrQcXLlZ6bNSq0inlCq/C0WN3D
         s4zw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=MNkHI2CcWYEUPJeKIiz/ryx3GT37EyXdbQxfv1Sm/fA=;
        b=Qo9kjswhwltmQYcf9lYYhi0+WzNbV7Zv2qwlWrEke4kIGGl4C2Qboc8ewjNJYYMQz+
         SkiHKyKKhnML8o9lj9EKMMtSuydH25Ud1fo9kVExTYUq/R9rvzFzF59T/PMM50owT42s
         vjfgmjIb2jCURyYZRje+HvafJAmobdDzx9J2cirN20Y03S/YCulE69NPui516WJ+S5Pq
         1mEuWhFe5NSO2vGVAnP7VXGc1rwJy9yqSSrcTE8IlFwVqJxiSu0MlMvoCxp4td1e9Gbc
         NW3u9GNc6jztvtzpisCzkLINSylk6/R5u9V6MbK4BkimUZ4etWItVJWM1oKi6a4Iw70l
         2jmg==
X-Gm-Message-State: AOAM533j2fQRe7tBIkrbde05pWPz0mgKfmh625lmPXWsaPlZ9AS9M9Kv
	JC3Szd8YysmJc7/Lbu73iL4=
X-Google-Smtp-Source: ABdhPJwPwJiQ61r3k6l2nreUmMJTLDwjfuvoWCmU3nIxrJh2u73PALqwcIRMSM5oTvvYSD+w+waZNA==
X-Received: by 2002:a05:620a:2230:: with SMTP id n16mr926480qkh.268.1597251814441;
        Wed, 12 Aug 2020 10:03:34 -0700 (PDT)
Return-Path: <bruce.ashfield@gmail.com>
Received: from localhost.localdomain (CPE04d4c4975b80-CM64777d5e8820.cpe.net.cable.rogers.com. [174.112.240.214])
        by smtp.gmail.com with ESMTPSA id k24sm3249977qtb.26.2020.08.12.10.03.33
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 12 Aug 2020 10:03:33 -0700 (PDT)
From: "Bruce Ashfield" <bruce.ashfield@gmail.com>
To: richard.purdie@linuxfoundation.org
Cc: openembedded-core@lists.openembedded.org
Subject: [PATCH 00/10] kernel-yocto: consolidated pull request
Date: Wed, 12 Aug 2020 13:03:21 -0400
Message-Id: <cover.1597203921.git.bruce.ashfield@gmail.com>
X-Mailer: git-send-email 2.19.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

From: Bruce Ashfield <bruce.ashfield@gmail.com>

Richard,

This is the part of my queue that is in preparation for the v5.8 kernel
and libc-headers.

I've been chasing issues that have (re)appeared (I fixed all these once
before) with the recent gcc10 changes. I'm holding back the v5.8 core
changes, until I can confirm that everything is indeed still working.

Along with the v5.8 prep changes, I have some tweaks to the recent
symbol analysis update (to fix some issues reported on IRC).

And finally, there are some routine v5.4 -stable kernel updates. I'll
bump the reference BSPs as parts of some other series.

Cheers,

Bruce

The following changes since commit f664ecb910fdcc20aa9d3db6f5402e9008a5dd13:

  bitbake: data: emit filename/lineno information for shell functions (2020-08-08 09:19:34 +0100)

are available in the Git repository at:

  git://git.yoctoproject.org/poky-contrib zedd/kernel
  http://git.yoctoproject.org/cgit.cgi/poky-contrib/log/?h=zedd/kernel

Bruce Ashfield (9):
  linux-yocto-rt/5.4: update to rt32
  linux-yocto/5.4: update to v5.4.56
  linux-yocto/5.4: update to v5.4.57
  kernel-yocto: set cwd before querying the meta data dir
  kernel-yocto: make # is not set matching more precise
  kernel-yocto: split meta data gathering into patch and config phases
  make-mod-scripts: add HOSTCXX definitions and gmp-native dependency
  kernel-devsrc: fix on target modules prepare for ARM
  kernel-devsrc: 5.8 + gcc10 require gcc-plugins + libmpc-dev

Zhang Qiang (1):
  kernel.bbclass: Configuration for environment with HOSTCXX

 meta/classes/kernel-yocto.bbclass             | 74 +++++++++++--------
 meta/classes/kernel.bbclass                   |  2 +
 .../kern-tools/kern-tools-native_git.bb       |  2 +-
 meta/recipes-kernel/linux/kernel-devsrc.bb    |  6 +-
 .../linux/linux-yocto-rt_5.4.bb               |  6 +-
 .../linux/linux-yocto-tiny_5.4.bb             |  8 +-
 meta/recipes-kernel/linux/linux-yocto_5.4.bb  | 22 +++---
 .../make-mod-scripts/make-mod-scripts_1.0.bb  |  2 +
 8 files changed, 71 insertions(+), 51 deletions(-)

-- 
2.19.1

