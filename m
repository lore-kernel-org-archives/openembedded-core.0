Return-Path: <steve@sakoman.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 3804BC433EF
	for <webhook@archiver.kernel.org>; Sun, 15 May 2022 13:33:40 +0000 (UTC)
Received: from mail-pj1-f44.google.com (mail-pj1-f44.google.com
 [209.85.216.44])
 by mx.groups.io with SMTP id smtpd.web09.16886.1652621616838864531
 for <openembedded-core@lists.openembedded.org>;
 Sun, 15 May 2022 06:33:37 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@sakoman-com.20210112.gappssmtp.com header.s=20210112
 header.b=FLMRbgUf;
 spf=softfail (domain: sakoman.com, ip: 209.85.216.44,
 mailfrom: steve@sakoman.com)
Received: by mail-pj1-f44.google.com with SMTP id
 o13-20020a17090a9f8d00b001df3fc52ea7so983774pjp.3
        for <openembedded-core@lists.openembedded.org>;
 Sun, 15 May 2022 06:33:36 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=sakoman-com.20210112.gappssmtp.com; s=20210112;
        h=subject:from:to:message-id:date;
        bh=4YBAyD4dyMheoGd5frFcmQ5Fde7tFnyR8SA9t9OdxDA=;
        b=FLMRbgUfohZCTVmLjDupHIsWwQpDu44I/sEPalj8dSIGMop5XZ9ERJb2Nh3C3htEZD
         mFfiiaWVLAK3gP5IAkOn8e7CwYPFYR4c+Il3tF+lQ1eJw4D+jPq4Dl6wFcCM++P/W+Dw
         52jlhVWpM8fpdbv1ZqBgKMd5DgQ0uv+4yG6SEGOtaWgZp6iQoKLyq43a9uda467N7CKI
         lOGJw/1PAlWYw6KNfENxqMMjqwL1Sa/0tWB7vqK6WF88jlk7leFyk7hY7p7H0wXh0hqV
         hEIUJkf7G303LeBQLmuoRZJBarn1p8xysda6aoZAyBvCs7VGG3vEB7KdDTJCKRTIs6Iy
         32TQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:subject:from:to:message-id:date;
        bh=4YBAyD4dyMheoGd5frFcmQ5Fde7tFnyR8SA9t9OdxDA=;
        b=7rKa4euREOFvC2bnZEYTcWpuSCZOFK2YJJojhXkFScjFnD9xKAW6X0AEqGF/+X2VVl
         1PlnFbrJE+9o1Evm8nT5E1nhHcW0qlf78cleb/y37sCg5LpkegN8DWh5WVRL6pjn6pG4
         HuZSYQMhH63o1EGxwPT0y1B48s/UD1Hn1s6NXhWaH4kANbbuOJx5Sy0TT/hXsVVthCaB
         joALSugPuHQO7i119i45BZxPK7QmM1L5wjiSBqqWI8dkBETdP9xszwSW9grD6w8TZphE
         gm3zl7AqsykhtRu1sVZB6GsuAONvUJ4/cdhKYV05flGoeSmcdZ+b8r0EySlxZ0BYtqCU
         5mGw==
X-Gm-Message-State: AOAM531hgK75vnu2va+3PZ7Ph+qCy+QE8Kc0tcv7VlDJPO88uFG/rr10
	0aJUm6rlv/B8sTexeBfqcea00hale2t6YpRC
X-Google-Smtp-Source: 
 ABdhPJzljiYJU39+vKRi9q1Dvj2utrxOtFz8uGgk4Z2HU2Fdb4nnRjR73Q5Z7VAYoJjr7kleiFYcjQ==
X-Received: by 2002:a17:90a:cc6:b0:1d2:9a04:d29e with SMTP id
 6-20020a17090a0cc600b001d29a04d29emr14452540pjt.136.1652621615709;
        Sun, 15 May 2022 06:33:35 -0700 (PDT)
Received: from nuc.router0800d9.com (rrcs-66-91-142-162.west.biz.rr.com.
 [66.91.142.162])
        by smtp.gmail.com with ESMTPSA id
 b10-20020a170902650a00b0015e8d4eb269sm5046578plk.179.2022.05.15.06.33.34
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 15 May 2022 06:33:34 -0700 (PDT)
Received: by nuc.router0800d9.com (Postfix, from userid 1000)
	id 93FAB9626BB; Sun, 15 May 2022 03:33:32 -1000 (HST)
Subject: OE-core CVE metrics for kirkstone on Sun 15 May 2022 03:30:01 AM HST
FROM: steve@sakoman.com
To: 
 <openembedded-core@lists.openembedded.org>,<yocto-security@lists.yoctoproject.org>
X-Mailer: mail (GNU Mailutils 3.7)
Message-Id: <20220515133332.93FAB9626BB@nuc.router0800d9.com>
Date: Sun, 15 May 2022 03:33:32 -1000 (HST)
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Sun, 15 May 2022 13:33:40 -0000
X-Groupsio-URL: 
 https://lists.openembedded.org/g/openembedded-core/message/165604

Branch: kirkstone

New this week: 5 CVEs
CVE-2021-4206 (CVSS3: 8.2 HIGH): qemu:qemu-native:qemu-system-native https://web.nvd.nist.gov/view/vuln/detail?vulnId=CVE-2021-4206 *
CVE-2021-4207 (CVSS3: 8.8 HIGH): qemu:qemu-native:qemu-system-native https://web.nvd.nist.gov/view/vuln/detail?vulnId=CVE-2021-4207 *
CVE-2022-29824 (CVSS3: 6.5 MEDIUM): libxml2:libxml2-native:libxslt:libxslt-native https://web.nvd.nist.gov/view/vuln/detail?vulnId=CVE-2022-29824 *
CVE-2022-30293 (CVSS3: 7.5 HIGH): webkitgtk https://web.nvd.nist.gov/view/vuln/detail?vulnId=CVE-2022-30293 *
CVE-2022-30294 (CVSS3: 9.8 CRITICAL): webkitgtk https://web.nvd.nist.gov/view/vuln/detail?vulnId=CVE-2022-30294 *

Removed this week: 0 CVEs

Full list:  Found 20 unpatched CVEs
CVE-2019-12067 (CVSS3: 6.5 MEDIUM): qemu:qemu-native:qemu-system-native https://web.nvd.nist.gov/view/vuln/detail?vulnId=CVE-2019-12067 *
CVE-2020-18974 (CVSS3: 3.3 LOW): nasm:nasm-native https://web.nvd.nist.gov/view/vuln/detail?vulnId=CVE-2020-18974 *
CVE-2021-20255 (CVSS3: 5.5 MEDIUM): qemu:qemu-native:qemu-system-native https://web.nvd.nist.gov/view/vuln/detail?vulnId=CVE-2021-20255 *
CVE-2021-4206 (CVSS3: 8.2 HIGH): qemu:qemu-native:qemu-system-native https://web.nvd.nist.gov/view/vuln/detail?vulnId=CVE-2021-4206 *
CVE-2021-4207 (CVSS3: 8.8 HIGH): qemu:qemu-native:qemu-system-native https://web.nvd.nist.gov/view/vuln/detail?vulnId=CVE-2021-4207 *
CVE-2022-0529 (CVSS3: 5.5 MEDIUM): unzip:unzip-native https://web.nvd.nist.gov/view/vuln/detail?vulnId=CVE-2022-0529 *
CVE-2022-0530 (CVSS3: 5.5 MEDIUM): unzip:unzip-native https://web.nvd.nist.gov/view/vuln/detail?vulnId=CVE-2022-0530 *
CVE-2022-1210 (CVSS3: 6.5 MEDIUM): tiff https://web.nvd.nist.gov/view/vuln/detail?vulnId=CVE-2022-1210 *
CVE-2022-1381 (CVSS3: 7.8 HIGH): vim https://web.nvd.nist.gov/view/vuln/detail?vulnId=CVE-2022-1381 *
CVE-2022-1420 (CVSS3: 5.5 MEDIUM): vim https://web.nvd.nist.gov/view/vuln/detail?vulnId=CVE-2022-1420 *
CVE-2022-24675 (CVSS3: 7.5 HIGH): go https://web.nvd.nist.gov/view/vuln/detail?vulnId=CVE-2022-24675 *
CVE-2022-27404 (CVSS3: 9.8 CRITICAL): freetype:freetype-native https://web.nvd.nist.gov/view/vuln/detail?vulnId=CVE-2022-27404 *
CVE-2022-27405 (CVSS3: 7.5 HIGH): freetype:freetype-native https://web.nvd.nist.gov/view/vuln/detail?vulnId=CVE-2022-27405 *
CVE-2022-27406 (CVSS3: 7.5 HIGH): freetype:freetype-native https://web.nvd.nist.gov/view/vuln/detail?vulnId=CVE-2022-27406 *
CVE-2022-28327 (CVSS3: 7.5 HIGH): go https://web.nvd.nist.gov/view/vuln/detail?vulnId=CVE-2022-28327 *
CVE-2022-29458 (CVSS3: 7.1 HIGH): ncurses:ncurses-native https://web.nvd.nist.gov/view/vuln/detail?vulnId=CVE-2022-29458 *
CVE-2022-29536 (CVSS3: 7.5 HIGH): epiphany https://web.nvd.nist.gov/view/vuln/detail?vulnId=CVE-2022-29536 *
CVE-2022-29824 (CVSS3: 6.5 MEDIUM): libxml2:libxml2-native:libxslt:libxslt-native https://web.nvd.nist.gov/view/vuln/detail?vulnId=CVE-2022-29824 *
CVE-2022-30293 (CVSS3: 7.5 HIGH): webkitgtk https://web.nvd.nist.gov/view/vuln/detail?vulnId=CVE-2022-30293 *
CVE-2022-30294 (CVSS3: 9.8 CRITICAL): webkitgtk https://web.nvd.nist.gov/view/vuln/detail?vulnId=CVE-2022-30294 *


