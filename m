Return-Path: <steve@sakoman.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id E0101C433EF
	for <webhook@archiver.kernel.org>; Tue, 18 Jan 2022 22:23:45 +0000 (UTC)
Received: from mail-pl1-f180.google.com (mail-pl1-f180.google.com
 [209.85.214.180])
 by mx.groups.io with SMTP id smtpd.web10.1456.1642544624736768827
 for <openembedded-core@lists.openembedded.org>;
 Tue, 18 Jan 2022 14:23:45 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@sakoman-com.20210112.gappssmtp.com header.s=20210112
 header.b=OuZbPHWO;
 spf=softfail (domain: sakoman.com, ip: 209.85.214.180,
 mailfrom: steve@sakoman.com)
Received: by mail-pl1-f180.google.com with SMTP id t18so256663plg.9
        for <openembedded-core@lists.openembedded.org>;
 Tue, 18 Jan 2022 14:23:44 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=sakoman-com.20210112.gappssmtp.com; s=20210112;
        h=from:to:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=h6aDqrwJJuBAU7GTNW7kTyE8cgWEhbVxq4SvgYPBJVU=;
        b=OuZbPHWOT6Dl8Lh+aEf0C5PfXUHA+QIwaBm/IWeZ884qLuEYStrX1jjiNF++KByIYe
         uaLJya8qv9oJbIIVpJyT5UrCpKS+Y6qF7LRRsyuPS9PHOwa6YdSDrZQKIZhEQA2BYoG6
         gLdQbf/G+x4VGFS3HtLRYqhOaTGXdH2O14wWHN+3EjVCubQzxin11J4KwElDGVhMlgn7
         Sozr0p1tQGf2snjY+U/RaqJ0w+F0b/02bVgNWw1qoVUgOP6t59/RgwT0cEMHn86fpVyO
         F73egBNMZBRfcFUJeMqIApbJVZp+xQlkSiYlIuZ8d2PbkWAl/pdM31r6ExvRam74YHsL
         hMUQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:from:to:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=h6aDqrwJJuBAU7GTNW7kTyE8cgWEhbVxq4SvgYPBJVU=;
        b=qChTExcXUxy7KF8wQQmgUuDGQi5tuZlF4rUnwtZc/x8o4HmsAGsDmeryrb3qKOqECk
         NeTuSQ+IlOcVPTS8WE6Ddw662g44B1FqBhfkZIQs1h38wFwmGit/FAbhQwtZoMf06aKU
         eGaxMjY5cl+8meLZKHTsXPQqUggIdOUB1MCLr6N1beapPbWlTyY+60RnZk9Vw+cj50bk
         u3ZQExHqaJQXpiHnCntFI/THM7ZUb+xsZx4BY27rcfhzbfrVMA4+ftZGfaOuumwpG3EV
         FzgzJep3Id5ds58W0nIRgmLM+32pB3aCsC2++Ik5kFWuJXfKjRpY1i/FaFSIoLGNHqBM
         BpAw==
X-Gm-Message-State: AOAM530lUyGaOj7mLG7xlqXWPPW12McZQSBE7yw6UH0eJs1DzcFGfwIc
	EIcGzGEQ+hrcCv7JsbAV76sK2kicPwUzENdUZnk=
X-Google-Smtp-Source: 
 ABdhPJy5EefUI4uiBJ1urQKpcByIckUbeBpoPv8m69cIBrWnQJKhlGm4ju5jeBAC83Os7h1bAeZEJA==
X-Received: by 2002:a17:90a:6282:: with SMTP id
 d2mr815167pjj.74.1642544623419;
        Tue, 18 Jan 2022 14:23:43 -0800 (PST)
Received: from hexa.router0800d9.com (rrcs-66-91-142-162.west.biz.rr.com.
 [66.91.142.162])
        by smtp.gmail.com with ESMTPSA id
 b4sm18805854pfl.101.2022.01.18.14.23.41
        for <openembedded-core@lists.openembedded.org>
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 18 Jan 2022 14:23:42 -0800 (PST)
From: Steve Sakoman <steve@sakoman.com>
To: openembedded-core@lists.openembedded.org
Subject: [OE-core][dunfell 00/11] Pull request (cover letter only)
Date: Tue, 18 Jan 2022 12:23:32 -1000
Message-Id: <cover.1642544535.git.steve@sakoman.com>
X-Mailer: git-send-email 2.25.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Tue, 18 Jan 2022 22:23:45 -0000
X-Groupsio-URL: 
 https://lists.openembedded.org/g/openembedded-core/message/160682

The following changes since commit da3bd5e0934b6462ae53225a58305235849b32d5:

  asciidoc: properly detect and compare Python versions >= 3.10 (2022-01-09 06:49:29 -1000)

are available in the Git repository at:

  git://git.openembedded.org/openembedded-core-contrib stable/dunfell-next
  http://cgit.openembedded.org/openembedded-core-contrib/log/?h=stable/dunfell-next

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


