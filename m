Received: from mail-pj1-f44.google.com (mail-pj1-f44.google.com [209.85.216.44])
 by mx.groups.io with SMTP id smtpd.web11.7674.1600313306922544605
 for <openembedded-core@lists.openembedded.org>;
 Wed, 16 Sep 2020 20:28:27 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@sakoman-com.20150623.gappssmtp.com header.s=20150623 header.b=hGDvkrX9;
 spf=softfail (domain: sakoman.com, ip: 209.85.216.44, mailfrom: steve@sakoman.com)
Received: by mail-pj1-f44.google.com with SMTP id b17so504268pji.1
        for <openembedded-core@lists.openembedded.org>; Wed, 16 Sep 2020 20:28:26 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=sakoman-com.20150623.gappssmtp.com; s=20150623;
        h=from:to:subject:date:message-id;
        bh=tuUp4Y7drVrea1X1vACFaEArcdrlBIK8wLNjNUx+aRQ=;
        b=hGDvkrX9SQYUM7MU29AjowWU/v1Aaado3IHij6NfwqQJ/L2JrnpJZ5xNmv1N1MIBA/
         blgXIgarvoXwSjVqFgjpjGYGL9JVYd5HO16IJVG1aDlwuSIVY/cHGU33QcyOt0OVWlva
         lsJrlaeLSKKAg15MOopFWerJD7+bl99BmhmBLFhpEyt62djUwvdyGlrfqlzFaN2ERW4v
         4x/L3T97cmLlAKjTpt/Nm+FWso8MF01JJSfTKrkjKqET4KTyMnYgFuj3WBGEWVCXr+3P
         xoEegmYX3ZT2owyROXrRePlvmw0ilLedjyMgklGDWcz/bdQKUi8Mo/4Y/J2+tNiwqcjM
         QSTA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:subject:date:message-id;
        bh=tuUp4Y7drVrea1X1vACFaEArcdrlBIK8wLNjNUx+aRQ=;
        b=iyD6b7WjQ2Bh2mXNm75Et/Ty3lyYQildFFKoHuF30h56V7nGCQn6X6NfWsukpIecLF
         LkvRekc2v+vkmzAmKbsTvBhhsPdnuNJ2J0X8QZOydoMvTcgeOOlcvnRMY1+kw/xa8sxH
         vH6z7CK105Wc59AZxbb/ClbcedmS/8qX1tGLmMCOhzHZ6rZh9DotXviPdr4TOmTX9iR1
         xZtBP8OX86QKRtBaeyLJwxIfJ8gqXiV6/WW/PlgAULePa5qncrX143ot8qBQ77iEI5a7
         Ru5lZKJ9S1K8VRRgCEvjq0R2H3HKXo0heO1uN53CmR61tTo8d/H5oajbwns6f7HofRfU
         MHUg==
X-Gm-Message-State: AOAM531nbOrvz9cBJyqPSEnrRe509ZgAlJ/euPs2TMQ+ybIMzg5R+WFS
	zIM5WwE+Cy3YWPBp8CUoW73nhdy7XckRgXVZehM=
X-Google-Smtp-Source: ABdhPJyCJcSMrivRyVCtiqlkdmhIrG4WoqTWZsu+LYuwzOWyYxHmD7pU46m997M9GPEttzHXhmxR9A==
X-Received: by 2002:a17:90b:797:: with SMTP id l23mr6555862pjz.176.1600313305780;
        Wed, 16 Sep 2020 20:28:25 -0700 (PDT)
Return-Path: <steve@sakoman.com>
Received: from octo.router0800d9.com (rrcs-66-91-142-162.west.biz.rr.com. [66.91.142.162])
        by smtp.gmail.com with ESMTPSA id j6sm18042758pfi.129.2020.09.16.20.28.24
        for <openembedded-core@lists.openembedded.org>
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 16 Sep 2020 20:28:25 -0700 (PDT)
From: "Steve Sakoman" <steve@sakoman.com>
To: openembedded-core@lists.openembedded.org
Subject: [OE-core][dunfell 00/23] Pull request (cover letter only)
Date: Wed, 16 Sep 2020 17:28:14 -1000
Message-Id: <cover.1600313233.git.steve@sakoman.com>
X-Mailer: git-send-email 2.17.1

The following changes since commit 210ebed1e9c2285d6e457bf03d1f1a1f3ddc7fda:

  package: get_package_mapping: avoid dependency mapping if renamed package provides original name (2020-09-04 04:31:45 -1000)

are available in the Git repository at:

  git://git.openembedded.org/openembedded-core-contrib stable/dunfell-next
  http://cgit.openembedded.org/openembedded-core-contrib/log/?h=stable/dunfell-next

Adrian Freihofer (1):
  oe-publish-sdk: fix layers init via ssh

Chris Laplante (4):
  cve-update-db-native: add progress handler
  cve-check/cve-update-db-native: use lockfile to fix usage under
    multiconfig
  cve-update-db-native: use context manager for cve_f
  cve-check: avoid FileNotFoundError if no do_cve_check task has run

Khem Raj (2):
  uninative: Upgrade to 2.9
  rpcbind: Use update-alternatives for rpcinfo

Lee Chee Yang (3):
  xserver-xorg: fix CVE-2020-14347
  qemu: fix CVE-2020-14364 CVE-2020-14415
  libx11 : fix CVE-2020-14344

Matt Madison (1):
  image.bbclass: fix REPRODUCIBLE_TIMESTAMP_ROOTFS reference

Oleksandr Kravchuk (1):
  ell: update to 0.33

Ovidiu Panait (1):
  libxml2: Fix CVE-2020-24977

Richard Purdie (3):
  runqemu: Add a hook to allow it to renice
  selftest/signing: Ensure build path relocation is safe
  oeqa/concurrencytest: Improve builddir path manipulations

Ross Burton (5):
  gdk-pixbuf: add tests PACKAGECONFIG
  insane: only load real files as ELF
  autoconf: consolidate DEPENDS
  curl: add vendors to CVE_PRODUCT to exclude false positives
  cmake: whitelist CVE-2016-10642

Zhixiong Chi (1):
  gnutls: CVE-2020-24659

akuster (1):
  cve-check.bbclass: always save cve report

 meta/classes/cve-check.bbclass                |  34 ++
 meta/classes/image.bbclass                    |   2 +-
 meta/classes/insane.bbclass                   |  13 +-
 meta/conf/distro/include/yocto-uninative.inc  |  10 +-
 meta/lib/oeqa/selftest/cases/signing.py       |   4 +-
 meta/lib/oeqa/selftest/context.py             |   4 +-
 .../ell/{ell_0.32.bb => ell_0.33.bb}          |   2 +-
 .../libxml/libxml2/CVE-2020-24977.patch       |  41 +++
 meta/recipes-core/libxml/libxml2_2.9.10.bb    |   1 +
 .../recipes-core/meta/cve-update-db-native.bb |  96 +++---
 meta/recipes-devtools/autoconf/autoconf.inc   |   5 +-
 meta/recipes-devtools/cmake/cmake.inc         |   4 +
 meta/recipes-devtools/qemu/qemu.inc           |   2 +
 .../qemu/qemu/CVE-2020-14364.patch            |  93 +++++
 .../qemu/qemu/CVE-2020-14415.patch            |  37 ++
 .../recipes-extended/rpcbind/rpcbind_1.2.5.bb |   5 +-
 .../gdk-pixbuf/gdk-pixbuf_2.40.0.bb           |   8 +-
 .../xorg-lib/libx11/CVE-2020-14344.patch      | 321 ++++++++++++++++++
 .../recipes-graphics/xorg-lib/libx11_1.6.9.bb |   4 +-
 .../xserver-xorg/CVE-2020-14347.patch         |  38 +++
 .../xorg-xserver/xserver-xorg_1.20.8.bb       |   1 +
 meta/recipes-support/curl/curl_7.69.1.bb      |   4 +-
 .../gnutls/gnutls/CVE-2020-24659.patch        | 117 +++++++
 meta/recipes-support/gnutls/gnutls_3.6.14.bb  |   1 +
 scripts/oe-publish-sdk                        |   2 +-
 scripts/runqemu                               |   5 +
 26 files changed, 781 insertions(+), 73 deletions(-)
 rename meta/recipes-core/ell/{ell_0.32.bb => ell_0.33.bb} (89%)
 create mode 100644 meta/recipes-core/libxml/libxml2/CVE-2020-24977.patch
 create mode 100644 meta/recipes-devtools/qemu/qemu/CVE-2020-14364.patch
 create mode 100644 meta/recipes-devtools/qemu/qemu/CVE-2020-14415.patch
 create mode 100644 meta/recipes-graphics/xorg-lib/libx11/CVE-2020-14344.patch
 create mode 100644 meta/recipes-graphics/xorg-xserver/xserver-xorg/CVE-2020-14347.patch
 create mode 100644 meta/recipes-support/gnutls/gnutls/CVE-2020-24659.patch

-- 
2.17.1

