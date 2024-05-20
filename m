Return-Path: <steve@sakoman.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 15DBFC04FFE
	for <webhook@archiver.kernel.org>; Mon, 20 May 2024 13:33:46 +0000 (UTC)
Received: from mail-pf1-f169.google.com (mail-pf1-f169.google.com [209.85.210.169])
 by mx.groups.io with SMTP id smtpd.web10.60334.1716212018584902946
 for <openembedded-core@lists.openembedded.org>;
 Mon, 20 May 2024 06:33:38 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@sakoman-com.20230601.gappssmtp.com header.s=20230601 header.b=d9+z+3A2;
 spf=softfail (domain: sakoman.com, ip: 209.85.210.169, mailfrom: steve@sakoman.com)
Received: by mail-pf1-f169.google.com with SMTP id d2e1a72fcca58-6f5053dc057so1299731b3a.2
        for <openembedded-core@lists.openembedded.org>; Mon, 20 May 2024 06:33:38 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=sakoman-com.20230601.gappssmtp.com; s=20230601; t=1716212018; x=1716816818; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:to
         :from:from:to:cc:subject:date:message-id:reply-to;
        bh=gc4TbmIv2EWgvvaQI/tCA7heoAAOyFaBkU6xvInShNg=;
        b=d9+z+3A2DePIGdOcsWUFrlZVZyGCNIel4HpHYvQdmZuSY7wtNXegbs7jqS8wqvOq97
         6IX0sKrf3h52tC4LHL0a7EXeZcV1WQOQicNTXvfzZxTFYssbIHXpws+HxnaY7+4joFVI
         FjF7cRZ7UyPoAsKhg32q0TmIH5uYv3w5JWdL1ENc8pn8WgoftN8rzpp+CsWQY50axjf9
         0Y6FQ7H/gMCM+wBlGO9FbJlkFyaeTyoN80ru6S3PhcIp/LeIchwGBRldnH7JLMAl+efz
         2d3HqOjHzZCfdO0CWi/h87DaFbbvtOZOxP5+PRWj93EZN6/hc+prJdatvhq7TgqHV/oH
         5UVA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1716212018; x=1716816818;
        h=content-transfer-encoding:mime-version:message-id:date:subject:to
         :from:x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=gc4TbmIv2EWgvvaQI/tCA7heoAAOyFaBkU6xvInShNg=;
        b=nKmp76kVJkdSMiN7frnb9kTsompp8u8oF/tcq+hn6tcRJUtDUgXCwtngsNmFU2ppbe
         IBiPqJW+Jyb/8iqaMWPt4MQqYUUe3yVwfeShnw3AEzUMj9CACpX094ES8uwyypEaGSEx
         aImJxwxW2d7tJgWbJP/TqVkECcyToouO0ToUKCZJUEZ953c2KtCle+OAYW4jWSUZ66Tu
         JjQgihUxPes6z5alNYq5lKUGaDL0h4vxsn5TP/VxHgkXS5+p2xDROerM8Oc9KIrYsDAp
         Jl9ZnCdwuIBP1n61Tj7YpzJj4ou9IDIEC7cmM3BdgCBNGpE8bUAre9syqzGblcowfr51
         FgBg==
X-Gm-Message-State: AOJu0YxGe7kjEcx6dsdAY9OjZIP02igRxMhVas7neir/wYYqHMbncgfn
	EViUrhr5Po5bfBZHBhoR2roTx1vPeRQpS9vO4iDsYBSWUZgEjRWlhLrImvbOvW0+iHwcyr75D5k
	V
X-Google-Smtp-Source: AGHT+IEpV24JRmHSpqEZcSF2tUfC7aYtYZ3KpGL+HVMCRikq8jW4OYB84eU9fytLrqHEhkOgOQj4EA==
X-Received: by 2002:a05:6a00:4f8f:b0:6ea:d114:5ea1 with SMTP id d2e1a72fcca58-6f4e02cae54mr39267789b3a.17.1716212017615;
        Mon, 20 May 2024 06:33:37 -0700 (PDT)
Received: from hexa.. ([98.142.47.158])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-6f4d2a66621sm19671465b3a.13.2024.05.20.06.33.37
        for <openembedded-core@lists.openembedded.org>
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 20 May 2024 06:33:37 -0700 (PDT)
From: Steve Sakoman <steve@sakoman.com>
To: openembedded-core@lists.openembedded.org
Subject: [OE-core][scarthgap 00/21] Patch review
Date: Mon, 20 May 2024 06:33:11 -0700
Message-Id: <cover.1716211838.git.steve@sakoman.com>
X-Mailer: git-send-email 2.34.1
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Mon, 20 May 2024 13:33:46 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/199571

Please review this set of changes for scarthgap and have comments back by
end of day Wednesday, May 22

Passed a-full on autobuilder:

https://autobuilder.yoctoproject.org/typhoon/#/builders/83/builds/6937

The following changes since commit 294a7dbe44f6b7c8d3a1de8c2cc182af37c4f916:

  build-appliance-image: Update to scarthgap head revision (2024-05-09 04:47:57 -0700)

are available in the Git repository at:

  https://git.openembedded.org/openembedded-core-contrib stable/scarthgap-nut
  https://git.openembedded.org/openembedded-core-contrib/log/?h=stable/scarthgap-nut

Adriaan Schmidt (1):
  libcgroup_3.1.0: fix build on non-systemd systems

Jose Quaresma (2):
  go: Drop the linkmode completely
  Revert "goarch: disable dynamic linking globally"

Kai Kang (1):
  webkitgtk: 2.44.0 -> 2.44.1

Martin Hundebøll (1):
  classes: image_types: apply EXTRA_IMAGECMD:squashfs* in
    oe_mksquashfs()

Mingli Yu (1):
  ncurses: Fix CVE-2023-50495

Peter Marko (6):
  openssl: patch CVE-2024-4603
  glib-2.0: Upgrade 2.78.4 -> 2.78.5
  glib-2.0: Upgrade 2.78.5 -> 2.78.6
  glibc: Update to latest on stable 2.39 branch
  glibc: Update to latest on stable 2.39 branch
  glibc: correct license

Ralph Siemsen (1):
  uboot-sign: fix loop in do_uboot_assemble_fitimage

Ross Burton (3):
  lib/oe/package-manager: allow including self in create_packages_dir
  selftest/classes: add localpkgfeed class
  oeqa/selftest/debuginfod: use localpkgfeed to speed server startup

Sven Schwermer (2):
  recipetool: Handle unclean response in go resolver
  recipetool: Handle several go-import tags in go resolver

Trevor Gamblin (1):
  patchtest: test_metadata: fix invalid escape sequences

Wang Mingyu (1):
  llvm: upgrade 18.1.2 -> 18.1.3

Zev Weiss (1):
  bash: Fix file-substitution error-handling bug

 meta-selftest/classes/localpkgfeed.bbclass    |  27 ++
 meta/classes-recipe/go.bbclass                |   2 -
 meta/classes-recipe/goarch.bbclass            |  14 +-
 meta/classes-recipe/image_types.bbclass       |  20 +-
 meta/classes-recipe/uboot-sign.bbclass        |   2 +-
 meta/lib/oe/package_manager/__init__.py       |   9 +-
 meta/lib/oeqa/selftest/cases/debuginfod.py    |  14 +-
 meta/lib/patchtest/tests/test_metadata.py     |   4 +-
 .../openssl/openssl/CVE-2024-4603.patch       | 179 +++++++++++
 .../openssl/openssl_3.2.1.bb                  |   1 +
 .../glib-2.0/glib-2.0/fix-regex.patch         |  54 ----
 ...{glib-2.0_2.78.4.bb => glib-2.0_2.78.6.bb} |   3 +-
 meta/recipes-core/glibc/glibc-common.inc      |   2 +-
 meta/recipes-core/glibc/glibc-version.inc     |   2 +-
 ...y-the-header-between-arm-and-aarch64.patch |  47 ++-
 ...e-Pass-mcpu-along-with-march-to-dete.patch |  62 ----
 ...ss.patch => 0023-qemu-stale-process.patch} |   0
 meta/recipes-core/glibc/glibc_2.39.bb         |   7 +-
 ...akefile-install-systemd.h-by-default.patch |  37 +++
 .../recipes-core/libcgroup/libcgroup_3.1.0.bb |   1 +
 .../ncurses/files/CVE-2023-50495.patch        | 301 ++++++++++++++++++
 meta/recipes-core/ncurses/ncurses_6.4.bb      |   1 +
 meta/recipes-devtools/go/go-runtime.inc       |   2 +-
 ...r-sort-ClassInfo-lists-by-name-as-we.patch |   6 +-
 .../bash/bash/fix-filesubst-errexit.patch     |  34 ++
 meta/recipes-extended/bash/bash_5.2.21.bb     |   1 +
 ...af379dc70b4b1a63b01d67179eb431f03ac4.patch |  38 ---
 ...ebkitgtk_2.44.0.bb => webkitgtk_2.44.1.bb} |   3 +-
 scripts/lib/recipetool/create_go.py           |  34 +-
 29 files changed, 685 insertions(+), 222 deletions(-)
 create mode 100644 meta-selftest/classes/localpkgfeed.bbclass
 create mode 100644 meta/recipes-connectivity/openssl/openssl/CVE-2024-4603.patch
 delete mode 100644 meta/recipes-core/glib-2.0/glib-2.0/fix-regex.patch
 rename meta/recipes-core/glib-2.0/{glib-2.0_2.78.4.bb => glib-2.0_2.78.6.bb} (95%)
 delete mode 100644 meta/recipes-core/glibc/glibc/0023-aarch64-configure-Pass-mcpu-along-with-march-to-dete.patch
 rename meta/recipes-core/glibc/glibc/{0024-qemu-stale-process.patch => 0023-qemu-stale-process.patch} (100%)
 create mode 100644 meta/recipes-core/libcgroup/libcgroup/0001-include-Makefile-install-systemd.h-by-default.patch
 create mode 100644 meta/recipes-core/ncurses/files/CVE-2023-50495.patch
 create mode 100644 meta/recipes-extended/bash/bash/fix-filesubst-errexit.patch
 delete mode 100644 meta/recipes-sato/webkit/webkitgtk/2922af379dc70b4b1a63b01d67179eb431f03ac4.patch
 rename meta/recipes-sato/webkit/{webkitgtk_2.44.0.bb => webkitgtk_2.44.1.bb} (98%)

-- 
2.34.1


