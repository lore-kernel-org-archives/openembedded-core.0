Return-Path: <steve@sakoman.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 277FDC433EF
	for <webhook@archiver.kernel.org>; Fri, 15 Jul 2022 21:46:48 +0000 (UTC)
Received: from mail-pj1-f49.google.com (mail-pj1-f49.google.com
 [209.85.216.49])
 by mx.groups.io with SMTP id smtpd.web09.2530.1657921602340215547
 for <openembedded-core@lists.openembedded.org>;
 Fri, 15 Jul 2022 14:46:42 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@sakoman-com.20210112.gappssmtp.com header.s=20210112
 header.b=c2PsYznc;
 spf=softfail (domain: sakoman.com, ip: 209.85.216.49,
 mailfrom: steve@sakoman.com)
Received: by mail-pj1-f49.google.com with SMTP id b8so6712874pjo.5
        for <openembedded-core@lists.openembedded.org>;
 Fri, 15 Jul 2022 14:46:42 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=sakoman-com.20210112.gappssmtp.com; s=20210112;
        h=from:to:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=Nm+RLqRPlC+NmIgLod6sjAUKszkEkxWtSyUYxhM5DR8=;
        b=c2PsYznccI43bceaSG64Umr5frOMOzaZR2IblNXSBp7SLFUJ7ZLmYgn8kJ6mj7BrMd
         braNjKf9mfNJMKxspe0IlVipRJS51lHoog2UczwOCgLvrkfKH2CHejRbEO6d/ldr3YEV
         LK3aaUaocnHYCSeuaQu72Z2JBuxN5T07TKNJLvjAayLznyaCAERwUHGWJWPDLZSQN/CY
         vArehTHbpfSkFjPb46s6qilseEQPDD88Y/OWAhv9CbtmOSuBRucTghmuf22jkppalwlj
         IEUpxmFiLRF0Y1B7HkL/uVJX7R4GXt3CieiQCdBE2Ryp1CVg2O1mC5HpAmVVg2ecsTXZ
         arQw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:from:to:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=Nm+RLqRPlC+NmIgLod6sjAUKszkEkxWtSyUYxhM5DR8=;
        b=DvRtOkqx6Y0TKUgHU0bv133yYxBJB1RRXHHUAd97BkQ/AkdrNpbJgL4nMn0rBgpZLz
         XoJZ9ABAQ3jg15heJfjpl/+MXQ1twkvrQ+CU1ZoWdGr8hSzleKYW2G6pCPhwG9/wfAQi
         jukewKngT/zPrJaNaW278sFeLPu1eOMif5G5PC4KQBrjeu2iWfOkCc0BzkOf0PttBfLx
         ot/ykdcxVwLOo8qWz8lslTuZWuvN/m80g6SJIunjL+6W3kw1cO+/STbZoIhCeTp/CKoU
         7E6fBUBRPyLnXNIHpAzkwpMs9wgLVCvam+pdAoJsgRfkmhcgbVL1OFoJ9CdqXeSoBBKb
         DSLg==
X-Gm-Message-State: AJIora9Xg5NNnfh/txNYZ2uWmRXj0MpsTMkgo6qoM9VF4tsuRzPbt1FH
	idte0x3woxT5y3FDeZjUmJDHWZX1v0qLxbOU
X-Google-Smtp-Source: 
 AGRyM1vGiK2i8j8onc9mJuAmIPdb5CmOYV288E8VvuqZSrunTvgCzVlhTkLl0RGvEy1c2nSr6bXRyA==
X-Received: by 2002:a17:90b:4c0c:b0:1ef:e4f6:409f with SMTP id
 na12-20020a17090b4c0c00b001efe4f6409fmr23848563pjb.227.1657921601002;
        Fri, 15 Jul 2022 14:46:41 -0700 (PDT)
Received: from hexa.router0800d9.com (dhcp-72-253-6-214.hawaiiantel.net.
 [72.253.6.214])
        by smtp.gmail.com with ESMTPSA id
 z127-20020a626585000000b00528d752969esm4256969pfb.25.2022.07.15.14.46.38
        for <openembedded-core@lists.openembedded.org>
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 15 Jul 2022 14:46:39 -0700 (PDT)
From: Steve Sakoman <steve@sakoman.com>
To: openembedded-core@lists.openembedded.org
Subject: [OE-core][dunfell 0/3] Pull request (cover letter only)
Date: Fri, 15 Jul 2022 11:46:29 -1000
Message-Id: <cover.1657920993.git.steve@sakoman.com>
X-Mailer: git-send-email 2.25.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Fri, 15 Jul 2022 21:46:48 -0000
X-Groupsio-URL: 
 https://lists.openembedded.org/g/openembedded-core/message/168139

The following changes since commit af25fff399fa623b4fd6efbca21e01ea6b4d1fd7:

  qemu: add PACKAGECONFIG for capstone (2022-07-12 04:08:20 -1000)

are available in the Git repository at:

  git://git.openembedded.org/openembedded-core-contrib stable/dunfell-next
  http://cgit.openembedded.org/openembedded-core-contrib/log/?h=stable/dunfell-next

Joshua Watt (1):
  classes/cve-check: Move get_patches_cves to library

Ross Burton (1):
  vim: upgrade to 9.0.0021

Steve Sakoman (1):
  openssl: security upgrade 1.1.1p to 1.1.1q

 meta/classes/cve-check.bbclass                | 62 +-------------
 meta/lib/oe/cve_check.py                      | 82 +++++++++++++++++++
 .../{openssl_1.1.1p.bb => openssl_1.1.1q.bb}  |  2 +-
 meta/recipes-support/vim/vim.inc              |  4 +-
 4 files changed, 87 insertions(+), 63 deletions(-)
 rename meta/recipes-connectivity/openssl/{openssl_1.1.1p.bb => openssl_1.1.1q.bb} (98%)

-- 
2.25.1


