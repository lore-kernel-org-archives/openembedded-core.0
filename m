Received: from mail-pj1-f67.google.com (mail-pj1-f67.google.com [209.85.216.67])
 by mx.groups.io with SMTP id smtpd.web10.3535.1590028839815093081
 for <openembedded-core@lists.openembedded.org>;
 Wed, 20 May 2020 19:40:40 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@sakoman-com.20150623.gappssmtp.com header.s=20150623 header.b=V1y9GHIJ;
 spf=softfail (domain: sakoman.com, ip: 209.85.216.67, mailfrom: steve@sakoman.com)
Received: by mail-pj1-f67.google.com with SMTP id n15so2286626pjt.4
        for <openembedded-core@lists.openembedded.org>; Wed, 20 May 2020 19:40:39 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=sakoman-com.20150623.gappssmtp.com; s=20150623;
        h=from:to:subject:date:message-id;
        bh=F0auI1G1LzFz2SKPDp3IvEdNQwYvbTHJXQjMmSpeJ8Q=;
        b=V1y9GHIJ06teDUiiv/GXH4LIV+ud81g2YoWrN6knbMnHl87DFtvudRiMcNTSgu2ESb
         9uJRBFavS8picID82kfOUBs/5ZX2sXk88/jaW6397xBztHpXd0X4hX5afoVO6VOTKfTu
         QmyAVVoRHLvARsA2ki6m4QMesG5MDIpFIBhXQGDVQfddcJtQfTIKSPZ8Cus/iXYkWJrK
         fMGbCgolPFNY1NE7mYXHID4noDcS7zysizxloT11ngvDINzgFxjtIvCtNpIuj23eOCxt
         ScWmPyUrWlSi5xszNfVQVduJYvNoqsH1QIjLIjhgV7FcVTMXspo407yuZjbOvFt60ZK1
         cNSA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:subject:date:message-id;
        bh=F0auI1G1LzFz2SKPDp3IvEdNQwYvbTHJXQjMmSpeJ8Q=;
        b=DdXUho7CziJ2qyZGunWzUVbhaeX8tJBMrOhdbyAsje0mJuJuPS0rGW6WzP4NYaEKHn
         STVGMtimvoVyOgvS0vh5ZWKBiMronHvccdrW7Nqa4r09wHU9KxyOZQgJ+q1Bh5RxHdCH
         fL++DJ+1fUWY/g7Hma0tva9l3KI9CLLT3ZmchbJoWeMofpK2EYFWtbQBDOC0UI8vOsQd
         yjrCpiUxrQ0Ua5V6Jd3dAdWl5CeZgMhCdaNBv6EN4u2HvFWzI0s6Wa8Lq4vuUiWV7fDW
         9i3xBwrEPkVxHCZcsqTT3OJ1DDCnlLLJY685rFmO45zRDQvLPkNc2CwiXwtcasSHBaEA
         /3YA==
X-Gm-Message-State: AOAM533tQyIZnO53BkprnfwoRFAcaFlefq6UQJy4mnHShHMs5r+pn7QZ
	AripebLia0Vqj4fCBQjCgKgpjcAIPZGRcA==
X-Google-Smtp-Source: ABdhPJy3W0eaeMsZE8FTx//TjMX7/NkA5Um80QA5VNoOy6RXZhTAS8Gi0ZgptGJJatqSDYCISbuUwA==
X-Received: by 2002:a17:90a:c78f:: with SMTP id gn15mr8524126pjb.103.1590028838412;
        Wed, 20 May 2020 19:40:38 -0700 (PDT)
Return-Path: <steve@sakoman.com>
Received: from octo.router0800d9.com (rrcs-66-91-142-162.west.biz.rr.com. [66.91.142.162])
        by smtp.gmail.com with ESMTPSA id 1sm3127065pff.151.2020.05.20.19.40.36
        for <openembedded-core@lists.openembedded.org>
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 20 May 2020 19:40:37 -0700 (PDT)
From: "Steve Sakoman" <steve@sakoman.com>
To: openembedded-core@lists.openembedded.org
Subject: [OE-core][dunfell 00/19] Pull request (cover letter only)
Date: Wed, 20 May 2020 16:40:25 -1000
Message-Id: <cover.1590028466.git.steve@sakoman.com>
X-Mailer: git-send-email 2.17.1

The following changes since commit 1a50634e56dfcb63eac0df1aa9cd7e6fb7bd470a:

  linux-yocto/5.4: update to v5.4.34 (2020-05-07 14:27:49 -1000)

are available in the Git repository at:

  git://git.openembedded.org/openembedded-core-contrib stable/dunfell-next
  http://cgit.openembedded.org/openembedded-core-contrib/log/?h=stable/dunfell-next

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

