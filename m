Received: from mail-oi1-f171.google.com (mail-oi1-f171.google.com [209.85.167.171])
 by mx.groups.io with SMTP id smtpd.web11.8672.1612448889667881142
 for <openembedded-core@lists.openembedded.org>;
 Thu, 04 Feb 2021 06:28:10 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@sakoman-com.20150623.gappssmtp.com header.s=20150623 header.b=PfE64Tkw;
 spf=softfail (domain: sakoman.com, ip: 209.85.167.171, mailfrom: steve@sakoman.com)
Received: by mail-oi1-f171.google.com with SMTP id h192so3896039oib.1
        for <openembedded-core@lists.openembedded.org>; Thu, 04 Feb 2021 06:28:09 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=sakoman-com.20150623.gappssmtp.com; s=20150623;
        h=from:to:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=xlFin5nQoc52EcTRKtnB/tbGZOkGYk9R6xZmRbiJNdU=;
        b=PfE64Tkwj/vkGl7U+HD8CrqmIeBgnM0N0IPw0LzJNutj344hlgj5iFkg6iav8MU3Uw
         igrUKUaC3t9Mz/XsNSed768i03f9v77r5p4h0PdMxEjzBCWm1w0MN9xq5BHeOwIN0c6F
         a2CexHm5sOOaRYw0NNzrAiEarCeVZMcjRIxQVhi/+6TrwC2KUTN1HTkdFj9I14iP3xXx
         1RwcN9KoCtJPzBPCDss/JP3TZxnNpXAMuyQTlvsnjdq42eH/NFxC2Y6FASbV8yr2n/dL
         ixYWrL+v2eHlycTrY5PS5DLrJeWTmvA9F14PoDV1i1mvb2iy1P3vkiNjbfO1gsSeqZe3
         9mTw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=xlFin5nQoc52EcTRKtnB/tbGZOkGYk9R6xZmRbiJNdU=;
        b=n/ZP+fd/RIfFOnTDYcvM8ixYfk15R9x1Pu0/sGJBVurohUPuDMIdpXh+zNnW7lI47M
         DeVMJmPC9IDgRGEpvAiJjQhWUt5YBZGhBFzD7N6VsxYLuGzxIEa0OgRkJoF3fBJK+IkN
         F7/DvYWFZjiRuaPC1lFgKGaOxqgZwGUwLVsSpK4YD5A8+uWMXaXMkgajvQ9EuyPPO/DM
         l83VgxDsvE1+athN4rV6FaMXLsbgOPmc9DqECWdzhiuBaAHEEfbciOIfihEDud3X6suM
         tUWsBagHSV62Lh5FCkCOzLBn7gk4U5kxIDMpd0cAQg4a6dq5KHY0Bf57IWj9QYC+n+Rr
         NfvA==
X-Gm-Message-State: AOAM531FHXh37I8CKTo24QwhKIdxnKgEPx3d7BpVRhvTD0jDL1nfefkI
	y1qEY9ZEj7VDQcl0sKa29NcfJaq8mN5FhHG78N4=
X-Google-Smtp-Source: ABdhPJy4rCK+94uMmfTzbZWIz+8UmIoNzWQ3hHgWq/jGSL+WwTmBLl/ot4488I38/qOSmtF8rTMOig==
X-Received: by 2002:aca:e184:: with SMTP id y126mr5388395oig.75.1612448888387;
        Thu, 04 Feb 2021 06:28:08 -0800 (PST)
Return-Path: <steve@sakoman.com>
Received: from hexa.router0800d9.com ([72.173.249.164])
        by smtp.gmail.com with ESMTPSA id w11sm1124715otg.58.2021.02.04.06.28.04
        for <openembedded-core@lists.openembedded.org>
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 04 Feb 2021 06:28:07 -0800 (PST)
From: "Steve Sakoman" <steve@sakoman.com>
To: openembedded-core@lists.openembedded.org
Subject: [OE-core][dunfell 00/21] Pull request (cover letter only)
Date: Thu,  4 Feb 2021 04:27:47 -1000
Message-Id: <cover.1612448561.git.steve@sakoman.com>
X-Mailer: git-send-email 2.25.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

The following changes since commit 1988d07b65ad38bdf8fac8615f11fb6536a75806:

  wic: Optimise fstab modification for ext2/3/4 and msdos partitions (2021-01-28 04:41:47 -1000)

are available in the Git repository at:

  git://git.openembedded.org/openembedded-core-contrib stable/dunfell-next
  http://cgit.openembedded.org/openembedded-core-contrib/log/?h=stable/dunfell-next

Alexander Kanavin (1):
  oeqa/ptest: print a warning if ptests failed

Dorinda (2):
  sanity: Verify that user isn't building in PSEUDO_IGNORE_PATHS
  sanity.bbclass: sanity check for if bitbake is present in PATH

Oleksiy Obitotskyy (2):
  flex: Fix --noline option behavior
  dtc: improve reproducibility

Oleksiy Obitotskyy yIEf0zt.mo (1):
  toolchain-shar-relocate.sh: Fix handling files with colons

Ovidiu Panait (1):
  timezone: upgrade to 2021a

Richard Purdie (3):
  ncurses: Don't put terminfo into the sysroot
  python3: Avoid installing test data into recipe-sysroot
  staging: Clean up files installed into the sysroot

Ross Burton (3):
  flex: fix build with autoconf 2.70
  core-image-sato-sdk-ptest: these images need ptest
  ovmf-shell-image: image is only buildable on x86-64

Tomasz Dziendzielski (5):
  devtool: Fix source extraction for gcc shared source
  externalsrc: Fix parsing error with devtool non-git sources
  devtool: Fix file:// fetcher symlink directory structure
  selftest/devtool: Add modify_localfiles_only test checking symlink
    path
  externalsrc: Detect code changes in submodules

Yi Fan Yu (2):
  oeqa/selftest/cases/tinfoil.py: increase timeout 10->60s
    test_wait_event
  strace: increase ptest timeout duration 120->240s

zangrc (1):
  flex: Refresh patch

 meta/classes/externalsrc.bbclass              | 16 ++++-
 meta/classes/sanity.bbclass                   | 12 ++++
 meta/classes/staging.bbclass                  |  4 ++
 meta/files/toolchain-shar-relocate.sh         |  2 +-
 meta/lib/oeqa/runtime/cases/ptest.py          |  1 +
 meta/lib/oeqa/selftest/cases/devtool.py       | 37 ++++++++++
 meta/lib/oeqa/selftest/cases/tinfoil.py       |  6 +-
 meta/recipes-core/ncurses/ncurses.inc         |  5 ++
 meta/recipes-core/ovmf/ovmf-shell-image.bb    |  1 +
 ...directives-if-gen_line_dirs-is-false.patch | 32 +++++++++
 .../flex/flex/check-funcs.patch               | 67 +++++++++++++++++++
 meta/recipes-devtools/flex/flex_2.6.4.bb      |  2 +
 meta/recipes-devtools/python/python3_3.8.2.bb |  6 ++
 meta/recipes-devtools/strace/strace/run-ptest |  2 +-
 meta/recipes-extended/timezone/timezone.inc   |  6 +-
 meta/recipes-kernel/dtc/dtc.inc               |  2 +
 ...-Makefile-to-add-CFLAGS-not-override.patch | 36 ++++++++++
 .../images/core-image-sato-ptest-fast.bb      |  3 +
 .../images/core-image-sato-sdk-ptest.bb       |  3 +
 scripts/lib/devtool/standard.py               | 36 ++++++++--
 20 files changed, 266 insertions(+), 13 deletions(-)
 create mode 100644 meta/recipes-devtools/flex/flex/0001-Emit-no-line-directives-if-gen_line_dirs-is-false.patch
 create mode 100644 meta/recipes-devtools/flex/flex/check-funcs.patch
 create mode 100644 meta/recipes-kernel/dtc/dtc/0001-dtc-Fix-Makefile-to-add-CFLAGS-not-override.patch

-- 
2.25.1

