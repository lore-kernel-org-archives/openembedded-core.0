Return-Path: <steve@sakoman.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id E2B0EC433F5
	for <webhook@archiver.kernel.org>; Sun, 15 May 2022 12:03:59 +0000 (UTC)
Received: from mail-pj1-f48.google.com (mail-pj1-f48.google.com
 [209.85.216.48])
 by mx.groups.io with SMTP id smtpd.web12.16106.1652616235138174111
 for <openembedded-core@lists.openembedded.org>;
 Sun, 15 May 2022 05:03:55 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@sakoman-com.20210112.gappssmtp.com header.s=20210112
 header.b=z1krRAue;
 spf=softfail (domain: sakoman.com, ip: 209.85.216.48,
 mailfrom: steve@sakoman.com)
Received: by mail-pj1-f48.google.com with SMTP id
 l20-20020a17090a409400b001dd2a9d555bso11812506pjg.0
        for <openembedded-core@lists.openembedded.org>;
 Sun, 15 May 2022 05:03:54 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=sakoman-com.20210112.gappssmtp.com; s=20210112;
        h=subject:from:to:message-id:date;
        bh=j0PXys+N7RXjtWiv9hUMDLy9zdgSbK7UlhXpPG7eABQ=;
        b=z1krRAueMt+A2nYZrrNljT7gkXbJHoght0rtSdLeLZFRFPJZv4XVE6ZjaS8gaF4EEs
         RM7QGkxUFwvo1m9q9RqQu0rhO6cnB6X0DZOgvWdm6GuNGy839g0QVv6nrt+wYgyjrruq
         8EWIc2whk7bbSOXj/gtYiZwzr2umUHmH/Z1u/ikM7/fTfm3UGckN+x+C5k4OecLR6NGK
         v3UrwS4oHQu0gls38PpipcC4dHl4HkAGglsK0MEyx+20lY7+4Gbf7XkAle8ftTNkx7gA
         7g402kFdRpe4I10BjJkf1FQg8uWD8vUORf/vM6wNV52VSzOrFop5rkgKwYffChxkjbhI
         IW0Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:subject:from:to:message-id:date;
        bh=j0PXys+N7RXjtWiv9hUMDLy9zdgSbK7UlhXpPG7eABQ=;
        b=tLxUpLPlR3hIGGTEn4AxcAVJxuBymHn7e0HfjAnDebJLM6EmV71qD1PwpI/OMWzP6r
         Ur4XI86mYZHYM6+VumuVqOJ++J/kNCMB+yjwSq3zqLvRjpqNIbgXx04ulsTnBJtuLZkC
         DixP1FRxiIxFrrdqfxfbSd2RkSrClzRku/rAwwkwIbab8CsbX2TH8S+z9lyqgHj2f+L+
         cXcbrkkQiq3TlTNgJggA3yft1zrNToVnowVe2ZC644foU5cC5JMW/x1gbCttVrgZA7y2
         3F/cuDTbFU9FElIHFDqtJ76ddvcNsYPiINX2C6cD6FhkQI2W/FTMyGlInoYiOp4QjsOW
         2xJA==
X-Gm-Message-State: AOAM531tbnCoCWxUpTeJhj9I7ar++WfW+T6vTzvku+UOaUoKEnmz2Nbt
	F56cvJ+NMc77Y2UxsBJj7DJtw/KmrChPDei4
X-Google-Smtp-Source: 
 ABdhPJydA9yLV/s8aLtwJijxlF2CUhSEx69e2/S4hc1nvlsD2vy9Ii72rirbup9o1FWWqYiqr2tPrg==
X-Received: by 2002:a17:90a:e7c3:b0:1dc:5d85:9fd0 with SMTP id
 kb3-20020a17090ae7c300b001dc5d859fd0mr14272471pjb.168.1652616233644;
        Sun, 15 May 2022 05:03:53 -0700 (PDT)
Received: from nuc.router0800d9.com (dhcp-72-253-6-214.hawaiiantel.net.
 [72.253.6.214])
        by smtp.gmail.com with ESMTPSA id
 v4-20020a17090a960400b001dd16b86fc0sm6566518pjo.19.2022.05.15.05.03.52
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 15 May 2022 05:03:52 -0700 (PDT)
Received: by nuc.router0800d9.com (Postfix, from userid 1000)
	id 40CAA962703; Sun, 15 May 2022 02:03:50 -1000 (HST)
Subject: OE-core CVE metrics for master on Sun 15 May 2022 02:00:01 AM HST
FROM: steve@sakoman.com
To: 
 <openembedded-core@lists.openembedded.org>,<yocto-security@lists.yoctoproject.org>
X-Mailer: mail (GNU Mailutils 3.7)
Message-Id: <20220515120350.40CAA962703@nuc.router0800d9.com>
Date: Sun, 15 May 2022 02:03:50 -1000 (HST)
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Sun, 15 May 2022 12:03:59 -0000
X-Groupsio-URL: 
 https://lists.openembedded.org/g/openembedded-core/message/165599

Branch: master

New this week: 1 CVEs
CVE-2022-29824 (CVSS3: 6.5 MEDIUM): libxslt:libxslt-native https://web.nvd.nist.gov/view/vuln/detail?vulnId=CVE-2022-29824 *

Removed this week: 5 CVEs
CVE-2022-1381 (CVSS3: 7.8 HIGH): vim https://web.nvd.nist.gov/view/vuln/detail?vulnId=CVE-2022-1381 *
CVE-2022-1420 (CVSS3: 5.5 MEDIUM): vim https://web.nvd.nist.gov/view/vuln/detail?vulnId=CVE-2022-1420 *
CVE-2022-27404 (CVSS3: 9.8 CRITICAL): freetype:freetype-native https://web.nvd.nist.gov/view/vuln/detail?vulnId=CVE-2022-27404 *
CVE-2022-27405 (CVSS3: 7.5 HIGH): freetype:freetype-native https://web.nvd.nist.gov/view/vuln/detail?vulnId=CVE-2022-27405 *
CVE-2022-27406 (CVSS3: 7.5 HIGH): freetype:freetype-native https://web.nvd.nist.gov/view/vuln/detail?vulnId=CVE-2022-27406 *

Full list:  Found 8 unpatched CVEs
CVE-2019-12067 (CVSS3: 6.5 MEDIUM): qemu:qemu-native:qemu-system-native https://web.nvd.nist.gov/view/vuln/detail?vulnId=CVE-2019-12067 *
CVE-2020-18974 (CVSS3: 3.3 LOW): nasm:nasm-native https://web.nvd.nist.gov/view/vuln/detail?vulnId=CVE-2020-18974 *
CVE-2021-20255 (CVSS3: 5.5 MEDIUM): qemu:qemu-native:qemu-system-native https://web.nvd.nist.gov/view/vuln/detail?vulnId=CVE-2021-20255 *
CVE-2022-0529 (CVSS3: 5.5 MEDIUM): unzip:unzip-native https://web.nvd.nist.gov/view/vuln/detail?vulnId=CVE-2022-0529 *
CVE-2022-0530 (CVSS3: 5.5 MEDIUM): unzip:unzip-native https://web.nvd.nist.gov/view/vuln/detail?vulnId=CVE-2022-0530 *
CVE-2022-1210 (CVSS3: 6.5 MEDIUM): tiff https://web.nvd.nist.gov/view/vuln/detail?vulnId=CVE-2022-1210 *
CVE-2022-29458 (CVSS3: 7.1 HIGH): ncurses:ncurses-native https://web.nvd.nist.gov/view/vuln/detail?vulnId=CVE-2022-29458 *
CVE-2022-29824 (CVSS3: 6.5 MEDIUM): libxslt:libxslt-native https://web.nvd.nist.gov/view/vuln/detail?vulnId=CVE-2022-29824 *


