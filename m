Return-Path: <steve@sakoman.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 00EEFC433FE
	for <webhook@archiver.kernel.org>; Fri, 30 Sep 2022 02:38:56 +0000 (UTC)
Received: from mail-pg1-f178.google.com (mail-pg1-f178.google.com
 [209.85.215.178])
 by mx.groups.io with SMTP id smtpd.web10.1456.1664505530624135308
 for <openembedded-core@lists.openembedded.org>;
 Thu, 29 Sep 2022 19:38:51 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@sakoman-com.20210112.gappssmtp.com header.s=20210112
 header.b=iMJ1An0Z;
 spf=softfail (domain: sakoman.com, ip: 209.85.215.178,
 mailfrom: steve@sakoman.com)
Received: by mail-pg1-f178.google.com with SMTP id 3so3041581pga.1
        for <openembedded-core@lists.openembedded.org>;
 Thu, 29 Sep 2022 19:38:50 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=sakoman-com.20210112.gappssmtp.com; s=20210112;
        h=content-transfer-encoding:mime-version:message-id:date:subject:to
         :from:from:to:cc:subject:date;
        bh=I6o77gfutD4SfevRQzUOHI/AaAK8nuwsvDTN71VfBv0=;
        b=iMJ1An0Z/2JnERvNBU2jGAIg9L4ks0EYcBzdBjFbwodeM4/mdp05gRh0GAHVYWB3V6
         BzKMaJjpzp3PurGMzsrX79i8j0qRNOhW1dhlI6X62toAr6UGoE+F/CaMQ3mGIKQ6ltTM
         VeY9cXJcXiOR0HVUWd1agY35Tg8yVZAIFlI6UxzdzniRuW7SqtVmAveP8cGEOXs3Sb8F
         n5yXVdf692MK96zgn/SKK/h5xj1w4dccev5Hx/zlAiI8sVG169bAwSC1NTPhi9WsEuCo
         H0mVaRAGrohWaC9HI3nzEtoOFbKFQXAaVXc5dvPiVUdTkfBr0xB9Ybsp+PNSvpwl/hJa
         4JKA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=content-transfer-encoding:mime-version:message-id:date:subject:to
         :from:x-gm-message-state:from:to:cc:subject:date;
        bh=I6o77gfutD4SfevRQzUOHI/AaAK8nuwsvDTN71VfBv0=;
        b=qSRcxWX5GUqzgjvnoNezSsQMEbvjkm7KZPQ7aZusUis9pUon2pjEQO/EIPWzyL3duq
         04m2c5xyABKqlJDbMsac0HNNy0kEG8GgMIoAp3efeawTGHVfLVgNuM7TlYGV/kDMgqrs
         teNsqLufnJj3qMuD1otefiN2kpetSfTx2QiP3EunmpT6sBTK4GTRcZcEOCZ6mceoeJeN
         kDqH2+AHbSUUNeZkx7YqP6zO5d6cQp/wcvVk+oSXtCLh1oYac7WjUBEvsdDfAIVLxzgW
         Eu8BsH6+1wdKuXE+CZ8uRimoEn9oZwlFGNRiIKnv7MSF5xHH14TxKg5k8eXa30fHEnew
         l4wg==
X-Gm-Message-State: ACrzQf2AR8jMpEXXYbitpSbt4BTQ/vzHzVptAl/sYTuMql+HqYEosFwy
	NzIXp0cinp4SGjUVcguGWJQDhc0sXgCYIin5
X-Google-Smtp-Source: 
 AMsMyM6Aavz0r5JHPBGBjsRsVCh7VHp+VzMOwKmDuxs7I6lgM0XIRhncH0cN4u3aJc375YJVzscQlQ==
X-Received: by 2002:a63:451a:0:b0:439:246e:807e with SMTP id
 s26-20020a63451a000000b00439246e807emr5370630pga.347.1664505528737;
        Thu, 29 Sep 2022 19:38:48 -0700 (PDT)
Received: from hexa.router0800d9.com (dhcp-72-253-6-214.hawaiiantel.net.
 [72.253.6.214])
        by smtp.gmail.com with ESMTPSA id
 n10-20020a170903404a00b00172a670607asm569920pla.300.2022.09.29.19.38.47
        for <openembedded-core@lists.openembedded.org>
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 29 Sep 2022 19:38:48 -0700 (PDT)
From: Steve Sakoman <steve@sakoman.com>
To: openembedded-core@lists.openembedded.org
Subject: [OE-core][dunfell 00/11] Pull request (cover letter only)
Date: Thu, 29 Sep 2022 16:38:37 -1000
Message-Id: <cover.1664505370.git.steve@sakoman.com>
X-Mailer: git-send-email 2.25.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Fri, 30 Sep 2022 02:38:55 -0000
X-Groupsio-URL: 
 https://lists.openembedded.org/g/openembedded-core/message/171201

The following changes since commit ef38f7acee3f0ae400138fa60f4695a86dffc16e:

  linux-yocto/5.4: update to v5.4.213 (2022-09-22 04:40:18 -1000)

are available in the Git repository at:

  https://git.openembedded.org/openembedded-core-contrib stable/dunfell-next
  http://cgit.openembedded.org/openembedded-core-contrib/log/?h=stable/dunfell-next

Dmitry Baryshkov (3):
  linux-firmware: upgrade 20220708 -> 20220913
  linux-firmware: package new Qualcomm firmware
  linux-firmware: package new Qualcomm firmware

Hitendra Prajapati (2):
  bluez: CVE-2022-39176 BlueZ allows physically proximate attackers
  golang: CVE-2022-27664 net/http: handle server errors after sending
    GOAWAY

Martin Jansa (1):
  create-pull-request: don't switch the git remote protocol to git://

Minjae Kim (1):
  inetutils: CVE-2022-39028 - fix remote DoS vulnerability in
    inetutils-telnetd

Richard Purdie (2):
  vim: Upgrade 9.0.453 -> 9.0.541
  vim: Upgrade 9.0.0541 -> 9.0.0598

Robert Joslyn (1):
  tzdata: Update from 2022b to 2022c

Shubham Kulkarni (1):
  go: Add fix for CVE-2022-32190

 meta/recipes-connectivity/bluez5/bluez5.inc   |   1 +
 .../bluez5/bluez5/CVE-2022-39176.patch        | 126 ++++++++++++++++++
 .../inetutils/inetutils/CVE-2022-39028.patch  |  54 ++++++++
 .../inetutils/inetutils_1.9.4.bb              |   1 +
 meta/recipes-devtools/go/go-1.14.inc          |   5 +
 .../go/go-1.14/0001-CVE-2022-32190.patch      |  74 ++++++++++
 .../go/go-1.14/0002-CVE-2022-32190.patch      |  48 +++++++
 .../go/go-1.14/0003-CVE-2022-32190.patch      |  36 +++++
 .../go/go-1.14/0004-CVE-2022-32190.patch      |  82 ++++++++++++
 .../go/go-1.14/CVE-2022-27664.patch           |  68 ++++++++++
 meta/recipes-extended/timezone/timezone.inc   |   6 +-
 ...20220708.bb => linux-firmware_20220913.bb} |  39 +++++-
 meta/recipes-support/vim/vim.inc              |   4 +-
 scripts/create-pull-request                   |   2 +-
 14 files changed, 536 insertions(+), 10 deletions(-)
 create mode 100644 meta/recipes-connectivity/bluez5/bluez5/CVE-2022-39176.patch
 create mode 100644 meta/recipes-connectivity/inetutils/inetutils/CVE-2022-39028.patch
 create mode 100644 meta/recipes-devtools/go/go-1.14/0001-CVE-2022-32190.patch
 create mode 100644 meta/recipes-devtools/go/go-1.14/0002-CVE-2022-32190.patch
 create mode 100644 meta/recipes-devtools/go/go-1.14/0003-CVE-2022-32190.patch
 create mode 100644 meta/recipes-devtools/go/go-1.14/0004-CVE-2022-32190.patch
 create mode 100644 meta/recipes-devtools/go/go-1.14/CVE-2022-27664.patch
 rename meta/recipes-kernel/linux-firmware/{linux-firmware_20220708.bb => linux-firmware_20220913.bb} (94%)

-- 
2.25.1


