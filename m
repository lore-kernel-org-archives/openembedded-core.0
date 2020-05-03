Received: from mail-pl1-f195.google.com (mail-pl1-f195.google.com [209.85.214.195])
 by mx.groups.io with SMTP id smtpd.web11.32483.1588545569230050312
 for <openembedded-core@lists.openembedded.org>;
 Sun, 03 May 2020 15:39:29 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@sakoman-com.20150623.gappssmtp.com header.s=20150623 header.b=gZr0Yx3p;
 spf=softfail (domain: sakoman.com, ip: 209.85.214.195, mailfrom: steve@sakoman.com)
Received: by mail-pl1-f195.google.com with SMTP id w3so6048736plz.5
        for <openembedded-core@lists.openembedded.org>; Sun, 03 May 2020 15:39:29 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=sakoman-com.20150623.gappssmtp.com; s=20150623;
        h=from:to:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=rqkscTA+1Qr2veHLdZI4h/jVYyPyvbolMrRolpjHN7Y=;
        b=gZr0Yx3pONxXhVUHHhbbogyXbb0H1DnH1bKcPA70ZXjrbhDnqoZu9yYem+S/9BGabD
         7IJ2GHxPgAphXU+z9GsK2WMDc8547e7NiTrhlis4SejDiwjzougMw/NdhQTcufpeWd4n
         2VxeIzHx2vamTwMpHTDVHrKu6OahAr425gXkUclTT6J1BV/c2FEXH8haEVW1dAZnZ6P7
         Lst8VHC0X2QbNhMdI96hn9A7+1bPY56sIUGvbgT2CxJRS5ABPrPQZLNjhgHNRz4lvx55
         uLOoc2Lw/9NP7nLo290U9qoCb4vDDvgLNWPmw+3Grc45cphhEfRQj2jMM+JiWF3jLVGL
         f2cg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=rqkscTA+1Qr2veHLdZI4h/jVYyPyvbolMrRolpjHN7Y=;
        b=VUYkVdQVN9Yfcwg8QNpVd4xrbB8BRTX3jVijVjVmw5ciFbb2SGHAHsbZNPANqyocwS
         W40lygthrtyAUNoZcOAT38fDS38JowoJypUUX2adgB1Lf8Nicd+85bDb8rAt1lvVIABb
         azCSlHqlNDyaB3O6JF4q+P7F9O9cIaaJ4Mp9EHA9dK2urmCzrR7KEX2mpAUnMEKmbAP1
         azynNCemiInMjPH0qOwdG0fDTSPhIp0xnnHxIAH2Tuqmc7UOvijcPwBZ0q1+MeZcsj+k
         a1xmAfkAdJp9NcrbF4M/IaDZKT3w9mKdw+IeE8ajWnRHmbOZT+ty5IafdNYSR9vnIfNN
         bDTg==
X-Gm-Message-State: AGi0PuaZcRatpQxxEyhQtU1zQ/liBdADbX017xFawV3LLWFgajoGV96S
	u9CKZyLfpE0mZuk403AdMxbnFAxWXgp9Aw==
X-Google-Smtp-Source: APiQypJE3F9Ufh2bnnowMorrGFjyqk/XjZfx+NDnwkjyp9ZAslpBm52VzVCp4L2n6av2TwDyiGozqg==
X-Received: by 2002:a17:90a:270d:: with SMTP id o13mr13840427pje.34.1588545567840;
        Sun, 03 May 2020 15:39:27 -0700 (PDT)
Return-Path: <steve@sakoman.com>
Received: from octo.router0800d9.com (rrcs-66-91-142-162.west.biz.rr.com. [66.91.142.162])
        by smtp.gmail.com with ESMTPSA id p64sm5147680pjp.7.2020.05.03.15.39.26
        for <openembedded-core@lists.openembedded.org>
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 03 May 2020 15:39:27 -0700 (PDT)
From: "Steve Sakoman" <steve@sakoman.com>
To: openembedded-core@lists.openembedded.org
Subject: [OE-core][dunfell 00/14] Pull request for dunfell (cover letter only)
Date: Sun,  3 May 2020 12:39:11 -1000
Message-Id: <cover.1588545160.git.steve@sakoman.com>
X-Mailer: git-send-email 2.17.1
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit

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

