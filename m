Return-Path: <steve@sakoman.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 14B92C6FD1C
	for <webhook@archiver.kernel.org>; Wed, 22 Mar 2023 14:11:34 +0000 (UTC)
Received: from mail-pl1-f174.google.com (mail-pl1-f174.google.com [209.85.214.174])
 by mx.groups.io with SMTP id smtpd.web11.43730.1679494284882152215
 for <openembedded-core@lists.openembedded.org>;
 Wed, 22 Mar 2023 07:11:25 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@sakoman-com.20210112.gappssmtp.com header.s=20210112 header.b=S7kKUTGp;
 spf=softfail (domain: sakoman.com, ip: 209.85.214.174, mailfrom: steve@sakoman.com)
Received: by mail-pl1-f174.google.com with SMTP id o2so11980249plg.4
        for <openembedded-core@lists.openembedded.org>; Wed, 22 Mar 2023 07:11:24 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=sakoman-com.20210112.gappssmtp.com; s=20210112; t=1679494284;
        h=content-transfer-encoding:mime-version:message-id:date:subject:to
         :from:from:to:cc:subject:date:message-id:reply-to;
        bh=Ktz2box5uLQ45M3F89VUtuwcbrX9Zy4uxy41E9gnNvU=;
        b=S7kKUTGpM7zcpboqMD78EvIt2wwIt1A2poMtk/lIgFlIcCWC8dLbZ1C7UVhrY8qTDw
         K1LC7VadZFdkcCkXAr8nGux4exvnvXV1/r1CFSQBgXckkBb5pTVfp4YsWXHzUL+6CPcs
         GyyXOlY/pN7vyB+TeE9cxP7JFxEEjP4ozer8pg+Qwtkorp/SCGwYSeBLnn3v8rduXoDE
         0NAnqV3nHG2of/hHRGS55G5vmc64g0AHSbRM7vpNuX4pF+XeelogP3JNCSkU/gZTTUAF
         rATxXUjw9BpO3PSN0ziEHCFX2OYhYOrhWMc000SMTsvn0NXvGWc6UvFo3GZzBdY+Kx82
         aCVw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112; t=1679494284;
        h=content-transfer-encoding:mime-version:message-id:date:subject:to
         :from:x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=Ktz2box5uLQ45M3F89VUtuwcbrX9Zy4uxy41E9gnNvU=;
        b=lGwJV+mpl290VBsFzXX7w+hquh0sIRBt+w7vJZ3Ln6gfuA2tfRjT0QSayfI8tbyFwO
         bkNr65nnbC3aNQxGNtYz9FZglpo8P5nE7+L5ID4IbtDh8RGeTCe2RVx9DKkUP+zu2pT6
         0c3u3VsgxQ5rKAOJkMKJqReEOKV6kkkWqgdbRe8vSRRXxBQp33W8hiYCdZLYztcuA8bl
         m6p6N4MKAng7RgzNP8U8Z2fCTooZEOUcGc/SiJ3RC+SuZfwezuoUex+3RSCCl/N4Kg41
         2sBM/OQheAsT04OlVJ+ELXQtgtJmNGc+6dOP9QYiHiQak+YlycFmvX/oKbYfq2guCSmp
         jPKA==
X-Gm-Message-State: AO0yUKV5J6BiZOSseJI6HsvooosA2Q0dpT5n1+uX3eIGsW9VTRuNrqmH
	bTM0LPzp2H93K/n70qwjkOvXxg5sLrfSBhJOoKQ=
X-Google-Smtp-Source: AK7set/6Xdv9/vm4vBMuZ6q5gPzpRf9PkEfmSmnWX8R334DKd776W8IlrK7B0sMOLFtL/PJwqCb3lQ==
X-Received: by 2002:a17:902:d0d1:b0:1a1:bd50:a9e with SMTP id n17-20020a170902d0d100b001a1bd500a9emr2454756pln.47.1679494283606;
        Wed, 22 Mar 2023 07:11:23 -0700 (PDT)
Received: from hexa.router0800d9.com (dhcp-72-253-4-112.hawaiiantel.net. [72.253.4.112])
        by smtp.gmail.com with ESMTPSA id je19-20020a170903265300b0019f3e339fb4sm10646536plb.187.2023.03.22.07.11.22
        for <openembedded-core@lists.openembedded.org>
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 22 Mar 2023 07:11:23 -0700 (PDT)
From: Steve Sakoman <steve@sakoman.com>
To: openembedded-core@lists.openembedded.org
Subject: [OE-core][kirkstone 00/21] Pull request (cover letter only)
Date: Wed, 22 Mar 2023 04:11:16 -1000
Message-Id: <cover.1679494167.git.steve@sakoman.com>
X-Mailer: git-send-email 2.34.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Wed, 22 Mar 2023 14:11:34 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/178924

The following changes since commit 8b41b5d2e423636942e34723ad940f6f143640c9:

  vala: Fix install conflict when enable multilib. (2023-03-14 05:40:43 -1000)

are available in the Git repository at:

  https://git.openembedded.org/openembedded-core-contrib stable/kirkstone-next
  http://cgit.openembedded.org/openembedded-core-contrib/log/?h=stable/kirkstone-next

Hongxu Jia (1):
  pkgconf: fix CVE-2023-24056

Joe Slater (1):
  python3: fix CVE-2023-24329

Kai Kang (1):
  python3-git: fix indent error

Kenfe-Mickael Laventure (3):
  buildtools-tarball: Handle spaces within user $PATH
  toolchain-scripts: Handle spaces within user $PATH
  populate_sdk_ext: Handle spaces within user $PATH

Michael Halstead (1):
  selftest/runtime_test/virgl: Disable for all Rocky Linux

Mingli Yu (3):
  mdadm: Fix testcase 06wrmostly
  mdadm: fix tests/02lineargrow
  mdadm: Fix raid0 tests

Richard Purdie (5):
  staging: Separate out different multiconfig manifests
  staging/multilib: Fix manifest corruption
  glibc: Add missing binutils dependency
  selftest/recipetool: Stop test corrupting tinfoil class
  base-files: Drop localhost.localdomain from hosts file

Ross Burton (2):
  vim: upgrade to 9.0.1403
  vim: set modified-by to the recipe MAINTAINER

Trevor Woerner (3):
  cups: use BUILDROOT instead of DESTDIR
  cups: check PACKAGECONFIG for pam feature
  cups: add/fix web interface packaging

Wang Mingyu (1):
  dhcpcd: Fix install conflict when enable multilib.

 meta/classes/multilib.bbclass                 |   1 +
 meta/classes/populate_sdk_ext.bbclass         |   2 +-
 meta/classes/staging.bbclass                  |   4 +
 meta/classes/toolchain-scripts.bbclass        |   2 +-
 meta/lib/oeqa/selftest/cases/recipetool.py    |   5 +-
 meta/lib/oeqa/selftest/cases/runtime_test.py  |   3 +-
 .../dhcpcd/dhcpcd_9.4.1.bb                    |   1 +
 ...-conflict-error-when-enable-multilib.patch |  46 ++++++++
 meta/recipes-core/base-files/base-files/hosts |   2 +-
 meta/recipes-core/glibc/glibc.inc             |   4 +-
 meta/recipes-core/meta/buildtools-tarball.bb  |   2 +-
 ...nd-stop-string-processing-on-truncat.patch |  75 +++++++++++++
 .../recipes-devtools/pkgconf/pkgconf_1.8.0.bb |   1 +
 ...-git-CVE-2022-24439-fix-from-PR-1521.patch |   2 +-
 .../python/python3/cve-2023-24329.patch       |  50 +++++++++
 .../recipes-devtools/python/python3_3.10.9.bb |   1 +
 meta/recipes-extended/cups/cups.inc           |  16 ++-
 ...-Fix-optional-write-behind-parameter.patch |  45 ++++++++
 ...d-a-test-that-validates-raid0-with-l.patch |  41 +++++++
 ...-Run-udevadm-settle-before-setting-r.patch |  39 +++++++
 ...ow-clear-the-superblock-at-every-ite.patch |  33 ++++++
 ...metadata-avoid-passing-chunk-size-to.patch |  41 +++++++
 ...ts-fix-raid0-tests-for-0.90-metadata.patch | 102 ++++++++++++++++++
 meta/recipes-extended/mdadm/mdadm_4.2.bb      |   6 ++
 meta/recipes-support/vim/vim.inc              |   8 +-
 25 files changed, 511 insertions(+), 21 deletions(-)
 create mode 100644 meta/recipes-connectivity/dhcpcd/files/0001-dhcpcd.8-Fix-conflict-error-when-enable-multilib.patch
 create mode 100644 meta/recipes-devtools/pkgconf/pkgconf/0001-tuple-test-for-and-stop-string-processing-on-truncat.patch
 create mode 100644 meta/recipes-devtools/python/python3/cve-2023-24329.patch
 create mode 100644 meta/recipes-extended/mdadm/files/0001-mdadm-Fix-optional-write-behind-parameter.patch
 create mode 100644 meta/recipes-extended/mdadm/files/0001-tests-00raid0-add-a-test-that-validates-raid0-with-l.patch
 create mode 100644 meta/recipes-extended/mdadm/files/0001-tests-00readonly-Run-udevadm-settle-before-setting-r.patch
 create mode 100644 meta/recipes-extended/mdadm/files/0001-tests-02lineargrow-clear-the-superblock-at-every-ite.patch
 create mode 100644 meta/recipes-extended/mdadm/files/0001-tests-04update-metadata-avoid-passing-chunk-size-to.patch
 create mode 100644 meta/recipes-extended/mdadm/files/0001-tests-fix-raid0-tests-for-0.90-metadata.patch

-- 
2.34.1


