Return-Path: <steve@sakoman.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id C2A4FC433F5
	for <webhook@archiver.kernel.org>; Sun, 12 Dec 2021 15:02:18 +0000 (UTC)
Received: from mail-pf1-f171.google.com (mail-pf1-f171.google.com
 [209.85.210.171])
 by mx.groups.io with SMTP id smtpd.web10.35066.1639321338135299734
 for <openembedded-core@lists.openembedded.org>;
 Sun, 12 Dec 2021 07:02:18 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@sakoman-com.20210112.gappssmtp.com header.s=20210112
 header.b=cQVnH//9;
 spf=softfail (domain: sakoman.com, ip: 209.85.210.171,
 mailfrom: steve@sakoman.com)
Received: by mail-pf1-f171.google.com with SMTP id n26so12822968pff.3
        for <openembedded-core@lists.openembedded.org>;
 Sun, 12 Dec 2021 07:02:18 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=sakoman-com.20210112.gappssmtp.com; s=20210112;
        h=subject:from:to:message-id:date;
        bh=q6o5JHm9wcKaTiVU29pkXAioyi9fYqBTFaqAT/XHMEw=;
        b=cQVnH//9a/YtfFuAFPEF+bV589zMdrGNPkWxuRgTqvWzmNaD+yOF4iX2B4Svchbgcb
         crJ7Pj4464umQPlNZIyBbqAA77Xwa+kl3EaoR0eQcdMO/PAxbU3/JkYYJ0bUin38Zpgj
         kAc/OGWKbBZGyyhgEPxPJszhcSr0P+8kwasa2ZXDEXgTab/QItVQq2Fzo7MvvhA5a4rC
         hJLy33KbMajJVRiLjNnYMVmRetKC/kliO0Co87gIpy7k2RK95o+oab2MWaovtKz8GZBi
         W9jpGuFZJ6shBzbI+Jv0RQ3aVfjvW4odLN6ep2kgCpySiPwKoEdPKim5wNaJgmvFo9pj
         Y9yw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:subject:from:to:message-id:date;
        bh=q6o5JHm9wcKaTiVU29pkXAioyi9fYqBTFaqAT/XHMEw=;
        b=kSBbObQ76TsrSSv2JOqFeHk7XaooML1kOxGlwAn+WMJPVy1wK944N01cyrFp531ZOd
         48Wef5MmWdMLtuG7zy4mhrFCi3N06qpwAqi6j+IabHYO/VGOY5rksmTaOKfO7ha3keym
         aquXVZeKY6vhVb6EJ5SDslGlawmMf7R6oG/tN1MPJwiZMjA4BRKk3F6rH10/ZXG8o44O
         sZgK2QrM6Zj7EkRflghslbNkto6rYIefusGzGGMbyeqMyGESJc3963YHgK6EFEHPm4Wg
         lViltqkK1oVoGcyFRng7UcS2fWIzebGcF2eIGABmxNSPax9XCxTjfZnatuu+W8SdTbdT
         GHvg==
X-Gm-Message-State: AOAM533MigRv6Lf+jBbQmamvbyyrrsndCB97EcBd4YV0v7HxLRzuK/zB
	BIWYxgPVKXQQdp8SOj46HDTturYMQ57VdTMT
X-Google-Smtp-Source: 
 ABdhPJznxy6szPECcXoSFl7tnRKNYtFYCpqeU1sAf2DQA1UDbZ9onElbdN59Zbt8+ZI1/ZTWsOltNQ==
X-Received: by 2002:a62:9109:0:b0:4aa:fc4d:9c1f with SMTP id
 l9-20020a629109000000b004aafc4d9c1fmr28827902pfe.34.1639321337037;
        Sun, 12 Dec 2021 07:02:17 -0800 (PST)
Received: from nuc.router0800d9.com (rrcs-66-91-142-162.west.biz.rr.com.
 [66.91.142.162])
        by smtp.gmail.com with ESMTPSA id
 hk18sm4451134pjb.20.2021.12.12.07.02.16
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 12 Dec 2021 07:02:16 -0800 (PST)
Received: by nuc.router0800d9.com (Postfix, from userid 1000)
	id 67E0C962CA0; Sun, 12 Dec 2021 05:02:14 -1000 (HST)
Subject: OE-core CVE metrics for hardknott on Sun 12 Dec 2021 05:00:01 AM HST
FROM: steve@sakoman.com
To: 
 <openembedded-core@lists.openembedded.org>,<yocto-security@lists.yoctoproject.org>
X-Mailer: mail (GNU Mailutils 3.7)
Message-Id: <20211212150214.67E0C962CA0@nuc.router0800d9.com>
Date: Sun, 12 Dec 2021 05:02:14 -1000 (HST)
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Sun, 12 Dec 2021 15:02:18 -0000
X-Groupsio-URL: 
 https://lists.openembedded.org/g/openembedded-core/message/159586

Branch: hardknott

New this week: 1 CVEs
CVE-2021-4069: vim https://web.nvd.nist.gov/view/vuln/detail?vulnId=CVE-2021-4069 *

Removed this week: 0 CVEs

Full list:  Found 53 unpatched CVEs
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
CVE-2021-4069: vim https://web.nvd.nist.gov/view/vuln/detail?vulnId=CVE-2021-4069 *
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

