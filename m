Received: from mail-pl1-f182.google.com (mail-pl1-f182.google.com [209.85.214.182])
 by mx.groups.io with SMTP id smtpd.web08.17729.1610490963837309768
 for <openembedded-core@lists.openembedded.org>;
 Tue, 12 Jan 2021 14:36:04 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@sakoman-com.20150623.gappssmtp.com header.s=20150623 header.b=C/auc3iW;
 spf=softfail (domain: sakoman.com, ip: 209.85.214.182, mailfrom: steve@sakoman.com)
Received: by mail-pl1-f182.google.com with SMTP id t6so2246798plq.1
        for <openembedded-core@lists.openembedded.org>; Tue, 12 Jan 2021 14:36:03 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=sakoman-com.20150623.gappssmtp.com; s=20150623;
        h=from:to:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=OidTTnCT6FjA/hfcyQlBCktVCuCoHhhE/BPDx0axAS0=;
        b=C/auc3iWwQq0LxsNK1lqqxAetbkQKJUO8RZRO0Q75Ml3wVfwEWJgSpjzpWQHi6Bo9Z
         QqcNBejbrqdSz+Bo1xlUMStGKFbJz6KtmLKBrvfbWt8ZS6E/SDwUE+gcb1NV8DAlKA7o
         BKmzTK+XQzb8vztYo4vozad5yLfTKVbi5H+5Y8AuaXuFK4D/4XXThYdN8chh2Qf1z4uN
         1Rh+0uxB5+ECGQMaAIqp2SKBwbu4V9QuT+HYJyynGwYewPKF/vzfP2JPdNilkmxY8KR6
         uNve2AANxkNTwu6Ca3nFHiAzVDSX9SxE75Y40s88sGRH0KMBVUfy1tGnN9a/b40M/Qf8
         sIpw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=OidTTnCT6FjA/hfcyQlBCktVCuCoHhhE/BPDx0axAS0=;
        b=F7nkru0d+OO5lg4wRMiH2ekPdxfHFB2KL4Ve3+UjeIkAad97EqvWLsD30ImI1rmnPB
         AAuR/5y2OsSEKF1AYYBMdu73sIvypDWp9BM6BpBCqRnADCqpDkYI6c5Q5+WuiFklp0wI
         3CN3LGWvfsW/J+vpXUjCrpH2EVlMnixEYwJRjSlFIVjoc/k4G36OYQE9LOAOci4FwOM9
         K8JzSxekzv4pgGmnpUim6qADrJnjjTBTlesT/Vjm/bld6391ZBMmR//BmMD9A5riPDVj
         EJMDlwTzzkvRr1+1IT6pkWa4vKSFrJuwNrp5DscSQnEjzziZCKL3oOj5nyHo+NnaPITs
         17fg==
X-Gm-Message-State: AOAM533bkgyHM+McD3HrbOHdyG+jSMpk0RZH5NlgKbQc7GAsYs2EX6Kp
	cu5J/zLGzzk7o+tKnCveNh52eLz197sDBsY0x48=
X-Google-Smtp-Source: ABdhPJz1LirBXBJsqqPFjPMV5Uj70F+Ckq+3/SDOevAcT1YcNPssXLskAr30as5NslulMc6Q0jrECQ==
X-Received: by 2002:a17:90a:ad7:: with SMTP id r23mr1297005pje.149.1610490962612;
        Tue, 12 Jan 2021 14:36:02 -0800 (PST)
Return-Path: <steve@sakoman.com>
Received: from octo.router0800d9.com (rrcs-66-91-142-162.west.biz.rr.com. [66.91.142.162])
        by smtp.gmail.com with ESMTPSA id n15sm4739763pgl.31.2021.01.12.14.36.01
        for <openembedded-core@lists.openembedded.org>
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 12 Jan 2021 14:36:01 -0800 (PST)
From: "Steve Sakoman" <steve@sakoman.com>
To: openembedded-core@lists.openembedded.org
Subject: [OE-core][dunfell 00/12] Pull request (cover letter only)
Date: Tue, 12 Jan 2021 12:35:51 -1000
Message-Id: <cover.1610490854.git.steve@sakoman.com>
X-Mailer: git-send-email 2.17.1
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit

The following changes since commit af4fbea9a1656bdf95d85831cae13cae3a60d5ee:

  patch: fix CVE-2019-20633 (2021-01-04 04:50:23 -1000)

are available in the Git repository at:

  git://git.openembedded.org/openembedded-core-contrib stable/dunfell-next
  http://cgit.openembedded.org/openembedded-core-contrib/log/?h=stable/dunfell-next

Bruce Ashfield (1):
  linux-yocto/5.4: update to v5.4.85

Daniel Ammann (1):
  wic: fix typo

Mikko Rapeli (3):
  glibc: update to 2.31 stable tree head
  glib-2.0: add patch for CVE-2020-35457
  systemd: update from 244.3 to 244.5 stable release

Milan Shah (1):
  oe-pkgdata-util: Added a test to verify oe-pkgdata-util without
    parameters

Ovidiu Panait (1):
  timezone: upgrade to 2020f

Paul Barker (1):
  selftest: Add argument to keep build dir

Richard Purdie (1):
  gcc: Fix mangled patch

Ross Burton (2):
  diffstat: point the license checksum at the license
  ruby: remove tcl DEPENDS

Wang Mingyu (1):
  mobile-broadband-provider-info: upgrade 20190618 ->20201225

 meta/lib/oeqa/selftest/cases/pkgdata.py       |  6 ++
 meta/lib/oeqa/selftest/context.py             | 17 +++-
 .../mobile-broadband-provider-info_git.bb     |  4 +-
 ...econdition-to-avoid-GOptionEntry-lis.patch | 41 ++++++++
 meta/recipes-core/glib-2.0/glib-2.0_2.62.6.bb |  1 +
 meta/recipes-core/glibc/glibc-version.inc     |  2 +-
 ...md-boot_244.3.bb => systemd-boot_244.5.bb} |  0
 meta/recipes-core/systemd/systemd.inc         |  2 +-
 .../systemd/systemd/CVE-2020-13776.patch      | 96 -------------------
 ...temd-udev-seclabel-options-crash-fix.patch | 30 ------
 .../{systemd_244.3.bb => systemd_244.5.bb}    |  5 +-
 .../diffstat/diffstat_1.63.bb                 |  4 +-
 ...gcc-Fix-argument-list-too-long-error.patch |  6 +-
 meta/recipes-devtools/ruby/ruby.inc           |  2 +-
 meta/recipes-extended/timezone/timezone.inc   |  6 +-
 .../linux/linux-yocto-rt_5.4.bb               |  6 +-
 .../linux/linux-yocto-tiny_5.4.bb             |  8 +-
 meta/recipes-kernel/linux/linux-yocto_5.4.bb  | 22 ++---
 .../wic/plugins/source/bootimg-partition.py   |  2 +-
 19 files changed, 97 insertions(+), 163 deletions(-)
 create mode 100644 meta/recipes-core/glib-2.0/glib-2.0/0001-goption-Add-a-precondition-to-avoid-GOptionEntry-lis.patch
 rename meta/recipes-core/systemd/{systemd-boot_244.3.bb => systemd-boot_244.5.bb} (100%)
 delete mode 100644 meta/recipes-core/systemd/systemd/CVE-2020-13776.patch
 delete mode 100644 meta/recipes-core/systemd/systemd/systemd-udev-seclabel-options-crash-fix.patch
 rename meta/recipes-core/systemd/{systemd_244.3.bb => systemd_244.5.bb} (99%)

-- 
2.17.1

