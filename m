Return-Path: <bruce.ashfield@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 5EBDCC3DA4A
	for <webhook@archiver.kernel.org>; Sun, 11 Aug 2024 18:04:28 +0000 (UTC)
Received: from mail-qv1-f50.google.com (mail-qv1-f50.google.com [209.85.219.50])
 by mx.groups.io with SMTP id smtpd.web11.28964.1723399466927598873
 for <openembedded-core@lists.openembedded.org>;
 Sun, 11 Aug 2024 11:04:27 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20230601 header.b=m+mgQdc4;
 spf=pass (domain: gmail.com, ip: 209.85.219.50, mailfrom: bruce.ashfield@gmail.com)
Received: by mail-qv1-f50.google.com with SMTP id 6a1803df08f44-6bb5a4668faso22922366d6.2
        for <openembedded-core@lists.openembedded.org>; Sun, 11 Aug 2024 11:04:26 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1723399466; x=1724004266; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=xygN6Rml054QndCo6i1Umycm5Wai7jNt+TYcDDAsXIE=;
        b=m+mgQdc4aRay4KIjrGZUGTA+IzJxU1/cUW7is7Kog61fhg6HjgU/1Km4uvEYByOJiN
         Cuu8llEWBvLCKqQt/nhbLE2XHN8gFpLlBSBdBohdbEs5/q/fvuBx3Qi+zJLH8CdrHug8
         L/JCrW7V80fFFjnduxDx9m1GzI9A8o+95/pTVBvlELY1It/EkaMO63UXJG3/oQyBkTYS
         Y7S877jKS3OOIPJikGOH4QXAtIKk/I7ENBwJNSQiVFfW13TwuDXwzek1dSeJ7ZzGRrfJ
         BaY5hVc2cY+Yb4KfRbcAH8mkM0XNq+3sptkPSKrXA1r/hO8vikGOCL/dUDKT9Vpt5Gxh
         aM1w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1723399466; x=1724004266;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=xygN6Rml054QndCo6i1Umycm5Wai7jNt+TYcDDAsXIE=;
        b=vtl9a846EB+uLWm9Ehccc8F/IBxc/V+4QY5yflWycQKLl9eyRkKPLEl2utRlH8MWa+
         9Dp8F0Rc4QLvu+Mwevzu1DrPDVlqSsHvGLeR04iKnaMkOIttPCFRycTPyBTW7q29LG9j
         B7CP59hRj7i69xa8L7XTUBC2HzBxQZE0t6qrY0f/fICI2p6T320vaSKyZF3Q1MdSod8x
         h85unbTr6934kC/5BuHZUuK7EbhEsOe6rR/oooOmyQS10Rv/pEhDjGmKBxqc7yFePu7D
         SIBg6npQXmWBV2i/bOtqWkOZUlpzCgrYl8nMJC3Qu+TYGj5ZFnMbYa9tDJUhQAJI/iXP
         mILg==
X-Gm-Message-State: AOJu0YxDAb40idwh2mgLMz4CxIo8/IFY/lFT6YS/3NTOQ0AnHI+lWxVQ
	3NEVh8J/zkzrRHySOpprjQ/YlDSeVCVhpaRCAflHuKItBtlmbcZQ
X-Google-Smtp-Source: AGHT+IFjcvhOS1KGIvSoP/BSc02e8oXFcVxKIoKbaxwucJlaf1ANq4Zx+jV2ovjohfQjTVm1oeqVSw==
X-Received: by 2002:a0c:c487:0:b0:6bd:88d5:fa87 with SMTP id 6a1803df08f44-6bd88d5fad3mr50092356d6.55.1723399465753;
        Sun, 11 Aug 2024 11:04:25 -0700 (PDT)
Received: from bruce-XPS-8940.localdomain (pool-174-112-62-108.cpe.net.cable.rogers.com. [174.112.62.108])
        by smtp.gmail.com with ESMTPSA id 6a1803df08f44-6bf42f4276esm1383996d6.66.2024.08.11.11.04.24
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 11 Aug 2024 11:04:25 -0700 (PDT)
From: bruce.ashfield@gmail.com
To: richard.purdie@linuxfoundation.org
Cc: openembedded-core@lists.openembedded.org
Subject: [PATCH 0/5] linux-yocto: consolidated pull request
Date: Sun, 11 Aug 2024 14:04:18 -0400
Message-Id: <cover.1723399246.git.bruce.ashfield@gmail.com>
X-Mailer: git-send-email 2.39.2
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Sun, 11 Aug 2024 18:04:28 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/203186

From: Bruce Ashfield <bruce.ashfield@gmail.com>

Richard,

This is mainly a v3 of the 6.10 introduction series, but I've
also included a 6.6 version bump and 6.11 for -dev.

This should fix the:

  - trap seen on multiple machines with 6.10.3, I've disabled a
    NFS option that was introduced in .3 (and shoulldn't have
    been)
  - I've updated -rt to fix the build issue

As I mentioned in another reply, the config warning that showed
up on meta-virt shouldn't have happened, since the Kconfig option
in question was removed from the kernel-cache about three weeks
ago. If that warning comes back, I'll want to have a look at the
SRCREVs being built to see what is going on!

Bruce

The following changes since commit b997e4dc9cce85afeddf5c53b094e00379f7caae:

  ffmpeg: fix build with binutils 2.43 on arm with commerical codecs (2024-08-09 22:33:38 +0100)

are available in the Git repository at:

  https://git.yoctoproject.org/poky-contrib zedd/kernel
  https://git.yoctoproject.org/poky-contrib/log/?h=zedd/kernel

Bruce Ashfield (5):
  linux-yocto-dev: bump to v6.11
  linux-yocto-rt/6.10: update to -rt14
  linux-yocto/6.10: cfg: disable nfsd legacy client tracking
  linux-yocto/6.6: update to v6.6.44
  poky/poky-tiny: bump preferred version to 6.10

 meta-poky/conf/distro/poky-tiny.conf          |  2 +-
 meta-poky/conf/distro/poky.conf               |  4 +--
 meta/recipes-kernel/linux/linux-yocto-dev.bb  |  4 +--
 .../linux/linux-yocto-rt_6.10.bb              |  4 +--
 .../linux/linux-yocto-rt_6.6.bb               |  6 ++--
 .../linux/linux-yocto-tiny_6.10.bb            |  2 +-
 .../linux/linux-yocto-tiny_6.6.bb             |  6 ++--
 meta/recipes-kernel/linux/linux-yocto_6.10.bb |  2 +-
 meta/recipes-kernel/linux/linux-yocto_6.6.bb  | 28 +++++++++----------
 9 files changed, 29 insertions(+), 29 deletions(-)

-- 
2.39.2


