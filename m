Received: from mail-pg1-f178.google.com (mail-pg1-f178.google.com [209.85.215.178])
 by mx.groups.io with SMTP id smtpd.web10.657.1603215319860838424
 for <openembedded-core@lists.openembedded.org>;
 Tue, 20 Oct 2020 10:35:20 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@sakoman-com.20150623.gappssmtp.com header.s=20150623 header.b=Jp7rr+Pz;
 spf=softfail (domain: sakoman.com, ip: 209.85.215.178, mailfrom: steve@sakoman.com)
Received: by mail-pg1-f178.google.com with SMTP id o3so1492985pgr.11
        for <openembedded-core@lists.openembedded.org>; Tue, 20 Oct 2020 10:35:19 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=sakoman-com.20150623.gappssmtp.com; s=20150623;
        h=from:to:subject:date:message-id;
        bh=btEpNezjRuk385M090y5EKJ9aM17Srcu5aCgWM2RU9Y=;
        b=Jp7rr+PztL7nsVZw1y5B77uptp4f31/ef2HSigkagX9DUEWvnQqqzjuPc1W970b1xw
         K3McEjsFmdxvIzGJ4QiN0nIai5Y2qeUXKjWrEyk5MqaARvFknkqbCmsiuRupn7tdetLF
         zP//nUivwlIRvIdKo3Loxp/Dg3WfzAU4+nsVEFSDBHYXnEQaBIfiDMIFn7z8UzoPzVP7
         CfCfX8cpOKsPrjGKudw9wlY8b/NXoiLba43BGEZlmEaZZPl4ea48FYimVCNe4yLdVA5e
         PdveTPNpp5XIuVRAooz66pZWtXfnleUqZoPt19X7yJy24FOWJIwZIJVZCk/C+F1Sl6xi
         ZcKQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:subject:date:message-id;
        bh=btEpNezjRuk385M090y5EKJ9aM17Srcu5aCgWM2RU9Y=;
        b=XlbKYtl2/VHQgNGe8uMWa6pYLw34PYngigBMED58oaSzL+bx918mNpIr9UlIzKfZ2H
         zNUcaBtbTnno629Ilu11jv2mxA/82Fj6jgPpI7P3BeoKEHzu+NZKxuJrPXY1DvKVJNMO
         uMaExEGMmr0Vpk7EhIM/J3tAxJwOki+kLf8QYsysTNfnT3ZMG03H1ClAxiUwzRDWNn5A
         PMpRk51I2KghD0YsbOc2yr8zly9b5bM6dzVUs+0N5ZVEbvKxLvLpjcfnsMMMu/a9q0MY
         nq39svrdEw8SH5GOL2mIS/z4QGGsVUk4zvL0qrhOilEM7IMvwuhv4h7ilH0exp6fmUxG
         7oGw==
X-Gm-Message-State: AOAM531wLC9KnQbdhBgv6hV7wnQP9/oWA7QhgZW5Jw+2+7N2MQih0Cor
	JenPIkGfXS5BAWkSWg5jSuGFwqfN9Jwq2AsM
X-Google-Smtp-Source: ABdhPJwyZrYzd1w0AlFKKZS8OJm7Lij2FovEJoQVtWfv7hmRzqqkOtdI0NwoI2jKSXOmf3Wcz1JScQ==
X-Received: by 2002:a65:6712:: with SMTP id u18mr3500414pgf.84.1603215318654;
        Tue, 20 Oct 2020 10:35:18 -0700 (PDT)
Return-Path: <steve@sakoman.com>
Received: from octo.router0800d9.com (rrcs-66-91-142-162.west.biz.rr.com. [66.91.142.162])
        by smtp.gmail.com with ESMTPSA id bj17sm2356567pjb.15.2020.10.20.10.35.17
        for <openembedded-core@lists.openembedded.org>
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 20 Oct 2020 10:35:17 -0700 (PDT)
From: "Steve Sakoman" <steve@sakoman.com>
To: openembedded-core@lists.openembedded.org
Subject: [OE-core][dunfell 0/5] Pull request (cover letter only)
Date: Tue, 20 Oct 2020 07:35:06 -1000
Message-Id: <cover.1603215240.git.steve@sakoman.com>
X-Mailer: git-send-email 2.17.1

The following changes since commit 656d2070f8448681cb69a3d43dbae84a681c1a75:

  linux-yocto/5.4: update to v5.4.69 (2020-10-07 13:41:09 -1000)

are available in the Git repository at:

  git://git.openembedded.org/openembedded-core-contrib stable/dunfell-next
  http://cgit.openembedded.org/openembedded-core-contrib/log/?h=stable/dunfell-next

Armin Kuster (1):
  timezone: update to 2020b

Naoki Hayama (1):
  uninative: Fix typo in error message

Richard Purdie (2):
  scripts/oe-build-perf-report: Allow operation with no buildstats
  oe-build-perf-report: Ensure correct data is shown for multiple branch
    options

Yoann Congal (1):
  bitbake-bblayers/create: Make the example recipe print its message

 meta/classes/uninative.bbclass              | 2 +-
 meta/lib/bblayers/templates/example.bb      | 4 +++-
 meta/recipes-extended/timezone/timezone.inc | 8 +++-----
 meta/recipes-extended/timezone/tzdata.bb    | 8 ++++----
 scripts/oe-build-perf-report                | 6 +++---
 5 files changed, 14 insertions(+), 14 deletions(-)

-- 
2.17.1

