Received: from mail-pl1-f196.google.com (mail-pl1-f196.google.com [209.85.214.196])
 by mx.groups.io with SMTP id smtpd.web10.830.1589820535203488910
 for <openembedded-core@lists.openembedded.org>;
 Mon, 18 May 2020 09:48:55 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@sakoman-com.20150623.gappssmtp.com header.s=20150623 header.b=yn/iLHL0;
 spf=softfail (domain: sakoman.com, ip: 209.85.214.196, mailfrom: steve@sakoman.com)
Received: by mail-pl1-f196.google.com with SMTP id a13so2907104pls.8
        for <openembedded-core@lists.openembedded.org>; Mon, 18 May 2020 09:48:55 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=sakoman-com.20150623.gappssmtp.com; s=20150623;
        h=from:to:subject:date:message-id;
        bh=HoxAmCo4FFer5fBqvoJZ0033QiwISRX5Max7vQRWhgA=;
        b=yn/iLHL05IPa5iNR7Eh4Guu6VTf1skUggZ4Ynszn9IF5G4DVWEUNZfsjXR7SsVVLRl
         5mOXVYBIIDV5Fw/ke/SQIfKGJOu5TTl72VAl0yxzHglAiRfOO00aUIwRbRXGqosYDEHz
         PPvWRoAvFd4DC7bdA9YUGZ3JaEbcRbDUVjeDBdQyerEm+IfjTDiru6QHj0ckIjFeSBRL
         IreCY/DlR1tUD1rRdhhcqlHzv/9awj9Ko51nh442oXUQbvlkeiJVFT9P6E9hnxmSenki
         jfH30u+SMPkTrbzs14ANAhoL4HR/O+lnj773j2qSndJWCZ4o33W1phAMjD3YMfTHrd55
         hdRg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:subject:date:message-id;
        bh=HoxAmCo4FFer5fBqvoJZ0033QiwISRX5Max7vQRWhgA=;
        b=TddCkDUch/n5SAT0iN8Qs98yOT7n2rQB0MhXbo+24mvGOTgrlGVIxUkeXHyw4tpBXT
         smHSaI/6K1oLAItIXvHC1RogNV/cU59uzh4k5fNKobhlqGb66xOe7H95utl/umHMOPw2
         94fwGmAai3Y/v9UARNw3L/dCOAIGtLyPz47grzkCTFdYNXe7BG+UvhnPNU3tkqqsNou9
         6891akvMbIP83YCY3ZP+8dblOyXqnbnX6aX+RmR023eSvpEs/WMuVLnEW2ZEFxJMvkzO
         OpNsMrZVc/nOic6hw3N+vsidRGVX3EnP6I6udfrhbg+YmBC1eD+My7yoQw76K0sHMTlk
         WFrg==
X-Gm-Message-State: AOAM530VvZMM0LVPP1tmiYeqabgw1VJuxZPgeCT0Eca7TEo42n87ed/8
	d9DN1kOKJdy3WO5fJQTEaeCC/qhicgMStg==
X-Google-Smtp-Source: ABdhPJyUDCXUuHiuLF4SPkB2CE+E96n0lrhycWa4HgK+SA/16VI+YXh0sZssguThWmjmr2dEoZIXtA==
X-Received: by 2002:a17:90a:2487:: with SMTP id i7mr294125pje.119.1589820534037;
        Mon, 18 May 2020 09:48:54 -0700 (PDT)
Return-Path: <steve@sakoman.com>
Received: from octo.router0800d9.com (rrcs-66-91-142-162.west.biz.rr.com. [66.91.142.162])
        by smtp.gmail.com with ESMTPSA id g6sm62869pjx.48.2020.05.18.09.48.52
        for <openembedded-core@lists.openembedded.org>
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 18 May 2020 09:48:53 -0700 (PDT)
From: "Steve Sakoman" <steve@sakoman.com>
To: openembedded-core@lists.openembedded.org
Subject: [OE-core][dunfell 00/19] Patch review
Date: Mon, 18 May 2020 06:48:19 -1000
Message-Id: <cover.1589820010.git.steve@sakoman.com>
X-Mailer: git-send-email 2.17.1

Please review this next set of patches for dunfell and have comments back
by end of day Wednesday.

The following changes since commit 1a50634e56dfcb63eac0df1aa9cd7e6fb7bd470a:

  linux-yocto/5.4: update to v5.4.34 (2020-05-07 14:27:49 -1000)

are available in the Git repository at:

  git://git.openembedded.org/openembedded-core-contrib stable/dunfell-nut
  http://cgit.openembedded.org/openembedded-core-contrib/log/?h=stable/dunfell-nut

Alejandro Hernandez (1):
  connman: Include vpn-script in FILES

Alexander Kanavin (4):
  meson: fix upstream version check
  cdrtools-native: fix upstream version check
  re2c: correct upstream location
  webkitgtk: update to 2.28.2 to fix multiple CVE's

Anton Eliasson (1):
  meson.bbclass: Close the log file after reading

Jacob Kroon (1):
  pseudo: Fix enum typedef

Joe Slater (1):
  wget: improve reproducible build

Joshua Watt (2):
  libnewt: Backport patch to fix reproducibility
  bitbake.conf: Prevent git from detecting parent repo in recipe

Konrad Weihmann (2):
  pypi.bbclass: mind package suffix on version check
  file: add PACKAGECONFIG for auto options

Mingli Yu (1):
  python3-setuptools: add the missing rdepends

Peter Kjellerstedt (1):
  sstate.bbclass: Do not fail if files cannot be touched

Robert P. J. Day (1):
  documentation.conf: Add variables supported by features_check.bbclass

Tim Orling (1):
  pypi.bbclass: use new pypi UPSTREAM_CHECK_URI

Yeoh Ee Peng (1):
  selftest/imagefeatures: Enable sanity test for IMAGE_GEN_DEBUGFS

Yi Zhao (1):
  opkg-keyrings: check if opkg-key exists before run postinst

jan (1):
  scripts/tiny/ksize: Fix for more recent kernels

 meta/classes/meson.bbclass                    |  3 +-
 meta/classes/pypi.bbclass                     |  4 +-
 meta/classes/sstate.bbclass                   | 15 +++++--
 meta/conf/bitbake.conf                        |  6 ++-
 meta/conf/documentation.conf                  | 11 ++++-
 meta/lib/oeqa/selftest/cases/imagefeatures.py | 32 +++++++++++++++
 meta/recipes-connectivity/connman/connman.inc |  3 +-
 .../cdrtools/cdrtools-native_3.01.bb          |  1 -
 meta/recipes-devtools/file/file_5.38.bb       | 10 ++++-
 meta/recipes-devtools/meson/meson.inc         |  1 +
 .../opkg/opkg-keyrings_1.0.bb                 |  5 ++-
 .../0001-pseudo_ipc.h-Fix-enum-typedef.patch  | 31 ++++++++++++++
 meta/recipes-devtools/pseudo/pseudo_git.bb    |  1 +
 .../python/python-setuptools.inc              |  1 +
 ...-t-ignore-CFLAGS-when-building-snack.patch | 29 +++++++++++++
 .../newt/files/pie-flags.patch                | 41 -------------------
 meta/recipes-extended/newt/libnewt_0.52.21.bb |  4 +-
 .../wget/0002-improve-reproducibility.patch   |  9 +++-
 .../webkitgtk/0001-Fix-build-with-musl.patch  | 30 +++++++-------
 ...tings-so-that-gtkdoc-generation-work.patch |  8 ++--
 .../webkit/webkitgtk/x32_support.patch        | 30 --------------
 ...ebkitgtk_2.26.4.bb => webkitgtk_2.28.2.bb} |  5 +--
 meta/recipes-support/re2c/re2c_1.0.1.bb       |  3 +-
 scripts/tiny/ksize.py                         |  6 +--
 24 files changed, 173 insertions(+), 116 deletions(-)
 create mode 100644 meta/recipes-devtools/pseudo/files/0001-pseudo_ipc.h-Fix-enum-typedef.patch
 create mode 100644 meta/recipes-extended/newt/files/0002-don-t-ignore-CFLAGS-when-building-snack.patch
 delete mode 100644 meta/recipes-extended/newt/files/pie-flags.patch
 delete mode 100644 meta/recipes-sato/webkit/webkitgtk/x32_support.patch
 rename meta/recipes-sato/webkit/{webkitgtk_2.26.4.bb => webkitgtk_2.28.2.bb} (97%)

-- 
2.17.1

