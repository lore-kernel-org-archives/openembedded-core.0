Return-Path: <steve@sakoman.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 879E9C433F5
	for <webhook@archiver.kernel.org>; Sun, 31 Oct 2021 15:02:53 +0000 (UTC)
Received: from mail-oi1-f174.google.com (mail-oi1-f174.google.com
 [209.85.167.174])
 by mx.groups.io with SMTP id smtpd.web08.32159.1635692572092997634
 for <openembedded-core@lists.openembedded.org>;
 Sun, 31 Oct 2021 08:02:52 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@sakoman-com.20210112.gappssmtp.com header.s=20210112
 header.b=WHcOBUAM;
 spf=softfail (domain: sakoman.com, ip: 209.85.167.174,
 mailfrom: steve@sakoman.com)
Received: by mail-oi1-f174.google.com with SMTP id n11so13141673oig.6
        for <openembedded-core@lists.openembedded.org>;
 Sun, 31 Oct 2021 08:02:52 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=sakoman-com.20210112.gappssmtp.com; s=20210112;
        h=subject:from:to:message-id:date;
        bh=9iu0iZE+zmxrBrf15ymLYW+8NNiqSQ7DsEjF//i2V/8=;
        b=WHcOBUAMnPNNCcYCf2rHoAGv6bQgrGmj23kU7FCixMfZOt66gRcmPP2fvmNu/hXBN6
         rxV9vPZYiSjxwwEgtZsVnzccf2lrg5XLhU4RJL0t04qTaE2Ie1VO7ye+X9vfNGByBNGi
         F7PGFO5HXjRKcSmi1zDYA6zaCUlGu1n+sfww50LYicPdn6I78EuhhQeP9jfVZZ81n7wV
         cUMYc3qj29/i17X3L4YQlSPraKAGkJKyOUrYzxJ7ZedaeUdCioDoQ/m77vf2SVtXSqlm
         L8l+quLAKB6o24bcBHm/tXL2Hg0GGOjv//3QeridXdgkj5EJC4WNyUyo8GY7BCpGXz7E
         Rtfw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:subject:from:to:message-id:date;
        bh=9iu0iZE+zmxrBrf15ymLYW+8NNiqSQ7DsEjF//i2V/8=;
        b=0j9wtCPF3kQs2mDp4WFsTR4f6BxQmWs02k2DQJyRS+DzNheUkwtzpf0OvNlm4HtF2a
         l/QOFSFP+Md3W3fCO2zK3aReHiKphJLsr6IPpV65CrSySaQaxS1zpD/4ma5EuZ18x4Sm
         7xzZT8tejtVt1icS1dNhwhpgC/KtT8iL2GEVjZoUuNkpEFV8rL0cXfxR5Jtn/u13kMKD
         pEdJ3V/tsHaTacc7NafmNM1kOpNkw1fW3Keby6WjqEj6I6QzAXK3qW1O3+lSPydLH1v3
         kuEFKt/gJ8iQ5y1Rt1Iddh6UZd3K5BwKHYcDOq0yHUuNj+LKmrg78Y0jf7zSt7X0mgCU
         dy6A==
X-Gm-Message-State: AOAM533MveRZ83/vuwEELAibBu3xv6DJkSbrzJlPrVndf875yejFKL7K
	7JzjVRA/9UuMRZ3I5XQ2CzX9L0/Gd5G+0hzKrms=
X-Google-Smtp-Source: 
 ABdhPJyCFnNG76CuANHrjGNAkNhltcG4QoJO2WNdEwSbZqM1EOqL8PPwCpH7ZVTcaNEVGPxIawY2aA==
X-Received: by 2002:a05:6808:30a3:: with SMTP id
 bl35mr4867214oib.77.1635692570906;
        Sun, 31 Oct 2021 08:02:50 -0700 (PDT)
Received: from nuc.router0800d9.com (rrcs-66-91-142-162.west.biz.rr.com.
 [66.91.142.162])
        by smtp.gmail.com with ESMTPSA id
 j7sm3210669oon.13.2021.10.31.08.02.50
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 31 Oct 2021 08:02:50 -0700 (PDT)
Received: by nuc.router0800d9.com (Postfix, from userid 1000)
	id 50A78960464; Sun, 31 Oct 2021 05:02:48 -1000 (HST)
Subject: OE-core CVE metrics for hardknott on Sun 31 Oct 2021 05:00:01 AM HST
FROM: steve@sakoman.com
To: 
 <openembedded-core@lists.openembedded.org>,<yocto-security@lists.yoctoproject.org>
X-Mailer: mail (GNU Mailutils 3.7)
Message-Id: <20211031150248.50A78960464@nuc.router0800d9.com>
Date: Sun, 31 Oct 2021 05:02:48 -1000 (HST)
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Sun, 31 Oct 2021 15:02:53 -0000
X-Groupsio-URL: 
 https://lists.openembedded.org/g/openembedded-core/message/157655

Branch: hardknott

New this week: 4 CVEs
CVE-2021-27645: glibc https://web.nvd.nist.gov/view/vuln/detail?vulnId=CVE-2021-27645 *
CVE-2021-33574: glibc https://web.nvd.nist.gov/view/vuln/detail?vulnId=CVE-2021-33574 *
CVE-2021-38604: glibc https://web.nvd.nist.gov/view/vuln/detail?vulnId=CVE-2021-38604 *
CVE-2021-42762: webkitgtk https://web.nvd.nist.gov/view/vuln/detail?vulnId=CVE-2021-42762 *

Removed this week: 1 CVEs
CVE-2021-39537: ncurses:ncurses-native https://web.nvd.nist.gov/view/vuln/detail?vulnId=CVE-2021-39537 *

Full list:  Found 38 unpatched CVEs
CVE-2013-0340: expat:expat-native https://web.nvd.nist.gov/view/vuln/detail?vulnId=CVE-2013-0340 *
CVE-2016-20012: openssh https://web.nvd.nist.gov/view/vuln/detail?vulnId=CVE-2016-20012 *
CVE-2019-12067: qemu:qemu-native:qemu-system-native https://web.nvd.nist.gov/view/vuln/detail?vulnId=CVE-2019-12067 *
CVE-2020-18974: nasm:nasm-native https://web.nvd.nist.gov/view/vuln/detail?vulnId=CVE-2020-18974 *
CVE-2020-29623: webkitgtk https://web.nvd.nist.gov/view/vuln/detail?vulnId=CVE-2020-29623 *
CVE-2020-35503: qemu:qemu-native:qemu-system-native https://web.nvd.nist.gov/view/vuln/detail?vulnId=CVE-2020-35503 *
CVE-2021-1765: webkitgtk https://web.nvd.nist.gov/view/vuln/detail?vulnId=CVE-2021-1765 *
CVE-2021-1789: webkitgtk https://web.nvd.nist.gov/view/vuln/detail?vulnId=CVE-2021-1789 *
CVE-2021-1799: webkitgtk https://web.nvd.nist.gov/view/vuln/detail?vulnId=CVE-2021-1799 *
CVE-2021-1801: webkitgtk https://web.nvd.nist.gov/view/vuln/detail?vulnId=CVE-2021-1801 *
CVE-2021-1870: webkitgtk https://web.nvd.nist.gov/view/vuln/detail?vulnId=CVE-2021-1870 *
CVE-2021-20196: qemu:qemu-native:qemu-system-native https://web.nvd.nist.gov/view/vuln/detail?vulnId=CVE-2021-20196 *
CVE-2021-20255: qemu:qemu-native:qemu-system-native https://web.nvd.nist.gov/view/vuln/detail?vulnId=CVE-2021-20255 *
CVE-2021-22922: curl:curl-native https://web.nvd.nist.gov/view/vuln/detail?vulnId=CVE-2021-22922 *
CVE-2021-22923: curl:curl-native https://web.nvd.nist.gov/view/vuln/detail?vulnId=CVE-2021-22923 *
CVE-2021-22945: curl:curl-native https://web.nvd.nist.gov/view/vuln/detail?vulnId=CVE-2021-22945 *
CVE-2021-22946: curl:curl-native https://web.nvd.nist.gov/view/vuln/detail?vulnId=CVE-2021-22946 *
CVE-2021-22947: curl:curl-native https://web.nvd.nist.gov/view/vuln/detail?vulnId=CVE-2021-22947 *
CVE-2021-27645: glibc https://web.nvd.nist.gov/view/vuln/detail?vulnId=CVE-2021-27645 *
CVE-2021-31879: wget https://web.nvd.nist.gov/view/vuln/detail?vulnId=CVE-2021-31879 *
CVE-2021-33574: glibc https://web.nvd.nist.gov/view/vuln/detail?vulnId=CVE-2021-33574 *
CVE-2021-33833: connman https://web.nvd.nist.gov/view/vuln/detail?vulnId=CVE-2021-33833 *
CVE-2021-33928: libsolv https://web.nvd.nist.gov/view/vuln/detail?vulnId=CVE-2021-33928 *
CVE-2021-33929: libsolv https://web.nvd.nist.gov/view/vuln/detail?vulnId=CVE-2021-33929 *
CVE-2021-33930: libsolv https://web.nvd.nist.gov/view/vuln/detail?vulnId=CVE-2021-33930 *
CVE-2021-33938: libsolv https://web.nvd.nist.gov/view/vuln/detail?vulnId=CVE-2021-33938 *
CVE-2021-3445: libdnf https://web.nvd.nist.gov/view/vuln/detail?vulnId=CVE-2021-3445 *
CVE-2021-3507: qemu:qemu-native:qemu-system-native https://web.nvd.nist.gov/view/vuln/detail?vulnId=CVE-2021-3507 *
CVE-2021-36976: libarchive https://web.nvd.nist.gov/view/vuln/detail?vulnId=CVE-2021-36976 *
CVE-2021-3713: qemu:qemu-native:qemu-system-native https://web.nvd.nist.gov/view/vuln/detail?vulnId=CVE-2021-3713 *
CVE-2021-38297: go https://web.nvd.nist.gov/view/vuln/detail?vulnId=CVE-2021-38297 *
CVE-2021-38604: glibc https://web.nvd.nist.gov/view/vuln/detail?vulnId=CVE-2021-38604 *
CVE-2021-3872: vim https://web.nvd.nist.gov/view/vuln/detail?vulnId=CVE-2021-3872 *
CVE-2021-3875: vim https://web.nvd.nist.gov/view/vuln/detail?vulnId=CVE-2021-3875 *
CVE-2021-40491: inetutils https://web.nvd.nist.gov/view/vuln/detail?vulnId=CVE-2021-40491 *
CVE-2021-40528: libgcrypt:libgcrypt-native https://web.nvd.nist.gov/view/vuln/detail?vulnId=CVE-2021-40528 *
CVE-2021-41617: openssh https://web.nvd.nist.gov/view/vuln/detail?vulnId=CVE-2021-41617 *
CVE-2021-42762: webkitgtk https://web.nvd.nist.gov/view/vuln/detail?vulnId=CVE-2021-42762 *

