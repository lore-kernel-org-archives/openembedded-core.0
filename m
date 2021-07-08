Received: from mail-ot1-f43.google.com (mail-ot1-f43.google.com [209.85.210.43])
 by mx.groups.io with SMTP id smtpd.web08.5553.1625703861864311761
 for <openembedded-core@lists.openembedded.org>;
 Wed, 07 Jul 2021 17:24:22 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@sakoman-com.20150623.gappssmtp.com header.s=20150623 header.b=S1oJjhOC;
 spf=softfail (domain: sakoman.com, ip: 209.85.210.43, mailfrom: steve@sakoman.com)
Received: by mail-ot1-f43.google.com with SMTP id 75-20020a9d08510000b02904acfe6bcccaso4098881oty.12
        for <openembedded-core@lists.openembedded.org>; Wed, 07 Jul 2021 17:24:21 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=sakoman-com.20150623.gappssmtp.com; s=20150623;
        h=from:to:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=BMtHYdLUyNY4XU5kh2piGGXosvNY78QjwOiZWrv8soU=;
        b=S1oJjhOCMS+L1jtMGam2tGzb4Mx0eXxajkp5aPHwK6ufGkvKtlDj+R2uQSMI51TyCq
         TGhR5VnyrLYXWJAZAG5rceDZBQpHR9SgOvbE2ws6cETLQUh+ZCCQsAkgXSVXKuI73d7X
         ZG7Kotw6dSCxY+vp8LIsP6ARmbsU++HjOt4Y3g4Q4wDFfSvuN6RJzYGmQJWDdxQJ+PPX
         XRi4T1D9aj5ZeVNdE2ClLR69oDwXuoi9FVUbDE8ecmKUFfAqtcM6dG3NV6H72hIQXh19
         uuvhEQZ27m6wnzacEDTWAE2x9A98jmM8H47VK7dbC+aXb8C5TrJ6xz9KEIT/mKQCUK4u
         UNfA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=BMtHYdLUyNY4XU5kh2piGGXosvNY78QjwOiZWrv8soU=;
        b=V4Q+n3EL95uKYEVD2s6OUB0/VzE+06KIkLy4kTZY/PgqkRpmE9HNeLP+8dZiLoz1So
         2ECcWh+Fmerox6C0S7C3vygB8kaSMmmfj03CWQ0K/+VSt/n8+AH+eMikYsV6eKv1JA46
         lilnDNXK7ixA7f49IpawhXc/43HzTPgJP4jHFlSSH24F4UgBCP2NHwKhbM0DTfWJOEfa
         EKY4+K5w+Lqvvv9o/6YDYUB0q8MvWNAIvwSJ3u9+sw8ImTtpJKJ0xl+QRR7E8C0F9AxS
         BfeMjtq5IlX6/uy7m+53oe0JjD3JJrH0T5H98WDKbcJLsajbe0crI2kPvo72WdqBFKtq
         7RHw==
X-Gm-Message-State: AOAM530z6T2g+/ciARV1lWobV9lA2jpL30jNbSOmh5v85tkqFM8sHd3h
	8aXrB9b+fcPYV2b14MZ+f290WULKM/zj+Nb0
X-Google-Smtp-Source: ABdhPJzeQUXVeGqPNBgHy8lxF1bi67u1mH1TBZHxpYW76PrizP4xUSd+VuxEfHKm2coUBnl9MfU23A==
X-Received: by 2002:a9d:1ec:: with SMTP id e99mr16349831ote.89.1625703860616;
        Wed, 07 Jul 2021 17:24:20 -0700 (PDT)
Return-Path: <steve@sakoman.com>
Received: from hexa.router0800d9.com ([172.243.4.16])
        by smtp.gmail.com with ESMTPSA id o20sm95706ook.40.2021.07.07.17.24.17
        for <openembedded-core@lists.openembedded.org>
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 07 Jul 2021 17:24:20 -0700 (PDT)
From: "Steve Sakoman" <steve@sakoman.com>
To: openembedded-core@lists.openembedded.org
Subject: [OE-core][dunfell 00/18] Pull request (cover letter only)
Date: Wed,  7 Jul 2021 14:23:06 -1000
Message-Id: <cover.1625703708.git.steve@sakoman.com>
X-Mailer: git-send-email 2.25.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

The following changes since commit 9423ad8f0f42d249c2fcb1b86ec9abb75854f011:

  python3-ptest: add newly discovered missing rdeps (2021-06-28 05:01:39 -1000)

are available in the Git repository at:

  git://git.openembedded.org/openembedded-core-contrib stable/dunfell-next
  http://cgit.openembedded.org/openembedded-core-contrib/log/?h=stable/dunfell-next

Alexander Kanavin (2):
  python3: apply test skipping patch unconditionally
  selftest: do not hardcode /tmp/sdk

Bruce Ashfield (4):
  linux-yocto/5.4: update to v5.4.124
  linux-yocto/5.4: update to v5.4.125
  linux-yocto/5.4: update to v5.4.128
  linux-yocto/5.4: update to v5.4.129

Florian Amstutz (1):
  devtool: deploy-target: Fix preserving attributes when using --strip

Michael Ho (1):
  sstate.bbclass: fix errors about read-only sstate mirrors

Minjae Kim (2):
  rpm: fix CVE-2021-3421
  gstreamer-plugins-base: fix CVE-2021-3522

Richard Purdie (7):
  kernel: Fix interaction when packaging disabled
  kernel-devicetree: Fix interaction when packaging disabled
  perf: Use python3targetconfig to ensure we use target libraries
  package_pkgdata: Avoid task hash mismatches for generic task changes
  oeqa/selftest/runcmd: Tweal test timeouts
  sstate/staging: Handle directory creation race issue
  oeqa/selftest/archiver: Allow tests to ignore empty directories

Tim Orling (1):
  python3: skip tests requiring tools-sdk

 meta/classes/kernel-devicetree.bbclass        |  11 +-
 meta/classes/kernel.bbclass                   |   2 +
 meta/classes/package_pkgdata.bbclass          |   2 +-
 meta/classes/sstate.bbclass                   |  16 +-
 meta/classes/staging.bbclass                  |   6 +-
 meta/lib/oeqa/selftest/cases/archiver.py      |  16 +-
 meta/lib/oeqa/selftest/cases/runcmd.py        |   4 +-
 meta/lib/oeqa/selftest/cases/runtime_test.py  |  28 ++-
 ...pes.test_find-skip-without-tools-sdk.patch |  33 +++
 .../recipes-devtools/python/python3_3.8.10.bb |   1 +
 .../rpm/files/CVE-2021-3421.patch             | 197 ++++++++++++++++++
 meta/recipes-devtools/rpm/rpm_4.14.2.1.bb     |   1 +
 .../linux/linux-yocto-rt_5.4.bb               |   6 +-
 .../linux/linux-yocto-tiny_5.4.bb             |   8 +-
 meta/recipes-kernel/linux/linux-yocto_5.4.bb  |  22 +-
 meta/recipes-kernel/perf/perf.bb              |   2 +-
 .../CVE-2021-3522.patch                       |  36 ++++
 .../gstreamer1.0-plugins-base_1.16.3.bb       |   1 +
 scripts/lib/devtool/deploy.py                 |   2 +-
 19 files changed, 337 insertions(+), 57 deletions(-)
 create mode 100644 meta/recipes-devtools/python/python3/0001-test_ctypes.test_find-skip-without-tools-sdk.patch
 create mode 100644 meta/recipes-devtools/rpm/files/CVE-2021-3421.patch
 create mode 100644 meta/recipes-multimedia/gstreamer/gstreamer1.0-plugins-base/CVE-2021-3522.patch

-- 
2.25.1

