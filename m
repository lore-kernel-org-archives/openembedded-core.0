Return-Path: <steve@sakoman.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 1DC10C433F5
	for <webhook@archiver.kernel.org>; Sun,  9 Jan 2022 22:04:31 +0000 (UTC)
Received: from mail-pl1-f182.google.com (mail-pl1-f182.google.com
 [209.85.214.182])
 by mx.groups.io with SMTP id smtpd.web11.23917.1641765869883727021
 for <openembedded-core@lists.openembedded.org>;
 Sun, 09 Jan 2022 14:04:30 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@sakoman-com.20210112.gappssmtp.com header.s=20210112
 header.b=LIhiTtDo;
 spf=softfail (domain: sakoman.com, ip: 209.85.214.182,
 mailfrom: steve@sakoman.com)
Received: by mail-pl1-f182.google.com with SMTP id h1so10405722pls.11
        for <openembedded-core@lists.openembedded.org>;
 Sun, 09 Jan 2022 14:04:29 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=sakoman-com.20210112.gappssmtp.com; s=20210112;
        h=from:to:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=aA5tMKHnwfUE/7Qp/T87SPnC6Pu8oEYPVal3YqU1rnQ=;
        b=LIhiTtDoXWOTZgpD2EJbXL3RCWvdYoQoyNWTSYjhCuBSde5Fup5i9ZRdSk/l6y6oqm
         P5rzgZrerd0FNXNUeN7szIt59KhgvEK+om+iwEmMXH4NwsfG1fFoEzzdgKaylNKX/lp2
         o47fHyAzS9EEixYiWcpa5g2VDyCJUVfnrZ4HtooKKR6rzocv8p7Q2u6qrnJekL4k5H14
         BDdlXDI8+y+iksZ8NN9UsLcbX3b0MdHtJHsoPqn0WxLGkg7auva11mQo6OwYrSeQKxmQ
         7WWtnxc4LUou4nsewhuV0m1H85Bc9AsrDDFqTwermrCIy1g4L1kqmrySauIjkqiGvKce
         8MxA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:from:to:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=aA5tMKHnwfUE/7Qp/T87SPnC6Pu8oEYPVal3YqU1rnQ=;
        b=hqUw6v0RvhM2cYautBzjZIN7iHkODfIisOSgqh2cVU91RL+V9lRPnZ4duQN8L2dLDw
         nuv7OfY+pUPBnI8x9ilomHtrunkvVn+AOfd1w4XJ8Ch7t9NgD2l4AFMpIKAgv42Wmnv+
         ABsQIzSfLpeNAVq00BaPmqbOs8jniyLSxmscK9O93yCiYy0Zrec+TOdoCrrSWyDbJyB6
         92/i3wmvsS25vkNOZcIHzEREeta+GqItXWw6XGRUnPY+eqTDreHS44ubRJ6Chw1isxEl
         U42KWHA19SauKLDt4MmeikrgirVU7h4j8LrLGTnHrNui9dFO1yu84twMuzDaA2jyH1uN
         PUVg==
X-Gm-Message-State: AOAM532vCBLkeUMEl3Uv6PJvdBFQV5mlS4iacEbuETzxX+dT0TeZcpAI
	lsgQsKyvcnwocv+O2XjDl30GQZFO3bRmZoyLwe0=
X-Google-Smtp-Source: 
 ABdhPJypT5FcYu3OEaawqpeNx2hN32go97Xy+YrscsmnbztaRBknNhbPRnZlToKfIMzHSCI9yBAEbA==
X-Received: by 2002:a17:90b:2249:: with SMTP id
 hk9mr26697560pjb.246.1641765868569;
        Sun, 09 Jan 2022 14:04:28 -0800 (PST)
Received: from hexa.router0800d9.com (rrcs-66-91-142-162.west.biz.rr.com.
 [66.91.142.162])
        by smtp.gmail.com with ESMTPSA id
 k10sm4426150pfi.52.2022.01.09.14.04.27
        for <openembedded-core@lists.openembedded.org>
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 09 Jan 2022 14:04:27 -0800 (PST)
From: Steve Sakoman <steve@sakoman.com>
To: openembedded-core@lists.openembedded.org
Subject: [OE-core][dunfell 00/12] Patch review
Date: Sun,  9 Jan 2022 12:04:04 -1000
Message-Id: <cover.1641765639.git.steve@sakoman.com>
X-Mailer: git-send-email 2.25.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Sun, 09 Jan 2022 22:04:31 -0000
X-Groupsio-URL: 
 https://lists.openembedded.org/g/openembedded-core/message/160291

Please review this set of patches for dunfell and have comments back by end
of day Tuesday.

Passed a-full on auto builder:

https://autobuilder.yoctoproject.org/typhoon/#/builders/83/builds/3096

with the exception of a known intermmitent autobuilder issue on oe-selftest-fedora,
which passed on subsequent retest:

https://autobuilder.yoctoproject.org/typhoon/#/builders/86/builds/3004

The following changes since commit 1ab7aee542589f6b6c76f8515b4230ce870a8678:

  selftest: skip virgl test on fedora 34 entirely (2021-12-23 06:21:37 -1000)

are available in the Git repository at:

  git://git.openembedded.org/openembedded-core-contrib stable/dunfell-nut
  http://cgit.openembedded.org/openembedded-core-contrib/log/?h=stable/dunfell-nut

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


