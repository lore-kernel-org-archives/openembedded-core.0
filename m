Received: from mail-pf1-f180.google.com (mail-pf1-f180.google.com [209.85.210.180])
 by mx.groups.io with SMTP id smtpd.web08.5349.1605279155513610050
 for <openembedded-core@lists.openembedded.org>;
 Fri, 13 Nov 2020 06:52:35 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@sakoman-com.20150623.gappssmtp.com header.s=20150623 header.b=ZPVvHe9G;
 spf=softfail (domain: sakoman.com, ip: 209.85.210.180, mailfrom: steve@sakoman.com)
Received: by mail-pf1-f180.google.com with SMTP id c20so7801259pfr.8
        for <openembedded-core@lists.openembedded.org>; Fri, 13 Nov 2020 06:52:35 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=sakoman-com.20150623.gappssmtp.com; s=20150623;
        h=from:to:subject:date:message-id;
        bh=toZ9FUWeQbelsm2LmH6GqUoVeNhr79EDaxxQz4tCmOY=;
        b=ZPVvHe9GGh5AJW0QacnarN9xKi2+wiKvnYS6XrE1GbIgi4U9/TxTc6tw3Hy2faeT5M
         JHYU2vDEh6ZxXOR30xF87habzdRYIE04DfgxXYn7uN8dTibBAzV2ylyMFemeB/Z0E4yC
         X7qaIFfJmyjlShRKNi2AcsHu3gH+ttgBUPDxBSFvHTeS5Klr0moJWBMCFgBIArLl3L8N
         V4GLQAcIma2BMD9aGuK6h4vSV5/eYSPKke+WifSx8rjPBy0x8XmsyHffIf4pxkrPlxxw
         grYVpfim6/3OCcuSj0QOHzt6UqPlynm6eVTIZ/gU3Ma2bTzAAXYI8rssT0oU2Pllnasu
         ezJQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:subject:date:message-id;
        bh=toZ9FUWeQbelsm2LmH6GqUoVeNhr79EDaxxQz4tCmOY=;
        b=fUiQvgmz5997nes3YVDRhyWllqXzy1lH3tzd9MWSGbueJVdkKVKNxtpbPpMtMdCD0Y
         MIXfZZ/u+JnDDIofweP2fqzL1uCZsE5nd59cz9G3BvWpW+RJnaraiRC0MOgcbfzvoROS
         XewKttitdRuFIguLsNToMHPLSgKrvbS100EcDeZTV6YerFpgATpR2MIku77OlnTS71C5
         Rp8t2EM4hcGoWQ7MERhGbi55v1DcCTplilweHblRSUrG0CKSV8fyEpVaVAxegyCaKbFY
         2qRpwPi34bePZk+MqU5A//+1xZqleDPG1lh/qkJT3ZUDQVAVW0dGDWyEAORLpAu0agKn
         IVbw==
X-Gm-Message-State: AOAM533CbhGkCtuDlpDCh+axtrGkEmfjNFyUYx3nqo/Plr/TKinfDyTO
	RrWt4EgzO6eYeWUciyyYdp6FlODDMgb1XgRu
X-Google-Smtp-Source: ABdhPJygJCLdoEX1jHdyiZxS8SFBH6nKmaqruQ6lBQnuml81NTJNpf5w631BRqpXmH/x6eht0bHkCw==
X-Received: by 2002:a63:4c12:: with SMTP id z18mr2290178pga.143.1605279153802;
        Fri, 13 Nov 2020 06:52:33 -0800 (PST)
Return-Path: <steve@sakoman.com>
Received: from octo.router0800d9.com (rrcs-66-91-142-162.west.biz.rr.com. [66.91.142.162])
        by smtp.gmail.com with ESMTPSA id r134sm10370694pfc.145.2020.11.13.06.52.32
        for <openembedded-core@lists.openembedded.org>
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 13 Nov 2020 06:52:33 -0800 (PST)
From: "Steve Sakoman" <steve@sakoman.com>
To: openembedded-core@lists.openembedded.org
Subject: [OE-core][dunfell 00/18] Patch review
Date: Fri, 13 Nov 2020 04:52:04 -1000
Message-Id: <cover.1605278902.git.steve@sakoman.com>
X-Mailer: git-send-email 2.17.1

Please review this next set of patches for dunfell and have comments back by
end of day on Tuesday.

Passed a-full on autobuilder:

https://autobuilder.yoctoproject.org/typhoon/#/builders/83/builds/1588

The following changes since commit 4f395ad49ef9035954d0fda7b7df14dea18b49a0:

  grub: clean up CVE patches (2020-11-08 16:51:24 -1000)

are available in the Git repository at:

  git://git.openembedded.org/openembedded-core-contrib stable/dunfell-nut
  http://cgit.openembedded.org/openembedded-core-contrib/log/?h=stable/dunfell-nut

Alex Kiernan (1):
  openssh: Upgrade 8.2p1 -> 8.3p1

Alexander Kanavin (2):
  clutter-gst-3.0: do not call out to host gstreamer plugin scanner
  openssh: upgrade 8.3p1 -> 8.4p1 to fix CVE-2020-14145 and
    CVE-2020-15778

Denys Zagorui (1):
  binutils: reproducibility: reuse debug-prefix-map for stabs

Diego Santa Cruz (1):
  freetype: fix CVE-2020-15999, backport from 2.10.4

Gratian Crisan (1):
  kernel-module-split.bbclass: identify kernel modconf files as
    configuration files

Jose Quaresma (1):
  gstreamer1.0: warn the user when something is wrong with GstBufferPool

Konrad Weihmann (3):
  oeqa/core/context: expose results as variable
  oeqa/core/context: initialize _run_end_time
  testimage: print results for interrupted runs

Nathan Rossi (1):
  diffstat: add nativesdk to BBCLASSEXTEND

Ricardo Salveti (1):
  dosfstools: add mkfs.vfat to ALTERNATIVE

Richard Purdie (3):
  ptest-runner: Fix license as it contains 'or later' clause
  libdnf: Fix license as it contains 'or later' clause
  alsa-utils: Fix license to GPLv2 only

Ross Burton (1):
  syslinux: add link to upstream discussion in patch

Steve Sakoman (1):
  openssh: whitelist CVE-2014-9278

akash hadke (1):
  systemd: udev SECLABEL{selinux} crash fix

 meta/classes/kernel-module-split.bbclass      |  1 +
 meta/classes/testimage.bbclass                | 19 ++++---
 meta/lib/oeqa/core/context.py                 |  4 ++
 .../{openssh_8.2p1.bb => openssh_8.4p1.bb}    |  7 ++-
 ...temd-udev-seclabel-options-crash-fix.patch | 30 +++++++++++
 meta/recipes-core/systemd/systemd_244.3.bb    |  1 +
 .../binutils/binutils-2.34.inc                |  1 +
 ...oducibility-for-stabs-debugging-data.patch | 32 ++++++++++++
 .../diffstat/diffstat_1.63.bb                 |  2 +
 .../dosfstools/dosfstools_4.1.bb              |  6 ++-
 meta/recipes-devtools/libdnf/libdnf_0.28.1.bb |  2 +-
 ...nux-syslinux-support-ext2-3-4-device.patch |  2 +-
 .../clutter/clutter-gst-3.0.inc               |  2 +
 ...-sfnt-Fix-heap-buffer-overflow-59308.patch | 51 +++++++++++++++++++
 .../freetype/freetype_2.10.1.bb               |  1 +
 .../alsa/alsa-utils_1.2.1.bb                  |  3 +-
 ...size-in-reset-when-maxsize-is-larger.patch | 49 ++++++++++++++++++
 .../gstreamer/gstreamer1.0_1.16.3.bb          |  1 +
 .../ptest-runner/ptest-runner_2.3.2.bb        |  2 +-
 19 files changed, 201 insertions(+), 15 deletions(-)
 rename meta/recipes-connectivity/openssh/{openssh_8.2p1.bb => openssh_8.4p1.bb} (95%)
 create mode 100644 meta/recipes-core/systemd/systemd/systemd-udev-seclabel-options-crash-fix.patch
 create mode 100644 meta/recipes-devtools/binutils/binutils/0001-gas-improve-reproducibility-for-stabs-debugging-data.patch
 create mode 100644 meta/recipes-graphics/freetype/freetype/0001-sfnt-Fix-heap-buffer-overflow-59308.patch
 create mode 100644 meta/recipes-multimedia/gstreamer/gstreamer1.0/0005-bufferpool-only-resize-in-reset-when-maxsize-is-larger.patch

-- 
2.17.1

