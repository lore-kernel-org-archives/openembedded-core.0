Return-Path: <steve@sakoman.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 00345C433EF
	for <webhook@archiver.kernel.org>; Wed, 18 May 2022 02:30:52 +0000 (UTC)
Received: from mail-pl1-f169.google.com (mail-pl1-f169.google.com
 [209.85.214.169])
 by mx.groups.io with SMTP id smtpd.web11.301.1652841050267851960
 for <openembedded-core@lists.openembedded.org>;
 Tue, 17 May 2022 19:30:50 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@sakoman-com.20210112.gappssmtp.com header.s=20210112
 header.b=TDngCGiT;
 spf=softfail (domain: sakoman.com, ip: 209.85.214.169,
 mailfrom: steve@sakoman.com)
Received: by mail-pl1-f169.google.com with SMTP id q4so475477plr.11
        for <openembedded-core@lists.openembedded.org>;
 Tue, 17 May 2022 19:30:50 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=sakoman-com.20210112.gappssmtp.com; s=20210112;
        h=from:to:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=RQjrgU9GBTWuBs2Soz7704AniwHp+wFnHsU063pX7GY=;
        b=TDngCGiT+/3L2XkFQ1Li56vGDkOBQNgzyyiseKh8dBbz8rATP3ZSPWCpBhF0GOA8xp
         uavUF2yvtHCSMqeMjoM784X7Uqt2oim4NdM9HDmNv/y9DmJrok0pXtDNkhMEQ7LxXurz
         DmQEfkm5UlxJXEAUolyvAzgMRN5gIMlBZUIIkN7gzzKFIqZxaivEQQjRF4fRcPhy+CvU
         +XDA8OsMQx3CTkUn+t1JcoUs7oJBGPXKPy9gj1OGF+i8ZflP5m8BDsMFvNzGyHrJ+WGd
         +WjVlLSbqWhH/MVpXfAJcY2p89lEUcPM74cZ/sCJ1wIQCi9Tb+6clyArJRauj0j1AVcj
         LCPg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:from:to:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=RQjrgU9GBTWuBs2Soz7704AniwHp+wFnHsU063pX7GY=;
        b=I/vSjxHq3lDWUNum71qp11YhwYOSl4S8WPcQHfL8GToOS7xN4qNItiFQuDmeUqNfxj
         g8doKHe593jREG9ejmEMmt3aJ+3LW2lU+69Msz60XMAYO03L/pSDtQDZwjEZKxcGbyst
         wez5wxiqw/S99y/5OvFmdhzFEA2y3K1cOAB1q7e/paRopmsUKp4oXwRo6A9D63xci955
         aWnu93G3YBQv+tsRjp0Do0WA1ZNEsHVnOz+Ha9xA+lqY+ExFCAYPDbw1P0iMngGUrox8
         jImfyFDiFaQEQzuXhaJZYkdE0GgJOm2T0zbBPS+GfxUUpk8ZpQuwUl2KlKbBIZui6HzG
         X54w==
X-Gm-Message-State: AOAM532MRQkksD/Na67/miIYFZClQYSOLeiNHVlJbvM94+Af+6b8TbOV
	YNcxpy+LzeVoKgPQeV4luPMiFe4lckYPUA7b
X-Google-Smtp-Source: 
 ABdhPJys8ilX4Hi8UkyyYr8TkGHeEGMCGXT8qBPZYWwuNrGgVnYh/4p/fod+M/yfLU2LiaTK71Hlyg==
X-Received: by 2002:a17:903:1211:b0:15e:8208:8cc0 with SMTP id
 l17-20020a170903121100b0015e82088cc0mr25001497plh.52.1652841048839;
        Tue, 17 May 2022 19:30:48 -0700 (PDT)
Received: from hexa.router0800d9.com (dhcp-72-253-6-214.hawaiiantel.net.
 [72.253.6.214])
        by smtp.gmail.com with ESMTPSA id
 p25-20020a62b819000000b00512ead539casm438926pfe.113.2022.05.17.19.30.47
        for <openembedded-core@lists.openembedded.org>
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 17 May 2022 19:30:47 -0700 (PDT)
From: Steve Sakoman <steve@sakoman.com>
To: openembedded-core@lists.openembedded.org
Subject: [OE-core][dunfell 0/9] Patch review
Date: Tue, 17 May 2022 16:30:28 -1000
Message-Id: <cover.1652840866.git.steve@sakoman.com>
X-Mailer: git-send-email 2.25.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Wed, 18 May 2022 02:30:52 -0000
X-Groupsio-URL: 
 https://lists.openembedded.org/g/openembedded-core/message/165782

Please review this set of changes for dunfell and have comments back by end
of day Thursday.

Passed a-full on autobuilder:

https://autobuilder.yoctoproject.org/typhoon/#/builders/83/builds/3677

The following changes since commit 0f6ae13d76129d96f788b7ede312cfc361ee2bda:

  scripts/git: Ensure we don't have circular references (2022-05-10 08:23:12 -1000)

are available in the Git repository at:

  git://git.openembedded.org/openembedded-core-contrib stable/dunfell-nut
  http://cgit.openembedded.org/openembedded-core-contrib/log/?h=stable/dunfell-nut

Dmitry Baryshkov (1):
  linux-firmware: upgrade 20220411 -> 20220509

Konrad Weihmann (1):
  linux-firmware: replace mkdir by install

Ranjitsinh Rathod (4):
  tiff: Add patches to fix multiple CVEs
  freetype: Fix CVEs for freetype
  git: Use CVE_CHECK_WHITELIST instead of CVE_CHECK_IGNORE
  openssl: Minor security upgrade 1.1.1n to 1.1.1o

Richard Purdie (1):
  vim: Upgrade 8.2.4681 -> 8.2.4912

Sana Kazi (1):
  curl: Fix CVEs for curl

Steve Sakoman (1):
  selftest: skip virgl test on alma 8.6

 meta/lib/oeqa/selftest/cases/runtime_test.py  |   2 +
 .../{openssl_1.1.1n.bb => openssl_1.1.1o.bb}  |   2 +-
 meta/recipes-devtools/git/git.inc             |   2 +-
 .../freetype/freetype/CVE-2022-27404.patch    |  33 ++++
 .../freetype/freetype/CVE-2022-27405.patch    |  38 +++++
 .../freetype/freetype/CVE-2022-27406.patch    |  31 ++++
 .../freetype/freetype_2.10.1.bb               |   3 +
 ...01-Makefile-replace-mkdir-by-install.patch |  84 ++++++++++
 ...20220411.bb => linux-firmware_20220509.bb} |   9 +-
 .../libtiff/files/CVE-2022-0865.patch         |  39 +++++
 .../libtiff/files/CVE-2022-0907.patch         |  94 +++++++++++
 .../libtiff/files/CVE-2022-0908.patch         |  34 ++++
 .../libtiff/files/CVE-2022-0909.patch         |  37 +++++
 .../libtiff/files/CVE-2022-0924.patch         |  58 +++++++
 meta/recipes-multimedia/libtiff/tiff_4.1.0.bb |   5 +
 .../curl/curl/CVE-2022-22576.patch            | 148 ++++++++++++++++++
 .../curl/curl/CVE-2022-27775.patch            |  39 +++++
 .../curl/curl/CVE-2022-27776.patch            | 114 ++++++++++++++
 meta/recipes-support/curl/curl_7.69.1.bb      |   3 +
 meta/recipes-support/vim/vim.inc              |   4 +-
 20 files changed, 772 insertions(+), 7 deletions(-)
 rename meta/recipes-connectivity/openssl/{openssl_1.1.1n.bb => openssl_1.1.1o.bb} (98%)
 create mode 100644 meta/recipes-graphics/freetype/freetype/CVE-2022-27404.patch
 create mode 100644 meta/recipes-graphics/freetype/freetype/CVE-2022-27405.patch
 create mode 100644 meta/recipes-graphics/freetype/freetype/CVE-2022-27406.patch
 create mode 100644 meta/recipes-kernel/linux-firmware/files/0001-Makefile-replace-mkdir-by-install.patch
 rename meta/recipes-kernel/linux-firmware/{linux-firmware_20220411.bb => linux-firmware_20220509.bb} (99%)
 create mode 100644 meta/recipes-multimedia/libtiff/files/CVE-2022-0865.patch
 create mode 100644 meta/recipes-multimedia/libtiff/files/CVE-2022-0907.patch
 create mode 100644 meta/recipes-multimedia/libtiff/files/CVE-2022-0908.patch
 create mode 100644 meta/recipes-multimedia/libtiff/files/CVE-2022-0909.patch
 create mode 100644 meta/recipes-multimedia/libtiff/files/CVE-2022-0924.patch
 create mode 100644 meta/recipes-support/curl/curl/CVE-2022-22576.patch
 create mode 100644 meta/recipes-support/curl/curl/CVE-2022-27775.patch
 create mode 100644 meta/recipes-support/curl/curl/CVE-2022-27776.patch

-- 
2.25.1


