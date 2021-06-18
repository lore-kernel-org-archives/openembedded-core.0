Received: from mail-ot1-f49.google.com (mail-ot1-f49.google.com [209.85.210.49])
 by mx.groups.io with SMTP id smtpd.web11.1458.1623975210528309906
 for <openembedded-core@lists.openembedded.org>;
 Thu, 17 Jun 2021 17:13:31 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@sakoman-com.20150623.gappssmtp.com header.s=20150623 header.b=0PUm6j8x;
 spf=softfail (domain: sakoman.com, ip: 209.85.210.49, mailfrom: steve@sakoman.com)
Received: by mail-ot1-f49.google.com with SMTP id i12-20020a05683033ecb02903346fa0f74dso7944626otu.10
        for <openembedded-core@lists.openembedded.org>; Thu, 17 Jun 2021 17:13:30 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=sakoman-com.20150623.gappssmtp.com; s=20150623;
        h=from:to:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=R4Sd0xaq82GufDkifeWGka2E/+ySfjKirfJyb99UiC0=;
        b=0PUm6j8xufZ1zZ35+OeLm/WrF2GG6DjK0Trv4vxDvn88er4U9VxX5acjQeuMzDU/7c
         8wo6agxGiiu3NpNy6gg8MOMDGkyBMzgj7win6v8eJKSDVW8sSHZBenHbX8H0ov4LLQdI
         ZMjIPn+NThceu9SDVxhrpV+6mG6Wpm8KhNI9l3ReNdHQ2FxNc/rovpxjOVNn8GmFhiyp
         F8dfFiw3Haq5+iZyaR3qUDJsnZPPM443qC6gOg6zhCmFC40em47huWV/0+wft1LG8ecJ
         VK8K9B5NY3qUI4NgrT/QAQihzChi+2giXiCWdlFIK5m5/BjB3u2F34gP1ihhs3xhIeEt
         RsGA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=R4Sd0xaq82GufDkifeWGka2E/+ySfjKirfJyb99UiC0=;
        b=Hl64o6x1YKizDO7k5M0199Bia012p4h8ndWg4GkPQJt9nk8erKCUXFFpcIbIzT9tJa
         fZtwJe/mC7MXQ1iZTyQbsCWJ7uuv541rUvTqE0yQrMMRVA3lb1txZCUUdhwBUXeJg8VZ
         kfqqVYCV7l+rS5h0sUnjHYawSlU1CBJhtUwiAlLL2pMTl9v3av6hrjMnDpbA3X5+gxjE
         tQKbM0KN1drabmpVWgE10eOuMvXGxBbb/AN8ygT5spoeGSOhe8awj9Cn/ynxTXIgF7+Q
         X7xlxxGEqo8a0aeuioflSmxmcFuHcT5QY6MiG98cJq9Z/vfpI9kQ6S0HUdhhB22wlszj
         9Xsw==
X-Gm-Message-State: AOAM532q5ej2hAtbJiQ3OYhxBp4C3uRCCoxvXLXB8w2lARN5RaZRKATI
	mlwfWCuVp+om2uBVqJlMAcr3RPidjO7Fgvg//Rk=
X-Google-Smtp-Source: ABdhPJyipeBOwgFuqt+3zRhmIrG2Tr59oXcllYR3Z3oHKcCBTNJoAD7XcRWLGngoxQnsyS2dA6uGyg==
X-Received: by 2002:a9d:2034:: with SMTP id n49mr7233106ota.231.1623975209262;
        Thu, 17 Jun 2021 17:13:29 -0700 (PDT)
Return-Path: <steve@sakoman.com>
Received: from localhost.localdomain ([172.243.4.16])
        by smtp.gmail.com with ESMTPSA id x2sm1473805oog.10.2021.06.17.17.13.25
        for <openembedded-core@lists.openembedded.org>
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 17 Jun 2021 17:13:28 -0700 (PDT)
From: "Steve Sakoman" <steve@sakoman.com>
To: openembedded-core@lists.openembedded.org
Subject: [OE-core][dunfell 0/6] Pull request (cover letter only)
Date: Thu, 17 Jun 2021 14:13:04 -1000
Message-Id: <cover.1623975093.git.steve@sakoman.com>
X-Mailer: git-send-email 2.25.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

The following changes since commit 2246b0d7a71c69eb2e89c55991d1387069895466:

  kernel-devicetree: Introduce KERNEL_DTC_FLAGS to pass dtc flags (2021-06-08 04:32:17 -1000)

are available in the Git repository at:

  git://git.openembedded.org/openembedded-core-contrib stable/dunfell-next
  http://cgit.openembedded.org/openembedded-core-contrib/log/?h=stable/dunfell-next

Andrea Adami (1):
  kernel.bbclass: fix do_sizecheck() comparison

Kai Kang (1):
  valgrind: fix a typo

Lee Chee Yang (4):
  gstreamer-plugins-good: fix CVE-2021-3497 CVE-2021-3498
  bind: 9.11.22 -> 9.11.32
  ruby: 2.7.1 -> 2.7.3
  python3: fix CVE-2021-23336

 meta/classes/kernel.bbclass                   |   2 +-
 .../bind/bind/CVE-2020-8625.patch             |  17 -
 .../bind/{bind_9.11.22.bb => bind_9.11.32.bb} |   5 +-
 .../python/python3/CVE-2021-23336.patch       | 530 ++++++++++++++++++
 meta/recipes-devtools/python/python3_3.8.2.bb |   1 +
 .../ruby/ruby/CVE-2020-25613.patch            |  40 --
 .../ruby/{ruby_2.7.1.bb => ruby_2.7.3.bb}     |   5 +-
 .../valgrind/valgrind_3.15.0.bb               |   2 +-
 .../CVE-2021-3497.patch                       | 207 +++++++
 .../CVE-2021-3498.patch                       |  44 ++
 .../gstreamer1.0-plugins-good_1.16.3.bb       |   2 +
 11 files changed, 790 insertions(+), 65 deletions(-)
 delete mode 100644 meta/recipes-connectivity/bind/bind/CVE-2020-8625.patch
 rename meta/recipes-connectivity/bind/{bind_9.11.22.bb => bind_9.11.32.bb} (96%)
 create mode 100644 meta/recipes-devtools/python/python3/CVE-2021-23336.patch
 delete mode 100644 meta/recipes-devtools/ruby/ruby/CVE-2020-25613.patch
 rename meta/recipes-devtools/ruby/{ruby_2.7.1.bb => ruby_2.7.3.bb} (94%)
 create mode 100644 meta/recipes-multimedia/gstreamer/gstreamer1.0-plugins-good/CVE-2021-3497.patch
 create mode 100644 meta/recipes-multimedia/gstreamer/gstreamer1.0-plugins-good/CVE-2021-3498.patch

-- 
2.25.1

