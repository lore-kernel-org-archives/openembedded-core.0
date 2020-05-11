Received: from mail-pf1-f196.google.com (mail-pf1-f196.google.com [209.85.210.196])
 by mx.groups.io with SMTP id smtpd.web11.13297.1589207961411571148
 for <openembedded-core@lists.openembedded.org>;
 Mon, 11 May 2020 07:39:21 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@sakoman-com.20150623.gappssmtp.com header.s=20150623 header.b=IoZAsZUb;
 spf=softfail (domain: sakoman.com, ip: 209.85.210.196, mailfrom: steve@sakoman.com)
Received: by mail-pf1-f196.google.com with SMTP id x2so4832641pfx.7
        for <openembedded-core@lists.openembedded.org>; Mon, 11 May 2020 07:39:21 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=sakoman-com.20150623.gappssmtp.com; s=20150623;
        h=from:to:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=tTFTGAT4ZXvW/jyl6eEc1ebQja0H44vMnFLOB5ELCEU=;
        b=IoZAsZUbZgXqpZ99diyP1nV/lOUQcqqei2LabHnMplKo8ouaTa2h6NJZ+NYiNK1lMt
         uyu5MyrrtJrvEe5SXlxs4uou9kercV2AGww1JwJqI4EM7mz/1PeW5gxmkNVcCXSeDgMp
         PO8PX2oE9BxbSLfK6+aZfNPT/dLoWJuv9WCbsVlEWmqmZueaG8Fsh5VV13Q4pgK6zOQ/
         Pmdf9WQhDIb71FeXMeYhaGvj/18qSDaGSKTFxXiMnni1rlxxoZaQCqaHRXWg8F4Wqq/L
         xUtqUyOK1OkD966Ey2OiZyGMB8cELA5fq3+8ddVOveqpm/lV9gsAz6qTeT9c8FiaR424
         lP+w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=tTFTGAT4ZXvW/jyl6eEc1ebQja0H44vMnFLOB5ELCEU=;
        b=MKATMkI7UOYbWDW7EiudZoTN6miTwDBa35OEZ2Brbt5uMbC4q9gFmyQGJemKAQ2Q2S
         yYqloG33MkFCwNSdNxGwdaEj9E2/kllPqH123/hivUvpPeqav2EXhuQaGxlH9JkddUax
         xrkFhxDUJ9IgstOUkvM8QeYp+G1TWFLeSCB7Ca/MeG6K/AI0d0JO9dGjMVlPp/ZkFYuK
         TUEkayjGpYqWzzi/2aXEZsZgj0uQt2Wftv0KH6O7rHZCuvrM4hekQ1B8G/dHR7svBOzO
         mVp9qoqyUIUDHFHPbo4tDBzjpbkGi46Js6tuBXrOppDmBPofyVa39FFNs5C8RxdDwymx
         vM7g==
X-Gm-Message-State: AGi0PuavBa40TarjLSjYDhKM7niEPmnqV+yf1t5u1VjRZq3FuD5LfWGY
	2CAqA+Wwm3CS0sgFaQ7D4UTK5Yvm7hCRng==
X-Google-Smtp-Source: APiQypIqZgeLEGHQXMuKzzNoBJP/JAdjjTeYfLtSvgXmV6NfyNcDrtOErPcFhxitVzYYepvo8xJBzw==
X-Received: by 2002:a62:920d:: with SMTP id o13mr16867715pfd.201.1589207960072;
        Mon, 11 May 2020 07:39:20 -0700 (PDT)
Return-Path: <steve@sakoman.com>
Received: from octo.router0800d9.com (rrcs-66-91-142-162.west.biz.rr.com. [66.91.142.162])
        by smtp.gmail.com with ESMTPSA id 6sm9337202pfj.123.2020.05.11.07.39.18
        for <openembedded-core@lists.openembedded.org>
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 11 May 2020 07:39:19 -0700 (PDT)
From: "Steve Sakoman" <steve@sakoman.com>
To: openembedded-core@lists.openembedded.org
Subject: [OE-core][dunfell 0/8] Patch review
Date: Mon, 11 May 2020 04:38:43 -1000
Message-Id: <cover.1589207495.git.steve@sakoman.com>
X-Mailer: git-send-email 2.17.1
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit

Please review this next set of patches for dunfell and have comments back
by end of day Wednesday.

Clean a-full build on autobuilder (oe-selftest-fedora not run due to no
available fedora builders over the weekend):

https://autobuilder.yoctoproject.org/typhoon/#/builders/83/builds/941

The following changes since commit 12f0cbf348d5acb0a7913bb5dc98e7fccc5ec34f:

  icu: CVE-2020-10531 (2020-05-04 05:34:18 -1000)

are available in the Git repository at:

  git://git.openembedded.org/openembedded-core-contrib stable/dunfell-nut
  http://cgit.openembedded.org/openembedded-core-contrib/log/?h=stable/dunfell-nut

Benjamin Fair (1):
  util-linux: fix build error in kill

Bruce Ashfield (3):
  linux-yocto/5.4: update to v5.4.28
  linux-yocto/5.4: update to v5.4.32
  linux-yocto/5.4: update to v5.4.34

Khem Raj (1):
  musl: Remove spurious unused patch

Pierre-Jean Texier (1):
  timezone: upgrade 2019c -> 2020a

Sakib Sajal (1):
  sqlite: backport CVE fixes

Vyacheslav Yurkov (1):
  os-release: sanitize required fields

 ...move-using-.end-directive-with-clang.patch | 36 ----------
 meta/recipes-core/os-release/os-release.bb    | 14 ++--
 .../0001-include-cleanup-pidfd-inckudes.patch | 42 +++++++++++
 ...-types.h-before-checking-SYS_pidfd_s.patch | 64 +++++++++++++++++
 .../util-linux/util-linux_2.35.1.bb           |  2 +
 meta/recipes-extended/timezone/timezone.inc   | 10 +--
 .../linux/linux-yocto-rt_5.4.bb               |  6 +-
 .../linux/linux-yocto-tiny_5.4.bb             |  8 +--
 meta/recipes-kernel/linux/linux-yocto_5.4.bb  | 22 +++---
 .../sqlite/files/CVE-2020-11655.patch         | 32 +++++++++
 .../sqlite/files/CVE-2020-11656.patch         | 70 +++++++++++++++++++
 meta/recipes-support/sqlite/sqlite3_3.31.1.bb |  2 +
 12 files changed, 244 insertions(+), 64 deletions(-)
 delete mode 100644 meta/recipes-core/musl/0001-Remove-using-.end-directive-with-clang.patch
 create mode 100644 meta/recipes-core/util-linux/util-linux/0001-include-cleanup-pidfd-inckudes.patch
 create mode 100644 meta/recipes-core/util-linux/util-linux/0001-kill-include-sys-types.h-before-checking-SYS_pidfd_s.patch
 create mode 100644 meta/recipes-support/sqlite/files/CVE-2020-11655.patch
 create mode 100644 meta/recipes-support/sqlite/files/CVE-2020-11656.patch

-- 
2.17.1

