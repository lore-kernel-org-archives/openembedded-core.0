Received: from mail-pf1-f175.google.com (mail-pf1-f175.google.com [209.85.210.175])
 by mx.groups.io with SMTP id smtpd.web11.62217.1600092722500190747
 for <openembedded-core@lists.openembedded.org>;
 Mon, 14 Sep 2020 07:12:02 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@sakoman-com.20150623.gappssmtp.com header.s=20150623 header.b=KrqYCLY3;
 spf=softfail (domain: sakoman.com, ip: 209.85.210.175, mailfrom: steve@sakoman.com)
Received: by mail-pf1-f175.google.com with SMTP id o20so12719198pfp.11
        for <openembedded-core@lists.openembedded.org>; Mon, 14 Sep 2020 07:12:02 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=sakoman-com.20150623.gappssmtp.com; s=20150623;
        h=from:to:subject:date:message-id;
        bh=Dj27e6DIrUPKjiZGbwSNBFK8ynAzB5JcJ0m2bO+UaOk=;
        b=KrqYCLY3YfoCjYpgI6avke6D5Wk7luCziERVhKySL8WUsnKaK2/08cFiBuv5/EEkDE
         AzYudFBuePCUhBXqf+Yg/loiuWLVm9Qgq97c1cf8X5XlT6anxZrRRtgQmxp58U80xhxn
         mImWU8Jr8xGpiP9v4DG00ScBFf9Qzcb1o8ahWTdHPimKYRlNrfo0H14k1lwMPi22s9F8
         93QI1A2YKiPMHPIIZmA5WlpyPcFfrkmPEbveeYw6gZtRltfrp/V7C+zt1BM/i6GwU+41
         rxbI6q6hTcwQvnJX9vXlhOpOnhYjM6fyi+08ivfJ1SSQyOyu+VKppWnQu4juzhHxeIrp
         QC6A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:subject:date:message-id;
        bh=Dj27e6DIrUPKjiZGbwSNBFK8ynAzB5JcJ0m2bO+UaOk=;
        b=d1ooV2pKLCOzQgkuY+NOS+pNqdI/nSj6aKefE1yLaRFOp754E6to3ucd+mKXg2JUjk
         F6InG4iUJdfxl5EWim+k0Wp+FjrFeZVwH6aJkYH4B20hd3lyGDy+o0QHYZmfZAW7/+Z9
         HR16P76ffChBJsz+NBNdbywMVehS3oCP4g67oT8+SONbONsetTH1UDM+aXe9mUzOgIfE
         rON9OfWD/5JBh5e5uoD4bSTJ/eZSj5/E9yQ/PAgoEr45lbj00cQ6ElPXWEetKmqaPpny
         SmzwVBDk2Z105q2oU8qY3GFke4djJduUPNf1Hl/JppwtLbINKCIQPY7/hlPhJUYYvE9K
         /Eqg==
X-Gm-Message-State: AOAM530Mr6RHR48C9fx7ZT61dZ0CwJTmOh20sUALlOTHuMZ5ksiKcixS
	l9bL8GkZwB4LGzpL/GrT4C1bIObmoMlV/6KBQWE=
X-Google-Smtp-Source: ABdhPJyY4qEAO/U9pAQsSG3VIX+lt49+AHZivDiSZa50wtj3t5P3q+XjDXJdcFm5fr0g2BySH0asYA==
X-Received: by 2002:a63:c9:: with SMTP id 192mr11214001pga.37.1600092721245;
        Mon, 14 Sep 2020 07:12:01 -0700 (PDT)
Return-Path: <steve@sakoman.com>
Received: from octo.router0800d9.com (rrcs-66-91-142-162.west.biz.rr.com. [66.91.142.162])
        by smtp.gmail.com with ESMTPSA id z22sm11053183pjq.2.2020.09.14.07.11.59
        for <openembedded-core@lists.openembedded.org>
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 14 Sep 2020 07:12:00 -0700 (PDT)
From: "Steve Sakoman" <steve@sakoman.com>
To: openembedded-core@lists.openembedded.org
Subject: [OE-core][dunfell 00/24] Patch review
Date: Mon, 14 Sep 2020 04:11:18 -1000
Message-Id: <cover.1600092418.git.steve@sakoman.com>
X-Mailer: git-send-email 2.17.1

Please review this next set of patches for dunfell and have comments back
by end of day Wednesday.

Passed a-full on autobuilder:

https://autobuilder.yoctoproject.org/typhoon/#/builders/83/builds/1381

The following changes since commit 210ebed1e9c2285d6e457bf03d1f1a1f3ddc7fda:

  package: get_package_mapping: avoid dependency mapping if renamed package provides original name (2020-09-04 04:31:45 -1000)

are available in the Git repository at:

  git://git.openembedded.org/openembedded-core-contrib stable/dunfell-nut
  http://cgit.openembedded.org/openembedded-core-contrib/log/?h=stable/dunfell-nut

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

Rahul Kumar (1):
  systemd-serialgetty: Fix sed expression quoting

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
 .../systemd/systemd-serialgetty.bb            |   2 +-
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
 27 files changed, 782 insertions(+), 74 deletions(-)
 rename meta/recipes-core/ell/{ell_0.32.bb => ell_0.33.bb} (89%)
 create mode 100644 meta/recipes-core/libxml/libxml2/CVE-2020-24977.patch
 create mode 100644 meta/recipes-devtools/qemu/qemu/CVE-2020-14364.patch
 create mode 100644 meta/recipes-devtools/qemu/qemu/CVE-2020-14415.patch
 create mode 100644 meta/recipes-graphics/xorg-lib/libx11/CVE-2020-14344.patch
 create mode 100644 meta/recipes-graphics/xorg-xserver/xserver-xorg/CVE-2020-14347.patch
 create mode 100644 meta/recipes-support/gnutls/gnutls/CVE-2020-24659.patch

-- 
2.17.1

