Received: from mail-pg1-f195.google.com (mail-pg1-f195.google.com [209.85.215.195])
 by mx.groups.io with SMTP id smtpd.web11.454.1588286222851803020
 for <openembedded-core@lists.openembedded.org>;
 Thu, 30 Apr 2020 15:37:02 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@sakoman-com.20150623.gappssmtp.com header.s=20150623 header.b=eGyBjOSL;
 spf=softfail (domain: sakoman.com, ip: 209.85.215.195, mailfrom: steve@sakoman.com)
Received: by mail-pg1-f195.google.com with SMTP id r4so3634255pgg.4
        for <openembedded-core@lists.openembedded.org>; Thu, 30 Apr 2020 15:37:02 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=sakoman-com.20150623.gappssmtp.com; s=20150623;
        h=from:to:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=QvCqm84gLO33qqOKGXU+RBjU0hqrvnsR6V8UBSpzBQg=;
        b=eGyBjOSLkjnbhXLXL2FN6NcqO8d5PX/cWA+gqkrkoQz8SqPrNW6JCQYQZ49YeRWy3m
         JjvF+YiN3QpYW4M+DKZxQmMUnOtQVBGcnY+9RE38nM4jDQDynPpdzLrC/8ByfrWc711B
         usZs0W/aT3DUszgyiCzxsDAk4XS1BYZBxVMibJgo/LBs7Xj133YKRTexty4c3JZOUIR9
         lBFs2xPFFFXY0UJsSFAjUc+Nlz2GTyG+WXJLji8iPcN1aQfm1isniFdiPq5RhlbESyGV
         aXG0DdMuoO6ISgo1VADA3P3RxHwEABrVUuqJ6pnSj/sG75dZQO87u3OC+68JVD1GhFTA
         HiQQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=QvCqm84gLO33qqOKGXU+RBjU0hqrvnsR6V8UBSpzBQg=;
        b=OX/WEiz5GymtaTYPnI98L4ds69LvkqlISoM0h9BtMNsYy7zcjWAPrXUiLVLhI3Ujil
         wWCA7U2And7NiOuXmBTxC6EQwK4lJmL4svHMsOXmxUjY4Sf04wdFv4iLrKsXdL78qO8h
         0WE9oBdx1CAYDUE9l5JELJ1yEfhFtosSIxmBjk4gkU04t3otVXHq1pCCjwTMgBfWLJBU
         v5BthXyBjjUtJUwxEQDX/C38eKjcwgRDv89niUCIWFrGKbi0vrNAoH5Lkqz26sbAfTUz
         zmTj6n0B+hgAv8B3j5yiNxIvwIKHsiMXOPg+olYUVyak843MWwTRSI2yo0RZZG5f0yOG
         Zykw==
X-Gm-Message-State: AGi0PuYElNUrbiorZPCj15Q3Qju88bngbsd9+4Sxm0xaQFRySqt4dnq4
	6xqPQEUhd6NIQDJmFjvy7BVm7bRr+Jud5A==
X-Google-Smtp-Source: APiQypIfypDLIUZCL7P/8uQoyFEiJwt6qNvRjZHTZOjRSWpjDfowtgFk0EEGKhWmk4jB02jb3SWmdg==
X-Received: by 2002:a65:4b8d:: with SMTP id t13mr1117061pgq.388.1588285835545;
        Thu, 30 Apr 2020 15:30:35 -0700 (PDT)
Return-Path: <steve@sakoman.com>
Received: from octo.router0800d9.com (rrcs-66-91-142-162.west.biz.rr.com. [66.91.142.162])
        by smtp.gmail.com with ESMTPSA id d124sm646011pfa.98.2020.04.30.15.30.33
        for <openembedded-core@lists.openembedded.org>
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 30 Apr 2020 15:30:34 -0700 (PDT)
From: "Steve Sakoman" <steve@sakoman.com>
To: openembedded-core@lists.openembedded.org
Subject: [OE-core][dunfell v2 00/14] Patch review
Date: Thu, 30 Apr 2020 12:30:05 -1000
Message-Id: <cover.1588285073.git.steve@sakoman.com>
X-Mailer: git-send-email 2.17.1
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit

As discussed in the comments to v1, I'll be dropping two patches from v1:

  qemuboot.bbclass: don't redefine IMGDEPLOYDIR
  bzip2/pbzip2: Correct license information

Please send any further comments by end of day tomorrow Friday May 1.

The following changes since commit 1795f30d8ab73d35710ca99064c51190dc84853e:

  build-appliance-image: Update to master head revision (2020-04-07 22:15:32 +0100)

are available in the Git repository at:

  git://git.openembedded.org/openembedded-core-contrib stable/dunfell-next
  http://cgit.openembedded.org/openembedded-core-contrib/log/?h=stable/dunfell-next

Changqing Li (1):
  parselogs.py: ignore pulseaudio startup warning messages

Denys Dmytriyenko (1):
  u-boot.inc: install u-boot-initial-env as ${PN}-initial-env in $D and
    $DEPLOYDIR

Jeremy Puhlman (3):
  qemu-system-native: Fix commented out PACKAGECONFIG
  nativesdk-gcc-runtime: enable building libstdc++.a
  buildtools-extended-tarball: Add libstc++.a

Khem Raj (2):
  libucontext: Bring in mips/mips64 support
  ruby: Link with libucontext on musl

Maxime Roussin-B?langer (1):
  tzdata: remove exit 0 from pkg_postinst

Paul Barker (1):
  kernel-yocto.bbclass: Fix deps when externalsrc is used

Pierre-Jean Texier (1):
  ell: upgrade 0.30 -> 0.31

Tim Orling (1):
  python3-manifest.json: add pathlib to core

Wang Mingyu (1):
  gnutls: upgrade 3.6.12 -> 3.6.13

Yi Zhao (1):
  alsa-state: ignore 'No soundcards found' error in pkg_postinst

hongxu (1):
  buildtools-tarball: add nativesdk-mtools for `wic ls'

 meta/classes/kernel-yocto.bbclass             |  6 +++
 meta/lib/oeqa/runtime/cases/parselogs.py      |  4 +-
 meta/recipes-bsp/alsa-state/alsa-state.bb     |  2 +-
 meta/recipes-bsp/u-boot/u-boot.inc            | 28 +++++------
 .../ell/{ell_0.30.bb => ell_0.31.bb}          |  4 +-
 .../meta/buildtools-extended-tarball.bb       |  1 +
 meta/recipes-core/meta/buildtools-tarball.bb  |  1 +
 ...move-using-.end-directive-with-clang.patch | 36 ++++++++++++++
 .../0001-Makefile-Add-LIBDIR-variable.patch   | 46 ------------------
 .../0001-pass-LDFLAGS-to-link-step.patch      | 31 ------------
 meta/recipes-core/musl/libucontext_git.bb     | 48 +++++++++----------
 meta/recipes-devtools/gcc/gcc-runtime.inc     |  2 +
 .../python/python3/python3-manifest.json      |  2 +
 meta/recipes-devtools/qemu/qemu.inc           |  2 +-
 meta/recipes-devtools/ruby/ruby_2.7.0.bb      |  9 +++-
 meta/recipes-extended/timezone/tzdata.bb      |  8 +---
 .../{gnutls_3.6.12.bb => gnutls_3.6.13.bb}    |  4 +-
 17 files changed, 104 insertions(+), 130 deletions(-)
 rename meta/recipes-core/ell/{ell_0.30.bb => ell_0.31.bb} (83%)
 create mode 100644 meta/recipes-core/musl/0001-Remove-using-.end-directive-with-clang.patch
 delete mode 100644 meta/recipes-core/musl/libucontext/0001-Makefile-Add-LIBDIR-variable.patch
 delete mode 100644 meta/recipes-core/musl/libucontext/0001-pass-LDFLAGS-to-link-step.patch
 rename meta/recipes-support/gnutls/{gnutls_3.6.12.bb => gnutls_3.6.13.bb} (93%)

-- 
2.17.1

