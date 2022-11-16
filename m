Return-Path: <steve@sakoman.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id D0332C4332F
	for <webhook@archiver.kernel.org>; Wed, 16 Nov 2022 14:10:34 +0000 (UTC)
Received: from mail-pg1-f170.google.com (mail-pg1-f170.google.com [209.85.215.170])
 by mx.groups.io with SMTP id smtpd.web08.7379.1668607834200179130
 for <openembedded-core@lists.openembedded.org>;
 Wed, 16 Nov 2022 06:10:34 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@sakoman-com.20210112.gappssmtp.com header.s=20210112 header.b=04CObzWV;
 spf=softfail (domain: sakoman.com, ip: 209.85.215.170, mailfrom: steve@sakoman.com)
Received: by mail-pg1-f170.google.com with SMTP id o13so16742644pgu.7
        for <openembedded-core@lists.openembedded.org>; Wed, 16 Nov 2022 06:10:34 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=sakoman-com.20210112.gappssmtp.com; s=20210112;
        h=content-transfer-encoding:mime-version:message-id:date:subject:to
         :from:from:to:cc:subject:date:message-id:reply-to;
        bh=e2lO6arOASckyhWjBzN4RWmdBHjlrlLkUH6Plsu72mo=;
        b=04CObzWVAqn/NJq/tDPG1j4e8/SIrRBSvekePaqI9d0B8xHmUJCeartHcOCYRbm0ra
         8WtFPTQkAEb1zumUaO/TVVlF7/EM7IV2cixL6T/yusC2/ORoiXplZLBWDGM2VZNzH3te
         qdajClt954yXfo/jFcUPGbpENUaLBJbvNIXfTDbaLhfTxKhbp5tf2jKYhGj5EAj11O16
         9ipYXvncLucbjYmxDD86pw0C7ZvEg4jSKXnsn4wNCrZNS4bSJOgvUVh4nc7+ZVAzED2e
         NbHxAsfPnLwdQmekJyKEvE8z9jSvKbgzFZUqa7mPy/z3OCJB8Dm1oKy24GdEl1ALwLmY
         R5XA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=content-transfer-encoding:mime-version:message-id:date:subject:to
         :from:x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=e2lO6arOASckyhWjBzN4RWmdBHjlrlLkUH6Plsu72mo=;
        b=J9PxmX5nUsMP+BsnWaEKSrOo0r9RLDB8t0xrgN55TTjIQIOzGr8VJqEIxFjof0qkcZ
         DNjCnnZ4t1FnbGatjZdSYKSXskUxKo0SYupDe2C+L4N9uWnDYo0LtwyRL7loj40lVESS
         bWww/p7uycc/jMloYBSU5bNXUPZQpyeYFr5LiOU1t3w0seMkR5qWirsptd4vfJ0WocQd
         bX8NzSMbSyeo8pUWr0k7zPFaDfJoMr7U4jxzHSYh7mY8JJeG2QcP6y53PtEovfF2JfeC
         nSiX4aerl9e3mLoMbE9bdiSeibHTLPN9a7SCXnLYq0YB5P1Oje8oXn1TwqM1/z7+j7FA
         ZrnA==
X-Gm-Message-State: ANoB5pnHhXDh3MovzO5wA8o9xvYuEkG+32J4JZWt49b27Rv2/KENG9w8
	VtOvkNWDCqYMboXc5DxlTi5AyPLn6bJFr79KctI=
X-Google-Smtp-Source: AA0mqf6qnvn+eKdr7iLwDWB9SlDQCj27boSyz3TS4iZgf+gbvdBy0fzywxm8OddwWlLcd+0sobZCfg==
X-Received: by 2002:a63:2243:0:b0:457:f843:ffcd with SMTP id t3-20020a632243000000b00457f843ffcdmr20530467pgm.101.1668607833110;
        Wed, 16 Nov 2022 06:10:33 -0800 (PST)
Received: from hexa.router0800d9.com (dhcp-72-253-6-214.hawaiiantel.net. [72.253.6.214])
        by smtp.gmail.com with ESMTPSA id y17-20020a17090322d100b0017bb38e4588sm12300432plg.135.2022.11.16.06.10.32
        for <openembedded-core@lists.openembedded.org>
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 16 Nov 2022 06:10:32 -0800 (PST)
From: Steve Sakoman <steve@sakoman.com>
To: openembedded-core@lists.openembedded.org
Subject: [OE-core][dunfell 00/11] Pull request (cover letter only)
Date: Wed, 16 Nov 2022 04:10:26 -1000
Message-Id: <cover.1668607784.git.steve@sakoman.com>
X-Mailer: git-send-email 2.25.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Wed, 16 Nov 2022 14:10:34 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/173387

The following changes since commit babcb7cd3bbefe9c0ea28e960e4fd6cefbc03cae:

  bluez5: add dbus to RDEPENDS (2022-11-04 07:52:01 -1000)

are available in the Git repository at:

  https://git.openembedded.org/openembedded-core-contrib stable/dunfell-next
  http://cgit.openembedded.org/openembedded-core-contrib/log/?h=stable/dunfell-next

Alex Kiernan (1):
  openssl: upgrade 1.1.1q to 1.1.1s

Hitendra Prajapati (1):
  bluez: CVE-2022-3637 A DoS exists in monitor/jlink.c

Martin Jansa (1):
  externalsrc.bbclass: fix git repo detection

Peter Kjellerstedt (1):
  externalsrc.bbclass: Remove a trailing slash from ${B}

Ross Burton (1):
  sanity: check for GNU tar specifically

Sundeep KOKKONDA (2):
  binutils: stable 2.34 branch updates
  glibc : stable 2.31 branch updates.

Sunil Kumar (1):
  go: Security Fix for CVE-2022-2879

Vivek Kumbhar (2):
  curl: fix CVE-2022-32221 POST following PUT
  qemu: fix CVE-2021-3638 ati-vga: inconsistent check in ati_2d_blt()
    may lead to out-of-bounds write

ciarancourtney (1):
  wic: swap partitions are not added to fstab

 meta/classes/externalsrc.bbclass              |   6 +-
 meta/classes/sanity.bbclass                   |   8 ++
 meta/recipes-connectivity/bluez5/bluez5.inc   |   1 +
 .../bluez5/bluez5/CVE-2022-3637.patch         |  39 ++++++
 .../{openssl_1.1.1q.bb => openssl_1.1.1s.bb}  |   2 +-
 meta/recipes-core/glibc/glibc-version.inc     |   2 +-
 .../glibc/glibc/CVE-2021-33574_1.patch        |  26 ++--
 .../binutils/binutils-2.34.inc                |   2 +-
 .../binutils/binutils/CVE-2020-16593.patch    |   4 +-
 .../binutils/binutils/CVE-2021-3549.patch     |  80 ++++++-------
 meta/recipes-devtools/go/go-1.14.inc          |   1 +
 .../go/go-1.14/CVE-2022-2879.patch            | 111 ++++++++++++++++++
 meta/recipes-devtools/qemu/qemu.inc           |   1 +
 .../qemu/qemu/CVE-2021-3638.patch             |  80 +++++++++++++
 .../curl/curl/CVE-2022-32221.patch            |  29 +++++
 meta/recipes-support/curl/curl_7.69.1.bb      |   1 +
 scripts/lib/wic/plugins/imager/direct.py      |   2 +-
 17 files changed, 329 insertions(+), 66 deletions(-)
 create mode 100644 meta/recipes-connectivity/bluez5/bluez5/CVE-2022-3637.patch
 rename meta/recipes-connectivity/openssl/{openssl_1.1.1q.bb => openssl_1.1.1s.bb} (98%)
 create mode 100644 meta/recipes-devtools/go/go-1.14/CVE-2022-2879.patch
 create mode 100644 meta/recipes-devtools/qemu/qemu/CVE-2021-3638.patch
 create mode 100644 meta/recipes-support/curl/curl/CVE-2022-32221.patch

-- 
2.25.1


