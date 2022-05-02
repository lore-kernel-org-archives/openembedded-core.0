Return-Path: <steve@sakoman.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 2DAA7C433F5
	for <webhook@archiver.kernel.org>; Mon,  2 May 2022 22:48:09 +0000 (UTC)
Received: from mail-pl1-f180.google.com (mail-pl1-f180.google.com
 [209.85.214.180])
 by mx.groups.io with SMTP id smtpd.web11.4157.1651531679004289833
 for <openembedded-core@lists.openembedded.org>;
 Mon, 02 May 2022 15:47:59 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@sakoman-com.20210112.gappssmtp.com header.s=20210112
 header.b=ZrPwSbqs;
 spf=softfail (domain: sakoman.com, ip: 209.85.214.180,
 mailfrom: steve@sakoman.com)
Received: by mail-pl1-f180.google.com with SMTP id i17so4424018pla.10
        for <openembedded-core@lists.openembedded.org>;
 Mon, 02 May 2022 15:47:58 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=sakoman-com.20210112.gappssmtp.com; s=20210112;
        h=from:to:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=ZDCOealRSL3MldGBluOWtX096TXJEcTJdegr11RfjM4=;
        b=ZrPwSbqst+p138j0a0oaM/tfm4V6e3AVdFuHEuKGbzHPaaOgElOVdniqbegdBG8jyq
         t+jx8d6MPpMV10T0FTCX3wike1ws7xkehEmERtP8EqKyaAKXq0drg8oarMwDASrWc/uC
         OyQxQfcNlh8/5Qt2/b4r/X2hYa3pnhIF3CEYs2N5gK91+1nV6cJYRe565gj5KpshtEc1
         b/2SP15YnuhZdMoFU9KFUsIh2oAgeXfbWeeAFQxU8a4C6v5Wm3aSdTL8lEXSfaMk8oUg
         ttR7lk1ufhqNuz3DHDqAKDUaaVZE9d9iV1RWwSaBKcB4pwOR8gXPwoLTZFsMXcTpSODE
         rUPg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:from:to:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=ZDCOealRSL3MldGBluOWtX096TXJEcTJdegr11RfjM4=;
        b=4bGM55NaFcAXJ91C9ZcFdE5lTn9FKJYZV+yXGFocX4E6qJRHHn+G0tPHxaawhgf9yZ
         oEDx8nbOtBrjYq4pbr4pPEkqkNm4kdaeo/kBYxDT7tNGTDjawbiQVF6VmIw+1Y+G6Drw
         nuIq/RPit5qdsvg04GCv33mqL9WJBrgtqU34689WH9VYMDNHARkna013mvU2420hLfAN
         KNumKwOT2uhmKVURNeHTJv2yJePlQhMzStl3GMeiXoXY8Vuqem48wrzzFcya+zSexrPn
         dNiEfTel77UEgVYHbNxu9iK9b/nqkCZVhcHbF1jJeqlHJVPbHdnF00Md2opWUHgQKqII
         uRLg==
X-Gm-Message-State: AOAM533S8QpzMity5/kw1IDMQM7l4hRuUrDHA884G553sMKg3sJMzsNG
	HOa9LogHe8984Is49WelA1QaFq699Zng/m7ZzVE=
X-Google-Smtp-Source: 
 ABdhPJxHSna6WMWlu31QcNW6kMO0PMjhbLBVvSBhC8o9bg9oVdaWPnKHtuRPPYjwfTcSU35Ujqp67A==
X-Received: by 2002:a17:902:ccc1:b0:15a:24df:a7cc with SMTP id
 z1-20020a170902ccc100b0015a24dfa7ccmr13863524ple.42.1651531677604;
        Mon, 02 May 2022 15:47:57 -0700 (PDT)
Received: from hexa.router0800d9.com (dhcp-72-253-6-214.hawaiiantel.net.
 [72.253.6.214])
        by smtp.gmail.com with ESMTPSA id
 i6-20020a63d446000000b003c23ed27be6sm1776735pgj.10.2022.05.02.15.47.56
        for <openembedded-core@lists.openembedded.org>
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 02 May 2022 15:47:56 -0700 (PDT)
From: Steve Sakoman <steve@sakoman.com>
To: openembedded-core@lists.openembedded.org
Subject: [OE-core][dunfell 0/6] Pull request (cover letter only)
Date: Mon,  2 May 2022 12:47:46 -1000
Message-Id: <cover.1651531535.git.steve@sakoman.com>
X-Mailer: git-send-email 2.25.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Mon, 02 May 2022 22:48:09 -0000
X-Groupsio-URL: 
 https://lists.openembedded.org/g/openembedded-core/message/165178

The following changes since commit 8e81d38048c953d0823abf04d5b2506cd988f0bb:

  build-appliance-image: Update to dunfell head revision (2022-04-25 15:58:54 +0100)

are available in the Git repository at:

  git://git.openembedded.org/openembedded-core-contrib stable/dunfell-next
  http://cgit.openembedded.org/openembedded-core-contrib/log/?h=stable/dunfell-next

Dmitry Baryshkov (1):
  linux-firmware: correct license for ar3k firmware

Marta Rybczynska (1):
  cve-check: add json format

Richard Purdie (1):
  perf-build-test/report: Drop phantomjs and html email reports support

Ross Burton (1):
  boost: don't specify gcc version

Steve Sakoman (1):
  scripts/contrib/oe-build-perf-report-email.py: remove obsolete check
    for phantomjs and optipng

sana kazi (1):
  tiff: Fix CVE-2022-0891

 meta/classes/cve-check.bbclass                | 144 +++++++++++-
 meta/lib/oe/cve_check.py                      |  16 ++
 .../linux-firmware/linux-firmware_20220411.bb |   4 +-
 .../libtiff/files/CVE-2022-0891.patch         | 217 ++++++++++++++++++
 meta/recipes-multimedia/libtiff/tiff_4.1.0.bb |   1 +
 meta/recipes-support/boost/boost.inc          |   2 +-
 scripts/contrib/build-perf-test-wrapper.sh    |  15 +-
 scripts/contrib/oe-build-perf-report-email.py | 167 +-------------
 8 files changed, 388 insertions(+), 178 deletions(-)
 create mode 100644 meta/recipes-multimedia/libtiff/files/CVE-2022-0891.patch

-- 
2.25.1


