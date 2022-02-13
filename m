Return-Path: <bruce.ashfield@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 32A5FC433F5
	for <webhook@archiver.kernel.org>; Sun, 13 Feb 2022 01:23:48 +0000 (UTC)
Received: from mail-qt1-f173.google.com (mail-qt1-f173.google.com
 [209.85.160.173])
 by mx.groups.io with SMTP id smtpd.web12.16536.1644715426976335681
 for <openembedded-core@lists.openembedded.org>;
 Sat, 12 Feb 2022 17:23:47 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20210112 header.b=FHaKDdPl;
 spf=pass (domain: gmail.com, ip: 209.85.160.173,
 mailfrom: bruce.ashfield@gmail.com)
Received: by mail-qt1-f173.google.com with SMTP id y8so12444515qtn.8
        for <openembedded-core@lists.openembedded.org>;
 Sat, 12 Feb 2022 17:23:46 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=gZvmOUwjQtS6xEaNpunuzAVHfPoqO4Sl1QIqwwyKpO4=;
        b=FHaKDdPlaiGsDVdNIrWLcIHpdeWwoQMBFDZXxzNkhY1wH5YS7O3U1e/fo2USbzxcFe
         pZvSIxGHN2k2C/lOjz/tJlfBsU+xezC7tLSc5/vdIQXpNsSkj+TitvZ6lbzztjq3C4MO
         tVRFErDw7Qey03sg2d0SCXotoKKc7aoDYk6bB8MIVFgMk6+PPcQOdvFmWsKUt6574IUD
         y6wk/8resFqILOsUhcRljm2SPDCXrHI72UKdrshS9ZIS55rfzu30WWpw7yleAnYOmrPt
         u2E3CU5ap+EGmKIEemOBWCslSAvXvJLQkaI5r8HenA4FtBK8EXwzm1mgy+z/AasaBSL9
         KmjQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=gZvmOUwjQtS6xEaNpunuzAVHfPoqO4Sl1QIqwwyKpO4=;
        b=6RwtmH9ot8DTDYwirBYWNSE21k/dxd9REjRU1Sus1PgS/Mli5xd05g5z1mrRwMJZyi
         pXUAyHuo6528zcrtAMu4xQB/nD21i3HdiYgFtSbhTcgt1+iUxJWl77sY9LwZdcJMG4ON
         cWSIPgkNoRuV6zFHVH9dTapzGN5hKo5HzqXa7qwLlohKloASBUTgi8m3ka9PI1hEaNeW
         WsWgTPpB18igeAvmBHmRw1iejZP0Wmt1z9835Ly7frFa4OZIaeAMoNdEUcbM6tW1FFxV
         wmrmkwozyE00nJFo7yywFy0Osqr203kmVKWs8rKuQSsGs0inEh0k1te5RHn6D+vwXqw7
         iSLw==
X-Gm-Message-State: AOAM532bZX0J7K6Pc476g2gmprSfgJ+RGDVaM0uk0VWz/FoHBATRIP9k
	6IuG1/K3XkEJrnCVn/q593ZVfJJ3vVtYMQ==
X-Google-Smtp-Source: 
 ABdhPJxy7dr66psFHqNxfO66rvD4pcg+BI/3s//Ajd7K/TPq1opmNBofRYYX+oz3R0k+Y6gdwQ86+g==
X-Received: by 2002:ac8:5ac9:: with SMTP id d9mr5735751qtd.230.1644715426045;
        Sat, 12 Feb 2022 17:23:46 -0800 (PST)
Received: from build.lan
 (cpe04d4c4975b80-cmf4c11490699b.cpe.net.cable.rogers.com. [174.112.63.222])
        by smtp.gmail.com with ESMTPSA id
 w13sm13016556qkb.106.2022.02.12.17.23.45
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 12 Feb 2022 17:23:45 -0800 (PST)
From: bruce.ashfield@gmail.com
To: richard.purdie@linuxfoundation.org
Cc: openembedded-core@lists.openembedded.org
Subject: [PATCH 0/4] linux-yocto: consolidated pull request
Date: Sat, 12 Feb 2022 20:23:40 -0500
Message-Id: <cover.1644715271.git.bruce.ashfield@gmail.com>
X-Mailer: git-send-email 2.19.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Sun, 13 Feb 2022 01:23:48 -0000
X-Groupsio-URL: 
 https://lists.openembedded.org/g/openembedded-core/message/161675

From: Bruce Ashfield <bruce.ashfield@gmail.com>

Richard,

Here's the lastest -stable updates, plus the two backported changes to
fix the binutils 2.3.8 builds.

Bruce

The following changes since commit 81fe3dfab99149a3e5a6b5cf0086dd8cbef1177d:

  oeqa/buildtools: Switch to our webserver instead of example.com (2022-02-12 17:38:07 +0000)

are available in the Git repository at:

  git://git.yoctoproject.org/poky-contrib zedd/kernel
  http://git.yoctoproject.org/cgit.cgi/poky-contrib/log/?h=zedd/kernel

Bruce Ashfield (4):
  linux-yocto/5.15: update to v5.15.22
  linux-yocto/5.10: update to v5.10.99
  linux-yocto/5.15: ppc/riscv: fix build with binutils 2.3.8
  linux-yocto/5.10: ppc/riscv: fix build with binutils 2.3.8

 .../linux/linux-yocto-rt_5.10.bb              |  6 ++---
 .../linux/linux-yocto-rt_5.15.bb              |  6 ++---
 .../linux/linux-yocto-tiny_5.10.bb            |  8 +++---
 .../linux/linux-yocto-tiny_5.15.bb            |  8 +++---
 meta/recipes-kernel/linux/linux-yocto_5.10.bb | 24 ++++++++---------
 meta/recipes-kernel/linux/linux-yocto_5.15.bb | 26 +++++++++----------
 6 files changed, 39 insertions(+), 39 deletions(-)

-- 
2.19.1


