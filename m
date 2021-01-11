Received: from mail-pf1-f175.google.com (mail-pf1-f175.google.com [209.85.210.175])
 by mx.groups.io with SMTP id smtpd.web11.27000.1610325968136026672
 for <openembedded-core@lists.openembedded.org>;
 Sun, 10 Jan 2021 16:46:08 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@sakoman-com.20150623.gappssmtp.com header.s=20150623 header.b=mR5AtlFU;
 spf=softfail (domain: sakoman.com, ip: 209.85.210.175, mailfrom: steve@sakoman.com)
Received: by mail-pf1-f175.google.com with SMTP id h10so9965093pfo.9
        for <openembedded-core@lists.openembedded.org>; Sun, 10 Jan 2021 16:46:08 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=sakoman-com.20150623.gappssmtp.com; s=20150623;
        h=from:to:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=zhRL1p3mTakno8NhlcG2dje12fBtuu6bqS2xLSZruPA=;
        b=mR5AtlFUw42utOKOIG3wbFqPZNnto65rLFHjNpBN6YGoSJ9FYJIfo6KnaeX+SPSk6l
         Sf4IHvmQVsRo2pdiHltEfQZSAa1fYpDS23KGsJo9kW0GFA3a/zOF5gi3oBnqUk3c2D5S
         FY3Ha/X3TuQf8Ai17312Aq8nQV1w5j2FbrQPyLnuUjjKLx/jMRp3Zp/ayNvJiQHukH/n
         bqocpkpEeBdbsz/47zpbi18H3NqGaX7ZnzWKCjyH7ZCgYfBEL33wevI0SgbzOyAp5USD
         NzlSXMGgeK412VgPjfC6IPtyWHpEE1yxaZZuaHLUJP50h0jDlcqyZOmlaADarItZACdj
         kAqw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=zhRL1p3mTakno8NhlcG2dje12fBtuu6bqS2xLSZruPA=;
        b=ankiVP7vcaXEl1/03/KXB+ibuEYP3VJx3iyZGwdANq0478SaXE1CALAD+l/J7J0UcW
         pnCOWYOu3/P4z5HMQjSzULi1BPQnKhJyK2dIqHroCYAu05JuNmbalqYQc3TvKx99wEWY
         nU/L4cBuxQuRWwWU1depXnjxG9RSiLCBalE7HWBnpp/adL/4S9arfqLie6hxBqt7ESzf
         o4TlTDDSBZJi7wEyEIE4/apb33OJnbVyh7FeMjGOG2mJZbnzKHb+eEsKEa93uW6MHGgS
         XqYagwoWl/XyF2Az+Z6BO+fvT8EH2HjXbSPpSRDwy2OL7+2QqtW11Vnb5S3tafSAptKc
         J69g==
X-Gm-Message-State: AOAM532BVP+osx7Yg/J7j0C+3qXooMyEkGpl4yyJYQztrdeR0ydowdxD
	gH4aFsUWW5hTJU3I6reMa209Qwk1/vZh9/G8/s8=
X-Google-Smtp-Source: ABdhPJzgJdNgnQhGGhn68nsND70E0P/mjcyOOxnjrUvQow/+RLXuMNGmLFgMVr8voEKIns/kj16KSg==
X-Received: by 2002:aa7:9ac9:0:b029:19e:19b6:6e09 with SMTP id x9-20020aa79ac90000b029019e19b66e09mr17144327pfp.49.1610325966002;
        Sun, 10 Jan 2021 16:46:06 -0800 (PST)
Return-Path: <steve@sakoman.com>
Received: from octo.router0800d9.com (rrcs-66-91-142-162.west.biz.rr.com. [66.91.142.162])
        by smtp.gmail.com with ESMTPSA id v125sm17729079pgv.6.2021.01.10.16.46.03
        for <openembedded-core@lists.openembedded.org>
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 10 Jan 2021 16:46:05 -0800 (PST)
From: "Steve Sakoman" <steve@sakoman.com>
To: openembedded-core@lists.openembedded.org
Subject: [OE-core][dunfell 00/12] Patch review
Date: Sun, 10 Jan 2021 14:45:41 -1000
Message-Id: <cover.1610325804.git.steve@sakoman.com>
X-Mailer: git-send-email 2.17.1
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit

Please review this next set of patches for dunfell and have comments back by
end of day Tuesday.

Passed a-full on autobuilder:

https://autobuilder.yoctoproject.org/typhoon/#/builders/83/builds/1739

The following changes since commit af4fbea9a1656bdf95d85831cae13cae3a60d5ee:

  patch: fix CVE-2019-20633 (2021-01-04 04:50:23 -1000)

are available in the Git repository at:

  git://git.openembedded.org/openembedded-core-contrib stable/dunfell-nut
  http://cgit.openembedded.org/openembedded-core-contrib/log/?h=stable/dunfell-nut

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

