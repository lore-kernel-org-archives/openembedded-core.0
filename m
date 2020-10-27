Received: from mail-pl1-f169.google.com (mail-pl1-f169.google.com [209.85.214.169])
 by mx.groups.io with SMTP id smtpd.web09.91.1603837771180330497
 for <openembedded-core@lists.openembedded.org>;
 Tue, 27 Oct 2020 15:29:31 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@sakoman-com.20150623.gappssmtp.com header.s=20150623 header.b=HAeqxzpL;
 spf=softfail (domain: sakoman.com, ip: 209.85.214.169, mailfrom: steve@sakoman.com)
Received: by mail-pl1-f169.google.com with SMTP id j5so1512674plk.7
        for <openembedded-core@lists.openembedded.org>; Tue, 27 Oct 2020 15:29:31 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=sakoman-com.20150623.gappssmtp.com; s=20150623;
        h=from:to:subject:date:message-id;
        bh=aC/EqAeZV/qsH+rhTvyzCcUVywcTlWT7Kl22jPgCOwc=;
        b=HAeqxzpLNTidwqzBCQ0qaL2AeV4Z46GrIhG8MIDA9mA4YXVhWnuV6oUe7Dmnv+O553
         4V9cEVT2qjOOAV/nPQ+6v6b9wkVC10VFeinjhRxpXrp1LrOopoR9JY2leZj545cOmeir
         pWXze6ah20yLXBV5YFsgzNO5DnCwQOABq69+bVJwE15d/k0mJHzdc++eRlJUBhxf6RfC
         Z28VR4JjZ+O0GXdn3hH6+qITVBeWg92zm/1yNlZsNKXBWq1U19p4NVi1Bw/vQfw2rJwj
         coAUb4sbztRV5v4tLZr54LIpwRcD2LuaENZyMgmbC/fC2cQV8UyDSbyVNGEUsAp/7bD8
         IrJA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:subject:date:message-id;
        bh=aC/EqAeZV/qsH+rhTvyzCcUVywcTlWT7Kl22jPgCOwc=;
        b=SrtUn2RnprD7bKaEujs907NWrKCQkLxKUppT8beRwQi/b7Bk8BVZgccRPEJzAiJbX5
         7bNWav/geXoD/FOOtBVIAmBTY72QdqpGua1Ee97BYQHacNcpIhF4Ixhx0FDE1I4wFt1m
         jOgT3W/vdTe2TcQPjdQqeOL21u73A+O3IhdXa/ksBKtmqu1Tx1IinhGQvgYSwZqkgM8B
         p4F57nW7fw7aSr0KAS0NK9d5SRwg4HQWAG24h7WcWqGnx7NYr+n7IGWONSLR8GU2ZKcF
         qvpAOG5EZ34J7ROp3IdNWn/RfOIaz6TA1bF1WN/OPjqq6mHQ1sy8stQPMIVAzUbm5dYV
         MEDw==
X-Gm-Message-State: AOAM5325rMEl7aUSd0anRN8CRmQPWCcdS8etg6CpgUvp3O6wOBJlZdOz
	Z2z7O7L6i2oa3kG96qXCrjxCdvY9X5razZEF
X-Google-Smtp-Source: ABdhPJx3TZrHqlPCxKBfjBQGE19qxB32spZAG211xlRCX4kOz32Vy2NVwQCltEEhqDZhJsm5a3sDoQ==
X-Received: by 2002:a17:902:b789:b029:d3:f9aa:7f27 with SMTP id e9-20020a170902b789b02900d3f9aa7f27mr4719285pls.47.1603837769983;
        Tue, 27 Oct 2020 15:29:29 -0700 (PDT)
Return-Path: <steve@sakoman.com>
Received: from octo.router0800d9.com (rrcs-66-91-142-162.west.biz.rr.com. [66.91.142.162])
        by smtp.gmail.com with ESMTPSA id b7sm3699000pfr.171.2020.10.27.15.29.28
        for <openembedded-core@lists.openembedded.org>
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 27 Oct 2020 15:29:29 -0700 (PDT)
From: "Steve Sakoman" <steve@sakoman.com>
To: openembedded-core@lists.openembedded.org
Subject: [OE-core][dunfell 00/16] Patch review
Date: Tue, 27 Oct 2020 12:29:04 -1000
Message-Id: <cover.1603837524.git.steve@sakoman.com>
X-Mailer: git-send-email 2.17.1

Please review this next set of patches for dunfell and have changes back
by end of day Thursday.

Passed a-full on autobuilder:

https://autobuilder.yoctoproject.org/typhoon/#/builders/83/builds/1514

The following changes since commit 89e6fc44a378cb3489376d7193672cdf94c504b6:

  qemu: change TLBs number to 64 in 34Kf mips cpu model (2020-10-21 04:42:42 -1000)

are available in the Git repository at:

  git://git.openembedded.org/openembedded-core-contrib stable/dunfell-nut
  http://cgit.openembedded.org/openembedded-core-contrib/log/?h=stable/dunfell-nut

Jose Quaresma (12):
  gstreamer1.0: Fix reproducibility issue around libcap
  gstreamer1.0: Update 1.16.2 -> Update 1.16.3
  gstreamer1.0-plugins-base: Update 1.16.2 -> Update 1.16.3
  gstreamer1.0-plugins-good: Update 1.16.2 -> Update 1.16.3
  gstreamer1.0-plugins-bad: Update 1.16.2 -> Update 1.16.3
  gstreamer1.0-plugins-ugly: Update 1.16.2 -> Update 1.16.3
  gstreamer1.0-libav: Update 1.16.2 -> Update 1.16.3
  gstreamer1.0-vaapi: Update 1.16.2 -> Update 1.16.3
  gstreamer1.0-rtsp-server: Update 1.16.2 -> Update 1.16.3
  gstreamer1.0-omx: Update 1.16.2 -> Update 1.16.3
  gstreamer1.0-python: Update 1.16.2 -> Update 1.16.3
  gst-validate: Update 1.16.2 -> Update 1.16.3

Lee Chee Yang (1):
  ffmpeg: fix CVE-2020-12284

Richard Purdie (1):
  oeqa: Add sync call to command execution

Ross Burton (2):
  gcc: mitigate the Straight-line Speculation attack
  glib-2.0: fix parsing of slim encoded tzdata

 meta/lib/oeqa/selftest/cases/runcmd.py        |  16 +-
 meta/lib/oeqa/utils/commands.py               |   8 +-
 .../glib-2.0/glib-2.0/tzdata-update.patch     | 458 ++++++++++++
 meta/recipes-core/glib-2.0/glib-2.0_2.62.6.bb |   1 +
 meta/recipes-devtools/gcc/gcc-9.3.inc         |   3 +
 ...ight-Line-Speculation-SLS-mitigation.patch | 204 ++++++
 ...e-SLS-mitigation-for-RET-and-BR-inst.patch | 600 ++++++++++++++++
 ...h64-Mitigate-SLS-for-BLR-instruction.patch | 659 ++++++++++++++++++
 .../ffmpeg/ffmpeg/CVE-2020-12284.patch        |  36 +
 .../recipes-multimedia/ffmpeg/ffmpeg_4.2.2.bb |   1 +
 ...idate_1.16.2.bb => gst-validate_1.16.3.bb} |   4 +-
 ...1.16.2.bb => gstreamer1.0-libav_1.16.3.bb} |   4 +-
 ...x_1.16.2.bb => gstreamer1.0-omx_1.16.3.bb} |   4 +-
 ....bb => gstreamer1.0-plugins-bad_1.16.3.bb} |   4 +-
 ...bb => gstreamer1.0-plugins-base_1.16.3.bb} |   4 +-
 ...bb => gstreamer1.0-plugins-good_1.16.3.bb} |   4 +-
 ...bb => gstreamer1.0-plugins-ugly_1.16.3.bb} |   4 +-
 ...son.build-fix-builds-with-python-3.8.patch |  24 -
 ....16.2.bb => gstreamer1.0-python_1.16.3.bb} |   8 +-
 ....bb => gstreamer1.0-rtsp-server_1.16.3.bb} |   4 +-
 ...1.16.2.bb => gstreamer1.0-vaapi_1.16.3.bb} |   4 +-
 .../gstreamer/gstreamer1.0/capfix.patch       |  37 -
 ...er1.0_1.16.2.bb => gstreamer1.0_1.16.3.bb} |   9 +-
 23 files changed, 2002 insertions(+), 98 deletions(-)
 create mode 100644 meta/recipes-core/glib-2.0/glib-2.0/tzdata-update.patch
 create mode 100644 meta/recipes-devtools/gcc/gcc-9.3/0001-aarch64-New-Straight-Line-Speculation-SLS-mitigation.patch
 create mode 100644 meta/recipes-devtools/gcc/gcc-9.3/0002-aarch64-Introduce-SLS-mitigation-for-RET-and-BR-inst.patch
 create mode 100644 meta/recipes-devtools/gcc/gcc-9.3/0003-aarch64-Mitigate-SLS-for-BLR-instruction.patch
 create mode 100644 meta/recipes-multimedia/ffmpeg/ffmpeg/CVE-2020-12284.patch
 rename meta/recipes-multimedia/gstreamer/{gst-validate_1.16.2.bb => gst-validate_1.16.3.bb} (87%)
 rename meta/recipes-multimedia/gstreamer/{gstreamer1.0-libav_1.16.2.bb => gstreamer1.0-libav_1.16.3.bb} (90%)
 rename meta/recipes-multimedia/gstreamer/{gstreamer1.0-omx_1.16.2.bb => gstreamer1.0-omx_1.16.3.bb} (92%)
 rename meta/recipes-multimedia/gstreamer/{gstreamer1.0-plugins-bad_1.16.2.bb => gstreamer1.0-plugins-bad_1.16.3.bb} (98%)
 rename meta/recipes-multimedia/gstreamer/{gstreamer1.0-plugins-base_1.16.2.bb => gstreamer1.0-plugins-base_1.16.3.bb} (96%)
 rename meta/recipes-multimedia/gstreamer/{gstreamer1.0-plugins-good_1.16.2.bb => gstreamer1.0-plugins-good_1.16.3.bb} (96%)
 rename meta/recipes-multimedia/gstreamer/{gstreamer1.0-plugins-ugly_1.16.2.bb => gstreamer1.0-plugins-ugly_1.16.3.bb} (90%)
 delete mode 100644 meta/recipes-multimedia/gstreamer/gstreamer1.0-python/0001-meson.build-fix-builds-with-python-3.8.patch
 rename meta/recipes-multimedia/gstreamer/{gstreamer1.0-python_1.16.2.bb => gstreamer1.0-python_1.16.3.bb} (80%)
 rename meta/recipes-multimedia/gstreamer/{gstreamer1.0-rtsp-server_1.16.2.bb => gstreamer1.0-rtsp-server_1.16.3.bb} (86%)
 rename meta/recipes-multimedia/gstreamer/{gstreamer1.0-vaapi_1.16.2.bb => gstreamer1.0-vaapi_1.16.3.bb} (93%)
 delete mode 100644 meta/recipes-multimedia/gstreamer/gstreamer1.0/capfix.patch
 rename meta/recipes-multimedia/gstreamer/{gstreamer1.0_1.16.2.bb => gstreamer1.0_1.16.3.bb} (90%)

-- 
2.17.1

