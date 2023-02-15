Return-Path: <steve@sakoman.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 7AFB3C636CC
	for <webhook@archiver.kernel.org>; Wed, 15 Feb 2023 13:59:38 +0000 (UTC)
Received: from mail-pj1-f52.google.com (mail-pj1-f52.google.com [209.85.216.52])
 by mx.groups.io with SMTP id smtpd.web11.15476.1676469570759050635
 for <openembedded-core@lists.openembedded.org>;
 Wed, 15 Feb 2023 05:59:31 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@sakoman-com.20210112.gappssmtp.com header.s=20210112 header.b=Rj8hbj8q;
 spf=softfail (domain: sakoman.com, ip: 209.85.216.52, mailfrom: steve@sakoman.com)
Received: by mail-pj1-f52.google.com with SMTP id d13-20020a17090ad3cd00b0023127b2d602so1971007pjw.2
        for <openembedded-core@lists.openembedded.org>; Wed, 15 Feb 2023 05:59:30 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=sakoman-com.20210112.gappssmtp.com; s=20210112;
        h=content-transfer-encoding:mime-version:message-id:date:subject:to
         :from:from:to:cc:subject:date:message-id:reply-to;
        bh=amTExPQkIW8kFU3BFOvsvOcCsPhmz/MxkFkmRrPtaZ0=;
        b=Rj8hbj8qNbGH6Y1N+h1Pbb6Czsq9++xFA6q0lRZYrYswPjXQ0dvToSG2CF7mz/UAmd
         S8FqJvwzhFWRSgvAiCba7g0cefJJePT5UO7izAIGrnzLS4GMthIS6DbSs38SoboFh1Od
         UO1GFwU/suvGtTPlc2lhOse6j+4INUnP57VMAK8ZF1s0Xu/BilM4xTX6SZYEzvgOVS1I
         fLVF8vA4QaPCf5pVWSk6qTKvwj4cx8lGvecJNpaB8gll2tbdASoP6imlNNunWouSYdtF
         khPAEyIe93S8hwS27DJzU1UkisB03R6nWcdE71WFXpH/xFtMvy5NYGWcbJZH+2w4HX7/
         74Dg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=content-transfer-encoding:mime-version:message-id:date:subject:to
         :from:x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=amTExPQkIW8kFU3BFOvsvOcCsPhmz/MxkFkmRrPtaZ0=;
        b=2qmXaNAPMIZG2lprVP8nNP/SMa5cnXhA6srLWnfCk10oC30SUYeJ37k4eyVTw74NhF
         IKb4CRGNJHbAPG01IL+gjNPToERs0+RzhtBqyYyi5bYyZ9k/EJJVsfCZm+oiK8j+Xisi
         0evMVJ08fjukbn5x72XCuYYofaKwTMbn/DGHSgUga+EBrF6/DMmAbLQnA1w0L5BepaGY
         tr6wjDTlKnv27JWWEB63S6nYnuI+wpfr0QYuViTQpiprNjR2baavHc5GyXfeyWTQey7w
         IhPb7K5bD/7Ey96XsNHjjHKas8HWwmeR5P0avGmL3j97e8PCMWLt1Hb5fxs1VxUjZj8W
         qWJw==
X-Gm-Message-State: AO0yUKWbYxMPBpP0rObqkSWJHYLFMH3+49hgcm9mTcG+X7VOVs0V0LdT
	bf0X6fxcwrFORbI4iqy/4cg+nXt5bbiNEGPH88Q=
X-Google-Smtp-Source: AK7set/VLRMODpOAbUVLlJ4NHFzuIamkZ7QOOgichYjDqSws2GNBS0jc3mYeKyvbqtGeFIVtOCyQow==
X-Received: by 2002:a17:902:e5d1:b0:19a:bbd0:c5c7 with SMTP id u17-20020a170902e5d100b0019abbd0c5c7mr2497923plf.64.1676469569375;
        Wed, 15 Feb 2023 05:59:29 -0800 (PST)
Received: from hexa.router0800d9.com (dhcp-72-253-4-112.hawaiiantel.net. [72.253.4.112])
        by smtp.gmail.com with ESMTPSA id jn3-20020a170903050300b00180033438a0sm12217189plb.106.2023.02.15.05.59.28
        for <openembedded-core@lists.openembedded.org>
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 15 Feb 2023 05:59:28 -0800 (PST)
From: Steve Sakoman <steve@sakoman.com>
To: openembedded-core@lists.openembedded.org
Subject: [OE-core][langdale 00/28] Pull request (cover letter only)
Date: Wed, 15 Feb 2023 03:59:19 -1000
Message-Id: <cover.1676469487.git.steve@sakoman.com>
X-Mailer: git-send-email 2.34.1
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Wed, 15 Feb 2023 13:59:38 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/177194

The following changes since commit ab39d244cb844c9d183296945a095c17fdfef29e:

  Fix missing leading whitespace with ':append' (2023-01-31 13:15:53 -1000)

are available in the Git repository at:

  https://git.openembedded.org/openembedded-core-contrib stable/langdale-next
  http://cgit.openembedded.org/openembedded-core-contrib/log/?h=stable/langdale-next

Alejandro Hernandez Samaniego (1):
  testimage: Fix error message to reflect new syntax

Alexander Kanavin (3):
  vulkan-samples: branch rename master -> main
  gdk-pixbuf: do not use tools from gdk-pixbuf-native when building
    tests
  oeqa/qemurunner: do not use Popen.poll() when terminating runqemu with
    a signal

Arnout Vandecappelle (1):
  python3-pytest: depend on python3-tomli instead of python3-toml

Bruce Ashfield (2):
  linux-yocto/5.15: update to v5.15.89
  linux-yocto/5.15: update to v5.15.91

Changqing Li (1):
  apt: fix do_package_qa failure

Chee Yang Lee (1):
  git: upgrade to 2.37.5

Harald Seiler (1):
  bootchart2: Fix usrmerge support

Khem Raj (2):
  scons: Pass MAXLINELENGTH to scons invocation
  scons.bbclass: Make MAXLINELENGTH overridable

Louis Rannou (1):
  oeqa/selftest/locales: Add selftest for locale generation/presence

Martin Jansa (1):
  meta: remove True option to getVar and getVarFlag calls (again)

Mikko Rapeli (1):
  oeqa context.py: fix --target-ip comment to include ssh port number

Mingli Yu (1):
  glslang: branch rename master -> main

Pawel Zalewski (1):
  classes/fs-uuid: Fix command output decoding issue

Richard Purdie (4):
  kernel/linux-kernel-base: Fix kernel build artefact determinism issues
  make-mod-scripts: Ensure kernel build output is deterministic
  perf: Enable debug/source packaging
  libc-locale: Fix on target locale generation

Ross Burton (4):
  git: ignore CVE-2022-41953
  buildtools-tarball: set pkg-config search path
  sdkext/cases/devtool: pass a logger to HTTPService
  httpserver: add error handler that write to the logger

Tobias Hagelborn (1):
  sstate.bbclass: Fetch non-existing local .sig files if needed

Ulrich Ölmann (2):
  recipe_sanity: fix old override syntax
  lsof: fix old override syntax

 meta/classes-global/sstate.bbclass            |   5 +-
 meta/classes-recipe/fs-uuid.bbclass           |   2 +-
 meta/classes-recipe/image.bbclass             |   2 +-
 meta/classes-recipe/kernel.bbclass            |   3 -
 meta/classes-recipe/libc-package.bbclass      |   1 +
 meta/classes-recipe/license_image.bbclass     |   2 +-
 meta/classes-recipe/linux-kernel-base.bbclass |   4 +
 .../classes-recipe/rust-target-config.bbclass |   2 +-
 meta/classes-recipe/scons.bbclass             |   8 +-
 meta/classes-recipe/testimage.bbclass         |   2 +-
 meta/classes/recipe_sanity.bbclass            |   2 +-
 meta/lib/oe/package_manager/deb/__init__.py   |   8 +-
 meta/lib/oeqa/runtime/context.py              |   4 +-
 meta/lib/oeqa/sdkext/cases/devtool.py         |   2 +-
 meta/lib/oeqa/selftest/cases/locales.py       |  45 +++++
 meta/lib/oeqa/utils/httpserver.py             |   6 +
 meta/lib/oeqa/utils/qemurunner.py             |  11 +-
 meta/recipes-core/meta/buildtools-tarball.bb  |   3 +
 meta/recipes-devtools/apt/apt_2.4.5.bb        |   1 +
 .../0001-bootchart2-support-usrmerge.patch    |  37 ----
 .../bootchart2/bootchart2_0.14.9.bb           |  11 +-
 .../git/{git_2.37.4.bb => git_2.37.5.bb}      |   4 +-
 meta/recipes-devtools/go/go_1.19.4.bb         |   4 +-
 .../python/python3-pytest_7.1.3.bb            |   2 +-
 meta/recipes-devtools/rust/rust.inc           |  22 +--
 meta/recipes-extended/lsof/lsof_4.95.0.bb     |   2 +-
 .../0001-Add-use_prebuilt_tools-option.patch  | 173 ------------------
 ...w-a-subset-of-tests-in-cross-compile.patch |  66 +++++++
 .../gdk-pixbuf/gdk-pixbuf_2.42.10.bb          |  17 +-
 .../glslang/glslang_1.3.216.0.bb              |   2 +-
 .../vulkan/vulkan-samples_git.bb              |   2 +-
 .../linux/linux-yocto-rt_5.15.bb              |   6 +-
 .../linux/linux-yocto-tiny_5.15.bb            |   6 +-
 meta/recipes-kernel/linux/linux-yocto_5.15.bb |  26 +--
 .../make-mod-scripts/make-mod-scripts_1.0.bb  |   2 +-
 meta/recipes-kernel/perf/perf.bb              |  14 +-
 scripts/contrib/image-manifest                |   2 +-
 scripts/lib/devtool/menuconfig.py             |   2 +-
 38 files changed, 216 insertions(+), 297 deletions(-)
 create mode 100644 meta/lib/oeqa/selftest/cases/locales.py
 delete mode 100644 meta/recipes-devtools/bootchart2/bootchart2/0001-bootchart2-support-usrmerge.patch
 rename meta/recipes-devtools/git/{git_2.37.4.bb => git_2.37.5.bb} (97%)
 delete mode 100644 meta/recipes-gnome/gdk-pixbuf/gdk-pixbuf/0001-Add-use_prebuilt_tools-option.patch
 create mode 100644 meta/recipes-gnome/gdk-pixbuf/gdk-pixbuf/0001-meson.build-allow-a-subset-of-tests-in-cross-compile.patch

-- 
2.34.1


