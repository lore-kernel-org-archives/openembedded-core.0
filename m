Return-Path: <steve@sakoman.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 21FFFC43334
	for <webhook@archiver.kernel.org>; Wed,  6 Jul 2022 14:49:54 +0000 (UTC)
Received: from mail-pl1-f182.google.com (mail-pl1-f182.google.com
 [209.85.214.182])
 by mx.groups.io with SMTP id smtpd.web10.7100.1657118992237639686
 for <openembedded-core@lists.openembedded.org>;
 Wed, 06 Jul 2022 07:49:52 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@sakoman-com.20210112.gappssmtp.com header.s=20210112
 header.b=QORY+1hh;
 spf=softfail (domain: sakoman.com, ip: 209.85.214.182,
 mailfrom: steve@sakoman.com)
Received: by mail-pl1-f182.google.com with SMTP id y18so5829979plb.2
        for <openembedded-core@lists.openembedded.org>;
 Wed, 06 Jul 2022 07:49:52 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=sakoman-com.20210112.gappssmtp.com; s=20210112;
        h=from:to:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=utGTCDlarwP9gxqz4k2ASbAu9CPhRYca5iS9Q6iuN/w=;
        b=QORY+1hhbkD8ZZ+iHhrRMOTEfpwmudoK2M21Yr+mj671LSzGtQ9EcZdUbNSB9ZchCZ
         Wbhj5M4C8vQ9WSSg+GDw10LiCRhKRu7h1sWehef3BQKry8ByZzoRplYym103ysEWpYF4
         aGsSmHeOOLfUPXiINnucEXX9m1nXucXSXs+ysY5c9RkSIRjdpKbebIwp+m7xIo6thtgl
         jiATnd6VA73FHgL+CgqE4bineGta3AR8YORsNegHgRiwyOy1rbMoPvqeUHJPt54r5uHI
         XGFjFIHG9SQNLradj0+4eCMyHeVZD4CRZ8B6URm/aQez69knnydZKQbDiGlWNxGKU/uT
         C2Wg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:from:to:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=utGTCDlarwP9gxqz4k2ASbAu9CPhRYca5iS9Q6iuN/w=;
        b=aMuO89l9Oxyl2GYGJ4Jf+80OFLuEjziUJbz41ep75bg8VHzNo/YHLrjzE1k/lWc1Mu
         fNvL50/ueL5+wSDGdxQDFhZmHhPtFhIBeP6BFG3kJN7Nw0Aygchw6ZBK3iqLOcMbDWe/
         CZujf5YU5Mbmqj0Oe7PFdiqy6HdcwdbRin3TnIHcmYWMLAD+Z6kLuRqJlorpQWZZhJDj
         Ftd1l8kxjKqgnVXIj2TmGLdrrasXjfcZUoapUYKkzdMSC1PLiTQcHwDyCZZ12EGGBkgX
         VLnCcGhetCThGRD9iIyQ8LALLIOs1vKQ6ChVzTBIEby3BcuMmrL5gy+2PIA6UxeNcwpD
         DBfg==
X-Gm-Message-State: AJIora9Q1omLndCz0oI63M9HHFbkcpaGNjzRHQj8wKx1ZnMwKxoEf8F6
	c3mKExnGBGxaD4CVB8M7IbNfduHYYgEek0yp
X-Google-Smtp-Source: 
 AGRyM1uKDEk2XbOpGOHfMXfFZdBjKHBBKPe8JREssU2K0qO9fjMDm1ueuouFe4nKn4CFIbJFseHIsA==
X-Received: by 2002:a17:902:f78e:b0:168:fffc:fd57 with SMTP id
 q14-20020a170902f78e00b00168fffcfd57mr47975689pln.149.1657118990961;
        Wed, 06 Jul 2022 07:49:50 -0700 (PDT)
Received: from hexa.router0800d9.com (dhcp-72-253-6-214.hawaiiantel.net.
 [72.253.6.214])
        by smtp.gmail.com with ESMTPSA id
 e14-20020a17090301ce00b0016be82cc7b4sm6326940plh.8.2022.07.06.07.49.48
        for <openembedded-core@lists.openembedded.org>
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 06 Jul 2022 07:49:49 -0700 (PDT)
From: Steve Sakoman <steve@sakoman.com>
To: openembedded-core@lists.openembedded.org
Subject: [OE-core][dunfell 00/12] Pull request (cover letter only)
Date: Wed,  6 Jul 2022 04:49:39 -1000
Message-Id: <cover.1657118922.git.steve@sakoman.com>
X-Mailer: git-send-email 2.25.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Wed, 06 Jul 2022 14:49:54 -0000
X-Groupsio-URL: 
 https://lists.openembedded.org/g/openembedded-core/message/167730

The following changes since commit c6f5fb5e7545636ef7948ad1562548b7b64dac35:

  linux-firmware: upgrade 20220509 -> 20220610 (2022-06-20 07:32:00 -1000)

are available in the Git repository at:

  git://git.openembedded.org/openembedded-core-contrib stable/dunfell-next
  http://cgit.openembedded.org/openembedded-core-contrib/log/?h=stable/dunfell-next

Ahmed Hossam (1):
  insane.bbclass: host-user-contaminated: Correct per package home path

Alexander Kanavin (1):
  wireless-regdb: upgrade 2022.04.08 -> 2022.06.06

Hitendra Prajapati (3):
  golang: CVE-2022-24675 encoding/pem: fix stack overflow in Decode
  golang: CVE-2021-31525 net/http: panic in ReadRequest and ReadResponse
    when reading a very large header
  grub2: CVE-2021-3981 Incorrect permission in grub.cfg allow
    unprivileged user to read the file content

Joe Slater (1):
  unzip: fix CVE-2021-4217

Marek Vasut (1):
  lttng-modules: Backport Linux 5.18+, 5.15.44+, 5.10.119+ fixes

Marta Rybczynska (2):
  cve-check: add support for Ignored CVEs
  oeqa/selftest/cve_check: add tests for Ignored and partial reports

Martin Jansa (1):
  wic: fix WicError message

Muhammad Hamza (1):
  initramfs-framework: move storage mounts to actual rootfs

Richard Purdie (1):
  unzip: Port debian fixes for two CVEs

 meta/classes/cve-check.bbclass                |  41 ++-
 meta/classes/insane.bbclass                   |   2 +-
 meta/lib/oeqa/selftest/cases/cve_check.py     |  82 ++++++
 .../grub/files/CVE-2021-3981.patch            |  32 +++
 meta/recipes-bsp/grub/grub2.inc               |   1 +
 .../initrdscripts/initramfs-framework/finish  |   9 +
 meta/recipes-devtools/go/go-1.14.inc          |   2 +
 .../go/go-1.14/CVE-2021-31525.patch           |  38 +++
 .../go/go-1.14/CVE-2022-24675.patch           | 271 ++++++++++++++++++
 .../unzip/unzip/CVE-2021-4217.patch           |  67 +++++
 .../unzip/unzip/CVE-2022-0529.patch           |  39 +++
 .../unzip/unzip/CVE-2022-0530.patch           |  33 +++
 meta/recipes-extended/unzip/unzip_6.0.bb      |   3 +
 ...ndom-remove-unused-tracepoints-v5.18.patch |  46 +++
 ...emove-unused-tracepoints-v5.10-v5.15.patch |  45 +++
 ...racepoints-removed-in-stable-kernels.patch |  51 ++++
 .../lttng/lttng-modules_2.11.6.bb             |   3 +
 ....04.08.bb => wireless-regdb_2022.06.06.bb} |   2 +-
 scripts/wic                                   |   2 +-
 19 files changed, 754 insertions(+), 15 deletions(-)
 create mode 100644 meta/recipes-bsp/grub/files/CVE-2021-3981.patch
 create mode 100644 meta/recipes-devtools/go/go-1.14/CVE-2021-31525.patch
 create mode 100644 meta/recipes-devtools/go/go-1.14/CVE-2022-24675.patch
 create mode 100644 meta/recipes-extended/unzip/unzip/CVE-2021-4217.patch
 create mode 100644 meta/recipes-extended/unzip/unzip/CVE-2022-0529.patch
 create mode 100644 meta/recipes-extended/unzip/unzip/CVE-2022-0530.patch
 create mode 100644 meta/recipes-kernel/lttng/lttng-modules/0017-fix-random-remove-unused-tracepoints-v5.18.patch
 create mode 100644 meta/recipes-kernel/lttng/lttng-modules/0018-fix-random-remove-unused-tracepoints-v5.10-v5.15.patch
 create mode 100644 meta/recipes-kernel/lttng/lttng-modules/0019-fix-random-tracepoints-removed-in-stable-kernels.patch
 rename meta/recipes-kernel/wireless-regdb/{wireless-regdb_2022.04.08.bb => wireless-regdb_2022.06.06.bb} (94%)

-- 
2.25.1


