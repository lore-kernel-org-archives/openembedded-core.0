Return-Path: <steve@sakoman.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 05FB1C433EF
	for <webhook@archiver.kernel.org>; Sun, 13 Mar 2022 15:32:37 +0000 (UTC)
Received: from mail-pg1-f177.google.com (mail-pg1-f177.google.com
 [209.85.215.177])
 by mx.groups.io with SMTP id smtpd.web09.16083.1647185556182873929
 for <openembedded-core@lists.openembedded.org>;
 Sun, 13 Mar 2022 08:32:36 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@sakoman-com.20210112.gappssmtp.com header.s=20210112
 header.b=JDxttnst;
 spf=softfail (domain: sakoman.com, ip: 209.85.215.177,
 mailfrom: steve@sakoman.com)
Received: by mail-pg1-f177.google.com with SMTP id q19so11694131pgm.6
        for <openembedded-core@lists.openembedded.org>;
 Sun, 13 Mar 2022 08:32:36 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=sakoman-com.20210112.gappssmtp.com; s=20210112;
        h=subject:from:to:message-id:date;
        bh=5KLvlTRXUduKfPx00d7w/0By5imyEEz3Lp0tYxCqceQ=;
        b=JDxttnstuHXDJsmxQWDa0Qg7+M8UAiBPR0syJ6nqFvJcba0Ftw+AZP8AwA8LwSkJGL
         XIZ+4mwVWmhbUF4PWkp7BzdrnKpWARaU1ry+L4XIJ6AgOlFOBIDkohSt+WA4b8AevWPU
         j+19cZNuWB+ajLn4dmKFuI48lMMMknQsw/q+B8KlgRX0LnbJIe5Fo4TJU4DKfQM29qpW
         LRyc/cRVDqyj0VMpMQ/zdgrlxyPsgv485JFGVMNcnswEUzPg4Tx+D+A6CgfQDZifENZz
         7Uz7mOpXhfels7TJ1ZmVgl7bZ3cgs1hzkmULYj6GJm8GI7cNTJD86aI0fSbBMobD9AL+
         TmIg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:subject:from:to:message-id:date;
        bh=5KLvlTRXUduKfPx00d7w/0By5imyEEz3Lp0tYxCqceQ=;
        b=dB65YL7Vx9gFJ2lgPjosvFannRuBzAxu5AHERxO29vC+lVZmsw5SomBVSwMKVmOzRI
         NuMLBjyeenlBX2m0ObXhOnHnA89XML4mmQ8nQMBxM475R78OijxXdl6QELZvfja+wR1C
         k3yZMF0D0+3NgIYw+xrSS6JoDjCKnw/9kMyIxiQDlmmGMsP8N2aOIQzidFbAhEOb4BIc
         DBAfFbCXMIp98QpEDn5k4B3dV1inVHahY2/N7upn6fBHlbJcgAquiAZCoHFGwPwmFDrA
         nNVP8cDJC5Dn3NI5f/A5/EIpGU8rOHpVEbjOiRcWQPwUwHrbx6LDKaJIE6JVht0AFqbK
         nnrA==
X-Gm-Message-State: AOAM5331Ec16Cfnn7V/1HcqSvQzu/Qs7gwYMRZW6a1biJW2fnN7/M90e
	oflnkKGneZDXYM/Qt47EV6pLyMzFAFD9cOoTOA4=
X-Google-Smtp-Source: 
 ABdhPJx/dY28UTSPp+l5TpsMZx/cgIUXnNixSjbu+Scq3ASg4SWwCs0FDENylp7icBBv/j2A3SoSRw==
X-Received: by 2002:a63:8948:0:b0:37f:f087:9cac with SMTP id
 v69-20020a638948000000b0037ff0879cacmr16586538pgd.120.1647185555067;
        Sun, 13 Mar 2022 08:32:35 -0700 (PDT)
Received: from nuc.router0800d9.com (rrcs-66-91-142-162.west.biz.rr.com.
 [66.91.142.162])
        by smtp.gmail.com with ESMTPSA id
 2-20020a620502000000b004f6d2975cbesm16065765pff.116.2022.03.13.08.32.34
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 13 Mar 2022 08:32:34 -0700 (PDT)
Received: by nuc.router0800d9.com (Postfix, from userid 1000)
	id 3E5BA962B4E; Sun, 13 Mar 2022 05:32:32 -1000 (HST)
Subject: OE-core CVE metrics for honister on Sun 13 Mar 2022 05:30:01 AM HST
FROM: steve@sakoman.com
To: 
 <openembedded-core@lists.openembedded.org>,<yocto-security@lists.yoctoproject.org>
X-Mailer: mail (GNU Mailutils 3.7)
Message-Id: <20220313153232.3E5BA962B4E@nuc.router0800d9.com>
Date: Sun, 13 Mar 2022 05:32:32 -1000 (HST)
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Sun, 13 Mar 2022 15:32:37 -0000
X-Groupsio-URL: 
 https://lists.openembedded.org/g/openembedded-core/message/163112

Branch: honister

New this week: 3 CVEs
CVE-2022-0563: util-linux:util-linux-native https://web.nvd.nist.gov/view/vuln/detail?vulnId=CVE-2022-0563 *
CVE-2022-23308: libxml2:libxml2-native https://web.nvd.nist.gov/view/vuln/detail?vulnId=CVE-2022-23308 *
CVE-2022-24921: go https://web.nvd.nist.gov/view/vuln/detail?vulnId=CVE-2022-24921 *

Removed this week: 12 CVEs
CVE-2021-36976: libarchive:libarchive-native https://web.nvd.nist.gov/view/vuln/detail?vulnId=CVE-2021-36976 *
CVE-2021-41817: ruby:ruby-native https://web.nvd.nist.gov/view/vuln/detail?vulnId=CVE-2021-41817 *
CVE-2021-41819: ruby:ruby-native https://web.nvd.nist.gov/view/vuln/detail?vulnId=CVE-2021-41819 *
CVE-2021-44568: libsolv https://web.nvd.nist.gov/view/vuln/detail?vulnId=CVE-2021-44568 *
CVE-2021-44571: libsolv https://web.nvd.nist.gov/view/vuln/detail?vulnId=CVE-2021-44571 *
CVE-2021-44573: libsolv https://web.nvd.nist.gov/view/vuln/detail?vulnId=CVE-2021-44573 *
CVE-2021-44574: libsolv https://web.nvd.nist.gov/view/vuln/detail?vulnId=CVE-2021-44574 *
CVE-2021-44575: libsolv https://web.nvd.nist.gov/view/vuln/detail?vulnId=CVE-2021-44575 *
CVE-2021-44576: libsolv https://web.nvd.nist.gov/view/vuln/detail?vulnId=CVE-2021-44576 *
CVE-2021-44577: libsolv https://web.nvd.nist.gov/view/vuln/detail?vulnId=CVE-2021-44577 *
CVE-2021-45931: harfbuzz:harfbuzz-native https://web.nvd.nist.gov/view/vuln/detail?vulnId=CVE-2021-45931 *
CVE-2021-45949: ghostscript:ghostscript-native https://web.nvd.nist.gov/view/vuln/detail?vulnId=CVE-2021-45949 *

Full list:  Found 38 unpatched CVEs
CVE-2016-20012: openssh https://web.nvd.nist.gov/view/vuln/detail?vulnId=CVE-2016-20012 *
CVE-2019-12067: qemu:qemu-native:qemu-system-native https://web.nvd.nist.gov/view/vuln/detail?vulnId=CVE-2019-12067 *
CVE-2020-18974: nasm:nasm-native https://web.nvd.nist.gov/view/vuln/detail?vulnId=CVE-2020-18974 *
CVE-2020-35503: qemu:qemu-native:qemu-system-native https://web.nvd.nist.gov/view/vuln/detail?vulnId=CVE-2020-35503 *
CVE-2021-20255: qemu:qemu-native:qemu-system-native https://web.nvd.nist.gov/view/vuln/detail?vulnId=CVE-2021-20255 *
CVE-2021-31879: wget https://web.nvd.nist.gov/view/vuln/detail?vulnId=CVE-2021-31879 *
CVE-2021-3507: qemu:qemu-native:qemu-system-native https://web.nvd.nist.gov/view/vuln/detail?vulnId=CVE-2021-3507 *
CVE-2021-3607: qemu:qemu-native:qemu-system-native https://web.nvd.nist.gov/view/vuln/detail?vulnId=CVE-2021-3607 *
CVE-2021-3608: qemu:qemu-native:qemu-system-native https://web.nvd.nist.gov/view/vuln/detail?vulnId=CVE-2021-3608 *
CVE-2021-3713: qemu:qemu-native:qemu-system-native https://web.nvd.nist.gov/view/vuln/detail?vulnId=CVE-2021-3713 *
CVE-2021-3781: ghostscript:ghostscript-native https://web.nvd.nist.gov/view/vuln/detail?vulnId=CVE-2021-3781 *
CVE-2021-3930: qemu:qemu-native:qemu-system-native https://web.nvd.nist.gov/view/vuln/detail?vulnId=CVE-2021-3930 *
CVE-2021-3947: qemu:qemu-native:qemu-system-native https://web.nvd.nist.gov/view/vuln/detail?vulnId=CVE-2021-3947 *
CVE-2021-4145: qemu:qemu-native:qemu-system-native https://web.nvd.nist.gov/view/vuln/detail?vulnId=CVE-2021-4145 *
CVE-2021-4160: openssl:openssl-native https://web.nvd.nist.gov/view/vuln/detail?vulnId=CVE-2021-4160 *
CVE-2021-42762: webkitgtk https://web.nvd.nist.gov/view/vuln/detail?vulnId=CVE-2021-42762 *
CVE-2021-43400: bluez5 https://web.nvd.nist.gov/view/vuln/detail?vulnId=CVE-2021-43400 *
CVE-2021-45481: webkitgtk https://web.nvd.nist.gov/view/vuln/detail?vulnId=CVE-2021-45481 *
CVE-2021-45482: webkitgtk https://web.nvd.nist.gov/view/vuln/detail?vulnId=CVE-2021-45482 *
CVE-2021-45483: webkitgtk https://web.nvd.nist.gov/view/vuln/detail?vulnId=CVE-2021-45483 *
CVE-2022-0529: unzip:unzip-native https://web.nvd.nist.gov/view/vuln/detail?vulnId=CVE-2022-0529 *
CVE-2022-0530: unzip:unzip-native https://web.nvd.nist.gov/view/vuln/detail?vulnId=CVE-2022-0530 *
CVE-2022-0563: util-linux:util-linux-native https://web.nvd.nist.gov/view/vuln/detail?vulnId=CVE-2022-0563 *
CVE-2022-0696: vim https://web.nvd.nist.gov/view/vuln/detail?vulnId=CVE-2022-0696 *
CVE-2022-0714: vim https://web.nvd.nist.gov/view/vuln/detail?vulnId=CVE-2022-0714 *
CVE-2022-0729: vim https://web.nvd.nist.gov/view/vuln/detail?vulnId=CVE-2022-0729 *
CVE-2022-21658: rust-native https://web.nvd.nist.gov/view/vuln/detail?vulnId=CVE-2022-21658 *
CVE-2022-23096: connman https://web.nvd.nist.gov/view/vuln/detail?vulnId=CVE-2022-23096 *
CVE-2022-23097: connman https://web.nvd.nist.gov/view/vuln/detail?vulnId=CVE-2022-23097 *
CVE-2022-23098: connman https://web.nvd.nist.gov/view/vuln/detail?vulnId=CVE-2022-23098 *
CVE-2022-23303: wpa-supplicant https://web.nvd.nist.gov/view/vuln/detail?vulnId=CVE-2022-23303 *
CVE-2022-23304: wpa-supplicant https://web.nvd.nist.gov/view/vuln/detail?vulnId=CVE-2022-23304 *
CVE-2022-23308: libxml2:libxml2-native https://web.nvd.nist.gov/view/vuln/detail?vulnId=CVE-2022-23308 *
CVE-2022-23772: go https://web.nvd.nist.gov/view/vuln/detail?vulnId=CVE-2022-23772 *
CVE-2022-23773: go https://web.nvd.nist.gov/view/vuln/detail?vulnId=CVE-2022-23773 *
CVE-2022-23806: go https://web.nvd.nist.gov/view/vuln/detail?vulnId=CVE-2022-23806 *
CVE-2022-24921: go https://web.nvd.nist.gov/view/vuln/detail?vulnId=CVE-2022-24921 *
CVE-2022-24975: git https://web.nvd.nist.gov/view/vuln/detail?vulnId=CVE-2022-24975 *

