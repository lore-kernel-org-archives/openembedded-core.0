Return-Path: <steve@sakoman.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id CD960C433EF
	for <webhook@archiver.kernel.org>; Mon, 25 Apr 2022 19:26:10 +0000 (UTC)
Received: from mail-pl1-f178.google.com (mail-pl1-f178.google.com
 [209.85.214.178])
 by mx.groups.io with SMTP id smtpd.web12.489.1650665016458741701
 for <openembedded-core@lists.openembedded.org>;
 Fri, 22 Apr 2022 15:03:37 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@sakoman-com.20210112.gappssmtp.com header.s=20210112
 header.b=GtgOwL7W;
 spf=softfail (domain: sakoman.com, ip: 209.85.214.178,
 mailfrom: steve@sakoman.com)
Received: by mail-pl1-f178.google.com with SMTP id u15so10309619ple.4
        for <openembedded-core@lists.openembedded.org>;
 Fri, 22 Apr 2022 15:03:36 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=sakoman-com.20210112.gappssmtp.com; s=20210112;
        h=from:to:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=UeGw3hx/f/vPSVyIbf1R6pNfOEs8f34EDtJqw0nX2GU=;
        b=GtgOwL7WeY5YSXEa8ADQ5alG1dsc/kqnnxEyOeLF8fKQ80vNQW61WXImX3zecEBM0Y
         fapqYG28QjVUXHZlDGBlRIrUx4poGH/ci41BK6EZxNWtxUxn/uFzuLesF5QVNuUu5cS7
         Cevboja/X9D0H9KioXPWFvqEdpXwRzuq0qAXoz+ss3lHEXSTvVykzrLh0vMw4oSchdyz
         La7CAZ3EPG5B4GnONZNa+M/vNzgAIjlgJIVjuA4F2c2QMCfyLJER7LNFGbE6e+381Q6E
         cfuXiwiHzRUz9HHNA3txG6vn6gglj71gd2a6IjDNklkG68bF3FZKjMrvsHJPKf/6WMDO
         mdFQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:from:to:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=UeGw3hx/f/vPSVyIbf1R6pNfOEs8f34EDtJqw0nX2GU=;
        b=jxLKoUMcQgWh5AhcEzQ5qog7ye+O3H7PzgVMb47hh+KzcecgDRqAkMp/Es/PZieoLm
         M1RqngwP8PKNp7KuZghv+pJjG91TIf6simNtlkhuOJpdNQTOcQj3qoJXHL9jScHilGFH
         ZT+VKKZiIZ76w49U8DV1fsFPOVcGjYHWQet1JGPpV5ZH0nBznKFkNfbcC4alPVrmIicd
         sXADfUzzkRWH4kSIK2M5vGNfTom/5q8pnr0yeODizhU/DI1IARLrPFWZS8QZNFZ8tv+2
         VDZ1d2asNxdhZgrL8txlfYj36aej/db6RCdiOuNHMCbzwK46vojO9/rARV+tFfoD7hh6
         xOMQ==
X-Gm-Message-State: AOAM533nndVYYP6Dk1N2tNP5Wpqujd9ZvrHB4c0fc3gslpwwOwCDhq07
	NCbyF//HTY1yg52MMyvcIlTPz7biHhXEJnp/N5o=
X-Google-Smtp-Source: 
 ABdhPJydrT49zX3rqKqKUnxaQSpT+00SOgndkAVybcVt3FGmsVI1snI+vEX+NgUklLs3QH944DuarA==
X-Received: by 2002:a17:902:d584:b0:15c:8692:a81c with SMTP id
 k4-20020a170902d58400b0015c8692a81cmr3595387plh.145.1650665015343;
        Fri, 22 Apr 2022 15:03:35 -0700 (PDT)
Received: from hexa.router0800d9.com (dhcp-72-253-6-214.hawaiiantel.net.
 [72.253.6.214])
        by smtp.gmail.com with ESMTPSA id
 u8-20020a62ed08000000b0050a90fd59d5sm3431975pfh.50.2022.04.22.15.03.34
        for <openembedded-core@lists.openembedded.org>
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 22 Apr 2022 15:03:34 -0700 (PDT)
From: Steve Sakoman <steve@sakoman.com>
To: openembedded-core@lists.openembedded.org
Subject: [OE-core][dunfell 0/9] Pull request (cover letter only)
Date: Fri, 22 Apr 2022 12:03:23 -1000
Message-Id: <cover.1650664907.git.steve@sakoman.com>
X-Mailer: git-send-email 2.25.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Mon, 25 Apr 2022 19:26:10 -0000
X-Groupsio-URL: 
 https://lists.openembedded.org/g/openembedded-core/message/164800

The following changes since commit 8fd5133fc7f6bc84193ec6fcbc1746c59bfc8caf:

  libxshmfence: Correct LICENSE to HPND (2022-04-18 12:13:17 -1000)

are available in the Git repository at:

  git://git.openembedded.org/openembedded-core-contrib stable/dunfell-next
  http://cgit.openembedded.org/openembedded-core-contrib/log/?h=stable/dunfell-next

Bruce Ashfield (5):
  linux-yocto/5.4: update to v5.4.182
  linux-yocto/5.4: update to v5.4.183
  linux-yocto/5.4: update to v5.4.186
  linux-yocto/5.4: update to v5.4.188
  linux-yocto/5.4: update to v5.4.190

Peter Kjellerstedt (1):
  u-boot: Correct the SRC_URI

Steve Sakoman (1):
  git update from 2.24.3 to 2.24.4

wangmy (1):
  linux-firmware: upgrade 20220310 -> 20220411

zhengruoqin (1):
  wireless-regdb: upgrade 2022.02.18 -> 2022.04.08

 meta/recipes-bsp/u-boot/u-boot-common.inc     |   4 +-
 .../git/files/CVE-2021-21300.patch            | 305 ------------------
 meta/recipes-devtools/git/git.inc             |   1 -
 .../git/{git_2.24.3.bb => git_2.24.4.bb}      |   4 +-
 ...20220310.bb => linux-firmware_20220411.bb} |   4 +-
 .../linux/linux-yocto-rt_5.4.bb               |   6 +-
 .../linux/linux-yocto-tiny_5.4.bb             |   8 +-
 meta/recipes-kernel/linux/linux-yocto_5.4.bb  |  22 +-
 ....02.18.bb => wireless-regdb_2022.04.08.bb} |   2 +-
 9 files changed, 25 insertions(+), 331 deletions(-)
 delete mode 100644 meta/recipes-devtools/git/files/CVE-2021-21300.patch
 rename meta/recipes-devtools/git/{git_2.24.3.bb => git_2.24.4.bb} (51%)
 rename meta/recipes-kernel/linux-firmware/{linux-firmware_20220310.bb => linux-firmware_20220411.bb} (99%)
 rename meta/recipes-kernel/wireless-regdb/{wireless-regdb_2022.02.18.bb => wireless-regdb_2022.04.08.bb} (94%)

-- 
2.25.1


