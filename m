Return-Path: <steve@sakoman.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 16503C76196
	for <webhook@archiver.kernel.org>; Thu,  6 Apr 2023 15:56:56 +0000 (UTC)
Received: from mail-pl1-f171.google.com (mail-pl1-f171.google.com [209.85.214.171])
 by mx.groups.io with SMTP id smtpd.web10.162303.1680796605892493517
 for <openembedded-core@lists.openembedded.org>;
 Thu, 06 Apr 2023 08:56:46 -0700
Authentication-Results: mx.groups.io;
 dkim=fail reason="signature has expired" header.i=@sakoman-com.20210112.gappssmtp.com header.s=20210112 header.b=8EYdmdI8;
 spf=softfail (domain: sakoman.com, ip: 209.85.214.171, mailfrom: steve@sakoman.com)
Received: by mail-pl1-f171.google.com with SMTP id ix20so37909188plb.3
        for <openembedded-core@lists.openembedded.org>; Thu, 06 Apr 2023 08:56:45 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=sakoman-com.20210112.gappssmtp.com; s=20210112; t=1680796605; x=1683388605;
        h=content-transfer-encoding:mime-version:message-id:date:subject:to
         :from:from:to:cc:subject:date:message-id:reply-to;
        bh=Pjvh6zJOCILhnK2g8MoZtfW+oJqFrmKZNPpo69hhNG0=;
        b=8EYdmdI84TT9WkaKIuqegxm8JRe5hgb7We3KzLCf55YQt7ctxv1WuS3ze+X36tNtpS
         N1BCl9jg2DzlOUg4iyaNRFsmsP6m6cufCDyjaYN5ROkimDhF8chpDzSFK6yGfrS5HwbS
         K0D3boojyrSbwJ2W/h959dY1YsAdnJ+QPPtgM+1janViIIkfMl8AAfvTR1b48fPXOj28
         s7SyrxMdDzc089leCyNFBPE2mlRSiR6g2EO8Es4CpDE+gCQ6k9G+gzNyTVIe1gyLPg8R
         /9yTen6agKsc1IIwsmnQMJ6ctI/0FG6bUg+jYxF9+laadWh7IT0lIgVV6suwJvHH3XFd
         uY5A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112; t=1680796605; x=1683388605;
        h=content-transfer-encoding:mime-version:message-id:date:subject:to
         :from:x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=Pjvh6zJOCILhnK2g8MoZtfW+oJqFrmKZNPpo69hhNG0=;
        b=sz7IZnvbqFHHMmhUXdR14/LGtTxg2xN7yOoGYEedA5HihlvLNn4L/Vd/NJmHsammTN
         vpAKlIVKGoLml/w8wUWaoDIOi4SpfMXMaHeRj7cjPK9Ez/Oso2KdtTaN9jar1OCLwBNj
         MxaKIwF9S16UTf9viCRZmLZIQZeZM5Y4C75O9pGFd0CVj1XGjoOTv2SjwKRsO7a/pd4X
         inKXfdIWVBazeqRrtSt3Fd1l3TNH+GLSdNoWNhhJFAmYkBpdl3pIT2TDE+/rmbrPdzCn
         Nuuexx0vNBgwCfItKPEfghMd6qNEjmKJIUxncGRxnKNGIhUrFGSlu2G/mDEFJT131y+S
         PcDw==
X-Gm-Message-State: AAQBX9e/N5Pf2fi6KtUdlOJNMkXFNXILEnLo9ZFsPocqLp0GbfrTSk0q
	xOH1YQqZqt57GHzcZ12b8zPvW0oDcUaQlUjh3rk=
X-Google-Smtp-Source: AKy350bRI80yZTBuF6eSx51i++77PeK662QwwDJX274Uc1J+6NaiESd/zlUTcnP12BEsN3IUop2Ajw==
X-Received: by 2002:a17:903:2803:b0:1a2:7d:17f2 with SMTP id kp3-20020a170903280300b001a2007d17f2mr8703139plb.69.1680796604685;
        Thu, 06 Apr 2023 08:56:44 -0700 (PDT)
Received: from hexa.router0800d9.com (dhcp-72-253-4-112.hawaiiantel.net. [72.253.4.112])
        by smtp.gmail.com with ESMTPSA id w20-20020a170902a71400b0019928ce257dsm1553016plq.99.2023.04.06.08.56.43
        for <openembedded-core@lists.openembedded.org>
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 06 Apr 2023 08:56:44 -0700 (PDT)
From: Steve Sakoman <steve@sakoman.com>
To: openembedded-core@lists.openembedded.org
Subject: [OE-core][dunfell 0/7] Pull request (cover letter only)
Date: Thu,  6 Apr 2023 05:56:37 -1000
Message-Id: <cover.1680796532.git.steve@sakoman.com>
X-Mailer: git-send-email 2.34.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Thu, 06 Apr 2023 15:56:56 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/179777

The following changes since commit 1c7d555379c4b0962bccd018870989050d87675f:

  classes/package: Use gzip for extended package data (2023-03-27 16:29:20 -1000)

are available in the Git repository at:

  https://git.openembedded.org/openembedded-core-contrib stable/dunfell-next
  http://cgit.openembedded.org/openembedded-core-contrib/log/?h=stable/dunfell-next

Geoffrey GIRY (1):
  cve-check: Fix false negative version issue

Hitendra Prajapati (2):
  curl: CVE-2023-23916 HTTP multi-header compression denial of service
  qemu: fix compile error which imported by CVE-2022-4144

Martin Jansa (1):
  bmap-tools: switch to main branch

Randy MacLeod (1):
  vim: upgrade 9.0.1403 -> 9.0.1429

Shubham Kulkarni (1):
  go-runtime: Security fix for CVE-2022-41723

Vijay Anusuri (1):
  git: Security fix for CVE-2023-22490 and CVE-2023-23946

 meta/classes/cve-check.bbclass                |   5 +-
 meta/lib/oe/cve_check.py                      |  37 +++
 meta/lib/oeqa/selftest/cases/cve_check.py     |  19 ++
 .../git/files/CVE-2023-22490-1.patch          | 179 +++++++++++++
 .../git/files/CVE-2023-22490-2.patch          | 122 +++++++++
 .../git/files/CVE-2023-22490-3.patch          | 154 ++++++++++++
 .../git/files/CVE-2023-23946.patch            | 184 ++++++++++++++
 meta/recipes-devtools/git/git.inc             |   4 +
 meta/recipes-devtools/go/go-1.14.inc          |   1 +
 .../go/go-1.14/CVE-2022-41723.patch           | 156 ++++++++++++
 meta/recipes-devtools/qemu/qemu.inc           |   1 +
 ...ass-requested-buffer-size-to-qxl_phy.patch | 236 ++++++++++++++++++
 .../bmap-tools/bmap-tools_3.5.bb              |   2 +-
 .../curl/curl/CVE-2023-23916.patch            | 231 +++++++++++++++++
 meta/recipes-support/curl/curl_7.69.1.bb      |   1 +
 meta/recipes-support/vim/vim.inc              |   4 +-
 16 files changed, 1332 insertions(+), 4 deletions(-)
 create mode 100644 meta/recipes-devtools/git/files/CVE-2023-22490-1.patch
 create mode 100644 meta/recipes-devtools/git/files/CVE-2023-22490-2.patch
 create mode 100644 meta/recipes-devtools/git/files/CVE-2023-22490-3.patch
 create mode 100644 meta/recipes-devtools/git/files/CVE-2023-23946.patch
 create mode 100644 meta/recipes-devtools/go/go-1.14/CVE-2022-41723.patch
 create mode 100644 meta/recipes-devtools/qemu/qemu/hw-display-qxl-Pass-requested-buffer-size-to-qxl_phy.patch
 create mode 100644 meta/recipes-support/curl/curl/CVE-2023-23916.patch

-- 
2.34.1


