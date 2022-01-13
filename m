Return-Path: <steve@sakoman.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id B3D6BC433F5
	for <webhook@archiver.kernel.org>; Thu, 13 Jan 2022 14:37:32 +0000 (UTC)
Received: from mail-pf1-f182.google.com (mail-pf1-f182.google.com
 [209.85.210.182])
 by mx.groups.io with SMTP id smtpd.web08.9618.1642084652135250693
 for <openembedded-core@lists.openembedded.org>;
 Thu, 13 Jan 2022 06:37:32 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@sakoman-com.20210112.gappssmtp.com header.s=20210112
 header.b=43AlQq/X;
 spf=softfail (domain: sakoman.com, ip: 209.85.210.182,
 mailfrom: steve@sakoman.com)
Received: by mail-pf1-f182.google.com with SMTP id p37so38696pfh.4
        for <openembedded-core@lists.openembedded.org>;
 Thu, 13 Jan 2022 06:37:32 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=sakoman-com.20210112.gappssmtp.com; s=20210112;
        h=from:to:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=0UqUq9DKIiYLzknB9hCE/m4F+oiWLpxkAj1fg1YJrHU=;
        b=43AlQq/XjbkPvv6h/mPScIQuDtxJKvbTo9sZm/yTysVlYFoldRErpQ2XSg3z/LLalo
         VwdLQI9IIZX+6bwG8VvZLs+NSWyj6cmb9uJOVJKfHdziMCbZ0ICSwJEGDtO/Z9JJ/f7w
         eI4H6br8J/QWwO6/kMvr8ku/Jh7fuk5ED8MJ8exqpAKOVXGq2/LE/zVkT6Ul758T0Kgl
         W5PVGjeG5V4pDIWvczDP56VRSCaPoisjx5xGoxdz/lZMjAKHuzJXh+jNm/s40Pamw+l4
         4Y+ot79md0IQzovzDVd3rUQ71JPJykEKr9ez/naOfrn5l1veq3cm/CWWnTotQzuL/+mf
         P5Nw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:from:to:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=0UqUq9DKIiYLzknB9hCE/m4F+oiWLpxkAj1fg1YJrHU=;
        b=harHFSmEBbDiN5OzrdWUKD4dhKQS0JFoMlr6FHFhhwTUEnUJKf/7sP1YoK46NYxFzI
         572C5Kyk9N3jE4B9jW1/NTsXyOcOD81X+icdLhoS1Wf48QEV1I2sEPt90Z7JX0cgl8iE
         D+9YlVv1zLJRsFAY2snxJvcG6qCZNcpAN0ATE/3nSv/gzkx3M7i6NGe9DAPSFOn7j2UG
         RmlpoBlfmY97fvsHjzLpB1c3KP4hebw0xX2+VMx5uFy5aCa44xtKd9aRiGJzhTa+Lhyl
         lj2VMEeWRUHh8VRPxquB8ac1dhtjLJC5guFcmQW4YIJ1mUHr8+YgoQj4yHkVTdUhUV5l
         V9tQ==
X-Gm-Message-State: AOAM530DGkfF1renaO700zl0FW+uxzyUyNvwR+GjJWR90X2GgmBh9wmI
	nRuVKkmtNPB2CJ5+u/8eGzuReqxZUtvWPicbCwY=
X-Google-Smtp-Source: 
 ABdhPJypIRh/REtdsH6cAFEeuDOVuEsXO97L65vkMuHxgIFYG638EA4tEoOUHayralJ0an5yuaDVqQ==
X-Received: by 2002:a63:6a82:: with SMTP id
 f124mr4104001pgc.515.1642084651054;
        Thu, 13 Jan 2022 06:37:31 -0800 (PST)
Received: from hexa.router0800d9.com (rrcs-66-91-142-162.west.biz.rr.com.
 [66.91.142.162])
        by smtp.gmail.com with ESMTPSA id
 g11sm2541544pgn.26.2022.01.13.06.37.29
        for <openembedded-core@lists.openembedded.org>
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 13 Jan 2022 06:37:30 -0800 (PST)
From: Steve Sakoman <steve@sakoman.com>
To: openembedded-core@lists.openembedded.org
Subject: [OE-core][dunfell 00/11] Patch review
Date: Thu, 13 Jan 2022 04:37:04 -1000
Message-Id: <cover.1642083419.git.steve@sakoman.com>
X-Mailer: git-send-email 2.25.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Thu, 13 Jan 2022 14:37:32 -0000
X-Groupsio-URL: 
 https://lists.openembedded.org/g/openembedded-core/message/160511

Please review this set of patches for dunfell and have comments back by end
of day Monday.

Passed a-full on autobuilder:

https://autobuilder.yoctoproject.org/typhoon/#/builders/83/builds/3112

The following changes since commit da3bd5e0934b6462ae53225a58305235849b32d5:

  asciidoc: properly detect and compare Python versions >= 3.10 (2022-01-09 06:49:29 -1000)

are available in the Git repository at:

  git://git.openembedded.org/openembedded-core-contrib stable/dunfell-nut
  http://cgit.openembedded.org/openembedded-core-contrib/log/?h=stable/dunfell-nut

Akash Hadke (1):
  glibc: Add fix for data races in pthread_create and TLS access

Alexander Kanavin (1):
  parselogs: add a couple systemd false positives

Anuj Mittal (1):
  xserver-xorg: update CVE_PRODUCT

Konrad Weihmann (1):
  cve-check: add lockfile to task

Mingli Yu (1):
  wic: use shutil.which

Ricardo Ribalda Delgado (1):
  wic: misc: Do not find for executables in ASSUME_PROVIDED

Richard Purdie (1):
  expat: Update HOMEPAGE to current url

Ross Burton (2):
  cve-update-db-native: use fetch task
  xserver-xorg: whitelist two CVEs

Steve Sakoman (2):
  valgrind: skip flakey ptest (gdbserver_tests/hginfo)
  oeqa/selftest/cases/tinfoil.py: increase timeout 60->120s
    test_wait_event

 meta/classes/cve-check.bbclass                |   3 +-
 meta/lib/oeqa/runtime/cases/parselogs.py      |   2 +
 meta/lib/oeqa/selftest/cases/tinfoil.py       |   4 +-
 meta/recipes-core/expat/expat_2.2.9.bb        |   2 +-
 ...ate-slotinfo-to-avoid-use-after-free.patch |  66 +++++
 ...hread_create-and-TLS-access-BZ-19329.patch | 191 ++++++++++++
 ...d-atomics-for-racy-accesses-BZ-19329.patch | 206 +++++++++++++
 .../0033-elf-Add-test-case-for-BZ-19329.patch | 144 +++++++++
 ...elf-Fix-DTV-gap-reuse-logic-BZ-27135.patch | 180 ++++++++++++
 ...-lazy-relocation-of-tlsdesc-BZ-27137.patch |  56 ++++
 ...-lazy-relocation-of-tlsdesc-BZ-27137.patch | 124 ++++++++
 ...ock-between-pthread_create-and-ctors.patch | 276 ++++++++++++++++++
 meta/recipes-core/glibc/glibc_2.31.bb         |   8 +
 .../recipes-core/meta/cve-update-db-native.bb |   9 +-
 .../valgrind/valgrind/remove-for-aarch64      |   1 +
 .../valgrind/valgrind/remove-for-all          |   1 +
 .../xorg-xserver/xserver-xorg.inc             |  10 +-
 scripts/lib/wic/engine.py                     |   6 +-
 scripts/lib/wic/misc.py                       |  16 +-
 scripts/wic                                   |   4 +-
 20 files changed, 1292 insertions(+), 17 deletions(-)
 create mode 100644 meta/recipes-core/glibc/glibc/0030-elf-Refactor_dl_update-slotinfo-to-avoid-use-after-free.patch
 create mode 100644 meta/recipes-core/glibc/glibc/0031-elf-Fix-data-races-in-pthread_create-and-TLS-access-BZ-19329.patch
 create mode 100644 meta/recipes-core/glibc/glibc/0032-elf-Use-relaxed-atomics-for-racy-accesses-BZ-19329.patch
 create mode 100644 meta/recipes-core/glibc/glibc/0033-elf-Add-test-case-for-BZ-19329.patch
 create mode 100644 meta/recipes-core/glibc/glibc/0034-elf-Fix-DTV-gap-reuse-logic-BZ-27135.patch
 create mode 100644 meta/recipes-core/glibc/glibc/0035-x86_64-Avoid-lazy-relocation-of-tlsdesc-BZ-27137.patch
 create mode 100644 meta/recipes-core/glibc/glibc/0036-i386-Avoid-lazy-relocation-of-tlsdesc-BZ-27137.patch
 create mode 100644 meta/recipes-core/glibc/glibc/0037-Avoid-deadlock-between-pthread_create-and-ctors.patch

-- 
2.25.1


