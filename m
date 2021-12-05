Return-Path: <steve@sakoman.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 46B65C433EF
	for <webhook@archiver.kernel.org>; Sun,  5 Dec 2021 15:03:02 +0000 (UTC)
Received: from mail-pg1-f175.google.com (mail-pg1-f175.google.com
 [209.85.215.175])
 by mx.groups.io with SMTP id smtpd.web11.38418.1638716581009425581
 for <openembedded-core@lists.openembedded.org>;
 Sun, 05 Dec 2021 07:03:01 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@sakoman-com.20210112.gappssmtp.com header.s=20210112
 header.b=RFDHlRMm;
 spf=softfail (domain: sakoman.com, ip: 209.85.215.175,
 mailfrom: steve@sakoman.com)
Received: by mail-pg1-f175.google.com with SMTP id r5so8004678pgi.6
        for <openembedded-core@lists.openembedded.org>;
 Sun, 05 Dec 2021 07:03:00 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=sakoman-com.20210112.gappssmtp.com; s=20210112;
        h=subject:from:to:message-id:date;
        bh=ljtfn7Jd2UM6tq7CWiv4Wk1WD9JoOVAF/RcdxlOjU4E=;
        b=RFDHlRMms20ItCVzPDXRjAXwZC0DUpToqgmc58nyUL53GWsKlljfERFV4S5Fp7/RdM
         Sw3gm1iRK0uDE4sN8A376KIfArdr6YT11Pja+dx94XPkrAy7pwY5G90rycb0VvCg36L6
         0OlsuOyrdFQQRQAws5zCazGFGITDRRHRlEG/L3XP93bgPptvwFDovyI/5UX6qzfIALzJ
         P43dK0IBl0ZdfeeFB9jR8ijo8wW2QaMB447WZOeFZ9wHrkTVAhNpthFFWMErSZ1bf/qP
         +Xf9LQbOcAEoTbP3R1beCyxPMe3qB5coQMYj3oAwpWVA1SGcAL8cEwRZ0+nYHKEhgZOf
         dJQw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:subject:from:to:message-id:date;
        bh=ljtfn7Jd2UM6tq7CWiv4Wk1WD9JoOVAF/RcdxlOjU4E=;
        b=UYp1mSz+kMA4sGTc0TVd7oK2XzDrAEtLrg9oL2i5mWtKTOWdE+vtFIhlk9O6WjTLAa
         wTVEOvvEztRsXLw8/o99NOk6TfC+cxFbufkAijHe7o7TbpxVYkOIloFUTV2qmTgeplAH
         8pw4PAgBUZU+YJ7tkx1RxyQnXhcxluL8qmy2YXVinM5R+N8vSJIPwq+Cp/2WG3z6YtVw
         4ecItqRWu2pjrHnqJTNsRlMjUzKXgcleiDMFzUz6kk99mCjHtP8oe/3Oo6jDb0P8w5IC
         lgr1OF1CPduHjwCOUSu44IYcb98qaJ21V7ArxDtw4AjYiu8iCLRTAMZItxm3pVReiSor
         fylw==
X-Gm-Message-State: AOAM532V3M125/wjO3mIez7znSd4TKT9Qa26+XMU2WzRxtCYoePcBbiA
	9sxXbH/yqXu/dwRPyWl+O0oNDq7RFgCDU9bREwE=
X-Google-Smtp-Source: 
 ABdhPJzbOipRd2ltOCFguMudey08yD8ljMJG8/2130Yl6wjYNUZy2QeaWrRoP3DsJJirY1RYoTXeuw==
X-Received: by 2002:a63:6b83:: with SMTP id
 g125mr13906171pgc.578.1638716579886;
        Sun, 05 Dec 2021 07:02:59 -0800 (PST)
Received: from nuc.router0800d9.com (rrcs-66-91-142-162.west.biz.rr.com.
 [66.91.142.162])
        by smtp.gmail.com with ESMTPSA id
 j15sm9326562pfh.35.2021.12.05.07.02.57
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 05 Dec 2021 07:02:57 -0800 (PST)
Received: by nuc.router0800d9.com (Postfix, from userid 1000)
	id 725A79604A6; Sun,  5 Dec 2021 05:02:55 -1000 (HST)
Subject: OE-core CVE metrics for hardknott on Sun 05 Dec 2021 05:00:01 AM HST
FROM: steve@sakoman.com
To: 
 <openembedded-core@lists.openembedded.org>,<yocto-security@lists.yoctoproject.org>
X-Mailer: mail (GNU Mailutils 3.7)
Message-Id: <20211205150255.725A79604A6@nuc.router0800d9.com>
Date: Sun,  5 Dec 2021 05:02:55 -1000 (HST)
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Sun, 05 Dec 2021 15:03:02 -0000
X-Groupsio-URL: 
 https://lists.openembedded.org/g/openembedded-core/message/159195

Branch: hardknott

New this week: 2 CVEs
CVE-2021-3984: vim https://web.nvd.nist.gov/view/vuln/detail?vulnId=CVE-2021-3984 *
CVE-2021-4019: vim https://web.nvd.nist.gov/view/vuln/detail?vulnId=CVE-2021-4019 *

Removed this week: 5 CVEs
CVE-2021-38297: go https://web.nvd.nist.gov/view/vuln/detail?vulnId=CVE-2021-38297 *
CVE-2021-3968: vim https://web.nvd.nist.gov/view/vuln/detail?vulnId=CVE-2021-3968 *
CVE-2021-41771: go https://web.nvd.nist.gov/view/vuln/detail?vulnId=CVE-2021-41771 *
CVE-2021-41772: go https://web.nvd.nist.gov/view/vuln/detail?vulnId=CVE-2021-41772 *
CVE-2021-43618: gmp:gmp-native https://web.nvd.nist.gov/view/vuln/detail?vulnId=CVE-2021-43618 *

Full list:  Found 52 unpatched CVEs
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
CVE-2021-37322: gcc:gcc-cross-x86_64:gcc-runtime:gcc-sanitizers:gcc-source-10.2.0:libgcc:libgcc-initial https://web.nvd.nist.gov/view/vuln/detail?vulnId=CVE-2021-37322 *
CVE-2021-38604: glibc https://web.nvd.nist.gov/view/vuln/detail?vulnId=CVE-2021-38604 *
CVE-2021-3973: vim https://web.nvd.nist.gov/view/vuln/detail?vulnId=CVE-2021-3973 *
CVE-2021-3974: vim https://web.nvd.nist.gov/view/vuln/detail?vulnId=CVE-2021-3974 *
CVE-2021-3984: vim https://web.nvd.nist.gov/view/vuln/detail?vulnId=CVE-2021-3984 *
CVE-2021-4019: vim https://web.nvd.nist.gov/view/vuln/detail?vulnId=CVE-2021-4019 *
CVE-2021-40528: libgcrypt:libgcrypt-native https://web.nvd.nist.gov/view/vuln/detail?vulnId=CVE-2021-40528 *
CVE-2021-42373: busybox https://web.nvd.nist.gov/view/vuln/detail?vulnId=CVE-2021-42373 *
CVE-2021-42374: busybox https://web.nvd.nist.gov/view/vuln/detail?vulnId=CVE-2021-42374 *
CVE-2021-42375: busybox https://web.nvd.nist.gov/view/vuln/detail?vulnId=CVE-2021-42375 *
CVE-2021-42376: busybox https://web.nvd.nist.gov/view/vuln/detail?vulnId=CVE-2021-42376 *
CVE-2021-42377: busybox https://web.nvd.nist.gov/view/vuln/detail?vulnId=CVE-2021-42377 *
CVE-2021-42378: busybox https://web.nvd.nist.gov/view/vuln/detail?vulnId=CVE-2021-42378 *
CVE-2021-42379: busybox https://web.nvd.nist.gov/view/vuln/detail?vulnId=CVE-2021-42379 *
CVE-2021-42380: busybox https://web.nvd.nist.gov/view/vuln/detail?vulnId=CVE-2021-42380 *
CVE-2021-42381: busybox https://web.nvd.nist.gov/view/vuln/detail?vulnId=CVE-2021-42381 *
CVE-2021-42382: busybox https://web.nvd.nist.gov/view/vuln/detail?vulnId=CVE-2021-42382 *
CVE-2021-42383: busybox https://web.nvd.nist.gov/view/vuln/detail?vulnId=CVE-2021-42383 *
CVE-2021-42384: busybox https://web.nvd.nist.gov/view/vuln/detail?vulnId=CVE-2021-42384 *
CVE-2021-42385: busybox https://web.nvd.nist.gov/view/vuln/detail?vulnId=CVE-2021-42385 *
CVE-2021-42386: busybox https://web.nvd.nist.gov/view/vuln/detail?vulnId=CVE-2021-42386 *
CVE-2021-42762: webkitgtk https://web.nvd.nist.gov/view/vuln/detail?vulnId=CVE-2021-42762 *

