Received: from mail-qt1-f182.google.com (mail-qt1-f182.google.com [209.85.160.182])
 by mx.groups.io with SMTP id smtpd.web10.220.1626377415340104063
 for <openembedded-core@lists.openembedded.org>;
 Thu, 15 Jul 2021 12:30:15 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20161025 header.b=HLESER9q;
 spf=pass (domain: gmail.com, ip: 209.85.160.182, mailfrom: bruce.ashfield@gmail.com)
Received: by mail-qt1-f182.google.com with SMTP id w26so5342914qto.9
        for <openembedded-core@lists.openembedded.org>; Thu, 15 Jul 2021 12:30:15 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=moCFH8QiCqdfdb3ciqF2x4aTv/8A8Wy82Du9RWw1gAI=;
        b=HLESER9q/5CjGpXsQ1Z37+4NoTv5mN7ZiRq3iWF23m1U06IDppSitboT81dliJJG77
         zjCqTjh2gviR6YfSNjS61T7vHCAM4WVRZd3AyJ2tJBJ2+R200H4nJyb6/7VlzZbqTmAK
         d7BB+8s1EXHHgrJT0sPgJ49Kk5Lhwxc7W/99Hi0kzmxGpEAKjhnYztd+dZW5SRbeLSVd
         mdQs2WiPGLNEiFxKPqDjudbvGjl3ZDzcd4ARXWgHUvOdt9V6Lh+2HV/pSUo9CCXBRS8D
         yMwk8uvlwy8csnlIrMuFvIk3HAvUNu0ARK2r5le0pscTlo3ilEHd8bLsbOBLEYdRFOZE
         35ZQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=moCFH8QiCqdfdb3ciqF2x4aTv/8A8Wy82Du9RWw1gAI=;
        b=e3430EPgNHmInqQyb44GtHELINkuBzruXVdkWiSrpJQ4/aTiYT6zRwcVmQwSAXXRSt
         sqEjc9Ke3dZTyMdgK7Z7bq4lJNV/67ghGwmreGBIqNbJOjZ2oZLEucKwXd9auNxVoqgY
         ALPFFJVgvLCPh8sbsxhmTl7yZFG3ZHhQotGst9ILVIUGs5kv60xKR5fJLJQQSVIdL2jh
         ckwddeE3NW904HV3e91x8GO4B4n30fA5xdUWba1X14nrjYn/iefLPHirfI2oy90yWalj
         f63IVDVb9LEETcwwFA6J93/igprdQjTXLBeEzFnmJgS0jFLEn8GTkJYuKg8i7GJ2rjFb
         8n0A==
X-Gm-Message-State: AOAM532/0iNnTngiAqZIicHNf08SfdxTq3BHmYhQc+ykWzRL4VdIuBC3
	lBxmJqYJhkXrr5gQg27YVn4=
X-Google-Smtp-Source: ABdhPJx9lUakJpThXPloKKVihQLUWHogyoZrclukOQcSY8ltulLpB1BWzut+S6yEXpvV0z61s6+uyw==
X-Received: by 2002:ac8:724c:: with SMTP id l12mr5525684qtp.372.1626377414451;
        Thu, 15 Jul 2021 12:30:14 -0700 (PDT)
Return-Path: <bruce.ashfield@gmail.com>
Received: from build.lan (cpe04d4c4975b80-cmf4c11490699b.cpe.net.cable.rogers.com. [174.112.63.222])
        by smtp.gmail.com with ESMTPSA id f36sm2340670qtb.40.2021.07.15.12.30.13
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 15 Jul 2021 12:30:13 -0700 (PDT)
From: "Bruce Ashfield" <bruce.ashfield@gmail.com>
To: richard.purdie@linuxfoundation.org
Cc: openembedded-core@lists.openembedded.org
Subject: [PATCH 0/8] linux-yocto: consolidated pull request
Date: Thu, 15 Jul 2021 15:30:04 -0400
Message-Id: <cover.1626377295.git.bruce.ashfield@gmail.com>
X-Mailer: git-send-email 2.19.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

From: Bruce Ashfield <bruce.ashfield@gmail.com>

Richard,

Here's the next round of -stable and configuration tweaks for the kernel
recipes in master.

This is probably the last bump (for master) of 5.4, as I'll drop it and
make 5.13 the default shortly.

This pull request also contains the v2 of the devupstream support for
linux-yocto, with the tweaks to PN versus PV that you suggested to v1.

Cheers,

Bruce


The following changes since commit 262d2c6b6c4f357a8ec083af0934dcbb3acd169c:

  python3-setuptools: upgrade 57.0.0 -> 57.1.0 (2021-07-13 14:27:53 +0100)

are available in the Git repository at:

  git://git.yoctoproject.org/poky-contrib zedd/kernel
  http://git.yoctoproject.org/cgit.cgi/poky-contrib/log/?h=zedd/kernel

Bruce Ashfield (8):
  linux-yocto/5.13: add devupstream support
  linux-yocto-rt/5.13: integrate -rt1
  linux-yocto: add vfat KERNEL_FEATURE when MACHINE_FEATURES include
    vfat
  linux-yocto/5.10: update to v5.10.49
  linux-yocto/5.4: update to v5.4.131
  linux-yocto/5.13: update to v5.13.2
  linux-yocto/5.10: update to v5.10.50
  linux-yocto/5.4: update to v5.4.132

 .../linux/linux-yocto-rt_5.10.bb              |  6 ++--
 .../linux/linux-yocto-rt_5.13.bb              |  6 ++--
 .../linux/linux-yocto-rt_5.4.bb               |  6 ++--
 .../linux/linux-yocto-tiny_5.10.bb            |  8 ++---
 .../linux/linux-yocto-tiny_5.13.bb            |  8 ++---
 .../linux/linux-yocto-tiny_5.4.bb             |  8 ++---
 meta/recipes-kernel/linux/linux-yocto.inc     |  1 +
 meta/recipes-kernel/linux/linux-yocto_5.10.bb | 24 ++++++-------
 meta/recipes-kernel/linux/linux-yocto_5.13.bb | 34 ++++++++++++-------
 meta/recipes-kernel/linux/linux-yocto_5.4.bb  | 22 ++++++------
 10 files changed, 67 insertions(+), 56 deletions(-)

-- 
2.19.1

