Return-Path: <steve@sakoman.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 48C68C6FD20
	for <webhook@archiver.kernel.org>; Fri, 24 Mar 2023 14:30:17 +0000 (UTC)
Received: from mail-pj1-f44.google.com (mail-pj1-f44.google.com [209.85.216.44])
 by mx.groups.io with SMTP id smtpd.web10.103133.1679668210294202599
 for <openembedded-core@lists.openembedded.org>;
 Fri, 24 Mar 2023 07:30:10 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@sakoman-com.20210112.gappssmtp.com header.s=20210112 header.b=JOJICSjN;
 spf=softfail (domain: sakoman.com, ip: 209.85.216.44, mailfrom: steve@sakoman.com)
Received: by mail-pj1-f44.google.com with SMTP id lr16-20020a17090b4b9000b0023f187954acso1762821pjb.2
        for <openembedded-core@lists.openembedded.org>; Fri, 24 Mar 2023 07:30:10 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=sakoman-com.20210112.gappssmtp.com; s=20210112; t=1679668209;
        h=content-transfer-encoding:mime-version:message-id:date:subject:to
         :from:from:to:cc:subject:date:message-id:reply-to;
        bh=NjVq4Lm/GqxBPVb3fsY2zm7htU1awOZdEDu4ZrlMZqE=;
        b=JOJICSjNmNrSU/OrB66GyyBN/R0w0FfPG86uGTbMaglUULXnanP19RTlEFNw9LvK5I
         Ap0K3UxSGKCIbiUOR3ol8coUKNpHjjhgsVIACE3/MdqUalZY78Abm698J75MWyLMQeHp
         M/qiWRQfYpqdTUhkhMA6ATeOM6yfKy7z30sbFabWMloKGhVY42Ztj1yKrnnUlIR3/6/k
         4wu0to7KzJNl0xOu8+VK72FIEsVM0VKmgXETfHS6qRmoYWbI9i3YDCZCAjXEGPsDYo1H
         PMQe13/8PksSkJNNI3FcoamsvzQwgSbdRvAVoJi1piL3OdUbbm6ZSNSmBRZdiAJ0zOtu
         6TSg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112; t=1679668209;
        h=content-transfer-encoding:mime-version:message-id:date:subject:to
         :from:x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=NjVq4Lm/GqxBPVb3fsY2zm7htU1awOZdEDu4ZrlMZqE=;
        b=hxPHPMjJq1YToI8gg8QLOO/TEMcNC6KAwDvN01TqkvjUnia8kan20yAtuYlATh1bCB
         joQiMkBhpnWl0jVYSOhjT7IsZbhAryPAGRQIZZTSTyZCzI/0zAnKIsdG3hU6nN20NkEz
         VKknKygFxOTxDbEcK7HSTvWo0kmWsO9wArCt4URkd7qNrjykBYo242q73ZXqfY8zo+sD
         whYF+4Grt48kuoGpmkEatIruNE4kgiltAjokjadRqWbl+eUq6scR4aqQb2NJHvVJ1ETX
         IsxQEgctbzQzyRx5pUAPDp7qq+T8cUeyU3p4xvzfKqsbK5baOuF1IBlGKTH5ydnURo6W
         xrAA==
X-Gm-Message-State: AAQBX9cAhpsNIJU/ngiWhzS+vllLEb9WzLsu/hTPapqQgd2Lj9539izx
	QAVXDgWFyw11fi8kdQTNZyiLy2hh28DeDtFj/1M=
X-Google-Smtp-Source: AK7set+WwhguZ1qH/+fSQ1aXZxVlJKxiKracCCS74y3qkzyYko0flcOnc1Ma3AP1cQP4D7yNM2lExw==
X-Received: by 2002:a17:90b:4f8c:b0:23f:ef7:7897 with SMTP id qe12-20020a17090b4f8c00b0023f0ef77897mr2991196pjb.49.1679668209174;
        Fri, 24 Mar 2023 07:30:09 -0700 (PDT)
Received: from hexa.router0800d9.com (dhcp-72-253-4-112.hawaiiantel.net. [72.253.4.112])
        by smtp.gmail.com with ESMTPSA id u10-20020a17090a890a00b002339195a47bsm3045511pjn.53.2023.03.24.07.30.08
        for <openembedded-core@lists.openembedded.org>
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 24 Mar 2023 07:30:08 -0700 (PDT)
From: Steve Sakoman <steve@sakoman.com>
To: openembedded-core@lists.openembedded.org
Subject: [OE-core][dunfell 00/14] Pull request (cover letter only)
Date: Fri, 24 Mar 2023 04:30:02 -1000
Message-Id: <cover.1679668158.git.steve@sakoman.com>
X-Mailer: git-send-email 2.34.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Fri, 24 Mar 2023 14:30:17 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/179037

The following changes since commit efb1a73a13907bed3acac8e06053aef3e2ef57f5:

  build-appliance-image: Update to dunfell head revision (2023-03-15 23:09:39 +0000)

are available in the Git repository at:

  https://git.openembedded.org/openembedded-core-contrib stable/dunfell-next
  http://cgit.openembedded.org/openembedded-core-contrib/log/?h=stable/dunfell-next

Alban Bedel (1):
  systemd: Fix systemd when used with busybox less

Andrej Valek (1):
  libarchive: fix CVE-2022-26280

Chee Yang Lee (2):
  ghostscript: add CVE tag for
    check-stack-limits-after-function-evalution.patch
  libksba: fix CVE-2022-3515

Hitendra Prajapati (1):
  QEMU: CVE-2022-4144 QXL: qxl_phys2virt unsafe address translation can
    lead to out-of-bounds read

Kenfe-Mickael Laventure (3):
  buildtools-tarball: Handle spaces within user $PATH
  toolchain-scripts: Handle spaces within user $PATH
  populate_sdk_ext: Handle spaces within user $PATH

Richard Purdie (4):
  staging: Separate out different multiconfig manifests
  staging/multilib: Fix manifest corruption
  glibc: Add missing binutils dependency
  base-files: Drop localhost.localdomain from hosts file

Ross Burton (2):
  vim: upgrade to 9.0.1403
  vim: set modified-by to the recipe MAINTAINER

 meta/classes/multilib.bbclass                 |   1 +
 meta/classes/populate_sdk_ext.bbclass         |   2 +-
 meta/classes/staging.bbclass                  |   4 +
 meta/classes/toolchain-scripts.bbclass        |   2 +-
 meta/recipes-core/base-files/base-files/hosts |   2 +-
 meta/recipes-core/glibc/glibc.inc             |   4 +-
 meta/recipes-core/meta/buildtools-tarball.bb  |   2 +-
 .../systemd/systemd/systemd-pager.sh          |   7 ++
 meta/recipes-core/systemd/systemd_244.5.bb    |   5 +
 meta/recipes-devtools/qemu/qemu.inc           |   9 +-
 .../qemu/qemu/CVE-2022-4144.patch             | 103 ++++++++++++++++++
 ...tack-limits-after-function-evalution.patch |   2 +-
 .../libarchive/CVE-2022-26280.patch           |  29 +++++
 .../libarchive/libarchive_3.4.2.bb            |   1 +
 .../libksba/libksba/CVE-2022-3515.patch       |  47 ++++++++
 meta/recipes-support/libksba/libksba_1.3.5.bb |   1 +
 meta/recipes-support/vim/vim.inc              |   8 +-
 17 files changed, 215 insertions(+), 14 deletions(-)
 create mode 100644 meta/recipes-core/systemd/systemd/systemd-pager.sh
 create mode 100644 meta/recipes-devtools/qemu/qemu/CVE-2022-4144.patch
 create mode 100644 meta/recipes-extended/libarchive/libarchive/CVE-2022-26280.patch
 create mode 100644 meta/recipes-support/libksba/libksba/CVE-2022-3515.patch

-- 
2.34.1


