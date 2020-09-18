Received: from mail-pg1-f172.google.com (mail-pg1-f172.google.com [209.85.215.172])
 by mx.groups.io with SMTP id smtpd.web10.410.1600445726199595299
 for <openembedded-core@lists.openembedded.org>;
 Fri, 18 Sep 2020 09:15:26 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@sakoman-com.20150623.gappssmtp.com header.s=20150623 header.b=U13/Xz4E;
 spf=softfail (domain: sakoman.com, ip: 209.85.215.172, mailfrom: steve@sakoman.com)
Received: by mail-pg1-f172.google.com with SMTP id d13so3748509pgl.6
        for <openembedded-core@lists.openembedded.org>; Fri, 18 Sep 2020 09:15:26 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=sakoman-com.20150623.gappssmtp.com; s=20150623;
        h=from:to:subject:date:message-id;
        bh=dpMFjcwQw3oyysMaHEcEgZGQduGCJxxfug93+OgViK0=;
        b=U13/Xz4EhITLe/VEUjZiP9VEE1fJ2rayBaUrZSXOAF50zXSq4us1ViZ7JtfTQzVJBc
         7W3nBHNCW19Fgmew9xaQGAE//mxwhAE8aIBWVXmAGE0yEZAsP6IDRAC8EdrZaiEakOyt
         Z9RIUbqWNWoy/j+4k2/Ltf/aRs9Uh5udhltzAEnKd5wdPHZI4V3LdNQ3YV2FAxgi/Kzy
         pCH1ItBi88q7Ba2katlCpy/5rqCKzb1Ftr++fJU7sRSoxP01Ljf/essdF9EMT/gtLkBN
         fuETK9U+rLtVOT3H+StNBnYCm9auCmWS6UoCSAye613SiVnTXYIZmcVRDoUKM9FZuBPu
         briA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:subject:date:message-id;
        bh=dpMFjcwQw3oyysMaHEcEgZGQduGCJxxfug93+OgViK0=;
        b=EF3q58tveTx8gXQKsMgsb30zBrXsuJKh2II4xbCqmt3Y77mW22NTHURPfrQXUMdbt0
         b1edHZ9QZCQhyribMeuz1PRCJJVZrgEx1KQxE76xa3wtHK+2UPYJ4+HKg2PseOo33nrE
         1Cq8ujHOVGptccHJWrp3mHXFUBaqaZqcXx/CIoDoUptPY0WtvDkOuHLV2rtr3gLkpGwU
         iR/eTYpXhYp4ew9uZbG0Ab1EuDpmryuMBZYLsXLiebUuPJzUkyvrv+hc78egRxodLJU8
         Ig+FId4u1vAKGat13b2+tsS+zVWm4ueYZk8YlyvVupMkIJd1Xayq19qezb07dngJjvBz
         dW4g==
X-Gm-Message-State: AOAM530tIDjUpgMU7lof2RIrDo7NiKQq3J+XxcpXjJOQCm1lJ/5vN3B2
	xUq0SNNuhWwzBoQW4IODpOhw+xNwspm8JQwiL7M=
X-Google-Smtp-Source: ABdhPJxKrk5MpbGLWMSt5fTjl1hXWazOsUweyjsrmGhmcVr/gJBS87rWKYrd0WZPIiTO7yOAOjBXbw==
X-Received: by 2002:a63:4810:: with SMTP id v16mr28261209pga.374.1600445725258;
        Fri, 18 Sep 2020 09:15:25 -0700 (PDT)
Return-Path: <steve@sakoman.com>
Received: from octo.router0800d9.com (rrcs-66-91-142-162.west.biz.rr.com. [66.91.142.162])
        by smtp.gmail.com with ESMTPSA id q15sm3260100pje.29.2020.09.18.09.15.23
        for <openembedded-core@lists.openembedded.org>
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 18 Sep 2020 09:15:24 -0700 (PDT)
From: "Steve Sakoman" <steve@sakoman.com>
To: openembedded-core@lists.openembedded.org
Subject: [OE-core][dunfell 0/7] Patch review
Date: Fri, 18 Sep 2020 06:15:08 -1000
Message-Id: <cover.1600445624.git.steve@sakoman.com>
X-Mailer: git-send-email 2.17.1

Please review this next set of patches for dunfell and have comments back
by end of day Monday.

The following changes since commit b98e50f08b2bcf61fbc75ea1b0ad83a17c0a736a:

  cve-check: avoid FileNotFoundError if no do_cve_check task has run (2020-09-14 04:26:37 -1000)

are available in the Git repository at:

  git://git.openembedded.org/openembedded-core-contrib stable/dunfell-nut
  http://cgit.openembedded.org/openembedded-core-contrib/log/?h=stable/dunfell-nut

Christophe GUIBOUT (1):
  initramfs-framework: support kernel cmdline with double quotes

Geoff Parker (1):
  systemd-serialgetty: Replace sed quoting using ' with " to allow var
    expansion

Khem Raj (1):
  populate_sdk_ext: Do not assume local.conf will always exist

Michael Gloff (1):
  sysvinit: Remove ${B} assignment

Pierre-Jean Texier (1):
  libubootenv: upgrade 0.3 -> 0.3.1

Rahul Kumar (1):
  systemd-serialgetty: Fix sed expression quoting

Steve Sakoman (1):
  Revert "kernel.bbclass: run do_symlink_kernsrc before do_patch"

 meta/classes/kernel.bbclass                         |  2 +-
 meta/classes/populate_sdk_ext.bbclass               |  5 +++--
 .../{libubootenv_0.3.bb => libubootenv_0.3.1.bb}    |  2 +-
 .../initrdscripts/initramfs-framework/init          | 13 +++++++++++++
 meta/recipes-core/systemd/systemd-serialgetty.bb    |  4 ++--
 meta/recipes-core/sysvinit/sysvinit_2.96.bb         |  1 -
 6 files changed, 20 insertions(+), 7 deletions(-)
 rename meta/recipes-bsp/u-boot/{libubootenv_0.3.bb => libubootenv_0.3.1.bb} (94%)

-- 
2.17.1

