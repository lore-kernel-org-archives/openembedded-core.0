Return-Path: <steve@sakoman.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id EE5A3C433EF
	for <webhook@archiver.kernel.org>; Tue, 21 Jun 2022 21:44:07 +0000 (UTC)
Received: from mail-pj1-f46.google.com (mail-pj1-f46.google.com
 [209.85.216.46])
 by mx.groups.io with SMTP id smtpd.web09.238.1655847845636902569
 for <openembedded-core@lists.openembedded.org>;
 Tue, 21 Jun 2022 14:44:05 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@sakoman-com.20210112.gappssmtp.com header.s=20210112
 header.b=DGBp3au8;
 spf=softfail (domain: sakoman.com, ip: 209.85.216.46,
 mailfrom: steve@sakoman.com)
Received: by mail-pj1-f46.google.com with SMTP id
 x1-20020a17090abc8100b001ec7f8a51f5so10871578pjr.0
        for <openembedded-core@lists.openembedded.org>;
 Tue, 21 Jun 2022 14:44:05 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=sakoman-com.20210112.gappssmtp.com; s=20210112;
        h=from:to:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=+CJ6cIC+72+NsTlZXefcVeUEz8AaH5pIL1QwSzEBVIE=;
        b=DGBp3au8KkCw7/nsU05gJvvx4Kc01ZnWoqZJoaDN4f376D16qC1uv0YSPytQ3xtExJ
         k9fAmNeVJcZ84ZE9mokVQSwiZ2mj6dcJOL6PLh0De1XBO14uwQs+oWUcdrHHZUYKkGVP
         rh5QHOJqK6mb5DsLquCQMhvvoILLuxbEAGe/Aq+tz6Y3aFnWVeDbnMd2tWGGMKJtZz8F
         LyeTku8JUK6KKAAdO4hGwvaxFRPYHQOIA2zjK0/FbFyjdtQl+Pwz8xpWgjJqJ4dDBTFA
         wEfGQDPs6+Ae9FrLX6V5ItcweyAojFiE3tKNVl5Xxv9/TLwyw7RT/nRxHur8nb4zMdcy
         wHfw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:from:to:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=+CJ6cIC+72+NsTlZXefcVeUEz8AaH5pIL1QwSzEBVIE=;
        b=3xPdqlt4WzpsKKRIA/MvL1WDy0oP5R5SEXtWi42E/qXF2glQqp3rLMX8OCzLCp9tO4
         C5yuv8fa5IhOFTs3VWtxlPhcFu761TsF/h2/h/Ben7+iViwWdzD6GEeNMKZbg93G3NJS
         NTyrOfW9ktQM2Hprogo9BOqTsoFOdsMjZWyODnM18p3ziiHT+tAzYRUhw5XAmGicucwj
         vVD79nHZ0OqQ5iV2rmeAOVcY3LpVvyerSZU0iIwp5ZVXVx9E0Nj8RnUS4VGOiGCZ64l/
         l4lfZyRk5rsGEattZG4f59EPNzavJeeQSHPbrCi21EW0d0ibpXIXf6Jtzke8W/jsI6Ye
         n2JQ==
X-Gm-Message-State: AJIora9Wl4P2WVqiOMTPg6C5D5RIkvwFes62+WNK/sZYpytslilpghTP
	1W5glkOv2pqVJvT/22Al1d9RrwVJ1Yt50YJz
X-Google-Smtp-Source: 
 AGRyM1vC+8tzFl+8/BDByY8L4bm18FTQvpBxap39MBM/Po1TiF/CaeizGB0ee78sNw/B9eX6wj0fhg==
X-Received: by 2002:a17:903:41cf:b0:16a:911:9181 with SMTP id
 u15-20020a17090341cf00b0016a09119181mr23062356ple.161.1655847844098;
        Tue, 21 Jun 2022 14:44:04 -0700 (PDT)
Received: from hexa.router0800d9.com (dhcp-72-253-6-214.hawaiiantel.net.
 [72.253.6.214])
        by smtp.gmail.com with ESMTPSA id
 e7-20020a17090a9a8700b001eab99a42efsm8632590pjp.31.2022.06.21.14.44.01
        for <openembedded-core@lists.openembedded.org>
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 21 Jun 2022 14:44:02 -0700 (PDT)
From: Steve Sakoman <steve@sakoman.com>
To: openembedded-core@lists.openembedded.org
Subject: [OE-core][dunfell 00/12] Pull request (cover letter only)
Date: Tue, 21 Jun 2022 11:43:51 -1000
Message-Id: <cover.1655847735.git.steve@sakoman.com>
X-Mailer: git-send-email 2.25.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Tue, 21 Jun 2022 21:44:07 -0000
X-Groupsio-URL: 
 https://lists.openembedded.org/g/openembedded-core/message/167188

The following changes since commit 7e056e79a5acce8261cb5124c172cc40ad608b82:

  linux-yocto/5.4: update to v5.4.196 (2022-06-07 08:56:30 -1000)

are available in the Git repository at:

  git://git.openembedded.org/openembedded-core-contrib stable/dunfell-next
  http://cgit.openembedded.org/openembedded-core-contrib/log/?h=stable/dunfell-next

Jose Quaresma (2):
  archiver: use bb.note instead of echo
  archiver: don't use machine variables in shared recipes

Marcel Ziswiler (1):
  alsa-plugins: fix libavtp vs. avtp packageconfig

Martin Jansa (1):
  rootfs.py: close kernel_abi_ver_file

Mingli Yu (1):
  oescripts: change compare logic in OEListPackageconfigTests

Pawan Badganchi (1):
  openssh: Whitelist CVE-2021-36368

Peter Kjellerstedt (1):
  license.bbclass: Bound beginline and endline in copy_license_files()

Rasmus Villemoes (1):
  e2fsprogs: add alternatives handling of lsattr as well

Richard Purdie (2):
  vim: Upgrade 8.2.5034 -> 8.2.5083
  gcc-source: Fix incorrect task dependencies from ${B}

Stefan Wiehler (1):
  kernel-yocto.bbclass: Reset to exiting on non-zero return code at end
    of task

Steve Sakoman (1):
  cups: fix CVE-2022-26691

 meta/classes/archiver.bbclass                 | 11 +++++--
 meta/classes/kernel-yocto.bbclass             |  8 +++++
 meta/classes/license.bbclass                  |  8 ++---
 meta/lib/oe/rootfs.py                         |  4 ++-
 meta/lib/oeqa/selftest/cases/oescripts.py     |  3 +-
 .../openssh/openssh_8.2p1.bb                  |  7 ++++
 .../e2fsprogs/e2fsprogs_1.45.7.bb             |  5 ++-
 meta/recipes-devtools/gcc/gcc-common.inc      |  2 +-
 meta/recipes-devtools/gcc/gcc-source.inc      |  1 +
 meta/recipes-extended/cups/cups.inc           |  3 +-
 .../cups/cups/CVE-2022-26691.patch            | 33 +++++++++++++++++++
 .../alsa/alsa-plugins_1.2.1.bb                |  2 +-
 meta/recipes-support/vim/vim.inc              |  4 +--
 13 files changed, 76 insertions(+), 15 deletions(-)
 create mode 100644 meta/recipes-extended/cups/cups/CVE-2022-26691.patch

-- 
2.25.1


