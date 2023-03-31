Return-Path: <steve@sakoman.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 4A669C76196
	for <webhook@archiver.kernel.org>; Fri, 31 Mar 2023 14:23:29 +0000 (UTC)
Received: from mail-pl1-f171.google.com (mail-pl1-f171.google.com [209.85.214.171])
 by mx.groups.io with SMTP id smtpd.web11.56119.1680272606551772321
 for <openembedded-core@lists.openembedded.org>;
 Fri, 31 Mar 2023 07:23:26 -0700
Authentication-Results: mx.groups.io;
 dkim=fail reason="signature has expired" header.i=@sakoman-com.20210112.gappssmtp.com header.s=20210112 header.b=ZXZDlIyi;
 spf=softfail (domain: sakoman.com, ip: 209.85.214.171, mailfrom: steve@sakoman.com)
Received: by mail-pl1-f171.google.com with SMTP id ja10so21370810plb.5
        for <openembedded-core@lists.openembedded.org>; Fri, 31 Mar 2023 07:23:26 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=sakoman-com.20210112.gappssmtp.com; s=20210112; t=1680272605; x=1682864605;
        h=content-transfer-encoding:mime-version:message-id:date:subject:to
         :from:from:to:cc:subject:date:message-id:reply-to;
        bh=tSblDAjPNvIFD5W+WYmGCDeIFLhSUk171MIW+XjYjbg=;
        b=ZXZDlIyi+8NU26mqXRrEzd4KUyKIdvxtSAIoQNKAvLT06wje1rS/jWxyB3ttuHfGxH
         r8C3DZOVRybSVjCzZtLNlEmndUvVBb5fo/GYHc1Qyh/TRx+xZU9txjUnARiYQgd+Lpsy
         BUdK8sedS+auMsg8P3YMcIBQuEWhqHfBbFHwpUgM/t93rE2KhVpmwb7vSkd09P5yISGD
         PYp2bBYIqOJwhqqC4zOdG2IALh1borL8sQ+3QSObFnYbGKdbvUdgFudE7r7siMolvRwr
         pkVkJTY0CVd8A1ZkpzWtnDg9LDxYnGcVGEtiscx6siJVNYVHGecqTjnWLNo+G4pXUGvx
         THzQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112; t=1680272605; x=1682864605;
        h=content-transfer-encoding:mime-version:message-id:date:subject:to
         :from:x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=tSblDAjPNvIFD5W+WYmGCDeIFLhSUk171MIW+XjYjbg=;
        b=xZsZxHdMRsBegh2jCBHJHyB559a7lHLjuZ00AobVwDwkCXRQFdLjIZDOOmB6mr9uTw
         2iSJl4YUCI137j9sWxxsc59n7ty1IxZAlE9P69l2DrqiBjaJOqvH3svPuJSx6ZsUORfV
         FQUEWoAuw7CbY46i5UG1yXhe+g36g4OAxZeewCOzt2MJN88EHi4G2TNUMz9fXEQFp+kr
         EDltfrjF8+bLOvLN5Fk2cP8ByjBh9D328Tf+5weUlt3VvwMnFKx8Zy27ob52ubs8h73Y
         TwTYClloK2n/FNi7tJtXAU+U9pGv33VN23GEPsojRg+4+MpVuO+cnS4kTn68hBK/rg4G
         Ecsw==
X-Gm-Message-State: AAQBX9fwJvaTTpGNR/0RybzUNDKzDq5KxKRjV4vrkBuOXbgT2UNYF77u
	/FJinxQVKZGyIQ396/M7yye9gRK05UoOK7ie7O4=
X-Google-Smtp-Source: AKy350bmt3sJArs+N0TEeej++1PAuWCw0TcTPBZrlJd5aQWBG4itXqaBpRMJkxeavtu2tdTUtsyACQ==
X-Received: by 2002:a17:902:cf0e:b0:1a1:b440:3773 with SMTP id i14-20020a170902cf0e00b001a1b4403773mr32119189plg.27.1680272605501;
        Fri, 31 Mar 2023 07:23:25 -0700 (PDT)
Received: from hexa.router0800d9.com (dhcp-72-253-4-112.hawaiiantel.net. [72.253.4.112])
        by smtp.gmail.com with ESMTPSA id c20-20020a170902b69400b0019f1027f88bsm1592240pls.307.2023.03.31.07.23.24
        for <openembedded-core@lists.openembedded.org>
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 31 Mar 2023 07:23:25 -0700 (PDT)
From: Steve Sakoman <steve@sakoman.com>
To: openembedded-core@lists.openembedded.org
Subject: [OE-core][dunfell 00/15] Pull request (cover letter only)
Date: Fri, 31 Mar 2023 04:23:20 -1000
Message-Id: <cover.1680272543.git.steve@sakoman.com>
X-Mailer: git-send-email 2.34.1
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Fri, 31 Mar 2023 14:23:29 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/179448

The following changes since commit a04b207c4ffa900313a0b5e3079ad2eec7d31f27:

  base-files: Drop localhost.localdomain from hosts file (2023-03-20 16:38:51 -1000)

are available in the Git repository at:

  https://git.openembedded.org/openembedded-core-contrib stable/dunfell-next
  http://cgit.openembedded.org/openembedded-core-contrib/log/?h=stable/dunfell-next

Bruce Ashfield (4):
  linux-yocto/5.4: update to v5.4.231
  linux-yocto/5.4: update to v5.4.233
  linux-yocto/5.4: update to v5.4.234
  linux-yocto/5.4: update to v5.4.237

Chee Yang Lee (2):
  qemu: fix multple CVEs
  git: ignore CVE-2023-22743

Joshua Watt (5):
  classes/create-spdx: Backport
  classes/package: Add extended packaged data
  licenses: Add GPL+ licenses to map
  create-spdx: Use gzip for compression
  classes/package: Use gzip for extended package data

Mikko Rapeli (1):
  oeqa rtc.py: skip if read-only-rootfs

Piotr Łobacz (1):
  systemd: fix wrong nobody-group assignment

Richard Purdie (1):
  pybootchartui: Fix python syntax issue

Ross Burton (1):
  lib/resulttool: fix typo breaking resulttool log --ptest

 meta/classes/create-spdx-2.2.bbclass          | 1067 +++
 meta/classes/create-spdx.bbclass              |    8 +
 meta/classes/package.bbclass                  |   39 +-
 meta/conf/licenses.conf                       |    7 +
 meta/files/spdx-licenses.json                 | 5937 +++++++++++++++++
 meta/lib/oe/packagedata.py                    |   11 +
 meta/lib/oe/sbom.py                           |   84 +
 meta/lib/oe/spdx.py                           |  357 +
 meta/lib/oeqa/runtime/cases/rtc.py            |    8 +-
 meta/recipes-core/systemd/systemd_244.5.bb    |    2 +-
 meta/recipes-devtools/git/git.inc             |    2 +
 meta/recipes-devtools/qemu/qemu.inc           |   17 +
 .../qemu/qemu/CVE-2020-15469-1.patch          |   50 +
 .../qemu/qemu/CVE-2020-15469-2.patch          |   69 +
 .../qemu/qemu/CVE-2020-15469-3.patch          |   49 +
 .../qemu/qemu/CVE-2020-15469-4.patch          |   53 +
 .../qemu/qemu/CVE-2020-15469-5.patch          |   53 +
 .../qemu/qemu/CVE-2020-15469-6.patch          |   61 +
 .../qemu/qemu/CVE-2020-15469-7.patch          |   50 +
 .../qemu/qemu/CVE-2020-15469-8.patch          |   44 +
 .../qemu/qemu/CVE-2020-15859.patch            |   39 +
 .../qemu/qemu/CVE-2020-35504.patch            |   51 +
 .../qemu/qemu/CVE-2020-35505.patch            |   42 +
 .../qemu/qemu/CVE-2021-3409-1.patch           |   85 +
 .../qemu/qemu/CVE-2021-3409-2.patch           |  103 +
 .../qemu/qemu/CVE-2021-3409-3.patch           |   71 +
 .../qemu/qemu/CVE-2021-3409-4.patch           |   52 +
 .../qemu/qemu/CVE-2021-3409-5.patch           |   93 +
 .../qemu/qemu/CVE-2022-26354.patch            |   57 +
 .../linux/linux-yocto-rt_5.4.bb               |    6 +-
 .../linux/linux-yocto-tiny_5.4.bb             |    8 +-
 meta/recipes-kernel/linux/linux-yocto_5.4.bb  |   22 +-
 scripts/lib/resulttool/resultutils.py         |    2 +-
 .../pybootchartgui/pybootchartgui/parsing.py  |    2 +-
 34 files changed, 8574 insertions(+), 27 deletions(-)
 create mode 100644 meta/classes/create-spdx-2.2.bbclass
 create mode 100644 meta/classes/create-spdx.bbclass
 create mode 100644 meta/files/spdx-licenses.json
 create mode 100644 meta/lib/oe/sbom.py
 create mode 100644 meta/lib/oe/spdx.py
 create mode 100644 meta/recipes-devtools/qemu/qemu/CVE-2020-15469-1.patch
 create mode 100644 meta/recipes-devtools/qemu/qemu/CVE-2020-15469-2.patch
 create mode 100644 meta/recipes-devtools/qemu/qemu/CVE-2020-15469-3.patch
 create mode 100644 meta/recipes-devtools/qemu/qemu/CVE-2020-15469-4.patch
 create mode 100644 meta/recipes-devtools/qemu/qemu/CVE-2020-15469-5.patch
 create mode 100644 meta/recipes-devtools/qemu/qemu/CVE-2020-15469-6.patch
 create mode 100644 meta/recipes-devtools/qemu/qemu/CVE-2020-15469-7.patch
 create mode 100644 meta/recipes-devtools/qemu/qemu/CVE-2020-15469-8.patch
 create mode 100644 meta/recipes-devtools/qemu/qemu/CVE-2020-15859.patch
 create mode 100644 meta/recipes-devtools/qemu/qemu/CVE-2020-35504.patch
 create mode 100644 meta/recipes-devtools/qemu/qemu/CVE-2020-35505.patch
 create mode 100644 meta/recipes-devtools/qemu/qemu/CVE-2021-3409-1.patch
 create mode 100644 meta/recipes-devtools/qemu/qemu/CVE-2021-3409-2.patch
 create mode 100644 meta/recipes-devtools/qemu/qemu/CVE-2021-3409-3.patch
 create mode 100644 meta/recipes-devtools/qemu/qemu/CVE-2021-3409-4.patch
 create mode 100644 meta/recipes-devtools/qemu/qemu/CVE-2021-3409-5.patch
 create mode 100644 meta/recipes-devtools/qemu/qemu/CVE-2022-26354.patch

-- 
2.34.1


