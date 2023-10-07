Return-Path: <steve@sakoman.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 6BDA9E95A70
	for <webhook@archiver.kernel.org>; Sat,  7 Oct 2023 22:25:32 +0000 (UTC)
Received: from mail-pl1-f181.google.com (mail-pl1-f181.google.com [209.85.214.181])
 by mx.groups.io with SMTP id smtpd.web10.27922.1696717523945089350
 for <openembedded-core@lists.openembedded.org>;
 Sat, 07 Oct 2023 15:25:24 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@sakoman-com.20230601.gappssmtp.com header.s=20230601 header.b=mxIN0Ysk;
 spf=softfail (domain: sakoman.com, ip: 209.85.214.181, mailfrom: steve@sakoman.com)
Received: by mail-pl1-f181.google.com with SMTP id d9443c01a7336-1c724577e1fso27198885ad.0
        for <openembedded-core@lists.openembedded.org>; Sat, 07 Oct 2023 15:25:23 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=sakoman-com.20230601.gappssmtp.com; s=20230601; t=1696717523; x=1697322323; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:to
         :from:from:to:cc:subject:date:message-id:reply-to;
        bh=ZNwt0usDH5gK46wmbbpoolEDOYWHJxxf7BD1ak9FKa0=;
        b=mxIN0YskVT5xf1jP33YMtgT0vRON9Grg7/nogzWjfbxZn4T+dhyH+exsjkDFAs2K7M
         oZIG904jop3XmtLJDRVaSqjiW01Qo0L1MPPOWcldxzmoGWC6wSQ6pz+IpRaMD6fS5wNz
         LqtjbaKzPlHNpK/Gm9mbEaXGrKdl8/IX+kAhFDp3gWD4W+BsGB0OjoJ6HmPN5o2KJq5R
         dmFuYRhr4XfZ66sjsUXynDNZnU3Pm67IAHuHZekAe4AgLtFA8MNOTyLcFDYHpXlapSu/
         KtsTTeM8HuLAcRg0FhMQVxSMo2DdO/QeXpYf3zLjH/XuzGm/TCrppLI9uK2OSU0/qZ16
         pI6A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1696717523; x=1697322323;
        h=content-transfer-encoding:mime-version:message-id:date:subject:to
         :from:x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=ZNwt0usDH5gK46wmbbpoolEDOYWHJxxf7BD1ak9FKa0=;
        b=ZGcN2EsRvC1VNAYJnI0WSI1h8o39TBCULrL5S7TU8bb0GvWPla4JppJnuZC3s7kjU7
         lx/KVWdRS2XTmjsI8R/+4TuqYPLjLXrnRyQcyuusb85T1441N77qPY/41RmnnfhztCJp
         oowV61AqXxvM67TfrfgMQP2yI1d5E6zfJheUukte3XFfSqPYPGt/0s2iotZk5hxQzgs5
         x2Tap/xVO9rqJKxe99ZV0xZOdR9Ok+j6pLJBSrUGZL0TdYfcVujM2oObmXa9Xi9ZbNdB
         Pcn5YUEFbRpzTyAh8cczdTe7XtkcE7h0S22QLGzFZ58EFUIpHcsq5xIQTlb/MtPqdnlD
         3qEg==
X-Gm-Message-State: AOJu0YwDTjZhaG0PrbbRgEu/L+rDrr/yBIbytFr7qQpOBAD77DiS8riN
	ouBgcI+Xwi6hI7t2yoy+BzK9SBow2t/fSRHSdzw=
X-Google-Smtp-Source: AGHT+IGhAtTmn0euLiqrifZ0/Pb9amTgn1eAzu0gqWgfYbFdFu6ECFl+XmkFlX/wlVz8v/eMWyKuJQ==
X-Received: by 2002:a17:902:cec7:b0:1c9:9144:5740 with SMTP id d7-20020a170902cec700b001c991445740mr398505plg.2.1696717522504;
        Sat, 07 Oct 2023 15:25:22 -0700 (PDT)
Received: from hexa.router0800d9.com (dhcp-72-234-106-30.hawaiiantel.net. [72.234.106.30])
        by smtp.gmail.com with ESMTPSA id jj15-20020a170903048f00b001b8c6890623sm6424076plb.7.2023.10.07.15.25.21
        for <openembedded-core@lists.openembedded.org>
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 07 Oct 2023 15:25:22 -0700 (PDT)
From: Steve Sakoman <steve@sakoman.com>
To: openembedded-core@lists.openembedded.org
Subject: [OE-core][mickledore 00/19] Patch review
Date: Sat,  7 Oct 2023 12:24:56 -1000
Message-Id: <cover.1696702947.git.steve@sakoman.com>
X-Mailer: git-send-email 2.34.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Sat, 07 Oct 2023 22:25:32 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/188801

Please review this set of changes for mickledore and have comments back by
end of day Tuesday October 10.

Passed a-full on autobuilder:

https://autobuilder.yoctoproject.org/typhoon/#/builders/83/builds/5994

The following changes since commit 9e7aaefc0d764eaecf35582bb19490cc6262f966:

  glibc: stable 2.37 branch updates. (2023-10-05 04:43:37 -1000)

are available in the Git repository at:

  https://git.openembedded.org/openembedded-core-contrib stable/mickledore-nut
  https://git.openembedded.org/openembedded-core-contrib/log/?h=stable/mickledore-nut

Benjamin Bara (4):
  README: fix mail address in git example command
  pixman: avoid neon on unsupported machines
  nettle: avoid neon on unsupported machines
  ffmpeg: avoid neon on unsupported machines

Bruce Ashfield (3):
  linux-yocto/6.1: fix CONFIG_F2FS_IO_TRACE configuration warning
  linux-yocto/6.1: update to v6.1.50
  linux-yocto/6.1: update to v6.1.51

Khem Raj (1):
  tcl: Add a way to skip ptests

Peter Marko (1):
  gcc-runtime: remove bashism

Sean Nyekjaer (1):
  gcc: depend on zstd

Soumya Sambu (1):
  qemu: Fix CVE-2023-3180

Wang Mingyu (6):
  ell: upgrade 0.57 -> 0.58
  libconvert-asn1-perl: upgrade 0.33 -> 0.34
  librepo: upgrade 1.15.1 -> 1.15.2
  libsndfile1: upgrade 1.2.0 -> 1.2.2
  mpfr: upgrade 4.2.0 -> 4.2.1
  xz: upgrade 5.4.3 -> 5.4.4

Yogita Urade (1):
  qemu: fix CVE-2023-42467

Yuta Hayama (1):
  linux/generate-cve-exclusions: print the generated time in UTC

 README.OE-Core.md                             |  2 +-
 .../ell/{ell_0.57.bb => ell_0.58.bb}          |  2 +-
 meta/recipes-devtools/gcc/gcc-12.3.inc        |  2 +-
 meta/recipes-devtools/gcc/gcc-runtime.inc     |  2 +-
 .../{librepo_1.15.1.bb => librepo_1.15.2.bb}  |  2 +-
 meta/recipes-devtools/qemu/qemu.inc           |  2 +
 .../qemu/qemu/CVE-2023-3180.patch             | 52 +++++++++++++++++++
 .../qemu/qemu/CVE-2023-42467.patch            | 49 +++++++++++++++++
 meta/recipes-devtools/tcltk/tcl/run-ptest     |  4 +-
 meta/recipes-devtools/tcltk/tcl_8.6.13.bb     |  5 ++
 ...l_0.33.bb => libconvert-asn1-perl_0.34.bb} |  2 +-
 .../xz/{xz_5.4.3.bb => xz_5.4.4.bb}           |  2 +-
 .../xorg-lib/pixman_0.42.2.bb                 |  3 ++
 .../linux/generate-cve-exclusions.py          |  2 +-
 .../linux/linux-yocto-rt_6.1.bb               |  6 +--
 .../linux/linux-yocto-tiny_6.1.bb             |  6 +--
 meta/recipes-kernel/linux/linux-yocto_6.1.bb  | 28 +++++-----
 .../recipes-multimedia/ffmpeg/ffmpeg_5.1.3.bb |  2 +
 ...sndfile1_1.2.0.bb => libsndfile1_1.2.2.bb} |  2 +-
 .../mpfr/{mpfr_4.2.0.bb => mpfr_4.2.1.bb}     |  2 +-
 meta/recipes-support/nettle/nettle_3.8.1.bb   |  3 ++
 21 files changed, 148 insertions(+), 32 deletions(-)
 rename meta/recipes-core/ell/{ell_0.57.bb => ell_0.58.bb} (89%)
 rename meta/recipes-devtools/librepo/{librepo_1.15.1.bb => librepo_1.15.2.bb} (94%)
 create mode 100644 meta/recipes-devtools/qemu/qemu/CVE-2023-3180.patch
 create mode 100644 meta/recipes-devtools/qemu/qemu/CVE-2023-42467.patch
 rename meta/recipes-extended/perl/{libconvert-asn1-perl_0.33.bb => libconvert-asn1-perl_0.34.bb} (91%)
 rename meta/recipes-extended/xz/{xz_5.4.3.bb => xz_5.4.4.bb} (95%)
 rename meta/recipes-multimedia/libsndfile/{libsndfile1_1.2.0.bb => libsndfile1_1.2.2.bb} (92%)
 rename meta/recipes-support/mpfr/{mpfr_4.2.0.bb => mpfr_4.2.1.bb} (91%)

-- 
2.34.1


