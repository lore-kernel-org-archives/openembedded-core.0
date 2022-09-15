Return-Path: <steve@sakoman.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id C73FEC32771
	for <webhook@archiver.kernel.org>; Thu, 15 Sep 2022 23:26:35 +0000 (UTC)
Received: from mail-pl1-f174.google.com (mail-pl1-f174.google.com
 [209.85.214.174])
 by mx.groups.io with SMTP id smtpd.web09.138.1663284386597850442
 for <openembedded-core@lists.openembedded.org>;
 Thu, 15 Sep 2022 16:26:27 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@sakoman-com.20210112.gappssmtp.com header.s=20210112
 header.b=1UnPnllR;
 spf=softfail (domain: sakoman.com, ip: 209.85.214.174,
 mailfrom: steve@sakoman.com)
Received: by mail-pl1-f174.google.com with SMTP id w20so7745041ply.12
        for <openembedded-core@lists.openembedded.org>;
 Thu, 15 Sep 2022 16:26:26 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=sakoman-com.20210112.gappssmtp.com; s=20210112;
        h=content-transfer-encoding:mime-version:message-id:date:subject:to
         :from:from:to:cc:subject:date;
        bh=t3cCR+bi1Cndob0AnLqhAqSFp/OvhVyqqjBO8Y/tZOo=;
        b=1UnPnllRa7yg+QYWaZPk7NjL9oyx4Yi/QGzLTQjE3NTBGHEfQMkV/b6wk9kd8IYFtx
         +AsdcdSmJgXt2t1I8Tk+sjMR1yKEkIUoHHpeuGTDB+d6MEwga6mtX83S2Eiti8fIhXNo
         0KkRqCO8346c6epqLH1DmEt645vu+9eJsYUA1/L0XCZzet1Su+pnKx5yoFCdRTP53aTG
         5kjshqV30ONVEdHCkGxrDO7rreR5VMrA8hq+J6Gl0qRQK0qxjKqnU4nGbB4LUp9Erzt4
         y5nwwPbvl7OXR66qtWc9vjqJ0QmCSVYCpa4VvmRlFsgjZ6vrSlwLRaKKX0CbAWsrWJU3
         NO8w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=content-transfer-encoding:mime-version:message-id:date:subject:to
         :from:x-gm-message-state:from:to:cc:subject:date;
        bh=t3cCR+bi1Cndob0AnLqhAqSFp/OvhVyqqjBO8Y/tZOo=;
        b=VN436nuB0SvA2uih2nivhav+lmQVc9wjXWWECS97PVHjEpDhmIZ83OSriSHud2Ec9F
         +cEoCWoaElKj4Sun2bQHihDCnfBpgM4OmsnV6ny/GHrZ5uztzEG9qPGofOkXH0+a+1Gg
         7V4evx0TDSMk3edOkZRzUUrJ5SfVuo8qUFGuItgxmA8yx2MsaVVaIFMfjcGM5Jq2byc9
         g0Zrfbt4Od2e45exMIuB8+7Q6ooomDjdMEskO+2OxQMbNQSmXgke0rdi2d8eLVDOUP1C
         iyhJX+mCtZXyFdpPMnrHrmxBRSyG84o+Gh0w1mTa2okRMFhFQez1BS8KPkwdjLVyMPF1
         0lQw==
X-Gm-Message-State: ACrzQf1XVzwbbi+re4k31WZ8TmX1YPxqeJNZ0tqQndvKA2LlX6IjLXrA
	Gl4B5+5IMF+yjCGBzs7Eg9nRJqACpSilmqsR
X-Google-Smtp-Source: 
 AMsMyM6IP72rw8hp32jlju4YM5TxNlwP54LYkFB9pVyQIRp+r1/I+jO1E1BFpk7+CWMIXY1TQEpusg==
X-Received: by 2002:a17:902:da8b:b0:178:391d:d0b1 with SMTP id
 j11-20020a170902da8b00b00178391dd0b1mr1919991plx.32.1663284385325;
        Thu, 15 Sep 2022 16:26:25 -0700 (PDT)
Received: from hexa.router0800d9.com (dhcp-72-253-6-214.hawaiiantel.net.
 [72.253.6.214])
        by smtp.gmail.com with ESMTPSA id
 fs4-20020a17090af28400b00203059fc75bsm184450pjb.5.2022.09.15.16.26.24
        for <openembedded-core@lists.openembedded.org>
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 15 Sep 2022 16:26:24 -0700 (PDT)
From: Steve Sakoman <steve@sakoman.com>
To: openembedded-core@lists.openembedded.org
Subject: [OE-core][dunfell 0/9] Pull request (cover letter only)
Date: Thu, 15 Sep 2022 13:26:15 -1000
Message-Id: <cover.1663284294.git.steve@sakoman.com>
X-Mailer: git-send-email 2.25.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Thu, 15 Sep 2022 23:26:35 -0000
X-Groupsio-URL: 
 https://lists.openembedded.org/g/openembedded-core/message/170777

The following changes since commit c9a9d5a1f7fbe88422ccee542a89afbc4c5336e4:

  vim: Upgrade 9.0.0242 -> 9.0.0341 (2022-09-07 04:40:43 -1000)

are available in the Git repository at:

  git://git.openembedded.org/openembedded-core-contrib stable/dunfell-next
  http://cgit.openembedded.org/openembedded-core-contrib/log/?h=stable/dunfell-next

Chee Yang Lee (3):
  connman: fix CVE-2022-32292
  gnutls: fix CVE-2021-4209
  virglrenderer: fix CVE-2022-0135

Florin Diaconescu (1):
  binutils : CVE-2022-38533

Khan@kpit.com (1):
  python3: Fix CVE-2021-28861 for python3

Virendra Thakur (1):
  tiff: Fix for CVE-2022-2867/8/9

Yi Zhao (1):
  tiff: Security fixes CVE-2022-1354 and CVE-2022-1355

niko.mauno@vaisala.com (2):
  systemd: Fix unwritable /var/lock when no sysvinit handling
  systemd: Add 'no-dns-fallback' PACKAGECONFIG option

 .../connman/connman/CVE-2022-32292.patch      |  37 +++
 .../connman/connman_1.37.bb                   |   1 +
 .../systemd/systemd/00-create-volatile.conf   |   1 +
 meta/recipes-core/systemd/systemd_244.5.bb    |   1 +
 .../binutils/binutils-2.34.inc                |   1 +
 .../binutils/binutils/CVE-2022-38533.patch    |  37 +++
 .../python/python3/CVE-2021-28861.patch       | 135 +++++++++++
 .../recipes-devtools/python/python3_3.8.13.bb |   1 +
 .../virglrenderer/CVE-2022-0135.patch         | 100 +++++++++
 .../virglrenderer/virglrenderer_0.8.2.bb      |   1 +
 ...022-2867-CVE-2022-2868-CVE-2022-2869.patch | 159 +++++++++++++
 .../libtiff/tiff/CVE-2022-1354.patch          | 212 ++++++++++++++++++
 .../libtiff/tiff/CVE-2022-1355.patch          |  62 +++++
 meta/recipes-multimedia/libtiff/tiff_4.1.0.bb |   3 +
 .../gnutls/gnutls/CVE-2021-4209.patch         |  37 +++
 meta/recipes-support/gnutls/gnutls_3.6.14.bb  |   1 +
 16 files changed, 789 insertions(+)
 create mode 100644 meta/recipes-connectivity/connman/connman/CVE-2022-32292.patch
 create mode 100644 meta/recipes-devtools/binutils/binutils/CVE-2022-38533.patch
 create mode 100644 meta/recipes-devtools/python/python3/CVE-2021-28861.patch
 create mode 100644 meta/recipes-graphics/virglrenderer/virglrenderer/CVE-2022-0135.patch
 create mode 100644 meta/recipes-multimedia/libtiff/files/CVE-2022-2867-CVE-2022-2868-CVE-2022-2869.patch
 create mode 100644 meta/recipes-multimedia/libtiff/tiff/CVE-2022-1354.patch
 create mode 100644 meta/recipes-multimedia/libtiff/tiff/CVE-2022-1355.patch
 create mode 100644 meta/recipes-support/gnutls/gnutls/CVE-2021-4209.patch

-- 
2.25.1


