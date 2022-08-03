Return-Path: <steve@sakoman.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id E8C0CC19F28
	for <webhook@archiver.kernel.org>; Wed,  3 Aug 2022 14:21:23 +0000 (UTC)
Received: from mail-pj1-f48.google.com (mail-pj1-f48.google.com
 [209.85.216.48])
 by mx.groups.io with SMTP id smtpd.web12.9113.1659536479498599050
 for <openembedded-core@lists.openembedded.org>;
 Wed, 03 Aug 2022 07:21:19 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@sakoman-com.20210112.gappssmtp.com header.s=20210112
 header.b=tyeT8NoI;
 spf=softfail (domain: sakoman.com, ip: 209.85.216.48,
 mailfrom: steve@sakoman.com)
Received: by mail-pj1-f48.google.com with SMTP id
 p14-20020a17090a74ce00b001f4d04492faso2228568pjl.4
        for <openembedded-core@lists.openembedded.org>;
 Wed, 03 Aug 2022 07:21:19 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=sakoman-com.20210112.gappssmtp.com; s=20210112;
        h=from:to:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=z7WH8NUy4vlQFgg5V+D5AixF4El4BjpNEz5EsZdyIVA=;
        b=tyeT8NoIZxtR08A2l7WI8fS7iE0IiGVIGlhaxoQb/T9b8c1ssVv87ilpRfcCd071k9
         jMpgmDud+ODOassoV9gZvOgdETDwcEkrQGIz7br7TstFWQ98oxFOAM5hXAZfxKh0uYm1
         oCv7NgK0sV/GgfrsAQeKuuDx3SxwnqyUDS4XGW3KthW5d9IB6XGN6B0+dFiYyhuV98Sn
         QsyIql2NOW7Lyb5jzrIYeKISkM6DT1PLhI8Q9/4Aoj9r1QbjfcZQKq1i9dFwTBv3TpkB
         gCKcN0aG7Mll3m0ugBUBYWM+wrDdRVOVAwDh/zbWYS3JUDIpNoOPaCdoJF3RXeJRgQUo
         GGZQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:from:to:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=z7WH8NUy4vlQFgg5V+D5AixF4El4BjpNEz5EsZdyIVA=;
        b=jt/9mCH02nTKngZav/1VuRjElnI0AuYYDnad0Fx4kgwjGHxZcI9d9ARFf8mhBp9w5e
         nujtTUbI+Zk8hJoW7S8y80Rfo4Udve/94pReDR4Cg5gCl5LieGkUjzxHRoMGGp0nCBuG
         wJESMnadOt+gtn2fNvLAAioeYfOwkjkvLpTBb42pBqyE1c+IPMIO0eVC+toHhQhwZu6b
         IUDxgghfzM4ddns49FgRodE2u+3zWEEXNKufzF4q8Ze4JLyxverd1ojte4xC6uKpDHVD
         30JcN3Mry3Ma82P5DhYh9iCoRE9TrUNXA1xJPoxM6ZDeS4ACAlyC6ciTSb1UQdQzk/Y1
         2T1g==
X-Gm-Message-State: ACgBeo18CGPHB9MpdtAVzW4mTUCp4CcD7uZdIWuPqLPTJJ3gV5/It0Bt
	WBnBTSugwZHnOey34z6nEfaZ+425WtxkpRTV
X-Google-Smtp-Source: 
 AA6agR71kVybSjc8Ix0p+CreyHhjTQyAnCujr6mZNAWXKLW4H4Te5bIHo2/nn6WqXS+Of8ARbYeo5Q==
X-Received: by 2002:a17:903:40c4:b0:16d:d2a9:43ae with SMTP id
 t4-20020a17090340c400b0016dd2a943aemr25011147pld.57.1659536478355;
        Wed, 03 Aug 2022 07:21:18 -0700 (PDT)
Received: from hexa.router0800d9.com (dhcp-72-253-6-214.hawaiiantel.net.
 [72.253.6.214])
        by smtp.gmail.com with ESMTPSA id
 jg14-20020a17090326ce00b0016d5e4d29f8sm2005381plb.9.2022.08.03.07.21.16
        for <openembedded-core@lists.openembedded.org>
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 03 Aug 2022 07:21:17 -0700 (PDT)
From: Steve Sakoman <steve@sakoman.com>
To: openembedded-core@lists.openembedded.org
Subject: [OE-core][dunfell 0/7] Pull request (cover letter only)
Date: Wed,  3 Aug 2022 04:21:07 -1000
Message-Id: <cover.1659536424.git.steve@sakoman.com>
X-Mailer: git-send-email 2.25.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Wed, 03 Aug 2022 14:21:23 -0000
X-Groupsio-URL: 
 https://lists.openembedded.org/g/openembedded-core/message/168818

The following changes since commit 3f40d5f095ceb099b604750db96058df00fcd49e:

  build-appliance-image: Update to dunfell head revision (2022-07-25 15:09:15 +0100)

are available in the Git repository at:

  git://git.openembedded.org/openembedded-core-contrib stable/dunfell-next
  http://cgit.openembedded.org/openembedded-core-contrib/log/?h=stable/dunfell-next

Hitendra Prajapati (5):
  gnupg: CVE-2022-34903 possible signature forgery via injection into
    the status line
  grub2: Fix buffer underflow write in the heap
  qemu: CVE-2022-35414 can perform an uninitialized read on the
    translate_fail path, leading to an io_readx or io_writex crash
  libTiff: CVE-2022-2056 CVE-2022-2057 CVE-2022-2058 DoS from Divide By
    Zero Error
  libtirpc: CVE-2021-46828 DoS vulnerability with lots of connections

LUIS ENRIQUEZ (1):
  kernel-fitimage.bbclass: add padding algorithm property in config
    nodes

Sana.Kazi (1):
  libjpeg-turbo: Fix CVE-2021-46822

 meta/classes/kernel-fitimage.bbclass          |   5 +
 .../grub/files/CVE-2021-3695.patch            | 178 +++++++++++++++++
 .../grub/files/CVE-2021-3696.patch            |  46 +++++
 .../grub/files/CVE-2021-3697.patch            |  82 ++++++++
 meta/recipes-bsp/grub/grub2.inc               |   5 +-
 meta/recipes-devtools/qemu/qemu.inc           |   1 +
 .../qemu/qemu/CVE-2022-35414.patch            |  53 +++++
 .../libtirpc/libtirpc/CVE-2021-46828.patch    | 155 +++++++++++++++
 .../libtirpc/libtirpc_1.2.6.bb                |   4 +-
 .../jpeg/files/CVE-2021-46822.patch           | 133 +++++++++++++
 .../jpeg/libjpeg-turbo_2.0.4.bb               |   1 +
 ...022-2056-CVE-2022-2057-CVE-2022-2058.patch | 183 ++++++++++++++++++
 meta/recipes-multimedia/libtiff/tiff_4.1.0.bb |   1 +
 .../gnupg/gnupg/CVE-2022-34903.patch          |  44 +++++
 meta/recipes-support/gnupg/gnupg_2.2.27.bb    |   1 +
 15 files changed, 890 insertions(+), 2 deletions(-)
 create mode 100644 meta/recipes-bsp/grub/files/CVE-2021-3695.patch
 create mode 100644 meta/recipes-bsp/grub/files/CVE-2021-3696.patch
 create mode 100644 meta/recipes-bsp/grub/files/CVE-2021-3697.patch
 create mode 100644 meta/recipes-devtools/qemu/qemu/CVE-2022-35414.patch
 create mode 100644 meta/recipes-extended/libtirpc/libtirpc/CVE-2021-46828.patch
 create mode 100644 meta/recipes-graphics/jpeg/files/CVE-2021-46822.patch
 create mode 100644 meta/recipes-multimedia/libtiff/files/CVE-2022-2056-CVE-2022-2057-CVE-2022-2058.patch
 create mode 100644 meta/recipes-support/gnupg/gnupg/CVE-2022-34903.patch

-- 
2.25.1


