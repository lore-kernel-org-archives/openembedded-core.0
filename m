Return-Path: <steve@sakoman.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 41FBBC433F5
	for <webhook@archiver.kernel.org>; Sun, 26 Dec 2021 15:02:40 +0000 (UTC)
Received: from mail-pf1-f176.google.com (mail-pf1-f176.google.com
 [209.85.210.176])
 by mx.groups.io with SMTP id smtpd.web12.17023.1640530959733441241
 for <openembedded-core@lists.openembedded.org>;
 Sun, 26 Dec 2021 07:02:39 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@sakoman-com.20210112.gappssmtp.com header.s=20210112
 header.b=OI3af9JE;
 spf=softfail (domain: sakoman.com, ip: 209.85.210.176,
 mailfrom: steve@sakoman.com)
Received: by mail-pf1-f176.google.com with SMTP id q3so7364296pfs.7
        for <openembedded-core@lists.openembedded.org>;
 Sun, 26 Dec 2021 07:02:39 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=sakoman-com.20210112.gappssmtp.com; s=20210112;
        h=subject:from:to:message-id:date;
        bh=xxA++ValbwP93wSl7Z+TF3K8k+bys2x91dfiy0tdct4=;
        b=OI3af9JEOT/wZaEIdbg9p035CnF4gHOmdtxvxincJPrGOCv1wZbdAOBu72Ont+hTwo
         r3KIGKNHqMChu/RzdcPmrTAgTA04Xid8Jm1IS1RXfNKgvZO/KCbL1976aURcLZGLTVkP
         nbkQr0fivwsR3esbXfRWIX8Ih9KmAFdAGv2WqLXjAKnrpXbs4DeU6GUbWCW8oQXD/Rd/
         gViequthUppMyPkk2OnO1LP7GnpNwM8+Knx/RrfNuWU2jPIhkIn4uujl5jTGzZiafznk
         51J94cXWyom+fvO/IsTWkn/xzVj0YUbOQQamvtGApy1emrSCuQuHKir28F8ppLTr8Gj3
         +vdA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:subject:from:to:message-id:date;
        bh=xxA++ValbwP93wSl7Z+TF3K8k+bys2x91dfiy0tdct4=;
        b=2/4A7lWm6LJY5ddg3IdoVJxdN/Mv0WEUdBYsixHWnDEoVv7nxMMOfRx2qA/HD1JoTS
         DnTOPxzxhedQBalyOwJUuWJwnULfy7AkURUQmUNtlNyNWtH5O9WVib2z5OQ8Y4mKepzo
         w7NCHI8Am8kO7Zf61S9ho7V2u4rDqz9PXCNIjO4UOWzz3RLuJKyBqakKNqOsrhY/dFkb
         iAdhYkkZT0sPtM1Jdhxwswi8CONpq+VLipw6kSRwGGVU/OqO+vaTF2yyOq+56Dk9L00o
         3VLXRMyVXFLcH6NHj6tqi2/k0+U1s37PwuHShX5V3ggHcrlvAtp5qFS+delumjx84EcL
         y7fw==
X-Gm-Message-State: AOAM532QGNdJ+d18hOr9VbYDSPKC+ruRgWbsMZq9d3DOHQUSvKylLrkI
	DErFpohTUsLIIOxjLV0FksFlkhM0iwbcHhAF
X-Google-Smtp-Source: 
 ABdhPJwBgOhrbWMr441PW0WjmtYaI1lnYJE8Fe0IlYN66mugYsTRyR59SEj3yvXawF43vWClrLEtMw==
X-Received: by 2002:a63:8441:: with SMTP id
 k62mr12546629pgd.152.1640530958643;
        Sun, 26 Dec 2021 07:02:38 -0800 (PST)
Received: from nuc.router0800d9.com ([172.243.4.16])
        by smtp.gmail.com with ESMTPSA id
 h22sm9854018pfv.1.2021.12.26.07.02.36
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 26 Dec 2021 07:02:37 -0800 (PST)
Received: by nuc.router0800d9.com (Postfix, from userid 1000)
	id D955B960468; Sun, 26 Dec 2021 05:02:28 -1000 (HST)
Subject: OE-core CVE metrics for hardknott on Sun 26 Dec 2021 05:00:01 AM HST
FROM: steve@sakoman.com
To: 
 <openembedded-core@lists.openembedded.org>,<yocto-security@lists.yoctoproject.org>
X-Mailer: mail (GNU Mailutils 3.7)
Message-Id: <20211226150228.D955B960468@nuc.router0800d9.com>
Date: Sun, 26 Dec 2021 05:02:28 -1000 (HST)
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Sun, 26 Dec 2021 15:02:40 -0000
X-Groupsio-URL: 
 https://lists.openembedded.org/g/openembedded-core/message/160014

Branch: hardknott

New this week: 1 CVEs
CVE-2021-45078: binutils:binutils-cross-testsuite:binutils-cross-x86_64:binutils-native https://web.nvd.nist.gov/view/vuln/detail?vulnId=CVE-2021-45078 *

Removed this week: 0 CVEs

Full list:  Found 57 unpatched CVEs
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
CVE-2021-45078: binutils:binutils-cross-testsuite:binutils-cross-x86_64:binutils-native https://web.nvd.nist.gov/view/vuln/detail?vulnId=CVE-2021-45078 *
CVE-2021-45085: epiphany https://web.nvd.nist.gov/view/vuln/detail?vulnId=CVE-2021-45085 *
CVE-2021-45086: epiphany https://web.nvd.nist.gov/view/vuln/detail?vulnId=CVE-2021-45086 *
CVE-2021-45087: epiphany https://web.nvd.nist.gov/view/vuln/detail?vulnId=CVE-2021-45087 *
CVE-2021-45088: epiphany https://web.nvd.nist.gov/view/vuln/detail?vulnId=CVE-2021-45088 *

