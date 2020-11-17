Received: from mail-oo1-f48.google.com (mail-oo1-f48.google.com [209.85.161.48])
 by mx.groups.io with SMTP id smtpd.web12.16760.1605656678844180974
 for <openembedded-core@lists.openembedded.org>;
 Tue, 17 Nov 2020 15:44:39 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@sakoman-com.20150623.gappssmtp.com header.s=20150623 header.b=uxYTyI/9;
 spf=softfail (domain: sakoman.com, ip: 209.85.161.48, mailfrom: steve@sakoman.com)
Received: by mail-oo1-f48.google.com with SMTP id t142so5179514oot.7
        for <openembedded-core@lists.openembedded.org>; Tue, 17 Nov 2020 15:44:38 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=sakoman-com.20150623.gappssmtp.com; s=20150623;
        h=from:to:subject:date:message-id;
        bh=aMlhn/Dtg8DgrUMJP3sfGVWtRi9kTZs+SuThAqYAbvM=;
        b=uxYTyI/9sq6aADBYwjLPLuJuh36LSjxA101GLafGUCbO4fCJ6H27BliKtOevnpWu+s
         N0jpr2Xo9W3DpfvBLHvUGz+Ml8FzHkUgfJdCOrg7rLi0FE8y+PT4t8u+oRZ/JWImS7P2
         SRuqy+NtMk5y2W3YvDcdwopG4JUvEOIdGcCQ9hIW8qhYlyaSo9G1HAY2Mv33RNZvXEtb
         roxqtcBv1yC4OitKwhJbyfdOOuHUFrAsx6Gq47nD4QcMOLtBKTUDHRLDH9fEIfAk0ZEa
         zNCStBo+DzxVktTZhsKfrFYGBox1782p0RmN0QdNJTwa+HAP1Rek9nccSq5LfuRUgtVg
         ZCIw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:subject:date:message-id;
        bh=aMlhn/Dtg8DgrUMJP3sfGVWtRi9kTZs+SuThAqYAbvM=;
        b=V/g7xItV5LXWVtc1OdwAW3dZfmtmsU54iAecfCDBeR6EmQdjKRV/nXkEOMRqNEm9wV
         RmKySVJEvk59LhjhwPFcE+QpCXUzlxP0ggpTR5aEbg2MtWjM1TIPMt89RLQmgXpPLuFn
         1LWxJkyTbWF3jmIveJGxLgDJpq7oNkow/TzJF1UtXbiMygD9ewiKIWo/EoW7aC1Em0aI
         beSUQKSR0jdLRmdWYMBMAz53M/pG3AZAe9i5l5xgahaIu6o0VXBzLG+RdmxxOk6a62JL
         4ak/d2t6RPesdhQsZfk3TlCHEUU86hRIIf/CgBROeSJwWkZ3Qr/A1Ne50HkGPVTN7KjJ
         /JcA==
X-Gm-Message-State: AOAM531ahIiPzT8IQ4QYoKhrcsbm4NuV2+9vR29sE9PrJjeZ7pTu3rZu
	Cm8MT5Bh/U/wzzsd3JGq81p9c9i6UNb94JXU
X-Google-Smtp-Source: ABdhPJyXZIfLq954dgJ65/6SBFXlfAaQEp/XHw4aNdi1t+gRbxk4u+nVx63Td7LsdloOkx1KeBqTpg==
X-Received: by 2002:a4a:9cc7:: with SMTP id d7mr4865137ook.8.1605656677611;
        Tue, 17 Nov 2020 15:44:37 -0800 (PST)
Return-Path: <steve@sakoman.com>
Received: from octo.router0800d9.com ([99.197.43.113])
        by smtp.gmail.com with ESMTPSA id m29sm6623302otj.42.2020.11.17.15.44.33
        for <openembedded-core@lists.openembedded.org>
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 17 Nov 2020 15:44:36 -0800 (PST)
From: "Steve Sakoman" <steve@sakoman.com>
To: openembedded-core@lists.openembedded.org
Subject: [OE-core][dunfell 00/16] Pull request (cover letter only)
Date: Tue, 17 Nov 2020 13:44:17 -1000
Message-Id: <cover.1605656546.git.steve@sakoman.com>
X-Mailer: git-send-email 2.17.1

The following changes since commit 4f395ad49ef9035954d0fda7b7df14dea18b49a0:

  grub: clean up CVE patches (2020-11-08 16:51:24 -1000)

are available in the Git repository at:

  git://git.openembedded.org/openembedded-core-contrib stable/dunfell-next
  http://cgit.openembedded.org/openembedded-core-contrib/log/?h=stable/dunfell-next

Alexander Kanavin (1):
  clutter-gst-3.0: do not call out to host gstreamer plugin scanner

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
 .../openssh/openssh_8.2p1.bb                  |  4 ++
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
 19 files changed, 200 insertions(+), 13 deletions(-)
 create mode 100644 meta/recipes-core/systemd/systemd/systemd-udev-seclabel-options-crash-fix.patch
 create mode 100644 meta/recipes-devtools/binutils/binutils/0001-gas-improve-reproducibility-for-stabs-debugging-data.patch
 create mode 100644 meta/recipes-graphics/freetype/freetype/0001-sfnt-Fix-heap-buffer-overflow-59308.patch
 create mode 100644 meta/recipes-multimedia/gstreamer/gstreamer1.0/0005-bufferpool-only-resize-in-reset-when-maxsize-is-larger.patch

-- 
2.17.1

