Return-Path: <uvv.mail@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id D9DE6C433EF
	for <webhook@archiver.kernel.org>; Fri, 19 Nov 2021 06:15:25 +0000 (UTC)
Received: from mail-wm1-f47.google.com (mail-wm1-f47.google.com
 [209.85.128.47])
 by mx.groups.io with SMTP id smtpd.web09.5281.1637302523073147546
 for <openembedded-core@lists.openembedded.org>;
 Thu, 18 Nov 2021 22:15:23 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20210112 header.b=kW5QoiSd;
 spf=pass (domain: gmail.com, ip: 209.85.128.47, mailfrom: uvv.mail@gmail.com)
Received: by mail-wm1-f47.google.com with SMTP id 137so3928805wma.1
        for <openembedded-core@lists.openembedded.org>;
 Thu, 18 Nov 2021 22:15:22 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=from:to:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=KZK8HR5D2K58t2jWfCgix33ROeNz4XkkbX7HSZnrl9U=;
        b=kW5QoiSdcRscOYlybXPM5unrmKkI9SbQHatMnlIehxvhLXGm58ixU/EjHHePFtQEbo
         0EcQNxN9SBNqyZ1PJ1PlBvzhZZB+Cn0Pssbk63zY6fwAa9IogJqjHWa2b+8Q27H3G6ha
         huugMC5p06KOK8+ysfxnz27lQExVyZTwB8E2TsGN+OSf1llX+mR2l30f2YdhRAM9WQGn
         IxjIz9RIMlTc1rkrr9VVG9g8B6HJmaqV+IkyHMvDvQyIv0m5uAzJeLofqBPoPi10gfEO
         WpzlFcYrT+KlCeQulwl9cXNsLzUPfGRbyP42GTytm3UjEcvihA9ioWTDNo1QoP8nDf6M
         n34Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:from:to:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=KZK8HR5D2K58t2jWfCgix33ROeNz4XkkbX7HSZnrl9U=;
        b=5Y3Q5vxWr44INh3V2m9c0sw13+ZBKTXMR1jxzZ+U/GHW1kTFcz8WrbbMXVtjItGSMs
         vKQ4lPu9UrnXA28vCrVal01VvfGkI/QEkKLOs+IbJCLGR61TUz3SNPlH5QbhBMeISODi
         DK9v8j22ZneWtQz8FCbyfjNwVzDgqeDWRhjaahBMiZOOhyw4Y2LiCH8TimeUhqt+NVLV
         +AIhQMc30KEAnKXi3tR0udLZG9/G1vLKQK+xJvxw3USf4qY55KCXVM6oQ3syM2Uux6lq
         1DI97R8amY00B/uuGJSuJjrF3amwCJsuhyhlzVtvT/mccXQ8LaRwPKyWrxcDcHVKsYus
         YiNw==
X-Gm-Message-State: AOAM532EJxktU+FePyuhbQ0g+EV7EggTk7cjUjbFkgGauiY64QbLA8nQ
	ZI5wV044MS8asK+HFEoAk5DoZ0tlfNWhSQ==
X-Google-Smtp-Source: 
 ABdhPJxOSLp25MX6brIwZCA1TyGGSBbfqNJUObYIxPSxl/2ZitfQx0DkjusmGc80HXpJp3JiIKI31A==
X-Received: by 2002:a1c:f414:: with SMTP id z20mr3853310wma.17.1637302520981;
        Thu, 18 Nov 2021 22:15:20 -0800 (PST)
Received: from slackware.local
 (dslb-002-205-007-197.002.205.pools.vodafone-ip.de. [2.205.7.197])
        by smtp.gmail.com with ESMTPSA id
 z14sm2039249wrp.70.2021.11.18.22.15.20
        for <openembedded-core@lists.openembedded.org>
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 18 Nov 2021 22:15:20 -0800 (PST)
From: Vyacheslav Yurkov <uvv.mail@gmail.com>
To: openembedded-core@lists.openembedded.org
Subject: [PATCH 0/6] Pull request (cover letter only)
Date: Fri, 19 Nov 2021 07:15:01 +0100
Message-Id: <cover.1637301667.git.uvv.mail@gmail.com>
X-Mailer: git-send-email 2.28.0
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Fri, 19 Nov 2021 06:15:25 -0000
X-Groupsio-URL: 
 https://lists.openembedded.org/g/openembedded-core/message/158492

This is a V1 of overlayfs-etc image feature implementation, that allows
to setup the whole /etc under overlayfs. Please review and merge if you
find it OK

The following changes since commit 0d15632f3db787d3f08eb260732567e62f52ffb3:

  libtasn1: upgrade 4.17.0 -> 4.18.0 (2021-11-16 22:19:47 +0000)

are available in the Git repository at:

  git://github.com/UVV-gh/openembedded-core feature/overlayfs-etc
  https://github.com/UVV-gh/openembedded-core/tree/feature/overlayfs-etc

Vyacheslav Yurkov (6):
  overlayfs-etc: mount etc as overlayfs
  wic: image for overlayfs-etc tests
  image: add overlayfs-etc image feature
  oeqa/selftest: overlayfs helper function
  oeqa/selftest: unit tests for overlayfs-etc
  overlayfs: update notes on /etc

 meta-selftest/wic/overlayfs_etc.wks.in    |   4 +
 meta/classes/image.bbclass                |   3 +-
 meta/classes/overlayfs-etc.bbclass        |  93 ++++++++++++
 meta/classes/overlayfs.bbclass            |   1 +
 meta/lib/oeqa/selftest/cases/overlayfs.py | 173 ++++++++++++++++++++--
 5 files changed, 257 insertions(+), 17 deletions(-)
 create mode 100644 meta-selftest/wic/overlayfs_etc.wks.in
 create mode 100644 meta/classes/overlayfs-etc.bbclass

-- 
2.28.0


