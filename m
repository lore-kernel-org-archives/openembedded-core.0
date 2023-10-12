Return-Path: <bruce.ashfield@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 7F10FCDB46E
	for <webhook@archiver.kernel.org>; Thu, 12 Oct 2023 17:39:13 +0000 (UTC)
Received: from mail-vs1-f47.google.com (mail-vs1-f47.google.com [209.85.217.47])
 by mx.groups.io with SMTP id smtpd.web11.18919.1697132345963225371
 for <openembedded-core@lists.openembedded.org>;
 Thu, 12 Oct 2023 10:39:06 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20230601 header.b=F3hKISnG;
 spf=pass (domain: gmail.com, ip: 209.85.217.47, mailfrom: bruce.ashfield@gmail.com)
Received: by mail-vs1-f47.google.com with SMTP id ada2fe7eead31-45767f1482cso487233137.1
        for <openembedded-core@lists.openembedded.org>; Thu, 12 Oct 2023 10:39:05 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1697132345; x=1697737145; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=CJhRVSLrCYFdDICYtQ27gOA8MzBHjeppyqg3Zb1DXtk=;
        b=F3hKISnGfpkUchRA6g3xFpeCKWKLYFupF7zurDO8JcOme1Zn/4ZWAsDm5wnQOlX30i
         HLTP4qEjB0C//7qsLN5x3m+TBf3A+PBSuS42EU1EMGIPf3rcaXRo/MtzDI4CodRXVJo2
         48RJT8whrn5RE/4NPS6N9ofzpOW0aKs8xbBouXYTxgOLqshIQCSYYz8yMtQAdswoiEpF
         259yJlflW9l21qWM94ESBWDgv/MfpEUpXGjvzgNF/N0D6GpQAjYveyHM5cOTz9PhRaYs
         pIS7PLnNH5IZHjwpEPcrVfnE6WPzICeGtKFlWz3LH7oGkk1lxB8q2GzsR6qYNWdK47LJ
         L7Cg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1697132345; x=1697737145;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=CJhRVSLrCYFdDICYtQ27gOA8MzBHjeppyqg3Zb1DXtk=;
        b=C+qJeSyDvhlDzfeLG8hHDzh/leA3vVeZ6cop/pyqVDfImhiOJIxNOjNgj7tCrJmOm6
         BdKyqaOCZA7wpasg+Y3E9ft8tyQoTKMR2gZuyS1Sp16y0mkZCzA2h0P5eznBoRmOKD/A
         rgUzmghSvb/x6F+QCRb/90992uXBaHIfztKmImEpNn0/0KQ1f+qxxUsaElcH7hlE9JuF
         nv/8bAKQ3rwOM7JVpJc/JI2RvQbzSvjPp3A8btBTSNXDmx6Yy4tEVHi2my3hJjSZounP
         UO+ZDdcStsgtUNhcihP2gasd+ZrFz0A4goxF/oOKflboYLqEHevC2K9xpruiXHUq/XyX
         wKIA==
X-Gm-Message-State: AOJu0YxK7mdaRZpFIfK3bY5e/GFJl88S77b7poNP8GwOrZe4/fDSEpvF
	+s7VFvANkv07XEXjWGOLUqY=
X-Google-Smtp-Source: AGHT+IH78NUD/9uSrmdTq0HRQCtsNWJYRiyyuJn+lB5PuXDuL1isF6sE7r+nJjFXJ7xSNP9YLs+Qxg==
X-Received: by 2002:a05:6102:5709:b0:457:a913:e89d with SMTP id dg9-20020a056102570900b00457a913e89dmr4211437vsb.12.1697132344899;
        Thu, 12 Oct 2023 10:39:04 -0700 (PDT)
Received: from build.lan ([174.112.183.231])
        by smtp.gmail.com with ESMTPSA id hb11-20020a05622a2b4b00b0041969bc2e4csm6385283qtb.32.2023.10.12.10.39.04
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 12 Oct 2023 10:39:04 -0700 (PDT)
From: bruce.ashfield@gmail.com
To: richard.purdie@linuxfoundation.org
Cc: openembedded-core@lists.openembedded.org
Subject: [PATCH 0/7] linux-yocto: pull request
Date: Thu, 12 Oct 2023 13:38:55 -0400
Message-Id: <cover.1697132218.git.bruce.ashfield@gmail.com>
X-Mailer: git-send-email 2.34.1
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Thu, 12 Oct 2023 17:39:13 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/189011

From: Bruce Ashfield <bruce.ashfield@gmail.com>

Richard,

Here are the latest 6.1 and 6.5 -stable bumps. They aren't particularly
large -stable bumps and I didn't find any issues in my testing.

I've also got a configuration fix for -tinty on ARM that Ross has been
waiting for to enable some additional testing.

And finally, now that 6.5 is the default (for better or for worse!), it
is time to drop the 6.4 recipes.

Bruce


The following changes since commit 8d0ba08aa6137de7438744708541332e29279ae8:

  go: update 1.20.9 -> 1.20.10 (2023-10-12 07:53:40 +0100)

are available in the Git repository at:

  https://git.yoctoproject.org/poky-contrib zedd/kernel
  https://git.yoctoproject.org/poky-contrib/log/?h=zedd/kernel

Bruce Ashfield (7):
  linux-yocto/6.1: update to v6.1.56
  linux-yocto/6.5: update to v6.5.6
  linux-yocto/6.1: tiny: fix arm 32 boot
  linux-yocto/6.5: tiny: fix arm 32 boot
  linux-yocto/6.4: drop recipes
  linux-yocto/6.5: update to v6.5.7
  linux-yocto/6.1: update to v6.1.57

 .../linux/cve-exclusion_6.4.inc               | 5072 -----------------
 .../linux/linux-yocto-rt_6.1.bb               |    6 +-
 .../linux/linux-yocto-rt_6.4.bb               |   48 -
 .../linux/linux-yocto-rt_6.5.bb               |    6 +-
 .../linux/linux-yocto-tiny_6.1.bb             |    6 +-
 .../linux/linux-yocto-tiny_6.4.bb             |   33 -
 .../linux/linux-yocto-tiny_6.5.bb             |    6 +-
 meta/recipes-kernel/linux/linux-yocto_6.1.bb  |   28 +-
 meta/recipes-kernel/linux/linux-yocto_6.4.bb  |   72 -
 meta/recipes-kernel/linux/linux-yocto_6.5.bb  |   28 +-
 10 files changed, 40 insertions(+), 5265 deletions(-)
 delete mode 100644 meta/recipes-kernel/linux/cve-exclusion_6.4.inc
 delete mode 100644 meta/recipes-kernel/linux/linux-yocto-rt_6.4.bb
 delete mode 100644 meta/recipes-kernel/linux/linux-yocto-tiny_6.4.bb
 delete mode 100644 meta/recipes-kernel/linux/linux-yocto_6.4.bb

-- 
2.34.1


