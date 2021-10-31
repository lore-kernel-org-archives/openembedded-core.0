Return-Path: <steve@sakoman.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 257CBC433F5
	for <webhook@archiver.kernel.org>; Sun, 31 Oct 2021 14:03:13 +0000 (UTC)
Received: from mail-pg1-f177.google.com (mail-pg1-f177.google.com
 [209.85.215.177])
 by mx.groups.io with SMTP id smtpd.web08.31543.1635688992521705549
 for <openembedded-core@lists.openembedded.org>;
 Sun, 31 Oct 2021 07:03:12 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@sakoman-com.20210112.gappssmtp.com header.s=20210112
 header.b=2ClLMM2a;
 spf=softfail (domain: sakoman.com, ip: 209.85.215.177,
 mailfrom: steve@sakoman.com)
Received: by mail-pg1-f177.google.com with SMTP id x5so4984149pgk.11
        for <openembedded-core@lists.openembedded.org>;
 Sun, 31 Oct 2021 07:03:12 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=sakoman-com.20210112.gappssmtp.com; s=20210112;
        h=subject:from:to:message-id:date;
        bh=UbrTP3W148o031F1gvoBmeeVBFPrNr70aw7hYSHptXs=;
        b=2ClLMM2a1wvdFk9UUeXkffDx2rU8hE17wZKNL0NGEnjXRNefsm1wfnwtKmfI9cCNAs
         hGkb5iv45ZR0ysTeSnO97CbJ2cYO8J26shQhiV4Wfr/DLuG2LN4oVoGteBee9bwpcN1n
         oYfKuVfrQ4+Shl0yp3sHPhb1iyF8f2P+ST8zLr4ZsDqItVYtCaep2nLzwxUcaI7J2SMX
         LDO9l2uPgelgCSUyAji+nIlZ8Z7JBEnPZzQjUZO3/doLCckFvVzZjxZXYzewJmw00IDr
         xZCNcCcrIgXQEvthWHB5MiwBUOngRQb9pxHJT5BN2q5dQzbXCzD1Ta7Ga17klrMaVmr/
         GU0w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:subject:from:to:message-id:date;
        bh=UbrTP3W148o031F1gvoBmeeVBFPrNr70aw7hYSHptXs=;
        b=6Fn/22fytN+8JvA02YPg++1qLwXTa71nrGI3dvdtuJV88QZ6FehG/faOLxp5qx38wV
         reQ/P3KaIwRRO8D348qazUVDwmCXR+jBMJmWG+IS3gCm+fH3Hnl8hCkMh9UcH6ELy9Id
         2fCOTYCci4ykRTZqx2ovxmfNp73WLmqT0OFGWmxcLYWydHLvSrtGjTCYkp89jP+Fxcw6
         Gblfjp31U4y47ndwoX/jn85F7aWWgNBqf+wf/4kiKvYrfXSDhR1LrcvK/7QJQkCREAT+
         w0QRhx29FCYO5F4SlTqjsIRu6D8EnHqkz0UQS1gigQsaIzC8TfCaCYC+F2R9y0nrU9Zp
         Ntzw==
X-Gm-Message-State: AOAM53126BTZsCkpTXBL4VGfWCVNKYsW3rAzQ9Ii/UF6r5+hyNabFD2y
	cWxUxbFVmIdjNz/Q/G24+BCjldTVSt6/Wspc1n0=
X-Google-Smtp-Source: 
 ABdhPJxZFvXAIhOjckClz9zbXE6f2HMAXWnhQPSq8eOS+paJMOEFXH6j7PGIIJMXrhTormmB1HpJSw==
X-Received: by 2002:a05:6a00:158d:b0:47c:36b0:362b with SMTP id
 u13-20020a056a00158d00b0047c36b0362bmr23038293pfk.48.1635688991508;
        Sun, 31 Oct 2021 07:03:11 -0700 (PDT)
Received: from nuc.router0800d9.com (rrcs-66-91-142-162.west.biz.rr.com.
 [66.91.142.162])
        by smtp.gmail.com with ESMTPSA id
 s17sm10481882pge.50.2021.10.31.07.03.10
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 31 Oct 2021 07:03:11 -0700 (PDT)
Received: by nuc.router0800d9.com (Postfix, from userid 1000)
	id D67C49603DD; Sun, 31 Oct 2021 04:03:08 -1000 (HST)
Subject: OE-core CVE metrics for master on Sun 31 Oct 2021 04:00:01 AM HST
FROM: steve@sakoman.com
To: 
 <openembedded-core@lists.openembedded.org>,<yocto-security@lists.yoctoproject.org>
X-Mailer: mail (GNU Mailutils 3.7)
Message-Id: <20211031140308.D67C49603DD@nuc.router0800d9.com>
Date: Sun, 31 Oct 2021 04:03:08 -1000 (HST)
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Sun, 31 Oct 2021 14:03:13 -0000
X-Groupsio-URL: 
 https://lists.openembedded.org/g/openembedded-core/message/157653

Branch: master

New this week: 0 CVEs

Removed this week: 1 CVEs
CVE-2021-39537: ncurses:ncurses-native https://web.nvd.nist.gov/view/vuln/detail?vulnId=CVE-2021-39537 *

Full list:  Found 11 unpatched CVEs
CVE-2019-12067: qemu:qemu-native:qemu-system-native https://web.nvd.nist.gov/view/vuln/detail?vulnId=CVE-2019-12067 *
CVE-2020-18974: nasm:nasm-native https://web.nvd.nist.gov/view/vuln/detail?vulnId=CVE-2020-18974 *
CVE-2021-20255: qemu:qemu-native:qemu-system-native https://web.nvd.nist.gov/view/vuln/detail?vulnId=CVE-2021-20255 *
CVE-2021-3527: qemu:qemu-native:qemu-system-native https://web.nvd.nist.gov/view/vuln/detail?vulnId=CVE-2021-3527 *
CVE-2021-3682: qemu:qemu-native:qemu-system-native https://web.nvd.nist.gov/view/vuln/detail?vulnId=CVE-2021-3682 *
CVE-2021-36976: libarchive:libarchive-native https://web.nvd.nist.gov/view/vuln/detail?vulnId=CVE-2021-36976 *
CVE-2021-3713: qemu:qemu-native:qemu-system-native https://web.nvd.nist.gov/view/vuln/detail?vulnId=CVE-2021-3713 *
CVE-2021-3796: vim https://web.nvd.nist.gov/view/vuln/detail?vulnId=CVE-2021-3796 *
CVE-2021-38297: go https://web.nvd.nist.gov/view/vuln/detail?vulnId=CVE-2021-38297 *
CVE-2021-3872: vim https://web.nvd.nist.gov/view/vuln/detail?vulnId=CVE-2021-3872 *
CVE-2021-3875: vim https://web.nvd.nist.gov/view/vuln/detail?vulnId=CVE-2021-3875 *

