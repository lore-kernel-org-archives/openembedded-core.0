Return-Path: <steve@sakoman.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 97115CDB47E
	for <webhook@archiver.kernel.org>; Fri, 13 Oct 2023 21:53:03 +0000 (UTC)
Received: from mail-pf1-f180.google.com (mail-pf1-f180.google.com [209.85.210.180])
 by mx.groups.io with SMTP id smtpd.web10.51134.1697233981976941969
 for <openembedded-core@lists.openembedded.org>;
 Fri, 13 Oct 2023 14:53:02 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@sakoman-com.20230601.gappssmtp.com header.s=20230601 header.b=LEFjNreZ;
 spf=softfail (domain: sakoman.com, ip: 209.85.210.180, mailfrom: steve@sakoman.com)
Received: by mail-pf1-f180.google.com with SMTP id d2e1a72fcca58-68fb85afef4so2173628b3a.1
        for <openembedded-core@lists.openembedded.org>; Fri, 13 Oct 2023 14:53:01 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=sakoman-com.20230601.gappssmtp.com; s=20230601; t=1697233981; x=1697838781; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:to
         :from:from:to:cc:subject:date:message-id:reply-to;
        bh=VBCBxC0zXT8GOqJEW+xBNnEDQdKF9IL/nuJhWvghre8=;
        b=LEFjNreZ94mDrmx+ITX9LM+QYNMcd4F7XnpZ1+x7GynuUIYteunhJg5WXeKQBX/7Nh
         cuhmCUYSyC4nvYSDZNVQy2jl5V7K+Kp2bkCU58QbJOc8cuLCqLaD9lQagaE9YZoziH6s
         IW+Clzx83WL1UdFwLG1AH8Nhz6a7uqQ3dn254TR75UWArZA6z4JL5WoW7oAxWv034lJ0
         6nqpdcQg4vCMoKxCf3j/gjDTYtPhXMNVaaZFIBKNGtecrAM835j+EhY884vqehL16D0h
         OfuK3GxwEVAJzYsXFrhwJLM9K29EWERYOXvmx+H8nIwIpUtxeKCzWwUUQlBJ0dwMrLnc
         yGwg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1697233981; x=1697838781;
        h=content-transfer-encoding:mime-version:message-id:date:subject:to
         :from:x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=VBCBxC0zXT8GOqJEW+xBNnEDQdKF9IL/nuJhWvghre8=;
        b=SfTNN/o81cweBXr8hHB4iW8wUyuJFZxmw4khvCOc63eBjYcpkQ5kI8yjUO4lZhhdXL
         P2nPLCqZ1WjL18HZ4WgV09iwVu+v1/yVVV/crOn3uwwTQG/MgJINpIh3iUlm7pr5fb4D
         BcIpCrPPYZLNGc1yyck8QsnJBt/foqZ0xxW8V7D8aShoH0CtQSp+o1voy7EEjECVfu8L
         DAF8QzubmZ/gUwOabOJVLJ8KO3wRdGnefc/6/J0yscgzN3tgIGaYZTrCyYyPxMYqpnPn
         /EXuiJp57ujrvCsG2KzYl3yM6MvG0yaw08W52FTonoSojBg6YjVBIb3G1sVZlyqf8iGf
         rCKg==
X-Gm-Message-State: AOJu0Yyf1S6OsHmOSX4ZwclW4NL5/qWaS4R9r1cnSWrYZaDCmE32ftAQ
	h/vGokYeCgxkmwRdHWiTrjLyyWrPOuJiAjrXh+Q=
X-Google-Smtp-Source: AGHT+IGHIGmLwm8StaxMXGKf/ZU4x97ZD1OKVPMxIXSOTdTdV4IHUv/TdzYH37FX2CnL02/YCO/9/Q==
X-Received: by 2002:a05:6a00:1342:b0:6b2:7a88:7128 with SMTP id k2-20020a056a00134200b006b27a887128mr3003718pfu.22.1697233980625;
        Fri, 13 Oct 2023 14:53:00 -0700 (PDT)
Received: from hexa.router0800d9.com (dhcp-72-234-106-30.hawaiiantel.net. [72.234.106.30])
        by smtp.gmail.com with ESMTPSA id u22-20020a62ed16000000b00690fe1c928csm14307334pfh.147.2023.10.13.14.52.59
        for <openembedded-core@lists.openembedded.org>
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 13 Oct 2023 14:53:00 -0700 (PDT)
From: Steve Sakoman <steve@sakoman.com>
To: openembedded-core@lists.openembedded.org
Subject: [OE-core][mickledore 00/27] Patch review
Date: Fri, 13 Oct 2023 11:52:24 -1000
Message-Id: <cover.1697233866.git.steve@sakoman.com>
X-Mailer: git-send-email 2.34.1
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Fri, 13 Oct 2023 21:53:03 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/189077

Please review this set of changes for mickledore and have comments back by
end of day Tuesday, October 17

Passed a-full on autobuilder:

https://autobuilder.yoctoproject.org/typhoon/#/builders/83/builds/6043

The following changes since commit c451a9cb6adbc9480dacd81e935a0b9369f22e07:

  libgudev: explicitly disable tests and vapi (2023-10-11 08:01:07 -1000)

are available in the Git repository at:

  https://git.openembedded.org/openembedded-core-contrib stable/mickledore-nut
  https://git.openembedded.org/openembedded-core-contrib/log/?h=stable/mickledore-nut

Alexander Kanavin (9):
  gzip: update 1.12 -> 1.13
  screen: update 4.9.0 -> 4.9.1
  runqemu: check permissions of available render nodes as well as their
    presence
  build-sysroots: target or native sysroot population need to be
    selected explicitly
  igt-gpu-tools: do not write shortened git commit hash into binaries
  ptest: report tests that were killed on timeout
  strace: parallelize ptest
  openssl: parallelize tests
  openssl: ensure all ptest fails are caught

Archana Polampalli (2):
  curl: fix CVE-2023-38545
  curl: fix CVE-2023-38546

Eilís 'pidge' Ní Fhlannagáin (1):
  nativesdk-intercept: Fix bad intercept chgrp/chown logic

Joe Slater (1):
  ghostscript: fix CVE-2023-43115

Khem Raj (1):
  libc-test: Run as non-root user

Mikko Rapeli (2):
  oeqa dnf_runtime.py: fix HTTP server IP address and port
  oeqa/selftest/context.py: check git command return values

Otavio Salvador (2):
  weston-init: remove misleading comment about udev rule
  weston-init: fix init code indentation

Peter Kjellerstedt (1):
  libsoup-2.4: Only specify --cross-file when building for target

Richard Purdie (1):
  oeqa/selftest/wic: Improve assertTrue calls

Ross Burton (1):
  avahi: handle invalid service types gracefully

Siddharth Doshi (1):
  vim: Upgrade 9.0.1894 -> 9.0.2009

Stefan Tauner (1):
  gdb: fix RDEPENDS for PACKAGECONFIG[tui]

Wang Mingyu (2):
  dbus: upgrade 1.14.8 -> 1.14.10
  wireless-regdb: upgrade 2023.05.03 -> 2023.09.01

Yogita Urade (2):
  tiff: fix CVE-2023-40745
  tiff: fix CVE-2023-41175

 .../lib/oeqa/runtime/cases/dnf_runtime.py     |   3 +-
 meta/files/ext-sdk-prepare.py                 |   2 +-
 meta/lib/oeqa/runtime/cases/ptest.py          |   2 +-
 meta/lib/oeqa/selftest/cases/meta_ide.py      |   5 +-
 meta/lib/oeqa/selftest/cases/wic.py           |  36 ++---
 meta/lib/oeqa/selftest/context.py             |   2 +-
 meta/recipes-connectivity/avahi/avahi_0.8.bb  |   1 +
 .../avahi/files/invalid-service.patch         |  29 ++++
 .../openssl/openssl/run-ptest                 |   2 +-
 .../dbus/{dbus_1.14.8.bb => dbus_1.14.10.bb}  |   2 +-
 meta/recipes-core/meta/build-sysroots.bb      |  12 +-
 .../musl/libc-test/run-libc-ptests            |  28 ++++
 meta/recipes-core/musl/libc-test/run-ptest    |  29 +---
 meta/recipes-core/musl/libc-test_git.bb       |   5 +
 meta/recipes-devtools/gdb/gdb-common.inc      |   3 +-
 meta/recipes-devtools/strace/strace/run-ptest |   2 +-
 .../ghostscript/CVE-2023-43115.patch          |  62 +++++++
 .../ghostscript/ghostscript_10.0.0.bb         |   1 +
 .../wrong-path-fix.patch                      |   0
 .../gzip/{gzip_1.12.bb => gzip_1.13.bb}       |   6 +-
 ...-Add-needed-system-headers-in-checks.patch | 151 ------------------
 .../screen/screen/signal-permission.patch     |  40 -----
 .../{screen_4.9.0.bb => screen_4.9.1.bb}      |   4 +-
 .../igt-gpu-tools/igt-gpu-tools_git.bb        |   2 +-
 meta/recipes-graphics/wayland/weston-init.bb  |   2 +-
 .../recipes-graphics/wayland/weston-init/init |   2 +-
 ....05.03.bb => wireless-regdb_2023.09.01.bb} |   2 +-
 .../libtiff/files/CVE-2023-40745.patch        |  35 ++++
 .../libtiff/files/CVE-2023-41175.patch        |  63 ++++++++
 meta/recipes-multimedia/libtiff/tiff_4.5.1.bb |   5 +-
 .../curl/curl/CVE-2023-38545.patch            | 133 +++++++++++++++
 .../curl/curl/CVE-2023-38546.patch            | 137 ++++++++++++++++
 meta/recipes-support/curl/curl_8.0.1.bb       |   2 +
 .../libsoup/libsoup-2.4_2.74.3.bb             |   2 +-
 meta/recipes-support/vim/vim.inc              |   4 +-
 scripts/lib/devtool/sdk.py                    |   3 +-
 scripts/nativesdk-intercept/chgrp             |   5 +-
 scripts/nativesdk-intercept/chown             |   5 +-
 scripts/runqemu                               |  14 +-
 39 files changed, 575 insertions(+), 268 deletions(-)
 create mode 100644 meta/recipes-connectivity/avahi/files/invalid-service.patch
 rename meta/recipes-core/dbus/{dbus_1.14.8.bb => dbus_1.14.10.bb} (98%)
 create mode 100644 meta/recipes-core/musl/libc-test/run-libc-ptests
 create mode 100644 meta/recipes-extended/ghostscript/ghostscript/CVE-2023-43115.patch
 rename meta/recipes-extended/gzip/{gzip-1.12 => gzip-1.13}/wrong-path-fix.patch (100%)
 rename meta/recipes-extended/gzip/{gzip_1.12.bb => gzip_1.13.bb} (88%)
 delete mode 100644 meta/recipes-extended/screen/screen/0001-configure-Add-needed-system-headers-in-checks.patch
 delete mode 100644 meta/recipes-extended/screen/screen/signal-permission.patch
 rename meta/recipes-extended/screen/{screen_4.9.0.bb => screen_4.9.1.bb} (89%)
 rename meta/recipes-kernel/wireless-regdb/{wireless-regdb_2023.05.03.bb => wireless-regdb_2023.09.01.bb} (94%)
 create mode 100644 meta/recipes-multimedia/libtiff/files/CVE-2023-40745.patch
 create mode 100644 meta/recipes-multimedia/libtiff/files/CVE-2023-41175.patch
 create mode 100644 meta/recipes-support/curl/curl/CVE-2023-38545.patch
 create mode 100644 meta/recipes-support/curl/curl/CVE-2023-38546.patch

-- 
2.34.1


