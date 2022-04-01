Return-Path: <steve@sakoman.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 7FECDC433F5
	for <webhook@archiver.kernel.org>; Fri,  1 Apr 2022 00:32:22 +0000 (UTC)
Received: from mail-pj1-f47.google.com (mail-pj1-f47.google.com
 [209.85.216.47])
 by mx.groups.io with SMTP id smtpd.web12.4794.1648773141494494471
 for <openembedded-core@lists.openembedded.org>;
 Thu, 31 Mar 2022 17:32:21 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@sakoman-com.20210112.gappssmtp.com header.s=20210112
 header.b=zThH2kij;
 spf=softfail (domain: sakoman.com, ip: 209.85.216.47,
 mailfrom: steve@sakoman.com)
Received: by mail-pj1-f47.google.com with SMTP id
 gp15-20020a17090adf0f00b001c7cd11b0b3so3838832pjb.3
        for <openembedded-core@lists.openembedded.org>;
 Thu, 31 Mar 2022 17:32:21 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=sakoman-com.20210112.gappssmtp.com; s=20210112;
        h=from:to:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=PPZnwWYSko+C06f7PCQLY4tY015QP5G/jVL5eYOegHk=;
        b=zThH2kijbJbdyfKsYnNK6t1fHuLZur0sroJbgrkVWzM7rHmdIIMufPAn6vWAOEhCWQ
         j7yNlQJRNixjyBOnWqpLAovVv1IFXvwkwWxJxj3c6He9S0Erwav2lUIzNVh50CS+goT+
         Ag/wQiGAAyd46cMEj1qIhSsru7Ox3gKHQJNBJVo54IDsCv9UjhqlHNj1Codk4Lf1t54C
         6RfbSBLYVbdB0AAtjlm1Z9jEQyD5qiiiugrkPAq/Pr1zu0fo1xz70gmL260fLqJKFztC
         pVPLtuclHwgG/2CQ9W28vgls/S4xsEVjkOFgmcnR5Y+XemMwzs7Ge39DbbArCeoudgV8
         3Yxw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:from:to:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=PPZnwWYSko+C06f7PCQLY4tY015QP5G/jVL5eYOegHk=;
        b=in1+oTsXdr4tD/OQyuHH1mN2rPuNk5FXMAnvFiMQ4R+2qEIWaFOpshNNPkiRPUXZ98
         QN8+eP97DPdZEw3oF1HRQVpXEPrqN4RxfjTyCglw3xPLf06u9EJXfM3SInmjBvL0fhC6
         88RDsMY4zMw6mP7yDBzQQ/ejznqq5ISO6lEbrk/u1q04jLIfz4bpHVF2R2kVRqnFbnTo
         mSUP8daCqf9hczGl3ewsKaxb7ezSAhKnkbSKZGGzuzH+JF8XlrDrHO0X2XceY3IF2LO/
         5raPkN+6KhYYMw4waRm5uF7h4MAH9CPCDWiO/wsvqlf2jPC0+heP8LuCpG5MZLMqeRML
         f2Hw==
X-Gm-Message-State: AOAM533PIEvaLJZjmuGqBPWPSJkd3rBParL7ShiqCLkjOeDGu8sUG3VJ
	rKgPuP44ArnVCKu4wg3SrUqZPTNuktTekdYkNX0=
X-Google-Smtp-Source: 
 ABdhPJxjepITcLujGVhZRy50vmZljuJwseo3eIPRlyk96Gdd8QrXl/fuMxpLFSQtvleunU/3boPyiQ==
X-Received: by 2002:a17:902:b906:b0:14f:76a0:ad48 with SMTP id
 bf6-20020a170902b90600b0014f76a0ad48mr8039364plb.79.1648773140077;
        Thu, 31 Mar 2022 17:32:20 -0700 (PDT)
Received: from hexa.router0800d9.com (dhcp-72-253-6-214.hawaiiantel.net.
 [72.253.6.214])
        by smtp.gmail.com with ESMTPSA id
 ay9-20020a056a00300900b004fae1346aa1sm623236pfb.122.2022.03.31.17.32.18
        for <openembedded-core@lists.openembedded.org>
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 31 Mar 2022 17:32:19 -0700 (PDT)
From: Steve Sakoman <steve@sakoman.com>
To: openembedded-core@lists.openembedded.org
Subject: [OE-core][dunfell 00/17] Pull request (cover letter only)
Date: Thu, 31 Mar 2022 14:32:07 -1000
Message-Id: <cover.1648772768.git.steve@sakoman.com>
X-Mailer: git-send-email 2.25.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Fri, 01 Apr 2022 00:32:22 -0000
X-Groupsio-URL: 
 https://lists.openembedded.org/g/openembedded-core/message/163876

Note: this also includes the patches from my previous pull request on Tuesday

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

Steve Sakoman (9):
  libsolv: fix CVE: CVE-2021-44568-71 and CVE-2021-44573-77
  ghostscript: fix CVE-2020-15900 and CVE-2021-45949 for -native
  util-linux: fix CVE-2022-0563
  xserver-xorg: update to 1.20.9
  xserver-xorg: update to 1.20.10
  xserver-xorg: update to 1.20.11
  xserver-xorg: update to 1.20.12
  xserver-xorg: update to 1.20.13
  xserver-xorg: update to 1.20.14

 meta/lib/oeqa/selftest/cases/tinfoil.py       |   2 +-
 .../CVE-2022-23308-fix-regression.patch       |  98 ++++++++
 meta/recipes-core/libxml/libxml2_2.9.10.bb    |   1 +
 .../util-linux/util-linux/CVE-2022-0563.patch | 161 ++++++++++++
 .../util-linux/util-linux_2.35.1.bb           |   1 +
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
 .../xorg-xserver/xserver-xorg.inc             |   2 +-
 .../xserver-xorg/CVE-2020-14345.patch         | 182 --------------
 .../xserver-xorg/CVE-2020-14346.patch         |  36 ---
 .../xserver-xorg/CVE-2020-14347.patch         |  38 ---
 .../xserver-xorg/CVE-2020-14360.patch         | 132 ----------
 .../xserver-xorg/CVE-2020-14361.patch         |  36 ---
 .../xserver-xorg/CVE-2020-14362.patch         |  70 ------
 .../xserver-xorg/CVE-2020-25712.patch         | 102 --------
 ...xorg_1.20.8.bb => xserver-xorg_1.20.14.bb} |  11 +-
 26 files changed, 900 insertions(+), 613 deletions(-)
 create mode 100644 meta/recipes-core/libxml/libxml2/CVE-2022-23308-fix-regression.patch
 create mode 100644 meta/recipes-core/util-linux/util-linux/CVE-2022-0563.patch
 create mode 100644 meta/recipes-devtools/apt/apt/CVE-2020-3810.patch
 create mode 100644 meta/recipes-devtools/qemu/qemu/CVE-2020-13791.patch
 create mode 100644 meta/recipes-extended/ghostscript/ghostscript/CVE-2021-3781_1.patch
 create mode 100644 meta/recipes-extended/ghostscript/ghostscript/CVE-2021-3781_2.patch
 create mode 100644 meta/recipes-extended/ghostscript/ghostscript/CVE-2021-3781_3.patch
 delete mode 100644 meta/recipes-graphics/xorg-xserver/xserver-xorg/CVE-2020-14345.patch
 delete mode 100644 meta/recipes-graphics/xorg-xserver/xserver-xorg/CVE-2020-14346.patch
 delete mode 100644 meta/recipes-graphics/xorg-xserver/xserver-xorg/CVE-2020-14347.patch
 delete mode 100644 meta/recipes-graphics/xorg-xserver/xserver-xorg/CVE-2020-14360.patch
 delete mode 100644 meta/recipes-graphics/xorg-xserver/xserver-xorg/CVE-2020-14361.patch
 delete mode 100644 meta/recipes-graphics/xorg-xserver/xserver-xorg/CVE-2020-14362.patch
 delete mode 100644 meta/recipes-graphics/xorg-xserver/xserver-xorg/CVE-2020-25712.patch
 rename meta/recipes-graphics/xorg-xserver/{xserver-xorg_1.20.8.bb => xserver-xorg_1.20.14.bb} (73%)

-- 
2.25.1


