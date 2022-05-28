Return-Path: <steve@sakoman.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 17D7EC433F5
	for <webhook@archiver.kernel.org>; Sat, 28 May 2022 02:16:53 +0000 (UTC)
Received: from mail-pl1-f175.google.com (mail-pl1-f175.google.com
 [209.85.214.175])
 by mx.groups.io with SMTP id smtpd.web09.11295.1653704209497695516
 for <openembedded-core@lists.openembedded.org>;
 Fri, 27 May 2022 19:16:49 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@sakoman-com.20210112.gappssmtp.com header.s=20210112
 header.b=MgKt7d9h;
 spf=softfail (domain: sakoman.com, ip: 209.85.214.175,
 mailfrom: steve@sakoman.com)
Received: by mail-pl1-f175.google.com with SMTP id s14so5610691plk.8
        for <openembedded-core@lists.openembedded.org>;
 Fri, 27 May 2022 19:16:49 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=sakoman-com.20210112.gappssmtp.com; s=20210112;
        h=from:to:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=boMypwhZnzP8Ep7obOesDCXTbfzVvuExZtsBKkGSmcE=;
        b=MgKt7d9hdYobthlnIaBVVT2yz3LwAXsY7fu6Bj2wfph3M3eJwuWSrNlBlonqZt8Nsu
         nj/x6/uRDNbHPBm1eYWD5wJMRJ8O1LZP/HWMVwOH5WmLB9SeWnHd2u9pybuRwWpbSMxd
         W+cYS14buXldl0KJ9sKoTZvsjDCBMEc02vXCINbscKCXUN3UVgqdcFw4xFHMV2ICHgnN
         a1XNdepC/nQs5FEoMUErb+08V13arJOMm8g11+XKOiomjnW4GjNTyjBJXP8dwTE9bDrL
         Tuu2zokqNQegdLdMpi0r6kSTaoRsL348WHpL4/tcrIRIb+/ii82n70vWL1tBMZFX4MW4
         g9Sg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:from:to:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=boMypwhZnzP8Ep7obOesDCXTbfzVvuExZtsBKkGSmcE=;
        b=5ht6WzOfMZIcmEkTlg0wCZKmoSI+BE6U0tHZlWvyvKVc75uuFAqCkzsxcqXNJWhbAJ
         XwBv0RiQIfQqDFza2r4uvKR9NZjvbrYLEGhR0bZ1Aj9PkbfE3BAjmqniXB/Wd9FWn287
         VB1EDv84T1FPlxc4uU0hC2EirCBzwN6euluGNO6biMFX8teHL5CM7t8TNhs0Mj/ASFrA
         N/UvZlT9hld9IfzPiXwqP1twMvD0VkurEbVEK7L/ta5yCVQ4DnIhflQ2zin3XOlof+0l
         nxQC3ZPqvydUHus4jvaFGMuURZeCimSnPUDwae0w+JOVC2cQbNmVFZbYauTbbibHVl8R
         C+Cg==
X-Gm-Message-State: AOAM532QIZvl8jzdVN7Z73VASATZAftebXAlEDA2FO7XQOBc97Yf3pdu
	IWttEiLs4h22pfekllYKLV0MtKJ8Mk+B4UaZ
X-Google-Smtp-Source: 
 ABdhPJzSzo4mhgE9j1mQyu4IaUEH5Qv9g8j42Zx7kh6ik8nnQ6WeLc9jDoljRyYTGIl2SCE4zSd6zQ==
X-Received: by 2002:a17:902:eb86:b0:162:1654:4a08 with SMTP id
 q6-20020a170902eb8600b0016216544a08mr30018903plg.72.1653704208212;
        Fri, 27 May 2022 19:16:48 -0700 (PDT)
Received: from hexa.router0800d9.com (dhcp-72-253-6-214.hawaiiantel.net.
 [72.253.6.214])
        by smtp.gmail.com with ESMTPSA id
 u3-20020a17090a3fc300b001e270cc443dsm2258586pjm.46.2022.05.27.19.16.46
        for <openembedded-core@lists.openembedded.org>
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 27 May 2022 19:16:47 -0700 (PDT)
From: Steve Sakoman <steve@sakoman.com>
To: openembedded-core@lists.openembedded.org
Subject: [OE-core][dunfell 0/3] Pull request (cover letter only)
Date: Fri, 27 May 2022 16:16:34 -1000
Message-Id: <cover.1653704110.git.steve@sakoman.com>
X-Mailer: git-send-email 2.25.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Sat, 28 May 2022 02:16:53 -0000
X-Groupsio-URL: 
 https://lists.openembedded.org/g/openembedded-core/message/166220

The following changes since commit 665f981fccbb09d51349c4bd4cfe4ca91001e3bd:

  cve-check: Fix report generation (2022-05-18 05:41:41 -1000)

are available in the Git repository at:

  git://git.openembedded.org/openembedded-core-contrib stable/dunfell-next
  http://cgit.openembedded.org/openembedded-core-contrib/log/?h=stable/dunfell-next

Alexander Kanavin (1):
  mobile-broadband-provider-info: upgrade 20220315 -> 20220511

Hitendra Prajapati (1):
  pcre2: CVE-2022-1586 Out-of-bounds read

Ross Burton (1):
  oeqa/selftest/cve_check: add tests for recipe and image reports

 meta/lib/oeqa/selftest/cases/cve_check.py     | 77 ++++++++++++++++++-
 .../mobile-broadband-provider-info_git.bb     |  4 +-
 .../libpcre/libpcre2/CVE-2022-1586.patch      | 59 ++++++++++++++
 .../recipes-support/libpcre/libpcre2_10.34.bb |  1 +
 4 files changed, 138 insertions(+), 3 deletions(-)
 create mode 100644 meta/recipes-support/libpcre/libpcre2/CVE-2022-1586.patch

-- 
2.25.1


