Return-Path: <steve@sakoman.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 91CD7C76196
	for <webhook@archiver.kernel.org>; Tue, 28 Mar 2023 14:23:26 +0000 (UTC)
Received: from mail-pl1-f173.google.com (mail-pl1-f173.google.com [209.85.214.173])
 by mx.groups.io with SMTP id smtpd.web11.67911.1680013396253582449
 for <openembedded-core@lists.openembedded.org>;
 Tue, 28 Mar 2023 07:23:16 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@sakoman-com.20210112.gappssmtp.com header.s=20210112 header.b=KF+pSGie;
 spf=softfail (domain: sakoman.com, ip: 209.85.214.173, mailfrom: steve@sakoman.com)
Received: by mail-pl1-f173.google.com with SMTP id o11so11840610ple.1
        for <openembedded-core@lists.openembedded.org>; Tue, 28 Mar 2023 07:23:16 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=sakoman-com.20210112.gappssmtp.com; s=20210112; t=1680013395;
        h=content-transfer-encoding:mime-version:message-id:date:subject:to
         :from:from:to:cc:subject:date:message-id:reply-to;
        bh=tHI1zRMq+EfgYtV33jgiNtafQHYPD5SK2nYJsyiRO4Y=;
        b=KF+pSGieLVi0Aw3nljloSeTwJ6jmvyMpcTzfzFmn41UXD5FNLEU0O/69YfAX39H25R
         vELxWoQXic2yyzOGiFKANCNYxsvsZ9zVjf9rMWQYJdjCvpG7msUf3o/LIKq/snh+cEPh
         F9RJp3sTjGkeZAmkKvR0ju/4qgeumavycKigc82zknCx2FnPRXTD3sQMDBoTtRfA7BW8
         a2YXatnF/CbAycSzeY0JHynyti4xLPowxuGyeblpKjxE1iZThsTFeBste1qMBh18NYQO
         S3Yak2eU1cf9LEzhbO1BzXsHKjut6Sdf5NcfQh9fQMJzl4OmQXF5sMWKBt2+UvnWNOBX
         guoA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112; t=1680013395;
        h=content-transfer-encoding:mime-version:message-id:date:subject:to
         :from:x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=tHI1zRMq+EfgYtV33jgiNtafQHYPD5SK2nYJsyiRO4Y=;
        b=Rskfxh3SpXlM+PkEXIdf9gCsEmoZNchhd7q/jbz5IVHj00HwvgEntma3kYeVpUEhw3
         9L/hgEvqkYLmfmmwTKFcOs4iaZGu3VJ0q5aQN4Ioi9t9mf0xJwCmSGdKiz0OVBM+sMmX
         gM5jILb+72fFtER6dVGpnb/u6N8q7j8M12OTUaU5YUPTqaGn6ps+5ahDxT0ItAYHECui
         /kkUhXV5lEx21QwahUiXAhRMuWq1FPRmIPPfEluYBf8OGjEz0YW2+r2Q01wW7/4LZYdl
         dewh2SDQxOBfpiXccIao8v2/DhGuiBo2Wv3Bz2tHLfjlfxaty1xsDWbNfJU/4kDDggps
         2VYQ==
X-Gm-Message-State: AO0yUKVFI6r8s6H2PSA0RKFrif9U28WRiP87lDghTTr8JFQd1sXfzboD
	SPVfNkjPNWkYR+KBQk0HBfdEnBphagpSzW2h/wM=
X-Google-Smtp-Source: AK7set95dYEgAZJUTYUPsM5XNU01/j7TY5PVhMWUWHnCwvp3Oa9s0T2nDAgFzQ2oVSLWSt0v/s9jPQ==
X-Received: by 2002:a05:6a20:78a2:b0:d9:2cef:949a with SMTP id d34-20020a056a2078a200b000d92cef949amr11492380pzg.28.1680013395002;
        Tue, 28 Mar 2023 07:23:15 -0700 (PDT)
Received: from hexa.router0800d9.com (dhcp-72-253-4-112.hawaiiantel.net. [72.253.4.112])
        by smtp.gmail.com with ESMTPSA id a25-20020a62e219000000b00590ede84b1csm21835688pfi.147.2023.03.28.07.23.13
        for <openembedded-core@lists.openembedded.org>
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 28 Mar 2023 07:23:14 -0700 (PDT)
From: Steve Sakoman <steve@sakoman.com>
To: openembedded-core@lists.openembedded.org
Subject: [OE-core][kirkstone 00/14] Pull request (cover letter only)
Date: Tue, 28 Mar 2023 04:23:06 -1000
Message-Id: <cover.1680013231.git.steve@sakoman.com>
X-Mailer: git-send-email 2.34.1
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Tue, 28 Mar 2023 14:23:26 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/179237

The following changes since commit 7df46e003ea76cf7d5b7263f23bd6e6a781bd22c:

  base-files: Drop localhost.localdomain from hosts file (2023-03-17 04:52:21 -1000)

are available in the Git repository at:

  https://git.openembedded.org/openembedded-core-contrib stable/kirkstone-next
  http://cgit.openembedded.org/openembedded-core-contrib/log/?h=stable/kirkstone-next

Alexander Kanavin (1):
  devtool/upgrade: do not delete the workspace/recipes directory

Chee Yang Lee (1):
  git: ignore CVE-2023-22743

Khem Raj (1):
  systemd.bbclass: Add /usr/lib/systemd to searchpaths as well

Martin Jansa (3):
  timezone: use 'tz' subdir instead of ${WORKDIR} directly
  tzdata: use separate B instead of WORKDIR for zic output
  tzcode-native: fix build with gcc-13 on host

Mikko Rapeli (1):
  oeqa rtc.py: skip if read-only-rootfs

Pawan Badganchi (1):
  curl: Add fix for CVE-2023-23914, CVE-2023-23915

Peter Marko (1):
  systemd: fix CVE-2022-4415

Piotr Łobacz (1):
  systemd: fix wrong nobody-group assignment

Richard Purdie (1):
  pybootchartui: Fix python syntax issue

Romuald Jeanne (1):
  image_types: fix multiubi var init

Ross Burton (1):
  lib/resulttool: fix typo breaking resulttool log --ptest

Tim Orling (1):
  cracklib: update github branch to 'main'

 meta/classes/image_types.bbclass              |   3 +
 meta/classes/systemd.bbclass                  |   1 +
 meta/lib/oeqa/runtime/cases/rtc.py            |   8 +-
 .../systemd/systemd/CVE-2022-4415-1.patch     | 109 +++++
 .../systemd/systemd/CVE-2022-4415-2.patch     | 391 ++++++++++++++++++
 meta/recipes-core/systemd/systemd_250.5.bb    |   4 +-
 meta/recipes-devtools/git/git_2.35.7.bb       |   2 +
 .../cracklib/cracklib_2.9.8.bb                |   2 +-
 meta/recipes-extended/timezone/timezone.inc   |   6 +-
 .../timezone/tzcode-native.bb                 |   3 +-
 ...0001-Fix-C23-related-conformance-bug.patch | 301 ++++++++++++++
 meta/recipes-extended/timezone/tzdata.bb      |  16 +-
 .../curl/curl/CVE-2023-23914_5-1.patch        | 280 +++++++++++++
 .../curl/curl/CVE-2023-23914_5-2.patch        |  23 ++
 .../curl/curl/CVE-2023-23914_5-3.patch        |  45 ++
 .../curl/curl/CVE-2023-23914_5-4.patch        |  48 +++
 .../curl/curl/CVE-2023-23914_5-5.patch        | 118 ++++++
 meta/recipes-support/curl/curl_7.82.0.bb      |   5 +
 scripts/lib/devtool/upgrade.py                |   3 -
 scripts/lib/resulttool/resultutils.py         |   2 +-
 .../pybootchartgui/pybootchartgui/parsing.py  |   2 +-
 21 files changed, 1351 insertions(+), 21 deletions(-)
 create mode 100644 meta/recipes-core/systemd/systemd/CVE-2022-4415-1.patch
 create mode 100644 meta/recipes-core/systemd/systemd/CVE-2022-4415-2.patch
 create mode 100644 meta/recipes-extended/timezone/tzcode/0001-Fix-C23-related-conformance-bug.patch
 create mode 100644 meta/recipes-support/curl/curl/CVE-2023-23914_5-1.patch
 create mode 100644 meta/recipes-support/curl/curl/CVE-2023-23914_5-2.patch
 create mode 100644 meta/recipes-support/curl/curl/CVE-2023-23914_5-3.patch
 create mode 100644 meta/recipes-support/curl/curl/CVE-2023-23914_5-4.patch
 create mode 100644 meta/recipes-support/curl/curl/CVE-2023-23914_5-5.patch

-- 
2.34.1


