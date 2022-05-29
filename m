Return-Path: <steve@sakoman.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 2552DC433EF
	for <webhook@archiver.kernel.org>; Sun, 29 May 2022 12:02:43 +0000 (UTC)
Received: from mail-pg1-f169.google.com (mail-pg1-f169.google.com
 [209.85.215.169])
 by mx.groups.io with SMTP id smtpd.web08.24428.1653825757760522403
 for <openembedded-core@lists.openembedded.org>;
 Sun, 29 May 2022 05:02:38 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@sakoman-com.20210112.gappssmtp.com header.s=20210112
 header.b=WujGOuIA;
 spf=softfail (domain: sakoman.com, ip: 209.85.215.169,
 mailfrom: steve@sakoman.com)
Received: by mail-pg1-f169.google.com with SMTP id e66so7797613pgc.8
        for <openembedded-core@lists.openembedded.org>;
 Sun, 29 May 2022 05:02:37 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=sakoman-com.20210112.gappssmtp.com; s=20210112;
        h=subject:from:to:message-id:date;
        bh=7GWAMIyVD0AVRxeUjC97Y5EeA4OfANbvG02sdFotz7w=;
        b=WujGOuIA1eKEYym9+ZSoIQVaCJucMzic67hkqJn5IcaBLq4JW3cklipdyMCpjZTD8D
         eiYhk16WcMuJ2vF6zwhiv55qSUJcLxz1gzKckN1fvAnJIATGjjd46x2MgCTuWDS4GkzK
         IsX1Dh2z7UN9XxItVtChZA1DTc5jseyO7SGhx3nALKF6X7paIQa4adngXdHpEWRp4vaq
         K3SZwAv5yLi/vDCJO8obvkbMLZJYmOAphSXoIPARG7Fo54JhOElR8D2IJUp9JWeQF8XR
         2sCV1PLdFNsCDrUIKCb4silt7vV/1+zsBljJIMoEPB5rBTKljYRH/1DTUbA5SbBZMrlC
         ZC6A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:subject:from:to:message-id:date;
        bh=7GWAMIyVD0AVRxeUjC97Y5EeA4OfANbvG02sdFotz7w=;
        b=kt3biC/bl8kfwhfZGgi0P7cgHhL3kemtl3cXvwGQG3IQmkiZPOA8xcb9Dr8LcxxINB
         OA6AiiA+I5JRQbiHUmYImRHWq5qrjfsOYvTVaFxvPz9YuCy/LuhKqiyAXWUC49XCi6cv
         bndKs6cpItTFv0Ravm51/CI4d7o01KDpZY3sIWv2OUykmk3/9p++0Sg/kfJSEN5V0ndo
         iYjlkJbB5dCcjLThAVH2y/aED1WmYv4ARQim6oDAPg8E7LLK5gm7GTb78vzOVQIjhNd2
         V2kbYMKbC+JGmYNNoEAe09kyvMQ+oRcbxiQKsy9Vq5FmA8l+8+Q+gu4/xyNW+1vkZ3l2
         kHbw==
X-Gm-Message-State: AOAM5318riECXGWVE8R9ZWQuxubqPg3n0JcosETWekEtlGXUpUwiP6Co
	G9iy7M2q+WfmBR15HW6pRrjZwVh9Cs4ThRP2
X-Google-Smtp-Source: 
 ABdhPJzgYHqFJ+D9lzoHdpAfGZs+p3CQdPtvX+js23WePWIXl3purP6UOUhA0/qxOKO0/p7hBzKmjA==
X-Received: by 2002:a05:6a00:2408:b0:4f7:a8cb:9b63 with SMTP id
 z8-20020a056a00240800b004f7a8cb9b63mr53029738pfh.33.1653825756055;
        Sun, 29 May 2022 05:02:36 -0700 (PDT)
Received: from nuc.router0800d9.com (rrcs-66-91-142-162.west.biz.rr.com.
 [66.91.142.162])
        by smtp.gmail.com with ESMTPSA id
 c1-20020a63ef41000000b003c14af505f8sm6515839pgk.16.2022.05.29.05.02.34
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 29 May 2022 05:02:34 -0700 (PDT)
Received: by nuc.router0800d9.com (Postfix, from userid 1000)
	id DC8419626F3; Sun, 29 May 2022 02:02:32 -1000 (HST)
Subject: OE-core CVE metrics for master on Sun 29 May 2022 02:00:01 AM HST
FROM: steve@sakoman.com
To: 
 <openembedded-core@lists.openembedded.org>,<yocto-security@lists.yoctoproject.org>
X-Mailer: mail (GNU Mailutils 3.7)
Message-Id: <20220529120232.DC8419626F3@nuc.router0800d9.com>
Date: Sun, 29 May 2022 02:02:32 -1000 (HST)
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Sun, 29 May 2022 12:02:43 -0000
X-Groupsio-URL: 
 https://lists.openembedded.org/g/openembedded-core/message/166234

Branch: master

New this week: 0 CVEs

Removed this week: 6 CVEs
CVE-2022-1210 (CVSS3: 6.5 MEDIUM): tiff https://web.nvd.nist.gov/view/vuln/detail?vulnId=CVE-2022-1210 *
CVE-2022-1621 (CVSS3: 7.8 HIGH): vim https://web.nvd.nist.gov/view/vuln/detail?vulnId=CVE-2022-1621 *
CVE-2022-1622 (CVSS3: 5.5 MEDIUM): tiff https://web.nvd.nist.gov/view/vuln/detail?vulnId=CVE-2022-1622 *
CVE-2022-1623 (CVSS3: 5.5 MEDIUM): tiff https://web.nvd.nist.gov/view/vuln/detail?vulnId=CVE-2022-1623 *
CVE-2022-1629 (CVSS3: 7.8 HIGH): vim https://web.nvd.nist.gov/view/vuln/detail?vulnId=CVE-2022-1629 *
CVE-2022-29824 (CVSS3: 6.5 MEDIUM): libxslt:libxslt-native https://web.nvd.nist.gov/view/vuln/detail?vulnId=CVE-2022-29824 *

Full list:  Found 6 unpatched CVEs
CVE-2019-12067 (CVSS3: 6.5 MEDIUM): qemu:qemu-native:qemu-system-native https://web.nvd.nist.gov/view/vuln/detail?vulnId=CVE-2019-12067 *
CVE-2020-18974 (CVSS3: 3.3 LOW): nasm:nasm-native https://web.nvd.nist.gov/view/vuln/detail?vulnId=CVE-2020-18974 *
CVE-2021-20255 (CVSS3: 5.5 MEDIUM): qemu:qemu-native:qemu-system-native https://web.nvd.nist.gov/view/vuln/detail?vulnId=CVE-2021-20255 *
CVE-2022-0529 (CVSS3: 5.5 MEDIUM): unzip:unzip-native https://web.nvd.nist.gov/view/vuln/detail?vulnId=CVE-2022-0529 *
CVE-2022-0530 (CVSS3: 5.5 MEDIUM): unzip:unzip-native https://web.nvd.nist.gov/view/vuln/detail?vulnId=CVE-2022-0530 *
CVE-2022-29458 (CVSS3: 7.1 HIGH): ncurses:ncurses-native https://web.nvd.nist.gov/view/vuln/detail?vulnId=CVE-2022-29458 *


