Return-Path: <steve@sakoman.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 77FCCC77B60
	for <webhook@archiver.kernel.org>; Tue, 21 Mar 2023 14:23:57 +0000 (UTC)
Received: from mail-pj1-f46.google.com (mail-pj1-f46.google.com [209.85.216.46])
 by mx.groups.io with SMTP id smtpd.web10.14791.1679408634104442163
 for <openembedded-core@lists.openembedded.org>;
 Tue, 21 Mar 2023 07:23:54 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@sakoman-com.20210112.gappssmtp.com header.s=20210112 header.b=vVRvOGtf;
 spf=softfail (domain: sakoman.com, ip: 209.85.216.46, mailfrom: steve@sakoman.com)
Received: by mail-pj1-f46.google.com with SMTP id fy10-20020a17090b020a00b0023b4bcf0727so16105294pjb.0
        for <openembedded-core@lists.openembedded.org>; Tue, 21 Mar 2023 07:23:54 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=sakoman-com.20210112.gappssmtp.com; s=20210112; t=1679408633;
        h=content-transfer-encoding:mime-version:message-id:date:subject:to
         :from:from:to:cc:subject:date:message-id:reply-to;
        bh=LRGFatB2eoUXI02UdsU1wwt8otwIy8tYjc1OFnIucsQ=;
        b=vVRvOGtfXA8WqnNjpZJwvoQET5YZNXpN+jCWGLDTsyAvhWHrnWKSJbZEbcRt+u+sZF
         g4KTbhTlk71qkpuodLqfbyXJ1RBNzspot4GHQ1tMg8gIACGyZDT4KINlVojgttlQE8cK
         16cSx0QuLAcKrKfMyHh+FnH61BYNW54EwCDZ491LZnWPCdVJGfTGxuWVZtnGp95LUb/q
         xj2Df58ZTrqYEQ2Q8gaVXORrg9NCiXb+vw7pchhtBCduLz9DhpYWk53ZTgXPglZ9hW5E
         fD8pFSr+2DrYrY44k3q9XG/aHJBeaH7h5zbaOf8vteN6oJni0ZXOcIocHGCKkeY60xvf
         X6Rg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112; t=1679408633;
        h=content-transfer-encoding:mime-version:message-id:date:subject:to
         :from:x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=LRGFatB2eoUXI02UdsU1wwt8otwIy8tYjc1OFnIucsQ=;
        b=z1namnqnUam/wJ3EZpX5QMEzSwrlfC1e4RNEB7fIQesFEZCENhC8QbjAdyT5DZD7/x
         1b03pDqKm8aoMKcXXeAGb3JpPmZzBwtxoe5K3KsedAL2zYuIjrHsjUnCqdhP55XB+Nlv
         hMYYCKJalUPoLn0H4h6MBnBHJu5q0uoo5299gLIpfqFy/k7uCkElZUpeXb09Lw6MlnX3
         fnH0nELrqfmkh4HtC5+noMvL2hIOhIqAegdVcrc/iWFVPZ6jj45qWYVRaSzM0qTWM2wM
         i2cnLYTqbuZfeSQAiarKuv0CutcWh4Ov3ClkXWpLGmgC4fmjOU5Te0mx3aheJWgaVokJ
         bpSA==
X-Gm-Message-State: AO0yUKXIycjEYbUP7bgVqG/lJDAJkNYZem/EFPuPjEHH2Ru5s3Cc0hnN
	EiIw0OGRxDQi+0n7g1WEpIhI6+Dv+FGItCoaOwI=
X-Google-Smtp-Source: AK7set83AWG+czGBUaLt6onyrsdc8rVTiKBSHSIo5fQjBSX4uqOPNKdR7zHKF7xpGKAwYqVHju95Wg==
X-Received: by 2002:a17:90b:38c7:b0:237:b702:499f with SMTP id nn7-20020a17090b38c700b00237b702499fmr3091632pjb.22.1679408633144;
        Tue, 21 Mar 2023 07:23:53 -0700 (PDT)
Received: from hexa.router0800d9.com (dhcp-72-253-4-112.hawaiiantel.net. [72.253.4.112])
        by smtp.gmail.com with ESMTPSA id ds17-20020a17090b08d100b00230ffcb2e24sm11631345pjb.13.2023.03.21.07.23.52
        for <openembedded-core@lists.openembedded.org>
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 21 Mar 2023 07:23:52 -0700 (PDT)
From: Steve Sakoman <steve@sakoman.com>
To: openembedded-core@lists.openembedded.org
Subject: [OE-core][langdale 00/23] Pull request (cover letter only)
Date: Tue, 21 Mar 2023 04:23:48 -1000
Message-Id: <cover.1679408574.git.steve@sakoman.com>
X-Mailer: git-send-email 2.34.1
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Tue, 21 Mar 2023 14:23:57 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/178886

The following changes since commit 21e8a662e6232e7fdd642b1d86d4f8f980be1a09:

  vala: Fix install conflict when enable multilib. (2023-03-10 05:54:34 -1000)

are available in the Git repository at:

  https://git.openembedded.org/openembedded-core-contrib stable/langdale-next
  http://cgit.openembedded.org/openembedded-core-contrib/log/?h=stable/langdale-next

Alexander Kanavin (4):
  sudo: update 1.9.12p2 -> 1.9.13p2
  libdnf: update 0.69.0 -> 0.70.0
  pango: upgrade 1.50.12 -> 1.50.13
  apt: re-enable version check

Kenfe-Mickael Laventure (3):
  buildtools-tarball: Handle spaces within user $PATH
  toolchain-scripts: Handle spaces within user $PATH
  populate_sdk_ext: Handle spaces within user $PATH

Michael Halstead (1):
  selftest/runtime_test/virgl: Disable for all Rocky Linux

Richard Purdie (5):
  staging: Separate out different multiconfig manifests
  staging/multilib: Fix manifest corruption
  glibc: Add missing binutils dependency
  selftest/recipetool: Stop test corrupting tinfoil class
  base-files: Drop localhost.localdomain from hosts file

Ross Burton (3):
  vim: upgrade to 9.0.1403
  vim: set modified-by to the recipe MAINTAINER
  meson: remove obsolete RPATH stripping patch

Siddharth (1):
  harfbuzz: Security fix for CVE-2023-25193

Trevor Woerner (3):
  cups: use BUILDROOT instead of DESTDIR
  cups: check PACKAGECONFIG for pam feature
  cups: add/fix web interface packaging

Wang Mingyu (1):
  dhcpcd: Fix install conflict when enable multilib.

Xiangyu Chen (1):
  sudo: update 1.9.13p2 -> 1.9.13p3

Zoltan Boszormenyi (1):
  piglit: Fix build time dependency

 meta/classes-global/staging.bbclass           |   4 +
 meta/classes-recipe/populate_sdk_ext.bbclass  |   2 +-
 meta/classes-recipe/toolchain-scripts.bbclass |   2 +-
 meta/classes/multilib.bbclass                 |   1 +
 meta/lib/oeqa/selftest/cases/recipetool.py    |   5 +-
 meta/lib/oeqa/selftest/cases/runtime_test.py  |   3 +-
 .../dhcpcd/dhcpcd_9.4.1.bb                    |   1 +
 ...-conflict-error-when-enable-multilib.patch |  46 +++++
 meta/recipes-core/base-files/base-files/hosts |   2 +-
 meta/recipes-core/glibc/glibc.inc             |   4 +-
 meta/recipes-core/meta/buildtools-tarball.bb  |   2 +-
 meta/recipes-devtools/apt/apt_2.4.5.bb        |   2 -
 ...xt.cpp-do-not-try-to-access-BDB-data.patch |  37 ----
 .../{libdnf_0.69.0.bb => libdnf_0.70.0.bb}    |   3 +-
 .../meson/meson/disable-rpath-handling.patch  |  37 ----
 meta/recipes-devtools/meson/meson_0.63.3.bb   |   1 -
 meta/recipes-extended/cups/cups.inc           |  16 +-
 ...o.conf.in-fix-conflict-with-multilib.patch |  21 +-
 meta/recipes-extended/sudo/sudo.inc           |   2 +-
 .../{sudo_1.9.12p2.bb => sudo_1.9.13p3.bb}    |   2 +-
 .../harfbuzz/CVE-2023-25193-pre1.patch        | 135 ++++++++++++
 .../harfbuzz/harfbuzz/CVE-2023-25193.patch    | 192 ++++++++++++++++++
 .../harfbuzz/harfbuzz_5.1.0.bb                |   2 +
 .../{pango_1.50.12.bb => pango_1.50.13.bb}    |   2 +-
 meta/recipes-graphics/piglit/piglit_git.bb    |   2 +-
 meta/recipes-support/vim/vim.inc              |   8 +-
 26 files changed, 421 insertions(+), 113 deletions(-)
 create mode 100644 meta/recipes-connectivity/dhcpcd/files/0001-dhcpcd.8-Fix-conflict-error-when-enable-multilib.patch
 delete mode 100644 meta/recipes-devtools/libdnf/libdnf/0001-libdnf-dnf-context.cpp-do-not-try-to-access-BDB-data.patch
 rename meta/recipes-devtools/libdnf/{libdnf_0.69.0.bb => libdnf_0.70.0.bb} (93%)
 delete mode 100644 meta/recipes-devtools/meson/meson/disable-rpath-handling.patch
 rename meta/recipes-extended/sudo/{sudo_1.9.12p2.bb => sudo_1.9.13p3.bb} (96%)
 create mode 100644 meta/recipes-graphics/harfbuzz/harfbuzz/CVE-2023-25193-pre1.patch
 create mode 100644 meta/recipes-graphics/harfbuzz/harfbuzz/CVE-2023-25193.patch
 rename meta/recipes-graphics/pango/{pango_1.50.12.bb => pango_1.50.13.bb} (94%)

-- 
2.34.1


