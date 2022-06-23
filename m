Return-Path: <steve@sakoman.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 6C595C433EF
	for <webhook@archiver.kernel.org>; Thu, 23 Jun 2022 22:46:53 +0000 (UTC)
Received: from mail-pg1-f170.google.com (mail-pg1-f170.google.com
 [209.85.215.170])
 by mx.groups.io with SMTP id smtpd.web11.1186.1656024409678077861
 for <openembedded-core@lists.openembedded.org>;
 Thu, 23 Jun 2022 15:46:50 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@sakoman-com.20210112.gappssmtp.com header.s=20210112
 header.b=gqh1hcBg;
 spf=softfail (domain: sakoman.com, ip: 209.85.215.170,
 mailfrom: steve@sakoman.com)
Received: by mail-pg1-f170.google.com with SMTP id z14so798054pgh.0
        for <openembedded-core@lists.openembedded.org>;
 Thu, 23 Jun 2022 15:46:49 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=sakoman-com.20210112.gappssmtp.com; s=20210112;
        h=from:to:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=BbFg2OS3Dxn+Cp+hZfIZ2bm5/nmrIBAxEv4YUP895M0=;
        b=gqh1hcBgB740jQjT9Of//kyndj//uwFd9axk+JqrCPxzaCnvYaBMkBCu2zxYizo3Wa
         owmK4zREH+GXlvUbUu89LfNpJ3U6u/Ibv9xtagCHvq5teHEMvHd3jqTwNjVKiAYPcceR
         dpY/iNb9K+aCdKXPm857u9QurkRSWbjk/LWUY+srqx4IV6FnetDphegHJZXpUX1nN5bi
         REdU0TF21lvwkRuNxLoxX2NvnkbwcpDv9oJIUl7B3jJSixoLgJJVv51w5DFAbuJzSh7P
         HHDwSEfGbZ7nr6DUGWv5EVgC3sQQgXqAd042S6MRObNcOE5ad05BxW7rZbP9UchuWAsu
         D4rw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:from:to:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=BbFg2OS3Dxn+Cp+hZfIZ2bm5/nmrIBAxEv4YUP895M0=;
        b=i/Df311MU5BcWDCZS5B8UYwQVlkFE5du2y2Xo+3jPImI1Art6EtWjmpUWmzEU6e/Gb
         wcsYlRqWrXQloSk3G4ni2ZpCBnnUHF3S5gqgCz/xbNpzPsVJWFrSMAUlwO5PBv7AQL/k
         OJmfVvrXy09JIWG+AVXSCzyE7vVHp64KYHDDjP/LQ5pQZcwCNhi5o5wkcJzZsv/5c2Wj
         YQMyTAvMyXgwB54FgSebheNITUIgUhvbk3JJoKor6nMN3QsF2445Td8zSdGt+cd69ZOR
         +ZXY3DGafzopo8uItBaC3KOeqZdGP2d1YSEEUlngY5869gU2hPW9QVhOpNxWCyL/mv8L
         0n9A==
X-Gm-Message-State: AJIora+xsxy22VWr1iybWQ5L8vqlcblkJ42TZqCkBhaeF9FcyBuPofIe
	flItv1ylvS5JmxcSX5Rj+HDvl+8G26xN+3SQ
X-Google-Smtp-Source: 
 AGRyM1suKCRgh/zEbeTihprF8QzlONKNPPijbxT9dLMB+oeI/upP3t+rKm1BDNvxoHTAvf3+re7hEw==
X-Received: by 2002:a63:b90b:0:b0:408:e3bb:94af with SMTP id
 z11-20020a63b90b000000b00408e3bb94afmr9532317pge.300.1656024408253;
        Thu, 23 Jun 2022 15:46:48 -0700 (PDT)
Received: from hexa.router0800d9.com (dhcp-72-253-6-214.hawaiiantel.net.
 [72.253.6.214])
        by smtp.gmail.com with ESMTPSA id
 y1-20020a17090a1f4100b001ec9f9fe028sm2450041pjy.46.2022.06.23.15.46.47
        for <openembedded-core@lists.openembedded.org>
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 23 Jun 2022 15:46:47 -0700 (PDT)
From: Steve Sakoman <steve@sakoman.com>
To: openembedded-core@lists.openembedded.org
Subject: [OE-core][dunfell 0/6] Pull request (cover letter only)
Date: Thu, 23 Jun 2022 12:46:36 -1000
Message-Id: <cover.1656024335.git.steve@sakoman.com>
X-Mailer: git-send-email 2.25.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Thu, 23 Jun 2022 22:46:53 -0000
X-Groupsio-URL: 
 https://lists.openembedded.org/g/openembedded-core/message/167284

The following changes since commit 135adeb82c9303c26193bb6f6bd3bc696793aa62:

  archiver: don't use machine variables in shared recipes (2022-06-15 06:40:10 -1000)

are available in the Git repository at:

  git://git.openembedded.org/openembedded-core-contrib stable/dunfell-next
  http://cgit.openembedded.org/openembedded-core-contrib/log/?h=stable/dunfell-next

Chee Yang Lee (1):
  dpkg: update to 1.19.8

Dmitry Baryshkov (2):
  linux-firmware: add support for building snapshots
  linux-firmware: upgrade 20220509 -> 20220610

Hitendra Prajapati (2):
  python-pip: CVE-2021-3572 Incorrect handling of unicode separators in
    git references
  golang: CVE-2021-44717 syscall: don't close fd 0 on ForkExec error

Nick Potenski (1):
  systemd: systemd-systemctl: Support instance conf files during enable

 .../systemd/systemd-systemctl/systemctl       | 14 +++-
 .../dpkg/{dpkg_1.19.7.bb => dpkg_1.19.8.bb}   |  4 +-
 meta/recipes-devtools/go/go-1.14.inc          |  1 +
 .../go/go-1.14/CVE-2021-44717.patch           | 83 ++++++++++++++++++
 .../python/python3-pip/CVE-2021-3572.patch    | 48 +++++++++++
 .../python/python3-pip_20.0.2.bb              |  1 +
 ...01-Makefile-replace-mkdir-by-install.patch | 84 -------------------
 ...20220509.bb => linux-firmware_20220610.bb} | 11 ++-
 8 files changed, 154 insertions(+), 92 deletions(-)
 rename meta/recipes-devtools/dpkg/{dpkg_1.19.7.bb => dpkg_1.19.8.bb} (86%)
 create mode 100644 meta/recipes-devtools/go/go-1.14/CVE-2021-44717.patch
 create mode 100644 meta/recipes-devtools/python/python3-pip/CVE-2021-3572.patch
 delete mode 100644 meta/recipes-kernel/linux-firmware/files/0001-Makefile-replace-mkdir-by-install.patch
 rename meta/recipes-kernel/linux-firmware/{linux-firmware_20220509.bb => linux-firmware_20220610.bb} (99%)

-- 
2.25.1


