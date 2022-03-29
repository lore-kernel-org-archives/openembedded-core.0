Return-Path: <steve@sakoman.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id DD1F0C4332F
	for <webhook@archiver.kernel.org>; Tue, 29 Mar 2022 22:10:54 +0000 (UTC)
Received: from mail-pl1-f170.google.com (mail-pl1-f170.google.com
 [209.85.214.170])
 by mx.groups.io with SMTP id smtpd.web09.161.1648591853295106364
 for <openembedded-core@lists.openembedded.org>;
 Tue, 29 Mar 2022 15:10:53 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@sakoman-com.20210112.gappssmtp.com header.s=20210112
 header.b=cdsOdadf;
 spf=softfail (domain: sakoman.com, ip: 209.85.214.170,
 mailfrom: steve@sakoman.com)
Received: by mail-pl1-f170.google.com with SMTP id m18so13975110plx.3
        for <openembedded-core@lists.openembedded.org>;
 Tue, 29 Mar 2022 15:10:53 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=sakoman-com.20210112.gappssmtp.com; s=20210112;
        h=from:to:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=aTvA1kK/tLqEpn7S/g/R7hZ9tlfpMbBrnfRX23muhs0=;
        b=cdsOdadfHFzzSGfmXoCZBGURDJM4TBPP6oW0C/6OUXcSLHnwYFdzepUBncu3YNzi65
         clfR65Z3cW9KyjY0kTrBsYlJiMeMgl0p/fsCP3ok1d1KEyrPSa/DweU5D+lyJyXoR4eK
         SnoinsJMeqOb7mIbthNoX5C9FzBp7MxyT+QsMcd0uyilK8e2o37Rupwr+xBHHTSmKI/X
         6r787qID38wSgSRxDDi1nYkzdDBYMr4uhzz9VD6AgKptcdRU6he6eLlDraDtPimXbFYF
         IBjVU0sOorl0hzUZoy1hp37p7RY6ZOqafs2xrvf+F6ozIy3/SjpaG5S/iWDRZ4ggY3uk
         hNxA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:from:to:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=aTvA1kK/tLqEpn7S/g/R7hZ9tlfpMbBrnfRX23muhs0=;
        b=I55DdtAsaNvTJjTWHIPijOMTAsIT2/hD98W7zGdUgpVIQbdQnAgzWb3bEwRw8+DY40
         Y+48HrgqzZ/Te3DucnxSuiP/iT8CD1U3W1nLAL/hFIlu+7wBvXJFrDfRdbZR8EpkXwWk
         hlEpgbGT9EYl29ma/cismTHbKdvMvhKlZLFiCVUAYuycEQ2rr7x18eBudlTprVhuI691
         r+rldccAZcO472W8mbnHkvFucGy7ykiPXodTXV2DA9pNi+oByn5kQTdU4ZEqw3vXvaD4
         WX8KWV7vc/7b6k/98MTE/F3W3PJYMCt/EwJBvqyGQj+IFcFhY7k1rvriosGoOrj8Szj8
         9Asg==
X-Gm-Message-State: AOAM5313Whu6ZmctOcTagk4fORVmlaUfeJfinhxf0OI82uIsaqUv8KWu
	pCMCZu6NPkDnYBIZ2/ioG1Wu3stMxuIfxEWXJZ8=
X-Google-Smtp-Source: 
 ABdhPJyIYzUVntTx2NWDlA0p23V6PBTWU/HvsQeV7oakyN12vpY/zwrfKYkSSYlxN7r0ALpC6MiBJQ==
X-Received: by 2002:a17:902:b189:b0:14d:6f87:7c25 with SMTP id
 s9-20020a170902b18900b0014d6f877c25mr32389226plr.31.1648591852071;
        Tue, 29 Mar 2022 15:10:52 -0700 (PDT)
Received: from hexa.router0800d9.com (dhcp-72-253-6-214.hawaiiantel.net.
 [72.253.6.214])
        by smtp.gmail.com with ESMTPSA id
 g3-20020a17090a708300b001c7e8ae7637sm3929477pjk.8.2022.03.29.15.10.50
        for <openembedded-core@lists.openembedded.org>
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 29 Mar 2022 15:10:51 -0700 (PDT)
From: Steve Sakoman <steve@sakoman.com>
To: openembedded-core@lists.openembedded.org
Subject: [OE-core][dunfell 00/10] Pull request (cover letter only)
Date: Tue, 29 Mar 2022 12:10:39 -1000
Message-Id: <cover.1648591772.git.steve@sakoman.com>
X-Mailer: git-send-email 2.25.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Tue, 29 Mar 2022 22:10:54 -0000
X-Groupsio-URL: 
 https://lists.openembedded.org/g/openembedded-core/message/163758

The following changes since commit 71015408c60ddf2e9af00cc8574815971e1b689d:

  oeqa/selftest/tinfoil: Improve tinfoil event test debugging (2022-03-21 04:17:02 -1000)

are available in the Git repository at:

  git://git.openembedded.org/openembedded-core-contrib stable/dunfell-next
  http://cgit.openembedded.org/openembedded-core-contrib/log/?h=stable/dunfell-next

Davide Gardenal (3):
  qemu: backport patch fix for CVE-2020-13791
  apt: backport patch fix for CVE-2020-3810
  ghostscript: backport patch fix for CVE-2021-3781

Minjae Kim (2):
  gnu-config: update SRC_URI
  virglrenderer: update SRC_URI

Ralph Siemsen (1):
  libxml2: fix CVE-2022-23308 regression

Richard Purdie (1):
  oeqa/selftest/tinfoil: Fix intermittent event loss issue in test

Ross Burton (1):
  python3: ignore CVE-2022-26488

Steve Sakoman (2):
  libsolv: fix CVE: CVE-2021-44568-71 and CVE-2021-44573-77
  ghostscript: fix CVE-2020-15900 and CVE-2021-45949 for -native

 meta/lib/oeqa/selftest/cases/tinfoil.py       |   2 +-
 .../CVE-2022-23308-fix-regression.patch       |  98 ++++++++
 meta/recipes-core/libxml/libxml2_2.9.10.bb    |   1 +
 meta/recipes-devtools/apt/apt.inc             |   1 +
 .../apt/apt/CVE-2020-3810.patch               | 174 +++++++++++++
 .../gnu-config/gnu-config_git.bb              |   2 +-
 .../recipes-devtools/python/python3_3.8.13.bb |   2 +-
 meta/recipes-devtools/qemu/qemu.inc           |   1 +
 .../qemu/qemu/CVE-2020-13791.patch            |  44 ++++
 .../ghostscript/CVE-2021-3781_1.patch         | 121 +++++++++
 .../ghostscript/CVE-2021-3781_2.patch         |  37 +++
 .../ghostscript/CVE-2021-3781_3.patch         | 238 ++++++++++++++++++
 .../ghostscript/ghostscript_9.52.bb           |   9 +-
 .../libsolv/files/CVE-2021-3200.patch         |  10 +
 .../virglrenderer/virglrenderer_0.8.2.bb      |   2 +-
 15 files changed, 735 insertions(+), 7 deletions(-)
 create mode 100644 meta/recipes-core/libxml/libxml2/CVE-2022-23308-fix-regression.patch
 create mode 100644 meta/recipes-devtools/apt/apt/CVE-2020-3810.patch
 create mode 100644 meta/recipes-devtools/qemu/qemu/CVE-2020-13791.patch
 create mode 100644 meta/recipes-extended/ghostscript/ghostscript/CVE-2021-3781_1.patch
 create mode 100644 meta/recipes-extended/ghostscript/ghostscript/CVE-2021-3781_2.patch
 create mode 100644 meta/recipes-extended/ghostscript/ghostscript/CVE-2021-3781_3.patch

-- 
2.25.1


