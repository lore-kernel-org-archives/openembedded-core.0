Return-Path: <steve@sakoman.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 6250EC433F5
	for <webhook@archiver.kernel.org>; Sun,  1 May 2022 12:02:27 +0000 (UTC)
Received: from mail-pj1-f46.google.com (mail-pj1-f46.google.com
 [209.85.216.46])
 by mx.groups.io with SMTP id smtpd.web12.33122.1651406543976311279
 for <openembedded-core@lists.openembedded.org>;
 Sun, 01 May 2022 05:02:24 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@sakoman-com.20210112.gappssmtp.com header.s=20210112
 header.b=Mr5OPIuF;
 spf=softfail (domain: sakoman.com, ip: 209.85.216.46,
 mailfrom: steve@sakoman.com)
Received: by mail-pj1-f46.google.com with SMTP id
 m14-20020a17090a34ce00b001d5fe250e23so10790527pjf.3
        for <openembedded-core@lists.openembedded.org>;
 Sun, 01 May 2022 05:02:23 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=sakoman-com.20210112.gappssmtp.com; s=20210112;
        h=subject:from:to:message-id:date;
        bh=xto0ORfY7rmdGg/+MryxS/JQNTWmVh32uNw3rrfhwxg=;
        b=Mr5OPIuFm59KaFCrvx561IotisPT9Qbi+kVkUWSHg4XqJEKoqgoWZDnqUOECttUy/9
         tI4vGEe3i0INzfd0Eg0tk5/7pyQzOM4cZ/6EGUnec5Uje4Gnyd0abYZeUKIhxnQkzF23
         S/LPiLZ/OVTyuqG9awiZkT86CJxH0pL+sJbmevhtYxbsXf1NVyA7LyHa/Bbf2aGqhqbG
         dYWZT4XcaIX2MJJ4ceGm2AWlGea8q/4viOIlfJG1KKTIXCAJbnphzWt6FPFYYKqBLam4
         Baa+LEhk/GlBwjz8BO9Ppr34bvd3AR720S2xZFLngJYpFl20b4bQ7+Dmbu875atz23iq
         djQg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:subject:from:to:message-id:date;
        bh=xto0ORfY7rmdGg/+MryxS/JQNTWmVh32uNw3rrfhwxg=;
        b=w4ot3pfY0hFP4dkNiFjB1qBDiKmGO6d2yLLBxm2BAGXBpfSWal4U/OGwZOw2TzD54r
         vd0/i3EJkCrRVGE524fk1SUJ77qo05WDoHdKvCgotdCNkrLirI1sDE+RiXTdN7v5fNiY
         kBJyY5m9+Q+U1OXVeet8jskYxbOy2OiaHBunaRboRaI2o/nHAePaHntEKghipFYVkbaO
         kHt5lif0v4jmCr/v+h0vDqmOi/5DqpRk8pHp7sWwMaxW3GUOE/ImlfPm+pt+nHcuFV4i
         +Q0N1dTfSM+4TMgmLcmE+9WhcFuslL4VHZeZsk7U/SpjlfjMjQ8Km4GLw6tEx7byhLin
         3rGQ==
X-Gm-Message-State: AOAM5319WVKQW0FSk0gda7JrM7wV8XxarRNmt91vrLopPkv7R+eV9oSV
	ytGqgOeRAnATosYA+zVfxYhTrZUc2dd1FGqRWuA=
X-Google-Smtp-Source: 
 ABdhPJw3/5lZ6IMxY/yv0In1C2pap2Amn/oLDX1tbUxBvqeAtUCoHSn6COo2UGJKofjFiQJWomWNtQ==
X-Received: by 2002:a17:90a:4d04:b0:1d9:3f18:f4dd with SMTP id
 c4-20020a17090a4d0400b001d93f18f4ddmr8013127pjg.111.1651406542381;
        Sun, 01 May 2022 05:02:22 -0700 (PDT)
Received: from nuc.router0800d9.com (rrcs-66-91-142-162.west.biz.rr.com.
 [66.91.142.162])
        by smtp.gmail.com with ESMTPSA id
 w1-20020a17090a6b8100b001d9927ef1desm17626704pjj.34.2022.05.01.05.02.21
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 01 May 2022 05:02:21 -0700 (PDT)
Received: by nuc.router0800d9.com (Postfix, from userid 1000)
	id 9A935962709; Sun,  1 May 2022 02:02:19 -1000 (HST)
Subject: OE-core CVE metrics for master on Sun 01 May 2022 02:00:01 AM HST
FROM: steve@sakoman.com
To: 
 <openembedded-core@lists.openembedded.org>,<yocto-security@lists.yoctoproject.org>
X-Mailer: mail (GNU Mailutils 3.7)
Message-Id: <20220501120219.9A935962709@nuc.router0800d9.com>
Date: Sun,  1 May 2022 02:02:19 -1000 (HST)
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Sun, 01 May 2022 12:02:27 -0000
X-Groupsio-URL: 
 https://lists.openembedded.org/g/openembedded-core/message/165077

Branch: master

New this week: 3 CVEs
CVE-2022-1381 (CVSS3: 7.8 HIGH): vim https://web.nvd.nist.gov/view/vuln/detail?vulnId=CVE-2022-1381 *
CVE-2022-1420 (CVSS3: 5.5 MEDIUM): vim https://web.nvd.nist.gov/view/vuln/detail?vulnId=CVE-2022-1420 *
CVE-2022-29458 (CVSS3: 7.1 HIGH): ncurses:ncurses-native https://web.nvd.nist.gov/view/vuln/detail?vulnId=CVE-2022-29458 *

Removed this week: 4 CVEs
CVE-2015-20107 (CVSS3: 9.8 CRITICAL): python3:python3-native https://web.nvd.nist.gov/view/vuln/detail?vulnId=CVE-2015-20107 *
CVE-2021-28544 (CVSS3: 4.3 MEDIUM): subversion https://web.nvd.nist.gov/view/vuln/detail?vulnId=CVE-2021-28544 *
CVE-2022-1304 (CVSS3: 7.8 HIGH): e2fsprogs:e2fsprogs-native https://web.nvd.nist.gov/view/vuln/detail?vulnId=CVE-2022-1304 *
CVE-2022-24070 (CVSS3: 7.5 HIGH): subversion https://web.nvd.nist.gov/view/vuln/detail?vulnId=CVE-2022-24070 *

Full list:  Found 9 unpatched CVEs
CVE-2019-12067 (CVSS3: 6.5 MEDIUM): qemu:qemu-native:qemu-system-native https://web.nvd.nist.gov/view/vuln/detail?vulnId=CVE-2019-12067 *
CVE-2020-18974 (CVSS3: 3.3 LOW): nasm:nasm-native https://web.nvd.nist.gov/view/vuln/detail?vulnId=CVE-2020-18974 *
CVE-2021-20255 (CVSS3: 5.5 MEDIUM): qemu:qemu-native:qemu-system-native https://web.nvd.nist.gov/view/vuln/detail?vulnId=CVE-2021-20255 *
CVE-2022-0529 (CVSS3: 7.8 HIGH): unzip:unzip-native https://web.nvd.nist.gov/view/vuln/detail?vulnId=CVE-2022-0529 *
CVE-2022-0530 (CVSS3: 7.8 HIGH): unzip:unzip-native https://web.nvd.nist.gov/view/vuln/detail?vulnId=CVE-2022-0530 *
CVE-2022-1210 (CVSS3: 6.5 MEDIUM): tiff https://web.nvd.nist.gov/view/vuln/detail?vulnId=CVE-2022-1210 *
CVE-2022-1381 (CVSS3: 7.8 HIGH): vim https://web.nvd.nist.gov/view/vuln/detail?vulnId=CVE-2022-1381 *
CVE-2022-1420 (CVSS3: 5.5 MEDIUM): vim https://web.nvd.nist.gov/view/vuln/detail?vulnId=CVE-2022-1420 *
CVE-2022-29458 (CVSS3: 7.1 HIGH): ncurses:ncurses-native https://web.nvd.nist.gov/view/vuln/detail?vulnId=CVE-2022-29458 *


