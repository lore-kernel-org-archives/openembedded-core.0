Received: from mail-pf1-f194.google.com (mail-pf1-f194.google.com [209.85.210.194])
 by mx.groups.io with SMTP id smtpd.web12.4525.1588176680084704520
 for <openembedded-core@lists.openembedded.org>;
 Wed, 29 Apr 2020 09:11:20 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@sakoman-com.20150623.gappssmtp.com header.s=20150623 header.b=EuufDzAP;
 spf=softfail (domain: sakoman.com, ip: 209.85.210.194, mailfrom: steve@sakoman.com)
Received: by mail-pf1-f194.google.com with SMTP id z1so1290697pfn.3
        for <openembedded-core@lists.openembedded.org>; Wed, 29 Apr 2020 09:11:20 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=sakoman-com.20150623.gappssmtp.com; s=20150623;
        h=from:to:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=ekC6Mx6zhTBiIL9UdOO9JgFxRT6J9kru8hcrOfx50Ro=;
        b=EuufDzAPcIG343SmO5nSagfe0LFz0eQl2Cl/WJiF95n49fxtmrX1KjQ6fkUcQ+ME9z
         aulHqH8wVQ6h+A6/ecAMmt0IDAcxLVOV9luLTBW9Rs8ioScu7v8ZisWhGSMWmr7rQ2m2
         G5jEpmHD2WHK5Ku65L64adzgRqEbrKrE6T7UlA+D6LDCtrJAVaBvc19617GExi9Sz7YB
         z+c3kAReter4SYwXkj8itpkPHHtFWuKoo1vZQKjc0YY8i1gTLLVKaXhLSNzYxOuqxczy
         50mfTrFYRkiLd5UYMYD/2o21Y0uDbDI6duBZdNZBSvXZhY5Gxm8jpasOkqxxeFgCeo2R
         PkqQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=ekC6Mx6zhTBiIL9UdOO9JgFxRT6J9kru8hcrOfx50Ro=;
        b=npIvB3uD2KlSzAaQINwq7C6ChCfxc5fYj9U9Ug7vN9Pg1o523fiVbLiBmqWhC/uiF6
         7zb0p2VHozblyYA3XjASHf2WjhyDmUYEM5CmYOlrrKjXp8BME5Ga9rsoAEwypH1ewp/V
         Rr7opbFwfMAECZ40tqtf+01oSYPdJjEdgubyNMadEWuLeR83Lf1NckJLYipms4vkrQLM
         r/ktXGgfd8eufSlVjkL/+i3cRH8ZrHlIK8YesOKpT+Tqzo0PoEagJhAqTxx9GKrNxhU/
         iqHGDSfxdkR0c1oyMD96Knz0ya1LTZpWFpTpr4/Yu3GqDJV0VnsQqgbivPHcFpeRW4sL
         bkTA==
X-Gm-Message-State: AGi0PuYFxNJAoHbireyFIZqq41GqPbxrLgiLkyIyuOml0Y57cGSrOEXa
	nLtKLluSdttHja5vVEyA3COCxMWWP5Fb7g==
X-Google-Smtp-Source: APiQypKdlLT8TvRyZfcmD9QJRrARfMoljembR9124QLg7yqCIeXB1zVGLz+6U1d195TzJha1KCItYA==
X-Received: by 2002:a63:1b18:: with SMTP id b24mr8490228pgb.90.1588176678628;
        Wed, 29 Apr 2020 09:11:18 -0700 (PDT)
Return-Path: <steve@sakoman.com>
Received: from octo.router0800d9.com (rrcs-66-91-142-162.west.biz.rr.com. [66.91.142.162])
        by smtp.gmail.com with ESMTPSA id o1sm4833062pjs.39.2020.04.29.09.11.17
        for <openembedded-core@lists.openembedded.org>
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 29 Apr 2020 09:11:18 -0700 (PDT)
From: "Steve Sakoman" <steve@sakoman.com>
To: openembedded-core@lists.openembedded.org
Subject: [OE-core][dunfell 00/16] Patch review
Date: Wed, 29 Apr 2020 06:10:45 -1000
Message-Id: <cover.1588175775.git.steve@sakoman.com>
X-Mailer: git-send-email 2.17.1
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit

Please review this first set of changes for dunfell and have comments back
by end of day Friday.

Clean a-full build on autobuilder (other than tickling a Send QA Email bug):

https://autobuilder.yoctoproject.org/typhoon/#/builders/83/builds/898

The following changes since commit 1795f30d8ab73d35710ca99064c51190dc84853e:

  build-appliance-image: Update to master head revision (2020-04-07 22:15:32 +0100)

are available in the Git repository at:

  git://git.openembedded.org/openembedded-core-contrib stable/dunfell-next
  http://cgit.openembedded.org/openembedded-core-contrib/log/?h=stable/dunfell-next

Bartosz Golaszewski (1):
  qemuboot.bbclass: don't redefine IMGDEPLOYDIR

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

Richard Purdie (1):
  bzip2/pbzip2: Correct license information

Tim Orling (1):
  python3-manifest.json: add pathlib to core

Wang Mingyu (1):
  gnutls: upgrade 3.6.12 -> 3.6.13

Yi Zhao (1):
  alsa-state: ignore 'No soundcards found' error in pkg_postinst

hongxu (1):
  buildtools-tarball: add nativesdk-mtools for `wic ls'

 meta/classes/kernel-yocto.bbclass             |  6 +++
 meta/classes/qemuboot.bbclass                 |  1 -
 .../common-licenses/{bzip2 => bzip2-1.0.6}    |  0
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
 meta/recipes-extended/bzip2/bzip2_1.0.8.bb    |  2 +-
 meta/recipes-extended/pbzip2/pbzip2_1.1.13.bb |  2 +-
 meta/recipes-extended/timezone/tzdata.bb      |  8 +---
 .../{gnutls_3.6.12.bb => gnutls_3.6.13.bb}    |  4 +-
 21 files changed, 106 insertions(+), 133 deletions(-)
 rename meta/files/common-licenses/{bzip2 => bzip2-1.0.6} (100%)
 rename meta/recipes-core/ell/{ell_0.30.bb => ell_0.31.bb} (83%)
 create mode 100644 meta/recipes-core/musl/0001-Remove-using-.end-directive-with-clang.patch
 delete mode 100644 meta/recipes-core/musl/libucontext/0001-Makefile-Add-LIBDIR-variable.patch
 delete mode 100644 meta/recipes-core/musl/libucontext/0001-pass-LDFLAGS-to-link-step.patch
 rename meta/recipes-support/gnutls/{gnutls_3.6.12.bb => gnutls_3.6.13.bb} (93%)

-- 
2.17.1

