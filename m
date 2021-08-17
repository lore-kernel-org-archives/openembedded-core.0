Received: from mail-pj1-f44.google.com (mail-pj1-f44.google.com [209.85.216.44])
 by mx.groups.io with SMTP id smtpd.web10.34382.1629168847402327685
 for <openembedded-core@lists.openembedded.org>;
 Mon, 16 Aug 2021 19:54:07 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@sakoman-com.20150623.gappssmtp.com header.s=20150623 header.b=wsmBjy3a;
 spf=softfail (domain: sakoman.com, ip: 209.85.216.44, mailfrom: steve@sakoman.com)
Received: by mail-pj1-f44.google.com with SMTP id u21-20020a17090a8915b02901782c36f543so2407568pjn.4
        for <openembedded-core@lists.openembedded.org>; Mon, 16 Aug 2021 19:54:07 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=sakoman-com.20150623.gappssmtp.com; s=20150623;
        h=from:to:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=uDzb7bzddqqK1SDi0cixiOUOZ48z10P7ZALYDOkSS0Y=;
        b=wsmBjy3aCVL2DZ1zX6N4Qj2wNHhiA+lJsi9lUZgWakc089q7jvPtMlwd3bVpZCtm4A
         V4gL9IQiY8VSXnIRptIlLXlZmrW+uYpmc34Xhi0bYQG9YxbR7DFIhId6/UwhwperXRR8
         eYIUnEJNFrUL9uZIjjC2YKnRjCwjrX78JfSbNFajlrZzEptOcqyQM4Q3n9DTth0WpEb4
         M24wL83yHvieFswwwQ1j7Mo03kNFXG/mABn1IZ3fDGC/d1jaPjBABtSJRSSemhVTOeuo
         K7SHjFvhHd4V/avcPC7izLxiPJR6rgcRsmsIn5diORxrnDsOh1QPUGzyGSMRVcXmAyob
         aMCA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=uDzb7bzddqqK1SDi0cixiOUOZ48z10P7ZALYDOkSS0Y=;
        b=dfKKVN6LyzBLtvt0p0pDlfEH7I2u6zzAOUngJH3TbTaKuu4qg68bLnTQ7S8ur2M7yd
         lWt3PTKg1VZk4gmRQhZscV5XyU0XQc791LFW2Lrad7pi0RdMfXrUymaN040KoOzGdY6h
         to4+DSgO31PnyjtN1JJf3n9YyZ3xTljkqy5BMTR+oHhJs8ANgA1OrQGttdKlU/WWUeOk
         CFI2loZeYMskqGzQEsTdyhaGaxuol8NobM+0Xen0N8zkqI2YyRFzfA6uvf/qq96+EesV
         SxPNKXRY/3i3wC1/MD7yoHMAarK+i9aGkgLoglPyEGzFdsAkweUm+HB9nv94XNthzd/N
         pEgQ==
X-Gm-Message-State: AOAM532j5nwRSRr0GzS3Q55Oz/ROn3Zgr2iczNagOqQWKu968Uqyaou+
	w5MHkF0muDjvahaUPY8co9XAUXN6pkQJRZuy
X-Google-Smtp-Source: ABdhPJwbpBXo3ahfRdusWAxSj0H9POCrE9LBD4DvDb7G2tzNHo5fyq748QLyshrVyDirZX2Q7wVEog==
X-Received: by 2002:a62:8283:0:b0:3e0:f3f3:839d with SMTP id w125-20020a628283000000b003e0f3f3839dmr1300839pfd.37.1629168846089;
        Mon, 16 Aug 2021 19:54:06 -0700 (PDT)
Return-Path: <steve@sakoman.com>
Received: from hexa.router0800d9.com ([172.243.4.16])
        by smtp.gmail.com with ESMTPSA id l11sm432381pjg.22.2021.08.16.19.54.02
        for <openembedded-core@lists.openembedded.org>
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 16 Aug 2021 19:54:05 -0700 (PDT)
From: "Steve Sakoman" <steve@sakoman.com>
To: openembedded-core@lists.openembedded.org
Subject: [OE-core][dunfell 00/16] Pull request (cover letter only)
Date: Mon, 16 Aug 2021 16:53:45 -1000
Message-Id: <cover.1629168781.git.steve@sakoman.com>
X-Mailer: git-send-email 2.25.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

The following changes since commit bae9c6482271d53dc28d3c801fba467e268003bd:

  sstate: Fix rebuilds when changing layer config (2021-08-04 09:57:23 -1000)

are available in the Git repository at:

  git://git.openembedded.org/openembedded-core-contrib stable/dunfell-next
  http://cgit.openembedded.org/openembedded-core-contrib/log/?h=stable/dunfell-next

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

Richard Purdie (1):
  license: Exclude COPYING.MIT from pseudo

Ross Burton (2):
  e2fsprogs: ensure small images have 256-byte inodes
  wic: don't forcibly pass -T default

akuster (1):
  cve-check: add include/exclude layers

 meta/classes/cve-check.bbclass                |  37 +++++--
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
 19 files changed, 368 insertions(+), 34 deletions(-)
 create mode 100644 meta/recipes-core/systemd/systemd/CVE-2020-13529.patch
 create mode 100644 meta/recipes-core/systemd/systemd/CVE-2021-33910.patch
 create mode 100644 meta/recipes-devtools/e2fsprogs/e2fsprogs/big-inodes-for-small-fs.patch
 rename meta/recipes-devtools/ruby/{ruby_2.7.3.bb => ruby_2.7.4.bb} (95%)
 create mode 100644 meta/recipes-extended/libsolv/files/CVE-2021-3200.patch
 create mode 100644 meta/recipes-support/aspell/files/CVE-2019-25051.patch

-- 
2.25.1

