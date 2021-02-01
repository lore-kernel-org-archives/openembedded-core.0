Received: from mail-oi1-f175.google.com (mail-oi1-f175.google.com [209.85.167.175])
 by mx.groups.io with SMTP id smtpd.web12.36650.1612196721713732523
 for <openembedded-core@lists.openembedded.org>;
 Mon, 01 Feb 2021 08:25:22 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@sakoman-com.20150623.gappssmtp.com header.s=20150623 header.b=HAXKN67A;
 spf=softfail (domain: sakoman.com, ip: 209.85.167.175, mailfrom: steve@sakoman.com)
Received: by mail-oi1-f175.google.com with SMTP id d20so3588319oiw.10
        for <openembedded-core@lists.openembedded.org>; Mon, 01 Feb 2021 08:25:21 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=sakoman-com.20150623.gappssmtp.com; s=20150623;
        h=from:to:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=fg7gcKz0YB4EYjy9Mvhma2jnA8kAOx89kdqLVTyipqU=;
        b=HAXKN67A5WdanLThb7kIQW0cw8SImRzGVjm/hEQBRvdzGoyeFlTlmbV1P3F30jH0mv
         CA9d14tTxqgUr8D4jW6jq9j6kY8k6crcTPOosByi2/maHD6iCS00RjNu4luwJjvJk3nB
         wZHHPhRepOVZB1/8xSC+Op1GR1z9IeveKrIcHpioaRk4trG1Jpmsgi6lLljXY3nEBjF4
         XfpjUdpw6ycRuTr1S4E8G17R+oS4SOlY8l1kXDOo++lw4asMbs8fAmrg6eWjVoT6IT3A
         rY7kJ8HDMpjmEDprlXm/EGV05mmEzEUdtvByEjWmEoKSIjXir1SO6iWsHjJpFMUPuK4N
         p83Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=fg7gcKz0YB4EYjy9Mvhma2jnA8kAOx89kdqLVTyipqU=;
        b=QxMxizRCv8xKY/JgglDEStNvyBP344r0v9vczht549Y+cT3hDNZiRRQv/LJtEo8Uj1
         cdRaCEATqidPutnzE0g0r7F7oehCy/tUM0wx1dWeldt9e5bT8jFdXqXzFANqzqDXEEwT
         fncfyS12+lgBnxCAR9KI09O6J5j7jJriL3eHgxf9cqRWdaKeBSSGrPlAczED+42Y1VHb
         0zKSDF3nGNf+w2axVeyvXKcaSCGIEBtmUquD4/loOxiCNHUCe/P9ROpe8AZopkwewmiS
         46cLrnhveoLa5mbbxLrtK4C13qNjtAeQALkACEn8v3DtXpqr6wuMvx5qScywr+FkM2zn
         UL/w==
X-Gm-Message-State: AOAM531sEP8J44hBev9Z6BfiGuCuhZH+FtdgcUQzajXwBWb5vsYeLXPi
	QpiE0IR5ea8imjwDzBukDT9lBnd8cEF8j3nZSbY=
X-Google-Smtp-Source: ABdhPJypK442edJKzZJlUD4gbgh5q1Lg/WGJgMrATO2b1WAab11vdFwvGI2oAcWHxr30HEWvepzuTA==
X-Received: by 2002:a54:4801:: with SMTP id j1mr11378353oij.142.1612196720457;
        Mon, 01 Feb 2021 08:25:20 -0800 (PST)
Return-Path: <steve@sakoman.com>
Received: from hexa.router0800d9.com ([72.173.249.164])
        by smtp.gmail.com with ESMTPSA id o16sm3980726ote.79.2021.02.01.08.25.16
        for <openembedded-core@lists.openembedded.org>
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 01 Feb 2021 08:25:19 -0800 (PST)
From: "Steve Sakoman" <steve@sakoman.com>
To: openembedded-core@lists.openembedded.org
Subject: [OE-core][dunfell 00/21] Patch review
Date: Mon,  1 Feb 2021 06:24:31 -1000
Message-Id: <cover.1612188857.git.steve@sakoman.com>
X-Mailer: git-send-email 2.25.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Please review this next set of patches for dunfell and have comments back by end
of day Wednesday.

Passed a-full on autobuilder:

https://autobuilder.yoctoproject.org/typhoon/#/builders/83/builds/1807

with the exception of an autobuilder intermittent issue on qemuppc-alt, which
passed on subsequent retest:

https://autobuilder.yoctoproject.org/typhoon/#/builders/107/builds/1320

The following changes since commit 1988d07b65ad38bdf8fac8615f11fb6536a75806:

  wic: Optimise fstab modification for ext2/3/4 and msdos partitions (2021-01-28 04:41:47 -1000)

are available in the Git repository at:

  git://git.openembedded.org/openembedded-core-contrib stable/dunfell-nut
  http://cgit.openembedded.org/openembedded-core-contrib/log/?h=stable/dunfell-nut

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

