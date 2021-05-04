Received: from mail-oo1-f44.google.com (mail-oo1-f44.google.com [209.85.161.44])
 by mx.groups.io with SMTP id smtpd.web12.6229.1620137414257171291
 for <openembedded-core@lists.openembedded.org>;
 Tue, 04 May 2021 07:10:14 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@sakoman-com.20150623.gappssmtp.com header.s=20150623 header.b=otKfDf57;
 spf=softfail (domain: sakoman.com, ip: 209.85.161.44, mailfrom: steve@sakoman.com)
Received: by mail-oo1-f44.google.com with SMTP id c12-20020a4ae24c0000b02901bad05f40e4so2035403oot.4
        for <openembedded-core@lists.openembedded.org>; Tue, 04 May 2021 07:10:14 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=sakoman-com.20150623.gappssmtp.com; s=20150623;
        h=from:to:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=dXXl5gWZDLRB0dRiLvx53d3bcXdXzlSKHqG/45zc6D8=;
        b=otKfDf57u9k04kBi339A1YdpGmDVl/33LVqC1SbkHWoMR3g4Hrz4UgdvzYSdjySOCO
         T2zFKJNl6xFicHCW/iKRQJVnKudiMEp9D7Nip6vG7SSFzvO5vUwVfLRIo1/1ZU7q1jxP
         VyY+hlkNIxGvzwC4CQ93fprwdEvybR1v9FSKH0UrM3mK7wEuzICe46uw8ZpAjomhnhPm
         JfxLl5EMT1rfDLpLZsQt7tY13EkjgKZZVWxbdO+CRGEF005OWYZVR95GYcoq72m60+hg
         69aAOcybhw71sMUf1RLnNOInnl8kncsbuWtDB2j4plWhqUvY4wOupbo3hlcvbqrRgAcw
         PK6w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=dXXl5gWZDLRB0dRiLvx53d3bcXdXzlSKHqG/45zc6D8=;
        b=iL4lmpSmqddaJgQGnvWPpoo6h/bohgOMc6l8YWmIWNo4zMKOKIclUehuMkCgVMpDAc
         Xc+7BUkYKTwmiw4nUgdjMw3+jmxwwqAhXmvsHUt9JRDV8YzrcSngaPt00T1Rvd1OqcPn
         84wkDkVarZa/6iICViVRuuPopIdjlvDddDveydOPpVM3jxyiIwmXmt68N4d6PwdV+hS6
         59NFneN1YdoF4BhlhaLblCstwDk6oxLh/OF/HSLR8VRieXuEKXPLcz1DZTsrp95Qh8QC
         xQWezwTMjr8Bf32cdYqZejgSMkDDIAYelPI6XGlZWHJLIC9zgaoulh9lzfbsZU0WLBRe
         tH9w==
X-Gm-Message-State: AOAM532ZwWZVPqeHQCj7T8ulahKLhO7E6T0u/rzOcKLPyW1AXpdT9GRl
	9obaU1q3wl1TcOMVOqCQAIcCjssZ6VZGLMXA
X-Google-Smtp-Source: ABdhPJxLrlRSieUsqetZUWQHExM0SeWTDn6mFBFKObX+jbTNcVd5jpr3umn5tep/DmgXggEJSVUefQ==
X-Received: by 2002:a4a:e512:: with SMTP id r18mr19643295oot.40.1620137412905;
        Tue, 04 May 2021 07:10:12 -0700 (PDT)
Return-Path: <steve@sakoman.com>
Received: from localhost.localdomain ([72.173.249.164])
        by smtp.gmail.com with ESMTPSA id n17sm680457oie.11.2021.05.04.07.10.10
        for <openembedded-core@lists.openembedded.org>
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 04 May 2021 07:10:12 -0700 (PDT)
From: "Steve Sakoman" <steve@sakoman.com>
To: openembedded-core@lists.openembedded.org
Subject: [OE-core][dunfell 00/10] Pull request (cover letter only)
Date: Tue,  4 May 2021 04:09:33 -1000
Message-Id: <cover.1620137323.git.steve@sakoman.com>
X-Mailer: git-send-email 2.25.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

The following changes since commit 2cc9e06807026b86038db88c2175c626feadc0be:

  linux-yocto/5.4: fix arm defconfig warnings (2021-04-22 06:23:22 -1000)

are available in the Git repository at:

  git://git.openembedded.org/openembedded-core-contrib stable/dunfell-next
  http://cgit.openembedded.org/openembedded-core-contrib/log/?h=stable/dunfell-next

Alexander Kanavin (2):
  oeqa: tear down oeqa decorators if one of them raises an exception in
    setup
  meta/lib/oeqa/core/tests/cases/timeout.py: add a testcase for the
    previous fix

Diego Sueiro (1):
  oeqa/selftest/bblayers: Add test case for bitbake-layers
    layerindex-show-depends

Konrad Weihmann (1):
  cve-update-db-native: skip on empty cpe23Uri

Marek Vasut (1):
  linux-firmware: Package RSI 911x WiFi firmware

Reto Schneider (2):
  license_image.bbclass: Detect broken symlinks
  license_image.bbclass: Fix symlink to generic license files

Richard Purdie (1):
  yocto-check-layer: Avoid bug when iterating and autoadding
    dependencies

Vinay Kumar (1):
  Binutils: Fix CVE-2021-20197

Zhang Qiang (1):
  kernel.bbclass: Configuration for environment with HOSTCXX

 meta/classes/kernel.bbclass                   |   2 +
 meta/classes/license_image.bbclass            |  20 +-
 meta/lib/oeqa/core/case.py                    |   9 +-
 meta/lib/oeqa/core/decorator/oetimeout.py     |   5 +-
 meta/lib/oeqa/core/tests/cases/timeout.py     |  13 +
 meta/lib/oeqa/core/tests/test_decorators.py   |   6 +
 meta/lib/oeqa/selftest/cases/bblayers.py      |   5 +
 .../recipes-core/meta/cve-update-db-native.bb |   7 +-
 .../binutils/binutils-2.34.inc                |   1 +
 .../binutils/binutils/CVE-2021-20197.patch    | 572 ++++++++++++++++++
 .../linux-firmware/linux-firmware_20210208.bb |  11 +
 scripts/yocto-check-layer                     |   3 +
 12 files changed, 645 insertions(+), 9 deletions(-)
 create mode 100644 meta/recipes-devtools/binutils/binutils/CVE-2021-20197.patch

-- 
2.25.1

