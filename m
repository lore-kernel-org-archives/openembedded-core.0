Return-Path: <steve@sakoman.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 69648C433F5
	for <webhook@archiver.kernel.org>; Tue, 11 Jan 2022 22:18:55 +0000 (UTC)
Received: from mail-pj1-f41.google.com (mail-pj1-f41.google.com
 [209.85.216.41])
 by mx.groups.io with SMTP id smtpd.web12.15258.1641939534428807290
 for <openembedded-core@lists.openembedded.org>;
 Tue, 11 Jan 2022 14:18:54 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@sakoman-com.20210112.gappssmtp.com header.s=20210112
 header.b=6RDZnvCH;
 spf=softfail (domain: sakoman.com, ip: 209.85.216.41,
 mailfrom: steve@sakoman.com)
Received: by mail-pj1-f41.google.com with SMTP id pf13so1508667pjb.0
        for <openembedded-core@lists.openembedded.org>;
 Tue, 11 Jan 2022 14:18:54 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=sakoman-com.20210112.gappssmtp.com; s=20210112;
        h=from:to:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=zLOeSbtT4HQBxq/ImsPMynkMdhStafN0IdQ+iveau4c=;
        b=6RDZnvCHmkXbugj6oy8NJZs9KOXsWsTp6UKqBGJ7LTHTbbxRvvyLHj2/WOEE1Vwcyp
         mnS6Oj2CO1i3XMljAWob1dM3mDRKrNRm8ZD+BYnyExHtjqL9xKtZBmZqHQGyUZkD0Zj5
         2T/XrIFB2QXSLStsxZKpvhzi4Nc2MKJKKLrLD7bWqZ9cKnuLLhSVImuyvb145Zi4IPZz
         p+g1CgAb7SOXmcaHqQV9HNx8NYwDqYyIfUQKi0PtwVb8iuQdmIP4H3ctHwD97iCgbIHQ
         cSlVDrORaYQaVgWGahvw71vHJJ3tYoJwqmsDEpwPqqkZzQpl39lLJcYWesbWSLUdqr5T
         fc8w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:from:to:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=zLOeSbtT4HQBxq/ImsPMynkMdhStafN0IdQ+iveau4c=;
        b=izf7+E/4ZaBmrONHCEz3oH7vR7bSDQEkB7reSIQnOLWPyA/WQuWppygTdphfFkUR0t
         6tars+mu/DRy0yjyxu1Nwz51+IbDxxvfbJS30BZhdPZfWvCGfVvRKLKgLge9L+wXtjKu
         ZLaF2tm6LsGIYLJ7XWlCKePfw/cPRIJICkWBZjvPMRrHOgV5dllkax5wqBLyp5hgh9ev
         JGSfEKzQTJhnvuvakMEA1mlb6YHIZrDwJx7MMJ4FT+J+aCKPAoX8AmG95uPbMP2rlB84
         OUW+4W7O7l2heS/hHSYhKSizIEHuxTxe0Gl17dXQoPCgYNHItGXvrYAdR5FzMd11NAIl
         rc9Q==
X-Gm-Message-State: AOAM531Y29GUp4LpahIXOl2Mg4Q2HPPQjAIRbT4l8L5q1Ees8OlIkOyp
	a8LOe4pBhdUKF72ncZc+8YIbJWQntF0QU43M0/w=
X-Google-Smtp-Source: 
 ABdhPJydW1MIeMPEiPG2X5zLToiSHZtA4MtSFeC2S6bnahYmB0I9vbssC+AkOtS6Za7Q1805zYT5Zg==
X-Received: by 2002:a63:a744:: with SMTP id w4mr5889381pgo.142.1641939533284;
        Tue, 11 Jan 2022 14:18:53 -0800 (PST)
Received: from hexa.router0800d9.com (rrcs-66-91-142-162.west.biz.rr.com.
 [66.91.142.162])
        by smtp.gmail.com with ESMTPSA id e3sm320736pgl.59.2022.01.11.14.18.52
        for <openembedded-core@lists.openembedded.org>
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 11 Jan 2022 14:18:52 -0800 (PST)
From: Steve Sakoman <steve@sakoman.com>
To: openembedded-core@lists.openembedded.org
Subject: [OE-core][dunfell 00/12] Pull request (cover letter only)
Date: Tue, 11 Jan 2022 12:18:33 -1000
Message-Id: <cover.1641939388.git.steve@sakoman.com>
X-Mailer: git-send-email 2.25.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Tue, 11 Jan 2022 22:18:55 -0000
X-Groupsio-URL: 
 https://lists.openembedded.org/g/openembedded-core/message/160470

The following changes since commit 1ab7aee542589f6b6c76f8515b4230ce870a8678:

  selftest: skip virgl test on fedora 34 entirely (2021-12-23 06:21:37 -1000)

are available in the Git repository at:

  git://git.openembedded.org/openembedded-core-contrib stable/dunfell-next
  http://cgit.openembedded.org/openembedded-core-contrib/log/?h=stable/dunfell-next

Alexander Kanavin (1):
  lib/oe/reproducible: correctly set .git location when recursively
    looking for git repos

Marek Vasut (1):
  weston: Backport patches to always activate the top-level surface

Marta Rybczynska (1):
  grub: fix CVE-2020-14372 and CVE-2020-27779

Richard Purdie (4):
  openssl: Add reproducibility fix
  oeqa/selftest/bbtests: Use YP sources mirror instead of GNU
  oeqa/selftest/tinfoil: Update to use test command
  scripts: Update to use exec_module() instead of load_module()

Steve Sakoman (3):
  libpcre2: update SRC_URI
  selftest: skip virgl test on fedora 35
  asciidoc: properly detect and compare Python versions >= 3.10

Tim Orling (1):
  scripts/buildhistory-diff: drop use of distutils

wangmy (1):
  linux-firmware: upgrade 20211027 -> 20211216

 meta/lib/oe/reproducible.py                   |   2 +-
 meta/lib/oeqa/selftest/cases/bbtests.py       |   2 +-
 meta/lib/oeqa/selftest/cases/runtime_test.py  |   2 +
 meta/lib/oeqa/selftest/cases/tinfoil.py       |   6 +-
 .../grub/files/CVE-2020-14372.patch           |  76 +++
 .../grub/files/CVE-2020-14372_1.patch         | 130 ++++++
 .../grub/files/CVE-2020-14372_2.patch         | 431 ++++++++++++++++++
 .../grub/files/CVE-2020-14372_3.patch         |  57 +++
 .../grub/files/CVE-2020-14372_4.patch         |  52 +++
 .../grub/files/CVE-2020-14372_5.patch         | 158 +++++++
 .../grub/files/CVE-2020-27779.patch           |  70 +++
 .../grub/files/CVE-2020-27779_2.patch         | 105 +++++
 .../grub/files/CVE-2020-27779_3.patch         |  37 ++
 .../grub/files/CVE-2020-27779_4.patch         |  35 ++
 .../grub/files/CVE-2020-27779_5.patch         |  62 +++
 .../grub/files/CVE-2020-27779_6.patch         |  61 +++
 .../grub/files/CVE-2020-27779_7.patch         |  65 +++
 .../grub/files/no-insmod-on-sb.patch          | 107 +++++
 meta/recipes-bsp/grub/grub2.inc               |  14 +
 .../openssl/openssl/reproducibility.patch     |  22 +
 .../openssl/openssl_1.1.1l.bb                 |   1 +
 .../asciidoc/detect-python-version.patch      |  42 ++
 .../asciidoc/asciidoc_8.6.9.bb                |   3 +-
 ...move-no-op-de-activation-of-the-xdg-.patch |  32 ++
 ...name-gain-lose-keyboard-focus-to-act.patch |  57 +++
 ...bed-keyboard-focus-handle-code-when-.patch |  99 ++++
 meta/recipes-graphics/wayland/weston_8.0.0.bb |   3 +
 ...20211027.bb => linux-firmware_20211216.bb} |   4 +-
 .../recipes-support/libpcre/libpcre2_10.34.bb |   2 +-
 scripts/buildhistory-diff                     |   5 -
 scripts/lib/scriptutils.py                    |   7 +-
 scripts/lib/wic/pluginbase.py                 |   8 +-
 32 files changed, 1739 insertions(+), 18 deletions(-)
 create mode 100644 meta/recipes-bsp/grub/files/CVE-2020-14372.patch
 create mode 100644 meta/recipes-bsp/grub/files/CVE-2020-14372_1.patch
 create mode 100644 meta/recipes-bsp/grub/files/CVE-2020-14372_2.patch
 create mode 100644 meta/recipes-bsp/grub/files/CVE-2020-14372_3.patch
 create mode 100644 meta/recipes-bsp/grub/files/CVE-2020-14372_4.patch
 create mode 100644 meta/recipes-bsp/grub/files/CVE-2020-14372_5.patch
 create mode 100644 meta/recipes-bsp/grub/files/CVE-2020-27779.patch
 create mode 100644 meta/recipes-bsp/grub/files/CVE-2020-27779_2.patch
 create mode 100644 meta/recipes-bsp/grub/files/CVE-2020-27779_3.patch
 create mode 100644 meta/recipes-bsp/grub/files/CVE-2020-27779_4.patch
 create mode 100644 meta/recipes-bsp/grub/files/CVE-2020-27779_5.patch
 create mode 100644 meta/recipes-bsp/grub/files/CVE-2020-27779_6.patch
 create mode 100644 meta/recipes-bsp/grub/files/CVE-2020-27779_7.patch
 create mode 100644 meta/recipes-bsp/grub/files/no-insmod-on-sb.patch
 create mode 100644 meta/recipes-connectivity/openssl/openssl/reproducibility.patch
 create mode 100644 meta/recipes-extended/asciidoc/asciidoc/detect-python-version.patch
 create mode 100644 meta/recipes-graphics/wayland/weston/0002-desktop-shell-Remove-no-op-de-activation-of-the-xdg-.patch
 create mode 100644 meta/recipes-graphics/wayland/weston/0003-desktop-shell-Rename-gain-lose-keyboard-focus-to-act.patch
 create mode 100644 meta/recipes-graphics/wayland/weston/0004-desktop-shell-Embed-keyboard-focus-handle-code-when-.patch
 rename meta/recipes-kernel/linux-firmware/{linux-firmware_20211027.bb => linux-firmware_20211216.bb} (99%)

-- 
2.25.1


