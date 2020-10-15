Received: from mail-pl1-f176.google.com (mail-pl1-f176.google.com [209.85.214.176])
 by mx.groups.io with SMTP id smtpd.web10.13223.1602771329350131077
 for <openembedded-core@lists.openembedded.org>;
 Thu, 15 Oct 2020 07:15:29 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@sakoman-com.20150623.gappssmtp.com header.s=20150623 header.b=gz0DvHpD;
 spf=softfail (domain: sakoman.com, ip: 209.85.214.176, mailfrom: steve@sakoman.com)
Received: by mail-pl1-f176.google.com with SMTP id c6so1690890plr.9
        for <openembedded-core@lists.openembedded.org>; Thu, 15 Oct 2020 07:15:29 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=sakoman-com.20150623.gappssmtp.com; s=20150623;
        h=from:to:subject:date:message-id;
        bh=WPgqEYf8UNRDxPmOgLdxfknK2ftv9NNwgqlE5yh1ChU=;
        b=gz0DvHpDCEjKjnOlc437+M4TPDXxlremb0Czs0by9bObMlrP6J5v7CCby5k0LuuOk0
         FUUOvxguxUKaQh3waxWt2dvL9UNQREIApRPEOxQFM8pAYiW+pIysHHM4W5dKxJWVCZ7l
         lpDFf2Ge1U3YnmHc14L3/4oK3G297SuN2kBEYjGK8oUJTDLi8sX59oJkqDQ5WoGGJwDR
         v2ES8HMTAsUOJ/lk0p8Jl+bcPj8NCzd68Cj9U3cvno6YNRe1e67dBwxdNHzS1ydU5kjM
         QPwUPGXXKQ4OZXrw2aY8Gmez5V/OAH08Th8Hcgrr4EEZUFOGQwjARydbSNbAiomm2820
         Luxg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:subject:date:message-id;
        bh=WPgqEYf8UNRDxPmOgLdxfknK2ftv9NNwgqlE5yh1ChU=;
        b=S/Zus128d9Sr/DE1WxYXg1HE2nmeIRoBko5ndvjSHa6Tf2rVjyS38TouvIjCRF2vSO
         rmP6X4EG2Z0tUXuTpFdvku9W2KSOdCPteheckFeZ6gdr2sFqVfGrnfyjsydUWY4/TFPy
         WAcaE6gYs2ZTvHcjhwqgf6lBQdR2LDvJ+Fv0RkB3dcH1B+gtVvVARHmF2kR+854FOCnz
         gAunQnXkSBRekm9h9E2QLs6gyu09XUATVsCBOu4kBw34HPVRLoRLEapO09ClyTzZYEs/
         i1/TK014JguGbjxzHMM1Ed1PACzUzCuXT3A5368TSV8DdNxkcTF43wWBopZWDu6/qyPz
         hkXw==
X-Gm-Message-State: AOAM530zTr7f9+G5Rf43w+xgZIQ2RpYXU1lAPsYCHKZFTOAkpbJhoOr/
	AbLN/dKgrsH8l5pyNK0WpTpoLb8WAiaT95g6
X-Google-Smtp-Source: ABdhPJyS0bGh5QC2EofDWHly3CwaYb70u+vA3c7eZ0U19G7B6/ansPZF4ZLUgxvXcZiWollCeSPoVg==
X-Received: by 2002:a17:902:7298:b029:d4:c71a:357a with SMTP id d24-20020a1709027298b02900d4c71a357amr2031682pll.38.1602771328077;
        Thu, 15 Oct 2020 07:15:28 -0700 (PDT)
Return-Path: <steve@sakoman.com>
Received: from octo.router0800d9.com (rrcs-66-91-142-162.west.biz.rr.com. [66.91.142.162])
        by smtp.gmail.com with ESMTPSA id i9sm3565138pgc.71.2020.10.15.07.15.26
        for <openembedded-core@lists.openembedded.org>
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 15 Oct 2020 07:15:27 -0700 (PDT)
From: "Steve Sakoman" <steve@sakoman.com>
To: openembedded-core@lists.openembedded.org
Subject: [OE-core][dunfell 0/8] Patch review
Date: Thu, 15 Oct 2020 04:15:04 -1000
Message-Id: <cover.1602771116.git.steve@sakoman.com>
X-Mailer: git-send-email 2.17.1

Please review this next set of patches for dunfell and have comments back
by end of day Monday.

Passed a-full on autobuilder:

https://autobuilder.yoctoproject.org/typhoon/#/builders/83/builds/1478

The following changes since commit 656d2070f8448681cb69a3d43dbae84a681c1a75:

  linux-yocto/5.4: update to v5.4.69 (2020-10-07 13:41:09 -1000)

are available in the Git repository at:

  git://git.openembedded.org/openembedded-core-contrib stable/dunfell-nut
  http://cgit.openembedded.org/openembedded-core-contrib/log/?h=stable/dunfell-nut

Armin Kuster (1):
  timezone: update to 2020b

Naoki Hayama (1):
  uninative: Fix typo in error message

Richard Purdie (2):
  scripts/oe-build-perf-report: Allow operation with no buildstats
  oe-build-perf-report: Ensure correct data is shown for multiple branch
    options

Steve Sakoman (1):
  Revert "package: get_package_mapping: avoid dependency mapping if
    renamed package provides original name"

Victor Kamensky (2):
  qemu: add 34Kf-64tlb fictitious cpu type
  qemumips: use 34Kf-64tlb CPU emulation

Yoann Congal (1):
  bitbake-bblayers/create: Make the example recipe print its message

 meta/classes/package.bbclass                  |  16 +--
 meta/classes/uninative.bbclass                |   2 +-
 meta/conf/machine/qemumips.conf               |   2 +-
 meta/lib/bblayers/templates/example.bb        |   4 +-
 meta/recipes-devtools/qemu/qemu.inc           |   1 +
 ...tlb-fictitious-cpu-type-like-34Kf-bu.patch | 118 ++++++++++++++++++
 meta/recipes-extended/timezone/timezone.inc   |   8 +-
 meta/recipes-extended/timezone/tzdata.bb      |   8 +-
 scripts/oe-build-perf-report                  |   6 +-
 9 files changed, 137 insertions(+), 28 deletions(-)
 create mode 100644 meta/recipes-devtools/qemu/qemu/0001-mips-add-34Kf-64tlb-fictitious-cpu-type-like-34Kf-bu.patch

-- 
2.17.1

