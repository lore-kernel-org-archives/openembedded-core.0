Return-Path: <steve@sakoman.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 4B362C4332F
	for <webhook@archiver.kernel.org>; Wed, 21 Dec 2022 02:32:30 +0000 (UTC)
Received: from mail-pg1-f177.google.com (mail-pg1-f177.google.com [209.85.215.177])
 by mx.groups.io with SMTP id smtpd.web11.9555.1671589945914454361
 for <openembedded-core@lists.openembedded.org>;
 Tue, 20 Dec 2022 18:32:26 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@sakoman-com.20210112.gappssmtp.com header.s=20210112 header.b=tnbNAcDe;
 spf=softfail (domain: sakoman.com, ip: 209.85.215.177, mailfrom: steve@sakoman.com)
Received: by mail-pg1-f177.google.com with SMTP id w37so9542629pga.5
        for <openembedded-core@lists.openembedded.org>; Tue, 20 Dec 2022 18:32:25 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=sakoman-com.20210112.gappssmtp.com; s=20210112;
        h=content-transfer-encoding:mime-version:message-id:date:subject:to
         :from:from:to:cc:subject:date:message-id:reply-to;
        bh=0lathfNIWAJfXEfhnoawPXxM1Xc4J5/xglZa0Tcf+LE=;
        b=tnbNAcDeywJXF5aWg9XKNPHL+r/48KDI2nw0vp/Bn9IEyM0ra0rySrCF8hI1ASTBxa
         r0NGItAFrYAj8mIK9BcsEMVqExQJX3/YLaScxONY/g7yB4Hhm3rV8KeMAg1qQWJJXDbT
         6Ufxq9eVvgLkEhHT38T2nNofML1WMXOdZkzzgzdnQLJVEG4ZTy+7l4eB9GcaqRvMCt4F
         SWa/9tzMyG6ofj72p7qerhCu8AW0+1ln8a8Q1UVAfwJx1jkzs9T6o8ntNWnYqrMmeZ1Y
         tSSeYmQe7oYpTybr1vgnt9aGNA7gDROKaRNbyJFXw8ze2iu8lpoPGwXXV3vNLsm3Mris
         FI1g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=content-transfer-encoding:mime-version:message-id:date:subject:to
         :from:x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=0lathfNIWAJfXEfhnoawPXxM1Xc4J5/xglZa0Tcf+LE=;
        b=pgXR+Ul4jXtgNplLDwXZYAjdqjenv/CMjkbWDRCVxRvIYs/IB75Z6gJwJvBCyqn/0/
         bP9sv1qN4g4OToK10v+FCcHDhJXy7huOrSUC/HphlgGS3MRcVlKSKRnH49NSofByizOO
         wBUn2tdCsDbMK2gGx//iujFL86PQwEL16kLnvYQ21eFBkXbXvgvev328RNG/ZhFgxJyp
         eYewjaR/TWO1uTbCQpgYv4n1XoJ04K3EbIHkehmzxVF1GpBoM4gC3GAVqUaWwxTGjnm3
         GlZXJ2RrTz2OQPO2hFqqsED+lbrir63tLf2k2p4/UbJJH+3/YDFDZ9ZmaCT+PUF4H0k5
         nNYQ==
X-Gm-Message-State: AFqh2kpjN5UlTrDWhXa4YWppnmOpU8njF0cNXLImh3VjGlXIU1miLPM6
	nk3FDJprATeHHVi2wiZ0nBL9WzvkYAiMyz4RY7M=
X-Google-Smtp-Source: AMrXdXvPd35nhjFez77CG3WbLbojhsVfXIjcFQ5ekO+Y8sbzw05Fi0jqidbETpSttYKUUpVxkYggyw==
X-Received: by 2002:a62:36c4:0:b0:578:7e9d:97b2 with SMTP id d187-20020a6236c4000000b005787e9d97b2mr769889pfa.3.1671589944730;
        Tue, 20 Dec 2022 18:32:24 -0800 (PST)
Received: from hexa.router0800d9.com (dhcp-72-253-5-74.hawaiiantel.net. [72.253.5.74])
        by smtp.gmail.com with ESMTPSA id n2-20020aa79842000000b0056bb36c047asm9374458pfq.105.2022.12.20.18.32.23
        for <openembedded-core@lists.openembedded.org>
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 20 Dec 2022 18:32:24 -0800 (PST)
From: Steve Sakoman <steve@sakoman.com>
To: openembedded-core@lists.openembedded.org
Subject: [OE-core][dunfell 00/13] Pull request (cover letter only)
Date: Tue, 20 Dec 2022 16:32:19 -1000
Message-Id: <cover.1671589894.git.steve@sakoman.com>
X-Mailer: git-send-email 2.25.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Wed, 21 Dec 2022 02:32:30 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/174887

The following changes since commit e44f0cda8176186d42a752631810c1cb5f1971eb:

  kernel.bbclass: make KERNEL_DEBUG_TIMESTAMPS work at rebuild (2022-12-06 07:52:17 -1000)

are available in the Git repository at:

  https://git.openembedded.org/openembedded-core-contrib stable/dunfell-next
  http://cgit.openembedded.org/openembedded-core-contrib/log/?h=stable/dunfell-next

Alexey Smirnov (1):
  classes: make TOOLCHAIN more permissive for kernel

Chen Qi (1):
  psplash: consider the situation of psplash not exist for systemd

Harald Seiler (1):
  opkg: Set correct info_dir and status_file in opkg.conf

Hitendra Prajapati (3):
  libarchive: CVE-2022-36227 NULL pointer dereference in archive_write.c
  sysstat: fix CVE-2022-39377
  golang: CVE-2022-41715 regexp/syntax: limit memory used by parsing
    regexps

Lee Chee Yang (1):
  dropbear: fix CVE-2021-36369

Mathieu Dubois-Briand (1):
  curl: Fix CVE CVE-2022-35260

Minjae Kim (1):
  xserver-xorg: backport fixes for CVE-2022-3550, CVE-2022-3551 and
    CVE-2022-3553

Pawan Badganchi (1):
  python3: Fix CVE-2022-37454

Qiu, Zheng (1):
  vim: upgrade 9.0.0820 -> 9.0.0947

Richard Purdie (1):
  oeqa/selftest/tinfoil: Add test for separate config_data with
    recipe_parse_file()

Riyaz Khan (1):
  rpm: Fix rpm CVE CVE-2021-3521

 meta/classes/kernel-arch.bbclass              |   2 +-
 meta/lib/oeqa/selftest/cases/tinfoil.py       |  14 +
 meta/recipes-core/dropbear/dropbear.inc       |   1 +
 .../dropbear/dropbear/CVE-2021-36369.patch    | 145 ++++++++
 .../psplash/files/psplash-start.service       |   1 +
 .../psplash/files/psplash-systemd.service     |   1 +
 meta/recipes-devtools/go/go-1.14.inc          |   1 +
 .../go/go-1.14/CVE-2022-41715.patch           | 271 ++++++++++++++
 meta/recipes-devtools/opkg/opkg_0.4.2.bb      |   4 +-
 .../python/python3/CVE-2022-37454.patch       | 105 ++++++
 .../recipes-devtools/python/python3_3.8.14.bb |   1 +
 .../rpm/files/CVE-2021-3521-01.patch          |  60 ++++
 .../rpm/files/CVE-2021-3521-02.patch          |  55 +++
 .../rpm/files/CVE-2021-3521-03.patch          |  34 ++
 .../rpm/files/CVE-2021-3521.patch             | 330 ++++++++++++++++++
 meta/recipes-devtools/rpm/rpm_4.14.2.1.bb     |   4 +
 .../libarchive/CVE-2022-36227.patch           |  43 +++
 .../libarchive/libarchive_3.4.2.bb            |   1 +
 .../sysstat/sysstat/CVE-2022-39377.patch      |  92 +++++
 .../sysstat/sysstat_12.2.1.bb                 |   4 +-
 .../xserver-xorg/CVE-2022-3550.patch          |  40 +++
 .../xserver-xorg/CVE-2022-3551.patch          |  64 ++++
 .../xserver-xorg/CVE-2022-3553.patch          |  49 +++
 .../xorg-xserver/xserver-xorg_1.20.14.bb      |   3 +
 .../curl/curl/CVE-2022-35260.patch            |  68 ++++
 meta/recipes-support/curl/curl_7.69.1.bb      |   1 +
 meta/recipes-support/vim/vim.inc              |   4 +-
 27 files changed, 1393 insertions(+), 5 deletions(-)
 create mode 100644 meta/recipes-core/dropbear/dropbear/CVE-2021-36369.patch
 create mode 100644 meta/recipes-devtools/go/go-1.14/CVE-2022-41715.patch
 create mode 100644 meta/recipes-devtools/python/python3/CVE-2022-37454.patch
 create mode 100644 meta/recipes-devtools/rpm/files/CVE-2021-3521-01.patch
 create mode 100644 meta/recipes-devtools/rpm/files/CVE-2021-3521-02.patch
 create mode 100644 meta/recipes-devtools/rpm/files/CVE-2021-3521-03.patch
 create mode 100644 meta/recipes-devtools/rpm/files/CVE-2021-3521.patch
 create mode 100644 meta/recipes-extended/libarchive/libarchive/CVE-2022-36227.patch
 create mode 100644 meta/recipes-extended/sysstat/sysstat/CVE-2022-39377.patch
 create mode 100644 meta/recipes-graphics/xorg-xserver/xserver-xorg/CVE-2022-3550.patch
 create mode 100644 meta/recipes-graphics/xorg-xserver/xserver-xorg/CVE-2022-3551.patch
 create mode 100644 meta/recipes-graphics/xorg-xserver/xserver-xorg/CVE-2022-3553.patch
 create mode 100644 meta/recipes-support/curl/curl/CVE-2022-35260.patch

-- 
2.25.1


