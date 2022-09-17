Return-Path: <steve@sakoman.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 94384ECAAA1
	for <webhook@archiver.kernel.org>; Sat, 17 Sep 2022 16:27:05 +0000 (UTC)
Received: from mail-pg1-f180.google.com (mail-pg1-f180.google.com
 [209.85.215.180])
 by mx.groups.io with SMTP id smtpd.web09.245.1663432022364731214
 for <openembedded-core@lists.openembedded.org>;
 Sat, 17 Sep 2022 09:27:02 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@sakoman-com.20210112.gappssmtp.com header.s=20210112
 header.b=FM8TL11U;
 spf=softfail (domain: sakoman.com, ip: 209.85.215.180,
 mailfrom: steve@sakoman.com)
Received: by mail-pg1-f180.google.com with SMTP id r23so14512202pgr.6
        for <openembedded-core@lists.openembedded.org>;
 Sat, 17 Sep 2022 09:27:02 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=sakoman-com.20210112.gappssmtp.com; s=20210112;
        h=content-transfer-encoding:mime-version:message-id:date:subject:to
         :from:from:to:cc:subject:date;
        bh=TqZVCLfkNDBo8dUr4dh6CUdWr2ZsOLojz79OhLCHq7k=;
        b=FM8TL11UlFKH2GXWHCb2gbLzmToSmoSIJJI2gq6Ltcjdk1hGhpuKsmJPUWOBIZg96m
         pv0pogtAjMoq5ycJ46KFvP13C7GPXV5RnrnYF4B/nVQNvpnjdzQetny9xC/YOq1VIDMe
         ieLmlGuHeuTYvAxtqEnRRFMQrjvEPyPAfabFy5BdLVlLr1i2MavoL/iB5KU3FHojXL1H
         b9FoZxJQfJjybEqU75nXE3dDJzHgkNre4UBPibSIdqNMWf+f8I315HjOd3Dw49E7sIF9
         ZT+1hrTUZsg6dhNNtHnRBiVcKBOct1rTjNn8QO7Brh2SOzbzNjAk1rgFm20H5q6GQz1F
         H9aQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=content-transfer-encoding:mime-version:message-id:date:subject:to
         :from:x-gm-message-state:from:to:cc:subject:date;
        bh=TqZVCLfkNDBo8dUr4dh6CUdWr2ZsOLojz79OhLCHq7k=;
        b=509jcyHcfyfBBc5GYXRN06uTJS+mBFoAFxQU/VcgxI5Z+8t9lzqpOQgW8tJlLW/AX3
         zmAQEdl3whOsL2YthSeRhLyj0aXGhhjjsq3NUij69KlWG/ACLkQkK7zh4l/ZpAwS5HpS
         J39HGJ5zQ+++iNq1o3Gyj528p0A+XYxlYRKCx1kX/BBZ5Uqn2cwCnj9OrwSFGXqU6wQV
         E3M75o55EkGrgyc/xLx+/lbme5KBTcR8xQreJxVrg/yUj86z2x0NEsI9vW7EYck5vZad
         Ki/PDGBqWkFkrkUo+8f5lW2SpUlpOWP/9+yVHqz3IVMyy25ygfQks6+YEURIroi9ftgA
         FzjA==
X-Gm-Message-State: ACrzQf1Azo1HVE2+YPuAzdYzFBacqM/Eg602nLxgjm6t4i+Hwubfsr0y
	1Sz42sWdKS6+9PI4r1zuxvcLEtv10f2XMiTF
X-Google-Smtp-Source: 
 AMsMyM6KXEJiKaleyNQXrlKKqD7raZFAY5NSIqvFDvD7KYcJG0wgOoPUUH+U5pMOkbNqRxSRnPPLAA==
X-Received: by 2002:a05:6a00:4211:b0:541:212b:e0cd with SMTP id
 cd17-20020a056a00421100b00541212be0cdmr10835347pfb.1.1663432021147;
        Sat, 17 Sep 2022 09:27:01 -0700 (PDT)
Received: from hexa.router0800d9.com (dhcp-72-253-6-214.hawaiiantel.net.
 [72.253.6.214])
        by smtp.gmail.com with ESMTPSA id
 u8-20020a17090341c800b00172751a2fa4sm17107272ple.80.2022.09.17.09.26.59
        for <openembedded-core@lists.openembedded.org>
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 17 Sep 2022 09:27:00 -0700 (PDT)
From: Steve Sakoman <steve@sakoman.com>
To: openembedded-core@lists.openembedded.org
Subject: [OE-core][kirkstone 0/5] Pull request (cover letter only)
Date: Sat, 17 Sep 2022 06:26:50 -1000
Message-Id: <cover.1663431913.git.steve@sakoman.com>
X-Mailer: git-send-email 2.25.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Sat, 17 Sep 2022 16:27:05 -0000
X-Groupsio-URL: 
 https://lists.openembedded.org/g/openembedded-core/message/170839

The following changes since commit 08406e03abddc7290c0c2296aa179725a58155d3:

  runqemu: display host uptime when starting (2022-09-12 04:45:14 -1000)

are available in the Git repository at:

  git://git.openembedded.org/openembedded-core-contrib stable/kirkstone-next
  http://cgit.openembedded.org/openembedded-core-contrib/log/?h=stable/kirkstone-next

Alexander Kanavin (1):
  lighttpd: upgrade 1.4.65 -> 1.4.66

Richard Purdie (1):
  vim: Upgrade 9.0.0341 -> 9.0.0453

niko.mauno@vaisala.com (2):
  systemd: Fix unwritable /var/lock when no sysvinit handling
  systemd: Add 'no-dns-fallback' PACKAGECONFIG option

wangmy (1):
  lighttpd: upgrade 1.4.64 -> 1.4.65

 meta/recipes-core/systemd/systemd/00-create-volatile.conf     | 1 +
 meta/recipes-core/systemd/systemd_250.5.bb                    | 1 +
 .../lighttpd/{lighttpd_1.4.64.bb => lighttpd_1.4.66.bb}       | 2 +-
 meta/recipes-support/vim/vim.inc                              | 4 ++--
 4 files changed, 5 insertions(+), 3 deletions(-)
 rename meta/recipes-extended/lighttpd/{lighttpd_1.4.64.bb => lighttpd_1.4.66.bb} (97%)

-- 
2.25.1


