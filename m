Return-Path: <bruce.ashfield@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 65C4CC433EF
	for <webhook@archiver.kernel.org>; Thu, 14 Jul 2022 19:15:00 +0000 (UTC)
Received: from mail-qv1-f43.google.com (mail-qv1-f43.google.com
 [209.85.219.43])
 by mx.groups.io with SMTP id smtpd.web11.268.1657826096482073373
 for <openembedded-core@lists.openembedded.org>;
 Thu, 14 Jul 2022 12:14:56 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20210112 header.b=esAT5zjJ;
 spf=pass (domain: gmail.com, ip: 209.85.219.43,
 mailfrom: bruce.ashfield@gmail.com)
Received: by mail-qv1-f43.google.com with SMTP id g9so2175396qvq.7
        for <openembedded-core@lists.openembedded.org>;
 Thu, 14 Jul 2022 12:14:56 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=r2sUk6l1RTvR9ZfCcHjvIhqqTmo0wAxiv84FmcOIhXE=;
        b=esAT5zjJ4+x/NijAKh1KFB9FkjH+pw2ylUdVpEjDUn1vEJUn3vLDBwPErxuUlomSdk
         EYiNb/L7iWHZUdgDizFKtwh5oXSX+U6V9sDxHoSedPrAQ9a9WmyVwP8jlwwgZ9FlHIc6
         UbT0XXL9I6OTjtJFZ4vBKmiaHAhG65tPOxg9NO1ZaAWm1dFF+hYfSkCKEDNpte2sm0gX
         1de9WyLtcgjBlF0rfrr0QuIJfgVZocGhABtFEdbcEIchU+VwUWjpRt3cQu0q4Q4TMvzy
         cOazvFWou+dogF4OI++IecktAWZ88CChJQpKTz43qSIsk4epLPHZ6S6Y0jhNROG9Zuif
         xSxw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=r2sUk6l1RTvR9ZfCcHjvIhqqTmo0wAxiv84FmcOIhXE=;
        b=mWnOIlvR8kC+iNVYr93X04g1C4uQJG9fWAHyiZNFwBnUho7JuhAK1jRpZGb0FULyry
         JpTkKCyXyAumjyHG4mPl3UDw7rZpgtXmmPaOnIhacfN1WcgdwOV1WNW+srsum8sVwZmw
         3K/UrsaHJr8X7esnUVmMrPIzzSOxKmvqo1tB9ResK86gPWIljPMTaNfm9mkeYzO14vfB
         zfBWpYocvmwZdOksiYjX1I9WtG82wcCBbxTVEb+7mYA5D58Sub4irpTxslRlYbeOB5Ep
         qQq2HowTcDKro7Cy+DztZhnmAD0n0tobPnZHiE1dkfUprGRH3sRFDZ0aG8gmG45dPKJx
         /wtQ==
X-Gm-Message-State: AJIora81n6ApA7ohW/6kBCNo/TeFfUXLp98nHu581m9aJVQjKOSP+Kfo
	VRgsR04wIK/bmjigp+iZSCk=
X-Google-Smtp-Source: 
 AGRyM1u/YJMQJYNfPRDR3D2n2rtnw1Q3dNbNaN3tokEsTV4K6oqh07f03FI5Heul5+UHgLpd2R37qQ==
X-Received: by 2002:a05:6214:c2c:b0:473:7c44:5d28 with SMTP id
 a12-20020a0562140c2c00b004737c445d28mr9212684qvd.43.1657826095433;
        Thu, 14 Jul 2022 12:14:55 -0700 (PDT)
Received: from build.lan ([173.34.88.218])
        by smtp.gmail.com with ESMTPSA id
 d11-20020a05620a240b00b006b253a6dd1fsm1966022qkn.125.2022.07.14.12.14.54
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 14 Jul 2022 12:14:54 -0700 (PDT)
From: bruce.ashfield@gmail.com
To: richard.purdie@linuxfoundation.org
Cc: openembedded-core@lists.openembedded.org
Subject: [PATCH 00/10] linux-yocto: consolidated pull request
Date: Thu, 14 Jul 2022 15:14:43 -0400
Message-Id: <cover.1657825809.git.bruce.ashfield@gmail.com>
X-Mailer: git-send-email 2.19.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Thu, 14 Jul 2022 19:15:00 -0000
X-Groupsio-URL: 
 https://lists.openembedded.org/g/openembedded-core/message/168040

From: Bruce Ashfield <bruce.ashfield@gmail.com>

Richard,

The gen-mach-types patches are repeats of ones I sent before, but I've
included them to make the ordering clear.

After that, we have two -stable updates (getting ready for the "big"
CVE updates)

And then the pnmtologo fixes. That should be all the builpaths warnings.

I'm sending this all to oe-core fo simplicty sake, but obviously the
yocto-bsp ones are for the yocto layers.

Brue

The following changes since commit e65ee81d621e679107b5f4ef2dbbb8d1786e93ad:

  ltp: fix builds when host ld doesn't know about target ELF formats (2022-07-14 10:08:57 +0100)

are available in the Git repository at:

  git://git.yoctoproject.org/poky-contrib zedd/kernel
  http://git.yoctoproject.org/cgit.cgi/poky-contrib/log/?h=zedd/kernel

Bruce Ashfield (10):
  linux-yocto/5.10: fix buildpaths issue with gen-mach-types
  linux-yocto/5.15: fix buildpaths issue with gen-mach-types
  yocto-bsps/5.10: fix buildpaths issue with gen-mach-types
  yocto-bsps/5.15: fix buildpaths issue with gen-mach-types
  linux-yocto/5.15: update to v5.15.54
  linux-yocto/5.10: update to v5.10.130
  linux-yocto/5.15: fix buildpaths issue with pnmtologo
  linux-yocto/5.10: fix buildpaths issue with pnmtologo
  yocto-bsps/5.10: fix buildpaths issue with pnmtologo
  yocto-bsps/5.15: fix buildpaths issue with pnmtologo

 .../linux/linux-yocto_5.10.bbappend           |  8 +++---
 .../linux/linux-yocto_5.15.bbappend           |  8 +++---
 .../linux/linux-yocto-rt_5.10.bb              |  6 ++---
 .../linux/linux-yocto-rt_5.15.bb              |  6 ++---
 .../linux/linux-yocto-tiny_5.10.bb            |  8 +++---
 .../linux/linux-yocto-tiny_5.15.bb            |  6 ++---
 meta/recipes-kernel/linux/linux-yocto_5.10.bb | 24 ++++++++---------
 meta/recipes-kernel/linux/linux-yocto_5.15.bb | 26 +++++++++----------
 8 files changed, 46 insertions(+), 46 deletions(-)

-- 
2.19.1


