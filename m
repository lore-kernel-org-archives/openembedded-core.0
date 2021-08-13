Received: from mail-pl1-f181.google.com (mail-pl1-f181.google.com [209.85.214.181])
 by mx.groups.io with SMTP id smtpd.web08.37325.1628865053360562846
 for <openembedded-core@lists.openembedded.org>;
 Fri, 13 Aug 2021 07:30:53 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@sakoman-com.20150623.gappssmtp.com header.s=20150623 header.b=FGlvBZRA;
 spf=softfail (domain: sakoman.com, ip: 209.85.214.181, mailfrom: steve@sakoman.com)
Received: by mail-pl1-f181.google.com with SMTP id e15so12196297plh.8
        for <openembedded-core@lists.openembedded.org>; Fri, 13 Aug 2021 07:30:53 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=sakoman-com.20150623.gappssmtp.com; s=20150623;
        h=from:to:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=leLyOO5M4bEzqHyCN/guIF96PY9ZFjiwb7319OT5tIA=;
        b=FGlvBZRAnFudUSta7Ko7yPpt//e0RSo0iumRYL4FEvgXqbcWAffv5lkYVzABChzSU6
         dOwODD4AnN26kT8wNNW05u7JL3jXQYkYwNyBF3HFFdCkewlhi1U5xbG6hZsMNXhI3sqM
         ebBzSMx5vVRJ5JTckAH2suN6CZFGBf6dIW+gV1410tsHy1VW/kdvmgR0E2v0g5447cui
         VnQc4IFYvwbBPaB0mMcLq2O9ljBnwemyUdLyJu0cgcIIjsrQjcp8mzJzCAI6r7Sg2/Lz
         Oor+h4F1ySUBj9HgzWYJ3KV460JVcI6lW/qj986/8Nifr19Xxzu1eSXF3UD2luSwUf9M
         +n8A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=leLyOO5M4bEzqHyCN/guIF96PY9ZFjiwb7319OT5tIA=;
        b=QJRGeTgi7UE9Y2ugPCn2c6DrwcLisMeWs/oH6SWDdkXWRNmDSTY/0QeG+RBeFZnJIq
         lTljpdaaRDpnmhBTL3XNzzrkz2PBHX1Ro988i4OpmqkJkZ3eRghJlwb97CAAVz5Xwqw8
         oE00+oKH7/rb79wAkoVe6f4lFs9qjzUcpWzw/NItHxYjDpwldXc85hx2iOkeVmBRCGta
         +NCcrL/x9lyrmTrFYn/pE038zhH/vtqXbw2IN3BXtOeLXdGHG1aTbp/oxF9+P7KTIrnW
         NqfkPes9+58OhLfYnSRJ0t/wosQbGygUY/SzDjMTMmd6AYej6c2uvXWtJ3c0cWKstpJp
         dBow==
X-Gm-Message-State: AOAM531W9k/VR3M76ntAOeAeJns/TFolD+tIiIcQgHk1J1Pkg8JIDDuf
	rKWz9yo7/vkI/C92hTP8XCJLEkRKWkHPnMO7
X-Google-Smtp-Source: ABdhPJyLc3sP4H1wmhRsn/aS9XXKx860H+NJys3kmqjwPnIk9G/qnsdwsCmP6eguqKdhXBnoW5Jo3Q==
X-Received: by 2002:a63:4b60:: with SMTP id k32mr2603788pgl.198.1628865052164;
        Fri, 13 Aug 2021 07:30:52 -0700 (PDT)
Return-Path: <steve@sakoman.com>
Received: from localhost.localdomain ([172.243.4.16])
        by smtp.gmail.com with ESMTPSA id nl9sm2113182pjb.33.2021.08.13.07.30.48
        for <openembedded-core@lists.openembedded.org>
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 13 Aug 2021 07:30:51 -0700 (PDT)
From: "Steve Sakoman" <steve@sakoman.com>
To: openembedded-core@lists.openembedded.org
Subject: [OE-core][dunfell 00/17] Patch review
Date: Fri, 13 Aug 2021 04:29:42 -1000
Message-Id: <cover.1628863869.git.steve@sakoman.com>
X-Mailer: git-send-email 2.25.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Please review this next set of patches for dunfell and have comments back by
end of day Monday.

Passed a-full on autobuilder:

https://autobuilder.yoctoproject.org/typhoon/#/builders/83/builds/2441

The following changes since commit bae9c6482271d53dc28d3c801fba467e268003bd:

  sstate: Fix rebuilds when changing layer config (2021-08-04 09:57:23 -1000)

are available in the Git repository at:

  git://git.openembedded.org/openembedded-core-contrib stable/dunfell-nut
  http://cgit.openembedded.org/openembedded-core-contrib/log/?h=stable/dunfell-nut

Jose Quaresma (1):
  sstate.bbclass: fix error handling when sstate mirrors is ro

Lee Chee Yang (2):
  aspell: fix CVE-2019-25051
  libsolv: fix CVE-2021-3200

Matthias Klein (1):
  runqemu: Fix typo in error message

Michael Opdenacker (4):
  cve-check: fix comments
  cve-check: update link to NVD website for CVE details
  cve-check: improve comment about CVE patch file names
  cve-check: remove deprecated CVE_CHECK_CVE_WHITELIST

Minjae Kim (1):
  ruby: 2.7.3 -> 2.7.4

Paul Barker (1):
  kernel-yocto: Simplify no git repo case in do_kernel_checkout

Ralph Siemsen (1):
  glibc: Document and whitelist CVE-2021-35942

Ranjitsinh Rathod (1):
  systemd: Add fix for CVE-2020-13529 and CVE-2021-33910

Richard Purdie (2):
  license: Exclude COPYING.MIT from pseudo
  image: Drop COMPRESS_CMD

Ross Burton (2):
  e2fsprogs: ensure small images have 256-byte inodes
  wic: don't forcibly pass -T default

akuster (1):
  cve-check: add include/exclude layers

 meta/classes/cve-check.bbclass                |  37 +++++--
 meta/classes/image.bbclass                    |   3 +-
 meta/classes/kernel-yocto.bbclass             |  30 +++---
 meta/classes/license.bbclass                  |   4 +-
 meta/classes/sstate.bbclass                   |   2 +
 meta/recipes-core/glibc/glibc_2.31.bb         |  10 ++
 .../systemd/systemd/CVE-2020-13529.patch      |  42 ++++++++
 .../systemd/systemd/CVE-2021-33910.patch      |  67 ++++++++++++
 meta/recipes-core/systemd/systemd_244.5.bb    |   2 +
 .../e2fsprogs/big-inodes-for-small-fs.patch   |  22 ++++
 .../e2fsprogs/e2fsprogs_1.45.4.bb             |   1 +
 .../ruby/{ruby_2.7.3.bb => ruby_2.7.4.bb}     |   4 +-
 .../libsolv/files/CVE-2021-3200.patch         |  67 ++++++++++++
 .../libsolv/libsolv_0.7.10.bb                 |   1 +
 meta/recipes-support/aspell/aspell_0.60.8.bb  |   4 +-
 .../aspell/files/CVE-2019-25051.patch         | 101 ++++++++++++++++++
 scripts/lib/wic/canned-wks/common.wks.inc     |   2 +-
 scripts/lib/wic/canned-wks/directdisk-gpt.wks |   2 +-
 scripts/lib/wic/canned-wks/mkefidisk.wks      |   2 +-
 scripts/runqemu                               |   2 +-
 20 files changed, 369 insertions(+), 36 deletions(-)
 create mode 100644 meta/recipes-core/systemd/systemd/CVE-2020-13529.patch
 create mode 100644 meta/recipes-core/systemd/systemd/CVE-2021-33910.patch
 create mode 100644 meta/recipes-devtools/e2fsprogs/e2fsprogs/big-inodes-for-small-fs.patch
 rename meta/recipes-devtools/ruby/{ruby_2.7.3.bb => ruby_2.7.4.bb} (95%)
 create mode 100644 meta/recipes-extended/libsolv/files/CVE-2021-3200.patch
 create mode 100644 meta/recipes-support/aspell/files/CVE-2019-25051.patch

-- 
2.25.1

