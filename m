Received: from mail-pf1-f179.google.com (mail-pf1-f179.google.com [209.85.210.179])
 by mx.groups.io with SMTP id smtpd.web12.39810.1629815391680852670
 for <openembedded-core@lists.openembedded.org>;
 Tue, 24 Aug 2021 07:29:52 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@sakoman-com.20150623.gappssmtp.com header.s=20150623 header.b=fyoaL3ZQ;
 spf=softfail (domain: sakoman.com, ip: 209.85.210.179, mailfrom: steve@sakoman.com)
Received: by mail-pf1-f179.google.com with SMTP id x16so18537887pfh.2
        for <openembedded-core@lists.openembedded.org>; Tue, 24 Aug 2021 07:29:51 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=sakoman-com.20150623.gappssmtp.com; s=20150623;
        h=from:to:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=FX1qPtO+LtPsF/ccjBrmN3vCjqPoaCYpt38kudIScJo=;
        b=fyoaL3ZQiKBFGfho2E+5HHHWaLbBSNd1q6XTKewDvkTYQQBTiTmob31E0trmlch9te
         K6rNKbmEyvm0UpKoAJgD/Gl3+ezUVcu/8xiYaZNpKF4R+XvJ3Vt7Qt/hMkLDq9sQiZZx
         b2qvwXg7EAUDjrpuNVYrKyasn5+KVK+Sd0OthVKNEuBRIV8mX3vayBie3xIs/OCkPJDq
         VY9MdNz0yFBecvd0JzQ8Ip1qaroFZs9V9+4C3SuEcjhJBOsPzawdJ4kOHscOfa6KmMud
         jk/Ud1uMMOCPtlUhMemb4NvPR6w6AOPOjxuKOFEOD3657szQDPTtSbToUWA0XdQSSHld
         +0YA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=FX1qPtO+LtPsF/ccjBrmN3vCjqPoaCYpt38kudIScJo=;
        b=V0wSCSEKsSfTZqOfXwaxeRSr0PxutZEFvtESCHU/IZVD/EqQI/a5uPniTNtqMmwdsr
         Jx0Op9Vfb3rn1z90TY7QrOvtg2z3JujQ969kwKB+3a5J8qsfSTP2GkfJEmu8j/zhwLnu
         cHUJRSIkGyA0VrU9btYMrytGc4xTlfXyYpw41oVLnLwUusqF+qki2xvPrHv10KgY8BN2
         fO3+92kbJsMdMqfChSjEIez5RwzJmX4E6Lcrb/LXKpxFsb/EjaGgnKLJi9W32BTj/SmG
         SD5bd4tFXl1zcWiplzb+DFuZckkmcBGgyBWvWseDs38g8i+cb0e75VFlFgOH7CMMdZgs
         mneg==
X-Gm-Message-State: AOAM5318XWWfJ6J0dOZKLK+ndF/2fcFanRmfyzaNOkThplGuI/m2avfG
	X/lzbQiCZMuBGhJjya0M2UE1QIoJxR1IRyHu
X-Google-Smtp-Source: ABdhPJxGz2cNRcSwJ3i9WXwFlvBhUeM2un2DjQ0z6BjXg6j0ujl38/Bo6rwRgzpCBNgNChrZ8qTRjA==
X-Received: by 2002:a63:1352:: with SMTP id 18mr37047927pgt.348.1629815390602;
        Tue, 24 Aug 2021 07:29:50 -0700 (PDT)
Return-Path: <steve@sakoman.com>
Received: from hexa.router0800d9.com ([172.243.4.16])
        by smtp.gmail.com with ESMTPSA id r3sm18773147pff.119.2021.08.24.07.29.47
        for <openembedded-core@lists.openembedded.org>
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 24 Aug 2021 07:29:49 -0700 (PDT)
From: "Steve Sakoman" <steve@sakoman.com>
To: openembedded-core@lists.openembedded.org
Subject: [OE-core][dunfell 00/12] Pull request (cover letter only)
Date: Tue, 24 Aug 2021 04:29:27 -1000
Message-Id: <cover.1629815153.git.steve@sakoman.com>
X-Mailer: git-send-email 2.25.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

The following changes since commit ce78c16409363741d59a2f787aca66077bec93cd:

  sstate.bbclass: fix error handling when sstate mirrors is ro (2021-08-16 04:41:07 -1000)

are available in the Git repository at:

  git://git.openembedded.org/openembedded-core-contrib stable/dunfell-next
  http://cgit.openembedded.org/openembedded-core-contrib/log/?h=stable/dunfell-next

Alexandre Belloni (1):
  oeqa/runtime/cases: make date.DateTest.test_date more reliable

Bruce Ashfield (3):
  linux-yocto/5.4: update to v5.4.137
  linux-yocto/5.4: update to v5.4.139
  linux-yocto/5.4: update to v5.4.141

Dmitry Baryshkov (1):
  linux-firmware: add more Qualcomm firmware packages

Dragos-Marian Panait (1):
  util-linux: fix CVE-2021-37600

Khem Raj (1):
  sdk: Enable do_populate_sdk with multilibs

Purushottam Choudhary (1):
  python3: Remove unused python3 recipe

Richard Purdie (1):
  oeqa/selftest/glibc: Handle incorrect encoding issuesin glibc test
    results

Ross Burton (2):
  tar: ignore node-tar CVEs
  ovmf: build natively everywhere

hongxu (1):
  sdk: fix relocate symlink failed

 meta/classes/multilib.bbclass                 |   1 -
 meta/classes/populate_sdk_base.bbclass        |   2 +-
 meta/files/toolchain-shar-relocate.sh         |   2 +-
 meta/lib/oeqa/runtime/cases/date.py           |   9 +-
 meta/lib/oeqa/selftest/cases/glibc.py         |   2 +-
 meta/recipes-core/ovmf/ovmf_git.bb            |   2 +-
 .../util-linux/CVE-2021-37600.patch           |  33 ++
 .../util-linux/util-linux_2.35.1.bb           |   1 +
 .../recipes-devtools/python/python3_3.8.10.bb | 363 ------------------
 meta/recipes-extended/tar/tar_1.32.bb         |   3 +
 .../linux-firmware/linux-firmware_20210511.bb |  17 +-
 .../linux/linux-yocto-rt_5.4.bb               |   6 +-
 .../linux/linux-yocto-tiny_5.4.bb             |   8 +-
 meta/recipes-kernel/linux/linux-yocto_5.4.bb  |  22 +-
 14 files changed, 79 insertions(+), 392 deletions(-)
 create mode 100644 meta/recipes-core/util-linux/util-linux/CVE-2021-37600.patch
 delete mode 100644 meta/recipes-devtools/python/python3_3.8.10.bb

-- 
2.25.1

